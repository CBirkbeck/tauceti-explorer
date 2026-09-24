/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so that contributors and reviewers
can converge on names and signatures. They claim no implementation.

REV-DESIGN-LV: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The source checkouts have no compiled dependency modules. Elaboration has not been
established. Unavailable mathematical interfaces are omitted below, not encoded
as arbitrary propositions or assumed theorem fields. The packet records this gap.
-/
import Mathlib.LinearAlgebra.AffineSpace.AffineEquiv
import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Data.ZMod.Basic

noncomputable section
open scoped Affine

namespace TauCeti.LawrenceVenkatesh

-- LV.0/affine-group: the permutation image of the existing affine equivalences.
def affineGroup (q : ℕ) [Fact q.Prime] : Subgroup (Equiv.Perm (ZMod q)) where
  carrier := {f | ∃ e : ZMod q ≃ᵃ[ZMod q] ZMod q, e.toEquiv = f}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

namespace affineGroup
variable {q : ℕ} [Fact q.Prime]

def mk (a : (ZMod q)ˣ) (b : ZMod q) : affineGroup q := by sorry

theorem mk_apply (a : (ZMod q)ˣ) (b x : ZMod q) :
    (mk a b).val x = (a : ZMod q) * x + b := by sorry

theorem mk_inj (a a' : (ZMod q)ˣ) (b b' : ZMod q) :
    mk a b = mk a' b' ↔ a = a' ∧ b = b' := by sorry

def mulEquivAffineEquiv : affineGroup q ≃* (ZMod q ≃ᵃ[ZMod q] ZMod q) := by sorry

def linearPart : affineGroup q →* (ZMod q)ˣ := by sorry

theorem linearPart_mk (a : (ZMod q)ˣ) (b : ZMod q) :
    linearPart (mk a b) = a := by sorry

theorem ker_linearPart (f : affineGroup q) :
    f ∈ linearPart.ker ↔ ∃ b, f = mk 1 b := by sorry

theorem mk_mul_mk (a a' : (ZMod q)ˣ) (b b' : ZMod q) :
    mk a b * mk a' b' = mk (a * a') ((a : ZMod q) * b' + b) := by sorry

theorem inv_mk (a : (ZMod q)ˣ) (b : ZMod q) :
    (mk a b)⁻¹ = mk a⁻¹ (-((a⁻¹ : (ZMod q)ˣ) : ZMod q) * b) := by sorry

theorem card : Nat.card (affineGroup q) = q * (q - 1) := by sorry

theorem stabilizer_zero (f : affineGroup q) :
    f.val 0 = 0 ↔ ∃ a, f = mk a 0 := by sorry

theorem commutator_eq (a a' : (ZMod q)ˣ) (b b' : ZMod q) :
    mk a b * mk a' b' * (mk a b)⁻¹ * (mk a' b')⁻¹ =
      mk 1 (b * (1 - (a' : ZMod q)) - b' * (1 - (a : ZMod q))) := by sorry

theorem example_three : affineGroup 3 = ⊤ := by sorry

-- affineGroup.reviewTest1: (2,1)(3,4)=(1,4) in Aff(5).
example (a a' : (ZMod 5)ˣ) (ha : (a : ZMod 5) = 2)
    (ha' : (a' : ZMod 5) = 3) : mk a 1 * mk a' 4 = mk 1 4 := by sorry

-- affineGroup.reviewTest2: identity and inverse, including the translation term.
example (a : (ZMod q)ˣ) (b : ZMod q) :
    mk (1 : (ZMod q)ˣ) 0 = 1 ∧
    (mk a b)⁻¹ = mk a⁻¹ (-((a⁻¹ : (ZMod q)ˣ) : ZMod q) * b) := by sorry

-- affineGroup.reviewTest3: the faithful action is the whole six-element S₃.
example : affineGroup 3 = ⊤ ∧ Nat.card (affineGroup 3) = 6 := by sorry
end affineGroup

-- LV.6/legendre-family: reuse the existing Weierstrass carrier over any ring.
def legendreCurve {R : Type*} [CommRing R] (t : R) : WeierstrassCurve R where
  a₁ := 0
  a₂ := -(1 + t)
  a₃ := 0
  a₄ := t
  a₆ := 0

theorem legendreCurve.discriminant {R : Type*} [CommRing R] (t : R) :
    (legendreCurve t).Δ = 16 * t ^ 2 * (t - 1) ^ 2 := by sorry

theorem legendreCurve.isElliptic {R : Type*} [CommRing R] (t : R)
    (h₂ : IsUnit (2 : R)) (ht : IsUnit t) (ht₁ : IsUnit (t - 1)) :
    (legendreCurve t).IsElliptic := by sorry

theorem legendreCurve.j_eq {K : Type*} [Field K] (t : K)
    [(legendreCurve t).IsElliptic] :
    (legendreCurve t).j = 256 * (t ^ 2 - t + 1) ^ 3 / (t ^ 2 * (t - 1) ^ 2) := by sorry

theorem legendreCurve.j_one_seven_two_eight
    [(legendreCurve (-1 : ℚ)).IsElliptic]
    [(legendreCurve (2 : ℚ)).IsElliptic]
    [(legendreCurve (1 / 2 : ℚ)).IsElliptic] :
    (legendreCurve (-1 : ℚ)).j = 1728 ∧ (legendreCurve (2 : ℚ)).j = 1728 ∧
    (legendreCurve (1 / 2 : ℚ)).j = 1728 := by sorry

-- legendreCurve.reviewTest1: the actual coefficients determine both invariants.
example (t : ℚ) [(legendreCurve t).IsElliptic] :
    (legendreCurve t).Δ = 16 * t ^ 2 * (t - 1) ^ 2 ∧
    (legendreCurve t).j = 256 * (t ^ 2 - t + 1) ^ 3 / (t ^ 2 * (t - 1) ^ 2) := by sorry

-- legendreCurve.reviewTest2: the two roots give distinct rational components.
-- The scheme-theoretic disjoint-family identification awaits legendreVariant.
example : Nonempty (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (4 : ℚ)) ≃ₐ[ℚ]
    (ℚ × ℚ)) := by sorry

-- legendreCurve.reviewTest3: the excluded singular parameters.
example : (legendreCurve (0 : ℚ)).Δ = 0 ∧ (legendreCurve (1 : ℚ)).Δ = 0 ∧
    ¬ (legendreCurve (0 : ℚ)).IsElliptic ∧
    ¬ (legendreCurve (1 : ℚ)).IsElliptic := by sorry

end TauCeti.LawrenceVenkatesh

/-
Omitted interfaces, deliberately not replaced by axioms or Prop placeholders.
The packet remains needs_changes until these API signatures and their examples
are supplied against the owning libraries. Names here are an omission inventory,
not Lean declarations. Generic ownership and supplier contracts come first.

MordellLawrenceVenkatesh:LV.0/semilinear-centralizer
Planning API: semilinearCentralizer, mem_semilinearCentralizer, semilinearCentralizer_le_pow, units_semilinearCentralizer, semilinearCentralizer_linear, semilinearCentralizer_conj, semilinearCentralizer_scalar
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: semilinearCentralizer.reviewTest1, semilinearCentralizer.reviewTest2, semilinearCentralizer.reviewTest3

MordellLawrenceVenkatesh:LV.0/affine-group
Planning API: affineGroup, affineGroup.mk, affineGroup.mulEquivSemidirect, affineGroup.linearPart, affineGroup.ker_linearPart, affineGroup.mk_mul_mk, affineGroup.card, affineGroup.stabilizer_zero, affineGroup.commutator_eq, affineGroup.isPretransitive, affineGroup.example_three, affineGroup.mulEquivAffineEquiv
The concrete portion above is a partial prototype; semidirect/action and scheme-family interfaces remain incomplete.
Planning tests: affineGroup.reviewTest1, affineGroup.reviewTest2, affineGroup.reviewTest3

MordellLawrenceVenkatesh:LV.0/symplectic-transvection
Planning API: symplecticTransvection, symplecticTransvection_apply, symplecticTransvection_add, symplecticTransvection_smul, conj_symplecticTransvection, isUnipotent_symplecticTransvection, fixedPoints_symplecticTransvection, eq_symplecticTransvection_of_codim_one, symplecticTransvection_eq_transvection, symplecticTransvection_sl2
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: symplecticTransvection.reviewTest1, symplecticTransvection.reviewTest2, symplecticTransvection.reviewTest3

MordellLawrenceVenkatesh:LV.1/largest-cm-subfield
Planning API: largestCMSubfield, largestTotallyRealSubfield, largestTotallyRealSubfield_eq_maximalRealSubfield, le_largestCMSubfield_iff, isCMField_largestCMSubfield_iff, finrank_largestCMSubfield_div, largestCMSubfield_map, embeddings_eq_on_largestCMSubfield_iff, largestCMSubfield_cyclotomic
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: largestCMSubfield.reviewTest1, largestCMSubfield.reviewTest2, largestCMSubfield.reviewTest3

MordellLawrenceVenkatesh:LV.1/friendly-place
Planning API: IsFriendly, IsFriendly.isUnramified, isFriendly_iff_of_not_hasCMSubfield, isFriendly_iff_exists_decomposition, isFriendly_of_frobenius, isFriendly_map, isFriendly_rat
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: IsFriendly.reviewTest1, IsFriendly.reviewTest2, IsFriendly.reviewTest3

MordellLawrenceVenkatesh:LV.1/filtration-weight
Planning API: filtrationWeight, filtrationWeight_eq, filtrationWeight_det, filtrationWeight_directSum, filtrationWeight_restrictScalars, filtrationWeight_sub_quotient, filtrationWeight_twist, filtrationWeight_example
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: filtrationWeight.reviewTest1, filtrationWeight.reviewTest2, filtrationWeight.reviewTest3

MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family
Planning API: AbelianByFiniteFamily, AbelianByFiniteFamily.relDim, AbelianByFiniteFamily.total, AbelianByFiniteFamily.baseChange, AbelianByFiniteFamily.fibreAlgebra, AbelianByFiniteFamily.fibre, AbelianByFiniteFamily.ofAbelianScheme, AbelianByFiniteFamily.restrictScalars
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: AbelianByFiniteFamily.reviewTest1, AbelianByFiniteFamily.reviewTest2, AbelianByFiniteFamily.reviewTest3

MordellLawrenceVenkatesh:LV.2/good-model
Planning API: IsGoodModel, IsGoodModel.baseChange, IsGoodModel.integralPoints, IsGoodModel.fibre_goodReduction, IsGoodModel.deRham_locallyFree, IsGoodModel.of_polarizedAbelianScheme
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: IsGoodModel.reviewTest1, IsGoodModel.reviewTest2, IsGoodModel.reviewTest3

MordellLawrenceVenkatesh:LV.2/de-rham-bundle
Planning API: deRhamBundle, deRhamBundle.hodge, deRhamBundle.pairing, deRhamBundle.gaussManin, deRhamBundle.fibreEquiv, deRhamBundle.fibreDecomp, deRhamBundle.baseChange, deRhamBundle.eq_gaussManin_total, deRhamBundle.legendre
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: deRhamBundle.reviewTest1, deRhamBundle.reviewTest2, deRhamBundle.reviewTest3

MordellLawrenceVenkatesh:LV.2/residue-disk
Planning API: residueDisk, residueDisk.coords, residueDisk.coords_germ, residueDisk.mem_iff, residueDisk.coords_change, residueDisk.finiteEtale, residueDisk.cover, residueDisk.affineLine
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: residueDisk.reviewTest1, residueDisk.reviewTest2, residueDisk.reviewTest3

MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic
Planning API: gaussManinTransport, gaussManinTransport_self, gaussManinTransport_trans, gaussManinTransport_algebra, gaussManinTransport_pairing, gaussManinTransport_matrix, gaussManinTransport_indep, gaussManinTransport_pairs, gaussManinTransport_constant
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: gaussManinTransport.reviewTest1, gaussManinTransport.reviewTest2, gaussManinTransport.reviewTest3

MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex
Planning API: gaussManinTransportComplex, gaussManinTransportComplex_eq_parallel, gaussManinTransportComplex_series, gaussManinTransportComplex_trans, gaussManinTransportComplex_pairing, gaussManinTransportComplex_monodromy, gaussManinTransportComplex_legendre
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: gaussManinTransportComplex.reviewTest1, gaussManinTransportComplex.reviewTest2, gaussManinTransportComplex.reviewTest3

MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres
Planning API: crystallineFrobenius, crystallineFrobenius_semilinear, crystallineFrobenius_bijective, crystallineFrobenius_transport, crystallineFrobenius_factor, crystallineFrobenius_pairing, crystallineFrobenius_example
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: crystallineFrobenius.reviewTest1, crystallineFrobenius.reviewTest2, crystallineFrobenius.reviewTest3

MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian
Planning API: LagrangianGrassmannian, LagrangianGrassmannian.functor, LagrangianGrassmannian.mem_points_iff, LagrangianGrassmannian.chart, LagrangianGrassmannian.chart_cover, LagrangianGrassmannian.plucker, LagrangianGrassmannian.action, LagrangianGrassmannian.baseChange, LagrangianGrassmannian.dimOne
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: LagrangianGrassmannian.reviewTest1, LagrangianGrassmannian.reviewTest2, LagrangianGrassmannian.reviewTest3

MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety
Planning API: periodVariety, periodVariety.mem_iff, periodVariety.mem_points_iff_free, periodVariety.traceForm, periodVariety.baseChange, periodVariety.prodEquiv, periodVariety.semilinearAction, periodVariety.plucker, periodVariety.stableGrassmannian, periodVariety.dimOne
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: periodVariety.reviewTest1, periodVariety.reviewTest2, periodVariety.reviewTest3

MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group
Planning API: monodromyRep, algebraicMonodromyGroup, HasFullMonodromy, algebraicMonodromyGroup_le_normalizer, hasFullMonodromy_iff_basepoint, algebraicMonodromyGroup_deRham, HasFullMonodromy.orbit_eq, hasFullMonodromy_legendre
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: monodromyRep.reviewTest1, monodromyRep.reviewTest2, monodromyRep.reviewTest3

MordellLawrenceVenkatesh:LV.3/padic-period-map
Planning API: padicPeriodMap, padicPeriodMap_base, padicPeriodMap_mem, padicPeriodMap_transport, padicPeriodMap_rebase, padicPeriodMap_constant
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: padicPeriodMap.reviewTest1, padicPeriodMap.reviewTest2, padicPeriodMap.reviewTest3

MordellLawrenceVenkatesh:LV.3/complex-period-map
Planning API: complexPeriodMap, complexPeriodMap.lift, complexPeriodMap.lift_base, complexPeriodMap.lift_equivariant, complexPeriodMap.lift_holomorphic, complexPeriodMap.lift_eq, complexPeriodMap.mem, complexPeriodMap.legendre
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: complexPeriodMap.reviewTest1, complexPeriodMap.reviewTest2, complexPeriodMap.reviewTest3

MordellLawrenceVenkatesh:LV.5/surface
Planning API: Surface, Surface.genus, Surface.numBoundary, Surface.numPunctures, Surface.eulerChar_eq, Surface.intersectionForm, Surface.intersectionForm_perfect, SimpleClosedCurve, Surface.cut, Surface.examples
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: Surface.reviewTest1, Surface.reviewTest2, Surface.reviewTest3

MordellLawrenceVenkatesh:LV.5/mapping-class-group
Planning API: MappingClassGroup, MappingClassGroup.marked, MappingClassGroup.homologyRep, MappingClassGroup.actCurves, MappingClassGroup.actCovers, MappingClassGroup.forget, MappingClassGroup.examples
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: MappingClassGroup.reviewTest1, MappingClassGroup.reviewTest2, MappingClassGroup.reviewTest3

MordellLawrenceVenkatesh:LV.5/dehn-twist
Planning API: dehnTwist, dehnTwist_conj, dehnTwist_commute, dehnTwist_eq_one, dehnTwist_support, multitwist, dehnTwist_torus
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: dehnTwist.reviewTest1, dehnTwist.reviewTest2, dehnTwist.reviewTest3

MordellLawrenceVenkatesh:LV.5/point-push
Planning API: pointPush, pointPush_apply, forget_pointPush, pointPush_action, pointPush_homology, pointPush_torus
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: pointPush.reviewTest1, pointPush.reviewTest2, pointPush.reviewTest3

MordellLawrenceVenkatesh:LV.6/legendre-family
Planning API: legendreCurve, legendreCurve.isElliptic, legendreCurve.j_eq, legendreVariant, legendreVariant.isGoodModel, legendreVariant.fibreAlgebra, legendreVariant.analytic, legendreCurve.j_one_seven_two_eight
The concrete portion above is a partial prototype; semidirect/action and scheme-family interfaces remain incomplete.
Planning tests: legendreCurve.reviewTest1, legendreCurve.reviewTest2, legendreCurve.reviewTest3

MordellLawrenceVenkatesh:LV.7/size-v
Planning API: sizeV, sizeV_indep, sizeV_le_of_fibres, sizeV_mem_Icc, sizeV_scheme, sizeV_eq_places, sizeV_cycle
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: sizeV.reviewTest1, sizeV.reviewTest2, sizeV.reviewTest3

MordellLawrenceVenkatesh:LV.8/singly-ramified-surjections
Planning API: singlyRamifiedSurjections, singlyRamifiedSurjections.actLeft, singlyRamifiedSurjections.actRight, singlyRamifiedSurjections.quotient, singlyRamifiedSurjections.stabilizer_eq, singlyRamifiedSurjections.comap, singlyRamifiedSurjections.aff3
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: singlyRamifiedSurjections.reviewTest1, singlyRamifiedSurjections.reviewTest2, singlyRamifiedSurjections.reviewTest3

MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex
Planning API: hurwitzComplex, hurwitzComplex.fibre, hurwitzComplex.torsor, hurwitzComplex.localForm, hurwitzComplex.relativeCurve, hurwitzComplex.configuration, hurwitzComplex.aff3
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: hurwitzComplex.reviewTest1, hurwitzComplex.reviewTest2, hurwitzComplex.reviewTest3

MordellLawrenceVenkatesh:LV.8/reduced-prym
Planning API: reducedPrym, reducedPrym.isAbelianScheme, reducedPrym.polarization, reducedPrym.fibre, reducedPrym.baseChange, reducedPrym.dim, reducedPrym.example
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: reducedPrym.reviewTest1, reducedPrym.reviewTest2, reducedPrym.reviewTest3

MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family
Planning API: kodairaParshinCurves, kodairaParshin, kodairaParshin.relDim, kodairaParshin.exists_goodModel, kodairaParshin.fibreEquiv, kodairaParshin.fibreHomology, kodairaParshin.example
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: kodairaParshinCurves.reviewTest1, kodairaParshinCurves.reviewTest2, kodairaParshinCurves.reviewTest3

MordellLawrenceVenkatesh:LV.9/affine-cover
Planning API: AffineCover, AffineCover.cov, AffineCover.iso_iff, AffineCover.cycleType, SinglyRamified, SinglyRamified.genus, SinglyRamified.finite, SinglyRamified.modAction, SinglyRamified.example
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: AffineCover.reviewTest1, AffineCover.reviewTest2, AffineCover.reviewTest3

MordellLawrenceVenkatesh:LV.9/primitive-homology
Planning API: primitiveHomology, transfer, isCompl_primitiveHomology, primitiveHomology_eq_orthogonal, primitiveHomology.symplectic, primitiveHomology.equivariant, primitiveHomology.finrank, primitiveHomology.trivialCover
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: primitiveHomology.reviewTest1, primitiveHomology.reviewTest2, primitiveHomology.reviewTest3

MordellLawrenceVenkatesh:LV.9/lifted-monodromy
Planning API: liftMappingClass, liftMappingClass_unique, monodromyMap, stabilizerAll, pushSubgroup, monodromyMap.prod, monodromyMap_push_transfer, monodromyMap_twist, monodromyMap.example
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: liftMappingClass.reviewTest1, liftMappingClass.reviewTest2, liftMappingClass.reviewTest3

MordellLawrenceVenkatesh:LV.9/liftable-curve
Planning API: IsLiftable, IsLiftable.nonseparating, IsLiftable.liftPlus, IsLiftable.primitiveClass, IsLiftable.mon_twist, IsLiftable.inner_eq, IsLiftable.example
Not prototyped: requires the corrected common carrier, owner, or comparison listed in the packet gaps.
Planning tests: IsLiftable.reviewTest1, IsLiftable.reviewTest2, IsLiftable.reviewTest3

All other named theorem signatures are also pending those interfaces.
-/
