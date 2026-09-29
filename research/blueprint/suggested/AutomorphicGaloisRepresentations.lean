/-
Suggested Lean prototypes for the roadmap "Galois representations attached to modular and Hilbert modular
forms" (AutomorphicGaloisRepresentations), stages R19.1–R19.6.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicGaloisRepresentations.md` is definitive. The statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures. Every proof of a planned result
is `sorry`, and definitions of objects the pinned libraries lack are signatures with `sorry` bodies; nothing
here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is
imported.

Names are relative to the namespace `TauCeti.ModularGalois` and agree with the `api` and `tests` names of the
packet `research/blueprint/packets/AutomorphicGaloisRepresentations.json`. Unit tests are `example`s whose
docstring begins "Test `<name>`". Objects of other roadmaps are never invented here: parabolic cohomology with
coefficients (ModularCurvesPartII R14.3), the modular abelian variety `A_f` (ModularCurvesPartII R14.5), Tate
modules (ArithmeticGaloisRepresentations R01.6) and local Langlands (GL2AutomorphicRepresentationsAndTransfer
R16.3) are not available at the pinned commits, so the statements that need them are comments naming the
missing object.

What is prototyped is the arithmetic those statements compute: Frobenius polynomials in the roadmap's arithmetic
normalisation and its cohomological dual, the count of subgroups of order `p` behind the Hecke correspondence,
and small numerical checks.
-/

import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.Data.Fintype.Perm
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Card
import Mathlib.Algebra.Field.ZMod
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Analysis.Complex.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs

namespace TauCeti.ModularGalois

open Polynomial

/-! ## R19.1 — the Hecke correspondence (`AutomorphicGaloisRepresentations:R19.1/geometric-construction-and-the-eichler-congruence-relation`)

`HeckeCorrespondence`, `HeckeCorrespondence.fibre_q1`, `heckeTp` and `eichlerShimura`: not stated; they need the
modular schemes `M_n`, the universal elliptic curve and étale cohomology with coefficients (ModularCurvesPartII
R13–R14). -/

/-- Test `HeckeCorrespondence.fibre_q1_card_of_char_ne`: away from `p` the fibre of `q₁` is the set of lines of
`E[p] ≅ (ℤ/p)²`, of which there are `p + 1`. -/
example (p : ℕ) [Fact p.Prime] :
    Nat.card {W : Submodule (ZMod p) (Fin 2 → ZMod p) // Module.finrank (ZMod p) W = 1} = p + 1 :=
  sorry

-- Test `HeckeCorrespondence.fibre_q1_supersingular` and `HeckeCorrespondence.fibre_q1_ordinary`: not stated;
-- need subgroup schemes of `E[p]` in characteristic `p` (one for supersingular, two for ordinary `E`;
-- sourceIssue AutomorphicGaloisRepresentations/E1).

-- Test `eichlerShimura_level_one`: not stated; needs `nW_l` and the Frobenius correspondence.

/-! ## R19.1 — Frobenius polynomials (`AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`) -/

/-- The roadmap's arithmetic Frobenius polynomial `X² − a_p X + ψ(p) p^{k−1}` of `ρ_{f,λ}` at `p ∤ Nℓ`. -/
noncomputable def arithFrobCharpoly (a ψp : ℚ) (p k : ℕ) : ℚ[X] :=
  X ^ 2 - C a * X + C (ψp * (p : ℚ) ^ (k - 1))

/-- The arithmetic Frobenius polynomial of the cohomological realisation `M_{f,λ} = ρ_{f,λ}^∨`:
`X² − ψ(p)⁻¹ p^{1−k} a_p X + ψ(p)⁻¹ p^{1−k}`. -/
noncomputable def arithFrobCharpolyDual (a ψp : ℚ) (p k : ℕ) : ℚ[X] :=
  X ^ 2 - C (a / (ψp * (p : ℚ) ^ (k - 1))) * X + C (1 / (ψp * (p : ℚ) ^ (k - 1)))

/-- Acceptance: `Δ` at `2` (`τ(2) = -24`, `k = 12`): `X² + 24X + 2¹¹`. -/
example : arithFrobCharpoly (-24) 1 2 12 = X ^ 2 + C 24 * X + C 2048 := by
  sorry

/-- Acceptance: `11a1` at `3` (`a₃ = -1`, `k = 2`): `X² + X + 3`. -/
example : arithFrobCharpoly (-1) 1 3 2 = X ^ 2 + C 1 * X + C 3 := by
  sorry

/-- Acceptance (non-example of the normalisation): the cohomological realisation of `11a1` has arithmetic
Frobenius polynomial `X² + X/3 + 1/3` at `3`, not `X² + X + 3`. -/
example : arithFrobCharpolyDual (-1) 1 3 2 ≠ arithFrobCharpoly (-1) 1 3 2 := by
  sorry

/-! ## R19.1 — the parabolic premotive (`AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive`)

`ParabolicPremotive`, `filTopEquivCuspForms`, `pairing`, `heckeAction`, `levelChange`: not stated; they need
parabolic cohomology with `Sym^{k−2}` coefficients and its comparison isomorphisms (ModularCurvesPartII R14.3).
The de Rham side lands in Mathlib's `CuspForm`. -/

-- Test `ParabolicPremotive.weight_two_trivial_character`: not stated; needs étale cohomology of `X₀(N)`.
-- Test `ParabolicPremotive.dim_dR`: not stated; needs `M_dR`.
-- Test `ParabolicPremotive.fil_compat_mathlib`: not stated; needs `filTopEquivCuspForms`.
-- Test `ParabolicPremotive.no_eisenstein`: not stated; needs the boundary of the modular curve.

/-! ## R19.4 — conductors (`AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`) -/

/-- The local Euler factor `1 − a_p T + ψ(p) p^{k−1} T²` (good `p`) or `1 − a_p T` (bad `p`), read on the
inertia invariants of the cohomological realisation with geometric Frobenius. -/
noncomputable def eulerFactor (good : Bool) (a ψp : ℚ) (p k : ℕ) : ℚ[X] :=
  if good then 1 - C a * X + C (ψp * (p : ℚ) ^ (k - 1)) * X ^ 2 else 1 - C a * X

/-- Acceptance: `11a1` at `11` (split multiplicative, `a₁₁ = 1`): `1 − T`. -/
example : eulerFactor false 1 1 11 2 = 1 - X := by
  simp [eulerFactor]

/-! ## R19.6 — weight two (`AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`) -/

/-- The `ℚ_ℓ`-dimension of `V_ℓ(A_f)`: twice the degree of the coefficient field. -/
def tateModuleDim (degKf : ℕ) : ℕ := 2 * degKf

/-- Acceptance: the level-23 newform has `K_f = ℚ(√5)`, so `V_ℓ(A_f)` has dimension `4`. -/
example : tateModuleDim 2 = 4 := rfl

/-- Acceptance: `ℓ = 11` splits in `ℚ(√5)` (`X² − X − 1` has a root mod 11), `ℓ = 2` does not. -/
example : (∃ x : ZMod 11, x ^ 2 - x - 1 = 0) ∧ ¬ (∃ x : ZMod 2, x ^ 2 - x - 1 = 0) := by
  decide

/-! ## R19.6 — residual representations (`AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform`)

`residualRep`, `residualRep_trace`, `residualRep_det`, `residualRep_lattice_indep`: not stated; they need
`ρ_{f,λ}` and stable lattices (ArithmeticGaloisRepresentations R01.1). -/

-- Test `residualRep_11a1_five`, `residualRep_det_weight_two`, `residualRep_eq_torsion`,
-- `residualRep_not_reduction_without_ss`: not stated; need `ρ̄_{f,λ}`.

/-- Acceptance (trace identity for `11a1` at `λ = 5`): `a_p ≡ 1 + p (mod 5)` for the small good primes,
consistent with `ρ̄ ≅ 1 ⊕ χ̄₅` (`a₂ = -2`, `a₃ = -1`, `a₇ = -2`, `a₁₃ = 4`). -/
example : ((-2 : ZMod 5) = 1 + 2) ∧ ((-1 : ZMod 5) = 1 + 3) ∧ ((-2 : ZMod 5) = 1 + 7) ∧ ((4 : ZMod 5) = 1 + 13) := by
  decide

/-! ## R19.6 — the full weight-two Hecke algebra
(`AutomorphicGaloisRepresentations:R19.6/full-weight-two-hecke-algebra-and-its-galois-representations`)

`fullHeckeAlgebra`, `fullHeckeAlgebra_free`, `tateModule_free_rank_two`, `heckeRep`, `heckeRep_charpoly`,
`residualHeckeRep`, `heckeRep_newform`: not stated; they need the Jacobian `J_Γ` with its Hecke action and Tate
module (ModularCurvesPartII R14.2, ArithmeticGaloisRepresentations R01.6).
-/

-- Test `fullHeckeAlgebra_level_eleven`, `fullHeckeAlgebra_genus_zero`, `heckeRep_newform_compat`: not stated;
-- they need `𝕋_ℤ` and `ρ_𝔪`.

/-- Test `fullHeckeAlgebra_not_reduced_level_88` (its arithmetic): the old space of `11a1` at level `88` has
dimension `σ₀(8) = 4`, and `T₂` satisfies `u²(u² + 2u + 2)` (`a₂ = -2`). The element `u(u² + 2u + 2)` has degree
`3 < 4`, so it is nonzero in `K[u]/(u²(u² + 2u + 2))`, and its square is a multiple of the modulus. -/
example : (Nat.divisors 8).card = 4 := by decide

example (u : ℤ) : (u * (u ^ 2 + 2 * u + 2)) ^ 2 = (u ^ 2 * (u ^ 2 + 2 * u + 2)) * (u ^ 2 + 2 * u + 2) := by
  ring

/-! ## R19.6 — the reduced Hecke algebra over ℚ
(`AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-classical`,
`AutomorphicGaloisRepresentations:R19.6/reduced-hecke-algebra-as-a-localisation`) -/

/-- Acceptance (Darmon–Diamond–Taylor Example 3.28, `ρ̄ = ρ̄_{57B,3}`, `Σ = ∅`): the traces of `ρ^mod_∅(Frob_p)`
for `p = 2, 5, 7, 11, 13, 17, 23, 29` are pairs `(x, y)` with `x ≡ y (mod 3)`, i.e. elements of
`𝕋_∅ = {(x, y) ∈ ℤ₃² : x ≡ y mod 3}`. -/
example : [((1 : ℤ), (-2 : ℤ)), (-2, 1), (0, 3), (0, -3), (6, -6), (-6, 3), (4, 4), (2, -10)].all
    (fun t => (t.1 - t.2) % 3 == 0) = true := by
  decide

/-- Acceptance (`ρ̄ = ρ̄_{11a1,3}`, `Σ = {2}`): `N_Σ = 11 · 2² = 44`, and the `11a1`-part of `𝕋_K` at level 44 is
`K[u]/(u(u² + 2u + 2))`; its cofactor at `u = 0` is `2`, nonzero in `𝔽₃`, so `u = 0` is a simple root above `𝔪`. -/
example : 11 * 2 ^ 2 = 44 ∧ ((0 : ZMod 3) ^ 2 + 2 * 0 + 2 ≠ 0) := by
  decide

/-! ## R19.1 — the S-integral structure (`AutomorphicGaloisRepresentations:R19.1/integral-structure-of-the-newform-premotive`)

`IntegralPremotive`, `IntegralPremotive.kernel`, `integralParabolic`, `integralParabolic_filTop`,
`integralParabolic_heckeDuality`, `integralNewformPremotive`, `integralNewformPremotive_rational`: not stated; they
need the S-integral realisations of the modular curve with coefficients (ModularCurvesPartII R14.3) and
Fontaine–Laffaille modules (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3).
-/

-- Test `integralNewformPremotive_level_eleven`, `integralNewformPremotive_rational_test`,
-- `integralParabolic_filTop_scalar`: not stated; they need `𝓜_g`.

/-- Test `integralParabolic_bad_set` (its arithmetic): for `N = 11`, `k = 2` the excluded primes are those dividing
`N · k! = 22`, namely `2` and `11`; at `ℓ = 2` Faltings' condition `k − 1 ≤ ℓ − 2` fails, at `ℓ = 3` it holds. -/
example : 11 * Nat.factorial 2 = 2 * 11 ∧ Nat.Prime 2 ∧ Nat.Prime 11 ∧ ¬ (2 - 1 ≤ 2 - 2) ∧ (2 - 1 ≤ 3 - 2) :=
  ⟨by simp [Nat.factorial], Nat.prime_two, by decide, by decide, by decide⟩

/-! ## R19.1 — the proof of the Deligne–Serre theorem (`…:R19.1/deligne-serre-condition-c` and the §§5–8 nodes)

`ConditionC` is the condition `C(η, M)` of Deligne–Serre 7.1, and `IsSemisimpleSubgroup` says that the identity
representation of `G` on `𝔽_ℓ²` is semisimple. The characteristic polynomial of `h` is used in place of
`det(1 − hT)`; for invertible `h` each determines the other. `ConditionC.mono`, `ConditionC.of_index_two` and
`card_charpoly_fibre` are stated below only through their arithmetic. The lifting lemma
`…:R19.1/lifting-representations-of-groups-of-order-prime-to-l` is `exists_lift_of_not_dvd_card`. The other section 5,
6 and 8 theorems need Galois representations of `G_ℚ`, Hecke eigenforms and Čebotarev in Dirichlet density; they are
listed at the end. -/

open scoped Classical in
/-- Deligne–Serre 7.1: `G ≤ GL₂(𝔽_ℓ)` satisfies `C(η, M)` if some `H ⊆ G` with `|H| ≥ (1 − η)|G|` has at most `M`
distinct characteristic polynomials. -/
def ConditionC (ℓ : ℕ) (G : Subgroup (GL (Fin 2) (ZMod ℓ))) (η : ℝ) (M : ℕ) : Prop :=
  ∃ H : Finset (GL (Fin 2) (ZMod ℓ)), (∀ h ∈ H, h ∈ G) ∧ (1 - η) * (Nat.card G : ℝ) ≤ H.card ∧
    (H.image fun h : GL (Fin 2) (ZMod ℓ) => (h : Matrix (Fin 2) (Fin 2) (ZMod ℓ)).charpoly).card ≤ M

/-- Deligne–Serre 7.1: the identity representation of `G ≤ GL₂(𝔽_ℓ)` is semisimple, i.e. every `G`-stable subspace
of `𝔽_ℓ²` has a `G`-stable complement. -/
def IsSemisimpleSubgroup (ℓ : ℕ) (G : Subgroup (GL (Fin 2) (ZMod ℓ))) : Prop :=
  ∀ W : Submodule (ZMod ℓ) (Fin 2 → ZMod ℓ),
    (∀ g ∈ G, W.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) (ZMod ℓ))) ≤ W) →
      ∃ W' : Submodule (ZMod ℓ) (Fin 2 → ZMod ℓ), IsCompl W W' ∧
        ∀ g ∈ G, W'.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) (ZMod ℓ))) ≤ W'

/-- Deligne–Serre Proposition 7.2 (`…:R19.1/bounded-semisimple-subgroups-of-gl2`): for `η < 1/2` the semisimple
subgroups of the `GL₂(𝔽_ℓ)` satisfying `C(η, M)` have order bounded independently of `ℓ`. -/
theorem card_le_of_conditionC (η : ℝ) (hη : η < 1 / 2) (M : ℕ) :
    ∃ A : ℕ, ∀ (ℓ : ℕ) [Fact ℓ.Prime] (G : Subgroup (GL (Fin 2) (ZMod ℓ))),
      IsSemisimpleSubgroup ℓ G → ConditionC ℓ G η M → Nat.card G ≤ A :=
  sorry

/-- Test `conditionC_top`: `GL₂(𝔽_ℓ)` has the `ℓ(ℓ − 1)` characteristic polynomials `T² − tT + d`, `d ≠ 0`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] : ConditionC ℓ ⊤ 0 (ℓ * (ℓ - 1)) :=
  sorry

/-- Test `not_conditionC_zero`: for `η < 1` no subgroup satisfies `C(η, 0)`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (G : Subgroup (GL (Fin 2) (ZMod ℓ))) (η : ℝ) (hη : η < 1) :
    ¬ ConditionC ℓ G η 0 :=
  sorry

/-- Test `not_conditionC_cyclic_five`: `⟨diag(2, 1)⟩ ≤ GL₂(𝔽₅)` has order `4` and four characteristic polynomials. -/
example (g : GL (Fin 2) (ZMod 5)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![2, 0; 0, 1]) :
    ¬ ConditionC 5 (Subgroup.zpowers g) 0 3 :=
  sorry

/-- Test `conditionC_split_cartan_three`: the diagonal subgroup of `GL₂(𝔽₃)` (order `4`) has three characteristic
polynomials, since `diag(1, 2)` and `diag(2, 1)` share one. -/
example (T : Subgroup (GL (Fin 2) (ZMod 3)))
    (hT : ∀ g : GL (Fin 2) (ZMod 3), g ∈ T ↔ (g : Matrix (Fin 2) (Fin 2) (ZMod 3)) 0 1 = 0 ∧
      (g : Matrix (Fin 2) (Fin 2) (ZMod 3)) 1 0 = 0) :
    ConditionC 3 T 0 3 :=
  sorry

/-- Test `card_charpoly_fibre_three` (its arithmetic): `|GL₂(𝔽₃)| = 48 = 1·12 + 2·9 + 3·6`, by Mathlib's
`Matrix.card_GL_field`. -/
example : Nat.card (GL (Fin 2) (ZMod 3)) = 1 * 12 + 2 * 9 + 3 * 6 := by
  have : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
  exact (Matrix.card_GL_field (𝔽 := ZMod 3) 2).trans (by simp [ZMod.card, Fin.prod_univ_two])

/-- `card_charpoly_fibre`, summed: `(ℓ − 1)(ℓ − 2)/2` polynomials with two roots (fibre `ℓ² + ℓ`), `ℓ − 1` with one
(fibre `ℓ²`) and `(ℓ² − ℓ)/2` with none (fibre `ℓ² − ℓ`) account for `|GL₂(𝔽_ℓ)| = (ℓ² − 1)(ℓ² − ℓ)`; doubled to
stay in `ℤ`. -/
example (l : ℤ) :
    (l ^ 2 + l) * ((l - 1) * (l - 2)) + 2 * (l ^ 2 * (l - 1)) + (l ^ 2 - l) * (l ^ 2 - l) =
      2 * ((l ^ 2 - 1) * (l ^ 2 - l)) := by
  ring

/-- Proposition 7.2, case (a): `(1 − η) r ℓ(ℓ² − 1) ≤ M(ℓ² + ℓ)` gives `(1 − η) r (ℓ − 1) ≤ M`, which bounds `ℓ`. -/
example (η r l M : ℝ) (hl : 0 < l) (h : (1 - η) * (r * (l * (l ^ 2 - 1))) ≤ M * (l ^ 2 + l)) :
    (1 - η) * r * (l - 1) ≤ M := by
  have hpos : 0 < l ^ 2 + l := by positivity
  have key : (l ^ 2 + l) * ((1 - η) * r * (l - 1)) ≤ (l ^ 2 + l) * M := by
    have e : (l ^ 2 + l) * ((1 - η) * r * (l - 1)) = (1 - η) * (r * (l * (l ^ 2 - 1))) := by ring
    rw [e, mul_comm (l ^ 2 + l) M]
    exact h
  exact le_of_mul_le_mul_left key hpos

/-- `ConditionC.of_index_two` (Proposition 7.2, case (c)): if `|H| ≥ (1 − η)|G|` and at most `|G|/2` elements of `H`
lie outside `G′`, then `|H ∩ G′| ≥ (1 − 2η)|G′|` with `|G′| = |G|/2`. -/
example (η g h h' : ℝ) (hH : (1 - η) * g ≤ h) (hout : h - g / 2 ≤ h') : (1 - 2 * η) * (g / 2) ≤ h' := by
  linarith

/-- Proposition 5.5 (`…:R19.1/weight-one-eigenvalues-outside-a-sparse-set`): `dens.sup X(c) ≤ r/c`, and `r/c ≤ η`
once `c ≥ r/η`. -/
example (r c η : ℝ) (hr : 0 < r) (hη : 0 < η) (hc : r / η ≤ c) : r / c ≤ η := by
  have hc0 : 0 < c := lt_of_lt_of_le (div_pos hr hη) hc
  rw [div_le_iff₀ hc0]
  rw [div_le_iff₀ hη] at hc
  linarith

/-- Acceptance (`…:R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform`, 6.9 in small characteristic):
`E₄ = 1 + 240∑σ₃(n)qⁿ ≡ 1` mod `2`, `3`, `5` and `E₆ = 1 − 504∑σ₅(n)qⁿ ≡ 1` mod `2`, `3`, `7`. -/
example : 240 = 2 ^ 4 * 3 * 5 ∧ 504 = 2 ^ 3 * 3 ^ 2 * 7 := by
  norm_num

/-- Acceptance (η(z)η(23z)): `1 + T + T²` is `(1 − ωT)(1 − ω²T)`, since `(1 + T + T²)(1 − T) = 1 − T³`, and it is
`(1 − T)²` mod `3`, which is why the residual image at `ℓ = 3` is smaller. -/
example (T : ℤ) : (1 + T + T ^ 2) * (1 - T) = 1 - T ^ 3 ∧ (1 - T) ^ 2 = 1 + T + T ^ 2 - 3 * T := by
  constructor <;> ring

/-- `…:R19.1/weight-one-cuspidal-irreducibility`: for `|x| = |y| = 1`, `|x + y|² = 2 + 2 Re(x ȳ)`, so a reducible
`ρ = χ₁ ⊕ χ₂` would give `∑|a_p|²p^{−s} = 2 log(1/(s − 1)) + O(1)`. -/
example (x y : ℂ) (hx : Complex.normSq x = 1) (hy : Complex.normSq y = 1) :
    Complex.normSq (x + y) = 2 + 2 * (x * (starRingEnd ℂ) y).re := by
  rw [Complex.normSq_add, hx, hy]
  ring

/-- `…:R19.1/lifting-representations-of-groups-of-order-prime-to-l`: over a complete discrete valuation ring `O`
whose residue characteristic does not divide `|Γ|`, every `ρ̄ : Γ → GL_n(k)` lifts to `ρ : Γ → GL_n(O)`
(Schur–Zassenhaus at each finite level, then an inverse limit). -/
theorem exists_lift_of_not_dvd_card {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] {Γ : Type*} [Group Γ] [Finite Γ]
    (hΓ : ¬ ringChar (IsLocalRing.ResidueField O) ∣ Nat.card Γ) {n : ℕ}
    (ρbar : Γ →* GL (Fin n) (IsLocalRing.ResidueField O)) :
    ∃ ρ : Γ →* GL (Fin n) O, (Matrix.GeneralLinearGroup.map (IsLocalRing.residue O)).comp ρ = ρbar :=
  sorry

/-- `…:R19.1/lifting-representations-of-groups-of-order-prime-to-l`, non-example: for `ℓ ≥ 5` a primitive `ℓ`-th
root of unity has degree `ℓ − 1 > 2`, so `GL₂(ℤ_ℓ)` has no element of order `ℓ`. -/
example (l : ℕ) (h : 5 ≤ l) : 2 < l - 1 := by
  omega

/-! ## R19.2 — Carayol's construction and proof (`AutomorphicGaloisRepresentations:R19.2/carayol-*`)

`Carayol.sigmaLambda`, `Carayol.sigmaLambda_finrank`, `Carayol.sigmaLambda_level_indep` and
`Carayol.cohomology_decomposition`: not stated; they need the Shimura curves `M_K`, the λ-adic sheaves `F_λ` and
their étale cohomology (HilbertModularVarietiesAndShimuraCurves R18.4). The tests
`Carayol.sigmaLambda_finrank_two` and `Carayol.parabolic_needed_over_Q` need the same objects. Theorems (A) and (B)
and the local statements need Weil–Deligne representations, local Langlands and base change
(GL2AutomorphicRepresentationsAndTransfer R16.3, R17.3–R17.5). -/

/-- Test `Carayol.coefficient_rank` (its arithmetic): `dim W = ∏ᵢ (kᵢ − 1)`; for `(k₁, k₂, k₃) = (2, 3, 4)` it is
`6`, and with every `kᵢ = 2` it is `1`. -/
example : (∏ i : Fin 3, (![2, 3, 4] i - 1)) = 6 ∧ (∏ _i : Fin 3, (2 - 1)) = 1 := by decide

/-- Acceptance (`…:R19.2/carayol-sigma-lambda-construction`): the exponent `(w − kᵢ + 2)/2` of `τᵢ ∘ ν` is an integer
because `kᵢ` and `w` have the same parity. -/
example (w k : ℤ) (h : Even (w - k)) : ∃ m, w - k + 2 = 2 * m := by
  obtain ⟨r, hr⟩ := h
  exact ⟨r + 1, by omega⟩

/-- Acceptance (`…:R19.2/carayol-primitive-restriction-lemma`): a `2`-Sylow subgroup of `S₄` (order `8`) has index
`3`, and the Klein group (order `4`) has index `3` in `A₄`, which has `12` elements. -/
example : Nat.factorial 4 / 8 = 3 ∧ Fintype.card (alternatingGroup (Fin 4)) = 12 ∧ 12 / 4 = 3 := by
  refine ⟨by decide, ?_, by decide⟩
  rw [card_alternatingGroup, Fintype.card_fin]
  decide

/-! ## Theorems needing objects of other roadmaps

* `…:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`, `…:R19.1/weight-one-artin-representation`,
  `…:R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform`, `…:R19.1/rankin-bound-for-a-cuspidal-eigenform`,
  `…:R19.1/weight-one-eigenvalues-outside-a-sparse-set`, `…:R19.1/uniformly-bounded-residual-images-in-weight-one`,
  `…:R19.1/weight-one-characteristic-zero-lift`,
  `…:R19.1/weight-one-cuspidal-irreducibility`,
  `…:R19.2/hilbert-modular-compatible-system-carayol-theorem-A`, `…:R19.3/strict-compatibility-and-the-monodromy-weight-purity`,
  `…:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`,
  `…:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`,
  `…:R19.6/determinants-and-representability-over-a-hecke-algebra`: not stated; they need continuous Galois
  representations of `G_ℚ` with coefficients, Weil–Deligne representations and local Langlands.
* `…:R19.6/hecke-algebra-representation-quaternionic`, `…:R19.4/quaternionic-sigma-place-local-form`,
  `…:R19.5/hilbert-local-behaviour-at-p`: not stated; they need quaternionic modular forms on a definite quaternion
  algebra over a totally real field, their Hecke algebras (OrdinaryAutomorphicFormsAndModularityLifting R21.1) and
  Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer R17.3).
* `…:R19.2/wiles-ordinary-hilbert-representation`, `…:R19.4/nearly-ordinary-hilbert-compatibility-away-from-p`: not
  stated; they need nearly ordinary Hilbert modular forms (OrdinaryAutomorphicFormsAndModularityLifting R21.2).
* `…:R19.6/hecke-algebra-representation-classical`, `…:R19.6/reduced-hecke-algebra-as-a-localisation`: not stated;
  they need the newforms of weight two with their λ-adic representations, the full Hecke algebra of `Γ₀(N_Σ)` and
  the universal deformation ring `R_Σ` (GlobalGaloisDeformations R04.3).
-/

/-- Acceptance (`…:R19.4/quaternionic-sigma-place-local-form`): the unramified character `γ_v` at a place of `Σ`
satisfies `γ_v² = ψ_v`; for trivial `ψ` its Frobenius value is a square root of `1`. -/
example (γ : ℚ) (h : γ ^ 2 = 1) : γ = 1 ∨ γ = -1 :=
  mul_self_eq_one_iff.mp (by rw [← sq]; exact h)

end TauCeti.ModularGalois
