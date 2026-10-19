/-
Copyright (c) 2026 The Tau Ceti Atlas contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.Order.Module.Defs
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Order.CompleteLattice.Basic
import Mathlib.Basic.ENNReal.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-!
# Suggested Lean statements for "Arakelov geometry and heights of abelian varieties, Part II"

This file is **not** the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArakelovGeometryAndAbelianHeightsPartII.md` and its packet are
definitive. The statements below suggest Lean forms for the few pieces of the roadmap that can be
stated with what the pinned Mathlib already provides, so that contributors and reviewers converge
on names and signatures.

The carriers of almost every target are not at the pins: there are no quasi-projective schemes,
Berkovich analytifications, arithmetic intersection numbers, Deligne pairings, metric graphs or
moduli of curves in Mathlib at `082e2d3`. Those objects — adelic divisors and line bundles,
volumes, heights, Zhang's admissible metrics, `ω_{X/S,a}`, `Θ̄`, the divisors `E_S`, `Φ_S`,
`Ξ_S`, and the bigness and comparison theorems — are README targets.

What is here:

* the boundary norm `‖D‖_E = inf {q ∈ ℚ_{>0} : -qE ≤ D ≤ qE}` on an ordered `ℚ`-vector space
  (layer AH.1, `boundaryNorm`), with its API and tests;
* the coefficient identities behind Yuan's theta formulas, the nefness of `ω_a`, the triple
  pairing and Theorem 3.8 (layers AH.9–AH.10), stated in a `ℚ`-module or over `ℚ`;
* the graph-invariant numerics: Cinkir's `t(g)`, the coefficient `A(g)` and the one-loop graph
  (layers AH.10 and AH.13);
* the normalization constants of Bost's bound and of Theorem 4.14 (layer AH.13), including the
  corrected Faltings-normalized form of Bost's bound (source issue
  `ArakelovGeometryAndAbelianHeightsPartII/E1`).
-/

namespace ArakelovPartII

open scoped NNReal ENNReal

/-! ## AH.1: the boundary norm -/

section BoundaryNorm

variable {G : Type*} [AddCommGroup G] [PartialOrder G] [IsOrderedAddMonoid G] [Module ℚ G]

/-- The boundary norm `‖D‖_E = inf {q > 0 : -q•E ≤ D ≤ q•E}`, valued in `[0, ∞]`
(Yuan–Zhang §2.4.2). It is `∞` when no such `q` exists. -/
noncomputable def boundaryNorm (E D : G) : ℝ≥0∞ :=
  ⨅ (q : ℚ≥0) (_ : 0 < q) (_ : -((q : ℚ) • E) ≤ D ∧ D ≤ (q : ℚ) • E), ((q : ℝ≥0) : ℝ≥0∞)

/-- The norm of `0` is `0` when the boundary is effective. -/
theorem boundaryNorm_zero {E : G} (hE : 0 ≤ E) : boundaryNorm E 0 = 0 := by
  sorry

/-- Triangle inequality (Yuan–Zhang Lemma 2.4.1(2)). -/
theorem boundaryNorm_add_le (E D₁ D₂ : G) :
    boundaryNorm E (D₁ + D₂) ≤ boundaryNorm E D₁ + boundaryNorm E D₂ := by
  sorry

/-- Definiteness (Yuan–Zhang Lemma 2.4.1(1)), under the archimedean hypothesis that the models
supply (Yuan–Zhang Lemma 2.3.6). -/
theorem boundaryNorm_eq_zero_iff {E D : G}
    (hArch : ∀ D' : G, (∀ ε : ℚ, 0 < ε → -(ε • E) ≤ D' ∧ D' ≤ ε • E) → D' = 0) :
    boundaryNorm E D = 0 ↔ D = 0 := by
  sorry

/-- Comparable boundaries give equivalent norms (Yuan–Zhang Lemma 2.4.1, last part). -/
theorem boundaryNorm_equiv [PosSMulMono ℚ G] {E E' : G} {r : ℚ≥0} (hr : 1 ≤ r)
    (h₁ : E ≤ (r : ℚ) • E') (h₂ : E' ≤ (r : ℚ) • E) (D : G) :
    boundaryNorm E' D ≤ ((r : ℝ≥0) : ℝ≥0∞) * boundaryNorm E D := by
  sorry

/-- Test `boundaryNorm_self`: a strictly positive boundary has norm one. -/
theorem boundaryNorm_self [PosSMulStrictMono ℚ G] {E : G} (hE : 0 < E) :
    boundaryNorm E E = 1 := by
  sorry

/-- Test `boundaryNorm_projective`: with no boundary (`E = 0`, a projective model), every
nonzero divisor has infinite norm. -/
theorem boundaryNorm_projective {D : G} (hD : D ≠ 0) : boundaryNorm (0 : G) D = ⊤ := by
  sorry

end BoundaryNorm

/-- Test `boundaryNorm` on `ℚ`: `‖1/2‖_1 = 1/2`. -/
example : boundaryNorm (1 : ℚ) (1 / 2) = ((1 / 2 : ℝ≥0) : ℝ≥0∞) := by
  sorry

/-! ## AH.9: coefficient identities of the theta formulas -/

section Theta

/-- Theorem 2.10(1) from Theorem 2.9(1): with `d = 2g - 2`, `d² + 2d = 4g(g - 1)`. -/
theorem theta_canonical_coeff (g : ℚ) : (2 * g - 2) ^ 2 + 2 * (2 * g - 2) = 4 * g * (g - 1) := by
  ring

/-- Theorem 2.10(1): `d²(d² + 4d - 4g + 4) = 16 g (g - 1)³` for `d = 2g - 2`. -/
theorem theta_canonical_pairing_coeff (g : ℚ) :
    (2 * g - 2) ^ 2 * ((2 * g - 2) ^ 2 + 4 * (2 * g - 2) - 4 * g + 4) = 16 * g * (g - 1) ^ 3 := by
  ring

/-- Theorem 2.9(2): the two expansions of `⟨i_α^*Θ̄, i_α^*Θ̄⟩` agree once
`ι_α^*Θ̄ = -⟨M̄, M̄⟩` for `M̄ = (2g - 2)ᾱ - d w`. Here `W = ⟨w, w⟩`, `B = ⟨w, ᾱ⟩`, `A = ⟨ᾱ, ᾱ⟩`. -/
theorem theta_pullback_consistency (g d W B A : ℚ) :
    g * d ^ 4 * W + d ^ 2 * (-((2 * g - 2) ^ 2 * A - 2 * (2 * g - 2) * d * B + d ^ 2 * W)) =
      (g - 1) * (d ^ 4 * W + 4 * d ^ 3 * B - (4 * g - 4) * d ^ 2 * A) := by
  ring

/-- Theorem 2.10(3): the universal shift pairing, from Theorem 2.9(2) with `d = 2g - 2` and
`ι_α^*Θ̄ = (2g - 2)² Θ̄`. -/
theorem theta_universal_shift_coeff (g W T : ℚ) (hg : g ≠ 1) :
    (g * (2 * g - 2) ^ 4 * W + (2 * g - 2) ^ 2 * ((2 * g - 2) ^ 2 * T)) / (g - 1) =
      16 * (g - 1) ^ 3 * T + 16 * g * (g - 1) ^ 3 * W := by
  have : g - 1 ≠ 0 := sub_ne_zero.mpr hg
  field_simp
  ring

/-- Theorem 2.10(1) ⇒ nefness of `ω_a` (AH.9/nefness-omega-a): in any `ℚ`-module, with
`p = π^*⟨w, w⟩`, `i_ω^*Θ̄ = 4g(g-1)w - p` and `π^*⟨i_ω^*Θ̄, i_ω^*Θ̄⟩ = 16g(g-1)³p`, the positive
combination `i_ω^*Θ̄/(4g(g-1)) + π^*⟨i_ω^*Θ̄, i_ω^*Θ̄⟩/(64g²(g-1)⁴)` is `w`. -/
theorem omega_a_theta_decomposition {M : Type*} [AddCommGroup M] [Module ℚ M]
    (g : ℚ) (hg : 1 < g) (w p : M) :
    (1 / (4 * g * (g - 1))) • ((4 * g * (g - 1)) • w - p) +
        (1 / (64 * g ^ 2 * (g - 1) ^ 4)) • ((16 * g * (g - 1) ^ 3) • p) = w := by
  sorry

end Theta

/-! ## AH.10: the triple pairing and the Hodge lower bound -/

/-- Theorem 3.6: `8 - 24 + 24 + 12(g - 1) = 12g - 4`. -/
theorem triple_pairing_coeff (g : ℚ) : 8 - 24 + 24 + 12 * (g - 1) = 12 * g - 4 := by
  ring

/-- Theorem 3.8: the cancelling combination has coefficient at most `20(3g - 1)(2g - 1)`. -/
theorem hodge_lower_coeff_le (g : ℚ) (hg : 2 ≤ g) :
    1 + 39 * (3 * g - 1) * (2 * g - 1) / 2 ≤ 20 * (3 * g - 1) * (2 * g - 1) := by
  nlinarith

/-- Theorem 3.8: `12 / (20 x) = 3 / (5 x)`. -/
theorem hodge_lower_coeff (x : ℚ) (hx : x ≠ 0) : 12 / (20 * x) = 3 / (5 * x) := by
  field_simp
  ring

/-! ## AH.10 and AH.13: graph numerics -/

section Graph

/-- Cinkir's constant `t(g) = (g - 1)² / (2g(7g + 5))`, valid for `g ≥ 4` (Cinkir arXiv v2,
Theorem 2.9). -/
noncomputable def cinkirT (g : ℕ) : ℚ := ((g : ℚ) - 1) ^ 2 / (2 * g * (7 * g + 5))

/-- Test: `t(4) = 3/88`. -/
example : cinkirT 4 = 3 / 88 := by
  norm_num [cinkirT]

/-- Test: `t(5) = 1/25`. -/
example : cinkirT 5 = 1 / 25 := by
  norm_num [cinkirT]

/-- `1/39 < 3/88 = min t(g)`, so `φ(Γ) ≥ ℓ(Γ)/39`. -/
example : (1 : ℚ) / 39 < 3 / 88 := by
  norm_num

/-- `t(g) ≥ 3/88` for `g ≥ 4`. -/
theorem cinkirT_ge (g : ℕ) (hg : 4 ≤ g) : 3 / 88 ≤ cinkirT g := by
  sorry

/-- The coefficient `A(g) = 1 + (3/(2c) + 2)(2g + 1)/(g - 1)` of Yuan §4.5.1. -/
noncomputable def noetherCoefficientA (c g : ℚ) : ℚ := 1 + (3 / (2 * c) + 2) * (2 * g + 1) / (g - 1)

/-- Test: `A(4) = 139` with `c(4) = 3/88`. -/
example : noetherCoefficientA (3 / 88) 4 = 139 := by
  norm_num [noetherCoefficientA]

/-- Test: `A(3) < 139` with Cinkir's genus-three constant `17/288`. -/
example : noetherCoefficientA (17 / 288) 3 < 139 := by
  norm_num [noetherCoefficientA]

/-- Test: `A(5) < 139` with `c(5) = 1/25`. -/
example : noetherCoefficientA (1 / 25) 5 < 139 := by
  norm_num [noetherCoefficientA]

/-- Genus two, hyperelliptic: `1 + (3/(2·(1/27)) + 2)·(5/2) = 107.25`. -/
example : 1 + (3 / (2 * (1 / 27 : ℚ)) + 2) * (5 / 2) = 429 / 4 := by
  norm_num

/-- Zhang's invariants of the one-loop pm-graph of genus `g` and loop length `ℓ`. -/
noncomputable def oneLoopEpsilon (g ℓ : ℝ) : ℝ := (g - 1) * ℓ / (3 * g)
/-- `φ` of the one-loop graph. -/
noncomputable def oneLoopPhi (g ℓ : ℝ) : ℝ := (g - 1) * ℓ / (6 * g)
/-- `τ` of a circle of length `ℓ`. -/
noncomputable def oneLoopTau (ℓ : ℝ) : ℝ := ℓ / 12

/-- Test `PMGraph.oneLoop_values` (de Jong's identity): `δ + ε - 2φ = (3/2)δ - 6τ` with `δ = ℓ`. -/
example (g ℓ : ℝ) (hg : g ≠ 0) :
    ℓ + oneLoopEpsilon g ℓ - 2 * oneLoopPhi g ℓ = 3 / 2 * ℓ - 6 * oneLoopTau ℓ := by
  unfold oneLoopEpsilon oneLoopPhi oneLoopTau
  field_simp
  ring

/-- Test (AH.10/graph-invariant-inequalities (2)): `ε ≤ (2g - 2)ℓ` on the one-loop graph. -/
example (g ℓ : ℝ) (hg : 1 ≤ g) (hℓ : 0 ≤ ℓ) : oneLoopEpsilon g ℓ ≤ (2 * g - 2) * ℓ := by
  unfold oneLoopEpsilon
  rw [div_le_iff₀ (by linarith)]
  nlinarith [mul_nonneg (sub_nonneg.mpr hg) hℓ, mul_nonneg (mul_nonneg (sub_nonneg.mpr hg) hℓ) (by linarith : (0:ℝ) ≤ 6 * g - 1)]

/-- Test (AH.10/graph-invariant-inequalities (3)): `φ ≥ ℓ/39` on the one-loop graph, `g ≥ 2`. -/
example (g ℓ : ℝ) (hg : 2 ≤ g) (hℓ : 0 ≤ ℓ) : ℓ / 39 ≤ oneLoopPhi g ℓ := by
  unfold oneLoopPhi
  rw [div_le_div_iff₀ (by norm_num) (by linarith)]
  nlinarith [mul_nonneg (by linarith : (0:ℝ) ≤ 33 * g - 39) hℓ]

/-- Test (AH.10/graph-invariant-inequalities (1)): on a circle of length `ℓ` the resistance
`t(ℓ - t)/ℓ` is at most the path length `t`. -/
example (ℓ t : ℝ) (hℓ : 0 < ℓ) (ht : 0 ≤ t) : t * (ℓ - t) / ℓ ≤ t := by
  rw [div_le_iff₀ hℓ]
  nlinarith

end Graph

/-! ## AH.13: normalization constants -/

section Constants

open Real

/-- Bost's lower bound in Deligne's normalization, `-(g/2) log(2π)`. -/
noncomputable def bostDeligne (g : ℝ) : ℝ := -(g / 2) * Real.log (2 * π)

/-- Bost's lower bound in Faltings' normalization, `-(g/2) log(2π²)`. -/
noncomputable def bostFaltings (g : ℝ) : ℝ := -(g / 2) * Real.log (2 * π ^ 2)

/-- `h_Fal = h_Del - (g/2) log π` turns the Deligne bound into the Faltings bound
(source issue `ArakelovGeometryAndAbelianHeightsPartII/E1`). -/
theorem bostFaltings_eq (g : ℝ) : bostDeligne g - g / 2 * Real.log π = bostFaltings g := by
  sorry

/-- Theorem 4.14(c): `2g log(2π⁴) + 4g log(2π) = 6g log(2π²)`. -/
theorem noether_upper_constant (g : ℝ) :
    2 * g * Real.log (2 * π ^ 4) + 4 * g * Real.log (2 * π) = 6 * g * Real.log (2 * π ^ 2) := by
  sorry

/-- The Faltings-normalized bound is weaker than the printed one: `log(2π) < log(2π²)`. -/
example : Real.log (2 * π) < Real.log (2 * π ^ 2) := by
  sorry

/-- AH.4/hilbert-samuel-siu: a nef big `A` minus a small multiple of a nef `B` stays big, at the
level of the Siu lower bound `A^d - d ε A^{d-1}B`. -/
theorem siu_small_epsilon (a b ε : ℝ) (d : ℕ) (hd : 0 < d) (_ha : 0 < a) (hb : 0 < b)
    (_hε : 0 < ε) (hε' : ε < a / (d * b)) : 0 < a - d * ε * b := by
  have hdb : 0 < (d : ℝ) * b := mul_pos (by exact_mod_cast hd) hb
  rw [lt_div_iff₀ hdb] at hε'
  nlinarith

end Constants

end ArakelovPartII
