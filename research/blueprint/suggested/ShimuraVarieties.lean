import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Algebra.Group.Hom.Defs
import Mathlib.Algebra.Group.Prod
import Mathlib.Algebra.Group.Subgroup.Lattice
import Mathlib.Algebra.Group.PUnit

/-!
# Suggested declarations: complex Shimura varieties and canonical models

This file is not the roadmap and is not exhaustive. The reader
`research/blueprint/readmes/ShimuraVarieties.md` gives every mathematical target,
hypothesis, source locator, API and discriminating test. These signatures suggest
names and types so contributors and reviewers converge on an interface. All
implementation statuses remain unchecked; proof placeholders certify no theorem.

Following the binding 2026-10-12 roadmap shape, only light definitions over pinned
carriers and readily statable end statements appear below. The pins do not supply
pure Shimura data, nilpotent complex analytic spaces, rational Satake boundaries,
automorphic growth, canonical special-pair predicates, or the connected canonical
Galois extension. Their targets are in the reader and omission manifest. The file
contains no substitute existence assumptions or unproved data definitions.

The two available interfaces are the genuine double-orbit set and inversion of
an arithmetic reciprocity homomorphism with abelian target. They give neither
analytic topology nor a construction of global class field reciprocity. The
literal GL2 and number-field tests remain reader targets.
-/

namespace TauCeti.Shimura

universe u v w

/-- The action on the singleton domain is actual data. -/
instance singletonAction (Q : Type u) [Group Q] : MulAction Q PUnit where
  smul _ _ := PUnit.unit
  one_smul _ := Subsingleton.elim _ _
  mul_smul _ _ _ := Subsingleton.elim _ _

section Points
variable {Q : Type u} {A : Type v} {X : Type w}
variable [Group Q] [Group A] [MulAction Q X]

/-- Inversion turns the right level action into a commuting left action. -/
@[instance_reducible] def doubleAction (ι : Q →* A) (K : Subgroup A) :
    MulAction (Q × K) (X × A) where
  smul q xa := (q.1 • xa.1, ι q.1 * xa.2 * (q.2 : A)⁻¹)
  one_smul xa := by
    change ((1 : Q) • xa.1, ι 1 * xa.2 * (1 : A)⁻¹) = xa
    simp
  mul_smul q r xa := by
    change ((q.1 * r.1) • xa.1, ι (q.1 * r.1) * xa.2 *
      ((q.2 : A) * (r.2 : A))⁻¹) =
      (q.1 • (r.1 • xa.1), ι q.1 * (ι r.1 * xa.2 * (r.2 : A)⁻¹) * (q.2 : A)⁻¹)
    simp [mul_smul, mul_assoc]

/-- The native orbit setoid, retaining the domain and finite-adelic coordinates. -/
def pointSetoid (ι : Q →* A) (K : Subgroup A) : Setoid (X × A) :=
  letI := doubleAction (X := X) ι K
  MulAction.orbitRel (Q × K) (X × A)

/-- Under the actual rational/adelic specialization this is the V1 point carrier. -/
def AnalyticPoints (ι : Q →* A) (K : Subgroup A) : Type (max v w) :=
  Quotient (pointSetoid (X := X) ι K)

namespace AnalyticPoints
variable (ι : Q →* A) (K : Subgroup A)

def mk (x : X) (a : A) : AnalyticPoints (X := X) ι K :=
  Quotient.mk (pointSetoid ι K) (x, a)

/-- Equality is the actual two-sided orbit condition, with either right-inverse
convention equivalent by replacing the level element with its inverse. -/
theorem mk_eq (x y : X) (a b : A) :
    mk ι K x a = mk ι K y b ↔
      ∃ q : Q, ∃ k : K, y = q • x ∧ b = ι q * a * (k : A) := by
  sorry

end AnalyticPoints
end Points

section PointExamples

-- The trivial datum has a singleton point carrier.
example : Subsingleton
    (AnalyticPoints (X := PUnit) (MonoidHom.id PUnit) (⊤ : Subgroup PUnit)) := by
  sorry

-- Changing representatives by the rational and level actions changes no point.
example {Q A X : Type*} [Group Q] [Group A] [MulAction Q X]
    (ι : Q →* A) (K : Subgroup A) (q : Q) (k : K) (x : X) (a : A) :
    AnalyticPoints.mk ι K (q • x) (ι q * a * (k : A)) =
      AnalyticPoints.mk ι K x a := by
  sorry

/-- A trivial rational group cannot identify distinct domain points. -/
@[instance_reducible] def trivialDomainAction : MulAction PUnit ℕ where
  smul _ n := n
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

local instance : MulAction PUnit ℕ := trivialDomainAction

-- Discarding X would wrongly identify these two points.
example : AnalyticPoints.mk (MonoidHom.id PUnit) (⊤ : Subgroup PUnit) (0 : ℕ) PUnit.unit ≠
    AnalyticPoints.mk (MonoidHom.id PUnit) (⊤ : Subgroup PUnit) (1 : ℕ) PUnit.unit := by
  sorry

end PointExamples

section Artin
variable {I : Type u} {B : Type v} [Group I] [CommGroup B]

/-- The V4 geometric convention inverts the supplied arithmetic homomorphism. -/
def geometricArtin (rec : I →* B) : I →* B where
  toFun s := (rec s)⁻¹
  map_one' := by simp
  map_mul' s t := by simp [mul_comm]

/-- Norm/restriction compatibility survives changing the reciprocity convention. -/
theorem geometricArtin_norm {J C : Type*} [Group J] [CommGroup C]
    (recF : I →* B) (recL : J →* C) (norm : J →* I) (res : C →* B)
    (h : ∀ s, recF (norm s) = res (recL s)) (s : J) :
    geometricArtin recF (norm s) = res (geometricArtin recL s) := by
  sorry

-- An arithmetic Frobenius image becomes geometric Frobenius.
example (rec : I →* B) (uniformizer : I) (arithFrob : B)
    (h : rec uniformizer = arithFrob) :
    geometricArtin rec uniformizer = arithFrob⁻¹ := by
  sorry

-- Identity normalization is retained.
example (rec : I →* B) : geometricArtin rec 1 = 1 := by
  sorry

-- The cyclotomic normalization transports to a supplied character.
example {U : Type*} [CommGroup U] (rec : I →* B) (chi : B →* U)
    (unit : I) (u : U) (h : chi (rec unit) = u⁻¹) :
    chi (geometricArtin rec unit) = u := by
  sorry

end Artin
end TauCeti.Shimura

/-!
## Omission manifest

The reader, by the following exact node ids and declaration names, supplies the
statements omitted from Lean. Each definition/construction includes its API and
at least three discriminating mathematical tests there. Native AnalyticPoints
also omits quotient topology and its universal-property API; geometricArtin
omits literal local/global reciprocity, continuity and number-field examples.
The two signatures above are narrower than those full mathematical targets.
No arbitrary-scheme finite/proper/canonical-model statements are asserted.

ShimuraVarieties:V0/plan/stabilizer-arithmetic
TauCeti.Shimura.stabilizer_arithmetic [theorem] — Arithmetic component stabilizers

ShimuraVarieties:V0/plan/stabilizer-commensurable
TauCeti.Shimura.stabilizer_commensurable [theorem] — Commensurability of stabilizers

ShimuraVarieties:V0/plan/neat-sublevels
TauCeti.Shimura.neat_sublevels [theorem] — Shimura specialization of cofinal neat levels

ShimuraVarieties:V0/plan/effective-proper-action
TauCeti.Shimura.effective_proper_action [theorem] — Proper effective arithmetic action

ShimuraVarieties:V0/plan/component-decomposition
TauCeti.Shimura.component_decomposition [theorem] — Finite analytic component decomposition

ShimuraVarieties:V0/plan/simply-connected-components
TauCeti.Shimura.simply_connected_components [theorem] — Abelianized component formula

ShimuraVarieties:V1/plan/analytic-points
TauCeti.Shimura.AnalyticPoints [definition] — Finite-level analytic Shimura points
API TauCeti.Shimura.AnalyticPoints.mk
API TauCeti.Shimura.AnalyticPoints.mk_eq
API TauCeti.Shimura.AnalyticPoints.lift
API TauCeti.Shimura.AnalyticPoints.level
Test TauCeti.Shimura.AnalyticPoints.trivial
Test TauCeti.Shimura.AnalyticPoints.torus
Test TauCeti.Shimura.AnalyticPoints.keep_domain

ShimuraVarieties:V1/plan/analytic-structure
TauCeti.Shimura.analytic_structure [theorem] — Complex analytic structure of the tower

ShimuraVarieties:V1/plan/holomorphic-level-maps
TauCeti.Shimura.holomorphic_level_maps [theorem] — Holomorphic finite level maps

ShimuraVarieties:V1/plan/right-translation
TauCeti.Shimura.right_translation [theorem] — Holomorphic right translations

ShimuraVarieties:V1/plan/holomorphic-hecke
TauCeti.Shimura.holomorphic_hecke [theorem] — Holomorphic Hecke correspondences

ShimuraVarieties:V1/plan/datum-analytic-map
TauCeti.Shimura.datum_analytic_map [theorem] — Holomorphic maps of data

ShimuraVarieties:V1/level-index
TauCeti.Shimura.Level [definition] — Compact-open level category
API TauCeti.Shimura.Level.hom_iff
API TauCeti.Shimura.Level.id_comp
API TauCeti.Shimura.Level.inf_refines
API TauCeti.Shimura.Level.cofiltered
API TauCeti.Shimura.Level.conjugate
API TauCeti.Shimura.Level.conjugate_comp
Test TauCeti.Shimura.Level.trivial
Test TauCeti.Shimura.Level.nested
Test TauCeti.Shimura.Level.intersection
Test TauCeti.Shimura.Level.noncompact_top

ShimuraVarieties:V2/plan/rational-boundary
TauCeti.Shimura.rational_boundary [theorem] — Rational boundary components and incidence

ShimuraVarieties:V2/plan/satake-compactness
TauCeti.Shimura.satake_compactness [theorem] — Satake topology and compactness

ShimuraVarieties:V2/plan/analytic-automorphic-ring
TauCeti.Shimura.AutomorphicRing [definition] — Analytic automorphic graded ring
API TauCeti.Shimura.AutomorphicRing.degree
API TauCeti.Shimura.AutomorphicRing.mul
API TauCeti.Shimura.AutomorphicRing.siegel
API TauCeti.Shimura.AutomorphicRing.level
API TauCeti.Shimura.AutomorphicRing.veronese
API TauCeti.Shimura.AutomorphicRing.mk
API TauCeti.Shimura.AutomorphicRing.ext
API TauCeti.Shimura.AutomorphicRing.eval
API TauCeti.Shimura.AutomorphicRing.integral_iff
API TauCeti.Shimura.AutomorphicRing.change_chart
Test TauCeti.Shimura.AutomorphicRing.degree_zero
Test TauCeti.Shimura.AutomorphicRing.elliptic_weight
Test TauCeti.Shimura.AutomorphicRing.not_cusp
Test TauCeti.Shimura.AutomorphicRing.pole_at_cusp
Test TauCeti.Shimura.AutomorphicRing.induced_weight

ShimuraVarieties:V2/plan/poincare-eisenstein
TauCeti.Shimura.poincare_eisenstein [theorem] — Automorphic sections separating strata

ShimuraVarieties:V2/plan/normal-analytic-compactification
TauCeti.Shimura.normal_analytic_compactification [theorem] — Normal analytic Baily–Borel quotient

ShimuraVarieties:V2/plan/automorphic-finite-generation
TauCeti.Shimura.automorphic_finite_generation [theorem] — Finite generation of automorphic forms

ShimuraVarieties:V2/plan/baily-borel
TauCeti.Shimura.baily_borel [theorem] — Baily–Borel algebraization

ShimuraVarieties:V2/plan/koecher
TauCeti.Shimura.koecher [theorem] — Koecher principle and boundary codimension

ShimuraVarieties:V2/plan/minimal-level-extension
TauCeti.Shimura.minimal_level_extension [theorem] — Level maps on minimal compactifications

ShimuraVarieties:V2/minimal-datum-extension
TauCeti.Shimura.minimal_datum_extension [theorem] — Complex minimal compactification functoriality

ShimuraVarieties:V2/codim-one-analytic-extension
TauCeti.Shimura.codim_one_analytic_extension [theorem] — Codimension-one boundary and auxiliary data

ShimuraVarieties:V2/log-canonical-sections
TauCeti.Shimura.log_canonical_section_embedding [theorem] — Logarithmic canonical section embedding

ShimuraVarieties:V3/plan/borel-extension
TauCeti.Shimura.borel_extension [theorem] — Borel extension across punctured polydisks

ShimuraVarieties:V3/plan/borel-algebraicity
TauCeti.Shimura.borel_algebraicity [theorem] — Borel algebraicity

ShimuraVarieties:V3/plan/unique-algebraization
TauCeti.Shimura.unique_algebraization [theorem] — Unique algebraization at neat level

ShimuraVarieties:V3/plan/algebraic-data-maps
TauCeti.Shimura.algebraic_data_maps [theorem] — Algebraic maps of Shimura data

ShimuraVarieties:V3/plan/finite-quotient-algebraization
TauCeti.Shimura.finite_quotient_algebraization [theorem] — Algebraic finite quotients and normalization

ShimuraVarieties:V3/plan/definable-target-comparison
TauCeti.Shimura.definable_target_comparison [theorem] — Definable comparison with the algebraic target

ShimuraVarieties:V3/plan/definable-borel
TauCeti.Shimura.definable_borel [theorem] — Definable-graph proof of Borel algebraicity

ShimuraVarieties:V4/plan/geometric-artin
TauCeti.Shimura.geometricArtin [definition] — Milne geometric Artin conversion
API TauCeti.Shimura.geometricArtin_apply
API TauCeti.Shimura.geometricArtin_mul
API TauCeti.Shimura.geometricArtin_kernel
API TauCeti.Shimura.geometricArtin_norm
Test TauCeti.Shimura.geometricArtin_uniformizer
Test TauCeti.Shimura.geometricArtin_one
Test TauCeti.Shimura.geometricArtin_cyclotomic

ShimuraVarieties:V4/plan/reflex-norm
TauCeti.Shimura.ReflexNorm [definition] — Reflex norm of a special torus
API TauCeti.Shimura.ReflexNorm.apply_split
API TauCeti.Shimura.ReflexNorm.principal
API TauCeti.Shimura.ReflexNorm.map
API TauCeti.Shimura.ReflexNorm.cm_type
API TauCeti.Shimura.ReflexNorm.continuous
API TauCeti.Shimura.ReflexNorm.ext
API TauCeti.Shimura.ReflexNorm.mul
Test TauCeti.Shimura.ReflexNorm.trivial
Test TauCeti.Shimura.ReflexNorm.split_power
Test TauCeti.Shimura.ReflexNorm.aghmp

ShimuraVarieties:V4/plan/reciprocity-finite-action
TauCeti.Shimura.reciprocity_finite_action [theorem] — Finite-level reciprocity and idele independence

ShimuraVarieties:V4/plan/canonical-model
TauCeti.Shimura.CanonicalModel [definition] — Canonical-model condition
API TauCeti.Shimura.CanonicalModel.scheme
API TauCeti.Shimura.CanonicalModel.comparison
API TauCeti.Shimura.CanonicalModel.special_rational
API TauCeti.Shimura.CanonicalModel.special_action
API TauCeti.Shimura.CanonicalModel.level
API TauCeti.Shimura.CanonicalModel.baseChange
API TauCeti.Shimura.CanonicalModel.ofSpecialAction
API TauCeti.Shimura.CanonicalModel.hom_ext
Test TauCeti.Shimura.CanonicalModel.trivial
Test TauCeti.Shimura.CanonicalModel.torus_neat
Test TauCeti.Shimura.CanonicalModel.not_arbitrary_subset

ShimuraVarieties:V4/plan/torus-model
TauCeti.Shimura.torusModel [construction] — Finite étale torus canonical models
API TauCeti.Shimura.torusModel.points
API TauCeti.Shimura.torusModel.level
API TauCeti.Shimura.torusModel.translate
API TauCeti.Shimura.torusModel.map
API TauCeti.Shimura.torusModel.finiteEtale
API TauCeti.Shimura.torusModel.hom_ext
Test TauCeti.Shimura.torusModel.maximal_split
Test TauCeti.Shimura.torusModel.split_level_five
Test TauCeti.Shimura.torusModel.trivial

ShimuraVarieties:V4/plan/aghmp-stack-comparison
TauCeti.Shimura.aghmp_stack_comparison [theorem] — AGHMP torus stack and coarse model

ShimuraVarieties:V4/plan/special-existence
TauCeti.Shimura.special_existence [theorem] — Existence and density of special points

ShimuraVarieties:V4/plan/hecke-density
TauCeti.Shimura.hecke_density [theorem] — Density of Hecke translates

ShimuraVarieties:V4/plan/reflex-norm-functoriality
TauCeti.Shimura.ReflexNorm.map_full [theorem] — Reflex norm under a torus morphism

ShimuraVarieties:V5/plan/weight-one-algebraization
TauCeti.Shimura.weight_one_algebraization [theorem] — Algebraization of polarized weight-one variations

ShimuraVarieties:V5/plan/cm-abelian-variety
TauCeti.Shimura.CMAbelianVariety [definition] — CM abelian varieties with their algebra action
API TauCeti.Shimura.CMAbelianVariety.action
API TauCeti.Shimura.CMAbelianVariety.type
API TauCeti.Shimura.CMAbelianVariety.homology
API TauCeti.Shimura.CMAbelianVariety.transport
API TauCeti.Shimura.CMAbelianVariety.rosati
API TauCeti.Shimura.CMAbelianVariety.ofAction
API TauCeti.Shimura.CMAbelianVariety.hom_ext
Test TauCeti.Shimura.CMAbelianVariety.quadratic
Test TauCeti.Shimura.CMAbelianVariety.product
Test TauCeti.Shimura.CMAbelianVariety.insufficient_degree

ShimuraVarieties:V5/plan/cm-tate-rank-one
TauCeti.Shimura.cm_tate_rank_one [theorem] — Rank-one rational CM Tate module

ShimuraVarieties:V5/plan/cm-number-field-model
TauCeti.Shimura.cm_number_field_model [theorem] — Number-field models for full CM objects

ShimuraVarieties:V5/plan/cm-potential-good-reduction
TauCeti.Shimura.cm_potential_good_reduction [theorem] — Potential good reduction for CM varieties

ShimuraVarieties:V5/plan/cm-frobenius
TauCeti.Shimura.cm_frobenius [theorem] — CM Frobenius endomorphism

ShimuraVarieties:V5/plan/shimura-taniyama
TauCeti.Shimura.shimura_taniyama [theorem] — Shimura–Taniyama Frobenius calculation

ShimuraVarieties:V5/plan/cm-ideal-reciprocity
TauCeti.Shimura.cm_ideal_reciprocity [theorem] — CM ideal reciprocity with prime generation

ShimuraVarieties:V5/plan/main-cm
TauCeti.Shimura.main_cm [theorem] — Main theorem of complex multiplication

ShimuraVarieties:V5/plan/cm-polarization-level
TauCeti.Shimura.cm_polarization_level [theorem] — Polarization and level in CM reciprocity

ShimuraVarieties:V5/plan/siegel-special-cm
TauCeti.Shimura.siegel_special_cm [theorem] — Siegel special points are full CM

ShimuraVarieties:V5/plan/siegel-canonical
TauCeti.Shimura.siegel_canonical [theorem] — The Siegel canonical model

ShimuraVarieties:V6/plan/hodge-inheritance
TauCeti.Shimura.hodge_inheritance [theorem] — Inheritance by Shimura subdata

ShimuraVarieties:V6/plan/hodge-canonical
TauCeti.Shimura.hodge_canonical [theorem] — Canonical models of Hodge type

ShimuraVarieties:V6/plan/connected-tower
TauCeti.Shimura.ConnectedTower [construction] — Connected Shimura tower with completed symmetry
API TauCeti.Shimura.ConnectedTower.level
API TauCeti.Shimura.ConnectedTower.transition
API TauCeti.Shimura.ConnectedTower.completedAction
API TauCeti.Shimura.ConnectedTower.canonicalExtension
API TauCeti.Shimura.ConnectedTower.hom_ext
API TauCeti.Shimura.ConnectedTower.lift
Test TauCeti.Shimura.ConnectedTower.trivial
Test TauCeti.Shimura.ConnectedTower.sl2
Test TauCeti.Shimura.ConnectedTower.not_full

ShimuraVarieties:V6/plan/connected-full-equivalence
TauCeti.Shimura.connected_full_equivalence [theorem] — Connected and full canonical formulations

ShimuraVarieties:V6/plan/connected-products
TauCeti.Shimura.connected_products [theorem] — Products of connected canonical models

ShimuraVarieties:V6/plan/central-isogeny-descent
TauCeti.Shimura.central_isogeny_descent [theorem] — Central-isogeny descent of connected models

ShimuraVarieties:V6/plan/abelian-canonical
TauCeti.Shimura.abelian_canonical [theorem] — Canonical models of abelian type

ShimuraVarieties:V7/plan/simple-connected-reduction
TauCeti.Shimura.simple_connected_reduction [theorem] — Reduction to simple simply connected data

ShimuraVarieties:V7/plan/auxiliary-cm-splitting
TauCeti.Shimura.auxiliary_cm_splitting [theorem] — Auxiliary totally real splitting extension

ShimuraVarieties:V7/plan/rank-one-subdata
TauCeti.Shimura.rank_one_subdata [theorem] — Root subdata of type A₁

ShimuraVarieties:V7/plan/rank-one-central-separation
TauCeti.Shimura.rank_one_central_separation [theorem] — Central separation by noncompact roots

ShimuraVarieties:V7/plan/conjugated-datum
TauCeti.Shimura.conjugatedDatum [construction] — Marked conjugated Shimura datum
API TauCeti.Shimura.conjugatedDatum.group
API TauCeti.Shimura.conjugatedDatum.specialTorus
API TauCeti.Shimura.conjugatedDatum.adelic
API TauCeti.Shimura.conjugatedDatum.localClass
API TauCeti.Shimura.conjugatedDatum.map
API TauCeti.Shimura.conjugatedDatum.descent_ext
Test TauCeti.Shimura.conjugatedDatum.identity
Test TauCeti.Shimura.conjugatedDatum.sl2_conjugation
Test TauCeti.Shimura.conjugatedDatum.finiteLocal

ShimuraVarieties:V7/plan/kazhdan-uniformization
TauCeti.Shimura.kazhdan_uniformization [theorem] — Uniformization of conjugate arithmetic quotients

ShimuraVarieties:V7/plan/weak-conjugation
TauCeti.Shimura.weak_conjugation [theorem] — Weak connected conjugation comparison

ShimuraVarieties:V7/plan/marked-conjugation
TauCeti.Shimura.marked_conjugation [theorem] — Conjugation comparison with a marked special point

ShimuraVarieties:V7/plan/completed-conjugation-equivariance
TauCeti.Shimura.completed_conjugation_equivariance [theorem] — Equivariance for completed symmetry

ShimuraVarieties:V7/plan/special-independence
TauCeti.Shimura.special_independence [theorem] — Independence of the marked special point

ShimuraVarieties:V7/plan/conjugation-cocycle
TauCeti.Shimura.conjugation_cocycle [theorem] — Reflex-field descent cocycle

ShimuraVarieties:V7/plan/finite-rigidifying-points
TauCeti.Shimura.finite_rigidifying_points [theorem] — Finite rigidifying special points

ShimuraVarieties:V7/plan/continuous-descent
TauCeti.Shimura.continuous_descent [theorem] — Continuity of the canonical descent system

ShimuraVarieties:V7/plan/general-canonical
TauCeti.Shimura.general_canonical [theorem] — Canonical models for every pure datum

ShimuraVarieties:V8/plan/disjoint-special-reflex-fields
CanonicalModel.disjoint_special_reflex_fields [theorem] — Disjoint special reflex fields

ShimuraVarieties:V8/plan/translation-descent
CanonicalModel.translation_defined_over_reflex [theorem] — Hecke translation over the reflex field

ShimuraVarieties:V8/plan/model-uniqueness
CanonicalModel.unique_iso [theorem] — Uniqueness of canonical models

ShimuraVarieties:V8/plan/level-tower
CanonicalTower.ofLevelMaps [construction] — Canonical algebraic level tower
API CanonicalTower.ofLevelMaps_obj
API CanonicalTower.ofLevelMaps_map
API CanonicalTower.ofLevelMaps_id
API CanonicalTower.ofLevelMaps_comp
API CanonicalTower.ofLevelMaps_baseChange
Test CanonicalTower.test_identity_level
Test CanonicalTower.test_nested_levels
Test CanonicalTower.test_preserves_supplied_arrow
Test CanonicalTower.test_base_change
Test CanonicalTower.test_gl2_jline_degree
Test CanonicalTower.test_not_constant

ShimuraVarieties:V8/plan/translation-laws
CanonicalTower.translation_comp [theorem] — Right translation laws on the algebraic tower

ShimuraVarieties:V8/plan/finite-level-maps
CanonicalTower.level_map_finite [theorem] — Finite level maps and effective deck groups

ShimuraVarieties:V8/plan/hecke-span
CanonicalHecke.span [construction] — Algebraic Hecke correspondence
API CanonicalHecke.span_apex
API CanonicalHecke.span_first
API CanonicalHecke.span_second
API CanonicalHecke.span_baseChange
Test CanonicalHecke.test_identity
Test CanonicalHecke.test_native_span
Test CanonicalHecke.test_distinct_legs
Test CanonicalHecke.test_base_change
Test CanonicalHecke.test_gl2_Tp_index

ShimuraVarieties:V8/plan/datum-functoriality
CanonicalModel.datum_map_defined_over_compositum [theorem] — Functoriality of canonical models in the datum

ShimuraVarieties:V8/plan/zero-dimensional-shimura-variety
ZeroDimShimura.shimuraSet [construction] — Zero-dimensional Shimura varieties and their canonical models
API ZeroDimShimura.shimuraSet
API ZeroDimShimura.mk
API ZeroDimShimura.mk_eq_mk
API ZeroDimShimura.map
API ZeroDimShimura.singletonEquiv
API ZeroDimShimura.galoisAct
API ZeroDimShimura.canonicalModel
Test ZeroDimShimura.test_gl2_components
Test ZeroDimShimura.test_strict_datum_halves
Test ZeroDimShimura.test_singleton
Test ZeroDimShimura.test_maximal_level

ShimuraVarieties:V8/plan/component-reciprocity
CanonicalModel.component_map_defined_over_reflex [theorem] — Galois action on connected components

ShimuraVarieties:V8/plan/abelian-instance
CanonicalTower.abelian_type [application] — Abelian-type tower from V6

ShimuraVarieties:V8/plan/gl2-moduli-reciprocity
GL2Modular.full_level_is_canonical [theorem] — Canonical reciprocity for full elliptic level

ShimuraVarieties:V8/plan/gl2-full-level
GL2Modular.full_level_iso [theorem] — Full-level modular curve comparison over Q

ShimuraVarieties:V8/plan/gl2-determinant-pairing
GL2Modular.det_eq_weil_pairing [comparison] — Determinant is the Weil-pairing morphism

ShimuraVarieties:V8/plan/gl2-fixed-pairing-fibre
GL2Modular.fixed_pairing_fibre_iso [comparison] — Fixed-pairing fibre over a primitive root

ShimuraVarieties:V8/plan/gl2-row-basis-dictionary
GL2Modular.row_basis_right_translation [comparison] — Row-basis and adelic right actions

ShimuraVarieties:V8/plan/gl2-gamma1
GL2Modular.gamma1_iso [comparison] — Gamma-one modular curve comparison

ShimuraVarieties:V8/plan/gl2-gamma0
GL2Modular.gamma0_coarse_iso [comparison] — Gamma-zero coarse modular curve comparison

ShimuraVarieties:V8/plan/gl2-compact-model
GL2Modular.minimal_compact_iso [comparison] — Minimal compactification of the full modular curve

ShimuraVarieties:V8/plan/codim-one-extension
CanonicalModel.codim_one_extension [theorem] — Arithmetic codimension-one partial compactification

ShimuraVarieties:V8/plan/minimal-descent
CanonicalModel.minimal_defined_over_reflex [theorem] — Reflex-field descent of the minimal compactification

ShimuraVarieties:V8/plan/minimal-map-extension
CanonicalModel.minimal_map_extension [theorem] — Functoriality on minimal compactifications

ShimuraVarieties:V8/plan/gl2-cusps-tate
GL2Modular.cusp_tate_comparison [comparison] — Modular cusp loci and Tate parameters

ShimuraVarieties:V8/plan/gl2-tower-compatibility
GL2Modular.tower_compatibility [comparison] — Compatibility of modular and canonical correspondences

ShimuraVarieties:V8.general/plan/general-tower
CanonicalTower.general_data [theorem] — General-data canonical tower

ShimuraVarieties:V8.general/plan/general-minimal
CanonicalModel.general_minimal [application] — General-data minimal compactification interface

-/
