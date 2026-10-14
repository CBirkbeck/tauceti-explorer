/-
Hida and Coleman families: suggested statements at Mathlib 082e2d3.
The packet records the full targets and their mathematical sources. This file keeps only
light definitions on existing carriers, end milestones, and a few discriminating examples.
Rigid eigenvarieties, Banach coefficient families, Hecke towers, period lines, derived
ordinary representatives and family Galois/Selmer constructions remain packet targets.
No declaration below asserts that these targets have been formalised.
-/
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.LocalRing.Quotient
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Module.Torsion.Basic

open scoped Nat

namespace TauCeti.PadicFamilies

section FiniteOrdinary
variable {R : Type*} [Ring R]
variable {M : Type*} [AddCommGroup M] [Module R M] [Finite M]

/-- L0a/finite-ordinary-projector: the factorial power on a finite underlying set. -/
noncomputable def ordinaryProjector (U : Module.End R M) : Module.End R M :=
  U ^ (Nat.card M)!

/-- The image of the ordinary projector. -/
noncomputable def ordinaryPart (U : Module.End R M) : Submodule R M :=
  LinearMap.range (ordinaryProjector U)

/-- Its complementary kernel. -/
noncomputable def nonOrdinaryPart (U : Module.End R M) : Submodule R M :=
  LinearMap.ker (ordinaryProjector U)

/-- L0a/finite-ordinary-projector and ordinary-part-bijective:
stabilisation, idempotence and the invertible/nilpotent decomposition. -/
theorem finite_ordinary_milestone (U : Module.End R M) :
    (∀ n : ℕ, Nat.card M ≤ n → ordinaryProjector U = U ^ n !) ∧
    IsIdempotentElem (ordinaryProjector U) ∧
    IsCompl (ordinaryPart U) (nonOrdinaryPart U) ∧
    Set.BijOn U (ordinaryPart U) (ordinaryPart U) ∧
    (∀ x ∈ nonOrdinaryPart U, (U ^ Nat.card M) x = 0) := sorry

/-- L0a/finite-fitting-comparison: compare the existing Fitting summands. -/
theorem finite_ordinary_fitting (U : Module.End R M) :
    ordinaryPart U = ⨅ n, LinearMap.range (U ^ n) ∧
    nonOrdinaryPart U = ⨆ n, LinearMap.ker (U ^ n) := sorry

/-- L0a/ordinary-projector-natural: intertwining preserves the stable projector. -/
theorem finite_ordinary_naturality
    {N : Type*} [AddCommGroup N] [Module R N] [Finite N]
    (U : Module.End R M) (V : Module.End R N)
    (f : M →ₗ[R] N) (h : f ∘ₗ U = V ∘ₗ f) :
    f ∘ₗ ordinaryProjector U = ordinaryProjector V ∘ₗ f := sorry

example : ordinaryProjector (2 • (1 : Module.End (ZMod 6) (ZMod 6))) =
    4 • (1 : Module.End (ZMod 6) (ZMod 6)) := sorry
example : ordinaryPart (2 • (1 : Module.End (ZMod 8) (ZMod 8))) = ⊥ := sorry
example : nonOrdinaryPart (3 • (1 : Module.End (ZMod 8) (ZMod 8))) = ⊥ := sorry
end FiniteOrdinary

section LocallyFinite
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- L0a/locally-finite-action: every orbit is finitely generated modulo each adic power. -/
def IsLocallyFiniteEnd (I : Ideal R) (T : Module.End R M) : Prop :=
  ∀ n : ℕ, ∀ v : M, ∃ s : Finset M, ∀ k : ℕ,
    (T ^ k) v ∈ Submodule.span R (s : Set M) ⊔ (I ^ n) • (⊤ : Submodule R M)

/-- L0a/locally-finite-ordinary-projector (Pilloni Lemma 2.1.3):
the finite residue field and complete local coefficient ring are essential here. -/
theorem locally_finite_ordinary_milestone
    [IsNoetherianRing R] [IsLocalRing R]
    [Finite (IsLocalRing.ResidueField R)]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) M]
    (T : Module.End R M)
    (hT : IsLocallyFiniteEnd (IsLocalRing.maximalIdeal R) T) :
    ∃ e : Module.End R M, IsIdempotentElem e ∧ Commute T e ∧
      Set.BijOn T (LinearMap.range e) (LinearMap.range e) ∧
      (∀ x : M, ∀ n : ℕ, ∃ b : ℕ, ∀ k : ℕ, b ≤ k →
        (T ^ k !) x - e x ∈
          (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R M)) ∧
      (∀ x ∈ LinearMap.ker e, ∀ n : ℕ, ∃ b : ℕ, ∀ k : ℕ, b ≤ k →
        (T ^ k) x ∈ (IsLocalRing.maximalIdeal R ^ n) • (⊤ : Submodule R M)) := sorry

example (I : Ideal R) : IsLocallyFiniteEnd I (1 : Module.End R M) := sorry
example [Module.Finite R M] (I : Ideal R) (T : Module.End R M) :
    IsLocallyFiniteEnd I T := sorry
end LocallyFinite

section Congruence
variable {A O : Type*} [CommRing A] [CommRing O]

/-- The annihilator `I_λ = A[ker λ]` of the augmentation ideal, as an ideal of `A`. -/
def augmentationAnnihilator (lam : A →+* O) : Ideal A :=
  Submodule.torsionBySet A A (RingHom.ker lam : Set A)

/-- `PadicFamilies:L1/congruence-module`: the submodule `M[ker λ] + M[I_λ]`. -/
def congruenceSubmodule (lam : A →+* O) (M : Type*) [AddCommGroup M] [Module A M] :
    Submodule A M :=
  Submodule.torsionBySet A M (RingHom.ker lam : Set A) ⊔
    Submodule.torsionBySet A M (augmentationAnnihilator lam : Set A)

/-- `PadicFamilies:L1/congruence-module`: `Ψ_λ(M) = M / (M[ker λ] + M[I_λ])`. -/
abbrev congruenceModule (lam : A →+* O) (M : Type*) [AddCommGroup M] [Module A M] : Type _ :=
  M ⧸ congruenceSubmodule lam M

/-- `PadicFamilies:L1/congruence-ideal`: `η_λ = λ(I_λ)`. -/
def congruenceIdeal (lam : A →+* O) : Ideal O := Ideal.map lam (augmentationAnnihilator lam)

/-- L1/congruence-ideal: the raw congruence module needs the double annihilator
hypothesis to identify it with the quotient by the congruence ideal. -/
theorem congruence_milestone (lam : A →+* O) (hsurj : Function.Surjective lam)
    (hann : Submodule.torsionBySet A A
      (augmentationAnnihilator lam : Set A) = RingHom.ker lam) :
    Nonempty (congruenceModule lam A ≃+ O ⧸ congruenceIdeal lam) := sorry

example : congruenceIdeal (RingHom.id ℤ) = ⊤ := sorry
example (M : Type*) [AddCommGroup M] [Module ℤ M] :
    congruenceSubmodule (RingHom.id ℤ) M = ⊤ := sorry
end Congruence

end TauCeti.PadicFamilies
