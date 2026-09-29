/-
Suggested Lean prototypes for the roadmap "Modular Curves PartII" (ModularCurvesPartII), part R12.1 (stages
R12.1–R13.2).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ModularCurvesPartII--R12.1.md` is definitive. The statements below suggest Lean forms so that
contributors and reviewers converge on names and signatures. Every proof of a planned result that is not a short
computation is `sorry`; nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

Names are relative to the namespace `TauCeti.ModularCurves` and agree with the `api` and `tests` names of the packet
`research/blueprint/packets/ModularCurvesPartII--R12.1.json`. Unit tests are `example`s whose docstring begins
"Test `<name>`". Objects of other roadmaps are never invented here: semistable curves over a base, Artin stacks
(AlgebraicModuliForArithmeticGeometry R09.5), elliptic curves over a base with their group law and Drinfeld level
structures (Tau Ceti ModularCurves Layers 1 and 3) are not available at the pinned commits, so `DRSemistableGenusOne`,
`neronPolygon`, `GeneralizedEllipticCurve`, `IsCyclicSubgroup`, the level structures and the moduli stacks are comments
naming the missing object.

What is prototyped is the arithmetic those objects carry: the nodal-cubic parametrisation of the 1-gon, the automorphism
group of the n-gon, the rank of the scheme of generators, the admissibility condition on (N, n), and the ranks of the
contraction maps.
-/

import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.Tactic.Ring

namespace TauCeti.ModularCurves

/-! ## R13.1 — Néron polygons and generalized elliptic curves
(`ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `…:R13.1/generalized-elliptic-curve`)

`DRSemistableGenusOne`, `neronPolygon`, `GeneralizedEllipticCurve`, `aut_neronPolygon`: not stated (semistable curves over
a base). -/

/-- Test `neronOneGon_nodal`: `t ↦ (t² + 1, t(t² + 1))` lands on the nodal cubic `y² = x³ − x²`. -/
example {R : Type*} [CommRing R] (t : R) :
    (t * (t ^ 2 + 1)) ^ 2 = (t ^ 2 + 1) ^ 3 - (t ^ 2 + 1) ^ 2 := by
  ring

/-- Test `aut_neronPolygon_order` (its group theory): `⟨inv⟩ ⋉ μ_n` over `k̄` with `char k ∤ n` is dihedral of order
`2n`; for `n = 5` it has `10` elements. -/
example : Fintype.card (DihedralGroup 5) = 10 := by
  rw [DihedralGroup.card]

/-! ## R13.1 — cyclicity (`…:R13.1/drinfeld-structures-and-cyclicity`)

`IsCyclicSubgroup`, `generatorScheme`, `standardSubgroup`: not stated (finite locally free group schemes). -/

/-- Test `generatorScheme_mu` (its rank): `μ_N^× = Spec ℤ[T]/Φ_N(T)` has rank `deg Φ_N = φ(N)`; for `N = 6` it is `2`. -/
example : (Polynomial.cyclotomic 6 ℤ).natDegree = 2 := by
  rw [Polynomial.natDegree_cyclotomic]
  decide

/-! ## R13.2 — level structures (`…:R13.2/gamma-level-structures`) -/

/-- `AdmissibleLevel`: `(N, n)` is admissible for `Γ₁(N; n)` if `ord_p(n) ≤ ord_p(N)` for every prime `p ∣ gcd(N, n)`. -/
def AdmissibleLevel (N n : ℕ) : Prop :=
  ∀ p : ℕ, p.Prime → p ∣ Nat.gcd N n → padicValNat p n ≤ padicValNat p N

/-- Test `admissibleLevel_N_one`: `(1, n)` is admissible for every `n` (the `Γ₀(n)` case). -/
example (n : ℕ) : AdmissibleLevel 1 n := by
  intro p hp hd
  simp only [Nat.gcd_one_left, Nat.dvd_one] at hd
  exact absurd hd hp.one_lt.ne'

/-- Test `not_admissibleLevel_p_psq`: `(2, 4)` is not admissible, since `ord₂(4) = 2 > 1 = ord₂(2)`. -/
example : ¬ AdmissibleLevel 2 4 := by
  intro h
  have := h 2 Nat.prime_two (by decide)
  have h4 : padicValNat 2 4 = 2 := by
    have : (4 : ℕ) = 2 ^ 2 := by norm_num
    rw [this, padicValNat.prime_pow]
  rw [h4, padicValNat_self] at this
  omega

/-! ## R13.2 — the moduli stacks and contraction maps (`…:R13.2/moduli-stacks-are-proper-flat-artin`,
`…:R13.2/contraction-maps-between-levels`, `…:R13.2/agreement-with-katz-mazur-schemes`)

The stacks `M_Γ` and their properties: not stated (Artin stacks, R09.5). The ranks of the contraction maps are below. -/

/-- Acceptance (`…:R13.2/contraction-maps-between-levels` (1), `N = p`): the rank `p(p − 1)` is
`|GL₂(𝔽_p)| / (p² − 1)`. -/
example (p : ℤ) : (p ^ 2 - 1) * (p ^ 2 - p) = (p ^ 2 - 1) * (p * (p - 1)) := by
  ring

/-- Acceptance (`…:R13.2/contraction-maps-between-levels` (4), `N = p`): `M_{Γ₁(p)} → M_{Γ₀(p)}` has rank `φ(p) = p − 1`;
for `p = 11` it is `10`. -/
example : Nat.totient 11 = 10 := by decide

end TauCeti.ModularCurves
