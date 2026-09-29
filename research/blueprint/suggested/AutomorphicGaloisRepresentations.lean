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

/-! ## Theorems needing objects of other roadmaps

* `…:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`, `…:R19.1/weight-one-artin-representation`,
  `…:R19.2/hilbert-modular-compatible-system-carayol-theorem-A`, `…:R19.3/strict-compatibility-and-the-monodromy-weight-purity`,
  `…:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`,
  `…:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`,
  `…:R19.6/determinants-and-representability-over-a-hecke-algebra`: not stated; they need continuous Galois
  representations of `G_ℚ` with coefficients, Weil–Deligne representations and local Langlands.
-/

end TauCeti.ModularGalois
