/-
Suggested Lean prototypes for the roadmap "Galois representations attached to modular and Hilbert modular
forms" (AutomorphicGaloisRepresentations), stages R19.1–R19.6.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicGaloisRepresentations.md` is the reader document; the independent
review has requested revisions to it. The reviewed packet and REV-AutomorphicGaloisRepresentations report
record the corrections and the unverified Hilbert normalizations. The statements below suggest
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

The file prototypes finite matrix subgroups, real linear projector images and
lattice intersections, the integral mixed-determinant identity and the arithmetic
those statements compute: Frobenius polynomials in the roadmap's arithmetic
normalisation and its cohomological dual, the count of subgroups of order `p` behind the Hecke correspondence,
and small numerical checks.
-/

import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Algebra.Module.Submodule.RestrictScalars
import Mathlib.Algebra.DualNumber
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

-- The bad Euler factor and the Tate-module decomposition need actual inertia
-- invariants and the R14.5 abelian quotient; they are recorded in the inventory
-- below. No boolean good/bad factor or dimension-only stand-in is used.

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

/-- Test `residualRep_trace_char_two` (available matrix part): scalar matrices of eigenvalue 1 and a≠1
have the same trace in characteristic two and different determinants and characteristic polynomials.
For a of order three these are the generator matrices of 1⊕1 and χ⊕χ on C₃ over F₄. The actual Galois
recognition signature needs the imported Galois carrier and is omitted. -/
example {K : Type*} [Field K] [CharP K 2] (a : K) (ha0 : a ≠ 0) (ha1 : a ≠ 1) :
    Matrix.trace (!![a, 0; 0, a] : Matrix (Fin 2) (Fin 2) K) =
      Matrix.trace (1 : Matrix (Fin 2) (Fin 2) K) ∧
    Matrix.det (!![a, 0; 0, a] : Matrix (Fin 2) (Fin 2) K) ≠
      Matrix.det (1 : Matrix (Fin 2) (Fin 2) K) ∧
    (!![a, 0; 0, a] : Matrix (Fin 2) (Fin 2) K).charpoly ≠
      (1 : Matrix (Fin 2) (Fin 2) K).charpoly :=
  sorry

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
`card_charpoly_fibre` have actual finite-matrix signatures below, including discriminating fibre tests. The lifting lemma
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

/-- API `ConditionC.mono`: enlarge the exceptional proportion or the number of polynomials. -/
theorem ConditionC.mono {ℓ : ℕ} [Fact ℓ.Prime]
    {G : Subgroup (GL (Fin 2) (ZMod ℓ))} {η η' : ℝ} {M M' : ℕ}
    (hη : η ≤ η') (hM : M ≤ M') (hC : ConditionC ℓ G η M) :
    ConditionC ℓ G η' M' :=
  sorry

/-- API `ConditionC.of_index_two`: the index is relative to G, expressed by its finite cardinality,
not the index of H in the ambient general linear group. -/
theorem ConditionC.of_index_two {ℓ : ℕ} [Fact ℓ.Prime]
    {G H : Subgroup (GL (Fin 2) (ZMod ℓ))} (hHG : H ≤ G)
    (hindex : Nat.card G = 2 * Nat.card H) {η : ℝ} {M : ℕ}
    (hC : ConditionC ℓ G η M) : ConditionC ℓ H (2 * η) M :=
  sorry

/-- API `card_charpoly_fibre`: the polynomial must be monic quadratic with nonzero constant term.
The repeated-root branch counts distinct roots, not their multiplicities. -/
theorem card_charpoly_fibre (ℓ : ℕ) [Fact ℓ.Prime] (t d : ZMod ℓ) (hd : d ≠ 0) :
    Nat.card {g : GL (Fin 2) (ZMod ℓ) //
      (g : Matrix (Fin 2) (Fin 2) (ZMod ℓ)).charpoly = X ^ 2 - C t * X + C d} =
    if Nat.card {x : ZMod ℓ // (X ^ 2 - C t * X + C d).eval x = 0} = 2 then ℓ ^ 2 + ℓ
    else if Nat.card {x : ZMod ℓ // (X ^ 2 - C t * X + C d).eval x = 0} = 1 then ℓ ^ 2
    else ℓ ^ 2 - ℓ :=
  sorry

/-- Deligne–Serre Proposition 7.2 (`…:R19.1/bounded-semisimple-subgroups-of-gl2`): for `η < 1/2` the semisimple
subgroups of the `GL₂(𝔽_ℓ)` satisfying `C(η, M)` have order bounded independently of `ℓ`. -/
theorem card_le_of_conditionC (η : ℝ) (hη : η < 1 / 2) (M : ℕ) :
    ∃ A : ℕ, ∀ (ℓ : ℕ) [Fact ℓ.Prime] (G : Subgroup (GL (Fin 2) (ZMod ℓ))),
      IsSemisimpleSubgroup ℓ G → ConditionC ℓ G η M → Nat.card G ≤ A :=
  sorry

/-- Test `conditionC_top`: `GL₂(𝔽_ℓ)` has the `ℓ(ℓ − 1)` characteristic polynomials `T² − tT + d`, `d ≠ 0`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] : ConditionC ℓ ⊤ 0 (ℓ * (ℓ - 1)) :=
  sorry

/-- Test `conditionC_top` (sharpness): retaining all group elements requires every polynomial. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (M : ℕ) (hM : M < ℓ * (ℓ - 1)) :
    ¬ ConditionC ℓ ⊤ 0 M :=
  sorry

/-- Test `not_conditionC_zero`: for `η < 1` no subgroup satisfies `C(η, 0)`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (G : Subgroup (GL (Fin 2) (ZMod ℓ))) (η : ℝ) (hη : η < 1) :
    ¬ ConditionC ℓ G η 0 :=
  sorry

/-- Test `not_conditionC_cyclic_five`: `⟨diag(2, 1)⟩ ≤ GL₂(𝔽₅)` has order `4` and four characteristic polynomials. -/
example (g : GL (Fin 2) (ZMod 5)) (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![2, 0; 0, 1]) :
    ¬ ConditionC 5 (Subgroup.zpowers g) 0 3 :=
  sorry

/-- Test `not_conditionC_cyclic_five` (the positive boundary case): discard one of four elements. -/
example (g : GL (Fin 2) (ZMod 5))
    (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![2, 0; 0, 1]) :
    ConditionC 5 (Subgroup.zpowers g) (1 / 4) 3 :=
  sorry

/-- Test `conditionC_split_cartan_three`: the diagonal subgroup of `GL₂(𝔽₃)` (order `4`) has three characteristic
polynomials, since `diag(1, 2)` and `diag(2, 1)` share one. -/
example (T : Subgroup (GL (Fin 2) (ZMod 3)))
    (hT : ∀ g : GL (Fin 2) (ZMod 3), g ∈ T ↔ (g : Matrix (Fin 2) (Fin 2) (ZMod 3)) 0 1 = 0 ∧
      (g : Matrix (Fin 2) (Fin 2) (ZMod 3)) 1 0 = 0) :
    ConditionC 3 T 0 3 :=
  sorry

/-- Test `card_charpoly_fibre_three` (split distinct roots): X²−1 has a fibre of size 12. -/
example : Nat.card {g : GL (Fin 2) (ZMod 3) //
    (g : Matrix (Fin 2) (Fin 2) (ZMod 3)).charpoly = X ^ 2 - C 1} = 12 :=
  sorry

/-- Test `card_charpoly_fibre_three` (repeated root): (X−1)² has a fibre of size 9. -/
example : Nat.card {g : GL (Fin 2) (ZMod 3) //
    (g : Matrix (Fin 2) (Fin 2) (ZMod 3)).charpoly = (X - C 1) ^ 2} = 9 :=
  sorry

/-- Test `card_charpoly_fibre_three` (irreducible): X²+1 has a fibre of size 6. -/
example : Nat.card {g : GL (Fin 2) (ZMod 3) //
    (g : Matrix (Fin 2) (Fin 2) (ZMod 3)).charpoly = X ^ 2 + C 1} = 6 :=
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
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)] {Γ : Type*} [Group Γ] [Finite Γ]
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

/-! Concrete algebraic parts of the geometric interfaces. The input actions and
projectors still have to be supplied by the named geometry owners; no curve,
WD parameter, period module or determinant-law carrier is invented here. -/

section Projector
variable {K Γ V : Type*} [Field K] [Group Γ] [Fintype Γ]
  [AddCommGroup V] [Module K V]

/-- Algebraic action of Scholl's ε-projector. Specialisation to Γ_r and its
geometric action, and the parabolic comparison, require GH.0/R14.3. -/
noncomputable def schollProjector (ρ : Representation K Γ V) (ε : Γ →* Kˣ) :
    Module.End K V :=
  (Fintype.card Γ : K)⁻¹ • ∑ g : Γ, (↑(ε g)⁻¹ : K) • ρ g

theorem schollProjector_idempotent (ρ : Representation K Γ V) (ε : Γ →* Kˣ)
    (hcard : (Fintype.card Γ : K) ≠ 0) :
    schollProjector ρ ε * schollProjector ρ ε = schollProjector ρ ε :=
  sorry

-- The newformFactor prototype is its actual linear image, after the imported
-- rational new Hecke algebra has supplied the orbit idempotent on cohomology.
def newformFactor (e : Module.End K V) : Submodule K V := LinearMap.range e

theorem newformFactor_mem (e : Module.End K V) (he : e * e = e) (v : V) :
    v ∈ newformFactor e ↔ e v = v := by
  constructor
  · rintro ⟨w, rfl⟩
    exact DFunLike.congr_fun he w
  · intro hv
    exact ⟨v, hv⟩

/-- Test `schollProjector_weight_three`: algebraic part, a vector on which the
character acts has projector value itself. The actual Γ_r action remains an import. -/
example (ρ : Representation K Γ V) (ε : Γ →* Kˣ)
    (hcard : (Fintype.card Γ : K) ≠ 0) (v : V)
    (hv : ∀ g, ρ g v = (ε g : K) • v) : schollProjector ρ ε v = v :=
  sorry

/-- Test `newformFactor_orbit`: a single eigenspace after coefficient extension
must still lie in the actual orbit-projector image. Here is the image criterion. -/
example (e : Module.End K V) (he : e * e = e) (v : V) (hv : e v = v) :
    v ∈ newformFactor e := (newformFactor_mem e he v).mpr hv
end Projector

section OrdinaryLattice
variable {O K V : Type*} [CommRing O] [Field K] [Algebra O K]
  [AddCommGroup V] [Module K V] [Module O V] [IsScalarTower O K V]

/-- The actual intersection of a fixed lattice with the ordinary K-line.
Neither its Galois invariance nor its rank is assumed by this definition. -/
def ordinaryLatticePlus (T : Submodule O V) (Vplus : Submodule K V) : Submodule O V :=
  T ⊓ Vplus.restrictScalars O

@[simp] theorem ordinaryLatticePlus_mem (T : Submodule O V) (Vplus : Submodule K V)
    (v : V) : v ∈ ordinaryLatticePlus T Vplus ↔ v ∈ T ∧ v ∈ Vplus := Iff.rfl

/-- Saturation inside T, with nonzero scalar image stated explicitly. -/
theorem ordinaryLatticePlus_saturated (T : Submodule O V) (Vplus : Submodule K V)
    (c : O) (hc : algebraMap O K c ≠ 0) (v : V) (hv : v ∈ T)
    (hcv : c • v ∈ ordinaryLatticePlus T Vplus) :
    v ∈ ordinaryLatticePlus T Vplus := by
  refine ⟨hv, ?_⟩
  have h : (algebraMap O K c) • v ∈ Vplus := by
    rw [IsScalarTower.algebraMap_smul]
    exact hcv.2
  have hi := Vplus.smul_mem (algebraMap O K c)⁻¹ h
  change v ∈ Vplus
  simpa only [smul_smul, inv_mul_cancel₀ hc, one_smul] using hi

/-- Test `ordinaryLatticePlus_saturation`: membership is tested in the original
lattice and the K-line, so replacing the intersection by p times it is invalid. -/
example (T : Submodule O V) (Vplus : Submodule K V) (v : V) (hv : v ∈ T)
    (hl : v ∈ Vplus) : v ∈ ordinaryLatticePlus T Vplus := ⟨hv, hl⟩
end OrdinaryLattice

section IntegralDeterminant
variable {A : Type*} [CommRing A]

/-- Rank-two mixed determinant coefficient, without division by two.
This is the coefficient identity imported by the integral law descent. -/
theorem determinant_mixed_coefficient (g h : Matrix (Fin 2) (Fin 2) A) :
    (g + h).det = g.det + h.det + g.trace * h.trace - (g * h).trace := by
  simp [Matrix.det_fin_two, Matrix.trace, Matrix.mul_apply, Fin.sum_univ_two]
  ring

/-- Test `geometricHeckeDeterminant_characteristicTwo`: the same identity works
over F₂; it does not rely on an inverse of two. -/
example (g h : Matrix (Fin 2) (Fin 2) (ZMod 2)) :
    (g + h).det = g.det + h.det + g.trace * h.trace - (g * h).trace :=
  determinant_mixed_coefficient g h

/-- Test `geometricHeckeDeterminant_dualNumbers`: a nonzero determinant change
is invisible under reduction. These are actual matrices over Mathlib's dual numbers. -/
example :
    (!![1 + DualNumber.eps, 0; 0, 1] :
      Matrix (Fin 2) (Fin 2) (DualNumber ℚ)).det = 1 + DualNumber.eps ∧
    (1 + DualNumber.eps : DualNumber ℚ) ≠ 1 := by
  constructor
  · simp [Matrix.det_fin_two]
  · intro h
    have hs := congrArg TrivSqZeroExt.snd h
    norm_num at hs

/-- The reduction of the preceding matrix is the identity matrix. -/
example : TrivSqZeroExt.fst (1 + DualNumber.eps : DualNumber ℚ) = 1 := by simp
end IntegralDeterminant

end TauCeti.ModularGalois

/-! ## Complete declaration and API inventory

Every packet declaration is named here. Algebraic parts above use actual Mathlib
modules, maps, matrix groups and dual numbers. The unavailable geometric,
Galois, period, WD, compatible-system and polynomial-law reconstruction carriers
are named below and their signatures omitted. No desired theorem is stored as a
Prop-valued field. This inventory reproduces the reviewed specifications;
review.status=needs_changes means the global Hilbert identifications named in
the review report remain unverified. The inventory is not an acceptance claim.

AutomorphicGaloisRepresentations:R19.1/geometric-construction-and-the-eichler-congruence-relation
Higher-coefficient Eichler–Shimura congruence relation (construction).
On the imported fine modular curve with universal elliptic curve and its Sym^r R¹f_* coefficient system (classical weight k=r+2), construct the higher-coefficient Hecke correspondence action on parabolic cohomology. At a prime q away from level and coefficient characteristic, its special-fibre action satisfies T_q = F + I_q^* V, FV = q^{r+1}, R_q = q^r I_q^*, and 1−T_q X+qR_q X²=(1−FX)(1−I_q^*VX). F is geometric Frobenius on cohomology. At level one I_q^*=1. Restriction to the newform eigenspace and arithmetic dualisation belong to the rank-two-realisation node. Weight-two special-fibre geometry and its Eichler–Shimura relation are imported from R14.6; subgroup-scheme representability and the curve carrier are imported from R14.3. The ordinary characteristic-q fibre has two geometric subgroup schemes of order q, connected and étale; the supersingular fibre has one. This statement does not assert an unconditional Chow projector for each individual newform.
Hypotheses: Fine auxiliary level n≥3; q prime to n and to the coefficient characteristic. The operator I_q^* at general level is retained, and r=k−2; only at level one may it be suppressed. Use the imported R14.6 correspondence geometry; in characteristic q count subgroup schemes, not points of E[q].
Required imported carriers/interfaces: ModularCurvesPartII:R14.6/special-fibre-eichler-shimura, ModularCurvesPartII:R14.3, WeightsInEtaleCohomology:R34.6, ArithmeticGaloisRepresentations:R01.6, ModularCurvesPartII:R14.6.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.higherCoefficientHeckeAction [constructor]: Pull–push of the imported R14 correspondence on Sym^r coefficients and parabolic cohomology.
  TauCeti.ModularGalois.higherCoefficientHeckeAction_level [functoriality]: Level change intertwines the higher-coefficient action.
  TauCeti.ModularGalois.higherCoefficientEichlerShimura [relation]: T_q=F+I_q^*V, FV=q^{r+1}, R_q=q^r I_q^*.
  TauCeti.ModularGalois.higherCoefficientEichlerShimura_factorisation [compatibility]: 1−T_qX+qR_qX²=(1−FX)(1−I_q^*VX).
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.HeckeCorrespondence.fibre_q1_card_of_char_ne [computation]: For char k(s) ≠ p the fibre of q_1 has p + 1 points (the p + 1 lines of E_s[p] ≅ (Z/p)²).
  Test TauCeti.ModularGalois.HeckeCorrespondence.fibre_q1_supersingular [degenerate]: Over a supersingular point in characteristic p the fibre is the single point ker F.
  Test TauCeti.ModularGalois.HeckeCorrespondence.fibre_q1_ordinary [non-example]: Over an ordinary point in characteristic p the fibre has two points: a definition that keeps only ker F is wrong (sourceIssue E1).
  Test TauCeti.ModularGalois.eichlerShimura_level_one [compatibility]: At level one I_q^*=1 and for r=k−2 the relation is 1−T_q X+q^{r+1}X²=(1−FX)(1−VX). For r=0 (classical weight two) it agrees with the imported R14.6 Eichler–Shimura relation.

AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform
The lambda-adic representation attached to an eigenform of weight k >= 2, and its uniqueness (theorem).
Let f be a modular form of type (k, eps) on Gamma_0(N), not identically zero, with k >= 2, an eigenvector of the T_p for p not dividing N with eigenvalues a_p. Let K be a finite extension of Q containing the a_p and the eps(p), lambda a finite place of K of residue characteristic l, and K_lambda the completion. Then there is a continuous semisimple linear representation rho_lambda: G_Q -> GL_2(K_lambda), unramified outside Nl, such that Tr(F_p, rho_lambda) = a_p and det(F_p, rho_lambda) = eps(p) p^{k-1} for p not dividing Nl. By Cebotarev (the source's Lemma 3.2) this condition determines rho_lambda uniquely up to isomorphism. Corollary 6.3: if two such data have a_p = a'_p on a set of primes of density 1, then k = k', eps = eps' and a_p = a'_p for all p not dividing NN'. The image of G_Q is a compact subgroup of GL_2(K_lambda), hence an l-adic Lie group and NOT finite.
Hypotheses: k >= 2 is required in Theorem 6.1; the weight-one case is obtained only after Theorem 4.1 is proved, and the source says so explicitly in Remarque 6.5 the Frobenius normalization is Artin's: 'F_p' is the Frobenius substitution, whose inverse is the geometric Frobenius; this is stated in a footnote and is the convention under which det(F_p) = eps(p) p^{k-1} K must contain both the a_p and the values eps(p); the representation is over K_lambda, not over a residue field semisimplicity is part of the statement; uniqueness is only up to isomorphism and only for the semisimple representation Deligne-Serre use Theoreme 6.1 as an admitted input: their introduction says it was proved by Deligne without a complete published proof, depending on the then-unpublished SGA 5, and asks the reader to admit it In this packet ρ_λ is constructed as the dual of the λ-adic realisation of the premotive M_g of Diamond–Flach–Guo (AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation), which supplies the proof that Deligne–Serre ask the reader to admit; the Frobenius normalisation (arithmetic F_p) agrees with the roadmap convention.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/geometric-construction-and-the-eichler-congruence-relation, AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, ArithmeticGaloisRepresentations:R01.1, AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent, tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus, tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor.

AutomorphicGaloisRepresentations:R19.1/deligne-serre-condition-c
The condition C(η, M) on a subgroup of GL₂(F_ℓ), and semisimple subgroups (Deligne–Serre 7.1) (definition).
Let ℓ be a prime, η a real number and M ≥ 0. A subgroup G of GL₂(F_ℓ) satisfies C(η, M) if there is a subset H ⊆ G with |H| ≥ (1 − η)|G| such that the set of polynomials det(1 − hT), h ∈ H, has at most M elements. G is semisimple if the identity representation G → GL₂(F_ℓ) is semisimple: every G-stable line in F_ℓ² has a G-stable complement.
Hypotheses: M bounds the number of distinct polynomials det(1 − hT), not the size of H. For invertible h, det(1 − hT) and the characteristic polynomial of h determine each other, so either may be used. η is arbitrary in the definition. Proposition 7.2 needs η < 1/2, and C(η, M) holds trivially (H = ∅) when η ≥ 1. Semisimplicity is a condition on the subgroup, not on its abstract isomorphism class. When ℓ divides |G|, Maschke's theorem does not apply, and a subgroup containing a nontrivial unipotent element is semisimple only if it contains SL₂(F_ℓ).
Required imported carriers/interfaces: mathlib:Matrix.card_GL_field.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.ConditionC [data]: ConditionC ℓ G η M : Prop, for G : Subgroup (GL (Fin 2) (ZMod ℓ)), η : ℝ and M : ℕ.
  TauCeti.ModularGalois.IsSemisimpleSubgroup [data]: Every G-stable submodule of F_ℓ² has a G-stable complement.
  TauCeti.ModularGalois.ConditionC.mono [relation]: C(η, M) implies C(η′, M′) whenever η ≤ η′ and M ≤ M′.
  TauCeti.ModularGalois.ConditionC.of_index_two [compatibility]: If G′ ≤ G has index 2 and G satisfies C(η, M), then G′ satisfies C(2η, M): H ∩ G′ has at least (1 − η)|G| − |G|/2 = (1 − 2η)|G′| elements (Deligne–Serre 7.2, case (c)).
  TauCeti.ModularGalois.card_charpoly_fibre [characterisation]: For a monic quadratic Q=X²−tX+d over F_ℓ with d≠0, the number of elements of GL₂(F_ℓ) of characteristic polynomial Q is ℓ²+ℓ, ℓ² or ℓ²−ℓ according as Q has 2, 1 or 0 distinct roots in F_ℓ. No assertion is made for other polynomials or d=0.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.conditionC_top [computation]: GL₂(F_ℓ) satisfies C(0, ℓ(ℓ − 1)) and not C(0, M) for M < ℓ(ℓ − 1): its elements have exactly the ℓ(ℓ − 1) characteristic polynomials T² − tT + d with d ≠ 0.
  Test TauCeti.ModularGalois.not_conditionC_zero [degenerate]: For η < 1 no subgroup satisfies C(η, 0): H would have no polynomials, so H = ∅ and 0 ≥ (1 − η)|G| > 0.
  Test TauCeti.ModularGalois.not_conditionC_cyclic_five [non-example]: The subgroup of GL₂(F₅) generated by diag(2, 1) has order 4 and four characteristic polynomials (T − 2ⁱ)(T − 1), so it fails C(0, 3); it satisfies C(1/4, 3).
  Test TauCeti.ModularGalois.conditionC_split_cartan_three [non-example]: The split Cartan subgroup of GL₂(F₃), also of order 4, satisfies C(0, 3): diag(1, 2) and diag(2, 1) share a characteristic polynomial. A definition that counted elements instead of polynomials would treat it like the cyclic group of order 4 above.
  Test TauCeti.ModularGalois.card_charpoly_fibre_three [compatibility]: For ℓ = 3 the fibres have sizes 12, 9 and 6, over 1, 2 and 3 polynomials, and 1·12 + 2·9 + 3·6 = 48 = |GL₂(F₃)| agrees with Mathlib's Matrix.card_GL_field.

AutomorphicGaloisRepresentations:R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform
The mod-λ representation attached to a mod-λ eigenform of weight k ≥ 1 (Deligne–Serre Théorème 6.7) (theorem).
Let K ⊂ ℂ be a number field, λ a finite place of K with valuation ring O_λ, maximal ideal m_λ and residue field k_λ of characteristic ℓ. Let f be a modular form of type (k, ε) on Γ₀(N), k ≥ 1, with coefficients in K, λ-integral (q-expansion in O_λ[[q]]), f ≢ 0 mod λ, and an eigenvector of T_p mod λ for every p ∤ Nℓ, with eigenvalue a_p ∈ k_λ: T_p f − a_p f ≡ 0 mod λ (6.6.1). Let k_f ⊂ k_λ be the subfield generated by the a_p and the reductions of the ε(p). Then there is a semisimple representation ρ: G_ℚ → GL₂(k_f), unramified outside Nℓ, with Tr ρ(F_p) = a_p and det ρ(F_p) ≡ ε(p)p^{k−1} mod λ for every p ∤ Nℓ (6.7.1), where F_p is the arithmetic Frobenius (Artin's convention, as in the rest of the source).
Hypotheses: k ≥ 1: weight one is the case that Théorème 4.1 needs, and it is reduced to weight ≥ 2 (6.9); the characteristic-zero input Théorème 6.1 exists only for k ≥ 2. The eigenvector condition is modulo λ and only for p ∤ Nℓ; f need not be an eigenform in characteristic 0, and 6.10 replaces it by one with the same eigenvalues mod λ. k_f is generated by the a_p and the reductions of the ε(p); the representation is realised over k_f, not only over k_λ (Lemme 6.13). The source does not state uniqueness. The representation is determined up to isomorphism by (6.7.1): its image is finite, every element of it is a Frobenius (Čebotarev), and a semisimple representation over a finite field is determined by its characteristic polynomials (Brauer–Nesbitt; ArithmeticGaloisRepresentations R01.5). Théorème 6.1, which the source takes on trust from Deligne, is here the node lambda-adic-representation-of-a-weight-k-eigenform, built from the Diamond–Flach–Guo premotive.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform, AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform, AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma, ArithmeticGaloisRepresentations:R01.1, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev, AlgebraicModularFormsAndSerreWeights:R15.5.

AutomorphicGaloisRepresentations:R19.1/rankin-bound-for-a-cuspidal-eigenform
Rankin's bound for the prime sum Σ|a_p|²p^{−s} of a cuspidal eigenform (Deligne–Serre Proposition 5.1) (theorem).
Let f be a nonzero cusp form of type (k, ε) on Γ₀(N) that is an eigenvector of the T_p, p ∤ N, with eigenvalues a_p. Then Σ_{p∤N} |a_p|² p^{−s} converges for real s > k, and Σ_{p∤N} |a_p|² p^{−s} ≤ log(1/(s − k)) + O(1) as s → k⁺ (5.1.1).
Hypotheses: Cuspidality is essential. For the weight-one Eisenstein series with a_p = 1 + ε(p), ε an odd quadratic character, the sum is 2 log(1/(s − 1)) + O(1). Section 8.7 uses exactly this contrast. The weight k ≥ 1 is arbitrary. Only the inequality is proved; the equality (5.3.1) needs the Petersson conjecture (Remarque 5.3) and is not used. The sum runs over primes p ∤ N only, and the statement is for real s → k⁺.
Required imported carriers/interfaces: AutomorphicLFunctionsAndLocalFactors:AL.3, tauceti:TauCeti.LSeries.landau, tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor.

AutomorphicGaloisRepresentations:R19.1/weight-one-eigenvalues-outside-a-sparse-set
In weight one the eigenvalues a_p lie in a finite set outside a set of small upper density (Deligne–Serre Proposition 5.5) (theorem).
Keep the hypotheses of the Rankin bound and assume k = 1. For every η > 0 there are a set X_η of primes with dens.sup X_η ≤ η and a finite set Y_η ⊂ ℂ such that a_p ∈ Y_η for every p ∉ X_η, p ∤ N. Here dens.sup X = limsup_{s→1⁺} Σ_{p∈X} p^{−s} / log(1/(s − 1)) is the upper Dirichlet density (5.4.1).
Hypotheses: k = 1 is used twice. The Galois conjugates σ(a_p) are again weight-one eigenvalues (2.7), and the Rankin bound at s → 1 matches the normalisation of the Dirichlet density. The density is the analytic (Dirichlet) upper density. Using (5.3.2) instead would give natural density (Remarque 5.6); that is not needed here. The proposition is provisional (Remarque 5.6): once Théorème 4.1 is proved, the set of a_p is finite. Here it is used only in Lemma 8.3. Y_η depends on η. The a_p are algebraic integers of one number field K (2.7).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/rankin-bound-for-a-cuspidal-eigenform, mathlib:NumberField.Embeddings.finite_of_norm_le, tauceti:TauCetiRoadmap/Chebotarev#layer-3-prime-sums-and-density-normalization, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields, tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality.

AutomorphicGaloisRepresentations:R19.1/bounded-semisimple-subgroups-of-gl2
Semisimple subgroups of GL₂(F_ℓ) satisfying C(η, M) have bounded order (Deligne–Serre Proposition 7.2) (theorem).
Let η < 1/2 and M ≥ 0. There is a constant A = A(η, M) such that |G| ≤ A for every prime ℓ and every semisimple subgroup G of GL₂(F_ℓ) satisfying C(η, M).
Hypotheses: η < 1/2 is needed in case (c), where passing to the index-2 subgroup doubles η. Semisimplicity excludes the Borel case. A subgroup of order divisible by ℓ that does not contain SL₂(F_ℓ) lies in a Borel subgroup; if it is semisimple, it is diagonalisable, so its order is prime to ℓ, a contradiction. A does not depend on ℓ. Case (a) is handled by bounding ℓ itself. The classification used is Dickson's, in the form of Serre, Propriétés galoisiennes (1972), §2, Propositions 15–16. In case (d) the projective image is A₄, S₄ or A₅.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/deligne-serre-condition-c, ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement, ArithmeticGaloisRepresentations:R01.4, mathlib:Matrix.card_GL_field.

AutomorphicGaloisRepresentations:R19.1/uniformly-bounded-residual-images-in-weight-one
The residual images of a weight-one cusp form are uniformly bounded (Deligne–Serre 8.2–8.4) (theorem).
Let f be a cusp form of type (1, ε) on Γ₀(N) that is an eigenvector of the T_p, p ∤ N, with eigenvalues a_p. Let K be a number field, Galois over ℚ, whose ring of integers contains the a_p and the ε(p), and L the set of primes that split completely in K. For ℓ ∈ L choose a place λ_ℓ | ℓ, with residue field F_ℓ, and let ρ_ℓ: G_ℚ → GL₂(F_ℓ) be the semisimple representation of Théorème 6.7: it is unramified outside Nℓ and det(1 − ρ_ℓ(F_p)T) ≡ 1 − a_pT + ε(p)T² mod λ_ℓ for p ∤ Nℓ. Let G_ℓ be its image. Lemma 8.3: for every η > 0 there is an M such that G_ℓ satisfies C(η, M) for every ℓ ∈ L. Lemma 8.4: there is an A such that |G_ℓ| ≤ A for every ℓ ∈ L.
Hypotheses: k_f ⊆ F_ℓ because ℓ splits completely in K, so ρ_ℓ takes values in GL₂(F_ℓ) and Proposition 7.2 applies. L is infinite: the primes splitting completely in K have Dirichlet density 1/[K : ℚ] (Čebotarev). The Frobenius set H_ℓ omits the p ∈ X_η and the p | Nℓ. Only the upper density of X_η is controlled, and Čebotarev in Dirichlet density turns this into a proportion of G_ℓ. M does not depend on ℓ. It is the number of polynomials 1 − a_pT + ε(p)T², p ∉ X_η, counted before reduction.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform, AutomorphicGaloisRepresentations:R19.1/weight-one-eigenvalues-outside-a-sparse-set, AutomorphicGaloisRepresentations:R19.1/deligne-serre-condition-c, AutomorphicGaloisRepresentations:R19.1/bounded-semisimple-subgroups-of-gl2, tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev, tauceti:TauCetiRoadmap/Chebotarev#layer-3-prime-sums-and-density-normalization.

AutomorphicGaloisRepresentations:R19.1/lifting-representations-of-groups-of-order-prime-to-l
A representation of a finite group of order prime to ℓ lifts from the residue field to a complete DVR (theorem).
Let O be a complete discrete valuation ring with uniformiser π and finite residue field k of characteristic ℓ, and Γ a finite group with ℓ ∤ |Γ|. Every representation ρ̄: Γ → GL_n(k) is the reduction of a representation ρ: Γ → GL_n(O). If ρ̄ is injective, so is ρ.
Hypotheses: ℓ ∤ |Γ| is essential. For ℓ ≥ 5 the subgroup of GL₂(F_ℓ) generated by [[1, 1], [0, 1]] has order ℓ and no lift to GL₂(ℤ_ℓ): an element of order ℓ there would have a primitive ℓ-th root of unity as an eigenvalue, of degree ℓ − 1 > 2 over ℚ_ℓ. Deligne–Serre 8.6 call this 'un argument standard'. The proof by Schur–Zassenhaus and an inverse limit is supplied here. The lift is unique up to conjugation by ker(GL_n(O) → GL_n(k)), by the conjugacy half of Schur–Zassenhaus. This is not needed. For the stated finite-level Schur–Zassenhaus proof, the complete DVR has finite residue field; this is the case O_λ used by Deligne–Serre. No arbitrary-residue-field proof is inferred from a finite-group complement theorem.
Required imported carriers/interfaces: mathlib:Subgroup.exists_right_complement'_of_coprime, mathlib:nonempty_sections_of_finite_inverse_system, ArithmeticGaloisRepresentations:R01.1.

AutomorphicGaloisRepresentations:R19.1/weight-one-characteristic-zero-lift
The characteristic-zero lift of the bounded residual images and its Frobenius polynomials (Deligne–Serre 8.5–8.6) (theorem).
In the setting of the uniformly-bounded node, take A as in Lemma 8.4. Enlarge K, keeping it Galois, so that it contains the n-th roots of unity for every n ≤ A. Let Y be the finite set of polynomials (1 − αT)(1 − βT), where α and β are roots of unity of order ≤ A. Then (8.5) 1 − a_pT + ε(p)T² ∈ Y for every p ∤ N, and (8.6) there is a representation ρ: G_ℚ → GL₂(ℂ) with finite image, unramified outside N, with det(1 − ρ(F_p)T) = 1 − a_pT + ε(p)T² for every p ∤ N.
Hypotheses: Let L′ = {ℓ ∈ L : ℓ > A, and R ≢ S mod λ_ℓ for all R ≠ S in Y}. It differs from L by a finite set, so it is infinite. The lift is built at one ℓ ∈ L′ and shown to be independent of ℓ by comparing two primes of L′. Enlarging K shrinks L but keeps it infinite, and the compositum with a cyclotomic field is still Galois. The representation is first built over the completion O_λ at λ_ℓ. It becomes complex because its image is finite: a representation of a finite group in characteristic 0 is realisable over ℚ̄, which embeds in ℂ over K. Its isomorphism class does not depend on ℓ, by Lemme 3.2.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/uniformly-bounded-residual-images-in-weight-one, AutomorphicGaloisRepresentations:R19.1/lifting-representations-of-groups-of-order-prime-to-l, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev.

AutomorphicGaloisRepresentations:R19.1/weight-one-cuspidal-irreducibility
The weight-one representation of a cusp form is irreducible (Deligne–Serre 8.7) (theorem).
Let f be a cusp form of type (1, ε) on Γ₀(N), with ε(−1) = −1, that is an eigenvector of the T_p, p ∤ N. Then the representation ρ of the characteristic-zero lift node is irreducible.
Hypotheses: Cuspidality enters only through Proposition 5.1. The oddness ε(−1) = −1 is used to exclude χ₁ = χ₂. The converse, that an Eisenstein series gives a reducible ρ, is 8.1 and is recorded in the node weight-one-artin-representation.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/rankin-bound-for-a-cuspidal-eigenform, AutomorphicGaloisRepresentations:R19.1/weight-one-characteristic-zero-lift, mathlib:DirichletCharacter.LFunction_apply_one_ne_zero, mathlib:riemannZeta_residue_one, tauceti:TauCetiRoadmap/Chebotarev#layer-3-prime-sums-and-density-normalization, tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products.

AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation
The weight-one Artin representation of Deligne-Serre and its properties (theorem).
Let N >= 1, eps a Dirichlet character mod N with eps(-1) = -1, and f a modular form of type (1, eps) on Gamma_0(N), not identically zero, an eigenvector of the T_p for p not dividing N with eigenvalues a_p. Then there is a linear representation rho: G_Q -> GL_2(C), unramified outside N, with Tr(F_p, rho) = a_p and det(F_p, rho) = eps(p) for all p not dividing N. This representation is irreducible if and only if f is cuspidal. It is unique up to isomorphism (Lemme 3.2). Consequences: det(rho) = eps under class field theory (Remarque 4.4); det(rho(c)) = -1 and rho(c) is conjugate to diag(1,-1) (Remarque 4.5); and the eigenvalues a_p are sums of two roots of unity, so |a_p| <= 2 (Corollaire 4.2), i.e. the Ramanujan-Petersson conjecture in weight 1.
Hypotheses: eps(-1) = -1 is a hypothesis of the theorem, not a conclusion; it is what makes the representation odd the representation is complex, with FINITE image (in contrast with the l-adic case of weight k >= 2, where the image is an l-adic Lie group) the conclusion is stated at primes p not dividing N; behaviour at ramified primes is not asserted here the proof (section 8) uses Théorème 6.7, hence Théorème 6.1, the Rankin bound of section 5 and Proposition 7.2; section 8 is planned step by step in the nodes it lists as prerequisites Reduction to the two cases: the projections of M₁(N, ε) onto the cusp forms and the Eisenstein series commute with the T_p, so the nonzero component of an eigenform is an eigenform with the same a_p, and f may be taken Eisenstein or cuspidal (section 8, opening line)
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform, AlgebraicModularFormsAndSerreWeights:R15.5, AutomorphicGaloisRepresentations:R19.1/weight-one-characteristic-zero-lift, AutomorphicGaloisRepresentations:R19.1/weight-one-cuspidal-irreducibility, tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent.

AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive
The parabolic realisation of weight-k modular forms of level N and character ψ (construction).
For integers k ≥ 2 and N ≥ 1, a character ψ of conductor dividing N with values in a number field K, and M ≥ 3 with N | M and S_M = S_N (for instance M = 4N), let M(N, ψ)_{M,!} be the premotivic structure over K of Diamond–Flach–Guo: the parabolic part (image of compactly supported in ordinary cohomology) of the cohomology of the level-M modular curve with coefficients in Sym^{k−2} of the relative H^1 of the universal elliptic curve, cut down to level Γ_0(N) and character ψ. It consists of Betti, de Rham (with Hodge filtration) and λ-adic realisations for every finite λ, Betti/λ-adic comparisons for every λ, and crystalline/integral comparisons only for λ outside S_N = {ℓ | Nk!}, and: (a) C ⊗_K Fil^{k−1} M(N, ψ)_{M,!,dR} ≅ S_k(N, ψ)^{I_K} (the cusp forms, via the q-expansion principle, formula (28)); (b) a perfect pairing M(N, ψ)_{M,!} ⊗ M(N, ψ̄)_{M,!} → K(1 − k) respecting all realisations (Theorem 2.4(b) and §4.4); (c) an action of the Hecke algebra T generated by the T_p and S_p on M(N, ψ)_{M,!} as an object of PM_K^{S} (Proposition 5.6), where T_p acts as the double coset [U (p 0; 0 1) U] twisted by ψ(p_p)^{−1} (Lemma 5.1).
Hypotheses: The coefficient-sheaf construction with Faltings' comparison is Diamond–Flach–Guo §§2–4; the equivalent Kuga–Sato realisation (Scholl) belongs to GeneralizedHeegnerCycles GH.0 (request) and is not read here. Betti and de Rham realisations of parabolic cohomology with coefficients are ModularCurvesPartII R14.3 (request).
Required imported carriers/interfaces: ModularCurvesPartII:R14.3, GeneralizedHeegnerCycles:GH.0, mathlib:ModularForm, mathlib:CuspForm.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.ParabolicPremotive [structure]: M(N, ψ)_! with Betti realisation M_B (with complex conjugation), de Rham realisation M_dR with Hodge filtration Fil^•, λ-adic realisations M_λ (every finite λ; crystalline comparison only for λ ∉ S_N) and the comparison isomorphisms I_∞, I_λ.
  TauCeti.ModularGalois.ParabolicPremotive.filTopEquivCuspForms [equivalence]: C ⊗_K Fil^{k−1} M_{!,dR} ≃ S_k(N, ψ)^{I_K}, compatible with q-expansions (Lemma 4.12).
  TauCeti.ModularGalois.ParabolicPremotive.pairing [data]: The perfect pairing M(N, ψ)_! ⊗ M(N, ψ̄)_! → K(1 − k) in PM_K^S.
  TauCeti.ModularGalois.ParabolicPremotive.heckeAction [instance]: Module structure over the Hecke algebra T, compatible with every realisation and comparison; T_p ↔ [U(p 0; 0 1)U]ψ(p_p)^{−1}.
  TauCeti.ModularGalois.ParabolicPremotive.levelChange [functoriality]: Independence of the auxiliary level M (N | M, S_M = S_N) up to canonical isomorphism (§3.6).
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.ParabolicPremotive.weight_two_trivial_character [degenerate]: For k = 2 and ψ = 1 the λ-adic realisation is H^1_et(X_0(N)_{Q̄}, K_λ).
  Test TauCeti.ModularGalois.ParabolicPremotive.dim_dR [computation]: dim_K M_{!,dR} = 2 dim S_k(N, ψ); for N = 11, k = 2, ψ = 1 it is 2.
  Test TauCeti.ModularGalois.ParabolicPremotive.fil_compat_mathlib [compatibility]: The isomorphism with S_k(N, ψ) lands in Mathlib's CuspForm space for Γ_1(N) with character ψ (level and weight agree).
  Test TauCeti.ModularGalois.ParabolicPremotive.no_eisenstein [non-example]: An Eisenstein series of weight k lies in Fil^{k−1} M_dR but not in Fil^{k−1} M_{!,dR}: the parabolic part excludes the boundary.

AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation
The rank-two realisation of a newform and its Galois representation (theorem).
Let g be a normalised newform of weight k ≥ 2, level N and character ψ, K its coefficient field, I_g the kernel of T → K, T ↦ a_1(T g), and M_g ⊂ M(N, ψ)_! the intersection of the kernels of I_g (AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive). Then (Diamond–Flach–Guo Lemma 5.7) M_g is a premotivic structure of rank 2 over K with Fil^{k−1} M_{g,dR} = Kg, and the pairing restricts to a perfect alternating pairing ∧²_K M_g ≅ M_ψ(1 − k). For every finite λ let M_{g,λ} denote the geometric λ-adic projector factor supplied by Scholl Theorem 1.2.4; when λ ∉ S_N this is the component of the S-integral premotivic structure. Define ρ_{g,λ} := M_{g,λ}^∨ (the K_λ-dual). Exclusion from S_N concerns integral/crystalline comparison, not the existence of the characteristic-zero λ-adic factor. Then ρ_{g,λ} is continuous, absolutely irreducible, unramified outside Nℓ, the arithmetic Frobenius at p ∤ Nℓ has characteristic polynomial X² − a_p X + ψ(p)p^{k−1} (the roadmap convention), det ρ_{g,λ} = ψ·χ_ℓ^{k−1} (ψ as a Galois character through arithmetic Frobenius), ρ_{g,λ}(c) is conjugate to diag(1, −1), and ρ_{g,λ} is the λ-adic representation of AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform. The cohomological realisation M_{g,λ} itself has these polynomials for the geometric Frobenius.
Hypotheses: λ outside S_N = {ℓ | Nk!} for the integral structure of Diamond–Flach–Guo; the rational statements hold for all λ after enlarging S. Diamond–Flach–Guo's Hecke normalisation and ψ-conventions are those of their arXiv version (Lemma 5.1); their published 2004 text writes the Frobenius polynomial as X² − ψ(p)^{−1}a_pX + ψ(p)^{−1}p^{k−1} for a differently normalised T_p.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive, AutomorphicGaloisRepresentations:R19.1/geometric-construction-and-the-eichler-congruence-relation, ArithmeticGaloisRepresentations:R01.1, ArithmeticGaloisRepresentations:R01.6, AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent.

AutomorphicGaloisRepresentations:R19.1/integral-structure-of-the-newform-premotive
The S-integral structure of the premotive of a newform: lattices in every realisation (construction).
Let K be a number field containing the values of ψ, S a set of primes of K containing the primes above those dividing Nk! (S_N^K), and O_S = {x ∈ K : v_λ(x) ≥ 0 for λ ∉ S}. An S-integral premotivic structure over O_K (Diamond–Flach–Guo §1.2) consists of: a finitely generated O_K-module 𝓜_B with an action of G_ℝ; a finitely generated O_S-module 𝓜_dR with a finite decreasing Hodge filtration; for every finite λ a finitely generated O_λ-module 𝓜_λ with a continuous G_ℚ-action; for λ ∉ S a Fontaine–Laffaille object 𝓜_{λ-crys} of O_λ-MF⁰; and integral comparison isomorphisms I_∞ : ℂ ⊗ 𝓜_dR ≅ ℂ ⊗ 𝓜_B, I_B^λ : 𝓜_B ⊗ O_λ ≅ 𝓜_λ, I_dR^λ : 𝓜_dR ⊗ O_λ ≅ 𝓜_{λ-crys} and I^λ : V(𝓜_{λ-crys}) ≅ 𝓜_λ (λ ∉ S), with weight filtrations on the rationalisations. The parabolic structure 𝓜(N, ψ)_{M,!} of AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive is such an object, with K ⊗ 𝓜(N, ψ)_{M,!} = M(N, ψ)_{M,!}. Its top Hodge step Fil^{k−1}𝓜(N, ψ)_{M,!,dR} is the O_S-module of cusp forms in S_k(N, ψ) with q-expansion in O_S[[q]], and the pairing f ↦ (T ↦ a₁(Tf)) identifies it with Hom_{O_S}(𝕋, O_S), where 𝕋 is the O_S-algebra generated by the Hecke operators acting on it; 𝕋 acts on 𝓜(N, ψ)_{M,!} by endomorphisms of S-integral premotivic structures. For a normalised newform g with coefficients in K and I_g = ker(𝕋 → K, T ↦ a₁(Tg)), put 𝓜_g := 𝓜(N, ψ)_{M,!}[I_g], the common kernel of I_g in every realisation. Then 𝓜_g is an S-integral premotivic structure with K ⊗ 𝓜_g = M_g; for λ ∉ S, 𝓜_{g,λ} is a G_ℚ-stable O_λ-lattice in the rank-two M_{g,λ}, whose restriction to G_{ℚ_ℓ} is V(𝓜_{g,λ-crys}) for the Fontaine–Laffaille module 𝓜_{g,λ-crys} ≅ 𝓜_{g,dR} ⊗ O_λ; and Fil^{k−1}𝓜_{g,dR} = O_S·g.
Hypotheses: S contains the primes dividing Nk!: Faltings' integral comparison needs a Fontaine–Laffaille category MF^∇_{[0,a]} with a = k − 1 ≤ ℓ − 2, and good reduction at ℓ ∤ N; the source prints this set as "{ℓ ∤ Nk!}" in Theorem 2.4 and on p. 30, and as "the set of primes dividing Nk!" on pp. 13 and 27 (source issue AutomorphicGaloisRepresentations/E3) For λ∉S, the source uses torsion-freeness and Fontaine–Laffaille comparison. For λ∈S it still supplies a finitely generated λ-adic module; its image in the rational rank-two factor (equivalently its quotient by torsion) is a stable full lattice. This does not assert that the original integral module is torsion-free or that a crystalline comparison exists there. only the rational statement of rank two is proved in the source (Lemma 5.7, from Diamond–Im Proposition 12.4.14); integral freeness of 𝓜_{g,?} over O is not claimed
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive, AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, ModularCurvesPartII:R14.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.IntegralPremotive [structure]: An S-integral premotivic structure over O_K: finitely generated integral modules 𝓜_B, 𝓜_dR (over O_S, filtered), 𝓜_λ, the Fontaine–Laffaille objects 𝓜_{λ-crys} (λ ∉ S) and integral comparison isomorphisms.
  TauCeti.ModularGalois.IntegralPremotive.kernel [constructor]: 𝓜[I] for an O_K-submodule I of End 𝓜, the common kernel of generators of I.
  TauCeti.ModularGalois.integralParabolic [constructor]: 𝓜(N, ψ)_{M,!} as an S-integral premotivic structure for S ⊇ S_N^K, with K ⊗ 𝓜(N, ψ)_{M,!} = M(N, ψ)_{M,!}.
  TauCeti.ModularGalois.integralParabolic_filTop [characterisation]: Fil^{k−1}𝓜(N, ψ)_{M,!,dR} = the cusp forms with q-expansion in O_S[[q]].
  TauCeti.ModularGalois.integralParabolic_heckeDuality [characterisation]: f ↦ (T ↦ a₁(Tf)) is an isomorphism Fil^{k−1}𝓜(N, ψ)_{M,!,dR} ≅ Hom_{O_S}(𝕋, O_S).
  TauCeti.ModularGalois.integralNewformPremotive [constructor]: 𝓜_g := 𝓜(N, ψ)_{M,!}[I_g].
  TauCeti.ModularGalois.integralNewformPremotive_rational [compatibility]: K ⊗ 𝓜_g = M_g (AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation).
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.integralNewformPremotive_level_eleven [computation]: For 11a1 (N = 11, k = 2, ψ = 1, S = {2, 11}): Fil¹𝓜_{g,dR} = ℤ[1/22]·f.
  Test TauCeti.ModularGalois.integralParabolic_bad_set [non-example]: For k=2 the prime 2 lies in S: the chosen Fontaine–Laffaille comparison requires k−1≤ℓ−2 and does not apply at 2. This says nothing against a separate crystalline realisation at a good prime 2.
  Test TauCeti.ModularGalois.integralNewformPremotive_rational_test [compatibility]: K ⊗ 𝓜_g recovers the rank-two M_g with Fil^{k−1} = Kg.
  Test TauCeti.ModularGalois.integralParabolic_filTop_scalar [degenerate]: If c ∈ K and cg has q-expansion in O_S[[q]] then c ∈ O_S, since a₁(g) = 1.

AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A
Carayol’s geometric Hilbert modular representation (theorem).
Let F be a totally real number field of degree d, and let k_1, ..., k_d (all >= 2) and w be integers of the same parity. Let pi = tensor pi_v be a cuspidal automorphic representation of GL_2(A_F) whose archimedean components are pi_{tau_i} = D_{k_i, w}, the essentially square-integrable representation of GL_2(R) occurring in the unitary induction Ind(mu, nu) with mu(t) = |t|^{(k-1-w)/2} sgn(t)^k and nu(t) = |t|^{(-k+1-w)/2}, whose central character is mu nu: t -> t^{-w} (0.2, checked on the page image). Assume moreover - a standing hypothesis of the whole paper, stated in 0.3 and retained in Theorem (A) ('Soit pi comme en (0.3)') - that when d is EVEN there is at least one finite place v of F at which pi_v is essentially square-integrable (special or cuspidal). Then there is a finite extension E of Q(pi) and a STRICTLY compatible system {sigma_lambda} of continuous two-dimensional E_lambda-adic representations of Gal(Fbar/F) such that for every finite place p of F and every finite place lambda of E of residue characteristic different from that of p, the restriction of sigma_lambda to the local Weil group W_p is equivalent to sigma_lambda(pi_p). The new content is the determination at EVERY finite place p; existence with the property for almost every p was already known. The source adds (Remarque after Theorem (A)) that sigma_lambda can be shown to be irreducible (K. Ribet, unpublished), so that by Cebotarev it is characterized by the stated property.
Hypotheses: all the weights k_i must be >= 2 and k_1, ..., k_d, w of the same parity - this is the cohomological condition the parity hypothesis 'd even implies there exists a finite place v with pi_v essentially square-integrable' is a standing hypothesis (0.3) of Theorem (A) itself; base change is used to pass from Theorem (B), which fixes such a v and excludes p = v and the extraordinary cuspidal places, to the conclusion at every finite place - it does NOT remove the parity hypothesis lambda must have residue characteristic different from that of p; the case of equal characteristic is Saito's theorem, a separate node sigma_lambda(pi_p) is formed with the HECKE correspondence, not the Langlands correspondence This geometric theorem retains the finite discrete-series-place hypothesis when [F:Q] is even. The all-cohomological-Hilbert theorem is a separate node using Taylor congruences; Carayol alone is not the general existence theorem.
Required imported carriers/interfaces: HilbertModularVarietiesAndShimuraCurves:R18.4, HilbertModularVarietiesAndShimuraCurves:R18.2, AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, AutomorphicGaloisRepresentations:R19.2/carayol-theorem-b, AutomorphicGaloisRepresentations:R19.2/carayol-primitive-restriction-lemma, AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary, AutomorphicGaloisRepresentations:R19.2/carayol-twisting-and-determinant, GL2AutomorphicRepresentationsAndTransfer:R17.4.

AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction
Carayol's construction of σ_λ(π) from the cohomology of Shimura curves (§2) (construction).
Let B/F be the quaternion algebra split at τ₁, ramified at τ₂, …, τ_d, and split at every finite place except v when d is even; G = Res_{F/ℚ}(B^×). Let M_K (K ⊂ G(𝔸^f) compact open, small) be its Shimura curves over F, and E ⊂ ℂ a finite Galois extension of ℚ containing F and splitting B. Let ξ = ⊗_{i∈[1,d]} [(τ_i ∘ ν)^{(w−k_i+2)/2} · Sym^{k_i−2}(ξ_i)] be the algebraic representation of G on W = ⊗_E W_i, where ν is the reduced norm and ξ_i : B^× → GL₂(E) comes from B ⊗_{F,τ_i} E ≅ M₂(E). A central z ∈ Z(ℚ) = F^× acts on W by N_{F/ℚ}(z)^w. Let F_λ be the λ-adic sheaf on M_K defined by ξ (2.1.3–2.1.4). Let C be the set of automorphic representations π of G(𝔸) with π_{τ₁} ≅ D_{k₁,w} and π_{τ_i} ≅ D^H_{k_i,w} (i ≥ 2). For π ∈ C, K small enough that π_f^K ≠ 0, and E ⊇ ℚ(π), define σ_λ(π) = Hom_{H(G(𝔸^f),K)}(π_f^K, H¹(M_K ⊗_F F̄, F_λ)). Then σ_λ(π) is a two-dimensional E_λ-representation of Gal(F̄/F), independent of K. The limit H¹ = lim_K H¹(M_K ⊗ F̄, F_λ) ⊗ Ē_λ decomposes as ⊕_{π∈C} π^f ⊗ σ(π) as a G(𝔸^f) × Gal(F̄/F)-representation. For F = ℚ the curves are not proper, and H¹ is replaced by parabolic (intersection) cohomology H¹_!.
Hypotheses: The Shimura curves M_K, the sheaves F_λ (2.1.2–2.1.4) and the Hecke action on H¹ are requested from HilbertModularVarietiesAndShimuraCurves R18.4. The dimension count uses Matsushima's formula and (𝔤, K_∞)-cohomology: H¹(𝔤, K_∞, π_∞ ⊗ W) is non-zero exactly for π_∞ as in C, and then has dimension 2 (Borel–Wallach), requested with R18.4. Theorem (B) for GL₂ is equivalent to Theorem (B') for G by the global Jacquet–Langlands correspondence (GL2AutomorphicRepresentationsAndTransfer R17.3).
Required imported carriers/interfaces: HilbertModularVarietiesAndShimuraCurves:R18.4, GL2AutomorphicRepresentationsAndTransfer:R17.3.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.Carayol.sigmaLambda [constructor]: σ_λ(π) = Hom_{H(G(𝔸^f),K)}(π_f^K, H¹(M_K ⊗ F̄, F_λ)) for π ∈ C.
  TauCeti.ModularGalois.Carayol.sigmaLambda_finrank [characterisation]: dim_{E_λ} σ_λ(π) = 2.
  TauCeti.ModularGalois.Carayol.sigmaLambda_level_indep [characterisation]: σ_λ(π) does not depend on K with π_f^K ≠ 0.
  TauCeti.ModularGalois.Carayol.cohomology_decomposition [relation]: lim_K H¹(M_K ⊗ F̄, F_λ) ⊗ Ē_λ ≅ ⊕_{π∈C} π^f ⊗ σ(π) as G(𝔸^f) × Gal(F̄/F)-modules.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.Carayol.sigmaLambda_finrank_two [computation]: For every π ∈ C, σ_λ(π) has dimension 2.
  Test TauCeti.ModularGalois.Carayol.coefficient_rank [computation]: dim_E W = ∏_i (k_i − 1); with all k_i = 2 it is 1.
  Test TauCeti.ModularGalois.Carayol.parabolic_needed_over_Q [non-example]: For F = ℚ, using the full H¹ of the open modular curve adds Eisenstein classes, so σ(π) must be taken in parabolic cohomology.

AutomorphicGaloisRepresentations:R19.2/carayol-twisting-and-determinant
Twisting and the determinant of σ(π) (§3 and 5.5) (lemma).
For an integer u let c_u be the set of Grössencharaktere of 𝔸_F^× whose components at τ₁, …, τ_d restrict to t ↦ t^{−u} on ℝ^{*+}. Twisting π ↦ χ·π by χ ∈ c_u is a bijection C_w → C_{w+2u}. Then: (i) σ(χ·π) = χ^{−1}·σ(π) for χ ∈ c_u and π ∈ C_w, with χ seen as a Galois character by class field theory; (ii) det σ(π) = χ_π^{−1}·ω^{−1}, where χ_π ∈ c_w is the central character of π and ω ∈ c_{−1} is the Grössencharakter whose local components ω_𝔭 are fixed in (0.4). §3 proves (ii) only up to a character of order 2, (det σ(π))² = χ_π^{−2}ω^{−2}. The exact equality is 5.6.1: 5.5 shows that α = det σ(π)·χ_π·ω, a Grössencharakter of order at most 2, is trivial.
Hypotheses: (i) uses H⁰(M_K ⊗ F̄, L^u) = ⊕_{χ∈c_u} χ ⊗ χ^{−1}, computed through the reciprocity law of the connected components (1.1.2), and F_w ⊗ L^u ≅ F_{w+2u} (3.4). (ii) uses Poincaré duality between H¹_w and H¹_{−w}(1), under which the adjoint of a Hecke operator is its image by g ↦ g^{−1}, and π_f^∨ ≅ χ_π^{−1}·π_f (3.6). For F = ℚ one uses intersection cohomology (3.7).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction, HilbertModularVarietiesAndShimuraCurves:R18.4.

AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration
The vanishing-cycle filtration of σ_𝔭(π) and the principal-series criterion (§§4–5) (lemma).
Fix a finite place 𝔭 ≠ v of F with residue characteristic p ≠ l, and levels K = K_𝔭^n × H. The vanishing-cycle exact sequence for M_{n,H} ⊗ 𝒪^{nr}_𝔭 with the sheaf F_λ (4.2–4.5) is G(𝔸^f) × W(F̄_𝔭/F_𝔭)-equivariant. It gives, for each π ∈ C, a filtration 0 → σ₁(π) → σ_𝔭(π) → σ₂(π) → 0 of the restriction σ_𝔭(π) of σ(π) to the Weil group. Here σ₁ comes from the cohomology of the special fibre and σ₂ from the vanishing cycles at the supersingular points. In σ₁ there is an exact sequence 0 → ˢσ₁(π) → σ₁(π) → σ̃₁(π) → 0, with σ̃₁ from the normalised special fibre. Then: (5.6.2) if σ̃₁(π) ≠ 0, π_𝔭 is an irreducible principal series; (5.6.3) if dim σ̃₁(π) = 2, then σ_𝔭(π) = σ̃₁(π) = σ(π_𝔭) under the Hecke correspondence; (4.6) if π_𝔭 is an unramified principal series, M_{0,H} is smooth over 𝒪_𝔭, and σ_𝔭(π) is unramified with σ_𝔭(π) = σ(π_𝔭).
Hypotheses: The integral models M_{n,H}, the Drinfeld level structures, the congruence relation 1.6.4 and the description of the supersingular orbit 1.7.5 are the results of Carayol's companion paper [Ca 3], summarised in §1 and requested from HilbertModularVarietiesAndShimuraCurves R18.2. The extension of F_λ to a lisse sheaf on M_{0,H} (4.1) uses that M_{0,H′} → M_{0,H} is étale. The residual term A (4.3–4.5) involves only characters of G(𝔸^f) through ν, so no cusp form contributes; it vanishes unless all k_i = 2.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction, AutomorphicGaloisRepresentations:R19.2/carayol-twisting-and-determinant, HilbertModularVarietiesAndShimuraCurves:R18.2, LefschetzPencilsAndVanishingCycles:LPV.0.

AutomorphicGaloisRepresentations:R19.2/carayol-special-places
Special local components: σ_𝔭(π) is the special representation (6.7 and 11.4) (theorem).
Let 𝔭 ≠ v, of residue characteristic p ≠ l, and π ∈ C with π_𝔭 ≅ χ·Sp special. Then σ_𝔭(π) is the special representation χ^{−1}·Sp(2) of the Weil–Deligne group attached to π_𝔭 by the Hecke correspondence, that is, the unique indecomposable extension 1 → χ^{−1} → χ^{−1}·Sp(2) → χ^{−1}·ω^{−1} → 1. Its parts: ˢσ₁(π) ≠ 0 if and only if π_𝔭 is special, and then ˢσ₁(π) = χ^{−1} is the one-dimensional subrepresentation (6.7); σ̃₁(π) = 0; σ₂(π) is the one-dimensional quotient (Remark after 6.7, using det σ_𝔭 from 5.6.1); the extension does not split (11.4).
Hypotheses: 6.4–6.6: the supersingular part ˢH̃₁ ⊗ ℂ is ⊕ π̃^{f,𝔭} ⊗ (π̃_𝔭·Sp) ⊗ π̃_𝔭^{−1} over automorphic π̃ of the definite group Ḡ (B changed at 𝔭 and τ₁) with one-dimensional component at 𝔭. The global Jacquet–Langlands correspondence matches those π̃ that are not characters with the π ∈ C with π_𝔭 special (GL2AutomorphicRepresentationsAndTransfer R17.3). Non-splitting uses the semistable reduction theorem (4.8) and Picard–Lefschetz for a stable curve: the monodromy logarithm N maps H¹(X_η̄, F)(1) onto ker(H¹(X̃_s, F) → H¹(X_s, F)) (11.4, proved in 11.5–11.10). For F = ℚ this is Langlands [L.1]. Requested from LefschetzPencilsAndVanishingCycles LPV.7.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration, AutomorphicGaloisRepresentations:R19.2/carayol-twisting-and-determinant, GL2AutomorphicRepresentationsAndTransfer:R17.3, LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves.

AutomorphicGaloisRepresentations:R19.2/carayol-local-fundamental-representation
The vanishing part σ₂(π) depends only on π_𝔭 (§10) (theorem).
Let 𝔭 ≠ v, of residue characteristic p ≠ l, and π ∈ C. Then σ₂(π) ≠ 0 if and only if π_𝔭 is essentially square-integrable (special or cuspidal). In that case σ₂(π) is computed locally. Let 𝒰 be the local fundamental representation of W(F̄_𝔭/F_𝔭) × GL₂(F_𝔭) × B̄_𝔭^× on the vanishing cycles at the supersingular points (10.3). Then π_𝔭 ⊗ σ₂(π)_ℂ ≅ 𝒰_ℂ(π̄_𝔭^∨), the isotypic component of 𝒰_ℂ for the contragredient of the representation π̄_𝔭 of B̄_𝔭^× attached to π_𝔭 by Jacquet–Langlands (10.5–10.6). In particular σ₂(π) depends only on π_𝔭.
Hypotheses: The vanishing cycles at a supersingular point are the cohomology of the geometric generic fibre of the completed strict henselisation (Brylinski, Appendix, Theorem 1). Through Drinfeld's universal deformation of the formal 𝒪_𝔭-module of height 2 with level structure (§§7–9), they become the fibres Φ(δ) of a sheaf on the orbit Δ. §§7–9 and the Appendix are not read here; they are requested from HilbertModularVarietiesAndShimuraCurves R18.5. The comparison uses the global Jacquet–Langlands bijection between π ∈ C with π_𝔭 essentially square-integrable and the non-character automorphic representations of Ḡ (GL2AutomorphicRepresentationsAndTransfer R17.3).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration, GL2AutomorphicRepresentationsAndTransfer:R17.3, HilbertModularVarietiesAndShimuraCurves:R18.5.

AutomorphicGaloisRepresentations:R19.2/carayol-ordinary-cuspidal-places
Ordinary cuspidal local components, by a CM form with the same local component (11.2–11.3) (theorem).
Let 𝔭 ≠ v, of residue characteristic p ≠ l, and π ∈ C with π_𝔭 ordinary cuspidal, π_𝔭 ≅ 𝒲(L_𝔭, ξ_𝔭) for a quadratic extension L_𝔭/F_𝔭 and a character ξ_𝔭 of L_𝔭^×. Then σ_𝔭(π) ≅ Ind_{W_{L_𝔭}}^{W_{F_𝔭}}(ξ_𝔭^{−1}ω_𝔭^{−1/2}) = σ(π_𝔭) under the Hecke correspondence.
Hypotheses: There is a pair (L, ξ), with L/F quadratic imaginary (CM) and ξ a Grössencharakter of 𝔸_L^×, such that: (a) L ⊗_F F_𝔭 ≅ L_𝔭 and ξ has component ξ_𝔭 at 𝔭; (b) ξ_{τ_i} ≅ ζ_{k_i,w}; (c) L/F is not split at v, and ξ_v does not factor through the norm L_v^× → F_v^×. Carayol calls this standard; it is requested with automorphic induction (GL2AutomorphicRepresentationsAndTransfer R17.5). The automorphic induction π′ = 𝒲(L, ξ) satisfies the hypotheses of Theorem (B) and has π′_𝔭 ≅ π_𝔭.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/carayol-local-fundamental-representation, AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration, GL2AutomorphicRepresentationsAndTransfer:R17.5.

AutomorphicGaloisRepresentations:R19.2/carayol-theorem-b
Carayol's Theorem (B): the local components at every 𝔭 ≠ v that is not extraordinary cuspidal (theorem).
Let π be as in (0.3). When d is even, fix a finite place v where π_v is essentially square-integrable. Then the system σ_λ(π) of R19.2/carayol-sigma-lambda-construction, transferred from G by Jacquet–Langlands, satisfies σ_λ(π)|W_{F_𝔭} ≅ σ(π_𝔭) under the Hecke correspondence at every finite 𝔭 ≠ v whose residue characteristic is not that of λ and where π_𝔭 is not extraordinary cuspidal. Extraordinary cuspidal means that the corresponding Weil representation is primitive, which happens only in residue characteristic 2.
Hypotheses: Theorem (B) and Theorem (B') are equivalent by the global Jacquet–Langlands correspondence (GL2AutomorphicRepresentationsAndTransfer R17.3).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration, AutomorphicGaloisRepresentations:R19.2/carayol-special-places, AutomorphicGaloisRepresentations:R19.2/carayol-local-fundamental-representation, AutomorphicGaloisRepresentations:R19.2/carayol-ordinary-cuspidal-places, AutomorphicGaloisRepresentations:R19.2/carayol-twisting-and-determinant, GL2AutomorphicRepresentationsAndTransfer:R17.3.

AutomorphicGaloisRepresentations:R19.2/carayol-primitive-restriction-lemma
Primitive local Galois representations are determined by a cubic restriction and the determinant (12.1) (lemma).
Let σ be an irreducible two-dimensional representation of W_{F_𝔭} that is primitive (not induced), so the residue characteristic is 2. Its projective image is A₄ (tetrahedral) or S₄ (octahedral), because local Weil groups are solvable and A₅ is excluded. A 2-Sylow subgroup H of the projective image has index 3. Its inverse image in W_{F_𝔭} defines a cubic extension L/F_𝔭, Galois in the tetrahedral case and not in the octahedral case, and σ|W_L is irreducible and monomial. Lemma: if σ′ is another two-dimensional representation of W_{F_𝔭} with σ′|W_L ≅ σ|W_L and det σ′ = det σ, then σ′ ≅ σ.
Hypotheses: The finite subgroups of PGL₂(ℂ) ≅ SO(3) are cyclic, dihedral, A₄, S₄ or A₅ (12.1.1). In A₄ the 2-Sylow subgroup Z/2 × Z/2 is normal and is the unique subgroup of index 3. In S₄ there are three conjugate 2-Sylow subgroups (stabilisers of the axes Ox, Oy, Oz), and every element is conjugate into H ∪ A₄ (12.1.2).
Required imported carriers/interfaces: GL2AutomorphicRepresentationsAndTransfer:R16.3.

AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary
Base change of degree at most 3 is restriction for extraordinary cuspidal representations (12.2.2) (theorem).
Let L/F_𝔭 be an extension of p-adic fields of degree at most 3, and π an extraordinary cuspidal representation of GL₂(F_𝔭), with Weil representation σ (irreducible, primitive). Then the local base-change lift Π = π_L corresponds to the restriction Σ = σ|W_L, which is irreducible. Here the lift is Langlands' for cyclic L/F_𝔭, and that of Jacquet–Piatetski-Shapiro–Shalika for non-Galois cubic L/F_𝔭. The same holds with the Hecke correspondence in place of the Langlands correspondence.
Hypotheses: Carayol writes that he knows no reference for the general principle that the base-change lift corresponds to restriction of the Weil–Deligne representation. He says it follows from the definitions for principal series, and is checked 'sans trop de mal' for special and ordinary cuspidal π. The request to GL2AutomorphicRepresentationsAndTransfer R17.4 asks for this compatibility with proof. Tunnell's globalisation ([Tu. 1], Theorem 1.3), the Artin conjecture for tetrahedral (Langlands [L.2]) and octahedral (Tunnell [Tu. 2]) representations, and Jacquet–Langlands chapter 12 are requested from GL2AutomorphicRepresentationsAndTransfer R17.5.
Required imported carriers/interfaces: GL2AutomorphicRepresentationsAndTransfer:R17.4, GL2AutomorphicRepresentationsAndTransfer:R17.5, GL2AutomorphicRepresentationsAndTransfer:R16.3, GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change.

AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity
Purity of the eigenform compatible family (theorem).
Let F be totally real of degree g>1 and let f have multiweight (k_τ,w) with w≥k_τ≥2 and k_τ≡w mod 2. If g is even, assume f has a finite discrete-series component. For the cohomological Hilbert representation σ̌_h(π_f) of Saito’s Theorem 2 in this geometric setting, the common local WD parameter is monodromy-pure of weight w−1. For geometric Frobenius, N=0 gives eigenvalues of weight w−1; if N≠0, ker N has weight w−2 and coker N weight w. In classical weight k, the cohomological realisation has weight k−1, while its arithmetic dual has geometric-Frobenius weight 1−k; evaluation at arithmetic Frobenius restores weight k−1. All embeddings of the coefficient field satisfy the corresponding absolute values. Strictness is established by the fixed-family node, not by purity or by equality of good-prime polynomials.
Hypotheses: Saito's Theorem 2 assumes the setting of his Claim 1: p a finite place of F above p, lambda and mu places of L(f) above l different from p and above p respectively the purity statement is for the monodromy filtration, and presupposes N^2 = 0 so that the three-step filtration 0 subset Im N subset Ker N subset V is defined the case N nonzero is described by the source as easy, since the determinant is known and N induces an isomorphism Gr^W_1(V)(1) -> Gr^W_{-1}(V); the substantive case is N = 0 'pure of weight n' is defined by: the eigenvalues of a lifting F of geometric Frobenius on Gr_i^W are algebraic numbers whose conjugates have complex absolute value Np^{(n+i)/2} The generic compatible-system carrier and its weak/almost-strict/strict predicates are PotentialModularityAndCompatibleSystems R24.5 (request); the Weil–Deligne relation is normalised as F N F^{−1} = q^{−1}N for a geometric Frobenius F (PadicHodgeTheory/E50 records Saito's reversed printed sign). The degree g>1, w≥k_τ and finite discrete-series condition in even degree are part of Saito’s setting; this node does not assert general all-Hilbert purity outside that setting.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive, WeightsInEtaleCohomology:R34.6, ArithmeticGaloisRepresentations:R01.2, PotentialModularityAndCompatibleSystems:R24.5:operations, AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A, WeightsInEtaleCohomology:R34.6/arithmetic-realization-transport.

AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime
Scholl–Saito comparison for geometric eigenform realisations (theorem).
For the classical parabolic/Kuga–Sato newform realisation, and for Hilbert forms of degree g>1 and multiweight w≥k_τ≥2, k_τ≡w mod 2, satisfying Saito’s finite-discrete-series-place hypothesis when g is even, apply the imported generic proper-smooth/semistable comparison to the coefficient projector. Obtain de Rham/potentially semistable realisations, their labelled Hodge filtration and the full WD^{F-ss} comparison at the coefficient prime. In the classical good-prime case p∤N the arithmetic representation is crystalline with Hodge weights {0,k−1} in the convention HT(χ_p)=1; the cohomological dual has the opposite representation weights. Its Euler roots in the cohomological D_cris normalisation have polynomial X²−a_pX+ε(p)p^{k−1}. Weight two gives the Barsotti–Tate realisation; arbitrary k does not. This is the concrete modular comparison application owned by R19.5.
Hypotheses: Classical k≥2, or Hilbert cohomological multiweight with Saito’s geometry hypotheses. Retain the coefficient projector and its realisation functor laws; comparison is not deduced just from a desired Euler polynomial. The full all-Hilbert extensions are the separate Kisin and Skinner nodes. For the Hilbert branch retain all of Saito’s standing degree/multiweight hypotheses. The classical all-weight, all-coefficient-prime comparison requires its own precise Scholl/Saito source input; it is not inferred by treating the Hilbert paper as the classical theorem.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/scholl-projector, AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent, AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A, AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility, PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction, PadicHodgeTheory:R06.5, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, ModularCurvesPartII:R14.5/modular-quotient.

AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility
Local-global compatibility away from p, in the Hecke normalization, with its exact relation to Langlands (theorem).
For each finite place p of F, Kutzko's work attaches to pi_p a Frobenius-semisimple degree-2 representation sigma(pi_p) of the local Weil-Deligne group W'_p, characterized by L(chi . sigma-check(pi_p)) = L(chi . omega_p^{1/2} . pi_p) and eps(chi . sigma-check(pi_p)) = eps(chi . omega_p^{1/2} . pi_p) for every quasicharacter chi of F_p^*, where sigma-check denotes the contragredient. This 'Hecke' correspondence differs from the Langlands correspondence by a twist by omega_p^{1/2} followed by passage to the contragredient. For an irreducible principal series pi_p = Ind(xi_1, xi_2) (unitary induction) one has sigma(pi_p) = xi_1^{-1} omega_p^{-1/2} + xi_2^{-1} omega_p^{-1/2}. In all cases (a) det sigma(pi_p) = chi_{pi_p}^{-1} omega_p^{-1}, where chi_{pi_p} is the central character of pi_p, and (b) sigma(chi . pi_p) = chi^{-1} . sigma(pi_p). Its advantage over Langlands' correspondence is compatibility with automorphisms of the field of definition. By 0.6 there is a finite extension E of Q(pi) over which all sigma(pi_p) are realized, giving for each finite lambda of E of residue characteristic different from that of p a lambda-adic representation sigma^lambda(pi_p) of W_{F_p}; Carayol's Theorem (A) asserts that the restriction of sigma_lambda to W_{F_p} is EQUIVALENT to sigma^lambda(pi_p). Since sigma^lambda(pi_p) comes from the Weil-Deligne representation sigma(pi_p), this includes the monodromy operator and hence the special/Steinberg case, not only the semisimplified inertia action or the unramified traces.
Hypotheses: the comparison is at finite places p whose residue characteristic differs from that of lambda sigma(pi_p) is F-semisimple by construction, and Theorem (A) asserts an equivalence of lambda-adic representations of W_{F_p}, not merely an isomorphism after F-semisimplification the normalization of class field theory is fixed so that GEOMETRIC Frobenius elements correspond to uniformizers (source 0.4) the twist relating Hecke to Langlands is by omega_p^{1/2} together with contragredience (0.5); other papers use other normalizations under the same name (Saito's sigma_h, recalled from [De], appears in his Theorem 0 as sigma-check_h - see the gap on normalizations)
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A, GL2AutomorphicRepresentationsAndTransfer:R16.3, ArithmeticGaloisRepresentations:R01.2.

AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical
Conductor, Steinberg local form and bad Euler factors for classical newforms (theorem).
Let f be a newform of weight k ≥ 2, level N and character ψ, and ρ = ρ_{f,λ} with λ | ℓ. (a) The Artin conductor of ρ (away from ℓ) is the prime-to-ℓ part of N. (b) If p ≠ ℓ, p ∥ N and p does not divide the conductor of ψ, then ρ|_{G_p} ≅ (χ_uχ_ℓ ∗; 0 χ_u) for the unramified character χ_u with χ_u(Frob_p) = a_p (arithmetic), with ∗ ramified (N ≠ 0, Steinberg); if p ∥ N and p divides the conductor of ψ, ρ|_{G_p} ≅ χ_u^{−1}χ_ℓ^{k−1}ψ′|_{G_p} ⊕ χ_u. (c) For every p ≠ ℓ, the local Euler factor det(1 − Frob_p^{geom} p^{−s} | M^{I_p})⁻¹ of the cohomological realisation M = ρ^∨ equals the Euler factor of L(f, s) at p: (1 − a_pp^{−s} + ψ(p)p^{k−1−2s})⁻¹ for p ∤ N and (1 − a_pp^{−s})⁻¹ for p | N (on ρ^{I_p} itself, arithmetic Frobenius acts at a Steinberg place by a_p·p, not a_p). (d) For a rational weight-two newform (K_f = Q) with its elliptic curve E_f: L(E_f, s) = L(f, s) and the conductor of E_f is N.
Hypotheses: (a)–(c) are the F = Q case of Carayol's Theorem (A) through the Hecke-to-Langlands dictionary (AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility); Darmon–Diamond–Taylor Theorem 3.1(d)–(e) state (a)–(b) in weight two. (d) is Carayol's Corollaire (0.8), using Ogg for the conductor of E_f. Full Frobenius-semisimple Weil–Deligne data including N are compared, not only semisimplified inertia (stage text).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility, AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A, AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition, GL2AutomorphicRepresentationsAndTransfer:R16.3, ArithmeticGaloisRepresentations:R01.6, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility.

AutomorphicGaloisRepresentations:R19.6/determinants-and-representability-over-a-hecke-algebra
Representability of the geometric Hecke determinant (theorem).
Let T_m be the complete local integral Hecke algebra, possibly nonreduced, and D its continuous rank-two geometric determinant constructed by the geometric-hecke-determinant node. Assume its reduction is det ρ̄ for a specified absolutely irreducible ρ̄:G_{F,S}→GL₂(k), where k is the finite residue field. Then D has a continuous representation ρ_T:G_{F,S}→GL₂(T_m) with characteristic polynomial X²−T_vX+Nv S_v at good geometric Frobenius in the geometric law’s convention. It is unique up to conjugacy; with the residual identification fixed, uniqueness is up to strict equivalence. Its determinant, coefficient change and characteristic polynomials commute with specialisation, including nonreduced quotients. This is the modular instance of IHG.1 reconstruction, not a second definition or proof of polynomial laws. Its dual is the arithmetic Hecke representation, with the same polynomial at arithmetic Frobenius and the inverse determinant character. Apply this dualisation before mapping an arithmetic universal deformation ring.
Hypotheses: T_m is complete local henselian; the residual determinant is split because it is explicitly det ρ̄ over k. Absolute residual irreducibility is essential. Residually multiplicity-free reducible determinants generally give a generalised matrix algebra, not this conclusion. The determinant exists over the whole integral ring, not just its reduced generic fibre.
Required imported carriers/interfaces: IntegralHeckeAndGaloisDeterminants:IHG.1, AutomorphicGaloisRepresentations:R19.6/geometric-hecke-determinant, AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform.

AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition
The Tate module of A_f decomposes into the λ-adic representations of f (weight two) (theorem).
Let f be a newform of weight 2, level N, character ψ, coefficient field K_f, and A_f = J_1(N)/p_fJ_1(N) (ModularCurvesPartII R14.5). For every prime ℓ, V_ℓ(A_f) = T_ℓ(A_f) ⊗ Q_ℓ is free of rank 2 over K_f ⊗ Q_ℓ = ∏_{λ|ℓ} K_{f,λ}, and V_ℓ(A_f) ≅ ⊕_{λ|ℓ} ρ_{f,λ} as Q_ℓ[G_Q]-modules with K_f-action, where ρ_{f,λ} = K_{f,λ} ⊗_{K_f ⊗ Q_ℓ} V_ℓ(A_f) is two-dimensional over K_{f,λ} and is the λ-adic representation of f (AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation). In particular dim_{Q_ℓ} V_ℓ(A_f) = 2[K_f : Q]; for K_f = Q, V_ℓ(A_f) ≅ ρ_{f,ℓ} and A_f is the elliptic curve E_f. No abelian quotient is asserted in weight k > 2.
Hypotheses: A_f and its Hecke action are ModularCurvesPartII R14.5 (imported node); the Tate module as a Galois module is ArithmeticGaloisRepresentations R01.6.
Required imported carriers/interfaces: ModularCurvesPartII:R14.5/modular-quotient, ModularCurvesPartII:R14.5/modular-quotient-dimension, ModularCurvesPartII:R14.6/special-fibre-eichler-shimura, AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, ArithmeticGaloisRepresentations:R01.6.

AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform
The residual representation of a newform (construction).
For a newform f of weight k ≥ 2, level N, character ψ and a place λ of K_f with residue field k_λ, choose a G_Q-stable O_λ-lattice T in ρ_{f,λ} and put ρ̄_{f,λ} := (T/λT)^{ss}, the semisimplification of its reduction. It is independent of T up to isomorphism, unramified outside Nℓ, with tr ρ̄(Frob_p) = a_p mod λ and det ρ̄(Frob_p) = ψ(p)p^{k−1} mod λ for arithmetic Frob_p, p ∤ Nℓ; det ρ̄ = ψ̄·χ̄_ℓ^{k−1}; ρ̄ is odd; for ℓ odd, ρ̄ is irreducible iff absolutely irreducible. The full good-prime characteristic-polynomial identity (trace and determinant together) characterises ρ̄ among semisimple representations, by Brauer–Nesbitt and Čebotarev. Traces alone do not suffice in characteristic two.
Hypotheses: Invariant lattices and lattice-independence of the semisimplified reduction are ArithmeticGaloisRepresentations R01.1 (request). In contrast with ρ_{f,λ}, ρ̄ need not be irreducible, and only divisibility N(ρ̄) | N (prime to ℓ) holds in general (Darmon–Diamond–Taylor, after Theorem 3.1).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, ArithmeticGaloisRepresentations:R01.1, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.residualRep [data]: ρ̄_{f,λ}: G_Q → GL_2(k_λ), semisimple, defined up to isomorphism.
  TauCeti.ModularGalois.residualRep_trace [characterisation]: tr ρ̄(Frob_p) = a_p mod λ for p ∤ Nℓ.
  TauCeti.ModularGalois.residualRep_det [simp]: det ρ̄ = ψ̄ χ̄_ℓ^{k−1}.
  TauCeti.ModularGalois.residualRep_lattice_indep [extensionality]: Any two stable lattices give isomorphic semisimplified reductions.
  TauCeti.ModularGalois.residualRep_unique_charpoly [extensionality]: A semisimple representation with the same good-prime characteristic polynomials is isomorphic to residualRep; retain determinant information also in characteristic two.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.residualRep_11a1_five [computation]: For 11a1 and λ = 5, ρ̄ ≅ 1 ⊕ χ̄_5.
  Test TauCeti.ModularGalois.residualRep_det_weight_two [degenerate]: For k = 2 and ψ = 1, det ρ̄ = χ̄_ℓ.
  Test TauCeti.ModularGalois.residualRep_eq_torsion [compatibility]: For K_f = Q, ρ̄_{f,ℓ} ≅ E_f[ℓ]^{ss} as G_Q-modules.
  Test TauCeti.ModularGalois.residualRep_not_reduction_without_ss [non-example]: For 11a1, λ = 5, different lattices give non-isomorphic reductions (1 ∗; 0 χ̄_5) and (χ̄_5 ∗; 0 1) before semisimplification.
  Test TauCeti.ModularGalois.residualRep_trace_char_two [non-example]: Over F₄, let χ:C₃→F₄× have order three. The semisimple representations 1⊕1 and χ⊕χ both have identically zero trace, but determinant characters 1 and χ² differ. Full characteristic polynomials distinguish them.

AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic
The Galois representation over a localised quaternionic Hecke algebra (theorem).
Setting of Khare–Wintenberger II §7: F totally real of even degree with p unramified in F, D the definite quaternion algebra over F ramified at all infinite places and at a finite set Σ of finite places (|Σ| even), U = ∏U_v an open subgroup compact modulo the centre of (D ⊗ A_F^∞)^×, S a finite set of places containing Σ, the places above p and those where U_v is not maximal, ψ a character of F^×\(A_F^∞)^× with values in O, k ≥ 2 a (parallel) weight (k = 2 when p = 2), S_{k,ψ}(U, O) the space of O-valued forms, and T_ψ(U) the O-algebra generated by the operators T_v, S_v (v ∉ S). A maximal ideal m is non-Eisenstein if it is not Eisenstein in the sense of KW II §7. Let m be a non-Eisenstein maximal ideal whose residual representation ρ̄_m is absolutely irreducible. Then there is a continuous representation ρ_m: G_F → GL_2(T_ψ(U)_m), unique up to conjugacy (up to strict equivalence after fixing the residual identification), unramified outside S, such that for v ∉ S the characteristic polynomial of ρ_m(Frob_v) (arithmetic Frobenius) is X² − T_vX + N(v)ψ(π_v) (the Eichler–Shimura relation). Its reduction modulo m is ρ̄_m, and for every O-algebra map x: T_ψ(U)_m → O′, with O′ the integer ring of a finite extension of E, the specialisation x ∘ ρ_m is the representation ρ_f of the Hecke eigenform f with eigenvalues x(T_v). Hence there is a unique map R^ψ_S → T_ψ(U)_m carrying the universal deformation of ρ̄_m to ρ_m.
Hypotheses: Carayol's descent (Théorème 2 of Carayol, "Formes modulaires et représentations galoisiennes à valeurs dans un anneau local complet", Contemp. Math. 165, 1994) is quoted through KW II; it is not public. The same descent is the representability statement of AutomorphicGaloisRepresentations:R19.6/determinants-and-representability-over-a-hecke-algebra (Chenevier) together with the residue-field descent requested from IntegralHeckeAndGaloisDeterminants IHG.1. Absolute irreducibility of ρ̄_m is essential: for Eisenstein or residually reducible m the traces do not determine a representation over T_m (Skinner–Wiles work with pseudo-representations instead). The finite residue field poses no algebraic-closure obstruction: Chenevier 2.22(i) applies to the explicitly split absolutely irreducible residual determinant; use the geometric law first. Use KW II §7 pp. 58–59: O is the integer ring of a sufficiently large finite E/Q_p containing all embeddings F→E; D splits after extension to E at p, and Σ∩{v|p}=∅ if k>2. The coefficient representation τ has τ|U∩centre=ψ⁻¹, with ψ restricting on an open subgroup of the p-units to the norm power 2−k. For p=2 and noncompact U, fix one of the extensions of the trivial W₂ action from its maximal compact subgroup U⁰ to U·centre. The bad set S also contains infinity and places where τ is nontrivial.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.6/determinants-and-representability-over-a-hecke-algebra, GL2AutomorphicRepresentationsAndTransfer:R17.3, IntegralHeckeAndGaloisDeterminants:IHG.1, AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation, ArithmeticGaloisRepresentations:R01.1, IntegralHeckeAndGaloisDeterminants:IHG.4, GlobalGaloisDeformations:R04.2/universal-deformation-ring, GlobalGaloisDeformations:R04.2/fixed-determinant-rings, GlobalGaloisDeformations:R04.3.

AutomorphicGaloisRepresentations:R19.6/full-weight-two-hecke-algebra-and-its-galois-representations
The full weight-two Hecke algebra, its representation on the Tate module and the residual representations ρ_m (construction).
Let Γ = Γ_H(N) and let 𝕋_ℤ be the subring of End(S₂(Γ)) generated by the Hecke operators T_n (n ≥ 1) and the diamond operators ⟨d⟩ (d ∈ (ℤ/Nℤ)^×); for a ring R put 𝕋_R = 𝕋_ℤ ⊗ R. Then 𝕋_R acts faithfully on S₂(Γ, R) and is finite free as an R-module. 𝕋_ℤ acts on the Jacobian J_Γ and on its Tate module T_ℓ(J_Γ) compatibly with G_ℚ, and V = T_ℓ(J_Γ) ⊗ ℚ_ℓ is free of rank 2 over 𝕋_{ℚ_ℓ}, so G_ℚ acts through a representation ρ_V : G_ℚ → Aut_{𝕋_{ℚ_ℓ}}(V) ≅ GL₂(𝕋_{ℚ_ℓ}), unramified outside Nℓ, with characteristic polynomial X² − T_pX + p⟨p⟩ at an arithmetic Frobenius Frob_p for p ∤ Nℓ. For K/ℚ_ℓ finite with ring of integers 𝒪 and a maximal ideal 𝔭 of 𝕋_K, reduction modulo 𝔭 gives ρ_𝔭 : G_ℚ → GL₂(𝕋_K/𝔭) with the same characteristic polynomials modulo 𝔭. If ℓ is odd, the reduction of ρ_𝔭 is defined over 𝕋_𝒪/𝔪, where 𝔪 is the maximal ideal of 𝕋_𝒪 below 𝔭, and its semisimplification ρ_𝔪 : G_ℚ → GL₂(𝕋_𝒪/𝔪) depends only on 𝔪 and has characteristic polynomial X² − T_pX + p⟨p⟩ mod 𝔪 at Frob_p (p ∤ Nℓ). If the eigenform attached to 𝔭 is a newform g then 𝕋_K/𝔭 ≅ K′_g and ρ_𝔭 ≅ ρ_g; in general ρ_𝔭 is obtained from ρ_f, for the newform f associated with that eigenform, by extension of scalars.
Hypotheses: weight two only: the Tate module of the Jacobian carries all the representations at once; higher weights use parabolic cohomology with coefficients (AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive) 𝕋_K need not be reduced: on the old space of a newform f, T_p for p | N/N_f satisfies u^{v_p(N/N_f)−1}(u² − a_p(f)u + ψ_f(p)p) (Darmon–Diamond–Taylor, before Lemma 4.4), which has a repeated factor u when v_p(N/N_f) ≥ 3, or when p | N_f and v_p(N/N_f) ≥ 2 ρ_𝔪 is only a residual (semisimplified) representation; a representation over the local ring 𝕋_𝔪 itself is the subject of AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-classical and AutomorphicGaloisRepresentations:R19.6/reduced-hecke-algebra-as-a-localisation
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/geometric-construction-and-the-eichler-congruence-relation, AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition, ModularCurvesPartII:R14.2, ArithmeticGaloisRepresentations:R01.6, ArithmeticGaloisRepresentations:R01.1, AlgebraicModularFormsAndSerreWeights:R15.2.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.fullHeckeAlgebra [data]: 𝕋_R = 𝕋_ℤ ⊗ R for Γ_H(N) in weight two, generated by the T_n and ⟨d⟩.
  TauCeti.ModularGalois.fullHeckeAlgebra_free [characterisation]: 𝕋_R is finite free over R and acts faithfully on S₂(Γ, R).
  TauCeti.ModularGalois.tateModule_free_rank_two [characterisation]: T_ℓ(J_Γ) ⊗ ℚ_ℓ is free of rank 2 over 𝕋_{ℚ_ℓ}.
  TauCeti.ModularGalois.heckeRep [constructor]: ρ_𝔭 : G_ℚ → GL₂(𝕋_K/𝔭) for a maximal ideal 𝔭 of 𝕋_K.
  TauCeti.ModularGalois.heckeRep_charpoly [characterisation]: For p ∤ Nℓ, the characteristic polynomial of ρ_𝔭(Frob_p) is X² − T_pX + p⟨p⟩ mod 𝔭.
  TauCeti.ModularGalois.residualHeckeRep [constructor]: For ℓ odd, ρ_𝔪 : G_ℚ → GL₂(𝕋_𝒪/𝔪), semisimple, depending only on 𝔪.
  TauCeti.ModularGalois.heckeRep_newform [compatibility]: If 𝔭 corresponds to a newform g, 𝕋_K/𝔭 ≅ K′_g and ρ_𝔭 ≅ ρ_g.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.fullHeckeAlgebra_level_eleven [computation]: For Γ₀(11) and ℓ = 5: 𝕋_ℤ = ℤ, 𝔪 = (5) and ρ_𝔪 ≅ 1 ⊕ χ̄₅.
  Test TauCeti.ModularGalois.fullHeckeAlgebra_not_reduced_level_88 [non-example]: For Γ₀(88), T₂ on the old space of 11a1 generates K[u]/(u²(u² + 2u + 2)), in which u(u² + 2u + 2) is a nonzero nilpotent.
  Test TauCeti.ModularGalois.fullHeckeAlgebra_genus_zero [degenerate]: For Γ₀(N) with N ≤ 10, S₂(Γ₀(N)) = 0, so 𝕋_ℤ = 0 and there are no maximal ideals.
  Test TauCeti.ModularGalois.heckeRep_newform_compat [compatibility]: For a newform g of level N, ρ_𝔭 agrees with AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation.

AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-classical
The Galois representation over the reduced Hecke algebra 𝕋_Σ (F = ℚ, weight two) (theorem).
Let ℓ be an odd prime, K/ℚ_ℓ finite with ring of integers 𝒪 and residue field k, and ρ̄ : G_ℚ → GL₂(k) continuous with (a) ρ̄ irreducible, (b) ρ̄ modular, (c) det ρ̄ = ε̄_ℓ, the mod-ℓ cyclotomic character, (d) ρ̄|_{G_ℓ} semistable and (e) #ρ̄(I_p) | ℓ for p ≠ ℓ. Then ρ̄ restricted to G_L, L = ℚ(√((−1)^{(ℓ−1)/2}ℓ)), is absolutely irreducible. Let Σ be a finite set of primes in Σ_ρ̄ (p = ℓ with ρ̄|_{G_ℓ} good and ordinary, or p ≠ ℓ with ρ̄ unramified at p) and let 𝒩_Σ be the set of weight-two newforms f with ρ̄_f ≅ ρ̄ ⊗_k k_f, ψ_f trivial and N_f dividing ℓ^δ N(ρ̄) ∏_{p∈Σ−{ℓ}} p^{dim ρ̄^{I_p}} (δ = 0 if ρ̄ is good and ℓ ∉ Σ, δ = 1 otherwise); these are the f whose ρ_f is a lifting of ρ̄ of type Σ with ℓ² ∤ N_f, and 𝒩_Σ ≠ ∅. Let 𝕋_Σ be the 𝒪-subalgebra of ∏_{f∈𝒩_Σ} 𝒪′_f generated by T_p = (a_p(f))_f for p ∉ Σ, p ∤ ℓN(ρ̄). Then 𝕋_Σ is a complete noetherian local 𝒪-algebra with residue field k, reduced and finite free over 𝒪, and there is a continuous representation ρ^mod_Σ : G_ℚ → GL₂(𝕋_Σ), unramified at every p ∉ Σ with p ∤ ℓN(ρ̄), with tr ρ^mod_Σ(Frob_p) = T_p there, such that (a) ρ^mod_Σ is a lifting of ρ̄ of type Σ and there is a unique surjection φ_Σ : R_Σ ↠ 𝕋_Σ with ρ^mod_Σ ∼ φ_Σ ∘ ρ^univ_Σ; (b) for Σ′ ⊃ Σ there is a unique surjection 𝕋_Σ′ ↠ 𝕋_Σ carrying ρ^mod_Σ′ to ρ^mod_Σ and T_p to T_p (p ∉ Σ′, p ∤ ℓN(ρ̄)); (c) enlarging K to K′ replaces 𝕋_Σ by 𝕋_Σ ⊗_𝒪 𝒪_{K′}. Composing ρ^mod_Σ with the projection to the f-factor gives ρ_f.
Hypotheses: ℓ odd is used twice: to normalise ρ̄(c) = diag(1, −1) for a complex conjugation c with distinct eigenvalues, and to recover the diagonal entries from tr ρ(g) and tr ρ(cg) by dividing by 2 irreducibility of ρ̄ is essential: it supplies σ, τ ∈ G_ℚ whose off-diagonal entries are units, which move the off-diagonal entries into 𝕋_Σ; for a residually reducible ρ̄ the traces give only a pseudo-representation the source proves the existence of the model over 𝕋_Σ and leaves (a)–(c) "as an exercise"; they are sketched in the proof steps and recorded as a gap 𝒩_Σ ≠ ∅ is Darmon–Diamond–Taylor Theorem 3.15 (Diamond's level optimisation in weight two), requested from SerreWeightAndLevelOptimisation R20.6; ψ_f is then trivial because it has order prime to ℓ and reduces to the trivial character, as det ρ̄ = ε̄_ℓ this is the classical (F = ℚ) counterpart of AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic, which needs [F : ℚ] even; it avoids Carayol's descent because 𝕋_Σ is reduced and the product of the ρ_f is available
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform, AutomorphicGaloisRepresentations:R19.6/full-weight-two-hecke-algebra-and-its-galois-representations, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime, GlobalGaloisDeformations:R04.3, SerreWeightAndLevelOptimisation:R20.6.

AutomorphicGaloisRepresentations:R19.6/reduced-hecke-algebra-as-a-localisation
The reduced Hecke algebra 𝕋_Σ is the localisation 𝕋_𝔪 of the full Hecke algebra of Γ₀(N_Σ) (theorem).
In the setting of AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-classical, let Γ = Γ₀(N_Σ) with N_Σ = ℓ^δ ∏_{p|N(ρ̄)} p ∏_{p∈Σ−{ℓ}} p². For f ∈ 𝒩_Σ let g ∈ S₂(Γ, K′_f) be the normalised eigenform with a_p(g) = a_p(f) if p ∤ N_Σ/N_f, a_p(g) = 0 if p ≠ ℓ and p | N_Σ/N_f, and a_ℓ(g) the unit root of X² − a_ℓ(f)X + ℓ if ℓ | N_Σ/N_f. Then the reduction ḡ is the normalised eigenform in S₂(Γ, k′) with a_p(ḡ) = tr ρ̄_{I_p}(Frob_p) (action on I_p-coinvariants) if p = ℓ or p ∉ Σ, and a_p(ḡ) = 0 otherwise; it is independent of f, and it defines a maximal ideal 𝔪 of the full Hecke algebra 𝕋_𝒪 of Γ. There is an isomorphism of 𝒪-algebras 𝕋_Σ ≅ 𝕋_𝔪 with T_p ↦ T_p for all p ∤ N_Σℓ. Consequently 𝕋_𝔪 is reduced, 𝕋_𝔪 ⊗ K ≅ ∏_{f∈𝒩_Σ} K (for K large enough) with T_p ↦ (a_p(f))_f for p ∉ Σ, T_p ↦ 0 for p ∈ Σ − {ℓ} and T_ℓ ↦ the unit roots when ℓ ∈ Σ, and ρ^mod_Σ becomes a representation G_ℚ → GL₂(𝕋_𝔪) whose I_p-coinvariants at p | N(ρ̄)ℓ^δ have Frob_p acting by T_p.
Hypotheses: the level N_Σ is chosen so that each f ∈ 𝒩_Σ contributes exactly one prime of 𝕋_K above 𝔪, at which its old-space algebra localises to K: for p ∈ Σ − {ℓ} the polynomial of u_p is u(u² − a_p(f)u + p) if p ∤ N_f (and p is a unit in k), u(u − a_p(f)) with a_p(f) = ±1 if p ∥ N_f, and there is no variable if p² | N_f, so u_p = 0 is a simple root in every case; for p | N(ρ̄) there is no variable, as N(ρ̄) | N_f; at ℓ with δ = 1 and ℓ ∤ N_f only the unit root of u² − a_ℓ(f)u + ℓ lies above 𝔪 due to Wiles (Annals 1995, Proposition 2.15), as the source says; the Taylor–Wiles variant 𝕋_Q (Darmon–Diamond–Taylor Proposition 4.10, auxiliary primes) is not planned here the proof uses the newform decomposition of S₂(Γ, K) with the old space of f spanned by the f(aτ), a | N/N_f (Tau Ceti ModularForms layer 4, request), a_p(f) = ±1 for p ∥ N_f and a_p(f) = 0 for p² | N_f with trivial character (AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, parts (b)–(c)), and the unit root at ℓ (AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime, ordinary case)
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-classical, AutomorphicGaloisRepresentations:R19.6/full-weight-two-hecke-algebra-and-its-galois-representations, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime, AlgebraicModularFormsAndSerreWeights:R15.2, tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor.

AutomorphicGaloisRepresentations:R19.4/quaternionic-sigma-place-local-form
The Steinberg local form at the ramification places of the quaternion algebra (theorem).
Setting of Khare–Wintenberger II §7: F totally real of even degree with p unramified in F, D the definite quaternion algebra over F ramified at all infinite places and at a finite set Σ of finite places (|Σ| even), U = ∏U_v an open subgroup compact modulo the centre of (D ⊗ A_F^∞)^×, S a finite set of places containing Σ, the places above p and those where U_v is not maximal, ψ a character of F^×\(A_F^∞)^× with values in O, k ≥ 2 a (parallel) weight (k = 2 when p = 2), S_{k,ψ}(U, O) the space of O-valued forms, and T_ψ(U) the O-algebra generated by the operators T_v, S_v (v ∉ S). A maximal ideal m is non-Eisenstein if it is not Eisenstein in the sense of KW II §7. Assume moreover that U_v = (O_D)_v^× for v ∈ Σ when p > 2 and U_v = D_v^× for v ∈ Σ when p = 2, that m is non-Eisenstein, and that Σ is disjoint from the places above p if k > 2. Then for each v ∈ Σ there is a fixed unramified character γ_v: G_{F_v} → O^× such that for every Hecke eigenform f ∈ S_{k,ψ}(U, O)_m, ρ_f|_{D_v} ≅ (χ_pγ_v ∗; 0 γ_v); moreover γ_v² = ψ_v and γ_v(Frob_v) is the inverse of the eigenvalue of a uniformiser of D_v^× on f. This is the fixed-character assertion for eigenform specialisations. An integral triangular family over the Hecke algebra additionally requires a finite-projective invariant line as specified in the local-condition node.
Hypotheses: The form (χ_pγ_{v,f} ∗; 0 γ_{v,f}) for each f comes from Jacquet–Langlands at v ∈ Σ (π_v an unramified twist of Steinberg) and Carayol's local–global compatibility away from p; the independence of f is the new content. The final density argument concerns the reduced O-flat KW Hecke algebra. A nilpotent family requires the local-condition-quotient proof in R19.6/hecke-family-local-conditions; dense field points alone do not suffice. Use KW II §7 pp. 58–59: O is the integer ring of a sufficiently large finite E/Q_p containing all embeddings F→E; D splits after extension to E at p, and Σ∩{v|p}=∅ if k>2. The coefficient representation τ has τ|U∩centre=ψ⁻¹, with ψ restricting on an open subgroup of the p-units to the norm power 2−k. For p=2 and noncompact U, fix one of the extensions of the trivial W₂ action from its maximal compact subgroup U⁰ to U·centre. The bad set S also contains infinity and places where τ is nontrivial.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility, GL2AutomorphicRepresentationsAndTransfer:R17.3, AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical, AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic.

AutomorphicGaloisRepresentations:R19.5/hilbert-local-behaviour-at-p
Local behaviour at p of Hilbert modular Galois representations (Kisin, Saito) (theorem).
In the unramified-base-field parallel-weight setting of KW II Lemma 7.7 and Corollary 7.8, with absolutely irreducible residual representation, use the full Kisin coefficient-prime theorem. At v|p, an unramified π_v gives a crystalline representation with the specified weight; in weight two a tame principal-series type gives potentially Barsotti–Tate behaviour over the extension killing that type. In the weight-two unramified Steinberg-twist case the representation is semistable noncrystalline with characters χ_pγ_v and γ_v (γ_v unramified), weights {0,1}, and nonzero monodromy. For higher weights use the general Hodge type and WD parameter: neither weights {0,1} nor this ordinary triangular shape is asserted automatically. Ordinary shape is imported from R21.3 with its exact character hypotheses.
Hypotheses: KW’s Corollary 7.8 has F unramified at p and parallel weights; Kisin Theorem 4.3 itself has arbitrary totally real F and cohomological multiweight. Retain absolute residual irreducibility for this Kisin route; the separate Skinner theorem removes it. In the tame potentially Barsotti–Tate case the local character factors through the norm as in KW type (B); the exponent in ω_p^{k−2} is a residual Serre weight, not the characteristic-zero weight two.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.5/kisin-hilbert-coefficient-prime, PadicHodgeTheory:R06.3/weil-deligne-descent, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, OrdinaryAutomorphicFormsAndModularityLifting:R21.3.

AutomorphicGaloisRepresentations:R19.2/wiles-ordinary-hilbert-representation
Identification with Wiles’ nearly ordinary representation (theorem).
Let p be an odd prime and F be a totally real field of even degree (Skinner–Wiles §3.3), U ⊆ GL_2(O_F ⊗ Ẑ) open compact with n the product of the primes where U is not maximal, p_1, …, p_t the primes above p, and π ∈ Π^ord_k(U) a nearly ordinary cuspidal representation of parallel weight k = κ·t, κ ≥ 2 (OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-representations), with Hecke eigencharacter λ. Then there is a continuous irreducible ρ_π: Gal(F̄/F) → GL_2(Q̄_p) such that: ρ_π(z_1) = diag(1, −1) for a complex conjugation z_1; ρ_π is unramified at ℓ ∤ np; trace ρ_π(Frob_ℓ) = λ(T(ℓ)) and det ρ_π(Frob_ℓ) = λ(S(ℓ))Nm(ℓ) for ℓ ∤ np; det ρ_π(x) = λ(S_x)ε(x) for x ∈ Z(U); and at each p_i, ρ_π|_{D_i} ≅ (ψ_1 ∗; 0 ψ_2) with ψ_2(y) = λ(T_y) for y ∈ O_{F,p_i}^× and ψ_2(λ_{p_i}) = λ(T_0(p_i)). For ordinary π this is Wiles' theorem; for nearly ordinary π, ρ_π := ρ_{π⊗ψ} ⊗ ψ for any finite character ψ making π ⊗ ψ ordinary.
Hypotheses: Wiles, "On ordinary λ-adic representations associated to modular forms" (Invent. Math. 94, 1988) [W2] is quoted through Skinner–Wiles §3.3; it is not read here. The even-degree assumption is Skinner–Wiles' standing assumption in §3.3 (definite quaternion algebras unramified at all finite places); odd degree is reduced to it by solvable base change in their Main Theorem. The ordinary local triangular-shape theorem and its exact characters are owned by R21.3; this node identifies Wiles’ representation with the cohomological representation by good-prime traces.
Required imported carriers/interfaces: OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-representations, OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra, AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A, OrdinaryAutomorphicFormsAndModularityLifting:R21.3, AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation.

AutomorphicGaloisRepresentations:R19.4/nearly-ordinary-hilbert-compatibility-away-from-p
Local–global compatibility away from p for nearly ordinary Hilbert modular forms (theorem).
With π ∈ Π^ord_k(U) and ρ_π as in AutomorphicGaloisRepresentations:R19.2/wiles-ordinary-hilbert-representation, for every finite place v ∤ p, π_v ≅ π_v(ρ_π), where π_v(ρ) is the representation of GL_2(F_v) attached to ρ|_{D_v} by local Langlands normalised as in Carayol: if ρ|_{D_v} ≅ (μ_1 ∗; 0 μ_2) then π_v(ρ) is a constituent of π(μ_1^{−1}|·|_v^{−1/2}, μ_2^{−1}|·|_v^{−1/2}) (Skinner–Wiles (3.3)).
Hypotheses: For ordinary π this is Wiles [W2, Theorem 2.1.3]; the twisting argument uses the compatibility π_v ⊗ ψ_v ↔ ρ ⊗ ψ^{−1} of Carayol's normalisation (AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility (b)).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/wiles-ordinary-hilbert-representation, AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility, GL2AutomorphicRepresentationsAndTransfer:R16.3.

AutomorphicGaloisRepresentations:R19.1/scholl-projector
Scholl’s symmetric-power projector (construction).
For fine auxiliary level n≥3 and r=k−2≥1, on the canonical resolution of the r-fold fibre power of the universal elliptic curve, construct e_ε=|Γ_r|⁻¹Σ_g ε(g)g, where Γ_r=((Z/nZ)²⋊µ₂)^r⋊S_r and ε is trivial on translations, the product character on µ₂^r and the sign on S_r. Its realisation is concentrated in degree r+1 and identifies with parabolic H¹ of Sym^r R¹f_*; the projector commutes with level and Hecke correspondences. This is the modular application of the imported Kuga–Sato geometry, not a new definition of a motive category.
Hypotheses: Invert 2n·r! for the integral group-ring formula; use rational coefficients for the motivic projector. Individual newform projectors are asserted in the category of homological motives; no unproved standard conjecture is used to promote them to Chow projectors.
Required imported carriers/interfaces: GeneralizedHeegnerCycles:GH.0, ModularCurvesPartII:R14.3.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.schollProjector [constructor]: The ε-idempotent acting on all imported realisations.
  TauCeti.ModularGalois.schollProjector_idempotent [relation]: e_ε²=e_ε.
  TauCeti.ModularGalois.schollProjector_parabolic [equivalence]: Its degree-(r+1) image is parabolic H¹(Sym^r R¹f_*).
  TauCeti.ModularGalois.schollProjector_hecke [compatibility]: It intertwines the geometric Hecke action.
  TauCeti.ModularGalois.schollProjector_level [functoriality]: Transport through fine-level change commutes with the projector.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.schollProjector_weight_three [example]: r=1: translations act trivially and inversion acts by −1 on H¹ of the elliptic fibre.
  Test TauCeti.ModularGalois.schollProjector_transposition [non-example]: r=2: omitting sign(S₂) changes the graded Künneth action and fails to recover Sym².
  Test TauCeti.ModularGalois.schollProjector_denominators [computation]: For n=3,r=2, |Γ_r|=(2·3²)²·2!=648; the averaging projector is rational, not an integral operator at 2 or 3.
  Test TauCeti.ModularGalois.schollProjector_boundary [compatibility]: The ε-part of compact cohomology identifies with the parabolic image, rather than all open-curve cohomology.

AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent
Newform projector and coefficient-field descent (construction).
For a normalised cuspidal newform f of weight k≥2, coefficient field K_f and nebentypus ε, let H be the rational new cuspidal parabolic realisation and T its semisimple rational Hecke image. The quotient θ_f:T→K_f cuts out the rational central idempotent e_[f] for the Galois orbit of f. The factor e_[f]H is a rank-two K_f-module; extending K_f by an embedding yields the f-eigenspace. Construct its Betti, de Rham and λ-adic realisations and the arithmetic dual ρ_f,λ. Descend from a larger field containing ε-values via this rational K_f-action, rather than assuming every trace-valued representation descends. Match its top Hodge line with the upstream modular-symbol rational structure and its two complex-conjugation period lines.
Hypotheses: Use the new cuspidal quotient: full Hecke algebras with oldforms may be nonreduced. A rational orbit projector need not isolate one complex embedding before scalar extension. Stable integral lattices are intersections of the rational factor with the imported integral parabolic module; neither saturation nor freeness over O_K is automatic. For k=2 use the modular abelian quotient/Jacobian factor of R14.5; the Scholl projector node has r=k−2≥1 and applies only to k≥3.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/scholl-projector, AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields, ModularCurvesPartII:R14.3, ModularCurvesPartII:R14.5/modular-quotient, ModularCurvesPartII:R14.5/modular-quotient-dimension.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.newformOrbitProjector [constructor]: The central idempotent e_[f] of the rational new Hecke algebra.
  TauCeti.ModularGalois.newformOrbitProjector_idempotent [relation]: e_[f]²=e_[f] and θ_f(e_[f])=1.
  TauCeti.ModularGalois.newformFactor [data]: The K_f-linear image on every realisation.
  TauCeti.ModularGalois.newformFactor_baseChange [functoriality]: Extension along σ:K_f→L identifies the factor with the σ(f)-eigenspace.
  TauCeti.ModularGalois.newformFactor_rank [characterisation]: Its K_f-dimension is two.
  TauCeti.ModularGalois.newformFactor_periodLines [compatibility]: The Betti ± lines and modular-symbol rational structure agree with the imported period lines.
  TauCeti.ModularGalois.newformFactor_lattice [constructor]: Intersect with the imported integral module and retain torsion-freeness and saturation hypotheses explicitly.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.newformFactor_level23 [example]: The degree-two coefficient field gives rational dimension four, not two.
  Test TauCeti.ModularGalois.newformFactor_delta [example]: For Δ the factor has rank two over Q and is realised in degree eleven Kuga–Sato cohomology.
  Test TauCeti.ModularGalois.newformFactor_orbit [non-example]: Before scalar extension a single embedding of Q(√5) cannot replace the rational Galois-orbit factor.
  Test TauCeti.ModularGalois.newformFactor_periodScaling [invariance]: Changing a generator of a period line by a K_f-unit preserves the line; an unspecified lattice cannot select a numerical period.
  Test TauCeti.ModularGalois.newformFactor_oldNilpotents [non-example]: The level-88 old Hecke algebra from DDT is not the semisimple rational new quotient used by this projector.

AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation
Galois representation of every cohomological Hilbert eigenform (construction).
For any totally real F and cuspidal cohomological π on GL₂(A_F), with infinity type (k_τ,w), k_τ≥2 and k_τ≡w mod 2, construct a continuous semisimple rank-two σ_π,λ over a finite coefficient extension E_λ for every λ. At good geometric Frobenius its polynomial is X²−t_vX+Nv·s_v in the Carayol/Kisin Hecke convention. The arithmetic representation is its dual, with the corresponding explicit change of eigenvalues and determinant. There is no finite discrete-series-place requirement even if [F:Q] is even. In that case construct the missing representation by Taylor’s congruences with forms special at an auxiliary place, compatible finite-quotient traces and determinants, and characteristic-zero reconstruction. The arithmetic-properties node proves absolute irreducibility separately; a minimal coefficient-field model is not inferred merely from trace values.
Hypotheses: The cohomological parity and k_τ≥2 are retained. The auxiliary primes vary with the precision; this does not impose a discrete-series place on the given π. A chosen model over E_λ is allowed; minimal coefficient-field descent must be justified separately.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/hilbert-modular-compatible-system-carayol-theorem-A, ArithmeticGaloisRepresentations:R01.5, IntegralHeckeAndGaloisDeterminants:IHG.1, GL2AutomorphicRepresentationsAndTransfer:R17.3.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.hilbertGaloisRep [constructor]: The continuous rank-two σ_π,λ in the named geometric-Frobenius Hecke convention.
  TauCeti.ModularGalois.hilbertGaloisRep_charpoly [characterisation]: At good v, charpoly(Frob_v^geom)=X²−t_vX+Nv·s_v.
  TauCeti.ModularGalois.hilbertGaloisRep_arithmeticDual [compatibility]: Dualisation inverts Frobenius eigenvalues; the arithmetic convention is obtained by evaluating at inverse Frobenius.
  TauCeti.ModularGalois.hilbertGaloisRep_unique [extensionality]: The semisimple representation is unique up to isomorphism from its good-prime polynomials.
  TauCeti.ModularGalois.hilbertGaloisRep_coefficients [functoriality]: Coefficient extension commutes with the construction; minimal descent requires Taylor’s theorem.
  TauCeti.ModularGalois.hilbertGaloisRep_auxiliaryCongruence [data]: Compatible traces/determinants modulo p^s on varying auxiliary-new Hecke quotients.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.hilbertGaloisRep_oddDegree [compatibility]: For odd [F:Q] the result identifies with the geometric Shimura-curve multiplicity space.
  Test TauCeti.ModularGalois.hilbertGaloisRep_evenNoDS [example]: An even-degree field with no finite discrete-series component still has σ_π,λ.
  Test TauCeti.ModularGalois.hilbertGaloisRep_auxiliaryPrecision [invariance]: Choosing different permissible auxiliary primes gives isomorphic characteristic-zero semisimple representations by good-prime traces.
  Test TauCeti.ModularGalois.hilbertGaloisRep_parity [non-example]: A multiweight with unequal parities is not admitted by this cohomological theorem.

AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility
Arithmetic properties of the Hilbert representation (theorem).
For the all-cohomological-Hilbert representation σ_π,λ, prove continuity, absolute irreducibility and uniqueness by good-prime polynomials. In Carayol’s convention det σ_π,λ=χ_π,λ⁻¹ω_λ⁻¹, where χ_π,λ is the λ-adic central character in his algebraic normalisation and ω_λ his cyclotomic character; hence the dual determinant is χ_π,λω_λ. At every real place det σ_π,λ(c_τ)=−1. Identify transfer/base-change constructions with this representation whenever their hypotheses hold. Absolute irreducibility in characteristic zero does not imply residual irreducibility at every λ.
Hypotheses: Cuspidal and regular cohomological weights k_τ≥2; keep the normalisation of the algebraic central character. Local ordinary triangularity does not contradict global absolute irreducibility.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation, AutomorphicGaloisRepresentations:R19.2/carayol-twisting-and-determinant, ArithmeticGaloisRepresentations:R01.5, GL2AutomorphicRepresentationsAndTransfer:R17.4, AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, AutomorphicLFunctionsAndLocalFactors:AL.3.

AutomorphicGaloisRepresentations:R19.2/cm-hilbert-eigenform
CM Hilbert eigenform (definition).
A regular cohomological Hilbert eigenform f over totally real F has CM if there is a totally imaginary quadratic extension L/F and an algebraic Hecke character α of L, of the infinity type producing f, such that π_f=AI_L^F(α), equivalently σ_f,λ≅Ind_{G_L}^{G_F} α_λ in the matching normalisation for every λ. Require α_λ≠α_λ^c so the induction is cuspidal and irreducible. This is an arithmetic predicate on the existing eigenform, importing automorphic induction and class-field characters; it is not another general induction construction.
Hypotheses: k_τ≥2; the weight-one analogue needs a separately stated finite-order character case. Specify the dual/inverse character if the arithmetic representation rather than σ is used.
Required imported carriers/interfaces: GL2AutomorphicRepresentationsAndTransfer:R17.5, AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation, ArithmeticGaloisRepresentations:R01.5.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.IsCMHilbert [characterisation]: Existence of L/F and α with π_f=AI(α) and the matching induced Galois representation.
  TauCeti.ModularGalois.IsCMHilbert.inducingField [data]: A CM quadratic inducing extension, recorded with its embedding and nontrivial automorphism.
  TauCeti.ModularGalois.IsCMHilbert.trace_inert [simp]: Trace is zero at unramified primes inert in L.
  TauCeti.ModularGalois.IsCMHilbert.trace_split [simp]: At a split prime the trace is α_λ(Frob_w)+α_λ^c(Frob_w).
  TauCeti.ModularGalois.IsCMHilbert.twist [functoriality]: A compatible algebraic character twist preserves CM, with inducing character multiplied by its restriction.
  TauCeti.ModularGalois.IsCMHilbert.coefficientExtension [compatibility]: CM is invariant under extending the coefficient field.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.IsCMHilbert_Qi [example]: The weight-two form of y²=x³−x, conductor 32, is induced from Q(i); unramified primes 3 mod 4 have trace zero.
  Test TauCeti.ModularGalois.IsCMHilbert_twist [invariance]: A finite-order character twist of this form has the same quadratic inducing field.
  Test TauCeti.ModularGalois.IsCMHilbert_delta [non-example]: The level-one form Δ has no CM quadratic self-twist.
  Test TauCeti.ModularGalois.IsCMHilbert_splitTrace [computation]: A split Frobenius acts diagonally by α and α^c; determinant is their product, whereas an inert Frobenius has trace zero.

AutomorphicGaloisRepresentations:R19.2/virtual-reducibility-implies-cm
Virtual reducibility and CM (theorem).
For an absolutely irreducible regular cohomological Hilbert σ_f,λ, if its restriction to an open subgroup of G_F is reducible, then σ_f,λ is induced from a character of a quadratic extension L/F. Regular Hodge–Tate weights exclude finite projective image. The induced algebraic Hecke character and archimedean local Langlands then force L to be totally imaginary, so f is CM. Therefore a non-CM form remains irreducible on every open subgroup. The assertion that the inducing field is CM is restricted to k_τ≥2; weight-one dihedral forms need not satisfy the same archimedean argument.
Hypotheses: Continuous, semisimple, absolutely irreducible rank two; compact image over a finite λ-adic coefficient field. Two distinct labelled Hodge–Tate weights at each embedding give infinite projective image.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility, AutomorphicGaloisRepresentations:R19.2/cm-hilbert-eigenform, ArithmeticGaloisRepresentations:R01.4, GL2AutomorphicRepresentationsAndTransfer:R17.5.

AutomorphicGaloisRepresentations:R19.3/dimitrov-large-image
Dimitrov’s residual large-image theorem (theorem).
For a fixed non-CM regular cohomological Hilbert eigenform f, for all but finitely many rational primes ℓ and each relevant λ|ℓ, after conjugacy the residual image contains SL₂(F_q) for a finite subfield F_q⊆κ_λ, q=ℓ^a, and lies in κ_λ^×GL₂(F_q). In particular it contains a conjugate of SL₂(F_ℓ). Keep the finite exceptional set depending on f, its level, weights and coefficient field. Do not assert full GL₂(κ_λ).
Hypotheses: Non-CM and k_τ≥2; finite bad set includes coefficient, weight and level exceptions. Dimitrov’s integral/residual setup and coefficient embeddings are retained; the statement is uniform outside a finite set of rational characteristics.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/cm-hilbert-eigenform, AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility, ArithmeticGaloisRepresentations:R01.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family.

AutomorphicGaloisRepresentations:R19.3/ribet-momose-classical-large-image
Ribet–Momose large image for classical forms (theorem).
For a normalised non-CM classical cuspidal newform f of weight k≥2, the Zariski closure of ρ_f,λ contains SL₂ over the algebraic closure of K_f,λ for every λ. Its residual representation is absolutely irreducible for all but finitely many λ, and its residual image contains a conjugate of SL₂(F_ℓ) for all but finitely many rational ℓ, in particular for the large split primes used by Newton–Thorne. Inner twists may constrain the coefficient field and determinant: the open image is described using the inner-twist fixed field and its quaternion algebra, not automatically GL₂(O_K,λ).
Hypotheses: Characteristic-zero statement holds for every λ; residual statement excludes a finite set. Keep f fixed and non-CM.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, AutomorphicGaloisRepresentations:R19.2/cm-hilbert-eigenform, ArithmeticGaloisRepresentations:R01.4, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family.

AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family
Compatible family of a fixed eigenform (construction).
For a fixed classical newform of weight k≥2 or a fixed regular cohomological Hilbert eigenform π, assemble its representations for every finite coefficient place λ into the early imported compatible-system carrier. Supply one coefficient field E, the fixed finite level/ramification set S, coefficient-independent good-prime polynomials P_v(X), labelled Hodge numbers, and a local Frobenius-semisimple WD parameter at every finite v. Away from λ this is the all-Hilbert/classical local theorem; at v|λ use the coefficient-prime theorem with its exact hypotheses. With Skinner’s full theorem this fixed-form family is strict. The Kisin-only route is asserted at those λ with absolutely irreducible residual representation; the Saito-only route retains its parity/discrete-series hypotheses. A family known only by good-prime polynomials is weakly compatible and is not thereby strict.
Hypotheses: Only regular weight ≥2 is in this family; finite-image weight-one systems use the Deligne–Serre node separately. Use one consistent dual/twist normalisation at every λ. The generic carrier and weak/almost-strict/strict predicates belong to R24.5:operations.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation, AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility, AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, PotentialModularityAndCompatibleSystems:R24.5:operations.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.fixedEigenformFamily [constructor]: The family in the imported R24.5:operations carrier.
  TauCeti.ModularGalois.fixedEigenformFamily_member [projection]: The λ-member is the attached eigenform representation.
  TauCeti.ModularGalois.fixedEigenformFamily_goodPolynomial [data]: A single E-valued P_v for every v∉S.
  TauCeti.ModularGalois.fixedEigenformFamily_localParameter [data]: The common WD parameter includes N and the coefficient-prime cases.
  TauCeti.ModularGalois.fixedEigenformFamily_coeffChange [functoriality]: Coefficient extension and dualisation commute with the family.
  TauCeti.ModularGalois.fixedEigenformFamily_strict [characterisation]: Strictness requires full local data at all finite places, plus the prescribed Hodge/crystalline conditions.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.fixedEigenformFamily_delta [example]: For Δ, P_2=X²+24X+2048 in the arithmetic convention at every λ∤2.
  Test TauCeti.ModularGalois.fixedEigenformFamily_steinberg [compatibility]: The local parameter at 11 for 11a1 has N≠0 for λ above 11 as well as λ away from 11.
  Test TauCeti.ModularGalois.fixedEigenformFamily_weakNotStrict [non-example]: Coefficient-independent good-prime traces alone do not supply the WD parameter at v|λ.
  Test TauCeti.ModularGalois.fixedEigenformFamily_evenHilbert [example]: The full Skinner route covers an even-degree Hilbert form with no finite discrete-series place.

AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility
Full local–global compatibility away from the coefficient prime (theorem).
For every cohomological cuspidal Hilbert π over any totally real F, including even degree without a finite discrete-series place, and every v∤λ, WD(σ_π,λ|G_Fv)^{F-ss} is the full Hecke-normalised local Langlands parameter of π_v, including N. Translate to the arithmetic dual explicitly. This implies the local conductor and Euler-factor equalities in the matching normalisation. At a Steinberg place N≠0; traces or semisimplified inertia do not replace this assertion. Carayol proves the geometric subset; the all-Hilbert theorem uses the later extension cited by Skinner equation (1).
Hypotheses: Frobenius-semisimplification preserves the Jordan form of N. Carayol’s inverse central-character and half-norm twist conventions are kept distinct from Skinner’s Rec_v(π_v⊗|·|_v^{−1/2}).
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation, AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility, GL2AutomorphicRepresentationsAndTransfer:R16.3, GL2AutomorphicRepresentationsAndTransfer:R17.4.

AutomorphicGaloisRepresentations:R19.5/kisin-hilbert-coefficient-prime
Kisin’s coefficient-prime compatibility theorem (theorem).
Kisin Theorem 4.3: for any totally real F and cohomological Hilbert π of multiweight (k,w), if the semisimplified residual representation at λ|p is absolutely irreducible, σ_π,λ|G_Fv is potentially semistable of the prescribed labelled Hodge type for every v|p, and its Frobenius-semisimple WD representation corresponds to π_v, preserving N. No unramified-base-field, parallel-weight or finite discrete-series-place hypothesis is imposed on this theorem. In Kisin’s proof the semistable/potentially semistable fixed-type quotient and its period module are available for an arbitrary complete Noetherian local coefficient algebra A°, not only the universal deformation algebra.
Hypotheses: Residual absolute irreducibility is essential to this theorem’s route. The generic quotient property tests all finite Q_p-algebras, including algebras with nilpotents; field-valued points alone do not express it.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation, AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime, LocalGaloisDeformationRings:R08.3/semistable-height-quotient, LocalGaloisDeformationRings:R08.3, IntegralHeckeAndGaloisDeterminants:IHG.1.

AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime
Skinner’s full Hilbert coefficient-prime theorem (theorem).
For all cuspidal cohomological Hilbert π of infinity type (k,w), k_τ≥2 and k_τ≡w mod 2, over any totally real F, the representation in Skinner’s equation (1) is potentially semistable at every v|p and WD(ρ_π|G_Fv)^{F-ss}=ι Rec_v(π_v⊗|·|_v^{−1/2}). In his D_HT grading the two degrees at τ are (w−k_τ)/2 and (w+k_τ−2)/2. The theorem imposes neither residual absolute irreducibility nor an auxiliary discrete-series place. Translate this named representation to the packet’s cohomological/arithmetic convention by the local dictionary, retaining the dual and norm twist.
Hypotheses: The Hodge numbers are labelled by embeddings; the w and parity conditions are explicit. Generic period rings, D_pst and WD conversion are imported from R06, while this arithmetic theorem is owned here.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/all-cohomological-hilbert-representation, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility, PadicHodgeTheory:R06.3, PadicHodgeTheory:R06.5, GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift.

AutomorphicGaloisRepresentations:R19.5/ordinary-refinement-and-saturated-lattice
Ordinary refinement and saturated lattice (construction).
For a classical weight-k newform with p∤N, k≥2 and a_p a λ-adic unit, fix the unit Euler root α of X²−a_pX+ε(p)p^{k−1}. The imported R21.3 ordinary theorem supplies 0→V⁺→ρ_f,λ→V⁻→0, with V⁻ unramified and arithmetic Frobenius acting by α, and V⁺ character ε·χ_p^{k−1}·(V⁻)⁻¹. For a fixed stable lattice T, define T⁺=T∩V⁺ and T⁻=T/T⁺. Prove T⁺ saturated, T⁻ torsion-free of rank one, and compatibility with the chosen unit-root refinement and with the modular-symbol period line. For Hilbert forms import the labelled ordinary characters from R21.3 rather than applying this Q-formula to every multiweight.
Hypotheses: Good p and ordinary unit root; the other root has valuation k−1. The stable lattice and rational period lines are already fixed; this construction does not canonically normalise a numerical period.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent, AutomorphicGaloisRepresentations:R19.1/integral-structure-of-the-newform-premotive, OrdinaryAutomorphicFormsAndModularityLifting:R21.3, ArithmeticGaloisRepresentations:R01.1.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.ordinaryRefinement [constructor]: The unit root α and the imported ordinary filtration of the fixed representation.
  TauCeti.ModularGalois.ordinaryRefinement_quotient [projection]: The unramified quotient character with arithmetic Frob eigenvalue α.
  TauCeti.ModularGalois.ordinaryRefinement_subcharacter [characterisation]: The subcharacter is εχ_p^{k−1} times the inverse quotient character.
  TauCeti.ModularGalois.ordinaryLatticePlus [constructor]: T∩V⁺ as an invariant O_λ-submodule.
  TauCeti.ModularGalois.ordinaryLatticePlus_saturated [structure]: T/T⁺ is torsion-free of rank one.
  TauCeti.ModularGalois.ordinaryRefinement_coeffChange [functoriality]: Flat coefficient extension transports the line and lattice intersection with the appropriate saturation comparison.
  TauCeti.ModularGalois.ordinaryRefinement_period [compatibility]: Use the already specified rational period line under the realisation comparison.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.ordinaryRefinement_11a1_three [example]: X²+X+3 has one 3-adic unit root; choose that root for the unramified quotient.
  Test TauCeti.ModularGalois.ordinaryRefinement_11a1_two [non-example]: X²+2X+2 at 2 has no unit root; ordinary refinement is not defined.
  Test TauCeti.ModularGalois.ordinaryLatticePlus_saturation [non-example]: In T=O² with V⁺=Ke₁ the intersection is Oe₁; pOe₁ has torsion quotient and fails the contract.
  Test TauCeti.ModularGalois.ordinaryRefinement_determinant [compatibility]: The two characters multiply to εχ_p^{k−1}, including the unramified unit-root factor.

AutomorphicGaloisRepresentations:R19.5/good-nonordinary-crystalline-wach-realisation
Nonordinary crystalline and Wach realisation (construction).
For p∤N and any classical k≥2, identify D_cris of the cohomological eigenform realisation M_f,λ with its crystalline projector factor, with Hodge filtration in degrees 0,k−1 and φ-polynomial X²−a_pX+ε(p)p^{k−1}. For a fixed lattice, import P7’s Wach module in its admissible weight convention, with the dual/Tate twist recorded when required. Identify (N(T)/π)[1/p] with D_cris(T[1/p]) in that convention; N(T)/π itself is an integral O_λ-lattice. Transport φ and the filtration. A basis gives a semilinear Wach Frobenius matrix; basis change acts by U⁻¹Pφ(U), so this matrix is not canonical. The two Euler roots used by signed regulators are roots of this polynomial after coefficient extension. If they repeat, do not claim two independent eigenlines or invert their difference.
Hypotheses: Good reduction; no ordinarity assumption. A signed regulator itself belongs to its Iwasawa owner. Fix the P7 Wach weight convention and explicit dual/twist before comparing to M; no Fontaine–Laffaille bound is imposed on crystalline existence. A diagonalisation/eigenline comparison requires distinct roots and a splitting coefficient extension.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime, AutomorphicGaloisRepresentations:R19.1/integral-structure-of-the-newform-premotive, PadicHodgeTheory:P7/wach-dcris-comparison, PadicHodgeTheory:P7.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.eigenformDcris [constructor]: The crystalline factor of the cohomological eigenform realisation.
  TauCeti.ModularGalois.eigenformDcris_charpoly [characterisation]: φ has the Hecke Euler-root polynomial in the stated cohomological convention.
  TauCeti.ModularGalois.eigenformWach [constructor]: The P7 Wach module of the fixed lattice in its declared dual/twist convention.
  TauCeti.ModularGalois.eigenformWach_modParameter [equivalence]: The quotient N(T)/π is an integral O_λ-lattice; after inverting p it identifies with D_cris(T[1/p]), compatibly with φ and the declared filtration convention.
  TauCeti.ModularGalois.eigenformWach_changeBasis [functoriality]: A semilinear matrix changes by U⁻¹Pφ(U).
  TauCeti.ModularGalois.eigenformWach_roots [compatibility]: After coefficient extension the regulator roots coincide with the crystalline roots; separate distinct and repeated roots.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.eigenformDcris_11a1_two [example]: At 2 the polynomial X²+2X+2 has slopes 1/2,1/2 and gives a good nonordinary example.
  Test TauCeti.ModularGalois.eigenformWach_twist [compatibility]: Dual/Tate-twist transport changes φ eigenvalues and Hodge degrees according to the imported period-functor laws.
  Test TauCeti.ModularGalois.eigenformWach_basis [invariance]: Changing the basis preserves the φ-module under semilinear conjugation, not under ordinary matrix conjugation alone.
  Test TauCeti.ModularGalois.eigenformWach_repeatedRoot [non-example]: For a two-dimensional Jordan φ-module with repeated root, the two formal roots do not provide two independent eigenlines.
  Test TauCeti.ModularGalois.eigenformWach_integralQuotient [non-example]: For a rank-one trivial crystalline Z_p-lattice, N(T)/π≅Z_p while D_cris(Q_p)≅Q_p. They identify after inverting p, not as integral modules.

AutomorphicGaloisRepresentations:R19.5/endpoint-weight-local-contract
Endpoint-weight local contract (theorem).
For a good-prime classical eigenform of weight k=p+1, the coefficient-prime theorem still gives a crystalline characteristic-zero representation with arithmetic Hodge weights {0,p} and its full local parameter. The integral Fontaine–Laffaille comparison used for the chosen parabolic lattice requires [0,k−1]⊆[0,p−2] and therefore does not apply. Weight p+1 alone does not imply that this representation is Barsotti–Tate or that its residual inertial type has a prescribed ordinary/flat lift. Any such lifting conclusion must specify a different weight-two potentially Barsotti–Tate lift, a residual weight/type comparison and its hypotheses from R07/R20/R21; no endpoint conclusion is read off a_p alone.
Hypotheses: p∤N; ordinary refinements additionally require a_p a unit. Keep characteristic-zero Hodge type, residual Serre weight and the type of a chosen deformation lift distinct.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime, AutomorphicGaloisRepresentations:R19.5/hilbert-local-behaviour-at-p, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, SerreWeightAndLevelOptimisation:R20.6.

AutomorphicGaloisRepresentations:R19.2/ordinary-cm-primes-split
Ordinary CM primes split (theorem).
For a regular cohomological CM Hilbert form f=AI_L^F(α) that is p-ordinary at every v|p, each v|p splits in the CM quadratic extension L/F, and the inducing character has a p-ordinary CM type compatible with the chosen embeddings. For the Hara–Ochiai converse retain the source’s p-ordinary CM-type/infinity-type hypothesis; splitting alone without that hypothesis is not the stated iff criterion.
Hypotheses: CM is a hypothesis of Hara–Ochiai Proposition A.3; the theorem is not for arbitrary ordinary Hilbert forms. Regular weights make the two inducing local characters distinct; arbitrary index-two induction need not be locally irreducible.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/cm-hilbert-eigenform, OrdinaryAutomorphicFormsAndModularityLifting:R21.3, GL2AutomorphicRepresentationsAndTransfer:R17.5.

AutomorphicGaloisRepresentations:R19.2/cm-ordinary-line-complex-conjugation
Complex conjugation moves the CM ordinary line (theorem).
Dasgupta–Kakde Lemma 9.2: for a regular p-ordinary CM Hilbert eigenform induced from L/F and v|p, the specified ordinary line V_v,f is not stable under ρ_f(τ) for any τ∈G_F restricting to the nontrivial complex conjugation on L. Since v splits, G_Fv⊂G_L. With distinct ordinary local characters, the ordinary line is one of the two global G_L-character lines, and τ interchanges them.
Hypotheses: Retain k>1 and the distinct local characters used in the source (one ramified, one unramified in its setup). An arbitrary invariant line when the two local characters coincide does not satisfy this argument.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.2/ordinary-cm-primes-split, AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility, OrdinaryAutomorphicFormsAndModularityLifting:R21.3.

AutomorphicGaloisRepresentations:R19.5/shimura-curve-hk-dR-multiplicity
Hyodo–Kato and de Rham automorphic multiplicities (theorem).
In CDN §5.2.1 let F/Q_p be finite, E totally real with E_𝔭=F, B̌/E ramified at 𝔭 and split at exactly one real place, and B its inner form split at 𝔭 and compact at infinity, with the other local invariants as in the source. Let M∈ΦN^ϖ be a two-dimensional supercuspidal (φ,N,G_F)-module over L with ϖ acting trivially on JL(M), choose n such that JL(M) is trivial on 1+ϖ_D^n O_D, and take Π̌∈SD_{2,n} defined over L with Π̌_𝔭=JL(M). Here SD₂ imposes the holomorphic discrete-series representation of weight two and trivial central character at the distinguished real place ∞₀, and the trivial representation at every other real place; a globally trivial central character is not assumed. Write Π_f^p=Π̌_f^p and Sh_n for the quaternionic Shimura-curve tower. Then Hom_{Ǧ(A_f^p)}(Π_f^p,L⊗Q_p H_HK¹(Sh_n))≅JL(M)⊗_L M. For F⊆K, Hom_{Ǧ(A_f^p)}(Π_f^p,L⊗Q_p H_dR¹(Sh_n,K))≅JL(M)⊗_L(K⊗_F M_dR). The isomorphisms respect the period structures, local group action and comparison map with the source’s coefficient completions.
Hypotheses: Retain the globalisation, ϖ-compatibility, level n, weight-two archimedean type, supercuspidal parameter and coefficient-field hypotheses. Globalisation can require a character twist and a finite extension of L (CDN footnote 21). For de Rham cohomology K contains E and F via the fixed embedding E→E_𝔭=F→K. This is an automorphic multiplicity extraction, not a claim about the entire cohomology or a new local p-adic Langlands construction.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility, HilbertModularVarietiesAndShimuraCurves:R18.4, PadicHodgeTheory:R06.5, GL2AutomorphicRepresentationsAndTransfer:R17.3, GL2AutomorphicRepresentationsAndTransfer:R16.6.

AutomorphicGaloisRepresentations:R19.3/skinner-density-one-ordinary-primes
Density-one ordinary primes in weight two (theorem).
For the non-CM weight-two newform f of squarefree level N and trivial nebentypus in Skinner 2020 §3, the rational primes p∤N for which f is ordinary at some λ|p have density one. For all sufficiently large such p, every λ|p has absolutely irreducible residual representation, and that residual representation is ramified at every q|N. Thus one may choose p≥5 and λ|p ordinary while retaining all these residual conditions. The quantifier for ordinarity is some λ, while the eventual irreducibility/ramification statements hold for every λ.
Hypotheses: Fixed non-CM weight-two form; retain squarefree N and trivial character for this routed level-lowering argument. Exclude finitely many coefficient ramification and small primes.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.3/ribet-momose-classical-large-image, ArithmeticGaloisRepresentations:R01.5, SerreWeightAndLevelOptimisation:R20.2, GL2AutomorphicRepresentationsAndTransfer:R16.6, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family.

AutomorphicGaloisRepresentations:R19.6/geometric-hecke-determinant
Geometric determinant over the integral Hecke algebra (construction).
Let O be a complete coefficient DVR and T_m the completed local finite O-flat Hecke algebra of the fixed classical/Hilbert geometric eigensystem, allowing nilpotents. Extract from cohomology a faithful continuous generic rank-two T_m[1/p]-module with G_{F,S}-action commuting with T_m, retaining generalised oldform eigenspaces where present. Its determinant polynomial law descends to a continuous degree-two law D:T_m[G_{F,S}]→T_m: the good-prime coefficients are T_v and Nv S_v in the geometric-Frobenius convention, and all finite-quotient specialisations have the induced law. This descent retains the entire integral ring, not merely its reduced eigenform points. For torsion/non-flat Hecke settings the missing integral cohomological determinant construction is explicitly a gap, not an inference from field-valued points.
Hypotheses: T_m is O-flat, so T_m→T_m[1/p] is injective even if T_m is nonreduced. The generic rank-two module is supplied by the geometric multiplicity-space construction, not reconstructed from reduced points. The arithmetic-dual convention must be translated before using a universal arithmetic deformation problem.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent, AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction, AutomorphicGaloisRepresentations:R19.6/full-weight-two-hecke-algebra-and-its-galois-representations, IntegralHeckeAndGaloisDeterminants:IHG.4, ArithmeticGaloisRepresentations:R01.5, HilbertModularVarietiesAndShimuraCurves:R18.4.
API signatures (unavailable carriers remain omitted):
  TauCeti.ModularGalois.geometricHeckeDeterminant [constructor]: The integral degree-two law from the actual geometric generic rank-two Hecke family.
  TauCeti.ModularGalois.geometricHeckeDeterminant_goodFrob [simp]: Its characteristic polynomial at good geometric Frobenius has coefficients T_v,Nv S_v.
  TauCeti.ModularGalois.geometricHeckeDeterminant_continuous [structure]: Compatible continuous laws over all finite quotients T_m/m^n.
  TauCeti.ModularGalois.geometricHeckeDeterminant_coeffChange [functoriality]: Coefficient quotient/extension commutes with the geometric determinant.
  TauCeti.ModularGalois.geometricHeckeDeterminant_residual [compatibility]: Reduction identifies with det ρ̄ of the residual eigensystem.
  TauCeti.ModularGalois.geometricHeckeDeterminant_wholeRing [characterisation]: All identities hold over T_m, including its nilpotents, rather than only T_m,red.
Tests (unavailable geometry is not replaced by a numerical placeholder):
  Test TauCeti.ModularGalois.geometricHeckeDeterminant_dualNumbers [non-example]: Over A=k[ε]/ε², diag(1+ε,1) and identity have the same reduced point but different determinant at the generator of an infinite cyclic group.
  Test TauCeti.ModularGalois.geometricHeckeDeterminant_finiteQuotients [compatibility]: Reduction from T_m/m^{n+1} to T_m/m^n agrees with the n-th law.
  Test TauCeti.ModularGalois.geometricHeckeDeterminant_characteristicTwo [example]: The cross coefficient tr(g)tr(h)−tr(gh) is integral in characteristic two; no 1/2 formula is used.
  Test TauCeti.ModularGalois.geometricHeckeDeterminant_oldspace [example]: Retain the nonzero nilpotent u(u²+2u+2) in the level-88 old Hecke factor instead of replacing that factor by its reduced quotient.

AutomorphicGaloisRepresentations:R19.6/hecke-family-local-conditions
Local conditions of the integral Hecke family (theorem).
For the reconstructed continuous Hecke-algebra representation with specified absolutely irreducible residual representation, prove determinant and ramification conditions over T_m and all finite quotients. For a chosen deformation condition at each v, verify factorisation through its representing local quotient (fixed determinant, minimal/unramified, ordinary flagged, or potentially semistable with specified Hodge/inertial type) and hence construct the map from the global universal deformation ring. Verification at characteristic-zero eigenform fields alone proves the condition only on the reduced generic fibre. For an O-flat family, a defining ideal vanishing over the whole generic algebra, including its nilpotents, vanishes integrally; use finite-algebra period-family or geometric flagged conditions to establish that premise. Integral flat/ordinary conditions at torsion quotients require their exact deformation-functor argument.
Hypotheses: Local conditions are specified functors/quotients, not the open assertion N≠0 at every Artinian point. An ordinary condition may require a chosen invariant saturated line and character; traces alone do not choose a flag. Do not assume Artinian quotients of T_m embed into products of eigenform field quotients.
Required imported carriers/interfaces: AutomorphicGaloisRepresentations:R19.6/geometric-hecke-determinant, AutomorphicGaloisRepresentations:R19.6/determinants-and-representability-over-a-hecke-algebra, AutomorphicGaloisRepresentations:R19.5/ordinary-refinement-and-saturated-lattice, AutomorphicGaloisRepresentations:R19.5/kisin-hilbert-coefficient-prime, GlobalGaloisDeformations:R04.3, LocalGaloisDeformationRings:R08.3.

-/
