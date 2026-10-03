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

/- BEGIN ARCHIVED CHECKED FACTORIAL UNIVERSAL COACTION
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
import Mathlib.Algebra.Field.ZMod
import Mathlib.Data.Finset.Prod
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Isomorphisms
import Mathlib.Algebra.Group.Fin.Basic
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Free
import Mathlib.CategoryTheory.Core
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.RootsOfUnity.Basic
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
import Mathlib.LinearAlgebra.Quotient.Defs
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
noncomputable section
universe u
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct
abbrev AffineRing (f : A) (n : ℕ) :=
  AdjoinRoot (Polynomial.X ^ n - Polynomial.C f)

abbrev MuHopf (R : Type u) [CommRing R] (n : ℕ) :=
  MonoidAlgebra R (Multiplicative (ZMod n))

lemma affineRoot.pow_eq (f : A) (n : ℕ) :
    AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ n =
      algebraMap A (AffineRing f n) f := by
  have h := AdjoinRoot.eval₂_root (Polynomial.X ^ n - Polynomial.C f)
  simpa only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
    Polynomial.eval₂_C, sub_eq_zero, AdjoinRoot.algebraMap_eq] using h
lemma affineCharacter.pow (n i : ℕ) :
    (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A)) ^ i =
      MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) := by
  rw [MonoidAlgebra.single_pow, ← ofAdd_nsmul]
  simp
lemma affineRoot.pow_reduce (f : A) (n k : ℕ) [NeZero n] :
    AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ k =
      f ^ (k / n) • (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ (k % n)) := by
  calc
    _ = AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ (n * (k / n) + k % n) := by
      rw [Nat.div_add_mod]
    _ = _ := by rw [pow_add, pow_mul, affineRoot.pow_eq, Algebra.smul_def, map_pow]
def affineCoaction (f : A) (n : ℕ) [NeZero n] :
    AffineRing f n →ₐ[A] (MuHopf A n ⊗[A] AffineRing f n) :=
  AdjoinRoot.liftAlgHom (Polynomial.X ^ n - Polynomial.C f)
    (Algebra.ofId A (MuHopf A n ⊗[A] AffineRing f n))
    (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
      AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) (by
      simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
        Polynomial.eval₂_C, Algebra.TensorProduct.tmul_pow,
        affineCharacter.pow, ZMod.natCast_self, ofAdd_zero,
        affineRoot.pow_eq]
      rw [sub_eq_zero]
      exact ((Algebra.TensorProduct.includeRight : AffineRing f n →ₐ[A]
        MuHopf A n ⊗[A] AffineRing f n).commutes f))
lemma affineCoaction.root (f : A) (n : ℕ) [NeZero n] :
    affineCoaction f n (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) := by
  simp [affineCoaction]
lemma affineCoaction.constant (f a : A) (n : ℕ) [NeZero n] :
    affineCoaction f n (algebraMap A (AffineRing f n) a) =
      (1 : MuHopf A n) ⊗ₜ[A] algebraMap A (AffineRing f n) a := by
  rw [(affineCoaction f n).commutes]
  exact ((Algebra.TensorProduct.includeRight : AffineRing f n →ₐ[A]
    MuHopf A n ⊗[A] AffineRing f n).commutes a).symm
lemma affineCoaction.unique (f : A) (n : ℕ) [NeZero n]
    (ψ : AffineRing f n →ₐ[A] (MuHopf A n ⊗[A] AffineRing f n))
    (hψ : ψ (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) :
    ψ = affineCoaction f n := by
  apply AdjoinRoot.algHom_ext
  rw [hψ, affineCoaction.root]
lemma affineCoaction.weight (f : A) (n i : ℕ) [NeZero n] :
    affineCoaction f n ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) ^ i) =
      MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) ⊗ₜ[A]
        ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) ^ i) := by
  rw [map_pow, affineCoaction.root, Algebra.TensorProduct.tmul_pow, affineCharacter.pow]
-- TauCeti.RootStack.affineCoaction.counit
lemma affineCoaction.counit (f : A) (n : ℕ) [NeZero n] :
    ((Algebra.TensorProduct.lid A (AffineRing f n)).toAlgHom.comp
      (Algebra.TensorProduct.map (Bialgebra.counitAlgHom A (MuHopf A n))
        (AlgHom.id A (AffineRing f n)))).comp (affineCoaction f n) =
      AlgHom.id A (AffineRing f n) := by
  apply AdjoinRoot.algHom_ext
  simp [AlgHom.comp_apply, affineCoaction.root, Bialgebra.counitAlgHom]

-- TauCeti.RootStack.affineCoaction.coassoc
lemma affineCoaction.coassoc (f : A) (n : ℕ) [NeZero n] :
    (Algebra.TensorProduct.assoc A A A (MuHopf A n) (MuHopf A n)
      (AffineRing f n)).toAlgHom.comp
      ((Algebra.TensorProduct.map (Bialgebra.comulAlgHom A (MuHopf A n))
        (AlgHom.id A (AffineRing f n))).comp (affineCoaction f n)) =
      (Algebra.TensorProduct.map (AlgHom.id A (MuHopf A n))
        (affineCoaction f n)).comp (affineCoaction f n) := by
  apply AdjoinRoot.algHom_ext
  simp [AlgHom.comp_apply, affineCoaction.root, Bialgebra.comulAlgHom]

-- TauCeti.RootStack.affineCoaction.test_one
example (f : A) (b : AffineRing f 1) :
    affineCoaction f 1 b = (1 : MuHopf A 1) ⊗ₜ[A] b := by
  have h : affineCoaction f 1 = (Algebra.TensorProduct.includeRight :
      AffineRing f 1 →ₐ[A] MuHopf A 1 ⊗[A] AffineRing f 1) := by
    apply AdjoinRoot.algHom_ext
    rw [affineCoaction.root]
    change MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 1)) (1 : A) ⊗ₜ[A] _ = _
    rw [show (1 : ZMod 1) = 0 from Subsingleton.elim _ _, ofAdd_zero, ← MonoidAlgebra.one_def]
    rfl
  rw [h]
  rfl

section AffineTorsorComparison

variable {A : Type u} [CommRing A]
open scoped TensorProduct

/-- The action comparison on coordinate algebras, with the unchanged right
factor. Its formula on pure tensors is specified below. -/
def affineTorsorComparison (f : A) (n : ℕ) [NeZero n] :
    (AffineRing f n ⊗[A] AffineRing f n) →ₐ[A]
      (MuHopf A n ⊗[A] AffineRing f n) := by
  exact Algebra.TensorProduct.lift (affineCoaction f n)
    Algebra.TensorProduct.includeRight (fun _ _ => Commute.all _ _)

lemma affineTorsorComparison.tmul (f : A) (n : ℕ) [NeZero n]
    (x y : AffineRing f n) :
    affineTorsorComparison f n (x ⊗ₜ[A] y) =
      affineCoaction f n x * ((1 : MuHopf A n) ⊗ₜ[A] y) := by
  rfl

lemma affineTorsorComparison.left_root (f : A) (n : ℕ) [NeZero n] :
    affineTorsorComparison f n
      (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ⊗ₜ[A]
        (1 : AffineRing f n)) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) := by
  rw [affineTorsorComparison.tmul, affineCoaction.root]
  simp

lemma affineTorsorComparison.right_factor (f : A) (n : ℕ) [NeZero n]
    (y : AffineRing f n) :
    affineTorsorComparison f n ((1 : AffineRing f n) ⊗ₜ[A] y) =
      (1 : MuHopf A n) ⊗ₜ[A] y := by
  rw [affineTorsorComparison.tmul, map_one, one_mul]

lemma affineTorsorComparison.unique (f : A) (n : ℕ) [NeZero n]
    (h : (AffineRing f n ⊗[A] AffineRing f n) →ₐ[A]
      (MuHopf A n ⊗[A] AffineRing f n))
    (hh : ∀ x y : AffineRing f n,
      h (x ⊗ₜ[A] y) = affineCoaction f n x * ((1 : MuHopf A n) ⊗ₜ[A] y)) :
    h = affineTorsorComparison f n := by
  apply Algebra.TensorProduct.ext'
  intro x y
  rw [hh, affineTorsorComparison.tmul]

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
  rw [affineTorsorComparison.tmul, affineCoaction.weight,
    Algebra.TensorProduct.tmul_mul_tmul, mul_one, ← pow_add, affineRoot.pow_reduce]
  exact TensorProduct.tmul_smul _ _ _


/-- Every source tensor has unique monic-basis coefficients, including over
the zero ring. In that case use the unique coefficient function directly. -/
lemma affineTorsorComparison.source_coordinates (f : A) (n : ℕ) [NeZero n]
    (z : AffineRing f n ⊗[A] AffineRing f n) :
    ∃! c : (Fin n × Fin n) → A,
      z = ∑ p : Fin n × Fin n, c p •
        ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by
  classical
  by_cases hA : Subsingleton A
  · let : Subsingleton A := hA
    have : Subsingleton (AffineRing f n ⊗[A] AffineRing f n) := Module.subsingleton A _
    exact ⟨0, Subsingleton.elim _ _, fun _ _ => Subsingleton.elim _ _⟩
  · let : Nontrivial A := not_subsingleton_iff_nontrivial.mp hA
    have hd : (Polynomial.X ^ n - Polynomial.C f).natDegree = n :=
      Polynomial.natDegree_X_pow_sub_C
    let pb := AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C f (NeZero.ne n))
    let b := pb.basis.reindex (finCongr hd)
    have hb (i : Fin n) : b i = AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ i.val := by
      rw [Module.Basis.reindex_apply, pb.basis_eq_pow]
      rfl
    let v := b.tensorProduct b
    have hv (p : Fin n × Fin n) : v p =
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val) := by
      rw [Module.Basis.tensorProduct_apply', hb, hb]
    refine ⟨v.equivFun z, ?_, ?_⟩
    · simpa only [hv] using (v.sum_equivFun z).symm
    · intro c hc
      apply v.equivFun.symm.injective
      simpa only [Module.Basis.equivFun_symm_apply, hv,
        LinearEquiv.symm_apply_apply] using hc.symm


/-- Character basis in the first factor and monic basis in the second. -/
lemma affineTorsorComparison.target_coordinates (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n) :
    ∃! c : (Fin n × Fin n) → A,
      z = ∑ p : Fin n × Fin n, c p •
        (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by
  classical
  by_cases hA : Subsingleton A
  · let : Subsingleton A := hA
    have : Subsingleton (MuHopf A n ⊗[A] AffineRing f n) := Module.subsingleton A _
    exact ⟨0, Subsingleton.elim _ _, fun _ _ => Subsingleton.elim _ _⟩
  · let : Nontrivial A := not_subsingleton_iff_nontrivial.mp hA
    have hd : (Polynomial.X ^ n - Polynomial.C f).natDegree = n :=
      Polynomial.natDegree_X_pow_sub_C
    let pb := AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C f (NeZero.ne n))
    let b := pb.basis.reindex (finCongr hd)
    have hb (i : Fin n) : b i = AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ i.val := by
      rw [Module.Basis.reindex_apply, pb.basis_eq_pow]
      rfl
    let e : Multiplicative (ZMod n) ≃ Fin n :=
      Multiplicative.toAdd.trans (ZMod.finEquiv n).toEquiv.symm
    let a := (MonoidAlgebra.basis (Multiplicative (ZMod n)) A).reindex e
    have hz (i : Fin n) : ZMod.finEquiv n i = (i.val : ZMod n) := by
      cases n with
      | zero => exact (NeZero.ne 0 rfl).elim
      | succ n =>
        apply Fin.ext
        change i.val = ((i.val : ZMod (n + 1))).val
        exact (ZMod.val_natCast_of_lt i.isLt).symm
    have ha (i : Fin n) : a i =
        MonoidAlgebra.single (Multiplicative.ofAdd (i.val : ZMod n)) (1 : A) := by
      rw [Module.Basis.reindex_apply, MonoidAlgebra.basis_apply]
      change MonoidAlgebra.single (Multiplicative.ofAdd (ZMod.finEquiv n i)) (1 : A) = _
      rw [hz]
    let v := a.tensorProduct b
    have hv (p : Fin n × Fin n) : v p =
        MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val) := by
      rw [Module.Basis.tensorProduct_apply', ha, hb]
    refine ⟨v.equivFun z, ?_, ?_⟩
    · simpa only [hv] using (v.sum_equivFun z).symm
    · intro c hc
      apply v.equivFun.symm.injective
      simpa only [Module.Basis.equivFun_symm_apply, hv,
        LinearEquiv.symm_apply_apply] using hc.symm


/-- The actual finite coefficient equivalence, fixed by the original tensor
monomials. This includes the subsingleton coefficient ring. -/
def affineTorsorComparison.sourceCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    (AffineRing f n ⊗[A] AffineRing f n) ≃ₗ[A] ((Fin n × Fin n) → A) := by
  classical
  let s : ((Fin n × Fin n) → A) →ₗ[A] (AffineRing f n ⊗[A] AffineRing f n) :=
    { toFun := fun c => ∑ p, c p •
        ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))
      map_add' := by intro c d; simp [add_smul, Finset.sum_add_distrib]
      map_smul' := by intro a c; simp [Finset.smul_sum, smul_smul] }
  have hs : Function.Bijective s := by
    constructor
    · intro c d h
      obtain ⟨v, _, hu⟩ := affineTorsorComparison.source_coordinates f n (s c)
      exact (hu c rfl).trans (hu d h).symm
    · intro z
      obtain ⟨c, hc, _⟩ := affineTorsorComparison.source_coordinates f n z
      exact ⟨c, hc.symm⟩
  exact (LinearEquiv.ofBijective s hs).symm

lemma affineTorsorComparison.sourceCoordinateEquiv_symm_apply (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    (affineTorsorComparison.sourceCoordinateEquiv f n).symm c =
      ∑ p, c p • ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := rfl

lemma affineTorsorComparison.sourceCoordinateEquiv_apply_sum (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    affineTorsorComparison.sourceCoordinateEquiv f n
      (∑ p, c p • ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) = c :=
  (affineTorsorComparison.sourceCoordinateEquiv f n).apply_symm_apply c

lemma affineTorsorComparison.sourceCoordinateEquiv_monomial (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    affineTorsorComparison.sourceCoordinateEquiv f n
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) =
      Pi.single p 1 := by
  classical
  have hs : (affineTorsorComparison.sourceCoordinateEquiv f n).symm (Pi.single p 1) =
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by
    rw [affineTorsorComparison.sourceCoordinateEquiv_symm_apply]
    simp [Pi.single_apply]
  rw [← hs]
  exact (affineTorsorComparison.sourceCoordinateEquiv f n).apply_symm_apply _

/-- The character tensor coefficient equivalence uses every group-algebra
character, including in characteristic dividing n. -/
def affineTorsorComparison.targetCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    (MuHopf A n ⊗[A] AffineRing f n) ≃ₗ[A] ((Fin n × Fin n) → A) := by
  classical
  let s : ((Fin n × Fin n) → A) →ₗ[A] (MuHopf A n ⊗[A] AffineRing f n) :=
    { toFun := fun c => ∑ p, c p •
        (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))
      map_add' := by intro c d; simp [add_smul, Finset.sum_add_distrib]
      map_smul' := by intro a c; simp [Finset.smul_sum, smul_smul] }
  have hs : Function.Bijective s := by
    constructor
    · intro c d h
      obtain ⟨v, _, hu⟩ := affineTorsorComparison.target_coordinates f n (s c)
      exact (hu c rfl).trans (hu d h).symm
    · intro z
      obtain ⟨c, hc, _⟩ := affineTorsorComparison.target_coordinates f n z
      exact ⟨c, hc.symm⟩
  exact (LinearEquiv.ofBijective s hs).symm

lemma affineTorsorComparison.targetCoordinateEquiv_symm_apply (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    (affineTorsorComparison.targetCoordinateEquiv f n).symm c =
      ∑ p, c p • (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := rfl

lemma affineTorsorComparison.targetCoordinateEquiv_apply_sum (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    affineTorsorComparison.targetCoordinateEquiv f n
      (∑ p, c p • (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) = c :=
  (affineTorsorComparison.targetCoordinateEquiv f n).apply_symm_apply c

lemma affineTorsorComparison.targetCoordinateEquiv_monomial (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    affineTorsorComparison.targetCoordinateEquiv f n
      (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) =
      Pi.single p 1 := by
  classical
  have hs : (affineTorsorComparison.targetCoordinateEquiv f n).symm (Pi.single p 1) =
      (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) := by
    rw [affineTorsorComparison.targetCoordinateEquiv_symm_apply]
    simp [Pi.single_apply]
  rw [← hs]
  exact (affineTorsorComparison.targetCoordinateEquiv f n).apply_symm_apply _

-- affineTorsorComparison.sourceCoordinateEquiv.test_one
example (f : A) : affineTorsorComparison.sourceCoordinateEquiv f 1
    ((1 : AffineRing f 1) ⊗ₜ[A] (1 : AffineRing f 1)) = Pi.single (0, 0) 1 := by
  simpa using affineTorsorComparison.sourceCoordinateEquiv_monomial f 1 (0, 0)
-- affineTorsorComparison.sourceCoordinateEquiv.test_zero_ring
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n]
    (z : AffineRing f n ⊗[A] AffineRing f n) :
    affineTorsorComparison.sourceCoordinateEquiv f n z = 0 := Subsingleton.elim _ _
-- affineTorsorComparison.sourceCoordinateEquiv.test_nonreduced
example : affineTorsorComparison.sourceCoordinateEquiv (2 : ZMod 4) 2
    (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4)) ⊗ₜ[ZMod 4]
      AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4))) (1, 1) = 1 := by
  simpa using congrFun
    (affineTorsorComparison.sourceCoordinateEquiv_monomial (2 : ZMod 4) 2 (1, 1)) (1, 1)
-- affineTorsorComparison.targetCoordinateEquiv.test_one
example (f : A) : affineTorsorComparison.targetCoordinateEquiv f 1
    ((1 : MuHopf A 1) ⊗ₜ[A] (1 : AffineRing f 1)) = Pi.single (0, 0) 1 := by
  simpa [MonoidAlgebra.one_def] using
    affineTorsorComparison.targetCoordinateEquiv_monomial f 1 (0, 0)
-- affineTorsorComparison.targetCoordinateEquiv.test_zero_ring
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n) :
    affineTorsorComparison.targetCoordinateEquiv f n z = 0 := Subsingleton.elim _ _
-- affineTorsorComparison.targetCoordinateEquiv.test_wild_character
example : affineTorsorComparison.targetCoordinateEquiv (0 : ZMod 2) 2
    (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 2) ⊗ₜ[ZMod 2]
      (1 : AffineRing (0 : ZMod 2) 2)) (1, 0) = 1 := by
  simpa using congrFun
    (affineTorsorComparison.targetCoordinateEquiv_monomial (0 : ZMod 2) 2 (1, 0)) (1, 0)

def affineTorsorComparison.coefficientPermutation (n : ℕ) [NeZero n] :
    (Fin n × Fin n) ≃ (Fin n × Fin n) where
  toFun p := (p.1, p.1 + p.2)
  invFun p := (p.1, p.2 - p.1)
  left_inv p := by ext <;> simp
  right_inv p := by ext <;> simp

lemma affineTorsorComparison.coefficientPermutation_apply (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    coefficientPermutation n p = (p.1, p.1 + p.2) := rfl

lemma affineTorsorComparison.coefficientPermutation_symm (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (coefficientPermutation n).symm p = (p.1, p.2 - p.1) := rfl

lemma affineTorsorComparison.wrap_iff_lower (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (coefficientPermutation n p).2.val < (coefficientPermutation n p).1.val ↔
      n ≤ p.1.val + p.2.val := by
  change (p.1 + p.2).val < p.1.val ↔ n ≤ p.1.val + p.2.val
  have h := Fin.coe_int_add_eq_ite p.1 p.2
  split_ifs at h <;> omega

-- affineTorsorComparison.coefficientPermutation.test_one
example (p : Fin 1 × Fin 1) : affineTorsorComparison.coefficientPermutation 1 p = p := by
  exact Subsingleton.elim _ _
-- affineTorsorComparison.coefficientPermutation.test_wrap
example : affineTorsorComparison.coefficientPermutation 2 (1,1) = (1,0) := by decide
-- affineTorsorComparison.coefficientPermutation.test_inverse
example : (affineTorsorComparison.coefficientPermutation 3).symm (2,0) = (2,1) := by decide

lemma affineTorsorComparison.coefficientPermutation_val (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (coefficientPermutation n p).2.val = (p.1.val + p.2.val) % n := rfl

lemma affineTorsorComparison.monomial_permuted (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    affineTorsorComparison f n
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val)) =
      (if (coefficientPermutation n p).2.val < p.1.val then f else 1) •
        (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^
            (coefficientPermutation n p).2.val)) := by
  rw [affineTorsorComparison.monomial, coefficientPermutation_val]
  congr 1
  by_cases h : p.1.val + p.2.val < n
  · have hn : ¬ (coefficientPermutation n p).2.val < p.1.val := by
      intro hlt
      have hwrap := (wrap_iff_lower n p).mp hlt
      omega
    simp only [coefficientPermutation_val] at hn
    rw [ite_eq_right hn, Nat.div_eq_of_lt h, pow_zero]
  · have hn : (coefficientPermutation n p).2.val < p.1.val :=
      (wrap_iff_lower n p).mpr (by omega)
    have hd : (p.1.val + p.2.val) / n = 1 :=
      Nat.div_eq_of_lt_le (by omega) (by omega)
    simp only [coefficientPermutation_val] at hn
    rw [ite_eq_left hn, hd, pow_one]

lemma affineTorsorComparison.monomial_coordinates (f : A) (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    targetCoordinateEquiv f n (affineTorsorComparison f n
      ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) =
      (if (coefficientPermutation n p).2.val < (coefficientPermutation n p).1.val
        then f else 1) • Pi.single (coefficientPermutation n p) 1 := by
  rw [monomial_permuted, map_smul]
  congr 1
  exact targetCoordinateEquiv_monomial f n (coefficientPermutation n p)

lemma affineTorsorComparison.coefficient_map (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) (q : Fin n × Fin n) :
    targetCoordinateEquiv f n
      (affineTorsorComparison f n ((sourceCoordinateEquiv f n).symm c)) q =
      (if q.2.val < q.1.val then f else 1) *
        c ((coefficientPermutation n).symm q) := by
  classical
  rw [sourceCoordinateEquiv_symm_apply]
  simp only [map_sum, map_smul, monomial_coordinates, smul_smul]
  rw [Finset.sum_apply]
  rw [Finset.sum_eq_single ((coefficientPermutation n).symm q)]
  · simp [smul_eq_mul, mul_comm]
  · intro p _ hp
    have hne : coefficientPermutation n p ≠ q := by
      intro h
      apply hp
      apply (coefficientPermutation n).injective
      simpa using h
    simp [hne]
  · simp


/-- The nonwrapping source coefficients vanish; the wrapping coefficients
lie in the annihilator of f. This also specifies the kernel comparison map. -/
lemma affineTorsorComparison.kernel_coefficients (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    affineTorsorComparison f n
      (∑ p : Fin n × Fin n, c p •
        ((AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.1.val) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) = 0 ↔
      ∀ p : Fin n × Fin n,
        if p.1.val + p.2.val < n then c p = 0 else f * c p = 0 := by
  classical
  rw [← sourceCoordinateEquiv_symm_apply]
  constructor
  · intro hz p
    have hq := congrArg
      (fun z => targetCoordinateEquiv f n z (coefficientPermutation n p)) hz
    simp only [coefficient_map, Equiv.symm_apply_apply, map_zero, Pi.zero_apply,
      wrap_iff_lower] at hq
    by_cases hp : p.1.val + p.2.val < n
    · simpa [hp, not_le.mpr hp] using hq
    · simpa [hp, le_of_not_gt hp] using hq
  · intro hc
    apply (targetCoordinateEquiv f n).injective
    ext q
    rw [coefficient_map, map_zero]
    change (if q.2.val < q.1.val then f else 1) *
      c ((coefficientPermutation n).symm q) = 0
    have hp := hc ((coefficientPermutation n).symm q)
    have hw := wrap_iff_lower n ((coefficientPermutation n).symm q)
    simp only [Equiv.apply_symm_apply] at hw
    split_ifs at hp with hs
    · have hlow : ¬ q.2.val < q.1.val := by
        intro h
        have := hw.mp h
        omega
      simpa [hlow] using hp
    · have hlow : q.2.val < q.1.val := hw.mpr (by omega)
      simpa [hlow] using hp


/-- Target coefficients below the diagonal, not all coefficients, must be
multiples of f. This specifies the cokernel quotient map. -/
lemma affineTorsorComparison.image_coefficients (f : A) (n : ℕ) [NeZero n]
    (c : (Fin n × Fin n) → A) :
    (∑ p : Fin n × Fin n, c p •
      (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
        (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) ∈
      LinearMap.range (affineTorsorComparison f n).toLinearMap ↔
      ∀ p : Fin n × Fin n, p.2.val < p.1.val → ∃ a : A, c p = f * a := by
  classical
  constructor
  · rintro ⟨z, hz⟩ q hq
    have ht := congrArg (fun z => targetCoordinateEquiv f n z q) hz
    rw [targetCoordinateEquiv_apply_sum] at ht
    have hc := coefficient_map f n (sourceCoordinateEquiv f n z) q
    rw [LinearEquiv.symm_apply_apply] at hc
    refine ⟨sourceCoordinateEquiv f n z ((coefficientPermutation n).symm q), ?_⟩
    simpa [hq] using (hc.symm.trans ht).symm
  · intro h
    let d : (Fin n × Fin n) → A := fun q =>
      if hq : q.2.val < q.1.val then Classical.choose (h q hq) else c q
    have hd (q : Fin n × Fin n) :
        (if q.2.val < q.1.val then f else 1) * d q = c q := by
      dsimp [d]
      split_ifs with hq
      · exact (Classical.choose_spec (h q hq)).symm
      · simp
    let b : (Fin n × Fin n) → A := fun p => d (coefficientPermutation n p)
    refine ⟨(sourceCoordinateEquiv f n).symm b, ?_⟩
    apply (targetCoordinateEquiv f n).injective
    ext q
    change targetCoordinateEquiv f n (affineTorsorComparison f n
      ((sourceCoordinateEquiv f n).symm b)) q = _
    rw [coefficient_map, targetCoordinateEquiv_apply_sum]
    simpa only [b, Equiv.apply_symm_apply] using hd q

/-- Kernel coefficients of an actual tensor, rather than a chosen presentation. -/
lemma affineTorsorComparison.kernel_coordinate_condition (f : A) (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison f n).toLinearMap)
    (p : Fin n × Fin n) :
    if p.1.val + p.2.val < n then sourceCoordinateEquiv f n z p = 0
      else f * sourceCoordinateEquiv f n z p = 0 := by
  have hz : affineTorsorComparison f n
      ((sourceCoordinateEquiv f n).symm (sourceCoordinateEquiv f n z)) = 0 := by
    have hz0 := LinearMap.mem_ker.mp z.property
    change affineTorsorComparison f n (z : AffineRing f n ⊗[A] AffineRing f n) = 0 at hz0
    simpa only [LinearEquiv.symm_apply_apply] using hz0
  rw [sourceCoordinateEquiv_symm_apply] at hz
  exact (kernel_coefficients f n (sourceCoordinateEquiv f n z)).mp hz p

/-- The specified kernel equivalence extracts wrapping coefficients; its inverse
extends an annihilator family by zero before native source synthesis. -/
noncomputable def affineTorsorComparison.kernelCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    (LinearMap.ker (affineTorsorComparison f n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // n ≤ p.1.val + p.2.val} →
        LinearMap.ker (f • (LinearMap.id : A →ₗ[A] A))) := by
  classical
  exact
    { toFun := fun z p => ⟨sourceCoordinateEquiv f n z p.val, by
        change f * sourceCoordinateEquiv f n z p.val = 0
        simpa only [ite_eq_right (not_lt.mpr p.property)] using
          kernel_coordinate_condition f n z p.val⟩
      invFun := fun d => ⟨(sourceCoordinateEquiv f n).symm
        (fun p => if hp : n ≤ p.1.val + p.2.val then (d ⟨p, hp⟩ : A) else 0), by
        rw [LinearMap.mem_ker]
        change affineTorsorComparison f n ((sourceCoordinateEquiv f n).symm _) = 0
        rw [sourceCoordinateEquiv_symm_apply]
        apply (kernel_coefficients f n _).mpr
        intro p
        by_cases hp : n ≤ p.1.val + p.2.val
        · simp only [ite_eq_right (not_lt.mpr hp), dite_eq_left hp]
          exact LinearMap.mem_ker.mp (d ⟨p, hp⟩).property
        · simp [hp, lt_of_not_ge hp]⟩
      left_inv := by
        intro z
        apply Subtype.ext
        apply (sourceCoordinateEquiv f n).injective
        ext p
        rw [LinearEquiv.apply_symm_apply]
        by_cases hp : n ≤ p.1.val + p.2.val
        · simp only [dite_eq_left hp]
        · simp only [dite_eq_right hp]
          symm
          simpa only [ite_eq_left (lt_of_not_ge hp)] using kernel_coordinate_condition f n z p
      right_inv := by
        intro d
        funext p
        apply Subtype.ext
        change sourceCoordinateEquiv f n
          ((sourceCoordinateEquiv f n).symm _) p.val = (d p : A)
        rw [LinearEquiv.apply_symm_apply]
        simp only [dite_eq_left p.property]
      map_add' := by
        intro z w
        funext p
        apply Subtype.ext
        exact congrFun ((sourceCoordinateEquiv f n).map_add (z : _) (w : _)) p.val
      map_smul' := by
        intro a z
        funext p
        apply Subtype.ext
        exact congrFun ((sourceCoordinateEquiv f n).map_smul a (z : _)) p.val }

lemma affineTorsorComparison.kernelCoordinateEquiv_apply (f : A) (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison f n).toLinearMap)
    (p : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val}) :
    (kernelCoordinateEquiv f n z p : A) = sourceCoordinateEquiv f n z p.val := rfl

lemma affineTorsorComparison.kernelCoordinateEquiv_symm_coordinates (f : A) (n : ℕ) [NeZero n]
    (d : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} →
      LinearMap.ker (f • (LinearMap.id : A →ₗ[A] A))) (p : Fin n × Fin n) :
    sourceCoordinateEquiv f n ((kernelCoordinateEquiv f n).symm d :
      AffineRing f n ⊗[A] AffineRing f n) p =
      if hp : n ≤ p.1.val + p.2.val then (d ⟨p, hp⟩ : A) else 0 := by
  change sourceCoordinateEquiv f n ((sourceCoordinateEquiv f n).symm _) p = _
  rw [LinearEquiv.apply_symm_apply]

lemma affineTorsorComparison.kernelCoordinateEquiv_nonwrap (f : A) (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison f n).toLinearMap)
    (p : Fin n × Fin n) (hp : p.1.val + p.2.val < n) :
    sourceCoordinateEquiv f n z p = 0 := by
  simpa only [ite_eq_left hp] using kernel_coordinate_condition f n z p

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
  refine ⟨kernelCoordinateEquiv f n, ?_⟩
  intro z c _hc p
  rw [kernelCoordinateEquiv_apply]
  rw [_hc, sourceCoordinateEquiv_apply_sum]

/-- Lower target coefficients modulo the actual principal ideal. -/
noncomputable def affineTorsorComparison.cokernelResidue (f : A) (n : ℕ) [NeZero n] :
    (MuHopf A n ⊗[A] AffineRing f n) →ₗ[A]
      ({p : Fin n × Fin n // p.2.val < p.1.val} → A ⧸ Ideal.span ({f} : Set A)) where
  toFun z p := (Ideal.span ({f} : Set A)).mkQ (targetCoordinateEquiv f n z p.val)
  map_add' z w := by
    funext p
    simp only [map_add, Pi.add_apply]
  map_smul' a z := by
    funext p
    simp only [map_smul, Pi.smul_apply]
    rfl

lemma affineTorsorComparison.cokernelResidue_apply (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n)
    (p : {p : Fin n × Fin n // p.2.val < p.1.val}) :
    cokernelResidue f n z p =
      Ideal.Quotient.mk (Ideal.span ({f} : Set A)) (targetCoordinateEquiv f n z p.val) := rfl

lemma affineTorsorComparison.cokernelResidue_surjective (f : A) (n : ℕ) [NeZero n] :
    Function.Surjective (cokernelResidue f n) := by
  classical
  intro d
  let c : (Fin n × Fin n) → A := fun q =>
    if hq : q.2.val < q.1.val then
      Classical.choose (Ideal.Quotient.mk_surjective (d ⟨q, hq⟩)) else 0
  refine ⟨(targetCoordinateEquiv f n).symm c, ?_⟩
  funext p
  rw [cokernelResidue_apply, LinearEquiv.apply_symm_apply]
  simp only [c, dite_eq_left p.property]
  exact Classical.choose_spec (Ideal.Quotient.mk_surjective (d p))

lemma affineTorsorComparison.cokernelResidue_ker (f : A) (n : ℕ) [NeZero n] :
    LinearMap.ker (cokernelResidue f n) =
      LinearMap.range (affineTorsorComparison f n).toLinearMap := by
  classical
  ext z
  rw [LinearMap.mem_ker]
  have himg : z ∈ LinearMap.range (affineTorsorComparison f n).toLinearMap ↔
      ∀ q : Fin n × Fin n, q.2.val < q.1.val →
        ∃ a : A, targetCoordinateEquiv f n z q = f * a := by
    have h := image_coefficients f n (targetCoordinateEquiv f n z)
    rw [← targetCoordinateEquiv_symm_apply, LinearEquiv.symm_apply_apply] at h
    exact h
  rw [himg]
  constructor
  · intro hz q hq
    have he := congrFun hz ⟨q, hq⟩
    rw [cokernelResidue_apply] at he
    obtain ⟨a, ha⟩ := Ideal.mem_span_singleton'.mp (Ideal.Quotient.eq_zero_iff_mem.mp he)
    exact ⟨a, by simpa only [mul_comm] using ha.symm⟩
  · intro hz
    funext p
    rw [cokernelResidue_apply]
    apply Ideal.Quotient.eq_zero_iff_mem.mpr
    obtain ⟨a, ha⟩ := hz p.val p.property
    exact Ideal.mem_span_singleton'.mpr ⟨a, by simpa only [mul_comm] using ha.symm⟩

/-- Native first-isomorphism equivalence, transported by the proved equality
of the residue kernel and the actual comparison range as A-submodules. -/
noncomputable def affineTorsorComparison.cokernelCoordinateEquiv (f : A) (n : ℕ) [NeZero n] :
    ((MuHopf A n ⊗[A] AffineRing f n) ⧸
      LinearMap.range (affineTorsorComparison f n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // p.2.val < p.1.val} → A ⧸ Ideal.span ({f} : Set A)) :=
  (Submodule.quotEquivOfEq _ _ (cokernelResidue_ker f n).symm).trans
    ((cokernelResidue f n).quotKerEquivOfSurjective (cokernelResidue_surjective f n))

lemma affineTorsorComparison.cokernelCoordinateEquiv_mk (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n)
    (p : {p : Fin n × Fin n // p.2.val < p.1.val}) :
    cokernelCoordinateEquiv f n (Submodule.Quotient.mk z) p =
      Ideal.Quotient.mk (Ideal.span ({f} : Set A)) (targetCoordinateEquiv f n z p.val) := rfl

lemma affineTorsorComparison.cokernelCoordinateEquiv_symm_residue (f : A) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing f n) :
    (cokernelCoordinateEquiv f n).symm (cokernelResidue f n z) =
      Submodule.Quotient.mk z := by
  apply (cokernelCoordinateEquiv f n).injective
  rw [LinearEquiv.apply_symm_apply]
  rfl

lemma affineTorsorComparison.cokernelCoordinateEquiv_eq_iff (f : A) (n : ℕ) [NeZero n]
    (z w : MuHopf A n ⊗[A] AffineRing f n) :
    (Submodule.Quotient.mk z : (MuHopf A n ⊗[A] AffineRing f n) ⧸
      LinearMap.range (affineTorsorComparison f n).toLinearMap) = Submodule.Quotient.mk w ↔
      cokernelResidue f n z = cokernelResidue f n w :=
  (cokernelCoordinateEquiv f n).injective.eq_iff.symm

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
  refine ⟨cokernelCoordinateEquiv f n, ?_⟩
  intro c p
  rw [cokernelCoordinateEquiv_mk, targetCoordinateEquiv_apply_sum]

theorem affineTorsorComparison.injective_iff (f : A) (n : ℕ) [NeZero n] :
    Function.Injective (affineTorsorComparison f n) ↔
      n = 1 ∨ Function.Injective (fun a : A => f * a) := by
  classical
  constructor
  · intro hi
    by_cases hn : n = 1
    · exact Or.inl hn
    · right
      intro a b hab
      have hpos := NeZero.pos n
      have htwo : 1 < n := by omega
      let p : Fin n × Fin n := (⟨1, htwo⟩, ⟨n - 1, by omega⟩)
      let c : (Fin n × Fin n) → A := Pi.single p (a - b)
      have hc : ∀ r : Fin n × Fin n,
          if r.1.val + r.2.val < n then c r = 0 else f * c r = 0 := by
        intro r
        by_cases hr : r = p
        · subst r
          have hw : ¬ p.1.val + p.2.val < n := by dsimp [p]; omega
          simpa [hw, c, mul_sub] using sub_eq_zero.mpr hab
        · simp [c, Pi.single_eq_of_ne hr]
      have hz : affineTorsorComparison f n ((sourceCoordinateEquiv f n).symm c) = 0 := by
        rw [sourceCoordinateEquiv_symm_apply]
        exact (kernel_coefficients f n c).mpr hc
      have hz' : (sourceCoordinateEquiv f n).symm c = 0 := hi (hz.trans (map_zero _).symm)
      have hcp := congrArg (fun z => sourceCoordinateEquiv f n z p) hz'
      have : a - b = 0 := by simpa [c] using hcp
      exact sub_eq_zero.mp this
  · intro h z w hzw
    let c := sourceCoordinateEquiv f n (z - w)
    have hz : affineTorsorComparison f n ((sourceCoordinateEquiv f n).symm c) = 0 := by
      simp only [c, LinearEquiv.symm_apply_apply, map_sub, hzw, sub_self]
    rw [sourceCoordinateEquiv_symm_apply] at hz
    have hc := (kernel_coefficients f n c).mp hz
    have hc0 : c = 0 := by
      ext p
      have hp := hc p
      rcases h with hn | hf
      · have hi : p.1.val = 0 := by have := p.1.isLt; omega
        have hj : p.2.val = 0 := by have := p.2.isLt; omega
        simpa [hi, hj, hn] using hp
      · split_ifs at hp with hwrap
        · exact hp
        · exact hf (hp.trans (mul_zero f).symm)
    have hzw0 : z - w = 0 := (sourceCoordinateEquiv f n).injective
      (by simpa only [c, map_zero] using hc0)
    exact sub_eq_zero.mp hzw0

theorem affineTorsorComparison.surjective_iff (f : A) (n : ℕ) [NeZero n] :
    Function.Surjective (affineTorsorComparison f n) ↔ n = 1 ∨ IsUnit f := by
  classical
  constructor
  · intro hs
    by_cases hn : n = 1
    · exact Or.inl hn
    · right
      have hpos := NeZero.pos n
      have htwo : 1 < n := by omega
      let q : Fin n × Fin n := (⟨1, htwo⟩, 0)
      let c : (Fin n × Fin n) → A := Pi.single q 1
      obtain ⟨z, hz⟩ := hs ((targetCoordinateEquiv f n).symm c)
      have hm : (∑ p : Fin n × Fin n, c p •
          (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
            (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) ∈
          LinearMap.range (affineTorsorComparison f n).toLinearMap := by
        rw [← targetCoordinateEquiv_symm_apply]
        exact ⟨z, hz⟩
      obtain ⟨a, ha⟩ := (image_coefficients f n c).mp hm q (by simp [q])
      apply isUnit_iff_exists_inv.mpr
      exact ⟨a, by simpa [c] using ha.symm⟩
  · intro h y
    let c := targetCoordinateEquiv f n y
    have hm : (∑ p : Fin n × Fin n, c p •
        (MonoidAlgebra.single (Multiplicative.ofAdd (p.1.val : ZMod n)) (1 : A) ⊗ₜ[A]
          (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f) ^ p.2.val))) ∈
        LinearMap.range (affineTorsorComparison f n).toLinearMap := by
      apply (image_coefficients f n c).mpr
      intro q hq
      rcases h with hn | hf
      · have hi : q.1.val = 0 := by have := q.1.isLt; omega
        have hj : q.2.val = 0 := by have := q.2.isLt; omega
        omega
      · obtain ⟨a, ha⟩ := hf.exists_right_inv
        exact ⟨a * c q, by rw [← mul_assoc, ha, one_mul]⟩
    rw [← targetCoordinateEquiv_symm_apply] at hm
    have hm' : y ∈ LinearMap.range (affineTorsorComparison f n).toLinearMap := by
      simpa only [c, LinearEquiv.symm_apply_apply] using hm
    obtain ⟨z, hz⟩ := hm'
    exact ⟨z, hz⟩

theorem affineTorsorComparison.bijective_iff (f : A) (n : ℕ) [NeZero n] :
    Function.Bijective (affineTorsorComparison f n) ↔ n = 1 ∨ IsUnit f := by
  constructor
  · intro h
    exact (surjective_iff f n).mp h.2
  · intro h
    refine ⟨(injective_iff f n).mpr ?_, (surjective_iff f n).mpr h⟩
    rcases h with hn | hf
    · exact Or.inl hn
    · right
      obtain ⟨v, rfl⟩ := hf
      intro a b hab
      have := congrArg (fun x : A => (↑v⁻¹ : A) * x) hab
      simpa [← mul_assoc] using this

/-- The inverse of the root on a specified unit chart. -/
lemma affineRoot.unit_mul_inverse (v : Aˣ) (n : ℕ) [NeZero n] :
    AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) *
      (algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) = 1 := by
  let x := AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A))
  calc
    _ = algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) * x ^ n := by
      change x * (_ * x ^ (n - 1)) = _
      rw [mul_left_comm, ← pow_succ', Nat.sub_add_cancel (by have := NeZero.ne n; omega)]
    _ = 1 := by rw [affineRoot.pow_eq, ← map_mul]; simp

/-- The actual comparison promoted to an algebra equivalence on the unit locus. -/
def affineTorsorComparison.unitEquiv (v : Aˣ) (n : ℕ) [NeZero n] :
    (AffineRing (v : A) n ⊗[A] AffineRing (v : A) n) ≃ₐ[A]
      (MuHopf A n ⊗[A] AffineRing (v : A) n) :=
  AlgEquiv.ofBijective (affineTorsorComparison (v : A) n)
    ((affineTorsorComparison.bijective_iff (v : A) n).mpr (Or.inr v.isUnit))

lemma affineTorsorComparison.unitEquiv_toAlgHom (v : Aˣ) (n : ℕ) [NeZero n] :
    (affineTorsorComparison.unitEquiv v n).toAlgHom =
      affineTorsorComparison (v : A) n := rfl

lemma affineTorsorComparison.unitEquiv_symm_character (v : Aˣ) (n : ℕ) [NeZero n] :
    (affineTorsorComparison.unitEquiv v n).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing (v : A) n)) =
      AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ⊗ₜ[A]
        (algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
          AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) := by
  apply (affineTorsorComparison.unitEquiv v n).symm_apply_eq.mpr
  simp only [unitEquiv, AlgEquiv.ofBijective_apply]
  rw [affineTorsorComparison.tmul, affineCoaction.root,
    Algebra.TensorProduct.tmul_mul_tmul, mul_one, affineRoot.unit_mul_inverse]

lemma affineTorsorComparison.unitEquiv_symm_right (v : Aˣ) (n : ℕ) [NeZero n]
    (b : AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm
      ((1 : MuHopf A n) ⊗ₜ[A] b) = (1 : AffineRing (v : A) n) ⊗ₜ[A] b := by
  apply (affineTorsorComparison.unitEquiv v n).symm_apply_eq.mpr
  simpa only [unitEquiv, AlgEquiv.ofBijective_apply] using
    (affineTorsorComparison.right_factor (v : A) n b).symm

/-- The inverse on every native character/right-factor tensor. -/
lemma affineTorsorComparison.unitEquiv_symm_character_tmul (v : Aˣ) (n : ℕ)
    [NeZero n] (i : ℕ) (b : AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) ⊗ₜ[A] b) =
      (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ i) ⊗ₜ[A]
        ((algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
          AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) ^ i * b) := by
  have hg : MonoidAlgebra.single (Multiplicative.ofAdd (i : ZMod n)) (1 : A) ⊗ₜ[A] b =
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing (v : A) n)) ^ i * ((1 : MuHopf A n) ⊗ₜ[A] b) := by
    simp only [Algebra.TensorProduct.tmul_pow, affineCharacter.pow, one_pow,
      Algebra.TensorProduct.tmul_mul_tmul, mul_one, one_mul]
  rw [hg, map_mul, map_pow, affineTorsorComparison.unitEquiv_symm_character,
    affineTorsorComparison.unitEquiv_symm_right, Algebra.TensorProduct.tmul_pow,
    Algebra.TensorProduct.tmul_mul_tmul, mul_one]

/-- The algebra equivalence is fixed by the original comparison and the
inverse image of the character generator. This includes characteristic
which divides n; no inverse of n occurs. -/
theorem affineTorsorComparison.unit_inverse (v : Aˣ) (n : ℕ) [NeZero n] :
    ∃ e : (AffineRing (v : A) n ⊗[A] AffineRing (v : A) n) ≃ₐ[A]
        (MuHopf A n ⊗[A] AffineRing (v : A) n),
      e.toAlgHom = affineTorsorComparison (v : A) n ∧
      e.symm (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod n)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing (v : A) n)) =
        AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ⊗ₜ[A]
          (algebraMap A (AffineRing (v : A) n) ((v⁻¹ : Aˣ) : A) *
            AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C (v : A)) ^ (n - 1)) ∧
      ∀ b : AffineRing (v : A) n,
        e.symm ((1 : MuHopf A n) ⊗ₜ[A] b) = (1 : AffineRing (v : A) n) ⊗ₜ[A] b := by
  refine ⟨affineTorsorComparison.unitEquiv v n, rfl,
    affineTorsorComparison.unitEquiv_symm_character v n, ?_⟩
  exact affineTorsorComparison.unitEquiv_symm_right v n

/-- Restrict the actual cyclic coefficient permutation to the killed columns. -/
def affineTorsorComparison.wrappingEquiv (n : ℕ) [NeZero n] :
    {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} ≃
      {q : Fin n × Fin n // q.2.val < q.1.val} :=
  (coefficientPermutation n).subtypeEquiv (fun p => (wrap_iff_lower n p).symm)

lemma affineTorsorComparison.wrappingEquiv_apply (n : ℕ) [NeZero n]
    (p : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val}) :
    (wrappingEquiv n p).val = coefficientPermutation n p.val := rfl

lemma affineTorsorComparison.wrappingEquiv_symm (n : ℕ) [NeZero n]
    (q : {q : Fin n × Fin n // q.2.val < q.1.val}) :
    ((wrappingEquiv n).symm q).val = (coefficientPermutation n).symm q.val := rfl

lemma affineTorsorComparison.wrappingEquiv_injective (n : ℕ) [NeZero n] :
    Function.Injective (wrappingEquiv n) := (wrappingEquiv n).injective

lemma affineTorsorComparison.lower_card (n : ℕ) :
    Fintype.card {q : Fin n × Fin n // q.2.val < q.1.val} =
      n * (n - 1) / 2 := by
  classical
  have h := Finset.card_product_filter_lt (s := (Finset.univ : Finset (Fin n)))
  rw [Fintype.card_subtype]
  have hs : (Finset.univ.filter (fun q : Fin n × Fin n => q.2.val < q.1.val)).card =
      (Finset.univ.filter (fun q : Fin n × Fin n => q.1 < q.2)).card := by
    exact Finset.card_equiv (Equiv.prodComm (Fin n) (Fin n)) (by simp)
  rw [hs]
  simpa [Nat.choose_two_right] using h

lemma affineTorsorComparison.wrapping_card (n : ℕ) [NeZero n] :
    Fintype.card {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} =
      n * (n - 1) / 2 :=
  (Fintype.card_congr (wrappingEquiv n)).trans (lower_card n)

lemma affineTorsorComparison.coefficientPermutation_rows (n : ℕ) [NeZero n] :
    coefficientPermutation n = Equiv.prodCongrRight (fun i : Fin n => finCycle i) := by
  ext p <;> simp [coefficientPermutation, finCycle, add_comm]

lemma affineTorsorComparison.coefficientPermutation_sign (n : ℕ) [NeZero n] :
    Equiv.Perm.sign (coefficientPermutation n) =
      (-1 : ℤˣ) ^ ((n - 1) * (n * (n - 1) / 2)) := by
  classical
  have hc (i : Fin n) : finCycle i = (finRotate n) ^ i.val := by
    apply Equiv.ext
    intro j
    rw [Equiv.Perm.coe_pow]
    exact congrFun finCycle_eq_finRotate_iterate j
  rw [coefficientPermutation_rows, Equiv.Perm.sign_prodCongrRight]
  simp_rw [hc, map_pow, sign_finRotate]
  simp_rw [← pow_mul]
  rw [Finset.prod_pow_eq_pow_sum]
  congr 1
  rw [Fin.sum_univ_eq_sum_range, ← Finset.mul_sum, Finset.sum_range_id]

lemma affineTorsorComparison.weight_exponent (n : ℕ) [NeZero n]
    (p : Fin n × Fin n) :
    (p.1.val + p.2.val) / n = if n ≤ p.1.val + p.2.val then 1 else 0 := by
  split_ifs with hp
  · simpa [Nat.div_eq_of_lt p.1.isLt, Nat.div_eq_of_lt p.2.isLt] using
      (Nat.add_div_eq_of_le_mod_add_mod (a := p.1.val) (b := p.2.val) (c := n)
        (by simpa only [Nat.mod_eq_of_lt p.1.isLt, Nat.mod_eq_of_lt p.2.isLt] using hp)
        (NeZero.pos n))
  · simpa [Nat.div_eq_of_lt p.1.isLt, Nat.div_eq_of_lt p.2.isLt] using
      (Nat.add_div_eq_of_add_mod_lt (a := p.1.val) (b := p.2.val) (c := n)
        (by simpa only [Nat.mod_eq_of_lt p.1.isLt, Nat.mod_eq_of_lt p.2.isLt] using
          (Nat.lt_of_not_ge hp)))

lemma affineTorsorComparison.weight_product (f : A) (n : ℕ) [NeZero n] :
    (∏ p : Fin n × Fin n, f ^ ((p.1.val + p.2.val) / n)) =
      f ^ (n * (n - 1) / 2) := by
  classical
  simp_rw [weight_exponent, apply_ite (fun k => f ^ k), pow_one, pow_zero]
  rw [← Finset.prod_filter, Finset.prod_const]
  congr 1
  rw [← Fintype.card_subtype, wrapping_card]

lemma affineTorsorComparison.matrix_reindex (f : A) (n : ℕ) [NeZero n] :
    let M : Matrix (Fin n × Fin n) (Fin n × Fin n) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % n
        then f ^ ((c.1.val + c.2.val) / n) else 0
    M = (Matrix.diagonal (fun c : Fin n × Fin n =>
      f ^ ((c.1.val + c.2.val) / n))).submatrix (coefficientPermutation n).symm id := by
  classical
  dsimp only
  ext r c
  simp only [Matrix.submatrix_apply, Matrix.diagonal_apply]
  have h : r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % n ↔
      (coefficientPermutation n).symm r = c := by
    rw [Equiv.symm_apply_eq]
    change r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % n ↔ r = (c.1, c.1 + c.2)
    simp only [Prod.ext_iff, Fin.ext_iff, Fin.val_add]
  by_cases hr : (coefficientPermutation n).symm r = c
  · simp [h, hr]
  · simp [h, hr]

theorem affineTorsorComparison.determinant (f : A) (n : ℕ) [NeZero n] :
    let M : Matrix (Fin n × Fin n) (Fin n × Fin n) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % n
        then f ^ ((c.1.val + c.2.val) / n) else 0
    Matrix.det M = (-1 : A) ^ ((n - 1) * (n * (n - 1) / 2)) *
      f ^ (n * (n - 1) / 2) := by
  classical
  dsimp only
  rw [matrix_reindex, Matrix.det_permute, Matrix.det_diagonal, weight_product,
    Equiv.Perm.sign_symm, coefficientPermutation_sign]
  simp only [Units.val_pow_eq_pow_val, Units.val_neg, Units.val_one, Int.cast_pow,
    Int.cast_neg, Int.cast_one]

-- affineTorsorComparison.coefficientPermutation_rows.test_wrap
example : affineTorsorComparison.coefficientPermutation 4 (3, 3) = (3, 2) := by
  decide
-- affineTorsorComparison.coefficientPermutation_sign.test_two
example : Equiv.Perm.sign (affineTorsorComparison.coefficientPermutation 2) = (-1 : ℤˣ) := by
  simpa using affineTorsorComparison.coefficientPermutation_sign 2
-- affineTorsorComparison.coefficientPermutation_sign.test_three
example : Equiv.Perm.sign (affineTorsorComparison.coefficientPermutation 3) = (1 : ℤˣ) := by
  apply Units.ext
  norm_num [affineTorsorComparison.coefficientPermutation_sign, Units.val_pow_eq_pow_val]
-- affineTorsorComparison.weight_exponent.test_wrap
example : ((1 : Fin 2).val + (1 : Fin 2).val) / 2 = 1 := by decide
-- affineTorsorComparison.weight_exponent.test_nonwrap
example : ((0 : Fin 2).val + (1 : Fin 2).val) / 2 = 0 := by decide
-- affineTorsorComparison.weight_product.test_nonunit
example : (∏ p : Fin 2 × Fin 2, (2 : ℤ) ^ ((p.1.val + p.2.val) / 2)) = 2 := by
  simpa using affineTorsorComparison.weight_product (2 : ℤ) 2
-- affineTorsorComparison.matrix_reindex.test_weight
example (f : A) :
    (let M : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 2
        then f ^ ((c.1.val + c.2.val) / 2) else 0
     M (1, 0) (1, 1)) = f := by
  norm_num
-- affineTorsorComparison.determinant.test_exponent_one
example (f : A) :
    (let M : Matrix (Fin 1 × Fin 1) (Fin 1 × Fin 1) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 1
        then f ^ ((c.1.val + c.2.val) / 1) else 0
     Matrix.det M) = 1 := by
  simpa using affineTorsorComparison.determinant f 1
-- affineTorsorComparison.determinant.test_three
example (f : A) :
    (let M : Matrix (Fin 3 × Fin 3) (Fin 3 × Fin 3) A :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 3
        then f ^ ((c.1.val + c.2.val) / 3) else 0
     Matrix.det M) = f ^ 3 := by
  have h := affineTorsorComparison.determinant f 3
  norm_num at h
  exact h
-- affineTorsorComparison.determinant.test_zero_ring
example :
    (let M : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) (ZMod 1) :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 2
        then (0 : ZMod 1) ^ ((c.1.val + c.2.val) / 2) else 0
     Matrix.det M) = 0 := by
  simpa using affineTorsorComparison.determinant (0 : ZMod 1) 2
-- affineTorsorComparison.determinant.test_wild
example :
    (let M : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) (ZMod 2) :=
      fun r c => if r.1 = c.1 ∧ r.2.val = (c.1.val + c.2.val) % 2
        then (1 : ZMod 2) ^ ((c.1.val + c.2.val) / 2) else 0
     Matrix.det M) = 1 := by
  simpa using affineTorsorComparison.determinant (1 : ZMod 2) 2

/-- At zero the specified native kernel coordinates have arbitrary A-values. -/
noncomputable def affineTorsorComparison.kernelZeroEquiv (n : ℕ) [NeZero n] :
    (LinearMap.ker (affineTorsorComparison (0 : A) n).toLinearMap) ≃ₗ[A]
      ({p : Fin n × Fin n // n ≤ p.1.val + p.2.val} → A) :=
  (kernelCoordinateEquiv (0 : A) n).trans
    (LinearEquiv.piCongrRight fun _ =>
      LinearEquiv.ofTop (LinearMap.ker ((0 : A) • (LinearMap.id : A →ₗ[A] A))) (by simp))

lemma affineTorsorComparison.kernelZeroEquiv_apply (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison (0 : A) n).toLinearMap)
    (p : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val}) :
    kernelZeroEquiv n z p = sourceCoordinateEquiv (0 : A) n z p.val := rfl

lemma affineTorsorComparison.kernelZeroEquiv_injective (n : ℕ) [NeZero n] :
    Function.Injective (kernelZeroEquiv (A := A) n) := (kernelZeroEquiv n).injective

lemma affineTorsorComparison.kernelZeroEquiv_symm_coordinates (n : ℕ) [NeZero n]
    (d : {p : Fin n × Fin n // n ≤ p.1.val + p.2.val} → A) (p : Fin n × Fin n) :
    sourceCoordinateEquiv (0 : A) n ((kernelZeroEquiv n).symm d :
      AffineRing (0 : A) n ⊗[A] AffineRing (0 : A) n) p =
      if hp : n ≤ p.1.val + p.2.val then d ⟨p, hp⟩ else 0 := by
  simpa [kernelZeroEquiv] using kernelCoordinateEquiv_symm_coordinates (0 : A) n
    ((LinearEquiv.piCongrRight fun _ =>
      LinearEquiv.ofTop (LinearMap.ker ((0 : A) • (LinearMap.id : A →ₗ[A] A)))
        (by simp)).symm d) p

lemma affineTorsorComparison.source_finrank (k : Type u) [Field k]
    (f : k) (n : ℕ) [NeZero n] :
    Module.finrank k (AffineRing f n ⊗[k] AffineRing f n) = n * n := by
  rw [(sourceCoordinateEquiv f n).finrank_eq, Module.finrank_pi]
  simp

lemma affineTorsorComparison.kernel_zero_finrank (k : Type u) [Field k]
    (n : ℕ) [NeZero n] :
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n - 1) / 2 := by
  rw [(kernelZeroEquiv (A := k) n).finrank_eq, Module.finrank_pi, wrapping_card]

lemma affineTorsorComparison.range_zero_finrank (k : Type u) [Field k]
    (n : ℕ) [NeZero n] :
    Module.finrank k (LinearMap.range (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n + 1) / 2 := by
  let : FiniteDimensional k (AffineRing (0 : k) n ⊗[k] AffineRing (0 : k) n) :=
    FiniteDimensional.of_injective (sourceCoordinateEquiv (0 : k) n).toLinearMap
      (sourceCoordinateEquiv (0 : k) n).injective
  have hr := LinearMap.finrank_range_add_finrank_ker
    (affineTorsorComparison (0 : k) n).toLinearMap
  rw [source_finrank, kernel_zero_finrank] at hr
  have hmul : n * (n + 1) = n * (n - 1) + 2 * n := by
    obtain ⟨m, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (NeZero.ne n)
    simp
    ring
  have hsquare : n * n = n * (n - 1) + n := by
    obtain ⟨m, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (NeZero.ne n)
    simp
    ring
  rw [hmul]
  rw [hsquare] at hr
  have heven := Nat.div_mul_cancel (Nat.two_dvd_mul_sub_one n)
  omega

/-- At the zero section over a field the loss of rank is exactly triangular. -/
theorem affineTorsorComparison.zero_rank (k : Type u) [Field k]
    (n : ℕ) [NeZero n] :
    Module.finrank k (LinearMap.range (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n + 1) / 2 ∧
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) n).toLinearMap) =
      n * (n - 1) / 2 := by
  exact ⟨range_zero_finrank k n, kernel_zero_finrank k n⟩

-- affineTorsorComparison.test_exponent_one: no unit condition on f.
example (f : A) : Function.Bijective (affineTorsorComparison f 1) := by
  exact (affineTorsorComparison.bijective_iff f 1).mpr (Or.inl rfl)

-- affineTorsorComparison.test_zero_ring: the usual zero-ring unit convention.
example [Subsingleton A] (f : A) (n : ℕ) [NeZero n] :
    Function.Bijective (affineTorsorComparison f n) := by
  apply (affineTorsorComparison.bijective_iff f n).mpr
  exact Or.inr (isUnit_iff_exists_inv.mpr ⟨0, Subsingleton.elim _ _⟩)

-- affineTorsorComparison.test_branch_kernel: an actual nonzero source tensor.
example (k : Type u) [Field k] :
    let x := AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k))
    x ⊗ₜ[k] x ≠ 0 ∧ affineTorsorComparison (0 : k) 2 (x ⊗ₜ[k] x) = 0 := by
  dsimp only
  constructor
  · intro hz
    have hc := congrArg (fun z => affineTorsorComparison.sourceCoordinateEquiv (0 : k) 2 z (1,1)) hz
    have hm := affineTorsorComparison.sourceCoordinateEquiv_monomial (0 : k) 2 (1,1)
    simp only [Fin.val_one, pow_one] at hm
    simp only [hm, map_zero, Pi.zero_apply, Pi.single_eq_same] at hc
    exact one_ne_zero hc
  · have hm := affineTorsorComparison.monomial (0 : k) 2 1 1
    norm_num at hm
    simpa using hm


-- affineTorsorComparison.test_regular_nonunit: injective does not mean torsor.
example : Function.Injective (affineTorsorComparison (2 : ℤ) 2) ∧
    ¬ Function.Surjective (affineTorsorComparison (2 : ℤ) 2) := by
  constructor
  · apply (affineTorsorComparison.injective_iff (2 : ℤ) 2).mpr
    right
    change Function.Injective (fun a : ℤ => (2 : ℤ) * a)
    intro a b h
    exact mul_left_cancel₀ (by decide : (2 : ℤ) ≠ 0) h
  · rw [affineTorsorComparison.surjective_iff]
    simp only [show ¬ (2 : ℕ) = 1 by decide, false_or]
    intro hf
    obtain ⟨a, ha⟩ := hf.exists_right_inv
    omega

-- affineTorsorComparison.test_nilpotent_parameter: nonzero f is not enough.
example :
    let x := AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4))
    let z := (2 : ZMod 4) • (x ⊗ₜ[ZMod 4] x)
    z ≠ 0 ∧ affineTorsorComparison (2 : ZMod 4) 2 z = 0 := by
  dsimp only
  constructor
  · intro hz
    have hc := congrArg (fun z => affineTorsorComparison.sourceCoordinateEquiv (2 : ZMod 4) 2 z (1,1)) hz
    have hm := affineTorsorComparison.sourceCoordinateEquiv_monomial (2 : ZMod 4) 2 (1,1)
    simp only [Fin.val_one, pow_one] at hm
    simp only [map_smul, hm, map_zero, Pi.zero_apply, Pi.smul_apply,
      Pi.single_eq_same, smul_eq_mul, mul_one] at hc
    exact (by decide : (2 : ZMod 4) ≠ 0) hc
  · rw [map_smul]
    have hm := affineTorsorComparison.monomial (2 : ZMod 4) 2 1 1
    norm_num at hm
    rw [hm]
    change (2 : ZMod 4) • ((2 : ZMod 4) • _) = 0
    rw [smul_smul, show (2 : ZMod 4) * 2 = 0 by decide, zero_smul]

-- affineTorsorComparison.test_wild_unit: the chart is a torsor despite its
-- nonzero nilpotent and despite 2 not being invertible in the base field.
example :
    let x := AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 2))
    Function.Bijective (affineTorsorComparison (1 : ZMod 2) 2) ∧
      x - 1 ≠ 0 ∧ (x - 1) ^ 2 = 0 := by
  dsimp only
  refine ⟨(affineTorsorComparison.bijective_iff (1 : ZMod 2) 2).mpr
    (Or.inr isUnit_one), ?_, ?_⟩
  · intro hz
    have hx := sub_eq_zero.mp hz
    have hc := congrArg (fun z => affineTorsorComparison.sourceCoordinateEquiv (1 : ZMod 2) 2
      (z ⊗ₜ[ZMod 2] (1 : AffineRing (1 : ZMod 2) 2)) (1,0)) hx
    have h1 := affineTorsorComparison.sourceCoordinateEquiv_monomial (1 : ZMod 2) 2 (1,0)
    have h0 := affineTorsorComparison.sourceCoordinateEquiv_monomial (1 : ZMod 2) 2 (0,0)
    norm_num at h1 h0
    rw [h1,h0] at hc
    norm_num [Pi.single_apply] at hc
  · have ht := affineRoot.pow_eq (1 : ZMod 2) 2
    simp only [map_one] at ht
    have htwo : (2 : AffineRing (1 : ZMod 2) 2) = 0 := by
      have h := congrArg (algebraMap (ZMod 2) (AffineRing (1 : ZMod 2) 2))
        (by decide : (2 : ZMod 2) = 0)
      rw [map_ofNat, map_zero] at h
      exact h
    rw [sub_sq,ht,htwo]
    simp
    have h := congrArg (algebraMap (ZMod 2) (AffineRing (1 : ZMod 2) 2))
      (by decide : (1 : ZMod 2) + 1 = 0)
    simpa using h


-- affineTorsorComparison.test_nonflat_kernel: coordinate maps base change,
-- but their kernels need not commute with the nonflat coefficient change Z→F2.
example : Function.Injective (affineTorsorComparison (2 : ℤ) 2) ∧
    ¬ Function.Injective (affineTorsorComparison (0 : ZMod 2) 2) := by
  constructor
  · apply (affineTorsorComparison.injective_iff (2 : ℤ) 2).mpr
    right
    intro a b h
    exact mul_left_cancel₀ (by decide : (2 : ℤ) ≠ 0) h
  · rw [affineTorsorComparison.injective_iff]
    simp only [show ¬ (2 : ℕ) = 1 by decide, false_or]
    intro hi
    have h := hi (show (0 : ZMod 2) * 0 = 0 * 1 by simp)
    exact zero_ne_one h


-- affineTorsorComparison.test_cokernel_nonreduced: retain A/(f), not
-- its reduction. The quotient for f=4 over Z/8 has an element of order four.
example :
    let C := ((MuHopf (ZMod 8) 2 ⊗[ZMod 8] AffineRing (4 : ZMod 8) 2) ⧸
      LinearMap.range (affineTorsorComparison (4 : ZMod 8) 2).toLinearMap)
    Nonempty (C ≃ₗ[ZMod 8]
      ((ZMod 8) ⧸ (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8))))) ∧
      ∃ z : C, (2 : ZMod 8) • z ≠ 0 ∧ (4 : ZMod 8) • z = 0 := by
  dsimp only
  let L := {p : Fin 2 × Fin 2 // p.2.val < p.1.val}
  let : Unique L :=
    { default := ⟨(1,0), by decide⟩
      uniq := by
        intro p
        apply Subtype.ext
        apply Prod.ext
        · apply Fin.ext
          have := p.val.1.isLt
          have := p.val.2.isLt
          have := p.property
          dsimp only at *
          omega
        · apply Fin.ext
          have := p.val.1.isLt
          have := p.val.2.isLt
          have := p.property
          dsimp only at *
          omega }
  constructor
  · exact ⟨(affineTorsorComparison.cokernelCoordinateEquiv (4 : ZMod 8) 2).trans
      (LinearEquiv.funUnique L (ZMod 8)
        ((ZMod 8) ⧸ (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8)))))⟩
  · refine ⟨Submodule.Quotient.mk
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 8) ⊗ₜ[ZMod 8]
        (1 : AffineRing (4 : ZMod 8) 2)), ?_⟩
    let b := MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 8) ⊗ₜ[ZMod 8]
      (1 : AffineRing (4 : ZMod 8) 2)
    have hm : affineTorsorComparison.targetCoordinateEquiv (4 : ZMod 8) 2 b =
        Pi.single (1,0) 1 := by
      simpa only [b, Fin.val_one, Fin.val_zero, Nat.cast_zero, Nat.cast_one, pow_zero] using
        affineTorsorComparison.targetCoordinateEquiv_monomial (4 : ZMod 8) 2 (1,0)
    constructor
    · intro hz
      have he := congrArg (fun z => affineTorsorComparison.cokernelCoordinateEquiv (4 : ZMod 8) 2 z
        ⟨(1,0), by decide⟩) hz
      rw [map_smul, map_zero, Pi.smul_apply, Pi.zero_apply] at he
      rw [affineTorsorComparison.cokernelCoordinateEquiv_mk, hm, Pi.single_eq_same] at he
      change Ideal.Quotient.mk (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8))) 2 = 0 at he
      obtain ⟨a, ha⟩ := Ideal.mem_span_singleton'.mp (Ideal.Quotient.eq_zero_iff_mem.mp he)
      exact (by decide : ∀ a : ZMod 8, a * 4 ≠ 2) a ha
    · apply (affineTorsorComparison.cokernelCoordinateEquiv (4 : ZMod 8) 2).injective
      funext p
      rw [map_smul, map_zero, Pi.smul_apply, Pi.zero_apply]
      rw [affineTorsorComparison.cokernelCoordinateEquiv_mk, hm]
      change (4 : ZMod 8) • Ideal.Quotient.mk (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8)))
        ((Pi.single (1,0) (1 : ZMod 8) : (Fin 2 × Fin 2) → ZMod 8) p.val) = 0
      by_cases hp : p.val = (1,0)
      · rw [hp, Pi.single_eq_same]
        change Ideal.Quotient.mk (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8))) 4 = 0
        exact Ideal.Quotient.eq_zero_iff_mem.mpr (Ideal.mem_span_singleton_self _)
      · simp [Pi.single_eq_of_ne hp]


end AffineTorsorComparison
#print axioms affineTorsorComparison.coefficientPermutation_rows
#print axioms affineTorsorComparison.coefficientPermutation_sign
#print axioms affineTorsorComparison.weight_exponent
#print axioms affineTorsorComparison.weight_product
#print axioms affineTorsorComparison.matrix_reindex
#print axioms affineTorsorComparison.determinant

end TauCeti.RootStack

/-! Module quotient acceptance computations. -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct

-- affineTorsorComparison.kernelCoordinateEquiv.test_one
example (f : A) (z : LinearMap.ker (affineTorsorComparison f 1).toLinearMap) : z = 0 := by
  apply (affineTorsorComparison.kernelCoordinateEquiv f 1).injective
  funext p
  have h0 := p.val.1.isLt
  have h1 := p.val.2.isLt
  have h2 := p.property
  omega

-- affineTorsorComparison.kernelCoordinateEquiv.test_nonreduced
example :
    let d : {p : Fin 2 × Fin 2 // 2 ≤ p.1.val + p.2.val} →
      LinearMap.ker ((2 : ZMod 4) • (LinearMap.id : ZMod 4 →ₗ[ZMod 4] ZMod 4)) :=
      fun _ => ⟨2, by change (2 : ZMod 4) * 2 = 0; decide⟩
    let z := (affineTorsorComparison.kernelCoordinateEquiv (2 : ZMod 4) 2).symm d
    (z : AffineRing (2 : ZMod 4) 2 ⊗[ZMod 4] AffineRing (2 : ZMod 4) 2) ≠ 0 ∧
      affineTorsorComparison.sourceCoordinateEquiv (2 : ZMod 4) 2 z (1,1) = 2 := by
  dsimp only
  have hc := affineTorsorComparison.kernelCoordinateEquiv_symm_coordinates (2 : ZMod 4) 2
    (fun _ => ⟨2, by change (2 : ZMod 4) * 2 = 0; decide⟩) (1,1)
  have he : affineTorsorComparison.sourceCoordinateEquiv (2 : ZMod 4) 2
      ((affineTorsorComparison.kernelCoordinateEquiv (2 : ZMod 4) 2).symm
        (fun _ => ⟨2, by change (2 : ZMod 4) * 2 = 0; decide⟩)) (1,1) = 2 := by simpa using hc
  refine ⟨?_, he⟩
  intro hz
  rw [hz, map_zero] at he
  exact (by decide : (0 : ZMod 4) ≠ 2) he

-- affineTorsorComparison.kernelCoordinateEquiv.test_branch
example (k : Type u) [Field k] :
    let d : {p : Fin 2 × Fin 2 // 2 ≤ p.1.val + p.2.val} →
      LinearMap.ker ((0 : k) • (LinearMap.id : k →ₗ[k] k)) :=
      fun _ => ⟨1, by simp⟩
    affineTorsorComparison.sourceCoordinateEquiv (0 : k) 2
      ((affineTorsorComparison.kernelCoordinateEquiv (0 : k) 2).symm d) (1,1) = 1 := by
  dsimp only
  simpa using affineTorsorComparison.kernelCoordinateEquiv_symm_coordinates (0 : k) 2
    (fun _ => ⟨1, by simp⟩) (1,1)

-- affineTorsorComparison.cokernelResidue.test_one
example (f : A) (z : MuHopf A 1 ⊗[A] AffineRing f 1) :
    affineTorsorComparison.cokernelResidue f 1 z = 0 := by
  funext p
  have h0 := p.val.1.isLt
  have h1 := p.val.2.isLt
  have h2 := p.property
  omega

-- affineTorsorComparison.cokernelResidue.test_upper
example (f : A) :
    affineTorsorComparison.cokernelResidue f 2
      (MonoidAlgebra.single (Multiplicative.ofAdd (0 : ZMod 2)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing f 2)) = 0 := by
  funext p
  rw [affineTorsorComparison.cokernelResidue_apply]
  have hm := affineTorsorComparison.targetCoordinateEquiv_monomial f 2 (0,0)
  simp only [Fin.val_zero, Nat.cast_zero, pow_zero] at hm
  rw [hm]
  have hp : p.val ≠ (0,0) := by
    intro h
    have := p.property
    simp only [h, Fin.val_zero, lt_self_iff_false] at this
  simp only [Pi.single_eq_of_ne hp, map_zero, Pi.zero_apply]

-- affineTorsorComparison.cokernelResidue.test_lower
example (f : A) :
    affineTorsorComparison.cokernelResidue f 2
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing f 2)) ⟨(1,0), by decide⟩ =
      Ideal.Quotient.mk (Ideal.span ({f} : Set A)) 1 := by
  rw [affineTorsorComparison.cokernelResidue_apply]
  have hm := affineTorsorComparison.targetCoordinateEquiv_monomial f 2 (1,0)
  simp only [Fin.val_one, Fin.val_zero, Nat.cast_one, pow_zero] at hm
  rw [hm]
  simp only [Pi.single_eq_same]

-- affineTorsorComparison.cokernelCoordinateEquiv.test_one
example (f : A) (z : (MuHopf A 1 ⊗[A] AffineRing f 1) ⧸
    LinearMap.range (affineTorsorComparison f 1).toLinearMap) : z = 0 := by
  apply (affineTorsorComparison.cokernelCoordinateEquiv f 1).injective
  funext p
  have h0 := p.val.1.isLt
  have h1 := p.val.2.isLt
  have h2 := p.property
  omega

-- affineTorsorComparison.cokernelCoordinateEquiv.test_regular_nonunit
example :
    let z := (Submodule.Quotient.mk
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ℤ) ⊗ₜ[ℤ]
        (1 : AffineRing (2 : ℤ) 2)) :
      (MuHopf ℤ 2 ⊗[ℤ] AffineRing (2 : ℤ) 2) ⧸
        LinearMap.range (affineTorsorComparison (2 : ℤ) 2).toLinearMap)
    z ≠ 0 := by
  dsimp only
  intro hz
  have he := congrArg (fun z => affineTorsorComparison.cokernelCoordinateEquiv (2 : ℤ) 2 z
    ⟨(1,0), by decide⟩) hz
  rw [affineTorsorComparison.cokernelCoordinateEquiv_mk, map_zero] at he
  have hm := affineTorsorComparison.targetCoordinateEquiv_monomial (2 : ℤ) 2 (1,0)
  simp only [Fin.val_one, Fin.val_zero, Nat.cast_one, pow_zero] at hm
  rw [hm, Pi.single_eq_same] at he
  obtain ⟨a, ha⟩ := Ideal.mem_span_singleton'.mp (Ideal.Quotient.eq_zero_iff_mem.mp he)
  omega

-- affineTorsorComparison.cokernelCoordinateEquiv.test_nonreduced
example :
    let z := (Submodule.Quotient.mk
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 8) ⊗ₜ[ZMod 8]
        (1 : AffineRing (4 : ZMod 8) 2)) :
      (MuHopf (ZMod 8) 2 ⊗[ZMod 8] AffineRing (4 : ZMod 8) 2) ⧸
        LinearMap.range (affineTorsorComparison (4 : ZMod 8) 2).toLinearMap)
    (2 : ZMod 8) • z ≠ 0 ∧ (4 : ZMod 8) • z = 0 := by
  dsimp only
  let b := MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 8) ⊗ₜ[ZMod 8]
    (1 : AffineRing (4 : ZMod 8) 2)
  have hm : affineTorsorComparison.targetCoordinateEquiv (4 : ZMod 8) 2 b =
      Pi.single (1,0) 1 := by
    simpa only [b, Fin.val_one, Fin.val_zero, Nat.cast_zero, Nat.cast_one, pow_zero] using
      affineTorsorComparison.targetCoordinateEquiv_monomial (4 : ZMod 8) 2 (1,0)
  constructor
  · intro hz
    have he := congrArg (fun z => affineTorsorComparison.cokernelCoordinateEquiv (4 : ZMod 8) 2 z
      ⟨(1,0), by decide⟩) hz
    rw [map_smul, map_zero, Pi.smul_apply, Pi.zero_apply] at he
    rw [affineTorsorComparison.cokernelCoordinateEquiv_mk, hm, Pi.single_eq_same] at he
    change Ideal.Quotient.mk (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8))) 2 = 0 at he
    obtain ⟨a, ha⟩ := Ideal.mem_span_singleton'.mp (Ideal.Quotient.eq_zero_iff_mem.mp he)
    exact (by decide : ∀ a : ZMod 8, a * 4 ≠ 2) a ha
  · apply (affineTorsorComparison.cokernelCoordinateEquiv (4 : ZMod 8) 2).injective
    funext p
    rw [map_smul, map_zero, Pi.smul_apply, Pi.zero_apply]
    rw [affineTorsorComparison.cokernelCoordinateEquiv_mk, hm]
    change (4 : ZMod 8) • Ideal.Quotient.mk (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8)))
      ((Pi.single (1,0) (1 : ZMod 8) : (Fin 2 × Fin 2) → ZMod 8) p.val) = 0
    by_cases hp : p.val = (1,0)
    · rw [hp, Pi.single_eq_same]
      change Ideal.Quotient.mk (Ideal.span ({(4 : ZMod 8)} : Set (ZMod 8))) 4 = 0
      exact Ideal.Quotient.eq_zero_iff_mem.mpr (Ideal.mem_span_singleton_self _)
    · simp [Pi.single_eq_of_ne hp]


end TauCeti.RootStack

-- Native acceptance computations for the coaction proof continuation.
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct
-- TauCeti.RootStack.affineRoot.pow_eq.test_wild_branch
example : AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : ZMod 2)) ^ 2 = 0 := by
  simpa using affineRoot.pow_eq (0 : ZMod 2) 2
-- TauCeti.RootStack.affineRoot.pow_eq.test_regular_nonunit
example : AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ℤ)) ^ 4 =
    algebraMap ℤ (AffineRing (2 : ℤ) 2) 4 := by
  rw [show 4 = 2 * 2 by decide, pow_mul, affineRoot.pow_eq, ← map_pow]
  norm_num
-- TauCeti.RootStack.affineRoot.pow_reduce.test_nilpotent
example : AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 4)) ^ 4 = 0 := by
  have h : (2 : ZMod 4) ^ 2 = 0 := by decide
  simpa [h] using affineRoot.pow_reduce (2 : ZMod 4) 2 4
-- TauCeti.RootStack.affineCharacter.pow.test_wild_order
example : (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 2)) ^ 2 = 1 := by
  rw [affineCharacter.pow]
  simp only [ZMod.natCast_self, ofAdd_zero, ← MonoidAlgebra.one_def]
-- TauCeti.RootStack.affineTorsorComparison.test_branch_image
example (f : A) :
    affineTorsorComparison f 2
      (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f) ⊗ₜ[A]
        AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      f • (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing f 2)) := by
  simpa using affineTorsorComparison.monomial f 2 (1 : Fin 2) (1 : Fin 2)
end TauCeti.RootStack

#print axioms TauCeti.RootStack.affineTorsorComparison.kernel_coordinate_condition
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv_apply
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv_symm_coordinates
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv_nonwrap
#print axioms TauCeti.RootStack.affineTorsorComparison.kernel_equiv
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelResidue
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelResidue_apply
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelResidue_surjective
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelResidue_ker
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv_mk
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv_symm_residue
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv_eq_iff
#print axioms TauCeti.RootStack.affineTorsorComparison.cokernel_equiv

/-! Unit chart acceptance computations. -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_one
example (v : Aˣ) :
    (affineTorsorComparison.unitEquiv v 1).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 1)) (1 : A) ⊗ₜ[A]
        (1 : AffineRing (v : A) 1)) = 1 := by
  have hg : (1 : ZMod 1) = 0 := Subsingleton.elim _ _
  rw [hg, ofAdd_zero, ← MonoidAlgebra.one_def, ← Algebra.TensorProduct.one_def]
  exact (affineTorsorComparison.unitEquiv v 1).symm.map_one

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_wild
example :
    (affineTorsorComparison.unitEquiv (1 : (ZMod 2)ˣ) 2).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 2) ⊗ₜ[ZMod 2]
        (1 : AffineRing (1 : ZMod 2) 2)) =
      AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 2)) ⊗ₜ[ZMod 2]
        AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 2)) := by
  simpa using affineTorsorComparison.unitEquiv_symm_character (1 : (ZMod 2)ˣ) 2

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_coefficient
example :
    let v : (ZMod 5)ˣ := ⟨2,3,by decide,by decide⟩
    (affineTorsorComparison.unitEquiv v 2).symm
      (MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod 2)) (1 : ZMod 5) ⊗ₜ[ZMod 5]
        (1 : AffineRing (2 : ZMod 5) 2)) =
      AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 5)) ⊗ₜ[ZMod 5]
        (algebraMap (ZMod 5) (AffineRing (2 : ZMod 5) 2) 3 *
          AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (2 : ZMod 5))) := by
  dsimp only
  have h := affineTorsorComparison.unitEquiv_symm_character
    (⟨2,3,by decide,by decide⟩ : (ZMod 5)ˣ) 2
  change _ = _ ⊗ₜ[ZMod 5] (algebraMap (ZMod 5) (AffineRing (2 : ZMod 5) 2) 3 * _ ^ (2 - 1)) at h
  simp only [Nat.reduceSub, pow_one] at h
  exact h

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_zero_ring
example [Subsingleton A] (v : Aˣ) (n : ℕ) [NeZero n]
    (z : MuHopf A n ⊗[A] AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm z = 0 := by
  let : Subsingleton (AffineRing (v : A) n ⊗[A] AffineRing (v : A) n) := Module.subsingleton A _
  exact Subsingleton.elim _ _

-- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_right_factor
example (v : Aˣ) (n : ℕ) [NeZero n] (b : AffineRing (v : A) n) :
    (affineTorsorComparison.unitEquiv v n).symm
      ((1 : MuHopf A n) ⊗ₜ[A] b) = (1 : AffineRing (v : A) n) ⊗ₜ[A] b := by
  exact affineTorsorComparison.unitEquiv_symm_right v n b

end TauCeti.RootStack

#print axioms TauCeti.RootStack.affineRoot.unit_mul_inverse
#print axioms TauCeti.RootStack.affineTorsorComparison.unitEquiv
#print axioms TauCeti.RootStack.affineTorsorComparison.unitEquiv_toAlgHom
#print axioms TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_character
#print axioms TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_right
#print axioms TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_character_tmul
#print axioms TauCeti.RootStack.affineTorsorComparison.unit_inverse

/-! Zero-section rank acceptance computations. -/
namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open scoped TensorProduct

-- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_one
example : Fintype.card {p : Fin 1 × Fin 1 // 1 ≤ p.1.val + p.2.val} = 0 := by
  rw [affineTorsorComparison.wrapping_card]
-- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_two
example : (affineTorsorComparison.wrappingEquiv 2 ⟨(1,1), by decide⟩).val = (1,0) := rfl
-- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_inverse
example : ((affineTorsorComparison.wrappingEquiv 3).symm ⟨(2,0), by decide⟩).val = (2,1) := rfl
-- TauCeti.RootStack.affineTorsorComparison.lower_card.test_zero
example : Fintype.card {q : Fin 0 × Fin 0 // q.2.val < q.1.val} = 0 := by
  rw [affineTorsorComparison.lower_card]
-- TauCeti.RootStack.affineTorsorComparison.lower_card.test_three
example : Fintype.card {q : Fin 3 × Fin 3 // q.2.val < q.1.val} = 3 := by
  simpa using affineTorsorComparison.lower_card 3
-- TauCeti.RootStack.affineTorsorComparison.wrapping_card.test_three
example : Fintype.card {p : Fin 3 × Fin 3 // 3 ≤ p.1.val + p.2.val} = 3 := by
  simpa using affineTorsorComparison.wrapping_card 3

-- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_one
example (z : LinearMap.ker (affineTorsorComparison (0 : A) 1).toLinearMap) : z = 0 := by
  apply (affineTorsorComparison.kernelZeroEquiv 1).injective
  ext p
  have h := p.property
  have h₁ := p.val.1.isLt
  have h₂ := p.val.2.isLt
  omega
-- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_nonreduced
example :
    let d : {p : Fin 2 × Fin 2 // 2 ≤ p.1.val + p.2.val} → ZMod 4 := fun _ => 2
    let z := (affineTorsorComparison.kernelZeroEquiv 2).symm d
    affineTorsorComparison.sourceCoordinateEquiv (0 : ZMod 4) 2 z (1,1) = 2 ∧
      affineTorsorComparison.sourceCoordinateEquiv (0 : ZMod 4) 2 z (0,0) = 0 := by
  dsimp only
  constructor <;> rw [affineTorsorComparison.kernelZeroEquiv_symm_coordinates] <;> decide
-- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_zero_ring
example (n : ℕ) [NeZero n]
    (z : LinearMap.ker (affineTorsorComparison (0 : ZMod 1) n).toLinearMap) :
    affineTorsorComparison.kernelZeroEquiv n z = 0 := Subsingleton.elim _ _
-- TauCeti.RootStack.affineTorsorComparison.source_finrank.test_two
example (k : Type u) [Field k] (f : k) :
    Module.finrank k (AffineRing f 2 ⊗[k] AffineRing f 2) = 4 := by
  simpa using affineTorsorComparison.source_finrank k f 2
-- TauCeti.RootStack.affineTorsorComparison.kernel_zero_finrank.test_one
example (k : Type u) [Field k] :
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) 1).toLinearMap) = 0 := by
  simpa using affineTorsorComparison.kernel_zero_finrank k 1
-- TauCeti.RootStack.affineTorsorComparison.range_zero_finrank.test_wild
section
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩
example :
    Module.finrank (ZMod 3) (LinearMap.range (affineTorsorComparison (0 : ZMod 3) 3).toLinearMap) = 6 := by
  simpa using affineTorsorComparison.range_zero_finrank (ZMod 3) 3
end
-- TauCeti.RootStack.affineTorsorComparison.zero_rank.test_two
example (k : Type u) [Field k] :
    Module.finrank k (LinearMap.range (affineTorsorComparison (0 : k) 2).toLinearMap) = 3 ∧
    Module.finrank k (LinearMap.ker (affineTorsorComparison (0 : k) 2).toLinearMap) = 1 := by
  simpa using affineTorsorComparison.zero_rank k 2
-- TauCeti.RootStack.affineTorsorComparison.zero_rank.test_four
example :
    Module.finrank ℚ (LinearMap.range (affineTorsorComparison (0 : ℚ) 4).toLinearMap) = 10 ∧
    Module.finrank ℚ (LinearMap.ker (affineTorsorComparison (0 : ℚ) 4).toLinearMap) = 6 := by
  simpa using affineTorsorComparison.zero_rank ℚ 4
end TauCeti.RootStack

#print axioms TauCeti.RootStack.affineTorsorComparison.wrappingEquiv
#print axioms TauCeti.RootStack.affineTorsorComparison.wrappingEquiv_apply
#print axioms TauCeti.RootStack.affineTorsorComparison.wrappingEquiv_symm
#print axioms TauCeti.RootStack.affineTorsorComparison.wrappingEquiv_injective
#print axioms TauCeti.RootStack.affineTorsorComparison.lower_card
#print axioms TauCeti.RootStack.affineTorsorComparison.wrapping_card
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_apply
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_injective
#print axioms TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_symm_coordinates
#print axioms TauCeti.RootStack.affineTorsorComparison.source_finrank
#print axioms TauCeti.RootStack.affineTorsorComparison.kernel_zero_finrank
#print axioms TauCeti.RootStack.affineTorsorComparison.range_zero_finrank
#print axioms TauCeti.RootStack.affineTorsorComparison.zero_rank

namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open Module AlgebraicGeometry

def affineTransition (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    AffineRing f n →ₐ[A] AffineRing f (n * m) :=
  AdjoinRoot.liftAlgHom _ (Algebra.ofId A _) (AdjoinRoot.root _ ^ m) (by
    simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
      Polynomial.eval₂_C]
    change (AdjoinRoot.root _ ^ m) ^ n - algebraMap A _ f = 0
    rw [← pow_mul, Nat.mul_comm m n, affineRoot.pow_eq, sub_self])

lemma affineTransition.root (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineTransition f n m (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ m := by
  simp [affineTransition]

local instance affineTransition.coefficientAlgebra (f : A) (n m : ℕ)
    [NeZero n] [NeZero m] : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
  (affineTransition f n m).toRingHom.toAlgebra

lemma affineTransition.constant (f a : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineTransition f n m (algebraMap A (AffineRing f n) a) =
      algebraMap A (AffineRing f (n * m)) a :=
  (affineTransition f n m).commutes a

lemma affineTransition.unique (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (j : AffineRing f n →ₐ[A] AffineRing f (n * m))
    (hj : j (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ m) :
    j = affineTransition f n m :=
  AdjoinRoot.algHom_ext (hj.trans (affineTransition.root f n m).symm)

lemma affineTransition.comp (f : A) (n m k : ℕ)
    [NeZero n] [NeZero m] [NeZero k] :
    (affineTransition f (n * m) k).comp (affineTransition f n m) =
      (AdjoinRoot.algEquivOfEq A
        (Polynomial.X ^ (n * (m*k)) - Polynomial.C f)
        (Polynomial.X ^ ((n*m) * k) - Polynomial.C f)
        (by rw [Nat.mul_assoc])).toAlgHom.comp (affineTransition f n (m*k)) := by
  apply AdjoinRoot.algHom_ext
  simp only [AlgHom.comp_apply, affineTransition.root, map_pow,
    AlgEquiv.coe_toAlgHom, AdjoinRoot.algEquivOfEq_root, ← pow_mul]
  rw [Nat.mul_comm k m]

abbrev affineIteratedRing (f : A) (n m : ℕ) :=
  AdjoinRoot (Polynomial.X ^ m -
    Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)))

def affineIteratedReverse (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    AffineRing f (n * m) →ₐ[A] affineIteratedRing f n m :=
  AdjoinRoot.liftAlgHom _ (Algebra.ofId A _) (AdjoinRoot.root _) (by
    simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
      Polynomial.eval₂_C]
    rw [Nat.mul_comm n m, pow_mul, affineRoot.pow_eq, ← map_pow,
      affineRoot.pow_eq]
    rw [← IsScalarTower.algebraMap_apply A (AffineRing f n) (affineIteratedRing f n m)]
    exact sub_self _)

lemma affineIteratedReverse.root (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineIteratedReverse f n m (AdjoinRoot.root (Polynomial.X ^ (n*m) - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ m -
        Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f))) := by
  simp [affineIteratedReverse]

lemma affineIteratedReverse.constant (f a : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineIteratedReverse f n m (algebraMap A (AffineRing f (n*m)) a) =
      algebraMap A (affineIteratedRing f n m) a :=
  (affineIteratedReverse f n m).commutes a

lemma affineIteratedReverse.coefficient (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f n) :
    affineIteratedReverse f n m (affineTransition f n m b) =
      algebraMap (AffineRing f n) (affineIteratedRing f n m) b := by
  have h : (affineIteratedReverse f n m).comp (affineTransition f n m) =
      AdjoinRoot.ofAlgHom A (Polynomial.X ^ m -
        Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f))) := by
    apply AdjoinRoot.algHom_ext
    simp only [AlgHom.comp_apply, affineTransition.root, map_pow, affineIteratedReverse.root]
    exact affineRoot.pow_eq _ _
  exact congrArg (fun j => j b) h

def affineTransitionIterated (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    (letI : Algebra (AffineRing f n) (AffineRing f (n * m)) :=
       (affineTransition f n m).toRingHom.toAlgebra;
     AdjoinRoot (Polynomial.X ^ m -
       Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f))) ≃ₐ[AffineRing f n]
       AffineRing f (n * m)) := by
  letI : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
    (affineTransition f n m).toRingHom.toAlgebra
  let forward : affineIteratedRing f n m →ₐ[AffineRing f n] AffineRing f (n*m) :=
    AdjoinRoot.liftAlgHom _ (Algebra.ofId (AffineRing f n) _) (AdjoinRoot.root _) (by
      simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
        Polynomial.eval₂_C]
      change _ - affineTransition f n m (AdjoinRoot.root _) = 0
      rw [affineTransition.root, sub_self])
  let reverse : AffineRing f (n*m) →ₐ[AffineRing f n] affineIteratedRing f n m :=
    { (affineIteratedReverse f n m).toRingHom with
      commutes' := affineIteratedReverse.coefficient f n m }
  refine AlgEquiv.ofAlgHom forward reverse ?_ ?_
  · apply AlgHom.coe_ringHom_injective
    apply AdjoinRoot.ringHom_ext
    · ext a
      change forward (affineIteratedReverse f n m (algebraMap A _ a)) = _
      rw [(affineIteratedReverse f n m).commutes,
        IsScalarTower.algebraMap_apply A (AffineRing f n) (affineIteratedRing f n m),
        forward.commutes]
      exact affineTransition.constant f a n m
    · change forward (affineIteratedReverse f n m (AdjoinRoot.root _)) = _
      rw [affineIteratedReverse.root]
      simp [forward]
  · apply AdjoinRoot.algHom_ext
    change affineIteratedReverse f n m (forward (AdjoinRoot.root _)) = _
    simp only [forward, AdjoinRoot.liftAlgHom_root, affineIteratedReverse.root, AlgHom.id_apply]

lemma affineTransitionIterated.root (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineTransitionIterated f n m
      (AdjoinRoot.root (Polynomial.X ^ m -
        Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ (n*m) - Polynomial.C f) := by
  simp only [affineTransitionIterated, AlgEquiv.ofAlgHom_apply, AdjoinRoot.liftAlgHom_root]

lemma affineTransitionIterated.coefficient (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f n) :
    affineTransitionIterated f n m (algebraMap (AffineRing f n) (affineIteratedRing f n m) b) =
      affineTransition f n m b :=
  by
    let : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
      (affineTransition f n m).toRingHom.toAlgebra
    exact (affineTransitionIterated f n m).commutes b

def affineTransitionBasis (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    (letI : Algebra (AffineRing f n) (AffineRing f (n * m)) :=
       (affineTransition f n m).toRingHom.toAlgebra;
     Basis (Fin m) (AffineRing f n) (AffineRing f (n * m))) := by
  classical
  letI : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
    (affineTransition f n m).toRingHom.toAlgebra
  by_cases h : Subsingleton (AffineRing f n)
  · letI := h
    letI : Subsingleton (AffineRing f (n*m)) := Module.subsingleton (AffineRing f n) _
    exact Basis.ofRepr (Module.subsingletonEquiv (AffineRing f n) _ _)
  · letI : Nontrivial (AffineRing f n) := not_subsingleton_iff_nontrivial.mp h
    let pb := AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C
      (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) (NeZero.ne m))
    have hd : (Polynomial.X ^ m -
      Polynomial.C (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f))).natDegree = m :=
      Polynomial.natDegree_X_pow_sub_C
    exact (pb.basis.reindex (finCongr hd)).map (affineTransitionIterated f n m).toLinearEquiv

lemma affineTransitionBasis.apply (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (i : Fin m) :
    affineTransitionBasis f n m i =
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ (i : ℕ) := by
  classical
  unfold affineTransitionBasis
  split_ifs with h
  · let : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
      (affineTransition f n m).toRingHom.toAlgebra
    let := h
    let : Subsingleton (AffineRing f (n*m)) := Module.subsingleton (AffineRing f n) _
    exact Subsingleton.elim _ _
  · rw [Module.Basis.map_apply, Module.Basis.reindex_apply, PowerBasis.basis_eq_pow]
    simp only [AlgEquiv.toLinearEquiv_apply, map_pow]
    change affineTransitionIterated f n m (AdjoinRoot.root _) ^ i.val = _
    rw [affineTransitionIterated.root]

lemma affineTransitionBasis.repr (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f (n * m)) :
    b = ∑ i : Fin m, affineTransition f n m ((affineTransitionBasis f n m).repr b i) *
      AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ (i : ℕ) := by
  let : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
    (affineTransition f n m).toRingHom.toAlgebra
  calc
    b = ∑ i : Fin m, ((affineTransitionBasis f n m).repr b i) •
      (affineTransitionBasis f n m) i := ((affineTransitionBasis f n m).sum_repr b).symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro i _
      rw [affineTransitionBasis.apply]
      rfl

lemma affineTransitionBasis.repr_symm (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (c : Fin m →₀ AffineRing f n) :
    (affineTransitionBasis f n m).repr.symm c =
      ∑ i : Fin m, affineTransition f n m (c i) *
        AdjoinRoot.root (Polynomial.X ^ (n * m) - Polynomial.C f) ^ (i : ℕ) := by
  let : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
    (affineTransition f n m).toRingHom.toAlgebra
  simpa only [LinearEquiv.apply_symm_apply] using
    affineTransitionBasis.repr f n m ((affineTransitionBasis f n m).repr.symm c)

theorem affineTransitionFaithfullyFlat (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    (let : Algebra (AffineRing f n) (AffineRing f (n * m)) :=
       (affineTransition f n m).toRingHom.toAlgebra;
     Module.FaithfullyFlat (AffineRing f n) (AffineRing f (n * m))) := by
  let : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
    (affineTransition f n m).toRingHom.toAlgebra
  let : Nonempty (Fin m) := ⟨⟨0, Nat.pos_of_ne_zero (NeZero.ne m)⟩⟩
  exact Module.FaithfullyFlat.of_linearEquiv _ _ (affineTransitionBasis f n m).repr

theorem affineTransitionSpecProperties (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    IsFinite (Spec.map (CommRingCat.ofHom (affineTransition f n m).toRingHom)) ∧
    Flat (Spec.map (CommRingCat.ofHom (affineTransition f n m).toRingHom)) ∧
    Surjective (Spec.map (CommRingCat.ofHom (affineTransition f n m).toRingHom)) := by
  let : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
    (affineTransition f n m).toRingHom.toAlgebra
  refine ⟨?_, ?_⟩
  · apply (IsFinite.SpecMap_iff _).mpr
    change Module.Finite (AffineRing f n) (AffineRing f (n*m))
    exact Module.Finite.of_basis (affineTransitionBasis f n m)
  · apply (flat_and_surjective_SpecMap_iff _).mpr
    change Module.FaithfullyFlat (AffineRing f n) (AffineRing f (n*m))
    exact affineTransitionFaithfullyFlat f n m

-- affineTransitionSpecProperties.test_wild
example :
    IsFinite (Spec.map (CommRingCat.ofHom (affineTransition (0 : ZMod 2) 2 2).toRingHom)) ∧
    Flat (Spec.map (CommRingCat.ofHom (affineTransition (0 : ZMod 2) 2 2).toRingHom)) ∧
    Surjective (Spec.map (CommRingCat.ofHom (affineTransition (0 : ZMod 2) 2 2).toRingHom)) :=
  affineTransitionSpecProperties _ _ _

-- affineTransition.test_one
example (f : A) (n : ℕ) [NeZero n] :
    affineTransition f n 1 =
      (AdjoinRoot.algEquivOfEq A
        (Polynomial.X ^ n - Polynomial.C f)
        (Polynomial.X ^ (n*1) - Polynomial.C f)
        (by rw [Nat.mul_one])).toAlgHom := by
  apply AdjoinRoot.algHom_ext
  simp only [affineTransition.root, pow_one, AlgEquiv.coe_toAlgHom, AdjoinRoot.algEquivOfEq_root]

-- affineTransition.test_four_to_two
example (f : A) :
    affineTransition f 2 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 2 :=
  affineTransition.root f 2 2

-- affineTransition.test_nilpotent
example (k : Type u) [Field k] :
    affineTransition (0 : k) 2 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k))) =
      AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C (0 : k)) ^ 2 ∧
    affineTransition (0 : k) 2 2 (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k))) ≠ 0 := by
  refine ⟨affineTransition.root _ _ _, ?_⟩
  rw [affineTransition.root]
  let pb := AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : k) (by decide : 4 ≠ 0))
  have hd : (Polynomial.X ^ 4 - Polynomial.C (0 : k)).natDegree = 4 :=
    Polynomial.natDegree_X_pow_sub_C
  let i : Fin pb.dim := ⟨2, by change 2 < (Polynomial.X ^ 4 - Polynomial.C (0 : k)).natDegree; omega⟩
  have hi := pb.basis.ne_zero i
  rw [pb.basis_eq_pow] at hi
  exact hi

-- affineTransitionBasis.test_one
example (f : A) (n : ℕ) [NeZero n] (i : Fin 1) :
    affineTransitionBasis f n 1 i = 1 := by
  rw [affineTransitionBasis.apply]
  have hi : i.val = 0 := by omega
  rw [hi, pow_zero]

-- affineTransitionBasis.test_four
example (f : A) (b : AffineRing f 4) :
    ∃! c : Fin 2 → AffineRing f 2,
      b = affineTransition f 2 2 (c 0) +
        affineTransition f 2 2 (c 1) * AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) := by
  classical
  let : Algebra (AffineRing f 2) (AffineRing f 4) :=
    (affineTransition f 2 2).toRingHom.toAlgebra
  let v := affineTransitionBasis f 2 2
  have hsum (c : Fin 2 → AffineRing f 2) :
      ∑ i : Fin 2, c i • v i = affineTransition f 2 2 (c 0) +
        affineTransition f 2 2 (c 1) * AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) := by
    rw [Fin.sum_univ_two]
    simp only [v, affineTransitionBasis.apply, Fin.val_zero, Fin.val_one, pow_zero, pow_one]
    change affineTransition f 2 2 (c 0) * 1 + _ = _
    rw [mul_one]
    rfl
  refine ⟨v.equivFun b, ?_, ?_⟩
  · dsimp only
    rw [← hsum]
    exact (v.sum_equivFun b).symm
  · intro c hc
    apply v.equivFun.symm.injective
    simpa only [Module.Basis.equivFun_symm_apply, hsum,
      LinearEquiv.symm_apply_apply] using hc.symm

-- affineTransitionBasis.test_zeroRing
example [Subsingleton A] (f : A) (n m : ℕ) [NeZero n] [NeZero m] (i : Fin m) :
    affineTransitionBasis f n m i = 0 := by
  have : Subsingleton (AffineRing f (n*m)) := Module.subsingleton A _
  exact Subsingleton.elim _ _

-- affineIteratedReverse.test_root
example (k : Type u) [Field k] :
    affineIteratedReverse (0 : k) 2 2
      (AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C (0 : k))) =
      AdjoinRoot.root (Polynomial.X ^ 2 -
        Polynomial.C (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (0 : k)))) :=
  affineIteratedReverse.root _ _ _

-- affineIteratedReverse.test_coefficient
example (f : A) :
    affineIteratedReverse f 2 2 (AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 2) =
      algebraMap (AffineRing f 2) (affineIteratedRing f 2 2)
        (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) := by
  rw [← affineTransition.root f 2 2]
  exact affineIteratedReverse.coefficient _ _ _ _

-- affineIteratedReverse.test_fourth_power
example (f : A) :
    affineIteratedReverse f 2 2 (AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 4) =
      algebraMap A (affineIteratedRing f 2 2) f := by
  rw [affineRoot.pow_eq]
  exact (affineIteratedReverse f 2 2).commutes f

-- affineIteratedReverse.test_zeroRing
example [Subsingleton A] (f : A) (n m : ℕ) [NeZero n] [NeZero m]
    (b : AffineRing f (n*m)) : affineIteratedReverse f n m b = 0 := by
  have : Subsingleton (affineIteratedRing f n m) := Module.subsingleton A _
  exact Subsingleton.elim _ _

-- affineTransitionBasis.test_nonreduced
example :
    (letI : Algebra (AffineRing (2 : ZMod 4) 2) (AffineRing (2 : ZMod 4) 4) :=
      (affineTransition (2 : ZMod 4) 2 2).toRingHom.toAlgebra;
    Module.FaithfullyFlat (AffineRing (2 : ZMod 4) 2) (AffineRing (2 : ZMod 4) 4)) :=
  affineTransitionFaithfullyFlat (2 : ZMod 4) 2 2

-- affineTransitionBasis.test_wild
example :
    (letI : Algebra (AffineRing (0 : ZMod 2) 2) (AffineRing (0 : ZMod 2) 4) :=
      (affineTransition (0 : ZMod 2) 2 2).toRingHom.toAlgebra;
    Module.FaithfullyFlat (AffineRing (0 : ZMod 2) 2) (AffineRing (0 : ZMod 2) 4)) :=
  affineTransitionFaithfullyFlat (0 : ZMod 2) 2 2

-- affineTransitionBasis.test_finite_free
example (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    Module.Free (AffineRing f n) (AffineRing f (n*m)) ∧
    Module.Finite (AffineRing f n) (AffineRing f (n*m)) := by
  exact ⟨Module.Free.of_basis (affineTransitionBasis f n m),
    Module.Finite.of_basis (affineTransitionBasis f n m)⟩

#print axioms affineTransition
#print axioms affineTransition.root
#print axioms affineTransition.constant
#print axioms affineTransition.unique
#print axioms affineTransition.comp
#print axioms affineIteratedReverse
#print axioms affineIteratedReverse.root
#print axioms affineIteratedReverse.constant
#print axioms affineIteratedReverse.coefficient
#print axioms affineTransitionIterated
#print axioms affineTransitionIterated.root
#print axioms affineTransitionIterated.coefficient
#print axioms affineTransitionBasis
#print axioms affineTransitionBasis.apply
#print axioms affineTransitionBasis.repr
#print axioms affineTransitionBasis.repr_symm
#print axioms affineTransitionSpecProperties
#print axioms affineTransitionFaithfullyFlat

end TauCeti.RootStack

namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]
open CategoryTheory

-- Actual maps at divisibility indices avoid quotient carrier transports.
def affineDivisibility (f : A) (n N : ℕ) [NeZero n] [NeZero N] (h : n ∣ N) :
    AffineRing f n →ₐ[A] AffineRing f N :=
  AdjoinRoot.liftAlgHom _ (Algebra.ofId A _) (AdjoinRoot.root _ ^ (N / n)) (by
    simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
      Polynomial.eval₂_C]
    change (AdjoinRoot.root _ ^ (N / n)) ^ n - algebraMap A _ f = 0
    rw [← pow_mul, Nat.div_mul_cancel h, affineRoot.pow_eq, sub_self])

lemma affineDivisibility.root (f : A) (n N : ℕ) [NeZero n] [NeZero N] (h : n ∣ N) :
    affineDivisibility f n N h (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ N - Polynomial.C f) ^ (N / n) := by
  simp [affineDivisibility]

lemma affineDivisibility.identity (f : A) (n : ℕ) [NeZero n] :
    affineDivisibility f n n (dvd_refl n) = AlgHom.id A (AffineRing f n) := by
  apply AdjoinRoot.algHom_ext
  simp [affineDivisibility.root, Nat.div_self (Nat.pos_of_ne_zero (NeZero.ne n))]

lemma affineDivisibility.composition (f : A) (n N K : ℕ)
    [NeZero n] [NeZero N] [NeZero K] (h : n ∣ N) (k : N ∣ K) :
    (affineDivisibility f N K k).comp (affineDivisibility f n N h) =
      affineDivisibility f n K (dvd_trans h k) := by
  apply AdjoinRoot.algHom_ext
  simp only [AlgHom.comp_apply, affineDivisibility.root, map_pow, ← pow_mul]
  rw [Nat.div_mul_div k h]

lemma affineDivisibility.constant (f a : A) (n N : ℕ)
    [NeZero n] [NeZero N] (h : n ∣ N) :
    affineDivisibility f n N h (algebraMap A (AffineRing f n) a) =
      algebraMap A (AffineRing f N) a :=
  (affineDivisibility f n N h).commutes a

lemma affineDivisibility.unique (f : A) (n N : ℕ) [NeZero n] [NeZero N]
    (h : n ∣ N) (g : AffineRing f n →ₐ[A] AffineRing f N)
    (hg : g (AdjoinRoot.root (Polynomial.X ^ n - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ N - Polynomial.C f) ^ (N / n)) :
    g = affineDivisibility f n N h :=
  AdjoinRoot.algHom_ext (hg.trans (affineDivisibility.root f n N h).symm)

lemma affineDivisibility.multiplicative (f : A) (n m : ℕ) [NeZero n] [NeZero m] :
    affineDivisibility f n (n*m) (dvd_mul_right n m) = affineTransition f n m := by
  apply AdjoinRoot.algHom_ext
  rw [affineDivisibility.root, affineTransition.root,
    Nat.mul_div_cancel_left m (Nat.pos_of_ne_zero (NeZero.ne n))]

-- A genuine native functor, not a family whose compatibility is assumed.
def factorialAffineTower (f : A) : ℕ ⥤ CommAlgCat.{u} A where
  obj i := CommAlgCat.of A (AffineRing f (Nat.factorial (i + 1)))
  map {i j} h := by
    letI : NeZero (Nat.factorial (i + 1)) := ⟨Nat.factorial_ne_zero _⟩
    letI : NeZero (Nat.factorial (j + 1)) := ⟨Nat.factorial_ne_zero _⟩
    exact CommAlgCat.ofHom (affineDivisibility f _ _
      (Nat.factorial_dvd_factorial (Nat.add_le_add_right (leOfHom h) 1)))
  map_id i := by
    apply CommAlgCat.hom_ext
    let : NeZero (Nat.factorial (i + 1)) := ⟨Nat.factorial_ne_zero _⟩
    exact affineDivisibility.identity f _
  map_comp {i j k} h g := by
    apply CommAlgCat.hom_ext
    let : NeZero (Nat.factorial (i + 1)) := ⟨Nat.factorial_ne_zero _⟩
    let : NeZero (Nat.factorial (j + 1)) := ⟨Nat.factorial_ne_zero _⟩
    let : NeZero (Nat.factorial (k + 1)) := ⟨Nat.factorial_ne_zero _⟩
    exact (affineDivisibility.composition f _ _ _
      (Nat.factorial_dvd_factorial (Nat.add_le_add_right (leOfHom h) 1))
      (Nat.factorial_dvd_factorial (Nat.add_le_add_right (leOfHom g) 1))).symm

-- Keep the specified chart carrier visible even when the functor's body is admitted.
def factorialAffineTower.chart (f : A) (i : ℕ) :
    ((factorialAffineTower f).obj i) ≃ₐ[A] AffineRing f (Nat.factorial (i+1)) := by
  change AffineRing f (Nat.factorial (i+1)) ≃ₐ[A] AffineRing f (Nat.factorial (i+1))
  exact AlgEquiv.refl

lemma factorialAffineTower.root (f : A) {i j : ℕ} (h : i ≤ j) :
    factorialAffineTower.chart f j
      (((factorialAffineTower f).map (homOfLE h)).hom
        ((factorialAffineTower.chart f i).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial (i+1) - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ Nat.factorial (j+1) - Polynomial.C f) ^
        (Nat.factorial (j+1) / Nat.factorial (i+1)) := by
  let : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩
  let : NeZero (Nat.factorial (j+1)) := ⟨Nat.factorial_ne_zero _⟩
  exact affineDivisibility.root f _ _
    (Nat.factorial_dvd_factorial (Nat.add_le_add_right h 1))

lemma factorialAffineTower.constant (f a : A) {i j : ℕ} (h : i ≤ j) :
    factorialAffineTower.chart f j
      (((factorialAffineTower f).map (homOfLE h)).hom
        ((factorialAffineTower.chart f i).symm
          (algebraMap A (AffineRing f (Nat.factorial (i+1))) a))) =
      algebraMap A (AffineRing f (Nat.factorial (j+1))) a := by
  rw [AlgEquiv.commutes, AlgHom.commutes, AlgEquiv.commutes]

-- affineDivisibilityTests.identity
example (f : A) (n : ℕ) [NeZero n] :
    affineDivisibility f n n (dvd_refl n) = AlgHom.id A (AffineRing f n) :=
  affineDivisibility.identity f n

-- affineDivisibilityTests.fourToTwo
example (f : A) :
    affineDivisibility f 2 4 (by decide)
      (AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C f)) =
      AdjoinRoot.root (Polynomial.X ^ 4 - Polynomial.C f) ^ 2 :=
  affineDivisibility.root f 2 4 (by decide)

-- affineDivisibilityTests.coefficients
example (f a : ZMod 4) :
    affineDivisibility f 2 6 (by decide) (algebraMap (ZMod 4) (AffineRing f 2) a) =
      algebraMap (ZMod 4) (AffineRing f 6) a :=
  affineDivisibility.constant f a 2 6 (by decide)

-- factorialAffineTowerTests.firstLevel
example (f : A) :
    (factorialAffineTower f).obj 0 = CommAlgCat.of A (AffineRing f 1) := by
  rfl

-- factorialAffineTowerTests.twoToSix
example (f : A) :
    factorialAffineTower.chart f 2
      (((factorialAffineTower f).map (homOfLE (by decide : 1 ≤ 2))).hom
        ((factorialAffineTower.chart f 1).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial 2 - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ Nat.factorial 3 - Polynomial.C f) ^ 3 :=
  by simpa only [show Nat.factorial 3 / Nat.factorial 2 = 3 by decide] using
    factorialAffineTower.root f (by decide : 1 ≤ 2)

-- factorialAffineTowerTests.composite
example (f : A) :
    factorialAffineTower.chart f 3
      ((((factorialAffineTower f).map (homOfLE (by decide : 2 ≤ 3))).hom.comp
        ((factorialAffineTower f).map (homOfLE (by decide : 1 ≤ 2))).hom)
        ((factorialAffineTower.chart f 1).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial 2 - Polynomial.C f)))) =
      AdjoinRoot.root (Polynomial.X ^ Nat.factorial 4 - Polynomial.C f) ^ 12 := by
  rw [← CommAlgCat.hom_comp, ← Functor.map_comp, homOfLE_comp]
  simpa only [show Nat.factorial 4 / Nat.factorial 2 = 12 by decide] using
    factorialAffineTower.root f (by decide : 1 ≤ 3)

-- factorialAffineTowerTests.wildNilpotent
example :
    factorialAffineTower.chart (0 : ZMod 2) 2
      (((factorialAffineTower (0 : ZMod 2)).map (homOfLE (by decide : 1 ≤ 2))).hom
        ((factorialAffineTower.chart (0 : ZMod 2) 1).symm
          (AdjoinRoot.root (Polynomial.X ^ Nat.factorial 2 - Polynomial.C (0 : ZMod 2))))) ≠ 0 := by
  rw [factorialAffineTower.root]
  change AdjoinRoot.root (Polynomial.X ^ Nat.factorial 3 - Polynomial.C (0 : ZMod 2)) ^
    (Nat.factorial 3 / Nat.factorial 2) ≠ 0
  let pb := AdjoinRoot.powerBasis'
    (Polynomial.monic_X_pow_sub_C (0 : ZMod 2) (by decide : Nat.factorial 3 ≠ 0))
  let i : Fin pb.dim := ⟨3, by
    change 3 < (Polynomial.X ^ Nat.factorial 3 - Polynomial.C (0 : ZMod 2)).natDegree
    rw [Polynomial.natDegree_X_pow_sub_C]
    decide⟩
  have hi := pb.basis.ne_zero i
  rw [pb.basis_eq_pow] at hi
  change AdjoinRoot.root (Polynomial.X ^ Nat.factorial 3 - Polynomial.C (0 : ZMod 2)) ^ 3 ≠ 0 at hi
  simpa only [show Nat.factorial 3 / Nat.factorial 2 = 3 by decide] using hi

-- factorialAffineTowerTests.zeroRing
example {i j : ℕ} (h : i ≤ j) (x : (factorialAffineTower (0 : ZMod 1)).obj i) :
    factorialAffineTower.chart (0 : ZMod 1) j
      (((factorialAffineTower (0 : ZMod 1)).map (homOfLE h)).hom x) = 0 := by
  have : Subsingleton (AffineRing (0 : ZMod 1) (Nat.factorial (j+1))) :=
    Module.subsingleton (ZMod 1) _
  exact Subsingleton.elim _ _

#print axioms affineDivisibility
#print axioms affineDivisibility.constant
#print axioms affineDivisibility.unique
#print axioms affineDivisibility.multiplicative
#print axioms affineDivisibility.root
#print axioms affineDivisibility.identity
#print axioms affineDivisibility.composition
#print axioms factorialAffineTower
#print axioms factorialAffineTower.chart
#print axioms factorialAffineTower.root
#print axioms factorialAffineTower.constant
end TauCeti.RootStack

/-! Native factorial root colimit continuation. -/
noncomputable section
namespace TauCeti.RootStack
open CategoryTheory CategoryTheory.Limits
variable {A : Type u} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

def factorialAffineMap (f : A) (i j : ℕ) (h : i ≤ j) :
    AffineRing f (Nat.factorial (i+1)) →ₐ[A] AffineRing f (Nat.factorial (j+1)) :=
  affineDivisibility f _ _ (Nat.factorial_dvd_factorial (Nat.add_le_add_right h 1))

instance factorialAffineDirected (f : A) :
    DirectedSystem (fun i => AffineRing f (Nat.factorial (i+1)))
      (fun i j h => factorialAffineMap f i j h) where
  map_self {i} x := by
    change affineDivisibility f (Nat.factorial (i+1)) _ (dvd_refl _) x = x
    rw [affineDivisibility.identity]
    rfl
  map_map {k j i} h l x := by
    exact congrArg (fun z => z x) (affineDivisibility.composition f
      (Nat.factorial (i+1)) (Nat.factorial (j+1)) (Nat.factorial (k+1))
      (Nat.factorial_dvd_factorial (Nat.add_le_add_right h 1))
      (Nat.factorial_dvd_factorial (Nat.add_le_add_right l 1)))

abbrev FactorialAffineColimit (f : A) :=
  DirectLimit (fun i => AffineRing f (Nat.factorial (i+1))) (factorialAffineMap f)

def factorialAffineInclusion (f : A) (i : ℕ) :
    AffineRing f (Nat.factorial (i+1)) →ₐ[A] FactorialAffineColimit f :=
  DirectLimit.Algebra.of _ (factorialAffineMap f) i

lemma factorialAffineInclusion.transition (f : A) {i j : ℕ} (h : i ≤ j)
    (x : AffineRing f (Nat.factorial (i+1))) :
    factorialAffineInclusion f j (factorialAffineMap f i j h x) =
      factorialAffineInclusion f i x :=
  DirectLimit.Algebra.of_f (f := factorialAffineMap f) h x

lemma factorialAffineInclusion.root (f : A) {i j : ℕ} (h : i ≤ j) :
    factorialAffineInclusion f i (AdjoinRoot.root _) =
      factorialAffineInclusion f j (AdjoinRoot.root _) ^
        (Nat.factorial (j+1) / Nat.factorial (i+1)) := by
  rw [← factorialAffineInclusion.transition f h, ← map_pow]
  exact congrArg (factorialAffineInclusion f j)
    (affineDivisibility.root f _ _ (Nat.factorial_dvd_factorial (Nat.add_le_add_right h 1)))

lemma factorialAffineInclusion.pow (f : A) (i : ℕ) :
    factorialAffineInclusion f i (AdjoinRoot.root _) ^ Nat.factorial (i+1) =
      algebraMap A (FactorialAffineColimit f) f := by
  rw [← map_pow, affineRoot.pow_eq, AlgHom.commutes]

lemma affineDivisibility.injective (f : A) (n N : ℕ) [NeZero n] [NeZero N]
    (h : n ∣ N) : Function.Injective (affineDivisibility f n N h) := by
  obtain ⟨m, rfl⟩ := h
  have hm : m ≠ 0 := by intro hm; simp [hm] at *
  let : NeZero m := ⟨hm⟩
  rw [affineDivisibility.multiplicative]
  let : Algebra (AffineRing f n) (AffineRing f (n*m)) :=
    (affineTransition f n m).toRingHom.toAlgebra
  let : Module.FaithfullyFlat (AffineRing f n) (AffineRing f (n*m)) :=
    affineTransitionFaithfullyFlat f n m
  exact FaithfulSMul.algebraMap_injective (AffineRing f n) (AffineRing f (n*m))

lemma factorialAffineInclusion.injective (f : A) (i : ℕ) :
    Function.Injective (factorialAffineInclusion f i) := by
  exact DirectLimit.mk_injective (factorialAffineMap f)
    (fun j k h => affineDivisibility.injective f _ _
      (Nat.factorial_dvd_factorial (Nat.add_le_add_right h 1))) i

lemma factorialAffineColimit.exists_level (f : A) (x : FactorialAffineColimit f) :
    ∃ i, ∃ y : AffineRing f (Nat.factorial (i+1)), factorialAffineInclusion f i y = x := by
  obtain ⟨i,y,hy⟩ := DirectLimit.exists_eq_mk (factorialAffineMap f) x
  exact ⟨i,y,hy.symm⟩

lemma factorialAffineColimit.hom_ext (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (g h : FactorialAffineColimit f →ₐ[A] C)
    (heq : ∀ i, g (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      h (factorialAffineInclusion f i (AdjoinRoot.root _))) : g = h := by
  apply DirectLimit.Algebra.hom_ext
  intro i
  apply AdjoinRoot.algHom_ext
  exact heq i

def factorialAffineCocone (f : A) : Cocone (factorialAffineTower f) where
  pt := CommAlgCat.of A (FactorialAffineColimit f)
  ι.app i := CommAlgCat.ofHom (factorialAffineInclusion f i)
  ι.naturality i j h := by
    apply CommAlgCat.hom_ext
    ext x
    exact factorialAffineInclusion.transition f (leOfHom h) x

def factorialAffineCocone.isColimit (f : A) : IsColimit (factorialAffineCocone f) where
  desc s := CommAlgCat.ofHom (DirectLimit.Algebra.lift _ (factorialAffineMap f) s.pt
    (fun i => (s.ι.app i).hom) (fun i j h x => by
      exact congrArg (fun z => z.hom x) (s.w (homOfLE h))))
  fac s i := by apply CommAlgCat.hom_ext; rfl
  uniq s m hm := by
    apply CommAlgCat.hom_ext
    apply DirectLimit.Algebra.hom_ext
    intro i
    exact congrArg CommAlgCat.Hom.hom (hm i)

def factorialAffineRootLift (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i) :
    FactorialAffineColimit f →ₐ[A] C := by
  let g (i : ℕ) : AffineRing f (Nat.factorial (i+1)) →ₐ[A] C :=
    AdjoinRoot.liftAlgHom _ (Algebra.ofId A C) (r i) (by
      simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
        Polynomial.eval₂_C]
      exact sub_eq_zero.mpr (hr i))
  apply DirectLimit.Algebra.lift _ (factorialAffineMap f) C g
  intro i j h x
  have heq : (g j).comp (factorialAffineMap f i j h) = g i := by
    apply AdjoinRoot.algHom_ext
    change g j (affineDivisibility f _ _
      (Nat.factorial_dvd_factorial (Nat.add_le_add_right h 1)) (AdjoinRoot.root _)) = g i (AdjoinRoot.root _)
    rw [affineDivisibility.root, map_pow]
    simpa only [g, AdjoinRoot.liftAlgHom_root] using hc i j h
  exact congrArg (fun z => z x) heq

lemma factorialAffineRootLift.root (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i)
    (i : ℕ) :
    factorialAffineRootLift f r hr hc (factorialAffineInclusion f i (AdjoinRoot.root _)) = r i := by
  exact AdjoinRoot.liftAlgHom_root (Polynomial.X ^ Nat.factorial (i+1) - Polynomial.C f)
    (Algebra.ofId A C) (r i) (by
      simp only [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
        Polynomial.eval₂_C]
      exact sub_eq_zero.mpr (hr i))

-- factorialAffineColimit.test_wild_nonzero
example : factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _) ≠ 0 := by
  intro hz
  have heq := factorialAffineInclusion.injective (0 : ZMod 2) 1
    (hz.trans (map_zero _).symm)
  have h := (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
    (Nat.factorial_ne_zero (1+1)))).basis.ne_zero
      (⟨1, by norm_num [AdjoinRoot.powerBasis'_dim]⟩ : Fin
        (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
          (Nat.factorial_ne_zero (1+1)))).dim)
  apply h
  simpa only [PowerBasis.basis_eq_pow, AdjoinRoot.powerBasis'_gen, pow_one] using heq

-- factorialAffineColimit.test_wild_square
example : factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _) ^ 2 = 0 := by
  simpa using factorialAffineInclusion.pow (0 : ZMod 2) 1

-- factorialAffineColimit.test_two_to_six
example (f : A) : factorialAffineInclusion f 1 (AdjoinRoot.root _) =
    factorialAffineInclusion f 2 (AdjoinRoot.root _) ^ 3 :=
  factorialAffineInclusion.root f (by decide : 1 ≤ 2)

#print axioms affineDivisibility.injective
#print axioms factorialAffineCocone.isColimit
#print axioms factorialAffineRootLift
#print axioms factorialAffineInclusion.injective

def factorialAffineCocone.point (f : A) :
    (factorialAffineCocone f).pt ≅ CommAlgCat.of A (FactorialAffineColimit f) := Iso.refl _

lemma factorialAffineCocone.leg (f : A) (i : ℕ) :
    ((factorialAffineCocone f).ι.app i ≫ (factorialAffineCocone.point f).hom).hom =
      (factorialAffineInclusion f i).comp (factorialAffineTower.chart f i).toAlgHom := rfl

lemma factorialAffineRootLift.unique (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i)
    (g : FactorialAffineColimit f →ₐ[A] C)
    (hg : ∀ i, g (factorialAffineInclusion f i (AdjoinRoot.root _)) = r i) :
    g = factorialAffineRootLift f r hr hc := by
  apply factorialAffineColimit.hom_ext
  intro i
  rw [hg, factorialAffineRootLift.root]

lemma factorialAffineRootLift.postcomp (f : A) {C D : Type u} [CommRing C] [Algebra A C]
    [CommRing D] [Algebra A D] (k : C →ₐ[A] D)
    (r : ℕ → C) (hr : ∀ i, r i ^ Nat.factorial (i+1) = algebraMap A C f)
    (hc : ∀ i j, i ≤ j → r j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = r i)
    (hs : ∀ i, k (r i) ^ Nat.factorial (i+1) = algebraMap A D f)
    (ht : ∀ i j, i ≤ j → k (r j) ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = k (r i)) :
    k.comp (factorialAffineRootLift f r hr hc) =
      factorialAffineRootLift f (fun i => k (r i)) hs ht := by
  apply factorialAffineRootLift.unique
  intro i
  simp only [AlgHom.comp_apply, factorialAffineRootLift.root]

-- factorialAffineInclusion.test_coefficients
example (a : ZMod 4) :
    factorialAffineInclusion (2 : ZMod 4) 1 (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (FactorialAffineColimit (2 : ZMod 4)) a := AlgHom.commutes _ _

-- factorialAffineColimit.test_zeroRing
example (x : FactorialAffineColimit (0 : ZMod 1)) : x = 0 := by
  obtain ⟨i,y,rfl⟩ := factorialAffineColimit.exists_level _ x
  let : Subsingleton (AffineRing (0 : ZMod 1) (Nat.factorial (i+1))) :=
    Module.subsingleton (ZMod 1) _
  have hy : y = 0 := Subsingleton.elim _ _
  rw [hy, map_zero]

-- factorialAffineCocone.test_wild
example : IsColimit (factorialAffineCocone (0 : ZMod 2)) :=
  factorialAffineCocone.isColimit _

-- factorialAffineCocone.test_zeroRing
example : IsColimit (factorialAffineCocone (0 : ZMod 1)) :=
  factorialAffineCocone.isColimit _

-- factorialAffineCocone.test_leg
example (f : A) :
    ((factorialAffineCocone f).ι.app 0 ≫ (factorialAffineCocone.point f).hom).hom =
      (factorialAffineInclusion f 0).comp (factorialAffineTower.chart f 0).toAlgHom :=
  factorialAffineCocone.leg f 0

-- factorialAffineRootLift.test_one
example : factorialAffineRootLift (1 : ℤ) (fun _ => (1 : ℤ))
    (by simp) (by simp) (factorialAffineInclusion (1 : ℤ) 2 (AdjoinRoot.root _)) = 1 :=
  factorialAffineRootLift.root _ _ _ _ _

-- factorialAffineRootLift.test_zero
example : factorialAffineRootLift (0 : ZMod 2) (fun _ => (0 : ZMod 2))
    (by simp [Nat.factorial_ne_zero]) (by
      intro i j h
      have hd : 0 < Nat.factorial (j+1) / Nat.factorial (i+1) :=
        Nat.div_pos (Nat.factorial_le (Nat.add_le_add_right h 1))
          (Nat.factorial_pos _)
      exact zero_pow (Nat.ne_of_gt hd))
    (factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _)) = 0 :=
  factorialAffineRootLift.root _ _ _ _ _

-- factorialAffineRootLift.test_identity
example (f : A) (hr : ∀ i, factorialAffineInclusion f i (AdjoinRoot.root _) ^
    Nat.factorial (i+1) = algebraMap A (FactorialAffineColimit f) f)
    (hc : ∀ i j, i ≤ j → factorialAffineInclusion f j (AdjoinRoot.root _) ^
      (Nat.factorial (j+1) / Nat.factorial (i+1)) =
        factorialAffineInclusion f i (AdjoinRoot.root _)) :
    factorialAffineRootLift f (fun i => factorialAffineInclusion f i (AdjoinRoot.root _)) hr hc =
      AlgHom.id A (FactorialAffineColimit f) := by
  symm
  apply factorialAffineRootLift.unique
  intro i
  rfl

#print axioms factorialAffineDirected
#print axioms factorialAffineInclusion.transition
#print axioms factorialAffineInclusion.root
#print axioms factorialAffineInclusion.pow
#print axioms factorialAffineColimit.exists_level
#print axioms factorialAffineColimit.hom_ext
#print axioms factorialAffineRootLift.root
#print axioms factorialAffineRootLift.unique
#print axioms factorialAffineRootLift.postcomp
#print axioms factorialAffineCocone.point
#print axioms factorialAffineCocone.leg

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
    n ≤ RootDivIndex.factorial n.exponent :=
  Nat.dvd_factorial n.positive (Nat.le_succ _)

lemma RootDivIndex.factorial_mono {i j : ℕ} (h : i ≤ j) :
    RootDivIndex.factorial i ≤ RootDivIndex.factorial j :=
  Nat.factorial_dvd_factorial (Nat.add_le_add_right h 1)

local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

lemma factorialAffineInclusion.comp_transition (f : A) {i j : ℕ} (h : i ≤ j) :
    (factorialAffineInclusion f j).comp (factorialAffineMap f i j h) =
      factorialAffineInclusion f i := by
  apply AlgHom.ext
  intro x
  exact factorialAffineInclusion.transition f h x

def factorialAffineExtension (f : A) (n : RootDivIndex) :
    AffineRing f n.exponent →ₐ[A] FactorialAffineColimit f :=
  (factorialAffineInclusion f n.exponent).comp
    (affineDivisibility f _ _ (RootDivIndex.cofinal n))

lemma factorialAffineExtension.at_level (f : A) (n : RootDivIndex) (i : ℕ)
    (h : n ≤ RootDivIndex.factorial i) :
    factorialAffineExtension f n =
      (factorialAffineInclusion f i).comp (affineDivisibility f _ _ h) := by
  let k := max n.exponent i
  have extend (j : ℕ) (hj : j ≤ k) (hd : n ≤ RootDivIndex.factorial j) :
      (factorialAffineInclusion f j).comp (affineDivisibility f _ _ hd) =
        (factorialAffineInclusion f k).comp
          (affineDivisibility f _ _ (dvd_trans hd (RootDivIndex.factorial_mono hj))) := by
    rw [← factorialAffineInclusion.comp_transition f hj, AlgHom.comp_assoc]
    rw [factorialAffineMap, affineDivisibility.composition]
  exact (extend n.exponent (le_max_left _ _) (RootDivIndex.cofinal n)).trans
    (extend i (le_max_right _ _) h).symm

lemma factorialAffineExtension.transition (f : A) {n N : RootDivIndex} (h : n ≤ N) :
    (factorialAffineExtension f N).comp (affineDivisibility f _ _ h) =
      factorialAffineExtension f n := by
  rw [factorialAffineExtension.at_level f n N.exponent
    (dvd_trans h (RootDivIndex.cofinal N))]
  unfold factorialAffineExtension
  rw [AlgHom.comp_assoc, affineDivisibility.composition]

lemma factorialAffineExtension.factorial (f : A) (i : ℕ) :
    factorialAffineExtension f (RootDivIndex.factorial i) =
      factorialAffineInclusion f i := by
  rw [factorialAffineExtension.at_level f _ i (dvd_refl _), affineDivisibility.identity]
  rfl

lemma factorialAffineExtension.injective (f : A) (n : RootDivIndex) :
    Function.Injective (factorialAffineExtension f n) :=
  (factorialAffineInclusion.injective f n.exponent).comp
    (affineDivisibility.injective f _ _ (RootDivIndex.cofinal n))

def divisibilityAffineMap (f : A) (n N : RootDivIndex) (h : n ≤ N) :
    AffineRing f n.exponent →ₐ[A] AffineRing f N.exponent :=
  affineDivisibility f _ _ h

instance divisibilityAffineDirected (f : A) :
    DirectedSystem (fun n : RootDivIndex => AffineRing f n.exponent)
      (fun i j h => divisibilityAffineMap f i j h) where
  map_self {i} x := by
    change affineDivisibility f i.exponent _ (dvd_refl _) x = x
    rw [affineDivisibility.identity]
    rfl
  map_map {k j i} h l x := by
    exact congrArg (fun z => z x) (affineDivisibility.composition f
      i.exponent j.exponent k.exponent h l)

abbrev DivisibilityAffineColimit (f : A) :=
  DirectLimit (fun n : RootDivIndex => AffineRing f n.exponent) (divisibilityAffineMap f)

def divisibilityAffineInclusion (f : A) (n : RootDivIndex) :
    AffineRing f n.exponent →ₐ[A] DivisibilityAffineColimit f :=
  DirectLimit.Algebra.of _ (divisibilityAffineMap f) n

lemma divisibilityAffineInclusion.transition (f : A) {n N : RootDivIndex} (h : n ≤ N)
    (x : AffineRing f n.exponent) :
    divisibilityAffineInclusion f N (affineDivisibility f _ _ h x) =
      divisibilityAffineInclusion f n x :=
  DirectLimit.Algebra.of_f (f := divisibilityAffineMap f) h x

lemma divisibilityAffineInclusion.injective (f : A) (n : RootDivIndex) :
    Function.Injective (divisibilityAffineInclusion f n) :=
  DirectLimit.mk_injective (divisibilityAffineMap f)
    (fun i j h => affineDivisibility.injective f i.exponent j.exponent h) n

lemma divisibilityAffineColimit.exists_level (f : A) (x : DivisibilityAffineColimit f) :
    ∃ n : RootDivIndex, ∃ y : AffineRing f n.exponent, divisibilityAffineInclusion f n y = x := by
  obtain ⟨n,y,hy⟩ := DirectLimit.exists_eq_mk (divisibilityAffineMap f) x
  exact ⟨n,y,hy.symm⟩

lemma divisibilityAffineColimit.hom_ext (f : A) {C : Type u} [CommRing C] [Algebra A C]
    (g h : DivisibilityAffineColimit f →ₐ[A] C)
    (heq : ∀ n, g (divisibilityAffineInclusion f n (AdjoinRoot.root _)) =
      h (divisibilityAffineInclusion f n (AdjoinRoot.root _))) : g = h := by
  apply DirectLimit.Algebra.hom_ext
  intro n
  apply AdjoinRoot.algHom_ext
  exact heq n

def divisibilityToFactorial (f : A) :
    DivisibilityAffineColimit f →ₐ[A] FactorialAffineColimit f :=
  DirectLimit.Algebra.lift _ (divisibilityAffineMap f) _ (factorialAffineExtension f)
    (fun n N h x => congrArg (fun z => z x)
      (factorialAffineExtension.transition f (n := n) (N := N) h))

lemma divisibilityToFactorial.inclusion (f : A) (n : RootDivIndex)
    (x : AffineRing f n.exponent) :
    divisibilityToFactorial f (divisibilityAffineInclusion f n x) =
      factorialAffineExtension f n x := rfl

def factorialToDivisibility (f : A) :
    FactorialAffineColimit f →ₐ[A] DivisibilityAffineColimit f :=
  DirectLimit.Algebra.lift _ (factorialAffineMap f) _
    (fun i => divisibilityAffineInclusion f (RootDivIndex.factorial i))
    (fun i j h x => divisibilityAffineInclusion.transition f
      (RootDivIndex.factorial_mono (i := i) (j := j) h) x)

lemma factorialToDivisibility.inclusion (f : A) (i : ℕ)
    (x : AffineRing f (Nat.factorial (i+1))) :
    factorialToDivisibility f (factorialAffineInclusion f i x) =
      divisibilityAffineInclusion f (RootDivIndex.factorial i) x := rfl

lemma divisibilityToFactorial.left_inverse (f : A) (x : DivisibilityAffineColimit f) :
    factorialToDivisibility f (divisibilityToFactorial f x) = x := by
  obtain ⟨n,y,rfl⟩ := divisibilityAffineColimit.exists_level f x
  rw [divisibilityToFactorial.inclusion]
  change factorialToDivisibility f
    (factorialAffineInclusion f n.exponent
      (affineDivisibility f _ _ (RootDivIndex.cofinal n) y)) = _
  rw [factorialToDivisibility.inclusion, divisibilityAffineInclusion.transition]

lemma divisibilityToFactorial.right_inverse (f : A) (x : FactorialAffineColimit f) :
    divisibilityToFactorial f (factorialToDivisibility f x) = x := by
  obtain ⟨i,y,rfl⟩ := factorialAffineColimit.exists_level f x
  rw [factorialToDivisibility.inclusion, divisibilityToFactorial.inclusion,
    factorialAffineExtension.factorial]

def divisibilityFactorialEquiv (f : A) :
    DivisibilityAffineColimit f ≃ₐ[A] FactorialAffineColimit f :=
  AlgEquiv.ofAlgHom (divisibilityToFactorial f) (factorialToDivisibility f)
    (by apply AlgHom.ext; exact divisibilityToFactorial.right_inverse f)
    (by apply AlgHom.ext; exact divisibilityToFactorial.left_inverse f)

lemma divisibilityFactorialEquiv.inclusion (f : A) (n : RootDivIndex) (i : ℕ)
    (h : n ≤ RootDivIndex.factorial i) (x : AffineRing f n.exponent) :
    divisibilityFactorialEquiv f (divisibilityAffineInclusion f n x) =
      factorialAffineInclusion f i (affineDivisibility f _ _ h x) := by
  change factorialAffineExtension f n x = _
  rw [factorialAffineExtension.at_level f n i h]
  rfl

lemma divisibilityFactorialEquiv.root (f : A) (n : RootDivIndex) (i : ℕ)
    (h : n ≤ RootDivIndex.factorial i) :
    divisibilityFactorialEquiv f (divisibilityAffineInclusion f n (AdjoinRoot.root _)) =
      factorialAffineInclusion f i (AdjoinRoot.root _) ^
        (Nat.factorial (i+1) / n.exponent) := by
  rw [divisibilityFactorialEquiv.inclusion f n i h, affineDivisibility.root, map_pow]

end TauCeti.RootStack

namespace TauCeti.RootStack
variable {A : Type u} [CommRing A]

lemma divisibilityAffineInclusion.pow (f : A) (n : RootDivIndex) :
    divisibilityAffineInclusion f n (AdjoinRoot.root _) ^ n.exponent =
      algebraMap A (DivisibilityAffineColimit f) f := by
  rw [← map_pow, affineRoot.pow_eq, AlgHom.commutes]

lemma divisibilityAffineInclusion.root (f : A) {n N : RootDivIndex} (h : n ≤ N) :
    divisibilityAffineInclusion f n (AdjoinRoot.root _) =
      divisibilityAffineInclusion f N (AdjoinRoot.root _) ^ (N.exponent / n.exponent) := by
  rw [← divisibilityAffineInclusion.transition f h, affineDivisibility.root, map_pow]

-- rootDivIndex.test_zero
example (n : RootDivIndex) : n.exponent ≠ 0 := Nat.ne_of_gt n.positive

-- rootDivIndex.test_two_six
example : (⟨2, by decide⟩ : RootDivIndex) ≤ ⟨6, by decide⟩ := by decide

-- rootDivIndex.test_numeric_order
example : ¬ (⟨2, by decide⟩ : RootDivIndex) ≤ ⟨3, by decide⟩ := by decide

-- factorialAffineExtension.test_three_at_six
example (f : A) : factorialAffineExtension f ⟨3, by decide⟩ =
    (factorialAffineInclusion f 2).comp (affineDivisibility f 3 6 (by decide)) :=
  factorialAffineExtension.at_level f _ 2 (by decide)

-- factorialAffineExtension.test_choice
example (f : A) (x : AffineRing f 3) :
    factorialAffineInclusion f 2 (affineDivisibility f 3 6 (by decide) x) =
      factorialAffineInclusion f 3 (affineDivisibility f 3 24 (by decide) x) := by
  exact congrArg (fun z => z x) ((factorialAffineExtension.at_level f ⟨3, by decide⟩ 2
    (by decide)).symm.trans (factorialAffineExtension.at_level f _ 3 (by decide)))

-- factorialAffineExtension.test_one
example (f : A) : factorialAffineExtension f (RootDivIndex.factorial 0) =
    factorialAffineInclusion f 0 := factorialAffineExtension.factorial f 0

-- divisibilityAffineColimit.test_wild_nonzero
example : divisibilityAffineInclusion (0 : ZMod 2) ⟨2, by decide⟩ (AdjoinRoot.root _) ≠ 0 := by
  intro hz
  have heq := divisibilityAffineInclusion.injective (0 : ZMod 2) ⟨2, by decide⟩
    (hz.trans (map_zero _).symm)
  have h := (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
    (by decide : 2 ≠ 0))).basis.ne_zero
      (⟨1, by norm_num [AdjoinRoot.powerBasis'_dim]⟩ : Fin
        (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
          (by decide : 2 ≠ 0))).dim)
  apply h
  simpa only [PowerBasis.basis_eq_pow, AdjoinRoot.powerBasis'_gen, pow_one] using heq

-- divisibilityAffineColimit.test_wild_square
example : divisibilityAffineInclusion (0 : ZMod 2) ⟨2, by decide⟩ (AdjoinRoot.root _) ^ 2 = 0 := by
  simpa using divisibilityAffineInclusion.pow (0 : ZMod 2) ⟨2, by decide⟩

-- divisibilityAffineColimit.test_zero_ring
example (x : DivisibilityAffineColimit (0 : ZMod 1)) : x = 0 := by
  obtain ⟨n,y,rfl⟩ := divisibilityAffineColimit.exists_level _ x
  let : Subsingleton (AffineRing (0 : ZMod 1) n.exponent) := Module.subsingleton (ZMod 1) _
  rw [Subsingleton.elim y 0, map_zero]

-- divisibilityAffineInclusion.test_two_six
example (f : A) : divisibilityAffineInclusion f ⟨2, by decide⟩ (AdjoinRoot.root _) =
    divisibilityAffineInclusion f ⟨6, by decide⟩ (AdjoinRoot.root _) ^ 3 :=
  divisibilityAffineInclusion.root f (by decide)

-- divisibilityAffineInclusion.test_coefficients
example (f a : ZMod 4) :
    divisibilityAffineInclusion f ⟨3, by decide⟩ (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (DivisibilityAffineColimit f) a := AlgHom.commutes _ _

-- divisibilityAffineInclusion.test_identity
example (f : A) (n : RootDivIndex) (x : AffineRing f n.exponent) :
    divisibilityAffineInclusion f n (affineDivisibility f n.exponent n.exponent (dvd_refl _) x) =
      divisibilityAffineInclusion f n x :=
  divisibilityAffineInclusion.transition f (dvd_refl _) x

-- divisibilityToFactorial.test_three
example (f : A) : divisibilityToFactorial f
    (divisibilityAffineInclusion f ⟨3, by decide⟩ (AdjoinRoot.root _)) =
      factorialAffineInclusion f 2 (AdjoinRoot.root _) ^ 2 := by
  rw [divisibilityToFactorial.inclusion,
    factorialAffineExtension.at_level f _ 2 (by decide)]
  change factorialAffineInclusion f 2
    (affineDivisibility f 3 6 (by decide) (AdjoinRoot.root _)) = _
  rw [affineDivisibility.root]
  change factorialAffineInclusion f 2
    (AdjoinRoot.root (Polynomial.X ^ Nat.factorial (2+1) - Polynomial.C f) ^ 2) = _
  exact map_pow _ _ _

-- divisibilityToFactorial.test_coefficients
example (f a : ZMod 4) :
    divisibilityToFactorial f (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (FactorialAffineColimit f) a := AlgHom.commutes _ _

-- divisibilityToFactorial.test_factorial
example (f : A) (i : ℕ) (x : AffineRing f (Nat.factorial (i+1))) :
    divisibilityToFactorial f
      (divisibilityAffineInclusion f (RootDivIndex.factorial i) x) =
        factorialAffineInclusion f i x := by
  rw [divisibilityToFactorial.inclusion, factorialAffineExtension.factorial]

-- factorialToDivisibility.test_root
example (f : A) : factorialToDivisibility f (factorialAffineInclusion f 1 (AdjoinRoot.root _)) =
    divisibilityAffineInclusion f ⟨2, by decide⟩ (AdjoinRoot.root _) := rfl

-- factorialToDivisibility.test_coefficients
example (f a : ZMod 4) :
    factorialToDivisibility f (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (DivisibilityAffineColimit f) a := AlgHom.commutes _ _

-- factorialToDivisibility.test_zero
example : factorialToDivisibility (0 : ZMod 1) 0 = 0 := map_zero _

-- divisibilityFactorialEquiv.test_three
example (f : A) : divisibilityFactorialEquiv f
    (divisibilityAffineInclusion f ⟨3, by decide⟩ (AdjoinRoot.root _)) =
      factorialAffineInclusion f 2 (AdjoinRoot.root _) ^ 2 :=
  by simpa only [show Nat.factorial (2+1) / 3 = 2 by decide] using
    divisibilityFactorialEquiv.root f ⟨3, by decide⟩ 2 (by decide)

-- divisibilityFactorialEquiv.test_coefficients
example (f a : ZMod 4) :
    divisibilityFactorialEquiv f (algebraMap (ZMod 4) _ a) =
      algebraMap (ZMod 4) (FactorialAffineColimit f) a := AlgEquiv.commutes _ _

-- divisibilityFactorialEquiv.test_inverse
example (f : A) (x : DivisibilityAffineColimit f) :
    (divisibilityFactorialEquiv f).symm (divisibilityFactorialEquiv f x) = x :=
  AlgEquiv.symm_apply_apply _ _

#print axioms RootDivIndex.cofinal
#print axioms RootDivIndex.factorial_mono
#print axioms factorialAffineInclusion.comp_transition
#print axioms factorialAffineExtension
#print axioms factorialAffineExtension.at_level
#print axioms factorialAffineExtension.transition
#print axioms factorialAffineExtension.factorial
#print axioms factorialAffineExtension.injective
#print axioms divisibilityAffineDirected
#print axioms divisibilityAffineInclusion
#print axioms divisibilityAffineInclusion.transition
#print axioms divisibilityAffineInclusion.injective
#print axioms divisibilityAffineColimit.exists_level
#print axioms divisibilityAffineColimit.hom_ext
#print axioms divisibilityToFactorial
#print axioms divisibilityToFactorial.inclusion
#print axioms factorialToDivisibility
#print axioms factorialToDivisibility.inclusion
#print axioms divisibilityToFactorial.left_inverse
#print axioms divisibilityToFactorial.right_inverse
#print axioms divisibilityFactorialEquiv
#print axioms divisibilityFactorialEquiv.inclusion
#print axioms divisibilityFactorialEquiv.root
#print axioms divisibilityAffineInclusion.pow
#print axioms divisibilityAffineInclusion.root
end TauCeti.RootStack

namespace TauCeti.RootStack
section FactorialScaling
variable {A : Type u} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

/-- Coherent actual unit-valued points on the factorial root-of-unity tower. -/
def factorialRootScalars (A : Type u) [CommRing A] : Subgroup (ℕ → Aˣ) where
  carrier := {s | (∀ i, s i ^ Nat.factorial (i+1) = 1) ∧
    ∀ i j, i ≤ j → s j ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = s i}
  one_mem' := by constructor <;> intros <;> simp
  mul_mem' := by
    rintro s t ⟨hs,hsc⟩ ⟨ht,htc⟩
    constructor
    · intro i; change (s i * t i) ^ _ = 1; rw [mul_pow, hs, ht, one_mul]
    · intro i j h; change (s j * t j) ^ _ = s i * t i; rw [mul_pow, hsc i j h, htc i j h]
  inv_mem' := by
    rintro s ⟨hs,hsc⟩
    constructor
    · intro i; change (s i)⁻¹ ^ _ = 1; rw [inv_pow, hs, inv_one]
    · intro i j h; change (s j)⁻¹ ^ _ = (s i)⁻¹; rw [inv_pow, hsc i j h]

lemma factorialRootScalars.pow (s : factorialRootScalars A) (i : ℕ) :
    ((s.val i : Aˣ) : A) ^ Nat.factorial (i+1) = 1 := by
  exact congrArg (fun x : Aˣ => (x : A)) (s.property.1 i)

lemma factorialRootScalars.transition (s : factorialRootScalars A) {i j : ℕ} (h : i ≤ j) :
    ((s.val j : Aˣ) : A) ^ (Nat.factorial (j+1) / Nat.factorial (i+1)) = (s.val i : A) := by
  exact congrArg (fun x : Aˣ => (x : A)) (s.property.2 i j h)

def factorialScale (f : A) (s : factorialRootScalars A) :
    FactorialAffineColimit f →ₐ[A] FactorialAffineColimit f :=
  factorialAffineRootLift f
    (fun i => algebraMap A _ (s.val i : A) * factorialAffineInclusion f i (AdjoinRoot.root _))
    (by intro i; rw [mul_pow, ← map_pow, factorialRootScalars.pow, map_one,
      one_mul, factorialAffineInclusion.pow])
    (by intro i j h; rw [mul_pow, ← map_pow, factorialRootScalars.transition s h,
      ← factorialAffineInclusion.root f h])

lemma factorialScale.root (f : A) (s : factorialRootScalars A) (i : ℕ) :
    factorialScale f s (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      algebraMap A _ (s.val i : A) * factorialAffineInclusion f i (AdjoinRoot.root _) :=
  factorialAffineRootLift.root _ _ _ _ _

lemma factorialScale.constant (f a : A) (s : factorialRootScalars A) :
    factorialScale f s (algebraMap A _ a) = algebraMap A _ a := (factorialScale f s).commutes a

lemma factorialScale.one (f : A) : factorialScale f 1 = AlgHom.id A _ := by
  apply factorialAffineColimit.hom_ext
  intro i
  rw [factorialScale.root]
  simp

lemma factorialScale.mul (f : A) (s t : factorialRootScalars A) :
    factorialScale f (s*t) = (factorialScale f s).comp (factorialScale f t) := by
  apply factorialAffineColimit.hom_ext
  intro i
  simp only [factorialScale.root, AlgHom.comp_apply, map_mul, AlgHom.commutes]
  change algebraMap A _ ((s.val i : A) * (t.val i : A)) * _ = _
  rw [map_mul]
  ring

def factorialScaleEquiv (f : A) (s : factorialRootScalars A) :
    FactorialAffineColimit f ≃ₐ[A] FactorialAffineColimit f :=
  AlgEquiv.ofAlgHom (factorialScale f s) (factorialScale f s⁻¹)
    (by rw [← factorialScale.mul, mul_inv_cancel, factorialScale.one])
    (by rw [← factorialScale.mul, inv_mul_cancel, factorialScale.one])

lemma factorialScaleEquiv.root (f : A) (s : factorialRootScalars A) (i : ℕ) :
    factorialScaleEquiv f s (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      algebraMap A _ (s.val i : A) * factorialAffineInclusion f i (AdjoinRoot.root _) :=
  factorialScale.root f s i

lemma factorialScaleEquiv.inverse_root (f : A) (s : factorialRootScalars A) (i : ℕ) :
    (factorialScaleEquiv f s).symm (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      algebraMap A _ ((s⁻¹).val i : A) * factorialAffineInclusion f i (AdjoinRoot.root _) :=
  factorialScale.root f s⁻¹ i

def factorialUniversalScalars (A : Type u) [CommRing A] :
    factorialRootScalars (FactorialAffineColimit (1 : A)) := by
  refine ⟨fun i => (rootsOfUnity.mkOfPowEq
    (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _))
    (by simpa using factorialAffineInclusion.pow (1 : A) i)).val, ?_, ?_⟩
  · intro i; exact (rootsOfUnity.mkOfPowEq _
      (by simpa using factorialAffineInclusion.pow (1 : A) i)).property
  · intro i j h
    apply Units.val_injective
    exact (factorialAffineInclusion.root (1 : A) h).symm

lemma factorialUniversalScalars.value (i : ℕ) :
    (((factorialUniversalScalars A).val i : (FactorialAffineColimit (1 : A))ˣ) :
      FactorialAffineColimit (1 : A)) = factorialAffineInclusion (1 : A) i (AdjoinRoot.root _) := rfl

end FactorialScaling
end TauCeti.RootStack

namespace TauCeti.RootStack
section ScalingTests
variable {A : Type u} [CommRing A]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

-- test: factorialRootScalars.test_one
example (i : ℕ) : ((1 : factorialRootScalars A).val i : Aˣ) = 1 := rfl

-- test: factorialRootScalars.test_inverse
example (s : factorialRootScalars A) (i : ℕ) :
    ((s⁻¹).val i : Aˣ) * (s.val i : Aˣ) = 1 := inv_mul_cancel _

-- test: factorialRootScalars.test_individual_roots
example (i : ℕ) :
    (if i = 1 then (-1 : ℤˣ) else 1) ^ Nat.factorial (i+1) = 1 := by
  by_cases hi : i = 1
  · subst i; norm_num
  · simp [hi]

-- test: factorialRootScalars.test_incoherent
example :
    (fun i : ℕ => if i = 1 then (-1 : ℤˣ) else 1) ∉ factorialRootScalars ℤ := by
  intro h
  have hc := h.2 1 2 (by decide)
  norm_num at hc

-- test: factorialScale.test_one
example (f : A) (x : FactorialAffineColimit f) : factorialScale f 1 x = x := by
  rw [factorialScale.one]
  rfl

-- test: factorialScale.test_constant
example (s : factorialRootScalars (ZMod 4)) :
    factorialScale (2 : ZMod 4) s (algebraMap (ZMod 4) _ (3 : ZMod 4)) =
      algebraMap (ZMod 4) _ (3 : ZMod 4) := factorialScale.constant _ _ _

-- test: factorialScale.test_composition
example (f : A) (s t : factorialRootScalars A) (x : FactorialAffineColimit f) :
    factorialScale f (s*t) x = factorialScale f s (factorialScale f t x) :=
  congrArg (fun k => k x) (factorialScale.mul f s t)

-- test: factorialScaleEquiv.test_roundtrip
example (f : A) (s : factorialRootScalars A) (x : FactorialAffineColimit f) :
    (factorialScaleEquiv f s).symm (factorialScaleEquiv f s x) = x :=
  (factorialScaleEquiv f s).symm_apply_apply x

-- test: factorialScaleEquiv.test_root
example (f : A) (s : factorialRootScalars A) :
    factorialScaleEquiv f s (factorialAffineInclusion f 1 (AdjoinRoot.root _)) =
      algebraMap A _ (s.val 1 : A) * factorialAffineInclusion f 1 (AdjoinRoot.root _) :=
  factorialScaleEquiv.root f s 1

-- test: factorialScaleEquiv.test_wild_zero
example (s : factorialRootScalars (ZMod 2)) :
    factorialScaleEquiv (0 : ZMod 2) s (factorialAffineInclusion (0 : ZMod 2) 1
      (AdjoinRoot.root _)) ≠ 0 := by
  rw [← (factorialScaleEquiv (0 : ZMod 2) s).map_zero]
  apply (factorialScaleEquiv (0 : ZMod 2) s).injective.ne
  intro hz
  have heq := factorialAffineInclusion.injective (0 : ZMod 2) 1
    (hz.trans (map_zero _).symm)
  have h := (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
    (Nat.factorial_ne_zero (1+1)))).basis.ne_zero
      (⟨1, by norm_num [AdjoinRoot.powerBasis'_dim]⟩ : Fin
        (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
          (Nat.factorial_ne_zero (1+1)))).dim)
  apply h
  simpa only [PowerBasis.basis_eq_pow, AdjoinRoot.powerBasis'_gen, pow_one] using heq

-- test: factorialUniversalScalars.test_root
example : (((factorialUniversalScalars (ZMod 4)).val 1 :
    (FactorialAffineColimit (1 : ZMod 4))ˣ) : FactorialAffineColimit (1 : ZMod 4)) ^ 2 = 1 := by
  simpa using factorialRootScalars.pow (factorialUniversalScalars (ZMod 4)) 1

-- test: factorialUniversalScalars.test_nontrivial
example : (factorialUniversalScalars (ZMod 3)).val 1 ≠ 1 := by
  intro h
  have hc := congrArg (fun x : (FactorialAffineColimit (1 : ZMod 3))ˣ =>
    (x : FactorialAffineColimit (1 : ZMod 3))) h
  rw [factorialUniversalScalars.value] at hc
  have heq := factorialAffineInclusion.injective (1 : ZMod 3) 1
    (hc.trans (map_one _).symm)
  change AdjoinRoot.root (Polynomial.X ^ 2 - Polynomial.C (1 : ZMod 3)) = 1 at heq
  let e : AffineRing (1 : ZMod 3) 2 →ₐ[ZMod 3] ZMod 3 :=
    AdjoinRoot.liftAlgHom _ (Algebra.ofId _ _) (-1) (by
      norm_num [Polynomial.eval₂_sub, Polynomial.eval₂_pow, Polynomial.eval₂_X,
        Polynomial.eval₂_C])
  have hroot : e (AdjoinRoot.root _) = (-1 : ZMod 3) :=
    AdjoinRoot.liftAlgHom_root _ _ _ _
  have hh : (-1 : ZMod 3) = 1 := by
    calc -1 = e (AdjoinRoot.root _) := hroot.symm
         _ = e 1 := congrArg e heq
         _ = 1 := e.map_one
  exact (by decide : (-1 : ZMod 3) ≠ 1) hh

-- test: factorialUniversalScalars.test_zero_ring
example : factorialUniversalScalars (ZMod 1) = 1 := by
  let : Subsingleton (FactorialAffineColimit (1 : ZMod 1)) := Module.subsingleton (ZMod 1) _
  exact Subsingleton.elim _ _

end ScalingTests
end TauCeti.RootStack

#print axioms TauCeti.RootStack.factorialRootScalars.transition
#print axioms TauCeti.RootStack.factorialScale
#print axioms TauCeti.RootStack.factorialScale.root
#print axioms TauCeti.RootStack.factorialScale.constant
#print axioms TauCeti.RootStack.factorialScale.one
#print axioms TauCeti.RootStack.factorialScale.mul
#print axioms TauCeti.RootStack.factorialScaleEquiv
#print axioms TauCeti.RootStack.factorialScaleEquiv.root
#print axioms TauCeti.RootStack.factorialScaleEquiv.inverse_root
#print axioms TauCeti.RootStack.factorialUniversalScalars
#print axioms TauCeti.RootStack.factorialUniversalScalars.value

namespace TauCeti.RootStack
section FactorialCoefficients
variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
local instance (i : ℕ) : NeZero (Nat.factorial (i+1)) := ⟨Nat.factorial_ne_zero _⟩

def factorialRootScalars.map (φ : A →+* B) :
    factorialRootScalars A →* factorialRootScalars B where
  toFun s := ⟨fun i => Units.map φ.toMonoidHom (s.val i), by
    constructor
    · intro i; rw [← map_pow, s.property.1, map_one]
    · intro i j h; rw [← map_pow, s.property.2 i j h]⟩
  map_one' := by apply Subtype.ext; funext i; exact map_one (Units.map φ.toMonoidHom)
  map_mul' s t := by apply Subtype.ext; funext i; exact map_mul (Units.map φ.toMonoidHom) _ _

lemma factorialRootScalars.map_value (φ : A →+* B) (s : factorialRootScalars A) (i : ℕ) :
    (((factorialRootScalars.map φ s).val i : Bˣ) : B) = φ (s.val i : A) := rfl

lemma factorialRootScalars.map_id :
    factorialRootScalars.map (RingHom.id A) = MonoidHom.id (factorialRootScalars A) := by
  ext s i
  rfl

lemma factorialRootScalars.map_comp (φ : A →+* B) (ψ : B →+* C) :
    factorialRootScalars.map (ψ.comp φ) =
      (factorialRootScalars.map ψ).comp (factorialRootScalars.map φ) := by
  ext s i
  rfl

lemma factorialAffineColimit.ringHom_ext (f : A) (φ : A →+* B)
    (g h : FactorialAffineColimit f →+* B)
    (hg : ∀ a, g (algebraMap A _ a) = φ a)
    (hh : ∀ a, h (algebraMap A _ a) = φ a)
    (hr : ∀ i, g (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      h (factorialAffineInclusion f i (AdjoinRoot.root _))) : g = h := by
  let : Algebra A B := φ.toAlgebra
  let ga : FactorialAffineColimit f →ₐ[A] B := {g with commutes' := hg}
  let ha : FactorialAffineColimit f →ₐ[A] B := {h with commutes' := hh}
  exact congrArg AlgHom.toRingHom (factorialAffineColimit.hom_ext f ga ha hr)

def factorialCoefficientMap (φ : A →+* B) (f : A) :
    FactorialAffineColimit f →+* FactorialAffineColimit (φ f) := by
  letI : Algebra A (FactorialAffineColimit (φ f)) :=
    ((algebraMap B _).comp φ).toAlgebra
  exact (factorialAffineRootLift f
    (fun i => factorialAffineInclusion (φ f) i (AdjoinRoot.root _))
    (fun i => factorialAffineInclusion.pow (φ f) i)
    (fun i j h => (factorialAffineInclusion.root (φ f) h).symm)).toRingHom

lemma factorialCoefficientMap.root (φ : A →+* B) (f : A) (i : ℕ) :
    factorialCoefficientMap φ f (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      factorialAffineInclusion (φ f) i (AdjoinRoot.root _) := by
  let : Algebra A (FactorialAffineColimit (φ f)) :=
    ((algebraMap B _).comp φ).toAlgebra
  unfold factorialCoefficientMap
  exact factorialAffineRootLift.root _ _ _ _ _

lemma factorialCoefficientMap.constant (φ : A →+* B) (f a : A) :
    factorialCoefficientMap φ f (algebraMap A _ a) =
      algebraMap B _ (φ a) := by
  let : Algebra A (FactorialAffineColimit (φ f)) :=
    ((algebraMap B _).comp φ).toAlgebra
  unfold factorialCoefficientMap
  exact (factorialAffineRootLift _ _ _ _).commutes a

lemma factorialCoefficientMap.id (f : A) :
    factorialCoefficientMap (RingHom.id A) f = RingHom.id (FactorialAffineColimit f) := by
  apply factorialAffineColimit.ringHom_ext f (algebraMap A _)
  · exact factorialCoefficientMap.constant _ f
  · intro a; rfl
  · intro i; exact factorialCoefficientMap.root _ f i

lemma factorialCoefficientMap.comp (φ : A →+* B) (ψ : B →+* C) (f : A) :
    factorialCoefficientMap (ψ.comp φ) f =
      (factorialCoefficientMap ψ (φ f)).comp (factorialCoefficientMap φ f) := by
  apply factorialAffineColimit.ringHom_ext f ((algebraMap C _).comp (ψ.comp φ))
  · intro a
    change factorialCoefficientMap (ψ.comp φ) f (algebraMap A _ a) =
      algebraMap C _ (ψ (φ a))
    exact factorialCoefficientMap.constant _ f a
  · intro a
    change factorialCoefficientMap ψ (φ f) (factorialCoefficientMap φ f
      (algebraMap A _ a)) = algebraMap C _ (ψ (φ a))
    rw [factorialCoefficientMap.constant, factorialCoefficientMap.constant]
  · intro i
    change factorialCoefficientMap (ψ.comp φ) f
      (factorialAffineInclusion f i (AdjoinRoot.root _)) =
        factorialCoefficientMap ψ (φ f) (factorialCoefficientMap φ f
          (factorialAffineInclusion f i (AdjoinRoot.root _)))
    simp only [factorialCoefficientMap.root]
    rfl

lemma factorialScale.coefficient_naturality (φ : A →+* B) (f : A)
    (s : factorialRootScalars A) :
    (factorialCoefficientMap φ f).comp (factorialScale f s).toRingHom =
      (factorialScale (φ f) (factorialRootScalars.map φ s)).toRingHom.comp
        (factorialCoefficientMap φ f) := by
  apply factorialAffineColimit.ringHom_ext f ((algebraMap B _).comp φ)
  · intro a
    change factorialCoefficientMap φ f (factorialScale f s (algebraMap A _ a)) =
      algebraMap B _ (φ a)
    rw [factorialScale.constant, factorialCoefficientMap.constant]
  · intro a
    change factorialScale (φ f) (factorialRootScalars.map φ s)
      (factorialCoefficientMap φ f (algebraMap A _ a)) = algebraMap B _ (φ a)
    rw [factorialCoefficientMap.constant, factorialScale.constant]
  · intro i
    simp only [RingHom.comp_apply, AlgHom.toRingHom_eq_coe, RingHom.coe_coe,
      factorialScale.root, map_mul, factorialCoefficientMap.constant,
      factorialCoefficientMap.root, factorialRootScalars.map_value]

lemma factorialScaleEquiv.coefficient_naturality (φ : A →+* B) (f : A)
    (s : factorialRootScalars A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f (factorialScaleEquiv f s x) =
      factorialScaleEquiv (φ f) (factorialRootScalars.map φ s)
        (factorialCoefficientMap φ f x) :=
  congrArg (fun k => k x) (factorialScale.coefficient_naturality φ f s)

lemma factorialScaleEquiv.inverse_coefficient_naturality (φ : A →+* B) (f : A)
    (s : factorialRootScalars A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f ((factorialScaleEquiv f s).symm x) =
      (factorialScaleEquiv (φ f) (factorialRootScalars.map φ s)).symm
        (factorialCoefficientMap φ f x) := by
  change factorialCoefficientMap φ f (factorialScale f s⁻¹ x) =
    factorialScale (φ f) (factorialRootScalars.map φ s)⁻¹ (factorialCoefficientMap φ f x)
  rw [← map_inv]
  exact congrArg (fun k => k x) (factorialScale.coefficient_naturality φ f s⁻¹)

-- test: factorialCoefficientTests.scalar_value
example (φ : A →+* B) (s : factorialRootScalars A) (i : ℕ) :
    (((factorialRootScalars.map φ s).val i : Bˣ) : B) = φ (s.val i : A) := rfl

-- test: factorialCoefficientTests.scalar_one
example (φ : A →+* B) : factorialRootScalars.map φ 1 = 1 := map_one _

-- test: factorialCoefficientTests.scalar_inverse
example (φ : A →+* B) (s : factorialRootScalars A) :
    factorialRootScalars.map φ s⁻¹ = (factorialRootScalars.map φ s)⁻¹ := map_inv _ _

-- test: factorialCoefficientTests.identity
example (f : A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap (RingHom.id A) f x = x := by
  rw [factorialCoefficientMap.id]; rfl

-- test: factorialCoefficientTests.root
example (φ : A →+* B) (f : A) :
    factorialCoefficientMap φ f (factorialAffineInclusion f 1 (AdjoinRoot.root _)) =
      factorialAffineInclusion (φ f) 1 (AdjoinRoot.root _) := factorialCoefficientMap.root _ _ _

-- test: factorialCoefficientTests.composition
example (φ : A →+* B) (ψ : B →+* C) (f : A) (x : FactorialAffineColimit f) :
    factorialCoefficientMap (ψ.comp φ) f x =
      factorialCoefficientMap ψ (φ f) (factorialCoefficientMap φ f x) :=
  congrArg (fun k => k x) (factorialCoefficientMap.comp φ ψ f)

-- test: factorialCoefficientTests.zero_ring
example (φ : ℤ →+* ZMod 1) (f : ℤ) (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f x = 0 := by
  have hz : (1 : FactorialAffineColimit (φ f)) = 0 := by
    calc
      (1 : FactorialAffineColimit (φ f)) = algebraMap (ZMod 1) _ 1 := (map_one _).symm
      _ = algebraMap (ZMod 1) _ 0 := congrArg (algebraMap (ZMod 1) _) (by decide)
      _ = 0 := map_zero _
  calc
    factorialCoefficientMap φ f x = 1 * factorialCoefficientMap φ f x := (one_mul _).symm
    _ = 0 := by rw [hz, zero_mul]

-- test: factorialCoefficientTests.mod_two
example : factorialCoefficientMap (Int.castRingHom (ZMod 2)) (0 : ℤ)
    (algebraMap ℤ _ (2 : ℤ)) = 0 := by
  rw [factorialCoefficientMap.constant]
  change algebraMap (ZMod 2) _ (2 : ZMod 2) = 0
  have hz : (2 : ZMod 2) = 0 := by decide
  rw [hz, map_zero]
  exact map_zero _

-- test: factorialCoefficientTests.scaling_square
example (φ : A →+* B) (f : A) (s : factorialRootScalars A)
    (x : FactorialAffineColimit f) :
    factorialCoefficientMap φ f (factorialScaleEquiv f s x) =
      factorialScaleEquiv (φ f) (factorialRootScalars.map φ s)
        (factorialCoefficientMap φ f x) :=
  factorialScaleEquiv.coefficient_naturality φ f s x

end FactorialCoefficients
end TauCeti.RootStack

#print axioms TauCeti.RootStack.factorialRootScalars.map
#print axioms TauCeti.RootStack.factorialRootScalars.map_value
#print axioms TauCeti.RootStack.factorialRootScalars.map_id
#print axioms TauCeti.RootStack.factorialRootScalars.map_comp
#print axioms TauCeti.RootStack.factorialAffineColimit.ringHom_ext
#print axioms TauCeti.RootStack.factorialCoefficientMap
#print axioms TauCeti.RootStack.factorialCoefficientMap.root
#print axioms TauCeti.RootStack.factorialCoefficientMap.constant
#print axioms TauCeti.RootStack.factorialCoefficientMap.id
#print axioms TauCeti.RootStack.factorialCoefficientMap.comp
#print axioms TauCeti.RootStack.factorialScale.coefficient_naturality
#print axioms TauCeti.RootStack.factorialScaleEquiv.coefficient_naturality
#print axioms TauCeti.RootStack.factorialScaleEquiv.inverse_coefficient_naturality

/-! Universal factorial root coaction — Codex codex-a71f92. -/
namespace TauCeti.RootStack
section FactorialUniversalCoaction
variable {A : Type u} [CommRing A]
open scoped TensorProduct

def factorialCoaction (f : A) :
    FactorialAffineColimit f →ₐ[A]
      (FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f) :=
  factorialAffineRootLift f
    (fun i => factorialAffineInclusion (1 : A) i (AdjoinRoot.root _) ⊗ₜ[A]
      factorialAffineInclusion f i (AdjoinRoot.root _))
    (by
      intro i
      simp only [Algebra.TensorProduct.tmul_pow, factorialAffineInclusion.pow,
        map_one]
      exact (Algebra.TensorProduct.includeRight :
        FactorialAffineColimit f →ₐ[A]
          FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f).commutes f)
    (by
      intro i j h
      rw [Algebra.TensorProduct.tmul_pow, ← factorialAffineInclusion.root (1 : A) h,
        ← factorialAffineInclusion.root f h])

lemma factorialCoaction.root (f : A) (i : ℕ) :
    factorialCoaction f (factorialAffineInclusion f i (AdjoinRoot.root _)) =
      factorialAffineInclusion (1 : A) i (AdjoinRoot.root _) ⊗ₜ[A]
        factorialAffineInclusion f i (AdjoinRoot.root _) :=
  factorialAffineRootLift.root _ _ _ _ _

lemma factorialCoaction.constant (f a : A) :
    factorialCoaction f (algebraMap A _ a) =
      (1 : FactorialAffineColimit (1 : A)) ⊗ₜ[A]
        algebraMap A (FactorialAffineColimit f) a := by
  rw [(factorialCoaction f).commutes]
  exact (Algebra.TensorProduct.includeRight :
    FactorialAffineColimit f →ₐ[A]
      FactorialAffineColimit (1 : A) ⊗[A] FactorialAffineColimit f).commutes a |>.symm

def factorialCounit (A : Type u) [CommRing A] :
    FactorialAffineColimit (1 : A) →ₐ[A] A :=
  factorialAffineRootLift (1 : A) (fun _ => 1)
    (by intro i; simp) (by intro i j h; simp)

lemma factorialCounit.root (i : ℕ) :
    factorialCounit A (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) = 1 :=
  factorialAffineRootLift.root _ _ _ _ _

lemma factorialCounit.constant (a : A) :
    factorialCounit A (algebraMap A _ a) = a := by
  exact (factorialCounit A).commutes a

lemma factorialCounit.surjective : Function.Surjective (factorialCounit A) := by
  intro a
  exact ⟨algebraMap A _ a, factorialCounit.constant a⟩

lemma factorialCoaction.counit (f : A) :
    ((Algebra.TensorProduct.lid A (FactorialAffineColimit f)).toAlgHom.comp
      (Algebra.TensorProduct.map (factorialCounit A)
        (AlgHom.id A (FactorialAffineColimit f)))).comp (factorialCoaction f) =
      AlgHom.id A (FactorialAffineColimit f) := by
  apply factorialAffineColimit.hom_ext f
  intro i
  simp [AlgHom.comp_apply, factorialCoaction.root, factorialCounit.root]

lemma factorialCoaction.coassoc (f : A) :
    (Algebra.TensorProduct.assoc A A A
      (FactorialAffineColimit (1 : A)) (FactorialAffineColimit (1 : A))
      (FactorialAffineColimit f)).toAlgHom.comp
      ((Algebra.TensorProduct.map (factorialCoaction (1 : A))
        (AlgHom.id A (FactorialAffineColimit f))).comp (factorialCoaction f)) =
      (Algebra.TensorProduct.map (AlgHom.id A (FactorialAffineColimit (1 : A)))
        (factorialCoaction f)).comp (factorialCoaction f) := by
  apply DirectLimit.Algebra.hom_ext
  intro i
  apply AdjoinRoot.algHom_ext
  change (Algebra.TensorProduct.assoc A A A
    (FactorialAffineColimit (1 : A)) (FactorialAffineColimit (1 : A))
    (FactorialAffineColimit f))
    (Algebra.TensorProduct.map (factorialCoaction (1 : A))
      (AlgHom.id A (FactorialAffineColimit f))
        (factorialCoaction f (factorialAffineInclusion f i (AdjoinRoot.root _)))) =
    Algebra.TensorProduct.map (AlgHom.id A (FactorialAffineColimit (1 : A)))
      (factorialCoaction f)
        (factorialCoaction f (factorialAffineInclusion f i (AdjoinRoot.root _)))
  simp [factorialCoaction.root]

lemma factorialCoaction.right_counit :
    ((Algebra.TensorProduct.rid A A (FactorialAffineColimit (1 : A))).toAlgHom.comp
      (Algebra.TensorProduct.map (AlgHom.id A (FactorialAffineColimit (1 : A)))
        (factorialCounit A))).comp (factorialCoaction (1 : A)) =
      AlgHom.id A (FactorialAffineColimit (1 : A)) := by
  apply factorialAffineColimit.hom_ext
  intro i
  simp [AlgHom.comp_apply, factorialCoaction.root, factorialCounit.root]

lemma factorialCoaction.cocomm :
    (Algebra.TensorProduct.comm A (FactorialAffineColimit (1 : A))
      (FactorialAffineColimit (1 : A))).toAlgHom.comp (factorialCoaction (1 : A)) =
        factorialCoaction (1 : A) := by
  apply factorialAffineColimit.hom_ext
  intro i
  simp [AlgHom.comp_apply, factorialCoaction.root]

def factorialAntipode (A : Type u) [CommRing A] :
    FactorialAffineColimit (1 : A) →ₐ[A] FactorialAffineColimit (1 : A) :=
  factorialAffineRootLift (1 : A)
    (fun i => (((factorialUniversalScalars A)⁻¹).val i :
      FactorialAffineColimit (1 : A)))
    (by
      intro i
      simpa using factorialRootScalars.pow ((factorialUniversalScalars A)⁻¹) i)
    (by
      intro i j h
      exact factorialRootScalars.transition ((factorialUniversalScalars A)⁻¹) h)

lemma factorialAntipode.root (i : ℕ) :
    factorialAntipode A (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) =
      (((factorialUniversalScalars A)⁻¹).val i : FactorialAffineColimit (1 : A)) :=
  factorialAffineRootLift.root _ _ _ _ _

lemma factorialAntipode.left_inverse :
    (Algebra.TensorProduct.lift (factorialAntipode A)
      (AlgHom.id A (FactorialAffineColimit (1 : A)))
      (fun _ _ => Commute.all _ _)).comp (factorialCoaction (1 : A)) =
        (Algebra.ofId A (FactorialAffineColimit (1 : A))).comp (factorialCounit A) := by
  apply factorialAffineColimit.hom_ext
  intro i
  simp only [AlgHom.comp_apply, factorialCoaction.root, Algebra.TensorProduct.lift_tmul,
    factorialAntipode.root, AlgHom.id_apply, factorialCounit.root, map_one]
  rw [← factorialUniversalScalars.value]
  exact Units.inv_mul _

lemma factorialAntipode.right_inverse :
    (Algebra.TensorProduct.lift (AlgHom.id A (FactorialAffineColimit (1 : A)))
      (factorialAntipode A) (fun _ _ => Commute.all _ _)).comp
        (factorialCoaction (1 : A)) =
        (Algebra.ofId A (FactorialAffineColimit (1 : A))).comp (factorialCounit A) := by
  apply factorialAffineColimit.hom_ext
  intro i
  simp only [AlgHom.comp_apply, factorialCoaction.root, Algebra.TensorProduct.lift_tmul,
    factorialAntipode.root, AlgHom.id_apply, factorialCounit.root, map_one]
  rw [← factorialUniversalScalars.value]
  exact Units.mul_inv _

lemma factorialAntipode.involutive :
    (factorialAntipode A).comp (factorialAntipode A) =
      AlgHom.id A (FactorialAffineColimit (1 : A)) := by
  apply factorialAffineColimit.hom_ext
  intro i
  have h := factorialAntipode.right_inverse (A := A)
  have hr := congrArg (fun k => k (factorialAffineInclusion (1 : A) i
    (AdjoinRoot.root _))) h
  simp only [AlgHom.comp_apply, factorialCoaction.root, Algebra.TensorProduct.lift_tmul,
    AlgHom.id_apply, factorialCounit.root, map_one] at hr
  have hu : IsUnit (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) :=
    (factorialUniversalScalars A).val i |>.isUnit
  have him : IsUnit (factorialAntipode A
    (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _))) :=
    hu.map (factorialAntipode A).toMonoidHom
  have hmap := congrArg (factorialAntipode A) hr
  simp only [map_mul, map_one] at hmap
  change factorialAntipode A (factorialAntipode A
    (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _))) =
      factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)
  apply him.mul_left_cancel
  exact hmap.trans ((mul_comm _ _).trans hr).symm

def factorialScalarEvaluation {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) :
    FactorialAffineColimit (1 : A) →ₐ[A] B :=
  factorialAffineRootLift (1 : A) (fun i => (s.val i : B))
    (by intro i; simpa using factorialRootScalars.pow s i)
    (by intro i j h; exact factorialRootScalars.transition s h)

lemma factorialScalarEvaluation.root {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) (i : ℕ) :
    factorialScalarEvaluation (A := A) s
      (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) = (s.val i : B) :=
  factorialAffineRootLift.root _ _ _ _ _

lemma factorialScalarEvaluation.constant {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) (a : A) :
    factorialScalarEvaluation (A := A) s (algebraMap A _ a) = algebraMap A B a :=
  AlgHom.commutes _ _

lemma factorialScalarEvaluation.universal :
    factorialScalarEvaluation (A := A) (factorialUniversalScalars A) =
      AlgHom.id A (FactorialAffineColimit (1 : A)) := by
  apply factorialAffineColimit.hom_ext
  intro i
  rw [factorialScalarEvaluation.root, factorialUniversalScalars.value]
  rfl

def factorialScalarPoints {B : Type u} [CommRing B] [Algebra A B] :
    (FactorialAffineColimit (1 : A) →ₐ[A] B) ≃ factorialRootScalars B where
  toFun p := factorialRootScalars.map p.toRingHom (factorialUniversalScalars A)
  invFun s := factorialScalarEvaluation s
  left_inv p := by
    apply factorialAffineColimit.hom_ext
    intro i
    rw [factorialScalarEvaluation.root, factorialRootScalars.map_value,
      factorialUniversalScalars.value]
    rfl
  right_inv s := by
    apply Subtype.ext
    funext i
    apply Units.val_injective
    rw [factorialRootScalars.map_value, factorialUniversalScalars.value]
    change factorialScalarEvaluation (A := A) s
      (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) = (s.val i : B)
    exact factorialScalarEvaluation.root s i

lemma factorialScalarPoints.value {B : Type u} [CommRing B] [Algebra A B]
    (p : FactorialAffineColimit (1 : A) →ₐ[A] B) (i : ℕ) :
    (((factorialScalarPoints p).val i : Bˣ) : B) =
      p (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _)) := by
  change (((factorialRootScalars.map p.toRingHom (factorialUniversalScalars A)).val i :
    Bˣ) : B) = p (factorialAffineInclusion (1 : A) i (AdjoinRoot.root _))
  rw [factorialRootScalars.map_value, factorialUniversalScalars.value]
  rfl

lemma factorialScalarPoints.naturality {B C : Type u} [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (p : FactorialAffineColimit (1 : A) →ₐ[A] B)
    (k : B →ₐ[A] C) :
    factorialScalarPoints (k.comp p) =
      factorialRootScalars.map k.toRingHom (factorialScalarPoints p) := by
  apply Subtype.ext
  funext i
  apply Units.val_injective
  simp only [factorialScalarPoints.value, factorialRootScalars.map_value,
    AlgHom.comp_apply]
  rfl

lemma factorialScalarPoints.left_inverse {B : Type u} [CommRing B] [Algebra A B]
    (p : FactorialAffineColimit (1 : A) →ₐ[A] B) :
    factorialScalarEvaluation (factorialScalarPoints p) = p :=
  (factorialScalarPoints (A := A) (B := B)).symm_apply_apply p

lemma factorialScalarPoints.right_inverse {B : Type u} [CommRing B] [Algebra A B]
    (s : factorialRootScalars B) :
    factorialScalarPoints (factorialScalarEvaluation (A := A) s) = s :=
  (factorialScalarPoints (A := A) (B := B)).apply_symm_apply s

lemma factorialCoaction.specialization (f : A) (s : factorialRootScalars A) :
    (Algebra.TensorProduct.lift
      ((Algebra.ofId A (FactorialAffineColimit f)).comp (factorialScalarEvaluation s))
      (AlgHom.id A (FactorialAffineColimit f))
      (fun _ _ => Commute.all _ _)).comp (factorialCoaction f) = factorialScale f s := by
  apply factorialAffineColimit.hom_ext
  intro i
  simp [AlgHom.comp_apply, factorialCoaction.root, factorialScalarEvaluation.root,
    factorialScale.root]

lemma factorialCoaction.injective (f : A) : Function.Injective (factorialCoaction f) := by
  intro x y h
  have hc := congrArg (fun g => g x) (factorialCoaction.counit f)
  have hd := congrArg (fun g => g y) (factorialCoaction.counit f)
  simp only [AlgHom.comp_apply, AlgHom.id_apply] at hc hd
  rw [← hc, ← hd, h]

abbrev factorialBialgebra (A : Type u) [CommRing A] :
    Bialgebra A (FactorialAffineColimit (1 : A)) :=
  Bialgebra.ofAlgHom (factorialCoaction (1 : A)) (factorialCounit A)
    (factorialCoaction.coassoc (1 : A))
    (by
      apply factorialAffineColimit.hom_ext
      intro i
      simp [AlgHom.comp_apply, factorialCoaction.root, factorialCounit.root])
    (by
      apply factorialAffineColimit.hom_ext
      intro i
      simp [AlgHom.comp_apply, factorialCoaction.root, factorialCounit.root])

lemma factorialBialgebra.comul :
    letI := factorialBialgebra A
    Bialgebra.comulAlgHom A (FactorialAffineColimit (1 : A)) =
      factorialCoaction (1 : A) := rfl

lemma factorialBialgebra.counit :
    letI := factorialBialgebra A
    Bialgebra.counitAlgHom A (FactorialAffineColimit (1 : A)) =
      factorialCounit A := rfl

abbrev factorialHopfAlgebra (A : Type u) [CommRing A] :
    letI := factorialBialgebra A
    HopfAlgebra A (FactorialAffineColimit (1 : A)) := by
  letI := factorialBialgebra A
  exact HopfAlgebra.ofAlgHom (factorialAntipode A)
    factorialAntipode.left_inverse factorialAntipode.right_inverse

lemma factorialHopfAlgebra.antipode :
    letI := factorialBialgebra A
    letI := factorialHopfAlgebra A
    HopfAlgebra.antipode A (A := FactorialAffineColimit (1 : A)) =
      (factorialAntipode A).toLinearMap := rfl

-- factorialCoactionTests.degree_two
example : factorialCoaction (2 : ZMod 4)
    (factorialAffineInclusion (2 : ZMod 4) 1 (AdjoinRoot.root _)) =
    factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _) ⊗ₜ[ZMod 4]
      factorialAffineInclusion (2 : ZMod 4) 1 (AdjoinRoot.root _) :=
  factorialCoaction.root _ _

-- factorialCoactionTests.coefficient_two
example : factorialCoaction (0 : ZMod 4)
    (algebraMap (ZMod 4) _ 2) =
      1 ⊗ₜ[ZMod 4] algebraMap (ZMod 4) (FactorialAffineColimit (0 : ZMod 4)) 2 :=
  factorialCoaction.constant _ _

-- factorialCoactionTests.zero_ring
example : factorialCoaction (0 : ZMod 1) 0 = 0 := map_zero _

-- factorialCoactionTests.wild_nonzero
example : factorialCoaction (0 : ZMod 2)
    (factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _)) ≠ 0 := by
  intro hz
  have hroot := factorialCoaction.injective (0 : ZMod 2)
    (hz.trans (map_zero _).symm)
  have heq := factorialAffineInclusion.injective (0 : ZMod 2) 1
    (hroot.trans (map_zero _).symm)
  have h := (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
    (Nat.factorial_ne_zero (1+1)))).basis.ne_zero
      (⟨1, by norm_num [AdjoinRoot.powerBasis'_dim]⟩ : Fin
        (AdjoinRoot.powerBasis' (Polynomial.monic_X_pow_sub_C (0 : ZMod 2)
          (Nat.factorial_ne_zero (1+1)))).dim)
  apply h
  simpa only [PowerBasis.basis_eq_pow, AdjoinRoot.powerBasis'_gen, pow_one] using heq

-- factorialCoactionTests.wild_square_zero
example : (factorialCoaction (0 : ZMod 2)
    (factorialAffineInclusion (0 : ZMod 2) 1 (AdjoinRoot.root _))) ^ 2 = 0 := by
  rw [← map_pow]
  simpa using congrArg (factorialCoaction (0 : ZMod 2))
    (factorialAffineInclusion.pow (0 : ZMod 2) 1)

-- factorialCounitTests.degree_two
example : factorialCounit (ZMod 4)
    (factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _)) = 1 :=
  factorialCounit.root _

-- factorialCounitTests.coefficient_two
example : factorialCounit (ZMod 4) (algebraMap (ZMod 4) _ 2) = 2 :=
  factorialCounit.constant _

-- factorialCounitTests.zero_ring
example : factorialCounit (ZMod 1) 0 = 0 := map_zero _

-- factorialAntipodeTests.inverse_root
example : factorialAntipode A
    (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) *
      factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) = 1 := by
  rw [factorialAntipode.root, ← factorialUniversalScalars.value]
  exact Units.inv_mul _

-- factorialAntipodeTests.involutive
example (x : FactorialAffineColimit (1 : A)) :
    factorialAntipode A (factorialAntipode A x) = x :=
  congrArg (fun g => g x) factorialAntipode.involutive

-- factorialAntipodeTests.zero_ring
example : factorialAntipode (ZMod 1) 0 = 0 := map_zero _

-- factorialScalarEvaluationTests.universal
example : factorialScalarEvaluation (A := A) (factorialUniversalScalars A)
    (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) =
      factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) := by
  rw [factorialScalarEvaluation.universal]
  rfl

-- factorialScalarEvaluationTests.identity_scalar
example : factorialScalarEvaluation (A := A) (1 : factorialRootScalars A)
    (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) = 1 := by
  rw [factorialScalarEvaluation.root]
  rfl

-- factorialScalarEvaluationTests.coefficient_two
example : factorialScalarEvaluation (A := ZMod 4) (1 : factorialRootScalars (ZMod 4))
    (algebraMap (ZMod 4) _ 2) = 2 := by
  exact factorialScalarEvaluation.constant (1 : factorialRootScalars (ZMod 4)) 2

-- factorialScalarPointsTests.left_inverse
example (p : FactorialAffineColimit (1 : A) →ₐ[A] A) :
    factorialScalarEvaluation (factorialScalarPoints p) = p :=
  factorialScalarPoints.left_inverse p

-- factorialScalarPointsTests.right_inverse
example (s : factorialRootScalars (ZMod 1)) :
    factorialScalarPoints (factorialScalarEvaluation (A := ZMod 1) s) = s :=
  factorialScalarPoints.right_inverse s

-- factorialScalarPointsTests.universal
example : factorialScalarPoints (AlgHom.id A (FactorialAffineColimit (1 : A))) =
    factorialUniversalScalars A := by
  rw [← factorialScalarEvaluation.universal]
  exact factorialScalarPoints.right_inverse _

-- factorialBialgebraTests.comul_root
example :
    letI := factorialBialgebra (ZMod 4)
    Bialgebra.comulAlgHom (ZMod 4) (FactorialAffineColimit (1 : ZMod 4))
      (factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _)) =
        factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _) ⊗ₜ[ZMod 4]
          factorialAffineInclusion (1 : ZMod 4) 1 (AdjoinRoot.root _) :=
  factorialCoaction.root _ _

-- factorialBialgebraTests.counit_root
example :
    letI := factorialBialgebra (ZMod 2)
    Bialgebra.counitAlgHom (ZMod 2) (FactorialAffineColimit (1 : ZMod 2))
      (factorialAffineInclusion (1 : ZMod 2) 1 (AdjoinRoot.root _)) = 1 :=
  factorialCounit.root _

-- factorialBialgebraTests.zero_ring
example :
    letI := factorialBialgebra (ZMod 1)
    Bialgebra.comulAlgHom (ZMod 1) (FactorialAffineColimit (1 : ZMod 1)) 0 = 0 :=
  map_zero _

-- factorialHopfAlgebraTests.inverse_root
example :
    letI := factorialBialgebra A
    letI := factorialHopfAlgebra A
    HopfAlgebra.antipode A (A := FactorialAffineColimit (1 : A))
      (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) *
        factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) = 1 := by
  change factorialAntipode A
    (factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _)) *
      factorialAffineInclusion (1 : A) 1 (AdjoinRoot.root _) = 1
  rw [factorialAntipode.root, ← factorialUniversalScalars.value]
  exact Units.inv_mul _

-- factorialHopfAlgebraTests.involutive
example (x : FactorialAffineColimit (1 : A)) :
    letI := factorialBialgebra A
    letI := factorialHopfAlgebra A
    HopfAlgebra.antipode A (HopfAlgebra.antipode A x) = x :=
  congrArg (fun g => g x) factorialAntipode.involutive

-- factorialHopfAlgebraTests.zero_ring
example :
    letI := factorialBialgebra (ZMod 1)
    letI := factorialHopfAlgebra (ZMod 1)
    HopfAlgebra.antipode (ZMod 1) (A := FactorialAffineColimit (1 : ZMod 1)) 0 = 0 :=
  map_zero _

end FactorialUniversalCoaction
end TauCeti.RootStack

#print axioms TauCeti.RootStack.factorialCoaction
#print axioms TauCeti.RootStack.factorialCoaction.root
#print axioms TauCeti.RootStack.factorialCoaction.constant
#print axioms TauCeti.RootStack.factorialCounit
#print axioms TauCeti.RootStack.factorialCounit.root
#print axioms TauCeti.RootStack.factorialCoaction.counit
#print axioms TauCeti.RootStack.factorialCoaction.coassoc
#print axioms TauCeti.RootStack.factorialCoaction.right_counit
#print axioms TauCeti.RootStack.factorialCoaction.cocomm
#print axioms TauCeti.RootStack.factorialAntipode
#print axioms TauCeti.RootStack.factorialAntipode.root
#print axioms TauCeti.RootStack.factorialAntipode.left_inverse
#print axioms TauCeti.RootStack.factorialAntipode.right_inverse
#print axioms TauCeti.RootStack.factorialAntipode.involutive
#print axioms TauCeti.RootStack.factorialScalarEvaluation
#print axioms TauCeti.RootStack.factorialScalarEvaluation.root
#print axioms TauCeti.RootStack.factorialScalarPoints
#print axioms TauCeti.RootStack.factorialScalarPoints.value
#print axioms TauCeti.RootStack.factorialScalarPoints.naturality
#print axioms TauCeti.RootStack.factorialCoaction.specialization
#print axioms TauCeti.RootStack.factorialCoaction.injective
#print axioms TauCeti.RootStack.factorialBialgebra
#print axioms TauCeti.RootStack.factorialBialgebra.comul
#print axioms TauCeti.RootStack.factorialBialgebra.counit
#print axioms TauCeti.RootStack.factorialHopfAlgebra
#print axioms TauCeti.RootStack.factorialHopfAlgebra.antipode
#print axioms TauCeti.RootStack.factorialCounit.constant
#print axioms TauCeti.RootStack.factorialCounit.surjective
#print axioms TauCeti.RootStack.factorialScalarEvaluation.constant
#print axioms TauCeti.RootStack.factorialScalarEvaluation.universal
#print axioms TauCeti.RootStack.factorialScalarPoints.left_inverse
#print axioms TauCeti.RootStack.factorialScalarPoints.right_inverse

END ARCHIVED CHECKED FACTORIAL UNIVERSAL COACTION -/
