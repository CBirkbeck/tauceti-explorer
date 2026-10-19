import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.Topology.Inseparable
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Topology.Spectral.ConstructibleTopology
import Mathlib.Topology.Order.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.IsPullback.Basic
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryProducts
import Mathlib.CategoryTheory.Limits.Preserves.Basic
import Mathlib.CategoryTheory.MorphismProperty.Composition
import Mathlib.CategoryTheory.MorphismProperty.Limits

/-!
# Pro-étale descent, diamonds and small v-stacks, Part II: suggested signatures

This file is not the roadmap and is not exhaustive. The definitive mathematical roadmap is
`research/blueprint/readmes/DiamondsAndVStacksPartII.md`. The statements below suggest Lean forms so
that contributors and reviewers converge on names and signatures.

The pinned Mathlib and Tau Ceti have no perfectoid spaces, no v-sheaves and no diamonds, so most
targets of this roadmap are README targets; they are listed at the end of the file. What is typed
here is what the pins can state:

* Layer D7: the minimal-point lemma for quasicompact spaces over the spectrum of a valuation ring
  (Scholze–Weinstein, Lemma 18.3.2).
* Layer D8: formal adicness, formally closed immersions and formal separatedness, defined from an
  abstract adjunction `diamond ⊣ red` between a category `S` (standing for small scheme-theoretic
  v-sheaves) and a category `V` (standing for small v-sheaves), with a class of closed immersions
  of `V`. These are the definitions of Gleason, §3.2, applied to whatever categories the owners of
  v-sheaves supply.
* Layer D9: the specialization ideal `{a ∈ A⁺ : v(a) < 1}` of a valuation bounded by one on a
  subring (Gleason, Definition 4.1), at the level of a single valuation.
* Layer D11: density for the constructible topology (the condition behind constructibly Jacobson
  diamonds) and the topological core of Gleason's connected-components argument (Lemma 4.55),
  with the closed-specialization condition explicit. Its unrestricted source formulation remains
  a gap; the normality test by connected tubes is corrected in the README to algebraically closed
  residue fields (the unramified-order counterexample excludes merely perfect residue fields).
-/

namespace TauCetiRoadmap.DiamondsAndVStacksPartII

universe u v w

open CategoryTheory CategoryTheory.Limits Topology

/-! ## Layer D7: the minimal-point lemma -/

/-- Scholze–Weinstein, Lemma 18.3.2: the image of a nonempty quasicompact space in the spectrum of a
valuation ring has a unique point that is a specialization of every point of the image. -/
theorem ValuationRing.exists_unique_minimal_image (V : Type u) [CommRing V] [IsDomain V]
    [ValuationRing V] (Z : Type v) [TopologicalSpace Z] [CompactSpace Z] [Nonempty Z]
    (g : Z → PrimeSpectrum V) (hg : Continuous g) :
    ∃! z : PrimeSpectrum V, z ∈ Set.range g ∧ ∀ w ∈ Set.range g, w ⤳ z := by
  sorry

/-- For a field the image is its unique point. -/
example (K : Type u) [Field K] (Z : Type v) [TopologicalSpace Z] [CompactSpace Z] [Nonempty Z]
    (g : Z → PrimeSpectrum K) (hg : Continuous g) :
    ∃! z : PrimeSpectrum K, z ∈ Set.range g ∧ ∀ w ∈ Set.range g, w ⤳ z := by
  sorry

/-- For the identity of `Spec V` the minimal point of the image is the closed point. -/
example (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V]
    [CompactSpace (PrimeSpectrum V)] (z : PrimeSpectrum V)
    (hz : ∀ w : PrimeSpectrum V, w ⤳ z) :
    z.asIdeal = IsLocalRing.maximalIdeal V := by
  sorry

/-! ## Layer D8: formally adic maps for an adjunction `diamond ⊣ red` -/

namespace VSheaf

variable {S : Type u} {V : Type v} [Category.{w} S] [Category.{w} V]
variable {diamond : S ⥤ V} {red : V ⥤ S}

/-- Gleason, Definition 3.20: `f : F ⟶ G` is formally adic when the square formed by the counits
`(F^red)^⋄ → F`, `(G^red)^⋄ → G` and the maps `(f^red)^⋄`, `f` is a pullback square. -/
def FormallyAdic (adj : diamond ⊣ red) {F G : V} (f : F ⟶ G) : Prop :=
  IsPullback (adj.counit.app F) (diamond.map (red.map f)) f (adj.counit.app G)

/-- The square of `FormallyAdic` always commutes, by naturality of the counit. -/
theorem FormallyAdic.commSq (adj : diamond ⊣ red) {F G : V} (f : F ⟶ G) :
    CommSq (adj.counit.app F) (diamond.map (red.map f)) f (adj.counit.app G) := by
  sorry

/-- Isomorphisms are formally adic. -/
theorem FormallyAdic.of_isIso (adj : diamond ⊣ red) {F G : V} (f : F ⟶ G) [IsIso f] :
    FormallyAdic adj f := by
  sorry

/-- Gleason, Proposition 3.24(1): formally adic maps compose. -/
theorem FormallyAdic.comp (adj : diamond ⊣ red) {F G H : V} {f : F ⟶ G} {g : G ⟶ H}
    (hf : FormallyAdic adj f) (hg : FormallyAdic adj g) : FormallyAdic adj (f ≫ g) := by
  sorry

/-- Gleason, Proposition 3.24(2): base change preserves formal adicness, when `diamond` preserves
pullbacks (`red` does, being a right adjoint). -/
theorem FormallyAdic.baseChange (adj : diamond ⊣ red) [HasPullbacks V]
    [PreservesLimitsOfShape WalkingCospan diamond] {F G G' : V} {f : F ⟶ G} (h : G' ⟶ G)
    (hf : FormallyAdic adj f) : FormallyAdic adj (pullback.snd f h) := by
  sorry

/-- Test `formallyAdic_id`: the identity is formally adic. -/
example (adj : diamond ⊣ red) (F : V) : FormallyAdic adj (𝟙 F) := by
  sorry

/-- Gleason, Definition 3.27(1): a formally closed immersion is a closed immersion that is formally
adic, for a supplied class of closed immersions. -/
def FormallyClosed (adj : diamond ⊣ red) (IsClosedImmersion : MorphismProperty V) {F G : V}
    (f : F ⟶ G) : Prop :=
  IsClosedImmersion f ∧ FormallyAdic adj f

/-- Formally closed immersions compose, for a class of closed immersions stable under composition. -/
theorem FormallyClosed.comp (adj : diamond ⊣ red) (IsClosedImmersion : MorphismProperty V)
    [MorphismProperty.IsStableUnderComposition IsClosedImmersion] {F G H : V} {f : F ⟶ G} {g : G ⟶ H}
    (hf : FormallyClosed adj IsClosedImmersion f) (hg : FormallyClosed adj IsClosedImmersion g) :
    FormallyClosed adj IsClosedImmersion (f ≫ g) := by
  sorry

/-- Base changes of formally closed immersions are formally closed, for a class of closed
immersions stable under base change and `diamond` preserving pullbacks. -/
theorem FormallyClosed.baseChange (adj : diamond ⊣ red) (IsClosedImmersion : MorphismProperty V)
    [MorphismProperty.IsStableUnderBaseChange IsClosedImmersion] [HasPullbacks V]
    [PreservesLimitsOfShape WalkingCospan diamond] {F G G' : V} {f : F ⟶ G} (h : G' ⟶ G)
    (hf : FormallyClosed adj IsClosedImmersion f) :
    FormallyClosed adj IsClosedImmersion (pullback.snd f h) := by
  sorry

/-- Gleason, Definition 3.27(2): `F` is formally separated when its diagonal is a formally closed
immersion. -/
def FormallySeparated (adj : diamond ⊣ red) (IsClosedImmersion : MorphismProperty V) (F : V)
    [HasBinaryProduct F F] : Prop :=
  FormallyClosed adj IsClosedImmersion (diag F)

/-- Formally separated objects are separated: their diagonal is a closed immersion. -/
theorem FormallySeparated.isSeparated (adj : diamond ⊣ red)
    (IsClosedImmersion : MorphismProperty V) (F : V) [HasBinaryProduct F F]
    (hF : FormallySeparated adj IsClosedImmersion F) : IsClosedImmersion (diag F) := by
  sorry

/-- A formally closed subobject of a formally separated object is formally separated (the diagonal
of a monomorphic source is a base change of the diagonal of the target). -/
theorem FormallySeparated.of_formallyClosed (adj : diamond ⊣ red)
    (IsClosedImmersion : MorphismProperty V) [MorphismProperty.IsStableUnderBaseChange IsClosedImmersion]
    [MorphismProperty.IsStableUnderComposition IsClosedImmersion] [HasPullbacks V] [HasBinaryProducts V]
    [PreservesLimitsOfShape WalkingCospan diamond] {G F : V} (f : G ⟶ F) [Mono f]
    (hf : FormallyClosed adj IsClosedImmersion f) (hF : FormallySeparated adj IsClosedImmersion F) :
    FormallySeparated adj IsClosedImmersion G := by
  sorry

end VSheaf

/-! ## Layer D9: the specialization ideal of a valuation -/

section Specialization

variable {A : Type u} [CommRing A] {Γ₀ : Type v} [LinearOrderedCommMonoidWithZero Γ₀] [Nontrivial Γ₀]

/-- Gleason, Definition 4.1, at one point: for a valuation `v` bounded by one on the subring `A⁺`,
the ideal of elements of `A⁺` of value less than one. Its image in `Spec (A⁺/A⁺°°)` is the
specialization of the point `v`. -/
def specializationIdeal (v : Valuation A Γ₀) (Aplus : Subring A) (hv : ∀ a ∈ Aplus, v a ≤ 1) :
    Ideal Aplus where
  carrier := {a | v (a : A) < 1}
  add_mem' {a b} ha hb := by sorry
  zero_mem' := by sorry
  smul_mem' c a ha := by sorry

/-- Membership in the specialization ideal. -/
theorem mem_specializationIdeal (v : Valuation A Γ₀) (Aplus : Subring A)
    (hv : ∀ a ∈ Aplus, v a ≤ 1) (a : Aplus) :
    a ∈ specializationIdeal v Aplus hv ↔ v (a : A) < 1 := by
  sorry

/-- The specialization ideal is prime. -/
theorem specializationIdeal_isPrime (v : Valuation A Γ₀) (Aplus : Subring A)
    (hv : ∀ a ∈ Aplus, v a ≤ 1) : (specializationIdeal v Aplus hv).IsPrime := by
  sorry

/-- The support of `v` (inside `A⁺`) lies in the specialization ideal. -/
theorem supp_le_specializationIdeal (v : Valuation A Γ₀) (Aplus : Subring A)
    (hv : ∀ a ∈ Aplus, v a ≤ 1) (a : Aplus) (ha : (a : A) ∈ v.supp) :
    a ∈ specializationIdeal v Aplus hv := by
  sorry

/-- Test `specializationIdeal_one_not_mem`: the unit is never in the specialization ideal. -/
example (v : Valuation A Γ₀) (Aplus : Subring A) (hv : ∀ a ∈ Aplus, v a ≤ 1) :
    (1 : Aplus) ∉ specializationIdeal v Aplus hv := by
  sorry

/-- Test `specializationIdeal_unit_not_mem`: units of `A⁺` have value one and stay outside. -/
example (v : Valuation A Γ₀) (Aplus : Subring A) (hv : ∀ a ∈ Aplus, v a ≤ 1) (a : Aplusˣ) :
    (a : Aplus) ∉ specializationIdeal v Aplus hv := by
  sorry

end Specialization

/-! ## Layer D11: constructible density and the connected-components argument -/

section Components

variable {X : Type u} [TopologicalSpace X]

/-- The condition behind constructibly Jacobson diamonds (Gleason, Definition 4.44), for an abstract
predicate `P` standing for "is a rank-one point": the points satisfying `P` are dense for the
constructible topology. -/
def IsConstructiblyDense (P : X → Prop) : Prop :=
  @Dense X (constructibleTopology X) {x | P x}

/-- Dense for the constructible topology implies dense, when compact opens form a basis (as on the
locally spectral underlying spaces of locally spatial diamonds). -/
theorem IsConstructiblyDense.dense [PrespectralSpace X] {P : X → Prop} (h : IsConstructiblyDense P) :
    Dense {x | P x} := by
  sorry

/-- Test `isConstructiblyDense_univ`: the predicate satisfied everywhere is constructibly dense. -/
example : IsConstructiblyDense (fun _ : X ↦ True) := by
  sorry

/-- Test `isConstructiblyDense_sierpinski_not`: in the two-point Sierpiński space the open point
alone is not dense for the constructible topology, since the closed point is constructible. This is
the space of `Spa(C, C⁺)` for `C⁺` of rank two (Gleason, Example 4.43, and the check
`cJ_rank_two_not`). -/
example : ¬ IsConstructiblyDense (fun x : Prop ↦ x) := by
  sorry

/-- The topological core of Gleason, Lemma 4.55. Let `sp : X → Y` be a quotient map that is
specializing, such that every point of `Y` specializes to a closed point and the fibres over closed
points are preconnected. Then every clopen subset of `X` is the preimage of a clopen subset of
`Y`. -/
theorem clopen_eq_preimage_of_connected_closed_fibres {Y : Type v} [TopologicalSpace Y]
    (sp : X → Y) (hq : Topology.IsQuotientMap sp)
    (hspec : ∀ (x : X) (y : Y), sp x ⤳ y → ∃ x', x ⤳ x' ∧ sp x' = y)
    (hclosed : ∀ y : Y, ∃ y', y ⤳ y' ∧ IsClosed ({y'} : Set Y))
    (hfib : ∀ y : Y, IsClosed ({y} : Set Y) → IsPreconnected (sp ⁻¹' {y}))
    (U : Set X) (hU : IsClopen U) :
    ∃ W : Set Y, IsClopen W ∧ U = sp ⁻¹' W := by
  sorry

/-- Under the hypotheses above the induced map on connected components is surjective. -/
theorem connectedComponentsMap_surjective {Y : Type v} [TopologicalSpace Y]
    (sp : X → Y) (hq : Topology.IsQuotientMap sp) :
    Function.Surjective hq.continuous.connectedComponentsMap := by
  sorry

end Components

/-!
## Statements not typed at the pins

The following packet names are README targets: their carriers (perfectoid spaces, small v-sheaves,
diamonds, scheme-theoretic v-sheaves, formal schemes as pre-adic spaces, rigid generic fibres) are
not in the pinned Mathlib or Tau Ceti. They are grouped by layer and by the carrier they need.

Layer D7 (analytic pre-adic spaces over `Spa ℚ_p` and their diamonds):
`universalHomeomorphism_diamond_isIso`.
Layer D7 (v-sheaves of perfect schemes): `PerfectScheme.diamond`, `PerfectScheme.diamond_affine`,
`PerfectScheme.diamond_perfection`, `PerfectScheme.diamond_preservesFiniteLimits`,
`PerfectScheme.diamond_isOpenImmersion`, `PerfectScheme.diamond_isClosedImmersion`,
`PerfectScheme.diamond_eq_preAdic`, `PerfectScheme.diamond_fullyFaithful`,
`PerfectScheme.isVCover_iff_diamond_epi`, `PreAdic.diamond_hom_bijective_of_perfectDiscrete`;
tests `perfectScheme_diamond_point`, `perfectScheme_diamond_line`,
`perfectScheme_diamond_analytic_convention`, `perfectScheme_diamond_frobenius`,
`perfectScheme_diamond_empty`.
Layer D7 (olivine spectrum, which needs vertical generizations in Tau Ceti's `Spv`):
`Olivine.Spo`, `Olivine.h`, `Olivine.isOpen_classicalLoc`, `Olivine.isOpen_analyticLoc`,
`Olivine.fibre_card`, `Olivine.h_homeomorph_of_isTate`, `Olivine.Spo_completion`,
`Olivine.boundedLocus`, `Olivine.spdSpace_homeomorph`; tests `olivine_tate_pair`,
`olivine_powerSeries`, `olivine_point`, `olivine_not_spa`.
Layer D8 (scheme-theoretic v-sheaves; the abstract adjunction above stands for them):
`SchVSheaf`, `SchVSheaf.yoneda_fullyFaithful`, `SchVSheaf.extend_fullyFaithful`,
`SchVSheaf.hasFiniteLimits`, `SchVSheaf.space`, `SchVSheaf.space_perfectScheme`,
`SchVSheaf.space_quotient`, `SchVSheaf.space_surjective_of_epi`, `SchVSheaf.diamond`,
`SchVSheaf.diamond_perfectScheme`, `SchVSheaf.diamond_preservesFiniteLimits`,
`SchVSheaf.diamond_preservesColimits`, `VSheaf.red`, `VSheaf.diamondRedAdj`, `VSheaf.red_apply`,
`VSheaf.red_preservesLimits`, `VSheaf.red_counit`, `VSheaf.red_of_reduced`, `VSheaf.red_spd`,
`SchVSheaf.IsReduced`, `SchVSheaf.isReduced_perfectScheme`,
`SchVSheaf.diamond_fullyFaithful_of_isReduced`, `SchVSheaf.IsReduced.pullback`,
`VSheaf.FormallyAdic.red_diamond_eq`, `VSheaf.FormallyPAdic` (the typed `VSheaf.FormallyAdic`,
`VSheaf.FormallyClosed` and `VSheaf.FormallySeparated` above are stated for an abstract adjunction
and become the roadmap's notions when instantiated at `⋄ ⊣ red`); tests `schVSheaf_point`, `schVSheaf_empty`, `schVSheaf_not_all_schemes`,
`schVSheaf_space_point`, `schVSheaf_space_line`, `schVSheaf_space_empty`,
`schVSheaf_diamond_point`, `schVSheaf_diamond_empty`, `schVSheaf_diamond_not_diamond`,
`red_spdZp`, `red_spdQp`, `red_perfectScheme`, `red_formalPair`, `isReduced_point`,
`isReduced_empty`, `isReduced_compat_SW`, `isReduced_counit_spdZp`, `formallyAdic_spd_powerSeries`,
`formallyAdic_not_adic`, `formallyAdic_norm_to_discrete`, `formallyAdic_pAdic_formal`, `formallySeparated_spdZp`, `formallyClosed_special_fibre`,
`formallyClosed_origin`, `formallyClosed_not_formalNbhd`, `formallySeparated_empty`.
Layer D9 (specializing v-sheaves and prekimberlites): `Tate.sp`, `Tate.sp_isPrime` (the pointwise
form is `specializationIdeal_isPrime` above), `Tate.sp_continuous`, `Tate.sp_surjective`,
`Tate.sp_isSpectralMap`, `Tate.sp_natural`, `Tate.sp_homeomorph_of_strictlyTotallyDisconnected`,
`VSheaf.Formalizes`, `VSheaf.VFormalizing`, `VSheaf.VLocallyFormal`,
`VSheaf.vFormalizing_iff_vLocallyFormal`, `VSheaf.vFormalizing_spd_formal`,
`VSheaf.VFormalizing.of_epi`, `VSheaf.VFormalizing.red_nonempty`, `VSheaf.Specializing`,
`VSheaf.Specializing.pullback`, `VSheaf.specializing_spd_formal`,
`VSheaf.Specializing.unique_formalization`, `VSheaf.sp`, `VSheaf.sp_spd_formal`,
`VSheaf.sp_natural`, `VSheaf.sp_continuous`, `VSheaf.sp_red_points`, `VSheaf.Prekimberlite`,
`VSheaf.Prekimberlite.an`, `VSheaf.Prekimberlite.redScheme`,
`VSheaf.Prekimberlite.counit_formallyClosed`, `VSheaf.Prekimberlite.space_decomposition`,
`FormalScheme.diamond_prekimberlite`, `VSheaf.formalNbhd`, `VSheaf.formalNbhd_pullback`,
`VSheaf.formalNbhd_factor_iff`, `VSheaf.formalNbhd_prekimberlite`,
`VSheaf.formalNbhd_spd_completion`, `VSheaf.formalNbhd_univ`, `PerfectScheme.heuer`,
`PerfectScheme.heuer_affine`, `PerfectScheme.heuer_red`, `PerfectScheme.heuer_preservesFiniteLimits`,
`PerfectScheme.diamondToHeuer`, `PerfectScheme.heuer_totallyDisconnected`, `VSheaf.SP`,
`VSheaf.SP_space`, `VSheaf.formalNbhd_eq_pullback_SP`, `VSheaf.SP_isSeparated`, `VSheaf.SP_natural`,
`VSheaf.EtaleFormalNbhd`, `VSheaf.etaleFormalNbhdOf`, `VSheaf.etaleFormalNbhdOf_red`,
`VSheaf.EtaleFormalNbhd.hom_separated`, `VSheaf.etaleFormalNbhdOf_open`,
`VSheaf.etaleFormalNbhd_equivalence`; tests `tate_sp_field`, `tate_sp_rank_two`, `tate_sp_disc`,
`tate_sp_trivial`, `tate_sp_not_injective`, `vFormalizing_spdZp`, `vFormalizing_spdQp_not`,
`vFormalizing_scheme`, `vFormalizing_empty`, `specializing_spdZp`, `specializing_spdQp_not`,
`specializing_empty`, `specializing_point`, `sp_spdZp`, `sp_spd_disc`, `sp_empty`,
`sp_not_injective`, `prekimberlite_spdZp`, `prekimberlite_spd_formal`, `prekimberlite_diamond_not`,
`prekimberlite_empty`, `formalNbhd_origin_disc`, `formalNbhd_empty`, `formalNbhd_not_sp_preimage`,
`formalNbhd_compat_formal_completion`, `heuer_point`, `heuer_line`, `heuer_not_separated_formally`,
`heuer_empty`, `SP_spdZp`, `SP_formal_disc`, `SP_empty`, `SP_not_sp`, `etaleFormalNbhd_identity`,
`etaleFormalNbhd_finite_etale`, `etaleFormalNbhd_formal_scheme`, `etaleFormalNbhd_not_open`.
Layer D10 (schemes and formal schemes over `O_E` with their v-sheaves and rigid generic fibres):
`OScheme.diamondAn`, `OScheme.diamondFormal`, `OScheme.diamondFormal_eq_completion`,
`OScheme.diamondAn_eq_analytification`, `OScheme.formalToAn`, `OScheme.formalToAn_mono`,
`OScheme.formalToAn_isOpenImmersion`, `OScheme.formalToAn_isIso_of_proper`,
`FormalScheme.diamond_genericFibre`, `FormalScheme.global_eq_powerBounded`,
`VSheaf.isClosedImmersion_iff`, `VSheaf.vClosure`, `VSheaf.vClosure_isClosedImmersion`,
`VSheaf.vClosure_minimal`, `VSheaf.IsWeaklyGeneralizing`, `VSheaf.isWeaklyGeneralizing_range`,
`VSheaf.closedSubsheafEquiv`, `VSheaf.vClosure_space`, `VSheaf.vClosure_baseChange`,
`FormalScheme.specializationTriple_fullyFaithful`, `FormalScheme.diamond_fullyFaithful`,
`OScheme.diamond_fullyFaithful_of_proper`, `FormalScheme.diamond_fullyFaithful_of_awn`,
`OScheme.diamond_zariskiClosure_eq_vClosure`; tests `twoFunctors_affineLine`,
`twoFunctors_generic_algebra`, `twoFunctors_completion_invariance`, `twoFunctors_projective`,
`twoFunctors_empty`, `vClosure_open_disc`, `vClosure_closed`, `vClosure_not_topological_closure`,
`vClosure_rank_two_point`, `vClosure_generic_fibre_of_flat`.
Layer D11 (kimberlites; the topological core above is typed): `VSheaf.Valuative`,
`VSheaf.valuative_formalScheme`, `VSheaf.Valuative.of_partiallyProper`, `VSheaf.Valuative.formalNbhd`,
`VSheaf.Valuative.sp_specializing`, `VSheaf.SmeltedKimberlite`, `VSheaf.SmeltedKimberlite.sp`,
`VSheaf.SmeltedKimberlite.ofAn`, `VSheaf.SmeltedKimberlite.ofGenericFibre`,
`VSheaf.SmeltedKimberlite.sp_natural`, `VSheaf.Kimberlite`, `VSheaf.Kimberlite.iff_spatial_preimage`,
`VSheaf.Kimberlite.toSmelted`, `VSheaf.tube`, `VSheaf.tube_smelted`, `VSheaf.tube_space_eq_interior`,
`VSheaf.tube_isOpen`, `VSheaf.tube_pullback`, `VSheaf.SmeltedKimberlite.sp_isSpectralMap`,
`Diamond.IsConstructiblyJacobson` (the abstract `IsConstructiblyDense` above with rank-one points),
`Diamond.IsConstructiblyJacobson.of_surjective`, `Diamond.IsConstructiblyJacobson.of_isOpenImmersion`,
`Diamond.IsConstructiblyJacobson.of_etale`, `Diamond.IsConstructiblyJacobson.of_torsor`,
`Diamond.isConstructiblyJacobson_tft`, `Diamond.IsConstructiblyJacobson.rankOne_mem_open`,
`Diamond.HasEnoughFacets`, `Diamond.HasEnoughFacets.baseChange`, `Diamond.HasEnoughFacets.prod`,
`Diamond.HasEnoughFacets.isConstructiblyJacobson`, `Diamond.hasEnoughFacets_smooth`,
`VSheaf.SmeltedKimberlite.IsRich`, `VSheaf.Kimberlite.IsRich`,
`VSheaf.SmeltedKimberlite.IsRich.sp_surjective`, `VSheaf.SmeltedKimberlite.IsRich.formalNbhd`,
`VSheaf.SmeltedKimberlite.IsRich.etaleFormalNbhd`, `VSheaf.SmeltedKimberlite.IsTopologicallyNormal`,
`VSheaf.SmeltedKimberlite.IsTopologicallyNormal.tube_connected`,
`VSheaf.SmeltedKimberlite.IsTopologicallyNormal.formalNbhd`,
`VSheaf.SmeltedKimberlite.IsRich.sp_isQuotientMap`,
`VSheaf.SmeltedKimberlite.IsTopologicallyNormal.pi0_sp_bijective` (its topological core is
`clopen_eq_preimage_of_connected_closed_fibres` above), `VSheaf.PiAdicPrekimberlite`,
`VSheaf.PiAdicKimberlite`, `VSheaf.piAdicPrekimberlite_iff`, `VSheaf.piAdicKimberlite_iff`,
`VSheaf.PiAdicPrekimberlite.an_eq_genericFibre`, `VSheaf.PiAdicPrekimberlite.triple`,
`VSheaf.PiAdicKimberlite.sp_isClosedMap`, `VSheaf.PiAdicKimberlite.IsFlat`,
`VSheaf.isFlat_spd_of_integrallyClosed`, `VSheaf.isFlat_spd_finiteType`,
`VSheaf.PiAdicKimberlite.IsFlat.sp_surjective`,
`VSheaf.PiAdicKimberlite.isFlat_of_proper_of_sp_surjective`,
`VSheaf.PiAdicKimberlite.triple_fullyFaithful`; tests `valuative_spdZp`, `valuative_disc`,
`valuative_open_formalNbhd`, `valuative_empty`, `smelted_spdZp`, `smelted_formal_disc`,
`smelted_not_partially_proper`, `smelted_open_disc`, `smelted_empty`, `kimberlite_spdZp`,
`kimberlite_formal_disc`, `kimberlite_nonseparated_not`, `kimberlite_empty`,
`tube_formal_disc_origin`, `tube_rank_two_empty`, `tube_whole`, `tube_compat_berthelot`, `cJ_point`,
`cJ_ball`, `cJ_empty`, `facets_disc`, `facets_point`, `facets_rank_two_not`,
`rich_spdZp`, `rich_formal_tft`, `rich_nonflat_not`, `rich_rank_two_not`, `rich_empty`,
`topNormal_formal_disc`, `topNormal_two_branches_not`, `topNormal_spdZp`, `piAdic_spdO`,
`piAdic_formal_tft`, `piAdic_powerSeries_not`, `piAdic_perfect_discrete`, `piAdic_empty`,
`flat_spdO`, `flat_perfect_not`, `flat_higher_rank`, `flat_empty`.
-/

end TauCetiRoadmap.DiamondsAndVStacksPartII
