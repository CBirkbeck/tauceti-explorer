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

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These admitted statements suggest Lean forms so contributors and reviewers converge on
names and signatures. The mathematical definitions and hypotheses in README.md govern these signatures.
An admitted proof does not assert that a target has been implemented.
-/
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

end TauCeti.ReducedSchur
end
