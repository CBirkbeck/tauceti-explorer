# Conformal mapping and the geometric theory of holomorphic functions, Part II

This roadmap develops analytic covering maps of punctured plane domains, their Schwarzian equations, and quantitative growth on the disc. Its principal example is the universal cover of the plane with the Nth roots of unity removed. The two summits are the Gamma formula for its conformal radius and an effective circle-mean bound uniform in N. Along the way it builds reusable complex linear ODE theory, meromorphic local bases, finite Blaschke products, normalized Herglotz formulas, hypergeometric continuation and disc-local Nevanlinna theory.

The layers are arranged by mathematical dependencies. O0 supplies complex differential equations; U0 supplies analytic covers; S0 gives the inverse equation; L0 supplies logarithmic integrals; H0 and R0 evaluate the inverse and radius; F0 identifies the covering groups; V0 localizes value distribution; G0 bounds large values geometrically; M0 proves uniform mean growth. Read the targets as library specifications, including the APIs and examples attached to each construction.

## Boundaries and dependencies

Reuse [ConformalMapping](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ConformalMapping) for planar conformal mapping: **L2** (Schwarz lemma, its equality case and disc automorphisms), **L3** (normalized Riemann mapping, logarithm and root branches), and **L4** (analytic continuation, monodromy and Schwarz reflection). Its planar Riemann mapping theorem does not supply uniformization of an abstract analytic universal cover; that extension is a target of U0 here. Boundary correspondence and Schwarz–Christoffel theory remain in ConformalMapping.

Reuse [UniversalCovers](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/UniversalCovers), **Stage 0** (the universal-cover carrier, local sheets and simply connected total space), **Stage 1** (deck transformations and the fundamental-group action), and **Stage 2** (based lifts). The carrier is `TauCeti.UniversalCover a`, with its existing quotient topology and projection. For its complex charts, specialize `TauCeti.Geometry.Manifold.Instances.UniversalCover` to the complex model: `TauCeti.UniversalCover.instChartedSpace`, `instIsManifold` and `isLocalDiffeomorph_proj` already provide the lifted atlas and local holomorphic projection. U0 supplies their planar compatibility statements and examples. General atlas compatibility for covers belongs to [DifferentialGeometry, Layer 2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DifferentialGeometry/README.md#layer-2-orientations-and-the-orientation-double-cover).

Reuse [FuchsianOrbifolds](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/FuchsianOrbifolds), **Layer 0** (effective projective action, discreteness, stabilizers and free-locus quotients), **Layer 2** (hyperbolic polygons, reflected side pairings, Poincaré's theorem, presentations and area), and **Layer 3** (primitive cusp data, full stabilizers, cusp charts and transport). F0 gives only the symmetric roots-cover instances. For Shimizu's inequality use `Subgroup.inv_le_abs_apply_one_zero_of_upperRightHom_mem` in `TauCeti.Analysis.Complex.Fuchsian.Shimizu`; G0 adds the estimate involving both matrix entries that this particular group needs. Generic orbifold compactification, degree and genus theory belong to FuchsianOrbifolds.

Mathlib supplies analytic functions, iterated complex derivatives, meromorphic order, divisors, trailing coefficients, circle averages, proximity and characteristic functions, the ordinary hypergeometric series, Gamma and digamma functions, and elementary special-function identities. Import those interfaces and extend them. In particular, use `MeromorphicOn.divisor`, `Real.circleAverage`, `ValueDistribution.proximity` and `meromorphicTrailingCoeffAt`. Do not replace a meromorphic scalar representative by a projective-valued function without a comparison theorem.

## Conventions

* Write 𝔻 = {z∈ℂ : |z|<1}, ℍ = {τ∈ℂ : Im τ>0}, μ_N = {ζ∈ℂ : ζ^N=1}, and ζ_N = exp(2πi/N). Every roots-cover statement assumes an integer N≥2.
* All derivatives are complex derivatives. A linear equation is monic of positive order n. Its initial jet contains derivatives of orders 0,…,n−1, without factorial rescaling.
* A hyperbolic plane domain is connected and open with at least two distinct omitted points. A pointed holomorphic universal cover is surjective onto that domain. On a disconnected open set, use the component containing the specified point.
* The normalized cover F_N:𝔻→ℂ∖μ_N satisfies F_N(0)=0. For inverse formulas use the orientation F_N′(0)>0 real. Its half-plane version is F̃_N=F_N∘C⁻¹, where C(z)=i(1+z)/(1−z). The cusp at i∞ has limiting value 1. The shorthand F_N(1)=1 denotes this limit, never an interior value.
* Projective groups use the effective action of PSL₂(ℝ). Matrix calculations may use an SL₂(ℝ) lift; statements must be invariant under its negation. A primitive cusp width generates the **full** parabolic stabilizer, rather than just exhibiting some translation in it. The triangle supergroup is orientation preserving.
* Integrals over circles are probability Haar means, equivalently `(2π)⁻¹` times the angular integral. Write m(r,f) for the mean of log⁺|f|. T_D and N_D are the disc-local characteristic and pole count defined in V0; their centre contribution uses log r and can be negative for a centre pole.
* Meromorphic order describes a punctured germ. Nonnegative order permits a removable singularity with an incorrectly assigned scalar value. Pointwise holomorphy requires continuity of that representative. A finite scalar value at zero never substitutes for a nonnegative centre order.
* Native rational expressions are totalized by Lean's division. Analytic and inverse statements retain their nonzero-denominator guards. Native hypergeometric series values outside their convergence disc never stand for analytic continuation.
* Constants labelled effective must come from explicit estimates or algorithms. An absolute constant is independent of N and r. The fixed-level constant C_N may depend on N; it is used only for the finite completion in M0.

## Sources

**CDT**: Frank Calegari, Vesselin Dimitrov and Yunqing Tang, [*The unbounded denominators conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), *Journal of the American Mathematical Society* **38** (2025), 627–702, [DOI 10.1090/jams/1053](https://doi.org/10.1090/jams/1053). Page references below are the printed journal pages. Section 1.1.6 and the proof of Corollary 2.0.5 motivate the ODE interfaces; Lemma 2.3.1 supplies the quotient representation; §§5–6 supply the quantitative covering theory. Where CDT invokes Hempel's accessory parameters, special-function connection formulas or fixed-puncture growth theory, the target includes the proof of that input, with its hypotheses stated here. A citation to that invocation does not identify it as a theorem already present in the libraries.

The original references used by CDT include Hempel [Hem88] for accessory parameters, Abramowitz–Stegun [AS92, 15.3.10, 6.1.33] for hypergeometric continuation and log-Gamma, and Tsuji [Tsu52, Theorem 11] for fixed-puncture growth. Their exact roles are specified at the relevant targets. The effective fixed-level assertion below includes its own proof and small-radius estimates.

## Layer O0: Complex linear equations and meromorphic local bases

Begin with analytic complex linear equations. Their initial jets, continuation and singular-point bases supply the inverse-cover calculations without identifying identity monodromy with meromorphic extension.

**Analytic complex linear differential equations.** For a connected open Ω⊆ℂ and n≥1, an analytic monic linear equation is y^(n)+Σ_{j<n} a_j y^(j)=0 with each a_j holomorphic on Ω; its initial-value map at x₀∈Ω records the n derivatives 0 through n−1. The corresponding companion first-order system is over ℂ, with complex-analytic coefficients.

Required API:

* `LinearEquation.mk`: An analytic family a_j on Ω constructs the monic order-n equation.
* `LinearEquation.initialJet`: At x₀∈Ω a solution has jet (y(x₀),…,y^(n−1)(x₀))∈ℂ^n.
* `LinearEquation.companion`: Solutions correspond to analytic solutions of the companion first-order system, preserving the initial jet.

Examples and distinctions:

* For n=1 and a₀=0, solutions on a connected Ω are constants.
* For n=2 with zero coefficients, solutions are affine functions and their initial jet is (y(x₀),y′(x₀)).
* a₀(x)=1/x is not an analytic coefficient on a domain containing 0.

Source: CDT, p.632; 1.1.6. Prerequisites: Tau Ceti `TauCeti.IsAnalyticContinuationAlong`.

**Analytic linear initial-value theorem.** For the equation above and x₀∈Ω, every complex initial jet has a unique holomorphic solution germ at x₀; the solution-germ space is linearly isomorphic to ℂ^n.

Source: CDT, p.632; 1.1.6. Prerequisites: **O0**, analytic complex linear differential equations.

**Continuation of linear ODE solutions.** On a connected open Ω, each local solution germ of an analytic monic order-n equation continues along every continuous path in Ω; continuation is in TauCeti.IsAnalyticContinuationAlong and preserves the differential equation.

Source: CDT, p.632; 1.1.6. Prerequisites: **O0**, analytic linear initial-value theorem; Tau Ceti `TauCeti.IsAnalyticContinuationAlong`; [ConformalMapping — milestone l4 / analytic continuation / the reflection principle](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l4--analytic-continuation--the-reflection-principle).

**Global solutions on simply connected domains.** For a simply connected open Ω and analytic monic order-n equation, the space of holomorphic solutions on Ω has complex dimension n, and evaluation of the initial jet at any x₀∈Ω is a linear isomorphism.

Source: CDT, p.632; 1.1.6. Prerequisites: **O0**, continuation of linear ode solutions; **O0**, analytic linear initial-value theorem; [ConformalMapping — milestone l4 / analytic continuation / the reflection principle](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l4--analytic-continuation--the-reflection-principle).

**Meromorphic trivial local monodromy.** At an isolated singular point α, the equation's domain must contain a deleted neighbourhood of α (`Ω ∈ nhdsWithin α {α}ᶜ`). The meromorphic-basis condition requires that the full n-dimensional local solution space has a basis of single-valued functions meromorphic on a full neighbourhood of α. This includes finite pole orders; it is stronger than identity of the analytic continuation representation alone.

Required API:

* `MeromorphicBasisMonodromy.basis`: The witness is a basis of the local solution space consisting of meromorphic germs at α.
* `MeromorphicBasisMonodromy.finitePoleBound`: A maximum of the finitely many pole orders bounds the pole order of every solution.
* `MeromorphicBasisMonodromy.identityMonodromy`: These meromorphic germs give identity analytic continuation around the puncture; the converse needs an additional regularity hypothesis.

Examples and distinctions:

* At an ordinary point an analytic basis satisfies the condition with pole bound zero.
* The order-one equation xy′+y=0 on a punctured disc has basis x⁻¹ and pole bound one.
* The equation x²y′+y=0 has the single-valued solution e^(1/x); identity topological monodromy does not give a meromorphic basis.

Source: CDT, §2, proof of Corollary 2.0.5, p.636 (meromorphic local bases). Prerequisites: **O0**, analytic linear initial-value theorem.

**Simultaneous algebraic pole clearing.** Let L have coefficients in ℚ̄(x), let α be an algebraic singular point with the meromorphic-basis condition, and let p∈ℚ̄(x) be nonconstant and regular at α. There is a nonzero q∈ℚ̄[t] such that q(p(x)) times every local solution is holomorphic at α. One can clear finitely many such singularities simultaneously. A nonzero rational polynomial also suffices for any finite set of algebraic images: use sufficiently high powers of their minimal polynomials, thereby adjoining the finite conjugate closure; the original image set need not be Galois-saturated.

Source: CDT, p.636; Corollary 2.0.5. Prerequisites: **O0**, meromorphic trivial local monodromy.

## Layer U0: Analytic universal covers and pointed radius

Specialize the existing lifted manifold charts to complex plane domains, establish hyperbolic uniformization, and make based covers usable through lifting, uniqueness and extremality. The roots-of-unity family is the distinguished example.

**The disc–half-plane coordinate.** Define C(z)=i(1+z)/(1−z) on |z|<1 and C⁻¹(τ)=(τ−i)/(τ+i) on Im τ>0. These are inverse holomorphic maps, C(0)=i, and z→1 corresponds to the cusp at infinity; no value at the boundary point 1 is part of the interior map.

Required API:

* `CayleyCoordinate.apply`: C(z)=i(1+z)/(1−z) for |z|<1.
* `CayleyCoordinate.inverse`: C⁻¹(C(z))=z and C(C⁻¹(τ))=τ on the stated domains.
* `CayleyCoordinate.imaginaryPart`: Im C(z)=(1−|z|²)/|1−z|²>0 on the disc.

Examples and distinctions:

* C(0)=i.
* C(1/2)=3i.
* The rational formula has zero denominator at z=1; the interior biholomorphism does not assign it a complex value.

Source: CDT, p.667; Remark 5.0.1. Prerequisites: Tau Ceti `TauCeti.bijOn_I_mul_one_add_div_one_sub_ball` and `TauCeti.I_mul_one_add_sub_I_div_add_I_div_one_sub` in `TauCeti.Analysis.Complex.UpperHalfPlane.Cayley` (reuse the native coordinate).

Use the native Cayley bijections and inverse identity in `TauCeti.Analysis.Complex.UpperHalfPlane.Cayley`. A local abbreviation C fixes the direction used here; the coordinate and its holomorphic bijection theory are imported.

**Complex charts on the topological cover.** For a connected open Ω⊆ℂ and a base point a∈Ω, use the complex one-dimensional manifold structure on the existing TauCeti.UniversalCover a furnished by `TauCeti.UniversalCover.instChartedSpace` and `instIsManifold`. Its projection to Ω is a local biholomorphism by `TauCeti.UniversalCover.isLocalDiffeomorph_proj` with complex scalars. Inverse covering sheets give charts whose transition functions are restrictions of the identity on Ω. The required uniqueness means compatibility of atlases making this projection locally biholomorphic, rather than literal equality of chosen charted-space records.

Required API:

* `CoverComplexStructure.projection`: The projection is the existing TauCeti.UniversalCover.proj.
* `CoverComplexStructure.chart`: Each covering sheet gives a holomorphic chart by the base plane coordinate.
* `CoverComplexStructure.topologyComparison`: The manifold topology equals the existing quotient topology of UniversalCover.

Examples and distinctions:

* For Ω=𝔻, the cover projection is a biholomorphism.
* For a nontrivial annulus the projection is not injective.
* On an overlap of two lifted plane-coordinate charts, the transition is the identity.

Source: CDT, §5.1, setup preceding Definition 5.1.1, p.667. Prerequisites: Tau Ceti `TauCeti.UniversalCover`; `TauCeti.UniversalCover.isCoveringMap`; `TauCeti.UniversalCover.simplyConnectedSpace`; `TauCeti.UniversalCover.instChartedSpace`, `instIsManifold` and `isLocalDiffeomorph_proj` in `TauCeti.Geometry.Manifold.Instances.UniversalCover`; `IsLocalHomeomorph.chartAt_chartedSpaceComap_apply` in `TauCeti.Geometry.Manifold.Instances.Comap`; [UniversalCovers — Stage 0: port the foundations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/UniversalCovers/README.md#stage-0-port-the-foundations-into-tauceti); [DifferentialGeometry — Layer 2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DifferentialGeometry/README.md#layer-2-orientations-and-the-orientation-double-cover).

**Hyperbolic uniformization of the cover.** For a connected open Ω⊆ℂ whose complement has at least two points, its analytic universal cover is biholomorphic to the unit disc. The plane and sphere alternatives of simply connected Riemann-surface uniformization must be excluded; the simply connected planar Riemann mapping theorem alone does not prove this assertion.

Source: CDT, §5.1, setup preceding Definition 5.1.1, p.667. Prerequisites: **U0**, complex charts on the topological cover; Tau Ceti `TauCeti.UniversalCover.simplyConnectedSpace`; Tau Ceti `TauCeti.riemannMapping`.

**Pointed analytic cover uniqueness.** Two holomorphic universal covers F,G:𝔻→Ω with F(0)=G(0)=a are related by a unique disc automorphism fixing 0, hence by a rotation. Their derivatives at 0 have equal norms. A disc map into Ω fixing a lifts uniquely through F after choosing its lift at 0.

Source: CDT, §5.1, normalization discussion after Lemma 5.1.2, p.668. Prerequisites: **U0**, hyperbolic uniformization of the cover; [UniversalCovers — stage 2 lifting criterion and galois correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/UniversalCovers/README.md#stage-2-lifting-criterion-and-galois-correspondence); [ConformalMapping — milestone l2 / schwarz lemma extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l2--schwarz-lemma-extensions).

**The pointed conformal radius.** For a connected hyperbolic plane domain Ω and a∈Ω, define R(Ω,a)=|F′(0)| for any holomorphic universal cover F:𝔻→Ω with F(0)=a. The positive real number is independent of the cover. If an open set is disconnected, apply this construction to the connected component containing a, never to a nonsurjective cover of the whole set.

Required API:

* `conformalRadius.coverDerivative`: R(Ω,a)=|F′(0)| for every pointed holomorphic universal cover.
* `conformalRadius.positive`: R(Ω,a)>0.
* `conformalRadius.riemannMap`: If Ω is simply connected and φ is the normalized Tau Ceti map Ω→𝔻 at a, then R(Ω,a)=1/|φ′(a)|.
* `conformalRadius.affineChange`: For b≠0, R(bΩ+c,ba+c)=|b|R(Ω,a).

Examples and distinctions:

* R(𝔻,0)=1.
* R(D(0,2),0)=2.
* ℂ∖{0} does not satisfy the two-omitted-point hyperbolic-domain hypothesis.

Source: CDT, §5.1, discussion preceding Theorem 5.1.4, p.668. Prerequisites: **U0**, pointed analytic cover uniqueness; **U0**, hyperbolic uniformization of the cover.

**Extremality of the pointed cover.** For a pointed holomorphic universal cover F:𝔻→Ω and a holomorphic φ:𝔻→Ω with φ(0)=F(0)=a, |φ′(0)|≤R(Ω,a). Equality holds exactly when the based lift of φ is a rotation, equivalently when φ is a holomorphic universal cover.

Source: CDT, p.632; 1.1.6. Prerequisites: **U0**, pointed analytic cover uniqueness; **U0**, the pointed conformal radius; Mathlib `Complex.norm_deriv_le_one_of_mapsTo_ball`; [ConformalMapping — milestone l2 / schwarz lemma extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l2--schwarz-lemma-extensions).

**Monotonicity of conformal radius.** For connected hyperbolic domains Ω⊆Ω′ and a∈Ω, R(Ω,a)≤R(Ω′,a). Apply the preceding extremal inequality to the pointed covering of Ω followed by inclusion.

Source: CDT, p.632; 1.1.6. Prerequisites: **U0**, extremality of the pointed cover.

**The normalized roots-of-unity covering.** For an integer N≥2 choose a holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0. For the explicit inverse-germ calculations orient it with F_N′(0)>0 real. Its half-plane form is F̃_N=F_N∘C⁻¹; the standard cusp chart is chosen so that its limit at i∞ is 1. The notation F_N(1)=1 denotes that cusp limit, not evaluation in the disc.

Required API:

* `RootsCover.mapZero`: F_N(0)=0.
* `RootsCover.omitsRoots`: For |z|<1 and ζ^N=1, F_N(z)≠ζ.
* `RootsCover.halfPlane`: F̃_N(C(z))=F_N(z) on the disc.
* `RootsCover.derivativeOrientation`: The oriented cover has F_N′(0)>0 real; changes of source rotation preserve its norm.

Examples and distinctions:

* For N=2 the target is ℂ∖{−1,1}.
* 0 is in the target and its chosen preimage is 0.
* F_N(1)=1 is a cusp limit and 1 is omitted from all interior values.

Source: CDT, p.667; Definition 5.1.1. Prerequisites: **U0**, hyperbolic uniformization of the cover; **U0**, the disc–half-plane coordinate; **U0**, pointed analytic cover uniqueness; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action); [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

**Nonvanishing derivative of the cover.** For every N≥2 and |z|<1, F_N′(z)≠0. A holomorphic covering between one-dimensional complex manifolds is a local biholomorphism, hence has nonzero complex derivative.

Source: CDT, p.668; Lemma 5.1.2. Prerequisites: **U0**, the normalized roots-of-unity covering; **U0**, complex charts on the topological cover.

**Rotation equivariance of the covering.** For N≥2 and ζ^N=1, F_N(ζz)=ζF_N(z) for |z|<1. For the standard left action τ↦(aτ+b)/(cτ+d), the matrix r̃_N=[cos(π/N),−sin(π/N);sin(π/N),cos(π/N)] corresponds through C to multiplication by ζ_N⁻¹. Its inverse corresponds to ζ_N. Both have projective order N; use the displayed r̃_N in the subgroup presentations below.

Source: CDT, p.668; Lemma 5.1.2. Prerequisites: **U0**, the normalized roots-of-unity covering; **U0**, pointed analytic cover uniqueness; **U0**, nonvanishing derivative of the cover; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

**The descended power map.** For N≥2 there is a unique holomorphic G_N:𝔻→ℂ∖{1} with G_N(z^N)=F_N(z)^N. Define it by root descent and remove the apparent root ambiguity using equivariance; G_N(0)=0. It is ramified at the lifts of zero other than the chosen local branch and is not asserted to be a universal covering.

Required API:

* `PowerDescent.rootEquation`: G_N(z^N)=F_N(z)^N for |z|<1.
* `PowerDescent.mapZero`: G_N(0)=0.
* `PowerDescent.derivative`: G_N′(0)=F_N′(0)^N; consequently |G_N′(0)|=R(ℂ∖μ_N,0)^N.
* `PowerDescent.rootIndependence`: Any two Nth roots of an input give identical defining values.

Examples and distinctions:

* If F_N(z)=az+O(z^(N+1)), then G_N(w)=a^Nw+O(w²).
* The local inverse exists at 0 because a≠0.
* For N=2, choosing z or −z gives the same G_2(z²).

Source: CDT, p.671; Definition 5.1.15. Prerequisites: **U0**, rotation equivariance of the covering.

**Derivative of the descended power map.** G_N′(0)=F_N′(0)^N and |G_N′(0)|=|F_N′(0)|^N for N≥2.

Source: CDT, p.671; Definition 5.1.15. Prerequisites: **U0**, the descended power map; **U0**, nonvanishing derivative of the cover.

**Projective realization of analytic deck transformations.** For a connected hyperbolic plane domain Ω and a pointed holomorphic universal cover F:𝔻→Ω, its existing topological deck transformations are holomorphic disc automorphisms. Conjugation through C identifies their action with a discrete subgroup of PSL₂(ℝ), acting freely on ℍ, and the analytic quotient is Ω. For a finite punctured plane this is its Fuchsian covering group.

Source: CDT, §5.1, setup preceding Definition 5.1.1, p.667. Prerequisites: **U0**, complex charts on the topological cover; **U0**, hyperbolic uniformization of the cover; **U0**, the disc–half-plane coordinate; [UniversalCovers — stage 2 lifting criterion and galois correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/UniversalCovers/README.md#stage-2-lifting-criterion-and-galois-correspondence); [ConformalMapping — milestone l2 / schwarz lemma extensions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l2--schwarz-lemma-extensions); [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

## Layer S0: Schwarzians and accessory parameters

The Schwarzian makes the inverse covering independent of projective coordinates. Its cusp principal parts and regularity at infinity determine the symmetric differential equation.

**The Schwarzian derivative.** For a holomorphic f with f′≠0 on an open set, define S(f)(x)=f‴(x)/f′(x)−(3/2)(f″(x)/f′(x))². This equals (f″/f′)′−(1/2)(f″/f′)². The totalized native derivative expression carries no Schwarzian claims at points where f′=0.

Required API:

* `schwarzian_affine`: For a≠0, S(x↦ax+b)=0.
* `schwarzian_expanded`: For holomorphic f with f′≠0, S(f)=(f″/f′)′−(1/2)(f″/f′)².
* `schwarzian_comp_apply`: S(f∘g)=(S(f)∘g)(g′)²+S(g) when f,g are holomorphic with the relevant derivatives nonzero.
* `schwarzian_moebius`: Postcomposition by a Möbius map with nonzero determinant leaves S unchanged wherever its denominator is nonzero.

Examples and distinctions:

* S(x↦2x+1)=0.
* For x≠0, S(x↦x²)(x)=−3/(2x²).
* For x≠0, S(x↦1/x)(x)=0.

Source: CDT, p.669; Remark 5.1.10. Prerequisites: Mathlib `iteratedDeriv` and `deriv`.

**Schwarzian chain rule.** For holomorphic f,g near x, with g′(x)≠0 and f′(g(x))≠0, S(f∘g)(x)=S(f)(g(x))g′(x)²+S(g)(x).

Source: CDT, p.669; Remark 5.1.10. Prerequisites: **S0**, the schwarzian derivative.

**Möbius invariance of the Schwarzian.** For ad−bc≠0 and M(w)=(aw+b)/(cw+d), S(M∘f)=S(f) where f is locally univalent and cf+d≠0. A branch change of the inverse of a holomorphic cover is a projective transformation, so its Schwarzian is branch-independent.

Source: CDT, p.669; Remark 5.1.10. Prerequisites: **S0**, schwarzian chain rule; **U0**, pointed analytic cover uniqueness; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

**The Schwarzian differential equation.** On a sufficiently small simply connected neighbourhood where w′≠0, choose an analytic square root of w′. Then v₁=w/√w′ and v₂=1/√w′ are independent solutions of y″+(1/2)S(w)y=0 and w=v₁/v₂. Conversely a quotient of independent solutions of y″+Qy=0 has Schwarzian 2Q wherever its denominator is nonzero.

Source: CDT, p.669; (5.1.11). Prerequisites: **S0**, the schwarzian derivative; **O0**, analytic linear initial-value theorem; [ConformalMapping — milestone l3 / the riemann mapping theorem summit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l3--the-riemann-mapping-theorem-summit).

**Hempel’s accessory-parameter formula.** Let S={p₀,…,p_N}⊂ℂ consist of distinct finite points, |S|≥3; thus infinity is unpunctured in ℙ¹∖S. For a local inverse τ of its holomorphic universal cover, S(τ)(X)=(1/2)Σ_k(X−p_k)⁻²+Σ_k m_k/(X−p_k) for constants m_k. The branch-independent Schwarzian is rational and has the stated principal parts.

Source: CDT, proof of Lemma 5.1.8, equations (5.1.12)–(5.1.14), p.670; Hempel [Hem88]. Prerequisites: **S0**, möbius invariance of the schwarzian; **U0**, hyperbolic uniformization of the cover; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

**Accessory-parameter constraints at infinity.** With Hempel’s finite set S and infinity unpunctured, Σ m_k=0, Σ(2m_kp_k+1)=0, and Σ(m_kp_k²+p_k)=0. These are exactly cancellation of the X⁻¹, X⁻² and X⁻³ coefficients, so the Schwarzian is O(X⁻⁴) at infinity.

Source: CDT, proof of Lemma 5.1.8, equations (5.1.12)–(5.1.14), p.670. Prerequisites: **S0**, hempel’s accessory-parameter formula; **S0**, schwarzian chain rule.

**Accessory parameters for the symmetric punctures.** For the companion cover 1/F̃_N of ℙ¹∖({0}∪μ_N), in coordinate X its accessory parameters are m₀=0 and m_k=−(1/2+1/(2N))ζ_N^(−k), k=1,…,N. Rotational symmetry and the three infinity constraints determine them.

Source: CDT, proof of Lemma 5.1.8, equations (5.1.12)–(5.1.14), p.670. Prerequisites: **S0**, accessory-parameter constraints at infinity; **U0**, rotation equivariance of the covering.

**The rational Schwarzian for the roots cover.** For the local inverse ψ_N of F_N, S(ψ_N)(x)=((N²−1)x^(N−2)+x^(2N−2))/(2(x^N−1)²) near zero. Obtain this by changing the companion coordinate X=1/x; S(1/x)=0 and the squared derivative factor is essential.

Source: CDT, p.669; Lemma 5.1.8. Prerequisites: **S0**, accessory parameters for the symmetric punctures; **S0**, schwarzian chain rule.

**The linear equation of the inverse covering.** For N≥2 the local inverse ψ_N fixing zero is a quotient η₁/η₂ of independent solutions of 4(x^N−1)²y″+((N²−1)x^(N−2)+x^(2N−2))y=0. Choose the quotient normalization to agree with the actual inverse germ; an arbitrary basis gives it only up to a Möbius map.

Source: CDT, p.669; Lemma 5.1.8. Prerequisites: **S0**, the rational schwarzian for the roots cover; **S0**, the schwarzian differential equation; **O0**, analytic linear initial-value theorem.

## Layer L0: Finite Blaschke products and quotient representation

Develop boundary-compatible factors and the normalized logarithmic integral. Removing the interior zeros gives a zero-free function to which the Herglotz formula applies; smoothing then supplies a multiplier with two controlled boundary norms.

**Boundary-compatible Blaschke factors.** For |a|≤1 define b_a(z)=(z−a)/(1−āz) if |a|<1, and b_a(z)=−a if |a|=1. The boundary formula is the removable extension of the same rational expression; it has no zero. The interior factor is the existing Tau Ceti unitDiscMoebius after coercion; the new wrapper adds only the removable boundary extension in CDT’s convention.

Required API:

* `blaschkeFactor.interior`: For |a|<1, b_a(z)=(z−a)/(1−āz).
* `blaschkeFactor.boundary`: For |a|=1, b_a is the constant −a.
* `blaschkeFactor.normOnCircle`: For |a|≤1 and |z|=1, |b_a(z)|=1.
* `blaschkeFactor.discAutomorphism`: For a,z∈Complex.UnitDisc, b_(a:ℂ)(z:ℂ)=(TauCeti.unitDiscMoebius a z:ℂ). The wrapper only extends the already available interior factor to boundary parameters.

Examples and distinctions:

* b_0(z)=z.
* b_1(z)=−1, including at z=1 after removable extension.
* b_(−1)(z)=1.

Source: CDT, proof of Lemma 2.3.1, p.640 (the finite zero divisor). Prerequisites: Tau Ceti `TauCeti.unitDiscMoebius`; Tau Ceti `TauCeti.coe_unitDiscMoebius`.

**Finite Blaschke products.** For a finite family |a_i|≤1 and multiplicities n_i∈ℕ, set B(z)=∏_i b_(a_i)(z)^n_i, with the empty product equal to 1. It is holomorphic near the closed unit disc and has boundary modulus one. It maps the open disc into the closed disc; strict image in the open disc requires at least one positive multiplicity at an interior zero.

Required API:

* `finiteBlaschke.empty`: An empty family has B=1.
* `finiteBlaschke.mul`: Concatenating finite zero families multiplies their Blaschke products.
* `finiteBlaschke.normOnCircle`: On |z|=1, |B(z)|=1.
* `finiteBlaschke.strictDisc`: A product with a positive interior multiplicity has |B(z)|<1 for |z|<1; a boundary-only product has |B(z)|=1.

Examples and distinctions:

* The product over Fin 0 is 1.
* One zero a=0 of multiplicity two gives B(z)=z².
* One boundary zero a=1 of multiplicity one gives B=−1, not an open-disc-valued map.

Source: CDT, proof of Lemma 2.3.1, p.640 (the finite zero divisor). Prerequisites: **L0**, boundary-compatible blaschke factors.

**Removing zeros with a finite Blaschke product.** Let g be holomorphic near the closed unit disc and not identically zero. Form B from all its zeros in the closed disc with their orders. After removal of singularities, G=g/B is holomorphic and zero-free on the open disc and has |G|=|g| on the circle wherever the boundary quotients are interpreted by limits. Boundary zeros of g need not disappear from G, because boundary factors are constants.

Source: CDT, proof of Lemma 2.3.1, p.640 (the finite zero divisor). Prerequisites: **L0**, finite blaschke products; Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicOn.divisor_ball_support_finite`.

**Herglotz representation of a normalized logarithm.** For R>0 and g holomorphic and zero-free on a neighbourhood of the closed disc |z|≤R, with g(0)=1, choose the unique analytic log L with L(0)=0. For |z|<R, L(z)=∫_(|w|=R) log|g(w)|(w+z)/(w−z) dμ_Haar(w).

Source: CDT, proof of Lemma 2.3.1, p.640; equations (6.1.9)–(6.1.10), p.680. Prerequisites: Mathlib `DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`; [ConformalMapping — milestone l3 / the riemann mapping theorem summit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l3--the-riemann-mapping-theorem-summit).

**The derivative Herglotz formula.** Under the preceding normalized zero-free hypotheses, for |z|<R, g′(z)/g(z)=∫_(|w|=R) 2w log|g(w)|/(w−z)² dμ_Haar(w). The differentiated identity also holds without g(0)=1 after normalizing by g(0).

Source: CDT, p.680; Lemma 6.1.7. Prerequisites: **L0**, herglotz representation of a normalized logarithm; Mathlib `hasDerivAt_circleAverage_herglotzRieszKernel_smul`.

**The phase in the complex quotient identity.** For a zero-free holomorphic G near the closed disc of radius r>0, exp(∫ log|G(w)|(w+z)/(w−z)dμ)=G(z)|G(0)|/G(0) for |z|<r. Thus a complex quotient formula reconstructing G requires the constant phase G(0)/|G(0)|; a formula of absolute values does not.

Source: CDT, proof of Lemma 2.3.1, pp.640–641. Prerequisites: **L0**, herglotz representation of a normalized logarithm.

**Radial smoothing of the quotient multiplier.** If g is holomorphic near the closed unit disc, the radius-r Blaschke/Herglotz construction for r>1 sufficiently close to 1 gives a multiplier h holomorphic on a neighbourhood of the closed unit disc with h(0)=1. The resulting boundary bounds converge to m(1,g) as r decreases to 1, including boundary zeros by integrable logarithmic control.

Source: CDT, p.641; Lemma 2.3.1. Prerequisites: **L0**, removing zeros with a finite blaschke product; **L0**, the phase in the complex quotient identity; Mathlib `ValueDistribution.proximity`; Mathlib `MeromorphicOn.circleAverage_log_norm`.

**Nevanlinna’s quotient representation.** For ε>0 and g holomorphic near the closed unit disc, there is h holomorphic near that disc with h(0)=1 and max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}≤m(1,g)+ε. The zero function g is handled separately. Use logarithmic suprema, not suprema of |h|.

Source: CDT, p.641; Lemma 2.3.1. Prerequisites: **L0**, radial smoothing of the quotient multiplier; **L0**, the phase in the complex quotient identity; Mathlib `ValueDistribution.proximity`.

**Optimality of the quotient bound.** If g,h are holomorphic near the closed unit disc and h(0)=1, then m(1,g)≤max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}. This is the lower bound in Remark 2.3.3; use the a.e. logarithmic identity across isolated zeros.

Source: CDT, p.641; Remark 2.3.3. Prerequisites: Mathlib `MeromorphicOn.circleAverage_log_norm`; Mathlib `ValueDistribution.proximity`.

## Layer H0: Hypergeometric inverse germs and continuation

Connect the rational Schwarzian equation to the native Gauss series. Distinguish its series germ from its analytic continuation near the singular value one, and give uniform control of the continued coefficients.

**The Gauss hypergeometric equation.** For parameters a,b,c with none of a,b,c a nonpositive integer and |x|<1, the native ₂F₁(a,b;c;x) satisfies x(1−x)y″+(c−(a+b+1)x)y′−aby=0. The value and first Taylor coefficient at 0 are 1 and ab/c. Use analytic differentiation of the convergent native series, not its junk values outside radius one.

Source: CDT, proof of Lemma 5.1.16, p.672 (verification of the solutions in (5.1.18) using the Gauss equation). Prerequisites: Mathlib `ordinaryHypergeometric`; Mathlib `ordinaryHypergeometric_eq_tsum`; Mathlib `ordinaryHypergeometric_zero`; Mathlib `ordinaryHypergeometricSeries_radius_eq_one`.

**The descended inverse differential equation.** After x=u^N the two solutions η_i(u) of the roots inverse equation give φ_i(x)=η_i(x^(1/N)) on a compatible punctured branch, satisfying x(x−1)²φ″+(1−1/N)(x−1)²φ′+(1/4+(x−1)/(4N²))φ=0.

Source: CDT, Lemma 5.1.16, equation (5.1.17), p.671; its change-of-variable calculation, p.672. Prerequisites: **S0**, the linear equation of the inverse covering.

**The two hypergeometric solutions.** Let a_±=(N±1)/(2N). On compatible branches near a punctured zero, √(1−x)x^(1/N)₂F₁(a_+,a_+;2a_+;x) and √(1−x)₂F₁(a_−,a_−;2a_−;x) solve the transformed equation. Their leading terms x^(1/N) and 1 match the normalized η₁,η₂ after substituting x=u^N.

Source: CDT, proof of Lemma 5.1.16, equations (5.1.17)–(5.1.19), pp.671–672. Prerequisites: **H0**, the gauss hypergeometric equation; **H0**, the descended inverse differential equation; **O0**, analytic linear initial-value theorem.

**The normalized inverse-ratio germ.** For N≥2 set J_N(u)=u·₂F₁(a_+,a_+;2a_+;u^N)/₂F₁(a_−,a_−;2a_−;u^N) near u=0, where a_±=(N±1)/(2N). The denominator is 1 at zero. Thus J_N is holomorphic with J_N(0)=0 and J_N′(0)=1. Its expression is a genuine analytic germ and avoids an unjustified global principal-root identity.

Required API:

* `inverseRatio.formula`: J_N(u) is the displayed quotient of the native ordinaryHypergeometric functions.
* `inverseRatio.mapZero`: J_N(0)=0.
* `inverseRatio.derivativeZero`: For N≥2, J_N′(0)=1.
* `inverseRatio.equivariant`: J_N(ζu)=ζJ_N(u) for ζ^N=1 wherever the germ expression is defined.

Examples and distinctions:

* J_2(0)=0.
* J_2′(0)=1.
* The third complex derivative of J_2 at zero is 3/2, corresponding to the cubic coefficient 1/4; the identity germ would give zero.

Source: CDT, p.671; Lemma 5.1.16. Prerequisites: Mathlib `ordinaryHypergeometric`; Mathlib `ordinaryHypergeometric_zero`; Mathlib `ordinaryHypergeometricSeries_radius_eq_one`; **H0**, the two hypergeometric solutions.

**Matching the actual covering inverse.** For the oriented cover with F_N′(0)>0, ψ_N(u)=|F_N′(0)|⁻¹J_N(u) as germs at zero. The inverse of G_N is φ_N(x)=|F_N′(0)|^(−N)x(₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x))^N. For an unoriented cover replace the real prefactor by F_N′(0)⁻¹ and its Nth power.

Source: CDT, proof of Lemma 5.1.16, pp.671–672. Prerequisites: **H0**, the normalized inverse-ratio germ; **H0**, the two hypergeometric solutions; **U0**, derivative of the descended power map; **S0**, the linear equation of the inverse covering.

**Zero-balanced hypergeometric continuation.** For positive real a and 0<|x|<1 on a fixed compatible branch of log x, the analytic continuation of ₂F₁(a,a;2a;1−x) equals Γ(2a)/Γ(a)² times Σ_{k≥0}(a)_k² x^k/(k!)²·(−log x+2(ψ(k+1)−ψ(k+a))). This refers to the continued analytic function, not the native series junk value outside its disc. The proof needs only a∈[1/4,3/4]. A more general finite-valued parameter statement must also exclude poles of 2a.

Source: CDT, p.672; Lemma 5.1.20. Prerequisites: Mathlib `ordinaryHypergeometric`; Mathlib `ordinaryHypergeometric_eq_tsum`; Mathlib `Complex.digamma`.

The coefficient at k=0 is −log x−2γ−2ψ(a). Subsequent coefficients use ψ(k+1), without an index shift. Prove convergence on the chosen branch and identify the continued solution with the native series on their common domain.

**Uniform digamma coefficient control.** For a∈[1/4,3/4] and k≥1, 0≤ψ(k+1)−ψ(k+a)≤ψ(2)−ψ(5/4), and the difference decreases in both k and a. This uses the coefficient ψ(k+1)−ψ(k+a), not ψ(k)−ψ(k+a).

Source: CDT, p.676; Lemma 5.2.9. Prerequisites: Mathlib `Complex.digamma`; Mathlib `Complex.digamma_apply_add_nat`.

**Uniform zero-balanced remainder.** For a∈[1/4,3/4] and 0<|x|≤e^(−M₀N), N≥2, the k≥1 part of the zero-balanced series and its a-derivative have bounds uniform in a,N, with size O_{M₀}(|x|(1+|log x|)). The derivative control is required to gain the factor 1/N when comparing a_+ and a_−.

Source: CDT, p.676; Lemma 5.2.9. Prerequisites: **H0**, zero-balanced hypergeometric continuation; **H0**, uniform digamma coefficient control.

## Layer R0: Exact conformal radius and its expansion

The inverse germ and its real cusp limit determine the radius. Gamma identities give both a closed formula and an absolutely convergent odd-zeta expansion, with effective remainder bounds.

**The explicit Gamma radius.** For N≥2 define γ_N=16^(1/N)Γ(1+1/(2N))²Γ(1−1/N)/(Γ(1−1/(2N))²Γ(1+1/N)), using the native real Gamma function and positive real power. All Gamma arguments are positive. A totalized arithmetic expression outside N≥2 is not assigned a uniformization interpretation.

Required API:

* `gammaRadius.formula`: γ_N is the displayed Gamma expression.
* `gammaRadius.positive`: γ_N>0 for N≥2.
* `gammaRadius.alternative`: γ_N=Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)) for N≥2.
* `gammaRadius.tendsto`: γ_N→1 as N→∞.

Examples and distinctions:

* γ_2=Γ(1/4)^4/(4π²).
* γ_3=Γ(1/6)^3/(12π^(3/2)).
* The totalized expression at N=1 is zero through Γ(0)=0; it is not a positive hyperbolic radius.

Source: CDT, p.668; Theorem 5.1.4. Prerequisites: Mathlib `Real.Gamma`; Mathlib `Real.Gamma_pos_of_pos`.

**Positivity of the Gamma radius.** For every N≥2, γ_N>0 and every Gamma factor in its denominator is nonzero.

Source: CDT, p.668; Theorem 5.1.4. Prerequisites: **R0**, the explicit gamma radius; Mathlib `Real.Gamma_pos_of_pos`.

**The alternative Gamma expression.** For N≥2, γ_N=Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)).

Source: CDT, proof of Theorem 5.1.4, pp.672–673 (Gamma duplication and reflection). Prerequisites: **R0**, the explicit gamma radius; Mathlib `Real.Gamma_mul_Gamma_one_sub`; Mathlib `Real.Gamma_mul_Gamma_add_half`; Mathlib `Real.Gamma_pos_of_pos`.

**The boundary limit of the inverse ratio.** Along the compatible real branch x→1 from below, the ratio s_N(x)=x^(1/N)₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x) tends to Γ(1+1/N)Γ(a_−)²/(Γ(1−1/N)Γ(a_+)²). The inverse cover approaches a boundary point of modulus one.

Source: CDT, p.672; Proof of Theorem 5.1.4. Prerequisites: **H0**, zero-balanced hypergeometric continuation; **H0**, matching the actual covering inverse; **U0**, the normalized roots-of-unity covering; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

**The conformal radius of the punctured plane.** For N≥2 and every holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0, |F_N′(0)|=R(ℂ∖μ_N,0)=γ_N. In particular |F_2′(0)|=Γ(1/4)^4/(4π²) and |F_3′(0)|=Γ(1/6)^3/(12π^(3/2)).

Source: CDT, p.668; Theorem 5.1.4. Prerequisites: **R0**, the boundary limit of the inverse ratio; **R0**, the alternative gamma expression; **U0**, the pointed conformal radius; **U0**, pointed analytic cover uniqueness; Mathlib `Real.Gamma_mul_Gamma_one_sub`; Mathlib `Real.Gamma_mul_Gamma_add_half`.

**The local log-Gamma Taylor series.** For |z|<1, the analytic branch of log Γ(1+z) vanishing at z=0 is −γz+Σ_{k≥2}(−1)^kζ(k)z^k/k. For real −1<z<1 this is the ordinary log of the positive real Gamma function.

Source: CDT, p.673; proof of Theorem 5.1.4, reference [AS92, 6.1.33]. Prerequisites: Mathlib `Real.Gamma`; Mathlib `Complex.Gamma`; Mathlib `Complex.Gamma_ne_zero_of_re_pos`; Mathlib `Complex.Gamma_ofReal`; Mathlib `Real.BohrMollerup.tendsto_log_gamma`; Mathlib `Complex.digamma`.

**The odd-zeta radius series.** For every integer N≥2, log γ_N=(log 16)/N+Σ_{k≥1}(2^(2k)−1)ζ(2k+1)/(2^(2k−1)(2k+1)N^(2k+1)), with an absolutely convergent series of positive terms.

Source: CDT, proof of Theorem 5.1.4, p.673 (the log-Gamma expansion). Prerequisites: **R0**, the local log-gamma taylor series; **R0**, the explicit gamma radius; **R0**, positivity of the gamma radius.

**The positive radius expansion.** For N≥2 write γ_N=16^(1/N)(1+ζ(3)/(2N³)+3ζ(5)/(8N⁵)+E_N). Then E_N>0 and there is an absolute effectively computable C with E_N≤C/N⁶. Consequently this is the positive O(N⁻⁶) remainder of CDT (5.1.6).

Source: CDT, p.668; Theorem 5.1.4. Prerequisites: **R0**, the odd-zeta radius series.

## Layer F0: The symmetric covering groups and their domains

Apply the projective-action and polygon theory of FuchsianOrbifolds to the specific roots cover. Build its primitive cusp datum, free deck presentation, power stabilizer and index-two triangle extension.

**The symmetric ideal polygon.** For N≥2 the deck group Γ_N of F_N has the ideal 2N-gon centred at zero with vertices exp(πik/N), k=0,…,2N−1, as a Dirichlet fundamental domain. Its sides join adjacent vertices by hyperbolic geodesics; the prescribed side pairings recover the roots-of-unity quotient.

Source: CDT, p.674; Proposition 5.2.1. Prerequisites: **U0**, the normalized roots-of-unity covering; **U0**, rotation equivariance of the covering; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action); [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups); [ConformalMapping — milestone l3 / the riemann mapping theorem summit](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l3--the-riemann-mapping-theorem-summit); [ConformalMapping — milestone l4 / analytic continuation / the reflection principle](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l4--analytic-continuation--the-reflection-principle).

**The primitive cusp translation.** The full stabilizer of i∞ in Γ̃_N is generated by τ↦τ+h_N where h_N=2cot(π/(2N))>0. This is the primitive positive generator in the chosen normalized cusp datum.

Source: CDT, p.674; Proposition 5.2.1. Prerequisites: **F0**, the symmetric ideal polygon; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

**The free deck-group presentation.** Γ̃_N is free of rank N on t̃_N and r̃_N^k t̃_N r̃_N^(−k), k=1,…,N−1, where t̃_N is the primitive cusp translation. The projective rotation r̃_N has order N but is not a nontrivial element of the torsion-free deck group.

Source: CDT, p.674; Proposition 5.2.1. Prerequisites: **F0**, the symmetric ideal polygon; **F0**, the primitive cusp translation; **U0**, rotation equivariance of the covering; [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

**The power-map stabilizer group.** Let Φ̃_N=⟨Γ̃_N,r̃_N⟩≤PSL₂(ℝ); by the deck presentation it equals ⟨r̃_N,t̃_N⟩. Its disc conjugate is Φ_N. The definition uses the existing projective action and subgroup closure; it is the paper-specific orientation-preserving (N,∞,∞) group, not a newly defined generic triangle-group theory.

Required API:

* `PowerStabilizer.containsDeck`: Γ̃_N≤Φ̃_N.
* `PowerStabilizer.generators`: Φ̃_N=⟨r̃_N,t̃_N⟩.
* `PowerStabilizer.discConjugate`: Conjugation through C identifies the half-plane and disc actions.
* `PowerStabilizer.deckIndex`: [Φ̃_N:Γ̃_N]=N.

Examples and distinctions:

* For N=2 the quotient Φ̃_2/Γ̃_2 has order two.
* The image of r̃_N in the quotient has exact order N.
* For N≥2, r̃_N fixes i and is not a nontrivial deck transformation of the unramified cover.

Source: CDT, p.674; Definition 5.2.3. Prerequisites: **F0**, the free deck-group presentation; **U0**, rotation equivariance of the covering; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

**The largest invariance group of the power cover.** F̃_N^N is invariant under Φ̃_N, and any g∈PSL₂(ℝ) satisfying F̃_N(gτ)^N=F̃_N(τ)^N for all τ∈ℍ lies in Φ̃_N. Hence Φ̃_N is exactly its full orientation-preserving invariance group and is discrete.

Source: CDT, p.675; Corollary 5.2.4. Prerequisites: **F0**, the power-map stabilizer group; **U0**, the descended power map; **U0**, nonvanishing derivative of the cover; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action).

**The fundamental quadrilateral.** The fundamental domain of Φ_N is the hyperbolic quadrilateral with vertices 0,exp(−πi/N),1,exp(πi/N), in that cyclic order. Its half-plane image has vertices i,−cot(π/(2N)),i∞,cot(π/(2N)), up to boundary orientation, and area 2π−2π/N.

Source: CDT, p.675; Corollary 5.2.4. Prerequisites: **F0**, the power-map stabilizer group; **F0**, the symmetric ideal polygon; **U0**, the disc–half-plane coordinate; [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

**The half-rotation involution.** Let s̃ be the rotation about i of projective order 2N satisfying s̃²=r̃_N, and let s be its disc conjugate. Then 1−F̃_N(s̃τ)^N=1/(1−F̃_N(τ)^N) for τ∈ℍ. All denominators are nonzero because the covering omits μ_N.

Source: CDT, p.675; Lemma 5.2.6. Prerequisites: **F0**, the fundamental quadrilateral; **U0**, the descended power map; **U0**, rotation equivariance of the covering; [ConformalMapping — milestone l4 / analytic continuation / the reflection principle](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ConformalMapping/README.md#milestone-l4--analytic-continuation--the-reflection-principle); [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

**The index-two triangle supergroup.** Set Ψ̃_N=⟨s̃,t̃_N⟩. Then Φ̃_N is normal of index two in Ψ̃_N, and a fundamental domain for the disc action is the geometric triangle with vertices 0,1,exp(πi/N) and angles π/N,0,0. Distinguish this geometric triangle from Φ̃_N’s (N,∞,∞) orbifold signature; the full reflection group is not a subgroup of PSL₂(ℝ).

Required API:

* `TriangleSupergroup.generators`: Ψ̃_N is generated by s̃ and t̃_N.
* `TriangleSupergroup.index`: [Ψ̃_N:Φ̃_N]=2.
* `TriangleSupergroup.triangle`: The specified triangle is a measurable fundamental domain.
* `TriangleSupergroup.orientation`: This is the orientation-preserving projective action; reflection constructions are consumed through the existing triangle theory.

Examples and distinctions:

* For N=2 the Φ area is π and the Ψ area is π/2.
* The nontrivial coset is represented by s̃, whose square lies in Φ̃_N.
* An antiholomorphic reflection is not an element of PSL₂(ℝ).

Source: CDT, p.675; Remark 5.2.8. Prerequisites: **F0**, the half-rotation involution; **F0**, the power-map stabilizer group; [FuchsianOrbifolds — layer 2 hyperbolic polygons and cofinite groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-2-hyperbolic-polygons-and-cofinite-groups).

## Layer V0: Value distribution on the open disc

Localize the native divisor and characteristic machinery to compact subdiscs. Keep the centre term and punctured-germ conventions explicit, so Jensen and the first main theorem apply without an extension to the whole plane.

**The disc-local pole-counting function.** For f meromorphic on 𝔻 and 0<r<1 set D_r=−min(divisor(f,closedBall(0,r)),0), the negative part of the native integer local divisor. Define N_D(r,f)=Σᶠ_a D_r(a)log(r·|a|⁻¹)+D_r(0)log r. Native totalized log makes the summand at a=0 zero; the separate centre term restores its pole weight. Poles on |a|=r have weight zero. No extension of the disc divisor to a globally locally finite divisor is required.

Required API:

* `discCounting.poleSum`: For f meromorphic on 𝔻 and 0<r<1, N_D=Σ_(0<|a|<r)ord⁻_a(f)log(r/|a|)+ord⁻_0(f)log r.
* `discCounting.globalComparison`: If f is meromorphic on all ℂ, N_D(r,f)=ValueDistribution.logCounting f ∞ r for 0<r<1.
* `discCounting.restriction`: For two meromorphic functions equal near the closed disc of radius r, their N_D values agree.
* `discCounting.power`: For f meromorphic on 𝔻 and n∈ℕ, N_D(r,f^n)=nN_D(r,f).

Examples and distinctions:

* For 0<r<1, N_D(r,z↦1/z)=log r<0.
* For the constant one function N_D=0.
* For a≠0 and r=|a|<1, N_D(r,z↦1/(z−a))=0 although f has a pole on the boundary circle.

Source: CDT, p.679; 6.1.1. Prerequisites: Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicOn.divisor_ball_support_finite`; Mathlib `MeromorphicOn.divisor_restrict`; Mathlib `ValueDistribution.logCounting`.

**The disc-local characteristic.** For f meromorphic on 𝔻 and 0<r<1 define T_D(r,f)=ValueDistribution.proximity f ∞ r+N_D(r,f). Reuse the native proximity function exactly. The local divisor wrapper is the only change from the native global characteristic; do not assert nonnegativity for a general centre pole or manufacture a global meromorphic extension.

Required API:

* `discCharacteristic.eq`: T_D(r,f)=m(r,f)+N_D(r,f), where m is the native ValueDistribution.proximity.
* `discCharacteristic.globalComparison`: For a globally meromorphic f and 0<r<1, T_D(r,f)=ValueDistribution.characteristic f ∞ r.
* `discCharacteristic.holomorphic`: For holomorphic f on 𝔻, T_D(r,f)=m(r,f).
* `discCharacteristic.power`: For n∈ℕ and f meromorphic on 𝔻, T_D(r,f^n)=nT_D(r,f).

Examples and distinctions:

* For a nonzero constant c, T_D(r,c)=log⁺|c|.
* For 0<r<1, T_D(r,z↦z)=0.
* For 0<r<1, T_D(r,z↦1/z)=0: m=−log r cancels N_D=log r.

Source: CDT, p.679; 6.1.1. Prerequisites: **V0**, the disc-local pole-counting function; Mathlib `ValueDistribution.proximity`; Mathlib `ValueDistribution.characteristic`.

**Pole-counting positivity at a regular centre.** For f meromorphic on 𝔻 whose meromorphic germ at 0 has no pole (meromorphicOrderAt f 0≥0, including infinite order), N_D(r,f)≥0 whenever 0<r<1. A totalized scalar value at 0 is not a regularity hypothesis.

Source: CDT, p.679; Lemma 6.1.2. Prerequisites: **V0**, the disc-local pole-counting function.

**Vanishing of the local pole count.** For f meromorphic on 𝔻 with no pole in its meromorphic germ at 0, N_D(r,f)=0 iff every germ at |z|<r has nonnegative meromorphic order, equivalently admits a holomorphic removable extension. For a scalar representative also continuous on this open disc, this is equivalent to pointwise holomorphicity of f there. Without that continuity guard, arbitrary isolated point values need not agree with the extensions. A pole on |z|=r has zero weight and is permitted; no closed-disc conclusion is inferred.

Source: CDT, p.679; Lemma 6.1.2. Prerequisites: **V0**, pole-counting positivity at a regular centre; Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicAt`; Mathlib `MeromorphicAt.meromorphicOrderAt_nonneg_iff`; Mathlib `MeromorphicAt.analyticAt`.

For example, the representative equal to 2 at zero and 1 elsewhere has zero divisor and zero local pole count but is discontinuous at zero. This distinguishes removable punctured germs from pointwise analytic scalar functions.

**Local logarithmic circle integrability.** For f meromorphic on a neighbourhood of the closed radius-r disc with a nonzero meromorphic germ, log|f| and log⁺|f| are circle-integrable. Isolated zeros and poles on the circle are interpreted almost everywhere; changes at their finite point set do not alter circle averages.

Source: CDT, pp.679–680; §6.1.1 and the Poisson–Jensen discussion preceding (6.1.4). Prerequisites: Mathlib `MeromorphicOn.divisor`; Mathlib `MeromorphicOn.divisor_ball_support_finite`; Mathlib `MeromorphicOn.circleAverage_log_norm`; Mathlib `ValueDistribution.proximity`.

**The disc-local Jensen identity.** For f meromorphic on 𝔻, with nonzero meromorphic germ at 0, and 0<r<1, ∫ log|f|dμ=N_D(r,1/f)−N_D(r,f)+log|c(f,0)|, where c(f,0) is the native nonzero meromorphic trailing coefficient at 0.

Source: CDT, p.680; proof of the first main theorem, Poisson–Jensen discussion and (6.1.4). Prerequisites: **V0**, the disc-local pole-counting function; **V0**, local logarithmic circle integrability; Mathlib `MeromorphicOn.circleAverage_log_norm`; Mathlib `MeromorphicOn.divisor_fun_inv`.

**The local first main inversion identity.** For f meromorphic on 𝔻 with nonzero germ at 0 and 0<r<1, T_D(r,f)−T_D(r,1/f)=log|c(f,0)|. Neither global meromorphicity nor a regular centre is required; the trailing coefficient must be finite and nonzero.

Source: CDT, p.680; equation (6.1.4). Prerequisites: **V0**, the disc-local characteristic; **V0**, the disc-local jensen identity; **V0**, local logarithmic circle integrability; Mathlib `ValueDistribution.proximity`; Mathlib `ValueDistribution.characteristic_sub_characteristic_inv_of_ne_zero`.

**Translation bound for proximity.** For a∈ℂ and circle-integrable local meromorphic f, |m(r,f−a)−m(r,f)|≤log⁺|a|+log 2. This follows from the pointwise positive-log triangle bound, including zeros via totalized log⁺.

Source: CDT, equation (6.1.5), p.680. Prerequisites: Mathlib `ValueDistribution.proximity`; **V0**, local logarithmic circle integrability.

**The translated local first main theorem.** For f meromorphic on 𝔻 with f−a having a nonzero germ at 0, and 0<r<1, |T_D(r,f)−T_D(r,1/(f−a))−log|c(f,a)||≤log⁺|a|+log 2. The coefficient is the nonzero leading meromorphic coefficient of f−a; the identically constant f=a case is excluded.

Source: CDT, p.679; equation (6.1.3), with proof on p.680. Prerequisites: **V0**, the local first main inversion identity; **V0**, translation bound for proximity; **V0**, the disc-local pole-counting function.

**The local characteristic power law.** For f meromorphic on 𝔻, n∈ℕ and 0<r<1, T_D(r,f^n)=nT_D(r,f). For n=0 both sides are zero. Pole and zero multiplicities and positive log norms scale by n.

Source: CDT, p.682; last equality of equation (6.2.3), together with §6.1.1 on p.679. Prerequisites: **V0**, the disc-local characteristic; Mathlib `MeromorphicOn.divisor_fun_pow`; Mathlib `ValueDistribution.proximity`.

**Radial monotonicity of holomorphic proximity.** For holomorphic h on 𝔻 and 0<r≤ρ<1, m(r,h)≤m(ρ,h). The positive log norm is subharmonic; this supplies the small-radius transfer used to remove 1/r from the logarithmic derivative estimate.

Source: CDT, p.683; Corollary 6.2.9. Prerequisites: Mathlib `ValueDistribution.proximity`; Mathlib `DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`; **L0**, herglotz representation of a normalized logarithm.

## Layer G0: Quantitative cusp geometry and maximum growth

Use the uniform inverse asymptotic to place small cusp values in horoballs. The projective group and its primitive translation control every transported horoball; the half rotation turns this into a bound on large values.

**Uniform cusp asymptotics of the inverse ratio.** For M₀>0 there is C(M₀) such that for all N≥2, M≥M₀ and 0<|x|<e^(−MN), on a compatible logarithmic branch, |s_N(1−x)/γ_N−(1−x)^(1/N)(−log x−2γ−2ψ(a_+))/(−log x−2γ−2ψ(a_−))|≤C(M₀)|x|/N. Here γ is Euler’s constant and a_±=(N±1)/(2N).

Source: CDT, p.676; Lemma 5.2.9. Prerequisites: **H0**, zero-balanced hypergeometric continuation; **H0**, uniform zero-balanced remainder; **R0**, the alternative gamma expression; Mathlib `Complex.digamma_one`.

**Height near a small cusp value.** For M₀>0 and 0<ε<1, there is an effective N₀(ε,M₀) such that, for N≥N₀, M≥M₀ and τ in the fundamental quadrilateral Ω̃′_N, |F̃_N(τ)^N−1|<e^(−MN) implies Im τ>2N²M(1−ε)/π².

Source: CDT, p.676; Lemma 5.2.12. Prerequisites: **G0**, uniform cusp asymptotics of the inverse ratio; **F0**, the fundamental quadrilateral; **U0**, the disc–half-plane coordinate; Mathlib `Complex.digamma_one_sub`.

**Disc diameter of a transformed horoball.** For D>0 and a projective real determinant-one matrix g=[a b;c d], C⁻¹(g{Im τ≥D}) is a disc tangent to the unit circle at (a−ic)/(a+ic), with Euclidean diameter E(g,D)=2/(1+D(a²+c²)). In particular E≤2/(D(a²+c²)).

Source: CDT, p.677; Lemma 5.2.16. Prerequisites: **U0**, the disc–half-plane coordinate; [FuchsianOrbifolds — layer 0 the effective projective möbius action](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-0-the-effective-projective-möbius-action); [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

**Shimizu for the power-map group.** For N≥2 and every determinant-one representative [a b;c d] of an element of the discrete group Φ̃_N, h_N(|a|+|c|)≥1, where h_N=2cot(π/(2N)). The generic supplier input is: in a discrete PSL₂(ℝ) group containing translation by h>0, every c≠0 satisfies |c|≥1/h.

Source: CDT, proof of Lemma 5.2.18, p.678 (Shimizu applied to the full power stabilizer). Prerequisites: **F0**, the largest invariance group of the power cover; **F0**, the primitive cusp translation; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

Use the native Shimizu theorem in `TauCeti.Analysis.Complex.Fuchsian.Shimizu`. For a lift with c≠0 it gives h_N|c|≥1. Handle c=0 from the full primitive cusp stabilizer, and use the rotation generator when the a entry is needed. The result is invariant under changing the sign of the lift.

**The paper-specific exceptional cusp set.** For N,M define S(M,N)={z∈𝔻:|F_N(z)^N−1|<e^(−MN)}. For sufficiently large N it is contained in the union of the Φ_N-translates of the cusp horoball with D comparable to N²M. Large values |F_N(z)|>e^M+1 lie in the rotated set sS(M,N), by the half-rotation involution.

Required API:

* `ExceptionalCuspSet.mem`: For z∈𝔻, z∈S(M,N) iff |F_N(z)^N−1|<e^(−MN).
* `ExceptionalCuspSet.horoballContainment`: For the source large-N threshold, S is contained in the specified Φ-translated cusp horoballs.
* `ExceptionalCuspSet.rotatedLargeValues`: |F_N(z)|>e^M+1 implies z∈sS(M,N).
* `ExceptionalCuspSet.radiusInvariant`: The source rotation s preserves |z|, so exclusion of S from |z|≤r also excludes sS.

Examples and distinctions:

* For M>0, 0∉S(M,N), since |F_N(0)^N−1|=1>e^(−MN).
* For any z, |sz|=|z|.
* If |F_N(z)|^N>1+e^(MN), then |1−F_N(s⁻¹z)^N|<e^(−MN).

Source: CDT, p.678; Lemma 5.2.18. Prerequisites: **G0**, height near a small cusp value; **G0**, disc diameter of a transformed horoball; **G0**, shimizu for the power-map group; **F0**, the half-rotation involution; [FuchsianOrbifolds — layer 3 cusps and q coordinates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md#layer-3-cusps-and-q-coordinates).

**Excluding the cusp horoballs.** There are effective absolute A,N₀ such that for all N≥N₀, 0<r<1 and M=N/(1−r), neither S(M,N) nor sS(M,N) meets the closed radius-r disc. All the translated horoballs have diameter ≤A(1−r)/N<1−r after increasing N₀.

Source: CDT, p.678; Lemma 5.2.18. Prerequisites: **G0**, the paper-specific exceptional cusp set; **G0**, disc diameter of a transformed horoball; **G0**, shimizu for the power-map group.

The transported horoball has diameter at most 4h_N²/D after the matrix-entry estimate. With D of order N²M this is at most A/M. Substituting M=N/(1−r) gives A(1−r)/N, so the strict exclusion follows once N>A.

**The large-N maximum growth bound.** There exist effectively computable absolute C,N₀ such that for all integers N≥N₀ and 0<r<1, sup_(|z|=r)log|F_N(z)|≤CN/(1−r). This is the large-N statement of Lemma 5.2.18; the proof does not establish it for every N≥2.

Source: CDT, p.678; Lemma 5.2.18. Prerequisites: **G0**, excluding the cusp horoballs.

## Layer M0: Logarithmic derivatives and uniform mean growth

Circle-kernel estimates control logarithmic derivatives. A pivot rational map compares the characteristic multiplied by N with the characteristic itself. Absorb their difference, then combine the large-level argument with effective estimates for each of the finitely many small levels.

**The inverse-square kernel mean.** For 0<r<R and |w|=R, the normalized circle mean ∫_(|z|=r)|z−w|^(−2)dμ(z)=1/(R²−r²). This is the exact kernel integral used in the logarithmic-derivative proof.

Source: CDT, equation (6.1.12), p.680, used in the proof on p.681. Prerequisites: Mathlib `DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`.

**Boundary L1 control of the logarithm.** For g holomorphic and zero-free near the closed radius-R disc with g(0)=1, ∫_(|w|=R)|log|g(w)||dμ(w)=2m(R,g). The mean of log|g| is zero, so its positive and negative parts have equal means.

Source: CDT, proof of Lemma 6.1.7, p.681, following equation (6.1.12). Prerequisites: **L0**, herglotz representation of a normalized logarithm; Mathlib `ValueDistribution.proximity`.

**The logarithmic mean estimate.** For nonnegative circle-integrable H and normalized Haar measure, ∫log⁺H≤log⁺(∫H)+1/e. Equivalently control the entropy of the region H≥1 before applying Jensen there; retain a harmless absolute constant if the measure-zero region occurs.

Source: CDT, proof of Lemma 6.1.7, p.681 (entropy estimate). Prerequisites: Mathlib circle integration, Jensen inequality and real logarithms.

**The zero-free logarithmic derivative estimate.** For g holomorphic and zero-free near the closed radius-R disc, g(0)=1 and 0<r<R, m(r,g′/g)≤log⁺((m(R,g)/r)·R/(R−r))+log 2+1/e. Use ≤ in the reusable signature; the source states the corresponding strict bound.

Source: CDT, p.680; Lemma 6.1.7. Prerequisites: **L0**, the derivative herglotz formula; **M0**, the inverse-square kernel mean; **M0**, boundary l1 control of the logarithm; **M0**, the logarithmic mean estimate; Mathlib `ValueDistribution.proximity`.

**Uniform transfer from small radii.** For 0<r<1 put ρ=max(r,1/4) and R=(1+r)/2. Then ρ≥1/4, ρ<R and R−ρ≥(1−r)/4. If h is holomorphic on 𝔻, m(r,h)≤m(ρ,h), allowing the log-derivative bound at ρ to remove its 1/r factor uniformly.

Source: CDT, p.683; proof of Corollary 6.2.9. Prerequisites: **V0**, radial monotonicity of holomorphic proximity.

**The logarithmic derivative of the omitted-value function.** Let f=1−F_N^N, N≥2, and 0<r<1. Set R=(1+r)/2 and L_N(r)=log(max(1,sup_(|z|=R)log⁺|F_N(z)|)). Then m(r,f′/f)≤C(log(N/(1−r))+L_N(r)) for an absolute effective C. f is zero-free and f(0)=1.

Source: CDT, p.683; Corollary 6.2.9. Prerequisites: **M0**, the zero-free logarithmic derivative estimate; **M0**, uniform transfer from small radii; **U0**, the normalized roots-of-unity covering; Mathlib `ValueDistribution.proximity`.

**The pivot rational function.** For N≥2 set p_N(x)=x^N/(x^N−1) on ℂ∖μ_N. Its companion maps are q_N(x)=x^N and u_N(x)=1/(x^N−1), with p_N=1+u_N. The native rational expression can be totalized at roots, but all analytic statements retain the omitted-root guard.

Required API:

* `pivotMap.formula`: p_N(x)=x^N/(x^N−1) when x^N≠1.
* `pivotMap.companion`: p_N=1+u_N on the omitted-root domain.
* `pivotMap.poleSet`: For N≥2 its N poles are the distinct Nth roots of unity.
* `pivotMap.coverComposition`: p_N∘F_N is holomorphic on 𝔻 because F_N omits every pole.

Examples and distinctions:

* p_N(0)=0 for N≥2.
* p_2(2)=4/3.
* x=1 is a genuine pole of the analytic rational map; a totalized field value there is not its analytic extension.

Source: CDT, p.682; (6.2.4). Prerequisites: Mathlib field division, complex powers and meromorphic order.

**The pivot partial-fraction identity.** For N≥2 and x^N≠1, p_N(x)=(x/N)Σ_(ζ∈μ_N)1/(x−ζ). The roots are distinct over ℂ and the sum is finite.

Source: CDT, p.682; (6.2.4). Prerequisites: **M0**, the pivot rational function.

**The pivot chain identity.** For f=1−F_N^N and |z|<1, p_N(F_N(z))=(F_N(z)/(NF_N′(z)))·(f′(z)/f(z)). The denominators f,F_N′ and N are nonzero; both sides are zero at z=0.

Source: CDT, p.682; equation (6.2.7). Prerequisites: **M0**, the pivot rational function; **U0**, nonvanishing derivative of the cover; **U0**, the normalized roots-of-unity covering.

**The pivot characteristic lower bound.** For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≥N T_D(r,F_N)−log 4.

Source: CDT, p.682; equation (6.2.3). Prerequisites: **M0**, the pivot rational function; **V0**, the local characteristic power law; **V0**, the translated local first main theorem; **V0**, translation bound for proximity.

**Effective mean growth at fixed omitted sets.** For each fixed N≥2 there is an effectively computable C_N such that T_D(r,F_N^N)≤C_N log(N/(1−r)) for all 0<r<1. This is the fixed-puncture Tsuji/Kraus–Roth input; prove it with an effective constant throughout the small-radius range as well as near the boundary.

Source: CDT, p.678; preceding Lemma 5.2.18, reference [Tsu52, Theorem 11]. Prerequisites: **U0**, the normalized roots-of-unity covering; **V0**, the disc-local characteristic.

Construct C_N from fixed-puncture geometry or the Tsuji/Kraus–Roth argument, retaining a bound on 0<r≤1/4. An asymptotic assertion as r→1 alone does not discharge this target. The proof must produce the number used by finite-level completion.

**Equivalence of the three mean estimates.** For N≥2 and each 0<r<1, the characteristics of F_N^N, F_N^N/(F_N^N−1), and 1/(F_N^N−1) differ by an absolute additive constant at most log 4. The translated first main theorem uses c(F_N^N,1)=−1, of modulus one.

Source: CDT, p.682; Theorem 6.0.1. Prerequisites: **M0**, the pivot characteristic lower bound; **V0**, the translated local first main theorem; **V0**, translation bound for proximity; **U0**, the normalized roots-of-unity covering.

**The logarithmic derivative at the omitted value one.** For N≥2, g=1−F_N is holomorphic and zero-free on 𝔻 with g(0)=1. For 0<r<1, m(r,F_N′/(1−F_N))≤C(log(N/(1−r))+L_N(r)), using R=(1+r)/2 in L_N.

Source: CDT, p.683; Corollary 6.2.11. Prerequisites: **M0**, the zero-free logarithmic derivative estimate; **M0**, uniform transfer from small radii; **U0**, the normalized roots-of-unity covering; Mathlib `ValueDistribution.proximity`.

**The pole divisor of the covering logarithmic derivative.** For N≥2 and 0<r<1, N_D(r,F_N′/F_N)=N_D(r,1/F_N). All zeros of F_N are simple because F_N′ is nonzero; their poles in the logarithmic derivative have order one. The reciprocal F_N/F_N′ is holomorphic and has zero pole count.

Source: CDT, p.683; (6.2.13). Prerequisites: **U0**, nonvanishing derivative of the cover; **V0**, the disc-local pole-counting function; Mathlib `MeromorphicOn.divisor`.

**The covering derivative reciprocal bound.** For N≥2 and 0<r<1, m(r,F_N/F_N′)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)), where the outer radius in L_N is (1+r)/2. The ratio is holomorphic since F_N′ never vanishes.

Source: CDT, p.683; Corollary 6.2.11. Prerequisites: **M0**, the logarithmic derivative at the omitted value one; **M0**, the pole divisor of the covering logarithmic derivative; **U0**, nonvanishing derivative of the cover; **V0**, the local first main inversion identity; **R0**, the odd-zeta radius series; Mathlib `ValueDistribution.proximity`.

**The pivot characteristic upper bound.** For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)). All three composed factors are holomorphic, so their characteristics are proximity means.

Source: CDT, p.684; equation (6.2.15). Prerequisites: **M0**, the pivot chain identity; **M0**, the logarithmic derivative of the omitted-value function; **M0**, the covering derivative reciprocal bound; **V0**, the disc-local characteristic; Mathlib `ValueDistribution.proximity`.

**The large-N mean-growth estimate.** For N≥N₀ of the maximum-growth theorem and 0<r<1, T_D(r,F_N^N)≤C log(N/(1−r)), with an effective absolute C. The large-N maximum bound on the outer circle gives L_N(r)≤C′log(N/(1−r)).

Source: CDT, p.684; equations (6.2.16) and the following N/(N−1) absorption. Prerequisites: **M0**, the pivot characteristic lower bound; **M0**, the pivot characteristic upper bound; **G0**, the large-n maximum growth bound; **V0**, the local characteristic power law.

**Completing the finitely many small levels.** Given the large-N effective constants C,N₀ and effective fixed-level constants C_N for 2≤N<N₀, the maximum of C and that finite list is an effective absolute constant proving T_D(r,F_N^N)≤C*log(N/(1−r)) for every N≥2 and 0<r<1.

Source: CDT, p.679; Theorem 6.0.1. Prerequisites: **M0**, the large-n mean-growth estimate; **M0**, effective mean growth at fixed omitted sets.

**Uniform mean growth of the covering powers.** There is an effectively computable absolute C such that for every integer N≥2, 0<r<1 and p∈{x↦x^N,x↦x^N/(x^N−1),x↦1/(x^N−1)}, the normalized circle mean ∫_(|z|=r)log⁺|p(F_N(z))|dμ_Haar(z)≤C log(N/(1−r)). The cover is normalized at zero; the bound is independent of its source rotation.

Source: CDT, p.679; Theorem 6.0.1. Prerequisites: **M0**, completing the finitely many small levels; **M0**, equivalence of the three mean estimates; **U0**, pointed analytic cover uniqueness; Mathlib `ValueDistribution.proximity`.

## Implementation order

Build the analytic equation, jet and meromorphic-basis interfaces first, then analytic charts and uniformization on the existing cover. Prove the Schwarzian chain rule before globalizing accessory parameters. The quotient-representation layer can proceed from the imported logarithm and Poisson theory independently of the special covering calculations.

The hypergeometric and radius layers use the normalized inverse germ; the polygon layer uses the same cover and projective deck realization. Disc-local value distribution can proceed independently from native divisors and Jensen. Quantitative cusp geometry then joins the radius, continuation and group calculations. Finally, the logarithmic derivative estimate and pivot comparison give the large-level mean bound; fixed-level estimates and their finite maximum complete the uniform theorem.

`Suggested.lean` gives proposed names and native signatures, admitted where proofs or constructions are the work of the roadmap. The statements above specify the mathematics. Geometric interfaces described there must use the cited projective, polygon and cusp APIs.
