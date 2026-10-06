/-
Suggested Lean forms for BP-ClassicalAdicEtaleCohomology--H4, layers H4–H5 of
“The classical analytic cohomology inputs to diamonds”. This file is not the
roadmap and is not exhaustive: the roadmap document is definitive. Its forms
help contributors and reviewers converge on names and signatures.
-/
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Comap
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import Mathlib.Algebra.Group.TypeTags.Basic
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic

/-!
The pinned libraries provide valuation spectra, Spa as a set, rational subsets,
and generic cohomology of an abelian sheaf on an already specified site. They
provide no ringed analytic adic-space category or analytic étale site. Consequently
this prototype types the valuation-set and additive connecting-map cores below.
Analytic hypotheses and signatures that require the missing carriers are omitted
explicitly in the final inventory; none is replaced by a proposition-valued field.
Every mathematical claim here remains unimplemented. The packet records the
actual source hypotheses, canonical suppliers, and limitations of each core.
-/

noncomputable section

open TauCeti ValuationSpectrum
open scoped ValuationSpectrum

namespace TauCeti.ClassicalAdic

namespace Radial

variable {A : Type*} [CommRing A] [TopologicalSpace A]

/-- Valuative closed-disc locus inside the inherited Spa set. -/
def closedDisc (Aplus : Subring A) (T b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | v.toValuativeRel.vle T b}

/-- The puncture removes the valuation support of the coordinate. -/
def puncturedDisc (Aplus : Subring A) (T b : A) : Set (Spv A) :=
  closedDisc Aplus T b ∩ {v | ¬ v.toValuativeRel.vle T 0}

/-- Weak inner and outer bounds, with an invertible coordinate on the locus. -/
def closedAnnulus (Aplus : Subring A) (T a b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | v.toValuativeRel.vle a T ∧
    v.toValuativeRel.vle T b ∧ ¬ v.toValuativeRel.vle T 0}

/-- Strict inequalities use the negation of reverse weak comparison at every rank. -/
def strictAnnulus (Aplus : Subring A) (T a b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | (¬ v.toValuativeRel.vle T a) ∧
    (¬ v.toValuativeRel.vle b T) ∧ ¬ v.toValuativeRel.vle T 0}

lemma mem_closedDisc (Aplus : Subring A) (T b : A) (v : Spv A) :
    v ∈ closedDisc Aplus T b ↔ v ∈ spa Aplus ∧ v.toValuativeRel.vle T b := by
  sorry

lemma mem_puncturedDisc (Aplus : Subring A) (T b : A) (v : Spv A) :
    v ∈ puncturedDisc Aplus T b ↔
      v ∈ closedDisc Aplus T b ∧ ¬ v.toValuativeRel.vle T 0 := by
  sorry

lemma mem_closedAnnulus (Aplus : Subring A) (T a b : A) (v : Spv A) :
    v ∈ closedAnnulus Aplus T a b ↔ v ∈ spa Aplus ∧
      v.toValuativeRel.vle a T ∧ v.toValuativeRel.vle T b ∧
        ¬ v.toValuativeRel.vle T 0 := by
  sorry

lemma mem_strictAnnulus (Aplus : Subring A) (T a b : A) (v : Spv A) :
    v ∈ strictAnnulus Aplus T a b ↔ v ∈ spa Aplus ∧
      (¬ v.toValuativeRel.vle T a) ∧ (¬ v.toValuativeRel.vle b T) ∧
        ¬ v.toValuativeRel.vle T 0 := by
  sorry

lemma closedDisc_eq_rational (Aplus : Subring A) (T : A) (b : Aˣ) :
    closedDisc Aplus T b = rationalSubset Aplus {T} b := by
  sorry

lemma closedAnnulus_eq_inter (Aplus : Subring A) (T : A) (a b : Aˣ) :
    closedAnnulus Aplus T a b =
      rationalSubset Aplus {T} b ∩ rationalSubset Aplus {(a : A)} T := by
  sorry

lemma closedAnnulus_subset_puncturedDisc (Aplus : Subring A) (T a b : A) :
    closedAnnulus Aplus T a b ⊆ puncturedDisc Aplus T b := by
  sorry

/-- Base change of the closed-disc core; the intersection expresses the domain Spa. -/
lemma baseChange {B : Type*} [CommRing B] [TopologicalSpace B]
    (Aplus : Subring A) (Bplus : Subring B) (φ : A →+* B)
    (hφ : Continuous φ) (hplus : ∀ a ∈ Aplus, φ a ∈ Bplus) (T b : A) :
    comap φ ⁻¹' closedDisc Aplus T b ∩ spa Bplus =
      closedDisc Bplus (φ T) (φ b) := by
  sorry

-- Radial.zero_coordinate: the origin lies on a disc and is absent from its puncture.
example (Aplus : Subring A) (b : Aˣ) (v : Spv A) (hv : v ∈ spa Aplus) :
    v ∈ closedDisc Aplus 0 b ∧ v ∉ puncturedDisc Aplus 0 b := by
  sorry

-- Radial.unit_radius: agreement with the pinned rational-subset definition.
example (Aplus : Subring A) (T : A) :
    closedDisc Aplus T 1 = rationalSubset Aplus {T} 1 := by
  sorry

-- Radial.equal_radii: a strict annulus is empty; its weak counterpart can contain a circle.
example (Aplus : Subring A) (T a : A) : strictAnnulus Aplus T a a = ∅ := by
  sorry

example (Aplus : Subring A) (T a : A) (v : Spv A) (hv : v ∈ spa Aplus)
    (haT : v.toValuativeRel.vle a T) (hTa : v.toValuativeRel.vle T a)
    (hT : ¬ v.toValuativeRel.vle T 0) : v ∈ closedAnnulus Aplus T a a := by
  sorry

/- -- Radial.classical_point: use the actual evaluation-valued classical point.
example {k : ℕ} {K : Type*} [CommRing K] [UniformSpace K] [IsUniformAddGroup K]
    [NonarchimedeanRing K] [CompleteSpace K] [T3Space K]
    (x : spa (Huber.powerBoundedSubring K)) (c : Fin k → K)
    (hc : ∀ i, IsPowerBounded (c i)) (i : Fin k) :
    (classicalPoint x c hc).1 ∈ closedDisc (Huber.powerBoundedSubring _)
      (Huber.weightedX _ Huber.isWeightFamily_one_weight i) 1 ↔
        x.1.toValuativeRel.vle (c i) 1 := by
  sorry

The signature above uses the exact pinned Polydisc module. It is omitted from
elaboration because that module has no object in the shared build. -/

lemma puncturedDisc_subset_closedDisc (Aplus : Subring A) (T b : A) :
    puncturedDisc Aplus T b ⊆ closedDisc Aplus T b := by
  sorry

lemma puncturedDisc_eq_diff (Aplus : Subring A) (T b : A) :
    puncturedDisc Aplus T b = closedDisc Aplus T b \ {v | v.toValuativeRel.vle T 0} := by
  sorry

lemma strictAnnulus_subset_closedAnnulus (Aplus : Subring A) (T a b : A) :
    strictAnnulus Aplus T a b ⊆ closedAnnulus Aplus T a b := by
  sorry

lemma strictAnnulus_vlt (Aplus : Subring A) (T a b : A) (v : Spv A) :
    v ∈ strictAnnulus Aplus T a b ↔ v ∈ spa Aplus ∧
      v.toValuativeRel.vlt a T ∧ v.toValuativeRel.vlt T b ∧
        ¬ v.toValuativeRel.vle T 0 := by
  sorry

/-- Analytic open-annulus set core, formed from a supplied rational exhaustion. -/
def openAnnulus (Aplus : Subring A) (T : A) (a b : ℕ → A) : Set (Spv A) :=
  ⋃ j, closedAnnulus Aplus T (a j) (b j)

lemma mem_openAnnulus (Aplus : Subring A) (T : A) (a b : ℕ → A) (v : Spv A) :
    v ∈ openAnnulus Aplus T a b ↔ ∃ j, v ∈ closedAnnulus Aplus T (a j) (b j) := by
  sorry

lemma closedAnnulus_subset_openAnnulus (Aplus : Subring A) (T : A)
    (a b : ℕ → A) (j : ℕ) :
    closedAnnulus Aplus T (a j) (b j) ⊆ openAnnulus Aplus T a b := by
  sorry

lemma openAnnulus_constant (Aplus : Subring A) (T a b : A) :
    openAnnulus Aplus T (fun _ ↦ a) (fun _ ↦ b) = closedAnnulus Aplus T a b := by
  sorry

/-- Analytic open-disc set core, with the exhaustion rather than a strict boundary predicate. -/
def openDisc (Aplus : Subring A) (T : A) (b : ℕ → A) : Set (Spv A) :=
  ⋃ j, closedDisc Aplus T (b j)

lemma mem_openDisc (Aplus : Subring A) (T : A) (b : ℕ → A) (v : Spv A) :
    v ∈ openDisc Aplus T b ↔ ∃ j, v ∈ closedDisc Aplus T (b j) := by
  sorry

lemma closedDisc_subset_openDisc (Aplus : Subring A) (T : A) (b : ℕ → A) (j : ℕ) :
    closedDisc Aplus T (b j) ⊆ openDisc Aplus T b := by
  sorry

lemma openDisc_constant (Aplus : Subring A) (T b : A) :
    openDisc Aplus T (fun _ ↦ b) = closedDisc Aplus T b := by
  sorry

-- Radial.puncture_zero: origin exclusion is not a convention about rank-one points.
example (Aplus : Subring A) (b : A) : puncturedDisc Aplus 0 b = ∅ := by
  sorry

-- Radial.puncture_unit: an invertible coordinate cannot vanish at a valuation point.
example (Aplus : Subring A) : puncturedDisc Aplus 1 1 = spa Aplus := by
  sorry

-- Radial.puncture_support: the support condition is necessary even inside the disc.
example (Aplus : Subring A) (T b : A) (v : Spv A)
    (hT : v.toValuativeRel.vle T 0) : v ∉ puncturedDisc Aplus T b := by
  sorry

-- Radial.annulus_zero: a weak upper bound alone must not admit the origin.
example (Aplus : Subring A) (a b : A) : closedAnnulus Aplus 0 a b = ∅ := by
  sorry

-- Radial.annulus_unit_circle: equal weak radii retain the circle.
example (Aplus : Subring A) : closedAnnulus Aplus 1 1 1 = spa Aplus := by
  sorry

-- Radial.annulus_rational: exact agreement with the pinned geometric set.
example (Aplus : Subring A) (T : A) (a b : Aˣ) :
    closedAnnulus Aplus T a b =
      rationalSubset Aplus {T} b ∩ rationalSubset Aplus {(a : A)} T := by
  sorry

-- Radial.strict_annulus_zero: strict bounds do not license a coordinate in the support.
example (Aplus : Subring A) (a b : A) : strictAnnulus Aplus 0 a b = ∅ := by
  sorry

-- Radial.strict_annulus_boundary: value-equivalence at an endpoint excludes a point.
example (Aplus : Subring A) (T a b : A) (v : Spv A)
    (hTa : v.toValuativeRel.vle T a) (haT : v.toValuativeRel.vle a T) :
    v ∉ strictAnnulus Aplus T a b := by
  sorry

-- Radial.open_annulus_constant: exhausting-family hypotheses are meaningful.
example (Aplus : Subring A) :
    openAnnulus Aplus 1 (fun _ ↦ 1) (fun _ ↦ 1) = spa Aplus := by
  sorry

-- Radial.open_annulus_zero: puncture persists at every stage.
example (Aplus : Subring A) (a b : ℕ → A) : openAnnulus Aplus 0 a b = ∅ := by
  sorry

-- Radial.open_annulus_stage: no rank-one reinterpretation of the union.
example (Aplus : Subring A) (T : A) (a b : ℕ → Aˣ) (v : Spv A) :
    v ∈ openAnnulus Aplus T (fun j ↦ a j) (fun j ↦ b j) ↔
      ∃ j, v ∈ rationalSubset Aplus {T} (b j) ∩
        rationalSubset Aplus {((a j : A))} T := by
  sorry

-- Radial.open_disc_constant: a constant family is a closed disc.
example (Aplus : Subring A) (T : A) :
    openDisc Aplus T (fun _ ↦ 1) = closedDisc Aplus T 1 := by
  sorry

-- Radial.open_disc_zero: the origin belongs to a disc exhaustion.
example (Aplus : Subring A) (b : ℕ → Aˣ) (v : Spv A) (hv : v ∈ spa Aplus) :
    v ∈ openDisc Aplus 0 (fun j ↦ b j) := by
  sorry

-- Radial.open_disc_rational: nearest existing notion at every stage.
example (Aplus : Subring A) (T : A) (b : ℕ → Aˣ) :
    openDisc Aplus T (fun j ↦ b j) = ⋃ j, rationalSubset Aplus {T} (b j) := by
  sorry

end Radial

section KummerCore

variable {A : Type*} [CommRing A] {H : Type*} [AddCommGroup H]

/-- The imported additive Kummer connecting homomorphism applied to a unit coordinate.
The analytic site, μₙ, and the actual connecting map belong to H0. -/
def annulusKummer (δ : Additive Aˣ →+ H) (T : Aˣ) : H :=
  δ (Additive.ofMul T)

/-- Naturality core, assuming the actual commuting square of connecting maps. -/
lemma annulusKummer_natural {B : Type*} [CommRing B] {H' : Type*} [AddCommGroup H']
    (δ : Additive Aˣ →+ H) (δ' : Additive Bˣ →+ H')
    (u : Aˣ →* Bˣ) (g : H →+ H')
    (commutes : ∀ T, g (δ (Additive.ofMul T)) = δ' (Additive.ofMul (u T)))
    (T : Aˣ) : g (annulusKummer δ T) = annulusKummer δ' (u T) := by
  sorry

lemma annulusKummer_pow (δ : Additive Aˣ →+ H) (T : Aˣ) (e : ℕ) :
    annulusKummer δ (T ^ e) = e • annulusKummer δ T := by
  sorry

lemma annulusKummer_mul_nthPower (δ : Additive Aˣ →+ H) (T u : Aˣ) (n : ℕ)
    (hn : n • annulusKummer δ u = 0) :
    annulusKummer δ (T * u ^ n) = annulusKummer δ T := by
  sorry

/-- Coordinate scaling core when the constant is exhibited as an n-th power. -/
lemma annulusKummer_coordinateScale (δ : Additive Aˣ →+ H) (T c u : Aˣ) (n : ℕ)
    (hc : c = u ^ n) (hn : n • annulusKummer δ u = 0) :
    annulusKummer δ (c * T) = annulusKummer δ T := by
  sorry

-- annulusKummer_one: connecting maps send the identity unit to zero.
example (δ : Additive Aˣ →+ H) : annulusKummer δ 1 = 0 := by
  sorry

-- annulusKummer_power: the actual pullback along T=S^e has this degree factor.
example (δ : Additive Aˣ →+ H) (S : Aˣ) (e : ℕ) :
    annulusKummer δ (S ^ e) = e • annulusKummer δ S := by
  sorry

-- annulusKummer_nthPower: n-torsion, not just a nonzero integer, is essential.
example (δ : Additive Aˣ →+ H) (T u : Aˣ) (n : ℕ)
    (hn : n • annulusKummer δ u = 0) :
    annulusKummer δ (T * u ^ n) = annulusKummer δ T := by
  sorry

-- annulusKummer_disc_origin: the coordinate vanishes at the disc origin.
-- The ring-theoretic obstruction is typed here; the analytic origin is supplied by R1/A2.
example {K : Type*} [Field K] (ev₀ : A →+* K) (T : A) (hT : ev₀ T = 0) :
    ¬ IsUnit T := by
  sorry

/- annulusKummer_degree is omitted: its genuine codomain H¹(A,μₙ) and the degree
isomorphism require H0's analytic site and H3's residue/degree construction.
An arbitrary additive map in this section does not supply that isomorphism. -/

end KummerCore

section Balls

variable {A : Type*} [CommRing A]

/-- Valuation-set core of the integer-radius ball system inside a supplied ambient set. -/
def radiusBall {m : ℕ} (X : Set (Spv A)) (t : A) (T : Fin m → A) (n : ℕ) :
    Set (Spv A) := X ∩ {v | ∀ i, v.toValuativeRel.vle (t ^ n * T i) 1}

lemma radiusBall_mem {m : ℕ} (X : Set (Spv A)) (t : A) (T : Fin m → A)
    (n : ℕ) (v : Spv A) : v ∈ radiusBall X t T n ↔
      v ∈ X ∧ ∀ i, v.toValuativeRel.vle (t ^ n * T i) 1 := by
  sorry

lemma radiusBall_zero {m : ℕ} (X : Set (Spv A)) (t : A) (T : Fin m → A) :
    radiusBall X t T 0 = X ∩ {v | ∀ i, v.toValuativeRel.vle (T i) 1} := by
  sorry

lemma radiusBall_mono {m : ℕ} (X : Set (Spv A)) (t : A) (T : Fin m → A)
    (ht : ∀ v ∈ X, v.toValuativeRel.vle t 1) (n : ℕ) :
    radiusBall X t T n ⊆ radiusBall X t T (n + 1) := by
  sorry

lemma radiusBall_dimensionZero (X : Set (Spv A)) (t : A) (n : ℕ) :
    radiusBall X t (Fin.elim0 : Fin 0 → A) n = X := by
  sorry

/- lemma radiusBall_polydisc (m : ℕ) (K : Type*) [CommRing K] [TopologicalSpace K]
    [NonarchimedeanRing K]
    (t : Huber.weightedRestrictedSubring (fun _ : Fin m ↦ ({1} : Set K))
      Huber.isWeightFamily_one_weight) :
    radiusBall (closedPolydisc m K) t
      (Huber.weightedX _ Huber.isWeightFamily_one_weight) 0 = closedPolydisc m K := by
  sorry

The pinned Spa.Polydisc module has no object in the shared build; this exact
baseline compatibility signature is omitted from elaboration. -/

lemma radiusBall_baseChange {B : Type*} [CommRing B] {m : ℕ}
    (X : Set (Spv A)) (Y : Set (Spv B)) (φ : A →+* B)
    (hXY : comap φ ⁻¹' X ∩ Y = Y) (t : A) (T : Fin m → A) (n : ℕ) :
    comap φ ⁻¹' radiusBall X t T n ∩ Y = radiusBall Y (φ t) (φ ∘ T) n := by
  sorry

-- radiusBall_no_coordinates: dimension zero, with no vacuous coordinate bound.
example (X : Set (Spv A)) (t : A) (n : ℕ) :
    radiusBall X t (Fin.elim0 : Fin 0 → A) n = X := by
  sorry

-- radiusBall_unit_scale: a unit scaling parameter does not force exhaustion.
example {m : ℕ} (X : Set (Spv A)) (T : Fin m → A) (n : ℕ) :
    radiusBall X 1 T n = radiusBall X 1 T 0 := by
  sorry

/- -- radiusBall_unit_polydisc: exact agreement with the existing set, not a new site.
example (m : ℕ) (K : Type*) [CommRing K] [TopologicalSpace K] [NonarchimedeanRing K]
    (t : Huber.weightedRestrictedSubring (fun _ : Fin m ↦ ({1} : Set K))
      Huber.isWeightFamily_one_weight) :
    radiusBall (closedPolydisc m K) t
      (Huber.weightedX _ Huber.isWeightFamily_one_weight) 0 = closedPolydisc m K := by
  sorry

The pinned Spa.Polydisc module has no object in the shared build; this exact
baseline compatibility signature is omitted from elaboration. -/

-- radiusBall_first_step: exponent one enlarges radius to |t|⁻¹.
example (X : Set (Spv A)) (t T : A) (v : Spv A) :
    v ∈ radiusBall X t (fun _ : Fin 1 ↦ T) 1 ↔
      v ∈ X ∧ v.toValuativeRel.vle (t * T) 1 := by
  sorry

/- radiusBall_exhaustive is omitted: topological nilpotence in an inherited analytic
coordinate chart is essential at higher-rank points. R1 supplies the analytic
ambient space and P5 supplies compatible p-power roots for rational exponents.
The set core alone does not imply exhaustion for arbitrary X. -/

end Balls

/-!
Named analytic theorem inventory, omitted because their actual types require
missing carriers, rather than represented as arbitrary propositions.

H4:
* tameDiscCover_trivial and tameAnnulusCover_kummer: finite tame étale Galois
  covers, with the taut/overconvergent restriction of H3's comparison.
* disc_cohomology and disc_compactSupport: RΓ and RΓ_c on analytic disc sites.
* annulus_cohomology, annulus_restrict_isIso and annulus_compactSupport: the same
  analytic site, a specified coordinate class, and H3's support/trace convention.
* puncturedDisc_cohomology and puncturedDisc_localization: puncture and the
  canonical support-triangle connecting map, supplied geometrically by A2.
* tameRootTower_annulus_acyclic: H0's colimit-presented site continuity and the
  actual ℓ-root field tower, with the additional higher-rank comparison gap.
* smooth_pushforwardShriek_constructible: H0 constructibility, H3 Rf_!, and
  R0's smooth separated qc analytic morphism; Ito's verified base is geometric.
* perfectoidBase_pullback_constructible and perfectoidBase_image_comparison:
  P6 finite-type approximation, H0 coefficient descent, and the requested
  nonnoetherian support comparison for the second assertion.
* radial_surjectiveFieldPair_invariance and annulus_geometricPlusRing: H2's
  exact surjective-pair condition and H1's missing specialization comparison.

H5:
* proper_analyticComparison: R1's scheme/adic fibre product, H0's site morphisms,
  bounded-below derived functors and H1's relative henselian comparison.
* proper_open_excision: those analytic sites and extension by zero on the two opens.
* finiteType_analyticComparison: constructible scheme sheaves, analytification,
  and H3:smooth-duality in every dimension in the characteristic-p proof.
* smoothAnalytic_cohomology_finite: H0 constructible sheaves on the actual analytic
  site; Mieda’s public proof verifies per-degree finiteness for smooth qcqs spaces.
* closedBall_finiteTotalCohomology: analytic cohomology, finite total Fℓ dimension,
  and the specific ball instance verified in ECD 27.2.
* ballRadius_restriction_isIso and affineSpace_ballCohomology: actual analytic
  restriction maps, H0 overconvergence, and E1's derived inverse limit.
* formalCurve_infinitesimalCompactification, formalCurve_extendCompactification,
  and smoothRigidCurve_localCompactification: R2 formal schemes/rig-étale maps,
  projective relative curves, and the complete-DVR/locality scope of Lut95.
* geometricCurve_properCompactification: the missing bridge from a discrete
  local theorem to a global qc geometric curve, explicitly a source gap.
* curveFrontier_finite, curveBoundary_directSummand, and
  curveCompactification_dualityReduction: A2's adic frontier topology and
  H3/E1's genuine analytic duality maps and cones; diamond Verdier duality is S6.
-/


/-
Omitted formal-curve definition and API inventory (Lut95 Definition 5.6).
These require R2's category of admissible formal schemes, its flat/projective
relative curves and generic-fibre functor. They cannot be typed as arbitrary
proposition fields. Their exact mathematical signatures appear in the document.

FormalCurve.IsSCompactifiable: existence of an open immersion into a flat
projective formal curve with smooth rigid fibres, over the actual open image U.
FormalCurve.compactification_data: extract that U, the completion and immersion.
FormalCurve.compactifiable_baseChange: compatible admissible formal base change.
FormalCurve.compactifiable_genericFibre: the genuine open/proper factorization.
Omitted examples FormalCurve.projective_curve, FormalCurve.affine_chart and
FormalCurve.generic_factorization: identity completion, formal projective-line
chart, and agreement with H3's generic-fibre compactifiable morphism.

FormalCurve.IsLocallySCompactifiable: every closed point of X₀ has an open
formal neighborhood admitting the preceding completion.
FormalCurve.local_compactification_at: choose the neighborhood at a closed point.
FormalCurve.compactifiable_isLocal: a global completion supplies local witnesses.
FormalCurve.local_compactifiable_open: restriction to a formal open subcurve.
Omitted examples FormalCurve.global_to_local, FormalCurve.local_chart and
FormalCurve.local_cover: projective curve, projective-line affine chart, and an
open cover with separate neighborhood completions. None requires one common
completion of the whole curve.
-/

end TauCeti.ClassicalAdic
