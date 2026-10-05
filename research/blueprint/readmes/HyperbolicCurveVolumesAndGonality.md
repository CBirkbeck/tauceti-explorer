# Fuchsian groups and orbifold Riemann surfaces, Part II: volumes and gonality of hyperbolic curves

This roadmap extends Fuchsian groups and orbifold Riemann surfaces. It begins with that roadmap’s projective actions, quotient charts, geodesics, cusp compactification and finite-map degree theory. Its new objects are hyperbolic volume comparisons, analytic integration and positivity, diagonal tube estimates, and gonality/conformal-area invariants. The metric carrier remains Mathlib’s UpperHalfPlane and Tau Ceti’s Complex.UnitDisc/PoincareDisc. Function-field Riemann–Roch, canonical degree and regular projective models remain in AlgebraicCurves; algebraic intersections remain in SchemeAndStackFoundations SF.5; analytification and algebraization remain in ComplexComparisonPartII C0–C4. The current and differential-form theory needed for these volume estimates is mathematical work here, not an unearned consequence of those algebraic suppliers. Congruence spectral gaps are owned by the separate AutomorphicSpectralTheory extension.

Curvature is −1; d₁ is twice Tau Ceti’s PoincareDisc distance. Neighborhoods in products use the maximum coordinate distance; the pulled-back two-form is a sum. Set dᶜ=i(∂̄−∂)/(4π), so ddᶜ=i∂∂̄/(2π) and ddᶜlog|h|²=[div(h)]. This is half Demailly’s operator; every comparison carries its constant. The conjugate diagonal is a totally real locus, not a complex divisor. Effective cycle and parametrization multiplicities are retained throughout.

The companion blueprint is a checkpoint. HV.0 and HV.1 contain concrete scalar and measure signatures; HV.2 contains the local parameter integral and three degree-sensitive volume models. The global analytic-cycle, current, intersection, gonality and spectral-comparison targets remain explicitly open. The roadmap does not assert that its ambitious endpoints have been decomposed or formalised.


## Ownership and source boundaries

The baseline commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each cited declaration was read in its pinned source, rather than inferred from its name. The reviewed library audit distinguishes an actual half-plane invariant measure from its absent global Riemannian comparison and distinguishes function-field canonical degree from an analytic curvature theorem. Those distinctions remain part of the dependency graph.

The upstream FuchsianOrbifolds and ConformalMapping documents were read in full for this checkpoint. AlgebraicCurves Layers 4–5/7/12 are supplier contracts, not a license to re-plan function-field Riemann–Roch. The first prerequisite is FuchsianOrbifolds. Its projective quotient, polygon, cusp and finite-map degree objects are imported. ComplexComparisonPartII C0–C4 supplies analytic/algebraic comparison; SchemeAndStackFoundations SF.5 supplies algebraic intersections. Neither provides positive currents. The congruence spectral gap belongs to the separate extension design issue #1699.

The compact radius convention is ρ_X=½·systole(X). All radius intervals below are open on the right. Effective cycles retain integer weights. Degree-d parameterizations are integrated over their source with degree counted. A constant coordinate has zero pullback two-form; at a cusp this must be proved in the completed chart, not modeled by multiplying zero by an undefined singular density.


## HV.0: Curvature normalization, disc area and lens geometry

Consume PoincareDisc, Schwarz–Pick, UpperHalfPlane.dist/volume and Cayley coordinates. Expose d₁=2d_TauCeti, radial balls, b=4/(1−|z|²)², the restricted density measure, a(r)=4πsinh²(r/2), and a_λ(r)=λ²a(r/λ). Distinguish max-product neighborhoods from sum forms. Prove the normalized ±a lens enclosure with M(R)=2artanh√tanh(R/2), including M(R)−R→log2.

**Coverage:** The local contracts of this layer are closed at the declaration level; their theorem proofs remain specifications.

### Curvature −1 disc distance

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance. **Kind:** definition.

For z,w in Complex.UnitDisc, d₁(z,w)=2·dist(z.toPoincare,w.toPoincare). This scalar comparison uses the existing PoincareDisc metric and makes no second metric instance on UnitDisc.

**Construction or proof route:** Read PoincareDisc.dist_eq at the pin: its distance is artanh of the pseudohyperbolic expression. Multiply by two to match the infinitesimal norm 2|dz|/(1−|z|²). Transport the metric axioms and Schwarz–Pick by multiplication by the positive constant two.

**Direct prerequisites:** tauceti:TauCeti.PoincareDisc.dist_eq, tauceti:TauCeti.PoincareDisc.dist_toPoincare_zero_right, tauceti:TauCeti.PoincareDisc.dist_map_le.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.distOne_nonneg (structure): d₁ is nonnegative.

- TauCeti.HyperbolicVolumes.distOne_comm (relation): d₁(z,w)=d₁(w,z).

- TauCeti.HyperbolicVolumes.distOne_triangle (structure): d₁ satisfies the triangle inequality.

- TauCeti.HyperbolicVolumes.distOne_map_le (functoriality): Schwarz–Pick remains nonexpanding after rescaling distance by two.

- TauCeti.HyperbolicVolumes.distOne_isometry (functoriality): A PoincareDisc isometry preserves d₁.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.distOne_zero (degenerate): d₁(0,0)=0.

- TauCeti.HyperbolicVolumes.distOne_origin (computation): d₁(z,0)=2 artanh|z|.

- TauCeti.HyperbolicVolumes.distOne_factor_two (compatibility): d₁ is twice the existing metric, exactly.

**Acceptance:** For z,w in Complex.UnitDisc, d₁(z,w)=2·dist(z.toPoincare,w.toPoincare). This scalar comparison uses the existing PoincareDisc metric and makes no second metric instance on UnitDisc.

### Cayley distance comparison

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/cayley-distance. **Kind:** comparison.

For a,z∈UpperHalfPlane, d₁(discCoordinateEquiv(a)(z),0)=dist(z,a) with Mathlib’s upper-half-plane metric.

**Construction or proof route:** Use norm_discCoordinate=tanh(dist(z,a)/2), the radial distance API, and artanh_tanh. This radial comparison avoids assuming a new Cayley isometry theorem.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance, tauceti:UpperHalfPlane.discCoordinateEquiv, tauceti:UpperHalfPlane.norm_discCoordinate, mathlib:Real.artanh_tanh.

**Source:** bt, §1.3, pp.712–713.

**Acceptance:** For a,z∈UpperHalfPlane, d₁(discCoordinateEquiv(a)(z),0)=dist(z,a) with Mathlib’s upper-half-plane metric.

### Curvature −1 radial balls

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/disc-balls. **Kind:** definition.

Define D(r)={z∈ℂ: |z|<tanh(r/2)}. For r>0 this is exactly the d₁-ball at zero, read in the existing disc carrier. For r≤0 it is empty.

**Construction or proof route:** The radial comparison d₁(z,0)=2 artanh|z| and strict monotonicity of tanh/artanh identify the sublevel set; no quotient geometry is used.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance, mathlib:Real.artanh_tanh.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.radialBall_mem (characterisation): Membership is |z|<tanh(r/2).

- TauCeti.HyperbolicVolumes.radialBall_mono (functoriality): r≤R implies D(r)⊆D(R).

- TauCeti.HyperbolicVolumes.radialBall_subset_disc (compatibility): Every radial ball lies in the open unit disc.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.radialBall_zero (degenerate): D(0)=∅.

- TauCeti.HyperbolicVolumes.radialBall_metric (compatibility): The radial formula agrees with d₁.

- TauCeti.HyperbolicVolumes.radialBall_center (characterisation): Zero lies in D(r) exactly for r>0.

**Acceptance:** Define D(r)={z∈ℂ: |z|<tanh(r/2)}. For r>0 this is exactly the d₁-ball at zero, read in the existing disc carrier. For r≤0 it is empty.

### Hyperbolic area density

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density. **Kind:** definition.

The curvature −1 disc area density relative to dx dy is b(z)=4/(1−|z|²)², used only on |z|<1. Its infinitesimal form is ω_D=2i dz∧d z̄/(1−|z|²)².

**Construction or proof route:** Translate the Kähler form of BT §1.3 into the ordinary real Lebesgue measure; i dz∧d z̄=2 dx∧dy. For a disc automorphism A, the holomorphic real Jacobian is |A′|²; the defect identity gives b(Az)|A′(z)|²=b(z).

**Direct prerequisites:** mathlib:MeasureTheory.Measure.withDensity.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.areaDensity_pos (structure): b(z)>0 inside D.

- TauCeti.HyperbolicVolumes.areaDensity_conj (functoriality): Conjugation preserves b.

- TauCeti.HyperbolicVolumes.areaDensity_moebius (functoriality): The Möbius chart Jacobian preserves b(z) dxdy.

- TauCeti.HyperbolicVolumes.areaDensity_rotation (functoriality): A unit scalar u preserves b.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.areaDensity_origin (computation): b(0)=4.

- TauCeti.HyperbolicVolumes.areaDensity_half (computation): b(1/2)=64/9.

- TauCeti.HyperbolicVolumes.areaDensity_not_tau_scale (non-example): Density at zero is not 1, the unscaled metric’s density.

**Acceptance:** The curvature −1 disc area density relative to dx dy is b(z)=4/(1−|z|²)², used only on |z|<1. Its infinitesimal form is ω_D=2i dz∧d z̄/(1−|z|²)².

### Disc area measure

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure. **Kind:** construction.

Define ν_D=(Lebesgue measure restricted to {|z|<1}).withDensity(ENNReal.ofReal∘b). Restriction excludes the total formulas’ geometric junk values outside D.

**Construction or proof route:** Use Mathlib Measure.withDensity; density is continuous inside D and hence measurable there. Nonnegative integration gives the measure and restriction API. Compact subdiscs have bounded density and finite measure.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density, mathlib:MeasureTheory.Measure.withDensity, mathlib:MeasureTheory.withDensity_apply.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.discAreaMeasure_apply (characterisation): ν_D(S)=∫_S b dxdy for measurable S⊆D.

- TauCeti.HyperbolicVolumes.discAreaMeasure_rotation (functoriality): Unit rotations preserve ν_D.

- TauCeti.HyperbolicVolumes.discAreaMeasure_finite_subdisc (structure): Closed subdiscs of Euclidean radius t<1 have finite ν_D-measure.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.discAreaMeasure_empty (degenerate): ν_D(∅)=0.

- TauCeti.HyperbolicVolumes.discAreaMeasure_singleton (degenerate): ν_D({z})=0 for every point.

- TauCeti.HyperbolicVolumes.discAreaMeasure_outside (non-example): The complement of D has zero ν_D-measure.

**Acceptance:** Define ν_D=(Lebesgue measure restricted to {|z|<1}).withDensity(ENNReal.ofReal∘b). Restriction excludes the total formulas’ geometric junk values outside D.

### Hyperbolic disc area

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/area-profile. **Kind:** definition.

The area profile a(r)=4π sinh²(r/2) for r≥0. The total scalar formula has no ball interpretation for negative r.

**Construction or proof route:** The radial integral of b over D(r) is 8π∫₀^{tanh(r/2)} t/(1−t²)² dt. Its antiderivative gives 4πt²/(1−t²); tanh/sinh identities give a(r). The measure identity is the separate disc-ball-area theorem.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density, HyperbolicCurveVolumesAndGonality:HV.0/disc-balls, mathlib:Complex.lintegral_comp_polarCoord_symm.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.areaProfile_pos (structure): a(r)>0 for r>0.

- TauCeti.HyperbolicVolumes.areaProfile_mono (functoriality): a is strictly increasing on [0,∞).

- TauCeti.HyperbolicVolumes.areaProfile_double (simp): a(2r)=4π sinh²r.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.areaProfile_zero (degenerate): a(0)=0.

- TauCeti.HyperbolicVolumes.areaProfile_tanh (computation): a(r)=4πt²/(1−t²), t=tanh(r/2).

- TauCeti.HyperbolicVolumes.areaProfile_small (characterisation): a(r)/(πr²) tends to one as r→0, r≠0.

**Acceptance:** The area profile a(r)=4π sinh²(r/2) for r≥0. The total scalar formula has no ball interpretation for negative r.

### Disc ball area formula

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/disc-ball-area. **Kind:** theorem.

For r≥0, ν_D(D(r))=ENNReal.ofReal(a(r)).

**Construction or proof route:** Apply the pinned polar-coordinate nonnegative-integral formula to the restricted density. Integrate 8πt/(1−t²)² on [0,tanh(r/2)], which is compactly inside [0,1); simplify with tanh²/(1−tanh²)=sinh².

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure, HyperbolicCurveVolumesAndGonality:HV.0/disc-balls, HyperbolicCurveVolumesAndGonality:HV.0/area-profile, mathlib:Complex.lintegral_comp_polarCoord_symm.

**Source:** bt, §1.3, pp.712–713.

**Acceptance:** For r≥0, ν_D(D(r))=ENNReal.ofReal(a(r)).

### Curvature rescaling

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/scaled-area. **Kind:** definition.

For λ>0, scaling the curvature −1 metric tensor by λ² gives distance λd₁ and area ν_λ=λ²ν_D; a_λ(r)=λ²a(r/λ). Its curvature is −1/λ². No scalar formula asserts a curvature theorem before the quotient tensor is constructed.

**Construction or proof route:** Metric length scales by λ, whereas pullback of the real two-form scales by λ². Translate the radius r to r/λ in the unscaled ball.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/area-profile.

**Source:** bt, Remark 24, p.735.

**API:**

- TauCeti.HyperbolicVolumes.scaledArea_unit (compatibility): λ=1 gives a.

- TauCeti.HyperbolicVolumes.scaledArea_rescale (functoriality): a_λ(λr)=λ²a(r) for λ>0.

- TauCeti.HyperbolicVolumes.scaledArea_comp (functoriality): Scaling twice multiplies the scale constants.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.scaledArea_zero (degenerate): a_λ(0)=0.

- TauCeti.HyperbolicVolumes.scaledArea_two (computation): a₂(2r)=4a(r).

- TauCeti.HyperbolicVolumes.scaledArea_wrong_length (non-example): Area at corresponding radii scales quadratically, not linearly.

**Acceptance:** For λ>0, scaling the curvature −1 metric tensor by λ² gives distance λd₁ and area ν_λ=λ²ν_D; a_λ(r)=λ²a(r/λ). Its curvature is −1/λ². No scalar formula asserts a curvature theorem before the quotient tensor is constructed.

### Max-product balls

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/max-product-balls. **Kind:** definition.

For n coordinates in D, B∞(x,r)={y: ∀i,d₁(x_i,y_i)<r}. Empty products give the full singleton product for every r; n>0 is required to identify this with a strict max-distance ball at r≤0.

**Construction or proof route:** Use coordinatewise d₁-sublevels; for nonempty Fin n, maximum of the finitely many coordinate distances gives the product metric. This defines neighborhoods only; the area form for complex curves is the sum, constructed in HV.2.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.productBall_mem (characterisation): Membership is the conjunction of coordinate sublevels.

- TauCeti.HyperbolicVolumes.productBall_mono (functoriality): r≤R gives inclusion of balls.

- TauCeti.HyperbolicVolumes.productBall_permute (functoriality): Permuting coordinates preserves the neighborhood.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.productBall_empty (degenerate): In zero coordinates the conjunction is vacuous.

- TauCeti.HyperbolicVolumes.productBall_center (degenerate): For n>0 the center is in the ball iff r>0.

- TauCeti.HyperbolicVolumes.productBall_max (compatibility): A pair of coordinate distances below r is sufficient, with no sum condition.

**Acceptance:** For n coordinates in D, B∞(x,r)={y: ∀i,d₁(x_i,y_i)<r}. Empty products give the full singleton product for every r; n>0 is required to identify this with a strict max-distance ball at r≤0.

### Hyperbolic lens radius

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/lens-radius. **Kind:** definition.

For R>0 define M(R)=2 artanh sqrt(tanh(R/2)). This upper bound for lens enclosures is independent of the separation parameter D.

**Construction or proof route:** Put s=tanh(R/2). The Euclidean lens from BT Figure 2 lies in |z|<sqrt(s), and the radial distance comparison gives M(R).

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance, HyperbolicCurveVolumesAndGonality:HV.0/disc-balls.

**Source:** bt, Lemma 13 and Figure 2, pp.724–725.

**API:**

- TauCeti.HyperbolicVolumes.lensRadius_pos (structure): M(R)>0 for R>0.

- TauCeti.HyperbolicVolumes.lensRadius_mono (functoriality): M is strictly increasing for positive R.

- TauCeti.HyperbolicVolumes.lensRadius_cosh (characterisation): cosh M(R)=exp R for R≥0.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.lensRadius_zero (degenerate): M(0)=0.

- TauCeti.HyperbolicVolumes.lensRadius_exceeds_R (non-example): M(R)>R for R>0; radius R alone is not this enclosure.

- TauCeti.HyperbolicVolumes.lensRadius_limit (computation): M(R)−R→log 2 as R→∞.

**Acceptance:** For R>0 define M(R)=2 artanh sqrt(tanh(R/2)). This upper bound for lens enclosures is independent of the separation parameter D.

### Normalized lens enclosure

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.0/normalized-lens. **Kind:** theorem.

For a∈[0,1), p=a and q=−a in D, D=d₁(p,0), R>0, a point u with d₁(u,p)<D+R and d₁(u,q)<D+R satisfies d₁(u,0)<M(R). The a=0 case is included.

**Construction or proof route:** Each hyperbolic ball is contained in a Euclidean disc centered at ±(1−s)/2 of radius (1+s)/2, with s=tanh(R/2). Add the two squared Euclidean distance inequalities to obtain |u|²<s, then use the radial distance API. The global midpoint lens theorem requires the geodesic-normalizing isometry supplied by FuchsianOrbifolds; it is a separate HV.4 target.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance, HyperbolicCurveVolumesAndGonality:HV.0/lens-radius, tauceti:TauCeti.hyperbolicDist_unitDiscMoebius.

**Source:** bt, Lemma 13 proof and Figure 2, pp.724–725.

**Acceptance:** For a∈[0,1), p=a and q=−a in D, D=d₁(p,0), R>0, a point u with d₁(u,p)<D+R and d₁(u,q)<D+R satisfies d₁(u,0)<M(R). The a=0 case is included.

## HV.1: Invariant scalar diagonal potentials

Define μ=tanh²(d₁/4), χ=tanh²(d₁/2) and ψ(z,w)=χ(z,w̄), prove their formulas, ranges, zero loci and simultaneous or conjugate action invariance. Prove χ=4μ/(1+μ)², F=−8πlog(1−μ), H(log μ)=log(χ/(1−χ)) off Δ and H′ at radius r equals cosh r. Define f(s)=−log(1−s), g(t)=2asin√(1−e^(−t)) and prove g′(2log cosh r)=1/sinh r. Reject the conjugate diagonal as a complex divisor by its totally real tangent plane. These are scalar formulas; extended-real log μ and psh/current claims are HV.3/HV.5 targets.

**Inputs:** HyperbolicCurveVolumesAndGonality:HV.0.

**Coverage:** The local contracts of this layer are closed at the declaration level; their theorem proofs remain specifications.

### Diagonal distance potential μ

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu. **Kind:** definition.

For z,w∈D define μ(z,w)=tanh²(d₁(z,w)/4). The Lean scalar formula uses tanh(hyperbolicDist(z,w)/2). Geometric claims require both arguments in D.

**Construction or proof route:** Use the factor-two bridge; the half-distance to the diagonal is d₁(z,w)/2, and its anti-diagonal radial coordinate has squared modulus μ. Distance invariance under a common disc automorphism gives simultaneous-action invariance.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance, tauceti:TauCeti.hyperbolicDist_unitDiscMoebius.

**Source:** bt, §5.1, pp.732–733.

**API:**

- TauCeti.HyperbolicVolumes.diagonalMu_range (structure): 0≤μ<1 for z,w∈D.

- TauCeti.HyperbolicVolumes.diagonalMu_eq_zero (characterisation): μ=0 iff z=w on D.

- TauCeti.HyperbolicVolumes.diagonalMu_moebius (functoriality): A common disc Möbius change of chart preserves μ.

- TauCeti.HyperbolicVolumes.diagonalMu_invariant (functoriality): Every common distance-preserving change of chart preserves μ.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.diagonalMu_self (degenerate): μ(z,z)=0.

- TauCeti.HyperbolicVolumes.diagonalMu_antigraph (computation): μ(z,−z)=|z|² for |z|<1.

- TauCeti.HyperbolicVolumes.diagonalMu_not_chi (non-example): For nonzero z∈D, μ(z,0)<χ(z,0)=|z|².

**Acceptance:** For z,w∈D define μ(z,w)=tanh²(d₁(z,w)/4). The Lean scalar formula uses tanh(hyperbolicDist(z,w)/2). Geometric claims require both arguments in D.

### Diagonal pseudohyperbolic potential χ

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi. **Kind:** definition.

For z,w∈D, χ(z,w)=|(z−w)/(1−w̄z)|²=tanh²(d₁(z,w)/2). This is the square of the existing pseudohyperbolic expression, not a new distance.

**Construction or proof route:** Reuse pseudoHyperbolicExpr and tanh_hyperbolicDist; the latter has the half-curvature distance convention.

**Direct prerequisites:** tauceti:TauCeti.pseudoHyperbolicExpr, tauceti:TauCeti.tanh_hyperbolicDist, HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance.

**Source:** bt, §5.1, pp.732–733.

**API:**

- TauCeti.HyperbolicVolumes.diagonalChi_formula (projection): χ is the squared modulus of the explicit quotient.

- TauCeti.HyperbolicVolumes.diagonalChi_distance (compatibility): χ=tanh²(d₁/2) on D.

- TauCeti.HyperbolicVolumes.diagonalChi_moebius (functoriality): A common disc Möbius change of chart preserves χ.

- TauCeti.HyperbolicVolumes.diagonalChi_range (structure): 0≤χ<1 on D.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.diagonalChi_self (degenerate): χ(z,z)=0.

- TauCeti.HyperbolicVolumes.diagonalChi_origin (computation): χ(z,0)=|z|².

- TauCeti.HyperbolicVolumes.diagonalChi_antigraph (computation): χ(z,−z)=4|z|²/(1+|z|²)².

**Acceptance:** For z,w∈D, χ(z,w)=|(z−w)/(1−w̄z)|²=tanh²(d₁(z,w)/2). This is the square of the existing pseudohyperbolic expression, not a new distance.

### Double-angle potential relation

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/chi-mu-relation. **Kind:** lemma.

For z,w∈D, χ=4μ/(1+μ)² and 1−χ=(1−μ)²/(1+μ)².

**Construction or proof route:** Apply the tanh double-angle identity to t=d₁/4; square and rearrange. The two equalities are one algebraic identity and its complement.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu, HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi.

**Source:** bt, §5.1, pp.732–733.

**Acceptance:** For z,w∈D, χ=4μ/(1+μ)² and 1−χ=(1−μ)²/(1+μ)².

### Conjugate-diagonal potential ψ

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi. **Kind:** definition.

For z,w∈D define ψ(z,w)=χ(z,w̄)=|(w̄−z)/(1−zw)|². Its zero locus is the real analytic graph w=z̄, not a complex hypersurface.

**Construction or proof route:** Conjugation preserves the unit disc; substitute it in χ. For a disc automorphism A, the conjugate action is (z,w)↦(Az,conj(A(conj(w)))); under it ψ is invariant.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi.

**Source:** erratum, §3, Proposition 3.1 proof, pp.2–3.

**API:**

- TauCeti.HyperbolicVolumes.conjugatePsi_formula (projection): ψ=|(w̄−z)/(1−zw)|².

- TauCeti.HyperbolicVolumes.conjugatePsi_zero (characterisation): ψ=0 iff w=z̄ for disc points.

- TauCeti.HyperbolicVolumes.conjugatePsi_invariant (functoriality): Conjugate-diagonal actions preserving χ preserve ψ.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.conjugatePsi_graph (degenerate): ψ(z,z̄)=0.

- TauCeti.HyperbolicVolumes.conjugatePsi_origin (computation): ψ(0,w)=|w|².

- TauCeti.HyperbolicVolumes.conjugatePsi_not_diagonal (non-example): At a nonreal z∈D, ψ(z,z)>0.

**Acceptance:** For z,w∈D define ψ(z,w)=χ(z,w̄)=|(w̄−z)/(1−zw)|². Its zero locus is the real analytic graph w=z̄, not a complex hypersurface.

### Conjugate diagonal is totally real

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/conjugate-tangent. **Kind:** lemma.

The tangent plane T={(v,w)∈ℂ²:w=v̄} is not invariant under multiplication by i: (1,1)∈T but (i,i)∉T. Thus the conjugate graph cannot be treated as a complex divisor.

**Construction or proof route:** Compute conjugation of i. This coordinate tangent calculation suffices to reject the complex-divisor interpretation. Global change of charts belongs to HV.5.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi.

**Source:** erratum, §3, Proposition 3.1 proof, pp.2–3.

**Acceptance:** The tangent plane T={(v,w)∈ℂ²:w=v̄} is not invariant under multiplication by i: (1,1)∈T but (i,i)∉T. Thus the conjugate graph cannot be treated as a complex divisor.

### Diagonal area potential profile

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/diagonal-positive-profile. **Kind:** definition.

F(z,w)=−8π log(1−μ(z,w)). The argument of log is positive on D², including the diagonal; this is a finite scalar function. Its plurisubharmonicity and ddᶜ domination are HV.3 targets.

**Construction or proof route:** Use 0≤μ<1 to obtain a well-defined smooth scalar logarithm away from μ’s nonsmooth locus. The profile is zero at μ=0. Restrict to (z,−z): F=−8π log(1−|z|²). This calibrates the area constant without assuming a current inequality.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu.

**Source:** bt, §5.1, pp.732–733.

**API:**

- TauCeti.HyperbolicVolumes.diagonalAreaPotential_nonneg (structure): F≥0 on D².

- TauCeti.HyperbolicVolumes.diagonalAreaPotential_formula (projection): The profile is −8π log(1−μ).

- TauCeti.HyperbolicVolumes.diagonalAreaPotential_invariant (functoriality): Invariance of μ transports to F.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.diagonalAreaPotential_self (degenerate): F(z,z)=0.

- TauCeti.HyperbolicVolumes.diagonalAreaPotential_antigraph (computation): F(z,−z)=−8πlog(1−|z|²).

- TauCeti.HyperbolicVolumes.diagonalAreaPotential_positive (non-example): F(z,0)>0 for nonzero z∈D.

**Acceptance:** F(z,w)=−8π log(1−μ(z,w)). The argument of log is positive on D², including the diagonal; this is a finite scalar function. Its plurisubharmonicity and ddᶜ domination are HV.3 targets.

### Relative diagonal logarithmic profile

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/relative-log-profile. **Kind:** definition.

For s<0 set H(s)=log(4eˢ/(1−eˢ)²). Off the diagonal, H(log μ)=log(χ/(1−χ)); H′(log tanh²(r/2))=cosh r for r>0. The scalar function is used only on this domain; log μ at μ=0 is an extended-real singularity owned by HV.3.

**Construction or proof route:** Substitute the χ–μ relation and differentiate H(s)=log4+s−2log(1−eˢ). H′=(1+eˢ)/(1−eˢ); putting eˢ=tanh²(r/2) gives cosh r.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.1/chi-mu-relation.

**Source:** bt, Proposition 23 proof, p.735.

**API:**

- TauCeti.HyperbolicVolumes.relativeLogProfile_expand (characterisation): H(s)=log4+s−2log(1−eˢ), s<0.

- TauCeti.HyperbolicVolumes.relativeLogProfile_deriv (data): H′=(1+eˢ)/(1−eˢ), s<0.

- TauCeti.HyperbolicVolumes.relativeLogProfile_chi (compatibility): H(log μ)=log(χ/(1−χ)) off Δ.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.relativeLogProfile_slope (computation): At radius r>0 the slope is cosh r.

- TauCeti.HyperbolicVolumes.relativeLogProfile_value (computation): H(log(1/4))=log(16/9).

- TauCeti.HyperbolicVolumes.relativeLogProfile_injective (characterisation): H is strictly increasing on s<0.

**Acceptance:** For s<0 set H(s)=log(4eˢ/(1−eˢ)²). Off the diagonal, H(log μ)=log(χ/(1−χ)); H′(log tanh²(r/2))=cosh r for r>0. The scalar function is used only on this domain; log μ at μ=0 is an extended-real singularity owned by HV.3.

### Conjugate area profile f

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/conjugate-f-profile. **Kind:** definition.

For 0≤s<1 define f(s)=−log(1−s). For ψ=tanh²(d/2), f(ψ)=2log cosh(d/2). The identity i∂∂̄f(ψ)=ω/2 is a separate current target.

**Construction or proof route:** Use 1−tanh²t=cosh(t)⁻² and logarithm identities; the analytic positivity computation is not assumed by this scalar definition.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi.

**Source:** erratum, §3, Proposition 3.1 proof, pp.2–3.

**API:**

- TauCeti.HyperbolicVolumes.conjugateAreaProfile_nonneg (structure): f≥0 on [0,1).

- TauCeti.HyperbolicVolumes.conjugateAreaProfile_deriv (data): f′(s)=1/(1−s) for s<1.

- TauCeti.HyperbolicVolumes.conjugateAreaProfile_tanh (compatibility): f(tanh²r)=2log cosh r.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.conjugateAreaProfile_zero (degenerate): f(0)=0.

- TauCeti.HyperbolicVolumes.conjugateAreaProfile_half (computation): f(1/2)=log2.

- TauCeti.HyperbolicVolumes.conjugateAreaProfile_blowup (non-example): f(s)→∞ as s→1 from below.

**Acceptance:** For 0≤s<1 define f(s)=−log(1−s). For ψ=tanh²(d/2), f(ψ)=2log cosh(d/2). The identity i∂∂̄f(ψ)=ω/2 is a separate current target.

### Conjugate positive profile g

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.1/conjugate-g-profile. **Kind:** definition.

For t≥0 define g(t)=2asin sqrt(1−e^(−t)). Then g(f(s))=2asin sqrt(s) for 0≤s<1 and g′(2log cosh r)=1/sinh r for r>0. The positivity of i∂∂̄(g∘f∘ψ) is a separate HV.5 theorem.

**Construction or proof route:** The composition follows from e^(−f(s))=1−s. For t>0, g′(t)=1/sqrt(eᵗ−1); substitute eᵗ=cosh²r and use r>0.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.1/conjugate-f-profile.

**Source:** erratum, §3, Proposition 3.1 proof, pp.2–3.

**API:**

- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_comp (compatibility): g(f(s))=2asin sqrt s on [0,1).

- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_deriv (data): g′(t)=1/sqrt(eᵗ−1) for t>0.

- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_mono (structure): g is strictly increasing on [0,∞).

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_zero (degenerate): g(0)=0.

- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_log_two (computation): g(log2)=π/2.

- TauCeti.HyperbolicVolumes.conjugatePositiveProfile_slope (computation): g′(2log cosh r)=1/sinh r, r>0.

**Acceptance:** For t≥0 define g(t)=2asin sqrt(1−e^(−t)). Then g(f(s))=2asin sqrt(s) for 0≤s<1 and g′(2log cosh r)=1/sinh r for r>0. The positivity of i∂∂̄(g∘f∘ψ) is a separate HV.5 theorem.

## HV.2: Analytic cycles and normalization integration

Define locally finite effective complex one-cycles, analytic normalization and integration of Σprᵢ*ω_X with cycle weights. Define branch multiplicity and mult_ξ(C), including degree-d parameterizations and proper finite-map pushforward laws. Construct quotient metric/form descent via Fuchsian charts and compare to the existing invariant half-plane measure. Prove chart independence and weighted integration. Supply local sum-density and nonnegative source-integral formulas, fibre equality a(r), anti-graph equality 2a(r), the power-map degree factor, and zero contribution of a constant cusp coordinate. Pin ρ_X as half the compact systole; do not use a positive global pointwise injectivity radius for a cusped quotient.

**Inputs:** HyperbolicCurveVolumesAndGonality:HV.0, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces.

**Coverage:** This layer remains open. The targets above are not asserted to have a closed source-to-declaration decomposition.

### Parametrized sum area density

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.2/parameter-area-density. **Kind:** definition.

For holomorphic f=(f₁,…,fₙ):U→Dⁿ, the pulled-back sum area form has density q_f(t)=Σᵢ b(fᵢ(t))|fᵢ′(t)|² relative to dxdy. Each constant coordinate contributes zero. The total expression is used geometrically only on an open U with DifferentiableOn ℂ fᵢ U and fᵢ(U)⊆D.

**Construction or proof route:** Pull back each ω_D by a holomorphic coordinate; the real Jacobian equals the squared modulus of the complex derivative. Add the coordinate densities; do not take their maximum or their product.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.parameterDensity_nonneg (structure): q_f≥0 everywhere.

- TauCeti.HyperbolicVolumes.parameterDensity_ext (extensionality): Equality of coordinate maps gives equality of densities.

- TauCeti.HyperbolicVolumes.parameterDensity_constant (simp): All constant coordinates give zero density.

- TauCeti.HyperbolicVolumes.parameterDensity_reparam (functoriality): Under a holomorphic parameter change h, q_(f∘h)(t)=q_f(h(t))|h′(t)|².

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.parameterDensity_fibre (computation): For (t,c), q=b(t).

- TauCeti.HyperbolicVolumes.parameterDensity_antigraph (computation): For (t,−t), q=2b(t).

- TauCeti.HyperbolicVolumes.parameterDensity_cusp_constant (degenerate): Any constant coordinate has zero complex derivative, including the constant q=0 cusp coordinate.

**Acceptance:** For holomorphic f=(f₁,…,fₙ):U→Dⁿ, the pulled-back sum area form has density q_f(t)=Σᵢ b(fᵢ(t))|fᵢ′(t)|² relative to dxdy. Each constant coordinate contributes zero. The total expression is used geometrically only on an open U with DifferentiableOn ℂ fᵢ U and fᵢ(U)⊆D.

### Parametrized volume

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume. **Kind:** construction.

V(f,U)=∫⁻_U ENNReal.ofReal(q_f(t)) dxdy for a holomorphic parameter map into Dⁿ. This integrates over the source and counts the degree of a parameterization. Global cycle volume on normalized branches is a distinct unconstructed target.

**Construction or proof route:** The nonnegative density defines the integral without assuming finite total volume. For injective holomorphic reparameterizations apply the pinned Jacobian change-of-variables theorem and the density chain rule. A finite non-injective map requires degree counting, not the injective theorem alone.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.2/parameter-area-density, mathlib:MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul.

**Source:** bt, §1.3, pp.712–713.

**API:**

- TauCeti.HyperbolicVolumes.parameterVolume_mono (functoriality): U⊆W implies V(f,U)≤V(f,W).

- TauCeti.HyperbolicVolumes.parameterVolume_ext (extensionality): Equal density on U gives equal volume.

- TauCeti.HyperbolicVolumes.parameterVolume_reparam (functoriality): An injective holomorphic parameter change preserves the source integral after changing its domain.

- TauCeti.HyperbolicVolumes.parameterVolume_weight (structure): Weight m multiplies the local volume by m; weights are not erased by taking the image set.

**Discriminating tests:**

- TauCeti.HyperbolicVolumes.parameterVolume_empty (degenerate): V(f,∅)=0.

- TauCeti.HyperbolicVolumes.parameterVolume_constant (degenerate): The volume of a constant map is zero.

- TauCeti.HyperbolicVolumes.parameterVolume_zero_dimension (degenerate): There is zero pulled-back sum area in D⁰.

**Acceptance:** V(f,U)=∫⁻_U ENNReal.ofReal(q_f(t)) dxdy for a holomorphic parameter map into Dⁿ. This integrates over the source and counts the degree of a parameterization. Global cycle volume on normalized branches is a distinct unconstructed target.

### Point-volume equality for a fibre

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.2/fibre-volume. **Kind:** theorem.

For c∈D and r≥0, V(t↦(t,c),D(r))=a(r). This is the local equality model for the point-volume estimate.

**Construction or proof route:** The constant coordinate has zero derivative, leaving exactly b(t). Apply disc-ball-area to D(r).

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume, HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure, HyperbolicCurveVolumesAndGonality:HV.0/area-profile, HyperbolicCurveVolumesAndGonality:HV.0/disc-balls, HyperbolicCurveVolumesAndGonality:HV.0/disc-ball-area.

**Source:** bt, Theorem 19 and equality discussion, p.732.

**Acceptance:** For c∈D and r≥0, V(t↦(t,c),D(r))=a(r). This is the local equality model for the point-volume estimate.

### Graph-of-minus-identity volume

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.2/antigraph-volume. **Kind:** theorem.

For r≥0, V(t↦(t,−t),D(r))=2a(r). Since μ(t,−t)=|t|², D(r) is exactly the preimage of the diagonal radius-r tube; the intersection at zero has multiplicity one.

**Construction or proof route:** Both coordinate densities equal b(t), so the sum is 2b(t). Use the anti-graph μ computation and disc-ball-area. Intersection multiplicity one follows from the local equation (−t)−t=−2t, not from point multiplicity by convention.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume, HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu, HyperbolicCurveVolumesAndGonality:HV.0/area-profile, HyperbolicCurveVolumesAndGonality:HV.0/disc-balls, HyperbolicCurveVolumesAndGonality:HV.0/disc-ball-area.

**Source:** bt, Theorem 19 equality discussion, p.732.

**Acceptance:** For r≥0, V(t↦(t,−t),D(r))=2a(r). Since μ(t,−t)=|t|², D(r) is exactly the preimage of the diagonal radius-r tube; the intersection at zero has multiplicity one.

### Degree-d parameterization volume

**Declaration:** HyperbolicCurveVolumesAndGonality:HV.2/power-parameter-volume. **Kind:** theorem.

For d≥1, 0≤s<1 and c∈D, V(t↦(tᵈ,c),{|t|<s})=d·4πs^(2d)/(1−s^(2d)). This counts the covering degree d; replacing the source by its image without degree loses this factor.

**Construction or proof route:** Differentiate tᵈ: |(tᵈ)′|²=d²|t|^(2d−2). Multiply by b(tᵈ). Use polar coordinates and substitute v=tᵈ in the one-dimensional radial integral; the result is d times the area of the image subdisc. This explicit model does not assert a general finite-map area formula; that belongs to the normalized-cycle construction.

**Direct prerequisites:** HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume, HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density, mathlib:Complex.lintegral_comp_polarCoord_symm.

**Source:** bt, §1.3, pp.712–713.

**Acceptance:** For d≥1, 0≤s<1 and c∈D, V(t↦(tᵈ,c),{|t|<s})=d·4πs^(2d)/(1−s^(2d)). This counts the covering degree d; replacing the source by its image without degree loses this factor.

**Work to close this layer:**

- Construct analytic cycles and their normalizations globally, branch/local multiplicity and weighted finite-map pushforward. Prove global chart independence; the present parameterVolume is a source integral, not an image-cycle invariant.

- Descend the uniformized metric/form to X and prove the half-plane invariant-measure comparison through Fuchsian charts. Define compact ρ_X via half the systole; separate cusped systolic invariants from pointwise injectivity radius.

- Prove constant q=0 contributes zero after cusp completion with the actual singular target metric, not only for the present smooth disc formula.

## HV.3: Positive currents, singular Stokes and canonical area

Construct test forms, currents and positive (1,1)-currents with chart independence and actual continuity topology; construct extended-real psh functions and their locally integrable distributional derivatives. Set dᶜ=i(∂̄−∂)/(4π) on real functions, ddᶜ=i∂∂̄/(2π), half Demailly’s normalization. Prove ddᶜlog|h|²=[div(h)] and singular Stokes on normalized curve branches by regular-level approximation, with atomic multiplicities. Prove log μ is psh with value −∞ on Δ, F is psh and ddᶜF≤ω_D². Construct Hermitian line-bundle curvature and Chern–Weil comparison for K_X; prove c₁(K_X)=[ω_X]/(2π) and vol(C)=2π(K_Xⁿ·C), including cycle weights. Import algebraic intersections and analytification/GAGA, not analytic currents, from SF.5/C0–C4.

**Inputs:** HyperbolicCurveVolumesAndGonality:HV.1, HyperbolicCurveVolumesAndGonality:HV.2, SchemeAndStackFoundations:SF.5, ComplexComparisonPartII:C0, ComplexComparisonPartII:C2, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts.

**Coverage:** This layer remains open. The targets above are not asserted to have a closed source-to-declaration decomposition.

**Work to close this layer:**

- Read Demailly Chapter I differential forms/currents and Chapter II analytic normalization; complete Chapter III §§1–5 and the exact Lelong–Jensen results required by BT. Build continuity topology on compactly supported test forms, positive currents, psh regularization and branchwise singular Stokes.

- Decompose the Hessian computations proving log μ psh and ddᶜF≤ω; prove the log-singularity/Poincaré–Lelong atomic normalization before using BT equation (7).

- Construct Chern–Weil curvature comparison and the analytic-to-algebraic canonical pairing using SF.5 and C0–C4; function-field canonical degree alone is insufficient.

## HV.4: Hwang–To point and diagonal volumes

For compact curvature −1 hyperbolic X, ρ_X>0, an effective curve cycle C and 0<r<ρ_X, prove vol(C∩B∞(ξ,r))≥a(r)mult_ξ(C). For 0<r<ρ_X/2 and no diagonal component, prove vol(C∩{d_X(x,y)<2r})≥2a(r)(C·Δ). Define I(r)=∫ddᶜF, prove I(r)/a(r) monotone and its Lelong limit at least 2(C·Δ). For Δ₂={(x,y,x,y)}⊂X⁴, and every component of C not contained in Δ₂, prove vol(C∩B∞(Δ₂,r))≥2a(r)Σ_{ξ∈C∩Δ₂}mult_ξ(C); this is a point sum, not divisor intersection with a codimension-two locus. Prove the global midpoint lens bound using the existing geodesic-normalizing isometries.

**Inputs:** HyperbolicCurveVolumesAndGonality:HV.3, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups, SchemeAndStackFoundations:SF.5.

**Coverage:** This layer remains open. The targets above are not asserted to have a closed source-to-declaration decomposition.

**Work to close this layer:**

- Obtain and read original Hwang–To 2002 Theorem 2 and 2012 Theorem 1/Lemma 5, including proofs; current public searches/DOI endpoints yielded no full text. Record exact hypotheses and constants against the max-neighborhood/sum-form convention.

- Plan the quotient tube lift, point-volume proof, I(r) regular-level Stokes and Lelong limit, and the X⁴ tie-boundary argument of BT Lemma 22 without hiding its orientation/positivity step.

- Extend the normalized lens lemma via the geodesic-normalizing isometries exported by FuchsianOrbifolds Layer 2.

## HV.5: Relative diagonal and conjugate-diagonal volumes

For C with no diagonal component, construct ddᶜlog(χ/(1−χ))=ω/(4π)+[Δ], with the corrected smooth coefficient, and prove V_Δ(r)/cosh r monotone for 0<r<ρ_X/2. On X×Xbar construct the real analytic conjugate diagonal, its tubes and conjugate-chart invariance; prove i∂∂̄(f∘ψ)=ω/2 and i∂∂̄(g∘f∘ψ)≥0 as currents. Singular Stokes gives V_barΔ(r)=2sinh r·∫i∂∂̄(g∘f∘ψ), hence V_barΔ(r)/√a(2r) monotone. For 0<r<R<ρ_X/2 prove V_barΔ(r)≤(sinh r/sinh R)V_barΔ(R); the reciprocal printed in the erratum is rejected. Rescale radii, ρ and forms for curvature −1/λ²; use cosh(r/λ) and √a_λ(2r). Define no algebraic intersection with barΔ.

**Inputs:** HyperbolicCurveVolumesAndGonality:HV.1, HyperbolicCurveVolumesAndGonality:HV.3, HyperbolicCurveVolumesAndGonality:HV.4.

**Coverage:** This layer remains open. The targets above are not asserted to have a closed source-to-declaration decomposition.

**Work to close this layer:**

- Construct quotient and conjugate-quotient tubes with radii <ρ_X/2, then plan the corrected current identity and the two relative monotonicity proofs.

- Compute the erratum Hessian matrices and prove positive-current extensions across ψ=0; derive the small/large sinh ratio in the correct direction and all λ-rescaling formulas.

## HV.6: Gonality on smooth projective models

For a smooth projective geometrically connected curve B/k define gon_k(B) as the minimum positive degree of a finite nonconstant k-morphism to P¹_k, with existence proved. For opens and integral image curves use the smooth projective normalization/completion imported from AlgebraicCurves/ComplexComparisonPartII. Prove extension-field monotonicity and equality for algebraically closed k, with a finite-type descent/specialization argument. Over algebraically closed k prove gon≤g+1 by Riemann–Roch. Separately prove gon≤floor((g+3)/2) in characteristic zero using the pencil case of Brill–Noether existence, and prove equality on a nonempty Zariski-open locus in M_g over ℂ. Supply gon(P¹)=1 and gon(genus-one B)=2 over algebraically closed k; a nonsplit genus-zero curve is not assigned gonality one from genus alone. Import function-field RR, canonical degree, ramification and projective models.

**Inputs:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula, tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications, ComplexComparisonPartII:C0, ComplexComparisonPartII:C1, ComplexComparisonPartII:C2, ComplexComparisonPartII:C3, ComplexComparisonPartII:C4.

**Coverage:** This layer remains open. The targets above are not asserted to have a closed source-to-declaration decomposition.

**Work to close this layer:**

- Acquire a public primary Brill–Noether source for existence and generic sharpness; Abramovich only cites the theorem. Construct actual gonality against imported finite morphisms/models, prove minimum existence and algebraically closed base-change equality via descent/specialization.

- Derive gon≤g+1 from pinned function-field RR and its curve dictionary; plan the separate Brill–Noether bound and P¹/genus-one/nonrational-conic tests. Do not privately reconstruct P¹ or projective models.

## HV.7: Conformal area, finite-area cusps and Li–Yau

Define V_c(n,φ)=sup_{A∈Conf(Sⁿ)}Area(A∘φ) for nondegenerate branched conformal immersions, V_c(n,M)=inf_φ V_c(n,φ), and stable conformal area A_c. Prove conformal invariance, degree-d comparison, and V_c(n,S²)=4π for n≥2. Prove λ₁Area≤2A_c≤8πgon for compact Riemann surfaces by conformal barycenter balancing and the Rayleigh quotient. Extend to the finite-area hyperbolic metric with cusps/elliptic singularities, using λ′₁=inf positive Rayleigh quotients, identified with min(λ₁,1/4) when the discrete eigenvalue exists. Prove coordinate test functions have finite Dirichlet energy and mean-zero normalization by Abramovich’s conformal argument. Import the congruence spectral gap from the separately routed AutomorphicSpectralTheory extension; never prove that automorphic theorem here. State the resulting gonality lower bound gon≥λ′₁Area/(8π), with modular-curve area/index inputs imported.

**Inputs:** HyperbolicCurveVolumesAndGonality:HV.2, HyperbolicCurveVolumesAndGonality:HV.6, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications.

**Coverage:** This layer remains open. The targets above are not asserted to have a closed source-to-declaration decomposition.

**Work to close this layer:**

- Decompose the inspected Li–Yau §§1–2 Theorem 1 proof into barycenter balancing, Rayleigh inequality, sphere value and degree comparison; trace and inspect its supporting topological and variational inputs. The browser can read the PDF; the local endpoint returns 403.

- Reconcile stable Li–Yau conformal area with Abramovich’s sphere-map formulation; prove finite Dirichlet energy and mean-zero test conditions for cusp/elliptic singular metrics.

- Read the AutomorphicSpectralTheory congruence-gap extension once defined (design issue #1699). Add its exact stage/node request and spectrum/Rayleigh compatibility; never guess the future stage id.

## Current normalization and source corrections

The real operator used here is dᶜ=i(∂̄−∂)/(4π). Consequently ddᶜ=i∂∂̄/(2π), half the operator Demailly uses in Chapter III §3. Demailly’s formula ddᶜ_Dem log|h|=[div h] becomes ddᶜ log|h|²=[div h]. The paper expresses purely imaginary forms as measures; translating to real forms is explicit. On a holomorphic coordinate t, ω_D=4(1−|t|²)⁻² dxdy. On the anti-graph (t,−t), its sum pullback is twice that form. Thus the potential F=−8πlog(1−|t|²) has the correct calibration: ddᶜF equals that doubled pullback form.

The scalar relative profile must be used off the diagonal. There log μ has a genuine logarithmic pole. In the current theory its value on the diagonal is −∞, not Mathlib’s total real logarithm of zero. A continuation constructs the locally integrable extension and its divisor atom. The corrected smooth term in the BT Proposition 23 display has coefficient −1 rather than −1/(2π); the final ω/(4π)+[Δ] is the intended one. This is the already confirmed PAPER-BAKKER-TSIMERMAN-16/E10 finding.

For the conjugate diagonal there is no divisor atom (C·barΔ). The positive potential from the erratum replaces that argument. If V(r)/sinh r is nondecreasing, then for 0<r<R one has V(r)≤sinh(r)V(R)/sinh(R). This is a small factor; its reciprocal printed in the erratum §4.1 is the already confirmed E4 finding. These source issues are carried into the packet with provenance, not presented as new discoveries or new independent reviews.


## Endpoint acceptance obligations

A complete continuation must type the global cycle and current interfaces on actual imported manifolds, with measure coefficients and the test-form topology constructed. No structure with fields asserting Hwang–To, Li–Yau or a final monotonicity inequality satisfies this roadmap. Every definition gets change-of-chart, functoriality, extensionality, scaling and multiplicity laws where applicable, and at least three discriminating tests.

The required global tests are the fiber point-volume equality, the graph-of-minus-identity diagonal-volume equality, and the power-map factor d already prototyped here; the cusp-chart zero-coordinate test on the actual singular target; 0<r<R in both relative tube bounds, with the small/large sinh ratio; the conjugate diagonal’s noncomplex tangent test and absence of an algebraic intersection; gonality one for P¹ and two for genus-one curves over algebraically closed fields. The genus-zero nonsplit conic distinguishes rationality from genus. Gon≤g+1 and the characteristic-zero Brill–Noether floor((g+3)/2) bound are separate theorems with separate proof suppliers.

The Li–Yau comparison must use the correct Rayleigh invariant. For a complete finite-area quotient with cusps, continuous spectrum begins at 1/4; λ′₁ is the bottom of the positive spectrum, not an asserted first discrete eigenvalue. Its equality to min(λ₁,1/4) requires a discrete λ₁ to exist. A smooth compactification test function has finite Dirichlet energy by conformal invariance, while its L² norm and mean use the singular hyperbolic area. The congruence spectral theorem is imported with its domain and normalization intact. Conformal area is constructed from the Li–Yau supremum/infimum convention and compared explicitly to Abramovich’s sphere-map expression before using either one.


## Sources read and sources to acquire

- [Benjamin Bakker and Jacob Tsimerman, p-torsion monodromy representations of elliptic curves over geometric function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Annals of Mathematics 184 (2016), no.3, 709–744, published version. Read: §1.3 pp.712–713; Lemma 13 and Figure 2 pp.724–725; §§5.1–5.2 pp.732–735; Canonical degree paragraph p.736. Accessed 2026-10-05.

- [Benjamin Bakker and Jacob Tsimerman, Erratum to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), Undated five-page author erratum; no publication date inferred. Read: All five pages; §3 pp.2–3 and reversed ratio in §4.1 p.3 checked. Accessed 2026-10-05.

- [Jean-Pierre Demailly, Complex Analytic and Differential Geometry](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), Version of Thursday June 21, 2012. Read: Chapter III §2.C pp.141–144, especially (2.15); Chapter III §3 opening and (3.1), p.144; no claim to have completed the analytic-current prerequisite development. Accessed 2026-10-05.

- [Dan Abramovich, A linear lower bound on the gonality of modular curves](https://arxiv.org/pdf/alg-geom/9609012), arXiv alg-geom/9609012v1 (16 September 1996); regenerated internal heading October 23, 2018. Read: §§0.1–1.8 pp.1–3, including singular metric, λ′₁ Rayleigh characterization and conformal area proof. Accessed 2026-10-05.

- [Peter Li and Shing-Tung Yau, A New Conformal Invariant and Its Applications to the Willmore Conjecture and the First Eigenvalue of Compact Surfaces](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), Inventiones mathematicae 69 (1982), 269–291; public scanned PDF viewed through browser. Read: §1 definitions (1.2)–(1.4), Facts 1–2, pp.271–272; §2 Theorem 1 proof pp.273–276 and Corollary pp.276–277. Proof inspected but not yet decomposed into declaration nodes.. Accessed 2026-10-05.

The original Hwang–To 2002 and 2012 texts, a primary Brill–Noether existence/sharpness source, the remainder of the Demailly prerequisite chain and the supporting inputs to Li–Yau’s Theorem 1 proof are source obligations. BT’s alternate proof was read but does not discharge the unread original point-volume proof or its cited local Lelong calculation. Source PDFs and extracted text are kept out of the repository.
