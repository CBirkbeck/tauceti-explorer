/-
Suggested Lean prototypes for the roadmap "Modular Curves PartII" (ModularCurvesPartII), part R13.3 (stages
R13.3–R14.2).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ModularCurvesPartII--R13.3.md` is definitive. The statements below suggest Lean forms so that
contributors and reviewers converge on names and signatures. Every proof of a planned result that is not a short
computation is `sorry`; nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

Names are relative to the namespace `TauCeti.ModularCurves` and agree with the `api` and `tests` names of the packet
`research/blueprint/packets/ModularCurvesPartII--R13.3.json`. Unit tests are `example`s whose docstring begins
"Test `<name>`". Objects of other roadmaps are never invented here: the moduli curves `X₁(N)`, `X₁(N, p)` (this roadmap's
R13.2), quotients of elliptic curves by finite flat subgroups (Tau Ceti ModularCurves §2B), Jacobian schemes (Tau Ceti
JacobianChallenge layer D) and Néron models (NeronModelsAndSemistableAbelianVarieties R11.4) are not available at the
pinned commits, so `degeneracy1`, `degeneracy2`, `diamond`, `atkinLehner`, `J1`, `heckeUpper`, `heckeLower` and
`heckeAlgebraUpper` are comments naming the missing object. The composition law at coprime indices is Tau Ceti's
`HeckeRing.GL2.heckeT_mul_of_coprime`.

What is prototyped is the arithmetic those objects compute: the degrees of the degeneracy maps, the analytic
Atkin–Lehner involution, and the size of the diamond group.
-/

import Mathlib.Data.Nat.Totient
import Mathlib.Basic.Complex.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum

namespace TauCeti.ModularCurves

/-! ## R14.1 — the Hecke correspondence (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`)

`X1Np`, `degeneracy1`, `degeneracy2`, `heckeCorr`: not stated; they need `X₁(N, p)` (R13.2) and quotients `E/C`. -/

/-- `degree_degeneracy`: `deg π_i^{(p)}` is `p + 1` for `p ∤ N` (all subgroups of order `p`) and `p` for `p ∣ N` (all but
the one meeting `⟨P⟩`). -/
def degeneracyDegree (N p : ℕ) : ℕ := if p ∣ N then p else p + 1

/-- Test `degree_degeneracy_coprime`: `N = 11`, `p = 2` gives `3`. -/
example : degeneracyDegree 11 2 = 3 := by decide

/-- Test `degree_degeneracy_dvd`: `N = 10`, `p = 5` gives `5`. -/
example : degeneracyDegree 10 5 = 5 := by decide

/-- Acceptance (`…:R14.1/composition-relations-of-correspondences`): `X₁(11, 6) → X₁(11)` has degree
`deg π^{(2)} · deg π^{(3)} = 3 · 4 = 12`. -/
example : degeneracyDegree 11 2 * degeneracyDegree 11 3 = 12 := by decide

-- Test `degree_degeneracy` (its geometric content): the lines of `𝔽_p²` number `p + 1`.
example (p : ℕ) [Fact p.Prime] :
    Nat.card {W : Submodule (ZMod p) (Fin 2 → ZMod p) // Module.finrank (ZMod p) W = 1} = p + 1 :=
  sorry

/-! ## R14.1 — diamond and Atkin–Lehner operators (`…:R14.1/diamond-operators`, `…:R14.1/atkin-lehner-involution`,
`…:R14.1/analytic-comparison-of-correspondences`)

`diamond`, `atkinLehner` on `X₁(N)`: not stated (R13.2). Their analytic shadows are below. -/

/-- The analytic Atkin–Lehner map `w_N : z ↦ −1/(Nz)`, the analytification of `w_{e^{2πi/N}}`. -/
noncomputable def atkinLehnerAnalytic (N : ℂ) (z : ℂ) : ℂ := -1 / (N * z)

/-- Test `atkinLehner_sq_eq_id` (analytically): `w_N ∘ w_N = id` away from `0`. -/
theorem atkinLehnerAnalytic_involutive (N z : ℂ) (hN : N ≠ 0) (hz : z ≠ 0) :
    atkinLehnerAnalytic N (atkinLehnerAnalytic N z) = z := by
  unfold atkinLehnerAnalytic
  field_simp

/-- Test `diamond_group_order_11`: `(ℤ/11)^×/{±1}` has order `φ(11)/2 = 5`. -/
example : Nat.totient 11 / 2 = 5 := by decide

/-! ## R14.2 — the Jacobian and its Hecke algebra (`…:R14.2/jacobian-and-functoriality`,
`…:R14.2/hecke-operators-on-the-jacobian`, `…:R14.2/integral-hecke-algebra`, `…:R14.2/weil-pairing-adjointness`,
`…:R14.2/tate-module-with-galois-and-hecke-actions`)

`J1`, `J0`, `picZero_map`, `albanese_map`, `heckeUpper`, `heckeLower`, `heckeAlgebraUpper` and the adjointness and
Tate-module statements: not stated; they need Jacobian schemes, the Néron property and Tate modules. -/

/-- Test `albanese_comp_picZero_degeneracy` (its arithmetic): `(π₁)_* ∘ (π₁)^* = [deg π₁]`, which is `[p + 1]` for
`p ∤ N`; for `N = 11`, `p = 2` it is `[3]`. -/
example : degeneracyDegree 11 2 = 2 + 1 := by decide

end TauCeti.ModularCurves
