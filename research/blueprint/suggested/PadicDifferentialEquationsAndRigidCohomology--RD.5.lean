import Mathlib

/-!
# P-adic differential equations and rigid cohomology, layer RD.5 (follow-up part):
# representative target signatures

The roadmap document for this part is
`research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.5.md`; it is
definitive, and this file is not exhaustive. The statements below suggest Lean forms so that
contributors and reviewers converge on names and signatures. They use only carriers present at
the pins (Mathlib 082e2d3, Tau Ceti f790474): linear algebra over a field, formal Laurent
series, topological vector spaces. Rigid cohomology, overconvergent isocrystals, Le Stum's
overconvergent site, dagger spaces and the Robba ring with its LF topology are not at the pins;
their targets are listed at the end and specified in the roadmap.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD5

noncomputable section

/-! ## Indices of maps with finite-dimensional kernel and cokernel (RD.5b)

The dimension formula `dim H¹_rig = 2g + d − 1` for an affine curve is an index computation:
`ind(d) + ind(dρ) = ind(ρ) + ind(d_loc)` for the square of principal-part maps. -/

section Index

variable {K : Type*} [Field K]
variable {U V W : Type*} [AddCommGroup U] [Module K U] [AddCommGroup V] [Module K V]
  [AddCommGroup W] [Module K W]

/-- A linear map has finite index when its kernel and cokernel are finite dimensional. -/
def HasFiniteIndex (f : V →ₗ[K] W) : Prop :=
  FiniteDimensional K (LinearMap.ker f) ∧ FiniteDimensional K (W ⧸ LinearMap.range f)

/-- The index `dim ker f − dim coker f`. It is only meaningful under `HasFiniteIndex f`,
since `Module.finrank` of an infinite-dimensional space is `0`. -/
def finiteIndex (f : V →ₗ[K] W) : ℤ :=
  (Module.finrank K (LinearMap.ker f) : ℤ) - (Module.finrank K (W ⧸ LinearMap.range f) : ℤ)

/-- Index additivity for a composite of finite-index maps. -/
theorem finiteIndex_comp (f : U →ₗ[K] V) (g : V →ₗ[K] W)
    (hf : HasFiniteIndex f) (hg : HasFiniteIndex g) :
    HasFiniteIndex (g ∘ₗ f) ∧ finiteIndex (g ∘ₗ f) = finiteIndex f + finiteIndex g := by
  sorry

/-- The square identity used for curves: if `b ∘ a = d ∘ c` and all four maps have finite
index, then `ind a + ind b = ind c + ind d`. -/
theorem finiteIndex_square {X : Type*} [AddCommGroup X] [Module K X]
    (a : U →ₗ[K] V) (b : V →ₗ[K] X) (c : U →ₗ[K] W) (d : W →ₗ[K] X)
    (hsq : b ∘ₗ a = d ∘ₗ c) (ha : HasFiniteIndex a) (hb : HasFiniteIndex b)
    (hc : HasFiniteIndex c) (hd : HasFiniteIndex d) :
    finiteIndex a + finiteIndex b = finiteIndex c + finiteIndex d := by
  sorry

/-- An isomorphism has index zero. -/
example (e : V ≃ₗ[K] W) : finiteIndex (e : V →ₗ[K] W) = 0 := by
  sorry

/-- The zero map `K² → K` has kernel of dimension 2 and cokernel of dimension 1. -/
example : finiteIndex (0 : (Fin 2 → K) →ₗ[K] K) = 1 := by
  sorry

end Index

/-! ## The dimension formula for affine curves (RD.5b) -/

/-- `dim H¹_rig` of a smooth geometrically irreducible affine curve whose smooth
compactification has genus `g` and whose boundary has degree `d ≥ 1`. -/
def affineCurveH1Dim (g d : ℕ) : ℕ := 2 * g + d - 1

/-- The affine line. -/
example : affineCurveH1Dim 0 1 = 0 := rfl

/-- The multiplicative group. -/
example : affineCurveH1Dim 0 2 = 1 := rfl

/-- An elliptic curve minus its origin. -/
example : affineCurveH1Dim 1 1 = 2 := rfl

/-- The index bookkeeping: `ind ρ = 1 − g`, `ind d_loc = −d`, `ind dρ = g − 1` and
`H⁰ = K` give `1 − dim H¹ = (1 − g) + (−d) − (g − 1)`. -/
theorem affineCurve_index_identity (g d : ℕ) (hd : 1 ≤ d) :
    (1 : ℤ) - affineCurveH1Dim g d = (1 - g) + (-(d : ℤ)) - ((g : ℤ) - 1) := by
  sorry

/-! ## The local residue pairing (RD.5c)

On the Robba ring the pairing `⟨f, g⟩ = Res(f g dx/x)` is the constant term of `f g`. Formal
Laurent series (finite principal part) are the algebraic model available at the pins; the
analytic duality (`robbaResidueDuality`) needs the Robba ring with its LF topology. -/

section LocalPairing

variable (K : Type*) [Field K]

/-- The constant-term pairing on formal Laurent series. -/
def localPairing (f g : LaurentSeries K) : K := (f * g).coeff 0

variable {K}

/-- The pairing is symmetric. -/
theorem localPairing_comm (f g : LaurentSeries K) : localPairing K f g = localPairing K g f := by
  sorry

/-- Dual monomials: `⟨x^n, x^{-n}⟩ = 1`. -/
example (n : ℤ) :
    localPairing K (HahnSeries.single n (1 : K)) (HahnSeries.single (-n) 1) = 1 := by
  sorry

/-- Non-example: the constant-term pairing is not the coefficient of `x⁻¹`; the monomial
`x⁻¹` pairs to zero with `1`. -/
example : localPairing K (HahnSeries.single (-1) (1 : K)) 1 = 0 := by
  sorry

end LocalPairing

/-! ## Residues of rank-one logarithmic connections and nilpotence (RD.5e) -/

section Residues

/-- The arithmetic residue criterion for a rank-one overconvergent log connection.
The README imposes convergence; this rational predicate alone does not supply it. -/
def RankOneResidueUnipotent (a : ℚ) : Prop := ∃ n : ℤ, a = n

example : RankOneResidueUnipotent 0 := ⟨0, by simp⟩

/-- The Kummer residue `1/2` is not unipotent. -/
example : ¬ RankOneResidueUnipotent (1 / 2) := by
  sorry

/-- Pulling back along `s ↦ s^m` multiplies the residue by `m`; for `a ∈ (1/m)ℤ` the pullback
is unipotent (semistable reduction of a Kummer isocrystal). -/
theorem rankOneResidueUnipotent_pullback (a : ℚ) (m : ℕ) (hm : 0 < m)
    (ha : ∃ n : ℤ, a = n / m) : RankOneResidueUnipotent (m * a) := by
  sorry

variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
  [FiniteDimensional K V]

/-- A residue conjugate to `q` times itself, with `q ≥ 2`, is nilpotent. This is the
linear Frobenius special case; the README gives the isometric semilinear argument. -/
theorem isNilpotent_of_conj_eq_smul (q : ℕ) (hq : 2 ≤ q) (N : Module.End K V)
    (e : V ≃ₗ[K] V) (h : e.conj N = (q : K) • N) : IsNilpotent N := by
  sorry

end Residues

/-! ## Strict maps (RD.5c) -/

section Strict

variable {K : Type*} [NontriviallyNormedField K]
variable {V W : Type*} [AddCommGroup V] [Module K V] [TopologicalSpace V]
  [AddCommGroup W] [Module K W] [TopologicalSpace W]

/-- A continuous linear map is strict when it is open onto its image. -/
def IsStrictMap (f : V →L[K] W) : Prop :=
  IsOpenMap (fun v : V => (⟨f v, ⟨v, rfl⟩⟩ : LinearMap.range (f : V →ₗ[K] W)))

/-- The identity is strict. -/
example : IsStrictMap (ContinuousLinearMap.id K V) := by
  sorry

/-- Strictness of a surjection is openness. -/
theorem isStrictMap_of_surjective_iff (f : V →L[K] W) (hf : Function.Surjective f) :
    IsStrictMap f ↔ IsOpenMap f := by
  sorry

end Strict

/-! ## Graded dimensions under Künneth (RD.5c) -/

/-- The degree-`n` dimension of a tensor product of graded spaces with dimensions `a`, `b`. -/
def gradedTensorDim (a b : ℕ → ℕ) (n : ℕ) : ℕ :=
  ∑ i ∈ Finset.range (n + 1), a i * b (n - i)

/-- `H*_rig(G_m) = (1, 1)`, so `H*_rig(G_m × G_m) = (1, 2, 1)`. -/
example : gradedTensorDim (fun i => if i ≤ 1 then 1 else 0)
    (fun i => if i ≤ 1 then 1 else 0) 1 = 2 := by
  decide

example : gradedTensorDim (fun i => if i ≤ 1 then 1 else 0)
    (fun i => if i ≤ 1 then 1 else 0) 2 = 1 := by
  decide

end

/-!
## Roadmap targets requiring additional carriers

This accepted target-level pass retains the seven gaps and four supplier requests in the README.
Shiho comparison uses crystalline isocrystals without an assumed integral lattice. Pan finiteness
is C-valued and levelwise. The source issues E501 and E502 are recorded in the packet/reader;
no statement in this file depends on the uncorrected source formulas.

The following definitions and constructions of this part live in the roadmap, with their full
statements, API outlines and checks. Their carriers (rigid cohomology, overconvergent and
convergent (log-)isocrystals, Le Stum's overconvergent site, tubes and dagger spaces) are not at
the pins, so no placeholder carrier represents them here. The API and check names are the ones
the roadmap uses.

* Le Stum's overconvergent site of a variety (RD.5/overconvergent-site).
  API: OverconvergentSite, OverconvergentSite.realization, OverconvergentSite.functorial,
  OverconvergentSite.crystal_iff_realisations, OverconvergentSite.crystals_on_variety,
  OverconvergentSite.restriction_closed, OverconvergentSite.crystal_pullback_id_comp,
  OverconvergentSite.crystal_tensor_dual, OverconvergentSite.realization_ext.
  Module transition maps use ringed pullback with extension of scalars.
  Checks: overconvergentSite_point_sections, overconvergentSite_affineLine_sections,
  overconvergentSite_not_etale_site, overconvergentSite_realisation_covers,
  overconvergentSite_ringed_pullback.
* Berthelot's trace morphism on top-degree compact-support rigid cohomology
(RD.5/rigid-trace-morphism).
  API: rigidTrace, rigidTrace_frobenius, rigidTrace_openImmersion, rigidTrace_finiteEtale,
  rigidTrace_gysin, rigidTrace_crystalline, rigidTrace_baseChange,
  rigidTrace_isIso_of_geomIrreducible.
  Checks: rigidTrace_point, rigidTrace_affineLine, rigidTrace_twoPoints,
  rigidTrace_untwisted_nonexample, rigidTrace_proper_crystalline,
  rigidTrace_finiteScalar_normalisation.
  Scalar descent uses normalised field trace; crystalline compatibility assumes perfect k.
* The duality morphism ψ_{Z,X} and its morphism of distinguished triangles
(RD.5/supported-duality-morphism).
  API: dualityMorphism, dualityMorphism_triangle, dualityMorphism_finiteEtale,
  dualityMorphism_gysin, gysin_dual_of_restriction, dualityMorphism_crystalline,
  dualityMorphism_frobenius, dualityMorphism_cupProduct.
  Finite etale adjunction uses compact-support pullback; Gysin uses shift 2r and twist (-r).
  Checks: dualityMorphism_point, dualityMorphism_affineLine_degree0,
  dualityMorphism_gm_triangle, dualityMorphism_no_shift_nonexample.
* Künneth pairings on product tubes and the Künneth morphisms with supports
(RD.5/kunneth-pairing-on-tubes).
  API: kunnethPairingTube, kunnethMorphismSupports, kunnethMorphismCompact,
  kunnethMorphism_triangle, kunnethMorphism_trace, kunnethMorphism_gysin,
  kunnethMorphism_frobenius, kunnethMorphism_rigidTrace.
  Checks: kunnethMorphism_point, kunnethMorphism_affinePlane_top, kunnethMorphism_gm_square,
  kunnethMorphism_supports_nonexample.
* Constant and unipotent monodromy along a boundary divisor; docile isocrystals
(RD.5/unipotent-monodromy-along-boundary).
  API: HasUnipotentMonodromy, HasUnipotentMonodromy.subquotient,
  HasUnipotentMonodromy.tensor_dual, HasUnipotentMonodromy.zariski_local,
  HasUnipotentMonodromy.of_dense_open_boundary, HasConstantMonodromy.of_convergent_extension,
  HasUnipotentMonodromy.baseField, Docile.rankOne_unramified.
  Checks: docile_constant, docile_kummer_nonexample, docile_kummer_pullback,
  docile_dwork_nonexample, docile_tensor.
* Convergent log-isocrystals on a smooth pair (RD.5/convergent-log-isocrystal).
  API: ConvergentLogIsocrystal, ConvergentLogIsocrystal.toLogNablaModule,
  ConvergentLogIsocrystal.residue, ConvergentLogIsocrystal.restrict,
  ConvergentLogIsocrystal.noBoundary, ConvergentLogIsocrystal.nilpotentResidues,
  ConvergentLogIsocrystal.pullback_id_comp, ConvergentLogIsocrystal.tensor_unit_dual,
  ConvergentLogIsocrystal.ofStratification.
  Checks: convergentLogIsocrystal_empty_boundary, convergentLogIsocrystal_residue_computation,
  convergentLogFIsocrystal_nilpotent, convergentLogIsocrystal_not_overconvergent_nonexample,
  convergentLogIsocrystal_integrable_not_convergent.
  Rank-one log convergence is checked for residues in Z_p; integrability alone is insufficient.

The theorems of this part, stated in the roadmap and not expressible at the pins:

* Overconvergent isocrystals are crystals on the overconvergent site, with the same cohomology
(RD.5/overconvergent-site-comparison).
* Modifications are universally of cohomological descent for overconvergent crystals
(RD.5/modification-cohomological-descent).
* Finite flat and fppf coverings are universally of cohomological descent for finitely presented
crystals (RD.5/fppf-cohomological-descent).
* Proper surjections are universally of cohomological descent for finitely presented crystals
(RD.5/proper-surjection-cohomological-descent).
* The descent spectral sequence of rigid cohomology for proper hypercoverings
(Chiarellotto–Tsuzuki, Tsuzuki) (RD.5/proper-hypercover-descent-spectral-sequence).
* Homomorphisms out of overconvergent germs are sections supported on the tube (Berthelot, Lemme
2.1) (RD.5/overconvergent-germ-hom-lemma).
* Compact-support Gysin maps and their compatibility with the lift-dependent traces
(RD.5/compact-support-gysin-and-trace).
* Top compact-support cohomology of a geometrically irreducible variety is one-dimensional
(RD.5/top-degree-dimension-one).
* Traces along finite étale maps and the averaging projector
(RD.5/finite-etale-trace-projector).
* Rigid cohomology commutes with arbitrary extension of the base field
(RD.5/rigid-cohomology-base-field-extension).
* Lifting a smooth projective curve with its boundary points, and the algebraic generic fibre
(RD.5/curve-lift-with-boundary).
* Mayer–Vietoris sequences for a dagger curve and its boundary discs
(RD.5/dagger-curve-mayer-vietoris).
* The indices of the principal-part maps and the dimension of H^1 of an affine curve
(RD.5/principal-parts-index-computation).
* Kedlaya's finite projections to projective space étale off the hyperplane at infinity
(RD.5/projection-etale-off-hyperplane).
* Log-rigid cohomology of a curve with unipotent monodromy equals rigid cohomology of the
complement (RD.5/log-rigid-comparison-for-curves).
* Acceptance: finite-level Igusa rigid cohomology with Sym^k coefficients is finite dimensional
(RD.5/igusa-theta-cokernel-finite).
* A space that is both Fréchet and the strong dual of a reflexive Fréchet space is finite
dimensional (RD.5/frechet-and-dual-frechet-finite).
* Strictness of a linear map and of its transpose (RD.5/strictness-transpose-criteria).
* Topological local duality: the Robba ring is the strong dual of its differentials under the
residue pairing (RD.5/robba-topological-residue-duality).
* The plus and minus parts of the Robba ring and their mutual duality
(RD.5/robba-plus-minus-duality).
* Finite rigid and dagger cohomology for smooth quasi-projective integral models and their
boundary strata (RD.5/finiteness-for-smooth-quasi-projective-models).
* Relative convergent cohomology equals rational relative crystalline cohomology, and is perfect
(RD.5/relative-convergent-crystalline-comparison).
* Higher direct images of convergent F-isocrystals under smooth proper morphisms (Xu)
(RD.5/convergent-direct-image-smooth-proper).
* Smooth proper direct images of crystals in perfect complexes underlying F-isocrystals
(Guo–Reinecke) (RD.5/convergent-direct-image-perfect-complexes).
* Kedlaya's extension theorem: constant monodromy is the obstruction to extending an
overconvergent isocrystal (RD.5/extension-across-boundary).
* Restriction of F-isocrystals to a dense open is fully faithful, and closed under subquotients
in the overconvergent case (RD.5/dense-open-restriction-fully-faithful).
* Logarithmic extension of isocrystals with unipotent monodromy
(RD.5/log-extension-of-unipotent-isocrystal).
* Kedlaya's semistable reduction theorem for overconvergent F-isocrystals
(RD.5/global-semistable-reduction).
* Acceptance: docility of the Kummer and Dwork isocrystals and their semistable reduction
(RD.5/docility-acceptance).
-/

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD5
