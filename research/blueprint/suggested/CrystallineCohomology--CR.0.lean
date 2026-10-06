/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so contributors and reviewers
can converge on names and interfaces. Every proposed declaration is unchecked.

The file uses the pinned PD, scheme, cochain and Witt carriers. Its final
omission register names conditions and supplier interfaces that cannot yet be
stated. Compilation covers the typed signatures; it does not cover that register.
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
import Mathlib.Algebra.Polynomial.Derivative

import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Localization.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.AlgebraicGeometry.IdealSheaf.Basic
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Verschiebung
import Mathlib.Algebra.DirectSum.Ring
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Sites.InducedTopology
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs
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
example (K : Ideal ℚ) (γ : DividedPowers K) (n : ℕ) (x : ℚ) (hx : x ∈ K) : (AdditivePowers.ofDividedPowers γ).dpow n x = (n.factorial : ℚ)⁻¹ • x ^ n := by sorry

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

-- Saturation and its unit/lift/tests are typed below, after DieudonneHom.

-- CrystallineCohomology:CR.4/cartier-saturation-mod-p
/- Signature not supplied: If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism. -/
/- Inherited aggregate specification: If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.
No replacement carrier or opaque proposition is introduced. The coherent eta, quotient, saturation and limit interfaces must be prototyped before these signatures can be supplied. -/

-- Completion and its compatible-family carrier are typed below.

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

/-!
Suggested signatures for the classical filtration of an existing divided-power
ideal. These are plans, not implementations. The reader is definitive.
The ideal carrier and divided-power operations are the pinned library objects.
-/

noncomputable section
namespace TauCeti.PD

variable {R S : Type*} [CommRing R] [CommRing S]
variable {I : Ideal R} {J : Ideal S}

/-- The zeroth stage includes the empty product. Zero weights are allowed and
contribute the multiplicative identity, since all entries lie in I. -/
-- CrystallineCohomology:CR.0/pd-filtration
def pdFiltration (hI : DividedPowers I) (n : ℕ) : Ideal R :=
  Ideal.span {z | ∃ l : List (ℕ × I),
    n ≤ (l.map Prod.fst).sum ∧
      z = (l.map fun t => hI.dpow t.1 (t.2 : R)).prod}

theorem pdFiltration_le_iff (hI : DividedPowers I) (n : ℕ) (K : Ideal R) :
    pdFiltration hI n ≤ K ↔
      ∀ l : List (ℕ × I), n ≤ (l.map Prod.fst).sum →
        (l.map fun t => hI.dpow t.1 (t.2 : R)).prod ∈ K := by sorry

theorem prod_dpow_mem_pdFiltration (hI : DividedPowers I)
    (n : ℕ) (l : List (ℕ × I)) (hn : n ≤ (l.map Prod.fst).sum) :
    (l.map fun t => hI.dpow t.1 (t.2 : R)).prod ∈ pdFiltration hI n := by sorry

theorem dpow_mem_pdFiltration (hI : DividedPowers I) (n : ℕ)
    (x : R) (hx : x ∈ I) : hI.dpow n x ∈ pdFiltration hI n := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-zero
theorem pdFiltration_zero (hI : DividedPowers I) :
    pdFiltration hI 0 = ⊤ := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-one
theorem pdFiltration_one (hI : DividedPowers I) :
    pdFiltration hI 1 = I := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-antitone
theorem pdFiltration_antitone (hI : DividedPowers I) :
    Antitone (pdFiltration hI) := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-mul
theorem pdFiltration_mul (hI : DividedPowers I) (m n : ℕ) :
    pdFiltration hI m * pdFiltration hI n ≤ pdFiltration hI (m + n) := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-ordinary-powers
theorem pow_le_pdFiltration (hI : DividedPowers I) (n : ℕ) :
    I ^ n ≤ pdFiltration hI n := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-map
theorem map_pdFiltration_le (hI : DividedPowers I) (hJ : DividedPowers J)
    (f : R →+* S) (hf : DividedPowers.IsDPMorphism hI hJ f) (n : ℕ) :
    (pdFiltration hI n).map f ≤ pdFiltration hJ n := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-map-surjective
theorem map_pdFiltration_of_surjective (hI : DividedPowers I)
    (hJ : DividedPowers J) (f : R →+* S)
    (hf : DividedPowers.IsDPMorphism hI hJ f)
    (hs : Function.Surjective f) (hIJ : I.map f = J) (n : ℕ) :
    (pdFiltration hI n).map f = pdFiltration hJ n := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-rational
theorem pdFiltration_eq_pow_of_ratAlgebra [Algebra ℚ R]
    (hI : DividedPowers I) (n : ℕ) : pdFiltration hI n = I ^ n := by sorry

-- Acceptance: the empty word survives even on the zero ideal.
-- pd_filtration_empty_word
example : pdFiltration (dividedPowersBot R) 0 = ⊤ := by sorry

-- Acceptance: every positive stage on the zero ideal vanishes.
-- pd_filtration_zero_ideal
example (n : ℕ) (hn : 0 < n) :
    pdFiltration (dividedPowersBot R) n = ⊥ := by sorry

-- Negative control: the second PD stage is larger than the ordinary square.
-- pd_filtration_two_adic_counterexample
example [Fact (Nat.Prime 2)] :
    let I : Ideal ℤ_[2] := Ideal.span {(2 : ℤ_[2])}
    (2 : ℤ_[2]) ∈ pdFiltration (PadicInt.dividedPowers 2) 2 ∧
      (2 : ℤ_[2]) ∉ I ^ 2 := by sorry

end TauCeti.PD

namespace TauCeti.Crystalline
open CategoryTheory
universe u v

section Gamma
variable (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]

-- CrystallineCohomology:CR.0/gamma-canonical-pd
def gammaPD : DividedPowers (Augmentation.augmentationIdeal A M) := by sorry
lemma gammaPD_generator (n : ℕ) (m : M) :
    (gammaPD A M).dpow n (DividedPowerAlgebra.dp A 1 m) =
      DividedPowerAlgebra.dp A n m := by sorry
lemma gammaPD_lift {C : Type*} [CommRing C] [Algebra A C]
    (K : Ideal C) (δ : DividedPowers K) (f : M →ₗ[A] C) (hf : ∀ m, f m ∈ K) :
    ∃! g : DividedPowerAlgebra A M →ₐ[A] C,
      DividedPowers.IsDPMorphism (gammaPD A M) δ g.toRingHom ∧
        ∀ m, g (DividedPowerAlgebra.dp A 1 m) = f m := by sorry
lemma gammaPD_map {N : Type*} [AddCommGroup N] [Module A N] (f : M →ₗ[A] N) :
    DividedPowers.IsDPMorphism (gammaPD A M) (gammaPD A N)
      (DividedPowerAlgebra.map A f).toRingHom := by sorry
-- TauCeti.Crystalline.test_gammaPD_zero
example (hM : Subsingleton M) : Augmentation.augmentationIdeal A M = ⊥ := by sorry
-- TauCeti.Crystalline.test_gammaPD_free_generator
example : (gammaPD A A).dpow 2 (DividedPowerAlgebra.dp A 1 (1:A)) =
    DividedPowerAlgebra.dp A 2 (1:A) ∧
    DividedPowerAlgebra.dp A 1 (1:A) ^ 2 = 2 * DividedPowerAlgebra.dp A 2 (1:A) := by sorry
-- TauCeti.Crystalline.test_gammaPD_F2
example : DividedPowerAlgebra.dp (ZMod 2) 1 (1:ZMod 2) ^ 2 = 0 ∧
    DividedPowerAlgebra.dp (ZMod 2) 2 (1:ZMod 2) ≠ 0 := by sorry
end Gamma

section Polynomial
variable {A : Type*} [CommRing A] {I : Ideal A} (γ : DividedPowers I) (W : Type*) [DecidableEq W]

-- CrystallineCohomology:CR.0/pd-polynomial
abbrev pdPolynomial := DividedPowerAlgebra A (W →₀ A)
def pdPolynomialIdeal (_γ : DividedPowers I) (W : Type*) : Ideal (pdPolynomial (A:=A) W) :=
    I.map (algebraMap A _) ⊔ Augmentation.augmentationIdeal A (W →₀ A)
def pdPolynomialPowers (γ : DividedPowers I) (W : Type*) : DividedPowers (pdPolynomialIdeal γ W) := by sorry
def pdMonomial (k : W →₀ ℕ) : pdPolynomial (A:=A) W :=
    k.prod fun w n => DividedPowerAlgebra.dp A n (Finsupp.single w 1)
def pdPolynomial_basis : Module.Basis (W →₀ ℕ) A (pdPolynomial (A:=A) W) := by sorry
lemma pdPolynomial_basis_apply (k : W →₀ ℕ) : pdPolynomial_basis (A:=A) W k = pdMonomial (A:=A) W k := by sorry
lemma pdPolynomial_lift {C : Type*} [CommRing C] [Algebra A C]
    (K : Ideal C) (δ : DividedPowers K)
    (hbase : DividedPowers.IsDPMorphism γ δ (algebraMap A C))
    (f : W → C) (hf : ∀ w, f w ∈ K) :
    ∃! g : pdPolynomial (A:=A) W →ₐ[A] C,
      DividedPowers.IsDPMorphism (pdPolynomialPowers γ W) δ g.toRingHom ∧
        ∀ w, g (DividedPowerAlgebra.dp A 1 (Finsupp.single w 1)) = f w := by sorry
lemma pdPolynomial_monomial_mul (k l : W →₀ ℕ) :
    pdMonomial (A:=A) W k * pdMonomial (A:=A) W l =
      (∏ w ∈ k.support ∪ l.support, (Nat.choose (k w + l w) (k w) : A)) •
        pdMonomial (A:=A) W (k+l) := by sorry
-- TauCeti.Crystalline.test_pdPolynomial_no_variables
example : Nonempty (pdPolynomial (A:=A) Empty ≃ₐ[A] A) := by sorry
-- TauCeti.Crystalline.test_pdPolynomial_two
example (w : W) :
    DividedPowerAlgebra.dp A 1 (Finsupp.single w 1 : W →₀ A) ^ 2 =
      2 * DividedPowerAlgebra.dp A 2 (Finsupp.single w 1 : W →₀ A) := by sorry
-- TauCeti.Crystalline.test_pdPolynomial_eval
example {C : Type*} [CommRing C] [Algebra A C] (K : Ideal C) (δ : DividedPowers K)
    (g : pdPolynomial (A:=A) W →ₐ[A] C)
    (hg : DividedPowers.IsDPMorphism (pdPolynomialPowers γ W) δ g.toRingHom)
    (w : W) (n : ℕ) :
    g (DividedPowerAlgebra.dp A n (Finsupp.single w 1)) =
      δ.dpow n (g (DividedPowerAlgebra.dp A 1 (Finsupp.single w 1))) := by sorry
end Polynomial

section Envelope
variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B]
variable {I : Ideal A} (γ : DividedPowers I) (J : Ideal B)

/- A concrete presentation: start from Γ_B(J) with its augmentation powers.
The quotient identifies the linear generator of each j with its scalar, and
imposes the prescribed base powers. Its relation ideal is closed under powers
on its intersection with the augmentation ideal, exactly as quotient descent
in the pinned library requires. -/
def envelopeRelationSet : Set (DividedPowerAlgebra B J) :=
    {z | (∃ j : J, z = DividedPowerAlgebra.dp B 1 j - algebraMap B _ (j:B)) ∨
      ∃ (a : I) (j : J) (n : ℕ), (j:B) = algebraMap A B (a:A) ∧
        z = DividedPowerAlgebra.dp B n j -
          algebraMap B _ (algebraMap A B (γ.dpow n (a:A)))}
def envelopeRelationIdeal : Ideal (DividedPowerAlgebra B J) :=
    sInf {K | Ideal.span (envelopeRelationSet γ J) ≤ K ∧
      ∀ n : ℕ, n ≠ 0 → ∀ x : DividedPowerAlgebra B J,
        x ∈ K → x ∈ Augmentation.augmentationIdeal B J → (gammaPD B J).dpow n x ∈ K}
-- CrystallineCohomology:CR.0/pd-envelope
abbrev PDEnvelope := DividedPowerAlgebra B J ⧸ envelopeRelationIdeal γ J
abbrev PDEnvelope.ideal : Ideal (PDEnvelope γ J) :=
    (Augmentation.augmentationIdeal B J).map (Ideal.Quotient.mk _)
def PDEnvelope.powers : @DividedPowers (PDEnvelope γ J) (inferInstance : CommSemiring (PDEnvelope γ J)) (PDEnvelope.ideal γ J) := by sorry
def PDEnvelope.of : B →ₐ[A] PDEnvelope γ J := by sorry
lemma PDEnvelope.lift {C : Type*} [CommRing C] [Algebra A C]
    (K : Ideal C) (δ : DividedPowers K) (f : B →ₐ[A] C)
    (hJ : J.map f.toRingHom ≤ K)
    (hbase : DividedPowers.IsDPMorphism γ δ (algebraMap A C)) :
    ∃! g : PDEnvelope γ J →ₐ[A] C,
      g.comp (PDEnvelope.of γ J) = f ∧
        DividedPowers.IsDPMorphism (PDEnvelope.powers γ J) δ g.toRingHom := by sorry
set_option backward.isDefEq.respectTransparency false in
def PDEnvelope.quotient (hIJ : I.map (algebraMap A B) ≤ J) :
    (PDEnvelope γ J ⧸ PDEnvelope.ideal γ J) ≃+* (B ⧸ J) := by sorry
def PDEnvelope.map {C : Type*} [CommRing C] [Algebra A C]
    (K : Ideal C) (f : B →ₐ[A] C) (hf : J.map f.toRingHom ≤ K) :
    PDEnvelope γ J →ₐ[A] PDEnvelope γ K := by sorry
lemma PDEnvelope.map_of {C : Type*} [CommRing C] [Algebra A C]
    (K : Ideal C) (f : B →ₐ[A] C) (hf : J.map f.toRingHom ≤ K) (b : B) :
    PDEnvelope.map γ J K f hf (PDEnvelope.of γ J b) = PDEnvelope.of γ K (f b) := by sorry
lemma PDEnvelope.map_pd {C : Type*} [CommRing C] [Algebra A C]
    (K : Ideal C) (f : B →ₐ[A] C) (hf : J.map f.toRingHom ≤ K) :
    DividedPowers.IsDPMorphism (PDEnvelope.powers γ J) (PDEnvelope.powers γ K)
      (PDEnvelope.map γ J K f hf).toRingHom := by sorry
-- TauCeti.Crystalline.test_envelope_zero
example : Nonempty (PDEnvelope (dividedPowersBot A) (⊥ : Ideal B) ≃ₐ[A] B) := by sorry
-- TauCeti.Crystalline.test_envelope_existing
example (δ : DividedPowers J)
    (hbase : DividedPowers.IsDPMorphism γ δ (algebraMap A B)) :
    ∃ f : PDEnvelope γ J →ₐ[A] B, f.comp (PDEnvelope.of γ J) = AlgHom.id A B := by sorry
-- TauCeti.Crystalline.test_envelope_Fp_t
example (p : ℕ) [Fact p.Prime] :
    (PDEnvelope.of (dividedPowersBot (ZMod p))
      (Ideal.span {(Polynomial.X : Polynomial (ZMod p))}) Polynomial.X)^p = 0 := by sorry
end Envelope


section Nilpotence
variable {A B : Type*} [CommRing A] [CommRing B] {I : Ideal A} {J : Ideal B}
-- CrystallineCohomology:CR.0/nilpotence-predicates
def IsPDNilpotent (γ : DividedPowers I) : Prop :=
    ∃ n : ℕ, 0 < n ∧ TauCeti.PD.pdFiltration γ n = ⊥
lemma pdNilpotent_iff (γ : DividedPowers I) : IsPDNilpotent γ ↔
    ∃ n : ℕ, 0 < n ∧ TauCeti.PD.pdFiltration γ n = ⊥ := by sorry
lemma pdNilpotent_ordinary (γ : DividedPowers I) (h : IsPDNilpotent γ) :
    ∃ n : ℕ, 0 < n ∧ I^n = ⊥ := by sorry
lemma pdNilpotent_map (γ : DividedPowers I) (δ : DividedPowers J)
    (f : A →+* B) (hf : DividedPowers.IsDPMorphism γ δ f)
    (hs : Function.Surjective f) (hIJ : I.map f = J) (h : IsPDNilpotent γ) :
    IsPDNilpotent δ := by sorry
lemma pdFiltration_dpow (γ : DividedPowers I) (m n : ℕ) (hm : 0 < m) (hn : 0 < n)
    (x : A) (hx : x ∈ TauCeti.PD.pdFiltration γ n) :
    γ.dpow m x ∈ TauCeti.PD.pdFiltration γ (m*n) := by sorry
-- TauCeti.Crystalline.test_nilpotent_zero
example : IsPDNilpotent (dividedPowersBot A) := by sorry
-- TauCeti.Crystalline.test_nilpotent_q
example [Algebra ℚ A] (γ : DividedPowers I) :
    IsPDNilpotent γ ↔ ∃ n : ℕ, 0 < n ∧ I^n = ⊥ := by sorry
-- TauCeti.Crystalline.test_nilpotent_two
example : ∃ γ : DividedPowers (Ideal.span {(2:ZMod 4)}),
    (Ideal.span {(2:ZMod 4)})^2 = ⊥ ∧ ¬ IsPDNilpotent γ ∧
      ∀ a : ℕ, γ.dpow (2^a) 2 ≠ 0 := by sorry
end Nilpotence

section Saturation
variable {p : ℕ}
-- CrystallineCohomology:CR.4/saturation-colimit
def Saturation (M : DieudonneComplex.{u} p) : DieudonneComplex.{u} p := by sorry
def Saturation.unit (M : DieudonneComplex.{u} p) : DieudonneHom M (Saturation M) := by sorry
lemma Saturation.saturated (M : DieudonneComplex.{u} p) : IsSaturated (Saturation M) := by sorry
def Saturation.lift {M N : DieudonneComplex.{u} p} (hN : IsSaturated N)
    (f : DieudonneHom M N) : DieudonneHom (Saturation M) N := by sorry
lemma Saturation.lift_unique {M N : DieudonneComplex.{u} p} (hN : IsSaturated N)
    (f : DieudonneHom M N) : ∃! g : DieudonneHom (Saturation M) N,
    g.comp (Saturation.unit M) = f := by sorry
lemma Saturation.idempotent (M : DieudonneComplex.{u} p) (hM : IsSaturated M) (n : ℤ) :
    Function.Bijective (((Saturation.unit M).toCochainHom.f n).hom) := by sorry
-- TauCeti.Crystalline.test_saturation_Z_identity
example (M : DieudonneComplex.{u} p) (e : M.complex.X 0 ≃ₗ[ℤ] ℤ)
    (hz : ∀ n : ℤ, n ≠ 0 → Subsingleton (M.complex.X n))
    (hF : M.F 0 = LinearMap.id) :
    Function.Bijective (((Saturation.unit M).toCochainHom.f 0).hom) := by sorry
-- TauCeti.Crystalline.test_saturation_p_torsion
example (M : DieudonneComplex.{u} p) (h : ∀ n (x : M.complex.X n), p • x = 0) :
    ∀ n, Subsingleton ((Saturation M).complex.X n) := by sorry
-- TauCeti.Crystalline.test_saturation_invert_p
example (p : ℕ) [Fact p.Prime] (M : DieudonneComplex.{u} p)
    (e : M.complex.X 0 ≃ₗ[ℤ] ℤ) (hz : ∀ n : ℤ, n ≠ 0 → Subsingleton (M.complex.X n))
    (hF : ∀ x, e (M.F 0 x) = p • e x) :
    ∀ n, Function.Bijective (fun x : (Saturation M).complex.X n => p • x) := by sorry
end Saturation

section Completion
variable {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)

/- The degree group of the inverse limit is the actual submodule of the product
of the finite quotient groups cut out by their actual restriction maps. -/
def Completion.degree (n : ℤ) : Submodule ℤ (∀ r : ℕ, (Wcomplex M hM r).X n) where
  carrier := {x | ∀ r, ((Wrestriction M hM r).f n).hom (x (r+1)) = x r}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
def Completion.complex (M : DieudonneComplex.{u} p) (hM : IsSaturated M) : CochainComplex (ModuleCat.{u} ℤ) ℤ := by sorry
def Completion.degreeEquiv (n : ℤ) :
    (Completion.complex M hM).X n ≃ₗ[ℤ] Completion.degree M hM n := by sorry
-- CrystallineCohomology:CR.4/verschiebung-completion-tower
def Completion (M : DieudonneComplex.{u} p) (hM : IsSaturated M) : DieudonneComplex.{u} p := by sorry
lemma Completion.complex_eq : (Completion M hM).complex = Completion.complex M hM := by sorry
def Completion.degreeModelEquiv (n : ℤ) :
    (Completion M hM).complex.X n ≃ₗ[ℤ] Completion.degree M hM n := by sorry
def Completion.projection (r : ℕ) : (Completion M hM).complex ⟶ Wcomplex M hM r := by sorry
lemma Completion.projection_coordinate (r : ℕ) (n : ℤ)
    (x : (Completion M hM).complex.X n) :
    ((Completion.projection M hM r).f n).hom x =
      (Completion.degreeModelEquiv M hM n x).val r := by sorry
def Completion.restriction (r : ℕ) : Wcomplex M hM (r+1) ⟶ Wcomplex M hM r := Wrestriction M hM r
def Completion.F (n : ℤ) : Module.End ℤ (Completion.degree M hM n) := by sorry
lemma Completion.F_apply (n : ℤ) (x : Completion.degree M hM n) (r : ℕ) :
    (Completion.F M hM n x).val r = WF M hM r n (x.val (r+1)) := by sorry
lemma Completion.F_coordinate (n : ℤ) (x : (Completion M hM).complex.X n) (r : ℕ) :
    (Completion.degreeModelEquiv M hM n ((Completion M hM).F n x)).val r =
      WF M hM r n ((Completion.degreeModelEquiv M hM n x).val (r+1)) := by sorry
def Completion.V (n : ℤ) : Module.End ℤ (Completion.degree M hM n) := by sorry
lemma Completion.V_apply (n : ℤ) (x : Completion.degree M hM n) (r : ℕ) :
    (Completion.V M hM n x).val (r+1) = WV M hM r n (x.val r) := by sorry
def Completion.unit : DieudonneHom M (Completion M hM) := by sorry
lemma Completion.unit_projection (r : ℕ) :
    (Completion.unit M hM).toCochainHom ≫ Completion.projection M hM r =
      Wprojection M hM r := by sorry
-- TauCeti.Crystalline.test_completion_W0
example (n : ℤ) : Subsingleton ((Wcomplex M hM 0).X n) := by sorry
-- TauCeti.Crystalline.test_completion_Z
example (p : ℕ) [Fact p.Prime] (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (e : M.complex.X 0 ≃ₗ[ℤ] ℤ) (hz : ∀ n : ℤ, n ≠ 0 → Subsingleton (M.complex.X n))
    (hF : M.F 0 = LinearMap.id) :
    Nonempty ((Completion M hM).complex.X 0 ≃ₗ[ℤ] ℤ_[p]) := by sorry
-- TauCeti.Crystalline.test_completion_rational
example (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (hV : ∀ n, Function.Surjective (verschiebung M hM n)) :
    ∀ n, Subsingleton ((Completion M hM).complex.X n) := by sorry

def IsStrict : Prop := ∀ n : ℤ, Function.Bijective (((Completion.unit M hM).toCochainHom.f n).hom)
lemma Completion.saturated : IsSaturated (Completion M hM) := by sorry
lemma Completion.V_coordinate (n : ℤ) (x : (Completion M hM).complex.X n) (r : ℕ) :
    (Completion.degreeModelEquiv M hM n
      (verschiebung (Completion M hM) (Completion.saturated M hM) n x)).val (r+1) =
      WV M hM r n ((Completion.degreeModelEquiv M hM n x).val r) := by sorry
def Completion.finiteEquiv (r : ℕ) (n : ℤ) :
    (Wcomplex (Completion M hM) (Completion.saturated M hM) r).X n ≃ₗ[ℤ]
      (Wcomplex M hM r).X n := by sorry
lemma strictCompletion : IsStrict (Completion M hM) (Completion.saturated M hM) := by sorry
lemma Completion.universal {N : DieudonneComplex.{u} p} (hN : IsSaturated N)
    (hstrict : IsStrict N hN) (f : DieudonneHom M N) :
    ∃! g : DieudonneHom (Completion M hM) N, g.comp (Completion.unit M hM) = f := by sorry
end Completion
end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory AlgebraicGeometry
universe u

-- CrystallineCohomology:CR.1/pd-scheme
structure PDScheme where
  scheme : Scheme.{u}
  ideal : scheme.IdealSheafData
  powers : ∀ U : scheme.affineOpens, DividedPowers (ideal.ideal U)
  restrict : ∀ (U V : scheme.affineOpens) (h : V.1 ≤ U.1),
    DividedPowers.IsDPMorphism (powers U) (powers V)
      (scheme.presheaf.map (homOfLE h).op).hom

def PDScheme.affine (A : Type u) [CommRing A] (I : Ideal A) (γ : DividedPowers I) :
    PDScheme.{u} := by sorry
lemma PDScheme.affine_scheme (A : Type u) [CommRing A] (I : Ideal A) (γ : DividedPowers I) :
    (PDScheme.affine A I γ).scheme = Spec (CommRingCat.of A) := by sorry
lemma PDScheme.localize (S : PDScheme.{u}) (U V : S.scheme.affineOpens) (h : V.1 ≤ U.1)
    (n : ℕ) (x : Γ(S.scheme,U)) (hx : x ∈ S.ideal.ideal U) :
    (S.scheme.presheaf.map (homOfLE h).op).hom ((S.powers U).dpow n x) =
      (S.powers V).dpow n ((S.scheme.presheaf.map (homOfLE h).op).hom x) := by sorry
structure PDScheme.Hom (S T : PDScheme.{u}) where
  hom : S.scheme ⟶ T.scheme
  comm : ∀ (U : T.scheme.affineOpens) (V : S.scheme.affineOpens) (h : V.1 ≤ hom ⁻¹ᵁ U.1),
    DividedPowers.IsDPMorphism (T.powers U) (S.powers V) (hom.appLE U.1 V.1 h).hom
def PDScheme.Hom.id (S : PDScheme.{u}) : PDScheme.Hom S S := by sorry
def PDScheme.Hom.comp {S T U : PDScheme.{u}} (f : PDScheme.Hom S T) (g : PDScheme.Hom T U) :
    PDScheme.Hom S U := by sorry
lemma PDScheme.map_comp {S T U : PDScheme.{u}} (f : PDScheme.Hom S T) (g : PDScheme.Hom T U) :
    (f.comp g).hom = f.hom ≫ g.hom := by sorry
-- TauCeti.Crystalline.test_pdScheme_zero
example (S : Scheme.{u}) : ∃ T : PDScheme.{u}, T.scheme = S ∧ T.ideal = ⊥ := by sorry
-- TauCeti.Crystalline.test_pdScheme_affine
example (A : Type u) [CommRing A] (I : Ideal A) (γ : DividedPowers I) :
    (PDScheme.affine A I γ).scheme = Spec (CommRingCat.of A) := by sorry
-- TauCeti.Crystalline.test_pdScheme_two
example : ∃ γ : DividedPowers (Ideal.span {(2:ZMod 4)}),
    ¬ IsPDNilpotent γ ∧ (2:ZMod 4)^2 = 0 := by sorry

section Differential
variable (A B : Type*) [CommRing A] [CommRing B] [Algebra A B]
variable (J : Ideal B) (δ : DividedPowers J)

def pdDifferentialRelations : Submodule B (KaehlerDifferential A B) :=
    Submodule.span B {z | ∃ (n : ℕ) (x : B), 0 < n ∧ x ∈ J ∧
      z = KaehlerDifferential.D A B (δ.dpow n x) -
        δ.dpow (n-1) x • KaehlerDifferential.D A B x}
-- CrystallineCohomology:CR.2/pd-differentials
abbrev pdDifferentials := KaehlerDifferential A B ⧸ pdDifferentialRelations A B J δ
def pdDifferential : Derivation A B (pdDifferentials A B J δ) := by sorry
def PDDerivation (M : Type*) [AddCommGroup M] [Module B M] [Module A M]
    [IsScalarTower A B M] :=
    {D : Derivation A B M // ∀ n : ℕ, 0 < n → ∀ x : B, x ∈ J →
      D (δ.dpow n x) = δ.dpow (n-1) x • D x}
def pdDifferentials_lift (M : Type*) [AddCommGroup M] [Module B M] [Module A M]
    [IsScalarTower A B M] :
    (pdDifferentials A B J δ →ₗ[B] M) ≃ PDDerivation A B J δ M := by sorry
lemma pdDifferentials_dpow (n : ℕ) (hn : 0 < n) (x : B) (hx : x ∈ J) :
    pdDifferential A B J δ (δ.dpow n x) =
      δ.dpow (n-1) x • pdDifferential A B J δ x := by sorry
-- The exterior algebra and its graded differential are an ordinary-forms DD.0
-- supplier obligation; they are not replaced by arbitrary graded modules here.
-- TauCeti.Crystalline.test_pdDifferentials_base
example (K : Ideal A) (ε : DividedPowers K) : Subsingleton (pdDifferentials A A K ε) := by sorry
-- TauCeti.Crystalline.test_pdDifferentials_polynomial
example (I : Ideal A) (γ : DividedPowers I) :
    Nonempty (pdDifferentials A (pdPolynomial (A:=A) Unit)
      (pdPolynomialIdeal γ Unit) (pdPolynomialPowers γ Unit) ≃ₗ[pdPolynomial (A:=A) Unit]
        pdPolynomial (A:=A) Unit) ∧
    ∀ n : ℕ, 0 < n → pdDifferential A (pdPolynomial (A:=A) Unit)
      (pdPolynomialIdeal γ Unit) (pdPolynomialPowers γ Unit)
        (DividedPowerAlgebra.dp A n (Finsupp.single () (1:A))) =
      DividedPowerAlgebra.dp A (n-1) (Finsupp.single () (1:A)) •
        pdDifferential A (pdPolynomial (A:=A) Unit)
          (pdPolynomialIdeal γ Unit) (pdPolynomialPowers γ Unit)
            (DividedPowerAlgebra.dp A 1 (Finsupp.single () (1:A))) := by sorry
-- TauCeti.Crystalline.test_pdDifferentials_Fp
example (p : ℕ) [Fact p.Prime] :
    pdDifferential (ZMod p) (pdPolynomial (A:=ZMod p) Unit)
      (pdPolynomialIdeal (dividedPowersBot (ZMod p)) Unit)
      (pdPolynomialPowers (dividedPowersBot (ZMod p)) Unit)
      (DividedPowerAlgebra.dp (ZMod p) p (Finsupp.single () 1)) ≠ 0 := by sorry
def pdDifferentials_map (C : Type*) [CommRing C] [Algebra A C]
    (K : Ideal C) (ε : DividedPowers K) (f : B →ₐ[A] C)
    (hf : DividedPowers.IsDPMorphism δ ε f.toRingHom) :
    pdDifferentials A B J δ →ₛₗ[f.toRingHom] pdDifferentials A C K ε := by sorry
lemma pdDifferentials_map_d (C : Type*) [CommRing C] [Algebra A C]
    (K : Ideal C) (ε : DividedPowers K) (f : B →ₐ[A] C)
    (hf : DividedPowers.IsDPMorphism δ ε f.toRingHom) (x : B) :
    pdDifferentials_map A B J δ C K ε f hf (pdDifferential A B J δ x) =
      pdDifferential A C K ε (f x) := by sorry
end Differential

/- Coordinate presentation of the connection: the chosen PD differentials
must have the stated coordinate basis before identifying these operators with
a global connection. The axioms below are explicit Leibniz, integrability and
topological quasi-nilpotence conditions, with no uninterpreted proposition. -/
structure QNConnection (A B M : Type*) [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] (p d : ℕ) (coordinateDeriv : Fin d → Derivation A B B) where
  theta : Fin d → M →+ M
  leibniz : ∀ i b m, theta i (b • m) = coordinateDeriv i b • m + b • theta i m
  integrable : ∀ i j m, theta i (theta j m) = theta j (theta i m)
  quasiNilpotent : ∀ m (e : ℕ), ∃ N : ℕ, ∀ i r, N ≤ r →
    ∃ y : M, (theta i : M → M)^[r] m = (p^e) • y
lemma QNConnection.operators {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p d : ℕ} {coordinateDeriv : Fin d → Derivation A B B}
    (C : QNConnection A B M p d coordinateDeriv) (i : Fin d) (b : B) (m : M) :
    C.theta i (b • m) = coordinateDeriv i b • m + b • C.theta i m := by sorry
lemma QNConnection.commute {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p d : ℕ} {coordinateDeriv : Fin d → Derivation A B B}
    (C : QNConnection A B M p d coordinateDeriv) (i j : Fin d) :
    Function.Commute (C.theta i) (C.theta j) := by sorry
def QNConnection.multiTheta {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p d : ℕ} {coordinateDeriv : Fin d → Derivation A B B}
    (C : QNConnection A B M p d coordinateDeriv) (K : Fin d → ℕ) (m : M) : M :=
    (List.finRange d).foldr (fun i x => (C.theta i : M → M)^[K i] x) m
lemma QNConnection.finite_taylor {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p d : ℕ} {coordinateDeriv : Fin d → Derivation A B B}
    (C : QNConnection A B M p d coordinateDeriv) (m : M) (e : ℕ) :
    ∃ N : ℕ, ∀ K : Fin d → ℕ, N ≤ ∑ i, K i →
      ∃ y : M, C.multiTheta K m = (p^e) • y := by sorry

def polynomialDerivation (p : ℕ) : Derivation (ZMod p) (Polynomial (ZMod p)) (Polynomial (ZMod p)) :=
    Derivation.mk' Polynomial.derivative (by sorry)
-- TauCeti.Crystalline.test_qn_trivial
example (p : ℕ) [Fact p.Prime] :
    ∃ C : QNConnection (ZMod p) (Polynomial (ZMod p)) (Polynomial (ZMod p)) p 1
      (fun _ => polynomialDerivation p), ∀ f, C.theta 0 f = Polynomial.derivative f := by sorry
-- TauCeti.Crystalline.test_qn_unipotent
example (p : ℕ) [Fact p.Prime] :
    ∃ C : QNConnection (ZMod p) (Polynomial (ZMod p))
      (Polynomial (ZMod p) × Polynomial (ZMod p)) p 1 (fun _ => polynomialDerivation p),
      (∀ f g, C.theta 0 (f,g) = (Polynomial.derivative f + g, Polynomial.derivative g)) ∧
      ∀ m, (C.theta 0 : _ → _)^[p] m = 0 := by sorry
-- TauCeti.Crystalline.test_qn_exponential
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ C : QNConnection (ZMod p) (Polynomial (ZMod p)) (Polynomial (ZMod p)) p 1
      (fun _ => polynomialDerivation p), ∀ f, C.theta 0 f = Polynomial.derivative f + f := by sorry
end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory
open scoped DirectSum
universe u

-- The pinned graded ring induces its existing degree-zero ring structure.
-- This wrapper fixes the family parameter before instance synthesis.
open scoped DirectSum
abbrev gradedZeroRing (A : ℤ → Type u) [∀ n, AddCommGroup (A n)]
    [DirectSum.GRing A] : Ring (A 0) := inferInstance

-- CrystallineCohomology:CR.4/dieudonne-algebra
structure DieudonneAlgebra (p : ℕ) extends DieudonneComplex.{u} p where
  gradedRing : DirectSum.GRing (fun n : ℤ => complex.X n)
  nonnegative : ∀ n : ℤ, n < 0 → Subsingleton (complex.X n)
  gradedComm : letI := gradedRing
    ∀ (i j : ℤ) (x : complex.X i) (y : complex.X j),
    (DirectSum.of (fun n : ℤ => complex.X n) i x) * (DirectSum.of _ j y) =
      (if Even (i*j) then (1:ℤ) else -1) •
        ((DirectSum.of (fun n : ℤ => complex.X n) j y) * (DirectSum.of _ i x))
  oddSquare : letI := gradedRing
    ∀ (i : ℤ) (x : complex.X i), Odd i → (DirectSum.of (fun n : ℤ => complex.X n) i x)^2 = 0
  leibniz : letI := gradedRing
    ∀ (i j : ℤ) (x : complex.X i) (y : complex.X j),
    DirectSum.of (fun n : ℤ => complex.X n) (i+j+1)
        ((complex.d (i+j) (i+j+1)).hom (GradedMonoid.GMul.mul (A := fun n : ℤ => complex.X n) x y)) =
      (DirectSum.of (fun n : ℤ => complex.X n) (i+1) ((complex.d i (i+1)).hom x)) *
        (DirectSum.of _ j y) +
      (if Even i then (1:ℤ) else -1) •
        ((DirectSum.of (fun n : ℤ => complex.X n) i x) *
          (DirectSum.of _ (j+1) ((complex.d j (j+1)).hom y)))
  Fmul : letI := gradedRing
    ∀ (i j : ℤ) (x : complex.X i) (y : complex.X j),
      F (i+j) (GradedMonoid.GMul.mul (A := fun n : ℤ => complex.X n) x y) = GradedMonoid.GMul.mul (A := fun n : ℤ => complex.X n) (F i x) (F j y)
  Fone : letI := gradedRing
    F 0 (GradedMonoid.GOne.one (A:=fun n : ℤ => complex.X n)) = GradedMonoid.GOne.one (A:=fun n : ℤ => complex.X n)
  Fmodp : letI := gradedRing
    ∀ x : complex.X 0, ∃ y : complex.X 0,
      DirectSum.of (fun n : ℤ => complex.X n) 0 (F 0 x) - (DirectSum.of _ 0 x)^p = p • DirectSum.of _ 0 y

instance (p : ℕ) (D : DieudonneAlgebra.{u} p) :
    DirectSum.GRing (fun n : ℤ => D.complex.X n) := D.gradedRing

lemma DieudonneAlgebra.odd_sq {p : ℕ} (D : DieudonneAlgebra.{u} p)
    (i : ℤ) (hi : Odd i) (x : D.complex.X i) :
    (DirectSum.of (fun n : ℤ => D.complex.X n) i x)^2 = 0 := by sorry
lemma DieudonneAlgebra.projection {p : ℕ} (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) (i j : ℤ)
    (x : D.complex.X i) (y : D.complex.X j) :
    GradedMonoid.GMul.mul (A := fun n : ℤ => D.complex.X n) x (verschiebung D.toDieudonneComplex hD j y) =
      verschiebung D.toDieudonneComplex hD (i+j) (GradedMonoid.GMul.mul (A := fun n : ℤ => D.complex.X n) (D.F i x) y) := by sorry
-- The quotient ideal assertion supplies multiplication on the actual W_r
-- quotient carrier; it is not an arbitrary family of purported Witt rings.
lemma DieudonneAlgebra.W_ideal {p : ℕ} (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) (r : ℕ) (i j : ℤ)
    (x : D.complex.X i) (y : D.complex.X j)
    (hy : y ∈ vFiltration D.toDieudonneComplex hD r j) :
    GradedMonoid.GMul.mul (A := fun n : ℤ => D.complex.X n) x y ∈ vFiltration D.toDieudonneComplex hD r (i+j) := by sorry
def DieudonneAlgebra.Wmul {p : ℕ} (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) (r : ℕ) (i j : ℤ) :
    (Wcomplex D.toDieudonneComplex hD r).X i →
      (Wcomplex D.toDieudonneComplex hD r).X j →
        (Wcomplex D.toDieudonneComplex hD r).X (i+j) := by sorry
lemma DieudonneAlgebra.W_mul {p : ℕ} (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) (r : ℕ) (i j : ℤ)
    (x : D.complex.X i) (y : D.complex.X j) :
    D.Wmul hD r i j (Wmk D.toDieudonneComplex hD r i x) (Wmk D.toDieudonneComplex hD r j y) =
      Wmk D.toDieudonneComplex hD r (i+j)
        (GradedMonoid.GMul.mul (A:=fun n : ℤ => D.complex.X n) x y) := by sorry
-- Auxiliary degree-zero algebra existence (the strict Z_p detector is below).
example (p : ℕ) [Fact p.Prime] : ∃ D : DieudonneAlgebra p,
    (∃ e : D.complex.X 0 ≃+ ℤ_[p],
      ∀ x y : D.complex.X 0,
        GradedMonoid.GMul.mul (A := fun n : ℤ => D.complex.X n) x y = e.symm (e x * e y)) ∧
      (∀ n : ℤ, n ≠ 0 → Subsingleton (D.complex.X n)) ∧ D.F 0 = LinearMap.id := by sorry
-- TauCeti.Crystalline.test_DA_p2_exterior
example (D : DieudonneAlgebra 2) (x : D.complex.X 1) :
    (DirectSum.of (fun n : ℤ => D.complex.X n) 1 x)^2 = 0 := by sorry
-- Auxiliary differential/Frobenius relation (the polynomial detector is below).
example {p : ℕ} (D : DieudonneAlgebra.{u} p) (x : D.complex.X 0) :
    (D.complex.d 0 1).hom (D.F 0 x) = p • D.F 1 ((D.complex.d 0 1).hom x) := by sorry

/- Nygaard's concrete degree submodules can already be stated on the actual
strict Dieudonné carrier. The geometric comparison is qualified separately. -/
-- CrystallineCohomology:CR.4/nygaard-filtration
def Nygaard {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (i q : ℕ) : Submodule ℤ (M.complex.X (q:ℤ)) :=
    if q < i then LinearMap.range ((p^(i-q-1) : ℤ) • verschiebung M hM (q:ℤ)) else ⊤
lemma Nygaard.degree {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (i q : ℕ) (hq : q < i) :
    Nygaard M hM i q = LinearMap.range ((p^(i-q-1) : ℤ) • verschiebung M hM (q:ℤ)) := by sorry
def Nygaard.dividedF {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (i q : ℕ) : Nygaard M hM i q →ₗ[ℤ] M.complex.X (q:ℤ) := by sorry
lemma Nygaard.dividedF_spec {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (i q : ℕ) (x : Nygaard M hM i q) :
    (p^i) • Nygaard.dividedF M hM i q x = (p^q) • M.F (q:ℤ) x.val := by sorry
-- TauCeti.Crystalline.test_nygaard_zero
example {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M) (q : ℕ) :
    Nygaard M hM 0 q = ⊤ := by sorry
-- TauCeti.Crystalline.test_nygaard_perfect
example {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (hF : Function.Bijective (M.F 0)) (i : ℕ) :
    Nygaard M hM i 0 = LinearMap.range ((p^i:ℤ) • (LinearMap.id : Module.End ℤ (M.complex.X 0))) := by sorry
-- TauCeti.Crystalline.test_nygaard_boundary
example {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M) (i : ℕ) :
    Nygaard M hM (i+1) i = LinearMap.range (verschiebung M hM (i:ℤ)) ∧
      Nygaard M hM i i = ⊤ := by sorry
end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory AlgebraicGeometry
universe u

def PDScheme.PLocallyNilpotent (T : PDScheme.{u}) (p : ℕ) : Prop :=
    ∀ U : T.scheme.affineOpens, ∃ n : ℕ, 0 < n ∧ (p : Γ(T.scheme,U))^n = 0
structure PDThickening (p : ℕ) where
  U : Scheme.{u}
  T : PDScheme.{u}
  immersion : U ⟶ T.scheme
  closed : IsClosedImmersion immersion
  sameSpace : Function.Surjective immersion
  ideal_eq : immersion.ker = T.ideal
  pNilpotent : T.PLocallyNilpotent p

-- CrystallineCohomology:CR.1/crystalline-site (big objects)
structure CrisSite (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme) where
  thickening : PDThickening.{u} p
  toX : thickening.U ⟶ X
  toS : PDScheme.Hom thickening.T S
  comm : thickening.immersion ≫ toS.hom = toX ≫ xS

structure CrisSite.Hom {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    (A B : CrisSite p S X xS) where
  onU : A.thickening.U ⟶ B.thickening.U
  onT : PDScheme.Hom A.thickening.T B.thickening.T
  immersion_comm : onU ≫ B.thickening.immersion = A.thickening.immersion ≫ onT.hom
  toX_comm : onU ≫ B.toX = A.toX
  toS_comm : onT.hom ≫ B.toS.hom = A.toS.hom

instance {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme} :
    Category (CrisSite p S X xS) where
  Hom := CrisSite.Hom
  id := by sorry
  comp := by sorry
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

def CrisSite.IsSmall {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    (A : CrisSite p S X xS) : Prop := IsOpenImmersion A.toX
def CrisSite.IsOpen {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    {A B : CrisSite p S X xS} (f : A ⟶ B) : Prop :=
    IsOpenImmersion f.onT.hom ∧
      IsPullback f.onU A.thickening.immersion B.thickening.immersion f.onT.hom
def CrisSite.topology (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme) :
    GrothendieckTopology (CrisSite p S X xS) := by sorry
lemma CrisSite.cover_iff {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    (A : CrisSite p S X xS) (R : Sieve A) :
    R ∈ CrisSite.topology p S X xS A ↔ ∀ t : A.thickening.T.scheme,
      ∃ (B : CrisSite p S X xS) (f : B ⟶ A), R f ∧ CrisSite.IsOpen f ∧
        ∃ b : B.thickening.T.scheme, f.onT.hom b = t := by sorry
def CrisSite.object {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    (T : PDThickening.{u} p) (u : T.U ⟶ X) (t : PDScheme.Hom T.T S)
    (h : T.immersion ≫ t.hom = u ≫ xS) : CrisSite p S X xS := ⟨T,u,t,h⟩
lemma CrisSite.cover_pullback {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    {A B : CrisSite p S X xS} (f : B ⟶ A) (R : Sieve A)
    (h : R ∈ CrisSite.topology p S X xS A) :
    R.pullback f ∈ CrisSite.topology p S X xS B := by sorry
def CrisSite.smallProperty (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme) :
    ObjectProperty (CrisSite p S X xS) := CrisSite.IsSmall
abbrev SmallCrisSite (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme) :=
    (CrisSite.smallProperty p S X xS).FullSubcategory
def CrisSite.small_inclusion (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme) :
    SmallCrisSite p S X xS ⥤ CrisSite p S X xS := (CrisSite.smallProperty p S X xS).ι
def CrisSite.smallTopology (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme) :
    GrothendieckTopology (SmallCrisSite p S X xS) :=
    (CrisSite.small_inclusion p S X xS).inducedTopology (CrisSite.topology p S X xS)
lemma CrisSite.small_cover_iff {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    (A : SmallCrisSite p S X xS) (R : Sieve A) :
    R ∈ CrisSite.smallTopology p S X xS A ↔ ∀ t : A.obj.thickening.T.scheme,
      ∃ (B : SmallCrisSite p S X xS) (f : B ⟶ A), R f ∧ CrisSite.IsOpen f.hom ∧
        ∃ b : B.obj.thickening.T.scheme, f.hom.onT.hom b = t := by sorry
-- TauCeti.Crystalline.test_crisSite_identity
example (p : ℕ) (S : PDScheme.{u}) (hI : S.ideal = ⊥) (hp : S.PLocallyNilpotent p) :
    ∃ A : CrisSite p S S.scheme (𝟙 _), IsIso A.toX := by sorry
-- Finite-level nilpotence predicate sanity check (the W_n model is omitted).
example (p : ℕ) (T : PDThickening.{u} p) : T.T.PLocallyNilpotent p := by sorry
-- TauCeti.Crystalline.test_crisSite_non_nilp
example (p : ℕ) [Fact p.Prime] (I : Ideal ℤ_[p]) (γ : DividedPowers I) :
    ¬ (PDScheme.affine ℤ_[p] I γ).PLocallyNilpotent p := by sorry
end TauCeti.Crystalline


namespace TauCeti.Crystalline
open CategoryTheory
open scoped DirectSum
universe u

/- A concrete graded differential algebra used by the relative Witt signatures.
The multiplication is the pinned graded-ring structure on an actual cochain
complex; none of the differential or scalar conditions is uninterpreted. -/
structure WittDGA where
  complex : CochainComplex (ModuleCat.{u} ℤ) ℤ
  gradedRing : DirectSum.GRing (fun n : ℤ => complex.X n)
  nonnegative : ∀ n : ℤ, n < 0 → Subsingleton (complex.X n)
  gradedComm : letI := gradedRing
    ∀ (i j : ℤ) (x : complex.X i) (y : complex.X j),
      DirectSum.of (fun n : ℤ => complex.X n) i x * DirectSum.of _ j y =
        (if Even (i*j) then (1:ℤ) else -1) •
          (DirectSum.of (fun n : ℤ => complex.X n) j y * DirectSum.of _ i x)
  oddSquare : letI := gradedRing
    ∀ i (x : complex.X i), Odd i → (DirectSum.of (fun n : ℤ => complex.X n) i x)^2 = 0
  leibniz : letI := gradedRing
    ∀ (i j : ℤ) (x : complex.X i) (y : complex.X j),
      DirectSum.of (fun n : ℤ => complex.X n) (i+j+1)
        ((complex.d (i+j) (i+j+1)).hom (GradedMonoid.GMul.mul (A:=fun n : ℤ => complex.X n) x y)) =
      DirectSum.of (fun n : ℤ => complex.X n) (i+1) ((complex.d i (i+1)).hom x) *
        DirectSum.of _ j y + (if Even i then (1:ℤ) else -1) •
        (DirectSum.of (fun n : ℤ => complex.X n) i x *
          DirectSum.of _ (j+1) ((complex.d j (j+1)).hom y))
instance (D : WittDGA.{u}) : DirectSum.GRing (fun n : ℤ => D.complex.X n) := D.gradedRing
instance (D : WittDGA.{u}) : Ring (D.complex.X 0) := gradedZeroRing (fun n => D.complex.X n)

structure WittDGA.Hom (D E : WittDGA.{u}) where
  chain : D.complex ⟶ E.complex
  one : (chain.f 0).hom (1 : D.complex.X 0) = (1 : E.complex.X 0)
  mul : ∀ i j (x : D.complex.X i) (y : D.complex.X j),
    (chain.f (i+j)).hom (GradedMonoid.GMul.mul (A:=fun n : ℤ => D.complex.X n) x y) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => E.complex.X n) ((chain.f i).hom x) ((chain.f j).hom y)

section RelativeWitt
variable (p : ℕ) [Fact p.Prime]
variable (A R : Type u) [CommRing A] [CommRing R] [Algebra A R]
-- These are functions on the existing Witt carriers, not new Witt rings.
def finiteWittF (r : ℕ) (x : TruncatedWittVector p (r+1) R) : TruncatedWittVector p r R :=
    WittVector.truncate r (WittVector.frobenius x.out)
def finiteWittV (r : ℕ) (x : TruncatedWittVector p r R) : TruncatedWittVector p (r+1) R :=
    WittVector.truncate (r+1) (WittVector.verschiebung x.out)
def finiteWittBase (r : ℕ) (x : TruncatedWittVector p r A) : TruncatedWittVector p r R :=
    WittVector.truncate r (WittVector.map (algebraMap A R) x.out)
def finiteTeich (r : ℕ) (x : R) : TruncatedWittVector p r R :=
    WittVector.truncate r (WittVector.teichmuller p x)

-- CrystallineCohomology:CR.4/relative-witt-complex
structure RelativeWittComplex where
  pLocal : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)
  level : ℕ → WittDGA.{u}
  lengthZero : ∀ q : ℤ, Subsingleton ((level 0).complex.X q)
  coefficient : ∀ r, TruncatedWittVector p r R →+* (level r).complex.X 0
  baseConstant : ∀ r (a : TruncatedWittVector p r A),
    ((level r).complex.d 0 1).hom (coefficient r (finiteWittBase p A R r a)) = 0
  restriction : ∀ r, WittDGA.Hom (level (r+1)) (level r)
  F : ∀ r q, (level (r+1)).complex.X q →+ (level r).complex.X q
  V : ∀ r q, (level r).complex.X q →+ (level (r+1)).complex.X q
  F_one : ∀ r, F r 0 1 = 1
  F_mul : ∀ r i j (x : (level (r+1)).complex.X i) (y : (level (r+1)).complex.X j),
    F r (i+j) (GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n) x y) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n) (F r i x) (F r j y)
  coeff_R : ∀ r (a : TruncatedWittVector p (r+1) R),
    ((restriction r).chain.f 0).hom (coefficient (r+1) a) =
      coefficient r (TruncatedWittVector.truncate (Nat.le_succ r) a)
  coeff_F : ∀ r (a : TruncatedWittVector p (r+1) R),
    F r 0 (coefficient (r+1) a) = coefficient r (finiteWittF p R r a)
  coeff_V : ∀ r (a : TruncatedWittVector p r R),
    V r 0 (coefficient r a) = coefficient (r+1) (finiteWittV p R r a)
  FV : ∀ r q (x : (level r).complex.X q), F r q (V r q x) = p • x
  FdV_axiom : ∀ r q (x : (level r).complex.X q),
    F r (q+1) (((level (r+1)).complex.d q (q+1)).hom (V r q x)) =
      ((level r).complex.d q (q+1)).hom x
  teichDifferential : ∀ r (x : R),
    F r 1 (((level (r+1)).complex.d 0 1).hom (coefficient (r+1) (finiteTeich p R (r+1) x))) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n)
        ((coefficient r (finiteTeich p R r x))^(p-1))
        (((level r).complex.d 0 1).hom (coefficient r (finiteTeich p R r x)))
  projection : ∀ r i j (x : (level r).complex.X i) (y : (level (r+1)).complex.X j),
    V r (i+j) (GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n) x (F r j y)) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n) (V r i x) y
  RF : ∀ r q (x : (level (r+2)).complex.X q),
    ((restriction r).chain.f q).hom (F (r+1) q x) = F r q (((restriction (r+1)).chain.f q).hom x)
  RV : ∀ r q (x : (level (r+1)).complex.X q),
    ((restriction (r+1)).chain.f q).hom (V (r+1) q x) = V r q (((restriction r).chain.f q).hom x)

variable {p A R}
lemma RelativeWittComplex.FdV (P : RelativeWittComplex p A R) (r : ℕ) (q : ℤ)
    (x : (P.level r).complex.X q) :
    P.F r (q+1) (((P.level (r+1)).complex.d q (q+1)).hom (P.V r q x)) =
      ((P.level r).complex.d q (q+1)).hom x := by sorry
lemma RelativeWittComplex.VF (P : RelativeWittComplex p A R) (r : ℕ) (q : ℤ)
    (y : (P.level (r+1)).complex.X q) :
    DirectSum.of (fun n : ℤ => (P.level (r+1)).complex.X n) q (P.V r q (P.F r q y)) =
      DirectSum.of (fun n : ℤ => (P.level (r+1)).complex.X n) (0+q)
        (GradedMonoid.GMul.mul (A:=fun n : ℤ => (P.level (r+1)).complex.X n) (P.V r 0 1) y) := by sorry

def RelativeWittComplex.dlog (P : RelativeWittComplex p A R) (r : ℕ) (x : Rˣ) :
    (P.level r).complex.X 1 :=
    GradedMonoid.GMul.mul (A:=fun n : ℤ => (P.level r).complex.X n)
      (P.coefficient r (finiteTeich p R r (↑x⁻¹)))
      (((P.level r).complex.d 0 1).hom (P.coefficient r (finiteTeich p R r (↑x))))
lemma RelativeWittComplex.dlog_closed (P : RelativeWittComplex p A R) (r : ℕ) (x : Rˣ) :
    ((P.level r).complex.d 1 2).hom (P.dlog r x) = 0 := by sorry
lemma RelativeWittComplex.dlog_F (P : RelativeWittComplex p A R) (r : ℕ) (x : Rˣ) :
    P.F r 1 (P.dlog (r+1) x) = P.dlog r x := by sorry

structure RelativeWittComplex.Hom (P Q : RelativeWittComplex p A R) where
  map : ∀ r, WittDGA.Hom (P.level r) (Q.level r)
  coefficient : ∀ r x, ((map r).chain.f 0).hom (P.coefficient r x) = Q.coefficient r x
  R : ∀ r q x, ((map r).chain.f q).hom (((P.restriction r).chain.f q).hom x) =
    ((Q.restriction r).chain.f q).hom (((map (r+1)).chain.f q).hom x)
  F : ∀ r q x, ((map r).chain.f q).hom (P.F r q x) = Q.F r q (((map (r+1)).chain.f q).hom x)
  V : ∀ r q x, ((map (r+1)).chain.f q).hom (P.V r q x) = Q.V r q (((map r).chain.f q).hom x)

-- CrystallineCohomology:CR.4/relative-de-rham-witt
variable (p A R)
def relativeDRW (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) :
    RelativeWittComplex p A R := by sorry
lemma relativeDRW_lift (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (P : RelativeWittComplex p A R) : ∃! f : RelativeWittComplex.Hom (relativeDRW p A R hA) P, True := by sorry
def relativeDRW_zero (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) (r : ℕ) :
    ((relativeDRW p A R hA).level r).complex.X 0 ≃+* TruncatedWittVector p r R := by sorry
lemma relativeDRW_zero_coefficient (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (r : ℕ) (x : TruncatedWittVector p r R) :
    relativeDRW_zero p A R hA r ((relativeDRW p A R hA).coefficient r x) = x := by sorry
-- TauCeti.Crystalline.test_relativeDRW_identity
example (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) (r : ℕ) :
    ∀ q : ℤ, 0 < q → Subsingleton (((relativeDRW p A A hA).level r).complex.X q) := by sorry
-- TauCeti.Crystalline.test_relativeWitt_length1 (degree-zero component)
example (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) :
    Nonempty (((relativeDRW p A R hA).level 1).complex.X 0 ≃+* R) := by sorry
-- TauCeti.Crystalline.test_relativeWitt_V1
example (p : ℕ) [Fact p.Prime] :
    (finiteWittV p (ZMod (p^2)) 1 1).coeff ⟨0,by omega⟩ = 0 ∧
      (p : TruncatedWittVector p 2 (ZMod (p^2))).coeff ⟨0,by omega⟩ ≠ 0 := by sorry
-- TauCeti.Crystalline.test_relativeWitt_units (the operator identity applies to every unit)
example (P : RelativeWittComplex p A R) (r : ℕ) (x : Rˣ) :
    P.F r 1 (P.dlog (r+1) x) = P.dlog r x ∧
      ((P.level r).complex.d 1 2).hom (P.dlog r x) = 0 := by sorry
end RelativeWitt
end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory AlgebraicGeometry Opposite
universe u
variable (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme)
-- CrystallineCohomology:CR.1/structure-sheaves
-- The objects and restriction maps are the actual scheme section rings.
def crisStructurePresheaf : (CrisSite p S X xS)ᵒᵖ ⥤ CommRingCat.{u} where
  obj A := A.unop.thickening.T.scheme.presheaf.obj (op ⊤)
  map f := f.unop.onT.hom.appTop
  map_id := by sorry
  map_comp := by sorry

def crisQuotientPresheaf : (CrisSite p S X xS)ᵒᵖ ⥤ CommRingCat.{u} where
  obj A := A.unop.thickening.U.presheaf.obj (op ⊤)
  map f := f.unop.onU.appTop
  map_id := by sorry
  map_comp := by sorry

def crisStructure : Sheaf (CrisSite.topology p S X xS) CommRingCat.{u} :=
    ⟨crisStructurePresheaf p S X xS, by sorry⟩
def crisQuotient : Sheaf (CrisSite.topology p S X xS) CommRingCat.{u} :=
    ⟨crisQuotientPresheaf p S X xS, by sorry⟩
def crisStructureQuotient : crisStructurePresheaf p S X xS ⟶ crisQuotientPresheaf p S X xS where
  app A := A.unop.thickening.immersion.appTop
  naturality := by sorry
lemma crisStructure_eval (A : CrisSite p S X xS) :
    (crisStructure p S X xS).obj.obj (op A) = A.thickening.T.scheme.presheaf.obj (op ⊤) := rfl

def crisPDideal (A : CrisSite p S X xS) : Ideal Γ(A.thickening.T.scheme,⊤) :=
    RingHom.ker (A.thickening.immersion.appTop).hom
lemma crisPDideal_kernel (A : CrisSite p S X xS) (x : Γ(A.thickening.T.scheme,⊤)) :
    x ∈ crisPDideal p S X xS A ↔ (A.thickening.immersion.appTop).hom x = 0 := Iff.rfl
-- Global operations are glued from the affine-open powers of the same PDScheme.
def crisPDidealPowers (A : CrisSite p S X xS) : DividedPowers (crisPDideal p S X xS A) := by sorry
lemma crisPDideal_restrict {A B : CrisSite p S X xS} (f : A ⟶ B) :
    DividedPowers.IsDPMorphism (crisPDidealPowers p S X xS B)
      (crisPDidealPowers p S X xS A) f.onT.hom.appTop.hom := by sorry
-- TauCeti.Crystalline.test_crisStructure_zero
example (A : CrisSite p S X xS) [IsIso A.thickening.immersion] :
    crisPDideal p S X xS A = ⊥ := by sorry
-- The sheaf-kernel module and local-epimorphism proof, including the affine
-- B/J evaluation and nonaffine non-surjectivity detector, need the ringed-site
-- E1 interface. Sectionwise ker is not a claim of objectwise exactness.
end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory
open scoped DirectSum
universe u
instance DieudonneAlgebra.degreeZeroRing {p : ℕ} (D : DieudonneAlgebra.{u} p) :
    CommRing (D.complex.X 0) :=
  { gradedZeroRing (fun n => D.complex.X n) with mul_comm := by sorry }

structure DieudonneAlgebra.Hom {p : ℕ} (D E : DieudonneAlgebra.{u} p)
    extends DieudonneHom D.toDieudonneComplex E.toDieudonneComplex where
  one : (toCochainHom.f 0).hom 1 = 1
  mul : ∀ i j (x : D.complex.X i) (y : D.complex.X j),
    (toCochainHom.f (i+j)).hom (GradedMonoid.GMul.mul (A:=fun n : ℤ => D.complex.X n) x y) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => E.complex.X n)
        ((toCochainHom.f i).hom x) ((toCochainHom.f j).hom y)
def DieudonneAlgebra.VIdeal {p : ℕ} (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) : Ideal (D.complex.X 0) :=
    Ideal.span (Set.range (verschiebung D.toDieudonneComplex hD 0))
lemma DieudonneAlgebra.mem_VIdeal {p : ℕ} (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) (x : D.complex.X 0) :
    x ∈ D.VIdeal hD ↔ ∃ y : D.complex.X 0, verschiebung D.toDieudonneComplex hD 0 y = x := by sorry

structure StrictDieudonneAlgebra (p : ℕ) extends DieudonneAlgebra.{u} p where
  saturated : IsSaturated toDieudonneComplex
  strict : IsStrict toDieudonneComplex saturated
abbrev StrictDieudonneAlgebra.residue {p : ℕ} (D : StrictDieudonneAlgebra.{u} p) :=
    D.complex.X 0 ⧸ D.toDieudonneAlgebra.VIdeal D.saturated
instance StrictDieudonneAlgebra.residue_algebra (p : ℕ) [Fact p.Prime] (D : StrictDieudonneAlgebra.{u} p) :
    Algebra (ZMod p) D.residue := by sorry

section SaturatedWitt
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [Algebra (ZMod p) R]
-- CrystallineCohomology:CR.4/saturated-de-rham-witt
-- The primitive universal interface is on the actual strict-algebra category.
-- The Ω(W(R_red)) construction requires the ordinary-forms DD.0 supplier.
def saturatedDRW (R : Type u) [CommRing R] [Algebra (ZMod p) R] : StrictDieudonneAlgebra.{u} p := by sorry
def satDRW_unit : R →+* (saturatedDRW p R).residue := by sorry
def satDRW_lift (D : StrictDieudonneAlgebra.{u} p) :
    DieudonneAlgebra.Hom (saturatedDRW p R).toDieudonneAlgebra D.toDieudonneAlgebra ≃
      (R →+* D.residue) := by sorry
def satDRW_degree0 : (saturatedDRW p R).complex.X 0 ≃+*
    WittVector p (saturatedDRW p R).residue := by sorry
lemma satDRW_degree0_residue (x : (saturatedDRW p R).complex.X 0) :
    (satDRW_degree0 p R x).coeff 0 = Ideal.Quotient.mk _ x := by sorry
instance satDRW_residue_reduced : IsReduced (saturatedDRW p R).residue := by sorry

def satDRW_teich (x : R) : (saturatedDRW p R).complex.X 0 :=
    (satDRW_degree0 p R).symm (WittVector.teichmuller p (satDRW_unit p R x))
def satDRW_map (R' : Type u) [CommRing R'] [Algebra (ZMod p) R'] (f : R →+* R') :
    DieudonneAlgebra.Hom (saturatedDRW p R).toDieudonneAlgebra (saturatedDRW p R').toDieudonneAlgebra := by sorry
lemma satDRW_map_teich (R' : Type u) [CommRing R'] [Algebra (ZMod p) R'] (f : R →+* R') (x : R) :
    ((satDRW_map p R R' f).toCochainHom.f 0).hom (satDRW_teich p R x) =
      satDRW_teich p R' (f x) := by sorry
-- TauCeti.Crystalline.test_satDRW_perfect
example [PerfectRing R p] :
    Nonempty ((saturatedDRW p R).complex.X 0 ≃+* WittVector p R) ∧
      ∀ q : ℤ, 0 < q → Subsingleton ((saturatedDRW p R).complex.X q) := by sorry
end SaturatedWitt
-- TauCeti.Crystalline.test_satDRW_polynomial
example (p : ℕ) [Fact p.Prime] :
    let D := saturatedDRW p (Polynomial (ZMod p))
    let x := satDRW_teich p (Polynomial (ZMod p)) Polynomial.X
    (D.complex.d 0 1).hom x ≠ 0 ∧
      D.F 1 ((D.complex.d 0 1).hom x) =
        GradedMonoid.GMul.mul (A:=fun n : ℤ => D.complex.X n)
          (x^(p-1)) ((D.complex.d 0 1).hom x) := by sorry

instance dualNumbers_charP (p : ℕ) [Fact p.Prime] :
    CharP (TrivSqZeroExt (ZMod p) (ZMod p)) p := by sorry
-- TauCeti.Crystalline.test_satDRW_dual_numbers
example (p : ℕ) [Fact p.Prime] :
    (satDRW_unit p (TrivSqZeroExt (ZMod p) (ZMod p)) ⟨0,1⟩) = 0 ∧
      (WittVector.teichmuller p (⟨0,1⟩ : TrivSqZeroExt (ZMod p) (ZMod p))) ≠ 0 ∧
      ∃ f : DieudonneAlgebra.Hom
        (saturatedDRW p (TrivSqZeroExt (ZMod p) (ZMod p))).toDieudonneAlgebra
        (saturatedDRW p (ZMod p)).toDieudonneAlgebra,
        ∀ q : ℤ, Function.Bijective (f.toCochainHom.f q).hom := by sorry
end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory
universe u
variable (p : ℕ) [Fact p.Prime]
variable {A R A' R' : Type u} [CommRing A] [CommRing R] [Algebra A R]
    [CommRing A'] [CommRing R'] [Algebra A' R']
def finiteWittMap (f : R →+* R') (r : ℕ) (x : TruncatedWittVector p r R) : TruncatedWittVector p r R' :=
    WittVector.truncate r (WittVector.map f x.out)
structure RelativeWittComplex.HomOver (P : RelativeWittComplex p A R)
    (Q : RelativeWittComplex p A' R') (f : R →+* R') where
  map : ∀ r, WittDGA.Hom (P.level r) (Q.level r)
  coefficient : ∀ r x, ((map r).chain.f 0).hom (P.coefficient r x) = Q.coefficient r (finiteWittMap p f r x)
  R : ∀ r q x, ((map r).chain.f q).hom (((P.restriction r).chain.f q).hom x) =
    ((Q.restriction r).chain.f q).hom (((map (r+1)).chain.f q).hom x)
  F : ∀ r q x, ((map r).chain.f q).hom (P.F r q x) = Q.F r q (((map (r+1)).chain.f q).hom x)
  V : ∀ r q x, ((map (r+1)).chain.f q).hom (P.V r q x) = Q.V r q (((map r).chain.f q).hom x)

def relativeDRW_map (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (hA' : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A'))
    (a : A →+* A') (f : R →+* R')
    (hcomm : f.comp (algebraMap A R) = (algebraMap A' R').comp a) :
    RelativeWittComplex.HomOver p (relativeDRW p A R hA) (relativeDRW p A' R' hA') f := by sorry
lemma relativeDRW_map_coefficient (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (hA' : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A'))
    (a : A →+* A') (f : R →+* R')
    (hcomm : f.comp (algebraMap A R) = (algebraMap A' R').comp a) (r : ℕ) (x : TruncatedWittVector p r R) :
    (((relativeDRW_map p hA hA' a f hcomm).map r).chain.f 0).hom
      ((relativeDRW p A R hA).coefficient r x) =
    (relativeDRW p A' R' hA').coefficient r (finiteWittMap p f r x) := by sorry

lemma zmod_pLocal : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : ZMod p) := by sorry
-- TauCeti.Crystalline.test_relativeDRW_nonsmooth
example : Nonempty (RelativeWittComplex p (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p))) := by sorry
-- The full length-one Ω-DGA equivalence and Laurent-torus nonzero class need
-- the DD.0 ordinary forms and coordinate comparison signatures.
end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory
universe u
-- TauCeti.Crystalline.test_DA_Zp
example (p : ℕ) [Fact p.Prime] : ∃ D : StrictDieudonneAlgebra p,
    Nonempty (D.complex.X 0 ≃+* ℤ_[p]) ∧
      (∀ q : ℤ, q ≠ 0 → Subsingleton (D.complex.X q)) ∧ D.F 0 = LinearMap.id ∧
      ∀ x : D.complex.X 0, verschiebung D.toDieudonneComplex D.saturated 0 x = p • x := by sorry
-- TauCeti.Crystalline.test_DA_Fd
example {p : ℕ} (D : DieudonneAlgebra.{u} p) (hD : IsSaturated D.toDieudonneComplex)
    (x : D.complex.X 0) (hx : D.F 0 x = x^p) :
    D.F 1 ((D.complex.d 0 1).hom x) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => D.complex.X n) (x^(p-1)) ((D.complex.d 0 1).hom x) ∧
      (D.complex.d 0 1).hom (D.F 0 x) = p • D.F 1 ((D.complex.d 0 1).hom x) := by sorry
end TauCeti.Crystalline

namespace TauCeti.Crystalline
universe u
section EnvelopeQuotient
set_option backward.defeqAttrib.useBackward true
variable {A B B' : Type u} [CommRing A] [CommRing B] [CommRing B']
    [Algebra A B] [Algebra A B'] {I : Ideal A} (γ : DividedPowers I)
abbrev envelopeQuotientIdeal (J : Ideal B) (K : Ideal B) : Ideal (PDEnvelope γ J) :=
    Ideal.span {z | ∃ (n : ℕ) (x : B), 0 < n ∧ x ∈ K ∧
      z = (PDEnvelope.powers γ J).dpow n (PDEnvelope.of γ J x)}
-- CrystallineCohomology:CR.0/envelope-quotient-transitivity
-- The first quotient, its B'-normalization and all positive PD operations.
-- The nested-kernel comparison is a further diagram on these same maps.
set_option backward.isDefEq.respectTransparency false in
theorem envelopeQuotientTransitivity (J' : Ideal B') (J : Ideal B) (f : B' →ₐ[A] B)
    (hs : Function.Surjective f) (hker : RingHom.ker f.toRingHom ≤ J')
    (hJ : J'.map f.toRingHom = J) (hIJ : I.map (algebraMap A B') ≤ J') :
    ∃ g : PDEnvelope γ J' →ₐ[A] PDEnvelope γ J,
      Function.Surjective g ∧ RingHom.ker g.toRingHom =
        envelopeQuotientIdeal γ J' (RingHom.ker f.toRingHom) ∧
      (∀ b : B', g (PDEnvelope.of γ J' b) = PDEnvelope.of γ J (f b)) ∧
      ∀ n : ℕ, ∀ x : PDEnvelope γ J', x ∈ PDEnvelope.ideal γ J' →
        g ((PDEnvelope.powers γ J').dpow n x) =
          (PDEnvelope.powers γ J).dpow n (g x) := by sorry
end EnvelopeQuotient

section EnvelopeLocalization
set_option backward.defeqAttrib.useBackward true
variable {A B B' : Type u} [CommRing A] [CommRing B] [CommRing B']
    [Algebra A B] [Algebra B B'] [Algebra A B'] [IsScalarTower A B B']
    {I : Ideal A} (γ : DividedPowers I) (J : Ideal B) (S : Submonoid B)
-- CrystallineCohomology:CR.0/envelope-localization
-- The universal property characterizes the localization without introducing a
-- second quotient-ring instance on the nested concrete envelope carrier.
set_option backward.isDefEq.respectTransparency false in
theorem envelopeLocalization [IsLocalization S B'] (hIJ : I.map (algebraMap A B) ≤ J) :
    ∃ l : PDEnvelope γ J →ₐ[A] PDEnvelope γ (J.map (algebraMap B B')),
      (∀ b : B, l (PDEnvelope.of γ J b) =
        PDEnvelope.of γ (J.map (algebraMap B B')) (algebraMap B B' b)) ∧
      (∀ s : S, IsUnit (l (PDEnvelope.of γ J (s:B)))) ∧
      ∀ (C : Type u) [CommRing C] [Algebra A C] (f : PDEnvelope γ J →ₐ[A] C),
        (∀ s : S, IsUnit (f (PDEnvelope.of γ J (s:B)))) →
        ∃! g : PDEnvelope γ (J.map (algebraMap B B')) →ₐ[A] C, g.comp l = f := by sorry
end EnvelopeLocalization

-- CrystallineCohomology:CR.0/regular-envelope (characteristic-p module model)
set_option backward.defeqAttrib.useBackward true in
set_option backward.isDefEq.respectTransparency false in
theorem regularEnvelope (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [CharP A p]
    (r : ℕ) (f : Fin r → A) (hf : RingTheory.Sequence.IsRegular A (List.ofFn f)) :
    let J : Ideal A := Ideal.span (Set.range f)
    let K : Ideal A := Ideal.span (Set.range (fun i => (f i)^p))
    ∃ e : PDEnvelope (dividedPowersBot A) J ≃ₗ[A] ((Fin r → ℕ) →₀ (A ⧸ K)),
      ∀ (j : Fin r → ℕ) (a : A),
        e.symm (Finsupp.single j (Ideal.Quotient.mk K a)) =
          (PDEnvelope.of (dividedPowersBot A) J a) * ∏ i : Fin r,
            (PDEnvelope.powers (dividedPowersBot A) J).dpow (j i * p)
              (PDEnvelope.of (dividedPowersBot A) J (f i)) := by sorry
end TauCeti.Crystalline

/- BEGIN EXACT PROTOTYPE OMISSION REGISTER
These are mathematical contracts, not Lean declarations. Names in this register
are omitted forms or wider components outside the compilation claim. The packet
and reader are definitive; every omitted condition must be stated on its actual
supplier object before a signature can be introduced.

CrystallineCohomology:CR.4/dieudonne-complex
The cochain/F structure and morphisms are typed. The α_F dictionary on the actual localized
η_p subcomplex, including negative degrees, requires AI.1.

CrystallineCohomology:CR.4/saturated-frobenius
Termwise p-injectivity and the exact bijective-F image criterion are typed. Its equivalence
with α_F:M→η_pM being an isomorphism requires the actual AI.1 η_p subcomplex.

CrystallineCohomology:CR.4/saturation-colimit
The unit and universal morphism interface is typed on actual Dieudonné complexes. Its
explicit identification with the iterated η_p colimit awaits the AI.1 underived contract.

CrystallineCohomology:CR.4/cartier-saturation-mod-p
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.cartier_saturation_mod_p
If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded
groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.

CrystallineCohomology:CR.0/pd-envelope
The concrete Γ-quotient, PD powers, unique lift and quotient are typed. Functoriality is
typed over a fixed PD base; arbitrary change of PD base still requires its exact coefficient
square and compatible base powers.

CrystallineCohomology:CR.0/envelope-quotient-transitivity
The first quotient is typed as a surjective algebra map with the exact PD-generated kernel
and operation compatibility, hence determines the quotient equivalence. The nested-kernel
comparison diagram is not typed.

CrystallineCohomology:CR.0/envelope-base-change
Required inputs: The missing forms require the exact PD-base-change Tor hypotheses, ordinary
p-complete topological algebra and continuous morphisms from DD.1, and the actual Fontaine
θ/coefficient/PD-kernel certificate from AI.0. They must retain these conditions on the
concrete Γ quotient and its ideals.
declaration TauCeti.Crystalline.envelopeBaseChange
Over a fixed PD base A, if B/J is the quotient pair and B→B′ satisfies flatness B/IB→B′/IB′
and Tor₁^B(B′,B/IB)=0, then D_B(J)⊗_B B′≅D_B′(JB′). For change of PD base
(B,I,γ)→(B′,I′,γ′), if B/I→B′/I′ is flat, J′=JB′+I′, then D_B(J)⊗_B B′≅D_B′(J′). Arbitrary
maps always give comparison maps, but these equivalences retain their hypotheses.

CrystallineCohomology:CR.0/envelope-localization
The localized envelope is typed by the ordinary localization universal property and
normalization of the B map. The localized operation formula and simultaneous PD-base
localization diagram are not typed.

CrystallineCohomology:CR.0/regular-envelope
The characteristic-p regular-sequence module equivalence and divided-monomial formula are
typed. The Z/p^n flatness and reduction conclusions of the full node are not typed.

CrystallineCohomology:CR.0/completed-envelope
Required inputs: The missing forms require the exact PD-base-change Tor hypotheses, ordinary
p-complete topological algebra and continuous morphisms from DD.1, and the actual Fontaine
θ/coefficient/PD-kernel certificate from AI.0. They must retain these conditions on the
concrete Γ quotient and its ideals.
declaration TauCeti.Crystalline.completedEnvelope
For the universal envelope D, define its completed underlying complex as LΛ_p(D)=Rlim_e(D⊗^L
Z/p^e). If D has bounded p-power torsion, its degree-zero derived completion is the ordinary
p-adic completion and the negative derived-limit obstruction vanishes; for p-torsionfree D
the finite reductions are ordinary D/p^e. Extend divided powers continuously to the closure
of the specified PD ideal in the ordinary completion whenever its divided-power operations
are p-adically continuous; if the chosen crystalline base ideal contains p, retain its
canonical powers. Do not equip an arbitrary derived complex with ordinary ideal operations.
api TauCeti.Crystalline.completedEnvelope_reduction
For p-torsionfree D, LΛ_p(D)⊗^L Z/p^e≅D/p^e.
api TauCeti.Crystalline.completedEnvelope_lift
A continuous compatible PD map D→C into a complete separated C extends uniquely to D̂→C.
api TauCeti.Crystalline.completedEnvelope_functorial
Envelope maps induce derived completion maps and, under the ordinary criteria, continuous PD
maps.
test TauCeti.Crystalline.test_completedEnvelope_Zp
The completion of (Z_(p),(p)) with canonical powers is the existing Z_p PD ring, including
p=2.
test TauCeti.Crystalline.test_completedEnvelope_modp
A p-killed envelope has derived completion equal to itself in degree0.
test TauCeti.Crystalline.test_completedEnvelope_p2
The ideal(2) in Z₂ is complete but its canonical divided powers are not PD nilpotent.

CrystallineCohomology:CR.0/fontaine-envelope
Required inputs: The missing forms require the exact PD-base-change Tor hypotheses, ordinary
p-complete topological algebra and continuous morphisms from DD.1, and the actual Fontaine
θ/coefficient/PD-kernel certificate from AI.0. They must retain these conditions on the
concrete Γ quotient and its ideals.
declaration TauCeti.Crystalline.fontaineEnvelope
For the AI.0-supplied A_inf=W(O_C^♭) and θ:A_inf→O_C, take the envelope D of kerθ over the
zero-ideal PD base(Z_p,0) and set A_cris=D̂_p by the preceding ordinary-completion
criterion. This object comes with A_inf→D→A_cris, θ extended to A_cris→O_C with zero target
PD ideal for the kerθ powers, and functorial PD maps induced by Witt reduction when the
target ideal contains the image of kerθ. For crystalline use over O_C/p, extend the powers
to(p)+kerθ and impose compatibility with the canonical p-PD base; θ then has target PD
ideal(p), not zero. AI.0 and PadicHodgeTheory identify their Fontaine presentations with
this underlying ring by the qualified universal property.
api TauCeti.Crystalline.fontaineEnvelope_initial
Compatible PD targets of the pair(A_inf,kerθ) receive a unique envelope map.
api TauCeti.Crystalline.fontaineEnvelope_theta
The extended θ annihilates the envelope PD ideal and agrees with θ on A_inf.
api TauCeti.Crystalline.fontaineEnvelope_identify
Any supplier Fontaine presentation satisfying the same completed universal property is
uniquely PD-isomorphic, over A_inf.
test TauCeti.Crystalline.test_fontaineEnvelope_theta
Every γ_n(x),x∈kerθ,n>0 maps to0 under the extended θ.
test TauCeti.Crystalline.test_fontaineEnvelope_identity
The comparison of a Fontaine presentation with itself is the identity by uniqueness.
test TauCeti.Crystalline.test_fontaineEnvelope_p2
At p=2,2 does not belong to kerθ since θ(2)=2; it belongs to the enlarged crystalline
ideal(2)+kerθ with its canonical powers.

CrystallineCohomology:CR.1/pd-scheme
Affine PD scheme and restriction compatibility are typed. The affine test checks the
underlying Spec equality; its comparison of affine ideal and operations with the given pair
remains required.

CrystallineCohomology:CR.1/crystalline-site
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
test TauCeti.Crystalline.test_crisSite_Wn
For X=Spec k over W_n(k), the canonical X→Spec W_n(k) is an object.

CrystallineCohomology:CR.1/site-morphisms
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
declaration TauCeti.Crystalline.crisSiteMap
For compatible X→Y over PD bases S→S′, construct crystalline pullback/topos morphisms with
the source-required base change of thickenings. Construct u:(X/S)_crys→X_Zar by restriction
to U and its sheaf formulas, and the big/small maps i and π with π∘i=id. On quasi-coherent
crystals their cohomology comparisons use the common affine calculations. Compare the
Zariski and étale crystalline cover variants only under a separate descent theorem; the
relation πi=id does not assert equivalence of all sheaf topoi.
api TauCeti.Crystalline.crisSiteMap_comp
Compatible diagrams compose to the canonical composite crystalline inverse image.
api TauCeti.Crystalline.cris_u_sections
For a sheaf F, u_*F over an open U is its sections on the crystalline site of U/S.
api TauCeti.Crystalline.cris_small_big
The displayed maps satisfy πi=id; the qualified crystal cohomology comparison is separate.
test TauCeti.Crystalline.test_crisMap_identity
The identity diagram induces the identity inverse-image functor.
test TauCeti.Crystalline.test_crisMap_open
Restriction along an open U⊂X is the corresponding slice-site restriction.
test TauCeti.Crystalline.test_crisMap_variants
πi=id alone does not identify arbitrary sheaves of the big and small topoi.

CrystallineCohomology:CR.1/structure-sheaves
Actual ring-valued presheaves/sheaves, the quotient natural transformation, sectionwise
kernel and global PD operation compatibility are typed. The kernel as a sheaf of O_crys-
modules, short exact sequence, affine B/J test and nonaffine sheaf epimorphism detector
require E1.
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
test TauCeti.Crystalline.test_crisStructure_affine
For T=Spec B,U=Spec(B/J), the sequence evaluates to0→J→B→B/J→0.
test TauCeti.Crystalline.test_crisStructure_sheaf_epi
The construction uses local lifts of quotient sections; it does not impose global lifts on
nonaffine T.

CrystallineCohomology:CR.1/crystal
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
declaration TauCeti.Crystalline.Crystal
An O_crys-module sheaf E is a crystal if every morphism f:(U,T)→(U′,T′) gives an isomorphism
O_T⊗_(f⁻¹O_T′)f⁻¹(E_T′)→E_T via its canonical restriction map. It is quasi-coherent,
respectively finite locally free, if every E_T has that property as an O_T-module. Tensor,
internal Hom for finite locally free objects, and dual use these actual module operations.
Finite locally free crystals form a rigid tensor exact category, not an arbitrary abelian
category.
api TauCeti.Crystalline.Crystal.pullback_iso
The canonical f^*E_T′→E_T is O_T-linear and invertible.
api TauCeti.Crystalline.Crystal.tensor_eval
Evaluation of E⊗F is E_T⊗_(O_T)F_T.
api TauCeti.Crystalline.Crystal.dual_eval
For finite locally free E, evaluation of E∨ is Hom_(O_T)(E_T,O_T), with
evaluation/coevaluation.
test TauCeti.Crystalline.test_crystal_structure
O_crys with canonical comparisons is a rank-one crystal.
test TauCeti.Crystalline.test_crystal_constant
The crystal from a finite free base module evaluates as its tensor extension to O_T.
test TauCeti.Crystalline.test_crystal_not_abelian
Over W₂(k), cokernel of p:O_crys→O_crys has evaluation k, which is not a finite locally free
W₂(k)-module.

CrystallineCohomology:CR.1/isocrystal
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
declaration TauCeti.Crystalline.Isocrystal
For a smooth k-scheme with k perfect and W=W(k), a finite locally free W-crystal is a
compatible family E_e over W_e. Its isocrystal is the corresponding coefficient object with
Hom groups tensored with Q_p. Given Witt Frobenius and absolute Frobenius of X, an F-crystal
is E with a morphism Φ:F_X^*E→E. In the Stacks convention nondegenerate means locally
admitting V with VΦ=p^i id. For bounded-rank finite locally free crystals its matrix
argument yields a two-sided inverse after multiplying V by a further power of p. The two-
sided bounded-rank refinement is used in CR.3:Frobenius-isogeny; arbitrary F-maps are not
assumed nondegenerate. An F-isocrystal is a rational coefficient object with invertible Φ. A
semilinear cohomology vector space alone is not such a site coefficient.
api TauCeti.Crystalline.Isocrystal.hom
Hom(E[1/p],F[1/p])=Hom(E,F)⊗Q_p in the specified localized category.
api TauCeti.Crystalline.FCrystal.linearize
Evaluation of Φ is linear from the Frobenius-twisted module; its associated endomorphism is
σ-semilinear.
api TauCeti.Crystalline.FCrystal.dual
The dual F-isocrystal uses the inverse transpose of the rationalized Frobenius.
test TauCeti.Crystalline.test_isocrystal_unit
The unit W-crystal with Witt Frobenius gives the unit F-isocrystal.
test TauCeti.Crystalline.test_isocrystal_p
Multiplication by p becomes invertible after rationalization.
test TauCeti.Crystalline.test_isocrystal_zeroF
The zero Frobenius on a nonzero free crystal is not a nondegenerate F-crystal.

CrystallineCohomology:CR.1/pd-stratification
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
declaration TauCeti.Crystalline.PDStratification
For X embedded in a smooth lift P over the PD base, let D(1),D(2) be the compatible
envelopes of the twofold and threefold diagonal, completed when the base is p-adic. A PD
stratification of a module M on D is a D(1)-linear isomorphism ε:p₀^*M→p₁^*M, the identity
on the diagonal, whose two composites on D(2) satisfy ε₁₂ε₀₁=ε₀₂. Completion requires
continuity of ε and its Taylor sums.
api TauCeti.Crystalline.PDStratification.diagonal
Pulling ε to the diagonal gives id_M.
api TauCeti.Crystalline.PDStratification.cocycle
On D(2), ε₁₂∘ε₀₁=ε₀₂ with the specified order.
api TauCeti.Crystalline.PDStratification.from_crystal
The crystal pullback isomorphisms on D(1) define ε and satisfy the cocycle.
test TauCeti.Crystalline.test_stratification_unit
The structure module has its canonical identity-after-base-change stratification.
test TauCeti.Crystalline.test_stratification_three
A triple projection yields the displayed two equal module maps.
test TauCeti.Crystalline.test_stratification_connection
A first-order isomorphism alone does not provide the full divided-Taylor cocycle.

CrystallineCohomology:CR.1/quasi-nilpotent-connection
A coordinate presentation with explicit derivations, Leibniz rules, commuting operators and
p-adic Taylor convergence is typed. The reconstruction of the coordinate-free Ω¹-valued
integrable connection and change-of-coordinate equivalence requires DD.0.

CrystallineCohomology:CR.1/taylor-equivalence
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
declaration TauCeti.Crystalline.crystalConnectionEquivalence
For a smooth/formally smooth lift in the finite p-nilpotent or specified p-complete setting,
eligible quasi-coherent crystals are equivalent to integrable topologically quasi-nilpotent
PD connections on their envelope evaluation. The connection reconstructed from ε has
commuting operators θ_i; the stratification from ∇ is ε(m)=Σ_K θ^K(m)ξ^[K] for
ξ_i=p₁(x_i)−p₀(x_i), with the orientation fixed by this convention. The divided-Taylor
cocycle uses the PD addition identity, not division by K! in the base ring.

CrystallineCohomology:CR.1/finite-witt-evaluation
Required inputs: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and
descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD
maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms,
Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate
presentations do not replace these objects.
declaration TauCeti.Crystalline.finiteWittEvaluation
For a smooth finite-type k-scheme X with a smooth p-adic formal W(k)-lift X̂, evaluation
identifies finite-type crystals over W_e with O_(X̂/p^e)-coherent integrable quasi-nilpotent
connections, compatibly in e. Finite locally free objects correspond to finite locally free
connections. A compatible W-crystal evaluates as E=lim_e E_e on X̂ with complete connection;
rationalization gives the corresponding formal isocrystal connection. For such compatible
finite-type data, quasi-nilpotence modulo p implies quasi-nilpotence at each p^e.

CrystallineCohomology:CR.2/pd-differentials
The degree-one quotient of the existing Kähler module, universal PD derivation, derivative
formula and semilinear map are typed. Higher exterior forms, the full DGA and the
coefficient connection comparison require DD.0.

CrystallineCohomology:CR.2/envelope-differentials
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.envelopeDifferentials
For the universal envelope D of(P,J) over(A,I,γ), the canonical map D⊗_P Ω¹_(P/A)→Ω¹_PD(D/A)
is an isomorphism, without flatness of D/P. If P/A is smooth, the exterior-power version
identifies Ω^q_PD(D/A) with D⊗_P Ω^q_(P/A), and these are finite locally free when P/A has
finite relative dimension. The completed version is the compatible p-adic inverse limit of
the finite-level formulas.

CrystallineCohomology:CR.2/crystalline-cohomology
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.RΓcrys
On the fixed ringed crystalline site set Ru_crys,*:D(O_crys)→D(O_X) to be the enhanced
derived direct image along u, and RΓ_crys(X/S,E)=RΓ(X,Ru_crys,*E), retaining its base-ring
action. Finite-level coefficient reductions and maps of crystalline diagrams use the
corresponding derived functor transformations. Define p-adic cohomology as Rlim_e
RΓ_crys(X/S_e,E_e); ordinary limits of cohomology groups are a conclusion under appropriate
Mittag–Leffler hypotheses.
api TauCeti.Crystalline.RΓcrys_comp
RΓ_crys=RΓ_X∘Ru_crys,* as enhanced functors.
api TauCeti.Crystalline.RΓcrys_map
A compatible diagram and coefficient map induce the canonical contravariant cohomology map.
api TauCeti.Crystalline.RΓcrys_limit
The p-adic object is the derived inverse limit of its specified finite-level theory.
test TauCeti.Crystalline.test_RΓcrys_empty
The empty scheme has zero crystalline cohomology.
test TauCeti.Crystalline.test_RΓcrys_point
For a perfect-field point with structure crystal, the finite-level complex is W_e(k) in
degree0.
test TauCeti.Crystalline.test_RΓcrys_limit_not_groups
Rlim_e K_e is not defined by the collection lim_e H^i(K_e) without a derived-limit
justification.

CrystallineCohomology:CR.2/linearization
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.linearization
Given X→P a closed embedding into a smooth lift and an eligible module N on its compatible
PD envelope D, linearize N by the following sheaf construction: on a thickening(U,T), form
the compatible PD envelope D_(U,T) of the graph U→T×_S P, pull N to it through its map to D,
and take its sections. Sheafify the graph-envelope construction with the appropriate
completed tensor pullback at p-adic levels. The de Rham linearizations of the evaluated
crystal resolve that crystal and have the affine direct-image acyclicity used in the
Poincaré calculation.
api TauCeti.Crystalline.linearization_eval
The value is sections of the coefficient pullback on the graph PD envelope, with the stated
topology.
api TauCeti.Crystalline.linearization_map
A coefficient map induces the graph-envelope sheaf map and respects restrictions.
api TauCeti.Crystalline.linearization_augmentation
The crystal comparisons give E→L(E_D⊗Ω^0), compatible with the de Rham differential.
test TauCeti.Crystalline.test_linearization_zero
Linearization of the zero eligible module is the zero sheaf.
test TauCeti.Crystalline.test_linearization_identity
For the zero-ideal identity embedding, evaluation on the identity thickening returns the
original module.
test TauCeti.Crystalline.test_linearization_PD
The graph uses a PD envelope, whose t^[p] is a separate generator in characteristic p; an
ordinary polynomial neighborhood is not this value.

CrystallineCohomology:CR.2/pd-poincare
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.pdPoincare
For a PD A-algebra B and a B-module M with eligible integrable PD connection, adjoining
finitely many PD variables gives a quasi-isomorphism M⊗_B Ω^•_PD(B/A)→M⊗_B
Ω^•_PD(B⟨z₁,…,z_r⟩/A) with the pulled-back connection. The p-complete version holds with the
stated complete tensor products. For the relative variable complex alone, the augmentation
M→M⊗_B Ω^•_(B⟨z⟩/B) is exact in positive degree over any B; no factorial inversion is
required.

CrystallineCohomology:CR.2/embedding-computation
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.crysEmbeddingComputation
For a p-nilpotent PD base S, a closed embedding X→P with P/S smooth, and a quasi-coherent
crystal E satisfying the source coefficient hypotheses, Ru_*E is represented by the de Rham
complex E_D⊗_(O_P)Ω^•_(P/S) on the compatible envelope D. On an affine p-adic base use the
completed envelope, its completed PD forms and complete coefficient tensor products. These
compute RΓ_crys through derived sheaf global sections, rather than a globally chosen
coordinate complex.

CrystallineCohomology:CR.2/embedding-independence
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.crysEmbeddingIndependent
For two smooth embeddings of X over the fixed PD base, their envelope de Rham models have
canonical refinement quasi-isomorphisms through the product embedding. The maps are
compatible with further refinements in the enhanced category and with eligible coefficient
morphisms. Local lift choices produce explicitly homotopic maps; a coordinate-dependent
affine representative is not declared globally functorial.

CrystallineCohomology:CR.2/smooth-lift-filtration
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.crysSmoothLiftFiltration
If X is the special-fiber reduction of a smooth lift Y over the fixed PD base and E
evaluates to an eligible connection on Y, the crystalline de Rham model identifies with the
ordinary coefficient de Rham complex of Y, completed in the p-adic case. On a chosen
envelope model the PD filtration is Fil^r(D⊗Ω^q)=F_γ^(r−q)J̄⊗Ω^q, with F^a=D for a≤0; d
lowers divided-power weight by1, so this is a subcomplex. After reduction by the base PD
ideal, the smooth-lift filtration gives the corresponding stupid form-degree Hodge
filtration; before that reduction the base PD weights remain present. Filtered embedding
independence must be proved under the precise comparison hypotheses, rather than inferred
from unfiltered independence.

CrystallineCohomology:CR.2/formal-and-end0
Required inputs: DD.0 must supply higher exterior differential forms, coefficient integrable
connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic
graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-
torsion comparison. These actual coefficient complexes are required to state the augmented
Poincaré quasi-isomorphism and its embedding-independence diagrams.
declaration TauCeti.Crystalline.crysFormalEnd0
For a smooth proper W(k)-lift Y and a compatible finite locally free crystal E,
RΓ_crys(X/W,E)≅RΓ(Ŷ,DR(E_Ŷ))≅RΓ(Y,DR(E_Y))̂ when E and its connection algebraize. After
inverting p this agrees with the coefficient de Rham complex on the characteristic-zero
generic fiber. Apply this to End⁰(E)=ker(tr:End E→O) with its induced connection; when
rank(E) is invertible, End E=O·id⊕End⁰(E), compatibly with the connection and crystalline
comparison. Without that invertibility do not infer this direct summand formula.

CrystallineCohomology:CR.3/crystalline-descent
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysDescent
For a quasi-compact separated X over a p-nilpotent PD base and an eligible quasi-coherent
crystal E, a finite affine open cover gives the alternating Čech–Alexander totalization of
its envelope coefficient de Rham complexes, canonically equivalent to RΓ_crys(X/S,E).
Hypercover descent extends this to the bounded-below scope of the E2 criterion. The étale
crystalline topology comparison requires the actual site comparison of CR.1; no unbounded
descent or change-of-topology equivalence is inferred from a finite open cover alone.

CrystallineCohomology:CR.3/derived-base-change
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysBaseChange
For a PD base map(A′,I′)→(A,I), X′/A′/I′ and its cartesian pullback X, there is a canonical
map K′⊗^L_(A′)A→K. It is an equivalence if p is nilpotent in A′, E′ is a flat quasi-coherent
crystal, X′/A′/I′ is qcqs and lci, and X′ and A/I are Tor-independent over A′/I′. In
particular it applies to smooth families with finite locally free coefficients. For
p-complete Noetherian bases and perfect cohomology, the compatible finite-level equivalences
yield the completed base-change equivalence using DD.1.

CrystallineCohomology:CR.3/proper-perfectness
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysPerfect
For a Noetherian p-nilpotent PD base(A,I,γ), X proper smooth over A/I and E a finite locally
free crystal, K=RΓ_crys(X/A,E) is perfect in D(A). For a Noetherian p-complete PD base with
p nilpotent in A/I, a compatible finite locally free crystal family gives a perfect K=Rlim_e
K_e and K⊗^L_A A/p^e≅K_e. For k perfect this yields a perfect W(k)-complex with finite
W(k)-module cohomology and amplitude in[0,2d] when dim X≤d. Individual H^i(K) may have
p-torsion.

CrystallineCohomology:CR.3/cup-product
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysCup
Using the enhanced derived tensor and multiplication O_crys⊗O_crys→O_crys, construct
K(E)⊗^L_A K(F)→K(E⊗F), with unit A→K(O). It is associative, natural in the
scheme/coefficients, compatible with finite reductions, and graded commutative on structure
cohomology: xy=(−1)^(ij)yx for x∈H^i,y∈H^j. For exterior products use the two pullbacks to
X×Y. Neither graded commutativity nor p=2 alone implies every odd cohomology square is zero.
api TauCeti.Crystalline.crysCup_unit
The image of1 acts as the identity.
api TauCeti.Crystalline.crysCup_graded_comm
xy=(−1)^(ij)yx in structure cohomology.
api TauCeti.Crystalline.crysCup_reduction
The derived coefficient-reduction map carries cup products to their finite-level cup
products.
test TauCeti.Crystalline.test_crysCup_point
For Spec k/W, the cup product is ordinary multiplication in W(k).
test TauCeti.Crystalline.test_crysCup_zero
A zero coefficient factor gives the zero product map.
test TauCeti.Crystalline.test_crysCup_P1
For P¹ the degree-two hyperplane class squares to0 in degree4.

CrystallineCohomology:CR.3/kunneth
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysKunneth
For X,Y proper smooth over a perfect field k and finite locally free crystal coefficients
E,F, external cup product is an equivalence K(X,E)⊗^L_W K(Y,F)≅K(X×_kY,E⊠F). It preserves
cup products, coefficient reductions and the later crystalline Frobenius. The tensor product
is derived; an ordinary tensor formula for individual cohomology groups requires its Tor
terms or additional freeness assumptions.

CrystallineCohomology:CR.3/frobenius-map
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysFrobenius
Given a PD base(A,I,γ) with p∈I and a PD ring endomorphism σ lifting Frobenius modulo p,
absolute Frobenius of X/S₀ and σ induce a crystalline-topos map. For a coefficient F-map
Φ:F_X^*E→E, compose base change, relative-Frobenius pullback and Φ to obtain
F_K:K⊗^L_(A,σ)A→K. On cohomology the corresponding endomorphism is σ-semilinear. Its
definition does not include invertibility after inverting p; that is the separate successor
theorem.
api TauCeti.Crystalline.crysFrobenius_semilinear
The cohomology map obeys F(ax)=σ(a)F(x).
api TauCeti.Crystalline.crysFrobenius_linearize
Its A-linear form has source K⊗^L_(A,σ)A.
api TauCeti.Crystalline.crysFrobenius_lift
On a lift, pullback acts on a q-form as the qth exterior derivative of the lift map,
identified in CR.4 with p^qF.
test TauCeti.Crystalline.test_crysFrobenius_point
For Spec k it is Witt Frobenius on W(k), σ-linear rather than W(k)-linear when σ≠id.
test TauCeti.Crystalline.test_crysFrobenius_zero
A zero coefficient F-map gives a zero cohomology map; the construction alone implies no
isogeny.
test TauCeti.Crystalline.test_crysFrobenius_P1
On the degree-two hyperplane class of P¹, absolute Frobenius multiplies by p.

CrystallineCohomology:CR.3/weak-lefschetz
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysWeakLefschetz
Let X/k be smooth projective of dimension d over a perfect field and L a line bundle. Assume
i_L≥0 and for every coherent F, H^i(X,F⊗L^n)=0 for i>i_L and all sufficiently large n. Then
for n≥n₀ and every smooth hypersurface H∈|L^n|, restriction H^j_crys(X/W)→H^j_crys(H/W) is
an isomorphism for j<d−i_L−1 and injective with torsionfree cokernel for j=d−i_L−1. The
ample case has i_L=0.

CrystallineCohomology:CR.3/torsion-and-models
Required inputs: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-
change maps with derived tensor products. A0-extension supplies proper coherent perfectness,
dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies
elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still
requires its source proof certificate.
declaration TauCeti.Crystalline.crysAcceptanceModels
Acceptance includes K(P^d/W) with H^(2i)=W·h^i for0≤i≤d and odd groups0; smooth proper
curves with H⁰=W,H²=W(−1) and H¹ finite free; and ordinary/supersingular elliptic curves
with rational Frobenius slopes{0,1}/{1/2,1/2}. BMS1 Theorem2.10 supplies a smooth projective
surface H over the stated mixed-characteristic O whose special fiber has
H²_crys(H_k/W(k))_tor≅k⊕k, while the generic p-adic étale torsion is Z/p². This last
comparison is an acceptance example from the source, not a new étale p-adic comparison owned
here.

CrystallineCohomology:CR.3:Frobenius-isogeny/inseparable-control
Required inputs: The exact E1 site pullback and DD.1 enhanced p-inverted linearization are
required. The inseparable factorization must retain the α_(p^q) cone bound, H^i
multiplication by p^(q(i+1)), relative Frobenius p^d factor, and bounded-rank two-sided
coefficient inverse; a bare semilinear vector space cannot stand in for the crystal.
declaration TauCeti.Crystalline.crysInseparableControl
If f:X′→X is a locally iterated α_p-cover of constant degree q over a PD base with p in its
PD ideal, pullback of a quasi-coherent crystal has a cone with cohomology sheaves killed by
q. On H^i the pullback kernel and cokernel are killed by q^(i+1). For X/S₀ smooth of
relative dimension d, relative Frobenius is such a cover of degree p^d and these groups are
killed by p^(d(i+1)).

CrystallineCohomology:CR.3:Frobenius-isogeny/rational-frobenius
Required inputs: The exact E1 site pullback and DD.1 enhanced p-inverted linearization are
required. The inseparable factorization must retain the α_(p^q) cone bound, H^i
multiplication by p^(q(i+1)), relative Frobenius p^d factor, and bounded-rank two-sided
coefficient inverse; a bare semilinear vector space cannot stand in for the crystal.
declaration TauCeti.Crystalline.crysFrobeniusIsogeny
Let(A,I,γ) be a Noetherian p-complete PD base with p∈I and a PD Frobenius lift σ, X proper
smooth over A/I, and E a finite locally free nondegenerate F-crystal with bounded rank and
an inverse up to a power of p. Then the actual map K⊗^L_(A,σ)A→K from CR.3 becomes an
equivalence after inverting p. In particular over W(k), Frobenius on each finite-dimensional
H^i_crys(X/W)[1/p] is a σ-semilinear automorphism. Integral H^i need not be a finite free
F-crystal.

CrystallineCohomology:CR.3:duality/trace
Required inputs: E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and
A0-extension their coherent duality input. The crystalline purity, residues, support
functors and trace identification need the recorded Berthelot VI/VII or independent
replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and
base-change diagrams are required before typing the derived perfect-pairing statements.
declaration TauCeti.Crystalline.crysTrace
For X/k proper smooth of pure dimension d over a perfect field, construct Tr_X:K(X/W)→W[−2d]
and Tr_(X,e):K(X/W_e)→W_e[−2d], compatible with derived reduction. Normalize by
Tr_(P^d)(h^d)=1. The complementary route uses the Ekedahl I.2 trace W_eΩ_X^d→f_e^!W_e[−d],
its I.3 projective-space normalization and its I.5 comparison with the crystalline trace.
The codimension-filtration/local-residue inputs of Berthelot VI–VII remain a proof gate.
api TauCeti.Crystalline.crysTrace_projective
Tr_(P^d)(h^d)=1.
api TauCeti.Crystalline.crysTrace_reduction
Tr_X⊗^L W_e=Tr_(X,e) under the actual reduction equivalence.
api TauCeti.Crystalline.crysTrace_etale_local
The local residue trace is compatible with the pointed étale comparison used in Ekedahl I.5.
test TauCeti.Crystalline.test_crysTrace_point
For X=Spec k,d=0, trace is id_W.
test TauCeti.Crystalline.test_crysTrace_P1
The degree-two hyperplane class of P¹ has trace1.
test TauCeti.Crystalline.test_crysTrace_no_torsion_free
Trace is constructed on K even when individual H^i have torsion; no ordinary group duality
is imposed.

CrystallineCohomology:CR.3:duality/poincare-pairing
Required inputs: E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and
A0-extension their coherent duality input. The crystalline purity, residues, support
functors and trace identification need the recorded Berthelot VI/VII or independent
replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and
base-change diagrams are required before typing the derived perfect-pairing statements.
declaration TauCeti.Crystalline.crysPoincareDuality
For the same X and a finite locally free crystal E, cup product followed by trace gives
K(X,E)⊗^L_W K(X,E∨)→W[−2d] and its adjoint is an equivalence K(X,E)≅RHom_W(K(X,E∨),W)[−2d].
It is compatible with finite-level reduction and qualified perfect base change. The
structure case rationalizes to perfect pairings H^i⊗H^(2d−i)→W[1/p], while integral torsion
contributes through the derived dual and is not erased.

CrystallineCohomology:CR.3:duality/gysin
Required inputs: E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and
A0-extension their coherent duality input. The crystalline purity, residues, support
functors and trace identification need the recorded Berthelot VI/VII or independent
replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and
base-change diagrams are required before typing the derived perfect-pairing statements.
declaration TauCeti.Crystalline.crysGysin
For a proper morphism f:X→Y between proper smooth pure-dimensional k-schemes, define
f_*:K(X/W)→K(Y/W)[2(dimY−dimX)] as the adjoint of f^*:K(Y/W)→K(X/W) under the normalized
derived pairings. For a regular closed immersion of codimension c this sends1 to its
crystalline class in H^(2c)(Y). Prove projection formula, composition and qualified Tor-
independent base change; identify the regular-immersion map with the local PD residue/purity
construction before exporting it as geometric Gysin.
api TauCeti.Crystalline.crysGysin_comp
(g∘f)_*=g_*∘f_* with the corresponding summed dimension shifts.
api TauCeti.Crystalline.crysGysin_projection
f_*(x·f^*y)=f_*x·y.
api TauCeti.Crystalline.crysGysin_trace
For the structural map X→Spec k, f_*=Tr_X.
test TauCeti.Crystalline.test_crysGysin_identity
For id_X, pushforward is the identity.
test TauCeti.Crystalline.test_crysGysin_hyperplane
For P^(d−1)→P^d, the image of1 is h.
test TauCeti.Crystalline.test_crysGysin_shift
For X→Spec k the target shift is−2dimX, agreeing with the trace.

CrystallineCohomology:CR.3:duality/diagonal
Required inputs: E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and
A0-extension their coherent duality input. The crystalline purity, residues, support
functors and trace identification need the recorded Berthelot VI/VII or independent
replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and
base-change diagrams are required before typing the derived perfect-pairing statements.
declaration TauCeti.Crystalline.crysDiagonal
For X proper smooth of pure dimension d, define [Δ_X]=Δ_*(1)∈H^(2d)_crys(X×X/W) and identify
it under derived Künneth with coevaluation W→K(X)⊗^L K(X)[2d], using the Poincaré dual
identification. Evaluation is cup followed by Tr_X. The two contraction composites are
identities. For P^d, [Δ]=Σ_(i=0)^d h₁^i h₂^(d−i). All comparisons preserve finite-level
reduction and the normalized traces.
api TauCeti.Crystalline.crysDiagonal_action
The diagonal correspondence acts as id_K.
api TauCeti.Crystalline.crysDiagonal_triangles
Evaluation and coevaluation satisfy both triangular identities.
api TauCeti.Crystalline.crysDiagonal_projective
On P^d, [Δ]=Σh₁^i h₂^(d−i).
test TauCeti.Crystalline.test_crysDiagonal_point
For the point the diagonal class and coevaluation are1.
test TauCeti.Crystalline.test_crysDiagonal_P1
For P¹, [Δ]=h₁+h₂.
test TauCeti.Crystalline.test_crysDiagonal_torsion
Coevaluation lives in the derived tensor; it is not specified by choosing a free basis of
every H^i.

CrystallineCohomology:CR.4/relative-witt-complex
The finite F–V pro-DGA and coefficient rings are typed. The length-one test checks degree
zero; its higher Ω-DGA comparison requires DD.0. The unit-symbol test checks closedness and
F-invariance for every unit, but does not yet instantiate a Laurent torus or its nonzero
form.

CrystallineCohomology:CR.4/relative-de-rham-witt
Initiality, actual morphisms, degree-zero ring identification and variance over a commuting
base square are typed. The Ω-DGA length-one comparison, its map compatibility and explicit
Laurent-torus basis test require DD.0 and the basic-form contracts.
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
test TauCeti.Crystalline.test_relativeDRW_torus
The torus has the displayed nonzero dlog[t] class with F fixed and d zero.

CrystallineCohomology:CR.4/witt-basic-differentials
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.basicWittExpansion
For S=A[T₁,…,T_d], A a Z_(p)-algebra, weights are k∈Z[1/p]≥0^d; order the support by
increasing p-valuation, with a fixed tie order invariant under k↦p^a k. A partition is a
sequence of intervals I₀,…,I_q with I₀ allowed empty and later intervals nonempty. Put
u(k)=max(0,−min_i v_p(k_i)) and t(I)=−min_(i∈I)v_p(k_i). The basic form e(ξ,k,P) uses
V^u(I₀)(η[T]^(p^u(I₀)k_I₀)) in block0, dV^u(I)([T]^(p^u(I)k_I)) for nonintegral later
blocks, and F^(−t(I))d[T]^(p^t(I)k_I) for integral later blocks, in order. If I₀ is empty,
place η in the first dV factor for nonintegral k, and before the product for integral k;
ξ=V^u(k)η. Every W_rΩ^q_(S/A) has a unique finite expansion in these forms, with u(k)<r and
ξ∈V^u(k)W_(r−u(k))(A). Infinite forms use convergent coefficient families in the restriction
topology.

CrystallineCohomology:CR.4/witt-localization-descent
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.wittEtaleDescent
For an étale R→S over A, the natural map W_r(S)⊗_(W_r(R))W_rΩ^*_(R/A)→W_rΩ^*_(S/A) is an
isomorphism of differential graded algebras, with the uniquely extended derivation on the
tensor product. BMS1§10.8 supplies this for every Z_(p)-base; the older LZ1.7 route assumes
p nilpotent or F-finite. For saturated forms over F_p use BLM5.3.5. Finite localization
inverts [s]; infinite saturated localization first inverts [s] and then takes strict
completion. These formulas construct Zariski and étale sheaves and identify each finite form
sheaf as quasi-coherent on the Witt scheme. The differential is not the naive1⊗d for an
arbitrary étale tensor, though a sufficiently high Frobenius twist makes it linear at a
fixed p-nilpotent length.

CrystallineCohomology:CR.4/witt-quotients-topologies
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.wittQuotientCompletion
For an ideal I⊂R, the kernel of W_rΩ^*_(R/A)→W_rΩ^*_((R/I)/A) is the differential graded
ideal generated by W_r(I)=ker(W_r(R)→W_r(R/I)). For finitely generated I with generators Σ,
the filtrations generated by {[a^s]:a∈Σ} and by the differential kernel for I^s are cofinal.
On W_r(R), [p]^(2s)W_r(R)⊂p^sW_r(R), p^(rs)W_r(R)⊂W_r(pR)^s, W_r(pR)^(p^r s)⊂[p]^sW_r(R), so
the three topologies are cofinal. For a finitely generated base ideal I⊂A, the procomplexes
{W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A)/[I^s]}_s and {W_rΩ^*_(R/I^sR)/(A/I^s)}_s are isomorphic; [I^s]
is the ideal generated by Teichmüller lifts of elements of I^s. Their ordinary inverse
limits agree. This does not assert arbitrary ordinary completion is derived completion.

CrystallineCohomology:CR.4/continuous-relative-witt
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.continuousRelativeWitt
For every Z_(p)-algebra map A→R and finite r, define W_rΩ^(q,cont)_(R/A)=lim_s
W_rΩ^q_((R/p^s)/(A/p^s))≅lim_s(W_rΩ^q_(R/A)/p^s). Use the induced differential and
compatible R,F,V to make a continuous relative F–V procomplex. This is degreewise ordinary
p-completion at fixed Witt length. Derived completion and passage r→∞ are separate
comparisons, with the DD.1 bounded-torsion or perfectness hypotheses retained.
api TauCeti.Crystalline.continuousWitt_eval
An element is a family of forms modulo p^s compatible under quotient restriction.
api TauCeti.Crystalline.continuousWitt_map
A commuting square A→R, A′→R′ gives the induced compatible map on these p-adic limits.
api TauCeti.Crystalline.continuousWitt_operators
R,F,V,d act coordinatewise and satisfy the finite-level identities.
test TauCeti.Crystalline.test_continuousWitt_p_nilpotent
If p^N=0 on A and R, the defining tower is eventually constant and recovers W_rΩ_(R/A).
test TauCeti.Crystalline.test_continuousWitt_identity
For R=A the result has only degree0, the p-completion of W_r(A).
test TauCeti.Crystalline.test_continuousWitt_r1
At r=1 it is the degreewise p-completed ordinary relative de Rham complex.

CrystallineCohomology:CR.4/torus-integral-part
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.wittTorusIntegral
For S=A[T₁^±1,…,T_d^±1], the basic Witt expansion extends to all weights a∈p^(−r)Z^d,
ordered by v_p(a_i), including v_p(0)=∞. Partition all coordinate indices into ordered
blocks I₀,…,I_q, with I₀ possibly empty and the others nonempty. Nonintegral blocks use V
and dV; integral nonzero blocks use F^v d of the corresponding divided-weight Teichmüller
monomial; zero blocks use dlog of the product of their coordinates, as in the three cases of
BMS1 10.12. The coefficient module for weight a is V^u(a)W_(r−u(a))(A), u(a)=max(−min_i
v_p(a_i),0). The map τ:Ω^*_(W_r(A)[U^±1]/W_r(A))→W_rΩ^*_(S/A), U_i↦[T_i], is injective and a
quasi-isomorphism. Its image is exactly the integral-weight subcomplex; the fractional-
weight complement is acyclic. The image depends on these coordinates.

CrystallineCohomology:CR.4/perfectoid-base-change
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.wittPerfectoidBaseChange
For a homomorphism A→A′ of integral perfectoid rings, a smooth A-algebra R, R′=R⊗_A A′, and
r≥1, the W_r(A)-modules W_rΩ^q_(R/A) and W_r(A′) are Tor-independent in every degree q. The
canonical map W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A′)→W_rΩ^*_(R′/A′) is an isomorphism of differential
graded algebras. The statement is finite-length and algebraic; a continuous or derived
inverse-limit extension requires its own completion comparison.

CrystallineCohomology:CR.4/classical-regular-comparison
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.classicalSaturatedComparison
For R smooth over a perfect F_p-algebra, the initial classical relative de Rham–Witt complex
agrees with the saturated complex, compatibly with d,F,V,Teichmüller and finite quotients.
For a regular Noetherian F_p-algebra R the absolute classical/saturated comparison is also
an isomorphism, using Popescu approximation and filtered-colimit compatibility at finite
length. If R has a p-complete p-torsionfree smooth lift A with a Frobenius lift, the natural
Ω^(cont)_(A)→WsatΩ_R is a quasi-isomorphism by the Cartier-type completion theorem. Its
chosen-lift map is not claimed to be canonical without the derived comparison and lift-
independence argument.

CrystallineCohomology:CR.4/crystalline-comparison
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.crystallineWittComparison
Let A be a Z_(p)-algebra with p nilpotent, and X smooth over A. For each r≥1,
Ru_*O_(X/W_r(A)),crys≃W_rΩ^*_(X/A) on X_Zar, where X→Spec W_r(A) uses the first Witt
coordinate and the canonical base PD ideal. More generally a flat quasi-coherent crystal E
has the model E_(W_r X)⊗_(W_rO_X)W_rΩ^*_(X/A), with its crystal-induced differential;
flatness is essential in the LZ3.8 comparison. For X smooth over a perfect field k, the
compatible tower gives Ru_*O_(X/W(k)),crys≃Rlim_r W_rΩ_X^*≃WΩ_X^*, and corresponding global
RΓ comparisons. The last ordinary-limit identification uses surjective restriction
degreewise and the bounded smooth dimension.

CrystallineCohomology:CR.4/degree-scaled-frobenius
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.wittCrystallineFrobenius
The graded Witt F is not a cochain endomorphism: dF=pFd. The degree-scaled φ^q=p^qF is a
cochain endomorphism on the characteristic-p infinite Witt complex, and agrees with
crystalline absolute Frobenius under the comparison. At finite length its source and target
lengths are those of F:W_(r+1)Ω→W_rΩ. The relative version uses the actual base Frobenius
twist and pullback map before degree scaling; no A-linear absolute map is imposed when
Frobenius acts nontrivially on A.

CrystallineCohomology:CR.4/leta-fixed-point
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.strictDieudonneFixedPoint
Sending a strict Dieudonné complex M to its derived p-complete complex with α_F:M≃Lη_pM
gives an equivalence with the category of derived p-complete Lη_p-fixed objects. The
enhanced fixed-point ∞-category is defined by the homotopy equalizer, with a specified
equivalence α, not merely by the property that some equivalence exists. Its mapping spaces
are discrete, and it agrees with the ordinary derived fixed-point category. The strict model
is recovered from the compatible Bockstein complexes of the p-power reductions. This is a
comparison of categories and actual morphisms, not an assertion that every p-complete
complex is fixed.

CrystallineCohomology:CR.4/witt-slope-spectral-sequence
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.wittSlopeSpectralSequence
For smooth proper X of dimension d over a perfect field k, the degree filtration of WΩ_X
gives a strongly convergent hypercohomology spectral sequence
E₁^(a,b)=H^b(X,WΩ_X^a)⇒H^(a+b)_crys(X/W(k)), with0≤a≤d. After inverting p, E₁ terms are
finite-dimensional isocrystals, the a-th column has crystalline slopes in[a,a+1), and the
sequence degenerates at E₁. Finite-level degree filtrations give the corresponding
hypercohomology spectral sequences for W_rΩ; inverse-limit passage uses Rlim rather than an
unjustified interchange of cohomology and ordinary limits. Integral E₁-degeneration or
finite generation of every integral H^b(WΩ^a) is not asserted.

CrystallineCohomology:CR.4/nygaard-filtration
The concrete degree submodules, divided degree-scaled F and three algebraic tests are typed.
Differential stability, maximality, multiplicative/completeness assertions and the filtered
η/geometric comparison require the named supplier complexes.
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
api TauCeti.Crystalline.Nygaard.decalage
φ maps N≥i isomorphically to p^iWΩ∩η_pWΩ.

CrystallineCohomology:CR.4/nygaard-filtration-comparisons
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.nygaardComparisons
Divided Frobenius modulo the projection to ordinary Ω induces a quasi-isomorphism
gr_N^i(WΩ)≃τ≤iΩ_(R/k), where τ is canonical good truncation. There is a cofiber sequence
WΩ/N≥i --p→ WΩ/N≥(i+1)→Ω≤i_(R/k), where Ω≤i is stupid Hodge truncation. For a p-complete
smooth W(k)-lift A of R with a chosen Frobenius lift, its induced map of ordinary forms
gives quasi-isomorphisms p^max(i−q,0)Ω^(q,cont)_(A/W)→N≥iWΩ. This chosen-lift description is
not asserted independent of the Frobenius lift for all i, especially i≥p.

CrystallineCohomology:CR.4/logarithmic-witt-sheaf
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.LogWitt
For a regular F_p-scheme X, q≥0 and r≥1, define W_rΩ^q_(X,log) as the étale subsheaf of
W_rΩ_X^q generated by dlog[u₁]∧…∧dlog[u_q] for units u_j, equivalently the image of G_m^⊗q
under the displayed multilinear map. In degree0 this is the constant Z/p^r generated by1.
The Zariski image construction has the corresponding étale sheafification; equality is not
imposed on every Zariski open section group. Define WΩ^q_log as the inverse limit on the
pro-étale site for the smooth perfect-field case. These are ordinary logarithmic Hodge–Witt
coefficients; they do not require choosing a log structure on X.
api TauCeti.Crystalline.LogWitt.symbol
A tuple of units maps to the wedge of their Teichmüller dlog forms.
api TauCeti.Crystalline.LogWitt.closed_fixed
Every local logarithmic form is closed and fixed by the induced finite quotient F.
api TauCeti.Crystalline.LogWitt.map
Pullback of schemes sends a unit symbol to the symbol of its pulled-back units.
test TauCeti.Crystalline.test_logWitt_zero_degree
W_rΩ⁰_log is the constant Z/p^r generated by1.
test TauCeti.Crystalline.test_logWitt_torus
On G_m, the symbol of t is dlog[t], a closed degree-one section.
test TauCeti.Crystalline.test_logWitt_not_all
On Spec F_p[t] at length1, dt is not a logarithmic section on the whole scheme: its Cartier
image is0 whereas logarithmic forms are Cartier fixed.

CrystallineCohomology:CR.4/logarithmic-witt-sequences
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.logWittExactSequences
For regular F_p-schemes,0→W_rΩ^q_log→W_rΩ^q --1−F→ W_rΩ^q/dV^(r−1)Ω^(q−1)→0 is étale exact,
where finite F is induced from length r+1 and becomes well-defined in that quotient. As pro-
sheaves this is the R−F sequence0→W_•Ω^q_log→W_•Ω^q→W_•Ω^q→0. For positive m,n there is an
exact sequence0→W_nΩ^q_log --p^m→W_(n+m)Ω^q_log --R^n→W_mΩ^q_log→0. On a smooth scheme over
perfect k, the pro-étale sequence of complexes0→WΩ^i_log[−i]→N≥iWΩ --φ_i−1→WΩ→0 is
degreewise exact, and WΩ^i_log≃Rlim_r W_rΩ^i_log. Neither a same-length unquotiented F
endomorphism nor Zariski surjectivity is substituted for these statements.

CrystallineCohomology:CR.4/semistable-log-witt-models
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.LogWittModel
For a finite-type strictly semistable fine log scheme(X,L) over the standard log point κ°,
choose an admissible simplicial embedding system into smooth log W-lifts(Y^*,M^*) over W°
and(Z^*,N^*) over W[t]°. Let D_l^*,E_l^* be the base-compatible log PD envelopes from DL
B.2. Define the pro-complexes Wω_X^*=Ru_*[Ω^*_(Y^*,M^*)/W°⊗O_(D_l^*)] and
Wω̃_X^*=Ru_*[Ω^*_(Z^*,N^*)/Wtriv⊗O_(D_l^*)], independent of embeddings by log PD
Poincaré/descent. Their rational derived limits have the monodromy triangle Wω[−1]→Wω̃→Wω
--N→Wω, with first map wedge dlog t. Define Sato’s cohomological WΞ_X^* from its stated log-
PD quotient complex, and compare its rational limit to the convergent ω_X^+ model. CR.4 owns
these Witt models; CR.5 supplies log sites/Poincaré and CR.6 owns N and Hyodo–Kato
comparisons.
api TauCeti.Crystalline.LogWittModel.envelope_eval
A chosen admissible embedding evaluates to the two displayed log de Rham PD-envelope
procomplexes.
api TauCeti.Crystalline.LogWittModel.embedding_independence
The product-embedding maps are compatible quasi-isomorphisms and satisfy the cocycle.
api TauCeti.Crystalline.LogWittModel.rational_compare
After Rlim and inversion of p the actual comparison agrees with DL(B.5), compatibly with
wedge dlog t.
test TauCeti.Crystalline.test_logWittModel_point
For the standard log point κ°, Wω has W in degree0 and Wω̃ has the extra dlog t direction
giving the stated triangle.
test TauCeti.Crystalline.test_logWittModel_diagonal_embedding
Comparing an embedding with itself via its diagonal product induces the identity.
test TauCeti.Crystalline.test_logWittModel_rational_scope
DL(B.5) is asserted after inversion of p; an integral tube isomorphism is not included.

CrystallineCohomology:CR.4/log-witt-proper-support
Required inputs: DD.0 supplies ordinary higher forms, exterior products and length-one
comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero
strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced
fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-
perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré,
and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source
gates remain explicit.
declaration TauCeti.Crystalline.LogWittSupport
For an open immersion F:U⊂X in the preceding semistable setting, retain the actual DL
rational Witt objects F!F^*Wω̃_(X,K₀) and F!F^*WΞ_(X,K₀). Construct their natural comparison
maps to ω̃_(U,X) and ω^+_(U,X), respectively, by the LemmaB.3 tube proper-support comparison
and(B.6)/(B.9). They fit into the commuting(B.10) diagram with the wedge dlog t map. The
convergent proper-support object is defined by its embedding-system tube functor f!_(U*,X*),
not by identifying it with ordinary étale F!F^* without a theorem. DL only supplies these
natural maps at(B.6)/(B.9); no blanket proper-support equivalence is asserted here.
api TauCeti.Crystalline.LogWittSupport.compare
The two comparison morphisms have exactly the sources and targets displayed in(B.6)/(B.9).
api TauCeti.Crystalline.LogWittSupport.open_identity
For U=X, the tube support functor is the identity and the comparison recovers the full
rational model comparison.
api TauCeti.Crystalline.LogWittSupport.dlog_square
The two comparisons commute with wedge dlog t as in(B.10).
test TauCeti.Crystalline.test_logWittSupport_empty
For U=∅ both extension-by-zero sources are zero.
test TauCeti.Crystalline.test_logWittSupport_full
For U=X, the comparison is the preceding full-model equivalence.
test TauCeti.Crystalline.test_logWittSupport_map
For a general open, the contract is a natural comparison morphism; an equivalence does not
follow solely from(B.6)/(B.9).
END EXACT PROTOTYPE OMISSION REGISTER -/
