import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.AlgebraicGeometry.Sites.EtalePoint
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.Sites.Proetale
import Mathlib.AlgebraicGeometry.Sites.ElladicCohomology
import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
import Mathlib.CategoryTheory.Sites.MayerVietorisSquare
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.CategoryTheory.Sites.SheafCohomology.Cech
import Mathlib.CategoryTheory.Sites.SheafCohomology.MayerVietoris
import Mathlib.CategoryTheory.Sites.PrecoverageToGrothendieck
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.HasExt
import Mathlib.CategoryTheory.Sites.ConstantSheaf
import Mathlib.Algebra.BrauerGroup.Defs
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.RingTheory.Algebraic.Basic
import Mathlib.Topology.Sheaves.Flasque
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.NoetherianSpace
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.CategoryTheory.Abelian.RightDerived
import Mathlib.Algebra.Azumaya.Defs
import Mathlib.RingTheory.Etale.Basic
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import TauCeti.AlgebraicGeometry.Cohomology.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.RightDerivedFunctorPlus
import Mathlib.Algebra.Homology.SpectralSequence.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.Algebra.BrauerGroup.Group

/-
This file is not the roadmap and is not exhaustive. The packet records the intended statements; the reader document
(research/blueprint/readmes/SchemeAndStackFoundations--SF.2.md) requires the review corrections.
These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry` and no implementation is claimed.
The independent review requires changes: omitted signatures and tests are explicitly inventoried
in REV-SchemeAndStackFoundations--SF.2.md. Names in comments are not elaborated declarations.
-/

open CategoryTheory CategoryTheory.Limits

universe u u₁ u₂

/-! ## SF.2a: sheaf cohomology on sites -/

namespace TauCeti.SchemeFoundations.SiteCohomology

open _root_.CategoryTheory _root_.AlgebraicGeometry

section Pullback

variable {C : Type u₁} [Category.{u} C] {D : Type u₂} [Category.{u} D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}
  [HasSheafify J AddCommGrpCat.{u}] [HasSheafify K AddCommGrpCat.{u}]
  [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] [HasExt.{u} (Sheaf K AddCommGrpCat.{u})]

-- node: SchemeAndStackFoundations:SF.2/site-cohomology-pullback
/-- The free constant abelian sheaf used as the first argument of `Sheaf.H`. -/
noncomputable abbrev constantZ (J : GrothendieckTopology C)
    [HasSheafify J AddCommGrpCat.{u}] : Sheaf J AddCommGrpCat.{u} :=
  (constantSheaf J AddCommGrpCat.{u}).obj (AddCommGrpCat.of (ULift.{u} ℤ))

/-- Cohomological pullback through an exact additive functor, with the indispensable
constant-source comparison. A genuine inverse-image functor supplies a canonical comparison.
For cohomology over an object apply this signature to the slice sites, rather than identify
global `H` with objectwise `H'`. -/
noncomputable def Sheaf.H.pullback (pb : Sheaf K AddCommGrpCat.{u} ⥤ Sheaf J AddCommGrpCat.{u})
    [pb.Additive] [Limits.PreservesFiniteLimits pb] [Limits.PreservesFiniteColimits pb]
    (comparison : constantZ J ⟶ pb.obj (constantZ K))
    (G : Sheaf K AddCommGrpCat.{u}) (n : ℕ) : G.H n →+ (pb.obj G).H n :=
  sorry

theorem Sheaf.H.pullback_naturality
    (pb : Sheaf K AddCommGrpCat.{u} ⥤ Sheaf J AddCommGrpCat.{u})
    [pb.Additive] [Limits.PreservesFiniteLimits pb] [Limits.PreservesFiniteColimits pb]
    (comparison : constantZ J ⟶ pb.obj (constantZ K))
    {G G' : Sheaf K AddCommGrpCat.{u}} (φ : G ⟶ G') (n : ℕ) (x : G.H n) :
    Sheaf.H.map (pb.map φ) n (Sheaf.H.pullback pb comparison G n x) =
      Sheaf.H.pullback pb comparison G' n (Sheaf.H.map φ n x) :=
  sorry

theorem Sheaf.H.pullback_id (G : Sheaf K AddCommGrpCat.{u}) (n : ℕ) :
    Sheaf.H.pullback (𝟭 _) (𝟙 _) G n = AddMonoidHom.id _ :=
  sorry

/- Missing signatures: pullback_zero with a terminal-object identification; pullback_comp with
the composed constant-source comparison; pullback_δ with the long exact sequence. The two
geometric tests below still need actual site morphisms and coefficient sheaves. -/

-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_id_etale
example (X : Scheme.{u}) (G : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}) :
    Sheaf.H.pullback (𝟭 (Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u})) (𝟙 _) G 2 =
      AddMonoidHom.id (G.H 2) := sorry
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_zero_restriction
/- Missing example: for an open immersion, degree-zero pullback on O_X is restriction. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_not_iso
/- Missing example: H¹(Spec ℝ, ℤ/2) → H¹(Spec ℂ, ℤ/2) is not injective. -/

end Pullback

section DirectImage

variable {C : Type u} [Category.{u} C] {D : Type u} [Category.{u} D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}
  [HasSheafify J AddCommGrpCat.{u}] [HasSheafify K AddCommGrpCat.{u}]
  [IsGrothendieckAbelian.{u} (Sheaf J AddCommGrpCat.{u})]

-- node: SchemeAndStackFoundations:SF.2/site-derived-pushforward
/-- `R^i f_*` as the right derived functors of the sheaf pushforward `pf`. -/
noncomputable def Sheaf.higherDirectImage
    (pf : Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u}) [pf.Additive] (i : ℕ) :
    Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u} :=
  pf.rightDerived i

/-- The existing bounded-below total right derived functor, specialized to sheaf pushforward.
The total/degreewise comparison and sheaf-specific composition API remain packet inputs. -/
noncomputable def Sheaf.derivedPushforward
    [HasDerivedCategory (Sheaf J AddCommGrpCat.{u})]
    [HasDerivedCategory (Sheaf K AddCommGrpCat.{u})]
    (pf : Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u}) [pf.Additive] :
    DerivedCategory.Plus (Sheaf J AddCommGrpCat.{u}) ⥤
      DerivedCategory.Plus (Sheaf K AddCommGrpCat.{u}) :=
  pf.rightDerivedFunctorPlus

theorem Sheaf.higherDirectImage_zero
    (pf : Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u}) [pf.Additive]
    [Limits.PreservesFiniteLimits pf] :
    Nonempty (Sheaf.higherDirectImage pf 0 ≅ pf) :=
  sorry

/- `Sheaf.higherDirectImage_iso_sheafify`,
`Sheaf.higherDirectImage_δ`, `Sheaf.derivedPushforward_comp` are packet statements. -/

-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_id
example (F : Sheaf J AddCommGrpCat.{u}) :
    Limits.IsZero ((Sheaf.higherDirectImage (𝟭 (Sheaf J AddCommGrpCat.{u})) 1).obj F) := sorry
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_zero_eq
/- `R^0 f_* F ≅` Mathlib's `sheafPushforwardContinuous` applied to `F`. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_sepClosed_base
/- Over `Spec k`, `k` separably closed, global sections of `R^i f_* F` are `H^i(X_et, F)`. -/

end DirectImage

-- node: SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence
-- node: SchemeAndStackFoundations:SF.2/cech-to-cohomology
-- node: SchemeAndStackFoundations:SF.2/abelian-torsor-h1
-- node: SchemeAndStackFoundations:SF.2/slice-site-cohomology
/- Spectral-sequence and torsor statements are in the packet. Reuse Mathlib's SpectralSequence
and first-quadrant E₂CohomologicalSpectralSequenceNat carriers. The sheaf-specific constructions,
abutment filtrations, convergence and edge maps still need signatures; the torsor carrier is
also missing at the pins. -/

section Nonabelian

variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)

-- node: SchemeAndStackFoundations:SF.2/nonabelian-torsor-h1
/-- Isomorphism classes of torsors under a sheaf of groups, pointed by the trivial torsor. -/
noncomputable def NonabelianH1 (G : Sheaf J GrpCat.{u}) : Type (u + 1) := sorry

noncomputable instance (G : Sheaf J GrpCat.{u}) : One (NonabelianH1 J G) := sorry

noncomputable def NonabelianH1.map {G G' : Sheaf J GrpCat.{u}} (φ : G ⟶ G') :
    NonabelianH1 J G → NonabelianH1 J G' :=
  sorry

theorem NonabelianH1.map_one {G G' : Sheaf J GrpCat.{u}} (φ : G ⟶ G') :
    NonabelianH1.map J φ 1 = 1 :=
  sorry

/- `NonabelianH1.mk`, `mk_eq_one_iff`, `pullback`, `connecting`, `exact_sequence`, `equivSheafH`
are packet API items whose statements need a sheaf-torsor carrier. -/

-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_trivial_group
/- For the trivial sheaf of groups the pointed set is a point. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_abelian_agrees
/- For `ℤ/2` on `Spec ℝ`, two elements, matching `Sheaf.H (ℤ/2) 1 ≅ ℤ/2`. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_gl_n_local
/- For a local ring and `GL_n` on the Zariski site, a point. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_not_group
/- For `S_3` on `Spec K`, no natural group law. -/

-- node: SchemeAndStackFoundations:SF.2/gerbe-h2-class
/- Missing declarations: `CentralExtension.boundary`, `boundary_one`, `exact_boundary`,
`boundary_pullback`, `boundary_cech` and `Gerbe.class`. The removed prototype took only A and Q;
a genuine boundary must also take the middle sheaf B, both maps, sheaf exactness and centrality.
The generic banded-gerbe/derived-H² comparison remains a source gap (Tag 0CJZ is narrower).
The packet gives the intended statements and tests, which are not elaborated here. -/

end Nonabelian

-- node: SchemeAndStackFoundations:SF.2/godement-resolution
section Godement

variable {X : TopCat.{u}}

/-- The Godement resolution of an abelian sheaf on a space, as a cochain complex of sheaves. -/
noncomputable def godementResolution (F : TopCat.Sheaf AddCommGrpCat.{u} X) :
    CochainComplex (TopCat.Sheaf AddCommGrpCat.{u} X) ℕ :=
  sorry

theorem godementResolution_isFlasque (F : TopCat.Sheaf AddCommGrpCat.{u} X) (n : ℕ) :
    ((godementResolution F).X n).IsFlasque :=
  sorry

/- `godementResolution_quasiIso`, `godementResolution_exact`, `godementResolution_restrict` and
`sheafH_iso_godement` are packet API items. -/

-- test: TauCeti.SchemeFoundations.SiteCohomology.test_godement_point
-- test: TauCeti.SchemeFoundations.SiteCohomology.test_godement_skyscraper
-- test: TauCeti.SchemeFoundations.SiteCohomology.test_godement_not_injective
/- Point, Sierpiński-space and non-injectivity tests (packet statements). -/

end Godement

-- node: SchemeAndStackFoundations:SF.2/flasque-cech-vanishing
-- node: SchemeAndStackFoundations:SF.2/noetherian-space-vanishing
/-- Grothendieck vanishing on Noetherian spaces. -/
theorem noetherianSpace_vanishing {X : TopCat.{u}} [TopologicalSpace.NoetherianSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ d) (F : TopCat.Sheaf AddCommGrpCat.{u} X) (p : ℕ) (hp : d < p) :
    Subsingleton (Sheaf.H.{u} F p) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits
/- Commutation of cohomology with filtered colimits (packet statement). -/

end TauCeti.SchemeFoundations.SiteCohomology

/-! ## SF.2b: quasi-coherent cohomology and supports -/

namespace TauCeti.SchemeFoundations.QCoh

open _root_.CategoryTheory _root_.AlgebraicGeometry

/-- Reuse the actual pinned Tau Ceti cohomology carrier. -/
noncomputable abbrev cohomology {X : Scheme.{u}} (M : X.Modules) (n : ℕ) : Type u :=
  TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology M n

-- node: SchemeAndStackFoundations:SF.2/qcoh-higher-direct-images
/-- Over an affine base, cohomology of quasi-coherent modules along a qcqs morphism vanishes in a
uniform range (the global form of quasi-coherence of `R^p f_*` with its vanishing bound). -/
theorem higherDirectImage_vanishing {X S : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f]
    [QuasiSeparated f] [IsAffine S] :
    ∃ N : ℕ, ∀ (F : X.Modules) [F.IsQuasicoherent] (p : ℕ), N ≤ p →
      Subsingleton (cohomology F p) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/projective-space-cohomology
-- node: SchemeAndStackFoundations:SF.2/ample-serre-vanishing
-- node: SchemeAndStackFoundations:SF.2/proper-fibre-dimension-vanishing
/- Packet statements; twisting sheaves `O(d)` on `Proj` and ampleness of invertible modules are not
packaged in Mathlib at the pins. -/

-- node: SchemeAndStackFoundations:SF.2/serre-affineness-criterion
theorem isAffine_of_H1_ideal_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent], Subsingleton (cohomology I 1)) : IsAffine X :=
  sorry

end TauCeti.SchemeFoundations.QCoh

namespace TauCeti.SchemeFoundations.Supports

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/sheaf-cohomology-with-supports
/-- Cohomology with supports in a closed subset `Z` of a scheme. -/
noncomputable def cohomologyWithSupport {X : Scheme.{u}} (Z : Set X) (hZ : IsClosed Z)
    (F : X.Modules) (q : ℕ) : Type u :=
  sorry

/-- Sections supported in `Z`. -/
noncomputable def sectionsWithSupport {X : Scheme.{u}} (Z : Set X) (F : X.Modules) : Type u :=
  sorry

/- `supportedSubsheaf`, `localCohomologySheaf`, `cohomologyWithSupport_zero`,
`cohomologyWithSupport_univ`, `rHZ_adjunction`, `localToGlobal`, `cohomologyWithSupport_pullback`
are packet API items. -/

-- test: TauCeti.SchemeFoundations.Supports.test_support_all
example {X : Scheme.{u}} (F : X.Modules) :
    Nonempty (cohomologyWithSupport (Set.univ : Set X) isClosed_univ F 1 ≃
      TauCeti.SchemeFoundations.QCoh.cohomology F 1) := sorry
-- test: TauCeti.SchemeFoundations.Supports.test_support_empty
example {X : Scheme.{u}} (F : X.Modules) (q : ℕ) :
    Subsingleton (cohomologyWithSupport (∅ : Set X) isClosed_empty F q) := sorry
-- test: TauCeti.SchemeFoundations.Supports.test_support_affine_line_origin
-- test: TauCeti.SchemeFoundations.Supports.test_support_not_restriction
/- Affine-line computations (packet statements). -/

-- node: SchemeAndStackFoundations:SF.2/supports-localization-triangle
-- node: SchemeAndStackFoundations:SF.2/local-cohomology-module-comparison
-- node: SchemeAndStackFoundations:SF.2/local-cohomology-flat-base-change
-- node: SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing
/- Packet statements, against Mathlib's `localCohomology` for modules on affines. -/

-- node: SchemeAndStackFoundations:SF.2/cousin-complex
/-- The Cousin complex of a filtration of a scheme by closed subsets. -/
noncomputable def cousinComplex {X : Scheme.{u}} (Z : ℕ → Set X)
    (hclosed : ∀ i, IsClosed (Z i)) (hzero : Z 0 = Set.univ)
    (hdecreasing : ∀ i, Z (i + 1) ⊆ Z i) (F : X.Modules) :
    CochainComplex X.Modules ℕ :=
  sorry

/- `relativeSupportCohomology`, `cousinComplex_d_comp_d`, `cousinComplex_isQuasicoherent`,
`relativeSupportCohomology_iso_pushforward`, `cousinComplex_trivial` are packet API items, and
`test_cousin_trivial_filtration`, `test_cousin_dvr`, `test_cousin_not_resolution` packet tests. -/

-- node: SchemeAndStackFoundations:SF.2/kempf-cousin-resolution
/- Packet statement (maximal Cohen–Macaulay sheaves have no carrier at the pins). -/

end TauCeti.SchemeFoundations.Supports

/-! ## SF.2c (Nisnevich): Nisnevich coverings, topology, distinguished squares -/

namespace TauCeti.SchemeFoundations.Nisnevich

open _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/nisnevich-covering
/-- A family of étale morphisms is a Nisnevich covering if every point of the target has a preimage
with trivial residue field extension. -/
def IsNisnevichCovering {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}} (f : ∀ i, X i ⟶ S) :
    Prop :=
  (∀ i, Etale (f i)) ∧ ∀ s : S, ∃ i, ∃ x : X i, f i x = s ∧
    Function.Bijective (Scheme.Hom.residueFieldMap (f i) x).hom

/-- The Nisnevich precoverage on schemes. -/
def nisnevichPrecoverage : Precoverage Scheme.{u} where
  coverings S := {R | ∃ (ι : Type u) (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S),
    R = Presieve.ofArrows X f ∧ IsNisnevichCovering f}

theorem isNisnevichCovering_of_zariski : Scheme.zariskiPrecoverage.{u} ≤ nisnevichPrecoverage :=
  sorry

theorem nisnevichPrecoverage_le_etale : nisnevichPrecoverage.{u} ≤ Scheme.etalePrecoverage :=
  sorry

theorem IsNisnevichCovering.pullback {S T : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}}
    {f : ∀ i, X i ⟶ S} (hf : IsNisnevichCovering f) (g : T ⟶ S) :
    IsNisnevichCovering (fun i ↦ Limits.pullback.snd (f i) g) :=
  sorry

theorem IsNisnevichCovering.comp {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}}
    {f : ∀ i, X i ⟶ S} (hf : IsNisnevichCovering f) {κ : ι → Type u}
    {Y : ∀ i, κ i → Scheme.{u}} {g : ∀ i (k : κ i), Y i k ⟶ X i}
    (hg : ∀ i, IsNisnevichCovering (g i)) :
    IsNisnevichCovering (fun p : Σ i, κ i ↦ g p.1 p.2 ≫ f p.1) :=
  sorry

/- `isNisnevichCovering_iff_henselization` (characterisation, finite families over a Noetherian
base): the base change of the family to every `Spec O^h_{X,x}` has a section. Its statement needs
the henselization carrier `SchemeAndStackFoundations:key/henselization`, which is not a declaration
at the pinned commits; owner: that key node. -/

-- test: TauCeti.SchemeFoundations.Nisnevich.test_covering_identity
example (X : Scheme.{u}) : IsNisnevichCovering (fun _ : PUnit.{u+1} ↦ 𝟙 X) := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_not_covering_real_complex
/- Stated for every quadratic extension `K/k` (for instance `ℂ/ℝ`): the single étale map
`Spec K → Spec k` is not a Nisnevich covering. -/
example (k K : Type u) [Field k] [Field K] [Algebra k K] (h : Module.finrank k K = 2) :
    ¬ IsNisnevichCovering
      (fun _ : PUnit.{u+1} ↦ Spec.map (CommRingCat.ofHom (algebraMap k K))) := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_covering_quadratic_split
/- The family `{Spec ℤ[1/10] → Spec ℤ[1/2], Spec ℤ[1/2][x]/(x²+1) → Spec ℤ[1/2]}` is a Nisnevich
covering (stated in the packet; the explicit rings make the Lean statement long and add nothing to
the signature). -/
-- test: TauCeti.SchemeFoundations.Nisnevich.test_zariski_is_nisnevich
example {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}} (f : ∀ i, X i ⟶ S)
    (h : Presieve.ofArrows X f ∈ Scheme.zariskiPrecoverage S) :
    Presieve.ofArrows X f ∈ nisnevichPrecoverage S := sorry

-- node: SchemeAndStackFoundations:SF.2/nisnevich-topology
/-- The Nisnevich topology on schemes. -/
def nisnevichTopology : GrothendieckTopology Scheme.{u} :=
  nisnevichPrecoverage.toGrothendieck

/-- The small Nisnevich site: étale `X`-schemes with Nisnevich coverings. -/
noncomputable def smallNisnevichTopology (X : Scheme.{u}) : GrothendieckTopology X.Etale :=
  sorry

theorem zariskiTopology_le_nisnevichTopology : Scheme.zariskiTopology.{u} ≤ nisnevichTopology :=
  sorry

theorem nisnevichTopology_le_etaleTopology : nisnevichTopology.{u} ≤ Scheme.etaleTopology :=
  sorry

theorem nisnevichTopology_subcanonical : nisnevichTopology.{u}.Subcanonical := sorry

theorem mem_nisnevichTopology_iff {X : Scheme.{u}} (R : Sieve X) :
    R ∈ nisnevichTopology X ↔ ∃ (ι : Type u) (Y : ι → Scheme.{u}) (f : ∀ i, Y i ⟶ X),
      IsNisnevichCovering f ∧ ∀ i, R.arrows (f i) :=
  sorry

theorem smallNisnevichTopology_le_smallEtale (X : Scheme.{u}) :
    smallNisnevichTopology X ≤ Scheme.smallEtaleTopology X :=
  sorry

/- `smallNisnevich_comparison`: the comparison morphisms `Sh(X_et) → Sh(X_Nis) → Sh(X_Zar)` are
`TauCeti.SchemeFoundations.Topologies.etaleToNisnevich` and `nisnevichToZariski` below. -/

-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_between
example : Scheme.zariskiTopology.{u} ≤ nisnevichTopology ∧
    nisnevichTopology.{u} ≤ Scheme.etaleTopology := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_not_etale
example (k K : Type u) [Field k] [Field K] [Algebra k K] (h : Module.finrank k K = 2) :
    ∃ R : Sieve (Spec (CommRingCat.of k)), R ∈ Scheme.etaleTopology _ ∧
      R ∉ nisnevichTopology _ := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_field_global_sections
/- For a field `k`, Nisnevich cohomology of every abelian sheaf on `(Spec k)_Nis` vanishes in
positive degrees; stated once cohomology on the small Nisnevich site is available (sheafification
instances for `smallNisnevichTopology`). -/
-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_representable_sheaf
example (Y : Scheme.{u}) : Presheaf.IsSheaf nisnevichTopology (yoneda.obj Y) := sorry

-- node: SchemeAndStackFoundations:SF.2/elementary-distinguished-square
/-- An elementary distinguished square: `X₂ → X₄` an open immersion, `X₃ → X₄` étale, the square
cartesian, and `X₃ → X₄` an isomorphism over the reduced complement of `X₂`. -/
structure ElementaryDistinguishedSquare (X : Scheme.{u}) extends Square Scheme.{u} where
  base : toSquare.X₄ = X
  isOpenImmersion : IsOpenImmersion toSquare.f₂₄
  etale : Etale toSquare.f₃₄
  isPullback : toSquare.IsPullback
  /-- `f₃₄` is injective with trivial residue extensions over the complement of the open image. -/
  iso_over_complement : ∀ x : toSquare.X₄, x ∉ Set.range toSquare.f₂₄ →
    ∃! y : toSquare.X₃, toSquare.f₃₄ y = x ∧
      Function.Bijective (Scheme.Hom.residueFieldMap toSquare.f₃₄ y).hom

namespace ElementaryDistinguishedSquare

variable {X : Scheme.{u}}

theorem isNisnevichCovering (S : ElementaryDistinguishedSquare X) :
    Sieve.ofTwoArrows S.toSquare.f₂₄ S.toSquare.f₃₄ ∈ nisnevichTopology S.toSquare.X₄ :=
  sorry

/-- The square attached to an open cover `X = U ∪ V`. -/
noncomputable def ofZariski (U V : X.Opens) (h : U ⊔ V = ⊤) :
    ElementaryDistinguishedSquare X :=
  sorry

noncomputable def pullback (S : ElementaryDistinguishedSquare X) {Y : Scheme.{u}} (g : Y ⟶ X) :
    ElementaryDistinguishedSquare Y :=
  sorry

theorem isPullback' (S : ElementaryDistinguishedSquare X) : S.toSquare.IsPullback :=
  S.isPullback

end ElementaryDistinguishedSquare

-- test: TauCeti.SchemeFoundations.Nisnevich.test_eds_zariski
example (X : Scheme.{u}) (U V : X.Opens) (h : U ⊔ V = ⊤) :
    IsOpenImmersion (ElementaryDistinguishedSquare.ofZariski U V h).toSquare.f₃₄ := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_eds_affine_line
/- `X = 𝔸¹_ℚ`, `U = 𝔸¹ ∖ {0}`, `V = 𝔸¹ ∖ {−1, −2}` with `s ↦ s² + 2s` is an elementary
distinguished square (statement in the packet). -/
-- test: TauCeti.SchemeFoundations.Nisnevich.test_eds_not_distinguished
/- `(∅ ⊂ Spec ℝ, Spec ℂ → Spec ℝ)` is not an elementary distinguished square: the fibre over the
closed point has residue field `ℂ ≠ ℝ` (statement in the packet). -/

-- node: SchemeAndStackFoundations:SF.2/distinguished-square-mayer-vietoris
theorem ElementaryDistinguishedSquare.exists_mayerVietorisSquare {X : Scheme.{u}}
    [HasWeakSheafify nisnevichTopology.{u} (Type u)]
    (S : ElementaryDistinguishedSquare X) :
    ∃ M : nisnevichTopology.{u}.MayerVietorisSquare, M.toSquare = S.toSquare :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/nisnevich-sheaf-criterion
/- Missing declaration: isSheaf_iff_distinguishedSquares on the actual small Nisnevich site
or on finite-type schemes over a fixed finite-dimensional Noetherian base S. The removed
prototype quantified over all Scheme and assumed every scheme was Noetherian; that inconsistent
hypothesis made the theorem vacuous. Define the restricted category and its topology first. -/

/- SchemeAndStackFoundations:SF.2/nisnevich-points-henselization,
   SF.2/nisnevich-cohomological-dimension, SF.2/nisnevich-cech-comparison and
   SF.2/brown-gersten-vanishing are stated in the packet; their Lean statements need the small
   Nisnevich site's sheafification and Ext instances and the henselization carrier, neither of
   which exists at the pinned commits. -/

end TauCeti.SchemeFoundations.Nisnevich

/-! ## SF.2c: topologies of a scheme and coefficient sheaves -/

namespace TauCeti.SchemeFoundations.Topologies

open _root_.AlgebraicGeometry Opposite

-- node: SchemeAndStackFoundations:SF.2/big-site-quasi-coherent-sheaf
/-- The big-site sheaf `F^a`, `(T → S) ↦ Γ(T, h^*F)`, of a quasi-coherent module, on the fpqc
topology (hence on every coarser one). -/
noncomputable def bigSheaf {S : Scheme.{u}} (F : S.Modules) [F.IsQuasicoherent] :
    Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry

/- `bigSheaf_obj`: sections over `(T, h)` are `Γ(T, h^*F)`;
   `bigSheaf_isSheaf`: `F^a` is a sheaf for the Zariski, étale, fppf and fpqc topologies;
   `bigSheaf_rightExact`: right exactness on the big site;
   `bigSheaf_exact_on_flat`: exactness only after restricting to flat S-objects;
   `bigSheaf_pullback`: compatibility with pullback along `S' → S`;
   `bigSheaf_structureSheaf`: `(O_S)^a` is the structure sheaf `G_a`;
   `bigSheaf_fullyFaithful`: `F ↦ F^a` is fully faithful on quasi-coherent modules.
   These need the global-sections functor of `Scheme.Modules` and an `Over`-site restriction API;
   the carrier above fixes the type. -/

-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zero
/- `F = 0` gives the zero sheaf (needs a quasi-coherence instance for the zero module). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_spec_field
/- For `S = Spec k`, `F = O_S`, sections over `Spec L` are `L` (statement in the packet). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zariski_restriction
/- Restriction of `F^a` to the small Zariski site recovers `F` (statement in the packet). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_not_topological_pullback
/- Sections of `O^a` over `Spec ℚ(i)` are `ℚ(i)`, not `ℚ` (statement in the packet). -/

-- node: SchemeAndStackFoundations:SF.2/multiplicative-additive-group-sheaves
/-- `G_a` on the big fpqc site over `S`. -/
noncomputable def Ga (S : Scheme.{u}) : Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry
/-- `G_m` on the big fpqc site over `S`. -/
noncomputable def Gm (S : Scheme.{u}) : Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry
/-- `μ_n ⊆ G_m`, for every `n ≥ 1`. -/
noncomputable def mu (S : Scheme.{u}) (n : ℕ) :
    Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry
/-- `G_m` restricted to the small étale site. -/
noncomputable def GmEtale (X : Scheme.{u}) : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry
/-- `μ_n` restricted to the small étale site. -/
noncomputable def muEtale (X : Scheme.{u}) (n : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry

theorem Gm_obj {S T : Scheme.{u}} (h : T ⟶ S) :
    Nonempty (((Gm S).obj.obj (op (Over.mk h)) : Type u) ≃+ Additive (Γ(T, ⊤))ˣ) :=
  sorry

noncomputable def powHom (S : Scheme.{u}) (n : ℕ) : Gm S ⟶ Gm S := sorry

theorem mu_eq_ker_pow (S : Scheme.{u}) (n : ℕ) : Nonempty (mu S n ≅ kernel (powHom S n)) :=
  sorry

/- `Gm_restrict_small`: the restriction of `Gm S` to the small étale site is `GmEtale S`;
   `mu_eq_cpc`: for `n` invertible on `S`, `muEtale S n` is the roots-of-unity sheaf of
   CohomologicalPointCounting ConstructibleEtale Layer 6 (not a declaration at the pins). -/

-- test: TauCeti.SchemeFoundations.Topologies.test_mu_one
example (S : Scheme.{u}) : Limits.IsZero (mu S 1) := sorry
-- test: TauCeti.SchemeFoundations.Topologies.test_Gm_field
example (h : Spec (CommRingCat.of ℚ) ⟶ Spec (CommRingCat.of ℚ)) :
    Nonempty (((Gm (Spec (CommRingCat.of ℚ))).obj.obj (op (Over.mk h)) : Type) ≃+
      Additive ℚˣ) := sorry
-- test: TauCeti.SchemeFoundations.Topologies.test_mu_p_not_etale_trivial
/- Over `Spec 𝔽_p`, `μ_p` has trivial sections on reduced schemes and nonzero sections on
`Spec 𝔽_p[ε]/(ε^p)` (statement in the packet). -/

-- node: SchemeAndStackFoundations:SF.2/topology-comparison-morphisms
/-- Inverse image along the big-fppf-to-small-étale comparison `a_X`. -/
noncomputable def aXInverse (X : Scheme.{u}) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.fpqcTopology.over X) AddCommGrpCat.{u} :=
  sorry
/-- The comparison `Sh(X_et) → Sh(X_Nis)` (inverse image direction: Nisnevich to étale). -/
noncomputable def etaleToNisnevich (X : Scheme.{u}) :
    Sheaf (Nisnevich.smallNisnevichTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry
/-- The comparison `Sh(X_Nis) → Sh(X_Zar)` (inverse image direction: Zariski to Nisnevich). -/
noncomputable def nisnevichToZariski (X : Scheme.{u}) :
    Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Nisnevich.smallNisnevichTopology X) AddCommGrpCat.{u} :=
  sorry
/-- The big fppf to big étale comparison (inverse image direction). -/
noncomputable def epsilonFppfEtale (X : Scheme.{u}) :
    Sheaf (Scheme.etaleTopology.over X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.fppfTopology.over X) AddCommGrpCat.{u} :=
  sorry

/- `aX` (the morphism of topoi), `comparison_comp`, `comparison_baseChange` and `aX_inverseImage_obj`
   are stated in the packet; the inverse-image functors above are their carriers. -/

-- test: TauCeti.SchemeFoundations.Topologies.test_comparison_id
/- The étale-to-étale comparison is the identity of `Sh(X_et)` (statement in the packet). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_aX_constant
/- `a_X^{-1}` of the constant étale sheaf `ℤ/2` is the constant fppf sheaf `ℤ/2`. -/
-- test: TauCeti.SchemeFoundations.Topologies.test_zariski_not_etale
/- `H^1_Zar(Spec ℝ, μ_2) = 0` but `H^1_et(Spec ℝ, μ_2) ≅ ℤ/2`. -/

-- node: SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison
/-- Zariski cohomology of a quasi-coherent module (Tau Ceti's `Scheme.Modules.Cohomology`, which is
exactly this Mathlib expression) agrees with its étale cohomology. -/
noncomputable def etaleSheafOfModule {X : Scheme.{u}} (F : X.Modules) [F.IsQuasicoherent] :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry

theorem quasiCoherent_etale_comparison (X : Scheme.{u}) (F : X.Modules) [F.IsQuasicoherent]
    (n : ℕ) :
    Nonempty (Sheaf.H.{u} ((SheafOfModules.toSheaf X.ringCatSheaf).obj F) n ≃+
      (etaleSheafOfModule F).H n) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/etale-pullback-fppf-comparison
/- `H^q(X_et, F) = H^q_fppf(X, a_X^{-1} F)`; big-site cohomology of `Scheme.{u}`-sites needs
sheafification instances in a higher universe, not available at the pins (packet statement). -/

-- node: SchemeAndStackFoundations:SF.2/smooth-group-fppf-etale-comparison
/- Grothendieck's comparison for smooth commutative quasi-projective group schemes (packet
statement); same universe obstruction as above. -/

end TauCeti.SchemeFoundations.Topologies

namespace TauCeti.SchemeFoundations.Etale

open _root_.AlgebraicGeometry Opposite TauCeti.SchemeFoundations.Topologies

-- node: SchemeAndStackFoundations:SF.2/hilbert-90
/-- Hilbert's Theorem 90: `H^1(X_et, G_m)` is the Picard group of isomorphism classes of line bundles
(Tau Ceti's `LineBundleClass`, a commutative monoid whose inverses JacobianChallenge Layer A adds). -/
theorem hilbert90 (X : Scheme.{u}) :
    Nonempty ((GmEtale X).H 1 ≃+ Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/fppf-kummer-sequence
theorem etale_kummer_h1 (X : Scheme.{u}) (n : ℕ) (hn : IsUnit ((n : ℤ) : Γ(X, ⊤))) :
    ∃ (f : Additive (Γ(X, ⊤))ˣ →+ (muEtale X n).H 1)
      (g : (muEtale X n).H 1 →+ Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)),
      Function.Exact f g ∧ (∀ v : (Γ(X, ⊤))ˣ, f (Additive.ofMul (v ^ n)) = 0) ∧
      ∀ L, n • L = 0 ↔ ∃ c, g c = L :=
  sorry
/- The fppf form for every `n` and the `H^2` sequence are stated in the packet (big-site
cohomology). -/

-- node: SchemeAndStackFoundations:SF.2/artin-schreier-sequence
/-- The constant étale sheaf with value `ℤ/p`. -/
noncomputable def constZMod (X : Scheme.{u}) (p : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  (constantSheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}).obj
    (AddCommGrpCat.of (ULift.{u} (ZMod p)))

theorem artinSchreier_vanishing (p : ℕ) [Fact p.Prime] (X : Scheme.{u}) [IsAffine X]
    [CharP Γ(X, ⊤) p] (q : ℕ) (hq : 2 ≤ q) :
    Subsingleton ((constZMod X p).H q) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/finite-pushforward-exact
/- `f_*` is exact on abelian étale sheaves for finite `f` and commutes with base change for integral
`f`; needs the pushforward of small étale sheaves along a morphism of schemes
(CohomologicalPointCounting EtaleBaseChange Layer 0 builds its site functor). -/

-- node: SchemeAndStackFoundations:SF.2/etale-galois-comparison
/-- Étale cohomology of `Spec K` is continuous Galois cohomology (statement shape: the stalk at the
separable closure as a discrete module; the carrier `galoisModule` is the stalk functor). -/
noncomputable def galoisModule (K : Type u) [Field K]
    (F : Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of K))) AddCommGrpCat.{u}) :
    Type u :=
  sorry
/- The comparison `F.H n ≃+ continuousCohomology n (galoisModule K F)` needs the topological
representation structure on the stalk (Mathlib `TopRep`), stated in the packet. -/

-- node: SchemeAndStackFoundations:SF.2/etale-cohomology-limits
-- node: SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering
-- node: SchemeAndStackFoundations:SF.2/gabber-affine-proper-base-change
-- node: SchemeAndStackFoundations:SF.2/proper-hypercover-descent
/- Statements in the packet; they need pullback along morphisms of small étale sites
(SF.2/site-cohomology-pullback) whose carrier is below. -/

-- node: SchemeAndStackFoundations:SF.2/tsen-theorem
/-- Tsen: for a curve over an algebraically closed field the field Brauer group of its function
field is trivial (field Brauer group as Tau Ceti's `BrauerGroup`). -/
theorem brauer_functionField_curve_trivial (k K : Type u) [Field k] [IsAlgClosed k] [Field K]
    [Algebra k K] (t : K) (ht : Transcendental k t)
    (halg : Algebra.IsAlgebraic (IntermediateField.adjoin k {t}) K)
    (x : BrauerGroup.{u, u} K) : x = 1 :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/curve-multiplicative-cohomology
-- node: SchemeAndStackFoundations:SF.2/curve-roots-of-unity-cohomology
theorem curve_Gm_vanishing (k : Type u) [Field k] [IsAlgClosed k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 f]
    [QuasiCompact f] [IsSeparated f] [IsIntegral X] (q : ℕ) (hq : 2 ≤ q) :
    Subsingleton ((GmEtale X).H q) :=
  sorry

end TauCeti.SchemeFoundations.Etale

/-! ## SF.2d: the pro-étale comparison -/

namespace TauCeti.SchemeFoundations.Proetale

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/proetale-etale-morphism
/-- Inverse image `ν^*` from étale sheaves to pro-étale sheaves (Mathlib's `Scheme.ProEt`). -/
noncomputable def nu (X : Scheme.{u}) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.ProEt.topology X) AddCommGrpCat.{u + 1} :=
  sorry

/- `nu_inverseImage_obj_affine`, `nu_directImage_obj`, `nu_unit_iso`, `nu_naturality` and
`nu_pushforward_comm` are packet API items: they need the inclusion `X.Etale ⥤ X.ProEt` and
presentations of affine weakly étale objects as limits, not yet in Mathlib at the pins
(cf. Mathlib pull request 41730). -/

-- test: TauCeti.SchemeFoundations.Proetale.test_nu_point
-- test: TauCeti.SchemeFoundations.Proetale.test_nu_constant_profinite
-- test: TauCeti.SchemeFoundations.Proetale.test_nu_not_essentially_surjective
/- Empty scheme, constant sheaf on a profinite set and `ellAdicSheaf` tests (packet statements). -/

-- node: SchemeAndStackFoundations:SF.2/proetale-classical-comparison
/-- Bhatt–Scholze: étale cohomology equals pro-étale cohomology of `ν^*F` for every abelian `F`. -/
theorem proetale_classical_comparison (X : Scheme.{u})
    (F : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}) (n : ℕ) :
    Nonempty (F.H n ≃+ ((nu X).obj F).H n) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/replete-topos
/-- A category of sheaves is replete if limits of towers of epimorphisms are epimorphisms onto
every stage. -/
def IsReplete (T : Type u₁) [Category.{u} T] : Prop :=
  ∀ (F : ℕᵒᵖ ⥤ T) (_ : ∀ n : ℕ, Epi (F.map (homOfLE (Nat.le_succ n)).op))
    (c : Limits.Cone F) (_ : Limits.IsLimit c) (m : ℕ), Epi (c.π.app (Opposite.op m))

theorem isReplete_proetale (X : Scheme.{u}) :
    IsReplete (Sheaf (Scheme.ProEt.topology X) (Type u)) :=
  sorry

/- `isReplete_of_locallyWeaklyContractible`, `IsReplete.lim_epi` (the definition unfolded) and
`IsReplete.derivedCategory_leftComplete` are packet API items. -/

-- test: TauCeti.SchemeFoundations.Proetale.test_isReplete_types
example : IsReplete (Type u) := sorry
-- test: TauCeti.SchemeFoundations.Proetale.test_isReplete_proetale_point
example (k : Type u) [Field k] [IsAlgClosed k] :
    IsReplete (Sheaf (Scheme.ProEt.topology (Spec (CommRingCat.of k))) (Type u)) := sorry
-- test: TauCeti.SchemeFoundations.Proetale.test_etale_not_replete
example : ¬ IsReplete (Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of ℚ))) (Type)) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/w-contractible-cover
-- node: SchemeAndStackFoundations:SF.2/proetale-left-completeness
-- node: SchemeAndStackFoundations:SF.2/proetale-lisse-sheaves
/- Packet statements; w-contractible rings and the left-completed derived categories have no
carriers at the pins. -/

end TauCeti.SchemeFoundations.Proetale

/-! ## SF.2e: coherent duality — carriers behind `key/coherent-duality` -/

namespace TauCeti.SchemeFoundations.Coherent

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category
/-- `D_QCoh(O_X)`: the derived category of `O_X`-modules restricted to complexes with
quasi-coherent cohomology (carrier; Mathlib's `DerivedCategory` of `X.Modules` once its universe
and `HasDerivedCategory` instance are fixed). -/
noncomputable def DQCoh (X : Scheme.{u}) : Type (u + 1) := sorry

noncomputable instance (X : Scheme.{u}) : Category.{u} (DQCoh X) := sorry

noncomputable instance (X : Scheme.{u}) : Limits.HasZeroObject (DQCoh X) := sorry

/-- For `X = Spec A`, `D(A) ≌ D_QCoh(O_X)` (carrier of `DQCoh.affineEquiv`, with `D(A)` the
derived category of `ModuleCat A`). -/
noncomputable def DQCoh.affineEquivFunctor (A : CommRingCat.{u})
    [HasDerivedCategory.{u} (ModuleCat.{u} A)] :
    DerivedCategory (ModuleCat.{u} A) ⥤ DQCoh (Spec A) :=
  sorry

/- `DQCoh.mem_iff`, `DQCoh.isTriangulated`, `DQCoh.hasCoproducts`, `DQCoh.affineEquiv`, `DCoh` and the
tests `test_DQCoh_structure_sheaf`, `test_DQCoh_affine_free`, `test_DQCoh_extension_by_zero_not_qc` are
packet items. -/

-- node: SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom
noncomputable def derivedTensor {X : Scheme.{u}} : DQCoh X ⥤ DQCoh X ⥤ DQCoh X := sorry
/-- Internal RHom lives in D(O_X) in general. Preservation of D_QCoh is a separate
pseudo-coherence/boundedness theorem, not a property of arbitrary arguments. -/
noncomputable def derivedHom {X : Scheme.{u}} [HasDerivedCategory.{u} X.Modules] :
    (DerivedCategory X.Modules)ᵒᵖ ⥤ DerivedCategory X.Modules ⥤ DerivedCategory X.Modules := sorry

-- node: SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh
noncomputable def derivedPullback {X Y : Scheme.{u}} (f : X ⟶ Y) : DQCoh Y ⥤ DQCoh X := sorry
noncomputable def totalDirectImage {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f]
    [QuasiSeparated f] : DQCoh X ⥤ DQCoh Y :=
  sorry
noncomputable def derivedPullback_totalDirectImage_adj {X Y : Scheme.{u}} (f : X ⟶ Y)
    [QuasiCompact f] [QuasiSeparated f] : derivedPullback f ⊣ totalDirectImage f :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/perfect-generator
-- node: SchemeAndStackFoundations:SF.2/tor-independent-base-change
/- Packet statements (perfect complexes and Tor independence have no carriers at the pins). -/

-- node: SchemeAndStackFoundations:SF.2/pushforward-right-adjoint
/-- The right adjoint `a_f` of `Rf_*` on `D_QCoh` for qcqs schemes. -/
noncomputable def pushforwardRightAdjoint {X Y : Scheme.{u}} (f : X ⟶ Y) [CompactSpace X] [QuasiSeparatedSpace X]
    [CompactSpace Y] [QuasiSeparatedSpace Y] [QuasiCompact f]
    [QuasiSeparated f] : DQCoh Y ⥤ DQCoh X :=
  sorry
noncomputable def pushforwardRightAdjoint_adj {X Y : Scheme.{u}} (f : X ⟶ Y) [CompactSpace X] [QuasiSeparatedSpace X]
    [CompactSpace Y] [QuasiSeparatedSpace Y] [QuasiCompact f]
    [QuasiSeparated f] : totalDirectImage f ⊣ pushforwardRightAdjoint f :=
  sorry
/-- The trace (counit) `Rf_* a_f K → K`. -/
noncomputable def trace {X Y : Scheme.{u}} (f : X ⟶ Y) [CompactSpace X] [QuasiSeparatedSpace X]
    [CompactSpace Y] [QuasiSeparatedSpace Y] [QuasiCompact f] [QuasiSeparated f] :
    pushforwardRightAdjoint f ⋙ totalDirectImage f ⟶ 𝟭 (DQCoh Y) :=
  (pushforwardRightAdjoint_adj f).counit

-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_id
example (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] :
    Nonempty (pushforwardRightAdjoint (𝟙 X) ≅ 𝟭 (DQCoh X)) := sorry
-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_closed_point
-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_not_upperShriek
/- Closed point of `𝔸¹` and non-proper affine line (packet statements). -/

-- node: SchemeAndStackFoundations:SF.2/upper-shriek-compactification-independence
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-etale
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-flat-base-change
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-smooth
-- node: SchemeAndStackFoundations:SF.2/lci-upper-shriek
/- Missing declarations: upperShriek, upperShriek_openImmersion, upperShriek_proper.
The removed prototypes were on all unbounded DQCoh, although the packet's compactification
construction is on D⁺_QCoh. First define the genuine bounded-below full subcategory and the
restrictions of derivedPullback/pushforwardRightAdjoint; then state those functor isomorphisms.
Do not identify the unbounded pushforward right adjoint of an open immersion with restriction. -/

-- node: SchemeAndStackFoundations:SF.2/relative-dualizing-complex
/-- A relative dualizing complex `(K, ξ)` for a flat finitely presented morphism (carrier). -/
noncomputable def RelativeDualizingComplex {X S : Scheme.{u}} (f : X ⟶ S) [Flat f]
    [LocallyOfFinitePresentation f] : Type (u + 1) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/relative-dualizing-module
/- Missing declaration: relativeDualizingModule, which must take flat Cohen–Macaulay
f of pure relative dimension d in the stated Noetherian finite-type setting and define
H^(−d)(f^!O_Y). The removed prototype took only flat locally finite-type f. -/

-- node: SchemeAndStackFoundations:SF.2/cm-serre-duality
-- node: SchemeAndStackFoundations:SF.2/curve-dualizing-comparison
-- node: SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality
/- Packet statements, stated with `upperShriek`, `relativeDualizingModule` and the derived
`Hom`. -/

end TauCeti.SchemeFoundations.Coherent

/-! ## SF.2f and SF.2g: Brauer groups and equivariant sheaves -/

namespace TauCeti.SchemeFoundations.Brauer

open _root_.CategoryTheory _root_.AlgebraicGeometry TauCeti.SchemeFoundations.Topologies

-- node: SchemeAndStackFoundations:SF.2/quasi-coherent-algebra-descent
-- node: SchemeAndStackFoundations:SF.2/azumaya-equivalent-conditions
/-- Over an affine scheme the Azumaya condition is Mathlib's `IsAzumaya` (the affine form of the
equivalent conditions). -/
theorem isAzumaya_iff_matrix_after_etale (R A : Type u) [CommRing R] [Ring A] [Algebra R A]
    [Module.Finite R A] [Module.Projective R A] :
    IsAzumaya R A ↔ ∃ (ι : Type u) (B : ι → Type u) (_ : ∀ i, CommRing (B i))
      (_ : ∀ i, Algebra R (B i)) (_ : ∀ i, Algebra.Etale R (B i)),
      (∀ p : PrimeSpectrum R, ∃ i, ∃ q : PrimeSpectrum (B i),
        q.asIdeal.comap (algebraMap R (B i)) = p.asIdeal) ∧
      ∀ i, ∃ n : ℕ, 0 < n ∧
        Nonempty (TensorProduct R (B i) A ≃ₐ[B i] Matrix (Fin n) (Fin n) (B i)) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/azumaya-trivialization-gerbe
/- Missing declarations: trivializationGerbe, trivializationGerbe_isGerbe, azumayaClass,
azumayaClass_eq_zero_iff, azumayaClass_tensor, azumayaClass_eq_delta, azumayaClass_pullback.
The removed azumayaClass(X)(A : Type) did not carry an algebra, its O_X-module structure,
multiplication, or the Azumaya hypothesis. State it against the planned sheaf-algebra carrier
and prove the general gerbe-class comparison before using it. The four packet tests are omitted. -/

-- node: SchemeAndStackFoundations:SF.2/brauer-regular-injectivity
-- node: SchemeAndStackFoundations:SF.2/brauer-field-comparison
-- node: SchemeAndStackFoundations:SF.2/brauer-kummer-sequence
-- node: SchemeAndStackFoundations:SF.2/brauer-henselian-local
-- node: SchemeAndStackFoundations:SF.2/brauer-hochschild-serre-sequence
/-- Brauer group of a henselian local ring with finite residue field: the field case. -/
theorem brauerGroup_finiteField_trivial (k : Type u) [Field k] [Finite k]
    (x : BrauerGroup.{u, u} k) : x = 1 :=
  sorry

end TauCeti.SchemeFoundations.Brauer

namespace TauCeti.SchemeFoundations.Equivariant

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/equivariant-module-category
/-- Semilinear `Γ`-equivariant `O_X`-modules for a discrete group acting on a scheme by
automorphisms (carrier). -/
noncomputable def EquivariantModules (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : Type (u + 1) :=
  sorry

noncomputable instance (X : Scheme.{u}) (Γ : Type u) [Group Γ] (act : Γ →* Aut X) :
    Category.{u} (EquivariantModules X Γ act) :=
  sorry

noncomputable instance (X : Scheme.{u}) (Γ : Type u) [Group Γ] (act : Γ →* Aut X) :
    Abelian (EquivariantModules X Γ act) :=
  sorry

noncomputable def EquivariantModules.forget (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : EquivariantModules X Γ act ⥤ X.Modules :=
  sorry

theorem EquivariantModules.isGrothendieckAbelian (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : IsGrothendieckAbelian.{u} (EquivariantModules X Γ act) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/equivariant-coinduction
noncomputable def EquivariantModules.coind (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : X.Modules ⥤ EquivariantModules X Γ act :=
  sorry
noncomputable def EquivariantModules.ind (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : X.Modules ⥤ EquivariantModules X Γ act :=
  sorry
noncomputable def EquivariantModules.forgetCoindAdj (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) :
    EquivariantModules.forget X Γ act ⊣ EquivariantModules.coind X Γ act :=
  sorry
noncomputable def EquivariantModules.indForgetAdj (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) :
    EquivariantModules.ind X Γ act ⊣ EquivariantModules.forget X Γ act :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/coinduced-sections-acyclic
-- node: SchemeAndStackFoundations:SF.2/equivariant-ext-spectral-sequence
/- Packet statements (group cohomology of the coinduced sections and the Ext spectral sequence). -/

end TauCeti.SchemeFoundations.Equivariant

/-! ## Omitted signatures and tests

The review report inventories every node's actual declarations and examples and the remaining
API/test omissions. Comment-only names are not a substitute for the declarations required by
PROTOCOL §13. The packet retains the exact intended statements and source locators.

New counterexamples to preserve when completing the signatures:
* On P⁰_Z, H⁰(O(−2)) = Z (the two-degree projective-space formula requires n ≥ 1).
* For Spec F₂ → Spec Z, the big-site image of the monomorphism ×2 on O becomes zero.
* On Spec k[t], the skyscraper k[t]/(t) at the i=1 stratum has nonzero relative-support H⁰.
The first two need the twisting/big-site carriers; the last needs relative support cohomology.
-/
