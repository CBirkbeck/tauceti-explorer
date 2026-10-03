import Mathlib.Topology.Instances.AddCircle.Defs
import TauCeti.Algebra.AddCircle
import Mathlib.RingTheory.Bialgebra.Convolution
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import Mathlib.Algebra.Colimit.DirectLimit
import Mathlib.RingTheory.Flat.FaithfullyFlat.Algebra
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.Nat.GCD.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Data.Nat.ModEq
import Mathlib.Data.Finset.Prod
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Algebra.Field.ZMod
/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so that contributors and
reviewers converge on names and signatures. No implementation is claimed.

The native fragment uses the pinned invertible-sheaf and quotient-ring types.
The omission ledger below records signatures needing actual geometric types
from other roadmap owners. It does not replace them with assumed predicates.
The complete file was not compiled: required Tau Ceti compiled modules are unavailable.
The finite action-comparison fragment was checked against pinned Mathlib with
its native character generator expanded. The suggested bodies are admitted
under PROTOCOL §13; separate proof-prototype evidence is recorded in the handoff;
this does not certify the complete file or any implementation.
-/

import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import Mathlib.Algebra.Group.Fin.Basic
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Free
import Mathlib.CategoryTheory.Core
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.RootsOfUnity.Basic
import TauCeti.Algebra.AlgebraicGroup.RootsOfUnity.Basic
import Mathlib.RingTheory.HopfAlgebra.MonoidAlgebra
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.Polynomial.Degree.Operations
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.FieldTheory.Minpoly.Finite
import Mathlib.RingTheory.Polynomial.Eisenstein.Criterion
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.CategoryTheory.CofilteredSystem
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.LinearAlgebra.Isomorphisms
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

open CategoryTheory AlgebraicGeometry

noncomputable section
universe u

namespace TauCeti.RootStack

variable {X : Scheme.{u}}

-- A section is the native value of the module presheaf on the top open.
abbrev Section (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :=
  Γ(L.obj, (⊤ : X.Opens))

abbrev mapSection {L M : TauCeti.AlgebraicGeometry.InvertibleSheaf X}
    (e : L ≅ M) (s : Section L) : Section M :=
  e.hom.hom.app (⊤ : X.Opens) s

def tensorPower (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    ℕ → TauCeti.AlgebraicGeometry.InvertibleSheaf X
  | 0 => TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X
  | n + 1 => TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct (tensorPower M n) M

lemma tensorPower.zero (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    tensorPower M 0 = TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X := by
  sorry

lemma tensorPower.succ (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (n : ℕ) :
    tensorPower M (n + 1) =
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct (tensorPower M n) M := by
  sorry

def tensorPower.mapIso {M N : TauCeti.AlgebraicGeometry.InvertibleSheaf X}
    (n : ℕ) (e : M ≅ N) : tensorPower M n ≅ tensorPower N n := by
  sorry

-- tensorPower.test_zero
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    tensorPower M 0 = TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X := by
  sorry

-- tensorPower.test_one
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    Nonempty (tensorPower M 1 ≅ M) := by
  sorry

-- tensorPower.test_two
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    Nonempty (tensorPower M 2 ≅
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct M M) := by
  sorry

-- A root-power step; its construction uses JAC-A's section tensor map.
-- This is not an alternative definition of the native tensor product.
def sectionPower.tensorStep (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (n : ℕ) (t : Section M) (v : Section (tensorPower M n)) :
    Section (tensorPower M (n + 1)) := by
  sorry

def sectionPower (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (n : ℕ) (t : Section M) : Section (tensorPower M n) := by
  sorry

lemma sectionPower.zero (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (t : Section M) :
    sectionPower M 0 t =
      (SheafOfModules.freeSection (R := X.ringCatSheaf) PUnit.unit).val
        (Opposite.op (⊤ : X.Opens)) := by
  sorry

lemma sectionPower.succ (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (n : ℕ) (t : Section M) :
    sectionPower M (n + 1) t = sectionPower.tensorStep M n t (sectionPower M n t) := by
  sorry

lemma sectionPower.mapIso {M N : TauCeti.AlgebraicGeometry.InvertibleSheaf X}
    (n : ℕ) (e : M ≅ N) (t : Section M) :
    mapSection (tensorPower.mapIso n e) (sectionPower M n t) =
      sectionPower N n (mapSection e t) := by
  sorry

-- sectionPower.test_zero
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    sectionPower M 0 0 =
      (SheafOfModules.freeSection (R := X.ringCatSheaf) PUnit.unit).val
        (Opposite.op (⊤ : X.Opens)) := by
  sorry

-- sectionPower.test_one
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (t : Section M) :
    mapSection (TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialLeftIso M)
      (sectionPower M 1 t) = t := by
  sorry

-- sectionPower.test_zero_positive
example (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (n : ℕ) [NeZero n] :
    sectionPower M n 0 = 0 := by
  sorry

structure RootObject (n : ℕ) [NeZero n]
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (s : Section L) where
  line : TauCeti.AlgebraicGeometry.InvertibleSheaf X
  rootSection : Section line
  powerIso : tensorPower line n ≅ L
  section_eq : mapSection powerIso (sectionPower line n rootSection) = s

-- The equality fields are the defining equations of root data, not theorem
-- conclusions used as assumptions. All line and section types are native.
structure RootObject.iso {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a b : RootObject n L s) where
  lineIso : a.line ≅ b.line
  section_eq : mapSection lineIso a.rootSection = b.rootSection
  power_eq : tensorPower.mapIso n lineIso ≪≫ b.powerIso = a.powerIso

def RootObject.canonicalOne (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (s : Section L) : RootObject 1 L s := by
  sorry

-- RootObject.mk and RootObject.line are the structure constructor/projection.
-- RootObject.test_one
example (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (s : Section L)
    (a : RootObject 1 L s) :
    ∃! e : RootObject.iso a (RootObject.canonicalOne L s), True := by
  sorry

-- RootObject.test_zero
example (n : ℕ) [NeZero n] :
    ∃ a : RootObject n (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) 0,
      a.line = TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X ∧ a.rootSection = 0 := by
  sorry

-- RootObject.test_trivialization is stated in the native coordinate continuation
-- below. Generic tensor-section compatibility proofs remain JAC-A inputs.

section Affine
variable {A : Type u} [CommRing A]

def affineAction (f : A) (n : ℕ) [NeZero n] (ζ : rootsOfUnity n A) :
    AdjoinRoot (Polynomial.X ^ n - Polynomial.C f) ≃ₐ[A]
      AdjoinRoot (Polynomial.X ^ n - Polynomial.C f) := by
  sorry

lemma affineAction.root (f : A) (n : ℕ) [NeZero n] (ζ : rootsOfUnity n A) :
    affineAction f n ζ (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      algebraMap A _ ((ζ : Aˣ) : A) *
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) := by
  sorry

lemma affineAction.constant (f a : A) (n : ℕ) [NeZero n] (ζ : rootsOfUnity n A) :
    affineAction f n ζ (algebraMap A _ a) = algebraMap A _ a := by
  sorry

lemma affineAction.mul (f : A) (n : ℕ) [NeZero n] (ζ ξ : rootsOfUnity n A) :
    affineAction f n (ζ * ξ) = (affineAction f n ζ).trans (affineAction f n ξ) := by
  sorry

-- affineAction.test_one
example (f : A) (n : ℕ) [NeZero n] :
    affineAction f n 1 = AlgEquiv.refl := by
  sorry

-- affineAction.test_sign
example (f : A) : ∃ ζ : rootsOfUnity 2 A,
    ((ζ : Aˣ) : A) = -1 ∧
    affineAction f 2 ζ (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      -AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f) := by
  sorry

-- affineAction.test_infinitesimal
example (p : ℕ) [Fact p.Prime] [NeZero p] [CharP A p]
    (ε : A) (hε : ε ^ 2 = 0) (hε0 : ε ≠ 0) (f : A) :
    ∃ ζ : rootsOfUnity p A, ((ζ : Aˣ) : A) = 1 + ε ∧ ζ ≠ 1 ∧
      affineAction f p ζ (AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C f)) =
        algebraMap A _ (1 + ε) *
          AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C f) := by
  sorry

-- Root-specific affine continuation. These abbreviations only name native
-- carriers; they do not construct another polynomial quotient or μ_n group.
open scoped TensorProduct

abbrev AffineRing (f : A) (n : ℕ) :=
  AdjoinRoot (Polynomial.X ^ n - Polynomial.C f)

abbrev MuHopf (R : Type u) [CommRing R] (n : ℕ) :=
  MonoidAlgebra R (Multiplicative (ZMod n))

lemma affineRoot.pow_eq (f : A) (n : ℕ) :
    AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ n =
      algebraMap A (AffineRing f n) f := by
  sorry

lemma affineCharacter.pow (n i : ℕ) :
    (MonoidAlgebra.single (TauCeti.RootsOfUnityGroup.generator n) (1 : A)) ^ i =
      MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) := by
  sorry

lemma affineRoot.pow_reduce (f : A) (n k : ℕ) [NeZero n] :
    AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ k =
      f ^ (k / n) • (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ (k % n)) := by
  sorry

def affineCoaction (f : A) (n : ℕ) [NeZero n] :
    AffineRing f n →ₐ[A] (MuHopf A n ⊗[A] AffineRing f n) := by
  sorry

lemma affineCoaction.root (f : A) (n : ℕ) [NeZero n] :
    affineCoaction f n (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      MonoidAlgebra.single (TauCeti.RootsOfUnityGroup.generator n) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) := by
  sorry

lemma affineCoaction.constant (f a : A) (n : ℕ) [NeZero n] :
    affineCoaction f n (algebraMap A (AffineRing f n) a) =
      (1 : MuHopf A n) ⊗ₜ[A] algebraMap A (AffineRing f n) a := by
  sorry

lemma affineCoaction.unique (f : A) (n : ℕ) [NeZero n]
    (ψ : AffineRing f n →ₐ[A] (MuHopf A n ⊗[A] AffineRing f n))
    (hψ : ψ (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      MonoidAlgebra.single (TauCeti.RootsOfUnityGroup.generator n) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) :
    ψ = affineCoaction f n := by
  sorry

lemma affineCoaction.weight (f : A) (n i : ℕ) [NeZero n] :
    affineCoaction f n ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) ^ i) =
      MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) ⊗ₜ[A]
        ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) ^ i) := by
  sorry

-- TauCeti.RootStack.affineCoaction.counit
lemma affineCoaction.counit (f : A) (n : ℕ) [NeZero n] :
    ((Algebra.TensorProduct.lid A (AffineRing f n)).toAlgHom.comp
      (Algebra.TensorProduct.map (Bialgebra.counitAlgHom A (MuHopf A n))
        (AlgHom.id A (AffineRing f n)))).comp (affineCoaction f n) =
      AlgHom.id A (AffineRing f n) := by
  sorry

-- TauCeti.RootStack.affineCoaction.coassoc
lemma affineCoaction.coassoc (f : A) (n : ℕ) [NeZero n] :
    (Algebra.TensorProduct.assoc A A A (MuHopf A n) (MuHopf A n)
      (AffineRing f n)).toAlgHom.comp
      ((Algebra.TensorProduct.map (Bialgebra.comulAlgHom A (MuHopf A n))
        (AlgHom.id A (AffineRing f n))).comp (affineCoaction f n)) =
      (Algebra.TensorProduct.map (AlgHom.id A (MuHopf A n))
        (affineCoaction f n)).comp (affineCoaction f n) := by
  sorry

-- TauCeti.RootStack.affineCoaction.nativePoint
lemma affineCoaction.nativePoint (f : A) (n : ℕ) [NeZero n]
    (ζ : rootsOfUnity n A) :
    ((Algebra.TensorProduct.lid A (AffineRing f n)).toAlgHom.comp
      (Algebra.TensorProduct.map
        (((TauCeti.RootsOfUnityGroup.pointsMulEquiv (R := A) (A := A) n).symm ζ).ofConv)
        (AlgHom.id A (AffineRing f n)))).comp (affineCoaction f n) =
      (affineAction f n ζ).toAlgHom := by
  sorry

-- TauCeti.RootStack.affineCoaction.invariants
theorem affineCoaction.invariants (f : A) (n : ℕ) [NeZero n] (b : AffineRing f n) :
    affineCoaction f n b = (1 : MuHopf A n) ⊗ₜ[A] b ↔
      ∃ a : A, b = algebraMap A (AffineRing f n) a := by
  sorry

-- TauCeti.RootStack.affineCoaction.test_one
example (f : A) (b : AffineRing f 1) :
    affineCoaction f 1 b = (1 : MuHopf A 1) ⊗ₜ[A] b := by
  sorry

-- TauCeti.RootStack.affineCoaction.test_sign
example (f : A) :
    ∃ ζ : rootsOfUnity 2 A, ((ζ : Aˣ) : A) = -1 ∧
      (Algebra.TensorProduct.lid A (AffineRing f 2))
        (Algebra.TensorProduct.map
          (((TauCeti.RootsOfUnityGroup.pointsMulEquiv (R := A) (A := A) 2).symm ζ).ofConv)
          (AlgHom.id A (AffineRing f 2))
          (affineCoaction f 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)))) =
        -AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f) := by
  sorry

-- TauCeti.RootStack.affineCoaction.test_characteristic_p
example (k : Type u) [Field k] (p : ℕ) [Fact p.Prime] [NeZero p] [CharP k p] :
    AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k)) ≠ 0 ∧
      affineCoaction (0 : k) p (AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k))) ≠
        (1 : MuHopf k p) ⊗ₜ[k]
          AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k)) ∧
      ∀ ζ : rootsOfUnity p k,
        affineAction (0 : k) p ζ (AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k))) =
          AdjoinRoot.root (Polynomial.X ^ p - Polynomial.C (0 : k)) := by
  sorry

-- Invariant theorem acceptance: a nonreduced coefficient ring is allowed.
example (f : A) (b : AffineRing f 2) :
    affineCoaction f 2 b = (1 : MuHopf A 2) ⊗ₜ[A] b ↔
      ∃ a : A, b = algebraMap A (AffineRing f 2) a := by
  sorry

-- Invariant theorem acceptance: the zero-ring case has no artificial degree premise.
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n] (b : AffineRing f n) :
    affineCoaction f n b = (1 : MuHopf A n) ⊗ₜ[A] b ∧
      ∃ a : A, b = algebraMap A (AffineRing f n) a := by
  sorry

/- BEGIN NATIVE FINITE ROOT TRANSITIONS -/
open Module AlgebraicGeometry

def affineTransition (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    AffineRing f n →ₐ[A] AffineRing f (n * m) := by
  sorry

lemma affineTransition.root (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineTransition f n m (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ m := by
  sorry

local instance affineTransition.coefficientAlgebra (f : A) (n m : ℕ)
    [NeZero n] [NeZero m] : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
  (affineTransition f n m).toRingHom.toAlgebra

lemma affineTransition.constant (f a : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineTransition f n m (algebraMap A (AffineRing f n) a) =
      algebraMap A (AffineRing f (n * m)) a := by
  sorry

lemma affineTransition.unique (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (j : AffineRing f n →ₐ[A] AffineRing f (n * m))
    (hj : j (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ m) :
    j = affineTransition f n m := by
  sorry

lemma affineTransition.comp (f : A) (n m k : ℕ)
    [NeZero n] [NeZero m] [NeZero k] :
    (affineTransition f (n * m) k).comp (affineTransition f n m) =
      (AdjoinRoot.algEquivOfEq A
        (Polynomial.X ^ (n * (m*k)) - Polynomial.C f)
        (Polynomial.X ^ ((n*m) * k) - Polynomial.C f)
        (by rw [Nat.mul_assoc])).toAlgHom.comp (affineTransition f n (m*k)) := by
  sorry

abbrev affineIteratedRing (f : A) (n m : ℕ) :=
  AdjoinRoot (Polynomial.X ^ m -
    Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)))

def affineIteratedReverse (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    AffineRing f (n * m) →ₐ[A] affineIteratedRing f n m := by
  sorry

lemma affineIteratedReverse.root (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineIteratedReverse f n m (AdjoinRoot.root (Polynomial.X ^ (n*m) - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ m -
        Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f))) := by
  sorry

lemma affineIteratedReverse.constant (f a : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineIteratedReverse f n m (algebraMap A (AffineRing f (n*m)) a) =
      algebraMap A (affineIteratedRing f n m) a := by
  sorry

lemma affineIteratedReverse.coefficient (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f n) :
    affineIteratedReverse f n m (affineTransition f n m b) =
      algebraMap (AffineRing f n) (affineIteratedRing f n m) b := by
  sorry

def affineTransitionIterated (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    (letI : Algebra (AffineRing f n) (AffineRing f (n * m)) :=
       (affineTransition f n m).toRingHom.toAlgebra;
     AdjoinRoot (Polynomial.X ^ m -
       Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f))) ≃ₐ[AffineRing f n]
       AffineRing f (n * m)) := by
  sorry

lemma affineTransitionIterated.root (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineTransitionIterated f n m
      (AdjoinRoot.root (Polynomial.X ^ m -
        Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ (n*m) - Polynomial.C f) := by
  sorry

lemma affineTransitionIterated.coefficient (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f n) :
    affineTransitionIterated f n m (algebraMap (AffineRing f n) (affineIteratedRing f n m) b) =
      affineTransition f n m b := by
  sorry

def affineTransitionBasis (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    (letI : Algebra (AffineRing f n) (AffineRing f (n * m)) :=
       (affineTransition f n m).toRingHom.toAlgebra;
     Basis (Fin m) (AffineRing f n) (AffineRing f (n * m))) := by
  sorry

lemma affineTransitionBasis.apply (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (i : Fin m) :
    affineTransitionBasis f n m i =
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ (i : ℕ) := by
  sorry

lemma affineTransitionBasis.repr (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f (n * m)) :
    b = ∑ i : Fin m, affineTransition f n m ((affineTransitionBasis f n m).repr b i) *
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ (i : ℕ) := by
  sorry

lemma affineTransitionBasis.repr_symm (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (c : Fin m →₀ AffineRing f n) :
    (affineTransitionBasis f n m).repr.symm c =
      ∑ i : Fin m, affineTransition f n m (c i) *
        AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ (i : ℕ) := by
  sorry

theorem affineTransitionFaithfullyFlat (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    (let : Algebra (AffineRing f n) (AffineRing f (n * m)) :=
       (affineTransition f n m).toRingHom.toAlgebra;
     Module.FaithfullyFlat (AffineRing f n) (AffineRing f (n * m))) := by
  sorry

theorem affineTransitionSpecProperties (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    IsFinite (Spec.map (CommRingCat.ofHom (affineTransition f n m).toRingHom)) ∧
    Flat (Spec.map (CommRingCat.ofHom (affineTransition f n m).toRingHom)) ∧
    Surjective (Spec.map (CommRingCat.ofHom (affineTransition f n m).toRingHom)) := by
  sorry

-- affineTransitionSpecProperties.test_wild
example :
    IsFinite (Spec.map (CommRingCat.ofHom (affineTransition (0 : ZMod 2) 2 2).toRingHom)) ∧
    Flat (Spec.map (CommRingCat.ofHom (affineTransition (0 : ZMod 2) 2 2).toRingHom)) ∧
    Surjective (Spec.map (CommRingCat.ofHom (affineTransition (0 : ZMod 2) 2 2).toRingHom)) := by
  sorry

-- affineTransition.test_one
example (f : A) (n : ℕ) [NeZero n] :
    affineTransition f n 1 =
      (AdjoinRoot.algEquivOfEq A
        (Polynomial.X ^ n - Polynomial.C f)
        (Polynomial.X ^ (n*1) - Polynomial.C f)
        (by rw [Nat.mul_one])).toAlgHom := by
  sorry

-- affineTransition.test_four_to_two
example (f : A) :
    affineTransition f 2 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 2 := by
  sorry

-- affineTransition.test_nilpotent
example (k : Type u) [Field k] :
    affineTransition (0 : k) 2 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k))) =
      AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C (0 : k)) ^ 2 ∧
    affineTransition (0 : k) 2 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k))) ≠ 0 := by
  sorry

-- affineTransitionBasis.test_one
example (f : A) (n : ℕ) [NeZero n] (i : Fin 1) :
    affineTransitionBasis f n 1 i = 1 := by
  sorry

-- affineTransitionBasis.test_four
example (f : A) (b : AffineRing f 4) :
    ∃! c : Fin 2 → AffineRing f 2,
      b = affineTransition f 2 2 (c 0) +
        affineTransition f 2 2 (c 1) * AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) := by
  sorry

-- affineTransitionBasis.test_zeroRing
example [Subsingleton A] (f : A) (n m : ℕ) [NeZero n] [NeZero m] (i : Fin m) :
    affineTransitionBasis f n m i = 0 := by
  sorry

-- affineIteratedReverse.test_root
example (k : Type u) [Field k] :
    affineIteratedReverse (0 : k) 2 2
      (AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C (0 : k))) =
      AdjoinRoot.root (Polynomial.X ^ 2 -
        Polynomial.C (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k)))) := by
  sorry

-- affineIteratedReverse.test_coefficient
example (f : A) :
    affineIteratedReverse f 2 2 (AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 2) =
      algebraMap (AffineRing f 2) (affineIteratedRing f 2 2)
        (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) := by
  sorry

-- affineIteratedReverse.test_fourth_power
example (f : A) :
    affineIteratedReverse f 2 2 (AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 4) =
      algebraMap A (affineIteratedRing f 2 2) f := by
  sorry

-- affineIteratedReverse.test_zeroRing
example [Subsingleton A] (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f (n*m)) : affineIteratedReverse f n m b = 0 := by
  sorry

-- affineTransitionBasis.test_nonreduced
example :
    (letI : Algebra (AffineRing (2 : ZMod 4) 2) (AffineRing (2 : ZMod 4) 4) :=
      (affineTransition (2 : ZMod 4) 2 2).toRingHom.toAlgebra;
    Module.FaithfullyFlat (AffineRing (2 : ZMod 4) 2) (AffineRing (2 : ZMod 4) 4)) := by
  sorry

-- affineTransitionBasis.test_wild
example :
    (letI : Algebra (AffineRing (0 : ZMod 2) 2) (AffineRing (0 : ZMod 2) 4) :=
      (affineTransition (0 : ZMod 2) 2 2).toRingHom.toAlgebra;
    Module.FaithfullyFlat (AffineRing (0 : ZMod 2) 2) (AffineRing (0 : ZMod 2) 4)) := by
  sorry

-- affineTransitionBasis.test_finite_free
example (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    Module.Free (AffineRing f n) (AffineRing f (n*m)) ∧
    Module.Finite (AffineRing f n) (AffineRing f (n*m)) := by
  sorry

/- END NATIVE FINITE ROOT TRANSITIONS -/

end Affine

lemma rootTwoDegreeBound (K : Type u) [Field K] [Algebra ℚ K]
    [FiniteDimensional ℚ K] (n : ℕ) (hn : 0 < n) (x : K) (hx : x ^ n = 2) :
    n ≤ Module.finrank ℚ K := by
  sorry

-- Acceptance of the non-fppf Kummer tower: no finite extension supplies all roots.
example (K : Type u) [Field K] [Algebra ℚ K] [FiniteDimensional ℚ K] :
    ¬ ∀ n : ℕ, 0 < n → ∃ x : K, x ^ n = 2 := by
  sorry
end TauCeti.RootStack

/-
Exact omission ledger for LEAN-GEOMETRY and LEAN-SECTION-COMP.
The statements below are mathematical obligations, not Lean declarations.
No missing carrier or theorem is encoded as an arbitrary Prop assumption.

Node FunctionFieldArithmeticPartII:key/root-stacks
For n≥1 and a line bundle with section (L,s) on a scheme X or an algebraic stack X, define
√[n]{(L,s)/X} on T→X as the groupoid of root objects of (L_T,s_T). Pullback and its coherent
isomorphisms define the fibred stack. For an effective Cartier divisor D use (O_X(D),s_D). Arbitrary
exponents use the fppf topology; the étale description is asserted only when n is invertible.
API TauCeti.RootStack.rootStack.object: The fibre over T→X is exactly the root-object groupoid of (L_T,s_T).
API TauCeti.RootStack.rootStack.forget: Forget root data to the base T→X.
API TauCeti.RootStack.rootStack.baseChange: A base morphism induces pullback of root data with identity/composition coherence.
API TauCeti.RootStack.rootStack.universalRoot: The stack carries the universal line bundle, section and n-th-power isomorphism; maps into it are
equivalent to such root data.
Example TauCeti.RootStack.rootStack.test_exponent_one: The n=1 stack is equivalent to X over X.
Example TauCeti.RootStack.rootStack.test_unit_section: For (O_X,1), every exponent gives a stack equivalent to X.
Example TauCeti.RootStack.rootStack.test_zero_section: Over an algebraically closed field, (O,0) at invertible n>1 has μ_n automorphisms and is not the
coarse point.
Example TauCeti.RootStack.rootStack.test_stack_base: At n=1 over BG the output is BG, rather than Spec k.

Node FunctionFieldArithmeticPartII:RS.1/two-pullback
Let A=[A¹/G_m] classify a line bundle with section and [n]:A→A take its n-th tensor power. The root
stack is X×_{A,[n]}A with its universal root. For a stack base this is a two-fibre product,
including the specified isomorphism, not an equality pullback of coarse points.

Node FunctionFieldArithmeticPartII:RS.1/base-change
For any f:Y→X there is a canonical equivalence Y×_X√[n]{(L,s)/X}≃√[n]{(f*L,f*s)/Y}, compatible with
identity and composition of f.

Node FunctionFieldArithmeticPartII:RS.1/affine-chart
If X=Spec A and (L,s) is trivialized with s=f, then √[n]{(L,s)/X}≃[Spec AdjoinRoot(Tⁿ−f)/μ_n], with
the diagonalizable action already constructed. This is a quotient stack with torsors, not an orbit
set.

Node FunctionFieldArithmeticPartII:RS.1/closed-fibre
For a geometric point x with s(x)=0, the full fibre is [Spec κ(x)[t]/tⁿ /μ_n]. Its reduction is
Bμ_n. If s(x)≠0 the fibre is the point. For n>1 the full closed fibre must not be identified with
its reduced gerbe.

Node FunctionFieldArithmeticPartII:RS.1/coarse-space
For a scheme base X, the projection of the root stack to X is its coarse-space morphism. For an
algebraic-stack base, it is relative coarse over X: after scheme base change it has the preceding
coarse property. It is not an assertion that X is an absolute algebraic space.

Node FunctionFieldArithmeticPartII:RS.1/regular-dm
If X is regular and D is a regular effective Cartier divisor, √[n]{(O(D),s_D)/X} is regular; when n
is invertible on X it is Deligne–Mumford with μ_n inertia over D and trivial inertia outside D. If a
geometric branch point has characteristic dividing n, its μ_n inertia is not étale, so the stack is
not DM there. An empty divisor still gives X in every characteristic.

Node FunctionFieldArithmeticPartII:RS.2/transition
For positive m,n the transition √[mn]{(L,s)}→√[n]{(L,s)} sends (M,t,φ) to (Mᵐ,tᵐ,φ), using the
coherent identification (Mᵐ)ⁿ≅Mᵐⁿ. Transitions are compatible with base change and with
multiplication of positive integers.
API TauCeti.RootStack.transition.object: The root line and section become Mᵐ and tᵐ.
API TauCeti.RootStack.transition.one: The m=1 transition is the identity.
API TauCeti.RootStack.transition.comp: Transitions for a and b compose to the transition for ab with the specified coherence.
Example TauCeti.RootStack.transition.test_identity: Transition from n to n is identity.
Example TauCeti.RootStack.transition.test_four_to_two: A fourth root (M,t) maps to the square root (M²,t²).
Example TauCeti.RootStack.transition.test_base_change: Pulling a transition back to Y gives the transition of the pulled-back section.

Node FunctionFieldArithmeticPartII:RS.2/infinite-root-stack
Define √[infinity]{(L,s)/X} as the two-inverse limit of the finite root stacks indexed by positive
integers ordered by divisibility, on the fpqc scheme site. Its objects over T are compatible finite
root objects with transition isomorphisms satisfying cocycles; arrows are compatible systems of root
isomorphisms. It is an fpqc stack, hence also an fppf stack by restriction, and is not asserted to
be an algebraic stack of finite presentation. Its affine quotient uses fpqc torsors.
API TauCeti.RootStack.infiniteRootStack.projection: Project a coherent system to its n-th root.
API TauCeti.RootStack.infiniteRootStack.lift: A compatible family of maps into the finite roots determines a map into the two-limit, with
compatible 2-morphisms.
API TauCeti.RootStack.infiniteRootStack.baseChange: The two-limit commutes with base change in X.
Example TauCeti.RootStack.infiniteRootStack.test_unit_section: The infinite root of (O_X,1) is X.
Example TauCeti.RootStack.infiniteRootStack.test_projection: Its n-th projection followed by a finite transition is the corresponding lower projection.
Example TauCeti.RootStack.infiniteRootStack.test_coherence: Choosing unrelated n-th roots without transition isomorphisms does not define an infinite root
object.

Node FunctionFieldArithmeticPartII:RS.2/infinite-base-change
For f:Y→X the canonical map √[∞]{(f*L,f*s)/Y}→Y×_X√[∞]{(L,s)/X} is an equivalence, compatible with
every finite projection.

Node FunctionFieldArithmeticPartII:RS.2/dvr-roots
For a DVR A with uniformizer π and closed divisor D, the n-th root is [Spec A[t]/(tⁿ−π)/μ_n].
Replacing π by uπ gives a canonically equivalent stack as a root of the same Cartier pair; it does
not require choosing an n-th root of u in A.

Node FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe
The reduced closed fibre of the infinite root of a DVR with residue field k is the inverse system of
the root gerbes of the normal line, banded by lim_n μ_n=Ẑ(1). It is noncanonically equivalent to
B_kẐ(1); a chosen trivialization of the normal line gives a compatible neutralization. The
neutralization is not part of the canonical root stack.

Node FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes
After choosing a neutralization of the infinite reduced DVR gerbe over k, its k-points up to
isomorphism identify with H1_fpqc(k,G), where G=lim_n μ_n, and with lim_n H1_fppf(k,μ_n)=lim_n
k×/(k×)^n. Infinite torsors are fpqc; the finite Kummer calculation is fppf. The full groupoid
retains G(k) automorphisms, and changing the neutralization changes the chosen origin.

Node FunctionFieldArithmeticPartII:GC.0/root-picard
Pic_X^√R(S) is the groupoid of (L,K_R,ι), where L is a line bundle on X×S, K_R a line bundle on R×S
and ι:K_R²≅L|_{R×S}. Its degree-d component imposes degree d on every geometric fibre; d ranges over
all integers. Tensor product and dual give the graded commutative Picard stack.
API TauCeti.RamifiedClassField.rootPicard.object: Create (L,K_R,ι) from the two line bundles and the square identification.
API TauCeti.RamifiedClassField.rootPicard.degree: The degree is the fibrewise degree of L, additive under tensor product.
API TauCeti.RamifiedClassField.rootPicard.tensor: Tensor two objects and their root identifications; dual gives inverse up to coherent isomorphism.
API TauCeti.RamifiedClassField.rootPicard.forget: Forget K_R,ι to the ordinary Picard stack.
Example TauCeti.RamifiedClassField.rootPicard.test_empty_R: At R=∅ this is the ordinary graded Picard stack.
Example TauCeti.RamifiedClassField.rootPicard.test_degree_minus_one: Negative-degree components contain line bundles and are not declared empty.
Example TauCeti.RamifiedClassField.rootPicard.test_stabilizer: Over an algebraically closed field with r geometric branch points, forgetting roots has relative
stabilizer μ₂^r.

Node FunctionFieldArithmeticPartII:GC.0/square-action-quotient
Let Pic_{X,R} classify (L,γ:L|_R≅O_R). Then Pic_X^√R≃[Pic_{X,R}/[2]Res_{R/k}G_m], where the acting
group changes the rigidification through its square. The forgetful morphism to Pic_X is a
Res_{R/k}μ₂-gerbe.

Node FunctionFieldArithmeticPartII:GC.0/root-picard-section
Pic_X^{√R;√R}(S) additionally carries α_R∈Γ(R×S,K_R). It does not carry a global section of L. The
zero root section is allowed.
API TauCeti.RamifiedClassField.rootPicardSection.object: Adjoin α_R to a root-Picard object, including α_R=0.
API TauCeti.RamifiedClassField.rootPicardSection.forget: Forget α_R to Pic_X^√R.
API TauCeti.RamifiedClassField.rootPicardSection.squareEvaluation: The squared section ι(α_R²) lies in L|_R.
Example TauCeti.RamifiedClassField.rootPicardSection.test_zero: Every root-Picard object admits the zero root section.
Example TauCeti.RamifiedClassField.rootPicardSection.test_empty_R: At R=∅ the forgetful map is an equivalence.
Example TauCeti.RamifiedClassField.rootPicardSection.test_weights: In the rigidified quotient α_R has weight one while the rigidification has weight two.

Node FunctionFieldArithmeticPartII:GC.1/root-symmetric-space
For d≥0 let hatX_d^√R classify (L,K_R,ι,a,α_R) of degree d with a∈Γ(X×S,L) and ι(α_R²)=a|_{R×S}.
Define X_d^√R as the open where a is nonzero on every geometric fibre, and U_d^√R as the inverse
image of Sym^d(X−R). Hat spaces admit zero global sections and nonreduced bases.
API TauCeti.RamifiedClassField.rootSymmetricPower.hatObject: Construct a hat object from the five data and the restriction equation.
API TauCeti.RamifiedClassField.rootSymmetricPower.effectiveOpen: The open X_d consists exactly of sections nonzero on every geometric fibre.
API TauCeti.RamifiedClassField.rootSymmetricPower.forgetRoot: Forgetting the root line and section maps to the ordinary degree-d section space.
API TauCeti.RamifiedClassField.rootSymmetricPower.awayFromR: On divisors disjoint from R the root-forgetting map is an equivalence.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_d_zero: At d=0 the effective space is Spec k; the section nowhere vanishes.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_empty_R: At R=∅ the effective space is Sym^d X.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_closed_fibre: Over a divisor containing a branch point the full fibre has the nilpotent root chart, rather than
only Bμ₂.
Example TauCeti.RamifiedClassField.rootSymmetricPower.test_hat_zero: The hat degree-d space admits a=0 and α_R=0 for any root-Picard object in that degree.

Node FunctionFieldArithmeticPartII:GC.1/evaluation-pullback
The root symmetric-power stack is the two-pullback of the ordinary evaluation map to [Res_R A¹/Res_R
G_m] along its square-power map. Over a splitting field the latter is a product of copies of
[A¹/G_m], one for each geometric point of R.

Node FunctionFieldArithmeticPartII:GC.1/incidence-transversality
After splitting R, in Sym^d X each incidence divisor D_x of effective divisors containing x is
smooth, and intersections for a subset I of distinct branch points identify with Sym^{d−|I|}X when
d≥|I|, with codimension |I|; the intersection is empty when d<|I|.

Node FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion
For a smooth Z over the algebraically closed base, a map Z→[A^r/G_m^r] given by r line bundles with
sections is smooth exactly when their zero divisors are smooth and meet transversely, including the
empty strata.

Node FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth
The effective root symmetric power X_d^√R is smooth over k of dimension d and is DM. Its evaluation
map to [Res_R A¹/Res_R G_m] is smooth.

Node FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse
The root-forgetting projection X_d^√R→Sym^d X is its coarse-space morphism and is an equivalence
over Sym^d(X−R).

Node FunctionFieldArithmeticPartII:GC.1/root-addition
For d,e≥0 tensor L and K_R and multiply both sections to define
hatadd_{d,e}:hatX_d^√R×hatX_e^√R→hatX_{d+e}^√R. Restriction gives addition on the effective opens;
the same construction gives effective-divisor translation of the hat space.
API TauCeti.RamifiedClassField.rootAddition.object: Root addition tensors line bundles and multiplies sections.
API TauCeti.RamifiedClassField.rootAddition.unit: Adding the degree-zero unit object gives the original divisor.
API TauCeti.RamifiedClassField.rootAddition.coherence: Associativity and symmetry are the imported coherent tensor isomorphisms, with the same section
equations.
Example TauCeti.RamifiedClassField.rootAddition.test_empty: Adding two empty divisors gives the empty divisor.
Example TauCeti.RamifiedClassField.rootAddition.test_ordinary: At R=∅ this is ordinary symmetric-power addition.
Example TauCeti.RamifiedClassField.rootAddition.test_branch_section: Two zero root-section values multiply to zero, rather than cancel or become nonzero.

Node FunctionFieldArithmeticPartII:GC.1/ordered-divisors
Iterated addition defines p_d:(X_1^√R)^d→X_d^√R, with its S_d-equivariance and the degree-zero unit
map.
API TauCeti.RamifiedClassField.orderedRootDivisors.one: p_1 is the identity.
API TauCeti.RamifiedClassField.orderedRootDivisors.permutation: Every σ∈S_d acts on the source and p_d is equivariant with coherent target isomorphisms.
API TauCeti.RamifiedClassField.orderedRootDivisors.blockAddition: Concatenating ordered tuples agrees with root addition after their separate p_d maps.
Example TauCeti.RamifiedClassField.orderedRootDivisors.test_zero: p_0 maps the point to the empty root divisor.
Example TauCeti.RamifiedClassField.orderedRootDivisors.test_one: p_1 is identity on the root curve.
Example TauCeti.RamifiedClassField.orderedRootDivisors.test_collision: p_2 is not representable at two equal branch points: its relative inertia contains diagonal μ₂.

Node FunctionFieldArithmeticPartII:GC.1/ordered-proper
The ordered map p_d is proper and quasi-finite in the nonrepresentable stack sense; the generic
distinct-point locus is an S_d-cover. Its finite relative stabilizers are tame μ₂-products. No
representably finite morphism is asserted at branch collisions.

Node FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi
Define hatAJ_d:hatX_d^√R→Pic_X^√R,d by forgetting a and α_R, and the refined map retaining α_R to
Pic_X^{√R;√R,d}. Restrict the first map to AJ_d:X_d^√R→Pic_X^√R,d. Addition commutes with the
product AJ_d×AJ_e and Picard tensor multiplication.
API TauCeti.RamifiedClassField.rootAbelJacobi.hat: The hat map forgets both sections and retains the two root line bundles and ι.
API TauCeti.RamifiedClassField.rootAbelJacobi.refined: The refined map forgets a and retains α_R.
API TauCeti.RamifiedClassField.rootAbelJacobi.addition: AJ_{d+e}∘add≅mult∘(AJ_d×AJ_e).
Example TauCeti.RamifiedClassField.rootAbelJacobi.test_empty_R: At R=∅ the effective map is the ordinary Abel–Jacobi map to Pic^d.
Example TauCeti.RamifiedClassField.rootAbelJacobi.test_zero: At d=0 the effective point maps to the tensor unit.
Example TauCeti.RamifiedClassField.rootAbelJacobi.test_hat_zero: A zero global section still has a defined hatAJ image.

Node FunctionFieldArithmeticPartII:GC.2/root-units
At x∈R let O_{√x}×={(u,v)∈O_x××k(x)× : ū=v²}, with componentwise multiplication. For x∉R use O_x×.
Let O_{√R}× be their product. Its map to adelic units forgets v and has kernel ∏_{x∈R}μ₂(k(x)); do
not assume it is injective.
API TauCeti.RamifiedClassField.rootUnits.mk: Create (u,v) with ū=v².
API TauCeti.RamifiedClassField.rootUnits.forget: Project to u in O_x× and to the corresponding idele unit.
API TauCeti.RamifiedClassField.rootUnits.kernel: The kernel consists of u=1 and v²=1.
Example TauCeti.RamifiedClassField.rootUnits.test_empty_R: At R=∅ the product is the ordinary unit product.
Example TauCeti.RamifiedClassField.rootUnits.test_minus_one: At a ramified place, (1,−1) is a nontrivial kernel element.
Example TauCeti.RamifiedClassField.rootUnits.test_nonsquare: A unit with nonsquare residue has no lift to this group.

Node FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid
There is an equivalence Pic_X^√R(k)≃F×\A_F×/O_{√R}× as a double-action groupoid. The right action
uses the actual noninjective homomorphism to idele units. Degree and all stabilizers are retained.
At x∉R, π_x⁻¹ represents O_X(x)^♮.

Node FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid
The groupoid of root divisors used in §6.2.3 is the effective open X_d^√R(k) with its root data and
automorphisms; forgetting the root gives the ordinary divisor. The character on differences of such
objects is evaluated through the adelic root-Picard equivalence, not through an unweighted set
bijection.

Node FunctionFieldArithmeticPartII:GC.3/tame-local-systems
Rank-one Q̄ℓ-local systems L on X_1^√R correspond to rank-one tame local systems on U=X−R whose
geometric inertia characters have order dividing two. Their global monodromy can have arbitrary
order; in particular an unramified character of order three is allowed.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-local-system
For L as above and d≥0 define K_d=(p_{d,!}L^{⊠d})^{S_d} with no shift, and L_d=H⁰(K_d). The
collision and middle-extension lemmas prove K_d≅L_d, with L_d lisse rank one and L_d[d] perverse.
The invariant projector is d!⁻¹Σσ over Q̄ℓ, including when ℓ divides d!.
API TauCeti.RamifiedClassField.symmetricLocalSystem.zero: L_0 is the coefficient line on Spec k.
API TauCeti.RamifiedClassField.symmetricLocalSystem.one: L_1=L under p_1=id.
API TauCeti.RamifiedClassField.symmetricLocalSystem.invariantProjector: L_d is the image of d!⁻¹Σσ on the unshifted p_{d,!}L^{⊠d}.
API TauCeti.RamifiedClassField.symmetricLocalSystem.perverseShift: L_d[d] is the perverse intermediate extension from the distinct-point open.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_zero: The zeroth symmetric local system is the coefficient line in degree zero.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_one: The first symmetric local system is L in degree zero.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_shift: At d=1 the complex L[1] is perverse, while L is the unshifted lisse sheaf.
Example TauCeti.RamifiedClassField.symmetricLocalSystem.test_order_three: An unramified order-three character still gives this construction.

Node FunctionFieldArithmeticPartII:GC.3/collision-kernel
At a geometric divisor Σm_x x, the relative inertia of the ordered map over a branch point x is
ker(μ₂^{m_x}→μ₂). It acts trivially on L_x^{⊗m_x}, since the same rank-one character occurs in every
factor.

Node FunctionFieldArithmeticPartII:GC.3/middle-extension
The rational invariant object (p_{d,!}L^{⊠d}[d])^{S_d} is the perverse intermediate extension of the
distinct-point local system. Its unshifted stalks have no higher relative cohomology because the
relative fibres are finite tame groupoids with rational coefficients.

Node FunctionFieldArithmeticPartII:GC.3/collision-descent
L_d is a rank-one local system on all of X_d^√R, including repeated branch divisors.

Node FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing
If L is geometrically nontrivial on the proper root curve, H⁰(X_1^√R_kbar,L)=H²(X_1^√R_kbar,L)=0;
its cohomology is concentrated in degree one.

Node FunctionFieldArithmeticPartII:GC.3/koszul-exterior
For a vector space V concentrated in cohomological degree one, the S_d-invariants of its d-fold
graded tensor power are ∧^dV in degree d. The permutation action includes the Koszul sign, so this
is the exterior rather than the ordinary symmetric power.

Node FunctionFieldArithmeticPartII:GC.3/exterior-cohomology
For geometrically nontrivial L, H^i(X_d^√R_kbar,L_d)=0 for i≠d, and H^d≅∧^dH¹(X_1^√R_kbar,L),
naturally and Frobenius-equivariantly. This includes d=0; exterior powers vanish for d above dim H¹.

Node FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product
On the locus where the two effective divisors have mutually disjoint support away from R,
add*L_{d+e}≅L_d⊠L_e by concatenating the tensor lines on ordered divisors.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity
The distinct-point isomorphism extends uniquely to α_{d,e}:add*L_{d+e}≅L_d⊠L_e on X_d^√R×X_e^√R.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-associativity
For d,e,f≥0 the two composites of α_{d,e}, α_{d+e,f} and α_{e,f}, α_{d,e+f} agree after the
specified tensor/addition associators.

Node FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry
The α_{d,e} isomorphisms commute with exchanging d,e and with the ordinary symmetry of rank-one
sheaves; α_{0,d} and α_{d,0} are the canonical unit isomorphisms.

Node FunctionFieldArithmeticPartII:GC.4/evaluation-surjective
If d≥ρ+max(2g−1,1), then for a degree-d line bundle L, H¹(X,L(−R))=0. In families, π_*L and π_*L(−R)
are vector bundles of ranks d−g+1 and d−ρ−g+1, commute with base change, and π_*L→π_*(L|_R) is
surjective.

Node FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart
At a fixed geometric root-Picard object (L,K_R,ι), the two-fibre of AJ_d is M=H⁰(X,L) minus
{0}×_{H⁰(R,L|_R)}H⁰(R,K_R), with the second map α↦ι(α²). For ρ>0 and the degree bound, a splitting
of evaluation identifies M≃A^n minus {0}, n=d−g+1. Scaling K_R by λ and L by λ² gives weights two on
n−ρ coordinates and one on ρ coordinates.

Node FunctionFieldArithmeticPartII:GC.4/weighted-cover
For n≥ρ+1 and ρ≥1, set a=n−ρ. The coordinate map [x₁,…,x_a,y₁,…,y_ρ]↦[x₁²,…,x_a²,y₁,…,y_ρ] defines a
finite cover P^{n−1}→[A^n minus {0}/G_m], with weights (2^a,1^ρ). Its generic Galois group is μ₂^a.

Node FunctionFieldArithmeticPartII:GC.4/weighted-ramification
A proper subgroup Γ⊊μ₂^a gives an intermediate cover of the weighted quotient that is ramified along
at least one coordinate divisor x_i=0 in a chart where a weight-one coordinate y_ρ is nonzero. Hence
such an intermediate cover cannot be finite étale.

Node FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected
The weighted quotient [A^n minus {0}/G_m] with weights (2^{n−ρ},1^ρ), ρ≥1 and n≥ρ+1, has no
nontrivial connected finite étale cover. Thus every rank-one lisse Q̄ℓ-local system on it is
geometrically constant.

Node FunctionFieldArithmeticPartII:GC.4/fibre-triviality
Under the high-degree bound and ρ>0, L_d restricts to a constant sheaf on each geometric two-fibre M
of AJ_d.

Node FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent
When R=∅ and d≥max(2g−1,1), the symmetric local system descends along the ordinary Abel–Jacobi map
to the degree-d Picard stack. The ordinary scalar action has weight one; the projective fibre
quotient is P^{d−g}.

Node FunctionFieldArithmeticPartII:GC.4/high-degree-descent
For d≥ρ+max(2g−1,1), L_d descends to a rank-one local system L_d^Pic on Pic_X^√R,d with
AJ_d*L_d^Pic≅L_d. Descent and its comparison are unique up to the canonical isomorphism compatible
with pullback; the pullback functor is fully faithful in this setting.

Node FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors
For every integer d and bound B there exists an effective divisor D on U=X−R with d+deg D≥B. The
construction requires no rational point of degree one. For two choices D,E, a common effective
enlargement is D+E.

Node FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line
For an effective D=Σn_x x supported on U, define the Frobenius line L_D as the tensor product of the
fibres of L over all geometric points above x, each repeated n_x times, with its Frobenius
permutation descent. This is the value of L_{deg D} at the canonical root divisor O(D)^♮.
API TauCeti.RamifiedClassField.divisorTensorLine.zero: L_0 is the coefficient line.
API TauCeti.RamifiedClassField.divisorTensorLine.sum: L_{D+E}≅L_D⊗L_E with the inherited tensor coherence.
API TauCeti.RamifiedClassField.divisorTensorLine.closedPoint: The Frobenius action for a closed point is the cyclic permutation with its local Frobenius action.
Example TauCeti.RamifiedClassField.divisorTensorLine.test_empty: The empty divisor gives Q̄ℓ.
Example TauCeti.RamifiedClassField.divisorTensorLine.test_rational: For a rational point x outside R the line is L_x.
Example TauCeti.RamifiedClassField.divisorTensorLine.test_degree_two: For a degree-two closed point the line is the tensor of both conjugate fibres with Frobenius
descent.

Node FunctionFieldArithmeticPartII:GC.5/translate-high-degree
If D is effective away from R and both d and d+deg D satisfy the high-degree bound, there is a
canonical isomorphism t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D.

Node FunctionFieldArithmeticPartII:GC.5/all-degree-extension
For d∈Z choose effective D⊂U with d+deg D≥B=ρ+max(2g−1,1) and set L_d^Pic=t_D*L_{d+deg D}^Pic⊗L_D⁻¹.
The comparison and cocycle lemmas identify different choices canonically; the resulting graded sheaf
is L^Pic on the whole root Picard stack.
API TauCeti.RamifiedClassField.picardCharacter.component: The degree-d component is the normalized translated high-degree sheaf.
API TauCeti.RamifiedClassField.picardCharacter.comparison: The sheaves from two effective choices are canonically isomorphic through their common enlargement.
API TauCeti.RamifiedClassField.picardCharacter.translation: t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D for every d and effective D away from R.
Example TauCeti.RamifiedClassField.picardCharacter.test_negative_degree: The construction gives a sheaf on degree −1 without choosing a degree-one rational point.
Example TauCeti.RamifiedClassField.picardCharacter.test_common_sum: The comparisons through D+E agree with comparisons through further effective enlargements.
Example TauCeti.RamifiedClassField.picardCharacter.test_high_degree: Above B it agrees with the original high-degree descent.

Node FunctionFieldArithmeticPartII:GC.5/choice-comparison
For effective D,E giving high degrees, the two constructions of L_d^Pic are canonically identified
by translating each once more to the high degree d+deg D+deg E and using L_{D+E}≅L_D⊗L_E.

Node FunctionFieldArithmeticPartII:GC.5/choice-cocycle
For any three effective choices D,E,F the canonical comparison D→E followed by E→F is the comparison
D→F. Comparisons are unchanged by further common effective enlargement.

Node FunctionFieldArithmeticPartII:GC.5/effective-pullback
For every d≥0, AJ_d*L_d^Pic≅L_d canonically. Choose an effective D away from R reaching B; the
translated comparison and multiplication cancel L_D.

Node FunctionFieldArithmeticPartII:GC.5/unit-trivialization
At the root-Picard tensor unit e, the pullback e*L^Pic is canonically Q̄ℓ, via the degree-zero
effective Abel–Jacobi comparison.

Node FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication
For d,e≥B, mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic on the product Pic^√R,d×Pic^√R,e. The pullback
comparison uses AJ_d×AJ_e, not AJ_{d+e}.

Node FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication
For all d,e∈Z there is a canonical isomorphism μ_{d,e}:mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic. It is the
high-degree isomorphism transported by independent effective divisors D,E and normalized using
L_{D+E}≅L_D⊗L_E.

Node FunctionFieldArithmeticPartII:GC.5/character-associativity
For all integers d,e,f, the two composites of μ for the three-degree product agree under the Picard
and sheaf associators.

Node FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit
The multiplication μ_{d,e} commutes with exchanging factors, and its restrictions along e×id and
id×e are the identity unit maps after the canonical unit trivialization.

Node FunctionFieldArithmeticPartII:GC.5/hat-character-pullback
For every integer degree in which the hat section moduli problem is defined, set
hatL_d=hatAJ_d*L_d^Pic. On the effective open it is canonically L_d for d≥0. This is a pullback
along the entire hat map, so its zero-section stalks remain rank one.
API TauCeti.RamifiedClassField.hatCharacter.definition: hatL_d is exactly hatAJ_d*L_d^Pic.
API TauCeti.RamifiedClassField.hatCharacter.effective: Its restriction to the effective open is canonically L_d.
API TauCeti.RamifiedClassField.hatCharacter.zeroSection: At a zero global section its stalk is the character line of the underlying root-Picard object.
Example TauCeti.RamifiedClassField.hatCharacter.test_effective: The restriction agrees with the unshifted degree-zero symmetric local system.
Example TauCeti.RamifiedClassField.hatCharacter.test_zero: The zero-section stalk is rank one, not zero.
Example TauCeti.RamifiedClassField.hatCharacter.test_degree_zero: At the effective empty divisor it is the coefficient line with the canonical unit.

Node FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf
On X_et define G_m,X^√R=G_m,X×_{i_*G_m,R,[2]}i_*G_m,R. Its sections are pairs (u,v) of a unit and a
root unit on R satisfying u|_R=v². Its torsor stack is the root Picard stack.
API TauCeti.RamifiedClassField.rootMultiplicativeSheaf.sections: Its sections are exactly (u,v) with u|_R=v².
API TauCeti.RamifiedClassField.rootMultiplicativeSheaf.forget: Forget v to G_m,X.
API TauCeti.RamifiedClassField.rootMultiplicativeSheaf.torsors: Its torsor stack is Pic_X^√R.
Example TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_empty_R: At R=∅ this is G_m,X.
Example TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_kernel: The forgetful kernel on R is μ₂.
Example TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_nonadditive: For odd-characteristic residue rings the square map is multiplicative but does not define an
additive ring map.

Node FunctionFieldArithmeticPartII:GC.6/norm-residue-square
For the smooth geometrically connected double cover ν:X′→X with reduced ramification R′≃R and
involution σ, restriction of Nm(u) to R is (u|_{R′})². For a line bundle L′, Nm(L′)|_R≅(L′|_{R′})²
canonically.

Node FunctionFieldArithmeticPartII:GC.6/root-norm
The sheaf map Nm^√R=(Nm,r_{R′}):ν_*G_m,X′→G_m,X^√R induces the root norm Pic_X′→Pic_X^√R, sending L′
to (Nm L′,L′|_{R′},ι). It lifts the ordinary norm and respects tensor products.
API TauCeti.RamifiedClassField.rootNorm.object: The object is (Nm L′,L′|_{R′},ι).
API TauCeti.RamifiedClassField.rootNorm.forget: Forgetting roots gives the ordinary norm.
API TauCeti.RamifiedClassField.rootNorm.tensor: Root norm preserves tensor product with the canonical coherent norm isomorphism.
API TauCeti.RamifiedClassField.rootNorm.baseChange: It commutes with admissible base changes of the double cover.
Example TauCeti.RamifiedClassField.rootNorm.test_trivial: The trivial upstairs line maps to the root-Picard tensor unit.
Example TauCeti.RamifiedClassField.rootNorm.test_branch: Its chosen root at a branch point is precisely the upstairs fibre of L′.
Example TauCeti.RamifiedClassField.rootNorm.test_degree: The norm of a degree-one upstairs line has degree one, while pullback of a degree-one downstairs
line has degree two.

Node FunctionFieldArithmeticPartII:GC.6/root-norm-surjective
Nm^√R:ν_*G_m,X′→G_m,X^√R is surjective as an étale sheaf under the odd-characteristic double-cover
hypotheses.

Node FunctionFieldArithmeticPartII:GC.6/norm-kernel
As étale sheaves, ker Nm^√R is the image of u↦u/(σu), and ker(1−σ)=G_m,X inside ν_*G_m,X′. At
ramification a root-normalized norm-one u has residue one, so w=1+u is locally a unit and u=w/(σw).

Node FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex
The étale sheaf complex 1→G_m,X→ν_*G_m,X′→^{1−σ}ν_*G_m,X′→^{Nm^√R}G_m,X^√R→1 is exact, with
specified zero composites. Passing to torsor groupoids requires its connecting obstruction data;
this theorem does not claim a short exact sequence of Picard groups.

Node FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions
Let K=ker Nm^√R. Interpret the exact sheaf complex as the two short exact sequences G_m→ν_*G_m→K and
K→ν_*G_m→G_m^√R, and apply their derived cohomology and torsor descent. Any Picard-stack exactness
statement must specify the connecting maps, coherent norm trivializations and effectiveness
obstructions, rather than replacing the result by an ordinary kernel of 1−σ on line-bundle classes.

Node FunctionFieldArithmeticPartII:GC.6/hat-root-norm
Send (L′,a′) on X′ to (Nm L′,L′|_{R′},ι,Nm a′,a′|_{R′}) on hatX_d^√R. It commutes with hat
Abel–Jacobi and the root norm, and restricts to effective sections.
API TauCeti.RamifiedClassField.hatRootNorm.object: The root line and root section are L′|_{R′} and a′|_{R′}.
API TauCeti.RamifiedClassField.hatRootNorm.abelJacobi: hatAJ∘hatNorm≅rootNorm∘hatAJ′.
API TauCeti.RamifiedClassField.hatRootNorm.effective: A fibrewise-nonzero upstairs section gives a fibrewise-nonzero norm section.
Example TauCeti.RamifiedClassField.hatRootNorm.test_zero: A zero section maps to a zero global and root section.
Example TauCeti.RamifiedClassField.hatRootNorm.test_branch: At ramification the norm section restricts to the square of a′|_{R′}.
Example TauCeti.RamifiedClassField.hatRootNorm.test_ordinary: Forgetting roots recovers the ordinary norm on section spaces.

Node FunctionFieldArithmeticPartII:GC.6/quadratic-input
For the geometrically connected double cover, ν_*Q̄ℓ decomposes into the ± eigensheaves of σ; its
anti-invariant restriction to U is rank one, geometrically nontrivial and has inertia −1 exactly at
R. Extend it to the root curve through the tame correspondence. The parent’s arithmetic reciprocity
gives η_{F′/F}:F×\A_F×→{±1}, which is trivial on the image of O_{√R}×.
API TauCeti.RamifiedClassField.quadraticInput.antiInvariant: The input on U is the −1 eigensheaf of ν_*Q̄ℓ.
API TauCeti.RamifiedClassField.quadraticInput.inertia: Every ramified inertia generator acts by −1.
API TauCeti.RamifiedClassField.quadraticInput.ideleCharacter: The arithmetic character factors through the root-unit idele quotient.
Example TauCeti.RamifiedClassField.quadraticInput.test_split_point: At a split unramified point the local Frobenius trace is +1.
Example TauCeti.RamifiedClassField.quadraticInput.test_inert_point: At an inert unramified point the local Frobenius trace is −1.
Example TauCeti.RamifiedClassField.quadraticInput.test_geometric_connectedness: A constant quadratic cover is excluded from the geometrically nontrivial input assertion.

Node FunctionFieldArithmeticPartII:GC.6/trace-character
The Frobenius trace of L^Pic is a multiplicative Q̄ℓ×-valued function on isomorphism classes of
Pic_X^√R(k), normalized to one at the tensor unit. Via the adelic equivalence it defines an idele
character. For general input L its range is not restricted to {±1}.

Node FunctionFieldArithmeticPartII:GC.6/closed-point-trace
For a closed point x∈U of degree δ, Tr(Fr_k,(L_δ)_{[x]})=Tr(Fr_x,L_x). On the tensor of δ conjugate
rank-one fibres, Frobenius cyclically permutes factors and applies Fr_x on the wrapped factor.

Node FunctionFieldArithmeticPartII:GC.6/away-ramification-generation
Every class of the root-Picard idele groupoid is a difference of canonical root-divisor classes
supported on U, after multiplying by the modified-unit image. Thus a normalized idele character is
determined by its values on π_x⁻¹ for x∈U.

Node FunctionFieldArithmeticPartII:GC.6/quadratic-trace
For the geometrically connected double cover, the Frobenius trace of its all-degree root-Picard
character sheaf equals η_{F′/F} under the adelic groupoid equivalence, with π_x⁻¹↔O_X(x)^♮ and
geometric Frobenius. At unramified x the value is +1 for split x and −1 for inert x.

Node FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent
For every positive n and line bundle with section (L,s), the finite root-object pseudofunctor is a
stack for the pinned fpqc topology, including on scheme test objects over a stack base. Thus its
fppf restriction and its fpqc construction give the same root objects and arrows on every test
scheme; the stronger descent assertion is a theorem, not an automatic change of topology.

Node FunctionFieldArithmeticPartII:RS.2/factorial-root-limit
Restriction of compatible root systems from all positive divisibility indices to 1!,2!,3!,… is an
equivalence of groupoids, naturally over every test scheme. It preserves actual root arrows and
transition isomorphisms, not merely their isomorphism classes.

Node FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit
Over a field k let G=lim_(n|m) μ_n in the fpqc topology, with transition μ_(nm)→μ_n given by the mth
power. The groupoid of fpqc G-torsors is equivalent to the two-limit of the groupoids of finite
μ_n-torsors, with specified quotient comparisons and their cocycles. No finite-presentation or
etale-local-triviality assertion for G is made.

Node FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection
Two compatible finite μ_n-torsor towers over a field k are isomorphic if their n-th torsors are
isomorphic for every positive n. Individual finite-stage isomorphisms need not be chosen compatibly
in advance.

Node FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift
Every element of lim_n H1_fppf(k,μ_n) is the finite-stage class family of a coherent finite torsor
tower, hence of an fpqc G-torsor. Compatible classes are converted to actual quotient isomorphisms,
rather than treated as a preexisting compatible object.

Node FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient
For B_n=A[T]/(T^n−f) with the displayed divisibility maps, put B_infinity=colim_n B_n and G=lim_n
μ_n, with its diagonalizable grading action. The infinite root stack of (O_A,f) is [Spec
B_infinity/G] as an fpqc quotient stack. Its morphism groupoids and finite projections agree with
the two-limit of the finite roots. This is not asserted to be an algebraic stack of finite
presentation.

Node FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf
Over Q, the compatible finite torsors P_n=Spec Q[T]/(T^n−2) define an fpqc G=lim_n μ_n torsor
P_infinity. It has no section after any nonempty fppf Q-cover. Each individual P_n is fppf-locally
trivial, so replacing all infinite torsors by fppf-locally trivial G-torsors loses this point of the
infinite classifying gerbe.

-/


/-! Root-specific coordinate comparisons. These native signatures are uncompiled.
The coordinate and unit-section abbreviations below only expose the existing
freePUnitIsoUnit and freeSection maps; they are not substitute geometric types. -/
namespace TauCeti.RootStack

variable {X : Scheme.{u}}

private abbrev trivialSectionUnit :
    Section (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :=
  (SheafOfModules.freeSection (R := X.ringCatSheaf) PUnit.unit).val
    (Opposite.op (⊤ : X.Opens))

private abbrev trivialSectionCoordinate
    (v : Section (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)) : Γ(X, ⊤) :=
  (TauCeti.SheafOfModules.freePUnitIsoUnit X.ringCatSheaf).hom.val.app
    (Opposite.op (⊤ : X.Opens)) v

def tensorPower.trivialIso (n : ℕ) :
    tensorPower (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) n ≅
      TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X := by sorry

lemma tensorPower.trivialIso_zero :
    tensorPower.trivialIso (X := X) 0 = Iso.refl _ := by sorry

lemma tensorPower.trivialIso_succ (n : ℕ) :
    tensorPower.trivialIso (X := X) (n + 1) =
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft
        (tensorPower.trivialIso n) ≪≫
      TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso
        (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) := by sorry

lemma tensorPower.trivialIso_unit (n : ℕ) :
    trivialSectionCoordinate (mapSection (tensorPower.trivialIso n)
      (sectionPower (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) n
        trivialSectionUnit)) = 1 := by sorry

-- tensorPower.trivialIso_test_zero
example : tensorPower.trivialIso (X := X) 0 = Iso.refl _ := by sorry

-- tensorPower.trivialIso_test_one
example : tensorPower.trivialIso (X := X) 1 =
    TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) := by sorry

-- tensorPower.trivialIso_test_two
example (v : Section (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)) :
    trivialSectionCoordinate (mapSection (tensorPower.trivialIso 2)
      (sectionPower (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) 2 v)) =
      trivialSectionCoordinate v ^ 2 := by sorry

lemma sectionPower.in_trivialization
    (M : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (e : M ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (v : Section M) (n : ℕ) :
    trivialSectionCoordinate (mapSection
      (tensorPower.mapIso n e ≪≫ tensorPower.trivialIso n) (sectionPower M n v)) =
      trivialSectionCoordinate (mapSection e v) ^ n := by sorry

-- This coefficient is the image of the native unit section, not an assumption.
private abbrev rootPowerCoefficient {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) : Γ(X, ⊤) :=
  trivialSectionCoordinate (mapSection
    ((tensorPower.trivialIso n).symm ≪≫ tensorPower.mapIso n e.symm ≪≫
      a.powerIso ≪≫ l) trivialSectionUnit)

lemma RootObject.powerIdentification_isUnit {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    IsUnit (rootPowerCoefficient a e l) ∧
      ∀ v : Section (tensorPower a.line n),
        trivialSectionCoordinate (mapSection (a.powerIso ≪≫ l) v) =
          rootPowerCoefficient a e l *
            trivialSectionCoordinate (mapSection
              (tensorPower.mapIso n e ≪≫ tensorPower.trivialIso n) v) := by sorry

theorem RootObject.trivializationEquation {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    IsUnit (rootPowerCoefficient a e l) ∧
      rootPowerCoefficient a e l *
        trivialSectionCoordinate (mapSection e a.rootSection) ^ n =
          trivialSectionCoordinate (mapSection l s) := by sorry

-- RootObject.test_trivialization: the omitted comparison now has a native signature.
example {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a : RootObject n L s)
    (e : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    ∃ u : Γ(X, ⊤)ˣ, (u : Γ(X, ⊤)) = rootPowerCoefficient a e l ∧
      (u : Γ(X, ⊤)) * trivialSectionCoordinate (mapSection e a.rootSection) ^ n =
        trivialSectionCoordinate (mapSection l s) := by sorry

lemma RootObject.arrow_scalar_equations {n : ℕ} [NeZero n]
    {L : TauCeti.AlgebraicGeometry.InvertibleSheaf X} {s : Section L}
    (a b : RootObject n L s) (h : RootObject.iso a b)
    (ea : a.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (eb : b.line ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X)
    (l : L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X) :
    ∃ w : Γ(X, ⊤)ˣ,
      trivialSectionCoordinate (mapSection eb b.rootSection) =
        (w : Γ(X, ⊤)) * trivialSectionCoordinate (mapSection ea a.rootSection) ∧
      rootPowerCoefficient b eb l * (w : Γ(X, ⊤)) ^ n =
        rootPowerCoefficient a ea l := by sorry

end TauCeti.RootStack

/-!
## Finite affine torsor comparison: kernel and cokernel

Continuation for issue #3403, ChatGPT — gpt-6astra-20261002-c4d9.
These are native algebraic candidates for RS.1/affine-chart and the finite
frame-torsor input to RS.2/kummer-torsor-limit. They use the existing affine
ring and Hopf coaction, not a replacement group scheme or torsor predicate.
The handoff gives their proofs and their exact packet-integration boundary.
No algebraic-stack or infinite-torsor signature is supplied by this fragment.
The full file is NOT COMPILED. The suggested declarations are admitted
under PROTOCOL §13. Separate Mathlib-only proof-prototype checks are recorded in the handoff.
-/
namespace TauCeti.RootStack

section AffineTorsorComparison

variable {A : Type u} [CommRing A]
open scoped TensorProduct

/-- The action comparison on coordinate algebras, with the unchanged right
factor. Its formula on pure tensors is specified below. -/
def affineTorsorComparison (f : A) (n : ℕ) [NeZero n] :
    (AffineRing f n ⊗[A] AffineRing f n) →ₐ[A]
      (MuHopf A n ⊗[A] AffineRing f n) := by
  sorry

lemma affineTorsorComparison.tmul (f : A) (n : ℕ) [NeZero n]
    (x y : AffineRing f n) :
    affineTorsorComparison f n (x ⊗ₜ[A] y) =
      affineCoaction f n x * ((1 : MuHopf A n) ⊗ₜ[A] y) := by
  sorry

lemma affineTorsorComparison.left_root (f : A) (n : ℕ) [NeZero n] :
    affineTorsorComparison f n
      (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ⊗ₜ[A]
        (1 : AffineRing f n)) =
      MonoidAlgebra.single (TauCeti.RootsOfUnityGroup.generator n) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) := by
  sorry

lemma affineTorsorComparison.right_factor (f : A) (n : ℕ) [NeZero n]
    (y : AffineRing f n) :
    affineTorsorComparison f n ((1 : AffineRing f n) ⊗ₜ[A] y) =
      (1 : MuHopf A n) ⊗ₜ[A] y := by
  sorry

lemma affineTorsorComparison.unique (f : A) (n : ℕ) [NeZero n]
    (h : (AffineRing f n ⊗[A] AffineRing f n) →ₐ[A]
      (MuHopf A n ⊗[A] AffineRing f n))
    (hh : ∀ x y : AffineRing f n,
      h (x ⊗ₜ[A] y) = affineCoaction f n x * ((1 : MuHopf A n) ⊗ₜ[A] y)) :
    h = affineTorsorComparison f n := by
  sorry

/-- Weighted permutation formula in the native monic tensor bases.
No division by n, reducedness, or unit condition on f is used. -/
lemma affineTorsorComparison.monomial (f : A) (n : ℕ) [NeZero n]
    (i j : Fin n) :
    affineTorsorComparison f n
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ i.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ j.val)) =
      f ^ ((i.val + j.val) / n) •
        (MonoidAlgebra.single (Multiplicative.ofAdd (i.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^
            ((i.val + j.val) % n))) := by
  sorry

/-- Every source tensor has unique monic-basis coefficients, including over
the zero ring. In that case use the unique coefficient function directly. -/
lemma affineTorsorComparison.source_coordinates (f : A) (n : ℕ) [NeZero n]
    (z : AffineRing f n ⊗[A] AffineRing f n) :
    ∃! c : (Fin n × Fin n) → A,
      z = ∑ p : Fin n × Fin n, c p •
        ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by sorry

/-- Character basis in the first factor and monic basis in the second. -/
lemma affineTorsorComparison.target_coordinates (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n) :
    ∃! c : (Fin n × Fin n) → A,
      z = ∑ p : Fin n × Fin n, c p •
        (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by sorry

/-- The actual finite coefficient equivalence, fixed by the original tensor
monomials. This includes the subsingleton coefficient ring. -/
def affineTorsorComparison.sourceCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    (AffineRing f n ⊗[A] AffineRing f n) ≃ₗ[A] ((Fin n × Fin n) → A) := by sorry

lemma affineTorsorComparison.sourceCoordinateEquiv_symm_apply (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    (affineTorsorComparison.sourceCoordinateEquiv f n).symm c =
      ∑ p, c p • ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by sorry

lemma affineTorsorComparison.sourceCoordinateEquiv_apply_sum (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    affineTorsorComparison.sourceCoordinateEquiv f n
      (∑ p, c p • ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) = c := by sorry

lemma affineTorsorComparison.sourceCoordinateEquiv_monomial (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    affineTorsorComparison.sourceCoordinateEquiv f n
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) =
      Pi.single p 1 := by sorry

/-- The character tensor coefficient equivalence uses every group-algebra
character, including in characteristic dividing n. -/
def affineTorsorComparison.targetCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    (MuHopf A n ⊗[A] AffineRing f n) ≃ₗ[A] ((Fin n × Fin n) → A) := by sorry

lemma affineTorsorComparison.targetCoordinateEquiv_symm_apply (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    (affineTorsorComparison.targetCoordinateEquiv f n).symm c =
      ∑ p, c p • (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by sorry

lemma affineTorsorComparison.targetCoordinateEquiv_apply_sum (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    affineTorsorComparison.targetCoordinateEquiv f n
      (∑ p, c p • (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) = c := by sorry

lemma affineTorsorComparison.targetCoordinateEquiv_monomial (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    affineTorsorComparison.targetCoordinateEquiv f n
      (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) =
      Pi.single p 1 := by sorry

-- affineTorsorComparison.sourceCoordinateEquiv.test_one
example (f : A) : affineTorsorComparison.sourceCoordinateEquiv f 1
    ((1 : AffineRing f 1) ⊗ₜ[A] (1 : AffineRing f 1)) = Pi.single (0, 0) 1 := by sorry

-- affineTorsorComparison.sourceCoordinateEquiv.test_zero_ring
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n]
    (z : AffineRing f n ⊗[A] AffineRing f n) :
    affineTorsorComparison.sourceCoordinateEquiv f n z = 0 := by sorry

-- affineTorsorComparison.sourceCoordinateEquiv.test_nonreduced
example : affineTorsorComparison.sourceCoordinateEquiv (2 : ZMod 4) 2
    (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4)) ⊗ₜ[ZMod 4]
      AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4))) (1, 1) = 1 := by sorry

-- affineTorsorComparison.targetCoordinateEquiv.test_one
example (f : A) : affineTorsorComparison.targetCoordinateEquiv f 1
    ((1 : MuHopf A 1) ⊗ₜ[A] (1 : AffineRing f 1)) = Pi.single (0, 0) 1 := by sorry

-- affineTorsorComparison.targetCoordinateEquiv.test_zero_ring
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n) :
    affineTorsorComparison.targetCoordinateEquiv f n z = 0 := by sorry

-- affineTorsorComparison.targetCoordinateEquiv.test_wild_character
example : affineTorsorComparison.targetCoordinateEquiv (0 : ZMod 2) 2
    (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 2) ⊗ₜ[ZMod 2]
      (1 : AffineRing (0 : ZMod 2) 2)) (1, 0) = 1 := by sorry

def affineTorsorComparison.coefficientPermutation (n : ℕ) [NeZero n] :
    (Fin n × Fin n) ≃ (Fin n × Fin n) := by sorry

lemma affineTorsorComparison.coefficientPermutation_apply (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    coefficientPermutation n p = (p.1, p.1 + p.2)  := by sorry

lemma affineTorsorComparison.coefficientPermutation_symm (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (coefficientPermutation n).symm p = (p.1, p.2 - p.1)  := by sorry

lemma affineTorsorComparison.wrap_iff_lower (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (coefficientPermutation n p).2.val < (coefficientPermutation n p).1.val ↔
      n ≤ p.1.val + p.2.val  := by sorry

-- affineTorsorComparison.coefficientPermutation.test_one
example (p : Fin 1 × Fin 1) : affineTorsorComparison.coefficientPermutation 1 p = p  := by sorry

-- affineTorsorComparison.coefficientPermutation.test_wrap
example : affineTorsorComparison.coefficientPermutation 2 (1,1) = (1,0)  := by sorry

-- affineTorsorComparison.coefficientPermutation.test_inverse
example : (affineTorsorComparison.coefficientPermutation 3).symm (2,0) = (2,1)  := by sorry

lemma affineTorsorComparison.coefficientPermutation_val (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (coefficientPermutation n p).2.val = (p.1.val + p.2.val) % n  := by sorry

lemma affineTorsorComparison.monomial_permuted (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    affineTorsorComparison f n
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) =
      (if (coefficientPermutation n p).2.val < p.1.val then f else 1) •
        (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^
            (coefficientPermutation n p).2.val))  := by sorry

lemma affineTorsorComparison.monomial_coordinates (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    targetCoordinateEquiv f n (affineTorsorComparison f n
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) =
      (if (coefficientPermutation n p).2.val < (coefficientPermutation n p).1.val
        then f else 1) • Pi.single (coefficientPermutation n p) 1  := by sorry

lemma affineTorsorComparison.coefficient_map (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) (q : Fin n × Fin n) :
    targetCoordinateEquiv f n
      (affineTorsorComparison f n ((sourceCoordinateEquiv f n).symm c)) q =
      (if q.2.val < q.1.val then f else 1) *
        c ((coefficientPermutation n).symm q)  := by sorry

/-- The nonwrapping source coefficients vanish; the wrapping coefficients
lie in the annihilator of f. This also specifies the kernel comparison map. -/
lemma affineTorsorComparison.kernel_coefficients (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    affineTorsorComparison f n
      (∑ p : Fin n × Fin n, c p •
        ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) = 0 ↔
      ∀ p : Fin n × Fin n,
        if p.1.val + p.2.val < n then c p = 0 else f * c p = 0 := by sorry

/-- Target coefficients below the diagonal, not all coefficients, must be
multiples of f. This specifies the cokernel quotient map. -/
lemma affineTorsorComparison.image_coefficients (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    (∑ p : Fin n × Fin n, c p •
      (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) ∈
      LinearMap.range (affineTorsorComparison f n).toLinearMap ↔
      ∀ p : Fin n × Fin n, p.2.val < p.1.val → ∃ a : A, c p = f * a := by sorry

/-- Kernel coefficients of an actual tensor, rather than a chosen presentation. -/
lemma affineTorsorComparison.kernel_coordinate_condition (f : A) (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison f n).toLinearMap)
    (p : Fin n × Fin n) :
    if p.1.val + p.2.val < n then sourceCoordinateEquiv f n z p = 0
      else f * sourceCoordinateEquiv f n z p = 0 := by
  sorry

/-- The specified kernel equivalence extracts wrapping coefficients; its inverse
extends an annihilator family by zero before native source synthesis. -/
noncomputable def affineTorsorComparison.kernelCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    (LinearMap.ker (affineTorsorComparison f n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // n ≤ p.1.val + p.2.val} →
        LinearMap.ker (f • (LinearMap.id : A →ₗ[A] A))) := by
  sorry

lemma affineTorsorComparison.kernelCoordinateEquiv_apply (f : A) (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison f n).toLinearMap)
    (p : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val}) :
    (kernelCoordinateEquiv f n z p : A) = sourceCoordinateEquiv f n z p.val := by
  sorry

lemma affineTorsorComparison.kernelCoordinateEquiv_symm_coordinates (f : A) (n : ℕ) [NeZero n]
    (d : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} →
      LinearMap.ker (f • (LinearMap.id : A →ₗ[A] A))) (p : Fin n × Fin n) :
    sourceCoordinateEquiv f n ((kernelCoordinateEquiv f n).symm d :
      AffineRing f n ⊗[A] AffineRing f n) p =
      if hp : n ≤ p.1.val + p.2.val then (d ⟨p, hp⟩ : A) else 0 := by
  sorry

lemma affineTorsorComparison.kernelCoordinateEquiv_nonwrap (f : A) (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison f n).toLinearMap)
    (p : Fin n × Fin n) (hp : p.1.val + p.2.val < n) :
    sourceCoordinateEquiv f n z p = 0 := by
  sorry

/-- Native kernel, indexed by the wrapping source pairs. The coordinate
formula specifies the equivalence, not just its abstract isomorphism class. -/
theorem affineTorsorComparison.kernel_equiv (f : A) (n : ℕ) [NeZero n] :
    ∃ e : (LinearMap.ker (affineTorsorComparison f n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // n ≤ p.1.val + p.2.val} →
        LinearMap.ker (f • (LinearMap.id : A →ₗ[A] A))),
      ∀ (z : LinearMap.ker (affineTorsorComparison f n).toLinearMap)
        (c : (Fin n × Fin n) → A)
        (_hc : (z : AffineRing f n ⊗[A] AffineRing f n) =
          ∑ p : Fin n × Fin n, c p •
            ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
              (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)))
        (p : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val}),
        (e z p : A) = c p.val := by
  sorry

/-- Lower target coefficients modulo the actual principal ideal. -/
noncomputable def affineTorsorComparison.cokernelResidue (f : A) (n : ℕ) [NeZero n] :
    (MuHopf A n ⊗[A] AffineRing f n) →ₗ[A]
      ({p : Fin n × Fin n // p.2.val < p.1.val} → A ⧸ Ideal.span ({f} : Set A)) := by
  sorry

lemma affineTorsorComparison.cokernelResidue_apply (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n)
    (p : {p : Fin n × Fin n // p.2.val < p.1.val}) :
    cokernelResidue f n z p =
      Ideal.Quotient.mk (Ideal.span ({f} : Set A)) (targetCoordinateEquiv f n z p.val) := by
  sorry

lemma affineTorsorComparison.cokernelResidue_surjective (f : A) (n : ℕ) [NeZero n] :
    Function.Surjective (cokernelResidue f n) := by
  sorry

lemma affineTorsorComparison.cokernelResidue_ker (f : A) (n : ℕ) [NeZero n] :
    LinearMap.ker (cokernelResidue f n) =
      LinearMap.range (affineTorsorComparison f n).toLinearMap := by
  sorry

/-- Native first-isomorphism equivalence, transported by the proved equality
of the residue kernel and the actual comparison range as A-submodules. -/
noncomputable def affineTorsorComparison.cokernelCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    ((MuHopf A n ⊗[A] AffineRing f n) ⧸
      LinearMap.range (affineTorsorComparison f n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // p.2.val < p.1.val} → A ⧸ Ideal.span ({f} : Set A)) := by
  sorry

lemma affineTorsorComparison.cokernelCoordinateEquiv_mk (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n)
    (p : {p : Fin n × Fin n // p.2.val < p.1.val}) :
    cokernelCoordinateEquiv f n (Submodule.Quotient.mk z) p =
      Ideal.Quotient.mk (Ideal.span ({f} : Set A)) (targetCoordinateEquiv f n z p.val) := by
  sorry

lemma affineTorsorComparison.cokernelCoordinateEquiv_symm_residue (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n) :
    (cokernelCoordinateEquiv f n).symm (cokernelResidue f n z) =
      Submodule.Quotient.mk z := by
  sorry

lemma affineTorsorComparison.cokernelCoordinateEquiv_eq_iff (f : A) (n : ℕ) [NeZero n]
    (z w : MuHopf A n ⊗[A] AffineRing f n) :
    (Submodule.Quotient.mk z : (MuHopf A n ⊗[A] AffineRing f n) ⧸
      LinearMap.range (affineTorsorComparison f n).toLinearMap) = Submodule.Quotient.mk w ↔
      cokernelResidue f n z = cokernelResidue f n w := by
  sorry

/-- Native module cokernel, indexed by the strictly lower triangular target
pairs. Its formula is the quotient of exactly those coefficients modulo f.
This is not a quotient algebra or an orbit-space construction. -/
theorem affineTorsorComparison.cokernel_equiv (f : A) (n : ℕ) [NeZero n] :
    ∃ e : ((MuHopf A n ⊗[A] AffineRing f n) ⧸
      LinearMap.range (affineTorsorComparison f n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // p.2.val < p.1.val} →
        A ⧸ (Ideal.span ({f} : Set A))),
      ∀ (c : (Fin n × Fin n) → A)
        (p : {p : Fin n × Fin n // p.2.val < p.1.val}),
        e (Submodule.Quotient.mk (∑ q : Fin n × Fin n, c q •
          (MonoidAlgebra.single (Multiplicative.ofAdd (q.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
            (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ q.2.val)))) p =
          Ideal.Quotient.mk (Ideal.span ({f} : Set A)) (c p.val) := by
  sorry

theorem affineTorsorComparison.injective_iff (f : A) (n : ℕ) [NeZero n] :
    Function.Injective (affineTorsorComparison f n) ↔
      n = 1 ∨ Function.Injective (fun a : A => f * a) := by sorry

theorem affineTorsorComparison.surjective_iff (f : A) (n : ℕ) [NeZero n] :
    Function.Surjective (affineTorsorComparison f n) ↔ n = 1 ∨ IsUnit f := by sorry

theorem affineTorsorComparison.bijective_iff (f : A) (n : ℕ) [NeZero n] :
    Function.Bijective (affineTorsorComparison f n) ↔ n = 1 ∨ IsUnit f := by sorry

/-- The inverse of the root on a specified unit chart. -/
lemma affineRoot.unit_mul_inverse (v : Aˣ) (n : ℕ) [NeZero n] :
    AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) *
      (algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) = 1 := by
  sorry

/-- The actual comparison promoted to an algebra equivalence on the unit locus. -/
def affineTorsorComparison.unitEquiv (v : Aˣ) (n : ℕ) [NeZero n] :
    (AffineRing (v : A) n ⊗[A] AffineRing (v : A) n) ≃ₐ[A]
      (MuHopf A n ⊗[A] AffineRing (v : A) n) := by
  sorry

lemma affineTorsorComparison.unitEquiv_toAlgHom (v : Aˣ) (n : ℕ) [NeZero n] :
    (affineTorsorComparison.unitEquiv v n).toAlgHom =
      affineTorsorComparison (v : A) n := by
  sorry

lemma affineTorsorComparison.unitEquiv_symm_character (v : Aˣ) (n : ℕ) [NeZero n] :
    (affineTorsorComparison.unitEquiv v n).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing (v : A) n)) =
      AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ⊗ₜ[A]
        (algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
          AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) := by
  sorry

lemma affineTorsorComparison.unitEquiv_symm_right (v : Aˣ) (n : ℕ) [NeZero n]
    (b : AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm
      ((1 : MuHopf A n) ⊗ₜ[A] b) = (1 : AffineRing (v : A) n) ⊗ₜ[A] b := by
  sorry

/-- The inverse on every native character/right-factor tensor. -/
lemma affineTorsorComparison.unitEquiv_symm_character_tmul (v : Aˣ) (n : ℕ)
    [NeZero n] (i : ℕ) (b : AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) ⊗ₜ[A] b) =
      (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ i) ⊗ₜ[A]
        ((algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
          AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) ^ i * b) := by
  sorry

/-- The algebra equivalence is fixed by the original comparison and the
inverse image of the character generator. This includes characteristic
which divides n; no inverse of n occurs. -/
theorem affineTorsorComparison.unit_inverse (v : Aˣ) (n : ℕ) [NeZero n] :
    ∃ e : (AffineRing (v : A) n ⊗[A] AffineRing (v : A) n) ≃ₐ[A]
        (MuHopf A n ⊗[A] AffineRing (v : A) n),
      e.toAlgHom = affineTorsorComparison (v : A) n ∧
      e.symm (MonoidAlgebra.single (TauCeti.RootsOfUnityGroup.generator n) (1 : A) ⊗ₜ[A]
        (1 : AffineRing (v : A) n)) =
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ⊗ₜ[A]
          (algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
            AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) ∧
      ∀ b : AffineRing (v : A) n,
        e.symm ((1 : MuHopf A n) ⊗ₜ[A] b) = (1 : AffineRing (v : A) n) ⊗ₜ[A] b := by sorry

/-- Determinant of the matrix supplied by the monomial formula. The same
pair ordering is used on rows and columns. -/
theorem affineTorsorComparison.determinant (f : A) (n : ℕ) [NeZero n] :
    let M : Matrix (Fin n × Fin n) (Fin n × Fin n) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % n
        then f ^ ((c.1.val + c.2.val) / n) else 0
    Matrix.det M = (-1 : A) ^ ((n - 1) * (n * (n - 1) / 2)) *
      f ^ (n * (n - 1) / 2) := by sorry

/-- Restrict the actual cyclic coefficient permutation to the killed columns. -/
def affineTorsorComparison.wrappingEquiv (n : ℕ) [NeZero n] :
    {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} ≃
      {q : Fin n × Fin n // q.2.val < q.1.val} := by
  sorry
lemma affineTorsorComparison.wrappingEquiv_apply (n : ℕ) [NeZero n]
    (p : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val}) :
    (wrappingEquiv n p).val = coefficientPermutation n p.val := by
  sorry
lemma affineTorsorComparison.wrappingEquiv_symm (n : ℕ) [NeZero n]
    (q : {q : Fin n × Fin n // q.2.val < q.1.val}) :
    ((wrappingEquiv n).symm q).val = (coefficientPermutation n).symm q.val := by
  sorry
lemma affineTorsorComparison.wrappingEquiv_injective (n : ℕ) [NeZero n] :
    Function.Injective (wrappingEquiv n) := by
  sorry
lemma affineTorsorComparison.lower_card (n : ℕ) :
    Fintype.card {q : Fin n × Fin n // q.2.val < q.1.val} =
      n * (n - 1) / 2 := by
  sorry
lemma affineTorsorComparison.wrapping_card (n : ℕ) [NeZero n] :
    Fintype.card {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} =
      n * (n - 1) / 2 := by
  sorry
/-- At zero the specified native kernel coordinates have arbitrary A-values. -/
noncomputable def affineTorsorComparison.kernelZeroEquiv (n : ℕ) [NeZero n] :
    (LinearMap.ker (affineTorsorComparison (0 : A) n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // n ≤ p.1.val + p.2.val} → A) := by
  sorry
lemma affineTorsorComparison.kernelZeroEquiv_apply (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison (0 : A) n).toLinearMap)
    (p : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val}) :
    kernelZeroEquiv n z p = sourceCoordinateEquiv (0 : A) n z p.val := by
  sorry
lemma affineTorsorComparison.kernelZeroEquiv_injective (n : ℕ) [NeZero n] :
    Function.Injective (kernelZeroEquiv (A := A) n) := by
  sorry
lemma affineTorsorComparison.kernelZeroEquiv_symm_coordinates (n : ℕ) [NeZero n]
    (d : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} → A) (p : Fin n × Fin n) :
    sourceCoordinateEquiv (0 : A) n ((kernelZeroEquiv n).symm d :
      AffineRing (0 : A) n ⊗[A] AffineRing (0 : A) n) p =
      if hp : n ≤ p.1.val + p.2.val then d ⟨p, hp⟩ else 0 := by
  sorry
lemma affineTorsorComparison.source_finrank (k : Type u) [Field k]
    (f : k) (n : ℕ) [NeZero n] :
    Module.finrank k (AffineRing f n ⊗[k] AffineRing f n) = n * n := by
  sorry
lemma affineTorsorComparison.kernel_zero_finrank (k : Type u) [Field k]
    (n : ℕ) [NeZero n] :
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n - 1) / 2 := by
  sorry
lemma affineTorsorComparison.range_zero_finrank (k : Type u) [Field k]
    (n : ℕ) [NeZero n] :
    Module.finrank k (LinearMap.range (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n + 1) / 2 := by
  sorry

/-- At the zero section over a field the loss of rank is exactly triangular. -/
theorem affineTorsorComparison.zero_rank (k : Type u) [Field k]
    (n : ℕ) [NeZero n] :
    Module.finrank k (LinearMap.range (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n + 1) / 2 ∧
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n - 1) / 2 := by sorry

-- affineTorsorComparison.test_exponent_one: no unit condition on f.
example (f : A) : Function.Bijective (affineTorsorComparison f 1) := by sorry

-- affineTorsorComparison.test_zero_ring: the usual zero-ring unit convention.
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n] :
    Function.Bijective (affineTorsorComparison f n) := by sorry

-- affineTorsorComparison.test_branch_kernel: an actual nonzero source tensor.
example (k : Type u) [Field k] :
    let x := AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k))
    x ⊗ₜ[k] x ≠ 0 ∧ affineTorsorComparison (0 : k) 2 (x ⊗ₜ[k] x) = 0 := by sorry

-- affineTorsorComparison.test_regular_nonunit: injective does not mean torsor.
example : Function.Injective (affineTorsorComparison (2 : ℤ) 2) ∧
    ¬ Function.Surjective (affineTorsorComparison (2 : ℤ) 2) := by sorry

-- affineTorsorComparison.test_nilpotent_parameter: nonzero f is not enough.
example :
    let x := AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4))
    let z := (2 : ZMod 4) • (x ⊗ₜ[ZMod 4] x)
    z ≠ 0 ∧ affineTorsorComparison (2 : ZMod 4) 2 z = 0 := by sorry

-- affineTorsorComparison.test_wild_unit: the chart is a torsor despite its
-- nonzero nilpotent and despite 2 not being invertible in the base field.
example :
    let x := AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 2))
    Function.Bijective (affineTorsorComparison (1 : ZMod 2) 2) ∧
      x - 1 ≠ 0 ∧ (x - 1) ^ 2 = 0 := by sorry

-- affineTorsorComparison.test_nonflat_kernel: coordinate maps base change,
-- but their kernels need not commute with the nonflat coefficient change Z→F2.
example : Function.Injective (affineTorsorComparison (2 : ℤ) 2) ∧
    ¬ Function.Injective (affineTorsorComparison (0 : ZMod 2) 2) := by sorry

-- affineTorsorComparison.test_cokernel_nonreduced: retain A/(f), not
-- its reduction. The quotient for f=4 over Z/8 has an element of order four.
example :
    let C := ((MuHopf (ZMod 8) 2 ⊗[ZMod 8] AffineRing (4 : ZMod 8) 2) ⧸
      LinearMap.range (affineTorsorComparison (4 : ZMod 8) 2).toLinearMap)
    Nonempty (C ≃ₗ[ZMod 8]
      ((ZMod 8) ⧸ (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8))))) ∧
      ∃ z : C, (2 : ZMod 8) • z ≠ 0 ∧ (4 : ZMod 8) • z = 0 := by sorry

end AffineTorsorComparison
end TauCeti.RootStack

/-! Module quotient acceptance computations. -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct

-- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv.test_one
example (f : A) (z : LinearMap.ker (affineTorsorComparison f 1).toLinearMap) : z = 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv.test_nonreduced
example :
    let d : {p : Fin 2 × Fin 2 // 2 ≤ p.1.val + p.2.val} →
      LinearMap.ker ((2 : ZMod 4) • (LinearMap.id : ZMod 4 →ₗ[ZMod 4] ZMod 4)) :=
      fun _ => ⟨2, by change (2 : ZMod 4) * 2 = 0; decide⟩
    let z := (affineTorsorComparison.kernelCoordinateEquiv (2 : ZMod 4) 2).symm d
    (z : AffineRing (2 : ZMod 4) 2 ⊗[ZMod 4] AffineRing (2 : ZMod 4) 2) ≠ 0 ∧
      affineTorsorComparison.sourceCoordinateEquiv (2 : ZMod 4) 2 z (1,1) = 2 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv.test_branch
example (k : Type u) [Field k] :
    let d : {p : Fin 2 × Fin 2 // 2 ≤ p.1.val + p.2.val} →
      LinearMap.ker ((0 : k) • (LinearMap.id : k →ₗ[k] k)) :=
      fun _ => ⟨1, by simp⟩
    affineTorsorComparison.sourceCoordinateEquiv (0 : k) 2
      ((affineTorsorComparison.kernelCoordinateEquiv (0 : k) 2).symm d) (1,1) = 1 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.cokernelResidue.test_one
example (f : A) (z : MuHopf A 1 ⊗[A] AffineRing f 1) :
    affineTorsorComparison.cokernelResidue f 1 z = 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.cokernelResidue.test_upper
example (f : A) :
    affineTorsorComparison.cokernelResidue f 2
      (MonoidAlgebra.single (Multiplicative.ofAdd (0 : ZMod 2)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing f 2)) = 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.cokernelResidue.test_lower
example (f : A) :
    affineTorsorComparison.cokernelResidue f 2
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing f 2)) ⟨(1,0), by decide⟩ =
      Ideal.Quotient.mk (Ideal.span ({f} : Set A)) 1 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv.test_one
example (f : A) (z : (MuHopf A 1 ⊗[A] AffineRing f 1) ⧸
    LinearMap.range (affineTorsorComparison f 1).toLinearMap) : z = 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv.test_regular_nonunit
example :
    let z := (Submodule.Quotient.mk
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ℤ) ⊗ₜ[ℤ]
        (1 : AffineRing (2 : ℤ) 2)) :
      (MuHopf ℤ 2 ⊗[ℤ] AffineRing (2 : ℤ) 2) ⧸
        LinearMap.range (affineTorsorComparison (2 : ℤ) 2).toLinearMap)
    z ≠ 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv.test_nonreduced
example :
    let z := (Submodule.Quotient.mk
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 8) ⊗ₜ[ZMod 8]
        (1 : AffineRing (4 : ZMod 8) 2)) :
      (MuHopf (ZMod 8) 2 ⊗[ZMod 8] AffineRing (4 : ZMod 8) 2) ⧸
        LinearMap.range (affineTorsorComparison (4 : ZMod 8) 2).toLinearMap)
    (2 : ZMod 8) • z ≠ 0 ∧ (4 : ZMod 8) • z = 0 := by
  sorry


end TauCeti.RootStack

-- Native acceptance computations for the coaction proof continuation.
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct
-- TauCeti.RootStack.affineRoot.pow_eq.test_wild_branch
example : AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : ZMod 2)) ^ 2 = 0 := by
  sorry

-- TauCeti.RootStack.affineRoot.pow_eq.test_regular_nonunit
example : AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ℤ)) ^ 4 =
    algebraMap ℤ (AffineRing (2 : ℤ) 2) 4 := by
  sorry

-- TauCeti.RootStack.affineRoot.pow_reduce.test_nilpotent
example : AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4)) ^ 4 = 0 := by
  sorry

-- TauCeti.RootStack.affineCharacter.pow.test_wild_order
example : (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 2)) ^ 2 = 1 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.test_branch_image
example (f : A) :
    affineTorsorComparison f 2
      (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      f • (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing f 2)) := by
  sorry

end TauCeti.RootStack

/-! Unit chart acceptance computations. -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_one
example (v : Aˣ) :
    (affineTorsorComparison.unitEquiv v 1).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 1)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing (v : A) 1)) = 1 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_wild
example :
    (affineTorsorComparison.unitEquiv (1 : (ZMod 2)ˣ) 2).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 2) ⊗ₜ[ZMod 2]
        (1 : AffineRing (1 : ZMod 2) 2)) =
      AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 2)) ⊗ₜ[ZMod 2]
        AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 2)) := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_coefficient
example :
    let v : (ZMod 5)ˣ := ⟨2,3,by decide,by decide⟩
    (affineTorsorComparison.unitEquiv v 2).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 5) ⊗ₜ[ZMod 5]
        (1 : AffineRing (2 : ZMod 5) 2)) =
      AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 5)) ⊗ₜ[ZMod 5]
        (algebraMap (ZMod 5) (AffineRing (2 : ZMod 5) 2) 3 *
          AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 5))) := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_zero_ring
example [Subsingleton A] (v : Aˣ) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm z = 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_right_factor
example (v : Aˣ) (n : ℕ) [NeZero n] (b : AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm
      ((1 : MuHopf A n) ⊗ₜ[A] b) = (1 : AffineRing (v : A) n) ⊗ₜ[A] b := by
  sorry

end TauCeti.RootStack

/-! Zero-section rank acceptance computations. -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct

-- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_one
example : Fintype.card {p : Fin 1 × Fin 1 // 1 ≤ p.1.val + p.2.val} = 0 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_two
example : (affineTorsorComparison.wrappingEquiv 2 ⟨(1,1), by decide⟩).val = (1,0) := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_inverse
example : ((affineTorsorComparison.wrappingEquiv 3).symm ⟨(2,0), by decide⟩).val = (2,1) := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.lower_card.test_zero
example : Fintype.card {q : Fin 0 × Fin 0 // q.2.val < q.1.val} = 0 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.lower_card.test_three
example : Fintype.card {q : Fin 3 × Fin 3 // q.2.val < q.1.val} = 3 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.wrapping_card.test_three
example : Fintype.card {p : Fin 3 × Fin 3 // 3 ≤ p.1.val + p.2.val} = 3 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_one
example (z : LinearMap.ker (affineTorsorComparison (0 : A) 1).toLinearMap) : z = 0 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_nonreduced
example :
    let d : {p : Fin 2 × Fin 2 // 2 ≤ p.1.val + p.2.val} → ZMod 4 := fun _ => 2
    let z := (affineTorsorComparison.kernelZeroEquiv 2).symm d
    affineTorsorComparison.sourceCoordinateEquiv (0 : ZMod 4) 2 z (1,1) = 2 ∧
      affineTorsorComparison.sourceCoordinateEquiv (0 : ZMod 4) 2 z (0,0) = 0 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_zero_ring
example (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison (0 : ZMod 1) n).toLinearMap) :
    affineTorsorComparison.kernelZeroEquiv n z = 0 := Subsingleton.elim _ _
-- TauCeti.RootStack.affineTorsorComparison.source_finrank.test_two
example (k : Type u) [Field k] (f : k) :
    Module.finrank k (AffineRing f 2 ⊗[k] AffineRing f 2) = 4 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.kernel_zero_finrank.test_one
example (k : Type u) [Field k] :
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) 1).toLinearMap) = 0 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.range_zero_finrank.test_wild
section
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩
example :
    Module.finrank (ZMod 3) (LinearMap.range (affineTorsorComparison (0 : ZMod 3) 3).toLinearMap) = 6 := by
  sorry
end
-- TauCeti.RootStack.affineTorsorComparison.zero_rank.test_two
example (k : Type u) [Field k] :
    Module.finrank k (LinearMap.range (affineTorsorComparison (0 : k) 2).toLinearMap) = 3 ∧
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) 2).toLinearMap) = 1 := by
  sorry
-- TauCeti.RootStack.affineTorsorComparison.zero_rank.test_four
example :
    Module.finrank ℚ (LinearMap.range (affineTorsorComparison (0 : ℚ) 4).toLinearMap) = 10 ∧
    Module.finrank ℚ (LinearMap.ker (affineTorsorComparison (0 : ℚ) 4).toLinearMap) = 6 := by
  sorry
end TauCeti.RootStack

/- BEGIN NATIVE ROOT DETERMINANT DEPENDENCIES -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]

lemma affineTorsorComparison.coefficientPermutation_rows (n : ℕ) [NeZero n] :
    coefficientPermutation n = Equiv.prodCongrRight (fun i : Fin n => finCycle i) := by
  sorry

lemma affineTorsorComparison.coefficientPermutation_sign (n : ℕ) [NeZero n] :
    Equiv.Perm.sign (coefficientPermutation n) =
      (-1 : ℤˣ) ^ ((n - 1) * (n * (n - 1) / 2)) := by
  sorry

lemma affineTorsorComparison.weight_exponent (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (p.1.val + p.2.val) / n = if n ≤ p.1.val + p.2.val then 1 else 0 := by
  sorry

lemma affineTorsorComparison.weight_product (f : A) (n : ℕ) [NeZero n] :
    (∏ p : Fin n × Fin n, f ^ ((p.1.val + p.2.val) / n)) =
      f ^ (n * (n - 1) / 2) := by
  sorry

lemma affineTorsorComparison.matrix_reindex (f : A) (n : ℕ) [NeZero n] :
    let M : Matrix (Fin n × Fin n) (Fin n × Fin n) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % n
        then f ^ ((c.1.val + c.2.val) / n) else 0
    M = (Matrix.diagonal (fun c : Fin n × Fin n =>
      f ^ ((c.1.val + c.2.val) / n))).submatrix (coefficientPermutation n).symm id := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_rows.test_wrap
example : affineTorsorComparison.coefficientPermutation 4 (3, 3) = (3, 2) := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_sign.test_two
example : Equiv.Perm.sign (affineTorsorComparison.coefficientPermutation 2) = (-1 : ℤˣ) := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_sign.test_three
example : Equiv.Perm.sign (affineTorsorComparison.coefficientPermutation 3) = (1 : ℤˣ) := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.weight_exponent.test_wrap
example : ((1 : Fin 2).val + (1 : Fin 2).val) / 2 = 1 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.weight_exponent.test_nonwrap
example : ((0 : Fin 2).val + (1 : Fin 2).val) / 2 = 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.weight_product.test_nonunit
example : (∏ p : Fin 2 × Fin 2, (2 : ℤ) ^ ((p.1.val + p.2.val) / 2)) = 2 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.matrix_reindex.test_weight
example (f : A) :
    (let M : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 2
        then f ^ ((c.1.val + c.2.val) / 2) else 0
     M (1, 0) (1, 1)) = f := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.determinant.test_exponent_one
example (f : A) :
    (let M : Matrix (Fin 1 × Fin 1) (Fin 1 × Fin 1) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 1
        then f ^ ((c.1.val + c.2.val) / 1) else 0
     Matrix.det M) = 1 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.determinant.test_three
example (f : A) :
    (let M : Matrix (Fin 3 × Fin 3) (Fin 3 × Fin 3) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 3
        then f ^ ((c.1.val + c.2.val) / 3) else 0
     Matrix.det M) = f ^ 3 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.determinant.test_zero_ring
example :
    (let M : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) (ZMod 1) :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 2
        then (0 : ZMod 1) ^ ((c.1.val + c.2.val) / 2) else 0
     Matrix.det M) = 0 := by
  sorry

-- TauCeti.RootStack.affineTorsorComparison.determinant.test_wild
example :
    (let M : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) (ZMod 2) :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 2
        then (1 : ZMod 2) ^ ((c.1.val + c.2.val) / 2) else 0
     Matrix.det M) = 1 := by
  sorry

end TauCeti.RootStack
/- END NATIVE ROOT DETERMINANT DEPENDENCIES -/

/-! Native factorial chart diagram continuation, Codex codex-J6LwjP. -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open CategoryTheory

-- Actual maps at divisibility indices avoid quotient carrier transports.
def affineDivisibility (f : A) (n N : ℕ) [NeZero n] [NeZero N] (h : n ∣ N) :
    AffineRing f n →ₐ[A] AffineRing f N := by
  sorry

lemma affineDivisibility.root (f : A) (n N : ℕ) [NeZero n] [NeZero N] (h : n ∣ N) :
    affineDivisibility f n N h (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ N - Polynomial.C f) ^ (N / n) := by
  sorry

lemma affineDivisibility.identity (f : A) (n : ℕ) [NeZero n] :
    affineDivisibility f n n (dvd_refl n) = AlgHom.id A (AffineRing f n) := by
  sorry

lemma affineDivisibility.composition (f : A) (n N K : ℕ)
    [NeZero n] [NeZero N] [NeZero K] (h : n ∣ N) (k : N ∣ K) :
    (affineDivisibility f N K k).comp (affineDivisibility f n N h) =
      affineDivisibility f n K (dvd_trans h k) := by
  sorry

lemma affineDivisibility.constant (f a : A) (n N : ℕ)
    [NeZero n] [NeZero N] (h : n ∣ N) :
    affineDivisibility f n N h (algebraMap A (AffineRing f n) a) =
      algebraMap A (AffineRing f N) a := by
  sorry

lemma affineDivisibility.unique (f : A) (n N : ℕ) [NeZero n] [NeZero N]
    (h : n ∣ N) (g : AffineRing f n →ₐ[A] AffineRing f N)
    (hg : g (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ N - Polynomial.C f) ^ (N / n)) :
    g = affineDivisibility f n N h := by
  sorry

lemma affineDivisibility.multiplicative (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineDivisibility f n (n*m) (dvd_mul_right n m) = affineTransition f n m := by
  sorry

-- A genuine native functor, not a family whose compatibility is assumed.
def factorialAffineTower (f : A) : ℕ ⥤ CommAlgCat.{u} A := by
  sorry

-- Keep the specified chart carrier visible even when the functor's body is admitted.
def factorialAffineTower.chart (f : A) (i : ℕ) :
    ((factorialAffineTower f).obj i) ≃ₐ[A] AffineRing f (Nat.factorial (i+1)) := by
  sorry

lemma factorialAffineTower.root (f : A) {i j : ℕ} (h : i ≤ j) :
    factorialAffineTower.chart f j
      (((factorialAffineTower f).map (homOfLE h)).hom
        ((factorialAffineTower.chart f i).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial (i+1) - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ Nat.factorial (j+1) - Polynomial.C f) ^
        (Nat.factorial (j+1) / Nat.factorial (i+1)) := by
  sorry

lemma factorialAffineTower.constant (f a : A) {i j : ℕ} (h : i ≤ j) :
    factorialAffineTower.chart f j
      (((factorialAffineTower f).map (homOfLE h)).hom
        ((factorialAffineTower.chart f i).symm
          (algebraMap A (AffineRing f (Nat.factorial (i+1))) a))) =
      algebraMap A (AffineRing f (Nat.factorial (j+1))) a := by
  sorry

-- affineDivisibilityTests.identity
example (f : A) (n : ℕ) [NeZero n] :
    affineDivisibility f n n (dvd_refl n) = AlgHom.id A (AffineRing f n) := by
  sorry

-- affineDivisibilityTests.fourToTwo
example (f : A) :
    affineDivisibility f 2 4 (by decide)
      (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 2 := by
  sorry

-- affineDivisibilityTests.coefficients
example (f a : ZMod 4) :
    affineDivisibility f 2 6 (by decide) (algebraMap (ZMod 4) (AffineRing f 2) a) =
      algebraMap (ZMod 4) (AffineRing f 6) a := by
  sorry

-- factorialAffineTowerTests.firstLevel
example (f : A) :
    (factorialAffineTower f).obj 0 = CommAlgCat.of A (AffineRing f 1) := by
  sorry

-- factorialAffineTowerTests.twoToSix
example (f : A) :
    factorialAffineTower.chart f 2
      (((factorialAffineTower f).map (homOfLE (by decide : 1 ≤ 2))).hom
        ((factorialAffineTower.chart f 1).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial 2 - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ Nat.factorial 3 - Polynomial.C f) ^ 3 := by
  sorry

-- factorialAffineTowerTests.composite
example (f : A) :
    factorialAffineTower.chart f 3
      ((((factorialAffineTower f).map (homOfLE (by decide : 2 ≤ 3))).hom.comp
        ((factorialAffineTower f).map (homOfLE (by decide : 1 ≤ 2))).hom)
        ((factorialAffineTower.chart f 1).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial 2 - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ Nat.factorial 4 - Polynomial.C f) ^ 12 := by
  sorry

-- factorialAffineTowerTests.wildNilpotent
example :
    factorialAffineTower.chart (0 : ZMod 2) 2
      (((factorialAffineTower (0 : ZMod 2)).map (homOfLE (by decide : 1 ≤ 2))).hom
        ((factorialAffineTower.chart (0 : ZMod 2) 1).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial 2 - Polynomial.C (0 : ZMod 2))))) ≠ 0 := by
  sorry

-- factorialAffineTowerTests.zeroRing
example {i j : ℕ} (h : i ≤ j) (x : (factorialAffineTower (0 : ZMod 1)).obj i) :
    factorialAffineTower.chart (0 : ZMod 1) j
      (((factorialAffineTower (0 : ZMod 1)).map (homOfLE h)).hom x) = 0 := by
  sorry

end TauCeti.RootStack


/-! Native factorial root colimit continuation. -/
noncomputable section
namespace TauCeti.RootStack
open CategoryTheory CategoryTheory.Limits
variable {A : Type u} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

def factorialAffineMap (f : A) (i j : ℕ) (h : i ≤ j) :
    AffineRing f (Nat.factorial (i+1)) →ₐ[A] AffineRing f (Nat.factorial (j+1)) := by
  sorry

instance factorialAffineDirected (f : A) :
    DirectedSystem (fun i => AffineRing f (Nat.factorial (i+1)))
      (fun i j h => factorialAffineMap f i j h) := by
  sorry

abbrev FactorialAffineColimit (f : A) :=
  DirectLimit (fun i => AffineRing f (Nat.factorial (i+1))) (factorialAffineMap f)


def factorialAffineInclusion (f : A) (i : ℕ) :
    AffineRing f (Nat.factorial (i+1)) →ₐ[A] FactorialAffineColimit f := by
  sorry

lemma factorialAffineInclusion.transition (f : A) {i j : ℕ} (h : i ≤ j)
    (x : AffineRing f (Nat.factorial (i+1))) :
    factorialAffineInclusion f j (factorialAffineMap f i j h x) =
      factorialAffineInclusion f i x := by
  sorry

lemma factorialAffineInclusion.root (f : A) {i j : ℕ} (h : i ≤ j) :
    factorialAffineInclusion f i (AdjoinRoot.root _) =
      factorialAffineInclusion f j (AdjoinRoot.root _) ^
        (Nat.factorial (j+1) / Nat.factorial (i+1)) := by
  sorry

lemma factorialAffineInclusion.pow (f : A) (i : ℕ) :
    factorialAffineInclusion f i (AdjoinRoot.root _) ^ Nat.factorial (i+1) =
      algebraMap A (FactorialAffineColimit f) f := by
  sorry

lemma affineDivisibility.injective (f : A) (n N : ℕ) [NeZero n] [NeZero N]
    (h : n ∣ N) : Function.Injective (affineDivisibility f n N h) := by
  sorry

lemma factorialAffineInclusion.injective (f : A) (i : ℕ) :
    Function.Injective (factorialAffineInclusion f i) := by
  sorry

lemma factorialAffineColimit.exists_level (f : A) (x : FactorialAffineColimit f) :
    ∃ i, ∃ y : AffineRing f (Nat.factorial (i+1)), factorialAffineInclusion f i y = x := by
  sorry

lemma factorialAffineColimit.hom_ext (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (g h : FactorialAffineColimit f →ₐ[A] C)
    (heq : ∀ i, g (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      h (factorialAffineInclusion f i (AdjoinRoot.root _))) : g = h := by
  sorry

def factorialAffineCocone (f : A) : Cocone (factorialAffineTower f) := by
  sorry

def factorialAffineCocone.isColimit (f : A) : IsColimit (factorialAffineCocone f) := by
  sorry

def factorialAffineRootLift (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i) :
    FactorialAffineColimit f →ₐ[A] C := by
  sorry

lemma factorialAffineRootLift.root (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i)
    (i : ℕ) :
    factorialAffineRootLift f r hr hc (factorialAffineInclusion f i (AdjoinRoot.root _)) = r i := by
  sorry

-- factorialAffineColimit.test_wild_nonzero

example : factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _) ≠ 0 := by
  sorry

-- factorialAffineColimit.test_wild_square

example : factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _) ^ 2 = 0 := by
  sorry

-- factorialAffineColimit.test_two_to_six

example (f : A) : factorialAffineInclusion f 1 (AdjoinRoot.root _) =
    factorialAffineInclusion f 2 (AdjoinRoot.root _) ^ 3 := by
  sorry

def factorialAffineCocone.point (f : A) :
    (factorialAffineCocone f).pt ≅ CommAlgCat.of A (FactorialAffineColimit f) := by
  sorry

lemma factorialAffineCocone.leg (f : A) (i : ℕ) :
    ((factorialAffineCocone f).ι.app i ≫ (factorialAffineCocone.point f).hom).hom =
      (factorialAffineInclusion f i).comp (factorialAffineTower.chart f i).toAlgHom := by
  sorry

lemma factorialAffineRootLift.unique (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i)
    (g : FactorialAffineColimit f →ₐ[A] C)
    (hg : ∀ i, g (factorialAffineInclusion f i (AdjoinRoot.root _)) = r i) :
    g = factorialAffineRootLift f r hr hc := by
  sorry

lemma factorialAffineRootLift.postcomp (f : A) {C D : Type u} [CommRing C] [Algebra A C]
    [CommRing D] [Algebra A D] (k : C →ₐ[A] D)
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i)
    (hs : ∀ i, k (r i) ^ Nat.factorial (i+1) = algebraMap A D f)
    (ht : ∀ i j, i ≤ j → k (r j) ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = k (r i)) :
    k.comp (factorialAffineRootLift f r hr hc) =
      factorialAffineRootLift f (fun i => k (r i)) hs ht := by
  sorry

-- factorialAffineInclusion.test_coefficients

example (a : ZMod 4) :
    factorialAffineInclusion (2 : ZMod 4) 1 (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (FactorialAffineColimit (2 : ZMod 4)) a := by
  sorry

-- factorialAffineColimit.test_zeroRing

example (x : FactorialAffineColimit (0 : ZMod 1)) : x = 0 := by
  sorry

-- factorialAffineCocone.test_wild

example : IsColimit (factorialAffineCocone (0 : ZMod 2)) := by
  sorry

-- factorialAffineCocone.test_zeroRing

example : IsColimit (factorialAffineCocone (0 : ZMod 1)) := by
  sorry

-- factorialAffineCocone.test_leg

example (f : A) :
    ((factorialAffineCocone f).ι.app 0 ≫ (factorialAffineCocone.point f).hom).hom =
      (factorialAffineInclusion f 0).comp (factorialAffineTower.chart f 0).toAlgHom := by
  sorry

-- factorialAffineRootLift.test_one

example : factorialAffineRootLift (1 : ℤ) (fun _ => (1 : ℤ))
    (by simp) (by simp) (factorialAffineInclusion (1 : ℤ) 2 (AdjoinRoot.root _)) = 1 := by
  sorry

-- factorialAffineRootLift.test_zero

example : factorialAffineRootLift (0 : ZMod 2) (fun _ => (0 : ZMod 2))
    (by simp [Nat.factorial_ne_zero]) (by
      intro i j h
      have hd : 0 < Nat.factorial (j+1) / Nat.factorial (i+1) :=
        Nat.div_pos (Nat.factorial_le (Nat.add_le_add_right h 1))
          (Nat.factorial_pos _)
      exact zero_pow (Nat.ne_of_gt hd))
    (factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _)) = 0 := by
  sorry

-- factorialAffineRootLift.test_identity

example (f : A) (hr : ∀ i, factorialAffineInclusion f i (AdjoinRoot.root _) ^
    Nat.factorial (i+1) = algebraMap A (FactorialAffineColimit f) f)
    (hc : ∀ i j, i ≤ j → factorialAffineInclusion f j (AdjoinRoot.root _) ^
      (Nat.factorial (j+1) / Nat.factorial (i+1)) =
        factorialAffineInclusion f i (AdjoinRoot.root _)) :
    factorialAffineRootLift f (fun i => factorialAffineInclusion f i (AdjoinRoot.root _)) hr hc =
      AlgHom.id A (FactorialAffineColimit f) := by
  sorry

end TauCeti.RootStack

/-! Positive-divisibility root chart colimit and factorial comparison. -/
noncomputable section
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]

/-- Root exponents, with the divisibility preorder rather than numeric order. -/
structure RootDivIndex where
  exponent : ℕ
  positive : 0 < exponent

@[reducible] instance : Preorder RootDivIndex where
  le n N := n.exponent ∣ N.exponent
  le_refl n := dvd_refl _
  le_trans _ _ _ := dvd_trans

instance : DecidableLE RootDivIndex :=
  fun n N => inferInstanceAs (Decidable (n.exponent ∣ N.exponent))

instance (n : RootDivIndex) : NeZero n.exponent := ⟨Nat.ne_of_gt n.positive⟩
instance : Inhabited RootDivIndex := ⟨⟨1, by decide⟩⟩
instance : IsDirectedOrder RootDivIndex where
  directed n N := ⟨⟨n.exponent * N.exponent, Nat.mul_pos n.positive N.positive⟩,
    dvd_mul_right _ _, dvd_mul_left _ _⟩

abbrev RootDivIndex.factorial (i : ℕ) : RootDivIndex :=
  ⟨Nat.factorial (i+1), Nat.factorial_pos _⟩

lemma RootDivIndex.cofinal (n : RootDivIndex) :
    n ≤ RootDivIndex.factorial n.exponent := by
  sorry

lemma RootDivIndex.factorial_mono {i j : ℕ} (h : i ≤ j) :
    RootDivIndex.factorial i ≤ RootDivIndex.factorial j := by
  sorry
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

lemma factorialAffineInclusion.comp_transition (f : A) {i j : ℕ} (h : i ≤ j) :
    (factorialAffineInclusion f j).comp (factorialAffineMap f i j h) =
      factorialAffineInclusion f i := by
  sorry

def factorialAffineExtension (f : A) (n : RootDivIndex) :
    AffineRing f n.exponent →ₐ[A] FactorialAffineColimit f := by
  sorry

lemma factorialAffineExtension.at_level (f : A) (n : RootDivIndex) (i : ℕ)
    (h : n ≤ RootDivIndex.factorial i) :
    factorialAffineExtension f n =
      (factorialAffineInclusion f i).comp (affineDivisibility f _ _ h) := by
  sorry

lemma factorialAffineExtension.transition (f : A) {n N : RootDivIndex} (h : n ≤ N) :
    (factorialAffineExtension f N).comp (affineDivisibility f _ _ h) =
      factorialAffineExtension f n := by
  sorry

lemma factorialAffineExtension.factorial (f : A) (i : ℕ) :
    factorialAffineExtension f (RootDivIndex.factorial i) =
      factorialAffineInclusion f i := by
  sorry

lemma factorialAffineExtension.injective (f : A) (n : RootDivIndex) :
    Function.Injective (factorialAffineExtension f n) := by
  sorry

def divisibilityAffineMap (f : A) (n N : RootDivIndex) (h : n ≤ N) :
    AffineRing f n.exponent →ₐ[A] AffineRing f N.exponent := by
  sorry

instance divisibilityAffineDirected (f : A) :
    DirectedSystem (fun n : RootDivIndex => AffineRing f n.exponent)
      (fun i j h => divisibilityAffineMap f i j h) := by
  sorry

abbrev DivisibilityAffineColimit (f : A) :=
  DirectLimit (fun n : RootDivIndex => AffineRing f n.exponent) (divisibilityAffineMap f)

def divisibilityAffineInclusion (f : A) (n : RootDivIndex) :
    AffineRing f n.exponent →ₐ[A] DivisibilityAffineColimit f := by
  sorry

lemma divisibilityAffineInclusion.transition (f : A) {n N : RootDivIndex} (h : n ≤ N)
    (x : AffineRing f n.exponent) :
    divisibilityAffineInclusion f N (affineDivisibility f _ _ h x) =
      divisibilityAffineInclusion f n x := by
  sorry

lemma divisibilityAffineInclusion.injective (f : A) (n : RootDivIndex) :
    Function.Injective (divisibilityAffineInclusion f n) := by
  sorry

lemma divisibilityAffineColimit.exists_level (f : A) (x : DivisibilityAffineColimit f) :
    ∃ n : RootDivIndex, ∃ y : AffineRing f n.exponent, divisibilityAffineInclusion f n y = x := by
  sorry

lemma divisibilityAffineColimit.hom_ext (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (g h : DivisibilityAffineColimit f →ₐ[A] C)
    (heq : ∀ n, g (divisibilityAffineInclusion f n (AdjoinRoot.root _)) =
      h (divisibilityAffineInclusion f n (AdjoinRoot.root _))) : g = h := by
  sorry

def divisibilityToFactorial (f : A) :
    DivisibilityAffineColimit f →ₐ[A] FactorialAffineColimit f := by
  sorry

lemma divisibilityToFactorial.inclusion (f : A) (n : RootDivIndex)
    (x : AffineRing f n.exponent) :
    divisibilityToFactorial f (divisibilityAffineInclusion f n x) =
      factorialAffineExtension f n x := by
  sorry

def factorialToDivisibility (f : A) :
    FactorialAffineColimit f →ₐ[A] DivisibilityAffineColimit f := by
  sorry

lemma factorialToDivisibility.inclusion (f : A) (i : ℕ)
    (x : AffineRing f (Nat.factorial (i+1))) :
    factorialToDivisibility f (factorialAffineInclusion f i x) =
      divisibilityAffineInclusion f (RootDivIndex.factorial i) x := by
  sorry

lemma divisibilityToFactorial.left_inverse (f : A) (x : DivisibilityAffineColimit f) :
    factorialToDivisibility f (divisibilityToFactorial f x) = x := by
  sorry

lemma divisibilityToFactorial.right_inverse (f : A) (x : FactorialAffineColimit f) :
    divisibilityToFactorial f (factorialToDivisibility f x) = x := by
  sorry

def divisibilityFactorialEquiv (f : A) :
    DivisibilityAffineColimit f ≃ₐ[A] FactorialAffineColimit f := by
  sorry

lemma divisibilityFactorialEquiv.inclusion (f : A) (n : RootDivIndex) (i : ℕ)
    (h : n ≤ RootDivIndex.factorial i) (x : AffineRing f n.exponent) :
    divisibilityFactorialEquiv f (divisibilityAffineInclusion f n x) =
      factorialAffineInclusion f i (affineDivisibility f _ _ h x) := by
  sorry

lemma divisibilityFactorialEquiv.root (f : A) (n : RootDivIndex) (i : ℕ)
    (h : n ≤ RootDivIndex.factorial i) :
    divisibilityFactorialEquiv f (divisibilityAffineInclusion f n (AdjoinRoot.root _)) =
      factorialAffineInclusion f i (AdjoinRoot.root _) ^
        (Nat.factorial (i+1) / n.exponent) := by
  sorry
end TauCeti.RootStack
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]

lemma divisibilityAffineInclusion.pow (f : A) (n : RootDivIndex) :
    divisibilityAffineInclusion f n (AdjoinRoot.root _) ^ n.exponent =
      algebraMap A (DivisibilityAffineColimit f) f := by
  sorry

lemma divisibilityAffineInclusion.root (f : A) {n N : RootDivIndex} (h : n ≤ N) :
    divisibilityAffineInclusion f n (AdjoinRoot.root _) =
      divisibilityAffineInclusion f N (AdjoinRoot.root _) ^ (N.exponent / n.exponent) := by
  sorry
-- rootDivIndex.test_zero

example (n : RootDivIndex) : n.exponent ≠ 0 := by
  sorry
-- rootDivIndex.test_two_six

example : (⟨2, by decide⟩ : RootDivIndex) ≤ ⟨6, by decide⟩ := by
  sorry
-- rootDivIndex.test_numeric_order

example : ¬ (⟨2, by decide⟩ : RootDivIndex) ≤ ⟨3, by decide⟩ := by
  sorry
-- factorialAffineExtension.test_three_at_six

example (f : A) : factorialAffineExtension f ⟨3, by decide⟩ =
    (factorialAffineInclusion f 2).comp (affineDivisibility f 3 6 (by decide)) := by
  sorry
-- factorialAffineExtension.test_choice

example (f : A) (x : AffineRing f 3) :
    factorialAffineInclusion f 2 (affineDivisibility f 3 6 (by decide) x) =
      factorialAffineInclusion f 3 (affineDivisibility f 3 24 (by decide) x) := by
  sorry
-- factorialAffineExtension.test_one

example (f : A) : factorialAffineExtension f (RootDivIndex.factorial 0) =
    factorialAffineInclusion f 0 := by
  sorry
-- divisibilityAffineColimit.test_wild_nonzero

example : divisibilityAffineInclusion (0 : ZMod 2) ⟨2, by decide⟩ (AdjoinRoot.root _) ≠ 0 := by
  sorry
-- divisibilityAffineColimit.test_wild_square

example : divisibilityAffineInclusion (0 : ZMod 2) ⟨2, by decide⟩ (AdjoinRoot.root _) ^ 2 = 0 := by
  sorry
-- divisibilityAffineColimit.test_zero_ring

example (x : DivisibilityAffineColimit (0 : ZMod 1)) : x = 0 := by
  sorry
-- divisibilityAffineInclusion.test_two_six

example (f : A) : divisibilityAffineInclusion f ⟨2, by decide⟩ (AdjoinRoot.root _) =
    divisibilityAffineInclusion f ⟨6, by decide⟩ (AdjoinRoot.root _) ^ 3 := by
  sorry
-- divisibilityAffineInclusion.test_coefficients

example (f a : ZMod 4) :
    divisibilityAffineInclusion f ⟨3, by decide⟩ (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (DivisibilityAffineColimit f) a := by
  sorry
-- divisibilityAffineInclusion.test_identity

example (f : A) (n : RootDivIndex) (x : AffineRing f n.exponent) :
    divisibilityAffineInclusion f n (affineDivisibility f n.exponent n.exponent (dvd_refl _) x) =
      divisibilityAffineInclusion f n x := by
  sorry
-- divisibilityToFactorial.test_three

example (f : A) : divisibilityToFactorial f
    (divisibilityAffineInclusion f ⟨3, by decide⟩ (AdjoinRoot.root _)) =
      factorialAffineInclusion f 2 (AdjoinRoot.root _) ^ 2 := by
  sorry
-- divisibilityToFactorial.test_coefficients

example (f a : ZMod 4) :
    divisibilityToFactorial f (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (FactorialAffineColimit f) a := by
  sorry
-- divisibilityToFactorial.test_factorial

example (f : A) (i : ℕ) (x : AffineRing f (Nat.factorial (i+1))) :
    divisibilityToFactorial f
      (divisibilityAffineInclusion f (RootDivIndex.factorial i) x) =
        factorialAffineInclusion f i x := by
  sorry
-- factorialToDivisibility.test_root

example (f : A) : factorialToDivisibility f (factorialAffineInclusion f 1 (AdjoinRoot.root _)) =
    divisibilityAffineInclusion f ⟨2, by decide⟩ (AdjoinRoot.root _) := by
  sorry
-- factorialToDivisibility.test_coefficients

example (f a : ZMod 4) :
    factorialToDivisibility f (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (DivisibilityAffineColimit f) a := by
  sorry
-- factorialToDivisibility.test_zero

example : factorialToDivisibility (0 : ZMod 1) 0 = 0 := by
  sorry
-- divisibilityFactorialEquiv.test_three

example (f : A) : divisibilityFactorialEquiv f
    (divisibilityAffineInclusion f ⟨3, by decide⟩ (AdjoinRoot.root _)) =
      factorialAffineInclusion f 2 (AdjoinRoot.root _) ^ 2 := by
  sorry
-- divisibilityFactorialEquiv.test_coefficients

example (f a : ZMod 4) :
    divisibilityFactorialEquiv f (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (FactorialAffineColimit f) a := by
  sorry
-- divisibilityFactorialEquiv.test_inverse

example (f : A) (x : DivisibilityAffineColimit f) :
    (divisibilityFactorialEquiv f).symm (divisibilityFactorialEquiv f x) = x := by
  sorry
end TauCeti.RootStack

namespace TauCeti.RootStack
section FactorialScalingContinuation
variable {A : Type u} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩


def factorialRootScalars (A : Type u) [CommRing A] : Subgroup (ℕ → Aˣ) := by sorry

lemma factorialRootScalars.pow (s : factorialRootScalars A) (i : ℕ) :
    ((s.val i : Aˣ) : A) ^ Nat.factorial (i+1) = 1 := by sorry

lemma factorialRootScalars.transition (s : factorialRootScalars A) {i j : ℕ} (h : i ≤ j) :
    ((s.val j : Aˣ) : A) ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = (s.val i : A) := by sorry

def factorialScale (f : A) (s : factorialRootScalars A) :
    FactorialAffineColimit f →ₐ[A] FactorialAffineColimit f := by sorry

lemma factorialScale.root (f : A) (s : factorialRootScalars A) (i : ℕ) :
    factorialScale f s (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      algebraMap A _ (s.val i : A) * factorialAffineInclusion f i (AdjoinRoot.root _) := by sorry

lemma factorialScale.constant (f a : A) (s : factorialRootScalars A) :
    factorialScale f s (algebraMap A _ a) = algebraMap A _ a := by sorry

lemma factorialScale.one (f : A) : factorialScale f 1 = AlgHom.id A _ := by sorry

lemma factorialScale.mul (f : A) (s t : factorialRootScalars A) :
    factorialScale f (s*t) = (factorialScale f s).comp (factorialScale f t) := by sorry

def factorialScaleEquiv (f : A) (s : factorialRootScalars A) :
    FactorialAffineColimit f ≃ₐ[A] FactorialAffineColimit f := by sorry

lemma factorialScaleEquiv.root (f : A) (s : factorialRootScalars A) (i : ℕ) :
    factorialScaleEquiv f s (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      algebraMap A _ (s.val i : A) * factorialAffineInclusion f i (AdjoinRoot.root _) := by sorry

lemma factorialScaleEquiv.inverse_root (f : A) (s : factorialRootScalars A) (i : ℕ) :
    (factorialScaleEquiv f s).symm (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      algebraMap A _ ((s⁻¹).val i : A) * factorialAffineInclusion f i (AdjoinRoot.root _) := by sorry

def factorialUniversalScalars (A : Type u) [CommRing A] :
    factorialRootScalars (FactorialAffineColimit (1 : A)) := by sorry

lemma factorialUniversalScalars.value (i : ℕ) :
    (((factorialUniversalScalars A).val i : (FactorialAffineColimit (1 : A))ˣ) :
      FactorialAffineColimit (1 : A)) = factorialAffineInclusion (1 : A) i (AdjoinRoot.root _) := by sorry

-- test: factorialRootScalars.test_one
example (i : ℕ) : ((1 : factorialRootScalars A).val i : Aˣ) = 1 := by sorry

-- test: factorialRootScalars.test_inverse
example (s : factorialRootScalars A) (i : ℕ) :
    ((s⁻¹).val i : Aˣ) * (s.val i : Aˣ) = 1 := by sorry

-- test: factorialRootScalars.test_individual_roots
example (i : ℕ) :
    (if i = 1 then (-1 : ℤˣ) else 1) ^ Nat.factorial (i+1) = 1 := by sorry

-- test: factorialRootScalars.test_incoherent
example :
    (fun i : ℕ => if i = 1 then (-1 : ℤˣ) else 1) ∉ factorialRootScalars ℤ := by sorry

-- test: factorialScale.test_one
example (f : A) (x : FactorialAffineColimit f) : factorialScale f 1 x = x := by sorry

-- test: factorialScale.test_constant
example (s : factorialRootScalars (ZMod 4)) :
    factorialScale (2 : ZMod 4) s (algebraMap (ZMod 4) _ (3 : ZMod 4)) =
      algebraMap (ZMod 4) _ (3 : ZMod 4) := by sorry

-- test: factorialScale.test_composition
example (f : A) (s t : factorialRootScalars A) (x : FactorialAffineColimit f) :
    factorialScale f (s*t) x = factorialScale f s (factorialScale f t x) := by sorry

-- test: factorialScaleEquiv.test_roundtrip
example (f : A) (s : factorialRootScalars A) (x : FactorialAffineColimit f) :
    (factorialScaleEquiv f s).symm (factorialScaleEquiv f s x) = x := by sorry

-- test: factorialScaleEquiv.test_root
example (f : A) (s : factorialRootScalars A) :
    factorialScaleEquiv f s (factorialAffineInclusion f 1 (AdjoinRoot.root _)) =
      algebraMap A _ (s.val 1 : A) * factorialAffineInclusion f 1 (AdjoinRoot.root _) := by sorry

-- test: factorialScaleEquiv.test_wild_zero
example (s : factorialRootScalars (ZMod 2)) :
    factorialScaleEquiv (0 : ZMod 2) s (factorialAffineInclusion (0 : ZMod 2) 1
      (AdjoinRoot.root _)) ≠ 0 := by sorry

-- test: factorialUniversalScalars.test_root
example : (((factorialUniversalScalars (ZMod 4)).val 1 :
    (FactorialAffineColimit (1 : ZMod 4))ˣ) : FactorialAffineColimit (1 : ZMod 4)) ^ 2 = 1 := by sorry

-- test: factorialUniversalScalars.test_nontrivial
example : (factorialUniversalScalars (ZMod 3)).val 1 ≠ 1 := by sorry

-- test: factorialUniversalScalars.test_zero_ring
example : factorialUniversalScalars (ZMod 1) = 1 := by sorry

end FactorialScalingContinuation
end TauCeti.RootStack

namespace TauCeti.RootStack
section FactorialCoefficients
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

def factorialRootScalars.map (φ : A →+* B) :
    factorialRootScalars A →* factorialRootScalars B := by sorry

lemma factorialRootScalars.map_value (φ : A →+* B) (s : factorialRootScalars A) (i : ℕ) :
    (((factorialRootScalars.map φ s).val i : Bˣ) : B) = φ (s.val i : A) := by sorry

lemma factorialRootScalars.map_id :
    factorialRootScalars.map (RingHom.id A) = MonoidHom.id (factorialRootScalars A) := by sorry

lemma factorialRootScalars.map_comp (φ : A →+* B) (ψ : B →+* C) :
    factorialRootScalars.map (ψ.comp φ) =
      (factorialRootScalars.map ψ).comp (factorialRootScalars.map φ) := by sorry

lemma factorialAffineColimit.ringHom_ext (f : A) (φ : A →+* B)
    (g h : FactorialAffineColimit f →+* B)
    (hg : ∀ a, g (algebraMap A _ a) = φ a)
    (hh : ∀ a, h (algebraMap A _ a) = φ a)
    (hr : ∀ i, g (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      h (factorialAffineInclusion f i (AdjoinRoot.root _))) : g = h := by sorry

def factorialCoefficientMap (φ : A →+* B) (f : A) :
    FactorialAffineColimit f →+* FactorialAffineColimit (φ f) := by sorry

lemma factorialCoefficientMap.root (φ : A →+* B) (f : A) (i : ℕ) :
    factorialCoefficientMap φ f (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      factorialAffineInclusion (φ f) i (AdjoinRoot.root _) := by sorry

lemma factorialCoefficientMap.constant (φ : A →+* B) (f a : A) :
    factorialCoefficientMap φ f (algebraMap A _ a) =
      algebraMap B _ (φ a) := by sorry

lemma factorialCoefficientMap.id (f : A) :
    factorialCoefficientMap (RingHom.id A) f = RingHom.id (FactorialAffineColimit f) := by sorry

lemma factorialCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) (f : A) :
    factorialCoefficientMap (ψ.comp φ) f =
      (factorialCoefficientMap ψ (φ f)).comp (factorialCoefficientMap φ f) := by sorry

lemma factorialScale.coefficient_naturality (φ : A →+* B) (f : A)
    (s : factorialRootScalars A) :
    (factorialCoefficientMap φ f).comp (factorialScale f s).toRingHom =
      (factorialScale (φ f) (factorialRootScalars.map φ s)).toRingHom.comp
        (factorialCoefficientMap φ f) := by sorry

lemma factorialScaleEquiv.coefficient_naturality (φ : A →+* B) (f : A)
    (s : factorialRootScalars A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f (factorialScaleEquiv f s x) =
      factorialScaleEquiv (φ f) (factorialRootScalars.map φ s)
        (factorialCoefficientMap φ f x) := by sorry

lemma factorialScaleEquiv.inverse_coefficient_naturality (φ : A →+* B) (f : A)
    (s : factorialRootScalars A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f ((factorialScaleEquiv f s).symm x) =
      (factorialScaleEquiv (φ f) (factorialRootScalars.map φ s)).symm
        (factorialCoefficientMap φ f x) := by sorry

-- test: factorialCoefficientTests.scalar_value
example (φ : A →+* B) (s : factorialRootScalars A) (i : ℕ) :
    (((factorialRootScalars.map φ s).val i : Bˣ) : B) = φ (s.val i : A) := by sorry

-- test: factorialCoefficientTests.scalar_one
example (φ : A →+* B) : factorialRootScalars.map φ 1 = 1 := by sorry

-- test: factorialCoefficientTests.scalar_inverse
example (φ : A →+* B) (s : factorialRootScalars A) :
    factorialRootScalars.map φ s⁻¹ = (factorialRootScalars.map φ s)⁻¹ := by sorry

-- test: factorialCoefficientTests.identity
example (f : A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap (RingHom.id A) f x = x := by sorry

-- test: factorialCoefficientTests.root
example (φ : A →+* B) (f : A) :
    factorialCoefficientMap φ f (factorialAffineInclusion f 1 (AdjoinRoot.root _)) =
      factorialAffineInclusion (φ f) 1 (AdjoinRoot.root _) := by sorry

-- test: factorialCoefficientTests.composition
example (φ : A →+* B) (ψ : B →+* C) (f : A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap (ψ.comp φ) f x =
      factorialCoefficientMap ψ (φ f) (factorialCoefficientMap φ f x) := by sorry

-- test: factorialCoefficientTests.zero_ring
example (φ : ℤ →+* ZMod 1) (f : ℤ) (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f x = 0 := by sorry

-- test: factorialCoefficientTests.mod_two
example : factorialCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
    (algebraMap ℤ _ (2 : ℤ)) = 0 := by sorry

-- test: factorialCoefficientTests.scaling_square
example (φ : A →+* B) (f : A) (s : factorialRootScalars A)
    (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f (factorialScaleEquiv f s x) =
      factorialScaleEquiv (φ f) (factorialRootScalars.map φ s)
        (factorialCoefficientMap φ f x) := by sorry

end FactorialCoefficients
end TauCeti.RootStack


/-! Universal factorial root coaction — Codex codex-a71f92. -/
namespace TauCeti.RootStack
section FactorialUniversalCoaction
variable {A : Type u} [CommRing A]
open scoped TensorProduct

def factorialCoaction (f : A) :
    FactorialAffineColimit f →ₐ[A]
      (FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) := by
  sorry

lemma factorialCoaction.root (f : A) (i : ℕ) :
    factorialCoaction f (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      factorialAffineInclusion (1 : A) i (AdjoinRoot.root _) ⊗ₜ[A]
        factorialAffineInclusion f i (AdjoinRoot.root _) := by
  sorry

lemma factorialCoaction.constant (f a : A) :
    factorialCoaction f (algebraMap A _ a) =
      (1 : FactorialAffineColimit (1 : A)) ⊗ₜ[A]
        algebraMap A (FactorialAffineColimit f) a := by
  sorry

def factorialCounit (A : Type u) [CommRing A] :
    FactorialAffineColimit (1 : A) →ₐ[A] A := by
  sorry

lemma factorialCounit.root (i : ℕ) :
    factorialCounit A (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) = 1 := by
  sorry

lemma factorialCounit.constant (a : A) :
    factorialCounit A (algebraMap A _ a) = a := by
  sorry

lemma factorialCounit.surjective : Function.Surjective (factorialCounit A) := by
  sorry

lemma factorialCoaction.counit (f : A) :
    ((Algebra.TensorProduct.lid A (FactorialAffineColimit f)).toAlgHom.comp
      (Algebra.TensorProduct.map (factorialCounit A)
        (AlgHom.id A (FactorialAffineColimit f)))).comp (factorialCoaction f) =
      AlgHom.id A (FactorialAffineColimit f) := by
  sorry

lemma factorialCoaction.coassoc (f : A) :
    (Algebra.TensorProduct.assoc A A A
      (FactorialAffineColimit (1 : A)) (FactorialAffineColimit (1 : A))
      (FactorialAffineColimit f)).toAlgHom.comp
      ((Algebra.TensorProduct.map (factorialCoaction (1 : A))
        (AlgHom.id A (FactorialAffineColimit f))).comp (factorialCoaction f)) =
      (Algebra.TensorProduct.map (AlgHom.id A (FactorialAffineColimit (1 : A)))
        (factorialCoaction f)).comp (factorialCoaction f) := by
  sorry

lemma factorialCoaction.right_counit :
    ((Algebra.TensorProduct.rid A A (FactorialAffineColimit (1 : A))).toAlgHom.comp
      (Algebra.TensorProduct.map (AlgHom.id A (FactorialAffineColimit (1 : A)))
        (factorialCounit A))).comp (factorialCoaction (1 : A)) =
      AlgHom.id A (FactorialAffineColimit (1 : A)) := by
  sorry

lemma factorialCoaction.cocomm :
    (Algebra.TensorProduct.comm A (FactorialAffineColimit (1 : A))
      (FactorialAffineColimit (1 : A))).toAlgHom.comp (factorialCoaction (1 : A)) =
        factorialCoaction (1 : A) := by
  sorry

def factorialAntipode (A : Type u) [CommRing A] :
    FactorialAffineColimit (1 : A) →ₐ[A] FactorialAffineColimit (1 : A) := by
  sorry

lemma factorialAntipode.root (i : ℕ) :
    factorialAntipode A (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) =
      (((factorialUniversalScalars A)⁻¹).val i : FactorialAffineColimit (1 : A)) := by
  sorry

lemma factorialAntipode.left_inverse :
    (Algebra.TensorProduct.lift (factorialAntipode A)
      (AlgHom.id A (FactorialAffineColimit (1 : A)))
      (fun _ _ => Commute.all _ _)).comp (factorialCoaction (1 : A)) =
        (Algebra.ofId A (FactorialAffineColimit (1 : A))).comp (factorialCounit A) := by
  sorry

lemma factorialAntipode.right_inverse :
    (Algebra.TensorProduct.lift (AlgHom.id A (FactorialAffineColimit (1 : A)))
      (factorialAntipode A) (fun _ _ => Commute.all _ _)).comp
        (factorialCoaction (1 : A)) =
        (Algebra.ofId A (FactorialAffineColimit (1 : A))).comp (factorialCounit A) := by
  sorry

lemma factorialAntipode.involutive :
    (factorialAntipode A).comp (factorialAntipode A) =
      AlgHom.id A (FactorialAffineColimit (1 : A)) := by
  sorry

def factorialScalarEvaluation {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) :
    FactorialAffineColimit (1 : A) →ₐ[A] B := by
  sorry

lemma factorialScalarEvaluation.root {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) (i : ℕ) :
    factorialScalarEvaluation (A := A) s
      (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) = (s.val i : B) := by
  sorry

lemma factorialScalarEvaluation.constant {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) (a : A) :
    factorialScalarEvaluation (A := A) s (algebraMap A _ a) = algebraMap A B a := by
  sorry

lemma factorialScalarEvaluation.universal :
    factorialScalarEvaluation (A := A) (factorialUniversalScalars A) =
      AlgHom.id A (FactorialAffineColimit (1 : A)) := by
  sorry

def factorialScalarPoints {B : Type u} [CommRing B] [Algebra A B] :
    (FactorialAffineColimit (1 : A) →ₐ[A] B) ≃ factorialRootScalars B := by
  sorry

lemma factorialScalarPoints.value {B : Type u} [CommRing B] [Algebra A B]
    (p : FactorialAffineColimit (1 : A) →ₐ[A] B) (i : ℕ) :
    (((factorialScalarPoints p).val i : Bˣ) : B) =
      p (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) := by
  sorry

lemma factorialScalarPoints.naturality {B C : Type u} [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (p : FactorialAffineColimit (1 : A) →ₐ[A] B)
    (k : B →ₐ[A] C) :
    factorialScalarPoints (k.comp p) =
      factorialRootScalars.map k.toRingHom (factorialScalarPoints p) := by
  sorry

lemma factorialScalarPoints.left_inverse {B : Type u} [CommRing B] [Algebra A B]
    (p : FactorialAffineColimit (1 : A) →ₐ[A] B) :
    factorialScalarEvaluation (factorialScalarPoints p) = p := by
  sorry

lemma factorialScalarPoints.right_inverse {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) :
    factorialScalarPoints (factorialScalarEvaluation (A := A) s) = s := by
  sorry

lemma factorialCoaction.specialization (f : A) (s : factorialRootScalars A) :
    (Algebra.TensorProduct.lift
      ((Algebra.ofId A (FactorialAffineColimit f)).comp (factorialScalarEvaluation s))
      (AlgHom.id A (FactorialAffineColimit f))
      (fun _ _ => Commute.all _ _)).comp (factorialCoaction f) = factorialScale f s := by
  sorry

lemma factorialCoaction.injective (f : A) : Function.Injective (factorialCoaction f) := by
  sorry

abbrev factorialBialgebra (A : Type u) [CommRing A] :
    Bialgebra A (FactorialAffineColimit (1 : A)) := by
  exact Bialgebra.ofAlgHom (factorialCoaction (1 : A)) (factorialCounit A)
    (by sorry) (by sorry) (by sorry)

lemma factorialBialgebra.comul :
    letI := factorialBialgebra A
    Bialgebra.comulAlgHom A (FactorialAffineColimit (1 : A)) =
      factorialCoaction (1 : A) := by
  sorry

lemma factorialBialgebra.counit :
    letI := factorialBialgebra A
    Bialgebra.counitAlgHom A (FactorialAffineColimit (1 : A)) =
      factorialCounit A := by
  sorry

abbrev factorialHopfAlgebra (A : Type u) [CommRing A] :
    letI := factorialBialgebra A
    HopfAlgebra A (FactorialAffineColimit (1 : A)) := by
  letI := factorialBialgebra A
  exact HopfAlgebra.ofAlgHom (factorialAntipode A) (by sorry) (by sorry)

lemma factorialHopfAlgebra.antipode :
    letI := factorialBialgebra A
    letI := factorialHopfAlgebra A
    HopfAlgebra.antipode A (A := FactorialAffineColimit (1 : A)) =
      (factorialAntipode A).toLinearMap := by
  sorry


-- factorialCoactionTests.degree_two
example : factorialCoaction (2 : ZMod 4)
    (factorialAffineInclusion (2 : ZMod 4) 1 (AdjoinRoot.root _)) =
    factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _) ⊗ₜ[ZMod 4]
      factorialAffineInclusion (2 : ZMod 4) 1 (AdjoinRoot.root _) := by
  sorry


-- factorialCoactionTests.coefficient_two
example : factorialCoaction (0 : ZMod 4)
    (algebraMap (ZMod 4) _ 2) =
      1 ⊗ₜ[ZMod 4] algebraMap (ZMod 4) (FactorialAffineColimit (0 : ZMod 4)) 2 := by
  sorry


-- factorialCoactionTests.zero_ring
example : factorialCoaction (0 : ZMod 1) 0 = 0 := by
  sorry


-- factorialCoactionTests.wild_nonzero
example : factorialCoaction (0 : ZMod 2)
    (factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _)) ≠ 0 := by
  sorry


-- factorialCoactionTests.wild_square_zero
example : (factorialCoaction (0 : ZMod 2)
    (factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _))) ^ 2 = 0 := by
  sorry


-- factorialCounitTests.degree_two
example : factorialCounit (ZMod 4)
    (factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _)) = 1 := by
  sorry


-- factorialCounitTests.coefficient_two
example : factorialCounit (ZMod 4) (algebraMap (ZMod 4) _ 2) = 2 := by
  sorry


-- factorialCounitTests.zero_ring
example : factorialCounit (ZMod 1) 0 = 0 := by
  sorry


-- factorialAntipodeTests.inverse_root
example : factorialAntipode A
    (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) *
      factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) = 1 := by
  sorry


-- factorialAntipodeTests.involutive
example (x : FactorialAffineColimit (1 : A)) :
    factorialAntipode A (factorialAntipode A x) = x := by
  sorry


-- factorialAntipodeTests.zero_ring
example : factorialAntipode (ZMod 1) 0 = 0 := by
  sorry


-- factorialScalarEvaluationTests.universal
example : factorialScalarEvaluation (A := A) (factorialUniversalScalars A)
    (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) =
      factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) := by
  sorry


-- factorialScalarEvaluationTests.identity_scalar
example : factorialScalarEvaluation (A := A) (1 : factorialRootScalars A)
    (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) = 1 := by
  sorry


-- factorialScalarEvaluationTests.coefficient_two
example : factorialScalarEvaluation (A := ZMod 4) (1 : factorialRootScalars (ZMod 4))
    (algebraMap (ZMod 4) _ 2) = 2 := by
  sorry


-- factorialScalarPointsTests.left_inverse
example (p : FactorialAffineColimit (1 : A) →ₐ[A] A) :
    factorialScalarEvaluation (factorialScalarPoints p) = p := by
  sorry


-- factorialScalarPointsTests.right_inverse
example (s : factorialRootScalars (ZMod 1)) :
    factorialScalarPoints (factorialScalarEvaluation (A := ZMod 1) s) = s := by
  sorry


-- factorialScalarPointsTests.universal
example : factorialScalarPoints (AlgHom.id A (FactorialAffineColimit (1 : A))) =
    factorialUniversalScalars A := by
  sorry


-- factorialBialgebraTests.comul_root
example :
    letI := factorialBialgebra (ZMod 4)
    Bialgebra.comulAlgHom (ZMod 4) (FactorialAffineColimit (1 : ZMod 4))
      (factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _)) =
        factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _) ⊗ₜ[ZMod 4]
          factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _) := by
  sorry


-- factorialBialgebraTests.counit_root
example :
    letI := factorialBialgebra (ZMod 2)
    Bialgebra.counitAlgHom (ZMod 2) (FactorialAffineColimit (1 : ZMod 2))
      (factorialAffineInclusion (1 : ZMod 2) 1 (AdjoinRoot.root _)) = 1 := by
  sorry


-- factorialBialgebraTests.zero_ring
example :
    letI := factorialBialgebra (ZMod 1)
    Bialgebra.comulAlgHom (ZMod 1) (FactorialAffineColimit (1 : ZMod 1)) 0 = 0 := by
  sorry


-- factorialHopfAlgebraTests.inverse_root
example :
    letI := factorialBialgebra A
    letI := factorialHopfAlgebra A
    HopfAlgebra.antipode A (A := FactorialAffineColimit (1 : A))
      (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) *
        factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) = 1 := by
  sorry


-- factorialHopfAlgebraTests.involutive
example (x : FactorialAffineColimit (1 : A)) :
    letI := factorialBialgebra A
    letI := factorialHopfAlgebra A
    HopfAlgebra.antipode A (HopfAlgebra.antipode A x) = x := by
  sorry


-- factorialHopfAlgebraTests.zero_ring
example :
    letI := factorialBialgebra (ZMod 1)
    letI := factorialHopfAlgebra (ZMod 1)
    HopfAlgebra.antipode (ZMod 1) (A := FactorialAffineColimit (1 : ZMod 1)) 0 = 0 := by
  sorry


end FactorialUniversalCoaction
end TauCeti.RootStack

/-! Coefficient naturality of the universal factorial coaction.
All ring maps and tensor products below use the actual inherited native carriers. -/

namespace TauCeti.RootStack
section FactorialCoefficientCoaction
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
open scoped TensorProduct
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

def factorialUnitCoefficientMap (φ : A →+* B) :
    FactorialAffineColimit (1 : A) →+* FactorialAffineColimit (1 : B) := by sorry
lemma factorialUnitCoefficientMap.root (φ : A →+* B) (i : ℕ) :
    factorialUnitCoefficientMap φ (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) =
      factorialAffineInclusion (1 : B) i (AdjoinRoot.root _) := by sorry
lemma factorialUnitCoefficientMap.constant (φ : A →+* B) (a : A) :
    factorialUnitCoefficientMap φ (algebraMap A _ a) = algebraMap B _ (φ a) := by sorry
lemma factorialUnitCoefficientMap.id :
    factorialUnitCoefficientMap (RingHom.id A) = RingHom.id (FactorialAffineColimit (1 : A)) := by sorry
lemma factorialUnitCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) :
    factorialUnitCoefficientMap (ψ.comp φ) =
      (factorialUnitCoefficientMap ψ).comp (factorialUnitCoefficientMap φ) := by sorry
lemma factorialCounit.coefficient_naturality (φ : A →+* B) :
    (factorialCounit B).toRingHom.comp (factorialUnitCoefficientMap φ) =
      φ.comp (factorialCounit A).toRingHom := by sorry
def factorialTensorCoefficientMap (φ : A →+* B) (f : A) :
    (FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) →+*
      (FactorialAffineColimit (1 : B) ⊗[B] FactorialAffineColimit (φ f)) := by sorry
lemma factorialTensorCoefficientMap.tmul (φ : A →+* B) (f : A)
    (h : FactorialAffineColimit (1 : A)) (x : FactorialAffineColimit f) :
    factorialTensorCoefficientMap φ f (h ⊗ₜ[A] x) =
      factorialUnitCoefficientMap φ h ⊗ₜ[B] factorialCoefficientMap φ f x := by sorry
lemma factorialTensorCoefficientMap.constant (φ : A →+* B) (f a : A) :
    factorialTensorCoefficientMap φ f (algebraMap A _ a) = algebraMap B _ (φ a) := by sorry
set_option maxHeartbeats 2000000 in
lemma factorialCoaction.coefficient_naturality (φ : A →+* B) (f : A) :
    (factorialTensorCoefficientMap φ f).comp (factorialCoaction f).toRingHom =
      (factorialCoaction (φ f)).toRingHom.comp (factorialCoefficientMap φ f) := by sorry
lemma factorialUnitCoefficientMap.universal_scalars (φ : A →+* B) :
    factorialRootScalars.map (factorialUnitCoefficientMap φ) (factorialUniversalScalars A) =
      factorialUniversalScalars B := by sorry
lemma factorialUnitCoefficientMap.inverse_value (φ : A →+* B) (i : ℕ) :
    factorialUnitCoefficientMap φ
      (((factorialUniversalScalars A)⁻¹).val i : FactorialAffineColimit (1 : A)) =
      (((factorialUniversalScalars B)⁻¹).val i : FactorialAffineColimit (1 : B)) := by sorry
lemma factorialAntipode.coefficient_naturality (φ : A →+* B) :
    (factorialAntipode B).toRingHom.comp (factorialUnitCoefficientMap φ) =
      (factorialUnitCoefficientMap φ).comp (factorialAntipode A).toRingHom := by sorry
lemma factorialTensorCoefficientMap.root (φ : A →+* B) (f : A) (i : ℕ) :
    factorialTensorCoefficientMap φ f
      (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _) ⊗ₜ[A]
        factorialAffineInclusion f i (AdjoinRoot.root _)) =
      factorialAffineInclusion (1 : B) i (AdjoinRoot.root _) ⊗ₜ[B]
        factorialAffineInclusion (φ f) i (AdjoinRoot.root _) := by sorry
lemma factorialTensorCoefficientMap.id (f : A) :
    factorialTensorCoefficientMap (RingHom.id A) f = RingHom.id _ := by sorry
lemma factorialTensorCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) (f : A) :
    factorialTensorCoefficientMap (ψ.comp φ) f =
      (factorialTensorCoefficientMap ψ (φ f)).comp (factorialTensorCoefficientMap φ f) := by sorry
end FactorialCoefficientCoaction
end TauCeti.RootStack
namespace TauCeti.RootStack
section CoefficientNaturalityTests
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
open scoped TensorProduct
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

-- coefficientUnitTests.reduction_two
example : factorialUnitCoefficientMap (Int.castRingHom (ZMod 2))
    (algebraMap ℤ _ 2) = 0 := by sorry
-- coefficientUnitTests.identity
example (x : FactorialAffineColimit (1 : A)) :
    factorialUnitCoefficientMap (RingHom.id A) x = x := by sorry
-- coefficientUnitTests.composition
example (φ : A →+* B) (ψ : B →+* C) (x : FactorialAffineColimit (1 : A)) :
    factorialUnitCoefficientMap (ψ.comp φ) x =
      factorialUnitCoefficientMap ψ (factorialUnitCoefficientMap φ x) := by sorry
-- coefficientUnitTests.zero_ring
example : factorialUnitCoefficientMap (Int.castRingHom (ZMod 1)) 1 = 0 := by sorry
-- coefficientTensorTests.degree_two
example (φ : A →+* B) (f : A) :
    factorialTensorCoefficientMap φ f
      (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) ⊗ₜ[A]
        factorialAffineInclusion f 1 (AdjoinRoot.root _)) =
      factorialAffineInclusion (1 : B) 1 (AdjoinRoot.root _) ⊗ₜ[B]
        factorialAffineInclusion (φ f) 1 (AdjoinRoot.root _) := by sorry
-- coefficientTensorTests.reduction_two
example : factorialTensorCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
    (algebraMap ℤ _ 2) = 0 := by sorry
-- coefficientTensorTests.identity
example (f : A) (x : FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) :
    factorialTensorCoefficientMap (RingHom.id A) f x = x := by sorry
-- coefficientTensorTests.composition
example (φ : A →+* B) (ψ : B →+* C) (f : A)
    (x : FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) :
    factorialTensorCoefficientMap (ψ.comp φ) f x =
      factorialTensorCoefficientMap ψ (φ f) (factorialTensorCoefficientMap φ f x) := by sorry
-- coefficientTensorTests.zero_ring
example : factorialTensorCoefficientMap (Int.castRingHom (ZMod 1)) (0 : ℤ) 1 = 0 := by sorry
-- coefficientCoactionTests.square
example (φ : A →+* B) (f : A) (x : FactorialAffineColimit f) :
    factorialTensorCoefficientMap φ f (factorialCoaction f x) =
      factorialCoaction (φ f) (factorialCoefficientMap φ f x) := by sorry
-- coefficientCounitTests.square
example (φ : A →+* B) (x : FactorialAffineColimit (1 : A)) :
    factorialCounit B (factorialUnitCoefficientMap φ x) = φ (factorialCounit A x) := by sorry
-- coefficientAntipodeTests.square
example (φ : A →+* B) (x : FactorialAffineColimit (1 : A)) :
    factorialAntipode B (factorialUnitCoefficientMap φ x) =
      factorialUnitCoefficientMap φ (factorialAntipode A x) := by sorry
set_option maxHeartbeats 2000000 in
-- coefficientCoactionTests.wild_square_zero
example : (factorialTensorCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
    (factorialCoaction (0 : ℤ)
      (factorialAffineInclusion (0 : ℤ) 1 (AdjoinRoot.root _)))) ^ 2 = 0 := by sorry
set_option maxHeartbeats 2000000 in
-- coefficientCoactionTests.wild_nonzero
example : factorialTensorCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
    (factorialCoaction (0 : ℤ)
      (factorialAffineInclusion (0 : ℤ) 1 (AdjoinRoot.root _))) ≠ 0 := by sorry
end CoefficientNaturalityTests
end TauCeti.RootStack

/-! Convolution points of the factorial unity-root Hopf algebra. -/
namespace TauCeti.RootStack
section FactorialConvolutionPoints
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
variable [Algebra A B] [Algebra A C]
open WithConv
local instance : Bialgebra A (FactorialAffineColimit (1 : A)) := factorialBialgebra A

lemma factorialConvPoints.root
    (p q : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) (i : ℕ) :
    (p * q).ofConv (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) =
      p.ofConv (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) *
      q.ofConv (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) := by sorry

lemma factorialConvPoints.one_root (i : ℕ) :
    (1 : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)).ofConv
      (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) = 1 := by sorry

lemma factorialScalarPoints.conv_mul
    (p q : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) :
    factorialScalarPoints (p * q).ofConv =
      factorialScalarPoints p.ofConv * factorialScalarPoints q.ofConv := by sorry

lemma factorialScalarPoints.conv_one :
    factorialScalarPoints
      (1 : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)).ofConv = 1 := by sorry

lemma factorialScalarEvaluation.conv_mul (s t : factorialRootScalars B) :
    toConv (factorialScalarEvaluation (A := A) (s*t)) =
      toConv (factorialScalarEvaluation (A := A) s) *
        toConv (factorialScalarEvaluation (A := A) t) := by sorry

lemma factorialScalarEvaluation.conv_one :
    toConv (factorialScalarEvaluation (A := A) (1 : factorialRootScalars B)) =
      (1 : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) := by sorry

lemma factorialScalarPoints.antipode
    (p : FactorialAffineColimit (1 : A) →ₐ[A] B) :
    factorialScalarPoints (p.comp (factorialAntipode A)) = (factorialScalarPoints p)⁻¹ := by sorry

lemma factorialScalarEvaluation.antipode (s : factorialRootScalars B) :
    factorialScalarEvaluation (A := A) s⁻¹ =
      (factorialScalarEvaluation (A := A) s).comp (factorialAntipode A) := by sorry

lemma factorialConvPoints.left_inverse
    (p : FactorialAffineColimit (1 : A) →ₐ[A] B) :
    toConv (p.comp (factorialAntipode A)) * toConv p =
      (1 : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) := by sorry

lemma factorialConvPoints.right_inverse
    (p : FactorialAffineColimit (1 : A) →ₐ[A] B) :
    toConv p * toConv (p.comp (factorialAntipode A)) =
      (1 : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) := by sorry

def factorialScalarPointsMulEquiv (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] :
    WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B) ≃* factorialRootScalars B := by sorry

lemma factorialScalarPointsMulEquiv.apply
    (p : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) :
    factorialScalarPointsMulEquiv A B p = factorialScalarPoints p.ofConv := by sorry

lemma factorialScalarPointsMulEquiv.symm_apply (s : factorialRootScalars B) :
    (factorialScalarPointsMulEquiv A B).symm s =
      toConv (factorialScalarEvaluation (A := A) s) := by sorry

lemma factorialScalarPointsMulEquiv.naturality
    (p : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) (k : B →ₐ[A] C) :
    factorialScalarPointsMulEquiv A C (toConv (k.comp p.ofConv)) =
      factorialRootScalars.map k.toRingHom (factorialScalarPointsMulEquiv A B p) := by sorry

lemma factorialScalarEvaluation.naturality (s : factorialRootScalars B) (k : B →ₐ[A] C) :
    k.comp (factorialScalarEvaluation (A := A) s) =
      factorialScalarEvaluation (A := A) (factorialRootScalars.map k.toRingHom s) := by sorry

lemma factorialScalarPointsMulEquiv.pow
    (p : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) (n : ℕ) :
    factorialScalarPointsMulEquiv A B (p^n) =
      (factorialScalarPointsMulEquiv A B p)^n := by sorry

lemma factorialScalarPointsMulEquiv.mul
    (p q : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) :
    factorialScalarPointsMulEquiv A B (p*q) =
      factorialScalarPointsMulEquiv A B p * factorialScalarPointsMulEquiv A B q := by sorry

lemma factorialScalarPointsMulEquiv.one : factorialScalarPointsMulEquiv A B 1 = 1 := by sorry

lemma factorialScalarPointsMulEquiv.root
    (p : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) (i : ℕ) :
    ((factorialScalarPointsMulEquiv A B p).val i : B) =
      p.ofConv (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) := by sorry

lemma factorialConvPoints.comm
    (p q : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) : p*q = q*p := by sorry

-- test: convolutionPointsTests.degree_two
example (s t : factorialRootScalars (ZMod 4)) :
    (toConv (factorialScalarEvaluation (A := ZMod 4) s) *
      toConv (factorialScalarEvaluation (A := ZMod 4) t)).ofConv
      (factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _)) =
      (s.val 1 : ZMod 4) * (t.val 1 : ZMod 4) := by sorry

-- test: convolutionPointsTests.identity
example : factorialScalarPointsMulEquiv A B 1 = 1 := by sorry

-- test: convolutionPointsTests.roundtrip
example (p : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) :
    (factorialScalarPointsMulEquiv A B).symm (factorialScalarPointsMulEquiv A B p) = p := by sorry

-- test: convolutionPointsTests.inverse
example (p : FactorialAffineColimit (1 : A) →ₐ[A] B) :
    toConv (p.comp (factorialAntipode A)) * toConv p =
      (1 : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) := by sorry

-- test: convolutionPointsTests.zero_ring
example : factorialScalarPointsMulEquiv (ZMod 1) (ZMod 1) 1 = 1 := by sorry

-- test: convolutionPointsTests.counit_not_identity
example : (factorialScalarPointsMulEquiv (ZMod 3)
    (FactorialAffineColimit (1 : ZMod 3))
    (toConv (AlgHom.id (ZMod 3) (FactorialAffineColimit (1 : ZMod 3))))).val 1 ≠ 1 := by sorry

-- test: convolutionPointsTests.naturality
example (s : factorialRootScalars B) (k : B →ₐ[A] C) :
    factorialScalarPointsMulEquiv A C
      (toConv (k.comp (factorialScalarEvaluation (A := A) s))) =
      factorialRootScalars.map k.toRingHom s := by sorry

-- test: convolutionPointsTests.root_order
example (p : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) (i : ℕ) :
    p.ofConv (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) ^
      Nat.factorial (i+1) = 1 := by sorry

end FactorialConvolutionPoints
end TauCeti.RootStack

/-! Native action on factorial affine-chart points, distinct from quotient descent. -/
namespace TauCeti.RootStack
section FactorialPointAction
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
variable [Algebra A B] [Algebra A C]
open WithConv
open scoped TensorProduct
local instance : Bialgebra A (FactorialAffineColimit (1 : A)) := factorialBialgebra A

def factorialPointAction (f : A)
    (g : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B) : FactorialAffineColimit f →ₐ[A] B := by
  sorry

lemma factorialPointAction.root (f : A)
    (g : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B) (i : ℕ) :
    factorialPointAction f g x (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      g.ofConv (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) *
        x (factorialAffineInclusion f i (AdjoinRoot.root _)) := by
  sorry

lemma factorialPointAction.constant (f a : A)
    (g : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B) :
    factorialPointAction f g x (algebraMap A _ a) = algebraMap A B a := by
  sorry

lemma factorialPointAction.one (f : A) (x : FactorialAffineColimit f →ₐ[A] B) :
    factorialPointAction f 1 x = x := by
  sorry

lemma factorialPointAction.mul (f : A)
    (g h : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B) :
    factorialPointAction f (g*h) x =
      factorialPointAction f g (factorialPointAction f h x) := by
  sorry

@[instance_reducible]
def factorialPointMulAction (f : A) :
    MulAction (WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
      (FactorialAffineColimit f →ₐ[A] B) := by
  sorry

lemma factorialPointMulAction.smul (f : A)
    (g : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B) :
    let := factorialPointMulAction (B := B) f
    g • x = factorialPointAction f g x := by
  sorry

lemma factorialPointAction.naturality (f : A)
    (g : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B) (k : B →ₐ[A] C) :
    k.comp (factorialPointAction f g x) =
      factorialPointAction f (toConv (k.comp g.ofConv)) (k.comp x) := by
  sorry

lemma factorialPointAction.scaling (f : A) (s : factorialRootScalars A)
    (x : FactorialAffineColimit f →ₐ[A] B) :
    factorialPointAction f
      (toConv ((Algebra.ofId A B).comp (factorialScalarEvaluation (A := A) s))) x =
        x.comp (factorialScale f s) := by
  sorry

lemma factorialPointAction.universal (f : A) :
    factorialPointAction f
      (toConv (Algebra.TensorProduct.includeLeft :
        FactorialAffineColimit (1 : A) →ₐ[A]
          FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f))
      (Algebra.TensorProduct.includeRight : FactorialAffineColimit f →ₐ[A]
        FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) =
          factorialCoaction f := by
  sorry

lemma factorialPointAction.left_inverse (f : A)
    (g : FactorialAffineColimit (1 : A) →ₐ[A] B)
    (x : FactorialAffineColimit f →ₐ[A] B) :
    factorialPointAction f (toConv (g.comp (factorialAntipode A)))
      (factorialPointAction f (toConv g) x) = x := by
  sorry

lemma factorialPointAction.right_inverse (f : A)
    (g : FactorialAffineColimit (1 : A) →ₐ[A] B)
    (x : FactorialAffineColimit f →ₐ[A] B) :
    factorialPointAction f (toConv g)
      (factorialPointAction f (toConv (g.comp (factorialAntipode A))) x) = x := by
  sorry

lemma factorialPointAction.fixed_zero_roots (f : A)
    (g : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B)
    (hx : ∀ i, x (factorialAffineInclusion f i (AdjoinRoot.root _)) = 0) :
    factorialPointAction f g x = x := by
  sorry

-- pointActionTests.degree_two
example (g : WithConv (FactorialAffineColimit (1 : ZMod 4) →ₐ[ZMod 4] ZMod 4))
    (x : FactorialAffineColimit (0 : ZMod 4) →ₐ[ZMod 4] ZMod 4) :
    factorialPointAction (0 : ZMod 4) g x
      (factorialAffineInclusion (0 : ZMod 4) 1 (AdjoinRoot.root _)) =
      g.ofConv (factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _)) *
        x (factorialAffineInclusion (0 : ZMod 4) 1 (AdjoinRoot.root _)) := by
  sorry

-- pointActionTests.identity
example (f : A) (x : FactorialAffineColimit f →ₐ[A] B) :
    factorialPointAction f 1 x = x := by
  sorry

-- pointActionTests.universal
example (f : A) :
    factorialPointAction f
      (toConv (Algebra.TensorProduct.includeLeft :
        FactorialAffineColimit (1 : A) →ₐ[A]
          FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f))
      (Algebra.TensorProduct.includeRight : FactorialAffineColimit f →ₐ[A]
        FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) =
          factorialCoaction f := by
  sorry

-- pointActionTests.fixed_zero_roots
example (g : WithConv (FactorialAffineColimit (1 : ZMod 2) →ₐ[ZMod 2] ZMod 2))
    (x : FactorialAffineColimit (0 : ZMod 2) →ₐ[ZMod 2] ZMod 2)
    (hx : ∀ i, x (factorialAffineInclusion (0 : ZMod 2) i (AdjoinRoot.root _)) = 0) :
    factorialPointAction (0 : ZMod 2) g x = x := by
  sorry

-- pointMulActionTests.identity
example (f : A) (x : FactorialAffineColimit f →ₐ[A] B) :
    let := factorialPointMulAction (B := B) f
    (1 : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B)) • x = x := by
  sorry

-- pointMulActionTests.composition
example (f : A) (g h : WithConv (FactorialAffineColimit (1 : A) →ₐ[A] B))
    (x : FactorialAffineColimit f →ₐ[A] B) :
    let := factorialPointMulAction (B := B) f
    (g*h) • x = g • (h • x) := by
  sorry

-- pointMulActionTests.zero_ring
example (x : FactorialAffineColimit (0 : ZMod 1) →ₐ[ZMod 1] ZMod 1) :
    let := factorialPointMulAction (B := ZMod 1) (0 : ZMod 1)
    (1 : WithConv (FactorialAffineColimit (1 : ZMod 1) →ₐ[ZMod 1] ZMod 1)) • x = x := by
  sorry


end FactorialPointAction
end TauCeti.RootStack

/- BEGIN FINITE CYCLIC COORDINATES -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct

def affineUnitCharacter (n : ℕ) [NeZero n] :
    Multiplicative (ZMod n) →* AffineRing (1 : A) n := by
  sorry

lemma affineUnitCharacter.natCast (n k : ℕ) [NeZero n] :
    affineUnitCharacter (A := A) n (Multiplicative.ofAdd (k : ZMod n)) =
      AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (1 : A)) ^ k := by
  sorry

def affineUnitToCyclic (n : ℕ) [NeZero n] :
    AffineRing (1 : A) n →ₐ[A] MuHopf A n := by
  sorry

lemma affineUnitToCyclic.root (n : ℕ) [NeZero n] :
    affineUnitToCyclic (A := A) n (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (1 : A))) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) := by
  sorry

def affineUnitFromCyclic (n : ℕ) [NeZero n] :
    MuHopf A n →ₐ[A] AffineRing (1 : A) n := by
  sorry

lemma affineUnitFromCyclic.single (n : ℕ) [NeZero n] (k : ZMod n) (a : A) :
    affineUnitFromCyclic n (MonoidAlgebra.single (Multiplicative.ofAdd k) a) =
      a • AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (1 : A)) ^ k.val := by
  sorry

lemma affineUnitCyclic.left_inverse (n : ℕ) [NeZero n] :
    (affineUnitFromCyclic (A := A) n).comp (affineUnitToCyclic n) =
      AlgHom.id A (AffineRing (1 : A) n) := by
  sorry

lemma affineUnitCyclic.right_inverse (n : ℕ) [NeZero n] :
    (affineUnitToCyclic (A := A) n).comp (affineUnitFromCyclic n) =
      AlgHom.id A (MuHopf A n) := by
  sorry

def affineUnitCyclicEquiv (n : ℕ) [NeZero n] :
    AffineRing (1 : A) n ≃ₐ[A] MuHopf A n := by
  sorry

lemma affineUnitCyclicEquiv.root (n : ℕ) [NeZero n] :
    affineUnitCyclicEquiv (A := A) n (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (1 : A))) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) := by
  sorry

lemma affineUnitCyclicEquiv.inverse_single (n : ℕ) [NeZero n] (k : ZMod n) (a : A) :
    (affineUnitCyclicEquiv n).symm (MonoidAlgebra.single (Multiplicative.ofAdd k) a) =
      a • AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (1 : A)) ^ k.val := by
  sorry

lemma affineUnitCyclicEquiv.coaction (n : ℕ) [NeZero n] :
    (Algebra.TensorProduct.map (AlgHom.id A (MuHopf A n))
      (affineUnitCyclicEquiv n).toAlgHom).comp (affineCoaction (1 : A) n) =
      (Bialgebra.comulAlgHom A (MuHopf A n)).comp (affineUnitCyclicEquiv n).toAlgHom := by
  sorry

lemma affineUnitCyclicEquiv.divisibility_single (n N : ℕ) [NeZero n] [NeZero N]
    (h : n ∣ N) (k : ZMod n) (a : A) :
    affineUnitCyclicEquiv N
      (affineDivisibility (1 : A) n N h
        ((affineUnitCyclicEquiv n).symm (MonoidAlgebra.single (Multiplicative.ofAdd k) a))) =
      MonoidAlgebra.single (Multiplicative.ofAdd ((N / n * k.val : ℕ) : ZMod N)) a := by
  sorry

lemma affineUnitCyclicEquiv.counit (n : ℕ) [NeZero n] :
    (Bialgebra.counitAlgHom A (MuHopf A n)).comp (affineUnitCyclicEquiv n).toAlgHom =
      AdjoinRoot.liftAlgHom (Polynomial.X ^ n - Polynomial.C (1 : A))
        (AlgHom.id A A) (1 : A) (by simp) := by
  sorry

lemma affineUnitCyclicEquiv.antipode_root (n : ℕ) [NeZero n] :
    HopfAlgebra.antipode A (affineUnitCyclicEquiv n
      (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (1 : A)))) =
      affineUnitCyclicEquiv n
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (1 : A)) ^ (n - 1)) := by
  sorry

-- TauCeti.RootStack.affineUnitCharacter.test_one
example (g : Multiplicative (ZMod 1)) : affineUnitCharacter (A := A) 1 g = 1 := by
  sorry

-- TauCeti.RootStack.affineUnitCharacter.test_wrap
example : affineUnitCharacter (A := A) 2 (Multiplicative.ofAdd (3 : ZMod 2)) =
    AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : A)) := by
  sorry

-- TauCeti.RootStack.affineUnitCharacter.test_square
example : (affineUnitCharacter (A := A) 2 (Multiplicative.ofAdd (1 : ZMod 2))) ^ 2 = 1 := by
  sorry

-- TauCeti.RootStack.affineUnitToCyclic.test_one
example : affineUnitToCyclic (A := A) 1 (AdjoinRoot.root (Polynomial.X ^ 1 - Polynomial.C (1 : A))) = 1 := by
  sorry

-- TauCeti.RootStack.affineUnitToCyclic.test_cube
example : affineUnitToCyclic (A := A) 3
    (AdjoinRoot.root (Polynomial.X ^ 3 - Polynomial.C (1 : A)) ^ 4) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 3)) (1 : A) := by
  sorry

-- TauCeti.RootStack.affineUnitToCyclic.test_zeroRing
example [Subsingleton A] (n : ℕ) [NeZero n] (x : AffineRing (1 : A) n) :
    affineUnitToCyclic n x = 0 := by
  sorry

-- TauCeti.RootStack.affineUnitFromCyclic.test_constant
example (a : A) : affineUnitFromCyclic 1 (MonoidAlgebra.single (Multiplicative.ofAdd (0 : ZMod 1)) a) =
    algebraMap A (AffineRing (1 : A) 1) a := by
  sorry

-- TauCeti.RootStack.affineUnitFromCyclic.test_nontrivial_basis
example : affineUnitFromCyclic 4 (MonoidAlgebra.single (Multiplicative.ofAdd (3 : ZMod 4)) (2 : A)) =
    (2 : A) • AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C (1 : A)) ^ 3 := by
  sorry

-- TauCeti.RootStack.affineUnitFromCyclic.test_multiplication
example : affineUnitFromCyclic 2
    (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : A) *
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : A)) = 1 := by
  sorry

-- TauCeti.RootStack.affineUnitCyclicEquiv.test_transition_two_six
example : affineUnitCyclicEquiv 6
    (affineDivisibility (1 : ℤ) 2 6 (by decide)
      ((affineUnitCyclicEquiv 2).symm (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ℤ)))) =
      MonoidAlgebra.single (Multiplicative.ofAdd (3 : ZMod 6)) (1 : ℤ) := by
  sorry

-- TauCeti.RootStack.affineUnitCyclicEquiv.test_wild_nilpotent
example :
    let x := AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 2)) - 1
    x ≠ 0 ∧ x ^ 2 = 0 := by
  sorry

-- TauCeti.RootStack.affineUnitCyclicEquiv.test_zeroRing
example [Subsingleton A] (n : ℕ) [NeZero n] (x : MuHopf A n) :
    affineUnitCyclicEquiv n ((affineUnitCyclicEquiv n).symm x) = x := by
  sorry

end TauCeti.RootStack
/- END FINITE CYCLIC COORDINATES -/

/- BEGIN INFINITE RATIONAL CHARACTERS -/
noncomputable section
universe uQZ
namespace TauCeti.RootStack
variable {A : Type uQZ} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩
local instance (q : ℚ) : NeZero q.den := ⟨Nat.ne_of_gt q.den_pos⟩
open scoped TensorProduct

def affineQZCharacter (n : ℕ) [NeZero n] : ZMod n →+ AddCircle (1 : ℚ) := by
  sorry

lemma affineQZCharacter.intCast (n : ℕ) [NeZero n] (k : ℤ) :
    affineQZCharacter n (k : ZMod n) = ((k / (n : ℚ) : ℚ) : AddCircle (1 : ℚ)) := by
  sorry

lemma affineQZCharacter.one (n : ℕ) [NeZero n] :
    affineQZCharacter n 1 = ((1 / (n : ℚ) : ℚ) : AddCircle (1 : ℚ)) := by
  sorry

lemma affineQZCharacter.injective (n : ℕ) [NeZero n] :
    Function.Injective (affineQZCharacter n) := by
  sorry

lemma affineQZCharacter.divisibility (n N : ℕ) [NeZero n] [NeZero N]
    (h : n ∣ N) (k : ZMod n) :
    affineQZCharacter N ((N / n * k.val : ℕ) : ZMod N) = affineQZCharacter n k := by
  sorry

lemma affineQZCharacter.exhaustive (u : AddCircle (1 : ℚ)) :
    ∃ (n : ℕ) (hn : 0 < n),
      ∃ k : ZMod n, @affineQZCharacter n ⟨Nat.ne_of_gt hn⟩ k = u := by
  sorry

def finiteQZAlgMap (A : Type uQZ) [CommRing A] (n : ℕ) [NeZero n] :
    MuHopf A n →ₐ[A] MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) := by
  sorry

lemma finiteQZAlgMap.single (n : ℕ) [NeZero n] (k : ZMod n) (a : A) :
    finiteQZAlgMap A n (MonoidAlgebra.single (Multiplicative.ofAdd k) a) =
      MonoidAlgebra.single (Multiplicative.ofAdd (affineQZCharacter n k)) a := by
  sorry

lemma finiteQZAlgMap.injective (n : ℕ) [NeZero n] :
    Function.Injective (finiteQZAlgMap A n) := by
  sorry

lemma finiteQZAlgMap.transition (n N : ℕ) [NeZero n] [NeZero N]
    (h : n ∣ N) (k : ZMod n) (a : A) :
    finiteQZAlgMap A N (MonoidAlgebra.single
      (Multiplicative.ofAdd ((N / n * k.val : ℕ) : ZMod N)) a) =
      finiteQZAlgMap A n (MonoidAlgebra.single (Multiplicative.ofAdd k) a) := by
  sorry

def finiteRootQZMap (A : Type uQZ) [CommRing A] (n : ℕ) [NeZero n] :
    AffineRing (1 : A) n →ₐ[A] MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) := by
  sorry

lemma finiteRootQZMap.root (n : ℕ) [NeZero n] :
    finiteRootQZMap A n (AdjoinRoot.root _) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (n : ℚ) : ℚ) : AddCircle (1 : ℚ)))) 1 := by
  sorry

lemma finiteRootQZMap.injective (n : ℕ) [NeZero n] :
    Function.Injective (finiteRootQZMap A n) := by
  sorry

lemma finiteRootQZMap.transition (n N : ℕ) [NeZero n] [NeZero N] (h : n ∣ N) :
    (finiteRootQZMap A N).comp (affineDivisibility (1 : A) n N h) = finiteRootQZMap A n := by
  sorry

lemma factorialQZRoot_power (A : Type uQZ) [CommRing A] (i : ℕ) :
    (MonoidAlgebra.single (Multiplicative.ofAdd
      (((1 / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ))))
      (1 : A)) ^ Nat.factorial (i+1) = 1 := by
  sorry

lemma factorialQZRoot_transition (A : Type uQZ) [CommRing A] (i j : ℕ) (h : i ≤ j) :
    (MonoidAlgebra.single (Multiplicative.ofAdd
      (((1 / (Nat.factorial (j+1) : ℚ) : ℚ) : AddCircle (1 : ℚ))))
      (1 : A)) ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ)))) 1 := by
  sorry

def factorialUnitQZMap (A : Type uQZ) [CommRing A] :
    FactorialAffineColimit (1 : A) →ₐ[A]
      MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) := by
  sorry

lemma factorialUnitQZMap.root (A : Type uQZ) [CommRing A] (i : ℕ) :
    factorialUnitQZMap A (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ)))) 1 := by
  sorry

lemma factorialUnitQZMap.leg (A : Type uQZ) [CommRing A] (n : RootDivIndex)
    (x : AffineRing (1 : A) n.exponent) :
    factorialUnitQZMap A (factorialAffineExtension (1 : A) n x) =
      finiteRootQZMap A n.exponent x := by
  sorry

lemma factorialUnitQZMap.injective (A : Type uQZ) [CommRing A] :
    Function.Injective (factorialUnitQZMap A) := by
  sorry

lemma factorialUnitQZMap.surjective (A : Type uQZ) [CommRing A] :
    Function.Surjective (factorialUnitQZMap A) := by
  sorry

def factorialUnitQZEquiv (A : Type uQZ) [CommRing A] :
    FactorialAffineColimit (1 : A) ≃ₐ[A]
      MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) := by
  sorry

lemma factorialUnitQZEquiv.root (A : Type uQZ) [CommRing A] (i : ℕ) :
    factorialUnitQZEquiv A (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ)))) 1 := by
  sorry

lemma factorialUnitQZEquiv.inverse_single_den (A : Type uQZ) [CommRing A] (q : ℚ) (a : A) :
    (factorialUnitQZEquiv A).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (q : AddCircle (1 : ℚ))) a) =
      factorialAffineExtension (1 : A) ⟨q.den, q.den_pos⟩
        ((affineUnitCyclicEquiv (A := A) q.den).symm
          (MonoidAlgebra.single (Multiplicative.ofAdd (q.num : ZMod q.den)) a)) := by
  sorry

lemma factorialUnitQZEquiv.comul (A : Type uQZ) [CommRing A]
    (x : FactorialAffineColimit (1 : A)) :
    Algebra.TensorProduct.map (factorialUnitQZEquiv A).toAlgHom
      (factorialUnitQZEquiv A).toAlgHom (factorialCoaction (1 : A) x) =
      Coalgebra.comul (R := A) (factorialUnitQZEquiv A x) := by
  sorry

lemma factorialUnitQZEquiv.counit (A : Type uQZ) [CommRing A]
    (x : FactorialAffineColimit (1 : A)) :
    Coalgebra.counit (R := A) (factorialUnitQZEquiv A x) = factorialCounit A x := by
  sorry

lemma factorialUnitQZEquiv.antipode (A : Type uQZ) [CommRing A]
    (x : FactorialAffineColimit (1 : A)) :
    HopfAlgebra.antipode A (factorialUnitQZEquiv A x) =
      factorialUnitQZEquiv A (factorialAntipode A x) := by
  sorry

lemma factorialUnitQZEquiv.coefficient_natural {B : Type uQZ} [CommRing B]
    (φ : A →+* B) (x : FactorialAffineColimit (1 : A)) :
    MonoidAlgebra.mapRingHom (Multiplicative (AddCircle (1 : ℚ))) φ
      (factorialUnitQZEquiv A x) =
      factorialUnitQZEquiv B (factorialUnitCoefficientMap φ x) := by
  sorry

-- TauCeti.RootStack.affineQZCharacter.test_one
example  : affineQZCharacter 1 1 = 0 := by
  sorry
-- TauCeti.RootStack.affineQZCharacter.test_orientation
example  : affineQZCharacter 3 1 ≠ (((2 / 3 : ℚ) : AddCircle (1 : ℚ))) := by
  sorry
-- TauCeti.RootStack.affineQZCharacter.test_two_six
example  : affineQZCharacter 6 (3 : ZMod 6) = (((1 / 2 : ℚ) : AddCircle (1 : ℚ))) := by
  sorry
-- TauCeti.RootStack.finiteQZAlgMap.test_constant
example (a : A) : finiteQZAlgMap A 1 (MonoidAlgebra.single (Multiplicative.ofAdd (0 : ZMod 1)) a) = algebraMap A _ a := by
  sorry
-- TauCeti.RootStack.finiteQZAlgMap.test_negative
example (a : A) : finiteQZAlgMap A 3 (MonoidAlgebra.single (Multiplicative.ofAdd (-1 : ZMod 3)) a) = MonoidAlgebra.single (Multiplicative.ofAdd (((-1 / 3 : ℚ) : AddCircle (1 : ℚ)))) a := by
  sorry
-- TauCeti.RootStack.finiteQZAlgMap.test_wild
example  : let v := finiteQZAlgMap (ZMod 2) 2 (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) 1 - 1); v ≠ 0 ∧ v ^ 2 = 0 := by
  sorry
-- TauCeti.RootStack.finiteRootQZMap.test_one
example  : finiteRootQZMap A 1 (AdjoinRoot.root _) = 1 := by
  sorry
-- TauCeti.RootStack.finiteRootQZMap.test_three
example  : finiteRootQZMap A 3 (AdjoinRoot.root _) = MonoidAlgebra.single (Multiplicative.ofAdd (((1 / 3 : ℚ) : AddCircle (1 : ℚ)))) 1 := by
  sorry
-- TauCeti.RootStack.finiteRootQZMap.test_zero_ring
example  : Function.Injective (finiteRootQZMap (ZMod 1) 2) := by
  sorry
-- TauCeti.RootStack.factorialUnitQZMap.test_level_zero
example  : factorialUnitQZMap A (factorialAffineInclusion (1 : A) 0 (AdjoinRoot.root _)) = 1 := by
  sorry
-- TauCeti.RootStack.factorialUnitQZMap.test_level_two
example  : factorialUnitQZMap A (factorialAffineInclusion (1 : A) 2 (AdjoinRoot.root _)) = MonoidAlgebra.single (Multiplicative.ofAdd (((1 / 6 : ℚ) : AddCircle (1 : ℚ)))) 1 := by
  sorry
-- TauCeti.RootStack.factorialUnitQZMap.test_torsion_coefficients
example  : factorialUnitQZMap (ZMod 4) (2 * factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _)) = MonoidAlgebra.single (Multiplicative.ofAdd (((1 / 2 : ℚ) : AddCircle (1 : ℚ)))) 2 := by
  sorry
-- TauCeti.RootStack.factorialUnitQZEquiv.test_inverse_negative
example  : (factorialUnitQZEquiv A).symm (MonoidAlgebra.single (Multiplicative.ofAdd (((-1 / 3 : ℚ) : AddCircle (1 : ℚ)))) 1) = factorialAffineExtension (1 : A) ⟨3, by decide⟩ ((AdjoinRoot.root _) ^ 2) := by
  sorry
-- TauCeti.RootStack.factorialUnitQZEquiv.test_wild_hopf
example  : let v := factorialUnitQZEquiv (ZMod 2) (factorialAffineInclusion (1 : ZMod 2) 1 (AdjoinRoot.root _) - 1); v ≠ 0 ∧ v ^ 2 = 0 ∧ Coalgebra.comul (R := ZMod 2) v = v ⊗ₜ[ZMod 2] v + v ⊗ₜ[ZMod 2] (1 : MonoidAlgebra (ZMod 2) (Multiplicative (AddCircle (1 : ℚ)))) + (1 : MonoidAlgebra (ZMod 2) (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[ZMod 2] v := by
  sorry
-- TauCeti.RootStack.factorialUnitQZEquiv.test_nonflat_coefficients
example (x : FactorialAffineColimit (1 : ℤ)) : MonoidAlgebra.mapRingHom (Multiplicative (AddCircle (1 : ℚ))) (Int.castRingHom (ZMod 2)) (factorialUnitQZEquiv ℤ x) = factorialUnitQZEquiv (ZMod 2) (factorialUnitCoefficientMap (Int.castRingHom (ZMod 2)) x) := by
  sorry

end TauCeti.RootStack
end
/- END INFINITE RATIONAL CHARACTERS -/

/-! Rational-character LEFT coaction on the actual arbitrary-section root chart.
Compilation receipts are in the handoff. No geometric fpqc quotient is inferred.
The parameter f is not a unit assumption. Characters stay in the first factor. -/
noncomputable section
universe uQZCoact
namespace TauCeti.RootStack
variable {A : Type uQZCoact} [CommRing A]
open scoped TensorProduct

def factorialQZCoaction (f : A) :
    FactorialAffineColimit f →ₐ[A]
      (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
        FactorialAffineColimit f) := by
  sorry

lemma factorialQZCoaction.transport (f : A) :
    factorialQZCoaction f =
      (Algebra.TensorProduct.map (factorialUnitQZEquiv A).toAlgHom
        (AlgHom.id A (FactorialAffineColimit f))).comp (factorialCoaction f) := by
  sorry

lemma factorialQZCoaction.root (f : A) (i : ℕ) :
    factorialQZCoaction f (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ))))
        (1 : A) ⊗ₜ[A]
          factorialAffineInclusion f i (AdjoinRoot.root _) := by
  sorry

lemma factorialQZCoaction.constant (f a : A) :
    factorialQZCoaction f (algebraMap A _ a) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        algebraMap A (FactorialAffineColimit f) a := by
  sorry

lemma factorialQZCoaction.power (f : A) (i k : ℕ) :
    factorialQZCoaction f ((factorialAffineInclusion f i (AdjoinRoot.root _)) ^ k) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((k / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ))))
        (1 : A) ⊗ₜ[A]
          ((factorialAffineInclusion f i (AdjoinRoot.root _)) ^ k) := by
  sorry

lemma factorialQZCoaction.counit (f : A) :
    ((Algebra.TensorProduct.lid A (FactorialAffineColimit f)).toAlgHom.comp
      (Algebra.TensorProduct.map
        (Bialgebra.counitAlgHom A
          (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))))
        (AlgHom.id A (FactorialAffineColimit f)))).comp (factorialQZCoaction f) =
      AlgHom.id A (FactorialAffineColimit f) := by
  sorry

lemma factorialQZCoaction.coassoc (f : A) :
    let G := MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))
    (Algebra.TensorProduct.assoc A A A G G (FactorialAffineColimit f)).toAlgHom.comp
      ((Algebra.TensorProduct.map (Bialgebra.comulAlgHom A G)
        (AlgHom.id A (FactorialAffineColimit f))).comp (factorialQZCoaction f)) =
      (Algebra.TensorProduct.map (AlgHom.id A G) (factorialQZCoaction f)).comp
        (factorialQZCoaction f) := by
  sorry

lemma factorialQZCoaction.injective (f : A) :
    Function.Injective (factorialQZCoaction f) := by
  sorry

lemma factorialQZCoaction.coinvariant_iff (f : A) (x : FactorialAffineColimit f) :
    factorialQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x ↔
    factorialCoaction f x = (1 : FactorialAffineColimit (1 : A)) ⊗ₜ[A] x := by
  sorry

lemma factorialQZCoaction.unity (x : FactorialAffineColimit (1 : A)) :
    Algebra.TensorProduct.map
      (AlgHom.id A (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))))
      (factorialUnitQZEquiv A).toAlgHom (factorialQZCoaction (1 : A) x) =
      Coalgebra.comul (R := A) (factorialUnitQZEquiv A x) := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_level_zero
example (f : A) :
    factorialQZCoaction f (factorialAffineInclusion f 0 (AdjoinRoot.root _)) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        algebraMap A (FactorialAffineColimit f) f := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_sixth_root
example :
    factorialQZCoaction (2 : ZMod 4)
      ((factorialAffineInclusion (2 : ZMod 4) 2 (AdjoinRoot.root _)) ^ 2) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / 3 : ℚ) : AddCircle (1 : ℚ)))) (1 : ZMod 4) ⊗ₜ[ZMod 4]
          ((factorialAffineInclusion (2 : ZMod 4) 2 (AdjoinRoot.root _)) ^ 2) := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_native_transport
example (f : A) (x : FactorialAffineColimit f) :
    factorialQZCoaction f x =
      Algebra.TensorProduct.map (factorialUnitQZEquiv A).toAlgHom
        (AlgHom.id A (FactorialAffineColimit f)) (factorialCoaction f x) := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_wild_zero_section
example :
    let u := factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _)
    factorialQZCoaction (0 : ZMod 2) u ≠
      (1 : MonoidAlgebra (ZMod 2) (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[ZMod 2] u := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_unity
example (x : FactorialAffineColimit (1 : A)) :
    Algebra.TensorProduct.map
      (AlgHom.id A (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))))
      (factorialUnitQZEquiv A).toAlgHom (factorialQZCoaction (1 : A) x) =
      Coalgebra.comul (R := A) (factorialUnitQZEquiv A x) := by
  sorry

end TauCeti.RootStack
end

/-! Arbitrary-section rational-character coefficient change.
The Q/Z equivalence and incoming rational coaction are admitted inputs in the
typing harness. The following bodies are authored conditional deductions. -/
noncomputable section
universe uQZCoeff
namespace TauCeti.RootStack
variable {A B C : Type uQZCoeff} [CommRing A] [CommRing B] [CommRing C]
open scoped TensorProduct

def factorialQZTensorCoefficientMap (φ : A →+* B) (f : A) :
    (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
      FactorialAffineColimit f) →+*
    (MonoidAlgebra B (Multiplicative (AddCircle (1 : ℚ))) ⊗[B]
      FactorialAffineColimit (φ f)) := by
  sorry

lemma factorialQZTensorCoefficientMap.tmul (φ : A →+* B) (f : A)
    (g : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))))
    (x : FactorialAffineColimit f) :
    factorialQZTensorCoefficientMap φ f (g ⊗ₜ[A] x) =
      MonoidAlgebra.mapRingHom (Multiplicative (AddCircle (1 : ℚ))) φ g ⊗ₜ[B]
        factorialCoefficientMap φ f x := by
  sorry

lemma factorialQZTensorCoefficientMap.single (φ : A →+* B) (f a : A)
    (q : AddCircle (1 : ℚ)) (x : FactorialAffineColimit f) :
    factorialQZTensorCoefficientMap φ f
      (MonoidAlgebra.single (Multiplicative.ofAdd q) a ⊗ₜ[A] x) =
      MonoidAlgebra.single (Multiplicative.ofAdd q) (φ a) ⊗ₜ[B]
        factorialCoefficientMap φ f x := by
  sorry

lemma factorialQZTensorCoefficientMap.constant (φ : A →+* B) (f a : A) :
    factorialQZTensorCoefficientMap φ f (algebraMap A _ a) =
      algebraMap B _ (φ a) := by
  sorry

lemma factorialQZTensorCoefficientMap.id (f : A) :
    factorialQZTensorCoefficientMap (RingHom.id A) f = RingHom.id _ := by
  sorry

lemma factorialQZTensorCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) (f : A) :
    factorialQZTensorCoefficientMap (ψ.comp φ) f =
      (factorialQZTensorCoefficientMap ψ (φ f)).comp
        (factorialQZTensorCoefficientMap φ f) := by
  sorry

lemma factorialQZTensorCoefficientMap.transport (φ : A →+* B) (f : A)
    (y : FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) :
    factorialQZTensorCoefficientMap φ f
      (Algebra.TensorProduct.map (factorialUnitQZEquiv A).toAlgHom
        (AlgHom.id A (FactorialAffineColimit f)) y) =
      Algebra.TensorProduct.map (factorialUnitQZEquiv B).toAlgHom
        (AlgHom.id B (FactorialAffineColimit (φ f)))
          (factorialTensorCoefficientMap φ f y) := by
  sorry

lemma factorialQZTensorCoefficientMap.root (φ : A →+* B) (f : A) (i : ℕ) :
    factorialQZTensorCoefficientMap φ f
      (MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ))))
        (1 : A) ⊗ₜ[A] factorialAffineInclusion f i (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (Nat.factorial (i+1) : ℚ) : ℚ) : AddCircle (1 : ℚ))))
        (1 : B) ⊗ₜ[B] factorialAffineInclusion (φ f) i (AdjoinRoot.root _) := by
  sorry

lemma factorialQZCoaction.coefficient_naturality (φ : A →+* B) (f : A) :
    (factorialQZTensorCoefficientMap φ f).comp (factorialQZCoaction f).toRingHom =
      (factorialQZCoaction (φ f)).toRingHom.comp (factorialCoefficientMap φ f) := by
  sorry

lemma factorialQZCoaction.map_coinvariant (φ : A →+* B) (f : A)
    (x : FactorialAffineColimit f)
    (hx : factorialQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x) :
    factorialQZCoaction (φ f) (factorialCoefficientMap φ f x) =
      (1 : MonoidAlgebra B (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[B]
        factorialCoefficientMap φ f x := by
  sorry

-- test: TauCeti.RootStack.factorialQZTensorCoefficientMap.test_negative_weight
example (x : FactorialAffineColimit (0 : ℤ)) :
    factorialQZTensorCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
      (MonoidAlgebra.single (Multiplicative.ofAdd
        (((-1 / 3 : ℚ) : AddCircle (1 : ℚ)))) (1 : ℤ) ⊗ₜ[ℤ] x) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((-1 / 3 : ℚ) : AddCircle (1 : ℚ)))) (1 : ZMod 2) ⊗ₜ[ZMod 2]
        factorialCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ) x := by
  sorry

-- test: TauCeti.RootStack.factorialQZTensorCoefficientMap.test_nonflat_kills_coefficient
example (q : AddCircle (1 : ℚ)) (x : FactorialAffineColimit (0 : ℤ)) :
    factorialQZTensorCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
      (MonoidAlgebra.single (Multiplicative.ofAdd q) (2 : ℤ) ⊗ₜ[ℤ] x) = 0 ∧
    ¬ Function.Injective (factorialQZTensorCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)) := by
  sorry

-- test: TauCeti.RootStack.factorialQZTensorCoefficientMap.test_wild_zero_section
example :
    (Int.castRingHom (ZMod 2)) (0 : ℤ) = 0 ∧
    factorialQZTensorCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
      (MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / 2 : ℚ) : AddCircle (1 : ℚ)))) (1 : ℤ) ⊗ₜ[ℤ]
          factorialAffineInclusion (0 : ℤ) 1 (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / 2 : ℚ) : AddCircle (1 : ℚ)))) (1 : ZMod 2) ⊗ₜ[ZMod 2]
          factorialAffineInclusion ((Int.castRingHom (ZMod 2)) (0 : ℤ)) 1
            (AdjoinRoot.root _) := by
  sorry

-- test: TauCeti.RootStack.factorialQZTensorCoefficientMap.test_zero_ring
example (y : MonoidAlgebra ℤ (Multiplicative (AddCircle (1 : ℚ))) ⊗[ℤ]
    FactorialAffineColimit (0 : ℤ)) :
    factorialQZTensorCoefficientMap (Int.castRingHom (ZMod 1)) (0 : ℤ) y = 0 := by
  sorry

-- test: TauCeti.RootStack.factorialQZTensorCoefficientMap.test_identity
example (f : A) (y : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
    FactorialAffineColimit f) :
    factorialQZTensorCoefficientMap (RingHom.id A) f y = y := by
  sorry

-- test: TauCeti.RootStack.factorialQZTensorCoefficientMap.test_three_rings
example (φ : A →+* B) (ψ : B →+* C) (f : A)
    (y : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
      FactorialAffineColimit f) :
    factorialQZTensorCoefficientMap (ψ.comp φ) f y =
      factorialQZTensorCoefficientMap ψ (φ f) (factorialQZTensorCoefficientMap φ f y) := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_nonunit_coefficient_square
example (x : FactorialAffineColimit (2 : ℤ)) :
    (Int.castRingHom (ZMod 2)) (2 : ℤ) = 0 ∧
    factorialQZTensorCoefficientMap (Int.castRingHom (ZMod 2)) (2 : ℤ)
      (factorialQZCoaction (2 : ℤ) x) =
      factorialQZCoaction ((Int.castRingHom (ZMod 2)) (2 : ℤ))
        (factorialCoefficientMap (Int.castRingHom (ZMod 2)) (2 : ℤ) x) := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_unity_coefficient_square
example (φ : A →+* B) (x : FactorialAffineColimit (1 : A)) :
    factorialQZTensorCoefficientMap φ (1 : A) (factorialQZCoaction (1 : A) x) =
      factorialQZCoaction (φ 1) (factorialCoefficientMap φ (1 : A) x) := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_coinvariant_constants
example (φ : A →+* B) (f a : A) :
    factorialQZCoaction (φ f) (factorialCoefficientMap φ f (algebraMap A _ a)) =
      (1 : MonoidAlgebra B (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[B]
        factorialCoefficientMap φ f (algebraMap A _ a) := by
  sorry

end TauCeti.RootStack
end

/- Native rational-character computation API. Separate proof evidence is in the handoff. -/
noncomputable section
universe uQZ
namespace TauCeti.RootStack
variable {A : Type uQZ} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

lemma affineQZCharacter.natCast (n : ℕ) [NeZero n] (k : ℕ) :
    affineQZCharacter n (k : ZMod n) = ((k / (n : ℚ) : ℚ) : AddCircle (1 : ℚ))  := by
  sorry

lemma affineQZCharacter.apply (n : ℕ) [NeZero n] (k : ZMod n) :
    affineQZCharacter n k = ((k.val / (n : ℚ) : ℚ) : AddCircle (1 : ℚ))  := by
  sorry

lemma factorialUnitQZMap.level (A : Type uQZ) [CommRing A] (i : ℕ)
    (x : AffineRing (1 : A) (Nat.factorial (i+1))) :
    factorialUnitQZMap A (factorialAffineInclusion (1 : A) i x) =
      finiteRootQZMap A (Nat.factorial (i+1)) x  := by
  sorry

-- TauCeti.RootStack.affineQZCharacter.test_natcast_period
example : affineQZCharacter 3 (7 : ZMod 3) = ((7 / 3 : ℚ) : AddCircle (1 : ℚ))  := by
  sorry

-- TauCeti.RootStack.affineQZCharacter.test_negative_representative
example : affineQZCharacter 3 (-1 : ZMod 3) = ((2 / 3 : ℚ) : AddCircle (1 : ℚ))  := by
  sorry

-- TauCeti.RootStack.factorialUnitQZMap.test_level_basis
example (a : A) : factorialUnitQZMap A (factorialAffineInclusion (1 : A) 2
    ((affineUnitCyclicEquiv 6).symm (MonoidAlgebra.single (Multiplicative.ofAdd (2 : ZMod 6)) a))) =
    MonoidAlgebra.single (Multiplicative.ofAdd ((1/3 : ℚ) : AddCircle (1 : ℚ))) a  := by
  sorry

end TauCeti.RootStack
end

/- Rational coaction boundary API. The separate proof certificate is in the handoff. -/
noncomputable section
universe uNewQZ
namespace TauCeti.RootStack
variable {A : Type uNewQZ} [CommRing A]
open scoped TensorProduct

lemma factorialQZCoaction.root_degree (f : A) (i : ℕ) :
    factorialQZCoaction f
      ((factorialAffineInclusion f i (AdjoinRoot.root _)) ^ Nat.factorial (i+1)) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        algebraMap A (FactorialAffineColimit f) f := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_degree_six_nonunit
example :
    factorialQZCoaction (2 : ZMod 4)
      ((factorialAffineInclusion (2 : ZMod 4) 2 (AdjoinRoot.root _)) ^ 6) =
      (1 : MonoidAlgebra (ZMod 4) (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[ZMod 4]
        algebraMap (ZMod 4) (FactorialAffineColimit (2 : ZMod 4)) 2 := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_power_zero
example (f : A) (i : ℕ) :
    factorialQZCoaction f ((factorialAffineInclusion f i (AdjoinRoot.root _)) ^ 0) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        (1 : FactorialAffineColimit f) := by
  sorry

-- test: TauCeti.RootStack.factorialQZCoaction.test_zero_ring_injective
example : Function.Injective (factorialQZCoaction (0 : ZMod 1)) := by
  sorry

end TauCeti.RootStack
end

namespace TauCeti.RootStack
open scoped TensorProduct
noncomputable section
variable {A : Type u} [CommRing A]

lemma affineCoaction.coordinates_diagonal (f : A) (n : ℕ) [NeZero n]
    (c : Fin n → A) (q : Fin n × Fin n) :
    affineTorsorComparison.targetCoordinateEquiv f n
      (affineCoaction f n (∑ i : Fin n, c i • (AdjoinRoot.root
        (Polynomial.X ^ n - Polynomial.C f) ^ i.val))) q =
      if q.1 = q.2 then c q.2 else 0 := by sorry

lemma affineCoaction.coordinates_constant_row (f : A) (n : ℕ) [NeZero n]
    (c : Fin n → A) (q : Fin n × Fin n) :
    affineTorsorComparison.targetCoordinateEquiv f n
      ((1 : MuHopf A n) ⊗ₜ[A] (∑ i : Fin n, c i • (AdjoinRoot.root
        (Polynomial.X ^ n - Polynomial.C f) ^ i.val))) q =
      if q.1 = 0 then c q.2 else 0 := by sorry

lemma affineCoaction.invariants_sum_iff (f : A) (n : ℕ) [NeZero n]
    (c : Fin n → A) :
    affineCoaction f n (∑ i : Fin n, c i • (AdjoinRoot.root
        (Polynomial.X ^ n - Polynomial.C f) ^ i.val)) =
      (1 : MuHopf A n) ⊗ₜ[A] (∑ i : Fin n, c i • (AdjoinRoot.root
        (Polynomial.X ^ n - Polynomial.C f) ^ i.val)) ↔
      ∀ i : Fin n, i ≠ 0 → c i = 0 := by sorry

lemma affineCoaction.invariants_unique (f : A) (n : ℕ) [NeZero n]
    (b : AffineRing f n) (h : affineCoaction f n b = (1 : MuHopf A n) ⊗ₜ[A] b) :
    ∃! a : A, b = algebraMap A (AffineRing f n) a := by sorry

def affineInvariantEquiv (f : A) (n : ℕ) [NeZero n] :
    A ≃ₐ[A] ↥(AlgHom.equalizer (affineCoaction f n)
      (Algebra.TensorProduct.includeRight : AffineRing f n →ₐ[A]
        MuHopf A n ⊗[A] AffineRing f n)) := by sorry

lemma affineInvariantEquiv.apply_coe (f : A) (n : ℕ) [NeZero n] (a : A) :
    (affineInvariantEquiv f n a).val = algebraMap A (AffineRing f n) a := by sorry

lemma affineInvariantEquiv.inverse_coe (f : A) (n : ℕ) [NeZero n]
    (x : ↥(AlgHom.equalizer (affineCoaction f n)
      (Algebra.TensorProduct.includeRight : AffineRing f n →ₐ[A]
        MuHopf A n ⊗[A] AffineRing f n))) :
    algebraMap A (AffineRing f n) ((affineInvariantEquiv f n).symm x) = x.val := by sorry

lemma affineInvariantEquiv.eq_iff (f : A) (n : ℕ) [NeZero n]
    (x : ↥(AlgHom.equalizer (affineCoaction f n)
      (Algebra.TensorProduct.includeRight : AffineRing f n →ₐ[A]
        MuHopf A n ⊗[A] AffineRing f n))) (a : A) :
    (affineInvariantEquiv f n).symm x = a ↔ x.val = algebraMap A (AffineRing f n) a := by sorry

-- test: AffineInvariantTests.wild_root
example : affineCoaction (0 : ZMod 2) 2 (AdjoinRoot.root _) ≠
    (1 : MuHopf (ZMod 2) 2) ⊗ₜ[ZMod 2] (AdjoinRoot.root _) := by sorry

-- test: AffineInvariantTests.nilpotent_weight
example : affineCoaction (0 : ZMod 4) 2 ((2 : ZMod 4) • AdjoinRoot.root _) ≠
    (1 : MuHopf (ZMod 4) 2) ⊗ₜ[ZMod 4] ((2 : ZMod 4) • AdjoinRoot.root _) := by sorry

-- test: AffineInvariantTests.unique_nilpotent_constant
example : ∃! a : ZMod 4, algebraMap (ZMod 4) (AffineRing (0 : ZMod 4) 2) 2 =
    algebraMap (ZMod 4) (AffineRing (0 : ZMod 4) 2) a := by sorry

-- test: AffineInvariantTests.zero_ring
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n] (b : AffineRing f n) :
    affineCoaction f n b = (1 : MuHopf A n) ⊗ₜ[A] b ∧
      ∃! a : A, b = algebraMap A (AffineRing f n) a := by sorry

-- test: AffineInvariantTests.exponent_one
example (f : A) (b : AffineRing f 1) : ∃! a : A, b = algebraMap A (AffineRing f 1) a := by sorry

-- test: AffineInvariantTests.equivalence_linear_root
example : (affineInvariantEquiv (7 : ZMod 11) 1).symm
    ⟨AdjoinRoot.root _, by
      have hr := affineRoot.pow_eq (7 : ZMod 11) 1
      simp only [pow_one] at hr
      change affineCoaction (7 : ZMod 11) 1 (AdjoinRoot.root _) =
        (1 : MuHopf (ZMod 11) 1) ⊗ₜ[ZMod 11] (AdjoinRoot.root _)
      rw [hr]
      exact affineCoaction.constant _ _ _⟩ = 7 := by sorry

-- test: AffineInvariantTests.equivalence_nilpotent
example : (affineInvariantEquiv (0 : ZMod 4) 2).symm
    (affineInvariantEquiv (0 : ZMod 4) 2 2) = 2 ∧
      ((affineInvariantEquiv (0 : ZMod 4) 2 2).val) ^ 2 = 0 := by sorry

-- test: AffineInvariantTests.equivalence_zero_ring
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n]
    (x : ↥(AlgHom.equalizer (affineCoaction f n)
      (Algebra.TensorProduct.includeRight : AffineRing f n →ₐ[A]
        MuHopf A n ⊗[A] AffineRing f n))) :
    (affineInvariantEquiv f n).symm x = 0 := by sorry

end
end TauCeti.RootStack
namespace TauCeti.RootStack
open scoped TensorProduct
noncomputable section
variable {A : Type u} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

def qzTensorCoefficient (f : A) (q : AddCircle (1 : ℚ)) :
    MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
      FactorialAffineColimit f →ₗ[A] FactorialAffineColimit f  := by sorry

lemma qzTensorCoefficient.single (f : A) (q r : AddCircle (1 : ℚ))
    (a : A) (x : FactorialAffineColimit f) :
    qzTensorCoefficient f q
      (MonoidAlgebra.single (Multiplicative.ofAdd r) a ⊗ₜ[A] x) =
      if r = q then a • x else 0  := by sorry

lemma qzTensorCoefficient.constant (f : A) (q : AddCircle (1 : ℚ))
    (x : FactorialAffineColimit f) :
    qzTensorCoefficient f q
      ((1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x) =
      if q = 0 then x else 0  := by sorry

lemma affineQZCharacter.fin_injective (n : ℕ) [NeZero n] :
    Function.Injective (fun k : Fin n => affineQZCharacter n (k.val : ZMod n))  := by sorry

lemma qzTensorCoefficient.coaction_constant (f a : A) (q : AddCircle (1 : ℚ)) :
    qzTensorCoefficient f q (factorialQZCoaction f (algebraMap A _ a)) =
      if q = 0 then algebraMap A (FactorialAffineColimit f) a else 0  := by sorry

lemma factorialQZCoaction.coefficient_sum (f : A) (i : ℕ)
    (c : Fin (Nat.factorial (i+1)) → A) (k : Fin (Nat.factorial (i+1))) :
    qzTensorCoefficient f (affineQZCharacter (Nat.factorial (i+1)) k.val)
      (factorialQZCoaction f
        (factorialAffineInclusion f i
          (∑ j : Fin (Nat.factorial (i+1)), c j • (AdjoinRoot.root
            (Polynomial.X ^ Nat.factorial (i+1) - Polynomial.C f) ^ j.val)))) =
    factorialAffineInclusion f i
      (c k • (AdjoinRoot.root
        (Polynomial.X ^ Nat.factorial (i+1) - Polynomial.C f) ^ k.val))  := by sorry

lemma factorialQZCoaction.invariants_sum_iff (f : A) (i : ℕ)
    (c : Fin (Nat.factorial (i+1)) → A) :
    factorialQZCoaction f
      (factorialAffineInclusion f i
        (∑ j : Fin (Nat.factorial (i+1)), c j • (AdjoinRoot.root
          (Polynomial.X ^ Nat.factorial (i+1) - Polynomial.C f) ^ j.val))) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        (factorialAffineInclusion f i
          (∑ j : Fin (Nat.factorial (i+1)), c j • (AdjoinRoot.root
            (Polynomial.X ^ Nat.factorial (i+1) - Polynomial.C f) ^ j.val))) ↔
      ∀ j : Fin (Nat.factorial (i+1)), j ≠ 0 → c j = 0  := by sorry

theorem factorialQZCoaction.invariants (f : A) (x : FactorialAffineColimit f) :
    factorialQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x ↔
      ∃ a : A, x = algebraMap A (FactorialAffineColimit f) a  := by sorry

lemma factorialAffineColimit.coefficient_injective (f : A) :
    Function.Injective (algebraMap A (FactorialAffineColimit f))  := by sorry

lemma factorialQZCoaction.invariants_unique (f : A) (x : FactorialAffineColimit f)
    (h : factorialQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x) :
    ∃! a : A, x = algebraMap A (FactorialAffineColimit f) a  := by sorry

theorem factorialCoaction.invariants (f : A) (x : FactorialAffineColimit f) :
    factorialCoaction f x = (1 : FactorialAffineColimit (1 : A)) ⊗ₜ[A] x ↔
      ∃ a : A, x = algebraMap A (FactorialAffineColimit f) a  := by sorry

def factorialInvariantEquiv (f : A) :
    A ≃ₐ[A] ↥(AlgHom.equalizer (factorialQZCoaction f)
      (Algebra.TensorProduct.includeRight : FactorialAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          FactorialAffineColimit f))  := by sorry

lemma factorialInvariantEquiv.apply_coe (f : A) (a : A) :
    (factorialInvariantEquiv f a).val = algebraMap A (FactorialAffineColimit f) a  := by sorry

lemma factorialInvariantEquiv.inverse_coe (f : A)
    (x : ↥(AlgHom.equalizer (factorialQZCoaction f)
      (Algebra.TensorProduct.includeRight : FactorialAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          FactorialAffineColimit f))) :
    algebraMap A (FactorialAffineColimit f) ((factorialInvariantEquiv f).symm x) = x.val  := by sorry

lemma factorialInvariantEquiv.eq_iff (f : A)
    (x : ↥(AlgHom.equalizer (factorialQZCoaction f)
      (Algebra.TensorProduct.includeRight : FactorialAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          FactorialAffineColimit f))) (a : A) :
    (factorialInvariantEquiv f).symm x = a ↔
      x.val = algebraMap A (FactorialAffineColimit f) a  := by sorry
end
end TauCeti.RootStack
namespace TauCeti.RootStack
open scoped TensorProduct
noncomputable section
variable {A : Type u} [CommRing A]
-- TauCeti.RootStack.qzTensorCoefficient.test_matching
example (f : A) (q : AddCircle (1 : ℚ)) (a : A) (x : FactorialAffineColimit f) :
    qzTensorCoefficient f q
      (MonoidAlgebra.single (Multiplicative.ofAdd q) a ⊗ₜ[A] x) = a • x  := by sorry

-- TauCeti.RootStack.qzTensorCoefficient.test_nonzero_character
example (f : A) (q : AddCircle (1 : ℚ)) (hq : q ≠ 0) (x : FactorialAffineColimit f) :
    qzTensorCoefficient f q
      ((1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x) = 0  := by sorry

-- TauCeti.RootStack.qzTensorCoefficient.test_zero_character
example (f : A) (x : FactorialAffineColimit f) :
    qzTensorCoefficient f 0
      ((1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x) = x  := by sorry

-- TauCeti.RootStack.qzTensorCoefficient.test_zero_ring
example (q : AddCircle (1 : ℚ)) (x : FactorialAffineColimit (0 : ZMod 1)) :
    qzTensorCoefficient (0 : ZMod 1) q
      ((1 : MonoidAlgebra (ZMod 1) (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[ZMod 1] x) = 0  := by sorry

-- TauCeti.RootStack.factorialInvariantEquiv.test_coefficient_two
example : (factorialInvariantEquiv (2 : ZMod 4) (2 : ZMod 4)).val =
    algebraMap (ZMod 4) (FactorialAffineColimit (2 : ZMod 4)) 2  := by sorry

-- TauCeti.RootStack.factorialInvariantEquiv.test_zero_ring
example : (factorialInvariantEquiv (0 : ZMod 1) (0 : ZMod 1)).val = 0  := by sorry

-- TauCeti.RootStack.factorialInvariantEquiv.test_unity
example (a : A) : factorialCoaction (1 : A)
    (factorialInvariantEquiv (1 : A) a).val =
    (1 : FactorialAffineColimit (1 : A)) ⊗ₜ[A]
      (factorialInvariantEquiv (1 : A) a).val  := by sorry

-- TauCeti.RootStack.factorialInvariantEquiv.test_inverse
example (f : A)
    (x : ↥(AlgHom.equalizer (factorialQZCoaction f)
      (Algebra.TensorProduct.includeRight : FactorialAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          FactorialAffineColimit f))) :
    factorialInvariantEquiv f ((factorialInvariantEquiv f).symm x) = x  := by sorry

-- TauCeti.RootStack.factorialQZCoaction.test_unique_constants
example (f a : A) : ∃! b : A,
    algebraMap A (FactorialAffineColimit f) a = algebraMap A (FactorialAffineColimit f) b  := by sorry

-- TauCeti.RootStack.factorialQZCoaction.test_wild_coefficient_criterion
example (c : Fin (2) → ZMod 2) :
    factorialQZCoaction (0 : ZMod 2)
      (factorialAffineInclusion (0 : ZMod 2) 1
        (∑ j : Fin (2), c j • (AdjoinRoot.root
          (Polynomial.X ^ 2 - Polynomial.C (0 : ZMod 2)) ^ j.val))) =
    (1 : MonoidAlgebra (ZMod 2) (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[ZMod 2]
      (factorialAffineInclusion (0 : ZMod 2) 1
        (∑ j : Fin (2), c j • (AdjoinRoot.root
          (Polynomial.X ^ 2 - Polynomial.C (0 : ZMod 2)) ^ j.val))) ↔
    c 1 = 0  := by sorry

-- TauCeti.RootStack.factorialQZCoaction.test_nonzero_nilpotent_rejected
example :
    let c : Fin (2) → ZMod 4 := fun j => if j = 1 then 2 else 0
    ¬(factorialQZCoaction (0 : ZMod 4)
      (factorialAffineInclusion (0 : ZMod 4) 1
        (∑ j : Fin (2), c j • (AdjoinRoot.root
          (Polynomial.X ^ 2 - Polynomial.C (0 : ZMod 4)) ^ j.val))) =
    (1 : MonoidAlgebra (ZMod 4) (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[ZMod 4]
      (factorialAffineInclusion (0 : ZMod 4) 1
        (∑ j : Fin (2), c j • (AdjoinRoot.root
          (Polynomial.X ^ 2 - Polynomial.C (0 : ZMod 4)) ^ j.val))))  := by sorry

-- TauCeti.RootStack.factorialQZCoaction.test_coefficient_unique_zero_ring
example (x : FactorialAffineColimit (0 : ZMod 1)) :
    ∃! a : ZMod 1, x = algebraMap (ZMod 1) (FactorialAffineColimit (0 : ZMod 1)) a  := by sorry
end
end TauCeti.RootStack

/- INFINITE_COINVARIANT_ARCHIVE_N24
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
END INFINITE_COINVARIANT_ARCHIVE_N24 -/
