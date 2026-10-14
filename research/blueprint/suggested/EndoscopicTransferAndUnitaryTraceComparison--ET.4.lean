import Mathlib.Algebra.Order.Field.Rat
import Mathlib.Algebra.Group.Even
import Mathlib.Data.List.Basic
import Mathlib.Tactic.NormNum

/-!
# Endoscopic transfer and unitary trace comparison, layer ET.4: suggested forms

This file is not the roadmap and it is not exhaustive. The roadmap document is definitive; the
statements here suggest Lean forms so that contributors and reviewers converge on names and
signatures.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Reductive groups over p-adic and number fields, their smooth and automorphic representations,
characters, Tamagawa measures, L-groups and L-morphisms, the twisted trace formula and the
unitary packets have no carriers at the pins. They are targets of the roadmap document, not
declarations here, and the API items and unit tests of those targets are stated there. Only the
numerical normalizations that the layer pins down are given below, as light definitions with
real bodies:

* the component count of `Z(Ĝ_n⃗)^Γ` for the unitary similitude groups and the order of the group
  into which `ker¹(ℚ, Z(Ĝ_n⃗))` embeds (Shin 2011 Lemma 3.1), which bound `τ(G_n⃗)`;
* the endoscopic coefficient `ι(G,H) = τ(G) τ(H)⁻¹ |Out(H,s,η)|⁻¹`;
* the parity exponents of the L-morphisms `η̃_{n₁,n₂}` and `ζ̃_{n₁,n₂}` (Shin 2011 §3.2), which
  are `ε(N − nᵢ)` in every rank and reduce to `ε(nᵢ)` only for even `N`;
* the coefficient `2^(-r)` of a full Levi term on the twisted spectral side (Shin 2011
  Proposition 4.8 and Remark 4.10).
-/

namespace TauCetiRoadmap.EndoscopicTransfer

/-! ## Tamagawa numbers of the unitary similitude groups -/

/-- The order of `π₀(Z(Ĝ_n⃗)^Γ)` for the unitary similitude group `G_n⃗` with blocks `n` over a
CM field with `[F⁺ : ℚ] = d`: `2^r` if `d` is even or every block is even, `2^(r-1)` otherwise
(Shin 2011 Lemma 3.1). The group interpretation needs a nonempty list of positive blocks. -/
def unitaryComponentCount (d : ℕ) (n : List ℕ) : ℕ :=
  if Even d ∨ ∀ i ∈ n, Even i then 2 ^ n.length else 2 ^ (n.length - 1)

/-- The order of the group `H¹(F₀/ℚ, Z(Ĝ_n⃗)^{Gal(ℚ̄/F₀)})` into which Shin 2011 Lemma 3.1 embeds
`ker¹(ℚ, Z(Ĝ_n⃗))`: `2` if `d` is even or every block is even, `1` otherwise. So
`τ(G_n⃗) = unitaryComponentCount d n / |ker¹|` with `|ker¹|` dividing this number; it is `1` when
every block is even (Shin 2011 Remark 3.2) and is not determined by the sources when `d` is even
and some block is odd. -/
def unitaryKerOneBound (d : ℕ) (n : List ℕ) : ℕ :=
  if Even d ∨ ∀ i ∈ n, Even i then 2 else 1

/-- When the bound is `1`, `τ(G_n⃗)` is the component count `2^(r-1)`. -/
theorem unitaryKerOneBound_eq_one_iff (d : ℕ) (n : List ℕ) :
    unitaryKerOneBound d n = 1 ↔ ¬ Even d ∧ ∃ i ∈ n, ¬ Even i := by
  sorry

-- tamagawa, one block, `[F⁺:ℚ] = 2`: two components, and `ker¹` is not forced to vanish.
example : unitaryComponentCount 2 [1] = 2 := by
  sorry

example : unitaryKerOneBound 2 [1] = 2 := by
  sorry

-- tamagawa, `[F⁺:ℚ] = 3` and an odd block: `τ = 2^(r-1)` exactly (Shin 2011 Remark 3.2).
example : unitaryComponentCount 3 [3, 2] = 2 := by
  sorry

example : unitaryKerOneBound 3 [3, 2] = 1 := by
  sorry

-- acceptance check (1): the similitude torus `G_(1)` with `[F⁺:ℚ]` odd has `τ = 1`.
example : unitaryComponentCount 3 [1] = 1 := by
  sorry

/-! ## The endoscopic coefficient -/

/-- The endoscopic coefficient `ι(G,H) = τ(G) τ(H)⁻¹ |Out(H,s,η)|⁻¹` from its three inputs. -/
def endoscopicCoefficient (τG τH : ℚ) (outH : ℕ) : ℚ := τG / τH / outH

-- endoscopicCoefficient_self: the trivial triple has coefficient 1.
example (τ : ℚ) (h : τ ≠ 0) : endoscopicCoefficient τ τ 1 = 1 := by
  sorry

-- endoscopicCoefficient_equal_blocks: `|Out(G_{n,n})| = 2` halves the coefficient.
example : endoscopicCoefficient 2 2 2 = 1 / 2 := by
  sorry

/-! ## Parity of the L-morphisms `η̃_{n₁,n₂}` and `ζ̃_{n₁,n₂}` -/

/-- The exponent `ε(N − nᵢ) ∈ {0, 1}` of `ϖ` twisting the block `GL_{nᵢ}` of `η̃_{n₁,n₂}` and
`ζ̃_{n₁,n₂}` on `W_{F₀}`, for `N = n₁ + n₂` (Shin 2011 §3.2). -/
def blockTwistExponent (N ni : ℕ) : ℕ := (N - ni) % 2

/-- `N(n₁,n₂) = [F⁺:ℚ](n₁ ε(N − n₁) + n₂ ε(N − n₂))/2`, the exponent of `ϖ` on the similitude
factor; the numerator is always even. -/
def lMorphismSimilitudeExponent (d n₁ n₂ : ℕ) : ℕ :=
  d * (n₁ * blockTwistExponent (n₁ + n₂) n₁ + n₂ * blockTwistExponent (n₁ + n₂) n₂) / 2

/-- In even rank the exponent is the parity of the block itself, the form printed for `G_{2n}` in
Caraiani–Scholze's non-compact paper. -/
theorem blockTwistExponent_of_even {N ni : ℕ} (hN : Even N) (h : ni ≤ N) :
    blockTwistExponent N ni = ni % 2 := by
  sorry

-- zetaLMorphism.parity: for `N = 3` and `(n₁,n₂) = (2,1)` the `GL₂`-block is twisted by `ϖ`
-- and the `GL₁`-block is not; the even-rank exponents `ε(nᵢ)` would reverse this.
example : blockTwistExponent 3 2 = 1 ∧ blockTwistExponent 3 1 = 0 := by
  sorry

example : ¬ (blockTwistExponent 3 2 = 2 % 2) := by
  sorry

example (d : ℕ) : lMorphismSimilitudeExponent d 2 1 = d := by
  sorry

/-! ## The twisted spectral side -/

/-- The inverse determinant `|det(Φ⁻¹θ − 1 | 𝔞^{𝒢θ}_M)|⁻¹ = 2^(-r)` when the involution acts by
`−1` on a quotient of dimension `r`. The full Levi can have positive `r`: the quotient is by the
`θ`-fixed full-group split space, not by its entire split space (Shin 2011 Remark 4.10). -/
def twistedDeterminantCoefficient (r : ℕ) : ℚ := (2 ^ r : ℚ)⁻¹

example : twistedDeterminantCoefficient 0 = 1 := by
  norm_num [twistedDeterminantCoefficient]

-- A single full GL block has anti-invariant dimension one, rather than zero.
example : twistedDeterminantCoefficient 1 = 1 / 2 := by
  norm_num [twistedDeterminantCoefficient]

example : twistedDeterminantCoefficient 2 = 1 / 4 := by
  norm_num [twistedDeterminantCoefficient]

end TauCetiRoadmap.EndoscopicTransfer
