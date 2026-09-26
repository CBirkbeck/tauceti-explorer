/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. This is a partial, uncompiled prototype at the recorded library pins.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369

The topology, dense-intermediate-field, finite-generator, tower/base-change,
wild-automorphism and specialization-chain signatures use the actual pinned carriers.
The remaining signatures require supplier types or unclosed mathematical interfaces.
They are listed at the end, not represented by arbitrary Prop fields or assumed theorem
packages. No implementation or successful elaboration is claimed.

Source locators: Scholze, ECD v4, Definition 21.2, Lemma 21.3, Proposition 21.16 and
Lemma 21.17; Kelly--Saito--Tamme, Lemma 6.6. The chain-space construction below does
not establish the quasi-augmented cohomological descent theorem used in that lemma.
-/
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.Sober
import Mathlib.FieldTheory.IntermediateField.Basic
import Mathlib.RingTheory.AlgebraicIndependent.Basic
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.Data.ENat.Lattice
import Mathlib.Analysis.Normed.Field.Ultra
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Topology.Spectral.ConstructibleTopology
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.Topology.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

noncomputable section
open TopologicalSpace

namespace TauCeti.DiamondEtale

universe u v w

section FibreDimension
variable {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]

/-- The supremum of topological Krull dimensions of the actual fibre subspaces. -/
def fibreDimension {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : WithBot ℕ∞ := by sorry

lemma fibreDimension_eq_iSup (f : X → Y) :
    fibreDimension f = ⨆ y : Y, topologicalKrullDim {x : X // f x = y} := by sorry

lemma fibreDimension_le_iff (f : X → Y) (d : WithBot ℕ∞) :
    fibreDimension f ≤ d ↔ ∀ y : Y, topologicalKrullDim {x : X // f x = y} ≤ d := by sorry

lemma fibreDimension_homeomorph
    {X' : Type w} {Y' : Type w} [TopologicalSpace X'] [TopologicalSpace Y']
    (eX : X ≃ₜ X') (eY : Y ≃ₜ Y') (f : X → Y) (g : X' → Y')
    (h : ∀ x, g (eX x) = eY (f x)) : fibreDimension f = fibreDimension g := by sorry

lemma fibreDimension_id [Nonempty X] : fibreDimension (id : X → X) = 0 := by sorry

-- fibreDimension_empty
example [IsEmpty X] (f : X → Y) : fibreDimension f = ⊥ := by sorry

-- fibreDimension_identity
example [Nonempty X] : fibreDimension (id : X → X) = 0 := by sorry

-- fibreDimension_toPoint
example : fibreDimension (fun _ : X => (PUnit.unit : PUnit)) = topologicalKrullDim X := by sorry

-- fibreDimension_emptyTarget
example [IsEmpty X] : fibreDimension (id : X → X) = ⊥ := by sorry
end FibreDimension

section DenseIntermediateFields
variable (K : Type u) (L : Type u) [Field K] [Field L] [Algebra K L]
variable [TopologicalSpace L]

/-- Infimum of finite algebraic transcendence bounds witnessed by a dense intermediate field. -/
def topologicalTrdeg (K L : Type u) [Field K] [Field L] [Algebra K L]
    [TopologicalSpace L] : ℕ∞ := by sorry

lemma topologicalTrdeg_le_iff (n : ℕ) :
    topologicalTrdeg K L ≤ n ↔
      ∃ A : IntermediateField K L, Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal) := by sorry

lemma topologicalTrdeg_le_of_dense (A : IntermediateField K L) (n : ℕ)
    (hd : Dense (A : Set L)) (ht : Algebra.trdeg K A ≤ (n : Cardinal)) :
    topologicalTrdeg K L ≤ n := by sorry

lemma topologicalTrdeg_eq_top_iff :
    topologicalTrdeg K L = ⊤ ↔
      ∀ n : ℕ, ¬ ∃ A : IntermediateField K L,
        Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal) := by sorry

lemma topologicalTrdeg_self [TopologicalSpace K] : topologicalTrdeg K K = 0 := by sorry

lemma topologicalTrdeg_equiv {M : Type u} [Field M] [Algebra K M]
    [TopologicalSpace M] (e : L ≃ₐ[K] M) (he : IsHomeomorph (e : L → M)) :
    topologicalTrdeg K L = topologicalTrdeg K M := by sorry

-- topologicalTrdeg_self_test
example [TopologicalSpace K] : topologicalTrdeg K K = 0 := by sorry

-- topologicalTrdeg_dense_algebraic
example (A : IntermediateField K L) [Algebra.IsAlgebraic K A]
    (hd : Dense (A : Set L)) : topologicalTrdeg K L = 0 := by sorry

-- topologicalTrdeg_discrete_one
example [DiscreteTopology L] (h : Algebra.trdeg K L = 1) :
    topologicalTrdeg K L = 1 := by sorry

-- topologicalTrdeg_discrete_infinite
example [DiscreteTopology L] (h : Cardinal.aleph0 ≤ Algebra.trdeg K L) :
    topologicalTrdeg K L = ⊤ := by sorry
end DenseIntermediateFields

/-!
## Complete fields: the unmodified invariant

All embeddings in this block are explicitly isometric. The algebra towers express the
commuting squares, rather than implicitly identifying unrelated field embeddings.

Closed algebraically closed intermediate fields express the finite-generator condition
intrinsically. This is not an unconstrained predicate field. Closedness in the complete
ambient normed field supplies completeness with the subspace metric.

Important proof boundary: the pinned `IsAlgClosed.of_denseRange` requires `CharZero`.
It cannot discharge the positive-characteristic completion step needed here. Conrad's
"Completion of algebraic closure", Section 2, supplies a characteristic-independent
root-approximation proof; its adaptation and the remaining proof leaves are recorded in
the handoff, not assumed to be compiled library results.
-/
section CompleteFields
variable (K L M : Type u)
variable [NontriviallyNormedField K] [NontriviallyNormedField L]
variable [NontriviallyNormedField M]
variable [CompleteSpace K] [CompleteSpace L] [CompleteSpace M]
variable [IsUltrametricDist K] [IsUltrametricDist L] [IsUltrametricDist M]
variable [IsAlgClosed K] [IsAlgClosed L] [IsAlgClosed M]

/-- `DiamondEtaleCohomology:C8/finite-topological-generators`.
The tuple may contain repetitions, permitting padding from fewer than n generators. -/
lemma finite_topological_generators [Algebra K L]
    (hKL : Isometry (algebraMap K L)) (n : ℕ) :
    topologicalTrdeg K L ≤ n ↔
      ∃ t : Fin n → L, ∀ A : IntermediateField K L,
        IsClosed (A : Set L) → IsAlgClosed A →
        (∀ i, t i ∈ A) → A = ⊤ := by sorry

/-- `DiamondEtaleCohomology:C8/topological-trdeg-tower`. -/
lemma topological_trdeg_tower [Algebra K L] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    topologicalTrdeg K M ≤ topologicalTrdeg L M + topologicalTrdeg K L := by sorry

/-- `DiamondEtaleCohomology:C8/topological-trdeg-base-change`.
The density hypothesis concerns the relative algebraic closure of the compositum in L'.
It is neither an arbitrary square nor a requirement that the bare compositum be dense. -/
lemma topological_trdeg_base_change
    (K' L' : Type u) [NontriviallyNormedField K'] [NontriviallyNormedField L']
    [CompleteSpace K'] [CompleteSpace L'] [IsUltrametricDist K'] [IsUltrametricDist L']
    [IsAlgClosed K'] [IsAlgClosed L']
    [Algebra K K'] [Algebra K L] [Algebra K L'] [Algebra K' L'] [Algebra L L']
    [IsScalarTower K K' L'] [IsScalarTower K L L']
    (hKK' : Isometry (algebraMap K K')) (hKL : Isometry (algebraMap K L))
    (hK'L' : Isometry (algebraMap K' L')) (hLL' : Isometry (algebraMap L L'))
    (hd : Dense {x : L' |
      IsAlgebraic (IntermediateField.adjoin L (Set.range (algebraMap K' L'))) x}) :
    topologicalTrdeg L L' ≤ topologicalTrdeg K K' := by sorry
end CompleteFields

/-! ## The characteristic-p wild subgroup, on Tau Ceti's actual pro-p carrier -/
section WildAutomorphisms
open Filter
open scoped Topology
variable {p : ℕ} {C : Type u}
variable [NontriviallyNormedField C] [CompleteSpace C]
variable [IsUltrametricDist C] [IsAlgClosed C] [CharP C p]

/-- `DiamondEtaleCohomology:C8/wild-automorphism`, ECD Lemma 21.17.
The inequality is the literal trivial-action condition on leading multiplicative terms.
Factorial-power convergence is an assumption, not inferred merely from continuity. -/
lemma wild_automorphism (hp : p.Prime) (γ : C ≃+* C) (hγ : Continuous γ)
    (hfactorial : ∀ x : C,
      Tendsto (fun n : ℕ => (γ ^ Nat.factorial n) x) atTop (𝓝 x))
    (hleading : ∀ x : C, x ≠ 0 → ‖γ x / x - 1‖ < 1) :
    ∀ x : C, Tendsto (fun n : ℕ => (γ ^ (p ^ n)) x) atTop (𝓝 x) := by sorry

/-- `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, the first step of ECD 21.16.
P is identified by its actual membership condition, not an opaque wildness proposition.
Faithfulness excludes an invisible non-pro-p kernel in the action. -/
lemma wild_kernel_pro_p (hp : p.Prime)
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    (ρ : G →* (C ≃+* C)) (hfaithful : Function.Injective ρ)
    (hact : Continuous (fun gx : G × C => ρ gx.1 gx.2))
    (P : Subgroup G) (hclosed : IsClosed (P : Set G))
    (hP : ∀ g : G, g ∈ P ↔ ∀ x : C, x ≠ 0 → ‖ρ g x / x - 1‖ < 1) :
    TauCeti.IsProP p P := by sorry

-- Supplemental regression: identity automorphism satisfies both convergence conclusions.
example (x : C) :
    Tendsto (fun n : ℕ => ((RingEquiv.refl C) ^ Nat.factorial n) x) atTop (𝓝 x) ∧
      Tendsto (fun n : ℕ => ((RingEquiv.refl C) ^ (p ^ n)) x) atTop (𝓝 x) := by sorry

-- Supplemental regression: the leading-term condition omits zero, where division is totalized.
example : ¬ ‖(RingEquiv.refl C) 0 / (0 : C) - 1‖ < 1 := by sorry
end WildAutomorphisms

/-!
## Specialization chains in the constructible topology

The chain relation is always evaluated in the ORIGINAL topology on X. Using specialization
in `WithConstructibleTopology X` instead would retain only constant chains for spectral X.
The carrier is a subtype of the finite product of Mathlib's existing constructible-topology
synonym. `SpecializationChain` is its helper spelling, not a new spectral-space carrier.
-/
section SpecializationChains
open CategoryTheory
open scoped Simplicial
variable (X : Type u) [TopologicalSpace X]

/-- Helper carrier for the single construction node
`DiamondEtaleCohomology:C8/specialization-chain-space`. -/
abbrev SpecializationChain (X : Type u) [TopologicalSpace X] (n : ℕ) : Type u :=
  {c : Fin (n + 1) → WithConstructibleTopology X //
    ∀ i j, i ≤ j →
      Specializes (WithTopology.ofTopology (c i) : X) (WithTopology.ofTopology (c j) : X)}

/-- The simplicial TOPological space of specialization chains, not an ordinary hypercover
with an augmentation obtained by taking the first vertex. The object carrier and maps on
points are given explicitly; continuity and functor laws remain proof obligations. -/
def specializationChainSpace : SimplicialObject TopCat.{u} where
  obj n := TopCat.of (SpecializationChain X n.unop.len)
  map {n m} θ := TopCat.ofHom {
    toFun := fun c => ⟨fun i => c.val (θ.unop.toOrderHom i),
      fun i j hij => c.property _ _ (θ.unop.toOrderHom.monotone hij)⟩
    continuous_toFun := by sorry }
  map_id := by sorry
  map_comp := by sorry

/-- The degree-zero chain space is the EXISTING constructible-topology space. -/
def specializationChainSpace_zero : SpecializationChain X 0 ≃ₜ WithConstructibleTopology X := by
  sorry

-- Coordinate contract of the preceding comparison; helper, not another packet node.
lemma specializationChainSpace_zero_apply (c : SpecializationChain X 0) :
    specializationChainSpace_zero X c = c.val 0 := by sorry

lemma specializationChainSpace_face {n : ℕ} (i : Fin (n + 2))
    (c : SpecializationChain X (n + 1)) (j : Fin (n + 1)) :
    ((specializationChainSpace X).δ i c).val j =
      c.val ((SimplexCategory.δ i).toOrderHom j) := by sorry

lemma specializationChainSpace_degeneracy {n : ℕ} (i : Fin (n + 1))
    (c : SpecializationChain X n) (j : Fin (n + 2)) :
    ((specializationChainSpace X).σ i c).val j =
      c.val ((SimplexCategory.σ i).toOrderHom j) := by sorry

/-- In positive degree, nondegeneracy is failure to lie in every elementary degeneracy image.
T0 is necessary for a repeated nonadjacent vertex to force an adjacent repetition. -/
lemma specializationChainSpace_nondegenerate [T0Space X] {n : ℕ}
    (c : SpecializationChain X (n + 1)) :
    (¬ ∃ (i : Fin (n + 1)) (d : SpecializationChain X n),
        (specializationChainSpace X).σ i d = c) ↔ Function.Injective c.val := by sorry

-- specializationChainSpace_empty
example [IsEmpty X] (n : ℕ) : IsEmpty (SpecializationChain X n) := by sorry

-- specializationChainSpace_point: existence and uniqueness, including degree zero.
example [Unique X] (n : ℕ) : Unique (SpecializationChain X n) := by sorry
example [Unique X] (n : ℕ) (c : SpecializationChain X (n + 1)) :
    ∃ (i : Fin (n + 1)) (d : SpecializationChain X n),
      (specializationChainSpace X).σ i d = c := by sorry

-- specializationChainSpace_discrete: stronger than the two-point discrete regression.
example [DiscreteTopology X] (n : ℕ) (c : SpecializationChain X n)
    (i j : Fin (n + 1)) : c.val i = c.val j := by sorry

-- specializationChainSpace_twoPointChain: Prop with Mathlib's Sierpinski topology.
example :
    (∃! c : SpecializationChain Prop 1, Function.Injective c.val) ∧
      ¬ ∃ c : SpecializationChain Prop 2, Function.Injective c.val := by sorry

-- Supplemental regression: first-vertex projection does NOT commute with face zero.
-- The unique nondegenerate Sierpinski edge changes its first vertex when that face is taken.
example : ∃ c : SpecializationChain Prop 1,
    WithTopology.ofTopology (((specializationChainSpace Prop).δ (0 : Fin 2) c).val 0) ≠
      WithTopology.ofTopology (c.val 0) := by sorry
end SpecializationChains

section Specialization
attribute [local instance] specializationOrder

-- DiamondEtaleCohomology:C8/specialization-dimension
lemma specialization_dimension (X : Type u) [TopologicalSpace X]
    [QuasiSober X] [T0Space X] :
    topologicalKrullDim X = Order.krullDim X := by sorry
end Specialization

end TauCeti.DiamondEtale

/-
Unwritten signatures (precise statements, dependencies, API and tests are in the packet).
The following 50 node signatures remain omitted; none is discharged by a comment.

DiamondEtaleCohomology:C8/modified-topological-trdeg — Modified topological transcendence degree
  API awaiting supplier types: modifiedTopologicalTrdeg_le_iff
  API awaiting supplier types: modifiedTopologicalTrdeg_le
  API awaiting supplier types: modifiedTopologicalTrdeg_mono
  API awaiting supplier types: modifiedTopologicalTrdeg_equiv
  Test awaiting supplier types: modifiedTopologicalTrdeg_identity
  Test awaiting supplier types: modifiedTopologicalTrdeg_zeroWitness
  Test awaiting supplier types: modifiedTopologicalTrdeg_noFiniteWitness
  Test awaiting supplier types: modifiedTopologicalTrdeg_vsOriginal

DiamondEtaleCohomology:C8/modified-trdeg-tower — Modified transcendence degree in a tower
DiamondEtaleCohomology:C8/modified-trdeg-base-change — Modified transcendence degree after base change

DiamondEtaleCohomology:C8/analytic-dim-trg — Geometric transcendence dimension of an analytic map
  API awaiting supplier types: analyticDimTrg_le_iff
  API awaiting supplier types: analyticDimTrg_equiv
  API awaiting supplier types: analyticDimTrg_empty
  API awaiting supplier types: analyticDimTrg_field
  Test awaiting supplier types: analyticDimTrg_empty_test
  Test awaiting supplier types: analyticDimTrg_identity_point
  Test awaiting supplier types: analyticDimTrg_field_test

DiamondEtaleCohomology:C8/analytic-dimension-bound — Topological dimension bounded by geometric transcendence dimension

DiamondEtaleCohomology:C8/diamond-dim-trg — Geometric transcendence dimension of a diamond map
  API awaiting supplier types: diamondDimTrg_le_iff
  API awaiting supplier types: diamondDimTrg_vstack
  API awaiting supplier types: diamondDimTrg_empty
  API awaiting supplier types: diamondDimTrg_point
  API awaiting supplier types: diamondDimTrg_representative
  Test awaiting supplier types: diamondDimTrg_empty_test
  Test awaiting supplier types: diamondDimTrg_identity_point
  Test awaiting supplier types: diamondDimTrg_field_test
  Test awaiting supplier types: diamondDimTrg_bottom

DiamondEtaleCohomology:C8/diamond-dim-base-change — Geometric transcendence dimension under pullback
DiamondEtaleCohomology:C8/diamond-dim-composition — Geometric transcendence dimension of a composite

DiamondEtaleCohomology:C8/locally-finite-dim-trg — Local finiteness of geometric transcendence dimension
  API awaiting supplier types: locallyFiniteDimTrg_of_bound
  API awaiting supplier types: locallyFiniteDimTrg_openCover
  API awaiting supplier types: locallyFiniteDimTrg_baseChange
  API awaiting supplier types: locallyFiniteDimTrg_identity
  Test awaiting supplier types: locallyFiniteDimTrg_empty
  Test awaiting supplier types: locallyFiniteDimTrg_identity_test
  Test awaiting supplier types: locallyFiniteDimTrg_localNotUniform

DiamondEtaleCohomology:C8/strictly-disconnected-acyclic — Étale acyclicity of strictly totally disconnected spaces
DiamondEtaleCohomology:C8/qpetale-direct-image — Degree-zero direct image for quasi-pro-étale maps
DiamondEtaleCohomology:C8/injection-direct-image — Degree-zero direct image for a quasicompact injection
DiamondEtaleCohomology:C8/point-quotient — A one-point diamond as a profinite quotient
DiamondEtaleCohomology:C8/point-quotient-unique — Uniqueness of the profinite point presentation
DiamondEtaleCohomology:C8/point-sheaf-equivalence — Sheaves at a diamond point as discrete modules
DiamondEtaleCohomology:C8/point-cohomology — Point cohomology is canonical continuous cohomology

DiamondEtaleCohomology:C8/point-cd — Cohomological dimension at a maximal point
  API awaiting supplier types: pointCd_presentation
  API awaiting supplier types: pointCd_le_iff
  API awaiting supplier types: pointCd_equiv
  Test awaiting supplier types: pointCd_closedField
  Test awaiting supplier types: pointCd_presentation_test
  Test awaiting supplier types: pointCd_unbounded

DiamondEtaleCohomology:C8/specialization-stabilizers — Closed inclusion of specialization stabilizers
DiamondEtaleCohomology:C8/closed-point-cohomology — Cohomology with support at the closed point
DiamondEtaleCohomology:C8/closed-point-bound — Closed-point support and generic-point cohomological dimension
DiamondEtaleCohomology:C8/extension-cd-bound — Cohomological dimension of a profinite extension
DiamondEtaleCohomology:C8/prime-to-p-wild-removal — Removing a pro-p kernel from cohomological dimension
DiamondEtaleCohomology:C8/residue-galois-identification — The residue action as an absolute Galois group
DiamondEtaleCohomology:C8/residue-cd-bound — Residue-field transcendence bound
DiamondEtaleCohomology:C8/tame-character-embedding — The tame-inertia character embedding
DiamondEtaleCohomology:C8/tame-cd-bound — Cohomological dimension of tame inertia
DiamondEtaleCohomology:C8/valuation-transcendence-bound — Residue and value-group transcendence inequality
DiamondEtaleCohomology:C8/point-cd-geometric-bound — Maximal-point cohomological dimension bound
DiamondEtaleCohomology:C8/chain-cohomology-comparison — Cohomology from the quasi-augmented chain space
DiamondEtaleCohomology:C8/spectral-cohomological-bound — Spectral-space cohomological dimension
DiamondEtaleCohomology:C8/boundary-dimension-drop — Dimension drop at the boundary of an open stratum
DiamondEtaleCohomology:C8/constructible-support-reduction — Constructible reduction with controlled support
DiamondEtaleCohomology:C8/local-stalk-bound — The local stalk bound for topological direct image
DiamondEtaleCohomology:C8/spatial-cohomological-bound — Cohomological dimension of a spatial diamond
DiamondEtaleCohomology:C8/partially-proper-closure-dimension — Dimension of a rank-one closure in a partially proper adic space
DiamondEtaleCohomology:C8/partially-proper-dimension — Dimension of a partially proper adic space
DiamondEtaleCohomology:C8/partially-proper-fibre-dimension — Closure dimension along a partially proper analytic map

DiamondEtaleCohomology:C9/bounded-filtered-compactness — Constructible sheaves and bounded filtered colimits
DiamondEtaleCohomology:C9/uniform-test-bound — The same cohomological bound on étale test objects
DiamondEtaleCohomology:C9/left-completeness — Left completeness under the uniform bound
DiamondEtaleCohomology:C9/ordinary-derived-comparison — The ordinary and enhanced étale categories agree
DiamondEtaleCohomology:C9/global-sections-coproducts — Global sections preserves coproducts under a uniform bound
DiamondEtaleCohomology:C9/etale-constant-compact — Compactness of étale extension-by-zero generators
DiamondEtaleCohomology:C9/etale-generators-detect-zero — Étale test objects detect zero complexes
DiamondEtaleCohomology:C9/compact-generators — Compact generation under bounded cohomological dimension
DiamondEtaleCohomology:C9/compact-implies-perfect-constructible — Compact objects are perfect-constructible
DiamondEtaleCohomology:C9/perfect-local-system-compact — Compactness of extensions of perfect local systems
DiamondEtaleCohomology:C9/perfect-constructible-implies-compact — Perfect-constructible objects are compact
DiamondEtaleCohomology:C9/compact-iff-perfect-constructible — Characterization of compact étale complexes
DiamondEtaleCohomology:C9/finite-field-compact-objects — Compact complexes with finite-field coefficients

These are omissions in this checkpoint, not elaborated declarations.
-/
