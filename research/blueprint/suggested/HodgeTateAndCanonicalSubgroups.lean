/-
This suggested file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/HodgeTateAndCanonicalSubgroups.md) is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. No declaration here is claimed to be implemented.

Baseline: Mathlib 082e2d3 and Tau Ceti f790474. Following the 2026-10-12 shape, the
file states and does not develop. It keeps the light definitions whose carriers exist
at the pins (the affine conormal module, compact open subgroups, the Hasse valuation
and the canonical-subgroup ranges, the fractional-linear action with its factor
cz + d, prelog structures on a ring), the milestones statable on them, and a few
examples. Shimura towers, diamonds, p-divisible groups over valuation rings, period
sheaves, log adic sites and the AIP torsor have no carrier at the pins; their targets
are README targets, and their planned declaration names are listed in the closing
index, grouped by layer.
-/
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Compactness.Compact
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Basic.Real.Basic
import TauCeti.Algebra.AlgebraicGroup.Tangent.Cotangent

noncomputable section

universe u v

namespace TauCeti.HodgeTate

/-! ## T0: the conormal module of an affine group

For a finite locally free group H = Spec A over Spec R, the conormal module ω_H is the
cotangent space of the augmentation ideal, which Tau Ceti already provides. The
finite Hodge–Tate map, Fargues's degree over valuation rings and everything on
schemes and semi-abelian degenerations are README targets (T0). -/

/-- The conormal module ω_H = I/I² of the augmentation ideal I of a bialgebra
(`T0/conormal-module`, affine case). -/
abbrev affineConormal (R : Type u) (A : Type v) [CommRing R] [CommRing A] [Bialgebra R A] :=
  TauCeti.Bialgebra.CotangentSpace R A

example (R : Type u) (A : Type v) [CommRing R] [CommRing A] [Bialgebra R A] :
    Module R (affineConormal R A) := inferInstance

/-! ## T2:tower: the level poset of the p-level tower

The p-level tower `ShimuraTower.pLevel` is indexed by the compact open subgroups of
G(ℚ_p), ordered by inclusion. The index poset and its cofilteredness are statable at
the pins; the tower, its action and its limit diamond are README targets. -/

/-- Compact open subgroups of a topological group, the index of the p-level tower. -/
def CompactOpenSubgroup (G : Type u) [Group G] [TopologicalSpace G] : Type u :=
  {H : Subgroup G // IsOpen (H : Set G) ∧ IsCompact (H : Set G)}

namespace CompactOpenSubgroup

variable {G : Type u} [Group G] [TopologicalSpace G]

instance : PartialOrder (CompactOpenSubgroup G) :=
  inferInstanceAs (PartialOrder {H : Subgroup G // IsOpen (H : Set G) ∧ IsCompact (H : Set G)})

/-- The underlying subgroup. -/
def toSubgroup (H : CompactOpenSubgroup G) : Subgroup G := H.1

/-- In a compact group the whole group is a compact open subgroup, so the level poset is
nonempty. -/
def top [CompactSpace G] : CompactOpenSubgroup G :=
  ⟨⊤, isOpen_univ, isCompact_univ⟩

/-- The intersection of two compact open subgroups of a Hausdorff topological group is again
compact open; it is the meet in the level poset. -/
theorem inf_isOpen_isCompact [IsTopologicalGroup G] [T2Space G] (H K : CompactOpenSubgroup G) :
    IsOpen ((H.1 ⊓ K.1 : Subgroup G) : Set G) ∧ IsCompact ((H.1 ⊓ K.1 : Subgroup G) : Set G) := by
  rw [Subgroup.coe_inf]
  exact ⟨H.2.1.inter K.2.1, H.2.2.inter_right K.2.2.isClosed⟩

/-- The level poset is cofiltered (milestone of `T2/p-level-tower`). -/
theorem isCofiltered [IsTopologicalGroup G] [T2Space G] [Nonempty (CompactOpenSubgroup G)] :
    CategoryTheory.IsCofiltered (CompactOpenSubgroup G) := by
  sorry

end CompactOpenSubgroup

/-! ## T3: Hasse valuation and the canonical-subgroup ranges

With v(p) = 1, the Hasse height of a point is w = min(v(Ha), 1). The weak and strong
canonical conditions at level n are S_n·w < 1/2 and p^n·w < 1/2, with
S_n = (p^n − 1)/(p − 1); the BHW position range is w ≤ 1/(c_p p^{n−1}) with
c_p = 2, 3, 4 for p ≥ 5, p = 3, p = 2. These are the ranges the T3 and T4 theorems are
stated on; they are kept distinct. -/

/-- The truncated Hasse valuation min(v(Ha), 1) (`T3/hasse-neighbourhood`). -/
def hasseValuation {O : Type u} [CommRing O] (v : AddValuation O (WithTop ℝ)) (Ha : O) : ℝ :=
  min ((v Ha).untopD 1) 1

/-- S_n = 1 + p + ⋯ + p^{n−1} = (p^n − 1)/(p − 1). -/
def canonicalSum (p n : ℕ) : ℚ := ((p : ℚ) ^ n - 1) / ((p : ℚ) - 1)

/-- The weak formal condition S_n·w < 1/2 for a level-n canonical subgroup. -/
def WeakCanonicalRange (p n : ℕ) (w : ℚ) : Prop := canonicalSum p n * w < 1 / 2

/-- The strong sufficient condition p^n·w < 1/2. -/
def StrongCanonicalRange (p n : ℕ) (w : ℚ) : Prop := (p : ℚ) ^ n * w < 1 / 2

/-- The BHW constant c_p: 4 for p = 2, 3 for p = 3, 2 for p ≥ 5. -/
def bhwConstant (p : ℕ) : ℕ := if p = 2 then 4 else if p = 3 then 3 else 2

/-- The BHW geometric position range w ≤ 1/(c_p p^{n−1}) (`T4/period-map-inclusions`). -/
def BHWPositionRange (p n : ℕ) (w : ℚ) : Prop :=
  w ≤ 1 / ((bhwConstant p : ℚ) * (p : ℚ) ^ (n - 1))

example : bhwConstant 2 = 4 := rfl
example : bhwConstant 3 = 3 := rfl
example : bhwConstant 7 = 2 := rfl

example : canonicalSum 3 2 = 4 := by norm_num [canonicalSum]

/-- The strong condition implies the weak one for nonnegative heights, since S_n ≤ p^n. -/
theorem weakCanonicalRange_of_strong {p n : ℕ} (hp : 2 ≤ p) {w : ℚ} (hw : 0 ≤ w)
    (h : StrongCanonicalRange p n w) : WeakCanonicalRange p n w := by
  sorry

/-- The weak condition does not imply the strong one: at p = 2, n = 2 and w = 1/7 the weak
condition 3/7 < 1/2 holds and the strong condition 4/7 < 1/2 fails. -/
example : WeakCanonicalRange 2 2 (1 / 7) ∧ ¬ StrongCanonicalRange 2 2 (1 / 7) := by
  norm_num [WeakCanonicalRange, StrongCanonicalRange, canonicalSum]

/-! ## T4: the Hodge–Tate coordinate action and the factor cz + d

The Hodge–Tate coordinate z of `T4/hodge-tate-coordinate` transforms by the left
fractional-linear action z ↦ (az + b)/(cz + d) on its invertible-denominator domain, and
j(γ, z) = cz + d is the factor of the AIP comparison. The algebraic identities are
statable over any field. -/

variable {K : Type u} [Field K]

/-- The factor j(γ, z) = c z + d. -/
def autFactor (γ : GL (Fin 2) K) (z : K) : K :=
  (γ : Matrix (Fin 2) (Fin 2) K) 1 0 * z + (γ : Matrix (Fin 2) (Fin 2) K) 1 1

/-- The fractional-linear action z ↦ (a z + b)/(c z + d). -/
def coordAction (γ : GL (Fin 2) K) (z : K) : K :=
  ((γ : Matrix (Fin 2) (Fin 2) K) 0 0 * z + (γ : Matrix (Fin 2) (Fin 2) K) 0 1) / autFactor γ z

/-- The cocycle relation j(γδ, z) = j(γ, δz)·j(δ, z), which makes c z + d a section of the AIP
structure group compatible with composition (`T5/aip-automorphy-factor`). -/
theorem autFactor_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0) :
    autFactor (γ * δ) z = autFactor γ (coordAction δ z) * autFactor δ z := by
  sorry

/-- The action is a left action on the invertible-denominator domain. -/
theorem coordAction_mul (γ δ : GL (Fin 2) K) (z : K) (hδ : autFactor δ z ≠ 0)
    (hγδ : autFactor (γ * δ) z ≠ 0) :
    coordAction (γ * δ) z = coordAction γ (coordAction δ z) := by
  sorry

example (z : K) : autFactor (1 : GL (Fin 2) K) z = 1 := by
  simp [autFactor]

example (z : K) : coordAction (1 : GL (Fin 2) K) z = z := by
  simp [coordAction, autFactor]

/-! ## T5: the AIP congruence exponent

On the Hasse neighbourhood of radius ε the AIP structure group B_m is contained in
𝒪_p^×(1 + p^x Res 𝔾̂_a), where x = m − ε p^m/(p − 1). This is the corrected direction
of BHW (7.1), recorded in the T0–T5 part (E20). Membership of cz + d in B_m follows
from the ratio of two lifts in the actual torsor (T5/aip-automorphy-factor). -/

/-- x = m − ε p^m/(p − 1). -/
def aipExponent (p m : ℕ) (ε : ℚ) : ℚ := m - ε * (p : ℚ) ^ m / ((p : ℚ) - 1)

example : aipExponent 3 1 0 = 1 := by norm_num [aipExponent]

end TauCeti.HodgeTate

namespace TauCeti.LogAdic

/-! ## T6:log-sites: prelog and log structures, at the level of a ring

The log structures of `T6:log-sites/log-adic-space` are sheaves of monoids on an étale
site; on a single ring the same conditions define prelog and log rings. -/

/-- A prelog structure on a commutative ring R: a commutative monoid M with a monoid map
α : M → (R, ·). -/
structure PrelogRing (R : Type u) [CommRing R] where
  /-- The monoid. -/
  M : Type u
  [commMonoid : CommMonoid M]
  /-- The structure map to the multiplicative monoid of R. -/
  α : M →* R

attribute [instance] PrelogRing.commMonoid

variable {R : Type u} [CommRing R]

/-- A prelog structure is a log structure when α identifies α⁻¹(R^×) with R^×: every unit has
exactly one preimage. -/
def PrelogRing.IsLog (P : PrelogRing R) : Prop :=
  ∀ u : Rˣ, ∃! m : P.M, P.α m = u

/-- The trivial log structure R^× → R. -/
def trivialLog (R : Type u) [CommRing R] : PrelogRing R :=
  ⟨Rˣ, Units.coeHom R⟩

theorem trivialLog_isLog : (trivialLog R).IsLog :=
  fun u => ⟨u, rfl, fun _ h => Units.ext h⟩

/-- The one-element monoid mapping to 1 is not a log structure on ℚ, whose unit group is
not trivial (the non-example `TauCeti.LogAdic.LogAdicData.not_terminal_monoid`). -/
example : ¬ (⟨PUnit, 1⟩ : PrelogRing ℚ).IsLog := by
  intro h
  obtain ⟨_, hm, -⟩ := h (Units.mk0 2 two_ne_zero)
  norm_num at hm

end TauCeti.LogAdic

/-! ## Index of README targets

Every other planned declaration of the roadmap, by layer and target. Their carriers (Shimura
towers and diamonds, p-divisible groups over valuation rings, semi-abelian degenerations,
period sheaves, log adic sites, the AIP torsor) are not at the pins, so each is a README target:
its statement, hypotheses, API and tests are in the README section named on the left.

### T0

- T0/conormal-module: TauCeti.HodgeTate.conormal, TauCeti.HodgeTate.conormal,
  TauCeti.HodgeTate.conormal_eq_cotangentSpace, TauCeti.HodgeTate.conormal_map,
  TauCeti.HodgeTate.conormal_baseChange, TauCeti.HodgeTate.conormal_rightExact,
  TauCeti.HodgeTate.conormal_finitePresentation, TauCeti.HodgeTate.conormal_eq_zero_iff_etale,
  TauCeti.HodgeTate.pDivisibleConormal, TauCeti.HodgeTate.conormal_constant_eq_zero,
  TauCeti.HodgeTate.conormal_mu, TauCeti.HodgeTate.conormal_alphaP,
  TauCeti.HodgeTate.conormal_eq_cotangentSpace_test
- T0/finite-hodge-tate-map: TauCeti.HodgeTate.hodgeTateMap, TauCeti.HodgeTate.hodgeTateMap,
  TauCeti.HodgeTate.hodgeTateMap_add, TauCeti.HodgeTate.hodgeTateMap_apply_groupLike,
  TauCeti.HodgeTate.hodgeTateMap_natural, TauCeti.HodgeTate.hodgeTateMap_baseChange,
  TauCeti.HodgeTate.hodgeTateLinear, TauCeti.HodgeTate.hodgeTateMap_constant,
  TauCeti.HodgeTate.hodgeTateMap_mu_eq_zero, TauCeti.HodgeTate.hodgeTateMap_depends_on_model,
  TauCeti.HodgeTate.hodgeTateMap_cotangentMap
- T0/hodge-tate-map-compatibilities: TauCeti.HodgeTate.hodgeTateMap_compatibilities
- T0/p-divisible-hodge-tate-map: TauCeti.HodgeTate.pDivisibleHodgeTateMap,
  TauCeti.HodgeTate.pDivisibleHodgeTateMap, TauCeti.HodgeTate.pDivisibleHodgeTateMap_mod,
  TauCeti.HodgeTate.pDivisibleHodgeTateLinear, TauCeti.HodgeTate.pDivisibleHodgeTateMap_natural,
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_galois, TauCeti.HodgeTate.pDivisibleHodgeTateMap_QpZp,
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_mu,
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_not_surjective_integrally,
  TauCeti.HodgeTate.pDivisibleHodgeTateMap_tate
- T0/fargues-hodge-tate-cokernel: TauCeti.HodgeTate.farguesHodgeTateCokernel
- T0/fargues-degree: TauCeti.HodgeTate.farguesDegree, TauCeti.HodgeTate.discriminantDivisor,
  TauCeti.HodgeTate.farguesDegree, TauCeti.HodgeTate.farguesDegree_eq_sum,
  TauCeti.HodgeTate.fargueSlope, TauCeti.HodgeTate.farguesDegree_isogeny,
  TauCeti.HodgeTate.farguesDegree_monogenic, TauCeti.HodgeTate.farguesDegree_constant,
  TauCeti.HodgeTate.farguesDegree_mu, TauCeti.HodgeTate.farguesDegree_not_length,
  TauCeti.HodgeTate.farguesDegree_ellipticTorsion
- T0/fargues-degree-properties: TauCeti.HodgeTate.farguesDegree_properties
- T0/fargues-degree-generic-isomorphism: TauCeti.HodgeTate.farguesDegree_genericIsomorphism
- T0/fargues-divisor: TauCeti.HodgeTate.farguesDivisor, TauCeti.HodgeTate.farguesDivisor,
  TauCeti.HodgeTate.farguesDivisor_support, TauCeti.HodgeTate.farguesDivisor_add_dual,
  TauCeti.HodgeTate.farguesDivisor_pullback, TauCeti.HodgeTate.farguesDivisor_rankOne,
  TauCeti.HodgeTate.farguesDivisor_mu, TauCeti.HodgeTate.farguesDivisor_etale,
  TauCeti.HodgeTate.farguesDivisor_not_reduced
- T0/isogeny-divisor: TauCeti.HodgeTate.isogenyDivisor, TauCeti.HodgeTate.isogenyDivisor,
  TauCeti.HodgeTate.isogenyDivisor_comp, TauCeti.HodgeTate.isogenyDivisor_eq_farguesDivisor,
  TauCeti.HodgeTate.deltaSection, TauCeti.HodgeTate.isogenyDivisor_mulP,
  TauCeti.HodgeTate.isogenyDivisor_id, TauCeti.HodgeTate.isogenyDivisor_mulP_test,
  TauCeti.HodgeTate.isogenyDivisor_kernel_not_finite
- T0/multiplicative-hodge-tate-isomorphism: TauCeti.HodgeTate.multiplicativeHodgeTateIso
- T0/normalized-multiplicative-pullback: TauCeti.HodgeTate.normalizedMultiplicativePullback_det
- T0/semi-abelian-torsion: TauCeti.HodgeTate.semiAbelianTorsion,
  TauCeti.HodgeTate.semiAbelianTorsion, TauCeti.HodgeTate.semiAbelianTorsion_finitePart_exact,
  TauCeti.HodgeTate.semiAbelianTorsion_card, TauCeti.HodgeTate.semiAbelianTateModule_extension,
  TauCeti.HodgeTate.semiAbelianHodgeTate_toric, TauCeti.HodgeTate.semiAbelianTorsion_abelian,
  TauCeti.HodgeTate.semiAbelianTorsion_torus,
  TauCeti.HodgeTate.semiAbelianTorsion_not_constant_height
- T0/semi-abelian-hasse-invariant: TauCeti.HodgeTate.semiAbelianHasse,
  TauCeti.HodgeTate.semiAbelianHasse, TauCeti.HodgeTate.semiAbelianHasse_eq_bt1Hasse,
  TauCeti.HodgeTate.semiAbelianHasse_baseChange, TauCeti.HodgeTate.semiAbelianHasse_torus,
  TauCeti.HodgeTate.semiAbelianHasse_raynaud, TauCeti.HodgeTate.semiAbelianHasse_isUnit_iff,
  TauCeti.HodgeTate.semiAbelianHasse_tateCurve, TauCeti.HodgeTate.semiAbelianHasse_torus_test,
  TauCeti.HodgeTate.semiAbelianHasse_supersingular, TauCeti.HodgeTate.semiAbelianHasse_bt1
- T0/hasse-invariant-ordinary-locus: TauCeti.HodgeTate.hasseInvariant_ordinaryLocus
- T0/hasse-invariant-minimal-compactification:
  TauCeti.HodgeTate.hasseInvariant_minimalCompactification
- T0/hodge-tate-boundary-extension: TauCeti.HodgeTate.hodgeTate_boundaryExtension
- T0/raynaud-hodge-tate-filtration: TauCeti.HodgeTate.raynaudHodgeTate_filtration
- T0/harder-narasimhan-filtration: TauCeti.HodgeTate.harderNarasimhanFiltration,
  TauCeti.HodgeTate.farguesSlope_le_of_semistable, TauCeti.HodgeTate.harderNarasimhanFiltration,
  TauCeti.HodgeTate.harderNarasimhanPolygon, TauCeti.HodgeTate.degree_le_harderNarasimhanPolygon,
  TauCeti.HodgeTate.harderNarasimhanFiltration_dual,
  TauCeti.HodgeTate.harderNarasimhanFiltration_aut,
  TauCeti.HodgeTate.harderNarasimhanFiltration_ordinary,
  TauCeti.HodgeTate.harderNarasimhanFiltration_semistable,
  TauCeti.HodgeTate.harderNarasimhanFiltration_not_connectedEtale
- T0/degree-different: TauCeti.HodgeTate.degree_different
- T0/conormal-base-change: TauCeti.HodgeTate.conormal_baseChange
- T0/conormal-right-exact: TauCeti.HodgeTate.conormal_rightExact
- T0/finite-hodge-tate-naturality: TauCeti.HodgeTate.hodgeTateMap_natural

### T1

- T1/abelian-relative-comparison: TauCeti.HodgeTate.abelianRelativeComparison
- T1/hodge-tate-graded-comparison: TauCeti.HodgeTate.hodgeTateGradedComparison
- T1/hodge-tensor-comparison: TauCeti.HodgeTate.hodgeTensorComparison

### T2

- T2/p-divisible-hodge-tate-sequence: TauCeti.HodgeTate.pDivisibleHodgeTateSequence
- T2/abelian-hodge-tate-sequence: TauCeti.HodgeTate.abelianHodgeTateSequence
- T2/relative-hodge-tate-sequence: TauCeti.HodgeTate.relativeHodgeTateSequence
- T2/hodge-tate-flag-point: TauCeti.HodgeTate.hodgeTateFlagPoint,
  TauCeti.HodgeTate.hodgeTateFlagPoint, TauCeti.HodgeTate.hodgeTateFlagPoint_isLagrangian,
  TauCeti.HodgeTate.plucker, TauCeti.HodgeTate.lagrangianChart,
  TauCeti.HodgeTate.lagrangianChart_cover, TauCeti.HodgeTate.hodgeTateFlagPoint_equivariant,
  TauCeti.HodgeTate.hodgeTateFlagPoint_ordinaryElliptic,
  TauCeti.HodgeTate.hodgeTateFlagPoint_grassmannian, TauCeti.HodgeTate.lagrangianChart_count,
  TauCeti.HodgeTate.hodgeTateFlagPoint_not_line, TauCeti.HodgeTate.lagrangianChart_not_permuted
- T2/pel-hodge-type-filtration: TauCeti.HodgeTate.pelHodgeType_filtration
- T2/hodge-tate-parabolic-reduction: TauCeti.HodgeTate.hodgeTateParabolicReduction,
  TauCeti.HodgeTate.etaleFrameTorsor, TauCeti.HodgeTate.hodgeTateParabolicReduction,
  TauCeti.HodgeTate.hodgeTateLeviTorsor, TauCeti.HodgeTate.hodgeTateParabolicReduction_hecke,
  TauCeti.HodgeTate.hodgeTateParabolicReduction_baseChange,
  TauCeti.HodgeTate.hodgeTateLeviTorsor_modularCurve,
  TauCeti.HodgeTate.hodgeTateParabolicReduction_torus,
  TauCeti.HodgeTate.hodgeTateParabolicReduction_not_hodge
- T2/de-rham-hodge-tate-levi-comparison: TauCeti.HodgeTate.deRhamHodgeTateLeviComparison
- T2/filtered-fibre-functor: TauCeti.HodgeTate.ExactTensorFiltration,
  TauCeti.HodgeTate.ExactTensorFiltration, TauCeti.HodgeTate.ExactTensorFiltration.type,
  TauCeti.HodgeTate.ExactTensorFiltration.splitLocally,
  TauCeti.HodgeTate.ExactTensorFiltration.frameTorsor,
  TauCeti.HodgeTate.ExactTensorFiltration.equivFlag,
  TauCeti.HodgeTate.ExactTensorFiltration.gl_grassmannian,
  TauCeti.HodgeTate.ExactTensorFiltration.trivial,
  TauCeti.HodgeTate.ExactTensorFiltration.not_arbitrary_filtration
- T2/open-tower-hodge-tate-map: TauCeti.HodgeTate.openTowerHodgeTateMap,
  TauCeti.HodgeTate.openTowerHodgeTateMap, TauCeti.HodgeTate.openTowerHodgeTateMap_ext,
  TauCeti.HodgeTate.openTowerHodgeTateMap_eval, TauCeti.HodgeTate.openTowerHodgeTateMap_point,
  TauCeti.HodgeTate.openTowerHodgeTateMap_equivariant,
  TauCeti.HodgeTate.openTowerHodgeTateMap_hecke, TauCeti.HodgeTate.openTowerHodgeTateMap_baseChange,
  TauCeti.HodgeTate.openTowerHodgeTateMap_embedding,
  TauCeti.HodgeTate.openTowerHodgeTateMap_continuous,
  TauCeti.HodgeTate.openTowerHodgeTateMap_modular, TauCeti.HodgeTate.openTowerHodgeTateMap_torus,
  TauCeti.HodgeTate.openTowerHodgeTateMap_hilbertUnsplit,
  TauCeti.HodgeTate.openTowerHodgeTateMap_kernelQuotient
- T2/open-tower-levi-pullback: TauCeti.HodgeTate.openTowerLeviPullback
- T2/p-level-tower: ShimuraTower.pLevel, ShimuraTower.pLevel, ShimuraTower.pLevelMin,
  ShimuraTower.toMin, ShimuraTower.transition_finite, ShimuraTower.transition_comp,
  ShimuraTower.points_eq_doubleCoset, ShimuraTower.reindex, ShimuraTower.pLevel_gl2_components,
  ShimuraTower.pLevel_gl2_transition_degree, ShimuraTower.pLevel_torus,
  ShimuraTower.pLevel_not_base_change
- T2/tower-right-action: ShimuraTower.translate, ShimuraTower.translate, ShimuraTower.translate_one,
  ShimuraTower.translate_mul, ShimuraTower.translate_of_mem, ShimuraTower.translate_comm_transition,
  ShimuraTower.primeToPHecke, ShimuraTower.quotientAction, ShimuraTower.translate_mul_order,
  ShimuraTower.translate_center_gl2, ShimuraTower.translate_trivial_subgroup
- T2/infinite-level-diamond: ShimuraTower.infiniteLevel, ShimuraTower.infiniteLevel,
  ShimuraTower.infiniteLevelMin, ShimuraTower.infiniteLevel.proj,
  ShimuraTower.infiniteLevelMin_isSpatial, ShimuraTower.infiniteLevel_isLocallySpatial,
  ShimuraTower.infiniteLevel_space_homeo, ShimuraTower.infiniteLevel_points,
  ShimuraTower.infiniteLevel_action, ShimuraTower.infiniteLevel_quasiProEtale,
  ShimuraTower.infiniteLevel_reindex, ShimuraTower.infiniteLevel.lift,
  ShimuraTower.infiniteLevel.lift_proj, ShimuraTower.infiniteLevel.hom_ext,
  ShimuraTower.infiniteLevel_torus,
  ShimuraTower.infiniteLevel_gl2_points, ShimuraTower.infiniteLevel_not_perfectoid,
  ShimuraTower.infiniteLevel_least_level

### T3

- T3/hasse-neighbourhood: TauCeti.HodgeTate.hasseNeighbourhood,
  TauCeti.HodgeTate.hasseValuation_dual, TauCeti.HodgeTate.hasseValuation_eq_zero_iff,
  TauCeti.HodgeTate.hasseNeighbourhood, TauCeti.HodgeTate.hasseNeighbourhood_generic,
  TauCeti.HodgeTate.hasseNeighbourhood_mono, TauCeti.HodgeTate.hasseValuation_ordinary,
  TauCeti.HodgeTate.hasseValuation_le_one, TauCeti.HodgeTate.hasseNeighbourhood_zero,
  TauCeti.HodgeTate.hasseNeighbourhood_not_blowup
- T3/subgroup-lifting: TauCeti.HodgeTate.subgroupLifting
- T3/section-rigidity: TauCeti.HodgeTate.sectionRigidity
- T3/canonical-subgroup: TauCeti.HodgeTate.canonicalSubgroup, TauCeti.HodgeTate.canonicalSubgroup,
  TauCeti.HodgeTate.canonicalSubgroup_modFrobenius, TauCeti.HodgeTate.canonicalSubgroup_points,
  TauCeti.HodgeTate.canonicalSubgroup_degree, TauCeti.HodgeTate.canonicalSubgroup_isotropic,
  TauCeti.HodgeTate.canonicalSubgroup_baseChange, TauCeti.HodgeTate.canonicalSubgroup_level,
  TauCeti.HodgeTate.canonicalSubgroup_ordinary, TauCeti.HodgeTate.canonicalSubgroup_ellipticDegree,
  TauCeti.HodgeTate.canonicalSubgroup_not_constant,
  TauCeti.HodgeTate.canonicalSubgroup_points_strict
- T3/pointwise-quotient-hasse: TauCeti.HodgeTate.pointwiseQuotientHasse
- T3/canonical-subgroup-theorem: TauCeti.HodgeTate.canonicalSubgroup_theorem
- T3/canonical-subgroup-properties: TauCeti.HodgeTate.canonicalSubgroup_properties
- T3/quotient-hasse-radius: TauCeti.HodgeTate.quotientHasseRadius
- T3/canonical-subgroup-hodge-tate: TauCeti.HodgeTate.canonicalSubgroup_hodgeTate
- T3/hilbert-canonical-subgroup: TauCeti.HodgeTate.hilbertCanonicalSubgroup

### T4

- T4/canonical-anticanonical-loci: TauCeti.HodgeTate.canonicalLocus,
  TauCeti.HodgeTate.canonicalLocus, TauCeti.HodgeTate.anticanonicalLocus,
  TauCeti.HodgeTate.anticanonicalLocus_isClopen, TauCeti.HodgeTate.anticanonicalLocus_forget,
  TauCeti.HodgeTate.canonicalLocus_section, TauCeti.HodgeTate.anticanonicalLocus_ordinary,
  TauCeti.HodgeTate.canonicalLocus_modularCurve, TauCeti.HodgeTate.anticanonicalLocus_not_complement
- T4/canonical-locus-isomorphism: TauCeti.HodgeTate.canonicalLocus_isomorphism
- T4/atkin-lehner-anticanonical: TauCeti.HodgeTate.atkinLehner_anticanonical
- T4/hodge-tate-coordinate: TauCeti.HodgeTate.hodgeTateCoordinate,
  TauCeti.HodgeTate.hodgeTateCoordinate, TauCeti.HodgeTate.fractionalLinear_action,
  TauCeti.HodgeTate.automorphyFactor, TauCeti.HodgeTate.automorphyFactor_cocycle,
  TauCeti.HodgeTate.automorphyFactor_unit, TauCeti.HodgeTate.hodgeTateCoordinate_descent,
  TauCeti.HodgeTate.automorphyFactor_identity, TauCeti.HodgeTate.fractionalLinear_upperTriangular,
  TauCeti.HodgeTate.automorphyFactor_cocycle_test,
  TauCeti.HodgeTate.automorphyFactor_not_rightAction
- T4/flag-variety-balls: TauCeti.HodgeTate.flagBall, TauCeti.HodgeTate.flagBall,
  TauCeti.HodgeTate.integralBall, TauCeti.HodgeTate.integralBall_points,
  TauCeti.HodgeTate.integralBall_mono, TauCeti.HodgeTate.integralBall_gamma0,
  TauCeti.HodgeTate.integralBall_one, TauCeti.HodgeTate.integralBall_disjoint,
  TauCeti.HodgeTate.integralBall_ramified
- T4/period-map-inclusions: TauCeti.HodgeTate.periodMap_inclusions
- T4/ramified-period-comparison: TauCeti.HodgeTate.ramifiedPeriod_comparison
- T4/canonical-kernel-congruence: TauCeti.HodgeTate.canonicalKernel_congruence

### T5

- T5/igusa-torsor: TauCeti.HodgeTate.igusaTorsor, TauCeti.HodgeTate.igusaTorsor,
  TauCeti.HodgeTate.igusaTorsor_transition, TauCeti.HodgeTate.ordinaryIgusaTower,
  TauCeti.HodgeTate.igusaTorsor_universalTrivialisation, TauCeti.HodgeTate.igusaTorsor_baseChange,
  TauCeti.HodgeTate.igusaTorsor_degree, TauCeti.HodgeTate.igusaTorsor_cusp,
  TauCeti.HodgeTate.igusaTorsor_not_fullLevel
- T5/igusa-full-level-comparison: TauCeti.HodgeTate.igusaFullLevel_comparison
- T5/integral-differential-lattice: TauCeti.HodgeTate.integralDifferentialLattice,
  TauCeti.HodgeTate.igusaHodgeTateClass, TauCeti.HodgeTate.integralDifferentialLattice,
  TauCeti.HodgeTate.integralDifferentialLattice_locallyFree,
  TauCeti.HodgeTate.integralDifferentialLattice_bounds,
  TauCeti.HodgeTate.integralDifferentialLattice_hodgeTate,
  TauCeti.HodgeTate.integralDifferentialLattice_indep,
  TauCeti.HodgeTate.integralDifferentialLattice_ordinary,
  TauCeti.HodgeTate.integralDifferentialLattice_colength,
  TauCeti.HodgeTate.integralDifferentialLattice_ne_plus
- T5/integral-lattice-properties: TauCeti.HodgeTate.integralLattice_properties
- T5/modified-hodge-bundle: TauCeti.HodgeTate.modifiedHodgeBundle, TauCeti.HodgeTate.modifiedModel,
  TauCeti.HodgeTate.modifiedHodgeBundle, TauCeti.HodgeTate.modifiedHodgeBundle_locallyFree,
  TauCeti.HodgeTate.modifiedHodgeBundle_bounds,
  TauCeti.HodgeTate.modifiedHodgeBundle_hodgeTate_surjective,
  TauCeti.HodgeTate.modifiedModel_generic, TauCeti.HodgeTate.modifiedHodgeBundle_ordinary,
  TauCeti.HodgeTate.modifiedHodgeBundle_colength,
  TauCeti.HodgeTate.modifiedHodgeBundle_not_locallyFree_before_blowup
- T5/modified-minimal-model: TauCeti.HodgeTate.modifiedMinimalModel,
  TauCeti.HodgeTate.minimalLevelModel, TauCeti.HodgeTate.hodgeTateDeterminant_descends,
  TauCeti.HodgeTate.modifiedMinimalModel, TauCeti.HodgeTate.modifiedDetHodge_bounds,
  TauCeti.HodgeTate.modifiedDetHodge_surjective, TauCeti.HodgeTate.modifiedMinimalModel_ordinary,
  TauCeti.HodgeTate.modifiedDetHodge_factor, TauCeti.HodgeTate.modifiedMinimalModel_not_toroidal
- T5/modified-plus-sheaf: TauCeti.HodgeTate.modifiedPlusSheaf, TauCeti.HodgeTate.modifiedPlusSheaf,
  TauCeti.HodgeTate.modifiedPlusSheaf_pullback, TauCeti.HodgeTate.modifiedPlusSheaf_bounds,
  TauCeti.HodgeTate.modifiedPlusSheaf_indep, TauCeti.HodgeTate.modifiedPlusSheaf_ordinary,
  TauCeti.HodgeTate.modifiedPlusSheaf_rankOne, TauCeti.HodgeTate.modifiedPlusSheaf_not_analytic
- T5/aip-torsor: TauCeti.HodgeTate.aipTorsor, TauCeti.HodgeTate.aipTorsor,
  TauCeti.HodgeTate.aipTorsor_structureGroup, TauCeti.HodgeTate.aipTorsor_openImmersion,
  TauCeti.HodgeTate.aipTorsor_bound, TauCeti.HodgeTate.aipTorsor_lift,
  TauCeti.HodgeTate.aipTorsor_ordinary, TauCeti.HodgeTate.aipSheaf_classical,
  TauCeti.HodgeTate.aipTorsor_bound_direction
- T5/integral-lattice-level-independence: TauCeti.HodgeTate.integralDifferentialLattice_level_eq
- T5/hodge-tate-aip-lift: TauCeti.HodgeTate.hodgeTate_aipLift
- T5/aip-automorphy-factor: TauCeti.HodgeTate.aip_automorphyFactor
- T5/aip-torsor-hodge-tate-comparison: TauCeti.HodgeTate.aipTorsorHodgeTateComparison

### T6:log-sites

- T6:log-sites/log-adic-space: TauCeti.LogAdic.LogAdicData, TauCeti.LogAdic.LogAdicData,
  TauCeti.LogAdic.LogAdicData.strict, TauCeti.LogAdic.LogAdicData.map_id,
  TauCeti.LogAdic.LogAdicData.map_comp, TauCeti.LogAdic.LogAdicData.associated,
  TauCeti.LogAdic.LogAdicData.pullback, TauCeti.LogAdic.LogAdicData.characteristic,
  TauCeti.LogAdic.LogAdicData.trivial, TauCeti.LogAdic.LogAdicData.strict_iff_stalk,
  TauCeti.LogAdic.LogAdicData.trivial_units, TauCeti.LogAdic.LogAdicData.unit_fiber,
  TauCeti.LogAdic.LogAdicData.not_terminal_monoid
- T6:log-sites/toric-log-adic-space: TauCeti.LogAdic.MonoidAlgebraLog,
  TauCeti.LogAdic.MonoidAlgebraLog.huberPair, TauCeti.LogAdic.MonoidAlgebraLog.noetherian,
  TauCeti.LogAdic.MonoidAlgebraLog.logStructure, TauCeti.LogAdic.MonoidAlgebraLog.tautologicalChart,
  TauCeti.LogAdic.MonoidAlgebraLog.relative, TauCeti.LogAdic.MonoidAlgebraLog.map,
  TauCeti.LogAdic.MonoidAlgebraLog.rational_localization, TauCeti.LogAdic.MonoidAlgebraLog.lift,
  TauCeti.LogAdic.MonoidAlgebraLog.plus, TauCeti.LogAdic.MonoidAlgebraLog.nat_polydisc,
  TauCeti.LogAdic.MonoidAlgebraLog.int_circle, TauCeti.LogAdic.MonoidAlgebraLog.zero_monoid,
  TauCeti.LogAdic.MonoidAlgebraLog.origin_nontrivial, TauCeti.LogAdic.MonoidAlgebraLog.torsion_units
- T6:log-sites/integral-adic-chart: TauCeti.LogAdic.IntegralChart, TauCeti.LogAdic.IntegralChart,
  TauCeti.LogAdic.IntegralChart.mem_plus, TauCeti.LogAdic.IntegralChart.characteristic,
  TauCeti.LogAdic.IntegralChart.pullback, TauCeti.LogAdic.IntegralChart.equivStrictToric,
  TauCeti.LogAdic.IsFsLogAdic, TauCeti.LogAdic.IntegralChart.exists_characteristic,
  TauCeti.LogAdic.IntegralChart.Hom, TauCeti.LogAdic.IntegralChart.unit_chart,
  TauCeti.LogAdic.IntegralChart.coordinate_axis, TauCeti.LogAdic.IntegralChart.reject_inverse_p
- T6:log-sites/divisorial-analytic-log: TauCeti.LogAdic.DivisorialLog,
  TauCeti.LogAdic.DivisorialLog, TauCeti.LogAdic.DivisorialLog.restrict_open,
  TauCeti.LogAdic.DivisorialLog.chart, TauCeti.LogAdic.DivisorialLog.analytification,
  TauCeti.LogAdic.DivisorialLog.trivial_locus, TauCeti.LogAdic.DivisorialLog.smoothToricChart,
  TauCeti.LogAdic.DivisorialLog.empty_boundary, TauCeti.LogAdic.DivisorialLog.double_intersection,
  TauCeti.LogAdic.DivisorialLog.not_all_functions, TauCeti.LogAdic.DivisorialLog.unscaled_equation
- T6:log-sites/saturated-adic-products: TauCeti.LogAdic.FsAdicPullback,
  TauCeti.LogAdic.FsAdicPullback, TauCeti.LogAdic.FsAdicPullback.lift,
  TauCeti.LogAdic.FsAdicPullback.strict_base_change, TauCeti.LogAdic.FsAdicPullback.symmetry,
  TauCeti.LogAdic.FsAdicPullback.integralization, TauCeti.LogAdic.FsAdicPullback.saturation,
  TauCeti.LogAdic.FsAdicPullback.chart, TauCeti.LogAdic.FsAdicPullback.exists_point_of_exact,
  TauCeti.LogAdic.FsAdicPullback.identity, TauCeti.LogAdic.FsAdicPullback.root_double,
  TauCeti.LogAdic.FsAdicPullback.mapping_property
- T6:log-sites/log-smooth-chart-criterion: TauCeti.LogAdic.log_smooth_chart_criterion
- T6:log-sites/continuous-log-derivation: TauCeti.LogAdic.ContinuousLogDerivation,
  TauCeti.LogAdic.ContinuousLogDerivation, TauCeti.LogAdic.ContinuousLogDerivation.ext,
  TauCeti.LogAdic.ContinuousLogDerivation.map_structural,
  TauCeti.LogAdic.ContinuousLogDerivation.postcompose,
  TauCeti.LogAdic.ContinuousLogDerivation.instModule,
  TauCeti.LogAdic.ContinuousLogDerivation.toDerivation,
  TauCeti.LogAdic.ContinuousLogDerivation.deltaGp,
  TauCeti.LogAdic.ContinuousLogDerivation.logificationEquiv,
  TauCeti.LogAdic.ContinuousLogDerivation.zero,
  TauCeti.LogAdic.ContinuousLogDerivation.unit_formula,
  TauCeti.LogAdic.ContinuousLogDerivation.boundary_value,
  TauCeti.LogAdic.ContinuousLogDerivation.trivial_log
- T6:log-sites/continuous-log-differentials: TauCeti.LogAdic.ContinuousLogDifferentials,
  TauCeti.LogAdic.ContinuousLogDifferentials, TauCeti.LogAdic.ContinuousLogDifferentials.lift,
  TauCeti.LogAdic.ContinuousLogDifferentials.lift_unique,
  TauCeti.LogAdic.ContinuousLogDifferentials.strict,
  TauCeti.LogAdic.ContinuousLogDifferentials.presentation,
  TauCeti.LogAdic.ContinuousLogDifferentials.finite,
  TauCeti.LogAdic.ContinuousLogDifferentials.dlog_unit,
  TauCeti.LogAdic.ContinuousLogDifferentials.exact_sequence,
  TauCeti.LogAdic.ContinuousLogDifferentials.monoidAlgebra,
  TauCeti.LogAdic.ContinuousLogDifferentials.identity,
  TauCeti.LogAdic.ContinuousLogDifferentials.toric_rank,
  TauCeti.LogAdic.ContinuousLogDifferentials.coordinate_relation,
  TauCeti.LogAdic.ContinuousLogDifferentials.diagonal_sign
- T6:log-sites/log-differential-descent: TauCeti.LogAdic.log_differential_descent
- T6:log-sites/analytic-log-de-rham: TauCeti.LogAdic.AnalyticLogDR, TauCeti.LogAdic.AnalyticLogDR,
  TauCeti.LogAdic.AnalyticLogDR.d_sq, TauCeti.LogAdic.AnalyticLogDR.residue,
  TauCeti.LogAdic.AnalyticLogDR.pullback_residue, TauCeti.LogAdic.AnalyticLogDR.forms,
  TauCeti.LogAdic.AnalyticLogDR.leibniz, TauCeti.LogAdic.AnalyticLogDR.residue_independent,
  TauCeti.LogAdic.AnalyticLogDR.empty_boundary, TauCeti.LogAdic.AnalyticLogDR.residue_coordinate,
  TauCeti.LogAdic.AnalyticLogDR.root_pullback
- T6:log-sites/kummer-etale-morphism: TauCeti.LogAdic.KummerEtale, TauCeti.LogAdic.KummerEtale,
  TauCeti.LogAdic.KummerEtale.root_chart, TauCeti.LogAdic.KummerEtale.comp,
  TauCeti.LogAdic.KummerEtale.base_change, TauCeti.LogAdic.KummerEtale.iff_logEtale_exact,
  TauCeti.LogAdic.KummerEtale.stalk_kummer, TauCeti.LogAdic.KummerEtale.of_comp,
  TauCeti.LogAdic.KummerEtale.isOpenMap, TauCeti.LogAdic.KummerEtale.of_strictEtale,
  TauCeti.LogAdic.KummerEtale.strict, TauCeti.LogAdic.KummerEtale.p_root_char_zero,
  TauCeti.LogAdic.KummerEtale.reject_p_root_char_p
- T6:log-sites/kummer-root-covers: TauCeti.LogAdic.RootCover, TauCeti.LogAdic.RootCover,
  TauCeti.LogAdic.RootCover.action, TauCeti.LogAdic.RootCover.refine,
  TauCeti.LogAdic.RootCover.strictify, TauCeti.LogAdic.RootCover.finite_surjective,
  TauCeti.LogAdic.RootCover.galois, TauCeti.LogAdic.RootCover.cech_exact,
  TauCeti.LogAdic.RootCover.refine_covering, TauCeti.LogAdic.RootCover.one,
  TauCeti.LogAdic.RootCover.disc_action, TauCeti.LogAdic.RootCover.ramified_boundary,
  TauCeti.LogAdic.RootCover.polydisc_degree, TauCeti.LogAdic.RootCover.no_uniform_noncompact
- T6:log-sites/kummer-ramification-index: TauCeti.LogAdic.RamificationIndex,
  TauCeti.LogAdic.RamificationIndex, TauCeti.LogAdic.RamificationIndex.index_one,
  TauCeti.LogAdic.RamificationIndex.base_change, TauCeti.LogAdic.RamificationIndex.global,
  TauCeti.LogAdic.RamificationIndex.isUnit, TauCeti.LogAdic.RamificationIndex.identity,
  TauCeti.LogAdic.RamificationIndex.two_coordinates, TauCeti.LogAdic.RamificationIndex.off_boundary,
  TauCeti.LogAdic.RamificationIndex.root_cover_strata
- T6:log-sites/kummer-etale-site: TauCeti.LogAdic.KummerEtaleSite, TauCeti.LogAdic.KummerEtaleSite,
  TauCeti.LogAdic.KummerEtaleSite.epsilon, TauCeti.LogAdic.KummerEtaleSite.pullback,
  TauCeti.LogAdic.KummerEtaleSite.representable, TauCeti.LogAdic.KummerEtaleSite.generated,
  TauCeti.LogAdic.KummerEtaleSite.epsilon_structureSheaf,
  TauCeti.LogAdic.KummerEtaleSite.affinoid_chart_basis, TauCeti.LogAdic.KummerEtaleSite.trivial_log,
  TauCeti.LogAdic.KummerEtaleSite.root_is_cover,
  TauCeti.LogAdic.KummerEtaleSite.no_closed_point_shortcut,
  TauCeti.LogAdic.KummerEtaleSite.root_invariants
- T6:log-sites/kummer-coherent-acyclicity: TauCeti.LogAdic.kummer_coherent_acyclicity
- T6:log-sites/finite-kummer-descent: TauCeti.LogAdic.finite_kummer_descent
- T6:log-sites/kummer-etale-higher-direct-images: TauCeti.LogAdic.kummer_etale_higher_direct_images
- T6:log-sites/rigid-abhyankar: TauCeti.LogAdic.rigid_abhyankar
- T6:log-sites/boundary-local-system-extension: TauCeti.LogAdic.boundary_local_system_extension
- T6:log-sites/pro-kummer-presentations: TauCeti.LogAdic.ProKummerPresentation,
  TauCeti.LogAdic.ProKummerPresentation, TauCeti.LogAdic.ProKummerPresentation.reindex,
  TauCeti.LogAdic.ProKummerPresentation.base_change, TauCeti.LogAdic.ProKummerPresentation.comp,
  TauCeti.LogAdic.ProKummerPresentation.isOpenMap,
  TauCeti.LogAdic.ProKummerPresentation.IsProFinite, TauCeti.LogAdic.ProKummerPresentation.constant,
  TauCeti.LogAdic.ProKummerPresentation.root_tower,
  TauCeti.LogAdic.ProKummerPresentation.eventual_surjectivity
- T6:log-sites/corrected-pro-kummer-covers: TauCeti.LogAdic.CorrectedProKummerCover,
  TauCeti.LogAdic.CorrectedProKummerCover, TauCeti.LogAdic.CorrectedProKummerCover.pullback,
  TauCeti.LogAdic.CorrectedProKummerCover.refinement,
  TauCeti.LogAdic.CorrectedProKummerCover.ofCountablePresentation,
  TauCeti.LogAdic.CorrectedProKummerCover.identity,
  TauCeti.LogAdic.CorrectedProKummerCover.finite_stage,
  TauCeti.LogAdic.CorrectedProKummerCover.need_tower,
  TauCeti.LogAdic.CorrectedProKummerCover.root_tower
- T6:log-sites/pro-kummer-etale-site: TauCeti.LogAdic.ProKummerEtaleSite,
  TauCeti.LogAdic.ProKummerEtaleSite, TauCeti.LogAdic.ProKummerEtaleSite.nu,
  TauCeti.LogAdic.ProKummerEtaleSite.pullback, TauCeti.LogAdic.ProKummerEtaleSite.trivial_log,
  TauCeti.LogAdic.ProKummerEtaleSite.qcqs_basis, TauCeti.LogAdic.ProKummerEtaleSite.hasFiniteLimits,
  TauCeti.LogAdic.ProKummerEtaleSite.isQuasiCompact_iff,
  TauCeti.LogAdic.ProKummerEtaleSite.profinite_galois_equivalence,
  TauCeti.LogAdic.ProKummerEtaleSite.final_object, TauCeti.LogAdic.ProKummerEtaleSite.constant_root,
  TauCeti.LogAdic.ProKummerEtaleSite.ordinary_compatibility,
  TauCeti.LogAdic.ProKummerEtaleSite.log_point_root_tower
- T6:log-sites/log-site-projections: TauCeti.LogAdic.log_site_projections
- T6:log-sites/all-root-toric-tower: TauCeti.LogAdic.AllRootTower, TauCeti.LogAdic.AllRootTower,
  TauCeti.LogAdic.AllRootTower.character_action, TauCeti.LogAdic.AllRootTower.geometric_group,
  TauCeti.LogAdic.AllRootTower.cyclotomic_conjugation,
  TauCeti.LogAdic.AllRootTower.chart_limit_divisible,
  TauCeti.LogAdic.AllRootTower.character_decomposition,
  TauCeti.LogAdic.AllRootTower.exists_toric_chart, TauCeti.LogAdic.AllRootTower.rank_zero,
  TauCeti.LogAdic.AllRootTower.two_coordinates, TauCeti.LogAdic.AllRootTower.p_only_insufficient,
  TauCeti.LogAdic.AllRootTower.trivial_character_summand
- T6:log-sites/log-affinoid-perfectoid: TauCeti.LogAdic.LogAffinoidPerfectoid,
  TauCeti.LogAdic.LogAffinoidPerfectoid, TauCeti.LogAdic.LogAffinoidPerfectoid.realization,
  TauCeti.LogAdic.LogAffinoidPerfectoid.topology,
  TauCeti.LogAdic.LogAffinoidPerfectoid.strict_pullback,
  TauCeti.LogAdic.LogAffinoidPerfectoid.isQcqs,
  TauCeti.LogAdic.LogAffinoidPerfectoid.realization_map,
  TauCeti.LogAdic.LogAffinoidPerfectoid.trivial_chart,
  TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility,
  TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only
- T6:log-sites/log-perfectoid-basis: TauCeti.LogAdic.log_perfectoid_basis
- T6:log-sites/completed-structural-log-sheaves: TauCeti.LogAdic.CompletedLogStructure,
  TauCeti.LogAdic.CompletedLogStructure, TauCeti.LogAdic.CompletedLogStructure.mod_p,
  TauCeti.LogAdic.CompletedLogStructure.tilt_projection,
  TauCeti.LogAdic.CompletedLogStructure.functorial,
  TauCeti.LogAdic.CompletedLogStructure.monoid_sections,
  TauCeti.LogAdic.CompletedLogStructure.constant_point,
  TauCeti.LogAdic.CompletedLogStructure.frobenius_relation,
  TauCeti.LogAdic.CompletedLogStructure.not_localize_first,
  TauCeti.LogAdic.CompletedLogStructure.trivial_log,
  TauCeti.LogAdic.CompletedLogStructure.noncompact_sections
- T6:log-sites/log-perfectoid-almost-acyclicity: TauCeti.LogAdic.log_perfectoid_almost_acyclicity
- T6:log-sites/kummer-padic-local-systems: TauCeti.LogAdic.KummerLisse, TauCeti.LogAdic.KummerLisse,
  TauCeti.LogAdic.KummerLisse.reduction, TauCeti.LogAdic.KummerLisse.rationalization,
  TauCeti.LogAdic.KummerLisse.morphism, TauCeti.LogAdic.KummerLisse.stalk,
  TauCeti.LogAdic.KummerLisse.constant_free, TauCeti.LogAdic.KummerLisse.constant_torsion,
  TauCeti.LogAdic.KummerLisse.zero, TauCeti.LogAdic.KummerLisse.torsion_rationalizes_zero
- T6:log-sites/completed-kummer-local-systems: TauCeti.LogAdic.CompletedKummerLisse,
  TauCeti.LogAdic.CompletedKummerLisse, TauCeti.LogAdic.CompletedKummerLisse.mod_pn,
  TauCeti.LogAdic.CompletedKummerLisse.equivalence, TauCeti.LogAdic.CompletedKummerLisse.map_comp,
  TauCeti.LogAdic.CompletedKummerLisse.rlim_vanishing,
  TauCeti.LogAdic.CompletedKummerLisse.rationalization,
  TauCeti.LogAdic.CompletedKummerLisse.closed_pullback_completed,
  TauCeti.LogAdic.CompletedKummerLisse.constant, TauCeti.LogAdic.CompletedKummerLisse.torsion,
  TauCeti.LogAdic.CompletedKummerLisse.representative
- T6:log-sites/geometric-boundary-monodromy: TauCeti.LogAdic.BoundaryMonodromy,
  TauCeti.LogAdic.BoundaryMonodromy, TauCeti.LogAdic.BoundaryMonodromy.logarithm,
  TauCeti.LogAdic.BoundaryMonodromy.smooth_locus, TauCeti.LogAdic.BoundaryMonodromy.tensor,
  TauCeti.LogAdic.BoundaryMonodromy.unipotent_along, TauCeti.LogAdic.BoundaryMonodromy.trivial,
  TauCeti.LogAdic.BoundaryMonodromy.jordan, TauCeti.LogAdic.BoundaryMonodromy.finite_character,
  TauCeti.LogAdic.BoundaryMonodromy.componentwise

### T6:comparison

- T6:comparison/toric-kummer-cohomology: TauCeti.LogAdic.toric_kummer_cohomology
- T6:comparison/proper-log-almost-finiteness: TauCeti.LogAdic.proper_log_almost_finiteness
- T6:comparison/log-primitive-comparison: TauCeti.LogAdic.log_primitive_comparison
- T6:comparison/log-cohomology-finite-vanishing: TauCeti.LogAdic.log_cohomology_finite_vanishing
- T6:comparison/proper-padic-boundary-cohomology: TauCeti.LogAdic.proper_padic_boundary_cohomology
- T6:comparison/kummer-proper-pushforward-local-systems:
  TauCeti.LogAdic.kummer_proper_pushforward_local_systems
- T6:comparison/constant-log-periods: TauCeti.LogAdic.LogConstantPeriods,
  TauCeti.LogAdic.LogConstantPeriods, TauCeti.LogAdic.LogConstantPeriods.theta,
  TauCeti.LogAdic.LogConstantPeriods.fil, TauCeti.LogAdic.LogConstantPeriods.grade,
  TauCeti.LogAdic.LogConstantPeriods.sections,
  TauCeti.LogAdic.LogConstantPeriods.acyclic_log_affinoid_perfectoid,
  TauCeti.LogAdic.LogConstantPeriods.closed_restriction_surjective,
  TauCeti.LogAdic.LogConstantPeriods.trivial_log, TauCeti.LogAdic.LogConstantPeriods.grade_zero,
  TauCeti.LogAdic.LogConstantPeriods.not_integral_completion,
  TauCeti.LogAdic.LogConstantPeriods.point_values
- T6:comparison/structural-log-period-plus: TauCeti.LogAdic.StructuralLogPeriodPlus,
  TauCeti.LogAdic.StructuralLogPeriodPlus, TauCeti.LogAdic.StructuralLogPeriodPlus.theta_generator,
  TauCeti.LogAdic.StructuralLogPeriodPlus.structural_relation,
  TauCeti.LogAdic.StructuralLogPeriodPlus.presentation_invariance,
  TauCeti.LogAdic.StructuralLogPeriodPlus.theta_surjective,
  TauCeti.LogAdic.StructuralLogPeriodPlus.bdr_algebra,
  TauCeti.LogAdic.StructuralLogPeriodPlus.structure_algebra,
  TauCeti.LogAdic.StructuralLogPeriodPlus.pullback,
  TauCeti.LogAdic.StructuralLogPeriodPlus.rank_zero, TauCeti.LogAdic.StructuralLogPeriodPlus.theta,
  TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation
- T6:comparison/structural-log-period-complete: TauCeti.LogAdic.StructuralLogPeriod,
  TauCeti.LogAdic.StructuralLogPeriod, TauCeti.LogAdic.StructuralLogPeriod.completion_map,
  TauCeti.LogAdic.StructuralLogPeriod.grade, TauCeti.LogAdic.StructuralLogPeriod.complete_piece,
  TauCeti.LogAdic.StructuralLogPeriod.fil_zero_ring, TauCeti.LogAdic.StructuralLogPeriod.oc_log,
  TauCeti.LogAdic.StructuralLogPeriod.bdr_algebra,
  TauCeti.LogAdic.StructuralLogPeriod.t_independent, TauCeti.LogAdic.StructuralLogPeriod.zero_log,
  TauCeti.LogAdic.StructuralLogPeriod.cauchy_sum,
  TauCeti.LogAdic.StructuralLogPeriod.localization_insufficient
- T6:comparison/structural-period-connection: TauCeti.LogAdic.StructuralLogConnection,
  TauCeti.LogAdic.StructuralLogConnection, TauCeti.LogAdic.StructuralLogConnection.generator,
  TauCeti.LogAdic.StructuralLogConnection.transverse,
  TauCeti.LogAdic.StructuralLogConnection.integrable,
  TauCeti.LogAdic.StructuralLogConnection.leibniz,
  TauCeti.LogAdic.StructuralLogConnection.bdr_linear,
  TauCeti.LogAdic.StructuralLogConnection.relative,
  TauCeti.LogAdic.StructuralLogConnection.constants,
  TauCeti.LogAdic.StructuralLogConnection.log_coordinate,
  TauCeti.LogAdic.StructuralLogConnection.normalized_coordinate
- T6:comparison/toric-structural-period-model: TauCeti.LogAdic.toric_structural_period_model
- T6:comparison/log-poincare: TauCeti.LogAdic.log_poincare
- T6:comparison/log-faltings-extension: TauCeti.LogAdic.log_faltings_extension
- T6:comparison/bdr-coefficient-sheaves: TauCeti.LogAdic.BdRCoefficientSheaf,
  TauCeti.LogAdic.BdRCoefficientSheaf, TauCeti.LogAdic.BdRCoefficientSheaf.fil,
  TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_sections, TauCeti.LogAdic.BdRCoefficientSheaf.grade,
  TauCeti.LogAdic.BdRCoefficientSheaf.analytic_etale,
  TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_modules,
  TauCeti.LogAdic.BdRCoefficientSheaf.VectorBundle, TauCeti.LogAdic.BdRCoefficientSheaf.pullback,
  TauCeti.LogAdic.BdRCoefficientSheaf.point, TauCeti.LogAdic.BdRCoefficientSheaf.gr_zero,
  TauCeti.LogAdic.BdRCoefficientSheaf.not_algebraic_tensor,
  TauCeti.LogAdic.BdRCoefficientSheaf.twist
- T6:comparison/filtered-log-connection: TauCeti.LogAdic.FilteredLogConnection,
  TauCeti.LogAdic.FilteredLogConnection, TauCeti.LogAdic.FilteredLogConnection.transversality,
  TauCeti.LogAdic.FilteredLogConnection.t_connection, TauCeti.LogAdic.FilteredLogConnection.higgs,
  TauCeti.LogAdic.FilteredLogConnection.de_rham_complex,
  TauCeti.LogAdic.FilteredLogConnection.higgs_complex,
  TauCeti.LogAdic.FilteredLogConnection.coherent_filtered,
  TauCeti.LogAdic.FilteredLogConnection.trivial, TauCeti.LogAdic.FilteredLogConnection.mod_t_linear,
  TauCeti.LogAdic.FilteredLogConnection.not_unshifted,
  TauCeti.LogAdic.FilteredLogConnection.higgs_twist
- T6:comparison/log-tower-decompletion: TauCeti.LogAdic.log_tower_decompletion
- T6:comparison/log-oc-pushforward: TauCeti.LogAdic.log_oc_pushforward
- T6:comparison/log-riemann-hilbert: TauCeti.LogAdic.LogRH, TauCeti.LogAdic.LogRH,
  TauCeti.LogAdic.LogRH.rank, TauCeti.LogAdic.LogRH.grade, TauCeti.LogAdic.LogRH.plus,
  TauCeti.LogAdic.LogRH.exact, TauCeti.LogAdic.LogRH.map_comp, TauCeti.LogAdic.LogRH.restrict_open,
  TauCeti.LogAdic.LogRH.trivial_log, TauCeti.LogAdic.LogRH.constant, TauCeti.LogAdic.LogRH.zero,
  TauCeti.LogAdic.LogRH.fractional_residue
- T6:comparison/log-higgs-functor: TauCeti.LogAdic.LogHiggs, TauCeti.LogAdic.LogHiggs,
  TauCeti.LogAdic.LogHiggs.underlying, TauCeti.LogAdic.LogHiggs.pushforward_OC,
  TauCeti.LogAdic.LogHiggs.rank, TauCeti.LogAdic.LogHiggs.field, TauCeti.LogAdic.LogHiggs.complex,
  TauCeti.LogAdic.LogHiggs.map_comp, TauCeti.LogAdic.LogHiggs.constant,
  TauCeti.LogAdic.LogHiggs.twist, TauCeti.LogAdic.LogHiggs.residue
- T6:comparison/log-regularity-and-extension: TauCeti.LogAdic.log_regularity_and_extension
- T6:comparison/normalized-log-residues: TauCeti.LogAdic.normalized_log_residues
- T6:comparison/arithmetic-log-de-rham: TauCeti.LogAdic.ArithmeticLogDR,
  TauCeti.LogAdic.ArithmeticLogDR, TauCeti.LogAdic.ArithmeticLogDR.geometric_invariants,
  TauCeti.LogAdic.ArithmeticLogDR.residue_eigenvalues, TauCeti.LogAdic.ArithmeticLogDR.toRH,
  TauCeti.LogAdic.ArithmeticLogDR.toRH_iso_of_isDeRham,
  TauCeti.LogAdic.ArithmeticLogDR.de_rham_grade_rank,
  TauCeti.LogAdic.ArithmeticLogDR.restrict_interior, TauCeti.LogAdic.ArithmeticLogDR.map_comp,
  TauCeti.LogAdic.ArithmeticLogDR.constant, TauCeti.LogAdic.ArithmeticLogDR.tate,
  TauCeti.LogAdic.ArithmeticLogDR.zero, TauCeti.LogAdic.ArithmeticLogDR.non_de_rham
- T6:comparison/log-rh-pullback: TauCeti.LogAdic.log_rh_pullback
- T6:comparison/unipotent-log-tensor: TauCeti.LogAdic.unipotent_log_tensor
- T6:comparison/proper-log-period-cohomology: TauCeti.LogAdic.proper_log_period_cohomology
- T6:comparison/relative-log-comparison: TauCeti.LogAdic.relative_log_comparison
- T6:comparison/canonical-pro-kummer-realizations: TauCeti.LogAdic.CanonicalLogRealizations,
  TauCeti.LogAdic.CanonicalLogRealizations,
  TauCeti.LogAdic.CanonicalLogRealizations.etale_restriction,
  TauCeti.LogAdic.CanonicalLogRealizations.de_rham_extension,
  TauCeti.LogAdic.CanonicalLogRealizations.hecke,
  TauCeti.LogAdic.CanonicalLogRealizations.unipotent_monodromy,
  TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham,
  TauCeti.LogAdic.CanonicalLogRealizations.p_betti, TauCeti.LogAdic.CanonicalLogRealizations.tensor,
  TauCeti.LogAdic.CanonicalLogRealizations.unit, TauCeti.LogAdic.CanonicalLogRealizations.siegel,
  TauCeti.LogAdic.CanonicalLogRealizations.no_levi_connection,
  TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham_unit
- T6:comparison/special-point-comparison: TauCeti.LogAdic.special_point_comparison
- T6:comparison/canonical-arithmetic-monodromy: TauCeti.LogAdic.canonical_arithmetic_monodromy
- T6:comparison/canonical-log-period-comparison: TauCeti.LogAdic.canonical_log_period_comparison
- T6:comparison/two-de-rham-lattices: TauCeti.LogAdic.TwoDeRhamLattices,
  TauCeti.LogAdic.TwoDeRhamLattices, TauCeti.LogAdic.TwoDeRhamLattices.common_localization,
  TauCeti.LogAdic.TwoDeRhamLattices.first_quotient, TauCeti.LogAdic.TwoDeRhamLattices.map,
  TauCeti.LogAdic.TwoDeRhamLattices.fil_eq, TauCeti.LogAdic.TwoDeRhamLattices.horizontal_frame,
  TauCeti.LogAdic.TwoDeRhamLattices.tensor, TauCeti.LogAdic.TwoDeRhamLattices.unit,
  TauCeti.LogAdic.TwoDeRhamLattices.relative_position,
  TauCeti.LogAdic.TwoDeRhamLattices.horizontal_requirement,
  TauCeti.LogAdic.TwoDeRhamLattices.tate_line
- T6:comparison/lattice-hodge-tate-filtration: TauCeti.LogAdic.LatticeHTFiltration,
  TauCeti.LogAdic.LatticeHTFiltration, TauCeti.LogAdic.LatticeHTFiltration.mem,
  TauCeti.LogAdic.LatticeHTFiltration.mono, TauCeti.LogAdic.LatticeHTFiltration.grade,
  TauCeti.LogAdic.LatticeHTFiltration.map, TauCeti.LogAdic.LatticeHTFiltration.locally_split,
  TauCeti.LogAdic.LatticeHTFiltration.weight_zero,
  TauCeti.LogAdic.LatticeHTFiltration.lattice_shift,
  TauCeti.LogAdic.LatticeHTFiltration.correct_denominator,
  TauCeti.LogAdic.LatticeHTFiltration.tate_line, TauCeti.LogAdic.LatticeHTFiltration.siegel_h1
- T6:comparison/canonical-ht-tensor: TauCeti.LogAdic.canonical_ht_tensor
- T6:comparison/hodge-tate-parabolic-reduction: TauCeti.LogAdic.HodgeTateReduction,
  TauCeti.LogAdic.HodgeTateReduction, TauCeti.LogAdic.HodgeTateReduction.torsor_assoc,
  TauCeti.LogAdic.HodgeTateReduction.mem, TauCeti.LogAdic.HodgeTateReduction.isTorsor,
  TauCeti.LogAdic.HodgeTateReduction.levi, TauCeti.LogAdic.HodgeTateReduction.hecke,
  TauCeti.LogAdic.HodgeTateReduction.open_restriction, TauCeti.LogAdic.HodgeTateReduction.torus,
  TauCeti.LogAdic.HodgeTateReduction.siegel, TauCeti.LogAdic.HodgeTateReduction.stabilizer_faithful
- T6:comparison/finite-levi-torsor: TauCeti.LogAdic.FiniteLeviComparison,
  TauCeti.LogAdic.FiniteLeviComparison, TauCeti.LogAdic.FiniteLeviComparison.central_twist,
  TauCeti.LogAdic.FiniteLeviComparison.hecke, TauCeti.LogAdic.FiniteLeviComparison.trivialization,
  TauCeti.LogAdic.FiniteLeviComparison.assoc_bundle,
  TauCeti.LogAdic.FiniteLeviComparison.weight_zero, TauCeti.LogAdic.FiniteLeviComparison.weight_one,
  TauCeti.LogAdic.FiniteLeviComparison.change_generator,
  TauCeti.LogAdic.FiniteLeviComparison.graded_compatibility
- T6:comparison/hodge-type-comparison-agreement: TauCeti.LogAdic.hodge_type_comparison_agreement

### T6

- T6/finite-level-canonical-package: TauCeti.LogAdic.finite_level_canonical_package

-/
