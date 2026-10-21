# R09.7d. The compactification interface for Borel extension

This layer supplies the source on which a Borel extension theorem is applied. A
smooth quasi-projective variety has a chosen smooth projective model with a
strict normal-crossings boundary. Near each boundary point, the original open
is identified with a product of punctured and ordinary complex discs. A map on
the original variety can then be pulled back to that precise domain.

The resolution algorithm, the compactification existence theorem and the SNC
polydisc theorem already have accepted targets. This part imports them. Its two
interface nodes apply the existing smooth complex realization needed by the
polydisc theorem and construct the lift of its inverse chart into the prescribed open.
The latter is an assembly of existing geometric results, with a commuting
square that fixes its meaning; it introduces no new compactification object or
competing chart record.

The algebraic assertion holds over any characteristic-zero field. Analytic
assertions are over C. Starting with another field requires a specified
embedding into C before scalar extension; characteristic zero alone does not
provide one. A variety is finite type, separated and reduced. Smoothness gives
the local dimension used in a chart. Use a fixed pure dimension for a native
manifold, and work componentwise if a smooth scheme has several dimensions.
Empty schemes and dimension zero are included.

## Suppliers and the target order

The stage remains **planned** and the planning pass is **complete**. All
implementation statuses are unchecked. The following are existing targets,
rather than additional nodes in this packet.

| Input | Exact supplier | Contract used here |
| --- | --- | --- |
| Smooth complex realization | ComplexComparison PR196, Layers 0–2, via the explicit A0-extension integration request | The actual over-C point carrier, classical topology, analytic maps, smooth manifold specialization, open immersions and etale local biholomorphisms. |
| Smooth algebraic coordinates | `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates` | Smooth affine Jacobian presentations and regular coordinate functions; at a C-point the residue field is C. |
| Strict boundary | `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary` | Finite labelled globally smooth Cartier components, distinct incident germs and simultaneous étale coordinates. |
| Projective SNC model | `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification` | Smooth projective X, a specified dense open immersion j from U and reduced complement D; every modification preserves U. |
| Local analytic pair | `AlgebraicModuliForArithmeticGeometry:R09.7/analytic-polydisc` | A full biholomorphic polydisc chart centred at the point, with boundary hyperplanes and its punctured complement. |

First import the shared smooth complex realization. Its coordinate compatibility
supplies the smooth-point, open-restriction and étale-Jacobian sub-interface
requested by the polydisc node. Then assemble the compactification and chart
into the exported maps to U. This order constructs neither a second
analytification nor a new resolution theorem. The two explicit supplier
requests below record projective closure and integration of the existing
analytic carrier.

The compactification supplier starts from a chosen reduced projective closure
of U, resolves it while preserving U inside its regular locus, and principalizes
the reduced complement ideal on the resulting smooth projective scheme. That
ideal is a unit on U and is nonzero at the generic point of each component.
Principalization makes it invertible with monomial local equations; taking its
reduced support gives the labelled strict boundary. Projective closure and
projectivity of blowups give projectivity of the final model. This is the
existing supplier's proof route, not a deduction of projectivity from
properness. Its remaining R09.1 projective-closure request is retained below.

The source locators for that import are Bierstone–Milman, Theorem 1.10,
pp. 216–217, Theorem 11.14, pp. 290–291, Theorem 12.2, p. 292, and Theorem 13.2,
pp. 297–298. Deligne, (3.2.1), pp. 34–35, explicitly gives the quasi-projective
alternative in which the completion can be projective and the boundary a union
of smooth divisors. The present scope uses this alternative. The larger
compactification statement for arbitrary smooth separated schemes is not
needed.

R09.7a already supplies `boundary-stratum-refinement`,
`finite-cover-compactification`, `monomial-boundary-chart`, `meridian-map` and
`meridian-comparison`. They keep their owners. Boundary strictification is
available for a merely normal-crossings input with repeated global branches;
it is not an extra step imposed on the already strict output used here.

## Native carriers and ownership

Complex points mean morphisms from Spec C **over Spec C**. On an affine
presentation their coordinates are C-algebra homomorphisms, not arbitrary ring
homomorphisms. In particular, the underlying prime-ideal space of a scheme is
not its analytic point space. `AlgebraicGeometry.Scheme.Hom.IsOver` at the pin
expresses the structure-map equation.

Use Mathlib's `ChartedSpaceCore.toChartedSpace` for the topology and charts and
`IsManifold` at analytic regularity over the complex model. The analytic inverse
theorem is already present: `AnalyticAt.hasStrictFDerivAt`,
`HasStrictFDerivAt.toOpenPartialHomeomorph` and
`OpenPartialHomeomorph.hasFPowerSeriesAt_symm`. The strict derivative must be a
continuous linear equivalence, and the inverse theorem uses a complete source.
These conditions hold for the finite-dimensional complex coordinate spaces.
A real differentiable inverse does not establish a complex analytic chart.

ComplexComparison [PR196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196),
head `4bd72379658126cbe9be935656396f0c9dac4de0`, standing conventions and Layers
0–2, already owns the complex-point topology and scheme analytification,
including the smooth native complex manifold specialization, open immersions
and étale local biholomorphisms. Those are existing roadmap targets. This
part applies them on their single shared carrier; it does not build a
separate smooth-case functor. Its first node is an application.

PR853 head `6f3a90dbb5188375dd083e1df9c87ef2bbf38c6c`, §9.5, contains the
algebraic compactification, but its ownership table attributes general
analytification to ComplexComparisonPartII C−1.1. The accepted Part II packet
instead imports PR196. Assembly must reconcile that stale attribution and
integrate PR196 as the scheme input of A0-extension, as requested here. There
is no exact atlas layer anchor for PR196's subroadmap. The request therefore
names its exact upstream path and layers, rather than inventing a library
reference. No higher-tier coherent comparison or ownership move is needed.

Current main's AnalyticToricGeometry Layer 4 already owns toric boundary charts;
RealAlgebraicGeometry already owns its general analytic inversion toolkit and
parameter-dependent extension results. Those targets are imported where
applicable. Neither replaces the shared PR196 smooth scheme realization. The
reviewed AUDIT-01 verdict for R09.7d is “not built”; the adic polydiscs found in
the library use a different carrier and do not meet this complex input.

## Target 1. Using the shared smooth complex realization

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7d/smooth-complex-points`.

Import the single complex-point topology and analytification of ComplexComparison PR196 Layers 0–2. For a smooth separated finite-type complex scheme X of pure dimension n, use its smooth specialization as the native n-dimensional complex analytic manifold on the actual set X(C)=Hom over Spec C from Spec C to X. Identify its local coordinates from a closed smooth affine presentation p(u,v)=0 with the u-coordinates furnished by the local inverse of (u,v) mapped to (u,p(u,v)), when the v-Jacobian is invertible. The topology, atlas independence, analytic functoriality, open-immersion comparison and etale local biholomorphisms are supplier outputs, not new constructions here. In these coordinates the analytic differential is the evaluated algebraic Jacobian, and regular functions have the same values and zero sets. Apply this interface to the existing SNC chart theorem without constructing a separate smooth analytification carrier.

**Hypotheses and conventions.**

- X is smooth, separated and finite type over C; fix its pure dimension n. Work componentwise for the finitely many dimensions of a smooth scheme. The empty scheme and n=0 are included.
- Points and all scheme maps commute with the C-structure maps. A prime-ideal point or an arbitrary unbased Spec C morphism is not the point carrier.
- For the etale assertion the chosen local algebraic Jacobian is an isomorphism; no global injectivity of an etale morphism is assumed.

**Application and coordinate compatibility.**

1. Import PR196 Layers 0–2 through the explicit A0-extension integration request. Use its actual over-C points, presentation-independent classical topology, analytic morphism functor and smooth native manifold specialization. Do not reconstruct their carriers or gluing.
2. For coordinate compatibility, import R09.7/regular-coordinates and use a closed affine presentation, locally cut out by p(u,v)=0 with invertible v-Jacobian. Its complex Jacobian gives the invertible linear term of F(u,v)=(u,p(u,v)); the native analytic inverse theorem identifies the supplier chart with its u-coordinate model.
3. Regular coordinate functions are polynomial quotients with denominators nonzero on their domains. Their evaluations are analytic and their derivatives are the evaluated Jacobian. Supplier functoriality identifies these formulas with the actual maps on points.
4. Use the supplier open-immersion and etale local-biholomorphism comparisons on this same carrier. For a regular function h, evaluation vanishes precisely when the point factors through V(h); this identifies the algebraic boundary support and analytic zero set without coherent GAGA.

**API.** These clauses are compatibility requirements on the imported interface.

- `smoothComplexPoints.points` (coercion): The underlying set is exactly the over-C point set X(C); a map f acts by composition with f.
- `smoothComplexPoints.affineChart` (characterisation): For a closed embedding of a smooth affine scheme in A^N, the imported topology agrees with the Euclidean topology on its polynomial zero locus, and the local u-coordinates are inverse-function charts. For a locally closed presentation, retain its open nonvanishing conditions as well as its equations.
- `smoothComplexPoints.independent` (compatibility): The identity of X(C) identifies the topologies and maximal compatible analytic atlases obtained from two affine covers or presentations.
- `smoothComplexPoints.map` (functoriality): Every C-morphism between smooth schemes induces an analytic map. The maps for identity and composition are the actual identity and composite on points.
- `smoothComplexPoints.openImmersion` (equivalence): An algebraic open immersion j:U into X gives a biholomorphism U(C) onto its image with the induced analytic structure and an open embedding on underlying topological spaces.
- `smoothComplexPoints.etaleCoordinates` (compatibility): An etale coordinate map is locally biholomorphic, with complex derivative the evaluated algebraic Jacobian; it need not be globally one-to-one.
- `smoothComplexPoints.zeroSet` (simp): For a regular function h on an algebraic open W, its analytic evaluation vanishes at a precisely when the C-point a factors through V(h); locally a Cartier equation therefore has the expected analytic support.

**Checks.** Each is an assertion about the geometric construction, including its maps and point carrier.

- `SmoothComplexPointsChecks.point` (degenerate): For Spec C the over-C point set is a singleton and its analytic dimension is zero. For the empty smooth scheme the point set and atlas domains are empty.
- `SmoothComplexPointsChecks.principalOpen` (compatibility): For A^1_C the realization is C with its usual topology. The inclusion D(t)=G_m into A^1 becomes C minus {0} into C; t and t inverse become z and 1/z on their respective domains.
- `SmoothComplexPointsChecks.etaleSheets` (non-example): The map G_m to G_m, z mapped to z^2, has derivative 2z and is locally biholomorphic everywhere; 1 and -1 have the same image. The API must not produce a global inverse.
- `SmoothComplexPointsChecks.scalarStructure` (non-example): The ring automorphism conjugating C induces an abstract scheme automorphism of Spec C but does not commute with the identity structure map to Spec C. It is excluded from the over-C point/map API; conjugation on C is not a complex analytic coordinate map.

**Uses.**

- AlgebraicModuliForArithmeticGeometry:R09.7/analytic-polydisc: Identifies the smooth-point, open-restriction and etale-Jacobian sub-interface of its A0-extension request with the existing PR196 carrier; it does not move ownership of analytification.
- Deligne, Théorie de Hodge II, (3.1.2), p. 31 and proof of (3.1.9), pp. 33–34: Identifies the analytic divisor and the complement in the same coordinate neighbourhood, starting with algebraic labelled components.

**Sources.**

- SERRE56, §1, nos. 1–2 and 4, pp. 3–6; §2, no. 5, Lemma 1 and Proposition 2, pp. 7–9. Checks the imported affine topology, regular maps and overlap gluing; the polynomial-coordinate argument identifies its native smooth manifold charts.
- BM1997, §3, (3.1), Definition 3.2 and Lemma 3.3, pp. 231–232. Provides the smooth affine Jacobian presentations and rational coordinate functions to which the analytic inverse theorem applies.

## Target 2. Borel source charts on the prescribed open

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7d/borel-source-charts`.

Let U be a smooth quasi-projective finite-type variety over a characteristic-zero field k. Import R09.7/snc-compactification to obtain a chosen smooth projective X, a dense open immersion j:U into X and a finite labelled reduced strict-SNC boundary D with complement exactly j(U). Over C, equip U and X with the smooth complex realization. For each a in X(C), choose the existing R09.7/analytic-polydisc chart c_a:N_a to P_a, centered at a, with n=dim_a X and b incident boundary labels enumerated by the first b coordinates. Here P_a is the native product of discs |z_i|<rho_i with every rho_i>0, and P_a^circ consists of its points with z_i nonzero for i<b. Export the unique biholomorphism ell_a:P_a^circ to j_an inverse-image of N_a such that j_an composed with ell_a equals c_a inverse on P_a^circ. Retain the same algebraic j, the boundary labels and the full unpunctured chart. These maps give local source charts for any analytic map on the original U. For a field embedding k into C the same conclusion applies after scalar extension of the chosen model; choosing such an embedding is an extra input.

**Hypotheses and conventions.**

- U is smooth, quasi-projective and finite type over char-zero k; projectivity of X is retained from the projective closure and projective blowup chain.
- Analytic assertions are over C (or after a specified embedding k into C). The algebraic existence assertion does not require such an embedding.
- Boundary labels refer to globally smooth effective Cartier components with distinct incident germs. Each analytic neighbourhood avoids every nonincident component.

**Construction.**

1. Use the existing R09.7/snc-compactification construction and its open, boundary and projective API without re-running resolution. Its R09.1 projective-closure request remains an explicit supplier obligation. Each modification is an isomorphism on the prescribed U, so j identifies that U, not a replacement birational open.
2. Use the imported smooth realization through smooth-complex-points to identify the analytic image of j with X(C) minus the union of the analytic boundary zero sets. For the imported R09.7/analytic-polydisc theorem, this application identifies its requested smooth analytification and etale-coordinate bridge with the existing PR196 supplier integrated through A0-extension.
3. Take its centred labelled polydisc chart and shrink away from the finitely many nonincident boundary components. Its coordinate equations give c_a(N_a intersect j_an(U(C)))=P_a^circ. Positivity of radii and b at most n are part of the chart, including n=b=0.
4. Restrict the inverse of c_a to P_a^circ, then use the inverse of the open-immersion identification to lift it uniquely to U(C). Injectivity of j_an proves the square and uniqueness; both inverse maps are analytic. The image is exactly j_an inverse-image of N_a.
5. Restrict the same maps when radii decrease, and reindex the first b coordinates when the incident labels are permuted. The square proves compatibility on overlaps. Every point of U(C) is in the image of a chart centred at its image in X(C), proving the cover; the construction chooses charts pointwise and asserts no uniform radius or finite subcover.

**API.** These clauses are the required library interface.

- `borelSourceCharts.algebraicModel` (data): Expose the chosen X, j and labelled reduced D from snc-compactification, with X smooth projective and image j the complement of D. The choice is not canonical.
- `borelSourceCharts.fullChart` (projection): Expose a in N_a, c_a(a)=0, positive radii, b at most n, the bijection between incident labels and the first b coordinates, and the full biholomorphism c_a.
- `borelSourceCharts.boundary` (characterisation): For an incident label lambda_i, the points of D_lambda_i in N_a are exactly c_a inverse-image of z_i=0; every nonincident component misses N_a. Hence the image of N_a intersect j_an(U(C)) is P_a^circ.
- `borelSourceCharts.liftSquare` (universal-property): There is a unique analytic ell_a:P_a^circ to U(C) satisfying j_an(ell_a(z))=c_a inverse(z). It is a biholomorphism onto j_an inverse-image of N_a, whose inverse is c_a composed with j_an.
- `borelSourceCharts.restrict` (compatibility): If 0<sigma_i at most rho_i for every coordinate, use N_a prime=c_a inverse-image of P(sigma). The new ell_a is exactly the restriction of the old ell_a; successively shrinking twice equals the direct restriction.
- `borelSourceCharts.relabel` (functoriality): Permuting the incident labels permutes the corresponding coordinates and radii in the full chart, and precomposes ell_a with the inverse coordinate permutation. Identity and composite permutations act accordingly.
- `borelSourceCharts.coverAndPullback` (compatibility): The images of the ell_a cover U(C). For any analytic f:U(C) to a complex analytic target T, f composed with ell_a is analytic on P_a^circ; no extension of it is asserted by this API.

**Checks.** Each is an assertion about the geometric construction, including its maps and point carrier.

- `BorelSourceChecks.point` (degenerate): For U=Spec C choose X=U, empty boundary and n=b=0. The empty coordinate product is a singleton and ell is the identity of that point, not a map with empty domain.
- `BorelSourceChecks.projectiveInterior` (degenerate): For smooth projective U choose X=U and D empty. Every b is zero, so P^circ=P and ell is the full inverse chart. Artificially puncturing an ordinary coordinate would fail the boundary and image identities.
- `BorelSourceChecks.affineLineInfinity` (computation): For U=A^1 in X=P^1, at infinity take w=1/t and |w|<rho. Here b=n=1 and ell(w)=1/w on 0<|w|<rho. The square lands in the actual affine t-line; zero belongs to the full chart but not to its lifted domain.
- `BorelSourceChecks.torusCorner` (computation): For U=G_m squared in P^1 times P^1 at (0,0), the two incident boundary components are x=0 and y=0. The lifted domain is |x|<rho_1, |y|<rho_2, x nonzero and y nonzero. In particular (0,rho_2/2) is excluded although it is not the origin; at (0,1) only one factor is punctured after translating the other coordinate.
- `BorelSourceChecks.preservedOpen` (characterisation): Let Y be the projective nodal cubic y^2 z=x^2(x+z) over C and U=Reg(Y). Its normalization P^1 is already a smooth SNC compactification: the two points above the node form its boundary and normalization restricts to an isomorphism with this exact U. The exported square factors through that isomorphism, and no point of U is deleted during compactification.

**Uses.**

- ShimuraVarieties:V3 and PELModuli:M3: For a holomorphic map on a quasi-projective source, restrict along ell_a before applying the independently proved arithmetic-quotient extension theorem; retain c_a on the full domain for that theorem’s conclusion.
- Bakker–Klingler–Tsimerman, §4.1, p. 928; PAPER-BAKKER-KLINGLER-TSIMERMAN-20/snc-compactification: Provides the imported smooth projective source model and the ordinary local pairs. Buffering and finite chart refinements for definability remain the Hodge extension’s consuming adaptation.
- Deligne, (4.4.3), p. 51: The abelian-family equivalence cites Borel for essential surjectivity, so it cannot replace the extension theorem in the consuming proof.

**Sources.**

- DELIGNE71, (3.1.2), p. 31; proof of Proposition (3.1.9), pp. 33–34; (3.2.1), pp. 34–35. The analytic coordinate-boundary pair and its punctured complement give the local model; the quasi-projective case permits a projective completion without the general Nagata route. The lift square is this packet’s interface deduction.
- BM1997, Theorem 1.10, pp. 216–217; Theorem 11.14, pp. 290–291; Theorem 12.2, p. 292; Theorem 13.2, pp. 297–298. Supports the imported resolution/principalization construction preserving the given smooth open, with projectivity supplied by projective closure and blowups.
- BKT20, §4.1, published p. 928; arXiv v2 p. 13, local pair and formula (4.1). A period map is restricted through precisely these punctured source charts. Finite covering and buffering for definability belong to the Hodge consumer, not the present pointwise export.

## Reading the exported domain

For each point a, write n for the local dimension and b for the number of
incident boundary labels. Number coordinates from zero. With positive real
radii rho_i, use the native set product

P(rho) = {z in C^n : |z_i| < rho_i for every i},

and write P(rho)^circ for its subset where z_i is nonzero for every i<b.
The removed subset is the **union** of those b coordinate hyperplanes. It is
empty when b=0. In dimension zero the product is a point. These are notation
for products of `Metric.ball` sets and their set difference, rather than new
polydisc types.

For z in the punctured domain the required equality is

j_an(ell_a(z)) = c_a inverse(z).

Here the right side lies in the full neighbourhood N_a inside X(C), and the
left side uses the analytic map of the original algebraic immersion j.
The inverse map from j_an inverse-image of N_a is c_a composed with j_an.
Thus the square retains both the full chart needed for an extension theorem
and the punctured chart on which the incoming map is defined. The analytic
zero-set comparison is what proves that the right side is in j_an(U(C)).
A mere homeomorphism to a polydisc, or a birational identification of some
smaller open, would not establish this interface.

Three computations make the distinction concrete. For the affine t-line,
compactify by P^1 and use w=1/t at infinity. The full w-disc contains infinity
at w=0; its lift to the t-line is t=1/w on the punctured disc. For the two-torus
in P^1 times P^1, the corner (0,0) has two incident labels, hence both x and y
must be nonzero. A point on the x-axis away from the origin is still excluded.
At (0,1), use coordinates x and y−1 with the second radius smaller than one;
there is only one incident label and the y−1 coordinate may vanish.

For a singular closure, take the cubic y^2 z=x^2(x+z). In the affine chart,
normalization is parametrized by x=q^2−1, y=q(q^2−1). The node has preimages
q=1 and q=−1, and the point at infinity is smooth. Consequently the given
U=Reg(Y) is identified with P^1 minus those two points. Each missing point
has one boundary coordinate. Transporting the chart through the specified
normalization isomorphism gives the map to this U; it must not delete an
additional smooth point just to simplify the compactification.

## Consumer boundary and circularity check

ShimuraVarieties V3 and PELModuli M3 take an analytic map f on U(C), pull it
back along ell_a and apply their arithmetic-quotient extension theorem on the
punctured domain. Conditions on the target quotient, arithmetic group,
monodromy or extension target belong to that theorem. This layer supplies
no such hypotheses and derives no algebraicity statement from compactification
alone.

Bakker–Klingler–Tsimerman §4.1, published p. 928 (arXiv v2 p. 13), motivates the
same pair of full and punctured domains. The source item routed to R09.7d is
accounted for by the compactification import and this export. Its finite cover,
buffered charts, boundary extension and definability arguments are consuming
adaptations in the Hodge extension. The output here is a pointwise family of
source charts; its cover assertion does not assume analytic quasi-compactness
of U or supply a finite subcover.

Deligne's (4.4.3), p. 51, uses Borel for essential surjectivity of the
abelian-family comparison. Invoking that comparison to bypass the extension
step would therefore use the consumer theorem in its own proof. The present
prerequisite graph ends in resolution, ordinary projective geometry, algebraic
coordinates and the native analytic inverse theorem.

## Validation and remaining supplier work

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Nine Mathlib statements were read at
the pin; none implements the scheme-to-complex-manifold targets of PR196.
Current main's roadmap overlap was also checked against AlgebraicVectorBundles,
StableReduction, AnalyticToricGeometry and RealAlgebraicGeometry.

The suggested file is not the roadmap and is not exhaustive. This document
is authoritative. Under the current WORKERS shape rule, it contains only a
native conditional topological lift signature and a few coordinate checks.
It introduces no admitted data definition or placeholder analytic space.
Its conditional lift assumes an actual open embedding, actual partial
homeomorphism and exact image equality. Those hypotheses are geometric outputs
to be established through the imported interface and lift construction; the signature does not establish them.
The zero-dimensional and two-axis examples check only the indicated native
coordinate identities. All fourteen geometric API clauses and nine full
geometric checks remain required targets in this document, including the
complex analyticity and scheme identifications absent from those examples.

The complete planning pass has one application node and one construction node,
fourteen interface API clauses, nine geometric checks and one new planet. The
four existing R09.7d planets in R09.7a are retained, giving five in the combined
layer. The application has no separate planet for the imported realization.
Coverage is planned with two explicit requests and no unrecorded source gap:

- **R09.1 projective closure.** Supply an exact node for the chosen reduced
  projective closure with the prescribed dense open and projective composition.
  The older R09.1 packet contains no exact node for it. PR853's Layer 1 is the
  intended projective-geometry supplier; its atlas reference must be reconciled.
- **A0-extension analytic integration.** Integrate ComplexComparison PR196,
  Layers 0–2 at the head above, as A0-extension's scheme input. Its existing
  algebraic-space analytification node extends that input and does not supply
  this exact scheme interface. Export the smooth points/manifold, analytic map,
  open-immersion and etale-local comparisons to this application and
  R09.7/analytic-polydisc. Reconcile PR853's stale attribution to the higher
  Part II during assembly. No upstream file is changed here.
- **Native geometric realization.** Instantiate the imported scheme point/manifold
  interface and the full chart lift with their exact maps and analytic proofs,
  and realize every geometric check. Elaboration of the compact suggested file
  checks the explicitly stated native signatures and examples; their admitted
  proofs establish no geometric implementation.

## Primary references

All statements above are in this packet's own words. Printed page numbers are
used. No source passage is reproduced.

- Jean-Pierre Serre, *Géométrie algébrique et géométrie analytique*, Annales de
  l'Institut Fourier 6 (1956), 1–42. [Numdam scan](https://www.numdam.org/item/AIF_1956__6__1_0.pdf).
  The input here is the local analytic construction and overlap comparison,
  §1 nos. 1–2 and 4, pp. 3–6, and §2 no. 5, Lemma 1 and Proposition 2,
  pp. 7–9; the coherent projective equivalence is not used.
- Edward Bierstone and Pierre D. Milman, *Canonical desingularization in
  characteristic zero by blowing up the maximum strata of a local invariant*,
  Inventiones mathematicae 128 (1997), 207–302.
  [Full published text](https://mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf).
  Relevant coordinates are (3.1), Definition 3.2 and Lemma 3.3, pp. 231–232;
  the imported compactification uses Theorems 1.10, 11.14, 12.2 and 13.2 at
  the locators above.
- Pierre Deligne, *Théorie de Hodge II*, Publications Mathématiques de l'IHÉS
  40 (1971), 5–57. [Numdam scan](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf).
  The local pair is (3.1.2), p. 31 and the proof of (3.1.9), pp. 33–34;
  the quasi-projective completion is (3.2.1), pp. 34–35. The Borel dependency
  is (4.4.3), p. 51.
- Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, *Tame topology of
  arithmetic quotients and algebraicity of Hodge loci*, JAMS 33 (2020), 917–939.
  [arXiv v2](https://arxiv.org/pdf/1810.04801v2), §4.1 p. 13, corresponding
  to published p. 928, supplies the source-chart use. No global definability
  result from the article or its erratum is used in this layer.

The packet records PDF hashes, editions and the access date 2026-10-16. No
restricted book was needed. Sources routed to other R09 layers by the issue
retain their owners.
