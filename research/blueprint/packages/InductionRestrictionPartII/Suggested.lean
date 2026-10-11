/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These admitted statements suggest Lean forms so contributors and reviewers converge on
names and signatures. The mathematical definitions and hypotheses in README.md govern these signatures.
An admitted proof does not assert that a target has been implemented.
-/

import Mathlib.RepresentationTheory.Homological.GroupCohomology.Functoriality
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.CategoryTheory.Abelian.Ext
import Mathlib.GroupTheory.SpecificGroups.Cyclic.Basic
import Mathlib.GroupTheory.GroupExtension.Defs
import TauCeti.GroupTheory.GroupExtension.Cohomology
import TauCeti.Algebra.Group.ElementaryTwoQuotient.Basic
import Mathlib.Algebra.Group.Conj
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.GroupTheory.Coset.Basic
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.RepresentationTheory.Homological.GroupHomology.LowDegree
import Mathlib.RepresentationTheory.Homological.GroupHomology.Functoriality
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.FieldTheory.Finiteness
import Mathlib.Algebra.Field.ZMod
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.GroupTheory.Torsion
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.GroupTheory.GroupAction.Hom
import Mathlib.Algebra.Torsor.Defs
import Mathlib.LinearAlgebra.Finsupp.LSum
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.GroupTheory.SpecificGroups.Quaternion
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.GroupTheory.SchurZassenhaus
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation

set_option linter.unusedVariables false
set_option autoImplicit false
noncomputable section
namespace TauCeti.ReducedSchur
open scoped BigOperators
open CategoryTheory

section Commutators
variable {A E G : Type} [Group A] [Group E] [Group G]
-- Centrality is an explicit hypothesis on the extension.
def lift_commutator (S : GroupExtension A E G)
    (hcentral : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (x y : G) (hxy : Commute x y) : A := by sorry
lemma lift_commutator_inl (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (x y : G) (hxy : Commute x y) (X Y : E)
    (hX : S.rightHom X = x) (hY : S.rightHom Y = y) :
    S.inl (lift_commutator S hc x y hxy) = X * Y * X⁻¹ * Y⁻¹ := by sorry
lemma lift_commutator_independent (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (X Y : E) (a b : A) :
    (X * S.inl a) * (Y * S.inl b) * (X * S.inl a)⁻¹ * (Y * S.inl b)⁻¹ =
    X * Y * X⁻¹ * Y⁻¹ := by sorry
lemma lift_commutator_swap (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (x y : G) (hxy : Commute x y) :
    lift_commutator S hc y x hxy.symm = (lift_commutator S hc x y hxy)⁻¹ := by sorry
-- lift_commutator_test_1
example (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) (y : G) :
    lift_commutator S hc 1 y (Commute.one_left y) = 1 := by sorry
-- lift_commutator_test_2: every split central extension has trivial commuting-pair pairing.
example (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (s : S.Splitting) (x y : G) (hxy : Commute x y) :
    lift_commutator S hc x y hxy = 1 := by sorry
end Commutators

section IntegralHomology
variable {G : Type} [Group G]
-- Integral second homology uses the existing Mathlib carrier.
abbrev IntegralMultiplier (G : Type) [Group G] :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)
def commuting_pair_cycle (x y : G) (hxy : Commute x y) :
    groupHomology.cycles₂ (Rep.trivial ℤ G ℤ) := by sorry
lemma commuting_pair_cycle_val (x y : G) (hxy : Commute x y) :
    (commuting_pair_cycle x y hxy).val =
      Finsupp.single (x,y) (1 : ℤ) - Finsupp.single (y,x) 1 := by sorry
def homological_commutator (x y : G) (hxy : Commute x y) : IntegralMultiplier G := by sorry
lemma homological_commutator_cycle (x y : G) (hxy : Commute x y) :
    homological_commutator x y hxy =
      groupHomology.H2π (Rep.trivial ℤ G ℤ) (commuting_pair_cycle x y hxy) := by sorry
lemma homological_commutator_swap (x y : G) (hxy : Commute x y) :
    homological_commutator y x hxy.symm = -homological_commutator x y hxy := by sorry
-- homological_commutator_test_1
example (y : G) : homological_commutator 1 y (Commute.one_left y) = 0 := by sorry

def schur_relations (c : Set G) : AddSubgroup (IntegralMultiplier G) := by sorry
lemma schur_relations_mem (c : Set G) (x y : G) (hx : x ∈ c) (hxy : Commute x y) :
    homological_commutator x y hxy ∈ schur_relations c := by sorry
lemma schur_relations_le (c : Set G) (B : AddSubgroup (IntegralMultiplier G)) :
    schur_relations c ≤ B ↔ ∀ x ∈ c, ∀ y, ∀ hxy : Commute x y,
      homological_commutator x y hxy ∈ B := by sorry
lemma schur_relations_mono (c d : Set G) (hcd : c ⊆ d) :
    schur_relations c ≤ schur_relations d := by sorry
-- schur_relations_test_1
example : schur_relations (∅ : Set G) = ⊥ := by sorry
-- Quotient the integral multiplier by the commuting-pair relation subgroup.
abbrev reduced_multiplier (c : Set G) := IntegralMultiplier G ⧸ schur_relations c
lemma reduced_multiplier_mk (c : Set G) (x : IntegralMultiplier G) :
    (QuotientAddGroup.mk x : reduced_multiplier c) = 0 ↔ x ∈ schur_relations c := by sorry
lemma reduced_multiplier_mk_surjective (c : Set G) :
    Function.Surjective (QuotientAddGroup.mk' (schur_relations c)) := by sorry
lemma reduced_multiplier_lift (c : Set G) {B : Type} [AddCommGroup B]
    (f : IntegralMultiplier G →+ B) (hf : schur_relations c ≤ f.ker) :
    ∃! F : reduced_multiplier c →+ B,
      ∀ x, F (QuotientAddGroup.mk x) = f x := by sorry
lemma reduced_multiplier_empty :
    Nonempty (reduced_multiplier (∅ : Set G) ≃+ IntegralMultiplier G) := by sorry
-- reduced_multiplier_test_1
example : Subsingleton (reduced_multiplier (∅ : Set (Multiplicative (ZMod 1)))) := by sorry
-- reduced_multiplier_test_2
example (n : ℕ) (c : Set (Multiplicative (ZMod n))) :
    Subsingleton (reduced_multiplier c) := by sorry
-- reduced_multiplier_test_3: the empty-set case retains the nonzero multiplier.
example : Nat.card (reduced_multiplier
    (∅ : Set (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)))) = 2 := by sorry
-- homological_commutator_test_2: independent C₂ basis vectors generate its multiplier.
example : homological_commutator
    (Multiplicative.ofAdd (1 : ZMod 2), (1 : Multiplicative (ZMod 2)))
    ((1 : Multiplicative (ZMod 2)), Multiplicative.ofAdd (1 : ZMod 2))
    (Commute.all _ _) ≠ 0 := by sorry
-- homological_commutator_test_3: reversing the integral torus orientation changes the sign.
example : ∃ e : IntegralMultiplier (Multiplicative ℤ × Multiplicative ℤ) ≃+ ℤ,
    e (homological_commutator (Multiplicative.ofAdd 1, 1)
      (1, Multiplicative.ofAdd 1) (Commute.all _ _)) = 1 ∧
    e (homological_commutator (1, Multiplicative.ofAdd 1)
      (Multiplicative.ofAdd 1, 1) (Commute.all _ _)) = -1 := by sorry
-- schur_relations_test_2: a single nonidentity marked element kills M(C₂²).
example : schur_relations
    {(Multiplicative.ofAdd (1 : ZMod 2), (1 : Multiplicative (ZMod 2)))} = ⊤ := by sorry
-- schur_relations_test_3: unmarked commuting pairs contribute no relations.
example : Nat.card (IntegralMultiplier
    (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)) ⧸
      schur_relations (∅ : Set (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)))) = 2 := by sorry
end IntegralHomology

section Pullback
variable {E F B : Type} [Group E] [Group F] [Group B]
-- Fiber-product subgroup. Instantiate B=G^ab, E=S_c,
-- F=Multiplicative (D →₀ ℤ).
def marked_fiber_product (f : E →* B) (g : F →* B) : Subgroup (E × F) := by sorry
lemma marked_fiber_product_membership (f : E →* B) (g : F →* B) (p : E × F) :
    p ∈ marked_fiber_product f g ↔ f p.1 = g p.2 := by sorry
def marked_fiber_product_first (f : E →* B) (g : F →* B) :
    marked_fiber_product f g →* E := by sorry
def marked_fiber_product_degree (f : E →* B) (g : F →* B) :
    marked_fiber_product f g →* F := by sorry
lemma marked_fiber_product_first_surjective (f : E →* B) (g : F →* B)
    (hg : Function.Surjective g) : Function.Surjective (marked_fiber_product_first f g) := by sorry
-- marked_fiber_product_test_3, instantiated at the actual native maps.
example : (Multiplicative.ofAdd (1 : ZMod 2), (1 : Multiplicative ℤ)) ∉
    marked_fiber_product (MonoidHom.id (Multiplicative (ZMod 2)))
      (1 : Multiplicative ℤ →* Multiplicative (ZMod 2)) := by sorry
end Pullback

section Correction
variable {P A E : Type} [Group P] [CommGroup A] [Group E]
def marking_correction (φ : P →* E) (i : A →* E)
    (hi : ∀ a : A, ∀ e : E, i a * e = e * i a) (ψ : P →* A) : P →* E := by sorry
lemma marking_correction_mark (φ : P →* E) (i : A →* E)
    (hi : ∀ a : A, ∀ e : E, i a * e = e * i a) (ψ : P →* A)
    (x : P) (s : E) (hx : φ x = s * i (ψ x)) :
    marking_correction φ i hi ψ x = s := by sorry
lemma marking_correction_hom (φ : P →* E) (i : A →* E)
    (hi : ∀ a : A, ∀ e : E, i a * e = e * i a) (ψ : P →* A) (x y : P) :
    marking_correction φ i hi ψ (x*y) = marking_correction φ i hi ψ x *
      marking_correction φ i hi ψ y := by sorry
lemma marking_correction_sign (φ : P →* E) (i : A →* E)
    (hi : ∀ a : A, ∀ e : E, i a * e = e * i a) (ψ : P →* A) (x : P) :
    marking_correction φ i hi ψ x = φ x * (i (ψ x))⁻¹ := by sorry
-- marking_correction_test_1
example (φ : P →* E) (i : A →* E)
    (hi : ∀ a : A, ∀ e : E, i a * e = e * i a) :
    marking_correction φ i hi (1 : P →* A) = φ := by sorry
-- marking_correction_test_2: additive C₃ discrepancy calculation.
example : (1 : ZMod 3) - 1 = 0 ∧ (1 : ZMod 3) + 1 = 2 := by sorry
-- marking_correction_test_3
example (k : Multiplicative (ZMod 3)) (hk : k ≠ 1) : k*k ≠ 1 := by sorry
end Correction

section Power
variable {G : Type} [Group G]
def finite_power (n : ℕ) (α : (ZMod n)ˣ) (g : G) : G := by sorry
lemma finite_power_residue (n : ℕ) (hn : 0 < n) (α : (ZMod n)ˣ) (g : G)
    (hg : g^n = 1) (a : ℕ) (ha : (a : ZMod n) = (α : ZMod n)) :
    finite_power n α g = g^a := by sorry
lemma finite_power_one (n : ℕ) (hn : 0 < n) (g : G) (hg : g^n = 1) :
    finite_power n 1 g = g := by sorry
lemma finite_power_compose (n : ℕ) (hn : 0 < n) (α β : (ZMod n)ˣ)
    (hG : ∀ g : G, g^n = 1) (g : G) :
    finite_power n α (finite_power n β g) = finite_power n (α*β) g := by sorry
lemma finite_power_commutative {A : Type} [CommGroup A] (n : ℕ) (hn : 0 < n)
    (hA : ∀ a : A, a^n = 1) (α : (ZMod n)ˣ) (a b : A) :
    finite_power n α (a*b) = finite_power n α a * finite_power n α b := by sorry
-- finite_power_test_2
example (n : ℕ) (α : (ZMod n)ˣ) :
    finite_power n α (1 : Multiplicative (ZMod 1)) = 1 := by sorry
-- finite_power_test_3: inversion is not multiplicative in S₃.
example : ∃ a b : Equiv.Perm (Fin 3), (a*b)⁻¹ ≠ a⁻¹*b⁻¹ := by sorry
-- finite_power_test_1: inversion interchanges the nonidentity elements of C₃.
example : finite_power 3 (-1 : (ZMod 3)ˣ) (Multiplicative.ofAdd (1 : ZMod 3)) =
    Multiplicative.ofAdd (2 : ZMod 3) ∧
    finite_power 3 (-1 : (ZMod 3)ˣ) (Multiplicative.ofAdd (2 : ZMod 3)) =
      Multiplicative.ofAdd (1 : ZMod 3) := by sorry
end Power

section DegreeSlices
variable {D : Type} [Fintype D]
def bounded_degree_slice (n M : ℕ) : Set (D → ℤ) := by sorry
lemma bounded_degree_slice_mem (n M : ℕ) (m : D → ℤ) :
    m ∈ bounded_degree_slice n M ↔ (∀ d, (M : ℤ) ≤ m d) ∧ ∑ d, m d = (n : ℤ) := by sorry
lemma bounded_degree_slice_invariant (n M : ℕ) (σ : D ≃ D) (m : D → ℤ) :
    m ∘ σ ∈ bounded_degree_slice n M ↔ m ∈ bounded_degree_slice n M := by sorry
-- bounded_degree_slice_test_1
example : (fun _ : Fin 0 => (0 : ℤ)) ∈ bounded_degree_slice 0 1 := by sorry
-- bounded_degree_slice_test_2
example : (fun i : Fin 2 => if i=0 then (1 : ℤ) else 2) ∈ bounded_degree_slice 3 1 := by sorry
-- bounded_degree_slice_test_3
example : bounded_degree_slice (D := Fin 1) 0 1 = ∅ := by sorry

def power_fixed_degree (σ : D ≃ D) : AddSubgroup (D → ℤ) := by sorry
lemma power_fixed_degree_fixed (σ : D ≃ D) (m : D → ℤ) :
    m ∈ power_fixed_degree σ ↔ ∀ d, m (σ d) = m d := by sorry
-- power_fixed_degree_test_1
example : power_fixed_degree (Equiv.refl D) = ⊤ := by sorry
-- power_fixed_degree_test_2
example (a b : ℤ) : (fun i : Fin 2 => if i=0 then a else b) ∈
    power_fixed_degree (Equiv.swap (0 : Fin 2) 1) ↔ a=b := by sorry
-- power_fixed_degree_test_3
example : ¬ ∃ m : Fin 2 → ℤ,
    m ∈ power_fixed_degree (Equiv.swap (0 : Fin 2) 1) ∧ ∑ i, m i = 1 := by sorry
end DegreeSlices

section BinaryConstraints
variable {V U B : Type} [AddCommGroup V] [AddCommGroup U] [AddCommGroup B]
variable [Module (ZMod 2) V] [Module (ZMod 2) U] [Module (ZMod 2) B]
def joint_parity_map (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B)
    (Bt : Submodule (ZMod 2) B) : V →ₗ[ZMod 2] U × (B ⧸ Bt) := by sorry
lemma joint_parity_map_apply (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B)
    (Bt : Submodule (ZMod 2) B) (v : V) :
    joint_parity_map a s Bt v = (a v, Submodule.Quotient.mk (s v)) := by sorry
lemma joint_parity_map_kernel (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B)
    (Bt : Submodule (ZMod 2) B) (v : V) :
    v ∈ LinearMap.ker (joint_parity_map a s Bt) ↔ a v=0 ∧ s v ∈ Bt := by sorry
lemma joint_parity_map_mono_kernel (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B)
    (Bt Bu : Submodule (ZMod 2) B) (h : Bt ≤ Bu) :
    LinearMap.ker (joint_parity_map a s Bt) ≤ LinearMap.ker (joint_parity_map a s Bu) := by sorry
lemma joint_parity_map_last (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) :
    LinearMap.ker (joint_parity_map a s ⊤) = LinearMap.ker a := by sorry
-- joint_parity_map_test_1
example (a : V →ₗ[ZMod 2] U) (s : V →ₗ[ZMod 2] B) (Bt : Submodule (ZMod 2) B) :
    joint_parity_map a s Bt 0 = 0 := by sorry
-- joint_parity_map_test_2
example : LinearMap.ker (joint_parity_map (0 : ZMod 2 →ₗ[ZMod 2] ZMod 2)
    (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) ⊥) = ⊥ := by sorry
-- joint_parity_map_test_3
example : LinearMap.ker (joint_parity_map (0 : ZMod 2 →ₗ[ZMod 2] ZMod 2)
    (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) ⊤) = ⊤ := by sorry
end BinaryConstraints

-- Rank count for the binary linear map used by the parity construction.
theorem rank_parity_count {D W : Type} [Fintype D] [AddCommGroup W]
    [Module (ZMod 2) W] (L : (D → ZMod 2) →ₗ[ZMod 2] W) (v : D → ZMod 2) :
    Nat.card {x : D → ZMod 2 // L x = L v} =
      2 ^ (Fintype.card D - Module.finrank (ZMod 2) (LinearMap.range L)) := by sorry
-- Cardinality of a nonempty power fiber.
theorem power_fiber_count {A : Type} [CommGroup A] [Finite A]
    (d : ℕ) (b h : A) (hh : h^d = b) :
    Nat.card {x : A // x^d=b} = Nat.card {x : A // x^d=1} := by sorry
lemma square_torsion_solvability {A : Type} [CommGroup A] (b : A) (r : ℕ) (hr : 0 < r) :
    (∃ h : A, h^(2*r)=b^r) ↔ ∃ h t : A, t^r=1 ∧ b=h^2*t := by sorry

section Marked
variable {A E G : Type} [Group A] [Group E] [Group G]
structure marked_extension (A E G : Type) [Group A] [Group E] [Group G] (c : Set G) where
  extension : GroupExtension A E G
  conjugationClosed : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c
  marking : c → E
  central : ∀ a : A, ∀ e : E, extension.inl a * e = e * extension.inl a
  over : ∀ x : c, extension.rightHom (marking x) = x.val
  equivariant : ∀ e : E, ∀ x : c,
    marking ⟨extension.rightHom e * x.val * (extension.rightHom e)⁻¹,
      conjugationClosed _ _ x.property⟩ = e * marking x * e⁻¹
lemma marked_extension_section (c : Set G) (M : marked_extension A E G c) (x : c) :
    M.extension.rightHom (M.marking x) = x.val := by sorry
lemma marked_extension_conjugation (c : Set G) (M : marked_extension A E G c)
    (e : E) (x : c) :
    M.marking ⟨M.extension.rightHom e * x.val * (M.extension.rightHom e)⁻¹,
      M.conjugationClosed _ _ x.property⟩ = e * M.marking x * e⁻¹ := by sorry
lemma marked_extension_subset (c : Set G) (M : marked_extension A E G c) :
    Set.BijOn M.extension.rightHom (Set.range M.marking) c := by sorry
-- marked_extension_test_1
example (A : Type) [CommGroup A] :
    Nonempty (marked_extension A A (Multiplicative (ZMod 1)) ∅) := by sorry
-- marked_extension_test_2
example (c : Set G) (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :
    Nonempty (marked_extension (Multiplicative (ZMod 1)) G G c) := by sorry
-- marked_extension_test_3: a marking can have order four over an involution.
example : ∃ M : marked_extension (Multiplicative (ZMod 2))
    (Multiplicative (ZMod 4)) (Multiplicative (ZMod 2))
    {Multiplicative.ofAdd (1 : ZMod 2)}, ∀ x, (M.marking x)^2 ≠ 1 := by sorry
end Marked

section Presentation
variable {G : Type} [Group G]
-- The relator is native FreeGroup data, not an abstract proposition.
def marked_relator (c : Set G) (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x y : c) :
    FreeGroup c :=
  FreeGroup.of x * FreeGroup.of y * (FreeGroup.of x)⁻¹ *
    (FreeGroup.of ⟨x.val*y.val*x.val⁻¹, hc x.val y.val y.property⟩)⁻¹
abbrev universal_presentation (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :=
  PresentedGroup {w : FreeGroup c | ∃ x y : c, w = marked_relator c hc x y}
def universal_presentation_gen (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x : c) : universal_presentation c hc := by sorry
lemma universal_presentation_relation (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x y : c) :
    universal_presentation_gen c hc x * universal_presentation_gen c hc y *
      (universal_presentation_gen c hc x)⁻¹ =
    universal_presentation_gen c hc ⟨x.val*y.val*x.val⁻¹, hc _ _ y.property⟩ := by sorry
def universal_presentation_projection (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) : universal_presentation c hc →* G := by sorry
lemma universal_presentation_projection_gen (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x : c) :
    universal_presentation_projection c hc (universal_presentation_gen c hc x) = x.val := by sorry
lemma universal_presentation_lift (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) {E : Type} [Group E]
    (f : c → E) (hf : ∀ x y : c, f x * f y * (f x)⁻¹ =
      f ⟨x.val*y.val*x.val⁻¹, hc _ _ y.property⟩) :
    ∃! F : universal_presentation c hc →* E, ∀ x, F (universal_presentation_gen c hc x)=f x := by sorry
lemma empty_closed (G : Type) [Group G] :
    ∀ g x : G, x ∈ (∅ : Set G) → g*x*g⁻¹ ∈ (∅ : Set G) := by sorry
lemma comm_singleton_closed {G : Type} [CommGroup G] (a : G) :
    ∀ g x : G, x ∈ ({a} : Set G) → g*x*g⁻¹ ∈ ({a} : Set G) := by sorry
-- universal_presentation_test_1
example : Subsingleton (universal_presentation (∅ : Set (Multiplicative (ZMod 1)))
    (empty_closed _)) := by sorry
-- universal_presentation_test_2
example : Nonempty (universal_presentation {Multiplicative.ofAdd (1 : ZMod 2)}
    (comm_singleton_closed _) ≃* Multiplicative ℤ) := by sorry
-- universal_presentation_test_3
example : Nat.card (universal_presentation {Multiplicative.ofAdd (1 : ZMod 2)}
    (comm_singleton_closed _)) = 0 := by sorry

theorem universal_central (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (hgen : Subgroup.closure c = ⊤) :
    Function.Surjective (universal_presentation_projection c hc) ∧
    ∀ u : universal_presentation c hc,
      universal_presentation_projection c hc u = 1 →
      ∀ v : universal_presentation c hc, u*v=v*u := by sorry
end Presentation

section Degrees
variable {G : Type} [Group G]
-- Existing conjugacy quotient, restricted to the classes meeting c.
abbrev InertiaClasses (c : Set G) :=
  {d : ConjClasses G // ∃ x ∈ c, ConjClasses.mk x = d}
def inertia_class_mk (c : Set G) (x : c) : InertiaClasses c :=
  ⟨ConjClasses.mk x.val, x.val, x.property, rfl⟩
def class_degree_map (c : Set G) :
    (InertiaClasses c →₀ ℤ) →+ Additive (Abelianization G) := by sorry
lemma class_degree_map_basis (c : Set G) (x : c) :
    class_degree_map c (Finsupp.single (inertia_class_mk c x) 1) =
      Additive.ofMul (Abelianization.of x.val) := by sorry
lemma class_degree_map_surjective (c : Set G) (hgen : Subgroup.closure c = ⊤) :
    Function.Surjective (class_degree_map c) := by sorry
lemma class_degree_map_integer (c : Set G) (x : c) :
    class_degree_map c (-Finsupp.single (inertia_class_mk c x) 1) =
      -Additive.ofMul (Abelianization.of x.val) := by sorry
-- class_degree_map_test_1
example (x : ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2)))) :
    class_degree_map {Multiplicative.ofAdd (1 : ZMod 2)}
      (Finsupp.single (inertia_class_mk _ x) 2) = 0 := by sorry
-- class_degree_map_test_2
example : class_degree_map (∅ : Set G) = 0 := by sorry
-- class_degree_map_test_3
example (c : Set G) (x : c) :
    class_degree_map c (-Finsupp.single (inertia_class_mk c x) 1) =
      -class_degree_map c (Finsupp.single (inertia_class_mk c x) 1) := by sorry

def universal_degree (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :
    universal_presentation c hc →* Multiplicative (InertiaClasses c →₀ ℤ) := by sorry
lemma universal_degree_generator (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x : c) :
    universal_degree c hc (universal_presentation_gen c hc x) =
      Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1) := by sorry
lemma universal_degree_inverse (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x : c) :
    Multiplicative.toAdd (universal_degree c hc (universal_presentation_gen c hc x)⁻¹) =
      -Finsupp.single (inertia_class_mk c x) 1 := by sorry
lemma universal_degree_abelianization (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (u : universal_presentation c hc) :
    class_degree_map c (Multiplicative.toAdd (universal_degree c hc u)) =
      Additive.ofMul (Abelianization.of (universal_presentation_projection c hc u)) := by sorry
lemma class_degree_map_compatible (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (u : universal_presentation c hc) :
    class_degree_map c (Multiplicative.toAdd (universal_degree c hc u)) =
      Additive.ofMul (Abelianization.of (universal_presentation_projection c hc u)) := by sorry
lemma universal_degree_hom (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (u v : universal_presentation c hc) :
    Multiplicative.toAdd (universal_degree c hc (u*v)) =
      Multiplicative.toAdd (universal_degree c hc u) +
      Multiplicative.toAdd (universal_degree c hc v) := by sorry
-- universal_degree_test_2
example (c : Set G) (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :
    universal_degree c hc 1 = 1 := by sorry
-- universal_degree_test_3
example (c : Set G) (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x : c) :
    Multiplicative.toAdd (universal_degree c hc (universal_presentation_gen c hc x)⁻¹) =
      -Finsupp.single (inertia_class_mk c x) 1 := by sorry
end Degrees

section Kernel
variable {G : Type} [Group G]
abbrev universal_kernel (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :=
  (universal_presentation_projection c hc).ker
def universal_kernel_inclusion (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :
    universal_kernel c hc →* universal_presentation c hc := by sorry
lemma universal_kernel_central (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (hgen : Subgroup.closure c = ⊤)
    (k : universal_kernel c hc) (u : universal_presentation c hc) :
    k.val * u = u * k.val := by sorry
lemma universal_kernel_degree (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (hgen : Subgroup.closure c = ⊤)
    (m : InertiaClasses c →₀ ℤ) : class_degree_map c m = 0 ↔
    ∃ k : universal_kernel c hc, Multiplicative.toAdd (universal_degree c hc k.val) = m := by sorry
-- universal_kernel_test_1: its degree image is ker δ; for C₂ that is 2ℤ.
example (m : InertiaClasses {Multiplicative.ofAdd (1 : ZMod 2)} →₀ ℤ) :
    class_degree_map {Multiplicative.ofAdd (1 : ZMod 2)} m = 0 ↔
    ∃ k : universal_kernel {Multiplicative.ofAdd (1 : ZMod 2)} (comm_singleton_closed _),
      Multiplicative.toAdd (universal_degree _ (comm_singleton_closed _) k.val) = m := by sorry
-- universal_kernel_test_2
example : Subsingleton (universal_kernel (∅ : Set (Multiplicative (ZMod 1)))
    (empty_closed _)) := by sorry
-- universal_kernel_test_3
example : Infinite (universal_kernel {Multiplicative.ofAdd (1 : ZMod 2)}
    (comm_singleton_closed _)) := by sorry
end Kernel

-- Square-class interfaces against the existing Tau Ceti API.
section SquareClasses
variable {A : Type} [CommGroup A]
def square_obstruction {D : Type} [Fintype D]
    (targetSquare : A) (classSquares : D → A) (m : D → ℤ) :
    TauCeti.ElementaryTwoQuotient A := by sorry
lemma square_obstruction_representative {D : Type} [Fintype D]
    (y : A) (s : D → A) (m : D → ℤ) :
    square_obstruction y s m = TauCeti.elementaryTwoQuotientMk
      (y * ∏ d, (s d) ^ (-m d)) := by sorry
lemma square_obstruction_parity {D : Type} [Fintype D]
    (y : A) (s : D → A) (m n : D → ℤ) (h : ∀ d, Even (m d - n d)) :
    square_obstruction y s m = square_obstruction y s n := by sorry
-- square_obstruction_test_1
example {D : Type} [Fintype D] (s : D → A) :
    square_obstruction 1 s (fun _ => 0) = 0 := by sorry
-- square_obstruction_test_2
example {D : Type} [Fintype D] [DecidableEq D] (s : D → A) (k : D) :
    square_obstruction (s k) s (fun d => if d=k then 1 else 0) = 0 := by sorry

def torsion_image_filtration (t : ℕ) :
    Submodule (ZMod 2) (TauCeti.ElementaryTwoQuotient A) := by sorry
lemma torsion_image_filtration_mem (t : ℕ) (b : TauCeti.ElementaryTwoQuotient A) :
    b ∈ torsion_image_filtration (A := A) t ↔
      ∃ a : A, a ^ (2^t) = 1 ∧ TauCeti.elementaryTwoQuotientMk a = b := by sorry
lemma torsion_image_filtration_zero : torsion_image_filtration (A := A) 0 = ⊥ := by sorry
lemma torsion_image_filtration_mono (t u : ℕ) (h : t ≤ u) :
    torsion_image_filtration (A := A) t ≤ torsion_image_filtration u := by sorry
-- torsion_image_filtration_test_2
example : torsion_image_filtration (A := Multiplicative (ZMod 8)) 2 = ⊥ ∧
    torsion_image_filtration (A := Multiplicative (ZMod 8)) 0 = ⊥ ∧
    torsion_image_filtration (A := Multiplicative (ZMod 8)) 1 = ⊥ ∧
    torsion_image_filtration (A := Multiplicative (ZMod 8)) 3 = ⊤ := by sorry
-- torsion_image_filtration_test_3
example (a : Multiplicative (ZMod 8)) (h : a^2=1) :
    TauCeti.elementaryTwoQuotientMk a = 0 := by sorry

def obstruction_threshold [Finite A] (b : A) : ℕ := by sorry
lemma obstruction_threshold_zero [Finite A] (b : A) :
    obstruction_threshold b = 0 ↔ IsSquare b := by sorry
lemma obstruction_threshold_class [Finite A] (b c : A)
    (h : TauCeti.elementaryTwoQuotientMk b = TauCeti.elementaryTwoQuotientMk c) :
    obstruction_threshold b = obstruction_threshold c := by sorry
lemma obstruction_threshold_bound [Finite A] (e : ℕ)
    (h : torsion_image_filtration (A := A) e = ⊤) (b : A) :
    obstruction_threshold b ≤ e := by sorry
lemma obstruction_threshold_cyclic (e : ℕ) (he : 0 < e) :
    obstruction_threshold (Multiplicative.ofAdd (1 : ZMod (2^e))) = e := by sorry
-- obstruction_threshold_test_1
example [Finite A] : obstruction_threshold (1 : A) = 0 := by sorry
-- obstruction_threshold_test_2
example : obstruction_threshold
    (Multiplicative.ofAdd (1 : ZMod 4), Multiplicative.ofAdd (0 : ZMod 8)) = 2 := by sorry
-- obstruction_threshold_test_3
example : obstruction_threshold (Multiplicative.ofAdd (1 : ZMod 8)) = 3 := by sorry
-- torsion_image_filtration_test_1: an odd-order group has trivial square-class space.
example (t : ℕ) :
    torsion_image_filtration (A := Multiplicative (ZMod 3)) t = ⊥ ∧
    Subsingleton (TauCeti.ElementaryTwoQuotient (Multiplicative (ZMod 3))) := by sorry
end SquareClasses

section HomologyMaps
variable {G H K : Type} [Group G] [Group H] [Group K]
-- Use Mathlib's homology functor with the identity on the actual integral coefficient module.
abbrev integral_multiplier_map (f : G →* H) : IntegralMultiplier G →+ IntegralMultiplier H :=
  (groupHomology.map (A := Rep.trivial ℤ G ℤ) (B := Rep.trivial ℤ H ℤ) f (Rep.ofHom
    { toLinearMap := LinearMap.id, isIntertwining' := by intro g; rfl }) 2).hom.toAddMonoidHom
lemma homological_commutator_map (f : G →* H) (x y : G) (hxy : Commute x y) :
    integral_multiplier_map f (homological_commutator x y hxy) =
      homological_commutator (f x) (f y) (hxy.map f) := by sorry
lemma schur_relations_map (f : G →* H) (c : Set G) (d : Set H)
    (hcd : Set.MapsTo f c d) :
    (schur_relations c).map (integral_multiplier_map f) ≤ schur_relations d := by sorry
def reduced_multiplier_map (f : G →* H) (c : Set G) (d : Set H)
    (hcd : Set.MapsTo f c d) : reduced_multiplier c →+ reduced_multiplier d := by sorry
lemma reduced_multiplier_map_mk (f : G →* H) (c : Set G) (d : Set H)
    (hcd : Set.MapsTo f c d) (z : IntegralMultiplier G) :
    reduced_multiplier_map f c d hcd (QuotientAddGroup.mk z) =
      QuotientAddGroup.mk (integral_multiplier_map f z) := by sorry
lemma reduced_multiplier_map_id (c : Set G) :
    reduced_multiplier_map (MonoidHom.id G) c c (fun _ h => h) =
      AddMonoidHom.id (reduced_multiplier c) := by sorry
lemma reduced_multiplier_map_comp (f : G →* H) (g : H →* K)
    (c : Set G) (d : Set H) (e : Set K)
    (hcd : Set.MapsTo f c d) (hde : Set.MapsTo g d e) :
    reduced_multiplier_map (g.comp f) c e (fun _ h => hde (hcd h)) =
      (reduced_multiplier_map g d e hde).comp (reduced_multiplier_map f c d hcd) := by sorry
lemma commutator_order (x y : G) (hxy : Commute x y) (n : ℕ) :
    homological_commutator (x^n) y (hxy.pow_left n) =
      n • homological_commutator x y hxy := by sorry
lemma commutator_order_involution (x y : G) (hxy : Commute x y) (hx : x^2 = 1) :
    2 • homological_commutator x y hxy = 0 := by sorry
end HomologyMaps

section ExtensionMaps
variable {A E G A' E' G' : Type}
  [Group A] [Group E] [Group G] [Group A'] [Group E'] [Group G']
lemma lift_commutator_map (S : GroupExtension A E G) (T : GroupExtension A' E' G')
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (hc' : ∀ a : A', ∀ e : E', T.inl a * e = e * T.inl a)
    (a : A →* A') (e : E →* E') (g : G →* G')
    (hinl : e.comp S.inl = T.inl.comp a)
    (hproj : T.rightHom.comp e = g.comp S.rightHom)
    (x y : G) (hxy : Commute x y) :
    a (lift_commutator S hc x y hxy) =
      lift_commutator T hc' (g x) (g y) (hxy.map g) := by sorry
end ExtensionMaps

section ReducedCovers
variable {G S : Type} [Group G] [Group S]
-- π and τ are the chosen ordinary cover's actual maps. No new ordinary-cover structure is defined.
variable (π : S →* G)
  (hc : ∀ k : π.ker, ∀ s : S, k.val * s = s * k.val)
  (τ : IntegralMultiplier G ≃+ Additive π.ker)

def cover_relation_subgroup (π : S →* G)
    (hc : ∀ k : π.ker, ∀ s : S, k.val * s = s * k.val)
    (τ : IntegralMultiplier G ≃+ Additive π.ker) (c : Set G) : Subgroup S :=
  ((schur_relations c).map τ.toAddMonoidHom).toSubgroup'.map π.ker.subtype
-- Centrality proves normality; the instance is attached to the subgroup's actual maps.
instance cover_relation_normal (c : Set G) : (cover_relation_subgroup π hc τ c).Normal := by sorry
abbrev reduced_cover (c : Set G) := S ⧸ cover_relation_subgroup π hc τ c

def reduced_cover_quotient (c : Set G) : S →* reduced_cover π hc τ c :=
  QuotientGroup.mk' (cover_relation_subgroup π hc τ c)
def reduced_cover_projection (c : Set G) : reduced_cover π hc τ c →* G := by sorry
lemma reduced_cover_projection_quotient (c : Set G) (s : S) :
    reduced_cover_projection π hc τ c (reduced_cover_quotient π hc τ c s) = π s := by sorry
lemma reduced_cover_projection_surjective (c : Set G) (hπ : Function.Surjective π) :
    Function.Surjective (reduced_cover_projection π hc τ c) := by sorry

def reduced_cover_kernel (c : Set G) : reduced_multiplier c ≃+
    Additive (reduced_cover_projection π hc τ c).ker := by sorry
lemma reduced_cover_kernel_quotient (c : Set G) (z : IntegralMultiplier G) :
    (Additive.toMul (reduced_cover_kernel π hc τ c (QuotientAddGroup.mk z))).val =
      reduced_cover_quotient π hc τ c (Additive.toMul (τ z)).val := by sorry
lemma reduced_cover_central (c : Set G)
    (k : (reduced_cover_projection π hc τ c).ker) (s : reduced_cover π hc τ c) :
    k.val * s = s * k.val := by sorry

-- This compatibility is a genuine condition on the supplied oriented ordinary-cover isomorphism.
variable (horient : ∀ (x y : G) (hxy : Commute x y) (X Y : S),
  π X = x → π Y = y →
  (Additive.toMul (τ (homological_commutator x y hxy))).val = X * Y * X⁻¹ * Y⁻¹)
include horient in
lemma reduced_cover_commute (c : Set G) (x y : G) (hx : x ∈ c) (hxy : Commute x y)
    (X Y : reduced_cover π hc τ c)
    (hX : reduced_cover_projection π hc τ c X = x)
    (hY : reduced_cover_projection π hc τ c Y = y) : Commute X Y := by sorry
include horient in
lemma centralizer_lifts (c : Set G) (hπ : Function.Surjective π)
    (x : G) (hx : x ∈ c) (X : reduced_cover π hc τ c)
    (hX : reduced_cover_projection π hc τ c X = x) (y : G) (hxy : Commute x y) :
    ∃ Y : reduced_cover π hc τ c, reduced_cover_projection π hc τ c Y = y ∧ Commute X Y := by sorry
include horient in
lemma conjugacy_bijection (c : Set G) (hπ : Function.Surjective π)
    (X : reduced_cover π hc τ c) (hX : reduced_cover_projection π hc τ c X ∈ c ∪ {1}) :
    Set.BijOn (reduced_cover_projection π hc τ c) {Y | IsConj X Y}
      {y | IsConj (reduced_cover_projection π hc τ c X) y} := by sorry
lemma reduced_cover_stem (c : Set G) (hπ : Function.Surjective π)
    (hstem : π.ker ≤ commutator S) :
    Function.Bijective (Abelianization.map (reduced_cover_projection π hc τ c)) := by sorry

-- reduced_cover_test_1: the empty relation set retains the chosen ordinary cover.
example : Nonempty (reduced_cover π hc τ (∅ : Set G) ≃* S) := by sorry

end ReducedCovers

section LiftedMarkings
variable {E G : Type} [Group E] [Group G]
-- This construction applies to a reduced cover using conjugacy_bijection above.
-- The representatives and their chosen lifts remain explicit data.
def class_compatible_marking (π : E →* G) (c : Set G)
    (hπ : Function.Surjective π)
    (hb : ∀ X : E, π X ∈ c → Set.BijOn π {Y | IsConj X Y} {y | IsConj (π X) y})
    (rep : InertiaClasses c → c)
    (hrep : ∀ d, inertia_class_mk c (rep d) = d)
    (X : InertiaClasses c → E) (hX : ∀ d, π (X d) = (rep d).val) : c → E := by sorry

variable (π : E →* G) (c : Set G) (hπ : Function.Surjective π)
    (hb : ∀ X : E, π X ∈ c → Set.BijOn π {Y | IsConj X Y} {y | IsConj (π X) y})
    (rep : InertiaClasses c → c) (hrep : ∀ d, inertia_class_mk c (rep d) = d)
    (X : InertiaClasses c → E) (hX : ∀ d, π (X d) = (rep d).val)
local notation "mark" => class_compatible_marking π c hπ hb rep hrep X hX
lemma class_compatible_marking_over (x : c) : π (mark x) = x.val := by sorry
lemma class_compatible_marking_conj
    (hclosed : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (e : E) (x : c) :
    mark ⟨π e * x.val * (π e)⁻¹, hclosed _ _ x.property⟩ = e * mark x * e⁻¹ := by sorry
lemma class_compatible_marking_rep (d : InertiaClasses c) : mark (rep d) = X d := by sorry
lemma class_compatible_marking_change
    (hc : ∀ a : π.ker, ∀ e : E, a.val * e = e * a.val)
    (a : InertiaClasses c → π.ker) (X' : InertiaClasses c → E)
    (hX' : ∀ d, π (X' d) = (rep d).val)
    (hchange : ∀ d, X' d = (a d).val * X d) (x : c) :
    class_compatible_marking π c hπ hb rep hrep X' hX' x =
      (a (inertia_class_mk c x)).val * mark x := by sorry
include hπ hrep in
lemma class_compatible_marking_ext
    (hclosed : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c)
    (f f' : c → E)
    (hf : ∀ e x, f ⟨π e * x.val * (π e)⁻¹, hclosed _ _ x.property⟩ = e * f x * e⁻¹)
    (hf' : ∀ e x, f' ⟨π e * x.val * (π e)⁻¹, hclosed _ _ x.property⟩ = e * f' x * e⁻¹)
    (heq : ∀ d, f (rep d) = f' (rep d)) : f = f' := by sorry
-- class_compatible_marking_test_3: the initial lift choice can be detected at its representative.
example (d : InertiaClasses c) (a : π.ker) (ha : a.val ≠ 1)
    (X' : InertiaClasses c → E) (hX' : ∀ d, π (X' d) = (rep d).val)
    (hd : X' d = a.val * X d) :
    class_compatible_marking π c hπ hb rep hrep X' hX' (rep d) ≠ mark (rep d) := by sorry
end LiftedMarkings

section LocalNormalization
variable {E G : Type} [Group E] [Group G]
-- The one-class condition is separate from generation and rationality.
def local_class_normalization (π : E →* G) (c₀ : G)
    (hb : ∀ X : E, IsConj (π X) c₀ →
      Set.BijOn π {Y | IsConj X Y} {y | IsConj (π X) y})
    (e : E) (he : IsConj (π e) c₀ ∨ π e = 1) : E := by sorry
variable (π : E →* G) (c₀ : G)
    (hc : ∀ a : π.ker, ∀ e : E, a.val * e = e * a.val)
    (hb : ∀ X : E, IsConj (π X) c₀ →
      Set.BijOn π {Y | IsConj X Y} {y | IsConj (π X) y})
local notation "norm" => local_class_normalization π c₀ hb
lemma local_class_normalization_image (e : E) (he : IsConj (π e) c₀ ∨ π e = 1) :
    (π e = 1 → π (norm e he) = 1) ∧ (π e ≠ 1 → π (norm e he) = c₀) := by sorry
include hc in
lemma local_class_normalization_conj (e : E) (he : IsConj (π e) c₀ ∨ π e = 1)
    (g : E) (hge : IsConj (π (g*e*g⁻¹)) c₀ ∨ π (g*e*g⁻¹) = 1) :
    IsConj e (norm e he) ∧ norm (g*e*g⁻¹) hge = norm e he := by sorry
lemma local_class_normalization_fixed (e : E) (he : IsConj (π e) c₀ ∨ π e = 1)
    (hfix : π e = 1 ∨ π e = c₀) : norm e he = e := by sorry
include hc in
lemma local_class_normalization_mul_kernel (a : π.ker) (e : E)
    (he : IsConj (π e) c₀ ∨ π e = 1)
    (hae : IsConj (π (a.val*e)) c₀ ∨ π (a.val*e) = 1) :
    norm (a.val*e) hae = a.val * norm e he := by sorry
-- local_class_normalization_test_1
example (a : π.ker) (ha : IsConj (π a.val) c₀ ∨ π a.val = 1) :
    norm a.val ha = a.val := by sorry
-- local_class_normalization_test_2: identity cover of S₃, transpositions (12) and (23).
example : local_class_normalization (MonoidHom.id (Equiv.Perm (Fin 3)))
    (Equiv.swap 0 1) (by intro X hX; exact ⟨fun x hx => hx, fun _ _ _ _ h => h,
      fun y hy => ⟨y, hy, rfl⟩⟩) (Equiv.swap 1 2) (by sorry) = Equiv.swap 0 1 := by sorry
-- local_class_normalization_test_3: distinct cycle types cannot share this normalization.
example : ¬ IsConj (1 : Equiv.Perm (Fin 3)) (Equiv.swap 0 1) := by sorry
include hc in
lemma local_factors_commute (X Y : E)
    (hX : π X = 1 ∨ π X = c₀) (hY : π Y = 1 ∨ π Y = c₀) : Commute X Y := by sorry
end LocalNormalization

section MarkedMorphisms
variable {A E G A' E' : Type} [CommGroup A] [Group E] [Group G] [Group A'] [Group E']
structure MarkedHom {c : Set G} (M : marked_extension A E G c)
    (M' : marked_extension A' E' G c) where
  hom : E →* E'
  over : M'.extension.rightHom.comp hom = M.extension.rightHom
  mark : ∀ x : c, hom (M.marking x) = M'.marking x
lemma marked_extension_hom {c : Set G} (M : marked_extension A E G c)
    (M' : marked_extension A' E' G c) (f : MarkedHom M M') :
    M'.extension.rightHom.comp f.hom = M.extension.rightHom ∧
      ∀ x : c, f.hom (M.marking x) = M'.marking x := by sorry
lemma marked_extension_hom_ext {c : Set G} (M : marked_extension A E G c)
    (M' : marked_extension A' E' G c) (hgen : Subgroup.closure (Set.range M.marking) = ⊤)
    (f g : MarkedHom M M') : f = g := by sorry
lemma word_conjugation (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (u : universal_presentation c hc) (x : c) :
    u * universal_presentation_gen c hc x * u⁻¹ =
      universal_presentation_gen c hc
        ⟨universal_presentation_projection c hc u * x.val *
          (universal_presentation_projection c hc u)⁻¹, hc _ _ x.property⟩ := by sorry
lemma universal_marked_property (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (M : marked_extension A E G c) :
    ∃! f : universal_presentation c hc →* E,
      M.extension.rightHom.comp f = universal_presentation_projection c hc ∧
      ∀ x : c, f (universal_presentation_gen c hc x) = M.marking x := by sorry
lemma presentation_abelianization (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (hgen : Subgroup.closure c = ⊤) :
    Function.Bijective (Abelianization.lift (universal_degree c hc)) := by sorry
lemma marking_correction_over {P : Type} [Group P] (c : Set G)
    (M : marked_extension A E G c) (φ : P →* E) (ψ : P →* A) :
    M.extension.rightHom.comp (marking_correction φ M.extension.inl M.central ψ) =
      M.extension.rightHom.comp φ := by sorry
end MarkedMorphisms

section CoverCoordinates
variable {G S : Type} [Group G] [Group S]
abbrev degree_to_abelianization (c : Set G) := (class_degree_map c).toMultiplicativeLeft
abbrev cover_fiber_product (π : S →* G) (c : Set G) :=
  marked_fiber_product (Abelianization.of.comp π) (degree_to_abelianization c)
abbrev cover_fiber_degree (π : S →* G) (c : Set G) :=
  marked_fiber_product_degree (Abelianization.of.comp π) (degree_to_abelianization c)
abbrev cover_fiber_projection (π : S →* G) (c : Set G) :=
  π.comp (marked_fiber_product_first (Abelianization.of.comp π) (degree_to_abelianization c))
def marked_fiber_product_mark (π : S →* G) (c : Set G) (s : c → S)
    (hs : ∀ x : c, π (s x) = x.val) (x : c) : cover_fiber_product π c := by sorry
lemma marked_fiber_product_mark_val (π : S →* G) (c : Set G) (s : c → S)
    (hs : ∀ x : c, π (s x) = x.val) (x : c) :
    (marked_fiber_product_mark π c s hs x).val =
      (s x, Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1)) := by sorry
lemma fiber_product_commutator (π : S →* G) (c : Set G) (hgen : Subgroup.closure c = ⊤) :
    (commutator (cover_fiber_product π c)).map (cover_fiber_product π c).subtype =
      (commutator S).prod ⊥ := by sorry
lemma fiber_product_abelianization (π : S →* G) (c : Set G)
    (hgen : Subgroup.closure c = ⊤) (hπ : Function.Bijective (Abelianization.map π)) :
    Function.Bijective (Abelianization.lift (cover_fiber_degree π c)) := by sorry
-- marked_fiber_product_test_1: the C₂ degree constraint is the graph of reduction modulo two.
example : Nonempty (cover_fiber_product (MonoidHom.id (Multiplicative (ZMod 2)))
    {Multiplicative.ofAdd 1} ≃* Multiplicative ℤ) := by sorry
-- marked_fiber_product_test_2
example : Subsingleton (cover_fiber_product (MonoidHom.id (Multiplicative (ZMod 1))) ∅) := by sorry
-- Generation is essential for both fiber-product calculations. With no marked
-- classes, the identity projection of S₃ gives P=A₃ and a zero degree lattice.
example : Nat.card (cover_fiber_product (MonoidHom.id (Equiv.Perm (Fin 3))) ∅) = 3 ∧
    Nat.card (commutator (cover_fiber_product (MonoidHom.id (Equiv.Perm (Fin 3))) ∅)) = 1 ∧
    Nat.card (commutator (Equiv.Perm (Fin 3))) = 3 := by sorry
example : Nat.card (Abelianization
    (cover_fiber_product (MonoidHom.id (Equiv.Perm (Fin 3))) ∅)) = 3 ∧
    Subsingleton (InertiaClasses (∅ : Set (Equiv.Perm (Fin 3))) →₀ ℤ) := by sorry
-- universal_degree_test_1: the degree map itself, rather than an unspecified isomorphism, is bijective.
example : Function.Bijective (universal_degree
    {Multiplicative.ofAdd (1 : ZMod 2)} (comm_singleton_closed _)) := by sorry
end CoverCoordinates

-- The subgroup keeps its inherited group operations; only commutativity is added.
instance universal_kernel_commGroup {G : Type} [Group G] (c : Set G)
    (hclosed : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :
    CommGroup (universal_kernel c hclosed) where
  __ := (inferInstance : Group (universal_kernel c hclosed))
  mul_comm a b := by sorry

section ComparisonCoordinates
variable {G S : Type} [Group G] [Group S] [Finite G]
variable (π : S →* G) (hc : ∀ k : π.ker, ∀ s : S, k.val * s = s * k.val)
    (τ : IntegralMultiplier G ≃+ Additive π.ker) (c : Set G)
    (hclosed : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c)
variable (hπ : Function.Surjective π) (hstem : π.ker ≤ commutator S)
    (horient : ∀ (x y : G) (hxy : Commute x y) (X Y : S), π X = x → π Y = y →
      (Additive.toMul (τ (homological_commutator x y hxy))).val = X*Y*X⁻¹*Y⁻¹)
    (hgen : Subgroup.closure c = ⊤)
-- The map parameters are the chosen parent cover; the kernel is never replaced by a new carrier.
include horient hπ hstem in
lemma homology_image :
    (integral_multiplier_map (reduced_cover_projection π hc τ c)).range = schur_relations c := by sorry
include horient hπ hstem in
lemma homology_composite_zero (z : IntegralMultiplier (reduced_cover π hc τ c)) :
    (QuotientAddGroup.mk (integral_multiplier_map (reduced_cover_projection π hc τ c) z) : reduced_multiplier c) = 0 := by sorry

variable (s : c → reduced_cover π hc τ c)
    (hs : ∀ x : c, reduced_cover_projection π hc τ c (s x) = x.val)
    (hseq : ∀ e : (reduced_cover π hc τ c), ∀ x : c,
      s ⟨reduced_cover_projection π hc τ c e * x.val *
        (reduced_cover_projection π hc τ c e)⁻¹, hclosed _ _ x.property⟩ = e*s x*e⁻¹)
-- Arbitrary abelian kernels are allowed, including the infinite kernel of U(G,c).
include hπ hstem horient hgen hseq in
lemma marked_pullback_split {A E : Type} [CommGroup A] [Group E]
    (M : marked_extension A E G c) :
    ∃ f : cover_fiber_product (reduced_cover_projection π hc τ c) c →* E,
      M.extension.rightHom.comp f = cover_fiber_projection (reduced_cover_projection π hc τ c) c := by sorry
include hπ hstem horient hgen hseq in
lemma fiber_product_universal {A E : Type} [CommGroup A] [Group E]
    (M : marked_extension A E G c) :
    ∃! f : cover_fiber_product (reduced_cover_projection π hc τ c) c →* E,
      M.extension.rightHom.comp f = cover_fiber_projection (reduced_cover_projection π hc τ c) c ∧
      ∀ x : c, f ((marked_fiber_product_mark (reduced_cover_projection π hc τ c) c s hs) x) = M.marking x := by sorry
include hπ hstem horient hgen hseq in
lemma presentation_comparison :
    ∃ F : universal_presentation c hclosed ≃* cover_fiber_product (reduced_cover_projection π hc τ c) c,
    (cover_fiber_projection (reduced_cover_projection π hc τ c) c).comp F.toMonoidHom = universal_presentation_projection c hclosed ∧
    (cover_fiber_degree (reduced_cover_projection π hc τ c) c).comp F.toMonoidHom = universal_degree c hclosed ∧
    ∀ x : c, F (universal_presentation_gen c hclosed x) =
      marked_fiber_product_mark (reduced_cover_projection π hc τ c) c s hs x := by sorry
include hπ hstem horient hgen hseq in
lemma universal_kernel_product : Nonempty (universal_kernel c hclosed ≃*
    Multiplicative (reduced_multiplier c) × Multiplicative (class_degree_map c).ker) := by sorry
include hπ hstem horient hgen hseq in
lemma universal_kernel_torsion :
    Nonempty (CommGroup.torsion (universal_kernel c hclosed) ≃* Multiplicative (reduced_multiplier c)) := by sorry
end ComparisonCoordinates

section IntegralUCTContract
variable {G H A B : Type} [Group G] [Group H] [AddCommGroup A] [AddCommGroup B]
-- Native carrier and evaluation required by the integral homological input contract.
def integral_uct_evaluation :
    groupCohomology.H2 (Rep.trivial ℤ G A) →+ (IntegralMultiplier G →+ A) := by sorry
lemma integral_uct_evaluation_cycle
    (φ : groupCohomology.cocycles₂ (Rep.trivial ℤ G A))
    (z : groupHomology.cycles₂ (Rep.trivial ℤ G ℤ)) :
    integral_uct_evaluation (groupCohomology.H2π (Rep.trivial ℤ G A) φ)
      (groupHomology.H2π (Rep.trivial ℤ G ℤ) z) =
        z.val.sum (fun p n => n • φ p) := by sorry
lemma integral_uct_evaluation_group_map (f : G →* H)
    (α : groupCohomology.H2 (Rep.trivial ℤ H A)) (z : IntegralMultiplier G) :
    integral_uct_evaluation
      (groupCohomology.map (A := Rep.trivial ℤ H A) (B := Rep.trivial ℤ G A) f
        (Rep.ofHom { toLinearMap := LinearMap.id, isIntertwining' := by intro g; rfl }) 2 α) z =
      integral_uct_evaluation α (integral_multiplier_map f z) := by sorry
lemma integral_uct_evaluation_coefficient_map (μ : A →+ B)
    (α : groupCohomology.H2 (Rep.trivial ℤ G A)) (z : IntegralMultiplier G) :
    integral_uct_evaluation
      (groupCohomology.map (A := Rep.trivial ℤ G A) (B := Rep.trivial ℤ G B)
        (MonoidHom.id G) (Rep.ofHom { toLinearMap := μ.toIntLinearMap, isIntertwining' := by intro g; rfl }) 2 α) z =
      μ (integral_uct_evaluation α z) := by sorry
-- This is the existing derived Ext carrier, with no chosen splitting of UCT.
abbrev IntegralUCTExt (G A : Type) [Group G] [AddCommGroup A] :=
  ((Ext ℤ (ModuleCat ℤ) 1).obj
    (Opposite.op (ModuleCat.of ℤ (Additive (Abelianization G))))).obj (ModuleCat.of ℤ A)
-- The injection is a specified natural map, rather than an existential choice.
def integral_uct_ext_inclusion :
    IntegralUCTExt G A →+ groupCohomology.H2 (Rep.trivial ℤ G A) := by sorry
lemma integral_uct_ext_inclusion_injective :
    Function.Injective (integral_uct_ext_inclusion (G := G) (A := A)) := by sorry
lemma integral_uct_ext_inclusion_range :
    (integral_uct_ext_inclusion (G := G) (A := A)).range =
      (integral_uct_evaluation (G := G) (A := A)).ker := by sorry
lemma integral_uct_ext_inclusion_group_map (f : G →* H) (ξ : IntegralUCTExt H A) :
    integral_uct_ext_inclusion
      (((Ext ℤ (ModuleCat ℤ) 1).map
        (ModuleCat.ofHom (Abelianization.map f).toAdditive.toIntLinearMap).op).app
          (ModuleCat.of ℤ A) ξ) =
    groupCohomology.map (A := Rep.trivial ℤ H A) (B := Rep.trivial ℤ G A) f
      (Rep.ofHom { toLinearMap := LinearMap.id, isIntertwining' := by intro g; rfl }) 2
        (integral_uct_ext_inclusion ξ) := by sorry
lemma integral_uct_ext_inclusion_coefficient_map (μ : A →+ B) (ξ : IntegralUCTExt G A) :
    integral_uct_ext_inclusion
      (((Ext ℤ (ModuleCat ℤ) 1).obj
        (Opposite.op (ModuleCat.of ℤ (Additive (Abelianization G))))).map
          (ModuleCat.ofHom μ.toIntLinearMap) ξ) =
    groupCohomology.map (A := Rep.trivial ℤ G A) (B := Rep.trivial ℤ G B)
      (MonoidHom.id G)
      (Rep.ofHom { toLinearMap := μ.toIntLinearMap, isIntertwining' := by intro g; rfl }) 2
        (integral_uct_ext_inclusion ξ) := by sorry
lemma integral_uct_evaluation_exact :
    Function.Surjective (integral_uct_evaluation (G := G) (A := A)) ∧
    Function.Injective (integral_uct_ext_inclusion (G := G) (A := A)) ∧
    (integral_uct_ext_inclusion (G := G) (A := A)).range =
      (integral_uct_evaluation (G := G) (A := A)).ker := by sorry
lemma integral_uct_evaluation_free [Module.Free ℤ (Additive (Abelianization G))] :
    Function.Bijective (integral_uct_evaluation (G := G) (A := A)) := by sorry
-- integral_uct_ext_inclusion_test_1: every cyclic integral class is an Ext class.
example : Function.Bijective
    (integral_uct_ext_inclusion (G := Multiplicative (ZMod 2)) (A := ℤ)) ∧
    ∃ ξ : IntegralUCTExt (Multiplicative (ZMod 2)) ℤ,
      integral_uct_ext_inclusion ξ ≠ 0 := by sorry
-- integral_uct_ext_inclusion_test_2: the integral torus has no Ext contribution.
example : integral_uct_ext_inclusion
    (G := Multiplicative (ℤ × ℤ)) (A := A) = 0 := by sorry
-- integral_uct_ext_inclusion_test_3: torsion coefficient classes are not discarded.
example : ∃ ξ : IntegralUCTExt (Multiplicative (ZMod 4)) (ZMod 2),
    integral_uct_ext_inclusion ξ ≠ 0 ∧
    integral_uct_evaluation (integral_uct_ext_inclusion ξ) = 0 := by sorry
-- integral_uct_evaluation_test_1: cyclic Ext classes have zero evaluation.
example : ∃ α : groupCohomology.H2 (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ),
    α ≠ 0 ∧ integral_uct_evaluation α = 0 := by sorry
-- integral_uct_evaluation_test_2: an infinite coefficient group retains orientation.
example :
    let G := Multiplicative (ℤ × ℤ)
    let φ : groupCohomology.cocycles₂ (Rep.trivial ℤ G ℤ) :=
      ⟨fun p => p.1.toAdd.1 * p.2.toAdd.2, by sorry⟩
    let x : G := Multiplicative.ofAdd (1, 0)
    let y : G := Multiplicative.ofAdd (0, 1)
    let z : groupHomology.cycles₂ (Rep.trivial ℤ G ℤ) :=
      ⟨Finsupp.single (x,y) 1 - Finsupp.single (y,x) 1, by sorry⟩
    integral_uct_evaluation (groupCohomology.H2π (Rep.trivial ℤ G ℤ) φ)
      (groupHomology.H2π (Rep.trivial ℤ G ℤ) z) = 1 ∧
    integral_uct_evaluation (groupCohomology.H2π (Rep.trivial ℤ G ℤ) φ)
      (groupHomology.H2π (Rep.trivial ℤ G ℤ) (-z)) = -1 := by sorry
-- integral_uct_evaluation_test_3: the alternating class also survives with 2-torsion coefficients.
example :
    let G := Multiplicative (ZMod 2 × ZMod 2)
    let φ : groupCohomology.cocycles₂ (Rep.trivial ℤ G (ZMod 2)) :=
      ⟨fun p => p.1.toAdd.1 * p.2.toAdd.2, by sorry⟩
    let x : G := Multiplicative.ofAdd (1, 0)
    let y : G := Multiplicative.ofAdd (0, 1)
    let z : groupHomology.cycles₂ (Rep.trivial ℤ G ℤ) :=
      ⟨Finsupp.single (x,y) 1 - Finsupp.single (y,x) 1, by sorry⟩
    integral_uct_evaluation (groupCohomology.H2π (Rep.trivial ℤ G (ZMod 2)) φ)
      (groupHomology.H2π (Rep.trivial ℤ G ℤ) z) = 1 := by sorry
end IntegralUCTContract

section CoefficientEvaluation
variable {A E G : Type} [CommGroup A] [Group E] [Group G]
-- The value on H₂ is obtained from the extension cocycle; arbitrary kernels are permitted.
-- Its implementation is the integral UCT adapter, whose supplying layer remains an input.
def extension_class_map (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) :
    IntegralMultiplier G →+ Additive A := by sorry
lemma homological_commutator_central_extension (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (x y : G) (hxy : Commute x y) :
    extension_class_map S hc (homological_commutator x y hxy) =
      Additive.ofMul (lift_commutator S hc x y hxy) := by sorry
lemma extension_class_map_section (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) (σ : S.Section)
    (φ : groupCohomology.cocycles₂ (Rep.trivial ℤ G (Additive A)))
    (hφ : ∀ g h, S.inl (Additive.toMul (φ (g,h))) =
      σ g * σ h * (σ (g*h))⁻¹) :
    extension_class_map S hc =
      integral_uct_evaluation (groupCohomology.H2π (Rep.trivial ℤ G (Additive A)) φ) := by sorry
lemma extension_class_map_natural {A' E' G' : Type}
    [CommGroup A'] [Group E'] [Group G'] (S : GroupExtension A E G)
    (S' : GroupExtension A' E' G')
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (hc' : ∀ a : A', ∀ e : E', S'.inl a * e = e * S'.inl a)
    (fA : A →* A') (fE : E →* E') (fG : G →* G')
    (hkernel : ∀ a, fE (S.inl a) = S'.inl (fA a))
    (hprojection : S'.rightHom.comp fE = fG.comp S.rightHom)
    (z : IntegralMultiplier G) :
    extension_class_map S' hc' (integral_multiplier_map fG z) =
      Additive.ofMul (fA (Additive.toMul (extension_class_map S hc z))) := by sorry
lemma extension_class_map_five_term (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) :
    (integral_multiplier_map S.rightHom).range = (extension_class_map S hc).ker := by sorry
-- The remaining arrows use the existing abelianization maps, with no new H₁ carrier.
lemma extension_class_map_exact_at_kernel (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) :
    (extension_class_map S hc).range =
      ((Abelianization.of.comp S.inl).toAdditive).ker := by sorry
lemma extension_class_map_exact_at_abelianization (S : GroupExtension A E G) :
    ((Abelianization.of.comp S.inl).toAdditive).range =
      ((Abelianization.map S.rightHom).toAdditive).ker := by sorry
lemma extension_class_map_abelianization_surjective (S : GroupExtension A E G) :
    Function.Surjective (Abelianization.map S.rightHom).toAdditive := by sorry
lemma extension_class_map_split (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) (σ : S.Splitting) :
    extension_class_map S hc = 0 := by sorry
-- extension_class_map_test_1: split extensions with arbitrary, possibly infinite kernels.
example (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) (σ : S.Splitting) :
    ∀ z, extension_class_map S hc z = 0 := by sorry
-- extension_class_map_test_2: zero evaluation does not imply splitting with cyclic abelianization.
example (S : GroupExtension (Multiplicative (ZMod 2)) (Multiplicative (ZMod 4))
    (Multiplicative (ZMod 2)))
    (hc : ∀ a e, S.inl a * e = e * S.inl a) :
    extension_class_map S hc = 0 ∧ IsEmpty S.Splitting := by sorry
-- extension_five_term_test_1: a split central kernel injects into the total abelianization.
example (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) (σ : S.Splitting) :
    Function.Injective (Abelianization.of.comp S.inl).toAdditive ∧
      Function.Surjective (Abelianization.map S.rightHom).toAdditive := by sorry
-- extension_five_term_test_2: a nonsplit abelian extension still has an injective kernel arrow.
example (S : GroupExtension (Multiplicative (ZMod 2)) (Multiplicative (ZMod 4))
    (Multiplicative (ZMod 2))) :
    Function.Injective (Abelianization.of.comp S.inl).toAdditive ∧
      Nat.card ((Abelianization.map S.rightHom).toAdditive).ker = 2 ∧
      ¬ Function.Injective (Abelianization.map S.rightHom).toAdditive := by sorry
end CoefficientEvaluation

section DegreePermutation
variable {D : Type}
-- The coordinate permutation is the existing Finsupp equivalence.
abbrev degree_permutation (σ : D ≃ D) : (D →₀ ℤ) ≃+ (D →₀ ℤ) := Finsupp.domCongr σ
lemma degree_permutation_basis (σ : D ≃ D) (d : D) :
    degree_permutation σ (Finsupp.single d 1) = Finsupp.single (σ d) 1 := by sorry
lemma degree_permutation_sum [Fintype D] (σ : D ≃ D) (m : D →₀ ℤ) :
    ∑ d, degree_permutation σ m d = ∑ d, m d := by sorry
lemma degree_permutation_lower_bound (σ : D ≃ D) (m : D →₀ ℤ) (M : ℤ) :
    (∀ d, M ≤ degree_permutation σ m d) ↔ ∀ d, M ≤ m d := by sorry
-- degree_permutation_test_1
example (σ : D ≃ D) : degree_permutation σ 0 = 0 := by sorry
-- degree_permutation_test_2
example : degree_permutation (Equiv.swap (0 : Fin 2) 1)
    (Finsupp.single 0 1 + Finsupp.single 1 4) =
      Finsupp.single 0 4 + Finsupp.single 1 1 := by sorry
-- degree_permutation_test_3: a fixed coordinate retains its integer coefficient.
example : degree_permutation (Equiv.refl (Fin 1)) (Finsupp.single 0 1) =
    Finsupp.single 0 1 ∧ degree_permutation (Equiv.refl (Fin 1)) (Finsupp.single 0 1) ≠
      Finsupp.single 0 3 := by sorry
end DegreePermutation

section Twists
variable {B T X Y : Type} [Group B] [Torsor B T] [MulAction B X] [MulAction B Y]
-- Existing bundled equivariant maps provide the actual carrier.
abbrev cyclotomic_twist (B T X : Type) [Group B] [MulAction B T] [MulAction B X] := T →[B] X
def cyclotomic_twist_evaluation (t₀ : T) : cyclotomic_twist B T X ≃ X := by sorry
lemma cyclotomic_twist_evaluation_apply (t₀ : T) (f : cyclotomic_twist B T X) :
    cyclotomic_twist_evaluation t₀ f = f t₀ := by sorry
lemma cyclotomic_twist_change (t₀ : T) (b : B) (f : cyclotomic_twist B T X) :
    cyclotomic_twist_evaluation (b • t₀) f = b • cyclotomic_twist_evaluation t₀ f := by sorry
def cyclotomic_twist_map (f : X →[B] Y) : cyclotomic_twist B T X → cyclotomic_twist B T Y :=
  fun g => f.comp g
lemma cyclotomic_twist_map_evaluation (t₀ : T) (f : X →[B] Y) (g : cyclotomic_twist B T X) :
    cyclotomic_twist_evaluation t₀ (cyclotomic_twist_map f g) =
      f (cyclotomic_twist_evaluation t₀ g) := by sorry
-- cyclotomic_twist_test_1
example [Subsingleton X] : Subsingleton (cyclotomic_twist B T X) := by sorry
-- cyclotomic_twist_test_2
example : Nat.card (cyclotomic_twist (Multiplicative (ZMod 2))
    (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))) = 2 := by sorry
-- cyclotomic_twist_test_3: arbitrary functions and fixed points give different carriers.
example : Nat.card (Multiplicative (ZMod 2) → Multiplicative (ZMod 2)) = 4 ∧
    ¬ ∃ x : Multiplicative (ZMod 2), ∀ b : Multiplicative (ZMod 2), b • x = x := by sorry
end Twists

section PowerCoordinates
variable {A E G : Type} [CommGroup A] [Group E] [Group G]
def power_class_permutation (c : Set G) (n : ℕ) (hn : 0 < n)
    (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (α : (ZMod n)ˣ) : InertiaClasses c ≃ InertiaClasses c := by sorry
lemma power_class_permutation_mk (c : Set G) (n : ℕ) (hn : 0 < n)
    (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (α : (ZMod n)ˣ) (x : c) :
    power_class_permutation c n hn hG hpow α (inertia_class_mk c x) =
      inertia_class_mk c ⟨finite_power n α x.val, hpow α x.val x.property⟩ := by sorry
lemma degree_permutation_abelianization (c : Set G) (n : ℕ) (hn : 0 < n)
    (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (α : (ZMod n)ˣ) (m : InertiaClasses c →₀ ℤ) :
    Additive.toMul (class_degree_map c
      (degree_permutation (power_class_permutation c n hn hG hpow α) m)) =
      finite_power n α (Additive.toMul (class_degree_map c m)) := by sorry
-- An arbitrary finite central marked model suffices for the coordinate formula.
def central_power_correction {c : Set G} (M : marked_extension A E G c)
    (n : ℕ) (hn : 0 < n) (hE : ∀ e : E, e^n = 1) (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (α : (ZMod n)ˣ) : Multiplicative (InertiaClasses c →₀ ℤ) →* A := by sorry

variable {c : Set G} (M : marked_extension A E G c)
    (n : ℕ) (hn : 0 < n) (hE : ∀ e : E, e^n = 1) (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
local notation "W" => central_power_correction M n hn hE hG hpow
local notation "σ" => power_class_permutation c n hn hG hpow
lemma central_power_correction_basis (α : (ZMod n)ˣ) (x : c) :
    M.extension.inl (W α (Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1))) =
      (finite_power n α (M.marking x))⁻¹ *
        M.marking ⟨finite_power n α x.val, hpow α x.val x.property⟩ := by sorry
lemma central_power_correction_add (α : (ZMod n)ˣ) (m k : InertiaClasses c →₀ ℤ) :
    W α (Multiplicative.ofAdd (m+k)) =
      W α (Multiplicative.ofAdd m) * W α (Multiplicative.ofAdd k) := by sorry
lemma central_power_correction_identity (m : Multiplicative (InertiaClasses c →₀ ℤ)) :
    W 1 m = 1 := by sorry
lemma central_power_correction_choice (M' : marked_extension A E G c)
    (hext : M'.extension = M.extension) (hE' : ∀ e : E, e^n = 1)
    (a : InertiaClasses c → A)
    (ha : ∀ x : c, M'.marking x = M.marking x * M.extension.inl (a (inertia_class_mk c x)))
    (α : (ZMod n)ˣ) (x : c) :
    central_power_correction M' n hn hE' hG hpow α
      (Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1)) =
    (finite_power n α (a (inertia_class_mk c x)))⁻¹ *
      W α (Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1)) *
        a (σ α (inertia_class_mk c x)) := by sorry
lemma correction_cocycle (α β : (ZMod n)ˣ) (m : InertiaClasses c →₀ ℤ) :
    W (α*β) (Multiplicative.ofAdd m) =
      finite_power n α (W β (Multiplicative.ofAdd m)) *
        W α (Multiplicative.ofAdd (degree_permutation (σ β) m)) := by sorry
-- central_power_correction_test_1
example (α : (ZMod n)ˣ) : W α 1 = 1 := by sorry
-- central_power_correction_test_2
example (x : c) : W 1 (Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1)) = 1 := by sorry
-- central_power_correction_test_3: inversion retains the chosen lift square.
example (x : c) (hx : x.val^2 = 1) (hX : (M.marking x)^2 ≠ 1) :
    M.extension.inl (W (-1 : (ZMod n)ˣ)
      (Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1))) =
      (M.marking x)^2 ∧ W (-1 : (ZMod n)ˣ)
      (Multiplicative.ofAdd (Finsupp.single (inertia_class_mk c x) 1)) ≠ 1 := by sorry

def discrete_action : (ZMod n)ˣ →* Equiv.Perm (cover_fiber_product M.extension.rightHom c) := by
  have := hn
  have := hE
  have := hG
  have := hpow
  sorry
lemma discrete_action_formula (α : (ZMod n)ˣ) (p : cover_fiber_product M.extension.rightHom c) :
    (discrete_action M n hn hE hG hpow α p).val =
      (finite_power n α p.val.1 * M.extension.inl (W α p.val.2),
        Multiplicative.ofAdd (degree_permutation (σ α) (Multiplicative.toAdd p.val.2))) := by sorry
lemma discrete_action_projection (α : (ZMod n)ˣ) (p : cover_fiber_product M.extension.rightHom c) :
    cover_fiber_projection M.extension.rightHom c (discrete_action M n hn hE hG hpow α p) =
      finite_power n α (cover_fiber_projection M.extension.rightHom c p) := by sorry
lemma discrete_action_degree (α : (ZMod n)ˣ) (p : cover_fiber_product M.extension.rightHom c) :
    Multiplicative.toAdd (cover_fiber_degree M.extension.rightHom c
      (discrete_action M n hn hE hG hpow α p)) =
      degree_permutation (σ α) (Multiplicative.toAdd (cover_fiber_degree M.extension.rightHom c p)) := by sorry
-- discrete_action_test_1
example (α : (ZMod n)ˣ) (p : cover_fiber_product M.extension.rightHom c) :
    discrete_action M n hn hE hG hpow 1 p = p ∧
      discrete_action M n hn hE hG hpow α 1 = 1 := by sorry

def kernel_action_aut : (ZMod n)ˣ →* MulAut (cover_fiber_projection M.extension.rightHom c).ker := by
  have := hn
  have := hE
  have := hG
  have := hpow
  sorry
lemma kernel_action_aut_val (α : (ZMod n)ˣ)
    (k : (cover_fiber_projection M.extension.rightHom c).ker) :
    (kernel_action_aut M n hn hE hG hpow α k).val =
      discrete_action M n hn hE hG hpow α k.val := by sorry
end PowerCoordinates

section CoverExamples
abbrev Two := Multiplicative (ZMod 2)
abbrev Four := Two × Two
-- Concrete source examples specify their quotient and central injection.
def dihedral_v4_extension : GroupExtension Two (DihedralGroup 4) Four := by sorry
lemma dihedral_v4_rotation :
    dihedral_v4_extension.rightHom (DihedralGroup.r 1) = (Multiplicative.ofAdd 1, 1) := by sorry
lemma dihedral_v4_reflection :
    dihedral_v4_extension.rightHom (DihedralGroup.sr 0) = (1, Multiplicative.ofAdd 1) := by sorry
lemma dihedral_v4_inl :
    dihedral_v4_extension.inl (Multiplicative.ofAdd 1) = DihedralGroup.r 2 := by sorry
lemma dihedral_v4_central : ∀ a : Two, ∀ e : DihedralGroup 4,
    dihedral_v4_extension.inl a * e = e * dihedral_v4_extension.inl a := by sorry
-- lift_commutator_test_3
example : lift_commutator dihedral_v4_extension dihedral_v4_central
    (Multiplicative.ofAdd 1, 1) (1, Multiplicative.ofAdd 1) (Commute.all _ _) =
      Multiplicative.ofAdd 1 := by sorry

-- extension_class_map_test_3: the chosen D₈ lifts detect the nonzero V₄ multiplier.
example : extension_class_map dihedral_v4_extension dihedral_v4_central
    (homological_commutator (Multiplicative.ofAdd 1, 1)
      (1, Multiplicative.ofAdd 1) (by sorry)) =
    Additive.ofMul (Multiplicative.ofAdd (1 : ZMod 2)) := by sorry
-- extension_five_term_test_3: a nontrivial stem kernel disappears in total abelianization.
example : (Abelianization.of.comp dihedral_v4_extension.inl).toAdditive = 0 ∧
    Function.Bijective (Abelianization.map dihedral_v4_extension.rightHom).toAdditive ∧
    Function.Surjective (extension_class_map dihedral_v4_extension dihedral_v4_central) := by sorry
def dihedral_v4_class_map : IntegralMultiplier Four ≃+ Additive dihedral_v4_extension.rightHom.ker := by sorry
lemma dihedral_v4_kernel_central : ∀ k : dihedral_v4_extension.rightHom.ker,
    ∀ e : DihedralGroup 4, k.val * e = e * k.val := by sorry
-- reduced_cover_test_2
example : Nonempty (reduced_cover dihedral_v4_extension.rightHom dihedral_v4_kernel_central
    dihedral_v4_class_map {g : Four | g ≠ 1} ≃* Four) := by sorry

def quaternion_v4_extension : GroupExtension Two (QuaternionGroup 2) Four := by sorry
lemma quaternion_v4_rotation :
    quaternion_v4_extension.rightHom (QuaternionGroup.a 1) = (Multiplicative.ofAdd 1, 1) := by sorry
lemma quaternion_v4_other :
    quaternion_v4_extension.rightHom (QuaternionGroup.xa 0) = (1, Multiplicative.ofAdd 1) := by sorry
lemma quaternion_v4_inl :
    quaternion_v4_extension.inl (Multiplicative.ofAdd 1) = QuaternionGroup.a 2 := by sorry
lemma quaternion_v4_kernel_central : ∀ k : quaternion_v4_extension.rightHom.ker,
    ∀ e : QuaternionGroup 2, k.val * e = e * k.val := by sorry
def quaternion_v4_class_map : IntegralMultiplier Four ≃+ Additive quaternion_v4_extension.rightHom.ker := by sorry
-- reduced_cover_test_3: the empty relation set retains the nonisomorphic cover choices.
example : ¬ Nonempty (reduced_cover dihedral_v4_extension.rightHom dihedral_v4_kernel_central
    dihedral_v4_class_map ∅ ≃* reduced_cover quaternion_v4_extension.rightHom
      quaternion_v4_kernel_central quaternion_v4_class_map ∅) := by sorry
end CoverExamples

section MarkingExamples
variable {G : Type} [Group G]
lemma identity_class_bijection (c : Set G) : ∀ X : G, (MonoidHom.id G) X ∈ c →
    Set.BijOn (MonoidHom.id G) {Y | IsConj X Y} {y | IsConj ((MonoidHom.id G) X) y} := by
  intro X _
  exact ⟨fun _ h => h, fun _ _ _ _ h => h, fun y hy => ⟨y, hy, rfl⟩⟩
-- class_compatible_marking_test_2: the identity model marks by inclusion, for arbitrary classes.
example (c : Set G) (rep : InertiaClasses c → c)
    (hrep : ∀ d, inertia_class_mk c (rep d) = d) (x : c) :
    class_compatible_marking (MonoidHom.id G) c Function.surjective_id
      (identity_class_bijection c) rep hrep (fun d => (rep d).val) (fun _ => rfl) x = x.val := by sorry
-- class_compatible_marking_test_1: there is exactly one empty marking.
example (f g : (∅ : Set G) → G) : f = g := by sorry
end MarkingExamples

section LiftSquares
variable {A E G : Type} [CommGroup A] [Group E] [Group G]
-- Extract a square from an actual extension; do not square the whole cover as a homomorphism.
def involution_lift_square (S : GroupExtension A E G) (x : G) (hx : x^2 = 1)
    (X : E) (hX : S.rightHom X = x) : A := by sorry
lemma involution_lift_square_inl (S : GroupExtension A E G) (x : G) (hx : x^2 = 1)
    (X : E) (hX : S.rightHom X = x) :
    S.inl (involution_lift_square S x hx X hX) = X^2 := by sorry
lemma involution_square_central (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (x : G) (hx : x^2 = 1) (X : E) (hX : S.rightHom X = x) (Y : E) :
    X^2 * Y = Y * X^2 := by sorry
lemma lift_square_columns (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (x y : G) (hx : x^2 = 1) (hy : y^2 = 1) (hxy : IsConj x y)
    (X Y : E) (hX : S.rightHom X = x) (hY : S.rightHom Y = y) :
    TauCeti.elementaryTwoQuotientMk (involution_lift_square S x hx X hX) =
      TauCeti.elementaryTwoQuotientMk (involution_lift_square S y hy Y hY) := by sorry

variable {c : Set G} (M : marked_extension A E G c)
    (hinv : ∀ x : c, x.val^2 = 1) (rep : InertiaClasses c → c)
def marked_square_column (d : InertiaClasses c) : A :=
  involution_lift_square M.extension (rep d).val (hinv (rep d))
    (M.marking (rep d)) (M.over (rep d))
def parity_square_map [Fintype (InertiaClasses c)] :
    (InertiaClasses c → ZMod 2) →ₗ[ZMod 2] TauCeti.ElementaryTwoQuotient A := by
  have := M
  have := hinv
  have := rep
  sorry
lemma parity_square_map_basis_s [Fintype (InertiaClasses c)] [DecidableEq (InertiaClasses c)]
    (d : InertiaClasses c) :
    parity_square_map M hinv rep (Pi.single d 1) =
      TauCeti.elementaryTwoQuotientMk (marked_square_column M hinv rep d) := by sorry
lemma parity_square_map_linear [Fintype (InertiaClasses c)]
    (v w : InertiaClasses c → ZMod 2) (r : ZMod 2) :
    parity_square_map M hinv rep (v+w) =
        parity_square_map M hinv rep v + parity_square_map M hinv rep w ∧
      parity_square_map M hinv rep (r • v) = r • parity_square_map M hinv rep v := by sorry
lemma parity_square_map_quotient [Fintype (InertiaClasses c)]
    (v : InertiaClasses c → ZMod 2) :
    parity_square_map M hinv rep v = ∑ d, v d •
      TauCeti.elementaryTwoQuotientMk (marked_square_column M hinv rep d) := by sorry
end LiftSquares

section InvolutionDegrees
variable {G : Type} [Group G] (c : Set G)
    (hgen : Subgroup.closure c = ⊤) (hinv : ∀ x ∈ c, x^2 = 1)
include hgen hinv in
lemma involution_abelianization (u : Additive (Abelianization G)) : 2 • u = 0 := by sorry
-- Use Mathlib's module construction with the existing additive group operations.
abbrev involution_abelianization_module : Module (ZMod 2) (Additive (Abelianization G)) :=
  AddCommGroup.zmodModule (involution_abelianization c hgen hinv)
def involution_parity_map [Fintype (InertiaClasses c)] :
    letI := involution_abelianization_module c hgen hinv
    (InertiaClasses c → ZMod 2) →ₗ[ZMod 2] Additive (Abelianization G) := by
  have := c
  sorry
lemma involution_parity_map_basis [Fintype (InertiaClasses c)] [DecidableEq (InertiaClasses c)]
    (x : c) :
    involution_parity_map c hgen hinv (Pi.single (inertia_class_mk c x) 1) =
      Additive.ofMul (Abelianization.of x.val) := by sorry
lemma involution_parity_map_surjective [Fintype (InertiaClasses c)] :
    Function.Surjective (involution_parity_map c hgen hinv) := by sorry
end InvolutionDegrees

section SquareChanges
variable {D A : Type} [Fintype D] [CommGroup A]
lemma square_obstruction_choice (y : A) (s : D → A) (m : D → ℤ)
    (a : A) (b : D → A) :
    square_obstruction (y*a^2) (fun d => s d * (b d)^2) m = square_obstruction y s m := by sorry
lemma torsion_image_filtration_exhaustive [Finite A] (e k : ℕ) (hk : Odd k)
    (hexp : ∀ a : A, a^(2^e*k) = 1) : torsion_image_filtration (A := A) e = ⊤ := by sorry
lemma torsion_image_filtration_cyclic (e : ℕ) (he : 0 < e) (t : ℕ) :
    torsion_image_filtration (A := Multiplicative (ZMod (2^e))) t =
      if t < e then ⊥ else ⊤ := by sorry
lemma two_adic_survival [Finite A] (b : A) (q : ℕ) (hq : 1 < q) (hodd : Odd q) :
    (∃ a : A, a^(q-1) = (b^((q-1)/2))⁻¹) ↔
      obstruction_threshold b + 1 ≤ (q-1).factorization 2 := by sorry
end SquareChanges

section ParityWeights
variable {D : Type} [Fintype D]
def parity_weight (v : D → ZMod 2) : ℕ := by
  classical
  exact (Finset.univ.filter (fun d => v d ≠ 0)).card
-- The input is a finite parity set, which is instantiated by the surviving affine coset.
def parity_weight_enumerator (C : Finset (D → ZMod 2)) (N₀ : ℕ) : Polynomial ℕ :=
  ∑ v ∈ C, Polynomial.X ^ parity_weight (v + fun _ => (N₀ : ZMod 2))
lemma parity_weight_enumerator_coefficient (C : Finset (D → ZMod 2)) (N₀ j : ℕ) :
    (parity_weight_enumerator C N₀).coeff j =
      (C.filter (fun v => parity_weight (v + fun _ => (N₀ : ZMod 2)) = j)).card := by sorry
lemma parity_weight_enumerator_at_one (C : Finset (D → ZMod 2)) (N₀ : ℕ) :
    (parity_weight_enumerator C N₀).eval 1 = C.card := by sorry
lemma parity_weight_enumerator_translation (C : Finset (D → ZMod 2)) (N₀ N₁ : ℕ) :
    parity_weight_enumerator C N₁ =
      ∑ v ∈ C, Polynomial.X ^ parity_weight
        (v + (fun _ => (N₀ : ZMod 2)) + fun _ => (((N₁ : ℤ)-(N₀ : ℤ)) : ZMod 2)) := by sorry
-- parity_weight_enumerator_test_1
example : parity_weight_enumerator ({(0 : Fin 0 → ZMod 2)} : Finset _) 0 = 1 := by sorry
-- parity_weight_enumerator_test_2
example : parity_weight_enumerator ({(0 : Fin 1 → ZMod 2)} : Finset _) 0 = 1 ∧
    parity_weight_enumerator ({(1 : Fin 1 → ZMod 2)} : Finset _) 0 = Polynomial.X := by sorry
-- parity_weight_enumerator_test_3
example : ({(0 : Fin 1 → ZMod 2)} : Finset _).card =
      ({(1 : Fin 1 → ZMod 2)} : Finset _).card ∧
    parity_weight_enumerator ({(0 : Fin 1 → ZMod 2)} : Finset _) 0 ≠
      parity_weight_enumerator ({(1 : Fin 1 → ZMod 2)} : Finset _) 0 := by sorry
end ParityWeights

section SplitProjection
variable {G H : Type} [Group G] [Group H]
-- Functoriality supplies the split-homology target before any primary-decomposition input.
lemma split_homology_surjection (ρ : G →* H) (s : H →* G)
    (hs : ρ.comp s = MonoidHom.id H) :
    Function.Surjective (integral_multiplier_map ρ) := by sorry
end SplitProjection

section CentralizerGenerators
variable {A E G : Type} [Group A] [Group E] [Group G]
def centralizer_commutator_hom (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a) (x : G) :
    Subgroup.centralizer ({x} : Set G) →* A := by sorry
lemma centralizer_commutator_hom_apply (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (x : G) (y : Subgroup.centralizer ({x} : Set G)) (hxy : Commute x y.val) :
    centralizer_commutator_hom S hc x y = lift_commutator S hc x y.val hxy := by sorry
lemma centralizer_generator_relations (S : GroupExtension A E G)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (c : Set G) (hclosed : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c)
    (rep : InertiaClasses c → c) (hrep : ∀ d, inertia_class_mk c (rep d) = d)
    (T : ∀ d : InertiaClasses c, Finset (Subgroup.centralizer ({(rep d).val} : Set G)))
    (hT : ∀ d, Subgroup.closure (T d : Set (Subgroup.centralizer ({(rep d).val} : Set G))) = ⊤) :
    Subgroup.closure {a : A | ∃ x ∈ c, ∃ y : G, ∃ hxy : Commute x y,
      a = lift_commutator S hc x y hxy} =
    Subgroup.closure {a : A | ∃ d : InertiaClasses c, ∃ y ∈ T d,
      a = centralizer_commutator_hom S hc (rep d).val y} := by sorry
end CentralizerGenerators

section DegreeOrbits
variable {B D : Type} [Group B]
-- The action parameter is the actual power-class permutation representation.
@[instance_reducible] def coordinate_lattice_action (ρ : B →* Equiv.Perm D) : MulAction B (D →₀ ℤ) where
  smul b m := degree_permutation (ρ b) m
  one_smul := by sorry
  mul_smul := by sorry
abbrev degree_orbit_set (ρ : B →* Equiv.Perm D) :=
  letI := coordinate_lattice_action ρ
  MulAction.orbitRel.Quotient B (D →₀ ℤ)
def degree_orbit_set_mk (ρ : B →* Equiv.Perm D) (m : D →₀ ℤ) : degree_orbit_set ρ :=
  letI := coordinate_lattice_action ρ
  Quotient.mk (MulAction.orbitRel B (D →₀ ℤ)) m
lemma degree_orbit_set_eq (ρ : B →* Equiv.Perm D) (m k : D →₀ ℤ) :
    degree_orbit_set_mk ρ m = degree_orbit_set_mk ρ k ↔
      ∃ b : B, k = degree_permutation (ρ b) m := by sorry
lemma degree_orbit_set_slice [Fintype D] (ρ : B →* Equiv.Perm D)
    (n M : ℕ) (b : B) :
    degree_orbit_set_mk ρ '' {m : D →₀ ℤ | (fun d => m d) ∈ bounded_degree_slice n M} =
    (fun m => degree_orbit_set_mk ρ (degree_permutation (ρ b) m)) ''
      {m : D →₀ ℤ | (fun d => m d) ∈ bounded_degree_slice n M} := by sorry
-- Relating the orbit to the actual evaluation of an equivariant twist.
lemma degree_orbit_set_generator_change {T : Type} [Torsor B T]
    (ρ : B →* Equiv.Perm D) :
    letI := coordinate_lattice_action ρ
    ∀ (f : cyclotomic_twist B T (D →₀ ℤ)) (t₀ t₁ : T),
      degree_orbit_set_mk ρ (f t₀) = degree_orbit_set_mk ρ (f t₁) := by sorry
-- degree_orbit_set_test_1
example (ρ : B →* Equiv.Perm (Fin 0)) : Subsingleton (degree_orbit_set ρ) := by sorry
-- C₃'s two nonidentity conjugacy classes have exactly this C₂ permutation action.
def two_class_power_permutation : Multiplicative (ZMod 2) →* Equiv.Perm (Fin 2) := by sorry
lemma two_class_power_permutation_nontrivial :
    two_class_power_permutation (Multiplicative.ofAdd 1) = Equiv.swap 0 1 := by sorry
-- degree_orbit_set_test_2
example : degree_orbit_set_mk two_class_power_permutation
    (Finsupp.single 0 1 + Finsupp.single 1 4) =
    degree_orbit_set_mk two_class_power_permutation
      (Finsupp.single 0 4 + Finsupp.single 1 1) := by sorry
-- degree_orbit_set_test_3
example : degree_orbit_set_mk two_class_power_permutation
    (Finsupp.single 0 1 + Finsupp.single 1 4) ≠
    degree_orbit_set_mk two_class_power_permutation
      (Finsupp.single 0 2 + Finsupp.single 1 3) := by sorry
end DegreeOrbits

section FixedCoordinateOrbits
variable {D : Type}
@[instance_reducible] def cyclic_coordinate_action (σ : Equiv.Perm D) : MulAction (Multiplicative ℤ) D where
  smul z d := (σ ^ Multiplicative.toAdd z) d
  one_smul := by sorry
  mul_smul := by sorry
abbrev PowerClassOrbits (σ : Equiv.Perm D) :=
  letI := cyclic_coordinate_action σ
  MulAction.orbitRel.Quotient (Multiplicative ℤ) D
def power_class_orbit_mk (σ : Equiv.Perm D) (d : D) : PowerClassOrbits σ :=
  letI := cyclic_coordinate_action σ
  Quotient.mk (MulAction.orbitRel (Multiplicative ℤ) D) d
def power_fixed_degree_orbits [Fintype D] (σ : Equiv.Perm D) :
    power_fixed_degree σ ≃+ (PowerClassOrbits σ → ℤ) := by sorry
lemma power_fixed_degree_orbits_apply [Fintype D] (σ : Equiv.Perm D)
    (m : power_fixed_degree σ) (d : D) :
    power_fixed_degree_orbits σ m (power_class_orbit_mk σ d) = m.val d := by sorry
lemma power_fixed_degree_weighted_sum [Fintype D] (σ : Equiv.Perm D)
    [Fintype (PowerClassOrbits σ)] (m : power_fixed_degree σ) :
    ∑ d, m.val d = ∑ O : PowerClassOrbits σ,
      (Nat.card {d : D // power_class_orbit_mk σ d = O} : ℤ) *
        power_fixed_degree_orbits σ m O := by sorry
end FixedCoordinateOrbits

section TwistedDegreeSlices
variable {B T X D : Type} [Group B] [Torsor B T] [MulAction B X]
    [Fintype D] [MulAction B (D → ℤ)]
-- Instantiate X with the actual projection kernel and deg with its equivariant degree map.
def bounded_degree_kernel_slice (deg : X →[B] (D → ℤ)) (n M : ℕ) : Set X :=
  deg ⁻¹' bounded_degree_slice n M
def bounded_degree_twisted_slice (deg : X →[B] (D → ℤ)) (n M : ℕ) :
    Set (cyclotomic_twist B T X) :=
  {f | ∀ t : T, f t ∈ bounded_degree_kernel_slice deg n M}
lemma bounded_degree_slice_preimage (deg : X →[B] (D → ℤ)) (n M : ℕ) :
    bounded_degree_twisted_slice (T := T) deg n M =
      cyclotomic_twist_map deg ⁻¹'
        {f : cyclotomic_twist B T (D → ℤ) | ∀ t : T, f t ∈ bounded_degree_slice n M} := by sorry
lemma bounded_degree_twisted_slice_evaluation (deg : X →[B] (D → ℤ)) (n M : ℕ)
    (hinv : ∀ b : B, ∀ m : D → ℤ,
      b • m ∈ bounded_degree_slice n M ↔ m ∈ bounded_degree_slice n M)
    (t₀ : T) (f : cyclotomic_twist B T X) :
    f ∈ bounded_degree_twisted_slice deg n M ↔
      cyclotomic_twist_evaluation t₀ f ∈ bounded_degree_kernel_slice deg n M := by sorry
end TwistedDegreeSlices

section MarkedActionComparisons
variable {A E G A' E' : Type} [CommGroup A] [Group E] [Group G]
    [CommGroup A'] [Group E'] {c : Set G}
    (M : marked_extension A E G c) (M' : marked_extension A' E' G c)
    (φ : E ≃* E') (hover : M'.extension.rightHom.comp φ.toMonoidHom = M.extension.rightHom)
def marked_coordinate_comparison :
    cover_fiber_product M.extension.rightHom c ≃*
      cover_fiber_product M'.extension.rightHom c := by
  have := hover
  sorry
lemma marked_coordinate_comparison_val (p : cover_fiber_product M.extension.rightHom c) :
    (marked_coordinate_comparison M M' φ hover p).val = (φ p.val.1, p.val.2) := by sorry
lemma discrete_action_marked_isomorphism (hmark : ∀ x : c, φ (M.marking x) = M'.marking x) (n : ℕ) (hn : 0 < n)
    (hE : ∀ e : E, e^n = 1) (hE' : ∀ e : E', e^n = 1) (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (α : (ZMod n)ˣ) (p : cover_fiber_product M.extension.rightHom c) :
    marked_coordinate_comparison M M' φ hover (discrete_action M n hn hE hG hpow α p) =
      discrete_action M' n hn hE' hG hpow α (marked_coordinate_comparison M M' φ hover p) := by
  have := hmark
  sorry
end MarkedActionComparisons

section FiniteLevel
variable {A E G : Type} [CommGroup A] [Group E] [Group G] [Finite G]
    {c : Set G} (M : marked_extension A E G c)
-- The finite reduced multiplier supplies hA by the integral transfer theorem.
-- This explicit assumption is essential for arbitrary marked central models.
lemma marked_cover_order_square_exponent (hA : ∀ a : A, a ^ Nat.card G = 1) (e : E) :
    e ^ (Nat.card G)^2 = 1 := by sorry
lemma finite_level_action (n : ℕ) (hn : 0 < n)
    (hE : ∀ e : E, e^n = 1) (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (hA : ∀ a : A, a ^ Nat.card G = 1) (α β : (ZMod n)ˣ)
    (hcongr : (α : ZMod n).val % (Nat.card G)^2 = (β : ZMod n).val % (Nat.card G)^2) :
    discrete_action M n hn hE hG hpow α = discrete_action M n hn hE hG hpow β := by sorry
end FiniteLevel

section DiscreteActionExamples
variable {G : Type} [Group G]
def identity_marked_extension (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :
    marked_extension (Multiplicative (ZMod 1)) G G c := by sorry
lemma identity_marked_extension_projection (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) :
    (identity_marked_extension c hc).extension.rightHom = MonoidHom.id G := by sorry
lemma identity_marked_extension_mark (c : Set G)
    (hc : ∀ g x : G, x ∈ c → g*x*g⁻¹ ∈ c) (x : c) :
    (identity_marked_extension c hc).marking x = x.val := by sorry
lemma c2_exponent_four : ∀ g : Multiplicative (ZMod 2), g^4 = 1 := by sorry
lemma c2_involution_power_closed : ∀ α : (ZMod 4)ˣ,
    ∀ x ∈ ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2))),
      finite_power 4 α x ∈ ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2))) := by sorry
-- discrete_action_test_2: this is the graph model of U(C₂,c) ≃ ℤ.
example (α : (ZMod 4)ˣ)
    (p : cover_fiber_product (identity_marked_extension
      {Multiplicative.ofAdd (1 : ZMod 2)} (comm_singleton_closed _)).extension.rightHom
      {Multiplicative.ofAdd (1 : ZMod 2)}) :
    discrete_action (identity_marked_extension {Multiplicative.ofAdd (1 : ZMod 2)}
      (comm_singleton_closed _)) 4 (by decide) c2_exponent_four c2_exponent_four
        c2_involution_power_closed α p = p := by sorry

def s3_transpositions : Set (Equiv.Perm (Fin 3)) := {g | orderOf g = 2}
lemma s3_transpositions_closed : ∀ g x : Equiv.Perm (Fin 3),
    x ∈ s3_transpositions → g*x*g⁻¹ ∈ s3_transpositions := by sorry
lemma s3_exponent_six : ∀ g : Equiv.Perm (Fin 3), g^6 = 1 := by sorry
lemma s3_transpositions_power_closed : ∀ α : (ZMod 6)ˣ, ∀ x ∈ s3_transpositions,
    finite_power 6 α x ∈ s3_transpositions := by sorry
-- discrete_action_test_3: nonmultiplicativity is tested on actual fiber-product elements.
example : ∃ p r : cover_fiber_product
    (identity_marked_extension s3_transpositions s3_transpositions_closed).extension.rightHom
    s3_transpositions,
    cover_fiber_projection _ s3_transpositions p = Equiv.swap 0 1 ∧
    cover_fiber_projection _ s3_transpositions r = Equiv.swap 1 2 ∧
    discrete_action (identity_marked_extension s3_transpositions s3_transpositions_closed)
      6 (by decide) s3_exponent_six s3_exponent_six s3_transpositions_power_closed (-1) (p*r) ≠
    discrete_action (identity_marked_extension s3_transpositions s3_transpositions_closed)
      6 (by decide) s3_exponent_six s3_exponent_six s3_transpositions_power_closed (-1) p *
    discrete_action (identity_marked_extension s3_transpositions s3_transpositions_closed)
      6 (by decide) s3_exponent_six s3_exponent_six s3_transpositions_power_closed (-1) r := by sorry
end DiscreteActionExamples

section ActualFixedFibers
variable {A E G : Type} [CommGroup A] [Group E] [Group G]
    {c : Set G} (M : marked_extension A E G c)
-- This fiber is a subset of the actual marked pullback, not a formal square equation.
def marked_degree_fiber (g : G) (m : InertiaClasses c →₀ ℤ) :
    Set (cover_fiber_product M.extension.rightHom c) :=
  {p | cover_fiber_projection M.extension.rightHom c p = g ∧
    Multiplicative.toAdd (cover_fiber_degree M.extension.rightHom c p) = m}
lemma square_obstruction_compatibility (g : G) (m : InertiaClasses c →₀ ℤ) :
    (marked_degree_fiber M g m).Nonempty ↔
      degree_to_abelianization c (Multiplicative.ofAdd m) = Abelianization.of g := by sorry
lemma marked_degree_fiber_incompatible (g : G) (m : InertiaClasses c →₀ ℤ)
    (h : degree_to_abelianization c (Multiplicative.ofAdd m) ≠ Abelianization.of g) :
    marked_degree_fiber M g m = ∅ := by sorry
-- square_obstruction_test_3: C₂'s odd marked class cannot occur with degree zero,
-- even though the identity cover has zero square obstruction.
example : marked_degree_fiber (identity_marked_extension
    {Multiplicative.ofAdd (1 : ZMod 2)} (comm_singleton_closed _))
    (Multiplicative.ofAdd (1 : ZMod 2)) 0 = ∅ := by sorry

variable (n : ℕ) (hn : 0 < n) (hE : ∀ e : E, e^n = 1) (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
def fixed_degree_fiber (α : (ZMod n)ˣ) (g : G) (m : InertiaClasses c →₀ ℤ) :
    Set (cover_fiber_product M.extension.rightHom c) :=
  {p | p ∈ marked_degree_fiber M g m ∧ discrete_action M n hn hE hG hpow α p = p}
lemma fixed_degree_fiber_inverse (α : (ZMod n)ˣ) (g : G) (m : InertiaClasses c →₀ ℤ) :
    fixed_degree_fiber M n hn hE hG hpow α⁻¹ g m =
      fixed_degree_fiber M n hn hE hG hpow α g m := by sorry

variable [Fintype (InertiaClasses c)] (hinv : ∀ x : c, x.val^2 = 1)
    (rep : InertiaClasses c → c) (hrep : ∀ d, inertia_class_mk c (rep d) = d)
    (g : G) (hg : g^2 = 1) (Y : E) (hY : M.extension.rightHom Y = g)
def fiber_square_representative (m : InertiaClasses c →₀ ℤ) : A :=
  involution_lift_square M.extension g hg Y hY *
    ∏ d, (marked_square_column M hinv rep d)^(-m d)
lemma fiber_square_class (m : InertiaClasses c →₀ ℤ) :
    TauCeti.elementaryTwoQuotientMk (fiber_square_representative M hinv rep g hg Y hY m) =
      square_obstruction (involution_lift_square M.extension g hg Y hY)
        (marked_square_column M hinv rep) (fun d => m d) := by sorry
-- q is a positive integer representative; no q<n assumption is needed.
lemma fixed_fiber_equation (q : ℕ) (hrep : ∀ d, inertia_class_mk c (rep d) = d)
    (hq : 1 < q) (hodd : Odd q) (hqn : Nat.Coprime q n)
    (m : InertiaClasses c →₀ ℤ) (h : A)
    (p : cover_fiber_product M.extension.rightHom c)
    (hp : p.val = (Y * M.extension.inl h, Multiplicative.ofAdd m)) :
    discrete_action M n hn hE hG hpow (ZMod.unitOfCoprime q hqn) p = p ↔
      h^(q-1) = (fiber_square_representative M hinv rep g hg Y hY m)^(-((q-1)/2 : ℤ)) := by
  have := hrep
  sorry
open scoped Classical in
include hrep in
lemma all_fixed_fibers [Finite A] (q : ℕ) (hq : 1 < q) (hodd : Odd q)
    (hqn : Nat.Coprime q n) (m : InertiaClasses c →₀ ℤ) :
    Nat.card {p // p ∈ fixed_degree_fiber M n hn hE hG hpow (ZMod.unitOfCoprime q hqn) g m} =
      if degree_to_abelianization c (Multiplicative.ofAdd m) = Abelianization.of g ∧
        (fiber_square_representative M hinv rep g hg Y hY m)^((q-1)/2) ∈
          (powMonoidHom (α := A) (q-1)).range
      then Nat.card (powMonoidHom (α := A) (q-1)).ker else 0 := by
  classical
  have := hrep
  sorry
include hinv rep hrep in
lemma odd_parity_fiber [Finite A] (q : ℕ) (hq : 1 < q) (hodd : Odd q)
    (hqn : Nat.Coprime q n) (x : c) (m : InertiaClasses c →₀ ℤ)
    (hm : ∀ d, Odd (m d) ↔ d = inertia_class_mk c x) :
    Nat.card {p // p ∈ fixed_degree_fiber M n hn hE hG hpow
      (ZMod.unitOfCoprime q hqn) x.val m} =
      Nat.card (powMonoidHom (α := A) (q-1)).ker := by
  have := hinv
  have := hrep
  sorry
include hinv rep hrep in
lemma even_parity_fiber [Finite A] (q : ℕ) (hq : 1 < q) (hodd : Odd q)
    (hqn : Nat.Coprime q n) (m : InertiaClasses c →₀ ℤ) (hm : ∀ d, Even (m d)) :
    Nat.card {p // p ∈ fixed_degree_fiber M n hn hE hG hpow
      (ZMod.unitOfCoprime q hqn) 1 m} =
      Nat.card (powMonoidHom (α := A) (q-1)).ker := by
  have := hinv
  have := hrep
  sorry
end ActualFixedFibers

section MarkingChangeAction
variable {A E G : Type} [CommGroup A] [Group E] [Group G] {c : Set G}
def class_central_factor (a : InertiaClasses c → A) :
    Multiplicative (InertiaClasses c →₀ ℤ) →* A := by sorry
lemma class_central_factor_apply (a : InertiaClasses c → A) (m : InertiaClasses c →₀ ℤ) :
    class_central_factor a (Multiplicative.ofAdd m) = m.prod (fun d z => (a d)^z) := by sorry
variable (M M' : marked_extension A E G c) (hext : M'.extension = M.extension)
    (a : InertiaClasses c → A)
    (ha : ∀ x : c, M'.marking x = M.marking x * M.extension.inl (a (inertia_class_mk c x)))
def marking_coordinate_comparison :
    cover_fiber_product M.extension.rightHom c ≃*
      cover_fiber_product M'.extension.rightHom c := by
  have := hext
  have := a
  sorry
lemma marking_coordinate_comparison_val (p : cover_fiber_product M.extension.rightHom c) :
    (marking_coordinate_comparison M M' hext a p).val =
      (p.val.1 * M.extension.inl (class_central_factor a p.val.2), p.val.2) := by sorry
include ha in
lemma discrete_action_choice (n : ℕ) (hn : 0 < n) (hE : ∀ e : E, e^n = 1)
    (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (α : (ZMod n)ˣ) (p : cover_fiber_product M.extension.rightHom c) :
    marking_coordinate_comparison M M' hext a (discrete_action M n hn hE hG hpow α p) =
      discrete_action M' n hn hE hG hpow α (marking_coordinate_comparison M M' hext a p) := by sorry
end MarkingChangeAction

section KernelDegreeAction
variable {A E G : Type} [CommGroup A] [Group E] [Group G] {c : Set G}
    (M : marked_extension A E G c) (n : ℕ) (hn : 0 < n)
    (hE : ∀ e : E, e^n = 1) (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
def power_class_representation : (ZMod n)ˣ →* Equiv.Perm (InertiaClasses c) where
  toFun := power_class_permutation c n hn hG hpow
  map_one' := by sorry
  map_mul' := by sorry
@[instance_reducible] def kernel_power_action :
    MulAction (ZMod n)ˣ (cover_fiber_projection M.extension.rightHom c).ker where
  smul α k := kernel_action_aut M n hn hE hG hpow α k
  one_smul := by sorry
  mul_smul := by sorry
@[instance_reducible] def coordinate_function_action {B D : Type} [Group B]
    (ρ : B →* Equiv.Perm D) : MulAction B (D → ℤ) where
  smul b m := fun d => m ((ρ b).symm d)
  one_smul := by sorry
  mul_smul := by sorry
def kernel_degree_equivariant :
    letI := kernel_power_action M n hn hE hG hpow
    letI := coordinate_function_action (power_class_representation n hn hG hpow)
    (cover_fiber_projection M.extension.rightHom c).ker →[(ZMod n)ˣ] (InertiaClasses c → ℤ) := by
  letI := kernel_power_action M n hn hE hG hpow
  letI := coordinate_function_action (power_class_representation n hn hG hpow)
  exact {
    toFun := fun k d => Multiplicative.toAdd (cover_fiber_degree M.extension.rightHom c k.val) d
    map_smul' := by sorry }
end KernelDegreeAction

section ThreeCycleClassAction
abbrev C3 := Multiplicative (ZMod 3)
def c3_nonidentity : Set C3 := {x | x ≠ 1}
lemma c3_exponent : ∀ x : C3, x^3 = 1 := by sorry
lemma c3_power_closed : ∀ α : (ZMod 3)ˣ, ∀ x ∈ c3_nonidentity,
    finite_power 3 α x ∈ c3_nonidentity := by sorry
def c3_class_equiv : InertiaClasses c3_nonidentity ≃ Fin 2 := by sorry
lemma c3_class_equiv_generator :
    c3_class_equiv (inertia_class_mk c3_nonidentity
      ⟨Multiplicative.ofAdd 1, by change (1 : ZMod 3) ≠ 0; decide⟩) = 0 := by sorry
lemma c3_class_equiv_inverse :
    c3_class_equiv (inertia_class_mk c3_nonidentity
      ⟨Multiplicative.ofAdd 2, by change (2 : ZMod 3) ≠ 0; decide⟩) = 1 := by sorry
def c3_units_equiv : (ZMod 3)ˣ ≃* Multiplicative (ZMod 2) := by sorry
lemma c3_units_equiv_inverse : c3_units_equiv (-1) = Multiplicative.ofAdd 1 := by sorry
-- Thus the two-class orbit tests above are the actual C₃ power action in these coordinates.
lemma c3_power_coordinate (α : (ZMod 3)ˣ) :
    two_class_power_permutation (c3_units_equiv α) =
      (c3_class_equiv.symm.trans
        (power_class_permutation c3_nonidentity 3 (by decide) c3_exponent c3_power_closed α)).trans
        c3_class_equiv := by sorry
end ThreeCycleClassAction

section SignatureParityFibers
variable {A E G : Type} [CommGroup A] [Group E] [Group G]
    {c : Set G} [Fintype (InertiaClasses c)]
    (M : marked_extension A E G c) (hgen : Subgroup.closure c = ⊤)
    (hinv : ∀ x : c, x.val^2 = 1)
    (rep : InertiaClasses c → c) (hrep : ∀ d, inertia_class_mk c (rep d) = d)

-- none denotes the identity signature; some x denotes the signature of x ∈ c.
def signature_element (x : Option c) : G := x.elim 1 Subtype.val
def signature_lift (x : Option c) : E := x.elim 1 M.marking
include hinv in
lemma signature_involution (x : Option c) : (signature_element x)^2 = 1 := by
  have := hinv
  sorry
lemma signature_lift_over (x : Option c) :
    M.extension.rightHom (signature_lift M x) = signature_element x := by sorry
def signature_parity (x : Option c) : InertiaClasses c → ZMod 2 := by
  classical
  exact x.elim 0 (fun y => Pi.single (inertia_class_mk c y) 1)
def degree_parity (m : InertiaClasses c →₀ ℤ) : InertiaClasses c → ZMod 2 :=
  fun d => (m d : ZMod 2)
def signature_square (x : Option c) : A :=
  involution_lift_square M.extension (signature_element x) (signature_involution hinv x)
    (signature_lift M x) (signature_lift_over M x)
lemma signature_square_identity : signature_square M hinv none = 1 := by sorry
include hrep in
lemma signature_square_marked (x : c) :
    TauCeti.elementaryTwoQuotientMk (signature_square M hinv (some x)) =
      TauCeti.elementaryTwoQuotientMk (marked_square_column M hinv rep
        (inertia_class_mk c x)) := by
  have := hrep
  sorry

-- A joint map built from the actual class images and the actual extension's squares.
def signature_joint_map (t : ℕ) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    (InertiaClasses c → ZMod 2) →ₗ[ZMod 2]
      Additive (Abelianization G) ×
        (TauCeti.ElementaryTwoQuotient A ⧸ torsion_image_filtration (A := A) t) := by
  letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
  exact joint_parity_map (involution_parity_map c hgen (fun x hx => hinv ⟨x, hx⟩))
    (parity_square_map M hinv rep) (torsion_image_filtration (A := A) t)

include hrep in
theorem affine_compatible_parities (x : Option c) (m : InertiaClasses c →₀ ℤ) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    (degree_to_abelianization c (Multiplicative.ofAdd m) =
        Abelianization.of (signature_element x) ↔
      degree_parity m + signature_parity x ∈
        LinearMap.ker (involution_parity_map c hgen (fun y hy => hinv ⟨y, hy⟩))) ∧
    square_obstruction (signature_square M hinv x) (marked_square_column M hinv rep)
        (fun d => m d) =
      parity_square_map M hinv rep (degree_parity m + signature_parity x) := by
  have := hrep
  sorry

-- parity_square_map_test_1 tests both maps on the same native parity space.
example : involution_parity_map c hgen (fun x hx => hinv ⟨x, hx⟩) 0 = 0 ∧
    parity_square_map M hinv rep 0 = 0 := by sorry

variable [Finite A] (n : ℕ) (hn : 0 < n)
    (hE : ∀ e : E, e^n = 1) (hG : ∀ g : G, g^n = 1)
    (hpow : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)

include hrep in
lemma actual_two_adic_survival (q : ℕ) (hq : 1 < q) (hodd : Odd q)
    (hqn : Nat.Coprime q n) (x : Option c) (m : InertiaClasses c →₀ ℤ) :
    (fixed_degree_fiber M n hn hE hG hpow (ZMod.unitOfCoprime q hqn)
      (signature_element x) m).Nonempty ↔
    degree_to_abelianization c (Multiplicative.ofAdd m) =
        Abelianization.of (signature_element x) ∧
      obstruction_threshold (fiber_square_representative M hinv rep
        (signature_element x) (signature_involution hinv x)
        (signature_lift M x) (signature_lift_over M x) m) + 1 ≤
          (q-1).factorization 2 := by
  have := hrep
  sorry

include hrep in
theorem surviving_parities (q : ℕ) (hq : 1 < q) (hodd : Odd q)
    (hqn : Nat.Coprime q n) (t : ℕ) (ht : (q-1).factorization 2 = t+1)
    (x : Option c) (m : InertiaClasses c →₀ ℤ) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    ((fixed_degree_fiber M n hn hE hG hpow (ZMod.unitOfCoprime q hqn)
        (signature_element x) m).Nonempty ↔
      degree_parity m + signature_parity x ∈
        LinearMap.ker (signature_joint_map M hgen hinv rep t)) ∧
    (degree_parity m + signature_parity x ∈
        LinearMap.ker (signature_joint_map M hgen hinv rep t) →
      Nat.card {p // p ∈ fixed_degree_fiber M n hn hE hG hpow
        (ZMod.unitOfCoprime q hqn) (signature_element x) m} =
          Nat.card (powMonoidHom (α := A) (q-1)).ker) := by
  have := hrep
  sorry

lemma signature_rank_parity_count (t : ℕ) (x : Option c) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    Nat.card {v : InertiaClasses c → ZMod 2 // v + signature_parity x ∈
      LinearMap.ker (signature_joint_map M hgen hinv rep t)} =
    2 ^ (Fintype.card (InertiaClasses c) - Module.finrank (ZMod 2)
      (LinearMap.range (signature_joint_map M hgen hinv rep t))) := by sorry

lemma signature_parity_count_equal (t : ℕ) (x y : Option c) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    Nat.card {v : InertiaClasses c → ZMod 2 // v + signature_parity x ∈
      LinearMap.ker (signature_joint_map M hgen hinv rep t)} =
    Nat.card {v : InertiaClasses c → ZMod 2 // v + signature_parity y ∈
      LinearMap.ker (signature_joint_map M hgen hinv rep t)} := by sorry

include hrep in
lemma signature_threshold_exact (t : ℕ) (x : Option c) (m : InertiaClasses c →₀ ℤ) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    (degree_to_abelianization c (Multiplicative.ofAdd m) =
        Abelianization.of (signature_element x) ∧
      obstruction_threshold (fiber_square_representative M hinv rep
        (signature_element x) (signature_involution hinv x)
        (signature_lift M x) (signature_lift_over M x) m) = t) ↔
    degree_parity m + signature_parity x ∈
        LinearMap.ker (signature_joint_map M hgen hinv rep t) ∧
      (t = 0 ∨ degree_parity m + signature_parity x ∉
        LinearMap.ker (signature_joint_map M hgen hinv rep (t-1))) := by
  have := hrep
  sorry

-- The previous kernel is excluded only for positive thresholds: K_{-1}=0.
lemma signature_threshold_histogram (t : ℕ) (x : Option c) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    Nat.card {v : InertiaClasses c → ZMod 2 //
      v + signature_parity x ∈ LinearMap.ker (signature_joint_map M hgen hinv rep t) ∧
      (t = 0 ∨ v + signature_parity x ∉
        LinearMap.ker (signature_joint_map M hgen hinv rep (t-1)))} =
    2 ^ (Fintype.card (InertiaClasses c) - Module.finrank (ZMod 2)
        (LinearMap.range (signature_joint_map M hgen hinv rep t))) -
      if t = 0 then 0 else
        2 ^ (Fintype.card (InertiaClasses c) - Module.finrank (ZMod 2)
          (LinearMap.range (signature_joint_map M hgen hinv rep (t-1)))) := by sorry

include hrep in
theorem independent_classes
    (hind : letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
      LinearIndependent (ZMod 2)
      (fun d => Additive.ofMul (Abelianization.of (rep d).val))) :
    letI := involution_abelianization_module c hgen (fun x hx => hinv ⟨x, hx⟩)
    Function.Bijective (involution_parity_map c hgen (fun x hx => hinv ⟨x, hx⟩)) ∧
    (∀ (x : Option c) (m : InertiaClasses c →₀ ℤ),
      (degree_to_abelianization c (Multiplicative.ofAdd m) =
          Abelianization.of (signature_element x) ↔ degree_parity m = signature_parity x) ∧
      (degree_parity m = signature_parity x →
        square_obstruction (signature_square M hinv x) (marked_square_column M hinv rep)
          (fun d => m d) = 0)) ∧
    (∀ (q : ℕ) (hq : 1 < q) (hodd : Odd q) (hqn : Nat.Coprime q n)
        (x : Option c) (m : InertiaClasses c →₀ ℤ),
      degree_parity m = signature_parity x →
        (fixed_degree_fiber M n hn hE hG hpow (ZMod.unitOfCoprime q hqn)
          (signature_element x) m).Nonempty ∧
        Nat.card {p // p ∈ fixed_degree_fiber M n hn hE hG hpow
          (ZMod.unitOfCoprime q hqn) (signature_element x) m} =
            Nat.card (powMonoidHom (α := A) (q-1)).ker) := by
  have := hind
  have := hrep
  sorry
end SignatureParityFibers

section ParitySquareExamples
local instance : Fintype (InertiaClasses s3_transpositions) := Fintype.ofFinite _
lemma s3_transpositions_generate : Subgroup.closure s3_transpositions = ⊤ := by sorry
lemma s3_transpositions_involutions (x : s3_transpositions) : x.val^2 = 1 := by sorry
local instance : Module (ZMod 2) (Additive (Abelianization (Equiv.Perm (Fin 3)))) :=
  involution_abelianization_module s3_transpositions s3_transpositions_generate
    (fun x hx => s3_transpositions_involutions ⟨x, hx⟩)
-- parity_square_map_test_2: the actual S₃ maps, after identifying their coordinates.
example (rep : InertiaClasses s3_transpositions → s3_transpositions)
    (hrep : ∀ d, inertia_class_mk s3_transpositions (rep d) = d) :
    ∃ e : InertiaClasses s3_transpositions ≃ Fin 1,
    ∃ eab : Additive (Abelianization (Equiv.Perm (Fin 3))) ≃+ ZMod 2,
    Subsingleton (TauCeti.ElementaryTwoQuotient (Multiplicative (ZMod 1))) ∧
    ∀ v : InertiaClasses s3_transpositions → ZMod 2,
      eab (involution_parity_map s3_transpositions s3_transpositions_generate
        (fun x hx => s3_transpositions_involutions ⟨x, hx⟩) v) = v (e.symm 0) ∧
      parity_square_map (identity_marked_extension s3_transpositions s3_transpositions_closed)
        s3_transpositions_involutions rep v = 0 := by
  have := hrep
  sorry
end ParitySquareExamples

section RepeatedClassImages
variable {G : Type} [Group G] {c : Set G} [Fintype (InertiaClasses c)]
    [DecidableEq (InertiaClasses c)] (hgen : Subgroup.closure c = ⊤)
    (hinv : ∀ x ∈ c, x^2 = 1) (x y : c)
-- parity_square_map_test_3: distinct class coordinates need not be independent.
example (hclass : inertia_class_mk c x ≠ inertia_class_mk c y)
    (hab : Abelianization.of x.val = Abelianization.of y.val) :
    involution_parity_map c hgen hinv
      (Pi.single (inertia_class_mk c x) 1 + Pi.single (inertia_class_mk c y) 1) = 0 ∧
    (Pi.single (inertia_class_mk c x) 1 + Pi.single (inertia_class_mk c y) 1 :
      InertiaClasses c → ZMod 2) ≠ 0 := by
  have := hclass
  have := hab
  sorry
end RepeatedClassImages

section DistinctInvolutionClassesExample
-- In S₆ a transposition and three disjoint transpositions are distinct classes
-- with the same nonzero abelianized image. This realizes the preceding test.
def s6_involutions : Set (Equiv.Perm (Fin 6)) := {g | orderOf g = 2}
lemma s6_involutions_generate : Subgroup.closure s6_involutions = ⊤ := by sorry
lemma s6_involutions_square (x : Equiv.Perm (Fin 6)) (hx : x ∈ s6_involutions) :
    x^2 = 1 := by sorry
local instance : Fintype (InertiaClasses s6_involutions) := Fintype.ofFinite _
local instance : DecidableEq (InertiaClasses s6_involutions) := Classical.decEq _
def s6_single_transposition : s6_involutions := ⟨Equiv.swap 0 1, by sorry⟩
def s6_triple_transposition : s6_involutions :=
  ⟨Equiv.swap 0 1 * Equiv.swap 2 3 * Equiv.swap 4 5, by sorry⟩
example :
    inertia_class_mk s6_involutions s6_single_transposition ≠
        inertia_class_mk s6_involutions s6_triple_transposition ∧
    Abelianization.of s6_single_transposition.val =
        Abelianization.of s6_triple_transposition.val ∧
    involution_parity_map s6_involutions s6_involutions_generate s6_involutions_square
      (Pi.single (inertia_class_mk s6_involutions s6_single_transposition) 1 +
        Pi.single (inertia_class_mk s6_involutions s6_triple_transposition) 1) = 0 ∧
    (Pi.single (inertia_class_mk s6_involutions s6_single_transposition) 1 +
      Pi.single (inertia_class_mk s6_involutions s6_triple_transposition) 1 :
      InertiaClasses s6_involutions → ZMod 2) ≠ 0 := by sorry
end DistinctInvolutionClassesExample

/-! ## RS.5: native semidirect-product interfaces -/

section FiniteIntegralHomologyContract
-- These are consequences of existing transfer and finite integral bar chains,
-- not a second construction of transfer. The supplier remains to be assigned.
lemma integral_homology_finite (G : Type) [Group G] [Finite G] (n : ℕ) :
    Finite (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by sorry

lemma integral_homology_card_smul (G : Type) [Group G] [Finite G] (n : ℕ)
    (z : groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) :
    (Nat.card G) • z = 0 := by sorry

-- finite_integral_homology_test_1: the trivial group has no positive homology.
example (G : Type) [Group G] [Subsingleton G] (n : ℕ) :
    Subsingleton (groupHomology (Rep.trivial ℤ G ℤ) (n + 1)) := by sorry

-- finite_integral_homology_test_2: cyclic positive homology distinguishes parity.
example (n : ℕ) :
    Nat.card (groupHomology (Rep.trivial ℤ Two ℤ) (2 * n + 1)) = 2 ∧
    Subsingleton (groupHomology (Rep.trivial ℤ Two ℤ) (2 * (n + 1))) := by sorry

-- finite_integral_homology_test_3: degree zero is infinite and not order-annihilated.
example :
    Infinite (groupHomology.H0 (Rep.trivial ℤ Two ℤ)) ∧
    (2 : ℕ) • groupHomology.H0π (Rep.trivial ℤ Two ℤ) (1 : ℤ) ≠ 0 := by sorry
end FiniteIntegralHomologyContract

section CoprimeEdgeContract
variable {H Γ : Type} [Group H] [Group Γ] [Finite H] [Finite Γ]
lemma coprime_degree_two_edge (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ))
    (ρ : Representation ℤ Γ (IntegralMultiplier H))
    (hρ : ∀ γ z, ρ γ z = integral_multiplier_map (φ γ).toMonoidHom z) :
    ∃ e : Representation.Coinvariants ρ ≃+
      (integral_multiplier_map (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)).ker,
      ∀ z, (e (Representation.Coinvariants.mk ρ z)).val =
        integral_multiplier_map (SemidirectProduct.inl : H →* H ⋊[φ] Γ) z := by sorry
lemma cyclic_coprime_complement_conjugacy [IsCyclic Γ]
    (φ : Γ →* MulAut H) (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ))
    (K : Subgroup (H ⋊[φ] Γ))
    (hK : Function.Bijective
      ((SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ).comp K.subtype)) :
    ∃ h : H, ∀ g : K, g.val = SemidirectProduct.inl h *
      SemidirectProduct.inr g.val.right * (SemidirectProduct.inl h)⁻¹ := by sorry
end CoprimeEdgeContract

section CoprimeEdgeTests
-- coprime_degree_two_edge_test_1: a trivial quotient retains the inclusion map.
example {H Γ : Type} [Group H] [Group Γ] [Finite H] [Subsingleton Γ]
    (φ : Γ →* MulAut H) :
    Function.Bijective
      (integral_multiplier_map (SemidirectProduct.inl : H →* H ⋊[φ] Γ)) := by sorry

-- coprime_degree_two_edge_test_2: inversion on C₃² acts trivially on its exterior square.
example (φ : Two →* MulAut (C3 × C3))
    (hφ : ∀ t : Two, ∀ h : C3 × C3, φ t h = if t = 1 then h else h⁻¹) :
    (∀ t : Two, integral_multiplier_map (φ t).toMonoidHom =
      AddMonoidHom.id (IntegralMultiplier (C3 × C3))) ∧
    Function.Bijective (integral_multiplier_map
      (SemidirectProduct.inl : C3 × C3 →* (C3 × C3) ⋊[φ] Two)) ∧
    Nat.card (IntegralMultiplier ((C3 × C3) ⋊[φ] Two)) = 3 := by sorry

-- coprime_degree_two_edge_test_3: a shared prime contributes a mixed product class.
example :
    let φ : Two →* MulAut Two := 1
    Nat.card (IntegralMultiplier (Two ⋊[φ] Two)) = 2 ∧
    Nat.card (integral_multiplier_map
      (SemidirectProduct.rightHom : Two ⋊[φ] Two →* Two)).ker = 2 ∧
    ¬ Function.Surjective (integral_multiplier_map
      (SemidirectProduct.inl : Two →* Two ⋊[φ] Two)) := by sorry
end CoprimeEdgeTests

section ComplementConjugacyTests
-- extension_five_term_test_4: a split noncentral kernel can vanish in abelianization.
example (φ₃ : Two →* MulAut C3)
    (hφ₃ : ∀ t : Two, ∀ h : C3, φ₃ t h = if t = 1 then h else h⁻¹) :
    let S := SemidirectProduct.toGroupExtension φ₃
    Nonempty S.Splitting ∧
    (∃ a : C3, ∃ e : C3 ⋊[φ₃] Two, S.inl a * e ≠ e * S.inl a) ∧
    (Abelianization.of.comp S.inl).toAdditive = 0 ∧
    ¬ Function.Injective (Abelianization.of.comp S.inl).toAdditive ∧
    Function.Bijective (Abelianization.map S.rightHom).toAdditive := by sorry

-- cyclic_complement_conjugacy_test_1: a trivial quotient has only the trivial complement.
example {H Γ : Type} [Group H] [Group Γ] [Finite H] [Finite Γ] [Subsingleton Γ]
    (φ : Γ →* MulAut H) (K : Subgroup (H ⋊[φ] Γ))
    (hK : Function.Bijective
      ((SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ).comp K.subtype)) :
    K = ⊥ := by sorry

-- cyclic_complement_conjugacy_test_2: inversion on C₃ fixes the conjugator's orientation.
example (φ₃ : Two →* MulAut C3)
    (hφ₃ : ∀ t : Two, ∀ h : C3, φ₃ t h = if t = 1 then h else h⁻¹) :
    let a : C3 := Multiplicative.ofAdd (1 : ZMod 3)
    let t : Two := Multiplicative.ofAdd (1 : ZMod 2)
    let x : C3 ⋊[φ₃] Two := SemidirectProduct.inl a * SemidirectProduct.inr t
    let K := Subgroup.zpowers x
    Function.Bijective
      ((SemidirectProduct.rightHom : C3 ⋊[φ₃] Two →* Two).comp K.subtype) ∧
    (∀ g : K, g.val = SemidirectProduct.inl a⁻¹ *
      SemidirectProduct.inr g.val.right * (SemidirectProduct.inl a⁻¹)⁻¹) ∧
    SemidirectProduct.inl a * SemidirectProduct.inr t *
      (SemidirectProduct.inl a)⁻¹ ≠ x := by sorry

-- cyclic_complement_conjugacy_test_3: the diagonal in C₂ × C₂ needs coprimality.
example :
    let φ : Two →* MulAut Two := 1
    let a : Two := Multiplicative.ofAdd (1 : ZMod 2)
    let x : Two ⋊[φ] Two := SemidirectProduct.inl a * SemidirectProduct.inr a
    let K := Subgroup.zpowers x
    Function.Bijective
      ((SemidirectProduct.rightHom : Two ⋊[φ] Two →* Two).comp K.subtype) ∧
    ¬ (∃ h : Two, ∀ g : K, g.val = SemidirectProduct.inl h *
      SemidirectProduct.inr g.val.right * (SemidirectProduct.inl h)⁻¹) := by sorry
end ComplementConjugacyTests

section CoprimePrimarySupport
variable {H Γ : Type} [Group H] [Group Γ]

-- Use the existing primary component even when its parameter is composite:
-- it consists of the elements killed by some power of that parameter.
abbrev multiplier_primary_part (G : Type) [Group G] (n : ℕ) :=
  AddCommGroup.primaryComponent (IntegralMultiplier G) n

lemma multiplier_primary_support [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    Finite (IntegralMultiplier (H ⋊[φ] Γ)) ∧
    (∀ z : IntegralMultiplier (H ⋊[φ] Γ),
      (Nat.card (H ⋊[φ] Γ)) • z = 0) ∧
    ∃ e : IntegralMultiplier (H ⋊[φ] Γ) ≃+
      multiplier_primary_part (H ⋊[φ] Γ) (Nat.card H) ×
        multiplier_primary_part (H ⋊[φ] Γ) (Nat.card Γ),
      ∀ z, ((e z).1 : IntegralMultiplier (H ⋊[φ] Γ)) +
        ((e z).2 : IntegralMultiplier (H ⋊[φ] Γ)) = z := by sorry

lemma multiplier_kernel_primary [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    (integral_multiplier_map
      (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)).ker =
        multiplier_primary_part (H ⋊[φ] Γ) (Nat.card H) ∧
    Nat.Coprime
      (Nat.card (integral_multiplier_map
        (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)).ker) (Nat.card Γ) := by sorry
end CoprimePrimarySupport

section CoprimeCentralSplittings
variable {A E H : Type} [CommGroup A] [Group E] [Group H]

-- These statements concern an actual native extension; no unspecified
-- proposition stands in for centrality or for a splitting.
lemma central_coprime_splitting [Finite A] [Finite H] (S : GroupExtension A E H)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (hcop : Nat.Coprime (Nat.card A) (Nat.card H)) :
    Nonempty S.Splitting ∧ Subsingleton S.Splitting := by sorry

lemma central_coprime_splitting_product [Finite A] [Finite H] (S : GroupExtension A E H)
    (hc : ∀ a : A, ∀ e : E, S.inl a * e = e * S.inl a)
    (hcop : Nat.Coprime (Nat.card A) (Nat.card H)) (s : S.Splitting) :
    ∃ e : A × H ≃* E, ∀ a h, e (a, h) = S.inl a * s h := by sorry
end CoprimeCentralSplittings

section AdmissibleInertia
variable {H Γ : Type} [Group H] [Group Γ]

-- Admissibility is displayed at each theorem. This helper is only its
-- generating set, with the action and multiplication taken from Mathlib.
def admissible_generators (φ : Γ →* MulAut H) : Set H :=
  {a | ∃ h : H, ∃ γ : Γ, a = h⁻¹ * φ γ h}

def admissible_inertia_set (φ : Γ →* MulAut H) : Set (H ⋊[φ] Γ) :=
  {g | g ≠ 1 ∧ orderOf g = orderOf g.right}

def admissible_class_map (φ : Γ →* MulAut H) :
    InertiaClasses (admissible_inertia_set φ) → InertiaClasses ({γ : Γ | γ ≠ 1}) := by
  sorry

lemma admissible_class_map_mk (φ : Γ →* MulAut H)
    (g : admissible_inertia_set φ) :
    ∃ hγ : g.val.right ≠ 1,
      admissible_class_map φ (inertia_class_mk (admissible_inertia_set φ) g) =
        inertia_class_mk ({γ : Γ | γ ≠ 1}) ⟨g.val.right, hγ⟩ := by sorry

lemma admissible_inertia_closed (φ : Γ →* MulAut H)
    (a g : H ⋊[φ] Γ) (hg : g ∈ admissible_inertia_set φ) :
    a * g * a⁻¹ ∈ admissible_inertia_set φ := by sorry

lemma admissible_inertia_power (φ : Γ →* MulAut H)
    (g : H ⋊[φ] Γ) (hg : g ∈ admissible_inertia_set φ) (n : ℕ)
    (hcop : Nat.Coprime n (orderOf g)) : g ^ n ∈ admissible_inertia_set φ := by sorry

lemma admissible_inertia_classes [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ))
    (hadm : Subgroup.closure (admissible_generators φ) = ⊤) :
    Subgroup.closure (admissible_inertia_set φ) = ⊤ ∧
    Function.Bijective (admissible_class_map φ) := by sorry

-- The conjugacy clause is the explicit contract needed from the owner of
-- coprime cyclic complement conjugacy; it is not complement existence.
lemma admissible_inertia_cyclic_conjugacy [Finite H] [Finite Γ]
    (φ : Γ →* MulAut H) (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ))
    (g : H ⋊[φ] Γ) (hg : orderOf g = orderOf g.right) :
    ∃ h : H, g = SemidirectProduct.inl h *
      SemidirectProduct.inr g.right * (SemidirectProduct.inl h)⁻¹ := by sorry

lemma admissible_abelianization (φ : Γ →* MulAut H)
    (hadm : Subgroup.closure (admissible_generators φ) = ⊤) :
    Function.Bijective (Abelianization.map
      (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)) := by sorry

def admissible_class_lattice_map (φ : Γ →* MulAut H) :
    (InertiaClasses (admissible_inertia_set φ) →₀ ℤ) →+
      (InertiaClasses ({γ : Γ | γ ≠ 1}) →₀ ℤ) := by sorry

lemma admissible_class_lattice_map_basis (φ : Γ →* MulAut H)
    (d : InertiaClasses (admissible_inertia_set φ)) :
    admissible_class_lattice_map φ (Finsupp.single d 1) =
      Finsupp.single (admissible_class_map φ d) 1 := by sorry

lemma admissible_class_degree_compatible (φ : Γ →* MulAut H)
    (m : InertiaClasses (admissible_inertia_set φ) →₀ ℤ) :
    (class_degree_map ({γ : Γ | γ ≠ 1})) (admissible_class_lattice_map φ m) =
      (Abelianization.map (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)).toAdditive
        (class_degree_map (admissible_inertia_set φ) m) := by sorry

-- Surjectivity of the relation map only needs a split projection whose
-- section carries the lower marked subset into the upper one.
lemma relations_surjection {G K : Type} [Group G] [Group K]
    (ρ : G →* K) (s : K →* G) (hs : ρ.comp s = MonoidHom.id K)
    (c : Set G) (d : Set K) (hcd : Set.MapsTo ρ c d)
    (hdc : Set.MapsTo s d c) :
    (schur_relations c).map (integral_multiplier_map ρ) = schur_relations d := by sorry

lemma admissible_relations_surjection (φ : Γ →* MulAut H) :
    (schur_relations (admissible_inertia_set φ)).map
      (integral_multiplier_map (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)) =
        schur_relations ({γ : Γ | γ ≠ 1}) := by sorry

lemma admissible_inertia_maps_to (φ : Γ →* MulAut H) :
    Set.MapsTo (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)
      (admissible_inertia_set φ) ({γ : Γ | γ ≠ 1}) := by sorry

lemma reduced_kernel_primary [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    Function.Surjective
      (reduced_multiplier_map (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)
        (admissible_inertia_set φ) ({γ : Γ | γ ≠ 1}) (admissible_inertia_maps_to φ)) ∧
    Nat.Coprime
      (Nat.card (reduced_multiplier_map (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)
        (admissible_inertia_set φ) ({γ : Γ | γ ≠ 1})
        (admissible_inertia_maps_to φ)).ker) (Nat.card Γ) := by sorry

lemma reduced_kernel_primary_quotient [Finite H] [Finite Γ] (φ : Γ →* MulAut H)
    (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    ∃ k : multiplier_primary_part (H ⋊[φ] Γ) (Nat.card H) →+
      (reduced_multiplier_map (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)
        (admissible_inertia_set φ) ({γ : Γ | γ ≠ 1}) (admissible_inertia_maps_to φ)).ker,
      Function.Surjective k ∧ ∀ z,
        (k z).val = (QuotientAddGroup.mk z.val :
          reduced_multiplier (admissible_inertia_set φ)) := by sorry
end AdmissibleInertia

section HallPreimages
variable {S A : Type} [Group S] [Group A]

-- In the cover application P is the preimage of H and θ is the projection
-- to M_Γ obtained from the unique central splitting after dividing by M_H.
lemma hall_preimage_normal [Finite S] [Finite A] (P : Subgroup S) [P.Normal]
    (θ : P →* A) (hθ : Function.Surjective θ)
    (hcop : Nat.Coprime (Nat.card θ.ker) (Nat.card A)) :
    θ.ker.Characteristic ∧ (θ.ker.map P.subtype).Normal ∧
      Nat.card (θ.ker.map P.subtype) = Nat.card θ.ker := by sorry

lemma hall_preimage_order [Finite S] [Finite A] (P : Subgroup S) (θ : P →* A)
    (hθ : Function.Surjective θ) :
    Nat.card P = Nat.card θ.ker * Nat.card A := by sorry
end HallPreimages

section CompatiblePowerCorrections
variable {A E G B F K : Type} [CommGroup A] [Group E] [Group G]
    [CommGroup B] [Group F] [Group K] {c : Set G} {d : Set K}
    (M : marked_extension A E G c) (N : marked_extension B F K d)
    (a : A →* B) (e : E →* F) (ρ : G →* K) (hcd : Set.MapsTo ρ c d)
    (hinl : e.comp M.extension.inl = N.extension.inl.comp a)
    (hover : N.extension.rightHom.comp e = ρ.comp M.extension.rightHom)
    (hmark : ∀ x : c, e (M.marking x) = N.marking ⟨ρ x.val, hcd x.property⟩)

def inertia_class_pushforward : InertiaClasses c → InertiaClasses d := by
  have := ρ
  have := hcd
  sorry
lemma inertia_class_pushforward_mk (x : c) :
    inertia_class_pushforward ρ hcd (inertia_class_mk c x) =
      inertia_class_mk d ⟨ρ x.val, hcd x.property⟩ := by sorry
def class_lattice_pushforward : (InertiaClasses c →₀ ℤ) →+ (InertiaClasses d →₀ ℤ) :=
  Finsupp.mapDomain.addMonoidHom (inertia_class_pushforward ρ hcd)
lemma class_lattice_pushforward_basis (x : c) :
    class_lattice_pushforward ρ hcd (Finsupp.single (inertia_class_mk c x) 1) =
      Finsupp.single (inertia_class_mk d ⟨ρ x.val, hcd x.property⟩) 1 := by sorry

variable (n : ℕ) (hn : 0 < n) (hE : ∀ x : E, x^n = 1)
    (hG : ∀ x : G, x^n = 1) (hF : ∀ x : F, x^n = 1) (hK : ∀ x : K, x^n = 1)
    (hpowc : ∀ α : (ZMod n)ˣ, ∀ x ∈ c, finite_power n α x ∈ c)
    (hpowd : ∀ α : (ZMod n)ˣ, ∀ x ∈ d, finite_power n α x ∈ d)

include hinl hover hmark in
lemma compatible_correction (α : (ZMod n)ˣ) (m : InertiaClasses c →₀ ℤ) :
    a (central_power_correction M n hn hE hG hpowc α (Multiplicative.ofAdd m)) =
      central_power_correction N n hn hF hK hpowd α
        (Multiplicative.ofAdd (class_lattice_pushforward ρ hcd m)) := by sorry

include hover in
def compatible_fiber_map : cover_fiber_product M.extension.rightHom c →*
    cover_fiber_product N.extension.rightHom d := by
  have := e
  have := ρ
  have := hcd
  have := hover
  sorry
include hover in
lemma compatible_fiber_map_val (p : cover_fiber_product M.extension.rightHom c) :
    (compatible_fiber_map M N e ρ hcd hover p).val =
      (e p.val.1, Multiplicative.ofAdd
        (class_lattice_pushforward ρ hcd (Multiplicative.toAdd p.val.2))) := by sorry

include hinl hover hmark in
lemma compatible_correction_action (α : (ZMod n)ˣ)
    (p : cover_fiber_product M.extension.rightHom c) :
    compatible_fiber_map M N e ρ hcd hover
        (discrete_action M n hn hE hG hpowc α p) =
      discrete_action N n hn hF hK hpowd α
        (compatible_fiber_map M N e ρ hcd hover p) := by sorry
end CompatiblePowerCorrections

/-! ## RS.6: finite reduction certificates on native carriers -/

section ReductionCertificates
variable {E G : Type} [Group E] [Group G]

def projection_extension (π : E →* G) (hπ : Function.Surjective π) :
    GroupExtension π.ker E G where
  inl := π.ker.subtype
  rightHom := π
  inl_injective := Subtype.val_injective
  range_inl_eq_ker_rightHom := by sorry
  rightHom_surjective := hπ

-- The group structures and enumerations are genuine finite data. In
-- particular, this is not a structure containing an unspecified
-- "is a Schur cover" proposition. The parent supplies the ordinary-cover
-- proofs used to populate the stem and class-map fields.
structure reduction_certificate [Fintype E] [Fintype G]
    (π : E →* G) (c : Set G) where
  enumerateCover : E ≃ Fin (Fintype.card E)
  enumerateBase : G ≃ Fin (Fintype.card G)
  surjective : Function.Surjective π
  central : ∀ k : π.ker, ∀ e : E, k.val * e = e * k.val
  stem : π.ker ≤ commutator E
  classMap : IntegralMultiplier G ≃+ Additive π.ker
  oriented : ∀ (x y : G) (hxy : Commute x y) (X Y : E),
    π X = x → π Y = y →
    (Additive.toMul (classMap (homological_commutator x y hxy))).val =
      X * Y * X⁻¹ * Y⁻¹
  conjugationClosed : ∀ a x : G, x ∈ c → a * x * a⁻¹ ∈ c
  representatives : InertiaClasses c → c
  representatives_mk : ∀ d, inertia_class_mk c (representatives d) = d
  centralizerGenerators : ∀ d : InertiaClasses c,
    Finset (Subgroup.centralizer ({(representatives d).val} : Set G))
  centralizerGenerated : ∀ d,
    Subgroup.closure (centralizerGenerators d :
      Set (Subgroup.centralizer ({(representatives d).val} : Set G))) = ⊤

variable [Fintype E] [Fintype G] {π : E →* G} {c : Set G}

def reduction_certificate_tables (C : reduction_certificate π c) :
    (Fin (Fintype.card E) → Fin (Fintype.card E) → Fin (Fintype.card E)) ×
      (Fin (Fintype.card E) → Fin (Fintype.card E)) ×
      (Fin (Fintype.card E) → Fin (Fintype.card G)) :=
  (fun i j => C.enumerateCover (C.enumerateCover.symm i * C.enumerateCover.symm j),
    (fun i => C.enumerateCover ((C.enumerateCover.symm i)⁻¹)),
    (fun i => C.enumerateBase (π (C.enumerateCover.symm i))))

lemma reduction_certificate_tables_associative (C : reduction_certificate π c)
    (i j k : Fin (Fintype.card E)) :
    (reduction_certificate_tables C).1 ((reduction_certificate_tables C).1 i j) k =
      (reduction_certificate_tables C).1 i ((reduction_certificate_tables C).1 j k) := by
  sorry

def certificate_relation_subgroup (C : reduction_certificate π c) : Subgroup π.ker :=
  Subgroup.closure {a | ∃ d : InertiaClasses c, ∃ y ∈ C.centralizerGenerators d,
    a = centralizer_commutator_hom (projection_extension π C.surjective)
      C.central (C.representatives d).val y}

instance certificate_relation_normal (C : reduction_certificate π c) :
    (certificate_relation_subgroup C).Normal := by sorry

lemma reduction_certificate_relations (C : reduction_certificate π c) :
    certificate_relation_subgroup C =
      ((schur_relations c).map C.classMap.toAddMonoidHom).toSubgroup' := by sorry

def reduction_certificate_quotient (C : reduction_certificate π c) :
    Multiplicative (reduced_multiplier c) ≃* π.ker ⧸ certificate_relation_subgroup C := by
  sorry

lemma reduction_certificate_quotient_mk (C : reduction_certificate π c)
    (z : IntegralMultiplier G) :
    reduction_certificate_quotient C
      (Multiplicative.ofAdd (QuotientAddGroup.mk z)) =
        QuotientGroup.mk (Additive.toMul (C.classMap z)) := by sorry

def reduction_certificate_transport {E' G' : Type} [Group E'] [Group G']
    [Fintype E'] [Fintype G'] {π' : E' →* G'} {c' : Set G'}
    (C : reduction_certificate π c) (e : E ≃* E') (g : G ≃* G')
    (hπ : ∀ x, π' (e x) = g (π x)) (hc : c' = g '' c) :
    reduction_certificate π' c' := by sorry

-- reduction_certificate_test_1
example : ∃ C : reduction_certificate (MonoidHom.id (Multiplicative (ZMod 1))) ∅,
    Subsingleton ((MonoidHom.id (Multiplicative (ZMod 1))).ker ⧸
      certificate_relation_subgroup C) := by sorry

-- reduction_certificate_test_2: use the actual D₈ cover and the actual
-- outside relation generators, rather than only a quotient cardinality.
example : ∃ C : reduction_certificate dihedral_v4_extension.rightHom
    ({x : Four | x ≠ 1}), certificate_relation_subgroup C = ⊤ ∧
      Subsingleton (dihedral_v4_extension.rightHom.ker ⧸
        certificate_relation_subgroup C) := by sorry

-- reduction_certificate_test_3: a nontrivial kernel in an abelian cover
-- fails the stem condition, even before the homological class-map check.
example (π₄ : Multiplicative (ZMod 4) →* Multiplicative (ZMod 2))
    (hπ₄ : Function.Surjective π₄) (hcard : Nat.card π₄.ker = 2)
    (c₄ : Set (Multiplicative (ZMod 2))) :
    ¬ Nonempty (reduction_certificate π₄ c₄) := by sorry
end ReductionCertificates

section CompatibleCoverDiagrams
variable {S H Γ : Type} [Group S] [Group H] [Group Γ]

abbrev central_kernel_comm_group {G : Type} [Group G] (π : S →* G)
    (hc : ∀ k : π.ker, ∀ s : S, k.val * s = s * k.val) : CommGroup π.ker :=
  { π.ker.toGroup with mul_comm := fun a b => Subtype.ext (hc a b.val) }

-- This structure records a quotient diagram of already supplied covers;
-- it does not define a competing notion of ordinary Schur cover.
structure compatible_cover_diagram (φ : Γ →* MulAut H) (π : S →* H ⋊[φ] Γ)
    (τ : IntegralMultiplier (H ⋊[φ] Γ) ≃+ Additive π.ker)
    (D : Subgroup S) [D.Normal] where
  lowerProjection : S ⧸ D →* Γ
  surjective : Function.Surjective lowerProjection
  central : ∀ k : lowerProjection.ker, ∀ s : S ⧸ D, k.val * s = s * k.val
  stem : lowerProjection.ker ≤ commutator (S ⧸ D)
  classMap : IntegralMultiplier Γ ≃+ Additive lowerProjection.ker
  evaluation : letI := central_kernel_comm_group lowerProjection central
    classMap.toAddMonoidHom =
      extension_class_map (projection_extension lowerProjection surjective) central
  square : lowerProjection.comp (QuotientGroup.mk' D) =
    (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ).comp π
  kernel : ∀ z : IntegralMultiplier (H ⋊[φ] Γ),
    (Additive.toMul (classMap (integral_multiplier_map
      (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ) z))).val =
        QuotientGroup.mk ((Additive.toMul (τ z)).val)

lemma compatible_covers [Finite S] [Finite H] [Finite Γ]
    (φ : Γ →* MulAut H) (hcop : Nat.Coprime (Nat.card H) (Nat.card Γ))
    (π : S →* H ⋊[φ] Γ) (hπ : Function.Surjective π)
    (hc : ∀ k : π.ker, ∀ s : S, k.val * s = s * k.val)
    (hstem : π.ker ≤ commutator S)
    (τ : IntegralMultiplier (H ⋊[φ] Γ) ≃+ Additive π.ker)
    (hclass : letI := central_kernel_comm_group π hc
      τ.toAddMonoidHom = extension_class_map (projection_extension π hπ) hc) :
    ∃ (D : Subgroup S) (hD : D.Normal),
      letI := hD
      Nonempty (compatible_cover_diagram φ π τ D) ∧
      D ≤ ((SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ).comp π).ker ∧
      Nat.card D = Nat.card H *
        Nat.card (multiplier_primary_part (H ⋊[φ] Γ) (Nat.card H)) := by sorry

variable {φ : Γ →* MulAut H} {π : S →* H ⋊[φ] Γ}
    {τ : IntegralMultiplier (H ⋊[φ] Γ) ≃+ Additive π.ker}
    {D : Subgroup S} [D.Normal] (C : compatible_cover_diagram φ π τ D)

lemma compatible_covers_square :
    C.lowerProjection.comp (QuotientGroup.mk' D) =
      (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ).comp π := C.square
lemma compatible_covers_kernel (z : IntegralMultiplier (H ⋊[φ] Γ)) :
    (Additive.toMul (C.classMap (integral_multiplier_map
      (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ) z))).val =
        QuotientGroup.mk ((Additive.toMul (τ z)).val) := C.kernel z
lemma compatible_covers_schur :
    letI := central_kernel_comm_group C.lowerProjection C.central
    C.classMap.toAddMonoidHom =
      extension_class_map (projection_extension C.lowerProjection C.surjective) C.central :=
  C.evaluation
-- The choices of the ordinary cover and D remain arguments of the diagram.
lemma compatible_covers_choice : Function.Surjective C.lowerProjection ∧
    C.lowerProjection.ker ≤ commutator (S ⧸ D) := ⟨C.surjective, C.stem⟩

variable (hc : ∀ k : π.ker, ∀ s : S, k.val * s = s * k.val)
    (c : Set (H ⋊[φ] Γ)) (d : Set Γ)
    (hcd : Set.MapsTo (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ) c d)

def compatible_reduced_cover_map : reduced_cover π hc τ c →*
    reduced_cover C.lowerProjection C.central C.classMap d := by
  have := hcd
  sorry
lemma compatible_reduced_cover_map_quotient (s : S) :
    compatible_reduced_cover_map C hc c d hcd (reduced_cover_quotient π hc τ c s) =
      reduced_cover_quotient C.lowerProjection C.central C.classMap d
        (QuotientGroup.mk s) := by sorry
lemma compatible_reduced_cover_map_projection :
    (reduced_cover_projection C.lowerProjection C.central C.classMap d).comp
        (compatible_reduced_cover_map C hc c d hcd) =
      (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ).comp
        (reduced_cover_projection π hc τ c) := by sorry
lemma compatible_reduced_cover_map_kernel (z : reduced_multiplier c) :
    compatible_reduced_cover_map C hc c d hcd
        (Additive.toMul (reduced_cover_kernel π hc τ c z)).val =
      (Additive.toMul (reduced_cover_kernel C.lowerProjection C.central C.classMap d
        (reduced_multiplier_map (SemidirectProduct.rightHom : H ⋊[φ] Γ →* Γ)
          c d hcd z))).val := by sorry

-- compatible_covers_test_1: no upper quotient is needed when H is trivial.
example [Finite S] [Subsingleton H] [Finite Γ]
    (hπ : Function.Surjective π)
    (hc : ∀ k : π.ker, ∀ s : S, k.val * s = s * k.val)
    (hstem : π.ker ≤ commutator S)
    (hclass : letI := central_kernel_comm_group π hc
      τ.toAddMonoidHom = extension_class_map (projection_extension π hπ) hc) :
    Nonempty (compatible_cover_diagram φ π τ (⊥ : Subgroup S)) := by sorry
-- compatible_covers_test_2: quotient by all of S when Γ is trivial.
example [Subsingleton Γ] :
    Nonempty (compatible_cover_diagram φ π τ (⊤ : Subgroup S)) := by sorry
-- compatible_covers_test_3: inversion on C₃ gives the S₃ identity cover,
-- with the lower quotient and its outside element specified in the diagram.
example (φ₃ : Two →* MulAut C3)
    (hφ₃ : ∀ t : Two, ∀ h : C3, φ₃ t h = if t = 1 then h else h⁻¹) :
    ∃ τ₃ : IntegralMultiplier (C3 ⋊[φ₃] Two) ≃+
        Additive (MonoidHom.id (C3 ⋊[φ₃] Two)).ker,
    ∃ C₃ : compatible_cover_diagram φ₃ (MonoidHom.id (C3 ⋊[φ₃] Two)) τ₃
      (SemidirectProduct.rightHom : C3 ⋊[φ₃] Two →* Two).ker,
      C₃.lowerProjection (QuotientGroup.mk
        (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)))) =
          Multiplicative.ofAdd (1 : ZMod 2) := by sorry
end CompatibleCoverDiagrams

section CertifiedMarkings
variable {E G : Type} [Group E] [Group G] [Fintype E] [Fintype G]
    {π : E →* G} {c : Set G} (C : reduction_certificate π c)
    (X : InertiaClasses c → E) (hX : ∀ d, π (X d) = (C.representatives d).val)

-- Populate this extension from the certified quotient, not from a guessed
-- group of the same cardinality. The representative lifts remain choices.
def certificate_marked_model :
    marked_extension (Multiplicative (reduced_multiplier c))
      (reduced_cover π C.central C.classMap c) G c := by
  have := X
  have := hX
  sorry

lemma certificate_marked_projection :
    (certificate_marked_model C X hX).extension.rightHom =
      reduced_cover_projection π C.central C.classMap c := by sorry
lemma certificate_marked_representative (d : InertiaClasses c) :
    (certificate_marked_model C X hX).marking (C.representatives d) =
      reduced_cover_quotient π C.central C.classMap c (X d) := by sorry

include C in
lemma certificate_reduced_finite : Finite (reduced_multiplier c) := by sorry
end CertifiedMarkings

section FiniteParityAlgorithm
variable {A E G : Type} [CommGroup A] [Group E] [Group G]
    {c : Set G} [Fintype (InertiaClasses c)]
    (M : marked_extension A E G c) (hgen : Subgroup.closure c = ⊤)
    (hinv : ∀ x : c, x.val^2 = 1)
    (rep : InertiaClasses c → c) (hrep : ∀ d, inertia_class_mk c (rep d) = d)

-- This finite enumeration is a specification of the computation. A table
-- implementation must supply decidable representations of the certified
-- kernel and its filtration, instead of relying on classical choice.
def finite_parity_algorithm (t : ℕ) (x : Option c) :
    Finset (InertiaClasses c → ZMod 2) := by
  classical
  letI := involution_abelianization_module c hgen (fun y hy => hinv ⟨y, hy⟩)
  exact Finset.univ.filter (fun v =>
    v + signature_parity x ∈ LinearMap.ker (signature_joint_map M hgen hinv rep t))

lemma finite_parity_algorithm_cosets (t : ℕ) (x : Option c)
    (v : InertiaClasses c → ZMod 2) :
    letI := involution_abelianization_module c hgen (fun y hy => hinv ⟨y, hy⟩)
    v ∈ finite_parity_algorithm M hgen hinv rep t x ↔
      v + signature_parity x ∈ LinearMap.ker (signature_joint_map M hgen hinv rep t) := by
  sorry

include hrep in
lemma finite_parity_algorithm_obstruction (t : ℕ) (x : Option c)
    (m : InertiaClasses c →₀ ℤ) :
    degree_parity m ∈ finite_parity_algorithm M hgen hinv rep t x ↔
      degree_to_abelianization c (Multiplicative.ofAdd m) =
        Abelianization.of (signature_element x) ∧
      square_obstruction (signature_square M hinv x)
        (marked_square_column M hinv rep) (fun d => m d) ∈
          torsion_image_filtration (A := A) t := by sorry

def finite_parity_histogram (t : ℕ) (x : Option c) : ℕ :=
  (finite_parity_algorithm M hgen hinv rep t x).card -
    if t = 0 then 0 else (finite_parity_algorithm M hgen hinv rep (t-1) x).card

lemma finite_parity_algorithm_counts (t : ℕ) (x : Option c) :
    letI := involution_abelianization_module c hgen (fun y hy => hinv ⟨y, hy⟩)
    (finite_parity_algorithm M hgen hinv rep t x).card =
      2 ^ (Fintype.card (InertiaClasses c) - Module.finrank (ZMod 2)
        (LinearMap.range (signature_joint_map M hgen hinv rep t))) ∧
    finite_parity_histogram M hgen hinv rep t x =
      Nat.card {v : InertiaClasses c → ZMod 2 //
        v + signature_parity x ∈ LinearMap.ker (signature_joint_map M hgen hinv rep t) ∧
          (t = 0 ∨ v + signature_parity x ∉
            LinearMap.ker (signature_joint_map M hgen hinv rep (t-1)))} := by sorry

def finite_parity_weights (t N₀ : ℕ) (x : Option c) : Polynomial ℕ :=
  parity_weight_enumerator (finite_parity_algorithm M hgen hinv rep t x) N₀

lemma finite_parity_algorithm_weights (t N₀ j : ℕ) (x : Option c) :
    (finite_parity_weights M hgen hinv rep t N₀ x).coeff j =
      ((finite_parity_algorithm M hgen hinv rep t x).filter
        (fun v => parity_weight (v + fun _ => (N₀ : ZMod 2)) = j)).card := by
  classical
  sorry

-- π₀ specifies the outside signature in the embedded arithmetic application.
-- The computation uses τ itself, keeping its class rather than only π₀(τ).
lemma finite_parity_algorithm_signatures (π₀ : G →* Two) (τ : c)
    (hτ : π₀ τ.val ≠ 1) (t : ℕ) :
    (finite_parity_algorithm M hgen hinv rep t none).card =
      (finite_parity_algorithm M hgen hinv rep t (some τ)).card := by sorry

-- finite_parity_algorithm_test_2: a trivial kernel leaves only compatibility.
include hrep in
example [Subsingleton A] (t : ℕ) (x : Option c) (m : InertiaClasses c →₀ ℤ) :
    degree_parity m ∈ finite_parity_algorithm M hgen hinv rep t x ↔
      degree_to_abelianization c (Multiplicative.ofAdd m) =
        Abelianization.of (signature_element x) := by sorry
end FiniteParityAlgorithm

section FiniteParityAlgorithmExamples
local instance : Fintype (InertiaClasses s3_transpositions) := Fintype.ofFinite _
-- finite_parity_algorithm_test_1: these are the actual S₃ marked-model maps.
example (rep : InertiaClasses s3_transpositions → s3_transpositions)
    (hrep : ∀ d, inertia_class_mk s3_transpositions (rep d) = d)
    (t : ℕ) (x : Option s3_transpositions) :
    (finite_parity_algorithm
      (identity_marked_extension s3_transpositions s3_transpositions_closed)
      s3_transpositions_generate s3_transpositions_involutions rep t x).card = 1 ∧
    finite_parity_histogram
      (identity_marked_extension s3_transpositions s3_transpositions_closed)
      s3_transpositions_generate s3_transpositions_involutions rep t x =
        if t = 0 then 1 else 0 := by sorry

-- finite_parity_algorithm_test_3: an algebraic square-column fixture.
-- This does not assert that C₈ with this column is a reduced arithmetic cover.
example : obstruction_threshold (Multiplicative.ofAdd (1 : ZMod 8)) = 3 ∧
    (¬ ∃ a : Multiplicative (ZMod 8), a^(9-1) =
      ((Multiplicative.ofAdd (1 : ZMod 8))^((9-1)/2))⁻¹) ∧
    (∃ a : Multiplicative (ZMod 8), a^(17-1) =
      ((Multiplicative.ofAdd (1 : ZMod 8))^((17-1)/2))⁻¹) := by sorry
end FiniteParityAlgorithmExamples

section OddIndexTwoReduction
variable {G : Type} [Group G] (H : Subgroup G) [H.Normal]

def normal_subgroup_conjugation (g : G) : H →* H := by
  have : H.Normal := inferInstance
  have := g
  sorry
lemma normal_subgroup_conjugation_apply (g : G) (h : H) :
    (normal_subgroup_conjugation H g h).val = g * h.val * g⁻¹ := by sorry

-- The homological action comes from the actual conjugation maps on H.
-- Inner conjugation by H is trivial on homology, so it factors through G/H.
def normal_subgroup_homology_action : Representation ℤ G (IntegralMultiplier H) := by
  have : H.Normal := inferInstance
  sorry
lemma normal_subgroup_homology_action_apply (g : G) (z : IntegralMultiplier H) :
    normal_subgroup_homology_action H g z =
      integral_multiplier_map (normal_subgroup_conjugation H g) z := by sorry
lemma normal_subgroup_homology_action_inner (h : H) (z : IntegralMultiplier H) :
    normal_subgroup_homology_action H h.val z = z := by sorry

-- This is the degree-two LHS edge isomorphism. Its proof must account for
-- the incoming d₃ from the 2-primary H₃(C₂,ℤ) term before using oddness.
lemma odd_index_two_reduction [Finite G] (hodd : Odd (Nat.card H))
    (quotientTwo : G ⧸ H ≃* Two) (c : Set G) (hinv : ∀ x ∈ c, x^2 = 1) :
    ∃ e : IntegralMultiplier G ≃+
      Representation.Coinvariants (normal_subgroup_homology_action H),
      (∀ z : IntegralMultiplier H, e (integral_multiplier_map H.subtype z) =
        Representation.Coinvariants.mk (normal_subgroup_homology_action H) z) ∧
      Finite (IntegralMultiplier G) ∧ Odd (Nat.card (IntegralMultiplier G)) ∧
      schur_relations c = ⊥ ∧ Nonempty (reduced_multiplier c ≃+ IntegralMultiplier G) := by
  sorry
end OddIndexTwoReduction

/-! ## The specified order-96 marked type -/

section Order96Type
abbrev A4 := alternatingGroup (Fin 4)

-- This particular quotient is part of the explicit marked fixture. Its
-- kernel, surjectivity and normalization are required statements; an
-- arbitrary map A₄ → C₃ would not specify the fixture.
def a4_abelianization : A4 →* C3 := by sorry
lemma a4_abelianization_surjective : Function.Surjective a4_abelianization := by sorry
lemma a4_abelianization_kernel : a4_abelianization.ker = commutator A4 := by sorry

def order96_sum_map : A4 × A4 →* C3 where
  toFun p := a4_abelianization p.1 * a4_abelianization p.2
  map_one' := by simp
  map_mul' := by
    intro p q
    simp [mul_left_comm, mul_comm]

abbrev Order96Kernel := order96_sum_map.ker

def order96_swap_action : Two →* MulAut Order96Kernel := by sorry
lemma order96_swap_action_apply (t : Two) (k : Order96Kernel) :
    (order96_swap_action t k).val =
      if t = 1 then k.val else (k.val.2, k.val.1) := by sorry

abbrev order96_type := Order96Kernel ⋊[order96_swap_action] Two

lemma order96_type_kernel (a b : A4) :
    (a, b) ∈ order96_sum_map.ker ↔
      a4_abelianization a * a4_abelianization b = 1 := by sorry

lemma order96_type_swap (k : Order96Kernel) :
    (order96_swap_action (Multiplicative.ofAdd (1 : ZMod 2)) k).val =
      (k.val.2, k.val.1) ∧
    order96_swap_action (Multiplicative.ofAdd (1 : ZMod 2))
      (order96_swap_action (Multiplicative.ofAdd (1 : ZMod 2)) k) = k := by sorry

lemma order96_type_order : Nat.card Order96Kernel = 48 ∧ Nat.card order96_type = 96 := by
  sorry

def order96_outside_involutions : Set order96_type :=
  {x | x.right ≠ 1 ∧ orderOf x = 2}

lemma order96_type_outside (x : order96_type) :
    x ∈ order96_outside_involutions ↔
      (SemidirectProduct.rightHom : order96_type →* Two) x ≠ 1 ∧ orderOf x = 2 := by
  sorry

-- The embedding is in the actual factor-swap wreath model A₄² ⋊ C₂.
def a4_factor_swap_action : Two →* MulAut (A4 × A4) := by sorry
lemma a4_factor_swap_action_apply (t : Two) (p : A4 × A4) :
    a4_factor_swap_action t p = if t = 1 then p else (p.2, p.1) := by sorry
def order96_embedding : order96_type →* (A4 × A4) ⋊[a4_factor_swap_action] Two := by
  sorry
lemma order96_embedding_apply (x : order96_type) :
    (order96_embedding x).left = x.left.val ∧ (order96_embedding x).right = x.right := by
  sorry
lemma order96_embedding_injective : Function.Injective order96_embedding := by sorry

-- order96_type_test_1: values 1 and 2 in the additive C₃ quotient sum to zero.
example (a b : A4) (ha : a4_abelianization a = Multiplicative.ofAdd 1)
    (hb : a4_abelianization b = Multiplicative.ofAdd 2) :
    (a, b) ∈ order96_sum_map.ker := by sorry

-- order96_type_test_2: the two quotient conventions give different membership.
example (a b : A4) (ha : a4_abelianization a = Multiplicative.ofAdd 1)
    (hb : a4_abelianization b = Multiplicative.ofAdd 1) :
    (a, b) ∉ order96_sum_map.ker ∧
      a4_abelianization a * (a4_abelianization b)⁻¹ = 1 := by sorry

-- order96_type_test_3
example : (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)) : order96_type)
      ∈ order96_outside_involutions := by sorry

theorem order96_reduced_multiplier :
    Nonempty (reduced_multiplier order96_outside_involutions ≃+ ZMod 2) := by sorry
end Order96Type

/-! ## RS.6: the nineteen odd abelian marked table fixtures

Wood (2019), introduction pp.378–379 and §8.2, Table 2, p.419.
The ambient group and outside marking are fixed before the cover is selected.
The finite cover in each row is a proof target, not a supplied certificate.
-/

section AbelianTableFixtures
variable (A : Type) [CommGroup A]

-- This is the factor swap on A × A, not inversion on each ambient factor.
def table_factor_swap : Two →* MulAut (A × A) := by sorry
lemma table_factor_swap_apply (t : Two) (p : A × A) :
    table_factor_swap A t p = if t = 1 then p else (p.2, p.1) := by sorry

abbrev TableWreath := (A × A) ⋊[table_factor_swap A] Two

instance table_wreath_fintype [Fintype A] : Fintype (TableWreath A) :=
  Fintype.ofEquiv ((A × A) × Two) SemidirectProduct.equivProd.symm

-- The actual embedded subgroup contains both components (a,a⁻¹,t).
-- Commutativity of A is required for closure under multiplication.
def table_antidiagonal : Subgroup (TableWreath A) := by sorry
lemma table_antidiagonal_mem (w : TableWreath A) :
    w ∈ table_antidiagonal A ↔ w.left.2 = w.left.1⁻¹ := by sorry

abbrev AbelianTableType := table_antidiagonal A

instance abelian_table_fintype [Fintype A] : Fintype (AbelianTableType A) :=
  Fintype.ofFinite _

def table_embedding : AbelianTableType A →* TableWreath A :=
  (table_antidiagonal A).subtype

def table_projection : AbelianTableType A →* Two :=
  SemidirectProduct.rightHom.comp (table_embedding A)

def table_outside : Set (AbelianTableType A) :=
  {x | table_projection A x ≠ 1 ∧ orderOf x = 2}

lemma table_outside_mem (x : AbelianTableType A) :
    x ∈ table_outside A ↔ x.val.right ≠ 1 ∧ orderOf x = 2 := by sorry

lemma table_projection_surjective : Function.Surjective (table_projection A) := by sorry

-- The parametrization fixes the multiplication; an order alone is insufficient.
def table_coordinates : AbelianTableType A ≃ A × Two := by sorry
lemma table_coordinates_apply (x : AbelianTableType A) :
    table_coordinates A x = (x.val.left.1, x.val.right) := by sorry
lemma table_coordinates_mul (x y : AbelianTableType A) :
    table_coordinates A (x*y) =
      (x.val.left.1 * (if x.val.right = 1 then y.val.left.1 else y.val.left.1⁻¹),
        x.val.right * y.val.right) := by sorry

-- This map is the first factor of the actual index-two kernel embedding.
def table_kernel_first : (table_projection A).ker →* A := by sorry
lemma table_kernel_first_apply (k : (table_projection A).ker) :
    table_kernel_first A k = k.val.val.left.1 := by sorry
lemma table_kernel_first_surjective : Function.Surjective (table_kernel_first A) := by sorry

lemma abelian_table_marking [Fintype A] (hodd : Odd (Nat.card A)) :
    Subgroup.closure (table_outside A) = ⊤ ∧
      (∀ x y : AbelianTableType A, x ∈ table_outside A → y ∈ table_outside A →
        IsConj x y) ∧
      (∀ a x : AbelianTableType A, x ∈ table_outside A → a*x*a⁻¹ ∈ table_outside A) := by
  sorry

lemma abelian_table_card [Fintype A] :
    Nat.card (AbelianTableType A) = 2 * Nat.card A := by sorry

-- Three checks of the ambient action.
example (p : A × A) : table_factor_swap A 1 p = p := by sorry
example (p : A × A) :
    table_factor_swap A (Multiplicative.ofAdd (1 : ZMod 2)) p = (p.2,p.1) := by sorry
example (p : A × A) :
    table_factor_swap A (Multiplicative.ofAdd (1 : ZMod 2))
      (table_factor_swap A (Multiplicative.ofAdd (1 : ZMod 2)) p) = p := by sorry

-- Three checks distinguish the anti-diagonal, the marking and oddness.
example : (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)) : TableWreath A)
    ∈ table_antidiagonal A := by sorry
example : (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd (1 : ZMod 3)), 1⟩ :
    TableWreath C3) ∉ table_antidiagonal C3 := by sorry
example : (⟨(Multiplicative.ofAdd (1 : ZMod 3), Multiplicative.ofAdd (2 : ZMod 3)), 1⟩ :
    TableWreath C3) ∈ table_antidiagonal C3 := by sorry
-- At even order C₂, the outside involution generates only one C₂ factor.
example : Subgroup.closure (table_outside Two) ≠ ⊤ := by sorry

-- Three boundary checks of the outside set and its native projection.
example : (1 : AbelianTableType A) ∉ table_outside A := by sorry
example (x : AbelianTableType A) :
    x ∈ table_outside A ↔ table_projection A x ≠ 1 := by sorry
example (x : AbelianTableType C3) (hx : x ∈ table_outside C3) :
    orderOf x = 2 ∧ table_projection C3 x = Multiplicative.ofAdd (1 : ZMod 2) := by sorry

-- Three simultaneous checks of coordinates, embedding and projection.
-- The nonidentity C₃ coordinate separates the first factor from its inverse.
example : table_coordinates C3 (1 : AbelianTableType C3) = (1,1) ∧
    (table_embedding C3 1).left = (1,1) ∧ table_projection C3 1 = 1 := by sorry
example :
    let a := Multiplicative.ofAdd (1 : ZMod 3)
    let x := (table_coordinates C3).symm (a,1)
    (table_embedding C3 x).left = (a,a⁻¹) ∧
      (table_embedding C3 x).right = 1 ∧ table_projection C3 x = 1 := by sorry
example :
    let a := Multiplicative.ofAdd (1 : ZMod 3)
    let t := Multiplicative.ofAdd (1 : ZMod 2)
    let x := (table_coordinates C3).symm (a,t)
    (table_embedding C3 x).left = (a,a⁻¹) ∧
      (table_embedding C3 x).right = t ∧ table_projection C3 x = t ∧
      x ∈ table_outside C3 := by sorry

-- Three first-factor checks; inversion and constant maps fail the last two.
example : table_kernel_first C3 1 = 1 := by sorry
example (k : (table_projection C3).ker)
    (hk : table_coordinates C3 k.val = (Multiplicative.ofAdd (1 : ZMod 3),1)) :
    table_kernel_first C3 k = Multiplicative.ofAdd (1 : ZMod 3) := by sorry
example (k : (table_projection C3).ker)
    (hk : table_coordinates C3 k.val = (Multiplicative.ofAdd (2 : ZMod 3),1)) :
    table_kernel_first C3 k = Multiplicative.ofAdd (2 : ZMod 3) := by sorry

-- The cyclic carrier agrees with the pinned dihedral model, including the
-- reflection marking. DihedralGroup n has order 2n, rather than n.
def abelian_table_dihedral (n : ℕ) :
    AbelianTableType (Multiplicative (ZMod n)) ≃* DihedralGroup n := by sorry
-- Mathlib writes reflections as sr i = s*r i, so the reflection index
-- is negated relative to the left inversion semidirect-product coordinate.
lemma abelian_table_dihedral_apply (n : ℕ) (x : AbelianTableType (Multiplicative (ZMod n))) :
    abelian_table_dihedral n x =
      if x.val.right = 1 then DihedralGroup.r (Multiplicative.toAdd x.val.left.1)
      else DihedralGroup.sr (-Multiplicative.toAdd x.val.left.1) := by sorry
lemma abelian_table_dihedral_outside (n : ℕ) :
    abelian_table_dihedral n '' table_outside (Multiplicative (ZMod n)) =
      Set.range (DihedralGroup.sr : ZMod n → DihedralGroup n) := by sorry

-- Three convention checks of the dihedral equivalence.
example : abelian_table_dihedral 3 1 = DihedralGroup.r 0 := by sorry
example : abelian_table_dihedral 3
    ((table_coordinates C3).symm (Multiplicative.ofAdd (1 : ZMod 3),1)) =
      DihedralGroup.r 1 := by sorry
example : abelian_table_dihedral 3
    ((table_coordinates C3).symm
      (Multiplicative.ofAdd (1 : ZMod 3),Multiplicative.ofAdd (1 : ZMod 2))) =
      DihedralGroup.sr (2 : ZMod 3) := by sorry

end AbelianTableFixtures

section TableRowCertificates
variable {F : Type} [Group F] [Fintype F] (c : Set F)
variable (B : Type) [AddCommGroup B]

-- Native certificate output for a row. The cover lives on an explicit finite
-- enumeration. The displayed equation fixes the quotient isomorphism on
-- every integral class; no input field assumes the computed multiplier.
-- As with reduction_certificate, the proof fields are precise laws on maps.
structure table_row_certificate where
  coverOrder : ℕ
  coverGroup : Group (Fin coverOrder)
  projection : letI := coverGroup; Fin coverOrder →* F
  cover : letI := coverGroup; reduction_certificate projection c
  quotient : letI := coverGroup
    projection.ker ⧸ certificate_relation_subgroup cover ≃* Multiplicative B
  reduced : reduced_multiplier c ≃+ B
  quotient_on_class : letI := coverGroup
    ∀ z : IntegralMultiplier F,
      quotient (QuotientGroup.mk (Additive.toMul (cover.classMap z))) =
        Multiplicative.ofAdd (reduced (QuotientAddGroup.mk z))

-- Three discrimination checks of the row output.
example : Nonempty (table_row_certificate (∅ : Set (Multiplicative (ZMod 1))) (ZMod 1)) := by
  sorry
example : ¬ Nonempty (table_row_certificate (∅ : Set Four) (ZMod 1)) := by sorry
example : ¬ Nonempty (table_row_certificate (table_outside C3) (ZMod 3)) := by sorry

end TableRowCertificates

-- Wood (2019), Table 2, p.419: C_3, dihedral order 6, reduced multiplier 1.
theorem table_row_01 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 3))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_5, dihedral order 10, reduced multiplier 1.
theorem table_row_02 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 5))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_7, dihedral order 14, reduced multiplier 1.
theorem table_row_03 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 7))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_9, dihedral order 18, reduced multiplier 1.
theorem table_row_04 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 9))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_11, dihedral order 22, reduced multiplier 1.
theorem table_row_06 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 11))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_13, dihedral order 26, reduced multiplier 1.
theorem table_row_09 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 13))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_15, dihedral order 30, reduced multiplier 1.
theorem table_row_10 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 15))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_17, dihedral order 34, reduced multiplier 1.
theorem table_row_11 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 17))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_19, dihedral order 38, reduced multiplier 1.
theorem table_row_12 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 19))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_21, dihedral order 42, reduced multiplier 1.
theorem table_row_14 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 21))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_23, dihedral order 46, reduced multiplier 1.
theorem table_row_15 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 23))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_25, dihedral order 50, reduced multiplier 1.
theorem table_row_18 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 25))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_27, dihedral order 54, reduced multiplier 1.
theorem table_row_20 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 27))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_29, dihedral order 58, reduced multiplier 1.
theorem table_row_26 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 29))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: C_31, dihedral order 62, reduced multiplier 1.
theorem table_row_27 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 31))) (ZMod 1)) := by sorry

-- Wood (2019), Table 2, p.419: inversion on the specified odd abelian kernel.
theorem table_row_05 :
    Nonempty (table_row_certificate (table_outside (C3 × C3)) (ZMod 3)) := by sorry

-- Wood (2019), Table 2, p.419: inversion on the specified odd abelian kernel.
theorem table_row_19 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 5) × Multiplicative (ZMod 5))) (ZMod 5)) := by sorry

-- Wood (2019), Table 2, p.419: inversion on the specified odd abelian kernel.
theorem table_row_21 :
    Nonempty (table_row_certificate (table_outside (Multiplicative (ZMod 9) × C3)) (ZMod 3)) := by sorry

-- Wood (2019), Table 2, p.419: inversion on the specified odd abelian kernel.
theorem table_row_25 :
    Nonempty (table_row_certificate (table_outside (Fin 3 → C3)) (Fin 3 → ZMod 3)) := by sorry

/-! ## RS.6: nonabelian embedded models for rows 07, 08, 28 and 29

Wood (2019), introduction pp.378–379 and §8.2, Table 2, p.419.
These are signatures for the actual marked carriers and certificate outputs.
The classification of these embeddings as arithmetic types belongs to ST.3.
-/

section NonabelianWreathFixtures
variable (G : Type) [Group G]

def nonabelian_table_swap : Two →* MulAut (G × G) := by sorry
lemma nonabelian_table_swap_apply (t : Two) (p : G × G) :
    nonabelian_table_swap G t p = if t = 1 then p else (p.2,p.1) := by sorry

abbrev FullTableWreath := (G × G) ⋊[nonabelian_table_swap G] Two
instance full_table_wreath_fintype [Fintype G] : Fintype (FullTableWreath G) :=
  Fintype.ofEquiv ((G × G) × Two) SemidirectProduct.equivProd.symm

def full_table_outside : Set (FullTableWreath G) :=
  {x | x.right ≠ 1 ∧ orderOf x = 2}
lemma full_table_outside_mem (x : FullTableWreath G) :
    x ∈ full_table_outside G ↔ x.right ≠ 1 ∧ x.left.2 = x.left.1⁻¹ := by sorry

def full_table_kernel_first :
    (SemidirectProduct.rightHom : FullTableWreath G →* Two).ker →* G := by sorry
lemma full_table_kernel_first_apply
    (x : (SemidirectProduct.rightHom : FullTableWreath G →* Two).ker) :
    full_table_kernel_first G x = x.val.left.1 := by sorry
lemma full_table_kernel_first_surjective :
    Function.Surjective (full_table_kernel_first G) := by sorry

lemma full_table_one_class (x y : FullTableWreath G)
    (hx : x ∈ full_table_outside G) (hy : y ∈ full_table_outside G) :
    IsConj x y := by sorry
lemma full_table_marking_closed (a x : FullTableWreath G)
    (hx : x ∈ full_table_outside G) : a*x*a⁻¹ ∈ full_table_outside G := by sorry
lemma full_table_marking_generates (hperfect : commutator G = ⊤) :
    Subgroup.closure (full_table_outside G) = ⊤ := by sorry

-- Action checks: use no commutativity hypothesis on the factors.
example (p : G × G) : nonabelian_table_swap G 1 p = p := by sorry
example (p : G × G) :
    nonabelian_table_swap G (Multiplicative.ofAdd (1 : ZMod 2)) p = (p.2,p.1) := by sorry
example (p : G × G) :
    nonabelian_table_swap G (Multiplicative.ofAdd (1 : ZMod 2))
      (nonabelian_table_swap G (Multiplicative.ofAdd (1 : ZMod 2)) p) = p := by sorry

-- Marking checks: both the quotient coordinate and order two matter.
example : (1 : FullTableWreath G) ∉ full_table_outside G := by sorry
example : (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)) :
    FullTableWreath G) ∈ full_table_outside G := by sorry
example (a b : G) (h : b ≠ a⁻¹) :
    (⟨(a,b),Multiplicative.ofAdd (1 : ZMod 2)⟩ : FullTableWreath G)
      ∉ full_table_outside G := by sorry

-- The first-factor map is not its inverse or the second-factor projection.
example : full_table_kernel_first C3 1 = 1 := by sorry
example (x : (SemidirectProduct.rightHom : FullTableWreath C3 →* Two).ker)
    (h : x.val.left = (Multiplicative.ofAdd (1 : ZMod 3),1)) :
    full_table_kernel_first C3 x = Multiplicative.ofAdd (1 : ZMod 3) := by sorry
example (x : (SemidirectProduct.rightHom : FullTableWreath C3 →* Two).ker)
    (h : x.val.left = (1,Multiplicative.ofAdd (1 : ZMod 3))) :
    full_table_kernel_first C3 x = 1 := by sorry
-- Perfectness cannot be removed: C₃ gives the proper anti-diagonal subgroup.
example : Subgroup.closure (full_table_outside C3) ≠ ⊤ := by sorry
end NonabelianWreathFixtures

section SymmetricTableFixtures
-- Fin (n+2) has two distinguished points even at the boundary n=0.
def symmetric_table_transposition (n : ℕ) : Equiv.Perm (Fin (n+2)) :=
  Equiv.swap 0 1

example (n : ℕ) : symmetric_table_transposition n * symmetric_table_transposition n = 1 := by
  sorry
example (n : ℕ) : Equiv.Perm.sign (symmetric_table_transposition n) = -1 := by sorry
example (n : ℕ) : symmetric_table_transposition n 0 = 1 := by sorry

def symmetric_even_part (n : ℕ) (σ : Equiv.Perm (Fin (n+2))) :
    alternatingGroup (Fin (n+2)) := by sorry
lemma symmetric_even_part_val (n : ℕ) (σ : Equiv.Perm (Fin (n+2))) :
    (symmetric_even_part n σ).val =
      if Equiv.Perm.sign σ = 1 then σ else σ * symmetric_table_transposition n := by sorry

def symmetric_table_projection (n : ℕ) : Equiv.Perm (Fin (n+2)) →* Two := by sorry
lemma symmetric_table_projection_apply (n : ℕ) (σ : Equiv.Perm (Fin (n+2))) :
    symmetric_table_projection n σ =
      if Equiv.Perm.sign σ = 1 then 1 else Multiplicative.ofAdd (1 : ZMod 2) := by sorry
lemma symmetric_table_projection_kernel (n : ℕ) :
    (symmetric_table_projection n).ker = alternatingGroup (Fin (n+2)) := by sorry

-- Conjugation by the fixed transposition specifies the second factor.
-- Writing σ=a*t^ε uses right multiplication to obtain the even part.
def symmetric_table_embedding (n : ℕ) :
    Equiv.Perm (Fin (n+2)) →* FullTableWreath (alternatingGroup (Fin (n+2))) := by sorry
lemma symmetric_table_embedding_apply (n : ℕ) (σ : Equiv.Perm (Fin (n+2))) :
    ((symmetric_table_embedding n σ).left.1).val = (symmetric_even_part n σ).val ∧
    ((symmetric_table_embedding n σ).left.2).val =
      symmetric_table_transposition n * (symmetric_even_part n σ).val *
        (symmetric_table_transposition n)⁻¹ ∧
    (symmetric_table_embedding n σ).right = symmetric_table_projection n σ := by sorry
lemma symmetric_table_embedding_injective (n : ℕ) :
    Function.Injective (symmetric_table_embedding n) := by sorry

def symmetric_table_outside (n : ℕ) : Set (Equiv.Perm (Fin (n+2))) :=
  {σ | symmetric_table_projection n σ ≠ 1 ∧ orderOf σ = 2}
lemma symmetric_table_outside_embedding (n : ℕ) (σ : Equiv.Perm (Fin (n+2))) :
    symmetric_table_embedding n σ ∈ full_table_outside (alternatingGroup (Fin (n+2))) ↔
      σ ∈ symmetric_table_outside n := by sorry
lemma symmetric_table_marking (n : ℕ) :
    Subgroup.closure (symmetric_table_outside n) = ⊤ := by sorry
lemma symmetric_table_one_class (n : ℕ) (hn : n = 2 ∨ n = 3)
    (σ ρ : Equiv.Perm (Fin (n+2)))
    (hσ : σ ∈ symmetric_table_outside n) (hρ : ρ ∈ symmetric_table_outside n) :
    IsConj σ ρ := by sorry

-- Coordinate tests of the new even-part construction.
example (n : ℕ) : (symmetric_even_part n 1).val = 1 := by sorry
example (n : ℕ) :
    (symmetric_even_part n (symmetric_table_transposition n)).val = 1 := by sorry
example : (symmetric_even_part 2 (Equiv.swap 1 2)).val =
      (Equiv.swap 1 2 : Equiv.Perm (Fin 4)) * Equiv.swap 0 1 ∧
    (symmetric_even_part 2 (Equiv.swap 1 2)).val ≠
      (Equiv.swap 0 1 : Equiv.Perm (Fin 4)) * Equiv.swap 1 2 := by sorry

-- Identity, even and odd cases test the actual embedding and projection.
example : symmetric_table_embedding 2 1 = 1 ∧ symmetric_table_projection 2 1 = 1 := by sorry
example (a : alternatingGroup (Fin 4)) :
    ((symmetric_table_embedding 2 a.val).left.1).val = a.val ∧
      ((symmetric_table_embedding 2 a.val).left.2).val =
        Equiv.swap 0 1 * a.val * (Equiv.swap 0 1)⁻¹ ∧
      symmetric_table_projection 2 a.val = 1 := by sorry
example :
    symmetric_table_embedding 2 (Equiv.swap 0 1) =
      SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)) ∧
    symmetric_table_projection 2 (Equiv.swap 0 1) = Multiplicative.ofAdd (1 : ZMod 2) := by sorry

-- Marking tests reject the identity and a noninvolutory odd permutation.
example : (1 : Equiv.Perm (Fin 4)) ∉ symmetric_table_outside 2 := by sorry
example : (Equiv.swap 0 1 : Equiv.Perm (Fin 4)) ∈ symmetric_table_outside 2 := by sorry
example (σ : Equiv.Perm (Fin 4)) (hσ : orderOf σ = 4) :
    σ ∉ symmetric_table_outside 2 := by sorry

-- Wood (2019), Table 2, p.419: embedded S₄ and S₅ types.
theorem table_row_07 :
    Nonempty (table_row_certificate (symmetric_table_outside 2) (ZMod 1)) := by sorry
theorem table_row_28 :
    Nonempty (table_row_certificate (symmetric_table_outside 3) (ZMod 1)) := by sorry
end SymmetricTableFixtures

-- Wood (2019), Table 2, p.419: the full A₅ wreath product, with its
-- actual outside involutions. The two-element output retains its group law.
theorem table_row_29 :
    Nonempty (table_row_certificate
      (full_table_outside (alternatingGroup (Fin 5))) (ZMod 2)) := by sorry

instance order96_type_fintype : Fintype order96_type := by
  letI : Fintype Order96Kernel := Fintype.ofFinite _
  exact Fintype.ofEquiv (Order96Kernel × Two) SemidirectProduct.equivProd.symm

-- Row 08 retains the specified sum kernel and its ambient embedding.
theorem table_row_08 :
    Nonempty (table_row_certificate order96_outside_involutions (ZMod 2)) := by sorry

-- Strengthen the certificate output to expose the reported ordinary and
-- reduced kernels. All structures, maps and proofs are output obligations.
theorem order96_cover_certificate :
    ∃ C : table_row_certificate order96_outside_involutions (ZMod 2),
      C.coverOrder = 768 ∧
      (letI := C.coverGroup
       Nonempty (C.projection.ker ≃* (Fin 3 → Two)) ∧
       Nat.card (certificate_relation_subgroup C.cover) = 4 ∧
       Nat.card (C.projection.ker ⧸ certificate_relation_subgroup C.cover) = 2) := by sorry

/-! ### Remaining nonabelian table carriers
Wood (2019), §8.2, Table 2, p.419 and the embedding discussion p.420.
Each carrier specifies its embedding and outside marking. The arithmetic
classification remains in ST.3; all cover certificates are output targets.
-/

section SumKernelTableFixtures
variable (G : Type) [Group G]

-- The product of the abelianized coordinates is a homomorphism even
-- across the swap. Its kernel retains the actual ambient embedding.
def table_sum_map : FullTableWreath G →* Abelianization G := by sorry
lemma table_sum_map_apply (w : FullTableWreath G) :
    table_sum_map G w = Abelianization.of w.left.1 * Abelianization.of w.left.2 := by sorry
abbrev SumTableType := (table_sum_map G).ker
instance sum_table_fintype [Fintype G] : Fintype (SumTableType G) := by
  classical
  exact Fintype.ofFinite _
def sum_table_embedding : SumTableType G →* FullTableWreath G :=
  (table_sum_map G).ker.subtype
def sum_table_projection : SumTableType G →* Two :=
  SemidirectProduct.rightHom.comp (sum_table_embedding G)
def sum_table_outside : Set (SumTableType G) :=
  {x | sum_table_projection G x ≠ 1 ∧ orderOf x = 2}
lemma sum_table_mem (w : FullTableWreath G) :
    w ∈ (table_sum_map G).ker ↔
      Abelianization.of w.left.2 = (Abelianization.of w.left.1)⁻¹ := by sorry
lemma sum_table_embedding_injective : Function.Injective (sum_table_embedding G) := by sorry
lemma sum_table_projection_surjective : Function.Surjective (sum_table_projection G) := by sorry
lemma sum_table_outside_mem (x : SumTableType G) :
    x ∈ sum_table_outside G ↔
      x.val.right ≠ 1 ∧ x.val.left.2 = x.val.left.1⁻¹ := by sorry
lemma sum_table_card [Finite G] :
    Nat.card (SumTableType G) = 2 * Nat.card G * Nat.card (commutator G) := by sorry
lemma sum_table_marking_generates :
    Subgroup.closure (sum_table_outside G) = ⊤ := by sorry
lemma sum_table_one_class [Finite G] (hodd : Odd (Nat.card (Abelianization G)))
    (x y : SumTableType G) (hx : x ∈ sum_table_outside G)
    (hy : y ∈ sum_table_outside G) : IsConj x y := by sorry
lemma sum_table_marking_closed (a x : SumTableType G) (hx : x ∈ sum_table_outside G) :
    a*x*a⁻¹ ∈ sum_table_outside G := by sorry

-- Sum, rather than difference, is forced by the outside inverse pairs.
example : table_sum_map C3 1 = 1 := by sorry
example : table_sum_map C3
    (⟨(Multiplicative.ofAdd (1 : ZMod 3),Multiplicative.ofAdd (2 : ZMod 3)),1⟩ :
      FullTableWreath C3) = 1 := by sorry
example : table_sum_map C3
    (⟨(Multiplicative.ofAdd (1 : ZMod 3),Multiplicative.ofAdd (1 : ZMod 3)),1⟩ :
      FullTableWreath C3) ≠ 1 := by sorry
-- All three maps keep the actual two coordinates and quotient coordinate.
example (x : SumTableType G) : (sum_table_embedding G x).left = x.val.left := by sorry
example (x : SumTableType G) : (sum_table_embedding G x).right = x.val.right := by sorry
example (x y : SumTableType G) : sum_table_embedding G x = sum_table_embedding G y ↔ x = y := by sorry
example : sum_table_projection G 1 = 1 := by sorry
example (x : SumTableType G) (hx : x.val.right = 1) : sum_table_projection G x = 1 := by sorry
example (x : SumTableType G) (hx : x.val.right = Multiplicative.ofAdd (1 : ZMod 2)) :
    sum_table_projection G x = Multiplicative.ofAdd (1 : ZMod 2) := by sorry
example : (1 : SumTableType G) ∉ sum_table_outside G := by sorry
example (x : SumTableType G) (hx : x.val.right ≠ 1) (hpair : x.val.left.2 = x.val.left.1⁻¹) :
    x ∈ sum_table_outside G := by sorry
example (x : SumTableType G) (hpair : x.val.left.2 ≠ x.val.left.1⁻¹) :
    x ∉ sum_table_outside G := by sorry
-- Oddness is necessary for the one-class assertion, not generation.
example : ∃ x y : SumTableType Two,
    x ∈ sum_table_outside Two ∧ y ∈ sum_table_outside Two ∧ ¬ IsConj x y := by sorry
end SumKernelTableFixtures

section GraphTableFixtures
variable {G : Type} [Group G] (θ : MulAut G) (hθ : Function.Involutive θ)
def graph_table_action (θ : MulAut G) (hθ : Function.Involutive θ) : Two →* MulAut G := by sorry
lemma graph_table_action_apply (t : Two) (g : G) :
    graph_table_action θ hθ t g = if t = 1 then g else θ g := by sorry
abbrev GraphTableType := G ⋊[graph_table_action θ hθ] Two
instance graph_table_fintype [Fintype G] : Fintype (GraphTableType θ hθ) :=
  Fintype.ofEquiv (G × Two) SemidirectProduct.equivProd.symm
-- The graph is stable under swapping because θ²=id.
def graph_table_embedding : GraphTableType θ hθ →* FullTableWreath G := by sorry
lemma graph_table_embedding_apply (x : GraphTableType θ hθ) :
    (graph_table_embedding θ hθ x).left = (x.left,θ x.left) ∧
    (graph_table_embedding θ hθ x).right = x.right := by sorry
lemma graph_table_embedding_injective : Function.Injective (graph_table_embedding θ hθ) := by sorry
def graph_table_outside : Set (GraphTableType θ hθ) :=
  {x | x.right ≠ 1 ∧ orderOf x = 2}
lemma graph_table_outside_mem (x : GraphTableType θ hθ) :
    x ∈ graph_table_outside θ hθ ↔ x.right ≠ 1 ∧ θ x.left = x.left⁻¹ := by sorry
lemma graph_table_card [Finite G] : Nat.card (GraphTableType θ hθ) = 2 * Nat.card G := by sorry

example (g : G) : graph_table_action θ hθ 1 g = g := by sorry
example (g : G) : graph_table_action θ hθ (Multiplicative.ofAdd (1 : ZMod 2)) g = θ g := by sorry
example (g : G) : graph_table_action θ hθ (Multiplicative.ofAdd (1 : ZMod 2))
    (graph_table_action θ hθ (Multiplicative.ofAdd (1 : ZMod 2)) g) = g := by sorry
example : graph_table_embedding θ hθ 1 = 1 := by sorry
example (g : G) : (graph_table_embedding θ hθ (SemidirectProduct.inl g)).left = (g,θ g) := by sorry
example : (graph_table_embedding θ hθ
    (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)))).right =
      Multiplicative.ofAdd (1 : ZMod 2) := by sorry
example : (1 : GraphTableType θ hθ) ∉ graph_table_outside θ hθ := by sorry
example : (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)) :
    GraphTableType θ hθ) ∈ graph_table_outside θ hθ := by sorry
example (g : G) (hg : θ g ≠ g⁻¹) :
    (⟨g,Multiplicative.ofAdd (1 : ZMod 2)⟩ : GraphTableType θ hθ)
      ∉ graph_table_outside θ hθ := by sorry
end GraphTableFixtures

section AffineTableBases
-- Concrete permutations, with composition p(q(x)), use no SmallGroups oracle.
def table_affine {n : ℕ} (u : (ZMod n)ˣ) (b : ZMod n) : Equiv.Perm (ZMod n) := by sorry
lemma table_affine_apply {n : ℕ} (u : (ZMod n)ˣ) (b x : ZMod n) :
    table_affine u b x = u.val*x+b := by sorry
lemma table_affine_mul {n : ℕ} (u v : (ZMod n)ˣ) (b c : ZMod n) :
    table_affine u b * table_affine v c = table_affine (u*v) (b+u.val*c) := by sorry

def affine7_dilation : (ZMod 7)ˣ := ⟨2,4,by decide,by decide⟩
def affine9_dilation : (ZMod 9)ˣ := ⟨4,7,by decide,by decide⟩
abbrev Affine21 := Subgroup.closure
  ({table_affine (1 : (ZMod 7)ˣ) 1, table_affine affine7_dilation 0} : Set (Equiv.Perm (ZMod 7)))
abbrev Affine27 := Subgroup.closure
  ({table_affine (1 : (ZMod 9)ˣ) 1, table_affine affine9_dilation 0} : Set (Equiv.Perm (ZMod 9)))
instance affine21_fintype : Fintype Affine21 := by classical exact Fintype.ofFinite _
instance affine27_fintype : Fintype Affine27 := by classical exact Fintype.ofFinite _
lemma affine21_card : Nat.card Affine21 = 21 ∧ Nat.card (commutator Affine21) = 7 := by sorry
lemma affine27_card : Nat.card Affine27 = 27 ∧ Nat.card (commutator Affine27) = 3 := by sorry
lemma affine21_sum_marking : Nat.card (SumTableType Affine21) = 294 ∧
    Subgroup.closure (sum_table_outside Affine21) = ⊤ ∧
    ∀ x ∈ sum_table_outside Affine21, ∀ y ∈ sum_table_outside Affine21, IsConj x y := by sorry
lemma affine27_sum_marking : Nat.card (SumTableType Affine27) = 162 ∧
    Subgroup.closure (sum_table_outside Affine27) = ⊤ ∧
    ∀ x ∈ sum_table_outside Affine27, ∀ y ∈ sum_table_outside Affine27, IsConj x y := by sorry

example : table_affine (1 : (ZMod 7)ˣ) 0 = 1 := by sorry
example : table_affine (1 : (ZMod 7)ˣ) 1 (6 : ZMod 7) = 0 := by sorry
example : table_affine affine7_dilation 0 (3 : ZMod 7) = 6 := by sorry
example : orderOf (table_affine affine7_dilation 0) = 3 := by sorry
example : orderOf (table_affine affine9_dilation 0) = 3 := by sorry
example : table_affine affine9_dilation 0 (2 : ZMod 9) = 8 := by sorry
example : orderOf (table_affine (1 : (ZMod 7)ˣ) 1) = 7 := by sorry
example : table_affine affine7_dilation 0 * table_affine (1 : (ZMod 7)ˣ) 1 *
    (table_affine affine7_dilation 0)⁻¹ = table_affine (1 : (ZMod 7)ˣ) 2 := by sorry
example : Nat.card (SumTableType Affine21) ≠ 2 * Nat.card Affine21 := by sorry
example : orderOf (table_affine (1 : (ZMod 9)ˣ) 1) = 9 := by sorry
example : table_affine affine9_dilation 0 * table_affine (1 : (ZMod 9)ˣ) 1 *
    (table_affine affine9_dilation 0)⁻¹ = table_affine (1 : (ZMod 9)ˣ) 4 := by sorry
example : ∃ g : Affine27, orderOf g = 9 := by sorry

theorem table_row_13 :
    Nonempty (table_row_certificate (sum_table_outside Affine21) (ZMod 1)) := by sorry
theorem table_row_24 :
    Nonempty (table_row_certificate (sum_table_outside Affine27) (ZMod 1)) := by sorry
end AffineTableBases

section MatrixTableBases
abbrev SL23 := Matrix.SpecialLinearGroup (Fin 2) (ZMod 3)
abbrev SL32 := Matrix.SpecialLinearGroup (Fin 3) (ZMod 2)

-- Entrywise conjugation by diag(-1,1); the determinant remains one.
def sl23_involution : MulAut SL23 := by sorry
lemma sl23_involution_matrix (g : SL23) :
    ((sl23_involution g : SL23) : Matrix (Fin 2) (Fin 2) (ZMod 3)) =
      !![g.val 0 0, -g.val 0 1; -g.val 1 0, g.val 1 1] := by sorry
lemma sl23_involutive : Function.Involutive sl23_involution := by sorry
abbrev GL23Graph := GraphTableType sl23_involution sl23_involutive
-- Fix the identification, including the determinant coordinate.
def sl23_diagonal : Matrix.GeneralLinearGroup (Fin 2) (ZMod 3) := by sorry
lemma sl23_diagonal_matrix : sl23_diagonal.val = !![-1,0;0,1] := by sorry
def gl23_graph_equiv : GL23Graph ≃* Matrix.GeneralLinearGroup (Fin 2) (ZMod 3) := by sorry
lemma gl23_graph_equiv_apply (x : GL23Graph) :
    gl23_graph_equiv x = Matrix.SpecialLinearGroup.toGL x.left *
      (if x.right = 1 then 1 else sl23_diagonal) := by sorry
lemma sl23_table_cards : Nat.card SL23 = 24 ∧ Nat.card (commutator SL23) = 8 ∧
    Nat.card GL23Graph = 48 ∧ Nat.card (SumTableType SL23) = 384 := by sorry
lemma gl23_marking : Subgroup.closure (graph_table_outside sl23_involution sl23_involutive) = ⊤ ∧
    ∀ x ∈ graph_table_outside sl23_involution sl23_involutive,
      ∀ y ∈ graph_table_outside sl23_involution sl23_involutive, IsConj x y := by sorry
lemma sl23_sum_marking : Subgroup.closure (sum_table_outside SL23) = ⊤ ∧
    ∀ x ∈ sum_table_outside SL23, ∀ y ∈ sum_table_outside SL23, IsConj x y := by sorry

example : sl23_involution 1 = 1 := by sorry
example (g : SL23) : (sl23_involution g).val 0 1 = -g.val 0 1 := by sorry
example (g : SL23) : sl23_involution (sl23_involution g) = g := by sorry
example : sl23_diagonal * sl23_diagonal = 1 := by sorry
example : (Matrix.GeneralLinearGroup.det sl23_diagonal).val = -1 := by sorry
example : sl23_diagonal ≠ 1 := by sorry
example : gl23_graph_equiv 1 = 1 := by sorry
example (g : SL23) : gl23_graph_equiv (SemidirectProduct.inl g) =
    Matrix.SpecialLinearGroup.toGL g := by sorry
example : gl23_graph_equiv (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2))) =
    sl23_diagonal := by sorry

-- PSL(3,2)=SL(3,2): the center is trivial over F₂. Use the native SL carrier.
def sl32_graph_involution : MulAut SL32 := by sorry
lemma sl32_graph_involution_matrix (g : SL32) :
    (sl32_graph_involution g).val = (g⁻¹).val.transpose := by sorry
lemma sl32_graph_involutive : Function.Involutive sl32_graph_involution := by sorry
lemma sl32_table_structure : Nat.card SL32 = 168 ∧ commutator SL32 = ⊤ ∧
    Subgroup.center SL32 = ⊥ := by sorry
lemma sl32_graph_marking :
    Subgroup.closure (graph_table_outside sl32_graph_involution sl32_graph_involutive) = ⊤ ∧
    ∀ x ∈ graph_table_outside sl32_graph_involution sl32_graph_involutive,
      ∀ y ∈ graph_table_outside sl32_graph_involution sl32_graph_involutive, IsConj x y := by sorry
example : sl32_graph_involution 1 = 1 := by sorry
example (g : SL32) : sl32_graph_involution (sl32_graph_involution g) = g := by sorry
-- Inverse transpose preserves product order; transpose alone reverses it.
example (g h : SL32) : (sl32_graph_involution (g*h)).val =
    (sl32_graph_involution g).val * (sl32_graph_involution h).val := by sorry
example : Nat.card (GraphTableType sl32_graph_involution sl32_graph_involutive) = 336 := by sorry
example : Nat.card (FullTableWreath SL32) = 56448 := by sorry
example : Subgroup.closure (full_table_outside SL32) = ⊤ := by sorry

theorem table_row_16 : Nonempty (table_row_certificate
    (graph_table_outside sl23_involution sl23_involutive) (ZMod 1)) := by sorry
theorem table_row_17 : Nonempty (table_row_certificate (sum_table_outside SL23) (ZMod 1)) := by sorry
theorem table_row_30 : Nonempty (table_row_certificate
    (graph_table_outside sl32_graph_involution sl32_graph_involutive) (ZMod 1)) := by sorry
theorem table_row_31 : Nonempty (table_row_certificate (full_table_outside SL32) (ZMod 2)) := by sorry
end MatrixTableBases

section HeisenbergTableBases
-- Native upper unitriangular matrices, with coordinates (a,b,z).
def heisenberg_table_subgroup : Subgroup (Matrix.SpecialLinearGroup (Fin 3) (ZMod 3)) := by sorry
lemma heisenberg_table_mem (g : Matrix.SpecialLinearGroup (Fin 3) (ZMod 3)) :
    g ∈ heisenberg_table_subgroup ↔ ∃ a b z : ZMod 3,
      g.val = !![1,a,z;0,1,b;0,0,1] := by sorry
abbrev Heisenberg27 := heisenberg_table_subgroup
instance heisenberg27_fintype : Fintype Heisenberg27 := by classical exact Fintype.ofFinite _
def heisenberg_table_element (a b z : ZMod 3) : Heisenberg27 := by sorry
lemma heisenberg_table_element_matrix (a b z : ZMod 3) :
    (heisenberg_table_element a b z).val.val = !![1,a,z;0,1,b;0,0,1] := by sorry
lemma heisenberg_table_element_mul (a b z a' b' z' : ZMod 3) :
    heisenberg_table_element a b z * heisenberg_table_element a' b' z' =
      heisenberg_table_element (a+a') (b+b') (z+z'+a*b') := by sorry
lemma heisenberg_table_element_bijective : Function.Bijective
    (fun p : (ZMod 3 × ZMod 3) × ZMod 3 => heisenberg_table_element p.1.1 p.1.2 p.2) := by sorry
-- Conjugation by diag(-1,1,-1) negates a,b and fixes z.
def heisenberg_table_involution : MulAut Heisenberg27 := by sorry
lemma heisenberg_table_involution_apply (a b z : ZMod 3) :
    heisenberg_table_involution (heisenberg_table_element a b z) =
      heisenberg_table_element (-a) (-b) z := by sorry
lemma heisenberg_table_involutive : Function.Involutive heisenberg_table_involution := by sorry
lemma heisenberg_table_structure : Nat.card Heisenberg27 = 27 ∧
    Nat.card (commutator Heisenberg27) = 3 ∧ ∀ g : Heisenberg27, g^3 = 1 := by sorry
lemma heisenberg_graph_marking :
    Subgroup.closure (graph_table_outside heisenberg_table_involution heisenberg_table_involutive) = ⊤ ∧
    ∀ x ∈ graph_table_outside heisenberg_table_involution heisenberg_table_involutive,
      ∀ y ∈ graph_table_outside heisenberg_table_involution heisenberg_table_involutive, IsConj x y := by sorry
lemma heisenberg_sum_marking : Nat.card (SumTableType Heisenberg27) = 162 ∧
    Subgroup.closure (sum_table_outside Heisenberg27) = ⊤ ∧
    ∀ x ∈ sum_table_outside Heisenberg27, ∀ y ∈ sum_table_outside Heisenberg27, IsConj x y := by sorry

example : (1 : Matrix.SpecialLinearGroup (Fin 3) (ZMod 3)) ∈ heisenberg_table_subgroup := by sorry
example : ∀ g ∈ heisenberg_table_subgroup, g.val 2 0 = 0 := by sorry
example : ∀ g ∈ heisenberg_table_subgroup, g.val 1 1 = 1 := by sorry
example : heisenberg_table_element 0 0 0 = 1 := by sorry
example : heisenberg_table_element 1 0 0 * heisenberg_table_element 0 1 0 =
    heisenberg_table_element 1 1 1 := by sorry
example : heisenberg_table_element 0 1 0 * heisenberg_table_element 1 0 0 =
    heisenberg_table_element 1 1 0 := by sorry
example : heisenberg_table_involution (heisenberg_table_element 1 0 0) =
    heisenberg_table_element 2 0 0 := by sorry
example : heisenberg_table_involution (heisenberg_table_element 0 1 0) =
    heisenberg_table_element 0 2 0 := by sorry
example : heisenberg_table_involution (heisenberg_table_element 0 0 1) =
    heisenberg_table_element 0 0 1 := by sorry
-- The central coordinate of a marked element is forced by 2z=ab.
example : (⟨heisenberg_table_element 1 1 2, Multiplicative.ofAdd (1 : ZMod 2)⟩ :
    GraphTableType heisenberg_table_involution heisenberg_table_involutive)
      ∈ graph_table_outside heisenberg_table_involution heisenberg_table_involutive := by sorry
example : (⟨heisenberg_table_element 1 1 0, Multiplicative.ofAdd (1 : ZMod 2)⟩ :
    GraphTableType heisenberg_table_involution heisenberg_table_involutive)
      ∉ graph_table_outside heisenberg_table_involution heisenberg_table_involutive := by sorry
example : Nat.card (GraphTableType heisenberg_table_involution heisenberg_table_involutive) = 54 := by sorry

theorem table_row_22 : Nonempty (table_row_certificate
    (graph_table_outside heisenberg_table_involution heisenberg_table_involutive) (ZMod 1)) := by sorry
theorem table_row_23 : Nonempty (table_row_certificate
    (sum_table_outside Heisenberg27) (Fin 2 → ZMod 3)) := by sorry
end HeisenbergTableBases

end TauCeti.ReducedSchur
end
