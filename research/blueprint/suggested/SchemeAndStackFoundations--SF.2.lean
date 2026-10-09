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
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.Algebra.BrauerGroup.Group

/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/SchemeAndStackFoundations--SF.2.md) is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry` and no implementation is claimed.
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
/-- Pullback on sheaf cohomology along a morphism of sites, given by its exact inverse-image
functor `pb` (for a continuous `u : D ⥤ C`, `pb` is Mathlib's `Functor.sheafPullback`). -/
noncomputable def Sheaf.H.pullback (pb : Sheaf K AddCommGrpCat.{u} ⥤ Sheaf J AddCommGrpCat.{u})
    [pb.Additive] [Limits.PreservesFiniteLimits pb] [Limits.PreservesFiniteColimits pb]
    (G : Sheaf K AddCommGrpCat.{u}) (n : ℕ) : G.H n →+ (pb.obj G).H n :=
  sorry

theorem Sheaf.H.pullback_naturality
    (pb : Sheaf K AddCommGrpCat.{u} ⥤ Sheaf J AddCommGrpCat.{u})
    [pb.Additive] [Limits.PreservesFiniteLimits pb] [Limits.PreservesFiniteColimits pb]
    {G G' : Sheaf K AddCommGrpCat.{u}} (φ : G ⟶ G') (n : ℕ) (x : G.H n) :
    Sheaf.H.map (pb.map φ) n (Sheaf.H.pullback pb G n x) =
      Sheaf.H.pullback pb G' n (Sheaf.H.map φ n x) :=
  sorry

theorem Sheaf.H.pullback_id (G : Sheaf K AddCommGrpCat.{u}) (n : ℕ) :
    Sheaf.H.pullback (𝟭 _) G n = AddMonoidHom.id _ :=
  sorry

/- `Sheaf.H.pullback_zero`: in degree 0, composed with `Sheaf.H.equiv₀`, the pullback is restriction
of sections; `Sheaf.H.pullback_comp`: pullback along a composite is the composite of pullbacks;
`Sheaf.H.pullback_δ`: compatibility with connecting homomorphisms (packet statements). -/

-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_id_etale
example (X : Scheme.{u}) (G : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}) :
    Sheaf.H.pullback (𝟭 (Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u})) G 2 =
      AddMonoidHom.id (G.H 2) := sorry
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_zero_restriction
/- For an open immersion `j : U → X`, pullback in degree 0 on `O_X` is restriction `O(X) → O(U)`. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_not_iso
/- `H^1(Spec ℝ, ℤ/2) ≅ ℤ/2 → H^1(Spec ℂ, ℤ/2) = 0` is not injective. -/

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

theorem Sheaf.higherDirectImage_zero
    (pf : Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u}) [pf.Additive]
    [Limits.PreservesFiniteLimits pf] :
    Nonempty (Sheaf.higherDirectImage pf 0 ≅ pf) :=
  sorry

/- `Sheaf.derivedPushforward` (the functor on `D^+`), `Sheaf.higherDirectImage_iso_sheafify`,
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
/- Spectral-sequence and torsor statements are in the packet; Mathlib has no spectral-sequence
carrier for sheaf cohomology and no sheaf-torsor carrier at the pins. -/

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
/-- The boundary `H^1(C, Q) → H^2(C, A)` of a central extension; `A` given as an abelian sheaf. -/
noncomputable def CentralExtension.boundary [HasSheafify J AddCommGrpCat.{u}]
    [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] (A : Sheaf J AddCommGrpCat.{u})
    (Q : Sheaf J GrpCat.{u}) : NonabelianH1 J Q → A.H 2 :=
  sorry

theorem CentralExtension.boundary_one [HasSheafify J AddCommGrpCat.{u}]
    [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] (A : Sheaf J AddCommGrpCat.{u})
    (Q : Sheaf J GrpCat.{u}) : CentralExtension.boundary J A Q 1 = 0 :=
  sorry

/- `CentralExtension.exact_boundary`, `boundary_pullback`, `boundary_cech` and `Gerbe.class` are
packet API items (they need the extension data and a gerbe carrier). The tests
`CentralExtension.test_split`, `test_matrix_algebra`, `test_abelian_connecting`,
`test_quaternion_real` are stated in the packet. -/

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

/-- Tau Ceti's `Scheme.Modules.Cohomology` (that module is not built in the shared environment;
this is its defining expression). -/
noncomputable abbrev cohomology {X : Scheme.{u}} (M : X.Modules) (n : ℕ) : Type u :=
  Sheaf.H.{u} ((SheafOfModules.toSheaf X.ringCatSheaf).obj M) n

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
noncomputable def cousinComplex {X : Scheme.{u}} (Z : ℕ → Set X) (F : X.Modules) :
    CochainComplex X.Modules ℕ :=
  sorry

/- `relativeSupportCohomology`, `cousinComplex_d_comp_d`, `cousinComplex_isQuasicoherent`,
`relativeSupportCohomology_eq_zero_of_affine`, `cousinComplex_trivial` are packet API items, and
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
/-- On Noetherian finite-dimensional schemes, a presheaf of sets is a Nisnevich sheaf iff it sends
the empty scheme to a point and every elementary distinguished square to a pullback. -/
theorem isSheaf_iff_distinguishedSquares (P : Scheme.{u}ᵒᵖ ⥤ Type u)
    (hnoeth : ∀ X : Scheme.{u}, IsNoetherian X) :
    Presheaf.IsSheaf nisnevichTopology P ↔
      (∀ X : Scheme.{u}, IsEmpty X → Nonempty (Unique (P.obj (Opposite.op X)))) ∧
      ∀ (X : Scheme.{u}) (S : ElementaryDistinguishedSquare X),
        (S.toSquare.op.map P).IsPullback :=
  sorry

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
   `bigSheaf_exact`: exactness on short exact sequences of quasi-coherent modules;
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
    (f : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 f] (q : ℕ) (hq : 2 ≤ q) :
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
noncomputable def DQCoh.affineEquivFunctor (A : CommRingCat.{u}) :
    ModuleCat.{u} A ⥤ DQCoh (Spec A) :=
  sorry

/- `DQCoh.mem_iff`, `DQCoh.isTriangulated`, `DQCoh.hasCoproducts`, `DQCoh.affineEquiv`, `DCoh` and the
tests `test_DQCoh_structure_sheaf`, `test_DQCoh_affine_free`, `test_DQCoh_extension_by_zero_not_qc` are
packet items. -/

-- node: SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom
noncomputable def derivedTensor {X : Scheme.{u}} : DQCoh X ⥤ DQCoh X ⥤ DQCoh X := sorry
noncomputable def derivedHom {X : Scheme.{u}} : (DQCoh X)ᵒᵖ ⥤ DQCoh X ⥤ DQCoh X := sorry

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
noncomputable def pushforwardRightAdjoint {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f]
    [QuasiSeparated f] : DQCoh Y ⥤ DQCoh X :=
  sorry
noncomputable def pushforwardRightAdjoint_adj {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f]
    [QuasiSeparated f] : totalDirectImage f ⊣ pushforwardRightAdjoint f :=
  sorry
/-- The trace (counit) `Rf_* a_f K → K`. -/
noncomputable def trace {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f] [QuasiSeparated f] :
    pushforwardRightAdjoint f ⋙ totalDirectImage f ⟶ 𝟭 (DQCoh Y) :=
  (pushforwardRightAdjoint_adj f).counit

-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_id
example (X : Scheme.{u}) : Nonempty (pushforwardRightAdjoint (𝟙 X) ≅ 𝟭 (DQCoh X)) := sorry
-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_closed_point
-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_not_upperShriek
/- Closed point of `𝔸¹` and non-proper affine line (packet statements). -/

-- node: SchemeAndStackFoundations:SF.2/upper-shriek-compactification-independence
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-etale
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-flat-base-change
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-smooth
-- node: SchemeAndStackFoundations:SF.2/lci-upper-shriek
/-- The upper shriek of a separated finite-type morphism of Noetherian schemes (the functor of
`key/coherent-duality`, on the bounded-below part). -/
noncomputable def upperShriek {X Y : Scheme.{u}} (f : X ⟶ Y) [IsSeparated f]
    [LocallyOfFiniteType f] [QuasiCompact f] [IsNoetherian Y] : DQCoh Y ⥤ DQCoh X :=
  sorry

theorem upperShriek_openImmersion {X Y : Scheme.{u}} (j : X ⟶ Y) [IsOpenImmersion j]
    [IsSeparated j] [LocallyOfFiniteType j] [QuasiCompact j] [IsNoetherian Y] :
    Nonempty (upperShriek j ≅ derivedPullback j) :=
  sorry

theorem upperShriek_proper {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] [QuasiCompact f]
    [IsNoetherian Y] :
    Nonempty (upperShriek f ≅ pushforwardRightAdjoint f) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/relative-dualizing-complex
/-- A relative dualizing complex `(K, ξ)` for a flat finitely presented morphism (carrier). -/
noncomputable def RelativeDualizingComplex {X S : Scheme.{u}} (f : X ⟶ S) [Flat f]
    [LocallyOfFinitePresentation f] : Type (u + 1) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/relative-dualizing-module
/-- The relative dualizing module `ω_{X/Y}` of a flat Cohen–Macaulay morphism (carrier). -/
noncomputable def relativeDualizingModule {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f]
    [LocallyOfFiniteType f] : X.Modules :=
  sorry

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
/-- The class in `H^2(X_et, G_m)` of an Azumaya algebra, via its gerbe of trivialisations
(the algebra given here by its affine data; the sheaf-algebra carrier is
`SchemeAndStackFoundations:SF.2/sheaf-algebra`). -/
noncomputable def azumayaClass (X : Scheme.{u}) (A : Type u) : (GmEtale X).H 2 := sorry

/- `trivializationGerbe`, `trivializationGerbe_isGerbe`, `azumayaClass_eq_zero_iff`,
`azumayaClass_tensor`, `azumayaClass_eq_delta`, `azumayaClass_pullback` and the tests
`test_class_matrix`, `test_class_quaternion_real`, `test_class_field_agrees`,
`test_class_not_module_class` are packet items; the carrier `azumayaClass` above takes the
algebra as a placeholder type argument until the sheaf-algebra carrier exists. -/

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

/-! ## Packet index

Every declaration, API item and unit test of the packet, by its packet name, with a
one-line gloss. Those with a Lean signature above appear there under the same name; the others are
stated in the packet and the roadmap document and wait for the carriers named there.
-/
/-
node SchemeAndStackFoundations:SF.2/site-cohomology-pullback (construction): Pullback on sheaf cohomology along a morphism of sites
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback [constructor]: For a morphism of sites f given by u and n ≥ 0, the homomorphism H^n(V,G) → H^n(u(V), u^{-1}G).
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_zero [simp]: In degree 0, pullback composed with H.equiv₀ is the restriction map of sections G(V) → (u^{-1}G)(u(V)).
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_naturality [functoriality]: For φ : G → G' the square formed by H.map φ and the pullbacks commutes.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_id [functoriality]: Pullback along the identity morphism of sites is the identity.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_comp [functoriality]: Pullback along a composite morphism of sites is the composite of the pullbacks (through u^{-1}v^{-1} ≅ (vu)^{-1}).
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_δ [compatibility]: Pullback commutes with the connecting homomorphisms attached to a short exact sequence 0 → G' → G → G'' → 0 and its (exact) pullback.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_id_etale [degenerate]: For the identity of X_et and n = 2 the pullback H^2(X_et,G) → H^2(X_et,G) is the identity map.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_zero_restriction [computation]: For an open immersion j : U → X and the small Zariski sites, pullback in degree 0 on the structure sheaf is restriction O(X) → O(U).
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_not_iso [non-example]: For the morphism Spec C → Spec R of small étale sites and G = Z/2Z, pullback H^1(Spec R, Z/2) ≅ Z/2 → H^1(Spec C, Z/2) = 0 is not injective; the cons…
node SchemeAndStackFoundations:SF.2/site-derived-pushforward (construction): Higher direct images for a morphism of sites
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.derivedPushforward [constructor]: The functor Rf_* : D^+(Ab(C)) → D^+(Ab(D)) derived from f_*.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage [constructor]: R^if_*F := H^i(Rf_*F) as an abelian sheaf on D.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_zero [simp]: R^0f_*F ≅ f_*F naturally in F.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_iso_sheafify [characterisation]: R^if_*F is isomorphic to the sheafification of the presheaf V ↦ H^i(u(V),F), naturally in F.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_δ [relation]: A short exact sequence of abelian sheaves on C gives a long exact sequence of the R^if_*.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.derivedPushforward_comp [functoriality]: R(g∘f)_* ≅ Rg_* ∘ Rf_* on D^+ (pushforward preserves injectives).
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_id [degenerate]: For the identity morphism of a site, R^1 id_* F = 0 for every abelian sheaf F.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_zero_eq [compatibility]: R^0f_*F is canonically isomorphic to Mathlib's sheafPushforwardContinuous applied to F.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_sepClosed_base [computation]: For f : X → Spec k with k separably closed and the small étale sites, the global sections of R^if_*F are H^i(X_et, F) (an étale sheaf on Spec k is de…
node SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence (theorem): Leray spectral sequence for a morphism of sites
node SchemeAndStackFoundations:SF.2/cech-to-cohomology (theorem): Čech-to-cohomology spectral sequence and Leray's acyclicity theorem
node SchemeAndStackFoundations:SF.2/abelian-torsor-h1 (theorem): First cohomology classifies torsors
node SchemeAndStackFoundations:SF.2/nonabelian-torsor-h1 (construction): Nonabelian first cohomology as torsor classes
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1 [constructor]: The pointed set of isomorphism classes of G-torsors on the site C.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.mk [constructor]: The class of a G-torsor.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.mk_eq_one_iff [characterisation]: The class of P is the base point iff P has a global section.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.map [functoriality]: The map on classes induced by a morphism of sheaves of groups G → G', by contracted product, with map_id and map_comp.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.pullback [functoriality]: The map along a morphism of sites, compatible with composition.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.connecting [constructor]: For 1 → A → B → Q → 1 exact, the boundary Q(C) → H^1(C,A) sending a section to its torsor of lifts.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.exact_sequence [relation]: Exactness of 1 → A(C) → B(C) → Q(C) → H^1(A) → H^1(B) → H^1(Q) as pointed sets.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.equivSheafH [compatibility]: For abelian G, an equivalence NonabelianH1 G ≃ Sheaf.H G 1 sending mk P to the class of SF.2/abelian-torsor-h1.
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_trivial_group [degenerate]: For the trivial sheaf of groups, NonabelianH1 is a one-point set.
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_abelian_agrees [compatibility]: For G = Z/2Z on the small étale site of Spec R, NonabelianH1 has two elements, matching Sheaf.H (Z/2) 1 ≅ Z/2.
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_gl_n_local [computation]: For a local ring A and G = GL_n on the small Zariski site of Spec A, NonabelianH1 is a point (every locally free module of rank n on a local scheme i…
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_not_group [non-example]: For G = S_3 (constant) on Spec K_et with K having a cyclic cubic and a quadratic extension, NonabelianH1 is the set Hom_cont(Gal_K, S_3)/conjugacy, w…
node SchemeAndStackFoundations:SF.2/gerbe-h2-class (construction): Second cohomology class of a central extension boundary and of an abelian-banded gerbe
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary [constructor]: For a central extension 1 → A → B → Q → 1, the map δ : NonabelianH1 Q → Sheaf.H A 2.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_one [simp]: δ of the trivial torsor is 0.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.exact_boundary [relation]: δ[P] = 0 iff [P] is in the image of NonabelianH1 B → NonabelianH1 Q.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_pullback [functoriality]: δ commutes with pullback along morphisms of sites.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_cech [characterisation]: On a covering trivialising P, δ[P] is the image under the Čech edge map of the 2-cocycle of a lift of the transition 1-cocycle.
  api TauCeti.SchemeFoundations.SiteCohomology.Gerbe.class [constructor]: The class in H^2(C, A) of a gerbe banded by an abelian sheaf A, zero iff the gerbe has a global object.
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_split [degenerate]: For the split central extension A → A × Q → Q, δ is identically 0.
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_matrix_algebra [computation]: For 1 → G_m → GL_d → PGL_d → 1 on X_et and the trivial PGL_d-torsor (class of Mat_d(O_X)), δ = 0.
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_abelian_connecting [compatibility]: For an abelian short exact sequence 0 → A → B → Q → 0, δ composed with the identification NonabelianH1 Q ≃ Sheaf.H Q 1 is the connecting map H^1(Q) →…
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_quaternion_real [non-example]: For X = Spec R and the Hamilton quaternions, δ of the PGL_2-torsor of H is the nonzero element of H^2(Spec R_et, G_m) ≅ Z/2, so δ is not the zero map.
node SchemeAndStackFoundations:SF.2/slice-site-cohomology (lemma): Cohomology on a slice site
node SchemeAndStackFoundations:SF.2/godement-resolution (construction): Godement resolution of a sheaf of modules
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution [constructor]: The functor from O_X-modules to complexes of O_X-modules F ↦ (f_*f^*F → f_*f^*f_*f^*F → …) with augmentation from F.
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_quasiIso [characterisation]: The augmentation F → godementResolution F is a quasi-isomorphism.
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_isFlasque [other]: Every term of the resolution is flasque.
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_exact [functoriality]: The functor F ↦ godementResolution F is exact (as a functor to complexes).
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_restrict [compatibility]: Restriction to an open U carries godementResolution F to godementResolution (F|_U).
  api TauCeti.SchemeFoundations.SiteCohomology.sheafH_iso_godement [compatibility]: H^n(U, F) is the n-th cohomology of the complex of sections of godementResolution F over U (Mathlib's Sheaf.H).
  test TauCeti.SchemeFoundations.SiteCohomology.test_godement_point [degenerate]: On a one-point space the Godement resolution of a module M is an acyclic complex augmented by M (cohomology M in degree 0 and 0 elsewhere).
  test TauCeti.SchemeFoundations.SiteCohomology.test_godement_skyscraper [computation]: For X the Sierpiński space and F the skyscraper Z at the closed point, the degree-0 term f_*f^*F has global sections Z (the product of the stalks Z a…
  test TauCeti.SchemeFoundations.SiteCohomology.test_godement_not_injective [non-example]: The terms of the Godement resolution of the constant sheaf Z on the Sierpiński space are flasque but not injective abelian sheaves (the stalk Z is no…
node SchemeAndStackFoundations:SF.2/flasque-cech-vanishing (lemma): Flasque sheaves have vanishing higher Čech cohomology
node SchemeAndStackFoundations:SF.2/noetherian-space-vanishing (theorem): Grothendieck's vanishing theorem on Noetherian spaces
node SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits (theorem): Cohomology commutes with filtered colimits on coherent objects
node SchemeAndStackFoundations:SF.2/qcoh-higher-direct-images (theorem): Higher direct images of quasi-coherent sheaves along qcqs morphisms
node SchemeAndStackFoundations:SF.2/projective-space-cohomology (theorem): Cohomology of line bundles on projective space
node SchemeAndStackFoundations:SF.2/ample-serre-vanishing (theorem): Serre vanishing and finiteness for ample invertible sheaves
node SchemeAndStackFoundations:SF.2/proper-fibre-dimension-vanishing (theorem): Higher direct images vanish above the fibre dimension
node SchemeAndStackFoundations:SF.2/serre-affineness-criterion (theorem): Serre's cohomological criterion for affineness
node SchemeAndStackFoundations:SF.2/sheaf-cohomology-with-supports (construction): Cohomology with supports in a closed subset
  api TauCeti.SchemeFoundations.Supports.sectionsWithSupport [constructor]: Γ_Z(X, F) as the kernel of F(X) → F(X ∖ Z), functorial in F.
  api TauCeti.SchemeFoundations.Supports.supportedSubsheaf [constructor]: The sheaf H_Z(F) on Z of sections supported in Z.
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport [constructor]: H^q_Z(X, F) := R^qΓ_Z(X, F), with its O_X(X)-module structure.
  api TauCeti.SchemeFoundations.Supports.localCohomologySheaf [constructor]: H^q_Z(F) := R^qH_Z(F) as O_X|_Z-modules.
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_zero [simp]: H^0_Z(X, F) = Γ_Z(X, F).
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_univ [simp]: For Z = X, H^q_Z(X,F) = H^q(X,F); for Z = ∅ it vanishes.
  api TauCeti.SchemeFoundations.Supports.rHZ_adjunction [universal-property]: RH_Z is right adjoint to i_* on derived categories.
  api TauCeti.SchemeFoundations.Supports.localToGlobal [relation]: The spectral sequence H^p(Z, H^q_Z(K)) ⇒ H^{p+q}_Z(X, K).
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_pullback [functoriality]: For a morphism f : X' → X and Z' = f^{-1}Z, the pullback maps H^p_Z(X,K) → H^p_{Z'}(X', Lf^*K) compatible with the maps to H^p(X,K).
  test TauCeti.SchemeFoundations.Supports.test_support_all [degenerate]: For Z = X, H^1_Z(X, F) = H^1(X, F).
  test TauCeti.SchemeFoundations.Supports.test_support_empty [degenerate]: For Z = ∅, H^q_Z(X, F) = 0 for all q.
  test TauCeti.SchemeFoundations.Supports.test_support_affine_line_origin [computation]: For X = A^1_k and Z the origin, H^1_Z(X, O) ≅ k[t,t^{-1}]/k[t] (a k-vector space with basis t^{-1}, t^{-2}, …) and H^0_Z(X,O) = 0.
  test TauCeti.SchemeFoundations.Supports.test_support_not_restriction [non-example]: H^0_Z(X,F) is not F(Z): for X = A^1_k, Z = origin, F = O, F restricted to Z has sections k while H^0_Z(X,O) = 0.
node SchemeAndStackFoundations:SF.2/supports-localization-triangle (theorem): Localization triangles for cohomology with supports
node SchemeAndStackFoundations:SF.2/local-cohomology-module-comparison (comparison): Local cohomology of sheaves and of modules
node SchemeAndStackFoundations:SF.2/local-cohomology-flat-base-change (theorem): Flat base change and flat excision for local cohomology
node SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing (theorem): Depth controls vanishing of local cohomology
node SchemeAndStackFoundations:SF.2/cousin-complex (construction): Cousin complex of a filtration by closed subsets
  api TauCeti.SchemeFoundations.Supports.relativeSupportCohomology [constructor]: H^k_{Z_i/Z_{i+1}}(F), the derived functors of sections supported in Z_i ∖ Z_{i+1} modulo Z_{i+1}.
  api TauCeti.SchemeFoundations.Supports.cousinComplex [constructor]: The complex Cous_Z(F) with augmentation F → Cous_Z(F)^0, functorial in F.
  api TauCeti.SchemeFoundations.Supports.cousinComplex_d_comp_d [relation]: Consecutive differentials compose to zero.
  api TauCeti.SchemeFoundations.Supports.cousinComplex_isQuasicoherent [other]: For X Noetherian and F quasi-coherent, each term is quasi-coherent.
  api TauCeti.SchemeFoundations.Supports.relativeSupportCohomology_eq_zero_of_affine [characterisation]: If Z_i ∖ Z_{i+1} → X is affine then H^k_{Z_i/Z_{i+1}}(F) = 0 for k ≠ i (quasi-coherent F).
  api TauCeti.SchemeFoundations.Supports.cousinComplex_trivial [simp]: For the filtration X ⊇ ∅, the Cousin complex is F concentrated in degree 0.
  test TauCeti.SchemeFoundations.Supports.test_cousin_trivial_filtration [degenerate]: For Z_0 = X, Z_1 = ∅ the augmentation F → Cous_Z(F) is an isomorphism onto F in degree 0.
  test TauCeti.SchemeFoundations.Supports.test_cousin_dvr [computation]: For X = Spec of a DVR R with fraction field K and Z_1 = closed point, Cous_Z(O_X) is K → K/R in degrees 0, 1, and the augmentation R → (K → K/R) is a…
  test TauCeti.SchemeFoundations.Supports.test_cousin_not_resolution [non-example]: For X = Spec k[x,y]/(xy, y^2) (not Cohen–Macaulay, embedded point at the origin) with Z_1 = origin, the augmentation O_X → Cous_Z(O_X) is not injecti…
node SchemeAndStackFoundations:SF.2/kempf-cousin-resolution (theorem): Cousin complexes of maximal Cohen–Macaulay sheaves are resolutions
node SchemeAndStackFoundations:SF.2/big-site-quasi-coherent-sheaf (construction): The big-site sheaf of a quasi-coherent module
  api TauCeti.SchemeFoundations.Topologies.bigSheaf [constructor]: F ↦ F^a from quasi-coherent O_S-modules to τ-sheaves of O-modules on Sch/S, with F^a(T) = Γ(T, h^*F).
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_obj [simp]: Sections of F^a over (T, h) are Γ(T, h^*F).
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_isSheaf [characterisation]: F^a is a sheaf for each listed topology, including fpqc.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_exact [functoriality]: F ↦ F^a sends short exact sequences of quasi-coherent modules to short exact sequences of τ-sheaves.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_pullback [compatibility]: For g : S' → S, (g^*F)^a is the restriction of F^a to Sch/S'.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_structureSheaf [example]: (O_S)^a is the structure sheaf O of the big site, i.e. G_a as a sheaf of rings.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_fullyFaithful [equivalence]: F ↦ F^a is fully faithful on quasi-coherent modules.
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zero [degenerate]: For F = 0, F^a is the zero sheaf.
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_spec_field [computation]: For S = Spec k and F = O_S, F^a(Spec L) = L for every field extension L/k.
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zariski_restriction [compatibility]: Restricting F^a to the small Zariski site of S gives back F (as a sheaf on the topological space of S).
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_not_topological_pullback [non-example]: For S = Spec Q, F = O_S and T = Spec Q(i), F^a(T) = Q(i); the topological inverse image h^{-1}F would give sections Q, so the definition must use the…
node SchemeAndStackFoundations:SF.2/multiplicative-additive-group-sheaves (definition): The sheaves G_m, G_a and μ_n on schemes
  api TauCeti.SchemeFoundations.Topologies.Ga [constructor]: The sheaf of abelian groups T ↦ Γ(T,O_T) on (Sch/S)_τ.
  api TauCeti.SchemeFoundations.Topologies.Gm [constructor]: The sheaf of abelian groups T ↦ Γ(T,O_T)^× on (Sch/S)_τ.
  api TauCeti.SchemeFoundations.Topologies.mu [constructor]: For n ≥ 1 the subsheaf μ_n ⊂ G_m of n-th roots of unity.
  api TauCeti.SchemeFoundations.Topologies.Gm_obj [simp]: Sections of G_m over T are the units of Γ(T, O_T).
  api TauCeti.SchemeFoundations.Topologies.mu_eq_ker_pow [characterisation]: μ_n is the kernel of the n-th power endomorphism of G_m.
  api TauCeti.SchemeFoundations.Topologies.Gm_restrict_small [compatibility]: The restriction of G_m to the small étale site of S is the sheaf of units of the étale structure sheaf.
  api TauCeti.SchemeFoundations.Topologies.mu_eq_cpc [compatibility]: For n invertible on S, the restriction of μ_n to S_et is the roots-of-unity sheaf of CohomologicalPointCounting ConstructibleEtale Layer 6.
  test TauCeti.SchemeFoundations.Topologies.test_mu_one [degenerate]: μ_1 is the zero sheaf.
  test TauCeti.SchemeFoundations.Topologies.test_Gm_field [computation]: G_m(Spec Q) = Q^×, and μ_2(Spec Q) = {±1}.
  test TauCeti.SchemeFoundations.Topologies.test_mu_p_not_etale_trivial [non-example]: Over S = Spec F_p, μ_p has trivial sections on every reduced S-scheme but nonzero sections on Spec F_p[ε]/(ε^p); so μ_p is not the constant sheaf Z/p…
node SchemeAndStackFoundations:SF.2/topology-comparison-morphisms (construction): Comparison morphisms between the topologies of a scheme
  api TauCeti.SchemeFoundations.Topologies.epsilonFppfEtale [constructor]: The morphism of topoi from big fppf sheaves to big étale sheaves on Sch/X.
  api TauCeti.SchemeFoundations.Topologies.aX [constructor]: The morphism a_X from big fppf sheaves to sheaves on X_et, with a_X^{-1}F(T) = Γ(T, F_T).
  api TauCeti.SchemeFoundations.Topologies.etaleToNisnevich [constructor]: The morphism of topoi Sh(X_et) → Sh(X_Nis).
  api TauCeti.SchemeFoundations.Topologies.nisnevichToZariski [constructor]: The morphism of topoi Sh(X_Nis) → Sh(X_Zar).
  api TauCeti.SchemeFoundations.Topologies.comparison_comp [functoriality]: The composite etaleToNisnevich ≫ nisnevichToZariski is the étale-to-Zariski comparison; all comparisons compose coherently.
  api TauCeti.SchemeFoundations.Topologies.comparison_baseChange [compatibility]: For f : Y → X the comparison morphisms commute with the morphisms of topoi induced by f.
  api TauCeti.SchemeFoundations.Topologies.aX_inverseImage_obj [simp]: a_X^{-1}F evaluated at (T → X) is Γ(T_et, F|_T).
  test TauCeti.SchemeFoundations.Topologies.test_comparison_id [degenerate]: For the identity topology comparison (étale to étale) the morphism is the identity of Sh(X_et).
  test TauCeti.SchemeFoundations.Topologies.test_aX_constant [computation]: a_X^{-1} of the constant sheaf Z/2 on X_et is the constant fppf sheaf Z/2 on Sch/X (sections over T: locally constant functions T → Z/2).
  test TauCeti.SchemeFoundations.Topologies.test_zariski_not_etale [non-example]: The étale-to-Zariski comparison is not an equivalence: for X = Spec R, the sheaf μ_2 has H^1_Zar(X, μ_2) = 0 but H^1_et(X, μ_2) ≅ R^×/R^{×2} = Z/2.
node SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison (comparison): Quasi-coherent cohomology is the same in every topology
node SchemeAndStackFoundations:SF.2/etale-pullback-fppf-comparison (comparison): Étale sheaves have the same fppf cohomology
node SchemeAndStackFoundations:SF.2/smooth-group-fppf-etale-comparison (comparison): Étale and fppf cohomology agree for smooth commutative group schemes
node SchemeAndStackFoundations:SF.2/hilbert-90 (theorem): Hilbert's Theorem 90 for schemes
node SchemeAndStackFoundations:SF.2/fppf-kummer-sequence (theorem): Kummer sequences in the fppf and étale topologies
node SchemeAndStackFoundations:SF.2/artin-schreier-sequence (theorem): The Artin–Schreier sequence and p-cohomological dimension in characteristic p
node SchemeAndStackFoundations:SF.2/finite-pushforward-exact (theorem): Finite and integral pushforward on étale sheaves
node SchemeAndStackFoundations:SF.2/etale-galois-comparison (comparison): Étale cohomology of a field is Galois cohomology
node SchemeAndStackFoundations:SF.2/etale-cohomology-limits (theorem): Étale cohomology of limits of schemes
node SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering (theorem): Hochschild–Serre spectral sequences for Galois coverings
node SchemeAndStackFoundations:SF.2/gabber-affine-proper-base-change (theorem): Gabber's affine analogue of proper base change
node SchemeAndStackFoundations:SF.2/tsen-theorem (theorem): Tsen's theorem and vanishing of Galois cohomology of G_m for function fields of curves
node SchemeAndStackFoundations:SF.2/curve-multiplicative-cohomology (theorem): Étale cohomology of G_m on a smooth curve
node SchemeAndStackFoundations:SF.2/curve-roots-of-unity-cohomology (theorem): Étale cohomology of μ_n on curves over an algebraically closed field
node SchemeAndStackFoundations:SF.2/proper-hypercover-descent (theorem): Cohomological descent for proper hypercoverings
node SchemeAndStackFoundations:SF.2/proetale-etale-morphism (construction): The morphism from the pro-étale to the étale topos
  api TauCeti.SchemeFoundations.Proetale.nu [constructor]: The morphism of topoi ν_X : Sh(X_proet) → Sh(X_et), with inverse image ν^* and direct image ν_*.
  api TauCeti.SchemeFoundations.Proetale.nu_inverseImage_obj_affine [simp]: For U = lim U_i affine pro-étale with a presentation, (ν^*F)(U) = colim F(U_i).
  api TauCeti.SchemeFoundations.Proetale.nu_directImage_obj [simp]: (ν_*G)(V) = G(V) for V étale over X.
  api TauCeti.SchemeFoundations.Proetale.nu_unit_iso [characterisation]: The unit F → ν_*ν^*F is an isomorphism for every étale sheaf F.
  api TauCeti.SchemeFoundations.Proetale.nu_naturality [functoriality]: For f : X → Y, ν_Y ∘ f_proet = f_et ∘ ν_X as morphisms of topoi.
  api TauCeti.SchemeFoundations.Proetale.nu_pushforward_comm [compatibility]: For f qcqs and F ∈ Sh(X_et) or D^+(X_et), ν_Y^* f_{et,*}F ≅ f_{proet,*} ν_X^*F.
  test TauCeti.SchemeFoundations.Proetale.test_nu_point [degenerate]: For X = ∅, Sh(X_proet) and Sh(X_et) are both trivial and ν is an equivalence.
  test TauCeti.SchemeFoundations.Proetale.test_nu_constant_profinite [computation]: For X = Spec of an algebraically closed field and A = Z/2, (ν^* A)(X ⊗ S) = C(S, Z/2) for a profinite set S.
  test TauCeti.SchemeFoundations.Proetale.test_nu_not_essentially_surjective [non-example]: For X = Spec of an algebraically closed field, the sheaf S ↦ C(S, Z_ℓ) (Mathlib's ellAdicSheaf) is not in the essential image of ν^* (its value on a …
node SchemeAndStackFoundations:SF.2/proetale-classical-comparison (theorem): Bhatt–Scholze comparison: classical complexes embed fully faithfully in pro-étale complexes
node SchemeAndStackFoundations:SF.2/replete-topos (definition): Replete topoi
  api TauCeti.SchemeFoundations.Proetale.IsReplete [constructor]: The predicate on a category of sheaves: limits of towers of epimorphisms are epimorphisms onto each stage.
  api TauCeti.SchemeFoundations.Proetale.isReplete_of_locallyWeaklyContractible [other]: A locally weakly contractible topos is replete.
  api TauCeti.SchemeFoundations.Proetale.isReplete_proetale [instance]: Sh(X_proet) is replete for every scheme X.
  api TauCeti.SchemeFoundations.Proetale.IsReplete.lim_epi [projection]: In a replete topos lim F_n → F_m is an epimorphism for a tower of epimorphisms.
  api TauCeti.SchemeFoundations.Proetale.IsReplete.derivedCategory_leftComplete [relation]: If T is replete then D(T) is left-complete (SF.2/proetale-left-completeness).
  test TauCeti.SchemeFoundations.Proetale.test_isReplete_types [degenerate]: The category of types (sheaves on the one-point site) is replete.
  test TauCeti.SchemeFoundations.Proetale.test_isReplete_proetale_point [computation]: For X = Spec of an algebraically closed field, Sh(X_proet) ≃ sheaves on profinite sets is replete.
  test TauCeti.SchemeFoundations.Proetale.test_etale_not_replete [non-example]: For X = Spec Q the tower of surjections μ_{ℓ^{n+1}} → μ_{ℓ^n} (ℓ-th power) of étale sheaves has limit 0 in Sh(X_et) (no nonzero element of Z_ℓ(1) has…
node SchemeAndStackFoundations:SF.2/w-contractible-cover (theorem): Existence of w-contractible pro-étale covers
node SchemeAndStackFoundations:SF.2/proetale-left-completeness (theorem): Left-completeness of the pro-étale derived category and the unbounded comparison
node SchemeAndStackFoundations:SF.2/proetale-lisse-sheaves (theorem): Lisse adic sheaves on the pro-étale site
node SchemeAndStackFoundations:SF.2/nisnevich-covering (definition): Nisnevich coverings
  api TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering [constructor]: The predicate on a family of étale morphisms into X: every point has a preimage with trivial residue field extension.
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichPrecoverage [constructor]: The precoverage on schemes whose covering families are Nisnevich coverings (a sub-precoverage of Mathlib's etalePrecoverage).
  api TauCeti.SchemeFoundations.Nisnevich.isNisnevichCovering_of_zariski [compatibility]: Every Zariski covering family is a Nisnevich covering (zariskiPrecoverage ≤ nisnevichPrecoverage).
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichPrecoverage_le_etale [compatibility]: nisnevichPrecoverage ≤ etalePrecoverage.
  api TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering.pullback [functoriality]: Nisnevich coverings are stable under base change along any morphism Y → X.
  api TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering.comp [functoriality]: Composing Nisnevich coverings of the members of a Nisnevich covering gives a Nisnevich covering.
  api TauCeti.SchemeFoundations.Nisnevich.isNisnevichCovering_iff_henselization [characterisation]: For finite families over a Noetherian base: Nisnevich iff the base change to each Spec O^h_{X,x} has a section.
  test TauCeti.SchemeFoundations.Nisnevich.test_covering_identity [degenerate]: The singleton family {id : X → X} is a Nisnevich covering.
  test TauCeti.SchemeFoundations.Nisnevich.test_not_covering_real_complex [non-example]: {Spec C → Spec R} is not a Nisnevich covering although it is an étale covering.
  test TauCeti.SchemeFoundations.Nisnevich.test_covering_quadratic_split [computation]: {Spec Z[1/10] → Spec Z[1/2], Spec Z[1/2][x]/(x^2+1) → Spec Z[1/2]} is a Nisnevich covering: the second map is étale, and over the prime (5) the polyn…
  test TauCeti.SchemeFoundations.Nisnevich.test_zariski_is_nisnevich [compatibility]: The Zariski covering {D(2), D(3)} of Spec Z is a Nisnevich covering.
node SchemeAndStackFoundations:SF.2/nisnevich-topology (construction): The Nisnevich topology
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology [constructor]: The Grothendieck topology on Scheme generated by Nisnevich coverings.
  api TauCeti.SchemeFoundations.Nisnevich.smallNisnevichTopology [constructor]: The topology on X.Etale induced by Nisnevich coverings.
  api TauCeti.SchemeFoundations.Nisnevich.zariskiTopology_le_nisnevichTopology [compatibility]: zariskiTopology ≤ nisnevichTopology.
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology_le_etaleTopology [compatibility]: nisnevichTopology ≤ etaleTopology.
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology_subcanonical [instance]: The Nisnevich topology is subcanonical.
  api TauCeti.SchemeFoundations.Nisnevich.mem_nisnevichTopology_iff [characterisation]: A sieve covers X iff it contains a Nisnevich covering family.
  api TauCeti.SchemeFoundations.Nisnevich.smallNisnevich_comparison [compatibility]: The small Nisnevich site maps to the small étale and small Zariski sites by SF.2/topology-comparison-morphisms.
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_between [compatibility]: zariskiTopology ≤ nisnevichTopology ∧ nisnevichTopology ≤ etaleTopology.
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_not_etale [non-example]: The sieve on Spec R generated by Spec C → Spec R is étale-covering but not Nisnevich-covering.
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_field_global_sections [computation]: For a field k, a presheaf of sets F on (Spec k)_Nis is a sheaf iff F(∐ Spec L_i) = ∏ F(Spec L_i); in particular every Nisnevich sheaf on Spec k is de…
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_representable_sheaf [degenerate]: The presheaf represented by any scheme is a Nisnevich sheaf.
node SchemeAndStackFoundations:SF.2/elementary-distinguished-square (definition): Elementary distinguished squares
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare [constructor]: Structure: a Mathlib Square in Scheme over X with an open immersion j, an étale p, cartesianness, and p an isomorphism over the reduced complement of…
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.isNisnevichCovering [projection]: The pair {j, p} is a Nisnevich covering of X.
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.ofZariski [constructor]: The square attached to an open cover X = U ∪ V.
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.pullback [functoriality]: Base change along any morphism Y → X gives an elementary distinguished square over Y.
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.isPullback [projection]: The underlying square is a pullback in Scheme.
  test TauCeti.SchemeFoundations.Nisnevich.test_eds_zariski [degenerate]: For X = U ∪ V an open cover, ofZariski gives a square whose p is the open immersion of V.
  test TauCeti.SchemeFoundations.Nisnevich.test_eds_affine_line [computation]: X = A^1_Q, U = A^1 ∖ {0}, V = A^1 ∖ {−1, −2} with p(s) = s^2 + 2s: p is étale on V and p^{-1}(0) ∩ V = {0} with residue field Q, so (U ⊂ X, p) is an …
  test TauCeti.SchemeFoundations.Nisnevich.test_eds_not_distinguished [non-example]: X = Spec R, U = ∅, V = Spec C: p is étale and surjective but p^{-1}(X ∖ U) → X ∖ U is not an isomorphism, so this is not an elementary distinguished …
node SchemeAndStackFoundations:SF.2/distinguished-square-mayer-vietoris (lemma): Distinguished squares are Mayer–Vietoris squares
node SchemeAndStackFoundations:SF.2/nisnevich-sheaf-criterion (theorem): The Nisnevich sheaf condition is checked on distinguished squares
node SchemeAndStackFoundations:SF.2/nisnevich-points-henselization (theorem): Points of the Nisnevich topology are henselizations
node SchemeAndStackFoundations:SF.2/nisnevich-cohomological-dimension (theorem): Nisnevich cohomological dimension is bounded by Krull dimension
node SchemeAndStackFoundations:SF.2/nisnevich-cech-comparison (theorem): Čech and derived Nisnevich cohomology agree
node SchemeAndStackFoundations:SF.2/brown-gersten-vanishing (theorem): Brown–Gersten vanishing for Nisnevich Mayer–Vietoris functors
node SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category (definition): The derived category of complexes with quasi-coherent cohomology
  api TauCeti.SchemeFoundations.Coherent.DQCoh [constructor]: The full triangulated subcategory D_QCoh(O_X) of DerivedCategory (X.Modules) of complexes with quasi-coherent cohomology sheaves.
  api TauCeti.SchemeFoundations.Coherent.DQCoh.mem_iff [characterisation]: K ∈ D_QCoh iff every cohomology sheaf H^i(K) is quasi-coherent.
  api TauCeti.SchemeFoundations.Coherent.DQCoh.isTriangulated [instance]: D_QCoh(O_X) is closed under shifts and cones (a triangulated subcategory).
  api TauCeti.SchemeFoundations.Coherent.DQCoh.hasCoproducts [instance]: D_QCoh(O_X) has arbitrary direct sums, computed in D(O_X).
  api TauCeti.SchemeFoundations.Coherent.DQCoh.affineEquiv [equivalence]: For X = Spec A, M ↦ M~ is an equivalence D(A) ≌ D_QCoh(O_X).
  api TauCeti.SchemeFoundations.Coherent.DCoh [constructor]: For X locally Noetherian, the subcategory of complexes with coherent cohomology, with bounded variants.
  test TauCeti.SchemeFoundations.Coherent.test_DQCoh_structure_sheaf [degenerate]: O_X[0] belongs to D_QCoh(O_X) for every scheme X.
  test TauCeti.SchemeFoundations.Coherent.test_DQCoh_affine_free [computation]: Under DQCoh.affineEquiv for X = Spec Z, the complex Z[0] goes to O_X[0] and Z/2[0] goes to the quasi-coherent sheaf (Z/2)~, supported on the closed p…
  test TauCeti.SchemeFoundations.Coherent.test_DQCoh_extension_by_zero_not_qc [non-example]: For X = Spec of a DVR with generic point inclusion j : U → X, the module j_!O_U (extension by zero) is not quasi-coherent, so j_!O_U[0] ∉ D_QCoh(O_X).
node SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom (construction): Derived tensor product and derived internal Hom of O_X-modules
  api TauCeti.SchemeFoundations.Coherent.derivedTensor [constructor]: K ⊗^L_{O_X} L on D(O_X), bifunctorial and triangulated in each variable.
  api TauCeti.SchemeFoundations.Coherent.derivedHom [constructor]: RHom_{O_X}(K, L) on D(O_X), contravariant in K, covariant in L.
  api TauCeti.SchemeFoundations.Coherent.derivedTensor_derivedHom_adj [universal-property]: Hom(K ⊗^L L, M) ≅ Hom(K, RHom(L, M)) naturally.
  api TauCeti.SchemeFoundations.Coherent.derivedTensor_unit [simp]: K ⊗^L O_X ≅ K and RHom(O_X, L) ≅ L.
  api TauCeti.SchemeFoundations.Coherent.derivedTensor_mem_DQCoh [other]: ⊗^L preserves D_QCoh(O_X).
  api TauCeti.SchemeFoundations.Coherent.derivedHom_mem_DQCoh [other]: RHom(K, L) ∈ D_QCoh for K pseudo-coherent and L ∈ D^+_QCoh.
  api TauCeti.SchemeFoundations.Coherent.perfect_dual [relation]: For K perfect, RHom(K, L) ≅ RHom(K, O_X) ⊗^L L.
  test TauCeti.SchemeFoundations.Coherent.test_derivedTensor_unit [degenerate]: For K = O_X[0], K ⊗^L K ≅ O_X[0].
  test TauCeti.SchemeFoundations.Coherent.test_derivedTensor_affine_tor [computation]: On X = Spec Z, (Z/2)~ ⊗^L (Z/2)~ has cohomology sheaves (Z/2)~ in degrees 0 and −1 (Tor_1(Z/2, Z/2) = Z/2).
  test TauCeti.SchemeFoundations.Coherent.test_derivedHom_affine_ext [compatibility]: On X = Spec A with K = M~, L = N~ for finitely presented M over Noetherian A, H^i(RHom(K, L)) is (Ext^i_A(M, N))~.
  test TauCeti.SchemeFoundations.Coherent.test_underived_tensor_differs [non-example]: The underived tensor product (Z/2)~ ⊗ (Z/2)~ = (Z/2)~ misses the Tor term, so derivedTensor is not the termwise tensor product of the given complexes.
node SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh (construction): Derived pullback and total direct image on quasi-coherent complexes
  api TauCeti.SchemeFoundations.Coherent.derivedPullback [constructor]: Lf^* : D(O_Y) → D(O_X), restricting to D_QCoh.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage [constructor]: Rf_* : D(O_X) → D(O_Y), restricting to D_QCoh for qcqs f.
  api TauCeti.SchemeFoundations.Coherent.derivedPullback_totalDirectImage_adj [universal-property]: Lf^* ⊣ Rf_*.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage_mem_DQCoh [other]: For f qcqs, Rf_* preserves D_QCoh.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage_coproduct [other]: For f qcqs, Rf_* on D_QCoh commutes with direct sums.
  api TauCeti.SchemeFoundations.Coherent.projectionFormula [relation]: Rf_*E ⊗^L K ≅ Rf_*(E ⊗^L Lf^*K) for qcqs f.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage_comp [functoriality]: R(g∘f)_* ≅ Rg_* ∘ Rf_* and L(g∘f)^* ≅ Lf^* ∘ Lg^*.
  api TauCeti.SchemeFoundations.Coherent.cohomology_totalDirectImage [compatibility]: H^i(Rf_*F) ≅ R^if_*F for quasi-coherent F (SF.2/qcoh-higher-direct-images).
  test TauCeti.SchemeFoundations.Coherent.test_pullback_identity [degenerate]: For f = id_X, Lf^* K ≅ K.
  test TauCeti.SchemeFoundations.Coherent.test_pushforward_projective_line [computation]: For f : P^1_k → Spec k, Rf_*O(−2) is k[−1] (SF.2/projective-space-cohomology).
  test TauCeti.SchemeFoundations.Coherent.test_pullback_affine_tensor [compatibility]: For Spec B → Spec A, Lf^*(M~) has cohomology (Tor_i^A(M, B))~ in degree −i.
  test TauCeti.SchemeFoundations.Coherent.test_underived_pullback_not_exact [non-example]: For Spec(Z/2) → Spec Z and the exact sequence 0 → Z → Z → Z/2 → 0, the underived pullback is not exact (multiplication by 2 becomes zero), so Lf^* is…
node SchemeAndStackFoundations:SF.2/perfect-generator (theorem): D_QCoh of a qcqs scheme is generated by one perfect complex
node SchemeAndStackFoundations:SF.2/tor-independent-base-change (theorem): Tor-independent base change for quasi-coherent complexes
node SchemeAndStackFoundations:SF.2/pushforward-right-adjoint (construction): Right adjoint of pushforward on quasi-coherent complexes
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint [constructor]: a_f : D_QCoh(O_Y) → D_QCoh(O_X), right adjoint to Rf_*.
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_adj [universal-property]: Rf_* ⊣ a_f on D_QCoh.
  api TauCeti.SchemeFoundations.Coherent.trace [data]: The counit Tr_f : Rf_*a_f(K) → K, natural in K.
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_comp [functoriality]: a_{g∘f} ≅ a_f ∘ a_g compatibly with traces.
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_boundedBelow [other]: a_f maps D^+_QCoh(O_Y) into D^+_QCoh(O_X).
  api TauCeti.SchemeFoundations.Coherent.globalDuality [relation]: RHom_X(L, a_f K) ≅ RHom_Y(Rf_*L, K) for L ∈ D_QCoh(O_X), K ∈ D_QCoh(O_Y).
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_affine_finite [example]: For a finite map Spec B → Spec A, a_f(K~) = (RHom_A(B, K))~ as B-complexes.
  test TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_id [degenerate]: For f = id_X, a_f ≅ id and Tr_f is the identity.
  test TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_closed_point [computation]: For f : Spec k → Spec k[x] (x ↦ 0), a_f(O) = RHom(k, k[x]) = k[−1].
  test TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_not_upperShriek [non-example]: For f : A^1_k → Spec k (affine, not proper), a_f(k) corresponds to the full linear dual Hom_k(k[x], k) as a k[x]-module (Stacks Example 48.3.2), wher…
node SchemeAndStackFoundations:SF.2/upper-shriek-compactification-independence (theorem): The upper shriek pseudofunctor is independent of compactifications
node SchemeAndStackFoundations:SF.2/upper-shriek-etale (lemma): Upper shriek of étale morphisms and open immersions
node SchemeAndStackFoundations:SF.2/upper-shriek-flat-base-change (theorem): Flat base change for upper shriek
node SchemeAndStackFoundations:SF.2/upper-shriek-smooth (theorem): Upper shriek of smooth morphisms
node SchemeAndStackFoundations:SF.2/lci-upper-shriek (theorem): Upper shriek of local complete intersection and Gorenstein morphisms
node SchemeAndStackFoundations:SF.2/relative-dualizing-complex (definition): Relative dualizing complexes
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex [constructor]: Structure: an S-perfect K ∈ D(O_X) with the diagonal isomorphism ξ.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.unique [extensionality]: Two relative dualizing complexes are uniquely isomorphic compatibly with ξ.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.exists [constructor]: Existence for flat finitely presented f.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.baseChange [functoriality]: Derived pullback along S' → S of a relative dualizing complex is one for X' → S'.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.homothety_iso [characterisation]: O_X → RHom(K, K) is an isomorphism.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.upperShriek [compatibility]: For f flat in FTS_S, f^!O_Y with its canonical ξ is a relative dualizing complex.
  test TauCeti.SchemeFoundations.Coherent.test_rdc_identity [degenerate]: For f = id_S, the relative dualizing complex is O_S[0].
  test TauCeti.SchemeFoundations.Coherent.test_rdc_projective_line [computation]: For f : P^1_S → S, the relative dualizing complex is O(−2)[1] = Ω^1_{P^1/S}[1].
  test TauCeti.SchemeFoundations.Coherent.test_rdc_base_change [compatibility]: For S' → S and f flat finitely presented, the base change of the relative dualizing complex of f is that of f' (the unique one).
  test TauCeti.SchemeFoundations.Coherent.test_rdc_not_invertible [non-example]: For f : Spec A → Spec k with A = k[x,y]/(x,y)^2, the relative dualizing complex is Hom_k(A, k)[0], which needs two generators as an A-module; so a re…
node SchemeAndStackFoundations:SF.2/relative-dualizing-module (definition): Relative dualizing module of a Cohen–Macaulay morphism
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule [constructor]: ω_{X/Y} := H^{−d}(f^!O_Y) for f flat Cohen–Macaulay of relative dimension d.
  api TauCeti.SchemeFoundations.Coherent.upperShriek_structureSheaf_iso_shift [characterisation]: f^!O_Y ≅ ω_{X/Y}[d].
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_coherent [other]: ω_{X/Y} is coherent and flat over Y.
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_baseChange [functoriality]: Formation of ω_{X/Y} commutes with arbitrary base change in FTS_S.
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_invertible_iff [characterisation]: ω_{X/Y} is invertible at x iff f is Gorenstein at x.
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_smooth [example]: For f smooth of relative dimension d, ω_{X/Y} ≅ ∧^dΩ_{X/Y}.
  test TauCeti.SchemeFoundations.Coherent.test_omega_smooth_curve_degree [computation]: For a smooth projective curve C of genus g over k, deg ω_{C/k} = 2g − 2; for P^1, ω = O(−2).
  test TauCeti.SchemeFoundations.Coherent.test_omega_identity [degenerate]: For f = id_Y (relative dimension 0), ω_{Y/Y} = O_Y.
  test TauCeti.SchemeFoundations.Coherent.test_omega_nodal_invertible [compatibility]: For the nodal cubic y^2 = x^3 + x^2 over k, ω is invertible of degree 0 (Gorenstein, arithmetic genus 1), matching StableReduction Layer 2.
  test TauCeti.SchemeFoundations.Coherent.test_omega_not_canonical_for_non_cm [non-example]: For X = two planes in A^4 meeting at a point (not Cohen–Macaulay), f^!k has more than one nonzero cohomology sheaf, so ω_{X/k} is not defined by this…
node SchemeAndStackFoundations:SF.2/cm-serre-duality (theorem): Serre duality for proper Cohen–Macaulay schemes
node SchemeAndStackFoundations:SF.2/curve-dualizing-comparison (comparison): General coherent duality restricts to the curve duality of StableReduction and JacobianChallenge
node SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality (theorem): Sheafified Grothendieck duality for proper morphisms
node SchemeAndStackFoundations:SF.2/quasi-coherent-algebra-descent (theorem): Descent of quasi-coherent algebras and of the Azumaya property
node SchemeAndStackFoundations:SF.2/azumaya-equivalent-conditions (theorem): Equivalent characterisations of Azumaya algebras on a scheme
node SchemeAndStackFoundations:SF.2/azumaya-trivialization-gerbe (construction): The gerbe of trivialisations of an Azumaya algebra
  api TauCeti.SchemeFoundations.Brauer.trivializationGerbe [constructor]: The stack G_A of pairs (E, φ : End(E) ≅ A|_U) over the small étale site.
  api TauCeti.SchemeFoundations.Brauer.trivializationGerbe_isGerbe [other]: G_A is a gerbe with band G_m.
  api TauCeti.SchemeFoundations.Brauer.azumayaClass [constructor]: The class [G_A] ∈ H^2(X_et, G_m) (Mathlib's Sheaf.H).
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_eq_zero_iff [characterisation]: [G_A] = 0 iff A ≅ End(E) for a finite locally free E of positive rank.
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_tensor [relation]: [G_{A⊗B}] = [G_A] + [G_B] and [G_{A^op}] = −[G_A].
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_eq_delta [compatibility]: azumayaClass descends to the Brauer quotient and equals SchemeAndStackFoundations:SF.2/delta.
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_pullback [functoriality]: Pullback of algebras corresponds to pullback on H^2 (SF.2/site-cohomology-pullback).
  test TauCeti.SchemeFoundations.Brauer.test_class_matrix [degenerate]: azumayaClass (Mat_d(O_X)) = 0.
  test TauCeti.SchemeFoundations.Brauer.test_class_quaternion_real [computation]: For X = Spec R and the Hamilton quaternions, azumayaClass ≠ 0 and 2 · azumayaClass = 0.
  test TauCeti.SchemeFoundations.Brauer.test_class_field_agrees [compatibility]: For X = Spec K, azumayaClass followed by SF.2/brauer-field-comparison equals the class of the central simple algebra in TauCeti.BrauerGroup K.
  test TauCeti.SchemeFoundations.Brauer.test_class_not_module_class [non-example]: The class depends on the algebra, not the module: the underlying modules of the quaternions H and of Mat_2(R) over R are both free of rank 4, but the…
node SchemeAndStackFoundations:SF.2/brauer-regular-injectivity (theorem): Brauer groups of regular schemes: torsion and injectivity into the function field
node SchemeAndStackFoundations:SF.2/brauer-field-comparison (comparison): The cohomological Brauer group of a field is the Brauer group
node SchemeAndStackFoundations:SF.2/brauer-kummer-sequence (theorem): Kummer sequences for Brauer groups
node SchemeAndStackFoundations:SF.2/brauer-henselian-local (theorem): Brauer groups of henselian local rings
node SchemeAndStackFoundations:SF.2/brauer-hochschild-serre-sequence (theorem): The algebraic Brauer group sequence of a variety
node SchemeAndStackFoundations:SF.2/equivariant-module-category (construction): The abelian category of semilinear equivariant modules
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules [constructor]: The category Mod_Γ(O_X) of semilinear Γ-equivariant O_X-modules.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.abelian [instance]: Mod_Γ(O_X) is abelian, with kernels and cokernels computed underlying.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget [projection]: The exact faithful forgetful functor to Mod(O_X).
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget_exact [other]: forget preserves finite limits and colimits and reflects isomorphisms.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.hom_eq_invariants [characterisation]: Hom_Γ(F, G) ≅ Hom_{O_X}(F, G)^Γ.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.isGrothendieckAbelian [instance]: Mod_Γ(O_X) is Grothendieck abelian (AB5 with the generators L(U)), hence has enough injectives.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.trivialGroupEquiv [equivalence]: For Γ trivial, forget is an equivalence.
  test TauCeti.SchemeFoundations.Equivariant.test_trivial_group [degenerate]: For Γ = 1, EquivariantModules.forget is an equivalence of categories.
  test TauCeti.SchemeFoundations.Equivariant.test_point_group_ring [computation]: For X a point with O_X = Z and Γ = Z/2, Mod_Γ(O_X) is the category of Z[Z/2]-modules; the module Z with the sign action is an object not isomorphic t…
  test TauCeti.SchemeFoundations.Equivariant.test_hom_invariants [compatibility]: For F = G = O_X with trivial linearisation, Hom_Γ(F, G) = Γ(X, O_X)^Γ.
  test TauCeti.SchemeFoundations.Equivariant.test_not_action_category [non-example]: For Γ = Z acting on X = R by translation, the structure sheaf with its translation linearisation is an object of Mod_Γ(O_X) but not of Mathlib's Acti…
node SchemeAndStackFoundations:SF.2/equivariant-coinduction (construction): Induction and coinduction for equivariant modules
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.ind [constructor]: Ind(F) = ⊕_γ γ^*F with the permutation Γ-structure.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.coind [constructor]: Coind(F) = ∏_γ γ_*F with the permutation Γ-structure.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.indForgetAdj [universal-property]: Ind ⊣ forget.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forgetCoindAdj [universal-property]: forget ⊣ Coind.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.coind_injective [other]: Coind sends injective O_X-modules to injective equivariant modules.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget_injective [other]: forget sends injective equivariant modules to injective O_X-modules.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.unit_mono [characterisation]: The unit G → Coind(forget G) is a monomorphism.
  test TauCeti.SchemeFoundations.Equivariant.test_coind_trivial_group [degenerate]: For Γ = 1, Coind ≅ id.
  test TauCeti.SchemeFoundations.Equivariant.test_coind_point [computation]: For X a point with O = Z and Γ = Z/2, Coind(Z) = Z × Z with the swap action ≅ Z[Z/2].
  test TauCeti.SchemeFoundations.Equivariant.test_coind_global_sections [compatibility]: Γ(X, Coind F) ≅ Map(Γ, Γ(X, F)) as Γ-modules (product over γ of Γ(X, γ_*F) = Γ(X, F)).
  test TauCeti.SchemeFoundations.Equivariant.test_ind_ne_coind_infinite [non-example]: For Γ = Z and X a point, Ind(Z) = Z[Z] (finite support) differs from Coind(Z) = Map(Z, Z) (all functions); induction and coinduction differ for infin…
node SchemeAndStackFoundations:SF.2/coinduced-sections-acyclic (lemma): Sections of injective equivariant modules are acyclic for invariants
node SchemeAndStackFoundations:SF.2/equivariant-ext-spectral-sequence (theorem): Spectral sequence for equivariant Ext
-/
