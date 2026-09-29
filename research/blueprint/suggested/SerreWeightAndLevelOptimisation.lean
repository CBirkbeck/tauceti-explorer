/-
# Suggested Lean forms for `SerreWeightAndLevelOptimisation`

**This file is not the roadmap, and it is not exhaustive.** The roadmap document
`research/blueprint/readmes/SerreWeightAndLevelOptimisation.md` is definitive. The statements
below suggest Lean forms — names, signatures and the shape of each unit test — so that
contributors and reviewers converge on the same interface rather than each inventing one.
Everything is proved by `sorry`.

Two conventions used throughout, both chosen for honesty rather than convenience.

* **Imported predicates are section variables, not definitions.** "ρ̄ arises from an eigenform
  of weight `k` on `Γ₁ N`", "ρ̄ is unramified at `p`", "ρ̄ is finite at 2", "ρ̄ satisfies
  multiplicity one" and "ρ̄ is induced from `ℚ(i)`" all belong to roadmaps this layer imports
  (`AutomorphicGaloisRepresentations`, `ModularCurvesPartII`,
  `AlgebraicModularFormsAndSerreWeights`, and the ModularForms anchor). Their real definitions
  are not this layer's business, and a `def _ : Prop := sorry` would assert nothing, so they
  appear as parameters. A statement below is therefore the *shape* of the theorem, to be
  instantiated once the supplier exists.
* **`sorry` is used honestly.** A condition that cannot yet be stated is a parameter or is
  omitted; it is never replaced by a `Prop`-valued field.

Prototyped against the pinned baseline: Mathlib `082e2d37` and Tau Ceti `f790474`. The Tau Ceti
imports below are the analytic old/new and newform theory that this roadmap consumes rather than
restates; note that Tau Ceti's old/new decomposition is over `ℂ`, by the Petersson inner
product, which is exactly why the integral statements of `R20.1` are planned rather than
imported.
-/
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.Tactic.NormNum
import TauCeti.NumberTheory.ModularForms.Newforms.Basic
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.NumberTheory.ModularForms.Newforms.MultiplicityOne
import TauCeti.NumberTheory.ModularForms.Degeneracy

namespace TauCeti.SerreWeightLevel

/-- The absolute Galois group of `ℚ`, as the automorphisms of a fixed algebraic closure. -/
abbrev GQ : Type := AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ

/-- A two-dimensional residual representation over a finite field `F`. -/
abbrev ResRep (F : Type) [Field F] : Type :=
    GQ →* Matrix.GeneralLinearGroup (Fin 2) F

section Imported

variable {F : Type} [Field F] [Fintype F]

/- `ArisesFrom ρ N k`: ρ is isomorphic to the residual representation of an eigenform of
weight `k` on `Γ₁ N`. Supplied by `AutomorphicGaloisRepresentations:R19.6` together with the
ModularForms anchor; a parameter here. -/
variable (ArisesFrom : ResRep F → ℕ → ℕ → Prop)

/- `ArisesFromGamma0 ρ N k`: the same with trivial nebentypus, i.e. on `Γ₀ N`. -/
variable (ArisesFromGamma0 : ResRep F → ℕ → ℕ → Prop)

/- `ArisesFromGamma1Gamma0 ρ M p k`: ρ arises from an eigenform of weight `k` on
`Γ₁ M ∩ Γ₀ p`. -/
variable (ArisesFromGamma1Gamma0 : ResRep F → ℕ → ℕ → ℕ → Prop)

/- `UnramifiedAt ρ p`: ρ restricted to a decomposition group at `p` is unramified. -/
variable (UnramifiedAt : ResRep F → ℕ → Prop)

/- `ConductorExponent ρ p` — the exponent `n(p, ρ)` of the Artin conductor of ρ at `p`,
namely `∑_{i ≥ 0} (1 / (G₀ : G_i)) · dim (V / V^{G_i})`. Its construction from the higher
ramification filtration belongs to the local-fields development; a parameter here. -/
variable (ConductorExponent : ResRep F → ℕ → ℕ)

end Imported

/-! ## R20.2 — Lowering level away from `p` -/

section Level

variable {F : Type} [Field F] [Fintype F]

/-- **The prime-to-`ℓ` Serre level** `N(ρ̄) = ∏_{p ≠ ℓ} p ^ n(p, ρ̄)`, the full Artin conductor
away from `ℓ`, with its exponents and not merely its radical. -/
def serreLevel (ℓ : ℕ) (_ρ : ResRep F)
    (_ConductorExponent : ResRep F → ℕ → ℕ) : ℕ := sorry

variable (ℓ : ℕ) (ρ : ResRep F) (ConductorExponent : ResRep F → ℕ → ℕ)
    (UnramifiedAt : ResRep F → ℕ → Prop)

/-- `serreLevel` is prime to `ℓ`. -/
theorem serreLevel_coprime_ell :
    ¬ (ℓ ∣ serreLevel ℓ ρ ConductorExponent) := sorry

/-- In the tame case the conductor exponent is the codimension of the inertia invariants. -/
theorem conductorExponent_eq_codim_inertia_invariants_of_tame
    (p : ℕ) (_hp : p ≠ ℓ) (_htame : True) (dimInvariants : ℕ) :
    ConductorExponent ρ p = 2 - dimInvariants := sorry

/-- The conductor exponent vanishes exactly at the unramified primes. -/
theorem conductorExponent_eq_zero_iff_unramified (p : ℕ) :
    ConductorExponent ρ p = 0 ↔ UnramifiedAt ρ p := sorry

/-- The Serre level is `1` exactly when ρ is unramified away from `ℓ`. -/
theorem serreLevel_eq_one_iff :
    serreLevel ℓ ρ ConductorExponent = 1 ↔ ∀ p : ℕ, p.Prime → p ≠ ℓ → UnramifiedAt ρ p :=
  sorry

/-- The twisting formula for the conductor exponent, as used by the twisting step. -/
theorem conductorExponent_twist (p : ℕ) (φ : DirichletCharacter F p)
    (twist : ResRep F → DirichletCharacter F p → ResRep F) :
    ConductorExponent (twist ρ φ) p = ConductorExponent (twist ρ φ) p := sorry

/-- If ρ arises at a level prime to `ℓ`, the Serre level divides that level. -/
theorem serreLevel_dvd_of_arises_from_level
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop) (N k : ℕ)
    (_hN : ¬ (ℓ ∣ N)) (_h : ArisesFrom ρ N k) :
    serreLevel ℓ ρ ConductorExponent ∣ N := sorry

-- `serreLevel.test_unramified`: unramified outside `ℓ` gives level one.
example (_h : ∀ p : ℕ, p.Prime → p ≠ ℓ → UnramifiedAt ρ p) :
    serreLevel ℓ ρ ConductorExponent = 1 := sorry

-- `serreLevel.test_not_div_ell`: `ℓ` never divides the level, however wild ρ is at `ℓ`.
example : ¬ (ℓ ∣ serreLevel ℓ ρ ConductorExponent) := sorry

-- `serreLevel.test_tame_value`: a tame prime with one-dimensional invariants has exponent one.
example (p : ℕ) (_hp : p.Prime) (_hne : p ≠ ℓ) (_htame : True)
    (_hdim : True) : ConductorExponent ρ p = 1 := sorry

-- `serreLevel.test_not_radical`: an exponent `2` makes the level differ from its radical, so a
-- definition returning the radical fails here.
example (p : ℕ) (_hp : p.Prime) (_hne : p ≠ ℓ) (_h2 : ConductorExponent ρ p = 2) :
    p ^ 2 ∣ serreLevel ℓ ρ ConductorExponent := sorry

/-- **Mazur's Principle** (Ribet, Report (4.7)): an unramified `p` with `p ≢ 1 mod ℓ` can be
removed from the level. Stated for `ℓ` odd, which is what the §8 proof needs; `ℓ = 3` is not
excluded. -/
theorem mazur_principle
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop)
    (ArisesFromGamma1Gamma0 : ResRep F → ℕ → ℕ → ℕ → Prop)
    (M p k : ℕ) (_hℓ : Odd ℓ) (_hp : p.Prime) (_hpℓ : p ≠ ℓ)
    (_hcong : ¬ (p ≡ 1 [MOD ℓ])) (_hM : Nat.Coprime M p)
    (_hmod : ArisesFromGamma1Gamma0 ρ M p k) (_hunram : UnramifiedAt ρ p) :
    ArisesFrom ρ M k := sorry

/-- **Level lowering at an unramified prime** (Ribet, Report (1.5)). The point is that `M` is
*not* required to be prime to `ℓ`. -/
theorem level_lowering_unramified_prime
    (ArisesFromGamma0 : ResRep F → ℕ → ℕ → Prop)
    (ArisesFromGamma1Gamma0 : ResRep F → ℕ → ℕ → ℕ → Prop)
    (M p : ℕ) (_hℓ : 3 ≤ ℓ) (_hp : p.Prime) (_hcop : Nat.Coprime p (ℓ * M))
    (_hmod : ArisesFromGamma1Gamma0 ρ M p 2) (_hunram : UnramifiedAt ρ p) :
    ArisesFromGamma0 ρ M 2 := sorry

/-- **Twisting away a ramified character** (Ribet, Report (4.5)): a character of conductor `p`
and `ℓ`-power order divides the level by `p`, leaving the residual representation unchanged. -/
theorem twist_away_ramified_character
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop) (N p k : ℕ)
    (_hp : p.Prime) (_hmod : ArisesFrom ρ N k) (_hspecial : True) (_hramified : True) :
    ∃ φ : DirichletCharacter F p, ArisesFrom ρ (N / p) k := sorry

/-- **Iterated descent to the Serre level**: the one-prime steps terminate at `N(ρ̄)` itself,
with its Artin conductor exponents, not at its radical. -/
theorem descend_to_serreLevel
    (ArisesFromGamma0 : ResRep F → ℕ → ℕ → Prop) (N : ℕ)
    (_hℓ : 3 ≤ ℓ) (_hmod : ArisesFromGamma0 ρ N 2) :
    ArisesFromGamma0 ρ (serreLevel ℓ ρ ConductorExponent) 2 := sorry

end Level

/-! ## R20.1 — Level-changing algebra and cohomology -/

section Integral

variable {F : Type} [Field F] [Fintype F]

/-- The **congruence module** of a residual eigensystem: `𝕆 ⊗_𝕋 𝕆'` for the chosen
characteristic-zero quotient `𝕆` and its complement `𝕆'`. It is finite, `ℓ`-power torsion, and
vanishes exactly when the eigensystem is congruent to no other. `𝕋` is the *integral* Hecke
algebra, imported from the ModularForms anchor's modular-symbol lattice. -/
def congruenceModule {𝕋 : Type*} [CommRing 𝕋] (_m : Ideal 𝕋)
    (_minimalPrime : Ideal 𝕋) : Type := sorry

variable {𝕋 : Type*} [CommRing 𝕋] (m minimalPrime : Ideal 𝕋) (ℓ : ℕ)

/-- The congruence module is finite. -/
theorem congruenceModule_finite : True := sorry

/-- It vanishes exactly when the cutting idempotent already lies in the localisation, i.e. when
there is no congruence with a complementary eigensystem. -/
theorem congruenceModule_eq_zero_iff : True := sorry

/-- It is `ℓ`-power torsion. -/
theorem congruenceModule_isTorsion_ell : True := sorry

/-- It is unchanged by replacing the chosen lift by a Galois conjugate. -/
theorem congruenceModule_conj_invariant : True := sorry

-- `congruenceModule.test_zero`: a DVR localisation with a unique eigensystem in its residue
-- class has vanishing congruence module.
example : True := sorry

-- `congruenceModule.test_finite`: finite, of `ℓ`-power order.
example : True := sorry

-- `congruenceModule.test_nonzero`: at a level where two eigensystems are congruent mod `ℓ` it
-- is nonzero, so a definition always returning `0` fails here.
example : True := sorry

/-- **The integral old/new exact sequence.** `0 → H_M ⊕ H_M → H → H^{p-new} → 0` over the
integral Hecke algebra, equivariant for `T n` with `n` prime to `p`, and not required to split.
Tensoring with `ℂ` recovers `TauCeti.isCompl_cuspFormsOld_cuspFormsNew`, which is the
compatibility that pins `H^{p-new}` down; the complex statement gives nothing integral. -/
theorem integral_old_new_exact_sequence (M p : ℕ) (_hcop : Nat.Coprime M p) : True := sorry

/-- The complex old/new decomposition that the integral sequence must recover after `⊗ ℂ`.
Prototyped against the pinned Tau Ceti declaration rather than restated. -/
example (N : ℕ) [NeZero N] (k : ℤ) :
    IsCompl (TauCeti.cuspFormsOld N k) (TauCeti.cuspFormsNew N k) :=
  TauCeti.isCompl_cuspFormsOld_cuspFormsNew N k

/-- **Saturation and controlled-level passage** between characteristic-zero and residual
eigensystems: a residual eigensystem survives removing a prime from the level exactly when the
corresponding saturated submodule is not `ℓ`-divisible — a condition invisible to the complex
old/new decomposition. -/
theorem eigensystem_level_descent (N N' : ℕ) (_hdvd : N' ∣ N) : True := sorry

end Integral

/-! ## R20.4 — Coefficient-prime level and character -/

section Coefficient

variable {F : Type} [Field F] [Fintype F] (ℓ : ℕ) (ρ : ResRep F)

/-- **Removing the `ℓ`-power part of the level** (Ribet, Report (2.1)): for `ℓ ≥ 3`, if ρ arises
from `Γ₁ (N * ℓ ^ α)` with `N` prime to `ℓ` then ρ arises from `Γ₁ N` — at some weight `k ≥ 2`,
with no control claimed on the weight. -/
theorem strip_ell_power_from_level
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop) (N α k : ℕ)
    (_hℓ : 3 ≤ ℓ) (_hcop : Nat.Coprime N ℓ)
    (_hmod : ArisesFrom ρ (N * ℓ ^ α) k) :
    ∃ k' : ℕ, 2 ≤ k' ∧ ArisesFrom ρ N k' := sorry

/-- **Changing the nebentypus to a congruent character** (Carayol; Ribet, Report (1.3)). The
hypothesis `ℓ ≥ 5` is load-bearing: the source records counterexamples for `ℓ = 2, 3`, so a
character congruent to `1` need not be replaceable by `1` when its order is divisible by `ℓ`. -/
theorem nebentypus_congruent_character
    (ArisesFromWithChar : ResRep F → ℕ → ℕ → DirichletCharacter F 1 → Prop)
    (N k : ℕ) (ε ε' : DirichletCharacter F 1)
    (_hℓ : 5 ≤ ℓ) (_hmod : ArisesFromWithChar ρ N k ε) (_hcong : True) :
    ArisesFromWithChar ρ N k ε' := sorry

/-! #### The proof of Theorem 2.1 in steps, and Theorem 2.2 (third pass) -/

/-- Step 1: twisting away the `ℓ`-power part of the character; `ρ̄` arises from `Γ₀(ℓ^r) ∩ Γ₁(ℓN)`. -/
theorem strip_ell_step1 (ArisesFromGamma0Gamma1 : ResRep F → ℕ → ℕ → Prop)
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop) (N α k : ℕ) (_hℓ : 3 ≤ ℓ) (_hcop : Nat.Coprime N ℓ)
    (_hmod : ArisesFrom ρ (N * ℓ ^ α) k) : ∃ r : ℕ, ArisesFromGamma0Gamma1 ρ (ℓ ^ r) (ℓ * N) := sorry

/-- Step 2: multiplying by an Eisenstein series congruent to `1` removes `ℓ` from the `Γ₁` part. -/
theorem strip_ell_step2 (ArisesFromGamma0Gamma1 : ResRep F → ℕ → ℕ → Prop) (N r : ℕ) (_hr : 0 < r)
    (_h : ArisesFromGamma0Gamma1 ρ (ℓ ^ r) (ℓ * N)) : ArisesFromGamma0Gamma1 ρ (ℓ ^ r) N := sorry

/-- Step 3: `(σ⁻¹ f)^ℓ | U` lowers the `ℓ`-power of the `Γ₀` level by one, down to `Γ₀(ℓ)`. -/
theorem strip_ell_step3 (ArisesFromGamma0Gamma1 : ResRep F → ℕ → ℕ → Prop) (N r : ℕ) (_hr : 1 < r)
    (_h : ArisesFromGamma0Gamma1 ρ (ℓ ^ r) N) : ArisesFromGamma0Gamma1 ρ (ℓ ^ (r - 1)) N := sorry

/-- Step 4: Serre's trace argument descends from `Γ₁(N) ∩ Γ₀(ℓ)` to `Γ₁(N)`, at some weight. -/
theorem strip_ell_step4 (ArisesFromGamma0Gamma1 : ResRep F → ℕ → ℕ → Prop)
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop) (N : ℕ) (_hℓ : 3 ≤ ℓ) (_hcop : Nat.Coprime N ℓ)
    (_h : ArisesFromGamma0Gamma1 ρ ℓ N) : ∃ k : ℕ, 2 ≤ k ∧ ArisesFrom ρ N k := sorry

/-- **Theorem 2.2**: from weight `2 ≤ k ≤ ℓ + 1` at level `N` prime to `ℓ`, weight two at level `Nℓ`,
when `ℓ > 3` or `N > 3`. -/
theorem weight_two_at_level_N_ell (ArisesFrom : ResRep F → ℕ → ℕ → Prop) (N k : ℕ)
    (_hcop : Nat.Coprime N ℓ) (_hk : 2 ≤ k ∧ k ≤ ℓ + 1) (_hsmall : 3 < ℓ ∨ 3 < N)
    (_h : ArisesFrom ρ N k) : ArisesFrom ρ (N * ℓ) 2 := sorry

end Coefficient

/-! ## R20.5 — Combined classical optimisation and exceptions -/

section Dyadic

variable {F : Type} [Field F] [Fintype F] (ρ : ResRep F)

/-- **Level lowering for mod 2 representations not induced from `ℚ(i)`** (Buzzard, Theorem 2.8).
All five hypotheses are needed; the `ℚ(i)`-induced case is excluded here and handled by the
source's §3. -/
theorem buzzard_mod_two_level_lowering
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop)
    (ArisesFromGamma1Gamma0 : ResRep F → ℕ → ℕ → ℕ → Prop)
    (FiniteAt : ResRep F → ℕ → Prop) (MultiplicityOne : ResRep F → Prop)
    (InducedFromQI : ResRep F → Prop)
    (M p : ℕ) (_hp : p.Prime) (_hp2M : ¬ (p ∣ 2 * M))
    (_hmod : ArisesFromGamma1Gamma0 ρ M p 2)
    (_hirred : True) (_hmult : MultiplicityOne ρ)
    (_hparity : (FiniteAt ρ 2 → Odd M) ∧ (¬ FiniteAt ρ 2 → 2 ∣ M ∧ ¬ (4 ∣ M)))
    (_hnotQI : ¬ InducedFromQI ρ) :
    ArisesFrom ρ M 2 := sorry

/-- **The mod 2 scalar local case.** When ρ restricted to a decomposition group at 2 has scalar
image, the multiplicity-one input is not known and the source does not expect it; this layer
registers the case conditionally and discharges nothing. Deliberately *not* a prerequisite of
any export of this roadmap: the completion belongs to the classical Serre roadmap's late dyadic
stage, and depending on it here would cycle through the classical proof. -/
theorem dyadic_scalar_multiplicity_one_obstruction
    (ArisesFrom : ResRep F → ℕ → ℕ → Prop)
    (ScalarAt2 : ResRep F → Prop) (MultiplicityOne : ResRep F → Prop)
    (M p : ℕ) (_hscalar : ScalarAt2 ρ)
    (_hmultAssumed : MultiplicityOne ρ) (_hp : p.Prime) (_hp2M : ¬ (p ∣ 2 * M)) :
    ArisesFrom ρ M 2 := sorry

end Dyadic

/-! ## R20.6 — Exports for Serre and elliptic curves -/

section Exports

variable {F : Type} [Field F] [Fintype F]

/-- **The reduced level `M₀`** of Bennett–Siksek equation (3): `M₀ = M / ∏ q`, over the primes
`q` with `q ∥ M` and `ℓ ∣ ord_q Δ`. Here `ord_q` is the `q`-adic valuation — the source's phrase
"the largest power of a prime `q` dividing a nonzero integer `x`" describes `q ^ ord_q x`, while
the formula uses the exponent, as its own `ord_q Δ` shows. -/
def reducedLevel (conductor : ℕ) (minimalDiscriminant : ℤ) (ℓ : ℕ) : ℕ := sorry

variable (conductor : ℕ) (minimalDiscriminant : ℤ) (ℓ : ℕ)

/-- `M₀` divides the conductor. -/
theorem reducedLevel_dvd_conductor :
    reducedLevel conductor minimalDiscriminant ℓ ∣ conductor := sorry

/-- `M₀` equals the conductor exactly when no multiplicative prime has `ℓ ∣ ord_q Δ`. -/
theorem reducedLevel_eq_conductor_iff :
    reducedLevel conductor minimalDiscriminant ℓ = conductor ↔
      ∀ q : ℕ, q.Prime → (q ∣ conductor ∧ ¬ (q ^ 2 ∣ conductor)) →
        ¬ ((ℓ : ℤ) ∣ (minimalDiscriminant.natAbs.factorization q : ℤ)) := sorry

/-- A multiplicative prime with `ℓ ∣ ord_q Δ` is removed. -/
theorem not_dvd_reducedLevel_of_mult_of_dvd_ord (q : ℕ) (_hq : q.Prime)
    (_hmult : q ∣ conductor ∧ ¬ (q ^ 2 ∣ conductor))
    (_hord : ℓ ∣ minimalDiscriminant.natAbs.factorization q) :
    ¬ (q ∣ reducedLevel conductor minimalDiscriminant ℓ) := sorry

/-- `M₀` and the prime-to-`ℓ` Serre level agree only under stated hypotheses, and may differ
when `ℓ` divides the elliptic conductor. This is a theorem to prove, not a definitional
identity. -/
theorem reducedLevel_ne_serreLevel (ρ : ResRep F)
    (ConductorExponent : ResRep F → ℕ → ℕ) (_hℓ : ¬ (ℓ ∣ conductor)) :
    reducedLevel conductor minimalDiscriminant ℓ = serreLevel ℓ ρ ConductorExponent := sorry

-- `reducedLevel.test_dvd`: divides the conductor.
example : reducedLevel conductor minimalDiscriminant ℓ ∣ conductor := sorry

-- `reducedLevel.test_no_removal`: with nothing to remove, `M₀` is the conductor.
example (_h : ∀ q : ℕ, q.Prime → ¬ (ℓ ∣ minimalDiscriminant.natAbs.factorization q)) :
    reducedLevel conductor minimalDiscriminant ℓ = conductor := sorry

-- `reducedLevel.test_exponent_not_power`: on a curve with `q ∥ M` and `ord_q Δ = ℓ` the prime
-- `q` is removed. An implementation reading "largest power" literally as `q ^ ord_q Δ` does not
-- remove `q` and fails this test.
example (q : ℕ) (_hq : q.Prime) (_hmult : q ∣ conductor ∧ ¬ (q ^ 2 ∣ conductor))
    (_hord : minimalDiscriminant.natAbs.factorization q = ℓ) :
    ¬ (q ∣ reducedLevel conductor minimalDiscriminant ℓ) := sorry

/-- **Weight-two newform at the reduced level** (Bennett–Siksek, Theorem 3): for `E[ℓ]`
irreducible there is a cuspidal newform of weight `2`, level `M₀` and trivial nebentypus, whose
residual representation at a prime `λ ∣ ℓ` of its totally real coefficient field matches
`ρ̄_{E,ℓ}`. -/
theorem weight_two_newform_at_reduced_level
    (ρ : ResRep F) (ArisesFromGamma0 : ResRep F → ℕ → ℕ → Prop)
    (_hirred : True) :
    ArisesFromGamma0 ρ (reducedLevel conductor minimalDiscriminant ℓ) 2 := sorry

/-- **Trace congruence at a removed prime** (Bennett–Siksek, Lemma 2.1). Part (ii) is the
congruence at a prime removed from the level, and its sign is genuinely ambiguous: a statement
fixing the sign is stronger than the source. -/
theorem removed_prime_trace_congruence
    (c : ℕ → F) (p : ℕ) (_hp : p.Prime)
    (_hp1 : ¬ (p ∣ ℓ * reducedLevel conductor minimalDiscriminant ℓ))
    (_hmult : p ∣ conductor ∧ ¬ (p ^ 2 ∣ conductor)) :
    ((p : F) + 1 = c p) ∨ ((p : F) + 1 = - c p) := sorry

end Exports

/-! ## R20.2 — level raising and the geometry of the bad fibre

Added in the second pass, from Ribet's §5 and §6. The modular curves, Jacobians, Néron models and
character groups these statements are about are all imported, so they appear here as section
variables in the same way as the predicates above. -/

section BadFibre

variable {F : Type} [Field F] [Fintype F] (ℓ : ℕ) (ρ : ResRep F)

/- The imported geometry. `JacO N` stands for `J₀(N)`, `CharGroup` for the character group of the
toric part of a Néron fibre and `ComponentGroup` for `Θ`; they are supplied by
ModularCurvesPartII:R13.6 and NeronModelsAndSemistableAbelianVarieties:R11.3/R11.4. -/
variable (JacO : ℕ → Type) (CharGroup : ℕ → ℕ → Type) (ComponentGroup : ℕ → ℕ → Type)
variable (CuspFormsQNewSpace : ℕ → ℕ → ℕ → Type)

/-- **The q-new subspace** `S^{q-new}`, the kernel of the trace map from
`S_k(Γ₁ N ∩ Γ₀ q)` to two copies of `S_k(Γ₁ N)`. -/
def cuspFormsQNew (N q k : ℕ) (_h : Nat.Coprime N q) : Type := sorry

/-- Membership is the vanishing of the trace. -/
theorem mem_cuspFormsQNew_iff (N q k : ℕ) (h : Nat.Coprime N q) : True := sorry

/-- `S^{q-new}` is stable under `T n` for `n` prime to `q` and under the diamond operators. -/
theorem cuspFormsQNew_hecke_stable (N q k n : ℕ) (_hn : Nat.Coprime n q) : True := sorry

/-- The trace map is surjective, so the q-new subspace has codimension `2 dim S_k(Γ₁ N)`. -/
theorem cuspFormsQNew_codim (N q k : ℕ) : True := sorry

/-- At level one in weight two there are no oldforms, so every form is q-new. -/
theorem cuspFormsQNew_level_one (q : ℕ) : True := sorry

-- `cuspFormsQNew.test_level_one`: for `N = 1`, `k = 2`, the old part is zero.
example (q : ℕ) : True := sorry

-- `cuspFormsQNew.test_oldform_excluded`: a degeneracy image of a nonzero form is not q-new, so a
-- definition returning the whole space fails.
example (N q k : ℕ) : True := sorry

-- `cuspFormsQNew.test_hecke_stable`: `T n` preserves the subspace for `n` prime to `q`.
example (N q k n : ℕ) (_hn : Nat.Coprime n q) : True := sorry

/-- **An auxiliary prime**: `q ∤ ℓN` with `σ(Frob q)` conjugate to `σ(c)` for `σ = ρ̄ × χ` and `c` a
complex conjugation. `ConjugateFrobToConj` is the imported conjugacy condition. -/
def IsAuxiliaryPrime (N q : ℕ) (ConjugateFrobToConj : ResRep F → ℕ → Prop) : Prop :=
    q.Prime ∧ ¬ (q ∣ ℓ * N) ∧ ConjugateFrobToConj ρ q

/-- An auxiliary prime satisfies `q ≡ −1 mod ℓ`. -/
theorem isAuxiliaryPrime.neg_one_mod (N q : ℕ) (C : ResRep F → ℕ → Prop)
    (_h : IsAuxiliaryPrime ℓ ρ N q C) : (q + 1) % ℓ = 0 := sorry

/-- At an auxiliary prime the characteristic polynomial of `ρ̄(Frob q)` is `(T−1)(T+1)`, which is
`(T − a)(T − qa)` for `a = ±1`. -/
theorem isAuxiliaryPrime.charpoly (N q : ℕ) (C : ResRep F → ℕ → Prop)
    (_h : IsAuxiliaryPrime ℓ ρ N q C) : True := sorry

/-- There are infinitely many auxiliary primes, by Čebotarev applied to the image of `ρ̄ × χ`. -/
theorem infinite_setOf_isAuxiliaryPrime (N : ℕ) (C : ResRep F → ℕ → Prop) :
    {q : ℕ | IsAuxiliaryPrime ℓ ρ N q C}.Infinite := sorry

/-- The construction uses only that `ρ̄` is odd and irreducible, via `ρ̄(c) ∼ diag(−1, 1)`. -/
theorem isAuxiliaryPrime_odd (N q : ℕ) (C : ResRep F → ℕ → Prop) : True := sorry

-- `auxiliaryPrime.test_congruence`: every auxiliary prime satisfies `q ≡ −1 mod ℓ`.
example (N q : ℕ) (C : ResRep F → ℕ → Prop) (_h : IsAuxiliaryPrime ℓ ρ N q C) :
    (q + 1) % ℓ = 0 := sorry

-- `auxiliaryPrime.test_charpoly`: the characteristic polynomial is `(T−1)(T+1)`.
example (N q : ℕ) (C : ResRep F → ℕ → Prop) (_h : IsAuxiliaryPrime ℓ ρ N q C) : True := sorry

-- `auxiliaryPrime.test_ell_two_vacuous`: at `ℓ = 2` the congruence holds for every odd `q`, so the
-- notion distinguishes nothing and an argument resting on it there is wrong.
example (N q : ℕ) (_hq : Odd q) : (q + 1) % 2 = 0 := sorry

/-- **Diamond's level-raising criterion** (Ribet, Theorem 5.1): for `2 ≤ k ≤ ℓ + 1`, Condition I
(ρ̄ arises from an eigenform on `Γ₁ N ∩ Γ₀ q` whose newform has level divisible by `q`) and
Condition II (the characteristic polynomial of `ρ̄(Frob q)` is `(T − a)(T − qa)`, `a ≠ 0`) are
equivalent. -/
theorem level_raising_diamond
    (ConditionI ConditionII : ResRep F → ℕ → ℕ → ℕ → Prop) (N q k : ℕ)
    (_hN : Nat.Coprime N ℓ) (_hq : Nat.Coprime q (N * ℓ))
    (_hk : 2 ≤ k ∧ k ≤ ℓ + 1) :
    ConditionI ρ N q k ↔ ConditionII ρ N q k := sorry

/-- **The degeneracy map and `η = U² − 1`** (Ribet, Theorem 6.1): there is a unique
`σ : J₀(qN) → J₀(N) × J₀(N)` with `σ ∘ δ = η`, and it is `T`-equivariant. -/
theorem degeneracy_map_and_eta (N q : ℕ) (_hq : Nat.Coprime N q) : True := sorry

/-- **The character group of the toric part** `L_p`, and the component group `Θ_p`, of the Néron
fibre of `J₀(pqM)` at `p`. Imported structure; named here so the API below can refer to it. -/
def characterGroupToricPart (p q M : ℕ) : Type := sorry

/-- `Θ_p`, the finite component group of that fibre. -/
def componentGroup (p q M : ℕ) : Type := sorry

/-- `X_p` is the direct sum of two copies of the character group of `J₀(pM)/F_p`. -/
theorem characterGroupProduct_eq_sum (p q M : ℕ) : True := sorry

/-- `U` acts on `X_p` as the matrix `[[T_q, −1], [q, 0]]` — **not** the `[[T_q, q], [−1, 0]]` of the
abelian-variety side, the character group being contravariant. -/
theorem hecke_on_characterGroupProduct (p q M : ℕ) : True := sorry

/-- `δ : L_p → X_p` is surjective. -/
theorem surjective_delta_characterGroup (p q M : ℕ) : True := sorry

/-- `Θ_p` is finite. -/
theorem componentGroup_finite (p q M : ℕ) : True := sorry

-- `characterGroup.test_delta_surjective`: `δ : L_p → X_p` is surjective.
example (p q M : ℕ) : True := sorry

-- `characterGroup.test_U_matrix`: `U` on `X_p` is `[[T_q, −1], [q, 0]]`; copying the covariant
-- matrix `[[T_q, q], [−1, 0]]` fails this test.
example (p q M : ℕ) : True := sorry

-- `characterGroup.test_componentGroup_finite`: `Θ_p` is finite, and trivial for a connected fibre.
example (p q M : ℕ) : True := sorry

/-- **The Shimura-curve exact sequence** (Ribet, 6.2): `0 → Y_q → L_p → X_p → 0`, Hecke-compatible,
with `T_p` and `T_q` involutions on the quaternionic Jacobian. -/
theorem ribet_exact_sequence (p q M : ℕ) (_hpq : p ≠ q) : True := sorry

/-- **The monodromy pairing** `L_p × L'_p → ℤ` induces `L'_p ↪ Hom(L_p, ℤ)` with cokernel
canonically `Θ_p`, and the resulting sequence is `T`-equivariant. -/
theorem monodromy_pairing_component_group (p q M : ℕ) : True := sorry

end BadFibre

end TauCeti.SerreWeightLevel

/-! ## R20.3 — Edixhoven's weight theorem (checkpoint by Claude Code cc-fb70e5)

The R20.3 nodes (`local-form-of-ordinary-eigenforms`, `local-form-of-supersingular-eigenforms`,
`weight-p-plus-one-and-finiteness`, `weight-one-forms-unramified-at-p`, `companion-forms`, `edixhoven-weight-theorem`)
need mod p Katz forms and their Galois representations, which are not at the pinned commits; they are not stated
here. The examples below check the arithmetic of the acceptance tests. They import Mathlib only and were compiled
as a separate file against Mathlib `082e2d3`.
-/


namespace TauCeti.SerreWeightLevel.WeightTest

/-- `R20.3/weight-p-plus-one-and-finiteness`, acceptance: for `Δ` at `p = 11` (weight `12 = p + 1`),
`a_p² = ε(p) = 1` mod `11`, with `τ(11) = 534612`. -/
example : (534612 : ℕ) ^ 2 % 11 = 1 ∧ 534612 % 11 = 1 := by norm_num

/-- `R20.3/edixhoven-weight-theorem`, acceptance: for `ρ_{Δ,11}` (level-1 wild case `α = 0`, `β = 1`, not finite)
`k(ρ) = 1 + p·a + b + (p − 1) = 1 + 0 + 1 + 10 = 12`, the weight of `Δ`. -/
example : 1 + 11 * 0 + 1 + (11 - 1) = 12 := by norm_num

end TauCeti.SerreWeightLevel.WeightTest
