/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. This is a partial, uncompiled prototype at the recorded library pins.

Only the topology and dense-intermediate-field declarations below currently have complete
signatures against the pinned carriers. The remaining signatures require supplier types or
unclosed mathematical interfaces. They are listed at the end, not represented by arbitrary
Prop fields or assumed theorem packages. No implementation is claimed.
-/
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.Sober
import Mathlib.FieldTheory.IntermediateField.Basic
import Mathlib.RingTheory.AlgebraicIndependent.Basic
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.Data.ENat.Lattice

noncomputable section
open TopologicalSpace

namespace TauCeti.DiamondEtale

universe u v w

section FibreDimension
variable {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]

/-- The supremum of topological Krull dimensions of the actual fibre subspaces. -/
def fibreDimension {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : WithBot ℕ∞ := by sorry

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
def topologicalTrdeg (K L : Type u) [Field K] [Field L] [Algebra K L] [TopologicalSpace L] : ℕ∞ := by sorry

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

section Specialization
attribute [local instance] specializationOrder

-- DiamondEtaleCohomology:C8/specialization-dimension
lemma specialization_dimension (X : Type u) [TopologicalSpace X]
    [QuasiSober X] [T0Space X] :
    topologicalKrullDim X = Order.krullDim X := by sorry
end Specialization

end TauCeti.DiamondEtale

/-
Unwritten signatures (precise statements, dependencies, API and tests are in the packet):

DiamondEtaleCohomology:C8/finite-topological-generators — Finite topological generators

DiamondEtaleCohomology:C8/topological-trdeg-tower — Topological transcendence degree in a tower

DiamondEtaleCohomology:C8/topological-trdeg-base-change — Topological transcendence degree after dense compositum

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

DiamondEtaleCohomology:C8/wild-automorphism — Wild continuous automorphisms in characteristic p

DiamondEtaleCohomology:C8/wild-kernel-pro-p — The wild kernel is pro-p

DiamondEtaleCohomology:C8/prime-to-p-wild-removal — Removing a pro-p kernel from cohomological dimension

DiamondEtaleCohomology:C8/residue-galois-identification — The residue action as an absolute Galois group

DiamondEtaleCohomology:C8/residue-cd-bound — Residue-field transcendence bound

DiamondEtaleCohomology:C8/tame-character-embedding — The tame-inertia character embedding

DiamondEtaleCohomology:C8/tame-cd-bound — Cohomological dimension of tame inertia

DiamondEtaleCohomology:C8/valuation-transcendence-bound — Residue and value-group transcendence inequality

DiamondEtaleCohomology:C8/point-cd-geometric-bound — Maximal-point cohomological dimension bound

DiamondEtaleCohomology:C8/specialization-chain-space — The simplicial space of specialization chains
  API awaiting supplier types: specializationChainSpace_zero
  API awaiting supplier types: specializationChainSpace_face
  API awaiting supplier types: specializationChainSpace_degeneracy
  API awaiting supplier types: specializationChainSpace_nondegenerate
  Test awaiting supplier types: specializationChainSpace_empty
  Test awaiting supplier types: specializationChainSpace_point
  Test awaiting supplier types: specializationChainSpace_discrete
  Test awaiting supplier types: specializationChainSpace_twoPointChain

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
