/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so contributors and reviewers
converge on names and types. No implementation is claimed.

The universal property below quantifies over all smooth test schemes, not just
integral points. Existence is not asserted for arbitrary S or arbitrary j.
The arithmetic application restricts j to the generic inclusion of a Dedekind
base. Missing geometric carriers and source-proof leaves are omitted honestly.
-/
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.QuasiCompact
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.CategoryTheory.Comma.Over.Pullback

noncomputable section
open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
namespace TauCeti.NeronBlueprint
universe u
variable {S η : Scheme.{u}} (j : η ⟶ S)

/-- Bijectivity of generic restriction for every smooth S-scheme. -/
def NeronMappingProperty (X : Over S) : Prop :=
  ∀ Y : Over S, Smooth Y.hom →
    Function.Bijective (fun f : Y ⟶ X => (Over.pullback j).map f)

namespace NeronMappingProperty
variable {j} {X Y : Over S}

lemma bijective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Bijective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry
lemma injective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Injective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry
lemma surjective (h : NeronMappingProperty j X) (hY : Smooth Y.hom) :
    Function.Surjective (fun f : Y ⟶ X => (Over.pullback j).map f) := by sorry
lemma existsUnique (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X) :
    ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry
lemma hom_ext (h : NeronMappingProperty j X) (hY : Smooth Y.hom)
    (f g : Y ⟶ X) (e : (Over.pullback j).map f = (Over.pullback j).map g) :
    f = g := by sorry
lemma iff_existsUnique : NeronMappingProperty j X ↔
    ∀ Y : Over S, Smooth Y.hom →
      ∀ f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X,
        ∃! g : Y ⟶ X, (Over.pullback j).map g = f := by sorry
lemma of_iso {X' : Over S} (e : X ≅ X') (h : NeronMappingProperty j X) :
    NeronMappingProperty j X' := by sorry
lemma identityRestriction (h : NeronMappingProperty j X) (hX : Smooth X.hom)
    (f : X ⟶ X) (e : (Over.pullback j).map f = 𝟙 _) : f = 𝟙 X := by sorry
lemma not_of_restriction_not_injective (hY : Smooth Y.hom)
    (h : ¬ Function.Injective (fun f : Y ⟶ X => (Over.pullback j).map f)) :
    ¬ NeronMappingProperty j X := by sorry
lemma not_of_restriction_not_surjective (hY : Smooth Y.hom)
    (h : ¬ Function.Surjective (fun f : Y ⟶ X => (Over.pullback j).map f)) :
    ¬ NeronMappingProperty j X := by sorry

/-- Unit test: NeronMappingProperty.nonextendible_test. -/
example (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ (Over.pullback j).obj X)
    (h : ∀ g : Y ⟶ X, (Over.pullback j).map g ≠ f) :
    ¬ NeronMappingProperty j X := by sorry
/-- Unit test: NeronMappingProperty.identity_test. -/
example (h : NeronMappingProperty j X) (hX : Smooth X.hom)
    (f : X ⟶ X) (e : (Over.pullback j).map f = 𝟙 _) : f = 𝟙 X := by sorry
/-- Unit test: NeronMappingProperty.identity_base_test. -/
example (X : Over S) : NeronMappingProperty (𝟙 S) X := by sorry
end NeronMappingProperty

/-- Finite-type marked model. Smoothness implies locally finite presentation;
quasi-compactness imposes the finite-type rather than merely lft convention. -/
structure NeronModel (A : Over η) where
  model : Over S
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : NeronMappingProperty j model

namespace NeronModel
variable {j} {A : Over η} (M : NeronModel j A)
lemma smooth_model : Smooth M.model.hom := by sorry
lemma separated_model : IsSeparated M.model.hom := by sorry
lemma quasiCompact_model : QuasiCompact M.model.hom := by sorry
lemma mappingProperty : NeronMappingProperty j M.model := by sorry
lemma generic_hom_inv : M.genericIso.hom ≫ M.genericIso.inv = 𝟙 _ := by sorry
lemma generic_inv_hom : M.genericIso.inv ≫ M.genericIso.hom = 𝟙 _ := by sorry
lemma hom_ext (Y : Over S) (hY : Smooth Y.hom) (f g : Y ⟶ M.model)
    (e : (Over.pullback j).map f ≫ M.genericIso.hom =
      (Over.pullback j).map g ≫ M.genericIso.hom) : f = g := by sorry
lemma extension_existsUnique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ M.model, (Over.pullback j).map g ≫ M.genericIso.hom = f := by sorry
lemma genericIso_isIso : IsIso M.genericIso.hom := by sorry
lemma identity_unique (f : M.model ⟶ M.model)
    (h : (Over.pullback j).map f ≫ M.genericIso.hom = M.genericIso.hom) :
    f = 𝟙 M.model := by sorry

/-- Unit test: NeronModel.structure_test. -/
example : Smooth M.model.hom ∧ IsSeparated M.model.hom ∧
    QuasiCompact M.model.hom := by sorry
/-- Unit test: NeronModel.hom_ext_test. -/
example (f g : M.model ⟶ M.model)
    (e : (Over.pullback j).map f = (Over.pullback j).map g) : f = g := by sorry
/-- Unit test: NeronModel.marking_test. -/
example : M.genericIso.hom ≫ M.genericIso.inv = 𝟙 _ := by sorry

/-- The mapping property's actual morphism-valued extension. -/
def extend (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) : Y ⟶ M.model := by sorry
lemma extend_restrict (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    (Over.pullback j).map (M.extend Y hY f) ≫ M.genericIso.hom = f := by sorry
lemma extend_unique (Y : Over S) (hY : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) (g : Y ⟶ M.model)
    (h : (Over.pullback j).map g ≫ M.genericIso.hom = f) :
    g = M.extend Y hY f := by sorry
lemma extend_map (Y : Over S) (hY : Smooth Y.hom) (f : Y ⟶ M.model) :
    M.extend Y hY ((Over.pullback j).map f ≫ M.genericIso.hom) = f := by sorry
lemma extend_identity :
    M.extend M.model M.smooth M.genericIso.hom = 𝟙 M.model := by sorry
lemma extend_precomp (Y Z : Over S) (hY : Smooth Y.hom) (hZ : Smooth Z.hom)
    (g : Z ⟶ Y) (f : (Over.pullback j).obj Y ⟶ A) :
    M.extend Z hZ ((Over.pullback j).map g ≫ f) = g ≫ M.extend Y hY f := by sorry
lemma extend_proof_irrel (Y : Over S) (hY hY' : Smooth Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) : M.extend Y hY f = M.extend Y hY' f := by sorry
lemma extend_to_model (N : NeronModel j A) :
    (Over.pullback j).map (M.extend N.model N.smooth N.genericIso.hom) ≫
      M.genericIso.hom = N.genericIso.hom := by sorry
lemma extend_comp_model (N P : NeronModel j A) :
    N.extend P.model P.smooth P.genericIso.hom ≫
      M.extend N.model N.smooth N.genericIso.hom =
      M.extend P.model P.smooth P.genericIso.hom := by sorry
lemma extend_inverse_model (N : NeronModel j A) :
    M.extend N.model N.smooth N.genericIso.hom ≫
      N.extend M.model M.smooth M.genericIso.hom = 𝟙 N.model := by sorry
lemma extend_isIso (N : NeronModel j A) :
    IsIso (M.extend N.model N.smooth N.genericIso.hom) := by sorry

/-- Unit test: NeronModel.extend_identity_test. -/
example : M.extend M.model M.smooth M.genericIso.hom = 𝟙 M.model := by sorry
/-- Unit test: NeronModel.extend_inverse_test. -/
example (N : NeronModel j A) :
    M.extend N.model N.smooth N.genericIso.hom ≫
      N.extend M.model M.smooth M.genericIso.hom = 𝟙 N.model := by sorry
/-- Unit test: NeronModel.extend_restrict_test. -/
example (Y : Over S) (hY : Smooth Y.hom) (f : (Over.pullback j).obj Y ⟶ A) :
    (Over.pullback j).map (M.extend Y hY f) ≫ M.genericIso.hom = f := by sorry

theorem unique_iso (N : NeronModel j A) :
    ∃! e : M.model ≅ N.model,
      (Over.pullback j).map e.hom ≫ N.genericIso.hom = M.genericIso.hom := by sorry
end NeronModel

/-- Weak models use étale, not arbitrary smooth test schemes. -/
structure WeakNeronModel (A : Over η) where
  model : Over S
  genericIso : (Over.pullback j).obj model ≅ A
  smooth : Smooth model.hom
  separated : IsSeparated model.hom
  quasiCompact : QuasiCompact model.hom
  mapping : ∀ Y : Over S, Etale Y.hom →
    Function.Bijective (fun f : Y ⟶ model => (Over.pullback j).map f)

namespace WeakNeronModel
variable {j} {A : Over η} (W : WeakNeronModel j A)
lemma smooth_model : Smooth W.model.hom := by sorry
lemma separated_model : IsSeparated W.model.hom := by sorry
lemma quasiCompact_model : QuasiCompact W.model.hom := by sorry
lemma generic_hom_inv : W.genericIso.hom ≫ W.genericIso.inv = 𝟙 _ := by sorry
lemma generic_inv_hom : W.genericIso.inv ≫ W.genericIso.hom = 𝟙 _ := by sorry
lemma bijective (Y : Over S) (hY : Etale Y.hom) :
    Function.Bijective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry
lemma injective (Y : Over S) (hY : Etale Y.hom) :
    Function.Injective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry
lemma surjective (Y : Over S) (hY : Etale Y.hom) :
    Function.Surjective (fun f : Y ⟶ W.model => (Over.pullback j).map f) := by sorry
lemma existsUnique (Y : Over S) (hY : Etale Y.hom)
    (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry
lemma hom_ext (Y : Over S) (hY : Etale Y.hom) (f g : Y ⟶ W.model)
    (e : (Over.pullback j).map f ≫ W.genericIso.hom =
      (Over.pullback j).map g ≫ W.genericIso.hom) : f = g := by sorry
/-- Unit test: WeakNeronModel.structure_test. -/
example : Smooth W.model.hom ∧ IsSeparated W.model.hom ∧
    QuasiCompact W.model.hom := by sorry
/-- Unit test: WeakNeronModel.etale_extension_test. -/
example (Y : Over S) (hY : Etale Y.hom) (f : (Over.pullback j).obj Y ⟶ A) :
    ∃! g : Y ⟶ W.model, (Over.pullback j).map g ≫ W.genericIso.hom = f := by sorry
/-- Unit test: WeakNeronModel.identity_base_test. -/
example (X : Over S) (hX : Smooth X.hom) (hsep : IsSeparated X.hom)
    (hqc : QuasiCompact X.hom) : Nonempty (WeakNeronModel (𝟙 S) X) := by sorry
end WeakNeronModel
end TauCeti.NeronBlueprint

-- Resolve each exact native packet/API declaration name.
#check TauCeti.NeronBlueprint.NeronMappingProperty
#check TauCeti.NeronBlueprint.NeronMappingProperty.bijective
#check TauCeti.NeronBlueprint.NeronMappingProperty.existsUnique
#check TauCeti.NeronBlueprint.NeronMappingProperty.hom_ext
#check TauCeti.NeronBlueprint.NeronMappingProperty.identityRestriction
#check TauCeti.NeronBlueprint.NeronMappingProperty.iff_existsUnique
#check TauCeti.NeronBlueprint.NeronMappingProperty.injective
#check TauCeti.NeronBlueprint.NeronMappingProperty.not_of_restriction_not_injective
#check TauCeti.NeronBlueprint.NeronMappingProperty.not_of_restriction_not_surjective
#check TauCeti.NeronBlueprint.NeronMappingProperty.of_iso
#check TauCeti.NeronBlueprint.NeronMappingProperty.surjective
#check TauCeti.NeronBlueprint.NeronModel
#check TauCeti.NeronBlueprint.NeronModel.extend
#check TauCeti.NeronBlueprint.NeronModel.extend_comp_model
#check TauCeti.NeronBlueprint.NeronModel.extend_identity
#check TauCeti.NeronBlueprint.NeronModel.extend_inverse_model
#check TauCeti.NeronBlueprint.NeronModel.extend_isIso
#check TauCeti.NeronBlueprint.NeronModel.extend_map
#check TauCeti.NeronBlueprint.NeronModel.extend_precomp
#check TauCeti.NeronBlueprint.NeronModel.extend_proof_irrel
#check TauCeti.NeronBlueprint.NeronModel.extend_restrict
#check TauCeti.NeronBlueprint.NeronModel.extend_to_model
#check TauCeti.NeronBlueprint.NeronModel.extend_unique
#check TauCeti.NeronBlueprint.NeronModel.extension_existsUnique
#check TauCeti.NeronBlueprint.NeronModel.genericIso_isIso
#check TauCeti.NeronBlueprint.NeronModel.generic_hom_inv
#check TauCeti.NeronBlueprint.NeronModel.generic_inv_hom
#check TauCeti.NeronBlueprint.NeronModel.hom_ext
#check TauCeti.NeronBlueprint.NeronModel.identity_unique
#check TauCeti.NeronBlueprint.NeronModel.mappingProperty
#check TauCeti.NeronBlueprint.NeronModel.quasiCompact_model
#check TauCeti.NeronBlueprint.NeronModel.separated_model
#check TauCeti.NeronBlueprint.NeronModel.smooth_model
#check TauCeti.NeronBlueprint.NeronModel.unique_iso
#check TauCeti.NeronBlueprint.WeakNeronModel
#check TauCeti.NeronBlueprint.WeakNeronModel.bijective
#check TauCeti.NeronBlueprint.WeakNeronModel.existsUnique
#check TauCeti.NeronBlueprint.WeakNeronModel.generic_hom_inv
#check TauCeti.NeronBlueprint.WeakNeronModel.generic_inv_hom
#check TauCeti.NeronBlueprint.WeakNeronModel.hom_ext
#check TauCeti.NeronBlueprint.WeakNeronModel.injective
#check TauCeti.NeronBlueprint.WeakNeronModel.quasiCompact_model
#check TauCeti.NeronBlueprint.WeakNeronModel.separated_model
#check TauCeti.NeronBlueprint.WeakNeronModel.smooth_model
#check TauCeti.NeronBlueprint.WeakNeronModel.surjective

/-
Exact signature omissions (not declarations or implementations):

OMITTED TauCeti.NeronBlueprint.GroupLaw
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/group-law
The native Over/Scheme prefix cannot yet state the exact Unique group structure on the Néron model interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: The model of A has a unique commutative group-scheme law extending that of A; a K-homomorphism A→B extends uniquely to an S-homomorphism of models. Generic isogenies extend as homomorphisms, not automatically as finite flat maps.
Transitive gaps: none recorded for this node
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.Smoothening
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/smoothening
The native Over/Scheme prefix cannot yet state the exact Local weak-model smoothening target interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an abelian variety A/K over an excellent DVR R, construct a smooth separated finite-type weak model through the boundedness and smoothening procedure, then upgrade a group weak model to the full mapping property by BLR §1.2 Criterion 9. This is a construction target with the unresolved G-existence proof, not a supplied theorem.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.LocalExistence
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/local-existence
The native Over/Scheme prefix cannot yet state the exact Local existence of Néron models interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Every abelian variety over the fraction field of an excellent DVR has a finite-type Néron model over that DVR. No arbitrary smooth group or genus-one torsor existence is claimed.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.SpreadAbelian
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/spread-abelian
The native Over/Scheme prefix cannot yet state the exact Spread an abelian variety to a dense open interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For A/K and connected Dedekind S, there is a nonempty open U⊂S and an abelian scheme A_U with generic fibre A. Its group law and smooth proper fibres spread along with the scheme.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-spreading
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.AbelianSchemeModel
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model
The native Over/Scheme prefix cannot yet state the exact An abelian scheme is the Néron model interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: An abelian scheme over S satisfies the full NMP, hence is the marked Néron model of its generic fibre. Good reduction at a closed point means an abelian scheme over the local DVR; this is not the equation predicate without a comparison.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.DedekindGluing
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/dedekind-gluing
The native Over/Scheme prefix cannot yet state the exact Dedekind local-to-global construction interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Suppose A extends to an abelian scheme over a dense open U⊂S and has finite-type local Néron models at the finitely many remaining closed points. These glue to a finite-type S-model with the full NMP. Apply to rings of integers and S-integers of number fields.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.EtaleBasechange
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/etale-basechange
The native Over/Scheme prefix cannot yet state the exact Étale and unramified base change interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an étale morphism Sprime→S of Dedekind schemes, base change of a Néron model is the Néron model of the base-changed generic variety. In the finite local case apply to an unramified extension of DVRs. Arbitrary ramified base change of the whole model is not asserted.
Transitive gaps: none recorded for this node
Required imports: none

OMITTED TauCeti.NeronBlueprint.DifferentialLattice
Node: NeronModelsAndSemistableAbelianVarieties:R11.1/differential-lattice
The native Over/Scheme prefix cannot yet state the exact Invariant-differential lattice interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For the global smooth group model M/S with identity e, define omega_M=e*Omega^1_(M/S). It is locally free of rank g, and its generic fibre identifies with invariant differentials of A/K. On S=Spec R this is a finite projective R-lattice inside the K-vector space, not necessarily a free module.
OMITTED API NeronDifferentials.rank: omega_M has rank dim A on connected S.
OMITTED API NeronDifferentials.generic_iso: omega_M tensor K is the invariant differential space of A.
OMITTED API NeronDifferentials.localize: omega_M localized at a finite place equals the invariant differential module of its local Néron model.
OMITTED API NeronDifferentials.pullback: An extended homomorphism f:M→N induces f*:omega_N→omega_M.
OMITTED API NeronDifferentials.map_id: Pullback along identity is identity.
OMITTED API NeronDifferentials.map_comp: Pullback along f followed by g equals pullback along g then f.
OMITTED API NeronDifferentials.det: det omega_M is an invertible sheaf, the integral Hodge line.
OMITTED API NeronDifferentials.det_localize: The Hodge line localizes to the determinant of the local module.
OMITTED API NeronDifferentials.etale_basechange: Under allowed étale base change, the invariant differential module pulls back compatibly.
OMITTED API NeronDifferentials.affine_colie: On an affine group chart at e, omega identifies with ker epsilon/(ker epsilon)^2; this local comparison is not a global affine-model assertion.
OMITTED EXAMPLE NeronDifferentials.zero_dimension: The zero abelian variety has zero differential module and trivial determinant.
OMITTED EXAMPLE NeronDifferentials.localization_test: Over a DVR with good elliptic reduction the minimal differential is a basis of omega_M.
OMITTED EXAMPLE NeronDifferentials.projective_test: Over a Dedekind ring permit a nonprincipal invertible determinant; do not assert a global basis.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.IdentityComponent
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/identity-component
The native Over/Scheme prefix cannot yet state the exact Identity component of the special fibre interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Let M_k be the smooth finite-type special-fibre group. Construct its geometrically connected identity subgroup M_k^0 as an open and closed normal subgroup over k, and the open subgroup M^0⊂M with generic fibre A and special fibre M_k^0. Neither group is assumed affine.
OMITTED API NeronIdentity.open: M_k^0 is open and closed in M_k.
OMITTED API NeronIdentity.normal: M_k^0 is normal, and commutative for abelian generic A.
OMITTED API NeronIdentity.contains_zero: The identity section factors through M^0.
OMITTED API NeronIdentity.geometrically_connected: The geometric special fibre of M^0 is connected.
OMITTED API NeronIdentity.generic_iso: The generic fibre of M^0 is all of A.
OMITTED API NeronIdentity.basechange_field: Identity components commute with residue-field extension.
OMITTED API NeronIdentity.map: A homomorphism of models sends identity components into identity components.
OMITTED API NeronIdentity.map_id: Identity induces identity on M_k^0.
OMITTED API NeronIdentity.map_comp: Induced identity-component maps respect composition.
OMITTED API NeronIdentity.good: For an abelian-scheme model M^0=M.
OMITTED EXAMPLE NeronIdentity.good_test: A good elliptic model has the entire special fibre as its identity component.
OMITTED EXAMPLE NeronIdentity.split_tate_test: For split multiplicative elliptic reduction M_k^0 is G_m although the proper regular fibre has several components when n>1.
OMITTED EXAMPLE NeronIdentity.nonaffine_test: For a positive-dimensional good abelian variety the proper special fibre must not be treated as affine.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.ComponentGroup
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/component-group
The native Over/Scheme prefix cannot yet state the exact Finite étale component group interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Construct Phi_A=M_k/M_k^0 as a finite étale commutative k-group representing the fppf component quotient. Phi_A(k) is the Galois-fixed subgroup of Phi_A(k_sep), not the full geometric group in general.
OMITTED API NeronComponents.projection: There is a group morphism M_k→Phi_A.
OMITTED API NeronComponents.kernel: The projection kernel is M_k^0 as a group scheme.
OMITTED API NeronComponents.quotient: Maps of M_k constant on identity-component cosets factor uniquely through Phi_A.
OMITTED API NeronComponents.finite_etale: Phi_A is finite étale over k.
OMITTED API NeronComponents.geometric: Phi_A(k_sep) is the finite group of geometric connected components.
OMITTED API NeronComponents.rational: Phi_A(k)=Phi_A(k_sep)^Gal(k_sep/k).
OMITTED API NeronComponents.map: An extended homomorphism A→B induces Phi_A→Phi_B.
OMITTED API NeronComponents.map_id: The induced component map of identity is identity.
OMITTED API NeronComponents.map_comp: Component maps respect composition.
OMITTED API NeronComponents.good: An abelian-scheme model has zero component group.
OMITTED EXAMPLE NeronComponents.good_test: Good reduction gives Phi_A=0, not one nonzero component class.
OMITTED EXAMPLE NeronComponents.tate_test: For split Tate parameter q with ord(q)=n>0, Phi_E(k_sep)=Z/nZ.
OMITTED EXAMPLE NeronComponents.nonsplit_test: For nonsplit multiplicative reduction, Frobenius acts by minus one on Z/nZ; its fixed subgroup can be smaller than n.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.Chevalley
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/chevalley
The native Over/Scheme prefix cannot yet state the exact Chevalley decomposition with field hypotheses interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Over a perfect residue field k, M_k^0 has a unique maximal smooth connected affine subgroup L with abelian quotient B. For commutative L, over k_sep decompose its toric and unipotent parts; record toric, abelian and unipotent dimensions. Over an imperfect field do not assert this exact smooth Chevalley form without extra hypotheses.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.ToricCharacter
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/toric-character
The native Over/Scheme prefix cannot yet state the exact Toric character lattice interface interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For the maximal torus T of a semistable geometric identity fibre, use the supplier character group X*(T)=Hom(T,G_m) as a free integral lattice with residue Galois action. A model homomorphism f:A→B induces f_T:T_A→T_B and contravariant f_T*:X*(T_B)→X*(T_A).
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.IsogenyComponents
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/isogeny-components
The native Over/Scheme prefix cannot yet state the exact Isogeny functoriality without false exactness interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Every generic isogeny extends functorially to model, identity-fibre and component maps. If A is semistable, the induced map of connected special fibres to that of an isogenous B is an isogeny, and B is semistable. Do not infer that the whole model map is finite flat or that taking Néron models preserves an arbitrary short exact sequence.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-isogeny-sequences
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.EllipticFiltration
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/elliptic-filtration
The native Over/Scheme prefix cannot yet state the exact Elliptic reduction filtration comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an elliptic curve over a complete DVR with perfect residue field, identify the equation subgroup E0(K) with M^0(R), and E1(K) with the kernel of reduction M^0(R)→M_k^0(k), equivalently the formal group on the maximal ideal. For finite k, E(K)/E0(K)≅Phi_E(k); over arbitrary k a rational lifting obstruction must be retained.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

OMITTED TauCeti.NeronBlueprint.MinimalRegularSmoothLocus
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/minimal-regular-smooth-locus
The native Over/Scheme prefix cannot yet state the exact Smooth locus of the elliptic minimal regular model interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an elliptic curve E/K and its minimal proper regular model X/R, over a strictly henselian DVR with algebraically closed residue field, the relative smooth locus X_sm is the Néron model. The existence/minimality of X is supplied by StableReduction; identification with NMP is owned here.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

OMITTED TauCeti.NeronBlueprint.KodairaGeometricConfigurations
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-geometric-configurations
The native Over/Scheme prefix cannot yet state the exact Geometric Kodaira configurations interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Under the elliptic hypotheses of minimal-regular-smooth-locus, attach to each imported TateReductionSymbol the actual reduced component curves, singularities, intersections and multiplicities in X_k. I0 is a smooth genus-one curve; I1 is a nodal rational curve; II is a cuspidal rational curve. I_n (n≥2) is a cycle of n rational components, with a double intersection for n=2. III has two tangent rational components; IV has three rational components meeting at one point. The starred configurations have the affine D/E diagrams and multiplicities shown by Tate, not merely their vertex counts. For I0* use the affine D4 configuration with central multiplicity2 and four ends of multiplicity1. I_n* has four ends of multiplicity1 and n+1 inner components of multiplicity2. IV*, III*, II* have respective multiplicity multisets {1,1,1,2,2,2,3}, {1,1,2,2,2,3,3,4}, {1,2,2,3,3,4,4,5,6}, attached to the affine E6,E7,E8 diagrams. All components in these reducible configurations are smooth rational curves.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.KodairaComponentGroups
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/kodaira-component-groups
The native Over/Scheme prefix cannot yet state the exact Geometric component groups by Kodaira type interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For algebraically closed residue k, identify Phi_E with 0 for I0, Z/n for I_n, 0 for II and II*, Z/2 for III and III*, Z/3 for IV and IV*, (Z/2)^2 for I_n* with n even, and Z/4 for I_n* with n odd. These are geometric groups; rational Tamagawa factors require residue descent.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.WildKodairaComparison
Node: NeronModelsAndSemistableAbelianVarieties:R11.2/wild-kodaira-comparison
The native Over/Scheme prefix cannot yet state the exact Wild primes retained in elliptic comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: The geometric configuration and component-group comparison includes residue characteristic 2 and 3 via the imported full Tate algorithm. The tame discriminant valuations (II:2, III:3, IV:4, I0*:6, I_n*:n+6, IV*:8, III*:9, II*:10) and the tame additive conductor value 2 are not copied into those characteristics.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.SemistableReduction
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-reduction
The native Over/Scheme prefix cannot yet state the exact Semistable reduction predicate interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: A/K has semistable reduction over R precisely when the connected special fibre M_k^0 of its Néron model is a semi-abelian variety: an extension of an abelian variety by a torus. Over perfect k this is equivalent to zero unipotent part. Good reduction requires an abelian model, not merely this condition.
OMITTED API SemistableReduction.iff_identity: Semistability is equivalent to the identity special fibre being semi-abelian.
OMITTED API SemistableReduction.good: Good reduction implies semistable reduction.
OMITTED API SemistableReduction.no_unipotent: Over perfect k, semistability is equivalent to a zero unipotent radical.
OMITTED API SemistableReduction.dimension: For semistable A of dimension g, toric rank t and abelian rank a satisfy g=t+a.
OMITTED API SemistableReduction.isogeny: Semistability is preserved under isogeny.
OMITTED API SemistableReduction.dual: A is semistable iff its dual is semistable.
OMITTED API SemistableReduction.finite_basechange: Semistability survives finite DVR extensions with the stated valuation hypotheses.
OMITTED API SemistableReduction.identity_basechange: For semistable A the base-change map on identity models is an isomorphism.
OMITTED API SemistableReduction.toric_zero: For a semistable A, toric rank zero is equivalent to good reduction.
OMITTED API SemistableReduction.product: A product has semistable reduction iff its factors do; use the product model and connected special fibres.
OMITTED EXAMPLE SemistableReduction.good_test: A good elliptic curve has t=0,a=1.
OMITTED EXAMPLE SemistableReduction.tate_test: A split Tate curve is semistable with t=1,a=0 and is not good.
OMITTED EXAMPLE SemistableReduction.additive_test: An additive elliptic identity fibre G_a over an algebraically closed residue field is not semi-abelian.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.SemistabilityIsogeny
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/semistability-isogeny
The native Over/Scheme prefix cannot yet state the exact Semistability under isogeny interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For isogenous abelian varieties over K, semistability over R is equivalent; their toric and abelian ranks coincide and their connected special fibres are isogenous. No equality of integral component groups is claimed.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-isogeny-sequences, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.SemistableIdentityBasechange
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/semistable-identity-basechange
The native Over/Scheme prefix cannot yet state the exact Semistable identity-model base change interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a semistable A/K and a finite extension of DVRs R→Rprime with fraction-field extension Kprime/K, the canonical map M^0 base changed to Rprime→N^0 is an isomorphism. This does not identify M base changed with the whole Néron model N.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.RamifiedTateCounterexample
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/ramified-tate-counterexample
The native Over/Scheme prefix cannot yet state the exact Ramified Tate component calculation interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a split Tate curve over a complete DVR, ord_R(q)=n>0 implies geometric Phi=Z/n. Under ramification index e, Phi_new=Z/(en), and the canonical component map sends r mod n to er mod en. Thus full Néron-model base change fails in general.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

OMITTED TauCeti.NeronBlueprint.ToricFiniteFiltration
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/toric-finite-filtration
The native Over/Scheme prefix cannot yet state the exact Toric and finite Tate submodules interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For semistable A over a henselian DVR and ell invertible in K, construct saturated G_K-stable submodules T_t⊂T_f⊂T_ell(A) of ranks t and t+2a. Here g=t+a and the corank of T_f is t. If additionally ell differs from char(k), T_f equals inertia invariants; that last equality is not asserted at the residue prime.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.Orthogonality
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/orthogonality
The native Over/Scheme prefix cannot yet state the exact Weil orthogonality of the filtration interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For semistable A, the perfect pairing T_ell(A)×T_ell(Adual)→Z_ell(1) identifies the finite part for A with the exact annihilator of the toric part for its dual; the quotient by the finite part is dual to that dual toric part. At ell=residue characteristic in mixed characteristic this uses p-divisible groups, not unramified inertia.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.InertiaSquareZero
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/inertia-square-zero
The native Over/Scheme prefix cannot yet state the exact Semistable inertia is unipotent of height two interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: If A/R is semistable and ell≠char(k), every inertia sigma acts on T_ell(A) with (sigma−1)^2=0. The toric/finite filtration supplies a canonical factorization of sigma−1 through the toric part.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.MonodromyCriterion
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/monodromy-criterion
The native Over/Scheme prefix cannot yet state the exact Grothendieck semistability criterion interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an abelian variety over a henselian DVR and ell≠char(k), A is semistable iff inertia acts unipotently on T_ell(A); the forward implication has exponent at most two. The converse is a geometric theorem, not a tautological definition.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.FiniteSeparableSemistableExtension
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension
The native Over/Scheme prefix cannot yet state the exact Semistable reduction after finite extension interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For A over the fraction field of an excellent DVR, there exists a finite separable extension Kprime/K such that A_Kprime is semistable at the DVRs in the integral closure lying over R.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-valuations
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.FiniteTorsionSemistability
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/finite-torsion-semistability
The native Over/Scheme prefix cannot yet state the exact Prime-to-residue full level forces semistability interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For N≥3 invertible in k, trivial inertia on A[N](K_sep) implies semistability over R. In particular, after adjoining full N-torsion one gets semistable reduction at all residue primes not dividing N. This does not claim good reduction.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-level-kernel
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.RaynaudExtensionComparison
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison
The native Over/Scheme prefix cannot yet state the exact Raynaud formal extension comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a semistable abelian variety over a complete DVR of positive residue characteristic, lift the maximal special-fibre torus to the formal identity model and its formal abelian quotient, and compare the formal completion with the algebraic semi-abelian extension supplied by the early C4 degeneration theory. Generic Néron-model and abstract 1-motive carriers are not conflated.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0

OMITTED TauCeti.NeronBlueprint.RigidUniformisation
Node: NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation
The native Over/Scheme prefix cannot yet state the exact Polarized lattice uniformisation comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: In the complete positive-residue-characteristic setting, A^an is the rigid/fppf quotient of the generic semi-abelian Raynaud extension G by an étale locally constant lattice Y of rank equal to the toric degeneration rank. For a polarization, the dual toric character/lattice data and Poincaré trivialization satisfy the integral symmetric positive nondegenerate valuation pairing. Nonsplit data require Galois descent, not a chosen split constant lattice.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0

OMITTED TauCeti.NeronBlueprint.PicardZero
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/picard-zero
The native Over/Scheme prefix cannot yet state the exact Degree-zero Picard of a semistable curve interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Starting with the supplied relative fppf Picard functor of X/R, construct its fibrewise identity component Pic^0_(X/R), whose special fibre parametrizes multidegree-zero line-bundle classes on every geometric irreducible component. Under the regular semistable hypotheses it is a smooth separated semi-abelian R-group with generic fibre Jac(X_K). Do not identify the entire nonseparated relative Picard functor with a Néron model.
OMITTED API SemistablePicard.generic: The generic fibre of Pic^0 is the smooth-curve Jacobian.
OMITTED API SemistablePicard.special: The special fibre is the degree-zero Picard of X_k.
OMITTED API SemistablePicard.multidegree: Geometric line-bundle classes in the identity component have degree zero on every normalization component.
OMITTED API SemistablePicard.smooth: Pic^0 is smooth over R.
OMITTED API SemistablePicard.separated: Regularity and reduced semistable fibres give the separated identity component.
OMITTED API SemistablePicard.semiabelian: Every fibre of Pic^0 is an extension of an abelian variety by a torus.
OMITTED API SemistablePicard.pullback: A curve morphism induces pullback on Picard classes with the required multidegree condition verified.
OMITTED API SemistablePicard.pullback_id: Pullback by identity is identity.
OMITTED API SemistablePicard.pullback_comp: Pullback is contravariant for composites.
OMITTED API SemistablePicard.smooth_case: For a smooth proper family this is the existing relative Jacobian, not a second definition.
OMITTED EXAMPLE SemistablePicard.smooth_test: A smooth fibre has no toric part and recovers its Jacobian.
OMITTED EXAMPLE SemistablePicard.irreducible_node_test: An irreducible rational one-node curve has Pic^0=G_m, not zero.
OMITTED EXAMPLE SemistablePicard.tree_test: A nodal tree of rational curves has trivial Pic^0 even though its componentwise Picard group is nontrivial.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud
Required imports: tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

OMITTED TauCeti.NeronBlueprint.NormalizationExactSequence
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence
The native Over/Scheme prefix cannot yet state the exact Normalization sequence for the generalized Jacobian interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a connected proper nodal curve C over algebraically closed k, its normalization components C_v have an exact fppf sequence 0→T_Gamma→Pic^0(C)→product_v Jac(C_v)→0. T_Gamma has character lattice H_1(Gamma,Z), for the dual multigraph retaining loops and multiple edges.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology
Required imports: tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

OMITTED TauCeti.NeronBlueprint.CharactersGraphHomology
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology
The native Over/Scheme prefix cannot yet state the exact Characters are integral graph cycles interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: There is a canonical isomorphism X*(T_Gamma)≅ker(partial:Z^Edges→Z^Vertices)=H_1(Gamma,Z). It is independent of orientation after the corresponding sign changes, and equivariant for automorphisms/Galois descent. The dual quotient is H^1, not the character group itself.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

OMITTED TauCeti.NeronBlueprint.PicardNeronIdentity
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/picard-neron-identity
The native Over/Scheme prefix cannot yet state the exact Picard identity and Néron identity comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For the regular semistable curve X/R of ch, Pic^0_(X/R) is canonically the identity open subgroup of the Néron model of Jac(X_K). The full model includes its component group and is obtained from the degree-zero part of the quotient of the relative Picard functor by the closure of the generic identity.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

OMITTED TauCeti.NeronBlueprint.IntegralMonodromyPairing
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/integral-monodromy-pairing
The native Over/Scheme prefix cannot yet state the exact Integral monodromy pairing interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For semistable A over a henselian DVR, let X_A=X*(T_A) and X_dual=X*(T_Adual). Construct the integral bilinear valuation pairing u:X_dual×X_A→Z from the Poincaré degeneration. It induces u#:X_dual→Hom(X_A,Z). For a polarization lambda:A→Adual, pull characters back by lambda*:X_dual→X_A; (x,y)↦u(x,lambda*(y)) is symmetric positive definite over Q on the free lattices. No integral unimodularity is asserted.
OMITTED API NeronMonodromy.bilinear: u is integral bilinear in the two character lattices.
OMITTED API NeronMonodromy.adjoint: u# maps X_dual into the integral dual of X_A.
OMITTED API NeronMonodromy.non_degenerate: u# is injective and has finite cokernel.
OMITTED API NeronMonodromy.dual_symmetry: Under biduality, the pairing for Adual is the transpose of that for A.
OMITTED API NeronMonodromy.polarized_symmetric: The polarization-induced form is symmetric.
OMITTED API NeronMonodromy.polarized_positive: That form is positive definite after tensoring with R.
OMITTED API NeronMonodromy.prime_adic: Tensoring u with Z_ell is the canonical prime-adic monodromy pairing, including the source-qualified residue-prime construction.
OMITTED API NeronMonodromy.basechange: A ramification-index-e base change scales the pairing by e under the identity-torus comparison.
OMITTED API NeronMonodromy.functorial: For f:A→B, y∈X_Adual and x∈X_B, u_A(y,f* x)=u_B(fdual* y,x), where fdual:Bdual→Adual and its character pullback goes X_Adual→X_Bdual.
OMITTED API NeronMonodromy.zero_torus: If both character lattices are zero, the pairing and its cokernel are zero.
OMITTED EXAMPLE NeronMonodromy.tate_test: For a split Tate curve ord(q)=n, the self-dual rank-one pairing is multiplication by n.
OMITTED EXAMPLE NeronMonodromy.ramification_test: Ramification e changes the Tate pairing from n to en.
OMITTED EXAMPLE NeronMonodromy.good_test: Good reduction gives zero lattices, not an arbitrary positive rank pairing.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0

OMITTED TauCeti.NeronBlueprint.GraphMonodromy
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/graph-monodromy
The native Over/Scheme prefix cannot yet state the exact Graph formula for Jacobian monodromy interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For regular projective semistable X/R with algebraically closed residue field, under the Jacobian autoduality and character-cycle isomorphism, u(c,d)=sum_e c_e d_e on H_1(Gamma,Z). Reversing an edge reverses both coefficients and preserves the form. For a nonregular stable node xy=pi^m, a weighted edge of length m represents its regular resolution chain; that extension requires G-thickness-resolution.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-thickness-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

OMITTED TauCeti.NeronBlueprint.ComponentCokernel
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/component-cokernel
The native Over/Scheme prefix cannot yet state the exact Component group from monodromy cokernel interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a semistable abelian variety over a henselian DVR, the finite cokernel of u#:X_dual→Hom(X_A,Z), viewed with its residue Galois descent, is canonically the finite étale component group Phi_A. Its ell-primary part is the cokernel after tensoring with Z_ell for every prime ell, with the source-qualified p-divisible interpretation at the residue prime.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0

OMITTED TauCeti.NeronBlueprint.ComponentPairing
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/component-pairing
The native Over/Scheme prefix cannot yet state the exact Grothendieck component pairing interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Construct the canonical Poincaré obstruction pairing Phi_A×Phi_Adual→Q/Z over the residue field. In the semistable case it is perfect and equals the discriminant pairing induced by u on its two finite lattice cokernels. Do not claim the historical general perfectness conjecture solely from SGA7 IX §1.3.
OMITTED API NeronComponentPairing.bilinear: The component pairing is bilinear with target Q/Z.
OMITTED API NeronComponentPairing.galois: It is residue-Galois equivariant.
OMITTED API NeronComponentPairing.dual: The dual variety pairing is the transpose under biduality.
OMITTED API NeronComponentPairing.perfect_semistable: For semistable A it identifies each finite geometric component group with the Q/Z dual of the other.
OMITTED API NeronComponentPairing.discriminant: Its value is the fractional inverse-monodromy value modulo Z on cokernel classes.
OMITTED API NeronComponentPairing.independent_lifts: Changing a representative by an image of the integral monodromy map changes the rational value by an integer.
OMITTED API NeronComponentPairing.zero_left: Pairing a zero component class gives zero.
OMITTED API NeronComponentPairing.zero_right: Pairing against a zero dual class gives zero.
OMITTED API NeronComponentPairing.functorial: For f:A→B, pair_B(f_*a,b)=pair_A(a,fdual_*b).
OMITTED API NeronComponentPairing.good: Good reduction has the unique zero pairing on zero component groups.
OMITTED EXAMPLE NeronComponentPairing.tate_test: On Z/n paired with Z/n the value of residue classes r,s is rs/n modulo Z, up to the fixed source sign convention.
OMITTED EXAMPLE NeronComponentPairing.lift_test: Replacing r by r+n changes rs/n by the integer s.
OMITTED EXAMPLE NeronComponentPairing.n1_test: For n=1 both groups and the pairing are zero.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0

OMITTED TauCeti.NeronBlueprint.IntersectionComponentQuotient
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/intersection-component-quotient
The native Over/Scheme prefix cannot yet state the exact Intersection matrix component description interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a regular proper flat curve X/R with geometrically connected smooth generic fibre, algebraically closed residue field, and gcd of special-fibre multiplicities m_v equal to one, let I be its full intersection matrix. Then Phi_J(k) is the finite group ker(d:Z^V→Z)/im(I), with d(a)=sum_v m_v a_v. Import the numerical Picard/intersection complex from StableReduction and prove its comparison with the actual Jacobian. For reduced nodal fibres this agrees with the graph discriminant group.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-intersection-comparison
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.BgwNodalPinch
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-nodal-pinch
The native Over/Scheme prefix cannot yet state the exact BGW one-node curve adapter interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For char(K)≠2, g≥1 and a separable binary form f of degree 2g+2 with leading coefficient f0≠0, the smooth curve C:z²=f has two infinity branches over the quadratic étale algebra D=K[s]/(s²−f0). Pinching that degree-two divisor to a K-point gives C_m:z²=f y², arithmetic genus g+1 and one ordinary node, with normalization C. Generic Ferrand pinching is imported from Part II G.0.
Transitive gaps: none recorded for this node
Required imports: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence

OMITTED TauCeti.NeronBlueprint.BgwGeneralizedJacobian
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-generalized-jacobian
The native Over/Scheme prefix cannot yet state the exact BGW generalized Jacobian torus interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For the preceding C_m, there is an exact fppf sequence 0→(Res_D/K G_m)/G_m→J_m→J→0; the torus is canonically isomorphic to the norm-one torus for the quadratic étale algebra D. Here J=Pic^0(C), J_m=Pic^0(C_m); Picard rational classes need not be line bundles defined over K.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology
Required imports: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

OMITTED TauCeti.NeronBlueprint.BgwTwoTorsion
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-two-torsion
The native Over/Scheme prefix cannot yet state the exact BGW finite two-torsion comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For L=K[t]/(f(t,1)/f0), J_m[2]≅ker(N:Res_L/K mu_2→mu_2), and J[2] is that kernel modulo diagonal mu_2. Their geometric ranks are 2^(2g+1) and 2^(2g). Geometric classes correspond to even partitions of the 2g+2 roots modulo complement for J[2]; rational fixed classes can come from conjugate unordered partitions, not only K-rational factors.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors
Required imports: AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

OMITTED TauCeti.NeronBlueprint.BgwBrauerDescent
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-brauer-descent
The native Over/Scheme prefix cannot yet state the exact BGW rational classes versus rational divisors interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For C/K above, the quotient Pic_(C/K)(K)/Pic(C) injects into Br(K) and its image is killed by base change to the quadratic splitting algebra D. Thus a K-point of the Picard functor need not be a K-line bundle, and rational torsor tests must retain the Brauer obstruction.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard
Required imports: NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

OMITTED TauCeti.NeronBlueprint.StableFamilyPicard
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/stable-family-picard
The native Over/Scheme prefix cannot yet state the exact Stable-family Picard and Hodge comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an integral Noetherian S and stable relative curve X/S of genus g>1, the fibrewise Picard identity is a smooth separated semi-abelian S-group. Its Hodge line det(e*Omega^1) is canonically isomorphic to det(pi_*omega_(X/S)). This stable-family assertion does not require a regular total space, unlike the Néron identity comparison over a DVR; archimedean metrics are exported to R35 rather than constructed here.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-stable-Picard
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

OMITTED TauCeti.NeronBlueprint.NeronOggShafarevich
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich
The native Over/Scheme prefix cannot yet state the exact Néron–Ogg–Shafarevich interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For A over the fraction field of a henselian DVR and ell≠char(k), A has good reduction iff T_ell(A) is unramified. This is an assertion about the full integral ell-adic action, not a single torsion level.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.GoodIsogeny
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/good-isogeny
The native Over/Scheme prefix cannot yet state the exact Good reduction is isogeny invariant interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Isogenous abelian varieties over K have good reduction at the same DVRs. The rational Tate-module representations are isomorphic even when the isogeny degree is divisible by ell; integral Tate lattices need not be equal.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.PadicComparisonImport
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/padic-comparison-import
The native Over/Scheme prefix cannot yet state the exact p-adic reduction comparisons are imported interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For A/K over a p-adic local field, good reduction gives a crystalline V_p(A) and semistable reduction gives a semistable V_p(A), with the R06 convention for twists and the monodromy operator. These are requests to R06.6; this packet does not construct period rings or derive them from prime-to-residue étale torsion.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix
Required imports: AbelianSchemesAndArithmeticModuli:A1, PadicHodgeTheory:R06.6

OMITTED TauCeti.NeronBlueprint.ConductorImport
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import
The native Over/Scheme prefix cannot yet state the exact Artin and Swan conductor interface interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Define the conductor of A through the supplied actual H^1/Tate representation with its local monodromy, using R01.3 Artin and Swan conductors; keep tame codimension and wild Swan terms. This is a geometric comparison/export, not a second conductor definition.
Transitive gaps: none recorded for this node
Required imports: ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.SemistableConductorRank
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/semistable-conductor-rank
The native Over/Scheme prefix cannot yet state the exact Semistable conductor equals toric rank interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For semistable A over a local field and ell≠char(k), Swan=0 and the conductor exponent is t, its toric rank: 2g−dim(V_ell(A)^I)=2g−(t+2a)=t.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.LocalEulerPolynomial
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial
The native Over/Scheme prefix cannot yet state the exact Full-monodromy local Euler polynomial interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For finite residue field of size q, use H^1_et(A_Ksep,Q_ell) with geometric Frobenius F, and P_v(T)=det(1−T F | H^1^I). Under the actual Weil–Deligne comparison use ker N inside the appropriate Weil-invariant space. Inertia semisimplification alone loses N and does not determine this polynomial.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.EllipticLocalPolynomial
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/elliptic-local-polynomial
The native Over/Scheme prefix cannot yet state the exact Elliptic polynomial preserves the native definition interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a minimal Weierstrass model over a DVR with finite residue k, the native localPolynomial equals the Galois polynomial of local-euler-polynomial: good 1−aT+qT² with a=q+1−#E(k), split multiplicative 1−T, nonsplit multiplicative 1+T, additive 1. Preserve the existing localPolynomial declaration and the full characteristic-zero Galois realization.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

OMITTED TauCeti.NeronBlueprint.ResidualConductorComponents
Node: NeronModelsAndSemistableAbelianVarieties:R11.5/residual-conductor-components
The native Over/Scheme prefix cannot yet state the exact Residual conductor and dual components interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For semistable A over a local field of residue characteristic r and prime ell≠r with ell not dividing #Phi_Adual(k_sep), the residual A[ell] inertia invariants have dimension equal to the characteristic-zero invariants, hence residual and characteristic-zero conductor exponents agree. Perfect semistable component duality lets one use #Phi_A instead, but this is a theorem, not an assumed equality.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-residual-invariants
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.DegeneracyFunctoriality
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/degeneracy-functoriality
The native Over/Scheme prefix cannot yet state the exact Degeneracy maps and monodromy adjoints interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Given actual homomorphisms between semistable modular Jacobians supplied by the modular-curve owner, extend them to Néron models and export the contravariant character maps, covariant component maps, dual adjoints and their monodromy/component-pairing commutative diagrams. No level-lowering theorem or generic Néron exactness is assumed.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-modular-character-exactness
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0

OMITTED TauCeti.NeronBlueprint.CharacterExactSequences
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/character-exact-sequences
The native Over/Scheme prefix cannot yet state the exact Character exact sequences require verified kernels interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a supplied exact sequence of special-fibre tori 0→T1→T→T2→0, export 0→X*(T2)→X*(T)→X*(T1)→0 and its monodromy-induced component sequence with all lattice cokernels. To apply to modular degeneracy maps, first prove this torus sequence and its saturation; a generic exact abelian-variety sequence does not supply it.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-component-cokernel, NeronModelsAndSemistableAbelianVarieties/G-modular-character-exactness
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0

OMITTED TauCeti.NeronBlueprint.SemistableDifferentialBasechange
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/semistable-differential-basechange
The native Over/Scheme prefix cannot yet state the exact Semistable differential base change interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a semistable abelian variety over a Dedekind number-field base and a finite number-field extension, the pullback of its integral invariant-differential lattice identifies with the lattice of the new identity Néron model at all finite places, including ramified ones. This identity-model theorem, not full-model base change, underlies the stable Faltings-height export.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion
Required imports: AbelianSchemesAndArithmeticModuli:A1

OMITTED TauCeti.NeronBlueprint.IsogenyDifferentialExport
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/isogeny-differential-export
The native Over/Scheme prefix cannot yet state the exact Isogeny-height integral lattice export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: An isogeny A→B over a number field extends to a model homomorphism and induces an inclusion omega_B→omega_A of same-rank finite projective lattices, with a torsion cokernel at finite places in characteristic zero. Export its local length/determinant data to the height owner; do not assert a degree-only exact Néron sequence or replace a p-primary local correction by zero.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-NOS-monodromy-bridge, NeronModelsAndSemistableAbelianVarieties/G-isogeny-differentials
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.EquationGoodComparison
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/equation-good-comparison
The native Over/Scheme prefix cannot yet state the exact Equation versus abelian-scheme good reduction interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an elliptic curve over a DVR with a minimal integral Weierstrass model W, the native HasGoodReduction predicate (multiplicative valuation of Delta equals 1) is equivalent to smooth elliptic special fibre and an abelian-scheme model; scheme good reduction is independent of the chosen minimal W. Valuation value 1 means ordinal discriminant valuation zero.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

OMITTED TauCeti.NeronBlueprint.EquationMultiplicativeComparison
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/equation-multiplicative-comparison
The native Over/Scheme prefix cannot yet state the exact Equation versus toric elliptic reduction interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For minimal W, the native HasMultiplicativeReduction conditions (v(Delta)<1 and v(c4)=1) identify a nodal reduced cubic and a toric identity fibre. Splitness of the residual quadratic identifies split G_m versus its quadratic form, and the equation-level SplitMultiplicativeReduction is equivalent to that torus splitness.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.EquationDiscriminantComparison
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/equation-discriminant-comparison
The native Over/Scheme prefix cannot yet state the exact Minimal discriminant and regular-fibre geometry interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Preserve the imported minimal discriminant ordinal valuation and prove its relation to the resolved pointed regular model and geometric reduction type. For multiplicative I_n it is n. For the tame additive types use the table only when char(k)≠2,3; the wild valuations come from the imported full algorithm.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.EquationConductorComparison
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/equation-conductor-comparison
The native Over/Scheme prefix cannot yet state the exact Ogg exponent and full conductor comparison interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an elliptic minimal regular model with m geometric irreducible components, identify the imported Ogg exponent ord(Delta_min)+1−m with the Artin/Swan conductor of H^1. This equality includes the wild contributions via the actual minimal discriminant, not the tame additive value 2.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Ogg-geometry
Required imports: AbelianSchemesAndArithmeticModuli:A1, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.EquationComponentComparison
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/equation-component-comparison
The native Over/Scheme prefix cannot yet state the exact Tamagawa number uses rational components interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For complete R with finite residue k, the imported Tate-algorithm c_p equals #Phi_E(k), via E(K)/E0(K). The geometric component count m and #Phi_E(k_sep) are different invariants; descent determines the rational c_p.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.EquationMinimalDifferential
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/equation-minimal-differential
The native Over/Scheme prefix cannot yet state the exact Minimal differential equals Néron lattice basis interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an elliptic minimal integral Weierstrass equation over a DVR, the differential dx/(2y+a1 x+a3) with its alternate smooth chart expressions generates the local Néron invariant-differential lattice. Under a minimal coordinate change it transforms by the native unit factor; it is not a base logarithmic differential dq/q.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-spreading, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-relative-differentials, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-Weierstrass-scheme
Required imports: AbelianSchemesAndArithmeticModuli:A1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models

OMITTED TauCeti.NeronBlueprint.StrictCompatibleSystemExport
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/strict-compatible-system-export
The native Over/Scheme prefix cannot yet state the exact Abelian cohomology compatible-system export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For an abelian variety A/F over a number field and 0≤i≤2 dim A, its H^i_et(A_Fbar,Q_ell) form a Q-rational strictly compatible system pure of weight i with the source Weil–Deligne conventions. At i=1 H^1 is dual to the homological Tate module; for surfaces its GSp4 multiplier is epsilon_ell^(-1), not epsilon_ell.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-valuations, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Euler-comparison, NeronModelsAndSemistableAbelianVarieties/G-strict-compatibility
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, AdicSpacesPartII:F0, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.6, PadicHodgeTheory:R06.6

OMITTED TauCeti.NeronBlueprint.SemistableOrdinaryAdapter
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/semistable-ordinary-adapter
The native Over/Scheme prefix cannot yet state the exact Semistable ordinary reduction adapter interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For A/Q_p, semistable ordinary reduction means semistability plus ordinarity of the abelian quotient of M_k^0. The toric rank is unrestricted; a purely toric fibre has zero abelian quotient and satisfies this ordinary condition. The p-primary finite/toric filtration uses p-divisible groups, not the prime-to-residue fixed-point identification.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.OrdinaryIsotropicFiltration
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/ordinary-isotropic-filtration
The native Over/Scheme prefix cannot yet state the exact Ordinary surface isotropic filtration export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For a semistable ordinary principally polarized abelian surface B/Q2, construct a saturated rank-two G_Q2-stable isotropic submodule of T_2(B); its reduction is a stable Lagrangian in B[2]. For toric rank t=2 use T_t, not the rank-four whole T_2(B). For t=1 lift the rank-one ordinary connected part in T_f/T_t. For t=0 use the ordinary good-reduction connected part.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.OrdinaryResidualPointExport
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/ordinary-residual-point-export
The native Over/Scheme prefix cannot yet state the exact BCGP ordinary residual point export interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Under the same hypotheses and the source fixed S6≅GSp4(F2) convention, if the residual image lies in S5(b), it is a 2-group and B[2](Q2) contains a nonzero point. The S5(b) versus the other S5 embedding and the order-48 parabolic intersection are finite-group supplier inputs, not recreated here.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-ordinary-prefix, NeronModelsAndSemistableAbelianVarieties/G-residual-image
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.UnramifiedThreeTorsionAtTwo
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/unramified-three-torsion-at-two
The native Over/Scheme prefix cannot yet state the exact Unramified three-torsion at two gives semistability interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: If A/Q2 has unramified residual A[3] (equivalently the source dual rho_A,3), then A has semistable reduction, but it need not have good reduction.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-level-kernel
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6

OMITTED TauCeti.NeronBlueprint.YuanFullLevelExtension
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/yuan-full-level-extension
The native Over/Scheme prefix cannot yet state the exact Full level extension for curve semistability interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: For the function-field setting of Yuan Lemma 4.9, choose N≥3 prime to char(K), J=Jac(C), and Kprime=K(J[N]). The full torsion extension gives semistable J at the relevant valuations; the source-qualified curve/Jacobian criterion gives semistable C. The Galois group injects into GSp_2g(Z/N), giving the rough degree bound [Kprime:K]<N^(4g²). No non-isotrivial height lower bound is proved here.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-finite-torsion, NeronModelsAndSemistableAbelianVarieties/G-pdiv-orthogonality, NeronModelsAndSemistableAbelianVarieties/G-monodromy-converse, NeronModelsAndSemistableAbelianVarieties/G-level-kernel, NeronModelsAndSemistableAbelianVarieties/G-Yuan-valuation-scope
Required imports: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction

OMITTED TauCeti.NeronBlueprint.AcceptanceExamples
Node: NeronModelsAndSemistableAbelianVarieties:R11.6/acceptance-examples
The native Over/Scheme prefix cannot yet state the exact Good, split, nonsplit and nodal acceptance suite interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Compute the good elliptic model as an abelian scheme with zero Phi; split multiplicative I_n as nonproper Néron identity G_m with geometric Phi=Z/n; nonsplit multiplicative as a nonsplit torus with Frobenius −1 on components; and a nodal curve with more than one component via its normalization sequence and cycle lattice. Check a rational tree versus a two-edge cycle and ramified n→en.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-existence, NeronModelsAndSemistableAbelianVarieties/G-Weil-extension, NeronModelsAndSemistableAbelianVarieties/G-components, NeronModelsAndSemistableAbelianVarieties/G-Chevalley, NeronModelsAndSemistableAbelianVarieties/G-Lang-lifting, NeronModelsAndSemistableAbelianVarieties/G-Kodaira-resolution, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-prefix, NeronModelsAndSemistableAbelianVarieties/G-semiabelian-open-immersion, NeronModelsAndSemistableAbelianVarieties/G-Raynaud-algebraization, NeronModelsAndSemistableAbelianVarieties/G-polarized-effectivity, NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-integral-pairing, NeronModelsAndSemistableAbelianVarieties/G-thickness-resolution
Required imports: AbelianSchemesAndArithmeticModuli:A1, AdicSpacesPartII:F0, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs, tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces, tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models, tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion

OMITTED TauCeti.NeronBlueprint.BgwOddFactorTorsors
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-odd-factor-torsors
The native Over/Scheme prefix cannot yet state the exact BGW odd-factor torsors interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: Let d be the degree-two hyperelliptic line-bundle class and write Pic(C)/Z d=J disjoint union J^1, and similarly for C_m. The kernel of multiplication by two on the degree-one component is W[2], a J[2]-torsor; for C_m it is W_m[2], a J_m[2]-torsor. W_m[2](K) corresponds to odd factors of f over K, whereas W[2](K) corresponds to odd unordered factorizations, including factors conjugate over a quadratic extension.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors, NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard
Required imports: AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs

OMITTED TauCeti.NeronBlueprint.BgwBoundaryCupProduct
Node: NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-boundary-cup-product
The native Over/Scheme prefix cannot yet state the exact BGW two-torsion connecting class interface: its geometric/group/representation carriers and comparisons require the listed transitive imports and unresolved proof inputs. No raw proposition field substitutes for them.
Mathematics: The exact sequence 0→mu_2→J_m[2]→J[2]→0 has connecting map H^1(K,J[2])→H^2(K,mu_2) equal, under the Weil self-duality, to cup product with the class of W[2]. The kernel is the image of H^1(K,J_m[2]); do not equate the connecting class with a rational divisor representative without the Brauer obstruction.
Transitive gaps: NeronModelsAndSemistableAbelianVarieties/G-Picard-Raynaud, NeronModelsAndSemistableAbelianVarieties/G-normalization-cohomology, NeronModelsAndSemistableAbelianVarieties/G-BGW-divisors, NeronModelsAndSemistableAbelianVarieties/G-Brauer-Picard, NeronModelsAndSemistableAbelianVarieties/G-BGW-cup-product
Required imports: AbelianSchemesAndArithmeticModuli:A3, ArithmeticGaloisRepresentations:R01.6, NeronModelsAndSemistableAbelianVarietiesPartII:G.0/global-existence, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs
-/

#print axioms TauCeti.NeronBlueprint.NeronMappingProperty
#print axioms TauCeti.NeronBlueprint.NeronModel
#print axioms TauCeti.NeronBlueprint.NeronModel.extend
#print axioms TauCeti.NeronBlueprint.NeronModel.unique_iso
