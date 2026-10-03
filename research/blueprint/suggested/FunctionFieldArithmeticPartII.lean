import Mathlib.AlgebraicGeometry.GammaSpecAdjunction
import Mathlib.CategoryTheory.Limits.Preserves.Basic
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

noncomputable section
universe uDiv vDiv
namespace TauCeti.RootStack
variable {A : Type uDiv} [CommRing A]
open scoped TensorProduct
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

/-- The existing cofinal chart comparison on the actual coaction target. -/
def divisibilityQZTensorEquiv (f : A) :
    (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
      DivisibilityAffineColimit f) ≃ₐ[A]
    (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
      FactorialAffineColimit f) :=
  Algebra.TensorProduct.congr (AlgEquiv.refl) (divisibilityFactorialEquiv f)

lemma divisibilityQZTensorEquiv.tmul (f : A)
    (g : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))))
    (x : DivisibilityAffineColimit f) :
    divisibilityQZTensorEquiv f (g ⊗ₜ[A] x) =
      g ⊗ₜ[A] divisibilityFactorialEquiv f x := by
  sorry

lemma divisibilityQZTensorEquiv.symm_tmul (f : A)
    (g : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))))
    (x : FactorialAffineColimit f) :
    (divisibilityQZTensorEquiv f).symm (g ⊗ₜ[A] x) =
      g ⊗ₜ[A] (divisibilityFactorialEquiv f).symm x := by
  sorry

/-- The universal coaction on the colimit indexed by all positive divisibilities. -/
def divisibilityQZCoaction (f : A) :
    DivisibilityAffineColimit f →ₐ[A]
      MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
        DivisibilityAffineColimit f :=
  (divisibilityQZTensorEquiv f).symm.toAlgHom.comp
    ((factorialQZCoaction f).comp (divisibilityFactorialEquiv f).toAlgHom)

lemma divisibilityQZCoaction.transport (f : A) (x : DivisibilityAffineColimit f) :
    divisibilityQZTensorEquiv f (divisibilityQZCoaction f x) =
      factorialQZCoaction f (divisibilityFactorialEquiv f x) := by
  sorry

lemma factorialQZCoaction.extension_root (f : A) (n : RootDivIndex) :
    factorialQZCoaction f (factorialAffineExtension f n (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (n.exponent : ℚ) : ℚ) : AddCircle (1 : ℚ)))) (1 : A) ⊗ₜ[A]
        factorialAffineExtension f n (AdjoinRoot.root _) := by
  sorry

lemma divisibilityQZCoaction.root (f : A) (n : RootDivIndex) :
    divisibilityQZCoaction f (divisibilityAffineInclusion f n (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / (n.exponent : ℚ) : ℚ) : AddCircle (1 : ℚ)))) (1 : A) ⊗ₜ[A]
        divisibilityAffineInclusion f n (AdjoinRoot.root _) := by
  sorry

lemma divisibilityQZCoaction.level (f : A) (n : RootDivIndex) :
    (divisibilityQZCoaction f).comp (divisibilityAffineInclusion f n) =
      (Algebra.TensorProduct.map (finiteQZAlgMap A n.exponent)
        (divisibilityAffineInclusion f n)).comp (affineCoaction f n.exponent) := by
  sorry

lemma divisibilityQZCoaction.constant (f a : A) :
    divisibilityQZCoaction f (algebraMap A _ a) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        algebraMap A (DivisibilityAffineColimit f) a := by
  sorry

lemma divisibilityQZCoaction.counit (f : A) :
    ((Algebra.TensorProduct.lid A (DivisibilityAffineColimit f)).toAlgHom.comp
      (Algebra.TensorProduct.map
        (Bialgebra.counitAlgHom A (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))))
        (AlgHom.id A (DivisibilityAffineColimit f)))).comp (divisibilityQZCoaction f) =
      AlgHom.id A (DivisibilityAffineColimit f) := by
  sorry

lemma divisibilityQZCoaction.coassoc (f : A) :
    let G := MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))
    (Algebra.TensorProduct.assoc A A A G G (DivisibilityAffineColimit f)).toAlgHom.comp
      ((Algebra.TensorProduct.map (Bialgebra.comulAlgHom A G)
        (AlgHom.id A (DivisibilityAffineColimit f))).comp (divisibilityQZCoaction f)) =
      (Algebra.TensorProduct.map (AlgHom.id A G) (divisibilityQZCoaction f)).comp
        (divisibilityQZCoaction f) := by
  sorry

lemma divisibilityQZCoaction.coinvariant_iff (f : A) (x : DivisibilityAffineColimit f) :
    divisibilityQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x ↔
    factorialQZCoaction f (divisibilityFactorialEquiv f x) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        divisibilityFactorialEquiv f x := by
  sorry

lemma divisibilityAffineColimit.coefficient_injective (f : A) :
    Function.Injective (algebraMap A (DivisibilityAffineColimit f)) := by
  sorry

theorem divisibilityQZCoaction.invariants (f : A) (x : DivisibilityAffineColimit f) :
    divisibilityQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x ↔
    ∃ a : A, x = algebraMap A (DivisibilityAffineColimit f) a := by
  sorry

lemma divisibilityQZCoaction.invariants_unique (f : A) (x : DivisibilityAffineColimit f)
    (hx : divisibilityQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x) :
    ∃! a : A, x = algebraMap A (DivisibilityAffineColimit f) a := by
  sorry

def divisibilityInvariantEquiv (f : A) :
    A ≃ₐ[A] ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f)) := by
  let I := AlgHom.equalizer (divisibilityQZCoaction f)
    (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
      MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
        DivisibilityAffineColimit f)
  let g := (Algebra.ofId A (DivisibilityAffineColimit f)).codRestrict I
    (fun a => divisibilityQZCoaction.constant f a)
  apply AlgEquiv.ofBijective g
  constructor
  · intro a b h
    exact divisibilityAffineColimit.coefficient_injective f (congrArg Subtype.val h)
  · intro x
    obtain ⟨a,ha⟩ := (divisibilityQZCoaction.invariants f x.val).mp x.property
    exact ⟨a,Subtype.ext ha.symm⟩

lemma divisibilityInvariantEquiv.apply_coe (f a : A) :
    (divisibilityInvariantEquiv f a).val = algebraMap A (DivisibilityAffineColimit f) a := by
  sorry

lemma divisibilityInvariantEquiv.inverse_coe (f : A)
    (x : ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f))) :
    algebraMap A (DivisibilityAffineColimit f) ((divisibilityInvariantEquiv f).symm x) = x.val := by
  sorry

lemma divisibilityInvariantEquiv.eq_iff (f : A)
    (x : ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f))) (a : A) :
    (divisibilityInvariantEquiv f).symm x = a ↔
      x.val = algebraMap A (DivisibilityAffineColimit f) a := by
  sorry

lemma divisibilityInvariantEquiv.factorial (f a : A) :
    divisibilityFactorialEquiv f (divisibilityInvariantEquiv f a).val =
      (factorialInvariantEquiv f a).val := by
  sorry

end TauCeti.RootStack
end


noncomputable section
universe uDivTest
namespace TauCeti.RootStack
variable {A : Type uDivTest} [CommRing A]
open scoped TensorProduct

-- test: divisibilityQZTensorEquiv.test_pure
example (f : A) (g : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))))
    (x : DivisibilityAffineColimit f) : divisibilityQZTensorEquiv f (g ⊗ₜ[A] x) =
      g ⊗ₜ[A] divisibilityFactorialEquiv f x := by
  sorry

-- test: divisibilityQZTensorEquiv.test_inverse
example (f : A) (x : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
    DivisibilityAffineColimit f) :
    (divisibilityQZTensorEquiv f).symm (divisibilityQZTensorEquiv f x) = x := by
  sorry

-- test: divisibilityQZTensorEquiv.test_zero_ring
example (x : MonoidAlgebra (ZMod 1) (Multiplicative (AddCircle (1 : ℚ))) ⊗[ZMod 1]
    DivisibilityAffineColimit (0 : ZMod 1)) : divisibilityQZTensorEquiv (0 : ZMod 1) x = 0 := by
  sorry

-- test: divisibilityQZCoaction.test_third_root
example : divisibilityQZCoaction (2 : ZMod 4)
    (divisibilityAffineInclusion (2 : ZMod 4) ⟨3, by decide⟩ (AdjoinRoot.root _)) =
      MonoidAlgebra.single (Multiplicative.ofAdd
        (((1 / 3 : ℚ) : AddCircle (1 : ℚ)))) (1 : ZMod 4) ⊗ₜ[ZMod 4]
        divisibilityAffineInclusion (2 : ZMod 4) ⟨3, by decide⟩ (AdjoinRoot.root _) := by
  sorry

-- test: divisibilityQZCoaction.test_one
example (f : A) : divisibilityQZCoaction f
    (divisibilityAffineInclusion f ⟨1, by decide⟩ (AdjoinRoot.root _)) =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A]
        algebraMap A (DivisibilityAffineColimit f) f := by
  sorry

-- test: divisibilityQZCoaction.test_divisibility
example (f : A) : divisibilityQZCoaction f
    (divisibilityAffineInclusion f ⟨3, by decide⟩ (AdjoinRoot.root _)) =
      divisibilityQZCoaction f
        (divisibilityAffineInclusion f ⟨6, by decide⟩ (AdjoinRoot.root _)) ^ 2 := by
  sorry

-- test: divisibilityQZCoaction.test_native_transport
example (f : A) (x : DivisibilityAffineColimit f) :
    divisibilityQZTensorEquiv f (divisibilityQZCoaction f x) =
      factorialQZCoaction f (divisibilityFactorialEquiv f x) := by
  sorry

-- test: divisibilityInvariantEquiv.test_coefficient_two
example : (divisibilityInvariantEquiv (2 : ZMod 4) (2 : ZMod 4)).val =
    algebraMap (ZMod 4) (DivisibilityAffineColimit (2 : ZMod 4)) 2 := by
  sorry

-- test: divisibilityInvariantEquiv.test_zero_ring
example : (divisibilityInvariantEquiv (0 : ZMod 1) (0 : ZMod 1)).val = 0 := by
  sorry

-- test: divisibilityInvariantEquiv.test_inverse
example (f : A)
    (x : ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f))) :
    divisibilityInvariantEquiv f ((divisibilityInvariantEquiv f).symm x) = x := by
  sorry

-- test: divisibilityQZCoaction.test_wild_nilpotent
example :
    let u := divisibilityAffineInclusion (0 : ZMod 2) ⟨2, by decide⟩ (AdjoinRoot.root _)
    u ≠ 0 ∧ u ^ 2 = 0 ∧
      divisibilityQZCoaction (0 : ZMod 2) u ≠
        (1 : MonoidAlgebra (ZMod 2) (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[ZMod 2] u := by
  sorry

-- test: divisibilityQZCoaction.test_finite_level
example (f : A) (x : AffineRing f 3) :
    divisibilityQZCoaction f (divisibilityAffineInclusion f ⟨3, by decide⟩ x) =
      Algebra.TensorProduct.map (finiteQZAlgMap A 3)
        (divisibilityAffineInclusion f ⟨3, by decide⟩) (affineCoaction f 3 x) := by
  sorry

-- test: divisibilityInvariantEquiv.test_factorial
example (f a : A) : divisibilityFactorialEquiv f (divisibilityInvariantEquiv f a).val =
    (factorialInvariantEquiv f a).val := by
  sorry

-- test: divisibilityInvariantEquiv.test_unique
example (f a b : A) (h : (divisibilityInvariantEquiv f a).val =
    (divisibilityInvariantEquiv f b).val) : a = b := by
  sorry

end TauCeti.RootStack
end

noncomputable section
set_option maxHeartbeats 800000
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
universe uDivCoeff
namespace TauCeti.RootStack
variable {A B C : Type uDivCoeff} [CommRing A] [CommRing B] [CommRing C]
open scoped TensorProduct

def divisibilityCoefficientMap (φ : A →+* B) (f : A) :
    DivisibilityAffineColimit f →+* DivisibilityAffineColimit (φ f) :=
  (divisibilityFactorialEquiv (φ f)).symm.toRingHom.comp
    ((factorialCoefficientMap φ f).comp (divisibilityFactorialEquiv f).toRingHom)

lemma divisibilityCoefficientMap.transport (φ : A →+* B) (f : A)
    (x : DivisibilityAffineColimit f) :
    divisibilityFactorialEquiv (φ f) (divisibilityCoefficientMap φ f x) =
      factorialCoefficientMap φ f (divisibilityFactorialEquiv f x) := by
  sorry

lemma divisibilityCoefficientMap.constant (φ : A →+* B) (f a : A) :
    divisibilityCoefficientMap φ f (algebraMap A _ a) = algebraMap B _ (φ a) := by
  sorry

lemma divisibilityCoefficientMap.root (φ : A →+* B) (f : A) (n : RootDivIndex) :
    divisibilityCoefficientMap φ f (divisibilityAffineInclusion f n (AdjoinRoot.root _)) =
      divisibilityAffineInclusion (φ f) n (AdjoinRoot.root _) := by
  sorry

lemma divisibilityCoefficientMap.id (f : A) :
    divisibilityCoefficientMap (RingHom.id A) f = RingHom.id _ := by
  sorry

lemma divisibilityCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) (f : A) :
    divisibilityCoefficientMap (ψ.comp φ) f =
      (divisibilityCoefficientMap ψ (φ f)).comp (divisibilityCoefficientMap φ f) := by
  sorry

def divisibilityQZTensorCoefficientMap (φ : A →+* B) (f : A) :
    (MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
      DivisibilityAffineColimit f) →+*
    (MonoidAlgebra B (Multiplicative (AddCircle (1 : ℚ))) ⊗[B]
      DivisibilityAffineColimit (φ f)) :=
  (divisibilityQZTensorEquiv (φ f)).symm.toRingHom.comp
    ((factorialQZTensorCoefficientMap φ f).comp (divisibilityQZTensorEquiv f).toRingHom)

lemma divisibilityQZTensorCoefficientMap.transport (φ : A →+* B) (f : A)
    (y : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
      DivisibilityAffineColimit f) :
    divisibilityQZTensorEquiv (φ f) (divisibilityQZTensorCoefficientMap φ f y) =
      factorialQZTensorCoefficientMap φ f (divisibilityQZTensorEquiv f y) := by
  sorry

lemma divisibilityQZTensorCoefficientMap.tmul (φ : A →+* B) (f : A)
    (g : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))))
    (x : DivisibilityAffineColimit f) :
    divisibilityQZTensorCoefficientMap φ f (g ⊗ₜ[A] x) =
      MonoidAlgebra.mapRingHom (Multiplicative (AddCircle (1 : ℚ))) φ g ⊗ₜ[B]
        divisibilityCoefficientMap φ f x := by
  sorry

lemma divisibilityQZTensorCoefficientMap.single (φ : A →+* B) (f a : A)
    (q : AddCircle (1 : ℚ)) (x : DivisibilityAffineColimit f) :
    divisibilityQZTensorCoefficientMap φ f
      (MonoidAlgebra.single (Multiplicative.ofAdd q) a ⊗ₜ[A] x) =
      MonoidAlgebra.single (Multiplicative.ofAdd q) (φ a) ⊗ₜ[B]
        divisibilityCoefficientMap φ f x := by
  sorry

lemma divisibilityQZTensorCoefficientMap.constant (φ : A →+* B) (f a : A) :
    divisibilityQZTensorCoefficientMap φ f (algebraMap A _ a) =
      algebraMap B _ (φ a) := by
  sorry

lemma divisibilityQZTensorCoefficientMap.id (f : A) :
    divisibilityQZTensorCoefficientMap (RingHom.id A) f = RingHom.id _ := by
  sorry

lemma divisibilityQZTensorCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) (f : A) :
    divisibilityQZTensorCoefficientMap (ψ.comp φ) f =
      (divisibilityQZTensorCoefficientMap ψ (φ f)).comp
        (divisibilityQZTensorCoefficientMap φ f) := by
  sorry

lemma divisibilityQZCoaction.coefficient_naturality (φ : A →+* B) (f : A) :
    (divisibilityQZTensorCoefficientMap φ f).comp (divisibilityQZCoaction f).toRingHom =
      (divisibilityQZCoaction (φ f)).toRingHom.comp (divisibilityCoefficientMap φ f) := by
  sorry

lemma divisibilityQZCoaction.map_coinvariant (φ : A →+* B) (f : A)
    (x : DivisibilityAffineColimit f)
    (hx : divisibilityQZCoaction f x =
      (1 : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[A] x) :
    divisibilityQZCoaction (φ f) (divisibilityCoefficientMap φ f x) =
      (1 : MonoidAlgebra B (Multiplicative (AddCircle (1 : ℚ)))) ⊗ₜ[B]
        divisibilityCoefficientMap φ f x := by
  sorry

def divisibilityInvariantCoefficientMap (φ : A →+* B) (f : A) :
    ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f)) →+*
    ↥(AlgHom.equalizer (divisibilityQZCoaction (φ f))
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit (φ f) →ₐ[B]
        MonoidAlgebra B (Multiplicative (AddCircle (1 : ℚ))) ⊗[B]
          DivisibilityAffineColimit (φ f))) where
  toFun x := ⟨divisibilityCoefficientMap φ f x.val,
    divisibilityQZCoaction.map_coinvariant φ f x.val x.property⟩
  map_one' := Subtype.ext (map_one _)
  map_mul' x y := Subtype.ext (map_mul _ x.val y.val)
  map_zero' := Subtype.ext (map_zero _)
  map_add' x y := Subtype.ext (map_add _ x.val y.val)

lemma divisibilityInvariantCoefficientMap.coe (φ : A →+* B) (f : A)
    (x : ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f))) :
    (divisibilityInvariantCoefficientMap φ f x).val =
      divisibilityCoefficientMap φ f x.val := by
  sorry

lemma divisibilityInvariantCoefficientMap.forward (φ : A →+* B) (f a : A) :
    divisibilityInvariantCoefficientMap φ f (divisibilityInvariantEquiv f a) =
      divisibilityInvariantEquiv (φ f) (φ a) := by
  sorry

lemma divisibilityInvariantCoefficientMap.coordinate (φ : A →+* B) (f : A)
    (x : ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f))) :
    (divisibilityInvariantEquiv (φ f)).symm (divisibilityInvariantCoefficientMap φ f x) =
      φ ((divisibilityInvariantEquiv f).symm x) := by
  sorry

lemma divisibilityInvariantCoefficientMap.id (f : A) :
    divisibilityInvariantCoefficientMap (RingHom.id A) f = RingHom.id _ := by
  sorry

attribute [local irreducible] divisibilityQZCoaction

lemma divisibilityInvariantCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) (f : A) :
    divisibilityInvariantCoefficientMap (ψ.comp φ) f =
      (divisibilityInvariantCoefficientMap ψ (φ f)).comp
        (divisibilityInvariantCoefficientMap φ f) := by
  sorry

lemma divisibilityInvariantCoefficientMap.injective_iff (φ : A →+* B) (f : A) :
    Function.Injective (divisibilityInvariantCoefficientMap φ f) ↔ Function.Injective φ := by
  sorry

lemma divisibilityInvariantCoefficientMap.surjective_iff (φ : A →+* B) (f : A) :
    Function.Surjective (divisibilityInvariantCoefficientMap φ f) ↔ Function.Surjective φ := by
  sorry

end TauCeti.RootStack
end


noncomputable section
set_option maxHeartbeats 800000
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
universe uDivCoeffTest
namespace TauCeti.RootStack
variable {A B : Type uDivCoeffTest} [CommRing A] [CommRing B]
open scoped TensorProduct

-- test: divisibilityCoefficientMap.test_third_root
example : divisibilityCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ)
    (divisibilityAffineInclusion (2 : ℤ) ⟨3, by decide⟩ (AdjoinRoot.root _)) =
      divisibilityAffineInclusion ((Int.castRingHom (ZMod 4)) (2 : ℤ))
        ⟨3, by decide⟩ (AdjoinRoot.root _) := by
  sorry

-- test: divisibilityCoefficientMap.test_identity
example (f : A) (x : DivisibilityAffineColimit f) :
    divisibilityCoefficientMap (RingHom.id A) f x = x := by
  sorry

-- test: divisibilityCoefficientMap.test_zero_ring
example (x : DivisibilityAffineColimit (0 : ZMod 2)) :
    divisibilityCoefficientMap (ZMod.castHom (by decide : 1 ∣ 2) (ZMod 1))
      (0 : ZMod 2) x = 0 := by
  sorry

-- test: divisibilityCoefficientMap.test_killed_constant
example : algebraMap ℤ (DivisibilityAffineColimit (2 : ℤ)) 4 ≠ 0 ∧
    divisibilityCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ)
      (algebraMap ℤ _ 4) = 0 := by
  sorry

-- test: divisibilityQZTensorCoefficientMap.test_character
example : divisibilityQZTensorCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ)
    (MonoidAlgebra.single (Multiplicative.ofAdd ((1 / 3 : ℚ) : AddCircle (1 : ℚ))) (2 : ℤ)
      ⊗ₜ[ℤ] divisibilityAffineInclusion (2 : ℤ) ⟨3, by decide⟩ (AdjoinRoot.root _)) =
    MonoidAlgebra.single (Multiplicative.ofAdd ((1 / 3 : ℚ) : AddCircle (1 : ℚ)))
      ((Int.castRingHom (ZMod 4)) (2 : ℤ)) ⊗ₜ[ZMod 4]
      divisibilityAffineInclusion ((Int.castRingHom (ZMod 4)) (2 : ℤ))
        ⟨3, by decide⟩ (AdjoinRoot.root _) := by
  sorry

-- test: divisibilityQZTensorCoefficientMap.test_identity
example (f : A) (y : MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
    DivisibilityAffineColimit f) : divisibilityQZTensorCoefficientMap (RingHom.id A) f y = y := by
  sorry

-- test: divisibilityQZTensorCoefficientMap.test_zero_ring
example (y : MonoidAlgebra (ZMod 2) (Multiplicative (AddCircle (1 : ℚ))) ⊗[ZMod 2]
    DivisibilityAffineColimit (0 : ZMod 2)) :
    divisibilityQZTensorCoefficientMap (ZMod.castHom (by decide : 1 ∣ 2) (ZMod 1))
      (0 : ZMod 2) y = 0 := by
  sorry

-- test: divisibilityQZTensorCoefficientMap.test_coaction
example (x : DivisibilityAffineColimit (2 : ℤ)) :
    divisibilityQZTensorCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ)
      (divisibilityQZCoaction (2 : ℤ) x) =
    divisibilityQZCoaction ((Int.castRingHom (ZMod 4)) (2 : ℤ))
      (divisibilityCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ) x) := by
  sorry

-- test: divisibilityInvariantCoefficientMap.test_coefficient
example : divisibilityInvariantCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ)
    (divisibilityInvariantEquiv (2 : ℤ) 3) =
    divisibilityInvariantEquiv ((Int.castRingHom (ZMod 4)) (2 : ℤ))
      ((Int.castRingHom (ZMod 4)) (3 : ℤ)) := by
  sorry

-- test: divisibilityInvariantCoefficientMap.test_coordinate
example (φ : A →+* B) (f : A)
    (x : ↥(AlgHom.equalizer (divisibilityQZCoaction f)
      (Algebra.TensorProduct.includeRight : DivisibilityAffineColimit f →ₐ[A]
        MonoidAlgebra A (Multiplicative (AddCircle (1 : ℚ))) ⊗[A]
          DivisibilityAffineColimit f))) :
    (divisibilityInvariantEquiv (φ f)).symm (divisibilityInvariantCoefficientMap φ f x) =
      φ ((divisibilityInvariantEquiv f).symm x) := by
  sorry

-- test: divisibilityInvariantCoefficientMap.test_zero_ring
example : Function.Surjective
    (divisibilityInvariantCoefficientMap (ZMod.castHom (by decide : 1 ∣ 2) (ZMod 1))
      (0 : ZMod 2)) := by
  sorry

-- test: divisibilityInvariantCoefficientMap.test_killed_coefficient
example : divisibilityInvariantEquiv (2 : ℤ) 4 ≠ divisibilityInvariantEquiv (2 : ℤ) 0 ∧
    divisibilityInvariantCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ)
      (divisibilityInvariantEquiv (2 : ℤ) 4) =
    divisibilityInvariantCoefficientMap (Int.castRingHom (ZMod 4)) (2 : ℤ)
      (divisibilityInvariantEquiv (2 : ℤ) 0) := by
  sorry

end TauCeti.RootStack
end

/-! Actual positive-divisibility root charts as a scheme inverse limit. -/
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
namespace TauCeti.RootStack
open CategoryTheory CategoryTheory.Limits Opposite AlgebraicGeometry
variable {A : Type u} [CommRing A]
attribute [local irreducible] divisibilityCoefficientMap factorialCoefficientMap

def divisibilityRingDiagram (f : A) : RootDivIndex ⥤ CommRingCat.{u} where
  obj n := CommRingCat.of (AffineRing f n.exponent)
  map h := CommRingCat.ofHom (divisibilityAffineMap f _ _ (leOfHom h)).toRingHom
  map_id n := by
    apply CommRingCat.hom_ext
    change (affineDivisibility f n.exponent n.exponent (dvd_refl _)).toRingHom = RingHom.id _
    rw [affineDivisibility.identity]
    rfl
  map_comp {n N P} h k := by
    apply CommRingCat.hom_ext
    exact congrArg AlgHom.toRingHom (affineDivisibility.composition f
      n.exponent N.exponent P.exponent (leOfHom h) (leOfHom k)).symm

def divisibilityRingCocone (f : A) : Cocone (divisibilityRingDiagram f) where
  pt := CommRingCat.of (DivisibilityAffineColimit f)
  ι.app n := CommRingCat.ofHom (divisibilityAffineInclusion f n).toRingHom
  ι.naturality n N h := by
    apply CommRingCat.hom_ext
    apply RingHom.ext
    intro x
    exact divisibilityAffineInclusion.transition f (leOfHom h) x

def divisibilityRingCocone.isColimit (f : A) : IsColimit (divisibilityRingCocone f) where
  desc s := CommRingCat.ofHom (DirectLimit.Ring.lift _ (divisibilityAffineMap f) s.pt
    (fun n => (s.ι.app n).hom) (fun n N h x => by
      exact congrArg (fun z => z.hom x) (s.w (homOfLE h))))
  fac s n := by apply CommRingCat.hom_ext; rfl
  uniq s m hm := by
    apply CommRingCat.hom_ext
    apply DirectLimit.Ring.hom_ext
    intro n
    exact congrArg CommRingCat.Hom.hom (hm n)

def divisibilitySpecDiagram (f : A) : RootDivIndexᵒᵖ ⥤ Scheme.{u} :=
  (divisibilityRingDiagram f).op ⋙ Scheme.Spec

def divisibilitySpecCone (f : A) : Cone (divisibilitySpecDiagram f) :=
  Scheme.Spec.mapCone (divisibilityRingCocone f).op

lemma divisibilitySpecCone.projection (f : A) (n : RootDivIndex) :
    (divisibilitySpecCone f).π.app (op n) =
      Spec.map (CommRingCat.ofHom (divisibilityAffineInclusion f n).toRingHom) := by
  sorry

def divisibilitySpecCone.isLimit (f : A) : IsLimit (divisibilitySpecCone f) :=
  isLimitOfPreserves Scheme.Spec (divisibilityRingCocone.isColimit f).op

def divisibilitySpecLift (f : A) (s : Cone (divisibilitySpecDiagram f)) :
    s.pt ⟶ Spec (CommRingCat.of (DivisibilityAffineColimit f)) :=
  (divisibilitySpecCone.isLimit f).lift s

lemma divisibilitySpecLift.projection (f : A) (s : Cone (divisibilitySpecDiagram f))
    (n : RootDivIndex) :
    divisibilitySpecLift f s ≫ (divisibilitySpecCone f).π.app (op n) = s.π.app (op n) := by
  sorry

lemma divisibilitySpecLift.unique (f : A) (s : Cone (divisibilitySpecDiagram f))
    (g : s.pt ⟶ Spec (CommRingCat.of (DivisibilityAffineColimit f)))
    (h : ∀ n, g ≫ (divisibilitySpecCone f).π.app (op n) = s.π.app (op n)) :
    g = divisibilitySpecLift f s := by
  sorry

lemma divisibilitySpecCone.hom_ext (f : A) {T : Scheme.{u}}
    (g h : T ⟶ Spec (CommRingCat.of (DivisibilityAffineColimit f)))
    (heq : ∀ n, g ≫ (divisibilitySpecCone f).π.app (op n) =
      h ≫ (divisibilitySpecCone f).π.app (op n)) : g = h := by
  sorry

def factorialDivisibilitySpecIso (f : A) :
    Spec (CommRingCat.of (FactorialAffineColimit f)) ≅
      Spec (CommRingCat.of (DivisibilityAffineColimit f)) :=
  Scheme.Spec.mapIso (divisibilityFactorialEquiv f).toRingEquiv.toCommRingCatIso.op

lemma factorialDivisibilitySpecIso.projection (f : A) (n : RootDivIndex) :
    (factorialDivisibilitySpecIso f).hom ≫ (divisibilitySpecCone f).π.app (op n) =
      Spec.map (CommRingCat.ofHom (factorialAffineExtension f n).toRingHom) := by
  sorry

lemma factorialDivisibilitySpecIso.factorial_projection (f : A) (i : ℕ) :
    (factorialDivisibilitySpecIso f).hom ≫
      (divisibilitySpecCone f).π.app (op (RootDivIndex.factorial i)) =
      Spec.map (CommRingCat.ofHom (factorialAffineInclusion f i).toRingHom) := by
  sorry

def divisibilitySpecCoefficientMap {B : Type u} [CommRing B] (φ : A →+* B) (f : A) :
    Spec (CommRingCat.of (DivisibilityAffineColimit (φ f))) ⟶
      Spec (CommRingCat.of (DivisibilityAffineColimit f)) :=
  Spec.map (CommRingCat.ofHom (divisibilityCoefficientMap φ f))

lemma divisibilitySpecCoefficientMap.id (f : A) :
    divisibilitySpecCoefficientMap (RingHom.id A) f = 𝟙 _ := by
  sorry

lemma divisibilitySpecCoefficientMap.comp {B C : Type u} [CommRing B] [CommRing C]
    (φ : A →+* B) (ψ : B →+* C) (f : A) :
    divisibilitySpecCoefficientMap (ψ.comp φ) f =
      divisibilitySpecCoefficientMap ψ (φ f) ≫ divisibilitySpecCoefficientMap φ f := by
  sorry

lemma divisibilitySpecCone.over (f : A) (n : RootDivIndex) :
    (divisibilitySpecCone f).π.app (op n) ≫ Spec.algebraMap A (AffineRing f n.exponent) =
      Spec.algebraMap A (DivisibilityAffineColimit f) := by
  sorry

lemma divisibilitySpecLift.precomp (f : A) (s : Cone (divisibilitySpecDiagram f))
    {T : Scheme.{u}} (g : T ⟶ s.pt) :
    divisibilitySpecLift f (s.extend g) = g ≫ divisibilitySpecLift f s := by
  sorry

lemma divisibilitySpecCoefficientMap.base {B : Type u} [CommRing B]
    (φ : A →+* B) (f : A) :
    divisibilitySpecCoefficientMap φ f ≫ Spec.algebraMap A (DivisibilityAffineColimit f) =
      Spec.algebraMap B (DivisibilityAffineColimit (φ f)) ≫
        Spec.map (CommRingCat.ofHom φ) := by
  sorry

lemma divisibilitySpecCoefficientMap.factorial {B : Type u} [CommRing B]
    (φ : A →+* B) (f : A) :
    (factorialDivisibilitySpecIso (φ f)).hom ≫ divisibilitySpecCoefficientMap φ f =
      Spec.map (CommRingCat.ofHom (factorialCoefficientMap φ f)) ≫
        (factorialDivisibilitySpecIso f).hom := by
  sorry

end TauCeti.RootStack
end


namespace TauCeti.RootStack
open CategoryTheory CategoryTheory.Limits Opposite AlgebraicGeometry
variable {A : Type u} [CommRing A]

-- test: divisibilityRingDiagram.test_two_six
example (f : A) :
    ((divisibilityRingDiagram f).map
      (homOfLE (show (⟨2, by decide⟩ : RootDivIndex) ≤ ⟨6, by decide⟩ from by decide))).hom
      (AdjoinRoot.root _) = (AdjoinRoot.root _ : AffineRing f 6) ^ 3 := by
  sorry

-- test: divisibilityRingDiagram.test_zero_ring_identity
example : (divisibilityRingDiagram (0 : ZMod 1)).map
    (𝟙 (⟨3, by decide⟩ : RootDivIndex)) = 𝟙 _ := by
  sorry

-- test: divisibilityRingDiagram.test_numeric_order
example : ¬ Nonempty ((⟨2, by decide⟩ : RootDivIndex) ⟶ ⟨3, by decide⟩) := by
  sorry

-- test: divisibilityRingCocone.test_third_root
example (f : A) : ((divisibilityRingCocone f).ι.app ⟨3, by decide⟩).hom
    (AdjoinRoot.root _) = divisibilityAffineInclusion f ⟨3, by decide⟩ (AdjoinRoot.root _) := by
  sorry

-- test: divisibilityRingCocone.test_nonreduced_coefficient
example : ((divisibilityRingCocone (2 : ZMod 4)).ι.app ⟨3, by decide⟩).hom
    (algebraMap (ZMod 4) (AffineRing (2 : ZMod 4) 3) 2) =
      algebraMap (ZMod 4) (DivisibilityAffineColimit (2 : ZMod 4)) 2 := by
  sorry

-- test: divisibilityRingCocone.test_zero_ring
example (x : (divisibilityRingCocone (0 : ZMod 1)).pt) : x = 0 := by
  sorry

-- test: divisibilitySpecDiagram.test_third_chart
example (f : A) : (divisibilitySpecDiagram f).obj (op ⟨3, by decide⟩) =
    Spec (CommRingCat.of (AffineRing f 3)) := by
  sorry

-- test: divisibilitySpecDiagram.test_reversed_transition
example (f : A) : (divisibilitySpecDiagram f).map
    (homOfLE (show (⟨2, by decide⟩ : RootDivIndex) ≤ ⟨6, by decide⟩ from by decide)).op =
      Spec.map (CommRingCat.ofHom (affineDivisibility f 2 6 (by decide)).toRingHom) := by
  sorry

-- test: divisibilitySpecDiagram.test_empty_zero_ring
example : IsEmpty ((divisibilitySpecDiagram (0 : ZMod 1)).obj (op ⟨3, by decide⟩)) := by
  sorry

-- test: divisibilitySpecCone.test_third_projection
example (f : A) : (divisibilitySpecCone f).π.app (op ⟨3, by decide⟩) =
    Spec.map (CommRingCat.ofHom (divisibilityAffineInclusion f ⟨3, by decide⟩).toRingHom) := by
  sorry

-- test: divisibilitySpecCone.test_wild_base
example : (divisibilitySpecCone (0 : ZMod 2)).π.app (op ⟨2, by decide⟩) ≫
    Spec.algebraMap (ZMod 2) (AffineRing (0 : ZMod 2) 2) =
      Spec.algebraMap (ZMod 2) (DivisibilityAffineColimit (0 : ZMod 2)) := by
  sorry

-- test: divisibilitySpecCone.test_zero_ring_limit
example : IsLimit (divisibilitySpecCone (0 : ZMod 1)) := by
  sorry

-- test: divisibilitySpecLift.test_self
example (f : A) : divisibilitySpecLift f (divisibilitySpecCone f) = 𝟙 _ := by
  sorry

-- test: divisibilitySpecLift.test_arbitrary_scheme
example (f : A) (s : Cone (divisibilitySpecDiagram f)) :
    divisibilitySpecLift f s ≫ (divisibilitySpecCone f).π.app (op ⟨3, by decide⟩) =
      s.π.app (op ⟨3, by decide⟩) := by
  sorry

-- test: divisibilitySpecLift.test_precomposition
example (f : A) (s : Cone (divisibilitySpecDiagram f)) {T : Scheme.{u}} (g : T ⟶ s.pt) :
    divisibilitySpecLift f (s.extend g) = g ≫ divisibilitySpecLift f s := by
  sorry

-- test: factorialDivisibilitySpecIso.test_inverse
example (f : A) : (factorialDivisibilitySpecIso f).hom ≫
    (factorialDivisibilitySpecIso f).inv = 𝟙 _ := by
  sorry

-- test: factorialDivisibilitySpecIso.test_third_projection
example : (factorialDivisibilitySpecIso (2 : ZMod 4)).hom ≫
    (divisibilitySpecCone (2 : ZMod 4)).π.app (op ⟨3, by decide⟩) =
      Spec.map (CommRingCat.ofHom (factorialAffineExtension (2 : ZMod 4) ⟨3, by decide⟩).toRingHom) := by
  sorry

-- test: factorialDivisibilitySpecIso.test_zero_ring
example : (factorialDivisibilitySpecIso (0 : ZMod 1)).hom ≫
    (divisibilitySpecCone (0 : ZMod 1)).π.app (op (RootDivIndex.factorial 0)) =
      Spec.map (CommRingCat.ofHom (factorialAffineInclusion (0 : ZMod 1) 0).toRingHom) := by
  sorry

-- test: divisibilitySpecCoefficientMap.test_identity
example : divisibilitySpecCoefficientMap (RingHom.id (ZMod 4)) 2 = 𝟙 _ := by
  sorry

-- test: divisibilitySpecCoefficientMap.test_nonflat_base
example : divisibilitySpecCoefficientMap (Int.castRingHom (ZMod 4)) 2 ≫
    Spec.algebraMap ℤ (DivisibilityAffineColimit (2 : ℤ)) =
      Spec.algebraMap (ZMod 4) (DivisibilityAffineColimit (2 : ZMod 4)) ≫
        Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 4))) := by
  sorry

-- test: divisibilitySpecCoefficientMap.test_zero_ring_target
example (φ : ZMod 4 →+* ZMod 1) : divisibilitySpecCoefficientMap
    (φ.comp (Int.castRingHom (ZMod 4))) 2 =
      divisibilitySpecCoefficientMap φ 2 ≫ divisibilitySpecCoefficientMap (Int.castRingHom (ZMod 4)) 2 := by
  sorry

end TauCeti.RootStack
