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

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These admitted statements suggest Lean forms so contributors and reviewers converge on
names and signatures. The mathematical definitions and hypotheses in README.md govern these signatures.
An admitted proof does not assert that a target has been implemented.
-/
set_option linter.unusedVariables false
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
end TauCeti.ReducedSchur
end
