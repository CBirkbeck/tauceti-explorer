import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.RingTheory.Etale.Finite
import Mathlib.CategoryTheory.Comma.Over.Pullback
import Mathlib.GroupTheory.Frattini
import Mathlib.GroupTheory.Nilpotent
import Mathlib.GroupTheory.Solvable
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.GroupTheory.GroupAction.ConjAct
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.SplittingField.Construction
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Fin.VecNotation
import TauCeti.GroupTheory.SpecificGroups.Braid
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Polynomial.Eval.Coeff
import Mathlib.RingTheory.Polynomial.Subring
import Mathlib.Algebra.Field.ZMod

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The signatures suggest Lean forms so contributors and reviewers converge on names and
interfaces. All proposed results remain unchecked; this file supplies no implementation.
The rational-specialization component concerns one parameter T and one polynomial variable Y.
The following native scheme, group and field signatures implement only their stated interfaces.
The final omission manifest names every unavailable declaration and its carrier/proof obligation.
No missing condition is replaced by an opaque type or an uninterpreted proposition.
-/

noncomputable section
open Polynomial
open scoped BigOperators

namespace TauCeti.RationalSpecialization

variable {K : Type*} [Field K]

/-- Rational functions whose reduced denominator does not vanish at t. -/
def regularSubring (K : Type*) [Field K] (t : K) : Subring (RatFunc K) where
  carrier := {f | f.denom.eval t ≠ 0}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry

lemma mem_regularSubring (t : K) (f : RatFunc K) :
    f ∈ regularSubring K t ↔ f.denom.eval t ≠ 0 := by sorry

lemma algebraMap_mem_regularSubring (t : K) (p : Polynomial K) :
    algebraMap (Polynomial K) (RatFunc K) p ∈ regularSubring K t := by sorry

lemma regularSubring_le_iff (t : K) (S : Subring (RatFunc K)) :
    S ≤ regularSubring K t ↔ ∀ f ∈ S, f.denom.eval t ≠ 0 := by sorry

-- regularSubring.zero_test
example : (0 : RatFunc ℚ) ∈ regularSubring ℚ 0 := by sorry
-- regularSubring.cancellation_test
example : ((RatFunc.X ^ 2 - 1) / (RatFunc.X - 1) : RatFunc ℚ) ∈
    regularSubring ℚ 1 := by sorry
-- regularSubring.pole_test
example : (RatFunc.X⁻¹ : RatFunc ℚ) ∉ regularSubring ℚ 0 := by sorry

/-- Restrict native rational-function evaluation to its regular subring. -/
def evalRegular (t : K) : regularSubring K t →+* K where
  toFun f := RatFunc.eval (RingHom.id K) t f.val
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry

lemma evalRegular_apply (t : K) (f : regularSubring K t) :
    evalRegular t f = RatFunc.eval (RingHom.id K) t f.val := by sorry

lemma evalRegular_polynomial (t : K) (p : Polynomial K) :
    evalRegular t ⟨algebraMap (Polynomial K) (RatFunc K) p,
      algebraMap_mem_regularSubring t p⟩ = p.eval t := by sorry

lemma evalRegular_surjective (t : K) : Function.Surjective (evalRegular t) := by sorry

-- evalRegular.one_test
example : evalRegular (0 : ℚ) 1 = 1 := by sorry
-- evalRegular.parameter_test
example : evalRegular (3 : ℚ)
    ⟨algebraMap (Polynomial ℚ) (RatFunc ℚ) Polynomial.X,
      algebraMap_mem_regularSubring 3 Polynomial.X⟩ = 3 := by sorry
-- evalRegular.kernel_test
example : evalRegular (2 : ℚ)
    ⟨algebraMap (Polynomial ℚ) (RatFunc ℚ) (Polynomial.X - Polynomial.C 2),
      algebraMap_mem_regularSubring 2 (Polynomial.X - Polynomial.C 2)⟩ = 0 := by sorry

/-- Coefficientwise native evaluation, total as a function, with conditional ring laws. -/
def specialize (t : K) (p : Polynomial (RatFunc K)) : Polynomial K :=
  p.sum (fun n c => Polynomial.monomial n (RatFunc.eval (RingHom.id K) t c))

lemma coeff_specialize (t : K) (p : Polynomial (RatFunc K)) (n : ℕ) :
    (specialize t p).coeff n = RatFunc.eval (RingHom.id K) t (p.coeff n) := by sorry

lemma specialize_C (t : K) (f : RatFunc K) :
    specialize t (Polynomial.C f) = Polynomial.C (RatFunc.eval (RingHom.id K) t f) := by sorry

lemma specialize_X (t : K) :
    specialize t (Polynomial.X : Polynomial (RatFunc K)) = Polynomial.X := by sorry

lemma specialize_zero (t : K) : specialize t (0 : Polynomial (RatFunc K)) = 0 := by sorry

lemma specialize_polynomialCoefficients (t : K) (p : Polynomial (Polynomial K)) :
    specialize t (p.map (algebraMap (Polynomial K) (RatFunc K))) =
      p.map (Polynomial.evalRingHom t) := by sorry

-- specialize.zero_test
example : specialize (0 : ℚ) (0 : Polynomial (RatFunc ℚ)) = 0 := by sorry
-- specialize.quadratic_test
example : specialize (2 : ℚ) (Polynomial.X ^ 2 - Polynomial.C RatFunc.X) =
    Polynomial.X ^ 2 - Polynomial.C 2 := by sorry
-- specialize.pole_multiplication_test
example : specialize (0 : ℚ)
    (Polynomial.C (RatFunc.X : RatFunc ℚ) * Polynomial.C RatFunc.X⁻¹) ≠
    specialize 0 (Polynomial.C RatFunc.X) * specialize 0 (Polynomial.C RatFunc.X⁻¹) := by sorry
-- specialize.degree_drop_test
example : (specialize (0 : ℚ)
    (Polynomial.C RatFunc.X * Polynomial.X + 1)).natDegree = 0 := by sorry

lemma specialize_map_regular (t : K) (p : Polynomial (regularSubring K t)) :
    specialize t (p.map (regularSubring K t).subtype) = p.map (evalRegular t) := by sorry

lemma specialize_add (t : K) (p q : Polynomial (RatFunc K))
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0)
    (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p + q) = specialize t p + specialize t q := by sorry

lemma specialize_mul (t : K) (p q : Polynomial (RatFunc K))
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0)
    (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p * q) = specialize t p * specialize t q := by sorry

/-- Product, with repetitions, of the reduced denominators of nonzero coefficients. -/
def denominatorProduct (p : Polynomial (RatFunc K)) : Polynomial K :=
  ∏ n ∈ p.support, (p.coeff n).denom

lemma denominatorProduct_zero : denominatorProduct (0 : Polynomial (RatFunc K)) = 1 := by sorry

lemma denominatorProduct_C (f : RatFunc K) :
    denominatorProduct (Polynomial.C f) = f.denom := by sorry

lemma denominatorProduct_polynomialCoefficients (p : Polynomial (Polynomial K)) :
    denominatorProduct (p.map (algebraMap (Polynomial K) (RatFunc K))) = 1 := by sorry

-- denominatorProduct.zero_test
example : denominatorProduct (0 : Polynomial (RatFunc ℚ)) = 1 := by sorry
-- denominatorProduct.repeated_pole_test
example : denominatorProduct (Polynomial.C (RatFunc.X⁻¹ : RatFunc ℚ) * Polynomial.X +
    Polynomial.C RatFunc.X⁻¹) = Polynomial.X ^ 2 := by sorry
-- denominatorProduct.cancellation_test
example : denominatorProduct (Polynomial.C
    (((RatFunc.X ^ 2 - 1) / (RatFunc.X - 1)) : RatFunc ℚ)) = 1 := by sorry

lemma denominatorProduct_ne_zero (p : Polynomial (RatFunc K)) :
    denominatorProduct p ≠ 0 := by sorry

lemma denominatorProduct_eval_ne_zero_iff (t : K) (p : Polynomial (RatFunc K)) :
    (denominatorProduct p).eval t ≠ 0 ↔ ∀ n, (p.coeff n).denom.eval t ≠ 0 := by sorry

lemma natDegree_specialize (t : K) (p : Polynomial (RatFunc K))
    (h : RatFunc.eval (RingHom.id K) t p.leadingCoeff ≠ 0) :
    (specialize t p).natDegree = p.natDegree := by sorry

/-- A nonzero guard polynomial excludes all poles and prevents degree loss. -/
theorem specialization_guard (t : K) (p : Polynomial (RatFunc K))
    (h : (denominatorProduct p * p.leadingCoeff.num).eval t ≠ 0) :
    (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree := by sorry

theorem finite_bad_specializations (p : Polynomial (RatFunc K)) (hp : p ≠ 0) :
    Set.Finite {t : K | ¬ ((∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree)} := by sorry

/-- Avoid any fixed finite set while retaining all degrees in a finite family. -/
theorem exists_simultaneous_specialization [Infinite K]
    (s : Finset (Polynomial (RatFunc K))) (hs : ∀ p ∈ s, p ≠ 0) (a : Finset K) :
    ∃ t : K, t ∉ a ∧ ∀ p ∈ s,
      (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
        (specialize t p).natDegree = p.natDegree := by sorry

-- Acceptance: the infinite-field assumption is essential for existence, even without poles.
example : ∀ t : ZMod 2,
    (specialize t (Polynomial.C (RatFunc.X ^ 2 - RatFunc.X) * Polynomial.X + 1)).natDegree = 0 := by sorry

end TauCeti.RationalSpecialization

namespace TauCeti.InverseGalois

open CategoryTheory
open AlgebraicGeometry

universe u

/-- The new finite subcategory uses the native scheme morphism predicates. -/
def finiteEtaleProperty (X : Scheme.{u}) : ObjectProperty (Over X) :=
  fun Y => IsFinite Y.hom ∧ Etale Y.hom

abbrev FiniteEtaleCover (X : Scheme.{u}) := (finiteEtaleProperty X).FullSubcategory

namespace FiniteEtaleCover

/-- IG.0/finite-etale-covers: the structural map is retained. -/
def of {X Y : Scheme.{u}} (f : Y ⟶ X) [IsFinite f] [Etale f] : FiniteEtaleCover X where
  obj := Over.mk f
  property := by
    change IsFinite f ∧ Etale f
    exact ⟨inferInstance, inferInstance⟩

lemma hom_ext {X : Scheme.{u}} {Y Z : FiniteEtaleCover X} {f g : Y ⟶ Z}
    (h : f.hom.left = g.hom.left) : f = g := by sorry

def pullback {X Y : Scheme.{u}} (f : X ⟶ Y) :
    FiniteEtaleCover Y ⥤ FiniteEtaleCover X := by sorry

def affineEquivalence (R : Type u) [CommRing R] :
    FiniteEtaleCover (Spec (CommRingCat.of R)) ≌
      (CommAlgCat.FiniteEtale.{u} R)ᵒᵖ := by sorry

instance hasFiniteCoproducts (X : Scheme.{u}) :
    Limits.HasFiniteCoproducts (FiniteEtaleCover X) := by sorry

def splitCover (X : Scheme.{u}) (n : ℕ) : FiniteEtaleCover X :=
  Limits.sigmaObj (fun _ : Fin n => of (𝟙 X))

-- FiniteEtaleCover.empty_test
example (X : Scheme.{u}) : ∃ e : FiniteEtaleCover X,
    Nonempty (Limits.IsInitial e) ∧ e.obj.left = Scheme.empty := by sorry
-- FiniteEtaleCover.split_test
example {X Y : Scheme.{u}} (f : X ⟶ Y) (n : ℕ) :
    (pullback f).obj (splitCover Y n) ≅ splitCover X n := by sorry
-- FiniteEtaleCover.ramification_test: the square map is not etale at zero.
example : ¬ Etale (Spec.map (CommRingCat.ofHom
    (Polynomial.aeval (R := ℚ) (Polynomial.X ^ 2 : Polynomial ℚ)).toRingHom)) := by sorry

end FiniteEtaleCover

variable {G : Type*} [Group G]

abbrev BranchTuple (r : ℕ) (G : Type*) := Fin r → G

namespace BranchTuple

def product {r : ℕ} (t : BranchTuple r G) : G := (List.ofFn t).prod

def generated {r : ℕ} (t : BranchTuple r G) : Subgroup G :=
  Subgroup.closure (Set.range t)

-- BranchTuple.empty_test
example : product (fun i : Fin 0 => Fin.elim0 i : BranchTuple 0 G) = 1 ∧
    generated (fun i : Fin 0 => Fin.elim0 i : BranchTuple 0 G) = ⊥ := by sorry
-- BranchTuple.nongenerating_test
example : product (![Equiv.swap (0 : Fin 3) 1, Equiv.swap (0 : Fin 3) 1]) = 1 ∧
    generated (![Equiv.swap (0 : Fin 3) 1, Equiv.swap (0 : Fin 3) 1]) ≠ ⊤ := by sorry
-- BranchTuple.s3_test, with multiplication as right-to-left composition.
example : product (![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2,
      (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)⁻¹]) = 1 ∧
    generated (![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2,
      (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)⁻¹]) = ⊤ := by sorry

end BranchTuple

namespace NielsenClass

def innerRelation (r : ℕ) (G : Type*) [Group G] : Setoid (BranchTuple r G) where
  r t t' := ∃ g : G, ∀ i, t' i = g * t i * g⁻¹
  iseqv := by sorry

/-- The inner quotient concerns simultaneous conjugation, not Aut(G). -/
def inner (r : ℕ) (G : Type*) [Group G] : Type _ := Quotient (innerRelation r G)

def absoluteRelation {r d : ℕ} (ρ : G →* Equiv.Perm (Fin d)) :
    Setoid (BranchTuple r G) where
  r t t' := ∃ s : Equiv.Perm (Fin d), s ∈ Subgroup.normalizer (ρ.range : Set (Equiv.Perm (Fin d))) ∧
    ∀ i, ρ (t' i) = s * ρ (t i) * s⁻¹
  iseqv := by sorry

/-- Apply this to the specified faithful permutation representation. -/
def absolute {r d : ℕ} (ρ : G →* Equiv.Perm (Fin d)) : Type _ :=
  Quotient (absoluteRelation (r := r) ρ)

lemma inner_preserves {r : ℕ} (t t' : BranchTuple r G)
    (h : (innerRelation r G).r t t') :
    (BranchTuple.product t = 1 ↔ BranchTuple.product t' = 1) ∧
      (BranchTuple.generated t = ⊤ ↔ BranchTuple.generated t' = ⊤) := by sorry

lemma absolute_preserves {r d : ℕ} (ρ : G →* Equiv.Perm (Fin d))
    (hρ : Function.Injective ρ) (t t' : BranchTuple r G)
    (h : (absoluteRelation ρ).r t t') :
    (BranchTuple.product t = 1 ↔ BranchTuple.product t' = 1) ∧
      (BranchTuple.generated t = ⊤ ↔ BranchTuple.generated t' = ⊤) := by sorry

end NielsenClass

namespace HurwitzMove

def leftIndex {r : ℕ} (i : Fin (r - 1)) : Fin r := ⟨i.val, by sorry⟩
def rightIndex {r : ℕ} (i : Fin (r - 1)) : Fin r := ⟨i.val + 1, by sorry⟩

def apply {r : ℕ} (i : Fin (r - 1)) (t : BranchTuple r G) : BranchTuple r G :=
  Function.update (Function.update t (leftIndex i)
    (t (leftIndex i) * t (rightIndex i) * (t (leftIndex i))⁻¹))
    (rightIndex i) (t (leftIndex i))

def inverse {r : ℕ} (i : Fin (r - 1)) (t : BranchTuple r G) : BranchTuple r G :=
  Function.update (Function.update t (leftIndex i) (t (rightIndex i)))
    (rightIndex i) ((t (rightIndex i))⁻¹ * t (leftIndex i) * t (rightIndex i))

def equiv {r : ℕ} (i : Fin (r - 1)) : Equiv.Perm (BranchTuple r G) where
  toFun := apply i
  invFun := inverse i
  left_inv := by sorry
  right_inv := by sorry

end HurwitzMove

namespace HurwitzAction

/-- Construct through TauCeti.BraidGroup.lift and its existing Artin relations. -/
def action (r : ℕ) (G : Type*) [Group G] :
    TauCeti.BraidGroup r →* Equiv.Perm (BranchTuple r G) := by sorry

lemma generator {r : ℕ} (i : Fin (r - 1)) :
    action r G (TauCeti.BraidGroup.sigma i) = HurwitzMove.equiv i := by sorry

lemma product {r : ℕ} (b : TauCeti.BraidGroup r) (t : BranchTuple r G) :
    BranchTuple.product (action r G b t) = BranchTuple.product t := by sorry

lemma generated {r : ℕ} (b : TauCeti.BraidGroup r) (t : BranchTuple r G) :
    BranchTuple.generated (action r G b t) = BranchTuple.generated t := by sorry

-- HurwitzAction.noncommuting_test
example : HurwitzMove.apply (r := 2) 0
    (![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2]) =
      (![Equiv.swap (0 : Fin 3) 2, Equiv.swap (0 : Fin 3) 1]) := by sorry
-- HurwitzAction.inverse_test
example {r : ℕ} (i : Fin (r - 1)) (t : BranchTuple r G) :
    HurwitzMove.inverse i (HurwitzMove.apply i t) = t := by sorry
-- HurwitzAction.colored_test
example : ¬ IsConj
    (HurwitzMove.apply (r := 2) 0 (![Equiv.swap (0 : Fin 3) 1,
      Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2]) 0)
    (Equiv.swap (0 : Fin 3) 1) := by sorry

end HurwitzAction

/-- Surjections retain the native free-group homomorphism. -/
abbrev SurjectiveFreeHom (r : ℕ) (G : Type*) [Group G] :=
  {φ : FreeGroup (Fin r) →* G // Function.Surjective φ}

namespace ExteriorEpi

def relation (r : ℕ) (G : Type*) [Group G] : Setoid (SurjectiveFreeHom r G) where
  r φ ψ := ∃ g : G, ∀ x, ψ.val x = g * φ.val x * g⁻¹
  iseqv := by sorry

def ofTuple (r : ℕ) (G : Type*) [Group G] :
    {t : BranchTuple r G // BranchTuple.generated t = ⊤} ≃ SurjectiveFreeHom r G := by sorry

end ExteriorEpi

abbrev ExteriorEpi (r : ℕ) (G : Type*) [Group G] := Quotient (ExteriorEpi.relation r G)

/-- The explicit quotient of automorphisms by the range of conjugation. -/
def freeInnerAut (r : ℕ) : Subgroup (MulAut (FreeGroup (Fin r))) :=
  (MulAut.conj : FreeGroup (Fin r) →* MulAut (FreeGroup (Fin r))).range

instance freeInnerAut_normal (r : ℕ) : (freeInnerAut r).Normal := by sorry

abbrev FreeOuterAut (r : ℕ) := (MulAut (FreeGroup (Fin r))) ⧸ freeInnerAut r

namespace ExteriorEpi

def outAction (r : ℕ) (G : Type*) [Group G] :
    FreeOuterAut r →* Equiv.Perm (ExteriorEpi r G) := by sorry

end ExteriorEpi

namespace TSystem

def relation (r : ℕ) (G : Type*) [Group G] : Setoid (SurjectiveFreeHom r G) where
  r φ ψ := ∃ α : MulAut G, ∀ x, ψ.val x = α (φ.val x)
  iseqv := by sorry

end TSystem

abbrev TSystem (r : ℕ) (G : Type*) [Group G] := Quotient (TSystem.relation r G)

namespace TSystem

def quotient (r : ℕ) (G : Type*) [Group G] : ExteriorEpi r G → TSystem r G := by sorry

end TSystem

namespace GeneratorNumber

lemma finite_generators (G : Type*) [Group G] [Finite G] :
    ∃ r, Nonempty (SurjectiveFreeHom r G) := by sorry

def value (G : Type*) [Group G] [Finite G] : ℕ := by
  classical
  exact Nat.find (finite_generators G)

lemma «exists» (G : Type*) [Group G] [Finite G] (r : ℕ) :
    value G ≤ r ↔ Nonempty (SurjectiveFreeHom r G) := by sorry

end GeneratorNumber

-- ExteriorEpi.cyclic_test
example (n : ℕ) [NeZero n] (a : Multiplicative (ZMod n)) :
    BranchTuple.generated (![a]) = ⊤ ↔ orderOf a = n := by sorry
-- ExteriorEpi.noncyclic_test
example : GeneratorNumber.value (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)) = 2 ∧
    IsEmpty (ExteriorEpi 1 (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) := by sorry
-- ExteriorEpi.inner_test: precomposition by inner conjugation changes only the target conjugacy.
example {r : ℕ} (φ : SurjectiveFreeHom r G) (x : FreeGroup (Fin r)) :
    (ExteriorEpi.relation r G).r φ
      ⟨φ.val.comp (MulAut.conj x).toMonoidHom, by sorry⟩ := by sorry
-- ExteriorEpi.sphere_test: surjectivity does not impose a sphere relation.
example : Nonempty (SurjectiveFreeHom 1 (Multiplicative (ZMod 2))) ∧
    ¬ ∃ t : BranchTuple 1 (Multiplicative (ZMod 2)),
      BranchTuple.product t = 1 ∧ BranchTuple.generated t = ⊤ := by sorry

/-- Genuine field-theoretic conditions, rather than an uninterpreted certificate predicate. -/
structure FieldRealization (K L G : Type*) [Field K] [Field L] [Algebra K L]
    [Group G] where
  finiteDimensional : FiniteDimensional K L
  isGalois : IsGalois K L
  groupEquiv : Gal(L/K) ≃* G

structure PolynomialRealization {K : Type*} [Field K] (f : Polynomial K)
    (G : Type*) [Group G] where
  separable : f.Separable
  groupEquiv : Gal(f.SplittingField/K) ≃* G

namespace FieldRealization

lemma degree {K L G : Type*} [Field K] [Field L] [Algebra K L] [Group G]
    (c : FieldRealization K L G) : Module.finrank K L = Nat.card G := by sorry

def transport {K L L' G : Type*} [Field K] [Field L] [Field L']
    [Algebra K L] [Algebra K L'] [Group G]
    (c : FieldRealization K L G) (e : L ≃ₐ[K] L') : FieldRealization K L' G := by sorry

end FieldRealization

namespace PolynomialRealization

def toField {K G : Type*} [Field K] [Group G] {f : Polynomial K}
    (c : PolynomialRealization f G) : FieldRealization K f.SplittingField G := by sorry

end PolynomialRealization

namespace Realization

-- Realization.trivial_test
example (K : Type*) [Field K] : Nonempty (FieldRealization K K PUnit) := by sorry
-- Realization.reducible_test
example : Nonempty (PolynomialRealization
    ((Polynomial.X ^ 2 - Polynomial.C 2) * (Polynomial.X ^ 2 - Polynomial.C 3) : Polynomial ℚ)
    (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) := by sorry

def cubeRootField : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ {Complex.ofReal ((2 : ℝ) ^ (1 / 3 : ℝ))}
-- Realization.degree_test
example : Module.finrank ℚ cubeRootField = 3 ∧ ¬ IsGalois ℚ cubeRootField := by sorry

end Realization

namespace DihedralEight

def alpha : ℂ := (Real.sqrt (Real.sqrt 2) : ℝ)
def field : IntermediateField ℚ ℂ := IntermediateField.adjoin ℚ {alpha, Complex.I}

def alphaInField : field := ⟨alpha, by sorry⟩
def iInField : field := ⟨Complex.I, by sorry⟩

lemma alpha_four : alpha ^ 4 = 2 := by sorry

def rotation : Gal(field/ℚ) := by sorry
def reflection : Gal(field/ℚ) := by sorry

lemma rotation_alpha : rotation alphaInField = iInField * alphaInField := by sorry
lemma rotation_i : rotation iInField = iInField := by sorry
lemma reflection_alpha : reflection alphaInField = alphaInField := by sorry
lemma reflection_i : reflection iInField = -iInField := by sorry

def realization : PolynomialRealization
    (Polynomial.X ^ 4 - Polynomial.C 2 : Polynomial ℚ) (DihedralGroup 4) := by sorry

-- DihedralEight.degree_test
example : Module.finrank ℚ field = 8 := by sorry
-- DihedralEight.rotation_test
example : rotation ^ 4 = 1 ∧ rotation ^ 2 ≠ 1 := by sorry
-- DihedralEight.nonabelian_test
example : reflection * rotation ≠ rotation * reflection := by sorry

end DihedralEight

/-- The affine-coordinate lift retains both units and the square relation. -/
structure LiftedAffineGroup (n : ℕ) (R : Type*) [CommRing R] where
  a : Rˣ
  b : R
  d : Rˣ
  square_eq : d ^ 2 = a ^ n

namespace LiftedAffineGroup

def mul {n : ℕ} {R : Type*} [CommRing R] (g h : LiftedAffineGroup n R) :
    LiftedAffineGroup n R where
  a := g.a * h.a
  b := (g.a : R) * h.b + g.b
  d := g.d * h.d
  square_eq := by sorry

def oddParameter {n : ℕ} (hn : Odd n) (R : Type*) [CommRing R] :
    LiftedAffineGroup n R ≃ Rˣ × R := by sorry

lemma oddParameter_form {n : ℕ} (hn : Odd n) {R : Type*} [CommRing R]
    (g : LiftedAffineGroup n R) :
    ((oddParameter hn R g).1 ^ 2 = g.a) ∧
    ((oddParameter hn R g).1 ^ n = g.d) := by sorry

-- LiftedAffineGroup.identity_test
example {n : ℕ} {R : Type*} [CommRing R] (g : LiftedAffineGroup n R) :
    mul ⟨1, 0, 1, by sorry⟩ g = g := by sorry
-- LiftedAffineGroup.involution_test: the square-root lift acts on the y coordinate.
example (hn : Odd (3 : ℕ)) :
    let g : LiftedAffineGroup 3 ℚ := ⟨1, 0, -1, by sorry⟩
    (g.d : ℚ) * 1 = -1 ∧ g.d ≠ 1 := by sorry
-- LiftedAffineGroup.even_test: the even-degree fiber has both signs.
example : ∃ g h : LiftedAffineGroup 2 ℚ,
    g.a = h.a ∧ g.b = h.b ∧ g.d ≠ h.d := by sorry

end LiftedAffineGroup

/-- The one-parameter consequence of the number-field Hilbertianity target. -/
theorem numberFieldHilbert {K : Type*} [Field K] [NumberField K]
    (p : Polynomial (RatFunc K)) (hp : Irreducible p) (hsep : p.Separable)
    (a : Finset K) : ∃ t : K, t ∉ a ∧
      (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (TauCeti.RationalSpecialization.specialize t p).natDegree = p.natDegree ∧
      Irreducible (TauCeti.RationalSpecialization.specialize t p) := by sorry


/-- The largest nilpotent normal subgroup, with finite-group structure in its API. -/
def FittingSubgroup (G : Type*) [Group G] : Subgroup G :=
  sSup {N : Subgroup G | N.Normal ∧ Group.IsNilpotent N}

namespace FittingSubgroup

lemma normal (G : Type*) [Group G] :
    (FittingSubgroup G).Normal ∧ (FittingSubgroup G).Characteristic := by sorry

lemma nilpotent (G : Type*) [Group G] [Finite G] :
    Group.IsNilpotent (FittingSubgroup G) := by sorry

lemma le {G : Type*} [Group G] (N : Subgroup G) [N.Normal] [Group.IsNilpotent N] :
    N ≤ FittingSubgroup G := by sorry

lemma frattini_lt (G : Type*) [Group G] [Finite G] [Nontrivial G]
    [Group.IsSolvable G] : frattini G < FittingSubgroup G := by sorry

lemma supplement (G : Type*) [Group G] [Finite G] [Nontrivial G]
    [Group.IsSolvable G] : ∃ U : Subgroup G, U < ⊤ ∧ FittingSubgroup G ⊔ U = ⊤ := by sorry

-- FittingSubgroup.abelian_test
example (G : Type*) [CommGroup G] [Finite G] : FittingSubgroup G = ⊤ := by sorry
-- FittingSubgroup.s3_test
example : Nat.card (FittingSubgroup (Equiv.Perm (Fin 3))) = 3 ∧
    Subgroup.closure {Equiv.swap (0 : Fin 3) 1} < ⊤ ∧
    FittingSubgroup (Equiv.Perm (Fin 3)) ⊔
      Subgroup.closure {Equiv.swap (0 : Fin 3) 1} = ⊤ := by sorry
-- FittingSubgroup.s5_test
example : FittingSubgroup (Equiv.Perm (Fin 5)) = ⊥ ∧
    frattini (Equiv.Perm (Fin 5)) = ⊥ := by sorry

end FittingSubgroup

/-- Polynomial form of the finite solvable realization theorem over every number field. -/
theorem shafarevich (K G : Type*) [Field K] [NumberField K]
    [Group G] [Finite G] [Group.IsSolvable G] :
    ∃ p : Polynomial K, Nonempty (PolynomialRealization p G) := by sorry

end TauCeti.InverseGalois

/-!
## Declaration and omission manifest

This inventory is part of the signature proposal, not a list of implemented theorems.
Every mathematical target, API and test is named below. A whole declaration omission
means the exact statement remains in the packet and reader; it is not weakened to an
opaque carrier or an assumed proposition. Supplier names refer to roadmap plans, not
implemented modules at this pin. All tests proved by sorry check only their type.

Independent review boundary corrections (REV-InverseGaloisAndArithmeticFundamentalGroups):
The Galois-algebra tensor criterion requires a nonzero algebra; the zero-algebra test
is omitted with the other geometric carrier tests. Decomposition uses the underlying
point, whereas a geometric lift has inertia stabilizer. General descent uses continuous
lifts of G/Z(G) comparison cosets with the specified trivial central action. Property E
quantifies over pro-Δ′ quotients and needs finite-quotient compatibility/compactness.
The marked unramified-infinity analytic comparison uses product-one tuples. EVW7.7
allows every finite étale cover under its proper smooth normal-crossings hypotheses;
no extra prime-to-residue-characteristic condition on the cover degree is imposed.
The empty patch ring is the local ring at the closed-fiber generic point.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The geometric-fiber clause of empty_test, restriction-to-Gm clause of ramification_test and explicit pullback coherence isomorphisms still require the geometric bridge.
Typed target/carrier: TauCeti.InverseGalois.finiteEtaleProperty, TauCeti.InverseGalois.FiniteEtaleCover.
Typed API: FiniteEtaleCover.of, FiniteEtaleCover.hom_ext, FiniteEtaleCover.pullback, FiniteEtaleCover.affineEquivalence.
Typed examples: FiniteEtaleCover.empty_test, FiniteEtaleCover.split_test, FiniteEtaleCover.ramification_test.
Exact gap obligations: Scheme Galois-category bridge.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/geometric-fiber
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: GeometricFiber.obj, GeometricFiber.map_apply, GeometricFiber.pullbackIso, GeometricFiber.reflectsIso.
Whole test omissions: GeometricFiber.identity_test, GeometricFiber.split_test, GeometricFiber.disconnected_test.
Exact gap obligations: Scheme Galois-category bridge.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: EtaleFundamentalGroup.action, EtaleFundamentalGroup.coverEquivalence, EtaleFundamentalGroup.map, EtaleFundamentalGroup.openSubgroupCover.
Whole test omissions: EtaleFundamentalGroup.sepClosed_test, EtaleFundamentalGroup.transitivity_test, EtaleFundamentalGroup.component_test.
Exact gap obligations: Scheme Galois-category bridge.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/basepoint-and-components
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: EtalePath.id, EtalePath.comp, EtalePath.transport, EtalePath.torsor.
Whole test omissions: EtalePath.field_test, EtalePath.disconnected_test, EtalePath.choice_test.
Exact gap obligations: Scheme Galois-category bridge.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/field-and-torus-comparisons
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Scheme Galois-category bridge.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions, tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem, tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-galois-algebras
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: GaloisAlgebra.split, GaloisAlgebra.torsorMap, GaloisAlgebra.invariants, GaloisAlgebra.homClass.
Whole test omissions: GaloisAlgebra.split_test, GaloisAlgebra.quadratic_test, GaloisAlgebra.weak_test, GaloisAlgebra.zero_test.
Exact gap obligations: Scheme Galois-category bridge.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-idempotents
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Scheme Galois-category bridge.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/integral-monodromy
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Scheme Galois-category bridge.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-local-systems
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: AdicLocalSystem.reduction, AdicLocalSystem.pullback, IsogenyLocalSystem.hom, RationalLocalSystem.stackification.
Whole test omissions: AdicLocalSystem.constant_test, AdicLocalSystem.reduction_test, AdicLocalSystem.nodal_test.
Exact gap obligations: Scheme Galois-category bridge.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-representations
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: AdicLocalSystem.representationEquivalence, LatticeScheme.baseChange, LatticeScheme.incidence, LatticeScheme.join.
Whole test omissions: LatticeScheme.rankOne_test, LatticeScheme.zeroBound_test, LatticeScheme.nodal_test.
Exact gap obligations: Scheme Galois-category bridge.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/noohi-groups
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: NoohiGroup.toAut, InfiniteGaloisCategory.componentAction, InfiniteGaloisCategory.actionEquivalence, NoohiGroup.openSubgroup.
Whole test omissions: NoohiGroup.profinite_test, NoohiGroup.discrete_test, NoohiGroup.tameness_test.
Exact gap obligations: Noohi and pro-étale carrier signatures.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.0/proetale-fundamental-group
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ProetaleFundamentalGroup.actionEquivalence, ProetaleFundamentalGroup.toEtale, ProetaleFundamentalGroup.torsorEquivalence, ProetaleFundamentalGroup.map.
Whole test omissions: ProetaleFundamentalGroup.normal_test, ProetaleFundamentalGroup.node_test, ProetaleFundamentalGroup.conjugacy_test.
Exact gap obligations: Noohi and pro-étale carrier signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.2, EnhancedDerivedSheaves:E2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-exact-sequence
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Geometric specialization carrier.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/decomposition-inertia
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: SchemeInertia.decomposition, SchemeInertia.inertia, SchemeInertia.conjugate, SchemeInertia.intermediateOrbits.
Whole test omissions: SchemeInertia.power_test, SchemeInertia.unramified_test, SchemeInertia.wild_test.
Exact gap obligations: Geometric specialization carrier.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.0, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-and-prime-to-p
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: TameFundamentalGroup.quotient, TameFundamentalGroup.coverEquivalence, PrimeToFundamentalGroup.lift, TameFundamentalGroup.peripheral.
Whole test omissions: TameFundamentalGroup.power_test, TameFundamentalGroup.artinSchreier_test, TameFundamentalGroup.unramifiedP_test.
Exact gap obligations: Geometric specialization carrier.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration, tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem, tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/proper-specialization
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Geometric specialization carrier; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/punctured-specialization
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Geometric specialization carrier.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.3.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/finite-field-frobenius
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Geometric specialization carrier.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group, tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem, tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/charzero-base-extension
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Geometric specialization carrier; Nonproper characteristic-zero base-extension proof.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-representation
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ArithmeticRepresentation.conjugate, ArithmeticRepresentation.baseExtension, ArithmeticRepresentation.orbit, ArithmeticRepresentation.innerIndependent.
Whole test omissions: ArithmeticRepresentation.trivial_test, ArithmeticRepresentation.finite_test, ArithmeticRepresentation.image_test.
Exact gap obligations: Geometric specialization carrier.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/stack-and-family-exactness
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Stack completion exactness source; Geometric specialization carrier; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-subring
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.regularSubring.
Typed API: TauCeti.RationalSpecialization.mem_regularSubring, TauCeti.RationalSpecialization.algebraMap_mem_regularSubring, TauCeti.RationalSpecialization.regularSubring_le_iff.
Typed examples: TauCeti.RationalSpecialization.regularSubring.zero_test, TauCeti.RationalSpecialization.regularSubring.cancellation_test, TauCeti.RationalSpecialization.regularSubring.pole_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-membership
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.mem_regularSubring.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-evaluation
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.evalRegular.
Typed API: TauCeti.RationalSpecialization.evalRegular_apply, TauCeti.RationalSpecialization.evalRegular_polynomial, TauCeti.RationalSpecialization.evalRegular_surjective.
Typed examples: TauCeti.RationalSpecialization.evalRegular.one_test, TauCeti.RationalSpecialization.evalRegular.parameter_test, TauCeti.RationalSpecialization.evalRegular.kernel_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/polynomial-specialization
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.specialize.
Typed API: TauCeti.RationalSpecialization.coeff_specialize, TauCeti.RationalSpecialization.specialize_C, TauCeti.RationalSpecialization.specialize_X, TauCeti.RationalSpecialization.specialize_zero, TauCeti.RationalSpecialization.specialize_polynomialCoefficients.
Typed examples: TauCeti.RationalSpecialization.specialize.zero_test, TauCeti.RationalSpecialization.specialize.quadratic_test, TauCeti.RationalSpecialization.specialize.pole_multiplication_test, TauCeti.RationalSpecialization.specialize.degree_drop_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-coefficients
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.coeff_specialize.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-map-regular
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.specialize_map_regular.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-add
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.specialize_add.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-mul
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.specialize_mul.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.denominatorProduct.
Typed API: TauCeti.RationalSpecialization.denominatorProduct_zero, TauCeti.RationalSpecialization.denominatorProduct_C, TauCeti.RationalSpecialization.denominatorProduct_polynomialCoefficients.
Typed examples: TauCeti.RationalSpecialization.denominatorProduct.zero_test, TauCeti.RationalSpecialization.denominatorProduct.repeated_pole_test, TauCeti.RationalSpecialization.denominatorProduct.cancellation_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product-nonzero
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.denominatorProduct_ne_zero.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product-domain
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.denominatorProduct_eval_ne_zero_iff.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-degree
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.natDegree_specialize.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-guard
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.specialization_guard.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/finite-bad-specializations
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.finite_bad_specializations.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/simultaneous-finite-avoidance
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.RationalSpecialization.exists_simultaneous_specialization.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-subsets
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Whole API omissions: HilbertSubset.mem, HilbertSubset.inter, HilbertSubset.rationalRestriction, HilbertSubset.polynomialComparison.
Whole test omissions: HilbertSubset.square_test, HilbertSubset.generic_test, HilbertSubset.residue_test.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.0.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/number-field-hilbert
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. Only the one-parameter single-polynomial consequence is typed; finite families, nonzero guards, multiple parameters and Zariski density remain whole declaration obligations.
Typed target/carrier: TauCeti.InverseGalois.numberFieldHilbert.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/thin-sets
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Whole API omissions: ThinSet.closed, ThinSet.coverImage, ThinSet.union, ThinSet.fullGroupComplement.
Whole test omissions: ThinSet.squares_test, ThinSet.affineSpace_test, ThinSet.identity_test.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.0.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-full-group
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.0.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/disjoint-specializations
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/hilbert-local-conditions
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Quantitative and local Hilbert proof sources.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/norm-pullback-hilbert
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Norm Hilbert all-point comparison.
Supplier/carrier interfaces: ReductiveGroupsPartII:RG2.0a, SchemeAndStackFoundations:SF.0, ReductiveGroupsPartII:RG2.0a/norm-torus.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/frattini-full-image
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Quantitative and local Hilbert proof sources.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/integral-thin-count
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Quantitative and local Hilbert proof sources.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/absolute-galois-normal-subgroups
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Absolute Galois original proof and ownership.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/quadratic-specialization-example
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/general-riemann-existence
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: General nonproper Riemann-existence algebraization; Supplier comparison adapters.
Supplier/carrier interfaces: ComplexComparisonPartII:C0, ComplexComparisonPartII:C3, ComplexComparisonPartII:C4, tauceti:TauCetiRoadmap/BelyiMaps#layer-0-permutation-triples, AlgebraicModuliForArithmeticGeometry:R09.7.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/bounded-cover-count
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: General nonproper Riemann-existence algebraization; Nonproper characteristic-zero base-extension proof; Supplier comparison adapters.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations, ComplexComparisonPartII:C4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/branch-tuples
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The inner and absolute raw quotients are typed; fixed-class sphere restrictions, class multiplicity and the faithful-representation subtype still need their exact signatures.
Typed target/carrier: TauCeti.InverseGalois.BranchTuple, TauCeti.InverseGalois.BranchTuple.product, TauCeti.InverseGalois.BranchTuple.generated.
Typed API: BranchTuple.product, BranchTuple.generated, NielsenClass.inner, NielsenClass.absolute.
Typed examples: BranchTuple.empty_test, BranchTuple.nongenerating_test, BranchTuple.s3_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/hurwitz-braid-action
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.InverseGalois.HurwitzAction.action.
Typed API: HurwitzMove.apply, HurwitzMove.inverse, HurwitzAction.product, HurwitzAction.generated.
Typed examples: HurwitzAction.noncommuting_test, HurwitzAction.inverse_test, HurwitzAction.colored_test.
Supplier/carrier interfaces: tauceti:TauCeti.BraidGroup.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/braid-orbit-monoid
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Whole API omissions: BraidOrbitMonoid.concat, BraidOrbitMonoid.unit, BraidOrbitMonoid.degree, BraidOrbitMonoid.productOneCentral.
Whole test omissions: BraidOrbitMonoid.empty_test, BraidOrbitMonoid.identity_test, BraidOrbitMonoid.generation_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/exterior-epimorphisms
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.InverseGalois.SurjectiveFreeHom, TauCeti.InverseGalois.ExteriorEpi, TauCeti.InverseGalois.ExteriorEpi.ofTuple, TauCeti.InverseGalois.FreeOuterAut, TauCeti.InverseGalois.TSystem, TauCeti.InverseGalois.GeneratorNumber.value.
Typed API: ExteriorEpi.ofTuple, ExteriorEpi.outAction, TSystem.quotient, GeneratorNumber.exists.
Typed examples: ExteriorEpi.cyclic_test, ExteriorEpi.noncyclic_test, ExteriorEpi.inner_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/nielsen-open-statements
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Exact open Nielsen predicates.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/branch-cycle-realization
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: BranchCover.ofTuple, BranchCover.inertia, BranchCover.innerClass, BranchCover.genus.
Whole test omissions: BranchCover.cyclic_test, BranchCover.nongenerating_test, BranchCover.identity_test.
Exact gap obligations: General cover descent signature.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.3, tauceti:TauCetiRoadmap/BelyiMaps#layer-3-finite-enumeration-and-character-theoretic-counts, tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/rational-rigidity
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: General cover descent signature.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1, tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/general-cover-moduli-descent
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: CoverDescent.moduliField, CoverDescent.obstruction, CoverDescent.changeChoices, CoverDescent.modelIff.
Whole test omissions: CoverDescent.centerless_test, CoverDescent.real_test, CoverDescent.labels_test.
Exact gap obligations: General cover descent signature.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2, tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/real-moduli-counterexample
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: General cover descent signature.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/rigid-s3-comparison
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: General cover descent signature.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/BelyiMaps#layer-3-finite-enumeration-and-character-theoretic-counts, tauceti:TauCetiRoadmap/BelyiMaps#layer-5-the-thrice-punctured-sphere-and-its-fundamental-group, tauceti:TauCetiRoadmap/BelyiMaps#layer-11-fields-of-moduli-fields-of-definition-and-galois-orbits.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/lifting-invariant
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: LiftingInvariant.tuple, LiftingInvariant.braid, LiftingInvariant.concat, LiftingInvariant.projections.
Whole test omissions: LiftingInvariant.empty_test, LiftingInvariant.braid_test, LiftingInvariant.degree_test.
Exact gap obligations: General cover descent signature.
Supplier/carrier interfaces: InductionRestrictionPartII:RS.2/universal-marked-property, InductionRestrictionPartII:RS.2/class-degree-map, InductionRestrictionPartII:RS.2/universal-kernel.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/stable-braid-classification
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Stable braid cancellation proof; General cover descent signature.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/arithmetic-lift-comparison
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: General cover descent signature.
Supplier/carrier interfaces: InductionRestrictionPartII:RS.3/cyclotomic-twist, InductionRestrictionPartII:RS.3/discrete-action.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/proper-local-embedding-problem
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ProperEmbeddingSolution.toWeak, ProperEmbeddingSolution.field, LocalPrescription.changePlace, LocalPrescription.kernelConjugacy.
Whole test omissions: ProperEmbeddingSolution.trivialWeak_test, ProperEmbeddingSolution.identity_test, LocalPrescription.quotient_test.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/abelian-kernel-obstruction
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/finite-galois-localization
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: FiniteGaloisLocalization.sha, FiniteGaloisLocalization.shaS, FiniteGaloisLocalization.dual, FiniteGaloisLocalization.naturality.
Whole test omissions: FiniteGaloisLocalization.emptyS_test, FiniteGaloisLocalization.trivial_test, FiniteGaloisLocalization.real_test.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/restricted-poitou-tate
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Original finite-module global duality proof; Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/solution-twisting
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: EmbeddingTwist.apply, EmbeddingTwist.difference, EmbeddingTwist.localize, EmbeddingTwist.localCriterion.
Whole test omissions: EmbeddingTwist.zero_test, EmbeddingTwist.action_test, EmbeddingTwist.proper_test.
Exact gap obligations: Arithmetic embedding signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/grunwald-wang-boundary
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Original finite-module global duality proof; Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/independent-cyclic-eight-lifts
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Arithmetic embedding signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/free-operator-shrinking
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation, tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/induced-proper-solutions
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/cyclic-ramification-correction
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/split-nilpotent-proper-solutions
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Original finite-module global duality proof; Arithmetic embedding signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/fitting-supplement
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The supplement subgroup is typed; the semidirect multiplication map and its surjectivity remain part of the group construction.
Typed target/carrier: TauCeti.InverseGalois.FittingSubgroup.
Typed API: FittingSubgroup.normal, FittingSubgroup.nilpotent, FittingSubgroup.le, FittingSubgroup.frattini_lt, FittingSubgroup.supplement.
Typed examples: FittingSubgroup.abelian_test, FittingSubgroup.s3_test, FittingSubgroup.s5_test.
Exact gap obligations: Finite solvable structural proof; Arithmetic embedding signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/shafarevich-solvable-realization
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.InverseGalois.shafarevich.
Exact gap obligations: Finite solvable structural proof; Arithmetic embedding signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/supersolvable-grunwald
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Homogeneous-space arithmetic proof input; Arithmetic embedding signatures.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.4, ReductiveGroupsPartII:RG2.0a.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/quaternion-all-place-prescriptions
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Homogeneous-space arithmetic proof input; Arithmetic embedding signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/collective-degree-realization
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Homogeneous-space arithmetic proof input; Arithmetic embedding signatures.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/base-no-unramified-extension
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: UnramifiedGammaGroup.complement, UnramifiedGammaGroup.baseChange, AdmissibleGammaGroup.coinvariants, AdmissibleGammaGroup.quotient.
Whole test omissions: AdmissibleGammaGroup.trivial_test, AdmissibleGammaGroup.trivialAction_test, UnramifiedGammaGroup.constants_test.
Exact gap obligations: Arithmetic embedding signatures; Profinite complement conjugacy proof.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/property-e
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: PropertyE.lift, PropertyE.weakIsProper, PropertyE.finiteReduction, PropertyE.admissibility.
Whole test omissions: PropertyE.nonsplit_test, PropertyE.split_test, PropertyE.generalKernel_test.
Exact gap obligations: Arithmetic embedding signatures; Property E finite-to-profinite criterion.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-property-e
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Original finite-module global duality proof; Central global-character criterion; Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/tame-central-lift
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Original finite-module global duality proof; Arithmetic embedding signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence, InductionRestrictionPartII:RS.1/reduced-cover, InductionRestrictionPartII:RS.1/conjugacy-bijection.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/global-arithmetic-invariant
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ArithmeticLiftingInvariant.product, ArithmeticLiftingInvariant.choiceIndependent, ArithmeticLiftingInvariant.power, ArithmeticLiftingInvariant.conjugacy.
Whole test omissions: ArithmeticLiftingInvariant.identity_test, ArithmeticLiftingInvariant.noRamification_test, ArithmeticLiftingInvariant.scope_test.
Exact gap obligations: Arithmetic embedding signatures.
Supplier/carrier interfaces: InductionRestrictionPartII:RS.2/universal-kernel, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/marked-arithmetic-extensions
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Whole API omissions: MarkedExtension.infinityType, MarkedExtension.embeddedRepresentative, MarkedExtension.quadraticCorrespondence, MarkedExtension.discriminant.
Whole test omissions: MarkedExtension.splitInfinity_test, MarkedExtension.ramifiedInfinity_test, MarkedExtension.quotient_test.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/configuration-spaces
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Whole API omissions: Configuration.ordered, Configuration.forgetOrder, Configuration.polynomial, Configuration.complexComparison.
Whole test omissions: Configuration.empty_test, Configuration.one_test, Configuration.nonunit_test.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/configuration-braid-group
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Hurwitz geometry signatures.
Supplier/carrier interfaces: tauceti:TauCeti.BraidGroup.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/topological-hurwitz-covers
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: TopologicalHurwitz.cover, TopologicalHurwitz.restrictedLoci, TopologicalHurwitz.monodromy, TopologicalHurwitz.connected.
Whole test omissions: TopologicalHurwitz.empty_test, TopologicalHurwitz.degree_test, TopologicalHurwitz.product_test.
Exact gap obligations: Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/forget-hurwitz-marking
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: HurwitzMarking.conjugate, HurwitzMarking.forget, HurwitzMarking.stabilizer, HurwitzMarking.centerless.
Whole test omissions: HurwitzMarking.central_test, HurwitzMarking.s3_test, HurwitzMarking.subgroup_test.
Exact gap obligations: Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/tame-g-cover
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: TameGCover.pullback, TameGCover.inertia, TameGCover.unramifiedMark, TameGCover.tangentialMark.
Whole test omissions: TameGCover.identity_test, TameGCover.kummer_test, TameGCover.artinSchreier_test.
Exact gap obligations: Hurwitz geometry signatures.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.3, tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem, tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/arithmetic-hurwitz-moduli
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ArithmeticHurwitz.branch, ArithmeticHurwitz.classLocus, ArithmeticHurwitz.centerlessDescent, ArithmeticHurwitz.markedRepresentability.
Whole test omissions: ArithmeticHurwitz.central_test, ArithmeticHurwitz.marked_test, ArithmeticHurwitz.infinity_test.
Exact gap obligations: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/arbitrary-monodromy-marked-moduli
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ArbitraryMarkedHurwitz.monodromy, ArbitraryMarkedHurwitz.fullLocus, ArbitraryMarkedHurwitz.exactImage, ArbitraryMarkedHurwitz.inactivePuncture.
Whole test omissions: ArbitraryMarkedHurwitz.empty_test, ArbitraryMarkedHurwitz.identity_test, ArbitraryMarkedHurwitz.properImage_test.
Exact gap obligations: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-analytic-comparison
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: ComplexComparisonPartII:C3, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-g-covers
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: AdmissibleGCover.baseChange, AdmissibleGCover.connectedLocus, AdmissibleGCover.smoothLocus, AdmissibleGCover.nodeCharacters.
Whole test omissions: AdmissibleGCover.trivial_test, AdmissibleGCover.node_test, AdmissibleGCover.unbalanced_test.
Exact gap obligations: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/admissible-stacks-and-stable-curves
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Original tame/admissible moduli construction proofs; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/ordered-configuration-compactification
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ConfigurationCompactification.frame, ConfigurationCompactification.open, ConfigurationCompactification.boundary, ConfigurationCompactification.permutation.
Whole test omissions: ConfigurationCompactification.two_test, ConfigurationCompactification.one_test, ConfigurationCompactification.unit_test.
Exact gap obligations: Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/tame-cohomological-specialization
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: EnhancedDerivedSheaves:E2, SchemeAndStackFoundations:SF.2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/fixed-degree-mod-l-comparison
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/coefficient-tower-comparison
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2, SchemeAndStackFoundations:SF.2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/restricted-hurwitz-trace-kernel
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: EnhancedDerivedSheaves:E2, SchemeAndStackFoundations:SF.2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/fixed-degree-point-estimate
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Nonproper cohomology kernel and coefficient tower; Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-points-and-extensions
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/hurwitz-component-invariants
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Hurwitz geometry signatures.
Supplier/carrier interfaces: InductionRestrictionPartII:RS.3/discrete-action.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/frobenius-component-count
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Low-class orbit and lattice proof input; Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/semidirect-component-comparison
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Low-class orbit and lattice proof input; Hurwitz geometry signatures.
Supplier/carrier interfaces: InductionRestrictionPartII:RS.5/admissible-inertia-classes, InductionRestrictionPartII:RS.5/admissible-abelianization, InductionRestrictionPartII:RS.5/reduced-kernel-primary, InductionRestrictionPartII:RS.5/compatible-correction.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/product-one-component-monoid
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ProductOneComponents.concat, ProductOneComponents.image, ProductOneComponents.lift, ProductOneComponents.galoisNested.
Whole test omissions: ProductOneComponents.unit_test, ProductOneComponents.identity_test, ProductOneComponents.nonGenerating_test.
Exact gap obligations: Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/bounded-core-galois-reduction
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/double-cover-trace-zero
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/lifted-affine-coordinate-group
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration. The point group and odd parameterization are typed; the relative scheme action and connectedness assertion still require the scheme quotient carrier.
Typed target/carrier: TauCeti.InverseGalois.LiftedAffineGroup.
Typed API: LiftedAffineGroup.mul, LiftedAffineGroup.oddParameter.
Typed examples: LiftedAffineGroup.identity_test, LiftedAffineGroup.involution_test, LiftedAffineGroup.even_test.
Whole API omissions: LiftedAffineGroup.action, LiftedAffineGroup.connected.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.0.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/labelled-hyperelliptic-family
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: LabelledHyperellipticFamily.cover, LabelledHyperellipticFamily.normalForm, LabelledHyperellipticFamily.isomSheaf, LabelledHyperellipticFamily.quotient.
Whole test omissions: LabelledHyperellipticFamily.genusOne_test, LabelledHyperellipticFamily.deck_test, LabelledHyperellipticFamily.repeatedRoot_test.
Exact gap obligations: Hurwitz geometry signatures; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/finite-cover-image-lemmas
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Hurwitz geometry signatures.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/formal-curve-patching
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Wild patching and Abhyankar proof sources; Hurwitz geometry signatures.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/abhyankar-affine-curve-realization
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Wild patching and Abhyankar proof sources; Hurwitz geometry signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/tame-tangential-fiber
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Whole API omissions: TameTangentialFiber.obj, TameTangentialFiber.changeParameter, TameTangentialFiber.inertia, TameTangentialFiber.section.
Whole test omissions: TameTangentialFiber.power_test, TameTangentialFiber.unit_test, TameTangentialFiber.wild_test.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem, tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/finite-coefficient-comparison
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Artin and residual-finiteness original proofs.
Supplier/carrier interfaces: ComplexComparisonPartII:C5/repair-sheaf-singular-comparison, SchemeAndStackFoundations:SF.2.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/artin-good-neighborhoods
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: ArtinNeighborhood.point, ArtinNeighborhood.tower, ArtinNeighborhood.aspherical, ArtinNeighborhood.cohomology.
Whole test omissions: ArtinNeighborhood.affineLine_test, ArtinNeighborhood.torus_test, ArtinNeighborhood.projectiveLine_test.
Exact gap obligations: Artin and residual-finiteness original proofs; Supplier comparison adapters.
Supplier/carrier interfaces: ComplexComparisonPartII:C0, SchemeAndStackFoundations:SF.3.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/curve-topological-density
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Artin and residual-finiteness original proofs; Supplier comparison adapters.
Supplier/carrier interfaces: ComplexComparisonPartII:C0.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/versal-phi-cover-families
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: VersalPhiFamily.chart, VersalPhiFamily.cover, VersalPhiFamily.monodromy, VersalPhiFamily.withSection.
Whole test omissions: VersalPhiFamily.trivial_test, VersalPhiFamily.elliptic_test, VersalPhiFamily.central_test.
Exact gap obligations: Hurwitz geometry signatures; Versal-family original construction; Supplier comparison adapters.
Supplier/carrier interfaces: SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.4.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/general-fixed-fiber-equation
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Hurwitz geometry signatures.
Supplier/carrier interfaces: InductionRestrictionPartII:RS.3/discrete-action.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/realization-certificates
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.InverseGalois.FieldRealization, TauCeti.InverseGalois.PolynomialRealization.
Typed API: FieldRealization.degree, PolynomialRealization.toField, FieldRealization.transport.
Typed examples: Realization.trivial_test, Realization.reducible_test, Realization.degree_test.
Whole API omissions: FieldRealization.groupEquiv.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/specialization-export
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: SpecializationExport.field, SpecializationExport.polynomial, SpecializationExport.roots, SpecializationExport.disjoint.
Whole test omissions: SpecializationExport.quadratic_test, SpecializationExport.badHilbert_test, SpecializationExport.pole_test.
Exact gap obligations: Realization and generic-polynomial signatures.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/cyclic-worked-realizations
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations, tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/dihedral-eight-realization
partial signatures. Full mathematical target remains the packet statement. The native signatures cover the listed declarations; additional categorical, geometric and arithmetic clauses are not implied by their elaboration.
Typed target/carrier: TauCeti.InverseGalois.DihedralEight.field, TauCeti.InverseGalois.DihedralEight.realization.
Typed API: DihedralEight.alpha, DihedralEight.rotation, DihedralEight.reflection, DihedralEight.realization.
Typed examples: DihedralEight.degree_test, DihedralEight.rotation_test, DihedralEight.nonabelian_test.
Exact gap obligations: Realization and generic-polynomial signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations, tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/symmetric-family-import
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-9-sₙ-as-a-galois-group-over-ℚ.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/belyi-arithmetic-interface
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/BelyiMaps#layer-12-profinite-powers-the-fundamental-group-and-the-branch-cycle-theorem, tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/faithful-dessin-action-import
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/BelyiMaps#layer-13-the-pro-ℓ-peripheral-theorem-and-faithfulness.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/inverse-galois-frontier
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6/generic-polynomial-universality
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Whole API omissions: GenericPolynomial.genericGroup, GenericPolynomial.guard, GenericPolynomial.realize, GenericPolynomial.transport.
Whole test omissions: GenericPolynomial.quadratic_test, GenericPolynomial.square_test, GenericPolynomial.constant_test.
Exact gap obligations: Realization and generic-polynomial signatures.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations, tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-3-the-discriminant-and-the-alternating-group.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1/homogeneous-space-fundamental-group
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Semisimple-group simply connected comparison.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups, tauceti:TauCetiRoadmap/ModularCurves#0c-finite-quotients-and-torsors.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3/eventual-class-element-extraction
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5/finite-degree-component-bound
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/identity-root-invariant
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/auxiliary-class-properness
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/coprime-profinite-complements
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected.
Exact gap obligations: Profinite complement conjugacy proof.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-0-profinite-foundations.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2/general-hilbert-local-approximation
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence, SchemeAndStackFoundations:SF.3.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/finite-quotient-approximation
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary, SchemeAndStackFoundations:SF.1.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4/wang-cyclic-eight-counterexample
whole declaration omitted. Full mathematical target remains the packet statement. The whole target declaration is omitted until its prerequisites have actual Lean carriers and the source-proof interfaces are connected. The prerequisite list below is the exact carrier boundary; no untyped condition is replaced by a proposition parameter.
Supplier/carrier interfaces: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants.
-/
