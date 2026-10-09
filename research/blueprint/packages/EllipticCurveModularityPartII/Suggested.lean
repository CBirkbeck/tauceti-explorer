import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.Polynomial.RationalRoot
import Mathlib.Tactic

import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.NumberField.Norm
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.Norm.Transitivity
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.NumberTheory.ModularForms.Newforms.Nebentypus
import TauCeti.NumberTheory.ModularForms.TrivialNebentypus
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RepresentationTheory.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Kernel
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add

import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.NumberTheory.Padics.PadicNorm
import Mathlib.RingTheory.Valuation.ValuationSubring
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Integral
import Mathlib.AlgebraicTopology.SingularHomology.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Hom.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Hom.BaseChange
import TauCeti.AlgebraicGeometry.AbelianVariety.MorphismGroup
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.VariableChange

/-!
This file is not the roadmap and is not exhaustive. README.md is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures.

The six layers import EllipticModularityEffectiveComparisons. The arithmetic
prototypes below use that supplier's namespace and proposed names; they are a
standalone presentation of its interfaces, not a second development to import
alongside it. Use the supplying modules when those declarations are implemented.
The eight displayed definition interfaces, their 27 APIs and 29 named examples
are followed by native target signatures. The `Native` namespace previews
imported prerequisite constructions and their specifying APIs on actual library
carriers. An admitted data construction is not an implemented supplier or a
proof that one of the mathematical prerequisite gaps has been closed.

The last namespace contains proved arithmetic checks for threshold notation,
integral polynomial parameters and the mod-four two-isogeny matrix argument.
These checks do not construct elliptic curves or modular j-maps.
-/

noncomputable section
open scoped BigOperators TensorProduct
open Module
open Classical

namespace TauCeti.EffectiveEllipticComparison

/-- Martin's five rational prime-power factors, in the order s, v∞, v₂, v₃, μ. -/
def localTerms (p e : ℕ) : Fin 5 → ℚ := by sorry

lemma localTerms_zeroExponent (p : ℕ) : localTerms p 0 = 1 := by sorry
lemma localTerms_nonprime (p e : ℕ) (hp : ¬ p.Prime) (he : 0 < e) :
    localTerms p e = 0 := by sorry
lemma localTerms_table (p e : ℕ) (hp : p.Prime) (he : 0 < e) :
    localTerms p e = ![
      (if e = 1 then 1 - 1 / (p : ℚ) else if e = 2 then
        1 - 1 / (p : ℚ) - 1 / (p : ℚ)^2 else
        (1 - 1 / (p : ℚ)) * (1 - 1 / (p : ℚ)^2)),
      (if e % 2 = 1 then 0 else if e = 2 then (p : ℚ) - 2 else
        (p : ℚ)^(e / 2 - 2) * ((p : ℚ) - 1)^2),
      (if p = 2 then (if e = 1 ∨ e = 2 then -1 else if e = 3 then 1 else 0)
        else if p % 4 = 1 then (if e = 2 then -1 else 0)
        else (if e = 1 then -2 else if e = 2 then 1 else 0)),
      (if p = 3 then (if e = 1 ∨ e = 2 then -1 else if e = 3 then 1 else 0)
        else if p % 3 = 1 then (if e = 2 then -1 else 0)
        else (if e = 1 then -2 else if e = 2 then 1 else 0)),
      (if e = 1 then -1 else 0)] := by sorry

-- TauCeti.EffectiveEllipticComparison.tests.local_zero_exponent
example : localTerms 0 0 = ![1, 1, 1, 1, 1] := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.local_two_square
example : localTerms 2 2 = ![1/4, 0, -1, 1, 0] := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.local_three_square
example : localTerms 3 2 = ![5/9, 1, 1, -1, 0] := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.local_two_cube
example : localTerms 2 3 = ![3/8, 0, 1, 0, 0] := by sorry

def martinValue (N : ℕ) : ℚ := by sorry
lemma martinValue_zero : martinValue 0 = 0 := by sorry
lemma martinValue_one : martinValue 1 = 0 := by sorry
lemma martinValue_formula (N : ℕ) (hN : 0 < N) :
    martinValue N =
      let T : Fin 5 → ℚ := fun j => ∏ p ∈ N.primeFactors, localTerms p (N.factorization p) j
      (N : ℚ) * T 0 / 12 - T 1 / 2 - T 2 / 4 - T 3 / 3 + T 4 := by sorry

-- TauCeti.EffectiveEllipticComparison.tests.dimension_level_one
example : martinValue 1 = 0 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.dimension_eleven
example : martinValue 11 = 1 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.dimension_thirtyfive
example : martinValue 35 = 3 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.dimension_thirty
example : martinValue 30 = 1 := by sorry

/-- The native trivial-character weight-two newspace, not the whole Γ₁ newspace. -/
abbrev newDimension (N : ℕ) [NeZero N] : ℕ :=
  Module.finrank ℂ ↥(TauCeti.cuspFormsNew N 2 ⊓
    cuspFormCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ))

lemma dimension_comparison (N : ℕ) [NeZero N] :
    martinValue N = (newDimension N : ℚ) := by sorry

/-- Martin, Theorem 2, preprint pp.2–3 and §4, pp.14–16. -/
theorem martin_bound (N : ℕ) [NeZero N] :
    12 * newDimension N ≤ N + 1 ∧
      (12 * newDimension N = N + 1 ↔ N = 35 ∨ (N.Prime ∧ N % 12 = 11)) := by sorry

def krausF (N : ℕ) [NeZero N] : ℝ :=
  (Real.sqrt (((CongruenceSubgroup.Gamma0 N).index : ℝ) / 6) + 1) ^
    (2 * newDimension N)

lemma krausF_eq (N : ℕ) [NeZero N] :
    krausF N = (Real.sqrt (((CongruenceSubgroup.Gamma0 N).index : ℝ) / 6) + 1) ^
      (2 * newDimension N) := rfl
lemma one_le_krausF (N : ℕ) [NeZero N] : 1 ≤ krausF N := by sorry
lemma krausF_of_dimension_zero (N : ℕ) [NeZero N] (h : newDimension N = 0) :
    krausF N = 1 := by sorry

-- TauCeti.EffectiveEllipticComparison.tests.krausF_one
example : krausF 1 = 1 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.krausF_eleven
example : krausF 11 = 3 + 2 * Real.sqrt 2 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.krausF_thirtyfive
example : krausF 35 = (1 + Real.sqrt 8) ^ 6 := by sorry

def krausG (N : ℕ) [NeZero N] : ℝ := by sorry
lemma krausG_eq (N : ℕ) [NeZero N] :
    krausG N = (Real.sqrt (((CongruenceSubgroup.Gamma0 (N.lcm 4)).index : ℝ)/6) + 1)^2 := by sorry
lemma one_le_krausG (N : ℕ) [NeZero N] : 1 ≤ krausG N := by sorry
lemma krausG_of_four_dvd (N : ℕ) [NeZero N] (h : 4 ∣ N) :
    krausG N = (Real.sqrt (((CongruenceSubgroup.Gamma0 N).index : ℝ)/6) + 1)^2 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.krausG_one
example : krausG 1 = 4 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.krausG_four
example : krausG 4 = 4 ∧ (Real.sqrt ((24 : ℝ)/6) + 1)^2 = 9 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.krausG_eleven
example : krausG 11 = 13 + 4 * Real.sqrt 3 := by sorry

def krausH (N : ℕ) [NeZero N] : ℝ := max (krausF N) (krausG N)
lemma krausH_eq (N : ℕ) [NeZero N] : krausH N = max (krausF N) (krausG N) := rfl
lemma krausF_le_krausH (N : ℕ) [NeZero N] : krausF N ≤ krausH N := le_max_left _ _
lemma krausG_le_krausH (N : ℕ) [NeZero N] : krausG N ≤ krausH N := le_max_right _ _
lemma krausH_lt_iff (N : ℕ) [NeZero N] (ell : ℝ) :
    krausH N < ell ↔ krausF N < ell ∧ krausG N < ell := max_lt_iff

-- TauCeti.EffectiveEllipticComparison.tests.krausH_one
example : krausH 1 = 4 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.krausH_four
example : krausH 4 = 4 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.krausH_eleven
example : krausH 11 = 13 + 4 * Real.sqrt 3 := by sorry

open _root_.Polynomial

def krausLocalFilters {R : Type*} [CommRing R] (p e : ℕ) (a : R) :
    Polynomial R × Polynomial R := by sorry

lemma krausLocalFilters_two {R : Type*} [CommRing R] (e : ℕ) (a : R) :
    krausLocalFilters 2 e a =
      (if e = 0 then (1 - C a * X + 2 * X ^ 2, 1)
       else if e = 1 then (1 - C a * X, 1) else (1, 1)) := by sorry
lemma krausLocalFilters_odd {R : Type*} [CommRing R] (p e : ℕ) (hp : p ≠ 2) (a : R) :
    krausLocalFilters p e a =
      (if e = 0 then (1, 1)
       else if e = 1 then (1, 1 - C ((p : R) + 1 - a) * X)
       else (1, 1 - C ((p : R) + 1) * X + C (p : R) * X ^ 2)) := by sorry
lemma krausLocalFilters_constant {R : Type*} [CommRing R] (p e : ℕ) (a : R) :
    (krausLocalFilters p e a).1.coeff 0 = 1 ∧
      (krausLocalFilters p e a).2.coeff 0 = 1 := by sorry
lemma krausLocalFilters_map {R S : Type*} [CommRing R] [CommRing S]
    (φ : R →+* S) (p e : ℕ) (a : R) :
    ((krausLocalFilters p e a).1.map φ, (krausLocalFilters p e a).2.map φ) =
      krausLocalFilters p e (φ a) := by sorry

-- TauCeti.EffectiveEllipticComparison.tests.filters_two_unramified
example : krausLocalFilters 2 0 (3 : ℤ) = (1 - 3 * X + 2 * X ^ 2, 1) := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.filters_two_square
example : krausLocalFilters 2 2 (0 : ℤ) = (1, 1) := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.filters_three_once
example : krausLocalFilters 3 1 (-1 : ℤ) = (1, 1 - 5 * X) := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.filters_three_square
example : krausLocalFilters 3 2 (0 : ℤ) = (1, 1 - 4 * X + 3 * X ^ 2) := by sorry

def lemosNumerator (r : ℕ) : Polynomial ℤ := by sorry
lemma lemosNumerator_table :
    lemosNumerator 2 = (X + 16) ^ 3 ∧
    lemosNumerator 3 = (X + 27) * (X + 3) ^ 3 ∧
    lemosNumerator 5 = (X ^ 2 + 10 * X + 5) ^ 3 ∧
    lemosNumerator 7 = (X ^ 2 + 5 * X + 1) ^ 3 * (X ^ 2 + 13 * X + 49) ∧
    lemosNumerator 13 = (X ^ 4 + 7 * X ^ 3 + 20 * X ^ 2 + 19 * X + 1) ^ 3 *
      (X ^ 2 + 5 * X + 13) := by sorry
lemma lemosNumerator_monic (r : ℕ) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    (lemosNumerator r).Monic ∧ (lemosNumerator r).natDegree = r + 1 := by sorry
lemma lemosNumerator_constant :
    (lemosNumerator 2).coeff 0 = 4096 ∧
    (lemosNumerator 3).coeff 0 = 729 ∧
    (lemosNumerator 5).coeff 0 = 125 ∧
    (lemosNumerator 7).coeff 0 = 49 ∧
    (lemosNumerator 13).coeff 0 = 13 := by sorry
lemma lemosNumerator_other (r : ℕ) (hr : r ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    lemosNumerator r = 0 := by sorry

-- TauCeti.EffectiveEllipticComparison.tests.j_two_constant
example : (lemosNumerator 2).eval 0 = 4096 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.j_seven_degree
example : (lemosNumerator 7).natDegree = 8 ∧ (lemosNumerator 7).coeff 0 = 49 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.j_thirteen_degree
example : (lemosNumerator 13).natDegree = 14 ∧ (lemosNumerator 13).coeff 0 = 13 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.j_eleven_other
example : lemosNumerator 11 = 0 := by sorry

def lemosIntegralJ (r : ℕ) : Finset ℤ := by sorry
lemma mem_lemosIntegralJ (r : ℕ) (j : ℤ) :
    j ∈ lemosIntegralJ r ↔ r ∈ ({2, 3, 5, 7, 13} : Finset ℕ) ∧
      ∃ t : ℤ, t ≠ 0 ∧ t ∣ (lemosNumerator r).coeff 0 ∧
        j = (lemosNumerator r).eval t / t := by sorry
lemma lemosIntegralJ_other (r : ℕ) (hr : r ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    lemosIntegralJ r = ∅ := by sorry
lemma lemosIntegralJ_cards :
    (lemosIntegralJ 2).card = 25 ∧ (lemosIntegralJ 3).card = 13 ∧
    (lemosIntegralJ 5).card = 8 ∧ (lemosIntegralJ 7).card = 6 ∧
    (lemosIntegralJ 13).card = 4 := by sorry

-- TauCeti.EffectiveEllipticComparison.tests.integral_j_two
example : (lemosIntegralJ 2).card = 25 ∧ 0 ∈ lemosIntegralJ 2 ∧
    1728 ∈ lemosIntegralJ 2 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.integral_j_five
example : (lemosIntegralJ 5).card = 8 ∧ 64 ∈ lemosIntegralJ 5 := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.integral_j_thirteen
example : lemosIntegralJ 13 = {-64 * 9 * 4079 ^ 3, 576, 4096 * 27 * 19,
    4096 * 27 * 19 * 991 ^ 3} := by sorry
-- TauCeti.EffectiveEllipticComparison.tests.integral_j_other
example : lemosIntegralJ 11 = ∅ := by sorry

end TauCeti.EffectiveEllipticComparison

/-! ## Native prerequisite interfaces

These previews fix the carriers of the imported theorems. Their mathematics is
owned by Elliptic curves, Modular forms, ArithmeticGaloisRepresentations,
SerreWeightAndLevelOptimisation and ModularCurvesPartII, as identified in the
README. Admitted constructions are proposed interfaces, not additional layers.
In particular no theorem below takes its own conclusion as a record field.
-/

namespace TauCeti.EffectiveEllipticComparison
namespace Native

open scoped WeierstrassCurve

abbrev Curve := {W : WeierstrassCurve ℚ // W.IsElliptic}
instance (E : Curve) : E.val.IsElliptic := E.property
abbrev Qbar := AlgebraicClosure ℚ
abbrev GQ := Qbar ≃ₐ[ℚ] Qbar
abbrev GeometricPoints (E : Curve) := (E.val.baseChange Qbar).toAffine.Point
abbrev Torsion (E : Curve) (n : ℕ) :=
  AddSubgroup.torsionBy (GeometricPoints E) (n : ℤ)

instance (E : Curve) (n : ℕ) : Module (ZMod n) (Torsion E n) :=
  AddSubgroup.torsionBy.zmodModule

/-- Coordinatewise Galois action restricted to genuine geometric n-torsion.
This is a pinned-carrier preview of the current library's
`WeierstrassCurve.torsionGaloisAction`, not a new torsion construction. -/
def torsionAction (E : Curve) (n : ℕ) :
    GQ →* (Torsion E n ≃ₗ[ZMod n] Torsion E n) := by sorry

lemma torsionAction_coe (E : Curve) (n : ℕ) (σ : GQ) (P : Torsion E n) :
    ((torsionAction E n σ P : Torsion E n) : GeometricPoints E) =
      WeierstrassCurve.Affine.Point.map (W' := E.val) σ.toAlgHom P.val := by sorry

/-- A basis of the actual geometric torsion, supplied by Elliptic curves Layer 2. -/
def torsionBasis (E : Curve) (ell : ℕ) [Fact ell.Prime] :
    Basis (Fin 2) (ZMod ell) (Torsion E ell) := by sorry

/-- Matrices of that action, in that basis; surjectivity is basis independent. -/
def rho (E : Curve) (ell : ℕ) [Fact ell.Prime] : GQ →* GL (Fin 2) (ZMod ell) := by sorry

lemma rho_action (E : Curve) (ell : ℕ) [Fact ell.Prime] (σ : GQ) (P : Torsion E ell) :
    (torsionBasis E ell).repr (torsionAction E ell σ P) =
      (rho E ell σ : Matrix (Fin 2) (Fin 2) (ZMod ell)).mulVec
        ((torsionBasis E ell).repr P) := by sorry

def Irreducible (E : Curve) (ell : ℕ) [Fact ell.Prime] : Prop :=
  ∀ U : Submodule (ZMod ell) (Torsion E ell),
    (∀ σ : GQ, ∀ P ∈ U, torsionAction E ell σ P ∈ U) → U = ⊥ ∨ U = ⊤

/-- Absolute irreducibility is irreducibility after scalar extension to F̄_ell. -/
def extendedAction (E : Curve) (ell : ℕ) [Fact ell.Prime] :
    GQ →* Module.End (AlgebraicClosure (ZMod ell))
      (AlgebraicClosure (ZMod ell) ⊗[ZMod ell] Torsion E ell) := by sorry
lemma extendedAction_tmul (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (σ : GQ) (a : AlgebraicClosure (ZMod ell)) (P : Torsion E ell) :
    extendedAction E ell σ (a ⊗ₜ[ZMod ell] P) =
      a ⊗ₜ[ZMod ell] (torsionAction E ell σ P) := by sorry

def AbsolutelyIrreducible (E : Curve) (ell : ℕ) [Fact ell.Prime] : Prop :=
  ∀ U : Submodule (AlgebraicClosure (ZMod ell))
      (AlgebraicClosure (ZMod ell) ⊗[ZMod ell] Torsion E ell),
    (∀ σ : GQ, ∀ P ∈ U, extendedAction E ell σ P ∈ U) → U = ⊥ ∨ U = ⊤

def TorsionEquivalent (E F : Curve) (ell : ℕ) : Prop :=
  ∃ e : Torsion E ell ≃ₗ[ZMod ell] Torsion F ell,
    ∀ σ : GQ, ∀ P, e (torsionAction E ell σ P) = torsionAction F ell σ (e P)

def FullRationalTwo (E : Curve) : Prop :=
  Nat.card (AddSubgroup.torsionBy E.val.toAffine.Point (2 : ℤ)) = 4

def RationalTwo (E : Curve) : Prop :=
  ∃ P : E.val.toAffine.Point, P ≠ 0 ∧ (2 : ℤ) • P = 0

/-- Geometric endomorphisms: the actual function-field hom carrier over Q̄. -/
def NonCM (E : Curve) : Prop :=
  ∀ f : TauCeti.Isogeny.Hom (E.val.baseChange Qbar).toAffine
      (E.val.baseChange Qbar).toAffine,
    ∃ n : ℤ, f = n • (1 : TauCeti.Isogeny.Hom
      (E.val.baseChange Qbar).toAffine (E.val.baseChange Qbar).toAffine)

abbrev Isogeny (E F : Curve) := TauCeti.Isogeny E.val.toAffine F.val.toAffine

def CyclicDegree {E F : Curve} (f : Isogeny E F) (n : ℕ) : Prop :=
  f.degree = n ∧ IsAddCyclic ((f.map (algebraMap ℚ Qbar)).ker)

def HasCyclicIsogeny (E : Curve) (n : ℕ) : Prop :=
  ∃ F : Curve, ∃ f : Isogeny E F, CyclicDegree f n

/-- A global minimal integral equation, supplied by Elliptic curves Layer 4.5b. -/
def minimalEquation (E : Curve) : WeierstrassCurve ℤ := by sorry
lemma minimalEquation_isomorphic (E : Curve) :
    ∃ C : WeierstrassCurve.VariableChange ℚ,
      (minimalEquation E).map (Int.castRingHom ℚ) = C • E.val := by sorry
lemma minimalEquation_minimal (E : Curve) (q : ℕ) (hq : q.Prime)
    (W : WeierstrassCurve ℤ) (C : WeierstrassCurve.VariableChange ℚ)
    (hW : W.map (Int.castRingHom ℚ) = C • E.val) :
    (minimalEquation E).Δ.natAbs.factorization q ≤ W.Δ.natAbs.factorization q := by sorry

abbrev discriminantValuation (E : Curve) (q : ℕ) : ℕ :=
  (minimalEquation E).Δ.natAbs.factorization q

/-- Exact elliptic conductor, from the local Artin conductor of the Tate module.
The defining local comparison is Ogg's v(Δ)+1−m, with m the number of
geometric irreducible components of the minimal regular special fibre. -/
def conductor (E : Curve) : ℕ := by sorry
lemma conductor_pos (E : Curve) : 0 < conductor E := by sorry

/-- Exact prime-to-ell Artin conductor of the concrete action `rho E ell`:
product over q≠ell of q to its Artin exponent, including its Swan term.
This imported invariant is not the characteristic-zero deletion level. -/
def residualConductor (E : Curve) (ell : ℕ) [Fact ell.Prime] : ℕ := by sorry
lemma residualConductor_coprime (E : Curve) (ell : ℕ) [Fact ell.Prime] :
    Nat.Coprime ell (residualConductor E ell) := by sorry

/-- Serre's weight of the actual mod-ell torsion representation, with its
finite-flat/minimal local recipe at ell supplied by R20.3. -/
def serreWeight (E : Curve) (ell : ℕ) [Fact ell.Prime] : ℕ := by sorry

/-- R20.6's exact deletion level, including q=ell when eligible. -/
def deletionLevel (E : Curve) (ell : ℕ) : ℕ :=
  conductor E / ∏ q ∈ (conductor E).primeFactors.filter
    (fun q => (conductor E).factorization q = 1 ∧ ell ∣ discriminantValuation E q), q

abbrev goodReduction (E : Curve) (q : ℕ) : Prop := discriminantValuation E q = 0
abbrev multiplicativeReduction (E : Curve) (q : ℕ) : Prop :=
  0 < discriminantValuation E q ∧ ¬ (q : ℤ) ∣ (minimalEquation E).c₄

/-- Count on the actual reduction of a minimal equation, including infinity.
Only good primes are used in the theorems below. -/
def pointCount (E : Curve) (q : ℕ) [Fact q.Prime] : ℕ :=
  Nat.card (((minimalEquation E).map (Int.castRingHom (ZMod q))).toAffine.Point)
abbrev trace (E : Curve) (q : ℕ) [Fact q.Prime] : ℤ := q + 1 - (pointCount E q : ℤ)

abbrev Newform (N : ℕ) [NeZero N] := HeckeRing.GL2.Newform N 2
abbrev coefficient {N : ℕ} [NeZero N] (f : Newform N) (n : ℕ) : ℂ :=
  (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n
abbrev IntegralCoefficient {N : ℕ} [NeZero N] (f : Newform N) (n : ℕ) : Prop :=
  ∃ a : ℤ, coefficient f n = (a : ℂ)
/-- Modular forms Layer 8's coefficient field, generated by all actual coefficients. -/
def coefficientField {N : ℕ} [NeZero N] (f : Newform N) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range (coefficient f))
instance {N : ℕ} [NeZero N] (f : Newform N) : NumberField (coefficientField f) := by sorry

open scoped NumberField
/-- Integral coefficient, in its own coefficient field; the inclusion is explicit. -/
def integralCoefficient {N : ℕ} [NeZero N] (f : Newform N) (n : ℕ) :
    𝓞 (coefficientField f) := by sorry
lemma integralCoefficient_coe {N : ℕ} [NeZero N] (f : Newform N) (n : ℕ) :
    (((integralCoefficient f n : 𝓞 (coefficientField f)) : coefficientField f) : ℂ) =
      coefficient f n := by sorry

/-- The semisimple residual newform representation, base changed to F̄_ell.
The residue embedding is part of the input: λ belongs to O_(K_f), not to
an unrelated coefficient field. Its geometric construction is supplied by R19. -/
def newformResidual {N : ℕ} [NeZero N] (f : Newform N) (ell : ℕ) [Fact ell.Prime]
    (I : Ideal (𝓞 (coefficientField f))) [I.IsMaximal]
    (ι : (𝓞 (coefficientField f) ⧸ I) →+* AlgebraicClosure (ZMod ell)) :
    GQ →* GL (Fin 2) (AlgebraicClosure (ZMod ell)) := by sorry

/-- Scalar extension of the actual elliptic matrix representation. -/
def extendedRho (E : Curve) (ell : ℕ) [Fact ell.Prime] :
    GQ →* GL (Fin 2) (AlgebraicClosure (ZMod ell)) :=
  (Matrix.GeneralLinearGroup.map (algebraMap (ZMod ell) (AlgebraicClosure (ZMod ell)))).comp
    (rho E ell)

def NewformResidualEquivalent {N : ℕ} [NeZero N] (f : Newform N)
    (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (I : Ideal (𝓞 (coefficientField f))) [I.IsMaximal]
    (ι : (𝓞 (coefficientField f) ⧸ I) →+* AlgebraicClosure (ZMod ell)) : Prop :=
  ∃ g : GL (Fin 2) (AlgebraicClosure (ZMod ell)),
    ∀ σ : GQ, newformResidual f ell I ι σ = g * extendedRho E ell σ * g⁻¹

end Native
end TauCeti.EffectiveEllipticComparison

open _root_.Polynomial

namespace TauCeti.EffectiveEllipticComparison
open Native
open scoped NumberField

/-! ## EC.2 — the geometric removed-prime estimate -/

/-- Bennett–Siksek, Lemma 2.2, §2, p.359. -/
theorem removed_prime_bound (E : Curve) (ell p : ℕ) [Fact ell.Prime]
    (hell : 3 ≤ ell) (hE : Irreducible E ell) (hp : p.Prime) (hne : p ≠ ell)
    (hM : (conductor E).factorization p = 1) (hΔ : ell ∣ discriminantValuation E p) :
    (ell : ℝ) ≤ (Real.sqrt (p : ℝ) + 1) ^ (((deletionLevel E ell : ℝ) + 1) / 6) := by sorry

/-! ## EC.3 — normalized newforms and exact residual conductor -/

/-- Kraus, Lemma 1, §3.2, pp.1144–1145. -/
theorem rationality_from_small_primes (N : ℕ) [NeZero N] (f : Newform N)
    (hχ : f.χ = 1)
    (hint : ∀ q : ℕ, q.Prime →
      (q : ℚ) ≤ ((CongruenceSubgroup.Gamma0 N).index : ℚ) / 6 →
      IntegralCoefficient f q) :
    (∀ n : ℕ, IntegralCoefficient f n) ∧ coefficientField f = ⊥ := by sorry

/-- Kraus, proof of Theorem 3, §3.2, p.1145. -/
theorem small_prime_integrality (N ell : ℕ) [NeZero N] [Fact ell.Prime]
    (E : Curve) (hell : 5 ≤ ell) (hirr : Irreducible E ell)
    (hweight : serreWeight E ell = 2) (hN : residualConductor E ell = N)
    (f : Newform N) (hχ : f.χ = 1)
    (I : Ideal (𝓞 (coefficientField f))) [I.IsMaximal]
    (habove : Ideal.comap (Int.castRingHom (𝓞 (coefficientField f))) I =
      Ideal.span {(ell : ℤ)})
    (ι : (𝓞 (coefficientField f) ⧸ I) →+* AlgebraicClosure (ZMod ell))
    (heq : NewformResidualEquivalent f E ell I ι) (hF : krausF N < (ell : ℝ)) :
    ∀ q : ℕ, q.Prime → (q : ℚ) ≤ ((CongruenceSubgroup.Gamma0 N).index : ℚ) / 6 →
      IntegralCoefficient f q := by sorry

/-- Kraus, §3.1, p.1143: exact primitive level, not just a level divisor. -/
theorem rational_form_elliptic_realization (N : ℕ) [NeZero N]
    (f : Newform N) (hχ : f.χ = 1) (hint : ∀ n : ℕ, IntegralCoefficient f n) :
    ∃ F : Curve, conductor F = N ∧
      (∀ q : ℕ, ∀ _ : Fact q.Prime, ¬ q ∣ N → coefficient f q = (trace F q : ℂ)) ∧
      (∀ (E : Curve) (ell : ℕ) (_ : Fact ell.Prime), 5 ≤ ell → Irreducible E ell →
        ∀ (I : Ideal (𝓞 (coefficientField f))) (_ : I.IsMaximal)
          (ι : (𝓞 (coefficientField f) ⧸ I) →+* AlgebraicClosure (ZMod ell)),
        Ideal.comap (Int.castRingHom (𝓞 (coefficientField f))) I =
          Ideal.span {(ell : ℤ)} →
        NewformResidualEquivalent f E ell I ι → TorsionEquivalent F E ell) := by sorry

/-- Kraus, Theorem 3, §3.1, p.1144. The parent supplies modularity over Q. -/
theorem kraus_rational_realization (E : Curve) (N ell : ℕ) [NeZero N] [Fact ell.Prime]
    (hell : 5 ≤ ell) (hirr : Irreducible E ell) (hweight : serreWeight E ell = 2)
    (hN : residualConductor E ell = N) (hF : krausF N < (ell : ℝ)) :
    ∃ F : Curve, conductor F = N ∧ TorsionEquivalent F E ell := by sorry

/-! ## EC.4 — point counts, actual isogenies and the separate local adapter -/

/-- Kraus, Appendix II §8, Proposition 2 and Corollary, pp.1158–1159. -/
theorem finite_mod_four (C : Curve) (N : ℕ) [NeZero N] (hN : conductor C = N)
    (hfinite : ∀ (q : ℕ) (_ : Fact q.Prime), ¬ q ∣ 2 * N →
      (q : ℚ) ≤ ((CongruenceSubgroup.Gamma0 (N.lcm 4)).index : ℚ) / 6 →
      4 ∣ pointCount C q) :
    ∀ (q : ℕ) (_ : Fact q.Prime), ¬ q ∣ 2 * N → 4 ∣ pointCount C q := by sorry

/-- Kraus, §3.3, equations (10)–(11), p.1146. -/
theorem mod_four_trace_transfer (E C : Curve) (N ell : ℕ) [NeZero N] [Fact ell.Prime]
    (h2 : FullRationalTwo E) (hell : 5 ≤ ell) (hirr : Irreducible E ell)
    (hweight : serreWeight E ell = 2) (hN : residualConductor E ell = N)
    (hC : conductor C = N) (heq : TorsionEquivalent C E ell)
    (hG : krausG N < (ell : ℝ)) :
    ∀ (q : ℕ) (_ : Fact q.Prime), ¬ q ∣ 2 * N → 4 ∣ pointCount C q := by sorry

/-- Kraus, §3.3, p.1146; the geometric conclusion of the mod-four matrix argument. -/
theorem two_isogeny_repair (C : Curve)
    (hfour : ∀ (q : ℕ) (_ : Fact q.Prime), q ≠ 2 → goodReduction C q →
      4 ∣ pointCount C q) :
    ∃ F : Curve, ∃ φ : Native.Isogeny C F, (φ.degree = 1 ∨ φ.degree = 2) ∧
      FullRationalTwo F ∧ conductor F = conductor C ∧
      ∀ ell : ℕ, Odd ell → TorsionEquivalent C F ell := by sorry

/-- Kraus, Theorem 4, §3.1, p.1144 and §3.3, pp.1145–1146. -/
theorem kraus_full_two_realization (E : Curve) (N ell : ℕ) [NeZero N] [Fact ell.Prime]
    (h2 : FullRationalTwo E) (hell : 5 ≤ ell) (hirr : Irreducible E ell)
    (hweight : serreWeight E ell = 2) (hN : residualConductor E ell = N)
    (hH : krausH N < (ell : ℝ)) :
    ∃ F : Curve, conductor F = N ∧ FullRationalTwo F ∧ TorsionEquivalent F E ell := by sorry

/-- R20.2/R20.6 local conductor comparison, separately from Serre weight. -/
theorem deletion_conductor_away (E : Curve) (ell : ℕ) [Fact ell.Prime] (hell : 5 ≤ ell) :
    ∀ q : ℕ, q.Prime → q ≠ ell →
      (residualConductor E ell).factorization q =
        if (conductor E).factorization q = 1 ∧ ell ∣ discriminantValuation E q
        then 0 else (conductor E).factorization q := by sorry

/-- Kraus, §3.1, p.1143; retain the explicit alternative at ell=5,7. -/
theorem deletion_level_exact_adapter (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (hell : 5 ≤ ell)
    (hlocal : goodReduction E ell ∨
      (multiplicativeReduction E ell ∧ ell ∣ discriminantValuation E ell)) :
    deletionLevel E ell = residualConductor E ell := by sorry

theorem weight_two_reduction_alternative (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (hell : 11 ≤ ell) (hweight : serreWeight E ell = 2) :
    goodReduction E ell ∨
      (multiplicativeReduction E ell ∧ ell ∣ discriminantValuation E ell) := by sorry

/-! ## EC.5 — Galois-stable cyclic kernels, not rational generators -/

/-- Mazur, Theorem 1 and introductory table, pp.129–130; §7, pp.153–155. -/
theorem mazur_prime_isogeny_classification (E : Curve) (r : ℕ) (hr : r.Prime)
    (hiso : HasCyclicIsogeny E r) :
    r ∈ ({2, 3, 5, 7, 11, 13, 17, 19, 37, 43, 67, 163} : Finset ℕ) ∧
      (NonCM E → r ∈ ({2, 3, 5, 7, 11, 13, 17, 37} : Finset ℕ)) := by sorry

/-- Separate Mazur–Kenku composite-degree input; BS §3, pp.361–363. -/
theorem cyclic_two_prime_exclusion (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (hell : 11 ≤ ell) : ¬ HasCyclicIsogeny E (2 * ell) := by sorry

theorem cyclic_four_prime_exclusion (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (hell : 7 ≤ ell) : ¬ HasCyclicIsogeny E (4 * ell) := by sorry

/-- A line in geometric ell-torsion, with the actual Galois action. -/
theorem two_torsion_kernel_transport (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (hodd : Odd ell) (L : Submodule (ZMod ell) (Torsion E ell))
    (hcard : Nat.card L = ell)
    (hstable : ∀ σ : GQ, ∀ P ∈ L, torsionAction E ell σ P ∈ L) :
    (RationalTwo E → HasCyclicIsogeny E (2 * ell)) ∧
      (FullRationalTwo E → ∃ F : Curve, Nonempty (Native.Isogeny E F) ∧
        HasCyclicIsogeny F (4 * ell)) := by sorry

/-- BS Lemma 3.3, p.362; absolute upgrade uses elliptic oddness separately. -/
theorem irreducible_full_two (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (h2 : FullRationalTwo E) (hell : 7 ≤ ell) :
    Irreducible E ell ∧ AbsolutelyIrreducible E ell := by sorry

/-- BS Lemma 3.5, p.363; the threshold is 11 for one rational two-point. -/
theorem irreducible_one_two (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (h2 : RationalTwo E) (hell : 11 ≤ ell) :
    Irreducible E ell ∧ AbsolutelyIrreducible E ell := by sorry

end TauCeti.EffectiveEllipticComparison

/-! ## Supplier previews for EC.6

These are typed interfaces of ModularCurvesPartII R14, JacobianChallenge
Layer E and the Cartan/winding continuation specified in the README. They are
not new mathematical owners. Data constructions are admitted on actual scheme,
abelian-variety and local-ring carriers; their specifying APIs are separate
from the effective-comparison targets.
-/
namespace TauCeti.EffectiveEllipticComparison.Native
open CategoryTheory Limits _root_.AlgebraicGeometry IsDedekindDomain
open scoped CategoryTheory.MonObj

/-- Multiplication by F_(p²)^× in its actual two-dimensional F_p-vector space. -/
def cartanBasis (p : ℕ) [Fact p.Prime] : Basis (Fin 2) (ZMod p) (GaloisField p 2) := by sorry
def cartanMultiplication (p : ℕ) [Fact p.Prime] :
    (GaloisField p 2)ˣ →* GL (Fin 2) (ZMod p) := by sorry
lemma cartanMultiplication_action (p : ℕ) [Fact p.Prime]
    (a : (GaloisField p 2)ˣ) (x : GaloisField p 2) :
    (cartanBasis p).repr ((a : GaloisField p 2) * x) =
      (cartanMultiplication p a : Matrix (Fin 2) (Fin 2) (ZMod p)).mulVec
        ((cartanBasis p).repr x) := by sorry
abbrev nonsplitCartan (p : ℕ) [Fact p.Prime] : Subgroup (GL (Fin 2) (ZMod p)) :=
  (cartanMultiplication p).range
abbrev nonsplitNormalizer (p : ℕ) [Fact p.Prime] := Subgroup.normalizer (nonsplitCartan p : Set (GL (Fin 2) (ZMod p)))

def NonsplitImage (E : Curve) (p : ℕ) [Fact p.Prime] : Prop :=
  ∃ g : GL (Fin 2) (ZMod p), ∀ σ : GQ, g * rho E p σ * g⁻¹ ∈ nonsplitNormalizer p

/-- Potential good reduction means good reduction after a finite field extension
at a valuation above q. A unit discriminant is the smoothness criterion for
this actual integral Weierstrass equation. -/
def PotentiallyGood (E : Curve) (q : ℕ) [Fact q.Prime] : Prop :=
  ∃ (K : Type) (_ : Field K) (_ : NumberField K),
    ∃ v : Valuation K (WithZero (Multiplicative ℤ)),
      (v.comap (algebraMap ℚ K)).IsEquiv (Rat.padicValuation q) ∧
      ∃ W : WeierstrassCurve v.valuationSubring,
        IsUnit W.Δ ∧ ∃ C : WeierstrassCurve.VariableChange K,
          W.map v.valuationSubring.subtype = C • E.val.map (algebraMap ℚ K)

/-- Equation-level quadratic twists, including the trivial square class.
Trace 0 and norm -d give the standard twist by sqrt(d). -/
def QuadraticTwists (E F : Curve) : Prop :=
  ∃ d : ℚˣ, ∃ C : WeierstrassCurve.VariableChange ℚ,
    F.val = C • E.val.quadraticTwistOf 0 (-(d : ℚ))

abbrev QScheme := Over (Spec (.of ℚ))
abbrev Points (X : QScheme) (K : Type) [Field K] [Algebra ℚ K] :=
  Over.mk (Spec.map (CommRingCat.ofHom (algebraMap ℚ K))) ⟶ X
abbrev AV := TauCeti.AlgebraicGeometry.AbelianVariety ℚ

/-- Smooth proper modular curves and their noncuspidal open subschemes, imported
from R14. Their specifying moduli API uses actual cyclic subgroups below. -/
def x0 (N : ℕ) : QScheme := by sorry
instance (N : ℕ) : IsProper (x0 N).hom := by sorry
instance (N : ℕ) : Smooth (x0 N).hom := by sorry
instance (N : ℕ) : GeometricallyIntegral (x0 N).hom := by sorry
lemma x0_dimension (N : ℕ) : topologicalKrullDim (x0 N).left = 1 := by sorry
instance (N : ℕ) : Fact (topologicalKrullDim (x0 N).left = 1) := ⟨x0_dimension N⟩

def y0 (N : ℕ) : QScheme := by sorry
def y0Inclusion (N : ℕ) : y0 N ⟶ x0 N := by sorry
instance (N : ℕ) : IsOpenImmersion (y0Inclusion N).left := by sorry
abbrev jLine : QScheme :=
  Over.mk (Spec.map (CommRingCat.ofHom (algebraMap ℚ ℚ[X])))
def jMap (N : ℕ) : y0 N ⟶ jLine := by sorry
/-- Evaluates the actual affine j-morphism on a field-valued point. -/
def jValue (N : ℕ) (K : Type) [Field K] [Algebra ℚ K] (P : Points (y0 N) K) : K := by sorry
lemma jValue_spec (N : ℕ) (K : Type) [Field K] [Algebra ℚ K]
    (P : Points (y0 N) K) :
    (P ≫ jMap N).left = Spec.map (CommRingCat.ofHom
      (_root_.Polynomial.eval₂RingHom (algebraMap ℚ K) (jValue N K P))) := by sorry

structure CyclicPair (N : ℕ) where
  W : WeierstrassCurve Qbar
  elliptic : W.IsElliptic
  subgroup : AddSubgroup W.toAffine.Point
  cyclic : IsAddCyclic subgroup
  card : Nat.card subgroup = N

attribute [instance] CyclicPair.elliptic

/-- Isomorphism of pairs, rather than equality of j-invariants alone. -/

def CyclicPair.Equivalent {N : ℕ} (A B : CyclicPair N) : Prop :=
  ∃ C : WeierstrassCurve.VariableChange Qbar, ∃ h : C • A.W = B.W,
    A.subgroup.map (((WeierstrassCurve.Affine.Point.equivVariableChange A.W C).symm.trans
      (AddEquiv.cast (M := fun W : WeierstrassCurve Qbar => W.toAffine.Point) h)).toAddMonoidHom)
      = B.subgroup

def cyclicPairSetoid (N : ℕ) : Setoid (CyclicPair N) :=
  ⟨CyclicPair.Equivalent, by sorry⟩
def y0Moduli (N : ℕ) [NeZero N] :
    Points (y0 N) Qbar ≃ Quotient (cyclicPairSetoid N) := by sorry
lemma y0Moduli_j (N : ℕ) [NeZero N] (A : CyclicPair N) :
    jValue N Qbar ((y0Moduli N).symm (Quotient.mk _ A)) = A.W.j := by sorry

/-- Genus-zero coordinate on the actual open modular curve: Y₀(r) ≅ G_m.
The omitted two points are exactly its two cusps. -/
abbrev multiplicativeLine : QScheme :=
  Over.mk (Spec.map (CommRingCat.ofHom (algebraMap ℚ (LaurentPolynomial ℚ))))
def genusZeroCoordinate (r : ℕ) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    y0 r ≅ multiplicativeLine := by sorry
def coordinateValue (r : ℕ) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (P : Points (y0 r) ℚ) : ℚˣ := by sorry
/-- The ring map of the coordinate point sends T to this unit. -/
lemma coordinateValue_spec (r : ℕ) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (P : Points (y0 r) ℚ) :
    ∃ f : LaurentPolynomial ℚ →+* ℚ,
      (P ≫ (genusZeroCoordinate r hr).hom).left = Spec.map (CommRingCat.ofHom f) ∧
      f (LaurentPolynomial.T 1) = (coordinateValue r hr P : ℚ) := by sorry

/-- The canonical compact full-level curve and quotient by H, from R14.
The maps are the coarse-moduli forgetful maps. -/
def xH (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) : QScheme := by sorry
def forgetLevel (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) :
    xH p H ⟶ x0 1 := by sorry
def forgetCyclic (r : ℕ) : x0 r ⟶ x0 1 := by sorry
/-- Normalization of the fibre product over X(1), not its unreduced raw fibre product. -/
def mixed (r p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) : QScheme := by sorry
instance (r p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) :
    IsProper (mixed r p H).hom := by sorry
instance (r p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) :
    Smooth (mixed r p H).hom := by sorry
instance (r p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) :
    Fact (topologicalKrullDim (mixed r p H).left = 1) := ⟨by sorry⟩
def mixedToFiber (r p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) :
    mixed r p H ⟶ pullback (forgetCyclic r) (forgetLevel p H) := by sorry
instance (r p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) :
    IsIntegralHom (mixedToFiber r p H).left := by sorry
/-- Integral birational normalization: the map identifies the generic points
and their residue fields, and the source is normal. -/
lemma mixed_normal_stalks (r p : ℕ) [Fact p.Prime]
    (H : Subgroup (GL (Fin 2) (ZMod p))) (x : (mixed r p H).left) :
    IsIntegrallyClosed ((mixed r p H).left.presheaf.stalk x) := by sorry
lemma mixed_normalization (r p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) (ZMod p))) :
    ∃ U : (pullback (forgetCyclic r) (forgetLevel p H)).left.Opens,
      Dense (U : Set (pullback (forgetCyclic r) (forgetLevel p H)).left) ∧
      IsIso (pullback.snd (mixedToFiber r p H).left U.ι) := by sorry

/-- A split Cartan in the same basis as the nonsplit multiplication model. -/
def splitCartan (p : ℕ) [Fact p.Prime] : Subgroup (GL (Fin 2) (ZMod p)) := by sorry
lemma mem_splitCartan (p : ℕ) [Fact p.Prime] (g : GL (Fin 2) (ZMod p)) :
    g ∈ splitCartan p ↔ ∀ i j, i ≠ j → (g : Matrix (Fin 2) (Fin 2) (ZMod p)) i j = 0 := by sorry
abbrev mixedNs (r p : ℕ) [Fact p.Prime] := mixed r p (nonsplitNormalizer p)
abbrev mixedSp (r p : ℕ) [Fact p.Prime] := mixed r p (Subgroup.normalizer (splitCartan p : Set (GL (Fin 2) (ZMod p))))
abbrev mixedCover (r p : ℕ) [Fact p.Prime] :=
  mixed r p (Subgroup.normalizer (splitCartan p : Set (GL (Fin 2) (ZMod p))) ⊓ nonsplitNormalizer p)
def coverToSp (r p : ℕ) [Fact p.Prime] : mixedCover r p ⟶ mixedSp r p := by sorry
def coverToNs (r p : ℕ) [Fact p.Prime] : mixedCover r p ⟶ mixedNs r p := by sorry

/-- Jacobian varieties, using the existing abelian-variety carrier. The
Albanese property specifies this imported construction. -/
def jacobian (X : QScheme) [IsProper X.hom] [Smooth X.hom]
    [Fact (topologicalKrullDim X.left = 1)] : AV := by sorry
def abelJacobi (X : QScheme) [IsProper X.hom] [Smooth X.hom]
    [Fact (topologicalKrullDim X.left = 1)] (K : Type) [Field K] [Algebra ℚ K]
    (c : Points X K) :
    (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℚ K)))).obj X ⟶
      ((jacobian X).baseChange K).toOver := by sorry
def abelJacobiQ (X : QScheme) [IsProper X.hom] [Smooth X.hom]
    [Fact (topologicalKrullDim X.left = 1)]
    [GeometricallyIntegral X.hom] (c : Points X ℚ) : X ⟶ (jacobian X).toOver := by sorry
lemma abelJacobi_universal (X : QScheme) [IsProper X.hom] [Smooth X.hom]
    [Fact (topologicalKrullDim X.left = 1)]
    [GeometricallyIntegral X.hom] (c : Points X ℚ) (B : AV)
    (f : X ⟶ B.toOver) (hzero : (c ≫ f).left = B.zeroSection) :
    ∃! u : jacobian X ⟶ B,
      abelJacobiQ X c ≫ TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toOverHom u = f := by sorry

/-- Pullback and norm of degree-zero divisors, imported from JacobianChallenge. -/
def jacobianPullback {X Y : QScheme} [IsProper X.hom] [Smooth X.hom]
    [Fact (topologicalKrullDim X.left = 1)]
    [IsProper Y.hom] [Smooth Y.hom]
    [Fact (topologicalKrullDim Y.left = 1)] (f : X ⟶ Y) : jacobian Y ⟶ jacobian X := by sorry
def jacobianPushforward {X Y : QScheme} [IsProper X.hom] [Smooth X.hom]
    [Fact (topologicalKrullDim X.left = 1)]
    [IsProper Y.hom] [Smooth Y.hom]
    [Fact (topologicalKrullDim Y.left = 1)] (f : X ⟶ Y) : jacobian X ⟶ jacobian Y := by sorry
abbrev chenMap (r p : ℕ) [Fact p.Prime] :
    jacobian (mixedSp r p) ⟶ jacobian (mixedNs r p) :=
  jacobianPullback (coverToSp r p) ≫ jacobianPushforward (coverToNs r p)
/-- Identifies the split mixed curve with X₀(rp²)/w_(p²), retaining r-level. -/
def atkinLehnerP2 (r p : ℕ) [Fact p.Prime] : x0 (r * p ^ 2) ≅ x0 (r * p ^ 2) := by sorry
def p2Quotient (r p : ℕ) [Fact p.Prime] : QScheme := by sorry
def p2QuotientMap (r p : ℕ) [Fact p.Prime] : x0 (r * p ^ 2) ⟶ p2Quotient r p := by sorry
lemma p2Quotient_invariant (r p : ℕ) [Fact p.Prime] :
    (atkinLehnerP2 r p).hom ≫ p2QuotientMap r p = p2QuotientMap r p := by sorry
lemma p2Quotient_desc (r p : ℕ) [Fact p.Prime] (Y : QScheme)
    (f : x0 (r * p ^ 2) ⟶ Y)
    (hf : (atkinLehnerP2 r p).hom ≫ f = f) :
    ∃! g : p2Quotient r p ⟶ Y, p2QuotientMap r p ≫ g = f := by sorry
def splitQuotientIso (r p : ℕ) [Fact p.Prime] (hcoprime : Nat.Coprime r p) :
    mixedSp r p ≅ p2Quotient r p := by sorry
/-- Away-p Hecke operators induced by the usual cyclic correspondences. -/
def hecke (X : QScheme) [IsProper X.hom] [Smooth X.hom]
    [Fact (topologicalKrullDim X.left = 1)] (n : ℕ) : jacobian X ⟶ jacobian X := by sorry
/-- d(E,C)=(E,C[rp]), followed by the p-local involution quotient. -/
def degeneracy (r p : ℕ) [Fact p.Prime] : x0 (r * p ^ 2) ⟶ x0 (r * p) := by sorry
def quotientProjection (r p : ℕ) [Fact p.Prime] : x0 (r * p ^ 2) ⟶ mixedSp r p := by sorry
lemma quotientProjection_spec (r p : ℕ) [Fact p.Prime] (hcoprime : Nat.Coprime r p) :
    quotientProjection r p ≫ (splitQuotientIso r p hcoprime).hom = p2QuotientMap r p := by sorry
/-- π_* d^*: the actual p-old map, retaining the r-level. -/
def oldMap (r p : ℕ) [Fact p.Prime] : jacobian (x0 (r * p)) ⟶ jacobian (mixedSp r p) :=
  jacobianPullback (degeneracy r p) ≫ jacobianPushforward (quotientProjection r p)

/-- Kernel and optimality are actual geometric conditions on an abelian hom. -/
abbrev kernelScheme {J A : AV} (π : J ⟶ A) :=
  pullback (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom π) A.zeroSection

def Optimal {J A : AV} (π : J ⟶ A) : Prop :=
  Surjective (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom π) ∧
    GeometricallyConnected (pullback.snd
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom π) A.zeroSection)

/-- This is the *specified* winding quotient, not an arbitrary rank-zero A.
It is the optimal mixed quotient isogenous to the full-new annihilator
quotient. The two integral lattices and the transfer isogeny remain distinct. -/
def windingQuotient (r p : ℕ) [Fact p.Prime] : AV := by sorry
def windingProjection (r p : ℕ) [Fact p.Prime] :
    jacobian (mixedNs r p) ⟶ windingQuotient r p := by sorry

/-- Maximal real cyclotomic field, concretely generated by ζ_p+ζ_p⁻¹. -/
def realCyclotomic (p : ℕ) : IntermediateField ℚ ℝ :=
  IntermediateField.adjoin ℚ {2 * Real.cos (2 * Real.pi / p)}
instance (p : ℕ) : NumberField (realCyclotomic p) := by sorry

end TauCeti.EffectiveEllipticComparison.Native

namespace TauCeti.EffectiveEllipticComparison.Native
open CategoryTheory Limits _root_.AlgebraicGeometry IsDedekindDomain
open scoped CategoryTheory.MonObj NumberField TauCeti.AlgebraicGeometry.AbelianVariety.Hom

/-- Complex points with the analytic topology, not the Zariski topology of
scheme points. The analytic comparison is imported from the modular-curve
and Jacobian prerequisites. -/
abbrev analyticTopology (A : AV) : TopologicalSpace (Points A.toOver ℂ) := by sorry
abbrev analyticSpace (A : AV) : TopCat :=
  letI := analyticTopology A
  TopCat.of (Points A.toOver ℂ)
abbrev H1 (A : AV) : ModuleCat ℚ :=
  ((AlgebraicTopology.singularHomologyFunctor (ModuleCat ℚ) 1).obj
    (ModuleCat.of ℚ ℚ)).obj (analyticSpace A)

def analyticMap {A B : AV} (f : A ⟶ B) : analyticSpace A ⟶ analyticSpace B := by
  letI := analyticTopology A
  letI := analyticTopology B
  exact TopCat.ofHom
    ⟨fun P => P ≫ TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toOverHom f, by sorry⟩
abbrev homologyMap {A B : AV} (f : A ⟶ B) : H1 A →ₗ[ℚ] H1 B :=
  (((AlgebraicTopology.singularHomologyFunctor (ModuleCat ℚ) 1).obj
    (ModuleCat.of ℚ ℚ)).map (analyticMap f)).hom

/-- The full-new quotient of the p-local involution quotient, not merely the
p-new quotient. Its Hecke action and period pairing are imported geometric data. -/
def fullNewJacobian (r p : ℕ) [Fact p.Prime] : AV := by sorry
def fullNewProjection (r p : ℕ) [Fact p.Prime] :
    jacobian (mixedSp r p) ⟶ fullNewJacobian r p := by sorry
def fullNewHecke (r p n : ℕ) [Fact p.Prime] : fullNewJacobian r p ⟶ fullNewJacobian r p := by sorry
/-- Action induced on actual rational singular homology. -/
def fullNewHomologyHecke (r p n : ℕ) [Fact p.Prime] :
    Module.End ℚ (H1 (fullNewJacobian r p)) := homologyMap (fullNewHecke r p n)
abbrev integralHeckeOrder (r p : ℕ) [Fact p.Prime] :
    Subring (Module.End ℚ (H1 (fullNewJacobian r p))) :=
  Subring.closure {T | ∃ n : ℕ, 0 < n ∧ Nat.Coprime n p ∧ T = fullNewHomologyHecke r p n}

/-- The projected rational winding class of the geodesic from 0 to infinity.
Its period API specifies the class, before any nonvanishing theorem is used. -/
def windingClass (r p : ℕ) [Fact p.Prime] : H1 (fullNewJacobian r p) := by sorry
/-- The annihilator in the actual integral Hecke order. -/
def windingAnnihilator (r p : ℕ) [Fact p.Prime] : Ideal (integralHeckeOrder r p) := by sorry
lemma mem_windingAnnihilator (r p : ℕ) [Fact p.Prime] (T : integralHeckeOrder r p) :
    T ∈ windingAnnihilator r p ↔ (T : Module.End ℚ (H1 (fullNewJacobian r p)))
      (windingClass r p) = 0 := by sorry

/-- The corresponding geometric integral Hecke endomorphism. -/
def integralHeckeAction (r p : ℕ) [Fact p.Prime] (T : integralHeckeOrder r p) :
    fullNewJacobian r p ⟶ fullNewJacobian r p := by sorry
lemma integralHeckeAction_homology (r p : ℕ) [Fact p.Prime] (T : integralHeckeOrder r p) :
    homologyMap (integralHeckeAction r p T) = (T : Module.End ℚ (H1 (fullNewJacobian r p))) := by sorry

def splitWindingQuotient (r p : ℕ) [Fact p.Prime] : AV := by sorry
/-- Quotient by I_e B; this is a defining universal property, not a field
asserting nonzero dimension, rank zero or formal immersion. -/
def fullNewToWinding (r p : ℕ) [Fact p.Prime] :
    fullNewJacobian r p ⟶ splitWindingQuotient r p := by sorry
lemma winding_quotient_universal (r p : ℕ) [Fact p.Prime] (D : AV)
    (f : fullNewJacobian r p ⟶ D)
    (hf : ∀ T ∈ windingAnnihilator r p, integralHeckeAction r p T ≫ f = 1) :
    ∃! g : splitWindingQuotient r p ⟶ D, fullNewToWinding r p ≫ g = f := by sorry
lemma winding_quotient_annihilates (r p : ℕ) [Fact p.Prime] :
    ∀ T ∈ windingAnnihilator r p,
      integralHeckeAction r p T ≫ fullNewToWinding r p = 1 := by sorry

/-- Prime-to-p Hecke stability of the geometric kernel, on all Q̄-points. -/
def HeckeKernelStable {J A : AV} (π : J ⟶ A) (T : J ⟶ J) : Prop :=
  ∀ P : Points J.toOver Qbar,
    P ≫ TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toOverHom π = 1 →
    P ≫ TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toOverHom T ≫
      TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toOverHom π = 1

/-- The canonical noncuspidal open of the normalized mixed curve. -/
def mixedOpen (r p : ℕ) [Fact p.Prime] : QScheme := by sorry
def mixedOpenInclusion (r p : ℕ) [Fact p.Prime] : mixedOpen r p ⟶ mixedNs r p := by sorry
instance (r p : ℕ) [Fact p.Prime] : IsOpenImmersion (mixedOpenInclusion r p).left := by sorry
def IsCusp (r p : ℕ) [Fact p.Prime] (c : Points (mixedNs r p) (realCyclotomic p)) : Prop :=
  ¬ ∃ P : Points (mixedOpen r p) (realCyclotomic p), P ≫ mixedOpenInclusion r p = c
/-- The infinity cusp in the chosen nonsplit-Cartan coordinates. -/
def infinityCusp (r p : ℕ) [Fact p.Prime] : Points (mixedNs r p) (realCyclotomic p) := by sorry
lemma infinityCusp_is_cusp (r p : ℕ) [Fact p.Prime] : IsCusp r p (infinityCusp r p) := by sorry

/-- Base-change of a rational point, with the actual Spec map. -/
def baseChangePoint (X : QScheme) (K : Type) [Field K] [Algebra ℚ K]
    (P : Points X ℚ) : Points X K :=
  Over.homMk (Spec.map (CommRingCat.ofHom (algebraMap ℚ K)) ≫ P.left) (by simp [P.w])
/-- Abel–Jacobi based at the chosen cusp, followed by the specified quotient. -/
abbrev cuspProjection (r p : ℕ) [Fact p.Prime] :
    (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℚ (realCyclotomic p))))).obj
      (mixedNs r p) ⟶ ((windingQuotient r p).baseChange (realCyclotomic p)).toOver :=
  abelJacobi (mixedNs r p) (realCyclotomic p) (infinityCusp r p) ≫
    TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toOverHom
      ((TauCeti.AlgebraicGeometry.AbelianVariety.baseChangeFunctor (realCyclotomic p)).map
        (windingProjection r p))
/-- View a K-valued point as a section of the base changed scheme. -/
def pointAsSection (X : QScheme) (K : Type) [Field K] [Algebra ℚ K]
    (P : Points X K) :
    Over.mk (𝟙 (Spec (.of K))) ⟶
      (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℚ K)))).obj X := by sorry

abbrev LocalIntegers (K : Type) [Field K] [NumberField K]
    (P : HeightOneSpectrum (𝓞 K)) := Localization.AtPrime P.asIdeal
/-- Canonical localization embedding, extending O_K → K. -/
def localEmbedding (K : Type) [Field K] [NumberField K]
    (P : HeightOneSpectrum (𝓞 K)) : LocalIntegers K P →+* K := by sorry
lemma localEmbedding_integer (K : Type) [Field K] [NumberField K]
    (P : HeightOneSpectrum (𝓞 K)) (a : 𝓞 K) :
    localEmbedding K P (algebraMap (𝓞 K) (LocalIntegers K P) a) = (a : K) := by sorry

/-- A genuine smooth group model with the Néron mapping property. -/
structure NeronModel (A : AV) (K : Type) [Field K] [NumberField K]
    (P : HeightOneSpectrum (𝓞 K)) where
  toOver : Over (Spec (.of (LocalIntegers K P)))
  group : GrpObj toOver
  smooth : Smooth toOver.hom
  separated : IsSeparated toOver.hom
  genericIso : (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding K P)))).obj toOver ≅
    (A.baseChange K).toOver
  mapping : ∀ (Y : Over (Spec (.of (LocalIntegers K P)))) (_ : Smooth Y.hom)
    (f : (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding K P)))).obj Y ⟶
      (A.baseChange K).toOver),
    ∃! g : Y ⟶ toOver,
      (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding K P)))).map g ≫ genericIso.hom = f
attribute [instance] NeronModel.group NeronModel.smooth NeronModel.separated

def neronModel (A : AV) (K : Type) [Field K] [NumberField K]
    (P : HeightOneSpectrum (𝓞 K)) : NeronModel A K P := by sorry

/-- Canonical integral model over O_(K,P), imported from the modular-curve
continuation: proper, flat, with its specified generic fibre. -/
structure MixedIntegralModel (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) where
  toOver : Over (Spec (.of (LocalIntegers (realCyclotomic p) P)))
  proper : IsProper toOver.hom
  flat : Flat toOver.hom
  finitePresentation : LocallyOfFinitePresentation toOver.hom
  genericIso :
    (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding (realCyclotomic p) P)))).obj toOver ≅
    (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℚ (realCyclotomic p))))).obj (mixedNs r p)
attribute [instance] MixedIntegralModel.proper MixedIntegralModel.flat MixedIntegralModel.finitePresentation

def canonicalModel (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) : MixedIntegralModel r p P := by sorry
abbrev smoothModel (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) :=
  Over.mk ((canonicalModel r p P).toOver.hom.smoothLocus.ι ≫ (canonicalModel r p P).toOver.hom)
def smoothModelGenericIso (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) :
    (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding (realCyclotomic p) P)))).obj
      (smoothModel r p P) ≅
    (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℚ (realCyclotomic p))))).obj (mixedNs r p) := by sorry

/-- The extension selected by the Néron mapping property. -/
def integralCuspProjection (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) :
    smoothModel r p P ⟶ (neronModel (windingQuotient r p) (realCyclotomic p) P).toOver := by sorry
lemma integralCuspProjection_generic (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) :
    (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding (realCyclotomic p) P)))).map
      (integralCuspProjection r p P) ≫
        (neronModel (windingQuotient r p) (realCyclotomic p) P).genericIso.hom =
      (smoothModelGenericIso r p P).hom ≫ cuspProjection r p := by sorry

def infinitySection (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) :
    Over.mk (𝟙 (Spec (.of (LocalIntegers (realCyclotomic p) P)))) ⟶ smoothModel r p P := by sorry
lemma infinitySection_generic (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) :
    Spec.map (CommRingCat.ofHom (localEmbedding (realCyclotomic p) P)) ≫
      (infinitySection r p P).left =
    (pointAsSection (mixedNs r p) (realCyclotomic p) (infinityCusp r p)).left ≫
      (smoothModelGenericIso r p P).inv.left ≫
      pullback.fst (smoothModel r p P).hom
        (Spec.map (CommRingCat.ofHom (localEmbedding (realCyclotomic p) P))) := by sorry
abbrev infinitySpecialization (r p : ℕ) [Fact p.Prime]
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p))) : (smoothModel r p P).left :=
  (infinitySection r p P).left (IsLocalRing.closedPoint (LocalIntegers (realCyclotomic p) P))

/-- Completed local rings at actual scheme points, completed at their maximal
ideals. The induced map is specified by its compatibility with the stalk map. -/
abbrev CompletedStalk (X : Scheme) (x : X) :=
  AdicCompletion (IsLocalRing.maximalIdeal (X.presheaf.stalk x)) (X.presheaf.stalk x)
def completedStalkMap {X Y : Scheme} (f : X ⟶ Y) (x : X) :
    CompletedStalk Y (f x) →+* CompletedStalk X x := by sorry
lemma completedStalkMap_of {X Y : Scheme} (f : X ⟶ Y) (x : X) (a : Y.presheaf.stalk (f x)) :
    completedStalkMap f x (AdicCompletion.of _ _ a) =
      AdicCompletion.of _ _ ((f.stalkMap x).hom a) := by sorry
def FormalImmersionAt {X Y : Scheme} (f : X ⟶ Y) (x : X) : Prop :=
  Function.Surjective (completedStalkMap f x)

end TauCeti.EffectiveEllipticComparison.Native

namespace TauCeti.EffectiveEllipticComparison.Native
open CategoryTheory Limits _root_.AlgebraicGeometry IsDedekindDomain
open scoped CategoryTheory.MonObj NumberField TauCeti.AlgebraicGeometry.AbelianVariety.Hom

/-- R01.3: the finite Galois splitting field of the *actual* residual action. -/
abbrev torsionSplittingField (E : Curve) (ell : ℕ) [Fact ell.Prime] : IntermediateField ℚ Qbar :=
  IntermediateField.fixedField (rho E ell).ker
instance (E : Curve) (ell : ℕ) [Fact ell.Prime] : NumberField (torsionSplittingField E ell) := by sorry
/-- Restriction and the descended action, specified on every global automorphism. -/
def splittingRestriction (E : Curve) (ell : ℕ) [Fact ell.Prime] :
    GQ →* ((torsionSplittingField E ell) ≃ₐ[ℚ] (torsionSplittingField E ell)) := by sorry
lemma splittingRestriction_coe (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (σ : GQ) (x : torsionSplittingField E ell) :
    ((splittingRestriction E ell σ x : torsionSplittingField E ell) : Qbar) = σ (x : Qbar) := by sorry

def splittingAction (E : Curve) (ell : ℕ) [Fact ell.Prime] :
    ((torsionSplittingField E ell) ≃ₐ[ℚ] (torsionSplittingField E ell)) →*
      GL (Fin 2) (ZMod ell) := by sorry
lemma splittingAction_restrict (E : Curve) (ell : ℕ) [Fact ell.Prime] (σ : GQ) :
    splittingAction E ell (splittingRestriction E ell σ) = rho E ell σ := by sorry

/-- Actual lower ramification filtration at a prime of O_(Q(E[ell])). The
membership API includes decomposition and the valuation test on all integers. -/
def lowerRamificationGroup (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (P : HeightOneSpectrum (𝓞 (torsionSplittingField E ell))) (i : ℕ) :
    Subgroup ((torsionSplittingField E ell) ≃ₐ[ℚ] (torsionSplittingField E ell)) := by sorry
lemma mem_lowerRamificationGroup (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (P : HeightOneSpectrum (𝓞 (torsionSplittingField E ell))) (i : ℕ)
    (σ : (torsionSplittingField E ell) ≃ₐ[ℚ] (torsionSplittingField E ell)) :
    σ ∈ lowerRamificationGroup E ell P i ↔
      (∀ x : torsionSplittingField E ell,
        P.valuation (torsionSplittingField E ell) (σ x) = P.valuation (torsionSplittingField E ell) x) ∧
      ∀ a : 𝓞 (torsionSplittingField E ell),
        P.valuation (torsionSplittingField E ell) (σ (a : torsionSplittingField E ell) - a) ≤
          WithZero.exp (-(i + 1 : ℤ)) := by sorry

def ramificationFixedSpace (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (P : HeightOneSpectrum (𝓞 (torsionSplittingField E ell))) (i : ℕ) :
    Submodule (ZMod ell) (Fin 2 → ZMod ell) := by sorry
lemma mem_ramificationFixedSpace (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (P : HeightOneSpectrum (𝓞 (torsionSplittingField E ell))) (i : ℕ) (v : Fin 2 → ZMod ell) :
    v ∈ ramificationFixedSpace E ell P i ↔
      ∀ σ ∈ lowerRamificationGroup E ell P i,
        (splittingAction E ell σ : Matrix (Fin 2) (Fin 2) (ZMod ell)).mulVec v = v := by sorry

def residualArtinExponent (E : Curve) (ell q : ℕ) [Fact ell.Prime] : ℕ := by sorry
/-- The whole Artin sum, including every higher (Swan) group. -/
lemma residualArtinExponent_eq (E : Curve) (ell q : ℕ) [Fact ell.Prime]
    (hq : q.Prime) (hne : q ≠ ell)
    (P : HeightOneSpectrum (𝓞 (torsionSplittingField E ell)))
    (habove : Ideal.comap (Int.castRingHom (𝓞 (torsionSplittingField E ell))) P.asIdeal =
      Ideal.span {(q : ℤ)}) :
    (residualArtinExponent E ell q : ℚ) = ∑' i : ℕ,
      (Nat.card (lowerRamificationGroup E ell P i) : ℚ) /
        Nat.card (lowerRamificationGroup E ell P 0) *
        (2 - Module.finrank (ZMod ell) (ramificationFixedSpace E ell P i) : ℚ) := by sorry
lemma residualConductor_exponent (E : Curve) (ell q : ℕ) [Fact ell.Prime]
    (hq : q.Prime) (hne : q ≠ ell) :
    (residualConductor E ell).factorization q = residualArtinExponent E ell q := by sorry

/-- Elliptic curves' projective group scheme, with its native point comparison.
This previews the existing upstream equation-to-scheme interface. -/
def ellipticVariety (E : Curve) : AV := by sorry
lemma ellipticVariety_dimension (E : Curve) : (ellipticVariety E).dim = 1 := by sorry
def ellipticVariety_points (E : Curve) (K : Type) [Field K] [Algebra ℚ K] :
    (E.val.baseChange K).toAffine.Point ≃+ Additive (Points (ellipticVariety E).toOver K) := by sorry

/-- The rational prime of O_Q and its localization at q. -/
def rationalPrime (q : ℕ) [Fact q.Prime] : HeightOneSpectrum (𝓞 ℚ) := by sorry
lemma rationalPrime_above (q : ℕ) [Fact q.Prime] :
    Ideal.comap (Int.castRingHom (𝓞 ℚ)) (rationalPrime q).asIdeal = Ideal.span {(q : ℤ)} := by sorry
abbrev rationalLocalRing (q : ℕ) [Fact q.Prime] := LocalIntegers ℚ (rationalPrime q)

/-- Minimal regular proper model, imported from Elliptic curves Layer 4.5b.
Its generic fibre is the actual elliptic group scheme, not an arbitrary curve. -/
def minimalRegularModel (E : Curve) (q : ℕ) [Fact q.Prime] :
    Over (Spec (.of (rationalLocalRing q))) := by sorry
instance (E : Curve) (q : ℕ) [Fact q.Prime] : IsProper (minimalRegularModel E q).hom := by sorry
instance (E : Curve) (q : ℕ) [Fact q.Prime] : Flat (minimalRegularModel E q).hom := by sorry
lemma minimalRegularModel_regular (E : Curve) (q : ℕ) [Fact q.Prime]
    (x : (minimalRegularModel E q).left) :
    IsRegularLocalRing ((minimalRegularModel E q).left.presheaf.stalk x) := by sorry
def minimalRegularModel_generic (E : Curve) (q : ℕ) [Fact q.Prime] :
    (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding ℚ (rationalPrime q))))).obj
      (minimalRegularModel E q) ≅ (ellipticVariety E).toOver := by sorry
/-- A minimal model is dominated by every other regular proper model with this
specified generic fibre. This keeps the special-fibre component count exact. -/
lemma minimalRegularModel_minimal (E : Curve) (q : ℕ) [Fact q.Prime]
    (Y : Over (Spec (.of (rationalLocalRing q)))) (hproper : IsProper Y.hom)
    (hflat : Flat Y.hom) (hregular : ∀ x : Y.left, IsRegularLocalRing (Y.left.presheaf.stalk x))
    (e : (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding ℚ (rationalPrime q))))).obj Y ≅
      (ellipticVariety E).toOver) :
    ∃ f : Y ⟶ minimalRegularModel E q,
      (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding ℚ (rationalPrime q))))).map f ≫
        (minimalRegularModel_generic E q).hom = e.hom := by sorry

def rationalResidue (q : ℕ) [Fact q.Prime] :
    rationalLocalRing q →+* AlgebraicClosure (ZMod q) := by sorry
lemma rationalResidue_integer (q : ℕ) [Fact q.Prime] (a : ℤ) :
    rationalResidue q (algebraMap (𝓞 ℚ) (rationalLocalRing q) (a : 𝓞 ℚ)) = (a : AlgebraicClosure (ZMod q)) := by sorry
abbrev geometricSpecialFiber (E : Curve) (q : ℕ) [Fact q.Prime] : Scheme :=
  pullback (minimalRegularModel E q).hom (Spec.map (CommRingCat.ofHom (rationalResidue q)))
/-- Ogg's exact local conductor formula on the minimal regular geometric fibre. -/
lemma conductor_ogg (E : Curve) (q : ℕ) [Fact q.Prime] :
    (conductor E).factorization q +
      Nat.card {Z : Set (geometricSpecialFiber E q) // Z ∈ irreducibleComponents (geometricSpecialFiber E q)} =
      discriminantValuation E q + 1 := by sorry

/-- Finite flat commutative group-scheme models over Z_(ell), using the existing
upstream modular-curve vocabulary. Structural fields assert no weight theorem. -/
structure FiniteFlatGroup (R : Type) [CommRing R] where
  toOver : Over (Spec (.of R))
  group : GrpObj toOver
  comm : letI := group; IsCommMonObj toOver
  finite : IsFinite toOver.hom
  flat : Flat toOver.hom
  presentation : LocallyOfFinitePresentation toOver.hom
attribute [instance] FiniteFlatGroup.group FiniteFlatGroup.comm FiniteFlatGroup.finite
  FiniteFlatGroup.flat FiniteFlatGroup.presentation

abbrev flatGeometricPoints (ell : ℕ) [Fact ell.Prime] (G : FiniteFlatGroup (rationalLocalRing ell)) :=
  Over.mk (Spec.map (CommRingCat.ofHom
    ((algebraMap ℚ Qbar).comp (localEmbedding ℚ (rationalPrime ell))))) ⟶ G.toOver
/-- Spec(σ) precomposition: the actual Galois action on the generic fibre. -/
def flatPointAction (ell : ℕ) [Fact ell.Prime] (G : FiniteFlatGroup (rationalLocalRing ell))
    (σ : GQ) : flatGeometricPoints ell G ≃* flatGeometricPoints ell G := by sorry
lemma flatPointAction_spec (ell : ℕ) [Fact ell.Prime] (G : FiniteFlatGroup (rationalLocalRing ell))
    (σ : GQ) (P : flatGeometricPoints ell G) :
    (flatPointAction ell G σ P).left = Spec.map (CommRingCat.ofHom σ.toRingHom) ≫ P.left := by sorry

def FiniteFlatTorsion (E : Curve) (ell : ℕ) [Fact ell.Prime] : Prop :=
  ∃ G : FiniteFlatGroup (rationalLocalRing ell),
    ∃ e : Torsion E ell ≃+ Additive (flatGeometricPoints ell G),
      ∀ σ : GQ, ∀ P, e (torsionAction E ell σ P) = flatPointAction ell G σ (e P)
/-- R20.3's weight-two finite-flat criterion for the actual elliptic action. -/
lemma serreWeight_two_iff (E : Curve) (ell : ℕ) [Fact ell.Prime]
    (hell : 3 ≤ ell) (hirr : Irreducible E ell) :
    serreWeight E ell = 2 ↔ FiniteFlatTorsion E ell := by sorry

end TauCeti.EffectiveEllipticComparison.Native

namespace TauCeti.EffectiveEllipticComparison.Native
open CategoryTheory Limits _root_.AlgebraicGeometry IsDedekindDomain
open scoped CategoryTheory.MonObj NumberField TauCeti.AlgebraicGeometry.AbelianVariety.Hom

/-- The p-new quotient is specified by annihilating the actual old map. -/
def pNewJacobian (r p : ℕ) [Fact p.Prime] : AV := by sorry
def pNewProjection (r p : ℕ) [Fact p.Prime] :
    jacobian (mixedSp r p) ⟶ pNewJacobian r p := by sorry
lemma pNew_universal (r p : ℕ) [Fact p.Prime] (D : AV)
    (f : jacobian (mixedSp r p) ⟶ D) (hf : oldMap r p ≫ f = 1) :
    ∃! g : pNewJacobian r p ⟶ D, pNewProjection r p ≫ g = f := by sorry
lemma pNew_kills_old (r p : ℕ) [Fact p.Prime] : oldMap r p ≫ pNewProjection r p = 1 := by sorry

def chenNewMap (r p : ℕ) [Fact p.Prime] : pNewJacobian r p ⟶ jacobian (mixedNs r p) := by sorry
lemma chenNewMap_factor (r p : ℕ) [Fact p.Prime] :
    pNewProjection r p ≫ chenNewMap r p = chenMap r p := by sorry
/-- Separate imported Chen theorem (Lemos Theorem 3.3, §3, p.9 v2), beyond
old-part vanishing. This is a supplier prerequisite, not a new target here. -/
lemma chen_new_isogeny (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    Surjective (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom (chenNewMap r p)) ∧
      IsFinite (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom (chenNewMap r p)) := by sorry

/-- The transfer between the two integral winding quotients. -/
def windingTransfer (r p : ℕ) [Fact p.Prime] :
    windingQuotient r p ⟶ splitWindingQuotient r p := by sorry
lemma windingTransfer_isogeny (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    Surjective (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom (windingTransfer r p)) ∧
      IsFinite (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom (windingTransfer r p)) := by sorry
/-- Compatibility after clearing the finite isogeny denominator. Multiplication
on abelian homomorphisms is written as a power in the native group-object API. -/
lemma windingProjection_chen (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    ∃ m : ℕ, 0 < m ∧ chenMap r p ≫ windingProjection r p ≫ windingTransfer r p =
      (fullNewProjection r p ≫ fullNewToWinding r p) ^ m := by sorry

/-- Actual period of a weight-two form along the geodesic 0 → i∞. -/
def windingPeriod {N : ℕ} [NeZero N] (f : Newform N) : ℂ :=
  Complex.I * ∫ t : ℝ, if ht : 0 < t then
    f.toCuspForm ⟨(t : ℂ) * Complex.I, by simpa using ht⟩ else 0

/-- The form lies in the actual trivial-character newspace. -/
def newspaceForm {N : ℕ} [NeZero N] (f : Newform N) (hχ : f.χ = 1) :
    ↥(TauCeti.cuspFormsNew N 2 ⊓ cuspFormCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ)) := by sorry
lemma newspaceForm_coe {N : ℕ} [NeZero N] (f : Newform N) (hχ : f.χ = 1) :
    (newspaceForm f hχ : CuspForm (CongruenceSubgroup.Gamma1 N) 2) = f.toCuspForm := by sorry

/-- The p-local Atkin–Lehner involution, with r-level retained. -/
def atkinLehnerNew (r p : ℕ) [Fact p.Prime] [NeZero (r * p ^ 2)] :
    Module.End ℂ ↥(TauCeti.cuspFormsNew (r * p ^ 2) 2 ⊓
      cuspFormCharSpace 2 (1 : (ZMod (r * p ^ 2))ˣ →* ℂˣ)) := by sorry
/-- Integration of the descended holomorphic differential over actual rational
singular homology; this is the Jacobian/modular-form period comparison. -/
def periodPairing (r p : ℕ) [Fact p.Prime] [NeZero (r * p ^ 2)]
    (f : Newform (r * p ^ 2)) (hχ : f.χ = 1)
    (hplus : atkinLehnerNew r p (newspaceForm f hχ) = newspaceForm f hχ) :
    H1 (fullNewJacobian r p) →ₗ[ℚ] ℂ := by sorry
lemma windingClass_period (r p : ℕ) [Fact p.Prime] [NeZero (r * p ^ 2)]
    (f : Newform (r * p ^ 2)) (hχ : f.χ = 1)
    (hplus : atkinLehnerNew r p (newspaceForm f hχ) = newspaceForm f hχ) :
    periodPairing r p f hχ hplus (windingClass r p) = windingPeriod f := by sorry

end TauCeti.EffectiveEllipticComparison.Native

namespace TauCeti.EffectiveEllipticComparison
open Native CategoryTheory Limits _root_.AlgebraicGeometry IsDedekindDomain
open scoped CategoryTheory.MonObj NumberField TauCeti.AlgebraicGeometry.AbelianVariety.Hom

/-! ## EC.6 — nonsplit images and the specified modular geometry -/

/-- Lemos, Proposition 2.2, §2, pp.4–5 (v2), including q=p. -/
theorem nonsplit_potential_good (E : Curve) (p : ℕ) [Fact p.Prime]
    (hp : 5 ≤ p) (himage : NonsplitImage E p) :
    PotentiallyGood E p ∧ ∀ (q : ℕ) (_ : Fact q.Prime),
      (q : ZMod p) ≠ 1 → (q : ZMod p) ≠ -1 → PotentiallyGood E q := by sorry

/-- Lemos, Lemma 3.2 and correspondence, §3, p.9 (v2).
The splitQuotientIso identifies the source with X₀(rp²)/w_(p²).
No new-quotient isogeny is concluded from these two identities. -/
theorem chen_correspondence (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    (∀ n : ℕ, 0 < n → Nat.Coprime n p →
      hecke (mixedSp r p) n ≫ chenMap r p = chenMap r p ≫ hecke (mixedNs r p) n) ∧
      oldMap r p ≫ chenMap r p = 1 := by sorry

/-- Lemos, Theorem 3.4, §3, p.10 (v2). Nonzero dimension and finite rational
points are conclusions about the specified quotient, not its defining fields. -/
theorem finite_winding_quotient (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    0 < (windingQuotient r p).dim ∧ Optimal (windingProjection r p) ∧
      Finite (Points (windingQuotient r p).toOver ℚ) ∧
      ∀ n : ℕ, 0 < n → Nat.Coprime n p →
        HeckeKernelStable (windingProjection r p) (hecke (mixedNs r p) n) := by sorry

/-- Darmon–Merel, Lemma 8.2, §8, pp.22–23; Lemos §3, p.10 (v2).
The localization, chosen real-cyclotomic cusp, smooth source, Néron target,
generic-fibre compatibility and completed-stalk surjectivity are explicit. -/
theorem cartan_cusp_formal_immersion (r p q : ℕ) [Fact p.Prime] [Fact q.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) (hp : 37 < p)
    (hq : (q : ZMod p) = 1 ∨ (q : ZMod p) = -1)
    (P : HeightOneSpectrum (𝓞 (realCyclotomic p)))
    (habove : Ideal.comap (Int.castRingHom (𝓞 (realCyclotomic p))) P.asIdeal =
      Ideal.span {(q : ℤ)}) :
    (Over.pullback (Spec.map (CommRingCat.ofHom (localEmbedding (realCyclotomic p) P)))).map
      (integralCuspProjection r p P) ≫
        (neronModel (windingQuotient r p) (realCyclotomic p) P).genericIso.hom =
      (smoothModelGenericIso r p P).hom ≫ cuspProjection r p ∧
    FormalImmersionAt (integralCuspProjection r p P).left (infinitySpecialization r p P) := by sorry

/-- Darmon–Merel, Lemma 8.3, §8, p.23; keep the broader p-range. -/
theorem cartan_point_torsion (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ))
    (hp : p ∉ ({2, 3, 5, 7, 13} : Finset ℕ)) (P : Points (mixedNs r p) ℚ) :
    ∃ n : ℕ, 0 < n ∧
      (pointAsSection (mixedNs r p) (realCyclotomic p)
        (baseChangePoint (mixedNs r p) (realCyclotomic p) P) ≫ cuspProjection r p) ^ n = 1 := by sorry

/-- Lemos, Theorem 1.4, p.3 and §3 conclusion, p.10 (v2), restricted to p>37.
The native rational denominator divides a power of p: j ∈ Z[1/p]. -/
theorem cartan_denominator_exclusion (E : Curve) (r p : ℕ) [Fact p.Prime]
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) (hp : 37 < p)
    (hiso : HasCyclicIsogeny E r) (himage : NonsplitImage E p) :
    ∃ k : ℕ, E.val.j.den ∣ p ^ k := by sorry

/-- Lemos, Proposition 2.1 and Theorem 2.3, §2, pp.4,6 (v2), specialized. -/
theorem integral_j_proper_image (E : Curve) (r p : ℕ) [Fact p.Prime]
    (hCM : NonCM E) (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) (hp : 37 < p)
    (hiso : HasCyclicIsogeny E r) (himage : ¬ Function.Surjective (rho E p)) :
    ∃ a : ℤ, E.val.j = (a : ℚ) := by sorry

/-- Lemos, numerator table and parameter argument, §2, pp.6–7 (v2).
The coordinate is on Y₀(r); the formula compares the actual j-morphism.
Integer divisibility retains both signs, and the finite set is exact. -/
theorem integral_j_characterisation (r : ℕ)
    (hr : r ∈ ({2, 3, 5, 7, 13} : Finset ℕ)) :
    (∀ P : Points (y0 r) ℚ,
      jValue r ℚ P = (lemosNumerator r).eval₂ (Int.castRingHom ℚ)
        (coordinateValue r hr P : ℚ) / (coordinateValue r hr P : ℚ)) ∧
    (∀ P : Points (y0 r) ℚ, (∃ a : ℤ, jValue r ℚ P = (a : ℚ)) →
      ∃ t : ℤ, t ≠ 0 ∧ t ∣ (lemosNumerator r).coeff 0 ∧
        (coordinateValue r hr P : ℚ) = (t : ℚ)) ∧
    (∀ a : ℤ, a ∈ lemosIntegralJ r ↔ ∃ P : Points (y0 r) ℚ, jValue r ℚ P = (a : ℚ)) := by sorry

/-- Lemos, Theorem 2.3, §2, p.6 (v2). -/
theorem proper_image_nonsplit (E : Curve) (p : ℕ) [Fact p.Prime]
    (hCM : NonCM E) (hp : 37 < p) (himage : ¬ Function.Surjective (rho E p)) :
    NonsplitImage E p := by sorry

/-- The universal quadratic-twist consequence used in Lemos §2, p.5 (v2).
No assertion at p=3 is exported. -/
theorem quadratic_twist_surjectivity (E F : Curve) (p : ℕ) [Fact p.Prime]
    (hp : 5 ≤ p) (htwist : QuadraticTwists E F) :
    Function.Surjective (rho E p) ↔ Function.Surjective (rho F p) := by sorry

/-- The six non-CM rational j-values at levels 11,17,37; -2^15 is excluded. -/
def largeLevelJ : Finset ℚ :=
  {-11 * 131 ^ 3, -11 ^ 2, -17 ^ 2 * 101 ^ 3 / 2,
    -17 * 373 ^ 3 / 2 ^ 17, -7 * 137 ^ 3 * 2083 ^ 3, -7 * 11 ^ 3}

/-- Lemos, §2 finite lists, pp.5–7 (v2). A universal certification obligation:
it quantifies over every curve with the listed j and every prime p>37. -/
theorem finite_image_certificates (E : Curve) (hCM : NonCM E)
    (hj : E.val.j ∈ largeLevelJ ∨ ∃ r : ℕ,
      r ∈ ({2, 3, 5, 7, 13} : Finset ℕ) ∧
      ∃ a ∈ lemosIntegralJ r, E.val.j = (a : ℚ)) :
    ∀ (p : ℕ) (_ : Fact p.Prime), 37 < p → Function.Surjective (rho E p) := by sorry

/-- Lemos, Theorem 1.1, p.2; §2 proof, pp.5–7 (v2). -/
theorem lemos_surjectivity (E : Curve) (hCM : NonCM E)
    (hiso : ∃ n : ℕ, 1 < n ∧ HasCyclicIsogeny E n) :
    ∀ (p : ℕ) (_ : Fact p.Prime), 37 < p → Function.Surjective (rho E p) := by sorry

end TauCeti.EffectiveEllipticComparison

namespace EllipticCurveModularityPartIIAcceptance

/-! ### The integral norm estimate

The prime ideal uses the native ring of integers and its contraction to ℤ.
The upper bound quantifies over every complex embedding of the number field.
-/

section Norm
open scoped NumberField

theorem norm_bound {K : Type*} [Field K] [NumberField K]
    (ell : ℕ) (hell : ell.Prime) (I : Ideal (𝓞 K))
    (hI : I.IsPrime) (hI0 : I ≠ ⊥)
    (habove : Ideal.comap (Int.castRingHom (𝓞 K)) I = Ideal.span {(ell : ℤ)})
    (x : 𝓞 K) (hx : x ∈ I) (hx0 : x ≠ 0) (B : ℝ)
    (hB : ∀ σ : K →ₐ[ℚ] ℂ, ‖σ (x : K)‖ ≤ B) :
    (ell : ℝ) ≤ |(Algebra.norm ℚ (x : K) : ℝ)| ∧
      |(Algebra.norm ℚ (x : K) : ℝ)| ≤ B ^ Module.finrank ℚ K := by sorry

end Norm

/-! ### The thresholds at level 11 in the two notations

The supplying interface writes `krausF 11 = 3 + 2 * √2` and `krausG 11 = 13 + 4 * √3`; the
sources write `(√(μ/6) + 1) ^ 2` with `μ(11)/6 = 2` and `μ(44)/6 = 12`. -/

theorem sqrt_two_add_one_sq : (Real.sqrt 2 + 1) ^ 2 = 3 + 2 * Real.sqrt 2 := by
  have h : Real.sqrt 2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  nlinarith [h]

theorem sqrt_twelve : Real.sqrt 12 = 2 * Real.sqrt 3 := by
  rw [show (12 : ℝ) = (2 * Real.sqrt 3) ^ 2 by
    have : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
    nlinarith [this]]
  exact Real.sqrt_sq (by positivity)

theorem sqrt_twelve_add_one_sq : (Real.sqrt 12 + 1) ^ 2 = 13 + 4 * Real.sqrt 3 := by
  rw [sqrt_twelve]
  have : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
  nlinarith [this]

/-- At level 11 the threshold `F` is smaller than `G`: the maximum `H` is not `F`. -/
theorem krausF_eleven_lt_krausG_eleven :
    (Real.sqrt 2 + 1) ^ 2 < (Real.sqrt 12 + 1) ^ 2 := by
  have h : Real.sqrt 2 < Real.sqrt 12 := Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h0 : (0 : ℝ) ≤ Real.sqrt 2 := Real.sqrt_nonneg 2
  nlinarith [h, h0]

/-! ### Residue characteristics in the formal immersion

A prime `q ≡ ±1 mod p`, for a prime `p ≥ 11`, is at least `2p - 1 ≥ 21`. So the
conditions `q > 13 ≥ r` and `q > 3` of the imported targets
EC.5/cartan-cusp-formal-immersion and EC.5/cartan-denominator-exclusion hold
for every prime `p` outside `{2, 3, 5, 7, 13}`. -/

theorem two_mul_sub_one_le_of_mod_eq (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (h11 : 11 ≤ p)
    (h : q % p = 1 ∨ q % p = p - 1) : 2 * p - 1 ≤ q := by
  by_contra hlt
  have hodd : p % 2 = 1 := by
    rcases hp.eq_two_or_odd with h2 | h2 <;> omega
  have hk : q / p ≤ 1 := by
    by_contra hk
    have h2 : p * 2 ≤ p * (q / p) := Nat.mul_le_mul_left p (by omega)
    have := Nat.div_add_mod q p
    omega
  have hdm := Nat.div_add_mod q p
  have h2 : 2 ∣ q ∨ q = 1 := by
    rcases h with h | h
    · interval_cases hqp : q / p
      · right; omega
      · left; omega
    · interval_cases hqp : q / p
      · left; omega
      · omega
  rcases h2 with h2 | h2
  · have hq2 : 2 = q := (Nat.prime_dvd_prime_iff_eq Nat.prime_two hq).mp h2
    have hmod : 2 % p = 2 := Nat.mod_eq_of_lt (by omega)
    rw [← hq2, hmod] at h
    omega
  · exact hq.one_lt.ne' h2

/-! ### Integral values of `f(t)/t`

The divisibility step of the imported target EC.5/integral-parameter-divisibility,
for any monic integer polynomial of degree at least 2: a nonzero rational `t`
with `f(t)/t` an integer is an integer dividing `f(0)`. Degree 1 is excluded:
`f = X + 1`, `t = 1/2` gives `f(t)/t = 3`. -/

theorem int_of_eval_div_self_int (f : Polynomial ℤ) (hf : f.Monic) (hdeg : 2 ≤ f.natDegree)
    (t : ℚ) (ht : t ≠ 0) (m : ℤ) (hm : eval t (f.map (Int.castRingHom ℚ)) / t = m) :
    ∃ a : ℤ, t = a ∧ a ≠ 0 ∧ a ∣ f.coeff 0 := by
  have hdegf : (1 : WithBot ℕ) < f.degree := by
    rw [Polynomial.degree_eq_natDegree hf.ne_zero]
    exact_mod_cast hdeg
  have hlt : (C m * X : Polynomial ℤ).degree < f.degree :=
    lt_of_le_of_lt (Polynomial.degree_C_mul_X_le m) hdegf
  have hgm : (f - C m * X).Monic := hf.sub_of_left hlt
  have hft : eval t (f.map (Int.castRingHom ℚ)) = m * t := by
    field_simp at hm
    linarith
  have hroot : aeval t (f - C m * X) = 0 := by
    simp only [map_sub, map_mul, aeval_C, aeval_X]
    rw [aeval_def, eval₂_eq_eval_map]
    simp only [eq_intCast, algebraMap_int_eq] at *
    linarith
  obtain ⟨a, ha⟩ := isInteger_of_is_root_of_monic hgm hroot
  have hat : t = (a : ℚ) := by simpa using ha.symm
  refine ⟨a, hat, ?_, ?_⟩
  · rintro rfl
    exact ht (by simpa using hat)
  · have hfa : ((f.eval a : ℤ) : ℚ) = (m : ℚ) * (a : ℚ) := by
      have : eval (a : ℚ) (f.map (Int.castRingHom ℚ)) = ((f.eval a : ℤ) : ℚ) := by
        simp [eval_map, eval₂_at_intCast]
      rw [← this, ← hat, hft]
    have hfa' : f.eval a = m * a := by exact_mod_cast hfa
    have h1 : a - 0 ∣ f.eval a - f.eval 0 := Polynomial.sub_dvd_eval_sub a 0 f
    rw [sub_zero, hfa', ← Polynomial.coeff_zero_eq_eval_zero] at h1
    have h2 : a ∣ m * a := Dvd.intro_left m rfl
    simpa using dvd_sub h2 h1

example : eval (1 / 2 : ℚ) ((X + 1 : Polynomial ℤ).map (Int.castRingHom ℚ)) / (1 / 2) = (3 : ℤ) := by
  norm_num

/-! ### The two-isogeny selection on `E[4]`

An argument for the imported target EC.3/four-count-full-two-selection that uses
only the image `G` of Galois in `GL₂(ℤ/4)`, in a basis `e₁, e₂` of `E[4]` with
`P = 2 • e₁` the rational point of order two. The hypotheses are: every element
has `det (1 - g) = 0` (point counts divisible by 4, by Chebotarev's theorem);
every element fixes `P`; and some element is nontrivial modulo 2. The
conclusion is that every element maps `e₁` into `⟨e₁⟩`, so that Galois acts
trivially on the two-torsion `{Q : 2 • Q ∈ ⟨P⟩} / ⟨P⟩` of `E / ⟨P⟩`. -/

section GLTwoModFour

private theorem eq_two_of_two_mul_eq_zero (c : ZMod 4) (h : 2 * c = 0) (hc : c ≠ 0) : c = 2 := by
  revert c; decide

private theorem det_one_sub_ne_zero (a b c d : ZMod 4) (ha : 2 * a = 2) (hc : c = 2)
    (hb : 2 * b ≠ 0) (hdet : 2 * (a * d - b * c) ≠ 0) : (1 - a) * (1 - d) - b * c ≠ 0 := by
  revert a b c d; decide

private theorem two_mul_unit_ne_zero (u : (ZMod 4)ˣ) : 2 * (u : ZMod 4) ≠ 0 := by
  revert u; decide

private theorem two_mul_ne_zero_of_det (a b d c : ZMod 4) (hc : 2 * c = 0)
    (h : 2 * (a * d - b * c) ≠ 0) : 2 * d ≠ 0 := by
  revert a b c d; decide

private theorem mul_two_eq_two (d : ZMod 4) (h : 2 * d ≠ 0) : d * 2 = 2 := by
  revert d; decide

private theorem two_mul_add_ne_zero (a b b' d : ZMod 4) (hb : 2 * b = 0) (hb' : 2 * b' ≠ 0)
    (hd : 2 * d ≠ 0) : 2 * (a * b + b' * d) ≠ 0 := by
  revert a b b' d; decide

/-- The matrix of an element of `GL₂(ℤ/4)`. -/
abbrev mat (g : GL (Fin 2) (ZMod 4)) : Matrix (Fin 2) (Fin 2) (ZMod 4) := g

private theorem two_mul_det_ne_zero (g : GL (Fin 2) (ZMod 4)) :
    2 * (mat g 0 0 * mat g 1 1 - mat g 0 1 * mat g 1 0) ≠ 0 := by
  have h := two_mul_unit_ne_zero (Matrix.GeneralLinearGroup.det g)
  rwa [Matrix.GeneralLinearGroup.val_det_apply, Matrix.det_fin_two] at h

private theorem det_one_sub (g : GL (Fin 2) (ZMod 4)) :
    (1 - mat g).det = (1 - mat g 0 0) * (1 - mat g 1 1) - mat g 0 1 * mat g 1 0 := by
  rw [Matrix.det_fin_two]
  simp [Matrix.sub_apply]

theorem lower_left_eq_zero_of_det_one_sub_eq_zero (G : Subgroup (GL (Fin 2) (ZMod 4)))
    (hdet : ∀ g ∈ G, (1 - mat g).det = 0)
    (hfix : ∀ g ∈ G, 2 * mat g 0 0 = 2 ∧ 2 * mat g 1 0 = 0)
    (t : GL (Fin 2) (ZMod 4)) (ht : t ∈ G) (htb : 2 * mat t 0 1 ≠ 0) :
    ∀ g ∈ G, mat g 1 0 = 0 := by
  -- An element with lower-left entry 2 and odd upper-right entry has `det (1 - x) = 2`.
  have key : ∀ x ∈ G, mat x 1 0 = 2 → 2 * mat x 0 1 ≠ 0 → False := by
    intro x hx hc hb
    have h1 := hdet x hx
    rw [det_one_sub] at h1
    exact det_one_sub_ne_zero _ _ _ _ (hfix x hx).1 hc hb (two_mul_det_ne_zero x) h1
  have hct : mat t 1 0 = 0 := by
    by_contra h
    exact key t ht (eq_two_of_two_mul_eq_zero _ (hfix t ht).2 h) htb
  intro g hg
  by_contra h
  have hcg : mat g 1 0 = 2 := eq_two_of_two_mul_eq_zero _ (hfix g hg).2 h
  by_cases hb : 2 * mat g 0 1 = 0
  · -- `g` is trivial modulo 2; then `t * g` is of the excluded kind.
    have hdt : 2 * mat t 1 1 ≠ 0 := two_mul_ne_zero_of_det _ _ _ _ (hfix t ht).2 (two_mul_det_ne_zero t)
    have hdg : 2 * mat g 1 1 ≠ 0 := two_mul_ne_zero_of_det _ _ _ _ (hfix g hg).2 (two_mul_det_ne_zero g)
    have hmul : mat (t * g) = mat t * mat g := rfl
    refine key (t * g) (G.mul_mem ht hg) ?_ ?_
    · rw [hmul, Matrix.mul_apply, Fin.sum_univ_two, hct, hcg, zero_mul, zero_add]
      exact mul_two_eq_two _ hdt
    · rw [hmul, Matrix.mul_apply, Fin.sum_univ_two]
      exact two_mul_add_ne_zero _ _ _ _ hb htb hdg
  · exact key g hg hcg hb

end GLTwoModFour

end EllipticCurveModularityPartIIAcceptance
