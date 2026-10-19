/-
Suggested Lean forms for the roadmap "Ordinary automorphic forms and ordinary modularity lifting,
Part II: dyadic unitary and symplectic ordinary lifting".

This file is not the roadmap and is not exhaustive: the roadmap document is definitive, and the
statements below only suggest Lean forms so that contributors and reviewers converge on names and
signatures. It states and does not develop. The deformation rings, Hecke algebras, patched modules
and the two R = T theorems (layers OL.0–OL.5) have no carriers at the pinned Mathlib and Tau Ceti,
so they are targets of the roadmap document, not declarations here. What is stated here is the
part with carriers at the pins: the trace-annihilator of weak adequacy (OL.0), the weight twist of
the universal ordinary Hecke algebra (OL.1), sufficient depth for a family of local representations
(OL.2), and the dimension identities behind the two patching arguments (OL.3, OL.5).
-/
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Semisimple
import Mathlib.Algebra.CharP.Defs
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Tactic.Ring

namespace OrdinaryPartII

open Matrix

/-! ### OL.0: weak adequacy through the trace-annihilator (BCGP Lemma 5.3.1) -/

section TraceAnnihilator

variable {k : Type*} [Field k] {n : Type*} [Fintype n] [DecidableEq n]

/-- The trace-annihilator `U = {w | tr (g w) = 0 for all g ∈ S}` of a set of matrices
(Thorne 2012, proof of Lemma A.1; BCGP, Lemma 5.3.1). -/
def traceAnnihilator (S : Set (Matrix n n k)) : Submodule k (Matrix n n k) where
  carrier := {w | ∀ g ∈ S, (g * w).trace = 0}
  add_mem' := by
    intro a b ha hb g hg
    simp [Matrix.mul_add, Matrix.trace_add, ha g hg, hb g hg]
  zero_mem' := by
    intro g _
    simp
  smul_mem' := by
    intro c w hw g hg
    simp [Matrix.trace_smul, hw g hg]

/-- The semisimple elements of a subgroup `H ⊆ GL_n(k)`, as matrices. Over a finite field `k`
(perfect), semisimple over `k` is diagonalizable over an algebraic closure. -/
def semisimpleElements (H : Subgroup (GeneralLinearGroup n k)) : Set (Matrix n n k) :=
  {M | ∃ h ∈ H, ((h : GeneralLinearGroup n k) : Matrix n n k) = M ∧ Module.End.IsSemisimple (Matrix.toLin' M)}

/-- BCGP Lemma 5.3.1, (3) ⇔ (U = 0): the semisimple elements of `H` span all matrices exactly
when their trace-annihilator vanishes. This is the form of weak adequacy used in near adequacy
(`PotentialAutomorphyInfrastructurePartII`, relaxed adequacy). -/
theorem weaklyAdequate_iff_traceAnnihilator_eq_bot (H : Subgroup (GeneralLinearGroup n k)) :
    Submodule.span k (semisimpleElements H) = ⊤ ↔
      traceAnnihilator (semisimpleElements H) = ⊥ := by
  sorry

/-- The trace-annihilator lies in the trace-zero matrices (take `g = 1`). -/
theorem trace_eq_zero_of_mem_traceAnnihilator (H : Subgroup (GeneralLinearGroup n k))
    {w : Matrix n n k} (hw : w ∈ traceAnnihilator (semisimpleElements H)) : w.trace = 0 := by
  sorry

/-- The trace-annihilator is stable under conjugation by `H`. -/
theorem conj_mem_traceAnnihilator (H : Subgroup (GeneralLinearGroup n k))
    {w : Matrix n n k} (hw : w ∈ traceAnnihilator (semisimpleElements H))
    {h : GeneralLinearGroup n k} (hh : h ∈ H) :
    (h : Matrix n n k) * w * ((h⁻¹ : GeneralLinearGroup n k) : Matrix n n k) ∈
      traceAnnihilator (semisimpleElements H) := by
  sorry

example (S : Set (Matrix n n k)) : (0 : Matrix n n k) ∈ traceAnnihilator S :=
  (traceAnnihilator S).zero_mem

end TraceAnnihilator

/-! ### OL.0: the scalar pairing in Lemma 5.5.3 -/

/-- `tr (1_m) = m` vanishes in characteristic two when `m` is even: the Tate pairing on the scalar
classes of `ad r̄` is `m` times the pairing on `k`, hence zero (proof of BCGP Lemma 5.5.3). -/
theorem trace_one_eq_zero_of_even {k : Type*} [Field k] [CharP k 2] {m : ℕ} (hm : Even m) :
    (1 : Matrix (Fin m) (Fin m) k).trace = 0 := by
  rw [Matrix.trace_one, Fintype.card_fin]
  exact (CharP.cast_eq_zero_iff k 2 m).mpr (even_iff_two_dvd.mp hm)

example {k : Type*} [Field k] [CharP k 2] : (1 : Matrix (Fin 4) (Fin 4) k).trace = 0 :=
  trace_one_eq_zero_of_even ⟨2, rfl⟩

/-! ### OL.1: the weight twist of the universal ordinary Hecke algebra -/

section WeightTwist

variable {M : Type*} [CommGroup M]

/-- The character `u ↦ ∏_{i=1}^{n} u_i^{1-i}` of the diagonal torus (indices from `0` here, so
the exponent is `-i`) that twists the diamond operators in the `Λ`-structure of the universal
ordinary Hecke algebra (BCGP §5.7; one factor for each embedding `τ`). -/
def weightTwist (n : ℕ) (u : Fin n → M) : M :=
  ∏ i : Fin n, u i ^ (-((i : ℕ) : ℤ))

/-- For `n = 1` the twist is trivial. -/
theorem weightTwist_one (u : Fin 1 → M) : weightTwist 1 u = 1 := by
  simp [weightTwist]

example (u : Fin 2 → M) : weightTwist 2 u = (u 1)⁻¹ := by
  simp [weightTwist, Fin.prod_univ_two]

theorem weightTwist_mul (n : ℕ) (u v : Fin n → M) :
    weightTwist n (u * v) = weightTwist n u * weightTwist n v := by
  unfold weightTwist
  simp only [Pi.mul_apply, mul_zpow]
  exact Finset.prod_mul_distrib

end WeightTwist

/-! ### OL.2: sufficient depth (BCGP Definition 5.7.13) -/

section Depth

variable {G : Type*} [Group G] {ι : Type*} (V : ι → Type*) [∀ i, AddCommGroup (V i)]
  [∀ i, DistribMulAction G (V i)]

/-- A subgroup `U` is sufficiently deep for a family of representations `V i` if every member has
a nonzero `U`-fixed vector. In the roadmap the family is the local components at `ṽ` of all RACSDC
lifts of a fixed residual representation. -/
def IsSufficientlyDeep (U : Subgroup G) : Prop :=
  ∀ i, ∃ v : V i, v ≠ 0 ∧ ∀ u ∈ U, u • v = v

variable {V}

/-- Smaller subgroups of a sufficiently deep subgroup are sufficiently deep. -/
theorem IsSufficientlyDeep.mono {U U' : Subgroup G} (h : U' ≤ U) (hU : IsSufficientlyDeep V U) :
    IsSufficientlyDeep V U' := by
  intro i
  obtain ⟨v, hv, hfix⟩ := hU i
  exact ⟨v, hv, fun u hu => hfix u (h hu)⟩

/-- The trivial subgroup is sufficiently deep as soon as every member is nonzero. -/
theorem isSufficientlyDeep_bot (hV : ∀ i, ∃ v : V i, v ≠ 0) : IsSufficientlyDeep V (⊥ : Subgroup G) := by
  intro i
  obtain ⟨v, hv⟩ := hV i
  refine ⟨v, hv, fun u hu => ?_⟩
  rw [Subgroup.mem_bot.mp hu, one_smul]

end Depth

/-! ### OL.3 and OL.5: dimension identities of the patching arguments -/

/-- BCGP (5.7.17): with `d = [F⁺ : ℚ]`, `t = #T`, `q = h¹ - 1` and
`g = q + t - 1 - d n (n-1)/2`, the patched ring has the dimension of
`S_∞ = Λ⟦X_1, …, X_{q + (n²+1)t - 1}⟧`, where `dim Λ = 1 + d n`. -/
theorem dyadic_patched_dimension (n d t q : ℚ) :
    (1 + n ^ 2 * t + d * (n * (n + 1) / 2)) + (q + t - 1 - d * (n * (n - 1) / 2)) =
      (1 + d * n) + (q + (n ^ 2 + 1) * t - 1) := by
  ring

example : (1 + 2 ^ 2 * 3 + 2 * (2 * (2 + 1) / 2) : ℚ) + (5 + 3 - 1 - 2 * (2 * (2 - 1) / 2)) = 24 := by
  norm_num

/-- Whitmore Proposition 7.11 with `I = ∅`: with `g = t - 4d + s - 1` (`d = [F⁺ : ℚ]`, `s = #S`),
the relative dimension `g + 10 s + 4 d` of the patched local ring over `Λ` equals the relative
dimension `t + 11 s - 1` of `S_∞`. -/
theorem symplectic_patched_dimension (d s t : ℚ) :
    (t - 4 * d + s - 1) + 10 * s + 4 * d = t + 11 * s - 1 := by
  ring

end OrdinaryPartII
