/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Claude Code (cc-fb70e5), Codex (codex-zJGrQH)
-/
import Mathlib.Algebra.SkewPolynomial.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Separable
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Analysis.Normed.Group.Completion
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.DedekindDomain.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.ToLinearEquiv
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.LaurentSeries
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Analysis.Normed.Module.Completion
import Mathlib.Analysis.Normed.Field.Instances
import Mathlib.Topology.Algebra.UniformRing
import Mathlib.Topology.Perfect
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Basic
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Limits
import TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic
import TauCeti.Algebra.AlgebraicGroup.AdditiveGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Scheme.Kernel

/-!
# Suggested declarations for DM.0–DM.7

This file is not the roadmap and is not exhaustive. The companion reader document is definitive.
These forms help contributors and reviewers converge on names and signatures. Proofs and
constructions use `sorry`; none is an implementation claim.

The `Ore` namespace is an adapter to Mathlib's `SkewPolynomial` for the FF.4 supplier. FF.4 owns
q-linearized polynomials and their composition/Ore comparison. This adapter is not a second
roadmap for that theory. Drinfeld structures begin at DM.0 below.

The mathematical targets include general coefficient ideals, relative line bundles, compactified
moduli, completed motive realizations and elliptic sheaves. Exact native geometric signatures
whose supplier interface is not fixed are identified at the end. They are omitted, as the protocol
requires, rather than encoded by unknown `Prop` fields. The coordinate models below are labelled
as coordinate models. Statements about point torsion never substitute for connected group schemes.
-/
noncomputable section
open Polynomial
open scoped BigOperators Topology TensorProduct
namespace TauCeti.Drinfeld

/-! ## FF.4 adapter to the pinned native Ore ring -/
@[instance_reducible]
def qPowerAction (F R : Type*) [Field F] [Fintype F] [CommRing R] [Algebra F R] :
    MulSemiringAction (Multiplicative ℕ) R where
  smul n x := (FiniteField.frobeniusAlgHom F R)^[Multiplicative.toAdd n] x
  one_smul := by sorry
  mul_smul := by sorry
  smul_zero := by sorry
  smul_add := by sorry
  smul_one := by sorry
  smul_mul := by sorry

def Ore (F R : Type*) [Field F] [Fintype F] [CommRing R] [Algebra F R] : Type _ :=
  SkewPolynomial R
namespace Ore
variable {F R : Type*} [Field F] [Fintype F] [CommRing R] [Algebra F R]
instance : Ring (Ore F R) :=
  letI := qPowerAction F R
  inferInstanceAs (Ring (SkewPolynomial R))
instance : Algebra F (Ore F R) := by sorry

def tau : Ore F R := SkewPolynomial.X
def scalar : R →+* Ore F R :=
  letI := qPowerAction F R
  SkewPolynomial.CRingHom

def coeff (f : Ore F R) (n : ℕ) : R := SkewPolynomial.coeff f n
def degree (f : Ore F R) : ℕ := f.support.sup Multiplicative.toAdd

def differential : Ore F R →+* R := by sorry

def evalEnd : Ore F R →ₐ[F] Module.End F R := by sorry

def toPolynomial (f : Ore F R) : R[X] :=
  ∑ i ∈ Finset.range (degree f + 1), monomial (Fintype.card F ^ i) (coeff f i)

def map {S : Type*} [CommRing S] [Algebra F S] (f : R →ₐ[F] S) : Ore F R →ₐ[F] Ore F S :=
  by sorry
end Ore

/-! ## DM.0. Field objects, rank, intertwiners and Carlitz arithmetic -/
universe uF uA uL
variable {F : Type uF} {A : Type uA} {L : Type uL} [Field F] [Fintype F] [CommRing A] [Algebra F A]
  [Field L] [Algebra F L]

structure DrinfeldModule (F A L : Type*) [Field F] [Fintype F] [CommRing A]
    [Algebra F A] [Field L] [Algebra F L] (gamma : A →ₐ[F] L) where
  map : A →ₐ[F] Ore F L
  constantCoeff_map : ∀ a, Ore.differential (map a) = gamma a
  nonconstant : ∃ a, 0 < Ore.degree (map a)

namespace DrinfeldModule
variable {gamma : A →ₐ[F] L}

def charIdeal (_E : DrinfeldModule F A L gamma) : Ideal A := RingHom.ker gamma

def baseChange (E : DrinfeldModule F A L gamma) {L' : Type*} [Field L'] [Algebra F L']
    (f : L →ₐ[F] L') : DrinfeldModule F A L' (f.comp gamma) := by sorry

/-- In the general-A theorem, `degA` is the divisor degree supplied by FA.1. -/
def HasRank (E : DrinfeldModule F A L gamma) (degA : A → ℕ) (r : ℕ) : Prop :=
  0 < r ∧ ∀ a, a ≠ 0 → Ore.degree (E.map a) = r * degA a

def rank {gamma : F[X] →ₐ[F] L} (E : DrinfeldModule F F[X] L gamma) : ℕ :=
  Ore.degree (E.map X)

theorem rank_pos {gamma : F[X] →ₐ[F] L} (E : DrinfeldModule F F[X] L gamma) :
    0 < E.rank := by sorry

theorem rank_baseChange {gamma : F[X] →ₐ[F] L} (E : DrinfeldModule F F[X] L gamma)
    {L' : Type*} [Field L'] [Algebra F L'] (f : L →ₐ[F] L') :
    (E.baseChange f).rank = E.rank := by sorry

theorem rank_polynomial_ring {gamma : F[X] →ₐ[F] L} (E : DrinfeldModule F F[X] L gamma)
    (a : F[X]) (ha : a ≠ 0) : Ore.degree (E.map a) = E.rank * a.natDegree := by sorry

def Hom (E E' : DrinfeldModule F A L gamma) : Submodule F (Ore F L) where
  carrier := {u | ∀ a, u * E.map a = E'.map a * u}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

def Hom.comp {E E' E'' : DrinfeldModule F A L gamma}
    (v : Hom E' E'') (u : Hom E E') : Hom E E'' := ⟨v.val * u.val, by sorry⟩

def Hom.smul {E E' : DrinfeldModule F A L gamma} (a : A) (u : Hom E E') : Hom E E' :=
  ⟨E'.map a * u.val, by sorry⟩

def IsIsogeny {E E' : DrinfeldModule F A L gamma} (u : Hom E E') : Prop := u.val ≠ 0

theorem isogeny_iff {E E' : DrinfeldModule F A L gamma} (u : Hom E E') :
    IsIsogeny u ↔ u.val ≠ 0 := by sorry

theorem isogeny_rank {gamma : F[X] →ₐ[F] L} {E E' : DrinfeldModule F F[X] L gamma}
    (u : Hom E E') (hu : IsIsogeny u) : E.rank = E'.rank := by sorry
end DrinfeldModule

def carlitz (F : Type*) [Field F] [Fintype F] {L : Type*} [Field L] [Algebra F L]
    (theta : L) : DrinfeldModule F F[X] L (aeval theta) where
  map := aeval (Ore.scalar theta + Ore.tau : Ore F L)
  constantCoeff_map := by sorry
  nonconstant := by sorry

theorem carlitz_map_X (theta : L) :
    (carlitz F theta).map X = Ore.scalar theta + Ore.tau := by sorry

theorem carlitz_rank (theta : L) : (carlitz F theta).rank = 1 := by sorry

theorem carlitz_constantCoeff (theta : L) (a : F[X]) :
    Ore.differential ((carlitz F theta).map a) = aeval theta a := by sorry

/-- DrinfeldModule_test_rank_two -/
example (theta g delta : L) (h : delta ≠ 0) :
    ∃ E : DrinfeldModule F F[X] L (aeval theta),
      E.map X = Ore.scalar theta + Ore.scalar g * Ore.tau + Ore.scalar delta * Ore.tau ^ 2 :=
  by sorry
/-- DrinfeldModule_test_scalar -/
example (gamma : F[X] →ₐ[F] L) :
    ¬ ∃ E : DrinfeldModule F F[X] L gamma, ∀ a, E.map a = Ore.scalar (gamma a) := by sorry
/-- DrinfeldModule_test_special_characteristic -/
example : (carlitz F (0 : L)).charIdeal ≠ ⊥ := by sorry
/-- rank_test_carlitz -/
example (theta : L) : (carlitz F theta).rank = 1 := by sorry
/-- rank_test_degree_two -/
example (theta : L) : Ore.degree ((carlitz F theta).map (X ^ 2)) = 2 := by sorry
/-- rank_test_top_coefficient -/
example (theta g : L) (h : g ≠ 0) :
    Ore.degree (Ore.scalar theta + Ore.scalar g * Ore.tau + Ore.scalar 0 * Ore.tau ^ 2 : Ore F L)
      = 1 := by sorry
/-- carlitz_test_square -/
example (theta : L) : (carlitz F theta).map (X ^ 2) =
    Ore.scalar (theta ^ 2) + Ore.scalar (theta + theta ^ Fintype.card F) * Ore.tau + Ore.tau ^ 2 :=
  by sorry
/-- carlitz_test_special -/
example : (carlitz F (0 : L)).map X = (Ore.tau : Ore F L) := by sorry
/-- carlitz_test_differential -/
example (theta : L) : Ore.differential ((carlitz F theta).map X) = theta := by sorry
/-- Hom_test_identity -/
example (gamma : A →ₐ[F] L) (E : DrinfeldModule F A L gamma) : 1 ∈ DrinfeldModule.Hom E E :=
  by sorry
/-- Hom_test_scalar_conjugation -/
example (gamma : A →ₐ[F] L) (E E' : DrinfeldModule F A L gamma) (c : L) (hc : c ≠ 0) :
    Ore.scalar c ∈ DrinfeldModule.Hom E E' ↔
      ∀ a, E'.map a = Ore.scalar c * E.map a * Ore.scalar c⁻¹ := by sorry
/-- Hom_test_extra_endomorphism -/
example (hq : Fintype.card F = 2) (omega : L) (h : omega ^ 2 = omega + 1) :
    (Ore.tau : Ore F L) * Ore.scalar omega ≠ Ore.scalar omega * Ore.tau := by sorry

namespace DrinfeldKernel
variable (u : Ore F L)
def coordinateAlgebra : Type _ := L[X] ⧸ Ideal.span {Ore.toPolynomial u}
variable {B : Type*} [CommRing B] [Algebra L B]
def points : Set B := {x | (Ore.toPolynomial u).eval₂ (algebraMap L B) x = 0}

def baseChange {L' : Type*} [Field L'] [Algebra F L'] (f : L →ₐ[F] L') : Type _ :=
  L'[X] ⧸ Ideal.span {Ore.toPolynomial (Ore.map f u)}
/-- DrinfeldKernel_test_scalar -/
example (c : L) (hc : c ≠ 0) : points (Ore.scalar c : Ore F L) (B := L) = {0} := by sorry
/-- DrinfeldKernel_test_frobenius -/
example : Ideal.span {Ore.toPolynomial (Ore.tau ^ 2 : Ore F L)} =
    Ideal.span {(X ^ (Fintype.card F ^ 2) : L[X])} := by sorry
/-- DrinfeldKernel_test_etale -/
example (theta : L) (h : theta ≠ 0) :
    (Ore.toPolynomial ((carlitz F theta).map X)).Separable := by sorry
end DrinfeldKernel

/-- Native affine coordinate model; the line-bundle version is in the reader. -/
structure AffineRelativeDrinfeldModule (F A R : Type*) [Field F] [Fintype F]
    [CommRing A] [Algebra F A] [CommRing R] [Algebra F R]
    (gamma : A →ₐ[F] R) (degA : A → ℕ) (rank : ℕ) where
  map : A →ₐ[F] Ore F R
  constantCoeff_map : ∀ a, Ore.differential (map a) = gamma a
  rank_pos : 0 < rank
  degree_eq : ∀ a, a ≠ 0 → Ore.degree (map a) = rank * degA a
  leading_unit : ∀ a, a ≠ 0 → IsUnit (Ore.coeff (map a) (rank * degA a))

namespace RelativeDrinfeldModule
variable {R S : Type*} [CommRing R] [Algebra F R] [CommRing S] [Algebra F S]
variable {gamma : A →ₐ[F] R} {degA : A → ℕ} {r : ℕ}

def pullback (E : AffineRelativeDrinfeldModule F A R gamma degA r) (f : R →ₐ[F] S) :
    AffineRelativeDrinfeldModule F A S (f.comp gamma) degA r := by sorry

theorem coeff_changeFrame_scalar_formula (b : R) (u : Rˣ) (i : ℕ) :
    (u : R) * b * ((u⁻¹ : Rˣ) : R) ^ (Fintype.card F ^ i) =
      ((u ^ (1 - (Fintype.card F ^ i : ℤ)) : Rˣ) : R) * b := by sorry

theorem rank_fiber (E : AffineRelativeDrinfeldModule F A R gamma degA r)
    (f : R →ₐ[F] L) (a : A) (ha : a ≠ 0) :
    Ore.degree ((pullback E f).map a) = r * degA a := by sorry
/-- RelativeDrinfeldModule_test_field -/
def fieldObject {gamma : A →ₐ[F] L} (E : AffineRelativeDrinfeldModule F A L gamma degA r)
    (hdeg : ∃ a, a ≠ 0 ∧ 0 < degA a) : DrinfeldModule F A L gamma := by sorry
example {gamma : A →ₐ[F] L} (E : AffineRelativeDrinfeldModule F A L gamma degA r)
    (hdeg : ∃ a, a ≠ 0 ∧ 0 < degA a) : (fieldObject E hdeg).map = E.map := by sorry
/-- RelativeDrinfeldModule_test_nonunit -/
example : ¬ IsUnit (X : F[X]) := by sorry
/-- RelativeDrinfeldModule_test_frame -/
example (u : Rˣ) :
    (u : R) * (1 : R) * ((u⁻¹ : Rˣ) : R) ^ Fintype.card F =
      (u : R) * ((u⁻¹ : Rˣ) : R) ^ Fintype.card F := by sorry
end RelativeDrinfeldModule

/-- Brackets and products use the coefficient θ, not the motive variable. -/
def carlitzBracket (theta : L) (i : ℕ) : L := theta ^ (Fintype.card F ^ i) - theta
def carlitzD (theta : L) : ℕ → L
  | 0 => 1
  | n + 1 => carlitzBracket (F := F) theta (n + 1) * carlitzD theta n ^ Fintype.card F

def carlitzEll (theta : L) (n : ℕ) : L :=
  ∏ i ∈ Finset.range n, (theta - theta ^ (Fintype.card F ^ (i + 1)))

theorem carlitzD_succ (theta : L) (n : ℕ) :
    carlitzD (F := F) theta (n + 1) = carlitzBracket (F := F) theta (n + 1) *
      carlitzD (F := F) theta n ^ Fintype.card F := by sorry

theorem carlitzEll_succ (theta : L) (n : ℕ) :
    carlitzEll (F := F) theta (n + 1) =
      (theta - theta ^ (Fintype.card F ^ (n + 1))) * carlitzEll (F := F) theta n := by sorry
/-- carlitzProducts_test_zero -/
example (theta : L) : carlitzD (F := F) theta 0 = 1 ∧ carlitzEll (F := F) theta 0 = 1 := by sorry
/-- carlitzProducts_test_one -/
example (theta : L) : carlitzEll (F := F) theta 1 = theta - theta ^ Fintype.card F := by sorry
/-- carlitzProducts_test_two -/
example (theta : L) : carlitzD (F := F) theta 2 =
    (theta ^ (Fintype.card F ^ 2) - theta) * (theta ^ Fintype.card F - theta) ^ Fintype.card F :=
  by sorry

/-! ## DM.1. Native kernel schemes and a principal-prime Tate coordinate model

The point inverse limit below is restricted to a principal prime `ell`. The reader defines the
canonical nonprincipal-ideal realization, including its division coordinates. The kernel ideals
and their spectra below retain the connected part at characteristic primes.
-/
namespace DrinfeldModule
variable {gamma : A →ₐ[F] L}

def torsionIdeal (E : DrinfeldModule F A L gamma) (I : Ideal A) : Ideal L[X] :=
  Ideal.span {P | ∃ a ∈ I, P = Ore.toPolynomial (E.map a)}

def idealTorsion (E : DrinfeldModule F A L gamma) (I : Ideal A) : AlgebraicGeometry.Scheme :=
  AlgebraicGeometry.Spec (CommRingCat.of (L[X] ⧸ E.torsionIdeal I))

def Points (_E : DrinfeldModule F A L gamma) : Type _ := L
instance (E : DrinfeldModule F A L gamma) : AddCommGroup E.Points := inferInstanceAs (AddCommGroup L)
instance (E : DrinfeldModule F A L gamma) : Module A E.Points := by sorry

def torsionPoints (E : DrinfeldModule F A L gamma) (I : Ideal A) : Submodule A E.Points where
  carrier := {x | ∀ a ∈ I, a • x = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

theorem idealTorsion_principal (E : DrinfeldModule F A L gamma) (a : A) :
    E.torsionIdeal (Ideal.span {a}) = Ideal.span {Ore.toPolynomial (E.map a)} := by sorry

theorem idealTorsion_baseChange_coordinates (E : DrinfeldModule F A L gamma) (I : Ideal A)
    {L' : Type*} [Field L'] [Algebra F L'] (f : L →ₐ[F] L') :
    (E.baseChange f).torsionIdeal I = (E.torsionIdeal I).map (Polynomial.mapRingHom f) := by sorry

def torsionPoints_crt (E : DrinfeldModule F A L gamma) (I J : Ideal A)
    (h : I + J = ⊤) : E.torsionPoints (I * J) ≃ₗ[A] E.torsionPoints I × E.torsionPoints J :=
  by sorry

def torsionSpecMap (E : DrinfeldModule F A L gamma) (I : Ideal A) :
    E.idealTorsion I ⟶ _root_.AlgebraicGeometry.Spec (CommRingCat.of L) := by sorry

def idealTorsion_crt (E : DrinfeldModule F A L gamma) (I J : Ideal A)
    (h : I + J = ⊤) : E.idealTorsion (I * J) ≅
    CategoryTheory.Limits.pullback (E.torsionSpecMap I) (E.torsionSpecMap J) := by sorry

def idealTorsion_baseChange (E : DrinfeldModule F A L gamma) (I : Ideal A)
    {L' : Type uL} [Field L'] [Algebra F L'] (f : L →ₐ[F] L') :
    (E.baseChange f).idealTorsion I ≅ CategoryTheory.Limits.pullback (E.torsionSpecMap I)
      (_root_.AlgebraicGeometry.Spec.map (CommRingCat.ofHom f.toRingHom)) := by sorry

def tateModule (E : DrinfeldModule F A L gamma) (ell : A) : Type _ :=
  {xs : ℕ → E.Points // (∀ n, ell ^ n • xs n = 0) ∧ ∀ n, ell • xs (n + 1) = xs n}

instance (E : DrinfeldModule F A L gamma) (ell : A) : AddCommGroup (E.tateModule ell) :=
  by sorry
instance (E : DrinfeldModule F A L gamma) (ell : A) :
    Module (AdicCompletion (Ideal.span {ell}) A) (E.tateModule ell) := by sorry

def tateModule_projection (E : DrinfeldModule F A L gamma) (ell : A) (n : ℕ) :
    E.tateModule ell → E.torsionPoints (Ideal.span {ell ^ n}) := by sorry

instance (E : DrinfeldModule F A L gamma) (ell : A) : Module A (E.tateModule ell) := by sorry

def tateModule_mod [IsAlgClosed L] (E : DrinfeldModule F A L gamma) (ell : A) (n : ℕ)
    (hchar : gamma ell ≠ 0) :
    (E.tateModule ell ⧸ ((Ideal.span {ell^n}) • ⊤ : Submodule A (E.tateModule ell))) ≃ₗ[A]
      E.torsionPoints (Ideal.span {ell^n}) := by sorry

def tateMap {E E' : DrinfeldModule F A L gamma} (u : Hom E E') (ell : A) :
    E.tateModule ell →ₗ[AdicCompletion (Ideal.span {ell}) A] E'.tateModule ell := by sorry

theorem tateModule_rank [IsAlgClosed L] {gamma : F[X] →ₐ[F] L}
    (E : DrinfeldModule F F[X] L gamma) (ell : F[X])
    (hprime : Irreducible ell) (hchar : gamma ell ≠ 0) :
    Module.finrank (AdicCompletion (Ideal.span {ell}) F[X]) (E.tateModule ell) = E.rank :=
  by sorry

/-- Point Galois actions are assembled from coefficient automorphisms fixing γ. -/
def tateGaloisAction (E : DrinfeldModule F A L gamma) (ell : A)
    (g : L ≃ₐ[F] L) (h : ∀ a i, g (Ore.coeff (E.map a) i) = Ore.coeff (E.map a) i) :
    E.tateModule ell ≃ₗ[AdicCompletion (Ideal.span {ell}) A] E.tateModule ell := by sorry

theorem tateGaloisAction_mod (E : DrinfeldModule F A L gamma) (ell : A)
    (g : L ≃ₐ[F] L) (h : ∀ a i, g (Ore.coeff (E.map a) i) = Ore.coeff (E.map a) i)
    (x : E.tateModule ell) (n : ℕ) :
    ((E.tateGaloisAction ell g h x).val n : L) = g (x.val n : L) := by sorry

theorem tateMap_equivariant {E E' : DrinfeldModule F A L gamma} (u : Hom E E') (ell : A)
    (g : L ≃ₐ[F] L) (hE : ∀ a i, g (Ore.coeff (E.map a) i) = Ore.coeff (E.map a) i)
    (hE' : ∀ a i, g (Ore.coeff (E'.map a) i) = Ore.coeff (E'.map a) i)
    (hu : ∀ i, g (Ore.coeff u.val i) = Ore.coeff u.val i) (x : E.tateModule ell) :
    E.tateMap u ell (E.tateGaloisAction ell g hE x) =
      E'.tateGaloisAction ell g hE' (E.tateMap u ell x) := by sorry
end DrinfeldModule

/-- idealTorsion_test_unit -/
example (gamma : A →ₐ[F] L) (E : DrinfeldModule F A L gamma) :
    E.torsionIdeal ⊤ = Ideal.span {(X : L[X])} := by sorry
/-- idealTorsion_test_carlitz -/
example (theta : L) : (carlitz F theta).torsionIdeal (Ideal.span {X}) =
    Ideal.span {(Polynomial.C theta * X + X ^ Fintype.card F : L[X])} := by sorry
/-- idealTorsion_test_scheme_points -/
example : (carlitz F (0 : L)).torsionIdeal (Ideal.span {X}) =
    Ideal.span {(X ^ Fintype.card F : L[X])} := by sorry
/-- tateModule_test_carlitz -/
example [IsAlgClosed L] (theta : L) (ell : F[X]) (hp : Irreducible ell)
    (hc : aeval theta ell ≠ 0) :
    Module.finrank (AdicCompletion (Ideal.span {ell}) F[X])
      ((carlitz F theta).tateModule ell) = 1 := by sorry
/-- tateModule_test_tau_square -/
example [IsAlgClosed L] (E : DrinfeldModule F F[X] L (aeval (0 : L)))
    (hE : E.map X = (Ore.tau : Ore F L) ^ 2) :
    Module.finrank (AdicCompletion (Ideal.span {(X - 1 : F[X])}) F[X]) (E.tateModule (X - 1 : F[X])) = 2 :=
  by sorry
/-- tateModule_test_isogeny -/
example [IsAlgClosed L] {gamma : F[X] →ₐ[F] L}
    {E E' : DrinfeldModule F F[X] L gamma} (u : DrinfeldModule.Hom E E') (hu : u.val ≠ 0)
    (ell : F[X]) (hp : Irreducible ell) (hc : gamma ell ≠ 0) :
    Function.Injective (DrinfeldModule.tateMap u ell) := by sorry
/-- tateModule_test_char_rejected -/
example : Subsingleton ((carlitz F (0 : L)).tateModule X) := by sorry
/-- tateGaloisAction_test_sepclosed: identity coefficient action -/
example (gamma : A →ₐ[F] L) (E : DrinfeldModule F A L gamma) (ell : A) (x : E.tateModule ell) :
    E.tateGaloisAction ell (1 : L ≃ₐ[F] L) (by sorry) x = x := by sorry
/-- Arithmetic Frobenius fixes the base constants; this does not assert triviality on torsion. -/
example (x : F) : FiniteField.frobeniusAlgHom F F x = x := by sorry
/-- tateGaloisAction_test_basis -/
example {n : ℕ} (B : Matrix (Fin n) (Fin n) L) (hB : IsUnit B.det)
    (rho : Module.End L (Fin n → L)) :
    LinearMap.toMatrix ((Pi.basisFun L (Fin n)).map (Matrix.toLinearEquiv (Pi.basisFun L (Fin n)) B hB))
      ((Pi.basisFun L (Fin n)).map (Matrix.toLinearEquiv (Pi.basisFun L (Fin n)) B hB)) rho =
      B⁻¹ * LinearMap.toMatrix (Pi.basisFun L (Fin n)) (Pi.basisFun L (Fin n)) rho * B :=
  by sorry
/-- charLocal_test_supersingular -/
example (E : DrinfeldModule F F[X] L (aeval (0 : L)))
    (hE : E.map X = (Ore.tau : Ore F L) ^ 2) (n : ℕ) :
    E.torsionIdeal (Ideal.span {X ^ n}) = Ideal.span {(X ^ (Fintype.card F ^ (2*n)) : L[X])} :=
  by sorry
/-- charLocal_test_residue_degree -/
example (f : ℕ) (c : L) (h : c ^ (Fintype.card F ^ f) = c) :
    (FiniteField.frobeniusAlgHom F L)^[f] c = c := by sorry
/-- charLocal_test_points_insufficient -/
example : (carlitz F (0 : L)).torsionPoints (Ideal.span {X}) = ⊥ := by sorry

/-! ## DM.2. Native completion, lattices and normalized analytic series -/

/-- The algebraic closure is equipped with an extending norm by the FA.2 supplier. -/
abbrev CInfty (Kinf : Type*) [NormedField Kinf]
    [NormedField (AlgebraicClosure Kinf)] := UniformSpace.Completion (AlgebraicClosure Kinf)

namespace CInfty
variable {Kinf : Type*} [NormedField Kinf] [NormedField (AlgebraicClosure Kinf)]

theorem norm_coe (x : AlgebraicClosure Kinf) :
    ‖(x : CInfty Kinf)‖ = ‖x‖ := by sorry

theorem complete : CompleteSpace (CInfty Kinf) := by sorry
/- Native field/normed completion instances are imported. Algebraic closedness and the
base-field norm comparison appear in the completion signatures below. -/
end CInfty

section Analytic
variable {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C] [Algebra A C]

structure ALattice (A C : Type*) [CommRing A] [NormedField C] [Algebra A C] where
  carrier : Submodule A C
  finite : Module.Finite A carrier
  projective : Module.Projective A carrier
  positive : 0 < (Module.rank A carrier).toNat
  bounded_finite : ∀ b : ℝ, {x : C | x ∈ carrier ∧ ‖x‖ ≤ b}.Finite

namespace ALattice
variable (Lambda : ALattice A C)
def rank : ℕ := (Module.rank A Lambda.carrier).toNat

def scale (Lambda : ALattice A C) (c : C) (hc : c ≠ 0) : ALattice A C := by sorry

theorem quotient_card [IsDedekindDomain A] (a : A) (ha : a ≠ 0) [Finite (A ⧸ Ideal.span {a})] :
    Nat.card (Lambda.carrier ⧸ ((Ideal.span {a}) • ⊤ : Submodule A Lambda.carrier)) =
      Nat.card (A ⧸ Ideal.span {a}) ^ Lambda.rank := by sorry

/-- Series of the normalized product; all disk restrictions are explicit. -/
def expSeries (Lambda : ALattice A C) : PowerSeries C := by sorry

def exp (z : C) : C := ∑' n : ℕ, PowerSeries.coeff n Lambda.expSeries * z ^ n

theorem exp_entire (b : ℝ) : PowerSeries.IsRestricted b Lambda.expSeries := by sorry

theorem exp_add (x y : C) : Lambda.exp (x + y) = Lambda.exp x + Lambda.exp y := by sorry

theorem exp_ker (x : C) : Lambda.exp x = 0 ↔ x ∈ Lambda.carrier := by sorry

theorem exp_scale (c : C) (hc : c ≠ 0) (x : C) :
    (Lambda.scale c hc).exp (c * x) = c * Lambda.exp x := by sorry

/-- Polynomial-coefficient specialization; the general-A construction needs FA.1. -/
def drinfeldModule [IsAlgClosed C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (Lambda : ALattice F[X] C) (gamma : F[X] →ₐ[F] C)
    (hg : ∀ a, gamma a = algebraMap F[X] C a)
    (ht : 1 < ‖gamma X‖) (hpos : 0 < Lambda.rank) :
    DrinfeldModule F F[X] C gamma := by sorry

theorem exp_functionalEquation [IsAlgClosed C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (Lambda : ALattice F[X] C) (gamma : F[X] →ₐ[F] C)
    (hg : ∀ a, gamma a = algebraMap F[X] C a) (ht : 1 < ‖gamma X‖)
    (hpos : 0 < Lambda.rank) (a : F[X]) (x : C) :
    Lambda.exp (gamma a * x) =
      Ore.evalEnd ((Lambda.drinfeldModule gamma hg ht hpos).map a) (Lambda.exp x) := by sorry

theorem drinfeldModule_rank [IsAlgClosed C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (Lambda : ALattice F[X] C) (gamma : F[X] →ₐ[F] C)
    (hg : ∀ a, gamma a = algebraMap F[X] C a) (ht : 1 < ‖gamma X‖)
    (hp : 0 < Lambda.rank) :
    (Lambda.drinfeldModule gamma hg ht hp).rank = Lambda.rank := by sorry

theorem drinfeldModule_scale [IsAlgClosed C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (Lambda : ALattice F[X] C) (gamma : F[X] →ₐ[F] C)
    (hg : ∀ a, gamma a = algebraMap F[X] C a) (ht : 1 < ‖gamma X‖)
    (hp : 0 < Lambda.rank) (c : C) (hc : c ≠ 0)
    (hp' : 0 < (Lambda.scale c hc).rank) (a : F[X]) :
    ((Lambda.scale c hc).drinfeldModule gamma hg ht hp').map a =
      Ore.scalar c * (Lambda.drinfeldModule gamma hg ht hp).map a * Ore.scalar c⁻¹ := by sorry
end ALattice

/-- latticeExp_test_derivative -/
example (Lambda : ALattice A C) : PowerSeries.coeff 1 Lambda.expSeries = 1 := by sorry
/-- latticeExp_test_kernel -/
example (Lambda : ALattice A C) (x : C) (hx : x ∈ Lambda.carrier) : Lambda.exp x = 0 := by sorry
/-- latticeExp_test_scaling -/
example (Lambda : ALattice A C) (c : C) (hc : c ≠ 0) (x : C) :
    (Lambda.scale c hc).exp (c*x) = c*Lambda.exp x := by sorry
/-- latticeModule_test_one -/
example [IsAlgClosed C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (Lambda : ALattice F[X] C) (gamma : F[X] →ₐ[F] C)
    (hg : ∀ a, gamma a = algebraMap F[X] C a) (ht : 1 < ‖gamma X‖)
    (hp : 0 < Lambda.rank) :
    (Lambda.drinfeldModule gamma hg ht hp).map 1 = 1 := by sorry
/-- latticeModule_test_linear -/
example [IsAlgClosed C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (Lambda : ALattice F[X] C) (gamma : F[X] →ₐ[F] C)
    (hg : ∀ a, gamma a = algebraMap F[X] C a) (ht : 1 < ‖gamma X‖)
    (hp : 0 < Lambda.rank) (a : F[X]) :
    PowerSeries.coeff 1 ((Ore.toPolynomial ((Lambda.drinfeldModule gamma hg ht hp).map a)) :
      PowerSeries C) = gamma a := by sorry

/-- Explicit Carlitz series, independent of the lattice construction. -/
def carlitzExpSeries (theta : C) : PowerSeries C :=
  by
  classical
  exact PowerSeries.mk fun n => if h : ∃ i, n = Fintype.card F ^ i then
    (carlitzD (F := F) theta (Classical.choose h))⁻¹ else 0

def carlitzLogSeries (theta : C) : PowerSeries C :=
  by
  classical
  exact PowerSeries.mk fun n => if h : ∃ i, n = Fintype.card F ^ i then
    (carlitzEll (F := F) theta (Classical.choose h))⁻¹ else 0

def carlitzExp (theta z : C) : C := ∑' i : ℕ, z ^ (Fintype.card F ^ i) /
  carlitzD (F := F) theta i

def carlitzLog (theta z : C) : C := ∑' i : ℕ, z ^ (Fintype.card F ^ i) /
  carlitzEll (F := F) theta i

theorem carlitzExp_functionalEquation (theta z : C) (ht : 1 < ‖theta‖) :
    carlitzExp (F := F) theta (theta*z) =
      theta*carlitzExp (F := F) theta z + carlitzExp (F := F) theta z ^ Fintype.card F := by sorry

theorem carlitzExp_log_one (theta : C) (ht : 1 < ‖theta‖) :
    carlitzExp (F := F) theta (carlitzLog (F := F) theta 1) = 1 := by sorry

/-- `rho^(q−1)=−theta`; the initial theta fixes the BP normalization. -/
def carlitzPeriod (theta rho : C) : C :=
  theta*rho * ∏' i : ℕ, (1 - theta ^ (1 - (Fintype.card F ^ (i+1) : ℤ)))⁻¹

theorem carlitzPeriod_ker (theta rho : C) (ht : 1 < ‖theta‖)
    (hr : rho ^ (Fintype.card F - 1) = -theta) (x : C) :
    carlitzExp (F := F) theta x = 0 ↔
      ∃ a : F[X], x = carlitzPeriod (F := F) theta rho * aeval theta a := by sorry

theorem carlitzPeriod_norm (theta rho : C) (ht : 1 < ‖theta‖)
    (hr : rho ^ (Fintype.card F - 1) = -theta) :
    ‖carlitzPeriod (F := F) theta rho‖ = ‖theta‖ * ‖rho‖ := by sorry

theorem carlitzPeriod_changeRoot (theta rho : C) (c : F) :
    carlitzPeriod (F := F) theta (algebraMap F C c * rho) =
      algebraMap F C c * carlitzPeriod (F := F) theta rho := by sorry

/-- Coefficientwise product. DM.8 supplies inverse twisting, fixing the series variable. -/
def carlitzOmega {F : Type*} [Field F] [Fintype F] (theta rho : C) : PowerSeries C := by sorry

def inverseCoefficientTwist (root : C ≃ₐ[F] C) (f : PowerSeries C) : PowerSeries C :=
  PowerSeries.map root.toRingHom f

theorem carlitzOmega_twist (theta rho : C) (ht : 1 < ‖theta‖)
    (hr : rho ^ (Fintype.card F - 1) = -theta) (root : C ≃ₐ[F] C)
    (hroot : ∀ c, root c ^ Fintype.card F = c) :
    inverseCoefficientTwist root (carlitzOmega (F := F) theta rho) =
      (PowerSeries.X - PowerSeries.C theta) * carlitzOmega (F := F) theta rho := by sorry

def analyticSeriesValue (f : PowerSeries C) (z : C) : C :=
  ∑' n : ℕ, PowerSeries.coeff n f * z ^ n

theorem carlitzOmega_at_theta (theta rho : C) (ht : 1 < ‖theta‖)
    (hr : rho ^ (Fintype.card F - 1) = -theta) :
    (analyticSeriesValue (carlitzOmega (F := F) theta rho) theta)⁻¹ =
      -carlitzPeriod (F := F) theta rho := by sorry

theorem carlitzOmega_zeros (theta rho z : C) (ht : 1 < ‖theta‖)
    (hr : rho ^ (Fintype.card F - 1) = -theta) :
    analyticSeriesValue (carlitzOmega (F := F) theta rho) z = 0 ↔
      ∃ i : ℕ, z = theta ^ (Fintype.card F ^ (i+1)) := by sorry

/-- carlitzExp_test_coeff -/
example (theta : C) : PowerSeries.coeff (Fintype.card F) (carlitzExpSeries (F := F) theta) =
    (theta ^ Fintype.card F - theta)⁻¹ := by sorry
/-- carlitzExp_test_zero -/
example (theta : C) : carlitzExp (F := F) theta 0 = 0 ∧ carlitzLog (F := F) theta 0 = 0 :=
  by sorry
/-- carlitzExp_test_log_sign -/
example (theta : C) : PowerSeries.coeff (Fintype.card F) (carlitzLogSeries (F := F) theta) =
    (theta - theta ^ Fintype.card F)⁻¹ := by sorry
/-- carlitzPeriod_test_zero -/
example (theta rho : C) (ht : 1 < ‖theta‖) (hr : rho ^ (Fintype.card F - 1) = -theta) :
    carlitzPeriod (F := F) theta rho ≠ 0 ∧
      carlitzExp (F := F) theta (carlitzPeriod (F := F) theta rho) = 0 := by sorry
/-- carlitzPeriod_test_sign -/
example (theta rho : C) (a : F[X]) :
    -(carlitzPeriod (F := F) theta rho) * aeval theta (-a) =
      carlitzPeriod (F := F) theta rho * aeval theta a := by sorry
/-- carlitzPeriod_test_norm -/
example (theta rho : C) (hq : Fintype.card F = 2) (ht : ‖theta‖ = 2)
    (hr : rho ^ (Fintype.card F - 1) = -theta) :
    ‖carlitzPeriod (F := F) theta rho‖ = 4 := by sorry
/-- carlitzOmega_test_constant -/
example (theta rho : C) : PowerSeries.coeff 0 (carlitzOmega (F := F) theta rho) =
    rho ^ (-(Fintype.card F : ℤ)) := by sorry
/-- carlitzOmega_test_theta -/
example (theta rho : C) (ht : 1 < ‖theta‖) (hr : rho ^ (Fintype.card F - 1) = -theta) :
    analyticSeriesValue (carlitzOmega (F := F) theta rho) theta ≠ 0 ∧
      analyticSeriesValue (carlitzOmega (F := F) theta rho) (theta ^ Fintype.card F) = 0 := by sorry
/-- carlitzOmega_test_tate_unit -/
example (theta rho : C) (ht : 1 < ‖theta‖) (hr : rho ^ (Fintype.card F - 1) = -theta) :
    ∃ f : PowerSeries C, PowerSeries.IsRestricted 1 f ∧
      carlitzOmega (F := F) theta rho * f = 1 := by sorry
end Analytic

/-! ## DM.4. Coordinate Anderson modules and free polynomial motives -/

structure TModule (F L : Type*) [Field F] [Fintype F] [Field L] [Algebra F L]
    (theta : L) (d : ℕ) where
  map : F[X] →ₐ[F] Matrix (Fin d) (Fin d) (Ore F L)
  nilpotent : IsNilpotent ((map X).map Ore.differential - theta • (1 : Matrix (Fin d) (Fin d) L))

namespace TModule
variable {theta : L} {d e f : ℕ}

def differential (E : TModule F L theta d) : Matrix (Fin d) (Fin d) L :=
  (E.map X).map Ore.differential

def Hom (E : TModule F L theta d) (E' : TModule F L theta e) :
    Set (Matrix (Fin e) (Fin d) (Ore F L)) := {U | U * E.map X = E'.map X * U}

/-- Rows encode actual F-module-scheme functions on the coordinate additive group. -/
def motive (_E : TModule F L theta d) : Type _ := Fin d → Ore F L
instance (E : TModule F L theta d) : AddCommGroup E.motive :=
  inferInstanceAs (AddCommGroup (Fin d → Ore F L))
instance (E : TModule F L theta d) : Module L[X] E.motive := by sorry
instance (E : TModule F L theta d) : Module L E.motive := by sorry

def isAbelian (E : TModule F L theta d) : Prop :=
  Module.Finite L[X] E.motive ∧ Module.Projective L[X] E.motive

def ofDrinfeld (E : DrinfeldModule F F[X] L (aeval theta)) : TModule F L theta 1 := by sorry

def motiveMap {E : TModule F L theta d} {E' : TModule F L theta e}
    (U : Matrix (Fin e) (Fin d) (Ore F L)) (h : U ∈ E.Hom E') : E'.motive →ₗ[L[X]] E.motive :=
  by sorry

theorem motiveMap_comp {E : TModule F L theta d} {E' : TModule F L theta e}
    {E'' : TModule F L theta f} (U : Matrix (Fin e) (Fin d) (Ore F L))
    (V : Matrix (Fin f) (Fin e) (Ore F L)) (hU : U ∈ E.Hom E') (hV : V ∈ E'.Hom E'')
    (hVU : V*U ∈ E.Hom E'') :
    motiveMap (V*U) hVU = (motiveMap U hU).comp (motiveMap V hV) := by sorry

variable {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C]
/-- The matrix exponential is a concrete map, not an unknown surjectivity field. -/
def exp {theta : C} (E : TModule F C theta d) (z : Fin d → C) : Fin d → C := by sorry
theorem exp_functionalEquation {theta : C} (E : TModule F C theta d)
    (ht : 1 < ‖theta‖) (z : Fin d → C) :
    E.exp (E.differential.mulVec z) = fun i =>
      ∑ j : Fin d, Ore.evalEnd (E.map X i j) (E.exp z j) := by sorry

def isUniformizable {theta : C} (E : TModule F C theta d) : Prop := Function.Surjective E.exp

def periodLattice {theta : C} (E : TModule F C theta d) : AddSubgroup (Fin d → C) where
  carrier := {z | E.exp z = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry
end TModule

/-- A free polynomial-ring effective motive. General projective A_R-modules are in the reader.
The quotient is formed from the *linearized* Frobenius matrix, even over an imperfect field. -/
structure EffectiveTMotive (L : Type*) [Field L] (theta : L) (r : ℕ) where
  matrix : Matrix (Fin r) (Fin r) L[X]
  injective : Function.Injective (Matrix.toLin' matrix)
  support : ∃ n : ℕ, ∀ x : (Fin r → L[X]) ⧸ LinearMap.range (Matrix.toLin' matrix),
    (X - Polynomial.C theta)^n • x = 0

namespace EffectiveTMotive
variable {theta : L} {r : ℕ}

def rank (_M : EffectiveTMotive L theta r) : ℕ := r

def dimension (M : EffectiveTMotive L theta r) : ℕ :=
  Module.finrank L ((Fin r → L[X]) ⧸ LinearMap.range (Matrix.toLin' M.matrix))

def baseChange (M : EffectiveTMotive L theta r) {L' : Type*} [Field L'] (f : L →+* L') :
    EffectiveTMotive L' (f theta) r := by sorry

def carlitz (theta : L) (n : ℕ) : EffectiveTMotive L theta 1 where
  matrix := fun _ _ => (X - Polynomial.C theta)^n
  injective := by sorry
  support := by sorry

/-- EffectiveAMotive_test_carlitz -/
example (theta : L) : (carlitz theta 1).rank = 1 ∧ (carlitz theta 1).dimension = 1 := by sorry
/-- EffectiveAMotive_test_tensor -/
example (theta : L) (n : ℕ) : (carlitz theta n).dimension = n := by sorry
/-- EffectiveAMotive_test_support -/
example (theta b : L) (h : b ≠ theta) :
    ¬ ∃ M : EffectiveTMotive L theta 1, M.matrix = fun _ _ => X - Polynomial.C b := by sorry
/-- EffectiveAMotive_test_linearization -/
example : ¬ Function.Surjective (fun x : RatFunc F => x ^ Fintype.card F) := by sorry
end EffectiveTMotive

/-- Index n denotes tensor power n+1; it has n+1 coordinates and motive rank one. -/
def carlitzTensor (F : Type*) [Field F] [Fintype F] [Algebra F L] (theta : L) (n : ℕ) :
    TModule F L theta (n+1) := by sorry

theorem carlitzTensor_differential (theta : L) (n : ℕ) :
    (carlitzTensor F theta n).differential = theta • (1 : Matrix (Fin (n+1)) (Fin (n+1)) L) +
      (Matrix.of fun (i j : Fin (n+1)) => if j.val = i.val+1 then (1 : L) else 0) := by sorry

theorem carlitzTensor_rank_dimension (theta : L) (n : ℕ) :
    (EffectiveTMotive.carlitz theta (n+1)).rank = 1 ∧
      (EffectiveTMotive.carlitz theta (n+1)).dimension = n+1 := by sorry
/-- TModule_test_carlitz -/
example (theta : L) : (TModule.ofDrinfeld (carlitz F theta)).differential =
    theta • (1 : Matrix (Fin 1) (Fin 1) L) := by sorry
/-- TModule_test_nilpotent -/
example : IsNilpotent (!![(0:L),1;0,0]) := by sorry
/-- TModule_test_semisimple_differential -/
example (theta : L) : ¬ IsNilpotent (!![theta,0;0,theta+1] - theta • 1) := by sorry
/-- TModule_test_nonabelian -/
example (theta : L) (d : ℕ) (hd : 0 < d) (E : TModule F L theta d)
    (h : E.map X = Matrix.diagonal fun _ => Ore.scalar theta) : ¬ E.isAbelian := by sorry
/-- carlitzTensor_test_one -/
example (theta : L) : (carlitzTensor F theta 0).map = (TModule.ofDrinfeld (carlitz F theta)).map :=
  by sorry
/-- carlitzTensor_test_two -/
example (theta : L) : (carlitzTensor F theta 1).map X =
    !![Ore.scalar (F := F) theta,1;Ore.tau,Ore.scalar (F := F) theta] := by sorry
/-- carlitzTensor_test_rank -/
example (theta : L) : (EffectiveTMotive.carlitz theta 2).rank = 1 ∧
    (EffectiveTMotive.carlitz theta 2).dimension = 2 := by sorry

/-! The inverse-Ore adapter uses the supplied inverse coefficient automorphism. -/
@[instance_reducible]
def inversePowerAction (root : L ≃ₐ[F] L) : MulSemiringAction (Multiplicative ℕ) L where
  smul n x := root^[Multiplicative.toAdd n] x
  one_smul := by sorry
  mul_smul := by sorry
  smul_zero := by sorry
  smul_add := by sorry
  smul_one := by sorry
  smul_mul := by sorry

def InverseOre (F L : Type*) [Field F] [Fintype F] [Field L] [Algebra F L]
    (_root : L ≃ₐ[F] L) : Type _ := SkewPolynomial L
instance (root : L ≃ₐ[F] L) : Ring (InverseOre F L root) :=
  letI := inversePowerAction root
  inferInstanceAs (Ring (SkewPolynomial L))
instance (root : L ≃ₐ[F] L) : Algebra F (InverseOre F L root) := by sorry

def oreStar (root : L ≃ₐ[F] L) (u : Ore F L) : InverseOre F L root := by sorry

theorem oreStar_mul (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x)
    (u v : Ore F L) : oreStar root (u*v) = oreStar root v * oreStar root u := by sorry

def matrixOreStar (root : L ≃ₐ[F] L) {m n : ℕ}
    (U : Matrix (Fin m) (Fin n) (Ore F L)) : Matrix (Fin n) (Fin m) (InverseOre F L root) :=
  fun i j => oreStar root (U j i)

namespace TModule
variable {theta : L} {d e : ℕ}

def dualMotive (_E : TModule F L theta d) (root : L ≃ₐ[F] L) : Type _ :=
  Fin d → InverseOre F L root
instance (E : TModule F L theta d) (root : L ≃ₐ[F] L) : AddCommGroup (E.dualMotive root) :=
  inferInstanceAs (AddCommGroup (Fin d → InverseOre F L root))
instance (E : TModule F L theta d) (root : L ≃ₐ[F] L) : Module L[X] (E.dualMotive root) :=
  by sorry

def dualMotiveMap {E : TModule F L theta d} {E' : TModule F L theta e}
    (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x)
    (U : Matrix (Fin e) (Fin d) (Ore F L)) (h : U ∈ E.Hom E') :
    E.dualMotive root →ₗ[L[X]] E'.dualMotive root := by sorry
end TModule
/-- oreStar_test_tau_c -/
example (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x) (c : L) :
    oreStar root ((Ore.tau : Ore F L) * Ore.scalar c) =
      oreStar root (Ore.scalar c) * oreStar root (Ore.tau : Ore F L) := by sorry
/-- oreStar_test_matrix -/
example (root : L ≃ₐ[F] L) (a b : Ore F L) :
    matrixOreStar root (!![0,a;b,0]) = !![0,oreStar root b;oreStar root a,0] := by sorry
/-- oreStar_test_variance -/
example (theta : L) (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x)
    (E : TModule F L theta 1) (U : Matrix (Fin 1) (Fin 1) (Ore F L)) (h : U ∈ E.Hom E) :
    E.dualMotive root →ₗ[L[X]] E.dualMotive root := TModule.dualMotiveMap root hroot U h


/-! ## DM.3. Affine bounded families, geometric point levels and reciprocal rings

The point-level model here applies to split étale torsion over an algebraically closed field.
It does not encode a Cartier-divisor level at bad characteristic or substitute for a family of
finite étale group schemes. The native geometric signatures are listed in the omission register.
-/
namespace DrinfeldModule
variable {gamma : A →ₐ[F] L}
instance (E : DrinfeldModule F A L gamma) (I : Ideal A) : Module (A ⧸ I) (E.torsionPoints I) :=
  by sorry
end DrinfeldModule

abbrev PointDrinfeldLevel (E : DrinfeldModule F A L gamma) (I : Ideal A) (r : ℕ) :=
  Module.Basis (Fin r) (A ⧸ I) (E.torsionPoints I)

namespace PointDrinfeldLevel
variable {gamma : A →ₐ[F] L} {E : DrinfeldModule F A L gamma} {I : Ideal A} {r : ℕ}

def change (B : PointDrinfeldLevel E I r)
    (g : (Fin r → A ⧸ I) ≃ₗ[A ⧸ I] (Fin r → A ⧸ I)) : PointDrinfeldLevel E I r := by sorry

theorem change_id (B : PointDrinfeldLevel E I r) : B.change (LinearEquiv.refl _ _) = B := by sorry
end PointDrinfeldLevel
/-- DrinfeldLevel_test_rank_one: the verified geometric-point specialization. -/
example [IsAlgClosed L] (theta : L) (ht : theta ≠ 0)
    (x : (carlitz F theta).torsionPoints (Ideal.span {X})) (hx : x ≠ 0) :
    ∃ B : PointDrinfeldLevel (carlitz F theta) (Ideal.span {X}) 1, B 0 = x := by sorry
/-- DrinfeldLevel_test_basis -/
example (E : DrinfeldModule F A L gamma) (I : Ideal A)
    [Nontrivial (A ⧸ I)] (B : PointDrinfeldLevel E I 2) : B 0 ≠ B 1 := by sorry
/-- DrinfeldLevel_test_characteristic: a scheme-length q kernel has only the zero point. -/
example : ¬ Nonempty (PointDrinfeldLevel (carlitz F (0 : L)) (Ideal.span {X}) 1) := by sorry

/-- A trivialized generalized family with an actual *global* degree bound. -/
structure AffineGeneralizedDrinfeldModule (F A R : Type*) [Field F] [Fintype F]
    [CommRing A] [Algebra F A] [CommRing R] [Algebra F R]
    (gamma : A →ₐ[F] R) (degA : A → ℕ) (r : ℕ) where
  map : A →ₐ[F] Ore F R
  constantCoeff : ∀ a, Ore.differential (map a) = gamma a
  degreeBound : ∀ a, a ≠ 0 → Ore.degree (map a) ≤ r * degA a
  positiveFibers : ∀ p : Ideal R, p.IsPrime → ∃ a i, 0 < i ∧ Ore.coeff (map a) i ∉ p

namespace AffineGeneralizedDrinfeldModule
variable {R S : Type*} [CommRing R] [Algebra F R] [CommRing S] [Algebra F S]
    {gamma : A →ₐ[F] R} {degA : A → ℕ} {r : ℕ}

def coefficient (E : AffineGeneralizedDrinfeldModule F A R gamma degA r) (a : A) (i : ℕ) : R :=
  Ore.coeff (E.map a) i

def pullback (E : AffineGeneralizedDrinfeldModule F A R gamma degA r) (f : R →ₐ[F] S) :
    AffineGeneralizedDrinfeldModule F A S (f.comp gamma) degA r := by sorry
end AffineGeneralizedDrinfeldModule
/-- generalized_test_boundary: the affine action, before the line-bundle gluing. -/
example (theta : L) : ∃ E : AffineGeneralizedDrinfeldModule F F[X] L[X]
    (aeval (Polynomial.C theta)) Polynomial.natDegree 2,
    E.map X = Ore.scalar (Polynomial.C theta) + Ore.tau +
      Ore.scalar X * (Ore.tau : Ore F L[X])^2 := by sorry
/-- generalized_test_scalar -/
example (gamma : A →ₐ[F] L) (degA : A → ℕ) (r : ℕ) :
    ¬ ∃ E : AffineGeneralizedDrinfeldModule F A L gamma degA r,
      ∀ a, E.map a = Ore.scalar (gamma a) := by sorry
/-- generalized_test_nilpotents: nilpotence does not erase a global coefficient. -/
example {R : Type*} [CommRing R] [Algebra F R] (theta eps : R) (he : eps ≠ 0)
    (he2 : eps^2 = 0) :
    ¬ ∃ E : AffineGeneralizedDrinfeldModule F F[X] R (aeval theta) Polynomial.natDegree 1,
      E.map X = Ore.scalar theta + Ore.tau + Ore.scalar eps * (Ore.tau : Ore F R)^3 := by sorry

namespace Reciprocal
variable (F : Type*) [Field F] [Fintype F] (r : ℕ)

abbrev Ambient := FractionRing (MvPolynomial (Fin r) F)

def linearForm (v : Fin r → F) : MvPolynomial (Fin r) F :=
  ∑ i, MvPolynomial.C (v i) * MvPolynomial.X i

def generator (v : Fin r → F) : Ambient F r :=
  (algebraMap (MvPolynomial (Fin r) F) (Ambient F r) (linearForm F r v))⁻¹

def ring : Subalgebra F (Ambient F r) :=
  Algebra.adjoin F {x | ∃ v : Fin r → F, v ≠ 0 ∧ x = generator F r v}

/-- The linear independence of coordinate functions prevents zero reciprocal denominators. -/
theorem linearForm_eq_zero_iff (v : Fin r → F) : linearForm F r v = 0 ↔ v = 0 := by sorry

theorem relation (v w : Fin r → F) (hv : v ≠ 0) (hw : w ≠ 0) (hvw : v+w ≠ 0) :
    generator F r v * generator F r w =
      (generator F r v + generator F r w) * generator F r (v+w) := by sorry
/-- reciprocal_test_rank_one: the underlying algebra; grading/Proj is in the register. -/
example : ring F 1 = Algebra.adjoin F {generator F 1 (fun _ => 1)} := by sorry
/-- A wrong reciprocal algebra fails this rank-two relation. -/
example (v w : Fin 2 → F) (hv : v ≠ 0) (hw : w ≠ 0) (hs : v+w ≠ 0) :
    generator F 2 v * generator F 2 w =
      (generator F 2 v + generator F 2 w) * generator F 2 (v+w) := by sorry
/-- reciprocal_test_product_scalar -/
example (theta : L) (V : Finset L) (hV : (0:L) ∉ V) :
    (X * ∏ v ∈ V, (1 - Polynomial.C v⁻¹ * X) : L[X]).derivative.eval 0 = 1 ∧
    (Polynomial.C theta * X * ∏ v ∈ V, (1 - Polynomial.C v⁻¹ * X) : L[X]).derivative.eval 0 = theta :=
  by sorry
end Reciprocal

/-! ## DM.4. Further coordinate motive interfaces -/
namespace EffectiveTMotive
variable {theta : L} {r s : ℕ}

def infinityT : LaurentSeries L := HahnSeries.single (-1) 1

/-- Coefficient q-Frobenius followed by the motive matrix evaluated at t=X⁻¹. -/
def infinityFrobenius (M : EffectiveTMotive L theta r) (x : Fin r → LaurentSeries L) :
    Fin r → LaurentSeries L :=
  fun i => ∑ j, aeval (infinityT (L := L)) (M.matrix i j) *
    (x j).map (FiniteField.frobeniusAlgHom F L)

/-- This raw-image form is for perfect coefficients, supplied by `root` below. -/
def isPure (M : EffectiveTMotive L theta r) : Prop :=
  ∃ u v : ℕ, 0 < u ∧ 0 < v ∧
    ∃ H : Submodule (PowerSeries L) (Fin r → LaurentSeries L),
      Module.Finite (PowerSeries L) H ∧ Module.Free (PowerSeries L) H ∧
      Module.finrank (PowerSeries L) H = r ∧
      Submodule.span (LaurentSeries L) (H : Set (Fin r → LaurentSeries L)) = ⊤ ∧
      (fun x : Fin r → LaurentSeries L => infinityT (L := L)^u • x) '' (H : Set _) =
        (M.infinityFrobenius (F := F))^[v] '' (H : Set _)

def weight (M : EffectiveTMotive L theta r) : ℚ := (M.dimension : ℚ) / r

theorem weight_eq (M : EffectiveTMotive L theta r) (hr : 0 < r)
    (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x) (hp : M.isPure (F := F)) :
    M.weight = (M.dimension : ℚ) / M.rank := by sorry

def pureTensor (M : EffectiveTMotive L theta r) (N : EffectiveTMotive L theta s) :
    EffectiveTMotive L theta (r*s) := by sorry

theorem pureTensor_isPure (M : EffectiveTMotive L theta r) (N : EffectiveTMotive L theta s)
    (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x)
    (hM : M.isPure (F := F)) (hN : N.isPure (F := F)) :
    (M.pureTensor N).isPure (F := F) ∧ (M.pureTensor N).weight = M.weight + N.weight := by sorry
/-- purity_test_carlitz -/
example (theta : L) (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x) :
    (carlitz theta 1).isPure (F := F) ∧ (carlitz theta 1).weight = 1 := by sorry
/-- purity_test_tensor_power -/
example (theta : L) (n : ℕ) (hn : 0 < n) (root : L ≃ₐ[F] L)
    (hroot : ∀ x, root x ^ Fintype.card F = x) :
    (carlitz theta n).isPure (F := F) ∧ (carlitz theta n).weight = n := by sorry
/-- purity_test_mixed -/
example (theta : L) (M : EffectiveTMotive L theta 2)
    (h : M.matrix = !![X - Polynomial.C theta,0;0,(X - Polynomial.C theta)^2])
    (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x) :
    ¬ M.isPure (F := F) := by sorry
end EffectiveTMotive

namespace TModule
variable {theta : L} {d e : ℕ}

def Points (_E : TModule F L theta d) : Type _ := Fin d → L
instance (E : TModule F L theta d) : AddCommGroup E.Points :=
  inferInstanceAs (AddCommGroup (Fin d → L))
instance (E : TModule F L theta d) : Module F[X] E.Points := by sorry
instance (E : TModule F L theta d) : Module F E.Points := by sorry
instance (E : TModule F L theta d) (root : L ≃ₐ[F] L) : Module F (E.dualMotive root) := by sorry

def isAFinite (E : TModule F L theta d) (root : L ≃ₐ[F] L) : Prop :=
  Module.Finite L[X] (E.dualMotive root)

/-- Maurischat, Theorem 6.6, pp. 34–35, over a perfect coefficient field. -/
theorem abelian_iff_aFinite (E : TModule F L theta d) (hd : 0 < d)
    (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x) :
    E.isAbelian ↔ E.isAFinite root := by sorry

def sigmaMinusOne (E : TModule F L theta d) (root : L ≃ₐ[F] L) :
    E.dualMotive root →ₗ[F] E.dualMotive root := by sorry

def dualQuotient (E : TModule F L theta d) (root : L ≃ₐ[F] L) : Type _ :=
  (E.dualMotive root) ⧸ LinearMap.range (E.sigmaMinusOne root)
instance (E : TModule F L theta d) (root : L ≃ₐ[F] L) : AddCommGroup (E.dualQuotient root) :=
  inferInstanceAs (AddCommGroup ((E.dualMotive root) ⧸ LinearMap.range (E.sigmaMinusOne root)))
instance (E : TModule F L theta d) (root : L ≃ₐ[F] L) : Module F[X] (E.dualQuotient root) :=
  by sorry

def dualRealization (E : TModule F L theta d) (root : L ≃ₐ[F] L)
    (hroot : ∀ x, root x ^ Fintype.card F = x) : E.dualQuotient root ≃ₗ[F[X]] E.Points := by sorry
/-- motive_test_variance -/
example (E : TModule F L theta d) (E' : TModule F L theta e)
    (U : Matrix (Fin e) (Fin d) (Ore F L)) (hU : U ∈ E.Hom E') : E'.motive →ₗ[L[X]] E.motive :=
  motiveMap U hU
private def unitMotiveRow (E : TModule F L theta 1) : E.motive := fun _ => 1
private def tauMotiveRow (E : TModule F L theta 1) : E.motive := fun _ => Ore.tau
/-- motive_test_carlitz -/
example (theta : L) :
    tauMotiveRow (ofDrinfeld (carlitz F theta)) =
      (X - Polynomial.C theta) • unitMotiveRow (ofDrinfeld (carlitz F theta)) := by sorry
/-- motive_test_dimension_rank -/
example (theta : L) : (EffectiveTMotive.carlitz theta 2).rank = 1 ∧
    (EffectiveTMotive.carlitz theta 2).dimension = 2 := by sorry
/-- motive_test_scalar_not_finite -/
example (theta : L) (E : TModule F L theta 1)
    (h : E.map X = Matrix.diagonal fun _ => Ore.scalar theta) :
    ¬ Module.Finite L[X] E.motive := by sorry
/-- Dual realization is F-linear and carries the actual t-action. -/
example (E : TModule F L theta d) (root : L ≃ₐ[F] L)
    (hroot : ∀ x, root x ^ Fintype.card F = x) (x : E.dualQuotient root) :
    E.dualRealization root hroot ((X : F[X]) • x) = (X : F[X]) • E.dualRealization root hroot x := by sorry
end TModule


/-! ## DM.5. Principal-prime geometric Tate comparison

Use an actual algebraic closure of the field of definition, not its own rational points.
The general nonprincipal ideal and period-ring theorem use the FA.2 supplier contract.
-/
namespace DrinfeldModule
variable {gamma : A →ₐ[F] L}
instance (E E' : DrinfeldModule F A L gamma) : Module A (Hom E E') := by sorry

def Hom.baseChange {E E' : DrinfeldModule F A L gamma} (u : Hom E E')
    {S : Type*} [Field S] [Algebra F S] (f : L →ₐ[F] S) :
    Hom (E.baseChange f) (E'.baseChange f) := ⟨Ore.map f u.val, by sorry⟩

variable (S : Type*) [Field S] [Algebra F S] [Algebra L S] [IsScalarTower F L S]
    [IsAlgClosure L S]

abbrev geometricTate (E : DrinfeldModule F A L gamma) (ell : A) :=
  (E.baseChange (IsScalarTower.toAlgHom F L S)).tateModule ell

def geometricGaloisAction (E : DrinfeldModule F A L gamma) (ell : A) (g : S ≃ₐ[L] S) :
    E.geometricTate S ell ≃ₗ[AdicCompletion (Ideal.span {ell}) A] E.geometricTate S ell := by sorry

/-- This submodule states equivariance rather than hiding it in an arbitrary predicate field. -/
def equivariantTateHom (E E' : DrinfeldModule F A L gamma) (ell : A) :
    Submodule (AdicCompletion (Ideal.span {ell}) A)
      (E.geometricTate S ell →ₗ[AdicCompletion (Ideal.span {ell}) A] E'.geometricTate S ell) where
  carrier := {U | ∀ g x, U (E.geometricGaloisAction S ell g x) =
    E'.geometricGaloisAction S ell g (U x)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

def tateHomMap (E E' : DrinfeldModule F A L gamma) (ell : A) :
    (AdicCompletion (Ideal.span {ell}) A) ⊗[A] Hom E E' →ₗ[AdicCompletion (Ideal.span {ell}) A]
      E.equivariantTateHom S E' ell := by sorry

theorem tateHomMap_pure (E E' : DrinfeldModule F A L gamma) (ell : A) (u : Hom E E') :
    ((E.tateHomMap S E' ell) (1 ⊗ₜ[A] u)).val =
      tateMap (Hom.baseChange u (IsScalarTower.toAlgHom F L S)) ell := by sorry

/-- Composition on pure tensors, extended bilinearly for the completed comparison. -/
theorem tateHomMap_comp (E E' E'' : DrinfeldModule F A L gamma) (ell : A)
    (u : Hom E E') (v : Hom E' E'') :
    ((E.tateHomMap S E'' ell) (1 ⊗ₜ[A] (Hom.comp v u))).val =
      (((E'.tateHomMap S E'' ell) (1 ⊗ₜ[A] v)).val).comp
        (((E.tateHomMap S E' ell) (1 ⊗ₜ[A] u)).val) := by sorry

/-- Nonprincipal ideal saturation is retained as a mathematical target in the packet. -/
theorem tateHomMap_injective {gamma : F[X] →ₐ[F] L}
    (E E' : DrinfeldModule F F[X] L gamma) (ell : F[X])
    (hp : Irreducible ell) (hc : gamma ell ≠ 0) :
    Function.Injective (E.tateHomMap S E' ell) := by sorry

theorem tateHomMap_image_saturated {gamma : F[X] →ₐ[F] L}
    (E E' : DrinfeldModule F F[X] L gamma) (ell : F[X])
    (hp : Irreducible ell) (hc : gamma ell ≠ 0)
    (hfg : (⊤ : IntermediateField F L).FG)
    (U : E.equivariantTateHom S E' ell) :
    (algebraMap F[X] (AdicCompletion (Ideal.span {ell}) F[X]) ell) • U ∈
      LinearMap.range (E.tateHomMap S E' ell) → U ∈ LinearMap.range (E.tateHomMap S E' ell) :=
  by sorry

theorem tateHomMap_surjective {gamma : F[X] →ₐ[F] L}
    (E E' : DrinfeldModule F F[X] L gamma) (ell : F[X])
    (hp : Irreducible ell) (hc : gamma ell ≠ 0)
    (hfg : (⊤ : IntermediateField F L).FG) :
    Function.Surjective (E.tateHomMap S E' ell) := by sorry
/-- tateHom_test_identity -/
example (E : DrinfeldModule F A L gamma) (ell : A) :
    ((E.tateHomMap S E ell) (1 ⊗ₜ[A] (⟨1, by sorry⟩ : Hom E E))).val =
      LinearMap.id := by sorry
/-- tateHom_test_scalar -/
example (E : DrinfeldModule F A L gamma) (ell a : A) :
    ((E.tateHomMap S E ell) (1 ⊗ₜ[A] (⟨E.map a, by sorry⟩ : Hom E E))).val =
      (algebraMap A (AdicCompletion (Ideal.span {ell}) A) a) • LinearMap.id := by sorry
/-- tateHom_test_extra_endomorphisms: the domain need not be cyclic over A. -/
example (E : DrinfeldModule F F[X] L (aeval (0 : L)))
    (hE : E.map X = (Ore.tau : Ore F L)^2) (c : L) (hc : c^(Fintype.card F^2) = c) :
    (Ore.tau : Ore F L) ∈ Hom E E ∧ Ore.scalar c ∈ Hom E E := by sorry
end DrinfeldModule

/-! ## DM.6. Cardinalities, integral coordinate models and special-value formulas -/

/-- The polynomial, with t-action specified as an actual F-linear endomorphism. -/
def finiteModuleCardinality {V : Type*} [AddCommGroup V] [Module F V]
    [Module.Finite F V] (tM : Module.End F V) : F[X] := tM.charpoly

theorem finiteModuleCardinality_zero :
    finiteModuleCardinality (0 : Module.End F (Fin 0 → F)) = 1 := by sorry

theorem finiteModuleCardinality_exact {V W U : Type*}
    [AddCommGroup V] [Module F V] [Module.Finite F V]
    [AddCommGroup W] [Module F W] [Module.Finite F W]
    [AddCommGroup U] [Module F U] [Module.Finite F U]
    (tV : Module.End F V) (tW : Module.End F W) (tU : Module.End F U)
    (i : V →ₗ[F] W) (p : W →ₗ[F] U)
    (hi : Function.Injective i) (hp : Function.Surjective p)
    (hexact : LinearMap.range i = LinearMap.ker p)
    (hti : tW.comp i = i.comp tV) (htp : tU.comp p = p.comp tW) :
    finiteModuleCardinality tW = finiteModuleCardinality tV * finiteModuleCardinality tU := by sorry
/-- cardinality_test_cyclic: companion matrix of t²+t+1. -/
example : finiteModuleCardinality (Matrix.toLin' (!![(0:F),-1;1,-1])) = X^2+X+1 := by sorry
/-- cardinality_test_zero -/
example : finiteModuleCardinality (0 : Module.End F (Fin 0 → F)) = 1 := by sorry
/-- cardinality_test_integer -/
example : finiteModuleCardinality (0 : Module.End F F) = X ∧ Nat.card F = Fintype.card F := by sorry

variable {R : Type*} [CommRing R] [Algebra F R]

structure TaelmanModel (F R : Type*) [Field F] [Fintype F] [CommRing R] [Algebra F R]
    (theta : R) where
  polynomial : Ore F R
  differential : Ore.differential polynomial = theta

namespace TaelmanModel
variable {theta : R}
variable {B : Type*} [CommRing B] [Algebra F B] [Algebra R B] [IsScalarTower F R B]

def points (_E : TaelmanModel F R theta) (B : Type*) [CommRing B] [Algebra F B]
    [Algebra R B] [IsScalarTower F R B] : Type _ := B
instance (E : TaelmanModel F R theta) : AddCommGroup (E.points B) := inferInstanceAs (AddCommGroup B)
instance (E : TaelmanModel F R theta) : Module F (E.points B) := inferInstanceAs (Module F B)
instance (E : TaelmanModel F R theta) : Module F[X] (E.points B) := by sorry

def lie (_E : TaelmanModel F R theta) (B : Type*) [CommRing B] [Algebra F B]
    [Algebra R B] [IsScalarTower F R B] : Type _ := B
instance (E : TaelmanModel F R theta) : AddCommGroup (E.lie B) := inferInstanceAs (AddCommGroup B)
instance (E : TaelmanModel F R theta) : Module F (E.lie B) := inferInstanceAs (Module F B)
instance (E : TaelmanModel F R theta) : Module F[X] (E.lie B) := by sorry

def pointT (E : TaelmanModel F R theta) : Module.End F (E.points B) := by sorry

def lieT (E : TaelmanModel F R theta) : Module.End F (E.lie B) := by sorry

theorem pointT_apply (E : TaelmanModel F R theta) (x : E.points B) :
    E.pointT x = Ore.evalEnd (Ore.map (IsScalarTower.toAlgHom F R B) E.polynomial) (x : B) :=
  by sorry

theorem lieT_apply (E : TaelmanModel F R theta) (x : E.lie B) :
    E.lieT x = (let xB : B := x; algebraMap R B theta * xB) := by sorry

def reduce (E : TaelmanModel F R theta) (m : Ideal R) :
    TaelmanModel F (R ⧸ m) (Ideal.Quotient.mk m theta) := by sorry

def carlitz (F R : Type*) [Field F] [Fintype F] [CommRing R] [Algebra F R]
    (theta : R) : TaelmanModel F R theta where
  polynomial := Ore.scalar theta + Ore.tau
  differential := by sorry

def scalar (F R : Type*) [Field F] [Fintype F] [CommRing R] [Algebra F R]
    (theta : R) : TaelmanModel F R theta where
  polynomial := Ore.scalar theta
  differential := by sorry

/-- The independent variable T is mapped to the inverse Laurent uniformizer. -/
def cardinalityAtInfinity (P : F[X]) : LaurentSeries F := aeval (HahnSeries.single (-1) 1) P

/-- Finite residue modules use their actual two distinct t-actions. -/
def localFactor (E : TaelmanModel F R theta) (m : Ideal R)
    [Module.Finite F (E.points (R ⧸ m))] [Module.Finite F (E.lie (R ⧸ m))] : LaurentSeries F :=
  cardinalityAtInfinity (finiteModuleCardinality (E.lieT (B := R ⧸ m))) /
    cardinalityAtInfinity (finiteModuleCardinality (E.pointT (B := R ⧸ m)))

variable (E : TaelmanModel F R theta)
    [∀ m : MaximalSpectrum R, Module.Finite F (E.points (R ⧸ m.asIdeal))]
    [∀ m : MaximalSpectrum R, Module.Finite F (E.lie (R ⧸ m.asIdeal))]

def lValue : LaurentSeries F := ∏' m : MaximalSpectrum R, E.localFactor m.asIdeal

/- Convergence and the constant-term theorem for genuine global integral models are omitted.
The product is defined here; it is not asserted to converge for an arbitrary commutative R. -/

variable {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C] [Algebra R C]
    [IsScalarTower F R C]

def exp (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) : C → C := by sorry

def expLinear (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) :
    E.lie C →ₗ[F[X]] E.points C := by sorry

theorem exp_linear (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) (x : C) :
    E.exp ht (algebraMap R C theta * x) =
      Ore.evalEnd (Ore.map (IsScalarTower.toAlgHom F R C) E.polynomial) (E.exp ht x) := by sorry

def units (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) :
    Submodule F[X] (E.lie C) where
  carrier := {x | E.exp ht x ∈ Set.range (algebraMap R C)}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

theorem units_mem (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖)
    (x : E.lie C) : x ∈ E.units ht ↔ E.exp ht x ∈ Set.range (algebraMap R C) := by sorry

def integralPointsMap (E : TaelmanModel F R theta) : E.points R →ₗ[F[X]] E.points C := by sorry

def classDenominator (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) :
    Submodule F[X] (E.points C) :=
  LinearMap.range (E.integralPointsMap (C := C)) + LinearMap.range (E.expLinear ht)

def classModule (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) : Type _ :=
  E.points C ⧸ E.classDenominator ht

/-- The zero-rank model is included in Taelman's theorem. -/
example (theta : R) (ht : 1 < ‖algebraMap R C theta‖) (x : C) :
    (scalar F R theta).exp ht x = x := by sorry
/-- units_test_scalar -/
example (theta : R) (ht : 1 < ‖algebraMap R C theta‖) (x : C) :
    x ∈ (scalar F R theta).units ht ↔ x ∈ Set.range (algebraMap R C) := by sorry
/-- classModule_test_scalar -/
example (theta : R) (ht : 1 < ‖algebraMap R C theta‖) :
    Subsingleton ((scalar F R theta).classModule ht) := by sorry
end TaelmanModel

/-- TaelmanModel_test_carlitz -/
example (theta : R) : (TaelmanModel.carlitz F R theta).polynomial =
    Ore.scalar theta + Ore.tau := by sorry
/-- TaelmanModel_test_bad_reduction -/
example (E : TaelmanModel (ZMod 2) (ZMod 2)[X] X)
    (hE : E.polynomial = Ore.scalar X + Ore.scalar (X^3) * Ore.tau) :
    (E.reduce (Ideal.span {X})).polynomial = 0 := by sorry
/-- TaelmanModel_test_zero_rank -/
example (theta : R) : (TaelmanModel.scalar F R theta).polynomial = Ore.scalar theta := by sorry
/-- lValue_test_carlitz_prime: the two finite residue-module characteristic polynomials. -/
example (b : F) :
    finiteModuleCardinality (Matrix.toLin' (!![b] : Matrix (Fin 1) (Fin 1) F)) = X - C b ∧
    finiteModuleCardinality (Matrix.toLin' (!![b+1] : Matrix (Fin 1) (Fin 1) F)) = X - C (b+1) :=
  by sorry
/-- lValue_test_bad_prime: at (θ), both local t-actions are zero, so their ratio is one. -/
example :
    let E : TaelmanModel (ZMod 2) (ZMod 2)[X] X :=
      { polynomial := Ore.scalar X + Ore.scalar (X^3) * Ore.tau, differential := by sorry }
    letI : Module.Finite (ZMod 2) (E.points ((ZMod 2)[X] ⧸ Ideal.span ({(X : (ZMod 2)[X])} : Set (ZMod 2)[X]))) := by sorry
    letI : Module.Finite (ZMod 2) (E.lie ((ZMod 2)[X] ⧸ Ideal.span ({(X : (ZMod 2)[X])} : Set (ZMod 2)[X]))) := by sorry
    E.localFactor (Ideal.span {X}) = 1 := by sorry
/-- lValue_test_scalar: all local factors of a rank-zero model are one. -/
example (theta : R) (m : Ideal R)
    [Module.Finite F ((TaelmanModel.scalar F R theta).points (R ⧸ m))]
    [Module.Finite F ((TaelmanModel.scalar F R theta).lie (R ⧸ m))] :
    (TaelmanModel.scalar F R theta).localFactor m = 1 := by sorry

/-! Small-exponent Carlitz power sums; this is a depth-one statement. -/
def monicPowerSum (F : Type*) [Field F] [Fintype F] [Algebra F L] (theta : L) (d s : ℕ) : L :=
  ∑ a ∈ (Finset.univ : Finset (Fin d → F)),
    (theta^d + ∑ i : Fin d, algebraMap F L (a i) * theta^i.val)⁻¹^s

theorem smallPowerSum (theta : L) (ht : Transcendental F theta) (d s : ℕ)
    (hs : 1 ≤ s) (hsq : s ≤ Fintype.card F) :
    monicPowerSum F theta d s = (carlitzEll (F := F) theta d)⁻¹^s := by sorry
/-- A wrong all-exponent power-sum rule fails this q=2 case. -/
example (theta : L) [Algebra (ZMod 2) L] (ht : Transcendental (ZMod 2) theta) :
    monicPowerSum (ZMod 2) theta 1 3 =
      (theta^2+theta+1) / (theta^3 * (theta+1)^3) := by sorry


/-! ## DM.6. The one-place coordinate class formula

The FA.2 supplier supplies this coordinate on the base infinity field. Finite products of
completion fields are treated as finite-dimensional vector spaces over that base field in the
reader; the signatures here specialize to R=F[θ]. No assertion about arbitrary integral rings
is inferred from the coordinate model.
-/
structure TaelmanInfinity (F C : Type*) [Field F] [Fintype F] [NormedField C] [Algebra F C]
    (theta : C) where
  equiv : LaurentSeries F ≃ₐ[F] C
  uniformizer : equiv (HahnSeries.single (-1) 1) = theta
  continuous : Continuous equiv
  continuous_inv : Continuous equiv.symm
  norm_theta : ‖theta‖ = Fintype.card F

structure TaelmanLattice (F C : Type*) [Field F] [Fintype F] [NormedField C]
    [Algebra F C] [Algebra F[X] C] (n : ℕ) where
  carrier : Submodule F[X] (Fin n → C)
  basis : Module.Basis (Fin n) F[X] carrier
  spans : Submodule.span C (carrier : Set (Fin n → C)) = ⊤
  independent : LinearIndependent C (fun i => (basis i).val)
  bounded_finite : ∀ b : ℝ, {x : Fin n → C | x ∈ carrier ∧ ‖x‖ ≤ b}.Finite

namespace TaelmanLattice
variable {C : Type*} [NormedField C] [Algebra F C] [Algebra F[X] C] {n : ℕ}

def basisMatrix (Lambda : TaelmanLattice F C n) : Matrix (Fin n) (Fin n) C :=
  Matrix.of fun i j => (Lambda.basis j).val i

def standard (F C : Type*) [Field F] [Fintype F] [NormedField C] [Algebra F C]
    [Algebra F[X] C] [IsScalarTower F F[X] C] (ht : 1 < ‖algebraMap F[X] C X‖)
    (n : ℕ) : TaelmanLattice F C n := by sorry

def scalar (F C : Type*) [Field F] [Fintype F] [NormedField C] [Algebra F C]
    [Algebra F[X] C] [IsScalarTower F F[X] C] (ht : 1 < ‖algebraMap F[X] C X‖)
    (c : C) (hc : c ≠ 0) : TaelmanLattice F C 1 := by sorry
end TaelmanLattice

namespace TaelmanInfinity
variable {C : Type*} [NormedField C] [Algebra F C] {theta : C}

def normalize (e : TaelmanInfinity F C theta) (x : C) : C :=
  x / algebraMap F C ((e.equiv.symm x).coeff (e.equiv.symm x).order)
end TaelmanInfinity

def latticeCovolume {C : Type*} [NormedField C] [Algebra F C] [Algebra F[X] C]
    {theta : C} {n : ℕ} (e : TaelmanInfinity F C theta)
    (Lambda1 Lambda2 : TaelmanLattice F C n) : C :=
  e.normalize (Lambda2.basisMatrix.det / Lambda1.basisMatrix.det)

theorem latticeCovolume_self {C : Type*} [NormedField C] [Algebra F C] [Algebra F[X] C]
    {theta : C} {n : ℕ} (e : TaelmanInfinity F C theta) (Lambda : TaelmanLattice F C n) :
    latticeCovolume e Lambda Lambda = 1 := by sorry

theorem latticeCovolume_trans {C : Type*} [NormedField C] [Algebra F C] [Algebra F[X] C]
    {theta : C} {n : ℕ} (e : TaelmanInfinity F C theta)
    (L1 L2 L3 : TaelmanLattice F C n) :
    latticeCovolume e L1 L3 = latticeCovolume e L1 L2 * latticeCovolume e L2 L3 := by sorry
/-- covolume_test_one -/
example {C : Type*} [NormedField C] [Algebra F C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (ht : 1 < ‖algebraMap F[X] C X‖) (e : TaelmanInfinity F C (algebraMap F[X] C X)) :
    latticeCovolume e (TaelmanLattice.standard F C ht 1) (TaelmanLattice.standard F C ht 1) = 1 :=
  by sorry
/-- covolume_test_scalar -/
example {C : Type*} [NormedField C] [Algebra F C] [Algebra F[X] C] [IsScalarTower F F[X] C]
    (ht : 1 < ‖algebraMap F[X] C X‖) (e : TaelmanInfinity F C (algebraMap F[X] C X))
    (hne : algebraMap F[X] C X ≠ 0) :
    latticeCovolume e (TaelmanLattice.standard F C ht 1)
      (TaelmanLattice.scalar F C ht (algebraMap F[X] C X) hne) = algebraMap F[X] C X := by sorry

namespace TaelmanModel
variable {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C] [Algebra F[X] C]
    [IsScalarTower F F[X] C]

instance {R : Type*} [CommRing R] [Algebra F R] [Algebra R C] [IsScalarTower F R C]
    {theta : R} (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) :
    AddCommGroup (E.classModule ht) :=
  inferInstanceAs (AddCommGroup (E.points C ⧸ E.classDenominator ht))
instance {R : Type*} [CommRing R] [Algebra F R] [Algebra R C] [IsScalarTower F R C]
    {theta : R} (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) :
    Module F[X] (E.classModule ht) :=
  inferInstanceAs (Module F[X] (E.points C ⧸ E.classDenominator ht))
instance {R : Type*} [CommRing R] [Algebra F R] [Algebra R C] [IsScalarTower F R C]
    {theta : R} (E : TaelmanModel F R theta) (ht : 1 < ‖algebraMap R C theta‖) :
    Module F (E.classModule ht) := by sorry

/-- Single-place, polynomial-integral specialization of the global finiteness theorem. -/
theorem classModule_finite (E : TaelmanModel F F[X] X)
    (ht : 1 < ‖algebraMap F[X] C X‖) (e : TaelmanInfinity F C (algebraMap F[X] C X)) :
    Finite (E.classModule ht) := by sorry

def classT (E : TaelmanModel F F[X] X) (ht : 1 < ‖algebraMap F[X] C X‖) :
    Module.End F (E.classModule ht) := by sorry

def classCardinality (E : TaelmanModel F F[X] X)
    (ht : 1 < ‖algebraMap F[X] C X‖) (e : TaelmanInfinity F C (algebraMap F[X] C X)) : F[X] :=
  letI : Finite (E.classModule ht) := E.classModule_finite ht e
  letI : Module.Finite F (E.classModule ht) := by sorry
  finiteModuleCardinality (E.classT ht)

def unitsLattice (E : TaelmanModel F F[X] X) (ht : 1 < ‖algebraMap F[X] C X‖)
    (e : TaelmanInfinity F C (algebraMap F[X] C X)) : TaelmanLattice F C 1 := by sorry

theorem unitsLattice_mem (E : TaelmanModel F F[X] X) (ht : 1 < ‖algebraMap F[X] C X‖)
    (e : TaelmanInfinity F C (algebraMap F[X] C X)) (x : C) :
    (fun _ : Fin 1 => x) ∈ (E.unitsLattice ht e).carrier ↔ x ∈ E.units ht := by sorry

theorem units_rank (E : TaelmanModel F F[X] X) (ht : 1 < ‖algebraMap F[X] C X‖)
    (e : TaelmanInfinity F C (algebraMap F[X] C X)) :
    Module.finrank F[X] (E.units ht) = 1 := by sorry

/-- The full global-field statement and nuclear trace proof are given in the reader. -/
theorem classNumberFormula (E : TaelmanModel F F[X] X)
    [∀ m : MaximalSpectrum F[X], Module.Finite F (E.points (F[X] ⧸ m.asIdeal))]
    [∀ m : MaximalSpectrum F[X], Module.Finite F (E.lie (F[X] ⧸ m.asIdeal))]
    (ht : 1 < ‖algebraMap F[X] C X‖) (e : TaelmanInfinity F C (algebraMap F[X] C X)) :
    E.lValue = e.equiv.symm (latticeCovolume e
      (TaelmanLattice.standard F C ht 1) (E.unitsLattice ht e)) *
        cardinalityAtInfinity (E.classCardinality ht e) := by sorry
/-- units_test_carlitz -/
example (ht : 1 < ‖algebraMap F[X] C X‖) (e : TaelmanInfinity F C (algebraMap F[X] C X))
    (x : C) : x ∈ (carlitz F F[X] X).units ht ↔
    ∃ a : F[X], x = aeval (algebraMap F[X] C X) a *
      carlitzLog (F := F) (algebraMap F[X] C X) 1 := by sorry
/-- classModule_test_carlitz -/
example (ht : 1 < ‖algebraMap F[X] C X‖) (e : TaelmanInfinity F C (algebraMap F[X] C X)) :
    Subsingleton ((carlitz F F[X] X).classModule ht) := by sorry
end TaelmanModel

/-- This integral model has a genuine nonzero class module; its leading coefficient is not a unit. -/
def scaledCarlitzModel : TaelmanModel (ZMod 2) (ZMod 2)[X] X where
  polynomial := Ore.scalar X + Ore.scalar (X^3) * Ore.tau
  differential := by sorry

section ScaledCarlitz
variable {C : Type*} [NormedField C] [CompleteSpace C] [Algebra (ZMod 2) C]
    [Algebra (ZMod 2)[X] C] [IsScalarTower (ZMod 2) (ZMod 2)[X] C]
    (ht : 1 < ‖algebraMap (ZMod 2)[X] C X‖)
    (e : TaelmanInfinity (ZMod 2) C (algebraMap (ZMod 2)[X] C X))
/-- units_test_scaled_carlitz -/
example (x : C) : x ∈ scaledCarlitzModel.units ht ↔
    ∃ a : (ZMod 2)[X], x = aeval (algebraMap (ZMod 2)[X] C X) a *
      (carlitzPeriod (F := ZMod 2) (algebraMap (ZMod 2)[X] C X)
        (-(algebraMap (ZMod 2)[X] C X)) / (algebraMap (ZMod 2)[X] C X)^3) := by sorry
/-- classModule_test_nonzero -/
example : Nonempty (scaledCarlitzModel.classModule ht ≃ₗ[(ZMod 2)[X]]
    ((ZMod 2)[X] ⧸ (Ideal.span {X} : Ideal (ZMod 2)[X]))) ∧
    scaledCarlitzModel.classCardinality ht e = X := by sorry
/-- covolume_test_scaled_period -/
example : e.normalize
    (carlitzPeriod (F := ZMod 2) (algebraMap (ZMod 2)[X] C X)
      (-(algebraMap (ZMod 2)[X] C X)) / (algebraMap (ZMod 2)[X] C X)^3) =
    carlitzPeriod (F := ZMod 2) (algebraMap (ZMod 2)[X] C X)
      (-(algebraMap (ZMod 2)[X] C X)) / (algebraMap (ZMod 2)[X] C X)^3 := by sorry
end ScaledCarlitz

/-! Nuclear determinants use compact normed F-vector spaces with the *trivial* coefficient norm.
These are Taelman's finite-nucleus determinants. Complex nuclear-operator theory is not a supplier.
-/
namespace FiniteFieldNuclear
variable (F0 : Type*) [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    (V : Type*) [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V]

def LocallyContracting (psi : V →L[F0] V) : Prop :=
  ∃ U : Submodule F0 V, IsOpen (U : Set V) ∧
    ∃ c : ℝ, 0 < c ∧ c < 1 ∧ ∀ x ∈ U, ‖psi x‖ ≤ c * ‖x‖

structure Data [CompactSpace V] where
  coefficients : ℕ → V →L[F0] V
  zero_constant : coefficients 0 = 0
  contracting : ∀ n, 0 < n → LocallyContracting F0 V (coefficients n)

variable [CompactSpace V]

def zeroData : Data F0 V where
  coefficients := fun _ => 0
  zero_constant := rfl
  contracting := by sorry
end FiniteFieldNuclear

def FiniteFieldNuclearDet {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V]
    (Phi : FiniteFieldNuclear.Data F0 V) : PowerSeries F0 := by sorry

/-- Common nuclei are finite-codimensional, invariant and uniformly contracting. -/
def FiniteFieldNuclear.CommonNucleus {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V]
    (Phi : FiniteFieldNuclear.Data F0 V) (N : ℕ) (U : Submodule F0 V) : Prop :=
  IsOpen (U : Set V) ∧ Module.Finite F0 (V ⧸ U) ∧
    ∃ c : ℝ, 0 < c ∧ c < 1 ∧ ∀ n < N, ∀ x ∈ U,
      Phi.coefficients n x ∈ U ∧ ‖Phi.coefficients n x‖ ≤ c * ‖x‖

/-- The finite quotient determinant with a specified basis and the induced coefficient maps. -/
def FiniteFieldNuclear.quotientDet {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V]
    (Phi : FiniteFieldNuclear.Data F0 V) (N : ℕ) (U : Submodule F0 V)
    (hU : FiniteFieldNuclear.CommonNucleus Phi N U) {r : ℕ} (B : Module.Basis (Fin r) F0 (V ⧸ U)) :
    PowerSeries F0 := by sorry

theorem FiniteFieldNuclearDet_trunc {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V]
    (Phi : FiniteFieldNuclear.Data F0 V) (N : ℕ) (U : Submodule F0 V)
    (hU : FiniteFieldNuclear.CommonNucleus Phi N U) {r : ℕ} (B : Module.Basis (Fin r) F0 (V ⧸ U)) :
    PowerSeries.trunc N (FiniteFieldNuclearDet Phi) = PowerSeries.trunc N (FiniteFieldNuclear.quotientDet Phi N U hU B) :=
  by sorry
/-- nuclearDet_test_zero -/
example {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0] {V : Type*}
    [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V] :
    FiniteFieldNuclearDet (FiniteFieldNuclear.zeroData F0 V) = 1 := by sorry
/-- nuclearDet_test_finite -/
example {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0] [CompactSpace F0]
    (a : F0) (Phi : FiniteFieldNuclear.Data F0 F0)
    (hPhi : ∀ n, Phi.coefficients n = if n = 1 then a • ContinuousLinearMap.id F0 F0 else 0) :
    FiniteFieldNuclearDet Phi = 1 + PowerSeries.monomial 1 a := by sorry
/-- nuclearDet_test_infinite_identity: in particular for the usual norm on F[[u]]. -/
example {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [PerfectSpace V] :
    ¬ FiniteFieldNuclear.LocallyContracting F0 V (ContinuousLinearMap.id F0 V) := by sorry

/-- The estimate is on a common local chart. The different quotient charts are in the reader. -/
def InfinitelyTangent {C : Type*} [NormedField C] (theta : C) (gamma : C → C) : Prop :=
  ∀ N : ℕ, 0 < N → ∃ r : ℝ, 0 < r ∧ ∀ x : C, ‖x‖ < r →
    ‖gamma x‖ = ‖x‖ ∧ ‖gamma x - x‖ ≤ ‖theta‖^(-(N : ℤ)) * ‖x‖

theorem infinitelyTangent_identity {C : Type*} [NormedField C] (theta : C) :
    InfinitelyTangent theta (fun x : C => x) := by sorry
/-- tangent_test_identity -/
example {C : Type*} [NormedField C] (theta : C) :
    InfinitelyTangent theta (fun x : C => x) := by sorry
/-- tangent_test_additive_exponential -/
example {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C]
    (theta : C) (ht : 1 < ‖theta‖) : InfinitelyTangent theta (carlitzExp (F := F) theta) := by sorry
/-- tangent_test_wrong_derivative -/
example {C : Type*} [NormedField C] [PerfectSpace C] (theta c : C)
    (ht : 1 < ‖theta‖) (hc : c ≠ 1) : ¬ InfinitelyTangent theta (fun x => c*x) := by sorry

/-! ## DM.7. Native module-sheaf chain component

`EllipticSheafDiagram` states the monomorphisms, Frobenius square and periodic isomorphisms.
It is explicitly a diagram component, not the full EllipticSheaf definition: rank, divisor twist,
finite-flat quotient-line support, normalization and cohomology use the existing bundle/curve
supplier and are named in the omission register. `sigma` is the given id_C × Frob_S map on
X=C×S; it is never replaced by the absolute Frobenius of X.
-/
open CategoryTheory _root_.AlgebraicGeometry

structure EllipticSheafDiagram (X : Scheme) (sigma : X ⟶ X)
    (twistInfinity : X.Modules ⥤ X.Modules) (period : ℕ) where
  sheaf : ℤ → X.Modules
  finitePresentation : ∀ i, (sheaf i).IsFinitePresentation
  locallyFree : ∀ i, (sheaf i).IsLocallyFree
  j : ∀ i, sheaf i ⟶ sheaf (i+1)
  mono_j : ∀ i, Mono (j i)
  tau : ∀ i, (Scheme.Modules.pullback sigma).obj (sheaf i) ⟶ sheaf (i+1)
  mono_tau : ∀ i, Mono (tau i)
  commutes : ∀ i, tau i ≫ j (i+1) = (Scheme.Modules.pullback sigma).map (j i) ≫ tau (i+1)
  periodic : ∀ i, sheaf (i+(period : ℤ)) ≅ twistInfinity.obj (sheaf i)

namespace EllipticSheafDiagram
variable {X : Scheme} {sigma : X ⟶ X} {twistInfinity : X.Modules ⥤ X.Modules} {period : ℕ}

structure ShiftHom (E E' : EllipticSheafDiagram X sigma twistInfinity period) (n : ℕ) where
  map : ∀ i, E.sheaf i ⟶ E'.sheaf (i+(n:ℤ))
  j_commutes : ∀ i, E.j i ≫ map (i+1) = map i ≫ E'.j (i+(n:ℤ)) ≫ eqToHom (by congr 1; omega)
  tau_commutes : ∀ i, E.tau i ≫ map (i+1) =
    (Scheme.Modules.pullback sigma).map (map i) ≫
      E'.tau (i+(n:ℤ)) ≫ eqToHom (by congr 1; omega)

/-- Uniform shift; the colimit identifying further shifts is an omitted part of the full Hom. -/
def ShiftHom.comp {E E' E'' : EllipticSheafDiagram X sigma twistInfinity period}
    {m n : ℕ} (f : ShiftHom E E' m) (g : ShiftHom E' E'' n) : ShiftHom E E'' (m+n) := by sorry
end EllipticSheafDiagram
/-- EllipticSheaf_test_rank_two: period is rδ, which is two at r=2 and rational infinity. -/
example {X : Scheme} {sigma : X ⟶ X} {T : X.Modules ⥤ X.Modules}
    (E : EllipticSheafDiagram X sigma T 2) (i : ℤ) : E.sheaf (i+2) ≅ T.obj (E.sheaf i) :=
  E.periodic i
/-- The selected affine Frobenius has a zero at the finite characteristic leg. -/
example (theta : L) : (X - Polynomial.C theta : L[X]).eval theta = 0 := by sorry
/-- shtukaExport_test_direction -/
example (theta : L) :
    ¬ IsUnit (X - Polynomial.C theta : L[X]) := by sorry


/-! ## Native completion and dual-motive comparisons -/
namespace CInfty
variable {Kinf : Type*} [NormedField Kinf] [NormedField (AlgebraicClosure Kinf)]
    [NormedAlgebra Kinf (AlgebraicClosure Kinf)]

/-- This instance is on the native completion field, with the chosen extended norm. -/
theorem isAlgClosed : IsAlgClosed (CInfty Kinf) := by sorry

/-- CInfty.norm_algebraMap for the base completion, using the extending norm. -/
theorem norm_algebraMap (x : Kinf) :
    ‖((algebraMap Kinf (AlgebraicClosure Kinf) x) : CInfty Kinf)‖ = ‖x‖ := by sorry

/-- CInfty_test_theta -/
example (theta : Kinf) (h : ‖theta‖ = Fintype.card F) :
    ‖((algebraMap Kinf (AlgebraicClosure Kinf) theta) : CInfty Kinf)‖ = Fintype.card F := by sorry

instance [Algebra F Kinf] : Algebra F (CInfty Kinf) := by sorry
/-- CInfty_test_qroot: uniqueness uses positive characteristic and existence uses algebraic closure. -/
example [Algebra F Kinf] (x : CInfty Kinf) : ∃! y : CInfty Kinf, y ^ Fintype.card F = x := by sorry
/-- CInfty_test_generic -/
example : Function.Injective (fun x : Kinf =>
    ((algebraMap Kinf (AlgebraicClosure Kinf) x) : CInfty Kinf)) := by sorry
end CInfty

/-- The matrix presentation of the broader effective inverse-twist module in Ngo Dac Definition 4.1.
Its Frobenius matrix is linearized. Ore-finiteness is an additional eligibility condition.
-/
structure EffectiveDualTMotive (F L : Type*) [Field F] [Fintype F] [Field L] [Algebra F L]
    (theta : L) (root : L ≃ₐ[F] L) (r : ℕ) where
  root_correct : ∀ x : L, root x ^ Fintype.card F = x
  matrix : Matrix (Fin r) (Fin r) L[X]
  support : ∃ n : ℕ, ∀ x : (Fin r → L[X]) ⧸ LinearMap.range (Matrix.toLin' matrix),
    (X - Polynomial.C theta)^n • x = 0

namespace EffectiveDualTMotive
variable {theta : L} {root : L ≃ₐ[F] L} {r : ℕ}

def carrier (_H : EffectiveDualTMotive F L theta root r) : Type _ := Fin r → L[X]
instance (H : EffectiveDualTMotive F L theta root r) : AddCommGroup H.carrier :=
  inferInstanceAs (AddCommGroup (Fin r → L[X]))
instance (H : EffectiveDualTMotive F L theta root r) : Module L[X] H.carrier :=
  inferInstanceAs (Module L[X] (Fin r → L[X]))
instance (H : EffectiveDualTMotive F L theta root r) : Module (InverseOre F L root) H.carrier :=
  by sorry

def sigma (H : EffectiveDualTMotive F L theta root r) (v : H.carrier) : H.carrier :=
  fun i => ∑ j, H.matrix i j * (v j).map root.toRingHom

def isAFinite (H : EffectiveDualTMotive F L theta root r) : Prop :=
  Module.Finite (InverseOre F L root) H.carrier ∧ Module.Free (InverseOre F L root) H.carrier

def baseChange (H : EffectiveDualTMotive F L theta root r) {L' : Type*} [Field L'] [Algebra F L']
    (f : L →ₐ[F] L') (root' : L' ≃ₐ[F] L')
    (hroot' : ∀ x : L', root' x ^ Fintype.card F = x)
    (h : ∀ x, f (root x) = root' (f x)) :
    EffectiveDualTMotive F L' (f theta) root' r := by sorry

/-- Broad effectivity does not silently impose Ore-finiteness. -/
def carlitz (theta : L) (root : L ≃ₐ[F] L)
    (hroot : ∀ x : L, root x ^ Fintype.card F = x) (n : ℕ) :
    EffectiveDualTMotive F L theta root 1 where
  root_correct := hroot
  matrix := fun _ _ => (X - Polynomial.C theta)^n
  support := by sorry

def dimension (H : EffectiveDualTMotive F L theta root r) : ℕ :=
  Module.finrank L ((Fin r → L[X]) ⧸ LinearMap.range (Matrix.toLin' H.matrix))

/-- dualMotive_test_carlitz -/
example (theta : L) (root : L ≃ₐ[F] L) (hroot : ∀ x : L, root x ^ Fintype.card F = x) :
    (carlitz theta root hroot 1).dimension = 1 := by sorry
/-- dualMotive_test_tensor -/
example (theta : L) (root : L ≃ₐ[F] L) (hroot : ∀ x : L, root x ^ Fintype.card F = x) (n : ℕ) :
    (carlitz theta root hroot n).dimension = n := by sorry
/-- dualMotive_test_twist: the wrong forward twist disagrees on an explicit coefficient. -/
example (theta c : L) (root : L ≃ₐ[F] L) (hroot : ∀ x : L, root x ^ Fintype.card F = x)
    (hc : root c ≠ c ^ Fintype.card F) :
    (carlitz theta root hroot 0).sigma (fun _ => Polynomial.C c) ≠
      (fun _ => Polynomial.C (c ^ Fintype.card F)) := by sorry
end EffectiveDualTMotive

/-- carlitz_test_theta_zero -/
example : (carlitz F (0 : L)).map X = Ore.tau := by sorry
/-- carlitz_test_noncommuting -/
example (theta : L) (h : theta ^ Fintype.card F ≠ theta) :
    Ore.coeff ((carlitz F theta).map (X^2)) 1 ≠ theta+theta := by sorry
/-- carlitzProducts_test_sign -/
example (theta : L) : carlitzEll (F := F) theta 1 = theta - theta ^ Fintype.card F := by sorry
/-- oreStar_test_scalar -/
example (root : L ≃ₐ[F] L) (c : L) :
    oreStar root (Ore.scalar c) = SkewPolynomial.C c := by sorry
/-- oreStar_test_monomial -/
example (root : L ≃ₐ[F] L) (c : L) (n : ℕ) :
    oreStar root (Ore.scalar c * (Ore.tau : Ore F L)^n) =
      SkewPolynomial.monomial n (root^[n] c) := by sorry
/-- oreStar_test_order -/
example (root : L ≃ₐ[F] L) (hroot : ∀ x, root x ^ Fintype.card F = x) (c : L) :
    oreStar root ((Ore.tau : Ore F L) * Ore.scalar c) =
      oreStar root (Ore.scalar c) * oreStar root (Ore.tau : Ore F L) := by sorry

namespace TModule
variable {theta : L} {d e : ℕ}
/-- The quotient giving Lie(E) dual uses the forward linearized Frobenius. -/
def motiveTauImage (E : TModule F L theta d) : Submodule L E.motive :=
  Submodule.span L (Set.range fun (m : E.motive) =>
    (show E.motive from fun i => (Ore.tau : Ore F L) * m i))

def motiveLieDual (E : TModule F L theta d) :
    (E.motive ⧸ E.motiveTauImage) ≃ₗ[L] (Fin d → L) := by sorry

/-- carlitzTensor_motive: it has motive rank one and dimension n+1. -/
def carlitzTensor_motive (theta : L) (n : ℕ) :
    (carlitzTensor F theta n).motive ≃ₗ[L[X]] (Fin 1 → L[X]) := by sorry
end TModule


namespace RelativeDrinfeldModule
variable {R : Type*} [CommRing R] [Algebra F R] {gamma : A →ₐ[F] R} {degA : A → ℕ} {r : ℕ}

def changeFrame (E : AffineRelativeDrinfeldModule F A R gamma degA r) (u : Rˣ) :
    AffineRelativeDrinfeldModule F A R gamma degA r := by sorry

theorem changeFrame_map (E : AffineRelativeDrinfeldModule F A R gamma degA r) (u : Rˣ) (a : A) :
    (changeFrame E u).map a = Ore.scalar (u : R) * E.map a * Ore.scalar ((u⁻¹ : Rˣ) : R) :=
  by sorry

/-- RelativeDrinfeldModule.coeff_changeFrame in the actual conjugated action. -/
theorem coeff_changeFrame (E : AffineRelativeDrinfeldModule F A R gamma degA r)
    (u : Rˣ) (a : A) (i : ℕ) :
    Ore.coeff ((changeFrame E u).map a) i =
      ((u ^ (1-(Fintype.card F^i : ℤ)) : Rˣ) : R) * Ore.coeff (E.map a) i := by sorry
/-- RelativeDrinfeldModule_test_nonunit: the proposed family degenerates at s=0. -/
example (theta : L) : ¬ ∃ E : AffineRelativeDrinfeldModule F F[X] L[X]
    (aeval (Polynomial.C theta)) Polynomial.natDegree 1,
    E.map X = Ore.scalar (Polynomial.C theta) + Ore.scalar X * Ore.tau := by sorry
/-- RelativeDrinfeldModule_test_frame: the leading coefficient changes with the chosen frame. -/
example (gamma : F[X] →ₐ[F] R)
    (E : AffineRelativeDrinfeldModule F F[X] R gamma Polynomial.natDegree 1) (u : Rˣ)
    (h : Ore.coeff (E.map X) 1 = 1) :
    Ore.coeff ((changeFrame E u).map X) 1 = ((u ^ (1-(Fintype.card F : ℤ)) : Rˣ) : R) := by sorry
end RelativeDrinfeldModule

/-- DrinfeldModule.test_carlitz -/
example (theta x : L) : Ore.evalEnd ((carlitz F theta).map X) x =
    theta*x + x^Fintype.card F := by sorry
/-- DrinfeldModule.test_scalar_rejected -/
example (gamma : F[X] →ₐ[F] L) :
    ¬ ∃ E : DrinfeldModule F F[X] L gamma, ∀ a, E.map a = Ore.scalar (gamma a) := by sorry
/-- DrinfeldModule.test_special_characteristic -/
example : (carlitz F (0 : L)).charIdeal = Ideal.span {X} ∧
    Function.Injective (carlitz F (0 : L)).map := by sorry
/-- DrinfeldModule.rank_test_carlitz -/
example (theta : L) : (carlitz F theta).rank = 1 := by sorry
/-- DrinfeldModule.rank_test_tau_square -/
example (E : DrinfeldModule F F[X] L (aeval (0 : L)))
    (h : E.map X = (Ore.tau : Ore F L)^2) : E.rank = 2 := by sorry

/-- latticeModule_test_carlitz: a period-generated lattice recovers the selected Carlitz sign. -/
example {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C] [Algebra F[X] C]
    [IsScalarTower F F[X] C] [IsAlgClosed C] (theta rho : C)
    (ht : 1 < ‖theta‖) (hr : rho^(Fintype.card F-1) = -theta)
    (hg : theta = algebraMap F[X] C X) (Lambda : ALattice F[X] C)
    (hLambda : ∀ x, x ∈ Lambda.carrier ↔ ∃ a : F[X],
      x = carlitzPeriod (F := F) theta rho * aeval theta a)
    (hp : 0 < Lambda.rank) :
    (Lambda.drinfeldModule (aeval theta) (by sorry) (by simpa using ht) hp).map =
      (carlitz F theta).map := by sorry

/-- uniformizable_test_drinfeld -/
example {C : Type*} [NormedField C] [CompleteSpace C] [IsAlgClosed C] [Algebra F C]
    (theta : C) (ht : 1 < ‖theta‖) (E : DrinfeldModule F F[X] C (aeval theta)) :
    (TModule.ofDrinfeld E).isUniformizable := by sorry
/-- uniformizable_test_tensor_power -/
example {C : Type*} [NormedField C] [CompleteSpace C] [IsAlgClosed C] [Algebra F C]
    (theta : C) (ht : 1 < ‖theta‖) (n : ℕ) : (carlitzTensor F theta n).isUniformizable := by sorry
/-- uniformizable_test_predicate -/
example {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C]
    (theta : C) (E : TModule F C theta 1) :
    E.isUniformizable ↔ ∀ y, ∃ x, E.exp x = y := by sorry

/-- tateGaloisAction_test_finite_field: point-coordinate part of the finite-field Tate test; the continuous absolute action is in the
omission register. Arithmetic Frobenius acts nontrivially on extension-field torsion. -/
example (S : Type uL) [Field S] [Algebra F S] [Algebra L S] [IsScalarTower F L S]
    [IsAlgClosure L S] [Fintype L] {gamma : A →ₐ[F] L}
    (E : DrinfeldModule F A L gamma) (ell : A) (g : S ≃ₐ[L] S)
    (hg : ∀ x : S, g x = x ^ Fintype.card L) (x : E.geometricTate S ell) (n : ℕ) :
    ((E.geometricGaloisAction S ell g x).val n : S) =
      (let y : S := x.val n; y ^ Fintype.card L) := by sorry


/-! Native determinant functor laws and operator coefficients for the tangent comparison. -/
namespace FiniteFieldNuclear
variable {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V]
def linearData (psi : V →L[F0] V) (hpsi : LocallyContracting F0 V psi) : Data F0 V where
  coefficients := fun n => if n = 1 then psi else 0
  zero_constant := by simp
  contracting := by sorry
end FiniteFieldNuclear

theorem FiniteFieldNuclearDet_exact {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V' V V'' : Type*} [NormedAddCommGroup V'] [IsUltrametricDist V'] [NormedSpace F0 V'] [CompactSpace V']
    [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V]
    [NormedAddCommGroup V''] [IsUltrametricDist V''] [NormedSpace F0 V''] [CompactSpace V'']
    (i : V' →L[F0] V) (p : V →L[F0] V'')
    (hi : Function.Injective i) (hp : Function.Surjective p)
    (hex : LinearMap.range i.toLinearMap = LinearMap.ker p.toLinearMap)
    (Phi' : FiniteFieldNuclear.Data F0 V') (Phi : FiniteFieldNuclear.Data F0 V)
    (Phi'' : FiniteFieldNuclear.Data F0 V'')
    (hiPhi : ∀ n, i.comp (Phi'.coefficients n) = (Phi.coefficients n).comp i)
    (hpPhi : ∀ n, p.comp (Phi.coefficients n) = (Phi''.coefficients n).comp p) :
    FiniteFieldNuclearDet Phi = FiniteFieldNuclearDet Phi' * FiniteFieldNuclearDet Phi'' :=
  by sorry

/-- Linear-in-Z instance of the cyclic law; the complete series law remains a target. -/
theorem FiniteFieldNuclearDet_cyclic {F0 : Type*} [NormedField F0] [Fintype F0] [IsUltrametricDist F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] [CompactSpace V]
    (a b : V →L[F0] V)
    (hab : FiniteFieldNuclear.LocallyContracting F0 V (a.comp b))
    (hba : FiniteFieldNuclear.LocallyContracting F0 V (b.comp a)) :
    FiniteFieldNuclearDet (FiniteFieldNuclear.linearData (a.comp b) hab) =
      FiniteFieldNuclearDet (FiniteFieldNuclear.linearData (b.comp a) hba) := by sorry

/-- Coefficients of Delta in a specified common continuous-linear coordinate.
The nuclear theorem requires the quotient-chart tangency hypotheses stated in the reader. -/
def tangentDelta {F0 : Type*} [NormedField F0]
    {V1 V2 : Type*} [NormedAddCommGroup V1] [NormedSpace F0 V1]
    [NormedAddCommGroup V2] [NormedSpace F0 V2]
    (gamma : V1 ≃L[F0] V2) (t1 : V1 →L[F0] V1) (t2 : V2 →L[F0] V2) :
    ℕ → V2 →L[F0] V2 := fun n => if n = 0 then 0 else
      (t2 - (gamma.toContinuousLinearMap.comp t1).comp gamma.symm.toContinuousLinearMap).comp
        (t2 ^ (n-1))

theorem tangentDelta_identity {F0 : Type*} [NormedField F0]
    {V : Type*} [NormedAddCommGroup V] [IsUltrametricDist V] [NormedSpace F0 V] (t : V →L[F0] V) (n : ℕ) :
    tangentDelta (ContinuousLinearEquiv.refl F0 V) t t n = 0 := by sorry

namespace ALattice
variable {C : Type*} [NormedField C] [CompleteSpace C]
    [Algebra F C] [Algebra F[X] C] [IsScalarTower F F[X] C]
def principal (ht : 1 < ‖algebraMap F[X] C X‖) : ALattice F[X] C := by sorry

theorem principal_carrier (ht : 1 < ‖algebraMap F[X] C X‖) :
    (principal (F := F) ht).carrier = Submodule.span F[X] ({1} : Set C) := by sorry
end ALattice
/-- ALattice_test_principal -/
example {C : Type*} [NormedField C] [CompleteSpace C] [Algebra F C] [Algebra F[X] C]
    [IsScalarTower F F[X] C] (ht : 1 < ‖algebraMap F[X] C X‖) :
    (ALattice.principal (F := F) ht).rank = 1 := by sorry
/-- ALattice_test_discrete_constants: an infinite norm-bounded constant set is rejected. -/
example {C : Type*} [NormedField C] [Algebra (AlgebraicClosure F) C] :
    Set.Infinite {x : C | ∃ a : AlgebraicClosure F,
      x = algebraMap (AlgebraicClosure F) C a ∧ ‖x‖ ≤ 1} := by sorry


end TauCeti.Drinfeld

/-! ## Packet interface register
Every packet name is indexed below. A declared signature or example still has the scope stated
for its target. An omission is a named mathematical target, not an arbitrary proposition or a
claim that it has a native declaration. The reader and packet retain its exact statement.

DrinfeldModulesAndTModules:DM.0/drinfeld-module — Drinfeld modules
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
DrinfeldModule.map: signature above.
DrinfeldModule.constantCoeff_map: signature above.
DrinfeldModule.charIdeal: signature above.
DrinfeldModule.baseChange: signature above.
DrinfeldModule.test_carlitz: example above, within the stated target scope.
DrinfeldModule.test_scalar_rejected: example above, within the stated target scope.
DrinfeldModule.test_special_characteristic: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.0/rank-polynomial-ring — Rank over the polynomial ring
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: For A=F[t] and φ_t=θ+g_1τ+⋯+g_rτ^r with g_r≠0, r≥1, every nonzero a∈F[t] satisfies deg_τ φ_a=r deg_t a. If d=deg a, its leading coefficient is lc(a)·g_r^(Σ_{i=0}^{d−1}q^(ri)), with empty exponent sum zero.

DrinfeldModulesAndTModules:DM.0/rank-general — The general rank theorem
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: For A=Γ(C−∞,O_C) with arbitrary δ=deg∞, a field Drinfeld A-module has a unique integer r≥1 such that deg_τφ_a=r deg_A(a), where deg_A(a)=−δ ord∞(a)=log_q #(A/(a)), for all a≠0. A rational ∞ is not assumed. The assertion includes integrality of r.

DrinfeldModulesAndTModules:DM.0/rank — The rank invariant
The native rank signatures specialize to F[t]. General A and the degree-δ normalization require the FA.1 function-ring contract and the integral-rank gap.
DrinfeldModule.rank: signature above.
DrinfeldModule.rank_pos: signature above.
DrinfeldModule.rank_baseChange: signature above.
DrinfeldModule.rank_test_carlitz: example above, within the stated target scope.
DrinfeldModule.rank_test_tau_square: example above, within the stated target scope.
DrinfeldModule.rank_test_infinity_degree: OMITTED — At a point ∞ of degree δ, using −ord∞(a) alone yields δr, and fails the normalization whenever δ>1.

DrinfeldModulesAndTModules:DM.0/carlitz-module — The Carlitz module
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
carlitz: signature above.
carlitz_map_X: signature above.
carlitz_rank: signature above.
carlitz_constantCoeff: signature above.
carlitz_test_square: example above, within the stated target scope.
carlitz_test_theta_zero: example above, within the stated target scope.
carlitz_test_noncommuting: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom — Morphisms and isogenies
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
DrinfeldModule.Hom: signature above.
DrinfeldModule.Hom.comp: signature above.
DrinfeldModule.Hom.smul: signature above.
DrinfeldModule.isogeny_iff: signature above.
Hom_test_identity: example above, within the stated target scope.
Hom_test_scalar_conjugation: example above, within the stated target scope.
Hom_test_extra_endomorphism: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.0/isogeny-rank — Rank invariance and separability
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: A nonzero intertwiner u:φ→ψ over a field forces rank φ=rank ψ. Its kernel has scheme order q^(deg_τu); it is étale iff ∂u≠0. In generic characteristic ∂u≠0 for every nonzero u. In special characteristic a Frobenius isogeny may have ∂u=0.

DrinfeldModulesAndTModules:DM.0/kernel-scheme — Drinfeld kernel schemes
Native affine quotient coordinates and points are given. Their closed group-scheme structure and natural base-change comparison import Tau Ceti Hopf kernels and the relative vector-group interface.
DrinfeldKernel.coordinateAlgebra: signature above.
DrinfeldKernel.points: signature above.
DrinfeldKernel.baseChange: signature above.
DrinfeldKernel_test_scalar: example above, within the stated target scope.
DrinfeldKernel_test_frobenius: example above, within the stated target scope.
DrinfeldKernel_test_etale: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module — Relative Drinfeld modules
Affine standard actions, actual frame conjugation and fibre rank are native. The full relative line-bundle vector group, twisted coefficient sheaves and scheme pullbacks use the existing bundle supplier.
RelativeDrinfeldModule.pullback: signature above.
RelativeDrinfeldModule.coeff_changeFrame: signature above.
RelativeDrinfeldModule.rank_fiber: signature above.
RelativeDrinfeldModule_test_field: OMITTED — Over Spec L with E=O, recover the field definition and rank.
RelativeDrinfeldModule_test_nonunit: example above, within the stated target scope.
RelativeDrinfeldModule_test_frame: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.0/relative-standardization — Standardization over nonreduced bases
The unique nonlinear nilpotent Ore conjugation is a mathematical target. Its native relative automorphism signature is omitted until the standardization proof and line-bundle interface are fixed.
Named target: The relative definition that allows nilpotent coefficients above r deg_A(a) is equivalent to the standard line-bundle definition: locally a unique additive coordinate change with constant coefficient one removes the higher nilpotent terms. Between standard forms, invertible intertwining coordinate changes are scalar. This theorem is required before treating arbitrary additive coordinates as linear frames.

DrinfeldModulesAndTModules:DM.0/carlitz-products — Carlitz denominator products
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
carlitzBracket: signature above.
carlitzD: signature above.
carlitzEll: signature above.
carlitzD_succ: signature above.
carlitzEll_succ: signature above.
carlitzProducts_test_zero: example above, within the stated target scope.
carlitzProducts_test_two: example above, within the stated target scope.
carlitzProducts_test_sign: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.1/ideal-torsion — Ideal torsion
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
DrinfeldModule.idealTorsion: signature above.
DrinfeldModule.idealTorsion_principal: signature above.
DrinfeldModule.idealTorsion_baseChange: signature above.
DrinfeldModule.idealTorsion_crt: signature above.
idealTorsion_test_unit: example above, within the stated target scope.
idealTorsion_test_carlitz: example above, within the stated target scope.
idealTorsion_test_scheme_points: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.1/finite-flat-torsion — Finite locally free torsion
Principal affine coordinates are native; the nonprincipal finite locally free group-scheme degree uses the strict finite-shtuka supplier.
Named target: E[I] is finite locally free over S of degree #(A/I)^r for every nonzero ideal I. This holds without I being principal and without invertibility of γ(I). The corresponding effective motive satisfies Dr_q(M/IM)≅E[I] in the finite-shtuka/strict-group comparison.

DrinfeldModulesAndTModules:DM.1/etale-torsion — The prime-to-characteristic condition
Derivative and principal polynomial tests are native. The full relative finite-étale morphism theorem uses the scheme-level torsion interface.
Named target: E[I] is étale over S iff γ(I)O_S=O_S. Over a field this means I is coprime to ker γ. For a principal ideal the derivative is γ(a). An isogeny has an invertible differential exactly when its kernel is étale.

DrinfeldModulesAndTModules:DM.1/geometric-torsion-basis — Geometric torsion bases
The full nonprincipal ideal-quotient basis and finite-shtuka dualizing pairing require the shared strict finite-group realization interface.
Named target: If I is prime to the characteristic and Ω is a separably closed coefficient field, E[I](Ω) is a free A/I-module of rank r. For its motive, (M/IM)^τ is free of the same rank; the realization of E[I] is its finite-field dual, with the dualizing A/I-module Hom_F(A/I,F) made explicit.

DrinfeldModulesAndTModules:DM.1/tate-module — Drinfeld Tate modules
The native inverse limit uses a chosen element ell; the quotient and rank signatures specialize to principal prime ideals. The full A_lambda action and nonprincipal division-coordinate independence need FA.2 and finite-shtuka limits.
DrinfeldModule.tateModule: signature above.
DrinfeldModule.tateModule_mod: signature above.
DrinfeldModule.tateMap: signature above.
DrinfeldModule.tateModule_rank: signature above.
tateModule_test_carlitz: example above, within the stated target scope.
tateModule_test_tau_square: example above, within the stated target scope.
tateModule_test_isogeny: example above, within the stated target scope.
tateModule_test_char_rejected: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.1/continuous-galois-action — The continuous Tate representation
Coefficient automorphism actions and their coordinate equivariance are native. The continuous absolute-Galois representation, topology and completed coefficient-module action require FA.2 and the finite-shtuka limit interface.
DrinfeldModule.tateGaloisAction: signature above.
DrinfeldModule.tateGaloisAction_mod: signature above.
DrinfeldModule.tateMap_equivariant: signature above.
tateGaloisAction_test_sepclosed: example above, within the stated target scope.
tateGaloisAction_test_finite_field: example above, within the stated target scope.
tateGaloisAction_test_basis: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.1/characteristic-local-realization — The characteristic-place realization
The connected affine kernels and a residue-degree Frobenius calculation are native tests. The completed characteristic factor, bound and finite-shtuka comparison require HS2 and SF.2; no separable-point representation replaces them.
DrinfeldModule.charLocalRealization: OMITTED — The distinguished completed module with τ^f.
DrinfeldModule.charLocalRealization_rank: OMITTED — Its R[[z]]-rank is r.
DrinfeldModule.charLocalRealization_mod: OMITTED — The finite reductions realize the full characteristic torsion group schemes.
charLocal_test_supersingular: example above, within the stated target scope.
charLocal_test_residue_degree: example above, within the stated target scope.
charLocal_test_points_insufficient: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/c-infinity — The analytic coefficient field
The native type is the uniform completion of an algebraic closure equipped with an explicitly supplied extending norm. FA.2 supplies that norm and the infinity field; no new completion type is planned.
CInfty: signature above.
CInfty.norm_algebraMap: signature above.
CInfty.isAlgClosed: signature above.
CInfty.complete: signature above.
CInfty_test_theta: example above, within the stated target scope.
CInfty_test_qroot: example above, within the stated target scope.
CInfty_test_generic: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/a-lattice — Projective A-lattices
The native positive-rank finite projective submodule uses finite bounded-ball intersections. Principal and algebraic-constant tests are stated. The nonprincipal ideal example needs the FA.1 ring and FA.2 embedding and norm data.
ALattice: signature above.
ALattice.rank: signature above.
ALattice.scale: signature above.
ALattice.quotient_card: signature above.
ALattice_test_principal: example above, within the stated target scope.
ALattice_test_nonprincipal: OMITTED — For a nonprincipal ideal I⊂A embedded in K_∞, I is a rank-one projective lattice and is not free as an A-module.
ALattice_test_discrete_constants: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/lattice-exponential — Lattice exponential
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
ALattice.exp: signature above.
ALattice.exp_add: signature above.
ALattice.exp_ker: signature above.
ALattice.exp_scale: signature above.
latticeExp_test_derivative: example above, within the stated target scope.
latticeExp_test_kernel: example above, within the stated target scope.
latticeExp_test_scaling: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/lattice-drinfeld-module — The module of a lattice
The native construction specializes to F[t]. The general A action, rank and scalar-change comparisons require the function-ring interface and the uniformization proof gap.
ALattice.drinfeldModule: signature above.
ALattice.exp_functionalEquation: signature above.
ALattice.drinfeldModule_rank: signature above.
ALattice.drinfeldModule_scale: signature above.
latticeModule_test_one: example above, within the stated target scope.
latticeModule_test_linear: example above, within the stated target scope.
latticeModule_test_carlitz: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/uniformization — Drinfeld uniformization
The full general-A analytic surjectivity and projective kernel theorem is a mathematical target; its exact native signature awaits the FA.1/FA.2 interfaces and the stated analytic proof input.
Named target: Every rank-r Drinfeld A-module φ over C_∞ in generic characteristic has a unique entire F-linear exponential exp_φ with derivative one and exp_φ(az)=φ_a(exp_φ(z)). It is surjective; its kernel is a projective A-lattice of rank r. These functors give an equivalence between field Drinfeld modules over C_∞ and A-lattices with scalar morphisms. No automatic statement is asserted for arbitrary t-modules or families.

DrinfeldModulesAndTModules:DM.2/exponential-morphisms — Morphisms in uniformization
The general-A scalar/morphism dictionary requires the general-A uniformization object; the coordinate Ore intertwiners are already native.
Named target: For φ,ψ over C_∞, differentiation gives a bijection Hom(φ,ψ)≅{c∈C_∞:cΛ_φ⊂Λ_ψ}; the corresponding polynomial u satisfies u(exp_φ(z))=exp_ψ(cz). It is compatible with A-actions, identities and composition. In particular scalar homothety classifies isomorphisms.

DrinfeldModulesAndTModules:DM.2/carlitz-exponential — Carlitz exponential and logarithm
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
carlitzExp: signature above.
carlitzExp_functionalEquation: signature above.
carlitzLog: signature above.
carlitzExp_log_one: signature above.
carlitzExp_test_coeff: example above, within the stated target scope.
carlitzExp_test_zero: example above, within the stated target scope.
carlitzExp_test_log_sign: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/carlitz-period — The Carlitz period
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
carlitzPeriod: signature above.
carlitzPeriod_ker: signature above.
carlitzPeriod_norm: signature above.
carlitzPeriod_changeRoot: signature above.
carlitzPeriod_test_zero: example above, within the stated target scope.
carlitzPeriod_test_sign: example above, within the stated target scope.
carlitzPeriod_test_norm: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/omega — The Anderson–Thakur Omega function
The native function is a power series with all disk restrictions and the inverse-twist equation. Its entire/Tate interpretations import restricted-series analytic comparisons and the DM.8 coefficient-twist convention.
carlitzOmega: signature above.
carlitzOmega_twist: signature above.
carlitzOmega_at_theta: signature above.
carlitzOmega_zeros: signature above.
carlitzOmega_test_constant: example above, within the stated target scope.
carlitzOmega_test_theta: example above, within the stated target scope.
carlitzOmega_test_tate_unit: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.2/period-power — The invariant Carlitz period power
The exact normalized product identity is stated mathematically; its K-infinity membership signature requires the FA.2 embedding rather than an arbitrary coefficient-field membership predicate.
Named target: π_BP^(q−1)=π_ND^(q−1)=−θ^q∏_{i≥1}(1−θ^(1−q^i))^(−(q−1)) belongs to K_∞×. It is independent of the root ρ. The period itself need not lie in K_∞ when q>2.

DrinfeldModulesAndTModules:DM.3/level-structure — Prime-to-characteristic level structures
PointDrinfeldLevel is the split geometric-point specialization. DrinfeldLevel and its pullback/forget/change API are finite-étale group-scheme isomorphisms, which require the fractional-ideal constant-group and relative torsion supplier.
DrinfeldLevel: OMITTED — An A-linear finite étale group-scheme isomorphism (N⁻¹/A)^r_S≅E[N].
DrinfeldLevel.pullback: OMITTED — Pullback of E and the level along an A[1/N]-scheme map.
DrinfeldLevel.forget: OMITTED — Restrict a level-N′ structure to N-torsion for N′⊂N.
DrinfeldLevel.change: OMITTED — GL_r(A/N) acts by precomposition after the ideal-quotient identification; the intrinsic frame group is Aut_A((N⁻¹/A)^r).
DrinfeldLevel_test_rank_one: example above, within the stated target scope.
DrinfeldLevel_test_basis: example above, within the stated target scope.
DrinfeldLevel_test_characteristic: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.3/moduli-functor — The Drinfeld moduli stack
The groupoid/stack, descent, atlas and quotient tests need the SF.1 fibred-category and relative line-bundle interfaces. Sets of isomorphism classes are explicitly insufficient.
DrinfeldModuli: OMITTED — The fibred groupoid of rank-r relative Drinfeld modules.
DrinfeldModuli.pullback: OMITTED — Base pullback with identity/composition coherence.
DrinfeldModuli.levelAtlas: OMITTED — The fine level scheme gives an étale atlas on A[1/N].
DrinfeldModuli.quotientPresentation: OMITTED — The quotient stack of the level atlas by the frame group is the unlevelled stack on that base.
DrinfeldModuli_test_rank_one: OMITTED — The unlevelled Carlitz object has the scalar automorphism group F×; a full nontrivial good level has trivial stabilizer.
DrinfeldModuli_test_dimension: OMITTED — Relative dimensions at ranks one and two are zero and one.
DrinfeldModuli_test_iso_classes: OMITTED — Replacing each groupoid by its set of isomorphism classes loses the automorphism group when q>2.

DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme — Fine level representability and smoothness
The native universal-family representability signature requires DrinfeldModuli and SF.1/SF.2; the exact principal-level chart/deformation proof is a recorded gap.
Named target: For any nonzero proper N⊂A, the full level-N functor over Spec A[1/N] is represented by an affine smooth scheme M_r(N) of finite type and relative dimension r−1, with universal family. For a compact open K⊂GL_r(Â), call K fine if its image in some GL_r(A/p) is unipotent. Write N_K for the largest ideal with K(N_K)⊂K. The K-level moduli scheme over A[1/N_K] is a fine smooth moduli scheme when K is fine; for general K it is coarse. These assertions do not require the two-prime condition needed for an all-characteristics level functor over Spec A.

DrinfeldModulesAndTModules:DM.3/generalized-drinfeld-module — Generalized Drinfeld modules
The native trivialized affine action retains the global degree bound and positive fibre ranks. Twisted line-bundle coefficients and weak separation require the full classifying stack; weak separation is not asserted stable under arbitrary base change.
GeneralizedDrinfeldModule: OMITTED — Bounded F-linear action on a line bundle with positive-rank field fibers.
GeneralizedDrinfeldModule.coefficient: coordinate above as AffineGeneralizedDrinfeldModule.coefficient.
GeneralizedDrinfeldModule.pullback: coordinate above as AffineGeneralizedDrinfeldModule.pullback.
GeneralizedDrinfeldModule.isWeaklySeparating: OMITTED — Every geometric isomorphism class has a finite fiber in S(L).
generalized_test_boundary: example above, within the stated target scope.
generalized_test_scalar: example above, within the stated target scope.
generalized_test_nilpotents: example above, within the stated target scope.
generalized_test_constant_family: OMITTED — A constant family over a positive-dimensional affine line is not weakly separating.

DrinfeldModulesAndTModules:DM.3/satake-compactification — The generic Satake compactification
The normal proper generic compactification, dense immersion, extended family and uniqueness require the native moduli, scheme and bundle interfaces. General boundary stratification and unrestricted arithmetic base change are not inferred.
DrinfeldSatake: OMITTED — The normal proper generic compactification with its generalized family.
DrinfeldSatake.openImmersion: OMITTED — M_r(K)↪M̄_r(K), dense.
DrinfeldSatake.unique: OMITTED — A unique compatible isomorphism joins any two such compactifications.
DrinfeldSatake.changeLevel: OMITTED — A finite level map extends uniquely to the compactifications, compatibly with compositions.
satake_test_rank_one: OMITTED — The compactification equals the zero-dimensional rank-one moduli scheme.
satake_test_rank_two: OMITTED — For F[t] and level (t), its generic rank-two compactification is P¹ with q+1 cusps.
satake_test_general_boundary: OMITTED — Normal projectivity and weak separation alone do not provide a named disjoint union of every lower-rank moduli stratum.

DrinfeldModulesAndTModules:DM.3/reciprocal-compactification — The principal-level reciprocal model
Reciprocal.ring is the native ungraded subalgebra of a fraction field and has reciprocal relations. The grading, Proj, universal O(-1) action, Lie dual and rank-two geometric test require SF.4; the normality proof is a recorded input.
DrinfeldReciprocalRing: coordinate above as Reciprocal.ring.
DrinfeldReciprocalScheme: OMITTED — Q_r=Proj R(V).
DrinfeldReciprocalScheme.universalAction: OMITTED — The bounded action tX∏(1−X/v) on O(−1).
DrinfeldReciprocalScheme.lieDual: OMITTED — Lie(E)∨≅O(1).
reciprocal_test_rank_one: example above, within the stated target scope.
reciprocal_test_rank_two: OMITTED — Q_2 is P¹ and its open removes the q+1 F-rational points.
reciprocal_test_product_scalar: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.3/modular-forms — Algebraic Drinfeld modular forms
Global sections, tensor multiplication, reduced-boundary restriction and level invariants require the Satake scheme and its native invertible sheaf. The full section and dimension tests are omitted until those interfaces are fixed.
DrinfeldModularForm: OMITTED — Global sections of ω^⊗k.
DrinfeldModularForm.mul: OMITTED — Weight-k and weight-l sections multiply to weight k+l.
DrinfeldModularForm.cusp: OMITTED — Kernel of restriction to the reduced boundary.
DrinfeldModularForm.levelInvariants: OMITTED — At a fine normal sublevel K′, M_k(K)=M_k(K′)^(K/K′).
modularForm_test_one: OMITTED — The constant section 1 is a weight-zero form.
modularForm_test_rank_two: OMITTED — At A=F[t], level (t), rank two, ω has degree q and dim M_k=qk+1; for k≥1 the q+1 cusp vanishing conditions give dim cusp forms qk−q.
modularForm_test_boundary: OMITTED — A section on the open moduli scheme with a pole at a cusp is not a global section on the compactification.

DrinfeldModulesAndTModules:DM.3/hecke-correspondence — Drinfeld Hecke correspondences and operators
The compact finite correspondence, trace on the form line and double-coset composition require the Satake and section interfaces; no abstract set map substitutes for the finite geometric trace.
DrinfeldHecke: OMITTED — The pair J_1,J_g from K∩g⁻¹Kg.
DrinfeldHecke.pullback: OMITTED — The section map using the Lie-dual identification.
DrinfeldHecke.trace: OMITTED — The coset sum pushforward.
DrinfeldHecke.operator: OMITTED — T_g=(J_g)_*J_1^*.
DrinfeldHecke.doubleCoset: OMITTED — KgK=KhK implies T_g=T_h.
Hecke_test_identity: OMITTED — For g=1 and K′=K, T_1=id.
Hecke_test_level_trace: OMITTED — For a fine normal sublevel K′⊂K, trace∘pullback=[K:K′] id.
Hecke_test_characteristic_index: OMITTED — If p divides [K:K′], that composite is zero on forms; a normalized trace dividing by the degree is undefined.

DrinfeldModulesAndTModules:DM.3/integral-compactification — The arithmetic Satake compactification
The integral normal/projective/flat compactification and finite surjective open level maps require SF.4 and the extended generalized family. Special-fibre normality or Cohen–Macaulayness is not asserted.
Named target: For every fine compact open K⊂GL_r(Â), with N_K the largest ideal satisfying K(N_K)⊂K, M_r(K) over Spec A[1/N_K] has a normal integral projective flat Satake compactification carrying a weakly separating generalized Drinfeld module extending the universal family. Both are unique up to unique compatible isomorphism, and the Lie-dual line is ample. For fine K′⊂K, the level map extends to a finite surjective open map after extending the base to A[1/N_K′], and pulls back the family and Lie-dual line. No flatness of this finite level map or normality/Cohen–Macaulayness of every special fiber is asserted.

DrinfeldModulesAndTModules:DM.4/t-module — Anderson t-modules
The native affine-coordinate t-module and matrix Hom are given. The full relative vector-group version imports existing bundles; differential is theta times identity plus a nilpotent matrix.
TModule: signature above.
TModule.differential: signature above.
TModule.Hom: signature above.
TModule.isAbelian: signature above.
TModule.ofDrinfeld: signature above.
TModule_test_carlitz: example above, within the stated target scope.
TModule_test_nilpotent: example above, within the stated target scope.
TModule_test_semisimple_differential: example above, within the stated target scope.
TModule_test_nonabelian: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/effective-a-motive — Effective A-motives
EffectiveTMotive is the finite-free F[t]-coordinate presentation with an injective linearization and characteristic-supported cokernel. General projective A-tensor modules and their matrix-localization/descent API need FA.1 and SF.0/SF.2; the scope is not silently replaced by the free case.
EffectiveAMotive: OMITTED — Finite projective M with τ_M:σ*M→M and the specified cokernel.
EffectiveAMotive.rank: coordinate above as EffectiveTMotive.rank.
EffectiveAMotive.dimension: coordinate above as EffectiveTMotive.dimension.
EffectiveAMotive.baseChange: coordinate above as EffectiveTMotive.baseChange.
EffectiveAMotive.matrix: coordinate above as EffectiveTMotive.matrix.
EffectiveAMotive_test_carlitz: example above, within the stated target scope.
EffectiveAMotive_test_tensor: example above, within the stated target scope.
EffectiveAMotive_test_support: example above, within the stated target scope.
EffectiveAMotive_test_linearization: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/contravariant-motive — The contravariant motive functor
The native coordinate motive, reversed maps and linearized tau-image Lie-dual quotient are given. General A-projectivity and relative descent use the effective A-motive supplier.
TModule.motive: signature above.
TModule.motiveMap: signature above.
TModule.motiveMap_comp: signature above.
TModule.motiveLieDual: signature above.
motive_test_carlitz: example above, within the stated target scope.
motive_test_variance: example above, within the stated target scope.
motive_test_dimension_rank: example above, within the stated target scope.
motive_test_scalar_not_finite: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence — The abelian Anderson anti-equivalence
The general relative effective A-motive anti-equivalence is a full mathematical target. The native affine motive and its variance do not by themselves supply the strict group/sheaf reconstruction.
Named target: The contravariant functor E↦M(E) is fully faithful from abelian Anderson A-modules over R to effective A-motives. Its essential image consists exactly of effective motives that become finite free left R′{τ}-modules after a faithfully flat coefficient extension R→R′. Rank over A_R is the Anderson rank, and coker τ_M has R-rank equal to the group dimension. For polynomial A over a field, the corresponding category is effective L[t]-motives finite free over L{τ}; this is not the category of all effective A-motives.

DrinfeldModulesAndTModules:DM.4/purity — Purity of polynomial-ring motives
The native infinity lattice uses Laurent series and an actual semilinear matrix. Its raw-image formulation uses perfect coefficients; an imperfect-field version needs the linearized scalar pullback. General A and purity descent use the function-ring/infinity interfaces.
EffectiveTMotive.isPure: signature above.
EffectiveTMotive.weight: signature above.
EffectiveTMotive.weight_eq: signature above.
EffectiveTMotive.pureTensor: signature above.
purity_test_carlitz: example above, within the stated target scope.
purity_test_tensor_power: example above, within the stated target scope.
purity_test_mixed: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/uniformizability — Uniformizable t-modules
The native exponential, its functional equation and surjectivity predicate are coordinate statements. The full general-A projective period lattice and its rank require the analytic input; rigid triviality is an outgoing DM.8 comparison.
TModule.exp: signature above.
TModule.exp_functionalEquation: signature above.
TModule.isUniformizable: signature above.
TModule.periodLattice: signature above.
uniformizable_test_drinfeld: example above, within the stated target scope.
uniformizable_test_tensor_power: example above, within the stated target scope.
uniformizable_test_predicate: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/carlitz-tensor-power — Carlitz tensor powers
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
carlitzTensor: signature above.
carlitzTensor_differential: signature above.
carlitzTensor_motive: coordinate above as TModule.carlitzTensor_motive.
carlitzTensor_rank_dimension: signature above.
carlitzTensor_test_one: example above, within the stated target scope.
carlitzTensor_test_two: example above, within the stated target scope.
carlitzTensor_test_rank: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/inverse-twist-dual-motive — Effective dual t-motives
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
EffectiveDualTMotive: signature above.
EffectiveDualTMotive.matrix: signature above.
EffectiveDualTMotive.isAFinite: signature above.
EffectiveDualTMotive.baseChange: signature above.
dualMotive_test_carlitz: example above, within the stated target scope.
dualMotive_test_tensor: example above, within the stated target scope.
dualMotive_test_twist: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/star-adapter — The star anti-isomorphism
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
oreStar: signature above.
oreStar_mul: signature above.
matrixOreStar: signature above.
TModule.dualMotive: signature above.
TModule.dualMotiveMap: signature above.
oreStar_test_scalar: example above, within the stated target scope.
oreStar_test_monomial: example above, within the stated target scope.
oreStar_test_order: example above, within the stated target scope.
oreStar_test_matrix: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.4/dual-realization — Dual motives and t-module points
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: For the row dual module H=L[σ]^{1×d} associated to Φ over a perfect field, define δ₁(Σ h_iσ^i)=Σ h_i^(q^i) coordinatewise. It induces an F-linear A-module isomorphism H/(σ−1)H≅E(L), with the t-action inherited from Φ_t*. The denominator means the F-linear image of σ−1, not an L-linear submodule. For an effective dual motive finite free over both L[t] and L[σ], this reconstructs its A-finite t-module; over perfect L this is abelian as well: Maurischat Theorem 6.6 proves abelian iff A-finite, and Corollary 8.1 extends this equivalence to Anderson A-modules by restriction along a finite extension A/F[t]. This theorem concerns finite generation of the motive of an actual Anderson module; it does not add Ore-finiteness to the broader effective dual-motive definition.

DrinfeldModulesAndTModules:DM.5/rational-motive-realization — Rational motives and their Tate realization
The rational A-isomotive category, completed residue factors, fixed-module realizations and point/motive duality require FA.2 and SF.2. The literal completion of point Hom below is not a period-ring substitute.
AMotive.HomIsogeny: OMITTED — K_0⊗A Hom(M,N).
AMotive.rationalTate: OMITTED — The completed τ-fixed rational realization.
AMotive.rationalTateMap: OMITTED — A motive morphism acts covariantly on τ-invariants.
DrinfeldModule.motiveTateDual: OMITTED — V_λ(E)≅V_λ(M(E))∨ with equivariant finite-level pairing.
rationalMotive_test_identity: OMITTED — The identity motive morphism realizes as the identity.
rationalMotive_test_isogeny: OMITTED — A nonzero Drinfeld isogeny becomes an isomorphism after rationalization.
rationalMotive_test_carlitz_dual: OMITTED — The rank-one Carlitz motive realization has inverse character to the Carlitz point realization; identifying them without dualization reverses the Galois character.

DrinfeldModulesAndTModules:DM.5/tate-hom-map — The Tate Hom map
The native completed-tensor Hom map targets coefficient-automorphism-equivariant principal Tate modules. Its full absolute-Galois and rational-motive formulation uses FA.2/SF.2.
DrinfeldModule.tateHomMap: signature above.
DrinfeldModule.tateHomMap_pure: signature above.
DrinfeldModule.tateHomMap_comp: signature above.
DrinfeldModule.tateHomMap_rational: OMITTED — Scalar extension to K_0,λ is the rational comparison.
tateHom_test_identity: example above, within the stated target scope.
tateHom_test_scalar: example above, within the stated target scope.
tateHom_test_extra_endomorphisms: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.5/tate-injectivity — Injectivity of the Tate comparison
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: The natural integral Tate comparison α_λ is injective for field Drinfeld modules with λ away from characteristic. In particular a morphism acting as zero on every λ-power torsion scheme is zero. The tensor statement uses finite torsion-freeness of the Hom A-module, not only pointwise injectivity of u↦T_λu.

DrinfeldModulesAndTModules:DM.5/local-algebraization — Local algebraization of motive maps
The exact finite-generation and scalar-extension full-faithfulness theorem is a mathematical target; the rational coefficient field and complete Frobenius-module native interfaces are not replaced by arbitrary types.
Named target: Let L be finitely generated over F. Put K_0,L=Frac(K_0⊗F L), K_0,λ,L=Frac(K_0,λ⊗F L), and L_(λ)=Frac((F_λ⊗F L)[[z]]). A restricted module means a finite projective module with invertible Frobenius linearization; at λ it has a finite-projective integral lattice with invertible Frobenius. Extension K_0,L→K_0,λ,L is K_0,λ/K_0-fully faithful on such modules and preserves semisimple objects. Extension K_0,λ,L→L_(λ) is fully faithful on the λ-restricted objects and preserves semisimple objects. Thus completed Frobenius-equivariant maps are algebraized over the rational coefficient ring. The first ring is not the full completed Laurent-series ring unless L is finite.

DrinfeldModulesAndTModules:DM.5/period-ring — The Tate period ring
The two distinct fixed fields, divisor-by-divisor valuation bounds, localization and semilinear comparison require the FA.2/rational-motive coefficient interfaces. An unconstrained series ring would state a different theorem.
TatePeriodRing: OMITTED — The valuation-bounded ring B⁺ localized at the specified Frobenius units.
TatePeriodRing.sigmaFixed: OMITTED — B^σ=K_0,λ.
TatePeriodRing.galoisFixed: OMITTED — B^G_L=K_0,λ,L.
TatePeriodRing.comparison: OMITTED — B⊗V_λ(M)≅B⊗M for λ-restricted systems.
TatePeriodRing_test_constants: OMITTED — The scalar K_0,λ embeds into B and is σ-fixed.
TatePeriodRing_test_galois: OMITTED — The fixed ring is K_0,λ,L, not all of L_(λ), when L has positive transcendence degree.
TatePeriodRing_test_solution: OMITTED — Every coordinate of a τ-fixed basis vector for a λ-restricted system lies in B.

DrinfeldModulesAndTModules:DM.5/tate-image-saturation — Integral Hom division and saturation
The native principal divisibility statement is given. The nonprincipal integral Hom-lattice result retains the explicit saturation proof gap.
Named target: For E,E′ over the same coefficient field and λ away from characteristic, the image of A_λ⊗A Hom_L(E,E′) in Hom_(A_λ,G_L)(T_λE,T_λE′) is saturated. Equivalently, if z·h is in the image for a local uniformizer z and h is an integral equivariant Tate map, then h is in the image. Prove this by finite-level kernel factorization/divisibility of algebraic intertwiners, using descent of the quotient isogeny. Rational surjectivity alone does not prove this assertion.

DrinfeldModulesAndTModules:DM.5/tate-surjectivity — The Drinfeld Tate theorem
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: Let L be finitely generated over F, let E,E′ be Drinfeld A-modules over the same (L,γ), and let λ≠ker γ. The comparison α_λ:A_λ⊗A Hom_L(E,E′)→Hom_(A_λ,G_L)(T_λE,T_λE′) is an isomorphism. Inverting λ yields the rational version. The theorem allows both generic and special characteristic; it does not permit different characteristic maps, an algebraically closed infinite coefficient field in place of a finitely generated one, or λ equal to the characteristic.

DrinfeldModulesAndTModules:DM.5/tate-semisimplicity — Semisimplicity of rational Tate representations
The finitely generated coefficient-field theorem uses the rational motive realization and its semisimplicity input; the unconditional Drinfeld-motive implication is an explicit proof gap.
Named target: For finitely generated L/F and λ away from characteristic, the rational Tate realization of a semisimple A-isomotive is a semisimple K_0,λ-representation of G_L. In particular the rational Tate representation of every Drinfeld module is semisimple. The latter uses the separate fact that a Drinfeld motive is simple in the rational motive category; a general effective Anderson motive is not assumed semisimple.

DrinfeldModulesAndTModules:DM.6/fitting-polynomial — Monic module cardinalities
The native characteristic-polynomial cardinality is given. Its Fitting-generator compatibility imports current Tau Ceti fittingIdeal, absent from the pinned build; that signature is omitted at the pin without reimplementing Fitting ideals.
finiteModuleCardinality: signature above.
finiteModuleCardinality_zero: signature above.
finiteModuleCardinality_exact: signature above.
finiteModuleCardinality_fitting: OMITTED — The ideal generated by |M| is Fitt_0(M), under t↦T.
cardinality_test_cyclic: example above, within the stated target scope.
cardinality_test_zero: example above, within the stated target scope.
cardinality_test_integer: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/integral-model — Taelman integral Drinfeld models
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
TaelmanModel: signature above.
TaelmanModel.points: signature above.
TaelmanModel.lie: signature above.
TaelmanModel.reduce: signature above.
TaelmanModel_test_carlitz: example above, within the stated target scope.
TaelmanModel_test_bad_reduction: example above, within the stated target scope.
TaelmanModel_test_zero_rank: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/euler-l-value — The model-dependent L-value
The native local factors keep the point and Lie actions separate. Global Euler-product convergence, constant term and the Carlitz zeta comparison require a finite global-field/integral-model interface; no convergence is asserted for arbitrary commutative rings.
TaelmanModel.localFactor: signature above.
TaelmanModel.lValue: signature above.
TaelmanModel.lValue_constant: OMITTED — Its T⁰ coefficient is one.
TaelmanModel.lValue_carlitz: OMITTED — For Carlitz, L(C/R)=ζ_R(1).
lValue_test_scalar: example above, within the stated target scope.
lValue_test_carlitz_prime: example above, within the stated target scope.
lValue_test_bad_prime: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/unit-lattice — The exponential unit lattice
The native exponential inverse image is an A-submodule. Full lattice/rank and examples use the one-place polynomial-integral specialization; the finite-product infinity-field version needs FA.2.
TaelmanModel.exp: signature above.
TaelmanModel.units: signature above.
TaelmanModel.units_mem: signature above.
TaelmanModel.units_rank: signature above.
TaelmanModel.exp_linear: signature above.
units_test_scalar: example above, within the stated target scope.
units_test_carlitz: example above, within the stated target scope.
units_test_scaled_carlitz: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/class-module — The Taelman class module
The native quotient is by the sum of integral points and exponential image. Finiteness/cardinality specialize to F[t]; the global exact sequence needs the compact quotient topology and finite-product interface.
TaelmanModel.classModule: signature above.
TaelmanModel.classModule_finite: signature above.
TaelmanModel.classCardinality: signature above.
TaelmanModel.classModule_exact: OMITTED — 0→K_∞/U→E(K_∞)/E(R)→H→0, with the first map induced by exp_E.
classModule_test_scalar: example above, within the stated target scope.
classModule_test_carlitz: example above, within the stated target scope.
classModule_test_nonzero: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/lattice-covolume — Normalized lattice covolumes
The native normalized determinant is on a finite-free F[t] lattice with chosen infinity coordinate. The common-over-lattice finite-index comparison needs the quotient-module cardinality interface; general projective A-lattices are not assigned an arbitrary determinant normalization.
latticeCovolume: signature above.
latticeCovolume_self: signature above.
latticeCovolume_trans: signature above.
latticeCovolume_index: OMITTED — For a common over-lattice, the stated ratio of monic cardinalities.
covolume_test_one: example above, within the stated target scope.
covolume_test_scalar: example above, within the stated target scope.
covolume_test_scaled_period: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/nuclear-determinant — Finite-field nuclear determinants
The native compact finite-field determinant, common-nucleus truncation and exact-sequence law are given. The cyclic signature is the linear-in-Z instance; the complete operator-series law needs the common-nucleus series-composition interface.
FiniteFieldNuclearDet: signature above.
FiniteFieldNuclearDet_trunc: signature above.
FiniteFieldNuclearDet_exact: signature above.
FiniteFieldNuclearDet_cyclic: signature above.
nuclearDet_test_zero: example above, within the stated target scope.
nuclearDet_test_finite: example above, within the stated target scope.
nuclearDet_test_infinite_identity: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/trace-formula — The finite-field trace formula
The global nuclear trace formula requires the actual compact quotient, continuous coefficient operators, common nuclei and their local factor comparisons. These operators are specified mathematically, not encoded by an unknown proposition.
Named target: For R and K_∞ in the integral-model setting, a finite projective R-module M with q-Frobenius-semilinear τ_M, and Θ∈R{τ}[[Z]]·τZ acting through τ_M, the product over maximal ideals satisfies ∏_m det(1+Θ|M/mM)=det(1+Θ|(M⊗R K_∞)/M)⁻¹. The right-hand coefficients are nuclear. Both sides converge in F[[Z]]. The Frobenius-divisibility condition on Θ is essential; scalar multiplication alone is not this trace formula.

DrinfeldModulesAndTModules:DM.6/tangent-comparison — Infinitely tangent comparison maps
The native estimates use a common local chart; tangentDelta has actual continuous-linear operator coefficients. InfinitelyTangent.exp on different admissible lattice quotients requires the compact quotient-chart interface; the normalized Carlitz estimate is the stated coordinate test.
InfinitelyTangent: signature above.
tangentDelta: signature above.
InfinitelyTangent.exp: OMITTED — A normalized everywhere-convergent q-linear exponential is infinitely tangent on admissible lattice quotients.
tangentDelta_identity: signature above.
tangent_test_identity: example above, within the stated target scope.
tangent_test_additive_exponential: example above, within the stated target scope.
tangent_test_wrong_derivative: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.6/tangent-determinant — The tangent determinant identity
The full nuclear determinant identity uses the compact quotient comparison and its common-nucleus proof; a same-chart scalar estimate alone does not state that theorem.
Named target: For a continuous F-linear isomorphism γ:(V/Λ₁)×H₁→(V/Λ₂)×H₂ infinitely tangent to the identity on V, the series Δ_γ is nuclear and det(1+Δ_γ|M₁)=[Λ₁:Λ₂]·|H₂|/|H₁|. This fixes the covolume orientation and the class numerator. No determinant of an arbitrary infinite-dimensional automorphism is used.

DrinfeldModulesAndTModules:DM.6/class-number-formula — Taelman’s class formula
The native class formula specializes to F[t] in one infinity completion. The full finite global-field version and nuclear proof retain the FA.2 quotient/operator contracts.
Named target: For every Taelman integral model E/R, including nonunit leading coefficient and rank zero, L(E/R)=[R:U(E/R)]·|H(E/R)| in F((T⁻¹)). All local factors are those of the chosen integral model. The formula is not generalized here to arbitrary A, arbitrary higher-dimensional t-motives, or complex L-values.

DrinfeldModulesAndTModules:DM.6/small-power-sum — Depth-one Carlitz power sums
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: For A=F[θ] let A_(d,+) be its finite set of monic degree-d polynomials and S_d(s)=Σ_(a∈A_(d,+))a^(−s). For d≥0 and 1≤s≤q, S_d(s)=ℓ_d^(−s) with ℓ_d=∏_(i=1)^d(θ−θ^(q^i)). Frobenius gives S_d(ps)=S_d(s)^p for p=char F. In particular ζ_A(1)=Σ_dℓ_d⁻¹=log_C(1). The formula ℓ_d^(−s) is not asserted for every s.

DrinfeldModulesAndTModules:DM.6/carlitz-class-examples — Carlitz and a nonzero class module
Native algebraic signatures and examples use the conventions and hypotheses of the mathematical target; the source proof route remains a planned specification.
Named target: For Carlitz over F[θ], H=0, U=A log_C(1), and L(C/A)=ζ_A(1)=log_C(1), after renaming θ as T. For q=2, define E_t=θ+θ³τ over F₂[θ]. Then exp_E(x)=θ⁻³exp_C(θ³x), U_E=(π/θ³)A, H_E≅F₂[t]/(t), and L(E/A)=ι(π/θ²). The class is represented by θ⁻¹ and t annihilates it. Thus |H_E|=T is indispensable.

DrinfeldModulesAndTModules:DM.7/elliptic-sheaf — Elliptic sheaves on the global curve
EllipticSheafDiagram is a native module-sheaf diagram component: injections, Frobenius squares and periodic isomorphisms. Full rank, divisor twist, finite-flat quotient-line support, periodic-map compatibility and base change require the existing curve/bundle suppliers; no full EllipticSheaf is defined by this component.
EllipticSheaf: OMITTED — The global vector-bundle chain with j, τ and rδ-periodicity.
EllipticSheaf.periodic: OMITTED — E_(i+rδ)≅E_i(∞), respecting j and τ.
EllipticSheaf.characteristic: OMITTED — The finite characteristic leg c determined by the τ-cokernel.
EllipticSheaf.Hom: OMITTED — Compatible chain morphisms with a uniform bounded index shift, modulo further inclusions.
EllipticSheaf.baseChange: OMITTED — Pullback preserves the chain, characteristic and quotient-line conditions.
EllipticSheaf_test_rank_one: OMITTED — For F[t], C=P¹ and Carlitz, E_i=O(i), j is the infinity inclusion, and τ is multiplication by t−θ from σ*O(i) to O(i+1).
EllipticSheaf_test_rank_two: example above, within the stated target scope.
EllipticSheaf_test_curve: OMITTED — Bundles on a Fargues–Fontaine curve do not define this chain on C×S.
EllipticSheaf_test_frobenius: OMITTED — Replacing σ=id_C×Frob_S by the absolute Frobenius of C×S changes the degree of every E_i and fails periodicity compatibility.

DrinfeldModulesAndTModules:DM.7/normalized-elliptic-sheaf — Normalized elliptic sheaves
Normalization uses fibre Euler characteristic, the transverse square, cohomology/base change and the dual section line. The native diagram component contains no fabricated cohomology or support field.
NormalizedEllipticSheaf: OMITTED — An elliptic sheaf with χ(E_(−1))=0 and transverse τ/j quotients.
NormalizedEllipticSheaf.sections: OMITTED — The filtered family pr_S*E_i.
NormalizedEllipticSheaf.h0: OMITTED — Fiber dimensions max(i+1,0).
NormalizedEllipticSheaf.h1: OMITTED — H¹ vanishes on fibers for i≥−1.
NormalizedEllipticSheaf.line: OMITTED — pr_S*E_0 is invertible; its dual is the underlying Drinfeld line.
normalized_test_carlitz: OMITTED — On P¹, E_(−1)=O(−1) has H⁰=H¹=0, and E_0=O has one section.
normalized_test_shift: OMITTED — Shifting the Carlitz chain to E_i=O(i+1) gives χ(E_(−1))=1 and fails normalization.
normalized_test_direction: OMITTED — The inverse Drinfeld line is (pr_S*E_0)∨ because the sections are the contravariant motive generator, not its point line.

DrinfeldModulesAndTModules:DM.7/drinfeld-to-sheaf — The elliptic sheaf of a Drinfeld module
The full filtered-motive gluing on the global curve, infinity residue factors and bounded-shift maps require the FA.1/SF.0 interfaces. The affine matrix tests do not construct the full chain.
DrinfeldModule.ellipticSheaf: OMITTED — The glued chain from the Ore-degree filtration.
DrinfeldModule.ellipticSheaf_affine: OMITTED — Its restriction to C−∞ is M(E).
DrinfeldModule.ellipticSheaf_periodic: OMITTED — An rδ-index shift equals tensoring by O(∞).
DrinfeldModule.ellipticSheafMap: OMITTED — A degree-n u:E→E′ gives a bounded-shift chain map from the sheaf of E′ to that of E.
toSheaf_test_carlitz: OMITTED — The Carlitz motive L[t] gives E_i=O(i) and Frobenius factor t−θ.
toSheaf_test_rank_two: OMITTED — A rank-two Drinfeld module yields bundles of rank two, although its Ore module is rank one.
toSheaf_test_isogeny_shift: OMITTED — A positive-degree isogeny cannot in general be represented by maps E_i→E′_i for every i; bounded shifts are required.

DrinfeldModulesAndTModules:DM.7/elliptic-antiequivalence — The normalized elliptic-sheaf dictionary
The normalized anti-equivalence uses the full elliptic-chain category and line reconstruction. Bounded-shift variance and non-rational infinity residue-factor descent remain explicit proof gaps.
Named target: The contravariant filtered-motive construction gives an anti-equivalence between standard relative Drinfeld A-modules of rank r and normalized transverse elliptic sheaves of rank r with bounded-shift morphisms. The inverse uses the line (pr_S*E_0)∨ and the Ore module Γ((C−∞)×S,E_0), locally free of rank one over O_S{τ}; right A-action reconstructs the Drinfeld map. Equivalently, this is a covariant equivalence with the opposite elliptic-sheaf category; no self-duality identification of that category is asserted. Characteristic and rank are preserved, and good-open level structures transport through the finite-shtuka pairing.

DrinfeldModulesAndTModules:DM.7/shtuka-export — The two-leg global shtuka export
The full two-leg modification and its pole/zero bounds require the elliptic chain and the GS.2 consumer interface. The scalar nonunit test checks direction only; it is not a constructed global shtuka.
EllipticSheaf.shtukaDatum: OMITTED — E_0 with α=j_0⁻¹τ_0 away from its legs.
EllipticSheaf.shtukaDatum_zero: OMITTED — The characteristic modification and its effective length-one cokernel.
EllipticSheaf.shtukaDatum_pole: OMITTED — The infinity modification inherited from j_0 and the periodic chain.
EllipticSheaf.shtukaDatum_baseChange: OMITTED — The construction commutes with coefficient-base pullback.
shtukaExport_test_carlitz: OMITTED — For Carlitz on P¹, α is multiplication by t−θ on the affine trivialization.
shtukaExport_test_legs: OMITTED — The zero leg is t=θ and the pole is ∞.
shtukaExport_test_direction: example above, within the stated target scope.

DrinfeldModulesAndTModules:DM.7/tate-realization — Prime-to-characteristic realization comparison
The full elliptic-motive/point Tate pairing needs the completed finite-shtuka realization and bounded-shift naturality interfaces.
Named target: For a normalized elliptic sheaf attached to E and λ away from the characteristic, complete its affine motive M at λ. Its τ-fixed completed realization is canonically dual to T_λE, with the A_λ-linear Galois pairing obtained at each λ^n level from the finite-shtuka functor. The pairing is compatible with all Drinfeld morphisms, bounded shifts of elliptic-chain maps, base extension and prime-to-characteristic level frames.

DrinfeldModulesAndTModules:DM.7/characteristic-comparison — The effective characteristic local comparison
The effective characteristic local comparison retains the connected group schemes, characteristic residue factor and residue-degree Frobenius. Its native local-shtuka interface is imported from HS2, not replaced by separable points.
Named target: For characteristic p and an F_p-algebra R with nilpotent uniformizer image γ(z), completing the affine motive of the elliptic sheaf and selecting the characteristic residue factor gives the same rank-r effective local shtuka as DM.1, with q^(deg p)-Frobenius and the dimension-one cokernel bound. Its finite reductions correspond to the full p-power strict finite group schemes. This is a comparison of completed motives and finite torsion, not a characteristic-place rank-r separable-point Tate representation or an unrestricted crystalline/étale comparison.

-/
