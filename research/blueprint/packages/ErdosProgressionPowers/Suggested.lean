/-
This suggested file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers converge
on names and signatures. Nothing is claimed implemented; every proof is admitted.

The pinned libraries do not yet expose every native conductor, residual representation,
Serre-weight, generic Frey, Legendre and CM interface needed by the full plan. Those
clauses are identified below and precisely in the README; use their suppliers’ native signatures. The remaining signatures use actual native objects.
The effectivity of an existential threshold requires the README's quantitative ledger.
-/

import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic
import Mathlib.Data.Int.GCD
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.Finset.Interval
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.ArithmeticFunction.VonMangoldt
import Mathlib.Data.Nat.MaxPrimeFac
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Tactic

set_option linter.unusedVariables false
noncomputable section
open scoped BigOperators
namespace TauCeti.ProgressionPowers

abbrev Triple := ℕ × ℕ × ℕ
abbrev Quadruple := ℕ × ℕ × ℕ × ℕ
def term (n d : ℤ) (i : ℕ) : ℤ := n + (i : ℤ) * d
def primitive_solution (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Prop :=
  0 < k ∧ ell.Prime ∧ Int.gcd n d = 1 ∧
    (∏ i ∈ Finset.range k, term n d i) = y ^ ell ∧ y * d ≠ 0
def H (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Prop :=
  primitive_solution n d k y ell ∧ 10 ^ 8 ≤ k ∧ (ell : ℝ) > Real.exp (10 ^ k : ℝ)
def Hplus (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Prop :=
  H n d k y ell ∧ 2 * 10 ^ 10 ≤ k
lemma primitive_solution_iff (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) :
    primitive_solution n d k y ell ↔ 0 < k ∧ ell.Prime ∧ Int.gcd n d = 1 ∧
      (∏ i ∈ Finset.range k, term n d i) = y ^ ell ∧ y * d ≠ 0 := by sorry
lemma primitive_solution_term_ne_zero {n d : ℤ} {k : ℕ} {y : ℤ} {ell i : ℕ}
    (hS : primitive_solution n d k y ell) (hi : i < k) : term n d i ≠ 0 := by sorry
lemma primitive_solution_prime {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hS : primitive_solution n d k y ell) : ell.Prime ∧ 2 ≤ ell := by sorry
-- TauCeti.ProgressionPowers.primitive_solution_square
example : primitive_solution 1 24 3 35 2 := by sorry
-- TauCeti.ProgressionPowers.primitive_solution_signed
example : primitive_solution (-3) 2 4 3 2 := by sorry
-- TauCeti.ProgressionPowers.primitive_solution_zero_length
example (n d y : ℤ) (ell : ℕ) : ¬ primitive_solution n d 0 y ell := by sorry
-- TauCeti.ProgressionPowers.primitive_solution_nonprimitive
example : ¬ primitive_solution 4 2 1 2 2 := by sorry
lemma term_gcd (n d : ℤ) (i j : ℕ) (hc : Int.gcd n d = 1) (hij : i < j) :
    Int.gcd (term n d i) (term n d j) ∣ j - i := by sorry
lemma large_prime_valuations {n d : ℤ} {k : ℕ} {y : ℤ} {ell q i : ℕ}
    (hS : primitive_solution n d k y ell) (hq : q.Prime) (hqk : k ≤ q) (hi : i < k) :
    ell ∣ padicValInt q (term n d i) := by sorry

def factorHyp (n d : ℤ) (k ell : ℕ) : Prop :=
  0 < ell ∧ Odd ell ∧ (∀ i < k, term n d i ≠ 0) ∧
    ∀ q, q.Prime → k ≤ q → ∀ i < k, ell ∣ padicValInt q (term n d i)
def factorPairValid (k ell : ℕ) (t : ℤ) (a : ℕ × ℤ) : Prop :=
  0 < a.1 ∧ a.2 ≠ 0 ∧ t = (a.1 : ℤ) * a.2 ^ ell ∧
    (∀ q, q.Prime → q ∣ a.1 → q < k) ∧
    ∀ q, q.Prime → q ∣ a.2.natAbs → k ≤ q
def signed_factors (n d : ℤ) (k ell : ℕ) : Fin k → ℕ × ℤ := by sorry
lemma signed_factors_eq (n d : ℤ) (k ell : ℕ) (hf : factorHyp n d k ell) (i : Fin k) :
    term n d i = ((signed_factors n d k ell i).1 : ℤ) *
      (signed_factors n d k ell i).2 ^ ell := by sorry
lemma signed_factors_support (n d : ℤ) (k ell : ℕ) (hf : factorHyp n d k ell) (i : Fin k) :
    factorPairValid k ell (term n d i) (signed_factors n d k ell i) := by sorry
lemma signed_factors_unique (n d : ℤ) (k ell : ℕ) (hf : factorHyp n d k ell)
    (f : Fin k → ℕ × ℤ) (h : ∀ i : Fin k, factorPairValid k ell (term n d i) (f i)) :
    f = signed_factors n d k ell := by sorry
lemma signed_factors_sign (n d : ℤ) (k ell : ℕ) (hf : factorHyp n d k ell) (i : Fin k) :
    Int.sign (signed_factors n d k ell i).2 = Int.sign (term n d i) := by sorry
-- TauCeti.ProgressionPowers.signed_factors_negative
example : signed_factors (-8) 1 1 3 ⟨0, by decide⟩ = (1,-2) := by sorry
-- TauCeti.ProgressionPowers.signed_factors_boundary
example : signed_factors 8 19 2 3 ⟨0, by decide⟩ = (1,2) ∧
    signed_factors 8 19 2 3 ⟨1, by decide⟩ = (1,3) := by sorry
-- TauCeti.ProgressionPowers.signed_factors_small_power
example (i : Fin 3) : signed_factors 64 0 3 3 i = (64,1) := by sorry
-- TauCeti.ProgressionPowers.signed_factors_mixed_sign
example : signed_factors (-8) 7 2 3 ⟨0, by decide⟩ = (1,-2) ∧
    signed_factors (-8) 7 2 3 ⟨1, by decide⟩ = (1,-1) := by sorry

def ap_triples (k : ℕ) : Finset Triple := by
  classical
  exact ((Finset.range k).product ((Finset.range k).product (Finset.range k))).filter
    (fun a => a.1 < a.2.1 ∧ a.1 + a.2.2 = 2 * a.2.1)
lemma ap_triples_mem (k : ℕ) (a : Triple) :
    a ∈ ap_triples k ↔ a.1 < k ∧ a.2.1 < k ∧ a.2.2 < k ∧
      a.1 < a.2.1 ∧ a.1 + a.2.2 = 2 * a.2.1 := by sorry
lemma ap_triples_spacing (k : ℕ) (a : Triple) (ha : a ∈ ap_triples k) :
    a.1 < a.2.1 ∧ a.2.1 < a.2.2 ∧ a.2.1-a.1 = a.2.2-a.2.1 := by sorry
lemma ap_triples_mono (k K : ℕ) (h : k ≤ K) : ap_triples k ⊆ ap_triples K := by sorry
-- TauCeti.ProgressionPowers.ap_triples_empty
example : ap_triples 0 = ∅ ∧ ap_triples 1 = ∅ ∧ ap_triples 2 = ∅ := by sorry
-- TauCeti.ProgressionPowers.ap_triples_three
example : ap_triples 3 = {(0,1,2)} := by sorry
-- TauCeti.ProgressionPowers.ap_triples_five
example : (ap_triples 5).card = 4 := by sorry
-- TauCeti.ProgressionPowers.ap_triples_no_constant
example (k i : ℕ) : (i,i,i) ∉ ap_triples k := by sorry
def equal_sum_quadruples (k : ℕ) : Finset Quadruple := by
  classical
  exact ((Finset.range k).product ((Finset.range k).product
    ((Finset.range k).product (Finset.range k)))).filter
    (fun a => a.1 < a.2.1 ∧ a.2.1 ≤ a.2.2.1 ∧ a.2.2.1 < a.2.2.2 ∧
      a.2.1 + a.2.2.1 = a.1 + a.2.2.2)
def kappa (a : Quadruple) : ℤ := (a.1 : ℤ)*a.2.2.2 - (a.2.1 : ℤ)*a.2.2.1
lemma equal_sum_quadruples_mem (k : ℕ) (a : Quadruple) : a ∈ equal_sum_quadruples k ↔
    a.1 < k ∧ a.2.1 < k ∧ a.2.2.1 < k ∧ a.2.2.2 < k ∧
      a.1 < a.2.1 ∧ a.2.1 ≤ a.2.2.1 ∧ a.2.2.1 < a.2.2.2 ∧
      a.2.1+a.2.2.1 = a.1+a.2.2.2 := by sorry
lemma equal_sum_quadruples_kappa (k : ℕ) (a : Quadruple) (ha : a ∈ equal_sum_quadruples k) :
    kappa a < 0 ∧ (kappa a).natAbs < k^2 := by sorry
lemma equal_sum_quadruples_mono (k K : ℕ) (h : k ≤ K) :
    equal_sum_quadruples k ⊆ equal_sum_quadruples K := by sorry
-- TauCeti.ProgressionPowers.equal_sum_quadruples_empty
example : equal_sum_quadruples 2 = ∅ := by sorry
-- TauCeti.ProgressionPowers.equal_sum_quadruples_three
example : equal_sum_quadruples 3 = {(0,1,1,2)} ∧ kappa (0,1,1,2) = -1 := by sorry
-- TauCeti.ProgressionPowers.equal_sum_quadruples_repeated
example : (0,1,1,2) ∈ equal_sum_quadruples 3 := by sorry
def divisibility_indices (n d : ℤ) (k r : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range k).filter (fun i => (r : ℤ) ∣ term n d i)
lemma divisibility_indices_mem (n d : ℤ) (k r i : ℕ) :
    i ∈ divisibility_indices n d k r ↔ i < k ∧ (r : ℤ) ∣ term n d i := by sorry
lemma divisibility_indices_one (n d : ℤ) (k : ℕ) :
    divisibility_indices n d k 1 = Finset.range k := by sorry
lemma divisibility_indices_prime_d (n d : ℤ) (k p : ℕ)
    (h : Int.gcd n d = 1) (hp : p.Prime) (hpd : (p : ℤ) ∣ d) :
    divisibility_indices n d k p = ∅ := by sorry
-- TauCeti.ProgressionPowers.divisibility_indices_sample
example : divisibility_indices 1 2 6 3 = {1,4} := by sorry
-- TauCeti.ProgressionPowers.divisibility_indices_empty
example (n d : ℤ) (r : ℕ) : divisibility_indices n d 0 r = ∅ := by sorry
-- TauCeti.ProgressionPowers.divisibility_indices_boundary
example : divisibility_indices 1 1 3 4 = ∅ := by sorry
lemma residue_class_count (n d : ℤ) (k r : ℕ) (h : Int.gcd n d = 1) (hr : 0 < r) :
    (1 < Int.gcd (r : ℤ) d → divisibility_indices n d k r = ∅) ∧
    (Int.gcd (r : ℤ) d = 1 → ∃ u : ZMod r, ∀ i < k,
      (r : ℤ) ∣ term n d i ↔ (i : ZMod r) = u) ∧
    ((divisibility_indices n d k r).card : ℝ) ≤ (k : ℝ)/r+1 ∧
    ∀ p : ℕ, p.Prime → ¬ (p : ℤ) ∣ d →
      |((divisibility_indices n d k p).card : ℝ)-(k : ℝ)/p| < 1 := by sorry

def tripleG (n d : ℤ) (a : Triple) : ℕ :=
  Int.gcd (term n d a.1) (Int.gcd (2*term n d a.2.1) (term n d a.2.2))
def normalized (n d : ℤ) (a : Triple) : ℤ × ℤ × ℤ :=
  let g : ℤ := tripleG n d a
  (term n d a.1/g, -2*term n d a.2.1/g, term n d a.2.2/g)
def first_curve (n d : ℤ) (a : Triple) : WeierstrassCurve ℚ :=
  let c := normalized n d a
  ⟨0, (c.2.2 : ℚ)-c.1, 0, -(c.1 : ℚ)*c.2.2, 0⟩
lemma first_curve_coefficients (n d : ℤ) (a : Triple) :
    (first_curve n d a).a₁=0 ∧
      (first_curve n d a).a₂ = ((normalized n d a).2.2 : ℚ)-(normalized n d a).1 ∧
      (first_curve n d a).a₃=0 ∧
      (first_curve n d a).a₄ = -((normalized n d a).1 : ℚ)*(normalized n d a).2.2 ∧
      (first_curve n d a).a₆=0 := by sorry
lemma first_curve_normalization {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} {a : Triple}
    (hS : primitive_solution n d k y ell) (ha : a ∈ ap_triples k) :
    0 < tripleG n d a ∧
    (tripleG n d a : ℤ)*(normalized n d a).1=term n d a.1 ∧
    (tripleG n d a : ℤ)*(normalized n d a).2.1= -2*term n d a.2.1 ∧
    (tripleG n d a : ℤ)*(normalized n d a).2.2=term n d a.2.2 ∧
    (normalized n d a).1 + (normalized n d a).2.1 + (normalized n d a).2.2 = 0 ∧
    Int.gcd (normalized n d a).1 (normalized n d a).2.1 = 1 ∧
    Int.gcd (normalized n d a).1 (normalized n d a).2.2 = 1 ∧
    Int.gcd (normalized n d a).2.1 (normalized n d a).2.2 = 1 := by sorry
-- first_curve_frey_compatibility: the native coefficient side is given above.
-- Equality to the upstream generic Frey declaration awaits its absent interface;
-- no replacement generic Frey definition is created in this file.
-- TauCeti.ProgressionPowers.first_curve_unit_gcd
example : tripleG 1 1 (0,1,2) = 1 ∧ normalized 1 1 (0,1,2) = (1,-4,3) ∧
    (first_curve 1 1 (0,1,2)).a₂ = 2 ∧ (first_curve 1 1 (0,1,2)).a₄ = -3 := by sorry
-- TauCeti.ProgressionPowers.first_curve_even_gcd
example : tripleG 2 1 (0,1,2) = 2 ∧ normalized 2 1 (0,1,2) = (1,-3,2) ∧
    (first_curve 2 1 (0,1,2)).a₂ = 1 ∧ (first_curve 2 1 (0,1,2)).a₄ = -2 := by sorry
-- TauCeti.ProgressionPowers.first_curve_signed
example : normalized (-3) 2 (0,1,2) = (-3,2,1) ∧
    (first_curve (-3) 2 (0,1,2)).a₂ = 4 ∧ (first_curve (-3) 2 (0,1,2)).a₄ = 3 := by sorry
lemma first_local_invariants {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} {a : Triple}
    (hS : primitive_solution n d k y ell) (ha : a ∈ ap_triples k) :
    let c := normalized n d a
    (first_curve n d a).Δ = 16*((c.1 : ℚ)*c.2.1*c.2.2)^2 ∧
      (first_curve n d a).c₄ = 16*((c.1 : ℚ)^2-(c.2.1 : ℚ)*c.2.2) := by sorry
-- Local minimality and semistability clauses are omitted here pending the p-adic
-- native-model signatures, not replaced by flags. Their full README statement applies.
lemma linear_fermat_identities (n d i j h : ℤ) :
    (h-j)*(n+i*d)+(i-h)*(n+j*d)+(j-i)*(n+h*d)=0 := by sorry
def secondA (n d : ℤ) (a : Quadruple) : ℤ := term n d a.1*term n d a.2.2.2
def secondB (n d : ℤ) (a : Quadruple) : ℤ := term n d a.2.1*term n d a.2.2.1
def second_curve (n d : ℤ) (a : Quadruple) : WeierstrassCurve ℚ :=
  ⟨0, 2*(kappa a : ℚ)*d, 0, (kappa a : ℚ)*secondA n d a, 0⟩
lemma second_curve_coefficients (n d : ℤ) (a : Quadruple) :
    (second_curve n d a).a₁=0 ∧ (second_curve n d a).a₂ = 2*(kappa a : ℚ)*d ∧
      (second_curve n d a).a₃=0 ∧ (second_curve n d a).a₄ = (kappa a : ℚ)*secondA n d a ∧
      (second_curve n d a).a₆=0 := by sorry
lemma second_curve_difference (n d : ℤ) (k : ℕ) (a : Quadruple)
    (ha : a ∈ equal_sum_quadruples k) :
    secondA n d a-secondB n d a=kappa a*d^2 ∧ kappa a < 0 := by sorry
lemma second_curve_equation (n d : ℤ) (a : Quadruple) (x y : ℚ) :
    (second_curve n d a).toAffine.Equation x y ↔
      y^2=x*(x^2+2*(kappa a : ℚ)*d*x+(kappa a : ℚ)*secondA n d a) := by sorry
-- TauCeti.ProgressionPowers.second_curve_three
example : kappa (0,1,1,2) = -1 ∧ secondA 1 1 (0,1,1,2) = 3 ∧
    secondB 1 1 (0,1,1,2) = 4 ∧ (second_curve 1 1 (0,1,1,2)).a₂ = -2 ∧
    (second_curve 1 1 (0,1,1,2)).a₄ = -3 := by sorry
-- TauCeti.ProgressionPowers.second_curve_signed
example : secondA (-3) 2 (0,1,1,2) = -3 ∧ secondB (-3) 2 (0,1,1,2) = 1 ∧
    (second_curve (-3) 2 (0,1,1,2)).a₂ = -4 ∧ (second_curve (-3) 2 (0,1,1,2)).a₄ = 3 := by sorry
-- TauCeti.ProgressionPowers.second_curve_not_first
example : (second_curve 1 1 (0,1,1,2)).a₂ ≠ (first_curve 1 1 (0,1,2)).a₂ := by sorry
lemma second_local_invariants (n d : ℤ) (k : ℕ) (a : Quadruple)
    (ha : a ∈ equal_sum_quadruples k) :
    (second_curve n d a).Δ = -64*(kappa a : ℚ)^3*(secondA n d a : ℚ)^2*secondB n d a ∧
    (second_curve n d a).c₄ = 16*(kappa a : ℚ)*(4*(kappa a : ℚ)*(d : ℚ)^2-3*secondA n d a) := by sorry
lemma half_primes_divide_d {n d : ℤ} {k : ℕ} {y : ℤ} {ell p : ℕ}
    (hH : H n d k y ell) (hp : p.Prime) (hl : k < 2*p) (hu : p ≤ k) : (p : ℤ) ∣ d := by sorry
-- first_reduced_level, second_reduced_level, coefficient_prime_bridge,
-- kraus_progression_threshold, comparison_curve and good_trace_comparison:
-- Their complete statements need native Artin conductor/residual/Serre-weight
-- interfaces and the Tau Ceti trace of actual good reductions. These declarations
-- are deliberately omitted, with precise contracts in the README. No surrogate M or F
-- with proposition-valued fields is introduced. The existing Tau Ceti trace is not
-- defined a second time, and the finite-field trace is consumed from Tau Ceti.

def inCaseSquareclasses (u : ℚ) : Prop := (∃ t : ℚ, u = -t^2) ∨ ∃ t : ℚ, u = 2*t^2
def case_partition (k : ℕ) (parameters : Triple → Finset ℚ) : Finset Triple × Finset Triple := by
  classical
  let first := (ap_triples k).filter (fun a => ∃ u ∈ parameters a, ¬ inCaseSquareclasses u)
  exact (first, ap_triples k \ first)
lemma case_partition_mem (k : ℕ) (parameters : Triple → Finset ℚ) (a : Triple) :
    (a ∈ (case_partition k parameters).1 ↔
      a ∈ ap_triples k ∧ ∃ u ∈ parameters a, ¬ inCaseSquareclasses u) ∧
    (a ∈ (case_partition k parameters).2 ↔
      a ∈ ap_triples k ∧ ∀ u ∈ parameters a, inCaseSquareclasses u) := by sorry
lemma case_partition_union (k : ℕ) (parameters : Triple → Finset ℚ) :
    (case_partition k parameters).1 ∪ (case_partition k parameters).2 = ap_triples k ∧
      Disjoint (case_partition k parameters).1 (case_partition k parameters).2 := by sorry
lemma case_partition_reindex (k : ℕ) (p q : Triple → Finset ℚ) (hpq : ∀ a, p a = q a) :
    case_partition k p = case_partition k q := by sorry
-- TauCeti.ProgressionPowers.case_partition_three
example : case_partition 3 (fun _ => {3}) = ({(0,1,2)},∅) := by sorry
-- TauCeti.ProgressionPowers.case_partition_minus_one
example : case_partition 3 (fun _ => {-1}) = (∅,{(0,1,2)}) := by sorry
-- TauCeti.ProgressionPowers.case_partition_empty
example (parameters : Triple → Finset ℚ) : case_partition 0 parameters = (∅,∅) := by sorry
-- case_one_projection, case_two_normalization, frey_non_cm and case_two_projection:
-- The unavailable six-parameter/good-reduction/CM predicates are not replaced by
-- proposition fields. These four native geometric endpoints are omitted until the
-- native supplier signatures can be imported. The mathematical owner is
-- EllipticLegendreCharacterInterfaces, Layers LG.0–LG.5, for the Legendre inputs;
-- ComplexMultiplicationAndExplicitReciprocity, CM.3–CM.4, for the CM inputs.
-- The finite rational partition above is
-- complete as a parameter-set adapter, but does not construct generic Legendre data.

abbrev IndexedTriple (k : ℕ) := {a : Triple // a ∈ ap_triples k}
def character_family (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) :
    IndexedTriple k → Σ N : ℕ, DirichletCharacter ℝ N := by sorry
def oddPart (N : ℕ) : ℕ := N / 2 ^ padicValNat 2 N
def smallCoeff (n d : ℤ) (k ell i : ℕ) : ℕ :=
  if h : i < k then (signed_factors n d k ell ⟨i,h⟩).1 else 1
def familyN (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (a : Triple) : ℕ :=
  if h : a ∈ ap_triples k then (character_family n d k y ell ⟨a,h⟩).2.conductor else 1
def familyValue (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (a : Triple) (m : ℕ) : ℝ :=
  if h : a ∈ ap_triples k then
    let f := character_family n d k y ell ⟨a,h⟩
    f.2 (m : ZMod f.1)
  else 0
def weightedHalf (k : ℕ) (value : ℕ → ℝ) : ℝ :=
  ∑ m ∈ Finset.Ioc (k/2) k, value m * ArithmeticFunction.vonMangoldt m
lemma character_family_primitive {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (a : IndexedTriple k) :
    (character_family n d k y ell a).2.IsPrimitive ∧
      (character_family n d k y ell a).2.IsQuadratic ∧
      (character_family n d k y ell a).2.conductor = (character_family n d k y ell a).1 := by sorry
lemma character_family_mass {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (a : IndexedTriple k) :
    |weightedHalf k (familyValue n d k y ell a)| > (1239/10000 : ℝ)*k := by sorry
lemma character_family_support {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (a : IndexedTriple k) :
    Squarefree (oddPart (familyN n d k y ell a)) ∧
      oddPart (familyN n d k y ell a) ∣ smallCoeff n d k ell a.val.1 *
        smallCoeff n d k ell a.val.2.1 * smallCoeff n d k ell a.val.2.2 ∧
      familyN n d k y ell a ≤ 8*oddPart (familyN n d k y ell a) := by sorry
-- The additional oddPart(N_a) | M_a clause is omitted: M_a must be the native
-- reduced/Artin conductor of the actual curve, not a free natural number.
lemma character_family_nonprincipal {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (a : IndexedTriple k) :
    oddPart (familyN n d k y ell a) ≠ 1 ∧ 1 < familyN n d k y ell a ∧
      (character_family n d k y ell a).2 ≠ 1 := by sorry
-- TauCeti.ProgressionPowers.character_family_one
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (a : IndexedTriple k) :
    (character_family n d k y ell a).2 1 = 1 := by sorry
-- TauCeti.ProgressionPowers.character_family_zero
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (a : IndexedTriple k) :
    (character_family n d k y ell a).2 0 = 0 ∧ 1 < familyN n d k y ell a := by sorry
-- TauCeti.ProgressionPowers.character_family_same_witness
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (a : IndexedTriple k) :
    |weightedHalf k (familyValue n d k y ell a)| > (1239/10000 : ℝ)*k ∧
      oddPart (familyN n d k y ell a) ∣ smallCoeff n d k ell a.val.1 *
        smallCoeff n d k ell a.val.2.1 * smallCoeff n d k ell a.val.2.2 := by sorry
theorem harmonic_criterion (c1 : ℝ) (hc1 : 0 < c1) (hc1u : c1 < 1) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (B : Finset Triple),
      Hplus n d k y ell → B ⊆ ap_triples k →
      Set.InjOn (fun a => (familyN n d k y ell a).maxPrimeFac) (B : Set Triple) →
      (∀ a ∈ B, ((familyN n d k y ell a).maxPrimeFac : ℝ) < Real.log k ^ (1-c1)) →
      (166/1000 : ℝ) ≤ ∑ a ∈ B, 1/((familyN n d k y ell a).maxPrimeFac : ℝ) → k ≤ K := by sorry
theorem many_character_criterion (c2 : ℝ) (hc2 : 10 < c2) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (B : Finset Triple),
      Hplus n d k y ell → B ⊆ ap_triples k → (17 : ℝ)*Real.log k < B.card →
      Set.InjOn (familyValue n d k y ell) (B : Set Triple) →
      (∀ a ∈ B, ((familyN n d k y ell a).maxPrimeFac : ℝ) ≤ (k : ℝ)^(7/16 : ℝ)) →
      (∀ a ∈ B, (familyN n d k y ell a : ℝ) < (k : ℝ)^c2) → k ≤ K := by sorry

def Tpr (k : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range (k+1)).filter (fun p => p.Prime ∧ (k : ℝ)^(7/16 : ℝ) < p)
def Upr (k : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range (⌈(10^4 : ℝ)*Real.log k⌉₊+1)).filter
    (fun p => p.Prime ∧ Real.log k^(1-(1/10000 : ℝ)) < p ∧ (p : ℝ) ≤ (10^4 : ℝ)*Real.log k)
def thin_prime_survivors (n d : ℤ) (k : ℕ) (s : Finset ℕ) : Finset ℕ :=
  Finset.range k \ (s ∪ Tpr k ∪ Upr k).biUnion (divisibility_indices n d k)
lemma thin_prime_survivors_mem (n d : ℤ) (k : ℕ) (s : Finset ℕ) (i : ℕ) :
    i ∈ thin_prime_survivors n d k s ↔ i < k ∧
      ∀ p ∈ s ∪ Tpr k ∪ Upr k, ¬ (p : ℤ) ∣ term n d i := by sorry
lemma thin_prime_survivors_antitone (n d : ℤ) (k : ℕ) (s t : Finset ℕ) (h : s ⊆ t) :
    thin_prime_survivors n d k t ⊆ thin_prime_survivors n d k s := by sorry
lemma thin_prime_survivors_conductor {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (s : Finset ℕ) (a : IndexedTriple k)
    (hi : a.val.1 ∈ thin_prime_survivors n d k s)
    (hj : a.val.2.1 ∈ thin_prime_survivors n d k s)
    (hh : a.val.2.2 ∈ thin_prime_survivors n d k s) :
    (∀ p ∈ s ∪ Upr k, p.Prime → p ≠ 2 → ¬ p ∣ familyN n d k y ell a) ∧
      ((familyN n d k y ell a).maxPrimeFac : ℝ) ≤ (k : ℝ)^(7/16 : ℝ) := by sorry
-- TauCeti.ProgressionPowers.thin_prime_survivors_zero
example (n d : ℤ) (s : Finset ℕ) : thin_prime_survivors n d 0 s = ∅ := by sorry
-- TauCeti.ProgressionPowers.thin_prime_survivors_union
example (n d : ℤ) (k : ℕ) (s : Finset ℕ) : thin_prime_survivors n d k s =
    Finset.range k \ (Upr k ∪ Tpr k ∪ s).biUnion (divisibility_indices n d k) := by sorry
-- TauCeti.ProgressionPowers.thin_prime_survivors_open_left
example (k p : ℕ) (h : (p : ℝ) = (k : ℝ)^(7/16 : ℝ)) : p ∉ Tpr k := by sorry

def removedIndex (p : ℕ) (coeff : ℕ → ℕ) (J : Finset ℕ) : ℕ := by
  classical
  let s := J.filter (fun i => padicValNat p (coeff i) = J.sup (fun j => padicValNat p (coeff j)))
  exact if h : s.Nonempty then s.min' h else 0
def valuation_deletion (k : ℕ) (coeff : ℕ → ℕ) (J : Finset ℕ) : Finset ℕ := by
  classical
  exact J \ ((J.biUnion (fun i => (coeff i).primeFactors)).filter (fun p => p < k)).image
    (fun p => removedIndex p coeff J)
def coeffHyp (n d : ℤ) (k : ℕ) (coeff : ℕ → ℕ) : Prop :=
  Int.gcd n d = 1 ∧ (∀ i < k, term n d i ≠ 0) ∧
    ∀ i < k, 0 < coeff i ∧ coeff i ∣ (term n d i).natAbs ∧
      ∀ p, p.Prime → p ∣ coeff i → p < k
lemma valuation_deletion_subset (k : ℕ) (coeff : ℕ → ℕ) (J : Finset ℕ) :
    valuation_deletion k coeff J ⊆ J ∧
      J.card ≤ (valuation_deletion k coeff J).card+((Finset.range k).filter Nat.Prime).card := by sorry
lemma valuation_deletion_factorial (n d : ℤ) (k : ℕ) (coeff : ℕ → ℕ) (J : Finset ℕ)
    (h : coeffHyp n d k coeff) (hJ : J ⊆ Finset.range k) :
    (∏ i ∈ valuation_deletion k coeff J, coeff i) ∣ Nat.factorial (k-1) := by sorry
lemma valuation_deletion_tie (k p : ℕ) (coeff : ℕ → ℕ) (J : Finset ℕ) (hJ : J.Nonempty) :
    removedIndex p coeff J ∈ J ∧
      (∀ i ∈ J, padicValNat p (coeff i) ≤ padicValNat p (coeff (removedIndex p coeff J))) ∧
      ∀ i ∈ J, padicValNat p (coeff i) = padicValNat p (coeff (removedIndex p coeff J)) →
        removedIndex p coeff J ≤ i := by sorry
-- TauCeti.ProgressionPowers.valuation_deletion_empty
example (k : ℕ) (coeff : ℕ → ℕ) : valuation_deletion k coeff ∅ = ∅ := by sorry
-- TauCeti.ProgressionPowers.valuation_deletion_units
example (k : ℕ) (J : Finset ℕ) : valuation_deletion k (fun _ => 1) J = J := by sorry
-- TauCeti.ProgressionPowers.valuation_deletion_sample
example : valuation_deletion 5 (fun i => ([1,2,3,4,1] : List ℕ).getD i 1) (Finset.range 5) = {0,1,4} := by sorry
-- TauCeti.ProgressionPowers.valuation_deletion_least_tie
example : removedIndex 2 (fun i => ([1,2,1,2] : List ℕ).getD i 1) (Finset.range 4) = 1 := by sorry

def J2 (n d : ℤ) (k ell : ℕ) (s : Finset ℕ) : Finset ℕ := by
  classical
  exact (valuation_deletion k (smallCoeff n d k ell) (thin_prime_survivors n d k s)).filter
    (fun i => smallCoeff n d k ell i ≤ k^139)
def certifiedThreshold (k : ℕ) : Prop := (k : ℝ) ≥ Real.exp (Real.exp (10^7))
def thinSet (k : ℕ) (s : Finset ℕ) : Prop :=
  (∀ p ∈ s, p.Prime ∧ p ≤ k) ∧ (∑ p ∈ s, 1/(p : ℝ)) < (17/100 : ℝ)
theorem stirling_upper_adapter (m : ℕ) (hm : 1 ≤ m) :
    (m.factorial : ℝ) ≤ Real.sqrt (2 * Real.pi * m) *
      ((m : ℝ) / Real.exp 1)^m * Real.exp (1 / (12 * (m : ℝ))) := by sorry

theorem survivor_density {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (hk : certifiedThreshold k) (s : Finset ℕ) (hs : thinSet k s) :
    (((Tpr k).biUnion (divisibility_indices n d k)).card : ℝ) ≤ (k : ℝ)*Real.log (16/7) ∧
    (((Upr k).biUnion (divisibility_indices n d k)).card : ℝ) ≤
      (k : ℝ)*Real.log (1/(1-(1/10000 : ℝ)))+
        5*(k : ℝ)*Real.log 10/Real.log (Real.log k)+(10^4 : ℝ)*Real.log k ∧
    ((s.biUnion (divisibility_indices n d k)).card : ℝ) <
      (17/100 : ℝ)*k+(11/10 : ℝ)*k/Real.log k ∧
    (32/10000 : ℝ)*k < (thin_prime_survivors n d k s).card ∧
    (319/100000 : ℝ)*k <
      (valuation_deletion k (smallCoeff n d k ell) (thin_prime_survivors n d k s)).card ∧
    ((∏ i ∈ valuation_deletion k (smallCoeff n d k ell) (thin_prime_survivors n d k s),
      smallCoeff n d k ell i) : ℝ) < (k : ℝ)^((44/100 : ℝ)*k) ∧
    (1/100000 : ℝ)*k < (J2 n d k ell s).card := by sorry
def thin_conductor_witness (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (s : Finset ℕ) : Triple := by sorry
lemma thin_conductor_witness_mem {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (hk : certifiedThreshold k) (s : Finset ℕ) (hs : thinSet k s) :
    let a := thin_conductor_witness n d k y ell s
    a ∈ ap_triples k ∧ a.1 ∈ J2 n d k ell s ∧ a.2.1 ∈ J2 n d k ell s ∧ a.2.2 ∈ J2 n d k ell s := by sorry
lemma thin_conductor_witness_avoid {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (hk : certifiedThreshold k) (s : Finset ℕ) (hs : thinSet k s) :
    ∀ p ∈ s ∪ Upr k, p.Prime → ¬ p ∣ familyN n d k y ell (thin_conductor_witness n d k y ell s) := by sorry
lemma thin_conductor_witness_size {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (hk : certifiedThreshold k) (s : Finset ℕ) (hs : thinSet k s) :
    let N := familyN n d k y ell (thin_conductor_witness n d k y ell s)
    (N.maxPrimeFac : ℝ) ≤ (k : ℝ)^(7/16 : ℝ) ∧ (N : ℝ) < (k : ℝ)^418 := by sorry
-- TauCeti.ProgressionPowers.thin_conductor_witness_empty_s
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (hk : certifiedThreshold k) :
    let N := familyN n d k y ell (thin_conductor_witness n d k y ell ∅)
    (N.maxPrimeFac : ℝ) ≤ (k : ℝ)^(7/16 : ℝ) ∧ (N : ℝ) < (k : ℝ)^418 ∧
      ∀ p ∈ Upr k, ¬ p ∣ N := by sorry
-- TauCeti.ProgressionPowers.thin_conductor_witness_same
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (hk : certifiedThreshold k)
    (s : Finset ℕ) (hs : thinSet k s) :
    let N := familyN n d k y ell (thin_conductor_witness n d k y ell s)
    (∀ p ∈ s ∪ Upr k, p.Prime → ¬ p ∣ N) ∧ (N.maxPrimeFac : ℝ) ≤ (k : ℝ)^(7/16 : ℝ) ∧
      (N : ℝ) < (k : ℝ)^418 := by sorry
-- TauCeti.ProgressionPowers.thin_conductor_witness_certified_threshold
example : (10^6 : ℝ) < 132*Real.log 2*10^5 ∧ 132*Real.log 2*10^5 < (10^7 : ℝ) := by sorry
def admissible (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (B : Finset Triple) : Prop :=
  B ⊆ ap_triples k ∧ Set.InjOn (fun a => (familyN n d k y ell a).maxPrimeFac) (B : Set Triple) ∧
    ∀ a ∈ B, ((familyN n d k y ell a).maxPrimeFac : ℝ) ≤ (k : ℝ)^(7/16 : ℝ) ∧
      (familyN n d k y ell a : ℝ) < (k : ℝ)^418 ∧ ∀ p ∈ Upr k, ¬ p ∣ familyN n d k y ell a
def maximal_conductor_family (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Finset Triple := by sorry
lemma maximal_conductor_family_admissible {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (hk : certifiedThreshold k) :
    (maximal_conductor_family n d k y ell).Nonempty ∧
      admissible n d k y ell (maximal_conductor_family n d k y ell) := by sorry
lemma maximal_conductor_family_maximal {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (hk : certifiedThreshold k) (B : Finset Triple)
    (hB : admissible n d k y ell B) (hsub : maximal_conductor_family n d k y ell ⊆ B) :
    B = maximal_conductor_family n d k y ell := by sorry
lemma maximal_conductor_family_mass {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ}
    (hH : Hplus n d k y ell) (hk : certifiedThreshold k)
    (hcard : ((maximal_conductor_family n d k y ell).card : ℝ) ≤ 17*Real.log k) :
    (17/100 : ℝ) ≤ ∑ a ∈ maximal_conductor_family n d k y ell,
      1/((familyN n d k y ell a).maxPrimeFac : ℝ) := by sorry
-- TauCeti.ProgressionPowers.maximal_conductor_family_nonempty
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (hk : certifiedThreshold k) :
    maximal_conductor_family n d k y ell ≠ ∅ := by sorry
-- TauCeti.ProgressionPowers.maximal_conductor_family_no_duplicate
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (hk : certifiedThreshold k)
    (a b : Triple) (ha : a ∈ maximal_conductor_family n d k y ell)
    (hb : b ∈ maximal_conductor_family n d k y ell) (hab : a ≠ b) :
    (familyN n d k y ell a).maxPrimeFac ≠ (familyN n d k y ell b).maxPrimeFac := by sorry
-- TauCeti.ProgressionPowers.maximal_conductor_family_extension
example {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell) (hk : certifiedThreshold k)
    (a : Triple) (ha : a ∈ ap_triples k) (hout : a ∉ maximal_conductor_family n d k y ell)
    (hsize : ((familyN n d k y ell a).maxPrimeFac : ℝ) ≤ (k : ℝ)^(7/16 : ℝ))
    (hN : (familyN n d k y ell a : ℝ) < (k : ℝ)^418)
    (hgap : ∀ p ∈ Upr k, ¬ p ∣ familyN n d k y ell a) :
    ∃ b ∈ maximal_conductor_family n d k y ell,
      (familyN n d k y ell a).maxPrimeFac = (familyN n d k y ell b).maxPrimeFac := by sorry
theorem original_route_bound : ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ),
    Hplus n d k y ell → k ≤ K := by sorry

def zeroHeight (k : ℕ) (c : ℝ) : ℝ := Real.exp (c*Real.log k/(3*Real.log (Real.log k)))
def zeroWithin {q : ℕ} [NeZero q] (k : ℕ) (c : ℝ)
    (χ : DirichletCharacter ℂ q) (ρ : ℂ) : Prop :=
  χ.IsPrimitive ∧ (ρ ≠ 1 ∨ χ ≠ 1) ∧ χ.LFunction ρ = 0 ∧ |ρ.im| ≤ zeroHeight k c ∧
    1-3*Real.log (Real.log k)/Real.log k < ρ.re
def hasZeroWithin (k : ℕ) (c : ℝ) (q : ℕ) : Prop :=
  ∃ hq : NeZero q, ∃ χ : DirichletCharacter ℂ q, ∃ ρ : ℂ, @zeroWithin q hq k c χ ρ
def exceptional_moduli (k : ℕ) (c : ℝ) : Finset ℕ := by
  classical
  exact (Finset.range (k^4+1)).filter (fun q => 0 < q ∧ hasZeroWithin k c q)
lemma exceptional_moduli_mem (k q : ℕ) (c : ℝ) : q ∈ exceptional_moduli k c ↔
    0 < q ∧ q ≤ k^4 ∧ hasZeroWithin k c q := by sorry
lemma exceptional_moduli_finite (k : ℕ) (c : ℝ) :
    (exceptional_moduli k c : Set ℕ).Finite ∧
      ∀ q ∈ exceptional_moduli k c, 1 ≤ q ∧ q ≤ k^4 := by sorry
lemma exceptional_moduli_height {k q : ℕ} {c : ℝ} [NeZero q]
    (χ : DirichletCharacter ℂ q) (ρ : ℂ) (h : zeroWithin k c χ ρ) :
    |ρ.im| ≤ zeroHeight k c := by sorry
-- TauCeti.ProgressionPowers.exceptional_moduli_zero
example (k : ℕ) (c : ℝ) : 0 ∉ exceptional_moduli k c := by sorry
-- TauCeti.ProgressionPowers.exceptional_moduli_upper
example (k q : ℕ) (c : ℝ) (h : k^4 < q) : q ∉ exceptional_moduli k c := by sorry
-- TauCeti.ProgressionPowers.exceptional_moduli_high_zero
example {k q : ℕ} {c : ℝ} [NeZero q] (χ : DirichletCharacter ℂ q) (ρ : ℂ)
    (h : zeroHeight k c < |ρ.im|) : ¬ zeroWithin k c χ ρ := by sorry

-- TauCeti.ProgressionPowers.exceptional_moduli_principal_pole
example {k q : ℕ} {c : ℝ} [NeZero q] :
    ¬ zeroWithin k c (1 : DirichletCharacter ℂ q) 1 := by sorry

-- This explicit native predicate is notation for the requested bounded-height
-- Landau-Page input, not an assumed conclusion or a new zero-free theorem.
def pageException (c T : ℝ) (q : ℕ) : Prop :=
  ∃ hq : NeZero q, ∃ χ : DirichletCharacter ℂ q, ∃ ρ : ℂ,
    χ.IsPrimitive ∧ (ρ ≠ 1 ∨ χ ≠ 1) ∧ @DirichletCharacter.LFunction q hq χ ρ = 0 ∧
      |ρ.im| ≤ T ∧ 1-c/Real.log T ≤ ρ.re
def boundedPage (c : ℝ) : Prop :=
  ∀ T : ℝ, 2 ≤ T → ∀ q r : ℕ, (q : ℝ) ≤ T → (r : ℝ) ≤ T →
    pageException c T q → pageException c T r → q=r
theorem exceptional_moduli_bounds (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ k ≥ K,
      ((exceptional_moduli k c).card : ℝ) ≤ C*Real.log k^61 ∧
      (∀ q ∈ exceptional_moduli k c, Real.log k ≤ (q : ℝ)) ∧
      ((exceptional_moduli k c).filter (fun q : ℕ => (q : ℝ) < zeroHeight k c)).card ≤ 1 := by sorry
theorem nonexceptional_half_sum (c : ℝ) (hc : 0 < c) :
    ∃ K : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ k ≥ K, ∀ q : ℕ, ∀ hq : NeZero q,
      ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → χ ≠ 1 → q ≤ k^4 →
      q ∉ exceptional_moduli k c →
      ‖∑ m ∈ Finset.Ioc (k/2) k, χ (m : ZMod q)*(ArithmeticFunction.vonMangoldt m : ℂ)‖ ≤
        C*(k : ℝ)/Real.log k := by sorry

def exceptional_indices (n d : ℤ) (k : ℕ) (moduli : Finset ℕ) : Finset ℕ := by
  classical
  exact (Finset.range k).filter (fun i => ∃ q ∈ moduli, 0 < q ∧ ∃ r : ℕ,
    0 < r ∧ r ∣ q ∧ (q : ℝ)^(1/3 : ℝ)/2 ≤ r ∧ (r : ℤ) ∣ term n d i)
lemma exceptional_indices_mem (n d : ℤ) (k : ℕ) (moduli : Finset ℕ) (i : ℕ) :
    i ∈ exceptional_indices n d k moduli ↔ i < k ∧ ∃ q ∈ moduli, 0 < q ∧ ∃ r : ℕ,
      0 < r ∧ r ∣ q ∧ (q : ℝ)^(1/3 : ℝ)/2 ≤ r ∧ (r : ℤ) ∣ term n d i := by sorry
lemma exceptional_indices_empty_moduli (n d : ℤ) (k : ℕ) :
    exceptional_indices n d k ∅ = ∅ := by sorry
lemma exceptional_indices_mono (n d : ℤ) (k : ℕ) (s t : Finset ℕ) (hst : s ⊆ t) :
    exceptional_indices n d k s ⊆ exceptional_indices n d k t := by sorry
-- TauCeti.ProgressionPowers.exceptional_indices_empty
example (n d : ℤ) (k : ℕ) : exceptional_indices n d k ∅ = ∅ := by sorry
-- TauCeti.ProgressionPowers.exceptional_indices_large_divisor
example : 0 ∈ exceptional_indices 1000 1 3 {1000} := by sorry
-- TauCeti.ProgressionPowers.exceptional_indices_sample
example : exceptional_indices 1 1 4 {8} = Finset.range 4 := by sorry
theorem exceptional_indices_sparse (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ k ≥ K, ∀ n d : ℤ,
      n ≠ 0 → d ≠ 0 → Int.gcd n d = 1 →
      ((exceptional_indices n d k (exceptional_moduli k c)).card : ℝ) ≤
        C*(k : ℝ)/(Real.log k)^(1/4 : ℝ) := by sorry
def addendum_witness (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (c : ℝ) : Triple := by sorry
lemma addendum_witness_mem (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ), K ≤ k → Hplus n d k y ell →
      let a := addendum_witness n d k y ell c
      a ∈ ap_triples k ∧ a.2.1=a.1+1 ∧ a.2.2=a.1+2 ∧ a.1 % 3 = 0 := by sorry
lemma addendum_witness_avoid (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ), K ≤ k → Hplus n d k y ell →
      let a := addendum_witness n d k y ell c
      a.1 ∉ exceptional_indices n d k (exceptional_moduli k c) ∧
        a.2.1 ∉ exceptional_indices n d k (exceptional_moduli k c) ∧
        a.2.2 ∉ exceptional_indices n d k (exceptional_moduli k c) := by sorry
lemma addendum_witness_size (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ), K ≤ k → Hplus n d k y ell →
      let a := addendum_witness n d k y ell c
      familyN n d k y ell a ≤ 8*smallCoeff n d k ell a.1 *
        smallCoeff n d k ell a.2.1 * smallCoeff n d k ell a.2.2 ∧
      8*smallCoeff n d k ell a.1 * smallCoeff n d k ell a.2.1 * smallCoeff n d k ell a.2.2 ≤ k^4 := by sorry
-- TauCeti.ProgressionPowers.addendum_witness_same
example (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ), K ≤ k → Hplus n d k y ell →
      let a := addendum_witness n d k y ell c
      (a.1 ∉ exceptional_indices n d k (exceptional_moduli k c) ∧
        a.2.1 ∉ exceptional_indices n d k (exceptional_moduli k c) ∧
        a.2.2 ∉ exceptional_indices n d k (exceptional_moduli k c)) ∧
        familyN n d k y ell a ≤ k^4 := by sorry
-- TauCeti.ProgressionPowers.addendum_witness_disjoint
example (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ), K ≤ k → Hplus n d k y ell →
      let a := addendum_witness n d k y ell c
      ∃ j : ℕ, a=(3*j,3*j+1,3*j+2) := by sorry
-- TauCeti.ProgressionPowers.addendum_witness_scale
example : (8 : ℝ)*(64 : ℝ)^(7/2 : ℝ) = (64 : ℝ)^4 := by sorry
lemma conductor_detection (c : ℝ) (hc : 0 < c) (hp : boundedPage c) :
    ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ), K ≤ k → Hplus n d k y ell →
      familyN n d k y ell (addendum_witness n d k y ell c) ∉ exceptional_moduli k c := by sorry
theorem granville_route_bound : ∃ K : ℕ, ∀ (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ),
    Hplus n d k y ell → k ≤ K := by sorry
theorem effective_prime_bound : ∃ k0 : ℕ, 5 ≤ k0 ∧
    ∀ (k : ℕ) (n d y : ℤ) (ell : ℕ), k0 ≤ k → 0 < k → Int.gcd n d = 1 → ell.Prime →
      (∏ i ∈ Finset.range k, term n d i) = y^ell →
      y*d=0 ∨ (ell : ℝ) ≤ Real.exp (10^k : ℝ) := by sorry
-- The logical existential above does not certify computability of k0. The exact
-- effective dependency ledger in the README is a separate mathematical obligation.
theorem fixed_exponent_finiteness (k ell : ℕ) (hk : 5 ≤ k) (he : 2 ≤ ell) :
    {t : ℤ × ℤ × ℤ | Int.gcd t.1 t.2.1 = 1 ∧ t.2.2*t.2.1 ≠ 0 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2^ell}.Finite := by sorry
lemma composite_exponent_reduction (y : ℤ) (ell p : ℕ) (he : 2 ≤ ell)
    (hp : p.Prime) (hpe : p ∣ ell) :
    y^ell = (y^(ell/p))^p ∧
    (∀ (k : ℕ) (n d : ℤ), 5 ≤ k → y*d ≠ 0 →
      (∏ i ∈ Finset.range k, term n d i)=y^ell → 1 < y.natAbs) ∧
    ∀ Y : ℤ, 1 < Y.natAbs → {t : ℤ × ℕ | 0 < t.2 ∧ t.1^t.2=Y}.Finite := by sorry
theorem fixed_length_finiteness : ∃ k0 : ℕ, 5 ≤ k0 ∧ ∀ k ≥ k0,
    ({t : ℤ × ℤ × ℤ × ℕ | 0 < t.1 ∧ 0 < t.2.1 ∧ 0 < t.2.2.1 ∧ 2 ≤ t.2.2.2 ∧
      Int.gcd t.1 t.2.1 = 1 ∧ (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2.1^t.2.2.2}.Finite) ∧
    {t : ℤ × ℤ × ℤ × ℕ | t.2.2.1*t.2.1 ≠ 0 ∧ 2 ≤ t.2.2.2 ∧ Int.gcd t.1 t.2.1 = 1 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2.1^t.2.2.2}.Finite := by sorry

def erdos_threshold (K : ℕ) : Prop := ∀ (k : ℕ) (n d y : ℤ) (ell : ℕ),
  K ≤ k → 2 ≤ k → 0 < n → 0 < d → 0 < y → 2 ≤ ell → Int.gcd n d = 1 →
    (∏ i ∈ Finset.range k, term n d i) ≠ y^ell
lemma erdos_threshold_iff (K : ℕ) : erdos_threshold K ↔
    ∀ (k : ℕ) (n d y : ℤ) (ell : ℕ), K ≤ k → 2 ≤ k → 0 < n → 0 < d →
      0 < y → 2 ≤ ell → Int.gcd n d = 1 → (∏ i ∈ Finset.range k, term n d i) ≠ y^ell := by sorry
lemma erdos_threshold_mono (K L : ℕ) (hKL : K ≤ L) (h : erdos_threshold K) :
    erdos_threshold L := by sorry
lemma erdos_threshold_nonexistence (K k : ℕ) (h : erdos_threshold K) (hk : K ≤ k)
    (hk2 : 2 ≤ k) (n d y : ℤ) (ell : ℕ) (hn : 0 < n) (hd : 0 < d) (hy : 0 < y)
    (he : 2 ≤ ell) (hcop : Int.gcd n d = 1) :
    (∏ i ∈ Finset.range k, term n d i) ≠ y^ell := by sorry
-- TauCeti.ProgressionPowers.erdos_threshold_zero
example : ¬ erdos_threshold 0 := by sorry
-- TauCeti.ProgressionPowers.erdos_threshold_three
example : ¬ erdos_threshold 3 := by sorry
-- TauCeti.ProgressionPowers.erdos_threshold_positive_domain
example : primitive_solution (-3) 2 4 3 2 ∧ ¬ (0 < (-3 : ℤ)) := by sorry
-- The conjecture is the statement ∃ K, erdos_threshold K. It is not asserted
-- as a theorem or an axiom and is never a hypothesis of either analytic route.
def smooth_multiplier (tau : ℝ) (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (b : ℤ) : Prop :=
  0 < k ∧ ell.Prime ∧ Int.gcd n d = 1 ∧ y*d ≠ 0 ∧ b ≠ 0 ∧
    (∏ i ∈ Finset.range k, term n d i) = b*y^ell ∧
    ∀ p : ℕ, p.Prime → p ∣ b.natAbs → (p : ℝ) ≤ tau*k
lemma smooth_multiplier_iff (tau : ℝ) (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (b : ℤ) :
    smooth_multiplier tau n d k y ell b ↔ 0 < k ∧ ell.Prime ∧ Int.gcd n d = 1 ∧
      y*d ≠ 0 ∧ b ≠ 0 ∧ (∏ i ∈ Finset.range k, term n d i) = b*y^ell ∧
      ∀ p : ℕ, p.Prime → p ∣ b.natAbs → (p : ℝ) ≤ tau*k := by sorry
lemma smooth_multiplier_one (tau : ℝ) (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (ht : 0 ≤ tau) :
    smooth_multiplier tau n d k y ell 1 ↔ primitive_solution n d k y ell := by sorry
lemma smooth_multiplier_tau_mono (tau sigma : ℝ) (h : tau ≤ sigma)
    (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) (b : ℤ) :
    smooth_multiplier tau n d k y ell b → smooth_multiplier sigma n d k y ell b := by sorry
-- TauCeti.ProgressionPowers.smooth_multiplier_zero
example (tau : ℝ) (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) :
    ¬ smooth_multiplier tau n d k y ell 0 := by sorry
-- TauCeti.ProgressionPowers.smooth_multiplier_unit
example : smooth_multiplier 0 1 24 3 35 2 1 := by sorry
-- TauCeti.ProgressionPowers.smooth_multiplier_half_boundary
example (tau : ℝ) (h : tau < 1/2) : ¬ smooth_multiplier tau 1 1 2 1 2 2 := by sorry
-- No quantified smooth-multiplier extension is asserted from the Section11 announcement.
end TauCeti.ProgressionPowers
