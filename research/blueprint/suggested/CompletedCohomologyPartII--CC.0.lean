import Mathlib.RepresentationTheory.Invariants
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic

/-!
# Completed cohomology, homology and arithmetic towers, Part II: layers CC.0–CC.7 (part CC.0)

This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/CompletedCohomologyPartII--CC.0.md is definitive for this part.
These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. Nothing here implements a target of the roadmap.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Layers CC.0–CC.7 are planned in the whole-roadmap packet CompletedCohomologyPartII.json, and its
suggested forms are in research/blueprint/suggested/CompletedCohomologyPartII.lean, namespace
`TauCeti.CompletedCohomology` (`torsionColimit`, `coefficientLimit`, `coefficientLimitAction`,
`continuousDualPrecomp`, `interiorSubmodule` and their milestones). They are not repeated here.

This part adds five README targets, in CC.2, CC.3 and CC.4. Four have carriers that are not at
the pins: the arithmetic tower and its completed modules are the owner's README targets, and
smooth representations over `O`, their averaging projectors and smooth contragredients are planned
by SmoothRepresentationsOfLocalGroups SR.0 (`TauCeti.SmoothRep.averaging`,
`TauCeti.SmoothRep.smoothDual`, `TauCeti.SmoothRep.invariants_smoothDual`). The fifth, the control
lemma of CC.2, is about complexes of complete torsion-free modules; its statement needs the
cohomology of a cochain complex of modules together with the reductions modulo every power of the
uniformizer, which is a development of theory rather than a light statement, so it too stays in
the roadmap document. Their suggested names, in the namespace `TauCeti.CompletedCohomology`:

* `CC.2/complete-torsion-free-complex-control`: `homology_equiv_limit_of_complete_torsionFree`,
  with `homology_divisible_eq_zero` and `bockstein_transition_eq_mul` for its clauses (1) and (2).

* `CC.3/finite-coefficient-model-of-completed-homology`: `completedHomology_equiv_limit_finite`,
  the homeomorphism `H̃_n ≃ lim_s lim_U H_n(Y_U, O/ϖ^s)`, and `rational_completedHomology`, the
  identification of Fu's rational model with `E ⊗_O H̃_n`.
* `CC.3/tame-level-completed-modules`: `TameCompleted` with `TameCompleted.ι`,
  `TameCompleted.smooth`, `TameCompleted.invariants`, `TameCompleted.averaging_comp_ι`,
  `TameCompleted.equivariant` and `TameCompleted.of_empty`.
* `CC.3/tame-level-borel-moore-duality`: `tameBorelMooreDuality`, the isomorphism from the
  tame-level Borel–Moore module onto the smooth contragredient of the tame-level compactly
  supported completed cohomology.
* `CC.4/completed-coefficient-interchange`: `integralCochainModel` with
  `integralCochainModel_cohomology` and `integralCochainModel_reduction`, and
  `completedCohomology_coeff_equiv`, the interchange for complete torsion-free coefficients.

What follows is not part of any roadmap's plan. It is the arithmetic behind the acceptance tests of
the roadmap document, stated on Mathlib objects only, and proved.
-/

namespace CompletedCohomologyPartIICC0Acceptance

/-! ### The circle tower

The tower of connected degree-`p` covers of a circle has `H_1 = O` at every level, with
pushforward multiplication by `p`. Its integral limit is zero, while the limit of the rational
groups is not: rationalisation comes after the limits. -/

/-- An integer divisible by every power of `p > 1` is zero. A compatible family `(x_k)` with
`x_k = p * x_{k+1}` in `ℤ` has `p ^ k ∣ x_0` for every `k`, so the integral limit vanishes. -/
theorem eq_zero_of_forall_pow_dvd {p : ℕ} (hp : 1 < p) {x : ℤ}
    (h : ∀ k : ℕ, (p : ℤ) ^ k ∣ x) : x = 0 := by
  by_contra hx
  have hk := h x.natAbs
  have hlt : x.natAbs < ((p : ℤ) ^ x.natAbs).natAbs := by
    rw [Int.natAbs_pow, Int.natAbs_natCast]
    exact Nat.lt_pow_self hp
  exact hx (Int.eq_zero_of_dvd_of_natAbs_lt_natAbs hk hlt)

/-- Over `ℚ` the family `x_k = p⁻ᵏ` is compatible under multiplication by `p` and nonzero, so the
limit of the rational groups along multiplication by `p` is not zero. -/
theorem rational_family_compatible {p : ℕ} (hp : p ≠ 0) (k : ℕ) :
    (p : ℚ) * ((p : ℚ) ^ (k + 1))⁻¹ = ((p : ℚ) ^ k)⁻¹ := by
  have : (p : ℚ) ≠ 0 := by exact_mod_cast hp
  field_simp
  ring

theorem rational_family_ne_zero {p : ℕ} (hp : p ≠ 0) (k : ℕ) : ((p : ℚ) ^ k)⁻¹ ≠ 0 := by
  have : (p : ℚ) ≠ 0 := by exact_mod_cast hp
  positivity

/-! ### A `p`-power index

Pullback along the connected degree-`p` cover of a circle is multiplication by `p` on
`H^1(S^1, F_p) = F_p`, which is zero: at a `p`-power index the transition is not injective. -/

theorem degree_p_pullback_mod_p (p : ℕ) [Fact p.Prime] (x : ZMod p) : (p : ZMod p) * x = 0 := by
  simp

/-- At an index `d` prime to `p` the same transition is multiplication by a unit. -/
theorem prime_to_p_index_isUnit {p d : ℕ} [Fact p.Prime] (hd : Nat.Coprime d p) :
    IsUnit (d : ZMod p) :=
  (ZMod.unitOfCoprime d hd).isUnit

/-! ### Averaging is the normalised trace

For a finite group `Q` (a deck group `K / K'`) whose order is invertible, Mathlib's averaging
projection is the group sum divided by `|Q|`. This is the finite form of `e_K ∘ ι_{K'} =
ι_K ∘ [K : K']⁻¹ cor` in `TameCompleted.averaging_comp_ι`; Tau Ceti states it as
`Representation.averageMap_eq_invOf_card_smul_norm`. -/

theorem averageMap_apply_eq_sum {k Q V : Type*} [CommRing k] [Group Q] [AddCommGroup V]
    [Module k V] (ρ : Representation k Q V) [Fintype Q] [Invertible (Fintype.card Q : k)] (v : V) :
    ρ.averageMap v = ⅟(Fintype.card Q : k) • ∑ q : Q, ρ q v := by
  simp only [Representation.averageMap, GroupAlgebra.average, map_smul, map_sum,
    MonoidAlgebra.of_apply, Representation.asAlgebraHom_single_one, LinearMap.smul_apply,
    LinearMap.sum_apply]

/-- The averaging projection fixes invariant vectors: on level-`K` classes the normalisation by
`[K : K']⁻¹` exactly undoes the group sum. -/
example {k Q V : Type*} [CommRing k] [Group Q] [AddCommGroup V] [Module k V]
    (ρ : Representation k Q V) [Fintype Q] [Invertible (Fintype.card Q : k)] (v : V)
    (hv : v ∈ ρ.invariants) : ρ.averageMap v = v :=
  ρ.averageMap_id v hv

/-! ### The Haar normalisation

With `μ(K) = [K⁰ : K]⁻¹`, a coset of `K` is the disjoint union of `[K : K']` cosets of `K'`, and
`[K : K'] · μ(K') = μ(K)`. This is why the normalised duality maps `μ(K) · h_K` commute with
transfer. -/

theorem haar_index_mul {k : Type*} [Field k] {a b : ℕ} (ha : (a : k) ≠ 0) (hb : (b : k) ≠ 0) :
    (b : k) * ((a : k) * (b : k))⁻¹ = (a : k)⁻¹ := by
  field_simp

/-! ### The complex `[O → O]` with differential `p`

In the acceptance test of the CC.2 control lemma, `H^0(M / p^(n+1)) = p^n O / p^(n+1)`, and reduction
to level `n` kills it: the image of `p ^ n` in `ZMod (p ^ n)` is zero, so the transitions vanish and
the limit is `0 = H^0(M)`. -/

theorem reduction_kills_top_power (p n : ℕ) :
    ((p : ZMod (p ^ n)) ^ n) = 0 := by
  rw [← Nat.cast_pow, ZMod.natCast_self]

end CompletedCohomologyPartIICC0Acceptance
