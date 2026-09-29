/-
Suggested Lean prototypes for the roadmap "Automorphic Galois Representations PartII"
(AutomorphicGaloisRepresentationsPartII), part AG2.6 (stages AG2.6–AG2.7).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicGaloisRepresentationsPartII--AG2.6.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. Every proof of a planned
result that is not a short computation is `sorry`; nothing here is claimed to be formalised (implementationStatus =
unchecked). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only
Mathlib is imported.

Names are relative to the namespace `TauCeti.AutomorphicGalois` and agree with the `api` and `tests` names of the packet
`research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json`. Unit tests are `example`s whose docstring
begins "Test `<name>`". Objects of other roadmaps are never invented here: weakly compatible systems are
PotentialModularityAndCompatibleSystems R24.5's (`TauCeti.CompatibleSystems.WeaklyCompatibleSystem`), continuous `ℓ`-adic
representations and lattices are ArithmeticGaloisRepresentations R01's, and the unramified Hecke algebra is
IntegralHeckeAndGaloisDeterminants IHG.3's; none is available at the pinned commits, so `VeryWeaklyCompatibleSystem`,
`compatibleSystem`, `residualRep`, `IsGaloisType` and the theorems about them are comments naming the missing object.

What is prototyped is the local condition of decomposed genericity on a list of Frobenius eigenvalues, with its unit tests,
and the Hodge–Tate arithmetic of the determinant and of the purity weight.
-/

import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FinCases

namespace TauCeti.AutomorphicGalois

/-! ## AG2.7 — decomposed genericity (`AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`)

`IsGeneric` for a representation `r : G_L → GL_n(k)` is: `r` unramified and `IsGenericEigenvalues` of the eigenvalues of
`r(Frob_L)` with `q = |O_L/m_L|`. `IsDecomposedGenericPrime`, `IsDecomposedGeneric` and their lemmas need Galois
representations of number fields; not stated. -/

/-- ACC+ Definition 4.3.1(1), on eigenvalues: `α_i / α_j ≠ q` for all `i ≠ j` (with multiplicity). -/
def IsGenericEigenvalues {k : Type*} [Field k] {n : ℕ} (α : Fin n → k) (q : k) : Prop :=
  ∀ i j, i ≠ j → α i / α j ≠ q

/-- Test `isGeneric_repeated_eigenvalue`: over `𝔽₃` with `q ≡ 2`, the repeated eigenvalue `(1, 1)` is generic. -/
example : IsGenericEigenvalues ![(1 : ZMod 3), 1] 2 := by
  intro i j _
  fin_cases i <;> fin_cases j <;> simp <;> decide

/-- `𝔽₅` is a field, for the next test. -/
instance fact_prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-- Test `not_isGeneric_distinct_ratio_q`: over `𝔽₅` with `q ≡ 2`, the distinct eigenvalues `(2, 1)` have ratio `q`. -/
example : ¬ IsGenericEigenvalues ![(2 : ZMod 5), 1] 2 := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test `isGeneric_rank_one`: a single eigenvalue is always generic. -/
example {k : Type*} [Field k] (a q : k) : IsGenericEigenvalues ![a] q := by
  intro i j hij
  fin_cases i
  fin_cases j
  exact absurd rfl hij

/-- `IsGeneric.projective`: scaling all eigenvalues by a unit does not change genericity. -/
theorem isGenericEigenvalues_smul {k : Type*} [Field k] {n : ℕ} (α : Fin n → k) (q c : k) (hc : c ≠ 0) :
    IsGenericEigenvalues (fun i => c * α i) q ↔ IsGenericEigenvalues α q := by
  unfold IsGenericEigenvalues
  refine forall_congr' fun i => forall_congr' fun j => imp_congr_right fun _ => ?_
  rw [mul_div_mul_left _ _ hc]

/-! ## AG2.6 — the system of π (`…:AG2.6/compatible-system-of-pi`, `…:AG2.6/polarized-compatible-system-strictly-pure`)

`compatibleSystem`, `VeryWeaklyCompatibleSystem`, `ExtremelyWeaklyCompatibleSystem`: not stated (R24.5, R01, AF.4). The
Hodge–Tate arithmetic they use is below. -/

/-- `compatibleSystem_det_hodgeTate` (the arithmetic): the Hodge–Tate number of `det r_{π,λ}` is
`Σ_i (a_i + n − 1 − i) = Σ_i a_i + n(n − 1)/2`. -/
theorem sum_expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) :
    ∑ i : Fin n, (a i + ((n - 1 - i : ℕ) : ℤ)) = ∑ i : Fin n, a i + ((n * (n - 1) / 2 : ℕ) : ℤ) :=
  sorry

/-- Acceptance (`…:AG2.6/compatible-system-of-pi`, `n = 2`, `a = (k − 2, 0)`): `HT(det) = (k − 1) + 0 = k − 1`. -/
example (k : ℤ) : ((k - 2) + ((2 - 1 - 0 : ℕ) : ℤ)) + (0 + ((2 - 1 - 1 : ℕ) : ℤ)) = k - 1 := by
  norm_num
  ring

/-- Acceptance (`…:AG2.6/polarized-compatible-system-strictly-pure`): the purity weight is `w + n − 1`; for the base change
of a weight-`k` newform (`n = 2`, `w = k − 2`) it is `k − 1`, and the weight of `{r_{l,ι}(χ)}` is `2w`. -/
example (k : ℤ) : (k - 2) + 2 - 1 = k - 1 ∧ 2 * (k - 2) = 2 * ((k - 2) + 2 - 1 + 1 - 2) := by
  constructor <;> ring

/-! ## AG2.7 — residual representations and Galois type
(`…:AG2.7/residual-representation-of-pi`, `…:AG2.7/hecke-maximal-ideal-of-galois-type`)

`residualRep`, `exists_finite_field_of_realisation`, `residualRep_extendGn`, `IsGaloisType`, `IsNonEisenstein` and
`maxIdealOf`: not stated; they need continuous representations with lattices (R01.1), the group `𝒢_n`
(GlobalGaloisDeformations G7) and the unramified Hecke algebra `𝕋^S` (IHG.3).

sourceIssue AutomorphicGaloisRepresentationsPartII/E3: the last term of the Hecke polynomial is `(−1)ⁿ q^{n(n−1)/2} T_{v,n}`;
for `n = 1` the polynomial is `X − T_{v,1}`. -/

/-- Test for E3 (`n = 1`): the `i = n` term of `Σ (−1)^i q^{i(i−1)/2} T_i X^{n−i}` is `−T₁`, not `+T₁`. -/
example (q T : ℤ) : (-1 : ℤ) ^ 1 * q ^ (1 * (1 - 1) / 2) * T = -T := by
  norm_num

end TauCeti.AutomorphicGalois
