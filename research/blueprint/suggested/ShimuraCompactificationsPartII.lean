import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.SpinGroup
import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-!
# Toroidal compactifications and boundary geometry, Part II: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ShimuraCompactificationsPartII.md` is definitive; the statements
below suggest Lean forms for the few targets that can already be stated against the pinned
Mathlib and Tau Ceti, so that contributors and reviewers converge on names and signatures.
Every heavy object of the roadmap (Shimura varieties and their toroidal and minimal
compactifications, auxiliary Siegel data, 1-motives, log Dieudonné crystals, the semistable
comparison) has no carrier at the pins; these are README targets, listed at the end.

The only carrier used is Mathlib's relative normalization of a quasi-compact quasi-separated
morphism of schemes, `AlgebraicGeometry.Scheme.Hom.normalization`, which is the scheme case of
the normalized models of Layer C7 (README C7.5), together with elementary arithmetic and lattice
checks from Layers C7, C13 and C14.
-/

universe u

open CategoryTheory AlgebraicGeometry

namespace TauCetiRoadmap.ShimuraCompactificationsPartII

/-! ## Layer C7: normalized models (scheme case) -/

section Normalization

variable {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f] [QuasiSeparated f]

/-- README C7.5 (`NormalizedToroidalModel`), scheme case: the normalization of the auxiliary
model `Y` in the generic model `X` along `f`, the relative spectrum of the integral closure of
`𝒪_Y` in `f_* 𝒪_X`. For the roadmap, `Y` is the product of good Siegel toroidal models and `X`
the characteristic-zero toroidal compactification. -/
noncomputable abbrev NormalizedToroidalModel : Scheme.{u} := f.normalization

/-- README C7.5, `NormalizedToroidalModel.finite`: the structure map to the auxiliary model
(integral; finite once `Y` is Nagata and `X` of finite type, by `SchemeAndStackFoundations`). -/
noncomputable def NormalizedToroidalModel.toAux : NormalizedToroidalModel f ⟶ Y :=
  f.fromNormalization

/-- README C7.5, `NormalizedToroidalModel.generic`: the map from the generic model. -/
noncomputable def NormalizedToroidalModel.generic : X ⟶ NormalizedToroidalModel f :=
  f.toNormalization

instance NormalizedToroidalModel.isIntegralHom_toAux :
    IsIntegralHom (NormalizedToroidalModel.toAux f) := by
  unfold NormalizedToroidalModel.toAux; infer_instance

theorem NormalizedToroidalModel.generic_toAux :
    NormalizedToroidalModel.generic f ≫ NormalizedToroidalModel.toAux f = f :=
  f.toNormalization_fromNormalization

/-- README C7.5, `NormalizedToroidalModel.desc`: maps out of the normalized model into any
integral factorization of `f`. -/
noncomputable def NormalizedToroidalModel.desc {T : Scheme.{u}} (f₁ : X ⟶ T) (f₂ : T ⟶ Y)
    [IsIntegralHom f₂] (H : f = f₁ ≫ f₂) : NormalizedToroidalModel f ⟶ T :=
  f.normalizationDesc f₁ f₂ H

theorem NormalizedToroidalModel.generic_desc {T : Scheme.{u}} (f₁ : X ⟶ T) (f₂ : T ⟶ Y)
    [IsIntegralHom f₂] (H : f = f₁ ≫ f₂) :
    NormalizedToroidalModel.generic f ≫ NormalizedToroidalModel.desc f f₁ f₂ H = f₁ :=
  f.toNormalization_normalizationDesc f₁ f₂ H

/-- Test `NormalizedToroidalModel.identity_test` (degenerate case): if the generic model is
already integral over the auxiliary model, normalization changes nothing. -/
example [IsIntegralHom f] : IsIso (NormalizedToroidalModel.generic f) := by
  unfold NormalizedToroidalModel.generic; infer_instance

end Normalization

/-! ## Layer C7: induced cone decompositions need not be smooth -/

/-- The index-two lattice `B = {(a, b) : a ≡ b mod 2}` of the test
`inducedConeDecomposition_nonsmooth_test` (README C7.3). -/
def inducedTestLattice : AddSubgroup (ℤ × ℤ) :=
  AddMonoidHom.ker ((Int.castAddHom (ZMod 2)).comp
    (AddMonoidHom.fst ℤ ℤ - AddMonoidHom.snd ℤ ℤ))

/-- Test `inducedConeDecomposition_nonsmooth_test`: `(1, 1)` lies in `B` and in the quadrant,
but is not a nonnegative integral combination of the ray generators `(2, 0)` and `(0, 2)` of
the quadrant in `B`, so the induced cone is not smooth for `B`. -/
example : ((1 : ℤ), (1 : ℤ)) ∈ inducedTestLattice ∧
    ¬ ∃ m n : ℕ, ((1 : ℤ), (1 : ℤ)) = (2 * (m : ℤ), 2 * (n : ℤ)) := by
  refine ⟨by simp [inducedTestLattice], ?_⟩
  rintro ⟨m, n, h⟩
  simp only [Prod.mk.injEq] at h
  omega

/-! ## Layer C13: the Iwahori polarization degrees -/

/-- README C13.4 (`IwahoriNormalizedModel`), corrected degrees (sourceIssues E6): the factor
`A_{g+i}` of the Iwahori chain at level `p^n` carries a polarization of degree `d_i²`, with
`d_0 = 1` and `d_i = p^{n(g-i)}` for `1 ≤ i ≤ g`. -/
def iwahoriDegree (p n g i : ℕ) : ℕ := if i = 0 then 1 else p ^ (n * (g - i))

/-- Test `IwahoriNormalizedModel.degrees_test`: for `g = 2`, `n = 1` the squared degrees are
`1, p², 1`. -/
example (p : ℕ) : iwahoriDegree p 1 2 0 ^ 2 = 1 ∧ iwahoriDegree p 1 2 1 ^ 2 = p ^ 2 ∧
    iwahoriDegree p 1 2 2 ^ 2 = 1 := by
  simp [iwahoriDegree]

/-- Test `IwahoriNormalizedModel.g1_test`: in genus one both degrees are `1`. -/
example (p : ℕ) : iwahoriDegree p 1 1 0 = 1 ∧ iwahoriDegree p 1 1 1 = 1 := by
  simp [iwahoriDegree]

theorem iwahoriDegree_top (p n g : ℕ) : iwahoriDegree p n g g = 1 := by
  by_cases h : g = 0 <;> simp [iwahoriDegree, h]

/-! ## Layer C14: Klingen and paramodular level -/

/-- README C14.1 (`paramodularLattice`): `V_1 = p e_1 ℤ ⊕ e_2 ℤ ⊕ e_3 ℤ ⊕ e_4 ℤ ⊂ ℤ⁴`. -/
noncomputable def paramodularLattice (p : ℤ) : Submodule ℤ (Fin 4 → ℤ) :=
  Submodule.span ℤ {p • Pi.single 0 1, Pi.single 1 1, Pi.single 2 1, Pi.single 3 1}

/-- Test `paramodularLattice_notSelfDual_test`: for `p ≥ 2`, `V_1` is a proper sublattice
of `ℤ⁴` (of index `p`), so the restricted form is not perfect. -/
theorem paramodularLattice_ne_top (p : ℤ) (hp : 2 ≤ p) : paramodularLattice p ≠ ⊤ := sorry

/-- The number `(q + 1)(q² + 1)` of lines (equivalently, of Lagrangian planes) in a
four-dimensional symplectic space over `𝔽_q`: the degree of the Klingen projection and of the
`T_{p,2}`-correspondence over the interior generic fibre (README C14.1, C14.6). -/
def lagrangianCount (q : ℕ) : ℕ := (q + 1) * (q ^ 2 + 1)

/-- Test `TP2Correspondence.degree_test`. -/
example : lagrangianCount 2 = 15 := rfl

/-- Test `klingenGroup_index_test`: the number of lines in `𝔽_q⁴` is `(q⁴ - 1)/(q - 1)`. -/
theorem lagrangianCount_mul (q : ℕ) :
    ((q : ℤ) - 1) * (lagrangianCount q : ℤ) = (q : ℤ) ^ 4 - 1 := by
  simp only [lagrangianCount]; push_cast; ring

/-- Acceptance of README C14.1: the Klingen chain `G → G/H → G/H^⊥ → G` has degrees
`p, p², p` and composite of degree `p⁴ = deg [p]` on an abelian surface. -/
example (p : ℕ) : p * p ^ 2 * p = p ^ 4 := by ring

end TauCetiRoadmap.ShimuraCompactificationsPartII

/-! ## Targets not typed at the pins

The following packet names (definitions, API items and unit tests) are README targets: their
carriers (Shimura varieties of Hodge type and their toroidal and minimal compactifications,
auxiliary Siegel data, PEL moduli with lattice collections, 1-motives and their realizations,
log Dieudonné crystals, semistable comparison maps, Siegel and genus-two models over ℤ_p, GSpin
data) do not exist at the pinned Mathlib and Tau Ceti, so they are specified in the roadmap
document and not stated here. Theorems without a carrier are likewise README-only.

- README C7.1 (Auxiliary Siegel data for a Shimura datum): `AuxiliarySiegelDatum`, `AuxiliarySiegelDatum.genericMap`, `AuxiliarySiegelDatum.single`, `AuxiliarySiegelDatum.zarhin`, `AuxiliarySiegelDatum.union`, `AuxiliarySiegelDatum.restrictLevel`, `AuxiliarySiegelDatum.hecke`, `AuxiliarySiegelDatum.modularCurve_test`, `AuxiliarySiegelDatum.trivial_test`, `AuxiliarySiegelDatum.nonSelfDual_test`, `AuxiliarySiegelDatum.iwahori_test`
- README C7.3 (Induced cone decompositions): `inducedConeDecomposition`, `inducedConeDecomposition_admissible`, `inducedConeDecomposition_complete`, `inducedConeDecomposition_refine`, `inducedConeDecomposition_face`, `inducedConeDecomposition_siegel_test`, `inducedConeDecomposition_modular_test`
- README C7.5 (The normalized toroidal model): `NormalizedToroidalModel.proper_flat`, `NormalizedToroidalModel.interior`, `NormalizedToroidalModel.baseChange_etale`, `NormalizedToroidalModel.gamma0_test`, `NormalizedToroidalModel.compatible_test`, `NormalizedToroidalModel.notSmooth_test`
- README C7.8 (Normalized boundary towers and twisted torus embeddings): `NormalizedBoundaryTower`, `NormalizedBoundaryTower.torusEmbedding`, `NormalizedBoundaryTower.closedStratum`, `NormalizedBoundaryTower.generic`, `NormalizedBoundaryTower.conj`, `NormalizedBoundaryTower.siegel_test`, `NormalizedBoundaryTower.tate_test`, `NormalizedBoundaryTower.notTorsor_test`
- README C7.9 (Normalized strata of the toroidal model): `normalizedStratum`, `normalizedStratum_iso_closedStratum`, `normalizedStratum_generic`, `normalizedStratum_interior_test`, `normalizedStratum_cusp_test`, `normalizedStratum_notClosed_test`
- README C7.10 (Normalized models over the cyclotomic integers): `CyclotomicNormalizedModel`, `CyclotomicNormalizedModel.colimit`, `CyclotomicNormalizedModel.toBaseChange`, `CyclotomicNormalizedModel.normal_flat`, `CyclotomicNormalizedModel.trivial_test`, `CyclotomicNormalizedModel.notIso_test`, `CyclotomicNormalizedModel.notNoetherian_test`
- README C8.1 (PEL data with a collection of lattices): `PELLatticeCollection`, `PELLatticeCollection.moduli`, `PELLatticeCollection.aux`, `PELLatticeCollection.sub`, `PELLatticeCollection.toAuxiliarySiegel`, `PELLatticeCollection.singleton_test`, `PELLatticeCollection.parahoric_test`, `PELLatticeCollection.paramodular_test`, `PELLatticeCollection.notGood_test`
- README C8.2 (Normalized interior and minimal models): `PELNormalizedModel`, `PELNormalizedModel.family`, `PELNormalizedMinimal`, `PELNormalizedMinimal.ample`, `PELNormalizedMinimal.projective_normal_flat`, `PELNormalizedMinimal.good_test`, `PELNormalizedMinimal.modular_test`, `PELNormalizedModel.levelOnlyGeneric_test`
- README C8.4 (Putative boundary charts by normalization): `PutativeBoundaryChart`, `PutativeBoundaryChart.embedding`, `PutativeBoundaryChart.smooth_of_smoothCone`, `PutativeBoundaryChart.formalCompletion`, `PutativeBoundaryChart.generic`, `PutativeBoundaryChart.good_test`, `PutativeBoundaryChart.tate_test`, `PutativeBoundaryChart.nonsmooth_test`
- README C9.1 (Realizations of 1-motives): `OneMotive`, `OneMotive.torsion`, `OneMotive.tateModule`, `OneMotive.deRham`, `OneMotive.dual`, `OneMotive.betti`, `OneMotive.ofAbelian`, `OneMotive.tate_test`, `OneMotive.weight_test`, `OneMotive.abelian_test`, `OneMotive.notPure_test`
- README C9.4 (The log Dieudonné crystal of a degenerating abelian scheme): `LogDieudonneCrystal`, `LogDieudonneCrystal.weight`, `LogDieudonneCrystal.dual`, `LogDieudonneCrystal.deRham`, `LogDieudonneCrystal.good`, `LogDieudonneCrystal.residue`, `LogDieudonneCrystal.tate_test`, `LogDieudonneCrystal.good_test`, `LogDieudonneCrystal.notCrystal_test`
- README C9.6 (The canonical φ-module at a boundary point): `CanonicalPhiModule`, `CanonicalPhiModule.lieIso`, `CanonicalPhiModule.monodromy`, `CanonicalPhiModule.baerSum`, `CanonicalPhiModule.independent`, `CanonicalPhiModule.tate_test`, `CanonicalPhiModule.good_test`, `CanonicalPhiModule.positivity_test`
- README C11.1 (p-integral Hodge embeddings): `PIntegralHodgeEmbedding`, `PIntegralHodgeEmbedding.toAuxiliary`, `PIntegralHodgeEmbedding.sum`, `PIntegralHodgeEmbedding.tensors`, `PIntegralHodgeEmbedding.siegel_test`, `PIntegralHodgeEmbedding.paramodular_test`, `PIntegralHodgeEmbedding.unitary_test`
- README C12.1 (The Hodge line on the normalized toroidal model): `hodgeLine`, `hodgeLine_pullback_refinement`, `hodgeLine_independent`, `hodgeLine_boundary`, `hodgeLine_interior`, `hodgeLine_modular_test`, `hodgeLine_zeroDim_test`, `hodgeLine_notAmple_test`
- README C12.3 (Fourier–Jacobi expansions on Hodge-type models): `fourierJacobi`, `fourierJacobi_indep_cone`, `fourierJacobi_support`, `fourierJacobi_conj`, `fourierJacobi_constantTerm`, `fourierJacobi_modular_test`, `fourierJacobi_interior_test`, `fourierJacobi_negative_test`
- README C12.4 (The minimal compactification of Hodge type): `MinimalCompactification`, `MinimalCompactification.contraction`, `MinimalCompactification.ample`, `MinimalCompactification.stratum`, `MinimalCompactification.lift`, `MinimalCompactification.koecher`, `MinimalCompactification.modular_test`, `MinimalCompactification.siegel_test`, `MinimalCompactification.koecherFails_test`, `MinimalCompactification.compact_test`
- README C13.1 (Siegel moduli of polarization type δ): `siegelTypeLocus`, `siegelTypeLocus_generic`, `siegelTypeLocus_decomposition`, `siegelTypeLocus_level`, `siegelTypeLocus_principal_test`, `siegelTypeLocus_paramodular_test`, `siegelTypeLocus_typeTwo_test`, `siegelTypeLocus_notSmooth_test`
- README C13.2 (Toroidal models of Siegel varieties at arbitrary level at p): `DeepLevelToroidalModel`, `DeepLevelToroidalModel.interior`, `DeepLevelToroidalModel.normal_proper_flat`, `DeepLevelToroidalModel.strata`, `DeepLevelToroidalModel.cyclotomic`, `DeepLevelToroidalModel.hyperspecial_test`, `DeepLevelToroidalModel.trivial_test`, `DeepLevelToroidalModel.noBoundaryComponent_test`
- README C13.4 (The Iwahori-level normalized model and its isogeny chain): `IwahoriNormalizedModel.chain`, `IwahoriNormalizedModel.flag`, `IwahoriNormalizedModel.dual`, `IwahoriNormalizedModel.n0_test`
- README C14.1 (Klingen and paramodular level for GSp_4): `paramodularGroup`, `klingenGroup`, `klingenParamodular_collection`, `klingenChain`, `paramodularLattice_disc_test`
- README C14.2 (Klingen and paramodular boundary charts): `klingenChart`, `paramodularChart`, `goodConeDecomposition`, `goodConeDecomposition_cofinal`, `klingenChart_rank_test`, `paramodularChart_rankOne_test`, `goodConeDecomposition_smooth_test`
- README C14.6 (The compactified T_{p,2}-correspondence over ℤ_p): `TP2Correspondence`, `TP2Correspondence.isogeny`, `TP2Correspondence.generic`, `TP2Correspondence.degree`, `TP2Correspondence.interior_test`, `TP2Correspondence.notFinite_test`
- README C14.7 (Automorphic sheaves of genus two at Klingen and paramodular level): `genusTwoSheaf`, `genusTwoSheaf_cusp`, `genusTwoSheaf_refinement`, `genusTwoSheaf_cohomology_indep`, `genusTwoSheaf_canonicalExtension`, `genusTwoSheaf_rank_test`, `genusTwoSheaf_det_test`, `genusTwoSheaf_pullbackIdeal_test`
- README C14.8 (Minimal compactifications at Klingen and paramodular level): `paramodularMinimal`, `klingenMinimal`, `klingenMinimal_detDescends`, `klingenMinimal_finite_prankOne`, `klingenMinimal_prankOneLocus`, `paramodularMinimal_generic_test`, `klingenMinimal_boundaryDim_test`, `klingenMinimal_notFinite_test`
- README C15.1 (The GSpin Shimura datum and its Kuga–Satake embedding): `GSpinDatum`, `GSpinDatum.kugaSatake`, `GSpinDatum.integral`, `GSpinDatum.dim`, `GSpinDatum.spinGroup`, `GSpinDatum.n1_test`, `GSpinDatum.n2_test`, `GSpinDatum.n3_test`, `GSpinDatum.definite_test`
- Theorems stated in the README only: C7.2, C7.4, C7.6, C7.7, C8.3, C8.5, C8.6, C8.7, C8.8, C8.9, C8.10, C9.2, C9.3, C9.5, C9.7, C9.8, C10.1, C10.2, C10.3, C10.4, C10.5, C10.6, C10.7, C10.8, C10.9, C10.10, C10.11, C10.12, C10.13, C11.2, C11.3, C11.4, C11.5, C11.6, C12.2, C12.5, C12.6, C12.7, C13.3, C13.5, C13.6, C14.3, C14.4, C14.5, C14.9, C15.2, C15.3, C15.4.
-/
