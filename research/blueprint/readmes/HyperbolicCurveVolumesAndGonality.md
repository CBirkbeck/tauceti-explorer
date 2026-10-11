# Fuchsian groups and orbifold Riemann surfaces, Part II: volumes and gonality of hyperbolic curves

This roadmap extends FuchsianOrbifolds beyond quotient charts, polygon geometry, cusp compactification and finite-map degree. Its targets are analytic cycle volume, positive currents, diagonal tube estimates, algebraic gonality and conformal area. It builds on the current DifferentialGeometry roadmap for smooth forms, ordinary Stokes, de Rham theory, degree and Riemannian geometry. Function-field Riemann–Roch and smooth projective models remain in AlgebraicCurves; algebraic intersections remain in SchemeAndStackFoundations SF.5; analytic/algebraic comparison remains in ComplexComparisonPartII C0–C4. The congruence spectral gap belongs to the separate AutomorphicSpectralTheory extension.

**Partial checkpoint, 11 October 2026.** All eight layers have target-level statements, proof routes and dependency requests. HV.0/HV.1 have local signature coverage; HV.2–HV.7 have the explicitly unresolved inputs listed below. The suggested Lean file elaborates local metric, density, parameter integral, distribution, Hessian, tube and function-field-gonality prototypes. It omits global carrier-dependent signatures. Neither elaboration nor a successful packet check establishes mathematical closure or formalized proofs.

## Conventions and imports

Curvature is −1. Write d₁=2d_TauCeti on PoincareDisc; Mathlib’s upper-half-plane distance already has curvature −1. The disc form is ω=2i dz∧dbarz/(1−|z|²)², its area density is 4/(1−|z|²)², and a(r)=4πsinh²(r/2). Neighborhoods in products use the maximum coordinate distance; curve volume integrates the sum of pulled-back forms. For curvature −1/λ², distances and the compact injectivity radius scale by λ, while forms and areas scale by λ².

Set dᶜ=i(∂bar−∂)/(4π), hence ddᶜ=i∂∂bar/(2π). This is half Demailly’s operator. In a complex-line chart it is the distributional Laplacian divided by 4π. Thus ddᶜlog|h|²=[div(h)] and c₁(K_X)=[ω_X]/(2π). The extended-real logarithm takes −∞ at a pole; Lean’s total real logarithm is used only as a locally integrable representative or away from the zero locus.

For a compact smooth hyperbolic curve, ρ_X is half its systole. Point comparisons require 0<r<ρ_X; diagonal and conjugate-diagonal tubes use d_X(x,y)<2r and require 0<r<ρ_X/2. Cusped quotients have no positive global injectivity radius. Analytic cycles retain positive integer weights. Source integration under a degree-d parameterization counts degree d; a primitive normalization of the image defines image multiplicity.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 24 declarations read at these pins. Mathlib already supplies TestFunction, its LF topology and universal property, Distribution, Dirac evaluation and directional derivatives. HV.3 assembles form-valued chart coefficients and global current transport from these inputs; it does not rebuild the scalar LF topology.

Current upstream contracts were read at TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f`. DifferentialGeometry Layers 0/1/5/6/10/12 are imports. Their commit-pinned URLs are recorded below because the atlas snapshot lacks their identifiers. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` also has Riemann-surface multiplicity/degree and continuous real-valued subharmonic functions beyond the pin. These are recorded as future reuse, without treating them as pinned baseline.

## Build in layers

## HV.0: Curvature normalization, disc area and lens geometry

Consume PoincareDisc, Schwarz–Pick, UpperHalfPlane.dist/volume and Cayley coordinates. Expose d₁=2d_TauCeti, radial balls, b=4/(1−|z|²)², the restricted density measure, a(r)=4πsinh²(r/2), and a_λ(r)=λ²a(r/λ). Distinguish max-product neighborhoods from sum forms. Prove the normalized ±a lens enclosure with M(R)=2artanh√tanh(R/2), including M(R)−R→log2.

**Coverage:** Local signatures are supplied; theorem proofs use `sorry`.

### Curvature −1 disc distance

`HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance` (definition).

For z,w in Complex.UnitDisc, d₁(z,w)=2·dist(z.toPoincare,w.toPoincare). This scalar comparison uses the existing PoincareDisc metric and makes no second metric instance on UnitDisc.

**Construction or proof route:**

- Read PoincareDisc.dist_eq at the pin: its distance is artanh of the pseudohyperbolic expression. Multiply by two to match the infinitesimal norm 2|dz|/(1−|z|²).
- Transport the metric axioms and Schwarz–Pick by multiplication by the positive constant two.

**Direct inputs:** `tauceti:TauCeti.PoincareDisc.dist_eq`, `tauceti:TauCeti.PoincareDisc.dist_toPoincare_zero_right`, `tauceti:TauCeti.PoincareDisc.dist_map_le`.

**API:**

- `TauCeti.HyperbolicVolumes.distOne_nonneg`: d₁ is nonnegative.
- `TauCeti.HyperbolicVolumes.distOne_comm`: d₁(z,w)=d₁(w,z).
- `TauCeti.HyperbolicVolumes.distOne_triangle`: d₁ satisfies the triangle inequality.
- `TauCeti.HyperbolicVolumes.distOne_map_le`: Schwarz–Pick remains nonexpanding after rescaling distance by two.
- `TauCeti.HyperbolicVolumes.distOne_isometry`: A PoincareDisc isometry preserves d₁.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.distOne_zero`: d₁(0,0)=0.
- `TauCeti.HyperbolicVolumes.distOne_origin`: d₁(z,0)=2 artanh|z|.
- `TauCeti.HyperbolicVolumes.distOne_factor_two`: d₁ is twice the existing metric, exactly.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

**Planet:** Curvature −1 disc distance.

### Cayley distance comparison

`HyperbolicCurveVolumesAndGonality:HV.0/cayley-distance` (comparison).

For a,z∈UpperHalfPlane, d₁(discCoordinateEquiv(a)(z),0)=dist(z,a) with Mathlib’s upper-half-plane metric.

**Construction or proof route:**

- Use norm_discCoordinate=tanh(dist(z,a)/2), the radial distance API, and artanh_tanh. This radial comparison avoids assuming a new Cayley isometry theorem.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`, `tauceti:UpperHalfPlane.discCoordinateEquiv`, `tauceti:UpperHalfPlane.norm_discCoordinate`, `mathlib:Real.artanh_tanh`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

### Curvature −1 radial balls

`HyperbolicCurveVolumesAndGonality:HV.0/disc-balls` (definition).

Define D(r)={z∈ℂ: |z|<tanh(r/2)}. For r>0 this is exactly the d₁-ball at zero, read in the existing disc carrier. For r≤0 it is empty.

**Construction or proof route:**

- The radial comparison d₁(z,0)=2 artanh|z| and strict monotonicity of tanh/artanh identify the sublevel set; no quotient geometry is used.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`, `mathlib:Real.artanh_tanh`.

**API:**

- `TauCeti.HyperbolicVolumes.radialBall_mem`: Membership is |z|<tanh(r/2).
- `TauCeti.HyperbolicVolumes.radialBall_mono`: r≤R implies D(r)⊆D(R).
- `TauCeti.HyperbolicVolumes.radialBall_subset_disc`: Every radial ball lies in the open unit disc.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.radialBall_zero`: D(0)=∅.
- `TauCeti.HyperbolicVolumes.radialBall_metric`: The radial formula agrees with d₁.
- `TauCeti.HyperbolicVolumes.radialBall_center`: Zero lies in D(r) exactly for r>0.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

### Hyperbolic area density

`HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density` (definition).

The curvature −1 disc area density relative to dx dy is b(z)=4/(1−|z|²)², used only on |z|<1. Its infinitesimal form is ω_D=2i dz∧d z̄/(1−|z|²)².

**Construction or proof route:**

- Translate the Kähler form of BT §1.3 into the ordinary real Lebesgue measure; i dz∧d z̄=2 dx∧dy.
- For a disc automorphism A, the holomorphic real Jacobian is |A′|²; the defect identity gives b(Az)|A′(z)|²=b(z).

**Direct inputs:** `mathlib:MeasureTheory.Measure.withDensity`.

**API:**

- `TauCeti.HyperbolicVolumes.areaDensity_pos`: b(z)>0 inside D.
- `TauCeti.HyperbolicVolumes.areaDensity_conj`: Conjugation preserves b.
- `TauCeti.HyperbolicVolumes.areaDensity_moebius`: The Möbius chart Jacobian preserves b(z) dxdy.
- `TauCeti.HyperbolicVolumes.areaDensity_rotation`: A unit scalar u preserves b.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.areaDensity_origin`: b(0)=4.
- `TauCeti.HyperbolicVolumes.areaDensity_half`: b(1/2)=64/9.
- `TauCeti.HyperbolicVolumes.areaDensity_not_tau_scale`: Density at zero is not 1, the unscaled metric’s density.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

**Planet:** Hyperbolic area form.

### Disc area measure

`HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure` (construction).

Define ν_D=(Lebesgue measure restricted to {|z|<1}).withDensity(ENNReal.ofReal∘b). Restriction excludes the total formulas’ geometric junk values outside D.

**Construction or proof route:**

- Use Mathlib Measure.withDensity; density is continuous inside D and hence measurable there.
- Nonnegative integration gives the measure and restriction API. Compact subdiscs have bounded density and finite measure.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density`, `mathlib:MeasureTheory.Measure.withDensity`, `mathlib:MeasureTheory.withDensity_apply`.

**API:**

- `TauCeti.HyperbolicVolumes.discAreaMeasure_apply`: ν_D(S)=∫_S b dxdy for measurable S⊆D.
- `TauCeti.HyperbolicVolumes.discAreaMeasure_rotation`: Unit rotations preserve ν_D.
- `TauCeti.HyperbolicVolumes.discAreaMeasure_finite_subdisc`: Closed subdiscs of Euclidean radius t<1 have finite ν_D-measure.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.discAreaMeasure_empty`: ν_D(∅)=0.
- `TauCeti.HyperbolicVolumes.discAreaMeasure_singleton`: ν_D({z})=0 for every point.
- `TauCeti.HyperbolicVolumes.discAreaMeasure_outside`: The complement of D has zero ν_D-measure.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

### Hyperbolic disc area

`HyperbolicCurveVolumesAndGonality:HV.0/area-profile` (definition).

The area profile a(r)=4π sinh²(r/2) for r≥0. The total scalar formula has no ball interpretation for negative r.

**Construction or proof route:**

- The radial integral of b over D(r) is 8π∫₀^{tanh(r/2)} t/(1−t²)² dt.
- Its antiderivative gives 4πt²/(1−t²); tanh/sinh identities give a(r). The measure identity is the separate disc-ball-area theorem.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-balls`, `mathlib:Complex.lintegral_comp_polarCoord_symm`.

**API:**

- `TauCeti.HyperbolicVolumes.areaProfile_pos`: a(r)>0 for r>0.
- `TauCeti.HyperbolicVolumes.areaProfile_mono`: a is strictly increasing on [0,∞).
- `TauCeti.HyperbolicVolumes.areaProfile_double`: a(2r)=4π sinh²r.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.areaProfile_zero`: a(0)=0.
- `TauCeti.HyperbolicVolumes.areaProfile_tanh`: a(r)=4πt²/(1−t²), t=tanh(r/2).
- `TauCeti.HyperbolicVolumes.areaProfile_small`: a(r)/(πr²) tends to one as r→0, r≠0.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

**Planet:** Hyperbolic disc area.

### Disc ball area formula

`HyperbolicCurveVolumesAndGonality:HV.0/disc-ball-area` (theorem).

For r≥0, ν_D(D(r))=ENNReal.ofReal(a(r)).

**Construction or proof route:**

- Apply the pinned polar-coordinate nonnegative-integral formula to the restricted density.
- Integrate 8πt/(1−t²)² on [0,tanh(r/2)], which is compactly inside [0,1); simplify with tanh²/(1−tanh²)=sinh².

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-balls`, `HyperbolicCurveVolumesAndGonality:HV.0/area-profile`, `mathlib:Complex.lintegral_comp_polarCoord_symm`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

**Planet:** Hyperbolic ball area formula.

### Curvature rescaling

`HyperbolicCurveVolumesAndGonality:HV.0/scaled-area` (definition).

For λ>0, scaling the curvature −1 metric tensor by λ² gives distance λd₁ and area ν_λ=λ²ν_D; a_λ(r)=λ²a(r/λ). Its curvature is −1/λ². No scalar formula asserts a curvature theorem before the quotient tensor is constructed.

**Construction or proof route:**

- Metric length scales by λ, whereas pullback of the real two-form scales by λ². Translate the radius r to r/λ in the unscaled ball.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/area-profile`.

**API:**

- `TauCeti.HyperbolicVolumes.scaledArea_unit`: λ=1 gives a.
- `TauCeti.HyperbolicVolumes.scaledArea_rescale`: a_λ(λr)=λ²a(r) for λ>0.
- `TauCeti.HyperbolicVolumes.scaledArea_comp`: Scaling twice multiplies the scale constants.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.scaledArea_zero`: a_λ(0)=0.
- `TauCeti.HyperbolicVolumes.scaledArea_two`: a₂(2r)=4a(r).
- `TauCeti.HyperbolicVolumes.scaledArea_wrong_length`: Area at corresponding radii scales quadratically, not linearly.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Remark 24, p.735.

### Max-product balls

`HyperbolicCurveVolumesAndGonality:HV.0/max-product-balls` (definition).

For n coordinates in D, B∞(x,r)={y: ∀i,d₁(x_i,y_i)<r}. Empty products give the full singleton product for every r; n>0 is required to identify this with a strict max-distance ball at r≤0.

**Construction or proof route:**

- Use coordinatewise d₁-sublevels; for nonempty Fin n, maximum of the finitely many coordinate distances gives the product metric.
- This defines neighborhoods only; the area form for complex curves is the sum, constructed in HV.2.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`.

**API:**

- `TauCeti.HyperbolicVolumes.productBall_mem`: Membership is the conjunction of coordinate sublevels.
- `TauCeti.HyperbolicVolumes.productBall_mono`: r≤R gives inclusion of balls.
- `TauCeti.HyperbolicVolumes.productBall_permute`: Permuting coordinates preserves the neighborhood.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.productBall_empty`: In zero coordinates the conjunction is vacuous.
- `TauCeti.HyperbolicVolumes.productBall_center`: For n>0 the center is in the ball iff r>0.
- `TauCeti.HyperbolicVolumes.productBall_max`: A pair of coordinate distances below r is sufficient, with no sum condition.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

**Planet:** Max-product neighborhoods.

### Hyperbolic lens radius

`HyperbolicCurveVolumesAndGonality:HV.0/lens-radius` (definition).

For R>0 define M(R)=2 artanh sqrt(tanh(R/2)). This upper bound for lens enclosures is independent of the separation parameter D.

**Construction or proof route:**

- Put s=tanh(R/2). The Euclidean lens from BT Figure 2 lies in |z|<sqrt(s), and the radial distance comparison gives M(R).

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-balls`.

**API:**

- `TauCeti.HyperbolicVolumes.lensRadius_pos`: M(R)>0 for R>0.
- `TauCeti.HyperbolicVolumes.lensRadius_mono`: M is strictly increasing for positive R.
- `TauCeti.HyperbolicVolumes.lensRadius_cosh`: cosh M(R)=exp R for R≥0.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.lensRadius_zero`: M(0)=0.
- `TauCeti.HyperbolicVolumes.lensRadius_exceeds_R`: M(R)>R for R>0; radius R alone is not this enclosure.
- `TauCeti.HyperbolicVolumes.lensRadius_limit`: M(R)−R→log 2 as R→∞.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Lemma 13 and Figure 2, pp.724–725.

**Planet:** Hyperbolic lens radius.

### Normalized lens enclosure

`HyperbolicCurveVolumesAndGonality:HV.0/normalized-lens` (theorem).

For a∈[0,1), p=a and q=−a in D, D=d₁(p,0), R>0, a point u with d₁(u,p)<D+R and d₁(u,q)<D+R satisfies d₁(u,0)<M(R). The a=0 case is included.

**Hypotheses:** 0≤a<1; R>0; p=a and q=−a.

**Construction or proof route:**

- Each hyperbolic ball is contained in a Euclidean disc centered at ±(1−s)/2 of radius (1+s)/2, with s=tanh(R/2).
- Add the two squared Euclidean distance inequalities to obtain |u|²<s, then use the radial distance API.
- The global midpoint lens theorem requires the geodesic-normalizing isometry supplied by FuchsianOrbifolds; it is a separate HV.4 target.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`, `HyperbolicCurveVolumesAndGonality:HV.0/lens-radius`, `tauceti:TauCeti.hyperbolicDist_unitDiscMoebius`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Lemma 13 proof and Figure 2, pp.724–725.

## HV.1: Invariant scalar diagonal potentials

Define μ=tanh²(d₁/4), χ=tanh²(d₁/2) and ψ(z,w)=χ(z,w̄), prove their formulas, ranges, zero loci and simultaneous or conjugate action invariance. Prove χ=4μ/(1+μ)², F=−8πlog(1−μ), H(log μ)=log(χ/(1−χ)) off Δ and H′ at radius r equals cosh r. Define f(s)=−log(1−s), g(t)=2asin√(1−e^(−t)) and prove g′(2log cosh r)=1/sinh r. Reject the conjugate diagonal as a complex divisor by its totally real tangent plane. These are scalar formulas; extended-real log μ and psh/current claims are HV.3/HV.5 targets.

**Coverage:** Local signatures are supplied; theorem proofs use `sorry`.

### Diagonal distance potential μ

`HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu` (definition).

For z,w∈D define μ(z,w)=tanh²(d₁(z,w)/4). The Lean scalar formula uses tanh(hyperbolicDist(z,w)/2). Geometric claims require both arguments in D.

**Construction or proof route:**

- Use the factor-two bridge; the half-distance to the diagonal is d₁(z,w)/2, and its anti-diagonal radial coordinate has squared modulus μ.
- Distance invariance under a common disc automorphism gives simultaneous-action invariance.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`, `tauceti:TauCeti.hyperbolicDist_unitDiscMoebius`.

**API:**

- `TauCeti.HyperbolicVolumes.diagonalMu_range`: 0≤μ<1 for z,w∈D.
- `TauCeti.HyperbolicVolumes.diagonalMu_eq_zero`: μ=0 iff z=w on D.
- `TauCeti.HyperbolicVolumes.diagonalMu_moebius`: A common disc Möbius change of chart preserves μ.
- `TauCeti.HyperbolicVolumes.diagonalMu_invariant`: Every common distance-preserving change of chart preserves μ.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.diagonalMu_self`: μ(z,z)=0.
- `TauCeti.HyperbolicVolumes.diagonalMu_antigraph`: μ(z,−z)=|z|² for |z|<1.
- `TauCeti.HyperbolicVolumes.diagonalMu_not_chi`: For nonzero z∈D, μ(z,0)<χ(z,0)=|z|².

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §5.1, pp.732–733.

**Planet:** Diagonal distance potential.

### Diagonal pseudohyperbolic potential χ

`HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi` (definition).

For z,w∈D, χ(z,w)=|(z−w)/(1−w̄z)|²=tanh²(d₁(z,w)/2). This is the square of the existing pseudohyperbolic expression, not a new distance.

**Construction or proof route:**

- Reuse pseudoHyperbolicExpr and tanh_hyperbolicDist; the latter has the half-curvature distance convention.

**Direct inputs:** `tauceti:TauCeti.pseudoHyperbolicExpr`, `tauceti:TauCeti.tanh_hyperbolicDist`, `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`.

**API:**

- `TauCeti.HyperbolicVolumes.diagonalChi_formula`: χ is the squared modulus of the explicit quotient.
- `TauCeti.HyperbolicVolumes.diagonalChi_distance`: χ=tanh²(d₁/2) on D.
- `TauCeti.HyperbolicVolumes.diagonalChi_moebius`: A common disc Möbius change of chart preserves χ.
- `TauCeti.HyperbolicVolumes.diagonalChi_range`: 0≤χ<1 on D.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.diagonalChi_self`: χ(z,z)=0.
- `TauCeti.HyperbolicVolumes.diagonalChi_origin`: χ(z,0)=|z|².
- `TauCeti.HyperbolicVolumes.diagonalChi_antigraph`: χ(z,−z)=4|z|²/(1+|z|²)².

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §5.1, pp.732–733.

**Planet:** Pseudohyperbolic potential.

### Double-angle potential relation

`HyperbolicCurveVolumesAndGonality:HV.1/chi-mu-relation` (lemma).

For z,w∈D, χ=4μ/(1+μ)² and 1−χ=(1−μ)²/(1+μ)².

**Construction or proof route:**

- Apply the tanh double-angle identity to t=d₁/4; square and rearrange. The two equalities are one algebraic identity and its complement.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu`, `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §5.1, pp.732–733.

### Conjugate-diagonal potential ψ

`HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi` (definition).

For z,w∈D define ψ(z,w)=χ(z,w̄)=|(w̄−z)/(1−zw)|². Its zero locus is the real analytic graph w=z̄, not a complex hypersurface.

**Construction or proof route:**

- Conjugation preserves the unit disc; substitute it in χ.
- For a disc automorphism A, the conjugate action is (z,w)↦(Az,conj(A(conj(w)))); under it ψ is invariant.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi`.

**API:**

- `TauCeti.HyperbolicVolumes.conjugatePsi_formula`: ψ=|(w̄−z)/(1−zw)|².
- `TauCeti.HyperbolicVolumes.conjugatePsi_zero`: ψ=0 iff w=z̄ for disc points.
- `TauCeti.HyperbolicVolumes.conjugatePsi_invariant`: Conjugate-diagonal actions preserving χ preserve ψ.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.conjugatePsi_graph`: ψ(z,z̄)=0.
- `TauCeti.HyperbolicVolumes.conjugatePsi_origin`: ψ(0,w)=|w|².
- `TauCeti.HyperbolicVolumes.conjugatePsi_not_diagonal`: At a nonreal z∈D, ψ(z,z)>0.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), §3, Proposition 3.1 proof, pp.2–3.

**Planet:** Conjugate-diagonal potential.

### Conjugate diagonal is totally real

`HyperbolicCurveVolumesAndGonality:HV.1/conjugate-tangent` (lemma).

The tangent plane T={(v,w)∈ℂ²:w=v̄} is not invariant under multiplication by i: (1,1)∈T but (i,i)∉T. Thus the conjugate graph cannot be treated as a complex divisor.

**Construction or proof route:**

- Compute conjugation of i. This coordinate tangent calculation suffices to reject the complex-divisor interpretation. Global change of charts belongs to HV.5.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), §3, Proposition 3.1 proof, pp.2–3.

### Diagonal area potential profile

`HyperbolicCurveVolumesAndGonality:HV.1/diagonal-positive-profile` (definition).

F(z,w)=−8π log(1−μ(z,w)). The argument of log is positive on D², including the diagonal; this is a finite scalar function. Its plurisubharmonicity and ddᶜ domination are HV.3 targets.

**Construction or proof route:**

- Use 0≤μ<1 to obtain a well-defined smooth scalar logarithm away from μ’s nonsmooth locus. The profile is zero at μ=0.
- Restrict to (z,−z): F=−8π log(1−|z|²). This calibrates the area constant without assuming a current inequality.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu`.

**API:**

- `TauCeti.HyperbolicVolumes.diagonalAreaPotential_nonneg`: F≥0 on D².
- `TauCeti.HyperbolicVolumes.diagonalAreaPotential_formula`: The profile is −8π log(1−μ).
- `TauCeti.HyperbolicVolumes.diagonalAreaPotential_invariant`: Invariance of μ transports to F.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.diagonalAreaPotential_self`: F(z,z)=0.
- `TauCeti.HyperbolicVolumes.diagonalAreaPotential_antigraph`: F(z,−z)=−8πlog(1−|z|²).
- `TauCeti.HyperbolicVolumes.diagonalAreaPotential_positive`: F(z,0)>0 for nonzero z∈D.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §5.1, pp.732–733.

### Relative diagonal logarithmic profile

`HyperbolicCurveVolumesAndGonality:HV.1/relative-log-profile` (definition).

For s<0 set H(s)=log(4eˢ/(1−eˢ)²). Off the diagonal, H(log μ)=log(χ/(1−χ)); H′(log tanh²(r/2))=cosh r for r>0. The scalar function is used only on this domain; log μ at μ=0 is an extended-real singularity owned by HV.3.

**Construction or proof route:**

- Substitute the χ–μ relation and differentiate H(s)=log4+s−2log(1−eˢ).
- H′=(1+eˢ)/(1−eˢ); putting eˢ=tanh²(r/2) gives cosh r.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/chi-mu-relation`.

**API:**

- `TauCeti.HyperbolicVolumes.relativeLogProfile_expand`: H(s)=log4+s−2log(1−eˢ), s<0.
- `TauCeti.HyperbolicVolumes.relativeLogProfile_deriv`: H′=(1+eˢ)/(1−eˢ), s<0.
- `TauCeti.HyperbolicVolumes.relativeLogProfile_chi`: H(log μ)=log(χ/(1−χ)) off Δ.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.relativeLogProfile_slope`: At radius r>0 the slope is cosh r.
- `TauCeti.HyperbolicVolumes.relativeLogProfile_value`: H(log(1/4))=log(16/9).
- `TauCeti.HyperbolicVolumes.relativeLogProfile_injective`: H is strictly increasing on s<0.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Proposition 23 proof, p.735.

### Conjugate area profile f

`HyperbolicCurveVolumesAndGonality:HV.1/conjugate-f-profile` (definition).

For 0≤s<1 define f(s)=−log(1−s). For ψ=tanh²(d/2), f(ψ)=2log cosh(d/2). The identity i∂∂̄f(ψ)=ω/2 is a separate current target.

**Construction or proof route:**

- Use 1−tanh²t=cosh(t)⁻² and logarithm identities; the analytic positivity computation is not assumed by this scalar definition.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi`.

**API:**

- `TauCeti.HyperbolicVolumes.conjugateAreaProfile_nonneg`: f≥0 on [0,1).
- `TauCeti.HyperbolicVolumes.conjugateAreaProfile_deriv`: f′(s)=1/(1−s) for s<1.
- `TauCeti.HyperbolicVolumes.conjugateAreaProfile_tanh`: f(tanh²r)=2log cosh r.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.conjugateAreaProfile_zero`: f(0)=0.
- `TauCeti.HyperbolicVolumes.conjugateAreaProfile_half`: f(1/2)=log2.
- `TauCeti.HyperbolicVolumes.conjugateAreaProfile_blowup`: f(s)→∞ as s→1 from below.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), §3, Proposition 3.1 proof, pp.2–3.

### Conjugate positive profile g

`HyperbolicCurveVolumesAndGonality:HV.1/conjugate-g-profile` (definition).

For t≥0 define g(t)=2asin sqrt(1−e^(−t)). Then g(f(s))=2asin sqrt(s) for 0≤s<1 and g′(2log cosh r)=1/sinh r for r>0. The positivity of i∂∂̄(g∘f∘ψ) is a separate HV.5 theorem.

**Construction or proof route:**

- The composition follows from e^(−f(s))=1−s.
- For t>0, g′(t)=1/sqrt(eᵗ−1); substitute eᵗ=cosh²r and use r>0.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-f-profile`.

**API:**

- `TauCeti.HyperbolicVolumes.conjugatePositiveProfile_comp`: g(f(s))=2asin sqrt s on [0,1).
- `TauCeti.HyperbolicVolumes.conjugatePositiveProfile_deriv`: g′(t)=1/sqrt(eᵗ−1) for t>0.
- `TauCeti.HyperbolicVolumes.conjugatePositiveProfile_mono`: g is strictly increasing on [0,∞).

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.conjugatePositiveProfile_zero`: g(0)=0.
- `TauCeti.HyperbolicVolumes.conjugatePositiveProfile_log_two`: g(log2)=π/2.
- `TauCeti.HyperbolicVolumes.conjugatePositiveProfile_slope`: g′(2log cosh r)=1/sinh r, r>0.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), §3, Proposition 3.1 proof, pp.2–3.

**Planet:** Conjugate-diagonal positive profile.

### Diagonal logarithmic asymptotics

`HyperbolicCurveVolumesAndGonality:HV.1/mu-log-singularity` (lemma).

Near Δ_D, μ(z,w)/|z−w|² extends to a positive finite continuous factor. At (z,z) this factor is 1/(4(1−|z|²)²). Thus log μ−log|z−w|² is locally bounded.

**Construction or proof route:**

- Use μ=χ/(1+√(1−χ))² and the exact pseudohyperbolic quotient formula.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu`, `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi`, `HyperbolicCurveVolumesAndGonality:HV.1/chi-mu-relation`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Equation (5) and equation (7), p.733.

## HV.2: Analytic cycles and normalization integration

Define locally finite effective complex one-cycles, analytic normalization and integration of Σprᵢ*ω_X with cycle weights. Define branch multiplicity and mult_ξ(C), including degree-d parameterizations and proper finite-map pushforward laws. Construct quotient metric/form descent via Fuchsian charts and compare to the existing invariant half-plane measure. Prove chart independence and weighted integration. Supply local sum-density and nonnegative source-integral formulas, fibre equality a(r), anti-graph equality 2a(r), the power-map degree factor, and zero contribution of a constant cusp coordinate. Pin ρ_X as half the compact systole; do not use a positive global pointwise injectivity radius for a cusped quotient.

**Coverage:** Planned with unresolved inputs: Close analytic local-algebra input G1; reconcile imported current DifferentialGeometry stage IDs G9.

### Parametrized sum area density

`HyperbolicCurveVolumesAndGonality:HV.2/parameter-area-density` (definition).

For holomorphic f=(f₁,…,fₙ):U→Dⁿ, the pulled-back sum area form has density q_f(t)=Σᵢ b(fᵢ(t))|fᵢ′(t)|² relative to dxdy. Each constant coordinate contributes zero. The total expression is used geometrically only on an open U with DifferentiableOn ℂ fᵢ U and fᵢ(U)⊆D.

**Construction or proof route:**

- Pull back each ω_D by a holomorphic coordinate; the real Jacobian equals the squared modulus of the complex derivative.
- Add the coordinate densities; do not take their maximum or their product.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density`.

**API:**

- `TauCeti.HyperbolicVolumes.parameterDensity_nonneg`: q_f≥0 everywhere.
- `TauCeti.HyperbolicVolumes.parameterDensity_ext`: Equality of coordinate maps gives equality of densities.
- `TauCeti.HyperbolicVolumes.parameterDensity_constant`: All constant coordinates give zero density.
- `TauCeti.HyperbolicVolumes.parameterDensity_reparam`: Under a holomorphic parameter change h, q_(f∘h)(t)=q_f(h(t))|h′(t)|².

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.parameterDensity_fibre`: For (t,c), q=b(t).
- `TauCeti.HyperbolicVolumes.parameterDensity_antigraph`: For (t,−t), q=2b(t).
- `TauCeti.HyperbolicVolumes.parameterDensity_cusp_constant`: Any constant coordinate has zero complex derivative, including the constant q=0 cusp coordinate.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

### Parametrized volume

`HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume` (construction).

V(f,U)=∫⁻_U ENNReal.ofReal(q_f(t)) dxdy for a holomorphic parameter map into Dⁿ. This integrates over the source and counts the degree of a parameterization. Global cycle volume on normalized branches is a distinct normalization construction.

**Construction or proof route:**

- The nonnegative density defines the integral without assuming finite total volume.
- For injective holomorphic reparameterizations apply the pinned Jacobian change-of-variables theorem and the density chain rule. A finite non-injective map requires degree counting, not the injective theorem alone.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/parameter-area-density`, `mathlib:MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul`.

**API:**

- `TauCeti.HyperbolicVolumes.parameterVolume_mono`: U⊆W implies V(f,U)≤V(f,W).
- `TauCeti.HyperbolicVolumes.parameterVolume_ext`: Equal density on U gives equal volume.
- `TauCeti.HyperbolicVolumes.parameterVolume_reparam`: An injective holomorphic parameter change preserves the source integral after changing its domain.
- `TauCeti.HyperbolicVolumes.parameterVolume_weight`: Weight m multiplies the local volume by m; weights are not erased by taking the image set.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.parameterVolume_empty`: V(f,∅)=0.
- `TauCeti.HyperbolicVolumes.parameterVolume_constant`: The volume of a constant map is zero.
- `TauCeti.HyperbolicVolumes.parameterVolume_zero_dimension`: There is zero pulled-back sum area in D⁰.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

### Point-volume equality for a fibre

`HyperbolicCurveVolumesAndGonality:HV.2/fibre-volume` (theorem).

For c∈D and r≥0, V(t↦(t,c),D(r))=a(r). This is the local equality model for the point-volume estimate.

**Construction or proof route:**

- The constant coordinate has zero derivative, leaving exactly b(t).
- Apply disc-ball-area to D(r).

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure`, `HyperbolicCurveVolumesAndGonality:HV.0/area-profile`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-balls`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-ball-area`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Theorem 19 and equality discussion, p.732.

### Graph-of-minus-identity volume

`HyperbolicCurveVolumesAndGonality:HV.2/antigraph-volume` (theorem).

For r≥0, V(t↦(t,−t),D(r))=2a(r). Since μ(t,−t)=|t|², D(r) is exactly the preimage of the diagonal radius-r tube; the intersection at zero has multiplicity one.

**Construction or proof route:**

- Both coordinate densities equal b(t), so the sum is 2b(t).
- Use the anti-graph μ computation and disc-ball-area. Intersection multiplicity one follows from the local equation (−t)−t=−2t, not from point multiplicity by convention.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume`, `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu`, `HyperbolicCurveVolumesAndGonality:HV.0/area-profile`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-balls`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-ball-area`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Theorem 19 equality discussion, p.732.

**Planet:** Diagonal volume equality.

### Degree-d parameterization volume

`HyperbolicCurveVolumesAndGonality:HV.2/power-parameter-volume` (theorem).

For d≥1, 0≤s<1 and c∈D, V(t↦(tᵈ,c),{|t|<s})=d·4πs^(2d)/(1−s^(2d)). This counts the covering degree d; replacing the source by its image without degree loses this factor.

**Construction or proof route:**

- Differentiate tᵈ: |(tᵈ)′|²=d²|t|^(2d−2). Multiply by b(tᵈ).
- Use polar coordinates and substitute v=tᵈ in the one-dimensional radial integral; the result is d times the area of the image subdisc.
- This explicit model does not assert a general finite-map area formula; that belongs to the normalized-cycle construction.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density`, `mathlib:Complex.lintegral_comp_polarCoord_symm`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3, pp.712–713.

### Hyperbolic area on quotient charts

`HyperbolicCurveVolumesAndGonality:HV.2/quotient-area` (construction).

For a torsion-free cocompact discrete projective group Γ, descend the curvature −1 disc form to X=Γ\D and construct its Borel area measure. The metric is the existing quotient metric; in every isometric disc chart the density is 4/(1−|z|²)². For cofinite Γ with elliptic points and cusps, use this measure on the regular locus and extend by zero over the finite exceptional set; the resulting coarse-surface measure has finite total mass. It is not a smooth metric at the exceptional points.

**Construction or proof route:**

- Use invariance of the disc density and the existing invariant half-plane measure comparison from Fuchsian Layer 2.
- Glue local density measures, prove agreement on overlaps, then use a truncated fundamental polygon and cusp area integrals for finiteness.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-density`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-area-measure`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L246)

**API:**

- `TauCeti.HyperbolicVolumes.quotientArea_chart`: A free disc chart pulls the area measure back to discAreaMeasure.
- `TauCeti.HyperbolicVolumes.quotientArea_fundamentalDomain`: Total area equals the invariant measure of any measurable fundamental domain, up to a null boundary.
- `TauCeti.HyperbolicVolumes.quotientArea_exceptional`: Every elliptic point and every added cusp has measure zero.
- `TauCeti.HyperbolicVolumes.quotientArea_conjugate`: The conjugate complex surface has the same underlying area measure.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.quotientArea_cusp`: A cusp of width w above height Y has area w/Y.
- `TauCeti.HyperbolicVolumes.quotientArea_elliptic`: The invariant area of an m-fold elliptic chart is divided by m on the quotient.
- `TauCeti.HyperbolicVolumes.quotientArea_normalization`: In a free chart at its disc centre the area density is 4, not 1.

**Sources:** [Dan Abramovich](https://arxiv.org/pdf/alg-geom/9609012), §§1.2–1.3, p.2; BT §1.3 pp.712–713.

**Planet:** Hyperbolic area on quotient charts.

### Normalization of analytic curve branches

`HyperbolicCurveVolumesAndGonality:HV.2/analytic-normalization` (construction).

A reduced closed pure-one-dimensional complex analytic subset A of a complex manifold admits a Riemann surface normalization ν:Ã→A, proper with finite fibres and biholomorphic over Areg. The fibre over ξ indexes the local irreducible branches. Normalizations are unique up to a unique holomorphic isomorphism commuting with ν. Analytic subsets mean locally common zero sets of holomorphic functions, with the reduced structure sheaf; no arbitrary closed-set carrier is sufficient.

**Construction or proof route:**

- Use local analytic Noetherianity, the finite universal-denominator integral closure, and Oka normalization (7.12); these exact analytic-algebra inputs are recorded as gap G1.
- Normal complex curves are regular by (7.7). Glue the branch normalizations by uniqueness (7.11), retaining the proper finite map.

**Direct inputs:** .

**API:**

- `TauCeti.HyperbolicVolumes.normalization_regular`: Over the regular locus, ν is a biholomorphism.
- `TauCeti.HyperbolicVolumes.normalization_fibre`: Each point of ν⁻¹(ξ) corresponds to exactly one local irreducible branch.
- `TauCeti.HyperbolicVolumes.normalization_unique`: A competing normalization has a unique isomorphism to ν over A.
- `TauCeti.HyperbolicVolumes.normalization_holomorphic`: ν is holomorphic and proper with finite fibres.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.normalization_node`: The normalization of z₁z₂=0 separates the two axes and has two points over the origin.
- `TauCeti.HyperbolicVolumes.normalization_cusp`: t↦(t²,t³) normalizes z₂²=z₁³ and has one point over the origin.
- `TauCeti.HyperbolicVolumes.normalization_power_nonexample`: t↦(tᵈ,0), d>1, is not a normalization of a smooth axis: it is d-to-one away from zero.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), II §7, (7.7) pp.113–114, (7.9)–(7.12) pp.114–115.

**Planet:** Normalization of analytic curve branches.

### Effective analytic curve cycles

`HyperbolicCurveVolumesAndGonality:HV.2/effective-cycle` (definition).

An effective analytic one-cycle on a complex manifold M is a locally finite sum C=Σ m_j[A_j] of distinct irreducible reduced closed pure-one-dimensional analytic subsets, with positive integer coefficients; zero is the empty sum. For compact M the support has finitely many components. Equality compares the coefficient of every irreducible component; a parameterization is not itself a cycle.

**Construction or proof route:**

- Use the local finite branch decomposition and compatible irreducible components from the analytic-algebra input G1.
- Represent coefficients with locally finite support and take their pointwise addition; use finiteness on compact sets.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/analytic-normalization`.

**API:**

- `TauCeti.HyperbolicVolumes.effectiveCycle_coeff`: Returns the natural coefficient of any irreducible analytic curve, zero off support.
- `TauCeti.HyperbolicVolumes.effectiveCycle_ext`: Equality is equivalent to equality of all component coefficients.
- `TauCeti.HyperbolicVolumes.effectiveCycle_zero`: The zero cycle has empty support and all coefficients zero.
- `TauCeti.HyperbolicVolumes.effectiveCycle_add`: Addition adds coefficients; supports combine by union.
- `TauCeti.HyperbolicVolumes.effectiveCycle_weight`: m[A] has coefficient m at A and zero at every distinct component.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.effectiveCycle_two_axes`: The two axes each with weight one give two components, not one reducible component.
- `TauCeti.HyperbolicVolumes.effectiveCycle_weight_two`: 2[A] differs from [A] despite identical point-set support.
- `TauCeti.HyperbolicVolumes.effectiveCycle_zero_test`: The empty cycle is zero and has no components.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), II §5 analytic components and divisors; III (2.14) p.143 and (4.12) pp.156–157.

**Planet:** Effective analytic curve cycles.

### Volume by normalization integration

`HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume` (construction).

On a product Xⁿ of smooth compact curvature −1 surfaces, let ω=Σ pr_i*ω_X. For an effective analytic curve C=Σm_j[A_j] and Borel E⊂Xⁿ define vol(C,E)=Σm_j∫_{ν_j⁻¹(E)}ν_j*ω as a nonnegative extended real measure, retaining weights. The measure is chart independent and finite on compact sets. For a finite holomorphic parameterization f:S→A of degree d, its source integral equals d times the reduced image integral.

**Construction or proof route:**

- Integrate pulled-back positive real two-forms on the smooth normalization using DifferentialGeometry Layer 5.
- Use change of variables off the discrete branch set; its measure is zero. Uniqueness of normalization gives choice independence.
- Locally finite mass extends the regular-locus integration across singularities; do not integrate a set image while dropping covering degree.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/effective-cycle`, `HyperbolicCurveVolumesAndGonality:HV.2/analytic-normalization`, `HyperbolicCurveVolumesAndGonality:HV.2/quotient-area`, `HyperbolicCurveVolumesAndGonality:HV.2/parameter-volume`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L481)

**API:**

- `TauCeti.HyperbolicVolumes.cycleVolume_zero`: vol(0,E)=0 and vol(C,∅)=0.
- `TauCeti.HyperbolicVolumes.cycleVolume_add`: The volume measure is additive in cycles and in disjoint measurable sets.
- `TauCeti.HyperbolicVolumes.cycleVolume_normalization`: For m[A], evaluation is m times the normalization integral.
- `TauCeti.HyperbolicVolumes.cycleVolume_reparam`: A biholomorphic reparameterization preserves volume; a finite degree-d parameterization multiplies it by d.
- `TauCeti.HyperbolicVolumes.cycleVolume_chart`: In a source chart the density is parameterAreaDensity of the coordinate maps.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.cycleVolume_fibre`: A fibre in a product ball has volume a(r).
- `TauCeti.HyperbolicVolumes.cycleVolume_antigraph`: The local anti-graph (z,−z) over a disc of radius r has volume 2a(r).
- `TauCeti.HyperbolicVolumes.cycleVolume_power`: The source map (tᵈ,c) covers its reduced fibre image d times, so its source integral is d times that image volume.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), I (2.4), (2.13)–(2.14) pp.14–17; III (2.7) pp.140–141.

**Planet:** Volume by normalization integration.

### Local curve multiplicity

`HyperbolicCurveVolumesAndGonality:HV.2/branch-multiplicity` (definition).

For a normalization branch at ξ in an ambient holomorphic chart, take min_i ord_t(z_i∘ν−z_i(ξ)); coordinates identically zero have order ∞. Sum this positive integer over ν⁻¹(ξ) and multiply by cycle weights to obtain mult_ξ C; put zero off support. A reduced branch is parameterized primitively. An arbitrary degree-d source parameterization is not used to define the image multiplicity.

**Construction or proof route:**

- Identify the minimum coordinate order with the degree of a generic linear projection on each branch.
- A local biholomorphic coordinate change preserves the leading nonzero order, and a primitive source coordinate has order one; then add weights.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/analytic-normalization`, `HyperbolicCurveVolumesAndGonality:HV.2/effective-cycle`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**API:**

- `TauCeti.HyperbolicVolumes.curveMultiplicity_off`: Multiplicity is zero away from the support.
- `TauCeti.HyperbolicVolumes.curveMultiplicity_add`: Multiplicity adds under cycle addition and scales with a natural weight.
- `TauCeti.HyperbolicVolumes.curveMultiplicity_chart`: Holomorphic coordinate changes and source biholomorphisms preserve multiplicity.
- `TauCeti.HyperbolicVolumes.curveMultiplicity_projection`: Multiplicity is the sheet number of a generic local linear projection summed with weights.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.curveMultiplicity_smooth`: A smooth reduced branch has multiplicity one.
- `TauCeti.HyperbolicVolumes.curveMultiplicity_cusp`: The primitive cusp (t²,t³) has multiplicity two.
- `TauCeti.HyperbolicVolumes.curveMultiplicity_node`: Two transverse reduced branches at a node have total multiplicity two.
- `TauCeti.HyperbolicVolumes.curveMultiplicity_cover`: The degree-d map onto a smooth reduced branch does not change its image multiplicity to d.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), III (7.5)–(7.7), p.168; II (7.10), p.114.

**Planet:** Local curve multiplicity.

### Weighted finite-map projection formula

`HyperbolicCurveVolumesAndGonality:HV.2/finite-pushforward` (theorem).

For a proper holomorphic map f with finite restriction to every curve component, f_*C=Σ m_j deg(A_j→f(A_j))[f(A_j)], adding coincident images. For a smooth positive two-form η on the target, ∫_C f*η=∫_{f_*C}η. Contracted components, if allowed in a general proper map, contribute zero to the one-cycle pushforward.

**Construction or proof route:**

- Use the current direct-image pairing and change of variables on the unramified loci; track the generic finite degree and cycle coefficients.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume`, `HyperbolicCurveVolumesAndGonality:HV.2/branch-multiplicity`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), I (2.13)–(2.14), pp.16–17; III (1.17) p.134.

### Compact injectivity radius

`HyperbolicCurveVolumesAndGonality:HV.2/compact-injectivity` (definition).

For a torsion-free cocompact Γ acting on D with curvature −1 distance, ρ_X=inf_{z∈D,γ∈Γ\{1}}d₁(z,γz)/2, equivalently half the shortest closed geodesic length. Compactness implies ρ_X>0; every radius r<ρ_X ball lifts injectively. For cusped quotients global pointwise injectivity infimum is zero, so the compact invariant is not reused.

**Construction or proof route:**

- Use proper discontinuity on a compact fundamental set to bound nontrivial displacements away from zero.
- Use the geodesic-axis length interpretation from Fuchsian Layer 2; apply the triangle inequality for injective ball lifts.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`.

**API:**

- `TauCeti.HyperbolicVolumes.injectivityRadius_pos`: The compact torsion-free cocompact radius is positive.
- `TauCeti.HyperbolicVolumes.injectivityRadius_ball`: For 0<r<ρ_X an upstairs r-ball maps isometrically and injectively to X.
- `TauCeti.HyperbolicVolumes.injectivityRadius_scale`: Scaling distances by λ>0 scales ρ_X by λ.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.injectivityRadius_half`: A shortest closed geodesic of length L gives ρ_X=L/2.
- `TauCeti.HyperbolicVolumes.injectivityRadius_cusp`: A parabolic cusp has global displacement infimum zero.
- `TauCeti.HyperbolicVolumes.injectivityRadius_tube`: The product diagonal tube theorem uses r<ρ_X/2, not r<ρ_X.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §1.3 pp.712–713; §5.1 p.732.

### Cusp coordinate pullback and constants

`HyperbolicCurveVolumesAndGonality:HV.2/cusp-pullback` (theorem).

In a cusp coordinate q the area density on 0<|q|<1 is 1/(|q|²(log|q|)²). If q∘f is nonzero holomorphic, pull it back by the usual derivative-squared rule; if q∘f≡0, define that coordinate contribution to be zero. For a zero of order e≥1, its punctured pullback is locally integrable and has leading density 1/(|t|²(log|t|)²).

**Construction or proof route:**

- Substitute q=exp(2πiz/w) in dxdy/y², cancel the cusp width.
- Write q(t)=tᵉu(t) with u(0)≠0, calculate derivative and integrate 1/(s(log s)²) in polar coordinates. Treat the identically zero map separately, never multiply infinity by zero.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/quotient-area`, `HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`.

**Sources:** [Dan Abramovich](https://arxiv.org/pdf/alg-geom/9609012), §1.3, p.2; Fuchsian Layer 3 q-coordinate contract.

## HV.3: Positive currents, singular Stokes and canonical area

Import ordinary smooth forms and Stokes from current DifferentialGeometry; reuse Mathlib’s LF coefficient test-function topology and assemble the global test-form topology, currents and positive (1,1)-currents with chart independence and actual continuity topology; construct extended-real psh functions and their locally integrable distributional derivatives. Set dᶜ=i(∂̄−∂)/(4π) on real functions, ddᶜ=i∂∂̄/(2π), half Demailly’s normalization. Prove ddᶜlog|h|²=[div(h)] and singular Stokes on normalized curve branches by regular-level approximation, with atomic multiplicities. Prove μ=χ/(1+√(1−χ))² is smooth across Δ, compute the normalized Hessians, and prove log μ is psh with value −∞ on Δ, F is psh and ddᶜF≤ω_D². Construct Hermitian line-bundle curvature and Chern–Weil comparison for K_X; prove c₁(K_X)=[ω_X]/(2π) and vol(C)=2π(K_Xⁿ·C), including cycle weights. Import algebraic intersections and analytification/GAGA, not analytic currents, from SF.5/C0–C4.

**Coverage:** Planned with unresolved inputs: Complete the global carrier-dependent current, analytic-cycle and Hermitian-bundle signatures (G1/G9). The diagonal Hessian proof is explicit; LF coefficient topology is pinned baseline.

### Compactly supported test forms

`HyperbolicCurveVolumesAndGonality:HV.3/test-forms` (definition).

For an oriented real m-manifold and degree k, D^k is the real vector space of compactly supported smooth k-forms from DifferentialGeometry. On each fixed compact K use all chart seminorms sup_K |D^αη_I| for finite derivative orders; give D^k the locally convex inductive-limit topology over a compact exhaustion. Equivalently, a linear functional is continuous exactly when its restriction to every fixed-support Frechet space is continuous. The subspace topology from all smooth forms is not this topology. In Euclidean charts take Mathlib TestFunction Ω (ContinuousAlternatingMap ℝ E ℝ (Fin k)) ⊤ directly. Its LF topology and fixed-support continuity theorem are baseline inputs, never new targets here. The new target is their manifold assembly with DifferentialGeometry forms and coordinate transitions.

**Construction or proof route:**

- Use the pinned coefficient-valued TestFunction LF topology. Trivialize the imported differential-form bundle on a locally finite atlas, and define compact-support forms by matching their coefficient test functions on overlaps.
- A partition of unity reduces each fixed-support continuity comparison to finitely many chart coefficient maps. Chain rule bounds finite-order seminorms on compact supports in each direction; import rather than rebuild the underlying LF construction.

**Direct inputs:** `mathlib:TestFunction`, `mathlib:TestFunction.topologicalSpace`, `mathlib:TestFunction.continuous_iff_continuous_comp`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L246)

**API:**

- `TauCeti.HyperbolicVolumes.testForm_fixedSupport`: Smooth forms supported in compact K map continuously to D^k.
- `TauCeti.HyperbolicVolumes.testForm_ext`: Forms agreeing pointwise agree as test forms.
- `TauCeti.HyperbolicVolumes.testForm_changeCharts`: Different finite chart covers of K give equivalent derivative seminorms.
- `TauCeti.HyperbolicVolumes.testForm_continuous_dual`: A linear functional is continuous iff each fixed-support restriction is continuous.
- `TauCeti.HyperbolicVolumes.testForm_pullback`: A smooth proper map pulls test forms back continuously; properness can be restricted to the current support.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.testForm_bump`: A smooth bump times a constant alternating k-form is a test form.
- `TauCeti.HyperbolicVolumes.testForm_constant_nonexample`: A nonzero constant form on Euclidean space of positive dimension is not compactly supported.
- `TauCeti.HyperbolicVolumes.testForm_escape_nonexample`: Translated nonzero bumps escaping to infinity converge locally smoothly to zero but do not converge to zero in D^k.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), I (2.1)–(2.3), pp.13–14.

**Planet:** Compactly supported test forms.

### Currents and distributional differentiation

`HyperbolicCurveVolumesAndGonality:HV.3/currents` (definition).

A real current of degree q on an oriented m-manifold is a continuous real-linear functional on D^(m−q). Set ⟨dT,η⟩=(−1)^(q+1)⟨T,dη⟩. Wedge with a smooth form, restriction and proper direct image are defined by transposing the corresponding test-form operations. Locally integrable coefficients embed by T_α(η)=∫α∧η. Complexify these carriers to split into (p,q)-types on complex manifolds.

**Construction or proof route:**

- Transpose the upstream continuous differential/pullback/wedge maps on each fixed-support space.
- Use ordinary Stokes to prove distributional d agrees with smooth d; the signs depend on current degree, not dimension.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/test-forms`, `mathlib:TestFunction`, `mathlib:TestFunction.topologicalSpace`, `mathlib:TestFunction.continuous_iff_continuous_comp`, `mathlib:Distribution`, `mathlib:Distribution.ofFun`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L246)
- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L481)

**API:**

- `TauCeti.HyperbolicVolumes.current_ext`: Equality holds iff all test-form pairings agree.
- `TauCeti.HyperbolicVolumes.current_deriv_pairing`: d is determined by the sign (−1)^(q+1) and the test-form exterior derivative.
- `TauCeti.HyperbolicVolumes.current_deriv_square`: d²T=0.
- `TauCeti.HyperbolicVolumes.current_smooth`: A locally integrable smooth form embeds as its integral pairing.
- `TauCeti.HyperbolicVolumes.current_pushforward`: For f proper on support, (f_*T)(η)=T(f*η), with identity/composition and d-compatibility.
- `TauCeti.HyperbolicVolumes.current_restrict`: Restriction to open subsets commutes with d and agrees on overlaps.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.current_dirac`: On an oriented complex line, the degree-two point current evaluates a zero-form at the point.
- `TauCeti.HyperbolicVolumes.current_smooth_deriv`: Distributional differentiation of a smooth compactly supported function agrees with its classical derivative.
- `TauCeti.HyperbolicVolumes.current_derivative_sign`: For a degree-zero current dT applied to a complementary one-form is −T(dη).

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), I (2.3)–(2.14), pp.14–17.

**Planet:** Currents and distributional differentiation.

### Positive complex currents

`HyperbolicCurveVolumesAndGonality:HV.3/positive-currents` (definition).

A real current of bidimension (p,p) is positive if it takes nonnegative values on every compactly supported strongly positive (p,p)-form; strong positivity of a form means a finite nonnegative sum of wedges iα₁∧ᾱ₁∧⋯∧iα_p∧ᾱ_p. For bidegree (1,1), positivity of a smooth form is positive semidefiniteness of its Hermitian coefficient matrix. Positive currents have order zero and locally finite measure coefficients.

**Construction or proof route:**

- Dualize the pointwise cones. Proposition (1.14) bounds off-diagonal coefficients by the trace and proves order zero.
- Use the closed-cone property for weak limits and positive pullbacks/direct images only under the hypotheses in (1.17).

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/currents`.

**API:**

- `TauCeti.HyperbolicVolumes.positiveCurrent_add`: Nonnegative linear combinations remain positive.
- `TauCeti.HyperbolicVolumes.positiveCurrent_weakLimit`: A weak limit of positive currents is positive.
- `TauCeti.HyperbolicVolumes.positiveCurrent_orderZero`: Positive currents have measure coefficients and a locally finite trace measure.
- `TauCeti.HyperbolicVolumes.positiveCurrent_smooth`: A smooth (1,1)-form is positive iff its Hermitian matrix is semipositive.
- `TauCeti.HyperbolicVolumes.positiveCurrent_pushforward`: Proper holomorphic pushforward preserves positivity; arbitrary current pullback is not supplied.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.positiveCurrent_point`: The point current on a complex line is positive.
- `TauCeti.HyperbolicVolumes.positiveCurrent_negative_point`: The negative of a nonzero point current is not positive.
- `TauCeti.HyperbolicVolumes.positiveCurrent_matrix`: The Hermitian matrix diag(1,−1) does not define a positive (1,1)-form.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), III (1.13)–(1.17), pp.132–134.

**Planet:** Positive complex currents.

### Plurisubharmonic potentials

`HyperbolicCurveVolumesAndGonality:HV.3/psh` (definition).

On a complex manifold u has values in ℝ∪{−∞}, is upper semicontinuous, and in holomorphic charts satisfies the submean inequality on every closed complex-line disc contained in the chart. The value +∞ is excluded. A psh function not identically −∞ on any connected component is locally integrable after ignoring its null pole set. In a C² chart this condition is equivalent to a positive semidefinite complex Hessian.

**Construction or proof route:**

- Construct the extended-real carrier excluding +∞ and impose the line-disc submean condition.
- Use decreasing convolution regularizations on smaller charts, distributional positivity (5.8), and holomorphic pullback (5.11).

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/positive-currents`.

**API:**

- `TauCeti.HyperbolicVolumes.psh_hessian`: For a C² real function, psh is equivalent to semipositivity of its complex Hessian.
- `TauCeti.HyperbolicVolumes.psh_pullback`: Holomorphic pullback preserves psh, allowing an identically −∞ pullback.
- `TauCeti.HyperbolicVolumes.psh_decreasing`: A decreasing sequence of psh functions has psh pointwise limit.
- `TauCeti.HyperbolicVolumes.psh_regularization`: Local convolutions are smooth psh and decrease to u as the smoothing radius decreases to zero.
- `TauCeti.HyperbolicVolumes.psh_locallyIntegrable`: A psh function nontrivial on each component is locally integrable.
- `TauCeti.HyperbolicVolumes.psh_logHolomorphic`: log|h|², with −∞ on zeros, is psh for holomorphic h.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.psh_log_zero`: log|z|² has value −∞ at zero and is locally integrable.
- `TauCeti.HyperbolicVolumes.psh_negative_norm`: −|z|² on a nonempty disc is not psh.
- `TauCeti.HyperbolicVolumes.psh_constant`: Every finite real constant and the constant −∞ function are psh, but the latter is not locally integrable.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), I (5.1)–(5.12), pp.39–41; III §1.18, p.135.

**Planet:** Plurisubharmonic potentials.

### The normalized complex differential

`HyperbolicCurveVolumesAndGonality:HV.3/ddc` (construction).

For real functions set dᶜ=i(∂̄−∂)/(4π) and ddᶜ=i∂∂̄/(2π). Extend to distributions by test-form duality. In one complex variable ddᶜu=(Δu/(4π))dx∧dy for C² u; Δ here is the positive-coordinate second derivative sum, distinct from the nonnegative spectral Laplacian −Δ. The normalized operator is half Demailly’s ddᶜ.

**Construction or proof route:**

- Split the complexified exterior derivative by type and transpose it.
- Compute in z=x+iy; the local area coefficient is (u_xx+u_yy)/(4π).

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/currents`, `HyperbolicCurveVolumesAndGonality:HV.3/psh`.

**API:**

- `TauCeti.HyperbolicVolumes.ddc_add`: ddᶜ is real-linear.
- `TauCeti.HyperbolicVolumes.ddc_smooth_chart`: On ℂ, a smooth function gives density Δu/(4π).
- `TauCeti.HyperbolicVolumes.ddc_pullback`: Smooth holomorphic pullback commutes with ddᶜ; for singular functions use local integrability on the pullback.
- `TauCeti.HyperbolicVolumes.ddc_positive`: The ddᶜ current of a nontrivial psh function is positive and closed.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.ddc_log_atom`: ddᶜlog|z|² is the unit point mass, not twice it.
- `TauCeti.HyperbolicVolumes.ddc_norm_squared`: ddᶜ|z|²=(1/π)dx∧dy.
- `TauCeti.HyperbolicVolumes.ddc_harmonic`: ddᶜ(Re z)=0.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), III §3, p.144, with factor one-half; I §2.B, p.15.

### Integration current of an analytic cycle

`HyperbolicCurveVolumesAndGonality:HV.3/integration-current` (theorem).

The weighted normalization pairing [C](η)=Σm_j∫_{Ã_j}ν_j*η defines a closed positive current of bidimension (1,1). It agrees with regular-locus integration, has locally finite mass at singularities, and its trace pairing with the product area form gives cycleVolume.

**Construction or proof route:**

- Local generic projections prove finite mass and show the exceptional set has zero mass.
- Apply the closed-current extension theorem or integrate on the proper smooth normalization and transpose Stokes.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume`, `HyperbolicCurveVolumesAndGonality:HV.3/currents`, `HyperbolicCurveVolumesAndGonality:HV.3/positive-currents`.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), III (2.3) p.139, (2.7) pp.140–141; I (2.14) p.17.

### Poincaré–Lelong formula

`HyperbolicCurveVolumesAndGonality:HV.3/poincare-lelong` (theorem).

For holomorphic h not identically zero on any connected component, ddᶜlog|h|²=[div(h)]. On a normalized curve, a zero h(t)=tᵉu(t) contributes the atom e[0]. For meromorphic h use zero minus pole orders. No wedge of arbitrary singular currents is claimed.

**Construction or proof route:**

- Prove the unit point-mass calculation by punctured-disc Stokes, discard the harmonic log of a unit, then add the vanishing order.
- For ambient divisors use local factorization, support and the dimension principle; for curve intersections pull the function to each normalization branch.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/ddc`, `HyperbolicCurveVolumesAndGonality:HV.3/integration-current`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), III (2.15), pp.143–144.

**Planet:** Poincaré–Lelong formula.

### Singular Stokes for curve sublevels

`HyperbolicCurveVolumesAndGonality:HV.3/singular-stokes` (theorem).

Let u be psh on a normalized curve, smooth off finitely many logarithmic poles on each relatively compact sublevel Ω_s={u<s}, and let h be C² increasing convex with h(u) locally integrable and finite inner-boundary limit. With the ddᶜ mass interpreted including its atoms, ∫_{Ω_s}ddᶜ(h∘u)=h′(s)∫_{Ω_s}ddᶜu whenever s is a regular value and the relevant masses are finite. Extend by left limits to all s. For a nonsmooth bounded potential use truncation and decreasing regularization; equality requires the derivative-side convention at a level atom.

**Construction or proof route:**

- Excise small discs at each pole and apply imported ordinary Stokes; retain the inner-boundary contribution rather than declaring it zero.
- Use h equal to its affine boundary tangent on an interior truncation and monotone positive-measure convergence.
- Use max(u,−N) and weak-current convergence for psh limits. Demailly (5.5) gives the general weight version after normalization adjustment.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/ddc`, `HyperbolicCurveVolumesAndGonality:HV.3/poincare-lelong`, `HyperbolicCurveVolumesAndGonality:HV.3/positive-currents`.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), III (3.1) p.144, (3.2),(3.6)–(3.7) pp.145–148, (5.4)–(5.5) pp.158–159.

### Lelong mass and curve multiplicity

`HyperbolicCurveVolumesAndGonality:HV.3/lelong-multiplicity` (theorem).

For an effective analytic one-cycle C and ξ, the usual Euclidean area ratio lim_{ε↓0}area(C∩B(ξ,ε))/(πε²) equals mult_ξ C. Equivalently, with our ddᶜ, the limiting mass on the normalization of ddᶜlog max_i|z_i−z_i(ξ)|² is mult_ξ C. Bounded changes to logarithmic weights preserve this limiting mass.

**Construction or proof route:**

- Compare max and Euclidean logarithmic norms; the ratio tends to one.
- Use a generic finite projection and its sheet number to compute the mass; compensate our half operator by squared logarithms.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/branch-multiplicity`, `HyperbolicCurveVolumesAndGonality:HV.3/poincare-lelong`, `HyperbolicCurveVolumesAndGonality:HV.3/singular-stokes`.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), III (5.4)–(5.8) pp.158–159, (7.1)–(7.3) pp.166–167, (7.5)–(7.7) p.168.

### Positive diagonal potential comparison

`HyperbolicCurveVolumesAndGonality:HV.3/diagonal-hessian` (theorem).

On D², μ=χ/(1+√(1−χ))² is smooth, including Δ, and F=−8πlog(1−μ) is smooth psh. Extend log μ by −∞ on Δ; it is psh and locally integrable. With ω=pr₁*ω_D+pr₂*ω_D, 0≤ddᶜF≤ω as currents. At (0,w), put t=√(1−|w|²)>0. Off Δ the complex Hessian of log μ is (1/(2t³))[[t⁴,t²],[t²,1]]. The coefficient matrix of ddᶜF is [[2−t,−1/t],[−1/t,(2−t)/t⁴]], whereas ω−ddᶜF has matrix [[t,1/t],[1/t,1/t³]]. These matrices are semipositive for 0<t≤1; the latter has rank one.

**Construction or proof route:**

- Use χ=(z−w)(z̄−w̄)/((1−w̄z)(1−wz̄)). At (0,w), s=|w|² and b=1−s, its gradient is (−w̄b,w̄), Hessian [[b²,2s−1],[2s−1,1]]. For h(χ) add h″ times [[sb²,−sb],[−sb,s]] to h′ times this Hessian.
- For h(s)=log((1−√(1−s))/(1+√(1−s))), h′=1/(s√(1−s)), h″=(3s−2)/(2s²(1−s)^(3/2)). Substitute to obtain the displayed rank-one log μ Hessian. For F the derivative is 4π/((1−s)(1+√(1−s))); substitution gives the displayed ddᶜ matrix and complement. Principal minors establish both inequalities.
- A common disc automorphism sends any (z,w) to (0,w′); holomorphic covariance transports semipositivity. The algebraic expression μ=χ/(1+√(1−χ))² proves smoothness through χ=0 and extends F inequalities by continuity.
- For log μ write log χ−2log(1+√(1−χ)); its singular part is log|z−w|². Away from Δ positivity holds by the matrix; upper extension across this analytic hypersurface and Poincaré–Lelong supply positivity including the divisor atom. No scalar value Real.log 0 is used as the extended potential.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-mu`, `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-positive-profile`, `HyperbolicCurveVolumesAndGonality:HV.3/ddc`, `HyperbolicCurveVolumesAndGonality:HV.3/psh`, `HyperbolicCurveVolumesAndGonality:HV.1/mu-log-singularity`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §5.1 Lemma 20 and ensuing F computation, pp.732–733; [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), I (5.8)–(5.12), pp.40–41; III (1.18), p.135; III (2.15), pp.143–144.

### Curvature of a Hermitian line metric

`HyperbolicCurveVolumesAndGonality:HV.3/line-curvature` (construction).

Given an imported holomorphic line bundle L with smooth positive Hermitian metric h, a holomorphic frame e has c₁(L,h)=−ddᶜlog h(e,e). If e′=g e with nonvanishing holomorphic g, this real closed (1,1)-form is unchanged. On a compact normalized curve ∫c₁(L,h)=deg L; the pairing includes cycle weights and coincides with algebraic degree after GAGA.

**Construction or proof route:**

- Use the imported holomorphic bundle transitions and the rank-one weight −log h; avoid reconstructing vector-bundle carriers or connections.
- Choose a meromorphic section, apply the metric Poincaré–Lelong identity, and integrate the exact current on the compact normalization. Compare its divisor degree with SF.5/GAGA.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/ddc`, `HyperbolicCurveVolumesAndGonality:HV.3/poincare-lelong`, `SchemeAndStackFoundations:SF.5`, `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C4`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L246)
- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L481)

**API:**

- `TauCeti.HyperbolicVolumes.lineCurvature_frame`: The curvature is −ddᶜlog of squared frame norm.
- `TauCeti.HyperbolicVolumes.lineCurvature_metricChange`: Replacing h by exp(−u)h changes c₁ by ddᶜu.
- `TauCeti.HyperbolicVolumes.lineCurvature_tensor`: Curvature adds under tensor products and changes sign under duals.
- `TauCeti.HyperbolicVolumes.lineCurvature_pullback`: Holomorphic pullback preserves curvature.
- `TauCeti.HyperbolicVolumes.lineCurvature_degree`: The compact normalized-curve integral is the algebraic line-bundle degree.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.lineCurvature_flat`: A constant positive frame norm gives zero curvature.
- `TauCeti.HyperbolicVolumes.lineCurvature_disc_canonical`: For K_D, h(dz,dz)=(1−|z|²)²/4 gives c₁(K_D,h)=ω_D/(2π).
- `TauCeti.HyperbolicVolumes.lineCurvature_metric_sign`: For h=exp(−|z|²), c₁=(1/π)dx∧dy, with positive sign.

**Sources:** [Jean-Pierre Demailly](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf), V (12.6)–(12.8) p.269, (13.2)–(13.4) p.271.

### Canonical degree and hyperbolic area

`HyperbolicCurveVolumesAndGonality:HV.3/canonical-area` (theorem).

For a smooth compact curvature −1 hyperbolic curve X, c₁(K_X,h)=[ω_X]/(2π). On Xⁿ let K_{Xⁿ}=⊗_i pr_i*K_X, so for every effective analytic curve C, vol(C,Xⁿ)=2π deg(ν*C K_{Xⁿ})=2π(K_{Xⁿ}·C), retaining weights and normalization. This identity is for the compact smooth hyperbolic metric, not the singular cusp metric on its completion.

**Construction or proof route:**

- Compute −ddᶜlog((1−|z|²)²/4)=ω_D/(2π), descend, add tensor-factor curvatures, and integrate on each normalization.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/line-curvature`, `HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Canonical-degree discussion, §6 p.736; Demailly V (13.4) p.271.

**Planet:** Canonical degree and hyperbolic area.

## HV.4: Hwang–To point and diagonal volumes

For compact curvature −1 hyperbolic X, ρ_X>0, an effective curve cycle C and 0<r<ρ_X, prove vol(C∩B∞(ξ,r))≥a(r)mult_ξ(C). For 0<r<ρ_X/2 and no diagonal component, prove vol(C∩{d_X(x,y)<2r})≥2a(r)(C·Δ). Define I(r)=∫ddᶜF, prove I(r)/a(r) monotone and its Lelong limit at least 2(C·Δ). For Δ₂={(x,y,x,y)}⊂X⁴, and every component of C not contained in Δ₂, prove vol(C∩B∞(Δ₂,r))≥2a(r)Σ_{ξ∈C∩Δ₂}mult_ξ(C); this is a point sum, not divisor intersection with a codimension-two locus. Prove the global midpoint lens bound using the existing geodesic-normalizing isometries.

**Coverage:** Planned with unresolved inputs: Inspect original HT02/HT12 G3; finish the regularized tie-interface limit G4.

### Diagonal and product tubes

`HyperbolicCurveVolumesAndGonality:HV.4/diagonal-tube` (definition).

For compact curvature −1 X put B∞(ξ,r)={x:∀i,d_X(x_i,ξ_i)<r}, B(Δ,r)={(x,y):d_X(x,y)<2r}, and B(Δ₂,r)={(x₁,x₂,y₁,y₂):d(x_i,y_i)<2r for i=1,2}. These are maximum-distance tubes; the volume form remains the sum form. For r<ρ_X/2 the diagonal tubes identify with the corresponding upstairs tubes modulo diagonal deck actions.

**Construction or proof route:**

- A midpoint realizes the distance-to-diagonal infimum in the max metric.
- Use injective ball lifts and uniqueness of the deck translate within radius 2r; the strict radius bound excludes overlapping distinct lifts.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/compact-injectivity`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

**API:**

- `TauCeti.HyperbolicVolumes.diagonalTube_mem`: Membership in B(Δ,r) is d(x,y)<2r.
- `TauCeti.HyperbolicVolumes.diagonalTube_mono`: Tubes are increasing with r.
- `TauCeti.HyperbolicVolumes.doubleDiagonalTube_mem`: Membership requires both coordinate-pair inequalities.
- `TauCeti.HyperbolicVolumes.diagonalTube_lift`: For r<ρ_X/2 the diagonal-action lift gives the tube isomorphism.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.diagonalTube_empty`: At r=0 the strict tube is empty.
- `TauCeti.HyperbolicVolumes.diagonalTube_antigraph`: On (z,−z), tube radius r is d₁(z,0)<r.
- `TauCeti.HyperbolicVolumes.doubleDiagonalTube_max`: A point outside either pair tube is outside B(Δ₂,r), regardless of the other pair distance.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), §5.1 pp.732,734.

**Planet:** Diagonal and product tubes.

### Hwang–To point-volume estimate

`HyperbolicCurveVolumesAndGonality:HV.4/point-volume` (theorem).

For X smooth compact curvature −1 hyperbolic, n≥1, an effective analytic one-cycle C⊂Xⁿ, ξ∈Xⁿ and 0<r<ρ_X, vol(C,B∞(ξ,r))≥a(r)mult_ξ C. The sum volume form and cycle weights are essential. The fibre model realizes equality.

**Construction or proof route:**

- Lift the ball by compact injectivity, use max-coordinate sublevels and the normalized Lelong multiplicity.
- The nontrivial comparison between total pulled-back area and this sublevel mass is the exact HT02 input G3, not an assumption built into the cycle definition. Record the theorem target with that explicit proof gap.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-tube`, `HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume`, `HyperbolicCurveVolumesAndGonality:HV.3/lelong-multiplicity`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Theorem 19(a), p.732, attributed to HT02 Theorem 2.

**Planet:** Hwang–To point-volume estimate.

### Diagonal logarithmic multiplicity

`HyperbolicCurveVolumesAndGonality:HV.4/diagonal-lelong` (lemma).

If no component of C⊂X² lies in Δ, then on each normalized branch meeting Δ the pulled-back log μ is log|h|² plus a bounded term, h a local defining function of Δ. Consequently lim_{r↓0}∫_{C∩B(Δ,r)}ddᶜlog μ≥(C·Δ); local intersection is the sum of orders of h on primitive branches.

**Construction or proof route:**

- Use μ/|z−w|² bounded above and below near Δ.
- Apply the branch logarithmic comparison and SF.5 analytic/algebraic intersection compatibility. Non-diagonal components guarantee h does not vanish identically.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/lelong-multiplicity`, `HyperbolicCurveVolumesAndGonality:HV.3/diagonal-hessian`, `HyperbolicCurveVolumesAndGonality:HV.3/poincare-lelong`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-tube`, `SchemeAndStackFoundations:SF.5`, `HyperbolicCurveVolumesAndGonality:HV.1/mu-log-singularity`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Equation (7), p.733; Demailly III (7.1) p.166.

### Diagonal potential mass growth

`HyperbolicCurveVolumesAndGonality:HV.4/diagonal-growth` (theorem).

For C with no diagonal component and 0<r<ρ_X/2, set I(r)=∫_{C∩B(Δ,r)}ddᶜF. Then I(r)=2a(r)∫_{C∩B(Δ,r)}ddᶜlog μ, and I(r)/a(r) is nondecreasing. Also I(r)≤vol(C,B(Δ,r)).

**Construction or proof route:**

- Apply singular Stokes with h(s)=−8πlog(1−exp s). Its slope at log tanh²(r/2) is 8πsinh²(r/2)=2a(r).
- The pulled-back positive measure of ddᶜlog μ is monotone on nested tubes.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.3/singular-stokes`, `HyperbolicCurveVolumesAndGonality:HV.3/diagonal-hessian`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-lelong`, `HyperbolicCurveVolumesAndGonality:HV.0/area-profile`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Lemma 21 and equation (6), p.733.

### Hwang–To diagonal-volume estimate

`HyperbolicCurveVolumesAndGonality:HV.4/diagonal-volume` (theorem).

For an effective curve cycle C⊂X² with no component Δ and 0<r<ρ_X/2, vol(C,B(Δ,r))≥2a(r)(C·Δ). The local anti-graph achieves equality and has intersection multiplicity one. The diagonal itself is excluded because its intersection is not a proper point divisor.

**Construction or proof route:**

- Take the small-radius Lelong limit in the mass-growth identity and dominate by the sum area form.
- This alternative proof supplies the point-intersection constant without pretending that the original HT12 proof was read.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-growth`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-lelong`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Theorem 19(b), p.732; alternative proof pp.732–733, attributed to HT12 Theorem 1.

**Planet:** Hwang–To diagonal-volume estimate.

### Product-diagonal multiplicity bound

`HyperbolicCurveVolumesAndGonality:HV.4/double-diagonal` (theorem).

For an effective analytic one-cycle C⊂X⁴ with every component not contained in Δ₂ and 0<r<ρ_X/2, vol(C,B(Δ₂,r))≥2a(r)Σ_{ξ∈|C|∩Δ₂}mult_ξ C. The codimension-two locus Δ₂ is not a Cartier divisor; the right side is point multiplicity, not C·Δ₂.

**Construction or proof route:**

- Partition a normalized branch into μ₁>μ₂ and μ₂>μ₁; apply the boundary-slope formula on each region.
- Orient the tie boundary as the outward boundary of the first region and inward boundary of the second. The remaining coefficient is 1−sinh²(d₁/4)/sinh²(r/2)≥0 and its dᶜlog(μ₁/μ₂) boundary integral is nonnegative.
- Use a regularized max when the tie locus has open pieces or singular levels, preserve positivity and pass to the max-weight Lelong limit. This tie-limit justification is the precise refinement G4.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-growth`, `HyperbolicCurveVolumesAndGonality:HV.3/lelong-multiplicity`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-tube`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Lemma 22, pp.734–735.

**Planet:** Product-diagonal multiplicity bound.

### Midpoint lens enclosure

`HyperbolicCurveVolumesAndGonality:HV.4/midpoint-lens` (theorem).

For x,y in the curvature −1 disc, put D=d₁(x,y)/2 and let m be their geodesic midpoint. For R>0, B(x,D+R)∩B(y,D+R)⊂B(m,M(R)), with M(R)=2artanh√tanh(R/2). On a quotient X the same inclusion applies to a lens whose points admit simultaneous lifts in these two chosen upstairs balls; this lift hypothesis is retained explicitly. No distance-independent inclusion is asserted for unrelated deck choices.

**Construction or proof route:**

- Send the unique upstairs geodesic midpoint to zero by a holomorphic disc isometry, then rotate its endpoints to ±a. Their distances to zero are D. Apply normalized_lens with ball radii D+R and transport back. For quotient use the stipulated simultaneous lifts; injectivity of each separate ball alone does not choose matching deck translates.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/normalized-lens`, `HyperbolicCurveVolumesAndGonality:HV.2/compact-injectivity`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Lemma 13 and Figure 2, pp.724–725.

## HV.5: Relative diagonal and conjugate-diagonal volumes

For C with no diagonal component, construct ddᶜlog(χ/(1−χ))=ω/(4π)+[Δ], with the corrected smooth coefficient, and prove V_Δ(r)/cosh r monotone for 0<r<ρ_X/2. On X×Xbar construct the real analytic conjugate diagonal, its tubes and conjugate-chart invariance; prove i∂∂̄(f∘ψ)=ω/2 and i∂∂̄(g∘f∘ψ)≥0 as currents. Singular Stokes gives V_barΔ(r)=2sinh r·∫i∂∂̄(g∘f∘ψ), hence V_barΔ(r)/√a(2r) monotone. For 0<r<R<ρ_X/2 prove V_barΔ(r)≤(sinh r/sinh R)V_barΔ(R); the reciprocal printed in the erratum is rejected. Rescale radii, ρ and forms for curvature −1/λ²; use cosh(r/λ) and √a_λ(2r). Define no algebraic intersection with barΔ.

**Coverage:** Planned with unresolved inputs: Instantiate the global current/normalization suppliers and singular Stokes branch limits from HV.2–HV.4.

### Relative diagonal current identity

`HyperbolicCurveVolumesAndGonality:HV.5/relative-current` (theorem).

On D², set Q=log(χ/(1−χ)) off Δ with logarithmic singularities along Δ. In currents ddᶜQ=ω_D²/(4π)+[Δ]. Pulling to a normalization of C without Δ components yields ddᶜ(Q∘ν)=ν*ω/(4π)+Σ ord_ξ(z−w)[ξ]. The coefficient before ddᶜlog[(1−|z|²)(1−|w|²)] is −1.

**Construction or proof route:**

- Write Q=log|z−w|²−log[(1−|z|²)(1−|w|²)], with coefficient one on both logarithms.
- Apply the unit Poincaré–Lelong atom and compute the smooth part at curvature −1.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/diagonal-chi`, `HyperbolicCurveVolumesAndGonality:HV.1/chi-mu-relation`, `HyperbolicCurveVolumesAndGonality:HV.3/poincare-lelong`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-lelong`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Proof of Proposition 23, p.735; source issue E2.

### Relative diagonal volume monotonicity

`HyperbolicCurveVolumesAndGonality:HV.5/relative-diagonal` (theorem).

For compact X and an effective C⊂X² without Δ components, V_Δ(r)/cosh r is nondecreasing on 0<r<ρ_X/2. Thus V_Δ(r)≤cosh(r)/cosh(R) V_Δ(R) for 0<r<R<ρ_X/2. An intermediate exact formula is (V_Δ(r)/(4π)+C·Δ)/cosh r=∫_{C∩B(Δ,r)}ddᶜlog μ.

**Construction or proof route:**

- Use Q=H(log μ) and the boundary derivative H′=cosh r.
- The right side is a nested positive mass. Subtract (C·Δ)/cosh r; its negative is increasing because C·Δ≥0 and cosh grows. This explains why J-monotonicity implies V-monotonicity.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.5/relative-current`, `HyperbolicCurveVolumesAndGonality:HV.3/singular-stokes`, `HyperbolicCurveVolumesAndGonality:HV.1/relative-log-profile`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-tube`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Proposition 23 and its proof, p.735.

**Planet:** Relative diagonal volume monotonicity.

### Conjugate diagonal tube

`HyperbolicCurveVolumesAndGonality:HV.5/conjugate-tube` (definition).

The conjugate surface X̄ has the same underlying metric and opposite complex structure. Under the canonical anti-holomorphic identity κ:X→X̄, barΔ={(x,κx)} is a real-analytic totally real surface in X×X̄. Its radius-r max tube is {(x,y):d_X(x,κ⁻¹y)<2r}. For r<ρ_X/2 it lifts to ψ(z,w)<tanh²r on D², with ψ=|z−w̄|²/|1−zw|² and deck action (γ,γ̄). There is no complex divisor current [barΔ] or algebraic intersection C·barΔ.

**Construction or proof route:**

- Conjugate the complex charts; the metric descent is unchanged.
- Use the same tube-lift uniqueness but with conjugate deck action. Show the tangent plane {(v,v̄)} contains no nonzero complex line.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-psi`, `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-tangent`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-tube`.

**API:**

- `TauCeti.HyperbolicVolumes.conjugateTube_mem`: Membership is the strict distance inequality with factor two.
- `TauCeti.HyperbolicVolumes.conjugateTube_psi`: Upstairs membership is ψ<tanh²r.
- `TauCeti.HyperbolicVolumes.conjugateTube_invariant`: The conjugate deck action preserves ψ and its tubes.
- `TauCeti.HyperbolicVolumes.conjugateTube_totallyReal`: The conjugate diagonal tangent plane has no nonzero complex subspace.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.conjugateTube_origin`: For (z,0) the tube radius r condition is d₁(z,0)<2r.
- `TauCeti.HyperbolicVolumes.conjugateTube_zero`: The strict zero-radius tube is empty.
- `TauCeti.HyperbolicVolumes.conjugateTube_notDivisor`: barΔ is not the zero locus of a nonzero holomorphic local divisor equation.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), Proposition 3.1 and proof, pp.2–3.

**Planet:** Conjugate diagonal tube.

### Positive conjugate-diagonal potential

`HyperbolicCurveVolumesAndGonality:HV.5/conjugate-hessian` (theorem).

Let f(s)=−log(1−s), g(t)=2asin√(1−exp(−t)). On D², i∂∂̄(f∘ψ)=ω_D²/2 and i∂∂̄(g∘f∘ψ)≥0 as currents, extending continuously across ψ=0. At (0,w), with s=|w|² and b=1−s, the Hermitian coefficient of i∂∂̄(h∘ψ) is h′(s)[[b²,w²],[w̄²,1]]+h″(s)[[sb²,−w²b],[−w̄²b,s]]. For h=g∘f, its principal minors are nonnegative for 0<s<1.

**Construction or proof route:**

- Reduce by conjugate invariance to (0,w), substitute h′=1/√(s(1−s)), h″=(2s−1)/(2s^(3/2)(1−s)^(3/2)), and check the diagonal minors and determinant.
- The continuous bounded potential g∘f∘ψ has a psh extension over ψ=0. Prove this on each source branch by submean/regularization, rather than differentiate |z−w̄| at its zero.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-f-profile`, `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-g-profile`, `HyperbolicCurveVolumesAndGonality:HV.5/conjugate-tube`, `HyperbolicCurveVolumesAndGonality:HV.3/positive-currents`, `HyperbolicCurveVolumesAndGonality:HV.3/psh`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), Proof of Proposition 3.1, p.2.

### Relative conjugate-diagonal volume

`HyperbolicCurveVolumesAndGonality:HV.5/relative-conjugate` (theorem).

For compact hyperbolic X and any effective complex one-cycle C⊂X×X̄, V_barΔ(r)/√a(2r), equivalently V_barΔ(r)/sinh r, is nondecreasing for 0<r<ρ_X/2. Consequently V_barΔ(r)≤(sinh r/sinh R)V_barΔ(R) for 0<r<R<ρ_X/2. No proper-intersection hypothesis with barΔ is needed; a positive-dimensional complex component cannot lie in the totally real locus.

**Construction or proof route:**

- On a regular tube boundary, f∘ψ=2log cosh r, and g′ at that value is 1/sinh r.
- Boundary Stokes gives V_barΔ(r)=2sinh r∫_{C∩tube}i∂∂̄(g∘f∘ψ). The latter is a nested positive mass; extend to all radii by left limits.
- The singular Stokes general statement is applied after source-branch regularization; do not claim g is convex as a function of f.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.5/conjugate-hessian`, `HyperbolicCurveVolumesAndGonality:HV.3/singular-stokes`, `HyperbolicCurveVolumesAndGonality:HV.1/conjugate-g-profile`, `HyperbolicCurveVolumesAndGonality:HV.0/area-profile`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), Proposition 3.1, pp.2–3; source issue E1.

**Planet:** Relative conjugate-diagonal volume.

### Curvature rescaling of volume estimates

`HyperbolicCurveVolumesAndGonality:HV.5/scaled-tubes` (theorem).

For λ>0, replace d by λd and ω by λ²ω, hence ρ by λρ and a by a_λ(r)=λ²a(r/λ). Point and diagonal bounds use a_λ(r), diagonal relative growth uses cosh(r/λ), conjugate growth uses sinh(r/λ) or √a_λ(2r). The small/large conjugate ratio is sinh(r/λ)/sinh(R/λ).

**Construction or proof route:**

- Translate each radius to r/λ in the curvature −1 theorem and multiply every curve-volume integral by λ².

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.0/scaled-area`, `HyperbolicCurveVolumesAndGonality:HV.4/point-volume`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-volume`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-diagonal`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-conjugate`.

**Sources:** [Benjamin Bakker and Jacob Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), Remark 24 p.735; erratum Proposition 3.1 p.2.

## HV.6: Gonality on smooth projective models

For a smooth projective geometrically connected curve B/k define gon_k(B) as the minimum positive degree of a finite nonconstant k-morphism to P¹_k, with existence proved. For opens and integral image curves use the smooth projective normalization/completion imported from AlgebraicCurves/ComplexComparisonPartII. Prove extension-field monotonicity and equality for algebraically closed k, with a finite-type descent/specialization argument. Over algebraically closed k prove gon≤g+1 by Riemann–Roch. Separately prove gon≤floor((g+3)/2) in characteristic zero using the pencil case of Brill–Noether existence, and prove equality on a nonempty Zariski-open locus in M_g over ℂ. Supply gon(P¹)=1 and gon(genus-one B)=2 over algebraically closed k; a nonsplit genus-zero curve is not assigned gonality one from genus alone. Import function-field RR, canonical degree, ramification and projective models.

**Coverage:** Planned with unresolved inputs: Decompose the now-read proper linked-series inputs G5 and prototype the relative Picard/Grassmannian contracts.

### Gonality of the smooth projective model

`HyperbolicCurveVolumesAndGonality:HV.6/gonality` (definition).

For a smooth projective geometrically connected curve B/k, gon_k B is the minimum of the nonempty set of positive degrees of finite nonconstant k-morphisms B→P¹_k. Equivalently for its function field F, minimize [F:φ(k(t))] over k-embeddings φ:k(t)→F with finite extension. On an open or singular integral curve use its imported smooth projective normalization, not its arithmetic genus. Over nonperfect fields restrict to cases with such a smooth model. Existence follows from a transcendence generator and the curve/function-field dictionary.

**Construction or proof route:**

- Use any nonconstant function in the one-variable function field; algebraicity plus finite generation makes its rational subfield extension finite.
- Take the least positive natural degree and transfer it to the curve through AlgebraicCurves Layer 12.

**Direct inputs:** `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `tauceti:TauCeti.IsFunctionField`.

**API:**

- `TauCeti.HyperbolicVolumes.gonality_pos`: Gonality is positive.
- `TauCeti.HyperbolicVolumes.gonality_attained`: There exists a finite nonconstant map of exactly the gonality degree.
- `TauCeti.HyperbolicVolumes.gonality_le_degree`: Every finite nonconstant map to P¹ bounds gonality above.
- `TauCeti.HyperbolicVolumes.gonality_iso`: Isomorphic smooth projective models have equal gonality.
- `TauCeti.HyperbolicVolumes.gonality_functionField`: The curve invariant equals the rational-subfield minimum.
- `TauCeti.HyperbolicVolumes.gonality_model`: An integral open or singular curve is assigned the gonality of its smooth projective model.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.gonality_projectiveLine`: gon_k(P¹_k)=1.
- `TauCeti.HyperbolicVolumes.gonality_genusOne`: Over algebraically closed k, a genus-one curve has gonality two.
- `TauCeti.HyperbolicVolumes.gonality_conic_nonexample`: A smooth nonsplit conic over k has no degree-one map to P¹_k, even though its genus is zero.

**Sources:** [Dan Abramovich](https://arxiv.org/pdf/alg-geom/9609012), §1.1, p.2; Osserman Remark 1.2(iv) p.2.

**Planet:** Gonality of the smooth projective model.

### Linear pencils and removal of base divisors

`HyperbolicCurveVolumesAndGonality:HV.6/pencils` (definition).

A pencil on a smooth projective curve is (L,V) where L is an imported line bundle and V is a two-dimensional k-subspace of H⁰(B,L). The common zero divisor E of V is effective; replacing L by L(−E) produces a base-point-free pencil and a finite nonconstant map B→P¹ of degree deg L−deg E. A chosen basis changes the target map by PGL₂(k), not its degree.

**Construction or proof route:**

- Use the divisor valuation minimum of the two basis sections to construct E; quotient away that common factor.
- Apply the projective-bundle universal property to the resulting two sections and use divisor pullback to identify its degree.

**Direct inputs:** `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

**API:**

- `TauCeti.HyperbolicVolumes.pencil_dimension`: V has dimension two and evaluation V⊗O_B→L.
- `TauCeti.HyperbolicVolumes.pencil_baseDivisor`: At each point the base-divisor order is the minimum vanishing order of a basis.
- `TauCeti.HyperbolicVolumes.pencil_changeBasis`: A GL₂ basis change leaves E invariant and postcomposes the map with its PGL₂ class.
- `TauCeti.HyperbolicVolumes.pencil_degree`: A base-point-free pencil gives degree deg L; with base divisor E the degree is deg L−deg E.
- `TauCeti.HyperbolicVolumes.pencil_fromMap`: Pulling back H⁰(P¹,O(1)) along a finite map gives its base-point-free pencil.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.pencil_p1`: The two standard sections of O(1) on P¹ have no base points and give degree one.
- `TauCeti.HyperbolicVolumes.pencil_common_factor`: Multiplying both generating sections by a section with zero divisor E increases line-bundle degree by deg E but leaves map degree unchanged.
- `TauCeti.HyperbolicVolumes.pencil_dimension_nonexample`: A one-dimensional section space gives a constant projective map and is not a pencil.

**Sources:** [Brian Osserman](https://arxiv.org/pdf/1108.4967), Theorem 1.1 and ramification convention pp.1–2; Remark 1.3 p.2.

**Planet:** Linear pencils and removal of base divisors.

### Relative parameter scheme of pencils

`HyperbolicCurveVolumesAndGonality:HV.6/pencil-parameter-space` (construction).

For a smooth proper geometrically connected family B→S of fixed genus and fixed d, construct G¹_d(B/S) representing line bundles of relative degree d with rank-two subbundles V→π_*L whose maps V_T→π_{T*}L_T stay injective after every base change, modulo line bundles pulled from S; this functor is fppf sheafified, with a Poincaré bundle after a section rigidifies the relative Picard functor. It is proper over S and commutes with base change. For a fixed curve over algebraically closed k, every component has dimension at least ρ=2d−g−2. The base-point-free locus is open. Generic emptiness is read from this proper parameter scheme, not from an unspecified set of maps.

**Construction or proof route:**

- Import the Picard and relative Grassmannian carriers; use a high auxiliary divisor to present section spaces and determinantal incidence conditions.
- Glue across choices/Picard rigidifications; properness follows from the relative Grassmannian construction with degree fixed. Record the exact Picard representability/specialization request, not a new Picard carrier.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.6/pencils`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

**API:**

- `TauCeti.HyperbolicVolumes.pencilSpace_points`: Geometric points are degree-d pencils up to line-bundle isomorphism.
- `TauCeti.HyperbolicVolumes.pencilSpace_baseChange`: Formation of G¹_d commutes with base change.
- `TauCeti.HyperbolicVolumes.pencilSpace_proper`: The degree-d pencil parameter scheme is proper over the smooth-family base.
- `TauCeti.HyperbolicVolumes.pencilSpace_basepointFree`: Base-point-free pencils form an open subscheme.
- `TauCeti.HyperbolicVolumes.pencilSpace_dimension`: Each component on a fixed genus-g curve has dimension at least 2d−g−2.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.pencilSpace_p1_degreeOne`: G¹_1(P¹) consists of the unique full H⁰(O(1)) pencil up to line-bundle isomorphism.
- `TauCeti.HyperbolicVolumes.pencilSpace_degreeZero`: G¹_0(B) is empty for a geometrically connected smooth projective curve.
- `TauCeti.HyperbolicVolumes.pencilSpace_extension`: A pencil over an extension field is a point of the base change of this same scheme.

**Sources:** [Brian Osserman](https://arxiv.org/pdf/1108.4967), Remark 1.3, p.2; [Brian Osserman](https://aif.centre-mersenne.org/item/10.5802/aif.2209.pdf), Definitions 4.2–4.5, pp.1173–1175; Lemmas 5.1–5.2 and Theorem 5.3 (smooth case), pp.1176–1180.

### Gonality under algebraically closed base change

`HyperbolicCurveVolumesAndGonality:HV.6/base-change` (theorem).

For a field extension K/k and B smooth projective geometrically connected, gon_K(B_K)≤gon_k(B). If k is algebraically closed, equality holds. Extension monotonicity does not imply equality for arbitrary k; a nonsplit conic becomes gonality one after splitting.

**Construction or proof route:**

- Base-change a minimizing finite map; finite degree is preserved.
- For the converse take a K-point of the nonempty base-point-free degree-d locus, spread its finite-presentation data to a finitely generated k-algebra, then specialize in its nonempty open locus to a closed point. Algebraic closedness makes the residue field k.
- Equivalently a nonempty finite-type k-scheme of base-point-free pencils has a k-point. Preserve degree before specializing, rather than merely specializing an arbitrary rational formula.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.6/gonality`, `HyperbolicCurveVolumesAndGonality:HV.6/pencil-parameter-space`.

**Sources:** [Dan Abramovich](https://arxiv.org/pdf/alg-geom/9609012), §1.1, p.2; Osserman Remark 1.2(iv), p.2.

**Planet:** Gonality under algebraically closed base change.

### Riemann–Roch gonality bound

`HyperbolicCurveVolumesAndGonality:HV.6/riemann-roch-bound` (theorem).

Over algebraically closed k, a smooth projective connected genus-g curve B has gonality at most g+1. A point P has degree one; Riemann–Roch gives h⁰((g+1)P)≥2. A nonconstant section gives a rational function with pole divisor ≤(g+1)P and hence a map of degree ≤g+1.

**Construction or proof route:**

- Consume function-field RR; subtract constants to choose a nonconstant function.
- The imported dictionary turns its pole degree into finite-map degree. No analytic RR or projective model construction is duplicated.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.6/gonality`, `HyperbolicCurveVolumesAndGonality:HV.6/pencils`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `tauceti:TauCeti.genus`, `tauceti:TauCeti.Divisor.degree_add_one_sub_genus_le_dim`.

**Sources:** [Peter Li and Shing-Tung Yau](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), §1 Fact 1 discussion p.272; §2 consequence pp.276–277.

**Planet:** Riemann–Roch gonality bound.

### Proper smoothing input for limit pencils

`HyperbolicCurveVolumesAndGonality:HV.6/limit-pencil-input` (theorem).

For a regular smoothing of a compact-type curve Y∪_Q Z over a DVR, the limit-pencil moduli scheme is proper, has generic fibre G¹_d of the smooth curve, every component has dimension at least ρ+1, and maps set-theoretically surjectively to pairs of degree-d pencils whose vanishing orders obey a^Y_j+a^Z_{1−j}≥d. The fibre dimension is at most Σ_{j=0}¹(a^Y_j+a^Z_{1−j}−d). Do not assert that this map factors scheme-theoretically through the Eisenbud–Harris locus.

**Construction or proof route:**

- Use the proper linked-linear-series construction cited by Osserman, with the requested nodal smoothing from StableReduction.
- Present linked Grassmannians by adjacent bundle maps f_i,g_i with f_i g_i=g_i f_i=s and exact kernel/image conditions on the special fibre. Use the open dense exact locus and its tangent-dimension calculation for the lower bound. Stratify the endpoint incidence fibres to obtain the excess-vanishing upper bound. These read inputs still require explicit intermediate contracts and prototypes, recorded in G5.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.6/pencil-parameter-space`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Sources:** [Brian Osserman](https://arxiv.org/pdf/1108.4967), Definition 3.2 p.5; Theorems 3.8,3.11 and Remark 3.9 p.6; [Brian Osserman](https://aif.centre-mersenne.org/item/10.5802/aif.2209.pdf), Definition 4.5, pp.1175–1176; Theorem 5.3, pp.1178–1181; Proposition 6.6, pp.1185–1188; Appendix A Definitions A.2/A.4/A.10 and Theorem A.15, pp.1194–1203; [Brian Osserman](https://arxiv.org/pdf/math/0605372), Theorem 5.3, p.12; Lemma 5.4 and Corollary 5.5, pp.12–14.

### Brill–Noether pencil theorem

`HyperbolicCurveVolumesAndGonality:HV.6/brill-noether` (theorem).

Over algebraically closed characteristic-zero k, G¹_d(B) is nonempty for every smooth projective genus-g curve when ρ=2d−g−2≥0. For a general such curve it is empty when ρ<0 and, if nonempty, pure of dimension ρ. The zero-ramification specialization of Osserman Theorem 1.1 actually holds in arbitrary characteristic, but this roadmap’s generic-complex endpoint only uses characteristic zero.

**Construction or proof route:**

- The genus-zero/one bases are intersections of explicit vanishing flags and RR spaces.
- Attach a two-marked genus-one curve to a genus-(g−1) curve; stratify compatible vanishing sequences, apply the proper limit-pencil input and its fibre bound.
- Dimension plus properness supplies existence on the smooth fibre; openness and the relative parameter scheme transfer generic emptiness/dimension to a nonempty open moduli locus. The linked-series construction remains G5.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.6/limit-pencil-input`, `HyperbolicCurveVolumesAndGonality:HV.6/pencil-parameter-space`.

**Sources:** [Brian Osserman](https://arxiv.org/pdf/1108.4967), Theorem 1.1 and Remark 1.2(i) pp.1–2; Lemma 2.1 pp.3–5; induction pp.6–8.

### Brill–Noether gonality and generic sharpness

`HyperbolicCurveVolumesAndGonality:HV.6/sharp-bound` (theorem).

For every smooth projective complex genus-g curve, gon≤floor((g+3)/2). There is a nonempty Zariski-open locus in M_g on which equality holds (for g=0,1 interpret the familiar P¹ and genus-one cases). This is a separate Brill–Noether consequence, not the output of the elementary RR bound.

**Construction or proof route:**

- At d=floor((g+3)/2), ρ≥0 gives a pencil; remove its base divisor to get a map of degree ≤d.
- For every smaller positive d, ρ<0 gives generic emptiness. Take the finite intersection of the open emptiness loci. A hypothetical smaller map supplies a forbidden pencil.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.6/brill-noether`, `HyperbolicCurveVolumesAndGonality:HV.6/pencils`, `HyperbolicCurveVolumesAndGonality:HV.6/gonality`.

**Sources:** [Brian Osserman](https://arxiv.org/pdf/1108.4967), Theorem 1.1, Remark 1.2(i) pp.1–2.

**Planet:** Brill–Noether gonality and generic sharpness.

### Small-genus gonality checks

`HyperbolicCurveVolumesAndGonality:HV.6/small-gonality` (theorem).

Over algebraically closed k, gon(P¹)=1 and gon(B)=2 for smooth genus-one B. A degree-one finite map to P¹ would be an isomorphism, hence force genus zero. The upper bound two uses RR at a degree-one point. A genus-zero curve over a nonclosed field has gonality one precisely when its smooth projective model is P¹, not from genus alone.

**Construction or proof route:**

- Use the identity map and positivity for P¹; use RR and degree-one-isomorphism for genus one.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.6/gonality`, `HyperbolicCurveVolumesAndGonality:HV.6/riemann-roch-bound`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

**Sources:** [Dan Abramovich](https://arxiv.org/pdf/alg-geom/9609012), §1.1, p.2; Osserman Lemma 2.1 pp.3–5.

## HV.7: Conformal area, finite-area cusps and Li–Yau

Define V_c(n,φ)=sup_{A∈Conf(Sⁿ)}Area(A∘φ) for nondegenerate branched conformal immersions, V_c(n,M)=inf_φ V_c(n,φ), and stable conformal area A_c. Prove conformal invariance, degree-d comparison, and V_c(n,S²)=4π for n≥2. Prove λ₁Area≤2A_c≤8πgon for compact Riemann surfaces by conformal barycenter balancing and the Rayleigh quotient. Extend to the finite-area hyperbolic metric with cusps/elliptic singularities, using λ′₁=inf positive Rayleigh quotients, identified with min(λ₁,1/4) when the discrete eigenvalue exists. Prove coordinate test functions have finite Dirichlet energy and mean-zero normalization by Abramovich’s conformal argument. Import the congruence spectral gap from the separately routed AutomorphicSpectralTheory extension; never prove that automorphic theorem here. State the resulting gonality lower bound gon≥λ′₁Area/(8π), with modular-curve area/index inputs imported.

**Coverage:** Planned with unresolved inputs: Close the higher-dimensional equatorial-sphere value G6 and cusp form-domain cutoff G7; attach actual congruence-gap stage G8 and current upstream signatures G9.

### Branched conformal surface maps

`HyperbolicCurveVolumesAndGonality:HV.7/branched-conformal-map` (definition).

A branched conformal immersion φ:M→Sⁿ, n≥2, of a compact connected Riemann surface is a smooth map with pullback round metric σ²h for a nonnegative smooth σ², with isolated zeros and positive somewhere. Away from its finite branch set dφ has rank two. Its area is the integral of that pullback two-dimensional density, with source multiplicity. Changes of the compatible source metric preserve this area. Constant maps are excluded.

**Construction or proof route:**

- Use the imported round sphere manifold and Riemannian metric; impose the conformality/rank condition on its differential.
- Define area through the imported density integral, including degenerate branch points.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L640)

**API:**

- `TauCeti.HyperbolicVolumes.branchedConformalMap_area`: Area integrates the nonnegative pullback round density.
- `TauCeti.HyperbolicVolumes.branchedConformalMap_conformalChange`: A conformal source metric change leaves the area invariant.
- `TauCeti.HyperbolicVolumes.branchedConformalMap_postcompose`: A conformal diffeomorphism of the sphere preserves the class of admissible maps.
- `TauCeti.HyperbolicVolumes.branchedConformalMap_cover`: A nonconstant holomorphic map to P¹≅S² is an admissible branched conformal map.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.branchedConformalMap_sphere`: The identity round-sphere map has area 4π.
- `TauCeti.HyperbolicVolumes.branchedConformalMap_power`: The degree-d sphere map z↦zᵈ has area 4πd, not 4π.
- `TauCeti.HyperbolicVolumes.branchedConformalMap_constant`: A constant sphere map has zero area and is not admissible.

**Sources:** [Peter Li and Shing-Tung Yau](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), §1 equation (1.1), p.271.

**Planet:** Branched conformal surface maps.

### Li–Yau conformal area

`HyperbolicCurveVolumesAndGonality:HV.7/conformal-area` (definition).

For an admissible φ:M→Sⁿ define V_c(n,φ)=sup_{A∈Conf(Sⁿ)}Area(A∘φ) in nonnegative extended reals. Let V_c(n,M)=inf_φ V_c(n,φ), with infimum of the empty admissible set equal to ∞. Stable conformal area A_c(M)=inf_{n≥2}V_c(n,M); dimension monotonicity identifies this with the decreasing limit. It depends only on the conformal structure, not the singular hyperbolic area measure.

**Construction or proof route:**

- Use extended-real suprema/infima to avoid arbitrary real values for empty/unbounded families.
- Reparameterization by a conformal isomorphism identifies admissible maps; include Sⁿ as an equatorial subsphere for dimension monotonicity.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.7/branched-conformal-map`.

**API:**

- `TauCeti.HyperbolicVolumes.conformalArea_map_le`: Area(φ)≤V_c(n,φ), and V_c(n,M)≤V_c(n,φ).
- `TauCeti.HyperbolicVolumes.conformalArea_invariant`: Conformally isomorphic source surfaces have equal invariants.
- `TauCeti.HyperbolicVolumes.conformalArea_dimension`: V_c(n+1,M)≤V_c(n,M) where maps exist.
- `TauCeti.HyperbolicVolumes.conformalArea_stable`: A_c is the infimum in dimension and the decreasing limit.
- `TauCeti.HyperbolicVolumes.conformalArea_lower`: Every compact surface admitting a nondegenerate conformal map has A_c≥4π.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.conformalArea_sphere`: V_c(n,S²)=A_c(S²)=4π for n≥2.
- `TauCeti.HyperbolicVolumes.conformalArea_cover`: For a degree-d holomorphic map to S², V_c(2,φ)=4πd.
- `TauCeti.HyperbolicVolumes.conformalArea_notHyperbolicArea`: Rescaling a surface’s source metric multiplies its Riemannian area but preserves A_c.

**Sources:** [Peter Li and Shing-Tung Yau](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), §1 equations (1.2)–(1.4) p.271, Facts 2,4 and (1.8) pp.272–273.

**Planet:** Li–Yau conformal area.

### Sphere value and degree comparison

`HyperbolicCurveVolumesAndGonality:HV.7/sphere-degree` (theorem).

For n≥2, V_c(n,S²)=4π. For a finite holomorphic degree-d map M→N between compact Riemann surfaces, V_c(n,M)≤d V_c(n,N), hence A_c(M)≤d A_c(N). In particular A_c(M)≤4πgon(M). A_c need not equal the sphere-map-only infimum 4πgon(M) used as an upper envelope in Abramovich’s wording.

**Construction or proof route:**

- For the n=2 sphere the full sphere automorphism group preserves its total pullback area 4π. For n>2 use the equatorial inclusion and the restricted Li–Yau §3 Proposition 1 argument: stereographic images and sphere conformal images of an equator are round spheres or planes, their trace-free second fundamental form is zero, and the sphere Gauss identity bounds their area by 4π. The lower bound is the blowup argument of §1 Fact 2.
- For a degree-d map M→N, source integration of every postcomposed spherical immersion is d times its N integration. Taking a supremum and infimum gives the inequality. Apply this to a minimum-degree map to P¹.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.7/conformal-area`, `HyperbolicCurveVolumesAndGonality:HV.2/finite-pushforward`, `HyperbolicCurveVolumesAndGonality:HV.6/gonality`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

**Sources:** [Peter Li and Shing-Tung Yau](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), §1 Facts 1–4, pp.271–273; §3 Proposition 1, p.279; Corollary 4, pp.282–283.

### Variational spectral bottom

`HyperbolicCurveVolumesAndGonality:HV.7/rayleigh-bottom` (definition).

For a finite-area metric on M minus a finite singular set, take the infimum λ′₁ of E_h(u)/∫u²dμ_h over nonzero real functions in the closed Dirichlet-form domain with ∫u dμ_h=0. E_h is the integral of |∇u|², with the weak gradient obtained by closure of compactly supported smooth functions and constants. Use the Friedrichs nonnegative Laplacian. In the smooth compact case this is λ₁. In the cofinite hyperbolic case it is min(λ_disc,1/4) when a positive discrete eigenvalue exists, and 1/4 otherwise.

**Construction or proof route:**

- Import the Riemannian gradient/Green identity from DifferentialGeometry; close the quadratic form on L².
- The variational characterization is the needed consumer interface. Continuous-spectrum identification belongs to the automorphic supplier, not this definition.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.2/quotient-area`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L640)

**API:**

- `TauCeti.HyperbolicVolumes.rayleighBottom_bound`: For every admissible mean-zero u, λ′₁∫u²≤E(u).
- `TauCeti.HyperbolicVolumes.rayleighBottom_nonneg`: λ′₁ is nonnegative.
- `TauCeti.HyperbolicVolumes.rayleighBottom_scale`: Replacing h by λ²h scales λ′₁ by λ⁻² and area by λ².
- `TauCeti.HyperbolicVolumes.rayleighBottom_compact`: On a smooth compact connected surface it equals the first positive Laplacian eigenvalue.
- `TauCeti.HyperbolicVolumes.rayleighBottom_cusp`: The cofinite quotient spectral supplier identifies it with the bottom of the positive spectrum.

**Discriminating tests:**

- `TauCeti.HyperbolicVolumes.rayleighBottom_roundSphere`: The unit round sphere has λ₁=2 and area 4π.
- `TauCeti.HyperbolicVolumes.rayleighBottom_constant`: A nonzero constant is excluded by the mean-zero condition.
- `TauCeti.HyperbolicVolumes.rayleighBottom_scale_test`: Doubling all lengths divides λ′₁ by four while multiplying area by four.

**Sources:** [Dan Abramovich](https://arxiv.org/pdf/alg-geom/9609012), §§1.4–1.5, p.2.

**Planet:** Variational spectral bottom.

### Conformal barycenter balancing

`HyperbolicCurveVolumesAndGonality:HV.7/balancing` (theorem).

For an admissible φ:M→Sⁿ and a finite positive nonatomic source measure μ with positive total mass, there exists A∈Conf(Sⁿ) with ∫_M(A∘φ)dμ=0 in ℝ^(n+1), provided φ_*μ is nonatomic. The hyperbolic cusp/elliptic area measure satisfies this hypothesis for the admissible maps used here. A point-mass measure is a non-example.

**Construction or proof route:**

- Use the explicit conformal sphere automorphisms parametrized by the open ball.
- The boundary limit of the normalized average is the identity sphere map because fibres have zero source mass. A continuous ball map restricting to identity on its boundary must hit zero.
- This topological no-retraction input is supplied by DifferentialGeometry Layer 10’s degree/Brouwer development; track the atomless hypothesis in the limit.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.7/branched-conformal-map`, `HyperbolicCurveVolumesAndGonality:HV.2/quotient-area`.

**Current upstream imports:**

- [DifferentialGeometry contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/DifferentialGeometry/README.md#L607)

**Sources:** [Peter Li and Shing-Tung Yau](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), Theorem 1 proof, (2.4)–(2.5), p.274.

### Conformal energy and sphere coordinates

`HyperbolicCurveVolumesAndGonality:HV.7/energy-area` (theorem).

For a smooth branched conformal map ψ:M→Sⁿ, Σ_iE_h(ψ_i)=2Area(ψ) and Σ_i∫ψ_i²dμ_h=Area_h(M). In real dimension two the Dirichlet energy is unchanged by conformally scaling h. If h is the finite-area cusp/elliptic metric on a compactification, each smooth coordinate ψ_i has finite energy. Cutoffs near the singular points show these coordinates belong to the closed form domain, and barycenter balancing makes their means zero.

**Construction or proof route:**

- Trace the pullback round metric in an orthonormal real two-frame: its energy is twice its area.
- Use Σψ_i²=1. Under h↦e^(2v)h the inverse metric and area factors cancel in energy.
- Use logarithmic cutoff functions with Dirichlet cost tending to zero at finitely many punctures; finite area controls the L² cutoff errors. This is the form-domain refinement G7.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.7/branched-conformal-map`, `HyperbolicCurveVolumesAndGonality:HV.7/rayleigh-bottom`, `HyperbolicCurveVolumesAndGonality:HV.7/balancing`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`.

**Sources:** [Peter Li and Shing-Tung Yau](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), Theorem 1 (2.6)–(2.9), pp.274–275; Abramovich §1.6 p.3.

### Li–Yau gonality inequality

`HyperbolicCurveVolumesAndGonality:HV.7/li-yau` (theorem).

For a smooth compact Riemann surface with any compatible smooth metric, λ₁Area≤2A_c≤8πgon. For a cofinite hyperbolic quotient compactification with its finite-area cusp/elliptic metric, λ′₁Area≤2A_c≤8πgon, with λ′₁ defined variationally on the nonsingular locus. Therefore gon≥λ′₁Area/(8π). Use the geometric gonality over ℂ and its smooth projective model.

**Construction or proof route:**

- Balance an almost minimizing conformal map, apply the Rayleigh bound to each coordinate, sum, and let the conformal-area approximation error decrease to zero.
- Use finite-energy form-domain compatibility at cusps and the sphere-map degree bound for gonality. Equality-case minimal immersion theory is outside the stated target.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.7/energy-area`, `HyperbolicCurveVolumesAndGonality:HV.7/sphere-degree`, `HyperbolicCurveVolumesAndGonality:HV.6/base-change`.

**Sources:** [Peter Li and Shing-Tung Yau](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf), Theorem 1 inequality (2.1) pp.273–275; Abramovich §§1.6–1.7 p.3.

**Planet:** Li–Yau gonality inequality.

### Congruence spectral-gap gonality bound

`HyperbolicCurveVolumesAndGonality:HV.7/congruence-application` (application).

Given a congruence quotient Γ\H and a supplier theorem λ′₁≥c>0 with the curvature −1/Friedrichs conventions, gon_C(X_Γ)≥c Area(Γ\H)/(8π). For Γ⊂PSL₂(ℤ) of index D, imported quotient area is πD/3, giving gon≥cD/24. The constant c is a supplied theorem, never an assumed field of a hyperbolic-surface record.

**Construction or proof route:**

- Import the automorphic lower bound and the modular area/index formula. Substitute in the proven analytic inequality.
- Job #1699 is the designated spectral-gap extension and has no stage at this snapshot; record G8 rather than fabricate a supplier identifier.

**Direct inputs:** `HyperbolicCurveVolumesAndGonality:HV.7/li-yau`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`.

**Sources:** [Dan Abramovich](https://arxiv.org/pdf/alg-geom/9609012), Theorem 0.1 p.1; §§1.5,1.7 pp.2–3.

## Unresolved inputs

### G1: Local analytic-algebra foundations of normalization

Demailly II (7.12) uses analytic local-ring Noetherianity, finite universal denominators, and the analytic closure theorem II (5.4). These are not supplied by algebraic GAGA. The normalization target and full API/tests are planned, but these foundational proof inputs need precise local analytic-algebra nodes or an identified owner. No closure is claimed.

### G3: Original HT02/HT12 comparison proofs inaccessible

The job requires reading the original HT02 and HT12 texts. Public title/author/DOI searches and the Project MUSE article/1000/pdf and article/464633/pdf endpoints returned metadata or verification HTML, not readable originals. No cleared copy is listed in the maintainer library. The HT02 Theorem 2 point-volume comparison proof remains inaccessible. The diagonal Hessian now has an explicit independent calculation, and BT supplies the alternate HT12 diagonal proof; neither substitutes for the requested original-source reading.

### G4: Product-diagonal tie-boundary limit

BT Lemma 22 supplies the two-region argument and orientation sign. The proof sketch explicitly identifies regularized max, tie regions with open pieces and the positive boundary-current limit; this singular-interface justification still requires a full local analytic proof before stage closure.

### G5: Linked-series incidence/dimension decomposition

The original primary inputs are now read: Osserman 2006 Definition 4.5/Theorem 5.3/Proposition 6.6 and Appendix A, plus math/0605372 §5 Corollary 5.5. The target-level limit-pencil node is exact, but full linked-Grassmannian definitions, exactness/open-density/tangent-dimension APIs and the endpoint-fibre stratification need their own nodes and checked prototypes. Smoothing requires the explicit StableReduction extension request. No source-access gap remains for these inputs.

### G6: Restricted spherical conformal geometry

Li–Yau §3 Proposition 1 p.279 and Corollary 4 pp.282–283 have now been read. The equatorial S² specialization is isolated; full formal contracts for stereographic/conformal images of round subspheres and the restricted Gauss identity are still needed. A generic minimal-immersion theorem is not silently taken as a baseline fact.

### G7: Cusp Dirichlet-form-domain approximation

Abramovich §1.6 gives conformal energy finiteness; the reader specifies logarithmic cutoffs at finitely many cusp/elliptic points. Their convergence in the chosen closed Dirichlet form and agreement with the spectral supplier Friedrichs realization need checked supporting nodes. Finite energy alone is not silently treated as form-domain membership.

### G8: Congruence-gap extension not yet assigned a stage

Design issue #1699 owns the AutomorphicSpectralTheory extension, not the present packet. Its actual supplier stage is absent; request λ′₁≥c and identification of the cofinite Laplacian positive spectral bottom when it exists. Keep the final application conditional on this external theorem. Do not re-plan its automorphic proof.

### G9: Current upstream stage IDs absent from atlas snapshot

Current DifferentialGeometry at commit 070dc2becd74419e76303ede84b465ed4a69461f supplies layers 0,1,5,6,10,11,12. Their exact public URL contracts are in upstreamPrerequisites/upstreamRequests, since these stage IDs are absent from the atlas and cannot be added to this issue’s allowlist. The boundary is an import, never a duplicate set of smooth-form/Stokes/Laplacian targets. Suggested signatures use existing local Mathlib types; global contracts are not replaced by arbitrary predicates.

## Supplier requests

- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action`: Projective isometries, free quotient charts and proper discontinuity for discrete torsion-free groups.

- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`: Cyclic elliptic quotient charts and their metric-density descent, degree m and area division by m.

- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`: Geodesic midpoints and disc isometry normalization; invariant-measure/Riemannian area comparison; measurable fundamental domains and modular area πD/3.

- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`: Actual cusp q charts and transition laws, cusp density and precisely invariant horodiscs; constant q=0 is treated separately.

- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`: Compactified cofinite quotient Riemann surfaces, finite cusp/elliptic exceptional sets, compactness and functoriality.

- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`: Finite nonconstant holomorphic map local orders, degree/fibre sums and degree-one biholomorphism, compatible with algebraic degrees.

- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`: Function-field RR and divisor spaces; consume existing statements rather than reconstruct them analytically.

- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`: RR consequences, rationality and canonical degree at the function-field level, without supplying analytic area.

- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`: Smooth projective models, P¹, function-field/curve dictionary preserving finite morphisms and degrees; genus and canonical bundle comparison.

- `SchemeAndStackFoundations:SF.5`: Proper curve/Cartier-divisor intersection and line-bundle degree on smooth projective products; analytic normalization orders agree with proper algebraic diagonal intersection. No intersection with barΔ or Cartier interpretation of Δ₂.

- `ComplexComparisonPartII:C2`: Coherent analytification and line-bundle compatibility for degree comparisons, using C0–C1.

- `ComplexComparisonPartII:C4`: Algebraization of proper curve morphisms and closed analytic curves, preserving their smooth projective normalization; imported coherent GAGA supplies the underlying bundle comparison.

- `AlgebraicModuliForArithmeticGeometry:R09.1`: Projective bundles and relative Grassmannians with universal rank-two subbundles and base-change, needed to construct the pencil incidence scheme.

- `AlgebraicModuliForArithmeticGeometry:R09.2`: Picard parameter space and representability for smooth proper curve families, plus finite-type descent and specialization of a nonempty base-point-free locus with fixed degree. This request extends the existing moduli supplier; it does not presume its current packet already proves this contract.

- `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`: Pointed compact-type nodal curves and regular DVR smoothing of a two-component curve with smooth sections. Smoothing existence is additional scope needed by Osserman’s induction, isolated in G5.

- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`: Relative degree-d Picard schemes for smooth projective families and compact-type two-component families; properness, fppf descent, base change and Poincaré bundles after section rigidification. Quotient Pic(X_T)/Pic(T) alone is not representable without handling its sheafification/obstruction.

- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`: High-divisor twisting, vanishing of R¹π_*L(D), locally free π_*L(D), arbitrary-base-change compatibility and evaluation maps along flat effective Cartier divisors for the Grassmannian construction.

## Source versions and corrections

All statements above are mathematical specifications in the worker’s own words. No source passage is reproduced. The packet records editions, URLs, read sections and available byte hashes. The original Hwang–To texts remain unread because the retrieved publisher endpoints returned verification HTML; BT’s alternate proof does not discharge that explicit source requirement.

Two corrections retain the provenance of the existing PAPER-BAKKER-TSIMERMAN-16 errata record, rather than claiming a new independent review. In Proposition 23, ddᶜlog(χ/(1−χ)) has smooth part ω/(4π), with atomic part [Δ]. In the conjugate relative bound, 0<r<R gives the small/large factor sinh(r)/sinh(R). The conjugate diagonal is totally real and has no complex-divisor intersection number.

- [Benjamin Bakker and Jacob Tsimerman, p-torsion monodromy representations of elliptic curves over geometric function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf). Annals of Mathematics 184 (2016), no.3, 709–744, published version. Read: §1.3 pp.712–713; Lemma 13 and Figure 2 pp.724–725; §§5.1–5.2 pp.732–735; Canonical degree paragraph p.736 Accessed 2026-10-11. SHA256 `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a`.

- [Benjamin Bakker and Jacob Tsimerman, Erratum to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf). Undated five-page author erratum; no publication date inferred. Read: All five pages; §3 pp.2–3 and reversed ratio in §4.1 p.3 checked Accessed 2026-10-11. SHA256 `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1`.

- [Jean-Pierre Demailly, Complex Analytic and Differential Geometry](https://www-fourier.univ-grenoble-alpes.fr/~demailly/source_files/analgeom/agbook.pdf). Version of Thursday June 21, 2012. Read: I §2 (2.1)–(2.14) pp.13–17; I §5 (5.1)–(5.12) pp.39–41; II §7 (7.7)–(7.13) pp.113–115; III (1.13)–(1.20) pp.132–135, (2.3),(2.7),(2.14)–(2.15) pp.139–144, (3.1)–(3.7) pp.144–148, (5.4)–(5.8) pp.158–159, (7.1)–(7.7) pp.166–168; V (12.6)–(12.8),(13.2)–(13.4) pp.269–271. Accessed 2026-10-11. SHA256 `f41eb026184088b5b14e3127a0bf693e6c51e176a63a8896ffd6e0818db8098f`.

- [Dan Abramovich, A linear lower bound on the gonality of modular curves](https://arxiv.org/pdf/alg-geom/9609012). arXiv alg-geom/9609012v1 (16 September 1996); regenerated internal heading October 23, 2018. Read: §§0.1–1.8 pp.1–3, including singular metric, λ′₁ Rayleigh characterization and conformal area proof Accessed 2026-10-11. SHA256 `5ff2134fbfb6bd702fa7051637027405c8e0d77a595830a63e8ad36f50791779`.

- [Peter Li and Shing-Tung Yau, A New Conformal Invariant and Its Applications to the Willmore Conjecture and the First Eigenvalue of Compact Surfaces](https://math.jhu.edu/~js/Math748/li-yau.conformal.pdf). Inventiones mathematicae 69 (1982), 269–291; public scanned PDF viewed through browser. Read: §1 Facts 1–4 pp.271–273; §2 Theorem 1 inequality proof pp.274–275, consequences pp.276–277; §3 Proposition 1 and Corollary 4 pp.279,282–283. Read through public browser; direct download returned 403. Accessed 2026-10-11.

- [Brian Osserman, A simple characteristic-free proof of the Brill–Noether theorem](https://arxiv.org/pdf/1108.4967). arXiv:1108.4967v1, 24 August 2011. Read: Theorem 1.1, Remarks 1.2–1.3 pp.1–2; Lemma 2.1 pp.3–5; Definitions 3.2, Theorems 3.8,3.11, Corollary 3.12, proof pp.5–8. Accessed 2026-10-11. SHA256 `4c41acaea0191139128490abdd9dda29813c6f9551e75008fc6d015fb93be62b`.

- [Brian Osserman, Brian Osserman, A limit linear series moduli scheme](https://aif.centre-mersenne.org/item/10.5802/aif.2209.pdf). Published Annales de l’Institut Fourier 56 (2006), 1165–1205. Read: §§3–6 statements and Theorem 5.3/Proposition 6.6 proofs; Appendix A definitions, exactness, density, tangent-dimension and Theorem A.15, pp.1170–1188,1194–1203. Accessed 2026-10-11. SHA256 `f27d7b75d5ad834d460920b9ae6dd91964548a9df8c1a5a606511403f2a585fe`.

- [Brian Osserman, Brian Osserman, Linked Grassmannians and crude limit linear series](https://arxiv.org/pdf/math/0605372). arXiv author preprint math/0605372. Read: Definition 2.1 and Theorem 2.2 pp.2–3; §5 construction, Theorem 5.3, Lemma 5.4, Corollary 5.5 pp.11–14; full general endpoint-fibre proof §4 remains to be decomposed. Accessed 2026-10-11. SHA256 `4561bae659f418f5498a84688a048e6fe4fac6cf11ac4cdecde56e9af571d460`.
