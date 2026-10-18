import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.Analysis.InnerProductSpace.Continuous
import Mathlib.Analysis.Convex.KreinMilman
import Mathlib.Analysis.Complex.Order
import Mathlib.Topology.Algebra.Module.LocallyConvex
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.UniformSpace.UniformConvergence
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.LinearAlgebra.Matrix.PosDef
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import TauCeti.RepresentationTheory.Continuous.MatrixCoefficient
import TauCeti.Analysis.PositiveDefinite.AddGroup
import TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov

/-!
# Smooth representations of local groups, Part II: suggested target statements

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/SmoothRepresentationsOfLocalGroupsPartII.md`. The statements
below suggest Lean forms so that contributors and reviewers converge on names and
signatures; they are not implemented mathematics, and discharging them finishes neither a
layer nor the roadmap.

Shape. The file keeps light definitions with real bodies over carriers that exist at the
pins (Mathlib's `ContRepresentation`, Tau Ceti's `ContRepresentation.IsUnitary`, positive
semidefinite kernels and their Kolmogorov spaces, root pairings, `SL(n, ℚ_p)`), the endpoint
theorems of the layers that are statable over them, and a few unit tests as `example`s.
Objects over reductive `p`-adic groups (unitary induction, Bernstein's admissibility, the
Satake and Kazhdan–Lusztig parametrisations, the Aubert involution, the Fell topology on the
unitary dual as a type) are targets in the reader, not placeholder data here. The Fell
closure and isolation are stated for families of representations, which is what Gan–Savin's
Proposition 11.6 and Corollary 11.7 use.

All proofs are goals; `sorry` is intentional.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

namespace TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII

open scoped InnerProductSpace ComplexOrder BigOperators
open Filter Topology MeasureTheory

noncomputable section

universe u v w

/-! ## SRU.0: unitary representations and functions of positive type -/

section UnitaryRepresentations

variable {G : Type u} [Group G] [TopologicalSpace G]
variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
variable {H' : Type w} [NormedAddCommGroup H'] [InnerProductSpace ℂ H']

/-- Strong continuity: every orbit map `g ↦ π g v` is continuous (node
`SRU.0/strongly-continuous-unitary`). It is stated beside Tau Ceti's
`ContRepresentation.IsUnitary`, not bundled into a new carrier. -/
def IsStronglyContinuous (π : ContRepresentation ℂ G H) : Prop :=
  ∀ v : H, Continuous fun g : G => π g v

/-- Norm continuity of `g ↦ π g` (the hypothesis of Tau Ceti's `matrixCoeff`) implies strong
continuity. -/
theorem IsStronglyContinuous.of_continuous (π : ContRepresentation ℂ G H)
    (hπ : Continuous fun g : G => (π g : H →L[ℂ] H)) : IsStronglyContinuous π := by
  sorry

/-- Unitary equivalence: a linear isometric equivalence intertwining the actions. -/
structure UnitaryEquiv (π : ContRepresentation ℂ G H) (ρ : ContRepresentation ℂ G H') where
  /-- The underlying linear isometric equivalence. -/
  toLinearIsometryEquiv : H ≃ₗᵢ[ℂ] H'
  /-- It intertwines the two actions. -/
  map_apply : ∀ (g : G) (x : H), toLinearIsometryEquiv (π g x) = ρ g (toLinearIsometryEquiv x)

/-- Topological irreducibility: `H ≠ 0` and every closed invariant subspace is `0` or `H`
(the convention of NoncompactQuantumSymmetry M0). -/
def IsTopologicallyIrreducible (π : ContRepresentation ℂ G H) : Prop :=
  Nontrivial H ∧ ∀ W : Submodule ℂ H, IsClosed (W : Set H) →
    (∀ (g : G), ∀ x ∈ W, π g x ∈ W) → W = ⊥ ∨ W = ⊤

/-- In finite dimension topological and algebraic irreducibility agree. -/
theorem isTopologicallyIrreducible_iff_isIrreducible [FiniteDimensional ℂ H]
    (π : ContRepresentation ℂ G H) :
    IsTopologicallyIrreducible π ↔ Representation.IsIrreducible π.toRepresentation := by
  sorry

/-- Functions of positive type (`SRU.0/positive-type-function`, [BHV] Definition C.4.1 without
the continuity clause): `∑ᵢⱼ cᵢ conj(cⱼ) φ(gⱼ⁻¹ gᵢ) ≥ 0`. -/
def IsPositiveType {Γ : Type*} [Group Γ] (φ : Γ → ℂ) : Prop :=
  ∀ (n : ℕ) (c : Fin n → ℂ) (g : Fin n → Γ),
    0 ≤ ∑ i, ∑ j, c i * starRingEnd ℂ (c j) * φ ((g j)⁻¹ * g i)

/-- Positive type is positive semidefiniteness of the kernel `(a, b) ↦ φ (a⁻¹ * b)`, the input of
Tau Ceti's Kolmogorov space. -/
theorem isPositiveType_iff_posSemidef {Γ : Type*} [Group Γ] (φ : Γ → ℂ) :
    IsPositiveType φ ↔ Matrix.PosSemidef (fun a b : Γ => φ (a⁻¹ * b)) := by
  sorry

/-- On `Multiplicative A` positive type is Tau Ceti's subtraction-form positive definiteness. -/
theorem isPositiveType_ofAdd_iff {A : Type*} [AddCommGroup A] (F : A → ℂ) :
    IsPositiveType (fun g : Multiplicative A => F g.toAdd) ↔ TauCeti.IsPositiveDefiniteSub F := by
  sorry

theorem IsPositiveType.apply_inv {Γ : Type*} [Group Γ] {φ : Γ → ℂ} (hφ : IsPositiveType φ)
    (g : Γ) : φ g⁻¹ = starRingEnd ℂ (φ g) := by
  sorry

theorem IsPositiveType.norm_apply_le {Γ : Type*} [Group Γ] {φ : Γ → ℂ} (hφ : IsPositiveType φ)
    (g : Γ) : ‖φ g‖ ≤ (φ 1).re := by
  sorry

/-- `P₁(G)`: continuous normalised functions of positive type. -/
def positiveTypeOne (Γ : Type*) [Group Γ] [TopologicalSpace Γ] : Set (Γ → ℂ) :=
  {φ | Continuous φ ∧ IsPositiveType φ ∧ φ 1 = 1}

/-- `P≤1(G)`. -/
def positiveTypeLeOne (Γ : Type*) [Group Γ] [TopologicalSpace Γ] : Set (Γ → ℂ) :=
  {φ | Continuous φ ∧ IsPositiveType φ ∧ (φ 1).re ≤ 1}

/-- The coefficient `g ↦ ⟪w, π g v⟫` of a strongly continuous representation. -/
def coeff (π : ContRepresentation ℂ G H) (hπ : IsStronglyContinuous π) (w x : H) : C(G, ℂ) where
  toFun g := ⟪w, π g x⟫_ℂ
  continuous_toFun := continuous_const.inner (hπ x)

/-- The positive-type coefficient `g ↦ ⟪x, π g x⟫` (Bekka–de la Harpe–Valette's ⟨π(g)x, x⟩). -/
def ptCoeff (π : ContRepresentation ℂ G H) (hπ : IsStronglyContinuous π) (x : H) : C(G, ℂ) :=
  coeff π hπ x x

theorem ptCoeff_isPositiveType [IsTopologicalGroup G] (π : ContRepresentation ℂ G H)
    (hπ : IsStronglyContinuous π) (hu : TauCeti.ContRepresentation.IsUnitary π) (x : H) :
    IsPositiveType (ptCoeff π hπ x) := by
  sorry

theorem ptCoeff_one (π : ContRepresentation ℂ G H) (hπ : IsStronglyContinuous π) (x : H) :
    ptCoeff π hπ x 1 = (‖x‖ ^ 2 : ℂ) := by
  sorry

/-- Comparison with Tau Ceti's `matrixCoeff` (stated for norm-continuous unitary `π`). -/
theorem ptCoeff_eq_matrixCoeff_inv (π : ContRepresentation ℂ G H)
    (hπ : IsStronglyContinuous π) (hπ' : Continuous π)
    (hu : TauCeti.ContRepresentation.IsUnitary π) (x : H) (g : G) :
    ptCoeff π hπ x g = TauCeti.ContRepresentation.matrixCoeff π hπ' x x g⁻¹ := by
  sorry

theorem ptCoeff_unitaryEquiv (π : ContRepresentation ℂ G H) (ρ : ContRepresentation ℂ G H')
    (hπ : IsStronglyContinuous π) (hρ : IsStronglyContinuous ρ) (T : UnitaryEquiv π ρ) (x : H) :
    ptCoeff ρ hρ (T.toLinearIsometryEquiv x) = ptCoeff π hπ x := by
  sorry

-- test `ptCoeff_trivial`: the trivial representation has constant coefficients `‖x‖²`.
example (x : ℂ) (g : G) :
    ptCoeff (ContRepresentation.ofMonoidHom 1) (fun _ => continuous_const) x g = (‖x‖ ^ 2 : ℂ) := by
  sorry

-- test `not_isPositiveType_neg_one`.
example : ¬ IsPositiveType (fun _ : Multiplicative ℤ => (-1 : ℂ)) := by
  sorry

-- test `isPositiveType_one`.
example : IsPositiveType (fun _ : G => (1 : ℂ)) := by
  sorry

/-- The GNS space of a function of positive type: Tau Ceti's Kolmogorov space of the kernel
`(a, b) ↦ φ (a⁻¹ * b)` (`SRU.0/gns-construction`). -/
abbrev gnsSpace {Γ : Type*} [Group Γ] (φ : Γ → ℂ) (hφ : IsPositiveType φ) :=
  Matrix.PosSemidef.KolmogorovSpace ((isPositiveType_iff_posSemidef φ).1 hφ)

/-- The cyclic vector `Φ 1`. -/
def gnsVector {Γ : Type*} [Group Γ] (φ : Γ → ℂ) (hφ : IsPositiveType φ) : gnsSpace φ hφ :=
  Matrix.PosSemidef.kolmogorovFeature ((isPositiveType_iff_posSemidef φ).1 hφ) 1

/-- GNS existence: the left translation `Φ a ↦ Φ (g * a)` extends to a strongly continuous
unitary representation with `φ = ptCoeff π (Φ 1)` and `Φ 1` cyclic ([BHV] Theorem C.4.10). -/
theorem exists_gnsRep [IsTopologicalGroup G] (φ : G → ℂ) (hφ : IsPositiveType φ)
    (hc : Continuous φ) :
    ∃ (π : ContRepresentation ℂ G (gnsSpace φ hφ)) (hπ : IsStronglyContinuous π),
      TauCeti.ContRepresentation.IsUnitary π ∧
      (∀ g, ptCoeff π hπ (gnsVector φ hφ) g = φ g) ∧
      (Submodule.span ℂ (Set.range fun g : G => π g (gnsVector φ hφ))).topologicalClosure = ⊤ := by
  sorry

/-- GNS uniqueness: two cyclic realisations of the same function of positive type are unitarily
equivalent, by an equivalence matching the cyclic vectors. -/
theorem nonempty_unitaryEquiv_of_ptCoeff_eq [IsTopologicalGroup G] [CompleteSpace H]
    [CompleteSpace H'] (π : ContRepresentation ℂ G H) (ρ : ContRepresentation ℂ G H')
    (hπ : IsStronglyContinuous π) (hρ : IsStronglyContinuous ρ)
    (huπ : TauCeti.ContRepresentation.IsUnitary π) (huρ : TauCeti.ContRepresentation.IsUnitary ρ)
    (ξ : H) (η : H')
    (hξ : (Submodule.span ℂ (Set.range fun g : G => π g ξ)).topologicalClosure = ⊤)
    (hη : (Submodule.span ℂ (Set.range fun g : G => ρ g η)).topologicalClosure = ⊤)
    (h : ∀ g, ptCoeff π hπ ξ g = ptCoeff ρ hρ η g) :
    ∃ T : UnitaryEquiv π ρ, T.toLinearIsometryEquiv ξ = η := by
  sorry

/-- Pure functions of positive type ([BHV] Theorem C.5.2): `φ ∈ P₁(G)` is extreme iff its cyclic
realisations are topologically irreducible. -/
theorem mem_extremePoints_positiveTypeOne_iff [IsTopologicalGroup G] {φ : G → ℂ}
    (hφ : φ ∈ positiveTypeOne G) :
    φ ∈ (positiveTypeOne G).extremePoints ℝ ↔
      ∀ (K : Type u) [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
        (π : ContRepresentation ℂ G K) (hπ : IsStronglyContinuous π) (ξ : K),
        TauCeti.ContRepresentation.IsUnitary π →
        (Submodule.span ℂ (Set.range fun g : G => π g ξ)).topologicalClosure = ⊤ →
        (∀ g, ptCoeff π hπ ξ g = φ g) → IsTopologicallyIrreducible π := by
  sorry

/-- The `K`-fixed subspace. -/
def fixedSubspace (π : ContRepresentation ℂ G H) (K : Subgroup G) : Submodule ℂ H :=
  ⨅ k : K, LinearMap.ker ((π (k : G) : H →ₗ[ℂ] H) - LinearMap.id)

/-- Smooth vectors: the vectors fixed by some compact open subgroup. -/
def smoothVectors (π : ContRepresentation ℂ G H) : Submodule ℂ H :=
  ⨆ (K : OpenSubgroup G) (_ : IsCompact (K : Set G)), fixedSubspace π (K : Subgroup G)

/-- Smooth vectors are dense for strongly continuous representations of locally profinite
groups (`SRU.0/smooth-vectors-unitary`). -/
theorem smoothVectors_dense [CompleteSpace H] [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] (π : ContRepresentation ℂ G H) (hπ : IsStronglyContinuous π)
    (hu : TauCeti.ContRepresentation.IsUnitary π) :
    (smoothVectors π).topologicalClosure = ⊤ := by
  sorry

end UnitaryRepresentations

/-! ## SRU.1: weak containment, Raikov and the Fell closure -/

section WeakContainment

variable {G : Type u} [Group G] [TopologicalSpace G]
variable {Hσ : Type v} [NormedAddCommGroup Hσ] [InnerProductSpace ℂ Hσ]

/-- Weak containment of `σ` in a family `(πᵢ)` (equivalently in its Hilbert sum): each
coefficient of `σ` is approximated uniformly on compact sets by finite sums of coefficients of
the `πᵢ` ([BHV] Definition F.1.1). -/
def WeaklyContainedIn (σ : ContRepresentation ℂ G Hσ) (hσ : IsStronglyContinuous σ)
    {ι : Type*} {Hπ : ι → Type*} [∀ i, NormedAddCommGroup (Hπ i)]
    [∀ i, InnerProductSpace ℂ (Hπ i)] (π : ∀ i, ContRepresentation ℂ G (Hπ i))
    (hπ : ∀ i, IsStronglyContinuous (π i)) : Prop :=
  ∀ (x : Hσ) (Q : Set G), IsCompact Q → ∀ ε : ℝ, 0 < ε →
    ∃ (n : ℕ) (idx : Fin n → ι) (y : ∀ j, Hπ (idx j)),
      ∀ g ∈ Q, ‖ptCoeff σ hσ x g - ∑ j, ptCoeff (π (idx j)) (hπ (idx j)) (y j) g‖ < ε

/-- Membership in the Fell closure of a family: every basic Fell neighbourhood of `σ` meets
the family ([BHV] Definition F.2.1). -/
def InFellClosure (σ : ContRepresentation ℂ G Hσ) (hσ : IsStronglyContinuous σ)
    {ι : Type*} {Hπ : ι → Type*} [∀ i, NormedAddCommGroup (Hπ i)]
    [∀ i, InnerProductSpace ℂ (Hπ i)] (π : ∀ i, ContRepresentation ℂ G (Hπ i))
    (hπ : ∀ i, IsStronglyContinuous (π i)) : Prop :=
  ∀ (n : ℕ) (x : Fin n → Hσ) (Q : Set G), IsCompact Q → ∀ ε : ℝ, 0 < ε →
    ∃ i : ι, ∀ k, ∃ (m : ℕ) (y : Fin m → Hπ i),
      ∀ g ∈ Q, ‖ptCoeff σ hσ (x k) g - ∑ j, ptCoeff (π i) (hπ i) (y j) g‖ < ε

/-- `σ` is isolated relative to the family: some basic Fell neighbourhood of `σ` contains only
members unitarily equivalent to `σ`. -/
def IsFellIsolatedIn (σ : ContRepresentation ℂ G Hσ) (hσ : IsStronglyContinuous σ)
    {ι : Type*} {Hπ : ι → Type*} [∀ i, NormedAddCommGroup (Hπ i)]
    [∀ i, InnerProductSpace ℂ (Hπ i)] (π : ∀ i, ContRepresentation ℂ G (Hπ i))
    (hπ : ∀ i, IsStronglyContinuous (π i)) : Prop :=
  ∃ (n : ℕ) (x : Fin n → Hσ) (Q : Set G), IsCompact Q ∧ ∃ ε : ℝ, 0 < ε ∧
    ∀ i, (∀ k, ∃ (m : ℕ) (y : Fin m → Hπ i),
      ∀ g ∈ Q, ‖ptCoeff σ hσ (x k) g - ∑ j, ptCoeff (π i) (hπ i) (y j) g‖ < ε) →
      Nonempty (UnitaryEquiv σ (π i))

-- test `weaklyContained_refl`.
example (σ : ContRepresentation ℂ G Hσ) (hσ : IsStronglyContinuous σ) :
    WeaklyContainedIn σ hσ (fun _ : Unit => σ) (fun _ => hσ) := by
  sorry

/-- Milman's converse to the Krein–Milman theorem. -/
theorem extremePoints_closure_convexHull_subset_closure {E : Type*} [AddCommGroup E]
    [Module ℝ E] [TopologicalSpace E] [T2Space E] [IsTopologicalAddGroup E] [ContinuousSMul ℝ E]
    [LocallyConvexSpace ℝ E] {F : Set E} (hC : IsCompact (closure (convexHull ℝ F))) :
    (closure (convexHull ℝ F)).extremePoints ℝ ⊆ closure F := by
  sorry

/-- Raikov's theorem ([BHV] Theorem C.5.6): on `P₁(G)` the weak-`*` topology from `L¹(G)` and
uniform convergence on compact sets agree, stated for nets. -/
theorem raikov [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
    [SecondCountableTopology G] [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [μ.IsHaarMeasure] {ι : Type*} {l : Filter ι} (φ : ι → G → ℂ) (ψ : G → ℂ)
    (hφ : ∀ i, φ i ∈ positiveTypeOne G) (hψ : ψ ∈ positiveTypeOne G) :
    (∀ f : G → ℂ, Integrable f μ →
        Tendsto (fun i => ∫ g, φ i g * f g ∂μ) l (𝓝 (∫ g, ψ g * f g ∂μ))) ↔
      ∀ Q : Set G, IsCompact Q → TendstoUniformlyOn φ ψ l Q := by
  sorry

variable [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [SecondCountableTopology G]
variable [CompleteSpace Hσ]

/-- Irreducible weak containment by single normalised coefficients ([BHV] Proposition F.1.4). -/
theorem exists_coeff_approx_of_weaklyContainedIn (σ : ContRepresentation ℂ G Hσ)
    (hσ : IsStronglyContinuous σ) (huσ : TauCeti.ContRepresentation.IsUnitary σ)
    (hirr : IsTopologicallyIrreducible σ)
    {ι : Type*} {Hπ : ι → Type*} [∀ i, NormedAddCommGroup (Hπ i)]
    [∀ i, InnerProductSpace ℂ (Hπ i)] [∀ i, CompleteSpace (Hπ i)]
    (π : ∀ i, ContRepresentation ℂ G (Hπ i)) (hπ : ∀ i, IsStronglyContinuous (π i))
    (huπ : ∀ i, TauCeti.ContRepresentation.IsUnitary (π i))
    (h : WeaklyContainedIn σ hσ π hπ) (x : Hσ) (hx : ‖x‖ = 1) (Q : Set G) (hQ : IsCompact Q)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ (i : ι) (y : Hπ i), ‖y‖ = 1 ∧ ∀ g ∈ Q, ‖ptCoeff σ hσ x g - ptCoeff (π i) (hπ i) y g‖ < ε := by
  sorry

/-- Gan–Savin Proposition 11.6, corrected: an irreducible `σ` weakly contained in the Hilbert
sum of a family lies in the Fell closure of the family (no subsequence statement). -/
theorem inFellClosure_of_weaklyContainedIn (σ : ContRepresentation ℂ G Hσ)
    (hσ : IsStronglyContinuous σ) (huσ : TauCeti.ContRepresentation.IsUnitary σ)
    (hirr : IsTopologicallyIrreducible σ)
    {ι : Type*} {Hπ : ι → Type*} [∀ i, NormedAddCommGroup (Hπ i)]
    [∀ i, InnerProductSpace ℂ (Hπ i)] [∀ i, CompleteSpace (Hπ i)]
    (π : ∀ i, ContRepresentation ℂ G (Hπ i)) (hπ : ∀ i, IsStronglyContinuous (π i))
    (huπ : ∀ i, TauCeti.ContRepresentation.IsUnitary (π i))
    (h : WeaklyContainedIn σ hσ π hπ) : InFellClosure σ hσ π hπ := by
  sorry

/-- Gan–Savin Corollary 11.7, relative form (as Gan–Ichino use it): an isolated irreducible `σ`
weakly contained in the Hilbert sum of a family is equivalent to a member. -/
theorem exists_unitaryEquiv_of_isolated (σ : ContRepresentation ℂ G Hσ)
    (hσ : IsStronglyContinuous σ) (huσ : TauCeti.ContRepresentation.IsUnitary σ)
    (hirr : IsTopologicallyIrreducible σ)
    {ι : Type*} {Hπ : ι → Type*} [∀ i, NormedAddCommGroup (Hπ i)]
    [∀ i, InnerProductSpace ℂ (Hπ i)] [∀ i, CompleteSpace (Hπ i)]
    (π : ∀ i, ContRepresentation ℂ G (Hπ i)) (hπ : ∀ i, IsStronglyContinuous (π i))
    (huπ : ∀ i, TauCeti.ContRepresentation.IsUnitary (π i))
    (hiso : IsFellIsolatedIn σ hσ π hπ) (h : WeaklyContainedIn σ hσ π hπ) :
    ∃ i, Nonempty (UnitaryEquiv σ (π i)) := by
  sorry

end WeakContainment

/-! ## SRU.2: unitary structures on smooth representations -/

section UnitaryStructures

variable {G : Type u} [Group G] [TopologicalSpace G]
variable {V : Type v} [AddCommGroup V] [Module ℂ V]

/-- A unitary structure: an invariant positive-definite hermitian form, completeness not assumed
(Bernstein's Definition 27). -/
def IsUnitarizable (ρ : Representation ℂ G V) : Prop :=
  ∃ c : InnerProductSpace.Core ℂ V,
    ∀ (g : G) (x y : V), c.inner (ρ g x) (ρ g y) = c.inner x y

/-- The `K`-invariants of a representation, as a submodule. -/
def invariantsOf (ρ : Representation ℂ G V) (K : Subgroup G) : Submodule ℂ V :=
  ⨅ k : K, LinearMap.ker (ρ (k : G) - LinearMap.id)

-- test `isUnitarizable_trivial`.
example : IsUnitarizable (Representation.trivial ℂ G ℂ) := by
  sorry

/-- Uniqueness of the unitary structure on an irreducible admissible smooth representation
([Ber92] Lemma 38; [Cas95] Proposition 2.1.15). Smoothness and admissibility are explicit. -/
theorem unitaryStructure_unique [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] (ρ : Representation ℂ G V) (hirr : Representation.IsIrreducible ρ)
    (hsmooth : ∀ x : V, ∃ K : OpenSubgroup G, IsCompact (K : Set G) ∧ ∀ k ∈ K, ρ k x = x)
    (hadm : ∀ K : OpenSubgroup G, IsCompact (K : Set G) →
      FiniteDimensional ℂ (invariantsOf ρ (K : Subgroup G)))
    (c c' : InnerProductSpace.Core ℂ V)
    (hc : ∀ (g : G) (x y : V), c.inner (ρ g x) (ρ g y) = c.inner x y)
    (hc' : ∀ (g : G) (x y : V), c'.inner (ρ g x) (ρ g y) = c'.inner x y) :
    ∃ t : ℝ, 0 < t ∧ ∀ x y : V, c'.inner x y = (t : ℂ) * c.inner x y := by
  sorry

/-- Admissible unitarizable representations are semisimple: every subrepresentation has an
invariant complement ([Cas95] Proposition 2.1.5). -/
theorem exists_invariant_isCompl_of_unitarizable [IsTopologicalGroup G] [LocallyCompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] (ρ : Representation ℂ G V)
    (hu : IsUnitarizable ρ)
    (hadm : ∀ K : OpenSubgroup G, IsCompact (K : Set G) →
      FiniteDimensional ℂ (invariantsOf ρ (K : Subgroup G)))
    (hsmooth : ∀ x : V, ∃ K : OpenSubgroup G, IsCompact (K : Set G) ∧ ∀ k ∈ K, ρ k x = x)
    (U : Submodule ℂ V) (hU : ∀ (g : G), ∀ x ∈ U, ρ g x ∈ U) :
    ∃ U' : Submodule ℂ V, IsCompl U U' ∧ ∀ (g : G), ∀ x ∈ U', ρ g x ∈ U' := by
  sorry

end UnitaryStructures

/-! ## SRU.4: the Howe–Moore theorem, for `SL(n, ℚ_p)` -/

section HoweMoore

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Howe–Moore for `SL(n, ℚ_p)`, `n ≥ 2` (simply connected, so `G⁺ = G`): a strongly continuous
unitary representation without nonzero invariant vectors has coefficients vanishing at
infinity. The reader states the theorem for every almost simple isotropic group over a
nonarchimedean local field. -/
theorem howeMoore_specialLinearGroup (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : 2 ≤ n)
    (π : ContRepresentation ℂ (Matrix.SpecialLinearGroup (Fin n) ℚ_[p]) H)
    (hπ : IsStronglyContinuous π) (hu : TauCeti.ContRepresentation.IsUnitary π)
    (hinv : ∀ x : H, (∀ g, π g x = x) → x = 0) (x y : H) :
    Tendsto (fun g => ⟪y, π g x⟫_ℂ) (cocompact _) (𝓝 0) := by
  sorry

end HoweMoore

/-! ## SRU.5 and SRU.7: half-integral real parameters on a root pairing -/

section HalfIntegral

variable {ι M N : Type*} [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]
  (P : RootPairing ι ℝ M N)

/-- Half-integrality of a real parameter `ν ∈ X ⊗ ℝ` for a set `S` of weights of the dual group
(elements of the coweight side `N`): every pairing lies in `½ℤ` (Ciubotaru–Harris
Definition 6.3). The adjoint representation has `S = range P.coroot`. -/
def IsHalfIntegral (S : Set N) (ν : M) : Prop :=
  ∀ χ ∈ S, ∃ k : ℤ, P.toLinearMap ν χ = (k : ℝ) / 2

theorem isHalfIntegral_adjoint_iff (ν : M) :
    IsHalfIntegral P (Set.range P.coroot) ν ↔ ∀ i, ∃ k : ℤ, P.coroot' i ν = (k : ℝ) / 2 := by
  sorry

/-- Ciubotaru–Harris (6.12): a uniform shift `ε` of the half-integral lattice on all coroots is
`0` or `¼`, and `0` as soon as some coroot is a sum of two coroots (rank at least two). -/
theorem halfIntegral_shift_eq (ν : M) (ε : ℝ) (hε0 : 0 ≤ ε) (hε : ε < 1 / 2) [Nonempty ι]
    (h : ∀ i, ∃ k : ℤ, P.coroot' i ν = ε + (k : ℝ) / 2) :
    (ε = 0 ∨ ε = 1 / 4) ∧
      ((∃ i j l, P.coroot i + P.coroot j = P.coroot l) → ε = 0) := by
  sorry

-- test `halfIntegral_zero`.
example (S : Set N) : IsHalfIntegral P S 0 := by
  sorry

end HalfIntegral

/-- Ciubotaru–Harris §8.3: the extra unitary region of the orbit `4A₁` of `E₈` contains no
parameter that is half-integral for the adjoint representation. -/
theorem e8_fourA1_extra_region_not_halfIntegral (ν : Fin 4 → ℝ)
    (hmono : 0 ≤ ν 0 ∧ ν 0 ≤ ν 1 ∧ ν 1 ≤ ν 2 ∧ ν 2 ≤ ν 3)
    (hregion : ν 0 + ν 3 < 1 ∧ ν 1 + ν 2 < 1 ∧ 1 < ν 1 + ν 3 ∧
      -ν 0 + ν 2 + ν 3 < 3 / 2 ∧ 3 / 2 < ν 0 + ν 2 + ν 3)
    (hhalf : (∀ i, ∃ k : ℤ, ν i = (k : ℝ) / 2) ∨ (∀ i, ∃ k : ℤ, ν i = 1 / 4 + (k : ℝ) / 2)) :
    False := by
  sorry

-- test for `SRU.5/g2-noncentral-witness`: on the positive coroots `aα₁^∨ + bα₂^∨` of `G₂`, the
-- value `(-1)^a q^(b/2)` equals `q^{±1}` only if `a` is even and `b = 2`; no positive coroot has
-- that shape, so `X(s)` is irreducible.
example : ∀ ab ∈ [((1 : ℕ), (0 : ℕ)), (0, 1), (1, 1), (2, 1), (3, 1), (3, 2)],
    ¬ (ab.1 % 2 = 0 ∧ ab.2 = 2) := by
  decide

end

end TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII
