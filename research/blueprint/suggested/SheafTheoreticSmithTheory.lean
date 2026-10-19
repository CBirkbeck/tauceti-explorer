/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/SheafTheoreticSmithTheory.md is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge
on names and signatures.

The pinned libraries have cyclic module Tate cohomology, group algebras and
Frobenius. They do not supply the enhanced equivariant étale, sheaf Tate,
parity or modular Satake carriers required by the main geometric theorem.
Those targets and their APIs/tests remain in the reader. This compact file
uses real-bodied light definitions and states milestones over existing
carriers; it does not stand in for the missing geometric constructions.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369
-/
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.RingTheory.LocalRing.Module
import TauCeti.RepresentationTheory.Homological.TateCohomology.Periodic

noncomputable section

open scoped BigOperators
open CategoryTheory

namespace TauCetiRoadmap.SheafTheoreticSmithTheory

universe u v

/-! ST.0: the existing group algebra, and the missing arbitrary-flat milestone. -/

/-- A light abbreviation for the existing cyclic group algebra carrier. -/
abbrev CyclicGroupAlgebra (k : Type u) [CommRing k] (p : ℕ) :=
  MonoidAlgebra k (Multiplicative (ZMod p))

/-- Stacks 051E, Lemma 10.101.3. No finite-generation assumption is imposed. -/
theorem free_of_flat_of_nilpotent_maximalIdeal
    (R : Type u) [CommRing R] [IsLocalRing R]
    (h : ∃ n : ℕ, (IsLocalRing.maximalIdeal R) ^ n = ⊥)
    (M : Type v) [AddCommGroup M] [Module R M] [Module.Flat R M] :
    Module.Free R M := by
  sorry

/-- Feng §3.2, p.14: flat cyclic group-ring modules in characteristic p are free. -/
theorem cyclicGroupAlgebra_flat_free
    (k : Type u) [Field k] (p : ℕ) [Fact p.Prime] [CharP k p]
    (M : Type v) [AddCommGroup M] [Module (CyclicGroupAlgebra k p) M]
    [Module.Flat (CyclicGroupAlgebra k p) M] :
    Module.Free (CyclicGroupAlgebra k p) M := by
  sorry

/-! ST.1: import the actual Tate groups and periodicity rather than replanning them. -/

example {R G : Type u} [CommRing R] [Group G] [Fintype G]
    (M : Rep R G) [IsCyclic G] (m n : ℤ) (h : m ≡ n [ZMOD 2]) :
    Nonempty (tateCohomology M m ≅ tateCohomology M n) :=
  ⟨Rep.FiniteCyclicGroup.periodicIso M m n h⟩

example {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) :
    Nonempty (tateCohomology M 0 ≅ ModuleCat.of R
      (M.ρ.invariants ⧸ (LinearMap.range M.ρ.norm).submoduleOf M.ρ.invariants)) :=
  ⟨TauCeti.TateCohomology.H0IsoNormQuotient M⟩

/-!
ST.2–7: the geometric definitions, comparisons and their discriminating checks
are README targets. In particular no Prop-valued surrogate for a sheaf category,
Smith functor or natural Satake comparison is introduced here.
-/

/-! ST.8: real cyclic trace/norm formulas, over an existing commutative ring. -/

section CyclicAlgebra

variable {A : Type u} [CommRing A]

/-- Transfer for the chosen cyclic generator; the action law is a theorem hypothesis. -/
def cyclicTrace (p : ℕ) (σ : A ≃+* A) (a : A) : A :=
  ∑ i : Fin p, (σ ^ i.val) a

/-- Multiplicative cyclic norm, before taking any Tate quotient. -/
def cyclicNorm (p : ℕ) (σ : A ≃+* A) (a : A) : A :=
  ∏ i : Fin p, (σ ^ i.val) a

/-- The transfer takes values in the fixed subring. -/
theorem cyclicTrace_fixed (p : ℕ) (σ : A ≃+* A) (hσ : σ ^ p = 1) (a : A) :
    σ (cyclicTrace p σ a) = cyclicTrace p σ a := by
  sorry

/-- The norm takes values in the fixed subring. -/
theorem cyclicNorm_fixed (p : ℕ) (σ : A ≃+* A) (hσ : σ ^ p = 1) (a : A) :
    σ (cyclicNorm p σ a) = cyclicNorm p σ a := by
  sorry

/-- This identity makes the transfer image an ideal of the fixed subring. -/
theorem cyclicTrace_mul_fixed (p : ℕ) (σ : A ≃+* A) (a b : A) (hb : σ b = b) :
    cyclicTrace p σ (b * a) = b * cyclicTrace p σ a := by
  sorry

/-- Mixed binary words form free cyclic orbits, producing this transfer defect.
This ring identity is valid even before imposing characteristic p. -/
theorem cyclicNorm_add_transfer (p : ℕ) [Fact p.Prime]
    (σ : A ≃+* A) (hσ : σ ^ p = 1) (a b : A) :
    ∃ c : A, cyclicNorm p σ (a + b) - cyclicNorm p σ a - cyclicNorm p σ b =
      cyclicTrace p σ c := by
  sorry

/-- ST.8 endpoint, Feng Lemma 5.15, p.42. S is a real existing subring carrier.
The transfer-annihilating character need not exist; the theorem extends one
when supplied. Its target field is perfect, and the action is F_p-linear. -/
theorem tate_character_extension (p : ℕ) [Fact p.Prime] [CharP A p]
    (σ : A ≃+* A) (hσ : σ ^ p = 1) (S : Subring A)
    (hfixed : ∀ a : S, σ a = a)
    (hnorm : ∀ a : A, cyclicNorm p σ a ∈ S)
    (htrace : ∀ a : A, cyclicTrace p σ a ∈ S)
    (κ : Type v) [Field κ] [CharP κ p] [PerfectRing κ p]
    (χ : S →+* κ) (hχ : ∀ a : A, χ ⟨cyclicTrace p σ a, htrace a⟩ = 0) :
    ∃! ψ : A →+* κ, (∀ a : S, ψ a = χ a) ∧
      ∀ a : A, ψ a ^ p = χ ⟨cyclicNorm p σ a, hnorm a⟩ := by
  sorry

/-- Degenerate action: the norm is the ordinary p-th power. -/
example (p : ℕ) (a : A) : cyclicNorm p (RingEquiv.refl A) a = a ^ p := by
  sorry

/-- In characteristic three the trivial-action transfer is zero. -/
example [CharP A 3] (a : A) : cyclicTrace 3 (RingEquiv.refl A) a = 0 := by
  sorry

/-- The fixed-subring ideal test includes multiplication by every fixed scalar. -/
example (σ : A ≃+* A) (a b : A) (hb : σ b = b) :
    ∃ c : A, b * cyclicTrace 3 σ a = cyclicTrace 3 σ c := by
  sorry

end CyclicAlgebra

/-! ST.5/ST.8: source linearization relative to a supplied Frobenius form. -/

section Linearization

variable {k A B : Type u} [Field k] [CommRing A] [CommRing B]
    [Algebra k A] [Algebra k B]

/-- A supplied form automorphism is data. Its inverse is applied on the source. -/
def linearizeViaForm (φ : A ≃+* A) (f : A → B) : A → B :=
  fun a => f (φ.symm a)

/-- The scalar identity used to linearize the algebra or categorical norm. -/
theorem linearizeViaForm_smul (p : ℕ) [Fact p.Prime] [CharP k p]
    [PerfectRing k p] (φ : A ≃+* A) (f : A → B)
    (hφ : ∀ (c : k) (a : A), φ (c • a) = c ^ p • φ a)
    (hf : ∀ (c : k) (a : A), f (c • a) = c ^ p • f a)
    (c : k) (a : A) :
    linearizeViaForm φ f (c • a) = c • linearizeViaForm φ f a := by
  sorry

end Linearization

/-- A small scalar check using the pinned Frobenius equivalence itself. -/
example (k : Type u) [Field k] (p : ℕ) [Fact p.Prime] [CharP k p]
    [PerfectRing k p] (a : k) :
    ((frobeniusEquiv k p).symm a) ^ p = a := by
  sorry

end TauCetiRoadmap.SheafTheoreticSmithTheory
