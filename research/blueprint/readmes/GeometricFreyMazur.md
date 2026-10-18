# Modular curves, following Katz–Mazur, Part II: geometric Frey–Mazur and bounded-gonality rigidity

For every positive integer N there is a threshold M_N such that, over every algebraically closed field k of characteristic zero, nonisotrivial elliptic schemes E and E′ on a smooth connected quasiprojective curve U with gon(U)<N are isogenous over U whenever their actual F_p torsion local systems are isomorphic and p>M_N. The threshold is uniform in k, U and the families. The proof goes through a stronger rigidity theorem: every nonconstant map from such a curve to the modular quotient surface Z(p) has Hecke image. The function-field statement, bounded-genus consequences and the rational-curve description on a smooth minimal model are targets as well.

The first prerequisite is [Modular curves, following Katz–Mazur](../../../content/tau-ceti/ModularCurves/README.md). Its field/descent and full-level interfaces, and ModularCurvesPartII R12–R14, own the elliptic curves, level curves, analytic/algebraic comparisons, compactification and cyclic correspondence objects. This extension owns the projective-frame adapters, proof-specific loci and estimates, the gonality pullback and the linear descent bridge. General hyperbolic volume theory belongs to HyperbolicCurveVolumesAndGonality; its numerical spectral input belongs to CongruenceSpectralGap. General curve, étale-cover, abelian-scheme, comparison and surface foundations stay with their cited owners. In particular the surface symmetric power used here is a finite quotient of a surface power, rather than an invocation of a curve symmetric power.

All statements below are mathematical targets. The suggested Lean file is an aid to signatures, not an exhaustive checklist or a specification of library architecture; the prose, including every Check, governs. It uses only existing carriers and light formulas. The modular-surface, cycle-measure and relative elliptic-scheme constructions require their cited interfaces before they can be expressed faithfully in Lean.

## Conventions and boundaries

* A curve is connected and smooth unless a normalization or a cycle is explicitly specified. Gonality of an open curve means gonality of its smooth proper model. A nonconstant map to a projective surface extends across the omitted points; this asserts no extension of good reduction for its elliptic families.
* p is prime. Geometry over k has characteristic zero; hyperbolic metrics are formed only after complex realization. The metric argument has p>5. Limits and implicit constants always fix all small exponents before p grows.
* X(p) is the **two-component** coarse curve of projective p-frames. G=PGL₂(F_p) acts on it; G₀=PSL₂(F_p) preserves a selected component. Projectivizing a frame retains the elliptic involution, so no fine universal elliptic family is inferred. A determinant component of Z(p) has a fixed-pairing G₀ quotient presentation, with a conjugated second action when required.
* Write S=X(p)×X(p), Z(p)=S/G and H_m for the image of the cyclic prime-to-p Hecke correspondence T_m in Z(p). A Hecke curve is an irreducible component of H_m. Its cyclic projection degree is ψ(m)=m∏_(ℓ|m)(1+1/ℓ), not the full divisor sum. In particular ψ(4)=6.
* Distances on powers use the maximum of coordinate distances. Areas of complex curves use the sum of pulled-back curvature −1 forms. For an effective parametrized curve cycle C, Deg(C) is its product canonical degree, including generic map multiplicities, and vol(C)=2πDeg(C). The injectivity radius is **half** the shortest nontrivial geodesic length.
* CM⁺ and CM⁻ are the equal and opposite tangent-character strata of the common elliptic stabilizer. SBC consists of cusp pairs with a common nonidentity stabilizer; its inertia has order p. Big diagonals Δ_g have complex codimension two and are not divisors.
* A negative-determinant rational reconstruction defines a conjugate Hecke locus. Such a locus is real analytic in the original complex surface. It has meaningful metric tubes but is assigned no divisor intersection number. The conjugate branch is required in the bicusp and overlap arguments as well as in the CM⁻ argument.
* An actual isomorphism E[p]≃E′[p] is retained throughout descent. Its projective class suffices to construct the coarse classifying map but does not suffice to descend an isogeny. No semisimplification is taken. There is no numerical p>17 theorem over Q, nor a positive-characteristic extension, in this roadmap.

## Sources and reusable inputs

The primary source is Bakker–Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields*, Annals of Mathematics 184 (2016), 709–744, together with the complete five-page author erratum. Locators use the published page numbers for the article and the PDF page numbers for the erratum. The article and erratum are separate sources. Abramovich's *A linear lower bound on the gonality of modular curves* is cited by Theorem 0.1 and §§1.1–1.7, pages 1–3 of its five-page preprint. For extension of isogenies, Bosch–Lütkebohmert–Raynaud, *Néron Models*, §1.2 Proposition 8, page 15, and §1.4 Proposition 2, page 19, give the abelian-scheme mapping input. Only these book passages are used.

The source statements are used with the corrections and additional arguments below. No source passage is reproduced. Statements labeled as new arguments are not attributed to the authors' erratum. The article's general-type claim and any uniqueness assertion for a minimal model are unnecessary here; the surface application needs existence of some smooth minimal model and classification of its rational curves.

At Mathlib 082e2d3 and Tau Ceti f790474, use the existing projective linear groups, matrix entrywise sup norm, subgroup index, cardinality-indexed multisets and transvection generation. In particular Mathlib already proves SL₂ perfectness as Matrix.SL2.commutator_eq_top under a≠0 and a²≠1; specialize it for p>3 instead of building another perfectness theory. The index proof below is a new application of existing generation. The current Tau Ceti quadratic-twist point equivalence already has its quadratic-character cocycle formula; this roadmap uses that interface and plans only its application to actual torsion descent.

The following layers give every target with its prerequisites and proof route. Each construction includes its consumer-derived API and discriminating Checks. Mathematical details of the delicate routes follow the inventory.


## GF.0: Projective frames, quotient surface and special loci


### Projective p-frames and their two components

Target `GeometricFreyMazur:GF.0/projective-frames` (construction).

For a prime p>3 over an algebraically closed characteristic-zero field, form the projective-frame coarse curve Y(p) from the existing full-level curve by identifying bases φ:F_p²≃E[p] under φ↦aφ for a∈F_p×. Let X(p) be its imported smooth proper compactification. The Weil-pairing value on a basis, modulo squares, labels exactly two geometric connected components. G=PGL₂(F_p) acts by g·(E,[φ])=(E,[φ∘g⁻¹]); its component-preserving subgroup is PSL₂(F_p). The construction uses existing level moduli, rather than a new elliptic-curve or compactification object.


Proof/construction route:

1. Apply the full-level and coarse-space interfaces, including boundary p-gons, then take the finite scalar quotient. Scalar change squares the determinant pairing; the two square classes account for the components by the imported connectedness theorem.
2. Descend the GL₂ right action with the inverse so that it is a left G-action. Compare a chosen fixed-pairing component with the usual Γ(p) quotient, accounting for the central ±I.
3. Transport all algebraic maps through characteristic-zero base change; complex conjugation transports the pairing and its component label. Projective framing retains the automorphism [-1], so this coarse space is not a fine moduli space with a universal elliptic scheme.


API:

* `TauCeti.GeometricFreyMazur.projectiveFrame_class` (constructor): Send an actual ordered torsion basis to its scalar class.
* `TauCeti.GeometricFreyMazur.projectiveFrame_eq` (characterisation): Two bases give the same class exactly when they differ by a common nonzero scalar, modulo the existing elliptic isomorphism relation.
* `TauCeti.GeometricFreyMazur.projectiveFrame_action` (simp): Precomposition by g⁻¹ evaluates the left action; identity and multiplication satisfy the action laws.
* `TauCeti.GeometricFreyMazur.projectiveFrame_pairing` (data): The determinant pairing descends to a square class, independent of a scalar representative.
* `TauCeti.GeometricFreyMazur.projectiveFrame_component` (compatibility): A fixed-pairing full-level component maps to the selected projective component with effective deck group PSL₂(F_p).
* `TauCeti.GeometricFreyMazur.projectiveFrame_baseChange` (functoriality): Characteristic-zero algebraically closed base change and conjugation commute with the scalar quotient and compactification.


Checks:

* `TauCeti.GeometricFreyMazur.projective_frames_test1`: For p=7 the six possible nonzero pairing values become two square classes, rather than six components.
* `TauCeti.GeometricFreyMazur.projective_frames_test2`: φ and 2φ define the same projective frame; changing only one basis vector by a nonsquare changes the component.
* `TauCeti.GeometricFreyMazur.projective_frames_test3`: [-1] preserves [φ], so projective framing does not rigidify all automorphisms.


Consumers:

* BT16 §2.3, p. 715: Supplies the two factors and their effective diagonal action.
* GF.8 full monodromy: Compares actual SL₂ image with the effective PSL₂ modular quotient.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.4`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.2`, `ModularCurvesPartII:R13.4a`, `mathlib:Matrix.ProjGenLinGroup`, `mathlib:Matrix.ProjGenLinGroup.mk_eq_mk_iff`.


Source: BT16, §§2.1–2.2, pp. 713–715. Projective p-frames and their two components is the source input; the statement here fixes the conventions needed by its consumers.


### The diagonal quotient surface

Target `GeometricFreyMazur:GF.0/diagonal-quotient` (construction).

Let S=X(p)×X(p) and Z(p)=S/G for the diagonal projective-frame action. This is a normal projective coarse surface, finite below S. Its smooth-level geometric points classify (E₁,E₂,[ψ]) with ψ:E₁[p]≃E₂[p] up to common scalar. The square class of det ψ labels its two components. For each determinant square class choose a fixed-pairing component presentation by a diagonal, possibly conjugated, PSL₂ action; changing the auxiliary nonsquare gives an equivariantly isomorphic presentation.


Proof/construction route:

1. Apply the finite quotient universal property to S, using a norm of an ample line bundle to supply an invariant projective embedding.
2. Composition φ₂φ₁⁻¹ is invariant under simultaneous framing change. Conversely two framed presentations of the same triple differ by a diagonal element of G.
3. Reduce each G-orbit to a selected first component. Its stabilizer is PSL₂, while the second component records the determinant square class; a chosen nonsquare identifies that component with the first and conjugates its action. Prove independence before using the erratum’s fixed-pairing notation.


API:

* `TauCeti.GeometricFreyMazur.quotientSurface_mk` (constructor): The finite map S→Z sends two frames to their composed projective torsion isomorphism.
* `TauCeti.GeometricFreyMazur.quotientSurface_desc` (universal-property): An invariant morphism out of S factors uniquely through Z, with the stated finite quotient hypotheses.
* `TauCeti.GeometricFreyMazur.quotientSurface_orbit` (characterisation): Geometric fibres are exactly diagonal G-orbits.
* `TauCeti.GeometricFreyMazur.quotientSurface_fixedPairing` (equivalence): Each determinant component is the appropriate PSL₂ quotient of two selected components; a nonsquare changes the second action by conjugation.
* `TauCeti.GeometricFreyMazur.quotientSurface_swap` (functoriality): Swapping factors inverts [ψ]; simultaneous conjugation transports the quotient and its determinant component.
* `TauCeti.GeometricFreyMazur.quotientSurface_baseChange` (compatibility): The finite quotient and its classifying map commute with characteristic-zero algebraically closed base change.


Checks:

* `TauCeti.GeometricFreyMazur.diagonal_quotient_test1`: The two determinant square classes are not identified in Z(p).
* `TauCeti.GeometricFreyMazur.diagonal_quotient_test2`: Replacing both φ_i by φ_i∘g⁻¹ leaves φ₂φ₁⁻¹ unchanged.
* `TauCeti.GeometricFreyMazur.diagonal_quotient_test3`: For a nonsquare determinant ψ, restricting both factors to the same fixed-pairing component without twisting loses that component.


Consumers:

* BT16 Theorem 29, pp. 740–742: Provides the projective surface and the finite covering used by the pencil.
* GF.9 classifying map: Forgets the scalar of an actual torsion isomorphism but retains the elliptic families as input data.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/projective-frames`, `SchemeAndStackFoundations:SF.1`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R12.6`.


Source: BT16, §2.3, p. 715; erratum §1, p. 1. The diagonal quotient surface is the source input; the statement here fixes the conventions needed by its consumers.


### Heegner and anti-Heegner CM strata

Target `GeometricFreyMazur:GF.0/cm-strata` (definition).

A smooth-level pair (x,y) belongs to CM only when its two projective point stabilizers share a nonidentity element. Choose corresponding nontrivial automorphisms of E_x,E_y with matching characteristic polynomial, allowing a simultaneous sign adjustment. Put the pair in CM⁺ when their tangent eigenvalues agree and in CM⁻ when they are conjugate unequal eigenvalues. This definition is independent of the common generator, compatible lifts and projective frame representatives. Equal j-invariants alone do not define CM.


Proof/construction route:

1. Use the faithful derivative character of the effective cyclic stabilizer of order 2 or 3. Changing the common generator applies the same power to both eigenvalues, preserving agreement versus opposition.
2. Check the order-3 lifts using t²+t+I=0, and the order-4 lift using t²=−I. These are different polynomials.
3. Conjugating the second complex structure interchanges CM⁺ and CM⁻; simultaneous G action preserves each. Over another characteristic-zero algebraically closed field formulate the same distinction by the algebraic tangent character, transporting through an embedding only for the metric.


API:

* `TauCeti.GeometricFreyMazur.cm_commonStabilizer` (characterisation): CM is the smooth-level common nonidentity stabilizer locus.
* `TauCeti.GeometricFreyMazur.cm_sign` (data): The ratio of the compatible tangent characters distinguishes the plus and minus strata.
* `TauCeti.GeometricFreyMazur.cm_disjoint` (relation): CM⁺ and CM⁻ are disjoint, and their union is CM.
* `TauCeti.GeometricFreyMazur.cm_liftIndependent` (compatibility): Changing scalar frames, compatible lifts, or the common generator leaves the stratum unchanged.
* `TauCeti.GeometricFreyMazur.cm_conjugateSecond` (functoriality): Conjugating only the second factor exchanges the strata and is a metric isometry.
* `TauCeti.GeometricFreyMazur.cm_baseChange` (functoriality): The tangent-character definition is preserved by algebraically closed characteristic-zero base change, with embeddings transporting the complex convention.


Checks:

* `TauCeti.GeometricFreyMazur.cm_strata_test1`: (x,x) at j=1728 is CM⁺; its second-factor complex conjugate is CM⁻.
* `TauCeti.GeometricFreyMazur.cm_strata_test2`: With s=[[0,1],[-1,0]] and g=[[1,1],[0,1]], gsg⁻¹ is not projectively s for p>3: the corresponding equal-j pair need not share a stabilizer.
* `TauCeti.GeometricFreyMazur.cm_strata_test3`: For the order-3 lift [[0,1],[-1,-1]], the other eigenvalue is −1−t, rather than −t.


Consumers:

* BTE Proposition 2.1, p. 2: Restricts arithmetic repulsion to CM⁺.
* BTE Proposition 4.1, p. 3: Requires conjugate tubes for CM⁻.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/projective-frames`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.6`.


Source: BT16, §2.4, p. 716. Heegner and anti-Heegner CM strata is the source input; the statement here fixes the conventions needed by its consumers.


### Singular bicusps

Target `GeometricFreyMazur:GF.0/singular-bicusps` (definition).

SBC⊂S consists of pairs of cusps with a common nonidentity projective stabilizer. Each individual cusp stabilizer is cyclic of order p, so their nontrivial intersection means the same order-p subgroup. A pair of arbitrary cusps is not automatically singular. The notion is G-invariant and descends to Z.


Proof/construction route:

1. Use the imported cusp charts and effective order-p inertia. Equality of order-p subgroups is a group fact.
2. Compare with the p-gon boundary moduli, retaining μ_p rather than an unchosen constant-group identification before passing to an algebraically closed field.
3. Check independence of scalars and components in the full G action; conjugation and characteristic-zero base change transport the boundary and inertia.


API:

* `TauCeti.GeometricFreyMazur.sbc_mem` (characterisation): Membership is cusp membership in both coordinates and equality of their order-p stabilizers.
* `TauCeti.GeometricFreyMazur.sbc_stabilizer` (data): The diagonal pair stabilizer has order p at an SBC point.
* `TauCeti.GeometricFreyMazur.sbc_diagonal` (constructor): Every diagonal pair (c,c) of cusps lies in SBC.
* `TauCeti.GeometricFreyMazur.sbc_action` (functoriality): G sends SBC to itself, including component-switching elements.
* `TauCeti.GeometricFreyMazur.sbc_conjugate` (compatibility): Conjugation sends cusp inertia to conjugate cusp inertia.
* `TauCeti.GeometricFreyMazur.sbc_baseChange` (functoriality): Boundary and inertia descriptions agree under characteristic-zero algebraically closed extension.


Checks:

* `TauCeti.GeometricFreyMazur.singular_bicusps_test1`: (c,c) is singular.
* `TauCeti.GeometricFreyMazur.singular_bicusps_test2`: Two cusps whose stabilizers are distinct unipotent subgroups give a nonsingular pair.
* `TauCeti.GeometricFreyMazur.singular_bicusps_test3`: For p=7 a singular bicusp has inertia order 7; a cusp/elliptic pair has no common nonidentity inertia.


Consumers:

* BT16 Proposition 17, pp. 727–728: The three-point condition uses singular bicusps, not every boundary pair.
* GF.7 local indices: Only this stratum receives the extra factor p in ramification.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/projective-frames`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`, `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`.


Source: BT16, §2.4, p. 716. Singular bicusps is the source input; the statement here fixes the conventions needed by its consumers.


### Exhaustive quotient branch locus

Target `GeometricFreyMazur:GF.0/quotient-branch-locus` (theorem).

For p>3, the nonfree locus of S→Z(p) is exactly CM⁺∪CM⁻∪SBC. Its effective stabilizers have orders 2,3,p respectively (the first two at their corresponding CM types). There is no mixed elliptic/cusp branch stratum.


Proof/construction route:

1. A nonidentity element fixing a pair fixes both coordinates. On X(p) its stabilizers occur only over j=1728, j=0 and the cusp, with orders 2,3,p.
2. Since these orders are pairwise coprime, a common element forces the same type. Split the two CM tangent characters, or identify the cusp subgroups.


Acceptance: Test all nine pairs of coordinate inertia types, including ordinary points with trivial inertia.


Prerequisites: `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.0/singular-bicusps`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R13.3`.


Source: BT16, §§2.1, 2.4, pp. 714, 715–716. Exhaustive quotient branch locus is the source input; the statement here fixes the conventions needed by its consumers.


### Cyclic Hecke loci and weighted pull-push

Target `GeometricFreyMazur:GF.0/hecke-loci` (construction).

For m≥1 with p∤m, use the existing cyclic-isogeny correspondence on X(p) to define T_m⊂S by [φ₂]=[f[p]φ₁] for a cyclic degree-m isogeny f. Let H_m be its finite image in Z; a Hecke curve is an irreducible component of H_m. On normalized correspondences with projections a,b define T_m* C=(id×a)_*(id×b)^*C as an effective one-cycle, including generic map degrees. Each projection degree is ψ(m)=m∏_{ℓ|m}(1+1/ℓ), so Deg(T_m*C)=ψ(m)Deg(C) and ψ(m)≪m². These are applications of R14.1, not a second general correspondence construction.


Proof/construction route:

1. Restrict R14.1 to cyclic prime-to-p isogenies and projective-frame quotients. Count cyclic order-m subgroups by prime powers and multiply; distinguish them from all order-m subgroups.
2. At the boundary use R13.1/R13.3 p-gons and the maps (t,a)↦(t^m,a mod p) from the pm-gon and (t,a)↦(t^d,a) on the p-gon. The component-group source of the first map is Z/(pm).
3. Apply flat pullback and proper pushforward with projection formula; symmetry of correspondence degrees gives the canonical-degree identity. All maps preserve scalar independence, transport determinant components by the isogeny multiplier, and commute with conjugation and characteristic-zero base change.


API:

* `TauCeti.GeometricFreyMazur.hecke_mem` (characterisation): A smooth-level point lies on T_m exactly when such a cyclic framed isogeny exists.
* `TauCeti.GeometricFreyMazur.hecke_one` (simp): T₁ is the diagonal, while H₁ also contains geometric isomorphism twists at the coarse level.
* `TauCeti.GeometricFreyMazur.hecke_projectiveIndependent` (compatibility): Changing both actual frames by a common g or rescaling either representative gives the descended correspondence with its determinant component.
* `TauCeti.GeometricFreyMazur.hecke_degree` (data): Both projection degrees are ψ(m), counted on the normalized cyclic correspondence.
* `TauCeti.GeometricFreyMazur.hecke_pullPush_degree` (relation): Weighted cycle pull-push multiplies canonical degree by ψ(m).
* `TauCeti.GeometricFreyMazur.hecke_baseChange` (functoriality): The prime-to-p construction and its boundary extension commute with permitted base change and conjugation.


Checks:

* `TauCeti.GeometricFreyMazur.hecke_loci_test1`: For m=4 the cyclic degree is 6, whereas the full order-4 correspondence has degree σ₁(4)=7.
* `TauCeti.GeometricFreyMazur.hecke_loci_test2`: For m=1 the normalized correspondence is the diagonal and pull-push is the identity.
* `TauCeti.GeometricFreyMazur.hecke_loci_test3`: m divisible by p is outside this torsion-isomorphism correspondence; multiplication by p gives zero on p-torsion.


Consumers:

* BT16 Propositions 25–27, pp. 735–740: Summing ψ(m) for m<d costs O(d³), with weighted cycle degrees retained.
* GF.9 descent: Hecke containment yields a geometric isogeny of degree prime to p.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/diagonal-quotient`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.3`, `SchemeAndStackFoundations:SF.5`, `HyperbolicCurveVolumesAndGonality:HV.2/finite-pushforward`, `HyperbolicCurveVolumesAndGonality:HV.3/canonical-area`.


Source: BT16, §2.5, pp. 716–717. Cyclic Hecke loci and weighted pull-push is the source input; the statement here fixes the conventions needed by its consumers.


## GF.1: Compact modular metrics and systoles


### Compact triangle uniformization

Target `GeometricFreyMazur:GF.1/triangle-uniformization` (theorem).

For prime p>5, the orbifold with underlying X(1) and cone orders (2,3,p) is uniformized by the orientation-preserving hyperbolic triangle group Δ(2,3,p). The quotient γ_p:PSL₂(Z)→Δ sends the standard cusp translation U to an order-p rotation. For Ξ(p)=γ_p(Γ(p)), the torsion-free compact quotient Ξ(p)\H is a selected component X(p). Its deck group is PSL₂(F_p); obtain the other component by the projective-frame transport. The cusped quotient Γ(p)\H and compact quotient Ξ(p)\H have distinct universal covers/maps.


Proof/construction route:

1. Use Fuchsian polygon and orbifold-covering theory for angles π/2,π/3,π/p, whose sum is <π exactly when p>6.
2. Identify the compactification map on orbifold fundamental groups: kill the pth power of a peripheral generator. Its normal closure is contained in Γ(p), yielding the finite deck quotient.
3. Use R12.3/R13.4b for the algebraic compactification and ComplexComparisonPartII for comparison; prove torsion-freeness of Ξ from the actual level cover and its local ramification.


Acceptance: p=7 is hyperbolic; p=2,3,5 has spherical signature and cannot enter this metric argument.


Prerequisites: `GeometricFreyMazur:GF.0/projective-frames`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`, `InverseGaloisAndArithmeticFundamentalGroups:IG.3/general-riemann-existence`.


Source: BT16, §3.1, pp. 717–718. Compact triangle uniformization is the source input; the statement here fixes the conventions needed by its consumers.


### Triangle coordinates and deformation matrices

Target `GeometricFreyMazur:GF.1/triangle-coordinates` (construction).

Normalize the order-2, p and 3 vertices to i, i y_p and e^{iθ_p}. Then y_p=p/π+O(p⁻¹), θ_p=π/3+O(p⁻¹). Equivalently choose θ=π/p, c=cos θ, b=(1+√(1−4sin²θ))/2 and U_p=[[c,b],[b−1,c]], S=[[0,−1],[1,0]], L_p=S U_p⁻¹ S⁻¹. Their projective classes satisfy S²=U_p^p=(S U_p)³=1 and give the normalized faithful triangle representation; U_p→[[1,1],[0,1]], L_p→[[1,0],[1,1]]. Here y_p=√(b/(1−b)).


Proof/construction route:

1. Use the hyperbolic cosine rule for the triangle, or compute fixed points of these matrices. det U_p=c²−b(b−1)=1 and tr(SU_p)=1 verify the three orders.
2. Choose the branch b>1/2 for p>6, so the cusp vertex lies above i. Compare with the canonical triangle by the uniqueness of its angles and marked orientation.
3. Taylor expansion gives 1−b=π²/p²+O(p⁻⁴); derive y_p and the third vertex. Conjugate the normalization for another component rather than choosing a second metric.


API:

* `TauCeti.GeometricFreyMazur.triangleU_det` (structure): The displayed U_p and L_p have determinant one.
* `TauCeti.GeometricFreyMazur.triangleU_orders` (relation): S²=−I, U_p^p=−I and (SU_p)³=−I for the chosen real lifts.
* `TauCeti.GeometricFreyMazur.triangleU_fixedPoint` (data): U_p fixes i√(b/(1−b)) and S fixes i.
* `TauCeti.GeometricFreyMazur.triangleU_power` (simp): U_p^a=cos(aθ)I+(sin(aθ)/sin θ)(U_p−cos θ I) for every integer a.
* `TauCeti.GeometricFreyMazur.triangleCoordinates_changeMarking` (compatibility): An orientation-preserving change of marked triangle conjugates the matrices and preserves distances and traces.
* `TauCeti.GeometricFreyMazur.triangleCoordinates_conjugate` (functoriality): Complex conjugation reverses the marking and transports the corresponding component; the algebraic model base changes before complex uniformization.


Checks:

* `TauCeti.GeometricFreyMazur.triangle_coordinates_test1`: At p=7 the square root is real and y_p>1.
* `TauCeti.GeometricFreyMazur.triangle_coordinates_test2`: At p=5, 1−4sin²(π/5)<0, excluding this hyperbolic normalization.
* `TauCeti.GeometricFreyMazur.triangle_coordinates_test3`: As p→∞, U_p tends to the ordinary cusp translation; U_p itself is elliptic of finite projective order p.


Consumers:

* GF.1 compact witness: The exact integer-power formula detects a word surviving cusp filling.
* BT16 Lemmas 6 and 10–11, pp. 719–723: The normalized vertices connect cusp distances to integral matrix heights.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.1/triangle-uniformization`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `mathlib:Matrix.ProjGenLinGroup`.


Source: BT16, §3.2, pp. 718–719; explicit deformation calculation in this reader. Triangle coordinates and deformation matrices is the source input; the statement here fixes the conventions needed by its consumers.


### A systolic witness surviving cusp filling

Target `GeometricFreyMazur:GF.1/surviving-systolic-witness` (theorem).

For sufficiently large prime p write p=3r+x with x∈{1,2}. The integral matrix M_p=[[1+xp,3p],[p(2−x²+2px)/3,1+2p²−xp]] belongs to Γ(p), has trace 2p²+2, and its image under the compact triangle representation has absolute trace (27/(4π²))p²+O(p). Thus its image in Ξ(p) is hyperbolic and nonidentity. Its cusped and compact geodesic lengths are both 4 log p+O(1), giving the required upper bounds for geodesics nontrivial after cusp filling.


Proof/construction route:

1. Verify integrality, determinant one and reduction to I. With U(t)=[[1,t],[0,1]] and L(t)=[[1,0],[t,1]], factor M_p=−L(2r)U(3)L(−r−1)U(3) if x=1; if x=2 use L(2r+1)U(−3)L(−r−1)U(1)L(1)U(1). These are exact integer identities.
2. Substitute U_p,L_p into each word. The two large lower powers divided by p converge to ±(√3/(2π))N with N=[[0,0],[1,0]], and have bounded remainder. The fixed-power words converge to U(±3), or U(1)L(1)U(1). The leading traces in both cases are 27/(4π²).
3. The triangle length formula 2 arcosh(|tr|/2) proves nontriviality in the compact group and the length asymptotics. This replaces the published witness U(p)L(−p), which is killed by cusp filling.


Acceptance: Check the two exact word identities and the positive leading trace separately for p≡1 and p≡2 mod 3. Check p=7 and 11 as integer examples; asymptotics alone do not specify an explicit numerical final threshold.


Prerequisites: `GeometricFreyMazur:GF.1/triangle-coordinates`, `GeometricFreyMazur:GF.1/triangle-uniformization`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.


Source: BT16, Lemma 5, p. 718, with a new replacement argument for errata finding E12. The source gives the trace lower-bound method but not a valid compact-nontrivial upper witness. The displayed replacement and its calculation are proved in the reader.


### Cusped systole with the filling condition

Target `GeometricFreyMazur:GF.1/cusped-systole` (theorem).

Let ρ_Y be half the infimum of cusped lengths of closed geodesics whose loops remain nontrivial in X(p). Then ρ_Y=2 log p+O(1). The ordinary nonperipheral cusped systole also has length 4 log p+O(1). The factor one-half is part of the radius convention.


Proof/construction route:

1. If M=I+pA has determinant one then tr M=2−p²det A, hence tr M≡2 mod p². Every hyperbolic M∈Γ(p) has |tr M|≥p²−2 and length at least 4 log p−O(1).
2. Use the preceding surviving witness for the matching upper bound in the smaller class of loops remaining nontrivial after filling.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.1/surviving-systolic-witness`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.


Source: BT16, Lemma 5 and definition preceding it, p. 718, corrected by the replacement witness. Cusped systole with the filling condition is the source input; the statement here fixes the conventions needed by its consumers.


### Embedded cusp balls and cusp separation

Target `GeometricFreyMazur:GF.1/cusp-separation` (theorem).

In the compact metric, distinct cusps have distance at least 2 log p−C. A ball of radius log p−C around a cusp is an embedded hyperbolic disc built from its incident triangle tiles. C is independent of p and the selected component.


Proof/construction route:

1. Use the triangle coordinates to bound the distance from the p-vertex to its opposite side by log p−O(1). The incident p triangles give the full local disc in X(p).
2. Disjoint interiors of the cusp-star tiles imply separation. Transport between components with the G-action. This estimate precedes the global injectivity-radius lower bound.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.1/triangle-coordinates`, `GeometricFreyMazur:GF.1/triangle-uniformization`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.


Source: BT16, Lemma 6, pp. 719–720. Embedded cusp balls and cusp separation is the source input; the statement here fixes the conventions needed by its consumers.


### Compact and cusped metric comparison

Target `GeometricFreyMazur:GF.1/metric-comparison` (theorem).

On Y(p), with r(x)=distance in h_X to the nearest cusp, tanh²(r(x)/2) h_Y(x)≤h_X(x)≤h_Y(x). On the part r≥R the length distortion is at most coth(R/2)=1+O(e^{−R}), and the pulled-back area distortion obeys the squared bound.


Proof/construction route:

1. Holomorphic inclusion Y→X decreases the Kobayashi metric, giving the upper inequality h_X≤h_Y.
2. Lift the maximal cusp-free compact disc around x, compare the disc’s complete metric at its centre, and apply Schwarz–Pick. Separate quadratic-form comparison from length comparison.


Acceptance: Near a cusp the lower comparison degenerates; no uniform compact isometry is asserted for Hecke maps.


Prerequisites: `GeometricFreyMazur:GF.1/triangle-uniformization`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-balls`, `HyperbolicCurveVolumesAndGonality:HV.0/curvature-one-distance`.


Source: BT16, Proposition 7, pp. 719–720. Compact and cusped metric comparison is the source input; the statement here fixes the conventions needed by its consumers.


### Compact injectivity radius with repeated cusp visits

Target `GeometricFreyMazur:GF.1/compact-injectivity-radius` (theorem).

For each component of X(p), ρ_X=2 log p+O(1), where ρ_X is half the shortest noncontractible closed-geodesic length. In particular the shortest length is 4 log p+O(1), rather than 2 log p+O(1).


Proof/construction route:

1. The surviving witness gives the upper bound. For a shortest compact geodesic γ of length L≤4 log p+C, use disjoint embedded cusp discs of radii R_b=(1/2)log p and inner radii R_s=(1/4)log p. Every connected visit to an outer disc reaching its inner disc costs at least 2(R_b−R_s), so there are O(1) deep visits, counting repeated visits to the same cusp.
2. Outside the inner discs, the metric comparison costs O(e^{−R_s}L)=o(1). For each deep arc lift to its embedded hyperbolic disc, use cosh r(s)=cosh r_min cosh(s−s₀), and integrate coth(r(s)/2)−1 on r≥1 to obtain a uniform O(1) error. Replace any r<1 part by a unit-circle arc; its cusped length is O(1) by the metric comparison.
3. The resulting loop in Y is homotopic to γ in X and has cusped length ≤L+O(1). It is neither contractible nor peripheral in Y because its filled class is nontrivial. Apply the cusped lower bound. The argument counts visits and does not use the source’s unsupported at-most-one-cusp assertion.


Acceptance: Preserve L=2ρ_X throughout. A shortest geodesic making two deep visits is handled by two bounded errors, not ruled out by assertion.


Prerequisites: `GeometricFreyMazur:GF.1/surviving-systolic-witness`, `GeometricFreyMazur:GF.1/cusped-systole`, `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.1/metric-comparison`, `HyperbolicCurveVolumesAndGonality:HV.2/compact-injectivity`, `HyperbolicCurveVolumesAndGonality:HV.0/cayley-distance`.


Source: BT16, Corollary 8, p. 720, with a new bounded-visits proof replacing errata finding E13. The source states the target asymptotic. The reader supplies the missing visit count and uniform detour estimate.


### Cusp coordinates and Hecke enlargement

Target `GeometricFreyMazur:GF.1/cusp-coordinates` (theorem).

For a width-p cusp use q=exp(2πiz/p). The horoball Im z>y, y>1/p, gives an embedded disc D_y of Euclidean radius exp(−2πy/p), contained in B_X(c,2 artanh(exp(−2πy/p))). For log p+C<R<2 log p−C one has B_X(c,R)⊂D_{O(pe^{−R})}. For p∤m and log p+C<R with R+log m<2 log p−C, the inverse cyclic Hecke image of B_X(c,R) lies in the union of balls B_X(c_i,R+log m+C) at the corresponding cusps.


Proof/construction route:

1. Compare the punctured q-disc and its filling by Schwarz–Pick and the compact metric inequality; use the hyperbolic radial distance to invert the radius estimate.
2. At a prime-to-p isogeny branch the imaginary part changes by a factor between m⁻¹ and m. Apply the q-coordinate estimate at every inverse cusp, including the boundary component map.


Acceptance: Check the direction of both disc inclusions and the additive log m enlargement; do not apply outside its specified range.


Prerequisites: `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.1/metric-comparison`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `GeometricFreyMazur:GF.0/hecke-loci`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`, `ModularCurvesPartII:R13.3`, `HyperbolicCurveVolumesAndGonality:HV.0/disc-balls`.


Source: BT16, §3.2 and Lemma 9, pp. 720–721. Cusp coordinates and Hecke enlargement is the source input; the statement here fixes the conventions needed by its consumers.


## GF.2: Small-height lifts and cusp repulsion


### Integral height uses the existing entrywise norm

Target `GeometricFreyMazur:GF.2/height-adapter` (comparison).

For an integral or real 2×2 matrix the paper’s height is max_{i,j}|M_ij|, exactly Mathlib’s entrywise supremum norm after the standard scalar embedding. It is not the operator or Frobenius norm. Use this existing norm with h(MN)≤2h(M)h(N), h(M⁻¹)=h(M) in SL₂, and entrywise bounds for integral minors.


Proof/construction route:

1. Read Matrix.norm_eq_sup_sup_nnnorm at the pin, fix its local entrywise instance, and specialize to Fin 2.
2. Use the two-term multiplication formula and the adjugate inverse. These comparisons provide the arithmetic convention; no competing general matrix-height theory is defined.


Acceptance: The all-ones 2×2 matrix has entrywise height 1, not Frobenius norm 2.


Prerequisites: `mathlib:Matrix.norm_eq_sup_sup_nnnorm`, `mathlib:Matrix.norm_entry_le_entrywise_sup_norm`.


Source: BT16, §3.3, p. 721. Integral height uses the existing entrywise norm is the source input; the statement here fixes the conventions needed by its consumers.


### Short elliptic displacement has a small integral lift

Target `GeometricFreyMazur:GF.2/short-elliptic-displacement` (theorem).

Fix the image ι of i, or the image ϖ of the order-3 triangle vertex, in one component. For fixed 0<δ<1/2 and large p, a component-preserving g with d(ι,gι)<δρ_X (respectively d(ϖ,gϖ)<δρ_X) has a representative γ_p(M) modulo Ξ with M∈SL₂(Z) and h(M)≤C_δp^{4δ}. No nonsquare component-switching element is represented by an SL₂(Z) reduction on this component.


Proof/construction route:

1. Compare the triangle chart to the cusped chart over the relevant small ball and use the compact-radius estimate.
2. For M=[[a,b],[c,d]], Im(Mi)=1/(c²+d²) and Re(Mi)=(ac+bd)/(c²+d²); the hyperbolic distance formula and ad−bc=1 bound all four entries by O(e^{2R}). Take R=δρ_X. Repeat in the fixed order-3 chart.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.1/triangle-coordinates`, `GeometricFreyMazur:GF.1/metric-comparison`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `GeometricFreyMazur:GF.2/height-adapter`, `ModularCurvesPartII:R12.2`.


Source: BT16, Lemma 10, pp. 721–722. Short elliptic displacement has a small integral lift is the source input; the statement here fixes the conventions needed by its consumers.


### A nearby lifted cusp has a small-height description

Target `GeometricFreyMazur:GF.2/cusp-lift-height` (theorem).

Fix the lift i y_p of a cusp c₀ and its order-p triangle stabilizer H. For fixed 0<δ<1/2 and large p, any lift z of a cusp c with d(i y_p,z)≤(1+δ)ρ_X can be written z=σ γ_p(M)i y_p for σ∈H and M∈SL₂(Z), h(M)=O_δ(p^{4δ}).


Proof/construction route:

1. Cusp separation puts the lens between the two large cusp discs near the relevant triangle-star edges.
2. Choose an adjacent order-2 vertex, move it by σ, and apply the elliptic small-height lift. The marked adjacent cusp is recovered by the triangle combinatorics.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.1/triangle-coordinates`, `GeometricFreyMazur:GF.2/short-elliptic-displacement`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `HyperbolicCurveVolumesAndGonality:HV.0/normalized-lens`.


Source: BT16, Lemma 11(a), pp. 722–723. A nearby lifted cusp has a small-height description is the source input; the statement here fixes the conventions needed by its consumers.


### Cusp displacement controls a stabilizer double coset

Target `GeometricFreyMazur:GF.2/cusp-double-coset` (theorem).

Under the same hypotheses, if d(c₀,gc₀)≤(1+δ)ρ_X for a component-preserving deck element g, then modulo Ξ, g∈H γ_p(M) H for some integral SL₂ matrix of height O_δ(p^{4δ}). The two H factors cannot be omitted.


Proof/construction route:

1. Lift a shortest path from c₀ to gc₀ beginning at i y_p. Apply the lifted-cusp theorem to its endpoint.
2. The ambiguity in each marked lift is exactly its cusp stabilizer, producing the left and right H factors.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.2/cusp-lift-height`, `GeometricFreyMazur:GF.1/triangle-uniformization`.


Source: BT16, Lemma 11(b), pp. 722–723. Cusp displacement controls a stabilizer double coset is the source input; the statement here fixes the conventions needed by its consumers.


### Unique close lift of a different cusp

Target `GeometricFreyMazur:GF.2/cusp-unique-lift` (theorem).

There is δ₀>0 such that for 0<δ<δ₀ and sufficiently large p, fixed distinct cusps c₀,c in one component and a fixed lift z₀ of c₀ admit at most one lift z of c with d(z₀,z)≤(1+δ)ρ_X.


Proof/construction route:

1. Apply the cusp-height theorem to two candidate lifts. Their relative matrix reduces to the upper triangular cusp normalizer.
2. Its relevant lower entry is O(p^{8δ}); take δ<1/8, with margin, so divisibility by p forces actual vanishing. The integral upper triangular SL₂ element maps into the cusp rotation subgroup.
3. The compact covering group has trivial intersection with this finite stabilizer, so the two lifts coincide. The smallness condition is strengthened from the printed numerical range rather than inferred from 8δ<2.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.2/cusp-lift-height`, `GeometricFreyMazur:GF.2/height-adapter`, `GeometricFreyMazur:GF.1/triangle-uniformization`.


Source: BT16, Proposition 12(a), pp. 723–724. Unique close lift of a different cusp is the source input; the statement here fixes the conventions needed by its consumers.


### Intersections of cusp balls lie in a small ball

Target `GeometricFreyMazur:GF.2/cusp-lens` (theorem).

For sufficiently small fixed δ>0 and large p, distinct cusps c₀,c satisfy B(c₀,(1/2+δ)ρ_X)∩B(c,(1/2+δ)ρ_X)⊂B(u,δρ_X+C) for a suitable u. The constant is uniform in the cusps.


Proof/construction route:

1. Lift the lens through the unique-lift result, taking its δ parameter twice as large when necessary and fixing that before p grows.
2. Use d(c₀,c)≥ρ_X−O(1) and the imported hyperbolic midpoint-lens bound of radius R+O(1) for two radius D+R balls with centres separated by 2D.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.2/cusp-unique-lift`, `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `HyperbolicCurveVolumesAndGonality:HV.0/normalized-lens`.


Source: BT16, Proposition 12(b) and Lemma 13, pp. 723–724. Intersections of cusp balls lie in a small ball is the source input; the statement here fixes the conventions needed by its consumers.


### A cusp-ball overlap count

Target `GeometricFreyMazur:GF.2/cusp-ball-count` (theorem).

For sufficiently small fixed δ>0 and large p, every x∈X(p) lies within (1/2+δ)ρ_X of at most C_δp^{24δ} cusps in its component.


Proof/construction route:

1. If there is more than one such cusp, the lens theorem puts x near an adjacent order-2 vertex. Enlarge δ by a fixed factor, fixed before p grows.
2. The short-displacement height bound counts the possible neighboring integral matrices by their entries, giving the stated coarse exponent. If there is at most one cusp, the bound is immediate.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.2/cusp-lens`, `GeometricFreyMazur:GF.2/short-elliptic-displacement`, `GeometricFreyMazur:GF.2/cusp-lift-height`, `GeometricFreyMazur:GF.2/height-adapter`.


Source: BT16, Proposition 12(c), pp. 724–725. A cusp-ball overlap count is the source input; the statement here fixes the conventions needed by its consumers.


## GF.3: Heegner and bicusp arithmetic repulsion


### Small equations reconstruct a signed Hecke locus

Target `GeometricFreyMazur:GF.3/small-height-reconstruction` (theorem).

Fix A. A unique invertible projective 2×2 solution over F_p of integral linear equations with coefficients bounded by p^(Aδ) has a primitive integral representative Q of height p^(O_A(δ)), for sufficiently small δ and large p. Put m=|det Q|; then p∤m. If det Q>0 its Smith form gives a cyclic degree-m holomorphic isogeny; if det Q<0, composition with the fixed real reflection gives the corresponding conjugate Hecke locus after complex realization. On cusp data the two cases give the respective ordinary or conjugate Hecke boundary incidence. Uniqueness does not determine the sign, and multiplication by −1 cannot change it.


Proof/construction route:

1. Uniqueness of an invertible projective solution forces a one-dimensional kernel for p>3: in a projective line of matrices the determinant is a quadratic, so an invertible point would give at least p−1 invertible projective points. Thus the modular rank is three. A nonzero rank-three minor and its cofactors give the kernel vector. All relevant rank-four minors are bounded by p^(O_A(δ))<p, so their vanishing modulo p implies vanishing over Z; the same rational kernel is one-dimensional. The cofactor vector is nonzero modulo p and has the required height.
2. Divide out the gcd; reduction is still the same invertible projective matrix, so p∤det Q. Keep the sign. Positive determinant is automatic only in the definite CM centralizer application. For negative determinant factor Q as a positive-determinant matrix times the integral reflection diag(1,−1).
3. Use Smith normal form for the primitive positive lattice map. For a negative map use the conjugate complex structure and R12.6, then the same positive Smith form. Check the p-gon toric and component factors separately at the boundary; the sign is the ordinary versus conjugate Hecke distinction.


Acceptance: A negative determinant lift gives an antiholomorphic correspondence and is not silently called a Hecke isogeny.


Prerequisites: `GeometricFreyMazur:GF.2/height-adapter`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R14.1`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.3`.


Source: BT16, Proofs of Lemma 15 and Propositions 17–18, pp. 726–730. The cofactor reconstruction is in the published proofs. The sign split is an added correction: those proofs do not establish positivity in the general cusp/overlap applications.


### The distinct-Heegner centralizer equations have rank three

Target `GeometricFreyMazur:GF.3/cm-centralizer` (theorem).

In the nearby distinct-Heegner setup let t₀=[[0,1],[-1,0]] or [[0,1],[-1,-1]], and let M_x,M_y be the short integral lifts. The simultaneous equations t₀g=gt₀ and t₀M_y⁻¹gM_x=M_y⁻¹gM_x t₀ have solution space of dimension at most one over F_p for sufficiently small δ. For the second t₀ use t₀²+t₀+I=0 and det(aI+bt₀)=a²−ab+b²; for the first use a²+b².


Proof/construction route:

1. The first centralizer is the two-dimensional span of I,t₀. If the second relation is redundant, M_x,M_y normalize that quadratic algebra.
2. Small-height congruences lift the trace/determinant polynomial to Q. The positive-determinant rational normalizer of the imaginary quadratic algebra is its centralizer; the conjugating coset has negative determinant.
3. Integral determinant-one centralizer elements are the finite Gaussian or Eisenstein units, hence stabilize the corresponding elliptic vertex. This contradicts distinctness of the two Heegner points.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.2/short-elliptic-displacement`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.2/height-adapter`.


Source: BT16, Lemma 15, pp. 726–727, with the order-3 polynomial corrected. The distinct-Heegner centralizer equations have rank three is the source input; the statement here fixes the conventions needed by its consumers.


### Heegner-only repulsion

Target `GeometricFreyMazur:GF.3/heegner-repulsion` (theorem).

There are absolute δ₀,A>0 such that for fixed 0<δ<δ₀ and sufficiently large p, two distinct points of CM⁺ with the same image in X(1)² and intersecting radius-δρ_X max-product balls both lie on one T_m with m≤C_δp^{Aδ}, p∤m. There is no corresponding conclusion with T_m for CM⁻.


Proof/construction route:

1. Move the first pair to a marked elliptic vertex and its commuting projective element. For CM⁺ the normalizer representative is h₀=1; no integral lift of the nonidentity normalizer coset is used.
2. Lift both short displacements, apply the centralizer rank bound, and reconstruct a small positive determinant representative in the definite quadratic algebra.
3. Apply cyclic-isogeny reconstruction to both framed pairs. Transport the statement under the full component action.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.3/cm-centralizer`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.2/short-elliptic-displacement`, `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.0/hecke-loci`.


Source: BTE, Erratum Proposition 2.1, pp. 1–2, replacing published Proposition 14. Heegner-only repulsion is the source input; the statement here fixes the conventions needed by its consumers.


### Conjugate Hecke loci are real analytic

Target `GeometricFreyMazur:GF.3/conjugate-hecke` (definition).

In the same smooth real product, let c₂ be complex conjugation on the second factor and put T̄_m=c₂(T_m). This is a real analytic, generally totally real locus for the original product complex structure, not an algebraic or complex analytic divisor. Conjugation transports CM⁺ to CM⁻ and Heegner repulsion to these loci. No intersection number C·T̄_m is defined here.


Proof/construction route:

1. Take the set image under the antiholomorphic isometry in one factor. Keep the conjugate complex structure explicit when applying the imported conjugate-diagonal volume estimate.
2. Define neighborhoods by the transported max metric; retain complex curves and their original complex orientation for area integration.
3. Use R12.6 to make the component and conjugation comparisons. The underlying algebraic Hecke correspondences base change, while this real analytic construction is made only after complex realization.


API:

* `TauCeti.GeometricFreyMazur.conjugateHecke_mem` (characterisation): (x,y)∈T̄_m iff (x,conj y)∈T_m with the corresponding component labels.
* `TauCeti.GeometricFreyMazur.conjugateHecke_involutive` (simp): Applying c₂ twice recovers T_m. Canonical conjugation of projectively framed moduli commutes with G; in a fixed analytic marking include the deck correction to the bare reflection. Thus T̄_m is invariant under the diagonal G action, with the specified component transport.
* `TauCeti.GeometricFreyMazur.conjugateHecke_tube` (compatibility): c₂ transports every max-metric tube isometrically, with area unchanged on the relevant normalized complex curves after conjugate-structure bookkeeping.
* `TauCeti.GeometricFreyMazur.conjugateHecke_repulsion` (relation): Nearby CM⁻ pairs lie on one T̄_m, by conjugating the CM⁺ result.
* `TauCeti.GeometricFreyMazur.conjugateHecke_degree` (data): Degree costs come from the original holomorphic Hecke pull-push, not from an intersection with T̄_m.
* `TauCeti.GeometricFreyMazur.conjugateHecke_realization` (functoriality): Transport under a complex embedding uses the algebraic Hecke base-change comparison, followed by conjugation.
* `TauCeti.GeometricFreyMazur.conjugateHecke_negativeMatrix` (compatibility): A primitive negative-determinant rational matrix, factored through the fixed integral reflection, represents the conjugate cyclic Hecke locus of index |det|, including its p-gon boundary data and determinant component.


Checks:

* `TauCeti.GeometricFreyMazur.conjugate_hecke_test1`: For m=1, T̄₁ is the graph of complex conjugation and has no complex tangent line.
* `TauCeti.GeometricFreyMazur.conjugate_hecke_test2`: A Heegner point becomes anti-Heegner under c₂ and lies on the transported locus.
* `TauCeti.GeometricFreyMazur.conjugate_hecke_test3`: An attempted divisor intersection C·T̄₁ is rejected; its ε-tube volume is meaningful.


Consumers:

* BTE Proposition 4.1, p. 3: Bounds anti-Heegner multiplicity using sinh-normalized tube volumes.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.3/heegner-repulsion`, `ModularCurvesPartII:R12.6`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-conjugate`, `ModularCurvesPartII:R13.3`, `GeometricFreyMazur:GF.3/small-height-reconstruction`.


Source: BTE, Erratum §§2–4.1, pp. 2–3. Conjugate Hecke loci are real analytic is the source input; the statement here fixes the conventions needed by its consumers.


### Hecke curves avoid anti-Heegner CM points

Target `GeometricFreyMazur:GF.3/hecke-avoids-anti` (theorem).

For p∤m one has T_m∩CM⁻=∅. The genuine cyclic isogeny intertwines the compatible automorphism on tangent spaces, so the CM signs agree. This does not imply that distinct anti-Heegner points repel in the ordinary Hecke sense.


Proof/construction route:

1. An ordinary Hecke point in CM must have both elliptic curves of the same CM type: different imaginary-quadratic endomorphism algebras cannot be isogenous. Over C identify the two j=1728 curves, or the two j=0 curves, by an isomorphism. The isogeny becomes an element of the commutative CM endomorphism ring, hence intertwines the automorphisms with equal tangent eigenvalue. The opposite automorphism cannot induce the same torsion intertwining when p>3 and the isogeny is prime to p.
2. A nonzero complex-linear derivative preserves the chosen CM tangent eigenvalue, excluding the opposite character.


Acceptance: Do not reuse the false deduction that all CM⁻ points therefore have disjoint large balls.


Prerequisites: `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.0/hecke-loci`, `ModularCurvesPartII:R12.1`.


Source: BT16, True first assertion of Remark 16, p. 727; erratum §1, p. 1. Hecke curves avoid anti-Heegner CM points is the source input; the statement here fixes the conventions needed by its consumers.


### Three-bicusp repulsion with both determinant signs

Target `GeometricFreyMazur:GF.3/three-bicusp-repulsion` (theorem).

There are δ₀,A>0 such that for fixed 0<δ<δ₀ and large p, if a point of S is within (1/2+δ)ρ_X of at least three distinct singular bicusps, every SBC point in that ball lies on one ordinary or conjugate Hecke locus of index m≤C_δp^(Aδ), p∤m. Two bicusps do not force the reconstruction. The positive-Hecke-only formulation is not used: its proof has an uncontrolled determinant sign, and the reader gives a negative-reflection cusp example. Moreover the original point is within Aδρ_X+C_δ of that signed locus and each of its coordinates has distance at least (1/2−Aδ)ρ_X−C_δ from every cusp. These strengthened outputs use the same height reconstruction, not a new repulsion premise.


Proof/construction route:

1. Use cusp double cosets and unique lifts to encode each nearby bicusp as a prescribed image of a point of P¹(F_p). If only at most two distinct source points are specified, the small integral upper-triangular lift argument leaves at most two bicusps.
2. Three distinct prescribed projective-line images determine Q up to scalar. Cofactors give the small primitive integral representative, retaining both determinant signs. Its invertible reduction makes p∤|det Q|.
3. For positive determinant use the ordinary cyclic isogeny boundary; for negative determinant compose with the fixed reflection and use the conjugate boundary. The same reconstructed Q satisfies every nearby bicusp condition, so all lie on the same signed locus. No unproved orientation assumption is inserted.
4. With at least three bicusps, the cusp-normalizer argument forces at least two distinct cusp coordinates in each factor. Separation then bounds the distance from every cusp below by (1/2−O(δ))ρ_X. The two-cusp lens puts each factor within O(δρ_X) of an order-two vertex. Move those vertices to (ι,gι); the same small signed matrix representing g gives a point of the signed Hecke correspondence within O(log h(Q))=O(δρ_X), using h_X≤h_Y and the positive Smith form or its reflected version. This places the original point in the thin signed tube on the cusp complement.


Acceptance: Check sharp distinction between two prescribed images (a one-parameter projective freedom) and three (uniqueness). For p≡1 mod4 and a²=−1, the nearby cusp pairs (v,av) have negative-reflection type; they do not lie on T_m with m<p−1.


Prerequisites: `GeometricFreyMazur:GF.0/singular-bicusps`, `GeometricFreyMazur:GF.2/cusp-double-coset`, `GeometricFreyMazur:GF.2/cusp-unique-lift`, `GeometricFreyMazur:GF.2/cusp-lens`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.3/conjugate-hecke`, `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.1/metric-comparison`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.


Source: BT16, Proposition 17, pp. 727–728. The projective-line reconstruction is the published proof. The signed conclusion is a new corrected version, retaining a sign that is not controlled there.


## GF.4: Big diagonal overlap and reconstruction


### Big diagonals and small Hecke curves

Target `GeometricFreyMazur:GF.4/big-diagonals` (definition).

For g∈G define Δ_g={(gx,gy,x,y):(x,y)∈S}⊂S². For p∤m define τ_{g,m}=Δ_g restricted to (x,y)∈T_m. In the max-product distance, B(Δ_g,R) is exactly the locus d(x₁,gx₂)<2R and d(y₁,gy₂)<2R. Here Δ_g has complex codimension two in S²; multiplicity along it means the sum of local curve-point multiplicities at its finite intersection, not a Cartier divisor intersection. Also define the real analytic signed companion τ̄_(g,m) by restricting Δ_g to T̄_m. Only τ_(g,m) is a holomorphic small Hecke curve.


Proof/construction route:

1. Use the graph of the diagonal action on both coordinates. Midpoints of the two coordinate geodesics prove the factor-two tube formula; the triangle inequality proves the converse.
2. Restrict the same graph to the imported T_m. Check group relabeling on both slots, inversion on slot swap, and the component restrictions explicitly.
3. Algebraic loci commute with characteristic-zero base change; after complex realization conjugation transports graph, Hecke index and max distance.


API:

* `TauCeti.GeometricFreyMazur.bigDiagonal_mem` (characterisation): Membership is x₁=gx₂ and y₁=gy₂ simultaneously.
* `TauCeti.GeometricFreyMazur.bigDiagonal_tube` (characterisation): A radius-R tube is described by the two strict inequalities with threshold 2R.
* `TauCeti.GeometricFreyMazur.bigDiagonal_swap` (functoriality): Swapping slots sends Δ_g to Δ_{g⁻¹} and transports the restricted Hecke locus.
* `TauCeti.GeometricFreyMazur.smallHecke_mem` (characterisation): τ_{g,m} is the graph of g on the actual holomorphic T_m.
* `TauCeti.GeometricFreyMazur.bigDiagonal_changeFrames` (compatibility): Independent changes a,b of slot frames relabel g as a g b⁻¹; simultaneous changes conjugate g.
* `TauCeti.GeometricFreyMazur.bigDiagonal_baseChange` (functoriality): Graphs and their Hecke restrictions commute with base change and conjugation.
* `TauCeti.GeometricFreyMazur.smallConjugateHecke_mem` (characterisation): τ̄_(g,m) consists of the points of Δ_g whose last pair lies in T̄_m; its metric tube is defined although it is not a complex curve.


Checks:

* `TauCeti.GeometricFreyMazur.big_diagonals_test1`: Δ₁ imposes both equalities; imposing x₁=x₂ alone gives the wrong codimension.
* `TauCeti.GeometricFreyMazur.big_diagonals_test2`: τ_{g,1} is a curve inside Δ_g, rather than the whole surface Δ_g.
* `TauCeti.GeometricFreyMazur.big_diagonals_test3`: If each matched coordinate has distance 3R/2, the point is in the radius-R graph tube despite not satisfying a threshold R test.
* `TauCeti.GeometricFreyMazur.small_conjugate_hecke_test`: The conjugate m=1 restriction is real analytic and is not assigned a Cartier divisor class.


Consumers:

* BT16 Proposition 18, pp. 728–731: Counts overlapping graph tubes.
* GF.7 ramification: The transposition part of wreath inertia fixes these codimension-two graphs.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/diagonal-quotient`, `GeometricFreyMazur:GF.0/hecke-loci`, `HyperbolicCurveVolumesAndGonality:HV.0/max-product-balls`, `HyperbolicCurveVolumesAndGonality:HV.2/branch-multiplicity`, `GeometricFreyMazur:GF.3/conjugate-hecke`.


Source: BT16, §4.4, p. 728. Big diagonals and small Hecke curves is the source input; the statement here fixes the conventions needed by its consumers.


### Quadratic centralizers give only logarithmically many small elements

Target `GeometricFreyMazur:GF.4/quadratic-centralizer-count` (theorem).

For a nonscalar rational 2×2 matrix N whose algebra Q[N] is reduced, the determinant-one integral elements in its centralizer with entrywise height ≤p^A have O_A(log p) possibilities, uniformly in N and its embedding. A nonreduced quadratic algebra is the unipotent case and must be returned to the cusp branch. Scalar common centralizers impose no rigidity and must be eliminated by additional intertwining equations.


Proof/construction route:

1. In the imaginary quadratic case integral norm-one eigenvalues are roots of unity, leaving an absolute bound. In the split rational case they are rational algebraic integer units, hence ±1.
2. In the real quadratic case log of the absolute first eigenvalue embeds the norm-one unit group modulo a finite kernel into R. The trace of a nontrivial positive unit is an integer ≥3, giving a uniform positive separation for the logarithms. An eigenvalue has absolute value ≤2h(M), so only O_A(log p) separated values occur.
3. If the minimal polynomial has a repeated root, isolate its nilpotent part and its rational fixed line; this is the cusp/unipotent configuration, where the logarithmic count is not claimed.


Acceptance: Upper unipotent matrices of height p^A have polynomially many parameters and are excluded from this logarithmic conclusion.


Prerequisites: `GeometricFreyMazur:GF.2/height-adapter`, `GeometricFreyMazur:GF.3/small-height-reconstruction`.


Source: BT16, Proof of Proposition 18, pp. 730–731. Quadratic centralizers give only logarithmically many small elements is the source input; the statement here fixes the conventions needed by its consumers.


### Diagonal-overlap dichotomy

Target `GeometricFreyMazur:GF.4/diagonal-overlap` (theorem).

There exist absolute constants A,C,δ₀>0 such that for fixed 0<δ<δ₀, all sufficiently large p and ξ∈S², membership in more than C log p distinct tubes B(Δ_g,δρ_X) forces one of: (a) ξ is within (1/2+Aδ)ρ_X+C of a point of SBC×SBC; (b) ξ is within Aδρ_X+C of an ordinary small Hecke curve τ_{g,m} or its real analytic conjugate companion τ̄_{g,m} with m≤C_δp^{Aδ}. All constants are independent of the curve integrated through ξ.


Proof/construction route:

1. Near a cusp in one coordinate, cusp separation forces all relevant deck transformations into one cusp-stabilizer coset. Cusp height and normalizer arguments put the other coordinate near a cusp with the same stabilizer, giving (a).
2. Away from all deep cusp neighborhoods, move to nearby marked elliptic vertices and lift each short displacement. Distinct lifts give pairs of small integral conjugacy equations.
3. If the common quadratic algebra is reduced and nonscalar, the uniform unit count gives O(log p). A nilpotent relation returns to the cusp branch. In the scalar-centralizer case reconstruct the unique small integral projective intertwiner from at most three relations. Its determinant is nonzero but can have either sign: use the positive lattice map for τ_(g,m), or factor the reflection and use τ̄_(g,m). The displacement bounds use h_X≤h_Y and the corresponding conjugate isometry.


Acceptance: Quantify C log p as a uniform finite threshold, rather than treating ω(log p) as a predicate on a single point.


Prerequisites: `GeometricFreyMazur:GF.4/big-diagonals`, `GeometricFreyMazur:GF.2/short-elliptic-displacement`, `GeometricFreyMazur:GF.2/cusp-double-coset`, `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.2/cusp-ball-count`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.4/quadratic-centralizer-count`, `GeometricFreyMazur:GF.3/three-bicusp-repulsion`, `GeometricFreyMazur:GF.3/conjugate-hecke`.


Source: BT16, Proposition 18, pp. 728–731. The published proof supplies the common-centralizer dichotomy. This version corrects the missing sign split, without asserting that the original disjunction itself has been disproved.


### Quantitative cusp-rotation overlap

Target `GeometricFreyMazur:GF.4/bicusp-rotation-count` (theorem).

In the cusp branch of the overlap proof the relevant g lie in a single order-p stabilizer coset. At distance d>0 from its fixed cusp, the number moving a coordinate less than 2R is at most C min(p,1+p sinh(R)/sinh(d)). For a fixed pair of projected bicusp centres a₁,a₂ in the cusp-branch decomposition, the transformations carrying a₂ to a₁ form one order-p stabilizer coset. The short-displacement comparison can be made in either slot separately, by taking inverses; use the farther of that slot’s two cusp coordinates, so d=d_S(z_i,a_i). With R=O(δρ_X), this gives O(1+p^{1+Aδ}e^{−d}) for d≥1 and O(p) for d<1. At d=0 use p directly. The weaker shell bound with an exponential O(δρ_X) loss is sufficient for diagonal multiplicity.


Proof/construction route:

1. Attach the two projected bicusp centres from the cusp-branch lift. The deck transformation sends the source centre to the target centre. Fixing a pair leaves a coset of the source stabilizer, of order p. Two short transformations in this coset differ by a rotation with O(δρ_X) displacement. Apply this to the source slot and, by inversion, to the target slot. The radius R₀+O(δρ_X)<ρ_X ensures the short lifts agree.
2. For a rotation through 2πk/p in an embedded hyperbolic disc, compute sinh(distance(z,g^kz)/2)=sinh(d)|sin(πk/p)|.
3. Count the equally spaced angles satisfying this inequality and include the identity by the additive 1. The two coordinate inequalities only reduce the count.
4. For R growing like δlog p, retain sinh(R); replacing it by R is unjustified. Absorb exp(O(δρ_X)) in p^{Aδ} after all constants are fixed.


Acceptance: R→0 recovers a bound proportional to pR/sinh d plus 1. For R=δρ_X growing with p, test sinh R instead of its small-R linear approximation.


Prerequisites: `GeometricFreyMazur:GF.4/diagonal-overlap`, `GeometricFreyMazur:GF.1/triangle-coordinates`, `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `HyperbolicCurveVolumesAndGonality:HV.0/cayley-distance`.


Source: BT16, Quantitative cusp case of Proposition 18(a), pp. 729–730; corrected angular calculation in this reader. The source uses a circle-circumference argument. The precise hyperbolic rotation identity supplies the valid bound for growing radii.


## GF.5: Four multiplicity bounds and cusped measures


### Canonical degree and weighted multiplicity adapters

Target `GeometricFreyMazur:GF.5/degree-conventions` (comparison).

Use the imported effective curve cycles on X(p)^r. For a normalized map ν:D→X(p)^r, put Deg(ν_*[D])=deg_D ν* K_{X(p)^r}=Σ_j deg(pr_jν)(2g_X−2), with degree zero for a constant coordinate. Equivalently vol=2πDeg. Local multiplicities of a pushforward include the map degree over its image. Point-sums along a big diagonal and divisor intersection along a small diagonal remain different operations.


Proof/construction route:

1. Apply the imported cycle normalization and weighted pushforward, then the canonical-area theorem coordinate by coordinate.
2. Use the projection formula to identify algebraic and analytic degrees under C2/C5. No area factor remains inside the algebraic largest-projection inequality.


Acceptance: The diagonal map D=X→X² has degree 2(2g_X−2). A q-fold cover of a curve image multiplies volume, degree and local pushforward multiplicity by q. A constant cusp coordinate contributes zero to the degree.


Prerequisites: `HyperbolicCurveVolumesAndGonality:HV.2/effective-cycle`, `HyperbolicCurveVolumesAndGonality:HV.2/finite-pushforward`, `HyperbolicCurveVolumesAndGonality:HV.2/branch-multiplicity`, `HyperbolicCurveVolumesAndGonality:HV.3/canonical-area`, `ComplexComparisonPartII:C2/projective-geometric-dictionaries`, `ComplexComparisonPartII:C5/chern-fubini-study-intersection`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.


Source: BT16, §1.3, p. 713; proof of Theorem 29, pp. 741–742. Canonical degree and weighted multiplicity adapters is the source input; the statement here fixes the conventions needed by its consumers.


### Heegner multiplicity decay

Target `GeometricFreyMazur:GF.5/heegner-multiplicity` (theorem).

Fix δ₁>0 small and then δ₂>0 sufficiently small in terms of δ₁. For all sufficiently large p and every effective one-cycle C⊂S with no Hecke component, mult_CM⁺(C)≤C_{δ₁,δ₂}(p^{−2δ₂}+p^{3δ₁−1})Deg(C). Thus for some η>0, uniformly in C, mult_CM⁺(C)=O(p^{−η}Deg(C)).


Proof/construction route:

1. Put d=p^{δ₁}. Off the union of T_m with m<d, corrected Heegner repulsion makes the δ₂ρ_X balls disjoint after splitting the two elliptic types. Point-volume bounds cost a(δ₂ρ_X)⁻¹=O(p^{−2δ₂}).
2. On the small Hecke union, use weighted Hecke pull-push and the ordinary diagonal volume bound, or its intersection corollary. The fixed-radius CM balls on the diagonal are disjoint, and a radius almost ρ_X/2 yields a p⁻¹ factor.
3. Sum ψ(m)≪m² for m<d, giving d³. Choose 3δ₁<1 and η<min(2δ₂,1−3δ₁) before choosing p.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.3/heegner-repulsion`, `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `HyperbolicCurveVolumesAndGonality:HV.4/point-volume`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-volume`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-diagonal`.


Source: BT16, Proposition 25 and proof, pp. 736–737, restricted using erratum Proposition 2.1. Heegner multiplicity decay is the source input; the statement here fixes the conventions needed by its consumers.


### Anti-Heegner multiplicity decay

Target `GeometricFreyMazur:GF.5/anti-heegner-multiplicity` (theorem).

With independent small δ₁,δ₂ chosen as above, every effective non-Hecke one-cycle C⊂S satisfies mult_CM⁻(C)≤C_{δ₁,δ₂}(p^{−2δ₂}+p^{3δ₁−1})Deg(C) for all sufficiently large p. In particular it is O(p^{−η}Deg(C)) for a fixed η>0. This estimate does not use an intersection product with a conjugate Hecke locus.


Proof/construction route:

1. Split CM⁻ into points off and on the small T̄_m union. Isometric transport of the corrected repulsion gives the disjoint-ball estimate off that union.
2. For points on T̄_m, apply the holomorphic Hecke pull-push to C and use fixed ε-balls at the CM⁻ points on the conjugate diagonal. Their volumes are bounded by the ε-tube volume.
3. The imported conjugate-diagonal ratio gives V(ε)≤(sinh ε/sinh R)V(R), taking R approaching ρ_X/2 from below. This is O(p⁻¹) times the total cycle volume. The ratio is the reciprocal of the erratum’s misprinted line. Sum the O(d³) Hecke degree costs.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.3/conjugate-hecke`, `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `HyperbolicCurveVolumesAndGonality:HV.4/point-volume`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-conjugate`.


Source: BTE, Erratum Proposition 4.1, p. 3, with the displayed ratio corrected. Anti-Heegner multiplicity decay is the source input; the statement here fixes the conventions needed by its consumers.


### The stronger singular-bicusp multiplicity bound

Target `GeometricFreyMazur:GF.5/bicusp-multiplicity` (theorem).

Choose δ₃>0 small first, independently of δ₁,δ₂. Then choose δ₁>0 so small that 3δ₁<2δ₃, and δ₂>0 a sufficiently small positive multiple of δ₁ as required by bicusp repulsion. For d=p^{δ₁}, T=SBC∩⋃_{m<d}(T_m∪T̄_m) and S₀=SBC−T, every effective non-Hecke C⊂S satisfies mult_{S₀}(C)≪p^{−1−2δ₂}Deg(C) and mult_T(C)≪p^{−1−2δ₃+3δ₁}Deg(C). Consequently p mult_SBC(C)=O(p^{−η}Deg(C)) for any fixed 0<η<min(2δ₂,2δ₃−3δ₁).


Proof/construction route:

1. Use signed three-bicusp repulsion, so balls centered off the ordinary-and-conjugate small-Hecke union overlap at most twice. Point-volume gives p^(−1−2δ₂).
2. For each signed locus pull back by the holomorphic cyclic Hecke correspondence to the ordinary or conjugate diagonal. Balls centered at its SBC points have radius (1/2+δ₃)ρ_X. If at least two overlap, the midpoint lens places the point within δ₃ρ_X+O(1) of that diagonal, using conjugation as an isometry in the negative case. The cusp count bounds the overlap by p^(24δ₃), with a fixed extra constant in δ₃ allowed.
3. The isolated-ball contribution is p^(−1−2δ₃) times ψ(m)Deg(C). The multiple-overlap contribution is bounded by p^(−1−2δ₃) p^(Bδ₃) p^(−1+2δ₃) ψ(m)Deg(C), using cosh for the ordinary diagonal and sinh for the conjugate diagonal. First fix δ₃ with (B+2)δ₃<1; then this is at most the isolated contribution. Sum ψ(m) for m<d to obtain p^(−1−2δ₃+3δ₁), and choose 3δ₁<2δ₃. This adds the missing negative-sign branch to the author erratum argument.


Acceptance: The output is p·mult_SBC=o(Deg), which absorbs order-p inertia. The weaker p^{−1+ε} bound does not pass this acceptance check.


Prerequisites: `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.3/three-bicusp-repulsion`, `GeometricFreyMazur:GF.2/cusp-lens`, `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `HyperbolicCurveVolumesAndGonality:HV.4/point-volume`, `HyperbolicCurveVolumesAndGonality:HV.4/diagonal-volume`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-diagonal`, `GeometricFreyMazur:GF.3/conjugate-hecke`, `GeometricFreyMazur:GF.2/cusp-ball-count`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-conjugate`.


Source: BTE, Erratum Proposition 4.2, p. 4, including (1.2) and the final two estimates. The independent-exponent positive-sign argument is the author erratum. The added signed-repulsion and conjugate-diagonal branch are new proof obligations resolved by the calculations in the reader.


### Projectionwise cusped-volume measure

Target `GeometricFreyMazur:GF.5/cusped-measure` (construction).

For a normalized effective curve cycle ν:D→X(p)^r define its cusped area measure as the weighted sum of the extensions of (pr_jν)*ω_Y over each nonconstant coordinate. A constant coordinate contributes zero, including a coordinate constantly equal to a cusp. At a nonconstant cusp preimage use the integrable punctured-disc density, with no point atom. The compact area measure is defined by the analogous sum with ω_X. Their difference is a positive finite measure.


Proof/construction route:

1. Use the imported cusp-pullback integration theorem. Locally q(t)=t^e u(t), e>0, gives an integrable density proportional to 1/(|t|² log²|t|); it is not evaluation of a singular two-form at a constant cusp map.
2. Apply the compact-versus-cusped metric comparison to nonconstant coordinates. Linearity handles effective cycles and weighted maps.
3. For each nonconstant projection of degree d_j the total areas are d_j times the total base-curve areas, by the finite-map integration formula; constant coordinates have d_j=0. All constructions are independent of normalization parameters.


API:

* `TauCeti.GeometricFreyMazur.cuspedMeasure_nonconstant` (characterisation): A nonconstant coordinate contributes the extension of the pulled-back punctured hyperbolic measure with zero point mass.
* `TauCeti.GeometricFreyMazur.cuspedMeasure_constant` (simp): Every constant coordinate contributes zero, including a constant cusp.
* `TauCeti.GeometricFreyMazur.cuspedMeasure_add` (structure): Weighted effective cycles and coordinate sums add their measures.
* `TauCeti.GeometricFreyMazur.cuspedMeasure_total` (data): The total is Σ_j d_j Area(Y(p)).
* `TauCeti.GeometricFreyMazur.cuspedMeasure_positiveDifference` (relation): The cusped measure dominates the compact one.
* `TauCeti.GeometricFreyMazur.cuspedMeasure_transport` (functoriality): Normalization reparametrization, component transport and complex conjugation preserve the measure; algebraic base change precedes complex realization.


Checks:

* `TauCeti.GeometricFreyMazur.cusped_measure_test1`: The curve t↦(t,cusp) has exactly the first coordinate’s cusped measure, not an undefined infinite term.
* `TauCeti.GeometricFreyMazur.cusped_measure_test2`: For q(t)=t² the cusp contribution is locally integrable and has zero mass at t=0.
* `TauCeti.GeometricFreyMazur.cusped_measure_test3`: A degree-q parametrization multiplies the pushforward measure by q.


Consumers:

* BT16 Proposition 27, pp. 738–740: Compares cusped Hecke-isometric tubes with compact tubes on curves possibly meeting boundary strata.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.1/metric-comparison`, `HyperbolicCurveVolumesAndGonality:HV.2/cusp-pullback`, `HyperbolicCurveVolumesAndGonality:HV.2/finite-pushforward`, `HyperbolicCurveVolumesAndGonality:HV.2/cycle-volume`.


Source: BT16, Lemma 28, p. 738, with projectionwise interpretation at the boundary. Projectionwise cusped-volume measure is the source input; the statement here fixes the conventions needed by its consumers.


### Uniform cusped-volume error

Target `GeometricFreyMazur:GF.5/cusped-volume-error` (theorem).

For every effective curve cycle C⊂X(p)^r and measurable A on its normalization, 0≤vol′(C∩A)−vol(C∩A)≤C₀p⁻¹ vol(C). On one component the index is p(p²−1)/2, the cusp count is s=(p²−1)/2, and g_X=1+(p²−1)(p−6)/24; thus Area(Y)/Area(X)=1+s/(2g_X−2)=1+O(p⁻¹). The estimate remains valid with constant cusp coordinates.


Proof/construction route:

1. Use the projectionwise total-measure formula, since all component area ratios are equal. Orbifold area and local ramification give the index, cusp count and genus formulas.
2. The total positive difference is O(p⁻¹) times compact volume. Its mass on any measurable subset is bounded by its total mass.


Acceptance: For p=7 the genus is 3, s=24 and the area ratio is 7, consistent with an asymptotic O(1/p) bound with a sufficiently large absolute constant.


Prerequisites: `GeometricFreyMazur:GF.5/cusped-measure`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R13.3`.


Source: BT16, Lemma 28, p. 738; §2.1, p. 714. Uniform cusped-volume error is the source input; the statement here fixes the conventions needed by its consumers.


### Hecke tubes away from cusps

Target `GeometricFreyMazur:GF.5/hecke-tube-comparison` (theorem).

Prime-to-p Hecke branches are local isometries for h_Y. Outside compact cusp balls of radius (1/2−Aδ)ρ_X, compact and cusped metrics have a uniform comparison sufficient to carry an O(δρ_X) compact Hecke tube to an O(δρ_X) cusped tube. Apply the Hecke pull-push and then replace cusped by compact volumes with the uniform O(p⁻¹) error. The resulting ordinary diagonal tube estimate requires that the projected curve have no Hecke component, so its pull-push has no diagonal component. For a conjugate Hecke tube use the same holomorphic pull-push followed by the imported relative conjugate-diagonal bound. It needs no false divisor intersection with the real analytic locus; the large-radius sinh denominator gives the same p^(−1) gain.


Proof/construction route:

1. Uniformize a branch of the isogeny correspondence by a positive real Möbius transformation; it is an isometry of the cusped metric.
2. Use the compact comparison and cusp-ball enlargement to ensure that each compared path stays in the allowed complement. Enlarge the constant A before fixing δ.
3. Apply the finite correspondence integration formula and the relative-diagonal estimate to the weighted pull-push. Check the no-diagonal-component condition by tracing it back to the original Hecke locus.


Acceptance: Hecke maps are not asserted to be isometries of h_X. A projected Hecke component fails the no-diagonal-component hypothesis and cannot be fed into this estimate.


Prerequisites: `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.1/cusp-coordinates`, `GeometricFreyMazur:GF.1/metric-comparison`, `GeometricFreyMazur:GF.5/cusped-volume-error`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-diagonal`, `ModularCurvesPartII:R12.1`, `GeometricFreyMazur:GF.3/conjugate-hecke`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-conjugate`.


Source: BT16, Proof of Proposition 27, pp. 738–740. Hecke tubes away from cusps is the source input; the statement here fixes the conventions needed by its consumers.


### Big-diagonal multiplicity in the required non-Hecke setting

Target `GeometricFreyMazur:GF.5/big-diagonal-multiplicity` (theorem).

There exist η>0,C,p₀ such that for every prime p>p₀ and effective curve cycle C⊂S², if C has no component in any Δ_g and both projected cycles pr_i*C are nonconstant and have no Hecke component, then Σ_g mult_{Δ_g}(C)≤Cp^{−η}Deg(C). For the gonality pullback both projected cycles are nonconstant and non-Hecke. The unrestricted statement for every curve outside the big diagonals is not used and is false on T₁×T₁.


Proof/construction route:

1. Apply the imported double-diagonal point-volume estimate at radius δρ_X/2 and integrate the overlap dichotomy. The ordinary region contributes O(log p·p^{−δ})Deg(C).
2. For the ordinary and conjugate small-Hecke regions apply the signed Hecke-tube comparison to weighted projected cycles. Use cosh and sinh normalization respectively. Only the ordinary case needs the projected non-Hecke hypothesis; both give p^(−1) with p^(Aδ) losses.
3. For the bicusp region use the corrected rotation shell bound, signed three-bicusp repulsion, cusp-ball enlargement and the cusp count. The relative point-ball comparison is a separate HV.4 request: V(r)≤C_n(1+r)exp(r−R)V(R) for 1≤r≤R−2 and R<ρ_X. Its Green-identity proof is in the reader; absorb its O(log p) factor by a smaller fixed positive decay exponent. Split the area form into its two surface projections before estimating cusp overlap. For each projection and each original-radius bicusp centre, the other projected centres number p^(O(δ)); a fixed pair gives one order-p stabilizer coset, bounded by the rotation estimate. Apply the point-ball comparison to the weighted projected curve. The sum of enlarged projected ball volumes is bounded by 2vol plus p^(−1+O(Bδ))vol: when at least three projected centres occur, strengthened signed reconstruction places the point in one thin signed Hecke tube on the cusp complement. The cusp count and cosh/sinh tube comparison give the bound. The strengthened reconstruction conclusion includes both proximity to the signed locus and separation from all cusps. Choose the enlargement constant B to dominate original-radius losses, then δ so small that O(Bδ)<1/2. This avoids an unjustified product-ball overlap inference from three-bicusp repulsion. All polynomial logarithmic factors are absorbed by a smaller decay exponent. The reader gives the inequalities and their order of choices.
4. Before p grows choose δ>0 small enough for every previous lemma and Aδ<1/4. The sum of log p·p^{−δ}, p^{Aδ−1}, p^{−δ/2} and p^{Aδ−1/2} is O(p^{−η}) for η<min(δ/4,1/4). The reader records a counterexample to the published unrestricted formulation.


Acceptance: For C inside T₁×T₁ with generic ample underlying curve, the unrestricted ratio tends to 3 and does not decay. The final pullback application must establish the projected non-Hecke condition before invoking this node.


Prerequisites: `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.4/big-diagonals`, `GeometricFreyMazur:GF.4/diagonal-overlap`, `GeometricFreyMazur:GF.4/bicusp-rotation-count`, `GeometricFreyMazur:GF.3/three-bicusp-repulsion`, `GeometricFreyMazur:GF.2/cusp-ball-count`, `GeometricFreyMazur:GF.1/cusp-coordinates`, `GeometricFreyMazur:GF.5/hecke-tube-comparison`, `GeometricFreyMazur:GF.5/cusped-volume-error`, `GeometricFreyMazur:GF.0/hecke-loci`, `HyperbolicCurveVolumesAndGonality:HV.4/double-diagonal`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-diagonal`, `GeometricFreyMazur:GF.3/conjugate-hecke`, `HyperbolicCurveVolumesAndGonality:HV.5/relative-conjugate`, `HyperbolicCurveVolumesAndGonality:HV.4`.


Source: BT16, Proposition 27 and its proof, pp. 737–740, with the projected non-Hecke hypotheses made explicit. Big-diagonal multiplicity in the required non-Hecke setting is the source input; the statement here fixes the conventions needed by its consumers.


## GF.6: Gonality pencils and normalized pullbacks


### Symmetric powers of the quotient surface

Target `GeometricFreyMazur:GF.6/surface-symmetric-power` (construction).

For n≥1 construct SymⁿZ(p)=Z(p)^n/S_n as a projective finite quotient, with its geometric-point cycle interpretation and characteristic-zero base-change compatibility. This uses a surface finite quotient, not the curve symmetric powers of JacobianChallenge. At the point-set level it agrees with Mathlib Sym; its scheme structure and the cycle morphism are supplied by the finite-quotient contract.


Proof/construction route:

1. Take the permutation action on the n-fold product and descend the norm of an ample bundle. Apply the requested SF.1 finite quotient with an invariant projective embedding.
2. Identify orbits with effective degree-n zero-cycles. On finite flat degree-n families, construct the cycle map through local invariant functions/norms and glue; this is the precise relative cycle interface requested from SF.1.
3. Check characteristic-zero base change, product permutations and both determinant components; complex conjugation commutes with the algebraic quotient.


API:

* `TauCeti.GeometricFreyMazur.surfaceSym_mk` (constructor): An ordered n-tuple defines its unordered effective zero-cycle.
* `TauCeti.GeometricFreyMazur.surfaceSym_eq` (characterisation): Two geometric tuples have the same image exactly when related by a permutation, including repeated points.
* `TauCeti.GeometricFreyMazur.surfaceSym_desc` (universal-property): Invariant morphisms descend uniquely through the finite quotient.
* `TauCeti.GeometricFreyMazur.surfaceSym_cycleMap` (constructor): A finite flat degree-n family in Z yields its relative cycle morphism, with fibre multiplicities.
* `TauCeti.GeometricFreyMazur.surfaceSym_pointSet` (compatibility): On geometric points the quotient agrees with Mathlib Sym and its functorial map.
* `TauCeti.GeometricFreyMazur.surfaceSym_baseChange` (functoriality): Finite quotient, norm polarization and relative cycle morphism commute with characteristic-zero base change and conjugation.


Checks:

* `TauCeti.GeometricFreyMazur.surface_symmetric_power_test1`: Sym¹Z=Z; the permutation group is trivial.
* `TauCeti.GeometricFreyMazur.surface_symmetric_power_test2`: In Sym²Z the cycle 2[z] is retained and is fixed by the transposition.
* `TauCeti.GeometricFreyMazur.surface_symmetric_power_test3`: [z₁]+[z₂]=[z₂]+[z₁], but equals 2[z₁] only when z₁=z₂.


Consumers:

* BT16 Theorem 29, p. 741: The gonality pencil maps to this projective surface symmetric power.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/diagonal-quotient`, `SchemeAndStackFoundations:SF.1`, `mathlib:Sym`, `mathlib:Sym.map`, `mathlib:Sym.map_map`.


Source: BT16, Proof of Theorem 29, p. 741. Symmetric powers of the quotient surface is the source input; the statement here fixes the conventions needed by its consumers.


### Reduction to the normalization of the image

Target `GeometricFreyMazur:GF.6/image-normalization` (application).

A nonconstant map from a smooth connected curve B of gonality n to projective Z extends from its smooth completion and factors through the smooth projective normalization D of its integral image. One has gon(D)≤n, so it suffices to prove rigidity for a map birational onto its image. This includes nonproper B and maps of generic degree greater than one.


Proof/construction route:

1. Use properness to extend across the finitely many omitted points, and the normalization universal property to factor through D.
2. For the generic finite map B̄→D push a degree-n pencil divisor to D. Its fibres are linearly equivalent by the norm of ratios of pencil functions. They vary, since a fixed finite support cannot contain the images of every fibre of a surjective finite map. The varying degree-n linear system contains a pencil, which after removing base points has degree ≤n.
3. This norm-pushforward gonality lemma belongs to HV.6 and is requested there; this node is its application to the quotient image.


Acceptance: A degree-q map onto a rational image still reduces to gonality 1; do not assume the original map has degree one.


Prerequisites: `GeometricFreyMazur:GF.0/diagonal-quotient`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `HyperbolicCurveVolumesAndGonality:HV.6/gonality`, `HyperbolicCurveVolumesAndGonality:HV.6/pencils`, `HyperbolicCurveVolumesAndGonality:HV.6`.


Source: BT16, The birational-to-image reduction in Theorem 29, p. 741, expanded by the norm-of-pencil argument. Reduction to the normalization of the image is the source input; the statement here fixes the conventions needed by its consumers.


### The gonality-pencil cycle map

Target `GeometricFreyMazur:GF.6/pencil-cycle-map` (construction).

Let B be smooth projective connected, f:B→Z birational onto its image, and h:B→P¹ a finite degree-n gonality pencil, n≥1. The fibre cycles f_*h⁻¹(t), with scheme multiplicities, define φ:P¹→SymⁿZ. It is nonconstant and generically degree one onto its image.


Proof/construction route:

1. Apply the relative cycle map to the finite flat h and the graph of f. Finite maps of smooth curves are flat; ramified fibres carry their full local multiplicity.
2. On a dense open where f is injective and h is étale, two distinct fibres have disjoint images, so their cycles cannot coincide. Thus φ is generically injective, and in characteristic zero it is birational onto its image.
3. A change of basis in the pencil postcomposes h by PGL₂ and precomposes φ by its inverse, leaving the pulled-back covering construction isomorphic.


API:

* `TauCeti.GeometricFreyMazur.pencilCycle_fibre` (simp): At t, φ(t) is the sum of f(b) with multiplicity e_b(h).
* `TauCeti.GeometricFreyMazur.pencilCycle_nonconstant` (characterisation): The disjoint generic fibres of h have distinct cycles under a birational f.
* `TauCeti.GeometricFreyMazur.pencilCycle_degreeOne` (relation): The map to its integral image has function-field degree one.
* `TauCeti.GeometricFreyMazur.pencilCycle_changeBasis` (functoriality): Changing the pencil basis acts by the corresponding inverse automorphism on the parameter P¹.
* `TauCeti.GeometricFreyMazur.pencilCycle_baseChange` (functoriality): Finite-flat fibres and their cycle multiplicities commute with base change and conjugation.
* `TauCeti.GeometricFreyMazur.pencilCycle_Sym` (compatibility): On an étale fibre the value is the ordinary unordered n-tuple in Mathlib Sym.


Checks:

* `TauCeti.GeometricFreyMazur.pencil_cycle_map_test1`: For n=1, φ is the original rational curve map.
* `TauCeti.GeometricFreyMazur.pencil_cycle_map_test2`: For a double-cover pencil, a ramification fibre gives 2[f(b)] in Sym²Z.
* `TauCeti.GeometricFreyMazur.pencil_cycle_map_test3`: Two distinct generic fibres cannot have the same cycle if f is birational; dropping that hypothesis requires the image reduction first.


Consumers:

* GF.6 normalized pullback: Provides the rational base curve for the ramification contradiction.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.6/surface-symmetric-power`, `GeometricFreyMazur:GF.6/image-normalization`, `HyperbolicCurveVolumesAndGonality:HV.6/pencils`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `SchemeAndStackFoundations:SF.1`.


Source: BT16, Proof of Theorem 29, p. 741. The gonality-pencil cycle map is the source input; the statement here fixes the conventions needed by its consumers.


### A normalized pullback and its wreath stabilizer

Target `GeometricFreyMazur:GF.6/normalized-pullback` (construction).

Let W=G^n⋊S_n act on S^n and let q:S^n→SymⁿZ be its finite quotient. For φ as above normalize an irreducible component of P¹×_{SymⁿZ}S^n dominating P¹, obtaining a smooth projective connected curve C with ψ:C→S^n and finite α:C→P¹. If H≤W stabilizes the chosen component, the induced action on its normalization has C/H≅P¹. Remove its action kernel when discussing effective local inertia. The component and H are choices; degree-weighted conclusions are independent of them.


Proof/construction route:

1. Use finite base change, existence and finiteness of curve normalization. The map ψ is generically birational to its image because φ is birational onto its image.
2. Over the generic unramified locus, the finite quotient fibre is a single W-orbit and W permutes its irreducible components transitively. The stabilizer H acts transitively on the generic fibre in the chosen component, so its invariant function field is k(P¹).
3. Normalize the quotient and identify it with P¹ by the smooth proper curve/function-field dictionary. Do not assume an unramified pullback at branch points.


API:

* `TauCeti.GeometricFreyMazur.pullbackCurve_maps` (projection): α and ψ form the commuting square with φ and the actual finite quotient q.
* `TauCeti.GeometricFreyMazur.pullbackCurve_stabilizer` (data): H is the component stabilizer inside G^n⋊S_n, with its induced normalization action.
* `TauCeti.GeometricFreyMazur.pullbackCurve_quotient` (universal-property): The effective quotient of C by H is P¹ and its quotient map is α.
* `TauCeti.GeometricFreyMazur.pullbackCurve_changeComponent` (equivalence): Another dominating component is a W-translate and has conjugate stabilizer.
* `TauCeti.GeometricFreyMazur.pullbackCurve_finite` (structure): α is finite and C is smooth projective connected in characteristic zero.
* `TauCeti.GeometricFreyMazur.pullbackCurve_baseChange` (functoriality): Under algebraically closed extension normalization and component choices transport after choosing a compatible geometric component; W-conjugate choices give the same estimates.


Checks:

* `TauCeti.GeometricFreyMazur.normalized_pullback_test1`: For n=1 the permutation factor disappears but G-inertia remains.
* `TauCeti.GeometricFreyMazur.normalized_pullback_test2`: For n=2 a transposition can fix a tuple with the two quotient points equal.
* `TauCeti.GeometricFreyMazur.normalized_pullback_test3`: A pullback meeting a branch point is normalized; it is not declared étale by the fibre-product notation.


Consumers:

* BT16 Theorem 29, pp. 741–742: Local H-inertia computes Ram(α).


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.6/pencil-cycle-map`, `GeometricFreyMazur:GF.0/diagonal-quotient`, `GeometricFreyMazur:GF.6/surface-symmetric-power`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `SchemeAndStackFoundations:SF.1`, `HyperbolicCurveVolumesAndGonality:HV.2/analytic-normalization`.


Source: BT16, Proof of Theorem 29 and diagram, p. 741. A normalized pullback and its wreath stabilizer is the source input; the statement here fixes the conventions needed by its consumers.


### Weighted projection cycles and nondegeneracy

Target `GeometricFreyMazur:GF.6/projection-cycles` (theorem).

Assume the image of B is not Hecke. Define C_i=(pr_iψ)_*[C] and C_ij=(pr_ijψ)_*[C] as weighted effective one-cycles, with multiplicity equal to generic map degree times image multiplicity. Every C_i is nonconstant and has no Hecke component, and every C_ij is contained in no Δ_g. One has Deg(C)=Σ_i Deg(C_i) and Σ_{i<j}Deg(C_ij)=(n−1)Deg(C). These facts hold for the actual chosen component and its stabilizer.


Proof/construction route:

1. Connectedness of B and the monodromy of its degree-n pencil make the component stabilizer transitive on the n slots. Each slot maps dominantly to B’s image in Z, so cannot be constant or Hecke if that image is non-Hecke.
2. If C_ij lay in Δ_g then the corresponding quotient points in the generic fibre cycle would coincide. Generic h-fibres contain n distinct points and f is generically injective, excluding this.
3. Apply the canonical-degree projection formula. Each slot occurs once in the first sum and n−1 times among unordered pairs. All multiplicity bounds use these pushforward cycles rather than reduced images.


Acceptance: For n=1 the pair sum is zero. For n=2 its sole pair cycle has Deg(C_12)=Deg(C). Check the non-Hecke hypothesis for both slots before applying the big-diagonal estimate.


Prerequisites: `GeometricFreyMazur:GF.6/normalized-pullback`, `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.4/big-diagonals`, `GeometricFreyMazur:GF.0/hecke-loci`.


Source: BT16, Proof of Theorem 29, pp. 741–742, with the non-Hecke projection check needed by corrected Proposition 27. Weighted projection cycles and nondegeneracy is the source input; the statement here fixes the conventions needed by its consumers.


## GF.7: Ramification decay and geometric rigidity


### Exhaustive wreath ramification support

Target `GeometricFreyMazur:GF.7/ramification-support` (theorem).

In the normalized pullback, every ramification point of α lies over either a CM⁺, CM⁻ or SBC point in some slot, or Δ_g^{ij} in two distinct slots for some g∈G. Here Δ_g^{ij} means simultaneous equality of both matched X coordinates. The list exhausts the finite wreath quotient inertia.


Proof/construction route:

1. A nonidentity stabilizer element with trivial permutation has a nonidentity G element in a slot, so the quotient branch-locus theorem gives a special point there.
2. If the permutation is nontrivial, one of its moved slots is matched to another through a G transformation, producing Δ_g^{ij}. A point with free ambient W action has étale quotient neighborhood and cannot acquire ramification merely by pullback and normalization.
3. If the ambient stabilizer acts on several normalization branches, pass to the branch stabilizer; its effective action on the smooth curve gives the local ramification group.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.6/normalized-pullback`, `GeometricFreyMazur:GF.6/projection-cycles`, `GeometricFreyMazur:GF.0/quotient-branch-locus`, `GeometricFreyMazur:GF.4/big-diagonals`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`, `InverseGaloisAndArithmeticFundamentalGroups:IG.3/general-riemann-existence`.


Source: BT16, Proof of Theorem 29, p. 741. Exhaustive wreath ramification support is the source input; the statement here fixes the conventions needed by its consumers.


### Cyclic local indices with only one p factor

Target `GeometricFreyMazur:GF.7/local-indices` (theorem).

For fixed n and prime p>max(5,n), effective local inertia of α is cyclic and has order ≤6n!p. If no slot is an SBC point its order is ≤6n!. The bound is linear in p, rather than p^n, even when several slots are bicusps.


Proof/construction route:

1. An effective finite automorphism group of a smooth complex curve fixing a point acts faithfully on its tangent line, so local inertia is cyclic.
2. For an element of H, its n!th power has trivial permutation. Each remaining coordinate lies in a cyclic stabilizer of order dividing 2,3 or p. Their least common multiple divides 6p; without SBC it divides 6.
3. The order of the element therefore divides 6pn! or 6n!, respectively. Normalization only replaces ambient inertia by a subgroup/quotient and does not enlarge this exponent.


Acceptance: Two order-p slot stabilizers contribute lcm(p,p)=p to a cyclic group, not p².


Prerequisites: `GeometricFreyMazur:GF.7/ramification-support`, `GeometricFreyMazur:GF.0/quotient-branch-locus`, `GeometricFreyMazur:GF.6/normalized-pullback`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`.


Source: BT16, Local-stabilizer paragraph in Theorem 29, p. 741. Cyclic local indices with only one p factor is the source input; the statement here fixes the conventions needed by its consumers.


### Ramification is negligible against canonical degree

Target `GeometricFreyMazur:GF.7/ramification-decay` (theorem).

For fixed n and non-Hecke B as above, there are η_n>0,C_n,p_n such that Ram(α)≤C_np^{−η_n}Deg(C) for p>p_n. More precisely Ram(α)≪_n pΣ_i mult_SBC(C_i)+Σ_i(mult_CM⁺(C_i)+mult_CM⁻(C_i))+Σ_{i<j,g}mult_{Δ_g}(C_ij).


Proof/construction route:

1. Use exhaustive support and the local-index bound, charging each ramified point at most a fixed n-dependent number of times. Each fibre cardinality is bounded by the corresponding branch multiplicity of the weighted projection cycle.
2. Apply the two CM estimates, the stronger p-weighted bicusp estimate and the corrected big-diagonal estimate; the nondegeneracy theorem supplies all projected non-Hecke hypotheses.
3. Use the degree sums and take the minimum of the finitely many positive exponents. Constants depend on n but not the particular curve or its map degree.


Acceptance: Replacing p mult_SBC=o(Deg) by mult_SBC=o(Deg) fails to absorb cusp inertia.


Prerequisites: `GeometricFreyMazur:GF.7/ramification-support`, `GeometricFreyMazur:GF.7/local-indices`, `GeometricFreyMazur:GF.6/projection-cycles`, `GeometricFreyMazur:GF.5/heegner-multiplicity`, `GeometricFreyMazur:GF.5/anti-heegner-multiplicity`, `GeometricFreyMazur:GF.5/bicusp-multiplicity`, `GeometricFreyMazur:GF.5/big-diagonal-multiplicity`.


Source: BT16, The three ramification estimates in Theorem 29, pp. 741–742. Ramification is negligible against canonical degree is the source input; the statement here fixes the conventions needed by its consumers.


### The two Hurwitz inequalities contradict each other

Target `GeometricFreyMazur:GF.7/hurwitz-contradiction` (theorem).

With D=Deg(C)>0, Riemann–Hurwitz for α is the exact equality 2g(C)−2=−2deg α+Ram(α)≤C_np^{−η_n}D. If d is the largest degree of the 2n coordinate maps C→X(p), then D≤2nd(2g_X−2), while Riemann–Hurwitz for that nonconstant projection gives 2g(C)−2≥d(2g_X−2)≥D/(2n). Choosing p so C_np^{−η_n}<1/(2n) is impossible.


Proof/construction route:

1. The canonical-degree adapter gives the sum of the 2n projection degrees. At least one is positive, and g_X≥2 for p>5.
2. Apply the imported Riemann–Hurwitz theorem to α and independently to the largest nonconstant projection. Retain the negative −2deg α term in the equality and discard it only in the upper inequality.
3. Choose a single threshold dominating every previously fixed exponent and constant; divide by D>0. The lower and upper bounds are incompatible.


Acceptance: For a degree-q unramified map to P¹ the formula gives 2g−2=−2q, not zero. No factor 4π appears in the algebraic degree comparison D≤2nd(2g_X−2).


Prerequisites: `GeometricFreyMazur:GF.7/ramification-decay`, `GeometricFreyMazur:GF.6/projection-cycles`, `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.1/compact-injectivity-radius`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`.


Source: BT16, Final paragraph of Theorem 29, p. 742, with exact normalization and negative term retained. The two Hurwitz inequalities contradict each other is the source input; the statement here fixes the conventions needed by its consumers.


### Bounded-gonality rigidity over C

Target `GeometricFreyMazur:GF.7/complex-geometric-rigidity` (theorem).

For every positive integer N there is M_N^geom such that for every prime p>M_N^geom, every smooth connected complex curve B with gon(B)<N and every nonconstant morphism B→Z(p) factors through an irreducible component of H_m for some m≥1 prime to p. Gonality means that of the smooth proper model. The statement covers both determinant components.


Proof/construction route:

1. Reduce to the normalization of the image, with gonality still <N. If the image were non-Hecke, choose its degree-n pencil and the normalized pullback.
2. Apply the Hurwitz contradiction for each 1≤n<N and take the maximum of the finitely many thresholds. For N≤1 no positive gonality occurs, so the statement is vacuous.
3. Transport between the component presentations by the full projective group and the determinant-square-class comparison.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.6/image-normalization`, `GeometricFreyMazur:GF.6/pencil-cycle-map`, `GeometricFreyMazur:GF.6/normalized-pullback`, `GeometricFreyMazur:GF.7/hurwitz-contradiction`, `GeometricFreyMazur:GF.0/diagonal-quotient`, `GeometricFreyMazur:GF.0/hecke-loci`.


Source: BT16, Theorems 3 and 29, pp. 710, 740–742. Bounded-gonality rigidity over C is the source input; the statement here fixes the conventions needed by its consumers.


## GF.8: Modular gonality and full linear monodromy


### Abramovich’s 7/800 bound from the imported numerical inputs

Target `GeometricFreyMazur:GF.8/modular-gonality` (theorem).

For every congruence subgroup Γ≤PSL₂(Z) of finite index D, the compactified complex modular curve satisfies gon(X_Γ)≥7D/800. Interpret λ′₁=min(λ₁,1/4) by the supplied Friedrichs/continuous-spectrum convention, including no discrete eigenvalue below 1/4.


Proof/construction route:

1. Import CongruenceSpectralGap:CSG.5/congruence-bound to obtain λ′₁≥21/100 for the effective congruence quotient.
2. Import Li–Yau in the finite-area singular-metric setting: λ′₁ Area≤8π gon. Import the Fuchsian area Area=πD/3.
3. Divide by 8π to obtain gon≥(21/100)D/24=7D/800. This application supplies the number; the general analytic and spectral results remain in their owners.


Acceptance: Check (21/100)/24=7/800 exactly. Do not apply the compact smooth metric spectral gap to the wrong quotient metric.


Prerequisites: `CongruenceSpectralGap:CSG.5/congruence-bound`, `HyperbolicCurveVolumesAndGonality:HV.7/li-yau`, `HyperbolicCurveVolumesAndGonality:HV.7/congruence-application`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`.


Source: ABR96, Abramovich, Theorem 0.1 and §§1.1–1.7, preprint pp. 1–3. Abramovich’s 7/800 bound from the imported numerical inputs is the source input; the statement here fixes the conventions needed by its consumers.


### Proper subgroup indices grow at least like p

Target `GeometricFreyMazur:GF.8/proper-subgroup-index` (theorem).

For prime p≥5 and every proper subgroup H<SL₂(F_p), [SL₂(F_p):H]≥p. The same conclusion holds for proper subgroups of PSL₂(F_p). In particular the minimum proper-subgroup index tends to infinity.


Proof/construction route:

1. If the coset index d were <p, the action SL₂(F_p)→S_d kills every elementary transvection, because it has order p and S_d has no element of order p.
2. The pinned Tau Ceti transvection-generation theorem then makes the coset action trivial. A transitive trivial coset action has one coset, contradicting properness.
3. For PSL pull back a proper subgroup along the surjection from SL; its index is unchanged. This proof avoids a classification of finite simple groups or of maximal subgroups.


Acceptance: A Borel has index p+1, consistent with the bound. The proof requires p>d; divisibility by p in d! is the exact obstruction.


Prerequisites: `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`, `mathlib:Subgroup.index`, `mathlib:Matrix.ProjectiveSpecialLinearGroup`.


Source: BT16, Bridge required by the surjectivity assertion after Theorem 2, p. 710; elementary proof in this reader. The cited passage supplies the endpoint or motivating use; this target expands the additional bridge explicitly in the reader, using its named supplier interfaces. It is not attributed as a separately proved lemma of the article.


### Full SL₂ torsion monodromy on a bounded-gonality base

Target `GeometricFreyMazur:GF.8/full-linear-monodromy` (theorem).

For each N>0, every nonisotrivial elliptic scheme E/U over C with gon(U)<N has actual p-torsion image SL₂(F_p) whenever p>max(5,800N/7). The determinant is exactly one after choosing a Weil-pairing basis, because all pth roots of unity are constant. Changing the basis conjugates the image and does not change this conclusion.


Proof/construction route:

1. Let H be the actual image. The level-frame torsor and moduli interpretation give a nonconstant classifying map U→Y_H, extending to the smooth proper modular quotient X_H. Its gonality is at most gon(U) by the generic finite-map gonality lemma.
2. The effective image H̄≤PSL₂ gives a congruence quotient of index D. If H̄ is proper, D≥p and the 7/800 bound contradicts gon(U)<N.
3. If H̄ is full but H is proper, the index of H in SL is at most two, contradicting the proper-index bound for p>3. Thus H is full. Do not replace actual image by projective or semisimplified image at the conclusion.


Acceptance: The constant-j case is excluded because its moduli map need not be nonconstant. An index-two lift of full projective image is explicitly ruled out.


Prerequisites: `GeometricFreyMazur:GF.8/modular-gonality`, `GeometricFreyMazur:GF.8/proper-subgroup-index`, `GeometricFreyMazur:GF.0/projective-frames`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `ModularCurvesPartII:R12.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `HyperbolicCurveVolumesAndGonality:HV.6`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.


Source: BT16, Surjectivity remark after Theorem 2, p. 710; Abramovich Theorem 0.1. The cited passage supplies the endpoint or motivating use; this target expands the additional bridge explicitly in the reader, using its named supplier interfaces. It is not attributed as a separately proved lemma of the article.


### An actual full-image representation has no quadratic self-twist

Target `GeometricFreyMazur:GF.8/no-quadratic-self-twist` (theorem).

Let p>3 and ρ:Π→SL₂(F_p) be surjective. If χ:Π→{±1} and an invertible linear A satisfy Aρ(γ)=χ(γ)ρ(γ)A for all γ, then χ is trivial. This is a statement about an actual intertwiner, not equality of projectivizations.


Proof/construction route:

1. For γ in ker ρ the equation forces χ(γ)=1, since A is invertible and p is odd. Hence χ factors through SL₂(F_p).
2. Apply perfectness to the factored character. Scalar ambiguity in the choice of A is harmless; changing the basis conjugates the equation.


Acceptance: Projectivizing the equation erases χ and cannot prove its triviality.


Prerequisites: `mathlib:Matrix.SL2.commutator_eq_top`, `GeometricFreyMazur:GF.8/full-linear-monodromy`, `mathlib:Matrix.ProjGenLinGroup.mk_eq_mk_iff`.


Source: BT16, Actual-torsion descent bridge for Theorem 1, pp. 710–711. The cited passage supplies the endpoint or motivating use; this target expands the additional bridge explicitly in the reader, using its named supplier interfaces. It is not attributed as a separately proved lemma of the article.


## GF.9: Actual torsion, descent and characteristic-zero fields


### The classifying map from actual torsion data

Target `GeometricFreyMazur:GF.9/actual-torsion-classifying-map` (construction).

Let k be algebraically closed of characteristic zero, U/k a smooth connected curve, E,E′/U elliptic schemes and Ψ:E[p]≃E′[p] an isomorphism of finite étale F_p-module schemes. The triple gives a morphism f_Ψ:U→Z(p), with component determined by the Weil multiplier of Ψ modulo squares. Its projective class is used only to construct this map: the original Ψ remains part of the input. If E is nonisotrivial, f_Ψ is nonconstant. It extends uniquely from U to its smooth proper model because Z(p) is proper.


Proof/construction route:

1. Étale-locally choose a full level basis of E[p], transport it through Ψ and take the diagonal quotient. Independence of the basis makes these local maps descend.
2. Projective rescaling of Ψ does not change f_Ψ, but may erase information needed for descent; retain Ψ separately. The first j-coordinate is the original j(E), so nonconstancy follows.
3. Use the valuative criterion of properness on the missing points of the smooth proper base. This is a map to the compact coarse surface, not an assertion of good reduction at those points.


API:

* `TauCeti.GeometricFreyMazur.torsionClassifyingMap_mk` (constructor): An actual finite étale module isomorphism defines the descended coarse map.
* `TauCeti.GeometricFreyMazur.torsionClassifyingMap_eval` (simp): On a geometric fibre its value is (E_u,E′_u,[Ψ_u]).
* `TauCeti.GeometricFreyMazur.torsionClassifyingMap_frameIndependent` (compatibility): A simultaneous change of actual basis leaves the quotient map fixed.
* `TauCeti.GeometricFreyMazur.torsionClassifyingMap_multiplier` (data): The determinant square class is the Weil-pairing multiplier modulo squares.
* `TauCeti.GeometricFreyMazur.torsionClassifyingMap_nonconstant` (relation): Nonconstant j(E) forces a nonconstant classifying map.
* `TauCeti.GeometricFreyMazur.torsionClassifyingMap_baseChange` (functoriality): Restriction, algebraically closed extension and finite-type spreading commute with the classifying map and its compact extension.


Checks:

* `TauCeti.GeometricFreyMazur.actual_torsion_classifying_map_test1`: For E′=E and Ψ=id the image lies on H₁.
* `TauCeti.GeometricFreyMazur.actual_torsion_classifying_map_test2`: Ψ and −Ψ yield the same map for odd p, while the input is still an actual module isomorphism.
* `TauCeti.GeometricFreyMazur.actual_torsion_classifying_map_test3`: A nontrivial quadratic twist gives a projective torsion identification but need not supply the Ψ required by this constructor.


Consumers:

* GF.9 geometric containment: Converts the torsion problem into a bounded-gonality map to the quotient.
* GF.9 linear descent: Retains the actual intertwiner that removes a quadratic character.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/projective-frames`, `GeometricFreyMazur:GF.0/diagonal-quotient`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `ModularCurvesPartII:R13.4a`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `AbelianSchemesAndArithmeticModuli:A1/relative-elliptic-equivalence`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.


Source: BT16, §1, Theorems 1–3, pp. 710–711; §2.3, p. 715. The classifying map from actual torsion data is the source input; the statement here fixes the conventions needed by its consumers.


### The rank-one geometric Hom lattice

Target `GeometricFreyMazur:GF.9/nonisotrivial-hom-lattice` (application).

Let K=k(U) with k algebraically closed of characteristic zero. For a nonisotrivial elliptic curve E/K, End(E over an algebraic closure of K)=Z. If E′ is geometrically isogenous to E, then Hom(E,E′ over that algebraic closure) is a free rank-one Z-module. A primitive generator f has Galois conjugates σ(f)=χ(σ)f for a continuous character χ:G_K→{±1}. If some geometric isogeny has degree prime to p, then p∤deg f.


Proof/construction route:

1. Import finite generation and torsion-freeness of Hom and degree scaling. Once geometric End(E)=Z, choose any geometric isogeny h:E→E′. Composition g↦h∨∘g injects Hom(E,E′) into End(E): a homomorphism into the finite kernel of h∨ is zero because its source is connected. Its image contains the nonzero h∨h=[deg h], so this free Hom module has rank exactly one. No unproved rational-Hom-dimension assertion is imported.
2. Spread any extra endomorphism and its defining equations to a finite cover of a finite-type model. Over C its locally constant action on the lattice, together with the period description, forces a fixed imaginary-quadratic period and hence constant j. Nonconstancy survives the faithfully flat spread, giving the contradiction.
3. Galois acts on a free rank-one lattice by its two units. A generator and its negative are defined over a finite extension, so the character is continuous. If h=a f then deg h=a²deg f, which gives the prime-to-p assertion.


Acceptance: Constant-j CM curves are excluded: their geometric endomorphism ring need not be Z. The primitive generator need not be the particular cyclic isogeny furnished by a Hecke component.


Prerequisites: `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`, `ModularCurvesPartII:R12.1`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`.


Source: BT16, Descent needed for Theorem 1, pp. 710–711; rank-one lattice argument supplied here. The cited passage supplies the endpoint or motivating use; this target expands the additional bridge explicitly in the reader, using its named supplier interfaces. It is not attributed as a separately proved lemma of the article.


### Hecke containment gives a geometric prime-to-p isogeny

Target `GeometricFreyMazur:GF.9/geometric-prime-to-p-isogeny` (theorem).

If the classifying map f_Ψ is contained in H_m with p∤m, then E and E′ over the geometric generic point of U admit a cyclic degree-m isogeny. Consequently their primitive geometric Hom generator has degree prime to p. No isogeny over K is inferred from this coarse containment alone.


Proof/construction route:

1. The finite normalized cyclic correspondence surjects onto its image H_m. Lift a geometric generic point of the image to the correspondence and read its cyclic isogeny.
2. The lift may require a finite extension of K; this is why an additional descent argument is necessary. Apply the rank-one Hom lattice to replace the chosen isogeny by a primitive generator.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.9/actual-torsion-classifying-map`, `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.9/nonisotrivial-hom-lattice`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`, `ModularCurvesPartII:R14.1`.


Source: BT16, Hecke interpretation in §2.5, pp. 716–717; bridge from Theorem 3 to Theorem 1. The cited passage supplies the endpoint or motivating use; this target expands the additional bridge explicitly in the reader, using its named supplier interfaces. It is not attributed as a separately proved lemma of the article.


### Actual p-torsion removes the isogeny twist

Target `GeometricFreyMazur:GF.9/actual-linear-descent` (theorem).

Let K=k(U), p>3, E/K nonisotrivial, and Ψ:E[p]≃E′[p] an actual G_K-equivariant F_p-linear isomorphism. Assume the actual torsion image of E is SL₂(F_p) and that E,E′ admit a geometric isogeny of degree prime to p. Then a primitive geometric isogeny f:E→E′ is defined over K, so E and E′ are K-isogenous.


Proof/construction route:

1. Write σ(f)=χ(σ)f using the rank-one geometric Hom lattice. Since p∤deg f, f[p] is invertible. In bases identified by Ψ, the linear map A=Ψ⁻¹ f[p] satisfies Aρ(σ)=χ(σ)ρ(σ)A (the inverse character is the same character).
2. The actual intertwining equation makes χ trivial on ker ρ. It therefore factors through SL₂(F_p), whose perfectness makes it trivial. Thus every Galois element fixes f.
3. Use Galois descent for morphisms to descend f to K. Neither projective torsion data nor semisimplification alone yields the displayed invertible intertwiner.


Acceptance: For a generic nonisotrivial E over C(t), a nontrivial quadratic twist has the same projective p-torsion for odd p and is not C(t)-isogenous to E. Track domains in A=Ψ⁻¹ f[p]: it is an automorphism of E[p], so the no-self-twist lemma applies.


Prerequisites: `GeometricFreyMazur:GF.9/nonisotrivial-hom-lattice`, `GeometricFreyMazur:GF.9/geometric-prime-to-p-isogeny`, `GeometricFreyMazur:GF.8/no-quadratic-self-twist`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`, `AbelianSchemesAndArithmeticModuli:A6/quadratic-twists-and-restriction`.


Source: BT16, Theorem 1, pp. 710–711; explicit linear descent supplied here. The cited passage supplies the endpoint or motivating use; this target expands the additional bridge explicitly in the reader, using its named supplier interfaces. It is not attributed as a separately proved lemma of the article.


### Extend the generic isogeny over the original open curve

Target `GeometricFreyMazur:GF.9/extend-isogeny-over-base` (theorem).

For elliptic schemes E,E′ over a smooth connected characteristic-zero curve U, every isogeny of their generic fibres extends uniquely to an isogeny E→E′ over U. The extension is a finite locally free surjective group morphism. This asserts an isogeny over U, not merely over a finite cover or an extension of its function field.


Proof/construction route:

1. A smooth curve is a Dedekind base. By the imported Néron mapping property, the good-reduction abelian schemes E and E′ are their generic fibres’ Néron models; extend the isogeny and its dual.
2. Extend the two identities involving multiplication by its degree using uniqueness on the generic fibre. The kernel lies in the finite étale degree-torsion because the characteristic is zero.
3. Use the abelian-scheme finite-kernel/isogeny criterion to obtain finite local freeness and surjectivity, preserving group structure by uniqueness.


Acceptance: A rational map between arbitrary proper models does not suffice; the group-scheme/Néron property is the precise input. Removing more points of U commutes with the unique extension.


Prerequisites: `NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model`, `NeronModelsAndSemistableAbelianVarieties:R11.1/extend`, `AbelianSchemesAndArithmeticModuli:A1/relative-elliptic-equivalence`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.


Source: BLR90, BLR90, §1.2 Proposition 8 and proof, p. 15; §1.4 Proposition 2, p. 19. Extend the generic isogeny over the original open curve is the source input; the statement here fixes the conventions needed by its consumers.


### Uniform rigidity and monodromy over any characteristic-zero k

Target `GeometricFreyMazur:GF.9/characteristic-zero-spread` (theorem).

The geometric-rigidity threshold M_N^geom works unchanged for every algebraically closed characteristic-zero field k. Full actual p-torsion monodromy for a nonisotrivial elliptic scheme on U/k also holds for p>max(5,800N/7) when gon(U)<N. The quantifiers are uniform in k, U and the families; no embedding of all of k into C is required.


Proof/construction route:

1. Descend the proper base, open subset, map to Z(p), a degree-n pencil with n<N, and any finite étale torsion data to one finitely generated subfield k₀⊂k. Preserve smoothness, nonconstant j and nonconstancy of the map after enlarging k₀.
2. Embed k₀ in C and apply the complex theorem after algebraic closure. Containment in a particular closed Hecke locus H_m is equality of a pulled-back ideal with zero, hence descends by faithful flatness to the model over an algebraic closure of k₀ and then extends to k. Only the model field, rather than k itself, is embedded.
3. For full monodromy use invariance of the geometric finite étale fundamental group under algebraically closed characteristic-zero extension, or equivalently connectedness of each finite frame torsor. Gonality ≤n is supplied by the descended pencil; its exact minimum need not be preserved for this step.
4. After the closed Hecke containment descends, lift its geometric generic point through the finite cyclic correspondence over k itself. This supplies the geometric isogeny without a separate assertion that arbitrary analytic Hom maps descend.


Acceptance: A field k of cardinality greater than C is permitted; only a finitely generated field is embedded. Spread the pencil and the actual isomorphism, rather than merely a numerical claim about gonality or semisimplified representations.


Prerequisites: `GeometricFreyMazur:GF.7/complex-geometric-rigidity`, `GeometricFreyMazur:GF.8/full-linear-monodromy`, `GeometricFreyMazur:GF.9/actual-torsion-classifying-map`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`, `HyperbolicCurveVolumesAndGonality:HV.6/base-change`, `ModularCurvesPartII:R14.1`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.


Source: BT16, Extension of Theorems 1–3, pp. 710–711, by finite-type spread and geometric base change. The cited passage supplies the endpoint or motivating use; this target expands the additional bridge explicitly in the reader, using its named supplier interfaces. It is not attributed as a separately proved lemma of the article.


### Geometric Frey–Mazur over the original base

Target `GeometricFreyMazur:GF.9/geometric-frey-mazur` (theorem).

For every integer N>0 there exists M_N such that, for every algebraically closed characteristic-zero field k, prime p>M_N, smooth connected quasiprojective k-curve U with gon(U)<N, and nonisotrivial elliptic schemes E,E′/U, an actual isomorphism E[p]≃E′[p] of finite étale F_p-module schemes implies an isogeny E→E′ over U. One may take M_N larger than M_N^geom, 5 and 800N/7. There is no claimed explicit numerical final threshold.


Proof/construction route:

1. Form the nonconstant classifying map, extend it to the smooth proper base and apply uniform geometric rigidity. The image lies on H_m for some p∤m, giving a geometric prime-to-p isogeny.
2. Apply the uniform full-linear-monodromy bound and actual-linear descent to obtain a K=k(U) isogeny.
3. Extend uniquely over the original U using the good-reduction Néron models. All thresholds depend only on N.


Acceptance: The output is defined over U, without a finite étale replacement of the base. The theorem assumes actual F_p-local systems and both families are nonisotrivial; it makes no assertion in positive characteristic or over Q at p>17.


Prerequisites: `GeometricFreyMazur:GF.9/actual-torsion-classifying-map`, `GeometricFreyMazur:GF.9/characteristic-zero-spread`, `GeometricFreyMazur:GF.9/geometric-prime-to-p-isogeny`, `GeometricFreyMazur:GF.9/actual-linear-descent`, `GeometricFreyMazur:GF.9/extend-isogeny-over-base`.


Source: BT16, Theorem 1, p. 710, in the isogeny-over-U formulation. Geometric Frey–Mazur over the original base is the source input; the statement here fixes the conventions needed by its consumers.


### Equivalent geometric function-field formulation

Target `GeometricFreyMazur:GF.9/function-field-form` (theorem).

Equivalently, for every N>0 there is M_N such that for K=k(B), k algebraically closed of characteristic zero, B a smooth proper connected curve of gonality <N, and nonisotrivial elliptic curves E,E′/K, an actual G_K-equivariant F_p-linear isomorphism E[p]≃E′[p] for prime p>M_N implies a K-isogeny. Restricting to a common good-reduction open and extending its finite étale torsion data gives the family statement; taking generic fibres gives the converse.


Proof/construction route:

1. An elliptic curve and a morphism of finite étale torsion group schemes spread over a common nonempty good-reduction open. Shrink finitely many points to make the two inverse torsion morphisms defined.
2. The smooth proper model and hence gonality do not change under restriction to this open. Apply the family theorem and pass to the generic fibre.
3. Conversely the function-field theorem followed by the extension theorem yields the original-base assertion.


Acceptance: Ramification at the finitely many omitted bad-reduction points is allowed in the G_K representation. No equality of semisimplified Galois representations is substituted for the actual isomorphism.


Prerequisites: `GeometricFreyMazur:GF.9/geometric-frey-mazur`, `GeometricFreyMazur:GF.9/extend-isogeny-over-base`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `AbelianSchemesAndArithmeticModuli:A1/relative-elliptic-equivalence`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.


Source: BT16, Theorem 2, p. 710, and the family/function-field dictionary. Equivalent geometric function-field formulation is the source input; the statement here fixes the conventions needed by its consumers.


## GF.10: Bounded-genus and minimal-model consequences


### Bounded-genus rigidity with an enlarged threshold

Target `GeometricFreyMazur:GF.10/bounded-genus` (theorem).

For each integer N>0 there exists P_N such that every map from a smooth connected curve whose proper model has genus g<N to Z(p), for prime p>P_N, has image either a point or a Hecke curve. One may choose P_N=M_(N+1)^geom, using gon(B)≤g+1≤N<N+1. The same enlargement gives the actual-torsion isogeny theorem for nonisotrivial families on those bases.


Proof/construction route:

1. Import the Riemann–Roch gonality bound; no new Riemann–Roch theory is planned here.
2. Handle constant maps separately and apply geometric rigidity to a nonconstant map. Apply the family theorem to the torsion consequence.


Acceptance: The strict gonality inequality is met by N+1, even when gon(B)=N.


Prerequisites: `GeometricFreyMazur:GF.7/complex-geometric-rigidity`, `GeometricFreyMazur:GF.9/geometric-frey-mazur`, `HyperbolicCurveVolumesAndGonality:HV.6/riemann-roch-bound`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`.


Source: BT16, Corollary 30, p. 742; Theorem 3, p. 710. Bounded-genus rigidity with an enlarged threshold is the source input; the statement here fixes the conventions needed by its consumers.


### Rational and elliptic curves are Hecke

Target `GeometricFreyMazur:GF.10/rational-elliptic-curves` (theorem).

For every sufficiently large prime p, every integral curve on Z(p) whose normalization has genus zero or one is a Hecke curve. A common threshold is M_3^geom: a rational normalization has gonality 1 and a genus-one normalization over an algebraically closed field has gonality 2.


Proof/construction route:

1. Apply the imported genus-zero and genus-one pencil bounds to the normalization of the curve.
2. The normalization map is nonconstant, so geometric rigidity places its image in an irreducible component of a Hecke locus. Equal dimensions give equality of integral curves.


Acceptance: A singular rational curve is tested by its normalization, not its arithmetic genus. A constant map from an elliptic curve does not produce an integral elliptic image curve.


Prerequisites: `GeometricFreyMazur:GF.7/complex-geometric-rigidity`, `HyperbolicCurveVolumesAndGonality:HV.6/small-gonality`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.


Source: BT16, Corollary 31, p. 742. Rational and elliptic curves are Hecke is the source input; the statement here fixes the conventions needed by its consumers.


### The resolution and its known curve set

Target `GeometricFreyMazur:GF.10/quotient-resolution` (construction).

Resolve the isolated cyclic quotient singularities of a determinant component of Z(p). At a CM or singular-bicusp point the local action is 1/n(1,a), n∈{2,3,p}, gcd(a,n)=1, with a determined by the tangent characters; import its Hirzebruch–Jung resolution. On the resulting smooth projective surface Z̃(p), define the known curves to be all exceptional components and all strict transforms of Hecke curves. The resolution is an application of the owning surface interface, not a new general resolution theory.


Proof/construction route:

1. Read the stabilizer characters from the exact branch-locus theorem. Nonidentity inertia fixes neither individual tangent direction, so both weights are units modulo n.
2. Apply the supplied cyclic-quotient resolution and intersection formulas. Its exceptional chains are rational curves; take strict transforms of each Hecke curve using proper birational transforms.
3. The construction is algebraic in characteristic zero and commutes with the supplied base changes; the metric is not part of the surface carrier.


API:

* `TauCeti.GeometricFreyMazur.quotientResolution_morphism` (data): A projective birational morphism Z̃→Z is an isomorphism off the finite singular set.
* `TauCeti.GeometricFreyMazur.quotientResolution_localType` (characterisation): Local characters give exactly 1/n(1,a) with n=2,3,p and gcd(a,n)=1.
* `TauCeti.GeometricFreyMazur.quotientResolution_exceptional` (data): The exceptional fibre has the supplied rational chain and continued-fraction intersection matrix.
* `TauCeti.GeometricFreyMazur.knownCurve_mem` (characterisation): Known means an exceptional component or the strict transform of a Hecke component.
* `TauCeti.GeometricFreyMazur.knownCurve_pushforward` (relation): A nonexceptional known curve maps to its Hecke curve with the same normalization function field.
* `TauCeti.GeometricFreyMazur.knownCurve_baseChange` (functoriality): The chosen algebraic resolution, strict transforms and their intersection data transport along the permitted characteristic-zero algebraically closed extensions.


Checks:

* `TauCeti.GeometricFreyMazur.quotient_resolution_test1`: A 1/2(1,1) point resolves to one rational curve of self-intersection −2, rather than −1.
* `TauCeti.GeometricFreyMazur.quotient_resolution_test2`: An exceptional component maps to a point, so it is not a strict transform of a Hecke curve.
* `TauCeti.GeometricFreyMazur.quotient_resolution_test3`: The strict transform of a singular Hecke curve has the same normalization genus even when its arithmetic genus changes.


Consumers:

* GF.10 known rational curves: Separates curves contracted by the resolution from curves whose images are Hecke.
* GF.10 contractions: Supplies the complete set in which each contraction centre must lie.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.0/quotient-branch-locus`, `GeometricFreyMazur:GF.0/hecke-loci`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`.


Source: BT16, §7, pp. 742–743; resolution/contraction discussion, using the named surface supplier. The resolution and its known curve set is the source input; the statement here fixes the conventions needed by its consumers.


### Every rational curve on the resolution is known

Target `GeometricFreyMazur:GF.10/known-rational-curves` (theorem).

For prime p>M_3^geom, every integral rational curve on Z̃(p) is either an exceptional component or the strict transform of a Hecke curve. In particular every initial (−1)-curve belongs to the known set.


Proof/construction route:

1. If the curve is not exceptional, its image in Z(p) is an integral curve with the same normalization function field. Its normalization is rational.
2. Apply the rational-curve consequence and take the unique strict transform. Exceptional fibres contain exactly the listed irreducible components.


Acceptance: Check the stated hypotheses and constants; preserve component and map-degree conventions in every use.


Prerequisites: `GeometricFreyMazur:GF.10/quotient-resolution`, `GeometricFreyMazur:GF.10/rational-elliptic-curves`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `SchemeAndStackFoundations:SF.4`.


Source: BT16, Corollaries 30–32, p. 742. Every rational curve on the resolution is known is the source input; the statement here fixes the conventions needed by its consumers.


### A minimal model obtained by contracting known curves

Target `GeometricFreyMazur:GF.10/known-curve-minimal-model` (theorem).

For every sufficiently large prime p, a smooth minimal model of each component of Z(p) can be obtained from Z̃(p) by finitely many contractions of smooth rational (−1)-curves. At every step, the contracted curve is the image of a known rational curve on the original resolution. Thus the required contractions are supported on the known Hecke and exceptional curves. The assertion does not identify every Hecke curve as contractible and does not say each subsequent centre was a (−1)-curve on the original surface.


Proof/construction route:

1. Import Castelnuovo contraction and termination by strict decrease of the Picard number, from the proposed surface-contraction extension. If no (−1)-curve remains, this is the surface-minimality conclusion.
2. Under the inverse sequence of blowups, the strict transform of each subsequent contracted smooth rational curve is still an integral rational curve on the original resolution. Apply the classification of known rational curves there.
3. Record intersection numbers after each contraction using the supplied formula. Existence of some smooth minimal model is enough; no general-type classification or uniqueness theorem is used.


Acceptance: A curve of self-intersection −2 is not contractible to a smooth point by the (−1)-curve theorem. A subsequent (−1)-curve may have self-intersection below −1 on Z̃; update intersections after each preceding contraction.


Prerequisites: `GeometricFreyMazur:GF.10/known-rational-curves`, `GeometricFreyMazur:GF.10/quotient-resolution`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`.


Source: BT16, Corollary 32 and proof, p. 742; explicit contraction supplier. A minimal model obtained by contracting known curves is the source input; the statement here fixes the conventions needed by its consumers.


## Detailed arguments and numerical checks

### A compact-nontrivial upper systolic witness

The trace congruence alone gives a lower bound. It does not show that a chosen congruence-group word survives filling the cusps. In fact U(p)L(−p), the matrix used in the published Lemma 5 proof (page 718), is a product of peripheral elements and is killed by filling. The following replacement supplies the upper bound that is also used in the compact lower-bound argument.

Put U(t)=[[1,t],[0,1]], L(t)=[[1,0],[t,1]], and write p=3r+x, x∈{1,2}. Define

M_p=[[1+xp,3p],[p(2−x²+2px)/3,1+2p²−xp]].

The lower-left entry is integral: for x=1 its parenthesis is 1+2p, and for x=2 it is −2+4p, both divisible by 3 in their respective residue classes. Direct multiplication gives det M_p=1, M_p≡I mod p, and tr M_p=2p²+2. The exact factorizations are

* x=1: M_p=−L(2r)U(3)L(−r−1)U(3);
* x=2: M_p=L(2r+1)U(−3)L(−r−1)U(1)L(1)U(1).

For p>6 set θ=π/p, c=cos θ, b=(1+√(1−4sin²θ))/2,

U_p=[[c,b],[b−1,c]], L_p=[[c,b−1],[b,c]], S=[[0,−1],[1,0]].

Both deformation matrices have determinant one. The identities S²=−I, tr(SU_p)=1 and tr U_p=2cos θ give the marked projective orders 2,3,p. Their fixed vertices form the hyperbolic triangle with those angles; its faithful marked representation identifies the deformation with the compact triangle quotient. Moreover L_p=S U_p⁻¹S⁻¹. The elliptic power identity gives

L_p^a=cos(aθ)I+[sin(aθ)/sin θ](L_p−cI).

For a=2r or 2r+1, and a′=−r−1, division by p gives respectively +αN and −αN, with bounded remainder before division, where N=[[0,0],[1,0]] and α=√3/(2π). Fixed powers of U_p,L_p tend to the corresponding integer unipotent powers. In the first word the leading trace is α²tr(NU(3)NU(3))=9α². In the second it is −α²tr(NU(−3)N U(1)L(1)U(1))=9α²: the last fixed word is [[2,3],[1,2]]. Thus in both classes

tr γ_p(M_p)=(27/(4π²))p²+O(p).

The coefficient is positive. For all sufficiently large p this is hyperbolic and nonidentity after filling. The formula ℓ=2arcosh(|tr|/2) gives compact length 4log p+O(1); the ordinary integral trace gives the same cusped length. For example the integer matrices at p=7 and 11 are [[8,21],[35,92]] and [[23,33],[154,221]], with determinants one and traces 100 and 244. These are arithmetic checks, not explicit universal thresholds for the asymptotic assertion.

### Compact lower bound without a one-cusp assumption

Take a shortest compact geodesic of length L≤4log p+C. Lemma 6's embedded cusp stars give disjoint outer discs of radius R_b=(log p)/2 for large p; use inner radius R_s=(log p)/4. A connected visit to an outer disc reaching its inner disc has length at least 2(R_b−R_s). Consequently there are a bounded number of deep **visits**, including repeated visits to the same cusp. The geodesic cannot be wholly inside one of these embedded discs.

On all other portions the distance to every cusp is at least R_s, and the length error from the compact/cusped comparison is O(e^(−R_s)L)=o(1). Inside a deep visit, the embedded-disc lift is an ordinary hyperbolic geodesic. With arclength s measured from its closest point to the centre,

cosh r(s)=cosh(r_min)cosh s, hence r(s)≥|s|.

On r≥1 the extra length density coth(r/2)−1 has a uniform integrable bound: it is bounded near |s|≤1 and decays exponentially for |s|>1. If r_min<1, replace the portion in the unit disc by a unit-circle arc of bounded length; the cusped comparison on that circle gives a bounded cusped length as well. This replacement is homotopic in the filled disc. The bounded number of visits therefore produces a loop in Y(p) with cusped length ≤L+O(1), whose filled class remains the original nontrivial class. It is neither contractible nor peripheral in Y(p). For M≡I mod p, determinant one gives tr M≡2 mod p², so any hyperbolic representative has length at least 4log p−O(1). Apply this to the new loop and divide by two to obtain ρ_X=2log p+O(1).

### Reconstruction keeps the determinant sign

For p>3, uniqueness of an invertible projective solution forces rank three: on any projective line of matrices a nonzero determinant quadratic has at most two zeros, and so at least p−1 invertible points. Use three independent equations in four matrix entries. A cofactor vector for a nonzero rank-three minor has integral entries bounded by a fixed power of the coefficient bound. Choose δ so that every relevant fixed-degree minor is o(p); a minor nonzero modulo p then gives the same rational rank. The cofactor reduction is the unique invertible projective solution. Removing the integer gcd preserves its projective reduction, so its determinant is nonzero and prime to p. It does **not** give a sign. In the CM⁺ application the centralizer is a definite quadratic algebra and its determinant norm is positive. There is no such reason in the general cusp or overlap application.

For positive determinant, a primitive integral two-by-two matrix has Smith invariants (1,m) and gives a cyclic lattice isogeny of degree m. For negative determinant, factor through R=diag(1,−1); the remaining matrix has positive determinant |m| and gives a cyclic map to the conjugate complex structure. The boundary version must retain the p-gon toric and component maps, not just the induced map on the projective line of inertia groups. Those are supplied by R13.3. This yields ordinary or conjugate Hecke incidence with the same polynomial height cost.

Here is a concrete check on the sign in Proposition 17 (pages 727–728). Let p≡1 mod4, choose a∈F_p with a²=−1 and write c for the standard cusp. Cusps on a selected Γ(p) component are nonzero vectors v∈F_p² modulo ±1. Their inertia depends only on the line F_pv. Let γ be the deck transformation represented by aR∈SL₂(F_p), and let r(z)=−conj(z) be the marked reflection fixing i. For any of three fixed matrices M_j∈SL₂(Z) whose first columns give the distinct lines ∞,0,1, the pair

(r(M_jc), γ(M_jc))

has cusp labels (v_j,av_j), v_j=R M_j e₁. Its two inertia groups coincide, so it belongs to SBC. The first cusp has distance log p+O(1) from i, since it is (R M_j R)c; the second has the same estimate from γi. Thus the three distinct pairs are within (1/2+δ)ρ_X of (i,γi) for every fixed δ>0 and large p. Scalar normalization of the conjugated full frame makes these pairs lie on the conjugate index-one locus.

To test ordinary Hecke incidence, write the positive toric and component factors of a cyclic boundary isogeny as u,v with uv=m. After normalizing its Weil multiplier to the fixed pairing, the square of the scalar ratio of the two cusp labels is v/u (or its inverse under the opposite framing convention). This follows directly by normalizing the toric factor u by a scalar λ with λ²m=1. For our ratio a, either convention forces u+v≡0 mod p. As u,v are positive and prime to p, u+v≥p, and uv≥u+v−1≥p−1. These pairs lie on no ordinary T_m with m<p−1. A bound m=O(p^(Aδ)) for arbitrarily small fixed δ cannot hold in the ordinary-only conclusion. The signed conclusion passes the test with |det R|=1.

### Multiplicity estimates with independent scales

Put d=p^δ₁. Heegner-only repulsion and its conjugate transport give disjoint balls off the corresponding small-locus union, costing p^(−2δ₂). On each ordinary small locus, Hecke pull-push converts multiplicity to a diagonal problem and the diagonal volume estimate gives p^(−1). On the conjugate locus, keep the curve complex, apply holomorphic Hecke pull-push and use the conjugate-diagonal relative estimate. Its direction is

V(ε)≤[sinh ε/sinh R] V(R), 0<ε<R<ρ_X/2.

Take R arbitrarily close to ρ_X/2. The factor for fixed ε is O(p^(−1)); the numerator and denominator are reversed in the erratum's page-3 displayed line. The Hecke degree sum is O(d³). Hence each CM sign is bounded by a constant times (p^(−2δ₂)+p^(3δ₁−1))Deg(C). Choose 3δ₁<1 and then the smaller repulsion scale δ₂.

For SBC, fix δ₃ independently and first. Off the union of ordinary **and conjugate** loci of index m<d, signed three-bicusp repulsion bounds the overlap of radius (1/2+δ₂)ρ_X balls by two. Point-volume gives p^(−1−2δ₂)Deg(C).

For a fixed signed small locus, holomorphic Hecke pull-push reduces to centres on the ordinary or conjugate diagonal. Write R₃=(1/2+δ₃)ρ_X. A multiple overlap of R₃-balls centred at two such bicusps lies within δ₃ρ_X+O(1) of that diagonal: in each coordinate the two cusp centres are separated by ρ_X−O(1), and the unique-lift midpoint-lens bound gives a lens of radius δ₃ρ_X+O(1). The two coordinate lens centres agree under the ordinary or conjugate identification. Cusp counting bounds the multiplicity of these overlaps by p^(Bδ₃) for a fixed B. The part of the balls with no other centre contributes at most total volume. The multiple-overlap part contributes at most

p^(Bδ₃) V(δ₃ρ_X+O(1)) ≪ p^(−1+(B+2)δ₃) vol(C).

Here use the cosh ratio for the ordinary diagonal and the sinh ratio for the conjugate diagonal; both have denominator of order p. Fix (B+2)δ₃<1, so the whole ball-volume sum is O(vol(C)). Multiplying by the point-volume factor p^(−1−2δ₃), by ψ(m) for pull-push and summing m<d gives p^(−1−2δ₃+3δ₁)Deg(C). Now choose 3δ₁<2δ₃, and finally a sufficiently small positive δ₂ for signed repulsion. This gives the required p-weighted decay. No intersection with a conjugate locus occurs in the argument.

### The big-diagonal bound: the needed hypothesis and the shell estimate

There is a direct obstruction to the unrestricted Proposition 27 (pages 737–740). On a selected component X let K=2g_X−2=(p²−1)(p−6)/12 and choose a very ample line bundle L of degree d. A general member D of |L⊠L| is smooth and connected, meets all the finitely many graphs Γ_g, g∈G₀, transversely, and avoids their pairwise intersections. Indeed distinct graphs meet in a finite set, and transversality and avoidance are open conditions on this sufficiently ample linear system. Each graph has intersection 2d with D. Embed

C={(x,x,y,y):(x,y)∈D}⊂T₁×T₁⊂S².

No Δ_g contains C. At each intersection its curve-point multiplicity along Δ_g is one, even though the two defining equalities restrict to the same equation on C. Therefore

Σ_g mult_(Δ_g)(C)=2d|G₀|, Deg(C)=4dK,

and their ratio is |G₀|/(2K)=3p/(p−6), which tends to three. Elements outside G₀ give no intersection on these chosen components. Both projected cycles of C are Hecke. The theorem needed below excludes exactly this failure: both projected cycles are nonconstant and non-Hecke.

For that theorem integrate the signed overlap dichotomy against C after the double-diagonal volume bound. Outside its two exceptional regions, overlap is O(log p), giving O(log p·p^(−δ))Deg(C). In the signed small-Hecke region the short-height count costs p^(Aδ). On the cusp complement the **cusped** metric makes a Hecke branch a local isometry; the compact metric comparison controls the paths, with the cusp balls enlarged first. Pull-push turns the signed tube into an ordinary or conjugate diagonal tube. The normalized volume ratio gives p^(−1+O(δ)); the projectionwise measure error is O(p^(−1)). Non-Hecke projected cycles rule out a diagonal component in the ordinary branch. No complex curve can be contained in the totally real conjugate branch. Weighted pushforward degrees, rather than degrees of reduced images, make all these estimates uniform in the parametrization.

For the bicusp region split the area form before counting: ω_C=π₁*ω_S+π₂*ω_S, and write C_i=(π_i)_*C with its full generic map degree. Let R₀=(1/2+A₀δ)ρ_X+O(1) be the radius given by the overlap dichotomy. The exponent constants in the next count depend on A₀ and the original tube radius, but not on the later enlargement constant B.

A fixed pair of projected bicusp centres (a₁,a₂), one in each slot, determines either no deck transformations or one coset of their common order-p stabilizer. To see this, fix one transformation carrying a₂ to a₁; the others differ by the stabilizer of a₂. That stabilizer has order p, since either cusp coordinate has exactly this inertia. In either projection the short-displacement conditions, after comparison with the fixed representative, give the exact rotation inequality

sinh(distance(z,σ^kz)/2)=sinh d·|sin(πk/p)|.

Choose the farther of the two coordinates in that projected surface, so d=d_S(z_i,a_i). The count is O(min(p,1+p sinh(O(δρ_X))/sinh d)). For d≤R₀ this is bounded by Cp^(1+A₁δ)exp(−d), including d<1 and the additive one. The source and target versions follow by taking inverses. The ball lifts uniquely for these comparisons: R₀+O(δρ_X)<ρ_X for small δ, and a second short lift would violate the compact injectivity-radius bound.

For fixed i and a_i, the other projected centres lie in a radius-R₀ ball and number at most p^(A₂δ), by the cusp-ball count applied to both coordinates. Sum over them, deliberately discarding their remaining conditions. If M_cusp(z₁,z₂) counts only transformations in the cusp branch, then, for each i=1,2,

M_cusp(z₁,z₂) ≤ Cp^(1+Aδ) Σ_(a∈SBC, d(z_i,a)<R₀) exp(−d(z_i,a)).

The bound is valid separately for each i, so integrating its i-th version against π_i*ω_S and then adding gives the following estimate for the entire cusp-overlap integral E:

E ≤ Cp^(1+Aδ) Σ_i Σ_(a∈SBC) Σ_(0≤ℓ≤R₀+1) exp(−ℓ) vol(C_i∩B(a,ℓ+1)).

This step is why weighted projected cycles are needed. It never compares the area coming from the second projection with a volume measured only in the first projection.

Now choose B once so that 2B>A+1 and R_*=(1/2+Bδ)ρ_X exceeds R₀+3 for large p. The relative point-ball theorem proved next yields

E ≤ Cp^(1+Aδ) exp(−R_*) (log p)² Σ_i Σ_a vol(C_i∩B(a,R_*)).

Here the linear factor in the point-ball estimate and the number of unit shells account for the square of the logarithm. The ℓ=0 term uses the radius-one case.

It remains to control this sum on each **single surface** S. Let N(z) count its radius-R_* bicusp balls. On N≤2, charge at most 2vol(C_i) once globally. On N≥3, the strengthened signed reconstruction places z in the O(Bδρ_X) tube of one ordinary or conjugate T_m, m≤p^(A₃Bδ), and on the complement of all cusp balls of radius (1/2−A₃Bδ)ρ_X. Here are the two additional outputs of the reconstruction that justify this use.

First, each factor has at least two distinct nearby cusps. Otherwise two different bicusps would have a repeated first cusp and two nearby second cusps with the same inertia; the small-height cusp-normalizer argument would make those second cusps equal. Interchanging factors gives the other case. For any cusp c, choose a nearby cusp different from c. Cusp separation and the triangle inequality give d(z_j,c)≥ρ_X−R_*−O(1). Thus both factors are on the required cusp complement.

Second, the two-cusp lens puts each factor within O(Bδρ_X) of a marked order-two vertex. Move these vertices to (ι,gι). The three independent cusp equations already give a primitive matrix Q representing g projectively, with height p^(O(Bδ)). For positive determinant, its Smith form and the hyperbolic height-distance bound place (ι,gι) within O(log h(Q)) of the corresponding holomorphic T_m. Equivalently compare i and the rational Möbius image Q·i in the cusped half-plane and use h_X≤h_Y. For negative determinant compose with the fixed reflection, which fixes i; the same argument gives the conjugate locus. This is the same signed small-matrix distance calculation used in the overlap dichotomy. Adding back the displacement to the two marked vertices gives the asserted thin tube.

The cusp count bounds N(z) by p^(O(Bδ)). Apply the Hecke-tube comparison only on that cusp complement. Holomorphic pull-push followed by cosh or sinh relative-volume normalization gives p^(−1+O(Bδ)), including its cusped-volume error. Sum ψ(m) over m≤p^(A₃Bδ). With a fixed A₄ incorporating these costs, the metric enlargement and cusp count,

Σ_a vol(C_i∩B(a,R_*)) ≤ [2+Cp^(−1+A₄Bδ)]vol(C_i).

Only the region N≥3 is counted separately for each m. Charging the region N≤2 for every m would lose this bound. The ordinary branch requires that C_i have no Hecke component; the conjugate locus is totally real. This argument neither lifts different centres through unrelated Hecke branches nor treats product-ball overlaps as single-surface overlaps. Three distinct centres in SBC×SBC need not have three distinct first or second projections.

Finally fix δ>0 so small that A₄Bδ<1/2 and all lift, height and repulsion lemmas apply. The bound ρ_X=2log p+O(1) gives

E ≤ Cp^((A−2B)δ)(log p)² vol(C) = O(p^(−cδ)Deg(C))

for a fixed c>0, reduced if necessary to absorb the logarithm. B was chosen before δ and p, and A came only from R₀, so this is a consistent order of choices. Combining this with the ordinary overlap and signed small-Hecke terms, and dividing by the double-diagonal volume factor, proves the required positive decay exponent. This projectionwise argument supplies the missing overlap bridge in Proposition 27, page 740, without an assertion that two enlarged product balls are disjoint.

### Relative volumes of point balls: a separate analytic input

For the shell argument request the following theorem from HyperbolicCurveVolumesAndGonality HV.4. Let C be a closed effective analytic one-cycle in Dⁿ, with the sum curvature −1 area form ω and the maximum product distance. Write V(t)=vol(C∩B∞(0,t)). There is a constant C_n, depending only on n, such that

V(r) ≤ C_n(1+r) exp(r−R) V(R),  1≤r≤R−2.

For a compact product quotient use the theorem after lifting a ball with R<ρ_X. No assumption that the centre belongs to C is needed. This is a new argument for the point-ball step of Bakker–Tsimerman Proposition 27, page 739. Their Proposition 23, page 735, is a diagonal-tube statement; it does not directly state this theorem.

Here is the derivation in the normalized-curve current convention dᶜ=i(∂̄−∂)/(4π). On the normalization, with every branch and cycle weight retained, put

u=log max_i|z_i|²,  s_t=log tanh²(t/2),  Ω_s={u<s},

h(s)=−log(1−exp(s)),  v=Σ_i −log(1−|z_i|²),  N(s)=∫_(Ω_s)ddᶜu.

The function u is subharmonic and has only logarithmic poles at the preimages of zero. The function v is smooth and nonnegative, ω=4πddᶜv, and 0≤v≤nh(s) on Ω_s. The positive measure ddᶜu makes N nondecreasing. Choose regular levels away from the critical values and the corners of the max decomposition; integrate over its piecewise smooth boundary. For a regular b<0, Green's identity gives

∫_(Ω_b)(b−u)ddᶜv + ∫_(Ω_b)v ddᶜu = ∫_(u=b)v dᶜu ≤ n h(b) N(b).

The pole boundary terms vanish because v tends to zero there; u has a logarithmic pole and v vanishes at least quadratically in a local parameter. The interior max interfaces are included in the positive measure ddᶜu, so discarding the second integral has the stated direction. For a<b this proves

V(t_a)/(4π) ≤ n h(b)N(b)/(b−a),  where s_(t_a)=a.

Take a=s_r and b=s_(r+1), using limits if necessary. The bounds h(s_(r+1))=2log cosh((r+1)/2)≤r+1 and s_(r+1)−s_r≥c exp(−r) give

V(r)/(4π) ≤ C n(1+r) exp(r) N(s_(r+1)).

For the reverse comparison at R, partition into the regions where one coordinate realizes the maximum. There u=log|z_j|² is harmonic off zero, and its coordinate area is exactly 4πh″(u)du∧dᶜu. All other coordinate areas are nonnegative. The interfaces have area zero unless two active coordinate functions agree identically, in which case choose either and their differentials agree. Coarea and the boundary-flux identity therefore give

V(R)/(4π) ≥ ∫_(-∞)^(s_R) h″(s)N(s) ds

≥ [h′(s_R)−h′(s_(R−1))] N(s_(R−1)) ≥ c exp(R)N(s_(R−1)).

The last inequality uses R≥3 and h′(s_t)=sinh²(t/2). Since r+1≤R−1 and N is nondecreasing, the two estimates prove the claimed bound. Piecewise smooth exhaustion, or smooth approximations of the maximum followed by monotone sublevel limits, proves the formulas at singular levels. Always take limits from below for open balls; a component with a constant active coordinate can give a plateau level. Properness of normalization over compact subsets justifies every exhaustion. Sum over branches and cycle coefficients to obtain the stated cycle version.

Checks for this theorem matter. A coordinate fibre through zero has V(t)=4πsinh²(t/2). Zero cycles and positive integer weights respect the estimate. A stronger assertion that V(t)/a(t) is increasing would be false: on the line (z,az), 0<a<1 real, the max ball is |z|<tanh(t/2) and, writing q=tanh²(t/2),

V(t)/a(t)=1+a²(1−q)/(1−a²q),

which decreases. Thus the theorem deliberately keeps its fixed constant and linear factor in r. The proof uses the existing HV.2 normalization/volume and HV.3 positivity, ddᶜ and Stokes machinery, with the explicit Green/coarea bridge requested in HV.4. It adds a theorem to that owner rather than another general analytic theory here. It also gives the point-multiplicity lower bound: N(s) is at least the multiplicity at zero, and integrating h″ from −∞ gives V(R)≥4πsinh²(R/2)mult₀C. Neither observation asserts that the supplier is already formalized.

### From the pencil to the Hurwitz contradiction

Normalize the image of the original curve first. For a finite map B→D between smooth proper curves, the images of a gonality pencil's fibre divisors are effective divisors of the same degree on D. Ratios are norms of rational functions, hence linearly equivalent. They vary: otherwise the fixed finite support would contain the images of every fibre of the surjective pencil. A nonconstant pencil in this linear system, after removing its fixed part, proves gon(D)≤gon(B). This is the precise domination input needed both here and in the monodromy argument.

For a birational map f:B→Z and a degree-n pencil h:B→P¹, finite flatness gives the cycle map P¹→SymⁿZ with ramified fibres carrying their full multiplicities. Distinct generic fibres give disjoint image points, so that map is generically injective. Normalize a dominating component of its pullback to Sⁿ. The wreath group W=Gⁿ⋊S_n permutes the components; the component stabilizer H has invariant function field k(P¹). Quotient after normalization gives α:C→P¹. The stabilizer action is made effective before local indices are computed.

Every coordinate projection of C maps to the original image curve in Z; since the generic pencil points are distinct and f is birational, none of its pair projections lies in a big diagonal. A non-Hecke image forces all single projections to be nonconstant non-Hecke cycles. For weighted projection cycles C_i and C_ij, canonical pullback gives Σ_iDeg(C_i)=Deg(C) and Σ_(i<j)Deg(C_ij)=(n−1)Deg(C).

The ambient wreath stabilizer exhausts ramification support. A nontrivial element with no permutation fixes a CM or SBC point in a slot. A moved slot produces equality with another slot through some g, hence a big diagonal. Normalization introduces no ramification over the free quotient locus. Effective local inertia on a smooth curve is cyclic, by the faithful tangent character. Raising its generator to n! kills the permutation, and each remaining coordinate order divides 2,3 or p. Thus the order divides 6n!p, with the factor p absent outside SBC. There is only one factor p, regardless of the number of cusp slots.

Charge local ramification to the corresponding weighted multiplicities. The four estimates give Ram(α)=o(Deg(C)) for fixed n. On the one hand,

2g(C)−2=−2deg α+Ram(α)≤o(Deg(C)).

On the other, if d is the largest of its 2n coordinate degrees and K=2g_X−2>0, then Deg(C)≤2ndK and the independent projection to X gives 2g(C)−2≥dK≥Deg(C)/(2n). These are incompatible for large p. The exact negative term in the first equality is retained; discarding it produces an inequality. This expansion does not claim that the independently rejected errata item E11 was an error: the source's compressed little-o notation can also be justified by squeezing.

### Actual linear monodromy and isogeny descent

Li–Yau with the finite-area modular metric, the effective orbifold area πD/3 and the imported λ′₁≥21/100 give gon(X_Γ)≥(21/100)D/24=7D/800. Here λ′₁=min(λ₁,1/4) includes the continuous-spectrum convention. This is an application of the imported results, not a new spectral theory.

For a proper H<SL₂(F_p), an index d<p would give an action on d letters killing every order-p transvection. Existing transvection generation makes the action trivial; its transitivity then forces H to be the whole group. Thus the index is at least p. Pulling subgroups back from PSL gives the same effective bound. If a nonisotrivial E/U has actual torsion image H, its frame torsor yields a nonconstant map to the subgroup modular curve, whose gonality is at most gon(U). The 7/800 estimate and the proper-index bound imply full effective image for p>800N/7. A proper lift of full PSL image would have index at most two in SL, also impossible. Weil pairing has constant determinant over the algebraically closed base. The actual image is therefore SL₂(F_p).

For the descent step let K=k(U). Nonisotriviality implies geometric End(E)=Z: an extra geometric endomorphism spreads to a finite-type model and a finite cover, and over C its locally constant lattice action forces the period to be a fixed imaginary-quadratic value. Then j is constant, contrary to the original nonconstancy, which survives faithfully flat base change. For a geometric isogeny h:E→E′, composition with h∨ injects Hom(E,E′) into End(E)=Z: its kernel would map the connected E into a finite group. The image contains h∨h=[deg h], so the imported free finite Hom module has rank one. Its primitive generator f satisfies σf=χ(σ)f for a continuous quadratic character χ. A prime-to-p isogeny from Hecke containment implies p∤deg f by degree scaling.

Let Ψ be the original actual torsion isomorphism. The invertible map A=Ψ⁻¹f[p] intertwines the full-image representation with its χ-twist. On ker ρ it forces χ=1, so χ factors through SL₂(F_p). Mathlib's existing perfectness theorem kills that character. Thus f is G_K-invariant and descends to K. Projectivizing the equation would erase χ and prove no such conclusion; a nontrivial quadratic twist of a nonisotrivial family gives precisely this projective ambiguity.

Since E and E′ are abelian schemes over the regular smooth curve U, the Néron mapping property extends f uniquely over U (BLR §1.2 Proposition 8, page 15; §1.4 Proposition 2, page 19). Extend its dual as well; their compositions remain multiplication by deg f because equality holds generically and the targets are separated. The kernel lies in the finite étale torsion scheme, the image contains multiplication-by-degree, and the resulting homomorphism is a finite surjective isogeny over U. The mapping property is applied on U, where both schemes have good reduction.

### Uniform passage to characteristic-zero fields and surface consequences

Spread the curve, its smooth proper model, pencil, families, the actual torsion isomorphism and its inverse to a finitely generated subfield k₀ of k. Embed k₀ into C; no embedding of all of k is assumed. The chosen pencil preserves the required gonality upper bound. Nonconstant j remains nonconstant. Over C the classifying map has image in one fixed H_m, p∤m. Vanishing of the pullback of that closed locus's ideal descends by faithful flatness, and is preserved on extension to k. The closed Hecke locus and its framed correspondence have their supplied characteristic-zero base-change structures. Geometric finite étale base change identifies the actual monodromy image; apply the full-image and Hom-lattice descent over k(U), then extend the isogeny on U. This avoids assuming arbitrary analytic isogenies descend without proof.

For genus g<N, Riemann–Roch gives gon≤g+1≤N, so use the gonality theorem at N+1. Rational curves have gonality one, and smooth genus-one curves over an algebraically closed field have gonality two; M₃ suffices for both. Resolve the quotient using its cyclic local charts of orders 2,3,p. The exceptional components are rational. Any rational curve on the resolution either is exceptional or maps to a rational curve of Z, hence to a Hecke curve. Castelnuovo contraction and decreasing Picard number give some smooth minimal model. Every contracted centre has a rational strict transform on the original resolution, so the exceptional/Hecke classification identifies its source. The strict transform may acquire self-intersection −1 only after earlier contractions; it is not assumed to have had self-intersection −1 initially. General type and uniqueness of the minimal model are not premises of this argument.

## Exact supplier contracts and ownership

The contracts below specify what an importing target uses beyond an existing exact node. They do not replace their owners' theories. ModularCurvesPartII's objects are imported unchanged. The proposed smooth-surface contraction extension belongs to Scheme and stack foundations, Part II; it has the contraction theorem, termination by Picard number, and the strict-transform/intersection update, with SF.4 and SF.5 as inputs.


### `HyperbolicCurveVolumesAndGonality:HV.4`

Relative point-ball volume comparison: for n≥1, a closed effective analytic one-cycle C in Dⁿ, the sum curvature −1 area, max-product balls about zero, and 1≤r≤R−2, prove V_C(r)≤C_n(1+r)exp(r−R)V_C(R), where C_n depends only on n. For a compact quotient require R<ρ_X and lift the ball. This is additional to the existing point-multiplicity lower bound, not a consequence of the diagonal-tube theorem. On the normalization put u=log max_i|z_i|², s_t=log tanh²(t/2), h(s)=−log(1−exp(s)), v=Σ_i h(log|z_i|²), and N(s)=∫_{u<s}dd^c u. Green identity gives ∫(b−u)dd^c v+∫v dd^c u=∫_{u=b}v d^c u, hence V(r)/(4π)≤n h(s_(r+1))N(s_(r+1))/(s_(r+1)−s_r). On each active-coordinate region, ω≥4π h″(u)du∧d^c u. Coarea gives V(R)/(4π)≥[h′(s_R)−h′(s_(R−1))]N(s_(R−1)). Monotonicity of N and elementary exponential bounds prove the assertion. Prove regular-level formulas first and pass to open sublevels by left limits, including cycle weights and branches. Checks: the coordinate fibre has V(t)=4π sinh²(t/2); zero cycles and weights behave additively; the line w=az, 0<a<1, shows V(t)/a(t) decreases and must not be specified as increasing. The detailed new proof in the reader needs independent review; ownership remains HV.4.

Used by: `GeometricFreyMazur:GF.5/big-diagonal-multiplicity`.


### `HyperbolicCurveVolumesAndGonality:HV.6`

For any nonconstant finite map of smooth proper connected algebraic curves B→D over an algebraically closed characteristic-zero field, gon(D)≤gon(B). Proof: push a pencil’s fibre divisors to D, use the norm of ratios for linear equivalence, show the family varies, remove base points and take a pencil of degree at most the original. Existing gonality nodes do not explicitly state this domination lemma.

Used by: `GeometricFreyMazur:GF.6/image-normalization`, `GeometricFreyMazur:GF.8/full-linear-monodromy`.


### `InverseGaloisAndArithmeticFundamentalGroups:IG.0`

For smooth finite-type connected curves over algebraically closed characteristic-zero fields, algebraically closed extension induces an equivalence on finite étale covers and identifies actual finite linear monodromy images up to chosen geometric base point and basis. This is the geometric base-change theorem, beyond the existing definition/Galois-equivalence nodes. Export compatibility with finite frame torsors and the field/scheme comparison; no general nonproper base-change assertion in characteristic p.

Used by: `GeometricFreyMazur:GF.9/characteristic-zero-spread`.


### `ModularCurvesPartII:R12.1`

The existing complex lattice/period uniformization of elliptic curves and full level, including isogeny-induced positive real Möbius correspondences and compatible tangent characters. The period equation is the input ruling out nonconstant-j CM families.

Used by: `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.3/hecke-avoids-anti`, `GeometricFreyMazur:GF.5/hecke-tube-comparison`, `GeometricFreyMazur:GF.9/nonisotrivial-hom-lattice`.


### `ModularCurvesPartII:R12.2`

The existing Γ(p) analytic quotient for full fixed-pairing level; effective PSL₂(F_p) deck action, elliptic inertia of orders 2 and 3, and comparison to subgroup modular quotients.

Used by: `GeometricFreyMazur:GF.0/projective-frames`, `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.0/quotient-branch-locus`, `GeometricFreyMazur:GF.2/short-elliptic-displacement`, `GeometricFreyMazur:GF.5/cusped-volume-error`, `GeometricFreyMazur:GF.8/full-linear-monodromy`.


### `ModularCurvesPartII:R12.3`

The existing cusp compactification comparison and local ramification p over the modular cusp, compatible with the algebraic compactification. No second compactified modular-curve object.

Used by: `GeometricFreyMazur:GF.1/triangle-uniformization`.


### `ModularCurvesPartII:R12.4`

Connectedness of the full-level fixed-pairing components and its twisted-form comparison, sufficient to identify exactly two projective determinant-square components.

Used by: `GeometricFreyMazur:GF.0/projective-frames`.


### `ModularCurvesPartII:R12.6`

Complex conjugation, pairing/determinant component transport and characteristic-zero descent/base change for the existing level curves and their maps.

Used by: `GeometricFreyMazur:GF.0/projective-frames`, `GeometricFreyMazur:GF.0/diagonal-quotient`, `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.3/conjugate-hecke`.


### `ModularCurvesPartII:R13.1`

The existing generalized elliptic n-gon and smooth locus G_m×Z/n, its inertia, automorphisms and level/pairing data; specialize to p- and pm-gons without redefinition.

Used by: `GeometricFreyMazur:GF.0/projective-frames`, `GeometricFreyMazur:GF.0/singular-bicusps`, `GeometricFreyMazur:GF.0/hecke-loci`.


### `ModularCurvesPartII:R13.2`

The existing compactified level moduli object, finite scalar quotient compatibility and properness over the j-line.

Used by: `GeometricFreyMazur:GF.0/projective-frames`.


### `ModularCurvesPartII:R13.3`

Tate and boundary charts, the correct p-/pm-gon component groups, finite inertia and the maps used to extend cyclic Hecke correspondences through cusps.

Used by: `GeometricFreyMazur:GF.0/singular-bicusps`, `GeometricFreyMazur:GF.0/quotient-branch-locus`, `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.1/cusp-coordinates`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.3/conjugate-hecke`, `GeometricFreyMazur:GF.5/cusped-volume-error`.


### `ModularCurvesPartII:R13.4a`

The existing projective coarse modular curve/surface comparisons and classifying maps. Quotienting projective frames leaves [-1] inertia; a fine universal family is not inferred.

Used by: `GeometricFreyMazur:GF.0/projective-frames`, `GeometricFreyMazur:GF.0/diagonal-quotient`, `GeometricFreyMazur:GF.9/actual-torsion-classifying-map`.


### `ModularCurvesPartII:R13.4b`

The existing generic compactification/uniformization comparison identifying the filled orbifold-cover quotient with the supplied algebraic X(p).

Used by: `GeometricFreyMazur:GF.1/triangle-uniformization`.


### `ModularCurvesPartII:R14.1`

The existing normalized cyclic prime-to-p isogeny correspondence, its two finite projections, boundary extension and base change. Export the cyclic degree ψ(m), not σ₁(m), and its projection formula. This roadmap adds only proof-specific restrictions and estimates.

Used by: `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.3/small-height-reconstruction`, `GeometricFreyMazur:GF.9/geometric-prime-to-p-isogeny`, `GeometricFreyMazur:GF.9/characteristic-zero-spread`.


### `SchemeAndStackFoundations:SF.1`

Finite quotients of normal projective characteristic-zero varieties by a finite group: existence as a projective scheme, orbit fibres, quotient universal property, invariant norm polarization, finite map, étaleness on the free locus and characteristic-zero base change. Include S_n quotients of projective surfaces and the relative cycle/norm morphism for finite flat degree-n families. Existing SF.1 nodes provide algebraic spaces, not this complete projective quotient/cycle theorem.

Used by: `GeometricFreyMazur:GF.0/diagonal-quotient`, `GeometricFreyMazur:GF.6/surface-symmetric-power`, `GeometricFreyMazur:GF.6/pencil-cycle-map`, `GeometricFreyMazur:GF.6/normalized-pullback`.


### `SchemeAndStackFoundations:SF.4`

In the named setting of projective characteristic-zero surfaces: resolve cyclic quotient charts 1/n(1,a), with Hirzebruch–Jung chains, rational exceptional components and strict transforms; provide Castelnuovo contraction of smooth rational (−1)-curves to smooth projective surfaces and termination by decreasing Picard number. Also supply smooth connected sufficiently ample surface sections for the Proposition27 check. These are precise requests to the existing birational-geometry stage, with a dedicated surface-contraction Part II proposed in restructure; no existing node is claimed to supply them.

Used by: `GeometricFreyMazur:GF.10/quotient-resolution`, `GeometricFreyMazur:GF.10/known-rational-curves`, `GeometricFreyMazur:GF.10/known-curve-minimal-model`.


### `SchemeAndStackFoundations:SF.5`

Intersection degree, finite flat pullback and proper cycle pushforward with generic-degree multiplicities, projection formula, canonical products; self-intersection of quotient-resolution chains and the update C_new²=C_old²+(C_old·E)² under contraction of a smooth rational (−1)-curve. The contraction theorem itself is a separately proposed extension.

Used by: `GeometricFreyMazur:GF.0/hecke-loci`, `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.10/quotient-resolution`, `GeometricFreyMazur:GF.10/known-curve-minimal-model`.


### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`

Smooth proper models of one-variable function fields over an algebraically closed field, finite normalization, extension/factorization of maps from smooth curves to proper targets, normalization-genus invariance and their analytic comparison contracts. This imports the curve objects and does not replan their divisor or Riemann–Roch theory.

Used by: `GeometricFreyMazur:GF.5/degree-conventions`, `GeometricFreyMazur:GF.6/image-normalization`, `GeometricFreyMazur:GF.6/pencil-cycle-map`, `GeometricFreyMazur:GF.6/normalized-pullback`, `GeometricFreyMazur:GF.9/function-field-form`, `GeometricFreyMazur:GF.10/rational-elliptic-curves`, `GeometricFreyMazur:GF.10/known-rational-curves`.


### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`

Algebraic Riemann–Hurwitz for a nonconstant separable finite map of smooth proper connected curves: 2g(C)−2=deg(f)(2g(D)−2)+Ram(f), with Ram the sum of e_x−1. Degree of K_C is 2g(C)−2.

Used by: `GeometricFreyMazur:GF.7/hurwitz-contradiction`, `GeometricFreyMazur:GF.10/bounded-genus`.


### `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-0-the-effective-projective-möbius-action`

Effective PSL/PGL Möbius actions, faithful real disc/half-plane comparison, and central scalar conventions used by the marked triangle action.

Used by: `GeometricFreyMazur:GF.1/triangle-uniformization`.


### `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-1-elliptic-points-and-coarse-quotient-charts`

Finite stabilizers of a Fuchsian action are cyclic; local quotient charts have z↦z^e; an effective finite group fixing a smooth curve point injects into its tangent character. Supply the elliptic/cusp inertia comparison for the modular cover.

Used by: `GeometricFreyMazur:GF.0/cm-strata`, `GeometricFreyMazur:GF.0/singular-bicusps`, `GeometricFreyMazur:GF.0/quotient-branch-locus`, `GeometricFreyMazur:GF.1/triangle-uniformization`, `GeometricFreyMazur:GF.7/ramification-support`, `GeometricFreyMazur:GF.7/local-indices`.


### `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`

Hyperbolic polygon and triangle-group uniformization with angle-sum criterion; translation length 2 arcosh(|tr|/2); distance/cosine identities; orbifold Gauss–Bonnet Area=π[PSL₂(Z):Γ]/3 for the cusped congruence quotient.

Used by: `GeometricFreyMazur:GF.1/triangle-uniformization`, `GeometricFreyMazur:GF.1/triangle-coordinates`, `GeometricFreyMazur:GF.1/surviving-systolic-witness`, `GeometricFreyMazur:GF.1/cusped-systole`, `GeometricFreyMazur:GF.1/cusp-separation`, `GeometricFreyMazur:GF.3/three-bicusp-repulsion`, `GeometricFreyMazur:GF.5/cusped-volume-error`, `GeometricFreyMazur:GF.8/modular-gonality`.


### `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`

Cusp uniformization by q, punctured hyperbolic metric density and finite cusp-cover local maps q↦q^e; retain the distinction between a cusp puncture and its compactified point.

Used by: `GeometricFreyMazur:GF.1/cusp-coordinates`.


### `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`

The compactified quotient Riemann surface, torsion-free compact uniformizing group and finite branched-cover Euler characteristic; compare complex compactification and modular boundary ramification.

Used by: `GeometricFreyMazur:GF.1/triangle-uniformization`, `GeometricFreyMazur:GF.5/cusped-volume-error`, `GeometricFreyMazur:GF.8/modular-gonality`.


### `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`

Finite holomorphic-map degree, multiplicity and the exact Riemann–Hurwitz formula on compact Riemann surfaces, consistent with the algebraic curve dictionary.

Used by: `GeometricFreyMazur:GF.7/hurwitz-contradiction`.


### `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`

The field finite-étale/Galois equivalence, including F_p-module objects and the actual G_K-linear isomorphism interpretation, compatible with the scheme finite-étale instance owned by IG.0.

Used by: `GeometricFreyMazur:GF.9/actual-torsion-classifying-map`, `GeometricFreyMazur:GF.9/function-field-form`.


### `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`

Effective descent and finite-presentation spread of elliptic schemes, homomorphisms, full level/torsion isomorphisms, maps and pencils to finitely generated subfields; preserve smoothness, connectedness and the inverse identities after shrinking. Include Galois descent of an invariant geometric homomorphism.

Used by: `GeometricFreyMazur:GF.9/actual-torsion-classifying-map`, `GeometricFreyMazur:GF.9/nonisotrivial-hom-lattice`, `GeometricFreyMazur:GF.9/actual-linear-descent`, `GeometricFreyMazur:GF.9/characteristic-zero-spread`, `GeometricFreyMazur:GF.9/function-field-form`.


### `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`

Full ordered prime-to-characteristic bases, fixed Weil pairing, GL₂ action and change-of-basis formulas, and the actual finite frame torsor of an elliptic scheme. No replacement by a projective or semisimplified representation.

Used by: `GeometricFreyMazur:GF.0/projective-frames`, `GeometricFreyMazur:GF.8/full-linear-monodromy`.


### `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`

Twisted full-level moduli Y_ρ and the classifying map associated to an actual torsion representation; descent along the frame torsor and its image-subgroup quotient interpretation.

Used by: `GeometricFreyMazur:GF.0/projective-frames`, `GeometricFreyMazur:GF.8/full-linear-monodromy`.


## Source corrections to retain

These are stated in our own words. New findings require independent mathematical verification; the named author corrections have their separate locators. The detailed arguments above supply the proposed repairs and counterexamples.


* **GeometricFreyMazur/E1** (error; BT16, Published Proposition 14 and Remark 16, pp. 725–727): The repulsion conclusion is asserted for both signs of CM. Use Heegner-only repulsion, and conjugate Hecke tubes for the minus sign. Reason: Conjugating one factor transports nearby plus pairs to nearby minus pairs; the claimed small integral normalizer lift is not supplied. Correction search/status: Author erratum §§1–2, Proposition 2.1.


* **GeometricFreyMazur/E2** (error; BT16, Published Proposition 25 proof, pp. 736–737): The plus-sign repulsion proof is applied to the whole CM locus. Separate the two signs; use the sinh-normalized conjugate-diagonal bound for CM−. Reason: The minus-sign repulsion premise fails, although the multiplicity conclusion survives with the new argument. Correction search/status: Author erratum §§3–4.1, Propositions 3.1 and 4.1.


* **GeometricFreyMazur/E3** (gap; BT16, Published Proposition 26 proof, p. 737): The small-Hecke contribution has exponent −1+3δ, after which the stronger p-weighted decay is inferred. Choose independent δ₃,δ₁,δ₂ and obtain −1−2δ₃+3δ₁ with 3δ₁<2δ₃. Reason: Multiplication by the cusp inertia p leaves growth p^(3δ) in the published proof. Correction search/status: Author erratum §4.2, Proposition 4.2.


* **GeometricFreyMazur/E4** (misprint; BTE, Author erratum Proposition 4.1 proof, p. 3): The displayed factor comparing the ε-tube with the large tube is sinh(R)/sinh(ε). Use sinh(ε)/sinh(R), with R tending to ρ_X/2 from below. Reason: Monotonicity of V(r)/sinh(r) directly gives the smaller reciprocal factor. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E5** (gap; BT16, Published Lemma 15 proof, pp. 726–727): The order-four square relation and Gaussian norm are also used in the order-three branch. For t=[[0,1],[-1,−1]] use t²+t+I=0, the conjugate root −I−t and det(aI+bt)=a²−ab+b². Reason: Direct multiplication and Cayley–Hamilton distinguish the two elliptic types. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E6** (error; BT16, Published §2.5, cyclic definition p. 716 and degree p. 717): The cyclic correspondence is assigned projection degree σ₁(m). Use ψ(m)=m∏_(ℓ|m)(1+1/ℓ); retain the sufficient O(m²) upper bound. Reason: At m=4 there are six cyclic subgroups and seven total order-four subgroups. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E7** (misprint; BT16, Published §2.5, pp. 716–717): Both polygon component-group domains are written with n components. The pm-gon source has Z/(pm), reducing to Z/p in the target; the p-gon self-map has Z/p. Reason: The definition of the n-gon identifies exactly n smooth connected components. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E8** (misprint; BT16, Published §3.1 radius definition, p. 718): The cusped radius uses the full infimum of admissible geodesic lengths. Use half that infimum, consistently with the compact injectivity radius. Reason: The trace-length calculation gives length 4log p and radius 2log p. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E9** (misprint; BT16, Published Proposition 18 proof, p. 731): The prose orders the two hyperbolic metrics in the reverse direction. Use h_X restricted to Y ≤ h_Y. Reason: Schwarz–Pick for the inclusion Y→X gives exactly this direction, also used in the next inequality. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E10** (misprint; BT16, Published Proposition 23 proof, p. 735): The logarithmic smooth term is multiplied by −1/(2π) before applying dd^c. The coefficient inside the dd^c calculation is −1; the final ω/(4π)+[Δ] formula remains correct. Reason: Expand log(χ/(1−χ)) as the difference of the two logarithms using the stated d^c convention. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E12** (gap; BT16, Published Lemma 5 proof, p. 718): The displayed trace-extremizing matrix is used as an upper witness for loops nontrivial after filling. Use the residue-class-dependent M_p and triangle-trace calculation in GF.1 instead. Reason: The published matrix is U(p)L(−p), a product of two peripheral elements killed by filling. The replacement has triangle trace (27/(4π²))p²+O(p). Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E13** (gap; BT16, Published Corollary 8 proof, p. 720): A shortest geodesic is said to visit at most one deep cusp, using a 2log p length bound. Use length at most 4log p+O(1), count all deep visits with two concentric cusp radii, and bound each detour/integral uniformly. Reason: Length is twice the injectivity radius; separation alone does not establish the one-cusp claim. The reader supplies the bounded-visits replacement. Correction search/status: Recorded in the existing atlas errata; no author correction located in the bounded search.


* **GeometricFreyMazur/E14** (gap; BT16, Published Proposition 12(a) proof, pp. 723–724): The proof invokes a matrix height p^(8δ) to force an entry smaller than p throughout the stated δ<1/4 range. For this proof restrict δ<1/8 with a fixed margin; the application needs only sufficiently small δ. Reason: The implication p^(8δ)=o(p) requires 8δ<1. This records a proof-range issue, not a counterexample to the whole printed range. Correction search/status: new


* **GeometricFreyMazur/E15** (error; BT16, Published §2.2, p. 715, projective level moduli claim): Projective framing is described as fine moduli. Use the coarse space and actual full-level torsors; [-1] still fixes a projective frame. Reason: Multiplying both frame vectors by −1 is a scalar change, so the elliptic involution remains an automorphism. Correction search/status: new


* **GeometricFreyMazur/E16** (gap; BT16, Published Proposition 18(a) proof, pp. 729–730): The count of p equally spaced points within hyperbolic chord distance 2R is bounded by a circumference fraction proportional to R/sinh d. Use O(min(p,1+p sinh R/sinh d)) and absorb exp(O(δρ_X)) in the allowed p^(Aδ) losses. Reason: The exact rotation identity gives sinh(distance/2)=sinh d·|sin(angle/2)|. R grows with log p, so the small-R linear approximation is insufficient. This is a proof correction, without a claim against the full dichotomy. Correction search/status: new


* **GeometricFreyMazur/E17** (error; BT16, Published Proposition 27, pp. 737–740): Decay of the sum of big-diagonal multiplicities is stated for every curve outside the big diagonals. Require both projected cycles to be nonconstant and non-Hecke, as verified in the final gonality pullback. Reason: On T₁×T₁ embed a generic smooth ample D⊂X×X as (x,x,y,y). It avoids containment in all Δ_g but the ratio of summed multiplicities to canonical degree is 3p/(p−6), tending to 3. The reader gives the intersection calculation. Correction search/status: new


* **GeometricFreyMazur/E18** (error; BT16, Published Proposition 17 and proof, pp. 727–728): Reconstruction from three nearby singular bicusps is asserted to produce an ordinary small Hecke divisor. Retain both signs: the small locus can be ordinary or conjugate Hecke. Reason: The cofactor lift can have negative determinant. For p≡1 mod4 and a²=−1, the reader constructs three nearby cusp pairs (v,av). Any ordinary cyclic degree m containing one must satisfy m≥p−1, while the negative reflection has absolute determinant one. Correction search/status: new


* **GeometricFreyMazur/E19** (gap; BT16, Published Proposition 18 case 2(2), p. 731): The determinant of the reconstructed integral projective intertwiner is used as a positive Hecke index. Split positive and negative determinants and use an ordinary or conjugate small Hecke tube respectively. Reason: Being invertible modulo p and having square determinant class does not imply a positive rational determinant. Multiplying the matrix by −1 leaves the sign unchanged. This records the missing proof case, without asserting a counterexample to the original disjunction. Correction search/status: new


* **GeometricFreyMazur/E20** (gap; BT16, Published Proposition 27 proof, p. 739, the radial-shell comparison): The relative diagonal-tube theorem, Proposition 23, is invoked to compare volumes in concentric point balls. Use the weaker point-ball inequality V(r)≤C_n(1+r)exp(r−R)V(R), with a new Green-identity proof and an explicit HV.4 request. Reason: A point-ball volume is not a diagonal-tube volume. Neither the stated Proposition 23 nor the point-multiplicity lower bound supplies this comparison. The logarithmic loss is harmless after shrinking the fixed decay exponent; the reader proves the required version. Correction search/status: new


* **GeometricFreyMazur/E21** (gap; BT16, Published Proposition 27 proof, p. 740, the enlarged-ball overlap step): Proposition 17 is used to assert disjointness of enlarged bicusp-centred balls except along small Hecke loci. Use projected area forms and projected ball counts. Charge multiplicity at most two once in each surface projection, and use signed lenses only for the remaining projected multiple overlaps. Reason: Proposition 17 has a three-bicusp premise, not a two-ball disjointness conclusion. Moreover three distinct centres in SBC×SBC can repeat either projection. The reader gives a projectionwise replacement rather than treating every product-ball overlap as a common Hecke tube. Correction search/status: new


## References


* **BT16**: Benjamin Bakker and Jacob Tsimerman, [p-torsion monodromy representations of elliptic curves over geometric function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf). Annals of Mathematics 184 (2016), no. 3, 709–744; published version.


* **BTE**: Benjamin Bakker and Jacob Tsimerman, [Erratum to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf). Five-page author erratum, including Propositions 2.1, 3.1, 4.1, 4.2.


* **ABR96**: Dan Abramovich, [A linear lower bound on the gonality of modular curves](https://arxiv.org/pdf/alg-geom/9609012). Author preprint alg-geom/9609012, corresponding to IMRN 1996, 1005–1011; locators below use the five-page preprint.


* **BLR90**: Siegfried Bosch, Werner Lütkebohmert and Michel Raynaud, [Néron Models](https://doi.org/10.1007/978-3-642-51438-8). Ergebnisse der Mathematik 21, Springer, 1990; maintainer-cleared original read in place.
