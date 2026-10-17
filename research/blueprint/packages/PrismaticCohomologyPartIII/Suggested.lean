import Mathlib

/-!
# Prismatic cohomology, Part III: representative target signatures

The roadmap is README.md. This file records signatures statable against the pinned APIs
and is not exhaustive. The examples fix the scalar and lattice conventions of Layers 6–7:
fixed points use the fibre of Frobenius minus the identity, and effective Frobenius need
not have an integral inverse. Sites, enhanced completions and period comparisons retain
their full hypotheses and construction targets in the README.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartIII

/-! ## Layer 6: Étale comparisons and syntomic complexes -/

open CategoryTheory

namespace Syntomic

/-- For zero Frobenius the fixed-point kernel is zero (§6.1). -/
example {M : Type*} [AddCommGroup M] (x : M) :
    (0 : M →+ M) x = x ↔ x = 0 := by simp [eq_comm]

/-- Identity Frobenius fixes every element, including on the zero group. -/
example {M : Type*} [AddCommGroup M] (x : M) : (AddMonoidHom.id M) x = x := rfl

/-- Identity-minus-identity has zero differential; its cokernel is retained in degree one. -/
example {M : Type*} [AddCommGroup M] :
    (AddMonoidHom.id M - AddMonoidHom.id M : M →+ M) = 0 := sub_self _

/-- The coefficient Frobenius is the identity on the prime field (§§6.1, 6.24). -/
example (p : ℕ) [Fact p.Prime] (x : ZMod p) : x ^ p - x = 0 := by
  rw [ZMod.pow_card, sub_self]

/-- Over F₂ the degree-one Artin–Schreier cokernel is nonzero. -/
example : ¬ ∃ x : ZMod 2, x ^ 2 - x = 1 := by decide

/-- On Z→Z, Frobenius 2 and comparison map 1 give differential +1 (§6.1). -/
example : ((2 : ℤ) - 1) * 1 = 1 ∧ ((1 : ℤ) - 2) * 1 = -1 := by norm_num

/-- Negating the target identifies the φ−can and can−φ differentials (§7.0). -/
example (x : ℤ) : (-1) * ((2 - 1) * x) = (1 - 2) * x := by ring

/-- At p=2, a weight-one coordinate is sent to weight two (§6.31). -/
example : (2 : ℕ) * 1 = 2 ∧ (2 : ℕ) * 1 ≠ 1 := by decide

/-- Hodge–Tate associated-piece weights can be fractional at p=2 (§6.31). -/
example : (2 : ℚ) * (1 / 2) = 1 ∧ (1 / 2 : ℚ) ≠ 1 := by norm_num

/-- The logarithm has additive, rather than multiplicative, target (§6.10). -/
example (a : ℤ) : a + a = 2 * a := by ring

/-- The cone of a degree-zero map is supported in degrees −1 and 0; its fibre shifts
these to degrees 0 and 1 (§6.1). -/
example {F G : CochainComplex (ModuleCat ℤ) ℤ} (f : F ⟶ G)
    (hF : ∀ i : ℤ, i ≠ 0 → CategoryTheory.Limits.IsZero (F.X i))
    (hG : ∀ i : ℤ, i ≠ 0 → CategoryTheory.Limits.IsZero (G.X i))
    (i : ℤ) (hi : i ≠ -1) (hi' : i ≠ 0) :
    CategoryTheory.Limits.IsZero ((CochainComplex.mappingCone f).X i) := by
  rw [CochainComplex.mappingCone.isZero_X_iff]
  exact ⟨hF (i + 1) (by omega), hG i hi'⟩

end Syntomic

/-! ## Layer 7: Prismatic F-crystals and crystalline lattices -/

namespace Crystals

/-- Multiplication by p preserves the integral rank-one lattice (§7.25). -/
example (p : ℕ) : ∀ x : ℤ, ∃ y : ℤ, (p : ℚ) * (x : ℚ) = (y : ℚ) := by
  intro x
  exact ⟨(p : ℤ) * x, by push_cast; rfl⟩

/-- An integral forward map can have a nonintegral inverse (§§7.4, 7.25). -/
example : ¬ ∃ x : ℤ, (x : ℚ) = (2 : ℚ)⁻¹ := by
  intro ⟨x, hx⟩
  have h : (2 : ℚ) * x = 1 := by rw [hx]; norm_num
  have hi : 2 * x = (1 : ℤ) := by exact_mod_cast h
  omega

/-- Another forward rescaling still does not make the inverse integral. -/
example : ¬ ∃ x : ℤ, (4 : ℚ) * (x : ℚ) = 1 := by
  intro ⟨x, hx⟩
  have hi : 4 * x = (1 : ℤ) := by exact_mod_cast hx
  omega

/-- A common scalar on both Frobenii cancels from the morphism equation (§7.25). -/
example {A : Type*} [CommRing A] [IsDomain A] (e a b f : A) (he : e ≠ 0) :
    (e * b) * f = f * (e * a) ↔ b * f = f * a := by
  calc
    (e * b) * f = f * (e * a) ↔ e * (b * f) = e * (f * a) := by ring_nf
    _ ↔ b * f = f * a := ⟨mul_left_cancel₀ he, congrArg (e * ·)⟩

/-- Rank zero remains zero under either semilinear normalization. -/
example (p : ℕ) : (p : ℚ) * 0 = 0 ∧ (p : ℚ)⁻¹ * 0 = 0 := by simp

/-- The scalar of the dual line is the inverse scalar (§7.4). -/
example : (2 : ℚ) * (2 : ℚ)⁻¹ = 1 := by norm_num

/-- The curve modification has degree t_H−t_N, fixing both signs (§7.0). -/
example : (1 : ℤ) - 1 = 0 ∧ (0 : ℤ) - (-1) = 1 := by norm_num

/-- p(x−1)=0 alone does not impose x=1 without transversality (§7.16). -/
example : ∃ x : ZMod 2, (2 : ZMod 2) * (x - 1) = 0 ∧ x ≠ 1 := by decide

/-- The scalar chart has φ(x)=−1 modulo p at p=2, not necessarily x^p (§7.16). -/
example : ∃ x : ZMod 2, (-1 : ZMod 2) ≠ x ^ 2 := by decide

/-- Noncommuting permutations distinguish gh from hg in the Galois cocycle (§7.0b). -/
example :
    (Equiv.swap (0 : Fin 3) 1 * Equiv.swap 1 2 : Equiv.Perm (Fin 3)) 2 = 0 ∧
    (Equiv.swap (1 : Fin 3) 2 * Equiv.swap 0 1 : Equiv.Perm (Fin 3)) 2 = 1 := by decide

/-- In the ramified dyadic example π²=2, π−2 does not vanish (§7.12). -/
example (π : ℝ) (hπ : π ^ 2 = 2) : π - 2 ≠ 0 := by
  intro h
  have : π = 2 := by linarith
  norm_num [this] at hπ

end Crystals

/-!
The README additionally specifies `Prismatic.Etale.FrobeniusModule`, derived `fixedPoints`
and their localization/reduction functors (§6.1); syntomic Nygaard data, finite coefficients,
absolute/formal cohomology and products (§§6.8–6.9); rank-one units, Tate modules and
`prismaticLog` (§6.10); syntomic scheme gluing (§6.30) and internal weights (§6.31).

Layer 7 specifies trace/cyclic coefficients, TC, the Beilinson square and filtered curve
modification (§7.0); crystals, base-change data and their morphism/tensor/dual/pullback API
(§7.1); punctured complete descent (§7.2); `IsAwayIdeal`, `OverPrism` and effectivity (§7.4);
`SiteData`, `PrismaticFCrystal` and Laurent crystals (§§7.5–7.6); étale, crystalline and
de Rham realization (§§7.9–7.10); cover evaluations (§7.12); rational/period sheaves (§7.16);
the filtered-module construction (§7.17) and `latticeFCrystal` (§7.21). Their absent site,
enhanced-category and period-ring carriers keep these definitions in the roadmap.
-/

end TauCetiRoadmap.PrismaticCohomologyPartIII
