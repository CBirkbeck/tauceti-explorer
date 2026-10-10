import Mathlib.Algebra.GCDMonoid.Finset
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Data.Int.Interval
import Mathlib.Data.Fintype.Pi
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Data.Nat.Squarefree
import Mathlib.Probability.ProbabilityMassFunction.Basic
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Tactic
import TauCeti.Order.Northcott
import TauCeti.GroupTheory.Perm.WreathProduct
import TauCeti.AlgebraicGeometry.AbelianVariety.Hom.Iso

/-!
# Arithmetic statistics: concrete families and normalizations
This file is not the roadmap and is not exhaustive. The reader document is definitive.
These forms suggest names and signatures for contributors and reviewers.
Signatures at the pinned baseline. Proofs are intentionally unfinished. The parent
family, density, squareclass and elliptic-curve plans are imported conceptually;
they are not redeclared here. Geometric adapters whose supplier types are absent
are identified explicitly at the end of this file, rather than encoded as Prop stubs.
-/
set_option linter.unusedVariables false
noncomputable section
open scoped BigOperators
open Polynomial Filter CategoryTheory
namespace ArithmeticStatistics.ST0


/- Integral coefficient boxes -/
def boxHeight {m : ℕ} (a : Fin m → ℤ) : ℕ := Finset.univ.sup (fun i => (a i).natAbs)
theorem boxHeight_le {m B : ℕ} (a : Fin m → ℤ) : boxHeight a ≤ B ↔ ∀ i, (a i).natAbs ≤ B := by
  sorry
theorem boxHeight_northcott (m : ℕ) : Northcott (@boxHeight m) := by
  sorry
theorem boxHeight_count (m B : ℕ) : Nat.card {a : Fin m → ℤ // boxHeight a ≤ B} = (2 * B + 1)^m := by
  sorry
theorem boxHeight_neg {m : ℕ} (a : Fin m → ℤ) : boxHeight (-a) = boxHeight a := by
  sorry
theorem box_test_three : Nat.card {a : Fin 1 → ℤ // boxHeight a ≤ 3} = 7 := by
  sorry

example : Nat.card {a : Fin 1 → ℤ // boxHeight a ≤ 3} = 7 := by
  sorry
theorem box_test_zero {m : ℕ} (a : Fin m → ℤ) : boxHeight a = 0 ↔ a = 0 := by
  sorry

example {m : ℕ} (a : Fin m → ℤ) : boxHeight a = 0 ↔ a = 0 := by
  sorry
theorem box_test_negative_cutoff {m : ℕ} [Northcott (@boxHeight m)] : TauCeti.normLE (@boxHeight m) (-1) = ∅ := by
  sorry

example {m : ℕ} [Northcott (@boxHeight m)] : TauCeti.normLE (@boxHeight m) (-1) = ∅ := by
  sorry


/- Weighted height of monic polynomials -/
def monicPolynomial {R : Type*} [CommRing R] (n : ℕ) (a : Fin n → R) : R[X] := X^n + ∑ i : Fin n, C (a i) * X^(n - 1 - i.val)
def weightedHeight {n : ℕ} (a : Fin n → ℤ) : ℝ := if h : n = 0 then 0 else Finset.univ.sup' (by exact ⟨⟨0, Nat.pos_of_ne_zero h⟩, Finset.mem_univ _⟩) (fun i => Real.rpow (|((a i : ℤ) : ℝ)|) ((i.val + 1 : ℝ)⁻¹))
theorem weightedHeight_le {n : ℕ} (a : Fin n → ℤ) (X : ℝ) (hX : 0 ≤ X) : weightedHeight a ≤ X ↔ ∀ i, |((a i : ℤ) : ℝ)| ≤ X^(i.val + 1) := by
  sorry
theorem weightedHeight_northcott (n : ℕ) : Northcott (@weightedHeight n) := by
  sorry
theorem monicPolynomial_monic {n : ℕ} {R : Type*} [CommRing R] [Nontrivial R] (a : Fin n → R) : (monicPolynomial n a).Monic ∧ (monicPolynomial n a).natDegree = n := by
  sorry
theorem weighted_test_quadratic : weightedHeight (![0,4] : Fin 2 → ℤ) = 2 := by
  sorry

example : weightedHeight (![0,4] : Fin 2 → ℤ) = 2 := by
  sorry
theorem weighted_test_unit_box : Nat.card {a : Fin 2 → ℤ // weightedHeight a ≤ 1} = 9 := by
  sorry

example : Nat.card {a : Fin 2 → ℤ // weightedHeight a ≤ 1} = 9 := by
  sorry
theorem weighted_test_degree_zero : monicPolynomial 0 (fun i : Fin 0 => Fin.elim0 i) = (1 : ℤ[X]) ∧ weightedHeight (fun i : Fin 0 => Fin.elim0 i) = 0 := by
  sorry

example : monicPolynomial 0 (fun i : Fin 0 => Fin.elim0 i) = (1 : ℤ[X]) ∧ weightedHeight (fun i : Fin 0 => Fin.elim0 i) = 0 := by
  sorry


/- Fixed-degree binary discriminant -/
def binaryDiscriminant (n : ℕ) : MvPolynomial (Fin (n+1)) ℤ := by
  sorry
def binaryDisc {R : Type*} [CommRing R] (n : ℕ) (a : Fin (n+1) → R) : R := MvPolynomial.eval₂ (Int.castRingHom R) a (binaryDiscriminant n)
theorem binaryDisc_monic {R : Type*} [CommRing R] [Nontrivial R] (n : ℕ) (a : Fin n → R) : binaryDisc n (Fin.cons 1 a) = (monicPolynomial n a).discr := by
  sorry
theorem binaryDisc_map {R T : Type*} [CommRing R] [CommRing T] (φ : R →+* T) (n : ℕ) (a : Fin (n+1) → R) : φ (binaryDisc n a) = binaryDisc n (φ ∘ a) := by
  sorry
theorem binaryDisc_scale {R : Type*} [CommRing R] (n : ℕ) (hn : 2 ≤ n) (c : R) (a : Fin (n+1) → R) : binaryDisc n (fun i => c * a i) = c^(2*n-2) * binaryDisc n a := by
  sorry
theorem binaryDisc_add_root {R : Type*} [CommRing R] (n : ℕ) (hn : 2 ≤ n) (a : Fin (n+1) → R) : binaryDisc (n+1) (Fin.snoc a 0) = binaryDisc n a * (a (Fin.last n))^2 := by
  sorry
theorem binary_test_quadratic (a b c : ℤ) : binaryDisc 2 ![a,b,c] = b^2-4*a*c := by
  sorry

example (a b c : ℤ) : binaryDisc 2 ![a,b,c] = b^2-4*a*c := by
  sorry
theorem binary_test_infinity : binaryDisc 2 (![0,1,0] : Fin 3 → ℤ) = 1 := by
  sorry

example : binaryDisc 2 (![0,1,0] : Fin 3 → ℤ) = 1 := by
  sorry
theorem binary_test_double_root : binaryDisc 2 (![0,0,1] : Fin 3 → ℤ) = 0 := by
  sorry

example : binaryDisc 2 (![0,0,1] : Fin 3 → ℤ) = 0 := by
  sorry


/- Finite binary squarefree-discriminant proportion -/
def binaryLocalProportion (n p : ℕ) : ℚ := (Nat.card {a : Fin (n+1) → ZMod (p^2) // binaryDisc n a ≠ 0} : ℚ) / (p : ℚ)^(2*(n+1))
theorem binaryLocalProportion_nonneg (n p : ℕ) : 0 ≤ binaryLocalProportion n p := by
  sorry
theorem binaryLocalProportion_le_one (n p : ℕ) (hp : 0 < p) : binaryLocalProportion n p ≤ 1 := by
  sorry
theorem binaryLocalProportion_lift (n p : ℕ) (hp : 0 < p) : Nat.card {a : Fin (n+1) → ZMod (p^2) // binaryDisc n a ≠ 0} = Nat.card {a : Fin (n+1) → ZMod (p^2) // ¬ (p : ℤ)^2 ∣ binaryDisc n (fun i => (a i).val : Fin (n+1) → ℤ)} := by
  sorry
theorem alpha_test_two_two : binaryLocalProportion 2 2 = 1/2 := by
  sorry

example : binaryLocalProportion 2 2 = 1/2 := by
  sorry
theorem alpha_test_three_two : binaryLocalProportion 3 2 = 3/8 := by
  sorry

example : binaryLocalProportion 3 2 = 3/8 := by
  sorry
theorem alpha_test_four_three : binaryLocalProportion 4 3 = 176/243 := by
  sorry

example : binaryLocalProportion 4 3 = 176/243 := by
  sorry


/- Finite monic discriminant probabilities -/
def monicValuationProportion (n p j : ℕ) : ℚ := let q := p^(j+1); (Nat.card {a : Fin n → ZMod q // (p : ℤ)^j ∣ (monicPolynomial n (fun i => (a i).val : Fin n → ℤ)).discr ∧ ¬ (p : ℤ)^(j+1) ∣ (monicPolynomial n (fun i => (a i).val : Fin n → ℤ)).discr} : ℚ) / (q : ℚ)^n
theorem monicProportion_nonneg (n p j : ℕ) : 0 ≤ monicValuationProportion n p j := by
  sorry
theorem monicProportion_le_one (n p j : ℕ) (hp : 0 < p) : monicValuationProportion n p j ≤ 1 := by
  sorry
theorem monicDisc_lift {n : ℕ} (q : ℕ) (a b : Fin n → ℤ) (h : ∀ i, (q : ℤ) ∣ a i - b i) : (q : ℤ) ∣ (monicPolynomial n a).discr - (monicPolynomial n b).discr := by
  sorry
theorem nu_test_linear_unit : monicValuationProportion 1 3 0 = 1 := by
  sorry

example : monicValuationProportion 1 3 0 = 1 := by
  sorry
theorem nu_test_linear_one : monicValuationProportion 1 3 1 = 0 := by
  sorry

example : monicValuationProportion 1 3 1 = 0 := by
  sorry
theorem nu_test_two : monicValuationProportion 2 2 1 = 0 := by
  sorry

example : monicValuationProportion 2 2 1 = 0 := by
  sorry
theorem nu_test_quartic_three : monicValuationProportion 4 3 1 = 8/81 := by
  sorry

example : monicValuationProportion 4 3 1 = 8/81 := by
  sorry


/- Strong and weak square divisibility -/
def StrongSquareDiv {m : ℕ} (D : (Fin m → ℤ) → ℤ) (p : ℕ) (a : Fin m → ℤ) : Prop := ∀ b : Fin m → ℤ, (p : ℤ)^2 ∣ D (a + (p : ℤ) • b)
def WeakSquareDiv {m : ℕ} (D : (Fin m → ℤ) → ℤ) (p : ℕ) (a : Fin m → ℤ) : Prop := (p : ℤ)^2 ∣ D a ∧ ¬ StrongSquareDiv D p a
theorem squareDiv_partition {m p : ℕ} (D : (Fin m → ℤ) → ℤ) (a : Fin m → ℤ) : (p : ℤ)^2 ∣ D a ↔ StrongSquareDiv D p a ∨ WeakSquareDiv D p a := by
  sorry
theorem strongSquareDiv_residue {m p : ℕ} (D : (Fin m → ℤ) → ℤ) (a b : Fin m → ℤ) : StrongSquareDiv D p (a + (p : ℤ) • b) ↔ StrongSquareDiv D p a := by
  sorry
def SquarefreeDivLocus {m : ℕ} (D : (Fin m → ℤ) → ℤ) (k : ℕ) (weak : Bool) : Set (Fin m → ℤ) := {a | ∀ p, p.Prime → p ∣ k → if weak then WeakSquareDiv D p a else StrongSquareDiv D p a}
theorem div_test_odd_weak : WeakSquareDiv (fun a : Fin 2 → ℤ => (monicPolynomial 2 a).discr) 3 ![0,9] := by
  sorry

example : WeakSquareDiv (fun a : Fin 2 → ℤ => (monicPolynomial 2 a).discr) 3 ![0,9] := by
  sorry
theorem div_test_triple_strong : StrongSquareDiv (fun a : Fin 3 → ℤ => (monicPolynomial 3 a).discr) 3 0 := by
  sorry

example : StrongSquareDiv (fun a : Fin 3 → ℤ => (monicPolynomial 3 a).discr) 3 0 := by
  sorry
theorem div_test_two_strong : StrongSquareDiv (fun a : Fin 2 → ℤ => (monicPolynomial 2 a).discr) 2 0 := by
  sorry

example : StrongSquareDiv (fun a : Fin 2 → ℤ => (monicPolynomial 2 a).discr) 2 0 := by
  sorry


/- Stickelberger congruence for binary forms -/
theorem binaryDisc_mod_four (n : ℕ) (hn : 2 ≤ n) (a : Fin (n+1) → ℤ) : binaryDisc n a % 4 = 0 ∨ binaryDisc n a % 4 = 1 := by
  sorry
theorem binary_no_weak_two (n : ℕ) (hn : 2 ≤ n) (a : Fin (n+1) → ℤ) : ¬ WeakSquareDiv (binaryDisc n) 2 a := by
  sorry


/- Correct monic local density formulas -/
theorem monic_nu_zero (n p : ℕ) (hp : p.Prime) : monicValuationProportion n p 0 = if n ≤ 1 then 1 else 1 - (p : ℚ)⁻¹ := by
  sorry
def nuOneFormula (n p : ℕ) : ℚ := if n ≤ 1 ∨ p = 2 then 0 else if n = 2 then (p : ℚ)⁻¹ * (1-(p : ℚ)⁻¹) else (1-(p : ℚ)⁻¹)^2 * (1-(- (p : ℚ))^(-(n-2 : ℤ))) / (p+1 : ℚ)
theorem monic_nu_one (n p : ℕ) (hp : p.Prime) : monicValuationProportion n p 1 = nuOneFormula n p := by
  sorry


/- Local monic maximality -/
def MonicPMaximal (p : ℕ) (f : ℤ[X]) : Prop := ∀ u : ℤ[X], u.Monic → Irreducible (u.map (Int.castRingHom (ZMod p))) → f ∉ Ideal.span ({C ((p : ℤ)^2), C (p : ℤ)*u, u^2} : Set ℤ[X])
theorem pMaximal_modulus {n p : ℕ} (a b : Fin n → ℤ) (h : ∀ i, (p : ℤ)^2 ∣ a i-b i) : MonicPMaximal p (monicPolynomial n a) ↔ MonicPMaximal p (monicPolynomial n b) := by
  sorry
theorem pMaximal_unit_disc (n p : ℕ) (hp : p.Prime) (a : Fin n → ℤ) (h : ¬ (p : ℤ) ∣ (monicPolynomial n a).discr) : MonicPMaximal p (monicPolynomial n a) := by
  sorry
theorem pMaximal_proportion (n p : ℕ) (hn : 2 ≤ n) (hp : p.Prime) : (Nat.card {a : Fin n → ZMod (p^2) // MonicPMaximal p (monicPolynomial n (fun i => (a i).val : Fin n → ℤ))} : ℚ) / (p : ℚ)^(2*n) = 1-(p : ℚ)⁻¹^2 := by
  sorry
theorem pMax_test_linear (p : ℕ) (hp : p.Prime) (b : ℤ) : MonicPMaximal p (X + C b) := by
  sorry

example (p : ℕ) (hp : p.Prime) (b : ℤ) : MonicPMaximal p (X + C b) := by
  sorry
theorem pMax_test_nonmaximal (p : ℕ) (hp : p.Prime) : ¬ MonicPMaximal p (X^2 : ℤ[X]) := by
  sorry

example (p : ℕ) (hp : p.Prime) : ¬ MonicPMaximal p (X^2 : ℤ[X]) := by
  sorry
theorem pMax_test_eisenstein : MonicPMaximal 3 (X^2-C 3 : ℤ[X]) := by
  sorry

example : MonicPMaximal 3 (X^2-C 3 : ℤ[X]) := by
  sorry


/- Binary local density formulas -/
theorem binary_alpha_odd (n p : ℕ) (hn : 2 ≤ n) (hp : p.Prime) (hodd : p ≠ 2) : binaryLocalProportion n p = if n = 2 then (1-(p : ℚ)⁻¹)*(1+(p : ℚ)⁻¹-(p : ℚ)⁻¹^3) else if n = 3 then (1-(p : ℚ)⁻¹)^2*(1+(p : ℚ)⁻¹)^2 else (1-(p : ℚ)⁻¹)^2*(1+(p : ℚ)⁻¹)*(1+(p : ℚ)⁻¹-(p : ℚ)⁻¹^2) := by
  sorry
theorem binary_alpha_two (n : ℕ) (hn : 2 ≤ n) : binaryLocalProportion n 2 = if n = 2 then 1/2 else 3/8 := by
  sorry


/- Acceptable monic local specifications -/
def KappaAcceptable (n κ : ℕ) (sigma : (p : ℕ) → Set (Fin n → ZMod (p^κ))) : Prop := 2 ≤ κ ∧ ∃ B : ℕ, ∀ p, p.Prime → B < p → ∀ a : Fin n → ℤ, ¬ (p : ℤ)^2 ∣ (monicPolynomial n a).discr → (fun i => (a i : ZMod (p^κ))) ∈ sigma p
def localSpecificationFamily (n κ : ℕ) (sigma : (p : ℕ) → Set (Fin n → ZMod (p^κ))) : Set (Fin n → ℤ) := {a | ∀ p, p.Prime → (fun i => (a i : ZMod (p^κ))) ∈ sigma p}
theorem kappaAcceptable_univ (n κ : ℕ) (hκ : 2 ≤ κ) : KappaAcceptable n κ (fun _ => Set.univ) := by
  sorry
theorem kappaAcceptable_inter {n κ : ℕ} (sigma Τ : (p : ℕ) → Set (Fin n → ZMod (p^κ))) (hsigma : KappaAcceptable n κ sigma) (hΤ : KappaAcceptable n κ Τ) : KappaAcceptable n κ (fun p => sigma p ∩ Τ p) := by
  sorry
theorem localSpecificationFamily_mono {n κ : ℕ} (sigma Τ : (p : ℕ) → Set (Fin n → ZMod (p^κ))) (h : ∀ p, sigma p ⊆ Τ p) : localSpecificationFamily n κ sigma ⊆ localSpecificationFamily n κ Τ := by
  sorry
theorem kappa_test_all : KappaAcceptable 2 2 (fun _ => Set.univ) := by
  sorry

example : KappaAcceptable 2 2 (fun _ => Set.univ) := by
  sorry
theorem kappa_test_empty : ¬ KappaAcceptable 1 2 (fun _ => ∅) := by
  sorry

example : ¬ KappaAcceptable 1 2 (fun _ => ∅) := by
  sorry
theorem kappa_test_finite_exception : KappaAcceptable 1 2 (fun p => if p = 2 then ∅ else Set.univ) ∧ localSpecificationFamily 1 2 (fun p => if p = 2 then ∅ else Set.univ) = ∅ := by
  sorry

example : KappaAcceptable 1 2 (fun p => if p = 2 then ∅ else Set.univ) ∧ localSpecificationFamily 1 2 (fun p => if p = 2 then ∅ else Set.univ) = ∅ := by
  sorry


/- Primitive projective coefficient family -/
def PrimitiveCoefficients (m : ℕ) := {a : Fin m → ℤ // Finset.univ.gcd (fun i => (a i).natAbs) = 1}
def coefficientSignSetoid (m : ℕ) : Setoid (PrimitiveCoefficients m) where
  r a b := a.val = b.val ∨ a.val = -b.val
  iseqv := by sorry
def HypersurfaceCoefficients (m : ℕ) := Quotient (coefficientSignSetoid m)
def euclideanHeightSq {m : ℕ} (a : Fin m → ℤ) : ℕ := ∑ i, (a i).natAbs^2
theorem euclideanHeightSq_neg {m : ℕ} (a : Fin m → ℤ) : euclideanHeightSq (-a) = euclideanHeightSq a := by
  sorry
def hypersurfaceHeightSq {m : ℕ} : HypersurfaceCoefficients m → ℕ := Quotient.lift (fun a => euclideanHeightSq a.val) (by sorry)
theorem hypersurfaceHeight_northcott (m : ℕ) : Northcott (@hypersurfaceHeightSq m) := by
  sorry
theorem primitiveSign_fiber {m : ℕ} (a : HypersurfaceCoefficients m) : Nat.card {b : PrimitiveCoefficients m // Quotient.mk (coefficientSignSetoid m) b = a} = 2 := by
  sorry
theorem hypersurface_test_zero (m : ℕ) : Finset.univ.gcd (fun i : Fin m => ((0 : Fin m → ℤ) i).natAbs) ≠ 1 := by
  sorry

example (m : ℕ) : Finset.univ.gcd (fun i : Fin m => ((0 : Fin m → ℤ) i).natAbs) ≠ 1 := by
  sorry
theorem hypersurface_test_norm : euclideanHeightSq (![1,1] : Fin 2 → ℤ) = 2 ∧ boxHeight (![1,1] : Fin 2 → ℤ) = 1 := by
  sorry

example : euclideanHeightSq (![1,1] : Fin 2 → ℤ) = 2 ∧ boxHeight (![1,1] : Fin 2 → ℤ) = 1 := by
  sorry
theorem hypersurface_test_sign : (coefficientSignSetoid 2).r ⟨![1,2], by sorry⟩ ⟨![-1,-2], by sorry⟩ ∧ ¬ (coefficientSignSetoid 2).r ⟨![1,2], by sorry⟩ ⟨![2,1], by sorry⟩ := by
  sorry

example : (coefficientSignSetoid 2).r ⟨![1,2], by sorry⟩ ⟨![-1,-2], by sorry⟩ ∧ ¬ (coefficientSignSetoid 2).r ⟨![1,2], by sorry⟩ ⟨![2,1], by sorry⟩ := by
  sorry


/- Finite local-solubility coefficient set -/
def FiniteLocalCoefficients {m v Q : ℕ} (eval : (Fin m → ZMod Q) → (Fin v → ZMod Q) → ZMod Q) : Set (Fin m → ZMod Q) := {a | Nat.Coprime Q (Finset.univ.gcd (fun i => (a i).val)) ∧ ∃ x : Fin v → ZMod Q, Nat.Coprime Q (Finset.univ.gcd (fun i => (x i).val)) ∧ eval a x = 0}
theorem finiteLocal_mem {m v Q : ℕ} (eval : (Fin m → ZMod Q) → (Fin v → ZMod Q) → ZMod Q) (a : Fin m → ZMod Q) : a ∈ FiniteLocalCoefficients eval ↔ Nat.Coprime Q (Finset.univ.gcd (fun i => (a i).val)) ∧ ∃ x : Fin v → ZMod Q, Nat.Coprime Q (Finset.univ.gcd (fun i => (x i).val)) ∧ eval a x = 0 := by
  sorry
theorem finiteLocal_finite {m v Q : ℕ} [NeZero Q] (eval : (Fin m → ZMod Q) → (Fin v → ZMod Q) → ZMod Q) : (FiniteLocalCoefficients eval).Finite := by
  sorry
theorem finiteLocal_positive_count {m v Q : ℕ} [NeZero Q] (eval : (Fin m → ZMod Q) → (Fin v → ZMod Q) → ZMod Q) (a : Fin m → ZMod Q) (ha : Nat.Coprime Q (Finset.univ.gcd (fun i => (a i).val))) : a ∈ FiniteLocalCoefficients eval ↔ 0 < Nat.card {x : Fin v → ZMod Q // Nat.Coprime Q (Finset.univ.gcd (fun i => (x i).val)) ∧ eval a x = 0} := by
  sorry
theorem finiteLocal_test_one (m v : ℕ) (eval : (Fin m → ZMod 1) → (Fin v → ZMod 1) → ZMod 1) : FiniteLocalCoefficients eval = Set.univ := by
  sorry

example (m v : ℕ) (eval : (Fin m → ZMod 1) → (Fin v → ZMod 1) → ZMod 1) : FiniteLocalCoefficients eval = Set.univ := by
  sorry
theorem finiteLocal_test_no_root : FiniteLocalCoefficients (fun (_ : Fin 1 → ZMod 2) (_ : Fin 1 → ZMod 2) => 1) = ∅ := by
  sorry

example : FiniteLocalCoefficients (fun (_ : Fin 1 → ZMod 2) (_ : Fin 1 → ZMod 2) => 1) = ∅ := by
  sorry
theorem finiteLocal_test_zero_coeff : (0 : Fin 2 → ZMod 2) ∉ FiniteLocalCoefficients (fun (_ : Fin 2 → ZMod 2) (_ : Fin 2 → ZMod 2) => 0) := by
  sorry

example : (0 : Fin 2 → ZMod 2) ∉ FiniteLocalCoefficients (fun (_ : Fin 2 → ZMod 2) (_ : Fin 2 → ZMod 2) => 0) := by
  sorry


/- Hyperelliptic equation models -/
def HyperellipticModels (g : ℕ) := {a : Fin (2*g+3) → ℤ // binaryDisc (2*g+2) a ≠ 0}
def modelHeight {g : ℕ} (a : HyperellipticModels g) : ℕ := boxHeight a.val
theorem modelHeight_northcott (g : ℕ) : Northcott (@modelHeight g) := by
  sorry
theorem model_count_le_box (g B : ℕ) : Nat.card {a : HyperellipticModels g // modelHeight a ≤ B} ≤ (2*B+1)^(2*g+3) := by
  sorry
theorem model_test_zero_excluded (g : ℕ) (hg : 1 ≤ g) : binaryDisc (2*g+2) (0 : Fin (2*g+3) → ℤ) = 0 := by
  sorry

example (g : ℕ) (hg : 1 ≤ g) : binaryDisc (2*g+2) (0 : Fin (2*g+3) → ℤ) = 0 := by
  sorry
theorem model_test_two_equations : (![1,0,0,0,1] : Fin 5 → ℤ) ≠ ![4,0,0,0,4] ∧ binaryDisc 4 (![1,0,0,0,1] : Fin 5 → ℤ) ≠ 0 ∧ binaryDisc 4 (![4,0,0,0,4] : Fin 5 → ℤ) ≠ 0 := by
  sorry

example : (![1,0,0,0,1] : Fin 5 → ℤ) ≠ ![4,0,0,0,4] ∧ binaryDisc 4 (![1,0,0,0,1] : Fin 5 → ℤ) ≠ 0 ∧ binaryDisc 4 (![4,0,0,0,4] : Fin 5 → ℤ) ≠ 0 := by
  sorry
theorem model_test_height : boxHeight (![1,0,0,0,1] : Fin 5 → ℤ) = 1 ∧ boxHeight (![4,0,0,0,4] : Fin 5 → ℤ) = 4 := by
  sorry

example : boxHeight (![1,0,0,0,1] : Fin 5 → ℤ) = 1 ∧ boxHeight (![4,0,0,0,4] : Fin 5 → ℤ) = 4 := by
  sorry


/- Odd-prime root criterion -/


/- Source-specific density denominators -/
theorem ratio_denominator_test (a b c : ℝ) (hb : b ≠ 0) (hc : c ≠ 0) : (a / b) * (b / c) = a / c := by
  sorry
theorem density_test_relative : (30 : ℚ)/40 = 3/4 ∧ (30 : ℚ)/100 = 3/10 := by
  sorry

example : (30 : ℚ)/40 = 3/4 ∧ (30 : ℚ)/100 = 3/10 := by
  sorry
theorem density_test_local : ((3 : ℚ)/10)/((4 : ℚ)/10) = 3/4 := by
  sorry

example : ((3 : ℚ)/10)/((4 : ℚ)/10) = 3/4 := by
  sorry
theorem density_test_empty : (0 : ℚ)/0 = 0 := by
  sorry

example : (0 : ℚ)/0 = 0 := by
  sorry


/- Stevenhagen radicand family -/
def PellRadicand (d : ℕ) : Prop := 0 < d ∧ Squarefree d ∧ ∀ p, p.Prime → p ∣ d → p = 2 ∨ p % 4 = 1
def NegativePellSoluble (d : ℕ) : Prop := ∃ x y : ℤ, x^2 - (d : ℤ)*y^2 = -1
theorem pellRadicand_finite (B : ℕ) : {d : ℕ | PellRadicand d ∧ d ≤ B}.Finite := by
  sorry
def quadraticRadicandDisc (d : ℕ) : ℕ := if d % 4 = 1 then d else 4*d
theorem pell_no_three_mod_four {d p : ℕ} (hd : PellRadicand d) (hp : p.Prime) (hpd : p ∣ d) : p % 4 ≠ 3 := by
  sorry
theorem pell_test_admitted : PellRadicand 1 ∧ PellRadicand 2 ∧ PellRadicand 5 ∧ PellRadicand 10 := by
  sorry

example : PellRadicand 1 ∧ PellRadicand 2 ∧ PellRadicand 5 ∧ PellRadicand 10 := by
  sorry
theorem pell_test_rejected : ¬ PellRadicand 3 ∧ ¬ PellRadicand 6 := by
  sorry

example : ¬ PellRadicand 3 ∧ ¬ PellRadicand 6 := by
  sorry
theorem pell_test_ordering : quadraticRadicandDisc 2 = 8 ∧ quadraticRadicandDisc 5 = 5 := by
  sorry

example : quadraticRadicandDisc 2 = 8 ∧ quadraticRadicandDisc 5 = 5 := by
  sorry


/- Number-field permutation-type adapter -/
def HasPermutationType {E : Type*} [Group E] {n : ℕ} (ρ : E →* Equiv.Perm (Fin n)) (Γ : Subgroup (Equiv.Perm (Fin n))) : Prop := ∃ σ : Equiv.Perm (Fin n), Subgroup.map (MulAut.conj σ).toMonoidHom ρ.range = Γ
theorem permutationType_self {E : Type*} [Group E] {n : ℕ} (ρ : E →* Equiv.Perm (Fin n)) : HasPermutationType ρ ρ.range := by
  sorry
theorem permutationType_relabel {E : Type*} [Group E] {n : ℕ} (ρ : E →* Equiv.Perm (Fin n)) (Γ : Subgroup (Equiv.Perm (Fin n))) (σ : Equiv.Perm (Fin n)) : HasPermutationType ((MulAut.conj σ).toMonoidHom.comp ρ) Γ ↔ HasPermutationType ρ Γ := by
  sorry
theorem permutationType_card {E : Type*} [Group E] {n : ℕ} (ρ : E →* Equiv.Perm (Fin n)) (Γ : Subgroup (Equiv.Perm (Fin n))) (h : HasPermutationType ρ Γ) : Nat.card ρ.range = Nat.card Γ := by
  sorry
theorem type_test_full_two : HasPermutationType (MonoidHom.id (Equiv.Perm (Fin 2))) ⊤ := by
  sorry

example : HasPermutationType (MonoidHom.id (Equiv.Perm (Fin 2))) ⊤ := by
  sorry
theorem type_test_trivial_not_full : ¬ HasPermutationType (1 : PUnit →* Equiv.Perm (Fin 2)) ⊤ := by
  sorry

example : ¬ HasPermutationType (1 : PUnit →* Equiv.Perm (Fin 2)) ⊤ := by
  sorry
theorem type_test_one : (⊤ : Subgroup (Equiv.Perm (Fin 1))) = ⊥ := by
  sorry

example : (⊤ : Subgroup (Equiv.Perm (Fin 1))) = ⊥ := by
  sorry


/- General number-field twist denominator -/


/- Unweighted finite-field abelian-variety count -/
def abelianIsoSetoid (K : Type*) [Field K] (g : ℕ) : Setoid {A : TauCeti.AlgebraicGeometry.AbelianVariety K // A.dim = (g : WithBot ℕ∞)} where
  r A B := Nonempty (A.val ≅ B.val)
  iseqv := by sorry
def UnpolarizedClasses (K : Type*) [Field K] (g : ℕ) := Quotient (abelianIsoSetoid K g)
def unpolarizedCount (K : Type*) [Field K] (g : ℕ) : ℕ := Nat.card (UnpolarizedClasses K g)
theorem unpolarizedClasses_finite (K : Type*) [Field K] [Finite K] (g : ℕ) : Finite (UnpolarizedClasses K g) := by
  sorry
theorem unpolarized_iso {K : Type*} [Field K] {g : ℕ} (A B : {A : TauCeti.AlgebraicGeometry.AbelianVariety K // A.dim = (g : WithBot ℕ∞)}) : Quotient.mk (abelianIsoSetoid K g) A = Quotient.mk (abelianIsoSetoid K g) B ↔ Nonempty (A.val ≅ B.val) := by
  sorry
theorem abelian_test_zero_dim (K : Type*) [Field K] [Finite K] : unpolarizedCount K 0 = 1 := by
  sorry

example (K : Type*) [Field K] [Finite K] : unpolarizedCount K 0 = 1 := by
  sorry
theorem abelian_test_iso {K : Type*} [Field K] {g : ℕ} (A B : {A : TauCeti.AlgebraicGeometry.AbelianVariety K // A.dim = (g : WithBot ℕ∞)}) (e : A.val ≅ B.val) : Quotient.mk (abelianIsoSetoid K g) A = Quotient.mk (abelianIsoSetoid K g) B := by
  sorry

example {K : Type*} [Field K] {g : ℕ} (A B : {A : TauCeti.AlgebraicGeometry.AbelianVariety K // A.dim = (g : WithBot ℕ∞)}) (e : A.val ≅ B.val) : Quotient.mk (abelianIsoSetoid K g) A = Quotient.mk (abelianIsoSetoid K g) B := by
  sorry
theorem abelian_test_mass_distinction : (1 : ℚ) ≠ (2 : ℚ)⁻¹ := by
  sorry

example : (1 : ℚ) ≠ (2 : ℚ)⁻¹ := by
  sorry


/- Principally polarized class count -/


/- Principal-polarization fiber -/
def polarizationOrbitCount {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] : ℕ := Nat.card (MulAction.orbitRel.Quotient (Aut A) Pol)
theorem polarizationOrbitCount_empty {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] [IsEmpty Pol] : polarizationOrbitCount A Pol = 0 := by
  sorry
theorem polarizationOrbitCount_single {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] [Unique Pol] : polarizationOrbitCount A Pol = 1 := by
  sorry
theorem polarizationOrbitCount_finite {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] [Finite Pol] : polarizationOrbitCount A Pol ≤ Nat.card Pol := by
  sorry
theorem pol_test_empty {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] [IsEmpty Pol] : polarizationOrbitCount A Pol = 0 := by
  sorry

example {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] [IsEmpty Pol] : polarizationOrbitCount A Pol = 0 := by
  sorry
theorem pol_test_unique {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] [Unique Pol] : polarizationOrbitCount A Pol = 1 := by
  sorry

example {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (Pol : Type*) [MulAction (Aut A) Pol] [Unique Pol] : polarizationOrbitCount A Pol = 1 := by
  sorry
theorem pol_test_infinite_group {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) [Infinite (Aut A)] (Pol : Type*) [MulAction (Aut A) Pol] [Unique Pol] : polarizationOrbitCount A Pol = 1 := by
  sorry

example {K : Type*} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) [Infinite (Aut A)] (Pol : Type*) [MulAction (Aut A) Pol] [Unique Pol] : polarizationOrbitCount A Pol = 1 := by
  sorry


/- Natural bundle probability law -/
def bundleMass (q n : ℕ) : ℝ := if n = 0 then (q-1 : ℝ)/(2*q) else ((q : ℝ)^2-1)/(2*(q : ℝ)^(n+1))
def bundleLaw (q : ℕ) (hq : 1 < q) : PMF ℕ := ⟨fun n => ENNReal.ofReal (bundleMass q n), by sorry⟩
theorem bundleMass_nonneg (q n : ℕ) (hq : 1 < q) : 0 ≤ bundleMass q n := by
  sorry
theorem bundleMass_sum (q : ℕ) (hq : 1 < q) : ∑' n, bundleMass q n = 1 := by
  sorry
theorem bundleMass_parity (q : ℕ) (hq : 1 < q) (r : Fin 2) : ∑' n, (if n % 2 = r.val then bundleMass q n else 0) = 1/2 := by
  sorry
def bundleAutOrder (q n : ℕ) : ℕ := if n = 0 then (q^2-1)*(q^2-q) else (q-1)^2*q^(n+1)
theorem bundleAutOrder_inverse_sum (q : ℕ) (hq : 1 < q) : (∑' n, (bundleAutOrder q n : ℝ)⁻¹) = 2/((q-1 : ℝ)^3*(q+1 : ℝ)) := by
  sorry
theorem bundleMass_from_aut (q n : ℕ) (hq : 1 < q) : bundleMass q n = ((q-1 : ℝ)^3*(q+1 : ℝ))/(2*(bundleAutOrder q n : ℝ)) := by
  sorry
theorem bundle_test_zero : bundleMass 3 0 = 1/3 := by
  sorry

example : bundleMass 3 0 = 1/3 := by
  sorry
theorem bundle_test_one : bundleMass 3 1 = 4/9 ∧ bundleMass 3 2 = 4/27 := by
  sorry

example : bundleMass 3 1 = 4/9 ∧ bundleMass 3 2 = 4/27 := by
  sorry
theorem bundle_test_aut : bundleAutOrder 3 0 = 48 ∧ bundleAutOrder 3 1 = 36 := by
  sorry

example : bundleAutOrder 3 0 = 48 ∧ bundleAutOrder 3 1 = 36 := by
  sorry
theorem bundle_test_normalization : (∑' n, (bundleAutOrder 3 n : ℝ)⁻¹) = 1/16 := by
  sorry

example : (∑' n, (bundleAutOrder 3 n : ℝ)⁻¹) = 1/16 := by
  sorry


/- Exact bundle parity tails -/
theorem bundle_parity_tail (q d : ℕ) (hq : 1 < q) : (∑' k, bundleMass q (d+2*k)) = if d = 0 then 1/2 else 1/(2*(q : ℝ)^(d-1)) := by
  sorry


/- Picard quotient by the hyperelliptic pencil -/
abbrev PicQuotient (P : Type*) [AddCommGroup P] (κ : P) := P ⧸ AddSubgroup.zmultiples κ
def picClass {P : Type*} [AddCommGroup P] (κ : P) : P →+ PicQuotient P κ := QuotientAddGroup.mk' (AddSubgroup.zmultiples κ)
def picParity {P : Type*} [AddCommGroup P] (deg : P →+ ℤ) (κ : P) (hκ : deg κ = 2) : PicQuotient P κ →+ ZMod 2 := QuotientAddGroup.lift (AddSubgroup.zmultiples κ) ((Int.castAddHom (ZMod 2)).comp deg) (by sorry)
theorem picQuotient_finite {P : Type*} [AddCommGroup P] (deg : P →+ ℤ) (κ : P) (hκ : deg κ = 2) (hd : Function.Surjective deg) [Finite deg.ker] : Finite (PicQuotient P κ) := by
  sorry
theorem picQuotient_card {P : Type*} [AddCommGroup P] (deg : P →+ ℤ) (κ : P) (hκ : deg κ = 2) (hd : Function.Surjective deg) [Finite deg.ker] : Nat.card (PicQuotient P κ) = 2 * Nat.card deg.ker := by
  sorry
theorem picParity_class {P : Type*} [AddCommGroup P] (deg : P →+ ℤ) (κ : P) (hκ : deg κ = 2) (L : P) : picParity deg κ hκ (picClass κ L) = (deg L : ZMod 2) := by
  sorry
theorem pic_test_degree_two : Nat.card (PicQuotient ℤ 2) = 2 := by
  sorry

example : Nat.card (PicQuotient ℤ 2) = 2 := by
  sorry
theorem pic_test_parity : picClass (2 : ℤ) 0 ≠ picClass (2 : ℤ) 1 := by
  sorry

example : picClass (2 : ℤ) 0 ≠ picClass (2 : ℤ) 1 := by
  sorry
theorem pic_test_tensor {P : Type*} [AddCommGroup P] (κ L : P) : picClass κ (L+κ) = picClass κ L := by
  sorry

example {P : Type*} [AddCommGroup P] (κ L : P) : picClass κ (L+κ) = picClass κ L := by
  sorry


/- Picard parity representatives and carry -/
theorem pic_unique_representative {P : Type*} [AddCommGroup P] (deg : P →+ ℤ) (κ : P) (hκ : deg κ = 2) (q : PicQuotient P κ) : ∃! L : P, picClass κ L = q ∧ (deg L = 0 ∨ deg L = 1) := by
  sorry
theorem pic_carry {P : Type*} [AddCommGroup P] (κ D x y : P) : picClass κ ((x+D)+(y+D)) = picClass κ (x+y-(κ-(2 : ℤ) • D)) := by
  sorry
theorem carry_test_nonsplit : Nat.card (PicQuotient (ℤ × ZMod 2) (2,1)) = 4 ∧ (2 : ℤ) • (picClass ((2 : ℤ), (1 : ZMod 2)) (1,0) : PicQuotient (ℤ × ZMod 2) (2,1)) ≠ (0 : PicQuotient (ℤ × ZMod 2) (2,1)) := by
  sorry

example : Nat.card (PicQuotient (ℤ × ZMod 2) (2,1)) = 4 ∧ (2 : ℤ) • (picClass ((2 : ℤ), (1 : ZMod 2)) (1,0) : PicQuotient (ℤ × ZMod 2) (2,1)) ≠ (0 : PicQuotient (ℤ × ZMod 2) (2,1)) := by
  sorry


/- Joint bundle pushforward from the Picard quotient -/
def jointFiberMass {Q : Type*} [Finite Q] (f g : Q → ℕ) (i j : ℕ) : ℚ := (Nat.card {x : Q // f x = i ∧ g x = j} : ℚ) / Nat.card Q
theorem jointFiberMass_nonneg {Q : Type*} [Finite Q] (f g : Q → ℕ) (i j : ℕ) : 0 ≤ jointFiberMass f g i j := by
  sorry
theorem jointFiberMass_equiv {Q R : Type*} [Finite Q] [Finite R] (e : Q ≃ R) (f g : R → ℕ) (i j : ℕ) : jointFiberMass (f ∘ e) (g ∘ e) i j = jointFiberMass f g i j := by
  sorry
theorem jointFiberMass_no_fiber {Q : Type*} [Finite Q] (f g : Q → ℕ) (i j : ℕ) (h : ∀ x, ¬ (f x = i ∧ g x = j)) : jointFiberMass f g i j = 0 := by
  sorry
theorem jointFiberMass_total {Q : Type*} [Finite Q] [Nonempty Q] (f g : Q → ℕ) : ∑' p : ℕ × ℕ, jointFiberMass f g p.1 p.2 = 1 := by
  sorry
theorem joint_test_diagonal : jointFiberMass (fun i : Fin 2 => i.val) (fun i : Fin 2 => i.val) 0 0 = 1/2 := by
  sorry

example : jointFiberMass (fun i : Fin 2 => i.val) (fun i : Fin 2 => i.val) 0 0 = 1/2 := by
  sorry
theorem joint_test_empty_cell : jointFiberMass (fun i : Fin 2 => i.val) (fun i : Fin 2 => i.val) 0 1 = 0 := by
  sorry

example : jointFiberMass (fun i : Fin 2 => i.val) (fun i : Fin 2 => i.val) 0 1 = 0 := by
  sorry
theorem joint_test_not_half_changed : jointFiberMass (fun _ : Fin 2 => 0) (fun _ : Fin 2 => 0) 0 0 = 1 := by
  sorry

example : jointFiberMass (fun _ : Fin 2 => 0) (fun _ : Fin 2 => 0) 0 0 = 1 := by
  sorry


/- Theta tail event bijections -/


/- Parity-compatible product probability -/
def parityProductMass (q : ℕ) (δ : Fin 2) (i j : ℕ) : ℝ := if (i+j)%2 = δ.val then 2 * bundleMass q i * bundleMass q j else 0
theorem parityProduct_support (q : ℕ) (δ : Fin 2) (i j : ℕ) (h : (i+j)%2 ≠ δ.val) : parityProductMass q δ i j = 0 := by
  sorry
theorem parityProduct_marginal (q : ℕ) (hq : 1 < q) (δ : Fin 2) (i : ℕ) : ∑' j, parityProductMass q δ i j = bundleMass q i := by
  sorry
theorem parityProduct_total (q : ℕ) (hq : 1 < q) (δ : Fin 2) : ∑' p : ℕ × ℕ, parityProductMass q δ p.1 p.2 = 1 := by
  sorry
theorem parity_test_same : parityProductMass 3 0 0 0 = 2/9 := by
  sorry

example : parityProductMass 3 0 0 0 = 2/9 := by
  sorry
theorem parity_test_opposite : parityProductMass 3 1 0 1 = 8/27 := by
  sorry

example : parityProductMass 3 1 0 1 = 8/27 := by
  sorry
theorem parity_test_forbidden : parityProductMass 3 1 0 0 = 0 := by
  sorry

example : parityProductMass 3 1 0 0 = 0 := by
  sorry


/- Hecke probability as a weighted pushforward -/
def heckePairPushforward {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] (μ : MeasureTheory.Measure X) (left right : X → B) : MeasureTheory.Measure (B × B) := MeasureTheory.Measure.map (fun x => (left x,right x)) μ
theorem heckePairPushforward_marginal {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] (μ : MeasureTheory.Measure X) (left right : X → B) (hl : Measurable left) (hr : Measurable right) : MeasureTheory.Measure.map Prod.fst (heckePairPushforward μ left right) = MeasureTheory.Measure.map left μ := by
  sorry
theorem heckePairPushforward_probability {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] (μ : MeasureTheory.Measure X) [MeasureTheory.IsProbabilityMeasure μ] (left right : X → B) (hl : Measurable left) (hr : Measurable right) : MeasureTheory.IsProbabilityMeasure (heckePairPushforward μ left right) := by
  sorry
theorem heckePairPushforward_dirac {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] [MeasurableSingletonClass B] (left right : X → B) (hl : Measurable left) (hr : Measurable right) (x : X) : heckePairPushforward (MeasureTheory.Measure.dirac x) left right = MeasureTheory.Measure.dirac (left x,right x) := by
  sorry
theorem hecke_test_diagonal {X : Type*} [MeasurableSpace X] [MeasurableSingletonClass X] (x : X) : heckePairPushforward (MeasureTheory.Measure.dirac x) id id = MeasureTheory.Measure.dirac (x,x) := by
  sorry

example {X : Type*} [MeasurableSpace X] [MeasurableSingletonClass X] (x : X) : heckePairPushforward (MeasureTheory.Measure.dirac x) id id = MeasureTheory.Measure.dirac (x,x) := by
  sorry
theorem hecke_test_one_point {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] [MeasurableSingletonClass B] (x : X) (b c : B) : heckePairPushforward (MeasureTheory.Measure.dirac x) (fun _ => b) (fun _ => c) = MeasureTheory.Measure.dirac (b,c) := by
  sorry

example {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] [MeasurableSingletonClass B] (x : X) (b c : B) : heckePairPushforward (MeasureTheory.Measure.dirac x) (fun _ => b) (fun _ => c) = MeasureTheory.Measure.dirac (b,c) := by
  sorry
theorem hecke_test_asymmetric {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] [MeasurableSingletonClass B] (x : X) (b c : B) (h : b ≠ c) : heckePairPushforward (MeasureTheory.Measure.dirac x) (fun _ => b) (fun _ => c) = MeasureTheory.Measure.dirac (b,c) := by
  sorry

example {X B : Type*} [MeasurableSpace X] [MeasurableSpace B] [MeasurableSingletonClass B] (x : X) (b c : B) (h : b ≠ c) : heckePairPushforward (MeasureTheory.Measure.dirac x) (fun _ => b) (fun _ => c) = MeasureTheory.Measure.dirac (b,c) := by
  sorry


/- Pointless genus-two bundle regression -/


/- Outside involutions in a wreath type -/
def OutsideInvolution {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (w : TauCeti.WreathProduct G (Fin 2)) : Prop := w ∈ H ∧ w^2 = 1 ∧ w.right ≠ 1
def canonicalSwap (G : Type*) [Group G] : TauCeti.WreathProduct G (Fin 2) := SemidirectProduct.inr (Equiv.swap 0 1)
theorem outside_ne_one {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (w : TauCeti.WreathProduct G (Fin 2)) (hw : OutsideInvolution H w) : w ≠ 1 := by
  sorry
theorem outside_conjugate {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (w : TauCeti.WreathProduct G (Fin 2)) (hw : OutsideInvolution H w) (h : H) : OutsideInvolution H (h.val * w * h.val⁻¹) := by
  sorry
theorem outside_finite {G : Type*} [Group G] [Finite G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : Finite {w // OutsideInvolution H w} := by
  sorry
theorem outside_test_swap {G : Type*} [Group G] : OutsideInvolution (⊤ : Subgroup (TauCeti.WreathProduct G (Fin 2))) (canonicalSwap G) := by
  sorry

example {G : Type*} [Group G] : OutsideInvolution (⊤ : Subgroup (TauCeti.WreathProduct G (Fin 2))) (canonicalSwap G) := by
  sorry
theorem outside_test_identity {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : ¬ OutsideInvolution H 1 := by
  sorry

example {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : ¬ OutsideInvolution H 1 := by
  sorry
theorem outside_test_trivial_G : Nat.card {w // OutsideInvolution (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2))) w} = 1 := by
  sorry

example : Nat.card {w // OutsideInvolution (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2))) w} = 1 := by
  sorry


/- Admissible wreath subgroup -/
def AdmissibleType {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : Prop := canonicalSwap G ∈ H ∧ Subgroup.closure {w | OutsideInvolution H w} = H ∧ ∀ g : G, ∃ w : TauCeti.WreathProduct G (Fin 2), w ∈ H ∧ w.right = 1 ∧ w.left 0 = g
theorem admissible_outside_nonempty {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (h : AdmissibleType H) : ∃ w, OutsideInvolution H w := by
  sorry
theorem admissible_coordinate_surjective {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (h : AdmissibleType H) : ∀ g : G, ∃ w : TauCeti.WreathProduct G (Fin 2), w ∈ H ∧ w.right = 1 ∧ w.left 0 = g := by
  sorry
theorem admissible_generated {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (h : AdmissibleType H) : Subgroup.closure {w | OutsideInvolution H w} = H := by
  sorry
theorem admissible_test_trivial : AdmissibleType (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2))) := by
  sorry

example : AdmissibleType (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2))) := by
  sorry
theorem admissible_test_bottom {G : Type*} [Group G] : ¬ AdmissibleType (⊥ : Subgroup (TauCeti.WreathProduct G (Fin 2))) := by
  sorry

example {G : Type*} [Group G] : ¬ AdmissibleType (⊥ : Subgroup (TauCeti.WreathProduct G (Fin 2))) := by
  sorry
theorem admissible_test_swap_only {G : Type*} [Group G] [Nontrivial G] : ¬ AdmissibleType (Subgroup.closure ({canonicalSwap G} : Set (TauCeti.WreathProduct G (Fin 2)))) := by
  sorry

example {G : Type*} [Group G] [Nontrivial G] : ¬ AdmissibleType (Subgroup.closure ({canonicalSwap G} : Set (TauCeti.WreathProduct G (Fin 2)))) := by
  sorry


/- Good embedded type -/
def GoodType {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : Prop := AdmissibleType H ∧ ∀ x y, OutsideInvolution H x → OutsideInvolution H y → ∃ h : H, y = h.val*x*h.val⁻¹
theorem good_admissible {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (h : GoodType H) : AdmissibleType H := by
  sorry
theorem good_conjugate {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (h : GoodType H) (x y : TauCeti.WreathProduct G (Fin 2)) (hx : OutsideInvolution H x) (hy : OutsideInvolution H y) : ∃ z : H, y = z.val*x*z.val⁻¹ := by
  sorry
theorem good_single_outside {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (ha : AdmissibleType H) (hc : ∀ x y, OutsideInvolution H x → OutsideInvolution H y → x = y) : GoodType H := by
  sorry
theorem good_test_trivial : GoodType (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2))) := by
  sorry

example : GoodType (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2))) := by
  sorry
theorem good_test_bottom {G : Type*} [Group G] : ¬ GoodType (⊥ : Subgroup (TauCeti.WreathProduct G (Fin 2))) := by
  sorry

example {G : Type*} [Group G] : ¬ GoodType (⊥ : Subgroup (TauCeti.WreathProduct G (Fin 2))) := by
  sorry
theorem good_test_diagonal_c2 : let H : Subgroup (TauCeti.WreathProduct (Multiplicative (ZMod 2)) (Fin 2)) := {carrier := {w | w.left 0 = w.left 1}, one_mem' := by sorry, mul_mem' := by sorry, inv_mem' := by sorry}; AdmissibleType H ∧ ¬ GoodType H := by
  sorry

example : let H : Subgroup (TauCeti.WreathProduct (Multiplicative (ZMod 2)) (Fin 2)) := {carrier := {w | w.left 0 = w.left 1}, one_mem' := by sorry, mul_mem' := by sorry, inv_mem' := by sorry}; AdmissibleType H ∧ ¬ GoodType H := by
  sorry


/- Type-preserving automorphisms -/
def typeAutomorphisms {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : Subgroup (MulAut G) where
  carrier := {α | Subgroup.map (TauCeti.WreathProduct.map α.toMonoidHom) H = H}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry
theorem typeAutomorphisms_mem {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) (α : MulAut G) : α ∈ typeAutomorphisms H ↔ Subgroup.map (TauCeti.WreathProduct.map α.toMonoidHom) H = H := by
  sorry
theorem typeAutomorphisms_finite {G : Type*} [Group G] [Finite G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : Finite (typeAutomorphisms H) := by
  sorry
theorem typeAutomorphisms_full {G : Type*} [Group G] : typeAutomorphisms (⊤ : Subgroup (TauCeti.WreathProduct G (Fin 2))) = ⊤ := by
  sorry
theorem typeAut_test_trivial : Nat.card (typeAutomorphisms (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2)))) = 1 := by
  sorry

example : Nat.card (typeAutomorphisms (⊤ : Subgroup (TauCeti.WreathProduct PUnit (Fin 2)))) = 1 := by
  sorry
theorem typeAut_test_c2 : Nat.card (typeAutomorphisms (⊤ : Subgroup (TauCeti.WreathProduct (Multiplicative (ZMod 2)) (Fin 2)))) = 1 ∧ Nat.card (TauCeti.WreathProduct (Multiplicative (ZMod 2)) (Fin 2)) = 8 := by
  sorry

example : Nat.card (typeAutomorphisms (⊤ : Subgroup (TauCeti.WreathProduct (Multiplicative (ZMod 2)) (Fin 2)))) = 1 ∧ Nat.card (TauCeti.WreathProduct (Multiplicative (ZMod 2)) (Fin 2)) = 8 := by
  sorry
theorem typeAut_test_identity {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : (1 : MulAut G) ∈ typeAutomorphisms H := by
  sorry

example {G : Type*} [Group G] (H : Subgroup (TauCeti.WreathProduct G (Fin 2))) : (1 : MulAut G) ∈ typeAutomorphisms H := by
  sorry


/- Continuous marked surjections -/
def ContinuousSurjections (Γ G : Type*) [Group Γ] [Group G] [TopologicalSpace Γ] [TopologicalSpace G] := {ρ : ContinuousMonoidHom Γ G // Function.Surjective ρ}
def continuousSurjectionKernel {Γ G : Type*} [Group Γ] [Group G] [TopologicalSpace Γ] [TopologicalSpace G] (ρ : ContinuousSurjections Γ G) : Subgroup Γ := ρ.val.toMonoidHom.ker
theorem continuousSurjection_aut_action {Γ G : Type*} [Group Γ] [Group G] [TopologicalSpace Γ] [TopologicalSpace G] [DiscreteTopology G] (ρ : ContinuousSurjections Γ G) (α : MulAut G) : Function.Surjective (α ∘ ρ.val) := by
  sorry
theorem continuousSurjection_same_kernel {Γ G : Type*} [Group Γ] [Group G] [TopologicalSpace Γ] [TopologicalSpace G] (ρ σ : ContinuousSurjections Γ G) (h : continuousSurjectionKernel ρ = continuousSurjectionKernel σ) : ∃! α : MulAut G, ∀ x, σ.val x = α (ρ.val x) := by
  sorry
theorem sur_test_trivial_target {Γ : Type*} [Group Γ] [TopologicalSpace Γ] : Nat.card (ContinuousSurjections Γ PUnit) = 1 := by
  sorry

example {Γ : Type*} [Group Γ] [TopologicalSpace Γ] : Nat.card (ContinuousSurjections Γ PUnit) = 1 := by
  sorry
theorem sur_test_trivial_source {G : Type*} [Group G] [Nontrivial G] [TopologicalSpace G] : IsEmpty (ContinuousSurjections PUnit G) := by
  sorry

example {G : Type*} [Group G] [Nontrivial G] [TopologicalSpace G] : IsEmpty (ContinuousSurjections PUnit G) := by
  sorry
theorem sur_test_not_injective : let ρ : Multiplicative (ZMod 4) →* Multiplicative (ZMod 2) := {toFun := fun x => Multiplicative.ofAdd (x.toAdd.val : ZMod 2), map_one' := by sorry, map_mul' := by sorry}; Function.Surjective ρ ∧ ¬ Function.Injective ρ := by
  sorry

example : let ρ : Multiplicative (ZMod 4) →* Multiplicative (ZMod 2) := {toFun := fun x => Multiplicative.ofAdd (x.toAdd.val : ZMod 2), map_one' := by sorry, map_mul' := by sorry}; Function.Surjective ρ ∧ ¬ Function.Injective ρ := by
  sorry


/- Marked global extensions and infinity conventions -/


/- Rigid finite-height and exact-slice averages -/
theorem wood_finite_multiplicity_transfer {K : Type*} (S : Finset K) (unrigid rigid : K → ℕ) (m : ℕ) (h : ∀ k ∈ S, rigid k = m * unrigid k) : (∑ k ∈ S, (rigid k : ℝ))/(S.card : ℝ) = (m : ℝ)*((∑ k ∈ S, (unrigid k : ℝ))/(S.card : ℝ)) := by
  sorry
theorem wood_average_test_trivial {K : Type*} (S : Finset K) (h : S.Nonempty) : (∑ _k ∈ S, (1 : ℝ))/(S.card : ℝ) = 1 := by
  sorry

example {K : Type*} (S : Finset K) (h : S.Nonempty) : (∑ _k ∈ S, (1 : ℝ))/(S.card : ℝ) = 1 := by
  sorry
theorem wood_average_test_empty {K : Type*} (w : K → ℝ) : (∑ k ∈ (∅ : Finset K), w k)/((∅ : Finset K).card : ℝ) = 0 := by
  sorry

example {K : Type*} (w : K → ℝ) : (∑ k ∈ (∅ : Finset K), w k)/((∅ : Finset K).card : ℝ) = 0 := by
  sorry
theorem wood_average_test_markings : ((6 : ℚ)/3) = 2*((3 : ℚ)/3) := by
  sorry

example : ((6 : ℚ)/3) = 2*((3 : ℚ)/3) := by
  sorry


/- Root-of-unity and tame refinement comparisons -/
theorem root_unity_test_torsion : let A := ZMod 3; (Nat.card {a : A // (2 : ℤ) • a = 0} = 1) ∧ (Nat.card {a : A // (6 : ℤ) • a = 0} = 3) := by
  sorry


/- Monic squarefree Euler constants -/
def monicSquarefreeFactor (n p : ℕ) : ℝ := (if n ≤ 1 then 1 else 1-(p : ℝ)⁻¹) + (nuOneFormula n p : ℝ)
def monicEulerProduct (n : ℕ) : ℝ := ∏' p : Nat.Primes, monicSquarefreeFactor n p.val
theorem monicEulerProduct_pos (n : ℕ) (hn : 2 ≤ n) : 0 < monicEulerProduct n := by
  sorry
theorem monicEulerProduct_limit : Filter.Tendsto monicEulerProduct Filter.atTop (nhds ((1/2 : ℝ) * ∏' p : {p : Nat.Primes // p.val ≠ 2}, (1 - (3*(p.val.val : ℝ)-1)/((p.val.val : ℝ)^2*(p.val.val+1 : ℝ))))) := by
  sorry
theorem lambda_test_two (n : ℕ) (hn : 2 ≤ n) : monicSquarefreeFactor n 2 = 1/2 := by
  sorry

example (n : ℕ) (hn : 2 ≤ n) : monicSquarefreeFactor n 2 = 1/2 := by
  sorry
theorem lambda_test_quartic : monicSquarefreeFactor 4 3 = 62/81 := by
  sorry

example : monicSquarefreeFactor 4 3 = 62/81 := by
  sorry
theorem lambda_test_quadratic_global : monicEulerProduct 2 = 4/Real.pi^2 := by
  sorry

example : monicEulerProduct 2 = 4/Real.pi^2 := by
  sorry

/-! ## Geometric signatures intentionally left unstated
The following exact names are reserved by the plan. The associated supplier
types are unavailable at this pin; the reader and packet give their statements
and reasons. These are omissions, never Prop-valued stubs.

`ArithmeticStatistics.ST0.binary_beta_formula`: The β_n(p) formula in this node, after the binary ring supplier is available.

`ArithmeticStatistics.ST0.odd_root_criterion`: For odd p and a monic degree-n integral polynomial, strong p²-divisibility is equivalent to its reduction having either at least two distinct repeated roots over Fp-bar or a root of multiplicity at least three. Among p²-divisible polynomials, weak divisibility means exactly one repeated root, which is an Fp-rational double root. For binary forms use projective roots, including infinity. The zero reduction is handled separately as strongly divisible for degree at least two. At p=2 this root criterion is not asserted.

`ArithmeticStatistics.ST0.twist_denominator_frontier`: For a number field F, the parent squareclass height H(t)=product of norms of finite primes with odd valuation has finite fibers. For a nonempty admissible finite set of local conditions sigma, one needs #sigma(X)=c_(F,sigma) X+o(X), c_(F,sigma)>0, where each squareclass is counted once. Admissible means local conditions are compatible with global squareclasses, not merely that each local set is individually nonempty. Its ideal-counting proof must distinguish classes modulo Cl(F)² and the finite unit/Selmer fibers. This precise input is an open supplier frontier; it is not obtained from Northcott finiteness.

`ArithmeticStatistics.ST0.ppavClasses`: The type of k-isomorphism classes of dimension-g principally polarized pairs.

`ArithmeticStatistics.ST0.ppavCount`: Nat.card of ppavClasses, after the finite-field finiteness input.

`ArithmeticStatistics.ST0.ppav_forget`: Forget λ to the unpolarized class.

`ArithmeticStatistics.ST0.ppavCount_fiber_sum`: A(k,g)=sigma_[A] # (principal polarizations of A modulo Aut_k(A)).

`ArithmeticStatistics.ST0.ppav_test_zero_dim`: A(k,0)=1.

`ArithmeticStatistics.ST0.ppav_test_elliptic`: A(k,1)=B(k,1): elliptic curves have a canonical principal polarization.

`ArithmeticStatistics.ST0.ppav_test_mass`: For a principally polarized elliptic curve with automorphism group of order 2, its class contributes 1 and its mass contributes 1/2.

`ArithmeticStatistics.ST0.principally_polarized_count`: A(k,g) is the number of k-isomorphism classes of pairs (A,λ), with A a dimension-g abelian variety and λ a principal polarization defined over k. An isomorphism f identifies the pairs when f∨ λ′ f=λ. Polarization means the ample line-bundle-induced symmetric isogeny, with the descent convention of AbelianSchemes; its native type is imported. This is an unweighted count, not the coarse moduli space k-point count or inverse-automorphism mass.

`ArithmeticStatistics.ST0.theta_tail_normalization`: Let h=#J(F_q). For a≥0, the event ν(L)∈a+1+2N in uniform Q has probability #Θ_(g−a)(F_q)/(2h), with Θ_d empty for d<0. For a,b≥0, write d₁=g−a,d₂=g−b. If deg M and d₁+d₂ have different parity the joint event for ν(L),ν(M⊗L^−1) is empty. Otherwise set M′=M⊗κ^((d₁+d₂−deg M)/2); the event is in bijection with Θ_d₁ ∩ (M′−Θ_d₂), and its probability is that intersection count divided by 2h. Conditional on its parity sector the denominator is h.

`ArithmeticStatistics.ST0.pointless_curve_regression`: For C/F₃ given by y²=2((x³−x)²+1), the smooth projective curve has genus 2, no F₃-points, fourteen F₉-points and #J(F₃)=4. Consequently Q has eight elements. Its exact bundle pushforward has μ_C(0)=1/2, μ_C(1)=3/8, μ_C(3)=1/8 and all other masses zero. This is a finite regression example, not the limiting natural μ₃. It detects both a spurious rational-point assumption on Pic¹ and a denominator h in place of 2h.

`ArithmeticStatistics.ST0.woodFullUnramifiedInfinityGroup`: Full profinite Galois group of K^(un,∞)/K, with its finite-quotient classification.

`ArithmeticStatistics.ST0.woodImaginaryType`: Image of the infinity-marked normal-closure embedding in the built wreath product.

`ArithmeticStatistics.ST0.woodRealTwistType`: Image of the normal-closure embedding attached to a real pair (ρ,y).

`ArithmeticStatistics.ST0.woodType_admissible`: Every resulting embedded type is admissible (Wood Proposition 2.2).

`ArithmeticStatistics.ST0.woodInfinity_test_full`: A quotient with order divisible by Δ must not be excluded merely by the prime-to-Δ group supplier.

`ArithmeticStatistics.ST0.woodInfinity_test_function_field`: Only the chosen sqrt(t) completion is in the imaginary function-field family, not every nonsplit completion.

`ArithmeticStatistics.ST0.woodInfinity_test_real`: A split-infinity real field has no canonical outside inertia involution; its rigid data include a twist y.

`ArithmeticStatistics.ST0.wood_infinity_and_type_adapter`: For Q or F_q(t), fix a separable closure and the specified infinity embedding. K^(un,∞) is the maximal extension unramified at every finite place and split at all places above infinity; it is the full extension, without a prime-to quotient. Imaginary number fields have nonsplit archimedean infinity; in the function-field case choose specifically the completion F_q((t^−1))(sqrt(t)), excluding the other nonsplit squareclass. Real means infinity splits. An imaginary marked surjection obtains a canonical outside involution from infinity and hence an actual embedded wreath image H. In the real case one instead chooses an outside order-two twist y; the rigid object is the pair (ρ,y).
-/

end ArithmeticStatistics.ST0
