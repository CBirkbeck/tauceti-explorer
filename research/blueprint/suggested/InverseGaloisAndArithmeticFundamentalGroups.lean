import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Polynomial.Eval.Coeff
import Mathlib.RingTheory.Polynomial.Subring
import Mathlib.Algebra.Field.ZMod

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The signatures suggest Lean forms so contributors and reviewers converge on names and
interfaces. All proposed results remain unchecked; this file supplies no implementation.
The component concerns one parameter T and one polynomial variable Y over an arbitrary field.
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
