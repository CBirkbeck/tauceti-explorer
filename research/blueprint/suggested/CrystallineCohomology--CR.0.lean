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
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Functoriality
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.WittVector.Complete
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Nilpotent.Lemmas
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Algebra.MvPolynomial.Basic
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
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.IdealSheaf.Subscheme
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.CategoryTheory.Sites.Continuous
import Mathlib.CategoryTheory.Sites.CoverLifting
import Mathlib.CategoryTheory.Limits.Preserves.Finite
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryFan
import Mathlib.CategoryTheory.Limits.Shapes.IsTerminal
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.EssentialImage
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.FinCategory.Basic
import Mathlib.Topology.Sheaves.Sheaf
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Sites.InducedTopology
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Defs
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Identities
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.RingTheory.Nilpotent.Lemmas
import Mathlib.Algebra.Homology.Single
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.Algebra.Homology.ShortComplex.Abelian
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.RingTheory.AdicCompletion.Basic
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
-- TauCeti.PD.test_candidate_zero_index: Degree zero at zero is one.
example (δ : AdditivePowers I) : δ.dpow 0 0 = 1 := by sorry
-- TauCeti.PD.test_candidate_positive_at_zero: Degree two at zero is zero.
example (δ : AdditivePowers I) : δ.dpow 2 0 = 0 := by sorry
-- TauCeti.PD.test_candidate_rational: Over a commutative ℚ-algebra, the candidate of γ has the value (n!)⁻¹·xⁿ at every x of the ideal.
example {R : Type*} [CommRing R] [Algebra ℚ R] (K : Ideal R) (γ : DividedPowers K) (n : ℕ) (x : R) (hx : x ∈ K) : (AdditivePowers.ofDividedPowers γ).dpow n x = (n.factorial : ℚ)⁻¹ • x ^ n := by sorry

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
-- TauCeti.PD.test_generators_degree_two: The generated structure has the required quadratic mixed term.
example (δ : AdditivePowers I) (S : Set A) (hS hm hc) (x y : A) (hx : x ∈ I) (hy : y ∈ I) : (δ.toDividedPowers S hS hm hc).dpow 2 (x+y) = δ.dpow 2 x + x*y + δ.dpow 2 y := by sorry
-- TauCeti.PD.test_generators_outside: The constructed total operation at degree zero outside I is zero, not one.
example (δ : AdditivePowers I) (S : Set A) (hS hm hc) (x : A) (hx : x ∉ I) : (δ.toDividedPowers S hS hm hc).dpow 0 x = 0 := by sorry
-- TauCeti.PD.test_generators_inner_one: Iteration with inner index one gives back the unchanged operation.
example (δ : AdditivePowers I) (S : Set A) (hS hm hc) (n : ℕ) (x : A) (hx : x ∈ I) : (δ.toDividedPowers S hS hm hc).dpow n ((δ.toDividedPowers S hS hm hc).dpow 1 x) = δ.dpow n x := by sorry

-- CrystallineCohomology:CR.0/sum-convolution
def convolution (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (x y : A) : A := by sorry
lemma convolution_eq (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (x y : A) : convolution γ ε n x y = ∑ k ∈ antidiagonal n, γ.dpow k.1 x * ε.dpow k.2 y := by sorry
lemma convolution_swap (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (x y : A) : convolution γ ε n x y = convolution ε γ n y x := by sorry
lemma convolution_mem (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (hn : n ≠ 0) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : convolution γ ε n x y ∈ I ⊔ J := by sorry
-- TauCeti.PD.test_convolution_zero: C₀(0,0)=1.
example (γ : DividedPowers I) (ε : DividedPowers J) : convolution γ ε 0 0 0 = 1 := by sorry
-- TauCeti.PD.test_convolution_quadratic: C₂(x,y)=γ₂(x)+xy+ε₂(y).
example (γ : DividedPowers I) (ε : DividedPowers J) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : convolution γ ε 2 x y = γ.dpow 2 x + x*y + ε.dpow 2 y := by sorry
-- TauCeti.PD.test_convolution_same: For a single PD structure Cₙ(x,y)=γₙ(x+y).
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
-- TauCeti.PD.test_supCandidate_zero: At zero and degree zero, the sum candidate is one.
example (γ : DividedPowers I) (ε : DividedPowers J) (h) : (supCandidate γ ε h).dpow 0 0 = 1 := by sorry
-- TauCeti.PD.test_supCandidate_mixed: The quadratic sum candidate retains the mixed product.
example (γ : DividedPowers I) (ε : DividedPowers J) (h) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : (supCandidate γ ε h).dpow 2 (x+y) = γ.dpow 2 x + x*y + ε.dpow 2 y := by sorry
-- TauCeti.PD.test_supCandidate_outside: Degree zero outside the sum ideal is zero.
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
-- TauCeti.PD.test_sup_same: Gluing γ to itself returns the same operations.
example (γ : DividedPowers I) (n : ℕ) (x : A) : (sup γ γ (by intros; rfl)).dpow n x = γ.dpow n x := by sorry
-- TauCeti.PD.test_sup_zero_ideal: Gluing with the zero PD ideal returns γ on its domain.
example (γ : DividedPowers I) (h) (n : ℕ) (x : A) (hx : x ∈ I) : (sup γ (dividedPowersBot A) h).dpow n x = γ.dpow n x := by sorry
-- TauCeti.PD.test_sup_quadratic: The glued degree-two formula contains xy with coefficient one.
example (γ : DividedPowers I) (ε : DividedPowers J) (h) (x y : A) (hx : x ∈ I) (hy : y ∈ J) : (sup γ ε h).dpow 2 (x+y) = γ.dpow 2 x + x*y + ε.dpow 2 y := by sorry

-- CrystallineCohomology:CR.0/sum-universal-property
theorem sup_exists_unique_iff (γ : DividedPowers I) (ε : DividedPowers J) :
  (∃! θ : DividedPowers (I ⊔ J), γ.IsDPMorphism θ (RingHom.id A) ∧
    ε.IsDPMorphism θ (RingHom.id A)) ↔
  ∀ n x, x ∈ I ⊓ J → γ.dpow n x = ε.dpow n x := by sorry

-- CrystallineCohomology:CR.0/product-intersection-gluing
lemma agree_on_inf_of_inf_eq_mul (γ : DividedPowers I) (ε : DividedPowers J)
  (hIJ : I ⊓ J = I * J) : ∀ n x, x ∈ I ⊓ J → γ.dpow n x = ε.dpow n x := by sorry

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
-- TauCeti.PD.test_principal_identity: Extension along the identity has the original operation on I.
example (γ : DividedPowers I) (x : A) (hx) (n : ℕ) (z : A) (hz : z ∈ I) : (extendPrincipal γ (RingHom.id A) x hx).dpow n z = γ.dpow n z := by sorry
-- TauCeti.PD.test_principal_zero: Extending the zero ideal gives the existing zero divided powers on its image.
example (f : A →+* B) (n : ℕ) : (extendPrincipal (dividedPowersBot A) f 0 (by simp)).dpow n 0 = (dividedPowersBot B).dpow n 0 := by sorry
-- TauCeti.PD.test_principal_quadratic: The degree-two value on bf(x) scales by b².
example (γ : DividedPowers I) (f : A →+* B) (x : A) (hx) (b : B) : (extendPrincipal γ f x hx).dpow 2 (b * f x) = b^2 * f (γ.dpow 2 x) := by sorry
-- TauCeti.PD.test_principal_p_two: For the canonical PD ideal (2) in Z₂, identity extension satisfies γ₂(2)=2, so ordinary or PD nilpotence must not be inferred.
example  : (extendPrincipal (PadicInt.dividedPowers 2) (RingHom.id ℤ_[2]) 2 rfl).dpow 2 2 = 2 := by sorry

-- CrystallineCohomology:CR.0/extension-coefficient
def extensionCoefficient (γ : DividedPowers I) (f : A →+* B)
  (r n : ℕ) (b : Fin r → B) (x : Fin r → A) : B := by sorry
lemma extensionCoefficient_eq (γ : DividedPowers I) (f : A →+* B) (r n : ℕ) (b : Fin r → B) (x : Fin r → A) : extensionCoefficient γ f r n b x = ∑ k ∈ (Finset.univ : Finset (Fin r)).sym n, ∏ i : Fin r, b i ^ Multiset.count i k * f (γ.dpow (Multiset.count i k) (x i)) := by sorry
lemma extensionCoefficient_one (γ : DividedPowers I) (f : A →+* B) (n : ℕ) (b : B) (x : A) : extensionCoefficient γ f 1 n (fun _ => b) (fun _ => x) = b^n * f (γ.dpow n x) := by sorry
lemma extensionCoefficient_mem (γ : DividedPowers I) (f : A →+* B) (r n : ℕ) (hn : n ≠ 0) (b : Fin r → B) (x : Fin r → A) (hx : ∀ i, x i ∈ I) : extensionCoefficient γ f r n b x ∈ I.map f := by sorry
-- TauCeti.PD.test_coefficient_empty_zero: The empty family in degree zero contributes one.
example (γ : DividedPowers I) (f : A →+* B) : extensionCoefficient γ f 0 0 Fin.elim0 Fin.elim0 = 1 := by sorry
-- TauCeti.PD.test_coefficient_empty_positive: The empty family in degree one contributes zero.
example (γ : DividedPowers I) (f : A →+* B) : extensionCoefficient γ f 0 1 Fin.elim0 Fin.elim0 = 0 := by sorry
-- TauCeti.PD.test_coefficient_quadratic: For two elements, E₂=b₀²fγ₂(x₀)+b₀b₁f(x₀x₁)+b₁²fγ₂(x₁).
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
-- CrystallineCohomology:CR.0/flat-candidate-base
lemma flatCandidate_base [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (n : ℕ) (x : A) (hx : x ∈ I) : (flatCandidate (B := B) γ).dpow n (algebraMap A B x) = algebraMap A B (γ.dpow n x) := by sorry
lemma flatCandidate_outside [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (n : ℕ) (b : B) (hb : b ∉ I.map (algebraMap A B)) : (flatCandidate (B := B) γ).dpow n b = 0 := by sorry
-- TauCeti.PD.test_flatCandidate_zero: Degree zero at zero is one.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) : (flatCandidate (B := B) γ).dpow 0 0 = 1 := by sorry
-- TauCeti.PD.test_flatCandidate_scalar: A single scalar multiple has the expected nth-power coefficient.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (n : ℕ) (b : B) (x : A) (hx : x ∈ I) : (flatCandidate (B := B) γ).dpow n (b * algebraMap A B x) = b^n * algebraMap A B (γ.dpow n x) := by sorry
-- TauCeti.PD.test_flatCandidate_quadratic: The quadratic formula includes the mixed product after base change.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (x y : A) (hx : x ∈ I) (hy : y ∈ I) : (flatCandidate (B := B) γ).dpow 2 (algebraMap A B x + algebraMap A B y) = algebraMap A B (γ.dpow 2 x + x*y + γ.dpow 2 y) := by sorry

-- CrystallineCohomology:CR.0/flat-extension
def extendFlat [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) :
  DividedPowers (I.map (algebraMap A B)) := by sorry
lemma extendFlat_formula [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (r n : ℕ) (b : Fin r → B) (x : Fin r → A) (hx : ∀ i, x i ∈ I) : (extendFlat (B := B) γ).dpow n (∑ i, b i * algebraMap A B (x i)) = extensionCoefficient γ (algebraMap A B) r n b x := by sorry
-- CrystallineCohomology:CR.0/flat-extension-map
lemma extendFlat_isDPMorphism [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) : γ.IsDPMorphism (extendFlat (B := B) γ) (algebraMap A B) := by sorry
lemma extendFlat_unique [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (θ : DividedPowers (I.map (algebraMap A B))) (h : γ.IsDPMorphism θ (algebraMap A B)) : θ = extendFlat γ := by sorry
-- TauCeti.PD.test_flat_identity: Identity extension agrees with γ at every element.
example (γ : DividedPowers I) (n : ℕ) (x : A) : (extendFlat (B := A) γ).dpow n x = γ.dpow n x := by sorry
-- TauCeti.PD.test_flat_principal: On a principal ideal the flat and principal constructions agree.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (x : A) (hx) : extendFlat (B := B) γ = extendPrincipal γ (algebraMap A B) x hx := by sorry
-- TauCeti.PD.test_flat_quadratic: A linear combination of two base elements retains its cross term.
example [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) (b c : B) (x y : A) (hx : x ∈ I) (hy : y ∈ I) : (extendFlat (B := B) γ).dpow 2 (b * algebraMap A B x + c * algebraMap A B y) = b^2 * algebraMap A B (γ.dpow 2 x) + b*c * algebraMap A B (x*y) + c^2 * algebraMap A B (γ.dpow 2 y) := by sorry

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
-- TauCeti.Crystalline.test_dieudonne_degree_zero: Z concentrated in degree zero permits any Frobenius multiplication a.
example (a : ℤ) : ∃ (M : DieudonneComplex 2) (e : M.complex.X 0 ≃ₗ[ℤ] ℤ), (∀ x, e (M.F 0 x) = a * e x) ∧ ∀ n : ℤ, n ≠ 0 → Subsingleton (M.complex.X n) := by sorry
-- TauCeti.Crystalline.test_dieudonne_not_chain: For p=2 there is a Dieudonné complex with dF≠Fd: Z→Z with d=id, F₀=2 and F₁=1.
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
-- TauCeti.Crystalline.test_saturated_zero: Every complex whose groups are zero is saturated.
example {p : ℕ} (M : DieudonneComplex p) (h : ∀ n, Subsingleton (M.complex.X n)) : IsSaturated M := by sorry
-- TauCeti.Crystalline.test_saturated_zero_d: For zero differential and termwise p-torsionfree groups, saturation is equivalent to bijectivity of F.
example {p : ℕ} (M : DieudonneComplex p) (hp : ∀ n, Function.Injective (fun x : M.complex.X n => p • x)) (hd : ∀ n, M.complex.d n (n+1) = 0) : IsSaturated M ↔ ∀ n, Function.Bijective (M.F n) := by sorry
-- TauCeti.Crystalline.test_saturated_multiplication_two: The degree-zero group Z with F=2 is not saturated at p=2.
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
-- TauCeti.Crystalline.test_V_F_identity: If F is identity in a degree, V is multiplication by p there.
example {p : ℕ} (M : DieudonneComplex p) (hM : IsSaturated M) (n : ℤ) (hF : ∀ x, M.F n x = x) (x : M.complex.X n) : verschiebung M hM n x = p • x := by sorry
-- TauCeti.Crystalline.test_V_F_p: If F is multiplication by p in a degree, V is identity there; e.g. a rational degree-zero group.
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

-- TauCeti.Crystalline.augmentation_test_positive_with_scalar
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

-- TauCeti.Crystalline.augmentationIdeal_test_positive
example (m : M) : DividedPowerAlgebra.dp R 2 m ∈ augmentationIdeal R M := by sorry

-- TauCeti.Crystalline.augmentationIdeal_test_unit
example : (1 : DividedPowerAlgebra ℤ ℤ) ∉ augmentationIdeal ℤ ℤ := by sorry

-- TauCeti.Crystalline.augmentationIdeal_test_degree_one_insufficient
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

-- TauCeti.Crystalline.augmentationSplitting_test_scalar
example (r : R) : augmentationSplitting R M (algebraMap R _ r) = (r, 0) := by sorry

-- TauCeti.Crystalline.augmentationSplitting_test_ideal
example (x : augmentationIdeal R M) : augmentationSplitting R M x = (0, x) := by sorry

-- TauCeti.Crystalline.augmentationSplitting_test_addition
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
    (hIJ : I.map f = J) (n : ℕ) :
    (pdFiltration hI n).map f = pdFiltration hJ n := by sorry

-- CrystallineCohomology:CR.0/pd-filtration-rational
theorem pdFiltration_eq_pow_of_ratAlgebra [Algebra ℚ R]
    (hI : DividedPowers I) (n : ℕ) : pdFiltration hI n = I ^ n := by sorry

-- Acceptance: the empty word survives even on the zero ideal.
-- TauCeti.Crystalline.pd_filtration_empty_word
example : pdFiltration (dividedPowersBot R) 0 = ⊤ := by sorry

-- Acceptance: every positive stage on the zero ideal vanishes.
-- TauCeti.Crystalline.pd_filtration_zero_ideal
example (n : ℕ) (hn : 0 < n) :
    pdFiltration (dividedPowersBot R) n = ⊥ := by sorry

-- Negative control: the second PD stage is larger than the ordinary square.
-- TauCeti.Crystalline.pd_filtration_two_adic_counterexample
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
def PDEnvelope.map {A' B' : Type*} [CommRing A'] [CommRing B'] [Algebra A' B']
    {I' : Ideal A'} (γ' : DividedPowers I') (J' : Ideal B')
    (a : A →+* A') (ha : DividedPowers.IsDPMorphism γ γ' a)
    (f : B →+* B') (hcomm : f.comp (algebraMap A B) = (algebraMap A' B').comp a)
    (hIJ : I.map (algebraMap A B) ≤ J) (hIJ' : I'.map (algebraMap A' B') ≤ J')
    (hf : J.map f ≤ J') :
    PDEnvelope γ J →+* PDEnvelope γ' J' := by sorry
lemma PDEnvelope.map_of {A' B' : Type*} [CommRing A'] [CommRing B'] [Algebra A' B']
    {I' : Ideal A'} (γ' : DividedPowers I') (J' : Ideal B')
    (a : A →+* A') (ha : DividedPowers.IsDPMorphism γ γ' a)
    (f : B →+* B') (hcomm : f.comp (algebraMap A B) = (algebraMap A' B').comp a)
    (hIJ : I.map (algebraMap A B) ≤ J) (hIJ' : I'.map (algebraMap A' B') ≤ J')
    (hf : J.map f ≤ J') (b : B) :
    PDEnvelope.map γ J γ' J' a ha f hcomm hIJ hIJ' hf (PDEnvelope.of γ J b) =
      PDEnvelope.of γ' J' (f b) := by sorry
lemma PDEnvelope.map_pd {A' B' : Type*} [CommRing A'] [CommRing B'] [Algebra A' B']
    {I' : Ideal A'} (γ' : DividedPowers I') (J' : Ideal B')
    (a : A →+* A') (ha : DividedPowers.IsDPMorphism γ γ' a)
    (f : B →+* B') (hcomm : f.comp (algebraMap A B) = (algebraMap A' B').comp a)
    (hIJ : I.map (algebraMap A B) ≤ J) (hIJ' : I'.map (algebraMap A' B') ≤ J')
    (hf : J.map f ≤ J') :
    DividedPowers.IsDPMorphism (PDEnvelope.powers γ J) (PDEnvelope.powers γ' J')
      (PDEnvelope.map γ J γ' J' a ha f hcomm hIJ hIJ' hf) := by sorry
lemma PDEnvelope.map_unique {A' B' : Type*} [CommRing A'] [CommRing B'] [Algebra A' B']
    {I' : Ideal A'} (γ' : DividedPowers I') (J' : Ideal B')
    (a : A →+* A') (ha : DividedPowers.IsDPMorphism γ γ' a)
    (f : B →+* B') (hcomm : f.comp (algebraMap A B) = (algebraMap A' B').comp a)
    (hIJ : I.map (algebraMap A B) ≤ J) (hIJ' : I'.map (algebraMap A' B') ≤ J')
    (hf : J.map f ≤ J') (g : PDEnvelope γ J →+* PDEnvelope γ' J')
    (hg : ∀ b : B, g (PDEnvelope.of γ J b) = PDEnvelope.of γ' J' (f b))
    (hpd : DividedPowers.IsDPMorphism (PDEnvelope.powers γ J) (PDEnvelope.powers γ' J') g) :
    g = PDEnvelope.map γ J γ' J' a ha f hcomm hIJ hIJ' hf := by sorry
lemma PDEnvelope.map_id (ha hcomm hIJ hf) :
    PDEnvelope.map γ J γ J (RingHom.id A) ha (RingHom.id B) hcomm hIJ hIJ hf =
      RingHom.id (PDEnvelope γ J) := by sorry
lemma PDEnvelope.map_comp {A' B' A'' B'' : Type*} [CommRing A'] [CommRing B'] [Algebra A' B']
    [CommRing A''] [CommRing B''] [Algebra A'' B'']
    {I' : Ideal A'} (γ' : DividedPowers I') (J' : Ideal B')
    {I'' : Ideal A''} (γ'' : DividedPowers I'') (J'' : Ideal B'')
    (a : A →+* A') (a' : A' →+* A'') (f : B →+* B') (f' : B' →+* B'')
    (ha ha' haa hcomm hcomm' hcc hIJ hIJ' hIJ'' hf hf' hff) :
    PDEnvelope.map γ J γ'' J'' (a'.comp a) haa (f'.comp f) hcc hIJ hIJ'' hff =
      (PDEnvelope.map γ' J' γ'' J'' a' ha' f' hcomm' hIJ' hIJ'' hf').comp
        (PDEnvelope.map γ J γ' J' a ha f hcomm hIJ hIJ' hf) := by sorry
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

-- CrystallineCohomology:CR.4/strict-dieudonne-complex
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
-- CrystallineCohomology:CR.1/pd-differentials
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
-- The exterior algebra and its graded differential are an ordinary-forms DD.2
-- supplier obligation; they are not replaced by arbitrary graded modules here.
-- TauCeti.Crystalline.test_pdDifferentials_base
example : (∀ δ₀ : DividedPowers (⊥ : Ideal B),
      ∃ e : pdDifferentials A B ⊥ δ₀ ≃ₗ[B] KaehlerDifferential A B,
        ∀ b : B, e (pdDifferential A B ⊥ δ₀ b) = KaehlerDifferential.D A B b) ∧
    ∀ (K : Ideal A) (ε : DividedPowers K), Subsingleton (pdDifferentials A A K ε) := by sorry
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
-- CrystallineCohomology:CR.1/quasi-nilpotent-connection
structure QNConnection (A B M : Type*) [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] (p : ℕ) (ι : Type*) (coordinateDeriv : ι → Derivation A B B) where
  theta : ι → M →+ M
  leibniz : ∀ i b m, theta i (b • m) = coordinateDeriv i b • m + b • theta i m
  summable : ∀ m (e : ℕ), {i : ι | ¬ ∃ y : M, theta i m = (p^e) • y}.Finite
  integrable : ∀ i j m, theta i (theta j m) = theta j (theta i m)
  quasiNilpotent : ∀ m, {ik : ι × ℕ | ik.2 ≠ 0 ∧
    ¬ ∃ y : M, (theta ik.1 : M → M)^[ik.2] m = p • y}.Finite
lemma QNConnection.operators {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p : ℕ} {ι : Type*} {coordinateDeriv : ι → Derivation A B B}
    (C : QNConnection A B M p ι coordinateDeriv) (i : ι) (b : B) (m : M) :
    C.theta i (b • m) = coordinateDeriv i b • m + b • C.theta i m := by sorry
lemma QNConnection.commute {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p : ℕ} {ι : Type*} {coordinateDeriv : ι → Derivation A B B}
    (C : QNConnection A B M p ι coordinateDeriv) (i j : ι) :
    Function.Commute (C.theta i) (C.theta j) := by sorry
def QNConnection.multiTheta {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p : ℕ} {ι : Type*} {coordinateDeriv : ι → Derivation A B B}
    (C : QNConnection A B M p ι coordinateDeriv) (K : ι →₀ ℕ) : M →+ M :=
    Finset.noncommProd (β := AddMonoid.End M) K.support
      (fun i => @HPow.hPow (AddMonoid.End M) ℕ (AddMonoid.End M) _ (C.theta i) (K i)) (by sorry)
lemma QNConnection.multiTheta_single {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p : ℕ} {ι : Type*} {coordinateDeriv : ι → Derivation A B B}
    (C : QNConnection A B M p ι coordinateDeriv) (i : ι) (k : ℕ) (m : M) :
    C.multiTheta (Finsupp.single i k) m = (C.theta i : M → M)^[k] m := by sorry
lemma QNConnection.multiTheta_add {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p : ℕ} {ι : Type*} {coordinateDeriv : ι → Derivation A B B}
    (C : QNConnection A B M p ι coordinateDeriv) (K L : ι →₀ ℕ) (m : M) :
    C.multiTheta (K + L) m = C.multiTheta K (C.multiTheta L m) := by sorry
lemma QNConnection.finite_taylor {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
    [AddCommGroup M] [Module B M] {p : ℕ} {ι : Type*} {coordinateDeriv : ι → Derivation A B B}
    (C : QNConnection A B M p ι coordinateDeriv) (m : M) (e : ℕ) :
    {K : ι →₀ ℕ | ¬ ∃ y : M, C.multiTheta K m = (p^e) • y}.Finite := by sorry

def polynomialDerivation (p : ℕ) : Derivation (ZMod p) (Polynomial (ZMod p)) (Polynomial (ZMod p)) :=
    Derivation.mk' Polynomial.derivative (by sorry)
-- TauCeti.Crystalline.test_qn_trivial
example (p : ℕ) [Fact p.Prime] :
    ∃ C : QNConnection (ZMod p) (Polynomial (ZMod p)) (Polynomial (ZMod p)) p (Fin 1)
      (fun _ => polynomialDerivation p), ∀ f, C.theta 0 f = Polynomial.derivative f := by sorry
-- TauCeti.Crystalline.test_qn_unipotent
example (p : ℕ) [Fact p.Prime] :
    ∃ C : QNConnection (ZMod p) (Polynomial (ZMod p))
      (Polynomial (ZMod p) × Polynomial (ZMod p)) p (Fin 1) (fun _ => polynomialDerivation p),
      (∀ f g, C.theta 0 (f,g) = (Polynomial.derivative f + g, Polynomial.derivative g)) ∧
      ∀ m, (C.theta 0 : _ → _)^[p] m = 0 := by sorry
-- TauCeti.Crystalline.test_qn_exponential
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ C : QNConnection (ZMod p) (Polynomial (ZMod p)) (Polynomial (ZMod p)) p (Fin 1)
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
example :
    (∀ r : ℕ, Function.Bijective ((relativeDRW p (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p)) (zmod_pLocal p)).coefficient r)) ∧
    (∀ r : ℕ, (relativeDRW p (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p)) (zmod_pLocal p)).coefficient (r+1)
        (finiteTeich p (TrivSqZeroExt (ZMod p) (ZMod p)) (r+1) (TrivSqZeroExt.inr 1)) ≠ 0) ∧
    (∃ e : ((relativeDRW p (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p)) (zmod_pLocal p)).level 1).complex.X 1 ≃+
        Ω[TrivSqZeroExt (ZMod p) (ZMod p)⁄ZMod p],
      ∀ x : TruncatedWittVector p 1 (TrivSqZeroExt (ZMod p) (ZMod p)),
        e ((((relativeDRW p (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p)) (zmod_pLocal p)).level 1).complex.d 0 1).hom
            ((relativeDRW p (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p)) (zmod_pLocal p)).coefficient 1 x)) =
          KaehlerDifferential.D (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p)) (x.coeff 0)) ∧
    Nontrivial (((relativeDRW p (ZMod p) (TrivSqZeroExt (ZMod p) (ZMod p)) (zmod_pLocal p)).level 1).complex.X 1) ∧
    (∀ q : ℤ, 0 < q → Subsingleton ((saturatedDRW p (TrivSqZeroExt (ZMod p) (ZMod p))).complex.X q)) ∧
    satDRW_teich p (TrivSqZeroExt (ZMod p) (ZMod p)) (TrivSqZeroExt.inr 1) = 0 := by sorry
-- The full length-one Ω-DGA equivalence needs the DD.0 ordinary forms; the Laurent-torus
-- test is stated with the corrected API items at the end of the file.
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

namespace TauCeti.PD
universe u v w

section CorrectedItems
variable {A : Type u} [CommRing A] {I J : Ideal A}
variable {B : Type v} [CommRing B] {C : Type w} [CommRing C]

-- Node CR.0/additive-powers: new tests.
-- TauCeti.PD.test_candidate_not_pd
example (e : TrivSqZeroExt (ZMod 2) (ZMod 2)) (he : e = TrivSqZeroExt.inr 1) :
    ∃ δ : AdditivePowers (Ideal.span {e}),
      (∀ x ∈ Ideal.span {e}, ∀ n : ℕ,
        δ.dpow n x = if n = 0 then 1 else if n = 1 ∨ n = 3 then x else 0) ∧
      δ.dpow 1 e * δ.dpow 2 e = 0 ∧ (3 : TrivSqZeroExt (ZMod 2) (ZMod 2)) * δ.dpow 3 e = e ∧ e ≠ 0 ∧
      δ.dpow 1 e * δ.dpow 2 e ≠
        (Nat.choose (1 + 2) 1 : TrivSqZeroExt (ZMod 2) (ZMod 2)) * δ.dpow (1 + 2) e := by sorry
-- TauCeti.PD.test_candidate_outside
example (δ : AdditivePowers I) (x : A) (hx : x ∉ I) : δ.dpow 0 x = 0 := by sorry

-- Node CR.0/generator-criterion: new tests.
-- TauCeti.PD.test_generators_roundtrip
example (γ : DividedPowers I) (hS hm hc) : (AdditivePowers.ofDividedPowers γ).toDividedPowers (I : Set A) hS hm hc = γ := by sorry
-- TauCeti.PD.test_generators_hypothesis_needed
example (e : TrivSqZeroExt (ZMod 2) (ZMod 2)) (he : e = TrivSqZeroExt.inr 1) :
    ∃ δ : AdditivePowers (Ideal.span {e}),
      (∀ x ∈ Ideal.span {e}, ∀ n : ℕ,
        δ.dpow n x = if n = 0 then 1 else if n = 1 ∨ n = 3 then x else 0) ∧
      δ.dpow 1 e * δ.dpow 2 e = 0 ∧ (3 : TrivSqZeroExt (ZMod 2) (ZMod 2)) * δ.dpow 3 e = e ∧
      δ.dpow 1 e * δ.dpow 2 e ≠
        (Nat.choose (1 + 2) 1 : TrivSqZeroExt (ZMod 2) (ZMod 2)) * δ.dpow (1 + 2) e ∧
      ¬ ∃ γ : DividedPowers (Ideal.span {e}), ∀ n x, γ.dpow n x = δ.dpow n x := by sorry

-- Node CR.0/sum-convolution: new API item.
lemma convolution_eq_coeff_exp_mul (γ : DividedPowers I) (ε : DividedPowers J) (n : ℕ) (x y : A) : convolution γ ε n x y = PowerSeries.coeff n (γ.exp x * ε.exp y) := by sorry

-- Node CR.0/compatible-sum: new API item.
lemma sup_isDPMorphism_iff (γ : DividedPowers I) (ε : DividedPowers J) (h) {K : Ideal C} (κ : DividedPowers K) (g : A →+* C) : (sup γ ε h).IsDPMorphism κ g ↔ γ.IsDPMorphism κ g ∧ ε.IsDPMorphism κ g := by sorry

-- Part (1) of node CR.0/sum-universal-property (uniqueness; the converse is sup_left and sup_right).
lemma sup_unique (γ : DividedPowers I) (ε : DividedPowers J)
  (h : ∀ n x, x ∈ I ⊓ J → γ.dpow n x = ε.dpow n x) (θ : DividedPowers (I ⊔ J))
  (hγ : ∀ n x, x ∈ I → θ.dpow n x = γ.dpow n x)
  (hε : ∀ n y, y ∈ J → θ.dpow n y = ε.dpow n y) : θ = sup γ ε h := by sorry

-- Node CR.0/extension-coefficient: new API item.
lemma dpow_sum_mul_map_eq_extensionCoefficient (γ : DividedPowers I) (f : A →+* B) (θ : DividedPowers (I.map f)) (hf : γ.IsDPMorphism θ f) (r n : ℕ) (b : Fin r → B) (x : Fin r → A) (hx : ∀ i, x i ∈ I) : θ.dpow n (∑ i, b i * f (x i)) = extensionCoefficient γ f r n b x := by sorry

-- Node CR.0/flat-extension: new API items and test.
lemma extendFlat_isDPMorphism_iff [Algebra A B] [Module.Flat A B] (γ : DividedPowers I) {K : Ideal C} (κ : DividedPowers K) (g : B →+* C) : (extendFlat (B := B) γ).IsDPMorphism κ g ↔ γ.IsDPMorphism κ (g.comp (algebraMap A B)) := by sorry
lemma extendFlat_trans [Algebra A B] [Algebra B C] [Algebra A C] [IsScalarTower A B C]
  [Module.Flat A B] [Module.Flat B C] (γ : DividedPowers I) :
  Module.Flat A C ∧
  (I.map (algebraMap A B)).map (algebraMap B C) = I.map (algebraMap A C) ∧
  ∀ [Module.Flat A C] (n : ℕ) (c : C),
    (extendFlat (B := C) (extendFlat (B := B) γ)).dpow n c =
      (extendFlat (B := C) γ).dpow n c := by sorry
lemma extendFlat_eq_ofRingEquiv [Algebra A B] [Module.Flat A B] (γ : DividedPowers I)
  (hf : Function.Bijective (algebraMap A B)) :
  extendFlat (B := B) γ =
    DividedPowers.ofRingEquiv (e := RingEquiv.ofBijective (algebraMap A B) hf) rfl γ := by sorry
-- TauCeti.PD.test_flat_equiv
example [Algebra A B] [Module.Flat A B] (e : A ≃+* B) (he : ∀ a, algebraMap A B a = e a) (γ : DividedPowers I) (n : ℕ) (x : A) : (extendFlat (B := B) γ).dpow n (e x) = e (γ.dpow n x) ∧ (x ∉ I → (extendFlat (B := B) γ).dpow n (e x) = 0 ∧ e (γ.dpow n x) = 0) := by sorry

end CorrectedItems

section CanonicalP

/-- The constant `cₙ` of CR.0/canonical-p-divided-powers, the image in `A` of `pⁿ/n!`:
with `v = padicValNat p n!` and `n! = p ^ v * m`, the rational number `pⁿ/n!` is
`p ^ (n - v) / m` with `v ≤ n` and `p ∤ m`, and its image is `p ^ (n - v) * m⁻¹`. -/
def canonicalPCoeff (p : ℕ) (A : Type u) [CommRing A] (n : ℕ) : A :=
  (p : A) ^ (n - padicValNat p n.factorial) *
    Ring.inverse ((n.factorial / p ^ padicValNat p n.factorial : ℕ) : A)

lemma canonicalPCoeff_eq_map (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
  (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) {L : Type v} [CommRing L] [IsDomain L] [CharZero L]
  (f : L →+* A) (n : ℕ) (z : L) (hz : (n.factorial : L) * z = (p : L) ^ n) :
  f z = canonicalPCoeff p A n := by sorry

-- CrystallineCohomology:CR.0/canonical-p-divided-powers
def canonicalP (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
  (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) : DividedPowers (Ideal.span {(p : A)}) := by sorry
lemma canonicalP_dpow_mul (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) (n : ℕ) (a : A) : (canonicalP p A hA).dpow n ((p : A) * a) = canonicalPCoeff p A n * a ^ n := by sorry
lemma pow_div_factorial_mem_span (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] {n : ℕ} (hn : n ≠ 0) :
  (∃ a b : ℤ, ¬ (p : ℤ) ∣ b ∧ (p : ℚ) ^ n / (n.factorial : ℚ) = (p : ℚ) * ((a : ℚ) / (b : ℚ))) ∧
    canonicalPCoeff p A n ∈ Ideal.span {(p : A)} := by sorry
lemma canonicalP_unique (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) (θ : DividedPowers (Ideal.span {(p : A)})) (h : ∀ n : ℕ, n ≠ 0 → θ.dpow n (p : A) = canonicalPCoeff p A n) : θ = canonicalP p A hA := by sorry
lemma canonicalP_unique_of_isDPMorphism (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
  (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) {L : Type v} [CommRing L] [IsDomain L] [CharZero L]
  (γ₀ : DividedPowers (Ideal.span {(p : L)})) (f : L →+* A)
  (θ : DividedPowers (Ideal.span {(p : A)})) (hf : γ₀.IsDPMorphism θ f) :
  θ = canonicalP p A hA := by sorry
lemma canonicalP_isDPMorphism (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) (A' : Type v) [CommRing A'] (hA' : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A')) (g : A →+* A') : (canonicalP p A hA).IsDPMorphism (canonicalP p A' hA') g := by sorry
lemma canonicalP_padicInt (p : ℕ) [Fact p.Prime] (h : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : ℤ_[p])) : canonicalP p ℤ_[p] h = PadicInt.dividedPowers p := by sorry
-- TauCeti.PD.test_canonicalP_two_mod_four
example (h : ∀ n : ℕ, ¬ 2 ∣ n → IsUnit (n : ZMod 4)) : (canonicalP 2 (ZMod 4) h).dpow 2 2 = 2 ∧ (canonicalP 2 (ZMod 4) h).dpow 3 2 = 0 ∧ (canonicalP 2 (ZMod 4) h).dpow 4 2 = 2 := by sorry
open scoped Classical in
-- TauCeti.PD.test_canonicalP_not_squareZero
example (h : ∀ n : ℕ, ¬ 2 ∣ n → IsUnit (n : ZMod 4)) :
    ∃ h2 : Ideal.span {((2 : ℕ) : ZMod 4)} ^ 2 = 0,
      (DividedPowers.OfSquareZero.dividedPowers h2).dpow 2 2 = 0 ∧
      (canonicalP 2 (ZMod 4) h).dpow 2 2 = 2 ∧
      canonicalP 2 (ZMod 4) h ≠ DividedPowers.OfSquareZero.dividedPowers h2 := by sorry
open scoped Classical in
-- TauCeti.PD.test_canonicalP_mod_p_sq
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (h : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : ZMod (p ^ 2))) :
    (∀ n : ℕ, 2 ≤ n → (canonicalP p (ZMod (p ^ 2)) h).dpow n (p : ZMod (p ^ 2)) = 0) ∧
    ∃ h2 : Ideal.span {(p : ZMod (p ^ 2))} ^ 2 = 0,
      canonicalP p (ZMod (p ^ 2)) h = DividedPowers.OfSquareZero.dividedPowers h2 := by sorry
-- TauCeti.PD.test_canonicalP_three
example (h : ∀ n : ℕ, ¬ 3 ∣ n → IsUnit (n : ZMod 27)) : (canonicalP 3 (ZMod 27) h).dpow 2 3 = 18 ∧ (canonicalP 3 (ZMod 27) h).dpow 3 3 = 18 ∧ (canonicalP 3 (ZMod 27) h).dpow 4 3 = 0 := by sorry
-- TauCeti.PD.test_canonicalP_char_p
example (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) (hp : (p : A) = 0) : Ideal.span {(p : A)} = ⊥ ∧ ∀ n x, (canonicalP p A hA).dpow n x = (dividedPowersBot A).dpow n x := by sorry

end CanonicalP

end TauCeti.PD

namespace TauCeti.Crystalline.Augmentation

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

-- Node CR.0/gamma-augmentation: new API item and tests.
theorem augmentation_map {S N : Type*} [CommRing S] [Algebra R S] [AddCommGroup N]
    [Module R N] [Module S N] [IsScalarTower R S N] (f : M →ₗ[R] N)
    (z : DividedPowerAlgebra R M) :
    augmentation S N (DividedPowerAlgebra.map S f z) =
      algebraMap R S (augmentation R M z) := by sorry

-- TauCeti.Crystalline.augmentation_test_degree_one
example : (∀ m : M, augmentation R M (DividedPowerAlgebra.dp R 1 m) = 0) ∧
    (augmentation R M).toLinearMap.comp (DividedPowerAlgebra.embed R M) = 0 := by sorry

open scoped Classical in
-- TauCeti.Crystalline.augmentation_test_not_evaluation
example :
    DividedPowerAlgebra.lift (DividedPowers.RatAlgebra.dividedPowers (⊤ : Ideal ℚ))
        (LinearMap.id : ℚ →ₗ[ℚ] ℚ) (fun _ => Submodule.mem_top)
        (DividedPowerAlgebra.dp ℚ 2 (1 : ℚ)) = 1 / 2 ∧
      augmentation ℚ ℚ (DividedPowerAlgebra.dp ℚ 2 (1 : ℚ)) = 0 ∧
      augmentation ℚ ℚ ≠
        DividedPowerAlgebra.lift (DividedPowers.RatAlgebra.dividedPowers (⊤ : Ideal ℚ))
          (LinearMap.id : ℚ →ₗ[ℚ] ℚ) (fun _ => Submodule.mem_top) := by sorry

-- Node CR.0/gamma-augmentation-ideal: new API item.
theorem map_mem_augmentationIdeal {S N : Type*} [CommRing S] [Algebra R S] [AddCommGroup N]
    [Module R N] [Module S N] [IsScalarTower R S N] (f : M →ₗ[R] N)
    (z : DividedPowerAlgebra R M) (hz : z ∈ augmentationIdeal R M) :
    DividedPowerAlgebra.map S f z ∈ augmentationIdeal S N := by sorry

end TauCeti.Crystalline.Augmentation

/-!
Dieudonné complexes, saturation, Verschiebung, the finite quotients `W_r(M)` and the
completion `W(M)` (Bhatt–Lurie–Mathew §2): signatures for the API items, unit tests and
nodes added to the CR.4 packet nodes. These are plans, not implementations.
-/

namespace TauCeti.Crystalline
open CategoryTheory
universe u

section DieudonneExamples

/- API of CrystallineCohomology:CR.4/dieudonne-complex: an abelian group `A` in degree zero
with an endomorphism `F` (BLM Example 2.5.6). The Frobenius in degree `n` is the degree-`n`
component of the map of single-degree complexes induced by `F`. -/
def DieudonneComplex.ofEnd (p : ℕ) (A : Type u) [AddCommGroup A] (F : Module.End ℤ A) :
    DieudonneComplex.{u} p where
  complex := (HomologicalComplex.single (ModuleCat.{u} ℤ) (ComplexShape.up ℤ) 0).obj
    (ModuleCat.of ℤ A)
  F := fun n => (((HomologicalComplex.single (ModuleCat.{u} ℤ) (ComplexShape.up ℤ) 0).map
    (ModuleCat.ofHom F)).f n).hom
  comm := by sorry

-- TauCeti.Crystalline.test_dieudonne_factor_p
example (p : ℕ) [Fact p.Prime] (M : DieudonneComplex.{u} p)
    (e₀ : M.complex.X 0 ≃ₗ[ℤ] ℤ) (e₁ : M.complex.X 1 ≃ₗ[ℤ] ℤ)
    (hd : ∀ x, e₁ ((M.complex.d 0 1).hom x) = e₀ x) :
    ¬ ((∀ x, e₀ (M.F 0 x) = e₀ x) ∧ ∀ x, e₁ (M.F 1 x) = e₁ x) := by sorry

-- TauCeti.Crystalline.test_saturated_two_term
example (p : ℕ) [Fact p.Prime] : ∃ (M : DieudonneComplex.{0} p)
    (e₀ : M.complex.X 0 ≃ₗ[ℤ] ℤ) (e₁ : M.complex.X 1 ≃ₗ[ℤ] ℤ),
    (∀ n : ℤ, n ≠ 0 → n ≠ 1 → Subsingleton (M.complex.X n)) ∧
    (∀ x, e₁ ((M.complex.d 0 1).hom x) = e₀ x) ∧
    (∀ x, e₀ (M.F 0 x) = (p : ℤ) * e₀ x) ∧ (∀ x, e₁ (M.F 1 x) = e₁ x) ∧
    IsSaturated M ∧ ¬ Function.Surjective (M.F 0) := by sorry

-- TauCeti.Crystalline.test_saturated_divisible_differential
example (p : ℕ) [Fact p.Prime] : ∃ (M : DieudonneComplex.{0} p)
    (e₀ : M.complex.X 0 ≃ₗ[ℤ] ℤ) (e₁ : M.complex.X 1 ≃ₗ[ℤ] ℤ),
    (∀ n : ℤ, n ≠ 0 → n ≠ 1 → Subsingleton (M.complex.X n)) ∧
    (∀ x, e₁ ((M.complex.d 0 1).hom x) = (p : ℤ) * e₀ x) ∧
    (∀ x, e₀ (M.F 0 x) = (p : ℤ) * e₀ x) ∧ (∀ x, e₁ (M.F 1 x) = e₁ x) ∧
    (∀ n, Function.Injective (fun x : M.complex.X n => p • x)) ∧
    (∀ n, Function.Injective (M.F n)) ∧
    (∀ x : M.complex.X 0, ∃ y : M.complex.X 1, (M.complex.d 0 1).hom x = p • y) ∧
    Set.range (M.F 0) = {x | (p : ℤ) ∣ e₀ x} ∧
    ¬ IsSaturated M := by sorry

-- TauCeti.Crystalline.test_V_not_chain
example (p : ℕ) [Fact p.Prime] (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (e₀ : M.complex.X 0 ≃ₗ[ℤ] ℤ) (e₁ : M.complex.X 1 ≃ₗ[ℤ] ℤ)
    (hd : ∀ x, e₁ ((M.complex.d 0 1).hom x) = e₀ x)
    (hF₀ : ∀ x, e₀ (M.F 0 x) = (p : ℤ) * e₀ x) (hF₁ : ∀ x, e₁ (M.F 1 x) = e₁ x) :
    (∀ x, verschiebung M hM 0 x = x) ∧ (∀ x, verschiebung M hM 1 x = p • x) ∧
    (∀ x, e₀ x = 1 →
      e₁ (verschiebung M hM 1 ((M.complex.d 0 1).hom x)) = (p : ℤ) ∧
      e₁ (p • (M.complex.d 0 1).hom (verschiebung M hM 0 x)) = (p : ℤ)) ∧
    (verschiebung M hM 1).comp (M.complex.d 0 1).hom ≠
      (M.complex.d 0 1).hom.comp (verschiebung M hM 0) := by sorry

end DieudonneExamples

section DieudonneCategory
variable {p : ℕ}

/- API of CrystallineCohomology:CR.4/dieudonne-morphism. `DieudonneHom.comm_F` is the
structure field of `DieudonneHom`. -/
instance DieudonneComplex.category (p : ℕ) : Category.{u} (DieudonneComplex.{u} p) where
  Hom M N := DieudonneHom M N
  id M := DieudonneHom.id M
  comp f g := g.comp f
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

lemma DieudonneHom.isIso_iff_bijective {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N) :
    IsIso (C := DieudonneComplex.{u} p) (X := M) (Y := N) f ↔
      ∀ n : ℤ, Function.Bijective ((f.toCochainHom.f n).hom) := by sorry

end DieudonneCategory

section SaturationFunctoriality
variable {p : ℕ}

/- API of CrystallineCohomology:CR.4/saturation-colimit: functoriality of saturation. -/
def Saturation.map {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N) :
    DieudonneHom (Saturation M) (Saturation N) :=
  Saturation.lift (Saturation.saturated N) ((Saturation.unit N).comp f)
lemma Saturation.map_unit {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N) :
    (Saturation.map f).comp (Saturation.unit M) = (Saturation.unit N).comp f := by sorry
lemma Saturation.map_id (M : DieudonneComplex.{u} p) :
    Saturation.map (DieudonneHom.id M) = DieudonneHom.id (Saturation M) := by sorry
lemma Saturation.map_comp {M N P : DieudonneComplex.{u} p}
    (g : DieudonneHom N P) (f : DieudonneHom M N) :
    Saturation.map (g.comp f) = (Saturation.map g).comp (Saturation.map f) := by sorry

end SaturationFunctoriality

section CompletionLimit
variable {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)

/- API of CrystallineCohomology:CR.4/verschiebung-completion-tower: `W(M)` as the limit of
the tower of the `W_r(M)`. -/
lemma Completion.projection_restriction (r : ℕ) :
    Completion.projection M hM (r+1) ≫ Completion.restriction M hM r =
      Completion.projection M hM r := by sorry
lemma Completion.ext (n : ℤ) (x y : (Completion M hM).complex.X n) :
    x = y ↔ ∀ r : ℕ, ((Completion.projection M hM r).f n).hom x =
      ((Completion.projection M hM r).f n).hom y := by sorry
def Completion.lift {K : CochainComplex (ModuleCat.{u} ℤ) ℤ}
    (g : ∀ r : ℕ, K ⟶ Wcomplex M hM r)
    (hg : ∀ r, g (r+1) ≫ Completion.restriction M hM r = g r) :
    K ⟶ (Completion M hM).complex := by sorry
lemma Completion.lift_projection {K : CochainComplex (ModuleCat.{u} ℤ) ℤ}
    (g : ∀ r : ℕ, K ⟶ Wcomplex M hM r)
    (hg : ∀ r, g (r+1) ≫ Completion.restriction M hM r = g r) (r : ℕ) :
    Completion.lift M hM g hg ≫ Completion.projection M hM r = g r := by sorry
lemma Completion.lift_unique {K : CochainComplex (ModuleCat.{u} ℤ) ℤ}
    (g : ∀ r : ℕ, K ⟶ Wcomplex M hM r)
    (hg : ∀ r, g (r+1) ≫ Completion.restriction M hM r = g r)
    (h : K ⟶ (Completion M hM).complex)
    (hh : ∀ r, h ≫ Completion.projection M hM r = g r) :
    h = Completion.lift M hM g hg := by sorry

def Completion.map {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) :
    DieudonneHom (Completion M hM) (Completion N hN) := by sorry
lemma Completion.map_projection {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (r : ℕ) :
    (Completion.map f hM hN).toCochainHom ≫ Completion.projection N hN r =
      Completion.projection M hM r ≫ f.Wmap hM hN r := by sorry
lemma Completion.map_id :
    Completion.map (DieudonneHom.id M) hM hM = DieudonneHom.id (Completion M hM) := by sorry
lemma Completion.map_comp {M N P : DieudonneComplex.{u} p}
    (g : DieudonneHom N P) (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (hP : IsSaturated P) :
    Completion.map (g.comp f) hM hP =
      (Completion.map g hN hP).comp (Completion.map f hM hN) := by sorry
lemma Completion.map_unit {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) :
    (Completion.map f hM hN).comp (Completion.unit M hM) =
      (Completion.unit N hN).comp f := by sorry

-- TauCeti.Crystalline.Wmap_test_scalar
example (p : ℕ) [Fact p.Prime] (M : DieudonneComplex.{u} p) (hM : IsSaturated M)
    (e : M.complex.X 0 ≃ₗ[ℤ] ℤ) (hz : ∀ n : ℤ, n ≠ 0 → Subsingleton (M.complex.X n))
    (hF : M.F 0 = LinearMap.id) (a : ℤ) (f : DieudonneHom M M)
    (hf : ∀ n x, (f.toCochainHom.f n).hom x = a • x) (r : ℕ) :
    ∃ φ : (Wcomplex M hM r).X 0 ≃ₗ[ℤ] ZMod (p^r),
      (∀ x, φ (Wmk M hM r 0 x) = ((e x : ℤ) : ZMod (p^r))) ∧
      ∀ y, φ (((f.Wmap hM hM r).f 0).hom y) = (a : ZMod (p^r)) * φ y := by sorry

end CompletionLimit

section Strict
variable {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)

/- API and unit tests of CrystallineCohomology:CR.4/strict-dieudonne-complex; the
declaration `IsStrict` is in the Completion section above. -/
lemma IsStrict.unit_bijective :
    IsStrict M hM ↔
      ∀ n : ℤ, Function.Bijective (((Completion.unit M hM).toCochainHom.f n).hom) := by sorry
lemma IsStrict.unit_isIso :
    IsStrict M hM ↔ IsIso (C := DieudonneComplex.{u} p) (X := M) (Y := Completion M hM)
      (Completion.unit M hM) := by sorry

lemma IsStrict.ker_unit (n : ℤ) :
    LinearMap.ker (((Completion.unit M hM).toCochainHom.f n).hom) =
      ⨅ r : ℕ, vFiltration M hM r n := by sorry
lemma IsStrict.unit_surjective_iff (n : ℤ) :
    Function.Surjective (((Completion.unit M hM).toCochainHom.f n).hom) ↔
      ∀ x : ℕ → M.complex.X n, (∀ r, x (r+1) - x r ∈ vFiltration M hM r n) →
        ∃ y : M.complex.X n, ∀ r, y - x r ∈ vFiltration M hM r n := by sorry
lemma IsStrict.iff_separated_complete :
    IsStrict M hM ↔ ∀ n : ℤ, (⨅ r : ℕ, vFiltration M hM r n) = ⊥ ∧
      ∀ x : ℕ → M.complex.X n, (∀ r, x (r+1) - x r ∈ vFiltration M hM r n) →
        ∃ y : M.complex.X n, ∀ r, y - x r ∈ vFiltration M hM r n := by sorry

lemma IsStrict.of_iso {M N : DieudonneComplex.{u} p} (hM : IsSaturated M) (hN : IsSaturated N)
    (f : DieudonneHom M N)
    (hf : IsIso (C := DieudonneComplex.{u} p) (X := M) (Y := N) f)
    (h : IsStrict M hM) : IsStrict N hN := by sorry

lemma IsSaturated.degreeZero_iff (p : ℕ) (A : Type u) [AddCommGroup A] (F : Module.End ℤ A) :
    IsSaturated (DieudonneComplex.ofEnd p A F) ↔
      Function.Injective (fun x : A => p • x) ∧ Function.Bijective F := by sorry
lemma IsStrict.degreeZero_iff (p : ℕ) (A : Type u) [AddCommGroup A] (F : Module.End ℤ A)
    (h : IsSaturated (DieudonneComplex.ofEnd p A F)) :
    IsStrict (DieudonneComplex.ofEnd p A F) h ↔
      IsAdicComplete (Ideal.span {(p : ℤ)}) A := by sorry

-- TauCeti.Crystalline.test_strict_Zp
example (p : ℕ) [Fact p.Prime] :
    ∃ h : IsSaturated (DieudonneComplex.ofEnd p ℤ_[p] LinearMap.id),
      (∀ n x, verschiebung _ h n x = p • x) ∧
      (∀ r : ℕ, Nonempty ((Wcomplex _ h r).X 0 ≃ₗ[ℤ] ZMod (p^r))) ∧
      IsStrict (DieudonneComplex.ofEnd p ℤ_[p] LinearMap.id) h := by sorry
-- TauCeti.Crystalline.test_strict_Z
example (p : ℕ) [Fact p.Prime] :
    ∃ h : IsSaturated (DieudonneComplex.ofEnd p ℤ LinearMap.id),
      ¬ IsStrict (DieudonneComplex.ofEnd p ℤ LinearMap.id) h ∧
      Nonempty ((Completion _ h).complex.X 0 ≃ₗ[ℤ] ℤ_[p]) ∧
      Function.Injective (((Completion.unit _ h).toCochainHom.f 0).hom) ∧
      ¬ Function.Surjective (((Completion.unit _ h).toCochainHom.f 0).hom) := by sorry
-- TauCeti.Crystalline.test_strict_Q
example (p : ℕ) [Fact p.Prime] :
    ∃ h : IsSaturated (DieudonneComplex.ofEnd p ℚ LinearMap.id),
      ¬ IsStrict (DieudonneComplex.ofEnd p ℚ LinearMap.id) h ∧
      (∀ n x, verschiebung _ h n x = p • x) ∧
      (∀ n, Function.Bijective (verschiebung _ h n)) ∧
      (∀ n, Subsingleton ((Completion _ h).complex.X n)) ∧
      ¬ Function.Injective (((Completion.unit _ h).toCochainHom.f 0).hom) := by sorry
-- TauCeti.Crystalline.test_strict_unit
example (p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ) :
    (∃ h : IsSaturated (DieudonneComplex.ofEnd p ℤ_[p] (LinearMap.mulLeft ℤ (u : ℤ_[p]))),
      IsStrict (DieudonneComplex.ofEnd p ℤ_[p] (LinearMap.mulLeft ℤ (u : ℤ_[p]))) h) ∧
    ¬ IsSaturated (DieudonneComplex.ofEnd p ℤ_[p] (LinearMap.mulLeft ℤ (p : ℤ_[p]))) := by sorry

end Strict

section FiniteWittCohomology
variable {p : ℕ} (M : DieudonneComplex.{u} p) (hM : IsSaturated M)

/- The quotient complex `M/p^r M`, formed degreewise as `Wcomplex` is, its quotient map,
the map `M/p^r M → W_r(M)` (which exists because `p^r M^n ⊆ N_r^n`) and the map induced on
`M/p^r M` by a morphism. -/
def DieudonneComplex.modPow (M : DieudonneComplex.{u} p) (r : ℕ) :
    CochainComplex (ModuleCat.{u} ℤ) ℤ :=
  CochainComplex.of
    (fun n => ModuleCat.of ℤ (M.complex.X n ⧸
      LinearMap.range ((p^r : ℤ) • (LinearMap.id : Module.End ℤ (M.complex.X n)))))
    (fun n => ModuleCat.ofHom
      ((LinearMap.range ((p^r : ℤ) • (LinearMap.id : Module.End ℤ (M.complex.X n)))).mapQ
        (LinearMap.range ((p^r : ℤ) • (LinearMap.id : Module.End ℤ (M.complex.X (n+1)))))
        (M.complex.d n (n+1)).hom (by sorry)))
    (by sorry)
def DieudonneComplex.modPowMk (M : DieudonneComplex.{u} p) (r : ℕ) (n : ℤ) :
    M.complex.X n →ₗ[ℤ] (M.modPow r).X n := by
  change M.complex.X n →ₗ[ℤ] (M.complex.X n ⧸
    LinearMap.range ((p^r : ℤ) • (LinearMap.id : Module.End ℤ (M.complex.X n))))
  exact { toFun := Submodule.Quotient.mk, map_add' := by sorry, map_smul' := by sorry }
lemma DieudonneComplex.modPow_d_mk (M : DieudonneComplex.{u} p) (r : ℕ) (n : ℤ)
    (x : M.complex.X n) :
    ((M.modPow r).d n (n+1)).hom (M.modPowMk r n x) =
      M.modPowMk r (n+1) ((M.complex.d n (n+1)).hom x) := by sorry
def WfromModPow (r : ℕ) : M.modPow r ⟶ Wcomplex M hM r := by sorry
lemma WfromModPow_mk (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((WfromModPow M hM r).f n).hom (M.modPowMk r n x) = Wmk M hM r n x := by sorry
def DieudonneHom.modPowMap {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N) (r : ℕ) :
    M.modPow r ⟶ N.modPow r := by sorry
lemma DieudonneHom.modPowMap_mk {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (r : ℕ) (n : ℤ) (x : M.complex.X n) :
    ((f.modPowMap r).f n).hom (M.modPowMk r n x) =
      N.modPowMk r n ((f.toCochainHom.f n).hom x) := by sorry

/- The isomorphism `θ_r : W_r(M)^n → H^n(M/p^r M)` of BLM Proposition 2.7.1; its formula
`[x] ↦ [F^r x]` is the first part of `Wcomplex_cohomology`. -/
def Wtheta (r : ℕ) (n : ℤ) : (Wcomplex M hM r).X n ≃ₗ[ℤ] (M.modPow r).homology n := by sorry

-- CrystallineCohomology:CR.4/finite-witt-cohomology
theorem Wcomplex_cohomology [Fact p.Prime] (r : ℕ) :
    (∀ (n : ℤ) (x : M.complex.X n) (z : (M.modPow r).cycles n),
      ((M.modPow r).iCycles n).hom z = M.modPowMk r n ((M.F n ^ r) x) →
        Wtheta M hM r n (Wmk M hM r n x) = ((M.modPow r).homologyπ n).hom z) ∧
    (∀ (N : DieudonneComplex.{u} p) (hN : IsSaturated N) (f : DieudonneHom M N) (n : ℤ)
        (y : (Wcomplex M hM r).X n),
      Wtheta N hN r n (((f.Wmap hM hN r).f n).hom y) =
        (HomologicalComplex.homologyMap (f.modPowMap r) n).hom (Wtheta M hM r n y)) ∧
    QuasiIso (WfromModPow M hM r) := by sorry

end FiniteWittCohomology

end TauCeti.Crystalline

namespace TauCeti.PD

section FiltrationCorrected
variable {R : Type*} [CommRing R] {I : Ideal R}

-- Node CR.0/pd-filtration: new API item and new test.
theorem pdFiltration_eq_span_of_span (hI : DividedPowers I) (S : Set R) (hS : I = Ideal.span S)
    (n : ℕ) :
    pdFiltration hI n = Ideal.span {z | ∃ l : List (ℕ × S),
      n ≤ (l.map Prod.fst).sum ∧ z = (l.map fun t => hI.dpow t.1 (t.2 : R)).prod} := by sorry

-- TauCeti.Crystalline.pd_filtration_two_adic_constant
example (n : ℕ) (hn : 1 ≤ n) :
    pdFiltration (PadicInt.dividedPowers 2) n = Ideal.span {(2 : ℤ_[2])} := by sorry

end FiltrationCorrected

end TauCeti.PD

namespace TauCeti.Crystalline

section GammaCorrected
variable (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]

-- Node CR.0/gamma-canonical-pd: new API items and new test.
lemma gammaPD_unique (δ' : DividedPowers (Augmentation.augmentationIdeal A M))
    (h : ∀ (n : ℕ) (m : M), n ≠ 0 →
      δ'.dpow n (DividedPowerAlgebra.dp A 1 m) = DividedPowerAlgebra.dp A n m) :
    δ' = gammaPD A M := by sorry
lemma gammaPD_dp (n k : ℕ) (hk : k ≠ 0) (m : M) :
    (gammaPD A M).dpow n (DividedPowerAlgebra.dp A k m) =
      (Nat.uniformBell n k : DividedPowerAlgebra A M) * DividedPowerAlgebra.dp A (n * k) m := by sorry
-- TauCeti.Crystalline.test_gammaPD_torsion_module
example : addOrderOf (DividedPowerAlgebra.dp ℤ 2 (1 : ZMod 2)) = 4 ∧
    addOrderOf (DividedPowerAlgebra.dp ℤ 1 (1 : ZMod 2)) = 2 ∧
    (gammaPD ℤ (ZMod 2)).dpow 2 (DividedPowerAlgebra.dp ℤ 1 (1 : ZMod 2)) =
      DividedPowerAlgebra.dp ℤ 2 (1 : ZMod 2) ∧
    DividedPowerAlgebra.dp ℤ 1 (1 : ZMod 2) ^ 2 = 2 * DividedPowerAlgebra.dp ℤ 2 (1 : ZMod 2) ∧
    (2 : DividedPowerAlgebra ℤ (ZMod 2)) * DividedPowerAlgebra.dp ℤ 2 (1 : ZMod 2) ≠ 0 := by sorry

end GammaCorrected

section PolynomialCorrected
variable {A : Type*} [CommRing A] {I : Ideal A} (γ : DividedPowers I) (W : Type*)

-- Node CR.0/pd-polynomial: new API items and new test.
lemma pdPolynomial_algebraMap_isDPMorphism :
    DividedPowers.IsDPMorphism γ (pdPolynomialPowers γ W)
      (algebraMap A (pdPolynomial (A := A) W)) := by sorry
lemma pdPolynomial_dpow_var (n : ℕ) (w : W) :
    (pdPolynomialPowers γ W).dpow n (DividedPowerAlgebra.dp A 1 (Finsupp.single w (1 : A))) =
      DividedPowerAlgebra.dp A n (Finsupp.single w (1 : A)) := by sorry
lemma pdPolynomial_dpow_unique (δ' : DividedPowers (pdPolynomialIdeal γ W))
    (hvar : ∀ (n : ℕ) (w : W),
      δ'.dpow n (DividedPowerAlgebra.dp A 1 (Finsupp.single w (1 : A))) =
        DividedPowerAlgebra.dp A n (Finsupp.single w (1 : A)))
    (hbase : DividedPowers.IsDPMorphism γ δ' (algebraMap A (pdPolynomial (A := A) W))) :
    δ' = pdPolynomialPowers γ W := by sorry
-- TauCeti.Crystalline.test_pdPolynomial_base_gluing
example (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) :
    (pdPolynomialPowers (TauCeti.PD.canonicalP p A hA) Unit).dpow 2
        (algebraMap A (pdPolynomial (A := A) Unit) (p : A) +
          DividedPowerAlgebra.dp A 1 (Finsupp.single () (1 : A))) =
      algebraMap A (pdPolynomial (A := A) Unit) ((TauCeti.PD.canonicalP p A hA).dpow 2 (p : A)) +
        algebraMap A (pdPolynomial (A := A) Unit) (p : A) *
          DividedPowerAlgebra.dp A 1 (Finsupp.single () (1 : A)) +
        DividedPowerAlgebra.dp A 2 (Finsupp.single () (1 : A)) := by sorry

end PolynomialCorrected

section SquareZero
variable {A : Type*} [CommRing A] {I : Ideal A}

/-- The ideal `I ⊕ M` of the trivial square-zero extension `A ⊕ M`: the elements whose
component in `A` lies in `I`. -/
abbrev pdSqZeroExtIdeal (I : Ideal A) (M : Type*) [AddCommGroup M] [Module A M] [Module Aᵐᵒᵖ M]
    [IsCentralScalar A M] : Ideal (TrivSqZeroExt A M) :=
  I.comap (TrivSqZeroExt.fstHom A A M)

variable (γ : DividedPowers I)
variable (M : Type*) [AddCommGroup M] [Module A M] [Module Aᵐᵒᵖ M] [IsCentralScalar A M]

-- CrystallineCohomology:CR.0/pd-square-zero-extension
def pdSqZeroExt (γ : DividedPowers I) (M : Type*) [AddCommGroup M] [Module A M] [Module Aᵐᵒᵖ M]
    [IsCentralScalar A M] : DividedPowers (pdSqZeroExtIdeal I M) := by sorry
lemma pdSqZeroExt_dpow (n : ℕ) (hn : n ≠ 0) (x : A) (hx : x ∈ I) (z : M) :
    (pdSqZeroExt γ M).dpow n (TrivSqZeroExt.inl x + TrivSqZeroExt.inr z) =
      TrivSqZeroExt.inl (γ.dpow n x) + TrivSqZeroExt.inr (γ.dpow (n - 1) x • z) := by sorry
lemma pdSqZeroExt_dpow_inr (z : M) :
    (pdSqZeroExt γ M).dpow 1 (TrivSqZeroExt.inr z) = TrivSqZeroExt.inr z ∧
      ∀ n : ℕ, 2 ≤ n → (pdSqZeroExt γ M).dpow n (TrivSqZeroExt.inr z) = 0 := by sorry
lemma pdSqZeroExt_inl_isDPMorphism :
    DividedPowers.IsDPMorphism γ (pdSqZeroExt γ M) (TrivSqZeroExt.inlHom A M) := by sorry
lemma pdSqZeroExt_fst_isDPMorphism :
    DividedPowers.IsDPMorphism (pdSqZeroExt γ M) γ
      (TrivSqZeroExt.fstHom A A M).toRingHom := by sorry
lemma pdSqZeroExt_map {N : Type*} [AddCommGroup N] [Module A N] [Module Aᵐᵒᵖ N]
    [IsCentralScalar A N] (u : M →ₗ[A] N) :
    DividedPowers.IsDPMorphism (pdSqZeroExt γ M) (pdSqZeroExt γ N)
      (TrivSqZeroExt.map u).toRingHom := by sorry
lemma pdSqZeroExt_derivation_iff {A₀ : Type*} [CommRing A₀] [Algebra A₀ A] [Module A₀ M]
    [IsScalarTower A₀ A M] (θ : Derivation A₀ A M) (φ : A →+* TrivSqZeroExt A M)
    (hφ : ∀ a : A, φ a = TrivSqZeroExt.inl a + TrivSqZeroExt.inr (θ a)) :
    DividedPowers.IsDPMorphism γ (pdSqZeroExt γ M) φ ↔
      ∀ x ∈ I, ∀ n : ℕ, n ≠ 0 → θ (γ.dpow n x) = γ.dpow (n - 1) x • θ x := by sorry
-- TauCeti.Crystalline.test_pdSqZeroExt_zero_module
example [Subsingleton M] :
    Function.Bijective (TrivSqZeroExt.inlHom A M) ∧
      I.map (TrivSqZeroExt.inlHom A M) = pdSqZeroExtIdeal I M ∧
      ∀ (n : ℕ) (x : A),
        (pdSqZeroExt γ M).dpow n (TrivSqZeroExt.inl x) = TrivSqZeroExt.inl (γ.dpow n x) := by sorry
-- TauCeti.Crystalline.test_pdSqZeroExt_dpow_two
example (x : A) (hx : x ∈ I) (z : M) :
    (pdSqZeroExt γ M).dpow 2 (TrivSqZeroExt.inl x + TrivSqZeroExt.inr z) =
        TrivSqZeroExt.inl (γ.dpow 2 x) + TrivSqZeroExt.inr (x • z) ∧
      2 * (pdSqZeroExt γ M).dpow 2 (TrivSqZeroExt.inl x + TrivSqZeroExt.inr z) =
        (TrivSqZeroExt.inl x + TrivSqZeroExt.inr z) ^ 2 := by sorry
-- TauCeti.Crystalline.test_pdSqZeroExt_F2
example :
    pdSqZeroExtIdeal (⊥ : Ideal (ZMod 2)) (ZMod 2) =
        Ideal.span {(TrivSqZeroExt.inr 1 : TrivSqZeroExt (ZMod 2) (ZMod 2))} ∧
      (pdSqZeroExt (dividedPowersBot (ZMod 2)) (ZMod 2)).dpow 2 (TrivSqZeroExt.inr 1) = 0 ∧
      ∃ δ' : DividedPowers (pdSqZeroExtIdeal (⊥ : Ideal (ZMod 2)) (ZMod 2)),
        (∀ a : ℕ, δ'.dpow (2 ^ a) (TrivSqZeroExt.inr 1) = TrivSqZeroExt.inr 1) ∧
        (∀ n : ℕ, 2 ≤ n → (¬ ∃ a : ℕ, n = 2 ^ a) → δ'.dpow n (TrivSqZeroExt.inr 1) = 0) ∧
        δ' ≠ pdSqZeroExt (dividedPowersBot (ZMod 2)) (ZMod 2) := by sorry

end SquareZero

section Compatible
variable {A B : Type*} [CommRing A] [CommRing B] {I : Ideal A} {J : Ideal B}

-- CrystallineCohomology:CR.0/compatible-divided-powers
def IsCompatibleWith (γ : DividedPowers I) (δ : DividedPowers J) (φ : A →+* B) : Prop :=
  ∃ θ : DividedPowers (J ⊔ I.map φ),
    DividedPowers.IsDPMorphism γ θ φ ∧ DividedPowers.IsDPMorphism δ θ (RingHom.id B)
lemma IsCompatibleWith.unique (γ : DividedPowers I) (δ : DividedPowers J) (φ : A →+* B)
    (θ θ' : DividedPowers (J ⊔ I.map φ))
    (h : DividedPowers.IsDPMorphism γ θ φ ∧ DividedPowers.IsDPMorphism δ θ (RingHom.id B))
    (h' : DividedPowers.IsDPMorphism γ θ' φ ∧ DividedPowers.IsDPMorphism δ θ' (RingHom.id B)) :
    θ = θ' := by sorry
lemma isCompatibleWith_iff_isDPMorphism (γ : DividedPowers I) (δ : DividedPowers J) (φ : A →+* B)
    (h : I.map φ ≤ J) : IsCompatibleWith γ δ φ ↔ DividedPowers.IsDPMorphism γ δ φ := by sorry
lemma isCompatibleWith_iff_extends_agree (γ : DividedPowers I) (δ : DividedPowers J)
    (φ : A →+* B) :
    IsCompatibleWith γ δ φ ↔ ∃ γB : DividedPowers (I.map φ), DividedPowers.IsDPMorphism γ γB φ ∧
      ∀ (n : ℕ) (x : B), x ∈ I.map φ ⊓ J → γB.dpow n x = δ.dpow n x := by sorry
lemma isCompatibleWith_of_inf_eq_mul (γ : DividedPowers I) (δ : DividedPowers J) (φ : A →+* B)
    (γB : DividedPowers (I.map φ)) (hγB : DividedPowers.IsDPMorphism γ γB φ)
    (h : I.map φ ⊓ J = I.map φ * J) : IsCompatibleWith γ δ φ := by sorry
lemma isCompatibleWith_bot (δ : DividedPowers J) (φ : A →+* B) :
    IsCompatibleWith (dividedPowersBot A) δ φ := by sorry
-- TauCeti.Crystalline.test_isCompatibleWith_zero_base
example (δ : DividedPowers J) (φ : A →+* B) :
    IsCompatibleWith (dividedPowersBot A) δ φ ∧
      ∀ θ : DividedPowers (J ⊔ (⊥ : Ideal A).map φ),
        DividedPowers.IsDPMorphism (dividedPowersBot A) θ φ →
        DividedPowers.IsDPMorphism δ θ (RingHom.id B) →
        ∀ (n : ℕ) (x : B), θ.dpow n x = δ.dpow n x := by sorry
open scoped Classical in
-- TauCeti.Crystalline.test_isCompatibleWith_Z4
example (A : Type*) [CommRing A] (hA : ∀ n : ℕ, ¬ 2 ∣ n → IsUnit (n : A)) (φ : A →+* ZMod 4)
    (h : ∀ n : ℕ, ¬ 2 ∣ n → IsUnit (n : ZMod 4)) :
    IsCompatibleWith (TauCeti.PD.canonicalP 2 A hA) (TauCeti.PD.canonicalP 2 (ZMod 4) h) φ ∧
      (TauCeti.PD.canonicalP 2 (ZMod 4) h).dpow 2 2 = 2 ∧
      ∃ h2 : Ideal.span {((2 : ℕ) : ZMod 4)} ^ 2 = 0,
        (DividedPowers.OfSquareZero.dividedPowers h2).dpow 2 2 = 0 ∧
        ¬ IsCompatibleWith (TauCeti.PD.canonicalP 2 A hA)
          (DividedPowers.OfSquareZero.dividedPowers h2) φ := by sorry
open scoped Classical in
-- TauCeti.Crystalline.test_isCompatibleWith_sqZero
example (γ : DividedPowers I) (M : Type*) [AddCommGroup M] [Module A M] [Module Aᵐᵒᵖ M]
    [IsCentralScalar A M] :
    ∃ h2 : pdSqZeroExtIdeal (⊥ : Ideal A) M ^ 2 = 0,
      IsCompatibleWith γ (DividedPowers.OfSquareZero.dividedPowers h2) (TrivSqZeroExt.inlHom A M) ∧
      pdSqZeroExtIdeal (⊥ : Ideal A) M ⊔ I.map (TrivSqZeroExt.inlHom A M) = pdSqZeroExtIdeal I M ∧
      ∀ θ : DividedPowers (pdSqZeroExtIdeal (⊥ : Ideal A) M ⊔ I.map (TrivSqZeroExt.inlHom A M)),
        DividedPowers.IsDPMorphism γ θ (TrivSqZeroExt.inlHom A M) →
        DividedPowers.IsDPMorphism (DividedPowers.OfSquareZero.dividedPowers h2) θ
          (RingHom.id (TrivSqZeroExt A M)) →
        ∀ (n : ℕ) (x : TrivSqZeroExt A M), θ.dpow n x = (pdSqZeroExt γ M).dpow n x := by sorry

end Compatible

section EnvelopeCorrected
variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B] {I : Ideal A}

-- Node CR.0/pd-envelope: new API items and new tests (PDEnvelope.map is restated in place).
lemma PDEnvelope.span_dpow_image (γ : DividedPowers I) (J : Ideal B)
    (hIJ : I.map (algebraMap A B) ≤ J) :
    Ideal.span {z | ∃ (n : ℕ) (x : B), n ≠ 0 ∧ x ∈ J ∧
        z = (PDEnvelope.powers γ J).dpow n (PDEnvelope.of γ J x)} = PDEnvelope.ideal γ J ∧
      Subring.closure (Set.range (PDEnvelope.of γ J) ∪ {z | ∃ (n : ℕ) (x : B), n ≠ 0 ∧ x ∈ J ∧
        z = (PDEnvelope.powers γ J).dpow n (PDEnvelope.of γ J x)}) = ⊤ := by sorry

lemma PDEnvelope.presentation {B : Type*} [CommRing B] {I : Ideal B} (γ : DividedPowers I)
    (J : Ideal B) {T : Type*} (f : T → B) (hJ : J = I ⊔ Ideal.span (Set.range f))
    (Ψ : pdPolynomial (A := B) T →ₐ[B] PDEnvelope γ J)
    (hΨ : DividedPowers.IsDPMorphism (pdPolynomialPowers γ T) (PDEnvelope.powers γ J) Ψ.toRingHom)
    (hΨf : ∀ t : T,
      Ψ (DividedPowerAlgebra.dp B 1 (Finsupp.single t (1 : B))) = PDEnvelope.of γ J (f t)) :
    Function.Surjective Ψ ∧ RingHom.ker Ψ.toRingHom = Ideal.span
      ({z | ∃ t : T, z = DividedPowerAlgebra.dp B 1 (Finsupp.single t (1 : B)) -
          algebraMap B (pdPolynomial (A := B) T) (f t)} ∪
        {z | ∃ (n : ℕ) (r : T →₀ B) (r₀ : B), n ≠ 0 ∧ r₀ ∈ I ∧ (r.sum fun t c => c * f t) = r₀ ∧
          z = (pdPolynomialPowers γ T).dpow n
            ((r.sum fun t c => algebraMap B (pdPolynomial (A := B) T) c *
                DividedPowerAlgebra.dp B 1 (Finsupp.single t (1 : B))) -
              algebraMap B (pdPolynomial (A := B) T) r₀)}) := by sorry

/-- The structure map `A → B → D_(B,γ)(J)` of the envelope as an `A`-algebra. -/
abbrev PDEnvelope.ofBase (γ : DividedPowers I) (J : Ideal B) : A →+* PDEnvelope γ J :=
  (PDEnvelope.of γ J).toRingHom.comp (algebraMap A B)
/-- The sub-PD ideal `J̄₀` of the envelope of `J₀ + IB` generated by the image of `J₀`. -/
def PDEnvelope.subIdeal (γ : DividedPowers I) (J₀ : Ideal B) :
    Ideal (PDEnvelope γ (J₀ ⊔ I.map (algebraMap A B))) :=
  (DividedPowers.SubDPIdeal.span (PDEnvelope.powers γ (J₀ ⊔ I.map (algebraMap A B)))
    ((PDEnvelope.of γ (J₀ ⊔ I.map (algebraMap A B))) '' (J₀ : Set B))).carrier
open scoped Classical in
/-- The divided powers of the envelope of `J₀ + IB`, restricted to `J̄₀`. -/
def PDEnvelope.subPowers (γ : DividedPowers I) (J₀ : Ideal B) :
    DividedPowers (A := PDEnvelope γ (J₀ ⊔ I.map (algebraMap A B))) (PDEnvelope.subIdeal γ J₀) :=
  DividedPowers.IsSubDPIdeal.dividedPowers (PDEnvelope.powers γ (J₀ ⊔ I.map (algebraMap A B)))
    (DividedPowers.SubDPIdeal.toIsSubDPIdeal _)
lemma PDEnvelope.ideal_eq_subIdeal_sup (γ : DividedPowers I) (J₀ : Ideal B) :
    PDEnvelope.ideal γ (J₀ ⊔ I.map (algebraMap A B)) = PDEnvelope.subIdeal γ J₀ ⊔
      I.map (PDEnvelope.ofBase γ (J₀ ⊔ I.map (algebraMap A B))) := by sorry
lemma PDEnvelope.subPowers_isCompatibleWith (γ : DividedPowers I) (J₀ : Ideal B) :
    IsCompatibleWith (B := PDEnvelope γ (J₀ ⊔ I.map (algebraMap A B))) γ
      (PDEnvelope.subPowers γ J₀) (PDEnvelope.ofBase γ (J₀ ⊔ I.map (algebraMap A B))) := by sorry
lemma PDEnvelope.compatible_lift (γ : DividedPowers I) (J₀ : Ideal B) {C : Type*} [CommRing C]
    [Algebra A C] (K : Ideal C) (ε : DividedPowers K)
    (hε : IsCompatibleWith γ ε (algebraMap A C)) (f : B →ₐ[A] C) (hf : J₀.map f.toRingHom ≤ K) :
    ∃! g : PDEnvelope γ (J₀ ⊔ I.map (algebraMap A B)) →ₐ[A] C,
      g.comp (PDEnvelope.of γ (J₀ ⊔ I.map (algebraMap A B))) = f ∧
        DividedPowers.IsDPMorphism (A := PDEnvelope γ (J₀ ⊔ I.map (algebraMap A B)))
          (PDEnvelope.subPowers γ J₀) ε g.toRingHom := by sorry

lemma PDEnvelope.eq_of_isCompatible (γ : DividedPowers I) (J₀ : Ideal B)
    (θ : DividedPowers (A := PDEnvelope (dividedPowersBot A) J₀)
      (PDEnvelope.ideal (dividedPowersBot A) J₀ ⊔ I.map (PDEnvelope.ofBase (dividedPowersBot A) J₀)))
    (hθγ : DividedPowers.IsDPMorphism γ θ (PDEnvelope.ofBase (dividedPowersBot A) J₀))
    (hθδ : DividedPowers.IsDPMorphism (PDEnvelope.powers (dividedPowersBot A) J₀) θ
      (RingHom.id (PDEnvelope (dividedPowersBot A) J₀))) :
    ∃ e : PDEnvelope (dividedPowersBot A) J₀ ≃+* PDEnvelope γ (J₀ ⊔ I.map (algebraMap A B)),
      (∀ b : B, e (PDEnvelope.of (dividedPowersBot A) J₀ b) =
        PDEnvelope.of γ (J₀ ⊔ I.map (algebraMap A B)) b) ∧
      (PDEnvelope.ideal (dividedPowersBot A) J₀ ⊔
        I.map (PDEnvelope.ofBase (dividedPowersBot A) J₀)).map e.toRingHom =
          PDEnvelope.ideal γ (J₀ ⊔ I.map (algebraMap A B)) ∧
      DividedPowers.IsDPMorphism θ (PDEnvelope.powers γ (J₀ ⊔ I.map (algebraMap A B)))
        e.toRingHom := by sorry
lemma PDEnvelope.isCompatibleWith_of_torsionFree (p : ℕ) [Fact p.Prime]
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) (J₀ : Ideal B)
    (htf : ∀ x : B ⧸ J₀, (p : B ⧸ J₀) * x = 0 → x = 0) :
    IsCompatibleWith (B := PDEnvelope (dividedPowersBot A) J₀) (TauCeti.PD.canonicalP p A hA)
      (PDEnvelope.powers (dividedPowersBot A) J₀)
      (PDEnvelope.ofBase (dividedPowersBot A) J₀) := by sorry
lemma PDEnvelope.isCompatibleWith_of_flat (p : ℕ) [Fact p.Prime]
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) (J₀ : Ideal B) (n : ℕ) [Algebra (ZMod (p ^ n)) B]
    [Module.Flat (ZMod (p ^ n)) (B ⧸ J₀)] :
    IsCompatibleWith (B := PDEnvelope (dividedPowersBot A) J₀) (TauCeti.PD.canonicalP p A hA)
      (PDEnvelope.powers (dividedPowersBot A) J₀)
      (PDEnvelope.ofBase (dividedPowersBot A) J₀) := by sorry

-- TauCeti.Crystalline.test_envelope_truncated
example (p : ℕ) [Fact p.Prime]
    (t : Polynomial (ZMod p) ⧸ Ideal.span {(Polynomial.X : Polynomial (ZMod p)) ^ p})
    (ht : t = Ideal.Quotient.mk _ Polynomial.X) :
    (∃ δ : DividedPowers (Ideal.span {t}), ∀ n : ℕ, p ≤ n → δ.dpow n t = 0) ∧
    (∃ e : PDEnvelope (dividedPowersBot (ZMod p)) (Ideal.span {t}) ≃ₐ[ZMod p]
        pdPolynomial (A := ZMod p) Unit,
      ∀ n : ℕ, e ((PDEnvelope.powers (dividedPowersBot (ZMod p)) (Ideal.span {t})).dpow n
          (PDEnvelope.of (dividedPowersBot (ZMod p)) (Ideal.span {t}) t)) =
        DividedPowerAlgebra.dp (ZMod p) n (Finsupp.single () (1 : ZMod p))) ∧
    (PDEnvelope.powers (dividedPowersBot (ZMod p)) (Ideal.span {t})).dpow p
        (PDEnvelope.of (dividedPowersBot (ZMod p)) (Ideal.span {t}) t) ≠ 0 ∧
    ∀ δ : DividedPowers (Ideal.span {t}), (∀ n : ℕ, p ≤ n → δ.dpow n t = 0) →
      ∃ r : PDEnvelope (dividedPowersBot (ZMod p)) (Ideal.span {t}) →ₐ[ZMod p]
          (Polynomial (ZMod p) ⧸ Ideal.span {(Polynomial.X : Polynomial (ZMod p)) ^ p}),
        r.comp (PDEnvelope.of (dividedPowersBot (ZMod p)) (Ideal.span {t})) = AlgHom.id _ _ ∧
        DividedPowers.IsDPMorphism (PDEnvelope.powers (dividedPowersBot (ZMod p)) (Ideal.span {t})) δ
          r.toRingHom ∧
        (∀ n : ℕ, p ≤ n →
          r ((PDEnvelope.powers (dividedPowersBot (ZMod p)) (Ideal.span {t})).dpow n
            (PDEnvelope.of (dividedPowersBot (ZMod p)) (Ideal.span {t}) t)) = 0) ∧
        ¬ Function.Injective r := by sorry
-- TauCeti.Crystalline.test_envelope_two_bases
example (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A))
    (htf : ∀ x : A, (p : A) * x = 0 → x = 0) (hpu : ¬ IsUnit (p : A)) :
    Function.Bijective (PDEnvelope.of (TauCeti.PD.canonicalP p A hA) (Ideal.span {(p : A)})) ∧
    (∃ e : PDEnvelope (dividedPowersBot A) (Ideal.span {(p : A)}) ≃ₐ[A]
        (pdPolynomial (A := A) Unit ⧸ Ideal.span
          {DividedPowerAlgebra.dp A 1 (Finsupp.single () (1 : A)) -
            algebraMap A (pdPolynomial (A := A) Unit) (p : A)}),
      ∀ n : ℕ, e ((PDEnvelope.powers (dividedPowersBot A) (Ideal.span {(p : A)})).dpow n
          (PDEnvelope.of (dividedPowersBot A) (Ideal.span {(p : A)}) (p : A))) =
        Ideal.Quotient.mk _ (DividedPowerAlgebra.dp A n (Finsupp.single () (1 : A)))) ∧
    (PDEnvelope.powers (dividedPowersBot A) (Ideal.span {(p : A)})).dpow p
        (PDEnvelope.of (dividedPowersBot A) (Ideal.span {(p : A)}) (p : A)) -
      PDEnvelope.of (dividedPowersBot A) (Ideal.span {(p : A)})
        (TauCeti.PD.canonicalPCoeff p A p) ≠ 0 ∧
    (p : PDEnvelope (dividedPowersBot A) (Ideal.span {(p : A)})) *
      ((PDEnvelope.powers (dividedPowersBot A) (Ideal.span {(p : A)})).dpow p
          (PDEnvelope.of (dividedPowersBot A) (Ideal.span {(p : A)}) (p : A)) -
        PDEnvelope.of (dividedPowersBot A) (Ideal.span {(p : A)})
          (TauCeti.PD.canonicalPCoeff p A p)) = 0 := by sorry

-- CrystallineCohomology:CR.0/envelope-add-variables
theorem PDEnvelope.addVariables (γ : DividedPowers I) (J : Ideal B)
    (hIJ : I.map (algebraMap A B) ≤ J) (W : Type*) :
    ∃ e : PDEnvelope γ (J.map (algebraMap B (MvPolynomial W B)) ⊔
        Ideal.span (Set.range (MvPolynomial.X : W → MvPolynomial W B))) ≃+*
        pdPolynomial (A := PDEnvelope γ J) W,
      (∀ b : B, e (PDEnvelope.of γ _ (MvPolynomial.C b)) =
        Algebra.ofId (PDEnvelope γ J) (pdPolynomial (A := PDEnvelope γ J) W) (PDEnvelope.of γ J b)) ∧
      (∀ w : W, e (PDEnvelope.of γ _ (MvPolynomial.X w)) =
        DividedPowerAlgebra.dp (PDEnvelope γ J) 1 (Finsupp.single w (1 : PDEnvelope γ J))) ∧
      (PDEnvelope.ideal γ _).map e.toRingHom =
        pdPolynomialIdeal (A := PDEnvelope γ J) (PDEnvelope.powers γ J) W ∧
      DividedPowers.IsDPMorphism (PDEnvelope.powers γ _)
        (pdPolynomialPowers (A := PDEnvelope γ J) (PDEnvelope.powers γ J) W) e.toRingHom := by sorry

end EnvelopeCorrected

section NilpotenceCorrected

-- Node CR.0/nilpotence-predicates: new API item and new tests.
lemma pdIdeal_le_nilradical_iff {A : Type*} [CommRing A] {I : Ideal A} (γ : DividedPowers I)
    (p : ℕ) [Fact p.Prime] (hp : IsNilpotent (Ideal.Quotient.mk I (p : A))) :
    I ≤ nilradical A ↔ IsNilpotent (p : A) := by sorry
open scoped Classical in
-- TauCeti.Crystalline.test_nilpotent_two_structures
example (h : ∀ n : ℕ, ¬ 2 ∣ n → IsUnit (n : ZMod 4)) :
    ∃ h2 : Ideal.span {((2 : ℕ) : ZMod 4)} ^ 2 = 0,
      TauCeti.PD.pdFiltration (DividedPowers.OfSquareZero.dividedPowers h2) 2 = ⊥ ∧
      IsPDNilpotent (DividedPowers.OfSquareZero.dividedPowers h2) ∧
      (TauCeti.PD.canonicalP 2 (ZMod 4) h).dpow 2 2 = 2 ∧
      ¬ IsPDNilpotent (TauCeti.PD.canonicalP 2 (ZMod 4) h) := by sorry
-- TauCeti.Crystalline.test_nilpotent_mod_p_power
example (p : ℕ) [Fact p.Prime] (e : ℕ) (he : 1 ≤ e)
    (h : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : ZMod (p ^ e))) :
    IsPDNilpotent (TauCeti.PD.canonicalP p (ZMod (p ^ e)) h) ↔ (p ≠ 2 ∨ e = 1) := by sorry

end NilpotenceCorrected

section CompletedEnvelope

/-- The `p`-adic completion `D^` of a commutative ring `D`. -/
abbrev completedEnvelope.ring (p : ℕ) (D : Type*) [CommRing D] : Type _ :=
  AdicCompletion (Ideal.span {(p : D)}) D
/-- The canonical map `D → D^`. -/
abbrev completedEnvelope.of (p : ℕ) (D : Type*) [CommRing D] : D →+* completedEnvelope.ring p D :=
  algebraMap D (AdicCompletion (Ideal.span {(p : D)}) D)
/-- The map `D^ → D/J̄` for an ideal `J̄` containing `p ^ t`: reduction modulo `p ^ t`, followed
by `D/p^t D → D/J̄`. -/
def completedEnvelope.toQuotient (p : ℕ) {D : Type*} [CommRing D] (J : Ideal D) (t : ℕ)
    (ht : (p : D) ^ t ∈ J) : completedEnvelope.ring p D →+* D ⧸ J :=
  (Ideal.Quotient.factor (show Ideal.span {(p : D)} ^ t ≤ J by
    rw [Ideal.span_singleton_pow, Ideal.span_singleton_le_iff_mem]; exact ht)).comp
    (AdicCompletion.evalₐ (Ideal.span {(p : D)}) t).toRingHom
/-- The ideal `J̄^` of `D^`: the kernel of `D^ → D/J̄`. -/
abbrev completedEnvelope.ideal (p : ℕ) {D : Type*} [CommRing D] (J : Ideal D) (t : ℕ)
    (ht : (p : D) ^ t ∈ J) : Ideal (completedEnvelope.ring p D) :=
  RingHom.ker (completedEnvelope.toQuotient p J t ht)

-- CrystallineCohomology:CR.0/completed-envelope
def completedEnvelope (p : ℕ) [Fact p.Prime] {D : Type*} [CommRing D] {J : Ideal D}
    (γ : DividedPowers J) (t : ℕ) (ht : (p : D) ^ t ∈ J) :
    DividedPowers (completedEnvelope.ideal p J t ht) := by sorry
lemma completedEnvelope.toQuotient_of (p : ℕ) {D : Type*} [CommRing D] (J : Ideal D) (t : ℕ)
    (ht : (p : D) ^ t ∈ J) (x : D) :
    completedEnvelope.toQuotient p J t ht (completedEnvelope.of p D x) =
      Ideal.Quotient.mk J x := by sorry
lemma completedEnvelope.toQuotient_surjective (p : ℕ) {D : Type*} [CommRing D] (J : Ideal D)
    (t : ℕ) (ht : (p : D) ^ t ∈ J) :
    Function.Surjective (completedEnvelope.toQuotient p J t ht) := by sorry
lemma completedEnvelope.ideal_eq_range_map (p : ℕ) {D : Type*} [CommRing D] (J : Ideal D) (t : ℕ)
    (ht : (p : D) ^ t ∈ J) :
    Function.Injective (AdicCompletion.map (Ideal.span {(p : D)}) J.subtype) ∧
      LinearMap.range (AdicCompletion.map (Ideal.span {(p : D)}) J.subtype) =
        completedEnvelope.ideal p J t ht := by sorry
lemma completedEnvelope.ideal_eq_ideal (p : ℕ) {D : Type*} [CommRing D] (J : Ideal D) (t : ℕ)
    (ht : (p : D) ^ t ∈ J) (s : ℕ) (hs : (p : D) ^ s ∈ J) :
    completedEnvelope.ideal p J t ht = completedEnvelope.ideal p J s hs := by sorry
lemma completedEnvelope_dpow_eq (p : ℕ) [Fact p.Prime] {D : Type*} [CommRing D] {J : Ideal D}
    (γ : DividedPowers J) (t : ℕ) (ht : (p : D) ^ t ∈ J) (s : ℕ) (hs : (p : D) ^ s ∈ J) (n : ℕ)
    (x : completedEnvelope.ring p D) :
    (completedEnvelope p γ t ht).dpow n x = (completedEnvelope p γ s hs).dpow n x := by sorry
lemma completedEnvelope_of_isDPMorphism (p : ℕ) [Fact p.Prime] {D : Type*} [CommRing D]
    {J : Ideal D} (γ : DividedPowers J) (t : ℕ) (ht : (p : D) ^ t ∈ J) :
    DividedPowers.IsDPMorphism γ (completedEnvelope p γ t ht) (completedEnvelope.of p D) := by sorry
lemma completedEnvelope_unique (p : ℕ) [Fact p.Prime] {D : Type*} [CommRing D] {J : Ideal D}
    (γ : DividedPowers J) (t : ℕ) (ht : (p : D) ^ t ∈ J)
    (δ : DividedPowers (completedEnvelope.ideal p J t ht))
    (hδ : DividedPowers.IsDPMorphism γ δ (completedEnvelope.of p D)) :
    δ = completedEnvelope p γ t ht := by sorry
lemma completedEnvelope.isSubDPIdeal_span_pow (p : ℕ) [Fact p.Prime] {D : Type*} [CommRing D]
    {J : Ideal D} (γ : DividedPowers J) (hD : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : D)) (t : ℕ)
    (ht : (p : D) ^ t ∈ J) (e : ℕ) (he : t < e) :
    γ.IsSubDPIdeal (Ideal.span {(p : D) ^ e}) := by sorry

lemma completedEnvelope_lift (p : ℕ) [Fact p.Prime] {D : Type*} [CommRing D] {J : Ideal D}
    (γ : DividedPowers J) (t : ℕ) (ht : (p : D) ^ t ∈ J) {C : Type*} [CommRing C]
    [IsAdicComplete (Ideal.span {(p : C)}) C] {K : Ideal C} (ε : DividedPowers K)
    (hK : K = ⨅ n : ℕ, K ⊔ Ideal.span {(p : C) ^ n})
    (f : D →+* C) (hf : DividedPowers.IsDPMorphism γ ε f) :
    ∃! g : completedEnvelope.ring p D →+* C, g.comp (completedEnvelope.of p D) = f ∧
      DividedPowers.IsDPMorphism (completedEnvelope p γ t ht) ε g := by sorry

/-- The map `f^ : D^ → D′^` induced by a ring homomorphism `f : D → D′`. -/
def completedEnvelope.map (p : ℕ) {D D' : Type*} [CommRing D] [CommRing D'] (f : D →+* D') :
    completedEnvelope.ring p D →+* completedEnvelope.ring p D' := by sorry
lemma completedEnvelope.map_of (p : ℕ) {D D' : Type*} [CommRing D] [CommRing D'] (f : D →+* D')
    (x : D) : completedEnvelope.map p f (completedEnvelope.of p D x) =
      completedEnvelope.of p D' (f x) := by sorry
lemma completedEnvelope.map_unique (p : ℕ) {D D' : Type*} [CommRing D] [CommRing D']
    (f : D →+* D') (F : completedEnvelope.ring p D →+* completedEnvelope.ring p D')
    (hF : ∀ x : D, F (completedEnvelope.of p D x) = completedEnvelope.of p D' (f x)) :
    F = completedEnvelope.map p f := by sorry
lemma completedEnvelope.map_id (p : ℕ) {D : Type*} [CommRing D] :
    completedEnvelope.map p (RingHom.id D) = RingHom.id (completedEnvelope.ring p D) := by sorry
lemma completedEnvelope.map_comp (p : ℕ) {D D' D'' : Type*} [CommRing D] [CommRing D']
    [CommRing D''] (f : D →+* D') (g : D' →+* D'') :
    completedEnvelope.map p (g.comp f) =
      (completedEnvelope.map p g).comp (completedEnvelope.map p f) := by sorry
lemma completedEnvelope_functorial (p : ℕ) [Fact p.Prime] {D D' : Type*} [CommRing D]
    [CommRing D'] {J : Ideal D} {J' : Ideal D'} (γ : DividedPowers J) (γ' : DividedPowers J')
    (t : ℕ) (ht : (p : D) ^ t ∈ J) (t' : ℕ) (ht' : (p : D') ^ t' ∈ J') (f : D →+* D')
    (hf : DividedPowers.IsDPMorphism γ γ' f) :
    DividedPowers.IsDPMorphism (completedEnvelope p γ t ht) (completedEnvelope p γ' t' ht')
      (completedEnvelope.map p f) := by sorry

/-- The ring `P/p^e P` carries the image `J_e` of `J`; `D_e` is the envelope of `J_e` in `P/p^e P`
relative to `(A, I, γ)`. -/
abbrev completedEnvelope.level (p : ℕ) {A P : Type*} [CommRing A] [CommRing P] [Algebra A P]
    {I : Ideal A} (γ : DividedPowers I) (J : Ideal P) (e : ℕ) : Type _ :=
  PDEnvelope γ (J.map (Ideal.Quotient.mk (Ideal.span {(p : P) ^ e})))
/-- The divided power ideal `J̄_e` of `D_e`. -/
abbrev completedEnvelope.levelIdeal (p : ℕ) {A P : Type*} [CommRing A] [CommRing P] [Algebra A P]
    {I : Ideal A} (γ : DividedPowers I) (J : Ideal P) (e : ℕ) :
    Ideal (completedEnvelope.level p γ J e) :=
  PDEnvelope.ideal γ (J.map (Ideal.Quotient.mk (Ideal.span {(p : P) ^ e})))
/-- The divided powers of `D_e`. -/
abbrev completedEnvelope.levelPowers (p : ℕ) {A P : Type*} [CommRing A] [CommRing P] [Algebra A P]
    {I : Ideal A} (γ : DividedPowers I) (J : Ideal P) (e : ℕ) :
    DividedPowers (A := completedEnvelope.level p γ J e) (completedEnvelope.levelIdeal p γ J e) :=
  PDEnvelope.powers γ (J.map (Ideal.Quotient.mk (Ideal.span {(p : P) ^ e})))
/-- The map `P → P/p^e P → D_e`. -/
abbrev completedEnvelope.levelOf (p : ℕ) {A P : Type*} [CommRing A] [CommRing P] [Algebra A P]
    {I : Ideal A} (γ : DividedPowers I) (J : Ideal P) (e : ℕ) :
    P →+* completedEnvelope.level p γ J e :=
  (PDEnvelope.of γ (J.map (Ideal.Quotient.mk (Ideal.span {(p : P) ^ e})))).toRingHom.comp
    (Ideal.Quotient.mk (Ideal.span {(p : P) ^ e}))

lemma completedEnvelope_mod_pow (p : ℕ) [Fact p.Prime] {A P : Type*} [CommRing A] [CommRing P]
    [Algebra A P] {I : Ideal A} (γ : DividedPowers I) (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A))
    (J : Ideal P) (hIJ : I.map (algebraMap A P) ≤ J) (t : ℕ) (ht : (p : P) ^ t ∈ J)
    (e : ℕ) (he : t < e) :
    (∃ g : PDEnvelope γ J →+* completedEnvelope.level p γ J e,
      (∀ b : P, g (PDEnvelope.of γ J b) = completedEnvelope.levelOf p γ J e b) ∧
      DividedPowers.IsDPMorphism (PDEnvelope.powers γ J) (completedEnvelope.levelPowers p γ J e) g ∧
      Function.Surjective g ∧ RingHom.ker g = Ideal.span {(p : PDEnvelope γ J) ^ e} ∧
      (PDEnvelope.ideal γ J).map g = completedEnvelope.levelIdeal p γ J e) ∧
    ∃ htD : (p : PDEnvelope γ J) ^ t ∈ PDEnvelope.ideal γ J,
    ∃ π : completedEnvelope.ring p (PDEnvelope γ J) →+* completedEnvelope.level p γ J e,
      (∀ b : P, π (completedEnvelope.of p (PDEnvelope γ J) (PDEnvelope.of γ J b)) =
        completedEnvelope.levelOf p γ J e b) ∧
      DividedPowers.IsDPMorphism
        (completedEnvelope p (D := PDEnvelope γ J) (PDEnvelope.powers γ J) t htD)
        (completedEnvelope.levelPowers p γ J e) π ∧
      Function.Surjective π ∧
      RingHom.ker π = Ideal.span {(p : completedEnvelope.ring p (PDEnvelope γ J)) ^ e} ∧
      (completedEnvelope.ideal p (D := PDEnvelope γ J) (PDEnvelope.ideal γ J) t htD).map π =
        completedEnvelope.levelIdeal p γ J e := by sorry

lemma completedEnvelope_eq_limit (p : ℕ) [Fact p.Prime] {A P : Type*} [CommRing A] [CommRing P]
    [Algebra A P] {I : Ideal A} (γ : DividedPowers I) (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A))
    (J : Ideal P) (hIJ : I.map (algebraMap A P) ≤ J) (t : ℕ) (ht : (p : P) ^ t ∈ J)
    (htD : (p : PDEnvelope γ J) ^ t ∈ PDEnvelope.ideal γ J)
    (π : ∀ e : ℕ, completedEnvelope.ring p (PDEnvelope γ J) →+* completedEnvelope.level p γ J e)
    (hπ : ∀ (e : ℕ) (b : P), π e (completedEnvelope.of p (PDEnvelope γ J) (PDEnvelope.of γ J b)) =
      completedEnvelope.levelOf p γ J e b)
    (hπpd : ∀ e : ℕ, t < e → DividedPowers.IsDPMorphism
      (completedEnvelope p (D := PDEnvelope γ J) (PDEnvelope.powers γ J) t htD)
      (completedEnvelope.levelPowers p γ J e) (π e))
    {C : Type*} [CommRing C] {K : Ideal C} (ε : DividedPowers K)
    (g : ∀ e : ℕ, C →+* completedEnvelope.level p γ J e)
    (hg : ∀ e : ℕ, t < e →
      DividedPowers.IsDPMorphism ε (completedEnvelope.levelPowers p γ J e) (g e))
    (hcompat : ∀ (e e' : ℕ)
      (τ : completedEnvelope.level p γ J e' →+* completedEnvelope.level p γ J e), t < e → e ≤ e' →
      (∀ b : P, τ (completedEnvelope.levelOf p γ J e' b) = completedEnvelope.levelOf p γ J e b) →
      DividedPowers.IsDPMorphism (completedEnvelope.levelPowers p γ J e')
        (completedEnvelope.levelPowers p γ J e) τ →
      τ.comp (g e') = g e) :
    ∃! G : C →+* completedEnvelope.ring p (PDEnvelope γ J),
      DividedPowers.IsDPMorphism ε
        (completedEnvelope p (D := PDEnvelope γ J) (PDEnvelope.powers γ J) t htD) G ∧
        ∀ e : ℕ, t < e → (π e).comp G = g e := by sorry

-- TauCeti.Crystalline.test_completedEnvelope_Zp
example (p : ℕ) [Fact p.Prime] [(Ideal.span {(p : ℤ)}).IsPrime] (Zp : Type*) [CommRing Zp]
    [Algebra ℤ Zp] [IsLocalization.AtPrime Zp (Ideal.span {(p : ℤ)})]
    (h : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : Zp)) :
    ∃ h1 : (p : Zp) ^ 1 ∈ Ideal.span {(p : Zp)},
    ∃ e : completedEnvelope.ring p Zp ≃+* ℤ_[p],
      (completedEnvelope.ideal p (Ideal.span {(p : Zp)}) 1 h1).map e.toRingHom =
        Ideal.span {(p : ℤ_[p])} ∧
      DividedPowers.IsDPMorphism (completedEnvelope p (TauCeti.PD.canonicalP p Zp h) 1 h1)
        (PadicInt.dividedPowers p) e.toRingHom := by sorry
-- TauCeti.Crystalline.test_completedEnvelope_p2
example :
    (∀ a : ℕ, ∃ u : ℤ_[2]ˣ, (PadicInt.dividedPowers 2).dpow (2 ^ a) (2 : ℤ_[2]) = 2 * (u : ℤ_[2])) ∧
    ¬ Filter.Tendsto (fun n : ℕ => (PadicInt.dividedPowers 2).dpow n (2 : ℤ_[2])) Filter.atTop
      (nhds 0) ∧
    (∀ n : ℕ, 1 ≤ n →
      TauCeti.PD.pdFiltration (PadicInt.dividedPowers 2) n = Ideal.span {(2 : ℤ_[2])}) ∧
    ∀ (p : ℕ) [Fact p.Prime], p ≠ 2 →
      Filter.Tendsto (fun n : ℕ => (PadicInt.dividedPowers p).dpow n (p : ℤ_[p])) Filter.atTop
          (nhds 0) ∧
        (⨅ n : ℕ, TauCeti.PD.pdFiltration (PadicInt.dividedPowers p) n) = ⊥ := by sorry

end CompletedEnvelope

section Fontaine
variable (p : ℕ) [Fact p.Prime]

/-- Integers prime to `p` are units in the Witt vectors of a ring of characteristic `p`. -/
lemma fontaineEnvelope.isUnit_natCast_wittVector (k : Type*) [CommRing k] [CharP k p] (n : ℕ)
    (hn : ¬ p ∣ n) : IsUnit (n : WittVector p k) := by sorry
/-- Integers prime to `p` are units in a `p`-adically complete ring. -/
lemma fontaineEnvelope.isUnit_natCast (R : Type*) [CommRing R]
    [IsAdicComplete (Ideal.span {(p : R)}) R] (n : ℕ) (hn : ¬ p ∣ n) : IsUnit (n : R) := by sorry

variable (R : Type*) [CommRing R] [Fact ¬IsUnit (p : R)] [IsAdicComplete (Ideal.span {(p : R)}) R]

/-- The ring `𝕎(R♭)` of Witt vectors of the tilt. -/
abbrev fontaineEnvelope.Ainf : Type _ := WittVector p (PreTilt R p)
/-- The ideal `ker θ + p𝕎(R♭)`. -/
abbrev fontaineEnvelope.kerIdeal : Ideal (fontaineEnvelope.Ainf p R) :=
  RingHom.ker (WittVector.fontaineTheta R p) ⊔ Ideal.span {(p : fontaineEnvelope.Ainf p R)}
/-- The canonical divided powers on `p𝕎(R♭)`. -/
abbrev fontaineEnvelope.basePowers :
    DividedPowers (Ideal.span {(p : fontaineEnvelope.Ainf p R)}) :=
  TauCeti.PD.canonicalP p (fontaineEnvelope.Ainf p R)
    (fontaineEnvelope.isUnit_natCast_wittVector p (PreTilt R p))
/-- The envelope `D(R)` of `ker θ + p𝕎(R♭)` relative to `(𝕎(R♭), p𝕎(R♭), γ)`. -/
abbrev fontaineEnvelope.pre : Type _ :=
  PDEnvelope (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R)
lemma fontaineEnvelope.p_mem : (p : fontaineEnvelope.pre p R) ^ 1 ∈
    PDEnvelope.ideal (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R) := by sorry

-- CrystallineCohomology:CR.0/fontaine-envelope
abbrev fontaineEnvelope : Type _ := completedEnvelope.ring p (fontaineEnvelope.pre p R)
/-- The divided power ideal `J̄^` of `A_cris(R)`. -/
abbrev fontaineEnvelope.ideal : Ideal (fontaineEnvelope p R) :=
  completedEnvelope.ideal p (D := fontaineEnvelope.pre p R)
    (PDEnvelope.ideal (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R)) 1
    (fontaineEnvelope.p_mem p R)
/-- The divided powers of `A_cris(R)`. -/
def fontaineEnvelope.powers : DividedPowers (fontaineEnvelope.ideal p R) :=
  completedEnvelope p (D := fontaineEnvelope.pre p R)
    (PDEnvelope.powers (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R)) 1
    (fontaineEnvelope.p_mem p R)
/-- The map `𝕎(R♭) → D(R) → A_cris(R)`. -/
def fontaineEnvelope.of : fontaineEnvelope.Ainf p R →+* fontaineEnvelope p R :=
  (completedEnvelope.of p (fontaineEnvelope.pre p R)).comp
    (PDEnvelope.of (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R)).toRingHom

lemma fontaineEnvelope_initial {C : Type*} [CommRing C] [IsAdicComplete (Ideal.span {(p : C)}) C]
    {K : Ideal C} (ε : DividedPowers K) (hpK : (p : C) ∈ K)
    (hε : ∀ n : ℕ, ε.dpow n (p : C) = TauCeti.PD.canonicalPCoeff p C n)
    (f : fontaineEnvelope.Ainf p R →+* C)
    (hf : (RingHom.ker (WittVector.fontaineTheta R p)).map f ≤ K) :
    ∃! g : fontaineEnvelope p R →+* C, g.comp (fontaineEnvelope.of p R) = f ∧
      DividedPowers.IsDPMorphism (fontaineEnvelope.powers p R) ε g := by sorry

/-- The map `θ_cris : A_cris(R) → R`. -/
def fontaineEnvelope_theta : fontaineEnvelope p R →+* R := by sorry
lemma fontaineEnvelope_theta_comp_of :
    (fontaineEnvelope_theta p R).comp (fontaineEnvelope.of p R) =
      WittVector.fontaineTheta R p := by sorry
lemma fontaineEnvelope_theta_isDPMorphism :
    DividedPowers.IsDPMorphism (fontaineEnvelope.powers p R)
      (TauCeti.PD.canonicalP p R (fontaineEnvelope.isUnit_natCast p R))
      (fontaineEnvelope_theta p R) := by sorry
lemma fontaineEnvelope_theta_unique (g : fontaineEnvelope p R →+* R)
    (hg : g.comp (fontaineEnvelope.of p R) = WittVector.fontaineTheta R p)
    (hpd : DividedPowers.IsDPMorphism (fontaineEnvelope.powers p R)
      (TauCeti.PD.canonicalP p R (fontaineEnvelope.isUnit_natCast p R)) g) :
    g = fontaineEnvelope_theta p R := by sorry
lemma fontaineEnvelope_theta_dpow (x : fontaineEnvelope.Ainf p R)
    (hx : x ∈ RingHom.ker (WittVector.fontaineTheta R p)) (n : ℕ) (hn : n ≠ 0) :
    fontaineEnvelope_theta p R
      ((fontaineEnvelope.powers p R).dpow n (fontaineEnvelope.of p R x)) = 0 := by sorry
lemma fontaineEnvelope_theta_surjective
    (hθ : Function.Surjective (WittVector.fontaineTheta R p))
    (htf : ∀ x : R, (p : R) * x = 0 → x = 0) :
    Function.Surjective (fontaineEnvelope_theta p R) ∧
      RingHom.ker (fontaineEnvelope_theta p R) =
        ⨅ n : ℕ, (DividedPowers.SubDPIdeal.span (fontaineEnvelope.powers p R)
          ((fontaineEnvelope.of p R) ''
            (RingHom.ker (WittVector.fontaineTheta R p) : Set (fontaineEnvelope.Ainf p R)))).carrier ⊔
          Ideal.span {(p : fontaineEnvelope p R) ^ n} := by sorry

/-- The subring `𝕎(R♭)[ξⁿ/n! : n ≥ 0]` of `𝕎(R♭)[1/p]`. -/
abbrev fontaineEnvelope.dividedPowerSubalgebra (ξ : fontaineEnvelope.Ainf p R) :
    Subalgebra (fontaineEnvelope.Ainf p R) (Localization.Away (p : fontaineEnvelope.Ainf p R)) :=
  Algebra.adjoin (fontaineEnvelope.Ainf p R)
    {z | ∃ n : ℕ, (n.factorial : Localization.Away (p : fontaineEnvelope.Ainf p R)) * z =
      algebraMap (fontaineEnvelope.Ainf p R) (Localization.Away (p : fontaineEnvelope.Ainf p R))
        (ξ ^ n)}
lemma fontaineEnvelope_identify (ξ : fontaineEnvelope.Ainf p R)
    (hξ : RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ})
    (hreg : ∀ y : PreTilt R p, ξ.coeff 0 * y = 0 → y = 0) :
    (∀ x : fontaineEnvelope p R, (p : fontaineEnvelope p R) * x = 0 → x = 0) ∧
    (∀ x : completedEnvelope.ring p (fontaineEnvelope.dividedPowerSubalgebra p R ξ),
      (p : completedEnvelope.ring p (fontaineEnvelope.dividedPowerSubalgebra p R ξ)) * x = 0 →
        x = 0) ∧
    ∃ e : completedEnvelope.ring p (fontaineEnvelope.dividedPowerSubalgebra p R ξ) ≃+*
        fontaineEnvelope p R,
      (∀ a : fontaineEnvelope.Ainf p R,
        e (completedEnvelope.of p (fontaineEnvelope.dividedPowerSubalgebra p R ξ)
          (algebraMap (fontaineEnvelope.Ainf p R) (fontaineEnvelope.dividedPowerSubalgebra p R ξ) a)) =
          fontaineEnvelope.of p R a) ∧
      ∀ (n : ℕ) (z : fontaineEnvelope.dividedPowerSubalgebra p R ξ),
        (n.factorial : fontaineEnvelope.dividedPowerSubalgebra p R ξ) * z =
          algebraMap (fontaineEnvelope.Ainf p R) (fontaineEnvelope.dividedPowerSubalgebra p R ξ)
            (ξ ^ n) →
        e (completedEnvelope.of p (fontaineEnvelope.dividedPowerSubalgebra p R ξ) z) =
          (fontaineEnvelope.powers p R).dpow n (fontaineEnvelope.of p R ξ) := by sorry

lemma fontaineEnvelope_eq_trivialBase
    (htf : ∀ x : fontaineEnvelope.Ainf p R ⧸ RingHom.ker (WittVector.fontaineTheta R p),
      (p : fontaineEnvelope.Ainf p R ⧸ RingHom.ker (WittVector.fontaineTheta R p)) * x = 0 →
        x = 0) :
    ∃ e : PDEnvelope (dividedPowersBot (fontaineEnvelope.Ainf p R))
        (RingHom.ker (WittVector.fontaineTheta R p)) ≃+* fontaineEnvelope.pre p R,
      (∀ a : fontaineEnvelope.Ainf p R,
        e (PDEnvelope.of (dividedPowersBot (fontaineEnvelope.Ainf p R))
          (RingHom.ker (WittVector.fontaineTheta R p)) a) =
          PDEnvelope.of (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R) a) ∧
      DividedPowers.IsDPMorphism
        (PDEnvelope.powers (dividedPowersBot (fontaineEnvelope.Ainf p R))
          (RingHom.ker (WittVector.fontaineTheta R p)))
        (PDEnvelope.powers (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R))
        e.toRingHom ∧
      PDEnvelope.ideal (fontaineEnvelope.basePowers p R) (fontaineEnvelope.kerIdeal p R) =
        (PDEnvelope.ideal (dividedPowersBot (fontaineEnvelope.Ainf p R))
          (RingHom.ker (WittVector.fontaineTheta R p))).map e.toRingHom ⊔
          Ideal.span {(p : fontaineEnvelope.pre p R)} := by sorry

lemma fontaineEnvelope_wittResidue (k : Type*) [CommRing k] [CharP k p] [PerfectRing k p]
    (π : R →+* k) (ρ : PreTilt R p →+* k) (hρ : ∀ x : PreTilt R p, ρ x = π (PreTilt.untilt x)) :
    (fontaineEnvelope.kerIdeal p R).map (WittVector.map ρ) ≤ Ideal.span {(p : WittVector p k)} ∧
    ∃! g : fontaineEnvelope p R →+* WittVector p k,
      g.comp (fontaineEnvelope.of p R) = WittVector.map ρ ∧
        DividedPowers.IsDPMorphism (fontaineEnvelope.powers p R)
          (TauCeti.PD.canonicalP p (WittVector p k) (fontaineEnvelope.isUnit_natCast_wittVector p k))
          g := by sorry

/-- The map `f♭ : R♭ → R′♭` induced by a ring homomorphism `f : R → R′`: the map induced on
perfections by `R/p → R′/p`. -/
def fontaineEnvelope.tiltMap {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)] {R' : Type*}
    [CommRing R'] [Fact ¬IsUnit (p : R')] (f : R →+* R') : PreTilt R p →+* PreTilt R' p :=
  Perfection.map p (Ideal.quotientMap (Ideal.span {(p : R')}) f
    ((Ideal.span_singleton_le_iff_mem _).2
      (Ideal.mem_comap.2 (by rw [map_natCast]; exact Ideal.mem_span_singleton_self _))))
lemma fontaineEnvelope.untilt_tiltMap {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] (f : R →+* R') (x : PreTilt R p) :
    PreTilt.untilt (fontaineEnvelope.tiltMap p f x) = f (PreTilt.untilt x) := by sorry
lemma fontaineEnvelope.fontaineTheta_comp_map {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] (f : R →+* R') :
    (WittVector.fontaineTheta R' p).comp (WittVector.map (fontaineEnvelope.tiltMap p f)) =
      f.comp (WittVector.fontaineTheta R p) := by sorry
/-- The map `A_cris(f) : A_cris(R) → A_cris(R′)` induced by `f : R → R′`. -/
def fontaineEnvelope_map {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] (f : R →+* R') :
    fontaineEnvelope p R →+* fontaineEnvelope p R' := by sorry
lemma fontaineEnvelope_map_comp_of {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] (f : R →+* R') :
    (fontaineEnvelope_map p f).comp (fontaineEnvelope.of p R) =
      (fontaineEnvelope.of p R').comp (WittVector.map (fontaineEnvelope.tiltMap p f)) := by sorry
lemma fontaineEnvelope_map_isDPMorphism {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] (f : R →+* R') :
    DividedPowers.IsDPMorphism (fontaineEnvelope.powers p R) (fontaineEnvelope.powers p R')
      (fontaineEnvelope_map p f) := by sorry
lemma fontaineEnvelope_map_unique {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] (f : R →+* R')
    (F : fontaineEnvelope p R →+* fontaineEnvelope p R')
    (hF : F.comp (fontaineEnvelope.of p R) =
      (fontaineEnvelope.of p R').comp (WittVector.map (fontaineEnvelope.tiltMap p f)))
    (hpd : DividedPowers.IsDPMorphism (fontaineEnvelope.powers p R) (fontaineEnvelope.powers p R') F) :
    F = fontaineEnvelope_map p f := by sorry
lemma fontaineEnvelope_theta_comp_map {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] (f : R →+* R') :
    (fontaineEnvelope_theta p R').comp (fontaineEnvelope_map p f) =
      f.comp (fontaineEnvelope_theta p R) := by sorry
lemma fontaineEnvelope_map_id :
    fontaineEnvelope_map p (RingHom.id R) = RingHom.id (fontaineEnvelope p R) := by sorry
lemma fontaineEnvelope_map_comp {R : Type*} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {R' : Type*} [CommRing R'] [Fact ¬IsUnit (p : R')]
    [IsAdicComplete (Ideal.span {(p : R')}) R'] {R'' : Type*} [CommRing R'']
    [Fact ¬IsUnit (p : R'')] [IsAdicComplete (Ideal.span {(p : R'')}) R''] (f : R →+* R')
    (g : R' →+* R'') :
    fontaineEnvelope_map p (g.comp f) =
      (fontaineEnvelope_map p g).comp (fontaineEnvelope_map p f) := by sorry

-- TauCeti.Crystalline.test_fontaineEnvelope_theta
example (x : fontaineEnvelope.Ainf p R) (hx : x ∈ RingHom.ker (WittVector.fontaineTheta R p))
    (n : ℕ) (hn : n ≠ 0) :
    fontaineEnvelope_theta p R
        ((fontaineEnvelope.powers p R).dpow n (fontaineEnvelope.of p R x)) = 0 ∧
      fontaineEnvelope_theta p R ((fontaineEnvelope.powers p R).dpow n (p : fontaineEnvelope p R)) =
        TauCeti.PD.canonicalPCoeff p R n := by sorry
-- TauCeti.Crystalline.test_fontaineEnvelope_identity
example [Fact ¬IsUnit (p : ℤ_[p])] [IsAdicComplete (Ideal.span {(p : ℤ_[p])}) ℤ_[p]] :
    Function.Bijective (ZMod.castHom (dvd_refl p) (PreTilt ℤ_[p] p)) ∧
    Function.Bijective (WittVector.fontaineTheta ℤ_[p] p) ∧
    RingHom.ker (WittVector.fontaineTheta ℤ_[p] p) = ⊥ ∧
    Function.Bijective (fontaineEnvelope_theta p ℤ_[p]) ∧
    (fontaineEnvelope.ideal p ℤ_[p]).map (fontaineEnvelope_theta p ℤ_[p]) =
      Ideal.span {(p : ℤ_[p])} ∧
    DividedPowers.IsDPMorphism (fontaineEnvelope.powers p ℤ_[p]) (PadicInt.dividedPowers p)
      (fontaineEnvelope_theta p ℤ_[p]) := by sorry
-- TauCeti.Crystalline.test_fontaineEnvelope_p2
example [Fact ¬IsUnit (p : ℤ_[p])] [IsAdicComplete (Ideal.span {(p : ℤ_[p])}) ℤ_[p]] :
    (p = 2 →
      (∀ a : ℕ,
        (fontaineEnvelope.powers p ℤ_[p]).dpow (2 ^ a) (p : fontaineEnvelope p ℤ_[p]) ∈
            Ideal.span {(p : fontaineEnvelope p ℤ_[p])} ∧
          (fontaineEnvelope.powers p ℤ_[p]).dpow (2 ^ a) (p : fontaineEnvelope p ℤ_[p]) ∉
            Ideal.span {(p : fontaineEnvelope p ℤ_[p]) ^ 2}) ∧
      ∀ n₀ : ℕ, ∃ n : ℕ, n₀ ≤ n ∧
        (fontaineEnvelope.powers p ℤ_[p]).dpow n (p : fontaineEnvelope p ℤ_[p]) ∉
          Ideal.span {(p : fontaineEnvelope p ℤ_[p]) ^ 2}) ∧
    (p ≠ 2 → ∀ N : ℕ, ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
      (fontaineEnvelope.powers p ℤ_[p]).dpow n (p : fontaineEnvelope p ℤ_[p]) ∈
        Ideal.span {(p : fontaineEnvelope p ℤ_[p]) ^ N}) := by sorry
-- TauCeti.Crystalline.test_fontaineEnvelope_mod_p
example (ξ : fontaineEnvelope.Ainf p R)
    (hξ : RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ})
    (hreg : ∀ y : PreTilt R p, ξ.coeff 0 * y = 0 → y = 0) :
    (fontaineEnvelope.of p R ξ) ^ p ∈ Ideal.span {(p : fontaineEnvelope p R)} ∧
    (∀ y : fontaineEnvelope p R, ∃ c : ℕ →₀ fontaineEnvelope.Ainf p R,
      y - c.sum (fun j a => fontaineEnvelope.of p R a *
          (fontaineEnvelope.powers p R).dpow (j * p) (fontaineEnvelope.of p R ξ)) ∈
        Ideal.span {(p : fontaineEnvelope p R)}) ∧
    (∀ c : ℕ →₀ fontaineEnvelope.Ainf p R,
      c.sum (fun j a => fontaineEnvelope.of p R a *
          (fontaineEnvelope.powers p R).dpow (j * p) (fontaineEnvelope.of p R ξ)) ∈
        Ideal.span {(p : fontaineEnvelope p R)} ↔
      ∀ j : ℕ, c j ∈ Ideal.span {(p : fontaineEnvelope.Ainf p R), ξ ^ p}) ∧
    ∀ a : fontaineEnvelope.Ainf p R,
      fontaineEnvelope.of p R a ∈ Ideal.span {(p : fontaineEnvelope p R)} ↔
        a ∈ Ideal.span {(p : fontaineEnvelope.Ainf p R), ξ ^ p} := by sorry

end Fontaine

end TauCeti.Crystalline

/-!
Corrected CR.1 and CR.2 nodes (PD schemes, crystalline sites, structure sheaves, connections,
PD differentials) and three new nodes: signatures for the API items, unit tests and nodes
added to the packet. These are plans, not implementations.
-/

namespace TauCeti.Crystalline
open CategoryTheory
universe u v w

section SquareZeroThickening
variable {A : Type u} [CommRing A] {M : Type v} [AddCommGroup M] [Module A M]
  {N : Type w} [AddCommGroup N] [Module A N]

/- The ring `B = A ⊕ M ⊕ N` of Stacks Lemma 60.3.2. The bilinear map `q` is a parameter of the
type because the multiplication depends on it. -/
structure SqZeroThickening (q : M →ₗ[A] M →ₗ[A] N) where
  fst : A
  snd : M
  thd : N

instance SqZeroThickening.instZero (q : M →ₗ[A] M →ₗ[A] N) : Zero (SqZeroThickening q) :=
  ⟨⟨0, 0, 0⟩⟩
instance SqZeroThickening.instOne (q : M →ₗ[A] M →ₗ[A] N) : One (SqZeroThickening q) :=
  ⟨⟨1, 0, 0⟩⟩
instance SqZeroThickening.instAdd (q : M →ₗ[A] M →ₗ[A] N) : Add (SqZeroThickening q) :=
  ⟨fun x y => ⟨x.fst + y.fst, x.snd + y.snd, x.thd + y.thd⟩⟩
instance SqZeroThickening.instNeg (q : M →ₗ[A] M →ₗ[A] N) : Neg (SqZeroThickening q) :=
  ⟨fun x => ⟨-x.fst, -x.snd, -x.thd⟩⟩
instance SqZeroThickening.instMul (q : M →ₗ[A] M →ₗ[A] N) : Mul (SqZeroThickening q) :=
  ⟨fun x y => ⟨x.fst * y.fst, x.fst • y.snd + y.fst • x.snd,
    x.fst • y.thd + y.fst • x.thd + q x.snd y.snd + q y.snd x.snd⟩⟩
instance SqZeroThickening.commRing (q : M →ₗ[A] M →ₗ[A] N) : CommRing (SqZeroThickening q) where
  add_assoc := by sorry
  zero_add := by sorry
  add_zero := by sorry
  add_comm := by sorry
  neg_add_cancel := by sorry
  left_distrib := by sorry
  right_distrib := by sorry
  zero_mul := by sorry
  mul_zero := by sorry
  mul_assoc := by sorry
  one_mul := by sorry
  mul_one := by sorry
  mul_comm := by sorry
  nsmul := nsmulRec
  zsmul := zsmulRec

/- The structure map `A → B`, `x ↦ (x,0,0)`, and the projection `B → A`. -/
def SqZeroThickening.inl (q : M →ₗ[A] M →ₗ[A] N) : A →+* SqZeroThickening q where
  toFun x := ⟨x, 0, 0⟩
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry
def SqZeroThickening.fstHom (q : M →ₗ[A] M →ₗ[A] N) : SqZeroThickening q →+* A where
  toFun x := x.fst
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry
/- The ideal `J = I ⊕ M ⊕ N`. -/
def SqZeroThickening.ideal (I : Ideal A) (q : M →ₗ[A] M →ₗ[A] N) : Ideal (SqZeroThickening q) :=
  I.comap (SqZeroThickening.fstHom q)
lemma SqZeroThickening.mem_ideal (I : Ideal A) (q : M →ₗ[A] M →ₗ[A] N) (b : SqZeroThickening q) :
    b ∈ SqZeroThickening.ideal I q ↔ b.fst ∈ I := by sorry

-- CrystallineCohomology:CR.0/pd-square-zero-thickening
theorem pdSquareZeroThickening {I : Ideal A} (γ : DividedPowers I) (q : M →ₗ[A] M →ₗ[A] N) :
    ∃ δ : DividedPowers (SqZeroThickening.ideal I q),
      (∀ (n : ℕ) (x : A) (z : M) (w : N), n ≠ 0 → x ∈ I →
        δ.dpow n ⟨x, z, w⟩ = ⟨γ.dpow n x, γ.dpow (n - 1) x • z,
          γ.dpow (n - 1) x • w + if n = 1 then 0 else γ.dpow (n - 2) x • q z z⟩) ∧
      γ.IsDPMorphism δ (SqZeroThickening.inl q) := by sorry
-- Acceptance (CR.0/pd-square-zero-thickening): A = ℤ, I = 0, M = N = ℤ, q(z,z') = zz'.
example (δ : DividedPowers (SqZeroThickening.ideal (⊥ : Ideal ℤ) (LinearMap.mul ℤ ℤ)))
    (hδ : ∀ (n : ℕ) (z w : ℤ), n ≠ 0 →
      δ.dpow n (⟨0, z, w⟩ : SqZeroThickening (LinearMap.mul ℤ ℤ)) =
        ⟨0, if n = 1 then z else 0, if n = 1 then w else if n = 2 then z * z else 0⟩) :
    (⟨0, 1, 0⟩ : SqZeroThickening (LinearMap.mul ℤ ℤ)) ^ 2 = ⟨0, 0, 2⟩ ∧
    (⟨0, 1, 0⟩ : SqZeroThickening (LinearMap.mul ℤ ℤ)) ^ 3 = 0 ∧
    δ.dpow 2 (⟨0, 1, 0⟩ : SqZeroThickening (LinearMap.mul ℤ ℤ)) = ⟨0, 0, 1⟩ ∧
    2 * δ.dpow 2 (⟨0, 1, 0⟩ : SqZeroThickening (LinearMap.mul ℤ ℤ)) =
      (⟨0, 1, 0⟩ : SqZeroThickening (LinearMap.mul ℤ ℤ)) ^ 2 := by sorry

end SquareZeroThickening

section PDRingPushout
open TensorProduct

/- The category of PD rings `(A, I, γ)` with the PD homomorphisms (Stacks, Divided Power
Algebra, §23.3). -/
structure PDRing where
  carrier : Type u
  [commRing : CommRing carrier]
  ideal : Ideal carrier
  powers : DividedPowers ideal
attribute [instance] PDRing.commRing

structure PDRing.Hom (R S : PDRing.{u}) where
  toRingHom : R.carrier →+* S.carrier
  isDPMorphism : R.powers.IsDPMorphism S.powers toRingHom

instance PDRing.category : Category.{u} PDRing.{u} where
  Hom R S := PDRing.Hom R S
  id R := ⟨RingHom.id R.carrier, by sorry⟩
  comp f g := ⟨g.toRingHom.comp f.toRingHom, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

def PDRing.of {A : Type u} [CommRing A] {I : Ideal A} (γ : DividedPowers I) : PDRing.{u} :=
  { carrier := A, ideal := I, powers := γ }
def PDRing.ofHom {A B : Type u} [CommRing A] [CommRing B] {I : Ideal A} {J : Ideal B}
    {γ : DividedPowers I} {δ : DividedPowers J} (f : A →+* B) (hf : γ.IsDPMorphism δ f) :
    PDRing.of γ ⟶ PDRing.of δ := PDRing.Hom.mk f hf

/- First sentence of CR.0/pd-ring-pushout (Stacks, Divided Power Algebra, Lemma 23.3.4). -/
lemma PDRing.hasColimits : Limits.HasColimits PDRing.{u} := by sorry

variable {A B B' B'' : Type u} [CommRing A] [CommRing B] [CommRing B'] [CommRing B'']
  [Algebra A B] [Algebra A B'] [Algebra A B''] [Algebra B B''] [Algebra B' B'']
  [IsScalarTower A B B''] [IsScalarTower A B' B'']
  {I : Ideal A} {J : Ideal B} {J' : Ideal B'} {J'' : Ideal B''}

-- CrystallineCohomology:CR.0/pd-ring-pushout
theorem pdRingPushout (γ : DividedPowers I) (δ : DividedPowers J) (δ' : DividedPowers J')
    (δ'' : DividedPowers J'')
    (h : γ.IsDPMorphism δ (algebraMap A B)) (h' : γ.IsDPMorphism δ' (algebraMap A B'))
    (hi : δ.IsDPMorphism δ'' (algebraMap B B'')) (hi' : δ'.IsDPMorphism δ'' (algebraMap B' B''))
    (hpush : IsPushout (PDRing.ofHom _ h) (PDRing.ofHom _ h') (PDRing.ofHom _ hi)
      (PDRing.ofHom _ hi')) :
    letI : Algebra (A ⧸ I) (B ⧸ J) :=
      Ideal.Quotient.algebraQuotientOfLEComap (Ideal.map_le_iff_le_comap.mp h.ideal_comp)
    letI : Algebra (A ⧸ I) (B' ⧸ J') :=
      Ideal.Quotient.algebraQuotientOfLEComap (Ideal.map_le_iff_le_comap.mp h'.ideal_comp)
    (∃ e : (B'' ⧸ J'') ≃+* (B ⧸ J) ⊗[A ⧸ I] (B' ⧸ J'),
      (∀ b : B, e (Ideal.Quotient.mk J'' (algebraMap B B'' b)) = Ideal.Quotient.mk J b ⊗ₜ 1) ∧
      ∀ b' : B', e (Ideal.Quotient.mk J'' (algebraMap B' B'' b')) = 1 ⊗ₜ Ideal.Quotient.mk J' b') ∧
    Function.Surjective (Algebra.TensorProduct.productMap
      (IsScalarTower.toAlgHom A B B'') (IsScalarTower.toAlgHom A B' B'')) ∧
    ((J.map (Algebra.TensorProduct.includeLeft : B →ₐ[A] B ⊗[A] B')) ⊔
      (J'.map (Algebra.TensorProduct.includeRight : B' →ₐ[A] B ⊗[A] B'))).map
        (Algebra.TensorProduct.productMap
          (IsScalarTower.toAlgHom A B B'') (IsScalarTower.toAlgHom A B' B'')) = J'' := by sorry

-- Acceptance (CR.0/pd-ring-pushout, Remark 23.3.6): the pushout of the two PD structures on
-- (2) ⊂ ℤ/4 over (ℤ,0) is (F₂,0), whereas ℤ/4 ⊗ ℤ/4 = ℤ/4.
example (δ δ' : DividedPowers (Ideal.span {(2 : ZMod 4)})) (hδ : δ.dpow 2 2 = 2)
    (hδ' : δ'.dpow 2 2 = 0) :
    ∃ (h : (dividedPowersBot ℤ).IsDPMorphism δ (Int.castRingHom (ZMod 4)))
      (h' : (dividedPowersBot ℤ).IsDPMorphism δ' (Int.castRingHom (ZMod 4)))
      (hi : δ.IsDPMorphism (dividedPowersBot (ZMod 2))
        (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)))
      (hi' : δ'.IsDPMorphism (dividedPowersBot (ZMod 2))
        (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2))),
      IsPushout (PDRing.ofHom _ h) (PDRing.ofHom _ h') (PDRing.ofHom _ hi) (PDRing.ofHom _ hi') ∧
      Nonempty (ZMod 4 ⊗[ℤ] ZMod 4 ≃+* ZMod 4) := by sorry

end PDRingPushout

end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory AlgebraicGeometry Limits Opposite
universe u

section PDSchemeCategory

/- The category of PD schemes, on the existing morphisms, identities and composites. -/
instance PDScheme.category : Category.{u} PDScheme.{u} where
  Hom S T := PDScheme.Hom S T
  id S := PDScheme.Hom.id S
  comp f g := PDScheme.Hom.comp f g
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

/- A morphism of PD schemes `(T,J,δ) → (S,I,γ)` maps `T₀ = V(J)` into `S₀ = V(I)`. -/
def PDScheme.Hom.onSubscheme {T S : PDScheme.{u}} (f : PDScheme.Hom T S) :
    T.ideal.subscheme ⟶ S.ideal.subscheme := by sorry
lemma PDScheme.Hom.onSubscheme_ι {T S : PDScheme.{u}} (f : PDScheme.Hom T S) :
    f.onSubscheme ≫ S.ideal.subschemeι = T.ideal.subschemeι ≫ f.hom := by sorry

/- API of CrystallineCohomology:CR.1/pd-scheme (Stacks Lemma 60.7.4). The last conjunct says
that `T″₀ → T₀ ×_{S₀} T′₀` is an isomorphism. -/
lemma PDScheme.fiberProduct {S T T' : PDScheme.{u}} (f : T ⟶ S) (f' : T' ⟶ S) :
    ∃ (T'' : PDScheme.{u}) (g : T'' ⟶ T) (g' : T'' ⟶ T') (w : g.hom ≫ f.hom = g'.hom ≫ f'.hom),
      IsPullback g g' f f' ∧
      IsClosedImmersion (pullback.lift g.hom g'.hom w) ∧
      IsPullback g.onSubscheme g'.onSubscheme f.onSubscheme f'.onSubscheme := by sorry

/- `p` is locally nilpotent on a scheme; a scheme lies over `Spec ℤ_(p)`. -/
def IsPLocallyNilpotent (X : Scheme.{u}) (p : ℕ) : Prop :=
    ∀ U : X.affineOpens, ∃ n : ℕ, 0 < n ∧ (p : Γ(X,U))^n = 0
def IsOverZLocalization (X : Scheme.{u}) (p : ℕ) : Prop :=
    ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : Γ(X,⊤))

/- API of CrystallineCohomology:CR.1/pd-scheme. `U = V(J) → T` is a closed immersion, so it is
a thickening exactly when it is surjective on points. -/
lemma PDScheme.isThickening_iff (p : ℕ) [Fact p.Prime] (T : PDScheme.{u})
    (hT : IsOverZLocalization T.scheme p) (hU : IsPLocallyNilpotent T.ideal.subscheme p) :
    Function.Surjective T.ideal.subschemeι ↔ T.PLocallyNilpotent p := by sorry

end PDSchemeCategory

section Site
variable (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme)

/- Stacks Situation 60.7.5 for the data `(p, S, X, xS)` of `CrisSite`: `p` is a prime, `S` lies
over `ℤ_(p)`, `X → S` factors through `S₀ = V(I)`, and `p` is locally nilpotent on `X`. -/
structure CrisSituation : Prop where
  prime : p.Prime
  overZLocalization : IsOverZLocalization S.scheme p
  factors : ∃ x₀ : X ⟶ S.ideal.subscheme, x₀ ≫ S.ideal.subschemeι = xS
  nilpotent : IsPLocallyNilpotent X p

/- The functor `(U,T,δ) ↦ U` from `CRIS(X/S)` to schemes over `X` (Stacks (60.8.1.1)), and
from `Cris(X/S)` to the open subsets of `X`. -/
def CrisSite.toOver : CrisSite p S X xS ⥤ Over X where
  obj A := Over.mk A.toX
  map f := Over.homMk f.onU f.toX_comm
  map_id := by sorry
  map_comp := by sorry
def CrisSite.toOpens : SmallCrisSite p S X xS ⥤ X.Opens where
  obj A := haveI : IsOpenImmersion A.obj.toX := A.property; A.obj.toX.opensRange
  map f := homOfLE (by sorry)
  map_id := by sorry
  map_comp := by sorry

variable {p S X xS}

/- API of CrystallineCohomology:CR.1/crystalline-site (Stacks Lemmas 60.8.2 and 60.9.2). -/
lemma CrisSite.finiteLimits (h : CrisSituation p S X xS)
    (J : Type) [SmallCategory J] [FinCategory J] [Nonempty J] :
    HasLimitsOfShape J (CrisSite p S X xS) ∧ HasLimitsOfShape J (SmallCrisSite p S X xS) ∧
    PreservesLimitsOfShape J (CrisSite.toOver p S X xS) ∧
    PreservesLimitsOfShape J (CrisSite.small_inclusion p S X xS) := by sorry

/- API of CrystallineCohomology:CR.1/crystalline-site (Stacks Lemma 60.8.3). The hypothesis
`hU` says `U₂ = T₂ ×_T U`. -/
lemma CrisSite.flat_baseChange (h : CrisSituation p S X xS) {A A₁ A₂ A₃ : CrisSite p S X xS}
    (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A) (g₁ : A₃ ⟶ A₁) (g₂ : A₃ ⟶ A₂) (sq : IsPullback g₁ g₂ f₁ f₂)
    (hflat : Flat f₂.onT.hom)
    (hU : IsPullback f₂.onU A₂.thickening.immersion A.thickening.immersion f₂.onT.hom) :
    IsPullback g₁.onT.hom g₂.onT.hom f₁.onT.hom f₂.onT.hom := by sorry

/- API of CrystallineCohomology:CR.1/crystalline-site: `U ↦ (U,U,∅)`, left adjoint to
`(U,T,δ) ↦ U`, on the big and on the small site. -/
def CrisSite.trivialThickening (h : CrisSituation p S X xS) : Over X ⥤ CrisSite p S X xS := by
  sorry
def CrisSite.trivialThickeningAdj (h : CrisSituation p S X xS) :
    CrisSite.trivialThickening h ⊣ CrisSite.toOver p S X xS := by sorry
lemma CrisSite.trivialThickening_immersion (h : CrisSituation p S X xS) (U : Over X) :
    IsIso ((CrisSite.trivialThickening h).obj U).thickening.immersion := by sorry
lemma CrisSite.trivialThickening_unit (h : CrisSituation p S X xS) :
    IsIso (CrisSite.trivialThickeningAdj h).unit := by sorry
def CrisSite.trivialThickeningSmall (h : CrisSituation p S X xS) :
    X.Opens ⥤ SmallCrisSite p S X xS := by sorry
def CrisSite.trivialThickeningSmallAdj (h : CrisSituation p S X xS) :
    CrisSite.trivialThickeningSmall h ⊣ CrisSite.toOpens p S X xS := by sorry
lemma CrisSite.trivialThickeningSmall_immersion (h : CrisSituation p S X xS) (U : X.Opens) :
    IsIso ((CrisSite.trivialThickeningSmall h).obj U).obj.thickening.immersion := by sorry
lemma CrisSite.trivialThickeningSmall_toOpens (h : CrisSituation p S X xS) (U : X.Opens) :
    (CrisSite.toOpens p S X xS).obj ((CrisSite.trivialThickeningSmall h).obj U) = U := by sorry

end Site

-- TauCeti.Crystalline.test_crisSite_Wn
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (n : ℕ) (hn : n ≠ 0)
    (hW : ∀ m : ℕ, ¬ p ∣ m → IsUnit (m : TruncatedWittVector p n k))
    (π : TruncatedWittVector p n k →+* k)
    (hπ : ∀ x, π x = x.coeff ⟨0, Nat.pos_of_ne_zero hn⟩)
    (S : PDScheme.{u})
    (hS : S = PDScheme.affine (TruncatedWittVector p n k)
      (Ideal.span {(p : TruncatedWittVector p n k)}) (TauCeti.PD.canonicalP p _ hW))
    (xS : Spec (CommRingCat.of k) ⟶ S.scheme)
    (hxS : xS = Spec.map (CommRingCat.ofHom π) ≫
      eqToHom (by rw [hS, PDScheme.affine_scheme])) :
    ∃ (hc : IsClosedImmersion xS) (hs : Function.Surjective xS) (hk : xS.ker = S.ideal)
      (hp : S.PLocallyNilpotent p)
      (hcomm : xS ≫ (PDScheme.Hom.id S).hom = 𝟙 (Spec (CommRingCat.of k)) ≫ xS)
      (hsmall : IsOpenImmersion (𝟙 (Spec (CommRingCat.of k)))),
      Nonempty (IsTerminal
        (⟨CrisSite.object ⟨Spec (CommRingCat.of k), S, xS, hc, hs, hk, hp⟩ (𝟙 _)
            (PDScheme.Hom.id S) hcomm, hsmall⟩ :
          SmallCrisSite p S (Spec (CommRingCat.of k)) xS)) := by sorry

-- TauCeti.Crystalline.test_crisSite_product_Z4
example [(Ideal.span {(2 : ℤ)}).IsPrime] (δ δ' : DividedPowers (Ideal.span {(2 : ZMod 4)}))
    (hδ : δ.dpow 2 2 = 2) (hδ' : δ'.dpow 2 2 = 0)
    (S : PDScheme.{0})
    (hS : S = PDScheme.affine (Localization.AtPrime (Ideal.span {(2 : ℤ)})) ⊥
      (dividedPowersBot _))
    (xS : Spec (CommRingCat.of (ZMod 2)) ⟶ S.scheme)
    (A A' P : SmallCrisSite 2 S (Spec (CommRingCat.of (ZMod 2))) xS)
    (hA : A.obj.thickening.T = PDScheme.affine (ZMod 4) (Ideal.span {2}) δ)
    (hAX : IsIso A.obj.toX)
    (hA' : A'.obj.thickening.T = PDScheme.affine (ZMod 4) (Ideal.span {2}) δ')
    (hA'X : IsIso A'.obj.toX)
    (hP : IsIso P.obj.thickening.immersion) (hPX : IsIso P.obj.toX) :
    ∃ (π : P ⟶ A) (π' : P ⟶ A'), Nonempty (IsLimit (BinaryFan.mk π π')) := by sorry

end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory AlgebraicGeometry Limits Opposite
universe u

section SiteMorphisms
variable {p : ℕ} {S S' S'' : PDScheme.{u}} {X Y Z : Scheme.{u}}
  {xS : X ⟶ S.scheme} {yS : Y ⟶ S'.scheme} {zS : Z ⟶ S''.scheme}

/- The functor of big sites `CRIS(X/S) → CRIS(Y/S′)`, `(U,T,δ) ↦ (U,T,δ)` with `U → X → Y` and
`T → S → S′`, attached to a commutative square (Stacks Remark 60.8.5). It is continuous and
cocontinuous; the morphism of topoi `f_CRIS` is the one it defines. -/
-- CrystallineCohomology:CR.1/site-morphisms
def crisSiteMap (f : X ⟶ Y) (s : PDScheme.Hom S S') (w : xS ≫ s.hom = f ≫ yS) :
    CrisSite p S X xS ⥤ CrisSite p S' Y yS where
  obj A := ⟨A.thickening, A.toX ≫ f, A.toS.comp s, by sorry⟩
  map φ := ⟨φ.onU, φ.onT, φ.immersion_comm, by sorry, by sorry⟩
  map_id := by sorry
  map_comp := by sorry
lemma crisSiteMap_isContinuous (f : X ⟶ Y) (s : PDScheme.Hom S S') (w : xS ≫ s.hom = f ≫ yS) :
    Functor.IsContinuous (crisSiteMap (p := p) f s w)
      (CrisSite.topology p S X xS) (CrisSite.topology p S' Y yS) := by sorry
lemma crisSiteMap_isCocontinuous (f : X ⟶ Y) (s : PDScheme.Hom S S')
    (w : xS ≫ s.hom = f ≫ yS) :
    Functor.IsCocontinuous (crisSiteMap (p := p) f s w)
      (CrisSite.topology p S X xS) (CrisSite.topology p S' Y yS) := by sorry
/- API of CrystallineCohomology:CR.1/site-morphisms, for the functors of sites that define
`f_CRIS`, `g_CRIS` and `(g∘f)_CRIS`. -/
lemma crisSiteMap_comp (f : X ⟶ Y) (g : Y ⟶ Z) (s : PDScheme.Hom S S') (s' : PDScheme.Hom S' S'')
    (w : xS ≫ s.hom = f ≫ yS) (w' : yS ≫ s'.hom = g ≫ zS)
    (w'' : xS ≫ (s.comp s').hom = (f ≫ g) ≫ zS) :
    crisSiteMap (p := p) f s w ⋙ crisSiteMap g s' w' = crisSiteMap (f ≫ g) (s.comp s') w'' := by
  sorry
lemma crisSiteMap_id (w : xS ≫ (PDScheme.Hom.id S).hom = 𝟙 X ≫ xS) :
    crisSiteMap (p := p) (𝟙 X) (PDScheme.Hom.id S) w = 𝟭 (CrisSite p S X xS) := by sorry
-- TauCeti.Crystalline.test_crisMap_identity
example (w : xS ≫ (PDScheme.Hom.id S).hom = 𝟙 X ≫ xS) :
    crisSiteMap (p := p) (𝟙 X) (PDScheme.Hom.id S) w = 𝟭 (CrisSite p S X xS) := by sorry
-- TauCeti.Crystalline.test_crisMap_open
example {X' : Scheme.{u}} (j : X' ⟶ X) [IsOpenImmersion j]
    (w : (j ≫ xS) ≫ (PDScheme.Hom.id S).hom = j ≫ xS) :
    ∃ F : SmallCrisSite p S X' (j ≫ xS) ⥤ SmallCrisSite p S X xS,
      F ⋙ CrisSite.small_inclusion p S X xS =
        CrisSite.small_inclusion p S X' (j ≫ xS) ⋙ crisSiteMap j (PDScheme.Hom.id S) w ∧
      F.Full ∧ F.Faithful ∧
      (∀ A : SmallCrisSite p S X xS,
        F.essImage A ↔ ∃ g : A.obj.thickening.U ⟶ X', g ≫ j = A.obj.toX) ∧
      Functor.IsContinuous F (CrisSite.smallTopology p S X' (j ≫ xS))
        (CrisSite.smallTopology p S X xS) ∧
      Functor.IsCocontinuous F (CrisSite.smallTopology p S X' (j ≫ xS))
        (CrisSite.smallTopology p S X xS) ∧
      F ⋙ CrisSite.toOpens p S X xS = CrisSite.toOpens p S X' (j ≫ xS) ⋙ j.opensFunctor := by
  sorry

/- The functors of sites behind `i`, `π` and `u_{X/S}` of CR.1/site-morphisms: the inclusion
`Cris(X/S) → CRIS(X/S)` and the projection `Cris(X/S) → X_Zar`, `(U,T,δ) ↦ U`, are continuous
and cocontinuous (Stacks Lemma 60.9.2 and Remark 60.9.4). -/
lemma CrisSite.small_inclusion_isContinuous :
    Functor.IsContinuous (CrisSite.small_inclusion p S X xS)
      (CrisSite.smallTopology p S X xS) (CrisSite.topology p S X xS) := by sorry
lemma CrisSite.small_inclusion_isCocontinuous :
    Functor.IsCocontinuous (CrisSite.small_inclusion p S X xS)
      (CrisSite.smallTopology p S X xS) (CrisSite.topology p S X xS) := by sorry
lemma CrisSite.toOpens_isContinuous :
    Functor.IsContinuous (CrisSite.toOpens p S X xS)
      (CrisSite.smallTopology p S X xS) (Opens.grothendieckTopology X) := by sorry
lemma CrisSite.toOpens_isCocontinuous :
    Functor.IsCocontinuous (CrisSite.toOpens p S X xS)
      (CrisSite.smallTopology p S X xS) (Opens.grothendieckTopology X) := by sorry

end SiteMorphisms

section StructureSheaves
variable (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u}) (xS : X ⟶ S.scheme)

/- For an object `(U,T,δ)` and `W ⊂ T` open, the object `(U∩W, W, δ|_W)` with its open morphism
to `(U,T,δ)`; the two lemmas determine it up to unique isomorphism over `(U,T,δ)`. -/
def CrisSite.restrictOpen (A : CrisSite p S X xS) :
    A.thickening.T.scheme.Opens ⥤ Over A := by sorry
lemma CrisSite.restrictOpen_isOpen (A : CrisSite p S X xS) (W : A.thickening.T.scheme.Opens) :
    CrisSite.IsOpen ((CrisSite.restrictOpen p S X xS A).obj W).hom := by sorry
lemma CrisSite.restrictOpen_range (A : CrisSite p S X xS) (W : A.thickening.T.scheme.Opens) :
    Set.range ⇑((CrisSite.restrictOpen p S X xS A).obj W).hom.onT.hom =
      (W : Set A.thickening.T.scheme) := by sorry

variable {C : Type*} [Category C]

/- API of CrystallineCohomology:CR.1/structure-sheaves: the Zariski sheaf `F_T` on `T`, with
`F_T(W) = F(U∩W, W, δ|_W)`. -/
def crisRestrict (F : Sheaf (CrisSite.topology p S X xS) C) (A : CrisSite p S X xS) :
    TopCat.Sheaf C A.thickening.T.scheme :=
  ⟨(CrisSite.restrictOpen p S X xS A ⋙ Over.forget A).op ⋙ F.obj, by sorry⟩
lemma crisRestrict_obj (F : Sheaf (CrisSite.topology p S X xS) C) (A : CrisSite p S X xS)
    (W : A.thickening.T.scheme.Opens) :
    (crisRestrict p S X xS F A).obj.obj (op W) =
      F.obj.obj (op ((CrisSite.restrictOpen p S X xS A).obj W).left) := rfl
/- `(O_crys)_T = O_T`: the map `Γ(W,O_T) → Γ(W,O_W) = O_crys(U∩W, W, δ|_W)` is an isomorphism of
presheaves of rings on `T`. -/
def crisRestrictStructureMap (A : CrisSite p S X xS) :
    A.thickening.T.scheme.presheaf ⟶
      (crisRestrict p S X xS (crisStructure p S X xS) A).obj where
  app W := (((CrisSite.restrictOpen p S X xS A).obj W.unop).hom.onT.hom).appLE W.unop ⊤ (by sorry)
  naturality := by sorry
lemma crisRestrict_structure (A : CrisSite p S X xS) :
    IsIso (crisRestrictStructureMap p S X xS A) := by sorry

/- API of CrystallineCohomology:CR.1/structure-sheaves: the comparison maps on sections. For
`f : (U,T,δ) → (U′,T′,δ′)` and opens `W ⊂ T`, `W′ ⊂ T′` with `f(W) ⊂ W′`, the map
`F_T′(W′) → F_T(W)`; for `W = f⁻¹W′` these are the components of `c_f : F_T′ → f_*F_T`. -/
def crisComparison (F : Sheaf (CrisSite.topology p S X xS) C) {A B : CrisSite p S X xS}
    (f : A ⟶ B) (W : A.thickening.T.scheme.Opens) (W' : B.thickening.T.scheme.Opens)
    (h : W ≤ f.onT.hom ⁻¹ᵁ W') :
    (crisRestrict p S X xS F B).obj.obj (op W') ⟶ (crisRestrict p S X xS F A).obj.obj (op W) := by
  sorry
lemma crisComparison_eq (F : Sheaf (CrisSite.topology p S X xS) C) {A B : CrisSite p S X xS}
    (f : A ⟶ B) (W : A.thickening.T.scheme.Opens) (W' : B.thickening.T.scheme.Opens)
    (h : W ≤ f.onT.hom ⁻¹ᵁ W')
    (φ : ((CrisSite.restrictOpen p S X xS A).obj W).left ⟶
      ((CrisSite.restrictOpen p S X xS B).obj W').left)
    (hφ : φ ≫ ((CrisSite.restrictOpen p S X xS B).obj W').hom =
      ((CrisSite.restrictOpen p S X xS A).obj W).hom ≫ f) :
    crisComparison p S X xS F f W W' h = F.obj.map φ.op := by sorry
lemma crisComparison_restrict (F : Sheaf (CrisSite.topology p S X xS) C) (A : CrisSite p S X xS)
    (W W' : A.thickening.T.scheme.Opens) (h : W ≤ (𝟙 A : A ⟶ A).onT.hom ⁻¹ᵁ W') (h' : W ≤ W') :
    crisComparison p S X xS F (𝟙 A) W W' h =
      (crisRestrict p S X xS F A).obj.map (homOfLE h').op := by sorry
lemma crisComparison_comp (F : Sheaf (CrisSite.topology p S X xS) C) {A B D : CrisSite p S X xS}
    (f : A ⟶ B) (g : B ⟶ D) (W : A.thickening.T.scheme.Opens) (W' : B.thickening.T.scheme.Opens)
    (W'' : D.thickening.T.scheme.Opens) (h : W ≤ f.onT.hom ⁻¹ᵁ W') (h' : W' ≤ g.onT.hom ⁻¹ᵁ W'')
    (h'' : W ≤ (f ≫ g).onT.hom ⁻¹ᵁ W'') :
    crisComparison p S X xS F (f ≫ g) W W'' h'' =
      crisComparison p S X xS F g W' W'' h' ≫ crisComparison p S X xS F f W W' h := by sorry
lemma crisComparison_isIso (F : Sheaf (CrisSite.topology p S X xS) C) {A B : CrisSite p S X xS}
    (f : A ⟶ B) (hf : CrisSite.IsOpen f) (W : A.thickening.T.scheme.Opens)
    (W' : B.thickening.T.scheme.Opens) (h : W ≤ f.onT.hom ⁻¹ᵁ W')
    (hW : ⇑f.onT.hom '' (W : Set A.thickening.T.scheme) = (W' : Set B.thickening.T.scheme)) :
    IsIso (crisComparison p S X xS F f W W' h) := by sorry

/- API of CrystallineCohomology:CR.1/structure-sheaves (Stacks §60.10): a sheaf on the site from
Zariski sheaves `G_T` and comparison maps. -/
lemma crisSheaf_ofRestrictions
    (G : ∀ A : CrisSite p S X xS, TopCat.Sheaf (Type u) A.thickening.T.scheme)
    (c : ∀ {A B : CrisSite p S X xS} (f : A ⟶ B) (W : A.thickening.T.scheme.Opens)
      (W' : B.thickening.T.scheme.Opens), W ≤ f.onT.hom ⁻¹ᵁ W' →
      ((G B).obj.obj (op W') ⟶ (G A).obj.obj (op W)))
    (c_id : ∀ (A : CrisSite p S X xS) (W W' : A.thickening.T.scheme.Opens)
      (h : W ≤ (𝟙 A : A ⟶ A).onT.hom ⁻¹ᵁ W') (h' : W ≤ W'),
      c (𝟙 A) W W' h = (G A).obj.map (homOfLE h').op)
    (c_comp : ∀ {A B D : CrisSite p S X xS} (f : A ⟶ B) (g : B ⟶ D)
      (W : A.thickening.T.scheme.Opens) (W' : B.thickening.T.scheme.Opens)
      (W'' : D.thickening.T.scheme.Opens) (h : W ≤ f.onT.hom ⁻¹ᵁ W')
      (h' : W' ≤ g.onT.hom ⁻¹ᵁ W'') (h'' : W ≤ (f ≫ g).onT.hom ⁻¹ᵁ W''),
      c (f ≫ g) W W'' h'' = c g W' W'' h' ≫ c f W W' h)
    (c_iso : ∀ {A B : CrisSite p S X xS} (f : A ⟶ B), CrisSite.IsOpen f →
      ∀ (W : A.thickening.T.scheme.Opens) (W' : B.thickening.T.scheme.Opens)
        (h : W ≤ f.onT.hom ⁻¹ᵁ W'),
        ⇑f.onT.hom '' (W : Set A.thickening.T.scheme) = (W' : Set B.thickening.T.scheme) →
        IsIso (c f W W' h)) :
    ∃ (F : Sheaf (CrisSite.topology p S X xS) (Type u))
      (e : ∀ A : CrisSite p S X xS, crisRestrict p S X xS F A ≅ G A),
      ∀ {A B : CrisSite p S X xS} (f : A ⟶ B) (W : A.thickening.T.scheme.Opens)
        (W' : B.thickening.T.scheme.Opens) (h : W ≤ f.onT.hom ⁻¹ᵁ W'),
        crisComparison p S X xS F f W W' h ≫ (e A).hom.hom.app (op W) =
          (e B).hom.hom.app (op W') ≫ c f W W' h := by sorry

/- API of CrystallineCohomology:CR.1/structure-sheaves: the sections over `T` of the PD power
`J_crys^{[r]}`: the sections of `O_T` whose restriction to every affine open `W` lies in the
`r`-th PD power of the PD ideal of `W` (CR.0/pd-filtration). -/
def crisPDideal_pdPower (A : CrisSite p S X xS) (r : ℕ) : Ideal Γ(A.thickening.T.scheme,⊤) :=
    ⨅ W : A.thickening.T.scheme.affineOpens,
      (TauCeti.PD.pdFiltration (A.thickening.T.powers W) r).comap
        (A.thickening.T.scheme.presheaf.map (homOfLE (le_top : W.1 ≤ ⊤)).op).hom
lemma crisPDideal_pdPower_zero (A : CrisSite p S X xS) :
    crisPDideal_pdPower p S X xS A 0 = ⊤ := by sorry
lemma crisPDideal_pdPower_one (A : CrisSite p S X xS) :
    crisPDideal_pdPower p S X xS A 1 = crisPDideal p S X xS A := by sorry
lemma crisPDideal_pdPower_affine (A : CrisSite p S X xS) [IsAffine A.thickening.T.scheme]
    (r : ℕ) :
    crisPDideal_pdPower p S X xS A r =
      TauCeti.PD.pdFiltration (crisPDidealPowers p S X xS A) r := by sorry
lemma crisPDideal_pdPower_restrict {A B : CrisSite p S X xS} (f : A ⟶ B) (r : ℕ) :
    (crisPDideal_pdPower p S X xS B r).map f.onT.hom.appTop.hom ≤
      crisPDideal_pdPower p S X xS A r := by sorry

end StructureSheaves

end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory TensorProduct
universe u

section DifferentialAPI
variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]
variable (J : Ideal B) (δ : DividedPowers J)

/- API of CrystallineCohomology:CR.1/pd-differentials (Stacks Lemma 60.6.2 (1) and (2)). `B[x]`
carries the divided powers extended along the flat map `B → B[x]`; `B⟨x⟩` is `pdPolynomial`
on one variable with its PD ideal `J·B⟨x⟩ + B⟨x⟩₊`. -/
lemma pdDifferentials_adjoin :
    (∃ e : pdDifferentials A (Polynomial B) (J.map (algebraMap B (Polynomial B)))
          (TauCeti.PD.extendFlat (B := Polynomial B) δ) ≃ₗ[Polynomial B]
        (Polynomial B ⊗[B] pdDifferentials A B J δ) × Polynomial B,
      (∀ b : B, e (pdDifferential A (Polynomial B) _ (TauCeti.PD.extendFlat (B := Polynomial B) δ)
          (Polynomial.C b)) = ((1 : Polynomial B) ⊗ₜ[B] pdDifferential A B J δ b, 0)) ∧
      e (pdDifferential A (Polynomial B) _ (TauCeti.PD.extendFlat (B := Polynomial B) δ)
          Polynomial.X) = (0, 1)) ∧
    (∃ e : pdDifferentials A (pdPolynomial (A := B) Unit) (pdPolynomialIdeal δ Unit)
          (pdPolynomialPowers δ Unit) ≃ₗ[pdPolynomial (A := B) Unit]
        (pdPolynomial (A := B) Unit ⊗[B] pdDifferentials A B J δ) × pdPolynomial (A := B) Unit,
      (∀ b : B, e (pdDifferential A (pdPolynomial (A := B) Unit) _ (pdPolynomialPowers δ Unit)
          (algebraMap B (pdPolynomial (A := B) Unit) b)) =
        ((1 : pdPolynomial (A := B) Unit) ⊗ₜ[B] pdDifferential A B J δ b, 0)) ∧
      ∀ n : ℕ, e (pdDifferential A (pdPolynomial (A := B) Unit) _ (pdPolynomialPowers δ Unit)
          (DividedPowerAlgebra.dp B (n + 1) (Finsupp.single () (1 : B)))) =
        (0, DividedPowerAlgebra.dp B n (Finsupp.single () (1 : B)))) := by sorry

/- API of CrystallineCohomology:CR.1/pd-differentials (Stacks Lemma 60.6.2 (3)). -/
lemma pdDifferentials_quotient (K : Ideal B) (hKJ : K ≤ J) (hK : δ.IsSubDPIdeal (K ⊓ J)) :
    ∃ e : pdDifferentials A (B ⧸ K) (J.map (Ideal.Quotient.mk K))
          (DividedPowers.Quotient.dividedPowers δ hK) ≃ₗ[B ⧸ K]
        ((B ⧸ K) ⊗[B] pdDifferentials A B J δ) ⧸
          Submodule.span (B ⧸ K) ({z | ∃ k ∈ K, z = (1 : B ⧸ K) ⊗ₜ[B] pdDifferential A B J δ k} :
            Set ((B ⧸ K) ⊗[B] pdDifferentials A B J δ)),
      ∀ b : B, e (pdDifferential A (B ⧸ K) _ (DividedPowers.Quotient.dividedPowers δ hK)
          (Ideal.Quotient.mk K b)) =
        Submodule.Quotient.mk ((1 : B ⧸ K) ⊗ₜ[B] pdDifferential A B J δ b) := by sorry

open scoped Classical in
/- API of CrystallineCohomology:CR.1/pd-differentials (Stacks Lemma 60.6.3). `(B₁,J₁,δ₁)` with
`s₀, s₁` is the coproduct of `(B,J,δ)` with itself over `(A,I,γ)`, `Δ` its codiagonal and
`K = ker Δ`; the `B`-module structure on `K/(K² + (K∩J₁)^{[2]})` is the one through `s₀`. -/
lemma pdDifferentials_diagonal {I : Ideal A} (γ : DividedPowers I)
    (hAB : γ.IsDPMorphism δ (algebraMap A B))
    {B₁ : Type u} [CommRing B₁] {J₁ : Ideal B₁} (δ₁ : DividedPowers J₁) (s₀ s₁ : B →+* B₁)
    (h₀ : δ.IsDPMorphism δ₁ s₀) (h₁ : δ.IsDPMorphism δ₁ s₁)
    (hcoprod : IsPushout (PDRing.ofHom _ hAB) (PDRing.ofHom _ hAB) (PDRing.ofHom s₀ h₀)
      (PDRing.ofHom s₁ h₁))
    (Δ : B₁ →+* B) (hΔ : δ₁.IsDPMorphism δ Δ) (hΔ₀ : Δ.comp s₀ = RingHom.id B)
    (hΔ₁ : Δ.comp s₁ = RingHom.id B) :
    ∃ (hsub : δ₁.IsSubDPIdeal (RingHom.ker Δ ⊓ J₁))
      (e : pdDifferentials A B J δ ≃+
        (RingHom.ker Δ ⧸ Submodule.comap (Submodule.subtype (RingHom.ker Δ))
          (RingHom.ker Δ ^ 2 ⊔ TauCeti.PD.pdFiltration (hsub.dividedPowers δ₁) 2))),
      (∀ (b : B) (hb : s₁ b - s₀ b ∈ RingHom.ker Δ),
        e (pdDifferential A B J δ b) = Submodule.Quotient.mk ⟨s₁ b - s₀ b, hb⟩) ∧
      ∀ (b : B) (ω : pdDifferentials A B J δ), e (b • ω) = s₀ b • e ω := by sorry

/- API of CrystallineCohomology:CR.1/pd-differentials (Stacks Lemma 60.6.10, with Divided Power
Algebra, Lemma 23.4.5). `B_e = B/pᵉB`; the ideal of `B^∧` is the kernel of `B^∧ → B/J`. The
three inverse limits of the item are identified termwise: `Ω¹_PD(B/A) → Ω¹_PD(B_e/A)` is
surjective with kernel `pᵉΩ¹_PD(B/A)` for `e ≥ e₀`, and `Ω¹_PD(B/A)/pᵉ → Ω¹_PD(B^∧/A)/pᵉ` is
bijective for every `e`. -/
lemma pdDifferentials_completion (p : ℕ) [Fact p.Prime]
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) (hp : ∃ N : ℕ, (p : B) ^ N ∈ J) :
    ∃ e₀ : ℕ,
      (∀ e : ℕ, e₀ ≤ e → ∃ (hsub : δ.IsSubDPIdeal (Ideal.span {(p : B)} ^ e ⊓ J))
          (hmor : δ.IsDPMorphism (DividedPowers.Quotient.dividedPowers δ hsub)
            (Ideal.Quotient.mkₐ A (Ideal.span {(p : B)} ^ e)).toRingHom),
          Function.Surjective (pdDifferentials_map A B J δ _ _
            (DividedPowers.Quotient.dividedPowers δ hsub) (Ideal.Quotient.mkₐ A _) hmor) ∧
          ∀ ω : pdDifferentials A B J δ,
            pdDifferentials_map A B J δ _ _ (DividedPowers.Quotient.dividedPowers δ hsub)
              (Ideal.Quotient.mkₐ A _) hmor ω = 0 ↔
            ∃ η : pdDifferentials A B J δ, ω = (p ^ e) • η) ∧
      ∃ (Jc : Ideal (AdicCompletion (Ideal.span {(p : B)}) B)) (δc : DividedPowers Jc)
        (f : B →ₐ[A] AdicCompletion (Ideal.span {(p : B)}) B)
        (hf : δ.IsDPMorphism δc f.toRingHom),
        (∀ b : B, f b = algebraMap B (AdicCompletion (Ideal.span {(p : B)}) B) b) ∧
        (∀ x, x ∈ Jc ↔ ∀ n : ℕ, AdicCompletion.evalₐ (Ideal.span {(p : B)}) n x ∈
          J.map (Ideal.Quotient.mk (Ideal.span {(p : B)} ^ n))) ∧
        (∀ e : ℕ, e₀ ≤ e → ∀ hsub : δ.IsSubDPIdeal (Ideal.span {(p : B)} ^ e ⊓ J),
          δc.IsDPMorphism (DividedPowers.Quotient.dividedPowers δ hsub)
            (AdicCompletion.evalₐ (Ideal.span {(p : B)}) e).toRingHom) ∧
        ∀ e : ℕ,
          (∀ ω' : pdDifferentials A (AdicCompletion (Ideal.span {(p : B)}) B) Jc δc,
            ∃ (ω : pdDifferentials A B J δ)
              (η' : pdDifferentials A (AdicCompletion (Ideal.span {(p : B)}) B) Jc δc),
              ω' = pdDifferentials_map A B J δ _ Jc δc f hf ω + (p ^ e) • η') ∧
          ∀ ω : pdDifferentials A B J δ,
            (∃ η' : pdDifferentials A (AdicCompletion (Ideal.span {(p : B)}) B) Jc δc,
              pdDifferentials_map A B J δ _ Jc δc f hf ω = (p ^ e) • η') →
            ∃ η : pdDifferentials A B J δ, ω = (p ^ e) • η := by sorry

end DifferentialAPI

end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory TensorProduct
universe u

section Connection
variable {A B Ω : Type u} [CommRing A] [CommRing B] [Algebra A B]
  [AddCommGroup Ω] [Module A Ω] [Module B Ω] [IsScalarTower A B Ω]

/- The exterior derivative on `Ω^• = ∧^•_B Ω` extending an `A`-derivation `d : B → Ω` whose
image generates `Ω` (so that `π : Ω_{B/A} → Ω` is surjective). The fields determine it; it
exists exactly when the exterior derivative of `Ω^•_{B/A}` descends to `∧^•_B Ω`, which is the
hypothesis of CR.1/integrable-connection on `π`. -/
structure ExteriorDerivative (d : Derivation A B Ω) where
  toLinearMap : ExteriorAlgebra B Ω →ₗ[A] ExteriorAlgebra B Ω
  span_range : Submodule.span B (Set.range d) = ⊤
  map_algebraMap : ∀ b : B,
    toLinearMap (algebraMap B (ExteriorAlgebra B Ω) b) = ExteriorAlgebra.ι B (d b)
  map_ι : ∀ b : B, toLinearMap (ExteriorAlgebra.ι B (d b)) = 0
  leibniz : ∀ (i : ℕ) (ω η : ExteriorAlgebra B Ω), ω ∈ ⋀[B]^i Ω →
    toLinearMap (ω * η) = toLinearMap ω * η + (-1 : B) ^ i • (ω * toLinearMap η)

lemma ExteriorDerivative.map_exteriorPower {d : Derivation A B Ω} (D : ExteriorDerivative d)
    (i : ℕ) (ω : ExteriorAlgebra B Ω) (hω : ω ∈ ⋀[B]^i Ω) :
    D.toLinearMap ω ∈ ⋀[B]^(i + 1) Ω := by sorry
lemma ExteriorDerivative.comp_self {d : Derivation A B Ω} (D : ExteriorDerivative d)
    (ω : ExteriorAlgebra B Ω) : D.toLinearMap (D.toLinearMap ω) = 0 := by sorry
lemma ExteriorDerivative.ext {d : Derivation A B Ω} (D D' : ExteriorDerivative d) :
    D.toLinearMap = D'.toLinearMap := by sorry

variable {M N : Type u} [AddCommGroup M] [Module B M] [AddCommGroup N] [Module B N]

-- CrystallineCohomology:CR.1/integrable-connection
structure Connection (d : Derivation A B Ω) (M : Type u) [AddCommGroup M] [Module B M] where
  toFun : M →+ M ⊗[B] Ω
  leibniz : ∀ (b : B) (m : M), toFun (b • m) = b • toFun m + m ⊗ₜ[B] d b

variable {d : Derivation A B Ω}

/- API of CrystallineCohomology:CR.1/integrable-connection: the extension of `∇` to
`M ⊗_B Ω^•`, with `∇(m ⊗ ω) = ∇(m) ∧ ω + m ⊗ dω`. -/
def Connection.extend (D : ExteriorDerivative d) (C : Connection d M) :
    M ⊗[B] ExteriorAlgebra B Ω →+ M ⊗[B] ExteriorAlgebra B Ω := by sorry
lemma Connection.extend_tmul (D : ExteriorDerivative d) (C : Connection d M) (m : M)
    (ω : ExteriorAlgebra B Ω) :
    C.extend D (m ⊗ₜ[B] ω) =
      LinearMap.lTensor M ((LinearMap.mulRight B ω).comp (ExteriorAlgebra.ι B)) (C.toFun m) +
        m ⊗ₜ[B] D.toLinearMap ω := by sorry
lemma Connection.extend_degree (D : ExteriorDerivative d) (C : Connection d M) (i : ℕ)
    (η : M ⊗[B] ExteriorAlgebra B Ω)
    (hη : η ∈ LinearMap.range (LinearMap.lTensor M (⋀[B]^i Ω).subtype)) :
    C.extend D η ∈ LinearMap.range (LinearMap.lTensor M (⋀[B]^(i + 1) Ω).subtype) := by sorry
lemma Connection.extend_mul (D : ExteriorDerivative d) (C : Connection d M) (i : ℕ)
    (η : M ⊗[B] ExteriorAlgebra B Ω)
    (hη : η ∈ LinearMap.range (LinearMap.lTensor M (⋀[B]^i Ω).subtype))
    (ω : ExteriorAlgebra B Ω) :
    C.extend D (LinearMap.lTensor M (LinearMap.mulRight B ω) η) =
      LinearMap.lTensor M (LinearMap.mulRight B ω) (C.extend D η) +
        (-1 : B) ^ i • LinearMap.lTensor M (LinearMap.mulRight B (D.toLinearMap ω)) η := by sorry

/- `∇` is integrable if `M → M ⊗_B Ω¹ → M ⊗_B Ω²` is zero. -/
def Connection.IsIntegrable (D : ExteriorDerivative d) (C : Connection d M) : Prop :=
  ∀ m : M, C.extend D (C.extend D (m ⊗ₜ[B] 1)) = 0

/- API of CrystallineCohomology:CR.1/integrable-connection: the curvature `∇∘∇ : M → M ⊗_B Ω²`
is `B`-linear, `(∇∘∇)(m ⊗ ω) = (∇∘∇)(m) ∧ ω`, and integrability is its vanishing. -/
def Connection.curvature (D : ExteriorDerivative d) (C : Connection d M) :
    M →ₗ[B] M ⊗[B] ExteriorAlgebra B Ω := by sorry
lemma Connection.curvature_apply (D : ExteriorDerivative d) (C : Connection d M) (m : M) :
    C.curvature D m = C.extend D (C.extend D (m ⊗ₜ[B] 1)) := by sorry
lemma Connection.curvature_mem (D : ExteriorDerivative d) (C : Connection d M) (m : M) :
    C.curvature D m ∈ LinearMap.range (LinearMap.lTensor M (⋀[B]^2 Ω).subtype) := by sorry
lemma Connection.extend_extend_tmul (D : ExteriorDerivative d) (C : Connection d M) (m : M)
    (ω : ExteriorAlgebra B Ω) :
    C.extend D (C.extend D (m ⊗ₜ[B] ω)) =
      LinearMap.lTensor M (LinearMap.mulRight B ω) (C.curvature D m) := by sorry
lemma Connection.isIntegrable_iff (D : ExteriorDerivative d) (C : Connection d M) :
    C.IsIntegrable D ↔ C.curvature D = 0 := by sorry
lemma Connection.extend_extend (D : ExteriorDerivative d) (C : Connection d M)
    (h : C.IsIntegrable D) (η : M ⊗[B] ExteriorAlgebra B Ω) :
    C.extend D (C.extend D η) = 0 := by sorry

/- A `B`-linear map is horizontal if it commutes with the connections. -/
def Connection.IsHorizontal (C : Connection d M) (C' : Connection d N) (φ : M →ₗ[B] N) : Prop :=
  ∀ m : M, C'.toFun (φ m) = LinearMap.rTensor Ω φ (C.toFun m)

section DeRham
variable [Module A M] [IsScalarTower A B M] [Module A N] [IsScalarTower A B N]

/- API of CrystallineCohomology:CR.1/integrable-connection: the de Rham complex
`(M ⊗_B Ω^•, ∇)` of an integrable connection, a cochain complex of `A`-modules. -/
def Connection.extendDegree (D : ExteriorDerivative d) (C : Connection d M) (i : ℕ) :
    M ⊗[B] ⋀[B]^i Ω →ₗ[A] M ⊗[B] ⋀[B]^(i + 1) Ω := by sorry
lemma Connection.extendDegree_spec (D : ExteriorDerivative d) (C : Connection d M) (i : ℕ)
    (η : M ⊗[B] ⋀[B]^i Ω) :
    LinearMap.lTensor M (⋀[B]^(i + 1) Ω).subtype (C.extendDegree D i η) =
      C.extend D (LinearMap.lTensor M (⋀[B]^i Ω).subtype η) := by sorry
def Connection.deRhamComplex (D : ExteriorDerivative d) (C : Connection d M)
    (h : C.IsIntegrable D) : CochainComplex (ModuleCat.{u} A) ℕ :=
  CochainComplex.of (fun i => ModuleCat.of A (M ⊗[B] ⋀[B]^i Ω))
    (fun i => ModuleCat.ofHom (C.extendDegree D i)) (by sorry)
/- A horizontal `B`-linear map induces a map of de Rham complexes. -/
def Connection.deRhamMap (D : ExteriorDerivative d) (C : Connection d M) (C' : Connection d N)
    (h : C.IsIntegrable D) (h' : C'.IsIntegrable D) (φ : M →ₗ[B] N)
    (hφ : C.IsHorizontal C' φ) : C.deRhamComplex D h ⟶ C'.deRhamComplex D h' := by sorry
lemma Connection.deRhamMap_f (D : ExteriorDerivative d) (C : Connection d M)
    (C' : Connection d N) (h : C.IsIntegrable D) (h' : C'.IsIntegrable D) (φ : M →ₗ[B] N)
    (hφ : C.IsHorizontal C' φ) (i : ℕ) (m : M) (ω : ⋀[B]^i Ω) :
    ((C.deRhamMap D C' h h' φ hφ).f i).hom (m ⊗ₜ[B] ω : M ⊗[B] ⋀[B]^i Ω) =
      (φ m ⊗ₜ[B] ω : N ⊗[B] ⋀[B]^i Ω) := by sorry

end DeRham

end Connection

end TauCeti.Crystalline

namespace TauCeti.Crystalline
open CategoryTheory TensorProduct
universe u

section ConnectionOperations
variable {A B Ω : Type u} [CommRing A] [CommRing B] [Algebra A B]
  [AddCommGroup Ω] [Module A Ω] [Module B Ω] [IsScalarTower A B Ω] {d : Derivation A B Ω}
variable {M N : Type u} [AddCommGroup M] [Module B M] [AddCommGroup N] [Module B N]

section BaseChange
/- A commutative square of rings `A → A′`, `B → B′` and a `B`-linear map `φ : Ω → Ω′`
compatible with the derivations (Stacks Remark 60.6.9). -/
variable {A' B' Ω' : Type u} [CommRing A'] [CommRing B'] [Algebra A' B']
  [AddCommGroup Ω'] [Module A' Ω'] [Module B' Ω'] [IsScalarTower A' B' Ω']
  [Algebra A A'] [Algebra B B'] [Algebra A B'] [IsScalarTower A A' B'] [IsScalarTower A B B']
  [Module B Ω'] [IsScalarTower B B' Ω'] {d' : Derivation A' B' Ω'}

/- API of CrystallineCohomology:CR.1/integrable-connection: the base change of `(M,∇)`, on
`B′ ⊗_B M`. -/
def Connection.baseChange (C : Connection d M) (φ : Ω →ₗ[B] Ω')
    (hφ : ∀ b : B, φ (d b) = d' (algebraMap B B' b)) : Connection d' (B' ⊗[B] M) := by sorry
lemma Connection.baseChange_tmul (C : Connection d M) (φ : Ω →ₗ[B] Ω')
    (hφ : ∀ b : B, φ (d b) = d' (algebraMap B B' b)) (b' : B') (m : M)
    {ι : Type*} (s : Finset ι) (mᵢ : ι → M) (ωᵢ : ι → Ω)
    (hm : C.toFun m = ∑ i ∈ s, mᵢ i ⊗ₜ[B] ωᵢ i) :
    (C.baseChange φ hφ).toFun (b' ⊗ₜ[B] m) =
      ∑ i ∈ s, (b' ⊗ₜ[B] mᵢ i) ⊗ₜ[B'] φ (ωᵢ i) + ((1 : B') ⊗ₜ[B] m) ⊗ₜ[B'] d' b' := by sorry
lemma Connection.baseChange_isIntegrable (D : ExteriorDerivative d) (D' : ExteriorDerivative d')
    (C : Connection d M) (φ : Ω →ₗ[B] Ω') (hφ : ∀ b : B, φ (d b) = d' (algebraMap B B' b))
    (h : C.IsIntegrable D) : (C.baseChange φ hφ).IsIntegrable D' := by sorry
end BaseChange

/- API of CrystallineCohomology:CR.1/integrable-connection: the tensor product connection
`∇(m ⊗ n) = ∇(m) ⊗ n + m ⊗ ∇(n)`; its curvature is `R_M ⊗ 1 + 1 ⊗ R_N`. -/
def Connection.tensor (C : Connection d M) (C' : Connection d N) : Connection d (M ⊗[B] N) := by
  sorry
lemma Connection.tensor_tmul (C : Connection d M) (C' : Connection d N) (m : M) (n : N)
    {ι κ : Type*} (s : Finset ι) (mᵢ : ι → M) (ωᵢ : ι → Ω)
    (hm : C.toFun m = ∑ i ∈ s, mᵢ i ⊗ₜ[B] ωᵢ i)
    (t : Finset κ) (nⱼ : κ → N) (ωⱼ : κ → Ω) (hn : C'.toFun n = ∑ j ∈ t, nⱼ j ⊗ₜ[B] ωⱼ j) :
    (C.tensor C').toFun (m ⊗ₜ[B] n) =
      ∑ i ∈ s, (mᵢ i ⊗ₜ[B] n) ⊗ₜ[B] ωᵢ i + ∑ j ∈ t, (m ⊗ₜ[B] nⱼ j) ⊗ₜ[B] ωⱼ j := by sorry
lemma Connection.tensor_curvature (D : ExteriorDerivative d) (C : Connection d M)
    (C' : Connection d N) (m : M) (n : N)
    {ι κ : Type*} (s : Finset ι) (mᵢ : ι → M) (ηᵢ : ι → ExteriorAlgebra B Ω)
    (hm : C.curvature D m = ∑ i ∈ s, mᵢ i ⊗ₜ[B] ηᵢ i)
    (t : Finset κ) (nⱼ : κ → N) (ηⱼ : κ → ExteriorAlgebra B Ω)
    (hn : C'.curvature D n = ∑ j ∈ t, nⱼ j ⊗ₜ[B] ηⱼ j) :
    (C.tensor C').curvature D (m ⊗ₜ[B] n) =
      ∑ i ∈ s, (mᵢ i ⊗ₜ[B] n) ⊗ₜ[B] ηᵢ i + ∑ j ∈ t, (m ⊗ₜ[B] nⱼ j) ⊗ₜ[B] ηⱼ j := by sorry
lemma Connection.tensor_isIntegrable (D : ExteriorDerivative d) (C : Connection d M)
    (C' : Connection d N) (h : C.IsIntegrable D) (h' : C'.IsIntegrable D) :
    (C.tensor C').IsIntegrable D := by sorry

/- API of CrystallineCohomology:CR.1/integrable-connection: the connection on `Hom_B(M,N)` for
`M` finitely generated projective, `(∇φ)(m) = ∇_N(φ(m)) − (φ ⊗ 1)(∇_M(m))` under
`Hom_B(M,N) ⊗_B Ω = Hom_B(M, N ⊗_B Ω)`. -/
def Connection.hom [Module.Finite B M] [Module.Projective B M] (C : Connection d M)
    (C' : Connection d N) : Connection d (M →ₗ[B] N) := by sorry
lemma Connection.hom_apply [Module.Finite B M] [Module.Projective B M] (C : Connection d M)
    (C' : Connection d N) (φ : M →ₗ[B] N) {ι : Type*} (s : Finset ι) (ψ : ι → M →ₗ[B] N)
    (ω : ι → Ω) (h : (C.hom C').toFun φ = ∑ i ∈ s, ψ i ⊗ₜ[B] ω i) (m : M) :
    ∑ i ∈ s, ψ i m ⊗ₜ[B] ω i = C'.toFun (φ m) - LinearMap.rTensor Ω φ (C.toFun m) := by sorry
lemma Connection.hom_isIntegrable [Module.Finite B M] [Module.Projective B M]
    (D : ExteriorDerivative d) (C : Connection d M) (C' : Connection d N)
    (h : C.IsIntegrable D) (h' : C'.IsIntegrable D) : (C.hom C').IsIntegrable D := by sorry
lemma Connection.hom_eq_zero_iff [Module.Finite B M] [Module.Projective B M]
    (C : Connection d M) (C' : Connection d N) (φ : M →ₗ[B] N) :
    (C.hom C').toFun φ = 0 ↔ C.IsHorizontal C' φ := by sorry

-- TauCeti.Crystalline.test_connection_unit
example (D : ExteriorDerivative d) :
    ∃ C : Connection d B, (∀ b : B, C.toFun b = (1 : B) ⊗ₜ[B] d b) ∧ C.IsIntegrable D ∧
      ∀ ω : ExteriorAlgebra B Ω,
        C.extend D ((1 : B) ⊗ₜ[B] ω) = (1 : B) ⊗ₜ[B] D.toLinearMap ω := by sorry

end ConnectionOperations

-- TauCeti.Crystalline.test_connection_exponential
example (p : ℕ) [Fact p.Prime] :
    ∃ C : Connection (KaehlerDifferential.D (ZMod p) (Polynomial (ZMod p)))
        (Polynomial (ZMod p)),
      (∀ f : Polynomial (ZMod p), C.toFun f =
        (Polynomial.derivative f + f) ⊗ₜ[Polynomial (ZMod p)]
          KaehlerDifferential.D (ZMod p) (Polynomial (ZMod p)) Polynomial.X) ∧
      ∀ D : ExteriorDerivative (KaehlerDifferential.D (ZMod p) (Polynomial (ZMod p))),
        C.IsIntegrable D ∧
        ∀ f : Polynomial (ZMod p), C.extend D (f ⊗ₜ[Polynomial (ZMod p)] 1) =
          (Polynomial.derivative f + f) ⊗ₜ[Polynomial (ZMod p)]
            ExteriorAlgebra.ι (Polynomial (ZMod p))
              (KaehlerDifferential.D (ZMod p) (Polynomial (ZMod p)) Polynomial.X) := by sorry

-- TauCeti.Crystalline.test_connection_not_integrable
example (A : Type u) [CommRing A] [Nontrivial A] :
    ∃ C : Connection (KaehlerDifferential.D A (MvPolynomial (Fin 2) A))
        (MvPolynomial (Fin 2) A),
      C.toFun 1 = (1 : MvPolynomial (Fin 2) A) ⊗ₜ[MvPolynomial (Fin 2) A]
        ((MvPolynomial.X 0 : MvPolynomial (Fin 2) A) •
          KaehlerDifferential.D A (MvPolynomial (Fin 2) A) (MvPolynomial.X 1)) ∧
      ∀ D : ExteriorDerivative (KaehlerDifferential.D A (MvPolynomial (Fin 2) A)),
        C.extend D (C.extend D (1 ⊗ₜ[MvPolynomial (Fin 2) A] 1)) =
          (1 : MvPolynomial (Fin 2) A) ⊗ₜ[MvPolynomial (Fin 2) A]
            (ExteriorAlgebra.ι (MvPolynomial (Fin 2) A)
                (KaehlerDifferential.D A (MvPolynomial (Fin 2) A) (MvPolynomial.X 0)) *
              ExteriorAlgebra.ι (MvPolynomial (Fin 2) A)
                (KaehlerDifferential.D A (MvPolynomial (Fin 2) A) (MvPolynomial.X 1))) ∧
        C.extend D (C.extend D (1 ⊗ₜ[MvPolynomial (Fin 2) A] 1)) ≠ 0 ∧
        ¬ C.IsIntegrable D := by sorry

-- TauCeti.Crystalline.test_connection_pd
example (A : Type u) [CommRing A] :
    ∃ dt : pdPolynomial (A := A) Unit →ₗ[A] pdPolynomial (A := A) Unit,
      dt 1 = 0 ∧
      (∀ n : ℕ, dt (DividedPowerAlgebra.dp A (n + 1) (Finsupp.single () (1 : A))) =
        DividedPowerAlgebra.dp A n (Finsupp.single () (1 : A))) ∧
      ∀ (M : Type u) [AddCommGroup M] [Module (pdPolynomial (A := A) Unit) M],
        (∀ C : Connection (pdDifferential A (pdPolynomial (A := A) Unit)
              (pdPolynomialIdeal (dividedPowersBot A) Unit)
              (pdPolynomialPowers (dividedPowersBot A) Unit)) M,
          ∃ θ : M →+ M,
            (∀ m : M, C.toFun m = θ m ⊗ₜ[pdPolynomial (A := A) Unit]
              pdDifferential A (pdPolynomial (A := A) Unit)
                (pdPolynomialIdeal (dividedPowersBot A) Unit)
                (pdPolynomialPowers (dividedPowersBot A) Unit)
                (DividedPowerAlgebra.dp A 1 (Finsupp.single () (1 : A)))) ∧
            ∀ (b : pdPolynomial (A := A) Unit) (m : M), θ (b • m) = dt b • m + b • θ m) ∧
        ∀ θ : M →+ M,
          (∀ (b : pdPolynomial (A := A) Unit) (m : M), θ (b • m) = dt b • m + b • θ m) →
          ∃ C : Connection (pdDifferential A (pdPolynomial (A := A) Unit)
              (pdPolynomialIdeal (dividedPowersBot A) Unit)
              (pdPolynomialPowers (dividedPowersBot A) Unit)) M,
            ∀ m : M, C.toFun m = θ m ⊗ₜ[pdPolynomial (A := A) Unit]
              pdDifferential A (pdPolynomial (A := A) Unit)
                (pdPolynomialIdeal (dividedPowersBot A) Unit)
                (pdPolynomialPowers (dividedPowersBot A) Unit)
                (DividedPowerAlgebra.dp A 1 (Finsupp.single () (1 : A))) := by sorry

end TauCeti.Crystalline

/-!
De Rham–Witt complexes (CR.4): signatures for the API items, unit tests and nodes added to
the packet nodes on Dieudonné algebras, the saturated de Rham–Witt complex, relative
F–V procomplexes, the Nygaard filtration, the canonical divided powers on the Verschiebung
ideal of `W_r(R)`, the classical de Rham–Witt complex and the seminormalisation theorem.
These are plans, not implementations.
-/

namespace TauCeti.Crystalline
open CategoryTheory
open scoped DirectSum
universe u v

section FiniteWittOperators
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]

/- API of CrystallineCohomology:CR.4/relative-witt-complex: the properties of the operators
`finiteWittF`, `finiteWittV` and `finiteTeich` on `W_r(R) = TruncatedWittVector p r R`. The
three functions are defined in the RelativeWitt section above through one lift
(`TruncatedWittVector.out`); the `_truncate` lemmas say that every lift gives the same value. -/
lemma finiteWittF_truncate (r : ℕ) (x : WittVector p R) :
    finiteWittF p R r (WittVector.truncate (r+1) x) =
      WittVector.truncate r (WittVector.frobenius x) := by sorry
def finiteWittFHom (r : ℕ) : TruncatedWittVector p (r+1) R →+* TruncatedWittVector p r R where
  toFun := finiteWittF p R r
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry
lemma finiteWittF_restriction (r : ℕ) (x : TruncatedWittVector p (r+2) R) :
    TruncatedWittVector.truncate (Nat.le_succ r) (finiteWittF p R (r+1) x) =
      finiteWittF p R r (TruncatedWittVector.truncate (Nat.le_succ (r+1)) x) := by sorry

lemma finiteWittV_truncate (r : ℕ) (x : WittVector p R) :
    finiteWittV p R r (WittVector.truncate r x) =
      WittVector.truncate (r+1) (WittVector.verschiebung x) := by sorry
def finiteWittVHom (r : ℕ) : TruncatedWittVector p r R →+ TruncatedWittVector p (r+1) R where
  toFun := finiteWittV p R r
  map_zero' := by sorry
  map_add' := by sorry
lemma finiteWittV_injective (r : ℕ) : Function.Injective (finiteWittV p R r) := by sorry
lemma finiteWittV_restriction (r : ℕ) (x : TruncatedWittVector p (r+1) R) :
    TruncatedWittVector.truncate (Nat.le_succ (r+1)) (finiteWittV p R (r+1) x) =
      finiteWittV p R r (TruncatedWittVector.truncate (Nat.le_succ r) x) := by sorry
lemma finiteWittF_V (r : ℕ) (x : TruncatedWittVector p r R) :
    finiteWittF p R r (finiteWittV p R r x) = (p : TruncatedWittVector p r R) * x := by sorry
lemma finiteWittV_mul_F (r : ℕ) (x : TruncatedWittVector p r R)
    (y : TruncatedWittVector p (r+1) R) :
    finiteWittV p R r (x * finiteWittF p R r y) = finiteWittV p R r x * y := by sorry

def finiteTeichHom (r : ℕ) : R →* TruncatedWittVector p r R where
  toFun := finiteTeich p R r
  map_one' := by sorry
  map_mul' := by sorry
lemma finiteTeich_restriction (r : ℕ) (x : R) :
    TruncatedWittVector.truncate (Nat.le_succ r) (finiteTeich p R (r+1) x) =
      finiteTeich p R r x := by sorry
lemma finiteWittF_teich (r : ℕ) (x : R) :
    finiteWittF p R r (finiteTeich p R (r+1) x) = finiteTeich p R r x ^ p ∧
      finiteTeich p R r x ^ p = finiteTeich p R r (x ^ p) := by sorry

/-- `W_r(f)` for a ring homomorphism `f`, as a ring homomorphism on the function
`finiteWittMap` of the file. -/
def finiteWittMapHom {R R' : Type u} [CommRing R] [CommRing R'] (f : R →+* R') (r : ℕ) :
    TruncatedWittVector p r R →+* TruncatedWittVector p r R' where
  toFun := finiteWittMap p f r
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

end FiniteWittOperators

section WittVerschiebungPD
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]

/- API of CrystallineCohomology:CR.4/witt-verschiebung-divided-powers. `W_r(R)` is
`TruncatedWittVector p r R` for every `r : ℕ` (`W_0 = 0`), and
`V : W_r(R) → W_(r+1)(R)` is `finiteWittV p R r`, the truncation of `WittVector.verschiebung`.
The ideal `I_r` is defined as the set of truncated Witt vectors whose coefficient of index 0
vanishes; `mem_wittVerschiebungIdeal_succ` and `wittVerschiebungIdeal_eq_ker` identify it with
the image of `V` and with the kernel of `W_(r+1)(R) → W_1(R)`. -/
def wittVerschiebungIdeal (r : ℕ) : Ideal (TruncatedWittVector p r R) where
  carrier := {x | ∀ i : Fin r, (i : ℕ) = 0 → x.coeff i = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry
lemma mem_wittVerschiebungIdeal_succ (r : ℕ) (x : TruncatedWittVector p (r+1) R) :
    x ∈ wittVerschiebungIdeal p R (r+1) ↔
      ∃ ξ : TruncatedWittVector p r R, finiteWittV p R r ξ = x := by sorry
lemma wittVerschiebungIdeal_eq_ker (r : ℕ) :
    wittVerschiebungIdeal p R (r+1) =
      RingHom.ker (TruncatedWittVector.truncate (p := p) (R := R) (Nat.le_add_left 1 r)) := by sorry
lemma wittVerschiebungIdeal_one : wittVerschiebungIdeal p R 1 = ⊥ := by sorry

lemma wittVerschiebung_pow (r : ℕ) (ξ : TruncatedWittVector p r R) (n : ℕ) (hn : n ≠ 0) :
    finiteWittV p R r ξ ^ n =
      (p : TruncatedWittVector p (r+1) R) ^ (n - 1) * finiteWittV p R r (ξ ^ n) := by sorry

/-- `W_r(R)` is a `ℤ_(p)`-algebra when `R` is. -/
lemma wittVerschiebung_isUnit_natCast (hR : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R)) (r n : ℕ)
    (hn : ¬ p ∣ n) : IsUnit (n : TruncatedWittVector p r R) := by sorry

/-- The image in a `ℤ_(p)`-algebra `A` of the rational number `p^(n-1)/n!` (`n ≥ 1`), which
lies in `ℤ_(p)`: with `v = padicValNat p n!` and `n! = p ^ v * m`, one has `v ≤ n - 1`,
`p ∤ m` and `p^(n-1)/n! = p ^ (n - 1 - v) / m`. -/
def wittPDCoeff (p : ℕ) (A : Type*) [CommRing A] (n : ℕ) : A :=
  (p : A) ^ (n - 1 - padicValNat p n.factorial) *
    Ring.inverse ((n.factorial / p ^ padicValNat p n.factorial : ℕ) : A)
lemma wittPDCoeff_eq_map (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A]
    (hA : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : A)) {L : Type*} [CommRing L] [IsDomain L] [CharZero L]
    (f : L →+* A) (n : ℕ) (hn : n ≠ 0) (z : L) (hz : (n.factorial : L) * z = (p : L) ^ (n - 1)) :
    f z = wittPDCoeff p A n := by sorry

-- CrystallineCohomology:CR.4/witt-verschiebung-divided-powers
def wittVerschiebungDividedPowers (hR : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R)) (r : ℕ) :
    DividedPowers (wittVerschiebungIdeal p R r) := by sorry
lemma wittVerschiebungDividedPowers_dpow (hR : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R)) (r : ℕ)
    (ξ : TruncatedWittVector p r R) :
    (∀ n : ℕ, n ≠ 0 →
      (wittVerschiebungDividedPowers p R hR (r+1)).dpow n (finiteWittV p R r ξ) =
        wittPDCoeff p (TruncatedWittVector p (r+1) R) n * finiteWittV p R r (ξ ^ n)) ∧
    ((p - 1).factorial : TruncatedWittVector p (r+1) R) *
        (wittVerschiebungDividedPowers p R hR (r+1)).dpow p (finiteWittV p R r ξ) =
      (p : TruncatedWittVector p (r+1) R) ^ (p - 2) * finiteWittV p R r (ξ ^ p) := by sorry
lemma wittVerschiebungDividedPowers_map (hR : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R))
    {R' : Type u} [CommRing R'] (hR' : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R')) (f : R →+* R')
    (r : ℕ) :
    DividedPowers.IsDPMorphism (wittVerschiebungDividedPowers p R hR (r+1))
        (wittVerschiebungDividedPowers p R hR r) (TruncatedWittVector.truncate (Nat.le_succ r)) ∧
      DividedPowers.IsDPMorphism (wittVerschiebungDividedPowers p R hR r)
        (wittVerschiebungDividedPowers p R' hR' r) (finiteWittMapHom p f r) := by sorry
lemma wittVerschiebungDividedPowers_unique (hR : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R))
    (htf : ∀ x : R, (p : R) * x = 0 → x = 0) (r : ℕ)
    (θ : DividedPowers (wittVerschiebungIdeal p R r)) :
    θ = wittVerschiebungDividedPowers p R hR r := by sorry
lemma wittVerschiebungDividedPowers_Fp (h : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : ZMod p)) (r : ℕ)
    (h' : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : ZMod (p ^ r))) :
    wittVerschiebungIdeal p (ZMod p) r =
        (Ideal.span {(p : ZMod (p ^ r))}).map (TruncatedWittVector.zmodEquivTrunc p r) ∧
      ∀ (n : ℕ) (x : ZMod (p ^ r)),
        (wittVerschiebungDividedPowers p (ZMod p) h r).dpow n
            (TruncatedWittVector.zmodEquivTrunc p r x) =
          TruncatedWittVector.zmodEquivTrunc p r
            ((TauCeti.PD.canonicalP p (ZMod (p ^ r)) h').dpow n x) := by sorry
-- TauCeti.Crystalline.test_wittPD_Fp
example (h : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : ZMod p)) :
    wittVerschiebungIdeal p (ZMod p) 2 = Ideal.span {(p : TruncatedWittVector p 2 (ZMod p))} ∧
      finiteWittV p (ZMod p) 1 1 = (p : TruncatedWittVector p 2 (ZMod p)) ∧
      ∀ n : ℕ, n ≠ 0 →
        (wittVerschiebungDividedPowers p (ZMod p) h 2).dpow n (p : TruncatedWittVector p 2 (ZMod p)) =
          TruncatedWittVector.zmodEquivTrunc p 2 (TauCeti.PD.canonicalPCoeff p (ZMod (p ^ 2)) n) := by sorry
-- TauCeti.Crystalline.test_wittPD_two
example (h : ∀ n : ℕ, ¬ 2 ∣ n → IsUnit (n : ZMod 2)) :
    (wittVerschiebungDividedPowers 2 (ZMod 2) h 2).dpow 2 2 = 2 ∧
      (wittVerschiebungDividedPowers 2 (ZMod 2) h 2).dpow 3 2 = 0 ∧
      ∀ k : ℕ, (wittVerschiebungDividedPowers 2 (ZMod 2) h 2).dpow (2 ^ k) 2 = 2 := by sorry
-- TauCeti.Crystalline.test_wittPD_factorial
example (hR : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R)) (r : ℕ) (ξ : TruncatedWittVector p r R)
    (n : ℕ) (hn : n ≠ 0) :
    (n.factorial : TruncatedWittVector p (r+1) R) *
        (wittVerschiebungDividedPowers p R hR (r+1)).dpow n (finiteWittV p R r ξ) =
      finiteWittV p R r ξ ^ n := by sorry
-- TauCeti.Crystalline.test_wittPD_integers
example :
    finiteWittV 3 ℤ 1 1 ^ 2 = 3 * finiteWittV 3 ℤ 1 1 ∧
      WittVector.ghostComponent 0 (finiteWittV 3 ℤ 1 1 ^ 2).out = 0 ∧
      WittVector.ghostComponent 1 (finiteWittV 3 ℤ 1 1 ^ 2).out = 9 ∧
      (¬ ∃ y : TruncatedWittVector 3 2 ℤ, 2 * y = finiteWittV 3 ℤ 1 1 ^ 2) ∧
      IsEmpty (DividedPowers (wittVerschiebungIdeal 3 ℤ 2)) := by sorry

end WittVerschiebungPD

section RelativeWittAPI
variable {p : ℕ} [Fact p.Prime] {A R : Type u} [CommRing A] [CommRing R] [Algebra A R]

/- API of CrystallineCohomology:CR.4/relative-witt-complex: consequences of the axioms of an
F–V procomplex. -/
lemma RelativeWittComplex.d_F (P : RelativeWittComplex p A R) (r : ℕ) (q : ℤ)
    (x : (P.level (r+1)).complex.X q) :
    ((P.level r).complex.d q (q+1)).hom (P.F r q x) =
      p • P.F r (q+1) (((P.level (r+1)).complex.d q (q+1)).hom x) := by sorry

/-- The differential of a `WittDGA` as an additive endomorphism of the direct sum of its terms. -/
def WittDGA.dTotal (D : WittDGA.{u}) :
    (⨁ q : ℤ, D.complex.X q) →+ ⨁ q : ℤ, D.complex.X q :=
  DirectSum.toAddMonoid fun q =>
    (DirectSum.of (fun n : ℤ => D.complex.X n) (q+1)).comp
      (D.complex.d q (q+1)).hom.toAddMonoidHom
/-- The Verschiebung of an F–V procomplex on the direct sum of the terms of `P_r`. -/
def RelativeWittComplex.VTotal (P : RelativeWittComplex p A R) (r : ℕ) :
    (⨁ q : ℤ, (P.level r).complex.X q) →+ ⨁ q : ℤ, (P.level (r+1)).complex.X q :=
  DirectSum.map fun q => P.V r q
lemma RelativeWittComplex.V_d (P : RelativeWittComplex p A R) (r : ℕ) :
    (∀ (q : ℤ) (x : (P.level r).complex.X q),
      P.V r (q+1) (((P.level r).complex.d q (q+1)).hom x) =
        p • ((P.level (r+1)).complex.d q (q+1)).hom (P.V r q x)) ∧
    ∀ (x : ⨁ q : ℤ, (P.level r).complex.X q) (ys : List (⨁ q : ℤ, (P.level r).complex.X q)),
      P.VTotal r (x * (ys.map (P.level r).dTotal).prod) =
        P.VTotal r x * (ys.map fun y => (P.level (r+1)).dTotal (P.VTotal r y)).prod := by sorry

lemma RelativeWittComplex.d_pd (P : RelativeWittComplex p A R)
    (hR : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R)) (r : ℕ) :
    (∀ ξ : TruncatedWittVector p r R,
      ((P.level (r+1)).complex.d 0 1).hom (P.coefficient (r+1) (finiteWittV p R r (ξ ^ p))) =
        GradedMonoid.GMul.mul (A := fun n : ℤ => (P.level (r+1)).complex.X n)
          (P.coefficient (r+1) (finiteWittV p R r (ξ ^ (p - 1))))
          (((P.level (r+1)).complex.d 0 1).hom (P.coefficient (r+1) (finiteWittV p R r ξ)))) ∧
    ∀ n : ℕ, n ≠ 0 → ∀ x ∈ wittVerschiebungIdeal p R (r+1),
      ((P.level (r+1)).complex.d 0 1).hom
          (P.coefficient (r+1) ((wittVerschiebungDividedPowers p R hR (r+1)).dpow n x)) =
        GradedMonoid.GMul.mul (A := fun n : ℤ => (P.level (r+1)).complex.X n)
          (P.coefficient (r+1) ((wittVerschiebungDividedPowers p R hR (r+1)).dpow (n - 1) x))
          (((P.level (r+1)).complex.d 0 1).hom (P.coefficient (r+1) x)) := by sorry

-- TauCeti.Crystalline.test_relativeWitt_constant
example (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
    (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) :
    ∃ P : RelativeWittComplex p A A,
      (∀ (r : ℕ) (q : ℤ), q ≠ 0 → Subsingleton ((P.level r).complex.X q)) ∧
      (∀ r : ℕ, Function.Bijective (P.coefficient r)) ∧
      (CharP A p → ∀ (r : ℕ),
        (∀ x : (P.level (r+1)).complex.X 0, P.V r 0 (P.F r 0 x) = p • x) ∧
        ∀ x : (P.level r).complex.X 0, P.F r 0 (P.V r 0 x) = p • x) := by sorry

/- API of CrystallineCohomology:CR.4/relative-de-rham-witt. -/
lemma relativeDRW_generated (p : ℕ) [Fact p.Prime] (A R : Type u) [CommRing A] [CommRing R]
    [Algebra A R] (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) (r : ℕ) :
    (∀ (q : ℕ) (x : ((relativeDRW p A R hA).level r).complex.X (q : ℤ)),
      DirectSum.of (fun n : ℤ => ((relativeDRW p A R hA).level r).complex.X n) (q : ℤ) x ∈
        AddSubgroup.closure {z | ∃ (ξ : TruncatedWittVector p r R)
            (η : Fin q → TruncatedWittVector p r R),
          z = DirectSum.of (fun n : ℤ => ((relativeDRW p A R hA).level r).complex.X n) 0
                ((relativeDRW p A R hA).coefficient r ξ) *
              (List.ofFn fun k =>
                DirectSum.of (fun n : ℤ => ((relativeDRW p A R hA).level r).complex.X n) 1
                  ((((relativeDRW p A R hA).level r).complex.d 0 1).hom
                    ((relativeDRW p A R hA).coefficient r (η k)))).prod}) ∧
    ∀ q : ℤ, Function.Surjective ((((relativeDRW p A R hA).restriction r).chain.f q).hom) := by sorry

lemma relativeDRW_base_quotient (p : ℕ) [Fact p.Prime] {A A' R : Type u} [CommRing A]
    [CommRing A'] [CommRing R] [Algebra A R] [Algebra A' R]
    (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (hA' : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A'))
    (a : A →+* A') (ha : Function.Surjective a)
    (hcomm : (RingHom.id R).comp (algebraMap A R) = (algebraMap A' R).comp a) (r : ℕ) (q : ℤ) :
    Function.Bijective
      ((((relativeDRW_map p hA hA' a (RingHom.id R) hcomm).map r).chain.f q).hom) := by sorry

/-- The data and axioms of an F–V procomplex for `R/A` that do not involve restriction maps:
the fields of `RelativeWittComplex` other than `restriction`, `coeff_R`, `RF` and `RV`. -/
structure RelativeWittFVSystem (p : ℕ) [Fact p.Prime] (A R : Type u) [CommRing A] [CommRing R]
    [Algebra A R] where
  pLocal : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)
  level : ℕ → WittDGA.{u}
  lengthZero : ∀ q : ℤ, Subsingleton ((level 0).complex.X q)
  coefficient : ∀ r, TruncatedWittVector p r R →+* (level r).complex.X 0
  baseConstant : ∀ r (a : TruncatedWittVector p r A),
    ((level r).complex.d 0 1).hom (coefficient r (finiteWittBase p A R r a)) = 0
  F : ∀ r q, (level (r+1)).complex.X q →+ (level r).complex.X q
  V : ∀ r q, (level r).complex.X q →+ (level (r+1)).complex.X q
  F_one : ∀ r, F r 0 1 = 1
  F_mul : ∀ r i j (x : (level (r+1)).complex.X i) (y : (level (r+1)).complex.X j),
    F r (i+j) (GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n) x y) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n) (F r i x) (F r j y)
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

/-- A family of maps of differential graded algebras from an F–V procomplex to a system
without restriction maps, commuting with `F`, `V` and `λ`. -/
structure RelativeWittComplex.HomToFVSystem (P : RelativeWittComplex p A R)
    (Q : RelativeWittFVSystem p A R) where
  map : ∀ r, WittDGA.Hom (P.level r) (Q.level r)
  coefficient : ∀ r x, ((map r).chain.f 0).hom (P.coefficient r x) = Q.coefficient r x
  F : ∀ r q x, ((map r).chain.f q).hom (P.F r q x) = Q.F r q (((map (r+1)).chain.f q).hom x)
  V : ∀ r q x, ((map (r+1)).chain.f q).hom (P.V r q x) = Q.V r q (((map r).chain.f q).hom x)

lemma relativeDRW_lift_noRestriction (p : ℕ) [Fact p.Prime] (A R : Type u) [CommRing A]
    [CommRing R] [Algebra A R] (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (Q : RelativeWittFVSystem p A R) :
    ∃ f : RelativeWittComplex.HomToFVSystem (relativeDRW p A R hA) Q,
      ∀ g : RelativeWittComplex.HomToFVSystem (relativeDRW p A R hA) Q, g = f := by sorry

-- TauCeti.Crystalline.test_relativeDRW_torus
example (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [Nontrivial A]
    (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (t : (LaurentPolynomial A)ˣ) (ht : (t : LaurentPolynomial A) = LaurentPolynomial.T 1)
    (r : ℕ) :
    (relativeDRW p A (LaurentPolynomial A) hA).dlog (r+1) t ≠ 0 ∧
      (relativeDRW p A (LaurentPolynomial A) hA).F r 1
          ((relativeDRW p A (LaurentPolynomial A) hA).dlog (r+1) t) =
        (relativeDRW p A (LaurentPolynomial A) hA).dlog r t ∧
      (((relativeDRW p A (LaurentPolynomial A) hA).level (r+1)).complex.d 1 2).hom
          ((relativeDRW p A (LaurentPolynomial A) hA).dlog (r+1) t) = 0 ∧
      ∃ e : ((relativeDRW p A (LaurentPolynomial A) hA).level 1).complex.X 1 ≃+
          Ω[LaurentPolynomial A⁄A],
        (∀ x : TruncatedWittVector p 1 (LaurentPolynomial A),
          e ((((relativeDRW p A (LaurentPolynomial A) hA).level 1).complex.d 0 1).hom
              ((relativeDRW p A (LaurentPolynomial A) hA).coefficient 1 x)) =
            KaehlerDifferential.D A (LaurentPolynomial A) (x.coeff 0)) ∧
        e ((relativeDRW p A (LaurentPolynomial A) hA).dlog 1 t) =
          ((t⁻¹ : (LaurentPolynomial A)ˣ) : LaurentPolynomial A) •
            KaehlerDifferential.D A (LaurentPolynomial A) (t : LaurentPolynomial A) := by sorry

end RelativeWittAPI

section NygaardAPI
variable {p : ℕ} [Fact p.Prime]

/- API of CrystallineCohomology:CR.4/nygaard-filtration. `α_F` is `p^q·F` in degree `q`, and
`(η_p M)^q = {y ∈ p^q M^q : dy ∈ p^(q+1) M^(q+1)}`; the filtration of the file is indexed by
natural numbers `i` and `q`. -/
lemma Nygaard.mem_iff (M : DieudonneComplex.{u} p) (hM : IsSaturated M) (i q : ℕ)
    (x : M.complex.X (q:ℤ)) :
    x ∈ Nygaard M hM i q ↔
      ∃ y : M.complex.X (q:ℤ), (p^q) • M.F (q:ℤ) x = (p^i) • y := by sorry
lemma Nygaard.decalage (M : DieudonneComplex.{u} p) (hM : IsSaturated M) (i q : ℕ) :
    Set.BijOn (fun x : M.complex.X (q:ℤ) => (p^q) • M.F (q:ℤ) x)
      (Nygaard M hM i q : Set (M.complex.X (q:ℤ)))
      {y | (∃ z : M.complex.X (q:ℤ), y = (p^i) • z) ∧ (∃ z : M.complex.X (q:ℤ), y = (p^q) • z) ∧
        ∃ w : M.complex.X ((q:ℤ)+1),
          (M.complex.d (q:ℤ) ((q:ℤ)+1)).hom y = (p^(q+1)) • w} := by sorry
lemma Nygaard.dividedF_d (M : DieudonneComplex.{u} p) (hM : IsSaturated M) (i q : ℕ)
    (x : Nygaard M hM i q) :
    ∃ h : (M.complex.d (q:ℤ) ((q+1 : ℕ) : ℤ)).hom x.val ∈ Nygaard M hM i (q+1),
      (M.complex.d (q:ℤ) ((q+1 : ℕ) : ℤ)).hom (Nygaard.dividedF M hM i q x) =
        Nygaard.dividedF M hM i (q+1) ⟨_, h⟩ := by sorry
lemma Nygaard.map {M N : DieudonneComplex.{u} p} (f : DieudonneHom M N)
    (hM : IsSaturated M) (hN : IsSaturated N) (i q : ℕ) (x : M.complex.X (q:ℤ))
    (hx : x ∈ Nygaard M hM i q) :
    ∃ h : (f.toCochainHom.f (q:ℤ)).hom x ∈ Nygaard N hN i q,
      (f.toCochainHom.f (q:ℤ)).hom (Nygaard.dividedF M hM i q ⟨x, hx⟩) =
        Nygaard.dividedF N hN i q ⟨(f.toCochainHom.f (q:ℤ)).hom x, h⟩ := by sorry
lemma Nygaard.mul (D : DieudonneAlgebra.{u} p) (hD : IsSaturated D.toDieudonneComplex)
    (i j a b : ℕ) (x : D.complex.X (a:ℤ)) (y : D.complex.X (b:ℤ))
    (hx : x ∈ Nygaard D.toDieudonneComplex hD i a)
    (hy : y ∈ Nygaard D.toDieudonneComplex hD j b) :
    ∃ (z : D.complex.X ((a+b : ℕ) : ℤ))
      (hz : z ∈ Nygaard D.toDieudonneComplex hD (i+j) (a+b)),
      DirectSum.of (fun n : ℤ => D.complex.X n) ((a+b : ℕ) : ℤ) z =
        DirectSum.of (fun n : ℤ => D.complex.X n) (a:ℤ) x *
          DirectSum.of (fun n : ℤ => D.complex.X n) (b:ℤ) y ∧
      DirectSum.of (fun n : ℤ => D.complex.X n) ((a+b : ℕ) : ℤ)
          (Nygaard.dividedF D.toDieudonneComplex hD (i+j) (a+b) ⟨z, hz⟩) =
        DirectSum.of (fun n : ℤ => D.complex.X n) (a:ℤ)
            (Nygaard.dividedF D.toDieudonneComplex hD i a ⟨x, hx⟩) *
          DirectSum.of (fun n : ℤ => D.complex.X n) (b:ℤ)
            (Nygaard.dividedF D.toDieudonneComplex hD j b ⟨y, hy⟩) := by sorry
lemma Nygaard.gr_iso (M : DieudonneComplex.{u} p) (hM : IsSaturated M) (i q : ℕ) :
    (∀ x : Nygaard M hM i q, x.val ∈ Nygaard M hM (i+1) q ↔
      ∃ y : M.complex.X (q:ℤ), Nygaard.dividedF M hM i q x = p • y) ∧
    (q < i → ∀ y : M.complex.X (q:ℤ), ∃ (x : Nygaard M hM i q) (z : M.complex.X (q:ℤ)),
      Nygaard.dividedF M hM i q x = y + p • z) ∧
    (q = i → ∀ y : M.complex.X (q:ℤ),
      (∃ w : M.complex.X ((q:ℤ)+1), (M.complex.d (q:ℤ) ((q:ℤ)+1)).hom y = p • w) ↔
        ∃ (x : Nygaard M hM i q) (z : M.complex.X (q:ℤ)),
          Nygaard.dividedF M hM i q x = y + p • z) ∧
    (i < q → Nygaard M hM (i+1) q = ⊤ ∧ Nygaard M hM i q = ⊤) := by sorry

end NygaardAPI

section DieudonneAlgebraHom
variable {p : ℕ}

/- Identity, composition and degree-zero component of maps of Dieudonné algebras (those of the
underlying `DieudonneHom`), and the map induced on `A⁰/VA⁰`. -/
def DieudonneAlgebra.Hom.id (D : DieudonneAlgebra.{u} p) : DieudonneAlgebra.Hom D D where
  toDieudonneHom := DieudonneHom.id D.toDieudonneComplex
  one := by sorry
  mul := by sorry
def DieudonneAlgebra.Hom.comp {D E G : DieudonneAlgebra.{u} p} (g : DieudonneAlgebra.Hom E G)
    (f : DieudonneAlgebra.Hom D E) : DieudonneAlgebra.Hom D G where
  toDieudonneHom := g.toDieudonneHom.comp f.toDieudonneHom
  one := by sorry
  mul := by sorry
/-- The degree-zero component of a map of Dieudonné algebras, as a ring homomorphism. -/
def DieudonneAlgebra.Hom.degreeZero {D E : DieudonneAlgebra.{u} p}
    (f : DieudonneAlgebra.Hom D E) : D.complex.X 0 →+* E.complex.X 0 where
  toFun := (f.toCochainHom.f 0).hom
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry
/-- The map `A⁰/VA⁰ → B⁰/VB⁰` induced by a map of strict Dieudonné algebras. -/
def StrictDieudonneAlgebra.residueMap {D E : StrictDieudonneAlgebra.{u} p}
    (f : DieudonneAlgebra.Hom D.toDieudonneAlgebra E.toDieudonneAlgebra) :
    D.residue →+* E.residue :=
  Ideal.Quotient.lift _ ((Ideal.Quotient.mk _).comp f.degreeZero) (by sorry)

end DieudonneAlgebraHom

section DieudonneAlgebraAPI
variable {p : ℕ} [Fact p.Prime]

/- API of CrystallineCohomology:CR.4/dieudonne-algebra: saturation and completion of
Dieudonné algebras with their universal properties. -/
/-- `Sat(A)` with its structure of Dieudonné algebra; `sat_eq_saturation` identifies its
underlying Dieudonné complex and unit with `Saturation` and `Saturation.unit`. -/
def DieudonneAlgebra.sat (D : DieudonneAlgebra.{u} p) : DieudonneAlgebra.{u} p := by sorry
lemma DieudonneAlgebra.sat_saturated (D : DieudonneAlgebra.{u} p) :
    IsSaturated D.sat.toDieudonneComplex := by sorry
def DieudonneAlgebra.satUnit (D : DieudonneAlgebra.{u} p) : DieudonneAlgebra.Hom D D.sat := by sorry
lemma DieudonneAlgebra.sat_eq_saturation (D : DieudonneAlgebra.{u} p) :
    ∃ e : DieudonneHom (Saturation D.toDieudonneComplex) D.sat.toDieudonneComplex,
      e.comp (Saturation.unit D.toDieudonneComplex) = D.satUnit.toDieudonneHom ∧
      ∀ n : ℤ, Function.Bijective ((e.toCochainHom.f n).hom) := by sorry
lemma DieudonneAlgebra.sat_lift (D E : DieudonneAlgebra.{u} p)
    (hE : IsSaturated E.toDieudonneComplex) (f : DieudonneAlgebra.Hom D E) :
    ∃! g : DieudonneAlgebra.Hom D.sat E, g.comp D.satUnit = f := by sorry

/-- `W(A)` for a saturated Dieudonné algebra `A`, a strict Dieudonné algebra;
`W_eq_completion` identifies its underlying Dieudonné complex and unit `ρ_A` with
`Completion` and `Completion.unit`. -/
def DieudonneAlgebra.W (D : DieudonneAlgebra.{u} p) (hD : IsSaturated D.toDieudonneComplex) :
    StrictDieudonneAlgebra.{u} p := by sorry
def DieudonneAlgebra.WUnit (D : DieudonneAlgebra.{u} p) (hD : IsSaturated D.toDieudonneComplex) :
    DieudonneAlgebra.Hom D (D.W hD).toDieudonneAlgebra := by sorry
lemma DieudonneAlgebra.W_eq_completion (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) :
    ∃ e : DieudonneHom (Completion D.toDieudonneComplex hD) (D.W hD).toDieudonneComplex,
      e.comp (Completion.unit D.toDieudonneComplex hD) = (D.WUnit hD).toDieudonneHom ∧
      ∀ n : ℤ, Function.Bijective ((e.toCochainHom.f n).hom) := by sorry
lemma DieudonneAlgebra.W_lift (D : DieudonneAlgebra.{u} p)
    (hD : IsSaturated D.toDieudonneComplex) (E : StrictDieudonneAlgebra.{u} p)
    (f : DieudonneAlgebra.Hom D E.toDieudonneAlgebra) :
    ∃! g : DieudonneAlgebra.Hom (D.W hD).toDieudonneAlgebra E.toDieudonneAlgebra,
      g.comp (D.WUnit hD) = f := by sorry
/-- `W ∘ Sat` is left adjoint to the inclusion of strict Dieudonné algebras: the composite
unit `A → Sat(A) → W(Sat(A))` is universal among maps to strict Dieudonné algebras. -/
lemma DieudonneAlgebra.W_sat_lift (D : DieudonneAlgebra.{u} p) (E : StrictDieudonneAlgebra.{u} p)
    (f : DieudonneAlgebra.Hom D E.toDieudonneAlgebra) :
    ∃! g : DieudonneAlgebra.Hom (D.sat.W D.sat_saturated).toDieudonneAlgebra
        E.toDieudonneAlgebra,
      g.comp ((D.sat.WUnit D.sat_saturated).comp D.satUnit) = f := by sorry

end DieudonneAlgebraAPI

/-- A commutative ring is seminormal (Swan) if it is reduced and every pair `x`, `y` with
`x² = y³` is of the form `x = t³`, `y = t²`. -/
def IsSeminormal (S : Type*) [CommRing S] : Prop :=
  IsReduced S ∧ ∀ x y : S, x ^ 2 = y ^ 3 → ∃ t : S, x = t ^ 3 ∧ y = t ^ 2

section SaturatedWittAPI
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [Algebra (ZMod p) R]

/- API of CrystallineCohomology:CR.4/saturated-de-rham-witt. -/
lemma satDRW_degree0_F (x : (saturatedDRW p R).complex.X 0) :
    satDRW_degree0 p R ((saturatedDRW p R).F 0 x) =
        WittVector.frobenius (satDRW_degree0 p R x) ∧
      satDRW_degree0 p R
          (verschiebung (saturatedDRW p R).toDieudonneComplex (saturatedDRW p R).saturated 0 x) =
        WittVector.verschiebung (satDRW_degree0 p R x) := by sorry
/- `satDRW_unit` is the unit of the adjunction: the bijection `satDRW_lift` is composition
with it; and it factors through `R_red`. -/
lemma satDRW_lift_apply (D : StrictDieudonneAlgebra.{u} p)
    (f : DieudonneAlgebra.Hom (saturatedDRW p R).toDieudonneAlgebra D.toDieudonneAlgebra) :
    satDRW_lift p R D f =
      (StrictDieudonneAlgebra.residueMap f).comp (satDRW_unit p R) := by sorry
lemma satDRW_unit_red :
    ∃ g : R ⧸ nilradical R →+* (saturatedDRW p R).residue,
      g.comp (Ideal.Quotient.mk (nilradical R)) = satDRW_unit p R := by sorry
lemma satDRW_residue_seminormal : IsSeminormal (saturatedDRW p R).residue := by sorry
lemma satDRW_red (q : ℤ) :
    Function.Bijective
      ((satDRW_map p R (R ⧸ nilradical R)
        (Ideal.Quotient.mk (nilradical R))).toCochainHom.f q).hom := by sorry
-- TauCeti.Crystalline.test_satDRW_cusp
example (S : Subalgebra (ZMod p) (Polynomial (ZMod p)))
    (hS : S = Algebra.adjoin (ZMod p) {Polynomial.X ^ 2, Polynomial.X ^ 3})
    (x y : S) (hx : (x : Polynomial (ZMod p)) = Polynomial.X ^ 3)
    (hy : (y : Polynomial (ZMod p)) = Polynomial.X ^ 2) :
    (∀ q : ℤ, Function.Bijective
      ((satDRW_map p S (Polynomial (ZMod p)) S.val.toRingHom).toCochainHom.f q).hom) ∧
    Subsingleton ((saturatedDRW p S).complex.X 2) ∧
    exteriorPower.ιMulti S 2
      ![KaehlerDifferential.D (ZMod p) S x, KaehlerDifferential.D (ZMod p) S y] ≠ 0 ∧
    ∃ s : (saturatedDRW p S).residue,
      satDRW_unit p S x = s ^ 3 ∧ satDRW_unit p S y = s ^ 2 ∧
      StrictDieudonneAlgebra.residueMap (satDRW_map p S (Polynomial (ZMod p)) S.val.toRingHom) s =
        satDRW_unit p (Polynomial (ZMod p)) Polynomial.X := by sorry

-- CrystallineCohomology:CR.4/saturated-seminormalisation
theorem satDRW_residue_seminormalization :
    (IsSeminormal (saturatedDRW p R).residue ∧
      ∀ (T : Type v) [CommRing T], IsSeminormal T → ∀ f : R →+* T,
        ∃! g : (saturatedDRW p R).residue →+* T, g.comp (satDRW_unit p R) = f) ∧
    (Function.Bijective (satDRW_unit p R) ↔ IsSeminormal R) ∧
    (∀ (R' : Type u) [CommRing R'] [Algebra (ZMod p) R'] (f : R →+* R'),
      Function.Bijective (StrictDieudonneAlgebra.residueMap (satDRW_map p R R' f)) →
        ∀ q : ℤ, Function.Bijective ((satDRW_map p R R' f).toCochainHom.f q).hom) ∧
    (∀ D : StrictDieudonneAlgebra.{u} p,
      (∀ q : ℤ, Function.Bijective
        (((satDRW_lift p D.residue D).symm (RingHom.id D.residue)).toCochainHom.f q).hom) →
        IsSeminormal D.residue) := by sorry

end SaturatedWittAPI

section ClassicalDRW
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [Algebra (ZMod p) R]

/-- An `R`-framed V-pro-complex (Bhatt–Lurie–Mathew, Definition 4.4.1) for an `𝔽_p`-algebra
`R`: an inverse system `level r` (`r ≥ 0`) of commutative differential graded algebras
(`WittDGA`: strictly commutative, zero in negative degrees), additive maps
`V : A_r → A_(r+1)` in every degree, and a compatible family of ring homomorphisms
`β r : W(R) → A_r⁰`, that is, a ring homomorphism from `W(R)` to the inverse limit. The fields
`lengthZero` (with `WittDGA.nonnegative`), `RV`, `β_V`, `V_mul_d`, `V_teich` are the axioms
(a)–(e). A Frobenius is not part of the structure. -/
structure FramedVProComplex (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    [Algebra (ZMod p) R] where
  level : ℕ → WittDGA.{u}
  restriction : ∀ r, WittDGA.Hom (level (r+1)) (level r)
  V : ∀ r q, (level r).complex.X q →+ (level (r+1)).complex.X q
  β : ∀ r, WittVector p R →+* (level r).complex.X 0
  β_restriction : ∀ r (x : WittVector p R),
    ((restriction r).chain.f 0).hom (β (r+1) x) = β r x
  lengthZero : ∀ q : ℤ, Subsingleton ((level 0).complex.X q)
  RV : ∀ r q (x : (level (r+1)).complex.X q),
    ((restriction (r+1)).chain.f q).hom (V (r+1) q x) = V r q (((restriction r).chain.f q).hom x)
  β_V : ∀ r (x : WittVector p R), β (r+1) (WittVector.verschiebung x) = V r 0 (β r x)
  V_mul_d : ∀ r i j (x : (level r).complex.X i) (y : (level r).complex.X j),
    V r (i+(j+1)) (GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n) x
        (((level r).complex.d j (j+1)).hom y)) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n) (V r i x)
        (((level (r+1)).complex.d j (j+1)).hom (V r j y))
  V_teich : ∀ r i (x : (level r).complex.X i) (a : R),
    GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n) (V r i x)
        (((level (r+1)).complex.d 0 1).hom (β (r+1) (WittVector.teichmuller p a))) =
      V r (i+1) (GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n) x
        (GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n)
          ((β r (WittVector.teichmuller p a))^(p-1))
          (((level r).complex.d 0 1).hom (β r (WittVector.teichmuller p a)))))

/-- A V-pro-complex in the sense of Illusie (I.1.1) whose ring `M⁰_1` is the `𝔽_p`-algebra `R`:
an inverse system `level r` (`r ≥ 0`, `level 0 = 0`) of commutative differential graded algebras
with `M⁰_r = W_r(R)` (`degreeZero`, the restriction maps being the restriction of Witt vectors
in degree 0), and additive maps `V` that commute with restriction (`RV`), are the Verschiebung
of Witt vectors in degree 0 (`degreeZero_V`) and satisfy `V(x·dy) = V(x)·dV(y)` (`V_mul_d`)
and `(Vy)·d[x] = V([x]^(p−1)·y)·dV[x]` for `x ∈ R`, `y ∈ W_r(R)` (`V_teich`). -/
structure IllusieVProComplex (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    [Algebra (ZMod p) R] where
  level : ℕ → WittDGA.{u}
  restriction : ∀ r, WittDGA.Hom (level (r+1)) (level r)
  V : ∀ r q, (level r).complex.X q →+ (level (r+1)).complex.X q
  degreeZero : ∀ r, TruncatedWittVector p r R ≃+* (level r).complex.X 0
  lengthZero : ∀ q : ℤ, Subsingleton ((level 0).complex.X q)
  degreeZero_restriction : ∀ r (a : TruncatedWittVector p (r+1) R),
    ((restriction r).chain.f 0).hom (degreeZero (r+1) a) =
      degreeZero r (TruncatedWittVector.truncate (Nat.le_succ r) a)
  degreeZero_V : ∀ r (a : TruncatedWittVector p r R),
    V r 0 (degreeZero r a) = degreeZero (r+1) (finiteWittV p R r a)
  RV : ∀ r q (x : (level (r+1)).complex.X q),
    ((restriction (r+1)).chain.f q).hom (V (r+1) q x) = V r q (((restriction r).chain.f q).hom x)
  V_mul_d : ∀ r i j (x : (level r).complex.X i) (y : (level r).complex.X j),
    V r (i+(j+1)) (GradedMonoid.GMul.mul (A:=fun n : ℤ => (level r).complex.X n) x
        (((level r).complex.d j (j+1)).hom y)) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n) (V r i x)
        (((level (r+1)).complex.d j (j+1)).hom (V r j y))
  V_teich : ∀ r (x : R) (y : TruncatedWittVector p r R),
    GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n) (V r 0 (degreeZero r y))
        (((level (r+1)).complex.d 0 1).hom (degreeZero (r+1) (finiteTeich p R (r+1) x))) =
      GradedMonoid.GMul.mul (A:=fun n : ℤ => (level (r+1)).complex.X n)
        (V r 0 (degreeZero r (finiteTeich p R r x ^ (p-1) * y)))
        (((level (r+1)).complex.d 0 1).hom (V r 0 (degreeZero r (finiteTeich p R r x))))

variable {p R}
/-- A morphism of `R`-framed V-pro-complexes: maps of differential graded algebras commuting
with the restriction maps, with `V` and with `β`. -/
structure FramedVProComplex.Hom (P Q : FramedVProComplex p R) where
  map : ∀ r, WittDGA.Hom (P.level r) (Q.level r)
  β : ∀ r x, ((map r).chain.f 0).hom (P.β r x) = Q.β r x
  res : ∀ r q x, ((map r).chain.f q).hom (((P.restriction r).chain.f q).hom x) =
    ((Q.restriction r).chain.f q).hom (((map (r+1)).chain.f q).hom x)
  V : ∀ r q x, ((map (r+1)).chain.f q).hom (P.V r q x) = Q.V r q (((map r).chain.f q).hom x)
/-- A morphism of framed V-pro-complexes over a homomorphism `f : R → R'` of `𝔽_p`-algebras:
as `FramedVProComplex.Hom`, with `β` compared through `W(f)`. -/
structure FramedVProComplex.HomOver {R' : Type u} [CommRing R'] [Algebra (ZMod p) R']
    (P : FramedVProComplex p R) (Q : FramedVProComplex p R') (f : R →+* R') where
  map : ∀ r, WittDGA.Hom (P.level r) (Q.level r)
  β : ∀ r x, ((map r).chain.f 0).hom (P.β r x) = Q.β r (WittVector.map f x)
  res : ∀ r q x, ((map r).chain.f q).hom (((P.restriction r).chain.f q).hom x) =
    ((Q.restriction r).chain.f q).hom (((map (r+1)).chain.f q).hom x)
  V : ∀ r q x, ((map (r+1)).chain.f q).hom (P.V r q x) = Q.V r q (((map r).chain.f q).hom x)
/-- Maps of differential graded algebras from an `R`-framed V-pro-complex to a V-pro-complex of
Illusie with `M⁰_1 = S`, commuting with restriction and `V` and equal to `W_r(f)` in degree 0,
for a ring homomorphism `f : R → S`. -/
structure FramedVProComplex.HomToIllusie {S : Type u} [CommRing S] [Algebra (ZMod p) S]
    (P : FramedVProComplex p R) (M : IllusieVProComplex p S) (f : R →+* S) where
  map : ∀ r, WittDGA.Hom (P.level r) (M.level r)
  degreeZero : ∀ r (x : WittVector p R), ((map r).chain.f 0).hom (P.β r x) =
    M.degreeZero r (WittVector.truncate r (WittVector.map f x))
  res : ∀ r q x, ((map r).chain.f q).hom (((P.restriction r).chain.f q).hom x) =
    ((M.restriction r).chain.f q).hom (((map (r+1)).chain.f q).hom x)
  V : ∀ r q x, ((map (r+1)).chain.f q).hom (P.V r q x) = M.V r q (((map r).chain.f q).hom x)
variable (p R)

-- CrystallineCohomology:CR.4/classical-de-rham-witt
def classicalDRW : FramedVProComplex p R := by sorry
lemma classicalDRW_lift (P : FramedVProComplex p R) :
    ∃ f : FramedVProComplex.Hom (classicalDRW p R) P,
      ∀ g : FramedVProComplex.Hom (classicalDRW p R) P, g = f := by sorry
lemma classicalDRW_lift_degreeZero {S : Type u} [CommRing S] [Algebra (ZMod p) S]
    (M : IllusieVProComplex p S) (f : R →+* S) :
    ∃ g : FramedVProComplex.HomToIllusie (classicalDRW p R) M f,
      ∀ g' : FramedVProComplex.HomToIllusie (classicalDRW p R) M f, g' = g := by sorry
def classicalDRW_zero (r : ℕ) :
    TruncatedWittVector p r R ≃+* ((classicalDRW p R).level r).complex.X 0 := by sorry
lemma classicalDRW_zero_truncate (r : ℕ) (x : WittVector p R) :
    classicalDRW_zero p R r (WittVector.truncate r x) = (classicalDRW p R).β r x := by sorry
/- `Ω^n_R` is the exterior power `⋀[R]^n Ω[R⁄ℤ]` of the module of absolute Kähler
differentials; the comparison with `W_1Ω^n_R` is `a·dx_1∧⋯∧dx_n ↦ a·dx_1⋯dx_n`, where `R` maps to
`W_1Ω⁰_R` by `a ↦ β_1([a])`. -/
def classicalDRW_one (n : ℕ) :
    ⋀[R]^n Ω[R⁄ℤ] ≃+ ((classicalDRW p R).level 1).complex.X (n : ℤ) := by sorry
lemma classicalDRW_one_apply (n : ℕ) (a : R) (x : Fin n → R) :
    DirectSum.of (fun m : ℤ => ((classicalDRW p R).level 1).complex.X m) (n : ℤ)
        (classicalDRW_one p R n
          (a • exteriorPower.ιMulti R n fun k => KaehlerDifferential.D ℤ R (x k))) =
      DirectSum.of (fun m : ℤ => ((classicalDRW p R).level 1).complex.X m) 0
          ((classicalDRW p R).β 1 (WittVector.teichmuller p a)) *
        (List.ofFn fun k =>
          DirectSum.of (fun m : ℤ => ((classicalDRW p R).level 1).complex.X m) 1
            ((((classicalDRW p R).level 1).complex.d 0 1).hom
              ((classicalDRW p R).β 1 (WittVector.teichmuller p (x k))))).prod := by sorry
lemma classicalDRW_generated (r : ℕ) :
    (∀ (q : ℕ) (x : ((classicalDRW p R).level r).complex.X (q : ℤ)),
      DirectSum.of (fun n : ℤ => ((classicalDRW p R).level r).complex.X n) (q : ℤ) x ∈
        AddSubgroup.closure {z | ∃ (ξ : WittVector p R) (η : Fin q → WittVector p R),
          z = DirectSum.of (fun n : ℤ => ((classicalDRW p R).level r).complex.X n) 0
                ((classicalDRW p R).β r ξ) *
              (List.ofFn fun k =>
                DirectSum.of (fun n : ℤ => ((classicalDRW p R).level r).complex.X n) 1
                  ((((classicalDRW p R).level r).complex.d 0 1).hom
                    ((classicalDRW p R).β r (η k)))).prod}) ∧
    ∀ q : ℤ, Function.Surjective ((((classicalDRW p R).restriction r).chain.f q).hom) := by sorry
def classicalDRW_map {R R' : Type u} [CommRing R] [Algebra (ZMod p) R] [CommRing R']
    [Algebra (ZMod p) R'] (f : R →+* R') :
    FramedVProComplex.HomOver (classicalDRW p R) (classicalDRW p R') f := by sorry
lemma classicalDRW_map_id (r : ℕ) :
    ((classicalDRW_map p (RingHom.id R)).map r).chain = 𝟙 _ := by sorry
lemma classicalDRW_map_comp {R R' R'' : Type u} [CommRing R] [Algebra (ZMod p) R] [CommRing R']
    [Algebra (ZMod p) R'] [CommRing R''] [Algebra (ZMod p) R''] (f : R →+* R') (g : R' →+* R'')
    (r : ℕ) :
    ((classicalDRW_map p (g.comp f)).map r).chain =
      ((classicalDRW_map p f).map r).chain ≫ ((classicalDRW_map p g).map r).chain := by sorry
/-- An F–V procomplex for `R/A`, with `R` an `𝔽_p`-algebra, is an `R`-framed V-pro-complex:
forget `F`, and let `β r` be the projection `W(R) → W_r(R)` followed by `λ_r`. -/
def RelativeWittComplex.toFramedVProComplex {A : Type u} [CommRing A] [Algebra A R]
    (P : RelativeWittComplex p A R) : FramedVProComplex p R where
  level := P.level
  restriction := P.restriction
  V := P.V
  β := fun r => (P.coefficient r).comp (WittVector.truncate r)
  β_restriction := by sorry
  lengthZero := by sorry
  RV := by sorry
  β_V := by sorry
  V_mul_d := by sorry
  V_teich := by sorry
/- The packet's base is `𝔽_p`. The base and the algebra of `RelativeWittComplex` lie in one
universe, so the map is declared for every base `A` in the universe of `R`; it is surjective
for every base, and bijective when the base is a copy of `𝔽_p` (`e : ZMod p ≃+* A`; for
`R : Type` this is `A = ZMod p` with `hA = zmod_pLocal p`). The map is a
`FramedVProComplex.Hom`, so it commutes with `V` and restriction. -/
def classicalDRW_toRelative (A : Type u) [CommRing A] [Algebra A R]
    (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) :
    FramedVProComplex.Hom (classicalDRW p R)
      (RelativeWittComplex.toFramedVProComplex p R (relativeDRW p A R hA)) := by sorry
lemma classicalDRW_toRelative_surjective (A : Type u) [CommRing A] [Algebra A R]
    (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) (r : ℕ) (q : ℤ) :
    Function.Surjective ((((classicalDRW_toRelative p R A hA).map r).chain.f q).hom) := by sorry
lemma classicalDRW_toRelative_bijective (A : Type u) [CommRing A] [Algebra A R]
    (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) (e : ZMod p ≃+* A) (r : ℕ) (q : ℤ) :
    Function.Bijective ((((classicalDRW_toRelative p R A hA).map r).chain.f q).hom) := by sorry
-- TauCeti.Crystalline.test_classicalDRW_perfect
example [PerfectRing R p] (r : ℕ) :
    (∀ n : ℤ, 0 < n → Subsingleton (((classicalDRW p R).level r).complex.X n)) ∧
      Function.Surjective ((classicalDRW p R).β r) ∧
      ∀ x : WittVector p R, (classicalDRW p R).β r x = 0 ↔ WittVector.truncate r x = 0 := by sorry
-- TauCeti.Crystalline.test_classicalDRW_length_one
example :
    Function.Bijective (fun a : Polynomial (ZMod p) =>
      (classicalDRW p (Polynomial (ZMod p))).β 1 (WittVector.teichmuller p a)) ∧
    (∀ ω : ((classicalDRW p (Polynomial (ZMod p))).level 1).complex.X 1,
      ∃! a : Polynomial (ZMod p), ω =
        GradedMonoid.GMul.mul
          (A:=fun n : ℤ => ((classicalDRW p (Polynomial (ZMod p))).level 1).complex.X n)
          ((classicalDRW p (Polynomial (ZMod p))).β 1 (WittVector.teichmuller p a))
          ((((classicalDRW p (Polynomial (ZMod p))).level 1).complex.d 0 1).hom
            ((classicalDRW p (Polynomial (ZMod p))).β 1
              (WittVector.teichmuller p Polynomial.X)))) ∧
    (((classicalDRW p (Polynomial (ZMod p))).level 1).complex.d 0 1).hom
        ((classicalDRW p (Polynomial (ZMod p))).β 1 (WittVector.teichmuller p Polynomial.X)) ≠ 0 ∧
    ∀ n : ℤ, 2 ≤ n →
      Subsingleton (((classicalDRW p (Polynomial (ZMod p))).level 1).complex.X n) := by sorry
-- TauCeti.Crystalline.test_classicalDRW_dual_numbers
example (r : ℕ) :
    (classicalDRW p (TrivSqZeroExt (ZMod p) (ZMod p))).β (r+1)
        (WittVector.teichmuller p (TrivSqZeroExt.inr 1)) ≠ 0 ∧
    Nontrivial (((classicalDRW p (TrivSqZeroExt (ZMod p) (ZMod p))).level 1).complex.X 1) ∧
    ¬ Function.Bijective ((((classicalDRW_map p
        (TrivSqZeroExt.fstHom (ZMod p) (ZMod p) (ZMod p)).toRingHom).map (r+1)).chain.f 0).hom) ∧
    ∀ q : ℤ, Function.Bijective ((satDRW_map p (TrivSqZeroExt (ZMod p) (ZMod p)) (ZMod p)
        (TrivSqZeroExt.fstHom (ZMod p) (ZMod p) (ZMod p)).toRingHom).toCochainHom.f q).hom := by sorry
-- TauCeti.Crystalline.test_classicalDRW_cusp
example (S : Subalgebra (ZMod p) (Polynomial (ZMod p)))
    (hS : S = Algebra.adjoin (ZMod p) {Polynomial.X ^ 2, Polynomial.X ^ 3})
    (x y : S) (hx : (x : Polynomial (ZMod p)) = Polynomial.X ^ 3)
    (hy : (y : Polynomial (ZMod p)) = Polynomial.X ^ 2) :
    GradedMonoid.GMul.mul (A:=fun n : ℤ => ((classicalDRW p S).level 1).complex.X n)
        ((((classicalDRW p S).level 1).complex.d 0 1).hom
          ((classicalDRW p S).β 1 (WittVector.teichmuller p x)))
        ((((classicalDRW p S).level 1).complex.d 0 1).hom
          ((classicalDRW p S).β 1 (WittVector.teichmuller p y))) ≠ 0 ∧
      Subsingleton ((saturatedDRW p S).complex.X 2) := by sorry

end ClassicalDRW

section ContinuousWitt
variable (p : ℕ) [Fact p.Prime] (A R : Type u) [CommRing A] [CommRing R] [Algebra A R]

/- CrystallineCohomology:CR.4/continuous-relative-witt: the tower of degreewise `p`-adic
completions, as an F–V procomplex for `R/A`, with the map from the relative de Rham–Witt
complex. `continuousWitt_fromRelative_completion` characterises it: every term is `p`-adically
separated and complete and the map is an isomorphism modulo `p^s` for every `s`. -/
-- CrystallineCohomology:CR.4/continuous-relative-witt
def continuousRelativeWitt (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) :
    RelativeWittComplex p A R := by sorry
def continuousWitt_fromRelative (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A)) :
    RelativeWittComplex.Hom (relativeDRW p A R hA) (continuousRelativeWitt p A R hA) := by sorry
lemma continuousWitt_fromRelative_unique (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (g : RelativeWittComplex.Hom (relativeDRW p A R hA) (continuousRelativeWitt p A R hA)) :
    g = continuousWitt_fromRelative p A R hA := by sorry
lemma continuousWitt_fromRelative_completion (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (r : ℕ) (q : ℤ) :
    IsAdicComplete (Ideal.span {(p : ℤ)})
        (((continuousRelativeWitt p A R hA).level r).complex.X q) ∧
    ∀ s : ℕ,
      (∀ y : ((continuousRelativeWitt p A R hA).level r).complex.X q,
        ∃ (x : ((relativeDRW p A R hA).level r).complex.X q)
          (z : ((continuousRelativeWitt p A R hA).level r).complex.X q),
          y = (((continuousWitt_fromRelative p A R hA).map r).chain.f q).hom x + (p^s) • z) ∧
      ∀ x : ((relativeDRW p A R hA).level r).complex.X q,
        (∃ z : ((continuousRelativeWitt p A R hA).level r).complex.X q,
          (((continuousWitt_fromRelative p A R hA).map r).chain.f q).hom x = (p^s) • z) →
        ∃ w : ((relativeDRW p A R hA).level r).complex.X q, x = (p^s) • w := by sorry
lemma continuousWitt_fromRelative_bijective (hA : ∀ n : ℕ, Nat.Coprime n p → IsUnit (n : A))
    (hp : IsNilpotent (p : A)) (r : ℕ) (q : ℤ) :
    Function.Bijective
      ((((continuousWitt_fromRelative p A R hA).map r).chain.f q).hom) := by sorry

end ContinuousWitt

end TauCeti.Crystalline


namespace TauCeti.Crystalline
open CategoryTheory AlgebraicGeometry
universe u

/- CR.4 owns this specialization before the later general décalage theory.
The normalized term is a real submodule of the pinned complex, in every integer degree. -/
def PDecalageTerm (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ) :
    Submodule ℤ (M.X n) where
  carrier := {x | ∃ y : M.X (n+1), (M.d n (n+1)).hom x = p • y}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

def PTermwiseTorsionFree (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) : Prop :=
  ∀ n, Function.Injective (fun x : M.X n => p • x)

def pDecalageDiff (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (n : ℤ) :
    PDecalageTerm p M n →ₗ[ℤ] PDecalageTerm p M (n+1) := by sorry

-- CrystallineCohomology:CR.4/principal-p-decalage
def principal_p_decalage (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) : CochainComplex (ModuleCat.{u} ℤ) ℤ :=
  CochainComplex.of (fun n => ModuleCat.of ℤ (PDecalageTerm p M n))
    (fun n => ModuleCat.ofHom (pDecalageDiff p M hp n)) (by sorry)

lemma pDecalage_degree (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ)
    (x : M.X n) : x ∈ PDecalageTerm p M n ↔
      ∃ y : M.X (n+1), (M.d n (n+1)).hom x = p • y := by sorry

lemma pDecalage_d (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (n : ℤ) (x : PDecalageTerm p M n) :
    p • (pDecalageDiff p M hp n x).val = (M.d n (n+1)).hom x.val := by sorry

def pDecalage_map (p : ℕ) {M N : CochainComplex (ModuleCat.{u} ℤ) ℤ}
    (hM : PTermwiseTorsionFree p M) (hN : PTermwiseTorsionFree p N) (f : M ⟶ N) :
    principal_p_decalage p M hM ⟶ principal_p_decalage p N hN := by sorry

lemma pDecalage_map_apply (p : ℕ) {M N : CochainComplex (ModuleCat.{u} ℤ) ℤ}
    (hM : PTermwiseTorsionFree p M) (hN : PTermwiseTorsionFree p N) (f : M ⟶ N)
    (n : ℤ) (x : PDecalageTerm p M n) :
    ((pDecalage_map p hM hN f).f n x).val = (f.f n).hom x.val := by sorry

lemma pDecalage_map_id (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) : pDecalage_map p hp hp (𝟙 M) = 𝟙 _ := by sorry

lemma pDecalage_map_comp (p : ℕ) {M N P : CochainComplex (ModuleCat.{u} ℤ) ℤ}
    (hM : PTermwiseTorsionFree p M) (hN : PTermwiseTorsionFree p N)
    (hP : PTermwiseTorsionFree p P) (f : M ⟶ N) (g : N ⟶ P) :
    pDecalage_map p hM hP (f ≫ g) =
      pDecalage_map p hM hN f ≫ pDecalage_map p hN hP g := by sorry

def DieudonneComplex.alphaF {p : ℕ} (M : DieudonneComplex.{u} p)
    (hp : PTermwiseTorsionFree p M.complex) :
    M.complex ⟶ principal_p_decalage p M.complex hp := by sorry

lemma DieudonneComplex.alphaF_apply {p : ℕ} (M : DieudonneComplex.{u} p)
    (hp : PTermwiseTorsionFree p M.complex) (n : ℤ) (x : M.complex.X n) :
    ((M.alphaF hp).f n x).val = M.F n x := by sorry

def DieudonneComplex.ofAlpha (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (α : M ⟶ principal_p_decalage p M hp) :
    DieudonneComplex p where
  complex := M
  F n := { toFun := fun x => ((α.f n).hom x).val
           map_add' := by sorry
           map_smul' := by sorry }
  comm := by sorry

lemma DieudonneComplex.alphaF_ofAlpha (p : ℕ)
    (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (hp : PTermwiseTorsionFree p M)
    (α : M ⟶ principal_p_decalage p M hp) :
    (DieudonneComplex.ofAlpha p M hp α).alphaF hp = α := by sorry

lemma DieudonneComplex.alphaF_natural {p : ℕ} {M N : DieudonneComplex.{u} p}
    (hM : PTermwiseTorsionFree p M.complex) (hN : PTermwiseTorsionFree p N.complex)
    (f : DieudonneHom M N) :
    M.alphaF hM ≫ pDecalage_map p hM hN f.toCochainHom =
      f.toCochainHom ≫ N.alphaF hN := by sorry

-- TauCeti.Crystalline.test_pDecalage_zero
example (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (h : ∀ n, Subsingleton (M.X n)) (n : ℤ) :
    PDecalageTerm p M n = ⊥ := by sorry

-- TauCeti.Crystalline.test_pDecalage_two_term
example (p : ℕ) [Fact p.Prime] (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (e₀ : M.X 0 ≃ₗ[ℤ] ℤ) (e₁ : M.X 1 ≃ₗ[ℤ] ℤ)
    (hd : ∀ x, e₁ ((M.d 0 1).hom x) = (p : ℤ) * e₀ x)
    (hz : M.d 1 2 = 0) :
    PDecalageTerm p M 0 = ⊤ ∧
      Function.Bijective (pDecalageDiff p M hp 0) := by sorry

-- TauCeti.Crystalline.test_pDecalage_negative
example (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hd : M.d (-1) 0 = 0) : PDecalageTerm p M (-1) = ⊤ := by sorry

-- CR.1 étale objects share the existing PD-thickening carrier.
-- CrystallineCohomology:CR.1/etale-crystalline-site (small object component)
abbrev etale_crystalline_site (p : ℕ) (S : PDScheme.{u}) (X : Scheme.{u})
    (xS : X ⟶ S.scheme) :=
  (show ObjectProperty (CrisSite p S X xS) from fun A => Etale A.toX).FullSubcategory

def CrisSite.IsEtaleCover {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}}
    {xS : X ⟶ S.scheme} (A : CrisSite p S X xS) {ι : Type u}
    (B : ι → CrisSite p S X xS) (f : ∀ i, B i ⟶ A) : Prop :=
  (∀ i, Etale (f i).onT.hom) ∧
  (∀ i, IsPullback (f i).onU (B i).thickening.immersion
    A.thickening.immersion (f i).onT.hom) ∧
  ∀ x : A.thickening.T.scheme, ∃ i y, (f i).onT.hom y = x

-- TauCeti.Crystalline.test_etale_crystalline_identity
example {p : ℕ} {S : PDScheme.{u}} {X : Scheme.{u}} {xS : X ⟶ S.scheme}
    (A : CrisSite p S X xS) :
    A.IsEtaleCover (fun _ : PUnit => A) (fun _ => 𝟙 A) := by sorry

/- Elliptic point counts reuse the upstream model; these two examples check its
affine chart numerically. The full crystalline polynomial and slope statements
remain in the omission register until the cohomology and isocrystal APIs land. -/
open scoped Classical in
-- TauCeti.Crystalline.ellipticOrdinary_affine_count
example : (Finset.univ.filter (fun z : ZMod 5 × ZMod 5 =>
    z.2 ^ 2 = z.1 ^ 3 + z.1)).card + 1 = 4 := by sorry

open scoped Classical in
-- TauCeti.Crystalline.ellipticSupersingular_affine_count
example : (Finset.univ.filter (fun z : ZMod 3 × ZMod 3 =>
    z.2 ^ 2 = z.1 ^ 3 - z.1)).card + 1 = 4 := by sorry

end TauCeti.Crystalline


namespace TauCeti.Crystalline
open CategoryTheory
universe u

/- Cohomology modulo p is presented explicitly by lifted cocycles and
boundaries. This avoids inventing a cohomology carrier for the Bockstein. -/
def PModBoundaries (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ) :
    Submodule ℤ (PDecalageTerm p M n) where
  carrier := {x | ∃ y : M.X (n-1), ∃ z : M.X n,
    x.val = (M.d (n-1) n).hom y + p • z}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

abbrev PModCohomology (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ) :=
  PDecalageTerm p M n ⧸ PModBoundaries p M n

def pBocksteinClass (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ)
    (x : PDecalageTerm p M n) : PModCohomology p M n :=
  (PModBoundaries p M n).mkQ x

def pBocksteinDiff (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (n : ℤ) :
    PModCohomology p M n →ₗ[ℤ] PModCohomology p M (n+1) := by sorry

-- CrystallineCohomology:CR.4/p-bockstein
def p_bockstein (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) : CochainComplex (ModuleCat.{u} ℤ) ℤ :=
  CochainComplex.of (fun n => ModuleCat.of ℤ (PModCohomology p M n))
    (fun n => ModuleCat.ofHom (pBocksteinDiff p M hp n)) (by sorry)

lemma pBockstein_lift (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (n : ℤ)
    (x : PDecalageTerm p M n) (y : PDecalageTerm p M (n+1))
    (hxy : (M.d n (n+1)).hom x.val = p • y.val) :
    pBocksteinDiff p M hp n (pBocksteinClass p M n x) =
      pBocksteinClass p M (n+1) y := by sorry

lemma pBockstein_square (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (n : ℤ) :
    (pBocksteinDiff p M hp (n+1)).comp (pBocksteinDiff p M hp n) = 0 := by sorry

abbrev PQuotientTerm (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ) :=
  M.X n ⧸ LinearMap.range ((p : ℤ) • (LinearMap.id : Module.End ℤ (M.X n)))

def pQuotientDiff (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ) :
    PQuotientTerm p M n →ₗ[ℤ] PQuotientTerm p M (n+1) := by sorry

lemma pQuotientDiff_mk (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) (n : ℤ)
    (x : M.X n) :
    pQuotientDiff p M n (Submodule.Quotient.mk x) =
      Submodule.Quotient.mk ((M.d n (n+1)).hom x) := by sorry

def pQuotientComplex (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ) :
    CochainComplex (ModuleCat.{u} ℤ) ℤ :=
  CochainComplex.of (fun n => ModuleCat.of ℤ (PQuotientTerm p M n))
    (fun n => ModuleCat.ofHom (pQuotientDiff p M n)) (by sorry)

def pBockstein_decalage (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) :
    pQuotientComplex p (principal_p_decalage p M hp) ⟶ p_bockstein p M hp := by sorry

lemma pBockstein_decalage_mk (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (n : ℤ) (x : PDecalageTerm p M n) :
    ((pBockstein_decalage p M hp).f n).hom (Submodule.Quotient.mk x) =
      pBocksteinClass p M n x := by sorry

lemma pBockstein_decalage_quasiIso (p : ℕ) (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) : QuasiIso (pBockstein_decalage p M hp) := by sorry

-- TauCeti.Crystalline.test_pBockstein_p
example (p : ℕ) [Fact p.Prime] (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (e₀ : M.X 0 ≃ₗ[ℤ] ℤ) (e₁ : M.X 1 ≃ₗ[ℤ] ℤ)
    (hd : ∀ x, e₁ ((M.d 0 1).hom x) = (p : ℤ) * e₀ x)
    (hneg : M.d (-1) 0 = 0) (hpos : M.d 1 2 = 0) :
    ∃ f₀ : PModCohomology p M 0 ≃ₗ[ℤ] ZMod p,
    ∃ f₁ : PModCohomology p M 1 ≃ₗ[ℤ] ZMod p,
      ∀ x, f₁ (pBocksteinDiff p M hp 0 x) = f₀ x := by sorry

-- TauCeti.Crystalline.test_pBockstein_p_squared
example (p : ℕ) [Fact p.Prime] (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (e₀ : M.X 0 ≃ₗ[ℤ] ℤ) (e₁ : M.X 1 ≃ₗ[ℤ] ℤ)
    (hd : ∀ x, e₁ ((M.d 0 1).hom x) = (p : ℤ)^2 * e₀ x)
    (hneg : M.d (-1) 0 = 0) (hpos : M.d 1 2 = 0) :
    pBocksteinDiff p M hp 0 = 0 ∧
      (M.d 0 1).hom ≠ 0 := by sorry

-- TauCeti.Crystalline.test_pBockstein_degree_zero
example (p : ℕ) [Fact p.Prime] (M : CochainComplex (ModuleCat.{u} ℤ) ℤ)
    (hp : PTermwiseTorsionFree p M) (e₀ : M.X 0 ≃ₗ[ℤ] ℤ)
    (hz : ∀ n : ℤ, n ≠ 0 → Subsingleton (M.X n)) :
    (∀ n, pBocksteinDiff p M hp n = 0) ∧
      Nonempty (PQuotientTerm p (principal_p_decalage p M hp) 0 ≃ₗ[ℤ] ZMod p) := by sorry

end TauCeti.Crystalline

/- BEGIN EXACT PROTOTYPE OMISSION REGISTER
The following mathematical interfaces need supplier carriers or additional typed
forms. These are comments, not elaborated declarations or proof certificates.

CrystallineCohomology:CR.4/saturation-colimit

api TauCeti.Crystalline.Saturation.isColimit
For termwise p-torsion-free M, Sat(M) is the colimit in cochain complexes of M --α_F--> η_pM --η_p(α_F)--> η_pη_pM --> ⋯, its Frobenius is induced by those of the stages, and the unit M→Sat(M) is the canonical map from the first term.

CrystallineCohomology:CR.4/cartier-saturation-mod-p

declaration TauCeti.Crystalline.cartier_saturation_mod_p
If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.

CrystallineCohomology:CR.4/dieudonne-morphism

api TauCeti.Crystalline.DieudonneComplex.category
For a fixed prime p, Dieudonné complexes with DieudonneHom as morphisms, DieudonneHom.id and DieudonneHom.comp form a category DC.

api TauCeti.Crystalline.DieudonneHom.comm_F
For a morphism f:M→N, every integer n and x∈M^n: f_n(F_M x)=F_N(f_n x).

CrystallineCohomology:CR.0/envelope-base-change

declaration TauCeti.Crystalline.envelopeBaseChange
(1) Let (A,I,γ) be a divided power ring and B→B′ a homomorphism of A-algebras such that B/IB→B′/IB′ is flat and Tor₁^B(B′,B/IB)=0 (equivalently, IB⊗_B B′→B′ is injective). Then for every ideal J of B with IB⊆J the canonical map D_(B,γ)(J)⊗_B B′→D_(B′,γ)(JB′) is an isomorphism. (2) Let (B,I,γ)→(B′,I′,γ′) be a homomorphism of divided power rings and I⊆J⊆B, I′⊆J′⊆B′ ideals such that B/I→B′/I′ is flat and J′=JB′+I′. Then the canonical map D_(B,γ)(J)⊗_B B′→D_(B′,γ′)(J′) is an isomorphism. In both cases the canonical map is the B′-linear extension of the divided power morphism between the envelopes given by PDEnvelope.map.

Typed component limits: Neither part (1) nor part (2) is an executable Lean declaration in this file. The exact two tensor-product comparisons, their flatness and Tor hypotheses, and the canonical maps are recorded in the omission register. The general PDEnvelope.map is typed, but is not a proof or a typed signature of these base-change isomorphisms.

CrystallineCohomology:CR.0/completed-envelope

api TauCeti.Crystalline.completedEnvelope_reduction
For p-torsionfree D, LΛ_p(D)⊗^L Z/p^e≅D/p^e.

test TauCeti.Crystalline.test_completedEnvelope_modp
A p-killed envelope has derived completion equal to itself in degree0.

Typed component limits: The typed lift now assumes K=⋂_n(K+p^nC), expressing p-adic closedness directly in ideals. The derived-completion clauses remain dependent on DD.1; the typed inverse-limit assertion is given by its compatible-family universal property.

CrystallineCohomology:CR.1/site-morphisms

api TauCeti.Crystalline.cris_u_sections
For a sheaf F on Cris(X/S) and V⊂X open, Γ(V,u_{X/S,*}F)=Γ((V/S)_cris,F|_{Cris(V/S)}), where Cris(V/S)⊂Cris(X/S) is the full subcategory of objects (U,T,δ) with U⊂V (Stacks Lemma 60.9.5).

api TauCeti.Crystalline.cris_small_big
π∘i=id as morphisms of topoi, π_*=i⁻¹ and π⁻¹=i_!; consequently Hⁿ((X/S)_CRIS,G)=Hⁿ((X/S)_cris,i⁻¹G) for every abelian sheaf G on CRIS(X/S) and every n.

api TauCeti.Crystalline.cris_u_inverse_eval
For a Zariski sheaf G on X, u⁻¹G evaluated on (U,T,δ) is G(U), with sheafification understood. In particular (u⁻¹O_X^×)(U,T,δ)=Γ(U,O_U)^×; the homomorphism O_crys^×→u⁻¹O_X^× is restriction along U→T. This is the evaluation used in first-chern-class.

test TauCeti.Crystalline.test_crisMap_variants
For X=S=Spec F_p with the zero PD ideal, the sheaf G:(U,T,δ)↦Γ(U,Ω_{U/X}) on CRIS(X/S) has i⁻¹G=0 but G(𝔸¹_X,𝔸¹_X,∅)=F_p[t]dt≠0; hence π⁻¹i⁻¹G≠G and i∘π is not isomorphic to the identity.

CrystallineCohomology:CR.1/structure-sheaves

test TauCeti.Crystalline.test_crisStructure_affine
For T=Spec B,U=Spec(B/J), the sequence evaluates to0→J→B→B/J→0.

test TauCeti.Crystalline.test_crisStructure_sheaf_epi
For k a field of characteristic p, U=𝔸²_k∖{0} over S=Spec k with the zero PD ideal, and T the first-order deformation of U over k[ε] glued from D(x)[ε] and D(y)[ε] by 1+ε·x⁻¹y⁻¹∂_x on D(xy)[ε], with γ_n=0 on εO_T for n≥2: (U,T,γ) is an object of Cris(U/S), and x∈Γ(U,O_U) has no lift to Γ(T,O_T). So O_crys(U,T,γ)→O_X^cris(U,T,γ) is not surjective although the map of sheaves is.

CrystallineCohomology:CR.1/crystal

declaration TauCeti.Crystalline.Crystal
Let the site be CRIS(X/S) or Cris(X/S), ringed by O_crys. An O_crys-module E is a crystal in O_crys-modules if for every morphism f:(U,T,δ)→(U′,T′,δ′) the comparison map c_f:f^*E_T′=O_T⊗_{f⁻¹O_T′}f⁻¹E_T′→E_T is an isomorphism. It is a crystal in quasi-coherent modules, respectively of finite type, respectively in finite locally free modules, if moreover every restriction E_T is a quasi-coherent O_T-module, respectively quasi-coherent of finite type, respectively finite locally free. An O_crys-module is quasi-coherent as a module on the ringed site if and only if it is a crystal in quasi-coherent modules (Stacks Lemma 60.11.2). For O_crys-modules E, F one has (E⊗F)_T=E_T⊗_{O_T}F_T, and the tensor product of two crystals is a crystal; for a crystal E in finite locally free modules the dual E^∨=Hom(E,O_crys) is a crystal with (E^∨)_T=Hom_{O_T}(E_T,O_T). Crystals in finite locally free modules, with the sequences that are exact on every thickening, form a rigid tensor exact category; they are not closed under cokernels.

api TauCeti.Crystalline.Crystal.pullback_iso
The canonical f^*E_T′→E_T is O_T-linear and invertible.

api TauCeti.Crystalline.Crystal.tensor_eval
Evaluation of E⊗F is E_T⊗_(O_T)F_T.

api TauCeti.Crystalline.Crystal.dual_eval
For finite locally free E, evaluation of E∨ is Hom_(O_T)(E_T,O_T), with evaluation/coevaluation.

api TauCeti.Crystalline.Crystal.quasiCoherent_iff
An O_crys-module is quasi-coherent on the ringed site if and only if every restriction E_T is a quasi-coherent O_T-module and E is a crystal (Stacks Lemma 60.11.2).

api TauCeti.Crystalline.Crystal.pullback
For f_cris:(X/S)_cris→(Y/S′)_cris (CR.1/site-morphisms) and a crystal E in quasi-coherent O_crys-modules on Cris(Y/S′), f_cris^*E is a crystal in quasi-coherent modules on Cris(X/S); for every object (U,T,δ) of Cris(X/S) and every morphism g of CRIS(Y/S′) from (U,T,δ) to an object (V,T′,δ′) of Cris(Y/S′), (f_cris^*E)_T≅g^*E_T′. Pullback preserves finite type, finite local freeness, tensor products and duals.

test TauCeti.Crystalline.test_crystal_structure
O_crys with canonical comparisons is a rank-one crystal.

test TauCeti.Crystalline.test_crystal_constant
The crystal from a finite free base module evaluates as its tensor extension to O_T.

test TauCeti.Crystalline.test_crystal_not_abelian
For k a perfect field of characteristic p, X=Spec k and S=Spec W₂(k) with the canonical PD structure on (p): the cokernel of p:O_crys→O_crys is a crystal in quasi-coherent modules whose value on (Spec k,Spec W₂(k),γ) is k, which is not a free W₂(k)-module; so crystals in finite locally free modules are not closed under cokernels.

test TauCeti.Crystalline.test_crystal_quotient_sheaf
For X=𝔸¹_{F_p} over S=Spec F_p with the zero PD ideal, O_X^cris:(U,T,δ)↦Γ(U,O_U) is an O_crys-module with quasi-coherent restrictions and with c_f an isomorphism for every open immersion f:T→T′ with U=U′×_T′T, but it is not a crystal: for the first-order thickening p₀:T′→T=X with O_T′=O_X⊕Ω_{X/F_p}, the map c_{p₀}:O_T′→O_X is not injective.

CrystallineCohomology:CR.1/isocrystal

declaration TauCeti.Crystalline.Isocrystal
(Crystals and isocrystals over W.) Let k be a perfect field of characteristic p, W=W(k) and W_n=W/pⁿ with the canonical PD structure on (p), and Z a smooth k-scheme. Crys(Z/W_n) is the category of crystals of finite type on Cris(Z/Spec W_n), and Crys(Z/W) the category of crystals of finite type on Cris(Z/Spec W); every object of Cris(Z/Spec W) is Zariski locally an object of some Cris(Z/Spec W_n). The category of isocrystals is the ℚ-linearization Isoc(Z/W)=Crys(Z/W)_ℚ: the same objects, with Hom_Isoc(E,F)=Hom_Crys(E,F)⊗_ℤℚ (Esnault–Groechenig §2.6). Crystals in finite locally free modules form a full subcategory of Crys(Z/W); Isoc(Z/W) is formed from all crystals of finite type, not only from these. (F-crystals.) Let (A,I,γ) be a PD ring with A a ℤ_(p)-algebra and p∈I, S=Spec A, σ:A→A a PD homomorphism with σ(x)≡xᵖ mod pA for all x∈A, and X→S₀=Spec A/I a morphism of schemes with p locally nilpotent on X (Stacks Situation 60.26.1). The absolute Frobenius F_X lies over Spec σ and gives (F_X)_cris:(X/S)_cris→(X/S)_cris. An F-crystal on X/S relative to σ is a pair (E,Φ) of a crystal E in finite locally free O_crys-modules and a map Φ:(F_X)_cris^*E→E. It is nondegenerate if there exist an integer i≥0 and a map V:E→(F_X)_cris^*E with V∘Φ=pⁱ·id (Stacks Definition 60.26.2). If the rank of E is at most r, then V′=p^{ri}V satisfies V′∘Φ=Φ∘V′=p^{ri+i}·id (Stacks Remark 60.26.3). The case A=W(k) or W_n(k), I=(p), σ the Frobenius of Witt vectors is the instance over a perfect field. (F-isocrystals.) For Z smooth over perfect k, (F_Z)_cris^* induces an endofunctor F^* of Isoc(Z/W); an F-isocrystal is an object E of Isoc(Z/W) with an isomorphism Φ:F^*E→E in Isoc(Z/W), and E has a Frobenius structure in the sense of Esnault–Groechenig if (F^*)^fE≅E for some integer f≥1.

api TauCeti.Crystalline.Isocrystal.hom
For E, F in Crys(Z/W): Hom_{Isoc(Z/W)}(E,F)=Hom_{Crys(Z/W)}(E,F)⊗_ℤℚ, with composition induced from Crys(Z/W).

api TauCeti.Crystalline.FCrystal.linearize
Evaluation of Φ is linear from the Frobenius-twisted module; its associated endomorphism is σ-semilinear.

api TauCeti.Crystalline.FCrystal.dual
For a finite locally free rational crystal E with an isomorphism Φ:F^*E≅E, define E^∨=Hom(E,O_crys)[1/p]. Its Frobenius is (Φ⁻¹)^∨:F^*(E^∨)≅E^∨ using F^*(E^∨)≅(F^*E)^∨. In a basis it is the inverse transpose of Φ, and evaluation E^∨⊗E→O_crys[1/p] commutes with Frobenius. This gives a dual in F-isocrystals, without asserting an integral F-crystal structure on E^∨.

api TauCeti.Crystalline.Isocrystal.frobeniusPullback
For Z smooth over a perfect field k, pullback by (F_Z)_cris preserves crystals of finite type and induces a ℚ-linear endofunctor F^* of Isoc(Z/W).

api TauCeti.Crystalline.FCrystal.nondegenerate_twoSided
If (E,Φ) is a nondegenerate F-crystal with V∘Φ=pⁱ·id and E has rank at most r, then for every N≥ri the map V′=pᴺV satisfies V′∘Φ=Φ∘V′=p^{N+i}·id; in particular Ker Φ and Coker Φ are killed by p^{ri+i} (Stacks Remark 60.26.3).

test TauCeti.Crystalline.test_isocrystal_unit
The unit W-crystal with Witt Frobenius gives the unit F-isocrystal.

test TauCeti.Crystalline.test_isocrystal_p
For E in Crys(Z/W), multiplication by p on E is an isomorphism in Isoc(Z/W), with inverse id_E⊗p⁻¹ in Hom(E,E)⊗_ℤℚ; for E=O_crys and Z nonempty it is not an isomorphism in Crys(Z/W).

test TauCeti.Crystalline.test_isocrystal_zeroF
For X=Spec k: over A=W(k) the pair (O_crys,Φ=0) is not a nondegenerate F-crystal; over A=W_e(k) it is nondegenerate in the sense of Stacks Definition 60.26.2, with V=0 and i=e.

test TauCeti.Crystalline.test_fcrystal_p
For X=Spec k and A=W(k), (O_crys,Φ=p·can) is a nondegenerate F-crystal with V=can⁻¹ and i=1; Φ is not an isomorphism of crystals, and its image in Isoc(Spec k/W) is an isomorphism.

CrystallineCohomology:CR.1/pd-stratification

declaration TauCeti.Crystalline.PDStratification
In Stacks Situation 60.5.1 (p a prime, (A,I,γ) a PD ring with A a ℤ_(p)-algebra, A→C a ring map with IC=0 and p nilpotent in C), let P=A[x_i] be a polynomial algebra with a surjection P→C of A-algebras, and for n≥0 let J(n) be the kernel of P⊗_A⋯⊗_AP→C (n+1 factors). D(n) is the p-adic completion of the PD envelope of J(n) relative to γ, and D=D(0). The D(n) form a cosimplicial object in PD rings, and D(n) is the coproduct of n+1 copies of D in the category Cris^∧(C/A) of p-adically complete PD thickenings of C (Stacks Remark 60.5.4, Lemma 60.17.2). Write p₀,p₁:D→D(1), q₀,q₁,q₂:D→D(2) and q₀₁,q₁₂,q₀₂:D(1)→D(2) for the coprojections and Δ:D(1)→D for the codiagonal. A PD stratification on a p-adically complete D-module M is a D(1)-linear isomorphism ε:M⊗^∧_{D,p₀}D(1)→M⊗^∧_{D,p₁}D(1) such that Δ^*ε=id_M and q₀₂^*ε=q₁₂^*ε∘q₀₁^*ε as maps M⊗^∧_{D,q₀}D(2)→M⊗^∧_{D,q₂}D(2). Here ⊗^∧ is the p-adically completed tensor product.

api TauCeti.Crystalline.PDStratification.diagonal
Pulling ε to the diagonal gives id_M.

api TauCeti.Crystalline.PDStratification.cocycle
q₀₂^*ε=q₁₂^*ε∘q₀₁^*ε as maps M⊗^∧_{D,q₀}D(2)→M⊗^∧_{D,q₂}D(2).

api TauCeti.Crystalline.PDStratification.from_crystal
The crystal pullback isomorphisms on D(1) define ε and satisfy the cocycle.

api TauCeti.Crystalline.PDStratification.taylorCoefficients
For a PD stratification ε and m∈M there are unique elements θ_K(m)∈M, K running over the multi-indices of finite support, with ε(m⊗1)=Σ_Kθ_K(m)⊗∏_iξ_i^{[k_i]} in M⊗^∧_{D,p₁}D(1), where ξ_i=x_i⊗1−1⊗x_i=p₀(x_i)−p₁(x_i); the sum converges p-adically. One has θ_0=id and θ_K∘θ_L=θ_{K+L}; so the θ_i=θ_{e_i} commute and θ_K=∏_iθ_i^{k_i} (proof of Stacks Lemma 60.17.3).

test TauCeti.Crystalline.test_stratification_unit
The structure module has its canonical identity-after-base-change stratification.

test TauCeti.Crystalline.test_stratification_three
For A=F_p with the zero PD ideal, C=P=F_p[t] and M=D=F_p[t] with ε the identity of D(1)=F_p[t]⟨ξ⟩, ξ=t⊗1−1⊗t: ε(f⊗1)=p₀(f)=Σ_kp₁(f^{(k)})·ξ^{[k]} for every f, so θ_k is the k-th derivative.

test TauCeti.Crystalline.test_stratification_connection
For A=F_p with the zero PD ideal and C=P=F_p[t], the module M=F_p[t]·e with the integrable connection ∇e=e⊗dt has no PD stratification whose coefficient θ_1 is the operator θ of ∇: such an ε would satisfy ε(e⊗1)=Σ_kθᵏ(e)⊗ξ^{[k]} with only finitely many nonzero terms, but θᵏ(e)=e for all k.

CrystallineCohomology:CR.1/envelope-differentials

declaration TauCeti.Crystalline.envelopeDifferentials
Let (A,I,γ) be a PD ring, A→P a ring map, J⊂P an ideal with IP⊂J, and (D,J̄,γ̄)=D_{P,γ}(J) the PD envelope. The canonical map Ω_{P/A}⊗_PD→Ω¹_PD(D/A) is an isomorphism (Stacks Lemma 60.6.6); no flatness of D over P is needed. Hence Ω^q_PD(D/A)=Ω^q_{P/A}⊗_PD for every q≥0. If P is smooth over A these D-modules are finite locally free. If p is a prime, A is a ℤ_(p)-algebra and p is nilpotent in P/J, then with D_e=D/pᵉD the p-adic completion of Ω¹_PD(D/A) is lim_eΩ¹_PD(D_e/A) (Stacks Lemma 60.6.10); for P=A[x_i] it consists of the sums Σf_idx_i with f_i in the p-adic completion D^∧ of D and, for every e, f_i∈pᵉD^∧ for all but finitely many i.

CrystallineCohomology:CR.1/taylor-equivalence

declaration TauCeti.Crystalline.crystalConnectionEquivalence
Convention. A PD stratification is ε:M⊗^∧_{D,p₀}D(1)→M⊗^∧_{D,p₁}D(1) (CR.1/pd-stratification), a connection is written ∇m=Σ_iθ_i(m)dx_i (CR.1/quasi-nilpotent-connection), and ξ_i=x_i⊗1−1⊗x_i=p₀(x_i)−p₁(x_i)∈D(1). (1) In Stacks Situation 60.5.1 with X=Spec C and S=Spec A, let P=A[x_i]→C be a surjection from a polynomial algebra, D the p-adic completion of the PD envelope of its kernel and D_e=D/pᵉD. For a crystal F in quasi-coherent O_crys-modules on Cris(X/S), M=lim_eΓ((X,Spec D_e,γ̄),F) is a p-adically complete D-module with M/pᵉM=Γ((X,Spec D_e,γ̄),F), the crystal property gives a PD stratification ε on M, and ε(m⊗1)=Σ_Kθ_K(m)⊗∏_iξ_i^{[k_i]} with θ_K=∏_iθ_i^{k_i}, where ∇(m)=Σ_iθ_i(m)dx_i is the canonical connection of F evaluated on the Spec D_e; ∇ is integrable and topologically quasi-nilpotent (Stacks Lemma 60.17.3). (2) The functor F↦(M,∇) is an equivalence from the category of crystals in quasi-coherent O_crys-modules on Cris(X/S) to the category of pairs (M,∇) of a p-adically complete D-module and an integrable, topologically quasi-nilpotent connection ∇:M→M⊗^∧_DΩ_D (Stacks Proposition 60.17.4). A quasi-inverse sends (M,∇) to the crystal with value M⊗_{D,f}B on an affine object (U,Spec B,δ) with a morphism f:D→B of thickenings, two choices f, g being identified by c_{f,g}(m⊗1)=Σ_Kθ_K(m)⊗∏_i(f(x_i)−g(x_i))^{[k_i]}, a finite sum. (3) Let A→P′→C be ring maps with P′ smooth over A and P′→C surjective with kernel J′, and D′ the p-adic completion of D_{P′,γ}(J′). There are a surjection P→C from a polynomial algebra and PD A-algebra maps a:D→D′, b:D′→D compatible with the maps to C with a∘b=id; base change along a and b gives an equivalence between the pairs (M,∇) over D and the pairs (M′,∇′) over D′ that are p-adically complete, integrable and topologically quasi-nilpotent, and the equivalence of (2) holds for the functor F↦(M′,∇′) (Stacks Lemma 60.17.5).

CrystallineCohomology:CR.1/finite-witt-evaluation

declaration TauCeti.Crystalline.finiteWittEvaluation
Let k be a perfect field of characteristic p, W=W(k) with the canonical PD structure on (p), W_n=W/pⁿ, Z a smooth k-scheme of finite type and Ẑ a smooth p-adic formal W-scheme with Ẑ⊗_Wk=Z; put Z_n=Ẑ⊗_WW_n. Then (Z,Z_n,γ) is an object of Cris(Z/Spec W_n). Let MIC(Z_n) be the category of O_{Z_n}-modules of finite type with an integrable connection ∇_n:E_n→E_n⊗Ω¹_{Z_n/W_n}. Call (E_n,∇_n) quasi-nilpotent if for every affine open Spec P′ of Z_n the pair (Γ(Spec P′,E_n),∇_n) over D′=P′ is topologically quasi-nilpotent in the sense of CR.1/quasi-nilpotent-connection (Stacks Lemma 60.17.5), and let MIC(Z_n)^qn be the full subcategory of these. (1) Evaluation E↦(E_{Z_n},∇) on the object (Z,Z_n,γ) is an equivalence from Crys(Z/W_n), the crystals of finite type on Cris(Z/Spec W_n), to MIC(Z_n)^qn, compatible with reduction from W_{n+1} to W_n; crystals in finite locally free modules correspond to the (E_n,∇_n) with E_n finite locally free. (2) (E_n,∇_n) in MIC(Z_n) is quasi-nilpotent if and only if its reduction (E_1,∇_1)=(E_n,∇_n)⊗_{W_n}k is. (3) Crys(Z/W) is equivalent to the category of coherent O_Ẑ-modules E with an integrable connection such that (E,∇)⊗_WW_n lies in MIC(Z_n)^qn for every n; such E satisfy E=lim_nE/pⁿE.

CrystallineCohomology:CR.2/crystalline-cohomology

declaration TauCeti.Crystalline.RΓcrys
In the situation of CR.1/crystalline-site, with f:X→S the structure map, u_{X/S}:(X/S)_cris→Sh(X_Zar) is a morphism of topoi (CR.1/site-morphisms). It is not a morphism of ringed topoi to (X_Zar,O_X): the natural ring map goes from O_crys to u⁻¹O_X. Through u⁻¹f⁻¹O_S→O_crys every O_crys-module is a module over u⁻¹f⁻¹O_S, and Ru_{X/S,*}:D((X/S)_cris,O_crys)→D(X_Zar,f⁻¹O_S) is the derived direct image. Crystalline cohomology is RΓ_crys(X/S,E)=RΓ(Cris(X/S),E)=RΓ(X_Zar,Ru_{X/S,*}E), an object of D(Γ(S,O_S)). In particular, for a PD ring (A,I,γ) with A a ℤ_(p)-algebra and p nilpotent in A/I, S=Spec A and X an S₀-scheme with p locally nilpotent on X, RΓ_crys(X/S,E)∈D(A) is defined although p need not be nilpotent in A. In that case pᵉA⊂I is stable under γ for e≫0; with S_e=Spec A/pᵉA, Cris(X/S_e) is a full subcategory of Cris(X/S), and for every O_crys-module F with restrictions F_e to Cris(X/S_e) one has RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F_e) (Stacks Remark 60.24.10).

api TauCeti.Crystalline.RΓcrys_comp
RΓ_crys(X/S,−)=RΓ(X_Zar,−)∘Ru_{X/S,*} as functors D((X/S)_cris,O_crys)→D(Γ(S,O_S)), where Ru_{X/S,*} takes values in D(X_Zar,f⁻¹O_S).

api TauCeti.Crystalline.RΓcrys_map
For a square X→Y over (S,I,γ)→(S′,I′,γ′) as in CR.1/site-morphisms, an O_crys-module F′ on Cris(Y/S′) and a map f_cris⁻¹F′→F of sheaves on Cris(X/S) linear over f_cris⁻¹O_{Y/S′}→O_{X/S}, there is a map RΓ_crys(Y/S′,F′)→RΓ_crys(X/S,F), linear over Γ(S′,O_S′)→Γ(S,O_S).

api TauCeti.Crystalline.RΓcrys_limit
For a PD ring (A,I,γ) with A a ℤ_(p)-algebra and p nilpotent in A/I, S=Spec A and S_e=Spec A/pᵉA (e≫0): RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F|_{Cris(X/S_e)}) for every O_crys-module F (Stacks Remark 60.24.10).

test TauCeti.Crystalline.test_RΓcrys_empty
The empty scheme has zero crystalline cohomology.

test TauCeti.Crystalline.test_RΓcrys_point
For k a perfect field of characteristic p, X=Spec k and S=Spec W_e(k) with the canonical PD structure on (p): RΓ_crys(X/S,O_crys)=W_e(k) in degree 0.

test TauCeti.Crystalline.test_RΓcrys_limit_not_groups
For X=𝔸¹_{F_p} over S=Spec ℤ_p and F=O_crys, the map H¹(RΓ_crys(X/S,O_crys))→lim_eH¹(RΓ_crys(X/S_e,O_crys)) is not injective: the class of η=Σ_{e>0}pᵉx^{pᵉ−1}dx is nonzero and maps to zero, since η≡d(Σ_{0<j<e}x^{pʲ}) modulo pᵉ (Stacks Example 60.22.2).

CrystallineCohomology:CR.2/linearization

declaration TauCeti.Crystalline.linearization
Setting: p a prime, (A,I,γ) a PD ring with p nilpotent in A, A→C a ring map with IC=0, X=Spec C, S=Spec A, P=A[x_1,…,x_d] with a surjection P→C with kernel J, and D=D_{P,γ}(J), so that (X,Spec D,γ̄) is an object of Cris(X/S). Construction: for an object (U,T,δ) of Cris(X/S) let (U,D_T,δ_T)=(U,T,δ)×(X,Spec D,γ̄) be the product in Cris(X/S), with projections pr_T:D_T→T and pr_D:D_T→Spec D; D_T is the PD envelope of U in T×_SSpec P relative to δ. For a D-module N the linearization L(N) is the O_crys-module on Cris(X/S) with L(N)_T=pr_{T,*}pr_D^*Ñ and the restriction maps given by functoriality of the product. (1) If T=Spec B is affine and h:D→B is a morphism of thickenings, then D_T=Spec B⟨ξ_1,…,ξ_d⟩ with pr_D given by x_i↦h(x_i)+ξ_i, so L(N)(U,T,δ)=N⊗_DB⟨ξ_1,…,ξ_d⟩; L(N) is a crystal in quasi-coherent O_crys-modules. (2) RΓ(Cris(X/S),L(N))≅N, placed in degree 0. (3) L(Ω^q_PD(D/A))_T=pr_{T,*}Ω^q_PD(D_T/T), and the relative PD de Rham differentials of D_T over T make L(Ω^•_PD(D/A)) a complex of O_crys-modules with an augmentation O_crys→L(D). For a crystal E in quasi-coherent O_crys-modules with value E_D on Spec D, E⊗_{O_crys}L(Ω^q_PD(D/A))≅L(E_D⊗_DΩ^q_PD(D/A)), and the augmented complex E→E⊗_{O_crys}L(Ω^•_PD(D/A)) is exact: E is resolved by linearizations.

api TauCeti.Crystalline.linearization_eval
L(N)(U,T,δ)=Γ(D_T,pr_D^*Ñ) with (U,D_T,δ_T)=(U,T,δ)×(X,Spec D,γ̄); for T=Spec B affine and h:D→B a morphism of thickenings, D_T=Spec B⟨ξ_1,…,ξ_d⟩ with pr_D:x_i↦h(x_i)+ξ_i and L(N)(U,T,δ)=N⊗_DB⟨ξ_1,…,ξ_d⟩.

api TauCeti.Crystalline.linearization_map
A D-linear map N→N′ induces a map of O_crys-modules L(N)→L(N′), compatibly with composition and with the restriction maps.

api TauCeti.Crystalline.linearization_augmentation
For a crystal E in quasi-coherent O_crys-modules, the maps E_T→pr_{T,*}pr_T^*E_T=pr_{T,*}pr_D^*Ẽ_D define E→L(E_D), and L(E_D⊗_DN)≅E⊗_{O_crys}L(N) for every D-module N.

api TauCeti.Crystalline.linearization_cohomology
RΓ(Cris(X/S),L(N))≅N in degree 0: Γ(Cris(X/S),L(N))=N and Hⁱ(Cris(X/S),L(N))=0 for i>0.

api TauCeti.Crystalline.linearization_resolution
L(Ω^•_PD(D/A)), with L(Ω^q_PD(D/A))_T=pr_{T,*}Ω^q_PD(D_T/T) and the relative PD de Rham differentials, is a complex of O_crys-modules, and for every crystal E in quasi-coherent O_crys-modules the augmented complex E→E⊗_{O_crys}L(Ω^•_PD(D/A)) is exact.

test TauCeti.Crystalline.test_linearization_zero
L(0)=0.

test TauCeti.Crystalline.test_linearization_identity
For A=F_p with the zero PD ideal and C=P=F_p[x], so that D=F_p[x] and X=Spec D: L(D)(X,X,∅)=F_p[x]⟨ξ⟩, where the two maps from F_p[x] are x↦x and x↦x+ξ; this is free of infinite rank over F_p[x] and is not D. RΓ(Cris(X/S),L(D))=F_p[x] in degree 0.

test TauCeti.Crystalline.test_linearization_PD
For the same data, L(D)(X,X,∅)=F_p[x]⟨ξ⟩ is not the polynomial ring F_p[x][ξ]: ξᵖ=p!·ξ^{[p]}=0 in it, and ξ^{[p]} is not a polynomial in ξ.

CrystallineCohomology:CR.2/pd-poincare

declaration TauCeti.Crystalline.pdPoincare
(1) Let A be a ring and P=A⟨x_i⟩_{i∈W} a PD polynomial algebra on any set W of variables, with its PD ideal P₊. For every A-module N the complex 0→N→N⊗_AP→N⊗_AΩ¹_PD(P/A)→N⊗_AΩ²_PD(P/A)→⋯ is exact (Stacks Lemma 60.20.1). (2) Let (B,I,δ) be a PD ring with B an A-algebra, P=B⟨x_i⟩_{i∈W} with PD ideal IP+P₊, and M a B-module with an integrable connection ∇:M→M⊗_BΩ¹_PD(B/A). Then the map of de Rham complexes M⊗_BΩ^•_PD(B/A)→M⊗_BΩ^•_PD(P/A) is a quasi-isomorphism (Stacks Lemma 60.20.2). (3) Let p be a prime. In (1), with D₀ the p-adic completion of P and Ωⁱ_{D₀} the p-adic completion of Ωⁱ_PD(P/A), the complex 0→N→N⊗^∧_AD₀→N⊗^∧_AΩ¹_{D₀}→⋯ is exact for every p-adically complete A-module N. In (2), with D and D′ the p-adic completions of B and P and Ωⁱ_D, Ωⁱ_{D′} the p-adic completions of Ωⁱ_PD(B/A) and Ωⁱ_PD(P/A), the map M⊗^∧_DΩ^•_D→M⊗^∧_DΩ^•_{D′} is a quasi-isomorphism for every p-adically complete D-module M with an integrable connection ∇:M→M⊗^∧_DΩ¹_D. (4) For one variable z over B the contraction is explicit: on Ω^•_PD(B⟨z⟩/B), the B-linear map h with h(z^{[n]}dz)=z^{[n+1]} and h=0 in degree 0 satisfies dh+hd=id−ev₀, where ev₀ is evaluation at z=0 in degree 0 and zero in degree 1 (Stacks Example 60.25.2).

CrystallineCohomology:CR.2/embedding-computation

declaration TauCeti.Crystalline.crysEmbeddingComputation
Setting for (1)–(4): Stacks Situation 60.5.1 with X=Spec C and S=Spec A, P=A[x_i]→C a surjection from a polynomial algebra, D(n) the p-adically completed PD envelopes of CR.1/pd-stratification, D=D(0), and T(n)_e=Spec D(n)/pᵉD(n), so that (X,T(n)_e,γ̄) is an object of Cris(X/S) for e≫0. (1) (Čech–Alexander complex.) Let F be an O_crys-module on Cris(X/S) such that every restriction F_T is quasi-coherent and c_f:f^*F_T′→F_T is surjective for every morphism of Cris(X/S) with f:T→T′ a closed immersion. Then M(n)=lim_eΓ((X,T(n)_e,γ̄),F) is a cosimplicial module over the cosimplicial ring D(•), and the complex M(0)→M(1)→M(2)→⋯ computes RΓ(Cris(X/S),F) (Stacks Proposition 60.21.1). (2) For such F, Hʲ(Cris(X/S),F⊗_{O_crys}Ωⁱ_{X/S})=0 for all i>0 and j≥0 (Stacks Lemma 60.21.2). (3) If F is a crystal in quasi-coherent modules and (M,∇) the associated module with connection over D (CR.1/taylor-equivalence), then M⊗^∧_DΩ^•_D computes RΓ(Cris(X/S),F) (Stacks Proposition 60.21.3); if p is nilpotent in A the completions may be omitted. (4) If A→P′→C are ring maps with P′ smooth over A and P′→C surjective, D′ is the p-adic completion of the PD envelope of the kernel and (M′,∇′) is the pair over D′ associated to F, then M′⊗^∧_{D′}Ω^•_{D′} computes RΓ(Cris(X/S),F) (Stacks Lemma 60.21.4). (5) (Sheaf form.) In the situation of CR.1/crystalline-site, for a crystal F in quasi-coherent modules, Ru_{X/S,*}(F⊗_{O_crys}Ωⁱ_{X/S})=0 for all i>0, so the map of complexes F⊗Ω^•_{X/S}→F[0] becomes an isomorphism after Ru_{X/S,*} (Stacks Proposition 60.23.1); for every object (U,T,δ) this gives a canonical map RΓ(Cris(X/S),F)→RΓ(T,F_T⊗_{O_T}Ω^•_{T/S,δ}). (6) (Closed embedding.) If moreover p is locally nilpotent on S and X→P is a closed S₀-immersion into a smooth S-scheme with PD envelope D, then (X,D,γ̄) is an object of Cris(X/S) and the map of (5) for T=D induces an isomorphism Ru_{X/S,*}F≅F_D⊗_{O_P}Ω^•_{P/S} in D(X_Zar,f⁻¹O_S).

CrystallineCohomology:CR.2/embedding-independence

declaration TauCeti.Crystalline.crysEmbeddingIndependent
In the setting of CR.2/embedding-computation (1)–(4), let F be a crystal in quasi-coherent O_crys-modules and (M,∇) the associated module with connection over D. (1) For every PD A-algebra endomorphism ρ:D→D compatible with the maps to C, the induced map M⊗^∧_DΩ^•_D→M⊗^∧_{D,ρ}Ω^•_D is a quasi-isomorphism (proof of Stacks Lemma 60.21.4). (2) For ring maps A→P′→C with P′ smooth and P′→C surjective, a surjection P→P′ from a polynomial algebra and a:D→D′, b:D′→D as in CR.1/taylor-equivalence (3), the base change maps M′⊗^∧_{D′}Ω^•_{D′}→M⊗^∧_DΩ^•_D along b and M⊗^∧_DΩ^•_D→M′⊗^∧_{D′}Ω^•_{D′} along a are quasi-isomorphisms (Stacks Lemma 60.21.4). (3) Each of the b+1 coprojections D→D(b) induces a quasi-isomorphism M⊗^∧_DΩ^•_D→M⊗^∧_DΩ^•_{D(b)}, and they all induce the same map in the derived category, the inverse being induced by the codiagonal D(b)→D (proof of Stacks Proposition 60.21.3). (4) Let P₁→C and P₂→C be surjections from polynomial A-algebras, with completed envelopes D₁, D₂, and D₁₂ the completed envelope of the kernel of P₁⊗_AP₂→C, and let (M₁,∇), (M₂,∇), (M₁₂,∇) be the modules with connection of F. Then D₁₂ is the p-adic completion of a PD polynomial algebra over D₁ and over D₂, and the maps M₁⊗^∧Ω^•_{D₁}→M₁₂⊗^∧Ω^•_{D₁₂}←M₂⊗^∧Ω^•_{D₂} are quasi-isomorphisms compatible with the identifications of the three complexes with RΓ(Cris(X/S),F). (5) Any two PD A-algebra maps g,h:D₂→D₁ compatible with the maps to C induce the same map M₂⊗^∧Ω^•_{D₂}→M₁⊗^∧Ω^•_{D₁} in the derived category.

CrystallineCohomology:CR.2/smooth-lift-filtration

declaration TauCeti.Crystalline.crysSmoothLiftFiltration
(1) (Smooth lift; Stacks Remark 60.24.11.) Let p be a prime, (A,I,γ) a PD ring with p nilpotent in A, S=Spec A, S₀=Spec A/I, Y a smooth S-scheme, X=Y×_SS₀, and F a crystal in quasi-coherent O_crys-modules on Cris(X/S). Then γ extends to a PD structure on the ideal of X in Y, so that (X,Y,γ) is an object of Cris(X/S); the restriction F_Y carries a canonical integrable connection ∇:F_Y→F_Y⊗_{O_Y}Ω_{Y/S}; and RΓ(Cris(X/S),F)≅RΓ(Y,F_Y⊗_{O_Y}Ω^•_{Y/S}) in D(A). (2) (Filtration on an envelope.) Let (A,I,γ) be a PD ring, P an A-algebra, J⊂P an ideal containing IP, (D,J̄,γ̄) the PD envelope and J̄^{[a]} the PD powers of J̄ (CR.0/pd-filtration), with J̄^{[a]}=D for a≤0. Then d(J̄^{[a]})⊂J̄^{[a−1]}·Ω¹_PD(D/A). Hence for every integer r the submodules Filʳ(Ω^q_PD(D/A))=J̄^{[r−q]}·Ω^q_PD(D/A) form a subcomplex Filʳ of Ω^•_PD(D/A), decreasing in r, equal to the whole complex for r≤0; and for a D-module M with integrable connection the submodules J̄^{[r−q]}·(M⊗_DΩ^q_PD(D/A)) form a subcomplex of M⊗_DΩ^•_PD(D/A). (3) If I=0 and J=0, so that D=P, then Filʳ=σ_{≥r}Ω^•_{P/A}, the stupid truncation. In the situation of (1), for D=O_Y and J̄=IO_Y, the image of Filʳ in Ω^•_{X/S₀} is σ_{≥r}Ω^•_{X/S₀}.

CrystallineCohomology:CR.2/formal-and-end0

declaration TauCeti.Crystalline.crysFormalEnd0
(1) (Stacks Remark 60.24.14.) Let p be a prime, (A,I,γ) a PD ring with A noetherian and p-adically complete and p nilpotent in A/I, S=Spec A, S₀=Spec A/I, Y a proper smooth S-scheme, X=Y×_SS₀, and F a crystal of finite type in quasi-coherent O_crys-modules on Cris(X/S). Then there is a coherent O_Y-module F_Y with an integrable connection ∇:F_Y→F_Y⊗_{O_Y}Ω_{Y/S} such that F_Y/pᵉF_Y with its connection is the module with connection over A/pᵉA of CR.2/smooth-lift-filtration (1), and RΓ(Cris(X/S),F)≅RΓ(Y,F_Y⊗_{O_Y}Ω^•_{Y/S}) in D(A). (2) For A=W(k) with k a perfect field, I=(p) and K=W(k)[1/p]: RΓ(Cris(X/S),F)⊗_{W(k)}K≅RΓ(Y_K,F_{Y_K}⊗Ω^•_{Y_K/K}). (3) (Trace-free endomorphisms.) Let E be a crystal in finite locally free O_crys-modules of constant rank r≥1. The trace tr:End(E)=E^∨⊗E→O_crys is a surjective map of crystals, End⁰(E):=Ker(tr) is a crystal in finite locally free modules of rank r²−1, and (1) and (2) apply to End(E) and End⁰(E). The map O_crys⊕End⁰(E)→End(E), (a,φ)↦a·id+φ, has cokernel O_crys/r·O_crys; it is an isomorphism if p does not divide r, and it is not surjective if p divides r and X is nonempty.

CrystallineCohomology:CR.3/crystalline-descent

declaration TauCeti.Crystalline.crysDescent
Let (A,I,γ) be a PD ring in which p is nilpotent, S=Spec A, S₀=Spec A/I, X a quasi-compact separated S₀-scheme and E a crystal in quasi-coherent O_crys-modules on X/S. Choose a finite affine open cover X=⋃_(λ∈Λ)U_λ with U_λ=Spec C_λ, a total order on Λ, and for each λ a surjection P_λ→C_λ from a polynomial A-algebra. For λ₀<…<λ_n write U_(λ₀)∩…∩U_(λ_n)=Spec C_(λ₀…λ_n), let D_(λ₀…λ_n) be the PD envelope, relative to γ, of the kernel of P_(λ₀)⊗_A…⊗_A P_(λ_n)→C_(λ₀…λ_n), and let (M_(λ₀…λ_n),∇) be the D_(λ₀…λ_n)-module with integrable connection attached to E. Then RΓ_crys(X/S,E) is isomorphic in D(A) to the total complex of the double complex M^(n,m)=⊕_(λ₀<…<λ_n) M_(λ₀…λ_n)⊗_(D_(λ₀…λ_n))Ω^m_PD(D_(λ₀…λ_n)/A), with the Čech differential in n and the de Rham differential of ∇ in m.

CrystallineCohomology:CR.3/derived-base-change

declaration TauCeti.Crystalline.crysBaseChange
Let (A′,I′,γ′)→(A,I,γ) be a homomorphism of PD rings, S′=Spec A′, S=Spec A, X′ a scheme over A′/I′, X a scheme over A/I and f:X→X′ a morphism over Spec A/I→Spec A′/I′, with p locally nilpotent on X and X′. For an O_crys-module E′ on X′/S′ with pullback E=f_crys^*E′ put K′=RΓ_crys(X′/S′,E′) and K=RΓ_crys(X/S,E). (1) There is a canonical base-change map K′⊗^L_(A′)A→K in D(A). (2) It is an isomorphism if all of the following hold: p is nilpotent in A′; E′ is a crystal in quasi-coherent O_crys-modules; X′→Spec A′/I′ is quasi-compact and quasi-separated; X=X′×_(Spec A′/I′)Spec A/I; E′ is a flat O_crys-module; X′→Spec A′/I′ is a local complete intersection morphism; X′ and Spec A/I are Tor-independent over Spec A′/I′. The conditions on X′, X and E′ hold when X′ is quasi-compact, quasi-separated and smooth over A′/I′, X is its base change and E′ is a finite locally free crystal. (3) p-adic form: let A′ and A be p-adically complete with p nilpotent in A′/I′ and in A/I, and assume the conditions of (2) except the nilpotence of p in A′. For e so large that p^eA′⊂I′ is stable under γ′ put K′_e=RΓ_crys(X′/Spec(A′/p^e),E′). If K′ is a perfect complex of A′-modules and K′⊗^L_(A′)A′/p^e→K′_e is an isomorphism for all such e, then K′⊗^L_(A′)A→K is an isomorphism.

api TauCeti.Crystalline.crysBaseChange_id
For the identity of (A,I,γ) and the identity of X the base-change map K⊗^L_A A→K is the canonical isomorphism.

api TauCeti.Crystalline.crysBaseChange_comp
For PD homomorphisms (A″,I″,γ″)→(A′,I′,γ′)→(A,I,γ) and morphisms X→X′→X″ over them, the base-change map K″⊗^L_(A″)A→K is the composite of (K″⊗^L_(A″)A′)⊗^L_(A′)A→K′⊗^L_(A′)A with K′⊗^L_(A′)A→K.

api TauCeti.Crystalline.crysBaseChange_natural
A homomorphism E′₁→E′₂ of O_crys-modules on X′/S′ induces a commutative square of base-change maps; the base-change map is also natural for morphisms g:Y′→X′ of schemes over A′/I′ and their base changes.

CrystallineCohomology:CR.3/proper-perfectness

declaration TauCeti.Crystalline.crysPerfect
(1) Let (A,I,γ) be a PD ring with A Noetherian and p nilpotent in A, X a proper smooth scheme over A/I and E a finite locally free crystal on X/Spec A. Then K=RΓ_crys(X/Spec A,E) is a perfect complex of A-modules. (2) Let (A,I,γ) be a PD ring with A Noetherian and p-adically complete and p nilpotent in A/I, X proper smooth over A/I and E a finite locally free crystal on X/Spec A. For e such that p^eA⊂I is stable under γ (all sufficiently large e) put K_e=RΓ_crys(X/Spec(A/p^e),E). Then K=Rlim_e K_e is a perfect complex of A-modules and K⊗^L_A A/p^e→K_e is an isomorphism for every such e. (3) Let k be a perfect field of characteristic p, A=W(k), I=(p), X proper smooth over k of dimension ≤d and E a finite locally free crystal on X/W(k). Then K=RΓ_crys(X/W(k),E) is a perfect complex of W(k)-modules of Tor-amplitude in [0,2d], K⊗^L_(W(k))W_n(k)≅RΓ_crys(X/W_n(k),E) for all n≥1, and each H^i(K) is a finitely generated W(k)-module, zero unless 0≤i≤2d. The modules H^i(K) can have p-torsion. (4) In the situation of (2), for a homomorphism (A,I,γ)→(B,J,δ) of PD rings with B Noetherian and p-adically complete and p nilpotent in B/J, the base-change map K⊗^L_A B→RΓ_crys(X_B/Spec B,E_B) of CR.3/derived-base-change is an isomorphism, where X_B=X×_(Spec A/I)Spec B/J and E_B is the pullback of E.

CrystallineCohomology:CR.3/cup-product

declaration TauCeti.Crystalline.crysCup
Let (A,I,γ) be a PD ring with A a Z_(p)-algebra, S=Spec A, X a scheme over A/I on which p is locally nilpotent, and write K(E)=RΓ_crys(X/S,E) for an O_crys-module E. (1) For O_crys-modules E, F the cup product is the map ∪:K(E)⊗^L_A K(F)→K(E⊗_(O_crys)F) in D(A) obtained from the cup product RΓ(E)⊗^L RΓ(F)→RΓ(E⊗^L_(O_crys)F) of the ringed crystalline topos followed by E⊗^L F→E⊗F; the unit is A→K(O_crys). (2) It is associative and unital, natural in E and F, and compatible with pullback along the morphisms of crystalline topoi induced by commutative squares of schemes over homomorphisms of PD rings. (3) On H^*_crys(X/S)=H^*(K(O_crys)) it is a graded A-algebra structure, graded commutative: x∪y=(−1)^(ij)·y∪x for x∈H^i, y∈H^j. In particular 2·x∪x=0 for x of odd degree, hence x∪x=0 when p is odd; for p=2 this gives only 2·x∪x=0. (4) For schemes X, Y over A/I the external product of x∈H^*(K_X(E)) and y∈H^*(K_Y(F)) is pr₁^*x∪pr₂^*y∈H^*(K_(X×Y)(pr₁^*E⊗pr₂^*F)), X×Y the fibre product over A/I.

api TauCeti.Crystalline.crysCup_unit
The class 1∈H⁰_crys(X/S), image of 1 under the unit A→K(O_crys), satisfies 1∪x=x=x∪1 for x∈H^*(K(E)), under O_crys⊗E≅E≅E⊗O_crys.

api TauCeti.Crystalline.crysCup_graded_comm
For x∈H^i_crys(X/S) and y∈H^j_crys(X/S): x∪y=(−1)^(ij)·y∪x; for O_crys-modules E, F the same holds between K(E⊗F) and K(F⊗E) through the exchange isomorphism.

api TauCeti.Crystalline.crysCup_reduction
For a homomorphism of PD rings (A′,I′,γ′)→(A,I,γ) and f:X→X′ over it, the base-change map K′(E′)⊗^L_(A′)A→K(f_crys^*E′) of CR.3/derived-base-change is compatible with cup products and units. In particular, for p^eA⊂I stable under γ, the reduction K(E)→RΓ_crys(X/Spec(A/p^e),E) carries cup products to cup products.

api TauCeti.Crystalline.crysCup_assoc
(x∪y)∪z=x∪(y∪z) in H^*(K(E⊗F⊗G)) for x∈H^*(K(E)), y∈H^*(K(F)), z∈H^*(K(G)); the same holds for the maps of complexes in D(A).

api TauCeti.Crystalline.crysCup_pullback
For a morphism g:X′→X of schemes over a homomorphism of PD rings and O_crys-modules E, F on X: g^*(x∪y)=g^*x∪g^*y and g^*1=1.

api TauCeti.Crystalline.crysCup_deRham
If p is nilpotent in A and Y is a smooth lift of X over A, then under H^*_crys(X/S)≅H^*(Y,Ω^•_(Y/A)) of CR.2/smooth-lift-filtration the cup product is the product induced by the wedge product of Ω^•_(Y/A); with coefficients it is induced by (e⊗ω)∧(f⊗η)=(e⊗f)⊗(ω∧η).

api TauCeti.Crystalline.crysCup_external
For schemes X, Y over A/I and classes x∈H^*(K_X(E)), y∈H^*(K_Y(F)): x⊠y=pr₁^*x∪pr₂^*y∈H^*(K_(X×Y)(pr₁^*E⊗pr₂^*F)); on complexes, K_X(E)⊗^L_A K_Y(F)→K_(X×Y)(pr₁^*E⊗pr₂^*F).

test TauCeti.Crystalline.test_crysCup_point
For X=Spec k, k a perfect field of characteristic p, and S=Spec W(k): K(O_crys)=W(k) in degree 0 and the cup product is the multiplication of W(k).

test TauCeti.Crystalline.test_crysCup_P1
On P¹×P¹ over a perfect field k, with h_a=pr_a^*h and h=c₁(O(1))∈H²_crys(P¹/W(k)): h₁∪h₂=h₂∪h₁ generates H⁴_crys(P¹×P¹/W(k))≅W(k), and h₁∪h₁=0=h₂∪h₂.

test TauCeti.Crystalline.test_crysCup_P2
On P² over a perfect field k: h∪h generates H⁴_crys(P²/W(k))≅W(k) and h∪h∪h=0, for h=c₁(O(1)).

test TauCeti.Crystalline.test_crysCup_odd
For a geometrically connected smooth proper curve C over a perfect field k and x,y∈H¹_crys(C/W(k)): x∪y=−y∪x and x∪x=0 in H²_crys(C/W(k)).

CrystallineCohomology:CR.3/kunneth

declaration TauCeti.Crystalline.crysKunneth
Let k be a perfect field of characteristic p, W=W(k), X and Y proper smooth k-schemes and E, F finite locally free crystals on X/W and Y/W; write K(X,E)=RΓ_crys(X/W,E). The external cup product K(X,E)⊗^L_W K(Y,F)→K(X×_kY,pr₁^*E⊗pr₂^*F), x⊗y↦pr₁^*x∪pr₂^*y, is an isomorphism in D(W). It is compatible with cup products, with the reductions ⊗^L_W W_n(k), and, when (E,Φ_E) and (F,Φ_F) are F-crystals relative to the Witt vector Frobenius σ, with the linearised Frobenius maps of CR.3/frobenius-map for (E,Φ_E), (F,Φ_F) and (pr₁^*E⊗pr₂^*F,Φ_E⊗Φ_F). Consequently there are short exact sequences 0→⊕_(i+j=n)H^i(K(X,E))⊗_W H^j(K(Y,F))→H^n(K(X×Y,pr₁^*E⊗pr₂^*F))→⊕_(i+j=n+1)Tor₁^W(H^i(K(X,E)),H^j(K(Y,F)))→0.

CrystallineCohomology:CR.3/frobenius-map

declaration TauCeti.Crystalline.crysFrobenius
Let (A,I,γ) be a PD ring with A a Z_(p)-algebra and p∈I, and σ:A→A a homomorphism of PD rings with σ(x)≡x^p modulo pA. Let S=Spec A, S₀=Spec A/I and X an S₀-scheme. (1) The absolute Frobenius F_X of X lies over the absolute Frobenius F_(S₀) of S₀, which Spec(σ) lifts; it induces a morphism of crystalline topoi (F_X)_crys:(X/S)_crys→(X/S)_crys. (2) An F-crystal on X/S relative to σ is a crystal E in finite locally free O_crys-modules together with a map Φ:(F_X)_crys^*E→E; it is nondegenerate if there are an integer i≥0 and a map V:E→(F_X)_crys^*E with V∘Φ=p^i. The structure sheaf with the canonical isomorphism (F_X)_crys^*O_crys=O_crys is an F-crystal. (3) For an F-crystal (E,Φ) and K=RΓ_crys(X/S,E) the linearised Frobenius F_K:K⊗^L_(A,σ)A→K is the composite of three maps: the base-change map K⊗^L_(A,σ)A→RΓ_crys(X^(1)/S,E^(1)), where X^(1)=X×_(S₀,F_(S₀))S₀ and E^(1) is the pullback of E along the projection X^(1)→X over Spec(σ); the pullback RΓ_crys(X^(1)/S,E^(1))→RΓ_crys(X/S,(F_X)_crys^*E) along the relative Frobenius F_(X/S₀):X→X^(1); and the map induced by Φ. (4) The composite F:K→K⊗^L_(A,σ)A→K is σ-semilinear on cohomology: F(ax)=σ(a)F(x).

api TauCeti.Crystalline.crysFrobenius_semilinear
The endomorphism F of H^*(K) induced by K→K⊗^L_(A,σ)A→K is additive and satisfies F(ax)=σ(a)·F(x) for a∈A.

api TauCeti.Crystalline.crysFrobenius_linearize
F_K:K⊗^L_(A,σ)A→K is an A-linear map in D(A), the composite of the base-change map for Spec(σ), the pullback along the relative Frobenius F_(X/S₀):X→X^(1) and the map induced by Φ.

api TauCeti.Crystalline.crysFrobenius_lift
Assume p is nilpotent in A. Let Y be a smooth lift of X over A and φ̃:Y→Y a morphism over Spec(σ) whose reduction modulo p is the absolute Frobenius of Y⊗_A A/p. Under RΓ_crys(X/S)≅RΓ(Y,Ω^•_(Y/A)) of CR.2/smooth-lift-filtration the semilinear Frobenius of the structure crystal is induced by φ̃^*:Ω^•_(Y/A)→Ω^•_(Y/A), and φ̃^*(Ω^q_(Y/A))⊂p^q·Ω^q_(Y/A) for every q≥0.

api TauCeti.Crystalline.crysFrobenius_natural
For a morphism g:X′→X of schemes over A/I and a morphism of F-crystals g_crys^*(E,Φ)→(E′,Φ′), the induced map K→K′ commutes with the linearised Frobenius maps; in particular g^*∘F=F∘g^* on H^*_crys.

api TauCeti.Crystalline.crysFrobenius_cup
For F-crystals (E,Φ_E), (E′,Φ_(E′)) and the F-crystal (E⊗E′,Φ_E⊗Φ_(E′)): F(x∪y)=F(x)∪F(y); and F(1)=1 in H⁰_crys(X/S).

api TauCeti.Crystalline.crysFrobenius_chern
F(c₁(L))=p·c₁(L) in H²_crys(X/S) for every invertible O_X-module L, because F_X^*L≅L^(⊗p).

api TauCeti.Crystalline.crysFrobenius_finite_field
For k=F_(p^f), A=W(k) and σ the Witt vector Frobenius, the iterate F^f is W(k)-linear on H^*_crys(X/W(k)).

test TauCeti.Crystalline.test_crysFrobenius_point
For X=Spec k, k perfect of characteristic p, A=W(k), σ the Witt vector Frobenius: K=W(k) and F=σ; it is not W(k)-linear when k≠F_p.

test TauCeti.Crystalline.test_crysFrobenius_P1
For P¹ over a perfect field k and A=W(k): F=σ on H⁰_crys=W and F(h)=p·h for h=c₁(O(1))∈H²_crys(P¹/W(k)).

test TauCeti.Crystalline.test_crysFrobenius_Pd
On H^(2i)_crys(P^d/W(k))=W·h^i, k perfect: F(a·h^i)=σ(a)·p^i·h^i for 0≤i≤d.

test TauCeti.Crystalline.test_crysFrobenius_singular
For X=Spec F_p[x,y]/(x²,xy,y²), A=Z_p with I=(p) and σ=id: the Frobenius F of H⁰_crys(X/Z_p) is not injective.

CrystallineCohomology:CR.3/weak-lefschetz

declaration TauCeti.Crystalline.crysWeakLefschetz
Let k be a perfect field of characteristic p, X a smooth projective variety of dimension d over k and L an invertible O_X-module. Let i_L≥0 be an integer such that for every coherent O_X-module F one has H^i(X,F⊗L^n)=0 for all i>i_L and all sufficiently large n. Then there is an integer n₀ such that for every n≥n₀ and every smooth H⊂X that is the zero scheme of a section of L^n, the restriction map H^j_crys(X/W(k))→H^j_crys(H/W(k)) is an isomorphism for j<d−i_L−1 and is injective with torsion-free cokernel for j=d−i_L−1. If L is ample one can take i_L=0.

CrystallineCohomology:CR.3/torsion-and-models

declaration TauCeti.Crystalline.crysAcceptanceModels
Let k be a perfect field of characteristic p, W=W(k), σ its Frobenius and F the semilinear Frobenius of CR.3/frobenius-map. (a) For d≥0: H^*_crys(P^d_k/W)=W[h]/(h^(d+1)) as a graded W-algebra, with h=c₁(O(1)) in degree 2; thus H^(2i)=W·h^i for 0≤i≤d, the odd groups vanish, and F(h)=p·h. (b) For a geometrically connected smooth proper curve C of genus g over k: H⁰_crys(C/W)=W, H¹_crys(C/W) is free of rank 2g, H²_crys(C/W) is free of rank 1, and F(H²_crys(C/W))=p·H²_crys(C/W). (c) For an elliptic curve E over k with origin 0: H¹_crys(E/W) is free of rank 2 and H²_crys(E/W)=W·e with e=c₁(O_E([0])) and F(e)=p·e. (d) Let O be the ring of integers of a complete algebraically closed non-archimedean extension C of Q_p, with residue field k. The smooth projective surface H over O constructed in BMS1 §2.2 satisfies H¹_crys(H_k/W(k))=0 and H²_crys(H_k/W(k))_tors≅k⊕k, while H²_ét(H_C,Z_p)_tors≅Z/p².

CrystallineCohomology:CR.3:Frobenius-isogeny/inseparable-control

declaration TauCeti.Crystalline.crysInseparableControl
Let (S,I,γ) be a PD scheme over Z_(p) with p∈I, S₀=V(I), and f:X′→X a morphism of S₀-schemes which, locally on X, is a composite of finitely many morphisms of the form Spec C[z]/(z^p−c)→Spec C (an iterated α_p-cover), of constant degree q. Let E be a crystal in quasi-coherent O_crys-modules on X/S and E′=f_crys^*E. Then the cone Q of Ru_(X/S,*)E→f_*Ru_(X′/S,*)E′ in the derived category of X_Zar has cohomology sheaves annihilated by q, and f^*:H^i_crys(X/S,E)→H^i_crys(X′/S,E′) has kernel and cokernel annihilated by q^(i+1). If X→S₀ is smooth of relative dimension d and X^(1)=X×_(S₀,F_(S₀))S₀, the relative Frobenius F_(X/S₀):X→X^(1) is an iterated α_p-cover of degree p^d; hence for every crystal G in quasi-coherent modules on X^(1)/S the map F_(X/S₀)^*:H^i_crys(X^(1)/S,G)→H^i_crys(X/S,(F_(X/S₀))_crys^*G) has kernel and cokernel annihilated by p^(d(i+1)).

CrystallineCohomology:CR.3:Frobenius-isogeny/rational-frobenius

declaration TauCeti.Crystalline.crysFrobeniusIsogeny
Let (A,I,γ) be a PD ring with A Noetherian and p-adically complete and p∈I, σ:A→A a homomorphism of PD rings with σ(x)≡x^p modulo pA, X a proper smooth scheme over A/I, and (E,Φ) a nondegenerate F-crystal on X/Spec A relative to σ: E is a crystal in finite locally free O_crys-modules, Φ:(F_X)_crys^*E→E, and there are an integer i≥0 and a map V:E→(F_X)_crys^*E with V∘Φ=p^i. Then the linearised Frobenius F_K:K⊗^L_(A,σ)A→K of CR.3/frobenius-map, K=RΓ_crys(X/Spec A,E), becomes an isomorphism after inverting p. In particular, for a perfect field k of characteristic p, A=W(k) and σ the Witt vector Frobenius, the semilinear Frobenius of H^j_crys(X/W(k),E)[1/p] is bijective for every j. It need not be bijective on H^j_crys(X/W(k),E).

CrystallineCohomology:CR.3:duality/trace

declaration TauCeti.Crystalline.crysTrace
Let k be a perfect field of characteristic p, W_n=W_n(k), X a proper smooth k-scheme of pure dimension d, W_nX the scheme (|X|,W_nO_X) and f_n:W_nX→Spec W_n its structure map; f_n^! denotes the exceptional inverse image of coherent duality. (1) The complex f_n^!W_n is concentrated in degree −d, and there is a unique map of W_nO_X-modules Tr^Ek:W_nΩ^d_X→f_n^!W_n[−d] which, on every open U⊂X with a smooth lift U′ over W_n, is the composite of the isomorphism θ:W_nΩ^d_U≅σ^n_*H^d(Ω^•_(U′/W_n)) with the map induced by the coherent trace isomorphism Ω^d_(U′/W_n)≅f′^!W_n[−d] of f′:U′→Spec W_n. It is an isomorphism and is compatible with étale maps. (2) Through Ru_*O_crys≅W_nΩ^•_X (CR.4/crystalline-comparison), the isomorphism C^(−n):W_nΩ^d_X≅H^d(W_nΩ^•_X) and adjunction for the proper map f_n, it induces Tr^Ek_(X,n):RΓ_crys(X/W_n)→W_n[−2d], equivalently a W_n-linear map H^(2d)_crys(X/W_n)→W_n. These maps are compatible with reduction from W_n to W_(n−1), and Tr^Ek_(X,1):H^(2d)_dR(X/k)=H^d(X,Ω^d_X)→k is the trace of coherent duality. (3) Normalisation. For X=P^d, Tr^Ek_(X,n) sends to 1 the class [ω] of the Čech d-cocycle ω=dlog[t₁]∧…∧dlog[t_d] of the standard covering, [t_i]∈W_nO the Teichmüller representative of the coordinate t_i; and h^d=ε_d·[ω] in H^(2d)_crys(P^d/W_n) for a sign ε_d∈{1,−1} which depends only on d and on the sign conventions for products of Čech cochains. The crystalline trace is Tr_(X,n)=ε_d·Tr^Ek_(X,n), and Tr_X=Rlim_n Tr_(X,n):RΓ_crys(X/W)→W[−2d]; thus Tr_(P^d)(h^d)=1.

api TauCeti.Crystalline.crysTrace_projective
Tr_(P^d)(h^d)=1 in W(k), for h=c₁(O(1)) and every d≥0; the same holds over W_n(k).

api TauCeti.Crystalline.crysTrace_reduction
Tr_X⊗^L_W W_n=Tr_(X,n) under RΓ_crys(X/W)⊗^L_W W_n≅RΓ_crys(X/W_n), and Tr_(X,1):H^d(X,Ω^d_X)→k is ε_d times the trace of coherent duality.

api TauCeti.Crystalline.crysTrace_etale_local
For an étale morphism g:U→X of smooth k-schemes of pure dimension d, g^*(Tr^Ek_X)=Tr^Ek_U under the identifications g^*W_nΩ^d_X≅W_nΩ^d_U and g^*f_(X,n)^!W_n≅f_(U,n)^!W_n (Ekedahl I, (2.11)).

api TauCeti.Crystalline.crysTrace_iso
Tr^Ek:W_nΩ^d_X→f_n^!W_n[−d] is an isomorphism of W_nO_X-modules, for X smooth of pure dimension d over k (Ekedahl I, Theorem 4.1).

api TauCeti.Crystalline.crysTrace_ekedahl
Tr_(X,n)=ε_d·Tr^Ek_(X,n), where Tr^Ek is induced by Ekedahl's map (2.11), Tr^Ek_(P^d,n)([ω])=1 for the Čech class [ω] of dlog[t₁]∧…∧dlog[t_d], and ε_d∈{1,−1} is defined by h^d=ε_d·[ω].

api TauCeti.Crystalline.crysTrace_frobenius
Tr_X(F(x))=p^d·σ(Tr_X(x)) for x∈H^(2d)_crys(X/W), F the semilinear Frobenius of CR.3/frobenius-map and σ the Frobenius of W(k); equivalently Tr_X is a map RΓ_crys(X/W)→W(−d)[−2d] compatible with Frobenius, W(−d) being W with Frobenius p^d·σ.

test TauCeti.Crystalline.test_crysTrace_point
For X=Spec k (d=0): Tr_X is the identity of W(k)=H⁰_crys(Spec k/W(k)).

test TauCeti.Crystalline.test_crysTrace_P1
For P¹ over k: Tr(h)=1 for h=c₁(O(1))∈H²_crys(P¹/W(k)).

test TauCeti.Crystalline.test_crysTrace_finite_extension
For X=Spec k′ with k′/k a finite extension (d=0): Tr_X:W(k′)→W(k) is the trace of the finite étale W(k)-algebra W(k′).

CrystallineCohomology:CR.3:duality/poincare-pairing

declaration TauCeti.Crystalline.crysPoincareDuality
Let k be a perfect field of characteristic p, W=W(k), X a proper smooth k-scheme of pure dimension d and E a finite locally free crystal on X/W with dual E^∨; write K(E)=RΓ_crys(X/W,E). The pairing K(E)⊗^L_W K(E^∨)→K(E⊗E^∨)→K(O_crys)→W[−2d], composed of the cup product, the evaluation E⊗E^∨→O_crys and Tr_X, is perfect: its adjoint K(E)→RHom_W(K(E^∨),W)[−2d] is an isomorphism in D(W). The same holds over W_n(k) with Tr_(X,n), compatibly with ⊗^L_W W_n. For E=O_crys and H^i=H^i_crys(X/W): H^i[1/p]⊗H^(2d−i)[1/p]→W[1/p] is a perfect pairing of W[1/p]-vector spaces, (H^i/tors)⊗_W(H^(2d−i)/tors)→W is a perfect pairing, and H^i_tors≅Hom_W(H^(2d−i+1)_tors,W[1/p]/W).

CrystallineCohomology:CR.3:duality/gysin

declaration TauCeti.Crystalline.crysGysin
Let k be a perfect field of characteristic p, W=W(k), and f:X→Y a morphism of proper smooth k-schemes of pure dimensions d_X and d_Y; write K(X)=RΓ_crys(X/W). (1) The Gysin map f_*:K(X)→K(Y)[2(d_Y−d_X)] is the transpose of f^*:K(Y)→K(X) under the duality isomorphisms of CR.3:duality/poincare-pairing: K(X)≅RHom_W(K(X),W)[−2d_X]→RHom_W(K(Y),W)[−2d_X]≅K(Y)[2(d_Y−d_X)]. It satisfies Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) for x∈H^i_crys(X/W), y∈H^(2d_X−i)_crys(Y/W). (2) Projection formula: f_*(x∪f^*y)=f_*x∪y. (3) For a second morphism g:Y→Z of proper smooth k-schemes of pure dimension, (g∘f)_*=g_*∘f_*. (4) For the structure map a:X→Spec k, a_*=Tr_X. (5) For a closed immersion f the class of X in Y is cl_Y(X)=f_*(1)∈H^(2(d_Y−d_X))_crys(Y/W).

api TauCeti.Crystalline.crysGysin_comp
(g∘f)_*=g_*∘f_* with the corresponding summed dimension shifts.

api TauCeti.Crystalline.crysGysin_projection
f_*(x·f^*y)=f_*x·y.

api TauCeti.Crystalline.crysGysin_trace
For the structural map X→Spec k, f_*=Tr_X.

api TauCeti.Crystalline.crysGysin_adjoint
Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) for x∈H^i_crys(X/W) and y∈H^(2d_X−i)_crys(Y/W); on complexes, f_* is the transpose of f^* under the duality isomorphisms.

api TauCeti.Crystalline.crysGysin_frobenius
p^(d_Y)·f_*(F_X x)=p^(d_X)·F_Y(f_*x) in H^*_crys(Y/W)[1/p] for x∈H^*_crys(X/W)[1/p]; for a closed immersion of codimension c, F_Y(f_*x)=p^c·f_*(F_X x).

test TauCeti.Crystalline.test_crysGysin_identity
For id_X, pushforward is the identity.

test TauCeti.Crystalline.test_crysGysin_hyperplane
For a hyperplane i:P^(d−1)→P^d over k: i_*(1)=h and i_*(h^j)=h^(j+1) for 0≤j≤d−1, h=c₁(O(1)).

test TauCeti.Crystalline.test_crysGysin_shift
For the structure map a:P^d→Spec k: a_*(h^d)=1 in W=H⁰_crys(Spec k/W) and a_*(h^j)=0 for j<d; the target of a_* is K(Spec k)[−2d]=W[−2d].

test TauCeti.Crystalline.test_crysGysin_finite_etale
For π:X′→X finite étale of constant degree n between proper smooth k-schemes of pure dimension d: π_*(1)=n in H⁰_crys(X/W) and π_*π^*x=n·x.

CrystallineCohomology:CR.3:duality/diagonal

declaration TauCeti.Crystalline.crysDiagonal
Let k be a perfect field of characteristic p, W=W(k), X a proper smooth k-scheme of pure dimension d, K=RΓ_crys(X/W) and Δ:X→X×_kX the diagonal. (1) [Δ_X]=Δ_*(1)∈H^(2d)_crys(X×X/W), Δ_* the Gysin map of CR.3:duality/gysin. (2) The correspondence [Δ_X] acts as the identity: pr_(2*)([Δ_X]∪pr₁^*x)=x for x∈H^*_crys(X/W). (3) Under the Künneth isomorphism K⊗^L_W K≅RΓ_crys(X×X/W), [Δ_X] is the coevaluation coev:W→(K⊗^L_W K)[2d] for the evaluation ev:K⊗^L_W K→W[−2d], ev(x⊗y)=Tr_X(x∪y): the composites (ev⊗id)∘(id⊗coev) and (id⊗ev)∘(coev⊗id) are the identity of K. (4) If the H^i=H^i_crys(X/W) are free with bases e_(i,j), then [Δ_X]=Σ_(i,j)e_(i,j)⊗e′_(2d−i,j) with e′_(2d−i,j)∈H^(2d−i) determined by Tr_X(e_(i,j)∪e′_(2d−i,j′))=(−1)^i·δ_(jj′). (5) For P^d: [Δ]=Σ_(i=0)^d h₁^i∪h₂^(d−i), h_a=pr_a^*h. The same holds over W_n(k), compatibly with reduction.

api TauCeti.Crystalline.crysDiagonal_action
The diagonal correspondence acts as id_K.

api TauCeti.Crystalline.crysDiagonal_triangles
Evaluation and coevaluation satisfy both triangular identities.

api TauCeti.Crystalline.crysDiagonal_projective
On P^d, [Δ]=Σh₁^i h₂^(d−i).

test TauCeti.Crystalline.test_crysDiagonal_point
For the point the diagonal class and coevaluation are 1.

test TauCeti.Crystalline.test_crysDiagonal_P1
For P¹, [Δ]=h₁+h₂.

test TauCeti.Crystalline.test_crysDiagonal_curve
For a geometrically connected smooth proper curve C of genus g over k, with pt∈H²_crys(C/W) of trace 1 and a basis a₁,…,a_g,b₁,…,b_g of H¹_crys(C/W) with Tr(a_i∪b_j)=δ_ij and Tr(a_i∪a_j)=0=Tr(b_i∪b_j): [Δ_C]=pt⊗1+1⊗pt+Σ_i(b_i⊗a_i−a_i⊗b_i).

test TauCeti.Crystalline.test_crysDiagonal_euler
Tr_(X×X)([Δ_X]∪[Δ_X])=Σ_i(−1)^i·rank_W H^i_crys(X/W); this is d+1 for P^d and 2−2g for a curve of genus g.

CrystallineCohomology:CR.4/dieudonne-algebra

api TauCeti.Crystalline.DieudonneAlgebra.ofDeRham
For a p-torsion-free ring R with a ring endomorphism φ, φ(x)≡x^p mod p: the absolute de Rham complex Ω^*_R with F(x)=φ(x) and F(dx)=x^(p−1)dx+d((φ(x)−x^p)/p) is a Dieudonné algebra; the same holds for the p-completed de Rham complex Ω̂^*_R=lim_n Ω^*_R/p^n (BLM Proposition 3.2.1, Variant 3.3.1).

api TauCeti.Crystalline.DieudonneAlgebra.ofDeRham_lift
For a p-torsion-free Dieudonné algebra A, restriction to degree 0 is a bijection from maps of Dieudonné algebras Ω^*_R→A to ring maps f:R→A⁰ with f∘φ=F∘f; if A is moreover termwise p-adically complete, the same holds for Ω̂^*_R (BLM Proposition 3.2.3, Variant 3.3.1).

CrystallineCohomology:CR.4/saturated-de-rham-witt

api TauCeti.Crystalline.satDRW_ofLift
For a p-torsion-free ring B with an endomorphism φ lifting Frobenius: maps of Dieudonné algebras Ω̂^*_B→A into a strict A correspond bijectively to ring maps B→A⁰/VA⁰; the map μ:Ω̂^*_B→WsatΩ_(B/pB) corresponding to B→B/pB→S_(B/pB) induces W(Sat Ω̂^*_B)≅WsatΩ_(B/pB) (BLM Proposition 4.2.1, Corollary 4.2.3).

CrystallineCohomology:CR.4/witt-basic-differentials

declaration TauCeti.Crystalline.basicWittExpansion
For S=A[T₁,…,T_d], A a Z_(p)-algebra, weights are k∈Z[1/p]≥0^d; order the support of k by increasing p-valuation, with a fixed tie order that is the same for k and p^a·k. A partition P of the support is a sequence of intervals I₀,…,I_q in increasing order, with I₀ allowed empty and the later intervals nonempty. Put t(I)=−min_(i∈I)v_p(k_i), u(I)=max(0,t(I)) and u(k)=max(0,−min_i v_p(k_i)); the weight k_I (the restriction of k to I) is integral when t(I)≤0, and the intervals with non-integral k_I come first. For ξ=V^u(k)(η) the basic form e(ξ,k,P) is the product, in order, of V^u(I₀)(η[T]^(p^u(I₀)k_I₀)) for block 0, dV^u(I)([T]^(p^u(I)k_I)) for each later block with k_I not integral, and F^(−t(I))d[T]^(p^t(I)k_I) for each later block with k_I integral. If I₀ is empty, η is placed inside the first factor, dV^u(I₁)(η[T]^(p^u(I₁)k_I₁)), when k is not integral, and in front of the product when k is integral. Every element of W_rΩ^q_(S/A) is uniquely a finite sum of basic forms e(ξ_(k,P),k,P) over weights with p^(r−1)·k integral (that is u(k)<r) and partitions into q+1 intervals, with ξ_(k,P)∈V^u(k)W_(r−u(k))(A). Every element of WΩ^q_(S/A)=lim_r W_rΩ^q_(S/A) is uniquely a convergent sum of basic forms, where for each m all but finitely many coefficients lie in V^mW(A).

CrystallineCohomology:CR.4/witt-localization-descent

declaration TauCeti.Crystalline.wittEtaleDescent
(1) For a map A→R of Z_(p)-algebras and an étale R-algebra S, the natural map W_r(S)⊗_(W_r(R))W_rΩ^*_(R/A)→W_rΩ^*_(S/A) is an isomorphism for every r≥1; it is an isomorphism of differential graded algebras for the unique extension of the derivation to the tensor product, which is not 1⊗d. In particular W_r(R_f)⊗_(W_r(R))W_rΩ^*_(R/A)≅W_rΩ^*_(R_f/A) for f∈R. (2) If p^m·W_r(A)=0, then W_(m+r)(S)⊗_(W_(m+r)(R),F^m)W_rΩ^i_(R/A)≅W_rΩ^i_(S/A), and in this description 1⊗d induces d. (3) For a saturated Dieudonné algebra A and s∈A⁰ with F(s)=s^p, the map W_r(A)[s̄⁻¹]→W_r(A[s⁻¹]) is an isomorphism of differential graded algebras; hence for an F_p-algebra R and s∈R, W_r(WsatΩ_R)[[s]⁻¹]≅W_r(WsatΩ_(R[1/s])), and WsatΩ_(R[1/s]) is the strict completion W(WsatΩ_R[[s]⁻¹]); the localisation WsatΩ_R[[s]⁻¹] itself is in general not strict. For an étale map R→S of F_p-algebras, W_r(WsatΩ_R)⊗_(W_r(R))W_r(S)≅W_r(WsatΩ_S) for every r. (4) For a scheme X over a Z_(p)-algebra A, U↦W_rΩ^q_(O(U)/A) on affine opens is a quasi-coherent sheaf on the scheme (|X|,W_r(O_X)), and an étale sheaf when p is nilpotent in A. For an F_p-scheme X, U↦W_r(WsatΩ^q_(O(U))) and U↦WsatΩ^q_(O(U)) are sheaves for the Zariski and the étale topology on affines, the former quasi-coherent over W_r(O_X), and the Zariski cohomology groups H^n(Spec R,WsatΩ^q) vanish for n>0.

CrystallineCohomology:CR.4/witt-quotients-topologies

declaration TauCeti.Crystalline.wittQuotientCompletion
Let A be a ring and r≥1. For an ideal I⊂A put W_r(I)=ker(W_r(A)→W_r(A/I)) and let [I]⊂W_r(A) be the ideal generated by the Teichmüller lifts [a], a∈I. (a) For every ideal I and s≥1: [I]^s⊂[I^s]⊂W_r(I^s) and [I]^s⊂W_r(I)^s⊂W_r(I^s). If I is finitely generated with finite generating set Σ, then moreover W_r(I^(|Σ|·p^r·s))⊂⟨[a^s]:a∈Σ⟩⊂[I]^s; so the five chains ⟨[a^s]:a∈Σ⟩, [I]^s, [I^s], W_r(I)^s, W_r(I^s) are intertwined. (b) [p]^(2s)·W_r(A)⊂p^s·W_r(A), p^(rs)·W_r(A)⊂W_r(pA)^s and W_r(pA)^(p^r·s)⊂[p]^s·W_r(A); so the [p]-adic, W_r(pA)-adic and p-adic topologies of W_r(A) coincide. (c) For a map A→R of Z_(p)-algebras and an ideal I⊂R, the kernel of W_rΩ^*_(R/A)→W_rΩ^*_((R/I)/A) is the differential graded ideal generated by W_r(I). If I is finitely generated by Σ, the chains ⟨[a^s]:a∈Σ⟩·W_rΩ^*_(R/A) and ker(W_rΩ^*_(R/A)→W_rΩ^*_((R/I^s)/A)) are intertwined. (d) For a map A→R of Z_(p)-algebras and a finitely generated ideal I⊂A, the pro-objects {W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A)/[I^s]}_s and {W_rΩ^*_((R/I^sR)/(A/I^s))}_s are isomorphic; in particular their inverse limits over s agree.

CrystallineCohomology:CR.4/continuous-relative-witt

api TauCeti.Crystalline.continuousWitt_eval
For q≥0, r≥1 and s≥1, ev_s:W_rΩ^(q,cont)_(R/A)→W_rΩ^q_((R/p^s)/(A/p^s)) is the projection. Its image coordinates satisfy res_(s+1,s)∘ev_(s+1)=ev_s, and a compatible family of coordinates defines exactly one element of the limit.

api TauCeti.Crystalline.continuousWitt_map
For ring maps a:A→A′ and b:R→R′ with b∘(A→R)=(A′→R′)∘a, the map b_*:W_rΩ^(q,cont)_(R/A)→W_rΩ^(q,cont)_(R′/A′) is induced by the maps modulo p^s and satisfies ev_s∘b_*=(b mod p^s)_*∘ev_s. Identity and composition agree coordinatewise.

api TauCeti.Crystalline.continuousWitt_operators
For r≥1, restriction and F map W_(r+1)Ω^(q,cont)→W_rΩ^(q,cont), V maps W_rΩ^(q,cont)→W_(r+1)Ω^(q,cont), and d maps degree q to q+1 at fixed r. Every ev_s intertwines these operators with the operator at base (R/p^s)/(A/p^s). Hence FV=p, FdV=d, d²=0 and dF=pFd hold with these domains.

test TauCeti.Crystalline.test_continuousWitt_p_nilpotent
If p^N=0 on A and R, the defining tower is eventually constant and recovers W_rΩ_(R/A).

test TauCeti.Crystalline.test_continuousWitt_identity
For R=A the result has only degree0, the p-completion of W_r(A).

test TauCeti.Crystalline.test_continuousWitt_r1
At r=1 it is the degreewise p-completed ordinary relative de Rham complex.

CrystallineCohomology:CR.4/torus-integral-part

declaration TauCeti.Crystalline.wittTorusIntegral
For S=A[T₁^±1,…,T_d^±1], the basic Witt expansion extends to all weights a∈p^(−r)Z^d, ordered by v_p(a_i), including v_p(0)=∞. Partition all coordinate indices into ordered blocks I₀,…,I_q, with I₀ possibly empty and the others nonempty. Nonintegral blocks use V and dV; integral nonzero blocks use F^v d of the corresponding divided-weight Teichmüller monomial; zero blocks use dlog of the product of their coordinates, as in the three cases of BMS1 10.12. The coefficient module for weight a is V^u(a)W_(r−u(a))(A), u(a)=max(−min_i v_p(a_i),0). The map τ:Ω^*_(W_r(A)[U^±1]/W_r(A))→W_rΩ^*_(S/A), U_i↦[T_i], is injective and a quasi-isomorphism. Its image is exactly the integral-weight subcomplex; the fractional-weight complement is acyclic. The image depends on these coordinates.

CrystallineCohomology:CR.4/perfectoid-base-change

declaration TauCeti.Crystalline.wittPerfectoidBaseChange
For a homomorphism A→A′ of perfectoid rings, a smooth A-algebra R with base change R′=R⊗_A A′, and r≥1: (i) the W_r(A)-modules W_rΩ^q_(R/A) and W_r(A′) are Tor-independent for every q≥0; (ii) the canonical map W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A′)→W_rΩ^*_(R′/A′) is an isomorphism of differential graded W_r(A′)-algebras.

CrystallineCohomology:CR.4/classical-regular-comparison

declaration TauCeti.Crystalline.classicalSaturatedComparison
(1) Let R be a regular Noetherian F_p-algebra and {W_rΩ^*_R}_r its classical de Rham–Witt complex (CR.4/classical-de-rham-witt). The tower {W_r(WsatΩ_R)}_r, with its Verschiebung maps and the map W(R)→WsatΩ_R⁰ lifting e:R→S_R, is an R-framed V-pro-complex, and the resulting maps γ_r:W_rΩ^*_R→W_r(WsatΩ_R) are isomorphisms for all r≥0; hence γ:WΩ^*_R→WsatΩ_R is an isomorphism of differential graded algebras compatible with V, restriction and the maps from W(R), and ν:Ω^*_R→W_1(WsatΩ_R) is an isomorphism. (2) Let k be a perfect F_p-algebra and R a smooth k-algebra; then ν:Ω^*_R→W_1(WsatΩ_R) is an isomorphism. (3) Let B be a p-torsion-free ring with a ring endomorphism φ, φ(x)≡x^p mod p, such that B/pB is smooth over a perfect F_p-algebra. Then the p-completed de Rham complex Ω̂^*_B is a Dieudonné complex of Cartier type, and the map μ:Ω̂^*_B→WsatΩ_(B/pB) of CR.4/saturated-de-rham-witt is a quasi-isomorphism.

CrystallineCohomology:CR.4/crystalline-comparison

declaration TauCeti.Crystalline.crystallineWittComparison
(a) Let A be a ring in which p is nilpotent and X a smooth A-scheme. For each r≥1 there is an isomorphism Ru_(r*)O_(X/W_r(A))≅W_rΩ^*_(X/A) in D⁺(X_Zar,W_r(A)), functorial in X, where u_r:(X/W_r(A))_crys→X_Zar and the crystalline site is formed with respect to the canonical divided powers on the kernel V W_(r−1)(A) of the projection w₀:W_r(A)→A. (b) More generally, for a quasi-coherent crystal E of flat modules on (X/W_r(A))_crys, Ru_(r*)E is represented by E_r⊗_(W_r(O_X))W_rΩ^*_(X/A), where E_r is the value of E on the PD thickening X→W_r(X) and the differential is induced by the connection of the crystal. (c) For X smooth over a perfect field k (the case A=k), these isomorphisms are compatible in r and give Ru_*O_(X/W(k))≅Rlim_r W_rΩ^*_(X/k)≅WΩ^*_(X/k), and the corresponding isomorphisms on RΓ(X,−); here lim_r W_rΩ^q=Rlim_r W_rΩ^q because the restriction maps are surjective on affine opens.

CrystallineCohomology:CR.4/degree-scaled-frobenius

declaration TauCeti.Crystalline.wittCrystallineFrobenius
In every F–V procomplex dF=pFd, so the graded Frobenius F is in general not a map of complexes. Let p be nilpotent in A and X a smooth A-scheme. The absolute Frobenius 𝐅:W_rΩ^q_(X/A)→W_(r−1)Ω^q_(X/A), 𝐅=p^q·F, is a map of complexes, semilinear over F:W_r(A)→W_(r−1)(A); it is the map induced on de Rham–Witt complexes by F:W_r(O_X)→W_(r−1)(O_X). The crystalline complexes carry an absolute Frobenius 𝐅:Ru_(r*)O_(X/W_r(A))→Ru_((r−1)*)O_(X/W_(r−1)(A)), induced by the absolute Frobenius of X₀=X⊗F_p and the PD morphism Spec W_(r−1)(A)→Spec W_r(A) given by F, for the divided powers extended to the kernel of W_r(A)→A/pA. The comparison isomorphisms of CR.4/crystalline-comparison at levels r and r−1 intertwine the two maps 𝐅. For X smooth over a perfect field k, the limit over r is the endomorphism φ=p^q·F of the complex WΩ^*_(X/k), and it corresponds to the crystalline Frobenius of Ru_*O_(X/W(k)).

CrystallineCohomology:CR.4/leta-fixed-point

declaration TauCeti.Crystalline.strictDieudonneFixedPoint
Let D(Z)^_p be the full subcategory of derived p-complete objects of D(Z); Lη_p preserves it. Sending a strict Dieudonné complex M to the pair (M,α_F:M≅Lη_pM) is an equivalence from the category of strict Dieudonné complexes to the fixed-point category of Lη_p on D(Z)^_p, whose objects are pairs (X,φ:X≅Lη_pX) and whose morphisms are the maps X→X′ in D(Z) commuting with φ, φ′. The fixed-point ∞-category, defined as the equalizer of the identity and Lη_p on the ∞-category of derived p-complete objects of the derived ∞-category of Z (so that objects carry a specified equivalence and morphisms a specified homotopy), has discrete mapping spaces, and the forgetful functor from it to the ordinary fixed-point category is an equivalence. For strict M, F^r induces isomorphisms W_r(M)≅H^*(M/p^rM), so M=lim_r W_r(M) is recovered from the cohomology of the reductions M⊗^L Z/p^r.

CrystallineCohomology:CR.4/witt-slope-spectral-sequence

declaration TauCeti.Crystalline.wittSlopeSpectralSequence
Let X be a smooth proper scheme of dimension d over a perfect field k, W=W(k), K=W[1/p]. The filtration of WΩ^*_X by the subcomplexes WΩ^(≥a)_X, 0≤a≤d, gives a convergent spectral sequence E₁^(a,b)=H^b(X,WΩ^a_X)⇒H^(a+b)_crys(X/W), compatible with the Frobenius φ, which acts on the a-th column through p^a·F. After tensoring with K, the E₁ terms are finite-dimensional over K, the Frobenius on the a-th column has slopes in [a,a+1), and the spectral sequence degenerates at E₁; so H^b(X,WΩ^a_X)⊗K is the part of H^(a+b)_crys(X/W)⊗K with slopes in [a,a+1). For each r≥1 the same filtration of W_rΩ^*_X gives a spectral sequence E₁^(a,b)=H^b(X,W_rΩ^a_X)⇒H^(a+b)_crys(X/W_r(k)).

CrystallineCohomology:CR.4/nygaard-filtration-comparisons

declaration TauCeti.Crystalline.nygaardComparisons
Let R be a smooth algebra over a perfect field k and WΩ=WΩ^*_R with its Nygaard filtration. (1) The composite N^(≥i)WΩ--φ_i→WΩ→Ω^*_(R/k) lands in the canonical truncation τ^(≤i)Ω^*_(R/k), kills N^(≥i+1)WΩ, and induces a quasi-isomorphism gr^i_N WΩ→τ^(≤i)Ω^*_(R/k). (2) The sequence WΩ/N^(≥i)--p→WΩ/N^(≥i+1)→Ω^(≤i)_(R/k) is a cofiber sequence, where Ω^(≤i) is the stupid truncation and the second map is induced by WΩ→Ω^*_(R/k)→Ω^(≤i)_(R/k). (3) Let Ã be the p-adic completion of a smooth W(k)-algebra lifting R, with a chosen lift φ̃ of Frobenius, and let σ:Ω̂^*_(Ã/W(k))→WΩ be the comparison map constructed from φ̃. Then σ maps the subcomplex p^max(i−•,0)Ω̂^•_(Ã/W(k)), with terms p^(i−q)Ω̂^q for q<i and Ω̂^q for q≥i, into N^(≥i)WΩ, and the induced map is a quasi-isomorphism for every i≥0.

CrystallineCohomology:CR.4/logarithmic-witt-sheaf

declaration TauCeti.Crystalline.LogWitt
Let X be a regular locally Noetherian F_p-scheme, q≥0 and r≥1, and let W_rΩ^q_X be the sheaf on the small étale site of X given on affines by the de Rham–Witt complex (on regular Noetherian rings the classical, Langer–Zink and saturated complexes agree by CR.4/classical-regular-comparison). The logarithmic Hodge–Witt sheaf W_rΩ^q_(X,log) is the image, in the category of sheaves on X_ét, of the map (O_X^×)^(⊗q)→W_rΩ^q_X, u₁⊗⋯⊗u_q↦dlog[u₁]∧⋯∧dlog[u_q], where dlog[u]=[u]⁻¹·d[u]. For q=0 it is the image of Z→W_r(O_X), the constant sheaf Z/p^r. Its sections are closed forms. For X smooth over a perfect field k, WΩ^q_(X,log)=lim_r W_rΩ^q_(X,log), formed in sheaves on the pro-étale site of X.

api TauCeti.Crystalline.LogWitt.symbol
For V→X étale and units u₁,…,u_q∈O_X(V)^×, symbol_V(u₁,…,u_q)∈W_rΩ^q_(X,log)(V) has image ∧_(i=1)^q([u_i]⁻¹d[u_i]) in W_rΩ^q_X(V). The empty tuple maps to 1. The symbol is additive in each unit under multiplication, and commutes with étale restriction and length restriction.

api TauCeti.Crystalline.LogWitt.closed_fixed
Every local section ω of W_rΩ^q_(X,log) satisfies dω=0. For every local section ω̃ of W_(r+1)Ω^q_(X,log) with restriction ω to level r, F(ω̃)=ω in W_rΩ^q_X, where F:W_(r+1)Ω^q_X→W_rΩ^q_X; indeed F(dlog[u])=dlog[u].

api TauCeti.Crystalline.LogWitt.map
Pullback of schemes sends a unit symbol to the symbol of its pulled-back units.

test TauCeti.Crystalline.test_logWitt_zero_degree
W_rΩ⁰_log is the constant Z/p^r generated by1.

test TauCeti.Crystalline.test_logWitt_torus
On G_m, the symbol of t is dlog[t], a closed degree-one section.

test TauCeti.Crystalline.test_logWitt_not_all
On Spec F_p[t] at length1, dt is not a logarithmic section on the whole scheme: its Cartier image is0 whereas logarithmic forms are Cartier fixed.

CrystallineCohomology:CR.4/logarithmic-witt-sequences

declaration TauCeti.Crystalline.logWittExactSequences
Let X be a regular locally Noetherian F_p-scheme and q≥0; all sheaves are on the small étale site of X. (1) For r≥1, F:W_(r+1)Ω^q_X→W_rΩ^q_X induces F:W_rΩ^q_X→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X (with Ω^(−1)=0), and the sequence 0→W_rΩ^q_(X,log)→W_rΩ^q_X--1−F→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X→0 is exact. (2) The sequence of pro-sheaves 0→W_•Ω^q_(X,log)→W_•Ω^q_X--R−F→W_•Ω^q_X→0 is exact. (3) For positive integers n, m, multiplication by p^m on W_(n+m)Ω^q_(X,log) induces a map p̲^m:W_nΩ^q_(X,log)→W_(n+m)Ω^q_(X,log), and the sequence 0→W_nΩ^q_(X,log)--p̲^m→W_(n+m)Ω^q_(X,log)--R^n→W_mΩ^q_(X,log)→0 is exact; consequently 0→W_•Ω^q_(X,log)--p^m→W_•Ω^q_(X,log)→W_mΩ^q_(X,log)→0 is an exact sequence of pro-sheaves.

CrystallineCohomology:CR.4/semistable-log-witt-models

declaration TauCeti.Crystalline.LogWittModel
Let κ be a perfect field of characteristic p, W=W(κ), K₀=W[1/p]. Let W[t]° be Spec W[t] with the log structure associated with 1↦t, W° its fibre at t=0, κ° the fibre of W° at p=0 (the standard log point), and W^triv=Spec W with the trivial log structure. Let (X,L) be a log scheme of finite type and strictly semistable over κ°, and {(X^⋆,L^⋆)↪(Z^⋆,N^⋆)} an admissible embedding system for (X,L)/W[t]°; put (Y^⋆,M^⋆)=(Z^⋆,N^⋆)×_(W[t]°)W°, and for l≥1 let D_l^⋆ be the PD envelope of X^⋆ in Y_l^⋆=Y^⋆⊗Z/p^l, over W with its usual divided powers. Define, in D⁺(X_ét,W_•) (systems indexed by l), Wω_X=Ru_*(Ω^*_((Y^⋆,M^⋆)/W°)⊗O_(D_l^⋆)) and Wω̃_X=Ru_*(Ω^*_((Z^⋆,N^⋆)/W^triv)⊗O_(D_l^⋆)), where u:X^⋆→X is the augmentation of the hypercovering. They do not depend on the embedding system. After applying Rlim_l and ⊗_W K₀ there is a distinguished triangle Wω_(X,K₀)[−1]→Wω̃_(X,K₀)→Wω_(X,K₀)--N→Wω_(X,K₀) in D⁺(X_ét,K₀), whose first map is ∧dlog t, whose second map is the natural projection, and whose third map N is the connecting map. The convergent complexes ω_X, ω̃_X∈D⁺(X_ét,K₀) of Disegni–Liu (the same differential forms with the tube of X^⋆ in place of the PD envelopes) are related to them by natural equivalences ω_X≃Wω_(X,K₀), ω̃_X≃Wω̃_(X,K₀), under which the triangle (B.1) of Disegni–Liu corresponds to this one.

api TauCeti.Crystalline.LogWittModel.envelope_eval
For an admissible embedding system, Wω_X and Wω̃_X are represented by Ru_* of the complexes Ω^*_((Y^⋆,M^⋆)/W°)⊗O_(D_l^⋆) and Ω^*_((Z^⋆,N^⋆)/W^triv)⊗O_(D_l^⋆), l≥1, on the hypercovering X^⋆.

api TauCeti.Crystalline.LogWittModel.embedding_independence
The product-embedding maps are compatible quasi-isomorphisms and satisfy the cocycle.

api TauCeti.Crystalline.LogWittModel.rational_compare
There are natural equivalences ω_X≃Wω_(X,K₀) and ω̃_X≃Wω̃_(X,K₀) in D⁺(X_ét,K₀) (Disegni–Liu (B.5)) carrying the triangle (B.1) of the convergent complexes to the triangle (B.4); in particular they commute with the maps ∧dlog t.

api TauCeti.Crystalline.LogWittModel.monodromy_triangle
Wω_(X,K₀)[−1]--∧dlog t→Wω̃_(X,K₀)→Wω_(X,K₀)--N→Wω_(X,K₀) is a distinguished triangle in D⁺(X_ét,K₀), and N is its connecting map (Disegni–Liu (B.4)).

test TauCeti.Crystalline.test_logWittModel_point
For X=κ° with the embedding κ°↪W[t]° (Z=Spec W[t], Y=W°, D_l=Spec W/p^l): Wω_X=(W/p^l)_l in degree 0, Wω̃_X=(W/p^l⊕W/p^l·dlog t)_l in degrees 0 and 1 with zero differential, and the connecting map N of the triangle is 0.

test TauCeti.Crystalline.test_logWittModel_diagonal_embedding
For an admissible embedding system E of (X,L), the isomorphisms Wω_X(E)≅Wω_X(E) and Wω̃_X(E)≅Wω̃_X(E) obtained by comparing E with itself through the product system E×E and its two projections are the identity maps.

test TauCeti.Crystalline.test_logWittModel_rational_scope
For X=κ° with the embedding κ°↪W[t]°: the tube of X in the generic fibre of the formal completion of Y=W° is the point Sp K₀, so ω_X=K₀ in degree 0 and ω̃_X=K₀⊕K₀·dlog t in degrees 0 and 1 with zero differential; Wω_(X,K₀) and Wω̃_(X,K₀) are the same complexes, and the equivalences of (B.5) are the identity maps.

CrystallineCohomology:CR.4/log-witt-proper-support

declaration TauCeti.Crystalline.LogWittSupport
In the situation of CR.4/semistable-log-witt-models let F:U→X be the inclusion of an open subscheme, and let ω̃_(U,X), ω⁺_(U,X)∈D⁺(X_ét,K₀) be the convergent complexes with support of Disegni–Liu, defined like ω̃_X and ω⁺_X with the tube functor f^!_(U^⋆,X^⋆) inserted (f^! is the kernel of the unit id→g_*g^* for the open immersion g of the tube of X^⋆∖U^⋆ into the tube of X^⋆). (1) There is a natural map F_!F^*Wω̃_(X,K₀)→ω̃_(U,X) in D⁺(X_ét,K₀) (Disegni–Liu (B.6)): F_!F^* applied to the inverse of the equivalence ω̃_X≃Wω̃_(X,K₀), followed by the natural transformation F_!∘F^*∘Rs_*→Rs_*∘f^! of their Lemma B.3. (2) Let WΞ_X∈D⁺(X_ét,W_•) be Sato's cohomological de Rham–Witt complex, with the equivalence ω⁺_X≃WΞ_(X,K₀). In the same way there is a natural map F_!F^*WΞ_(X,K₀)→ω⁺_(U,X) (Disegni–Liu (B.9)). (3) Assuming the correspondence between Sato’s map and the quotient map specified below, these two maps form a commutative square (Disegni–Liu (B.10)) with the map F_!F^*Wω̃_(X,K₀)→F_!F^*WΞ_(X,K₀)[−1] induced by Sato's map Wω̃_X→WΞ_X[−1] and the map ω̃_(U,X)→ω⁺_(U,X)[−1] induced by the quotient maps Ω^(q+1)_((Z^⋆,N^⋆)/W^triv)⊗O_(Y^⋆)→Ξ^q_(Z^⋆)=Ω^(q+1)_((Z^⋆,N^⋆)/W^triv)/Ω^(q+1)_(Z^⋆/W). The map ∧dlog t is the map ω_(U,X)[−1]→ω̃_(U,X) of Disegni–Liu (B.8); it does not occur in (B.10). For U=X the tube functor is the identity and the maps (1), (2) are the inverses of the comparison equivalences.

api TauCeti.Crystalline.LogWittSupport.compare
Natural maps F_!F^*Wω̃_(X,K₀)→ω̃_(U,X) and F_!F^*WΞ_(X,K₀)→ω⁺_(U,X) in D⁺(X_ét,K₀) (Disegni–Liu (B.6), (B.9)).

api TauCeti.Crystalline.LogWittSupport.open_identity
For U=X, the tube support functor is the identity and the comparison recovers the full rational model comparison.

api TauCeti.Crystalline.LogWittSupport.dlog_square
Under the compatibility hypothesis of clause (3), the maps (B.6) and (B.9) form the square (B.10), whose vertical arrows are the support comparison maps and whose horizontal arrows are induced respectively by Sato’s map and by the quotient of forms. Naturality of the tube support transformation proves the square.

test TauCeti.Crystalline.test_logWittSupport_empty
For U=∅: g is the identity of the tube of X^⋆, f^!_(∅,X)=ker(id→id)=0, so ω̃_(∅,X)=ω⁺_(∅,X)=0, and the sources F_!F^*(−) of (B.6) and (B.9) are 0.

test TauCeti.Crystalline.test_logWittSupport_full
For U=X: the tube of X∖U is empty, f^!_(X,X) is the identity, ω̃_(X,X)=ω̃_X, and (B.6) is the inverse of the equivalence ω̃_X≃Wω̃_(X,K₀) of (B.5).

test TauCeti.Crystalline.test_logWittSupport_map
Let X=X₁⊔X₂ be a disjoint union of two smooth points over κ°, with the standard semistable log structures, and U=X₁. The source and target of (B.6) restrict on X₁ to the full comparison and on X₂ to zero. The support map is the full comparison on X₁ and zero on X₂; replacing support by the full complex or by zero fails this test.

CrystallineCohomology:CR.1/integrable-connection

api TauCeti.Crystalline.crisDifferentials
On Cris(X/S), Ω_{X/S} with d_{X/S}:O_crys→Ω_{X/S} is the universal PD S-derivation; (Ω_{X/S})_T=Ω_{T/S,δ} and d_{X/S} restricts to d_{T/S,δ}; Ω_{X/S} has quasi-coherent restrictions and c_f:f^*(Ω_{X/S})_T′→(Ω_{X/S})_T is surjective when f:T→T′ is a closed immersion, but Ω_{X/S} is in general not a crystal (Stacks Lemmas 60.12.3 and 60.12.6).

api TauCeti.Crystalline.Connection.ofCrystal
A crystal F in O_crys-modules on Cris(X/S) carries a canonical integrable connection: for an object (U,T,δ), with T′ the first-order thickening O_T′=O_T⊕Ω_{T/S,δ}, projections p₀,p₁:T′→T and c=c_{p₁}⁻¹∘c_{p₀}:p₀^*F_T→p₁^*F_T, one has ∇(s)=p₁^*s−c(p₀^*s) in F_T⊗_{O_T}Ω_{T/S,δ} (Stacks Lemma 60.15.1).

CrystallineCohomology:CR.3/first-chern-class

declaration TauCeti.Crystalline.crysChern
Let (S,I,γ) be a PD scheme over Z_(p), S₀=V(I), and X an S₀-scheme on which p is locally nilpotent. On the crystalline site of X/S let O_crys, O_X^cris and J_crys=ker(O_crys→O_X^cris) be the sheaves of CR.1/structure-sheaves, δ the divided powers of J_crys, and u:(X/S)_crys→X_Zar the projection. (1) The sequence of sheaves of abelian groups 1→1+J_crys→O_crys^*→(O_X^cris)^*→1 is exact, and (O_X^cris)^*=u^(−1)O_X^*. (2) log:1+J_crys→J_crys, log(1+x)=Σ_(n≥1)(−1)^(n−1)·(n−1)!·δ_n(x), is a homomorphism from the multiplicative group 1+J_crys to the additive group J_crys; on each thickening the sum is locally finite because p is locally nilpotent there. (3) The first Chern class c₁:Pic(X)=H¹(X,O_X^*)→H²_crys(X/S)=H²((X/S)_crys,O_crys) is the composite of u^(−1), the connecting homomorphism H¹((O_X^cris)^*)→H²(1+J_crys) of (1), the map induced by log, and the map induced by J_crys⊂O_crys. (4) The sign of the connecting homomorphism is fixed by the following property: if p is nilpotent on S, Y is a smooth lift of X over S and L̃ is an invertible O_Y-module lifting L, with trivialising sections s_λ on an open cover, then under H²_crys(X/S)≅H²(Y,Ω^•_(Y/S)) the class c₁(L) is the class of the Čech 1-cocycle (dlog(s_μ/s_λ))_(λ,μ) with values in Ω¹_(Y/S), the de Rham first Chern class of L̃. (5) c₁ is a homomorphism of groups and is natural for the morphisms of crystalline topoi induced by commutative squares of schemes over PD morphisms. (6) For a perfect field k of characteristic p and X proper smooth over k, c₁(L)∈H²_crys(X/W(k)) is the compatible system of the classes c₁(L)∈H²_crys(X/W_n(k)); the hyperplane class is h=c₁(O(1))∈H²_crys(P^d_k/W(k)).

api TauCeti.Crystalline.crysChern_log
log((1+x)(1+y))=log(1+x)+log(1+y) for local sections x, y of J_crys, where log(1+x)=Σ_(n≥1)(−1)^(n−1)·(n−1)!·δ_n(x).

api TauCeti.Crystalline.crysChern_add
c₁(L⊗M)=c₁(L)+c₁(M), c₁(O_X)=0 and c₁(L^∨)=−c₁(L) for invertible O_X-modules L, M.

api TauCeti.Crystalline.crysChern_pullback
For a morphism g:X′→X over a morphism of PD schemes S′→S: g^*c₁(L)=c₁(g^*L) in H²_crys(X′/S′).

api TauCeti.Crystalline.crysChern_fil
c₁(L) lies in the image of H²((X/S)_crys,J_crys)→H²_crys(X/S).

api TauCeti.Crystalline.crysChern_deRham
If p is locally nilpotent on S, Y is a smooth lift of X over S and L̃ an invertible O_Y-module lifting L with trivialising sections s_λ, then under H²_crys(X/S)≅H²(Y,Ω^•_(Y/S)) of CR.2/smooth-lift-filtration c₁(L) is the class of the Čech 1-cocycle (dlog(s_μ/s_λ)) with values in Ω¹_(Y/S).

api TauCeti.Crystalline.crysChern_reduction
For k perfect and X proper smooth over k, the reduction H²_crys(X/W(k))→H²_crys(X/W_n(k)) sends c₁(L) to c₁(L), and for n=1 the image is the de Rham class c₁^dR(L)∈H²_dR(X/k).

api TauCeti.Crystalline.crysChern_hyperplane
h=c₁(O(1))∈H²_crys(P^d_k/W(k)) for a perfect field k of characteristic p and d≥1.

test TauCeti.Crystalline.test_crysChern_P1
For a perfect field k of characteristic p, H²_crys(P¹_k/W_n(k)) is free of rank one over W_n(k) with basis h=c₁(O(1)); under H²_crys(P¹_k/W_n)≅H²(P¹_(W_n),Ω^•) the class h is that of the Čech 1-cocycle dt/t on U₀∩U₁, t=T₁/T₀.

test TauCeti.Crystalline.test_crysChern_twist
c₁(O(m))=m·h in H²_crys(P^d_k/W(k)) for every integer m.

test TauCeti.Crystalline.test_crysChern_mod_p
For k a perfect field of characteristic p and S=Spec k: c₁(O(p))=0 in H²_crys(P¹_k/k)=H²_dR(P¹_k/k), although O(p) is not trivial and c₁(O(p))=p·h≠0 in H²_crys(P¹_k/W(k)); so c₁ is not injective, and the class over W(k) is not determined by its reduction modulo p.

test TauCeti.Crystalline.test_crysChern_trivial
c₁(O_X)=0 in H²_crys(X/S).

CrystallineCohomology:CR.4/strict-dieudonne-tower

declaration TauCeti.Crystalline.StrictDieudonneTower
A strict Dieudonné tower is an inverse system ⋯→X_3→X_2→X_1→X_0 of cochain complexes of abelian groups, with transition maps R:X_(r+1)→X_r, equipped with maps of graded abelian groups F:X_(r+1)→X_r and V:X_r→X_(r+1) for every r≥0, such that: (1) X_0=0; (2) R:X_(r+1)→X_r is surjective for every r≥0; (3) F:X_(r+1)→X_r satisfies dF=pFd for every r≥0; (4) F, R and V commute with each other; (5) F(V(x))=p·x=V(F(x)) for every x∈X_r; (6) every x∈X_r such that dx is divisible by p lies in the image of F:X_(r+1)→X_r; (7) the kernel of R:X_(r+1)→X_r is the subgroup X_(r+1)[p] of elements x with p·x=0; (8) the kernel of R:X_(r+1)→X_r is the span of the images of V^r:X_1→X_(r+1) and dV^r:X_1→X_(r+1). A morphism of strict Dieudonné towers is a morphism of towers of cochain complexes compatible with F and V; TD denotes the category of strict Dieudonné towers. (a) For a saturated Dieudonné complex M, the tower (W_r(M))_(r≥0) with the maps Res, F and V of CR.4/verschiebung-completion-tower is a strict Dieudonné tower. (b) For a strict Dieudonné tower (X_r), the inverse limit X=lim_r X_r, with F the inverse limit of the maps F:X_(r+1)→X_r, is a saturated Dieudonné complex; for every r≥0 the projection X→X_r induces an isomorphism of cochain complexes W_r(X)=X/(im V^r+im dV^r)≅X_r; these isomorphisms form an isomorphism of strict Dieudonné towers (W_r(X))_r≅(X_r)_r; and X is a strict Dieudonné complex. (c) The functor M↦(W_r(M))_(r≥0) from the category DC_str of strict Dieudonné complexes to TD is an equivalence of categories, with inverse (X_r)_(r≥0)↦lim_r X_r.

api TauCeti.Crystalline.StrictDieudonneTower.ofSaturated
For a saturated Dieudonné complex M, the complexes W_r(M) (r≥0) with Res:W_(r+1)(M)→W_r(M), F:W_(r+1)(M)→W_r(M) and V:W_r(M)→W_(r+1)(M) form a strict Dieudonné tower (BLM Proposition 2.6.2).

api TauCeti.Crystalline.StrictDieudonneTower.limit
For a strict Dieudonné tower X, the inverse limit lim_r X_r with (Fx)_r=F(x_(r+1)) is a saturated Dieudonné complex, and its Verschiebung is given by (Vx)_(r+1)=V(x_r), (Vx)_0=0 (BLM Proposition 2.6.5).

api TauCeti.Crystalline.StrictDieudonneTower.limitWIso
For a strict Dieudonné tower X and every r≥0, the projection lim_s X_s→X_r is surjective with kernel im V^r+im dV^r; so it induces an isomorphism of cochain complexes W_r(lim_s X_s)≅X_r, and these isomorphisms commute with R, F and V (BLM Proposition 2.9.1, Corollary 2.9.2).

api TauCeti.Crystalline.StrictDieudonneTower.limit_isStrict
For a strict Dieudonné tower X, lim_r X_r is a strict Dieudonné complex in the sense of CR.4/strict-dieudonne-complex (BLM Corollary 2.9.3).

api TauCeti.Crystalline.StrictDieudonneTower.Hom
A morphism X→Y of strict Dieudonné towers is a family of maps of cochain complexes f_r:X_r→Y_r with R∘f_(r+1)=f_r∘R, F∘f_(r+1)=f_r∘F and V∘f_r=f_(r+1)∘V. It induces a morphism of Dieudonné complexes lim f:lim_r X_r→lim_r Y_r, with lim(id)=id and lim(g∘f)=lim(g)∘lim(f); a morphism f:M→N of saturated Dieudonné complexes induces the morphism (W_r(f))_r of towers, compatibly with identities and composition.

api TauCeti.Crystalline.StrictDieudonneTower.equivalence
M↦(W_r(M))_r, from strict Dieudonné complexes to strict Dieudonné towers, and X↦lim_r X_r are inverse equivalences of categories: ρ_M:M→lim_r W_r(M) is a natural isomorphism for strict M, and W_r(lim_s X_s)≅X_r is a natural isomorphism of towers (BLM Corollary 2.9.4).

api TauCeti.Crystalline.StrictDieudonneTower.relations
In a strict Dieudonné tower: p^r·X_r=0 for every r≥0 (by (1) and (7), by induction on r); and V∘d=p·d∘V:X_r^n→X_(r+1)^(n+1) and F∘d∘V=d:X_r^n→X_r^(n+1). The last two are not axioms; they follow from X_r≅W_r(lim X) and the identities Vd=p·dV, FdV=d on the saturated complex lim X.

test TauCeti.Crystalline.test_tower_Zp
The tower of Z_p (degree 0, F=id) is X_r=Z/p^r with R and F the projections Z/p^(r+1)→Z/p^r and V multiplication by p, Z/p^r→Z/p^(r+1). It satisfies the eight axioms: ker(R:X_(r+1)→X_r)=p^r·Z/p^(r+1)=X_(r+1)[p]=V^r(X_1), and F is surjective. Its limit is Z_p with F=id and V=p.

test TauCeti.Crystalline.test_tower_constant_Fp
Let X_0=0 and X_r=F_p in degree 0 for r≥1, with R:X_(r+1)→X_r and F:X_(r+1)→X_r the identity for r≥1 and zero for r=0, and V=0. Axioms (1)–(6) and (8) hold, and (7) fails: for r≥1, ker(R:X_(r+1)→X_r)=0 and X_(r+1)[p]=F_p. The limit F_p is not p-torsion-free.

test TauCeti.Crystalline.test_tower_rational
The zero tower (X_r=0 for all r) is a strict Dieudonné tower with limit 0. It is the tower of the saturated complex Q (degree 0, F=id), for which V=p is bijective and W_r(Q)=0; so lim_r W_r(M)≅M fails for the non-strict saturated complex M=Q.

test TauCeti.Crystalline.test_tower_localization
The saturated complexes Z_(p) and Z_p (degree 0, F=id) have the same tower (Z/p^r)_r, and its limit Z_p is the completion W(Z_(p)) of CR.4/verschiebung-completion-tower; for a saturated M, lim_r of the tower (W_r(M))_r is W(M).

test TauCeti.Crystalline.test_tower_free
Let X_r⁰=⊕_(m≥0)(Z/p^r)·e_m ⊕ ⊕_(0<n<r)(Z/p^(r−n))·v_n and X_r¹=⊕_(m≥0)(Z/p^r)·f_m ⊕ ⊕_(0<n<r)(Z/p^(r−n))·w_n, with d(e_m)=p^m·f_m, d(v_n)=w_n, R the projections, F(e_m)=e_(m+1), F(v_n)=p·v_(n−1), F(f_m)=f_(m+1), F(w_n)=w_(n−1), V(e_m)=p·e_(m−1) for m≥1, V(e_0)=v_1, V(v_n)=v_(n+1), V(f_m)=p·f_(m−1) for m≥1, V(f_0)=p·w_1, V(w_n)=p·w_(n+1), where v_0=e_0 and w_0=f_0. This is a strict Dieudonné tower with nonzero differential (d(e_0)=f_0 in X_1); it is the tower of the free strict Dieudonné complex on x=e_0 of BLM Example 2.5.7, with e_m=F^m x, v_n=V^n x, f_m=F^m dx, w_n=dV^n x.

CrystallineCohomology:CR.0/envelope-etale-extension

declaration TauCeti.Crystalline.envelope_etale_extension
Let (A,I,γ) be a PD ring, P an A-algebra, J⊂P an ideal containing IP, and P→P′ an étale map. Put J′=JP′. Then D_(P′,γ)(J′)≅P′⊗_P D_(P,γ)(J), with the divided powers extended from D along the flat map, compatibly with the quotient P′/J′. The construction commutes with composition and localisation. At compatible finite p-power quotients the same statement holds; the completed version is the inverse limit of these isomorphisms, without replacing completed tensor product by ordinary tensor product.

CrystallineCohomology:CR.1/etale-crystalline-site

api TauCeti.Crystalline.etale_crystalline_site_toX
The projection (U,T,δ)↦U takes values in X_ét on the small site and pulls an étale cover of T back to a cover of U.

api TauCeti.Crystalline.etale_crystalline_site_structure
O_crys,ét(U,T)=Γ(T,O_T) and J_crys,ét(U,T)=ker(Γ(T,O_T)→Γ(U,O_U)); these are étale sheaves.

api TauCeti.Crystalline.etale_crystalline_site_change
The identity on big-site objects from the finer étale topology gives ε to the big Zariski crystalline topos; ε⁻¹ is étale sheafification of the Zariski sheaf.

test TauCeti.Crystalline.test_etale_crystalline_field_cover
For X=Spec F_p, the object (Spec F_(p²),Spec F_(p²),0) is small étale over X but not small Zariski over X; the map to (X,X,0) is a covering.

test TauCeti.Crystalline.test_etale_crystalline_affine_descent
For an affine thickening Spec B and a finite faithfully flat étale B-algebra B′, the equalizer B′⇉B′⊗_B B′ is B, and the equalizer of the pulled-back PD ideals is the original ideal.

Typed component limits: The small-object full subcategory, the big-site étale covering condition and the identity-cover detector are typed. The associated Grothendieck topology, structural ringed topos, remaining API and two other tests are recorded as omissions; they are not replaced by an uninterpreted proposition.

CrystallineCohomology:CR.1/etale-crystal-comparison

declaration TauCeti.Crystalline.etale_crystal_comparison
Restriction and étale extension give inverse equivalences between quasi-coherent crystals on the small étale and small Zariski crystalline sites. They preserve finite local freeness. For such a crystal E and every Zariski open V⊂X, the natural map RΓ((V/S)_cris,Zar,E)→RΓ((V/S)_cris,ét,E_ét) is an isomorphism, functorial in V and E. Equivalently Ru_Zar,*E agrees with Rν_*Ru_ét,*E_ét for ν:X_ét→X_Zar, as objects with base coefficients f⁻¹O_S.

CrystallineCohomology:CR.2/smooth-ambient-linearization

declaration TauCeti.Crystalline.smooth_ambient_linearization
Let p be nilpotent on the PD base S and i:X↪P a closed S-immersion with P smooth of finite presentation over S. Let D be its PD envelope and N a quasi-coherent O_D-module, viewed on X. For a crystalline thickening (U,T), form the PD envelope D_T of U in T×_S P relative to the PD ideal on T. With projections a:D_T→T and b:D_T→D, define L_i(N)_T=a_*b^*N. Its transition maps come from these envelopes. Ru_{X/S,*}L_i(N)≅N as sheaves of base modules on X; higher direct images vanish. The linearizations of E_D⊗Ω^q_(P/S), with their relative PD differential, form a resolution of a quasi-coherent crystal E. This also defines linearization of the differential operators in the coefficient de Rham complex.

api TauCeti.Crystalline.smooth_linearization_eval
L_i(N)_T=a_*b^*N, with D_T the relative PD envelope of U in T×_SP; this formula defines the restriction maps.

api TauCeti.Crystalline.smooth_linearization_map
An O_D-linear map N→N′ induces L_i(N)→L_i(N′); identity and composition are preserved.

api TauCeti.Crystalline.smooth_linearization_acyclic
u_*L_i(N)=N and R^qu_*L_i(N)=0 for q>0 as base-module sheaves on X.

api TauCeti.Crystalline.smooth_linearization_resolution
The crystal transition isomorphisms identify E⊗L_i(Ω^q_(P/S)|_D) with L_i(E_D⊗Ω^q_(P/S)|_D); the augmented relative PD de Rham complex is exact.

test TauCeti.Crystalline.test_smooth_linearization_zero
L_i(0)=0 on every object.

test TauCeti.Crystalline.test_smooth_linearization_line
For X=P=A¹_(F_p), D=X and (U,T)=(X,X), L_i(O_X)_T=F_p[x]⟨ξ⟩ with the second coordinate x+ξ.

test TauCeti.Crystalline.test_smooth_linearization_etale_chart
Restrict the preceding construction to X=P=G_m. The value is F_p[x,x⁻¹]⟨ξ⟩, and x+ξ is invertible since ξ^p=0; thus the two ambient maps respect the inverted coordinate.

CrystallineCohomology:CR.2/smooth-ambient-comparison

declaration TauCeti.Crystalline.smooth_ambient_comparison
In the situation of smooth-ambient-linearization, for a quasi-coherent crystal E with envelope value E_D and its integrable PD connection, Ru_{X/S,*}E≅(E_D⊗_(O_P)Ω^•_(P/S),∇) as complexes of f⁻¹O_S-modules on X. For p-adic bases and compatible crystals at finite level the analogous identity is the derived limit of these complexes. If i₁:X↪P₁ and i₂:X↪P₂ are two smooth embeddings, pullback through X↪P₁×_SP₂ gives canonical quasi-isomorphisms between their envelope complexes, coherent for triples and compatible with base change and open restriction.

CrystallineCohomology:CR.2/filtered-pd-comparison

declaration TauCeti.Crystalline.filtered_pd_comparison
Let p∈I and p be nilpotent on the PD base (S,I,γ), i:X↪P smooth as above, and E a finite locally free crystal. Give E on the crystalline site the filtration J_crys^[r]E (J^[r]=O for r≤0). On its envelope de Rham complex set Fil^r(E_D⊗Ω^q_(P/S))=J_D^[r−q]E_D⊗Ω^q_(P/S), where J_D=ker(O_D→O_X). Then Ru_*(J_crys^[r]E)≅Fil^r(E_D⊗Ω^•_(P/S),∇) for every integer r, compatibly with r and with smooth-ambient independence. In a smooth lift the filtration is the base PD filtration combined with degree, and modulo the base PD ideal it becomes the Hodge filtration. The p-adic assertion is the derived inverse limit of the finite-level filtered identities.

CrystallineCohomology:CR.2/cech-alexander-global

declaration TauCeti.Crystalline.cech_alexander_global
Let X/S be a crystalline situation, E a quasi-coherent crystal, and U_•→X a Zariski hypercover whose terms admit smooth ambient embeddings. Form for each U_n its compatible envelope Čech–Alexander de Rham bicomplex C_n using all repeated intersections and ambient tensor factors. Then RΓ_crys(X/S,E)≅Tot_n RΓ(U_n,C_n). If X is separated and a finite totally ordered affine cover is used, the alternating Čech total complex of the intersection envelope complexes also computes it. A refinement gives a canonical comparison quasi-isomorphism; any two refinements agree in the derived category after passage to a common refinement. At p-adic level use Rlim of the compatible finite-level totalizations.

CrystallineCohomology:CR.2/higher-direct-image-vanishing

declaration TauCeti.Crystalline.higher_direct_image_vanishing
For X a Z_p-scheme with p locally nilpotent and E a quasi-coherent crystal on (X/Z_p)_cris, Ru_*(E⊗Ω^q_crys)=0 for every q>0. Consequently the projection of the crystalline de Rham complex (E→E⊗Ω¹_crys→⋯) to E[0] becomes an isomorphism under Ru_*. Here u is ringed over f⁻¹O_(Spec Z_p), and Ω_crys is the PD differential sheaf on thickenings. The same argument applies over a finite Z/p^e base at each compatible level.

CrystallineCohomology:CR.3/mayer-vietoris

declaration TauCeti.Crystalline.mayer_vietoris
For X=U∪V an open cover and E an O_crys-module (or a bounded-below coefficient complex), there is a natural distinguished triangle RΓ_crys(X/S,E)→RΓ_crys(U/S,E)⊕RΓ_crys(V/S,E)→RΓ_crys((U∩V)/S,E)→RΓ_crys(X/S,E)[1], whose middle arrow is res_U−res_V. It is compatible with coefficients, restrictions and PD base-change maps.

CrystallineCohomology:CR.3/etale-hypercover-descent

declaration TauCeti.Crystalline.etale_hypercover_descent
Let U_•→X be an étale hypercover of schemes over the PD base S and E a quasi-coherent crystal. With pullback coefficients E_n on each U_n, the augmentation RΓ_crys(X/S,E)→Tot_n RΓ_crys(U_n/S,E_n) is an isomorphism. Totalization is a homotopy limit. For bounded-below coefficient complexes use their derived hypercohomology; in the p-adic setting use compatible finite-level descent followed by Rlim. This does not assert h-, fppf- or proper descent for arbitrary crystalline coefficients.

CrystallineCohomology:CR.4/principal-p-decalage

api TauCeti.Crystalline.pDecalage_cohomology
H^n(E_pM)=H^n(M)/H^n(M)[p].

api TauCeti.Crystalline.pDecalage_filtered_colimit
colim E_p(M_j)≅E_p(colim M_j) for a filtered diagram of termwise p-torsion-free complexes.

Typed component limits: The integer-indexed normalized submodules, d/p differential and functorial cochain map are typed. The homology and filtered-colimit assertions are in the exact omission register. The negative-degree test checks the normalized carrier; its embedding into the localization as p^(-1)Z is not typed.

CrystallineCohomology:CR.4/derived-p-decalage

declaration TauCeti.Crystalline.derived_p_decalage
The functor E_p on termwise p-torsion-free complexes descends through quasi-isomorphisms to Lη_p:D(Z)→D(Z), and to its enhanced derived category. H^n(Lη_pK)≅H^n(K)/H^n(K)[p]. There is a natural equivalence (Lη_pK)^∧_p≅Lη_p(K^∧_p). In particular Lη_p preserves derived p-completeness. This is an endofunctor, without a claim that it is exact or preserves arbitrary limits.

api TauCeti.Crystalline.derivedPDecalage_model
For a torsion-free model M of K, Lη_pK is represented by E_p(M).

api TauCeti.Crystalline.derivedPDecalage_cohomology
H^n(Lη_pK)≅H^n(K)/H^n(K)[p], naturally.

api TauCeti.Crystalline.derivedPDecalage_completion
(Lη_pK)^∧_p≅Lη_p(K^∧_p), naturally in K.

test TauCeti.Crystalline.test_derivedPDecalage_p
Lη_p(Z/p[0])=0, computed on [Z --p--> Z] in degrees −1,0.

test TauCeti.Crystalline.test_derivedPDecalage_p_squared
H⁰(Lη_p(Z/p²[0]))=Z/p and all other cohomology is zero.

test TauCeti.Crystalline.test_derivedPDecalage_complete
Lη_p(Z_p[0])=Z_p[0] and its derived p-completion map is an isomorphism.

CrystallineCohomology:CR.4/witt-structural-identities

declaration TauCeti.Crystalline.witt_structural_identities
Use Mathlib WittVector p R and TruncatedWittVector p r R. Restriction R_r:W_(r+1)(R)→W_r(R) and F_r:W_(r+1)(R)→W_r(R) are ring maps, V_r:W_r(R)→W_(r+1)(R) is additive and injective, and Teichmüller is multiplicative. F_rV_r=p and V_r(x)·y=V_r(xF_r(y)); the kernel of restriction W_(r+1)→W_r is V^r(R). For R of characteristic p and r≥1, V_(r−1)F_(r−1)=p on W_r(R); on infinite Witt vectors VF=p. The restriction kernel statement means the image of the r-fold coordinate shift from W_1(R)=R into W_(r+1)(R). If R is reduced of characteristic p, W(R) is p-torsion-free and its Frobenius is injective.

CrystallineCohomology:CR.4/witt-frobenius-lift-universal

declaration TauCeti.Crystalline.witt_frobenius_lift_universal
Let A be a p-torsion-free commutative ring with a ring endomorphism φ satisfying φ(a)≡a^p mod p. Let S be a reduced F_p-algebra and f:A→S a ring map. There is a unique ring map u:A→W(S) with w₀u=f and F_Wu=uφ. Here F_W is injective because S is reduced. This is the special Witt lifting property needed to identify degree zero of a strict Dieudonné algebra.

CrystallineCohomology:CR.3/smooth-curve-lift

declaration TauCeti.Crystalline.smooth_curve_lift
For a geometrically connected smooth proper curve C over a perfect field k of characteristic p, there exists a smooth proper projective W(k)-scheme C̃ with C̃⊗k≅C. A lift is chosen, not canonical. For every n, coherent cohomology of O and Ω¹ on C̃_n has ranks 1,g,g,1 and is free over W_n(k); the Hodge–de Rham spectral sequence degenerates and H²_dR(C̃_n/W_n(k)) is free of rank one.

CrystallineCohomology:CR.3/crystalline-leray

declaration TauCeti.Crystalline.crystalline_leray
For a morphism f:Y→X of schemes over a PD base S and a bounded-below crystalline coefficient complex E, the morphism of crystalline topoi gives E₂^(a,b)=H^a_crys(X/S,R^b f_crys,*E)⇒H^(a+b)_crys(Y/S,E). For a proper smooth f whose relative cohomology is finite locally free and commutes with PD base change, the R^b f_crys,*E are finite locally free crystals. For an étale-locally trivial E₀-torsor with E₀ a smooth proper elliptic curve, R¹ f_crys,*O is the constant rank-two crystal H¹_crys(E₀/S); its descent transition maps are trivial because translations act trivially on H¹.

CrystallineCohomology:CR.3/top-coherent-differential

declaration TauCeti.Crystalline.top_coherent_differential
If X is smooth proper equidimensional of dimension d over a field k of positive characteristic, d:H^d(X,Ω^(d−1)_(X/k))→H^d(X,Ω^d_(X/k)) is zero. Thus the coherent trace factors through top de Rham cohomology. For a geometrically connected smooth proper curve this gives H¹_dR dimension 2g.

CrystallineCohomology:CR.3/elliptic-frobenius

declaration TauCeti.Crystalline.elliptic_frobenius
For an elliptic curve E/F_p with a=p+1−#E(F_p), H¹_crys(E/Z_p) is free of rank two and its Frobenius has characteristic polynomial T²−aT+p. For E:y²=x³+x over F_5 the point count is 4, a=2, and the Newton slopes are 0 and 1; E is ordinary. For E:y²=x³−x over F_3 the point count is 4, a=0, and the polynomial is T²+3 with both slopes 1/2; E is supersingular. The slopes describe rational cohomology and do not assert a diagonal integral basis.

CrystallineCohomology:CR.3:duality/finite-etale-transfer

declaration TauCeti.Crystalline.finite_etale_transfer
For a finite étale map g:Y→X of constant degree m between smooth proper pure d-dimensional schemes over a perfect field k, the trace of the finite locally free algebra on each PD thickening defines tr_g:Rg_crys,*O_(Y/W)→O_(X/W). It induces g_!:RΓ_crys(Y/W)→RΓ_crys(X/W), satisfying g_!g^*=m·id, the projection formula g_!(g^*a∪b)=a∪g_!b, composition, and Tr_X g_!=Tr_Y. This transfer agrees with the degree-zero-shift Gysin map defined by duality.

api TauCeti.Crystalline.finiteEtaleTransfer_scalar
g_!g^*=m·id on RΓ_crys(X/W).

api TauCeti.Crystalline.finiteEtaleTransfer_projection
g_!(g^*a∪b)=a∪g_!b.

api TauCeti.Crystalline.finiteEtaleTransfer_trace
Tr_X∘g_!=Tr_Y, and transfer composes for finite étale maps.

test TauCeti.Crystalline.test_finiteEtaleTransfer_identity
The identity cover has transfer id.

test TauCeti.Crystalline.test_finiteEtaleTransfer_split
For Y=⊔_(i=1)^mX the transfer is the sum of the m coordinates and g_!g^*=m.

test TauCeti.Crystalline.test_finiteEtaleTransfer_field
For Spec F_(p^r)→Spec F_p transfer in degree zero is the trace W(F_(p^r))→Z_p and sends 1 to r.

CrystallineCohomology:CR.4/isocrystal-slope-decomposition

declaration TauCeti.Crystalline.isocrystal_slope_decomposition
Let k be a perfect field of characteristic p and V a finite-dimensional Mathlib WittVector.Isocrystal over K=FractionRing(WittVector p k). For a reduced rational λ=a/b, b>0, define the standard block over an algebraic closure of k by F(e_i)=e_(i+1) for i<b and F(e_b)=p^a e_1, with σ on coefficients. V is isoclinic of slope λ if its scalar extension is a sum of these blocks. There is a canonical finite direct-sum decomposition V=⊕_λ V_λ into isoclinic subisocrystals. Hom(V_λ,V_μ)=0 for λ≠μ. Over algebraically closed k the standard blocks are exactly the simple objects. Over a finite field F_(p^r), the slopes are v_p of eigenvalues of the K-linear F^r divided by r, with multiplicities.

CrystallineCohomology:CR.4/perfectoid-witt-base-change-input

declaration TauCeti.Crystalline.perfectoid_witt_base_change_input
Let S→S′ be a map of integral perfectoid rings in the lower-tier PerfectoidSpaces P1 sense (BMS1 Definition 3.5). For 1≤j≤r the canonical maps W_j(S)⊗^L_(A_inf(S))A_inf(S′)→W_j(S′) and W_j(S)⊗^L_(W_r(S))W_r(S′)→W_j(S′) are isomorphisms, using either restriction or Frobenius for the W_r-module structure. For 1≤j<r, Ann_(W_r(S))(V^j(1))=ker(F^j:W_r(S)→W_(r−j)(S)), V^j(1)W_r(S)=V^jW_(r−j)(S), and F^j and multiplication by V^j(1) identify W_r(S)/Ann(V^j(1)) with W_(r−j)(S) and V^jW_(r−j)(S), respectively.
END EXACT PROTOTYPE OMISSION REGISTER -/
