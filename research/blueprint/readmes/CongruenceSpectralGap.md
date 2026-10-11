# Automorphic spectral theory and trace distributions, Part II: the congruence spectral gap

For every congruence subgroup of the projective modular group, the positive spectral bottom of the curvature −1 hyperbolic Laplacian is at least 21/100. The positive spectral bottom includes the continuous spectrum. In the customary notation it is λ′₁=min(λ₁,1/4), with value 1/4 when there is no positive discrete eigenvalue below 1/4. The theorem is the unconditional Luo–Rudnick–Sarnak bound, not Selberg’s conjectural value 1/4. The purpose of this roadmap is to construct the correctly normalized quotient operator and connect its spectrum to the full prime-twist argument that proves the numerical bound.

The main analytic result is more general than the final GL₂ application. If π is unitary cuspidal on GLm over ℚ, m≥2, and π∞ is spherical for O(m), write its standard infinite factor as ∏jΓℝ(s−μj). Then |Re μj|≤1/2−1/(m²+1). An exceptional weight-zero GL₂ eigenfunction has λ=1/4−r². Its adjoint lift is cuspidal GL₃ with real parameters 2r,0,−2r, so the m=3 bound gives r≤1/5 and λ≥21/100. The lift is Ad(π)=Sym²(π)⊗ωπ⁻¹. Removing the central character and excluding the monomial case are part of this reduction; neither unrestricted functoriality nor a holomorphic symmetric-square theorem replaces them.

The proof of the parameter bound uses a finite first moment of twisted Rankin–Selberg functions. A rightmost real pole of the self-pair infinite factor forces every even prime twist to have a finite L-function zero at the same real point. The average of those values has a nonzero main term sufficiently far to the right. Its dual contribution is bounded through an exact Gauss-power identity and the existing Deligne hyper-Kloosterman bound. This contradiction supplies the parameter inequality. The first moment proves existence of a nonzero twist; it supplies neither positivity of individual twisted values nor nonvanishing of every twist.

## Conventions and ownership

Use the existing congruence predicate on subgroups Γ≤SL₂(ℤ): there is a nonzero natural level N with Γ(N)≤Γ. The action on ℍ factors through an effective subgroup of PSL₂(ℤ), and the geometric quotient is the orbit quotient of this action. A subgroup containing −I has an ineffective central kernel. A fundamental-domain argument that retains that kernel as if the action were free almost everywhere produces the wrong counting. Remove the kernel by passing to the permutation image before forming a measurable fundamental domain. The resulting orbit space is canonically the same as the raw Γ orbit space.

The upstairs metric is ds²=(dx²+dy²)/y² and its area measure is dA=dxdy/y². Its curvature is −1. The positive operator is Δ=−y²(∂x²+∂y²), the negative of the div-grad convention for laplaceBeltrami in DifferentialGeometry. The Hilbert space is the existing complex Lp space at p=2 for the quotient measure, with equality of functions understood almost everywhere. On smooth functions the form is the complex Dirichlet pairing; in upper-half-plane coordinates its diagonal is ∫(|∂xu|²+|∂yu|²)dxdy. Finite area puts constants in L². Remove the whole complex constant subspace, rather than only imposing a real-part mean condition.

At elliptic points, smoothness means an invariant smooth lift in the finite quotient chart. Coarse holomorphic coordinates alone do not make the hyperbolic orbifold metric smooth. Cusps are complete finite-area ends, not boundaries at which a Dirichlet condition is imposed. The Friedrichs construction starts from compactly supported smooth lifts and closes their energy. Cutoff approximation at the cusps places the constant function in that closure and in the operator kernel. A compactified curve endowed with an independently chosen smooth metric is a different spectral problem. The theorem concerns the complete hyperbolic orbifold metric and its associated closed energy.

FuchsianOrbifolds owns projective actions, quotient charts, cusp coordinates and covolume. This roadmap adds the adapter to an actual quotient L² operator, not a new Fuchsian quotient theory. Current DifferentialGeometry supplies gradient, Green identity and Riemannian volume; the current Tau Ceti comparison UpperHalfPlane.riemannianVolume_eq_volume identifies the upstairs hyperbolic volume with the existing Mathlib measure. Current PDE supplies local weak derivatives and Euclidean energy estimates. Its real H¹₀ Dirichlet problem is a local tool, not the global cusp-orbifold realization.

Current OperatorTheory/SelfAdjointSpectralTheory owns partial-operator spectral measures, functional calculus and Rayleigh comparisons. The generic additional closed-form/Friedrichs representation contract belongs to an OperatorTheory Part II. AS.0 is the automorphic adapter to those targets. AS.4 owns spectral orthosums, residual classification and Eisenstein wave packets. The required specialization is at arbitrary congruence level, with its scattering matrix and one channel for every cusp. A displayed level-one, one-cusp expansion does not discharge that contract. In particular the constants-only residual assertion is an input to the classical exceptional dictionary, not a consequence of calling every small eigenvalue cuspidal.

AutomorphicFormsOnReductiveGroups supplies native local and global representations, adelization, constituent extraction and real generic unitary classification. AutomorphicLFunctionsAndLocalFactors supplies completed functions, local factors, continuation, functional equations and the exact conductor conventions. Generic all-prime self-pair coefficient positivity and local character-twist transport remain with AL.3. Complex gamma strip estimates remain with AL.1. The existing GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift supplies the Gelbart–Jacquet lift, including its self-twist branch. This roadmap specializes its real parameters and imports its proof obligations. It does not construct a second lift or a second GL₃ converse theorem.

FiniteFieldsAndCharacterSums:FF.2 supplies the hyper-Kloosterman sum over unit tuples and its unnormalized bound. ArithmeticDirichletSeries Layers 6 and 9 supply partial summation and the full Wiener–Ikehara theorem. AnalyticNumberTheory supplies divisor subpower estimates and the prime number theorem. These imports are mathematical contracts with their own hypotheses. The complete unsmoothed positive-coefficient asymptotic is required; an available smoothed Tauberian limit is not substituted for it.

All proposed local names use the namespace TauCeti.CongruenceSpectralGap. The notation μΓ denotes quotientMeasure, Δ denotes quotientLaplacian, HΓ denotes its complex L² space, and HΓ⁰ denotes meanZero. For Rankin–Selberg functions d=m², fπ is the standard conductor, f is the self-pair conductor, A is the infinite self-pair factor and β₀ is twice the largest real standard parameter. The two conductors have distinct roles: q∤fπ selects unramified πq, whereas f appears in the completed self-pair equation.

## Dependency contracts

The six layers below state their mathematical targets, direct dependencies, proof outlines and acceptance cases. Each definition has an API that makes it usable without unfolding it, and tests chosen to distinguish nearby wrong conventions. Every source statement is restated in our own words. Exact source locators accompany the targets; original mathematical sources are linked at the end.

The closed-form contract includes a dense nonnegative form, uniqueness of its associated self-adjoint partial operator, an operator-domain form core and equality of the two Rayleigh infima. The geometry adapter must establish density and closability through invariant charts and cusp cutoff sequences. The spectral contract includes all congruence levels, finite small spectrum, the constants-only residual subspace, absence of singular continuous spectrum and identification of the continuous interval. The adelic adapter passes first to principal level and then to Γ-invariants; it must not assume that every arithmetic subgroup is already a Γ₀ nebentypus space.

GlobalNumberFields Layer 9 supplies the unique real shift and unitary-part decomposition of a Hecke character; this is the exact global input in the monomial exclusion.

The generic self-pair contract includes ramified coefficients, a positive residue and pole-subtracted boundary continuity for the Tauberian theorem. The local twist contract includes ramified πp at p≠q and the degree-m² epsilon power at q. The gamma contract includes meromorphic pole orders and polynomial strip bounds, so that contour shifts have controlled horizontal edges. The existing adjoint supplier retains its highly ramified twist converse and metaplectic analytic inputs. These precise obligations are recorded in the packet; a theorem statement in an imported plan is not an implementation claim.

## CSG.0 — Congruence quotient and positive spectrum

The orbit measure is constructed before the operator. Its total mass is finite and positive, so integration is a continuous complex-linear functional on HΓ. The form-domain infimum and the operator-domain infimum describe the same positive spectral bottom. Keep the scalar clipped convention separate: it handles the empty small-spectrum set without inventing a cusp eigenfunction. The spectral description then identifies that scalar convention with the geometric Rayleigh quantity.

The main proof obligation in the operator construction is chartwise closability. If smooth functions tend to zero in L² and their gradients converge in L², test the putative gradient limit against compactly supported vector fields. Integration by parts makes the limit zero. Perform this in invariant elliptic charts and patch it using the imported local geometry. In a cusp, move the cutoff farther out while controlling its hyperbolic energy; this preserves constants in the energy closure. Self-adjointness alone does not identify this particular realization.

### Hyperbolic quotient measure

**quotientMeasure.** On XΓ=Γ\ℍ use its quotient measurable space. quotientMeasure Γ is p₍*₎(dA restricted to F), where p:ℍ→XΓ, dA=y⁻² dx dy and F is a measurable fundamental domain for the effective projective group. It is independent of F, finite and nonzero.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

Construction or proof: Use the Fuchsian effective action, fundamental domain and covolume contracts; the kernel ±I cannot be retained in the acting group of IsFundamentalDomain. Identify the effective orbit quotient with the raw Γ orbit quotient and transport the existing quotient measure. Apply quotientMeasure_eq to show independence. Finite index from IsCongruenceSubgroup.finiteIndex gives positive finite covolume; level one has mass π/3.

The API consists of:

- **quotientMeasure_eq_map.** For any IsFundamentalDomain of the effective permutation image, μΓ is the map of volume restricted to that domain.
- **quotientMeasure_finite.** μΓ(XΓ)<∞.
- **quotientMeasure_proof_irrel.** Changing the proof of IsCongruenceSubgroup does not change μΓ.

Unit tests:

- **quotientMeasure.level_one.** For Γ(1), μΓ(XΓ).toReal=π/3.
- **quotientMeasure.nonzero.** μΓ(XΓ)>0 for every allowed Γ.
- **quotientMeasure.domain_independence.** Two effective measurable fundamental domains have equal hyperbolic area.

Direct dependencies: mathlib:CongruenceSubgroup.IsCongruenceSubgroup; mathlib:CongruenceSubgroup.IsCongruenceSubgroup.finiteIndex; mathlib:MulAction.orbitRel.Quotient; mathlib:MulAction.toPermHom; mathlib:UpperHalfPlane.volume_def; mathlib:MeasureTheory.IsFundamentalDomain.quotientMeasure_eq; tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action; tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups.

Source: fuchsian, Layers 0 and 2, effective quotient and covolume targets — Imports quotient geometry and adds its L² measure adapter.

### Positive orbifold Laplacian

**quotientLaplacian.** quotientLaplacian Γ is the nonnegative self-adjoint Friedrichs realization of −y²(∂x²+∂y²) on L²(XΓ,μΓ). Start on compactly supported orbifold-smooth functions (smooth invariant lifts at elliptic charts), close their Dirichlet energy q(u,v)=∫⟨∇u,∇v⟩dA, and use the associated operator. Its kernel consists exactly of constants.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

Construction or proof: Import ordinary gradient, volume and Green identity from current DifferentialGeometry, and local weak derivatives from current PDE/Sobolev; descend through the Fuchsian isometric orbifold charts. Density uses a locally finite partition and cusp truncations. Closability follows by testing a candidate gradient limit against compactly supported vector fields in each chart; finite isotropy averaging preserves the test core. Apply the requested generic closed-form representation/Friedrichs extension, then the existing LinearPMap self-adjoint API. Cut off constants far into each cusp with energy tending to zero. Zero energy forces local constancy and connectedness forces a single constant.

The API consists of:

- **quotientLaplacian_selfAdjoint.** The partial complex-linear map equals its adjoint.
- **quotientLaplacian_dense_domain.** Its operator domain is dense in L².
- **quotientLaplacian_nonnegative.** For every u in its domain, Re⟨u,Δu⟩≥0.
- **quotientLaplacian_kernel_constants.** For u in the domain, Δu=0 iff u equals a complex constant almost everywhere.

Unit tests:

- **quotientLaplacian.zero.** Δ0=0.
- **quotientLaplacian.constant.** The L² class of the constant 1 is in the domain and Δ1=0.
- **quotientLaplacian.sign.** If Δu≠0 then Re⟨u,Δu⟩>0; the opposite sign convention fails.

Direct dependencies: CongruenceSpectralGap:CSG.0/quotient-measure; mathlib:MeasureTheory.Lp; mathlib:LinearPMap; tauceti:IsSelfAdjoint.isFormalAdjoint; tauceti:LinearPMap.IsFormalAdjoint.im_inner_self_apply; tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts; tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates; AutomorphicSpectralTheory:AS.0.

Source: teschl, §2.3, Theorems 2.12–2.13, pp.70–72 — Generic Friedrichs and closed-form representation, specialized to the imported orbifold charts; the orbifold density and cusp arguments are explicit local obligations.

### Mean-zero Hilbert subspace

**meanZero.** meanZero Γ is ker(u↦∫XΓ u dμΓ), a closed complex submodule of L²(XΓ,μΓ). It is the orthogonal complement of the constants and reduces the self-adjoint operator.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

Construction or proof: Use finite measure and Cauchy–Schwarz to bound the integral by μΓ(XΓ)^(1/2)‖u‖₂. Its continuous complex-linear kernel is closed. Constants lie in the operator kernel, so self-adjointness gives ∫Δu=0 for every u in the domain. The spectral calculus restricts to this orthogonal complement.

The API consists of:

- **mem_meanZero_iff.** u∈meanZero iff its complex integral is zero.
- **meanZero_isClosed.** meanZero is closed in the L² topology.
- **meanZero_laplacian_invariant.** Δu∈meanZero for every operator-domain u.

Unit tests:

- **meanZero.zero.** 0 belongs to meanZero.
- **meanZero.constant_rejection.** The almost-everywhere constant 1 does not belong to meanZero.
- **meanZero.imaginary_constant_rejection.** The almost-everywhere constant i does not belong; taking only a real mean fails.

Direct dependencies: CongruenceSpectralGap:CSG.0/quotient-laplacian; CongruenceSpectralGap:CSG.0/quotient-measure; mathlib:MeasureTheory.Lp.

Source: teschl, §4.3, pp.117–119, restriction to orthogonal complements — Mean-zero restriction is the orthogonal-complement case of the Rayleigh construction.

### Positive spectral bottom

**spectralGap.** spectralGap Γ=inf{Re⟨u,Δu⟩/‖u‖₂² : 0≠u∈Dom Δ ∩ meanZero}. The set is nonempty and bounded below by zero. It equals the infimum on the closed form domain, and lies in [0,1/4].

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

Construction or proof: Dense operator domain and its constant projection give nonzero mean-zero vectors. Nonnegativity gives a lower bound. Import self-adjoint spectral calculus from current OperatorTheory through AS.0. The spectral infimum equals both operator-domain and form-domain Rayleigh infima. Use the requested all-level GL₂ spectral description to get continuous spectrum beginning at 1/4; this provides Weyl sequences and the upper bound.

The API consists of:

- **spectralGap_eq_sInf.** Equals the infimum of the explicitly displayed nonzero mean-zero operator-domain Rayleigh values.
- **spectralGap_nonnegative.** 0≤spectralGap Γ.
- **spectralGap_le_threshold.** spectralGap Γ≤1/4.

Unit tests:

- **spectralGap.noncongruence_rejection.** If Γ is not a congruence subgroup there is no N≠0 with Γ(N)≤Γ; the exported theorem requires this witness.
- **spectralGap.constant_excluded.** A mean-zero domain vector killed by Δ is zero.
- **spectralGap.continuous_threshold.** For real t, 1/4≤1/4+t²; the continuous parameter never supplies a smaller value.

Direct dependencies: CongruenceSpectralGap:CSG.0/mean-zero; CongruenceSpectralGap:CSG.0/quotient-laplacian; AutomorphicSpectralTheory:AS.0; AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion; AutomorphicSpectralTheory:AS.4.

Source: teschl, §4.3, Theorem 4.10, pp.118–119 — Rayleigh infimum includes the essential threshold when there is no lower eigenvalue.

### Clipped eigenvalue convention

**clippedGap.** For a real set small, clippedGap(small)=inf({1/4}∪small). Its geometric argument is the set of eigenvalues in (0,1/4); the inserted threshold gives value 1/4 when that set is empty.

Construction or proof: Use the real conditional complete lattice infimum. In the geometric use the eigenvalues are nonnegative, so the set is nonempty and bounded below. Prove lower and upper comparison APIs with explicit bounded-below hypotheses where the conditional infimum requires them.

The API consists of:

- **clippedGap_eq.** clippedGap(small)=sInf(insert(1/4,small)).
- **clippedGap_le.** If r∈small and {1/4}∪small is bounded below, clippedGap(small)≤r.
- **le_clippedGap.** If c≤1/4 and c≤r for every r∈small, then c≤clippedGap(small).

Unit tests:

- **clippedGap.empty.** clippedGap(∅)=1/4.
- **clippedGap.exceptional.** clippedGap({21/100})=21/100.
- **clippedGap.tempered.** clippedGap({1/3})=1/4, not 1/3.

Direct dependencies: real arithmetic and the existing infimum/integral APIs.

Source: lrs95, Theorem 1.1 p.387 and archimedean discussion pp.389–390 — Makes the continuous-threshold convention explicit without assigning an artificial least cusp eigenvalue.

### Congruence spectral description

**congruence_spectral_description.** For every allowed Γ, the weight-zero residual L² subspace is exactly the constants. The absolutely continuous spectrum of Δ is [1/4,∞), with one channel per cusp and a scattering matrix. Every spectral value in (0,1/4) is a finite-multiplicity cuspidal eigenvalue; there are finitely many there and no singular continuous contribution. This is an arbitrary-level specialization of AS.4.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

Construction or proof: Import AS.4 spectral orthosum and GL₂ expansion, with the requested multi-cusp scattering and residual classification. For principal level, diagonalize the finite-level action. Rank-one Eisenstein poles in Re s>1/2 give only the trivial residual character at s=1; the relevant Dirichlet denominators are zero-free in Re(2s)>1. Pass to Γ-invariants inside the principal-level cover. Retain the channels indexed by Γ cusps and identify the operator on the quotient.

Acceptance: Several cusps give several Eisenstein channels, not the level-one single-channel formula. A positive residual exceptional value must be excluded, not silently treated as cuspidal.

Direct dependencies: CongruenceSpectralGap:CSG.0/quotient-laplacian; AutomorphicSpectralTheory:AS.4/spectral-orthosum; AutomorphicSpectralTheory:AS.4/residual-spectrum; AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion; AutomorphicSpectralTheory:AS.4; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing.

Source: lrs95, Theorem 1.1 p.387 and §1 pp.389–390 — LRS applies its cuspidal bound to the congruence quotient; the all-level spectral and residual input is imported from the parent.

### Rayleigh and clipped spectrum comparison

**spectralGap_eq_clippedGap.** Let smallΓ={λ∈ℝ : 0<λ<1/4 and there is nonzero u∈Dom Δ with Δu=λu}. Then spectralGap Γ=clippedGap(smallΓ). Equivalently it is min(λ₁,1/4) if a first positive discrete eigenvalue exists, and 1/4 if there is no eigenvalue below the threshold.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

Construction or proof: Restrict the existing spectral calculus to constants-perpendicular L². Apply the spectral description: only finitely many positive discrete values occur below the essential threshold. The lowest spectral value gives the Rayleigh infimum; if the set is empty, approximate the essential bottom.

Acceptance: The empty small-spectrum set gives 1/4. An eigenvalue exactly 1/4 does not change the clipped answer.

Direct dependencies: CongruenceSpectralGap:CSG.0/spectral-description; CongruenceSpectralGap:CSG.0/spectral-gap; CongruenceSpectralGap:CSG.0/clipped-gap; AutomorphicSpectralTheory:AS.0.

Source: teschl, §4.3, Theorem 4.10 p.119 — The essential-spectrum convention and form-domain equality provide the comparison.

## CSG.1 — Exceptional GL₂ parameters and the adjoint lift

The SO(2)-fixed classical line permits a common sign character in the two real inducing characters. It need not extend to an O(2)-fixed line. Passing to the adjoint cancels that common parity and gives the O(3)-spherical input required by the parameter theorem. This distinction is why the roadmap does not apply the m=2 spherical theorem directly to every classical eigenfunction.

The monomial branch must be separated before asserting cuspidality of the lift. A global inducing Hecke character has only a common norm power in its positive absolute-value part; unitarity of the induced central character forces that power to vanish. Its real local induction is then tempered. Thus a complementary exceptional form cannot lie in that branch, and the existing Gelbart–Jacquet cuspidality criterion applies.

### Exceptional cuspidal dictionary

**exceptional_cuspidal_dictionary.** For allowed Γ and an eigenvalue 0<λ<1/4, a cuspidal GL₂(Aℚ) unitary representation π occurs after passing to principal level and decomposing the finite-level action. Its archimedean component has SO(2)-weight zero and complementary parameter r∈(0,1/2), with λ=1/4−r². A common sign parity on its two real inducing characters is allowed; π∞ need not be O(2)-spherical.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued. u is a nonzero positive exceptional eigenfunction.

Construction or proof: Use CSG.0 residual classification to identify u as cuspidal. Lift u to Γ(N) and apply AF.2 adelic-classical comparison at principal level, then extract a cuspidal constituent using AF.3. Compute the normalized Casimir on the SO(2)-fixed line using AF.1 real local classification. Write the unitary principal-series characters as sgn^ε|.|^r and sgn^ε|.|^−r after the central norm normalization. Allow both ε=0 and ε=1; the geometric eigenvalue does not force reflection-even parity.

Acceptance: Covers Γ(N) and arbitrary intermediate Γ, not only Γ₀(N) with a nebentypus. Either sign parity yields the same λ.

Direct dependencies: CongruenceSpectralGap:CSG.0/spectral-description; AutomorphicFormsOnReductiveGroups:AF.2/adelic-classical-bijection; AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln; AutomorphicFormsOnReductiveGroups:AF.1/vogan-generic-unitary-dual.

Source: lrs95, §1 pp.389–390, GL₂ eigenvalue and GL₃ lift discussion — Specializes the classical/adelic and real representation dictionaries without constructing new generic carriers.

### Monomial archimedean temperance

**monomial_archimedean_tempered.** If π is unitary cuspidal on GL₂(Aℚ) and has a nontrivial character self-twist, then π=AIK/ℚ(θ) for a quadratic field K and a unitary Hecke character θ. Its archimedean parameter is tempered. Therefore a weight-zero complementary component with 0<r<1/2 has no nontrivial self-twist.

Hypotheses: π is unitary cuspidal; there is a character η≠1 with π⊗η≃π.

Construction or proof: Import the quadratic self-twist and induction branch of the existing adjoint-lift contract. A global Hecke character’s positive absolute-value part is a common norm power; the central unitarity of its induction forces this power to be zero. At a split real place induction is the pair of unitary real characters. At a complex place unitary Weil induction is tempered (with the resulting principal/discrete type). The nonzero real exponents of a complementary weight-zero π∞ contradict temperance.

Acceptance: The cuspidal-lift proof cannot be applied to every monomial form. No complementary r>0 survives this branch.

Direct dependencies: GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln; CongruenceSpectralGap:CSG.1/exceptional-dictionary; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters.

Source: gj78, §3.7 p.491; Theorem 9.3 p.534 and Remark 9.9 p.541 — Imports the quadratic induction case and checks that it cannot contribute an exceptional eigenvalue.; global-number-fields, Layer 9, unique real shift and unitary-part targets; Layers 6 and 10 for norm-one compactness and infinity types — Imports the fact that the absolute value of a global Hecke character is a single real norm power, so central unitarity forces zero shift.

### Exceptional adjoint parameters

**adjoint_exceptional_parameters.** For the exceptional π of CSG.1, Ad(π)=Sym²(π)⊗ωπ⁻¹ is a unitary cuspidal GL₃ representation, O(3)-spherical at infinity, with standard archimedean parameters {2r,0,−2r} in the Γℝ(s−μj) convention. The common sign parity disappears. Its GL₃ parameters, not π’s GL₂ parameters, are used in Theorem 1.2.

Hypotheses: π and r are supplied by exceptional_cuspidal_dictionary.

Construction or proof: Use monomial_archimedean_tempered to exclude nontrivial self-twists; import the exact existing Gelbart–Jacquet adjoint lift and its cuspidality criterion. At infinity compute the trace-zero endomorphism representation of the rank-two parameter. Ratios of the two characters give |.|^2r,1,|.|^−2r; common sign factors cancel. The resulting spherical component has the required standard gamma factor; central-character removal is essential when ωπ is nontrivial.

Acceptance: Raw Sym² without ωπ⁻¹ is not the stated adjoint when the central character is nontrivial. For r=1/5 the largest real GL₃ parameter is 2/5.

Direct dependencies: CongruenceSpectralGap:CSG.1/exceptional-dictionary; CongruenceSpectralGap:CSG.1/monomial-tempered; GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift; AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln; AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor.

Source: lrs95, §1 pp.389–390 and Theorem 1.2 p.389 — Uses the imported adjoint lift only for its exceptional real parameter specialization.

## CSG.2 — Prime-twisted Rankin–Selberg functions

The self-pair coefficients are positive even though the twisted coefficients b(n)χ(n) need not be. Their positive partial sums supply every summation estimate used below. The pair is equal rank, so the appropriate existing integral route to vertical strip bounds is the equal-rank route; no arbitrary rank-gap theorem is needed.

Gamma factors are meromorphic objects. In Mathlib their totalized values at their poles are zero. Pole cancellation in the completed function must therefore be expressed through meromorphic germs or punctured limits, never by multiplying an infinite pointwise value. The real pole at β₀ comes from a diagonal pair μj+conj μj with maximal real part. Generic unitarity provides β₀<1, and that strict inequality is used again to integrate the dual kernel at zero.

### Prime-twist functional equation

**prime_twist_functional_equation.** Write Lχ(s)=L(s,(π⊗χ)×π̃)=∑n≥1 b(n)χ(n)n⁻ˢ on Re s>1, with self-pair finite coefficients b(n)≥0, b(1)=1 and ∑n≤x b(n)∼cπx for cπ>0. Its completion A(s)Lχ(s), A(s)=∏j,k Γℝ(s−μj−conj μk), is entire and satisfies Lχ(s)=τπ χ(f) τ(χ)^d(fq^d)⁻ˢ G(s)Lχ̄(1−s), where G(s)=A(1−s)/A(s), f is the self-pair conductor and εself(s)=τπ f⁻ˢ. The unit root number is τπ f⁻¹/², not τπ itself.

Hypotheses: m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). χ is a nonprincipal even character of prime conductor q>2, q∤fπ, where fπ is the standard conductor.

Construction or proof: Import AL.3 global poles, functional equation and strip estimates for this equal-rank pair, local factor product and the requested all-prime self-pair positivity and norm-twist transport. At q, πq is unramified but πq⊗χq is ramified, so no global norm self-twist can hold. The local twisted L factor is 1 and its epsilon factor is τ(χ)^d q⁻ᵈˢ: the m² exponent shifts sum to zero. At p≠q, twisting by the unramified character substitutes χ(p)p⁻ˢ in the local polynomial and multiplies epsilon by χ(p^ap). Even parity leaves the infinite factor unchanged. Multiply these factors. Obtain the positive partial-sum asymptotic from the simple positive self-pair pole and the existing full Wiener–Ikehara theorem, checking boundary continuity of the pole-subtracted finite L function.

Acceptance: A ramified self-pair prime is retained in b(n); an unramified-only positivity argument is insufficient. Conductor exponent is m², and odd χ would change the infinite factor.

Direct dependencies: AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-induced-factor-product; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-vertical-strip-bounds; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing; AutomorphicLFunctionsAndLocalFactors:AL.1/canonical-archimedean-factor; AutomorphicFormsOnReductiveGroups:AF.1/vogan-generic-unitary-dual; AutomorphicLFunctionsAndLocalFactors:AL.3; tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara.

Source: lrs95, §2.1 pp.391–392 and Lemma 2.1 pp.392–394 — Combines existing generic RS contracts with the conductor-prime twist calculation; missing generic positivity and twist transport stay with AL.3.

### Archimedean trivial zero

**archimedean_trivial_zero.** If β₀>0, then Lχ(β₀)=0 for every χ in CSG.2. A(s) has a real pole at β₀ and has no poles on Re s>β₀. The completed twisted function is entire, so the finite function vanishes there to at least the pole order.

Hypotheses: m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). χ is a nonprincipal even character of prime conductor q>2, q∤fπ, where fπ is the standard conductor. β₀>0.

Construction or proof: Use AF.1 unitarity to identify the multiset with its negative complex conjugate and genericity to give β₀<1. A maximal diagonal pair has argument s−2Re μj, which is zero at β₀. Gamma has no meromorphic zeros; no pole cancels another gamma pole, and none lies to the right. Use entire completion from prime_twist_functional_equation and compare meromorphic orders. Interpret poles by germs or punctured limits: the totalized Complex.Gammaℝ value is zero at a pole and cannot be treated as infinite.

Acceptance: β₀=0 is excluded from this statement and needs no nonvanishing contradiction. Pointwise totalized gamma values do not prove cancellation of a meromorphic pole.

Direct dependencies: CongruenceSpectralGap:CSG.2/prime-twist-equation; mathlib:Complex.Gammaℝ; mathlib:Complex.Gammaℝ_eq_zero_iff; mathlib:Complex.Gammaℝ_residue_zero; AutomorphicFormsOnReductiveGroups:AF.1/vogan-generic-unitary-dual.

Source: lrs95, Theorem 1.2 discussion pp.389–390 and proof p.395 — The rightmost real infinite-factor pole forces all even-prime twists to vanish if the parameter bound fails.

## CSG.3 — Mellin kernels and the approximate equation

The cutoff is smooth and supported in a compact subinterval of the positive real axis. Its normalization is ∫f(y)dy/y=1. This gives k(0)=1 and residue one at the 1/s pole. It also makes F₁ exactly one below the support, which is stronger than the asymptotic needed in the average.

For the dual kernel, reflect the Mellin argument and keep G(β−s), not G(s+β). When the rightmost gamma pole collides with s=0, logarithmic factors can occur. The epsilon bound below covers those factors uniformly and is sufficient for the dual integral. A nonnegative cutoff can be chosen once, but the kernel definitions accept complex functions and their APIs use explicit support and integrability hypotheses.

### Mellin cutoff kernel

**firstKernel.** For f:ℝ→ℂ define firstKernel(f,x)=∫y>x f(y)dy/y. For smooth compact support contained in (0,∞) and x>0 this equals mellinInv(2,s↦mellin(f,s)/s)(x), with mellin(f,s)=∫₀∞f(y)y^(s−1)dy. Normalize mellin(f,0)=1.

Construction or proof: Use existing mellin and mellinInv conventions; these agree with the vertical complex contour integral after ds=i dt. Mellin inversion and contour shift show the integral-tail formula. For compact positive support, F₁ is exactly 1 below the support and exactly 0 above it under multiplicative normalization.

The API consists of:

- **firstKernel_eq_integral.** For every f and x, F₁(f,x)=∫Ioi(x) f(y)/(y:ℂ)dy.
- **firstKernel_eq_mellinInv.** For smooth compact positive support and x>0, F₁=mellinInv(2,mellin(f,s)/s)(x).
- **firstKernel_below.** If a>0, f(y)=0 for y<a, f(y)/y is integrable on (0,∞), mellin(f,0)=1 and 0<x≤a, then F₁(f,x)=1.
- **firstKernel_above.** If f(y)=0 for y>b and b≤x, then F₁(f,x)=0.

Unit tests:

- **firstKernel.zero.** F₁(0,x)=0 for every x.
- **firstKernel.below_support.** If f vanishes below 1, f/y is integrable on (0,∞) and mellin(f,0)=1, F₁(f,1/2)=1.
- **firstKernel.above_support.** If f vanishes above 2, F₁(f,3)=0.

Direct dependencies: mathlib:mellin; mathlib:mellinInv.

Source: lrs95, Equations (3.6)–(3.7), Lemma 3.1 pp.395–396 — Cutoff normalized with dy/y so the residue at zero is one; source issue E1 records the printed normalization mismatch.

### Dual Mellin kernel

**dualKernel.** dualKernel(f,G,β,x)=mellinInv(2,s↦mellin(f,−s)G(β−s)/s)(x). G is an actual complex function; in the RS application it is the meromorphic quotient A(1−s)/A(s), evaluated on the allowed integration line. No bound is stored in its data.

Construction or proof: Reuse mellinInv for the contour integral, so the sign change k(−s) and β−s remain visible. For G=1 use mellin_comp_inv and the first-kernel inversion API. The zero-function and zero-ratio cases follow from the zero integrand.

The API consists of:

- **dualKernel_eq_mellinInv.** F₂ equals the displayed existing inverse Mellin transform.
- **dualKernel_zero_ratio.** G=0 gives F₂=0.
- **dualKernel_unit_ratio.** For smooth compact positive-support f, x>0 and G=1, F₂(f,1,β,x)=F₁(f∘inv,x).

Unit tests:

- **dualKernel.zero.** f=0 gives F₂=0 for any G, β and x.
- **dualKernel.zero_factor.** G=0 gives F₂=0 for any f, β and x.
- **dualKernel.inversion.** For smooth compact positive support, G=1 and x=2, F₂=F₁(f∘inv,2), detecting the sign of the Mellin argument.

Direct dependencies: CongruenceSpectralGap:CSG.3/first-kernel; mathlib:mellin_comp_inv; mathlib:mellinInv.

Source: lrs95, Equation (3.7), Lemma 3.1 p.396 — Defines the dual cutoff with the reflected Mellin transform and archimedean ratio.

### Mellin cutoff estimates

**mellin_cutoff_estimates.** For f smooth with compact support in (0,∞), mellin(f,0)=1, the CSG.2 gamma ratio G, β with 0<σ=Re β<1 and every ε>0, F₁ and F₂ decay faster than any power as x→∞. F₁(x)=1 for sufficiently small positive x. For 0<x≤1, |F₂(x)|≤Cε(1+x^(1−β₀−σ−ε)); constants depend on π,β,f,ε, not q or Y. Choose ε<1−β₀ when using the dual integral.

Hypotheses: m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). f is smooth, compactly supported in (0,∞), mellin(f,0)=1. 0<Re β<1 and ε>0.

Construction or proof: Integration by parts in log y makes k entire and rapidly decreasing in vertical strips. Import the requested complex gamma Stirling bounds from AL.1; the ratio G has polynomial strip growth. Shift to the right for rapid decay, and to the left for near-zero behavior. The rightmost possible dual pole is at β+β₀−1, with order at most d. Absorb powers of |log x| into x⁻ε; this also handles collision with the 1/s pole when σ+β₀=1.

Acceptance: At σ+β₀=1 the estimate allows logarithmic growth. The bound does not depend on the prime conductor.

Direct dependencies: CongruenceSpectralGap:CSG.3/first-kernel; CongruenceSpectralGap:CSG.3/dual-kernel; CongruenceSpectralGap:CSG.2/prime-twist-equation; AutomorphicLFunctionsAndLocalFactors:AL.1.

Source: lrs95, Lemma 3.1 p.396, contour-shift proof — Records a robust epsilon bound including multiple poles and the zero-pole collision.

### Approximate functional equation

**approximate_functional_equation.** For the CSG.2 data, smooth compact positive-support f with mellin(f,0)=1, 0<Re β<1 and Y>1, Lχ(β)=∑n≥1 b(n)χ(n)n⁻ᵝF₁(n/Y)+τπχ(f)τ(χ)^d(fq^d)⁻ᵝ∑n≥1 b(n)χ̄(n)n^(β−1)F₂(nY/(fq^d)). Both sums converge absolutely.

Hypotheses: m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). χ is a nonprincipal even character of prime conductor q>2, q∤fπ, where fπ is the standard conductor. 0<Re β<1, Y>1, and the normalized f of CSG.3.

Construction or proof: Integrate k(s)Lχ(β+s)Y^s/s on Re s=2, exchange the absolutely convergent series and integral, and identify F₁. Shift to Re s=−1: the sole crossed pole is s=0 because the finite twisted Lχ is entire. Strip bounds and rapid k decay control horizontal contours. Apply the functional equation, replace s by −s and shift the resulting integral to Re s=2 in the pole-free right region. Expanding Lχ̄(1−β+s) gives F₂ with the exact conductor and power of n. Use rapid kernel decay and the positive partial-sum bound from CSG.2 for absolute summability.

Acceptance: The dual argument is nY/(fq^d), not n/(Yfq^d). The dual character is χ̄ and the exponent is n^(β−1).

Direct dependencies: CongruenceSpectralGap:CSG.2/prime-twist-equation; CongruenceSpectralGap:CSG.3/kernel-estimates; AutomorphicLFunctionsAndLocalFactors:AL.3/rs-vertical-strip-bounds.

Source: lrs95, Lemma 3.2 and its proof pp.396–397 — The two kernel expressions give the prime-twist series representation used by the average.

## CSG.4 — Prime character averages and nonvanishing

The average ranges over even nonprincipal characters, all primitive at their prime modulus. The principal character has to be subtracted on every unit class. In particular the coefficient at n=1 is (q−3)/2, whose leading part is q/2; its lower-order discrepancy is absorbed in the average error.

For the primal error, a fixed n≠1 can satisfy n≡±1 for only primes dividing n−1 or n+1. Use a divisor estimate to count those possibilities, together with the positive partial-sum bound for b(n). This argument does not need a Ramanujan-type pointwise bound on b(n). For the dual error, the character factor χ(f)χ̄(n) is χ̄(n/f) on units. Deligne’s bound saves the required half-power after the Gauss-power average. The near-zero integral has exponent −β₀ up to an arbitrarily small loss, so β₀<1 is essential.

### Even prime-twist average

**primeTwistAverage.** For an actual family L(q,χ,s) of complex functions, standard conductor fπ and Q∈ℕ, primeTwistAverage(L,fπ,Q,β)=∑Q<q≤2Q, q prime, q∤fπ ∑χ≠1, χ(−1)=1 L(q,χ,β). The finite indexing sum is independent of any analytic assertions about L.

Construction or proof: Filter Finset.Ioc(Q,2Q) by primality and q∤fπ, then filter the finite DirichletCharacter ℂ q group by evenness and nonprincipality. The family congruence API tests equality only on selected indices. The zero API gives the contradiction interface without asserting nonvanishing for arbitrary function families.

The API consists of:

- **primeTwistAverage_eq.** Equals the finite sum over primes Q<q≤2Q with q∤fπ and even nonprincipal χ.
- **primeTwistAverage_congr.** Families equal at every selected (q,χ,β) have equal averages.
- **primeTwistAverage_zero_of_zero.** If every selected value is zero then the average is zero.

Unit tests:

- **primeTwistAverage.empty_interval.** Q=0 gives zero for every family and conductor.
- **primeTwistAverage.no_even_nonprincipal_mod3.** For L≡1, fπ=1 and Q=2 the average is zero; q=3 has no even nonprincipal character.
- **primeTwistAverage.mod5.** For L≡1, fπ=1 and Q=3 the average is one, coming from q=5.
- **primeTwistAverage.bad_prime_removed.** For L≡1, fπ=5 and Q=3 the average is zero, since q=5 is excluded.

Direct dependencies: mathlib:DirichletCharacter.sum_characters_eq.

Source: lrs95, Equation (3.4) and Proposition 3.1 p.395 — Uses precisely the even nonprincipal prime twists away from the standard conductor.

### Even nonprincipal orthogonality

**even_nonprincipal_orthogonality.** For prime q>2 and a∈Z/qZ, ∑χ even,χ≠1 χ(a) is 0 if a=0, (q−1)/2−1 if a=±1, and −1 otherwise. Consequently the smoothed first-series sum is ((q−1)/2)∑n≡±1 mod q b(n)n⁻ᵝF₁(n/Y)−∑(n,q)=1 b(n)n⁻ᵝF₁(n/Y). The principal-character subtraction includes n≡±1.

Hypotheses: q>2 is prime; characters are complex Dirichlet characters extended by zero on nonunits.

Construction or proof: Project the full character sum to even characters by (1+χ(−1))/2 and use the pinned sum_characters_eq theorem at a and −a. Subtract the principal character, which is one on every nonzero class and zero at zero. Apply to each coefficient of the finite-support primal kernel.

Acceptance: At a=1 the answer is (q−3)/2. At q=3 every class has sum zero.

Direct dependencies: mathlib:DirichletCharacter.sum_characters_eq; CongruenceSpectralGap:CSG.3/first-kernel.

Source: lrs95, Equation (3.11) and corrected (3.12), p.397 — Supplies the finite sum and corrects the incomplete principal subtraction recorded as E2.

### Gauss-power average

**gauss_power_even_average.** For q>2 prime, k≥1, r∈(Z/qZ)×, τ(χ)=gaussSum(χ,stdAddChar), and the existing unnormalized FF.2 hyper-Kloosterman sum Klk(r,q) over k units of product r, ∑χ even,χ≠1 χ̄(r)τ(χ)^k=((q−1)/2)(Klk(r,q)+Klk(−r,q))−(−1)^k. Its norm is at most (q−1)k q^((k−1)/2)+1, hence O_k(q^((k+1)/2)).

Hypotheses: q>2 is prime; k≥1; r is a nonzero unit.

Construction or proof: Expand the k-th power of the existing finite Gauss sum. Orthogonality selects tuples whose product is r or −r. Subtract the principal-character Gauss sum τ(1)=−1. Match the unit tuple fiber exactly to FF.2/hyper-kloosterman-sum. Import FF.2/hyper-kloosterman-bound for nonzero arguments and the standard nontrivial additive character. Triangle inequality gives the displayed constant; no zero-argument extension or normalized sheaf trace is substituted.

Acceptance: The main factor is (q−1)/2; omitting the principal character leaves a correction −(−1)^k. For k=d=m² the conductor Gauss term has size O_m(q^((d+1)/2)).

Direct dependencies: CongruenceSpectralGap:CSG.4/even-orthogonality; mathlib:gaussSum; mathlib:ZMod.stdAddChar; mathlib:ZMod.isPrimitive_stdAddChar; FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sum; FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-bound.

Source: lrs95, Equations (3.18)–(3.20) p.398 — Matches the exact Deligne supplier convention instead of reproving the character-sum bound.

### Prime-twist average asymptotic

**prime_twist_average_asymptotic.** For fixed π as in CSG.2, β with 0<σ=Re β<1 and every ε>0, as Q→∞ through positive integers, primeTwistAverage(Lχ,fπ,Q,β)=(1/2)∑Q<q≤2Q,q prime,q∤fπ q+Oπ,β,ε(Q^(1+(d+1)(1−σ)/2+ε)). The main term is asymptotic to (3/4)Q²/log Q.

Hypotheses: m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). 0<Re β<1; ε>0; π and β are fixed.

Construction or proof: Choose a multiplicatively normalized smooth compact cutoff and apply approximate_functional_equation with Y=Q^((d+1)/2), valid for large Q and satisfying Q≪Y≪Q^d. Even orthogonality isolates n=1, giving the main term up to O(Q). For n≠1 the number of primes dividing n−1 or n+1 is bounded by τ(n−1)+τ(n+1); use the AN.5 divisor subpower bound, not a false pointwise bound for b(n). Partial summation with ∑n≤x b(n)≪πx gives primal error O(QY^(1−σ+ε)). The subtraction over all coprime n has the same or smaller bound. For the dual term, put r=n/f mod q and k=d in gauss_power_even_average. Partial summation bounds the kernel integral by O(Q^(1+(d+1)/2)Y⁻σ); near zero the integrand is bounded by x^(σ−1)+x^(−β₀−ε′), integrable for ε′<1−β₀. Combine the errors and absorb the smoothing exponent into the requested ε. PNT and Abel summation give the dyadic prime sum ∼(3/2)Q²/log Q; deleting finitely many bad primes changes no asymptotic.

Acceptance: The exponent is 1+(m²+1)(1−σ)/2, not the exponent of a degree-m single standard L function. Errors are uniform in the dyadic primes but their constants may depend on fixed π and β.

Direct dependencies: CongruenceSpectralGap:CSG.4/prime-average; CongruenceSpectralGap:CSG.4/even-orthogonality; CongruenceSpectralGap:CSG.4/gauss-average; CongruenceSpectralGap:CSG.3/approximate-equation; AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound; AnalyticNumberTheory:AN.2/rational-prime-number-theorem; AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer; tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation.

Source: lrs95, Proposition 3.1 p.395, proof pp.397–399 — Includes both averaged errors, the smoothing scale and the prime main term.

### Twisted Rankin–Selberg nonvanishing

**prime_twist_nonvanishing.** For fixed π as in CSG.2 and every β with 1−2/(m²+1)<Re β<1, every sufficiently large dyadic prime interval contains q∤fπ and an even nonprincipal χ modulo q for which L(β,(π⊗χ)×π̃)≠0. In particular such conductors are unbounded.

Hypotheses: m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1). 1−2/(m²+1)<Re β<1.

Construction or proof: Choose ε>0 less than 2−[1+(d+1)(1−Re β)/2]. The asymptotic error divided by Q²/log Q tends to zero. Thus the complex average is nonzero for large Q. If every summand were zero its finite sum would vanish, so extract one nonzero term. No positivity of the twisted values is asserted.

Acceptance: The strict half-strip does not include its left boundary. Existence does not say that every twist is nonzero.

Direct dependencies: CongruenceSpectralGap:CSG.4/average-asymptotic; CongruenceSpectralGap:CSG.4/prime-average.

Source: lrs95, Proposition 3.1 and proof of Theorem 1.2 p.395 — The first moment gives existence of a nonzero twist in the required half-strip.

## CSG.5 — Archimedean bounds and the spectral gap

The nonvanishing strip is strict at its left endpoint. Consequently the contradiction proves a weak parameter inequality. Retaining the weak endpoint is necessary for the exact equality test r=1/5 and for the exported 21/100 bound.

The final theorem and its form-domain version are the consumer interface. HyperbolicCurveVolumesAndGonality and GeometricFreyMazur combine this interface with independent conformal-area and area/index estimates. Only the rational normalization check producing 7/800 belongs here. Metric rescaling multiplies the eigenvalue and continuous threshold by the same κ and divides area by κ; the eigenvalue-area product is unchanged.

### Luo–Rudnick–Sarnak parameter bound

**lrs_archimedean_parameter_bound.** For m≥2 and unitary cuspidal π of GLm(Aℚ) with O(m)-spherical π∞ and L∞(s,π)=∏j Γℝ(s−μj), every j satisfies |Re μj|≤1/2−1/(m²+1). No general nonspherical or number-field version is asserted.

Hypotheses: m≥2 and π is unitary cuspidal on GLm(Aℚ). π∞ is O(m)-spherical; L∞(s,π)=∏j Γℝ(s−μj). d=m², β₀=2 maxj Re μj; unitarity gives β₀∈[0,1).

Construction or proof: Assume β₀>1−2/(m²+1). Generic unitary classification gives β₀<1, so twist-nonvanishing applies at the real point β=β₀. Archimedean trivial zero gives zero for every even prime twist there, contradicting the extracted nonzero twist. Hence β₀≤1−2/(m²+1). The unitary multiset symmetry bounds the negative real parts too. Divide by two and obtain the weak inequality; the boundary is not excluded by the strict nonvanishing region.

Acceptance: For m=3 the bound is 2/5. The conclusion is ≤, not <, and its spherical hypothesis is retained.

Direct dependencies: CongruenceSpectralGap:CSG.2/trivial-zero; CongruenceSpectralGap:CSG.4/twist-nonvanishing; AutomorphicFormsOnReductiveGroups:AF.1/vogan-generic-unitary-dual.

Source: lrs95, Theorem 1.2 p.389 and its proof p.395 — The complete prime-twist argument yields the general spherical archimedean bound.

### Exceptional eigenvalue arithmetic

**exceptional_parameter_arithmetic.** For r≥0 with 2r≤2/5, one has r≤1/5 and 1/4−r²≥21/100.

Hypotheses: r is real, r≥0 and 2r≤2/5.

Construction or proof: Divide the linear bound by two. Squaring preserves it because both sides are nonnegative; subtract from 1/4.

Acceptance: At r=1/5 equality gives 21/100. The direct m=2 bound r≤3/10 gives only 4/25; the adjoint step is necessary.

Direct dependencies: real arithmetic and the existing infimum/integral APIs.

Source: lrs95, §1 pp.389–390, deduction of Theorem 1.1 from Theorem 1.2 — Isolates the exact rational conversion from the GL₃ parameter bound.

### Congruence spectral gap

**congruence_spectral_gap.** For every congruence subgroup Γ≤SL₂(ℤ), equivalently its effective image in PSL₂(ℤ), spectralGap Γ=λ′₁(Γ)≥21/100 in curvature −1. This includes arbitrary congruence levels and the empty small-spectrum convention.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued.

Construction or proof: Every 0<λ<1/4 is cuspidal by congruence_spectral_description. Apply exceptional_cuspidal_dictionary and adjoint_exceptional_parameters. The m=3 instance of lrs_archimedean_parameter_bound gives 2r≤2/5. Exceptional_parameter_arithmetic gives λ≥21/100. The continuous threshold 1/4 is also ≥21/100. Use spectralGap_eq_clippedGap and the lower-infimum API to combine these cases without choosing a nonexistent least eigenfunction.

Acceptance: 3/16<21/100<1/4 and 21/100−3/16=9/400. The theorem has an actual congruence hypothesis; finite index alone does not suffice. No Selberg 1/4 conjecture is used.

Direct dependencies: CongruenceSpectralGap:CSG.0/spectral-clipping; CongruenceSpectralGap:CSG.1/adjoint-parameters; CongruenceSpectralGap:CSG.5/archimedean-bound; CongruenceSpectralGap:CSG.5/exceptional-arithmetic.

Source: lrs95, Theorem 1.1 p.387; GL₃ reduction pp.389–390; proof of Theorem 1.2 p.395 — Exports the original LRS congruence bound by the supplied spectral and adjoint comparisons.

### Congruence Rayleigh inequality

**congruence_rayleigh_bound.** For allowed Γ and every u in its closed Dirichlet form domain with ∫u dμΓ=0, q(u,u)≥(21/100)‖u‖₂². On the operator domain this reads Re⟨u,Δu⟩≥(21/100)‖u‖₂². It includes u=0.

Hypotheses: Γ≤SL₂(ℤ) contains Γ(N) for some N≥1; its effective image acts on ℍ. Metric ds²=(dx²+dy²)/y² has curvature −1; all functions are complex-valued. u belongs to the closed form domain and has complex mean zero.

Construction or proof: For nonzero operator-domain u, its Rayleigh value is at least spectralGap and use congruence_spectral_gap; zero gives equality. Approximate form-domain vectors in energy norm by operator-domain vectors using the generic closed-form operator core. Subtract their constant projections to preserve mean zero and pass to the limit.

Acceptance: A nonzero constant is excluded by the mean-zero assumption. Multiplication of u by a complex scalar multiplies both sides by its modulus squared.

Direct dependencies: CongruenceSpectralGap:CSG.0/spectral-gap; CongruenceSpectralGap:CSG.0/mean-zero; CongruenceSpectralGap:CSG.5/congruence-bound; AutomorphicSpectralTheory:AS.0.

Source: lrs95, Theorem 1.1 p.387 combined with Teschl Theorem 4.10 p.119 — The spectral statement becomes the finite-energy estimate used by conformal-area consumers.

### Curvature rescaling comparison

**spectralGap_metric_rescale.** For κ>0, replace g−1 by gκ=κ⁻¹g−1. Then curvature is −κ, μκ=κ⁻¹μ−1, Δκ=κΔ−1, the Dirichlet energy in dimension two is unchanged, and λ′₁,κ=κλ′₁,−1 with continuous threshold κ/4. Hence λ′₁,κ/κ≥21/100. Scalar curvature_scaled_gap multiplies the already established inequality by κ.

Hypotheses: κ>0 and Γ is a congruence subgroup; the metric is a constant rescaling of the specified hyperbolic metric.

Construction or proof: Apply current DifferentialGeometry constant-metric scaling to gradient, inverse metric and two-dimensional volume. Transport L² by the constant normalization and identify the same closed form and scaled operator. Both operator/form Rayleigh quotients scale by κ; constants and mean-zero subspaces correspond. Take infima and rescale the threshold.

Acceptance: Curvature −4 gives λ′₁≥21/25 and continuous threshold 1. (21/100)(π/3)/(8π)=7/800; applying the independent area/index and conformal-area theorems belongs to the consumers.

Direct dependencies: CongruenceSpectralGap:CSG.0/quotient-laplacian; CongruenceSpectralGap:CSG.0/spectral-gap; CongruenceSpectralGap:CSG.5/congruence-bound; AutomorphicSpectralTheory:AS.0.

Source: lrs95, §1 pp.387–390 metric-normalized eigenvalue convention; Theorem 4.10 p.119 for the Rayleigh comparison — Constant rescaling transports the theorem and threshold, without a new automorphic estimate.

## Acceptance suite and source conventions

The numerical suite checks 3/16<21/100<1/4, the difference 9/400, and 1/4−(1/5)²=21/100. The continuous spectrum stays at 1/4+t² for real t. The empty small-spectrum set returns 1/4, while a singleton above the threshold is clipped to 1/4. The constant vector is in the operator kernel and is excluded from the positive Rayleigh quotient. The mean-zero condition rejects both constant 1 and constant i. Applying the final bound requires the existing congruence predicate; merely having finite index does not supply it.

For the Gauss identity, the principal subtraction is −(−1)^k and the two product fibers are r and −r, both nonzero. The imported FF.2 theorem is used with an unnormalized sum, whose bound is kq^((k−1)/2). A normalized trace would introduce a different power of q. For the finite prime average, q=3 contributes no even nonprincipal characters and q=5 contributes one. A bad standard-conductor prime is excluded before the characters are summed.

Two source normalization corrections are built into the statements. At LRS95 p.395, the ordinary-integral normalization preceding (3.6) does not imply the asserted Mellin value k(0)=1; multiplicative normalization does. At p.397, the principal-character subtraction in (3.12) must include the residue classes ±1 to agree with (3.11). This changes lower-order terms, not the first-moment main term or final bound. The packet records both checks in own mathematical prose. No applicable published correction was found in the checked author and journal records; this is not a claim of novelty.

The source coverage includes every definition and key theorem on the route to LRS Theorems 1.1 and 1.2. LRS’s applications to Kloosterman sums in progressions and prime geodesics do not enter these targets. Further finite-place or number-field parameter estimates and hypothetical higher symmetric-power improvements are outside this roadmap. The full original paper is the source of the prime-twist argument, while generic representation and analytic theories are imported from their established owners.

The suggested file gives native signatures for all eight new definitions, every API item, all definition tests, the exact finite character and Gauss identities, the clipped-spectrum comparison, scalar arithmetic and the final congruence theorem. Global AF/AL/GL₂ statement carriers, the full form-domain interface and the metric-rescaling interface require the genuine supplier types. Their exact mathematical contracts remain in this document and packet; no abstract record containing the desired bound substitutes for them. The operator-domain Rayleigh signature is present, while its extension to the form domain is part of the closed-form contract.

## Sources

- **lrs95.** Wenzhi Luo, Zeev Rudnick and Peter Sarnak, [On Selberg’s eigenvalue conjecture](https://www.math.tau.ac.il/~rudnick/papers/lrsGAFA.pdf). Geometric and Functional Analysis 5 (1995), 387–401; author-hosted scan of the published paper. Relevant locators are given at each target.

- **gj78.** Stephen Gelbart and Hervé Jacquet, [A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf). Annales scientifiques de l’École Normale Supérieure, série 4, 11 (1978), 471–542. Relevant locators are given at each target.

- **teschl.** Gerald Teschl, [Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf). Author-hosted second-edition text; theorem numbering of the retrieved PDF. Relevant locators are given at each target.

- **fuchsian.** Tau Ceti contributors, [Fuchsian groups and orbifold Riemann surfaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c251d2e42c66f14c279d1e5c2708c5a91d8c8aec/TauCetiRoadmap/FuchsianOrbifolds/README.md). TauCetiRoadmap current main c251d2e42c66f14c279d1e5c2708c5a91d8c8aec. Relevant locators are given at each target.

- **baseline.** Mathlib and Tau Ceti contributors, [Pinned Mathlib and Tau Ceti source declarations](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib). Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Relevant locators are given at each target.

- **global-number-fields.** Tau Ceti contributors, [Global number fields, ray classes, adeles, and Hecke characters](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c251d2e42c66f14c279d1e5c2708c5a91d8c8aec/TauCetiRoadmap/GlobalNumberFields/README.md). TauCetiRoadmap current main c251d2e42c66f14c279d1e5c2708c5a91d8c8aec. Relevant locators are given at each target.
