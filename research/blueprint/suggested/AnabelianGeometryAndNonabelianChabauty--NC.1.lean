/-
This file is not the roadmap and is not exhaustive. The companion reader document
states every NC.1 target, hypothesis, API, test and source locator. These Lean
forms suggest names and signatures; no implementation is claimed.

Only light definitions over pinned library carriers, native milestones and a few
examples occur here. Curve, log-cover, Picard and completed comparison objects
remain reader targets. The ledger below names the obligations absent from this file.
-/
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Algebra.Module.Submodule.Ker
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP

noncomputable section
namespace TauCeti.Anabelian

universe u v w z

section Relative
variable {Γ : Type u} {X : Type v} {Y : Type w}
variable [Group Γ] [Group X] [Group Y]
variable [TopologicalSpace Γ] [TopologicalSpace X] [TopologicalSpace Y]
variable [IsTopologicalGroup Γ] [IsTopologicalGroup X] [IsTopologicalGroup Y]

/-- A continuous homomorphism over the fixed arithmetic quotient. -/
structure OverHom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) where
  hom : X →ₜ* Y
  over : qY.comp hom = qX

/-- Equality removes only conjugation by a target geometric kernel element. -/
def relativeHomSetoid (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Setoid (OverHom qX qY) where
  r f g := ∃ d : qY.toMonoidHom.ker,
    ∀ x, g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹
  iseqv := by
    refine ⟨fun _ => ⟨1, fun _ => by simp⟩, ?_, ?_⟩
    · rintro _ _ ⟨d, h⟩
      refine ⟨d⁻¹, fun x => ?_⟩
      rw [h x]
      simp only [Subgroup.coe_inv, inv_inv, mul_assoc, inv_mul_cancel_left, mul_one,
        inv_mul_cancel]
    · rintro _ _ _ ⟨d, hd⟩ ⟨e, he⟩
      refine ⟨e * d, fun x => ?_⟩
      rw [he x, hd x]
      simp only [Subgroup.coe_mul, mul_inv_rev, mul_assoc]

abbrev RelativeOuterHom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) :=
  Quotient (relativeHomSetoid qX qY)

namespace RelativeOuterHom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ}

def ofHom (f : OverHom qX qY) : RelativeOuterHom qX qY := Quotient.mk _ f

theorem eq_iff (f g : OverHom qX qY) : ofHom f = ofHom g ↔
    ∃ d : qY.toMonoidHom.ker, ∀ x,
      g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹ := by sorry

def openClasses (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Set (RelativeOuterHom qX qY) :=
  {c | ∃ f : OverHom qX qY, ofHom f = c ∧ IsOpen (Set.range f.hom)}

theorem open_iff (f : OverHom qX qY) : ofHom f ∈ openClasses qX qY ↔
    IsOpen (Set.range f.hom) := by sorry
end RelativeOuterHom

-- relativeHom_kernel_conj_test: a supplied geometric conjugate has the same class.
example (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) (f g : OverHom qX qY)
    (d : qY.toMonoidHom.ker)
    (h : ∀ x, g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹) :
    RelativeOuterHom.ofHom f = RelativeOuterHom.ofHom g := by sorry

-- relativeHom_base_change_test: the arithmetic quotient is fixed pointwise.
example (f : OverHom (ContinuousMonoidHom.id Γ) (ContinuousMonoidHom.id Γ)) :
    f.hom = ContinuousMonoidHom.id Γ := by sorry

-- relativeHom_sign_test: conjugation by an arithmetic element is not removed: over the
-- sign map S₃ → C₂, conjugation by a transposition inverts A₃, unlike any A₃-conjugate of id.
example [TopologicalSpace (Equiv.Perm (Fin 3))] [DiscreteTopology (Equiv.Perm (Fin 3))]
    [TopologicalSpace ℤˣ] [DiscreteTopology ℤˣ]
    (q : Equiv.Perm (Fin 3) →ₜ* ℤˣ) (hq : ∀ σ, q σ = Equiv.Perm.sign σ) :
    ∃ f g : OverHom q q, (∀ x, f.hom x = x) ∧
      RelativeOuterHom.ofHom f ≠ RelativeOuterHom.ofHom g ∧
      ∃ t : Equiv.Perm (Fin 3), ∀ x, g.hom x = t * x * t⁻¹ := by sorry

structure OverIsom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) where
  equiv : X ≃ₜ* Y
  over : qY.comp (ContinuousMonoidHom.toContinuousMonoidHom equiv) = qX

def relativeIsomSetoid (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Setoid (OverIsom qX qY) where
  r e f := ∃ d : qY.toMonoidHom.ker,
    ∀ x, f.equiv x = (d : Y) * e.equiv x * (d : Y)⁻¹
  iseqv := by
    refine ⟨fun _ => ⟨1, fun _ => by simp⟩, ?_, ?_⟩
    · rintro _ _ ⟨d, h⟩
      refine ⟨d⁻¹, fun x => ?_⟩
      rw [h x]
      simp only [Subgroup.coe_inv, inv_inv, mul_assoc, inv_mul_cancel_left, mul_one,
        inv_mul_cancel]
    · rintro _ _ _ ⟨d, hd⟩ ⟨e, he⟩
      refine ⟨e * d, fun x => ?_⟩
      rw [he x, hd x]
      simp only [Subgroup.coe_mul, mul_inv_rev, mul_assoc]

abbrev RelativeOuterIsom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) :=
  Quotient (relativeIsomSetoid qX qY)

namespace RelativeOuterIsom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ}

def ofIsom (e : OverIsom qX qY) : RelativeOuterIsom qX qY := Quotient.mk _ e

theorem eq_iff (e f : OverIsom qX qY) : ofIsom e = ofIsom f ↔
    ∃ d : qY.toMonoidHom.ker, ∀ x,
      f.equiv x = (d : Y) * e.equiv x * (d : Y)⁻¹ := by sorry
end RelativeOuterIsom

-- relativeIsom_base_test
example (e : OverIsom (ContinuousMonoidHom.id Γ) (ContinuousMonoidHom.id Γ)) :
    e.equiv = ContinuousMulEquiv.refl Γ := by sorry

-- relativeIsom_sign_test: the same S₃ → C₂ conjugation is a nontrivial relative class.
example [TopologicalSpace (Equiv.Perm (Fin 3))] [DiscreteTopology (Equiv.Perm (Fin 3))]
    [TopologicalSpace ℤˣ] [DiscreteTopology ℤˣ]
    (q : Equiv.Perm (Fin 3) →ₜ* ℤˣ) (hq : ∀ σ, q σ = Equiv.Perm.sign σ) :
    ∃ e₀ e : OverIsom q q, (∀ x, e₀.equiv x = x) ∧
      RelativeOuterIsom.ofIsom e ≠ RelativeOuterIsom.ofIsom e₀ ∧
      ∃ t : Equiv.Perm (Fin 3), ∀ x, e.equiv x = t * x * t⁻¹ := by sorry

/-- Native quotient adapter; characteristic invariance makes the closure redundant.
This completes the geometric kernel, retaining the full arithmetic base. -/
def relativeProPKernel (p : ℕ) (q : X →ₜ* Γ) : Subgroup X :=
  Subgroup.normalClosure
    ((TauCeti.proPKernel p q.toMonoidHom.ker).map q.toMonoidHom.ker.subtype : Set X)

instance relativeProPKernel_normal (p : ℕ) (q : X →ₜ* Γ) :
    (relativeProPKernel p q).Normal := inferInstanceAs (Subgroup.normalClosure _).Normal

abbrev RelativeProP (p : ℕ) (q : X →ₜ* Γ) := X ⧸ relativeProPKernel p q

namespace RelativeProP
variable (p : ℕ) (qX : X →ₜ* Γ)

def mk : X →ₜ* RelativeProP p qX where
  toMonoidHom := QuotientGroup.mk' (relativeProPKernel p qX)
  continuous_toFun := QuotientGroup.continuous_mk

/-- Relative quotient milestone; the projection and kernel equivalence are witnesses,
not data definitions filled by an admitted term. -/
theorem projection_exists [CompactSpace X] [T2Space X] [T2Space Γ]
    (hq : Function.Surjective qX) :
    ∃ π : RelativeProP p qX →ₜ* Γ,
      π.comp (mk p qX) = qX ∧ Function.Surjective π ∧
      Nonempty (π.toMonoidHom.ker ≃ₜ*
        TauCeti.maximalProPQuotient p qX.toMonoidHom.ker) := by sorry

/-- Universal factorization, stated without choosing a lift construction. -/
theorem lift_exists_unique {qY : Y →ₜ* Γ} (f : OverHom qX qY)
    (hY : TauCeti.proPKernel p qY.toMonoidHom.ker = ⊥)
    (π : RelativeProP p qX →ₜ* Γ) (hπ : π.comp (mk p qX) = qX) :
    ∃! g : OverHom π qY, g.hom.comp (mk p qX) = f.hom := by sorry

-- relativeProP_identity_test: a trivial geometric kernel leaves the base intact.
example : relativeProPKernel p (ContinuousMonoidHom.id Γ) = ⊥ := by sorry

-- relativeProP_prime_to_p_test: the arithmetic factor is retained even when not pro-p.
example {A B : Type*} [Group A] [Group B] [TopologicalSpace A] [TopologicalSpace B]
    [IsTopologicalGroup A] [IsTopologicalGroup B] [Fact p.Prime]
    (q : (A × B) →ₜ* A) (hq : ∀ x, q x = x.1)
    (hB : TauCeti.proPKernel p B = ⊥) : relativeProPKernel p q = ⊥ := by sorry
end RelativeProP
end Relative

section Towers
variable {G : Type u} [Group G] {ι : Type v} {A : ι → Type w}
variable [∀ i, MulAction G (A i)]

def towerDecomposition (x : ∀ i, A i) : Subgroup G := ⨅ i, MulAction.stabilizer G (x i)

namespace towerDecomposition

/-- Actual geometric cofinality must supply the fixing hypothesis via transition maps. -/
theorem cofinal {κ : Type*} (r : κ → ι) (x : ∀ i, A i)
    (hfix : ∀ g : G, (∀ j, g • x (r j) = x (r j)) → ∀ i, g • x i = x i) :
    towerDecomposition (G := G) (fun j => x (r j)) = towerDecomposition (G := G) x := by sorry

theorem isClosed [TopologicalSpace G] (x : ∀ i, A i)
    (hclosed : ∀ i, IsClosed (MulAction.stabilizer G (x i) : Set G)) :
    IsClosed (towerDecomposition (G := G) x : Set G) := by sorry
end towerDecomposition

-- towerDecomposition_regular_test
example : towerDecomposition (G := G) (fun _ : Unit => (1 : G)) = ⊥ := by sorry

-- towerDecomposition_trivial_test
example : towerDecomposition (G := G) (fun _ : Unit => (PUnit.unit : PUnit)) =
    (⊤ : Subgroup G) := by sorry
end Towers

section Relations
variable {K : Type u} [Field K]
variable {V : Type v} {W : Type w} {T : Type z}
variable [AddCommGroup V] [AddCommGroup W] [AddCommGroup T]
variable [Module K V] [Module K W] [Module K T]

/-- Kernel of supplied multiplication. The actual canonical section spaces and
their multiplication remain geometric supplier obligations in the reader. -/
abbrev CanonicalRelations (μ : V →ₗ[K] W) : Submodule K V := μ.ker

namespace CanonicalRelations

theorem transport_iff (μ : V →ₗ[K] W) (θ : V →ₗ[K] T) :
    CanonicalRelations μ ≤ θ.ker ↔ ∀ r, μ r = 0 → θ r = 0 := by sorry

/-- No surjectivity of the supplied multiplication is assumed. -/
theorem factor (μ : V →ₗ[K] W) (θ : V →ₗ[K] T)
    (h : CanonicalRelations μ ≤ θ.ker) :
    ∃ ψ : μ.range →ₗ[K] T, ∀ v,
      ψ ⟨μ v, LinearMap.mem_range_self μ v⟩ = θ v := by sorry
end CanonicalRelations

-- canonicalRelations_degree_one_test
example : CanonicalRelations (LinearMap.id : V →ₗ[K] V) = ⊥ := by sorry

-- canonicalRelations_injection_test: injection alone does not preserve products.
example : ∃ r : K × K, (LinearMap.fst K K K) r = 0 ∧
    (LinearMap.snd K K K) ((LinearMap.id : (K × K) →ₗ[K] (K × K)) r) ≠ 0 := by sorry
end Relations

end TauCeti.Anabelian


/-
NC.1 reader-target ledger
The companion reader contains all full statements, hypotheses, proof routes,
source locators, APIs and discriminatory tests. The following names are targets,
not elaborated declarations. Geometric carriers absent at the pins stay there
under the 2026-10-12 roadmap shape; native composition and chosen quotient lifts
are also left as reader API targets. No opaque carriers are introduced.
The two relative quotient existence milestones above express projection/kernel
identification and unique factorization without supplying chosen data APIs.
G1–G4 record geometric realizations and supplier obligations still needed.

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/relative-outer-hom
API target: TauCeti.Anabelian.RelativeOuterHom.comp
Test target: TauCeti.Anabelian.relativeHom_self_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/relative-outer-isom
API target: TauCeti.Anabelian.RelativeOuterIsom.symm
API target: TauCeti.Anabelian.RelativeOuterIsom.toHom
API target: TauCeti.Anabelian.RelativeOuterIsom.trans
Test target: TauCeti.Anabelian.relativeIsom_id_test
Test target: TauCeti.Anabelian.relativeIsom_conj_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/relative-pro-p
API target: TauCeti.Anabelian.RelativeProP.projection
API target: TauCeti.Anabelian.RelativeProP.map
API target: TauCeti.Anabelian.RelativeProP.open_map
API target: TauCeti.Anabelian.RelativeProP.lift
API target: TauCeti.Anabelian.RelativeProP.lift_comp_mk
API target: TauCeti.Anabelian.RelativeProP.lift_unique
Test target: TauCeti.Anabelian.relativeProP_field_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/log-admissible-system
API target: TauCeti.Anabelian.AdmissibleLogCoverSystem
API target: TauCeti.Anabelian.AdmissibleLogCoverSystem.admissibleGroup
API target: TauCeti.Anabelian.AdmissibleLogCoverSystem.orderly_cofinal
API target: TauCeti.Anabelian.AdmissibleLogCoverSystem.tame_baseChange
Test target: TauCeti.Anabelian.admissible_identity_test
Test target: TauCeti.Anabelian.admissible_orderly_test
Test target: TauCeti.Anabelian.admissible_wild_base_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/tower-decomposition
API target: TauCeti.Anabelian.towerDecomposition.mem_iff
API target: TauCeti.Anabelian.towerDecomposition.conjugate
Test target: TauCeti.Anabelian.towerDecomposition_singleton_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/cyclotomic-degree
API target: TauCeti.Anabelian.ReconstructionDegree
API target: TauCeti.Anabelian.ReconstructionDegree.component_eq
API target: TauCeti.Anabelian.ReconstructionDegree.comp
API target: TauCeti.Anabelian.ReconstructionDegree.one_iff
Test target: TauCeti.Anabelian.reconstructionDegree_identity_test
Test target: TauCeti.Anabelian.reconstructionDegree_frobenius_test
Test target: TauCeti.Anabelian.reconstructionDegree_composition_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/finite-field-decomposition
Theorem/comparison target: TauCeti.Anabelian.finiteFieldTameDecomposition

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/linear-system-addition
Theorem/comparison target: TauCeti.Anabelian.additionOfValuationsAndPrincipalUnits

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/finite-field-tame-isom
Theorem/comparison target: TauCeti.Anabelian.finiteFieldTameIsom

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/sturdy-cover
Theorem/comparison target: TauCeti.Anabelian.sturdyOrderlyCoversCofinal

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/component-recovery
Theorem/comparison target: TauCeti.Anabelian.admissibleComponentsAndTorsion

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/node-branch-recovery
Theorem/comparison target: TauCeti.Anabelian.admissibleNodesAndBranches

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/thickness-log-gluing
Theorem/comparison target: TauCeti.Anabelian.nodeThicknessAndLogGluing

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/ordinary-special-quotient
Theorem/comparison target: TauCeti.Anabelian.ordinarySpecialQuotientRecovered

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/finite-field-log-isom
Theorem/comparison target: TauCeti.Anabelian.stableLogIsomDegreeOne

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/local-admissible-recovery
Theorem/comparison target: TauCeti.Anabelian.genericGroupRecoversAdmissibleReduction

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/degree-normalization
Theorem/comparison target: TauCeti.Anabelian.localArithmeticIsomDegreeOne

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/local-special-isom
Theorem/comparison target: TauCeti.Anabelian.stableLogSpecialFibreIsom

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/curve-map-rigidity
Theorem/comparison target: TauCeti.Anabelian.hyperbolicMapFundamentalGroupFaithful

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/number-field-isom
Theorem/comparison target: TauCeti.Anabelian.numberFieldProfiniteIsom

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/geometric-outer-comparison
Theorem/comparison target: TauCeti.Anabelian.arithmeticGeometricIsomComparison

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/weight-zero-quotient
API target: TauCeti.Anabelian.WeightZeroTwoStep
API target: TauCeti.Anabelian.WeightZeroTwoStep.comm_quotient
API target: TauCeti.Anabelian.WeightZeroTwoStep.inner_independent
API target: TauCeti.Anabelian.WeightZeroTwoStep.section_action
Test target: TauCeti.Anabelian.weightZero_affine_relation_test
Test target: TauCeti.Anabelian.weightZero_wedge_test
Test target: TauCeti.Anabelian.weightZero_inner_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/j-geometric-section
API target: TauCeti.Anabelian.IsJGeometric
API target: TauCeti.Anabelian.IsJGeometric.picard_iff
API target: TauCeti.Anabelian.IsJGeometric.baseChange
API target: TauCeti.Anabelian.IsJGeometric.inner
Test target: TauCeti.Anabelian.jGeometric_curve_point_test
Test target: TauCeti.Anabelian.jGeometric_picard_point_test
Test target: TauCeti.Anabelian.jGeometric_translation_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/fi-geometric-section
API target: TauCeti.Anabelian.IsFGeometric
API target: TauCeti.Anabelian.IsFIGeometric
API target: TauCeti.Anabelian.FormalGeometry.saturation
API target: TauCeti.Anabelian.FormalGeometry.baseChange
Test target: TauCeti.Anabelian.formalGeometry_geometric_test
Test target: TauCeti.Anabelian.formalGeometry_saturation_test
Test target: TauCeti.Anabelian.formalGeometry_split_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/nondegenerate-section
API target: TauCeti.Anabelian.IsNondegenerateSection
API target: TauCeti.Anabelian.IsNondegenerateSection.kernel_quotient
API target: TauCeti.Anabelian.IsNondegenerateSection.frattiniCover
API target: TauCeti.Anabelian.IsNondegenerateSection.inner
Test target: TauCeti.Anabelian.nondegenerate_zero_test
Test target: TauCeti.Anabelian.nondegenerate_geometric_test
Test target: TauCeti.Anabelian.nondegenerate_residue_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/canonical-relations
API target: TauCeti.Anabelian.CanonicalRelations.mem_iff
API target: TauCeti.Anabelian.CanonicalRelations.baseChange
Test target: TauCeti.Anabelian.canonicalRelations_zero_product_test

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/arithmetic-chern-comparison
Theorem/comparison target: TauCeti.Anabelian.arithmeticChernClassComparison

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/geometric-splitting
Theorem/comparison target: TauCeti.Anabelian.geometricSectionWeightZeroSplitting

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/open-map-j-geometric
Theorem/comparison target: TauCeti.Anabelian.openMapGenericSectionJGeometric

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/fi-to-f
Theorem/comparison target: TauCeti.Anabelian.fiGeometricImpliesFGeometric

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/prime-to-p-line-bundle
Theorem/comparison target: TauCeti.Anabelian.openMapPrimeToPLineBundle

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/tame-point-existence
Theorem/comparison target: TauCeti.Anabelian.primeToPLineBundleTamePoint

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/compatible-tower-point
Theorem/comparison target: TauCeti.Anabelian.nondegenerateFrattiniTowerPoint

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/canonical-cover-descent
Theorem/comparison target: TauCeti.Anabelian.nondegenerateSectionIsGeometric

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/completed-differential-comparison
Theorem/comparison target: TauCeti.Anabelian.completedToricDifferentialComparison

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/canonical-relation-vanishing
Theorem/comparison target: TauCeti.Anabelian.openMapCanonicalRelationsVanish

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/inertia-and-regularity
Theorem/comparison target: TauCeti.Anabelian.openMapInertiaAndRegularity

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/canonical-effectivity
Theorem/comparison target: TauCeti.Anabelian.canonicalRelationsCurveEffectivity

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/local-pro-p-hom
Theorem/comparison target: TauCeti.Anabelian.localGeometricProPHom

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/finitely-generated-hom
Theorem/comparison target: TauCeti.Anabelian.finitelyGeneratedPadicProPHom

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/sub-p-adic-hom
Theorem/comparison target: TauCeti.Anabelian.subPadicGeometricProPHom

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/full-profinite-hom
Theorem/comparison target: TauCeti.Anabelian.numberFieldFullProfiniteHom

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/galois-centre-free
Theorem/comparison target: TauCeti.Anabelian.subPadicGaloisCentreFree

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/local-galois-centre-free
Theorem/comparison target: TauCeti.Anabelian.localAndFinitelyGeneratedGaloisCentreFree

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/geometric-centre-free
Theorem/comparison target: TauCeti.Anabelian.hyperbolicGeometricKernelCentreFree

Reader contract: AnabelianGeometryAndNonabelianChabauty:NC.1/punctured-elliptic-isom
Theorem/comparison target: TauCeti.Anabelian.finitelyGeneratedPuncturedEllipticIsom

-/
