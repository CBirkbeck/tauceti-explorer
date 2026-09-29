import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Idempotent
import Mathlib.Algebra.Polynomial.Degree.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Tactic.ComputeDegree

/-!
# Suggested Lean forms: ordinary automorphic forms and ordinary modularity lifting (R21.1–R21.6: SW §§2–8, BLZ, DP p = 3, SW 2001)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`OrdinaryAutomorphicFormsAndModularityLifting`) is definitive. The statements below suggest Lean
forms, so that contributors and reviewers converge on names and signatures. Every proof of a new
declaration is `sorry` unless it is a small checked identity; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Conventions

* `F` is totally real of even degree, `D/F` the quaternion algebra ramified exactly at the
  infinite places, `X(U) = D^× \ G^D(A_f) / U` and `H⁰(X(U), R) = X(U) → R`. These objects are
  requested from HilbertModularVarietiesAndShimuraCurves R18.3; here only their finite-set shadow
  (functions on a finite type) is prototyped.
* The ordinary projector is PadicFamilies L0a's `lim T^{n!}`; Skinner–Wiles' exponent
  `p^n (p^m - 1)` gives the same idempotent (`R21.1/projector-exponent-comparison`).
* `Λ′_𝒪` (variables `X_i`, `Y`) is the weight algebra of `T_∞(U, 𝒪)`; `Λ_𝒪` (variables `T_j`, `Y`)
  is the one at a permissible maximal ideal.
-/

namespace TauCeti.OrdinaryModularity

section FiniteSets

variable {X Y R : Type*} [Fintype X] [Fintype Y] [DecidableEq X]

/-- **`R21.1/ordinary-hecke-adjoint-pairing`**: the stabiliser-weighted pairing
`⟨f, g⟩ = Σ c(x)⁻¹ f(x) g(x)` on functions on a finite set. -/
def quaternionicPairing [Field R] (c : X → ℕ) (f g : X → R) : R :=
  ∑ x, ((c x : R))⁻¹ * f x * g x

/-- **`R21.1/ordinary-trace-compatibility`**: the trace along a map of finite sets,
`tr g (x) = Σ_{π y = x} g y`. -/
def traceAlong [AddCommMonoid R] (π : Y → X) (g : Y → R) : X → R :=
  fun x => ∑ y ∈ Finset.univ.filter (fun y => π y = x), g y

/-- Restriction and trace are adjoint for the unweighted pairing:
`Σ_y f(π y) g(y) = Σ_x f(x) (tr g)(x)`. -/
theorem sum_comp_mul_eq_sum_mul_traceAlong [CommSemiring R] (π : Y → X) (f : X → R)
    (g : Y → R) : ∑ y, f (π y) * g y = ∑ x, f x * traceAlong π g x := by
  simp only [traceAlong, Finset.mul_sum]
  rw [← Finset.sum_fiberwise Finset.univ π (fun y => f (π y) * g y)]
  refine Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun y hy => ?_
  rw [(Finset.mem_filter.1 hy).2]

omit [DecidableEq X] in
/-- With all stabilisers trivial the weighted pairing is the dot product. -/
theorem quaternionicPairing_one [Field R] (f g : X → R) :
    quaternionicPairing (fun _ => 1) f g = ∑ x, f x * g x := by
  simp [quaternionicPairing]

end FiniteSets

/-!
### R21.1 and R21.2: signatures (comment only)

```
-- R21.1/quaternionic-ordinary-projector (H⁰, T₀(p) from R18.3; projector from PadicFamilies L0a)
def ordinaryProjector (U : Level F) (a : ℕ) (R : Type) [Module 𝒪 R] [Finite R] :
    Module.End 𝒪 (H0 (U.full a) R) := PadicFamilies.ordinaryProjector (T0p U a R)
theorem ordinaryProjector_isIdempotentElem : IsIdempotentElem (ordinaryProjector U a R)
theorem ordinaryProjector_comm_hecke (t : quaternionicHeckeAlgebra U a 𝒪) :
    Commute (ordinaryProjector U a R) (t.toEnd R)
theorem ordinaryProjector_trace (hab : a ≤ b) :
    trace hab ∘ₗ ordinaryProjector U b R = ordinaryProjector U a R ∘ₗ trace hab
-- R21.1/ordinary-part-kills-norm-forms
theorem ordinaryProjector_normForms (ha : 1 ≤ a) (f : normForms U a ℤ) :
    ordinaryProjector U a R (f.toCoeff R) = 0
-- R21.1/quaternionic-nearly-ordinary-hecke-algebra
def nearlyOrdinaryHeckeAlgebra (U a 𝒪) : Subalgebra 𝒪 (Module.End 𝒪 (ordinaryPart U a 𝒪))
def hidaHeckeAlgebra (U 𝒪) : Type := lim_a nearlyOrdinaryHeckeAlgebra U a 𝒪
def hidaHeckeAlgebra.lambdaAlgebra : Algebra (MvPowerSeries (Fin δ ⊕ torusVars F) 𝒪) (hidaHeckeAlgebra U 𝒪)
-- R21.1/ordinary-towers-duality
def mInfinity (U 𝒪) := lim_a (ordinaryPart U a 𝒪)⁺   -- along traces
def hInfinity (U 𝒪) := colim_a ordinaryPart U a (K ⧸ 𝒪)   -- along pullbacks
def mInfinity_equiv_dual : mInfinity U 𝒪 ≃ₗ[hidaHeckeAlgebra U 𝒪] (hInfinity U 𝒪 →ₗ[𝒪] K ⧸ 𝒪)
-- R21.2/nearly-ordinary-representations
def IsVGoodLine (π : CuspidalRep F k) (v : PrimeAbove p) (L : Submodule ℂ (π.localFixed v a)) : Prop
def IsNearlyOrdinary (π : CuspidalRep F k) : Prop := ∀ v : PrimeAbove p, ∃ L, IsVGoodLine π v L
-- R21.2/permissible-maximal-ideal
structure IsPermissible (χ : GaloisCharacter F k) (m : Ideal (hidaHeckeAlgebra U 𝒪)) : Prop where
  isMaximal : m.IsMaximal
  groupRing : m.comap (groupRingHom U 𝒪) = RingHom.ker (charMod (χ * ω⁻¹))
  T0_sub_one_mem : ∀ i, T0 (primeAbove i) - 1 ∈ m
  T_sub_mem : ∀ ℓ ∉ badPrimes U, T ℓ - 1 - teichmuller (χ (Frob ℓ)) ∈ m
-- R21.2/eisenstein-ideal-existence (Deligne–Ribet from AutomorphicPadicLFunctions L3)
theorem exists_isPermissible (h : 0 < valuation π (deligneRibet F (χ * ω) (-1))) :
    ∃ a (m : Ideal (nearlyOrdinaryHeckeAlgebra (levelChi χ) a 𝒪)), IsPermissible χ m
-- R21.2/permissible-localisation-finite
theorem isPermissible.finite (hm : IsPermissible χ m) :
    Module.Finite Λ (Localization.AtPrime m) ∧ Module.IsTorsionFree Λ (Localization.AtPrime m)
-- R21.2/auxiliary-level-freeness
theorem mInfinity_free_aux (hfree : FixedPointFree (U' w)) :
    Module.Free (MvPowerSeries _ 𝒪 ⊗ 𝒪⟦Δ w⟧) (mInfinity (U'' w) 𝒪)
```
-/

end TauCeti.OrdinaryModularity

namespace TauCeti.OrdinaryModularity.SuggestedTest

open Polynomial

/-- `R21.1/projector-exponent-comparison`: a unit `u` of `ℤ/25` satisfies `u^{p(p-1)} = 1` for
`p = 5`, the model for `T₀(p)^{p^n (p^m - 1)} → 1` on the part where `T₀(p)` is a unit. -/
example : (2 : ZMod 25) ^ (5 * 4) = 1 := by decide

/-- `R21.1/ordinary-part-kills-norm-forms`: on norm-factoring forms `T₀(p)` is divisible by `p`,
hence nilpotent on finite coefficients; here `5³ = 0` in `ℤ/125`. -/
example : (5 : ZMod 125) ^ 3 = 0 := by decide

/-- `R21.1/ordinary-level-independence`: `diag(1, ϖ) · (1 0; x 1) = (1 0; ϖx 1) · diag(1, ϖ)`. -/
example {R : Type*} [CommRing R] (ϖ x : R) :
    (!![1, 0; 0, ϖ] : Matrix (Fin 2) (Fin 2) R) * !![1, 0; x, 1] =
      !![1, 0; ϖ * x, 1] * !![1, 0; 0, ϖ] := by
  simp

/-- Source issue `E1`: `(1 + T)^{p^r} - 1` has degree `p^r`, so `Λ_𝒪` has rank `p^{Σ r_j}` over
`Λ′_𝒪`, not `Σ r_j`; here `p = 5`, `r = 1`. -/
example : ((X + 1 : ℤ[X]) ^ 5 - 1).natDegree = 5 := by
  compute_degree!

/-- `R21.2/permissible-maximal-ideal`, the degree-one test: Ramanujan's congruence
`τ(ℓ) ≡ 1 + ℓ^{11} mod 691` at `ℓ = 2, 3` (`τ(2) = -24`, `τ(3) = 252`). -/
example : (-24 : ZMod 691) = 1 + 2 ^ 11 ∧ (252 : ZMod 691) = 1 + 3 ^ 11 := by
  decide

/-- `R21.3/pseudo-representation`: for `ρ(σ) = (a b; c d)`, `x(σ, τ) = b_σ c_τ` satisfies the fourth
identity `x(στ, αβ) = a(σ)a(β)x(τ, α) + a(β)d(τ)x(σ, α) + a(σ)d(α)x(τ, β) + d(τ)d(α)x(σ, β)`,
since `b_{στ} = a_σ b_τ + b_σ d_τ` and `c_{αβ} = c_α a_β + d_α c_β`. -/
example {R : Type*} [CommRing R] (aσ bσ bτ dτ cα dα aβ cβ : R) :
    (aσ * bτ + bσ * dτ) * (cα * aβ + dα * cβ) =
      aσ * aβ * (bτ * cα) + aβ * dτ * (bσ * cα) + aσ * dα * (bτ * cβ) + dτ * dα * (bσ * cβ) := by
  ring

/-- `R21.3/deformation-iwasawa-algebra` and source issue `E3`: for `ρ|_{D_i}` upper triangular with
diagonal `(ψ₁, ψ₂)` and `g` with `ψ₁(g) = β`, `ψ₂(g) = α`, the unramified-quotient character is
`ψ₂(σ) = (β - α)⁻¹ (β tr ρ(σ) - tr ρ(gσ))`. -/
example {K : Type*} [Field K] (α β p₁ p₂ : K) (h : β - α ≠ 0) :
    (β - α)⁻¹ * (β * (p₁ + p₂) - (β * p₁ + α * p₂)) = p₂ := by
  rw [show β * (p₁ + p₂) - (β * p₁ + α * p₂) = (β - α) * p₂ by ring, ← mul_assoc,
    inv_mul_cancel₀ h, one_mul]

/-- Source issue `E3`: without the inverse the printed expression is `(β - α)² ψ₂(σ)`, not `ψ₂(σ)`;
with `β = 3`, `α = 1`, `ψ₁(σ) = 5`, `ψ₂(σ) = 1` it gives `4`. -/
example : ((3 : ℚ) - 1) * (3 * (5 + 1) - (3 * 5 + 1 * 1)) = 4 := by norm_num

/-- `R21.4/pro-modularity-key-proposition`: under (G), `d_i > 2 + 2t + 7s` with `s = #Σ + dim H`, the
dimension bound `d − 2t − 3m − 1 ≤ d − d_i` (with `m = #ℳ_c ≤ s`) is impossible. -/
example (d di t m s : ℕ) (hm : m ≤ s) (hG : 2 + 2 * t + 7 * s < di) (hdi : di ≤ d) :
    ¬ (d - 2 * t - 3 * m - 1 ≤ d - di ∧ 2 * t + 3 * m + 1 ≤ d) := by
  omega

/-- `R21.5/theorem-b`, (4.23) ⇒ (4.24) in outline: with `D = deg(E/ℚ) ≥ 1`, `2^{n₀−1} > 2 + 17s + 8h`
gives `2^{n₀−1}·D > 2 + 9s + 8h` (`s = #Σ_L`, `h = dim H_{Σ_L}`). -/
example (N D s h : ℕ) (hD : 1 ≤ D) (hN : 2 + 17 * s + 8 * h < N) : 2 + 9 * s + 8 * h < N * D := by
  nlinarith

/-- `R21.4/formal-patching-datum`: `B_N → A_N`, `t ↦ (1 + s) + (1 + s)⁻¹ − 2 = s² / (1 + s)`. -/
example {K : Type*} [Field K] (s : K) (h : 1 + s ≠ 0) : (1 + s) + (1 + s)⁻¹ - 2 = s ^ 2 / (1 + s) := by
  rw [eq_div_iff h, sub_mul, add_mul, inv_mul_cancel₀ h]
  ring

/-- `R21.5/crystalline-family-v-k-ap`: the matrix of `φ` on `D_{k,a_p}` in the basis `(e₁, e₂)` is
`(0 −1; p^{k−1} a_p)`, with trace `a_p` and determinant `p^{k−1}` (here `p = 3`, `k = 4`). -/
example (a : ℤ) : Matrix.trace !![(0 : ℤ), -1; 3 ^ 3, a] = a ∧ Matrix.det !![(0 : ℤ), -1; 3 ^ 3, a] = 3 ^ 3 := by
  simp [Matrix.trace_fin_two, Matrix.det_fin_two]

/-- `R21.5/reduction-of-v-k-zero`: for `2 ≤ k ≤ p + 1`, `(p + 1) ∤ (k − 1)`, so `ind(ω₂^{k−1})` is
irreducible; at `k = p + 2` divisibility holds and `V̄_{k,0}` is reducible. -/
example (p k : ℕ) (hk : 2 ≤ k) (hkp : k ≤ p + 1) : ¬ (p + 1) ∣ (k - 1) := by
  intro h
  have := Nat.le_of_dvd (by omega) h
  omega

example (p : ℕ) : (p + 1) ∣ (p + 2 - 1) := by
  rw [show p + 2 - 1 = p + 1 by omega]

/-- At `p = 3, k = 4`: `ω₂` has order `8`, `ω₂³` still has order `8` (`gcd(8, 3) = 1`) and its
Frobenius conjugate is `ω₂⁹ = ω₂ ≠ ω₂³`. -/
example : 3 ^ 2 - 1 = 8 ∧ Nat.gcd 8 3 = 1 ∧ 3 * 3 % 8 = 1 ∧ 3 % 8 ≠ 1 := by decide

/-- `R21.5/crystalline-reducible-reduction-is-ordinary`, p-distinguishedness: `(p − 1) ∤ (k − 1)`
for `k = 2` and for `k = p + 1` when `p ≥ 3`. -/
example (p : ℕ) (hp : 3 ≤ p) : ¬ (p - 1) ∣ (2 - 1) := by
  intro h
  have := Nat.le_of_dvd (by omega) h
  omega

example (p : ℕ) (hp : 3 ≤ p) : ¬ (p - 1) ∣ (p + 1 - 1) := by
  intro h
  have h2 : (p - 1) ∣ (p + 1 - 1) - (p - 1) := Nat.dvd_sub h dvd_rfl
  rw [show p + 1 - 1 - (p - 1) = 1 by omega] at h2
  have := Nat.le_of_dvd one_pos h2
  omega

/-- The terminal cases of SmallRamificationAndAbelianVarietyBaseCases R25.5 all lie in the range
`2 ≤ k ≤ p + 1` of the criterion. -/
example : ∀ pk ∈ [(3, 2), (3, 4), (5, 6), (7, 8), (13, 14)], 2 ≤ pk.2 ∧ pk.2 ≤ pk.1 + 1 := by decide

/-! ### Checkpoint 7: Skinner–Wiles 2001 (irreducible residual representations) -/

/-- `R21.5/nearly-ordinary-irreducible-lifting`: the choice of `L` in the proof of Theorem 5.1
(`d_L/2 > 2 + 7·#Σ_L` and `d_v > 2 + 7·#Σ_L`) makes `(L, ρ₀)` a good pair, since `t + #ℳ₀ ≤ #Σ_L`. -/
example (dL dv t m s : ℕ) (hs : t + m ≤ s) (h1 : 2 + 7 * s < dL / 2) (h2 : 2 + 7 * s < dv) :
    2 + 2 * t + 7 * m < dL / 2 ∧ 2 + 2 * t + 7 * m < dv := by
  omega

/-- `R21.4/irreducible-pro-modularity`, step three: `(4.1)(i)` gives
`dim Q₁ ≥ d − 2t − 3·#ℳ₀ − 1 > 1 + d/2`. -/
example (d t m : ℕ) (h : 2 + 2 * t + 7 * m < d / 2) : 1 + d / 2 < d - 2 * t - 3 * m - 1 := by
  omega

/-- Step three: if `Q₁^mod` contained every `Y^{(i)}_j`, then `d_i ≤ 2t + 3·#ℳ₀ + 1`, contradicting
`(4.1)(ii)`. -/
example (di t m : ℕ) (h : 2 + 2 * t + 7 * m < di) : ¬ di ≤ 2 * t + 3 * m + 1 := by
  omega

/-- Source issue E14: `(4.1)(i)` does not give the bound of the general step. With `d = 40`, `t = 1`,
`#ℳ₀ = 0` and `#Σ = 4`, `(4.1)(i)` holds but `d − 7·#Σ − 1 < d/2 + 1`. -/
example : 2 + 2 * 1 + 7 * 0 < 40 / 2 ∧ 40 - 7 * 4 - 1 < 40 / 2 + 1 := by
  decide

/-- E14 repaired: with `u = #(Σ ∖ 𝒫)` and `#ℳ ≤ u`, the hypothesis `d/2 > 2 + 2t + 7u` gives
`d − 2t − 3·#ℳ − 4u ≥ d/2 + 1`, the bound the general step needs. -/
example (d t m u : ℕ) (hmu : m ≤ u) (h : 2 + 2 * t + 7 * u < d / 2) :
    d / 2 + 1 ≤ d - 2 * t - 3 * m - 4 * u := by
  omega

/-- Source issue E11: the unit ranks behind `δ⁻_{F′}` for `[F : ℚ] = d`. `F` (`r₁ = d`) and a CM
quadratic `F′` (`r₂ = d`) both have unit rank `d − 1`, so the minus units of a CM `F′` have rank `0`
and `δ⁻_{F′} = d > d/2`; a totally real `F′` (`r₁ = 2d`) has minus units of rank `d`. -/
example (d : ℕ) (hd : 1 ≤ d) :
    (0 + d - 1) - (d + 0 - 1) = 0 ∧ (2 * d + 0 - 1) - (d + 0 - 1) = d ∧ d / 2 < d := by
  omega

/-- E11, totally real `F′`: if the minus units (rank `d`) have `p`-adic rank `r` with `2r ≥ d`
(Waldschmidt), then `δ⁻_{F′} = d − r ≤ d/2`. -/
example (d r : ℕ) (hr : d ≤ 2 * r) : d - r ≤ d / 2 := by
  omega

/-- `R21.3/irreducible-minimal-hecke-quotient` (Lemma 3.5(iii)): `diag(δ, δ⁻¹)` has trace `δ + δ⁻¹`. -/
example {K : Type*} [Field K] (δ : K) : Matrix.trace !![δ, 0; 0, δ⁻¹] = δ + δ⁻¹ := by
  simp [Matrix.trace_fin_two]

end TauCeti.OrdinaryModularity.SuggestedTest
