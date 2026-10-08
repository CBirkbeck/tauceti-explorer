import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.Polynomial.RationalRoot
import Mathlib.Tactic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/EllipticCurveModularityPartII.md is definitive. These
statements suggest Lean forms so that contributors and reviewers converge on
names and signatures. Nothing here implements a target of the roadmap.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

EllipticCurveModularityPartII owns no definition and no theorem. The targets
its layers name are declarations of EllipticModularityEffectiveComparisons
(one input, Chen's isogeny theorem, is recorded there as a gap),
whose suggested forms are in
research/blueprint/suggested/EllipticModularityEffectiveComparisons.lean,
namespace `TauCeti.EffectiveEllipticComparison`. The names this file used to
suggest correspond to the owner's as follows.

* `krausF`, `krausG`, `krausH`: the owner's `krausF`, `krausG`, `krausH`.
* `krausF_eq`, `one_le_krausF`, `krausG_eq`, `one_le_krausG`,
  `krausF_le_krausH`, `krausG_le_krausH`, `krausH_lt_iff`: the same names.
* `krausF_eq_one_of_dim_zero`: `krausF_of_dimension_zero`.
* `krausG_eq_of_lcm_eq`: a consequence of `krausG_eq`.
* `martin_bound`: `martin_bound`, proved there from `dimension_comparison`
  and the estimates `prime_case` to `bounded_family`.
* `norm_bound`: `prime_divides_integral_norm` and `trace_norm`.
* `integral_isogeny_j_values`: the owner's node
  EC.5/integral-parameter-divisibility, on `lemosNumerator`.

The other former signatures (the removed-prime bound, Kraus's two theorems,
the isogeny and irreducibility statements, Lemos's theorem) are statements of
the owner's packet nodes named in the roadmap document.

What follows is not part of any roadmap's plan. It is the arithmetic behind the
acceptance tests of the roadmap document and behind its three remarks on the
owner's statements, stated on Mathlib objects only, and proved.
-/

open Polynomial

namespace EllipticCurveModularityPartIIAcceptance

/-! ### The thresholds at level 11 in the two notations

The owner writes `krausF 11 = 3 + 2 * √2` and `krausG 11 = 13 + 4 * √3`; the
sources write `(√(μ/6) + 1) ^ 2` with `μ(11)/6 = 2` and `μ(44)/6 = 12`. -/

theorem sqrt_two_add_one_sq : (Real.sqrt 2 + 1) ^ 2 = 3 + 2 * Real.sqrt 2 := by
  have h : Real.sqrt 2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  nlinarith [h]

theorem sqrt_twelve : Real.sqrt 12 = 2 * Real.sqrt 3 := by
  rw [show (12 : ℝ) = (2 * Real.sqrt 3) ^ 2 by
    have : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
    nlinarith [this]]
  exact Real.sqrt_sq (by positivity)

theorem sqrt_twelve_add_one_sq : (Real.sqrt 12 + 1) ^ 2 = 13 + 4 * Real.sqrt 3 := by
  rw [sqrt_twelve]
  have : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
  nlinarith [this]

/-- At level 11 the threshold `F` is smaller than `G`: the maximum `H` is not `F`. -/
theorem krausF_eleven_lt_krausG_eleven :
    (Real.sqrt 2 + 1) ^ 2 < (Real.sqrt 12 + 1) ^ 2 := by
  have h : Real.sqrt 2 < Real.sqrt 12 := Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h0 : (0 : ℝ) ≤ Real.sqrt 2 := Real.sqrt_nonneg 2
  nlinarith [h, h0]

/-! ### Residue characteristics in the formal immersion

A prime `q ≡ ±1 mod p`, for a prime `p ≥ 11`, is at least `2p - 1 ≥ 21`. So the
conditions `q > 13 ≥ r` and `q > 3` of the owner's nodes
EC.5/cartan-cusp-formal-immersion and EC.5/cartan-denominator-exclusion hold
for every prime `p` outside `{2, 3, 5, 7, 13}`. -/

theorem two_mul_sub_one_le_of_mod_eq (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (h11 : 11 ≤ p)
    (h : q % p = 1 ∨ q % p = p - 1) : 2 * p - 1 ≤ q := by
  by_contra hlt
  have hodd : p % 2 = 1 := by
    rcases hp.eq_two_or_odd with h2 | h2 <;> omega
  have hk : q / p ≤ 1 := by
    by_contra hk
    have h2 : p * 2 ≤ p * (q / p) := Nat.mul_le_mul_left p (by omega)
    have := Nat.div_add_mod q p
    omega
  have hdm := Nat.div_add_mod q p
  have h2 : 2 ∣ q ∨ q = 1 := by
    rcases h with h | h
    · interval_cases hqp : q / p
      · right; omega
      · left; omega
    · interval_cases hqp : q / p
      · left; omega
      · omega
  rcases h2 with h2 | h2
  · have hq2 : 2 = q := (Nat.prime_dvd_prime_iff_eq Nat.prime_two hq).mp h2
    have hmod : 2 % p = 2 := Nat.mod_eq_of_lt (by omega)
    rw [← hq2, hmod] at h
    omega
  · exact hq.one_lt.ne' h2

/-! ### Integral values of `f(t)/t`

The divisibility step of the owner's node EC.5/integral-parameter-divisibility,
for any monic integer polynomial of degree at least 2: a nonzero rational `t`
with `f(t)/t` an integer is an integer dividing `f(0)`. Degree 1 is excluded:
`f = X + 1`, `t = 1/2` gives `f(t)/t = 3`. -/

theorem int_of_eval_div_self_int (f : Polynomial ℤ) (hf : f.Monic) (hdeg : 2 ≤ f.natDegree)
    (t : ℚ) (ht : t ≠ 0) (m : ℤ) (hm : eval t (f.map (Int.castRingHom ℚ)) / t = m) :
    ∃ a : ℤ, t = a ∧ a ≠ 0 ∧ a ∣ f.coeff 0 := by
  have hdegf : (1 : WithBot ℕ) < f.degree := by
    rw [Polynomial.degree_eq_natDegree hf.ne_zero]
    exact_mod_cast hdeg
  have hlt : (C m * X : Polynomial ℤ).degree < f.degree :=
    lt_of_le_of_lt (Polynomial.degree_C_mul_X_le m) hdegf
  have hgm : (f - C m * X).Monic := hf.sub_of_left hlt
  have hft : eval t (f.map (Int.castRingHom ℚ)) = m * t := by
    field_simp at hm
    linarith
  have hroot : aeval t (f - C m * X) = 0 := by
    simp only [map_sub, map_mul, aeval_C, aeval_X]
    rw [aeval_def, eval₂_eq_eval_map]
    simp only [eq_intCast, algebraMap_int_eq] at *
    linarith
  obtain ⟨a, ha⟩ := isInteger_of_is_root_of_monic hgm hroot
  have hat : t = (a : ℚ) := by simpa using ha.symm
  refine ⟨a, hat, ?_, ?_⟩
  · rintro rfl
    exact ht (by simpa using hat)
  · have hfa : ((f.eval a : ℤ) : ℚ) = (m : ℚ) * (a : ℚ) := by
      have : eval (a : ℚ) (f.map (Int.castRingHom ℚ)) = ((f.eval a : ℤ) : ℚ) := by
        simp [eval_map, eval₂_at_intCast]
      rw [← this, ← hat, hft]
    have hfa' : f.eval a = m * a := by exact_mod_cast hfa
    have h1 : a - 0 ∣ f.eval a - f.eval 0 := Polynomial.sub_dvd_eval_sub a 0 f
    rw [sub_zero, hfa', ← Polynomial.coeff_zero_eq_eval_zero] at h1
    have h2 : a ∣ m * a := Dvd.intro_left m rfl
    simpa using dvd_sub h2 h1

example : eval (1 / 2 : ℚ) ((X + 1 : Polynomial ℤ).map (Int.castRingHom ℚ)) / (1 / 2) = (3 : ℤ) := by
  norm_num

/-! ### The two-isogeny selection on `E[4]`

An argument for the owner's node EC.3/four-count-full-two-selection that uses
only the image `G` of Galois in `GL₂(ℤ/4)`, in a basis `e₁, e₂` of `E[4]` with
`P = 2 • e₁` the rational point of order two. The hypotheses are: every element
has `det (1 - g) = 0` (point counts divisible by 4, by Chebotarev's theorem);
every element fixes `P`; and some element is nontrivial modulo 2. The
conclusion is that every element maps `e₁` into `⟨e₁⟩`, so that Galois acts
trivially on the two-torsion `{Q : 2 • Q ∈ ⟨P⟩} / ⟨P⟩` of `E / ⟨P⟩`. -/

section GLTwoModFour

private theorem eq_two_of_two_mul_eq_zero (c : ZMod 4) (h : 2 * c = 0) (hc : c ≠ 0) : c = 2 := by
  revert c; decide

private theorem det_one_sub_ne_zero (a b c d : ZMod 4) (ha : 2 * a = 2) (hc : c = 2)
    (hb : 2 * b ≠ 0) (hdet : 2 * (a * d - b * c) ≠ 0) : (1 - a) * (1 - d) - b * c ≠ 0 := by
  revert a b c d; decide

private theorem two_mul_unit_ne_zero (u : (ZMod 4)ˣ) : 2 * (u : ZMod 4) ≠ 0 := by
  revert u; decide

private theorem two_mul_ne_zero_of_det (a b d c : ZMod 4) (hc : 2 * c = 0)
    (h : 2 * (a * d - b * c) ≠ 0) : 2 * d ≠ 0 := by
  revert a b c d; decide

private theorem mul_two_eq_two (d : ZMod 4) (h : 2 * d ≠ 0) : d * 2 = 2 := by
  revert d; decide

private theorem two_mul_add_ne_zero (a b b' d : ZMod 4) (hb : 2 * b = 0) (hb' : 2 * b' ≠ 0)
    (hd : 2 * d ≠ 0) : 2 * (a * b + b' * d) ≠ 0 := by
  revert a b b' d; decide

/-- The matrix of an element of `GL₂(ℤ/4)`. -/
abbrev mat (g : GL (Fin 2) (ZMod 4)) : Matrix (Fin 2) (Fin 2) (ZMod 4) := g

private theorem two_mul_det_ne_zero (g : GL (Fin 2) (ZMod 4)) :
    2 * (mat g 0 0 * mat g 1 1 - mat g 0 1 * mat g 1 0) ≠ 0 := by
  have h := two_mul_unit_ne_zero (Matrix.GeneralLinearGroup.det g)
  rwa [Matrix.GeneralLinearGroup.val_det_apply, Matrix.det_fin_two] at h

private theorem det_one_sub (g : GL (Fin 2) (ZMod 4)) :
    (1 - mat g).det = (1 - mat g 0 0) * (1 - mat g 1 1) - mat g 0 1 * mat g 1 0 := by
  rw [Matrix.det_fin_two]
  simp [Matrix.sub_apply]

theorem lower_left_eq_zero_of_det_one_sub_eq_zero (G : Subgroup (GL (Fin 2) (ZMod 4)))
    (hdet : ∀ g ∈ G, (1 - mat g).det = 0)
    (hfix : ∀ g ∈ G, 2 * mat g 0 0 = 2 ∧ 2 * mat g 1 0 = 0)
    (t : GL (Fin 2) (ZMod 4)) (ht : t ∈ G) (htb : 2 * mat t 0 1 ≠ 0) :
    ∀ g ∈ G, mat g 1 0 = 0 := by
  -- An element with lower-left entry 2 and odd upper-right entry has `det (1 - x) = 2`.
  have key : ∀ x ∈ G, mat x 1 0 = 2 → 2 * mat x 0 1 ≠ 0 → False := by
    intro x hx hc hb
    have h1 := hdet x hx
    rw [det_one_sub] at h1
    exact det_one_sub_ne_zero _ _ _ _ (hfix x hx).1 hc hb (two_mul_det_ne_zero x) h1
  have hct : mat t 1 0 = 0 := by
    by_contra h
    exact key t ht (eq_two_of_two_mul_eq_zero _ (hfix t ht).2 h) htb
  intro g hg
  by_contra h
  have hcg : mat g 1 0 = 2 := eq_two_of_two_mul_eq_zero _ (hfix g hg).2 h
  by_cases hb : 2 * mat g 0 1 = 0
  · -- `g` is trivial modulo 2; then `t * g` is of the excluded kind.
    have hdt : 2 * mat t 1 1 ≠ 0 := two_mul_ne_zero_of_det _ _ _ _ (hfix t ht).2 (two_mul_det_ne_zero t)
    have hdg : 2 * mat g 1 1 ≠ 0 := two_mul_ne_zero_of_det _ _ _ _ (hfix g hg).2 (two_mul_det_ne_zero g)
    have hmul : mat (t * g) = mat t * mat g := rfl
    refine key (t * g) (G.mul_mem ht hg) ?_ ?_
    · rw [hmul, Matrix.mul_apply, Fin.sum_univ_two, hct, hcg, zero_mul, zero_add]
      exact mul_two_eq_two _ hdt
    · rw [hmul, Matrix.mul_apply, Fin.sum_univ_two]
      exact two_mul_add_ne_zero _ _ _ _ hb htb hdg
  · exact key g hg hcg hb

end GLTwoModFour

end EllipticCurveModularityPartIIAcceptance
