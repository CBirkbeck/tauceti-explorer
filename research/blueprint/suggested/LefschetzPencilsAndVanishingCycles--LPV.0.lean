/-
Suggested Lean prototypes for the roadmap "Lefschetz pencils, nearby cycles and vanishing cycles"
(LefschetzPencilsAndVanishingCycles), part LPV.0 (layers LPV.0–LPV.6); checkpoint 1 carries the SGA 7 XIII/XV
nearby-cycle nodes and plans Deligne's Weil I §§4–5.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/LefschetzPencilsAndVanishingCycles--LPV.0.md` is definitive. The statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures. A planned result whose proof is not
short is `sorry`, and nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only Mathlib is imported. Neither library has étale sheaves with derived direct images, nearby cycles, étale
fundamental groups of schemes or projective duality, so the geometric signatures are given in the comment block
below. The compiled part prototypes the linear algebra the global theory rests on: the fixed space of the
Picard–Lefschetz transvections (the lemma behind E^⊥ = invariants), the operators N(δ) : x ↦ ψ(x, δ)δ and Weil I
Lemma 5.11, and the contact computation that makes the Hermitian curve a non-example for Lefschetz pencils. Unit
tests are `example`s whose docstring begins "Test `<name>`".

Planned signatures (namespaces `TauCeti.AlgebraicGeometry.VanishingCycles` and `TauCeti.AlgebraicGeometry.LefschetzPencil`;
`Λ` a torsion ring with ℓ invertible, `S` a henselian trait, `f : X ⟶ S`):

  structure HenselianTrait where (V : Type*) [CommRing V] [IsDiscreteValuationRing V] [HenselianLocalRing V] …
  def HenselianTrait.inertia (S : HenselianTrait) : Subgroup (Gal η̄ η)
  def OrientedFibreTopos (Y : Scheme) (hY : Y ⟶ S.closedPoint) : Type*          -- triples (F_s, F_η, φ)
  def psiEta (f : X ⟶ S) : Sheaf (X_η)ét Λ ⥤ GaloisSheaf (X_s̄) (Gal η̄ η) Λ       -- ī^* j̄_*
  def RPsi (f : X ⟶ S) : DerivedCategory⁺ (X_ét, Λ) ⥤ DerivedCategory⁺ (OrientedFibreTopos X_s S, Λ)
  def RPhi (f : X ⟶ S) : DerivedCategory⁺ (X_ét, Λ) ⥤ DerivedCategory⁺ (X_s ×_s η, Λ)
  def vanishingTriangle (K) : Triangle (sp^* i^* K) (RPsiEta K) (RPhi K)
  def variation (σ : S.inertia) (K) : (RPhi K) ⟶ (K_η)                             -- σ = 1 + Var(σ) ∘ q
  theorem RPhi_eq_zero_of_smooth (hf : Smooth f) : RPhi f (constant Λ) ≅ 0
  theorem picardLefschetz_odd (n = 2m+1) (σ : I) (x : H^n(X_η̄, ℚ_ℓ)) :
      σ • x = x + (-1)^(m+1) • tameCharacter ℓ σ • ⟪x, δ⟫ • δ
  def IsLefschetzPencil (X : ClosedSubscheme (ℙ N k)) (A : LinearSubspace (codim 2)) : Prop
  def dualVariety (X : ClosedSubscheme (ℙ N k)) : ClosedSubscheme (ℙ̌ N k)
  theorem exists_lefschetzPencil_veronese (r : ℕ) (hr : 2 ≤ r) :
      ∃ U : Opens (Grassmannian (codim 2) (ℙ (veronese N r))), U.Nonempty ∧ ∀ A ∈ U, IsLefschetzPencil (veronese r X) A
  def vanishingSubspace (P : LefschetzPencil X) (u : U) : Submodule ℚ_ℓ (H^n(X_u, ℚ_ℓ))
  def vanishingQuotient … := vanishingSubspace ⧸ (vanishingSubspace ⊓ vanishingSubspace^⊥)
  theorem vanishingCycles_conjugate (s s' : P.singularSet) : ∃ g : π₁(U, u), g • δ s = δ s' ∨ g • δ s = -δ s'
  theorem vanishingQuotient_absolutelyIrreducible : (monodromyRep P).IsAbsolutelyIrreducible
  theorem kazhdanMargulis (hn : Odd n) : IsOpen (Set.range (monodromyRep P))  -- in Sp(vanishingQuotient, ψ)(ℚ_ℓ)
-/

import Mathlib.LinearAlgebra.Transvection.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Algebra.Lie.SkewAdjoint
import Mathlib.Algebra.Lie.Semisimple.Defs
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Tactic.Ring

namespace TauCeti.AlgebraicGeometry.LefschetzPencil

open LinearMap (BilinForm)

section FixedSpace

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- A Picard–Lefschetz transvection x ↦ x + c (x, δ) δ fixes x exactly when (x, δ) = 0, for c ≠ 0 and δ ≠ 0
(node `LPV.4/fixed-space-of-the-local-transvections`). -/
theorem transvection_apply_eq_self_iff (B : BilinForm K V) {δ : V} (hδ : δ ≠ 0) {c : K} (hc : c ≠ 0) (x : V) :
    LinearMap.transvection (c • B.flip δ) δ x = x ↔ B x δ = 0 := by
  simp [LinearMap.transvection.apply, hδ, hc]

/-- The common fixed space of the local transvections is E^⊥, E the span of the vanishing cycles (Weil I 5.3). -/
theorem forall_transvection_apply_eq_self_iff {ι : Type*} (B : BilinForm K V) (δ : ι → V) (c : ι → K)
    (hc : ∀ i, c i ≠ 0) (x : V) :
    (∀ i, LinearMap.transvection (c i • B.flip (δ i)) (δ i) x = x) ↔ ∀ i, B x (δ i) = 0 := by
  refine forall_congr' fun i => ?_
  by_cases hδ : δ i = 0
  · simp [hδ]
  · exact transvection_apply_eq_self_iff B hδ (hc i) x

/-- Test `vanishingCycle_swap_conic`: in the n = 0 conic pencil, H⁰(X_u) = ℚ² and δ = e₁ − e₂; the reflection
x ↦ x − (x, δ)δ, with (x, δ) = x₀ − x₁, swaps the two points: e₁ ↦ e₂. -/
example : LinearMap.transvection (-(LinearMap.proj (R := ℚ) (φ := fun _ : Fin 2 => ℚ) 0 - LinearMap.proj 1)) ![1, -1]
    ![1, 0] = ![0, 1] := by
  ext i; fin_cases i <;> simp [LinearMap.transvection.apply]

/-- Test `vanishingCycle_fixed_conic`: the same reflection fixes e₁ + e₂, which spans E^⊥. -/
example : LinearMap.transvection (-(LinearMap.proj (R := ℚ) (φ := fun _ : Fin 2 => ℚ) 0 - LinearMap.proj 1)) ![1, -1]
    ![1, 1] = ![1, 1] := by
  ext i; fin_cases i <;> simp [LinearMap.transvection.apply]

end FixedSpace

section LieLemma

attribute [local instance 100] LieRing.ofAssociativeRing

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- N(δ) : x ↦ ψ(x, δ) δ, the logarithm of the Picard–Lefschetz transvection. -/
def nilpotentOfVector (ψ : BilinForm k V) (δ : V) : Module.End k V :=
  (ψ.flip δ).smulRight δ

theorem nilpotentOfVector_apply (ψ : BilinForm k V) (δ x : V) : nilpotentOfVector ψ δ x = ψ x δ • δ := rfl

/-- N(δ)² = 0 when ψ is alternating. -/
theorem nilpotentOfVector_sq (ψ : BilinForm k V) (hψ : ψ.IsAlt) (δ : V) : nilpotentOfVector ψ δ ^ 2 = 0 := by
  ext x
  simp [pow_two, nilpotentOfVector_apply, hψ δ]

/-- N(δ) lies in sp(V, ψ) when ψ is alternating. -/
theorem nilpotentOfVector_mem_sp (ψ : BilinForm k V) (hψ : ψ.IsAlt) (δ : V) :
    nilpotentOfVector ψ δ ∈ skewAdjointLieSubalgebra ψ := by
  sorry

/-- Weil I, Lemma 5.11: a Lie subalgebra of sp(V, ψ), char k = 0, for which V is simple and which is generated by
operators N(δᵢ), is all of sp(V, ψ) (node `LPV.5/symplectic-lie-algebra-generated-by-transvections`). -/
theorem eq_sp_of_isIrreducible_of_generated [CharZero k] [FiniteDimensional k V] (ψ : BilinForm k V)
    (hψ : ψ.IsAlt) (hnd : ψ.Nondegenerate) (L : LieSubalgebra k (Module.End k V))
    (hL : L ≤ skewAdjointLieSubalgebra ψ) [LieModule.IsIrreducible k L V] {ι : Type*} (δ : ι → V)
    (hgen : LieSubalgebra.lieSpan k (Module.End k V) (Set.range fun i => nilpotentOfVector ψ (δ i)) = L) :
    L = skewAdjointLieSubalgebra ψ := by
  sorry

end LieLemma

section Hermitian

/-- Test `hermitian_curve_not_lefschetz`: along the direction (u, v) at (a, b), the Hermitian polynomial
x^{p+1} + y^{p+1} + 1 in characteristic p expands with linear term a^p u + b^p v and next term in t^p. When
a^p u + b^p v = 0 (the tangent direction) the contact order is at least p. -/
example {R : Type*} [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p] (a b u v t : R) :
    (a + t * u) ^ (p + 1) + (b + t * v) ^ (p + 1) + 1 =
      (a ^ (p + 1) + b ^ (p + 1) + 1) + t * (a ^ p * u + b ^ p * v) + t ^ p * (a * u ^ p + b * v ^ p) +
        t ^ (p + 1) * (u ^ (p + 1) + v ^ (p + 1)) := by
  have h1 := add_pow_char a (t * u) p
  have h2 := add_pow_char b (t * v) p
  rw [pow_succ, pow_succ, h1, h2]
  ring

end Hermitian

end TauCeti.AlgebraicGeometry.LefschetzPencil
