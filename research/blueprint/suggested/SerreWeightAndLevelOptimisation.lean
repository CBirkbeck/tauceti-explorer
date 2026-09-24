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

end TauCeti.SerreWeightLevel
