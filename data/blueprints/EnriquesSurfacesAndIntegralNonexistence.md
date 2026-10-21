# Enriques surfaces and nonexistence over the integers

The geometric Enriques condition should serve both surface geometry over arbitrary fields and arithmetic families. Its numerical lattice controls genus-one fibrations and their curve configurations, while its finite Picard subgroup controls canonical double covers. This roadmap develops those Enriques-specific interfaces and applies them to the proposed nonexistence of an Enriques family over **Spec Z**, in the full flat proper finitely presented **algebraic-space** sense.

There are two endpoint targets: Schröer’s Theorem 15.1, excluding nonexceptional Enriques surfaces over F₂ with constant **full** Picard scheme, and Theorem 5.1, excluding integral families. Each has two separate mathematical prerequisites still to be proved: completeness of the rational-Jacobian classification and exclusion of three extra Enriques configurations. The targets are conditional on those obligations. Neither the printed eight-case reduction nor the exhibited Jacobian equations proves them.

## Conventions and shared objects

A geometric surface is taken over an algebraically closed field. For arbitrary k, the Enriques condition is imposed on its extension to an algebraic closure and must be independent of that closure. The condition combines smooth proper pure dimension two, H⁰(O)=k̄, numerically trivial canonical class, and b₂=10 for ℓ≠char(k). Classical here means exact canonical order two; it is every Enriques surface outside characteristic two and one of the three types within characteristic two.

Pic^τ has **scheme length two**, which can differ from its number of geometric points. Num is Pic/Pic^τ, with the integral intersection pairing. Constant Num means the constant rank-ten lattice group scheme. Constant full Picard means (Z¹⁰⊕Z/2)_S. Splitting the Picard extension is a third condition: a split extension by α₂ or μ₂ in characteristic two is still not constant full Picard. Br′(R) in descent assertions is H²_ét(Spec R,G_m), not merely the Azumaya Brauer group for an arbitrary nonregular ring.

A half-fibre F retains its divisor multiplicities and satisfies full fibre = 2F. Full fibres of partner fibrations have intersection four; the half-fibres have intersection one. An integral two-section meets a full fibre in degree two and a half-fibre in degree one. Its square can be zero as well as −2. Neither rationality nor square −2 is built into its definition.

Kodaira types, generic genus-one Jacobians, canonical-type curves and minimal regular models use the general genus-one supplier’s objects. In the tables E_i denotes a smooth elliptic F₂-fibre with i rational points. E₂,E₄ are ordinary; E₃,E₅ are supersingular. I_n denotes split multiplicative reduction and Ĩ_n its nonsplit form. These symbols describe the indecomposable fibre, with the scheme multiplicity recorded separately.

The built discriminant quadratic form uses **half-norm modulo Z**, q([x])=(x·x)/2 mod Z. The paper’s full-norm modulo 2Z is transported by division by two. In the ten-curve lattices the vector class has full norm −1 and q=1/2, whereas the two spinor classes have full norm −2 and q=0. Reuse Tau Ceti’s discriminant groups and even-overlattice order isomorphism.

## Boundaries and dependencies

This roadmap owns the arbitrary-field geometric Enriques predicate, its characteristic-two types, conductrix, canonical-cover adapters, full Enriques family condition and Enriques-specific surface and lattice arguments. It imports general Picard functors, line bundles, surface cohomology and intersection foundations, finite flat group schemes, local fields, genus-one classification and K3 obstructions. The geometric Num≅U⊕E₈(−1) comparison is a target here; the abstract indefinite lattice classification belongs to current IntegralLattices Layer 6A.

The same Enriques definition is exported to RealSurfacePeriodIndex (PAPER-BENOIST-24/114), CohomologyComparisons CP.5 and MotivesAndCohomologyFoundations MC.7. Those consumers must use geometric base change and this canonical-cover/type API, with no independent characteristic-zero Enriques definition.

| Dependency | Exact interface used |
| --- | --- |
| IntegralLattices, current Layer 6A; built Tau Ceti integral lattices | Indefinite even unimodular uniqueness at signature (1,9); native Gram lattices, discriminant half-norm and even-overlattice correspondence. |
| JacobianChallenge, Layers D–E | Relative Picard⁰ and the generic/family Jacobian, adapted to the Enriques fibration rather than redefined. |
| AlgebraicVectorBundles, line bundles and Picard groups | Current generic invertible-sheaf/Picard objects; the Enriques conditions add geometry to those objects. |
| LocalFieldsRamification, Layers 1–2; Mathlib `hensels_lemma` | Q₂ unit square classes and unramified extensions; the concrete ±1,±2 twist adapter is proved here. |
| SchemeAndStackFoundations SF.0,SF.1,SF.2,SF.4,SF.5 | Algebraic spaces and local scheme criteria; cohomology/duality; Picard/fppf torsors; deformation/obstruction; intersection/adjunction. |
| AlgebraicModuliForArithmeticGeometry A0-extension | Relative Picard representability, specialized to a scheme for Enriques families. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 | Oort–Tate, Cartier duality and length-two group schemes, with the ab=2 branch over Z. |
| WeilConjectures WC.7 | Divisor-cycle-class comparison and trace formula, giving #Y(F_q)=1+10q+q² when Num is constant. |
| NumericalPicardAndContractionDescent, proposed supplier | Numerical-system constancy, contraction/graph descent, and local projective **scheme** models with all Brauer/section hypotheses. |
| GenusOneFibrationsAndRationalEllipticSurfaces, proposed supplier | Kodaira/minimal models, local torsor comparison, restriction kernels, rational-Jacobian criterion and exhaustive classification. |
| K3SurfacesAndSymplecticBoundedness, proposed shared supplier | Arbitrary-field geometric K3 definition and proper/projective bridge; shared by the Charles and Shankar papers. |
| EverywhereGoodReductionAndLowDegreeHodgeNumbers, proposed supplier | Fontaine obstruction for everywhere smooth proper projective scheme models. |

The last four suppliers require registered layer contracts. They are specified precisely in the packet’s supplierContracts and the obligations below; their names are not fabricated stage ids or baseline declarations. Existing upstream roadmaps are imports, with no duplicate targets.

## The two classification gates

The elliptic necessary-candidate list is fourteen configurations, not the printed eleven:

| Elliptic configurations (up to base permutation) |
| --- |
| II* + E4 + I1 |
| II* + E2 + Ĩ1 |
| III* + E4 + I2 |
| III* + E2 + Ĩ2 |
| III* + E4 + E4 |
| IV* + E3 + IV |
| IV* + E5 + III |
| I4* + E4 + E2 |
| I1* + E4 + I4 |
| I1* + E5 + IV |
| I8 + E4 + III |
| I2* + E4 + Ĩ2 |
| I3* + E4 + Ĩ1 |
| IV* + E4 + Ĩ2 |

The quasielliptic list is II*+II+II, III*+III+II, I₄*+II+II and I₂*+III+III. These lists assert necessary possibilities, not existence of Enriques realizations. The supplier must prove that the elliptic enumeration is exhaustive (PAPER-SCHROER-23/247). Even then, E5 must separately exclude I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂ (PAPER-SCHROER-23/246).

Each extra case has its additive and E₄ fibres multiple and its nonsplit semistable fibre simple. In the extra IV* case the other half-fibre is **smooth ordinary**. The printed IV* exclusion uses a III/IV other half-fibre; it cannot be extended to this case by renaming that fibre. Until the extra exclusions are proved, retain the three extra cases alongside the printed residual eight. Both gates propagate to both endpoint targets.

## Integral covering argument

The ordering of E3 is essential. First the numerical local system over Z is constant, by the trivial étale fundamental group of Spec Z. The trace formula then gives 25 points over F₂, independently of full Picard constancy or the F₂ endpoint. Smooth Henselian lifting supplies a Z₂-section, hence a local canonical cover. The same point counts give Z_p-sections at the other primes and the numerical ample-class argument produces local projective scheme models.

In the hypothetical Pic^τ=μ₂ branch the dual canonical group is étale Z/2. Choose its canonical cover over Z[1/2] and independently over Z₂. Their Q₂ restrictions differ by c=(−1)^e2^a5^b. The global unit u=(−1)^e2^a belongs to {1,−1,2,−2}. Since cu=5^b(2^a)², its global twist leaves only the unramified class five. Over Z₂ use the finite étale quadratic algebra Z₂[z]/(z²−z−1), whose discriminant is five, to remove that remaining class. The corrected generic covers are then Q₂-isomorphic.

At odd primes the global cover extends; at two the corrected local cover extends. Each is smooth and projective over a projective base scheme. The resulting K3/Q therefore meets the precise everywhere-good-reduction scheme-model hypothesis imported from Fontaine’s obstruction. This excludes Pic^τ=μ₂ over Z. Only afterwards split the remaining étale Picard extension and obtain constant full Picard. A cover over W(F̄₂) alone does not compare its generic fibre with a globally allowed twist, so it cannot replace this argument.

## Lattice and incidence specifications

For the first ten-curve graph, C₀ and C₁ are the two left fork tips, C₂—C₃—C₄—C₅—C₆ is the chain, and C₇,C₈ the right tips. R meets C₄ once and no other C_i. All are (−2)-curves and all graph edges are simple normal crossings. Use basis (C₁,…,C₈,R,F), where F is a half-fibre; R·F=1. For the second graph R·C₀=2 and R·C₂=1, with all other incidences zero. Require simple normal crossings away from the pair R,C₀; for that pair only intersection length two is specified. Its lattice basis is (C₁,…,C₈,F′,F), with an orthogonal U block.

Both native Gram lattices have determinant −4 and Smith factors 1⁸,2,2. Their inverses are revised matrices (14) and (16) in the author copy, pp. 41 and 43. An exact rational calculation verifies all inverse entries, rank eight modulo two, and square 2n of C₈*+nR*+F*. The generic restriction quotient is Pic⁰(Y_K), of order two, with an independent degree summand generated by the two-section; it is not all of Pic(Y_K).

The affine D₈ weights (1,1,2,2,2,2,2,1,1) permit fifteen nonnegative degree-two incidence vectors in six graph-symmetry orbits. A generating even spinor class permits exactly the pairs {0,8},{1,7},{0,7},{1,8}. Independent left/right terminal swaps normalize the first graph to {0,8}. The second graph uses only the right-terminal swap, preserving the separate {0,8} and {1,8} branches. A spinor congruence by itself does not force intersection with C₈. The III* weights (1,2,2,3,4,3,2,1) permit six vectors in four orbits. These arithmetic enumerations assert no geometric realizability.

The second ten-curve exclusion uses the opposite-tip branch of the I₄* argument. That branch is an independent lemma relying on the first ten-curve exclusion; it never invokes the second exclusion or the completed no-I₄* theorem. This keeps the graph acyclic.

## Layers and targets

Each target below has its precise mathematical contract, construction/proof sketch and dependencies. Definition APIs and tests distinguish genuine geometry from tempting weaker conditions. The geometric signatures depend on the supplier interfaces above; the Lean file explicitly omits them until they can be stated on the actual objects. It gives concrete native Gram and dyadic support signatures, with their API and tests, without a fake surface or a condition encoded as an arbitrary Prop field.

## E0 — Geometric Enriques surfaces and their lattice

Define the shared geometric condition over arbitrary fields, prove Picard and cohomological invariants and identify the even unimodular numerical lattice using IntegralLattices Layer 6A.

### is-enriques — Enriques surface

For a field k and a smooth proper k-scheme Y of pure dimension two, IsEnriques(Y/k) means that Y over an algebraic closure has H⁰(O)=k̄, canonical line bundle numerically trivial and ℓ-adic second Betti number 10, for one (equivalently every) prime ℓ different from char(k). This is a geometric predicate on the existing surface, with no perfection or characteristic restriction.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `IsEnriques` | characterisation: The geometric conjunction on a smooth proper surface, using native base change and Betti groups. |
| `IsEnriques.baseChange` | functoriality: For any field extension K/k, the property of Y is equivalent to that of Y_K. |
| `IsEnriques.iso` | compatibility: A k-isomorphism transports IsEnriques in both directions. |
| `IsEnriques.projective` | compatibility: A proper geometric Enriques surface is projective; prove this rather than assuming a polarization in the definition. |

Tests:

- `test_enriques_extension` (compatibility): Extending a classical Enriques surface from an arbitrary k to k̄ preserves the property.
- `test_k3_not_enriques` (non-example): A K3 surface with b₂=22 fails this condition despite numerically trivial canonical class.
- `test_abelian_not_enriques` (non-example): An abelian surface has b₂=6 and fails this condition.

Consumers: RealSurfacePeriodIndex; PAPER-BENOIST-24/114 — Export one arbitrary-field definition, without a hidden characteristic assumption.; CohomologyComparisons:CP.5 and MotivesAndCohomologyFoundations:MC.7 — Use the same geometric surface and canonical covering; do not define an independent Enriques predicate.

Proof/construction: Use smoothness and properness on the native scheme map; request cohomology, numerical triviality and ℓ-independence from the indicated suppliers. Prove closure-independent formulation before exporting it.

Hypotheses: The surface is geometric Enriques over an algebraically closed field of arbitrary characteristic; the arbitrary-field predicate is defined by geometric base change. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `WeilConjectures:WC.7`.

Sources: SCH23-author, §4, p. 12.

### pic-tau-length — Numerically trivial Picard group of an Enriques surface

For geometric Enriques Y, Pic^τ(Y) has scheme length two. Its geometric rational-point group is generated by the class of ω_Y; scheme length is not replaced by the number of rational points.

Proof/construction: Apply the Enriques classification input; compare the finite subgroup with the numerical Picard quotient. The connected cases have one geometric point and still length two.

Hypotheses: The surface is geometric Enriques over an algebraically closed field of arbitrary characteristic; the arbitrary-field predicate is defined by geometric base change. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: μ₂ and α₂ in characteristic two each have length two and one geometric point.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, §4, p. 12.

### geometric-invariants — Enriques numerical and cohomological invariants

For geometric Enriques Y, Num(Y) is free of rank ten, b₁=b₃=0 and b₂=ρ=10. The dimensions h¹(O_Y) and h²(O_Y) agree and are at most one.

Proof/construction: Use Picard finiteness, coherent duality and the geometric Enriques classification; request the cycle-class rank comparison and ℓ-independent Betti package. These are geometric invariants, not data assumed in a surface record.

Hypotheses: The surface is geometric Enriques over an algebraically closed field of arbitrary characteristic; the arbitrary-field predicate is defined by geometric base change. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `WeilConjectures:WC.7`.

Sources: SCH23-author, §4, p. 12.

### numerical-lattice-isometry — Enriques numerical lattice

The intersection pairing on geometric Num(Y) is even, unimodular and has signature (1,9). As an integral lattice it is isometric to U⊕E₈(−1), where U has off-diagonal entries one and diagonal entries zero.

Proof/construction: Construct the pairing from divisor intersection, descend through Pic^τ and prove freeness, evenness, integral perfectness and Hodge-index signature. Apply the current IntegralLattices Layer 6A classification; reuse the native hyperbolic plane and E₈ model. PAPER-SCHROER-23/207 is an import, not a new classification target here.

Hypotheses: The surface is geometric Enriques over an algebraically closed field of arbitrary characteristic; the arbitrary-field predicate is defined by geometric base change. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/geometric-invariants`, `SchemeAndStackFoundations:SF.5`, `tauceti:TauCeti.IntegralLattice`, `tauceti:TauCeti.IntegralLattice.hyperbolicPlane`, `tauceti:TauCeti.IntegralLattice.d8PlusLattice`.

Sources: SCH23-author, §4, p. 12.

## E1 — Half-fibres, canonical covers and exceptionality

Develop half-fibres and integral two-sections, the three characteristic-two types, canonical local torsors, the conductrix and exceptional-fibration restrictions. Establish the general partner theorem and canonical-type-to-fibration correspondence.

### half-fibre — Half-fiber

For a genus-one fibration φ:Y→P¹_k on an Enriques surface, a half-fibre is an effective Cartier divisor F on Y together with a k-rational base point a and equality 2F=φ*([a]) as divisors. F retains its component multiplicities; it is not defined as the reduced support.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `HalfFibre` | structure: Data (F,a) with F effective Cartier, a rational, and 2F the scheme fibre. |
| `HalfFibre.baseChange` | functoriality: Extend F and a along any field extension, preserving twice-the-divisor equality. |
| `HalfFibre.square` | characterisation: Its intersection square is zero. |
| `HalfFibre.intersection_fibre` | compatibility: D·φ*([a])=2(D·F) for every Cartier divisor D. |

Tests:

- `test_double_fibre` (computation): A scheme fibre 2F gives a half-fibre with the original multiplicities in F.
- `test_half_not_reduction` (non-example): For additive fibres with component multiplicity greater than one, the reduced support cannot replace F.
- `test_half_extension` (compatibility): For a field extension the base-changed equality remains 2F_K=φ_K*([a_K]).

Consumers: E1 classical criteria and partner fibrations — Express ω as a difference of half-fibres and fibre intersection four.; E6 lattice bases — Use F²=0 and F·two-section=1 without discarding vertical multiplicities.

Proof/construction: Use the supplier fibre divisor and effective Cartier operations. Over k̄ obtain half-fibres from the multiplicity-two theorem; construct base change on the equality.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `SchemeAndStackFoundations:SF.5`.

Sources: SCH23-author, §4, p. 12.

### curves-and-two-sections — (−2)-curve and two-section on an Enriques surface

A geometric (−2)-curve is an integral curve of square −2 on an Enriques surface; adjunction makes it smooth rational. Over k the term means a curve whose geometric base change is such a curve. A two-section is an integral horizontal curve R with degree two over the fibration base, equivalently R·(full fibre)=2 or R·F=1. It can have square zero, so it need not be rational.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `IsMinusTwoCurve` | characterisation: Geometric integrality and geometric self-intersection −2 on an Enriques surface. |
| `IsTwoSection` | characterisation: Integral curve with degree two over P¹; equivalent to intersection two with a full fibre. |
| `twoSection_half_degree` | compatibility: A two-section meets a half-fibre with degree one. |
| `minusTwoCurve_baseChange` | functoriality: The geometric curve condition is preserved and reflected by field extension. |

Tests:

- `test_square_minus_two` (computation): An integral geometric square −2 curve is a smooth P¹ by adjunction.
- `test_square_zero_two_section` (non-example): An integral half-fibre of a partner fibration is a two-section with square zero; the rational-curve predicate rejects it.
- `test_half_degree` (compatibility): Degree two against 2F means degree one against F, not degree two against F.

Consumers: E2 curve descent — Descend geometric (−2)-curves and distinguish a conic form from P¹.; E6 both reducibility branches — Keep square zero and −2 separate through the lattice argument.

Proof/construction: Use adjunction for K numerically zero to prove the rationality assertion. Relate degree to the full Cartier fibre and then to its half-fibre. Keep geometric integrality in the k-form.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`, `SchemeAndStackFoundations:SF.5`.

Sources: SCH23-author, Proposition 4.1, p. 12; Proposition 4.4(ii), p. 13; Theorem 5.6(iii), p. 17.

### canonical-type-fibration — Curves of canonical type on an Enriques surface induce genus-one fibrations

An indecomposable effective curve of canonical type on a geometric Enriques surface determines a unique genus-one fibration, up to base isomorphism, in which it is either a full fibre or a half-fibre.

Proof/construction: Import the generic canonical-type condition and negative-semidefinite intersection kernel. Prove the Enriques linear-system theorem, including possible doubling and uniqueness, from the Enriques surface prerequisites. This is the geometry behind every later graph-generated fibration.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`, `SchemeAndStackFoundations:SF.5`.

Sources: SCH23-author, §4, p. 12, sentence before Proposition 4.1 (Bombieri–Mumford 1977; Cossec–Dolgachev 1989, Chapter III); §4, p. 12; used in the proofs of Propositions 11.2–14.1, pp. 34–49; MMV22, §2.1, Lemmas 2.1–2.4, pp. 3–4.

### fibration-exists — Existence of genus-one fibrations

Every Enriques surface over an algebraically closed field has a genus-one fibration to P¹.

Proof/construction: Use the numerical U⊕E₈(−1) lattice to find an effective nef primitive isotropic class by Riemann–Roch and reflections; apply the half-fibre linear-system theorem. The reflection/effectivity theorem is a source-closure obligation, not a consequence of abstract lattice isometry alone.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`.

Sources: SCH23-author, Proposition 4.1, p. 12; MMV22, §2.1, Lemmas 2.1–2.4, pp. 3–4.

### multiple-fibre-degree — Double fibers

Each geometric Enriques genus-one fibration has a multiple fibre; every such scheme fibre has multiplicity exactly two.

Proof/construction: Apply the Enriques genus-one canonical-bundle and linear-system theory. Multiplicity refers to the gcd of the scheme fibre coefficients; the underlying indecomposable divisor may be nonreduced.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/fibration-exists`, `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`.

Sources: SCH23-author, Proposition 4.1, p. 12.

### degree-two-reducibility — Enriques reducibility theorem (as used)

On an Enriques surface over an algebraically closed field, a fibre-degree-two divisor class has, modulo vertical classes and multiples of a half-fibre, an integral two-section representative of square zero or −2. This proposed contract must preserve the generic Pic⁰ coset used in E6.

Proof/construction: Acquire Lang 1983 Theorem 4.1 or an authorized full modern reducibility proof and check the precise hypothesis on the divisor class. The publisher currently supplies a subscription preview only, and no cleared copy is listed. This is a proposed contract matching the two applications, not a claim that the unseen theorem has this exact wording. Apply geometric reducibility, then use curve or half-fibre/fibration descent to obtain the F₂ representative required by the later point count. Preserve its nontrivial generic Pic⁰ coset.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Both square-zero and square−2 branches survive the construction; preserving the nontrivial coset must be checked explicitly.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry`, `EnriquesSurfacesAndIntegralNonexistence:E1/curves-and-two-sections`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`.

Sources: SCH23-author, proofs of Propositions 12.2 (p. 42) and 12.3 (p. 43).

### integral-two-section-exists — Integral two-sections

A geometric Enriques genus-one fibration admits an integral two-section of square −2 or zero; it can be chosen as a (−2)-curve or as a half-fibre of another fibration.

Proof/construction: Choose an effective class of fibre degree two and apply the reducibility input to retain one horizontal integral component. In the square-zero branch prove that the resulting primitive nef curve is a half-fibre. Do not assume every two-section is a (−2)-curve.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry`, `EnriquesSurfacesAndIntegralNonexistence:E1/curves-and-two-sections`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E1/degree-two-reducibility`.

Sources: SCH23-author, Proposition 4.1, p. 12; MMV22, §2.1, Lemmas 2.1–2.4, pp. 3–4.

### classical-criteria — Classical Enriques criteria

For geometric Enriques Y, the following conditions are equivalent: ω_Y has exact order two; H¹(O_Y)=0; some genus-one fibration has no wild fibre; some genus-one fibration has two distinct multiple fibres.

Proof/construction: Use Pic^τ length two and the Enriques canonical bundle formula. Prove both existential implications rather than replacing them with universal claims; the universal consequence is the next target.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `EnriquesSurfacesAndIntegralNonexistence:E1/multiple-fibre-degree`.

Sources: SCH23-author, Proposition 4.2, p. 12.

### classical-canonical-bundle — Tame double fibers and canonical bundle

When the classical criteria hold, every genus-one fibration has precisely two tame double fibres 2F₁ and 2F₂, and ω_Y≅O(F₁−F₂). Every geometric Enriques surface in characteristic other than two satisfies these criteria.

Proof/construction: Apply the genus-one canonical bundle formula to the two tame multiplicities and compare Pic^τ points with ω_Y. Separate the characteristic-not-two assertion from the characteristic-two ordinary case.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/classical-criteria`, `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`.

Sources: SCH23-author, Proposition 4.2, p. 12.

### tame-types-char-two — Characteristic-two tame half-fiber types

In characteristic two, if an Enriques genus-one fibration has two distinct double fibres, each half-fibre is ordinary smooth elliptic or singular additive. A supersingular smooth elliptic or semistable half-fibre is excluded.

Proof/construction: Use the normal bundle of a tame half-fibre: it is a nontrivial line bundle of order two in its Pic⁰. Compare the ordinary, supersingular and multiplicative Pic⁰ group schemes.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/classical-canonical-bundle`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, Lemma 4.3, pp. 12–13.

### ordinary-type — ordinary Enriques surface

For a geometric Enriques surface in characteristic two, the ordinary type is defined by Pic^τ≅μ₂. Its canonical-cover group is (Z/2), its étale fundamental group is Z/2, and its canonical bundle is trivial. The type condition and these consequences are kept separate.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `OrdinaryType` | characterisation: The Pic^τ-isomorphism condition μ₂ in characteristic two. |
| `ordinary_dual` | compatibility: The Cartier dual of its Pic^τ is (Z/2). |
| `ordinary_baseChange` | functoriality: The geometric type is invariant under field extension. |

Tests:

- `test_ordinary_pic` (computation): For geometric Pic^τ=μ₂, the predicate holds.
- `test_ordinary_other` (non-example): The other two length-two group schemes fail the ordinary predicate.
- `test_ordinary_dual` (compatibility): Dualizing μ₂ gives (Z/2); swapping Pic^τ with its dual fails this test except for α₂.

Consumers: E1 canonical covers — Select étale versus local dual torsors.; E3 Oort–Tate branch — Keep Pic^τ and the covering group distinct.

Proof/construction: Classify finite group schemes of length two over the algebraically closed field. Identify the Cartier dual and then prove the fundamental-group and canonical-bundle consequences from the canonical cover theorem.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-criteria`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, §4, p. 13.

### classical-type — classical Enriques surface

For a geometric Enriques surface in characteristic two, the classical type is defined by Pic^τ≅(Z/2). Its canonical-cover group is μ₂, its étale fundamental group is trivial, and its canonical bundle is of exact order two. The type condition and these consequences are kept separate.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `ClassicalType` | characterisation: The Pic^τ-isomorphism condition (Z/2) in characteristic two. |
| `classical_dual` | compatibility: The Cartier dual of its Pic^τ is μ₂. |
| `classical_baseChange` | functoriality: The geometric type is invariant under field extension. |

Tests:

- `test_classical_pic` (computation): For geometric Pic^τ=(Z/2), the predicate holds.
- `test_classical_other` (non-example): The other two length-two group schemes fail the classical predicate.
- `test_classical_dual` (compatibility): Dualizing (Z/2) gives μ₂; swapping Pic^τ with its dual fails this test except for α₂.

Consumers: E1 canonical covers — Select étale versus local dual torsors.; E3 Oort–Tate branch — Keep Pic^τ and the covering group distinct.

Proof/construction: Classify finite group schemes of length two over the algebraically closed field. Identify the Cartier dual and then prove the fundamental-group and canonical-bundle consequences from the canonical cover theorem.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-criteria`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, §4, p. 13.

### supersingular-type — supersingular Enriques surface

For a geometric Enriques surface in characteristic two, the supersingular type is defined by Pic^τ≅α₂. Its canonical-cover group is α₂, its étale fundamental group is trivial, and its canonical bundle is trivial. The type condition and these consequences are kept separate.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `SupersingularType` | characterisation: The Pic^τ-isomorphism condition α₂ in characteristic two. |
| `supersingular_dual` | compatibility: The Cartier dual of its Pic^τ is α₂. |
| `supersingular_baseChange` | functoriality: The geometric type is invariant under field extension. |

Tests:

- `test_supersingular_pic` (computation): For geometric Pic^τ=α₂, the predicate holds.
- `test_supersingular_other` (non-example): The other two length-two group schemes fail the supersingular predicate.
- `test_supersingular_dual` (compatibility): Dualizing α₂ gives α₂; swapping Pic^τ with its dual fails this test except for α₂.

Consumers: E1 canonical covers — Select étale versus local dual torsors.; E3 Oort–Tate branch — Keep Pic^τ and the covering group distinct.

Proof/construction: Classify finite group schemes of length two over the algebraically closed field. Identify the Cartier dual and then prove the fundamental-group and canonical-bundle consequences from the canonical cover theorem.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-criteria`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, §4, p. 13.

### k3-like-cover — K3-like canonical covering

For classical or supersingular geometric Enriques Y in characteristic two, its K3-like cover is the nontrivial torsor X→Y under (Pic^τ)^D corresponding to Pic^τ↪Pic. The map is finite flat of degree two and a universal homeomorphism. This term does not assert that X is a smooth K3 surface.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `K3LikeCover` | constructor: The canonical local torsor attached to Pic^τ↪Pic. |
| `K3LikeCover.baseChange` | functoriality: The torsor and its canonical Picard section commute with field extension. |
| `K3LikeCover.degree` | data: It is finite flat of rank two. |
| `K3LikeCover.radicial` | characterisation: Its finite flat morphism is a universal homeomorphism. |

Tests:

- `test_classical_cover_group` (compatibility): Classical Pic^τ=Z/2 gives a μ₂-cover, not an étale Z/2-cover.
- `test_supersingular_cover_group` (compatibility): Supersingular Pic^τ=α₂ gives an α₂-cover.
- `test_ordinary_not_local` (non-example): The ordinary canonical cover is étale and is excluded from the K3-like local construction.

Consumers: E1 conductrix — Normalize this finite local cover.; E8 lifting — Use singular-cover geometry and exceptional criteria, not Fontaine for a singular X.

Proof/construction: Use the Picard–torsor correspondence for finite flat Cartier duals. Nontriviality follows from the nonzero inclusion; the local group makes the map radicial. Verify integrality and Cohen–Macaulay/Gorenstein properties before normalization.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/classical-type`, `EnriquesSurfacesAndIntegralNonexistence:E1/supersingular-type`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `SchemeAndStackFoundations:SF.2`.

Sources: SCH23-author, §4, p. 13.

### k3-like-cohomology — Cohomology of the K3-like cover

The local K3-like cover X has h⁰(O_X)=h²(O_X)=1 and h¹(O_X)=0, trivial dualizing sheaf, and a nonempty singular locus.

Proof/construction: Compute the pushforward rank-two algebra and its Euler characteristic; use Gorenstein duality to obtain the cohomology. Prove singularity for the classical/supersingular types, while keeping the ordinary étale case outside the statement.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/k3-like-cover`, `SchemeAndStackFoundations:SF.1`.

Sources: SCH23-author, §4, p. 13.

### conductrix — Conductrix and exceptionality

Normalize the integral K3-like cover X to X′. The map X′→Y is finite flat purely inseparable of degree two, and the conductor ideal of X′→X is O_X′(−R′) with R′ the pullback of an effective Cartier divisor C on Y. C is the conductrix and 2C the biconductrix. A simply connected characteristic-two Enriques surface is exceptional exactly when H¹(O_{2C}) is nonzero; ordinary surfaces are nonexceptional by this convention.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `Conductrix` | constructor: The unique effective Cartier divisor whose pullback is the normalization conductor divisor. |
| `conductrix_normalization` | characterisation: The conductor ideal is the pullback of O_Y(−C). |
| `Biconductrix` | data: The effective divisor 2C with its Cartier scheme structure. |
| `IsExceptional` | characterisation: Simply connected characteristic-two Enriques and H¹(O_{2C})≠0; false for ordinary type. |

Tests:

- `test_biconductrix_empty` (degenerate): C=0 gives the empty biconductrix and H¹=0, hence nonexceptional.
- `test_biconductrix_not_reduction` (non-example): Replacing O_{2C} by O_{C_red} changes the invariant and is not accepted.
- `test_ordinary_nonexceptional` (non-example): An ordinary Enriques surface is never exceptional under this convention.

Consumers: E1 exceptional fibre restrictions — Translate ESB classification to Kodaira symbols.; E8 W₂ lift obstruction — Use the exact exceptional-or-supersingular condition.

Proof/construction: Apply ESB Lemma 2.3 to the two finite flat degree-two algebras, then verify that normalization meets its hypotheses. Uniqueness of the descended conductor divisor gives C. Define exceptionality by the cohomology of the actual doubled Cartier subscheme.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/k3-like-cover`, `EnriquesSurfacesAndIntegralNonexistence:E1/k3-like-cohomology`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

Sources: SCH23-author, §4, p. 13; ESB21, §2, conductor construction and Lemma 2.3, pp. 4–5.

### quasielliptic-simple-restriction — Nonexceptional quasielliptic restriction

On a nonexceptional geometric Enriques surface in characteristic two, a quasielliptic fibration cannot have a simple III* or II* fibre.

Proof/construction: Take the contrapositive of ESB Theorem 1.1(2), identifying affine E₇/E₈ with III*/II* and retaining simplicity. The source is read; recursive proof closure requires its classification arguments.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Multiple III*/II* fibres are not excluded by this statement.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/conductrix`.

Sources: SCH23-author, Proposition 4.4(i), p. 13; ESB21, §1, Theorems 1.1–1.3, pp. 1–3.

### multiple-special-restriction — Nonexceptional multiple exceptional-type restriction

On a nonexceptional geometric Enriques surface in characteristic two, a multiple IV*, III* or II* fibre cannot occur in a fibration that has a (−2)-curve as a two-section.

Proof/construction: Apply the contrapositive of ESB Theorem 1.1(3), matching its special bisection definition with the integral two-section degree. A square-zero two-section does not make a fibration special.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/conductrix`, `EnriquesSurfacesAndIntegralNonexistence:E1/curves-and-two-sections`.

Sources: SCH23-author, Proposition 4.4(ii), p. 13; ESB21, §1, Theorems 1.1–1.3, pp. 1–3.

### extra-special-e8 — Extra special e8

An extra-special geometric Enriques surface of affine E₈ type has the dual intersection graph of ALL its (−2)-curves isomorphic to the ten-vertex tree T₂,₃,₇: one trivalent vertex and arms of edge lengths 1,2,6, every edge intersection one. A contained subgraph alone does not define the predicate. This is the unique extra-special type needed for the half-fibre partner exception.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `IsExtraSpecialE8` | characterisation: The entire dual intersection graph of geometric (−2)-curves is the ten-vertex T₂,₃,₇ tree. |
| `extraSpecialE8_iso` | functoriality: A geometric surface isomorphism preserves and reflects the predicate. |
| `extraSpecialE8_curve_count` | characterisation: There are exactly ten (−2)-curves. |
| `extraSpecialE8_no_cycle` | compatibility: The entire curve graph has no cycle, so no I_n cycle can be realized by its (−2)-curves. |

Tests:

- `test_extra_e8_tree` (compatibility): An entire ten-curve graph with arm lengths 1,2,6 satisfies the graph characterization.
- `test_extra_e8_subgraph` (non-example): A T₂,₃,₇ subgraph together with an additional (−2)-curve fails the entire-graph condition.
- `test_extra_e8_cycle` (non-example): A dual graph with a cycle fails the tree-isomorphism condition.

Consumers: E1 general-partner-theorem — Define the precise exceptional domain; do not exclude all exceptional surfaces from the general theorem.; E7 restricted-configurations-impossible — Use the characteristic-two classification to eliminate the extra-special exception from the restricted global configurations.

Proof/construction: Use the actual collection of geometric (−2)-curves and intersection numbers from E1, rather than an arbitrary graph supplied as surface data. Define graph isomorphism to the finite explicit tree; prove isomorphism and algebraically closed field-extension invariance. Its characteristic-two-only and unique-fibration properties are the separate general-partner contract.

Hypotheses: The surface is Enriques over an algebraically closed field of arbitrary characteristic.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/curves-and-two-sections`, `SchemeAndStackFoundations:SF.5`.

Sources: MMV22, §1, Definition 1.1, p. 1, first ten-vertex diagram.

### general-partner-theorem — Every half-fibre has a partner (Cossec–Dolgachev)

For an Enriques surface over any algebraically closed field, every half-fibre F has another half-fibre F′ with F·F′=1 unless the surface is extra-special of affine E₈ type. Such extra-special surfaces occur only in characteristic two and have just one genus-one fibration.

Proof/construction: Use MMV Theorem 1.2 and Remark 1.5, which state the older Cossec–Dolgachev extension theorem in this generality. Its proof and the old book were not obtained; the accessible author manuscript returned HTTP 403. Before closure acquire Cossec–Dolgachev III.3.4.1 or the modern CDL 6.1.10 proof.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`, `EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry`, `EnriquesSurfacesAndIntegralNonexistence:E1/extra-special-e8`.

Sources: SCH23-author, Cossec–Dolgachev 1989, Theorem 3.4.1 (as quoted in arXiv:2201.05481, Theorem 1.2 and Remark 1.5); main paper proof of Proposition 4.4(iii), p. 13; MMV22, §1, Theorem 1.2 and Remarks 1.4–1.5, pp. 1–2.

### nonexceptional-partner — Partner genus-one fibration

For each genus-one fibration on a nonexceptional geometric characteristic-two Enriques surface there is another with intersection of full fibre classes equal to four.

Proof/construction: Check that an extra-special affine E₈ surface is exceptional using ESB classification; invoke the general half-fibre extension theorem. Since full fibres are twice the respective half-fibres, their intersection is four. The extra-special-to-exceptional implication remains a precisely scoped source obligation.

Hypotheses: An Enriques surface over an algebraically closed field; impose characteristic two for the three types, local K3-like cover, conductrix and exceptional restrictions. The general partner theorem retains arbitrary characteristic. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/general-partner-theorem`, `EnriquesSurfacesAndIntegralNonexistence:E1/conductrix`, `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`.

Sources: SCH23-author, Proposition 4.4(iii), p. 13; ESB21, §1, Theorems 1.1–1.3, pp. 1–3.

## E2 — Families, Picard descent and canonical torsors

Use flat proper finitely presented algebraic spaces. Construct their relative Picard and numerical objects, canonical-cover obstruction and twisting, constant/split distinctions, and descent of curves and fibrations under the cohomological Brauer hypothesis.

### enriques-family — Family of Enriques surfaces

An Enriques family over a scheme S is an algebraic space f:Y→S which is flat, proper and finitely presented, with every geometric fibre a geometric Enriques surface. Its isomorphisms and pullbacks form the fppf stack M_Enr. Over an affine S=Spec R this is the integral-family contract; representability by a scheme is a consequence only under additional hypotheses.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `EnriquesFamily` | structure: A flat proper finitely presented algebraic-space morphism with geometric Enriques fibres. |
| `EnriquesFamily.baseChange` | functoriality: Pull back the space, structure map and geometric fibre proofs along any S′→S. |
| `EnriquesFamily.iso` | equivalence: An isomorphism over S gives an isomorphism of families; compose and invert these. |
| `EnriquesFamily.smooth` | compatibility: Every Enriques family is smooth from flat finite presentation and geometric smoothness. |

Tests:

- `test_family_field` (compatibility): Over a field the geometric fibre condition agrees with IsEnriques on a proper smooth surface.
- `test_family_basechange_mod4` (compatibility): A Z-family restricts to a Z/4-family and then to its characteristic-two geometric fibre.
- `test_family_no_scheme_assumption` (non-example): A constructor that demands projectivity or scheme representability cannot express the stipulated algebraic-space family contract.

Consumers: E3 integral constancy — Apply Oort–Tate to its relative Picard torsion, then prove local projectivity.; E8 final theorem — The excluded objects are all algebraic-space families over Z.

Proof/construction: Use the general algebraic-space and fppf descent suppliers. Flat finite presentation and smooth geometric fibres imply f is smooth. Check descent of the geometric Enriques condition and the isomorphism groupoid.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

Sources: SCH23-author, §5, p. 14.

### relative-picard-scheme — Relative Picard representability

For any Enriques family over S=Spec R, the fppf relative Picard algebraic space is representable by a scheme over S.

Proof/construction: Import representability from AlgebraicModuli A0-extension and smooth proper base-change theory. Prove the Enriques-specific improvement from algebraic space to scheme by its finite Pic^τ and numerical components; do not recreate the Picard functor.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/enriques-family`, `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: SCH23-author, Proposition 5.3, p. 14.

### relative-picard-invariants — Relative numerical invariants

For an Enriques family, relative Pic^τ is an open finite locally free subgroup of rank two, and its numerical quotient Num is étale locally isomorphic to Z¹⁰. Both commute with base change.

Proof/construction: Apply fibrewise length and numerical rank from E0, relative Picard base change and the numerical Picard supplier. Verify openness and flat rank globally, not only on geometric points.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/relative-picard-scheme`, `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `EnriquesSurfacesAndIntegralNonexistence:E0/geometric-invariants`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, Proposition 5.3, p. 14.

### canonical-family — Family of canonical coverings

Put P=Pic^τ(Y/S) and G=P^D for an Enriques family. Via the finite-flat Picard–torsor correspondence, P↪Pic(Y/S) defines a distinguished section χ in H⁰(S,R¹f_*G_Y). A canonical covering family is a G_Y-torsor over Y whose fppf cohomology class maps to χ. It is defined independently of a chosen global lift.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `CanonicalCoverFamily` | structure: A G_Y-torsor with specified equality of its edge image to χ. |
| `canonicalSection_baseChange` | functoriality: χ and its Cartier-dual group pull back compatibly. |
| `canonicalFamily_baseChange` | functoriality: Base change a canonical torsor to a canonical torsor. |
| `canonicalFamily_iso` | equivalence: Isomorphisms are equivariant torsor isomorphisms over Y preserving the edge condition. |

Tests:

- `test_canonical_local_fibre` (compatibility): For classical characteristic-two Pic^τ, the fibre group is μ₂ in the fppf topology.
- `test_canonical_ordinary_fibre` (compatibility): For ordinary characteristic-two Pic^τ, the fibre group is the étale Z/2.
- `test_noncanonical_torsor` (non-example): The trivial torsor has zero edge class and does not represent the nonzero inclusion P↪Pic.

Consumers: E2 obstruction and twisting — The fibre of the edge map over χ is the object being classified.; E3 comparison at two — Compare two covers using their common canonical edge class.

Proof/construction: Use the supplier finite flat Cartier duality and fppf cohomology. Construct χ from the actual inclusion, with pullback compatibility, then characterize its lifts by the Leray edge map.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/relative-picard-invariants`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `SchemeAndStackFoundations:SF.2`.

Sources: SCH23-author, §5, pp. 14–15.

### canonical-obstruction — Canonical-cover obstruction

With G=P^D, fppf cohomology has the exact row 0→H¹(S,G)→H¹(Y,G_Y)→H⁰(S,R¹f_*G_Y)→H²(S,G)→H²(Y,G_Y). The image of χ in H²(S,G) vanishes exactly when a canonical covering family exists.

Proof/construction: First prove O_S→f_*O_Y universally an isomorphism and hence f_*G_Y=G. Apply the Leray low-degree sequence in the fppf topology; étale cohomology alone cannot express the α₂ or characteristic-two μ₂ case.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-family`, `SchemeAndStackFoundations:SF.2`.

Sources: SCH23-author, §5 equation(2), pp. 14–15.

### injective-h2-cover — Injective pullback criterion for a canonical cover

If pullback H²_fppf(S,G)→H²_fppf(Y,G_Y) is injective, an Enriques family has a canonical covering family.

Proof/construction: Exactness puts the obstruction in the kernel of pullback. Injectivity kills it, and exactness of the edge sequence supplies a torsor lift.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-obstruction`.

Sources: SCH23-author, Proposition 5.4, p. 15.

### section-cover — Section criterion for a canonical cover

An Enriques family with an S-section has a canonical covering family.

Proof/construction: Pullback along the section is a retraction of f* on H²_fppf. Use the injective-pullback criterion.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/injective-h2-cover`.

Sources: SCH23-author, Proposition 5.4, p. 15.

### etale-pic-tau-cover — Étale Picard torsion criterion for a canonical cover

If Pic^τ is étale and Pic(S)=0, an Enriques family has a canonical covering family.

Proof/construction: Over the connected components, the étale rank-two P is constant Z/2 and generated by the fibrewise canonical line bundle. Descend ω² from S; Pic(S)=0 trivializes that line bundle. Construct the rank-two algebra O_Y⊕ω_Y^{-1}, using the dual of the chosen multiplication isomorphism so products have the correct tensor type. Apply the generic relative Spec/vector-bundle interfaces.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: The multiplication uses ω^{-2}→O; an ω²→O map has the wrong type here.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-family`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-canonical-bundle`, `SchemeAndStackFoundations:SF.0`.

Sources: SCH23-author, Proposition 5.4, p. 15.

### canonical-twisting — Twisting of canonical coverings

Whenever a canonical covering family exists, its equivariant isomorphism classes form a principal homogeneous space under H¹_fppf(S,G), by twisting with pullbacks of base torsors.

Proof/construction: Injectivity of the first map in the edge row gives freeness; equality of the two edge images puts their difference in its image and gives transitivity. Construct the contracted product and prove action/identity/inverse laws.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-obstruction`, `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-family`.

Sources: SCH23-author, Proposition 5.4, p. 15.

### constant-picard — Constant and split Picard schemes

Constant numerical Picard means Num≅(Z¹⁰)_S. Constant full Picard means Pic(Y/S)≅(Z¹⁰⊕Z/2)_S as a group scheme. A split Picard extension means only that 0→Pic^τ→Pic→Num→0 admits a homomorphic section. These are predicates invariant under isomorphism; numerical constancy and splitness do not by themselves force constant full Picard.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `ConstantNum` | characterisation: An isomorphism Num≅(Z¹⁰)_S exists. |
| `ConstantPicard` | characterisation: An isomorphism Pic≅(Z¹⁰⊕Z/2)_S exists. |
| `SplitPicard` | characterisation: The relative Picard quotient has a group-scheme section. |
| `constantPicard_implies` | compatibility: Full constancy implies numerical constancy, étale Pic^τ and splitness. |

Tests:

- `test_constant_full` (computation): The group scheme (Z¹⁰⊕Z/2)_S satisfies all three predicates.
- `test_constant_num_local_tau` (non-example): The split extension (Z¹⁰⊕α₂)_k in characteristic two has constant Num and is split, but fails constant full Picard.
- `test_constant_num_mu_tau` (non-example): The split extension (Z¹⁰⊕μ₂)_k in characteristic two also fails constant full Picard.

Consumers: E3 integral Picard theorem — Prove numerical constancy before excluding μ₂ and splitting.; E4 finite-field geometry — Require full constancy for line-bundle and section descent; point counts need only Num.

Proof/construction: Use the actual relative Picard extension, and define each condition on it. Prove the implications of full constancy and isolate the extra étale-Pic^τ condition needed for the converse.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/relative-picard-invariants`.

Sources: SCH23-author, §5, p. 15.

### constant-picard-covers — Canonical covers with constant Picard

If Pic(Y/R) is constant full Picard and Pic(R)=0, canonical covering families exist and their classes are a torsor under R×/(R×)². In the simultaneous descent package also assume H²_ét(Spec R,G_m)=0.

Proof/construction: Full constancy makes P étale Z/2 with G=μ₂. Use the étale-Picard criterion, the twisting action, and fppf Kummer with Pic(R)=0. This part does not need the stronger Brauer vanishing; that hypothesis belongs to numerical-class descent below.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard`, `EnriquesSurfacesAndIntegralNonexistence:E2/etale-pic-tau-cover`, `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-twisting`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, Theorem 5.6, pp. 16–18.

### residue-canonical-order — Canonical bundle order

Under full Picard constancy, for every field map R→k the canonical line bundle of Y_k has exact order two.

Proof/construction: Base change P to the constant étale group of order two. The generator of its geometric points is ω; descend the assertion and rule out triviality.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard`, `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `EnriquesSurfacesAndIntegralNonexistence:E2/relative-picard-invariants`.

Sources: SCH23-author, Theorem 5.6, pp. 16–18.

### numerical-line-bundle-descent — Descent of numerical classes

For an Enriques family over R with constant full Picard, Pic(R)=0 and H²_ét(Spec R,G_m)=0, each geometric numerical class on a field fibre Y_k is represented by a k-line bundle. Its class in Pic(Y_k) is unique modulo tensoring with ω_Yk.

Proof/construction: Use the Picard Leray edge sequence over R to lift sections of the full relative Picard to line bundles; the stated H² kills its obstruction. Restrict to k and compare the kernel Pic^τ(k)=⟨ω⟩. Azumaya Brauer vanishing alone is not substituted for the full cohomological group on arbitrary affine R.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Retain full H²_ét(G_m)=0 on a nonregular R.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard`, `EnriquesSurfacesAndIntegralNonexistence:E2/residue-canonical-order`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: SCH23-author, Theorem 5.6, pp. 16–18.

### minus-two-curve-descent — Descent of (-2)-curves

With the hypotheses of numerical-line-bundle descent, every geometric (−2)-curve on Y_k descends to a k-curve isomorphic to P¹_k.

Proof/construction: Lift its numerical class to a line bundle. Use Riemann–Roch and the uniqueness of the effective geometric (−2)-representative to descend the divisor. Perfectness of the Enriques lattice gives a line bundle of degree one on the descended genus-zero curve, splitting its conic form.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/numerical-line-bundle-descent`, `EnriquesSurfacesAndIntegralNonexistence:E1/curves-and-two-sections`, `EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry`, `SchemeAndStackFoundations:SF.5`.

Sources: SCH23-author, Theorem 5.6, pp. 16–18.

### fibration-descent — Descent of genus-one fibrations

With the same constant-full-Picard, Pic(R)=0 and cohomological-Brauer-zero hypotheses, each geometric genus-one fibration descends to a fibration Y_k→P¹_k, up to base isomorphism.

Proof/construction: Descend its half-fibre class and the effective divisor through Riemann–Roch. Descend the pencil to a genus-zero base; the half-fibre yields a degree-one point/divisor on the base and identifies it with P¹ rather than a nonsplit conic. Descend the structure map by the linear system and verify its generic fibre.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/numerical-line-bundle-descent`, `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `SchemeAndStackFoundations:SF.5`.

Sources: SCH23-author, Theorem 5.6, pp. 16–18.

### rational-tame-double-fibres — Rational tame double fibers

Every descended fibration in that descent package has precisely two tame double fibres, and both base points are k-rational.

Proof/construction: The canonical bundle has order two, so the geometric classical formula gives exactly two tame fibres. The separately descended effective half-fibres force their base points to be rational, rather than only their sum being Galois invariant.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/residue-canonical-order`, `EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-canonical-bundle`, `EnriquesSurfacesAndIntegralNonexistence:E2/numerical-line-bundle-descent`.

Sources: SCH23-author, Theorem 5.6, pp. 16–18.

### residue-fibration-exists — Existence over the residue field

Every field fibre of the descent package has a genus-one fibration to P¹_k.

Proof/construction: Choose a geometric fibration using E1 and descend it with E2. This conclusion uses the full Picard hypotheses, not numerical constancy alone.

Hypotheses: An Enriques family is flat proper finitely presented as an algebraic-space map, with geometric Enriques fibres. For residue-field descent, R has Pic(R)=0 and H²_ét(Spec R,G_m)=0 and full Picard is constant, exactly as stated. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/fibration-exists`, `EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent`.

Sources: SCH23-author, Theorem 5.6, pp. 16–18.

## E3 — Integral Picard constancy through dyadic twists

First prove numerical constancy and Num-only point counts. Obtain local sections and projective scheme models, compare canonical covers over Q₂, remove the ramified difference with one of four global twists and apply the imported Fontaine obstruction. Split the remaining étale extension.

### num-over-z — Num over z

For an Enriques family over Z, Num is constant of rank ten, and over F_p its fibre has 1+10p+p² points; in particular the F₂ fibre has 25 points.

Proof/construction: Use π₁(Spec Z)=1 from Minkowski and the étale numerical local system to make Num constant. Apply WeilConjectures WC.7 to b₁=b₃=0 and b₂=ρ=10; the trace calculation depends only on Num. Supply the algebraic-space-to-fibre-scheme comparison without assuming constant full Picard. Decompose a finite étale Z-algebra into connected normal domain factors; the built bijective_algebraMap_int_of_finite_of_unramified makes each factor Z. The SF.0 finite-étale/fundamental-group adapter therefore gives π₁(Spec Z)=1, and the continuous action on a discrete finite-rank lattice is trivial. No separate Minkowski theorem is planned.

Hypotheses: All geometric surface hypotheses are stable under extension to an algebraic closure; the field and characteristic restrictions in the statement are part of the contract.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/relative-picard-invariants`, `EnriquesSurfacesAndIntegralNonexistence:E0/geometric-invariants`, `WeilConjectures:WC.7`, `mathlib:bijective_algebraMap_int_of_finite_of_unramified`, `SchemeAndStackFoundations:SF.0`.

Sources: SCH23-author, Proposition 5.5, author pp. 15–16; Corollary 7.3, p. 21.

### local-projectivity — Local projectivity for the excluded μ₂ branch

An Enriques family over a Noetherian local ring R with a section and constant Num is a projective R-scheme. For a family over Z, its base change to Z_p has this property at every prime p.

Proof/construction: With Pic^τ killed by two, double a numerical section into relative Picard. The section splits the Brauer edge obstruction, so it lifts to a line bundle. Lift an ample geometric closed-fibre numerical class and use numerical invariance of ampleness. Apply the algebraic-space spreading result in its geometric-fibre form (Stacks 0D3D); a neighbourhood containing the closed point of a local base is the whole base. Properness and an ample sheaf give projective scheme representability. For Z_p lift a nonempty F_p point by smooth Henselian lifting. The point count is E3/num-over-z, independent of full Picard constancy. This projectivity statement does not need the μ₂ branch.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E3/num-over-z`, `EnriquesSurfacesAndIntegralNonexistence:E2/section-cover`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.5`.

Sources: SCH23-author, This continuation’s local-model supplement to Proposition 5.5; Stacks, Lemma 74.13.2, tag 0D3D; Lemma 99.11.4, section tag 0D24; Stacks, Lemma 68.11.4, section tag 0EMV; Lemma 15.13.3, tag 0H74.

### local-canonical-cover — Canonical cover over Z₂ before Picard constancy

In the hypothetical Pic^τ=μ₂ branch of an Enriques family over Z, there is a canonical finite étale Z/2-cover over Z₂.

Proof/construction: Numerical constancy gives 25 F₂-points, and smooth Henselian lifting gives a Z₂-section. The section criterion produces the canonical torsor; Cartier duality makes its group étale Z/2. No full-Picard theorem or finite-field endpoint is invoked.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E3/num-over-z`, `EnriquesSurfacesAndIntegralNonexistence:E2/section-cover`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, Proposition 5.5 repair, step 1; Corollary 7.3 and Proposition 5.4(ii); Stacks, Lemma 68.11.4, section tag 0EMV; Lemma 15.13.3, tag 0H74.

### four-global-cover-twists — Canonical-cover twists supported at two

For a canonical Z/2-cover X of an Enriques family on Spec Z[1/2] in the Pic^τ=μ₂ branch, twisting by the base torsors s²=u for u=1,−1,2,−2 produces canonical finite étale covers. These four torsors are all the classes in H¹(Z[1/2],Z/2).

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `fourGlobalCanonicalTwists` | constructor: For a canonical Z/2-cover on Z[1/2], the four contracted-product covers for units 1,−1,2,−2. |
| `fourGlobalCanonicalTwists_group` | compatibility: The twisting law is multiplication of unit square classes; the unit-one twist is isomorphic to the original cover. |
| `fourGlobalCanonicalTwists_exhaustive` | characterisation: Every base Z/2-torsor on Z[1/2] has precisely one of the four unit square classes. |
| `fourGlobalCanonicalTwists_canonical` | functoriality: Each twisted cover has the same canonical Picard edge class after every base change. |

Tests:

- `test_four_twists_identity` (degenerate): The unit-one twist is canonically equivalent to twisting by the trivial base torsor.
- `test_four_twists_composition` (computation): Two unit-two twists compose to unit-four, a trivial square class, and recover the original cover.
- `test_four_twists_no_five` (non-example): The equation s²=5 does not define a base torsor over Z[1/2], because 5 is not a unit.
- `test_four_twists_finite_etale` (compatibility): Every chosen s²=u cover is finite étale of rank two over Z[1/2]; these equations are not used for an étale Z/2-cover on Z₂.

Consumers: E3 dyadic-cover-difference and remove-ramified-difference — Use precisely the globally extendable square classes to eliminate the two ramified coordinates.; E8 integral endpoint — Construct the canonical K3 cover whose local projective models enter Fontaine.

Proof/construction: Use Z/2≅μ₂ on this base, Kummer and Pic(Z[1/2])=0. Its units modulo squares are precisely ±1 and ±2. Since 2u is invertible the rank-two algebras are étale, and the contracted product preserves the canonical edge section.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-twisting`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

Sources: SCH23-author, Proposition 5.4 twisting action; explicit construction supplementing Proposition 5.5.

### dyadic-cover-difference — Dyadic difference class of canonical covers

Two canonical Z/2-covers over the same Q₂-fibre differ uniquely by a class in Q₂×/Q₂×²; this applies to a Z[1/2]-cover and the generic fibre of a Z₂-cover.

Proof/construction: Apply canonical twisting over Q₂. Identify Z/2 with μ₂ only after inverting two, then use Kummer over the field. Do not identify finite étale Z/2-torsors over Z₂ with μ₂ Kummer torsors there.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-twisting`, `EnriquesSurfacesAndIntegralNonexistence:E3/local-canonical-cover`, `EnriquesSurfacesAndIntegralNonexistence:E3/four-global-cover-twists`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

Sources: SCH23-author, Proposition 5.4 final assertion; repair of Proposition 5.5.

### remove-ramified-difference — Removing the ramified part of the difference

Write the difference class c uniquely as (−1)^e·2^a·5^b with e,a,b∈{0,1}. Exactly one u among 1,−1,2,−2 has cu in {1,5}, namely u=(−1)^e2^a. The global u-twist and the local twist by the unramified 5-class have isomorphic Q₂-fibres.

Proof/construction: Import dyadic unit/square classification from LocalFieldsRamification Layers 1–2 and native strong Hensel. The polynomial z²−z−1 over Z₂ is finite étale and has discriminant five, modelling the nontrivial unramified class. Multiplication of the exponent triples modulo two removes e,a and retains b; twist the local cover by that étale model when b=1.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E3/dyadic-cover-difference`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `mathlib:hensels_lemma`.

Sources: SCH23-author, This continuation’s proof of the previously unverified Proposition 5.5 comparison.

### etale-canonical-is-k3 — Étale canonical covers are K3 surfaces

If the canonical Cartier-dual group of a geometric Enriques surface is étale of rank two, its canonical torsor is a connected smooth K3 surface. This applies to ordinary surfaces in characteristic two and to Enriques surfaces in other characteristics.

Proof/construction: The canonical inclusion is nonzero, so the étale double torsor is connected. Étaleness gives smoothness, pullback trivializes ω and Euler characteristic doubles to two; coherent duality gives H¹(O)=0. Use the shared K3 definition from K3SurfacesAndSymplecticBoundedness, including its proper/projective bridge. Do not rename the singular K3-like local covers as K3 surfaces.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/canonical-family`, `EnriquesSurfacesAndIntegralNonexistence:E0/pic-tau-length`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-canonical-bundle`, `EnriquesSurfacesAndIntegralNonexistence:E1/ordinary-type`, `SchemeAndStackFoundations:SF.1`.

Sources: SCH23-author, Main-paper §4 and Proposition 5.5; canonical-cover theorem from the Enriques prerequisites.

### dyadic-representatives — Dyadic representatives

For e,a,b∈{0,1}, dyadicRepresentative(e,a,b)=(−1)^e2^a5^b∈Q×. After embedding in Q₂ these eight numbers represent distinct square classes, and every nonzero dyadic number has a unique represented class.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `dyadicRepresentative` | constructor: The explicit rational number (−1)^e2^a5^b, with each exponent Fin 2. |
| `dyadicRepresentative_nonzero` | characterisation: Each representative is nonzero. |
| `dyadicRepresentative_decomposition` | compatibility: The representative is globalTwist(e,a) times 5^b. |
| `dyadic_square_classes` | characterisation: For x∈Q₂× there is a unique triple (e,a,b) for which x/representative(e,a,b) is a square. |

Tests:

- `test_dyadic_minus_one` (computation): Representative(1,0,0)=−1.
- `test_dyadic_two` (computation): Representative(0,1,0)=2.
- `test_dyadic_five` (computation): Representative(0,0,1)=5.
- `test_dyadic_mixed` (computation): Representative(1,1,1)=−10.

Consumers: E3 four-twist matching — Select the exact ramified difference to remove.; E3 local unramified cover — Retain class five after removing signs and valuation parity.

Proof/construction: Specialize the existing local-field unit filtration to Q₂: valuation parity gives a, odd units modulo eight give e,b. For units congruent to one modulo eight, apply the existing strong Hensel theorem to the square equation. Unramified quadratic class five has the étale integral equation z²−z−1.

Hypotheses: The displayed finite index sets, ordered bases, scalars and exponents are exactly those in the statement; no geometric realization is assumed.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `mathlib:hensels_lemma`.

Sources: SCH23-author, §5, Proposition 5.5 repair; canonical E6 and routed /177–/179, author p. 16.

### global-twist — Global twist

Define globalTwist(e,a)=(−1)^e2^a in Q, regarded as a unit of Z[1/2]. Multiplication of a difference representative by this same global twist removes its ramified factors: representative(e,a,b)·globalTwist(e,a)=5^b(2^a)². Thus only classes one and five remain locally.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `globalTwist` | constructor: The rational number (−1)^e2^a with e,a∈Fin 2. |
| `globalTwist_nonzero` | characterisation: Each of the four rational twists is nonzero. |
| `globalTwist_removes_ramified_part` | compatibility: Representative(e,a,b)·globalTwist(e,a)=5^b(2^a)². |

Tests:

- `test_global_one` (degenerate): globalTwist(0,0)=1.
- `test_global_sign` (computation): globalTwist(1,0)=−1.
- `test_global_two` (computation): globalTwist(0,1)=2 and globalTwist(1,1)=−2.

Consumers: E3 repaired Proposition 5.5 — Use a globally allowed unit rather than an arbitrary Witt-field square class.; E8 integral endpoint — Supply the projective everywhere-good-reduction cover needed by Fontaine.

Proof/construction: The sign and factor two each have exponent zero or one. Their squares disappear in Q₂×/(Q₂×)². Use the canonical torsor-twisting API over Z[1/2] and the étale local twist for class five; retain a Q₂-isomorphism of the resulting covers before gluing local good-reduction models.

Hypotheses: The displayed finite index sets, ordered bases, scalars and exponents are exactly those in the statement; no geometric realization is assumed.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E3/dyadic-representatives`, `EnriquesSurfacesAndIntegralNonexistence:E3/four-global-cover-twists`.

Sources: SCH23-author, §5, Proposition 5.5 repair; routed /176–/179, author pp. 15–16.

### four-twist-good-reduction — Canonical-cover compatibility at two

In the Pic^τ=μ₂ branch over Z, one of the four Z[1/2]-twists of a canonical cover has a geometric K3 generic fibre over Q and smooth proper projective scheme models over Z_p for every prime p.

Proof/construction: Construct a canonical cover over Z[1/2], where P is étale and Pic of the base is zero. Choose the Z₂-cover independently. Over Q₂ remove the ramified difference by the global u-twist and the unramified local 5-twist. At odd p base change the twisted global étale cover; at two use the corrected Z₂-cover. Each base is a projective scheme by local-projectivity and its finite étale cover is projective and smooth. The Q_p generic models agree with the chosen global Q-cover. Only now apply the imported Fontaine theorem: good reduction everywhere forces h²,⁰=0, contradicting the K3 value one. This is the repaired comparison, not the printed unproved equality over W(F̄₂).

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E3/four-global-cover-twists`, `EnriquesSurfacesAndIntegralNonexistence:E3/local-canonical-cover`, `EnriquesSurfacesAndIntegralNonexistence:E3/dyadic-cover-difference`, `EnriquesSurfacesAndIntegralNonexistence:E3/remove-ramified-difference`, `EnriquesSurfacesAndIntegralNonexistence:E3/local-projectivity`, `EnriquesSurfacesAndIntegralNonexistence:E3/etale-canonical-is-k3`, `EnriquesSurfacesAndIntegralNonexistence:E3/dyadic-representatives`, `EnriquesSurfacesAndIntegralNonexistence:E3/global-twist`.

Sources: SCH23-author, Proposition 5.5 proof, p. 16.

### split-etale-lattice-extension — Splitting of Z/2-extensions of a constant lattice over Spec Z

Over a connected base S with every finite étale Z/2-torsor trivial, any commutative group-scheme extension of (Zⁿ)_S by (Z/2)_S splits. Over Z this applies to the Enriques Picard extension once P is the étale branch.

Proof/construction: Above each numerical basis vector the fibre is a finite étale Z/2-torsor. Choose its S-section and extend the chosen lifts additively from the free lattice; commutativity makes this a group-scheme splitting. Apply trivial finite étale covers of Spec Z.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `mathlib:bijective_algebraMap_int_of_finite_of_unramified`, `SchemeAndStackFoundations:SF.0`.

Sources: SCH23-author, proof of Proposition 5.5, p. 16 (sequence (4)).

### integral-full-picard — Constant Picard scheme over Z

Every Enriques family over Z has constant full Picard scheme (Z¹⁰⊕Z/2)_Z.

Proof/construction: Start with Num constancy, then Oort–Tate rank-two classification over Z gives P=μ₂ or Z/2. The four-twist K3 good-reduction argument and the imported Fontaine obstruction exclude μ₂. In the remaining étale branch split the extension by lifting all numerical basis vectors through trivial étale torsors. This order avoids circularity with descent and F₂ nonexistence.

Hypotheses: An Enriques algebraic-space family over Z, or its stated local/base restriction. The Pic^τ=μ₂ hypothesis is retained in the four-cover comparison; numerical constancy is proved before full Picard constancy. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E3/num-over-z`, `EnriquesSurfacesAndIntegralNonexistence:E3/four-twist-good-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E3/split-etale-lattice-extension`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

Sources: SCH23-author, Proposition 5.5, pp. 15–16.

## E4 — Finite-field Jacobians and descended sections

Apply the generic Jacobian model and local genus-one comparison. Repair smooth-point and Tsen arguments, obtain constant Jacobian Picard and matching fibre point counts. Import the rational-Jacobian classification with its completeness gate.

### enriques-jacobian — Jacobian of an Enriques genus-one fibration

Given an Enriques genus-one fibration φ:Y→P¹_k, its Jacobian is the generic Pic⁰ curve in the elliptic case and the regular compactification of that group curve in the quasielliptic case, extended by the supplier relatively minimal regular surface model J→P¹. It has its canonical zero-section. This construction is an Enriques adapter to the shared genus-one Jacobian construction.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `enriquesJacobian` | constructor: Specialize the shared Jacobian minimal regular model to an Enriques genus-one fibration. |
| `enriquesJacobian_zero` | data: The generic identity extends to the zero-section of the minimal model. |
| `enriquesJacobian_generic` | characterisation: Its generic fibre identifies with Pic⁰ or its regular compactification, according to elliptic/quasielliptic type. |
| `enriquesJacobian_iso` | compatibility: Isomorphic fibrations induce the supplier Jacobian isomorphism. |

Tests:

- `test_jacobian_elliptic` (compatibility): For a smooth generic genus-one curve, the generic Jacobian is its Pic⁰ elliptic curve.
- `test_jacobian_quasielliptic` (compatibility): For the quasielliptic case retain the regular compactification, rather than calling the group curve smooth elliptic.
- `test_jacobian_multiplicity` (non-example): The Jacobian has a section, so it does not inherit a torsor fibre multiplicity two as a Jacobian scheme fibre.

Consumers: E4 local fibres — Compare Kodaira symbols separately from torsor multiplicities.; E5 configurations — Feed the geometrically rational Jacobian to the supplier classification.

Proof/construction: Import the generic relative Pic⁰/Jacobian and minimal-model construction from GenusOneFibrationsAndRationalEllipticSurfaces. Prove independence of model choices and compatibility of the Enriques input; do not build another Jacobian category.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `SchemeAndStackFoundations:SF.0`.

Sources: SCH23-author, §6, p. 19.

### enriques-jacobian-rational — Rationality of the Enriques Jacobian

The relatively minimal regular Jacobian surface of any Enriques genus-one fibration is geometrically rational.

Proof/construction: Over k̄ restrict to the open base with simple fibres and identify the torsor/Jacobian there by the local genus-one theory. Transfer R¹φ_*O and compute the Enriques Euler characteristic contribution to obtain χ(O_J)=1. Apply the supplier rational genus-one surface criterion. The assertion includes quasielliptic Jacobians.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian`, `EnriquesSurfacesAndIntegralNonexistence:E0/geometric-invariants`, `SchemeAndStackFoundations:SF.1`.

Sources: SCH23-author, Proposition 6.2, p. 19.

### jacobian-kodaira-match — Matching geometric Kodaira types

For an elliptic fibration on a constant-full-Picard Enriques surface over F₂, the torsor and its Jacobian have the same geometric Kodaira type at every closed base point after removing the torsor scheme multiplicity.

Proof/construction: Pass to the strict Henselization with algebraically closed residue field and invoke corrected Liu–Lorenzini–Raynaud 6.6 through the genus-one supplier. Keep the multiplicity integer outside the type label.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian`, `EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`.

Sources: SCH23-author, Proposition 9.2, p. 24.

### simple-fibre-isomorphism — Simple-fiber identification

At a simple fibre of that elliptic fibration, the Jacobian fibre and Enriques fibre are isomorphic over the residue field.

Proof/construction: Find a point of the smooth locus of the whole scheme fibre. For tree additive types choose a multiplicity-one terminal component; for I_n cycles remove at most two intersection points from a split P¹; for type IV remove its single triple-intersection point. Treat nonsplit I₁/I₂ by their normalization/conductor descriptions. Do not use the regular locus of the reduction when the scheme fibre has thicker components. Lift that smooth point over the Henselian local base, trivialize the generic torsor and invoke uniqueness of the minimal regular model. This supplies the residue-field isomorphism, not only equal geometric type.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: The smooth-point argument covers I_n cycles and type IV, neither of which has a terminal dual-graph vertex.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-kodaira-match`, `EnriquesSurfacesAndIntegralNonexistence:E2/minus-two-curve-descent`, `SchemeAndStackFoundations:SF.0`.

Sources: SCH23-author, Proposition 9.2, p. 24.

### nonrational-jacobian-fibres — Nonrational fibers

Each geometric Jacobian fibre above a non-F₂-rational closed point is irreducible.

Proof/construction: Apply numerical contraction descent to the Enriques surface: a reducible geometric fibre would force a purely inseparable residue extension of F₂ and hence a rational base point. Transfer component counts via Kodaira matching.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-kodaira-match`, `EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard`.

Sources: SCH23-author, Proposition 9.3, p. 25.

### jacobian-no-i0-star — Excluded I₀*

No geometric Jacobian fibre in this setting has type I₀*.

Proof/construction: Numerical Picard graph descent makes the components and attachment points rational in an I₀* fibre. Its central P¹ would have four distinct F₂-points, whereas P¹(F₂) has only three. Transfer the exclusion via Kodaira matching.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-kodaira-match`, `EnriquesSurfacesAndIntegralNonexistence:E2/minus-two-curve-descent`.

Sources: SCH23-author, Proposition 9.3, p. 25.

### semistable-graph-descent — Semistable graph descent

For each semistable Jacobian fibre, base change to an algebraic closure induces an isomorphism on the dual graph over its residue field.

Proof/construction: Use the constant numerical Enriques local system and the supplier graph descent. Combine simple-fibre isomorphism with the fact that semistable fibres are simple under the tame double-fibre restrictions.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/simple-fibre-isomorphism`, `EnriquesSurfacesAndIntegralNonexistence:E1/tame-types-char-two`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`.

Sources: SCH23-author, Proposition 9.3, p. 25.

### one-semistable-or-supersingular — At most one semistable or supersingular rational fiber

Among the three F₂-rational base points, at most one Jacobian fibre is semistable or smooth supersingular.

Proof/construction: The Enriques fibration has two rational tame double fibres, whose half-fibres are ordinary or additive. For smooth multiple reduction use the genus-one supplier Corollary 8.3 isomorphism, not just the Kodaira symbol I₀, to transfer ordinarity. Simple fibres use the fibre isomorphism.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/tame-types-char-two`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`, `EnriquesSurfacesAndIntegralNonexistence:E4/simple-fibre-isomorphism`.

Sources: SCH23-author, Proposition 9.3, p. 25.

### mordell-weil-descent — Descent of all Mordell–Weil sections

Every geometric Mordell–Weil section of the Jacobian of a constant-full-Picard Enriques elliptic fibration over F₂ is defined over F₂. Thus MW(J/P¹)=MW(J_F̄₂/P¹_F̄₂) under base change.

Proof/construction: Over F̄₂(t), Tsen kills the Brauer obstruction to Picard points being line bundles. Restriction from geometric Pic(Y) to the generic curve is surjective; subtract degree/2 times a descended two-section R to obtain the Galois-equivariant surjection to Pic⁰, hence MW. Constant full Picard makes this quotient action trivial; Galois-fixed points of J(F̄₂(t)) descend to J(F₂(t)). Br(F₂(t)) is not claimed zero, and the square-zero two-section case is retained.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Tsen is used over F̄₂(t) only; no line-bundle descent over F₂(t) is inferred from it.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/integral-two-section-exists`, `EnriquesSurfacesAndIntegralNonexistence:E2/numerical-line-bundle-descent`, `EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent`, `EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: SCH23-author, Proposition 9.3, p. 25.

### jacobian-enriques-fibre-counts — Fibre counts of the jacobian match the Enriques surface

At each a∈P¹(F₂), the point-count quantity n_a attached to the Jacobian equals #Y_a(F₂). Summing the three values gives 25.

Proof/construction: At simple fibres use the actual fibre isomorphism. At smooth multiple reduction use the local torsor-reduction isomorphism from Corollary 8.3. For additive multiple fibres use the supplier singular-fibre count and the descended graph; nilpotent thickening does not change rational points. Sum over the rational base and use the Num-only surface count.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/simple-fibre-isomorphism`, `EnriquesSurfacesAndIntegralNonexistence:E4/one-semistable-or-supersingular`, `EnriquesSurfacesAndIntegralNonexistence:E3/num-over-z`.

Sources: SCH23-author, §9, p. 26.

### jacobian-constant-picard — Constant Picard of the Jacobian

The Jacobian of an elliptic fibration on a constant-full-Picard Enriques surface over F₂ has constant Picard scheme.

Proof/construction: Verify the supplier rational-Jacobian criterion: irreducibility at nonrational points, no I₀*, split semistable graphs, at most one semistable/supersingular rational fibre, full Mordell–Weil descent and fibre-count sum 25. Its graph proof must use the unimodular pairing repair for affine D-types, direct IV triangle argument and multiplicity-labelled E₇/E₈ terminal vertices. Apply the criterion to the geometrically rational J.

Hypotheses: For the finite-field comparisons, Y/F₂ has constant full Picard and its chosen fibration is elliptic. The Jacobian constructor and geometric rationality theorem retain arbitrary-field and quasielliptic scope. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian-rational`, `EnriquesSurfacesAndIntegralNonexistence:E4/nonrational-jacobian-fibres`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-no-i0-star`, `EnriquesSurfacesAndIntegralNonexistence:E4/semistable-graph-descent`, `EnriquesSurfacesAndIntegralNonexistence:E4/one-semistable-or-supersingular`, `EnriquesSurfacesAndIntegralNonexistence:E4/mordell-weil-descent`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-enriques-fibre-counts`.

Sources: SCH23-author, Theorem 9.1, p. 24.

## E5 — Candidate configurations and their first reductions

Keep fourteen elliptic candidates and four quasielliptic ones. Exclude the three omitted elliptic cases as a separate proof obligation; establish multiplicity and partner restrictions, then the I₈, II*, IV*, IV and multiple-I₄* reductions on their precise domains.

### elliptic-candidate-reduction — Elliptic configurations on constant-Picard Enriques surfaces

Subject to the supplier classification-completeness theorem PAPER-SCHROER-23/247, an elliptic fibration on a constant-full-Picard Enriques Y/F₂ has its three rational-fibre types in the fourteen-candidate list specified below. The additional I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂ candidates have multiple additive and ordinary E₄ fibres and a simple nonsplit semistable fibre. The list asserts necessary possibilities, not existence of any Enriques realization.

Proof/construction: Feed E4 rationality, constant Picard, point counts and the semistable/supersingular restriction to the shared rational-elliptic classification. Transfer fibres by E4 local comparison, retaining multiplicity data. The reviewed model list alone does not prove exhaustiveness; /247 is an explicit external gap and is required before this theorem can close.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-constant-picard`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-kodaira-match`, `EnriquesSurfacesAndIntegralNonexistence:E4/simple-fibre-isomorphism`, `EnriquesSurfacesAndIntegralNonexistence:E4/one-semistable-or-supersingular`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-enriques-fibre-counts`.

Sources: SCH23-author, Proposition 11.1 and table (12), pp. 32–33 (the proposition begins on p. 32, the table is on p. 33); proof pp. 33–34.

### quasielliptic-component-sum — Quasielliptic component sum

For a quasielliptic fibration on a constant-full-Picard Enriques surface over F₂, r₀+r₁+r_∞=11. The possible symbols with at most nine components are II, III, I₂*, III*, II*, I₄*, with counts 1,2,7,8,9,9.

Proof/construction: Use the supplier 2-torsion generic Pic⁰ and the vertical Picard rank formula ρ=2+Σ(r_a−1). Numerical contraction descent confines reducible fibres to rational points. Exclude I₀* by the rational-point argument and larger I_{2n}* by the component bound.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/geometric-invariants`, `EnriquesSurfacesAndIntegralNonexistence:E2/constant-picard`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-no-i0-star`.

Sources: SCH23-author, Proposition 11.1 proof, p. 33.

### quasielliptic-candidates — Quasielliptic configurations

The rational-fibre type triple of a quasielliptic fibration in that setting is one of II*+II+II, III*+III+II, I₄*+II+II or I₂*+III+III, up to permutation of the rational base points.

Proof/construction: Enumerate component counts adding to eleven from the six permitted symbols, using the genus-one supplier quasielliptic classification. Keep the two different symbols with nine components as separate cases. This component-count argument does not certify the elliptic candidate list.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-component-sum`.

Sources: SCH23-author, Proposition 11.1, p. 33.

### forced-multiple-types — Forced multiple fibers

For a nonexceptional constant-full-Picard Enriques Y/F₂, every IV, IV*, II* or I₁* fibre is multiple, assuming the corrected elliptic classification is exhaustive.

Proof/construction: In every relevant elliptic candidate a different fibre is semistable or supersingular and hence cannot be one of the two tame multiple fibres. The added IV* case still forces IV* and E₄ multiple. In the quasielliptic II* case use the simple-fibre exceptionality restriction.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-candidates`, `EnriquesSurfacesAndIntegralNonexistence:E1/tame-types-char-two`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`, `EnriquesSurfacesAndIntegralNonexistence:E1/quasielliptic-simple-restriction`.

Sources: SCH23-author, Proposition 11.1(i), p. 33.

### simple-iii-star-restriction — Simple III* preliminary restriction

A simple III* fibre on a nonexceptional constant-full-Picard Enriques Y/F₂ forces an elliptic fibration with rational-fibre configuration III*+E₄+E₄, subject to classification completeness.

Proof/construction: Exclude quasielliptic simplicity by E1. In the other two III* elliptic candidates the semistable fibre is simple, forcing III* to be multiple; only the two ordinary smooth fibres remain.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-candidates`, `EnriquesSurfacesAndIntegralNonexistence:E1/quasielliptic-simple-restriction`, `EnriquesSurfacesAndIntegralNonexistence:E1/tame-types-char-two`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`.

Sources: SCH23-author, Proposition 11.1(ii), p. 33.

### no-rational-special-two-section — Excluded rational two-section for exceptional-type half-fibers

For a multiple IV*, III* or II* fibre on such Y, no (−2)-curve R has intersection one with its indecomposable divisor.

Proof/construction: Since the full fibre is twice the indecomposable divisor, this intersection makes R a rational two-section. Apply the nonexceptional multiple-special restriction.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/multiple-special-restriction`, `EnriquesSurfacesAndIntegralNonexistence:E1/curves-and-two-sections`, `EnriquesSurfacesAndIntegralNonexistence:E1/half-fibre`.

Sources: SCH23-author, Proposition 11.1(iii), p. 33.

### omitted-configurations-exclusion — Exclude the three omitted Enriques configurations

For nonexceptional constant-full-Picard Enriques Y/F₂, no genus-one fibration has any of I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ or IV*+E₄+Ĩ₂ as its rational-fibre configuration.

Proof/construction: This is a new proof obligation, not a theorem established by the read source. Analyze each of the three configurations with its additive and E₄ multiple fibres, the simple nonsplit semistable fibre, numerical lattice and partner half-fibres. A proof must exclude all three with complete branches and independently justified new fibrations. For IV*+E₄+Ĩ₂ the other multiple fibre is smooth ordinary, so the printed IV* argument requiring a III/IV half-fibre does not apply. Neither the candidate Jacobian equations nor the existing eight-case reduction supplies an exclusion. Record the gap and require it on every downstream use of the printed table.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: A proof must exclude three Enriques realizations; it cannot infer nonexistence solely from a Jacobian model list.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-rational-special-two-section`.

Sources: SCH23-author, Missing proof branch of Proposition 11.1 through Theorem 15.1; E34/E44; arXiv v3 pp. 33–38, 49.

### no-i8 — Elimination of I₈

On a nonexceptional constant-full-Picard Enriques Y/F₂ there is no genus-one fibre of type I₈, once the corrected candidate classification and omitted-case exclusions are supplied.

Proof/construction: Use the partner half-fibre and the degree-one incidence with a III half-fibre to force the partner configuration III+E₄+I₈. Enumerate the additional components and their nonnegative incidences. The two remaining incidence choices generate canonical-type I₃ or I₇ curves, hence fibrations outside the now certified candidate table. The nonexceptional hypothesis supplies the partner omitted in the printed statement.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-candidates`, `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`.

Sources: SCH23-author, Proposition 11.2, pp. 34–35.

### no-ii-star — Elimination of II*

No genus-one fibration on such a nonexceptional constant-full-Picard Y/F₂ has a II* fibre, after the two classification gates.

Proof/construction: It must be multiple. A partner half-fibre meets its unique multiplicity-one component once, leaving the E₈ subgraph vertical. A II* partner fibre is multiple; its additional component meets a component of multiplicity at least two, contradicting half-fibre intersection one.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/forced-multiple-types`, `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`.

Sources: SCH23-author, Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38).

### no-multiple-i4-star — No multiple I₄*

No genus-one fibration on such Y has a multiple I₄* fibre, after the two classification gates.

Proof/construction: The partner half-fibre leaves D₈ vertical. With II* excluded, the additional partner component must complete another I₄*. Intersection at most two forces it disjoint from the original terminal component, producing an I₀* canonical-type curve. This contradicts the I₀* exclusion.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/no-ii-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-no-i0-star`.

Sources: SCH23-author, Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38).

### no-iv-star — Elimination of IV*

No genus-one fibration on such Y has a IV* fibre, after classification completeness and the separate IV*+E₄+Ĩ₂ exclusion.

Proof/construction: Work on the printed IV*+E₃+IV or IV*+E₅+III branch only. A partner leaves E₆ vertical; a IV* completion contradicts intersection one, and a simple III* completion has two ordinary half-fibres. Enumerate intersections with the other III/IV half-fibre, reject an I₈ curve, then force four distinct rational points on a descended P¹. The smooth ordinary other-half-fibre case is handled by omitted-configurations-exclusion, not by this four-point argument.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/forced-multiple-types`, `EnriquesSurfacesAndIntegralNonexistence:E5/simple-iii-star-restriction`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-ii-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-i8`, `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E2/minus-two-curve-descent`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`.

Sources: SCH23-author, Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38).

### no-iv — Elimination of IV

No genus-one fibration on such Y has a IV fibre, after the two classification gates.

Proof/construction: In the IV+I₁*+E₅ branch choose the partner half-fibre, with both additive fibres multiple. The remaining D₅ and A₂ vertical subgraphs either lie in different partner fibres, forcing two simple fibres, or in the same one. Include the missing same-fibre branch: after II*, IV* and I₈ are excluded, its simple I₄* completion places an A₂ on components of weights two and one. Intersection at least three contradicts the bound two. This uses the I₁* indecomposable fibre in the first intersection inequality, correcting the printed base-point slip.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/no-ii-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-iv-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-i8`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-multiple-i4-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`.

Sources: SCH23-author, Proposition 11.3, p. 35; proof pp. 36–38 (II* case and multiple I₄* case p. 36, IV* case p. 37, IV case pp. 37–38).

### residual-configurations — Printed residual configurations and three open candidates

Once classification completeness and omitted-configurations-exclusion hold, only eight rational-fibre configurations remain: elliptic I₄*+E₄+E₂, III*+E₄+I₂, III*+E₂+Ĩ₂, III*+E₄+E₄, I₁*+E₄+I₄; quasielliptic I₄*+II+II, III*+III+II, I₂*+III+III.

Proof/construction: Remove I₈, II*, IV*, IV and the three extra candidates from the fourteen-plus-four list. Prior to the omitted-case proof, retain all three extra configurations alongside the printed eight; never publish an unconditional eight-case reduction.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-candidates`, `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-i8`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-ii-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-iv-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-iv`.

Sources: SCH23-author, Proposition 11.4, p. 38.

### residual-multiplicities — Multiplicity restrictions in the residual table

Within the certified residual table I₁* fibres are multiple, whereas I₄*, semistable I_n and nonsplit I₂ fibres are simple.

Proof/construction: Use forced I₁* multiplicity, the multiple-I₄* exclusion and the tame characteristic-two half-fibre restrictions. Keep type and scheme multiplicity as separate data.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E5/forced-multiple-types`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-multiple-i4-star`, `EnriquesSurfacesAndIntegralNonexistence:E1/tame-types-char-two`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`.

Sources: SCH23-author, Proposition 11.4, p. 38.

### partner-over-f2 — Partner fibration over F₂

Each genus-one fibration on a nonexceptional constant-full-Picard Enriques Y/F₂ has a partner fibration defined over F₂ with full fibre-class intersection four.

Proof/construction: Apply the geometric nonexceptional partner theorem over F̄₂, then descend the fibration using the full-Picard descent package. Intersection is preserved by base change, so the degree remains four over F₂.

Hypotheses: Y/F₂ has constant full Picard. Nonexceptional is additionally imposed for partner-based exclusions and every reduction after candidate enumeration. /247 exhaustiveness and /246 omitted exclusions are explicit gates wherever the certified table is used. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent`.

Sources: SCH23-author, Proposition 11.4, p. 38.

## E6 — Ten-curve lattices and the I₄* exclusion

Specify both ten-curve graphs and revised integral Gram matrices. Use built discriminant forms and even overlattices, generic degree-zero Picard quotients, descended integral two-sections of square 0 or −2, and exhaustive incidence orbits to exclude I₄*.

### ten-curve-gram-models — Ten curve gram models

Define firstGram=N₁ and secondGram=N₂ on Fin 10 with the two ordered bases in first-discriminant and second-discriminant. Construct firstLattice and secondLattice with IntegralLattice.ofGramMatrix and Pi.basisFun over Q, retaining its full Z-carrier. The matrices are symmetric and even, have determinant −4, and induce their displayed entries on the native carrier basis.

API (namespace `TauCeti.Enriques`):

| Name | Role and contract |
| --- | --- |
| `firstGram` | data: N₁ in basis (C₁,…,C₈,R,F), with the explicit entries stated above. |
| `secondGram` | data: N₂ in basis (C₁,…,C₈,F′,F), D₈(−1)⊕U. |
| `firstLattice` | constructor: The native IntegralLattice.ofGramMatrix of N₁ on Q¹⁰. |
| `secondLattice` | constructor: The native IntegralLattice.ofGramMatrix of N₂ on Q¹⁰. |
| `firstGram_symmetric` | compatibility: firstGram.IsSymm. |
| `secondGram_symmetric` | compatibility: secondGram.IsSymm. |
| `firstGram_determinant` | characterisation: det N₁=−4. |
| `secondGram_determinant` | characterisation: det N₂=−4. |
| `firstLattice_even` | characterisation: The native firstLattice.IsEven condition holds. |
| `secondLattice_even` | characterisation: The native secondLattice.IsEven condition holds. |
| `firstLattice_basis_pairing` | compatibility: The native carrier basis pairing is firstGram i j. |
| `secondLattice_basis_pairing` | compatibility: The native carrier basis pairing is secondGram i j. |

Tests:

- `test_first_r_c4` (computation): firstGram 8 3=1.
- `test_first_r_f` (computation): firstGram 8 9=1.
- `test_first_f_square` (computation): firstGram 9 9=0.
- `test_second_u` (computation): secondGram 8 8=0 and secondGram 8 9=1.
- `test_second_orthogonal` (non-example): secondGram 8 3=0: it does not have the R-to-C₄ edge of N₁.
- `test_second_fork` (computation): secondGram 5 6=secondGram 5 7=1.

Consumers: E6 both discriminant calculations — Use the built discriminant group and half-norm, not a surrogate finite form.; E6 spinor-incidences and square-zero-calculation — Use the exact inverse entries of the revised source.

Proof/construction: Enter the revised integer matrices rather than a new abstract lattice record. Their D₈ chain has edges (C₁,C₂),…,(C₅,C₆),(C₆,C₇),(C₆,C₈). N₁ adds R²=−2, R·C₄=R·F=1; N₂ has the orthogonal U block F′·F=1. Invoke native Gram constructor and basis-pairing theorem. Exact rational elimination verifies both inverses against (14),(16), determinant −4 and rank eight modulo two. The latter with determinant absolute value four proves Smith factors 1⁸,2,2. Verify the dual norm coefficients and the fifteen incidence cosets with the native half-norm convention.

Hypotheses: The displayed finite index sets, ordered bases, scalars and exponents are exactly those in the statement; no geometric realization is assumed.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `tauceti:TauCeti.IntegralLattice.ofGramMatrix`, `tauceti:TauCeti.IntegralLattice.integralForm_ofGramMatrix_apply`, `mathlib:Pi.basisFun`.

Sources: SCH23-author, §12, matrices (14), (16), author pp. 41–44.

### first-discriminant — First ten-curve lattice discriminant

For the first hypothetical ten-curve graph, use the ordered lattice basis (C₁,…,C₈,R,F). Its Gram matrix N₁ has C_i²=R²=−2, F²=0, D₈ chain/fork incidences, R·C₄=R·F=1 and all other entries involving R,F zero. It has determinant −4, invariant factors 1⁸,2,2 and index two in unimodular Num(Y). The vector class has full norm −1 and the two spinor classes full norm −2; native half-norm values are 1/2,0,0 modulo Z.

Proof/construction: Construct the integral Gram lattice using the native ofGramMatrix, compute determinant, inverse and Smith data exactly, and compare the chosen geometric classes with that basis. Use the native discriminant cardinality and index-square formula for the embedding in Num(Y). Translate full norm modulo 2Z to the built half-norm modulo Z; do not define another discriminant form.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: N₁^{-1} must match all entries of revised matrix (14); negative full norm −2 has native q=0.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry`, `tauceti:TauCeti.IntegralLattice.discriminantQuadraticMap`, `tauceti:TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`, `EnriquesSurfacesAndIntegralNonexistence:E6/ten-curve-gram-models`.

Sources: SCH23-author, §12 matrix(14), pp. 41–42.

### second-discriminant — Second ten-curve lattice discriminant

For the second hypothetical graph use basis (C₁,…,C₈,F′,F), with D₈(−1) block and U block: F²=F′²=0, F·F′=1 and both orthogonal to C₁,…,C₈. Its matrix N₂ has determinant −4 and invariant factors 1⁸,2,2; Num(Y)/S has order two. The three nonzero discriminant classes are one anisotropic vector class and two isotropic spinor classes.

Proof/construction: Use the native Gram lattice, exact inverse (16), Smith/cardinality and even-overlattice classification. Determine the two allowed index-two even extensions. The generic degree part is split off separately and is not included in this order-two quotient.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E0/numerical-lattice-isometry`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-discriminant`, `tauceti:TauCeti.IntegralLattice.discriminantQuadraticMap`, `EnriquesSurfacesAndIntegralNonexistence:E6/ten-curve-gram-models`.

Sources: SCH23-author, §12 matrix(16), p. 43.

### generic-pic-zero-quotient — Generic degree-zero Picard quotient

For either ten-curve setting, let T be the two-section R in the first case or the integral half-fibre F′ in the second. The map L↦(L−(L·F)T)|_{Y_K} induces Num(Y)/⟨C₁,…,C₈,T,F⟩≅Pic⁰(Y_K), of order two. Restriction splits Pic(Y_K)=Pic⁰(Y_K)⊕Z[T_K], with degree image 2Z.

Proof/construction: Import surjectivity of restriction on the regular surface and its vertical-divisor kernel from the genus-one supplier. The canonical class is a difference of half-fibres and restricts trivially, so the map descends through Num. Prove kernel exactly S and use T to remove the degree component. The second case source prints Pic in place of Pic⁰; retaining the infinite degree factor would invalidate the index-two assertion.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/classical-canonical-bundle`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-discriminant`, `EnriquesSurfacesAndIntegralNonexistence:E6/second-discriminant`, `EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: SCH23-author, Proposition 12.3 proof, p. 43.

### generating-two-section — Two-section of square zero or minus two

The nonzero class of the order-two generic Pic⁰ quotient is represented by an integral two-section R̃ with R̃²=0 or −2 and Num(Y)=S+ZR̃, defined over F₂ in the two configurations.

Proof/construction: Twist the chosen degree-two line bundle by the nontrivial Pic⁰ class, use Riemann–Roch on the genus-one generic curve and close its divisor in Y. Apply geometric degree-two reducibility while preserving that quotient class, then descend the resulting curve/fibration. Neither R̃≅P¹ nor R̃²=−2 is assumed.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E6/generic-pic-zero-quotient`, `EnriquesSurfacesAndIntegralNonexistence:E1/degree-two-reducibility`, `EnriquesSurfacesAndIntegralNonexistence:E2/minus-two-curve-descent`, `EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`.

Sources: SCH23-author, Proposition 12.2 proof, pp. 41–42.

### spinor-incidences — Incidences of the generating two-section

For the generating two-section R̃ in either ten-curve setting, precisely two of (R̃·C₀,…,R̃·C₈) are one and all others zero. The pairs are {0,8},{1,7} for one spinor class and {0,7},{1,8} for the other. In the first setting independent terminal swaps preserve S and allow {0,8}; in the second only the {7,8} swap is used, leaving {0,8} and {1,8}.

Proof/construction: Enumerate all fifteen nonnegative incidence vectors of weighted degree two for the affine D₈ fibre. Map each through the revised inverse Gram matrix into S*/S; the zero and vector classes are excluded by generation and evenness. Check the actions of the terminal swaps on the actual basis, using C₀=2F−C₁−2Σ_{i=2}^6 C_i−C₇−C₈. A congruence R̃≡C₈* alone does not select the required incidence pair. Perform the finite enumeration and symmetry reduction explicitly before using the square calculation.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E6/generating-two-section`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-discriminant`, `EnriquesSurfacesAndIntegralNonexistence:E6/second-discriminant`.

Sources: SCH23-author, proof of Proposition 12.2, p. 42; proof of Proposition 12.3, pp. 43–44.

### square-zero-calculation — Square-zero two-section calculation

After the first-setting symmetry reduction, a square-zero generating two-section has class C₈*+nR*+F* with n=R̃·R≥0. The revised inverse matrix gives its square 2n, hence n=0 and R̃ is disjoint from R.

Proof/construction: Use the normalized incidences to express the vector in the dual basis. Expand its square with entries C₈*²=F*²=−2, R*²=C₈*·R*=0, C₈*·F*=2, R*·F*=1. Then nonnegative intersection zero gives disjoint support.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: This calculation is made only after the symmetry normalization, not from the spinor congruence alone.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E6/spinor-incidences`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-discriminant`.

Sources: SCH23-author, Proposition 12.2 proof, p. 42.

### first-ten-curves-forbidden — First forbidden ten-curve configuration

No nonexceptional constant-full-Picard Enriques Y/F₂ has ten (−2)-curves C₀,…,C₈,R with affine D₈ incidence and R meeting only C₄ once, all intersections simple normal crossings, after the classification gates.

Proof/construction: Use the first lattice and generic Pic⁰ quotient to choose the generating two-section. In square −2 its normalized incidences create an I₈ canonical-type curve, already excluded. In square zero the dual-basis calculation gives R̃·R=0, producing a simple III* partner fibration. An integral half-fibre of the original I₄* fibration has exactly two smooth rational points in either residual I₄* configuration. The two multiple partner half-fibres consume those points while the degree-one intersection with R gives a third, a contradiction. Check distinctness and smoothness of these intersections.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E6/first-discriminant`, `EnriquesSurfacesAndIntegralNonexistence:E6/generic-pic-zero-quotient`, `EnriquesSurfacesAndIntegralNonexistence:E6/generating-two-section`, `EnriquesSurfacesAndIntegralNonexistence:E6/spinor-incidences`, `EnriquesSurfacesAndIntegralNonexistence:E6/square-zero-calculation`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-i8`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E2/rational-tame-double-fibres`, `EnriquesSurfacesAndIntegralNonexistence:E2/minus-two-curve-descent`.

Sources: SCH23-author, Proposition 12.2 and dual graph (13), p. 41; proof pp. 41–42.

### opposite-tip-branch — Opposite tip branch

Under the certified residual table and first-ten-curves-forbidden, an I₄* fibration cannot have a partner half-fibre F with F·C₀=F·C₈=1 and all other F·C_i=0.

Proof/construction: The vertical chain C₁+⋯+C₇ can complete only to I₄* or III*. In the I₄* case the extra end components force an I₀* canonical-type curve by the full-fibre intersection-four bound. In the III* case its new middle component meets C₄ once and the same bound makes it disjoint from C₀ and C₈, giving the first forbidden ten-curve graph. This branch uses neither second-ten-curves-forbidden nor the completed no-I₄* theorem.

Hypotheses: All geometric surface hypotheses are stable under extension to an algebraic closure; the field and characteristic restrictions in the statement are part of the contract.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-multiplicities`, `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-ten-curves-forbidden`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-no-i0-star`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`.

Sources: SCH23-author, §12, proof of Proposition 12.1, opposite-terminal branch, author p. 40.

### second-ten-curves-forbidden — Second forbidden ten-curve configuration

No such Y has affine D₈ curves C₀,…,C₈ and another (−2)-curve R with R·C₀=2, R·C₂=1 and all other R·C_i=0. Require simple normal crossings away from the pair R,C₀; impose only intersection length two on that pair.

Proof/construction: The two I₄* subconfigurations give fibrations with fibre intersection four and half-fibres F,F′ meeting once. Use the second lattice, generic Pic⁰ quotient and reducibility to get the two-section. Enumerate spinor incidences. Square −2 creates I₈. Square zero is excluded by the incidence branch in the I₄* proof having F·C₀=F·C₈=1; that branch uses only the first ten-curve exclusion and no invocation of this second exclusion. Extract this branch as an independent lemma to avoid circularity.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E6/second-discriminant`, `EnriquesSurfacesAndIntegralNonexistence:E6/generic-pic-zero-quotient`, `EnriquesSurfacesAndIntegralNonexistence:E6/generating-two-section`, `EnriquesSurfacesAndIntegralNonexistence:E6/spinor-incidences`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-ten-curves-forbidden`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-i8`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E6/opposite-tip-branch`.

Sources: SCH23-author, Proposition 12.3 and dual graph (15), p. 42; proof pp. 43–44.

### i4-star-incidence-orbits — Six I₄* half-fiber incidence cases

For a simple I₄* fibre with weights (1,1,2,2,2,2,2,1,1), a partner half-fibre of full-fibre degree two has fifteen nonnegative incidence vectors in six graph-symmetry orbits: a single one at C₂,C₃ or C₄; ones at {C₀,C₁} or {C₀,C₈}; or a two at C₀.

Proof/construction: Enumerate weighted-degree-two nonnegative integral vectors. Act by swaps of the two fork tips and reversal of the D̃₈ chain, an order-eight group. Verify every vector lies in exactly one of the six representative orbits; this is arithmetic and does not assert realizability of the vectors.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/residual-multiplicities`, `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`.

Sources: SCH23-author, Proposition 12.1 proof, pp. 38–40.

### no-i4-star — Elimination of I₄*

No genus-one fibration on a nonexceptional constant-full-Picard Enriques Y/F₂ has an I₄* fibre, after the two classification gates.

Proof/construction: The fibre is simple. Use the six incidence orbits: middle C₄ creates I₈; C₃ creates an I₄ contradiction or too-large intersection; C₂ completions give I₈/I₄ or the first ten-curve graph; fork-tip pair creates I₀*; opposite-tip pair reduces to the first forbidden graph; a double terminal incidence reduces to the second forbidden graph. Separate the opposite-tip square-zero branch before invoking the second ten-curve exclusion. Every generated canonical-type curve is converted to a fibration through E1 and compared with the certified residual list.

Hypotheses: Y/F₂ is nonexceptional Enriques with constant full Picard, and the corrected candidate table is certified by both /247 and /246. The Gram calculations concern the separately specified hypothetical curve graphs; the pure arithmetic models need no surface. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E6/i4-star-incidence-orbits`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-ten-curves-forbidden`, `EnriquesSurfacesAndIntegralNonexistence:E6/second-ten-curves-forbidden`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-i8`, `EnriquesSurfacesAndIntegralNonexistence:E4/jacobian-no-i0-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-multiplicities`, `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E6/opposite-tip-branch`.

Sources: SCH23-author, Proposition 12.1, p. 38; proof pp. 38–40 (it uses Propositions 12.2 and 12.3, pp. 41–44).

## E7 — III* exclusions and restricted fibrations

Treat multiple and simple III* separately, with the four simple incidence cases. Prove the two-configuration impossibility over any algebraically closed field, importing the characteristic-independent partner theorem.

### no-multiple-iii-star — Elimination of multiple III*

No genus-one fibration on a nonexceptional constant-full-Picard Enriques Y/F₂ has a multiple III* fibre, after the classification gates.

Proof/construction: A partner half-fibre intersects its sole chosen weight-one terminal component, leaving E₇ vertical; the partner has another III* fibre. The new terminal component creates an I₂* canonical-type curve with two III half-fibres. Use the first forbidden ten-curve graph to eliminate degree-one incidences with one III pair, forcing the remaining curve vertical for the partner. The partner III* is then multiple and the half-fibre intersection one equals two, a contradiction.

Hypotheses: For III* exclusions, Y/F₂ is nonexceptional with constant full Picard and both classification gates. For restricted-configurations-impossible, k is algebraically closed of arbitrary characteristic and Y is classical, with the two global configuration restrictions stated there. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-ten-curves-forbidden`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E5/simple-iii-star-restriction`.

Sources: SCH23-author, Proposition 13.1, pp. 44–45.

### iii-star-incidence-orbits — Four simple III* half-fiber cases

For a simple III* fibre numbered as in (17) with weights (1,2,2,3,4,3,2,1), a partner half-fibre of degree two has six nonnegative incidence vectors in four symmetry orbits: one at C₂; ones at C₀,C₇; one at C₁; or two at C₀.

Proof/construction: Enumerate the six degree-two vectors and identify them under the graph reversal C₀↔C₇, C₁↔C₆, C₃↔C₅. Record the fixed C₂ case independently from the C₁/C₆ orbit.

Hypotheses: For III* exclusions, Y/F₂ is nonexceptional with constant full Picard and both classification gates. For restricted-configurations-impossible, k is algebraically closed of arbitrary characteristic and Y is classical, with the two global configuration restrictions stated there. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`.

Sources: SCH23-author, Proposition 13.2 proof, pp. 45–47.

### no-simple-iii-star — Elimination of simple III*

No genus-one fibration on such Y has a simple III* fibre, after the classification gates.

Proof/construction: In the C₂ branch the completion contributes intersection at least eight to a pair with bound four. The opposite terminal branch produces the first forbidden ten-curve graph. In the C₁ branch rule out I₄* and III* completions, leaving I₂*; degree-one extra incidence creates I₆ and degree-zero forces another forbidden graph. For the double-terminal branch the new terminal curve forms a III pair and a further I₂* fibration. Track which fibres are simple or multiple and use the already proved multiple-III* exclusion; the final constructed simple III* fibre has intersection two with a distinct fibration, below the minimum four. Import the distinct-fibration lower bound with full versus half-fibre normalization.

Hypotheses: For III* exclusions, Y/F₂ is nonexceptional with constant full Picard and both classification gates. For restricted-configurations-impossible, k is algebraically closed of arbitrary characteristic and Y is classical, with the two global configuration restrictions stated there. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E7/iii-star-incidence-orbits`, `EnriquesSurfacesAndIntegralNonexistence:E7/no-multiple-iii-star`, `EnriquesSurfacesAndIntegralNonexistence:E6/no-i4-star`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-ten-curves-forbidden`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-multiplicities`, `EnriquesSurfacesAndIntegralNonexistence:E5/partner-over-f2`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E5/simple-iii-star-restriction`.

Sources: SCH23-author, Proposition 13.2, pp. 45–47.

### restricted-configurations-impossible — Final two-configuration impossibility

Over any algebraically closed field of any characteristic, no classical Enriques surface has every genus-one fibration restricted to reducible-fibre configurations I₁*+I₄ with I₁* multiple, or I₂*+III+III with exactly two multiple fibres.

Proof/construction: In characteristic two use ESB exceptional-fibration classification to exclude exceptional surfaces from these global restrictions; in other characteristics use the general partner theorem directly. Thus every chosen half-fibre has a partner. This preserves the original arbitrary-characteristic scope. For an I₁* fibration the partner completion either contradicts half-fibre intersection one or yields a IV* canonical-type curve. Then exclude a multiple I₂* by an I₀* completion. Finally all I₂* fibres are simple and both III fibres multiple; the horizontal components of two partner III fibres together with those of the original pair produce an I₄ canonical-type curve, outside the allowed global restrictions.

Hypotheses: For III* exclusions, Y/F₂ is nonexceptional with constant full Picard and both classification gates. For restricted-configurations-impossible, k is algebraically closed of arbitrary characteristic and Y is classical, with the two global configuration restrictions stated there. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/general-partner-theorem`, `EnriquesSurfacesAndIntegralNonexistence:E1/conductrix`, `EnriquesSurfacesAndIntegralNonexistence:E1/canonical-type-fibration`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-canonical-bundle`.

Sources: SCH23-author, Proposition 14.1, pp. 47–49; ESB21, §1, Theorems 1.1–1.3, pp. 1–3.

## E8 — Lifting and the two nonexistence endpoints

Establish the characteristic-two lifting/deformation contracts, rule out exceptional modulo-four fibres, and assemble the F₂ and integral endpoints only after classification completeness and the omitted-configuration exclusions.

### w2-lifting-criterion — Characteristic-two Enriques lifting criterion

For an Enriques surface over an algebraically closed field k of characteristic two, a flat proper W₂(k)-lift exists exactly when the surface is neither exceptional nor supersingular.

Proof/construction: Use the source DI21 Theorem 7.2. Its proof combines the tangent-cohomology calculation, the conductrix exact sequence and the nonlifting criterion of Theorem 6.1; request the Frobenius/de Rham and deformation obstruction foundations rather than treating these as library theorems. Keep the base field algebraically closed.

Hypotheses: For geometric lifting and deformation, k is algebraically closed of characteristic two. The mod-four and Z targets use flat proper finitely presented algebraic-space families. The F₂ endpoint retains nonexceptional and constant full Picard plus both classification gates. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E1/conductrix`, `EnriquesSurfacesAndIntegralNonexistence:E1/classical-type`, `EnriquesSurfacesAndIntegralNonexistence:E1/supersingular-type`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.1`.

Sources: SCH23-author, Schröer 2021 Theorem 7.2, author pp. 23–24; main paper Theorem 5.2; DI21, §7, Proposition 7.1 and Theorem 7.2, pp. 23–24; §6, Theorem 6.1, pp. 20–22.

### miniversal-deformation — Miniversal Enriques deformation ring

For that geometric characteristic-two Enriques surface, its miniversal complete local W(k)-deformation ring A is regular and W(k)-flat with dimension 11 or 12. Dimension 12, absolute ramification index at least two, exceptionality-or-supersingularity, and nonexistence of a W₂-lift are equivalent.

Proof/construction: Use DI21 Proposition 7.1, Theorem 7.2 and Proposition 3.3. The nonexceptional nonsupersingular case has unobstructed ring W[[T₁,…,T₁₀]]. In the other case retain tangent dimension twelve, obstruction dimension one and nonlifting, then apply the regular-base criterion. Do not infer regularity only from tangent dimension.

Hypotheses: For geometric lifting and deformation, k is algebraically closed of characteristic two. The mod-four and Z targets use flat proper finitely presented algebraic-space families. The F₂ endpoint retains nonexceptional and constant full Picard plus both classification gates. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E8/w2-lifting-criterion`, `SchemeAndStackFoundations:SF.4`.

Sources: SCH23-author, Schröer 2021 Theorem 7.2, author pp. 23–24; DI21, §7, Proposition 7.1 and Theorem 7.2, pp. 23–24; §6, Theorem 6.1, pp. 20–22; DI21, §3, Proposition 3.3 and Corollary 3.4, pp. 11–12.

### exceptional-mod4-impossible — Exceptional fibers do not lift modulo four

No Enriques family over Z/4Z has an exceptional geometric special fibre.

Proof/construction: Extend the residue field to F̄₂ and the nilpotent base to W₂(F̄₂). A nilpotent algebraic-space thickening of a scheme is a scheme, so this gives the flat proper scheme lift excluded by the geometric W₂ criterion. This step retains the algebraic-space family scope.

Hypotheses: For geometric lifting and deformation, k is algebraically closed of characteristic two. The mod-four and Z targets use flat proper finitely presented algebraic-space families. The F₂ endpoint retains nonexceptional and constant full Picard plus both classification gates. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/enriques-family`, `EnriquesSurfacesAndIntegralNonexistence:E8/w2-lifting-criterion`, `SchemeAndStackFoundations:SF.0`.

Sources: SCH23-author, Theorem 5.2, p. 14; Schröer 2021 Theorem 7.2.

### f2-nonexistence — No nonexceptional constant-Picard Enriques surface over F₂

There is no Enriques surface over F₂ that is both nonexceptional and has constant full Picard scheme.

Proof/construction: Descend a genus-one fibration and every geometric one. Numerical contraction descent makes nonrational geometric fibres irreducible and the tame descent makes them simple. Require the exhaustive fourteen-plus-four classification and all three omitted exclusions before using the residual table. Exclude I₄* and both multiple and simple III*. For the classical base change to F̄₂, every fibration then has the two configurations excluded by the arbitrary-characteristic restricted-configurations theorem. This proves the desired contradiction only when both explicit classification gates are discharged.

Hypotheses: For geometric lifting and deformation, k is algebraically closed of characteristic two. The mod-four and Z targets use flat proper finitely presented algebraic-space families. The F₂ endpoint retains nonexceptional and constant full Picard plus both classification gates. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/residue-fibration-exists`, `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E5/quasielliptic-candidates`, `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E6/no-i4-star`, `EnriquesSurfacesAndIntegralNonexistence:E7/no-multiple-iii-star`, `EnriquesSurfacesAndIntegralNonexistence:E7/no-simple-iii-star`, `EnriquesSurfacesAndIntegralNonexistence:E7/restricted-configurations-impossible`, `EnriquesSurfacesAndIntegralNonexistence:E2/residue-canonical-order`.

Sources: SCH23-author, §15 and Theorem 15.1 with its proof, p. 49.

### integral-nonexistence — No Enriques surface over the integers

There is no flat proper finitely presented algebraic-space family over Spec Z with geometric Enriques fibres; equivalently the groupoid M_Enr(Z) is empty.

Proof/construction: Assume such a family. The repaired four-twist argument proves constant full Picard over Z. Its F₂ fibre therefore has constant full Picard, while its Z/4 restriction and the W₂ obstruction show this fibre is nonexceptional. Apply the F₂ endpoint. The theorem inherits the supplier completeness gap and the omitted-configuration exclusion gap. Completion of this design pass is not proof closure of the mathematical endpoint.

Hypotheses: For geometric lifting and deformation, k is algebraically closed of characteristic two. The mod-four and Z targets use flat proper finitely presented algebraic-space families. The F₂ endpoint retains nonexceptional and constant full Picard plus both classification gates. All additional alternatives, scheme multiplicities, local-base conditions and field restrictions stated in this target are retained.

Check: Keep the stated field, multiplicity and Picard hypotheses; give the proof on the actual geometric objects.

Prerequisites: `EnriquesSurfacesAndIntegralNonexistence:E2/enriques-family`, `EnriquesSurfacesAndIntegralNonexistence:E3/integral-full-picard`, `EnriquesSurfacesAndIntegralNonexistence:E8/exceptional-mod4-impossible`, `EnriquesSurfacesAndIntegralNonexistence:E8/f2-nonexistence`.

Sources: SCH23-author, Theorem 5.1, p. 14; proof §15, pp. 49–50.

## Mathematical obligations and source acquisition

The entire target list is specified; proof closure requires the following work. No listed source gap is replaced by an invented theorem statement.

### Exhaustiveness of the rational-Jacobian classification

External /247 is required for elliptic-candidate-reduction. No proof in this design that the fourteen listed models exhaust rational Jacobians satisfying all hypotheses. This independent supplier gate propagates to both endpoints.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E8/f2-nonexistence`, `EnriquesSurfacesAndIntegralNonexistence:E8/integral-nonexistence`.

### Three omitted Enriques configurations

The /246 target is new open mathematical work. Prove impossibility for I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂, with additive and E₄ fibres multiple. The printed IV* proof cannot handle the E₄ other half-fibre. Both endpoints and the eight-case reduction remain conditional.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E5/omitted-configurations-exclusion`, `EnriquesSurfacesAndIntegralNonexistence:E5/no-iv-star`, `EnriquesSurfacesAndIntegralNonexistence:E5/residual-configurations`, `EnriquesSurfacesAndIntegralNonexistence:E8/f2-nonexistence`, `EnriquesSurfacesAndIntegralNonexistence:E8/integral-nonexistence`.

### Degree-two reducibility with quotient preservation

Lang 1983 Theorem 4.1 is behind subscription preview; neither it nor an authorized modern complete substitute was read. The proposed contract must retain the nontrivial generic Pic⁰ coset and both square-zero and square−2 integral branches. Check full hypotheses before implementing.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E1/degree-two-reducibility`, `EnriquesSurfacesAndIntegralNonexistence:E1/integral-two-section-exists`, `EnriquesSurfacesAndIntegralNonexistence:E6/generating-two-section`, `EnriquesSurfacesAndIntegralNonexistence:E6/first-ten-curves-forbidden`, `EnriquesSurfacesAndIntegralNonexistence:E6/second-ten-curves-forbidden`.

### Half-fibre partner proof acquisition

MMV22 Theorem 1.2/Remark 1.5 give the correct characteristic-independent statement, but cite CD89 III.3.4.1/CDL21 6.1.10. The old book is not in the cleared library; the primary modern author site returned 403. Acquire an authorized full proof and decompose the nef/effectivity prerequisites, without restricting Proposition 14.1 to characteristic two.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E1/general-partner-theorem`, `EnriquesSurfacesAndIntegralNonexistence:E1/nonexceptional-partner`, `EnriquesSurfacesAndIntegralNonexistence:E7/restricted-configurations-impossible`.

### Exceptional classification source closure

ESB21 §§1–2 and its theorem statements/conductrix construction were read. Its later recursive configuration-classification proof, and the source of the tangent-vector characterization used by DI21, still need full proof-level decomposition. Do not infer the restrictions from a conductrix flag.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E1/conductrix`, `EnriquesSurfacesAndIntegralNonexistence:E1/quasielliptic-simple-restriction`, `EnriquesSurfacesAndIntegralNonexistence:E1/multiple-special-restriction`, `EnriquesSurfacesAndIntegralNonexistence:E7/restricted-configurations-impossible`, `EnriquesSurfacesAndIntegralNonexistence:E8/w2-lifting-criterion`.

### Shared geometric Enriques signatures

Pinned and current libraries do not provide the needed algebraic-space, Betti, canonical numerical-triviality and Enriques intersection/cohomology interface together. The arbitrary-field IsEnriques and full family predicates remain specified in prose/API/tests and honestly omitted in Lean until suppliers expose these objects.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E0/is-enriques`, `EnriquesSurfacesAndIntegralNonexistence:E2/enriques-family`, `EnriquesSurfacesAndIntegralNonexistence:E8/w2-lifting-criterion`.

### Unregistered numerical-Picard supplier

Register the exact proposed contraction/descent/local projectivity layers and acquire their proofs. A section plus constant Num is insufficient without the cohomological Brauer lifting hypothesis. Local projectivity is necessary before Fontaine; do not restrict families to schemes to evade it.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E3/local-projectivity`, `EnriquesSurfacesAndIntegralNonexistence:E3/local-projectivity`, `EnriquesSurfacesAndIntegralNonexistence:E3/four-twist-good-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E2/minus-two-curve-descent`, `EnriquesSurfacesAndIntegralNonexistence:E2/fibration-descent`.

### Unregistered genus-one supplier

Register the generic fibration and local-comparison interfaces. The MW repair depends on equivariant geometric restriction and descended two-section; simple-fibre smooth points must be smooth on the whole scheme fibre. Keep Kodaira types in their supplier.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E4/enriques-jacobian`, `EnriquesSurfacesAndIntegralNonexistence:E4/simple-fibre-isomorphism`, `EnriquesSurfacesAndIntegralNonexistence:E4/mordell-weil-descent`, `EnriquesSurfacesAndIntegralNonexistence:E5/elliptic-candidate-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E6/generic-pic-zero-quotient`.

### K3 and Fontaine source interface

Shared K3 and everywhere-good-reduction obstruction belong to their proposed supplier. Its exact projective scheme-model hypothesis and proof source have not been read as a separate authorized full source here. The four-twist proof reaches that precise contract, not the broader algebraic-space form.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E3/split-etale-lattice-extension`, `EnriquesSurfacesAndIntegralNonexistence:E3/four-twist-good-reduction`, `EnriquesSurfacesAndIntegralNonexistence:E3/integral-full-picard`, `EnriquesSurfacesAndIntegralNonexistence:E8/integral-nonexistence`.

### Lifting and deformation foundations

DI21 §§3,6,7 were read at the cited locators. SchemeAndStackFoundations SF.4 must supply miniversal obstruction theory, Frobenius/de Rham nonlifting and the regularity/flatness presentation; these are requests, not baseline facts.

Needed by: `EnriquesSurfacesAndIntegralNonexistence:E8/w2-lifting-criterion`, `EnriquesSurfacesAndIntegralNonexistence:E8/miniversal-deformation`, `EnriquesSurfacesAndIntegralNonexistence:E8/exceptional-mod4-impossible`.

## Sources and versions

All statements and sketches are in our own words. Page numbers for SCH23 refer to the 52-page author copy of 19 July 2022, not the 63-page Annals pagination. Its mathematical body §§1–15 was read, including the diagrams and revised matrices. Published-page observations for the missing configurations are attributed to the maintainer’s [selected-page report](https://github.com/CBirkbeck/tauceti-explorer/issues/4976#issuecomment-5915303984); this roadmap does not claim an independent full reading of the paywalled version.

- **SCH23-author**: Stefan Schröer, [There is no Enriques surface over the integers](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf). Third revised author version, 19 July 2022, 52 pages; Annals 197 (2023), 1–63 has different pagination and was not read in full. Read: Introduction and §§1–15, author pp. 1–49; figures (13), (15), (17) and matrices (14), (16).
- **ESB21**: Torsten Ekedahl and Nicholas I. Shepherd-Barron, [On exceptional Enriques surfaces](https://arxiv.org/pdf/math/0405510v2). arXiv:math/0405510v2, 26 August 2021. Read: §1, Theorems 1.1–1.3, pp. 1–3; §2, conductor construction, Lemma 2.3, pp. 4–5.
- **DI21**: Stefan Schröer, [The Deligne–Illusie theorem and exceptional Enriques surfaces](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/DeligneIllusie_2021.pdf). Revised author version, 4 January 2021; Eur. J. Math. 7 (2021), 489–525. Read: §6, Theorem 6.1 proof and Propositions 6.2–6.3, author pp. 20–22; §7 in full, Proposition 7.1 and Theorem 7.2, pp. 22–24; §3, Proposition 3.3 and Corollary 3.4, pp. 11–12.
- **MMV22**: Gebhard Martin, Giacomo Mezzedimi and Davide Cesare Veniani, [On extra-special Enriques surfaces](https://arxiv.org/pdf/2201.05481v1). arXiv:2201.05481v1, 14 January 2022; manuscript dated 17 January 2022. Read: §1, Definition 1.1, Theorem 1.2 and Remarks 1.4–1.5, pp. 1–2; §2.1, Lemmas 2.1–2.4, pp. 3–4.
- **Stacks**: The Stacks Project Authors, [The Stacks Project](https://stacks.math.columbia.edu). Online tags accessed 11 October 2026; stable tags are the locators, no page numbers. Read: Tag 0D24, §99.11, Lemmas 99.11.3–4 and Proposition 99.11.8, statements and proofs; Tag 0D3D, Lemma 74.13.2, statement and proof; Tag 0EMV, §68.11, Lemma 68.11.4 and the elementary étale neighbourhood construction; Tag 0H74, Lemma 15.13.3, statement and proof.

Lang’s *On Enriques surfaces in characteristic p. I* (Math. Ann. 265 (1983), 45–65), Theorem 4.1, and the Cossec–Dolgachev partner proof (1989, III.3.4.1) require authorized full-text acquisition. The publicly read MMV22 states the partner theorem but cites that older proof. No uncleared book copy or source passage is included.

The canonical corrections used here are PAPER-SCHROER-23/E6,E12,E13,E17,E30,E34,E38–E44. They concern cover comparison, fibre smooth points, Tsen, the Pic⁰ quotient, torsor multiplication, the additional candidates, configuration branches and incidence normalization. The packet records their locators and existing provenance; these are repairs to the specified argument, without claiming that the remaining open classification and exclusion obligations have been solved.
