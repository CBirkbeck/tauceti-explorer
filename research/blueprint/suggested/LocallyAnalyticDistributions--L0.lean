import Mathlib.Analysis.LocallyConvex.WithSeminorms
import Mathlib.Analysis.LocallyConvex.Bounded
import Mathlib.Analysis.Normed.Operator.Banach
import Mathlib.Analysis.Normed.Operator.Compact.Basic
import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.Topology.Algebra.Module.Complement
import Mathlib.Topology.Maps.Strict.Module
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.RingTheory.MvPowerSeries.Restricted
import Mathlib.RingTheory.MvPowerSeries.GaussNorm
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Defs

/-!
# Locally analytic distributions, L0: nonarchimedean functional analysis and charts

This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/LocallyAnalyticDistributions--L0.md; the statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures.
Baseline: Mathlib 082e2d3 and Tau Ceti f790474; this file imports only Mathlib.
Proof holes use `sorry`; no data is defined by `sorry`.

What is here: light predicates with real bodies over existing carriers (nonarchimedean local
convexity by open `O_K`-submodules, spherical completeness, discrete valuation, compactoid sets,
compact maps, power series on a closed polydisc and their Gauss norm), the end theorems of the
layer that are statable at the pins (Hahn–Banach over a spherically complete field, the `c₀`
model of Banach spaces of countable type, complemented subspaces, the comparison of compactoid
sets with total boundedness and of compact maps with `IsCompactOperator`), and examples.
Scalar Gauss-norm multiplicativity is reused from current Tau Ceti instead of planned again. Mathlib's `PolynormableSpace` admits non-ultrametric seminorms
and is strictly weaker than nonarchimedean local convexity (`lp_one_not_naLocallyConvex`).

What stays a README target: limits, strong duals as locally convex spaces, the strict derived
category and left heart, completed tensor products, spaces of compact type, nuclear spaces and
their duality, analytic-series compatibility for existing manifold atlases, chart indices,
the spaces `C^an(M, E)` and `D(M, K)`. The new heavy carriers do not exist at the pins;
Mathlib chart/manifold/analytic-map carriers are reused. The closing comments index packet names.

Sources: Schneider, *Nonarchimedean Functional Analysis* (author notes) §§1, 4, 9, 10, 12, 16,
17, 19; Schneider–Teitelbaum, arXiv:math/9912073 §§1–2; Schneider, *p-Adic Lie Groups* §§5, 10,
12; Emerton, arXiv:math/0405137 §§1.1, 2.1; Colmez–Gilles–Nizioł, arXiv:2308.07712 §2.1;
Colmez–Nizioł, Appendix A (source issues E101–E103).
-/

noncomputable section

open Filter Topology
open scoped ZeroAtInfty Pointwise

namespace TauCeti.NALocallyConvex

section LocallyConvex

variable (K : Type*) [NormedField K]
variable {V : Type*} [AddCommGroup V] [Module K V]

/-- An `O_K`-submodule, written with the closed unit ball of `K`: contains `0`, is closed under
addition, and under multiplication by scalars of norm at most one. -/
def IsOKSubmodule (U : Set V) : Prop :=
  (0 : V) ∈ U ∧ (∀ x ∈ U, ∀ y ∈ U, x + y ∈ U) ∧ ∀ a : K, ‖a‖ ≤ 1 → ∀ x ∈ U, a • x ∈ U

/-- L0/nonarchimedean-locally-convex-spaces: a topological `K`-vector space whose zero
neighbourhoods have a basis of open `O_K`-submodules (Schneider, NFA §4). -/
class IsNALocallyConvex (V : Type*) [AddCommGroup V] [Module K V] [TopologicalSpace V] : Prop
    where
  isTopologicalAddGroup : IsTopologicalAddGroup V
  continuousSMul : ContinuousSMul K V
  hasBasis : (𝓝 (0 : V)).HasBasis (fun U : Set V => IsOpen U ∧ IsOKSubmodule K U) id

variable [TopologicalSpace V]

/-- Equivalent description by continuous seminorms with the strict triangle inequality
(Schneider, NFA Propositions 4.3–4.4). -/
theorem isNALocallyConvex_iff_seminorms :
    IsNALocallyConvex K V ↔ IsTopologicalAddGroup V ∧
      WithSeminorms (fun q : {q : Seminorm K V // Continuous q ∧ IsNonarchimedean (q : V → ℝ)} =>
        q.1) := by
  sorry

/-- Every nonarchimedean locally convex space is polynormable in Mathlib's sense. -/
theorem IsNALocallyConvex.polynormableSpace [IsNALocallyConvex K V] :
    PolynormableSpace K V := by
  sorry

end LocallyConvex

section Examples

variable (p : ℕ) [Fact p.Prime]

/-- `naTopology_line`: the field itself. -/
example : IsNALocallyConvex ℚ_[p] ℚ_[p] := by
  sorry

/-- `lp_one_not_naLocallyConvex`: `ℓ¹(ℕ, ℚ_p)` with the sum norm is polynormable (it is a normed
space) but not nonarchimedean locally convex. -/
example : ¬ IsNALocallyConvex ℚ_[p] (lp (fun _ : ℕ => ℚ_[p]) 1) := by
  sorry

end Examples

section SphericallyComplete

/-- L0/spherically-complete-fields: every antitone sequence of closed balls of positive radii
has nonempty intersection (Schneider, NFA §1). -/
class IsSphericallyComplete (K : Type*) [NormedField K] : Prop where
  nonempty_iInter : ∀ (c : ℕ → K) (r : ℕ → ℝ), (∀ n, 0 < r n) →
    Antitone (fun n => Metric.closedBall (c n) (r n)) →
      (⋂ n, Metric.closedBall (c n) (r n)).Nonempty

/-- A field whose nonzero absolute values form the group `r^ℤ` for some `0 < r < 1`. -/
def IsDiscretelyValued (K : Type*) [NormedField K] : Prop :=
  ∃ r : ℝ, 0 < r ∧ r < 1 ∧ ∀ x : K, x ≠ 0 → ∃ n : ℤ, ‖x‖ = r ^ n

theorem IsSphericallyComplete.completeSpace (K : Type*) [NormedField K] [IsUltrametricDist K]
    [IsSphericallyComplete K] : CompleteSpace K := by
  sorry

/-- Schneider, NFA Lemma 1.6. -/
theorem isSphericallyComplete_of_discrete (K : Type*) [NormedField K]
    [IsUltrametricDist K] [CompleteSpace K] (hK : IsDiscretelyValued K) :
    IsSphericallyComplete K := by
  sorry

theorem Padic.isDiscretelyValued (p : ℕ) [Fact p.Prime] : IsDiscretelyValued ℚ_[p] := by
  sorry

theorem Padic.isSphericallyComplete (p : ℕ) [Fact p.Prime] : IsSphericallyComplete ℚ_[p] :=
  isSphericallyComplete_of_discrete ℚ_[p] (Padic.isDiscretelyValued p)

end SphericallyComplete

section HahnBanach

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [IsSphericallyComplete K]

/-- L0/nonarchimedean-hahn-banach, seminorm form (Schneider, NFA Proposition 9.2). Mathlib's
Hahn–Banach theorems assume `IsRCLikeNormedField` and do not cover this case. -/
theorem exists_extension_of_le_seminorm {V : Type*} [AddCommGroup V] [Module K V]
    (q : Seminorm K V) (hq : IsNonarchimedean (q : V → ℝ)) (U : Submodule K V)
    (ℓ : U →ₗ[K] K) (hℓ : ∀ x : U, ‖ℓ x‖ ≤ q x) :
    ∃ ℓ' : V →ₗ[K] K, (∀ x : U, ℓ' x = ℓ x) ∧ ∀ x, ‖ℓ' x‖ ≤ q x := by
  sorry

/-- Norm-preserving extension for ultrametric normed spaces (Schneider, NFA Corollary 9.4). -/
theorem exists_extension_norm_eq {V : Type*} [NormedAddCommGroup V] [NormedSpace K V]
    [IsUltrametricDist V] (U : Submodule K V) (f : StrongDual K U) :
    ∃ g : StrongDual K V, (∀ x : U, g x = f x) ∧ ‖g‖ = ‖f‖ := by
  sorry

/-- Separation of points (Schneider, NFA Corollary 9.3). -/
theorem exists_dual_eq_one {V : Type*} [NormedAddCommGroup V] [NormedSpace K V]
    [IsUltrametricDist V] {v : V} (hv : v ≠ 0) : ∃ g : StrongDual K V, g v = 1 := by
  sorry

end HahnBanach

section Banach

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- L0/banach-c0-models (b): an infinite-dimensional Banach space of countable type is
isomorphic to `c₀(ℕ, K)` (Schneider, NFA Proposition 10.4). -/
theorem nonempty_equiv_c0_of_countableType {V : Type*} [NormedAddCommGroup V] [NormedSpace K V]
    [IsUltrametricDist V] [CompleteSpace V]
    (hcount : ∃ s : Set V, s.Countable ∧ Dense (Submodule.span K s : Set V))
    (hinf : ¬ FiniteDimensional K V) : Nonempty (V ≃L[K] C₀(ℕ, K)) := by
  sorry

/-- L0/banach-complemented-subspaces (a): over a discretely valued field every closed subspace
of a Banach space is complemented (Schneider, NFA Proposition 10.5). -/
theorem closedComplemented_of_isDiscretelyValued (hK : IsDiscretelyValued K) {V : Type*}
    [NormedAddCommGroup V] [NormedSpace K V] [IsUltrametricDist V] [CompleteSpace V]
    (U : Submodule K V) (hU : IsClosed (U : Set V)) : U.ClosedComplemented := by
  sorry

/-- L0/banach-complemented-subspaces (b): the same when the space is of countable type. -/
theorem closedComplemented_of_countableType {V : Type*} [NormedAddCommGroup V]
    [NormedSpace K V] [IsUltrametricDist V] [CompleteSpace V]
    (hcount : ∃ s : Set V, s.Countable ∧ Dense (Submodule.span K s : Set V))
    (U : Submodule K V) (hU : IsClosed (U : Set V)) : U.ClosedComplemented := by
  sorry

/-- L0/banach-open-mapping-lifts (b) is Mathlib's theorem, with no archimedean hypothesis. -/
example {V W : Type*} [NormedAddCommGroup V] [NormedSpace K V] [CompleteSpace V]
    [NormedAddCommGroup W] [NormedSpace K W] [CompleteSpace W] (f : V →L[K] W)
    (hf : Function.Surjective f) : ∃ C > 0, ∀ y, ∃ x, f x = y ∧ ‖x‖ ≤ C * ‖y‖ :=
  f.exists_preimage_norm_le hf

/-- L0/strict-morphisms-quasi-abelian: strictness of a continuous linear map is Mathlib's
`Topology.IsStrictMap`, equivalently a homeomorphism `V ⧸ ker f ≃ range f`. -/
example {V W : Type*} [NormedAddCommGroup V] [NormedSpace K V] [NormedAddCommGroup W]
    [NormedSpace K W] (f : V →L[K] W) :
    Topology.IsStrictMap f ↔ IsHomeomorph (f : V →ₗ[K] W).quotKerEquivRange :=
  LinearMap.isStrictMap_iff_isHomeomorph_quotKerEquivRange

end Banach

section Compactoid

variable (K : Type*) [NormedField K]
variable {V : Type*} [AddCommGroup V] [Module K V] [TopologicalSpace V]

/-- L0/compactoid-compact-maps: `B` is compactoid if every zero neighbourhood `U` has finitely
many vectors with `B ⊆ U + (O_K-span of them)` (Schneider–Teitelbaum §1). -/
def IsCompactoid (B : Set V) : Prop :=
  ∀ U ∈ 𝓝 (0 : V), ∃ s : Finset V,
    B ⊆ U + {x | ∃ a : V → K, (∀ v, ‖a v‖ ≤ 1) ∧ x = ∑ v ∈ s, a v • v}

/-- A continuous linear map is compact if it sends some zero neighbourhood to a compactoid set;
for quasi-complete targets this is Schneider's definition (NFA §16). -/
def IsNACompactMap {W : Type*} [AddCommGroup W] [Module K W] [TopologicalSpace W]
    (f : V →L[K] W) : Prop :=
  ∃ U ∈ 𝓝 (0 : V), IsCompactoid K (f '' U)

theorem IsCompactoid.isVonNBounded [IsNALocallyConvex K V] {B : Set V}
    (hB : IsCompactoid K B) : Bornology.IsVonNBounded K B := by
  sorry

theorem IsCompactoid.image {W : Type*} [AddCommGroup W] [Module K W] [TopologicalSpace W]
    (f : V →L[K] W) {B : Set V} (hB : IsCompactoid K B) : IsCompactoid K (f '' B) := by
  sorry

/-- Over a locally compact field, compactoid subsets of a normed space are exactly the totally
bounded ones. -/
theorem isCompactoid_iff_totallyBounded (K : Type*) [NontriviallyNormedField K] [ProperSpace K]
    {V : Type*} [NormedAddCommGroup V] [NormedSpace K V] (B : Set V) :
    IsCompactoid K B ↔ TotallyBounded B := by
  sorry

/-- Over a locally compact field, compact maps between Banach spaces are Mathlib's compact
operators. -/
theorem isNACompactMap_iff_isCompactOperator (K : Type*) [NontriviallyNormedField K]
    [ProperSpace K] {V W : Type*} [NormedAddCommGroup V] [NormedSpace K V]
    [NormedAddCommGroup W] [NormedSpace K W] [CompleteSpace W] (f : V →L[K] W) :
    IsNACompactMap K f ↔ IsCompactOperator f := by
  sorry

/-- `compactoid_finiteDim`: every bounded subset of `K^n` is compactoid. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] (n : ℕ)
    (B : Set (Fin n → K)) (hB : Bornology.IsBounded B) : IsCompactoid K B := by
  sorry

/-- `not_compactoid_unitBall`: the unit ball of `c₀(ℕ, ℚ_p)` is not compactoid. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsCompactoid ℚ_[p] (Metric.closedBall (0 : C₀(ℕ, ℚ_[p])) 1) := by
  sorry

end Compactoid

end TauCeti.NALocallyConvex

namespace TauCeti.LocallyAnalytic

section PowerSeries

variable (K : Type*) [NormedField K]

/-- L0/restricted-power-series-ball: power series in `r` variables converging on the closed
polydisc of radius `ε`, through Mathlib's `MvPowerSeries.IsRestricted`. -/
def restrictedBall (ε : ℝ) (r : ℕ) : Set (MvPowerSeries (Fin r) K) :=
  {f | MvPowerSeries.IsRestricted (fun _ => ε) f}

/-- The norm `‖f‖_ε = sup_α ε^{|α|} ‖a_α‖`, Mathlib's Gauss norm at constant radius `ε`. -/
def gaussNormBall (ε : ℝ) {r : ℕ} (f : MvPowerSeries (Fin r) K) : ℝ :=
  MvPowerSeries.gaussNorm (fun x : K => ‖x‖) (fun _ => ε) f

variable {K}

/-- Compatibility check using multiplication closure already at the Mathlib pin.
The scalar normed-ring and multiplicativity infrastructure already exists in current Tau Ceti;
upstream packaging reuses it. The light aliases above only express the older-pin carrier. -/
example [IsUltrametricDist K] {ε : ℝ} {r : ℕ}
    {f g : MvPowerSeries (Fin r) K} (hf : f ∈ restrictedBall K ε r)
    (hg : g ∈ restrictedBall K ε r) : f * g ∈ restrictedBall K ε r := by
  exact MvPowerSeries.isRestricted.mul (fun _ => ε) hf hg

/-- `restrictedBall_monomial`: `‖X_i‖_ε = ε`. -/
example (ε : ℝ) (hε : 0 < ε) {r : ℕ} (i : Fin r) :
    gaussNormBall K ε (MvPowerSeries.X i : MvPowerSeries (Fin r) K) = ε := by
  sorry

/-- `restrictedBall_geometric`: the series with all coefficients one is not restricted at
radius one, but it is at every radius below one. -/
example (L : Type*) [NontriviallyNormedField L] [IsUltrametricDist L] :
    (fun _ => (1 : L) : MvPowerSeries (Fin 1) L) ∉ restrictedBall L 1 1 ∧
      ∀ ε : ℝ, 0 < ε → ε < 1 → (fun _ => (1 : L) : MvPowerSeries (Fin 1) L) ∈
        restrictedBall L ε 1 := by
  sorry

end PowerSeries

section Functions

variable (p : ℕ) [Fact p.Prime]

/-- `locallyAnalytic_locallyConstant` (one direction, on `ℤ_p`): every locally constant
function is locally polynomial of degree zero on some residue level; its membership in every
stage of `C^an(ℤ_p, K)` is a README target, since that carrier is not at the pins. -/
example (f : LocallyConstant ℤ_[p] ℚ_[p]) :
    ∃ h : ℕ, ∀ x y : ℤ_[p], PadicInt.toZModPow h x = PadicInt.toZModPow h y → f x = f y := by
  sorry

end Functions

end TauCeti.LocallyAnalytic

/- API and test index for the README targets. Heavy carriers are not developed in this file.
Existing scalar Tate-algebra and manifold declarations are reused as the README specifies.
For geometric targets L is the manifold base field and K the coefficient extension. -/

/- LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces
TauCeti.NALocallyConvex.IsOKSubmodule
TauCeti.NALocallyConvex.IsNALocallyConvex
TauCeti.NALocallyConvex.isNALocallyConvex_iff_seminorms
TauCeti.NALocallyConvex.gauge_isOpen_iff
TauCeti.NALocallyConvex.IsNALocallyConvex.polynormableSpace
TauCeti.NALocallyConvex.naKernel
TauCeti.NALocallyConvex.naCokernel
TauCeti.NALocallyConvex.haCokernel
TauCeti.NALocallyConvex.separate
TauCeti.NALocallyConvex.separate_lift
TauCeti.NALocallyConvex.separate_eq_self_iff
TauCeti.NALocallyConvex.quotient_t2_iff
NALocallyConvexTests.naTopology_line
NALocallyConvexTests.naTopology_product
NALocallyConvexTests.naCokernel_dense
NALocallyConvexTests.lp_one_not_naLocallyConvex
NALocallyConvexTests.quotient_finiteMax
-/

/- LocallyAnalyticDistributions:L0/locally-convex-limits
TauCeti.NALocallyConvex.naInductiveLimit
TauCeti.NALocallyConvex.naInductiveLimit_lift
TauCeti.NALocallyConvex.naInductiveLimit_continuous_iff
TauCeti.NALocallyConvex.naInductiveLimit_isOpen_lattice_iff
TauCeti.NALocallyConvex.naProjectiveLimit
TauCeti.NALocallyConvex.naProjectiveLimit_lift
TauCeti.NALocallyConvex.naProjectiveLimit_topology
TauCeti.NALocallyConvex.strictInductiveLimit_induced
TauCeti.NALocallyConvex.strictInductiveLimit_bounded_iff
NALocallyConvexTests.naLimit_constant
NALocallyConvexTests.naLimit_product
NALocallyConvexTests.naLimit_directSum_bounded
-/

/- LocallyAnalyticDistributions:L0/bounded-sets-strong-dual
TauCeti.NALocallyConvex.naBounded_iff_isVonNBounded
TauCeti.NALocallyConvex.strongTopology_eq
TauCeti.NALocallyConvex.weakDualTopology
TauCeti.NALocallyConvex.strongDual_normed
TauCeti.NALocallyConvex.transpose_continuous
TauCeti.NALocallyConvex.continuous_iff_seminorm_le
TauCeti.NALocallyConvex.IsBornological
TauCeti.NALocallyConvex.strongDual_complete
NALocallyConvexTests.strongDual_c0
NALocallyConvexTests.weak_ne_strong
NALocallyConvexTests.bounded_product
NALocallyConvexTests.bounded_normed
-/

/- LocallyAnalyticDistributions:L0/spherically-complete-fields
TauCeti.NALocallyConvex.IsSphericallyComplete
TauCeti.NALocallyConvex.isSphericallyComplete_iff_pairwise
TauCeti.NALocallyConvex.IsSphericallyComplete.completeSpace
TauCeti.NALocallyConvex.isSphericallyComplete_of_discrete
TauCeti.NALocallyConvex.Padic.isSphericallyComplete
TauCeti.NALocallyConvex.IsDiscretelyValued
TauCeti.NALocallyConvex.Padic.isDiscretelyValued
NALocallyConvexTests.sphericallyComplete_Qp
NALocallyConvexTests.sphericallyComplete_complete
NALocallyConvexTests.not_sphericallyComplete_Cp
NALocallyConvexTests.sphericallyComplete_constant_radius
-/

/- LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach
TauCeti.NALocallyConvex.exists_extension_of_le_seminorm
TauCeti.NALocallyConvex.exists_extension_norm_eq
TauCeti.NALocallyConvex.exists_dual_eq_one
-/

/- LocallyAnalyticDistributions:L0/strict-morphisms-quasi-abelian
TauCeti.NALocallyConvex.naStrict_iff_relativelyOpen
TauCeti.NALocallyConvex.haStrict_iff_closed_and_naStrict
TauCeti.NALocallyConvex.naStrict_pullback
TauCeti.NALocallyConvex.naStrict_pushout
TauCeti.NALocallyConvex.haStrict_pullback
TauCeti.NALocallyConvex.haStrict_pushout
TauCeti.NALocallyConvex.naQuasiAbelian
TauCeti.NALocallyConvex.haQuasiAbelian
TauCeti.NALocallyConvex.haStrictExact_iff
TauCeti.NALocallyConvex.naExactStructure
NALocallyConvexTests.strict_split_line
NALocallyConvexTests.strict_dense_inclusion
NALocallyConvexTests.strict_diagonal_failure
-/

/- LocallyAnalyticDistributions:L0/strict-derived-category-left-heart
TauCeti.NALocallyConvex.naStrictDerivedCategory
TauCeti.NALocallyConvex.naStrictDerivedCategory_acyclic_iff_zero
TauCeti.NALocallyConvex.naLeftTStructure_truncation
TauCeti.NALocallyConvex.naLeftCohomology_monoModel
TauCeti.NALocallyConvex.naLeftHeart
TauCeti.NALocallyConvex.naHeartEmbedding
TauCeti.NALocallyConvex.naHeartEmbedding_fullyFaithful
TauCeti.NALocallyConvex.naHeartEmbedding_exact_iff_strictExact
TauCeti.NALocallyConvex.naClassicalPart
TauCeti.NALocallyConvex.naHeart_classical_iff_strict
TauCeti.NALocallyConvex.naHeartEmbedding_extensionClosed
TauCeti.NALocallyConvex.haLeftHeart
NALocallyConvexTests.heart_split_line
NALocallyConvexTests.heart_identity
NALocallyConvexTests.derived_split
NALocallyConvexTests.heart_dense_diagonal
-/

/- LocallyAnalyticDistributions:L0/left-heart-classical-extensions

-/

/- LocallyAnalyticDistributions:L0/projective-tensor-product
TauCeti.NALocallyConvex.projectiveTensor
TauCeti.NALocallyConvex.projectiveTensor_tmul
TauCeti.NALocallyConvex.projectiveTensor_lift
TauCeti.NALocallyConvex.projectiveTensor_lift_unique
TauCeti.NALocallyConvex.projectiveTensor_pureNorm
TauCeti.NALocallyConvex.projectiveTensor_t2
TauCeti.NALocallyConvex.completedProjectiveTensor
TauCeti.NALocallyConvex.completedProjectiveTensor_lift
TauCeti.NALocallyConvex.completedProjectiveTensor_dense
NALocallyConvexTests.projectiveTensor_pure
NALocallyConvexTests.projectiveTensor_zero
NALocallyConvexTests.projectiveTensor_completion
NALocallyConvexTests.scalarTensor_incomplete
-/

/- LocallyAnalyticDistributions:L0/inductive-tensor-product
TauCeti.NALocallyConvex.inductiveTensor
TauCeti.NALocallyConvex.inductiveTensor_lift
TauCeti.NALocallyConvex.completedInductiveTensor_lift
TauCeti.NALocallyConvex.inductiveTensor_to_projective
TauCeti.NALocallyConvex.frechetTensor_pi_eq_iota
TauCeti.NALocallyConvex.inductiveTensor_inductiveLimit
TauCeti.NALocallyConvex.lbTensor_iota_eq_pi
NALocallyConvexTests.inductiveTensor_banach
NALocallyConvexTests.inductiveTensor_point
NALocallyConvexTests.inductiveTensor_ne_projective
-/

/- LocallyAnalyticDistributions:L0/c0-completed-tensor

-/

/- LocallyAnalyticDistributions:L0/banach-c0-models
TauCeti.NALocallyConvex.nonempty_equiv_c0_of_countableType
-/

/- LocallyAnalyticDistributions:L0/banach-open-mapping-lifts

-/

/- LocallyAnalyticDistributions:L0/banach-complemented-subspaces
TauCeti.NALocallyConvex.closedComplemented_of_isDiscretelyValued
TauCeti.NALocallyConvex.closedComplemented_of_countableType
-/

/- LocallyAnalyticDistributions:L0/compactoid-compact-maps
TauCeti.NALocallyConvex.IsCompactoid
TauCeti.NALocallyConvex.IsCompactoid.isVonNBounded
TauCeti.NALocallyConvex.IsCompactoid.closure
TauCeti.NALocallyConvex.IsCompactoid.image
TauCeti.NALocallyConvex.IsCompactoid.add
TauCeti.NALocallyConvex.IsCCompact
TauCeti.NALocallyConvex.isCCompact_iff_isCompactoid
TauCeti.NALocallyConvex.IsNACompactMap
TauCeti.NALocallyConvex.IsNACompactMap.comp
TauCeti.NALocallyConvex.isNACompactMap_dual_iff
TauCeti.NALocallyConvex.isCompactoid_iff_totallyBounded
TauCeti.NALocallyConvex.isNACompactMap_iff_isCompactOperator
NALocallyConvexTests.compactoid_finiteDim
NALocallyConvexTests.compactoid_decay
NALocallyConvexTests.not_compactoid_unitBall
NALocallyConvexTests.diagonal_compact
-/

/- LocallyAnalyticDistributions:L0/compact-type-spaces
TauCeti.NALocallyConvex.IsCompactType
TauCeti.NALocallyConvex.CompactTypePresentation
TauCeti.NALocallyConvex.IsCompactType.t2Space
TauCeti.NALocallyConvex.IsCompactType.bounded_stage
TauCeti.NALocallyConvex.IsCompactType.completeSpace
TauCeti.NALocallyConvex.IsCompactType.reflexive
TauCeti.NALocallyConvex.IsCompactType.bornological
TauCeti.NALocallyConvex.IsCompactType.strongDual_eq_lim
TauCeti.NALocallyConvex.IsCompactType.closedSubspace
TauCeti.NALocallyConvex.IsCompactType.quotient
TauCeti.NALocallyConvex.IsCompactType.dual_strictExact
TauCeti.NALocallyConvex.IsCompactType.directSum
NALocallyConvexTests.compactType_finiteDim
NALocallyConvexTests.compactType_directSum
NALocallyConvexTests.compactType_LA
NALocallyConvexTests.not_compactType_banach
NALocallyConvexTests.compactType_unbounded_sequence
-/

/- LocallyAnalyticDistributions:L0/nuclear-spaces
TauCeti.NALocallyConvex.IsNuclear
TauCeti.NALocallyConvex.isNuclear_iff_compact_to_banach
TauCeti.NALocallyConvex.isNuclear_iff_compactoid_lattice
TauCeti.NALocallyConvex.IsNuclear.isCompactoid_of_bounded
TauCeti.NALocallyConvex.IsNuclear.reflexive_of_frechet
TauCeti.NALocallyConvex.IsNuclear.subspace
TauCeti.NALocallyConvex.IsNuclear.quotient
TauCeti.NALocallyConvex.isNuclear_pi
TauCeti.NALocallyConvex.isNuclear_directSum
TauCeti.NALocallyConvex.isNuclear_compactLimit
TauCeti.NALocallyConvex.isNuclear_projectiveTensor
TauCeti.NALocallyConvex.finiteDimensional_of_isNuclear_banach
NALocallyConvexTests.nuclear_finiteDim
NALocallyConvexTests.nuclear_product
NALocallyConvexTests.not_nuclear_c0
NALocallyConvexTests.nuclear_openDisc
-/

/- LocallyAnalyticDistributions:L0/compact-type-nuclear-duality

-/

/- LocallyAnalyticDistributions:L0/compact-type-tensor-products

-/

/- LocallyAnalyticDistributions:L0/nuclear-three-space

-/

/- LocallyAnalyticDistributions:L0/finite-rank-strict-splitting

-/

/- LocallyAnalyticDistributions:L0/compact-type-extension-duality

-/

/- LocallyAnalyticDistributions:L0/restricted-power-series-ball
TauCeti.LocallyAnalytic.restrictedBall
TauCeti.LocallyAnalytic.gaussNormBall
MvPowerSeries.isRestricted.mul
TauCeti.LocallyAnalytic.restrictedBall_norm_eq
TauCeti.LocallyAnalytic.restrictedBall_iff_isRestricted
TauCeti.LocallyAnalytic.restrictedBall_c0Equiv
TauCeti.LocallyAnalytic.restrictedBall_eval
TauCeti.LocallyAnalytic.restrictedBall_eval_injective
MvPowerSeries.IsRestricted.gaussNorm_mul
TauCeti.LocallyAnalytic.restrictedBall_reexpand
TauCeti.LocallyAnalytic.restrictedBall_bilinearProduct
TauCeti.LocallyAnalytic.restrictedBall_baseExtension
LocallyAnalyticTests.restrictedBall_monomial
LocallyAnalyticTests.restrictedBall_geometric
LocallyAnalyticTests.restrictedBall_sup_not_K_points
LocallyAnalyticTests.restrictedBall_mul
LocallyAnalyticTests.restrictedBall_zero_vars
-/

/- LocallyAnalyticDistributions:L0/multivariate-substitution-bound

-/

/- LocallyAnalyticDistributions:L0/analytic-manifold-atlases
TauCeti.LocallyAnalytic.chart_powerSeries_iff_contDiff
TauCeti.LocallyAnalytic.compatible_chart_dimension
TauCeti.LocallyAnalytic.exists_finite_ball_partition
TauCeti.LocallyAnalytic.restrictScalars_OF_chart
TauCeti.LocallyAnalytic.map_powerSeries_iff_contMDiff
LocallyAnalyticTests.atlas_Zp_balls
LocallyAnalyticTests.chart_square
LocallyAnalyticTests.atlas_OF
LocallyAnalyticTests.atlas_empty_point
-/

/- LocallyAnalyticDistributions:L0/chart-index-banach-stages
TauCeti.LocallyAnalytic.AnalyticIndex
TauCeti.LocallyAnalytic.indexStage
TauCeti.LocallyAnalytic.indexStage_eval
TauCeti.LocallyAnalytic.indexStage_isBanach
TauCeti.LocallyAnalytic.AnalyticIndex.Finer
TauCeti.LocallyAnalytic.indexStage_mono
TauCeti.LocallyAnalytic.exists_common_refinement
TauCeti.LocallyAnalytic.indexStage_Zp_eq_LAh
LocallyAnalyticTests.indexStage_Zp
LocallyAnalyticTests.indexStage_point_empty
LocallyAnalyticTests.indexStage_not_embedding
LocallyAnalyticTests.indexStage_refinement_norm
LocallyAnalyticTests.indexStage_zeroCoefficients
-/

/- LocallyAnalyticDistributions:L0/relatively-compact-restriction

-/

/- LocallyAnalyticDistributions:L0/locally-analytic-function-space
TauCeti.LocallyAnalytic.locallyAnalytic
TauCeti.LocallyAnalytic.mem_locallyAnalytic_iff
TauCeti.LocallyAnalytic.locallyAnalytic_t2
TauCeti.LocallyAnalytic.eval_continuous
TauCeti.LocallyAnalytic.locallyAnalytic_disjointUnion
TauCeti.LocallyAnalytic.locallyAnalytic_toContinuous
TauCeti.LocallyAnalytic.locallyAnalytic_atlas_independent
TauCeti.LocallyAnalytic.exists_common_stage
TauCeti.LocallyAnalytic.locallyAnalytic_isCompactType
TauCeti.LocallyAnalytic.locallyAnalytic_Zp_eq_LA
LocallyAnalyticTests.locallyAnalytic_point_empty
LocallyAnalyticTests.locallyAnalytic_disjoint
LocallyAnalyticTests.locallyAnalytic_locallyConstant
LocallyAnalyticTests.locallyAnalytic_not_uniform
LocallyAnalyticTests.locallyAnalytic_exp_stage
-/

/- LocallyAnalyticDistributions:L0/locally-analytic-pullback

-/

/- LocallyAnalyticDistributions:L0/locally-analytic-product

-/

/- LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear

-/

/- LocallyAnalyticDistributions:L0/barrelled-banach-steinhaus
TauCeti.NALocallyConvex.IsBarrelled
TauCeti.NALocallyConvex.frechet_isBarrelled
TauCeti.NALocallyConvex.inductiveLimit_isBarrelled
TauCeti.NALocallyConvex.pointwiseBounded_equicontinuous
TauCeti.NALocallyConvex.bidual_embedding
NALocallyConvexTests.barrelled_coordinateFamily
NALocallyConvexTests.barrelled_zero
NALocallyConvexTests.not_barrelled_finiteSupport
-/

/- LocallyAnalyticDistributions:L0/pseudo-polar-duality
TauCeti.NALocallyConvex.pseudoPolar
TauCeti.NALocallyConvex.pseudoPolar_antitone
TauCeti.NALocallyConvex.pseudoBipolar_eq_closure
TauCeti.NALocallyConvex.pseudoPolar_isOpen_of_bounded
NALocallyConvexTests.pseudoPolar_integerRing
NALocallyConvexTests.pseudoPolar_zero
NALocallyConvexTests.pseudoBipolar_dense
-/

/- LocallyAnalyticDistributions:L0/lb-frechet-factorisation

-/

/- LocallyAnalyticDistributions:L0/completed-tensor-operator-comparison

-/

/- LocallyAnalyticDistributions:L0/banach-completed-tensor-injective

-/
