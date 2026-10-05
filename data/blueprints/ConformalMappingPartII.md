# Conformal mapping and the geometric theory of holomorphic functions, Part II
The covering of the plane with the Nth roots of unity removed is a multiply connected analytic object. A normalized universal cover turns its geometry into a numerical radius, a Schwarzian differential equation and a set of cusp estimates. Disc-local value distribution then converts a maximum bound into the uniform mean estimate that Calegari, Dimitrov and Tang use in their unbounded-denominators proof.

This roadmap develops the full routed chain through CDT Theorems 5.1.4 and 6.0.1, including the linear ODE and quotient-representation inputs consumed by arithmetic algebraization. It begins with the pinned topological covering, planar conformal and special-function APIs. The topological universal-cover carrier, disc automorphism theory, generic projective action, polygon theorem and cusp charts are supplied by their existing roadmaps. The additions here are the complex analytic covering extension, the explicit roots-of-unity calculations and the localized disc theory.

## Conventions and final statements

Write 𝔻={z∈ℂ:|z|<1}. A plane domain is connected and open. A pointed hyperbolic plane domain has at least two omitted complex points. For a disconnected open set, the pointed construction uses its connected component. Coverings are holomorphic and unramified; inverse maps in the differential-equation argument are analytic germs, rather than global inverses. The explicit formulas use the cover with positive real derivative at zero. Norm estimates depend only on the base point, and are invariant under source rotation.

The half-plane coordinate is C(z)=i(1+z)/(1−z). A boundary value at z=1 means a cusp limit in the compactification. It is not evaluation at a point of 𝔻. Generic projective groups act through the supplier's public PSL₂(ℝ) action. Distinguish the free rank-N deck group, its power-map stabilizer Φ_N and the index-two group Ψ_N. A geometric fundamental triangle, an orientation-preserving group and its full reflection group are distinct objects.

For N≥2 the first final statement is |F_N′(0)|=γ_N, with γ_N the explicit positive real Gamma expression specified in R0. Its expansion has a positive, effectively bounded N⁻⁶ remainder after the stated cubic and quintic zeta terms. For every N≥2 and 0<r<1, the second final statement bounds the normalized circle mean of log⁺|p∘F_N| by an effective absolute constant times log(N/(1−r)), for each of the three rational maps in Theorem 6.0.1.

All circle means use normalized Haar measure. The proximity function is Mathlib's ValueDistribution.proximity at infinity. The local counting function uses the integer divisor on the compact radius-r disc. Its centre correction is essential: a pole at zero contributes its order times log r, which is negative for r<1. Positivity of the pole count therefore requires regularity at zero. A boundary pole contributes weight zero and does not obstruct holomorphicity on the open radius-r disc.

For branch formulas use positive real hypergeometric parameters a_±=(N±1)/(2N), compatible logarithms and local roots. The native hypergeometric series has a totalized value outside its radius; analytic continuation is a separate theorem. A basis of meromorphic local ODE solutions is stronger than identity topological monodromy. The polynomial pole-clearing theorem uses that stronger source convention.

## Layer organization and library boundaries

The declaration identifiers below are stable references for the dependency graph. Every definition and construction includes uses, an API and at least three discriminating tests. Named API items consumed elsewhere are promoted to explicit lemma nodes. Each layer's acceptance conditions are part of its specification.
### O0 — Complex linear differential equations

Inputs: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle.

#### Analytic complex linear differential equations

Declaration: `ConformalMappingPartII:O0/linear-equation` (definition).

For a connected open Ω⊆ℂ and n≥1, an analytic monic linear equation is y^(n)+Σ_{j<n} a_j y^(j)=0 with each a_j holomorphic on Ω; its initial-value map at x₀∈Ω records the n derivatives 0 through n−1. The corresponding companion first-order system is over ℂ, with complex-analytic coefficients.

Dependencies: tauceti:TauCeti.IsAnalyticContinuationAlong.

Construction or proof:

1. Specify the coefficient family and the linear solution condition.
2. Translate derivatives into the companion system without replacing complex analyticity by a real-time flow.

Uses:

- CDT §1.1.6 and Lemma 5.1.8: Transport a basis of solutions and characterize the inverse germ.

API:

- `TauCeti.ConformalPartII.LinearEquation.mk` (constructor): An analytic family a_j on Ω constructs the monic order-n equation.
- `TauCeti.ConformalPartII.LinearEquation.initialJet` (data): At x₀∈Ω a solution has jet (y(x₀),…,y^(n−1)(x₀))∈ℂ^n.
- `TauCeti.ConformalPartII.LinearEquation.companion` (equivalence): Solutions correspond to analytic solutions of the companion first-order system, preserving the initial jet.

Unit tests:

- `TauCeti.ConformalPartII.LinearEquation.orderOneZero` (computation): For n=1 and a₀=0, solutions on a connected Ω are constants.
- `TauCeti.ConformalPartII.LinearEquation.secondOrderZero` (compatibility): For n=2 with zero coefficients, solutions are affine functions and their initial jet is (y(x₀),y′(x₀)).
- `TauCeti.ConformalPartII.LinearEquation.singularCoefficient` (non-example): a₀(x)=1/x is not an analytic coefficient on a domain containing 0.

Acceptance:

- The initial-value vector has n complex entries; n=0 is excluded.

Source: CDT25, Published p.632; 1.1.6..

#### Analytic linear initial-value theorem

Declaration: `ConformalMappingPartII:O0/initial-value-basis` (theorem).

For the equation above and x₀∈Ω, every complex initial jet has a unique holomorphic solution germ at x₀; the solution-germ space is linearly isomorphic to ℂ^n.

Dependencies: ConformalMappingPartII:O0/linear-equation.

Construction or proof:

1. Construct local analytic solutions by a convergent coefficient recursion or analytic Picard iteration.
2. Establish uniqueness from the recursion and linearly identify jets with germs.

Acceptance:

- Zero initial jet gives the zero germ; a basis of coordinate jets gives n independent solutions.

Source: CDT25, Published p.632; 1.1.6..

#### Continuation of linear ODE solutions

Declaration: `ConformalMappingPartII:O0/path-continuation` (theorem).

On a connected open Ω, each local solution germ of an analytic monic order-n equation continues along every continuous path in Ω; continuation is in TauCeti.IsAnalyticContinuationAlong and preserves the differential equation.

Dependencies: ConformalMappingPartII:O0/initial-value-basis, tauceti:TauCeti.IsAnalyticContinuationAlong, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle.

Construction or proof:

1. Cover the compact path image by discs with local existence and uniqueness.
2. Patch finitely many local solution germs in path order and use uniqueness on overlaps.

Acceptance:

- No continuation through a pole of a coefficient is asserted.

Source: CDT25, Published p.632; 1.1.6..

#### Meromorphic trivial local monodromy

Declaration: `ConformalMappingPartII:O0/meromorphic-basis-monodromy` (definition).

At an isolated singular point α, the source phrase trivial local monodromy means that the full n-dimensional local solution space has a basis of single-valued functions meromorphic on a full neighbourhood of α. This includes finite pole orders; it is stronger than identity of the analytic continuation representation alone.

Dependencies: ConformalMappingPartII:O0/initial-value-basis.

Construction or proof:

1. Record a full meromorphic basis and its finite orders at α.
2. Use basis spans for every local solution; do not infer absence of essential singularities from topological monodromy.

Uses:

- CDT proof of Corollary 2.0.5: Clear the poles of every solution with one algebraic polynomial.

API:

- `TauCeti.ConformalPartII.MeromorphicBasisMonodromy.basis` (data): The witness is a basis of the local solution space consisting of meromorphic germs at α.
- `TauCeti.ConformalPartII.MeromorphicBasisMonodromy.finitePoleBound` (relation): A maximum of the finitely many pole orders bounds the pole order of every solution.
- `TauCeti.ConformalPartII.MeromorphicBasisMonodromy.identityMonodromy` (compatibility): These meromorphic germs give identity analytic continuation around the puncture; the converse needs an additional regularity hypothesis.

Unit tests:

- `TauCeti.ConformalPartII.MeromorphicBasisMonodromy.ordinaryPoint` (degenerate): At an ordinary point an analytic basis satisfies the condition with pole bound zero.
- `TauCeti.ConformalPartII.MeromorphicBasisMonodromy.regularPole` (computation): The order-one equation xy′+y=0 on a punctured disc has basis x⁻¹ and pole bound one.
- `TauCeti.ConformalPartII.MeromorphicBasisMonodromy.essentialSingularity` (non-example): The equation x²y′+y=0 has the single-valued solution e^(1/x); identity topological monodromy does not give a meromorphic basis.

Acceptance:

- The condition excludes the single-valued essential singularity e^(1/x).

Source: CDT25, Published p.636; Here by trivial local monodromy.

#### Global solutions on simply connected domains

Declaration: `ConformalMappingPartII:O0/global-solution-dimension` (theorem).

For a simply connected open Ω and analytic monic order-n equation, the space of holomorphic solutions on Ω has complex dimension n, and evaluation of the initial jet at any x₀∈Ω is a linear isomorphism.

Dependencies: ConformalMappingPartII:O0/path-continuation, ConformalMappingPartII:O0/initial-value-basis, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle.

Construction or proof:

1. Use the imported monodromy theorem to make continuation path-independent.
2. Globalize each coordinate-jet solution and prove injectivity by local uniqueness and continuation.

Acceptance:

- The equation y″=0 recovers the two-dimensional affine solution space.

Source: CDT25, Published p.632; 1.1.6..

#### Simultaneous algebraic pole clearing

Declaration: `ConformalMappingPartII:O0/simultaneous-pole-clearing` (theorem).

Let L have coefficients in ℚ̄(x), let α be an algebraic singular point with the meromorphic-basis condition, and let p∈ℚ̄(x) be nonconstant and regular at α. There is a nonzero q∈ℚ̄[t] such that q(p(x)) times every local solution is holomorphic at α. One can clear finitely many such singularities simultaneously. A rational polynomial requires a Galois-saturated set of algebraic images.

Dependencies: ConformalMappingPartII:O0/meromorphic-basis-monodromy.

Construction or proof:

1. Choose the maximum pole order from the meromorphic basis.
2. Use a sufficiently high power of t−p(α); its composition has positive vanishing order because p is nonconstant.
3. Multiply the finitely many required factors; impose conjugate saturation only when rational coefficients are requested.

Acceptance:

- For h=x⁻¹ at α=0 and p=x², q=t clears the pole.
- No nonzero polynomial clears e^(1/x).

Source: CDT25, Published p.636; Corollary 2.0.5..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Complex analytic initial-value construction.
- Resolve the requested supplier interfaces: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle.

### U0 — Pointed holomorphic universal coverings

Inputs: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l2--schwarz-lemma-extensions, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates, tauceti:TauCetiRoadmap/UniversalCovers#stage-1-close-out-the-universal-cover, tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence.

#### The disc–half-plane coordinate

Declaration: `ConformalMappingPartII:U0/cayley-coordinate` (construction).

Define C(z)=i(1+z)/(1−z) on |z|<1 and C⁻¹(τ)=(τ−i)/(τ+i) on Im τ>0. These are inverse holomorphic maps, C(0)=i, and z→1 corresponds to the cusp at infinity; no value at the boundary point 1 is part of the interior map.

Dependencies: ordinary complex arithmetic and differentiation.

Construction or proof:

1. Use the explicit rational formulas and positive imaginary-part identity.
2. Check both compositions and their denominators on the specified open domains.

Uses:

- CDT Remark 5.0.1: Transport covers and projective actions to the disc.

API:

- `TauCeti.ConformalPartII.CayleyCoordinate.apply` (simp): C(z)=i(1+z)/(1−z) for |z|<1.
- `TauCeti.ConformalPartII.CayleyCoordinate.inverse` (equivalence): C⁻¹(C(z))=z and C(C⁻¹(τ))=τ on the stated domains.
- `TauCeti.ConformalPartII.CayleyCoordinate.imaginaryPart` (characterisation): Im C(z)=(1−|z|²)/|1−z|²>0 on the disc.

Unit tests:

- `TauCeti.ConformalPartII.CayleyCoordinate.zero` (computation): C(0)=i.
- `TauCeti.ConformalPartII.CayleyCoordinate.half` (computation): C(1/2)=3i.
- `TauCeti.ConformalPartII.CayleyCoordinate.boundaryOne` (non-example): The rational formula has zero denominator at z=1; the interior biholomorphism does not assign it a complex value.

Acceptance:

- C has no interior pole and extends at 1 only in the one-point compactification.

Source: CDT25, Published p.667; Remark 5.0.1.

#### Complex charts on the topological cover

Declaration: `ConformalMappingPartII:U0/cover-complex-structure` (construction).

For a connected open Ω⊆ℂ and a base point a∈Ω, put the unique complex one-dimensional manifold structure on the existing TauCeti.UniversalCover a for which its projection to Ω is a local biholomorphism. Use inverse covering sheets as charts, so transition functions are restrictions of the identity on Ω.

Dependencies: tauceti:TauCeti.UniversalCover, tauceti:TauCeti.UniversalCover.isCoveringMap, tauceti:TauCeti.UniversalCover.simplyConnectedSpace, tauceti:TauCetiRoadmap/UniversalCovers#stage-1-close-out-the-universal-cover.

Construction or proof:

1. Lift the plane coordinate through covering sheets.
2. Verify holomorphic chart transitions and nonvanishing derivative of the projection.

Uses:

- CDT §5.1: Upgrade the existing simply connected cover to an analytic surface.

API:

- `TauCeti.ConformalPartII.CoverComplexStructure.projection` (projection): The projection is the existing TauCeti.UniversalCover.proj.
- `TauCeti.ConformalPartII.CoverComplexStructure.chart` (data): Each covering sheet gives a holomorphic chart by the base plane coordinate.
- `TauCeti.ConformalPartII.CoverComplexStructure.topologyComparison` (compatibility): The manifold topology equals the existing quotient topology of UniversalCover.

Unit tests:

- `TauCeti.ConformalPartII.CoverComplexStructure.discCover` (compatibility): For Ω=𝔻, the cover projection is a biholomorphism.
- `TauCeti.ConformalPartII.CoverComplexStructure.annulusCover` (non-example): For a nontrivial annulus the projection is not injective.
- `TauCeti.ConformalPartII.CoverComplexStructure.sheetTransition` (computation): On an overlap of two lifted plane-coordinate charts, the transition is the identity.

Acceptance:

- The underlying carrier, projection and topology agree with Tau Ceti’s topological cover.

Source: CDT25, Published p.667; 5.1. Schwarzians.

#### Hyperbolic uniformization of the cover

Declaration: `ConformalMappingPartII:U0/hyperbolic-uniformization-input` (theorem).

For a connected open Ω⊆ℂ whose complement has at least two points, its analytic universal cover is biholomorphic to the unit disc. The plane and sphere alternatives of simply connected Riemann-surface uniformization must be excluded; the simply connected planar Riemann mapping theorem alone does not prove this assertion.

Dependencies: ConformalMappingPartII:U0/cover-complex-structure, tauceti:TauCeti.UniversalCover.simplyConnectedSpace, tauceti:TauCeti.riemannMapping.

Construction or proof:

1. Invoke and prove the required Riemann-surface uniformization input for this covering surface.
2. Exclude the parabolic and compact alternatives using the two omitted values and covering surjectivity.

Acceptance:

- ℂ and ℂ∖{a} are excluded; Ω=ℂ∖{0,1} qualifies.

Source: CDT25, Published p.667; 5.1. Schwarzians.

#### Pointed analytic cover uniqueness

Declaration: `ConformalMappingPartII:U0/pointed-cover-uniqueness` (lemma).

Two holomorphic universal covers F,G:𝔻→Ω with F(0)=G(0)=a are related by a unique disc automorphism fixing 0, hence by a rotation. Their derivatives at 0 have equal norms. A disc map into Ω fixing a lifts uniquely through F after choosing its lift at 0.

Dependencies: ConformalMappingPartII:U0/hyperbolic-uniformization-input, tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l2--schwarz-lemma-extensions.

Construction or proof:

1. Use imported covering lift uniqueness in both directions.
2. Their mutually inverse lifts are holomorphic because the cover projection is a local biholomorphism.
3. Apply the disc-automorphism classification at zero.

Acceptance:

- A nonzero derivative gives uniqueness of the rotation.

Source: CDT25, Published p.668; Note that FN.

#### Projective realization of analytic deck transformations

Declaration: `ConformalMappingPartII:U0/projective-deck-realization` (theorem).

For a connected hyperbolic plane domain Ω and a pointed holomorphic universal cover F:𝔻→Ω, its existing topological deck transformations are holomorphic disc automorphisms. Conjugation through C identifies their action with a discrete subgroup of PSL₂(ℝ), acting freely on ℍ, and the analytic quotient is Ω. For a finite punctured plane this is its Fuchsian covering group.

Dependencies: ConformalMappingPartII:U0/cover-complex-structure, ConformalMappingPartII:U0/hyperbolic-uniformization-input, ConformalMappingPartII:U0/cayley-coordinate, tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l2--schwarz-lemma-extensions, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action.

Construction or proof:

1. A deck transformation is holomorphic in the lifted covering charts.
2. Apply the existing disc-automorphism classification and the projective action identification.
3. Use a covering sheet to isolate the identity in the deck group and identify its free analytic quotient.

Acceptance:

- For Ω=𝔻 the identity cover has trivial deck group; no cofinite polygon assertion is needed for a general domain.

Source: CDT25, Published p.667; 5.1. Schwarzians.

#### The pointed conformal radius

Declaration: `ConformalMappingPartII:U0/conformal-radius` (definition).

For a connected hyperbolic plane domain Ω and a∈Ω, define R(Ω,a)=|F′(0)| for any holomorphic universal cover F:𝔻→Ω with F(0)=a. The positive real number is independent of the cover. If an open set is disconnected, apply this construction to the connected component containing a, never to a nonsurjective cover of the whole set.

Dependencies: ConformalMappingPartII:U0/pointed-cover-uniqueness, ConformalMappingPartII:U0/hyperbolic-uniformization-input.

Construction or proof:

1. Choose a pointed cover and take its derivative norm.
2. Use rotation independence to identify all choices.

Uses:

- CDT Theorem 5.1.4: Identify the explicit gamma expression with |F_N′(0)|.
- CDT §1.1.6 and arithmetic-algebraization route: Measure analytic discs and bound their initial derivatives.

API:

- `TauCeti.ConformalPartII.conformalRadius.coverDerivative` (characterisation): R(Ω,a)=|F′(0)| for every pointed holomorphic universal cover.
- `TauCeti.ConformalPartII.conformalRadius.positive` (relation): R(Ω,a)>0.
- `TauCeti.ConformalPartII.conformalRadius.riemannMap` (compatibility): If Ω is simply connected and φ is the normalized Tau Ceti map Ω→𝔻 at a, then R(Ω,a)=1/|φ′(a)|.
- `TauCeti.ConformalPartII.conformalRadius.affineChange` (functoriality): For b≠0, R(bΩ+c,ba+c)=|b|R(Ω,a).

Unit tests:

- `TauCeti.ConformalPartII.conformalRadius.unitDisc` (computation): R(𝔻,0)=1.
- `TauCeti.ConformalPartII.conformalRadius.radiusTwo` (computation): R(D(0,2),0)=2.
- `TauCeti.ConformalPartII.conformalRadius.oncePuncturedPlane` (non-example): ℂ∖{0} does not satisfy the two-omitted-point hyperbolic-domain hypothesis.

Acceptance:

- The radius of D(a,R) at a is R for R>0.

Source: CDT25, Published p.668; Our ﬁrst main goal.

#### The normalized roots-of-unity covering

Declaration: `ConformalMappingPartII:U0/roots-cover` (construction).

For an integer N≥2 choose a holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0. For the explicit inverse-germ calculations orient it with F_N′(0)>0 real. Its half-plane form is F̃_N=F_N∘C⁻¹; the standard cusp chart is chosen so that its limit at i∞ is 1. The notation F_N(1)=1 denotes that cusp limit, not evaluation in the disc.

Dependencies: ConformalMappingPartII:U0/hyperbolic-uniformization-input, ConformalMappingPartII:U0/cayley-coordinate, ConformalMappingPartII:U0/pointed-cover-uniqueness, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

Construction or proof:

1. Apply hyperbolic uniformization to the N distinct omitted roots.
2. Normalize the base point and derivative phase; identify the standard root-one cusp by the source symmetry and cusp datum.

Uses:

- CDT §§5–6: Supply a holomorphic map omitting the roots and with nonvanishing derivative.
- NoncongruenceModularForms route: Export conformal radius and mean-growth estimates.

API:

- `TauCeti.ConformalPartII.RootsCover.mapZero` (simp): F_N(0)=0.
- `TauCeti.ConformalPartII.RootsCover.omitsRoots` (characterisation): For |z|<1 and ζ^N=1, F_N(z)≠ζ.
- `TauCeti.ConformalPartII.RootsCover.halfPlane` (compatibility): F̃_N(C(z))=F_N(z) on the disc.
- `TauCeti.ConformalPartII.RootsCover.derivativeOrientation` (data): The oriented cover has F_N′(0)>0 real; changes of source rotation preserve its norm.

Unit tests:

- `TauCeti.ConformalPartII.RootsCover.twoRoots` (computation): For N=2 the target is ℂ∖{−1,1}.
- `TauCeti.ConformalPartII.RootsCover.zeroNotOmitted` (degenerate): 0 is in the target and its chosen preimage is 0.
- `TauCeti.ConformalPartII.RootsCover.boundaryLimit` (non-example): F_N(1)=1 is a cusp limit and 1 is omitted from all interior values.

Acceptance:

- The norm statements require only F_N(0)=0; branch formulas use the chosen orientation.

Source: CDT25, Published p.667; Deﬁnition 5.1.1..

#### Extremality of the pointed cover

Declaration: `ConformalMappingPartII:U0/radius-schwarz` (theorem).

For a pointed holomorphic universal cover F:𝔻→Ω and a holomorphic φ:𝔻→Ω with φ(0)=F(0)=a, |φ′(0)|≤R(Ω,a). Equality holds exactly when the based lift of φ is a rotation, equivalently when φ is a holomorphic universal cover.

Dependencies: ConformalMappingPartII:U0/pointed-cover-uniqueness, ConformalMappingPartII:U0/conformal-radius, mathlib:Complex.norm_deriv_le_one_of_mapsTo_ball, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l2--schwarz-lemma-extensions.

Construction or proof:

1. Lift φ through F fixing zero.
2. Apply Schwarz and its equality case to the lift, then the derivative chain rule.

Acceptance:

- For Ω=𝔻 this is the usual Schwarz derivative bound.

Source: CDT25, Published p.632; 1.1.6..

#### Nonvanishing derivative of the cover

Declaration: `ConformalMappingPartII:U0/cover-etale` (lemma).

For every N≥2 and |z|<1, F_N′(z)≠0. A holomorphic covering between one-dimensional complex manifolds is a local biholomorphism, hence has nonzero complex derivative.

Dependencies: ConformalMappingPartII:U0/roots-cover, ConformalMappingPartII:U0/cover-complex-structure.

Construction or proof:

1. Choose an inverse covering sheet around F_N(z).
2. Differentiate the local inverse identity.

Acceptance:

- F_N/F_N′ is holomorphic on the entire disc, including zero.

Source: CDT25, Published p.668; Lemma 5.1.2..

#### Monotonicity of conformal radius

Declaration: `ConformalMappingPartII:U0/radius-monotone` (lemma).

For connected hyperbolic domains Ω⊆Ω′ and a∈Ω, R(Ω,a)≤R(Ω′,a). Apply the preceding extremal inequality to the pointed covering of Ω followed by inclusion.

Dependencies: ConformalMappingPartII:U0/radius-schwarz.

Construction or proof:

1. View the smaller-domain covering as a holomorphic map into the larger domain.
2. Compare the initial derivative norms.

Acceptance:

- For nested discs at the centre this is the inequality between their radii.

Source: CDT25, Published p.632; 1.1.6..

#### Rotation equivariance of the covering

Declaration: `ConformalMappingPartII:U0/rotation-equivariance` (theorem).

For N≥2 and ζ^N=1, F_N(ζz)=ζF_N(z) for |z|<1. In the half-plane, multiplication by ζ_N corresponds to r̃_N=[cos(π/N),−sin(π/N);sin(π/N),cos(π/N)] in the projective group, of order N.

Dependencies: ConformalMappingPartII:U0/roots-cover, ConformalMappingPartII:U0/pointed-cover-uniqueness, ConformalMappingPartII:U0/cover-etale, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action.

Construction or proof:

1. Lift multiplication by ζ_N to a based disc automorphism.
2. Its derivative at zero equals ζ_N because F_N′(0)≠0, determining the rotation.
3. Conjugate through C to the displayed projective matrix.

Acceptance:

- For N=2 the map is odd.

Source: CDT25, Published p.668; Lemma 5.1.2..

#### The descended power map

Declaration: `ConformalMappingPartII:U0/power-descent` (construction).

For N≥2 there is a unique holomorphic G_N:𝔻→ℂ∖{1} with G_N(z^N)=F_N(z)^N. Define it by root descent and remove the apparent root ambiguity using equivariance; G_N(0)=0. It is ramified at the lifts of zero other than the chosen local branch and is not asserted to be a universal covering.

Dependencies: ConformalMappingPartII:U0/rotation-equivariance.

Construction or proof:

1. All Nth roots of a nonzero input give the same Nth power by equivariance.
2. Use the equivariant Taylor expansion F_N(z)=z A(z^N) to extend analytically at zero.

Uses:

- CDT Lemma 5.1.16: Use its local inverse to evaluate the cover radius.
- CDT Corollary 5.2.4: Identify the larger invariance group of F_N^N.

API:

- `TauCeti.ConformalPartII.PowerDescent.rootEquation` (characterisation): G_N(z^N)=F_N(z)^N for |z|<1.
- `TauCeti.ConformalPartII.PowerDescent.mapZero` (simp): G_N(0)=0.
- `TauCeti.ConformalPartII.PowerDescent.derivative` (relation): G_N′(0)=F_N′(0)^N; consequently |G_N′(0)|=R(ℂ∖μ_N,0)^N.
- `TauCeti.ConformalPartII.PowerDescent.rootIndependence` (compatibility): Any two Nth roots of an input give identical defining values.

Unit tests:

- `TauCeti.ConformalPartII.PowerDescent.localCoefficient` (computation): If F_N(z)=az+O(z^(N+1)), then G_N(w)=a^Nw+O(w²).
- `TauCeti.ConformalPartII.PowerDescent.zero` (degenerate): The local inverse exists at 0 because a≠0.
- `TauCeti.ConformalPartII.PowerDescent.negativeRoot` (compatibility): For N=2, choosing z or −z gives the same G_2(z²).

Acceptance:

- The construction uses root-independent descent, not a principal root formula on the whole disc.

Source: CDT25, Published p.671; Deﬁnition 5.1.15..

#### Derivative of the descended power map

Declaration: `ConformalMappingPartII:U0/descent-derivative` (lemma).

G_N′(0)=F_N′(0)^N and |G_N′(0)|=|F_N′(0)|^N for N≥2.

Dependencies: ConformalMappingPartII:U0/power-descent, ConformalMappingPartII:U0/cover-etale.

Construction or proof:

1. Compare the first nonzero Taylor coefficients in G_N(z^N)=F_N(z)^N.

Acceptance:

- For an oriented cover the complex derivative itself is positive real.

Source: CDT25, Published p.671; Deﬁnition 5.1.15..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Analytic structure and surface uniformization.
- Establish Normalized cusp and cover orientation.
- Resolve the requested supplier interfaces: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l2--schwarz-lemma-extensions, tauceti:TauCetiRoadmap/UniversalCovers#stage-1-close-out-the-universal-cover, tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

### S0 — Schwarzians and accessory parameters

Inputs: ConformalMappingPartII:O0, ConformalMappingPartII:U0, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

#### The Schwarzian derivative

Declaration: `ConformalMappingPartII:S0/schwarzian` (definition).

For a holomorphic f with f′≠0 on an open set, define S(f)(x)=f‴(x)/f′(x)−(3/2)(f″(x)/f′(x))². This equals (f″/f′)′−(1/2)(f″/f′)². The totalized native derivative expression carries no Schwarzian claims at points where f′=0.

Dependencies: ordinary complex arithmetic and differentiation.

Construction or proof:

1. Use complex derivatives and field operations.
2. Record the nonzero-derivative hypotheses for every geometric identity.

Uses:

- CDT Lemma 5.1.8: Compute the rational Schwarzian of the local inverse cover.
- CDT (5.1.11): Convert a locally univalent inverse germ into a second-order equation.

API:

- `TauCeti.schwarzian_affine` (simp): For a≠0, S(x↦ax+b)=0.
- `TauCeti.schwarzian_expanded` (characterisation): For holomorphic f with f′≠0, S(f)=(f″/f′)′−(1/2)(f″/f′)².
- `TauCeti.schwarzian_comp_apply` (functoriality): S(f∘g)=(S(f)∘g)(g′)²+S(g) when f,g are holomorphic with the relevant derivatives nonzero.
- `TauCeti.schwarzian_moebius` (relation): Postcomposition by a Möbius map with nonzero determinant leaves S unchanged wherever its denominator is nonzero.

Unit tests:

- `TauCeti.schwarzian_affineZero` (computation): S(x↦2x+1)=0.
- `TauCeti.schwarzian_square` (computation): For x≠0, S(x↦x²)(x)=−3/(2x²).
- `TauCeti.schwarzian_inverse` (compatibility): For x≠0, S(x↦1/x)(x)=0.

Acceptance:

- The coefficient is 3/2 in the expanded expression.

Source: CDT25, Published p.669; Remark 5.1.10..

#### Schwarzian chain rule

Declaration: `ConformalMappingPartII:S0/schwarzian-chain` (lemma).

For holomorphic f,g near x, with g′(x)≠0 and f′(g(x))≠0, S(f∘g)(x)=S(f)(g(x))g′(x)²+S(g)(x).

Dependencies: ConformalMappingPartII:S0/schwarzian.

Construction or proof:

1. Differentiate the composite three times and clear only the nonzero derivative denominators.
2. Collect terms by field algebra.

Acceptance:

- For postcomposition by an affine map the Schwarzian does not change.

Source: CDT25, Published p.669; Remark 5.1.10..

#### The Schwarzian differential equation

Declaration: `ConformalMappingPartII:S0/quotient-ode` (theorem).

On a sufficiently small simply connected neighbourhood where w′≠0, choose an analytic square root of w′. Then v₁=w/√w′ and v₂=1/√w′ are independent solutions of y″+(1/2)S(w)y=0 and w=v₁/v₂. Conversely a quotient of independent solutions of y″+Qy=0 has Schwarzian 2Q wherever its denominator is nonzero.

Dependencies: ConformalMappingPartII:S0/schwarzian, ConformalMappingPartII:O0/initial-value-basis, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit.

Construction or proof:

1. Use the imported holomorphic-root input on a small disc.
2. Differentiate v₁,v₂ and compute their nonzero Wronskian.
3. Differentiate a quotient in the converse and use the two differential equations.

Acceptance:

- For Q=0 the quotient of affine solutions is a Möbius function.

Source: CDT25, Published p.669; (5.1.11).

#### Möbius invariance of the Schwarzian

Declaration: `ConformalMappingPartII:S0/moebius-invariance` (lemma).

For ad−bc≠0 and M(w)=(aw+b)/(cw+d), S(M∘f)=S(f) where f is locally univalent and cf+d≠0. A branch change of the inverse of a holomorphic cover is a projective transformation, so its Schwarzian is branch-independent.

Dependencies: ConformalMappingPartII:S0/schwarzian-chain, ConformalMappingPartII:U0/pointed-cover-uniqueness, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action.

Construction or proof:

1. Compute S(M)=0 off its pole.
2. Apply the chain rule and identify cover branch changes by deck transformations.

Acceptance:

- The map 1/w has zero Schwarzian off zero.

Source: CDT25, Published p.669; Remark 5.1.10..

#### Hempel’s accessory-parameter formula

Declaration: `ConformalMappingPartII:S0/hempel-rational` (theorem).

Let S={p₀,…,p_N}⊂ℂ consist of distinct finite points, |S|≥3; thus infinity is unpunctured in ℙ¹∖S. For a local inverse τ of its holomorphic universal cover, S(τ)(X)=(1/2)Σ_k(X−p_k)⁻²+Σ_k m_k/(X−p_k) for constants m_k. The branch-independent Schwarzian is rational and has the stated principal parts.

Dependencies: ConformalMappingPartII:S0/moebius-invariance, ConformalMappingPartII:U0/hyperbolic-uniformization-input, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

Construction or proof:

1. Derive the double-pole coefficient 1/2 from the logarithmic local inverse at a cusp.
2. Globalize the Schwarzian on the punctured sphere and remove all other poles.
3. Use the unpunctured infinity coordinate to constrain its rational principal parts.

Acceptance:

- Do not apply this finite-S coordinate directly with infinity listed as a puncture.

Source: CDT25, Published p.670; [Hem88.

#### Accessory-parameter constraints at infinity

Declaration: `ConformalMappingPartII:S0/accessory-constraints` (lemma).

With Hempel’s finite set S and infinity unpunctured, Σ m_k=0, Σ(2m_kp_k+1)=0, and Σ(m_kp_k²+p_k)=0. These are exactly cancellation of the X⁻¹, X⁻² and X⁻³ coefficients, so the Schwarzian is O(X⁻⁴) at infinity.

Dependencies: ConformalMappingPartII:S0/hempel-rational, ConformalMappingPartII:S0/schwarzian-chain.

Construction or proof:

1. Expand each simple and double pole at infinity.
2. Use the coordinate inversion X=1/x and local holomorphicity at x=0.

Acceptance:

- All three sums are needed; infinity is not an omitted point in this coordinate.

Source: CDT25, Published p.670; [Hem88.

#### Accessory parameters for the symmetric punctures

Declaration: `ConformalMappingPartII:S0/symmetric-accessory` (lemma).

For the companion cover 1/F̃_N of ℙ¹∖({0}∪μ_N), in coordinate X its accessory parameters are m₀=0 and m_k=−(1/2+1/(2N))ζ_N^(−k), k=1,…,N. Rotational symmetry and the three infinity constraints determine them.

Dependencies: ConformalMappingPartII:S0/accessory-constraints, ConformalMappingPartII:U0/rotation-equivariance.

Construction or proof:

1. Work with 1/F̃_N so the finite punctures are {0}∪μ_N.
2. Use symmetry to make all root coefficients a common multiple of ζ_N^(−k), and use the constraints to determine that multiple.

Acceptance:

- The N=2 value is −3ζ^(−k)/4.

Source: CDT25, Published p.670; [Hem88.

#### The rational Schwarzian for the roots cover

Declaration: `ConformalMappingPartII:S0/roots-schwarzian` (lemma).

For the local inverse ψ_N of F_N, S(ψ_N)(x)=((N²−1)x^(N−2)+x^(2N−2))/(2(x^N−1)²) near zero. Obtain this by changing the companion coordinate X=1/x; S(1/x)=0 and the squared derivative factor is essential.

Dependencies: ConformalMappingPartII:S0/symmetric-accessory, ConformalMappingPartII:S0/schwarzian-chain.

Construction or proof:

1. Sum the root partial fractions in the companion coordinate.
2. Transform through X=1/x with the Schwarzian chain rule and simplify.

Acceptance:

- For N=2 the numerator is 3+x².

Source: CDT25, Published p.669; Lemma 5.1.8..

#### The linear equation of the inverse covering

Declaration: `ConformalMappingPartII:S0/roots-inverse-ode` (theorem).

For N≥2 the local inverse ψ_N fixing zero is a quotient η₁/η₂ of independent solutions of 4(x^N−1)²y″+((N²−1)x^(N−2)+x^(2N−2))y=0. Choose the quotient normalization to agree with the actual inverse germ; an arbitrary basis gives it only up to a Möbius map.

Dependencies: ConformalMappingPartII:S0/roots-schwarzian, ConformalMappingPartII:S0/quotient-ode, ConformalMappingPartII:O0/initial-value-basis.

Construction or proof:

1. Apply the Schwarzian-to-ODE theorem and multiply by 4(x^N−1)².
2. Match the inverse germ by the basis/Möbius normalization.

Acceptance:

- No global single-valued inverse is asserted.

Source: CDT25, Published p.669; Lemma 5.1.8..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Hempel rational Schwarzian proof.
- Resolve the requested supplier interfaces: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

### L0 — Blaschke products and quotient representations

Inputs: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit.

#### Boundary-compatible Blaschke factors

Declaration: `ConformalMappingPartII:L0/blaschke-factor` (definition).

For |a|≤1 define b_a(z)=(z−a)/(1−āz) if |a|<1, and b_a(z)=−a if |a|=1. The boundary formula is the removable extension of the same rational expression; it has no zero. The interior factor is the existing Tau Ceti unitDiscMoebius after coercion; the new wrapper adds only the removable boundary extension in CDT’s convention.

Dependencies: tauceti:TauCeti.unitDiscMoebius, tauceti:TauCeti.coe_unitDiscMoebius.

Construction or proof:

1. Separate boundary points so the cancelled rational expression is a holomorphic constant.
2. For an interior point use the ordinary disc-automorphism formula.

Uses:

- CDT proof of Lemma 2.3.1: Remove interior zeros without introducing a boundary pole.

API:

- `TauCeti.ConformalPartII.blaschkeFactor.interior` (simp): For |a|<1, b_a(z)=(z−a)/(1−āz).
- `TauCeti.ConformalPartII.blaschkeFactor.boundary` (simp): For |a|=1, b_a is the constant −a.
- `TauCeti.ConformalPartII.blaschkeFactor.normOnCircle` (relation): For |a|≤1 and |z|=1, |b_a(z)|=1.
- `TauCeti.ConformalPartII.blaschkeFactor.discAutomorphism` (compatibility): For a,z∈Complex.UnitDisc, b_(a:ℂ)(z:ℂ)=(TauCeti.unitDiscMoebius a z:ℂ). The wrapper only extends the already available interior factor to boundary parameters.

Unit tests:

- `TauCeti.ConformalPartII.blaschkeFactor.zero` (computation): b_0(z)=z.
- `TauCeti.ConformalPartII.blaschkeFactor.one` (degenerate): b_1(z)=−1, including at z=1 after removable extension.
- `TauCeti.ConformalPartII.blaschkeFactor.minusOne` (computation): b_(−1)(z)=1.

Acceptance:

- The boundary point a=1 gives the constant −1.

Source: CDT25, Published p.640; Blaschke.

#### Herglotz representation of a normalized logarithm

Declaration: `ConformalMappingPartII:L0/herglotz-log` (theorem).

For R>0 and g holomorphic and zero-free on a neighbourhood of the closed disc |z|≤R, with g(0)=1, choose the unique analytic log L with L(0)=0. For |z|<R, L(z)=∫_(|w|=R) log|g(w)|(w+z)/(w−z) dμ_Haar(w).

Dependencies: mathlib:DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit.

Construction or proof:

1. Construct the normalized analytic logarithm from the imported branch-log theory.
2. Apply Poisson to its real part and fix the imaginary constant by L(0)=0.

Acceptance:

- A zero-free constant g=1 gives the zero logarithm.

Source: CDT25, Published p.640; Poisson kernel formula.

#### Optimality of the quotient bound

Declaration: `ConformalMappingPartII:L0/quotient-lower-bound` (theorem).

If g,h are holomorphic near the closed unit disc and h(0)=1, then m(1,g)≤max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}. This is the lower bound in Remark 2.3.3; use the a.e. logarithmic identity across isolated zeros.

Dependencies: mathlib:MeromorphicOn.circleAverage_log_norm, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Use log⁺|g|+log|h|=max(log|h|,log|hg|) almost everywhere.
2. Jensen gives the mean of log|h|≥log|h(0)|=0.
3. Average the pointwise bound by the maximum of the two suprema.

Acceptance:

- For constants g=c, h=1 the bound is exactly log⁺|c|.

Source: CDT25, Published p.641; Remark 2.3.3..

#### Finite Blaschke products

Declaration: `ConformalMappingPartII:L0/finite-blaschke-product` (construction).

For a finite family |a_i|≤1 and multiplicities n_i∈ℕ, set B(z)=∏_i b_(a_i)(z)^n_i, with the empty product equal to 1. It is holomorphic near the closed unit disc and has boundary modulus one. It maps the open disc into the closed disc; strict image in the open disc requires at least one positive multiplicity at an interior zero.

Dependencies: ConformalMappingPartII:L0/blaschke-factor.

Construction or proof:

1. Multiply the removable factors with their specified multiplicities.
2. Keep empty and boundary-only products as modulus-one constants.

Uses:

- CDT proof of Lemma 2.3.1: Cancel precisely the zeros of g and preserve its boundary log norm.

API:

- `TauCeti.ConformalPartII.finiteBlaschke.empty` (simp): An empty family has B=1.
- `TauCeti.ConformalPartII.finiteBlaschke.mul` (functoriality): Concatenating finite zero families multiplies their Blaschke products.
- `TauCeti.ConformalPartII.finiteBlaschke.normOnCircle` (relation): On |z|=1, |B(z)|=1.
- `TauCeti.ConformalPartII.finiteBlaschke.strictDisc` (characterisation): A product with a positive interior multiplicity has |B(z)|<1 for |z|<1; a boundary-only product has |B(z)|=1.

Unit tests:

- `TauCeti.ConformalPartII.finiteBlaschke.emptyProduct` (degenerate): The product over Fin 0 is 1.
- `TauCeti.ConformalPartII.finiteBlaschke.doubleZero` (computation): One zero a=0 of multiplicity two gives B(z)=z².
- `TauCeti.ConformalPartII.finiteBlaschke.boundaryProduct` (non-example): One boundary zero a=1 of multiplicity one gives B=−1, not an open-disc-valued map.

Acceptance:

- An empty product is not a strict self-map into the open disc.

Source: CDT25, Published p.640; Blaschke.

#### The derivative Herglotz formula

Declaration: `ConformalMappingPartII:L0/herglotz-derivative` (lemma).

Under the preceding normalized zero-free hypotheses, for |z|<R, g′(z)/g(z)=∫_(|w|=R) 2w log|g(w)|/(w−z)² dμ_Haar(w). The differentiated identity also holds without g(0)=1 after normalizing by g(0).

Dependencies: ConformalMappingPartII:L0/herglotz-log, mathlib:hasDerivAt_circleAverage_herglotzRieszKernel_smul.

Construction or proof:

1. Differentiate the Herglotz kernel using the native circle-integral derivative theorem.
2. Differentiate the analytic log and cancel the normalization constant.

Acceptance:

- For g=e^z the derivative ratio is identically one.

Source: CDT25, Published p.680; Lemma 6.1.7..

#### The phase in the complex quotient identity

Declaration: `ConformalMappingPartII:L0/quotient-phase` (lemma).

For a zero-free holomorphic G near the closed disc of radius r>0, exp(∫ log|G(w)|(w+z)/(w−z)dμ)=G(z)|G(0)|/G(0) for |z|<r. Thus a complex quotient formula reconstructing G requires the constant phase G(0)/|G(0)|; a formula of absolute values does not.

Dependencies: ConformalMappingPartII:L0/herglotz-log.

Construction or proof:

1. Apply the normalized formula to G/G(0).
2. Separate the real log |G(0)| from the complex constant and exponentiate.

Acceptance:

- For G=i the integral is zero and the missing phase is i.

Source: CDT25, Published p.640; Poisson kernel formula.

#### Removing zeros with a finite Blaschke product

Declaration: `ConformalMappingPartII:L0/blaschke-zero-removal` (lemma).

Let g be holomorphic near the closed unit disc and not identically zero. Form B from all its zeros in the closed disc with their orders. After removal of singularities, G=g/B is holomorphic and zero-free on the open disc and has |G|=|g| on the circle wherever the boundary quotients are interpreted by limits. Boundary zeros of g need not disappear from G, because boundary factors are constants.

Dependencies: ConformalMappingPartII:L0/finite-blaschke-product, mathlib:MeromorphicOn.divisor, mathlib:MeromorphicOn.divisor_ball_support_finite.

Construction or proof:

1. Use compactness and isolated zeros to enumerate the finite divisor.
2. Cancel each interior zero to its full order.
3. Treat boundary factors as removable constants and retain the correct open-disc zero-free conclusion.

Acceptance:

- For g=1−z, G still has a boundary zero at 1; no zero-free closed-neighbourhood conclusion follows.

Source: CDT25, Published p.640; Blaschke.

#### Radial smoothing of the quotient multiplier

Declaration: `ConformalMappingPartII:L0/radial-smoothing` (lemma).

If g is holomorphic near the closed unit disc, the radius-r Blaschke/Herglotz construction for r>1 sufficiently close to 1 gives a multiplier h holomorphic on a neighbourhood of the closed unit disc with h(0)=1. The resulting boundary bounds converge to m(1,g) as r decreases to 1, including boundary zeros by integrable logarithmic control.

Dependencies: ConformalMappingPartII:L0/blaschke-zero-removal, ConformalMappingPartII:L0/quotient-phase, mathlib:ValueDistribution.proximity, mathlib:MeromorphicOn.circleAverage_log_norm.

Construction or proof:

1. Choose a slightly larger disc within the holomorphic neighbourhood and enumerate its zeros.
2. Construct the zero-free quotient there and its Herglotz multiplier.
3. Establish convergence of positive boundary log means and absorb the requested ε.

Acceptance:

- The smoothing step supplies the neighbourhood regularity, not just holomorphicity on the open unit disc.

Source: CDT25, Published p.641; Lemma 2.3.1..

#### Nevanlinna’s quotient representation

Declaration: `ConformalMappingPartII:L0/quotient-representation` (theorem).

For ε>0 and g holomorphic near the closed unit disc, there is h holomorphic near that disc with h(0)=1 and max{sup_(|z|=1) log|h(z)|,sup_(|z|=1) log|h(z)g(z)|}≤m(1,g)+ε. The zero function g is handled separately. Use logarithmic suprema, not suprema of |h|.

Dependencies: ConformalMappingPartII:L0/radial-smoothing, ConformalMappingPartII:L0/quotient-phase, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Take the smoothed Herglotz multiplier, retaining the complex phase in the quotient identity.
2. Bound the two logarithmic real parts by the positive log mean and choose r close enough to absorb ε.

Acceptance:

- For g=h=1 the bound is 0≤ε, which rejects the printed sup|h| slip.

Source: CDT25, Published p.641; Lemma 2.3.1..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Blaschke and radial-smoothing analytic details.
- Resolve the requested supplier interfaces: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit.

### H0 — Hypergeometric inverse germs

Inputs: ConformalMappingPartII:O0, ConformalMappingPartII:S0, ConformalMappingPartII:U0.

#### The Gauss hypergeometric equation

Declaration: `ConformalMappingPartII:H0/gauss-equation` (theorem).

For parameters a,b,c with none of a,b,c a nonpositive integer and |x|<1, the native ₂F₁(a,b;c;x) satisfies x(1−x)y″+(c−(a+b+1)x)y′−aby=0. The value and first Taylor coefficient at 0 are 1 and ab/c. Use analytic differentiation of the convergent native series, not its junk values outside radius one.

Dependencies: mathlib:ordinaryHypergeometric, mathlib:ordinaryHypergeometric_eq_tsum, mathlib:ordinaryHypergeometric_zero, mathlib:ordinaryHypergeometricSeries_radius_eq_one.

Construction or proof:

1. Establish analyticity and termwise derivatives on compact subdiscs using the formal series radius.
2. Compare coefficients using the Pochhammer recurrence; handle x=0 by the analytic identity.

Acceptance:

- For a=b=1/2,c=1 the derivative coefficient is 1/4.

Source: CDT25, Published p.672; In order to prove.

#### The descended inverse differential equation

Declaration: `ConformalMappingPartII:H0/transformed-equation` (lemma).

After x=u^N the two solutions η_i(u) of the roots inverse equation give φ_i(x)=η_i(x^(1/N)) on a compatible punctured branch, satisfying x(x−1)²φ″+(1−1/N)(x−1)²φ′+(1/4+(x−1)/(4N²))φ=0.

Dependencies: ConformalMappingPartII:S0/roots-inverse-ode.

Construction or proof:

1. Differentiate u=x^(1/N) on one branch and substitute its first two derivatives.
2. Multiply the transformed equation by its nonzero branch denominators.

Acceptance:

- For N≥2 the exponents at x=0 are 0 and 1/N.

Source: CDT25, Published p.672; Let φi.

#### Zero-balanced hypergeometric continuation

Declaration: `ConformalMappingPartII:H0/zero-balanced-continuation` (theorem).

For positive real a and 0<|x|<1 on a fixed compatible branch of log x, the analytic continuation of ₂F₁(a,a;2a;1−x) equals Γ(2a)/Γ(a)² times Σ_{k≥0}(a)_k² x^k/(k!)²·(−log x+2(ψ(k+1)−ψ(k+a))). This refers to the continued analytic function, not the native series junk value outside its disc. The proof needs only a∈[1/4,3/4]. A more general finite-valued parameter statement must also exclude poles of 2a.

Dependencies: mathlib:ordinaryHypergeometric, mathlib:ordinaryHypergeometric_eq_tsum, mathlib:Complex.digamma.

Construction or proof:

1. Prove the zero-balanced continuation connection formula on a chosen logarithmic branch.
2. Identify its convergent series with the native germ wherever both series domains meet.
3. Retain positive-real parameter guards for every subsequent uniform estimate.

Acceptance:

- The term k=0 is −log x+2ψ(1)−2ψ(a).

Source: CDT25, Published p.672; Lemma 5.1.20.

#### Uniform digamma coefficient control

Declaration: `ConformalMappingPartII:H0/digamma-difference-bound` (lemma).

For a∈[1/4,3/4] and k≥1, 0≤ψ(k+1)−ψ(k+a)≤ψ(2)−ψ(5/4), and the difference decreases in both k and a. This uses the corrected coefficient ψ(k+1)−ψ(k+a), not ψ(k)−ψ(k+a).

Dependencies: mathlib:Complex.digamma, mathlib:Complex.digamma_apply_add_nat.

Construction or proof:

1. Derive the reciprocal-series or positive-integral formula for the difference.
2. Compare terms as k and a increase to obtain the uniform maximum.

Acceptance:

- At a=1/2 the coefficient is positive, detecting the shifted-index slip.

Source: CDT25, Published p.676; Lemma 5.2.9..

#### The two hypergeometric solutions

Declaration: `ConformalMappingPartII:H0/special-solutions` (lemma).

Let a_±=(N±1)/(2N). On compatible branches near a punctured zero, √(1−x)x^(1/N)₂F₁(a_+,a_+;2a_+;x) and √(1−x)₂F₁(a_−,a_−;2a_−;x) solve the transformed equation. Their leading terms x^(1/N) and 1 match the normalized η₁,η₂ after substituting x=u^N.

Dependencies: ConformalMappingPartII:H0/gauss-equation, ConformalMappingPartII:H0/transformed-equation, ConformalMappingPartII:O0/initial-value-basis.

Construction or proof:

1. Insert the gauge factor √(1−x) into Gauss’s equation.
2. For the first solution also insert the x^(1/N) factor and verify all coefficients.
3. After x=u^N match the analytic initial jets by uniqueness.

Acceptance:

- The common square-root factor cancels in the quotient.

Source: CDT25, Published p.672; In order to prove.

#### Uniform zero-balanced remainder

Declaration: `ConformalMappingPartII:H0/pochhammer-remainder` (lemma).

For a∈[1/4,3/4] and 0<|x|≤e^(−M₀N), N≥2, the k≥1 part of the zero-balanced series and its a-derivative have bounds uniform in a,N, with size O_{M₀}(|x|(1+|log x|)). The derivative control is required to gain the factor 1/N when comparing a_+ and a_−.

Dependencies: ConformalMappingPartII:H0/zero-balanced-continuation, ConformalMappingPartII:H0/digamma-difference-bound.

Construction or proof:

1. Bound Pochhammer/factorial ratios uniformly over the compact positive parameter interval.
2. Differentiate the coefficient formulas in a and sum the dominated geometric tails.
3. Compare a_+−a_−=1/N using the derivative bound.

Acceptance:

- A merely separate O(|x|) numerator and denominator estimate is not enough to claim an O(|x|/N) difference.

Source: CDT25, Published p.676; Lemma 5.2.9..

#### The normalized inverse-ratio germ

Declaration: `ConformalMappingPartII:H0/inverse-ratio-germ` (construction).

For N≥2 set J_N(u)=u·₂F₁(a_+,a_+;2a_+;u^N)/₂F₁(a_−,a_−;2a_−;u^N) near u=0, where a_±=(N±1)/(2N). The denominator is 1 at zero. Thus J_N is holomorphic with J_N(0)=0 and J_N′(0)=1. Its expression is a genuine analytic germ and avoids an unjustified global principal-root identity.

Dependencies: mathlib:ordinaryHypergeometric, mathlib:ordinaryHypergeometric_zero, mathlib:ordinaryHypergeometricSeries_radius_eq_one, ConformalMappingPartII:H0/special-solutions.

Construction or proof:

1. Cancel the square-root factors in the two special solutions.
2. Use the native value one and radius one to ensure a nonzero denominator in a neighbourhood of zero.

Uses:

- CDT Lemma 5.1.16: Compute the local inverse of F_N and the derivative of G_N.
- CDT Lemma 5.2.9: Continue the same ratio to a cusp using compatible logarithmic branches.

API:

- `TauCeti.ConformalPartII.inverseRatio.formula` (data): J_N(u) is the displayed quotient of the native ordinaryHypergeometric functions.
- `TauCeti.ConformalPartII.inverseRatio.mapZero` (simp): J_N(0)=0.
- `TauCeti.ConformalPartII.inverseRatio.derivativeZero` (relation): For N≥2, J_N′(0)=1.
- `TauCeti.ConformalPartII.inverseRatio.equivariant` (compatibility): J_N(ζu)=ζJ_N(u) for ζ^N=1 wherever the germ expression is defined.

Unit tests:

- `TauCeti.ConformalPartII.inverseRatio.zero` (degenerate): J_2(0)=0.
- `TauCeti.ConformalPartII.inverseRatio.derivative` (computation): J_2′(0)=1.
- `TauCeti.ConformalPartII.inverseRatio.firstCoefficient` (computation): The third complex derivative of J_2 at zero is 3/2, corresponding to the cubic coefficient 1/4; the identity germ would give zero.

Acceptance:

- The expansion is J_N(u)=u+u^(N+1)/(2N)+O(u^(2N+1)).

Source: CDT25, Published p.671; Lemma 5.1.16..

#### Matching the actual covering inverse

Declaration: `ConformalMappingPartII:H0/inverse-germ-match` (theorem).

For the oriented cover with F_N′(0)>0, ψ_N(u)=|F_N′(0)|⁻¹J_N(u) as germs at zero. The inverse of G_N is φ_N(x)=|F_N′(0)|^(−N)x(₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x))^N. For an unoriented cover replace the real prefactor by F_N′(0)⁻¹ and its Nth power.

Dependencies: ConformalMappingPartII:H0/inverse-ratio-germ, ConformalMappingPartII:H0/special-solutions, ConformalMappingPartII:U0/descent-derivative, ConformalMappingPartII:S0/roots-inverse-ode.

Construction or proof:

1. Match normalized ODE initial jets before taking the quotient.
2. Apply the inverse-function derivative rule.
3. Take the Nth power and descend, retaining the derivative phase unless orientation is fixed.

Acceptance:

- No identity between principal Nth roots of u^N and u is used.

Source: CDT25, Published p.672; Let η1.

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Native hypergeometric analyticity and ODE.
- Establish Zero-balanced connection formula.
- Establish Uniform parameter-differentiated series bounds.
- Discharge the admitted prerequisite chains and verify their native interfaces.

### R0 — The explicit conformal radius

Inputs: ConformalMappingPartII:H0, ConformalMappingPartII:U0, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

#### The explicit Gamma radius

Declaration: `ConformalMappingPartII:R0/gamma-radius` (definition).

For N≥2 define γ_N=16^(1/N)Γ(1+1/(2N))²Γ(1−1/N)/(Γ(1−1/(2N))²Γ(1+1/N)), using the native real Gamma function and positive real power. All Gamma arguments are positive. A totalized arithmetic expression outside N≥2 is not assigned a uniformization interpretation.

Dependencies: mathlib:Real.Gamma, mathlib:Real.Gamma_pos_of_pos.

Construction or proof:

1. Form the stated real arithmetic expression with its positive denominator.
2. Separate the arithmetic definition from its later equality with conformal radius.

Uses:

- CDT Theorem 5.1.4: State the exact conformal size and its asymptotic expansion.
- CDT Lemma 5.2.9: Normalize the hypergeometric ratio at its cusp.

API:

- `TauCeti.ConformalPartII.gammaRadius.formula` (data): γ_N is the displayed Gamma expression.
- `TauCeti.ConformalPartII.gammaRadius.positive` (relation): γ_N>0 for N≥2.
- `TauCeti.ConformalPartII.gammaRadius.alternative` (compatibility): γ_N=Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)) for N≥2.
- `TauCeti.ConformalPartII.gammaRadius.tendsto` (relation): γ_N→1 as N→∞.

Unit tests:

- `TauCeti.ConformalPartII.gammaRadius.two` (computation): γ_2=Γ(1/4)^4/(4π²).
- `TauCeti.ConformalPartII.gammaRadius.three` (computation): γ_3=Γ(1/6)^3/(12π^(3/2)).
- `TauCeti.ConformalPartII.gammaRadius.oneOutsideHypothesis` (non-example): The totalized expression at N=1 is zero through Γ(0)=0; it is not a positive hyperbolic radius.

Acceptance:

- Positivity follows from the positive-real Gamma API.

Source: CDT25, Published p.668; Theorem 5.1.4..

#### The boundary limit of the inverse ratio

Declaration: `ConformalMappingPartII:R0/cusp-ratio-limit` (lemma).

Along the compatible real branch x→1 from below, the ratio s_N(x)=x^(1/N)₂F₁(a_+,a_+;2a_+;x)/₂F₁(a_−,a_−;2a_−;x) tends to Γ(1+1/N)Γ(a_−)²/(Γ(1−1/N)Γ(a_+)²). The inverse cover approaches a boundary point of modulus one.

Dependencies: ConformalMappingPartII:H0/zero-balanced-continuation, ConformalMappingPartII:H0/inverse-germ-match, ConformalMappingPartII:U0/roots-cover, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

Construction or proof:

1. The common diverging −log(1−x) term dominates both continued hypergeometric functions.
2. Take the ratio of their prefactors and use the cusp limit of the inverse covering.

Acceptance:

- Only a branch-consistent radial limit is required.

Source: CDT25, Published p.672; Proof of Theorem 5.1.4..

#### The local log-Gamma Taylor series

Declaration: `ConformalMappingPartII:R0/log-gamma-taylor` (theorem).

For |z|<1, the analytic branch of log Γ(1+z) vanishing at z=0 is −γz+Σ_{k≥2}(−1)^kζ(k)z^k/k. For real −1<z<1 this is the ordinary log of the positive real Gamma function.

Dependencies: mathlib:Real.Gamma, mathlib:Complex.Gamma, mathlib:Complex.Gamma_ne_zero_of_re_pos, mathlib:Complex.Gamma_ofReal, mathlib:Real.BohrMollerup.tendsto_log_gamma, mathlib:Complex.digamma.

Construction or proof:

1. Derive the locally uniformly convergent logarithmic Euler-product expansion.
2. Justify interchange of its sums and identify the ζ coefficients and Euler constant.
3. Compare the branch with the positive-real logarithm.

Acceptance:

- The linear term is −γz and the quadratic coefficient is ζ(2)/2.

Source: CDT25, Published p.673; [AS92.

#### Positivity of the Gamma radius

Declaration: `ConformalMappingPartII:R0/gamma-positive` (lemma).

For every N≥2, γ_N>0 and every Gamma factor in its denominator is nonzero.

Dependencies: ConformalMappingPartII:R0/gamma-radius, mathlib:Real.Gamma_pos_of_pos.

Construction or proof:

1. Check the four arguments are positive and multiply/divide positive quantities.

Acceptance:

- N=1 lies outside the hypothesis.

Source: CDT25, Published p.668; Theorem 5.1.4..

#### The alternative Gamma expression

Declaration: `ConformalMappingPartII:R0/gamma-alternative` (lemma).

For N≥2, γ_N=Γ((N−1)/(2N))²Γ(1+1/N)/(Γ((N+1)/(2N))²Γ(1−1/N)).

Dependencies: ConformalMappingPartII:R0/gamma-radius, mathlib:Real.Gamma_mul_Gamma_one_sub, mathlib:Real.Gamma_mul_Gamma_add_half, mathlib:Real.Gamma_pos_of_pos.

Construction or proof:

1. Apply reflection and duplication to the positive Gamma arguments.
2. Clear the positive denominator factors and simplify powers of two.

Acceptance:

- At N=2 both expressions are Γ(1/4)^4/(4π²).

Source: CDT25, Published p.673; [AS92.

#### The conformal radius of the punctured plane

Declaration: `ConformalMappingPartII:R0/conformal-radius-formula` (theorem).

For N≥2 and every holomorphic universal cover F_N:𝔻→ℂ∖μ_N with F_N(0)=0, |F_N′(0)|=R(ℂ∖μ_N,0)=γ_N. In particular |F_2′(0)|=Γ(1/4)^4/(4π²) and |F_3′(0)|=Γ(1/6)^3/(12π^(3/2)).

Dependencies: ConformalMappingPartII:R0/cusp-ratio-limit, ConformalMappingPartII:R0/gamma-alternative, ConformalMappingPartII:U0/conformal-radius, ConformalMappingPartII:U0/pointed-cover-uniqueness, mathlib:Real.Gamma_mul_Gamma_one_sub, mathlib:Real.Gamma_mul_Gamma_add_half.

Construction or proof:

1. For the oriented cover divide the boundary limit of s_N by the derivative norm and set its modulus to one.
2. Apply the alternative expression and remove source-rotation dependence.
3. Specialize the Gamma identities at N=2 and N=3.

Acceptance:

- The specializations are exact symbolic identities, not numerical evidence.

Source: CDT25, Published p.668; Theorem 5.1.4..

#### The odd-zeta radius series

Declaration: `ConformalMappingPartII:R0/log-radius-series` (lemma).

For every integer N≥2, log γ_N=(log 16)/N+Σ_{k≥1}(2^(2k)−1)ζ(2k+1)/(2^(2k−1)(2k+1)N^(2k+1)), with an absolutely convergent series of positive terms.

Dependencies: ConformalMappingPartII:R0/log-gamma-taylor, ConformalMappingPartII:R0/gamma-radius, ConformalMappingPartII:R0/gamma-positive.

Construction or proof:

1. Substitute ±1/N and ±1/(2N) in the log-Gamma series.
2. Cancel the Euler terms and every even-degree term; group the odd terms.

Acceptance:

- The first two terms are ζ(3)/(2N³) and 3ζ(5)/(8N⁵).

Source: CDT25, Published p.673; [AS92.

#### The positive radius expansion

Declaration: `ConformalMappingPartII:R0/positive-radius-expansion` (theorem).

For N≥2 write γ_N=16^(1/N)(1+ζ(3)/(2N³)+3ζ(5)/(8N⁵)+E_N). Then E_N>0 and there is an absolute effectively computable C with E_N≤C/N⁶. Consequently this is the positive O(N⁻⁶) remainder of CDT (5.1.6).

Dependencies: ConformalMappingPartII:R0/log-radius-series.

Construction or proof:

1. Bound the positive tail of the absolutely convergent odd-zeta series.
2. Exponentiate its first two positive terms and bound the quadratic and higher exponential remainder.
3. The square of the N⁻³ term supplies the first positive N⁻⁶ contribution.

Acceptance:

- The omitted term is positive, not only bounded in absolute value.

Source: CDT25, Published p.668; Theorem 5.1.4..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Normalized cusp and cover orientation.
- Establish Log-Gamma Taylor proof and effective remainder.
- Resolve the requested supplier interfaces: tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

### F0 — Symmetric polygons and the covering group

Inputs: ConformalMappingPartII:U0, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

#### The symmetric ideal polygon

Declaration: `ConformalMappingPartII:F0/ideal-polygon` (theorem).

For N≥2 the deck group Γ_N of F_N has the ideal 2N-gon centred at zero with vertices exp(πik/N), k=0,…,2N−1, as a Dirichlet fundamental domain. Its sides join adjacent vertices by hyperbolic geodesics; the prescribed side pairings recover the roots-of-unity quotient.

Dependencies: ConformalMappingPartII:U0/roots-cover, ConformalMappingPartII:U0/rotation-equivariance, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle.

Construction or proof:

1. Construct the symmetric circular polygon by the imported Riemann map and reflection.
2. Verify its side-pairing and cusp-cycle hypotheses for the imported polygon theorem.
3. Identify the resulting covering with the pointed cover by uniqueness.

Acceptance:

- There are 2N ideal vertices, with zero angles.

Source: CDT25, Published p.674; Proposition 5.2.1..

#### The primitive cusp translation

Declaration: `ConformalMappingPartII:F0/primitive-cusp-width` (theorem).

The full stabilizer of i∞ in Γ̃_N is generated by τ↦τ+h_N where h_N=2cot(π/(2N))>0. This is the primitive positive generator in the chosen normalized cusp datum.

Dependencies: ConformalMappingPartII:F0/ideal-polygon, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

Construction or proof:

1. Compute the side geodesic endpoint cot(π/(2N)) from the polygon geometry.
2. Read the paired vertical side translation and show its primitiveness from the fundamental polygon.

Acceptance:

- For N=2 the width is 2.

Source: CDT25, Published p.674; Proposition 5.2.1..

#### The free deck-group presentation

Declaration: `ConformalMappingPartII:F0/free-deck-presentation` (theorem).

Γ̃_N is free of rank N on t̃_N and r̃_N^k t̃_N r̃_N^(−k), k=1,…,N−1, where t̃_N is the primitive cusp translation. The projective rotation r̃_N has order N but is not a nontrivial element of the torsion-free deck group.

Dependencies: ConformalMappingPartII:F0/ideal-polygon, ConformalMappingPartII:F0/primitive-cusp-width, ConformalMappingPartII:U0/rotation-equivariance, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups.

Construction or proof:

1. Apply the polygon presentation to the side pairings.
2. Use the one punctured-sphere relation to eliminate one meridian and identify the N displayed generators.

Acceptance:

- For N=2 this gives a rank-two free group.

Source: CDT25, Published p.674; Proposition 5.2.1..

#### The power-map stabilizer group

Declaration: `ConformalMappingPartII:F0/power-stabilizer-group` (definition).

Let Φ̃_N=⟨Γ̃_N,r̃_N⟩≤PSL₂(ℝ); by the deck presentation it equals ⟨r̃_N,t̃_N⟩. Its disc conjugate is Φ_N. The definition uses the existing projective action and subgroup closure; it is the paper-specific orientation-preserving (N,∞,∞) group, not a newly defined generic triangle-group theory.

Dependencies: ConformalMappingPartII:F0/free-deck-presentation, ConformalMappingPartII:U0/rotation-equivariance, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action.

Construction or proof:

1. Take subgroup closure of the deck group and the source rotation.
2. Use the free-generator conjugacy presentation to reduce to r̃_N,t̃_N.

Uses:

- CDT Corollary 5.2.4: Describe the invariance group of F_N^N.
- CDT Lemma 5.2.18: Apply discreteness and Shimizu to the group containing both rotation and cusp translation.

API:

- `TauCeti.ConformalPartII.PowerStabilizer.containsDeck` (relation): Γ̃_N≤Φ̃_N.
- `TauCeti.ConformalPartII.PowerStabilizer.generators` (characterisation): Φ̃_N=⟨r̃_N,t̃_N⟩.
- `TauCeti.ConformalPartII.PowerStabilizer.discConjugate` (compatibility): Conjugation through C identifies the half-plane and disc actions.
- `TauCeti.ConformalPartII.PowerStabilizer.deckIndex` (relation): [Φ̃_N:Γ̃_N]=N.

Unit tests:

- `TauCeti.ConformalPartII.PowerStabilizer.two` (computation): For N=2 the quotient Φ̃_2/Γ̃_2 has order two.
- `TauCeti.ConformalPartII.PowerStabilizer.rotationOrder` (characterisation): The image of r̃_N in the quotient has exact order N.
- `TauCeti.ConformalPartII.PowerStabilizer.notDeck` (non-example): For N≥2, r̃_N fixes i and is not a nontrivial deck transformation of the unramified cover.

Acceptance:

- The projective action is the supplier’s public action.

Source: CDT25, Published p.674; Deﬁnition 5.2.3..

#### The largest invariance group of the power cover

Declaration: `ConformalMappingPartII:F0/largest-power-stabilizer` (theorem).

F̃_N^N is invariant under Φ̃_N, and any g∈PSL₂(ℝ) satisfying F̃_N(gτ)^N=F̃_N(τ)^N for all τ∈ℍ lies in Φ̃_N. Hence Φ̃_N is exactly its full orientation-preserving invariance group and is discrete.

Dependencies: ConformalMappingPartII:F0/power-stabilizer-group, ConformalMappingPartII:U0/power-descent, ConformalMappingPartII:U0/cover-etale, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action.

Construction or proof:

1. Show invariance for the displayed generators.
2. On a connected set where F̃_N≠0, the quotient F̃_N∘g/F̃_N is a constant Nth root of unity.
3. Compose with the inverse source rotation to obtain a deck transformation; identify the whole group.

Acceptance:

- Use the full Φ̃_N in Shimizu, rather than only Γ̃_N.

Source: CDT25, Published p.675; Corollary 5.2.4..

#### The fundamental quadrilateral

Declaration: `ConformalMappingPartII:F0/quadrilateral-domain` (theorem).

The fundamental domain of Φ_N is the hyperbolic quadrilateral with vertices 0,exp(−πi/N),1,exp(πi/N), in that cyclic order. Its half-plane image has vertices i,−cot(π/(2N)),i∞,cot(π/(2N)), up to boundary orientation, and area 2π−2π/N.

Dependencies: ConformalMappingPartII:F0/power-stabilizer-group, ConformalMappingPartII:F0/ideal-polygon, ConformalMappingPartII:U0/cayley-coordinate, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups.

Construction or proof:

1. Divide the ideal deck polygon into N rotational sectors.
2. Identify paired sides and the elliptic angle 2π/N at zero.
3. Apply the supplier’s polygon area formula.

Acceptance:

- The elliptic point has order N and the quotient has two cusps.

Source: CDT25, Published p.675; Corollary 5.2.4..

#### The half-rotation involution

Declaration: `ConformalMappingPartII:F0/half-rotation-involution` (theorem).

Let s̃ be the rotation about i of projective order 2N satisfying s̃²=r̃_N, and let s be its disc conjugate. Then 1−F̃_N(s̃τ)^N=1/(1−F̃_N(τ)^N) for τ∈ℍ. All denominators are nonzero because the covering omits μ_N.

Dependencies: ConformalMappingPartII:F0/quadrilateral-domain, ConformalMappingPartII:U0/power-descent, ConformalMappingPartII:U0/rotation-equivariance, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups.

Construction or proof:

1. Use the reflection and half-rotation of the symmetric quadrilateral.
2. Identify the induced target permutation of the two cusps and zero and its Möbius transformation.
3. Extend the resulting identity analytically.

Acceptance:

- At τ=i both sides are 1.

Source: CDT25, Published p.675; Lemma 5.2.6..

#### The index-two triangle supergroup

Declaration: `ConformalMappingPartII:F0/index-two-supergroup` (construction).

Set Ψ̃_N=⟨s̃,t̃_N⟩. Then Φ̃_N is normal of index two in Ψ̃_N, and a fundamental domain for the disc action is the geometric triangle with vertices 0,1,exp(πi/N) and angles π/N,0,0. Distinguish this geometric triangle from Φ̃_N’s (N,∞,∞) orbifold signature; the full reflection group is not a subgroup of PSL₂(ℝ).

Dependencies: ConformalMappingPartII:F0/half-rotation-involution, ConformalMappingPartII:F0/power-stabilizer-group, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups.

Construction or proof:

1. Adjoin the half-rotation and use the involution identity to show it normalizes Φ̃_N.
2. Cut the quadrilateral into two congruent triangles and verify the cosets.

Uses:

- CDT Remark 5.2.8 and Lemma 5.2.18: Control the half-rotation and the exceptional cusp region.

API:

- `TauCeti.ConformalPartII.TriangleSupergroup.generators` (constructor): Ψ̃_N is generated by s̃ and t̃_N.
- `TauCeti.ConformalPartII.TriangleSupergroup.index` (relation): [Ψ̃_N:Φ̃_N]=2.
- `TauCeti.ConformalPartII.TriangleSupergroup.triangle` (data): The specified triangle is a measurable fundamental domain.
- `TauCeti.ConformalPartII.TriangleSupergroup.orientation` (compatibility): This is the orientation-preserving projective action; reflection constructions are consumed through the existing triangle theory.

Unit tests:

- `TauCeti.ConformalPartII.TriangleSupergroup.twoAreas` (computation): For N=2 the Φ area is π and the Ψ area is π/2.
- `TauCeti.ConformalPartII.TriangleSupergroup.halfRotation` (characterisation): The nontrivial coset is represented by s̃, whose square lies in Φ̃_N.
- `TauCeti.ConformalPartII.TriangleSupergroup.reflection` (non-example): An antiholomorphic reflection is not an element of PSL₂(ℝ).

Acceptance:

- The triangle has area π−π/N.

Source: CDT25, Published p.675; Remark 5.2.8..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Polygon/reflection identification and involution.
- Resolve the requested supplier interfaces: tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit, tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

### V0 — Counting and characteristic on the disc

Inputs: ConformalMappingPartII:L0.

#### The disc-local pole-counting function

Declaration: `ConformalMappingPartII:V0/disc-counting` (definition).

For f meromorphic on 𝔻 and 0<r<1 set D_r=−min(divisor(f,closedBall(0,r)),0), the negative part of the native integer local divisor. Define N_D(r,f)=Σᶠ_a D_r(a)log(r·|a|⁻¹)+D_r(0)log r. Native totalized log makes the summand at a=0 zero; the separate centre term restores its pole weight. Poles on |a|=r have weight zero. No extension of the disc divisor to a globally locally finite divisor is required.

Dependencies: mathlib:MeromorphicOn.divisor, mathlib:MeromorphicOn.divisor_ball_support_finite, mathlib:MeromorphicOn.divisor_restrict, mathlib:ValueDistribution.logCounting.

Construction or proof:

1. Use the native closed-ball divisor, whose support is finite by compactness.
2. Take its pole multiplicities and the finite logarithmically weighted sum.
3. Add the centre correction explicitly and record the valid meromorphic/radius guards.

Uses:

- CDT Lemma 6.1.2: Prove regular-at-zero positivity and the first main theorem.
- CDT (6.1.6) and §6.2: Transfer pole multiplicities through powers and rational maps.

API:

- `TauCeti.ConformalPartII.discCounting.poleSum` (characterisation): For f meromorphic on 𝔻 and 0<r<1, N_D=Σ_(0<|a|<r)ord⁻_a(f)log(r/|a|)+ord⁻_0(f)log r.
- `TauCeti.ConformalPartII.discCounting.globalComparison` (compatibility): If f is meromorphic on all ℂ, N_D(r,f)=ValueDistribution.logCounting f ∞ r for 0<r<1.
- `TauCeti.ConformalPartII.discCounting.restriction` (functoriality): For two meromorphic functions equal near the closed disc of radius r, their N_D values agree.
- `TauCeti.ConformalPartII.discCounting.power` (relation): For f meromorphic on 𝔻 and n∈ℕ, N_D(r,f^n)=nN_D(r,f).

Unit tests:

- `TauCeti.ConformalPartII.discCounting.zeroPole` (computation): For 0<r<1, N_D(r,z↦1/z)=log r<0.
- `TauCeti.ConformalPartII.discCounting.holomorphic` (degenerate): For the constant one function N_D=0.
- `TauCeti.ConformalPartII.discCounting.boundaryPole` (non-example): For a≠0 and r=|a|<1, N_D(r,z↦1/(z−a))=0 although f has a pole on the boundary circle.

Acceptance:

- The expression can be negative when f has a pole at zero.

Source: CDT25, Published p.679; 6.1.1..

#### Local logarithmic circle integrability

Declaration: `ConformalMappingPartII:V0/local-log-integrability` (lemma).

For f meromorphic on a neighbourhood of the closed radius-r disc with a nonzero meromorphic germ, log|f| and log⁺|f| are circle-integrable. Isolated zeros and poles on the circle are interpreted almost everywhere; changes at their finite point set do not alter circle averages.

Dependencies: mathlib:MeromorphicOn.divisor, mathlib:MeromorphicOn.divisor_ball_support_finite, mathlib:MeromorphicOn.circleAverage_log_norm, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Factor the finite divisor into logarithmic distance singularities plus a zero-free analytic unit.
2. Use integrability of each logarithmic distance singularity and continuity of the remaining log norm.

Acceptance:

- A simple zero or pole on the integration circle does not invalidate Jensen.

Source: CDT25, Published p.680; Proof..

#### Radial monotonicity of holomorphic proximity

Declaration: `ConformalMappingPartII:V0/holomorphic-proximity-monotone` (lemma).

For holomorphic h on 𝔻 and 0<r≤ρ<1, m(r,h)≤m(ρ,h). The positive log norm is subharmonic; this supplies the small-radius transfer used to remove 1/r from the logarithmic derivative estimate.

Dependencies: mathlib:ValueDistribution.proximity, mathlib:DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul, ConformalMappingPartII:L0/herglotz-log.

Construction or proof:

1. Prove the sub-mean inequality for log⁺|h| including isolated zeros by approximation.
2. Average it on the inner circle and integrate the Poisson kernel.

Acceptance:

- For a constant h the two means agree.

Source: CDT25, Published p.683; Corollary 6.2.9..

#### The disc-local characteristic

Declaration: `ConformalMappingPartII:V0/disc-characteristic` (definition).

For f meromorphic on 𝔻 and 0<r<1 define T_D(r,f)=ValueDistribution.proximity f ∞ r+N_D(r,f). Reuse the native proximity function exactly. The local divisor wrapper is the only change from the native global characteristic; do not assert nonnegativity for a general centre pole or manufacture a global meromorphic extension.

Dependencies: ConformalMappingPartII:V0/disc-counting, mathlib:ValueDistribution.proximity, mathlib:ValueDistribution.characteristic.

Construction or proof:

1. Add the native proximity and the local pole count.
2. State its comparison with the global characteristic only under actual global meromorphicity.

Uses:

- CDT Lemma 6.1.2 and Theorem 6.0.1: Use the localized first main theorem and powers in the pivot estimate.

API:

- `TauCeti.ConformalPartII.discCharacteristic.eq` (data): T_D(r,f)=m(r,f)+N_D(r,f), where m is the native ValueDistribution.proximity.
- `TauCeti.ConformalPartII.discCharacteristic.globalComparison` (compatibility): For a globally meromorphic f and 0<r<1, T_D(r,f)=ValueDistribution.characteristic f ∞ r.
- `TauCeti.ConformalPartII.discCharacteristic.holomorphic` (relation): For holomorphic f on 𝔻, T_D(r,f)=m(r,f).
- `TauCeti.ConformalPartII.discCharacteristic.power` (relation): For n∈ℕ and f meromorphic on 𝔻, T_D(r,f^n)=nT_D(r,f).

Unit tests:

- `TauCeti.ConformalPartII.discCharacteristic.constant` (computation): For a nonzero constant c, T_D(r,c)=log⁺|c|.
- `TauCeti.ConformalPartII.discCharacteristic.identity` (degenerate): For 0<r<1, T_D(r,z↦z)=0.
- `TauCeti.ConformalPartII.discCharacteristic.centrePole` (compatibility): For 0<r<1, T_D(r,z↦1/z)=0: m=−log r cancels N_D=log r.

Acceptance:

- For holomorphic f, T_D is its native proximity.

Source: CDT25, Published p.679; 6.1.1..

#### Pole-counting positivity at a regular centre

Declaration: `ConformalMappingPartII:V0/counting-nonnegative` (lemma).

For f meromorphic on 𝔻 and regular at 0, N_D(r,f)≥0 whenever 0<r<1.

Dependencies: ConformalMappingPartII:V0/disc-counting.

Construction or proof:

1. The centre pole order is zero and each interior nonzero pole has positive logarithmic weight.

Acceptance:

- The regular-at-zero hypothesis excludes the negative log r of 1/z.

Source: CDT25, Published p.679; Lemma 6.1.2..

#### The disc-local Jensen identity

Declaration: `ConformalMappingPartII:V0/local-jensen` (lemma).

For f meromorphic on 𝔻, with nonzero meromorphic germ at 0, and 0<r<1, ∫ log|f|dμ=N_D(r,1/f)−N_D(r,f)+log|c(f,0)|, where c(f,0) is the native nonzero meromorphic trailing coefficient at 0.

Dependencies: ConformalMappingPartII:V0/disc-counting, ConformalMappingPartII:V0/local-log-integrability, mathlib:MeromorphicOn.circleAverage_log_norm, mathlib:MeromorphicOn.divisor_fun_inv.

Construction or proof:

1. Apply the native closed-ball Jensen theorem, since the closed radius-r ball lies inside 𝔻.
2. Split its integer divisor into its positive and negative parts with the matching centre correction.

Acceptance:

- For f=z, the formula reads log r=log r+0.

Source: CDT25, Published p.680; Proof..

#### Translation bound for proximity

Declaration: `ConformalMappingPartII:V0/translation-proximity` (lemma).

For a∈ℂ and circle-integrable local meromorphic f, |m(r,f−a)−m(r,f)|≤log⁺|a|+log 2. This follows from the pointwise positive-log triangle bound, including zeros via totalized log⁺.

Dependencies: mathlib:ValueDistribution.proximity, ConformalMappingPartII:V0/local-log-integrability.

Construction or proof:

1. Use |f−a|≤2max(|f|,|a|) and its reversed version.
2. Integrate the two pointwise positive-log inequalities.

Acceptance:

- For a=0 the exact difference is zero.

Source: CDT25, Published p.680; Proof..

#### Vanishing of the local pole count

Declaration: `ConformalMappingPartII:V0/zero-counting-criterion` (lemma).

For f meromorphic on 𝔻 and regular at 0, N_D(r,f)=0 iff f is holomorphic on the open disc |z|<r. A pole on |z|=r has zero weight and is permitted; no closed-disc holomorphicity is inferred.

Dependencies: ConformalMappingPartII:V0/counting-nonnegative, mathlib:MeromorphicOn.divisor.

Construction or proof:

1. Vanishing of a sum of nonnegative weights eliminates exactly the interior pole orders.
2. Use the local meromorphic-order criterion for removable singularities.

Acceptance:

- 1/(z−a) with |a|=r is the boundary counterexample.

Source: CDT25, Published p.679; Lemma 6.1.2..

#### The local first main inversion identity

Declaration: `ConformalMappingPartII:V0/local-first-main-inversion` (theorem).

For f meromorphic on 𝔻 with nonzero germ at 0 and 0<r<1, T_D(r,f)−T_D(r,1/f)=log|c(f,0)|. Neither global meromorphicity nor a regular centre is required; the trailing coefficient must be finite and nonzero.

Dependencies: ConformalMappingPartII:V0/disc-characteristic, ConformalMappingPartII:V0/local-jensen, ConformalMappingPartII:V0/local-log-integrability, mathlib:ValueDistribution.proximity, mathlib:ValueDistribution.characteristic_sub_characteristic_inv_of_ne_zero.

Construction or proof:

1. Use log⁺|f|−log⁺|1/f|=log|f| almost everywhere.
2. Insert local Jensen and cancel the two pole counts.
3. Compare to the existing global theorem under a genuine global hypothesis.

Acceptance:

- For f=2z⁻¹ the difference of the two characteristics is log 2.

Source: CDT25, Published p.679; Lemma 6.1.2..

#### The local characteristic power law

Declaration: `ConformalMappingPartII:V0/power-law` (lemma).

For f meromorphic on 𝔻, n∈ℕ and 0<r<1, T_D(r,f^n)=nT_D(r,f). For n=0 both sides are zero. Pole and zero multiplicities and positive log norms scale by n.

Dependencies: ConformalMappingPartII:V0/disc-characteristic, mathlib:MeromorphicOn.divisor_fun_pow, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Scale the local pole divisor using the native divisor power theorem.
2. Use log⁺|f^n|=nlog⁺|f| in the circle mean.

Acceptance:

- The formula is valid for centre poles as well as holomorphic functions.

Source: CDT25, Published p.680; Lemma 6.1.7..

#### The translated local first main theorem

Declaration: `ConformalMappingPartII:V0/local-first-main-translation` (theorem).

For f meromorphic on 𝔻 with f−a having a nonzero germ at 0, and 0<r<1, |T_D(r,f)−T_D(r,1/(f−a))−log|c(f,a)||≤log⁺|a|+log 2. The coefficient is the nonzero leading meromorphic coefficient of f−a; the identically constant f=a case is excluded.

Dependencies: ConformalMappingPartII:V0/local-first-main-inversion, ConformalMappingPartII:V0/translation-proximity, ConformalMappingPartII:V0/disc-counting.

Construction or proof:

1. Subtracting a finite constant preserves the pole divisor.
2. Apply inversion to f−a and bound its proximity difference from f.

Acceptance:

- For a=0 this reduces to the exact inversion identity.

Source: CDT25, Published p.679; Lemma 6.1.2..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Local divisor/order comparison and circle integrability.
- Establish Subharmonic monotonicity adapter.
- Discharge the admitted prerequisite chains and verify their native interfaces.

### G0 — Cusp geometry and maximum growth

Inputs: ConformalMappingPartII:F0, ConformalMappingPartII:H0, ConformalMappingPartII:R0, ConformalMappingPartII:U0, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

#### Uniform cusp asymptotics of the inverse ratio

Declaration: `ConformalMappingPartII:G0/uniform-ratio-asymptotic` (theorem).

For M₀>0 there is C(M₀) such that for all N≥2, M≥M₀ and 0<|x|<e^(−MN), on a compatible logarithmic branch, |s_N(1−x)/γ_N−(1−x)^(1/N)(−log x−2γ−2ψ(a_+))/(−log x−2γ−2ψ(a_−))|≤C(M₀)|x|/N. Here γ is Euler’s constant and a_±=(N±1)/(2N).

Dependencies: ConformalMappingPartII:H0/zero-balanced-continuation, ConformalMappingPartII:H0/pochhammer-remainder, ConformalMappingPartII:R0/gamma-alternative, mathlib:Complex.digamma_one.

Construction or proof:

1. Separate the corrected k=0 terms in the zero-balanced expansions.
2. Use uniform parameter-derivative remainder bounds to compare a_+ and a_−.
3. Control the denominator in the stated exponentially small region and divide.

Acceptance:

- The constant term is 2ψ(1)=−2γ.

Source: CDT25, Published p.676; Lemma 5.2.9..

#### Disc diameter of a transformed horoball

Declaration: `ConformalMappingPartII:G0/horoball-diameter` (theorem).

For D>0 and a projective real determinant-one matrix g=[a b;c d], C⁻¹(g{Im τ≥D}) is a disc tangent to the unit circle at (a−ic)/(a+ic), with Euclidean diameter E(g,D)=2/(1+D(a²+c²)). In particular E≤2/(D(a²+c²)).

Dependencies: ConformalMappingPartII:U0/cayley-coordinate, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

Construction or proof:

1. Use the projective action and solve the image horoball boundary equation in disc coordinates.
2. Complete the square to read its tangent point and diameter.
3. Use a²+c²>0 for a determinant-one matrix.

Acceptance:

- For g=1 the diameter is 2/(1+D).

Source: CDT25, Published p.677; Lemma 5.2.16..

#### Shimizu for the power-map group

Declaration: `ConformalMappingPartII:G0/shimizu-specialization` (lemma).

For N≥2 and every determinant-one representative [a b;c d] of an element of the discrete group Φ̃_N, h_N(|a|+|c|)≥1, where h_N=2cot(π/(2N)). The generic supplier input is: in a discrete PSL₂(ℝ) group containing translation by h>0, every c≠0 satisfies |c|≥1/h.

Dependencies: ConformalMappingPartII:F0/largest-power-stabilizer, ConformalMappingPartII:F0/primitive-cusp-width, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

Construction or proof:

1. Apply the generic Shimizu inequality to Φ̃_N, which contains t̃_N.
2. For c=0 use discreteness, the cusp stabilizer and determinant one to obtain |a|=1.
3. Combine both cases with h_N≥1.

Acceptance:

- The discrete containing group is Φ̃_N; Γ̃_N alone does not supply the rotation products.

Source: CDT25, Published p.678; Shimizu.

#### Height near a small cusp value

Declaration: `ConformalMappingPartII:G0/cusp-height` (theorem).

For M₀>0 and 0<ε<1, there is an effective N₀(ε,M₀) such that, for N≥N₀, M≥M₀ and τ in the fundamental quadrilateral Ω̃′_N, |F̃_N(τ)^N−1|<e^(−MN) implies Im τ>2N²M(1−ε)/π².

Dependencies: ConformalMappingPartII:G0/uniform-ratio-asymptotic, ConformalMappingPartII:F0/quadrilateral-domain, ConformalMappingPartII:U0/cayley-coordinate, mathlib:Complex.digamma_one_sub.

Construction or proof:

1. Apply the inverse asymptotic with X=1−F̃_N(τ)^N and convert through the Cayley coordinate.
2. Use ψ(a_+)−ψ(a_−)=πtan(π/(2N)) and its small-angle expansion.
3. Retain the corrected −2γ term inside the bounded remainder and choose N₀ effectively.

Acceptance:

- The conclusion is only for sufficiently large N.

Source: CDT25, Published p.676; Lemma 5.2.12..

#### The paper-specific exceptional cusp set

Declaration: `ConformalMappingPartII:G0/exceptional-cusp-set` (construction).

For N,M define S(M,N)={z∈𝔻:|F_N(z)^N−1|<e^(−MN)}. For sufficiently large N it is contained in the union of the Φ_N-translates of the cusp horoball with D comparable to N²M. Large values |F_N(z)|>e^M+1 lie in the rotated set sS(M,N), by the half-rotation involution.

Dependencies: ConformalMappingPartII:G0/cusp-height, ConformalMappingPartII:G0/horoball-diameter, ConformalMappingPartII:G0/shimizu-specialization, ConformalMappingPartII:F0/half-rotation-involution, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

Construction or proof:

1. Move each point to the quadrilateral by the full Φ group and apply cusp height.
2. Bound every translated horoball diameter using the specialized Shimizu estimate.
3. Use the involution to move the large-value set into the rotated exceptional set.

Uses:

- CDT proof of Lemma 5.2.18: Exclude both the cusp-value and rotated large-value regions from a fixed inner disc.

API:

- `TauCeti.ConformalPartII.ExceptionalCuspSet.mem` (characterisation): z∈S(M,N) iff |F_N(z)^N−1|<e^(−MN).
- `TauCeti.ConformalPartII.ExceptionalCuspSet.horoballContainment` (relation): For the source large-N threshold, S is contained in the specified Φ-translated cusp horoballs.
- `TauCeti.ConformalPartII.ExceptionalCuspSet.rotatedLargeValues` (relation): |F_N(z)|>e^M+1 implies z∈sS(M,N).
- `TauCeti.ConformalPartII.ExceptionalCuspSet.radiusInvariant` (compatibility): The source rotation s preserves |z|, so exclusion of S from |z|≤r also excludes sS.

Unit tests:

- `TauCeti.ConformalPartII.ExceptionalCuspSet.origin` (non-example): For M>0, 0∉S(M,N), since |F_N(0)^N−1|=1>e^(−MN).
- `TauCeti.ConformalPartII.ExceptionalCuspSet.rotationRadius` (computation): For any z, |sz|=|z|.
- `TauCeti.ConformalPartII.ExceptionalCuspSet.largeValueThreshold` (characterisation): If |F_N(z)|^N>1+e^(MN), then |1−F_N(s⁻¹z)^N|<e^(−MN).

Acceptance:

- The unrotated S is not the asserted location of the large-value set.

Source: CDT25, Published p.678; Lemma 5.2.18..

#### Excluding the cusp horoballs

Declaration: `ConformalMappingPartII:G0/exceptional-set-exclusion` (lemma).

There are effective absolute A,N₀ such that for all N≥N₀, 0<r<1 and M=N/(1−r), neither S(M,N) nor sS(M,N) meets the closed radius-r disc. All the translated horoballs have diameter ≤A(1−r)/N<1−r after increasing N₀.

Dependencies: ConformalMappingPartII:G0/exceptional-cusp-set, ConformalMappingPartII:G0/horoball-diameter, ConformalMappingPartII:G0/shimizu-specialization.

Construction or proof:

1. Combine D≈N²M and the projective-entry lower bound to obtain E≤A′/M.
2. Set M=N/(1−r), choose N₀>A′ and use tangency to keep every horoball outside |z|≤r.
3. Transfer the exclusion through the modulus-preserving rotation.

Acceptance:

- Choosing a strict diameter inequality avoids equality at the inner circle.

Source: CDT25, Published p.678; Lemma 5.2.18..

#### The large-N maximum growth bound

Declaration: `ConformalMappingPartII:G0/large-n-maximum-growth` (theorem).

There exist effectively computable absolute C,N₀ such that for all integers N≥N₀ and 0<r<1, sup_(|z|=r)log|F_N(z)|≤CN/(1−r). This is the large-N statement of Lemma 5.2.18; the proof does not establish it for every N≥2.

Dependencies: ConformalMappingPartII:G0/exceptional-set-exclusion.

Construction or proof:

1. If a value exceeds exp(M)+1, its Nth power differs from one by more than exp(MN), so it enters the forbidden rotated set.
2. Set M=N/(1−r), so log|F_N|≤log(exp(M)+1)≤M+log 2.

Acceptance:

- The original large-N quantifier is preserved.

Source: CDT25, Published p.678; Lemma 5.2.18..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Quantitative Shimizu shared extension.
- Establish Uniform cusp constants and horoball control.
- Resolve the requested supplier interfaces: tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action, tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates.

### M0 — Logarithmic derivatives and uniform mean growth

Inputs: ConformalMappingPartII:G0, ConformalMappingPartII:L0, ConformalMappingPartII:R0, ConformalMappingPartII:U0, ConformalMappingPartII:V0.

#### The inverse-square kernel mean

Declaration: `ConformalMappingPartII:M0/inverse-square-kernel-mean` (lemma).

For 0<r<R and |w|=R, the normalized circle mean ∫_(|z|=r)|z−w|^(−2)dμ(z)=1/(R²−r²). This is the exact kernel integral used in the logarithmic-derivative proof.

Dependencies: mathlib:DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul.

Construction or proof:

1. Scale and rotate the circles.
2. Integrate the real Poisson kernel, whose mean is one; divide by R²−r².

Acceptance:

- For r=1,R=2 the mean is 1/3.

Source: CDT25, Published p.681; R2.

#### Boundary L1 control of the logarithm

Declaration: `ConformalMappingPartII:M0/boundary-log-l1` (lemma).

For g holomorphic and zero-free near the closed radius-R disc with g(0)=1, ∫_(|w|=R)|log|g(w)||dμ(w)=2m(R,g). The mean of log|g| is zero, so its positive and negative parts have equal means.

Dependencies: ConformalMappingPartII:L0/herglotz-log, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Evaluate the real Herglotz/Jensen identity at zero.
2. Split the real logarithm into its positive and negative parts and add the means.

Acceptance:

- For g=1 both sides vanish.

Source: CDT25, Published p.681; (6.1.11).

#### The logarithmic mean estimate

Declaration: `ConformalMappingPartII:M0/entropy-log-mean` (lemma).

For nonnegative circle-integrable H and normalized Haar measure, ∫log⁺H≤log⁺(∫H)+1/e. Equivalently control the entropy of the region H≥1 before applying Jensen there; retain a harmless absolute constant if the measure-zero region occurs.

Dependencies: ordinary complex arithmetic and differentiation.

Construction or proof:

1. Let α be the measure of {H≥1}; apply concavity of log with its normalized restricted measure.
2. Use −αlog α≤1/e and split whether ∫H is at most or above one.

Acceptance:

- For H=0 the left side is zero under the positive-log convention.

Source: CDT25, Published p.681; Jensen.

#### Uniform transfer from small radii

Declaration: `ConformalMappingPartII:M0/small-radius-transfer` (lemma).

For 0<r<1 put ρ=max(r,1/4) and R=(1+r)/2. Then ρ≥1/4, ρ<R and R−ρ≥(1−r)/4. If h is holomorphic on 𝔻, m(r,h)≤m(ρ,h), allowing the log-derivative bound at ρ to remove its 1/r factor uniformly.

Dependencies: ConformalMappingPartII:V0/holomorphic-proximity-monotone.

Construction or proof:

1. Check the inequalities separately for r≥1/4 and r<1/4.
2. Apply monotonicity to the holomorphic derivative ratios used below.

Acceptance:

- At r=1/8, ρ=1/4 and R=9/16; no log(1/r) remains in the bound.

Source: CDT25, Published p.683; Corollary 6.2.9..

#### The pivot rational function

Declaration: `ConformalMappingPartII:M0/pivot-map` (definition).

For N≥2 set p_N(x)=x^N/(x^N−1) on ℂ∖μ_N. Its companion maps are q_N(x)=x^N and u_N(x)=1/(x^N−1), with p_N=1+u_N. The native rational expression can be totalized at roots, but all analytic statements retain the omitted-root guard.

Dependencies: ordinary complex arithmetic and differentiation.

Construction or proof:

1. Use the explicit rational function on its pole-free domain.
2. Keep its source guard when composing with the cover.

Uses:

- CDT (6.2.4)–(6.2.8): Multiply the two controlled derivative ratios and compare to N times the cover characteristic.

API:

- `TauCeti.ConformalPartII.pivotMap.formula` (simp): p_N(x)=x^N/(x^N−1) when x^N≠1.
- `TauCeti.ConformalPartII.pivotMap.companion` (relation): p_N=1+u_N on the omitted-root domain.
- `TauCeti.ConformalPartII.pivotMap.poleSet` (characterisation): For N≥2 its N poles are the distinct Nth roots of unity.
- `TauCeti.ConformalPartII.pivotMap.coverComposition` (compatibility): p_N∘F_N is holomorphic on 𝔻 because F_N omits every pole.

Unit tests:

- `TauCeti.ConformalPartII.pivotMap.zero` (degenerate): p_N(0)=0 for N≥2.
- `TauCeti.ConformalPartII.pivotMap.twoAtTwo` (computation): p_2(2)=4/3.
- `TauCeti.ConformalPartII.pivotMap.rootPole` (non-example): x=1 is a genuine pole of the analytic rational map; a totalized field value there is not its analytic extension.

Acceptance:

- p_N(0)=0 and its pole set is μ_N.

Source: CDT25, Published p.682; (6.2.4).

#### Effective mean growth at fixed omitted sets

Declaration: `ConformalMappingPartII:M0/fixed-level-mean-input` (theorem).

For each fixed N≥2 there is an effectively computable C_N such that T_D(r,F_N^N)≤C_N log(N/(1−r)) for all 0<r<1. This is the fixed-puncture Tsuji/Kraus–Roth input; its original proof must be supplied with an effective constant and the small-radius range, not inferred from the large-N lemma.

Dependencies: ConformalMappingPartII:U0/roots-cover, ConformalMappingPartII:V0/disc-characteristic.

Construction or proof:

1. Establish the stated fixed-omitted-set value-distribution theorem for the cover and its finite power.
2. Control small radii by continuity and vanishing at zero, with an explicit constant.

Acceptance:

- The statement is a recorded proof obligation until its public source and effective dependence are verified.

Source: CDT25, Published p.678; [Tsu52.

#### The pole divisor of the covering logarithmic derivative

Declaration: `ConformalMappingPartII:M0/etale-pole-count` (lemma).

For N≥2 and 0<r<1, N_D(r,F_N′/F_N)=N_D(r,1/F_N). All zeros of F_N are simple because F_N′ is nonzero; their poles in the logarithmic derivative have order one. The reciprocal F_N/F_N′ is holomorphic and has zero pole count.

Dependencies: ConformalMappingPartII:U0/cover-etale, ConformalMappingPartII:V0/disc-counting, mathlib:MeromorphicOn.divisor.

Construction or proof:

1. Compare the local meromorphic orders at a zero of F_N and at every other point.
2. Use the same pole multiplicities and centre term in the local weighted sums.

Acceptance:

- At zero the logarithmic derivative has pole order one and leading coefficient one.

Source: CDT25, Published p.683; (6.2.13).

#### The zero-free logarithmic derivative estimate

Declaration: `ConformalMappingPartII:M0/normalized-log-derivative` (theorem).

For g holomorphic and zero-free near the closed radius-R disc, g(0)=1 and 0<r<R, m(r,g′/g)≤log⁺((m(R,g)/r)·R/(R−r))+log 2+1/e. Use ≤ in the reusable signature; the source states the corresponding strict bound.

Dependencies: ConformalMappingPartII:L0/herglotz-derivative, ConformalMappingPartII:M0/inverse-square-kernel-mean, ConformalMappingPartII:M0/boundary-log-l1, ConformalMappingPartII:M0/entropy-log-mean, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Apply the derivative Herglotz formula, integrate its inverse-square kernel exactly and obtain ∫|g′/g|≤4Rm(R,g)/(R²−r²).
2. Use the L1 identity and Fubini to bound the mean controlling log⁺.
3. Apply the entropy estimate and simplify constants.

Acceptance:

- For g=e^z the left side is zero; for g=1 it is also zero.

Source: CDT25, Published p.680; Lemma 6.1.7..

#### The pivot partial-fraction identity

Declaration: `ConformalMappingPartII:M0/pivot-partial-fractions` (lemma).

For N≥2 and x^N≠1, p_N(x)=(x/N)Σ_(ζ∈μ_N)1/(x−ζ). The roots are distinct over ℂ and the sum is finite.

Dependencies: ConformalMappingPartII:M0/pivot-map.

Construction or proof:

1. Factor x^N−1 into its simple roots.
2. Take its logarithmic derivative and multiply by x/N.

Acceptance:

- For N=2 this is x/2·(1/(x−1)+1/(x+1)).

Source: CDT25, Published p.682; (6.2.4).

#### The pivot chain identity

Declaration: `ConformalMappingPartII:M0/pivot-chain-identity` (lemma).

For f=1−F_N^N and |z|<1, p_N(F_N(z))=(F_N(z)/(NF_N′(z)))·(f′(z)/f(z)). The denominators f,F_N′ and N are nonzero; both sides are zero at z=0.

Dependencies: ConformalMappingPartII:M0/pivot-map, ConformalMappingPartII:U0/cover-etale, ConformalMappingPartII:U0/roots-cover.

Construction or proof:

1. Differentiate f to obtain f′=−NF_N^(N−1)F_N′.
2. Cancel only the proved nonzero denominators and simplify the two signs.

Acceptance:

- The formula remains valid at the zero of F_N.

Source: CDT25, Published p.682; (6.2.4).

#### The pivot characteristic lower bound

Declaration: `ConformalMappingPartII:M0/pivot-characteristic-lower` (lemma).

For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≥N T_D(r,F_N)−log 4.

Dependencies: ConformalMappingPartII:M0/pivot-map, ConformalMappingPartII:V0/power-law, ConformalMappingPartII:V0/local-first-main-translation, ConformalMappingPartII:V0/translation-proximity.

Construction or proof:

1. Apply the first main theorem to F_N^N−1, whose value at zero is −1 and whose leading coefficient has norm one.
2. Compare 1/(F_N^N−1) to p_N∘F_N by the translation 1.
3. Use the power law to identify T_D(r,F_N^N).

Acceptance:

- The additive loss is absolute and independent of N.

Source: CDT25, Published p.682; (6.2.7).

#### The logarithmic derivative of the omitted-value function

Declaration: `ConformalMappingPartII:M0/power-log-derivative` (theorem).

Let f=1−F_N^N, N≥2, and 0<r<1. Set R=(1+r)/2 and L_N(r)=log(max(1,sup_(|z|=R)log⁺|F_N(z)|)). Then m(r,f′/f)≤C(log(N/(1−r))+L_N(r)) for an absolute effective C. f is zero-free and f(0)=1.

Dependencies: ConformalMappingPartII:M0/normalized-log-derivative, ConformalMappingPartII:M0/small-radius-transfer, ConformalMappingPartII:U0/roots-cover, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Apply the normalized derivative bound at ρ to f.
2. Bound m(R,f) by N sup log⁺|F_N|+log 2 and take the positive logarithm.
3. Use the transfer inequalities to absorb the 1/ρ and R/(R−ρ) factors uniformly.

Acceptance:

- The auxiliary nonnegative L_N is a precise totalized version of the source double-log supremum.

Source: CDT25, Published p.683; Corollary 6.2.9..

#### Equivalence of the three mean estimates

Declaration: `ConformalMappingPartII:M0/three-map-equivalence` (lemma).

For N≥2 and each 0<r<1, the characteristics of F_N^N, F_N^N/(F_N^N−1), and 1/(F_N^N−1) differ by an absolute additive constant at most log 4. The translated first main theorem uses c(F_N^N,1)=−1, of modulus one.

Dependencies: ConformalMappingPartII:M0/pivot-characteristic-lower, ConformalMappingPartII:V0/local-first-main-translation, ConformalMappingPartII:V0/translation-proximity, ConformalMappingPartII:U0/roots-cover.

Construction or proof:

1. Compare q−1 and its inverse by the first main theorem.
2. Use p=1+u and the translation proximity bound; all three functions are holomorphic on the disc.

Acceptance:

- No meromorphic global extension or omitted value at the centre is assumed.

Source: CDT25, Published p.682; Theorem 6.0.1..

#### The logarithmic derivative at the omitted value one

Declaration: `ConformalMappingPartII:M0/omitted-linear-log-derivative` (lemma).

For N≥2, g=1−F_N is holomorphic and zero-free on 𝔻 with g(0)=1. For 0<r<1, m(r,F_N′/(1−F_N))≤C(log(N/(1−r))+L_N(r)), using R=(1+r)/2 in L_N.

Dependencies: ConformalMappingPartII:M0/normalized-log-derivative, ConformalMappingPartII:M0/small-radius-transfer, ConformalMappingPartII:U0/roots-cover, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Apply the normalized logarithmic derivative theorem to g=1−F_N, since 1 is an omitted value.
2. Bound the outer mean of g by the supremum log⁺|F_N|+log 2 and apply the small-radius transfer.

Acceptance:

- The proof uses the unit 1−F_N; it does not require a separate Cauchy estimate for F_N′.

Source: CDT25, Published p.683; Corollary 6.2.11..

#### The covering derivative reciprocal bound

Declaration: `ConformalMappingPartII:M0/inverse-cover-derivative` (theorem).

For N≥2 and 0<r<1, m(r,F_N/F_N′)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)), where the outer radius in L_N is (1+r)/2. The ratio is holomorphic since F_N′ never vanishes.

Dependencies: ConformalMappingPartII:M0/omitted-linear-log-derivative, ConformalMappingPartII:M0/etale-pole-count, ConformalMappingPartII:U0/cover-etale, ConformalMappingPartII:V0/local-first-main-inversion, ConformalMappingPartII:R0/log-radius-series, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Use F_N′/F_N=(F_N′/(1−F_N))·(1/F_N−1) and the zero-free derivative bound for 1−F_N.
2. Use local inversion for F_N′/F_N, whose trailing coefficient is one, and the étale identity for its pole count.
3. Combine m(1/F_N)+N_D(1/F_N)=T_D(F_N)−log γ_N≤T_D(F_N), using γ_N>1 from its positive log series.

Acceptance:

- For a simple zero at zero, F_N′/F_N has leading coefficient one, so no unidentified log coefficient appears.

Source: CDT25, Published p.683; Corollary 6.2.11..

#### The pivot characteristic upper bound

Declaration: `ConformalMappingPartII:M0/pivot-characteristic-upper` (lemma).

For N≥2 and 0<r<1, T_D(r,p_N∘F_N)≤T_D(r,F_N)+C(log(N/(1−r))+L_N(r)). All three composed factors are holomorphic, so their characteristics are proximity means.

Dependencies: ConformalMappingPartII:M0/pivot-chain-identity, ConformalMappingPartII:M0/power-log-derivative, ConformalMappingPartII:M0/inverse-cover-derivative, ConformalMappingPartII:V0/disc-characteristic, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Take positive log norms of the product in the pivot chain identity.
2. Discard the nonpositive contribution −log N and apply the two derivative-ratio bounds.

Acceptance:

- The coefficient of T_D(r,F_N) is one.

Source: CDT25, Published p.684; Corollary 6.2.9..

#### The large-N mean-growth estimate

Declaration: `ConformalMappingPartII:M0/large-n-mean` (theorem).

For N≥N₀ of the maximum-growth theorem and 0<r<1, T_D(r,F_N^N)≤C log(N/(1−r)), with an effective absolute C. The large-N maximum bound on the outer circle gives L_N(r)≤C′log(N/(1−r)).

Dependencies: ConformalMappingPartII:M0/pivot-characteristic-lower, ConformalMappingPartII:M0/pivot-characteristic-upper, ConformalMappingPartII:G0/large-n-maximum-growth, ConformalMappingPartII:V0/power-law.

Construction or proof:

1. Evaluate the maximum estimate at R=(1+r)/2 and bound its nonnegative double logarithm.
2. Subtract the one copy of T_D(F_N) from the N-copy lower bound.
3. Use N/(N−1)≤2 for every N≥2 before applying the power law.

Acceptance:

- The absorption never divides by N−1 when N=1.

Source: CDT25, Published p.684; Lemma 5.2.18..

#### Completing the finitely many small levels

Declaration: `ConformalMappingPartII:M0/finite-level-completion` (lemma).

Given the large-N effective constants C,N₀ and effective fixed-level constants C_N for 2≤N<N₀, the maximum of C and that finite list is an effective absolute constant proving T_D(r,F_N^N)≤C*log(N/(1−r)) for every N≥2 and 0<r<1.

Dependencies: ConformalMappingPartII:M0/large-n-mean, ConformalMappingPartII:M0/fixed-level-mean-input.

Construction or proof:

1. Enumerate the finitely many levels below the explicit threshold.
2. Take the finite maximum and combine the two quantified estimates.

Acceptance:

- This is the explicit quantifier bridge missing from a large-N-only argument.

Source: CDT25, Published p.679; Theorem 6.0.1..

#### Uniform mean growth of the covering powers

Declaration: `ConformalMappingPartII:M0/uniform-mean-growth` (theorem).

There is an effectively computable absolute C such that for every integer N≥2, 0<r<1 and p∈{x↦x^N,x↦x^N/(x^N−1),x↦1/(x^N−1)}, the normalized circle mean ∫_(|z|=r)log⁺|p(F_N(z))|dμ_Haar(z)≤C log(N/(1−r)). The cover is normalized at zero; the bound is independent of its source rotation.

Dependencies: ConformalMappingPartII:M0/finite-level-completion, ConformalMappingPartII:M0/three-map-equivalence, ConformalMappingPartII:U0/pointed-cover-uniqueness, mathlib:ValueDistribution.proximity.

Construction or proof:

1. Use finite-level completion for the first power map.
2. Transfer the estimate to the other two maps and absorb their absolute additive constants using log(N/(1−r))≥log 2.
3. Use the rotation invariance of normalized circle means.

Acceptance:

- The result covers every N≥2 and the whole interval 0<r<1, with a single effective constant.

Source: CDT25, Published p.679; Theorem 6.0.1..

The planning coverage is **planned**. Its exact remaining obligations are:

- Establish Local divisor/order comparison and circle integrability.
- Establish Effective fixed-level completion.
- Discharge the admitted prerequisite chains and verify their native interfaces.

## Baseline and proposed upstream API

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was checked by reading its actual statement at that pin. Definition availability is distinct from a theorem satisfying the localized hypotheses. In particular, global Nevanlinna functions are used for compatibility tests only when the function is genuinely meromorphic on all of ℂ.

- `tauceti:TauCeti.IsAnalyticContinuationAlong`: Continuous transport of analytic germs along a path; does not give ODE continuation existence.
- `tauceti:TauCeti.UniversalCover`: Endpoint/path-homotopy-class topological universal-cover carrier.
- `tauceti:TauCeti.UniversalCover.isCoveringMap`: Projection is a covering for locally path-connected, path-connected, semilocally simply connected spaces.
- `tauceti:TauCeti.UniversalCover.simplyConnectedSpace`: The same universal cover is simply connected under the stated local hypotheses.
- `tauceti:TauCeti.riemannMapping`: Holomorphic disc bijection for a simply connected proper open domain, with nonzero derivative.
- `tauceti:TauCeti.IsNormalizedRiemannMapOn`: Normalized domain-to-disc map with base point and positive real derivative; compare its inverse.
- `mathlib:Complex.norm_deriv_le_one_of_mapsTo_ball`: Derivative Schwarz bound for differentiable maps of a ball into the matching closed ball.
- `mathlib:DiffContOnCl.circleAverage_re_herglotzRieszKernel_smul`: Poisson integral formula for complex-differentiable maps continuous on the closed disc.
- `mathlib:hasDerivAt_circleAverage_herglotzRieszKernel_smul`: Derivative of the circle-averaged Herglotz kernel for circle-integrable boundary data.
- `mathlib:MeromorphicOn.circleAverage_log_norm`: Closed-disc Jensen formula using the local divisor and meromorphic trailing coefficient; no global extension needed.
- `mathlib:MeromorphicOn.divisor`: Integer local meromorphic order on a set, totalized to zero for infinite order or invalid meromorphic input.
- `mathlib:MeromorphicOn.divisor_restrict`: Restriction agreement for an actual meromorphic function and a subset.
- `mathlib:MeromorphicOn.divisor_fun_pow`: Power multiplies the local divisor by its natural exponent under MeromorphicOn.
- `mathlib:MeromorphicOn.divisor_fun_inv`: Local divisor of inversion is the negative divisor.
- `mathlib:MeromorphicOn.divisor_ball_support_finite`: Finite divisor support on an open ball when meromorphic on its compact closed ball.
- `mathlib:ValueDistribution.proximity`: Native circle average of positive log norm at the target infinity; usable on disc-local functions.
- `mathlib:ValueDistribution.characteristic`: Native global-divisor characteristic, used only under a global meromorphic comparison hypothesis.
- `mathlib:ValueDistribution.logCounting`: Global-divisor logarithmic pole count; not applicable via arbitrary zero extension of a disc divisor.
- `mathlib:ValueDistribution.characteristic_sub_characteristic_inv_of_ne_zero`: Global meromorphic first-main inversion identity; a localized proof is still required.
- `mathlib:ordinaryHypergeometric`: Native hypergeometric series sum, with junk value zero outside its convergence radius.
- `mathlib:ordinaryHypergeometric_eq_tsum`: Pochhammer/factorial coefficient series for the native hypergeometric function.
- `mathlib:ordinaryHypergeometric_zero`: Native hypergeometric value at zero equals one.
- `mathlib:ordinaryHypergeometricSeries_radius_eq_one`: Radius one when none of a,b,c is a nonpositive integer.
- `mathlib:Complex.digamma`: Native Γ derivative quotient; not a new definition in this roadmap.
- `mathlib:Complex.digamma_one`: ψ(1) is minus Euler’s constant, fixing E2.
- `mathlib:Complex.digamma_one_sub`: Reflection relation away from integer poles.
- `mathlib:Complex.digamma_apply_add_nat`: Finite reciprocal-sum recurrence with all arguments away from poles.
- `mathlib:Real.Gamma`: Native real Gamma function, totalized to zero at nonpositive integer poles.
- `mathlib:Real.Gamma_pos_of_pos`: Strict positivity for positive real Gamma arguments.
- `mathlib:Real.Gamma_mul_Gamma_one_sub`: Real reflection formula.
- `mathlib:Real.Gamma_mul_Gamma_add_half`: Real duplication formula.
- `mathlib:Real.BohrMollerup.tendsto_log_gamma`: Positive-real log Gamma as the limit of finite logarithmic products; Taylor coefficients remain new.
- `tauceti:TauCeti.unitDiscMoebius`: Existing bundled unphased Möbius factor on Complex.UnitDisc; reused for every interior factor.
- `tauceti:TauCeti.coe_unitDiscMoebius`: Exact scalar formula for the existing unit-disc factor, with starRingEnd complex conjugation.
- `mathlib:Complex.Gamma`: Native complex Gamma obtained from its integral and shifted recurrence.
- `mathlib:Complex.Gamma_ne_zero_of_re_pos`: Complex Gamma is nonzero for positive real part, including the unit disc around 1.
- `mathlib:Complex.Gamma_ofReal`: The complex Gamma of a real input equals the native real Gamma under complex coercion.

[24161](https://github.com/leanprover-community/mathlib4/pull/24161): Open Schwarzian proposal personally read in full. Follow its name schwarzian, iteratedDeriv expression and composition theorem shape. It is not in the recorded pinned baseline.

[43859](https://github.com/leanprover-community/mathlib4/pull/43859): Open circle-average positive-log Jensen proposal personally read in full. Its log 2 estimate is a compatible reusable variant; the routed sharper 1/e entropy constant remains a precise target.

## Source corrections

The following six corrections were recorded in the routed extraction and checked against the published passages. The exact printed text, reasoning and inherited correction-search scope are retained in the packet.

**ConformalMappingPartII/E2**, (5.2.10) in Lemma 5.2.9, p.676, and the two displays for τ and Im(τ) in the proof of Lemma 5.2.12, p.677 (published version; the same since arXiv v1). −2γ in place of +2γ, i.e. 2ψ(1) = −2γ, as in the display at the end of the proof of Lemma 5.2.9. Lemma 5.1.20 gives the constant term −log x + 2(ψ(1) − ψ(a)), and the proof of Lemma 5.2.9 writes 2ψ(1). Since ψ(1) = −γ ([AS92, 6.3.2]; Mathlib Complex.digamma_one), the statement's +2γ has the wrong sign. The constant is absorbed into the O(1) of (5.2.13), so nothing downstream changes.

**ConformalMappingPartII/E3**, Proof of Lemma 5.2.9, p.676 (published version; the same since arXiv v1). |ψ(k+1) − ψ(k+a)| > |ψ(k+2) − ψ(k+1+a)|; hence |ψ(k+1) − ψ(k+a)| is maximized at k = 1, a = 1/2 − 1/4. The coefficient in (5.2.11) is ψ(k+1) − ψ(k+a), which is positive and decreasing in k and in a, so over k ≥ 1 and a ∈ {1/2 ± 1/2N} ⊂ [1/4, 3/4] its maximum is at k = 1, a = 1/4, as stated. The printed ψ(k) − ψ(k+a) is increasing in a, so its maximum would be at a = 3/4. Only a uniform bound is needed.

**ConformalMappingPartII/E8**, Proof of Corollary 6.2.11, last line, p.684 (published version; the same since arXiv v1). R := (1 + r)/2. The proof of Corollary 6.2.9 uses R := 1 − (1 − r)/2 = (1 + r)/2, and (6.2.12) has sup over |z| = (1 + r)/2. Lemma 6.1.7 needs r < R, while (1 − r)/2 < r for r > 1/3.

**ConformalMappingPartII/E9**, Proof of Lemma 5.2.18, p.678 (published version; the same in arXiv v4). … is contained in s·S(M, N), the image of S(M, N) under the order-2N rotation s of Lemma 5.2.6. On that set |1 − F_N^N| ≥ |F_N|^N − 1 > e^{MN}, so it is disjoint from S(M, N). By (5.2.7) it lies in s·S(M, N). Since s is a Euclidean rotation of D(0,1) about 0, s·S(M, N) also avoids the closed disc of radius r, and the conclusion stands. arXiv v1 (“contained in the rotation under s of the set S(M, N)”) and v3 (“contained in sS(M, N)”) had it right; the s was lost in v4. In the same proof the Shimizu bound is quoted for γ̃ ∈ Γ̃_N but used for γ ∈ Φ_N; Φ̃_N is discrete and contains t̃_N, so Shimizu's lemma gives the same bound.

**ConformalMappingPartII/E15**, radius-r quotient reconstruction and (2.3.2), p.640 (published JAMS 38 (2025), version read). Multiply the exponential quotient by G(0)/|G(0)|, or state equality only of absolute values. Apply this to both the radius-r reconstruction and (2.3.2). The boundary log|G| determines the zero-free function only up to a constant phase. For G=g=i,B=1, both exponentials equal 1. The unimodular factor repairs the complex identity without changing subsequent norm bounds.

**ConformalMappingPartII/E16**, first line of p.641, proof of Lemma 2.3.1 (published JAMS 38 (2025), version read). Use sup_D log|h| on the left of the displayed mean-logarithm bound. For g=h=1, the printed claim reads 1≤0; the corrected logarithmic left side is 0. Lemma 2.3.1’s statement already uses logarithms and is unchanged.

## Supplier requests and proof obligations

**tauceti:TauCetiRoadmap/ConformalMapping#milestone-l2--schwarz-lemma-extensions**: Disc automorphism classification fixing zero, derivative equality case of Schwarz and the existing pseudo-hyperbolic disc geometry; import the reviewed built interfaces rather than planning them again. Consumers: ConformalMappingPartII:U0/pointed-cover-uniqueness, ConformalMappingPartII:U0/radius-schwarz, ConformalMappingPartII:U0/projective-deck-realization.

**tauceti:TauCetiRoadmap/ConformalMapping#milestone-l3--the-riemann-mapping-theorem-summit**: Existing holomorphic logarithm and root branches on simply connected domains, normalized Riemann map and holomorphic inverse. The Riemann-surface uniformization extension is an own recorded gap, not supplied by planar RMT. Consumers: ConformalMappingPartII:S0/quotient-ode, ConformalMappingPartII:L0/herglotz-log, ConformalMappingPartII:F0/ideal-polygon.

**tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle**: Existing monodromy for analytic continuation and Schwarz reflection across analytic circle sides, preserving the stated holomorphic germs and path endpoints. Consumers: ConformalMappingPartII:O0/path-continuation, ConformalMappingPartII:O0/global-solution-dimension, ConformalMappingPartII:F0/ideal-polygon, ConformalMappingPartII:F0/half-rotation-involution.

**tauceti:TauCetiRoadmap/UniversalCovers#stage-1-close-out-the-universal-cover**: Existing universal-cover projection, local sheets and simply connected total space; reuse the exact Tau Ceti carrier and topology. Consumers: ConformalMappingPartII:U0/cover-complex-structure.

**tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence**: Based covering lift existence and uniqueness, and deck-transform identification of lifts, with the local hypotheses verified for the domain. Consumers: ConformalMappingPartII:U0/pointed-cover-uniqueness, ConformalMappingPartII:U0/projective-deck-realization.

**tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action**: The public effective PSL₂(ℝ) action, proper discontinuity of discrete groups, finite elliptic stabilizers and local biholomorphic quotient on the free locus. Consumers: ConformalMappingPartII:U0/roots-cover, ConformalMappingPartII:U0/rotation-equivariance, ConformalMappingPartII:S0/moebius-invariance, ConformalMappingPartII:F0/ideal-polygon, ConformalMappingPartII:F0/power-stabilizer-group, ConformalMappingPartII:F0/largest-power-stabilizer, ConformalMappingPartII:G0/horoball-diameter, ConformalMappingPartII:U0/projective-deck-realization.

**tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups**: Hyperbolic geodesic polygons, reflected side pairings, Poincaré polygon theorem, faithful presentations, Dirichlet domains, typed finite-or-cusp triangle orders and polygon area. Only the paper-specific symmetric instances are owned here. Consumers: ConformalMappingPartII:F0/ideal-polygon, ConformalMappingPartII:F0/free-deck-presentation, ConformalMappingPartII:F0/quadrilateral-domain, ConformalMappingPartII:F0/half-rotation-involution, ConformalMappingPartII:F0/index-two-supergroup.

**tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates**: Normalized primitive cusp datum and cusp charts, local logarithmic inverse at a puncture and horoball transport. The additional quantitative Shimizu inequality for a discrete group containing z↦z+h is a requested shared extension, recorded separately as FuchsianOrbifolds Part II. Consumers: ConformalMappingPartII:U0/roots-cover, ConformalMappingPartII:S0/hempel-rational, ConformalMappingPartII:R0/cusp-ratio-limit, ConformalMappingPartII:F0/primitive-cusp-width, ConformalMappingPartII:G0/horoball-diameter, ConformalMappingPartII:G0/shimizu-specialization, ConformalMappingPartII:G0/exceptional-cusp-set.

**Complex analytic initial-value construction**: The source invokes the classical complex linear ODE theorem. Its original convergence proof has not been acquired. Supply a locally uniform analytic recursion/Picard proof, initial-jet uniqueness and companion-system equivalence at the stated complex domain generality; a real-time Picard–Lindelöf theorem does not suffice. Needed by: ConformalMappingPartII:O0/initial-value-basis.

**Analytic structure and surface uniformization**: The topological cover and planar RMT are available. The analytic manifold atlas on that exact carrier, the simply connected Riemann-surface uniformization proof and exclusion of plane/sphere alternatives were not established in the available source passages. Acquire a public proof and refine those non-routine interiors without inventing a new topological cover. Needed by: ConformalMappingPartII:U0/cover-complex-structure, ConformalMappingPartII:U0/hyperbolic-uniformization-input.

**Normalized cusp and cover orientation**: The source specifies the base and root-one cusp. Verify the compatible cusp chart, positive derivative orientation and continuation path giving the real radial inverse limit with the actual covering construction. The norm formula is phase-independent, but the analytic germ formula is not. Needed by: ConformalMappingPartII:U0/roots-cover, ConformalMappingPartII:R0/cusp-ratio-limit.

**Hempel rational Schwarzian proof**: CDT quotes Hempel Theorem 3.1 and Lemma 3.3. Their original proof was not read. Supply the logarithmic cusp expansion, branch-independent meromorphic descent, rationality and absence of extra singularities in the finite-S coordinate; the explicit principal-part algebra does not establish these analytic inputs. Needed by: ConformalMappingPartII:S0/hempel-rational.

**Blaschke and radial-smoothing analytic details**: The published proof was read. Establish compact finite-zero enumeration, removal with full multiplicities, rescaling of Blaschke factors on slightly larger circles avoiding zeros, and convergence of their boundary log means through boundary zeros. The open-disc zero-free quotient alone does not give the neighbourhood needed by Herglotz. Needed by: ConformalMappingPartII:L0/blaschke-zero-removal, ConformalMappingPartII:L0/radial-smoothing.

**Native hypergeometric analyticity and ODE**: The native coefficient sum and convergence radius were read, but the termwise first/second derivative interface and coefficient-recursion-to-analytic-equation proof were not established. Verify those at the pinned native series and retain all parameter pole guards. Needed by: ConformalMappingPartII:H0/gauss-equation.

**Zero-balanced connection formula**: The CDT quoted formula was read; the original AS92 15.3.10 proof was not. Acquire a public analytic-continuation proof with the compatible logarithm branch, positive-real parameter interval and overlap comparison to native ordinaryHypergeometric. The native outside-radius junk value is not a continued function. Needed by: ConformalMappingPartII:H0/zero-balanced-continuation.

**Uniform parameter-differentiated series bounds**: Prove the real digamma difference positivity/monotonicity from an actual integral or reciprocal-series formula, then uniform Pochhammer and parameter-derivative tail estimates on [1/4,3/4]. The printed proof does not supply every dominated-differentiation detail required to retain the |x|/N improvement. Needed by: ConformalMappingPartII:H0/digamma-difference-bound, ConformalMappingPartII:H0/pochhammer-remainder.

**Log-Gamma Taylor proof and effective remainder**: CDT invokes AS92 6.1.33. The native finite-product limit is a starting input, not the Taylor theorem. Supply a locally uniform complex logarithmic-product limit, double-sum interchange, zeta coefficient identification and explicit tail/exponential constants proving the positive N⁻⁶ remainder. Needed by: ConformalMappingPartII:R0/log-gamma-taylor, ConformalMappingPartII:R0/positive-radius-expansion.

**Polygon/reflection identification and involution**: The CDT specialization was read. Goluzin’s original circular-polygon computation and Carathéodory’s Schwarz-triangle proof were not read. Verify the actual reflected polygon covering, paired sides and target cusp permutation using the shared supplier interfaces; identify it with the hypergeometric inverse, rather than merely matching vertices or areas. Needed by: ConformalMappingPartII:F0/ideal-polygon, ConformalMappingPartII:F0/half-rotation-involution, ConformalMappingPartII:F0/index-two-supergroup.

**Quantitative Shimizu shared extension**: The EGM98 Theorem 3.1 citation was read in CDT; its original discreteness proof was not. FuchsianOrbifolds layer 3 supplies qualitative cusp/horodisc scope, but the quantitative |c|≥1/h inequality is an extension requested as FuchsianOrbifolds Part II. Provide that exact theorem and the c=0 stabilizer branch before the specialized projective-entry estimate is closed. Needed by: ConformalMappingPartII:G0/shimizu-specialization.

**Uniform cusp constants and horoball control**: Extract explicit denominator bounds and an effective large-N threshold from the corrected branch expansion, verify the exact transformed horoball equation and strict inner-disc exclusion for the full Φ group. Do not assert a new source misprint from lost reciprocal glyphs in PDF text extraction. Needed by: ConformalMappingPartII:G0/uniform-ratio-asymptotic, ConformalMappingPartII:G0/cusp-height, ConformalMappingPartII:G0/horoball-diameter, ConformalMappingPartII:G0/exceptional-set-exclusion.

**Local divisor/order comparison and circle integrability**: The pinned local divisor and closed-disc Jensen statements were read. Finish the finite support of the closed-ball pole part, local-order/removable-singularity criterion, a.e. boundary log integrability and divisor comparison of F_N′/F_N using the exact native trailing-coefficient conventions. No zero extension across accumulating unit-circle poles is permitted. Needed by: ConformalMappingPartII:V0/zero-counting-criterion, ConformalMappingPartII:V0/local-log-integrability, ConformalMappingPartII:V0/local-jensen, ConformalMappingPartII:M0/etale-pole-count.

**Subharmonic monotonicity adapter**: The source cites monotonicity in its small-radius argument, but its exact native subharmonic/log-positive interface was not established. Prove the localized sub-mean adapter including zeros and interchange of the normalized circle means. This is needed to remove the spurious 1/r term uniformly. Needed by: ConformalMappingPartII:V0/holomorphic-proximity-monotone.

**Effective fixed-level completion**: CDT p.678 invokes Tsuji 1952 Theorem 11 and §5 cites Kraus–Roth 2016. Neither original fixed-level proof was read here. Obtain effectively computable constants C_N for the finite list 2≤N<N₀, including 0<r<1, or prove an explicit finite-level replacement. An asymptotic O_N(1) with no effectivity proof is insufficient for the final effective absolute constant. Needed by: ConformalMappingPartII:M0/fixed-level-mean-input.

The quantitative Shimizu theorem is assigned to the proposed FuchsianOrbifolds Part II extension. The specialization to Φ_N remains here. This boundary preserves one owner for shared cusp geometry. The existing upstream roadmaps and their mutual links are imported as recorded.

## Coverage, prototype and source record

This is a complete planning pass, with ten planned layers and zero closed layers. All 37 routed source items are realized by one or more explicit declarations; no source target is removed because a proof input remains open. The fifteen gaps and eight requests specify the work needed to close the graph. Every declaration retains implementation status unchecked.

The suggested file elaborated against the existing pinned Mathlib build with zero errors and 61 admission warnings. It contains nine concrete native definitions, 34 API signatures and 27 examples, including the Schwarzian chain-rule declaration. It omits 88 declarations individually and one native-definition API comparison requiring the exact Tau Ceti compiled carrier. Those omissions retain every mathematical statement, API name and test. Type elaboration establishes no admitted theorem, test or geometric proof. The compilation receipt and reproducible checker/assembly reports are authenticated in the handoff.

The source is [CDT, The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), JAMS 38 (2025), 627–702, DOI 10.1090/jams/1053. Read passages on 2026-10-04: §1.1.6 p.632; proof of Corollary 2.0.5 p.636; Lemma 2.3.1 and Remark 2.3.3 pp.639–641; all of §5 pp.667–678; §6.1 and the proof in §6.2 pp.679–684. No whole-paper reading is claimed. The original proofs in Hempel, Abramowitz–Stegun, Goluzin, Carathéodory, EGM, Tsuji and Kraus–Roth are listed as missing where they supply unresolved inputs. The local published-PDF hash is 867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e.
