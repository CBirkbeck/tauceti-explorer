import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.RingTheory.RootsOfUnity.CyclotomicUnits
import Mathlib.RepresentationTheory.Invariants
import Mathlib.Tactic.NormNum

/-!
# Euler systems and the cyclotomic main conjecture

The reader document specifies all targets in L0–L4, their hypotheses, sources,
APIs and rejection tests. This file states only milestones whose carriers are
already available at the pinned libraries. The cyclotomic towers, integral
cohomology, Euler-system modules, completed unit modules and characteristic
ideals are supplied by the roadmaps named there; their construction is not
part of this file.

The retained definitions are the eigensubmodule of a representation and its
finite character sum. Distribution uses compatible primitive roots and the
`1 - ζ` convention. No auxiliary field or unit representation is postulated.
-/

noncomputable section

open Polynomial

namespace TauCeti.CyclotomicEulerSystem

section Distribution

variable {K L : Type*} [Field K] [Field L] [CharZero K] [CharZero L] [Algebra K L]
  {m ℓ : ℕ} [NeZero m] [Fact ℓ.Prime]
  [IsCyclotomicExtension {m} ℚ K] [IsCyclotomicExtension {m * ℓ} ℚ L]
  {ζ : L} {η : K}

/-- **`L0/distribution-relation-of-dvd`**: `N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(1 - ζ_{mℓ}) = 1 - ζ_m` when
`ℓ ∣ m`. -/
theorem norm_one_sub_of_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hdvd : ℓ ∣ m) :
    Algebra.norm K (1 - ζ) = 1 - η := sorry

/-- **`L0/distribution-relation-of-not-dvd`**: `N(1 - ζ_{mℓ}) · (1 - ζ_m^{ℓ'}) = 1 - ζ_m` when
`ℓ ∤ m`, that is `N(1 - ζ_{mℓ}) = (1 - ζ_m)^{1 - Fr_ℓ⁻¹}` for `m > 1`. -/
theorem norm_one_sub_mul_of_not_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hndvd : ¬ ℓ ∣ m) {ℓ' : ℕ} (hℓ' : ℓ * ℓ' ≡ 1 [MOD m]) :
    Algebra.norm K (1 - ζ) * (1 - η ^ ℓ') = 1 - η := sorry

/-- **`L0/distribution-relation-frobenius`**: the same relation with the arithmetic Frobenius
`Fr_ℓ ∈ Gal(ℚ(μ_m)/ℚ)`, `Fr_ℓ(ζ_m) = ζ_m^ℓ`, read through Mathlib's `autEquivPow`. -/
theorem norm_one_sub_mul_frobenius (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hcop : ℓ.Coprime m) :
    Algebra.norm K (1 - ζ) *
        ((IsCyclotomicExtension.autEquivPow K
            (cyclotomic.irreducible_rat (NeZero.pos m))).symm (ZMod.unitOfCoprime ℓ hcop)⁻¹
          (1 - η)) = 1 - η := sorry

/-- **`L0/distribution-relation-rubin-convention`**: the `ζ - 1` convention differs by the sign
`(-1)^{[ℚ(μ_{mℓ}) : ℚ(μ_m)]}`. With `[ℚ(μ_{mℓ}) : ℚ(μ_m)] = ℓ` or `ℓ - 1` this corrects Rubin's
(III.2): for `ℓ = 2` the first two cases carry a sign `-1`. -/
theorem norm_sub_one_eq_neg_one_pow_mul :
    Algebra.norm K (ζ - 1) = (-1) ^ Module.finrank K L * Algebra.norm K (1 - ζ) := sorry

end Distribution

/-- **`L0/distribution-relation-conductor-one`**: `N_{ℚ(μ_ℓ)/ℚ}(1 - ζ_ℓ) = ℓ` for every prime
`ℓ`, including `ℓ = 2`. -/
theorem norm_one_sub_of_prime {L : Type*} [Field L] [CharZero L] {ℓ : ℕ} [Fact ℓ.Prime]
    [IsCyclotomicExtension {ℓ} ℚ L] {ζ : L} (hζ : IsPrimitiveRoot ζ ℓ) :
    Algebra.norm ℚ (1 - ζ) = ℓ := sorry

/-! ## Character components and character sums -/

section Chi

variable {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M] [Group Δ]

/-- **`L0/chi-component`**: the `χ`-component `M^χ = {x | δ x = χ(δ) x}` of an `O[Δ]`-module
(Rubin, Definition I.6.2, applied to `B^ ⊗ O`). -/
def chiComponent (ρ : Representation O Δ M) (χ : Δ →* Oˣ) : Submodule O M where
  carrier := {x | ∀ δ, ρ δ x = (χ δ : O) • x}
  zero_mem' := fun δ => by simp
  add_mem' := fun {x y} hx hy δ => by simp [hx δ, hy δ, smul_add]
  smul_mem' := fun c x hx δ => by
    simp only [map_smul, hx δ]
    exact smul_comm c _ x

variable (ρ : Representation O Δ M) (χ : Δ →* Oˣ)

/-- API: membership. -/
theorem mem_chiComponent (x : M) : x ∈ chiComponent ρ χ ↔ ∀ δ, ρ δ x = (χ δ : O) • x :=
  Iff.rfl

variable [Fintype Δ]

/-- **`L0/chi-sum`**: the twisted sum `∑_δ χ(δ)⁻¹ δ x`; for `M = Lˣ ⊗ O` written additively this
is `∏_δ (δ x)^{χ⁻¹(δ)}`. -/
def chiSum (x : M) : M := ∑ δ : Δ, ((χ δ)⁻¹ : Oˣ) • ρ δ x

/-- API: twisted sums lie in the `χ`-component. -/
theorem chiSum_mem (x : M) : chiSum ρ χ x ∈ chiComponent ρ χ := sorry

/-- API: on the `χ`-component, `chiSum` is multiplication by `|Δ|`. -/
theorem chiSum_of_mem {x : M} (hx : x ∈ chiComponent ρ χ) :
    chiSum ρ χ x = (Fintype.card Δ : O) • x := sorry

/-- **`L0/chi-sum-frobenius`**: if `v = u - ρ(φ⁻¹) u` then `chiSum v = (1 - χ(φ)⁻¹) chiSum u`.
This is the algebra behind Rubin's `c_ℚ = ξ_{L,χ}^{1 - χ⁻¹(p)}`. -/
theorem chiSum_sub_frobenius (φ : Δ) (u : M) :
    chiSum ρ χ (u - ρ φ⁻¹ u) = (1 - (((χ φ)⁻¹ : Oˣ) : O)) • chiSum ρ χ u := sorry

end Chi

/-- **`L0/one-sub-root-of-unity-unit`**: for a root of unity `ω ≠ 1` with `ω^n = 1` and `n`
invertible, `1 - ω` is a unit. Applied to `ω = χ⁻¹(p)` of order prime to `p` when `χ(p) ≠ 1`. -/
theorem isUnit_one_sub_of_pow_eq_one {O : Type*} [CommRing O] [IsDomain O] {ω : O} {n : ℕ}
    (hω : ω ^ n = 1) (hω1 : ω ≠ 1) (hn : IsUnit (n : O)) : IsUnit (1 - ω) := sorry

/-! ## Checks on the retained definitions and conventions -/

/-- The trivial character gives the existing invariants. -/
example {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M]
    [Group Δ] (ρ : Representation O Δ M) (x : M) :
    x ∈ chiComponent ρ 1 ↔ x ∈ ρ.invariants := sorry

/-- A nontrivial character on a trivial representation has zero eigensubmodule. -/
example {O Δ : Type*} [CommRing O] [IsDomain O] [Group Δ]
    (χ : Δ →* Oˣ) (δ : Δ) (hδ : (χ δ : O) ≠ 1) :
    chiComponent (Representation.trivial O Δ O) χ = ⊥ := sorry

/-- Twisted sums are not normalized projections. -/
example {Δ : Type*} [Group Δ] [Fintype Δ] (x : ℤ) :
    chiSum (Representation.trivial ℤ Δ ℤ) 1 x = (Fintype.card Δ : ℤ) • x := sorry

/-- For the trivial group the sum is the identity. -/
example : chiSum (Representation.trivial ℤ (Multiplicative (ZMod 1)) ℤ) 1 (5 : ℤ) = 5 := sorry

/-- The quotient printed as an Euler-system element in RJW is torsion. -/
example {F : Type*} [Field F] {ζ : F} (h : ζ ≠ 1) :
    (ζ⁻¹ - 1) / (ζ - 1) = -ζ⁻¹ := sorry

/-- The invertibility hypothesis on the root order cannot be omitted. -/
example : ¬ IsUnit (1 - (-1 : ℤ)) := by decide

end TauCeti.CyclotomicEulerSystem
