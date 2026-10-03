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

/- BEGIN NATIVE RATIONAL COACTION PAYLOAD
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
END NATIVE RATIONAL COACTION PAYLOAD -/
