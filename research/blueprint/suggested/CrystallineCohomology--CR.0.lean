/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so contributors and reviewers
can converge on names and interfaces. Every proposed declaration is unchecked.

The new tranche extends the pinned DividedPowers API. Inherited CR.4 declarations
whose enhanced suppliers are still missing are documented explicitly at the end.
-/
import Mathlib.RingTheory.DividedPowers.DPMorphism
import Mathlib.RingTheory.DividedPowers.SubDPIdeal
import Mathlib.RingTheory.DividedPowers.Padic
import Mathlib.RingTheory.DividedPowerAlgebra.Init
import Mathlib.RingTheory.Flat.EquationalCriterion
import Mathlib.RingTheory.Flat.Localization
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Polynomial.Basic
import TauCeti.RingTheory.DividedPowers.Associative

import Mathlib.RingTheory.Ideal.Operations
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
open Finset
noncomputable section
namespace TauCeti.PD
universe u v w
variable {A : Type u} [CommRing A] {I J : Ideal A}


-- CrystallineCohomology:CR.0/additive-powers
structure AdditivePowers (I : Ideal A) where
  dpow : ℕ → A → A
  null : ∀ {n x}, x ∉ I → dpow n x = 0
  zero : ∀ {x}, x ∈ I → dpow 0 x = 1
  one : ∀ {x}, x ∈ I → dpow 1 x = x
  mem : ∀ {n x}, n ≠ 0 → x ∈ I → dpow n x ∈ I
  add : ∀ {n x y}, x ∈ I → y ∈ I → dpow n (x+y) =
    ∑ k ∈ antidiagonal n, dpow k.1 x * dpow k.2 y
  smul : ∀ {n a x}, x ∈ I → dpow n (a*x) = a^n * dpow n x

def AdditivePowers.ofDividedPowers (γ : DividedPowers I) : AdditivePowers I := by sorry
lemma AdditivePowers.ofDividedPowers_dpow (γ : DividedPowers I) (n : ℕ) (x : A) : (AdditivePowers.ofDividedPowers γ).dpow n x = γ.dpow n x := by sorry
lemma AdditivePowers.ext (δ ε : AdditivePowers I) (h : ∀ n x, x ∈ I → δ.dpow n x = ε.dpow n x) : δ = ε := by sorry
-- test_candidate_zero_index: Degree zero at zero is one.
example (δ : AdditivePowers I) : δ.dpow 0 0 = 1 := by sorry
-- test_candidate_positive_at_zero: Degree two at zero is zero.
example (δ : AdditivePowers I) : δ.dpow 2 0 = 0 := by sorry
-- test_candidate_rational: Over Q, a candidate induced by γ agrees on I with the existing rational associative divided power.
example (K : Ideal ℚ) (γ : DividedPowers K) (n : ℕ) (x : ℚ) (hx : x ∈ K) : (AdditivePowers.ofDividedPowers γ).dpow n x = TauCeti.Associative.dividedPower n x := by sorry

-- CrystallineCohomology:CR.0/multiplication-addition
lemma AdditivePowers.mul_at_add (δ : AdditivePowers I) (x y : A) (hx : x ∈ I) (hy : y ∈ I)
  (h : ∀ z ∈ ({x,y} : Set A), ∀ m n : ℕ,
    δ.dpow m z * δ.dpow n z = (Nat.choose (m+n) m : A) * δ.dpow (m+n) z) :
  ∀ m n : ℕ, δ.dpow m (x+y) * δ.dpow n (x+y) =
    (Nat.choose (m+n) m : A) * δ.dpow (m+n) (x+y) := by sorry

-- CrystallineCohomology:CR.0/iteration-addition
lemma AdditivePowers.comp_at_add (δ : AdditivePowers I)
  (hmul : ∀ z ∈ I, ∀ m n : ℕ, δ.dpow m z * δ.dpow n z =
    (Nat.choose (m+n) m : A) * δ.dpow (m+n) z)
  (x y : A) (hx : x ∈ I) (hy : y ∈ I)
  (h : ∀ z ∈ ({x,y} : Set A), ∀ m n : ℕ, n ≠ 0 →
    δ.dpow m (δ.dpow n z) = (Nat.uniformBell m n : A) * δ.dpow (m*n) z) :
  ∀ m n : ℕ, n ≠ 0 → δ.dpow m (δ.dpow n (x+y)) =
    (Nat.uniformBell m n : A) * δ.dpow (m*n) (x+y) := by sorry

-- CrystallineCohomology:CR.0/generator-criterion
def AdditivePowers.toDividedPowers (δ : AdditivePowers I) (S : Set A) (hS : I = Ideal.span S)
  (hmul : ∀ z ∈ S, ∀ m n : ℕ, δ.dpow m z * δ.dpow n z =
    (Nat.choose (m+n) m : A) * δ.dpow (m+n) z)
  (hcomp : ∀ z ∈ S, ∀ m n : ℕ, n ≠ 0 → δ.dpow m (δ.dpow n z) =
    (Nat.uniformBell m n : A) * δ.dpow (m*n) z) : DividedPowers I := by sorry
lemma AdditivePowers.toDividedPowers_dpow (δ : AdditivePowers I) (S : Set A) (hS hm hc) (n : ℕ) (x : A) : (δ.toDividedPowers S hS hm hc).dpow n x = δ.dpow n x := by sorry
lemma AdditivePowers.toDividedPowers_unique (δ : AdditivePowers I) (S : Set A) (hS hm hc) (γ : DividedPowers I) (h : ∀ n x, x ∈ I → γ.dpow n x = δ.dpow n x) : γ = δ.toDividedPowers S hS hm hc := by sorry
lemma AdditivePowers.toDividedPowers_generators (δ : AdditivePowers I) (S T : Set A) (hS hm hc hT hmT hcT) : δ.toDividedPowers S hS hm hc = δ.toDividedPowers T hT hmT hcT := by sorry
-- test_generators_degree_two: The generated structure has the required quadratic mixed term.
example (δ : AdditivePowers I) (S : Set A) (hS hm hc) (x y : A) (hx : x ∈ I) (hy : y ∈ I) : (δ.toDividedPowers S hS hm hc).dpow 2 (x+y) = δ.dpow 2 x + x*y + δ.dpow 2 y := by sorry
-- test_generators_outside: The constructed total operation at degree zero outside I is zero, not one.
example (δ : AdditivePowers I) (S : Set A) (hS hm hc) (x : A) (hx : x ∉ I) : (δ.toDividedPowers S hS hm hc).dpow 0 x = 0 := by sorry
-- test_generators_inner_one: Iteration with inner index one gives back the unchanged operation.
example (δ : AdditivePowers I) (S : Set A) (hS hm hc) (n : ℕ) (x : A) (hx : x ∈ I) : (δ.toDividedPowers S hS hm hc).dpow n ((δ.toDividedPowers S hS hm hc).dpow 1 x) = δ.dpow n x := by sorry

-- CrystallineCohomology:CR.0/sum-convolution
def convolution (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (x y : A) : A := by sorry
lemma convolution_eq (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (x y : A) : convolution γ ε n x y = ∑ k ∈ antidiagonal n, γ.dpow k.1 x * ε.dpow k.2 y := by sorry
lemma convolution_swap (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (x y : A) : convolution γ ε n x y = convolution ε γ n y x := by sorry
lemma convolution_mem (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (hn : n ≠ 0) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : convolution γ ε n x y ∈ I ⊔ J := by sorry
-- test_convolution_zero: C₀(0,0)=1.
example (γ : DividedPowers I) (ε : DividedPowers J) : convolution γ ε 0 0 0 = 1 := by sorry
-- test_convolution_quadratic: C₂(x,y)=γ₂(x)+xy+ε₂(y).
example (γ : DividedPowers I) (ε : DividedPowers J) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : convolution γ ε 2 x y = γ.dpow 2 x + x*y + ε.dpow 2 y := by sorry
-- test_convolution_same: For a single PD structure Cₙ(x,y)=γₙ(x+y).
example (γ : DividedPowers I) (n : ℕ) (x y : A) (hx : x ∈ I) (hy : y ∈ I) : convolution γ γ n x y = γ.dpow n (x+y) := by sorry

-- CrystallineCohomology:CR.0/sum-independence
lemma convolution_independent (γ : DividedPowers I) (ε : DividedPowers J)
  (h : ∀ n x, x ∈ I ⊓ J → γ.dpow n x = ε.dpow n x)
  (n : ℕ) (x y x' y' : A) (hx : x ∈ I) (hy : y ∈ J)
  (hx' : x' ∈ I) (hy' : y' ∈ J) (heq : x+y = x'+y') :
  convolution γ ε n x y = convolution γ ε n x' y' := by sorry

-- CrystallineCohomology:CR.0/sum-candidate
def supCandidate (γ : DividedPowers I) (ε : DividedPowers J)
  (h : ∀ n x, x ∈ I ⊓ J → γ.dpow n x = ε.dpow n x) : AdditivePowers (I ⊔ J) := by sorry
lemma supCandidate_dpow_add (γ : DividedPowers I) (ε : DividedPowers J) (h) (n : ℕ) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : (supCandidate γ ε h).dpow n (x+y) = convolution γ ε n x y := by sorry
lemma supCandidate_left (γ : DividedPowers I) (ε : DividedPowers J) (h) (n : ℕ) (x : A) (hx : x ∈ I) : (supCandidate γ ε h).dpow n x = γ.dpow n x := by sorry
lemma supCandidate_right (γ : DividedPowers I) (ε : DividedPowers J) (h) (n : ℕ) (y : A) (hy : y ∈ J) : (supCandidate γ ε h).dpow n y = ε.dpow n y := by sorry
-- test_supCandidate_zero: At zero and degree zero, the sum candidate is one.
example (γ : DividedPowers I) (ε : DividedPowers J) (h) : (supCandidate γ ε h).dpow 0 0 = 1 := by sorry
-- test_supCandidate_mixed: The quadratic sum candidate retains the mixed product.
example (γ : DividedPowers I) (ε : DividedPowers J) (h) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : (supCandidate γ ε h).dpow 2 (x+y) = γ.dpow 2 x + x*y + ε.dpow 2 y := by sorry
-- test_supCandidate_outside: Degree zero outside the sum ideal is zero.
example (γ : DividedPowers I) (ε : DividedPowers J) (h) (x : A) (hx : x ∉ I ⊔ J) : (supCandidate γ ε h).dpow 0 x = 0 := by sorry

-- CrystallineCohomology:CR.0/sum-restrictions
lemma supCandidate_restrict (γ : DividedPowers I) (ε : DividedPowers J) (h) :
  (∀ n x, x ∈ I → (supCandidate γ ε h).dpow n x = γ.dpow n x) ∧
  (∀ n x, x ∈ J → (supCandidate γ ε h).dpow n x = ε.dpow n x) := by sorry

-- CrystallineCohomology:CR.0/compatible-sum
def sup (γ : DividedPowers I) (ε : DividedPowers J)
  (h : ∀ n x, x ∈ I ⊓ J → γ.dpow n x = ε.dpow n x) : DividedPowers (I ⊔ J) := by sorry
lemma sup_dpow_add (γ : DividedPowers I) (ε : DividedPowers J) (h) (n : ℕ) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : (sup γ ε h).dpow n (x+y) = convolution γ ε n x y := by sorry
lemma sup_left (γ : DividedPowers I) (ε : DividedPowers J) (h) : γ.IsDPMorphism (sup γ ε h) (RingHom.id A) := by sorry
lemma sup_right (γ : DividedPowers I) (ε : DividedPowers J) (h) : ε.IsDPMorphism (sup γ ε h) (RingHom.id A) := by sorry
-- test_sup_same: Gluing γ to itself returns the same operations.
example (γ : DividedPowers I) (n : ℕ) (x : A) : (sup γ γ (by intros; rfl)).dpow n x = γ.dpow n x := by sorry
-- test_sup_zero_ideal: Gluing with the zero PD ideal returns γ on its domain.
example (γ : DividedPowers I) (h) (n : ℕ) (x : A) (hx : x ∈ I) : (sup γ (dividedPowersBot A) h).dpow n x = γ.dpow n x := by sorry
-- test_sup_quadratic: The glued degree-two formula contains xy with coefficient one.
example (γ : DividedPowers I) (ε : DividedPowers J) (h) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : (sup γ ε h).dpow 2 (x+y) = γ.dpow 2 x + x*y + ε.dpow 2 y := by sorry

-- CrystallineCohomology:CR.0/sum-universal-property
theorem sup_exists_unique_iff (γ : DividedPowers I) (ε : DividedPowers J) :
  (∃! θ : DividedPowers (I ⊔ J), γ.IsDPMorphism θ (RingHom.id A) ∧
    ε.IsDPMorphism θ (RingHom.id A)) ↔
  ∀ n x, x ∈ I ⊓ J → γ.dpow n x = ε.dpow n x := by sorry

-- CrystallineCohomology:CR.0/product-intersection-gluing
lemma sup_exists_unique_of_inf_eq_mul (γ : DividedPowers I) (ε : DividedPowers J)
  (hIJ : I ⊓ J = I * J) : ∃! θ : DividedPowers (I ⊔ J),
    γ.IsDPMorphism θ (RingHom.id A) ∧ ε.IsDPMorphism θ (RingHom.id A) := by sorry

variable {B : Type v} [CommRing B] {C : Type w} [CommRing C]

-- CrystallineCohomology:CR.0/extension-uniqueness
lemma extension_unique (γ : DividedPowers I) (f : A →+* B)
  (θ θ' : DividedPowers (I.map f)) (h : γ.IsDPMorphism θ f)
  (h' : γ.IsDPMorphism θ' f) : θ = θ' := by sorry

-- CrystallineCohomology:CR.0/principal-independence
lemma principal_independent (γ : DividedPowers I) (f : A →+* B) (x : A)
  (hx : I = Ideal.span {x}) (n : ℕ) (b c : B) (hbc : b * f x = c * f x) :
  b^n * f (γ.dpow n x) = c^n * f (γ.dpow n x) := by sorry

-- CrystallineCohomology:CR.0/principal-extension
def extendPrincipal (γ : DividedPowers I) (f : A →+* B) (x : A)
  (hx : I = Ideal.span {x}) : DividedPowers (I.map f) := by sorry
lemma extendPrincipal_dpow (γ : DividedPowers I) (f : A →+* B) (x : A) (hx) (n : ℕ) (b : B) : (extendPrincipal γ f x hx).dpow n (b * f x) = b^n * f (γ.dpow n x) := by sorry
lemma extendPrincipal_isDPMorphism (γ : DividedPowers I) (f : A →+* B) (x : A) (hx) : γ.IsDPMorphism (extendPrincipal γ f x hx) f := by sorry
lemma extendPrincipal_generator_independent (γ : DividedPowers I) (f : A →+* B) (x y : A) (hx hy) : extendPrincipal γ f x hx = extendPrincipal γ f y hy := by sorry
-- test_principal_identity: Extension along the identity has the original operation on I.
example (γ : DividedPowers I) (x : A) (hx) (n : ℕ) (z : A) (hz : z ∈ I) : (extendPrincipal γ (RingHom.id A) x hx).dpow n z = γ.dpow n z := by sorry
-- test_principal_zero: Extending the zero ideal gives the existing zero divided powers on its image.
example (f : A →+* B) (n : ℕ) : (extendPrincipal (dividedPowersBot A) f 0 (by simp)).dpow n 0 = (dividedPowersBot B).dpow n 0 := by sorry
-- test_principal_quadratic: The degree-two value on bf(x) scales by b².
example (γ : DividedPowers I) (f : A →+* B) (x : A) (hx) (b : B) : (extendPrincipal γ f x hx).dpow 2 (b * f x) = b^2 * f (γ.dpow 2 x) := by sorry
-- test_principal_p_two: For the canonical PD ideal (2) in Z₂, identity extension satisfies γ₂(2)=2, so ordinary or PD nilpotence must not be inferred.
example  : (extendPrincipal (PadicInt.dividedPowers 2) (RingHom.id ℤ_[2]) 2 rfl).dpow 2 2 = 2 := by sorry

-- CrystallineCohomology:CR.0/extension-coefficient
def extensionCoefficient (γ : DividedPowers I) (f : A →+* B)
  (r n : ℕ) (b : Fin r → B) (x : Fin r → A) : B := by sorry
lemma extensionCoefficient_eq (γ : DividedPowers I) (f : A →+* B) (r n : ℕ) (b : Fin r → B) (x : Fin r → A) : extensionCoefficient γ f r n b x = ∑ k ∈ (Finset.univ : Finset (Fin r)).sym n, ∏ i : Fin r, b i ^ Multiset.count i k * f (γ.dpow (Multiset.count i k) (x i)) := by sorry
lemma extensionCoefficient_one (γ : DividedPowers I) (f : A →+* B) (n : ℕ) (b : B) (x : A) : extensionCoefficient γ f 1 n (fun _ => b) (fun _ => x) = b^n * f (γ.dpow n x) := by sorry
lemma extensionCoefficient_mem (γ : DividedPowers I) (f : A →+* B) (r n : ℕ) (hn : n ≠ 0) (b : Fin r → B) (x : Fin r → A) (hx : ∀ i, x i ∈ I) : extensionCoefficient γ f r n b x ∈ I.map f := by sorry
-- test_coefficient_empty_zero: The empty family in degree zero contributes one.
example (γ : DividedPowers I) (f : A →+* B) : extensionCoefficient γ f 0 0 Fin.elim0 Fin.elim0 = 1 := by sorry
-- test_coefficient_empty_positive: The empty family in degree one contributes zero.
example (γ : DividedPowers I) (f : A →+* B) : extensionCoefficient γ f 0 1 Fin.elim0 Fin.elim0 = 0 := by sorry
-- test_coefficient_quadratic: For two elements, E₂=b₀²fγ₂(x₀)+b₀b₁f(x₀x₁)+b₁²fγ₂(x₁).
example (γ : DividedPowers I) (f : A →+* B) (b : Fin 2 → B) (x : Fin 2 → A) (hx : ∀ i, x i ∈ I) : extensionCoefficient γ f 2 2 b x = b 0 ^ 2 * f (γ.dpow 2 (x 0)) + (b 0 * b 1) * f (x 0 * x 1) + b 1 ^ 2 * f (γ.dpow 2 (x 1)) := by sorry

-- CrystallineCohomology:CR.0/coefficient-substitution
lemma extensionCoefficient_substitution (γ : DividedPowers I) (f : A →+* B)
  (r s n : ℕ) (a : Fin r → Fin s → A) (c : Fin s → B) (x : Fin r → A)
  (hx : ∀ i, x i ∈ I) :
  extensionCoefficient γ f r n (fun i => ∑ j, f (a i j) * c j) x =
  extensionCoefficient γ f s n c (fun j => ∑ i, a i j * x i) := by sorry

-- CrystallineCohomology:CR.0/flat-presentation-independence
lemma extensionCoefficient_independent [Algebra A B] [Module.Flat A B]
  (γ : DividedPowers I) (r s n : ℕ) (b : Fin r → B) (c : Fin s → B)
  (x : Fin r → A) (y : Fin s → A) (hx : ∀ i, x i ∈ I) (hy : ∀ j, y j ∈ I)
  (heq : (∑ i, b i * algebraMap A B (x i)) = ∑ j, c j * algebraMap A B (y j)) :
  extensionCoefficient γ (algebraMap A B) r n b x =
  extensionCoefficient γ (algebraMap A B) s n c y := by sorry

-- CrystallineCohomology:CR.0/flat-candidate
def flatCandidate [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) :
  AdditivePowers (I.map (algebraMap A B)) := by sorry
lemma flatCandidate_formula [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (r n : ℕ) (b : Fin r → B) (x : Fin r → A) (hx : ∀ i, x i ∈ I) : (flatCandidate (B := B) γ).dpow n (∑ i, b i * algebraMap A B (x i)) = extensionCoefficient γ (algebraMap A B) r n b x := by sorry
lemma flatCandidate_base [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (n : ℕ) (x : A) (hx : x ∈ I) : (flatCandidate (B := B) γ).dpow n (algebraMap A B x) = algebraMap A B (γ.dpow n x) := by sorry
lemma flatCandidate_outside [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (n : ℕ) (b : B) (hb : b ∉ I.map (algebraMap A B)) : (flatCandidate (B := B) γ).dpow n b = 0 := by sorry
-- test_flatCandidate_zero: Degree zero at zero is one.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) : (flatCandidate (B := B) γ).dpow 0 0 = 1 := by sorry
-- test_flatCandidate_scalar: A single scalar multiple has the expected nth-power coefficient.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (n : ℕ) (b : B) (x : A) (hx : x ∈ I) : (flatCandidate (B := B) γ).dpow n (b * algebraMap A B x) = b^n * algebraMap A B (γ.dpow n x) := by sorry
-- test_flatCandidate_quadratic: The quadratic formula includes the mixed product after base change.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (x y : A) (hx : x ∈ I) (hy : y ∈ I) : (flatCandidate (B := B) γ).dpow 2 (algebraMap A B x + algebraMap A B y) = algebraMap A B (γ.dpow 2 x + x*y + γ.dpow 2 y) := by sorry

-- CrystallineCohomology:CR.0/flat-candidate-base
lemma flatCandidate_base_identity [Algebra A B] [Module.Flat A B]
  (γ : DividedPowers I) (n : ℕ) (x : A) (hx : x ∈ I) :
  (flatCandidate (B := B) γ).dpow n (algebraMap A B x) =
    algebraMap A B (γ.dpow n x) := by sorry

-- CrystallineCohomology:CR.0/flat-extension
def extendFlat [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) :
  DividedPowers (I.map (algebraMap A B)) := by sorry
lemma extendFlat_formula [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (r n : ℕ) (b : Fin r → B) (x : Fin r → A) (hx : ∀ i, x i ∈ I) : (extendFlat (B := B) γ).dpow n (∑ i, b i * algebraMap A B (x i)) = extensionCoefficient γ (algebraMap A B) r n b x := by sorry
lemma extendFlat_isDPMorphism [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) : γ.IsDPMorphism (extendFlat (B := B) γ) (algebraMap A B) := by sorry
lemma extendFlat_unique [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (θ : DividedPowers (I.map (algebraMap A B))) (h : γ.IsDPMorphism θ (algebraMap A B)) : θ = extendFlat γ := by sorry
-- test_flat_identity: Identity extension agrees with γ at every element.
example (γ : DividedPowers I) (n : ℕ) (x : A) : (extendFlat (B := A) γ).dpow n x = γ.dpow n x := by sorry
-- test_flat_principal: On a principal ideal the flat and principal constructions agree.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (x : A) (hx) : extendFlat (B := B) γ = extendPrincipal γ (algebraMap A B) x hx := by sorry
-- test_flat_quadratic: A linear combination of two base elements retains its cross term.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (b c : B) (x y : A) (hx : x ∈ I) (hy : y ∈ I) : (extendFlat (B := B) γ).dpow 2 (b * algebraMap A B x + c * algebraMap A B y) = b^2 * algebraMap A B (γ.dpow 2 x) + b*c * algebraMap A B (x*y) + c^2 * algebraMap A B (γ.dpow 2 y) := by sorry

-- CrystallineCohomology:CR.0/flat-extension-map
lemma extendFlat_base_map [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) :
  γ.IsDPMorphism (extendFlat (B := B) γ) (algebraMap A B) := by sorry

-- CrystallineCohomology:CR.0/localization-formula
theorem localization_dpow [Algebra A B] (S : Submonoid A) [IsLocalization S B]
  (γ : DividedPowers I) (n : ℕ) (x : A) (hx : x ∈ I) (s : S) :
  letI : Module.Flat A B := IsLocalization.flat B S
  (extendFlat (B := B) γ).dpow n (IsLocalization.mk' B x s) =
    IsLocalization.mk' B (γ.dpow n x) (s^n) := by sorry

end TauCeti.PD

namespace TauCeti.Crystalline
open CategoryTheory
universe u

-- CrystallineCohomology:CR.4/dieudonne-complex
structure DieudonneComplex (p : ℕ) where
  complex : CochainComplex (ModuleCat.{u} ℤ) ℤ
  F : ∀ n, Module.End ℤ (complex.X n)
  comm : ∀ n x, (complex.d n (n+1)).hom (F n x) =
    p • F (n+1) ((complex.d n (n+1)).hom x)
lemma DieudonneComplex.F_zero {p : ℕ} (M : DieudonneComplex p) (n : ℤ) : M.F n 0 = 0 := by sorry
lemma DieudonneComplex.F_add {p : ℕ} (M : DieudonneComplex p) (n : ℤ) (x y : M.complex.X n) : M.F n (x+y) = M.F n x + M.F n y := by sorry
-- CrystallineCohomology:CR.4/dieudonne-dF
lemma DieudonneComplex.d_F {p : ℕ} (M : DieudonneComplex p) (n : ℤ) (x : M.complex.X n) : (M.complex.d n (n+1)).hom (M.F n x) = p • M.F (n+1) ((M.complex.d n (n+1)).hom x) := by sorry
-- test_dieudonne_zero: There is a Dieudonné complex with every group zero.
example  : ∃ M : DieudonneComplex 2, ∀ n, Subsingleton (M.complex.X n) := by sorry
-- test_dieudonne_degree_zero: Z concentrated in degree zero permits any Frobenius multiplication a.
example (a : ℤ) : ∃ (M : DieudonneComplex 2) (e : M.complex.X 0 ≃ₗ[ℤ] ℤ), (∀ x, e (M.F 0 x) = a * e x) ∧ ∀ n : ℤ, n ≠ 0 → Subsingleton (M.complex.X n) := by sorry
-- test_dieudonne_not_chain: For p=2 there is a Dieudonné complex with dF≠Fd: Z→Z with d=id, F₀=2 and F₁=1.
example  : ∃ (M : DieudonneComplex 2) (x : M.complex.X 0), (M.complex.d 0 1).hom (M.F 0 x) ≠ M.F 1 ((M.complex.d 0 1).hom x) := by sorry
/- Inherited aggregate specification: A Dieudonné complex is a cochain complex of abelian groups (M*,d) with a map of graded abelian groups F:M*→M* satisfying dF(x)=pF(dx); morphisms commute with d and F. For a p-torsion-free complex, (η_p M)^n={x∈p^nM^n : dx∈p^{n+1}M^{n+1}} is a subcomplex of M*[p^{-1}] (Construction 2.1.3; for complexes in nonnegative degrees η_pM⊆M, footnote 1). For termwise p-torsion-free M, a Dieudonné structure F is equivalent to a map of cochain complexes α_F:M*→(η_pM)*, α_F(x)=p^nF(x) for x∈M^n, with inverse F(x)=p^{-n}α(x).
The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement. -/

-- CrystallineCohomology:CR.4/saturated-frobenius
def IsSaturated {p : ℕ} (M : DieudonneComplex p) : Prop :=
  (∀ n, Function.Injective (fun x : M.complex.X n => p • x)) ∧
  (∀ n, Function.Injective (M.F n)) ∧
  ∀ n, Set.range (M.F n) =
    {x | ∃ y : M.complex.X (n+1), (M.complex.d n (n+1)).hom x = p • y}
-- CrystallineCohomology:CR.4/saturated-p-injective
lemma IsSaturated.p_injective {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) : Function.Injective (fun x : M.complex.X n => p • x) := by sorry
-- CrystallineCohomology:CR.4/saturated-F-injective
lemma IsSaturated.F_injective {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) : Function.Injective (M.F n) := by sorry
-- CrystallineCohomology:CR.4/saturated-F-range
lemma IsSaturated.F_range {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) : Set.range (M.F n) = {x | ∃ y : M.complex.X (n+1), (M.complex.d n (n+1)).hom x = p • y} := by sorry
-- test_saturated_zero: Every complex whose groups are zero is saturated.
example {p : ℕ} (M : DieudonneComplex p) (h : ∀ n, Subsingleton (M.complex.X n)) : IsSaturated M := by sorry
-- test_saturated_zero_d: For zero differential and termwise p-torsionfree groups, saturation is equivalent to bijectivity of F.
example {p : ℕ} (M : DieudonneComplex p) (hp : ∀ n, Function.Injective (fun x : M.complex.X n => p • x)) (hd : ∀ n, M.complex.d n (n+1) = 0) : IsSaturated M ↔ ∀ n, Function.Bijective (M.F n) := by sorry
-- test_saturated_multiplication_two: The degree-zero group Z with F=2 is not saturated at p=2.
example (M : DieudonneComplex 2) (e : M.complex.X 0 ≃ₗ[ℤ] ℤ) (hF : ∀ x, e (M.F 0 x) = 2 * e x) (hd : M.complex.d 0 1 = 0) : ¬ IsSaturated M := by sorry
/- Inherited aggregate specification: A Dieudonné complex is saturated when it is termwise p-torsion-free and F:M^n→{x∈M^n:dx∈pM^{n+1}} is bijective in every degree. Equivalently, α_F:M→η_p M is an isomorphism.
The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement. -/

-- CrystallineCohomology:CR.4/verschiebung-identities
def verschiebung {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M)
  (n : ℤ) : Module.End ℤ (M.complex.X n) := by sorry
-- CrystallineCohomology:CR.4/verschiebung-FV
lemma verschiebung_FV {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) (x : M.complex.X n) : M.F n (verschiebung M hM n x) = p • x := by sorry
-- CrystallineCohomology:CR.4/verschiebung-VF
lemma verschiebung_VF {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) (x : M.complex.X n) : verschiebung M hM n (M.F n x) = p • x := by sorry
-- CrystallineCohomology:CR.4/verschiebung-d
lemma verschiebung_d {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) (x : M.complex.X n) : verschiebung M hM (n+1) ((M.complex.d n (n+1)).hom x) = p • (M.complex.d n (n+1)).hom (verschiebung M hM n x) := by sorry
-- CrystallineCohomology:CR.4/verschiebung-FdV
lemma verschiebung_FdV {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) (x : M.complex.X n) : M.F (n+1) ((M.complex.d n (n+1)).hom (verschiebung M hM n x)) = (M.complex.d n (n+1)).hom x := by sorry
lemma verschiebung_injective {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) : Function.Injective (verschiebung M hM n) := by sorry
-- test_V_zero: V(0)=0.
example {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) : verschiebung M hM n 0 = 0 := by sorry
-- test_V_F_identity: If F is identity in a degree, V is multiplication by p there.
example {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) (hF : ∀ x, M.F n x = x) (x : M.complex.X n) : verschiebung M hM n x = p • x := by sorry
-- test_V_F_p: If F is multiplication by p in a degree, V is identity there; e.g. a rational degree-zero group.
example {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) (hF : ∀ x, M.F n x = p • x) (x : M.complex.X n) : verschiebung M hM n x = x := by sorry
/- Inherited aggregate specification: On a saturated Dieudonné complex define V uniquely by F(Vx)=px. It is injective and satisfies FV=VF=p, FdV=d and Vd=p dV.
The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement. -/

-- CrystallineCohomology:CR.4/iterated-frobenius-divisibility
lemma iteratedF_range {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M)
  (r : ℕ) (n : ℤ) : Set.range ((M.F n : M.complex.X n → M.complex.X n)^[r]) =
    {x | ∃ y : M.complex.X (n+1), (M.complex.d n (n+1)).hom x = (p^r) • y} := by sorry
/- Inherited aggregate specification: For a saturated Dieudonné complex and every r≥0, F^r identifies M^n with {x∈M^n:dx∈p^rM^{n+1}}. Consequently every cocycle belongs to the image of every iterate F^r.
The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement. -/

-- CrystallineCohomology:CR.4/saturation-colimit
/- Signature not supplied: Every Dieudonné complex M* admits a saturation M*→Sat(M*): a map to a saturated complex through which every map to a saturated complex factors uniquely. First quotient by the graded subgroup T* of elements killed by a power of p; on the p-torsion-free quotient take the direct limit of the sequence M*→(η_pM)*→(η_pη_pM)*→⋯ whose transition maps are α_F, η_p(α_F), η_p(η_p(α_F)),… (display (8)). Saturation is left adjoint to the inclusion DC_sat↪DC. -/
/- TauCeti.Crystalline.Saturation.unit: The canonical morphism M→Sat(M) commutes with d and F. Signature not supplied. -/
/- TauCeti.Crystalline.Saturation.lift: For every saturated K, composition with the unit bijects Hom(Sat(M),K) with Hom(M,K). Signature not supplied. -/
/- TauCeti.Crystalline.Saturation.idempotent: The unit is an isomorphism when M is saturated; hence saturation is idempotent. Signature not supplied. -/
/- TauCeti.Crystalline.test_saturation_Z_identity: The degree-zero complex Z with F=id is already saturated at each prime p, so its saturation unit is an isomorphism. Example not supplied. -/
/- TauCeti.Crystalline.test_saturation_p_torsion: The degree-zero group Z/p with F=0 has zero saturation because every map to a p-torsionfree group kills it. Example not supplied. -/
/- TauCeti.Crystalline.test_saturation_invert_p: For Z in degree zero with F multiplication by p, saturation is Z[1/p] in degree zero with the same Frobenius. Example not supplied. -/
/- Inherited aggregate specification: Every Dieudonné complex M* admits a saturation M*→Sat(M*): a map to a saturated complex through which every map to a saturated complex factors uniquely. First quotient by the graded subgroup T* of elements killed by a power of p; on the p-torsion-free quotient take the direct limit of the sequence M*→(η_pM)*→(η_pη_pM)*→⋯ whose transition maps are α_F, η_p(α_F), η_p(η_p(α_F)),… (display (8)). Saturation is left adjoint to the inclusion DC_sat↪DC.
No replacement carrier or opaque proposition is introduced. The coherent eta, quotient, saturation and limit interfaces must be prototyped before these signatures can be supplied. -/

-- CrystallineCohomology:CR.4/cartier-saturation-mod-p
/- Signature not supplied: If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism. -/
/- Inherited aggregate specification: If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.
No replacement carrier or opaque proposition is introduced. The coherent eta, quotient, saturation and limit interfaces must be prototyped before these signatures can be supplied. -/

-- CrystallineCohomology:CR.4/verschiebung-completion-tower
/- Signature not supplied: For saturated M* form W_r(M)*=M*/(im V^r+im dV^r) for r≥0 (W_0(M)*=0), the restriction maps Res:W_{r+1}(M)*→W_r(M)*, and the completion W(M)*=lim_r W_r(M)*. F descends to F:W_r(M)*→W_{r−1}(M)* and V to V:W_r(M)*→W_{r+1}(M)*; passing to the limit makes W(M)* a Dieudonné complex, the construction is functorial, and the tautological map ρ_M:M*→W(M)* is a map of Dieudonné complexes (Remark 2.5.3). -/
/- TauCeti.Crystalline.Completion.restriction: The quotient map W_{r+1}M→W_rM commutes with d and has the specified composite law. Signature not supplied. -/
/- TauCeti.Crystalline.Completion.F: F descends from W_{r+1}M to W_rM; on the inverse limit it satisfies dF=pFd. Signature not supplied. -/
/- TauCeti.Crystalline.Completion.V: V descends from W_rM to W_{r+1}M with its existing differential relation. Signature not supplied. -/
/- TauCeti.Crystalline.Completion.unit: The natural map ρ:M→lim_r W_rM is a morphism of Dieudonné complexes. Signature not supplied. -/
/- TauCeti.Crystalline.test_completion_W0: W₀M is the zero complex, since V⁰ is identity. Example not supplied. -/
/- TauCeti.Crystalline.test_completion_Z: For M=Z in degree zero with F=id, V=p, W_rM=Z/p^r and W(M)=Z_p. Example not supplied. -/
/- TauCeti.Crystalline.test_completion_rational: For M=Q in degree zero with F=id, V=p is bijective, all W_rM vanish and the completion is zero. Example not supplied. -/
/- Inherited aggregate specification: For saturated M* form W_r(M)*=M*/(im V^r+im dV^r) for r≥0 (W_0(M)*=0), the restriction maps Res:W_{r+1}(M)*→W_r(M)*, and the completion W(M)*=lim_r W_r(M)*. F descends to F:W_r(M)*→W_{r−1}(M)* and V to V:W_r(M)*→W_{r+1}(M)*; passing to the limit makes W(M)* a Dieudonné complex, the construction is functorial, and the tautological map ρ_M:M*→W(M)* is a map of Dieudonné complexes (Remark 2.5.3).
No replacement carrier or opaque proposition is introduced. The coherent eta, quotient, saturation and limit interfaces must be prototyped before these signatures can be supplied. -/

end TauCeti.Crystalline


noncomputable section

namespace TauCeti.Crystalline.Augmentation

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- CrystallineCohomology:CR.0/gamma-augmentation -/
def augmentation : DividedPowerAlgebra R M →ₐ[R] R := by sorry

theorem augmentation_eq_lift : augmentation R M =
    DividedPowerAlgebra.lift (dividedPowersBot R) (0 : M →ₗ[R] R)
      (by intro m; simp) := by sorry

theorem augmentation_dp (n : ℕ) (m : M) :
    augmentation R M (DividedPowerAlgebra.dp R n m) = if n = 0 then 1 else 0 := by
  sorry

theorem augmentation_scalar (r : R) :
    augmentation R M (algebraMap R (DividedPowerAlgebra R M) r) = r := by sorry

theorem augmentation_natural {N : Type*} [AddCommGroup N] [Module R N]
    (f : M →ₗ[R] N) :
    (augmentation R N).comp (DividedPowerAlgebra.map R f) = augmentation R M := by
  sorry

theorem augmentation_unique (f : DividedPowerAlgebra R M →ₐ[R] R)
    (hf : ∀ n m, n ≠ 0 → f (DividedPowerAlgebra.dp R n m) = 0) :
    f = augmentation R M := by sorry

-- augmentation_test_unit
example : augmentation ℤ ℤ (1 : DividedPowerAlgebra ℤ ℤ) = 1 := by sorry

-- augmentation_test_zero_degree
example (m : M) : augmentation R M (DividedPowerAlgebra.dp R 0 m) = 1 := by sorry

-- augmentation_test_positive_with_scalar
example (m : M) : augmentation R M
    (algebraMap R _ (3 : R) + DividedPowerAlgebra.dp R 2 m) = 3 := by sorry

/-- CrystallineCohomology:CR.0/gamma-augmentation-ideal -/
def augmentationIdeal : Ideal (DividedPowerAlgebra R M) := by sorry

theorem augmentationIdeal_eq_ker : augmentationIdeal R M =
    RingHom.ker (augmentation R M).toRingHom := by sorry

theorem mem_augmentationIdeal (x : DividedPowerAlgebra R M) :
    x ∈ augmentationIdeal R M ↔ augmentation R M x = 0 := by sorry

theorem dp_mem_augmentationIdeal (n : ℕ) (hn : n ≠ 0) (m : M) :
    DividedPowerAlgebra.dp R n m ∈ augmentationIdeal R M := by sorry

theorem scalar_mem_augmentationIdeal (r : R) :
    algebraMap R (DividedPowerAlgebra R M) r ∈ augmentationIdeal R M ↔ r = 0 := by
  sorry

-- augmentationIdeal_test_positive
example (m : M) : DividedPowerAlgebra.dp R 2 m ∈ augmentationIdeal R M := by sorry

-- augmentationIdeal_test_unit
example : (1 : DividedPowerAlgebra ℤ ℤ) ∉ augmentationIdeal ℤ ℤ := by sorry

-- augmentationIdeal_test_degree_one_insufficient
example : DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∈
      augmentationIdeal (ZMod 2) (ZMod 2) ∧
    DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∉
      Ideal.span (Set.range (DividedPowerAlgebra.embed (ZMod 2) (ZMod 2))) := by
  sorry

/-- CrystallineCohomology:CR.0/gamma-remainder-positive-span -/
theorem remainder_mem_positive_span (x : DividedPowerAlgebra R M) :
    x - algebraMap R _ (augmentation R M x) ∈
      Ideal.span {z | ∃ (n : ℕ) (m : M), n ≠ 0 ∧ z = DividedPowerAlgebra.dp R n m} := by
  sorry

/-- CrystallineCohomology:CR.0/gamma-augmentation-ideal-generators -/
theorem augmentationIdeal_eq_span : augmentationIdeal R M =
    Ideal.span {z | ∃ (n : ℕ) (m : M), n ≠ 0 ∧ z = DividedPowerAlgebra.dp R n m} := by
  sorry

/-- CrystallineCohomology:CR.0/gamma-augmentation-splitting -/
def augmentationSplitting : DividedPowerAlgebra R M ≃ₗ[R] R × augmentationIdeal R M := by
  sorry

theorem augmentationSplitting_fst (x : DividedPowerAlgebra R M) :
    (augmentationSplitting R M x).1 = augmentation R M x := by sorry

theorem augmentationSplitting_snd (x : DividedPowerAlgebra R M) :
    ((augmentationSplitting R M x).2 : DividedPowerAlgebra R M) =
      x - algebraMap R _ (augmentation R M x) := by sorry

theorem augmentationSplitting_symm (r : R) (x : augmentationIdeal R M) :
    (augmentationSplitting R M).symm (r, x) =
      algebraMap R (DividedPowerAlgebra R M) r + x := by sorry

-- augmentationSplitting_test_scalar
example (r : R) : augmentationSplitting R M (algebraMap R _ r) = (r, 0) := by sorry

-- augmentationSplitting_test_ideal
example (x : augmentationIdeal R M) : augmentationSplitting R M x = (0, x) := by sorry

-- augmentationSplitting_test_addition
example (r : R) (x : augmentationIdeal R M) :
    augmentationSplitting R M (algebraMap R _ r + x) = (r, x) := by sorry

/-- CrystallineCohomology:CR.0/gamma-base-ideal-remainder -/
theorem baseIdeal_remainder (I : Ideal R) (z : DividedPowerAlgebra R M)
    (hz : z ∈ I.map (algebraMap R (DividedPowerAlgebra R M))) :
    z - algebraMap R _ (augmentation R M z) ∈
      I.map (algebraMap R (DividedPowerAlgebra R M)) * augmentationIdeal R M := by
  sorry

/-- CrystallineCohomology:CR.0/gamma-base-ideal-intersection -/
theorem baseIdeal_inf_augmentation (I : Ideal R) :
    I.map (algebraMap R (DividedPowerAlgebra R M)) ⊓ augmentationIdeal R M =
      I.map (algebraMap R (DividedPowerAlgebra R M)) * augmentationIdeal R M := by
  sorry

/-- CrystallineCohomology:CR.0/gamma-degree-two-detector -/
theorem exists_degreeTwo_detector :
    ∃ f : DividedPowerAlgebra (ZMod 2) (ZMod 2) →ₐ[ZMod 2]
        TrivSqZeroExt (ZMod 2) (ZMod 2),
      ∀ (n : ℕ) (m : ZMod 2), f (DividedPowerAlgebra.dp (ZMod 2) n m) =
        if n = 0 then 1 else if n = 2 then TrivSqZeroExt.inr m else 0 := by
  sorry

/-- CrystallineCohomology:CR.0/gamma-degree-one-insufficient -/
theorem degreeTwo_not_mem_degreeOne_span :
    DividedPowerAlgebra.dp (ZMod 2) 2 (1 : ZMod 2) ∉
      Ideal.span (Set.range (DividedPowerAlgebra.embed (ZMod 2) (ZMod 2))) := by
  sorry

end TauCeti.Crystalline.Augmentation

namespace TauCeti.Crystalline
open CategoryTheory
universe u
variable {p : ℕ}

-- CrystallineCohomology:CR.4/dieudonne-morphism
structure DieudonneHom (M N : DieudonneComplex.{u} p) where
  toCochainHom : M.complex ⟶ N.complex
  comm_F : ∀ n x, (toCochainHom.f n).hom (M.F n x) =
    N.F n ((toCochainHom.f n).hom x)

def DieudonneHom.id (M : DieudonneComplex.{u} p) : DieudonneHom M M := by sorry

def DieudonneHom.comp {M N P : DieudonneComplex.{u} p}
    (g : DieudonneHom N P) (f : DieudonneHom M N) : DieudonneHom M P := by sorry

lemma DieudonneHom.ext {M N : DieudonneComplex.{u} p} (f g : DieudonneHom M N)
    (h : ∀ n x, (f.toCochainHom.f n).hom x = (g.toCochainHom.f n).hom x) : f = g := by sorry
lemma DieudonneHom.id_apply (M : DieudonneComplex.{u} p) (n : ℤ) (x : M.complex.X n) :
    ((DieudonneHom.id M).toCochainHom.f n).hom x = x := by sorry
lemma DieudonneHom.comp_apply {M N P : DieudonneComplex.{u} p}
    (g : DieudonneHom N P) (f : DieudonneHom M N) (n : ℤ) (x : M.complex.X n) :
    ((g.comp f).toCochainHom.f n).hom x =
      (g.toCochainHom.f n).hom ((f.toCochainHom.f n).hom x) := by sorry
-- TauCeti.Crystalline.hom_test_zero
example (M N : DieudonneComplex.{u} p) : ∃ f : DieudonneHom M N, f.toCochainHom = 0 := by sorry
-- TauCeti.Crystalline.hom_test_scalar
example (M : DieudonneComplex.{u} p) (a : ℤ) : ∃ f : DieudonneHom M M,
    ∀ n x, (f.toCochainHom.f n).hom x = a • x := by sorry
-- TauCeti.Crystalline.hom_test_composition
example {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N) :
    (DieudonneHom.id N).comp f = f := by sorry

-- TauCeti.Crystalline.hom_test_F_compatibility
example {M N : DieudonneComplex 2} (f : DieudonneHom M N)
    (eM : M.complex.X 0 ≃ₗ[ℤ] ℤ) (eN : N.complex.X 0 ≃ₗ[ℤ] ℤ)
    (hM : ∀ x, eM (M.F 0 x) = eM x)
    (hN : ∀ x, eN (N.F 0 x) = 2 * eN x) :
    ∀ x, eN ((f.toCochainHom.f 0).hom x) = 0 := by sorry

-- CrystallineCohomology:CR.4/dieudonne-morphism-V
lemma DieudonneHom.comm_V {M N : DieudonneComplex.{u} p}
    (f : DieudonneHom M N) (hM : IsSaturated M) (hN : IsSaturated N)
    (n : ℤ) (x : M.complex.X n) :
    (f.toCochainHom.f n).hom (verschiebung M hM n x) =
      verschiebung N hN n ((f.toCochainHom.f n).hom x) := by sorry

variable (M : DieudonneComplex.{u} p) (hM : IsSaturated M)

-- CrystallineCohomology:CR.4/verschiebung-filtration
def vFiltration (r : ℕ) (n : ℤ) : Submodule ℤ (M.complex.X n) :=
  LinearMap.range (verschiebung M hM n ^ r) ⊔
    LinearMap.range ((M.complex.d (n-1) n).hom.comp (verschiebung M hM (n-1) ^ r))

-- CrystallineCohomology:CR.4/verschiebung-filtration-membership
lemma mem_vFiltration (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    x ∈ vFiltration M hM r n ↔ ∃ (a : M.complex.X n) (b : M.complex.X (n-1)),
      x = (verschiebung M hM n ^ r) a +
        (M.complex.d (n-1) n).hom ((verschiebung M hM (n-1) ^ r) b) := by sorry
-- CrystallineCohomology:CR.4/verschiebung-filtration-zero
lemma vFiltration_zero (n : ℤ) : vFiltration M hM 0 n = ⊤ := by sorry
-- CrystallineCohomology:CR.4/verschiebung-filtration-antitone
lemma vFiltration_antitone (n : ℤ) : Antitone (fun r => vFiltration M hM r n) := by sorry
-- CrystallineCohomology:CR.4/verschiebung-filtration-d
lemma vFiltration_d (r : ℕ) (n : ℤ) :
    vFiltration M hM r n ≤ (vFiltration M hM r (n+1)).comap (M.complex.d n (n+1)).hom := by sorry
-- TauCeti.Crystalline.filtration_test_zero
example (n : ℤ) : (0 : M.complex.X n) ∈ vFiltration M hM 7 n := by sorry
-- TauCeti.Crystalline.filtration_test_V_identity
example (n : ℤ) (hd : M.complex.d (n-1) n = 0)
    (hV : verschiebung M hM n = LinearMap.id) : vFiltration M hM 3 n = ⊤ := by sorry
-- TauCeti.Crystalline.filtration_test_zero_d_F_identity
example (r : ℕ) (n : ℤ) (hd : M.complex.d (n-1) n = 0)
    (hF : M.F n = LinearMap.id) :
    vFiltration M hM r n = LinearMap.range ((p^r : ℤ) • (LinearMap.id : Module.End ℤ (M.complex.X n))) := by sorry

-- TauCeti.Crystalline.filtration_test_d_summand
example : ∃ (M : DieudonneComplex 2) (hM : IsSaturated M)
    (x : M.complex.X 1), x ∈ vFiltration M hM 1 1 ∧
      x ∉ LinearMap.range (verschiebung M hM 1) := by sorry

-- CrystallineCohomology:CR.4/verschiebung-filtration-F
lemma vFiltration_F (r : ℕ) (n : ℤ) :
    vFiltration M hM (r+1) n ≤ (vFiltration M hM r n).comap (M.F n) := by sorry
-- CrystallineCohomology:CR.4/verschiebung-filtration-V
lemma vFiltration_V (r : ℕ) (n : ℤ) :
    vFiltration M hM r n ≤ (vFiltration M hM (r+1) n).comap (verschiebung M hM n) := by sorry

-- CrystallineCohomology:CR.4/finite-witt-quotient
def Wcomplex (r : ℕ) : CochainComplex (ModuleCat.{u} ℤ) ℤ :=
  CochainComplex.of
    (fun n => ModuleCat.of ℤ (M.complex.X n ⧸ vFiltration M hM r n))
    (fun n => ModuleCat.ofHom ((vFiltration M hM r n).mapQ
      (vFiltration M hM r (n+1)) (M.complex.d n (n+1)).hom (vFiltration_d M hM r n)))
    (by sorry)

def Wmk (r : ℕ) (n : ℤ) : M.complex.X n →ₗ[ℤ] (Wcomplex M hM r).X n := by
  change M.complex.X n →ₗ[ℤ] (M.complex.X n ⧸ vFiltration M hM r n)
  exact { toFun := Submodule.Quotient.mk, map_add' := by sorry, map_smul' := by sorry }
-- CrystallineCohomology:CR.4/finite-witt-representatives
lemma Wmk_surjective (r : ℕ) (n : ℤ) : Function.Surjective (Wmk M hM r n) := by sorry
-- CrystallineCohomology:CR.4/finite-witt-zero-class
lemma Wmk_eq_zero (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    Wmk M hM r n x = 0 ↔ x ∈ vFiltration M hM r n := by sorry
-- CrystallineCohomology:CR.4/finite-witt-differential
lemma Wcomplex_d_mk (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((Wcomplex M hM r).d n (n+1)).hom (Wmk M hM r n x) =
      Wmk M hM r (n+1) ((M.complex.d n (n+1)).hom x) := by sorry
-- TauCeti.Crystalline.Wcomplex_test_zero_level
example (n : ℤ) : Subsingleton ((Wcomplex M hM 0).X n) := by sorry
-- TauCeti.Crystalline.Wcomplex_test_zero_complex
example (h : ∀ n, Subsingleton (M.complex.X n)) (r : ℕ) (n : ℤ) :
    Subsingleton ((Wcomplex M hM r).X n) := by sorry
-- TauCeti.Crystalline.Wcomplex_test_V_surjective
example (h : ∀ n, Function.Surjective (verschiebung M hM n)) (r : ℕ) (n : ℤ) :
    Subsingleton ((Wcomplex M hM r).X n) := by sorry

-- TauCeti.Crystalline.Wcomplex_test_Z8
example (M : DieudonneComplex 2) (hM : IsSaturated M)
    (e : M.complex.X 0 ≃ₗ[ℤ] ℤ) (hd : M.complex.d (-1) 0 = 0)
    (hF : M.F 0 = LinearMap.id) :
    Nonempty ((Wcomplex M hM 3).X 0 ≃ₗ[ℤ] ZMod 8) := by sorry

-- CrystallineCohomology:CR.4/finite-witt-projection
def Wprojection (r : ℕ) : M.complex ⟶ Wcomplex M hM r := by sorry
lemma Wprojection_apply (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((Wprojection M hM r).f n).hom x = Wmk M hM r n x := by sorry
lemma Wprojection_surjective (r : ℕ) (n : ℤ) :
    Function.Surjective (((Wprojection M hM r).f n).hom) := by sorry
lemma Wprojection_kernel (r : ℕ) (n : ℤ) :
    LinearMap.ker (((Wprojection M hM r).f n).hom) = vFiltration M hM r n := by sorry
-- TauCeti.Crystalline.projection_test_level_zero
example (n : ℤ) (x : M.complex.X n) : ((Wprojection M hM 0).f n).hom x = 0 := by sorry
-- TauCeti.Crystalline.projection_test_V_power
example (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((Wprojection M hM r).f n).hom ((verschiebung M hM n ^ r) x) = 0 := by sorry
-- TauCeti.Crystalline.projection_test_dV_power
example (r : ℕ) (n : ℤ) (x : M.complex.X (n-1)) :
    ((Wprojection M hM r).f n).hom
      ((M.complex.d (n-1) n).hom ((verschiebung M hM (n-1) ^ r) x)) = 0 := by sorry

-- CrystallineCohomology:CR.4/finite-witt-restriction
def Wrestriction (r : ℕ) : Wcomplex M hM (r+1) ⟶ Wcomplex M hM r := by sorry
-- CrystallineCohomology:CR.4/finite-witt-restriction-formula
lemma Wrestriction_mk (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((Wrestriction M hM r).f n).hom (Wmk M hM (r+1) n x) = Wmk M hM r n x := by sorry
lemma Wrestriction_surjective (r : ℕ) (n : ℤ) :
    Function.Surjective (((Wrestriction M hM r).f n).hom) := by sorry
lemma Wprojection_restriction (r : ℕ) :
    Wprojection M hM (r+1) ≫ Wrestriction M hM r = Wprojection M hM r := by sorry
-- TauCeti.Crystalline.restriction_test_zero
example (n : ℤ) (x : (Wcomplex M hM 1).X n) : ((Wrestriction M hM 0).f n).hom x = 0 := by sorry
-- TauCeti.Crystalline.restriction_test_two_steps
example (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((Wrestriction M hM r).f n).hom
      (((Wrestriction M hM (r+1)).f n).hom (Wmk M hM (r+2) n x)) = Wmk M hM r n x := by sorry
-- TauCeti.Crystalline.restriction_test_d
example (r : ℕ) (n : ℤ) (x : (Wcomplex M hM (r+1)).X n) :
    ((Wcomplex M hM r).d n (n+1)).hom (((Wrestriction M hM r).f n).hom x) =
      ((Wrestriction M hM r).f (n+1)).hom (((Wcomplex M hM (r+1)).d n (n+1)).hom x) := by sorry

-- CrystallineCohomology:CR.4/finite-witt-F
def WF (r : ℕ) (n : ℤ) : (Wcomplex M hM (r+1)).X n →ₗ[ℤ] (Wcomplex M hM r).X n := by sorry
-- CrystallineCohomology:CR.4/finite-witt-F-formula
lemma WF_mk (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    WF M hM r n (Wmk M hM (r+1) n x) = Wmk M hM r n (M.F n x) := by sorry
lemma WF_d (r : ℕ) (n : ℤ) (x : (Wcomplex M hM (r+1)).X n) :
    ((Wcomplex M hM r).d n (n+1)).hom (WF M hM r n x) =
      p • WF M hM r (n+1) (((Wcomplex M hM (r+1)).d n (n+1)).hom x) := by sorry
lemma WF_restriction (r : ℕ) (n : ℤ) (x : (Wcomplex M hM (r+2)).X n) :
    ((Wrestriction M hM r).f n).hom (WF M hM (r+1) n x) =
      WF M hM r n (((Wrestriction M hM (r+1)).f n).hom x) := by sorry
-- TauCeti.Crystalline.WF_test_zero_level
example (n : ℤ) (x : (Wcomplex M hM 1).X n) : WF M hM 0 n x = 0 := by sorry
-- TauCeti.Crystalline.WF_test_identity
example (h : ∀ n, M.F n = LinearMap.id) (r : ℕ) (n : ℤ) :
    WF M hM r n = ((Wrestriction M hM r).f n).hom := by sorry
-- TauCeti.Crystalline.WF_test_non_chain
example : ∃ (M : DieudonneComplex 2) (hM : IsSaturated M) (n : ℤ)
    (x : (Wcomplex M hM 2).X n),
    ((Wcomplex M hM 1).d n (n+1)).hom (WF M hM 1 n x) ≠
      WF M hM 1 (n+1) (((Wcomplex M hM 2).d n (n+1)).hom x) := by sorry

-- CrystallineCohomology:CR.4/finite-witt-V
def WV (r : ℕ) (n : ℤ) : (Wcomplex M hM r).X n →ₗ[ℤ] (Wcomplex M hM (r+1)).X n := by sorry
-- CrystallineCohomology:CR.4/finite-witt-V-formula
lemma WV_mk (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    WV M hM r n (Wmk M hM r n x) = Wmk M hM (r+1) n (verschiebung M hM n x) := by sorry
lemma WV_d (r : ℕ) (n : ℤ) (x : (Wcomplex M hM r).X n) :
    WV M hM r (n+1) (((Wcomplex M hM r).d n (n+1)).hom x) =
      p • ((Wcomplex M hM (r+1)).d n (n+1)).hom (WV M hM r n x) := by sorry
lemma WV_restriction (r : ℕ) (n : ℤ) (x : (Wcomplex M hM (r+1)).X n) :
    ((Wrestriction M hM (r+1)).f n).hom (WV M hM (r+1) n x) =
      WV M hM r n (((Wrestriction M hM r).f n).hom x) := by sorry
-- TauCeti.Crystalline.WV_test_zero_level
example (n : ℤ) (x : (Wcomplex M hM 0).X n) : WV M hM 0 n x = 0 := by sorry
-- TauCeti.Crystalline.WV_test_identity_frobenius
example (h : ∀ n, M.F n = LinearMap.id) (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    WV M hM r n (Wmk M hM r n x) = p • Wmk M hM (r+1) n x := by sorry
-- TauCeti.Crystalline.WV_test_non_chain
example : ∃ (M : DieudonneComplex 2) (hM : IsSaturated M) (n : ℤ)
    (x : (Wcomplex M hM 1).X n),
    ((Wcomplex M hM 2).d n (n+1)).hom (WV M hM 1 n x) ≠
      WV M hM 1 (n+1) (((Wcomplex M hM 1).d n (n+1)).hom x) := by sorry

-- CrystallineCohomology:CR.4/finite-witt-FV
lemma WFV (r : ℕ) (n : ℤ) (x : (Wcomplex M hM r).X n) :
    WF M hM r n (WV M hM r n x) = p • x := by sorry
-- CrystallineCohomology:CR.4/finite-witt-VF
lemma WVF (r : ℕ) (n : ℤ) (x : (Wcomplex M hM (r+1)).X n) :
    WV M hM r n (WF M hM r n x) = p • x := by sorry

-- CrystallineCohomology:CR.4/verschiebung-divisibility-lift
lemma dV_pow_p_divisible (r : ℕ) (n : ℤ) (x : M.complex.X n)
    (h : ∃ y : M.complex.X (n+1),
      (M.complex.d n (n+1)).hom ((verschiebung M hM n ^ r) x) = p • y) :
    x ∈ LinearMap.range (M.F n) := by sorry
-- CrystallineCohomology:CR.4/verschiebung-filtration-p-shift
lemma vFiltration_p_shift (r : ℕ) (n : ℤ) (x : M.complex.X n)
    (hx : x ∈ vFiltration M hM r n) : p • x ∈ vFiltration M hM (r+1) n := by sorry
-- CrystallineCohomology:CR.4/verschiebung-filtration-p-cancellation
lemma vFiltration_p_cancel (r : ℕ) (n : ℤ) (x : M.complex.X n)
    (hx : p • x ∈ vFiltration M hM (r+1) n) : x ∈ vFiltration M hM r n := by sorry

-- CrystallineCohomology:CR.4/finite-witt-restriction-kernel
theorem Wrestriction_kernel (r : ℕ) (n : ℤ) (x : (Wcomplex M hM (r+1)).X n) :
    ((Wrestriction M hM r).f n).hom x = 0 ↔ p • x = 0 := by sorry

-- CrystallineCohomology:CR.4/finite-witt-F-lifting
theorem WF_lift (r : ℕ) (n : ℤ) (x : (Wcomplex M hM r).X n)
    (hx : ∃ y : (Wcomplex M hM r).X (n+1),
      ((Wcomplex M hM r).d n (n+1)).hom x = p • y) :
    ∃ y : (Wcomplex M hM (r+1)).X n, WF M hM r n y = x := by sorry

-- CrystallineCohomology:CR.4/finite-witt-p-power
lemma Wcomplex_p_pow (r : ℕ) (n : ℤ) (x : (Wcomplex M hM r).X n) :
    (p^r) • x = 0 := by sorry

-- CrystallineCohomology:CR.4/finite-witt-map
def DieudonneHom.Wmap {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (r : ℕ) :
    Wcomplex M hM r ⟶ Wcomplex N hN r := by sorry
lemma DieudonneHom.Wmap_mk {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((f.Wmap hM hN r).f n).hom (Wmk M hM r n x) =
      Wmk N hN r n ((f.toCochainHom.f n).hom x) := by sorry
lemma DieudonneHom.Wmap_restriction {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (r : ℕ) :
    f.Wmap hM hN (r+1) ≫ Wrestriction N hN r = Wrestriction M hM r ≫ f.Wmap hM hN r := by sorry
lemma DieudonneHom.Wmap_F {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (r : ℕ) (n : ℤ)
    (x : (Wcomplex M hM (r+1)).X n) :
    ((f.Wmap hM hN r).f n).hom (WF M hM r n x) =
      WF N hN r n (((f.Wmap hM hN (r+1)).f n).hom x) := by sorry
lemma DieudonneHom.Wmap_V {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (r : ℕ) (n : ℤ)
    (x : (Wcomplex M hM r).X n) :
    ((f.Wmap hM hN (r+1)).f n).hom (WV M hM r n x) =
      WV N hN r n (((f.Wmap hM hN r).f n).hom x) := by sorry
lemma DieudonneHom.Wmap_id (r : ℕ) : (DieudonneHom.id M).Wmap hM hM r = 𝟙 _ := by sorry
lemma DieudonneHom.Wmap_comp {M N P : DieudonneComplex.{u} p}
    (f : DieudonneHom M N) (g : DieudonneHom N P)
    (hM : IsSaturated M) (hN : IsSaturated N) (hP : IsSaturated P) (r : ℕ) :
    (g.comp f).Wmap hM hP r = f.Wmap hM hN r ≫ g.Wmap hN hP r := by sorry
-- TauCeti.Crystalline.Wmap_test_identity
example (r : ℕ) (n : ℤ) (x : (Wcomplex M hM r).X n) :
    (((DieudonneHom.id M).Wmap hM hM r).f n).hom x = x := by sorry
-- TauCeti.Crystalline.Wmap_test_zero
example {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (hf : f.toCochainHom = 0) (r : ℕ) :
    f.Wmap hM hN r = 0 := by sorry
-- TauCeti.Crystalline.Wmap_test_level_zero
example {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (n : ℤ) (x : (Wcomplex M hM 0).X n) :
    ((f.Wmap hM hN 0).f n).hom x = 0 := by sorry

end TauCeti.Crystalline
