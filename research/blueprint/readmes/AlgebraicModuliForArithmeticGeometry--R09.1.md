# R09.1. Projective parameter spaces, positivity and boundedness

This layer supplies the projective geometry needed to put arithmetic moduli conditions into finite parameter spaces. Its quotient convention, twist cohomology and coherent regularity connect the Grassmannian constructions to Hilbert and Quot schemes in R09.2. Its incidence equations and the two distinct Frobenius operations serve arithmetic linear-algebra moduli. The numerical bounds also supply the boundedness arguments of Charles and Gao–Klingler.

The finite locally free quotient Grassmannian and its projectivity already belong to ModularCurves 0G. Relative Proj, projective morphisms and relative ampleness belong to StableReduction Layer 2. AlgebraicVectorBundles L0B/L0C already supply finite locally free rank, symmetric/exterior powers and determinants. SchemeAndStackFoundations SF.5 supplies finite locally free projective bundles, complete flags, absolute very ampleness, the big-line predicate and numerical intersection theory. This layer gives applications, broader coherent/relative extensions and the necessary comparisons with those owners.

The three explicit open inputs are the atlas registration of the existing AlgebraicVectorBundles layers, a readable corrected algebraic proof of numerical very ampleness, and the positive-characteristic relative bounded-degree input. All targets below are specified; those inputs prevent mathematical closure. The numerical theorem and the full arbitrary-characteristic boundedness statement remain conditional on their stated inputs.

## Conventions and interfaces

Schemes and module sheaves are the actual pinned library objects. P(E) means Proj Sym(E), classifying **invertible quotients** of the pullback of E. Grassmann rank d is the rank of the quotient, agreeing with the native `Module.Grassmannian`; a kernel of rank a in a rank-n bundle corresponds to Gr_(n−a). O(1) is the tautological quotient, and negative twists use inverse line bundles. In top cohomology the determinant dual is essential over arbitrary rings; replacing a dual symmetric power by a symmetric power of the dual is not assumed.

Noetherian bases are quasi-compact when a single global bound is asserted. Over merely locally Noetherian bases such bounds are local. Coherent quotients require a fixed ambient sheaf for uniform regularity. Reduced pure-dimensional supports, rather than arbitrary embedded structures, are used for degree-bounded polynomial finiteness. Chow coefficient spaces classify geometric cycles and carry closed universal support; that support is not asserted to be a flat universal subscheme. The support-meets-open condition permits other components entirely in the boundary.

The absolute Frobenius operation sends a graph coefficient t to t^p. The arithmetic operation fixing coefficients and sending u to u^p is coefficient-linear on finite cutoffs. They have separate constructions and separate tests. Rational maps from big line bundles may have base points; the birational bounds do not imply ampleness.

| Imported owner | Exact use |
| --- | --- |
| ModularCurves 0G | Finite locally free quotient Grassmann schemes, universal exact sequence, charts, base change, projectivity and O-linear zero-map loci. |
| StableReduction Layer 2, with the requested Part II extension | Relative Proj and O(1), projective morphisms, integer tensor powers, relative ampleness, coherent higher pushforwards and projection formula. Arbitrary quasi-coherent Sym(E) is needed for nonproper complete evaluation. |
| AlgebraicVectorBundles L0B/L0C | Finite locally free rank, symmetric/exterior powers, determinants and pullback coherence. These existing upstream layers need atlas registry entries. |
| JacobianChallenge Layers B and C, with the requested broader exports | Affine QC acyclicity and Čech comparison in all dimensions; proper coherent cohomology/base change, semicontinuity and high-degree locally free pushforward. |
| SchemeAndStackFoundations SF.4 | Generic flatness; smooth cotangent rank and generic geometric-reducedness spreading requested in the same foundational direction. |
| SchemeAndStackFoundations SF.5 | Its existing projective bundle, complete flags, absolute positivity and first-Chern/degree calculus; the proper multivariable Euler polynomial and mixed-intersection comparison requested in that direction. |

Hilbert/Quot representability, Hom/Isom schemes, the Chow lemma and proper modification are R09.2 targets. Polarized descent is R09.3. The analytic comparison roadmap consumes the algebraic twists and cohomology here; it is not a prerequisite of this layer. No numerical intersection calculus, absolute big-line definition or general Proj construction is recreated.

## Targets

The following groups organise one layer; they are not proposed new stage identifiers. Each target gives its mathematical hypotheses, proof route, interfaces and acceptance examples. Names indicate proposed declaration interfaces, not completed formalisation.

### Projective bundles, twists and coherent cohomology

#### Projective bundles from relative Proj

For a quasi-coherent module E on S, form P_S(E)=Proj_S Sym(E), using the quotient convention: a T-point over S is an invertible quotient f*E→L, modulo isomorphism of its line target. The tautological quotient π*E→O(1) is surjective and commutes with arbitrary base change. For E finite type the projection is projective locally on S, and for E finitely presented it is finitely presented. The arbitrary-quasicoherent case uses the explicitly requested same-owner extension of relative Proj; the finite-type construction is exactly the existing StableReduction Layer 2 case. The finite locally free case agrees with the existing SF.5 projective bundle; the new target is the quasi-coherent extension and these comparisons.

**Hypotheses.** S arbitrary; E quasi-coherent. Projectivity and finite presentation have the finiteness hypotheses in the statement.

**Proof route.** Apply the imported relative-Proj construction to the imported graded Sym(E), generated in degree one. Standard charts identify the degree-zero localization with the universal line quotient on a chosen generator chart.

Use the quotient universal property to identify the chart glue with P(E), including quotient isomorphisms and arbitrary base change. No finite locally free Grassmann representability is rebuilt.

Compare the finite locally free special case with SF.5/projective-bundle by its invertible-quotient universal property; do not duplicate its Chow-theoretic API.

**API.**

- `projectiveBundle.projection`: The structure map π:P(E)→S.
- `projectiveBundle.universalQuotient`: The actual surjection π*E→O(1).
- `projectiveBundle.quotient_characterisation`: A map g over S is the classifying map of q exactly when pulling back the tautological quotient gives q up to an isomorphism of its line target.
- `projectiveBundle.baseChange`: P_T(f*E)≅P_S(E)×_S T, preserving the quotient.
- `projectiveBundle.rankOne`: P_S(L)≅S for invertible L, with O(1) identified with L.

**Unit tests.**

- `ProjectiveBundleTests.rankOne` (compatibility): For every invertible L, P(L)≅S and the quotient convention identifies O(1) with L.
- `ProjectiveBundleTests.zero` (degenerate): P(0)≅∅.
- `ProjectiveBundleTests.rankTwo` (computation): P(O_S²)=P¹_S.
- `ProjectiveBundleTests.baseChange` (compatibility): A nonflat base change also gives P(f*E)≅P(E)×_S T.

**Consumers.** ComplexComparisonPartII C1–C3 and R09.2 Hilbert embeddings: Fix the projective-space and quotient convention before constructing twists, classifying maps and section spaces.

**Acceptance.** P(0) is empty; P(L) is S for an invertible L; this is not the convention of lines in E.

**Prerequisites.** `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `mathlib:SymmetricAlgebra`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `SchemeAndStackFoundations:SF.5/projective-bundle`.

**Sources.** [SC](https://stacks.math.columbia.edu/download/constructions.pdf), §21, Definition 21.1, Example 21.3, pp.45–46. Degree-one relative Proj supplies the invertible quotient and its exact functor of points.

#### Integer twisting sheaves

On P(E), define O(m)=O(1) tensor-powered by every integer m: negative exponents use the inverse line bundle, and O(0)=O. These are invertible since Sym(E) is generated in degree one. The canonical tensor, base-change and rank-one comparisons are part of the construction; do not claim invertibility for arbitrary graded algebras.

**Hypotheses.** E quasi-coherent; the degree-one generated Sym(E) case; no finite-type or flatness hypothesis is needed for invertibility and tensor coherence.

**Proof route.** Use the supplier integer tensor-power API on the native invertible O(1). Identify with the graded-module twist on the degree-one charts.

Tensor multiplication and duality give coherent O(a)⊗O(b)≅O(a+b). Pullback respects them by the supplier comparison.

**API.**

- `projectiveBundle.twistingSheaf.zero`: O(0)≅O.
- `projectiveBundle.twistingSheaf.add`: O(a)⊗O(b)≅O(a+b), with unit and associativity coherence.
- `projectiveBundle.twistingSheaf.pullback`: Every projective-bundle base-change isomorphism carries O(m) to O(m).

**Unit tests.**

- `TwistingSheafTests.zero` (degenerate): O(0) is the native structure-sheaf unit.
- `TwistingSheafTests.inverse` (computation): O(1)⊗O(-1)≅O.
- `TwistingSheafTests.rankOne` (compatibility): On P(L)≅S, O(1)≅L, rather than L inverse.

**Consumers.** ComplexComparisonPartII C3; R09.2 high-twist Quot charts: Use all integer twists in coherent cohomology and compare positive section spaces with symmetric powers.

**Acceptance.** On P(L)=S, O(m)=L^m, including negative m.

**Prerequisites.** [Projective bundles from relative Proj](#projective-bundles-from-relative-proj), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`.

**Sources.** [SC](https://stacks.math.columbia.edu/download/constructions.pdf), §21, Lemma 21.5, pp.46–47. All integer twists of a degree-one generated projective bundle are invertible and tensor-compatible.

#### The rank-one quotient comparison

Identify P(E) with the rank-one quotient Grassmannian, including the actual universal quotient, structure map and arbitrary base change. On finite locally free E this compares with ModularCurves 0G; on general finite-type E it uses the coherent extension below.

Proposed theorem interface: `rankOneGrassmannComparison`.

**Hypotheses.** S arbitrary; E quasi-coherent finite type.

**Proof route.** Both constructions represent invertible quotients of f*E, modulo target isomorphism. Apply the universal properties in both directions and prove identity by uniqueness.

**Acceptance.** For rank-two free E, both are P¹; quotient rank one is used throughout.

**Prerequisites.** [Projective bundles from relative Proj](#projective-bundles-from-relative-proj), `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`, [Grassmannians of finite-type coherent quotients](#grassmannians-of-finite-type-coherent-quotients).

**Sources.** [SC](https://stacks.math.columbia.edu/download/constructions.pdf), §21, Example 21.3, pp.45–46. The projective bundle represents the same rank-one quotient functor.

#### All cohomology of projective-space twists

For any commutative ring A and n≥1, H⁰(Pⁿ_A,O(m)) is free on nonnegative exponent vectors of sum m when m≥0, and zero otherwise. Hⁿ is free on all-negative exponent vectors of sum m when m≤-n-1, and zero otherwise. All other H^q vanish. For n=0, H⁰(P⁰_A,O(m))≅A for every m and higher cohomology vanishes. The identifications and their coefficient maps commute with arbitrary A→B.

Proposed theorem interface: `projectiveSpaceTwistCohomology`.

**Hypotheses.** A arbitrary, including nonreduced rings; q≥0 and m any integer.

**Proof route.** Use affine QC acyclicity and finite Čech comparison from Jacobian Layer B on the n+1 standard affine charts. Grade the Čech complex by Laurent exponent vectors.

For each exponent vector, the permitted localizations form a simplex complex. Contract the mixed-sign complexes; retain a degree-zero class for all nonnegative exponents and a top class for all negative exponents.

Read the resulting free-module descriptions after tensoring with B; handle n=0 as its own single-chart computation.

**Acceptance.** H¹(P¹_A,O(-2))≅A, H¹(P¹_A,O(-1))=0, and H⁰(P⁰_A,O(-7))≅A.

**Prerequisites.** [Integer twisting sheaves](#integer-twisting-sheaves), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `mathlib:AlgebraicGeometry.tilde`.

**Sources.** [CC](https://stacks.math.columbia.edu/download/coherent.pdf), §8, Lemmas 8.1–8.3, pp.16–20; tags 01XT,01XW. The Laurent Čech computation is valid over arbitrary rings and retains all negative twists.

#### Multiplication on twist cohomology

Construct the natural cup maps H^i(O(a))×H^j(O(b))→H^{i+j}(O(a+b)). In degree zero they agree with homogeneous polynomial multiplication. For Hⁿ, multiplication by a homogeneous polynomial is multiplication of Laurent representatives followed by discarding terms whose exponent vector is not all negative; equivalently it is dual to multiplication under the determinant-twisted top pairing.

**Hypotheses.** Projective bundles for the cup maps; on projective space use the preceding explicit basis.

**Proof route.** Use the sheaf tensor map O(a)⊗O(b)→O(a+b) and the ordered Čech cup product, proving cover-independence via the supplier comparison.

Compute on Laurent monomials. Top cohomology kills every term admitting a nonnegative exponent; no polynomial action on a top class is guessed from dimension alone.

**API.**

- `twistMultiplication.zero_left`: The cup map is zero when its first input is zero.
- `twistMultiplication.add_left`: The cup map is additive in each argument.
- `twistMultiplication.section_product`: Via the native H⁰/global-section equivalence, degree-zero cup product is the tensor product of sections.

**Unit tests.**

- `TwistMultiplicationTests.zero` (degenerate): Zero section times any class is zero.
- `TwistMultiplicationTests.unit` (computation): The section 1 of O(0) acts as identity on H⁰(O(1)).
- `TwistMultiplicationTests.topBoundary` (computation): On P¹, H¹(O(-2)) times H⁰(O(1)) lands in zero H¹(O(-1)).

**Consumers.** ComplexComparisonPartII C3: Compare algebraic line-bundle cohomology and multiplication, not just dimensions.

**Acceptance.** Multiplication by x₀ sends the class x₀^-1 x₁^-1 in H¹(O(-2)) to zero in H¹(O(-1)).

**Prerequisites.** [Integer twisting sheaves](#integer-twisting-sheaves), [All cohomology of projective-space twists](#all-cohomology-of-projective-space-twists), `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyZeroEquiv`, `tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct`.

**Sources.** [CC](https://stacks.math.columbia.edu/download/coherent.pdf), §8, Lemma 8.2, pp.19–20 and proof of Lemma 8.4, pp.20–22. Explicit base-change and multiplication maps follow the Čech representatives and the determinant pairing.

#### Relative cohomology of projective bundles

If E is locally free of rank n+1 with n≥1 and π:P(E)→S, then R⁰π*O(m)=Sym^m E for m≥0 and zero for m<0; Rⁿπ*O(m)=Hom(Sym^(-m-n-1)E⊗det E,O_S) for m≤-n-1 and zero otherwise; all other R^q vanish. These isomorphisms commute with arbitrary base change and multiplication. For rank-one E=L, π is an isomorphism and R⁰π*O(m)=L^m for every integer m.

Proposed theorem interface: `relativeBundleCohomology`.

**Hypotheses.** S arbitrary; E finite locally free of the indicated fixed rank. The symmetric-power formula is not asserted for arbitrary coherent E.

**Proof route.** Trivialize E and apply the Čech basis computation. Track changes of frame in top cohomology: the volume pairing transforms by det E, hence its dual contains the inverse determinant.

Glue the explicit isomorphisms and their multiplication maps. The local free models show arbitrary base change, beyond merely flat base change.

**Acceptance.** R¹π*O(-2)=(det E)^(-1) for rank-two E; n=0 has no negative-twist vanishing.

**Prerequisites.** [All cohomology of projective-space twists](#all-cohomology-of-projective-space-twists), [Multiplication on twist cohomology](#multiplication-on-twist-cohomology), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`.

**Sources.** [CC](https://stacks.math.columbia.edu/download/coherent.pdf), §8, Lemma 8.4, pp.20–22; tag 01XX. The quotient convention gives the determinant inverse in top direct image.

#### Absolute Serre A and B

For a proper scheme X over a Noetherian ring A, an ample invertible L and coherent F, H^q(X,F) is a finite A-module, and H^q(X,F⊗L^m)=0 for every q>0 and m sufficiently large. Each sufficiently high twist is globally generated; equivalently F is a quotient of a finite direct sum of powers L^d. For a chosen projective embedding, a truncated graded section module is finitely generated.

Proposed theorem interface: `absoluteSerre`.

**Hypotheses.** A Noetherian; X proper of finite type; L ample; F coherent. The threshold depends on F and L.

**Proof route.** On Pⁿ_A, obtain a finite sum of twists surjecting onto F by affine generators and clearing powers of coordinate denominators. Kernels stay coherent by Noetherianity.

Use the finite Čech cover for cohomological dimension and induct on cohomological degree using twist cohomology and exact sequences. This proves finiteness and eventual vanishing without circular use of Hilbert representability.

Choose a very ample power of L using the supplier ampleness/projectivity framework; push through the closed embedding and treat finitely many residue classes of powers to pass from O(1) to L.

**Acceptance.** F=O(-a) on P¹ becomes generated for m≥a; no uniform threshold independent of F is claimed.

**Prerequisites.** [All cohomology of projective-space twists](#all-cohomology-of-projective-space-twists), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`.

**Sources.** [CC](https://stacks.math.columbia.edu/download/coherent.pdf), §14, Lemma 14.1, pp.34–36; §16, Lemma 16.1, pp.42–43; tags 01YS,0B5T. Projective-space presentations and cohomological induction yield generation, finiteness and vanishing for proper ample schemes.

#### Relative Serre A and B

For a proper morphism f:X→S with S locally Noetherian, coherent F and f-ample L, locally on S sufficiently high F⊗L^m has surjective evaluation f*f*(F⊗L^m)→F⊗L^m and R^qf*(F⊗L^m)=0 for all q>0. If S is quasi-compact, one integer works over all S for every m beyond it. The direct images are coherent. Bounds are local without quasi-compactness.

Proposed theorem interface: `relativeSerre`.

**Hypotheses.** Proper f of finite type; locally Noetherian S; f-ample L; coherent F.

**Proof route.** Restrict to affine opens of S and apply absolute Serre A/B. The relative cohomology and restriction comparisons are supplied by SR Layer 2 and Jacobian Layer C.

Take the maximum over a finite affine cover of quasi-compact S. Keep the local formulation for bases without such a finite cover.

**Acceptance.** A disjoint union of projective lines carrying O(-a) with unbounded a has only local generation thresholds.

**Prerequisites.** [Absolute Serre A and B](#absolute-serre-a-and-b), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

**Sources.** [CC](https://stacks.math.columbia.edu/download/coherent.pdf), §16, Lemma 16.2, p.43; tag 02O1. The precise quasi-compact relative vanishing bound is part of the statement; generation follows the finite presentation argument.

### Quotient Grassmann geometry and relative positivity

#### Grassmannians of finite-type coherent quotients

For a quasi-coherent finite-type E on arbitrary S and d≥0, represent T↦locally free rank-d quotients f*E modulo quotient isomorphism by Gr_d(E). Locally choose O^N→E and impose vanishing of its relation sheaf in the universal quotient of the imported finite-free Grassmannian. This is a closed projective S-scheme, finitely presented if E is finitely presented. It has universal quotient Q and commutes with arbitrary base change. Smoothness is not claimed for general E.

**Hypotheses.** S arbitrary; E finite type and quasi-coherent; quotient Q finite locally free of fixed rank d.

**Proof route.** On a finite-generator chart, import Gr_d(O^N) from 0G. Every relation gives a coefficient equation in Q; vanishing defines a closed subscheme even with infinitely many relations.

If E is finitely presented the relation module is finitely generated, making this closed immersion finitely presented. Identify the quotient functor and glue uniquely on overlaps, independent of the chosen presentation.

Compare affine S-points with Module.Grassmannian R M d, whose parameter is quotient rank. Pulling back the original quotient presentation, rather than an assumed flat kernel, proves arbitrary base change.

**API.**

- `coherentGrassmann.universalQuotientSheaf`: The universal finite locally free quotient Q of rank d.
- `coherentGrassmann.fromQuotient`: Every rank-d locally free quotient over T has a unique classifying T→Gr_d(E) over S.
- `coherentGrassmann.baseChange`: Gr_d(f*E)≅Gr_d(E)×_S T, with its actual quotient.
- `coherentGrassmann.rankOne`: Gr_1(E)≅P(E), preserving O(1).
- `coherentGrassmann.affinePoints`: For S=Spec R and E=tilde M, S-points are equivalent to Module.Grassmannian R M d.

**Unit tests.**

- `CoherentGrassmannTests.rankZero` (degenerate): Gr_0(E)≅S.
- `CoherentGrassmannTests.zeroPositive` (degenerate): Gr_1(0)≅∅.
- `CoherentGrassmannTests.rankOne` (compatibility): Gr_1(E)≅P(E) with quotient line convention.
- `CoherentGrassmannTests.affinePoints` (compatibility): Affine S-points give the native finite projective quotient Grassmannian, not arbitrary submodules of kernel rank d.

**Consumers.** R09.2 high-twist universal quotients; RT-AREA-algebraicgeometry/12: Extend 0G exactly to finite-type sheaves instead of rebuilding its finite locally free construction.

**Acceptance.** For E=O/(t), Gr_1(E)=V(t), which can fail to be smooth over S; for E=0 and d>0 it is empty.

**Prerequisites.** `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:Module.Grassmannian`, `mathlib:Module.Grassmannian.functor`, `mathlib:AlgebraicGeometry.tilde`, [Projective bundles from relative Proj](#projective-bundles-from-relative-proj).

**Sources.** [AL](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-8-19-24.pdf), §1.4.3, proof of Theorem 1.4.5, pp.61–62 (relation-vanishing argument). The kernel-to-universal-quotient zero equation cuts out quotients factoring through a fixed coherent quotient; the relative-dimension-zero specialization is exactly the extension here.

#### Smoothness and dimension for locally free Grassmannians

For locally free E of rank n and 0≤d≤n, Gr_d(E)→S is smooth of relative dimension d(n-d). Its graph charts are affine spaces of that dimension; the tangent along a quotient E→Q with kernel K is Hom(K,Q). Gr_0(E) and Gr_n(E) are S; d>n gives the empty scheme.

Proposed theorem interface: `grassmannSmoothness`.

**Hypotheses.** E finite locally free of constant rank n; no smoothness assertion for a coherent E of varying rank.

**Proof route.** Import graph charts from 0G; their affine coordinates are Hom(K_chart,Q_chart). Affine-space smoothness and transition compatibility prove the statement.

A first-order graph perturbation is a map K→Q, giving the canonical tangent comparison.

**Acceptance.** Gr_1(O²) has relative dimension 1; Gr_1(O/(t)) need not be smooth.

**Prerequisites.** [Grassmannians of finite-type coherent quotients](#grassmannians-of-finite-type-coherent-quotients), `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`, `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

**Sources.** [GO](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), §5, Lemma 5.8 and Theorem 5.9, pp.58–59. Graph charts give smoothness and dimension; convert the source kernel rank r to quotient rank d=n-r.

#### The relative Plücker embedding

The universal rank-d quotient of E induces an invertible quotient ∧^dE→det Q and hence a closed immersion Gr_d(E)→P(∧^d E). Its pullback of O(1) is det Q and it commutes with arbitrary base change. For finite locally free E, chart coordinates are signed maximal minors and the image is defined scheme-theoretically by Plücker relations. For finite-type E use its relation-cut presentation to restrict the finite-free embedding.

**Hypotheses.** E quasi-coherent finite type; exterior and determinant sheaves are imported from AlgebraicVectorBundles L0C.

**Proof route.** Use the exterior quotient and the projective-bundle universal property. On a finite-free generator chart invert a maximal minor and reconstruct the normalized graph matrix from minor ratios.

Prove that the Plücker relations recover that graph over arbitrary rings, not just on geometric points; these charts cover the projective image.

For a presented E, factor through P(∧^d E). Closed immersions into a fixed ambient projective scheme imply the induced factor remains closed.

**API.**

- `pluckerEmbedding.isClosedImmersion`: The exterior-quotient classifying map is a closed immersion.
- `pluckerEmbedding.pullback_twist`: Pullback O(1)≅det Q, naturally in the quotient.
- `pluckerEmbedding.over`: The embedding is over S; the exterior and determinant maps commute with pullback.
- `pluckerEmbedding.chartCoordinates`: For a two-row quotient matrix of O⁴, compute the six Plücker coordinates as its ordered 2×2 minors. On a unit p12 graph chart they are (1,c,d,-a,-b,ad-bc); the projective map uses these coordinates.

**Unit tests.**

- `PluckerTests.rankOne` (compatibility): For d=1 the Plücker map is Gr_1(E)≅P(E).
- `PluckerTests.twoPlanesFourSpace` (computation): The six minor coordinates on Gr_2(O⁴) satisfy p12 p34-p13 p24+p14 p23=0; its unit-minor charts recover 2×2 graph matrices.
- `PluckerTests.rankZero` (degenerate): For d=0, Gr_0(E)=S and ∧⁰E=O, so the map is an isomorphism.

**Consumers.** Lawrence–Venkatesh linear-algebra loci and R09.2 Quot embedding: Give a definite polarization and scheme-level equations rather than pointwise projectivity.

**Acceptance.** For Gr_2(O⁴), p12 p34-p13 p24+p14 p23=0. The quotient determinant, not its inverse, is the pulled-back O(1).

**Prerequisites.** [Grassmannians of finite-type coherent quotients](#grassmannians-of-finite-type-coherent-quotients), [Projective bundles from relative Proj](#projective-bundles-from-relative-proj), `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`, `mathlib:Matrix.det`.

**Sources.** [GO](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), §5, Theorem 5.10, pp.59–60. Exterior coordinates define a closed projective embedding; the plan strengthens the sketch to a scheme-level chart inverse.

#### Partial flag bundles

For finite locally free E of rank n and a strictly increasing list 0≤a₁<…<a_s≤n, represent flags of subbundles F_i⊂E_T of ranks a_i, with every quotient E_T/F_i locally free. It is the closed incidence subscheme of the product over S of Gr_(n-a_i)(E), defined by F_i→E_T/F_j=0 for i<j. It is smooth and projective, of relative dimension Σ_i(a_i-a_(i-1))(n-a_i), where a₀=0; full flags have dimension n(n-1)/2. Import the complete flag object of SF.5; this target extends it to arbitrary partial types and the stated relative incidence/chart geometry, and identifies the complete-type special case with that imported object.

**Hypotheses.** E finite locally free of rank n; strictly increasing admissible ranks; empty list is allowed.

**Proof route.** Take the relative product of imported Grassmannians and its universal kernels and quotients. Since targets are locally free, coefficient zero equations cut out a closed subscheme commuting with arbitrary pullback.

Use successive graph charts, or iterate Grassmann bundles in the previous quotient. Compute the dimensions by successive block sizes and identify the two constructions by their universal flags.

For the complete type compare the universal flag with SF.5/flag-bundle, rather than planning a second complete flag object or splitting principle.

**API.**

- `flagBundle.projection`: The structure map of the flag scheme.
- `flagBundle.toGrassmann`: The ith flag step gives the quotient of rank n-a_i; the universal kernels are nested.
- `flagBundle.baseChange`: Flags and universal steps commute with arbitrary base change.

**Unit tests.**

- `FlagTests.empty` (degenerate): Flag(E;[])≅S.
- `FlagTests.single` (compatibility): Flag(E;[a])≅Gr_(n-a)(E).
- `FlagTests.nested` (non-example): In k³, a line U not contained in a plane V fails the flag incidence condition.

**Consumers.** R05 Frobenius-stable filtrations and R09.7 filtration parameter spaces: Use a projective parameter scheme for genuinely nested subbundles with locally free quotients.

**Acceptance.** Empty flag is S; a one-step flag is a Grassmannian; line-in-plane flags in rank three have relative dimension three.

**Prerequisites.** [Grassmannians of finite-type coherent quotients](#grassmannians-of-finite-type-coherent-quotients), [Smoothness and dimension for locally free Grassmannians](#smoothness-and-dimension-for-locally-free-grassmannians), `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`, `SchemeAndStackFoundations:SF.5/flag-bundle`.

**Sources.** [GO](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), §5, Propositions 5.16–5.17, pp.61–62. Nestedness gives the closed flag scheme and graph charts give smoothness and dimension.

#### Relative very ampleness

An invertible L on X is very ample relative to f:X→S when there are a quasi-coherent E on S and an immersion i:X→P_S(E) over S with L≅i*O(1). The immersion convention includes nonproper X. For quasi-compact f, the evaluation criterion requires f quasi-separated (so f_*L is quasi-coherent), surjective evaluation f* f_*L→L, and immersion of the complete classifying map into P(f_*L). This property is local on S and stable under arbitrary base change. If f is proper, a representing immersion is closed. Over a field, for projective X, this agrees with SF.5/very-ample; that absolute notion and its power/restriction API are imported.

**Hypotheses.** S and X arbitrary for the definition; quasi-compactness for the evaluation criterion and implication very ample⇒ample.

**Proof route.** Define the property using native invertible sheaves and native immersions into the already defined P(E).

Use the quotient property for the evaluation map and factor a chosen embedding through complete sections; the corresponding projective affine-open charts prove the criterion.

Apply base change to the immersion and O(1). A proper immersion into the separated projective bundle is closed.

**API.**

- `IsRelativelyVeryAmple.of_embedding`: A specified immersion over S and pullback isomorphism witness relative very ampleness.
- `IsRelativelyVeryAmple.evaluation_criterion`: For quasi-compact and quasi-separated f, surjective complete evaluation and immersion of the classifying map are equivalent to relative very ampleness.
- `IsRelativelyVeryAmple.closed_of_proper`: A witnessing immersion is closed when f is proper.

**Unit tests.**

- `VeryAmpleTests.projectiveSpace` (computation): O(1) on every Pⁿ_S is relatively very ample.
- `VeryAmpleTests.veronese` (computation): O(2) on P¹_k gives a conic Veronese closed embedding.
- `VeryAmpleTests.trivialNotVeryAmple` (non-example): O on P¹_k is globally generated but not very ample.

**Consumers.** R09.2 Hilbert embeddings; Benoist19 §5.1 and §6.2: Separate global generation, ampleness and actual embeddings; keep the proper/immersion distinction.

**Acceptance.** O(1) and O(2) on P¹ are very ample; globally generated O on P¹ is not.

**Prerequisites.** [Projective bundles from relative Proj](#projective-bundles-from-relative-proj), [Integer twisting sheaves](#integer-twisting-sheaves), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `mathlib:AlgebraicGeometry.IsImmersion`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.IsProper`, `SchemeAndStackFoundations:SF.5/very-ample`.

**Sources.** [SM](https://stacks.math.columbia.edu/download/morphisms.pdf), §39, Definition 39.1, Lemmas 39.7–39.8, pp.86–89; tags 01VM,01VR,0B3F. Relative very ampleness is an immersion with a specified line-bundle pullback; its evaluation criterion needs quasi-compactness.

#### Very ample high powers and fixed twists

For finite-type f:X→S with quasi-compact S and f-ample A, all sufficiently high powers A^m are relatively very ample. If f is proper, their classifying embeddings are closed. If X→S is proper over a Noetherian S and B is any fixed invertible sheaf, B⊗A^m is relatively very ample for all sufficiently large m. For finitely many B, one bound works simultaneously; over affine S the embeddings may be into some finite Pⁿ_S.

Proposed theorem interface: `amplePowersAndFixedTwists`.

**Hypotheses.** Quasi-compact base for a global bound; finite type f. Coherence and properness for the fixed-twist application.

**Proof route.** Apply the local affine ampleness criterion and choose a maximum over a finite base cover; glue complete evaluation maps using the relative very-ampleness criterion.

Relative Serre A makes B⊗A^b globally generated for large b. Tensoring a globally generated line with a fixed very ample power A^c is very ample by the Segre construction. Thus every m≥b+c gives the fixed-twist result.

**Acceptance.** On P¹, O(-7)⊗O(1)^m is very ample for m≥8; m=7 is only globally generated.

**Prerequisites.** [Relative very ampleness](#relative-very-ampleness), [Relative Serre A and B](#relative-serre-a-and-b), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources.** [SM](https://stacks.math.columbia.edu/download/morphisms.pdf), §40, Lemmas 40.4–40.5, pp.91–92; tags 01VT,01VU. Ample high powers yield immersions; the fixed-twist consequence is proved here with Serre generation and the explicit Segre construction.

### Hilbert polynomials and coherent regularity

#### Finite graded pieces and homogeneous ranks

Let A be a Noetherian ring, B a finitely generated standard nonnegative graded A-algebra with B₀=A, and M a finitely generated graded B-module. Every M_d is finite over A and M_d=0 for d sufficiently negative. For B=A[x₀,…,x_n], its degree-d part is finite free of rank binomial(n+d,n) for d≥0, and is zero for d<0. These basis descriptions commute with arbitrary A-algebra extension.

Proposed theorem interface: `gradedPiecesFinite`.

**Hypotheses.** Degree-one generators, finite generation of M, and nonnegative grading of B; M itself may have negative generator degrees.

**Proof route.** Choose finitely many homogeneous generators of B and M. Degree-d monomials times those generators form a finite spanning set. For the polynomial algebra, support-total-degree gives a genuine basis, counted by compositions of d.

Use the native homogeneous polynomial submodule; do not create a replacement polynomial carrier.

**Acceptance.** For n=1,d=2 the rank is 3; degree −1 has rank 0.

**Prerequisites.** `mathlib:MvPolynomial.homogeneousSubmodule`, `mathlib:SymmetricAlgebra`.

**Sources.** [SA](https://stacks.math.columbia.edu/download/algebra.pdf), §58, Lemmas 58.5–58.6, pp.136–137. Noetherian graded modules have homogeneous finite generating sets and finite graded pieces. [CC](https://stacks.math.columbia.edu/download/coherent.pdf), §8, Lemma 8.1, pp.16–17. Positive projective-space monomials have the indicated basis and rank.

#### Hilbert–Serre over Artinian coefficients

For an Artinian ring A, a standard graded finite-type A-algebra B generated by e degree-one elements, and a finitely generated graded B-module M, each graded piece has finite A-length. The Laurent series Σ_d length_A(M_d)T^d equals h(T)/(1-T)^e for a Laurent polynomial h with integer coefficients. Consequently d↦length_A(M_d) agrees for d≫0 with a rational polynomial taking integer values at integers. Shifting to nonnegative indices identifies this polynomial with the pinned Polynomial.hilbertPoly; exact sequences add the polynomials.

Proposed theorem interface: `hilbertSerre`.

**Hypotheses.** Artinian A, finite graded M, standard degree-one grading; arbitrary positive weights require a different denominator and generally give a quasi-polynomial.

**Proof route.** Induct on the e generators using the exact sequence for multiplication by the last generator, including its kernel and cokernel. They are finite graded modules over e−1 generators; A-length additivity yields (1-T)H_M=H_coker−T H_kernel.

After a finite shift, use the native coefficient formula for h/(1-T)^e to obtain the eventual polynomial. Negative degrees contribute only a Laurent shift; finite lengths are proved before converting them to natural numbers.

**Acceptance.** A[x] has constant graded length length_A(A); a generator of weight two does not meet the standard-grading hypothesis.

**Prerequisites.** [Finite graded pieces and homogeneous ranks](#finite-graded-pieces-and-homogeneous-ranks), `mathlib:Module.length`, `mathlib:Module.length_eq_add_of_exact`, `mathlib:Polynomial.hilbertPoly`, `mathlib:Polynomial.coeff_mul_invOneSubPow_eq_hilbertPoly_eval`.

**Sources.** [SA](https://stacks.math.columbia.edu/download/algebra.pdf), §58, Proposition 58.7 and proof, pp.136–137. Successive degree-one multiplication exact sequences make the graded class function eventually polynomial; applying finite Artinian length gives the required numerical specialization.

#### The geometric Hilbert polynomial

For a projective k-scheme X, an ample invertible L, and a coherent sheaf F, define P_(F,L)∈Q[t] by P(m)=χ(X,F⊗L^m) for every integer m, where χ is the finite alternating sum of cohomology dimensions. This agrees with the eventual section-dimension polynomial. Short exact sequences add P, tensoring F by L^a replaces P(t) by P(t+a), and extension of k preserves P. If L is very ample, dim support F is the degree of P for nonzero F, and r! times its leading coefficient is its positive degree.

**Hypotheses.** k a field; projective X and coherent F; ample L. For degree relative to an embedding take very ample L. The zero sheaf has zero polynomial and is treated separately.

**Proof route.** For very ample L, embed X into Pⁿ and apply Hilbert–Serre to a finite graded module whose associated sheaf is i_*F. Serre B identifies sufficiently high sections with graded pieces.

Import the proper-scheme multivariable Euler polynomial requested from SF.5: it has degree at most dim support F for arbitrary integer powers of any invertible sheaves. Its meromorphic-section finite-difference proof gives existence without requiring a hyperplane for L itself. For ample L, Serre B identifies it with section dimensions at all sufficiently large m. Uniqueness then identifies it with the graded Hilbert polynomial when L is very ample.

Use the native truncated Euler characteristic only after proving finite-dimensionality and a cohomological vanishing cutoff; extend the field using the Čech/base-change comparison.

**API.**

- `hilbertPolynomial.eval_euler`: For every integer m and any valid cohomological cutoff, evaluation at m equals the native finite alternating Euler sum.
- `hilbertPolynomial.add`: A short exact sequence of coherent sheaves adds Hilbert polynomials.
- `hilbertPolynomial.twist`: Twisting by L^a translates the variable by a.

**Unit tests.**

- `HilbertPolynomialTests.zero` (degenerate): The zero sheaf has polynomial 0.
- `HilbertPolynomialTests.projectiveLine` (computation): O_P¹(a) has polynomial t+a+1, not just its large-t values.
- `HilbertPolynomialTests.projectivePoint` (compatibility): The structure sheaf of Spec k has polynomial 1.

**Consumers.** R09.2 Hilbert/Quot functors; GGK §3.1; LLHLM23 Z.68: Fix the Euler, finite-length and degree conventions used to select finite polynomial strata.

**Acceptance.** P_(O_P¹(a),O(1))(t)=t+a+1 for all integer arguments, including negative ones; P of a rational point is 1.

**Prerequisites.** [Hilbert–Serre over Artinian coefficients](#hilbertserre-over-artinian-coefficients), [Absolute Serre A and B](#absolute-serre-a-and-b), [All cohomology of projective-space twists](#all-cohomology-of-projective-space-twists), `tauceti:AlgebraicGeometry.Scheme.Modules.eulerCharBelow`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, [Very ample high powers and fixed twists](#very-ample-high-powers-and-fixed-twists), `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.5/first-chern`, `SchemeAndStackFoundations:SF.5/degree`.

**Sources.** [GR](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), §2, exposé p.5 (collected p.253), before Theorem 2.1. Hilbert polynomial is the Euler polynomial and high twists reduce it to section dimensions. [NI](https://arxiv.org/pdf/math/0504590), §2, pp.9–10, definitions preceding Lemma 2.1. The numerical polynomial controls high twist cohomology and regularity. [SA](https://stacks.math.columbia.edu/download/algebra.pdf), §58, Proposition 58.7, p.137. The graded polynomial supplies the algebraic existence input. [SV](https://stacks.math.columbia.edu/download/varieties.pdf), §45, Lemmas 45.1–45.2 and Definition 45.10, pp.101–104; tags 0BEM,0BEN,0BEW. The proper Euler polynomial exists at all integer powers; the top coefficient agrees with mixed intersection degree. This lower-tier intersection-theory input is requested, not rebuilt.

#### Hilbert polynomials in a Noetherian family

For projective X→S with S Noetherian, a relatively very ample L and coherent F, the geometric-fibre Hilbert polynomials form a finite set. If F is S-flat, the polynomial is locally constant on S. Without flatness, there is a finite stratification by reduced locally closed pieces on which the restriction is flat and the polynomial constant; this assertion is not universal flattening-stratum representability.

Proposed theorem interface: `familyHilbertPolynomials`.

**Hypotheses.** Noetherian includes quasi-compactness here. Coherent F; flatness only for local constancy on all of S.

**Proof route.** For flat F, coherent cohomology and base change or a finite complex computing cohomology make χ(F_s(m)) locally constant for each m; finitely many evaluations determine its polynomial.

For general F, take finitely many generic flat opens of the irreducible components using SF.4 generic flatness, make their union into disjoint locally closed strata, and repeat on the closed complement by Noetherian induction. This yields finitely many flat finite-type families and hence finitely many polynomials.

**Acceptance.** A flat family of rational points has constant polynomial 1; a coherent sheaf supported on one special fibre need not have a locally constant polynomial.

**Prerequisites.** [The geometric Hilbert polynomial](#the-geometric-hilbert-polynomial), `SchemeAndStackFoundations:SF.4/generic-flatness`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources.** [GR](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), §2, exposé p.5 (collected p.253), before Theorem 2.1. Flat fibre polynomials are constant on connected components; general coherent families have finitely many polynomials. [NI](https://arxiv.org/pdf/math/0504590), §4, Lemma 4.1 and Theorem 4.2, pp.18–19. Generic freeness gives the flat opens needed by the Noetherian-induction proof.

#### Castelnuovo–Mumford regularity

A coherent F on Pⁿ_k is m-regular, for an integer m, if H^i(Pⁿ,F(m−i))=0 for every i>0. Then F is r-regular for every r≥m; H^i(F(r))=0 for r≥m−i and i>0; F(r) is globally generated for r≥m; and H⁰(F(r))⊗H⁰(O(1))→H⁰(F(r+1)) is surjective for every r≥m.

**Hypotheses.** k any field; coherent sheaf on projective space; all positive cohomological degrees, with above-dimension vanishing.

**Proof route.** Extend faithfully to an infinite field if needed, preserving and reflecting cohomological vanishings and surjectivity. Choose a hyperplane avoiding the associated points of F.

Use 0→F(t−1)→F(t)→F|_H(t)→0 and induction on n to propagate the vanishings and multiplication surjectivity. Serre generation in high degrees and the surjective multiplication maps descend global generation to degree m.

**API.**

- `IsCMRegular.monotone`: m-regular implies r-regular whenever m≤r.
- `IsCMRegular.vanish`: For i>0 and r≥m−i, H^i(F(r)) vanishes.
- `IsCMRegular.multiplication`: For r≥m, multiplication of degree-r sections by linear forms is surjective.

**Unit tests.**

- `RegularityTests.structureSheaf` (computation): O_Pⁿ is 0-regular.
- `RegularityTests.lineBundle` (non-example): On P¹, O(a) is m-regular iff a+m≥0; O(-2) is not 1-regular.
- `RegularityTests.zero` (degenerate): The zero sheaf is m-regular for every integer m.

**Consumers.** R09.2 Quot embeddings and R09.7b bounded coherent presentations: Replace cohomological vanishings by a testable integer bound before using a fixed Grassmannian.

**Acceptance.** O_P¹(a) is m-regular exactly when a+m≥0; the zero sheaf is regular for every m.

**Prerequisites.** [All cohomology of projective-space twists](#all-cohomology-of-projective-space-twists), [Absolute Serre A and B](#absolute-serre-a-and-b), [Multiplication on twist cohomology](#multiplication-on-twist-cohomology), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

**Sources.** [NI](https://arxiv.org/pdf/math/0504590), §2, Definition 2.1 and Lemma 2.1, pp.9–10. Regularity gives higher vanishings, generation and multiplication surjectivity over all fields.

#### Uniform regularity for fixed quotients

Fix a field k, a coherent E on Pⁿ_k and a numerical polynomial P. There is an integer m₀ such that every quotient E_K→F on Pⁿ_K with Hilbert polynomial P, over every extension field K/k, has both F and its kernel m₀-regular. The same statement holds for a finite set of polynomials with a common maximum. There is no analogous uniform bound for arbitrary coherent sheaves with fixed P and no fixed quotient ambient E.

Proposed theorem interface: `uniformQuotientRegularity`.

**Hypotheses.** Fixed E and P; coherent quotient and kernel; no characteristic-zero hypothesis.

**Proof route.** Choose a fixed surjection O(-b)^p→E using Serre A. For a quotient F, its kernel J inside O(-b)^p has fixed polynomial p P_O(-b)−P.

Apply the hyperplane induction of Nitsure Theorem 2.3 to J(b)⊂O^p. For t beyond the restriction bound, all H^i(J(t)) with i≥2 vanish and h¹(J(t)) strictly decreases while nonzero. Bound h¹ by p binomial(n+t,n)−P_J(t), with the minus sign.

Use the corrected index m₂=m₁+h¹(J(m₁))+1 to obtain regularity, then the exact sequences for J, F, and the fixed kernel of O(-b)^p→E. Take a maximum for a finite set of polynomials.

**Acceptance.** On P¹, O(a)⊕O(-a) has polynomial 2(t+1) and regularity at least a for a≥0: fixed polynomial alone is insufficient.

**Prerequisites.** [Castelnuovo–Mumford regularity](#castelnuovomumford-regularity), [The geometric Hilbert polynomial](#the-geometric-hilbert-polynomial), [Absolute Serre A and B](#absolute-serre-a-and-b).

**Sources.** [NI](https://arxiv.org/pdf/math/0504590), §2, Theorem 2.3 and proof, pp.10–13. Fixed polynomial subsheaves of a fixed free sheaf have uniform regularity; twisting and kernels give the quotient formulation. [AL](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-8-19-24.pdf), §1.3, Theorem 1.3.8 proof, pp.57–58, with recorded sign correction. The numerical h¹ bound is corrected before it is used.

#### Uniform relative regularity and high-twist base change

For a coherent S-flat F on Pⁿ_S with S Noetherian, there is m₀ such that every geometric fibre F_s is m₀-regular. For m≥m₀, higher direct images vanish, π_*F(m) is finite locally free and commutes with arbitrary base change, evaluation is surjective, and multiplication π_*F(m)⊗π_*O(1)→π_*F(m+1) is surjective. A fixed coherent E on Pⁿ_S and fixed fibre polynomial P give a uniform regularity bound for all coherent quotients of E_s on geometric fibres, also without assuming E is flat.

Proposed theorem interface: `familyRegularity`.

**Hypotheses.** Noetherian base for a global finite bound; flat F for locally free pushforward and arbitrary cohomological base change.

**Proof route.** On a finite affine base cover, Serre A gives a fixed O(-b)^p surjection onto E. Family Hilbert polynomials are finite; apply the free-subsheaf bounds to the kernels using those finitely many polynomials and take a maximum.

Apply this to F and use the imported coherent cohomology/base-change theorem: fibrewise higher vanishing yields finite locally free high pushforward and arbitrary base change. Surjectivity of evaluation and multiplication follows fibrewise, then by Nakayama.

**Acceptance.** The high pushforward rank is P(m); omit flatness and it may jump.

**Prerequisites.** [Uniform regularity for fixed quotients](#uniform-regularity-for-fixed-quotients), [Hilbert polynomials in a Noetherian family](#hilbert-polynomials-in-a-noetherian-family), [Castelnuovo–Mumford regularity](#castelnuovomumford-regularity), [Relative Serre A and B](#relative-serre-a-and-b), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources.** [NI](https://arxiv.org/pdf/math/0504590), §2, Theorem 2.3, pp.10–13; §4, Theorem 4.2, p.19. Uniform field regularity combines with finitely many Noetherian family polynomials. [GR](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), §2, Theorem 2.1 corrected by the 1962 erratum, exposé p.6 and erratum p.302. Fixed quotients and finitely many polynomials are the exact bounded-family conditions.

### Cycle parameters and numerical boundedness

#### Chow parameters and their universal support

For an algebraically closed field k of characteristic zero, integers 0≤r≤n and D≥1, construct the projective Chow coefficient scheme Ch_(r,D)(Pⁿ_k), using the reduced closed locus of multihomogeneous associated forms of degree D in each of r+1 hyperplane blocks. Its k-points are in bijection with effective pure r-cycles of degree D, with multiplicities; their Chow forms are unique up to scalar. Degree 0 is a single zero-cycle parameter. There is a closed universal support in Ch×Pⁿ whose geometric fibre has exactly the support of the corresponding cycle, as a set. Cycles supported in a fixed closed Y⊂Pⁿ give a closed coefficient locus. This construction does not assert a flat family of subschemes or representation of the cycle functor over arbitrary nonreduced bases.

**Hypotheses.** Algebraically closed characteristic-zero field for this Chow construction and the reduced generic-fibre arguments used below. A pure cycle is a finite sum Σ a_i[Z_i] with a_i>0, dim Z_i=r; degree is Σa_i deg Z_i. Native AlgebraicCycle with natural coefficients stores the multiplicities at generic points.

**Proof route.** Put the Chow forms in the finite projective space of coefficients of degree D in each block. The associated form of a cycle is the product of the irreducible components’ forms to their multiplicities; generic hyperplane intersection determines the component and its multiplicity uniquely.

Follow Chow–van der Waerden Satz 2: introduce projective factors describing the generic intersection points, impose coefficient identities for the linear factorization, impose incidence and the condition that every hyperplane through a factor point vanishes. Projective elimination of the factor coordinates, then comparison of coefficients in generic hyperplane variables, gives finitely many homogeneous equations. Take the reduced closed locus.

For universal support use Satz 3: parameterize hyperplanes through a point by skew-symmetric coefficients, substitute them into the form, and set every resulting coefficient equal to zero. This proves fibre support equality, without asserting the fibre is reduced. For support in Y add the homogeneous equations of Y on the factor points before projective elimination.

**API.**

- `chowParameters.cycle`: A geometric parameter determines its effective pure cycle, including multiplicities.
- `chowParameters.fromCycle`: The associated form gives the parameter of every effective pure cycle with the specified degree.
- `chowParameters.cycle_fromCycle`: Recover the cycle from its associated-form parameter; parameter equality is equivalent to cycle equality.
- `chowParameters.support`: A closed support subscheme of Ch×Pⁿ, with the stated geometric support equality.

**Unit tests.**

- `ChowTests.zeroDegree` (degenerate): Degree 0 is a single parameter with cycle 0 and empty support.
- `ChowTests.hyperplanes` (compatibility): Ch_(n−1,1)(Pⁿ) is the dual Pⁿ; for n=1 these are points of P¹.
- `ChowTests.multiplicity` (non-example): Doubling a degree-one hyperplane gives multiplicity 2 and degree 2, even though its support equals that of the original hyperplane.

**Consumers.** GGK §3.1 and DMY §2.5: Supply finite projective cycle parameter spaces and closed support, without asserting Hilbert/Chow functor representability on all bases.

**Acceptance.** Degree-one hypersurfaces give the dual projective space; a doubled hyperplane gives the square of its linear form; degree-zero has empty support.

**Prerequisites.** [Projective bundles from relative Proj](#projective-bundles-from-relative-proj), [All cohomology of projective-space twists](#all-cohomology-of-projective-space-twists), [Finite graded pieces and homogeneous ranks](#finite-graded-pieces-and-homogeneous-ranks), `mathlib:AlgebraicGeometry.AlgebraicCycle`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources.** [CW](https://gdz.sub.uni-goettingen.de/id/PPN235181684_0113?tify={%22pages%22:[696]}), §1, Satz 1, pp.695–697; Satz 2, p.698; Satz 3, p.699; §2, p.700. Generic linear factors characterize Chow forms; homogeneous elimination produces the projective coefficient locus and the closed universal support. [FL](https://math.berkeley.edu/~scanlon/papers/differential-chow-varieties-22apr15.pdf), §3, Definition 3.1, pp.13–14. The associated form of a cycle retains component multiplicities. [AL](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-8-19-24.pdf), §1.4.5, p.64. Chow parameters must not be promoted to a universal arbitrary-base cycle functor.

#### Bounded degree gives finitely many Hilbert polynomials

For a fixed projective complex scheme X with a fixed very ample embedding in Pⁿ and integers r,D, only finitely many Hilbert polynomials occur among reduced pure r-dimensional closed subschemes Y⊂X of degree at most D. More generally Grothendieck Lemma 2.4 gives this finiteness for reduced equidimensional geometric-fibre subschemes of a fixed projective Noetherian family with a fixed relatively very ample embedding. Reducedness and purity are part of the assertion; the Chow cycle does not record arbitrary embedded structure.

Proposed theorem interface: `boundedDegreeHilbertPolynomials`.

**Hypotheses.** Reduced pure dimension r; fixed embedding; geometric fibres in the family formulation; Noetherian projective ambient family.

**Proof route.** For each degree 1,…,D use Chow’s finite-type projective coefficient space and universal support. On each irreducible parameter component, take the reduced support over its generic field. Spread its finite equations to a dense open, use generic flatness, and shrink until its fibres are geometrically reduced.

The generic support is geometrically reduced in characteristic zero. The closed support coefficient conditions identify its geometric support with the original cycle; reduced fibres are therefore exactly the reduced subschemes represented by those supports. Repeat on the proper closed complement by Noetherian induction. This proves finitely many finite-type reduced families in the complex case.

Apply family Hilbert-polynomial finiteness to these families. For the full arbitrary-field relative version the source’s bounded-family Lemma 2.4 is an explicit additional input: its proof, including positive-characteristic generic reduction and relative coefficient descent, remains a recorded gap rather than being inferred from the complex case.

**Acceptance.** Nonreduced embedded zero-dimensional structure cannot be discarded while computing a Hilbert polynomial.

**Prerequisites.** [Chow parameters and their universal support](#chow-parameters-and-their-universal-support), [Hilbert polynomials in a Noetherian family](#hilbert-polynomials-in-a-noetherian-family), `SchemeAndStackFoundations:SF.4/generic-flatness`, [The geometric Hilbert polynomial](#the-geometric-hilbert-polynomial), `SchemeAndStackFoundations:SF.4`.

**Sources.** [GR](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), §2, Lemma 2.4, exposé p.7 (collected p.255). Reduced equidimensional geometric-fibre subschemes of bounded degree form a bounded family; the exposé states the Chow input without a proof. [GG](https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf), §3.1, p.198. A Noetherian projective family has only finitely many such polynomials for bounded-degree reduced irreducible subschemes. [MM](https://stacks.math.columbia.edu/download/more-morphisms.pdf), §24, Lemmas 24.4,24.6, pp.68–70 and §26, Lemma 26.4, pp.75–76. Generic reduction and scheme-theoretic density spread to geometrically reduced fibres after shrinking; characteristic zero makes a reduced generic support geometrically reduced.

#### Open Chow loci and embedding-independent degree bounds

Let Y be a complex variety open and dense in its fixed projective closure Ybar. In the finite union Ch(Ybar,r,≤D), the cycles whose support meets Y form an open locus. This means at least one component meets Y; it differs from requiring every component to avoid the boundary. For two fixed projective embeddings of Ybar, a degree bound in one induces a degree bound in the other, separately for each r. Thus the collection of bounded-degree cycles is independent of the embedding up to change of the numerical bound.

Proposed theorem interface: `chowOpenAndEmbedding`.

**Hypotheses.** Y locally closed; first replace Ybar by its closure so Y is open there. Fixed finite-type projective closure and fixed dimensions.

**Proof route.** The complementary locus is the closed Chow locus of cycles supported in Ybar minus Y, obtained by the support-in-closed construction. Use its complement for the support-meets-open condition.

For very ample L₁,L₂, choose m so A=L₁^m tensor L₂ inverse is very ample. The imported mixed intersection numbers are positive for ample factors, and multilinearity expands (m c₁(L₁))^r=(c₁(L₂)+c₁(A))^r. Every term is nonnegative, so deg_L₂ Z≤m^r deg_L₁ Z for each integral r-component. Add component multiplicities and reverse the roles for the other bound. No informal comparison of chosen hyperplanes is needed.

**Acceptance.** A cycle Z₁+Z₂ with Z₁ in the boundary and Z₂ meeting Y belongs to the DMY open; it fails the all-components condition.

**Prerequisites.** [Chow parameters and their universal support](#chow-parameters-and-their-universal-support), [Very ample high powers and fixed twists](#very-ample-high-powers-and-fixed-twists), [The geometric Hilbert polynomial](#the-geometric-hilbert-polynomial), `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.5/first-chern`, `SchemeAndStackFoundations:SF.5/chern-commutation`, `SchemeAndStackFoundations:SF.5/degree`.

**Sources.** [DM](https://arxiv.org/pdf/2405.17343v3), §2.5, p.7. The open support-meets-Y Chow locus and the change-of-embedding boundedness are the routed inputs. [FL](https://math.berkeley.edu/~scanlon/papers/differential-chow-varieties-22apr15.pdf), §3, Proposition 3.4, p.15. The affine-cycle condition requires no component supported at infinity, a different condition from merely meeting the open. [SV](https://stacks.math.columbia.edu/download/varieties.pdf), §45, Definition 45.3 and Lemmas 45.4–45.9 and Definition 45.10, pp.103–104. Integer mixed intersections are multilinear and positive for ample bundles.

#### Numerical very-ampleness bound

For each dimension d≥1 and integers v>0,w, there is m₀(d,v,w) such that for every smooth projective complex d-fold X and ample L with L^d=v and K_X·L^(d−1)=w, every L^m with m≥m₀ is very ample. There are bounds for h⁰(X,L^m₀) depending only on these numerical data. The result includes the K_X trivial case w=0 used by Charles; it is a uniform numerical assertion, not Serre’s bound for one fixed X.

Proposed theorem interface: `numericalVeryAmpleness`.

**Hypotheses.** d≥1; X a smooth projective complex variety (geometrically integral), ample L, fixed dimension and the two displayed intersection numbers. Intersection products and the canonical bundle are imported lower foundational geometry interfaces.

**Proof route.** Use the corrected algebraic Kollár–Matsusaka Riemann–Roch inequalities to bound the Hilbert polynomial coefficients and the very-ampleness index from d,v,w. This is the precise proof input not yet obtained in a cleared readable source. Once L^m₀ is very ample, its nondegenerate complete embedding has h⁰≤m₀^d v+d, by the degree bound for a nondegenerate projective d-fold.

Siu Theorem 0.1 confirms the numerical scope but its analytic proof is not imported through the higher-tier complex-comparison roadmap. Keep the algebraic proof gap explicit.

**Acceptance.** Fixing one ample variety gives Serre very ampleness but does not establish a numerical bound uniform over all varieties.

**Prerequisites.** [Very ample high powers and fixed twists](#very-ample-high-powers-and-fixed-twists), [The geometric Hilbert polynomial](#the-geometric-hilbert-polynomial), [Uniform regularity for fixed quotients](#uniform-regularity-for-fixed-quotients), `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.5/first-chern`, `SchemeAndStackFoundations:SF.5/degree`, `SchemeAndStackFoundations:SF.4`.

**Sources.** [SI](https://www.numdam.org/item/AIF_1993__43_5_1387_0.pdf), Introduction, Theorem 0.1, pp.1387–1388. The two intersection numbers and dimension control an effective very-ampleness exponent; only the statement and scope were read. [CH](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §3, Lemma 3.5 proof, p.507. The K-trivial specialization is the numerical boundedness input used in the routed paper. [SM](https://stacks.math.columbia.edu/download/morphisms.pdf), §35, Lemma 35.12 and Definition 35.13, p.70. For smooth pure relative dimension d, the cotangent sheaf is finite locally free of rank d; its supplier determinant is the canonical line.

#### Bounded smooth polarizations with trivial canonical bundle

Fix n≥1 and r>0. Smooth projective complex varieties X of dimension 2n with K_X trivial and an ample L satisfying L^(2n)=r form a bounded family of underlying varieties. A uniform power L^m embeds them into one fixed P^N with bounded degree, hence only finitely many Hilbert polynomials and finitely many finite-type parameter families are required. The Hilbert-scheme representation producing the final parameter families is imported by the consumer from R09.2, not constructed here.

Proposed theorem interface: `smoothPolarizedBoundedness`.

**Hypotheses.** Ample L, not merely big; K_X trivial; fixed dimension and top self-intersection. This is a complex geometric family statement, not descent of L over a smaller field.

**Proof route.** Apply the numerical theorem with w=0 to get a uniform very ample exponent and section-dimension bound. Increase the ambient dimension to one N by padding the section basis. The degree becomes m^(2n)r.

Apply the reduced bounded-degree polynomial theorem. The remaining passage from finitely many polynomials to Hilbert families is the R09.2 target, and no circular dependence on R09.2 is needed for the polynomial conclusion here.

**Acceptance.** The degree of the embedding by L^m is m^(2n)r; forgetting this exponent gives the wrong bound.

**Prerequisites.** [Numerical very-ampleness bound](#numerical-very-ampleness-bound), [Bounded degree gives finitely many Hilbert polynomials](#bounded-degree-gives-finitely-many-hilbert-polynomials), [The geometric Hilbert polynomial](#the-geometric-hilbert-polynomial).

**Sources.** [CH](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §3, Lemma 3.5 and proof, pp.507–508. Fixed dimension and polarization intersection for trivial canonical bundle yield bounded embeddings and a bounded family.

#### Birational degree bounds in a fixed big family

Let f:X→S be a flat projective family of geometrically integral complex varieties over a finite-type complex base and L an invertible sheaf whose restriction to each fibre is big. There are a,N,d such that for every fibre the complete linear system |L_s^a| gives a rational map birational onto its image, h⁰(X_s,L_s^a)≤N, and the image has degree at most d. Base points are allowed. These constants depend on the family, and this theorem does not assert that L_s^a is ample or that the map is a closed immersion. Bigness uses the imported SF.5 componentwise section-growth definition; no new big-line predicate is introduced.

Proposed theorem interface: `bigFamilyBirationalBounds`.

**Hypotheses.** Fixed finite-type complex family; geometrically integral fibres and fibrewise bigness; no arbitrary numerical boundedness inference for big L.

**Proof route.** On an irreducible reduced base, fibrewise bigness supplies a countable union of loci where some section system is birational. Uncountability of C, proved algebraically by induction on dimension using finite morphisms to affine space, implies one such system works generically. Spread the rational inverse and finitely many section relations to a dense open.

Choose an exponent all of whose positive multiples give a birational map on that open; generic freeness and cohomological base change control sections. Induct on the proper closed complement, then choose a common positive multiple of the exponents for the finitely many strata.

Upper semicontinuity bounds h⁰ globally. On each stratum spread the graph of the rational map, shrink to a flat image family, and use finite Hilbert polynomials to bound its degree; repeat on complements. This retains a rational map, and does not replace bigness by very ampleness.

**Acceptance.** A big line bundle with a fixed base divisor still gives the rational-map conclusion and fails a claimed everywhere embedding conclusion.

**Prerequisites.** [Hilbert polynomials in a Noetherian family](#hilbert-polynomials-in-a-noetherian-family), `SchemeAndStackFoundations:SF.4/generic-flatness`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, [The geometric Hilbert polynomial](#the-geometric-hilbert-polynomial), `SchemeAndStackFoundations:SF.5/big-line`.

**Sources.** [CH](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), §3, Lemma 3.6 and proof, p.508. In a Noetherian complex projective family with fibrewise big L, a fixed exponent gives birational maps and bounded sections/image degree; this plan supplies an algebraic uncountability step instead of an upward analytic import.

### Rank, incidence and semilinear equations

#### Scheme-theoretic determinantal rank loci

For a map φ:E→F of finite locally free sheaves, the rank≤r closed subscheme is defined locally by all (r+1)-minors, equivalently by the vanishing of ∧^(r+1)φ. These ideals are independent of bases and glue, and their formation commutes with arbitrary base change. A T→S factors through the locus iff every pulled-back minor is zero in O_T, not merely zero at its geometric points. For a rank-a to rank-b map and r≥min(a,b), the locus is all of S.

**Hypotheses.** Finite locally free domain and codomain; integer r≥0. The ideal convention includes zero-size and impossible-minor cases.

**Proof route.** Construct the ideal generated by the specified minors using the native matrix determinant. Cauchy–Binet under change of basis proves invariance and ideal gluing.

Ideal extension commutes with the polynomial determinant formulas, proving arbitrary base change and the scheme-valued factorization test. Native closed immersions preserve the nilpotent equations.

**API.**

- `rankLocus.minor_mem`: Every selected (r+1)-minor lies in the defining ideal.
- `rankLocus.factor_iff`: A ring map kills the ideal iff it kills every selected minor.
- `rankLocus.baseChange`: The ideal of the base-changed matrix is the extended ideal.

**Unit tests.**

- `RankLocusTests.oneByOne` (computation): For [t] and r=0 the ideal is (t).
- `RankLocusTests.fullRankBound` (degenerate): For r=min(a,b) there are no minors and the ideal is 0.
- `RankLocusTests.nilpotent` (non-example): For nonzero square-zero ε, the ideal (ε) is nonzero although every geometric rank test gives zero.

**Consumers.** Lawrence–Venkatesh bad-position loci and R09.7a/d crystalline deformation parameters: Impose exact rank equations on families including infinitesimal coefficient rings.

**Acceptance.** For [t], rank≤0 is V(t). For ε≠0 with ε²=0, [ε] has rank≤0 on every field point but the closed scheme V(ε) is a proper closed subscheme.

**Prerequisites.** `mathlib:Matrix.det`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`.

**Sources.** [GO](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), §5, graph charts and Plücker coordinates, pp.58–60. Determinantal coordinates describe the quotient and its incidence rank conditions over arbitrary coefficient rings.

#### Closed intersection-dimension incidences

Let E have finite locally free rank n on S and 0≤a,b≤n. In Gr_(n−a)(E)×_S Gr_(n−b)(E), the locus dim(U∩W)≥k on geometric fibres has its canonical closed scheme structure as rank(U→E/W)≤a−k. For k=0 it is the full relative product; for k>min(a,b) it is empty. The construction commutes with arbitrary base change. Over nonfields the rank-equation scheme, rather than the rank of a possibly nonflat intersection module, is the definition.

**Hypotheses.** Admissible subbundle ranks a,b; locally free quotients; k≥0 with the impossible-bound convention specified separately.

**Proof route.** Pull the universal subbundles and quotients to the relative product and form U→E/W. Use the determinantal construction for 1≤k≤min(a,b), the full product for k=0, and the empty scheme for impossible k.

Over a field, exactness of 0→U∩W→U→E/W identifies kernel dimension a−rank and proves the fibre description.

**API.**

- `incidenceLocus.inclusion`: The inclusion into the relative product of the two Grassmann schemes.
- `incidenceLocus.isClosedImmersion`: The incidence inclusion retains the defining determinantal ideals.
- `incidenceLocus.baseChange`: Pullback carries the incidence scheme and its inclusion to the corresponding scheme for the pulled-back E.

**Unit tests.**

- `IncidenceTests.zeroBound` (degenerate): k=0 gives the entire relative product.
- `IncidenceTests.lines` (computation): Two lines in k² meet in dimension at least one exactly when equal.
- `IncidenceTests.impossible` (non-example): k>min(a,b) gives the empty scheme.

**Consumers.** Lawrence–Venkatesh parameter positions and R09.7 flag/rank constraints: Replace pointwise inequalities by projective closed incidence correspondences.

**Acceptance.** For two lines in k², dim intersection≥1 iff the lines agree.

**Prerequisites.** [Grassmannians of finite-type coherent quotients](#grassmannians-of-finite-type-coherent-quotients), [Scheme-theoretic determinantal rank loci](#scheme-theoretic-determinantal-rank-loci), `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`.

**Sources.** [GO](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), §5, Proposition 5.16, pp.61–62; graph coordinates pp.58–59. Nested flags are the zero-map incidence case; general intersection dimension is the associated determinantal rank condition.

#### Absolute-Frobenius stability equations

On a characteristic-p scheme X with finite locally free E, write F_X for absolute Frobenius and let Φ:F_X*E→E be an O_X-linear map. On a Grassmann parameter scheme G carrying universal U⊂E_G and Q=E_G/U, equip the pulled-back bundle with the induced Frobenius-linear map, using the natural square F_X∘π=π∘F_G. The Frobenius-stable locus is the zero scheme of F_G*U→F_G*E_G→E_G→Q. It is a closed subscheme of G; a G-valued family factors through it exactly when this composite is the zero sheaf map. Absolute-Frobenius naturality gives arbitrary characteristic-p base-change compatibility. It is distinct from the imported O-linear invariant locus.

**Hypotheses.** p prime; characteristic-p schemes and absolute Frobenius; locally free U and Q. Φ need not be invertible; an invertible Φ models the étale case.

**Proof route.** Absolute-Frobenius naturality and module-pullback composition transport π*Φ to the universal parameter scheme. Pull back the inclusion of U before composing with Φ and the quotient.

In finite free charts the coefficients of this map are equations. Glue the zero ideals by their map characterization; their pullback computes exactly the base-changed equations.

On a line graph (1,t) and Φ the identity in a trivialized Frobenius pullback, the equation is t^p−t=0, demonstrating why an ordinary linear invariant locus would be wrong.

**API.**

- `frobeniusStableLocus.inclusion`: The zero-scheme inclusion into the parameter scheme.
- `frobeniusStableLocus.isClosedImmersion`: The inclusion is a closed immersion.
- `frobeniusStableLocus.equation`: After pulling back the universal subbundle and applying Φ, the quotient composite is zero.
- `frobeniusStableLocus.maximal`: Every morphism on which this pulled-back composite vanishes factors uniquely through the zero scheme.
- `frobeniusStableLocus.graphEquation`: In the rank-two line-graph chart, with Φ matrix [[a,b],[c,d]], the zero-map equation is c+d t^p-t(a+b t^p)=0, since the Frobenius-pulled line has generator (1,t^p).

**Unit tests.**

- `FrobeniusTests.zeroOperator` (degenerate): For Φ=0 the stable locus is the entire Grassmannian.
- `FrobeniusTests.identityChart` (computation): On a line graph in rank two with semilinear identity coefficients, the equation is t^p−t=0.
- `FrobeniusTests.nonFixedCoefficient` (non-example): If t^p≠t, its graph is excluded even though the ordinary identity linear operator preserves it.

**Consumers.** R05 semilinear moduli, R09.7a crystalline parameters and LLHLM23 height constraints: Keep the Frobenius pullback and coefficient endomorphism explicit when forming closed stability equations.

**Acceptance.** The zero operator stabilizes every subbundle; identity semilinear coefficients on line graphs impose t^p=t.

**Prerequisites.** [Grassmannians of finite-type coherent quotients](#grassmannians-of-finite-type-coherent-quotients), `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp`, `mathlib:AlgebraicGeometry.IsClosedImmersion`, [Scheme-theoretic determinantal rank loci](#scheme-theoretic-determinantal-rank-loci).

**Sources.** [GO](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), §5, Lemma 5.8, pp.58–59. Graph coordinates make the semilinear pullback formula an explicit polynomial zero-map condition; this is an extension of the graph method, not a quoted Frobenius theorem.

#### Coefficientwise Frobenius in finite lattice cutoffs

For the arithmetic operation on R((u)) that fixes every coefficient of R and sends u to u^p, a finite lattice cutoff expresses stability by the ordinary coefficient-linear composite U→V→V/U, after choosing a sufficiently large target cutoff. It is represented by the imported 0G invariant/zero-map locus, with relations for the changed u-exponents. This operation is not absolute Frobenius on R: the graph coefficient t is fixed, rather than sent to t^p. Determinantal bounds on the cutoff and nestedness use the rank and flag constructions separately.

Proposed theorem interface: `coefficientFrobeniusLattice`.

**Hypotheses.** Finite truncations with explicit source and target bounds ensuring τ maps source to target; base R has characteristic p for the arithmetic use but τ|R=id. No claim of a single cutoff representing all unbounded lattices.

**Proof route.** Describe τ on the finite monomial basis by u^j↦u^(pj); its matrix entries are 0 or 1 and it is R-linear. If source and target truncations differ, use the corresponding two quotient Grassmannians and their zero-map incidence.

Apply the imported 0G O-linear invariant-locus construction when the same cutoff is preserved. Use larger target quotients otherwise; no new Grassmann representability is required.

**Acceptance.** Over R with t^p≠t the coefficient-fixing operation does not replace t by t^p; confusing it with absolute Frobenius gives the wrong family.

**Prerequisites.** `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`, [Closed intersection-dimension incidences](#closed-intersection-dimension-incidences), [Partial flag bundles](#partial-flag-bundles), [Scheme-theoretic determinantal rank loci](#scheme-theoretic-determinantal-rank-loci).

**Sources.** [GO](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), §5, Lemma 5.8 and Proposition 5.16, pp.58–59,61–62. Graph matrices and zero-map incidence provide the finite coefficient-linear construction; the u-exponent comparison is the explicit arithmetic specialization.

## Prototype scope

The companion suggested file uses the native scheme, sheaf, invertible-sheaf, cohomology, polynomial, cycle, ideal and module-Grassmannian carriers. Every definition, API item and test named above has a signature or example there. Some supplier hypotheses cannot yet be written with the pinned APIs; their omission is explicitly documented in the file and in this table. The mathematical statements above retain them.

| Interface family | Prototype omission or restriction |
| --- | --- |
| Projective bundles, twists and quotients | Native quasi-coherence and invertible quotient maps are present. Finite-type/finite-presentation and supplier tensor-power/coherence conditions are omitted where absent. The rank-two test compares actual points over the base with the native quotient Grassmannian. |
| Projective twist cohomology | The proposed all-degree comparison uses an explicitly supplied basis type; its identification with the Laurent exponent set is omitted. The higher-direct-image/symmetric-power interface is unavailable, so relativeBundleCohomology prototypes only the rank-one actual sheaf comparison. Cup-product unit and polynomial identifications require supplier comparisons. |
| Coherent Grassmannians, Plücker and flags | Quotient rank, local freeness, finite presentation, exterior/determinant identifications and admissible flag types are omitted. The six Plücker chart coordinates are actual ordered determinants, and the graph test checks their signs and quadratic relation. The global-map/coordinate identification awaits the exterior-power API. Full flags must compare with the imported SF.5 object. |
| Relative very ampleness | The embedding definition uses actual immersions and pullback sheaf isomorphisms. Complete pushforward/evaluation identification and quasi-compact/quasi-separated supplier conditions are omitted from its criterion. Properness in the closed-immersion API is native. |
| Hilbert polynomial and CM regularity | The Hilbert polynomial is an admitted polynomial-valued construction with native cohomology Euler evaluation and exact-sequence interfaces; properness, coherence, ampleness and the identification Ftw(m)=F tensor L^m require supplier APIs. CM regularity itself is the actual vanishing condition. Its projective/coherent twist conditions are omitted. Family and uniform-quotient statements omit the family/ambient constraints, never replace them by an unspecified proposition. Graded compatibility and Artinian finite-length hypotheses are similarly omitted from Hilbert–Serre. |
| Chow and boundedness | Native cycles are used, but purity, dimension, degree, characteristic-zero admissibility and the coefficient-locus identification are omitted. The support inclusion is into the absolute product, with the relative product included through the separated base; its fibre-support comparison is omitted. The open-locus prototype proves the complement of a specified closed immersion is open; identifying it with the boundary-supported Chow locus remains an omitted comparison. Degree, canonical bundle, smoothness and tensor-power constraints in numerical bounds are mathematical conditions above. The smooth-polarized interface concerns the chosen embedding powers. |
| Big families | The prototype keeps the uniform positive exponent and native section-dimension bound. The family, bigness, rational-map, birationality and image-degree signatures are omitted; they are all required by the mathematical target. |
| Determinantal and incidence loci | Minor ideals and arbitrary coefficient-ring base change are native. Incidence has a native relative product; universal finite locally free subbundle/rank identifications are omitted. Its tests use native submodule dimensions as chart computations. |
| Frobenius and lattice cutoffs | The scheme zero-map equation and unique factorisation are native. Identifying the supplied endomorphism with absolute Frobenius and U,Q with universal locally free data is omitted. The graphEquation formula is explicit, with omitted chart/global identification. The coefficient-Frobenius comparison states the finite monomial matrix action; its cutoff and global stability comparison are omitted. |

No omitted hypothesis is represented by a new unspecified proposition or an admitted proposition-valued definition. All constructions and proofs remain implementation targets.

## Open inputs and supplier exports

### Register the existing AlgebraicVectorBundles sheaf-operation imports

Current upstream AlgebraicVectorBundles L0B/L0C already own finite locally free rank, symmetric and exterior powers, determinant and pullback coherence. Its current main was read, but these nine newer roadmaps are absent from the atlas stage registry used by the packet checker. No competing targets are added. Register the existing upstream layer identifiers and replace this bookkeeping endpoint by exact imports.

### Corrected algebraic numerical very-ampleness proof

Obtain and read Kollár–Matsusaka, Riemann–Roch type inequalities, AJM 105 (1983), 229–252, together with Matsusaka’s 1984 Note and Correction, or a public algebraic proof of the exact d,v,w bounds. JSTOR refused the original; neither book/copy is cleared in the local library. Charles supplies the K-trivial application and Siu supplies the numerical statement, but neither substitutes for a read corrected algebraic proof. No analytic higher-tier dependency is used.

### Arbitrary-characteristic relative bounded-degree Chow input

The complex fixed-embedding case has an explicit characteristic-zero support-spreading proof. Grothendieck exposé 221 Lemma 2.4 states the more general arbitrary-characteristic geometric-fibre bounded-family input without proving it. Supply a read proof of relative Chow coefficient descent and geometric generic reduction in positive characteristic, or an independent reduced equidimensional ideal bound; the characteristic-zero argument is not asserted to prove this extension.

The supplier requests make the prerequisite endpoints explicit:

- `tauceti:TauCetiRoadmap/ModularCurves#0g-parameter-spaces-for-subgroup-schemes`: Export the finite locally free quotient Grassmann scheme, universal exact sequence, arbitrary base change, graph charts and projectivity, with quotient-rank convention, plus zero-map closed invariant loci; identify affine points with the pinned Module.Grassmannian.
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`: Export relative Proj and degree-one O(1), projective morphisms, integer tensor powers, relative ampleness, proper coherent finiteness, projection formula and coherent higher pushforward. Extend relative Proj from finite generated graded algebras to arbitrary degree-one Sym(E) when E is quasi-coherent, as needed for the nonproper complete-evaluation very-ampleness criterion; this is a StableReduction Part II extension, not a second R09.1 Proj construction.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`: Affine quasicoherent acyclicity and comparison of separated finite affine-cover Čech complexes with native sheaf Cohomology in every dimension; proper finite-dimensional cohomology and a vanishing cutoff over a field.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`: Proper coherent cohomology/base change over locally Noetherian bases in arbitrary relative dimension; upper semicontinuity and finite locally free degree-zero pushforward with arbitrary base change when flat fibres have all higher cohomology zero.
- `SchemeAndStackFoundations:SF.5`: Import the existing finite locally free projective bundle, complete flags, field-projective very ampleness, componentwise big-line predicate, first Chern operators and proper degree. Extend the same intersection-theory direction with the proper-scheme multivariable Euler polynomial of Stacks Varieties Lemma 45.1 (all integer powers, degree ≤ support dimension), its generic-length top coefficient, integral symmetric multilinear mixed intersection degrees, positivity for ample factors, and r! times leading-coefficient comparison (45.2–45.10). R09.1 specialises this input to Hilbert polynomials and embedding degree bounds; it constructs no competing intersection calculus.
- `SchemeAndStackFoundations:SF.4`: Export smooth cotangent finite locally free rank (Stacks Morphisms Lemma 35.12) for the canonical determinant, and generic reduction plus spreading geometrically reduced fibres after shrinking an irreducible finite-type base (More on Morphisms 24.4,24.6,26.4). This is a same-direction extension of the existing deformation/generic-flatness foundations, not a second R09.1 flatness theorem.

## Source corrections

These corrections are stated in our own words and distinguish an author correction, a previously reported issue and a newly identified auxiliary index. They do not reproduce source passages.

### E1. GR — Theorem 2.1, exposé p.6 (collected p.254), 1961 printed version

The statement presents the fixed-quotient and finite-polynomial conditions as necessary conditions only. The conditions are necessary and sufficient for boundedness, as the printed proof and 1962 erratum specify.

The following argument explicitly proves sufficiency; the author’s erratum inserts it into the theorem. This affects a stated result.

Grothendieck, Erratum à l’exposé n°221, 1962, p.302

### E2. AL — Theorem 1.3.8 proof, p.58, author draft 19 August 2024

The upper bound for the auxiliary H¹ dimension adds the subsheaf Hilbert polynomial to the free-sheaf section dimension. Use p binomial(n+m₁,n) minus the subsheaf Hilbert polynomial evaluated at m₁.

Above the hyperplane bound, χ=h⁰−h¹ and h⁰ of the subsheaf is at most the free-sheaf dimension. Solving for h¹ gives subtraction. This affects the proof.

Sign corrected in Alper author draft 5 January 2026, Theorem 2.3.8 proof, p.58

### E3. AL26 — Theorem 2.3.8 proof, pp.57–58, author draft 5 January 2026

The proof takes m₂=m₁+h¹(F(m₁)) and claims H¹(F(m₂−1))=0. Take m₂=m₁+h¹(F(m₁))+1. The final displayed bound already has this extra 1, so repair the auxiliary index.

F=O_P¹(-2) as a quadratic ideal subsheaf of O, with m₁=0, has h¹(F(0))=1. The printed m₂=1 still requires the nonzero H¹(F(0)) to vanish. One more strict-decrease step is needed. This affects the proof.

new

### E4. SA — Commutative Algebra §57, Lemma 57.7, p.134, tag 00JT, accessed 9 October 2026

The proof describes the prime p as contained in its homogeneous-part ideal q. The homogeneous-part ideal q is contained in p.

q is defined by retaining the homogeneous elements of p, so q⊆p. For S=k[x] and p=(x−1), no nonzero homogeneous polynomial belongs to p, hence q=0 and p is not contained in q. The next lemma uses q⊆p. This affects the proof.

Previously reported by Martin Orr, Stacks §10.57 comment #11304 (17 March 2026); the text remains unchanged. The Stacks Project reply #11474 (23 May 2026) declines that correction. The containment correction here is independently justified and previously reported, not a new discovery.

## Library design compatibility

The [scheme Grassmannian PR #14686](https://github.com/leanprover-community/mathlib4/pull/14686), read at head `3e73c005f289200515e1694d484e89c53539be08`, uses quotient ranks and affine graph charts. The [Zulip Grassmannians discussion](https://leanprover-community.github.io/archive/stream/116395-maths/topic/Grassmannians.html), 25 June 2025, distinguishes that convention from the manifold subspace convention. These are design evidence, not pinned-baseline implementations. The finite locally free owner remains 0G; the coherent extension must compare with the resulting native scheme interface. No PR source was copied and the private AIM24 thread was not accessed.

## Baseline and sources

The substrate was inspected at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The packet records the exact module and line of each native declaration and the source artifact hashes. The numerical very-ampleness originals remain unread; no inaccessible or uncleared copy is used.

- **SC**: [The Stacks Project: Constructions](https://stacks.math.columbia.edu/download/constructions.pdf), The Stacks Project Authors; PDF accessed 2026-10-09. Read: §21, Definition 21.1, Example 21.3 and Lemmas 21.4–21.5, pp.45–47.
- **CC**: [The Stacks Project: Cohomology of Schemes](https://stacks.math.columbia.edu/download/coherent.pdf), The Stacks Project Authors; PDF accessed 2026-10-09. Read: §8, Lemmas 8.1–8.4, pp.16–22; §14, Lemma 14.1, pp.34–36; §16, Lemmas 16.1–16.2, pp.42–43.
- **SM**: [The Stacks Project: Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf), The Stacks Project Authors; PDF accessed 2026-10-09. Read: §39, Definition 39.1 and Lemmas 39.7–39.8, pp.86–89; §40, Lemmas 40.4–40.5, pp.91–92; §35, Lemma 35.12 and Definition 35.13, p.70, smooth cotangent rank.
- **SA**: [The Stacks Project: Commutative Algebra](https://stacks.math.columbia.edu/download/algebra.pdf), The Stacks Project Authors; PDF accessed 2026-10-09. Read: §57, Lemma 57.7, p.134 (incidental misprint recorded); §58, Lemmas 58.5–58.6 and Proposition 58.7, pp.136–137.
- **GO**: [Algebraic Geometry III: Grassmannians](https://math.ug/alggeom3-ws2324/pdf/AG3-WS2324-Goertz-20240526.pdf), Ulrich Görtz; Lecture notes, 26 May 2024. Read: §5, Definition 5.1, Lemma 5.8, Theorems 5.9–5.10 and Propositions 5.16–5.17, pp.56–62.
- **NI**: [Construction of Hilbert and Quot Schemes](https://arxiv.org/pdf/math/0504590), Nitin Nitsure; arXiv:math/0504590, 2005. Read: §2, Definition 2.1, Lemma 2.1 and Theorem 2.3, pp.9–13; §4, Lemma 4.1 and Theorem 4.2, pp.18–19.
- **GR**: [Techniques de construction et théorèmes d’existence en géométrie algébrique IV: Les schémas de Hilbert](https://www.numdam.org/item/SB_1960-1961__6__249_0.pdf), Alexander Grothendieck; Séminaire Bourbaki, exposé 221, 1961, pp.249–276. Read: §2, Euler polynomial preamble and Theorems 2.1–2.2, Corollary 2.3 and Lemmas 2.4–2.5, exposé pp.5–9 (collected pp.253–257).
- **GE**: [Erratum à l’exposé n°221](https://www.numdam.org/item/SB_1961-1962__7__302_1.pdf), Alexander Grothendieck; Séminaire Bourbaki, 1962, p.302. Read: p.302, correction of Theorem 2.1 on exposé p.6.
- **AL**: [Stacks and Moduli](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-8-19-24.pdf), Jarod Alper; Author draft, 19 August 2024. Read: §1.3, Proposition 1.3.5, Theorem 1.3.8 and proof, pp.54–58; §1.4.5, Chow varieties and other variants, p.64.
- **AL26**: [Stacks and Moduli](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-1-5-26.pdf), Jarod Alper; Author draft, 5 January 2026. Read: §2.3, Theorem 2.3.8 proof, pp.57–58; comparison of the sign and auxiliary regularity index.
- **CH**: [Birational boundedness for holomorphic symplectic varieties, Zarhin’s trick for K3 surfaces, and the Tate conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf), François Charles; Annals of Mathematics 184 (2016), 487–531. Read: §3, Lemmas 3.5–3.6 and proofs, pp.507–508; Proof of Theorem 2.10, p.504 (boundary: Brauer obstruction is external).
- **GG**: [The geometric André–Grothendieck period conjecture](https://pmihes.centre-mersenne.org/item/10.5802/pmihes.26.pdf), Ziyang Gao, Bruno Klingler; Published IHÉS version, 2026. Read: §3.1, p.198 (bounded-degree irreducible reduced subschemes); §3.2, p.200 (Hilbert-scheme boundary).
- **DM**: [Uniform Manin–Mumford for a family of genus 2 curves](https://arxiv.org/pdf/2405.17343v3), Laura DeMarco, Niki Myrto Mavraki, Hexi Ye; arXiv:2405.17343v3, 2026. Read: §2.5, p.7, bounded Chow parameters and support-meets-open condition.
- **FL**: [Differential Chow varieties exist](https://math.berkeley.edu/~scanlon/papers/differential-chow-varieties-22apr15.pdf), James Freitag, Wei Li, Thomas Scanlon; Author copy, 22 April 2015. Read: §3, Definition 3.1 and Proposition 3.4, pp.13–15; cycle multiplicities and the different affine-open condition.
- **SI**: [An effective Matsusaka big theorem](https://www.numdam.org/item/AIF_1993__43_5_1387_0.pdf), Yum-Tong Siu; Annales de l’Institut Fourier 43 (1993), 1387–1405. Read: Introduction and Theorem 0.1, pp.1387–1388, scope checked; analytic proof not imported.
- **CW**: [Zur algebraischen Geometrie IX: Über zugeordnete Formen und algebraische Systeme von algebraischen Mannigfaltigkeiten](https://gdz.sub.uni-goettingen.de/id/PPN235181684_0113?tify={%22pages%22:[696]}), Wei-Liang Chow, B. L. van der Waerden; Mathematische Annalen 113 (1937), 692–704; original German scan. Read: §1, pp.692–699, Sätze 1–3 and their proofs; §2 first paragraphs, p.700, support in a fixed closed subvariety.
- **SV**: [The Stacks Project: Varieties](https://stacks.math.columbia.edu/download/varieties.pdf), The Stacks Project Authors; PDF accessed 2026-10-09. Read: §45, Lemmas 45.1–45.2, Definition 45.3 and Lemmas 45.4–45.9, Definition 45.10 and Lemmas 45.11–45.13, pp.101–105.
- **MM**: [The Stacks Project: More on Morphisms](https://stacks.math.columbia.edu/download/more-morphisms.pdf), The Stacks Project Authors; PDF accessed 2026-10-09. Read: §24, Lemmas 24.4 and 24.6, pp.68–70; §26, Lemma 26.4, pp.75–76.

The six proposed atlas planets are Projective bundles, Plücker embedding, Flag bundles, Hilbert polynomial, Castelnuovo–Mumford regularity, Determinantal rank locus.
