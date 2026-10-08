/-
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/ArithmeticKTheory--N.3.md. These statements suggest
Lean forms so contributors and reviewers can converge on names and signatures.
All seven retained node declarations, eight construction API entries and five
named arithmetic tests below are typed; their proofs remain placeholders.
Implementation status stays unchecked.

Revision BP-ArithmeticKTheory--N.3~2, Codex codex-FkacRs, 2026-10-08.
Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The Supplier namespace is a local prototype of the EXISTING owning interfaces:
KTheoryLowDegrees:Z.1/projective-karoubi; GeneralAlgebraicKTheory K.1's
Q-construction, small-model transport and homotopy K-groups; K.2:plus scalar
extension; K.3 transfer; the parent N.3 rank filtration; and N.1's arithmetic
ring maps. It adds no roadmap nodes for those constructions. Small objects are
idempotent matrices, Q arrows are split-epi/split-mono spans modulo middle-module
isomorphism, and composition uses the actual module pullback. The K carrier is
the pinned cubical homotopy-group quotient of its geometric realization based
at the zero vertex, rather than an opaque type or an assumed arithmetic answer.
Scalar extension is entrywise matrix extension and tensoring maps. Transfer is
restriction of the underlying projective module, with its zero-object path.
Supplier existence/comparison proofs, laws, and arithmetic proofs use sorry.

QH uses the native integral simplicial homology of the Q nerve. Its natural
identification with singular H_i(BQ;Z) imports
StableHomotopyKTheory:H.1/homology-of-small-categories. No signed relative
homology is encoded by truncated subtraction. Supplier.K R d means K_{d+1}(R);
N.3 comparison/defect parameters d represent degree d+2. Degree-one examples
use d=0 in Supplier.K, degree-two examples d=1, degree-five examples d=4.
K_0 is outside these new signatures and remains the parent/owner's carrier.
The generic connected H-space finite-type theorem remains an ownership gap.

Imports are Mathlib only, at its exact pin. Tau Ceti statements, including
HomotopyGroup.mapHom, were inspected at their exact source pin; its compiled
module is absent from the shared build. piMap fixes the same quotient action
without importing another Tau Ceti revision. Replace local supplier helpers by
owner imports when implemented, preserving every displayed carrier/map and the
arithmetic theorems' meaning. Compilation checks signatures, not these proofs.
-/
import Mathlib.AlgebraicTopology.SimplicialSet.Nerve
import Mathlib.AlgebraicTopology.SimplicialSet.Homology.Basic
import Mathlib.AlgebraicTopology.SingularSet
import Mathlib.Topology.Homotopy.HomotopyGroup
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Colimits
import Mathlib.Data.ZMod.Basic
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem

set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u
namespace ArithmeticKTheory.Supplier

/-- Small idempotent presentation of a finite projective module. -/
structure Projective (R : Type u) [CommRing R] where
  size : ℕ
  matrix : Matrix (Fin size) (Fin size) R
  idempotent : matrix * matrix = matrix

variable {R : Type u} [CommRing R]
abbrev Projective.module (P : Projective R) := LinearMap.range (Matrix.toLin' P.matrix)
instance (P : Projective R) : Module.Finite R P.module := by sorry
instance (P : Projective R) : Module.Projective R P.module := by sorry

def zeroProjective (R : Type u) [CommRing R] : Projective R :=
  ⟨0, 0, by simp⟩

/-- A representative X ← M → Y with split epi on the left and split mono on the right. -/
structure Span (X Y : Projective R) where
  middle : Projective R
  epi : middle.module →ₗ[R] X.module
  mono : middle.module →ₗ[R] Y.module
  epi_split : ∃ s : X.module →ₗ[R] middle.module, epi.comp s = LinearMap.id
  mono_split : ∃ r : Y.module →ₗ[R] middle.module, r.comp mono = LinearMap.id

def spanSetoid (X Y : Projective R) : Setoid (Span X Y) where
  r s t := ∃ e : s.middle.module ≃ₗ[R] t.middle.module,
    t.epi.comp e.toLinearMap = s.epi ∧ t.mono.comp e.toLinearMap = s.mono
  iseqv := by sorry

def spanIdentity (X : Projective R) : Span X X :=
  ⟨X, LinearMap.id, LinearMap.id, ⟨LinearMap.id, by ext; rfl⟩,
    ⟨LinearMap.id, by ext; rfl⟩⟩

/-- Small presentation of a specified finite projective module, Z.1's
idempotent-matrix model. The isomorphism prevents changing its carrier. -/
structure Presentation (R : Type u) [CommRing R] (M : Type u)
    [AddCommGroup M] [Module R M] where
  object : Projective R
  equiv : object.module ≃ₗ[R] M

def present (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] : Presentation R M := by sorry


/-- The actual module pullback of the mono in s and the epi in t. -/
def spanPullback {X Y Z : Projective R} (s : Span X Y) (t : Span Y Z) :
    Submodule R (s.middle.module × t.middle.module) where
  carrier := {p | s.mono p.1 = t.epi p.2}
  zero_mem' := by simp
  add_mem' := by
    intros a b ha hb
    change s.mono (a.1 + b.1) = t.epi (a.2 + b.2)
    rw [map_add, map_add]
    exact congrArg₂ (· + ·) ha hb
  smul_mem' := by
    intros a p hp
    change s.mono (a • p.1) = t.epi (a • p.2)
    rw [map_smul, map_smul]
    exact congrArg (fun z => a • z) hp

instance {X Y Z : Projective R} (s : Span X Y) (t : Span Y Z) :
    Module.Finite R (spanPullback s t) := by sorry
instance {X Y Z : Projective R} (s : Span X Y) (t : Span Y Z) :
    Module.Projective R (spanPullback s t) := by sorry

def pullbackFst {X Y Z : Projective R} (s : Span X Y) (t : Span Y Z) :
    spanPullback s t →ₗ[R] s.middle.module :=
  (LinearMap.fst R _ _).comp (spanPullback s t).subtype

def pullbackSnd {X Y Z : Projective R} (s : Span X Y) (t : Span Y Z) :
    spanPullback s t →ₗ[R] t.middle.module :=
  (LinearMap.snd R _ _).comp (spanPullback s t).subtype

def spanCompose {X Y Z : Projective R} (s : Span X Y) (t : Span Y Z) : Span X Z where
  middle := (present R (spanPullback s t)).object
  epi := s.epi.comp ((pullbackFst s t).comp (present R (spanPullback s t)).equiv.toLinearMap)
  mono := t.mono.comp ((pullbackSnd s t).comp (present R (spanPullback s t)).equiv.toLinearMap)
  epi_split := by sorry
  mono_split := by sorry

instance : Category (Projective R) where
  Hom X Y := Quotient (spanSetoid X Y)
  id X := Quotient.mk _ (spanIdentity X)
  comp s t := Quotient.liftOn₂ s t (fun a b => Quotient.mk _ (spanCompose a b)) (by sorry)
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

abbrev qSpace (R : Type u) [CommRing R] := SSet.toTop.obj (nerve (Projective R))
-- The zero vertex under geometric realization, never an arbitrary chosen point.
def zeroPoint (R : Type u) [CommRing R] : qSpace R :=
  ((TopCat.toSSetObjEquiv (qSpace R) (Opposite.op (SimplexCategory.mk 0)))
    (((sSetTopAdj.unit.app (nerve (Projective R))).app _)
      (ComposableArrows.mk₀ (zeroProjective R))))
    (Convexity.StdSimplex.single (0 : Fin 1))

-- Positive K_n uses π_(n+1); the Fin (n+2) form avoids a commutativity
-- instance at π_1, which is not needed by this part.
abbrev K (R : Type u) [CommRing R] (d : ℕ) :=
  Additive (HomotopyGroup (Fin (d + 2)) (qSpace R) (zeroPoint R))
abbrev rationalK (R : Type u) [CommRing R] (d : ℕ) := ℚ ⊗[ℤ] K R d

def objectRank [IsDomain R] (P : Projective R) : ℕ :=
  Module.finrank (FractionRing R) ((FractionRing R) ⊗[R] P.module)

abbrev rankQ (R : Type u) [CommRing R] [IsDomain R] (m : ℕ) :=
  ObjectProperty.FullSubcategory (fun P : Projective R => objectRank P ≤ m)

def rankInclusion [IsDomain R] (m : ℕ) : rankQ R m ⥤ Projective R :=
  ObjectProperty.ι _

def rankStep [IsDomain R] (m : ℕ) : rankQ R m ⥤ rankQ R (m+1) where
  obj P := ⟨P.obj, Nat.le_trans P.property (Nat.le_succ m)⟩
  map f := ObjectProperty.homMk f.hom

abbrev integralCoefficients : ModuleCat.{u} ℤ := ModuleCat.of ℤ (ULift.{u} ℤ)

def qHomologyFunctor (i : ℕ) : SSet.{u} ⥤ ModuleCat.{u} ℤ :=
  SSet.homologyFunctor integralCoefficients.{u} i

abbrev QH (R : Type u) [CommRing R] [IsDomain R] (m i : ℕ) :=
  (qHomologyFunctor.{u} i).obj (nerve (rankQ R m))
abbrev QHStable (R : Type u) [CommRing R] (i : ℕ) :=
  (qHomologyFunctor.{u} i).obj (nerve (Projective R))

def homologyInclusion [IsDomain R] (m i : ℕ) : QH R m i →ₗ[ℤ] QHStable R i :=
  ((qHomologyFunctor.{u} i).map (nerveMap (rankInclusion (R := R) m))).hom

def homologyStep [IsDomain R] (m i : ℕ) : QH R m i →ₗ[ℤ] QH R (m+1) i :=
  ((qHomologyFunctor.{u} i).map (nerveMap (rankStep (R := R) m))).hom
end ArithmeticKTheory.Supplier

/- Supplier prototypes, not new N.3 nodes. K.1 and K.2:plus own these
constructions. The displayed carriers and forward maps are fixed; only their
existence, functor laws and comparison proofs are placeholders. -/
namespace ArithmeticKTheory.Supplier
variable {R S : Type u} [CommRing R] [CommRing S]

/-- Entrywise scalar extension, independent of any basis choice on the image. -/
def baseChange (f : R →+* S) (P : Projective R) : Projective S :=
  ⟨P.size, P.matrix.map f, by sorry⟩

def baseChangeModuleEquiv (f : R →+* S) (P : Projective R) :
    letI := f.toAlgebra
    (baseChange f P).module ≃ₗ[S] S ⊗[R] P.module := by sorry

def baseChangeLinearMap (f : R →+* S) {X Y : Projective R}
    (l : X.module →ₗ[R] Y.module) :
    (baseChange f X).module →ₗ[S] (baseChange f Y).module := by
  letI := f.toAlgebra
  exact (baseChangeModuleEquiv f Y).symm.toLinearMap.comp
    ((l.baseChange S).comp (baseChangeModuleEquiv f X).toLinearMap)

def baseChangeSpan (f : R →+* S) {X Y : Projective R} (s : Span X Y) :
    Span (baseChange f X) (baseChange f Y) where
  middle := baseChange f s.middle
  epi := baseChangeLinearMap f s.epi
  mono := baseChangeLinearMap f s.mono
  epi_split := by sorry
  mono_split := by sorry

def baseChangeQ (f : R →+* S) : Projective R ⥤ Projective S where
  obj := baseChange f
  map := Quotient.map (baseChangeSpan f) (by sorry)
  map_id := by sorry
  map_comp := by sorry

/-- The genuine map of geometric realizations of Q nerves. -/
def qMap (f : R →+* S) : C(qSpace R, qSpace S) :=
  (SSet.toTop.map (nerveMap (baseChangeQ f))).hom

theorem qMap_zero (f : R →+* S) : qMap f (zeroPoint R) = zeroPoint S := by sorry

/-- Postcompose cube loops with the specified based continuous map. -/
def loopMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    {x : X} {y : Y} (f : C(X, Y)) (hf : f x = y) (d : ℕ)
    (p : GenLoop (Fin (d + 2)) X x) : GenLoop (Fin (d + 2)) Y y :=
  ⟨f.comp p.val, by intro z hz; change f (p z) = y; exact (congrArg f (p.property z hz)).trans hf⟩

-- Mathlib-only specialization of the pinned Tau Ceti HomotopyGroup.mapHom.
-- Its quotient action is fixed here; when that compiled module is available,
-- replace this helper by the native mapHom with Additive/int-linear transport.
def piMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    {x : X} {y : Y} (f : C(X, Y)) (hf : f x = y) (d : ℕ) :
    Additive (HomotopyGroup (Fin (d + 2)) X x) →+
      Additive (HomotopyGroup (Fin (d + 2)) Y y) where
  toFun := Quotient.map (loopMap f hf d) (by sorry)
  map_zero' := by sorry
  map_add' := by sorry

/-- K_{d+1}, induced by scalar extension; no arbitrary homomorphism input. -/
def kMap (f : R →+* S) (d : ℕ) : K R d →ₗ[ℤ] K S d :=
  (piMap (qMap f) (qMap_zero f) d).toIntLinearMap

def rationalMap (f : R →+* S) (d : ℕ) : rationalK R d →ₗ[ℚ] rationalK S d :=
  TensorProduct.AlgebraTensorModule.lTensor ℚ ℚ (kMap f d)

/-- Restriction of scalars is available only for finite projective extensions.
Its presentation is of the underlying R-module, not its K_0 norm. -/
def restrictProjective [Algebra R S] [Module.Finite R S] [Module.Projective R S]
    (P : Projective S) : Presentation R P.module := by sorry

def restrictSpan [Algebra R S] [Module.Finite R S] [Module.Projective R S]
    {X Y : Projective S} (s : Span X Y) :
    Span (restrictProjective (R := R) X).object (restrictProjective (R := R) Y).object where
  middle := (restrictProjective (R := R) s.middle).object
  epi := (restrictProjective (R := R) X).equiv.symm.toLinearMap.comp
    ((s.epi.restrictScalars R).comp (restrictProjective (R := R) s.middle).equiv.toLinearMap)
  mono := (restrictProjective (R := R) Y).equiv.symm.toLinearMap.comp
    ((s.mono.restrictScalars R).comp (restrictProjective (R := R) s.middle).equiv.toLinearMap)
  epi_split := by sorry
  mono_split := by sorry

def transferQ [Algebra R S] [Module.Finite R S] [Module.Projective R S] :
    Projective S ⥤ Projective R where
  obj P := (restrictProjective (R := R) P).object
  map := Quotient.map (restrictSpan (R := R)) (by sorry)
  map_id := by sorry
  map_comp := by sorry

/- A presentation of the zero restricted module can be a nonliteral zero
idempotent. Transport the base point by the path supplied by its module
isomorphism to zero. K.1's small-model/transport node owns this step. -/
def changePoint {X : Type u} [TopologicalSpace X] {x y : X}
    (p : Path x y) (d : ℕ) :
    Additive (HomotopyGroup (Fin (d + 2)) X x) ≃+
      Additive (HomotopyGroup (Fin (d + 2)) X y) := by sorry

def transferZeroPath [Algebra R S] [Module.Finite R S] [Module.Projective R S] :
    Path ((SSet.toTop.map (nerveMap (transferQ (R := R) (S := S)))).hom (zeroPoint S))
      (zeroPoint R) := by sorry

def transferMap [Algebra R S] [Module.Finite R S] [Module.Projective R S]
    (d : ℕ) : K S d →ₗ[ℤ] K R d :=
  ((changePoint (transferZeroPath (R := R) (S := S)) d).toAddMonoidHom.comp
    (piMap (SSet.toTop.map (nerveMap (transferQ (R := R) (S := S)))).hom rfl d)).toIntLinearMap

def rationalTransfer [Algebra R S] [Module.Finite R S] [Module.Projective R S]
    (d : ℕ) : rationalK S d →ₗ[ℚ] rationalK R d :=
  TensorProduct.AlgebraTensorModule.lTensor ℚ ℚ (transferMap d)
end ArithmeticKTheory.Supplier

namespace ArithmeticKTheory
open Supplier
variable (F : Type u) [Field F] [NumberField F]
abbrev Primes := IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)
abbrev Integers (S : Set (Primes F)) := S.integer F
variable (S T : Set (Primes F))

/-- N.1's canonical inclusion, using the native subalgebra. -/
def integerInclusion (hST : S ⊆ T) : Integers F S →+* Integers F T where
  toFun x := ⟨x.val, fun v hv => x.property v (fun hs => hv (hST hs))⟩
  map_one' := by rfl
  map_zero' := by rfl
  map_add' _ _ := by rfl
  map_mul' _ _ := by rfl

def fromIntegers : NumberField.RingOfIntegers F →+* Integers F S :=
  algebraMap (NumberField.RingOfIntegers F) (Integers F S)

def toField : Integers F S →+* F := (S.integer F).val.toRingHom

def loc (d : ℕ) := rationalMap (fromIntegers F S) d
def locST (hST : S ⊆ T) (d : ℕ) := rationalMap (integerInclusion F S T hST) d
def fieldMap (d : ℕ) := rationalMap (toField F S) d

/- K R d below means K_{d+1}(R). Hence the parameter d in N.3's
comparison and defect declarations represents degree d+2 (all n >= 2).
The degree-one non-example uses K R 0; no missing K_0 interface is faked. -/

-- ArithmeticKTheory:N.3/finite-rank-Q-homology
theorem finite_rankQHomology (m i : ℕ) :
    Module.Finite ℤ (QH (NumberField.RingOfIntegers F) m i) := by sorry

-- ArithmeticKTheory:N.3/rank-filtration-homology-stability
theorem rankQHomology_stable (A : Type u) [CommRing A] [IsDedekindDomain A]
    (m i : ℕ) :
    (i ≤ m → Function.Surjective (homologyInclusion (R := A) m i)) ∧
    (i + 1 ≤ m → Function.Bijective (homologyInclusion (R := A) m i)) ∧
    (i ≤ m → Function.Surjective (homologyStep (R := A) m i)) ∧
    (i + 1 ≤ m → Function.Bijective (homologyStep (R := A) m i)) := by sorry

-- ArithmeticKTheory:N.3/stable-Q-homology-finite-type
theorem finite_QHomology (i : ℕ) :
    Module.Finite ℤ (QHStable (NumberField.RingOfIntegers F) i) ∧
    Function.Bijective (homologyInclusion (R := NumberField.RingOfIntegers F) (i+1) i) := by
  sorry

-- ArithmeticKTheory:N.3/finite-S-localisation-defect
theorem finite_localisation_defect [Finite S] [Finite T] (hST : S ⊆ T) (d : ℕ) :
    Finite (LinearMap.ker (kMap (integerInclusion F S T hST) (d+1))) ∧
    Finite (K (Integers F T) (d+1) ⧸
      LinearMap.range (kMap (integerInclusion F S T hST) (d+1))) ∧
    (Even (d+2) → Function.Injective (kMap (integerInclusion F S T hST) (d+1))) := by
  sorry

-- ArithmeticKTheory:N.3/canonical-rational-S-integer-equivalence
noncomputable def rationalSIntegerEquiv [Finite S] (d : ℕ) :
    rationalK (NumberField.RingOfIntegers F) (d+1) ≃ₗ[ℚ]
      rationalK (Integers F S) (d+1) :=
  LinearEquiv.ofBijective (loc F S (d+1)) (by sorry)

-- ArithmeticKTheory:N.3/canonical-rational-equivalence-map
theorem rationalSIntegerEquiv_toLinearMap [Finite S] (d : ℕ) :
    (rationalSIntegerEquiv F S d).toLinearMap = loc F S (d+1) := by sorry

-- API 1 is the constructor above; the other seven items follow.
theorem rationalSIntegerEquiv_apply [Finite S] (d : ℕ)
    (x : rationalK (NumberField.RingOfIntegers F) (d+1)) :
    rationalSIntegerEquiv F S d x = loc F S (d+1) x := by sorry
theorem rationalSIntegerEquiv_symm_apply_apply [Finite S] (d : ℕ)
    (x : rationalK (NumberField.RingOfIntegers F) (d+1)) :
    (rationalSIntegerEquiv F S d).symm (rationalSIntegerEquiv F S d x) = x := by sorry
theorem rationalSIntegerEquiv_apply_symm_apply [Finite S] (d : ℕ)
    (y : rationalK (Integers F S) (d+1)) :
    rationalSIntegerEquiv F S d ((rationalSIntegerEquiv F S d).symm y) = y := by sorry
theorem rationalSIntegerEquiv_unique [Finite S] (d : ℕ)
    (e : rationalK (NumberField.RingOfIntegers F) (d+1) ≃ₗ[ℚ]
      rationalK (Integers F S) (d+1)) (he : e.toLinearMap = loc F S (d+1)) :
    e = rationalSIntegerEquiv F S d := by sorry

/-- N.1's empty-S ring comparison, inverse of the specified base inclusion. -/
def emptyIntegersEquiv : Integers F ∅ ≃+* NumberField.RingOfIntegers F :=
  (RingEquiv.ofBijective (fromIntegers F ∅) (by sorry)).symm

/-- K.1/K.2's functorial transport along that ring equivalence. -/
def emptySComparison (d : ℕ) : rationalK (Integers F ∅) d ≃ₗ[ℚ]
    rationalK (NumberField.RingOfIntegers F) d :=
  LinearEquiv.ofBijective (rationalMap (emptyIntegersEquiv F).toRingHom d) (by sorry)

theorem rationalSIntegerEquiv_empty (d : ℕ) :
    (rationalSIntegerEquiv F ∅ d).trans (emptySComparison F (d+1)) =
      LinearEquiv.refl ℚ _ := by sorry
theorem rationalSIntegerEquiv_enlarge [Finite S] [Finite T] (hST : S ⊆ T) (d : ℕ) :
    (locST F S T hST (d+1)).comp (rationalSIntegerEquiv F S d).toLinearMap =
      (rationalSIntegerEquiv F T d).toLinearMap := by sorry
theorem rationalSIntegerEquiv_toField [Finite S] (d : ℕ) :
    (fieldMap F S (d+1)).comp (rationalSIntegerEquiv F S d).toLinearMap =
      rationalMap (algebraMap (NumberField.RingOfIntegers F) F) (d+1) := by sorry

-- The concrete prime (p), transported to the native ring of integers of ℚ.
def rationalPrime (p : ℕ) (hp : p.Prime) : Primes ℚ :=
  ⟨Ideal.span {(p : NumberField.RingOfIntegers ℚ)}, by sorry, by sorry⟩

section Tests
-- ArithmeticKTheory.test_rationalSIntegerEquiv_empty (degree d+2).
example (d : ℕ) :
    (rationalSIntegerEquiv F ∅ d).trans (emptySComparison F (d+1)) =
      LinearEquiv.refl ℚ _ := by sorry

-- ArithmeticKTheory.test_rationalSIntegerEquiv_enlarge: degree five, nonzero rank one.
example (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    let P := rationalPrime p hp
    let Q := rationalPrime q hq
    Module.finrank ℚ (rationalK (Integers ℚ {P}) 4) = 1 ∧
    Module.finrank ℚ (rationalK (Integers ℚ {P,Q}) 4) = 1 ∧
    (locST ℚ {P} {P,Q} (by sorry) 4).comp (rationalSIntegerEquiv ℚ {P} 3).toLinearMap =
      (rationalSIntegerEquiv ℚ {P,Q} 3).toLinearMap := by sorry

-- ArithmeticKTheory.test_rationalSIntegerEquiv_degree_one.
-- The zero source and one-dimensional target make the failure discriminating.
example (p : ℕ) (hp : p.Prime) :
    Subsingleton (rationalK (NumberField.RingOfIntegers ℚ) 0) ∧
    Module.finrank ℚ (rationalK (Integers ℚ {rationalPrime p hp}) 0) = 1 ∧
    ¬ Function.Bijective (loc ℚ {rationalPrime p hp} 0) := by sorry

-- ArithmeticKTheory.test_rationalSIntegerEquiv_prescribed_map: degree five.
example :
    Module.finrank ℚ (rationalK (NumberField.RingOfIntegers ℚ) 4) = 1 ∧
    (2 : ℚ) • (rationalSIntegerEquiv ℚ ∅ 3).toLinearMap ≠
      (rationalSIntegerEquiv ℚ ∅ 3).toLinearMap := by sorry

-- ArithmeticKTheory.test_rationalSIntegerEquiv_even: degree two.
-- Integral K₂(ℤ) ≃ ℤ/2 is a separate imported supplier computation.
example (S : Set (Primes ℚ)) [Finite S] :
    Subsingleton (rationalK (NumberField.RingOfIntegers ℚ) 1) ∧
    Subsingleton (rationalK (Integers ℚ S) 1) ∧
    Nonempty (K (NumberField.RingOfIntegers ℚ) 1 ≃+ ZMod 2) := by sorry
end Tests

section ExtensionTransfer
variable (E : Type u) [Field E] [NumberField E] [Algebra F E]
  [FiniteDimensional F E] (T : Set (Primes E))

/-- T is precisely the inverse image of S under contraction of prime ideals. -/
def ExactlyAbove : Prop :=
  ∀ v : Primes E, v ∈ T ↔ ∃ w : Primes F, w ∈ S ∧
    v.asIdeal.comap (algebraMap (NumberField.RingOfIntegers F)
      (NumberField.RingOfIntegers E)) = w.asIdeal

/-- N.1's map is restriction of the given field embedding, not a new choice. -/
def extensionIntegers (hT : ExactlyAbove F S E T) : Integers F S →+* Integers E T where
  toFun x := ⟨algebraMap F E x.val, by sorry⟩
  map_one' := by ext; simp
  map_zero' := by ext; simp
  map_add' x y := by ext; simp
  map_mul' x y := by ext; simp

-- N.1/S-integers-in-a-finite-extension owns these genuine instance proofs.
instance integersFinite : Module.Finite (NumberField.RingOfIntegers F)
    (NumberField.RingOfIntegers E) := by sorry
instance integersProjective : Module.Projective (NumberField.RingOfIntegers F)
    (NumberField.RingOfIntegers E) := by sorry

abbrev extensionAlgebra (hT : ExactlyAbove F S E T) :
    Algebra (Integers F S) (Integers E T) := (extensionIntegers F S E T hT).toAlgebra

theorem localizedFinite (hT : ExactlyAbove F S E T) :
    letI := extensionAlgebra F S E T hT
    Module.Finite (Integers F S) (Integers E T) := by sorry

theorem localizedProjective (hT : ExactlyAbove F S E T) :
    letI := extensionAlgebra F S E T hT
    Module.Projective (Integers F S) (Integers E T) := by sorry

-- ArithmeticKTheory:N.3/rational-localisation-extension-transfer
theorem rationalSIntegerEquiv_extension_transfer [Finite S] [Finite T]
    (hT : ExactlyAbove F S E T) (d : ℕ) :
    letI := extensionAlgebra F S E T hT
    letI := localizedFinite F S E T hT
    letI := localizedProjective F S E T hT
    (rationalSIntegerEquiv E T d).toLinearMap.comp
      (rationalMap (algebraMap (NumberField.RingOfIntegers F)
        (NumberField.RingOfIntegers E)) (d+1)) =
      (rationalMap (extensionIntegers F S E T hT) (d+1)).comp
        (rationalSIntegerEquiv F S d).toLinearMap ∧
    (rationalSIntegerEquiv F S d).toLinearMap.comp
      (rationalTransfer (R := NumberField.RingOfIntegers F)
        (S := NumberField.RingOfIntegers E) (d+1)) =
      (rationalTransfer (R := Integers F S) (S := Integers E T) (d+1)).comp
        (rationalSIntegerEquiv E T d).toLinearMap := by sorry
end ExtensionTransfer
end ArithmeticKTheory
