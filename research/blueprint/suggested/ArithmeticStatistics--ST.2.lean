import Mathlib.Data.Set.Card
import Mathlib.NumberTheory.Divisors
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import TauCeti.RingTheory.Polynomial.Resultant.Discriminant

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
README is definitive. These suggested Lean forms help contributors and reviewers
converge on names and signatures; they do not claim an implementation.

ST.2 extends the accepted parent by actual coefficient-space and transporter
interfaces. Private coefficient adapters stand for imported ST.0/ST.1 conventions,
not new roadmap definitions. The omission register names the theorem signatures
whose arithmetic group/scheme, invariant or measure carriers are absent from the
pinned libraries. Those omissions are gaps; arbitrary predicates and count
functions do not stand in for them. All counts below have finite carriers.
-/

noncomputable section
open scoped BigOperators
open Polynomial
set_option autoImplicit false
set_option linter.unusedVariables false

namespace ArithmeticCountingRefinement

-- ArithmeticStatistics:ST.2/refinement-square-divisor-tail
-- The zero convention is removal of the singular locus, not its actual multiplicity.
def squareDivisorTail {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) : Set A :=
  {a | H a < X ∧ Delta a ≠ 0 ∧
    ∃ m : ℕ, M < m ∧ 0 < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a}

def squareDivisorMultiplicity {A : Type*} (Delta : A → ℤ)
    (M : ℕ) (a : A) : ℕ := by
  classical
  exact ((Delta a).natAbs.divisors.filter fun m =>
    M < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a).card

lemma tail_iff_multiplicity_pos {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M : ℕ) (X : ℝ) (a : A) (hH : H a < X) (hDelta : Delta a ≠ 0) :
    a ∈ squareDivisorTail Delta H M X ↔ 0 < squareDivisorMultiplicity Delta M a := by
  sorry

lemma tail_antitone {A : Type*} (Delta : A → ℤ) (H : A → ℝ)
    (M M' : ℕ) (X : ℝ) (hM : M ≤ M') :
    squareDivisorTail Delta H M' X ⊆ squareDivisorTail Delta H M X ∧
      ∀ a, squareDivisorMultiplicity Delta M' a ≤ squareDivisorMultiplicity Delta M a := by
  sorry

-- ArithmeticCountingRefinement.tail_36_5
example : () ∈ squareDivisorTail (fun _ : Unit => 36) (fun _ => 0) 5 1 ∧
    squareDivisorMultiplicity (fun _ : Unit => 36) 5 () = 1 := by
  sorry
-- ArithmeticCountingRefinement.tail_unit_empty
example (M : ℕ) (hM : 1 ≤ M) :
    squareDivisorTail (fun _ : Unit => 1) (fun _ => 0) M 1 = ∅ := by
  sorry
-- ArithmeticCountingRefinement.tail_zero_removed
example (M : ℕ) : squareDivisorTail (fun _ : Unit => 0) (fun _ => 0) M 1 = ∅ ∧
    squareDivisorMultiplicity (fun _ : Unit => 0) M () = 0 := by
  sorry

private abbrev Coeff (r : ℕ) := Fin r → ℤ
private def Congruent {r : ℕ} (q : ℕ) (a b : Coeff r) : Prop :=
  ∀ i, a i % (q : ℤ) = b i % (q : ℤ)

-- ArithmeticStatistics:ST.2/refinement-kappa-acceptable
-- Infinite-product convergence remains the parent congruence-function input.
def IsKappaAcceptable {r : ℕ} (kappa : ℕ) (Delta : Coeff r → ℤ)
    (phi : ℕ → Coeff r → ℝ) : Prop :=
  (∀ p, p.Prime → ∀ a, 0 ≤ phi p a ∧ phi p a ≤ 1) ∧
  (∀ p, p.Prime → ∀ a b, Congruent (p ^ kappa) a b → phi p a = phi p b) ∧
  ∃ P : ℕ, ∀ p, p.Prime → P < p → ∀ a, ¬ (p : ℤ) ^ 2 ∣ Delta a → phi p a = 1

lemma kappa_good_prime {r : ℕ} (kappa : ℕ) (Delta : Coeff r → ℤ)
    (phi : ℕ → Coeff r → ℝ) (h : IsKappaAcceptable kappa Delta phi) :
    ∃ P : ℕ, ∀ p, p.Prime → P < p → ∀ a,
      ¬ (p : ℤ) ^ 2 ∣ Delta a → phi p a = 1 := by
  sorry

lemma kappa_finite_product_residue {r : ℕ} (kappa : ℕ) (Delta : Coeff r → ℤ)
    (phi : ℕ → Coeff r → ℝ) (h : IsKappaAcceptable kappa Delta phi)
    (s : Finset ℕ) (hs : ∀ p ∈ s, p.Prime) (a b : Coeff r)
    (hab : Congruent ((∏ p ∈ s, p) ^ kappa) a b) :
    (∏ p ∈ s, phi p a) = ∏ p ∈ s, phi p b := by
  sorry

private def parityFactors (p : ℕ) (a : Coeff 1) : ℝ :=
  if p = 2 then if a 0 % 2 = 0 then 1 else 0 else 1
-- ArithmeticCountingRefinement.kappa_all_one
example (r : ℕ) (Delta : Coeff r → ℤ) :
    IsKappaAcceptable 0 Delta (fun _ _ => 1) := by
  sorry
-- ArithmeticCountingRefinement.kappa_parity
example : IsKappaAcceptable 1 (fun _ : Coeff 1 => 1) parityFactors := by
  sorry
-- ArithmeticCountingRefinement.kappa_zero_nonexample
example : ¬ IsKappaAcceptable 0 (fun _ : Coeff 1 => 1) parityFactors := by
  sorry

-- ArithmeticStatistics:ST.2/refinement-section-kernel
-- In the source application the transporter is finite by regular finite stabilizers.
def sectionKernel {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U) : ℝ := by
  classical
  exact ∑' g : G, if g • kappa (inv u) = u then Theta g * phi (inv u) else 0

lemma sectionKernel_zero {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (u : U) :
    sectionKernel inv kappa Theta (fun _ => 0) u = 0 := by
  sorry

lemma sectionKernel_unique {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) (phi : I → ℝ) (u : U)
    (g : G) (hg : g • kappa (inv u) = u)
    (hunique : ∀ h : G, h • kappa (inv u) = u → h = g) :
    sectionKernel inv kappa Theta phi u = Theta g * phi (inv u) := by
  sorry

private instance unitBoolAction : MulAction Unit Bool where
  smul _ b := b
  one_smul _ := rfl
  mul_smul _ _ _ := rfl
private instance unitUnitAction : MulAction Unit Unit where
  smul _ u := u
  one_smul _ := rfl
  mul_smul _ _ _ := rfl
-- ArithmeticCountingRefinement.kernel_unit
example : sectionKernel (fun _ : Unit => ()) (fun _ : Unit => ())
    (fun _ : Unit => (2 : ℝ)) (fun _ => 3) () = 6 := by
  sorry
-- ArithmeticCountingRefinement.kernel_empty_fibre
example : sectionKernel (fun _ : Bool => ()) (fun _ : Unit => false)
    (fun _ : Unit => (2 : ℝ)) (fun _ => 3) true = 0 := by
  sorry
-- ArithmeticCountingRefinement.kernel_zero_weight
example {G U I : Type*} [Group G] [MulAction G U]
    (inv : U → I) (kappa : I → U) (Theta : G → ℝ) :
    sectionKernel inv kappa Theta (fun _ => 0) = fun _ => 0 := by
  sorry

-- Private native adapters for imported ST.0 heights and ST.1 monic coefficients.
private def monicPolynomial (n : ℕ) (a : Coeff n) : ℤ[X] :=
  Polynomial.X ^ n + ∑ i : Fin n,
    Polynomial.C (a i) * Polynomial.X ^ (n - (i.val + 1))
private def monicDelta (n : ℕ) (a : Coeff n) : ℤ := (monicPolynomial n a).discr
private def weightedBox (n : ℕ) (X : ℝ) : Set (Coeff n) :=
  {a | ∀ i, |(a i : ℝ)| < X ^ (i.val + 1)}
private lemma weightedBox_finite (n : ℕ) (X : ℝ) : (weightedBox n X).Finite := by
  sorry
private def D (n : ℕ) : ℕ := n * (n + 1) / 2
private def count {A : Type*} (s : Set A) : ℝ := s.ncard
private def strongAt {r : ℕ} (Delta : Coeff r → ℤ) (p : ℕ) (a : Coeff r) : Prop :=
  ∀ b : Coeff r, (p : ℤ) ^ 2 ∣ Delta (fun i => a i + (p : ℤ) * b i)
private def weakAt {r : ℕ} (Delta : Coeff r → ℤ) (p : ℕ) (a : Coeff r) : Prop :=
  (p : ℤ) ^ 2 ∣ Delta a ∧ ¬ strongAt Delta p a
private def atEveryPrime {r : ℕ} (P : ℕ → Coeff r → Prop) (m : ℕ) (a : Coeff r) : Prop :=
  ∀ p : ℕ, p.Prime → p ∣ m → P p a
private def modulusUnion {r : ℕ} (box : Set (Coeff r)) (P : ℕ → Coeff r → Prop)
    (M : ℕ) : Set (Coeff r) :=
  {a | a ∈ box ∧ ∃ m : ℕ, M < m ∧ Squarefree m ∧ atEveryPrime P m a}
private def monicSummedTail (n : ℕ) (M : ℕ) (X : ℝ) : ℝ :=
  ∑ a ∈ (weightedBox_finite n X).toFinset, (squareDivisorMultiplicity (monicDelta n) M a : ℝ)

-- ArithmeticStatistics:ST.2/refinement-monic-rational-root-bound
-- Rational roots are tested over Q, retaining the actual integral coefficients.
theorem monic_rational_root_bound (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      count {a | a ∈ weightedBox n X ∧ ∃ t : ℚ,
        ((monicPolynomial n a).map (Int.castRingHom ℚ)).eval t = 0} ≤
      C * X ^ (D n - n + 1) * Real.log X := by
  sorry

-- ArithmeticStatistics:ST.2/refinement-monic-strong-tail
theorem monic_strong_tail (n : ℕ) (hn : 2 ≤ n) (epsilon : ℝ) (he : 0 < epsilon) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X → ∀ M : ℕ, 1 ≤ M →
      count (modulusUnion (weightedBox n X) (strongAt (monicDelta n)) M) ≤
      C * (X ^ ((D n : ℝ) + epsilon) / M + X ^ (D n - 1)) := by
  sorry

-- ArithmeticStatistics:ST.2/refinement-monic-weak-tail
theorem monic_weak_tail (n : ℕ) (hn : 3 ≤ n) (epsilon : ℝ) (he : 0 < epsilon) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X → ∀ M : ℕ, 1 ≤ M →
      count (modulusUnion (weightedBox n X) (weakAt (monicDelta n)) M) ≤
      C * (X ^ ((D n : ℝ) + epsilon) / M +
        X ^ ((D n : ℝ) - 1 / 5 + epsilon)) := by
  sorry

-- ArithmeticStatistics:ST.2/refinement-monic-summed-tail
theorem monic_summed_tail (n : ℕ) (hn : 2 ≤ n) (epsilon : ℝ) (he : 0 < epsilon) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X → ∀ M : ℕ, 1 ≤ M →
      monicSummedTail n M X ≤ C *
        (X ^ ((D n : ℝ) + epsilon) / Real.sqrt M +
          X ^ ((D n : ℝ) - 1 / 5 + epsilon)) := by
  sorry

private def quadraticBox (X : ℝ) : Set (Coeff 3) :=
  {a | ∀ i, |(a i : ℝ)| < X}
private lemma quadraticBox_finite (X : ℝ) : (quadraticBox X).Finite := by
  sorry
private def quadraticDelta (a : Coeff 3) : ℤ := a 1 ^ 2 - 4 * a 0 * a 2
private def quadraticSummedTail (M : ℕ) (X : ℝ) : ℝ :=
  ∑ a ∈ (quadraticBox_finite X).toFinset, (squareDivisorMultiplicity quadraticDelta M a : ℝ)

-- ArithmeticStatistics:ST.2/refinement-quadratic-binary-summed-tail
theorem quadratic_binary_summed_tail (epsilon : ℝ) (he : 0 < epsilon) :
    (∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X → ∀ M : ℕ, 1 ≤ M →
      quadraticSummedTail M X ≤ C * X ^ (3 + epsilon) / M) ∧
    (∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      count {a | a ∈ quadraticBox X ∧ quadraticDelta a = 0} ≤ C * X ^ (2 : ℕ)) := by
  sorry

end ArithmeticCountingRefinement

/-!
Omission register — native theorem interfaces.
Each entry is a target, not an opaque stand-in declaration. Parent and ST.1
names are imported mathematically; their unimplemented interfaces are explicit
packet gaps. The five expressible coefficient theorems above use native carriers.
- ArithmeticCountingRefinement.quartic_finite_congruence_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native.
- ArithmeticCountingRefinement.quartic_fixed_reducible_resolvent: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-quartic.
- ArithmeticCountingRefinement.quartic_nonmaximal_overramified_tail: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-quartic.
- ArithmeticCountingRefinement.quintic_finite_congruence_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native.
- ArithmeticCountingRefinement.quintic_nonmaximal_tail: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-quintic.
- ArithmeticCountingRefinement.global_field_generic_finite_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-global.
- ArithmeticCountingRefinement.global_field_large_prime_tail: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-global.
- ArithmeticCountingRefinement.global_field_large_local_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-global.
- ArithmeticCountingRefinement.cubic_secondary_congruence_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-secondary.
- ArithmeticCountingRefinement.cubic_secondary_sieve_error: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-secondary.
- ArithmeticCountingRefinement.monic_extra_reducible_bound: missing non-full-Galois-group/conjugate-factor locus and quantitative coefficient sieve; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.monic_distinguished_off_block: missing orthogonal marked-slice domain and torus measure; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.monic_q_cusp_tail: missing orthogonal marked-slice domain and torus measure; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.monic_fixed_modulus_sieve: missing orthogonal marked-slice domain and torus measure; G-weighted.
- ArithmeticCountingRefinement.invariant_geometric_sieve_criterion: missing native algebraic representation, relative invariant, finite affine projection/codimension and quotient measures; G-criterion.
- ArithmeticCountingRefinement.binary_strong_tail: missing fixed-degree binary invariant and marked pencil/domain; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.odd_binary_cusp_count: missing fixed-degree binary invariant and marked pencil/domain; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.odd_binary_weak_tail: missing fixed-degree binary invariant and marked pencil/domain; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.even_binary_small_discriminant: missing fixed-degree binary invariant and marked pencil/domain; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.even_binary_constant_term_tail: missing fixed-degree binary invariant and marked pencil/domain; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.even_binary_main_shallow: missing fixed-degree binary invariant and marked pencil/domain; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.even_binary_restricted_gram: missing fixed-degree binary invariant and marked pencil/domain; G-even.
- ArithmeticCountingRefinement.even_binary_restricted_deep_tail: missing fixed-degree binary invariant and marked pencil/domain; G-even.
- ArithmeticCountingRefinement.binary_summed_tail: missing fixed-degree binary invariant and marked pencil/domain; G-even.
- ArithmeticCountingRefinement.binary_fixed_modulus_sieve: missing fixed-degree binary invariant and marked pencil/domain; G-even, G-quadratic.
- ArithmeticCountingRefinement.pencil_finite_congruence_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native, G-selmer.
- ArithmeticCountingRefinement.pencil_infinite_weight_upper_bound: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.large_coefficient_family_tail: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.ternary_cubic_finite_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native, G-selmer.
- ArithmeticCountingRefinement.ternary_cubic_prime_tail: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.ternary_cubic_acceptable_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.quaternary_finite_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native, G-selmer.
- ArithmeticCountingRefinement.quaternary_prime_tail: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.quaternary_acceptable_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.quinary_finite_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native, G-selmer.
- ArithmeticCountingRefinement.quinary_prime_tail: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.quinary_acceptable_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-native and the direct supplier/prerequisite interfaces.
- ArithmeticCountingRefinement.smoothed_orbit_unfolding: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-smoothed.
- ArithmeticCountingRefinement.smoothed_quaternary_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-smoothed.
- ArithmeticCountingRefinement.number_field_twist_orbit_count: missing arithmetic action, quotient and normalized Haar/local-measure interfaces; G-twist.
- ArithmeticCountingRefinement.hypersurface_local_tail: missing universal projective coefficient family and local solubility measures; G-local.
- ArithmeticCountingRefinement.hypersurface_finite_local_count: missing universal projective coefficient family and local solubility measures; G-local.
- ArithmeticCountingRefinement.hypersurface_local_density: missing universal projective coefficient family and local solubility measures; G-local.
- All BGW and BS3/4/5 infinite weights also need the genuine p-adic coefficient
  measure, boundary-null and orbit stabilizer adapters, not arbitrary functions.
- The monic fixed-modulus sieve needs fixed real root-type volume and p-adic
  integrals even though its finite coordinate box is native.
-/
