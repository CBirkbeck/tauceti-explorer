import Mathlib
/-!
# EulerSystemsCyclotomicMainConjecture: representative target signatures

The roadmap is README.md. This file records light definitions and theorem
signatures statable against the pinned APIs; it is not exhaustive. Distribution
uses compatible primitive roots, arithmetic Frobenius and the `1 - ζ` convention.
The character component is an eigensubmodule and its finite sum is unnormalised.
The ring and module hypotheses are explicit, including scalar injectivity for
a trivial representation. Cyclotomic towers, completed arithmetic modules,
Euler systems and characteristic ideals remain in the README.
-/

noncomputable section

open Polynomial

namespace TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture

/-! ## Layer 0: Euler systems and their normalization -/

section Distribution

variable {K L : Type*} [Field K] [Field L] [CharZero K] [CharZero L] [Algebra K L]
  {m ℓ : ℕ} [NeZero m] [Fact ℓ.Prime]
  [IsCyclotomicExtension {m} ℚ K] [IsCyclotomicExtension {m * ℓ} ℚ L]
  {ζ : L} {η : K}

/-- In the ramified cyclotomic step, the relative minimal polynomial is `X^ℓ - η`
(§0.1; Rubin III.2.1, p. 34). -/
theorem minpoly_step_of_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hdvd : ℓ ∣ m) :
    minpoly K ζ = X ^ ℓ - C η := sorry

/-- In the unramified step, remove the root already in the lower field (§0.2).
This polynomial identity also holds at conductor one. -/
theorem minpoly_step_of_not_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hndvd : ¬ ℓ ∣ m)
    {ℓ' : ℕ} (hℓ' : ℓ * ℓ' ≡ 1 [MOD m]) :
    minpoly K ζ * (X - C (η ^ ℓ')) = X ^ ℓ - C η := sorry

/-- `N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(1 - ζ_{mℓ}) = 1 - ζ_m` when
`ℓ ∣ m`. -/
theorem norm_one_sub_of_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hdvd : ℓ ∣ m) :
    Algebra.norm K (1 - ζ) = 1 - η := sorry

/-- `N(1 - ζ_{mℓ}) · (1 - ζ_m^{ℓ'}) = 1 - ζ_m` when
`ℓ ∤ m`, that is `N(1 - ζ_{mℓ}) = (1 - ζ_m)^{1 - Fr_ℓ⁻¹}` for `m > 1`. -/
theorem norm_one_sub_mul_of_not_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hndvd : ¬ ℓ ∣ m) {ℓ' : ℕ} (hℓ' : ℓ * ℓ' ≡ 1 [MOD m]) :
    Algebra.norm K (1 - ζ) * (1 - η ^ ℓ') = 1 - η := sorry

/-- The same relation with the arithmetic Frobenius
`Fr_ℓ ∈ Gal(ℚ(μ_m)/ℚ)`, `Fr_ℓ(ζ_m) = ζ_m^ℓ`, read through Mathlib's `autEquivPow`. -/
theorem norm_one_sub_mul_frobenius (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hcop : ℓ.Coprime m) :
    Algebra.norm K (1 - ζ) *
        ((IsCyclotomicExtension.autEquivPow K
            (cyclotomic.irreducible_rat (NeZero.pos m))).symm (ZMod.unitOfCoprime ℓ hcop)⁻¹
          (1 - η)) = 1 - η := sorry

end Distribution

/-- The degree sign for `ζ - 1` in any finite field extension (§0.6).
At `ℓ = 2` it cannot be suppressed in the cyclotomic distribution formulas. -/
theorem norm_sub_one_eq_neg_one_pow_mul {K L : Type*} [Field K] [Field L]
    [Algebra K L] [FiniteDimensional K L] (ζ : L) :
    Algebra.norm K (ζ - 1) =
      (-1) ^ Module.finrank K L * Algebra.norm K (1 - ζ) := sorry

/-- `N_{ℚ(μ_ℓ)/ℚ}(1 - ζ_ℓ) = ℓ` for every prime
`ℓ`, including `ℓ = 2`. -/
theorem norm_one_sub_of_prime {L : Type*} [Field L] [CharZero L] {ℓ : ℕ} [Fact ℓ.Prime]
    [IsCyclotomicExtension {ℓ} ℚ L] {ζ : L} (hζ : IsPrimitiveRoot ζ ℓ) :
    Algebra.norm ℚ (1 - ζ) = ℓ := sorry

/- Character eigensubmodules and finite sums (§§0.18–0.20). -/

section Chi

variable {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M] [Group Δ]

/-- The `χ`-component `M^χ = {x | δ x = χ(δ) x}` of an `O[Δ]`-module
(Rubin, Definition I.6.2, applied to `B^ ⊗ O`). -/
def chiComponent (ρ : Representation O Δ M) (χ : Δ →* Oˣ) : Submodule O M where
  carrier := {x | ∀ δ, ρ δ x = (χ δ : O) • x}
  zero_mem' := fun δ => by simp
  add_mem' := fun {x y} hx hy δ => by simp [hx δ, hy δ, smul_add]
  smul_mem' := fun c x hx δ => by
    simp only [map_smul, hx δ]
    exact smul_comm c _ x

variable (ρ : Representation O Δ M) (χ : Δ →* Oˣ)

/-- Membership in the character eigensubmodule. -/
theorem mem_chiComponent (x : M) : x ∈ chiComponent ρ χ ↔ ∀ δ, ρ δ x = (χ δ : O) • x :=
  Iff.rfl

/-- Scalar injectivity is needed on the module itself, not merely on the coefficient ring. -/
theorem chiComponent_trivial_eq_bot (δ : Δ)
    (hδ : Function.Injective (fun x : M => ((χ δ : O) - 1) • x)) :
    chiComponent (Representation.trivial O Δ M) χ = ⊥ := sorry

variable [Fintype Δ]

/-- The twisted sum `∑_δ χ(δ)⁻¹ δ x`; for `M = Lˣ ⊗ O` written additively this
is `∏_δ (δ x)^{χ⁻¹(δ)}`. -/
def chiSum (x : M) : M := ∑ δ : Δ, ((χ δ)⁻¹ : Oˣ) • ρ δ x

/-- Twisted sums lie in the `χ`-component. -/
theorem chiSum_mem (x : M) : chiSum ρ χ x ∈ chiComponent ρ χ := sorry

/-- The finite character sum is additive (§0.19). -/
theorem chiSum_add (x y : M) :
    chiSum ρ χ (x + y) = chiSum ρ χ x + chiSum ρ χ y := sorry

/-- On the `χ`-component, `chiSum` is multiplication by `|Δ|`. -/
theorem chiSum_of_mem {x : M} (hx : x ∈ chiComponent ρ χ) :
    chiSum ρ χ x = (Fintype.card Δ : O) • x := sorry

/-- The square of the unnormalised character sum is its multiple by `|Δ|` (§0.19). -/
theorem chiSum_chiSum (x : M) :
    chiSum ρ χ (chiSum ρ χ x) = (Fintype.card Δ : O) • chiSum ρ χ x := sorry

/-- Equivariant linear maps commute with the finite character sum. -/
theorem chiSum_map {N : Type*} [AddCommGroup N] [Module O N]
    (ρ' : Representation O Δ N) (f : M →ₗ[O] N)
    (hf : ∀ δ x, f (ρ δ x) = ρ' δ (f x)) (x : M) :
    f (chiSum ρ χ x) = chiSum ρ' χ (f x) := sorry

/-- If `v = u - ρ(φ⁻¹) u` then `chiSum v = (1 - χ(φ)⁻¹) chiSum u`.
This is the algebra behind Rubin's `c_ℚ = ξ_{L,χ}^{1 - χ⁻¹(p)}`. -/
theorem chiSum_sub_frobenius (φ : Δ) (u : M) :
    chiSum ρ χ (u - ρ φ⁻¹ u) = (1 - (((χ φ)⁻¹ : Oˣ) : O)) • chiSum ρ χ u := sorry

end Chi

/-- For a root of unity `ω ≠ 1` with `ω^n = 1` and `n`
invertible, `1 - ω` is a unit. Applied to `ω = χ⁻¹(p)` of order prime to `p` when `χ(p) ≠ 1`. -/
theorem isUnit_one_sub_of_pow_eq_one {O : Type*} [CommRing O] [IsDomain O] {ω : O} {n : ℕ}
    (hω : ω ^ n = 1) (hω1 : ω ≠ 1) (hn : IsUnit (n : O)) : IsUnit (1 - ω) := sorry

/- Examples for the kept definitions, and the recorded negative controls. -/

/-- The trivial character gives the existing invariants. -/
example {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M]
    [Group Δ] (ρ : Representation O Δ M) (x : M) :
    x ∈ chiComponent ρ 1 ↔ x ∈ ρ.invariants := by
  simp [mem_chiComponent, Representation.mem_invariants]

/-- Torsion rejects the extension of `chiComponent_trivial_eq_bot` to modules without
scalar injectivity: every integral unit character reduces to the trivial character
modulo 2. -/
example {Δ : Type*} [Group Δ] (χ : Δ →* ℤˣ) :
    chiComponent (Representation.trivial ℤ Δ (ZMod 2)) χ = ⊤ := by
  ext x
  simp only [mem_chiComponent, Submodule.mem_top, iff_true, Representation.trivial_apply]
  intro δ
  rcases Int.units_eq_one_or (χ δ) with h | h
  · simp [h]
  · simp [h, ZMod.neg_eq_self_mod_two]

/-- Twisted sums are not normalized projections: for the trivial character the sum
multiplies by `|Δ|`. -/
example {Δ : Type*} [Group Δ] [Fintype Δ] (x : ℤ) :
    chiSum (Representation.trivial ℤ Δ ℤ) 1 x = (Fintype.card Δ : ℤ) • x := by
  simp [chiSum, Finset.sum_const, Finset.card_univ]

/-- In the regular representation of a two-element group, the sign sum is a difference. -/
example {Δ : Type*} [Group Δ] [Fintype Δ] [DecidableEq Δ] (s : Δ) (hs : s ≠ 1)
    (hcard : Fintype.card Δ = 2) (χ : Δ →* ℤˣ) (hχ : χ s = -1) :
    chiSum (Representation.leftRegular ℤ Δ) χ (MonoidAlgebra.single 1 1) =
      MonoidAlgebra.single 1 1 - MonoidAlgebra.single s 1 := by
  have huniv : (Finset.univ : Finset Δ) = {1, s} := by
    symm
    apply Finset.eq_of_subset_of_card_le (Finset.subset_univ _)
    rw [Finset.card_univ, hcard, Finset.card_pair (Ne.symm hs)]
  simp only [chiSum, huniv]
  rw [Finset.sum_pair (Ne.symm hs)]
  simp [hχ, Representation.ofMulAction_single, sub_eq_add_neg]

/-- The quotient printed as an Euler-system element in RJW is torsion (§0.8). -/
example {F : Type*} [Field F] {ζ : F} (hζ0 : ζ ≠ 0) (hζ1 : ζ ≠ 1) :
    (ζ⁻¹ - 1) / (ζ - 1) = -ζ⁻¹ := by
  have h : ζ - 1 ≠ 0 := sub_ne_zero.mpr hζ1
  field_simp
  ring

/-- Zero is not a root of unity: omitting its exclusion makes the ratio identity false. -/
example : (((0 : ℚ)⁻¹ - 1) / (0 - 1)) = 1 ∧ -(0 : ℚ)⁻¹ = 0 := by norm_num

/-- The invertibility hypothesis on the root order cannot be omitted. -/
example : ¬ IsUnit (1 - (-1 : ℤ)) := by decide

/-! ## Layer 1: Finite-level descent -/

/- Cyclotomic derivative classes and the class-group bound are specified in §§1.1–1.6. -/

/-! ## Layer 2: Iwasawa divisibility -/

/- The norm-limit diagram and characteristic-ideal divisibility are specified in §§2.1–2.4. -/

/-! ## Layer 3: Equality and the odd-prime main conjecture -/

/- The four-term sequence, finite descent and main-conjecture equality are in §§3.1–3.5. -/

/-! ## Layer 4: Abelian fields and the prime 2 -/

/- Integral character quotients, all-prime descent and the finite formulas are in §§4.1–4.26. -/

/-! ## Layer 5: Finite and Selmer consequences -/

/- The finite unit equality and odd-character and Tate-twisted consequences are in §§5.1–5.3. -/

/- Definitions specified in the README over the arithmetic supplier carriers:
p-extended cyclotomic numbers and their real norms; cyclotomic Kummer classes;
χ-cyclotomic generators and unit modules; the unsmoothed Euler system;
Stickelberger cohomology family and Euler-factor replacement; cyclotomic
derivative classes; integral character quotients; 2-unit quotient, minus prime
divisor module, valuation and logarithm vectors, and normed Gauss sums. -/

end TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture
