import Mathlib

/-!
# Overconvergent isocrystals and frames (layer RD.3, continued): representative target signatures

The roadmap is the document `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.3.md`
together with the RD.3 section of the main document; this file is not the roadmap and is not exhaustive.
It records the definitions and statements of this layer that can be written against the pinned
Mathlib and Tau Ceti APIs, so that contributors and reviewers converge on names and signatures.

Design choices made explicit here:

* Rigid analytic tubes, strict neighbourhoods, `j†`, frames and the categories of (over)convergent
  isocrystals do not exist at the pins. They are roadmap targets and do not appear below.
* What can be stated is the analytic arithmetic underneath them: the growth conditions that separate
  the Tate algebra `K⟨t⟩` from its overconvergent subring `K⟨t⟩†` (Berthelot 96-03 (2.1.2.2)), the
  one-variable convergence condition on a connection (Berthelot 96-03 (2.2.14); Guo–Reinecke,
  Definition 2.12), and the unit-root condition on Mathlib's isocrystals over a perfect field, which
  are the fibres of F-isocrystals at perfect points.
* The Liouville-type exponent of `liouville-exponent-sequence` is stated as a theorem about
  sequences in `ℚ_[p]`; it is the arithmetic heart of the counterexample showing that restriction from
  overconvergent to convergent isocrystals is not full without Frobenius structures.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

open Filter Topology

noncomputable section

/-! ## Layer RD.3: convergent versus overconvergent coefficient growth -/

section Growth

variable {K : Type*} [NormedField K]

/-- The coefficients of a one-variable power series `∑ aₙ tⁿ` converging on the closed unit disc,
i.e. of an element of the Tate algebra `K⟨t⟩`: the norms tend to zero. These are the functions on
the tube `]A¹[` of the affine line in the frame `(A¹, P¹, P̂¹)`. -/
def IsConvergentCoeffs (a : ℕ → K) : Prop :=
  Tendsto (fun n => ‖a n‖) atTop (𝓝 0)

/-- The coefficients of an overconvergent power series, i.e. of an element of `K⟨t⟩†`: the series
converges on a disc of some radius `ρ > 1` (Berthelot 96-03 (2.1.2.2), (2.1.2.3)). These are the
global sections of `j†O` on the frame `(A¹, P¹, P̂¹)`. -/
def IsOverconvergentCoeffs (a : ℕ → K) : Prop :=
  ∃ ρ : ℝ, 1 < ρ ∧ Tendsto (fun n => ‖a n‖ * ρ ^ n) atTop (𝓝 0)

/-- Degenerate case: the zero series is overconvergent. -/
example : IsOverconvergentCoeffs (fun _ : ℕ => (0 : K)) :=
  ⟨2, by norm_num, by simp⟩

/-- Overconvergent series converge on the closed unit disc: `K⟨t⟩† ⊆ K⟨t⟩`. -/
theorem IsOverconvergentCoeffs.isConvergentCoeffs {a : ℕ → K} (h : IsOverconvergentCoeffs a) :
    IsConvergentCoeffs a := by
  obtain ⟨ρ, hρ, h⟩ := h
  refine squeeze_zero (fun n => norm_nonneg _) (fun n => ?_) h
  calc ‖a n‖ = ‖a n‖ * 1 := (mul_one _).symm
    _ ≤ ‖a n‖ * ρ ^ n := mul_le_mul_of_nonneg_left (one_le_pow₀ hρ.le) (norm_nonneg _)

end Growth

section PadicGrowth

variable (p : ℕ) [Fact p.Prime]

/-- Geometric decay: the coefficients `pⁿ` are overconvergent (the series converges for `|t| < p`). -/
example : IsOverconvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ n) := by
  sorry

/-- Non-example separating the two rings: the coefficients `p^⌊√n⌋` tend to zero, but not
geometrically, so `∑ p^⌊√n⌋ tⁿ` lies in `ℚ_p⟨t⟩` and not in `ℚ_p⟨t⟩†`. -/
example : IsConvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ Nat.sqrt n) ∧
    ¬ IsOverconvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ Nat.sqrt n) := by
  sorry

/-- A `p`-adic Liouville-type exponent (`liouville-exponent-sequence`): there is a non-integral
`a ∈ ℤ_p` for which `pⁿ / (n + a)` tends to zero but not geometrically. It produces the extension of
the unit object by the Kummer isocrystal `K_a` on `G_m` whose splitting is convergent but not
overconvergent (`liouville-extension-counterexample`). One may take `a = -∑ p^{m_k}` with
`m₁ = 2` and `m_{k+1} = N_k - k`, `N_k = ∑_{j ≤ k} p^{m_j}`. -/
theorem exists_liouville_exponent :
    ∃ a : ℤ_[p], (∀ n : ℤ, (a : ℚ_[p]) ≠ n) ∧
      IsConvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ (n + 1) / (((n + 1 : ℕ) : ℚ_[p]) + a)) ∧
      ¬ IsOverconvergentCoeffs
        (fun n : ℕ => (p : ℚ_[p]) ^ (n + 1) / (((n + 1 : ℕ) : ℚ_[p]) + a)) := by
  sorry

/-- Contrast: an exponent bounded away from the integers gives overconvergent coefficients.
For `p` odd, `n + (-1/2)` is a unit for every `n`, so `pⁿ / (n - 1/2)` decays geometrically. -/
example (hp : p ≠ 2) :
    IsOverconvergentCoeffs (fun n : ℕ => (p : ℚ_[p]) ^ n / ((n : ℚ_[p]) - 1 / 2)) := by
  sorry

end PadicGrowth

/-! ## Layer RD.3: the convergence condition on a connection -/

section Taylor

variable {K M : Type*} [NormedField K] [NormedAddCommGroup M] [NormedSpace K M]

/-- The one-variable convergence condition on a connection, written for the operator `θ = ∇_{d/dt}`
acting on a normed module of sections over a closed tube: for every section `e` and every `η < 1`,
the divided derivatives `θᵏ e / k!` decay faster than `η⁻ᵏ` (Berthelot 96-03 (2.2.14);
Guo–Reinecke, Definition 2.12). Characteristic zero is implicit in inverting `k!`. -/
def IsConvergentOperator (θ : M →ₗ[K] M) : Prop :=
  ∀ e : M, ∀ η : ℝ, 0 ≤ η → η < 1 →
    Tendsto (fun k : ℕ => ‖((k.factorial : K)⁻¹) • (θ ^ k) e‖ * η ^ k) atTop (𝓝 0)

/-- Degenerate case: the trivial connection (`θ = 0`) is convergent. -/
example : IsConvergentOperator (0 : M →ₗ[K] M) := by
  intro e η _ _
  refine tendsto_const_nhds.congr' ?_
  filter_upwards [eventually_ge_atTop 1] with k hk
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  simp [pow_succ]

end Taylor

section PadicTaylor

variable (p : ℕ) [Fact p.Prime]

/-- Dwork-type bound: `∇(1) = p dt` on the unit disc over `ℚ_p` is convergent, since
`|pᵏ / k!| ≤ 1`. -/
example : IsConvergentOperator ((p : ℚ_[p]) • LinearMap.id : ℚ_[p] →ₗ[ℚ_[p]] ℚ_[p]) := by
  sorry

/-- Non-example: `∇(1) = dt` (the exponential) is not convergent, because `|1 / k!| ηᵏ` is
unbounded once `η > p^{-1/(p-1)}`; no Frobenius structure can exist on it. -/
example : ¬ IsConvergentOperator (LinearMap.id : ℚ_[p] →ₗ[ℚ_[p]] ℚ_[p]) := by
  sorry

end PadicTaylor

/-! ## Layer RD.3: unit-root fibres of F-isocrystals -/

section UnitRoot

open WittVector

variable (p : ℕ) [Fact p.Prime] (k : Type*) [CommRing k] [IsDomain k] [CharP k p] [PerfectRing k p]

/- Applying Mathlib's Frobenius of an isocrystal needs the same transparency setting that
`Mathlib/RingTheory/WittVector/Isocrystal.lean` uses for `Φ(p, k) x`. -/
set_option backward.isDefEq.respectTransparency.types false in
/-- An isocrystal over a perfect field `k` (the fibre of an F-isocrystal at a perfect point) is
unit-root when, in some basis, the matrix of Frobenius has Witt-vector entries and invertible
determinant: Frobenius preserves a `W(k)`-lattice and is bijective on it. Over an algebraically
closed field this means that all slopes are zero (Étesse 2002, §5.1; Kedlaya, Notes, Definition 3.3). -/
def IsUnitRootIsocrystal (V : Type*) [AddCommGroup V] [Isocrystal p k V] : Prop :=
  ∃ (n : ℕ) (b : Module.Basis (Fin n) (FractionRing (WittVector p k)) V)
    (A : Matrix (Fin n) (Fin n) (WittVector p k)),
    IsUnit A.det ∧
      ∀ j, Isocrystal.frobenius p k (V := V) (b j) =
        ∑ i, algebraMap (WittVector p k) (FractionRing (WittVector p k)) (A i j) • b i

/-- The standard isocrystal of slope `0` (Frobenius `x ↦ φ(x)`) is unit-root. -/
example : IsUnitRootIsocrystal p k (StandardOneDimIsocrystal p k 0) := by
  sorry

/-- Non-example: the standard isocrystal of slope `1` (Frobenius `x ↦ p φ(x)`) is not unit-root:
every lattice `L` satisfies `Φ(L) = pL ≠ L`. -/
example : ¬ IsUnitRootIsocrystal p k (StandardOneDimIsocrystal p k 1) := by
  sorry

/- The classification of one-dimensional isocrystals over an algebraically closed field, on which
the slope theory of fibres is built. -/
#check WittVector.isocrystal_classification

/-- Rank one over an algebraically closed field: a one-dimensional isocrystal is unit-root exactly
when it is isomorphic to the standard isocrystal of slope `0`. -/
theorem isUnitRootIsocrystal_iff_of_finrank_eq_one (k : Type*) [Field k] [IsAlgClosed k] [CharP k p]
    (V : Type*) [AddCommGroup V] [Isocrystal p k V]
    (h : Module.finrank (FractionRing (WittVector p k)) V = 1) :
    IsUnitRootIsocrystal p k V ↔
      Nonempty (WittVector.IsocrystalEquiv p k (StandardOneDimIsocrystal p k 0) V) := by
  sorry

end UnitRoot

/-
Statements of this layer that need carriers absent at the pins, stated in the roadmap document:
the étale tube and strict-neighbourhood isomorphisms and the fibration theorems; the `j†` calculus and
coherent `j†O`-modules; overconvergence as a property and Berthelot's coordinate criterion; the gluing
construction and Zariski stack of overconvergent isocrystals; the Monsky–Washnitzer description and
the theorem that a Frobenius structure forces overconvergence; the henselian property of weak
completions with Elkik descent and the lifting of étale algebras; convergent isocrystals and
F-isocrystals, Dwork's construction from F-crystals and the comparison with crystals up to isogeny;
the underlying bundle on a smooth formal scheme; unit-root F-isocrystals and the Katz–Crew
correspondence; Étesse's direct-summand and étale-descent theorems; Kummer isocrystals and the
Liouville extension.
-/

end

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology
