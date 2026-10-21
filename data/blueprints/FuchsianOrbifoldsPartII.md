# Fuchsian groups and orbifold Riemann surfaces, Part II

This roadmap constructs the Nielsen cores attached to real quadratic narrow ideal classes and the geometric identities needed to study their distribution. The core is an actual bordered hyperbolic orbifold with a generally overlapping map to the modular orbifold. Its signature, area and boundary length are proved after that construction. Its oriented orbifold conformal class recovers the arithmetic class; projected area always counts sheets.

The parent [FuchsianOrbifolds](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/FuchsianOrbifolds) already owns effective projective actions, ordinary quotient and cone charts, polygons, cusp coordinates, cofinite signatures and the modular orbifold of area π/3. This continuation adds genuine geodesic boundary and arithmetic cores. The independent volume and gonality continuation in the original brief belongs to `HyperbolicCurveVolumesAndGonality` (#1697, review #1726); its targets are not duplicated here.

The output is a target-level plan, with 30 nodes across N.0–N.5, rather than a proposed implementation. Every definition and construction below has its public API, consuming uses and three tests. Each layer is **planned**, with its mathematical import contracts explicit. No layer is certified implemented or closed. The packet has no unresolved mathematical gap; the supplier interfaces listed below remain imports to fulfill when implementing the roadmaps.

## Conventions and build order

Work with curvature −1: ds=|dz|/y and dμ=dx dy/y² on ℍ. The existing metric is twice arsinh of Euclidean distance divided by twice the geometric mean of heights. All group actions are effective PSL₂, so S(z)=−1/z has order two although its determinant-one integral lift squares to −I. The ideal boundary is the full circle `OnePoint ℝ`, including ∞.

For a discrete nonelementary Γ, distinguish the closed hull CΓ, its open interior NΓ, and the bordered orbifold Γ\CΓ. Its boundary consists of supporting geodesics modulo Γ. A paired polygon side is not part of that boundary. Cusps remain noncompact ends, and cone points retain their orders. An orbifold conformal equivalence is holomorphic in the local cone charts, preserves their orders, and is a homeomorphism up to the actual boundary. The theorem does not use the coarse surface with its cone marks erased.

Let D>1 be a positive fundamental discriminant, K its real quadratic field, C=Cl⁺(K), and J the narrow class of the different. The existing principal-class square theorem gives J²=1. For a real quadratic field, the source’s positive-norm principal-ideal convention agrees with the library’s totally positive generator convention: two equal-sign real embeddings can both be made positive by changing the generator’s sign. Let ε_D>1 be the least norm +1 unit; a negative-norm fundamental unit is squared when necessary. The primitive reduced **minus** period of A∈C is n₁,…,nℓ, with every nₖ≥2 and at least one nₖ>2. Repeating a period would change the boundary traversal and is excluded from the arithmetic specialization. Define N₀=0, Nₖ=Σⱼ≤ₖnⱼ and m=Nℓ. Translation conjugacy handles cyclic rotation; reversal has its own class law.

The six layers follow this order:

| Layer | Output | Main input |
| --- | --- | --- |
| N.0 | Hull, bordered signature, finite-area core and primitive boundary | Parent F.0–F.4; finite-type topology |
| N.1 | Explicit cycle group, Ford polygon, presentation and endpoint order | N.0; GN.3 minus-cycle dictionary |
| N.2 | Arithmetic core, full boundary length and lift-spacing checks | N.1; bottom GN.4 geodesic nodes |
| N.3 | Reflected double, conformal lift and class recovery | N.2; reflection and covering theory |
| N.4 | Pushforward area, genus probabilities and exact complementary coverings | N.2; existing narrow genus theory |
| N.5 | Compact truncations and spectral surface-to-cycle conversion | N.2, N.4; ordinary Stokes and AS Fourier bounds |

The worked D=12 and D=28 application is placed in N.4 because its last assertion uses complementary covering. Their group, area and length calculations are already tests in N.1–N.2. GN.4 contributes **only** `oriented-closed-geodesic`, `closed-geodesic-length` and `geodesic-orientation-reversal` to this construction. GN.4’s surface-equidistribution theorem consumes the measures here; it is not an input. This separation avoids a circular proof dependency.

## Baseline and supplier contracts

The implementation baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations were read at these pins and checked against the installed declaration index. The packet records 22 baseline references with modules and exact scope: the invariant volume density, upper-half-plane distance, S and T matrices, imaginary-part action formula, open modular domain and its effective a.e. fundamental-domain theorem, generated subgroups, measurable pushforward and its integral identity, effective real/integral projective actions, boundary-null transfer, the proper projective action, finite cyclic stabilizers, narrow class-group finiteness and principal-class squaring, ordinary covering lifts and over-base deck conjugation.

The reviewed library audit for parent F.0–F.6 was read before planning. The newer upstream checkout was also read at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, together with current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. New polygon, quotient and cusp code stays with the parent. No limit-set or Nielsen-core API was found. Current `DifferentialGeometry` Layer 5.3/5.5 already owns ordinary and corners Stokes and its comparison with curve integrals, so N.5 imports that material. Its absence from the older atlas snapshot is not permission to plan it again.

For readability the node inputs use F.0, F.1, F.2, F.3, F.4 and F.6 for the corresponding parent layers, CM.L2/CM.L4 for ConformalMapping and AT.1/AT.7 for AlgebraicTopology. Their exact atlas IDs and precise requested statements follow. Requests describe interface obligations; they do not authorize changes to another roadmap in this job.

- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action` — Consume the canonical PSL₂(ℝ) action on OnePoint ℝ and its compatibility with SL representatives. This is the parent’s pslBoundaryAction interface, already implemented in current Tau Ceti by OnePoint.instMulActionPSL and OnePoint.pslMk_smul; N.0 proves only its Cayley compactification compatibility. Do not construct a competing action.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts` — Restriction of the existing free quotient and cone charts to invariant closed regions; finite cyclic cone orders and regular quotient charts. The half-disc boundary charts are constructed here.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups` — Hyperbolic geodesics/axes, polygon side-pairing and cycle theorem, angle-defect area and a.e. fundamental-domain/index measure comparison. Apply the local polygon theorem to the explicit finite-sided infinite-area Ford polygon, without a cofinite converse.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates` — Full parabolic stabilizers, cusp scaling and precisely invariant horodiscs, with punctured q charts; retain the full stabilizer equality in every width normalization.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces` — Genus of the capped quotient and the cofinite orbifold signature, with finite-type surface conventions; N.0 adds genuine geodesic boundary.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-6-the-level-one-modular-quotient-in-construction-order` — The level-one effective modular quotient, its locally finite cone set and invariant area measure of mass π/3, with a.e. representatives and regular connected locus.
- `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l2--schwarz-lemma-extensions` — Classification of biholomorphic self-maps of ℍ by PSL₂(ℝ), transported from the unit-disc automorphism and Schwarz–Pick equality statements.
- `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle` — Schwarz reflection across analytic boundary arcs and removable singularities for bounded holomorphic lifts in local disc charts.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-7-euler-characteristic-and-finite-decompositions` — Finite-CW Euler characteristic, invariance and gluing along boundary circles; genus and capped-surface Euler characteristic with explicit finite-type hypotheses.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid` — Finite-cover van Kampen and its group-presentation corollaries. N.0 proves the surface-exhaustion and incompressible-boundary normal-form argument locally; that surface theorem is not attributed to the generic van Kampen supplier.
- `AutomorphicSpectralTheory:AS.2` — From the existing completed Eisenstein Fourier series, export C¹ termwise differentiation on high strips, exponential nonconstant-mode bounds and the constant-term bounds O(√Y log Y), derivative O(Y⁻¹/² log Y) for each fixed critical-line t, including t=0 by holomorphic cancellation.
- `AutomorphicSpectralTheory:AS.4` — Export smooth modular-invariant weight-zero cusp eigenfunctions with zero horizontal constant term and C¹ exponentially decaying Fourier tails on high strips. No Hecke or first-Fourier-coefficient normalization is needed.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3` — Consume IntegralLattices Layer B2–B3 for the oriented form/ideal dictionary and GlobalNumberFields Layer 11 for its order/NarrowPic carriers. For positive fundamental D>1, specialize to the maximal order and identify NarrowPic with the pinned NumberField.NarrowClassGroup, preserving principal representatives. Export only the DIT convention adapter and coefficient actions (2.3)–(2.5), p.952: [a,−b,c]↔A⁻¹, [−a,b,−c]↔JA and −Q↔JA⁻¹. Retain the oriented sign clause for a<0. This is the same adapter requested by MultiquadraticPartII:RQ.3; do not rebuild the dictionary, binary forms, composition or a narrow quotient.

The current upstream Stokes import is recorded separately, because its roadmap is newer than the atlas snapshot: `DifferentialGeometry`, Layer 5.3 and 5.5 at the commit above. The required input is compact C¹ Stokes with boundary orientation, the planar corners adapter, and top-form/curve-integral comparison.

A second current-upstream import is IntegralLattices Layer B2–B3: the oriented form/ideal dictionary with its sign clause. Its order and NarrowPic carriers belong to GlobalNumberFields Layer 11. GN.3 supplies only the maximal-order/DIT convention adapter already requested by MultiquadraticPartII:RQ.3. The general dictionary is not planned again. Completed/UniversalCovers Stage 2 already provides covering theory: the two exact baseline declarations listed in the N.3 lift inputs replace its prospective request.

## Proof safeguards and source corrections

Four findings against the version of record, already identified in the source extraction, now have independent confirmation in this review. The two proof gaps concern omitted justifications; they do not refute the final theorem. Corrected proof routes follow.

1. **Half-plane and infinity convention (E1; DIT §2 p.952, extraction E17).** Keep the supporting side away from the complementary ideal interval. The word “above” is valid after a normalization with ∞ in the limit set; it is not an invariant rule for arbitrary conjugates.
2. **Finite cutting arcs (E2; DIT Theorem 1 proof pp.958–959, extraction E19).** Ordering the complete axes does not prove that a finite subarc reaches its next circle. The descending endpoint-disc induction in `axis-cutting` establishes that crossing, including the one-digit endpoint case.
3. **Conformal recovery (E3; DIT p.959, extraction E20).** The closest-footpoint ordering does not by itself justify the selected successive lifts. Their distances need not equal ordinary quotient distances. The double and covering lift put a conformal equivalence in PSL₂(ℝ). After fixing the unique cusp, the largest elliptic height forces its dilation to be one. The cyclic gaps then recover the digits. Cone orders remain part of the input throughout.
4. **Laplacian exponent (E4; DIT p.961, extraction E1).** The operator is −y²(∂x²+∂y²), as in the paper’s (7.10) on p.972. The earlier display’s inverse-square factor fails even on y^s.

The journal article page, linked final PDF, author publication page and title/erratum search were checked on 2026-10-18; no published correction was located. The packet records the exact PDF hash and version. These findings correct the statements used below. The Stokes integral under the general flux hypothesis is explicitly a **height-truncated limit**; absolute integrability is proved separately for the spectral inputs.

## Layer N.0: Nielsen regions and bordered signatures

For a nonelementary discrete subgroup of PSL₂(ℝ), define its limit set in the full ideal circle, the closed hyperbolic hull and its orbifold quotient. Prove geometric finiteness for finitely generated groups, identify funnels and their primitive boundary axes, construct the finite signature (g;m₁,…,mᵣ;s;t), and derive area=2π(2g−2+s+t+Σ(1−1/mⱼ)) from polygon Gauss–Bonnet. Boundary means actual geodesic boundary; paired polygon edges and cusp truncation curves are excluded. Include the first-kind comparison with the parent’s cofinite case.

### Limit set

Target `N.0/limit-set` (definition). For a discrete Γ≤PSL₂(ℝ), ΛΓ is the set of ideal-boundary accumulation points of Γz₀, in the closed-disc compactification of ℍ. Identify its ideal circle with OnePoint ℝ, including ∞. Nonelementary means |ΛΓ|>2. First kind means ΛΓ is the entire circle; second kind means it is a proper subset.

**Hypotheses.** Γ is a discrete subgroup; z₀∈ℍ is arbitrary.

**Proof route.**

1. Use the Cayley embedding z↦(z−i)/(z+i), take the closure of the orbit in the closed unit disc and intersect the unit circle.
2. Import the parent F.0 canonical action on OnePoint ℝ; its projective action is already implemented in current Tau Ceti as OnePoint.instMulActionPSL and OnePoint.pslMk_smul. Prove compatibility with the Cayley boundary identification and continuity at infinity. Bounded hyperbolic distance gives the same boundary limit, proving basepoint independence; continuity of the extended action gives conjugacy equivariance. No new ideal-boundary action is constructed here.
3. For a nonelementary group, use attracting/repelling limits of hyperbolic words to obtain perfection and the first/second-kind dichotomy.

**Public API.**

- `limitSet_basepoint`: The orbit-closure boundary is independent of z₀.
- `limitSet_closed`: ΛΓ is closed in the ideal circle.
- `limitSet_conjugate`: Λ(gΓg⁻¹)=gΛΓ.
- `limitSet_fixedPoints`: The fixed points of every hyperbolic element lie in ΛΓ.

**Uses.** N.0/nielsen-core and N.1/second-kind: Select the correct supporting half-planes and witness a free interval of discontinuity.

**Discriminating tests.**

- `translation_limit`: For ⟨T^m⟩ with m>0, Λ={∞}, hence the group is elementary.
- `hyperbolic_limit`: For a cyclic hyperbolic group, Λ is exactly its two fixed points, so nonelementarity fails.
- `modular_limit`: For PSL₂(ℤ), Λ=OnePoint ℝ, agreeing with the parent’s cofinite group.

**Inputs.** `tauceti:UpperHalfPlane.pslMk_smul`, `mathlib:UpperHalfPlane.dist_eq`, `tauceti:TauCeti.UpperHalfPlane.isProperMap_psl_smul_I`, `F.0`.

**Source.** [DIT16] §2 p.952, limit-set paragraph. The source introduces the limit set and kind; the full ideal circle and away-side convention correct E17. [LU23] §3.1 pp.194–195. Elementary cases and the second-kind limit-set complement are stated here.

**Check.** Changing orbit basepoint changes no ideal limit. No finite-covolume or finite-generation hypothesis is used in the definition.

### Nielsen core

Target `N.0/nielsen-core` (construction). For nonelementary discrete Γ, let CΓ be the intersection of the closed hyperbolic half-planes whose ideal closures contain ΛΓ; equivalently keep the side away from each component interval of the ideal-circle complement. Set NΓ=intℍ(CΓ). The bordered orbifold Core(Γ) is the quotient Γ\CΓ, with quotient topology and the parent’s orbifold charts restricted to the interior. Its genuine boundary is Γ\∂ℍCΓ, not the paired edges of a chosen polygon.

**Hypotheses.** Γ is discrete and nonelementary.

**Proof route.**

1. Intersect the supporting closed half-planes; noncollinearity of three limit points gives nonempty interior. Local finiteness of complementary supporting geodesics in ℍ shows that its interior is the open Nielsen region.
2. Convexity and invariance permit restriction of the orbit relation to CΓ. Away from supporting geodesics use the existing quotient charts; on a supporting line use a half-disc chart.
3. A nontrivial elliptic stabilizer cannot preserve a supporting half-plane at its boundary point. Boundary charts are therefore ordinary half-discs.

**Public API.**

- `nielsenCore_invariant`: gCΓ=CΓ for g∈Γ.
- `nielsenCore_minimal`: CΓ is the closed hyperbolic convex hull of ΛΓ.
- `nielsenCore_conjugate`: Conjugation induces an orientation-preserving orbifold isometry of cores.
- `nielsenCore_boundary`: The quotient of supporting geodesics is exactly the manifold boundary.
- `nielsenCore_firstKind`: CΓ=ℍ exactly when ΛΓ is the whole ideal circle.

**Uses.** N.2/class-core: Construct the actual arithmetic surface before deriving its invariants. N.5/core-truncation: Distinguish true boundary from artificial truncation and side-pairing edges.

**Discriminating tests.**

- `full_hull`: For PSL₂(ℤ), the core is the entire quotient and has no geodesic boundary.
- `wrong_halfplane`: If Λ lies in a bounded real interval and ∞∉Λ, the half-plane for the complementary interval containing ∞ is inside its endpoint semicircle.
- `paired_sides`: The two vertical sides of a modular polygon are identified and contribute no actual boundary component.

**Inputs.** `N.0/limit-set`, `F.1`, `F.2`, `mathlib:ProperlyDiscontinuousSMul.finite_stabilizer`, `tauceti:Subgroup.instIsCyclicStabilizer`.

**Source.** [DIT16] §2 pp.952–953, Nielsen region and boundary convention. The closed core and its true boundary are the intended objects; the packet separates open NΓ from closed CΓ. [SERIES05] The convex core pp.32–33. The core is the quotient of the hull, with boundary axes cutting off funnels.

**Check.** Core interior and parent quotient charts agree by restriction. Every actual boundary point has trivial local stabilizer.

### Finite-area Nielsen core

Target `N.0/geometric-finiteness` (theorem). If Γ≤PSL₂(ℝ) is discrete, nonelementary and finitely generated, it admits a locally finite finite-sided convex fundamental polygon. Its intersection with CΓ has finite area and becomes compact after removing finitely many disjoint cusp horodiscs. There are finitely many Γ-orbits of complementary ideal intervals. Each interval stabilizer is generated by a primitive hyperbolic element, and its supporting geodesic gives one embedded boundary circle. Thus second kind is equivalent to having at least one funnel; for first kind this recovers the parent’s cofinite case.

**Hypotheses.** Γ is discrete, nonelementary and finitely generated; torsion is permitted.

**Proof route.**

1. Take a compact regular neighborhood of finitely many generator loops in the quotient, using local orbifold charts; its compactness meets only finitely many cone orbits. Exhaust the remaining quotient by compact subsurfaces and use the inherited van Kampen presentation. After filling inessential boundary discs, a new handle, nonannular end or unaccounted cone introduces a generator not in the original surjective subgroup. The finite generator set therefore forces finite topological type; finite cone data is a conclusion of this argument, not an initial assumption. This is the two-dimensional geometric-finiteness argument summarized by LU23 §3.1.
2. Cut the resulting finite-type quotient along finitely many arcs to a finite-sided convex polygon; parabolic peripheral loops give cusp vertices, hyperbolic peripheral loops give free ideal intervals. Equivalently use the finite-generation/geometric-finiteness result in LU23 §3.1.
3. Replace each free interval by its supporting axis. Polygon Gauss–Bonnet gives finite core area. The inherited cusp horodiscs leave a compact polygon. Local separation and discreteness make a boundary-axis stabilizer cyclic with a primitive generator.

**Inputs.** `N.0/nielsen-core`, `F.2`, `F.3`, `AT.1`.

**Source.** [LU23] §3.1 pp.194–195, Proposition 3.5; §3.3 p.198. Finite generation, finite-sided polygons and finite-area Nielsen intersections are the key input, with cusp surgery described in §3.2. The surgery discussions in §3.2–§3.3 first treat torsion-free groups; here cusp isolation comes from F.3 and the cone points remain in the compact part using F.1, so no torsion-free hypothesis is silently dropped. [SERIES05] Theorem 3.33 p.21; p.33, Fuchsian paragraph following Proposition 4.60. Theorem 3.33 supplies finite generation iff geometric finiteness for Fuchsian groups; the p.33 paragraph identifies boundary axes and funnels. The finite-type surface argument is developed in this node, consuming only generic van Kampen from AT.1.

**Check.** The finite-generation hypothesis is retained; an arbitrary infinite-index subgroup is not asserted to be of second kind. The output polygon and end decomposition are constructed, not fields assumed in a core record.

### Signature with geodesic boundary

Target `N.0/bordered-signature` (definition). For Core(Γ) under geometric-finiteness hypotheses, its signature is (g;m₁,…,mᵣ;s;t): g is the topological genus after adjoining cusp points and capping each boundary circle by a disc, mⱼ≥2 are the cone stabilizer orders with multiplicity by orbit, s is the number of parabolic cusp orbits and t is the number of actual geodesic boundary circles. Define the scalar area expression B(g,m,s,t)=2π(2g−2+s+t+Σⱼ(1−1/mⱼ)); m is a list of natural orders, each at least two.

**Hypotheses.** Γ is discrete, nonelementary and finitely generated. A finite CW model for the capped underlying surface is imported.

**Proof route.**

1. Use the finite end decomposition to cap funnels and cusps topologically; retain the cone orders in the orbifold data.
2. Compute genus from the parent’s topological surface convention, using finite-CW Euler characteristic. The value is independent of chosen truncations and caps.
3. Define B by finite summation; list permutation changes no value.

**Public API.**

- `borderedSignature_conjugate`: Conjugate groups have equal g,s,t and equal multisets of cone orders.
- `borderedSignature_cofinite`: For t=0 the data agrees with the parent’s signature.
- `orbifoldAreaExpr_perm`: Permutation of cone orders preserves B.
- `orbifoldAreaExpr_double`: Doubling gives genus 2g+t−1, twice the cone list and 2s cusps, and doubles B when t≥1.

**Uses.** N.0/core-gauss-bonnet and N.2/core-invariants: Derive areas from the actual surface invariants, with a separately tested scalar normalization.

**Discriminating tests.**

- `modular_signature`: B(0,[2,3],1,0)=π/3.
- `arithmetic_signature`: B(0,[2 repeated ℓ],1,1)=πℓ, including ℓ=1.
- `pair_of_pants`: B(0,[],0,3)=2π, while B(0,[],1,0)=−2π and cannot be a nonelementary finite-area core signature.

**Inputs.** `N.0/geometric-finiteness`, `F.4`, `AT.7`.

**Source.** [DIT16] §2 pp.952–953, signature and (2.8). The signature includes geodesic boundary as a separate count and uses cone-orbit orders.

**Check.** Boundary components contribute +t to −χorb. A cusp counts once in s and zero times in t.

### Gauss–Bonnet with geodesic boundary

Target `N.0/core-gauss-bonnet` (theorem). For the signature (g;m₁,…,mᵣ;s;t) of a finitely generated nonelementary discrete Γ, area(Core(Γ))=B(g,m,s,t). The area is defined on an a.e. fundamental core polygon using the invariant volume instance on ℍ. It is finite, positive, independent of the polygon, and agrees with the quotient hyperbolic measure.

**Hypotheses.** The signature and area use N.0/bordered-signature and the inherited effective quotient charts.

**Proof route.**

1. Triangulate the finite core polygon, allowing ideal vertices at cusps, and sum the inherited polygon angle-defect formulas.
2. Cancel paired edge and ordinary vertex contributions. Cone angle 2π/m contributes its stabilizer defect, a cusp is an ideal puncture, and genuine boundary is geodesic so has zero geodesic-curvature contribution.
3. Finite-CW Euler characteristic of the capped surface gives 2−2g; removing s cusp points and t capping discs gives the stated signs. Area independence follows from the inherited fundamental-domain measure theorem.

**Inputs.** `N.0/bordered-signature`, `F.2`, `AT.7`, `mathlib:UpperHalfPlane.volume_def`.

**Source.** [DIT16] §2 p.953, (2.8). This is the boundary-inclusive orbifold area formula; the polygon derivation extends the existing t=0 owner.

**Check.** Specializing t=0 agrees with the parent rather than introducing another cofinite-area theorem. A positive core cannot have B≤0.

### Primitive funnel boundary

Target `N.0/boundary-geodesic` (theorem). Each funnel peripheral free homotopy class of the regular part of Core(Γ) has one oriented closed geodesic representative, obtained from the supporting axis of the primitive interval stabilizer. It is simple on Core(Γ), avoids cone points, and is traversed once. Parabolic cusp classes have no such representative. For general hyperbolic conjugacy classes uniqueness is asserted in the orbifold sense; no claim is made that a representative must avoid all cone points.

**Hypotheses.** Γ is discrete, nonelementary and finitely generated. The peripheral class belongs to a funnel, not to a cusp or cone meridian.

**Proof route.**

1. Lift the peripheral loop to a path joining z to hz, where h is the primitive hyperbolic stabilizer of its complementary interval.
2. The two fixed endpoints determine the unique invariant axis. A second geodesic in that class lifts to the same axis by uniqueness of a hyperbolic element’s axis.
3. Supporting lines are disjoint and boundary stabilizers are cyclic without elliptics; hence the quotient boundary circle is simple. A parabolic element has only one ideal fixed point and no axis.

**Inputs.** `N.0/geometric-finiteness`, `F.2`, `F.1`.

**Source.** [DIT16] §2 pp.952–953, paragraph across the page break. The claimed boundary representative is interpreted for funnel circles; cusp and cone exceptions are made explicit.

**Check.** The theorem does not apply the surface geodesic theorem blindly to a punctured cone orbifold. Parametrized primitive boundary length is preserved even if its modular projection retraces.

**Layer acceptance.** Every target above retains its hypotheses and direct inputs. Every definition’s three tests distinguishes a normalization, boundary or multiplicity error. All definition/API/test statements are in the packet with implementation status unchecked.

## Layer N.1: Quadratic cycles and their Ford polygons

Import the primitive reduced minus cycle of a narrow class A of positive fundamental discriminant D. For Nₖ=Σⱼ≤ₖnⱼ and m=Nℓ, construct Sₖ=T^NₖST^−Nₖ, Γ_A=⟨S₁,…,Sℓ,T^m⟩ and its strip outside the unit discs. Verify side identifications, the free product ℤ*(C₂)^*ℓ, full cusp stabilizer ⟨T^m⟩, cyclic-rotation conjugacy, endpoint inequalities and γ_w=S₁⋯SℓT^m. Prove second kind and infinite index using a nonempty free ideal interval, not an invalid converse from infinite index alone.

### Quadratic cycle group

Target `N.1/cycle-group` (definition). For a nonempty digit list n=(n₁,…,nℓ) with nₖ≥2 and at least one nₖ>2, put N₀=0, Nₖ=Σⱼ≤ₖnⱼ, m=Nℓ, Sₖ=T^Nₖ S T^−Nₖ in PSL₂(ℤ), and Γ(n)=⟨S₁,…,Sℓ,T^m⟩. Here S₀=S and Γ(n)=⟨S₀,…,Sℓ₋₁,T^m⟩. For a narrow class A use its imported primitive reduced minus period and write Γ_A=Γ(n). The raw list construction is defined without admissibility, but every geometric theorem retains the displayed digit hypotheses.

**Hypotheses.** All group expressions use effective PSL₂(ℤ), embedded in PSL₂(ℝ). Arithmetic specializations use a positive fundamental discriminant D>1 and a primitive reduced period of A∈Cl⁺(K).

**Proof route.**

1. Use Subgroup.closure on the finite set of conjugated S matrices and T^m; no new group carrier is introduced.
2. Sℓ=T^m S₀ T^−m proves equality of the two generating sets.
3. Each Sₖ acts by z↦Nₖ−1/(z−Nₖ), fixes Nₖ+i, and has exact projective order two; its SL lift squares to −I.

**Public API.**

- `cycleInvolution_apply`: Sₖz=Nₖ−1/(z−Nₖ); Sₖ(Nₖ+i)=Nₖ+i.
- `cycleInvolution_order`: Sₖ²=1 and Sₖ≠1 in PSL₂(ℤ).
- `cycleGroup_generators`: Membership of each Sₖ and T^m, and the universal property of the generated subgroup.
- `cycleGroup_alternate`: Replacing Sℓ by S₀ gives the same subgroup.
- `cycleGroup_realAction`: The integral subgroup action agrees with the canonical real projective action.

**Uses.** N.1/cycle-polygon and N.2/class-core: Construct the explicit subgroup whose convex core is attached to A. N.3/highest-elliptics: The integral entries and full cusp period rigidify conformal conjugacies.

**Discriminating tests.**

- `single_digit`: For n=[4], Γ(n)=⟨S,T⁴⟩, with m=4 and one elliptic factor.
- `two_digit`: For n=[3,6], m=9 and Γ(n)=⟨S,T³ST⁻³,T⁹⟩.
- `parabolic_rejection`: [2] and every all-2 list fail admissibility; [2] gives the parabolic boundary word T²S rather than an arithmetic hyperbolic unit.

**Inputs.** `mathlib:ModularGroup.S`, `mathlib:ModularGroup.T`, `mathlib:Subgroup.closure`, `mathlib:Subgroup.closure_le`, `tauceti:UpperHalfPlane.pslMk_smul`, `tauceti:psl2zToPSL2R_injective`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/minus-continued-fraction`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`.

**Source.** [DIT16] §3 pp.954 and 957, (3.1)–(3.2). These are the arithmetic involutions and subgroup, with the projective center removed.

**Check.** The order-two assertion is in PSL, never in SL. An all-2 word is excluded from the arithmetic/geometric input.

### Ford polygon of a cycle

Target `N.1/cycle-polygon` (definition). For n as in cycle-group, let P(n)={z∈ℍ:0≤Re z≤m and |z−Nₖ|≥1 for k=0,…,ℓ}. It is a closed polygon in ℍ with ideal free intervals Iₖ=(Nₖ₋₁+1,Nₖ−1); Iₖ is empty when nₖ=2. Pair the vertical sides by T^m, the two quarter-circles at 0,m by T^mS₀, and the two halves of each intermediate semicircle at Nₖ+i by Sₖ. The ideal intervals are end data, not geodesic edges or part of the surface boundary.

**Hypotheses.** n is nonempty, every nₖ≥2, some nₖ>2.

**Proof route.**

1. The exterior of each unit semicircle is a closed hyperbolic half-plane; intersect them with the strip.
2. Centers differ by at least two, so distinct open unit discs are disjoint; equality gives only a tangency on the real boundary.
3. Check each side pairing using the explicit Möbius formulas. A semicircle must be split at its elliptic fixed point before pairing.

**Public API.**

- `cyclePolygon_mem`: Membership is precisely the strip and the ℓ+1 exterior-disc inequalities.
- `cyclePolygon_closed`: P(n) is closed, measurable and hyperbolically convex.
- `cyclePolygon_pairings`: The listed maps identify the actual geodesic half-sides, with order-two vertex cycle.
- `cyclePolygon_freeIntervals`: Iₖ has Euclidean length nₖ−2 and is nonempty exactly for nₖ>2.
- `cyclePolygon_cuspStrip`: For Y>1 the polygon above height Y is the full strip 0≤x≤m.

**Uses.** N.1/ford-domain: Verify the fundamental set and its presentation without importing a cofinite-only converse. N.2/axis-cutting: Retain the pieces of the unit-axis arc lying in the polygon.

**Discriminating tests.**

- `digit_four_gap`: For [4], the sole free interval is (1,3), of length 2.
- `digit_two_tangency`: For [3,2], I₂ is empty but its two adjacent open discs remain disjoint in ℍ.
- `height_one_centers`: For [3,6], the three points i,3+i,9+i lie on P; the centers 3 and 9 are not removed as cone points upstairs.

**Inputs.** `N.1/cycle-group`, `F.2`.

**Source.** [DIT16] §3 Figures 1, 4 and 7, pp.955–958; proof of Theorem 1 p.957. The displayed domains and Poincaré argument specify this strip and side pairing.

**Check.** At least one Iₖ is a nonempty interval. The semicircle endpoints are ideal, so tangencies create no interior overlap.

### Cycle polygon presentation

Target `N.1/ford-domain` (theorem). For an admissible digit list, the Γ(n)-translates of P(n) tile ℍ with disjoint interiors, locally finitely away from ideal endpoints. Boundary identifications are exactly the specified side pairings. The resulting group is ℤ*(C₂)^*ℓ, where T^m generates ℤ and S₀,…,Sℓ₋₁ generate the order-two factors. The quotient has one cusp class and its full stabilizer at ∞ is ⟨T^m⟩; the elliptic orbits are represented once by Nₖ+i, k=0,…,ℓ−1, all of order two. Its underlying topological type is genus zero with one funnel end.

**Hypotheses.** The list is admissible; no assertion of minimality as an arithmetic period is needed for this theorem.

**Proof route.**

1. Discreteness is inherited from PSL₂(ℤ). Translate any point into the strip. If it is inside one of the unit discs, apply its involution to increase height; only finitely many integral bottom rows can give height above the original height, so this reduction terminates at P.
2. For uniqueness, a reduced alternating word in the translation and involution factors carries an interior point into an excluded disc or an exterior strip. This is the disjoint-disc ping-pong argument; it also proves there are no extra relations.
3. Apply the inherited polygon cycle/orientation bookkeeping to the split half-sides. The only ideal parabolic vertex cycle is ∞, with primitive pairing T^m; traversing the remaining free ideal intervals through their endpoint identifications gives one end circle. The resulting planar polygon gluing gives genus zero.
4. The reduction normal form shows that an element fixing ∞ has no involution syllable, hence is T^{jm}. It also identifies the ℓ elliptic conjugacy classes.

**Inputs.** `N.1/cycle-polygon`, `F.6`, `F.2`, `F.3`.

**Source.** [DIT16] Theorem 1 and first proof paragraphs, p.957. The source obtains the signature and free product from the polygon. The explicit reduction, ping-pong and full cusp stabilizer are the proof details needed here.

**Check.** The full cusp stabilizer is proved, not inferred from the presence of T^m. The finite-area cofinite converse of the parent is not used for this infinite-area domain.

### Cyclic presentation invariance

Target `N.1/rotation-conjugacy` (theorem). If n′ is the cyclic rotation obtained by moving the first r digits of n to the end, then Γ(n′)=T^−Nᵣ Γ(n) T^Nᵣ. The induced oriented orbifold core isometry commutes with the projection to PSL₂(ℤ)\ℍ. Thus a primitive cycle up to rotation determines the core and its projected measure, independent of the selected reduced representative.

**Hypotheses.** 0≤r<ℓ; n′ has the same cyclic order, not its reverse.

**Proof route.**

1. Subtract Nᵣ from all old centers and reduce them modulo m, using the alternative generating set with S₀.
2. Conjugation sends every involution to the involution at the translated center and fixes T^m. Apply the generated-subgroup universal property in both directions.
3. Use hull equivariance and the fact that T^Nᵣ lies in the full modular group for the projection compatibility.

**Inputs.** `N.1/cycle-group`, `N.0/nielsen-core`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`.

**Source.** [DIT16] §3 p.954, paragraph after (3.2). Changing the reduced representative gives a translation conjugate subgroup.

**Check.** For [3,6]→[6,3], the conjugating translation is T⁻³. Reversal is not silently identified with rotation or with the same narrow class.

### Boundary word and endpoint ordering

Target `N.1/word-endpoints` (theorem). For a primitive reduced period of A and reduced w>wσ, γ_w=S₁⋯SℓT^m=∏ₖ(T^nₖS) in PSL₂(ℤ). This is the primitive hyperbolic Pell automorph with attracting fixed point w. Set w₁=w and wₖ=Sₖ₋₁⋯S₁w for k≥2, and similarly for the conjugate. Then Nₖ₋₁<wₖσ<Nₖ₋₁+1≤Nₖ−1<wₖ<Nₖ for 1≤k≤ℓ. The weak central inequality permits nₖ=2; all other inequalities are strict.

**Hypotheses.** D>1 is positive fundamental; A∈Cl⁺(K); n is its primitive reduced minus period; ε_D is the least unit >1 of norm +1.

**Proof route.**

1. Telescope the conjugation powers in S₁⋯SℓT^m to obtain ∏T^nₖS.
2. Write each transformed wₖ as Nₖ₋₁ plus its reduced remainder. Reducedness 0<remainderσ<1 and nₖ−1<remainder<nₖ gives the inequalities.
3. The imported continued-fraction product and Pell dictionary identify the word with multiplication by ε_D, including the attracting direction. A nonprimitive repeated period would give a positive power and is excluded.

**Inputs.** `N.1/cycle-group`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/minus-continued-fraction`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`.

**Source.** [DIT16] §3 pp.957–958, (3.4)–(3.6). The source states the matrix word, the transformed endpoint inequalities and closing identity.

**Check.** For [3,6] the SL word is [[17,−3],[6,−1]], fixing (3±√7)/2. The all-2 parabolic word fails the strict hyperbolic hypothesis.

### Infinite-index cycle subgroup

Target `N.1/second-kind` (theorem). For an admissible digit list, Γ(n) is nonelementary, finitely generated, of the second kind and of infinite index in PSL₂(ℤ). Its full upper-half-plane quotient has infinite area although its Nielsen core has finite area. Every nonempty Iₖ from the Ford polygon lies in the domain of discontinuity, so it supplies a concrete ideal point outside the limit set.

**Hypotheses.** All digit assumptions of cycle-polygon hold.

**Proof route.**

1. The group contains a nontrivial translation and an involution moving ∞, so its limit set has more than two points.
2. Ping-pong and the free-side tiling give a neighborhood of each interior point of Iₖ with properly discontinuous action; hence Iₖ misses ΛΓ. Some Iₖ is nonempty.
3. A positive-length subinterval of Iₖ has a shallow strip in P with area integral ∫y⁻²dy=∞. Thus the quotient has infinite area. A finite-index subgroup of the modular group has finite area by the imported fundamental-domain index formula, proving infinite index.

**Inputs.** `N.1/ford-domain`, `N.0/limit-set`, `N.0/geometric-finiteness`, `F.2`, `F.6`, `mathlib:UpperHalfPlane.volume_def`.

**Source.** [DIT16] §3 p.954 and Theorem 1 p.957. The infinite-index and second-kind assertions are justified here from the free interval; infinite index alone would not suffice.

**Check.** Both infinite index and second kind receive proofs in the correct direction. Core area is not confused with the infinite area of Γ(n)\ℍ.

**Layer acceptance.** Every target above retains its hypotheses and direct inputs. Every definition’s three tests distinguishes a normalization, boundary or multiplicity error. All definition/API/test statements are in the packet with implementation status unchecked.

## Layer N.2: The arithmetic core and its boundary

Carry out the finite-arc cutting algorithm with its disjoint-disc endpoint induction. Construct F_A as the quotient of C(Λ_A) by Γ_A and the map to the modular orbifold. Identify signature (0;2 repeated ℓ_A;1;1), a simple primitive oriented boundary projecting to the parametrized C_A, length 2log ε_D and area πℓ_A. Record distances 2arsinh(n/2) between chosen height-one lifts without interpreting them as intrinsic cone-point distances. Use D=12 and D=28 as signature, length and lift-spacing tests; the complete worked example, including covering multiplicities, is in N.4.

### Boundary arc cutting

Target `N.2/axis-cutting` (construction). For the data in word-endpoints, let z be the unique intersection of the axis (wσ,w) with |ζ|=1. Cut the oriented finite arc [z,γ_wz] at the next circle |ζ−N₁|=1, retain its initial piece in P and apply S₁ to the remaining piece. Repeat at centers N₂,…,Nℓ. After Sℓ and translation T^−m the endpoint returns to z. The retained arcs form one oriented closed curve in Γ_A\P, lying on supporting geodesics and with the core on its left.

**Hypotheses.** The period is primitive and reduced. Arc order is from wσ towards w; disc tangencies occur only on the real boundary.

**Proof route.**

1. The endpoint inequalities give unique crossings of the complete transformed axes with the relevant circles. To justify crossings of the finite subarcs, put qₖ=Sₖ⋯SℓT^m z. Since SℓT^m z=T^mSz and |z|=1, qℓ lies on the final circle.
2. The identity |Sₖζ−Nₖ|=1/|ζ−Nₖ| and disjoint open discs show by descending induction that qₖ lies strictly inside the circle centered at Nₖ for k<ℓ. The starting point of that cutting step lies outside it. Thus each finite subarc reaches its next circle exactly once; for ℓ=1 the last crossing is the endpoint itself.
3. Side pairings identify the retained endpoints and tangent directions. Their cyclic order follows the free-end circle of the polygon; their supporting half-planes are the ones containing the limit set. No nontrivial subcycle closes, by the primitive boundary word and normal form.

**Public API.**

- `boundaryCut_crossing`: Every cutting subarc meets its next circle uniquely; the last endpoint case is allowed.
- `boundaryCut_close`: T^−mSℓ⋯S₁γ_wz=z, with matching tangent orientation.
- `boundaryCut_isometry`: The cutting maps preserve hyperbolic lengths and invariant one-form integrals.
- `boundaryCut_once`: The retained curve goes once around the funnel boundary.
- `boundaryCut_rotation`: Rotating the arithmetic period transports the curve by rotation-conjugacy.

**Uses.** N.2/core-invariants and N.5/core-stokes: Identify both the simple upstairs boundary and its full oriented modular cycle, preserving multiplicity.

**Discriminating tests.**

- `one_digit_endpoint`: For [4], the first crossing is γ_wz itself, so the algorithm does not require a strict interior endpoint.
- `D28_cut`: For [3,6], z=1/2+(√3/2)i, the first crossing is 5/2+(√3/2)i, and S₁γ_wz=17/2+(√3/2)i.
- `digit_two_no_zero_arc`: For a period containing 2, equality Nₖ₋₁+1=Nₖ−1 creates only an ideal tangency; each retained arc in ℍ still has its required ordered endpoints.

**Inputs.** `N.1/word-endpoints`, `N.1/cycle-polygon`, `N.1/ford-domain`, `N.0/boundary-geodesic`.

**Source.** [DIT16] Proof of Theorem 1 pp.958–959, (3.6) and Figure 7. This is the corrected finite-arc construction; the descending disc argument fills E19.

**Check.** Crossings are proved for [z,γ_wz], not only for its infinite axis. There is one parametrized primitive boundary traversal.

### Quadratic-class surface

Target `N.2/class-core` (construction). For a real quadratic field K of positive fundamental discriminant D>1 and A∈Cl⁺(K), define F_A=Core(Γ_A), including its genuine geodesic boundary and all cone points with order. A fundamental core polygon is Q_A=P(n)∩CΓ_A. The canonical map p_A:F_A→M=PSL₂(ℤ)\ℍ is induced by subgroup inclusion; it is an orientation-preserving local orbifold isometry on the interior and an isometric half-disc map along the genuine boundary. It may overlap itself and is proper. Choices of reduced representative produce canonically conjugate maps over M.

**Hypotheses.** Use a primitive minus period supplied by GN.3; all arithmetic actions and the modular quotient use the effective projective group.

**Proof route.**

1. Apply the general core construction to the explicit second-kind subgroup, restricting the actual orbit relation and quotient charts.
2. Identify Q_A by the supporting retained arcs from axis-cutting. Choose Y₀>1 above all those finitely many compact arcs. Above Y₀ the core polygon is the full width-m cusp strip. The cutoff 1 works for P(n), but need not work for Q_A.
3. Inclusion of orbit relations gives p_A. Above a sufficiently high standard modular horodisc it is the width-m cusp cover; the complement of that cusp tail in F_A is compact. This proves properness, hence finiteness of preimages away from the projected boundary and cone set.
4. Use rotation-conjugacy for independence; do not replace the surface by a record of signature, area and length.

**Public API.**

- `classCore_polygon`: Q_A is an a.e. fundamental set for the action on CΓ_A.
- `classCore_boundary`: Its genuine boundary is the curve returned by boundaryCut.
- `classCore_projection`: p_A([z])=[z], well defined by subgroup inclusion.
- `classCore_rotation`: Changing the reduced representative gives an oriented orbifold isometry over M.
- `classCore_projection_proper`: Inverse images of compact subsets of M are compact.
- `classCore_cuspStrip`: There is Y₀>1 such that Q_A∩{Im z>Y₀}={z:0≤Re z≤m, Im z>Y₀}; the cutoff is chosen above all retained boundary arcs.

**Uses.** N.3/conformal-class and N.4/core-measure: Supply the actual bordered orbifold with cone orders, and its map whose pushforward retains overlapping sheets.

**Discriminating tests.**

- `D12_core`: The principal period [4] has one cone point; [3,2] has two. The resulting cores cannot be identified merely because their boundary lengths agree.
- `D28_overlap`: For D=28, the principal core area is 2π, larger than area(M)=π/3; p_A therefore cannot be an isometric embedding.
- `cusp_boundary_distinction`: The width-m cusp contributes one end and no geodesic boundary component; Q_A’s vertical sides are paired.
- `D28_cusp_cutoff`: For [3,6], the first retained boundary arc lies on (x−3/2)²+y²=7/4, from x=1/2 to x=5/2. Its maximum height is √7/2>1. The point 3/2+(6/5)i belongs to P but is below that arc and outside Q_A; height>1 alone does not identify the core cusp strip.

**Inputs.** `N.0/nielsen-core`, `N.1/second-kind`, `N.1/rotation-conjugacy`, `N.2/axis-cutting`, `F.1`, `F.3`, `F.6`.

**Source.** [DIT16] §3 p.954, definition of N_A and F_A; Theorem 1 p.957; Figure 6 p.957. The arithmetic surface is the core, and its modular projection can have overlapping sheets.

**Check.** Interior maps are local orbifold isometries; boundary maps are isometric half-disc maps into full target charts. No global embedding or open local homeomorphism at the genuine boundary is asserted. The cusp is retained as a noncompact end.

### Quadratic-core signature and area

Target `N.2/core-invariants` (theorem). The surface F_A has signature (0;2 repeated ℓ_A;1;1), group presentation Γ_A≅ℤ*(C₂)^*ℓ_A, and area πℓ_A. It has one simple geodesic boundary circle. The area is computed with curvature −1 measure y⁻²dxdy and is independent of the selected primitive reduced representative.

**Hypotheses.** K,D,A and the primitive period satisfy class-core.

**Proof route.**

1. The Ford gluing supplies genus zero, the ℓ distinct cone orbits, and the unique cusp and free-end cycle.
2. Axis-cutting and primitive funnel boundary identify that end with the one actual geodesic boundary circle.
3. Insert the signature into core-gauss-bonnet: 2π(−2+1+1+ℓ/2)=πℓ. Translation conjugacy preserves it.

**Inputs.** `N.2/class-core`, `N.1/ford-domain`, `N.0/core-gauss-bonnet`.

**Source.** [DIT16] Theorem 1 p.957, (3.3), and first paragraph p.959. These are the topological and area conclusions of Theorem 1.

**Check.** The boundary count is one even when several ideal gaps are nonempty. There is no unproved identification of genus from a numerical area formula alone.

### Quadratic-core boundary length

Target `N.2/boundary-length` (theorem). As an oriented parametrized cycle, p_A(∂F_A)=C_A and length(∂F_A)=2log ε_D. For every modular-invariant continuous one-form whose restriction to this compact cycle is integrable, its integral along ∂F_A equals the imported oriented integral along C_A. No division by two is made for a reciprocal class A²=J, although its modular image may retrace.

**Hypotheses.** Use the primitive Pell generator attracting w, and orient ∂F_A with the core on its left. ε_D is the least norm +1 unit >1.

**Proof route.**

1. The retained pieces are images of a partition of [z,γ_wz], each by an orientation-preserving isometry belonging to the full modular group.
2. Sum lengths and one-form integrals over the partition. The imported GN.4 length theorem applies to the whole primitive parametrized cycle.
3. The curve is simple upstairs by the supporting-boundary theorem; no such simplicity is asserted for its modular image.

**Inputs.** `N.2/axis-cutting`, `N.2/core-invariants`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/oriented-closed-geodesic`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/closed-geodesic-length`.

**Source.** [DIT16] Theorem 1 and (3.3), p.957; cutting proof pp.958–959; (2.10) p.954. The boundary projects to the full oriented modular geodesic with the norm-one unit length.

**Check.** For reciprocal classes use the full 2log ε_D length. A form invariant only under Γ_A does not automatically descend to C_A.

### Elliptic lift spacing

Target `N.2/lift-spacing` (definition). Define V(x)=2arsinh(x/2) for real x. For x≥0 this equals arcosh(1+x²/2) and log(1+(x/2)(√(x²+4)+x)). For positive digit n, V(n)=distℍ(a+i,a+n+i), independent of a. It is strictly increasing. These are distances of specified lifts in ℍ; they are not asserted to be distances of the corresponding cone points in F_A.

**Hypotheses.** Use x≥0 for the arcosh and logarithmic comparisons; the real-bodied arsinh definition is total.

**Proof route.**

1. Substitute the two height-one points into the existing UpperHalfPlane.dist_eq.
2. The elementary hyperbolic-function identities give the two alternate expressions on the nonnegative half-line.
3. Strict monotonicity follows from arsinh, with positive scaling.

**Public API.**

- `liftSpacing_dist`: For n≥0, dist(a+i,a+n+i)=V(n).
- `liftSpacing_strictMono`: V is strictly increasing on ℝ.
- `liftSpacing_cosh`: For x≥0, cosh(V(x))=1+x²/2.
- `liftSpacing_zero`: V(0)=0.

**Uses.** N.3/conformal-class acceptance tests: Detect the source’s invalid replacement of selected lift distances by intrinsic distances; digits are instead recovered from the height-normalized orbit set.

**Discriminating tests.**

- `zero_spacing`: V(0)=0.
- `digit_two_spacing`: cosh(V(2))=3 and V(2)>0.
- `one_cone_warning`: For [4], i and 4+i represent the same cone point of F_A; their intrinsic distance is 0 although their lift spacing V(4)>0.

**Inputs.** `mathlib:UpperHalfPlane.dist_eq`, `N.1/cycle-group`.

**Source.** [DIT16] Last paragraph of Theorem 1 proof, p.959, display V(x). The displayed scalar function is correct; its interpretation as an unqualified intrinsic invariant is replaced in N.3.

**Check.** The scalar normalization agrees with the pinned curvature −1 metric. This definition is not used as an unjustified intrinsic rigidity argument.

**Layer acceptance.** Every target above retains its hypotheses and direct inputs. Every definition’s three tests distinguishes a normalization, boundary or multiplicity error. All definition/API/test statements are in the packet with implementation status unchecked.

## Layer N.3: Conformal recovery of the narrow class

Double the bordered core across its analytic geodesic boundary with cone orders retained. Prove that an orientation-preserving conformal orbifold equivalence lifts to a PSL₂(ℝ) conjugacy. Normalize the unique cusp to ∞, identify the maximal-height elliptic lifts Nₖ+mℤ+i, force the dilation to equal one, and recover the cyclic digit sequence from their successive gaps. Conclude, for a fixed real quadratic field, that the conformal orbifold class of F_A determines A.

### Double of a bordered core

Target `N.3/core-double` (construction). For a finite-area Nielsen core with t≥1 geodesic boundary circles, glue it to a second copy with conjugate complex structure along the identical boundary points. The double is an oriented complete boundaryless hyperbolic orbifold with genus 2g+t−1, twice the cone-order multiset, 2s cusps and area twice the core area. Reflection interchanges the two copies. It has orbifold universal cover ℍ, obtained by reflecting its cut polygon across the genuine geodesic boundary sides.

**Hypotheses.** The core is connected, nonelementary and geometrically finite; each genuine boundary component is a smooth closed geodesic without cone points.

**Proof route.**

1. Use half-disc charts along the boundary and the conjugate chart on the second copy. Geodesic reflection glues them analytically and isometrically; existing interior cone charts remain unchanged.
2. Double a finite cut polygon. The inherited polygon theorem and reflected side identifications give the boundaryless orbifold quotient of ℍ; cusp ends stay complete.
3. Compute Euler characteristic by gluing along t circles, each of Euler characteristic zero. Count the two copies of each cusp and cone orbit and compare area by integration.

**Public API.**

- `coreDouble_inclusions`: Both copies embed isometrically and cover the double, meeting exactly on the common boundary.
- `coreDouble_reflection`: The exchanging map is an antiholomorphic involutive isometry.
- `coreDouble_signature`: Signature is (2g+t−1; m concatenated with m;2s;0).
- `coreDouble_area`: The area is twice area(Core Γ).
- `coreDouble_map`: A conformal boundary-preserving orbifold equivalence doubles uniquely.

**Uses.** N.3/conformal-lift: Reduce bordered conformal rigidity to an actual complete boundaryless quotient of ℍ.

**Discriminating tests.**

- `arithmetic_double`: For signature (0;2 repeated ℓ;1;1), the double has signature (0;2 repeated 2ℓ;2;0).
- `pants_double`: A hyperbolic pair of pants doubles to a closed genus-two surface, of area 4π.
- `no_boundary_reject`: The formula 2g+t−1 is not applied at t=0; doubling a boundaryless connected surface gives two components.

**Inputs.** `N.0/boundary-geodesic`, `N.0/bordered-signature`, `F.1`, `F.2`, `CM.L4`, `AT.7`.

**Source.** [DIT16] Theorem 1 p.957 and final proof paragraph p.959, corrected E20 route. The source asserts conformal recovery, not this explicit double. Doubling is the stated replacement proof mechanism. [UPSTREAM] L4 reflection and FuchsianOrbifolds Layer 2 polygon theorem. The analytic reflection and polygon inputs are imported, while the bordered-orbifold adapter is this target.

**Check.** The double carries the cone orders; it is not the double of the unmarked coarse surface. The complete hyperbolic structure is constructed from reflected charts and polygons.

### Conformal orbifold conjugacy

Target `N.3/conformal-lift` (theorem). An orientation-preserving conformal orbifold equivalence f:Core(Γ_A)→Core(Γ_B), continuous and bijective on their genuine boundaries, is a hyperbolic isometry. It lifts to φ∈PSL₂(ℝ) with φΓ_Aφ⁻¹=Γ_B and φCΓ_A=CΓ_B. The hypothesis preserves each cone order, not just the coarse conformal structure. After composing φ with an element of Γ_B, the unique cusp condition gives φ(∞)=∞, hence φ(z)=az+b for a>0 and b∈ℝ.

**Hypotheses.** A and B belong to the same fixed real quadratic field. The equivalence is holomorphic on the interior in orbifold charts and preserves its orientation and cone orders.

**Proof route.**

1. Double f by reflection using the analytic boundary charts. Remove the cone points and apply the pinned ordinary covering lifting criterion to the covers obtained from the reflected polygon groups, after rebasing the target cover by the doubled f. These punctured surfaces and covering spaces are path connected and locally path connected; choose matching lifted basepoints.
2. The subgroup defining the orbifold universal cover is the normal closure of the mⱼth powers of small cone meridians. Cone-order preservation carries this subgroup to the matching subgroup, so the lift exists in both directions. Local maps extend across removed lifts by the removable-singularity theorem in disc coordinates.
3. Choose matching lifted basepoints in the first halves of the doubles. Uniqueness of based lifts makes the two chosen lifts inverse and supplies deck equivariance; the pinned deck conjugation API packages the resulting cover isomorphism. The inverse lifts extend to a biholomorphism ℍ→ℍ; by the imported disc automorphism/Schwarz–Pick equality classification it is a PSL₂(ℝ) isometry. The corresponding connected preimage halves are the convex, hence simply connected, cores CΓ_A and CΓ_B; their stabilizers in the doubled polygon groups are exactly the original Γ_A and Γ_B. Thus the lift maps these halves onto each other and conjugates their stabilizers. This proves the required core-group conjugacy, not only conjugacy of the larger doubled groups.
4. Conjugacy sends parabolics and their fixed points to parabolics. Since Γ_B has one cusp orbit, compose by its deck element to fix ∞. The real projective normal form is az+b with positive a.

**Inputs.** `N.3/core-double`, `N.1/ford-domain`, `CM.L2`, `CM.L4`, `mathlib:IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`, `tauceti:TauCeti.Deck.conjMulEquiv`, `F.1`.

**Source.** [DIT16] Final proof paragraph p.959, E20 correction. This supplies the omitted intrinsic-to-lift passage; the printed selected-lift-distance argument is not used.

**Check.** The lift is derived from covering theory and cone meridians, not assumed as a field. Forgetting cone marks is expressly insufficient.

### Highest elliptic lifts

Target `N.3/highest-elliptics` (theorem). For Γ(n), the union of all elliptic fixed points has maximal imaginary part 1, and the points attaining it are exactly {Nₖ+jm+i:0≤k<ℓ,j∈ℤ}. More precisely for γ represented by [[a,b],[c,d]] and Pₖ=Nₖ+i, Im(γPₖ)=1/((cNₖ+d)²+c²)≤1; equality holds exactly when γ∈⟨T^m⟩ or γ∈⟨T^m⟩Sₖ. The full stabilizer and the complete list of elliptic orbits are necessary inputs.

**Hypotheses.** n is admissible; matrix entries are integral and determinant one; Sₖ and γ are interpreted projectively. γ belongs to Γ(n), and 0≤k<ℓ. The equality classification is not asserted for arbitrary ambient modular matrices.

**Proof route.**

1. Apply the pinned imaginary-part formula at Pₖ. The denominator is a positive integer, so it is at least one.
2. Equality of the sum of two integer squares to one leaves (c,d)=±(0,1) or c=±1,d=−cNₖ. In the first case γ is a translation; in the second γSₖ is a translation.
3. Use the full cusp stabilizer ⟨T^m⟩, not the ambient modular translation group, to identify the exact maximal-height points. Apply the orbit classification from ford-domain to include all elliptics.

**Inputs.** `N.1/ford-domain`, `mathlib:ModularGroup.im_smul_eq_div_normSq`, `tauceti:UpperHalfPlane.pslMk_smul`.

**Source.** [DIT16] Theorem 1 final proof paragraph p.959, corrected E20 route. This arithmetic height argument replaces the source’s unproved intrinsic interpretation of lift distances.

**Check.** For ℓ=1 the highest lift set has period m despite representing only one cone point. Equality classes use multiples of m, not arbitrary integral translations.

### Conformal class determines the ideal class

Target `N.3/conformal-class` (theorem). For A,B∈Cl⁺(K) in a fixed real quadratic field, there is an orientation-preserving conformal equivalence of bordered orbifolds F_A≅F_B if and only if A=B. It is sufficient to retain the cone points and their orders, the cusp and the oriented bordered conformal structure; the projection to M is not part of the required invariant.

**Hypotheses.** The reduced periods used to construct F_A,F_B are primitive. Conformal equivalence has the precise meaning in conformal-lift.

**Proof route.**

1. Normalize its lift as φ(z)=az+b. Since φ bijects the entire elliptic fixed-point sets and scales their heights, the maximum-height theorem gives a=1.
2. The full positive cusp translation period therefore agrees: m_A=m_B. Translation by b carries the cyclic ordered sets of height-one lifts modulo m onto one another.
3. Their positive successive gaps are the digit cycles, up to cyclic rotation. Apply the imported complete-invariant theorem of GN.3 to conclude A=B. Conversely equal classes have rotated reduced periods and rotation-conjugacy supplies the equivalence.

**Inputs.** `N.3/conformal-lift`, `N.3/highest-elliptics`, `N.1/rotation-conjugacy`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`.

**Source.** [DIT16] Theorem 1 p.957 and last proof paragraph p.959. This is the asserted conformal injectivity, with a fully specified replacement for E20.

**Check.** No claim is made for antiholomorphic equivalences, which reverse cyclic order. For [3,6], V(3) and V(6) need not be the same intrinsic distance between the two cone points.

**Layer acceptance.** Every target above retains its hypotheses and direct inputs. Every definition’s three tests distinguishes a normalization, boundary or multiplicity error. All definition/API/test statements are in the packet with implementation status unchecked.

## Layer N.4: Core measures and complementary coverings

Push the finite upstairs core measure to the modular orbifold, retaining all multiplicities. Define normalized finite-family and genus probability measures. Prove ν_A+ν_{JA⁻¹}=3(ℓ_A+ℓ_{JA⁻¹})μ_mod as an equality of measures, including self-intersections and reciprocal boundaries. Deduce exact modular probability for the whole narrow class group, any genus when J is a square, and an individual class with A²=J. The asymptotic equidistribution theorem remains with GN.4. Work D=12 and D=28 explicitly, including complementary multiplicities 9 and 21.

### Modular boundary convention

Target `N.4/dit-domain` (definition). Let F_DIT be the subset of ℍ given by (−1/2≤Re z≤0 and |z|²≥1) or (0<Re z<1/2 and |z|²>1). It is the half-open representative convention of DIT. Its interior is the pinned open modular domain fdo, and its symmetric difference with fdo has hyperbolic area zero. Use the parent’s modular quotient and its measure μ_mod of total mass π/3; this adapter introduces no new modular fundamental-domain theorem.

**Hypotheses.** The group is effective PSL₂(ℤ); area uses the invariant volume instance on ℍ.

**Proof route.**

1. Write the displayed inequalities as a measurable set.
2. Its difference from fdo is contained in two vertical rays and the unit semicircle, which are planar-null and hence invariant-area-null by the pinned boundary-null theorem.
3. Use the existing a.e. fundamental domain and parent’s modular quotient measure to identify integrals. Tie choices matter only for representatives, not for area.

**Public API.**

- `ditDomain_mem`: Membership is the displayed pair of inequalities.
- `ditDomain_measurable`: F_DIT is measurable.
- `ditDomain_ae_fdo`: F_DIT=fdo almost everywhere for hyperbolic area.
- `ditDomain_integral`: For any integrable invariant function, its integral on F_DIT agrees with the modular quotient integral.

**Uses.** N.4/core-measure and DIT §4 (4.3): Translate the paper’s planar test sets into quotient Borel sets without reassigning mass to boundary points.

**Discriminating tests.**

- `central_vertex`: i∈F_DIT although i∉fdo.
- `vertical_tie`: −1/2+2i belongs and 1/2+2i does not.
- `circular_tie`: −1/2+(√3/2)i belongs, while 1/2+(√3/2)i and the positive-real-part open semicircle do not.

**Inputs.** `mathlib:ModularGroup.fdo`, `tauceti:ModularGroup.isFundamentalDomain_fdo`, `tauceti:UpperHalfPlane.volume_preimage_coe_null`, `F.6`.

**Source.** [DIT16] §2 p.953, definition of F. Only the displayed left/right boundary selection is new; its quotient and area belong to the parent.

**Check.** The point i is included, and positive-real-part points on the unit semicircle are excluded. All subsequent measure equalities are independent of this null boundary choice.

### Projected core measure

Target `N.4/core-measure` (construction). Equip F_A with the hyperbolic orbifold area measure μ_A, and define ν_A=(p_A)₊μ_A on M. Thus ν_A(E)=area_A(p_A⁻¹E) for Borel E⊆M. Its total mass is πℓ_A. Equivalently, for a Borel Ω in the interior of F_DIT, ν_A(π_mod Ω)=area(Q_A∩(PSL₂(ℤ)·Ω)); this counts the distinct sheets in Q_A. The image set p_A(F_A) with restricted modular area is generally a different measure.

**Hypotheses.** D>1 is positive fundamental and A is a narrow class; use the actual core and canonical map from N.2.

**Proof route.**

1. Use the inherited quotient area construction on Q_A; its null side boundaries give polygon independence.
2. Apply the pinned measurable pushforward. Properness of p_A and local orbifold charts imply locally finite sheet multiplicity off its projected boundary; it is integer-valued almost everywhere.
3. Compute total mass by core-invariants. Pull Borel sets and integrable functions back through p_A; the DIT polygon identity follows by the orbit relation and a.e. fundamental representatives.

**Public API.**

- `coreMeasure_apply`: ν_A(E)=μ_A(p_A⁻¹E) for Borel E.
- `coreMeasure_mass`: ν_A(M)=πℓ_A.
- `coreMeasure_integral`: ∫_M f dν_A=∫_F_A f∘p_A dμ_A for integrable f.
- `coreMeasure_rotation`: Rotating the period leaves ν_A unchanged.
- `coreMeasure_density`: Away from projected boundary and cone points, the density is the finite local sheet count.

**Uses.** N.4/complementarity and GN.4 equidistribution: State both exact covering and limiting distribution for the same measure, including repeated sheets. N.5/spectral-stokes: Identify modular spectral test integrals with upstairs core integrals.

**Discriminating tests.**

- `mass_D28`: The principal D=28 core has projected mass 2π, whatever its overlapping image looks like.
- `empty_set`: ν_A(∅)=0 and ν_A(M)=πℓ_A>0.
- `reciprocal_multiplicity`: When A²=J, exact-cover gives ν_A=3ℓ_A μ_mod; replacing it by area on its image would lose the factor 3ℓ_A.

**Inputs.** `N.2/class-core`, `N.2/core-invariants`, `N.4/dit-domain`, `mathlib:MeasureTheory.Measure.map_apply`, `mathlib:MeasureTheory.integral_map`.

**Source.** [DIT16] §4 pp.959–960, (4.3) and complementary-cover paragraph. The surface-area statistic is a pushforward with multiplicities; this makes the paper’s intersection notation precise.

**Check.** ν_A(M)=πℓ_A, not π/3 merely because the image covers M. Equality is an equality of Borel measures, not only an identity on one test disc.

### Genus surface probability

Target `N.4/family-probability` (definition). For a nonempty finite family S⊆Cl⁺(K), let L_S=Σ_{A∈S}ℓ_A and ρ_S=(πL_S)⁻¹Σ_{A∈S}ν_A, where the scalar on measures is the corresponding nonnegative extended real. Then L_S>0 and ρ_S is a probability measure. A genus family means a coset of Cl⁺(K)² in the already-owned narrow class group; use exactly that existing genus notion. The modular probability is μ_prob=(3/π)μ_mod.

**Hypotheses.** D>1 is positive fundamental; S is finite and nonempty, and each primitive period has positive length.

**Proof route.**

1. Take a finite sum of the finite positive measures from core-measure.
2. Use positivity of the period lengths to justify division, and the total-mass formula to obtain mass one.
3. For a genus, import the existing square subgroup/coset, rather than defining another genus carrier.

**Public API.**

- `familyProbability_mass`: ρ_S(M)=1.
- `familyProbability_apply`: ρ_S(E)=Σν_A(E)/(πL_S) for Borel E.
- `familyProbability_singleton`: ρ_{ {A} }=ν_A/(πℓ_A).
- `familyProbability_union`: For disjoint nonempty families, ρ_{S∪R} is the L-weighted mixture of ρ_S and ρ_R.
- `familyProbability_genus`: Changing the representative of the same coset changes neither S nor ρ_S.

**Uses.** N.4/exact-cover and GN.4: Use exact and asymptotic equidistribution with one common positive normalization.

**Discriminating tests.**

- `unequal_period_weights`: For D=28 and S={I,J}, the normalized sum has total denominator 7π, not 2π.
- `empty_rejection`: The empty family is excluded; its zero sum cannot define a probability measure.
- `modular_normalization`: For every exactly covered family, a modular test set of area a has probability 3a/π.

**Inputs.** `N.4/core-measure`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`, `MultiquadraticPartII:RQ.2/J-square-iff-sumTwoSquares`, `F.6`, `tauceti:NumberField.NarrowClassGroup.instFinite`.

**Source.** [DIT16] §4 p.959, (4.1)–(4.3). The paper’s area-normalized genus statistic becomes a probability measure with this normalization.

**Check.** Normalization uses Σℓ_A, not the number of classes. No division by zero is hidden in an empty genus or family.

### Complementary class surfaces

Target `N.4/complementarity` (theorem). Let J be the narrow class of the different, J²=1, and let ι(A)=JA⁻¹. Then ν_A+ν_{ι(A)}=3(ℓ_A+ℓ_{ι(A)})μ_mod. Equivalently the combined local sheet count is the indicated integer almost everywhere. The projected oriented boundaries agree with opposite parametrizations. This statement includes A=ι(A), reciprocal projected geodesics and repeated or crossing arcs.

**Hypotheses.** D>1 is positive fundamental; ν_A is the multiplicity-preserving pushforward and μ_mod has mass π/3.

**Proof route.**

1. Import the oriented geodesic-reversal identity from GN.4 and the full once-traversed boundary identification from N.2/boundary-length. Thus the pushed-forward oriented boundary arcs cancel with signed multiplicity, even when their images retrace.
2. By properness and the local isometry charts, each ν has a finite integer local density on the regular modular surface away from the locally finite projected boundary. It is constant on each chamber; crossing an oriented smooth boundary arc changes it by its signed number of preimages.
3. Opposite parametrized boundary arcs make all jumps of the sum zero. Join generic regular points by paths transverse to smooth arcs and avoiding the finitely many exceptional crossings in a compact segment; approximation handles coincident arcs. The regular modular surface is connected, so the sum density is one constant almost everywhere.
4. Projected boundary and cone sets are area-null. Compare total masses π(ℓ_A+ℓ_ιA) and π/3 to determine the constant. The cusp width computation gives the independent check m_A+m_ιA=3(ℓ_A+ℓ_ιA), since high in the cusp both cores are full strips.

**Inputs.** `N.4/core-measure`, `N.2/core-invariants`, `N.2/boundary-length`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/geodesic-orientation-reversal`, `F.6`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `tauceti:NumberField.NarrowClassGroup.mkPrincipal_sq`.

**Source.** [DIT16] §4 p.960, paragraph after (4.4). The source asserts even complementary covering. The local-density argument supplies a precise proof for pushforward measures rather than a union of sets.

**Check.** For D=12 the pair has density 9; for D=28 it has density 21. If A=ι(A), the factor of two on the left is retained.

### Exact genus covering

Target `N.4/exact-cover` (theorem). If a nonempty finite family S is stable under ι(A)=JA⁻¹, then Σ_{A∈S}ν_A=3(Σ_{A∈S}ℓ_A)μ_mod and ρ_S=μ_prob. In particular this holds for the entire narrow class group; for every genus if J∈Cl⁺(K)²; and for {A} when A²=J. The imported arithmetic criterion says J is a square exactly when no prime p≡3 mod 4 divides D, equivalently D is a sum of two integer squares. The latter criterion is not the stronger assertion J=1 or existence of a negative-norm unit.

**Hypotheses.** Use the same fundamental discriminant and narrow group as the supplier. A genus is a coset of the square subgroup.

**Proof route.**

1. Sum complementarity over S. The involution permutes S, so the left sum is twice Σν_A and the length sum is twice Σℓ_A; divide the finite real measure identity by two.
2. In the exponent-two genus quotient inversion is the identity, and multiplication by J preserves each coset exactly when J is a square. Apply the imported RQ.2 criterion without reproving genus theory.
3. For A²=J, ι fixes A and complementarity directly gives ν_A=3ℓ_Aμ_mod. Divide by the positive total mass for probability normalization.

**Inputs.** `N.4/complementarity`, `N.4/family-probability`, `MultiquadraticPartII:RQ.2/J-square-iff-sumTwoSquares`, `tauceti:NumberField.NarrowClassGroup.instFinite`.

**Source.** [DIT16] §4 p.960, complementary covering and principal-genus paragraph. These are the source’s exact-equality cases of the surface distribution statement.

**Check.** D=12 and D=28 have J nonsquare; exact covering of {I,J} does not imply exact covering of either singleton. For the arithmetic criterion the RQ.2 hypotheses are used verbatim with D=fundamentalDiscriminant(d).

### Discriminants twelve and twenty-eight

Target `N.4/small-discriminants` (application). For D=12 the principal class has period [4], m=4, area π and boundary length 2log(2+√3); J has period [3,2], m=5 and area 2π with the same boundary length. For D=28 the principal class has period [3,6], m=9 and area 2π; J has period [3,3,2,2,2], m=12 and area 5π, with common length 2log(8+3√7). Their complementary-cover multiplicities are respectively 9 and 21. All signatures have g=0,s=t=1 and the indicated number of order-two cone points.

**Hypotheses.** Use the imported form/ideal class dictionary and minimal norm-one units; these examples do not claim a general class-number-one theorem.

**Proof route.**

1. Check reduced roots: D=12 uses 2+√3 and (3+√3)/2; their digit recurrence gives [4] and [3,2]. The norm-two ideal (2,3+√3)=(1+√3) has negative norm generator and represents J.
2. For D=28 use (3+√7)/2 and (5+√7)/3 as in the source. Their integral ideals (2,3+√7) and (3,5+√7) are generated by 3+√7 of positive norm and 2+√7 of negative norm, respectively.
3. Verify minimal norm-one units directly by the least positive Pell solution; apply core-invariants and boundary-length. Complementarity gives 3(1+2)=9 and 3(2+5)=21.

**Inputs.** `N.2/core-invariants`, `N.2/boundary-length`, `N.4/complementarity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`.

**Source.** [DIT16] §3 example pp.955–957, Figures 1–6. D=28 is the source’s worked example; the D=12 calculation is an additional test derived by the same explicit recurrence.

**Check.** The D=12 example is checked arithmetically rather than attributed as a printed example. Areas count sheets, so their sums can exceed π/3.

**Layer acceptance.** Every target above retains its hypotheses and direct inputs. Every definition’s three tests distinguishes a normalization, boundary or multiplicity error. All definition/API/test statements are in the packet with implementation status unchecked.

## Layer N.5: Cusp-truncated Stokes and spectral inputs

Construct height truncations of the actual core polygon and their oriented boundary bookkeeping. For C² Γ_A-invariant F with −y²(F_xx+F_yy)=λF and vanishing horizontal ∂z flux, prove existence of the height-truncated integral and (λ/2)I_A(F)=∮∂F_A i∂zF dz. Give the L¹ version and the level-one Maass/Eisenstein critical-line specializations from AS Fourier and differentiated cusp inputs; replace the boundary by C_A only for full modular invariance. Import ordinary/corners Stokes from current DifferentialGeometry Layer 5.

### Cusp-truncated core

Target `N.5/core-truncation` (construction). Choose Y>1 above every finite boundary arc of Q_A and put Q_A(Y)=Q_A∩{Im z≤Y}. It is a compact piecewise smooth region with top segment 0≤x≤m at height Y. With the orientation dx∧dy, this segment is traversed from m+iY to iY. Its remaining edges consist of the true positively oriented core boundary and oppositely paired polygon sides. For C² F invariant under Γ_A, set α_F=i∂zF dz, with ∂zF=(F_x−iF_y)/2. It is an invariant one-form; it is not the real exterior derivative of F.

**Hypotheses.** F is complex-valued and C² in real coordinates; side pairings are holomorphic, and genuine boundary orientation has the core on its left.

**Proof route.**

1. The explicit core polygon has a full width-m strip above its finite boundary arcs. Intersect with the height half-plane to get a compact finite-corner region.
2. Orient each edge as a boundary of the planar region. Paired sides cancel after pullback by their holomorphic isometries; the horizontal top has the stated right-to-left direction.
3. For cone vertices use their order-two local covers, or excise small discs and let their radii tend to zero. C¹ boundedness near lifts makes the extra integrals vanish.

**Public API.**

- `coreTruncation_compact`: Q_A(Y) is a compact finite-corner region for sufficiently large Y.
- `coreTruncation_exhaust`: The increasing height truncations exhaust Q_A.
- `coreTruncation_top`: Above the finite arcs, the added top side has width m and right-to-left orientation.
- `coreTruncation_pairCancel`: The α_F integrals on a paired pair of polygon sides sum to zero.
- `coreTruncation_rotation`: Translation conjugacy transports truncations and preserves their height parameter.

**Uses.** N.5/core-stokes: Convert the compact Stokes identity to a cusp-height limit without changing the true boundary.

**Discriminating tests.**

- `constant_test`: For F=1, α_F=0, so every boundary and top contribution vanishes.
- `local_sign_test`: For the local coordinate function F=y, α_F=dz/2, so its right-to-left top integral is −m/2; this is a sign test, not an assertion that y is Γ_A-invariant.
- `cusp_tail`: For F=1 and Y sufficiently large, the area of the omitted cusp tail is exactly m/Y, so the truncation is not compactification by a point.

**Inputs.** `N.2/class-core`, `N.2/axis-cutting`, `N.1/cycle-polygon`, `F.1`.

**Source.** [DIT16] Lemma 2 proof p.972, F_A(Y) and boundary terms. The source truncates the cusp and discards paired sides; this construction pins orientation and handles cone/corner bookkeeping.

**Check.** Paired vertical and circular sides are absent from the true boundary integral. The top contribution is −i∫₀ᵐ∂zF(x+iY)dx.

### Nielsen-core Stokes formula

Target `N.5/core-stokes` (theorem). Let F:ℍ→ℂ be C², Γ_A-invariant and satisfy ΔF=−y²(F_xx+F_yy)=λF with λ∈ℂ. Assume ∫₀ᵐ∂zF(x+iY)dx→0 as Y→∞. Then I_A(F)=lim_{Y→∞}∫_{Q_A(Y)}F dμ exists as a finite complex number and (λ/2)I_A(F)=∮_{∂F_A}i∂zF dz. When F is μ_A-integrable this limit is its ordinary integral. No absolute integrability is claimed solely from the flux hypothesis. If F is invariant under the full modular group, the right side is the integral along the complete parametrized C_A.

**Hypotheses.** The differential operator is curvature −1 with the minus sign and factor y². The complex-valued integral is in the orientation of N.2.

**Proof route.**

1. In real coordinates d(i∂zF dz)=−(F_xx+F_yy)dx∧dy/2=(λ/2)F dμ. Apply imported ordinary/corners Stokes to the real and imaginary parts on Q_A(Y), multiplying by a smooth cutoff equal to one on a neighborhood of this compact polygon to meet the supplier’s compact-support hypothesis; the one-form is C¹ and all side/cone cancellations are given by core-truncation.
2. The exact finite identity is (λ/2)∫_{Q_A(Y)}F dμ=∮_{∂F_A}α_F−i∫₀ᵐ∂zF(x+iY)dx. For λ≠0 the assumed flux convergence gives existence and the limit formula.
3. For λ=0, write a(Y)=∫₀ᵐF(x+iY)dx. Translation periodicity and the harmonic equation give a″=0; integrating F_x over a period gives zero, so the flux is −ia′/2. Its limit zero forces a′=0, and the tail integral ∫a(Y)Y⁻²dY converges. Thus the height-truncated integral exists in this case as well.
4. For L¹ functions use exhaustion/dominated convergence to compare with the measure integral. Γ_A-invariance already permits all the cutting maps Sₖ and T^m, so boundaryCut_isometry identifies the boundary integral with the integral on the selected axis segment in ℍ. Full modular invariance is needed to descend the form to M and interpret this intrinsically as an integral along the complete parametrized modular cycle C_A.

**Inputs.** `N.5/core-truncation`, `N.2/axis-cutting`, `mathlib:UpperHalfPlane.volume_def`.

**Current upstream input.** DifferentialGeometry Layer 5 ordinary/corners Stokes, as specified in the supplier ledger.

**Source.** [DIT16] Lemma 2, (7.10)–(7.11), p.972. The source proves the flux-to-boundary identity. The plan specifies its improper interpretation and separately proves existence when λ=0.

**Check.** The coefficient is λ/2, not λ or λ/(2i). For F=1 and λ=0 both sides vanish while I_A(1)=πℓ_A. No division by λ occurs in the harmonic branch.

### Automorphic surface-to-cycle identity

Target `N.5/spectral-stokes` (theorem). For a smooth level-one weight-zero Maass cusp eigenfunction u with eigenvalue λ, and for the completed weight-zero Eisenstein function E*(z,1/2+it) of AS.1–AS.2 with t∈ℝ, both the L¹ core integral and the horizontal flux condition hold. For each such F, (λ_F/2)∫_{F_A}F dμ=∫_{C_A}i∂zF dz, where λ_E=1/4+t² and λ_u is the given cusp eigenvalue. At t=0 take the regular holomorphic value of the completed Eisenstein function, with cancellation between its two constant terms. This endpoint is not defined by evaluating two separate pole terms.

**Hypotheses.** Use the AS completion E*=Λ(2s)E, including its half-sum normalization, continuation and poles only at s=0,1. Cusp forms have zero horizontal Fourier constant term.

**Proof route.**

1. Import the AS Fourier expansions and the differentiated cusp estimates requested below. Nonzero Fourier modes and their first derivatives decay exponentially on high strips, and integrating over the integer width m kills them exactly.
2. For cusp forms the horizontal mean is zero. For E* on Re s=1/2 its constant term is O(√Y log Y), including the removable t=0 cancellation, and its derivative is O(Y⁻¹/² log Y). Therefore the horizontal flux tends to zero.
3. The same growth makes |F|Y⁻² integrable over the width-m cusp strip; compact remainder integrability follows from smoothness and finite orbifold charts.
4. Apply core-stokes and full modular invariance. No Hecke normalization, parity, subconvexity or asymptotic equidistribution proof is added here.

**Inputs.** `N.5/core-stokes`, `N.4/core-measure`, `AutomorphicSpectralTheory:AS.1/dit-57`, `AutomorphicSpectralTheory:AS.1/dit-58`, `AutomorphicSpectralTheory:AS.2/dit-59`, `AutomorphicSpectralTheory:AS.2/dit-60`, `AutomorphicSpectralTheory:AS.2`, `AutomorphicSpectralTheory:AS.4`.

**Source.** [DIT16] §5 pp.961–962, (5.2)–(5.7); Lemmas 1–2 p.972, (7.9)–(7.11). These are the spectral functions and surface-to-cycle specializations, with the corrected Laplacian and critical-line endpoint convention.

**Check.** The cusp eigenfunction is not rescaled by the Fourier coefficient convention. At s=1/2, a √Y log Y bound suffices; no false uniform O(√Y) estimate is required.

**Layer acceptance.** Every target above retains its hypotheses and direct inputs. Every definition’s three tests distinguishes a normalization, boundary or multiplicity error. All definition/API/test statements are in the packet with implementation status unchecked.

## Suggested Lean projection and validation

The companion file follows the newer streamlined shape rule in WORKERS.md. Its 266 lines contain real-bodied scalar area, list admissibility/prefix, projective matrix/group, polygon, lift-spacing and half-open modular-domain expressions. The translation and height-one point helpers use existing carriers. Statements include area normalizations, cyclic conjugacy, the boundary-word identity, the integral height bound, lift distances and the null-boundary comparison; examples cover the excluded all-2 and empty cycles, [4], [3,6], the modular signature and boundary ties.

The ideal hull, quotient orbifold, double, class-indexed measures and cusp-truncation targets have their full statements, API and tests above. They have no invented Lean substitute carriers or records whose assumed fields encode the desired theorem. Their signatures await the carriers owned by the suppliers. This is the explicit reader-only projection required by the current roadmap shape, not a claim that the compact file is exhaustive.

`lean-check` elaborated the suggested file in the shared build at the two baseline pins; its only warnings are the intended unproved theorem/example placeholders. No data definition uses such a placeholder. `check_blueprint.py` reports zero errors and zero warnings against the installed pinned declaration index. All 27 source-route items are mapped to nodes in `extractionCoverage`; every stage remains planned. The independently reviewed complete target-level pass has zero recorded proof gaps, 13 atlas-stage requests and two current-upstream imports (Stokes and the oriented form/ideal dictionary). Supplier interfaces remain implementation obligations; no stage is certified as implemented or closed.

## References

- **[DIT16]** W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic fields*. Annals of Mathematics 184 (2016), no. 3, 949–990, version of record; DOI 10.4007/annals.2016.184.3.8. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Read: §2 pp.950–954, arithmetic conventions and Nielsen region; §3 pp.954–959, complete proof of Theorem 1 and Figures 1–7; §4 pp.959–960, complementary surfaces and exact covering cases; §5 pp.961–962, eigenvalue and Fourier normalizations; §7 Lemmas 1–2 and (7.9)–(7.11), p.972; Images of pp.958, 959 and 972 checked against text extraction.

- **[LU23]** Zhipeng Lu, *Geodesic cover of Fuchsian groups*. Annales mathématiques Blaise Pascal 30 (2023), no. 2, 189–199; DOI 10.5802/ambp.421. [Source](https://www.numdam.org/item/10.5802/ambp.421.pdf). Read: §3.1 pp.194–195, geometric finiteness, second-kind hypothesis, Nielsen region and Proposition 3.5; §3.2 pp.196–197, horocyclic truncation; §3.3 p.198, finite-sided Nielsen intersections and funnels.

- **[SERIES05]** Caroline Series, *A Crash Course on Kleinian Groups*. Rendiconti dell’Istituto di Matematica dell’Università di Trieste 37 (2005), 1–38; journal-hosted notes. [Source](https://rendiconti.dmi.units.it/volumi/37/01.pdf). Read: The convex core, pp.32–33, especially the two-dimensional Fuchsian statement after Proposition 4.60; Theorem 3.33 p.21, finite generation and geometric finiteness for Fuchsian groups.

- **[UPSTREAM]** The Tau Ceti roadmap contributors, *Current supplier roadmaps and completed covering theory*. 0d144d044dacebca17b654695b6f1ad58f159b27. [Source](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27). Read: FuchsianOrbifolds README and Suggested.lean, Layers 0–6; ConformalMapping README L2/L4; DifferentialGeometry README Layer 5.3/5.5 and Suggested.lean Stokes signatures; AlgebraicTopology Stages 1/7; Completed/UniversalCovers README Stage 2, STATUS and Suggested.lean: ordinary lifting and deck conjugation are already implemented, including at the packet baseline; IntegralLattices README Layer B2–B3 and Suggested.lean LayerBContract; GlobalNumberFields owns the consumed order/NarrowPic carriers; Current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039: OnePoint projective action, UpperHalfPlane polygon/measure and Fuchsian quotient/cusp files searched; no limit-set or Nielsen-core API found.
