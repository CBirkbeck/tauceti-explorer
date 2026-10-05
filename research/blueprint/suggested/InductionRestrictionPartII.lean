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
names and signatures. The packet and the name-complete omission ledger describe the
missing interfaces. No implementation or proof completion is asserted.
-/
set_option linter.unusedVariables false
noncomputable section
namespace TauCeti.ReducedSchur
open scoped BigOperators
open CategoryTheory

section Commutators
variable {A E G : Type} [Group A] [Group E] [Group G]
-- The parameter hcentral is a genuine condition on an existing extension, not a surrogate.
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
end Commutators

section IntegralHomology
variable {G : Type} [Group G]
-- This abbreviation imports the actual Mathlib carrier; it creates no substitute H₂.
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
-- The concrete quotient is used, rather than an admitted Type with fabricated instances.
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
end IntegralHomology

section Pullback
variable {E F B : Type} [Group E] [Group F] [Group B]
-- Native fiber-product subgroup. For the plan instantiate B=G^ab, E=S_c,
-- F=Multiplicative (D →₀ ℤ); the missing cover/class carrier remains in the ledger.
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

-- Native generic part of the parity rank count; the cover-to-column adapter is omitted.
theorem rank_parity_count {D W : Type} [Fintype D] [AddCommGroup W]
    [Module (ZMod 2) W] (L : (D → ZMod 2) →ₗ[ZMod 2] W) (v : D → ZMod 2) :
    Nat.card {x : D → ZMod 2 // L x = L v} =
      2 ^ (Fintype.card D - Module.finrank (ZMod 2) (LinearMap.range L)) := by sorry
-- Native algebraic fixed-fiber count, importing the existing fiber/ker equivalence.
theorem power_fiber_count {A : Type} [CommGroup A] [Finite A]
    (d : ℕ) (b h : A) (hh : h^d = b) :
    Nat.card {x : A // x^d=b} = Nat.card {x : A // x^d=1} := by sorry
lemma square_torsion_solvability {A : Type} [CommGroup A] (b : A) (r : ℕ) (hr : 0 < r) :
    (∃ h : A, h^(2*r)=b^r) ↔ ∃ h t : A, t^r=1 ∧ b=h^2*t := by sorry

end TauCeti.ReducedSchur

namespace TauCeti.ReducedSchur
noncomputable section
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
end
end TauCeti.ReducedSchur

namespace TauCeti.ReducedSchur
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
end TauCeti.ReducedSchur

namespace TauCeti.ReducedSchur
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
end TauCeti.ReducedSchur

-- BEGIN TAUCETI NATIVE SIGNATURES (not compiled: no exact-pin existing Tau Ceti build).
namespace TauCeti.ReducedSchur
open scoped BigOperators
noncomputable section
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
end SquareClasses
end
end TauCeti.ReducedSchur
-- END TAUCETI NATIVE SIGNATURES

/-!
## Native-signature and omission ledger

Every planned declaration and every API/test name appears below. A present signature
can cover only the indicated finite-level or generic algebraic part; it does not supply
the omitted cover, class quotient or homological adapter. Comments are not signatures.
The Mathlib-only excerpt was checked separately; the complete file, including the
Tau Ceti imports and block, was not compiled against an exact-pin Tau Ceti build.
-/
/-
InductionRestrictionPartII:RS.1/lift-commutator
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.lift_commutator
For a central GroupExtension A E G, commuting x,y∈G, and arbitrary lifts X,Y∈E, define κ_E(x,y)∈A by inl(κ_E(x,y))=XYX⁻¹Y⁻¹. Surjectivity supplies lifts, exactness gives kernel membership, and injectivity supplies a unique preimage. Centrality means inl(A)⊆Z(E).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.lift_commutator_inl
inl(κ_E(x,y))=XYX⁻¹Y⁻¹ for any lifts X,Y.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.lift_commutator_independent
Changing either lift by any kernel element leaves κ_E(x,y) unchanged.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.lift_commutator_swap
κ_E(y,x)=κ_E(x,y)⁻¹.
OMITTED SIGNATURE: TauCeti.ReducedSchur.lift_commutator_map
A map of central extensions sends κ_E(x,y) to κ_E′(f(x),f(y)) through its specified kernel map.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.lift_commutator_test_1
κ_E(1,y)=1.
OMITTED SIGNATURE: TauCeti.ReducedSchur.lift_commutator_test_2
In the split direct-product extension A×G→G, κ_E(x,y)=1 for every commuting pair.
OMITTED SIGNATURE: TauCeti.ReducedSchur.lift_commutator_test_3
For either D₈→C₂² or Q₈→C₂², lifts of two independent basis elements have commutator equal to the nonidentity central element.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.1/commuting-pair-cycle
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.commuting_pair_cycle
For xy=yx, [x|y]−[y|x] with integral coefficient 1 belongs to groupHomology.cycles₂ (Rep.trivial ℤ G ℤ). The orientation is x followed by y.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.1/homological-commutator
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.homological_commutator
For commuting x,y∈G define ⟨x,y⟩ as H2π applied to the oriented cycle [x|y]−[y|x], in M(G)=H₂(G,ℤ). Equivalently it is the image of the oriented generator of H₂(ℤ²,ℤ) under (a,b)↦xᵃyᵇ.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.homological_commutator_cycle
⟨x,y⟩=H2π([x|y]−[y|x]).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.homological_commutator_swap
⟨y,x⟩=−⟨x,y⟩.
OMITTED SIGNATURE: TauCeti.ReducedSchur.homological_commutator_map
For any f:G→H, f_*(⟨x,y⟩)=⟨f(x),f(y)⟩.
OMITTED SIGNATURE: TauCeti.ReducedSchur.homological_commutator_central_extension
The UCT class map τ_E sends ⟨x,y⟩ to κ_E(x,y), using the XYX⁻¹Y⁻¹ convention.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.homological_commutator_test_1
⟨1,y⟩=0, since the displayed cycle is a boundary.
OMITTED SIGNATURE: TauCeti.ReducedSchur.homological_commutator_test_2
For G=C₂² and independent x,y, ⟨x,y⟩ is the nonzero element of M(G)≅C₂.
OMITTED SIGNATURE: TauCeti.ReducedSchur.homological_commutator_test_3
For G=ℤ² the ordered basis gives the positive generator; swapping gives its negative, not the same integer.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.1/schur-relations
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.schur_relations
For conjugacy-invariant c⊆G set Q_c to the additive subgroup of M(G) generated by ⟨x,y⟩ with x∈c and y∈C_G(x). No generation or rationality hypothesis on c is needed for this quotient.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.schur_relations_mem
x∈c and xy=yx imply ⟨x,y⟩∈Q_c.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.schur_relations_le
Q_c≤B iff every specified commuting-pair class lies in B.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.schur_relations_mono
c⊆d implies Q_c≤Q_d.
OMITTED SIGNATURE: TauCeti.ReducedSchur.schur_relations_map
f(c)⊆d implies f_*(Q_c)⊆Q_d.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.schur_relations_test_1
Q_∅=0.
OMITTED SIGNATURE: TauCeti.ReducedSchur.schur_relations_test_2
For C₂² and c={x} with x nonzero, Q_c=M(C₂²).
OMITTED SIGNATURE: TauCeti.ReducedSchur.schur_relations_test_3
For c=∅ in C₂² the quotient retains C₂; it must not be forced trivial by relations from x outside c.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.1/reduced-multiplier
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.reduced_multiplier
Define M(G,c)=H₂(G,c)=M(G)/Q_c as the additive group quotient of the existing integral H₂ carrier. It depends functorially on (G,c) under f(c)⊆d and is independent of a Schur-cover choice.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.reduced_multiplier_mk
The quotient map M(G)→M(G,c) is onto with kernel Q_c.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.reduced_multiplier_lift
Maps M(G,c)→B correspond to additive maps M(G)→B vanishing on Q_c.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_multiplier_map
An f with f(c)⊆d gives M(G,c)→M(H,d), with identity and composition laws.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.reduced_multiplier_empty
M(G,∅)≅M(G), through the quotient by the zero subgroup.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.reduced_multiplier_test_1
M(1,c)=0 for either allowed c.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.reduced_multiplier_test_2
For finite cyclic G and any c, M(G,c)=0.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.reduced_multiplier_test_3
M(C₂²,∅)≅C₂ but M(C₂²,{x})=0 for x≠1.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.1/reduced-cover
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover
Given a chosen ordinary Schur cover π:S→G and its oriented class isomorphism τ_S:M(G)≅kerπ, define S_c=S/τ_S(Q_c). Retain π, τ_S and the cover choice as parameters. The descended π_c:S_c→G is a central surjection with kernel canonically identified with M(G,c) for these data.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover_projection
π_c∘quotient=π.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover_kernel
The induced τ_c:M(G,c)≅kerπ_c commutes with the quotient from M(G).
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover_commute
Lifts of x∈c and y∈C_G(x) commute in S_c.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover_stem
The map S_c^ab→G^ab is an isomorphism, inherited from the ordinary stem cover.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover_test_1
For c=∅ the quotient is the chosen S itself.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover_test_2
For G=C₂² and c all nonidentity elements, either D₈ or Q₈ reduces to G.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_cover_test_3
For c=∅ the two reduced covers D₈ and Q₈ of C₂² are nonisomorphic: there is no canonical reduced extension determined by G,c.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/centralizer-lifts
OMITTED SIGNATURE: TauCeti.ReducedSchur.centralizer_lifts
In a reduced cover S_c→G, if x∈c and y∈C_G(x), any lifts X,Y commute. Consequently C_{S_c}(X)→C_G(x) is surjective.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/conjugacy-bijection
OMITTED SIGNATURE: TauCeti.ReducedSchur.conjugacy_bijection
Every conjugacy class in S_c with image contained in c∪{1} maps bijectively to its image conjugacy class in G. No uniqueness is asserted for which class above a class of c is chosen.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/class-compatible-marking
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking
For one representative x_d in each d∈D=c/G, choose a lift X_d∈S_c. Define x̂ for x=gx_dg⁻¹ by a lifted conjugator g̃X_dg̃⁻¹. This is independent of g and g̃ but retains the initial representative-lift choices.
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_over
π_c(x̂)=x.
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_conj
The lift of gxg⁻¹ equals g̃x̂g̃⁻¹ for any lift g̃.
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_rep
The marking takes x_d to the chosen X_d.
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_change
Changing X_d by a_d∈M(G,c) changes every marked lift in d by the same central a_d.
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_test_1
If c=∅, the marking is the unique empty function.
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_test_2
For a cyclic group with its identity reduced cover, marking is the inclusion on c.
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_test_3
For nonempty c and nontrivial reduced kernel A, multiplying the chosen lift of one class by a nonidentity a∈A gives a different marking; the class-compatible construction does not erase this choice.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/local-class-normalization
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization
Assume c is one conjugacy class, choose c₀∈c, and let E=S_c. For e with π_c(e)∈c∪{1}, define z(e) to be the unique element in its conjugacy class mapping to c₀ if π_c(e)∈c, and e itself if π_c(e)=1.
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization_image
π_c(z(e)) is c₀ or 1 according to the branch.
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization_conj
z(e) lies in the conjugacy class of e and is invariant under conjugating e.
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization_fixed
If π_c(e)∈{1,c₀}, z(e)=e.
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization_test_1
For a kernel element a, z(a)=a.
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization_test_2
For S₃ with c the transpositions and c₀=(12), z((23))=(12) in its identity reduced cover.
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization_test_3
For several conjugacy classes c, one c₀ cannot normalize elements from all classes; the single-class hypothesis is essential.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/local-factors-commute
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_factors_commute
Any two elements of a central extension mapping to {1,c₀} commute. In particular all z(e) in the preceding single-class construction commute.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/homology-image
OMITTED SIGNATURE: TauCeti.ReducedSchur.homology_image
For π_c:S_c→G, im(H₂(S_c,ℤ)→M(G))=Q_c. Thus the composite H₂(S_c,ℤ)→M(G)→M(G,c) is zero. The equality uses the central-extension homological five-term exact sequence; the zero composite alone also follows by UCT naturality and the diagonal splitting.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/homology-composite-zero
OMITTED SIGNATURE: TauCeti.ReducedSchur.homology_composite_zero
The composite H₂(S_c,ℤ)→M(G)→M(G,c) is zero.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/marked-extension
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_extension
For conjugacy-invariant generating c⊆G, a c-marked central extension is a GroupExtension A E G with central kernel and a section s:c→E such that s(gxg⁻¹)=e s(x)e⁻¹ whenever π(e)=g. Its marked subset s(c) maps bijectively to c. A morphism is a group homomorphism over G preserving s; a kernel identification need not be fixed.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_extension_section
π(s(x))=x for x∈c.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_extension_conjugation
Any e over g conjugates s(x) to s(gxg⁻¹).
OMITTED SIGNATURE: TauCeti.ReducedSchur.marked_extension_hom
A marked morphism f satisfies π′∘f=π and f(s(x))=s′(x).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_extension_subset
The section formulation is equivalent to a conjugacy-invariant marked subset mapping bijectively to c.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.marked_extension_test_1
For G=1,c=∅, any central extension A→A→1 has the empty marking.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.marked_extension_test_2
The identity extension G→G has its inclusion marking.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.marked_extension_test_3
The quotient C₄→C₂ is marked on its nontrivial class using a lift of order 4; the marking is a set-section, not a splitting homomorphism.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.2/universal-presentation
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_presentation
For conjugacy-invariant generating c⊆G, U(G,c) is PresentedGroup on the subtype c, with relation words [x][y][x]⁻¹[xyx⁻¹]⁻¹ for x,y∈c. Write [x] for the canonical generator. The map π_U:U→G sends [x] to x.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_presentation_gen
For x∈c, [x] is the image of its FreeGroup generator.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_presentation_relation
[x][y][x]⁻¹=[xyx⁻¹].
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_presentation_projection
π_U([x])=x.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_presentation_lift
A generator map into E satisfying the conjugation relations extends uniquely to a homomorphism U→E.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_presentation_test_1
U(1,∅)=1, the group on no generators.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_presentation_test_2
For C₂ and its nonidentity singleton c, U≅ℤ and π_U is reduction modulo 2.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_presentation_test_3
Do not impose [x]^ord(x)=1: that would turn this C₂ example into C₂ rather than ℤ.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.2/word-conjugation
OMITTED SIGNATURE: TauCeti.ReducedSchur.word_conjugation
For w=[g₁]^a₁⋯[g_k]^a_k and x∈c, w[x]w⁻¹=[π_U(w)xπ_U(w)⁻¹]. The inverse word is [g_k]^−a_k⋯[g₁]^−a₁.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/universal-central
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_central
If c generates G, π_U is onto and kerπ_U⊆Z(U); x↦[x] is a conjugacy-equivariant section on c.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.2/universal-marked-property
OMITTED SIGNATURE: TauCeti.ReducedSchur.universal_marked_property
For every c-marked central extension E→G there is exactly one marked morphism U(G,c)→E. Therefore any two universal marked extensions are uniquely isomorphic through their markings.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/class-degree-map
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.class_degree_map
Let D=c/G and L=D→₀ℤ. Define δ:L→Additive(G^ab) by δ(e_d)=Additive.ofMul(Abelianization.of(x_d)); conjugate representatives give the same value. It is onto when c generates G.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.class_degree_map_basis
δ(e_[x])=Additive.ofMul(Abelianization.of(x)).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.class_degree_map_surjective
δ is onto when c generates G.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.class_degree_map_compatible
The relation δ(deg(u))=Additive.ofMul(Abelianization.of(π_U(u))) is supplied by the separate universal-degree node.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.class_degree_map_integer
δ accepts arbitrary integer coefficients; δ(−e_[x]) is the negative of the abelianized image of x.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.class_degree_map_test_1
For C₂ with one nonidentity class, δ:ℤ→C₂ is reduction mod 2.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.class_degree_map_test_2
For c=∅, L=0 and δ is the zero map.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.class_degree_map_test_3
δ(−e_[x]) is defined even though −e_[x] lies outside the nonnegative degree cone.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.2/marked-fiber-product
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_fiber_product
For a chosen reduced cover S_c→G, define P=S_c×_{G^ab}Multiplicative(ℤ^D), the subgroup of S_c×Multiplicative L of pairs (h,m) with [π_c(h)]=δ(m). Give it the marking x↦(x̂,e_[x]) from the class-compatible lifts.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_fiber_product_first
P→S_c is a surjective group homomorphism when c generates G.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_fiber_product_degree
P→Multiplicative L sends (h,m) to m.
OMITTED SIGNATURE: TauCeti.ReducedSchur.marked_fiber_product_mark
For x∈c, the marked point is (x̂,e_[x]).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marked_fiber_product_membership
A pair belongs precisely when [π_c(h)]=δ(m).
OMITTED SIGNATURE: TauCeti.ReducedSchur.marked_fiber_product_test_1
For C₂ and singleton c, P={(g,n):g=n mod 2}≅ℤ.
OMITTED SIGNATURE: TauCeti.ReducedSchur.marked_fiber_product_test_2
For G=1,c=∅ and the trivial Schur cover, P=1.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.marked_fiber_product_test_3
For C₂ the pair (nonidentity,0) is absent, so P is not the full direct product C₂×ℤ.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.2/fiber-product-commutator
OMITTED SIGNATURE: TauCeti.ReducedSchur.fiber_product_commutator
[P,P]=[S_c,S_c]×{0}, as a subgroup of S_c×Multiplicative L.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/fiber-product-abelianization
OMITTED SIGNATURE: TauCeti.ReducedSchur.fiber_product_abelianization
The degree projection induces P^ab≅Multiplicative(ℤ^D), taking the class of (x̂,e_[x]) to e_[x].
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/presentation-abelianization
OMITTED SIGNATURE: TauCeti.ReducedSchur.presentation_abelianization
The degree map identifies U(G,c)^ab with Multiplicative(ℤ^D).
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/marked-pullback-split
OMITTED SIGNATURE: TauCeti.ReducedSchur.marked_pullback_split
For a marked central extension E→G, its pullback along P→G has a group-homomorphic splitting. This statement allows arbitrary abelian kernel A, including the infinite kernel of U→G.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/marking-correction
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marking_correction
Suppose φ:P→E is a homomorphism over G and φ(x̂,e_[x])=s(x)k_x with k_x∈A. The discrepancy depends only on [x]. Let ψ:P→A be the homomorphism factoring through deg:P→ℤ^D with ψ(e_[x])=k_x. Define φ_corr(p)=φ(p) inl(ψ(p))⁻¹.
OMITTED SIGNATURE: TauCeti.ReducedSchur.marking_correction_over
φ_corr has the same projection to G as φ.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marking_correction_mark
φ_corr(x̂,e_[x])=s(x).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marking_correction_hom
φ_corr(pq)=φ_corr(p)φ_corr(q).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.marking_correction_sign
The correcting factor is ψ⁻¹ when the recorded discrepancy is φ(mark)=s·ψ.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.marking_correction_test_1
If all k_x=1 then φ_corr=φ.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.marking_correction_test_2
In an additive C₃ kernel with discrepancy 1, subtraction gives 0 while addition gives 2.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.marking_correction_test_3
Multiplying φ by ψ instead sends a marked point to s(x)k_x² and fails for a kernel element of order 3.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.2/fiber-product-universal
OMITTED SIGNATURE: TauCeti.ReducedSchur.fiber_product_universal
For every marked E→G there is a unique marked morphism P→E.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/presentation-comparison
OMITTED SIGNATURE: TauCeti.ReducedSchur.presentation_comparison
There is a unique marked isomorphism U(G,c)≅P sending [x] to (x̂,e_[x]), compatible with projections and degree. It transports changes of cover and marking choice through the presentation; no canonical isomorphism S_c≅S′_c is asserted.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/universal-kernel
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_kernel
Define K(G,c)=ker(π_U:U→G), using the existing kernel subgroup. Under U≅P it is M(G,c)×ker(δ:L→G^ab). It is central and commutative, even though U generally is not. There is an exact sequence 0→M(G,c)→K→kerδ→0.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_kernel_inclusion
K→U is the native subgroup inclusion; all its elements commute with U.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_kernel_degree
The degree image of K is exactly kerδ.
OMITTED SIGNATURE: TauCeti.ReducedSchur.universal_kernel_torsion
The torsion subgroup of K is M(G,c), since kerδ is free abelian.
OMITTED SIGNATURE: TauCeti.ReducedSchur.universal_kernel_product
In chosen cover coordinates K≅M(G,c)×kerδ, without a preferred basis for kerδ.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_kernel_test_1
For G=C₂,c={nonidentity}, K=2ℤ inside U=ℤ.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_kernel_test_2
For G=1,c=∅, K=1.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_kernel_test_3
K is not the finite reduced multiplier in the C₂ example: it is infinite even though M(C₂,c)=0.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.3/finite-power
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.finite_power
Let G be finite, p prime with p∤|G| (or characteristic zero). A unit α of the prime-to-p profinite integers acts on the underlying set of G by g↦g^a, where a is its coordinate modulo ord(g). This is independent of the integer representative and factors through units modulo any positive common exponent of G.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.finite_power_residue
Congruent exponents modulo ord(g) give the same value.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.finite_power_one
The unit 1 fixes g and every unit fixes 1_G.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.finite_power_compose
α*(β*g)=(αβ)*g for the finite power action.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.finite_power_commutative
On an abelian finite G, each unit acts by a group automorphism; no such law is asserted on general G.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_power_test_1
On C₃, the residue 2 interchanges the two nonidentity elements.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.finite_power_test_2
The trivial group has the trivial action.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.finite_power_test_3
In S₃, inversion (residue −1) fixes the transpositions (12),(23) but reverses their 3-cycle product, so it is not a group homomorphism.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.3/degree-permutation
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation
Assume c is also closed under invertible powers. Powering induces a permutation d↦d^α of D=c/G. Define m^α on L=ℤ^D by m^α(d^α)=m(d); it is a coordinate permutation, not multiplication of each integer coordinate by α.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation_basis
(e_d)^α=e_{d^α}.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation_sum
Σ_d m^α(d)=Σ_d m(d).
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation_lower_bound
All coordinates ≥M before permutation iff they are ≥M afterwards.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation_abelianization
δ(m^α)=δ(m)^α in the multiplicative abelianized notation.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation_test_1
For m=0, m^α=0.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation_test_2
For c the two nonidentity elements in C₃, α=2 swaps coordinates (1,4) to (4,1).
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_permutation_test_3
For an involution singleton class, every unit fixes degree 1; integer scalar multiplication by an odd α=3 would instead give 3.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.3/central-power-correction
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction
Fix class-compatible marked lifts x̂ in S_c. For a class d with representative x_d define z_d(α)=x̂_d^−α · widehat(x_d^α)∈A=M(G,c). Extend to W_α:L→A by W_α(m)=∏_d z_d(α)^m(d). Powers of finite-cover elements are read at a finite residue level, whereas m(d) remains an integer.
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction_basis
W_α(e_d)=z_d(α).
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction_add
W_α(m+n)=W_α(m)W_α(n).
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction_identity
W_1(m)=1.
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction_choice
For marking change x̂_d′=x̂_d a_d, z_d′(α)=a_d^−α z_d(α) a_{d^α}; corresponding fiber-product coordinates transport the action.
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction_test_1
W_α(0)=1.
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction_test_2
For α=1 every correction equals 1.
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_power_correction_test_3
For an involution x with chosen lift X and X²≠1, its correction at α=−1 equals X²≠1; the formula must not discard central lift squares.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.3/correction-cocycle
OMITTED SIGNATURE: TauCeti.ReducedSchur.correction_cocycle
W_{αβ}(m)=W_β(m)^α W_α(m^β) for all m∈L.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.3/discrete-action
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action
For P=S_c×_{G^ab}L define α*(h,m)=(h^α W_α(m),m^α). This defines a group action on the underlying set P, and hence on U through the marked comparison. Its projection to G is the ordinary power permutation and its degree projection is the class-degree permutation.
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action_formula
The two coordinates are h^α W_α(m) and m^α.
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action_projection
π_U(α*u)=π_U(u)^α.
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action_degree
deg(α*u)=deg(u)^α.
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action_choice
The unique marked comparison between chosen models intertwines their discrete set actions.
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action_test_1
The identity unit acts identically and all units fix 1_U.
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action_test_2
For U(C₂,c)≅ℤ, the action is trivial because its generator and its unique class are fixed after correction.
OMITTED SIGNATURE: TauCeti.ReducedSchur.discrete_action_test_3
For S₃ and all transpositions, α=−1 is not multiplicative on U: its projection fixes both marked transpositions but inverts their 3-cycle product.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.3/kernel-action-aut
OMITTED SIGNATURE: TauCeti.ReducedSchur.kernel_action_aut
Each unit acts by a group automorphism on K(G,c). In cover coordinates h lies in the commutative central A, so α*(hh′,m+m′)=α*(h,m)α*(h′,m′). This statement does not extend to all U.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.3/finite-level-action
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_level_action
For a finite G, α≡β modulo |G|² implies α* and β* agree on every element of U(G,c). The same holds for K and its degree lattice.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.3/cyclotomic-twist
OMITTED SIGNATURE: TauCeti.ReducedSchur.cyclotomic_twist
For a unit group B, a nonempty simply transitive B-set T and a B-set X, define X⟨−1⟩=Map_B(T,X), the set of equivariant functions. Evaluation at a chosen t₀∈T is a bijection to X; this bijection depends on t₀. For the papers T is the torsor of topological generators of prime-to-characteristic roots of unity.
OMITTED SIGNATURE: TauCeti.ReducedSchur.cyclotomic_twist_evaluation
Evaluation at t₀ gives X⟨−1⟩≅X.
OMITTED SIGNATURE: TauCeti.ReducedSchur.cyclotomic_twist_change
Changing t₀ to b·t₀ changes the evaluated value by b acting on X.
OMITTED SIGNATURE: TauCeti.ReducedSchur.cyclotomic_twist_map
An equivariant map X→Y induces X⟨−1⟩→Y⟨−1⟩ by composition.
OMITTED SIGNATURE: TauCeti.ReducedSchur.cyclotomic_twist_test_1
For singleton X, the twist is singleton.
OMITTED SIGNATURE: TauCeti.ReducedSchur.cyclotomic_twist_test_2
For B=C₂ acting regularly on X=C₂ and T=C₂, there are two equivariant functions.
OMITTED SIGNATURE: TauCeti.ReducedSchur.cyclotomic_twist_test_3
Replacing equivariant maps by arbitrary maps gives four maps in that C₂ example; replacing them by fixed points gives none.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.3/bounded-degree-slice
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.bounded_degree_slice
For finite D, n∈ℕ and M∈ℕ define L_{n,≥M}={m∈ℤ^D: every m(d)≥M and Σ m(d)=n}. Define K_{n,≥M} as its degree preimage and the twisted slice as equivariant functions valued in this invariant subset. For the notation of LWZB M is positive; M=0 is also allowed for component tuples.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.bounded_degree_slice_mem
Membership means both the coordinate lower bound and exact total sum.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.bounded_degree_slice_invariant
Each power permutation preserves the slice.
OMITTED SIGNATURE: TauCeti.ReducedSchur.bounded_degree_slice_preimage
K_{n,≥M}⟨−1⟩ is the preimage under the twisted degree map.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.bounded_degree_slice_test_1
For D empty, the slice is singleton at n=0 and empty at n>0.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.bounded_degree_slice_test_2
For |D|=2,n=3,M=1, the slice consists of (1,2),(2,1).
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.bounded_degree_slice_test_3
For nonempty D,n=0,M=1, the slice is empty; it is never declared a group containing zero.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.3/power-fixed-degree
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.power_fixed_degree
For q prime to |G| define L_{≡q}={m∈ℤ^D:m(d^q)=m(d) for all d}. Its n,≥M slice adds the lower-bound and exact total-degree conditions.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.power_fixed_degree_fixed
L_{≡q} consists precisely of q-fixed degree vectors.
OMITTED SIGNATURE: TauCeti.ReducedSchur.power_fixed_degree_orbits
Choose one coordinate per q-power orbit; this identifies L_{≡q} with ℤ^{D/⟨q⟩}.
OMITTED SIGNATURE: TauCeti.ReducedSchur.power_fixed_degree_weighted_sum
Under this identification, total degree is Σ_O |O|m_O, not the unweighted sum.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.power_fixed_degree_test_1
At q≡1 modulo the exponent of G, L_{≡q}=L.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.power_fixed_degree_test_2
For the two nontrivial classes of C₃ and q=2, L_{≡q}={(a,a):a∈ℤ}; total degree is 2a.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.power_fixed_degree_test_3
For this C₃ example, a total-degree-1 fixed slice is empty despite a nonempty unconstrained slice.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.4/involution-square-central
OMITTED SIGNATURE: TauCeti.ReducedSchur.involution_square_central
Assume c consists of involutions. For x∈c every lift X∈S_c has X²∈A=M(G,c), hence X² commutes with S_c.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/square-obstruction
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.square_obstruction
Assume finite G is generated by involution classes c_i, A=M(G,c), chosen class lifts X_i, and g∈c∪{1} with lift Y (Y=1 for g=1). For an integer degree m with Σ_i m_i[c_i]=[g] in G^ab, define b(g,m)=Y²∏_i(X_i²)^−m_i∈A and β(g,m) as its class in TauCeti.ElementaryTwoQuotient A. Lift changes multiply b by a square; β depends only on the parity of m.
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.square_obstruction_representative
b(g,m)=Y²∏_i(X_i²)^−m_i.
OMITTED SIGNATURE: TauCeti.ReducedSchur.square_obstruction_choice
β is independent of lift choices; b generally is not.
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.square_obstruction_parity
Changing each m_i by an even integer leaves β unchanged.
OMITTED SIGNATURE: TauCeti.ReducedSchur.square_obstruction_compatibility
The domain first requires δ(m)=[g]; incompatible fibers are empty before this obstruction is considered.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.square_obstruction_test_1
For g=1 and m=0, β=0.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.square_obstruction_test_2
For g∈c_k and m=e_k, β=0.
OMITTED SIGNATURE: TauCeti.ReducedSchur.square_obstruction_test_3
A degree incompatible with [g] cannot acquire a nonempty fiber merely because the formal square product is a square.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.4/fixed-fiber-equation
OMITTED SIGNATURE: TauCeti.ReducedSchur.fixed_fiber_equation
For the hypotheses of square-obstruction and odd q coprime to |G|, let r=(q−1)/2. Writing a fiber point as (Yh,m), the q-fixed equation is h^{q−1}=b(g,m)^{−r}. Since the power subgroup is closed under inversion, solvability is equivalent to b(g,m)^r∈A^{2r}.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/all-fixed-fibers
OMITTED SIGNATURE: TauCeti.ReducedSchur.all_fixed_fibers
For odd q>1 prime to |G|, the fiber over (g,m) has |A[q−1]| fixed points if δ(m)=[g] and b(g,m)^r∈A^{2r}, and zero otherwise. The q and q⁻¹ actions have the same fixed points. No nonnegativity of m is needed for this group-theoretic statement.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/odd-parity-fiber
OMITTED SIGNATURE: TauCeti.ReducedSchur.odd_parity_fiber
If g∈c_k, m_k is odd and all other m_i are even, then the fiber is compatible and its fixed count is |A[q−1]|.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/even-parity-fiber
OMITTED SIGNATURE: TauCeti.ReducedSchur.even_parity_fiber
If g=1 and every m_i is even, then the compatible fiber has exactly |A[q−1]| fixed points.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/square-torsion-solvability
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.square_torsion_solvability
For a commutative group A, b∈A and r≥1, b^r∈A^{2r} iff b∈A²·A[r].
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.4/torsion-image-filtration
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.torsion_image_filtration
For a finite abelian A let B=TauCeti.ElementaryTwoQuotient A. Define B_t to be the image in B of A[2^t]=ker(powMonoidHom(2^t)), regarded as a ZMod 2 subspace. B_0=0; the filtration is increasing and B_e=B when the 2-primary exponent is 2^e.
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.torsion_image_filtration_zero
B_0=0, since A[1]={1}.
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.torsion_image_filtration_mono
t≤u implies B_t≤B_u.
OMITTED SIGNATURE: TauCeti.ReducedSchur.torsion_image_filtration_exhaustive
B_e=B for 2-primary exponent 2^e.
OMITTED SIGNATURE: TauCeti.ReducedSchur.torsion_image_filtration_cyclic
For A=C_{2^e}, B_t=0 for t<e and B_t=B for t≥e.
OMITTED SIGNATURE: TauCeti.ReducedSchur.torsion_image_filtration_test_1
For A of odd order, B_t=0=B for every t.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.torsion_image_filtration_test_2
For A=C₈, the filtration is zero at t=0,1,2 and all C₂ at t=3.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.torsion_image_filtration_test_3
In C₈, the nontrivial 2-torsion element is a square, so its image in B_1 is zero; the quotient is not the torsion subgroup.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.4/obstruction-threshold
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.obstruction_threshold
For b∈finite abelian A with 2-primary exponent 2^e define t_A(b)=min{t≥0: the class of b belongs to B_t}. It lies between 0 and e. It depends only on the square class, and equals max{e_j : b has odd coordinate in a cyclic factor C_{2^{e_j}}} (empty maximum 0).
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.obstruction_threshold_zero
t_A(b)=0 iff b is a square.
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.obstruction_threshold_class
Equal square classes have equal thresholds.
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.obstruction_threshold_bound
0≤t_A(b)≤e.
PARTIAL NATIVE (Tau Ceti block, uncompiled): TauCeti.ReducedSchur.obstruction_threshold_cyclic
For a generator of C_{2^e}, e>0, t_A(b)=e.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.obstruction_threshold_test_1
t_A(1)=0.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.obstruction_threshold_test_2
For b=(generator,1) in C₄×C₈, the threshold is 2.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.obstruction_threshold_test_3
For a generator in C₈ the threshold is 3, not 1 despite its nonzero image in a one-dimensional square quotient.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.4/two-adic-survival
OMITTED SIGNATURE: TauCeti.ReducedSchur.two_adic_survival
For odd q>1 prime to |G| and compatible degree m, the fixed fiber is nonempty iff v₂(q−1)≥t_A(b(g,m))+1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/involution-abelianization
OMITTED SIGNATURE: TauCeti.ReducedSchur.involution_abelianization
If c consists of N generating involution classes, G^ab is an elementary abelian 2-group. There is a surjective F₂-linear map a:F₂^N→Additive(G^ab), a(e_i)=[c_i].
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/lift-square-columns
OMITTED SIGNATURE: TauCeti.ReducedSchur.lift_square_columns
For each involution class c_i, the class s_i of X_i² in B=A/A² is independent of both the lift and the representative in c_i.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/parity-square-map
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_square_map
With V=F₂^N, the already constructed a:V→Additive(G^ab), and B=TauCeti.ElementaryTwoQuotient A, define s:V→B by the lift-square columns s(e_i)=s_i. Extend only on the free vector space, not on G or S_c.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_square_map_basis_s
s(e_i)=class(X_i²).
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_square_map_linear
Both maps preserve addition and F₂ scalar multiplication.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_square_map_quotient
s uses the existing TauCeti elementary-2 quotient of A.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_square_map_test_1
a(0)=0 and s(0)=0.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_square_map_test_2
For S₃ transpositions and its identity reduced cover, V=U=F₂, a=id, B=0 and s=0.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_square_map_test_3
For a group with two classes having the same abelianized image, a(e₁+e₂)=0 even though e₁+e₂≠0.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/affine-compatible-parities
OMITTED SIGNATURE: TauCeti.ReducedSchur.affine_compatible_parities
For g=1 set v_g=0; for g∈c_k set v_g=e_k. Compatible ε are exactly v_g+ker a, and β(g,ε)=s(v_g+ε).
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/joint-parity-map
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.joint_parity_map
Put U_ab=Additive(G^ab), with its elementary-2 vector-space structure. For t≥0 define the linear map L_t:V→U_ab⊕(B/B_t), v↦(a(v),s(v) mod B_t). Its kernel consists of degree parities compatible with the identity and with square obstruction in B_t.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.joint_parity_map_apply
L_t(v)=(a(v),class(s(v)) in B/B_t).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.joint_parity_map_kernel
v∈kerL_t iff a(v)=0 and s(v)∈B_t.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.joint_parity_map_mono_kernel
t≤u implies kerL_t⊆kerL_u.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.joint_parity_map_last
At t=e, kerL_e=ker a.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.joint_parity_map_test_1
L_t(0)=0.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.joint_parity_map_test_2
For a=0,s=id on F₂ and B_t=0, kerL_t=0; when B_t=B, kerL_t=F₂.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.joint_parity_map_test_3
Using only a misses the obstruction in the first of those cases.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.4/surviving-parities
OMITTED SIGNATURE: TauCeti.ReducedSchur.surviving_parities
If v₂(q−1)=t+1, the parities giving nonempty fixed fibers are C_t^g=v_g+kerL_t. Each corresponding compatible integer-degree fiber has |A[q−1]| fixed points.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/rank-parity-count
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.rank_parity_count
|C_t^g|=2^{N−rankL_t}. For K_t=2^{N−rankL_t} and K_{−1}=0, the number of compatible parities with exact threshold t is K_t−K_{t−1}. Real and imaginary signatures have equal parity cardinalities, without an asserted equality of weights.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.4/parity-weight-enumerator
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_weight_enumerator
For C_t^g⊆F₂^N and lower bound N₀≥0, set δ=N₀ mod 2 and W_t^g(X)=Σ_{ε∈C_t^g} X^{wt(ε+δ·1)}∈ℕ[X]. The exponent is the excess above the coordinate lower bound of the least nonnegative degree of parity ε.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_weight_enumerator_coefficient
The coefficient of X^j is the number of ε with wt(ε+δ·1)=j.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_weight_enumerator_at_one
W(1)=|C_t^g|.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_weight_enumerator_translation
Changing the lower-bound parity translates the weight argument, not the surviving affine coset.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_weight_enumerator_test_1
For N=0 and the singleton parity, W=1.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_weight_enumerator_test_2
For N=1,N₀=0, C={0} gives 1 and C={1} gives X.
OMITTED SIGNATURE: TauCeti.ReducedSchur.parity_weight_enumerator_test_3
Those two cosets have equal cardinality but unequal polynomials; signature counts cannot be identified by cardinality alone.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.4/independent-classes
OMITTED SIGNATURE: TauCeti.ReducedSchur.independent_classes
If the N class images in G^ab are linearly independent, then a is an isomorphism. Each g-signature has the sole compatible parity v_g, β=0, and a nonempty fixed fiber for every allowed q.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/split-homology-surjection
OMITTED SIGNATURE: TauCeti.ReducedSchur.split_homology_surjection
For finite G=H⋊Γ, the projection ρ:G→Γ has a section, hence ρ_*:M(G)→M(Γ) is onto.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/multiplier-primary-support
OMITTED SIGNATURE: TauCeti.ReducedSchur.multiplier_primary_support
For finite H,Γ with coprime orders and G=H⋊Γ, M(G) is finite of exponent dividing |G|. Its canonical primary decomposition M_H×M_Γ uses primes dividing |H| and primes dividing |Γ|.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/central-coprime-splitting
OMITTED SIGNATURE: TauCeti.ReducedSchur.central_coprime_splitting
For the chosen Schur cover S→H⋊Γ, write S′ as the preimage of H. The central extension 1→M_Γ→S′/M_H→H→1 has a unique splitting and is isomorphic to M_Γ×H.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/hall-preimage-normal
OMITTED SIGNATURE: TauCeti.ReducedSchur.hall_preimage_normal
Let φ:S′/M_H→M_Γ be the projection obtained from the unique splitting, and D its kernel preimage in S′. Then D is characteristic in S′, normal in S, and |D|=|H||M_H|.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/compatible-covers
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers
For finite H,Γ of coprime orders and G=H⋊Γ, choose a Schur cover S→G and let S_Γ=S/D with D from the preceding construction. The quotient S→S_Γ covers G→Γ. The lower central extension has kernel M_Γ and is an ordinary Schur cover of Γ.
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers_square
The diagram S→G, S_Γ→Γ, S→S_Γ, G→Γ commutes.
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers_kernel
The cover-kernel map is M_H×M_Γ→M_Γ.
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers_schur
The lower class map τ_{S_Γ}:M(Γ)≅M_Γ is an isomorphism.
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers_choice
These covers are compatible choices, not canonical covers functorial for every group map.
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers_test_1
For H=1 take S=S_Γ and the identity cover map.
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers_test_2
For Γ=1 take the lower cover to be trivial, with upper cover mapping to it.
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_covers_test_3
For H=C₃ with inversion by Γ=C₂, G=S₃ and both ordinary multipliers are trivial, so the identity covers are compatible.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/multiplier-kernel-primary
OMITTED SIGNATURE: TauCeti.ReducedSchur.multiplier_kernel_primary
For these finite coprime semidirect products, ker(M(G)→M(Γ))≅M_H and its order is prime to |Γ|. The paper states admissibility too; the inspected cover proof uses only finiteness and coprime orders.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/admissible-inertia-classes
OMITTED SIGNATURE: TauCeti.ReducedSchur.admissible_inertia_classes
Let H and Γ be finite groups of coprime orders, with an action of Γ on H. Assume H is generated by h⁻¹γ(h) for h∈H,γ∈Γ (finite admissibility). In G=H⋊Γ let c consist of nonidentity elements having the same order as their image in Γ. Then c generates G, is conjugacy- and invertible-power-stable, and c/G→(Γ∖{1})/Γ is a bijection.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/admissible-abelianization
OMITTED SIGNATURE: TauCeti.ReducedSchur.admissible_abelianization
For such admissible H, projection G^ab→Γ^ab is an isomorphism, and the class-lattice maps δ correspond under the bijection c/G≅(Γ∖{1})/Γ.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/relations-surjection
OMITTED SIGNATURE: TauCeti.ReducedSchur.relations_surjection
For the c above and d=Γ∖{1}, the split projection sends Q_c onto Q_d.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/reduced-kernel-primary
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduced_kernel_primary
The induced M(G,c)→M(Γ,d) is surjective with H-primary kernel, so its kernel order is prime to |Γ|. The compatible cover map descends to S_c→(S_Γ)_d and commutes with the reduced-kernel isomorphisms.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.5/compatible-correction
OMITTED SIGNATURE: TauCeti.ReducedSchur.compatible_correction
Choose class representatives and marked lifts compatible with S_c→(S_Γ)_d. For every unit α, its reduced-kernel map f satisfies f(W^G_α(m))=W^Γ_α(classMap(m)). The marked U and K maps intertwine the discrete actions.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/centralizer-generator-relations
OMITTED SIGNATURE: TauCeti.ReducedSchur.centralizer_generator_relations
For a central extension E→G, the subgroup generated by all κ_E(x,y) with x∈c,y∈C_G(x) equals that generated using one representative per class in c and any group-generating set of its centralizer.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/reduction-certificate
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate
A certificate for explicit finite groups E,G and π:E→G contains executable multiplication/inverse tables, a surjective homomorphism π, centrality of its kernel, an independently checked ordinary Schur-cover certificate (stem plus maximal kernel/class-map isomorphism), class representatives for c, generating sets for their centralizers, and the subgroup R generated by their lift commutators. Its conclusion identifies A=kerπ/R with M(G,c). Raw GAP output does not supply the cover certificate.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate_tables
Group operations and π are finite executable data, with checked associativity and map laws.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate_relations
The checked subgroup R is exactly the image of Q_c in kerπ.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate_quotient
A≅M(G,c) only after the independent Schur-cover certification.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate_transport
An explicit marked isomorphism transports the certificate to the selected embedded arithmetic type.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate_test_1
For G=E=1 and c empty, R and A are trivial.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate_test_2
For D₈→C₂² with c all nonidentity elements, one nontrivial central commutator generates kerπ and A=1.
OMITTED SIGNATURE: TauCeti.ReducedSchur.reduction_certificate_test_3
The central surjection C₄→C₂ has a kernel of order 2 but is not a Schur cover of C₂; a checker must reject the identification A=M(C₂,c).
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/finite-parity-algorithm
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm
Given a checked reduction certificate, a generating involution c, a homomorphism π₀:G→C₂ and a chosen τ∈c with π₀(τ)≠1, compute the class columns a,s, the torsion-image spaces B_t, both cosets C_t^1 and C_t^τ, their ranks, exact-threshold histograms and lower-bound weight enumerators. The algorithm is finite and exact conditional on the certified ordinary cover and explicit marked embedding.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm_obstruction
The computed column map equals the lift-square map in the existing elementary-2 quotient.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm_cosets
Computed surviving parities are precisely v_g+kerL_t.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm_counts
Computed cardinalities equal 2^{N−rankL_t} and histogram differences.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm_weights
The output polynomial is the exact finite weight sum, not an asymptotic estimate.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm_test_1
For S₃ transpositions, a=id on F₂, A=0, each signature has one parity and threshold 0.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm_test_2
For trivial A every compatible parity survives all odd q.
OMITTED SIGNATURE: TauCeti.ReducedSchur.finite_parity_algorithm_test_3
For the algebraic fixture A=C₈ with one odd square column, survival first occurs at v₂(q−1)=4; do not label this an admissible arithmetic-type counterexample.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/odd-index-two-reduction
OMITTED SIGNATURE: TauCeti.ReducedSchur.odd_index_two_reduction
For finite H normal in G with |H| odd and G/H=C₂, M(G)≅M(H)_{C₂} and M(G) has odd order. For any union c of involution classes, Q_c=0 and M(G,c)=M(G).
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/order96-type
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type
Let ab:A₄→C₃ be its abelianization map. Put K=ker((a,b)↦ab(a)+ab(b)) inside A₄², and F=K⋊C₂ with the involution swapping the two A₄ factors. Then |K|=48 and |F|=96. Use the explicit embedding F⊆A₄≀C₂ and c its outside order-2 elements for the reduced multiplier, rather than an unmarked abstract SmallGroups label.
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type_kernel
K consists exactly of pairs with ab(a)+ab(b)=0.
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type_swap
Swap preserves K and squares to the identity.
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type_order
|K|=48 and |F|=96.
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type_outside
The quotient F→C₂ is the swap coordinate; c is its outside involution set.
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type_test_1
A pair of 3-cycles with abelianized values 1,2 belongs to K.
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type_test_2
A pair with values 1,1 does not belong to K; using the difference instead of the sum builds another specified kernel.
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_type_test_3
The outside element ((1,1),swap) has order 2 and projects nontrivially.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/order96-reduced-multiplier
OMITTED SIGNATURE: TauCeti.ReducedSchur.order96_reduced_multiplier
For the explicitly embedded order-96 type above with outside-involution c, M(F,c)≅C₂, as reported in Wood Table 2 (p.419), with the embedded group specified in the Appendix opening (p.420). The formal identification requires an explicit certified cover and relation subgroup; the extraction PAPER-WOOD-19 computationalReproduction reports the GAP kernel C₂³ and relation subgroup of order 4 remain evidence until certified.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-01
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_01
G=C_3, abstract G′=S_3. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-02
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_02
G=C_5, abstract G′=D_{10}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-03
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_03
G=C_7, abstract G′=D_{14}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-04
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_04
G=C_9, abstract G′=D_{18}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-05
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_05
G=C_3^2 , abstract G′=(C_3^2) \rtimes C_2 [4]. SmallGroups order context: {'Gprime': 18}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_3.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-06
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_06
G=C_{11}, abstract G′=D_{22}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-07
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_07
G=A_4, abstract G′=S_4. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-08
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_08
G=A_4, abstract G′=((C_2^4) \rtimes C_3) \rtimes C_2 [227]. SmallGroups order context: {'Gprime': 96}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_2.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-09
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_09
G=C_{13}, abstract G′=D_{26}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-10
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_10
G=C_{15}, abstract G′=D_{30}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-11
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_11
G=C_{17}, abstract G′=D_{34}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-12
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_12
G=C_{19}, abstract G′=D_{38}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-13
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_13
G=C_7 \rtimes C_3 [1], abstract G′=((C_7^2 ) \rtimes C_3) \rtimes C_2 [7]. SmallGroups order context: {'G': 21, 'Gprime': 294}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-14
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_14
G=C_{21}, abstract G′=D_{42}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-15
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_15
G=C_{23}, abstract G′=D_{46}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-16
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_16
G=\SL(2,3), abstract G′=\GL(2,3). For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-17
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_17
G=\SL(2,3), abstract G′=((Q_8^2) \rtimes C_3) \rtimes C_2 [18130]. SmallGroups order context: {'Gprime': 384}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-18
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_18
G=C_{25}, abstract G′=D_{50}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-19
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_19
G=C_5^2 , abstract G′=(C_5^2) \rtimes C_2 [4]. SmallGroups order context: {'Gprime': 50}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_5.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-20
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_20
G=C_{27}, abstract G′=D_{54}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-21
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_21
G=C_9 \times C_3, abstract G′=(C_9 \times C_3) \rtimes C_2 [7]. SmallGroups order context: {'Gprime': 54}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_3.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-22
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_22
G=(C_3^2) \rtimes C_3 [3], abstract G′=((C_3^2) \rtimes C_3) \rtimes C_2 [8]. SmallGroups order context: {'G': 27, 'Gprime': 54}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-23
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_23
G=(C_3^2) \rtimes C_3 [3], abstract G′=(C_3 \times ((C_3^2) \rtimes C_3)) \rtimes C_2 [46]. SmallGroups order context: {'G': 27, 'Gprime': 162}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_3^2.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-24
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_24
G=C_9 \rtimes C_3 [4], abstract G′=((C_9 \times C_3) \rtimes C_3) \rtimes C_2 [17]. SmallGroups order context: {'G': 27, 'Gprime': 162}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-25
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_25
G=C_3^3, abstract G′=(C_3^3) \rtimes C_2 [14]. SmallGroups order context: {'Gprime': 54}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_3^3.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-26
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_26
G=C_{29}, abstract G′=D_{58}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-27
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_27
G=C_{31}, abstract G′=D_{62}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-28
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_28
G=A_5, abstract G′=S_5. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-29
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_29
G=A_5, abstract G′=A_5\wr C_2. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_2.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-30
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_30
G=\PSL(3,2), abstract G′=\PSL(3,2)\rtimes C_2 [208]. SmallGroups order context: {'Gprime': 336}. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅1.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/table-row-31
OMITTED SIGNATURE: TauCeti.ReducedSchur.table_row_31
G=\PSL(3,2), abstract G′=\PSL(3,2)\wr C_2. For its source-selected good admissible embedded type in G≀C₂, with c the outside involutions forming one conjugacy class, the target certificate proves H₂(G′,c)≅C_2.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.2/universal-degree
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_degree
Define deg:U(G,c)→Multiplicative(ℤ^D) by deg([x])=e_[x]. It is a group homomorphism with δ(deg(u)) the abelianized image of π_U(u).
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_degree_generator
deg([x])=e_[x].
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_degree_inverse
deg([x]⁻¹)=−e_[x].
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_degree_abelianization
δ∘deg is the additive spelling of the abelianized projection.
PARTIAL NATIVE (Mathlib excerpt): TauCeti.ReducedSchur.universal_degree_hom
deg(uv)=deg(u)+deg(v) in additive lattice notation.
OMITTED SIGNATURE: TauCeti.ReducedSchur.universal_degree_test_1
For the one-class C₂ example, deg identifies U=ℤ with ℤ.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_degree_test_2
deg(1)=0.
EXAMPLE PRESENT (scoped native test): TauCeti.ReducedSchur.universal_degree_test_3
deg([x]⁻¹)=−e_[x] is not a nonnegative degree.
Missing input: Existing native carriers support the displayed algebraic/finite-level part. Complete source-specific instantiation still needs the declared cover, class-quotient, homological or certificate interfaces.
-/
/-
InductionRestrictionPartII:RS.3/degree-orbit-set
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_orbit_set
Define 𝔖^{c,G} as the orbit quotient of the integer lattice L under the unit-power coordinate permutation. Its n,≥M subset is the image of L_{n,≥M}. Choice of a roots-of-unity generator changes a degree vector within this orbit.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_orbit_set_mk
Every degree vector has a class in 𝔖^{c,G}.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_orbit_set_eq
Two orbit classes are equal iff the vectors differ by a unit-power permutation.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_orbit_set_slice
The n,≥M image is independent of the choice of torsor generator.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_orbit_set_test_1
For D empty, the orbit set is singleton.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_orbit_set_test_2
For C₃ nonidentity classes, (1,4) and (4,1) have the same orbit class.
OMITTED SIGNATURE: TauCeti.ReducedSchur.degree_orbit_set_test_3
For the same two-class set, (1,4) and (2,3) have different orbit classes despite equal total degree.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.1/commutator-order
OMITTED SIGNATURE: TauCeti.ReducedSchur.commutator_order
For commuting x,y, the homological commutator is additive in each commuting cyclic variable: ⟨x^n,y⟩=n⟨x,y⟩. In particular if x is an involution then 2⟨x,y⟩=0.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/
/-
InductionRestrictionPartII:RS.6/centralizer-commutator-hom
OMITTED SIGNATURE: TauCeti.ReducedSchur.centralizer_commutator_hom
For fixed x∈c in a central extension E→G, the lift-commutator function κ_E(x,−):C_G(x)→A is a group homomorphism.
Missing input: The exact parent ordinary-cover, homological comparison, field torsor, or finite marked-group certificate carrier and its adapter are missing; see the matching packet gap and source-scoped statement. No replacement proposition is introduced.
-/

/-
Independent review additions, 2026-10-05. These are honest omitted API signatures:
OMITTED SIGNATURE: TauCeti.ReducedSchur.class_compatible_marking_ext
Two conjugacy-equivariant markings agree if they agree at every chosen class representative.
The marked/reduced-cover carrier adapter remains missing; this comment is not a declaration.
OMITTED SIGNATURE: TauCeti.ReducedSchur.local_class_normalization_mul_kernel
For a∈kerπ_c and allowed e, z(ae)=a·z(e); central multiplication transports the unique conjugate over c₀.
The marked/reduced-cover carrier adapter remains missing; this comment is not a declaration.
OMITTED SIGNATURE: TauCeti.ReducedSchur.marked_extension_hom_ext
Marked morphisms out of an extension generated by its marked subset are equal if their values agree on that subset; generation is essential.
The marked/reduced-cover carrier adapter remains missing; this comment is not a declaration.
Generic integral homology has no in-scope supplier yet. Parent Layer 7 supplies ordinary covers only. Finite abelian primary decomposition and finite PID submodule bases already exist.
-/
