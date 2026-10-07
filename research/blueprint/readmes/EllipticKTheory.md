# Elliptic curves, Part II: scheme K-theory and arithmetic symbol classes

This roadmap turns the function-field and point theory of an elliptic curve into
a scheme K-theory API, computes its positive K-groups over a finite field, and
constructs arithmetic symbol classes with explicit residue certificates. It
builds on [Elliptic curves](../../../content/tau-ceti/EllipticCurves/README.md).
The outputs are the rank–degree–point description of K₀, localization and
coniveau in low degrees, isogeny pull–push formulas, twisted Frobenius formulas
over finite fields, minimal regular arithmetic models, and horizontal and
vertical certificates for K₂ classes.

The scheme-theoretic construction, general K-theory operations, local surface
theory and regulators have their own owners. This roadmap supplies the elliptic
comparisons and applications connecting them. Its scope includes every layer
E.1–E.8. The finite-field calculation covers all positive degrees. Over number
fields the targets are the K₀–K₃ interfaces and the rational integral part of K₂;
they do not assert a finite-generation theorem or an abstract-group
classification for those arithmetic K-groups.

## Boundaries and imports

The following ownership follows the [RS-18 boundary](../restructure/RS-18.md)
and the links with the existing elliptic, modular and algebraic-curve roadmaps.

| Supplier | What this roadmap imports | What is built here |
| --- | --- | --- |
| [EllipticCurves](../../../content/tau-ceti/EllipticCurves/README.md), layers 0, 0.5, 1–3 | Function fields, places, divisor classes, base change, isogenies, torsion functions, Weil pairing, Tate modules and Frobenius degree theory. | Comparisons with scheme K-theory and the elliptic Frobenius subgroup used by positive even K-groups. |
| [ModularCurves](../../../content/tau-ceti/ModularCurves/README.md), 1A, 1B, 1D, 2A, 2B, 2D | Projective Weierstrass schemes over a base, sections and group law, scheme isogenies and their kernels, Picard duality and descent. | Field-case adapters, function-field/point comparisons and their use in K₀ and isogeny operations. |
| [AlgebraicCurves](../../../content/tau-ceti/AlgebraicCurves/README.md), 12 | Regular projective curves and function fields; closed points, places, divisors and degrees. | The dictionary for the chosen elliptic scheme and its existing function field. |
| [JacobianChallenge](../../../content/tau-ceti/JacobianChallenge/README.md), A–B | Scheme Picard groups, degree, coherent cohomology, genus and Riemann–Roch. | Transport of the existing elliptic divisor-class splitting to line bundles, K₀ and Euler pushforward. |
| KTheoryLowDegrees Z.5–Z.6 | Rank–determinant theory for regular curves and the degree-zero projective-line comparison. | K₀(E) in rank–degree–point coordinates with its tensor-product multiplication. |
| GeneralAlgebraicKTheory K.1, K.3 and SchemeKTheoryOperations S.2–S.7 | The genuine K-functor, localization, pullback, proper perfect pushforward, projection formulas, projective bundles, coniveau, Adams operations and self-intersection. | Their curve sequences and elliptic applications. |
| K2SymbolsBrauer T.2–T.5 and K3BlochGroups | Milnor/Quillen comparisons, field symbols, DVR localization comparisons, norms, reciprocity and indecomposable field K₃. | Curve residues, certificates, Bloch corrections and rational descent of certified classes. |
| ArithmeticKTheory N.1–N.3 and KTheoryFiniteLocalFields L.1 | S-integers, number-field residue torsion and finite-field K-groups; the requested global-function-field finite-generation extension. | The elliptic Harder application and its connection with arithmetic integral parts. |
| MotivicEtaleKTheory M.4–M.7, StableHomotopyKTheory H.6, EtaleDualityAndPerverseSheaves EDC.2, ArithmeticGaloisRepresentations R01.1 and WeightsInEtaleCohomology R34.2 | Motivic/coefficient comparisons, spectrum universal coefficients, curve trace/Kummer duality, continuous cohomology and Tate/cohomology Frobenius comparison. | Geometric elliptic K-modules, the correctly ranged descent argument and positive K-group formulas. |
| [StableReduction](../../../content/tau-ceti/StableReduction/README.md), 4–5 | Local blowups, exceptional-curve contraction, common resolution and positive-genus minimal models over DVRs. | Arithmetic models over O_{F,S}, finite global contractions, marked uniqueness and the K-theoretic integral image. |
| EllipticRegulators ER.6–ER.8 | Consumes the integral part and certified classes. | E.8 supplies algebraic certificates and examples; analytic regulator values, infinite-order proofs and L-value statements belong to EllipticRegulators. |

No scheme model, Tate module, general coefficient theory or local minimal-model
theory is reconstructed in these applications. Requested extensions have exact
contracts in the declaration prerequisites and the
[assembly handoff](../handoff/ASM-EllipticKTheory.md). In particular the
global-function-field, Geisser–Levine and continuous-cohomology requests require
more than the narrower current supplier briefs. They remain explicit planning
gaps until their producers supply those statements.

## Conventions

Write E/k for a smooth proper geometrically integral curve of genus one with a
k-rational origin O, represented by a Weierstrass equation W with W.IsElliptic.
E denotes its scheme model, E(k) its group of sections, and k(E) its function
field. The comparison with Mathlib's nonsingular Weierstrass point group includes
O and the addition law. A nonzero isogeny is finite flat; the constant morphism
at O is treated separately. Regularity of an arithmetic total space does not
require every special fibre to be smooth.

K_n is scheme K-theory of perfect complexes, with the regular K/G and
vector-bundle comparisons supplied by SchemeKTheoryOperations. All degrees in
this roadmap are nonnegative. On regular schemes it agrees with G-theory;
G-theory is retained on possibly singular special fibres. A subscript ℚ means
tensoring over ℤ with ℚ. Products mean tensor product in K₀ or its module action
on K_n. The coordinates for K₀(E) are always (r,d,P): rank, determinant degree
and the point corresponding to the degree-zero determinant. Their product is

\[
(r,d,P)(s,e,Q)=(rs,re+sd,rQ+sP),\qquad 1=(1,0,O).
\]

Every residue sum ranges over **all closed points**, with residue field k(x)
and valuation ord_x. The boundary on K₂ uses the left-linear convention

\[
\partial_x\{f,g\}=(-1)^{\operatorname{ord}_x(f)\operatorname{ord}_x(g)}
 \overline{f^{\operatorname{ord}_x(g)}/g^{\operatorname{ord}_x(f)}}.
\]

Thus ∂{u,π}=ū and ∂{π,u}=ū⁻¹. The K-book's right-linear boundary is its inverse;
the localization comparison imports both conventions. Kernels and certificate
conditions ∂=1 are unchanged. Weil reciprocity uses residue-field **norms**.
Triviality of the norm at a non-rational closed point does not imply triviality
of its residue.

For k=F_q of characteristic p, fix kbar, arithmetic Frobenius σ:x↦x^q,
and the q-power elliptic isogeny π. Its action on points is σ; geometric
Frobenius is σ⁻¹. For ℓ≠p let D_ℓ=Q_ℓ/Z_ℓ and D=⊕_{ℓ≠p}D_ℓ. Arithmetic
Frobenius acts on D_ℓ(j) by q^j. The twist E(kbar)\[ℓ∞\](j) therefore has action
q^jπ. For i≥0 put

\[
B_i(E,L)=\{P\in E(L):\exists m>0,\ (m,p)=1,\ mP=O,\ q^i\pi(P)=P\}.
\]

Only i≥1 is identified with K_{2i}(E); B₀ is a useful convention test. The
continuous rational cohomology argument is used only for twists j≥2.

For a number field F and a finite set S of finite primes, O_{F,S} is the
S-integer ring. Local models use O_(v), not its completion. A regular proper
arithmetic model has a fixed generic-fibre marking by E. Model morphisms
respect that marking and the base. Minimality is the outgoing-isomorphism
condition; positive-genus terminality and marked uniqueness are theorems.
The integral part is an image after tensoring with ℚ. It is neither a claim
about a full-rank lattice nor a finite-dimensionality assertion.

## Library baseline and sources

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The
[library audit](../../../data/library-coverage.json) classifies E.1 and E.3–E.6
as unbuilt, E.2 and E.7 as partly built, and E.8 as an acceptance layer.
In particular there is no scheme elliptic model or scheme higher K-functor at
these pins. Existing categorical K₀ and point-coordinate models do not fill
those roles.

The usable elliptic baseline includes
`WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`,
`TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.classGroupAddEquivPicZeroProdInt`
and `WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity`.
E.2 transports these function-field results instead of rebuilding their
mathematics. E.7 uses the existing place orders, residue units and finite
principal-divisor supports. Mathlib's `Affine.Point.map` and
`FiniteField.frobeniusAlgHom` implement the point action used to define B_i.
For local model comparisons E.6 uses the actual pinned `TauCeti.Model`,
`genericFiber`, `genericFiberι` and `genericFiberTowerIso`; its arithmetic model
adds properness and regularity over the Dedekind base. Marked-map uniqueness
applies Mathlib's `AlgebraicGeometry.ext_of_isDominant_of_isSeparated`.

The source list below gives editions and passage locators. Packet source
records preserve checksums and source-specific corrections. Separate K-book
chapters use chapter PDF pagination; the combined author draft uses printed
page numbers with an eight-page PDF offset. The author copies and the printed
volume are distinct versions. Bloch's cited passages come from the programme's
supplied scan; its linked catalogue is bibliographic, not an open copy.

| Source | Version and principal use |
| --- | --- |
| [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) (`Kbook.2013`) | Author-hosted combined draft dated 29 August 2013; not asserted identical to the printed edition (Graduate Studies in Mathematics 145, American Mathematical Society, 2013), which was compared only through the AMS errata list of 2 September 2014 |
| [The Stacks project, Chapter 53: Algebraic Curves](https://stacks.math.columbia.edu/tag/0BRV) (`Stacks.curves`) | online version accessed 2026-09-25 |
| [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf) (`Poonen.RPV`) | Author-hosted draft, PDF dated 18 December 2018 (published as Graduate Studies in Mathematics 186, American Mathematical Society, 2017) |
| [Minimal models for elliptic curves](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf) (`Conrad.MinimalModels`) | Lecture notes dated November 21, 2015 |
| [The Stacks Project, Chapter 'Resolution of Surfaces' (tag 0ADW)](https://stacks.math.columbia.edu/download/resolve.pdf) (`Stacks.ResolutionOfSurfaces`) | version ed88ff78, compiled 14 July 2026 |
| [The Stacks Project, Chapter 'Semistable Reduction' (tag 0C2P)](https://stacks.math.columbia.edu/download/models.pdf) (`Stacks.SemistableReduction`) | version ed88ff78, compiled 14 July 2026 |
| [Integral elements in K-theory and products of modular curves](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf) (`Scholl.IntegralElements`) | Author's preprint k1.pdf (22 pp.); published in The Arithmetic and Geometry of Algebraic Cycles (Banff 1998), NATO Sci. Ser. C 548 (2000), 467–489 — the published version was not read |
| [Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves](https://bookstore.ams.org/crmm-11) (`Bloch.CRM11`) | CRM Monograph Series 11, American Mathematical Society, 2000 (the 1978 Irvine lectures). Read in the programme's supplied scan SUP_Bloch_HigherRegulators_2000 (110 PDF pages, image only; printed page = PDF page - 12). |
| [Numerical verification of Beilinson's conjecture for K2 of hyperelliptic curves](https://arxiv.org/abs/math/0405040) (`DJZ.2006`) | arXiv:math/0405040v2 (4 May 2005); published Compositio Math. 142 (2006) 339-373 |
| [K2 and L-series of elliptic curves over real quadratic fields](https://etheses.durham.ac.uk/id/eprint/5114/1/5114_2567.PDF) (`Young.1995`) | Doctoral thesis, Durham University, 1995 (Durham E-Theses 5114) |
| [The 2-part of the Bloch-Kato conjecture, and indivisibility results, for K2 of some elliptic curves](https://arxiv.org/abs/2605.11100) (`DGJK.2026`) | arXiv:2605.11100v1 (11 May 2026) |
| [Weibel, K-book chapter IV, separately hosted author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) (`Kbook.IV.chapter, Kbook.IV`) | Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft. |
| [Weibel, K-book chapter III, separately hosted author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) (`Kbook.III.chapter, Kbook.III`) | Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft. |
| [Weibel, K-book chapter VI, separately hosted author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) (`Kbook.VI.chapter, Kbook.VI`) | Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft. |
| [The K-book: An Introduction to Algebraic K-theory, Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) (`Kbook.V`) | Author-hosted individual chapter of the 2013 book; chapter pagination; accessed 2026-10-06 |

## Layer overview and order

| Layer | Targets | Key planets |
| --- | --- | --- |
| [E.1](#layer-e1) | Scheme, function-field, point and isogeny comparisons; geometric integrality and divisor-API regularity. | The adapter layer uses the upstream elliptic planets. |
| [E.2](#layer-e2) | Rank–Picard K₀, degree and Euler pushforward, divisor/Picard comparison, descent and the tensor-product ring. | K₀ of an elliptic curve. |
| [E.3](#layer-e3) | Closed-point localization, normalized tame boundary, functorial residues and rational/integral injectivity. | The localisation sequence of a curve. |
| [E.4](#layer-e4) | Curve SK₁, origin splitting, two-column coniveau, K₃ and Adams weights. | The special first K-group of a curve. |
| [E.5](#layer-e5) | Isogeny operations and determinant obstruction; P¹ comparison; Harder, coefficient degrees, Frobenius descent, positive groups and orders. | The K-theory of a curve over a finite field; Isogeny projection formula; Harder finiteness; Twisted Frobenius kernel; Finite-field elliptic K-groups. |
| [E.6](#layer-e6) | Regular arithmetic models, canonical marked minimal models, localization, integral image and vertical criterion. | The integral part; Minimal regular arithmetic model; Arithmetic minimal-model theorem; Uniqueness of the arithmetic minimal model. |
| [E.7](#layer-e7) | Finite-support certificates, vertical certificates, torsion functions, Bloch correction/classes, transfer and rational descent. | Bloch's elements S_a. |
| [E.8](#layer-e8) | Public K₀–K₃ interface and three explicit arithmetic symbol examples. | The examples exercise the earlier planets. |

E.1 feeds E.2–E.5. E.3 and E.4 provide the localization and splitting inputs
to the finite-field chain. Inside E.5 the order is Harder inputs → geometric
modules and cohomology → positive descent → odd/even groups → orders. The
operation and point-subgroup developments can start independently once their
own imports are present. E.6's geometric model/minimality chain uses E.1 and
StableReduction; its good-prime K-theory argument additionally uses E.5.
E.7's horizontal certificates use E.3; integral certificates use E.6. E.8
instantiates the complete chain. Declarations below are ordered by their
explicit prerequisites, including references between the three source packets.
Their statements are specifications, with implementation status `unchecked`.


<a id="layer-e1"></a>

## E.1: the elliptic scheme and its comparisons

Import the projective Weierstrass scheme and group law, then connect it to the
existing point and function-field theories. Geometric integrality and regularity
are stated in the precise form consumed by the divisor API. The comparison
covers finite nonzero isogenies and treats the zero morphism separately.


<a id="E1-the-elliptic-curve-as-a-scheme"></a>

### The Weierstrass scheme over a field, imported from the modular-curves roadmap

`EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme` · comparison

Let W be a Weierstrass curve over a field F with W.IsElliptic. The scheme E_W is the base change to Spec F of the projective Weierstrass model of W that the Tau Ceti roadmap ModularCurves builds in its layer 1A over an arbitrary base ring: the closed subscheme of the projective plane cut out by the homogeneous cubic, the projective spectrum of the graded quotient ring, with its zero section [0:1:0]. This roadmap does not build it again. What this node fixes is the interface the rest of the roadmap uses: the two standard charts are D+(Z) ≅ Spec W.toAffine.CoordinateRing and D+(Y), they cover E_W because Y = Z = 0 forces X = 0 on the cubic, and the zero section lands in D+(Y) and misses D+(Z). At the library baseline no elliptic curve is a scheme: Mathlib has the projective spectrum of a graded ring as a scheme and Weierstrass curves in affine, projective and Jacobian coordinates, whose projective model is a quotient of a point set.

Hypotheses and conventions:

- W is a Weierstrass curve over the field F with W.IsElliptic (non-zero discriminant), Mathlib's elliptic-curve condition.
- The scheme and its zero section are ModularCurves layer 1A's model base-changed to Spec F; the request to that layer carries the need.
- The zero section [0:1:0] is part of the data, not a consequence.

Construction or proof:

1. Import ModularCurves layer 1A: the projective Weierstrass model over a base ring as the projective spectrum of the graded quotient of the polynomial ring in X, Y, Z by the homogeneous cubic, with its zero section; base-change it to Spec F.
2. Identify D+(Z) with Spec W.toAffine.CoordinateRing through Mathlib's chart Proj.awayι, dehomogenising at Z.
3. The charts cover: a point of the cubic with Y = Z = 0 has X^3 = 0, so X = 0 as well, which no point of the projective plane satisfies.
4. The zero section [0:1:0] has Y ≠ 0 and Z = 0, so it factors through D+(Y) and misses D+(Z); its image is a closed point with residue field F.
5. Record the pinned material: Mathlib's Proj with its affine charts, WeierstrassCurve and WeierstrassCurve.IsElliptic, and the fact that no elliptic curve is a scheme at the library baseline.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `EllipticScheme` | data | E_W := the base change to Spec F of ModularCurves layer 1A's projective Weierstrass model of W; an abbreviation of the upstream object, not a new construction. |
| `EllipticScheme.charts` | characterisation | D+(Z) ≅ Spec W.toAffine.CoordinateRing and D+(Y), as open subschemes. |
| `EllipticScheme.zeroSection` | data | The section [0:1:0] : Spec F → E_W, imported with the model. |
| `EllipticScheme.cover` | compatibility | D+(Z) ∪ D+(Y) = E_W. |
| `EllipticScheme.ofBase` | relation | E_W is the base change of the model over an arbitrary base ring (ModularCurves layer 1A). |

Unit tests:

- `charts_cover` (characterisation): D+(Z) ∪ D+(Y) = E_W.
- `affine_chart_equation` (compatibility): D+(Z) ≅ Spec W.toAffine.CoordinateRing over F.
- `section_disjoint` (characterisation): The zero section factors through D+(Y) and misses D+(Z); its image is the closed point [0:1:0] with residue field F.
- `singular_cubic` (non-example): For W : y^2 = x^3 over F_5 (discriminant 0) the projective model has 6 F_5-points, W.toAffine.Point has 5, and the model is not smooth at [0:0:1]; a definition that dropped W.IsElliptic or used the pointwise nonsingular set would not see this.
- `rational_points_count` (computation): For W : y^2 = x^3 − x over F_5, E_W(F_5) has 8 elements and the group is Z/4 × Z/2 (PARI: ellcard = 8, ellgroup = [4, 2]).

Acceptance checks:

- D+(Z) ∪ D+(Y) = E_W, and D+(Z) ≅ Spec W.toAffine.CoordinateRing over F.
- The zero section is a closed point in D+(Y) and not in D+(Z), with residue field F.
- For y^2 = x^3 − x over F_5, E_W has 8 F_5-points and the group is Z/4 × Z/2; for the singular cubic y^2 = x^3 over F_5 the projective model has 6 F_5-points while W.toAffine.Point has 5.

Prerequisites: `mathlib:WeierstrassCurve`; `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:AlgebraicGeometry.«Proj»`; `mathlib:AlgebraicGeometry.Proj.awayι`.

Sources: [Poonen.RPV](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.7.6, display (5.7.29), PDF p. 158.

<a id="E1-geometric-properties-of-the-curve"></a>

### Smoothness and properness of the Weierstrass scheme

`EllipticKTheory:E.1/geometric-properties-of-the-curve` · theorem

If W.IsElliptic, the structure morphism E_W → Spec F is smooth of relative dimension one and proper. Both are imported from ModularCurves layer 1A, which proves them for the projective Weierstrass model over any base on which the discriminant is a unit; over a field they are its base change. At the library baseline properness is Mathlib's instance that the projective spectrum of a graded algebra finitely generated over its degree-zero part is proper over the spectrum of that part; smoothness needs the Jacobian criterion in the global form (f, f_x, f_y) = (1) on each chart, which Mathlib's pointwise nonsingularity gives only after the Nullstellensatz over an algebraic closure. Geometric integrality, dimension one and regularity are the next two nodes.

Hypotheses and conventions:

- W.IsElliptic over the field F.
- The model and its properties over a base are ModularCurves layer 1A's; this node records their field case.
- Regularity does not imply smoothness in general: over F_p(t) the curve y^2 = x^p − t is regular and not smooth, and E.6's models over O_{F,S} are regular and not smooth at bad fibres.

Construction or proof:

1. Import smoothness and properness from ModularCurves layer 1A (request) and base-change to Spec F.
2. Properness at the library baseline: the instance IsProper (Proj.toSpecZero 𝒜) for a graded algebra finitely generated over its degree-zero part (Mathlib, ProjectiveSpectrum/Proper.lean), with Proj.isSeparated.
3. Smoothness chart by chart: nonsingularity at every point over an algebraic closure (Mathlib's equation_iff_nonsingular with the discriminant) gives (f, f_x, f_y) = (1) by the Nullstellensatz, hence a standard-smooth presentation of relative dimension one.
4. Record that the library baselinened nonsingularity is pointwise and is not a scheme-theoretic smoothness statement.

Acceptance checks:

- E_W → Spec F is smooth of relative dimension one and proper.
- Regularity does not imply smoothness in general (y^2 = x^p − t over F_p(t)).
- The pinned pointwise nonsingularity is not a scheme-theoretic smoothness statement.

Prerequisites: [`EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`](#E1-the-elliptic-curve-as-a-scheme); `mathlib:AlgebraicGeometry.Smooth`; `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`; `mathlib:AlgebraicGeometry.IsProper`; `mathlib:AlgebraicGeometry.Proj.isSeparated`; `mathlib:WeierstrassCurve.Affine.equation_iff_nonsingular`.

Sources: [Poonen.RPV](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.7.6, display (5.7.29), PDF p. 158; [Stacks.curves](https://stacks.math.columbia.edu/tag/0BRV), Tag 0BY3, Lemma 53.2.8.

<a id="E1-geometrically-integral-curve"></a>

### The Weierstrass scheme is a geometrically integral curve of genus one

`EllipticKTheory:E.1/geometrically-integral-curve` · theorem

For a Weierstrass curve W over a field F, E_W is geometrically integral over F, of dimension one, with H⁰(E_W, O) = F and dim_F H¹(E_W, O) = 1. In particular E_W is an integral scheme, and Scheme.functionField E_W is a field.

Hypotheses and conventions:

- W is a Weierstrass curve over the field F; ellipticity is not needed for integrality.
- E_W is the closed subscheme of the projective plane cut out by the homogeneous cubic G.

Construction or proof:

1. The homogeneous cubic G is irreducible over every extension field K: G is not divisible by Z (G(X, Y, 0) = −X^3), and its dehomogenisation y^2 + a1 xy + a3 y − (x^3 + a2 x^2 + a4 x + a6) is irreducible, because a factor of y-degree zero divides the leading coefficient 1 and a factor of y-degree one would give g in K[x] with g^2 + a1 x g + a3 g of degree 3, impossible since that degree is 2 deg g ≥ 4 or at most 2 (Mathlib: WeierstrassCurve.Affine.irreducible_polynomial).
2. Stacks Lemma 53.9.2 (0BYC): a plane curve cut out by an irreducible form is a curve. Apply it over F̄ to get geometric integrality.
3. Stacks Lemma 53.9.3 (0BYD): H⁰ = F and the genus is (3−1)(3−2)/2 = 1.
4. Mathlib's Field instance on functionField needs IsIntegral.

Acceptance checks:

- χ(E_W, O) = 0.
- Scheme.functionField E_W is a field.
- The singular cubic y² = x³ is still geometrically integral (non-example to 'integral implies smooth').

Prerequisites: [`EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`](#E1-the-elliptic-curve-as-a-scheme); `mathlib:AlgebraicGeometry.IsIntegral`; `mathlib:AlgebraicGeometry.GeometricallyIntegral`; `mathlib:AlgebraicGeometry.Scheme.functionField`; `mathlib:WeierstrassCurve.Affine.irreducible_polynomial`.

Sources: [Stacks.curves](https://stacks.math.columbia.edu/tag/0BRV), Tag 0BYC, Lemma 53.9.2; [Stacks.curves](https://stacks.math.columbia.edu/tag/0BRV), Tag 0BYD, Lemma 53.9.3.

<a id="E1-regular-in-the-divisor-api-form"></a>

### Regularity of the Weierstrass scheme, in the form the divisor API uses

`EllipticKTheory:E.1/regular-in-the-divisor-api-form` · theorem

If W.IsElliptic, then E_W is noetherian, every stalk is a regular local ring, every point has coheight at most one, and the stalk at every codimension-one point is a discrete valuation ring. These are exactly the hypotheses [IsIntegral X] [IsNoetherian X] [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (stalk y)] and ∀ y, coheight y ≤ 1 of Tau Ceti's SchemeWeilDivisor.toInvertibleSheaf and classGroupToLineBundleClassHom.

Hypotheses and conventions:

- W.IsElliptic over the field F.
- Smoothness over F is imported from ModularCurves 1A.

Construction or proof:

1. Smooth over a field implies regular local rings.
2. A one-dimensional regular local ring is a DVR.
3. Noetherianity comes from Proj of a finitely generated graded F-algebra.
4. Record that regular does not imply smooth over an imperfect field (y² = x^p − t over F_p(t)), and that E.6's arithmetic models are regular but not smooth.

Acceptance checks:

- Tau Ceti's classGroupToLineBundleClassHom applies to E_W.
- Every closed point's local ring is a DVR.

Prerequisites: [`EllipticKTheory:E.1/geometric-properties-of-the-curve`](#E1-geometric-properties-of-the-curve); [`EllipticKTheory:E.1/geometrically-integral-curve`](#E1-geometrically-integral-curve); `mathlib:IsRegularLocalRing`; `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClassHom`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.5.14 (PDF p. 65, printed p. 57).

<a id="E1-the-function-field-of-the-curve"></a>

### The function field of the scheme and of the Weierstrass equation agree

`EllipticKTheory:E.1/the-function-field-of-the-curve` · comparison

E_W is integral (E.1/geometrically-integral-curve), and D+(Z) ≅ Spec W.toAffine.CoordinateRing is a non-empty affine open. Mathlib's functionField_isFractionRing_of_isAffineOpen makes the function field of E_W, the local ring at its generic point, a fraction field of the ring of D+(Z), and IsFractionRing.algEquiv identifies it with W.toAffine.FunctionField := FractionRing W.CoordinateRing, the function field the existing elliptic-curve development uses. ModularCurves layer 2A records the same comparison as projModelFunctionFieldEquiv, and closed points correspond to places (AlgebraicCurves layer 12); the rational points are the degree-one places (Tau Ceti's pointEquivDegreeOnePlace). This is what makes every statement of E.3 about the K-theory of the function field a statement about the existing function-field API.

Hypotheses and conventions:

- The scheme is E_W with W.IsElliptic; it is integral by E.1/geometrically-integral-curve, which is what gives it a generic point and a function field.
- W.toAffine.CoordinateRing is a domain; its Dedekind property is derived in Tau Ceti for elliptic W, not assumed.
- The comparison is an isomorphism of F-algebras.

Construction or proof:

1. D+(Z) ≅ Spec W.CoordinateRing is a non-empty affine open of the integral scheme E_W.
2. Apply functionField_isFractionRing_of_isAffineOpen to it.
3. Apply IsFractionRing.algEquiv to reach W.toAffine.FunctionField.
4. Closed points correspond to places (AlgebraicCurves layer 12), the point at infinity to the place at infinity, and rational points to degree-one places (pointEquivDegreeOnePlace).

Acceptance checks:

- The two function fields agree as F-algebras.
- Places of the function field correspond to closed points of the scheme, with the point at infinity corresponding to the place at infinity.
- The rational points of E_W correspond to the degree-one places.

Prerequisites: [`EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`](#E1-the-elliptic-curve-as-a-scheme); [`EllipticKTheory:E.1/geometrically-integral-curve`](#E1-geometrically-integral-curve); `mathlib:AlgebraicGeometry.functionField_isFractionRing_of_isAffineOpen`; `mathlib:AlgebraicGeometry.Scheme.functionField`; `tauceti:WeierstrassCurve.Affine.pointEquivDegreeOnePlace`.

Sources: [Stacks.curves](https://stacks.math.columbia.edu/tag/0BRV), Tag 0BY1, Theorem 53.2.6.

<a id="E1-isogenies-as-scheme-morphisms"></a>

### Isogenies as morphisms of schemes, including the zero morphism

`EllipticKTheory:E.1/isogenies-as-scheme-morphisms` · comparison

The existing isogeny theory is developed on function fields: an isogeny is an embedding of function fields with a degree, a separability condition, a kernel of rational points and a differential. By the anti-equivalence between regular projective curves and function fields (AlgebraicCurves layer 12), a non-zero isogeny corresponds to a finite morphism of the schemes sending O to O, and under that correspondence the degree, separability, the F-points of the kernel, pullback of divisors and pullback of the invariant differential match. The kernel group scheme, of rank the degree, is ModularCurves layer 2B's; Tau Ceti's TauCeti.Isogeny.ker is its group of F-rational points. The ZERO morphism is not covered, because it induces no embedding of function fields: it pulls every line bundle back to the trivial one, and divisor pullback along it is defined only for divisors whose support avoids O, where it is zero.

Hypotheses and conventions:

- The curves are the schemes of the first node over the same base field.
- A non-zero isogeny is a non-constant morphism preserving the origin; the correspondence with function-field embeddings is contravariant.
- The zero morphism is the constant morphism to the origin, which is a perfectly good morphism of schemes and is not in the image of the correspondence.

Construction or proof:

1. Construct the morphism of schemes attached to a function-field embedding by the anti-equivalence of AlgebraicCurves layer 12 (Stacks Theorem 53.2.6), and check that it sends O to O.
2. The degree of the morphism is the degree of the field extension, which is the pinned isogeny degree.
3. The F-points of the scheme-theoretic kernel form TauCeti.Isogeny.ker (F-rational points only; card_ker_le_degree); the kernel group scheme is taken from ModularCurves layer 2B. Scheme pullback of divisors is TauCeti.Divisor.conorm along the function-field embedding, with the sum of e_x f_x over the points above y equal to the degree (sum_ramificationIdx_mul_inertiaDeg_eq_degree); separability matches isSeparable_iff_pullbackDifferential_ne_zero and the invariant differential pulls back by pullbackDifferential_invariantDifferential.
4. Treat the zero morphism separately: [0]^*L is trivial for every line bundle L, and divisor pullback along it is defined only for divisors D with O not in the support of D, where it is 0.
5. Record the pinned function-field isogeny theory, which the layer treats as given, and that the scheme side is what is missing.

Acceptance checks:

- A non-zero isogeny corresponds to a finite morphism of schemes sending O to O, with matching degree and separability.
- The zero morphism is not in that correspondence and gets its own definition: [0]^*L is trivial for every L.
- Under the correspondence, scheme pullback of divisors is TauCeti.Divisor.conorm along the function-field embedding, and the sum of e_x f_x over the points above y is the degree.

Prerequisites: [`EllipticKTheory:E.1/the-function-field-of-the-curve`](#E1-the-function-field-of-the-curve); `tauceti:TauCeti.Isogeny`; `tauceti:TauCeti.Isogeny.degree`; `tauceti:TauCeti.Isogeny.ker`; `tauceti:TauCeti.Isogeny.card_ker_le_degree`; `tauceti:TauCeti.Isogeny.fieldPullback`; `tauceti:TauCeti.Divisor.conorm`; `tauceti:TauCeti.Isogeny.sum_ramificationIdx_mul_inertiaDeg_eq_degree`; `tauceti:TauCeti.Isogeny.isSeparable_iff_pullbackDifferential_ne_zero`; `tauceti:TauCeti.Isogeny.pullbackDifferential_invariantDifferential`.

Sources: [Stacks.curves](https://stacks.math.columbia.edu/tag/0BRV), Tag 0BY1, Theorem 53.2.6.

<a id="E1-points-and-group-law-comparison"></a>

### Rational points of the scheme and the Weierstrass point group

`EllipticKTheory:E.1/points-and-group-law-comparison` · comparison

Let W be a Weierstrass curve over a field F with W.IsElliptic, and E_W the base change to Spec F of the projective Weierstrass model, with zero section O = [0:1:0]. Sending a section s : Spec F → E_W to its homogeneous coordinates gives a bijection from the F-sections of E_W → Spec F onto W.toAffine.Point, with O mapping to the point at infinity and [x:y:1] to the affine point (x, y). Under this bijection the scheme-theoretic group law on F-points is Mathlib's addition on W.toAffine.Point. Composing with pointEquivDegreeZeroDivisorClass identifies the F-points with the degree-zero divisor classes of F(W).

Hypotheses and conventions:

- W.IsElliptic, that is Δ ≠ 0 over the field F.
- E_W and its group law are ModularCurves layers 1A and 1D, base-changed to Spec F.
- The comparison is over a field; over a general base it is ModularCurves 1B(4) and is not restated here.

Construction or proof:

1. Import ModularCurves 1B(1): over a field and under W.IsElliptic, sections of the projective model are naturally equivalent to W.toAffine.Point, with infinity corresponding to the zero section.
2. Import ModularCurves 1D(6): the scheme group law agrees with Mathlib's pointwise group law on field-valued fibres.
3. Record Mathlib's equivalences WeierstrassCurve.Projective.Point.toAffineAddEquiv and WeierstrassCurve.Jacobian.Point.toAffineAddEquiv, so that the comparison can be read in any coordinates.
4. Compose with WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass and pointEquivDegreeOnePlace, so that rational points, degree-one places and degree-zero classes all match.

Acceptance checks:

- For y² = x³ − x over F₅ both sides have 8 elements and the group is ℤ/4 × ℤ/2.
- The zero section corresponds to Point.zero, and the section [x:y:1] to Point.some x y h.
- Non-example: for y² = x³ over F₅ the projective cubic has 6 F₅-points but W.toAffine.Point has 5, so ellipticity is essential.

Prerequisites: [`EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`](#E1-the-elliptic-curve-as-a-scheme); `mathlib:WeierstrassCurve.Affine.Point`; `mathlib:WeierstrassCurve.Projective.Point.toAffineAddEquiv`; `tauceti:WeierstrassCurve.Affine.pointEquivDegreeOnePlace`; `tauceti:WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.5.16, PDF p. 67 (printed p. 59); [Poonen.RPV](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.7.6, display (5.7.29), PDF p. 158.

<a id="layer-e2"></a>

## E.2: the zeroth K-group

Use the general rank–determinant theorem for regular separated curves, and
transport the function-field Picard splitting through the scheme divisor
dictionary. The rational origin supplies descent and the degree splitting.
Euler pushforward requires coherent cohomology finiteness and vanishing,
so the truncated Euler function alone does not define the desired K₀ map.


<a id="E2-K0-of-a-curve"></a>

### The zeroth K-group of a curve by rank and determinant

`EllipticKTheory:E.2/K0-of-a-curve` · comparison

For a one-dimensional, separated, connected, regular noetherian scheme X the rank and the determinant give an isomorphism from K_0(X) onto Z ⊕ Pic(X) (K-book II.8.2.1; separatedness matters, II.8.2.4 gives a regular non-separated scheme with K_0 ≠ G_0). KTheoryLowDegrees Z.5 owns the rank-determinant isomorphism with the structure-sheaf and skyscraper class formulas; this node imports it and fixes the formulas the rest of the layer uses: [L] ↦ (1, L) for a line bundle L, [O_X] ↦ (1, O_X), and the skyscraper O_x at a closed point x ↦ (0, O(x)). Neither the K_0 of a scheme nor a rank or determinant map exists at the library baseline, and the pinned Picard object for schemes is only a commutative monoid.

Hypotheses and conventions:

- X is a one-dimensional, separated, connected, regular noetherian scheme; E_W is one.
- The Picard group is the group of isomorphism classes of line bundles; the pinned scheme-level object is a monoid and the group structure is part of what is missing.
- The isomorphism is by rank and determinant and is natural for pullback along a morphism of such curves.

Construction or proof:

1. Record the owner and the imported statement.
2. Fix the two class formulas, for the structure sheaf and for a skyscraper at a closed point.
3. Record the pinned material: Tau Ceti's Grothendieck group of finitely generated projectives over a ring in the affine case, Mathlib's Picard group of a commutative ring, and the fact that the scheme-level line-bundle classes form only a monoid.
4. State the naturality used later, for pullback along a finite morphism and along an open immersion.

Acceptance checks:

- [L] ↦ (1, L) for a line bundle L; in particular [O_X] ↦ (1, O_X).
- The class of a skyscraper at a closed point x is (0, O(x)).
- The isomorphism is natural for pullback.
- Nothing of this exists at the library baseline; even the Picard object for schemes is not a group there.

Prerequisites: `KTheoryLowDegrees:Z.5`; [`EllipticKTheory:E.1/geometric-properties-of-the-curve`](#E1-geometric-properties-of-the-curve); `mathlib:CommRing.Pic`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`; `tauceti:TauCeti.ExactK0`; `tauceti:TauCeti.moduleResolutionEquiv`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), II.8.2.1, PDF p. 154 (printed p. 146).

<a id="E2-degree-euler-characteristic-and-pushforward"></a>

### The Euler characteristic and the pushforward to the base in degree zero

`EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward` · construction

On a curve X proper over a field F that is one-dimensional, separated and regular, the Euler characteristic χ(M) = dim H^0(X, M) − dim H^1(X, M) of a coherent sheaf is additive on short exact sequences and so defines χ : K_0(X) ≅ G_0(X) → Z; the pushforward p_* : K_0(X) → K_0(F) = Z along the structure morphism sends [M] to Σ(−1)^i [R^i p_* M] and equals χ. The degree of a line bundle, the Picard group and Riemann-Roch, χ(L) = deg L + 1 − g, are JacobianChallenge's (layers A and B) and are imported, not defined here. Tau Ceti's eulerCharBelow is the truncated sum over i < n of (−1)^i finrank H^i, with junk value 0 on infinite-dimensional groups, additive only under finite-dimensionality and vanishing hypotheses (eulerCharBelow_eq_add); making it a map out of K_0 needs finite-dimensionality of H^i of coherent sheaves on a proper curve and H^2 = 0, which are JacobianChallenge layer B's, and K_0 = G_0, which is SchemeKTheoryOperations S.2's.

Hypotheses and conventions:

- X is proper over F, one-dimensional, separated and regular; the sheaves are coherent.
- χ is eulerCharBelow at n = 2, which is the Euler characteristic once H^i is finite-dimensional and H^2 = 0 (JacobianChallenge layer B).
- The pushforward in degree zero is the transfer G_0(X) → G_0(F) of K-book II.8.2.3, owned by SchemeKTheoryOperations S.2; no E.5 input is used.

Construction or proof:

1. Import finiteness of H^i and vanishing of H^i for i ≥ 2 on a proper curve (JacobianChallenge layer B).
2. Additivity of eulerCharBelow at n = 2 under those hypotheses (eulerCharBelow_eq_add), hence a map out of G_0 by Tau Ceti's AbelianK0.lift, and out of K_0 = G_0 (S.2).
3. Define p_*[M] = Σ(−1)^i [R^i p_* M] in K_0(F) = Z (K-book II.8.2.3) and identify it with χ.
4. Relate χ to the imported degree by Riemann-Roch, χ(L) = deg L + 1 − g, which the tests use; a rational point has degree one (Tau Ceti's relativeDegree_ofPoint_of_section).

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `eulerChar` | data | χ : K_0(X) → Z, induced by the Euler characteristic of coherent sheaves. |
| `eulerChar_additive` | characterisation | Additivity on short exact sequences of coherent sheaves. |
| `pushforwardToBase` | data | p_* : K_0(X) → K_0(F) = Z along the structure morphism. |
| `pushforwardToBase_eq_eulerChar` | compatibility | p_* = χ in degree zero. |
| `riemannRoch` | relation | χ(L) = deg L + 1 − g, with the degree and the genus imported from JacobianChallenge. |

Unit tests:

- `point_degree_one` (computation): A rational point x has χ(O_x) = 1 and deg O(x) = 1.
- `structure_sheaf_elliptic` (computation): On an elliptic curve χ(O_E) = 0.
- `additive` (characterisation): χ is additive on short exact sequences of coherent sheaves.
- `factors_through_K0` (characterisation): χ factors through K_0(X), which is what makes it a K-theoretic invariant.
- `degree_ne_eulerChar_P1` (non-example): On the projective line over F, χ(O(n)) = n + 1 while deg O(n) = n.
- `nonrational_point_degree` (computation): On the projective line over Q the closed point x = V(t^2 + 1) has deg O(x) = 2 and χ(O_x) = 2.

Acceptance checks:

- χ is additive and factors through K_0(X).
- For a rational point x, χ(O_x) = 1 = deg O(x).
- p_*[O_E] = χ(O_E) = 0 for an elliptic curve E.
- χ(O(n)) = n + 1 on the projective line, so χ is not the degree.

Prerequisites: [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); `tauceti:AlgebraicGeometry.Scheme.Modules.eulerCharBelow`; `tauceti:AlgebraicGeometry.Scheme.Modules.eulerCharBelow_eq_add`; `tauceti:TauCeti.AbelianK0`; `tauceti:TauCeti.AbelianK0.lift`; `tauceti:TauCeti.AlgebraicGeometry.relativeDegree_ofPoint_of_section`; `SchemeKTheoryOperations:S.2`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), II.8.2.3, PDF p. 155 (printed p. 147); [Stacks.curves](https://stacks.math.columbia.edu/tag/0BRV), Tag 0BS6, Lemma 53.5.2 (Riemann-Roch).

<a id="E2-picard-group-is-the-divisor-class-group"></a>

### Line bundles, Weil divisor classes and function-field divisor classes

`EllipticKTheory:E.2/picard-group-is-the-divisor-class-group` · comparison

Let X be an integral, separated, noetherian scheme of dimension one whose codimension-one local rings are DVRs; E_W is an example. Then D ↦ O_X(D) induces a group isomorphism Cl(X) ≅ Pic(X). Through the closed-point/place dictionary, Cl(X) is identified with the divisor class group of F(X)/F, with a closed point x of degree [k(x):F].

Hypotheses and conventions:

- The hypothesis package of E.1/regular-in-the-divisor-api-form.
- Pic(X) is the group of isomorphism classes of line bundles, owned by JacobianChallenge Layer A; at the library baseline only the commutative monoid LineBundleClass X exists.

Construction or proof:

1. Tau Ceti gives the additive map classGroupToLineBundleClassHom, which is injective (classGroupToLineBundleClass_injective) and has invertible image (isUnit_toLineBundleClass).
2. Surjectivity: every line bundle on an integral scheme is O_X(D) for a Cartier divisor, and Cartier equals Weil when the local rings are UFDs (K-book I.5.14–I.5.15). This is JacobianChallenge Layer A's 'Cl(X) ≅ Pic X'.
3. Identify scheme Weil divisors with function-field divisors, with matching degrees and principal divisors: AlgebraicCurves 12D, together with E.1/the-function-field-of-the-curve.

Acceptance checks:

- The map is additive and bijective.
- O_X(O) has degree 1 on E_W.
- A principal divisor maps to the trivial class (Tau Ceti's toLineBundleClass_principalDivisor).

Prerequisites: [`EllipticKTheory:E.1/regular-in-the-divisor-api-form`](#E1-regular-in-the-divisor-api-form); [`EllipticKTheory:E.1/the-function-field-of-the-curve`](#E1-the-function-field-of-the-curve); `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClassHom`; `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_injective`; `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.isUnit_toLineBundleClass`; `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme`; `tauceti:TauCeti.Place.orderSystem`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.5.15, PDF p. 66 (printed p. 58).

<a id="E2-picard-decomposition-and-the-point-group"></a>

### The Picard group of an elliptic curve and its degree-zero part

`EllipticKTheory:E.2/picard-decomposition-and-the-point-group` · theorem

On an elliptic curve with a rational origin O the degree splits the Picard group as the direct sum of the degree-zero part and the integers, and the degree-zero part is canonically the group of points of the curve, the class of a point P corresponding to the class of the divisor (P) − (O). The FUNCTION-FIELD form is proved in Tau Ceti with no incomplete proofs: the degree splitting of the class group of an order system with a weight-one rational point (classGroupAddEquivPicZeroProdInt, more general than the elliptic case), and the identification of the points of a Weierstrass curve over a field with the degree-zero divisor classes of its function field (pointEquivDegreeZeroDivisorClass). Together they give Cl(F(W)/F) ≅ E(F) × Z. The passage to line bundles on the scheme, Cl ≅ Pic and scheme divisors ≅ places, is not pinned; it is E.2/picard-group-is-the-divisor-class-group.

Hypotheses and conventions:

- W.IsElliptic over a field F with decidable equality, with its rational origin; Dedekindness of W.CoordinateRing is derived (isIntegrallyClosed_coordinateRing), not assumed.
- The identification is with the degree-zero divisor classes of the FUNCTION FIELD, which by E.1 are the degree-zero classes of the scheme.
- The splitting depends on the chosen origin and is not canonical without it.

Construction or proof:

1. Record the pinned degree splitting and its hypothesis, a weight-one rational point.
2. Record the pinned identification of the point group with the degree-zero divisor classes, with the computation rule sending an affine point to the class of the difference of the point and the origin.
3. Transport both across E.2/picard-group-is-the-divisor-class-group (Cl(E_W) ≅ Pic(E_W) and scheme divisors ≅ places of F(W)) to obtain the statement for the scheme.
4. Record the dependence on the origin and that no canonical splitting exists without it.

Acceptance checks:

- The Picard group is the direct sum of the point group and the integers, with the chosen origin.
- The class of a point corresponds to the class of the point minus the origin.
- Both halves are pinned in Tau Ceti and are cited, not reproved.
- Without a point of degree one the degree map need not be surjective, its image being iZ with i the index. An abstract splitting Pic ≅ Pic^0 ⊕ Z still exists, but it is not n ↦ n[O] and its Z-component is not the degree; for the conic x^2 + y^2 + z^2 = 0 over R the degree has image 2Z.

Prerequisites: [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); [`EllipticKTheory:E.2/picard-group-is-the-divisor-class-group`](#E2-picard-group-is-the-divisor-class-group); `tauceti:WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`; `tauceti:WeierstrassCurve.Affine.val_pointEquivDegreeZeroDivisorClass_some`; `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.classGroupAddEquivPicZeroProdInt`; `tauceti:TauCeti.Place.isWeightedDegreeZero_orderSystem`; `tauceti:TauCeti.Divisor.ker_degreeClass_eq_picZero`; `tauceti:TauCeti.Place.degree_infinity`; `tauceti:WeierstrassCurve.Affine.isIntegrallyClosed_coordinateRing`; `tauceti:WeierstrassCurve.Affine.isDedekindDomain_coordinateRing_of_isIntegrallyClosed`; `mathlib:WeierstrassCurve.Affine.Point`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.5.16, PDF p. 66 (printed p. 58); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.5.16, PDF p. 67 (printed p. 59).

<a id="E2-line-bundle-descent"></a>

### Descent of line-bundle classes, and why the origin makes it automatic

`EllipticKTheory:E.2/line-bundle-descent` · theorem

Let X be a proper geometrically integral curve over F, F^s a separable closure and G = Gal(F^s/F). The map Pic(X) → Pic(X_{F^s})^G is injective, and its cokernel embeds in the kernel of Br F → Br X. If X(F) is nonempty the map is an isomorphism. In particular, for E_W with its rational origin every G-invariant line-bundle class on E_{F^s} is the class of a line bundle on E_W. For E_W this is proved directly: an invariant class c of degree d satisfies c − d[O] ∈ Pic⁰(E_{F^s})^G ≅ E(F^s)^G = E(F). The general statement is owned by ModularCurves layer 2D (relative elliptic Picard duality and descent) as the owner of the general statement; this node is its specialisation to the pointed curve over F, with the direct argument above.

Hypotheses and conventions:

- Separable closure, not algebraic closure: over an imperfect field Pic⁰(E_{F̄})^{Aut(F̄/F)} can contain classes from E(F^{perf}) ⊋ E(F).
- The rational origin is used exactly here.

Construction or proof:

1. For E_W: P ↦ [P − O] is Galois-equivariant (EllipticCurves Layer 0.5, base change and Galois actions), so the degree-zero part of c descends to a point of E(F).
2. The degree part is d·[O(O)] with O rational.
3. Injectivity: Pic⁰(E) = E(F) ↪ E(F^s), and degrees are preserved.
4. Record the general Brauer sequence as a remark, citing Poonen Cor. 6.7.8; it is not used in the proof for E_W.

Acceptance checks:

- For E_W with origin, Pic(E_W) ≅ Pic(E_{F^s})^G.
- Non-example: for the conic x² + y² + z² = 0 over ℝ, the degree-one class on C_ℂ ≅ ℙ¹_ℂ is Gal(ℂ/ℝ)-invariant but is not in the image of Pic(C), which has only even degrees.

Prerequisites: [`EllipticKTheory:E.2/picard-decomposition-and-the-point-group`](#E2-picard-decomposition-and-the-point-group); [`EllipticKTheory:E.2/picard-group-is-the-divisor-class-group`](#E2-picard-group-is-the-divisor-class-group); `tauceti:WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`.

Sources: [Poonen.RPV](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Exercise 6.10 (PDF p. 217); [Poonen.RPV](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Exercise 2.12 (PDF p. 68).

<a id="E2-ring-structure-of-K0-of-a-curve"></a>

### The multiplication on K₀ of a curve in rank–determinant coordinates

`EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve` · lemma

For X one-dimensional, separated, regular, noetherian and connected, rank ⊕ det : K₀(X) → ℤ ⊕ Pic(X) is a ring isomorphism when the target has the product (a₁, L₁)·(a₂, L₂) = (a₁a₂, L₂^{a₁} ⊗ L₁^{a₂}). Equivalently, K̃₀(X) = Pic(X) is an ideal of square zero. For E_W with coordinates (r, d, P) ∈ ℤ ⊕ ℤ ⊕ E(F) (rank, degree, point): (r₁,d₁,P₁)(r₂,d₂,P₂) = (r₁r₂, r₁d₂ + r₂d₁, r₁P₂ + r₂P₁), with unit (1, 0, O). This is not the product ring structure.

Hypotheses and conventions:

- The rank–determinant isomorphism of E.2/K0-of-a-curve.
- Multiplication on K₀(X) is induced by ⊗ of vector bundles.

Construction or proof:

1. rank(E ⊗ E') = rank E · rank E' and det(E ⊗ E') = det(E)^{rank E'} ⊗ det(E')^{rank E} (K-book II.8.1).
2. Transport through E.2/picard-decomposition-and-the-point-group.

Acceptance checks:

- [O_x]·[O_y] = 0 for closed points x, y.
- ([L] − 1)² = 0 for every line bundle L.
- (0,1,O)² = 0, whereas in a product ring (0,1,O) would be idempotent.

Prerequisites: [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); [`EllipticKTheory:E.2/picard-decomposition-and-the-point-group`](#E2-picard-decomposition-and-the-point-group); `KTheoryLowDegrees:Z.5`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), II.8.1, PDF p. 153 (printed p. 145).

<a id="E2-K0-of-an-elliptic-curve"></a>

### The zeroth K-group of an elliptic curve

`EllipticKTheory:E.2/K0-of-an-elliptic-curve` · theorem

Combining the rank-determinant isomorphism with the Picard decomposition, the zeroth K-group of an elliptic curve E over F with its rational origin O is Z ⊕ Z ⊕ E(F): a class goes to its rank, the degree of its determinant d, and the point P with det ≅ O(P + (d − 1)O). This is an isomorphism of GROUPS, with the chosen origin; the multiplication induced by the tensor product is (r1, d1, P1)(r2, d2, P2) = (r1 r2, r1 d2 + r2 d1, r1 P2 + r2 P1) (E.2/ring-structure-of-K0-of-a-curve), not the product ring. Because the origin is rational, every Galois-invariant line-bundle class over a separable closure descends (E.2/line-bundle-descent), so the identification is compatible with base change and Galois descent. E.2 owns this statement; KTheoryLowDegrees Z.5 supplies only the rank-determinant isomorphism.

Hypotheses and conventions:

- E is elliptic over a field F with its rational origin O; the origin is used in the Picard decomposition.
- The isomorphism is of abelian groups; the ring structure is the one of E.2/ring-structure-of-K0-of-a-curve.
- E.2 owns K_0(E) ≅ Z^2 ⊕ E(F); KTheoryLowDegrees Z.5 must not import it (restructure entry).

Construction or proof:

1. Combine E.2/K0-of-a-curve and E.2/picard-decomposition-and-the-point-group to obtain the group isomorphism.
2. Write the induced multiplication on the three summands (E.2/ring-structure-of-K0-of-a-curve).
3. Record base change: the identification is Galois-equivariant, and invariant classes descend (E.2/line-bundle-descent).
4. Sanity check over an algebraically closed field against K-book VI.6.4: Z ⊕ Z ⊕ J(X̄).

Acceptance checks:

- K_0(E) ≅ Z^2 ⊕ E(F) as groups, with the chosen origin.
- For y^2 = x^3 − x over F_5, K_0(E) ≅ Z^2 ⊕ Z/4 ⊕ Z/2.
- The multiplication is not the product ring structure: (0, 1, O)^2 = 0.

Prerequisites: [`EllipticKTheory:E.2/picard-decomposition-and-the-point-group`](#E2-picard-decomposition-and-the-point-group); [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); [`EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve`](#E2-ring-structure-of-K0-of-a-curve); [`EllipticKTheory:E.2/line-bundle-descent`](#E2-line-bundle-descent); `KTheoryLowDegrees:Z.5`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), II.8.2.1, PDF p. 154 (printed p. 146); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6.4, PDF p. 511 (printed p. 503).

Atlas planet: **K₀ of an elliptic curve**.

<a id="layer-e3"></a>

## E.3: localization and tame residues

Apply general localization and dévissage over every closed point. Identify
the boundary with the normalized DVR tame symbol and keep the entire sequence
when proving naturality. The tame kernel is the image of curve K₂; equality
with curve K₂ is a separate injectivity theorem, rational over number fields
and integral over finite fields.


<a id="E3-localisation-sequence-for-a-curve"></a>

### The localisation sequence of a curve in degrees zero through three

`EllipticKTheory:E.3/localisation-sequence-for-a-curve` · theorem

For a regular, separated, integral curve X over a field F with function field F(X) (so K = G) the localisation sequence runs over ALL closed points, not only the rational ones, and in low degrees reads: from the third K-group of the curve to that of the function field, then to the sum of the second K-groups of the residue fields, then to the second K-group of the curve, then to that of the function field, then by the boundary to the sum of the unit groups of the residue fields, then to the first K-group of the curve, then to the multiplicative group of the function field, then by the divisor map to the free group on the closed points, then to the zeroth K-group, then by the generic rank K_0(X) → K_0(F(X)) = Z, which is surjective because [O_X] ↦ 1, and onto zero. Exactness holds at every term. The maps into the sums are the residues; the maps out are the transfers.

Hypotheses and conventions:

- X is a regular (hence K = G), separated, integral curve over a field F; all closed points are used, with residue fields finite over F but not necessarily equal to it.
- The sequence is Quillen's localisation for the Serre subcategory M_0(X) of coherent sheaves of finite length in M(X), with M(X)/M_0(X) ≅ M(F(X)), dévissage K(M_0(X)) ≅ ⊕_x K(k(x)), and the resolution theorem K(X) ≅ G(X) for regular X; it is not obtained by gluing affine sequences, which do not glue.
- The bottom row is the divisor sequence F(X)^× → Div(X) → Pic(X) → 0, direct-summed with the rank.

Construction or proof:

1. Obtain the sequence from Quillen's localisation theorem for the abelian category of coherent sheaves and the Serre subcategory of those with finite support, and identify the quotient with the modules over the function field.
2. Identify the terms in each degree by dévissage, with the residue fields of the closed points appearing one degree down, and replace G by K using regularity.
3. The boundary in degree two is identified with K2SymbolsBrauer's tame symbol in E.3/the-tame-symbol-boundary, where the sign convention is fixed.
4. The boundary in degree one is the divisor map, the transfer sends [x] to [O_x] = (0, O(x)), and the last map is the generic rank, which is onto (E.3/boundaries-in-degrees-one-and-zero).

Acceptance checks:

- The sequence is exact at every displayed term.
- The boundary in degree two is identified with the tame symbol in E.3/the-tame-symbol-boundary, in K2SymbolsBrauer's convention.
- The bottom row is the divisor sequence direct-summed with the rank K_0(X) → Z.
- The sum is over ALL closed points; restricting to rational points breaks exactness (on the projective line over Q, (t^2 + 1)/(t^2 + 2) has trivial divisor at every rational point and is not constant).
- The degree map a ↦ deg(det a) is not the last map: on the projective line over Q the class [O_X] has degree 0 and is not in the image of the sum over closed points.

Prerequisites: [`EllipticKTheory:E.1/the-function-field-of-the-curve`](#E1-the-function-field-of-the-curve); [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); `GeneralAlgebraicKTheory:K.1`; `GeneralAlgebraicKTheory:K.3`; `SchemeKTheoryOperations:S.2`; `SchemeKTheoryOperations:S.3`; `KTheoryLowDegrees:U.3`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, PDF p. 424 (printed p. 416); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, PDF p. 424 (printed p. 416); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6, Dedekind Domains, PDF p. 417 (printed p. 409); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6.8, PDF p. 513 (printed p. 505).

Atlas planet: **The localisation sequence of a curve**.

<a id="E3-the-tame-symbol-boundary"></a>

### The boundary in degree two is the tame symbol

`EllipticKTheory:E.3/the-tame-symbol-boundary` · comparison

Let x be a closed point of the regular integral curve X with valuation v_x on F(X). The displayed boundary K_2(F(X)) → ⊕_x k(x)^× is, at each x, K2SymbolsBrauer's tame symbol ∂^T_x{f, g} = (−1)^{v(f)v(g)} · the residue of f^{v(g)}/g^{v(f)}, so that ∂{u, π} = ū and ∂{π, u} = ū^{-1} for a uniformiser π at x and a unit u. The comparison of the tame symbol with the localisation boundary of a discrete valuation ring is owned by K2SymbolsBrauer T.3:localization-comparison (T.3/localization-boundary), which fixes the sign there: with the K-book's right-linear normalisation of Quillen's boundary (V.6.6: ∂{π, u} = ū) the boundary is the INVERSE of ∂^T, and with the left-linear normalisation it is ∂^T. E.3 uses the left-linear normalisation, or equivalently inverts the K-book's boundary; inverting a map changes no kernel or image, so exactness is unaffected. The curve statement is the stalkwise specialisation of that comparison through S.3. The certificates of E.7 are conditions ∂_x = 1, which read the same in both normalisations.

Hypotheses and conventions:

- The point is a closed point of the curve with its discrete valuation on the function field.
- The displayed boundary is K2SymbolsBrauer's tame symbol; the K-book's right-linear normalisation of Quillen's boundary gives its inverse (K2SymbolsBrauer T.3/localization-boundary states both).
- The residue field may be larger than the base field, and the symbol lands in its unit group, not in that of the base.

Construction or proof:

1. Import the DVR comparison and its two normalisations from K2SymbolsBrauer T.3/localization-boundary.
2. Specialise it to the local ring of X at each closed point through S.3's closed-point localisation, which identifies the x-component of the curve boundary with the boundary of the DVR O_{X,x}.
3. Fix the left-linear normalisation, so that the displayed map is ⊕_x ∂^T_x; record that the K-book's V.6.6 gives ∂{π, u} = ū, the inverse.
4. Record the Steinberg relation and the independence of the uniformiser from K2SymbolsBrauer T.3.
5. Record the consequence for E.7: a certificate is a finite list of closed points at which the symbol is computed, with a proof that it is trivial everywhere else.

Acceptance checks:

- The displayed boundary is ⊕_x ∂^T_x, K2SymbolsBrauer's tame symbol in its order and sign.
- On {π, u} it gives ū^{-1}, the inverse of the value Quillen's boundary gives in the K-book normalisation (V.6.6).
- The symbol lands in the unit group of the residue field, which may be larger than the base field.
- Exactness of the sequence is unaffected by the choice of normalisation.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); `K2SymbolsBrauer:T.3/tame-symbol`; `K2SymbolsBrauer:T.3/tame-symbol-steinberg`; `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`; `K2SymbolsBrauer:T.3/localization-boundary`; `SchemeKTheoryOperations:S.3`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6, PDF p. 417 (printed p. 409); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6, PDF p. 417 (printed p. 409); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.3, PDF p. 242 (printed p. 234).

<a id="E3-boundaries-in-degrees-one-and-zero"></a>

### The divisor boundary and the rank at the end of the sequence

`EllipticKTheory:E.3/boundaries-in-degrees-one-and-zero` · lemma

In the localisation sequence of a regular integral curve X over F, the boundary K₁(F(X)) = F(X)^× → ⊕_x K₀(k(x)) = ⊕_x ℤ is f ↦ Σ_x ord_x(f)·[x]. The transfer ⊕_x ℤ → K₀(X) sends [x] to [O_x], which is (0, O(x)) in rank–determinant coordinates. The last map K₀(X) → K₀(F(X)) = ℤ is the generic rank, and it is surjective. So the tail is the divisor sequence F(X)^× → Div(X) → Pic(X) → 0, direct-summed with the rank.

Hypotheses and conventions:

- X is regular, separated and integral over F; all closed points are used.

Construction or proof:

1. ∂(s) = [R/sR] for a parameter s of the DVR at x (K-book V.6.6 via 6.1.2), so ∂(f) = ord_x(f)·[k(x)].
2. The class of O_x through E.2/K0-of-a-curve.
3. Restriction to the generic point sends a coherent sheaf to its generic rank.

Acceptance checks:

- On ℙ¹_ℚ, t² + 1 maps to [x] − 2[∞], where x has residue field ℚ(i).
- [O_X] ↦ 1 under the last map.
- Non-example: a ↦ deg(det a) in place of the rank breaks exactness at K₀(X).

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); `KTheoryLowDegrees:U.3`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417, printed p. 409).

<a id="E3-naturality-of-the-sequence"></a>

### Naturality of the sequence for open immersions

`EllipticKTheory:E.3/naturality-of-the-sequence` · lemma

For the inclusion j : U → X of the complement of a finite set Z of closed points, restriction gives a morphism from the localisation sequence of X to that of U: the function-field terms are equal, the residue term of U is the sub-sum over the closed points of U, the map between residue terms is the projection killing the terms at Z, and j^* is the map on the K-groups of the curves. Finite maps are the next two nodes: pullback multiplies residues by ramification indices, and transfer composes them with residue-field norms.

Hypotheses and conventions:

- X is a regular, separated, integral curve over F and Z a finite set of closed points; U = X − Z is open and dense.
- Restriction along an open immersion is exact on coherent sheaves and preserves finite support.
- Naturality is asserted for the whole sequence, which is what makes a diagram chase legitimate.

Construction or proof:

1. j^* : M(X) → M(U) is exact and maps M_0(X) to M_0(U), inducing the identity of M(X)/M_0(X) = M(F(X)) = M(U)/M_0(U).
2. Quillen localisation is natural for such exact functors (K.3), which gives the morphism of sequences.
3. Read off the effect on each term: the identity on K_*(F(X)), the projection on the residue terms.
4. Record the consequence used later: a class whose residues vanish outside U can be computed on U.

Acceptance checks:

- The diagram of the sequences for X and U commutes.
- The residue map of U is the residue map of X followed by the projection away from Z.
- For Z empty the morphism is the identity.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); `GeneralAlgebraicKTheory:K.3`; `SchemeKTheoryOperations:S.2`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, PDF p. 424 (printed p. 416).

<a id="E3-naturality-for-finite-pullback"></a>

### Pullback along a finite map multiplies residues by ramification indices

`EllipticKTheory:E.3/naturality-for-finite-pullback` · lemma

Let φ : X → Y be a finite (hence flat) morphism of regular integral curves over F. Pullback gives a morphism of localisation sequences. Its component ⊕_y K_n(k(y)) → ⊕_x K_n(k(x)) is Σ_{x↦y} e(x/y)·(extension of scalars k(y) → k(x)). In degree two, for a, b in F(Y)^×, ∂_x{φ*a, φ*b} is the e(x/y)-th power of ∂_y{a, b}, read in k(x)^×.

Hypotheses and conventions:

- X and Y regular integral curves over F; e(x/y) is the ramification index.

Construction or proof:

1. Flat pullback on coherent sheaves preserves the Serre subcategory of torsion sheaves (S.2).
2. By dévissage of O_X/m_y O_X, the class of the fibre at y is Σ e_x[k(x)].
3. In degree two this is K2SymbolsBrauer's ramification formula.

Acceptance checks:

- For φ : ℙ¹_ℚ → ℙ¹_ℚ, s ↦ t = s², with x = (s = 0) over y = (t = 0) and e = 2, and a constant u ∈ ℚ^×: in T's convention ∂_y{u, t} = u and ∂_x{u, s²} = u².
- φ = identity gives the identity.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); [`EllipticKTheory:E.3/the-tame-symbol-boundary`](#E3-the-tame-symbol-boundary); `K2SymbolsBrauer:T.3/ramification-formula`; `SchemeKTheoryOperations:S.2`; `tauceti:TauCeti.Divisor.conorm`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.3.1 (PDF p. 242, printed p. 234).

<a id="E3-naturality-for-finite-transfer"></a>

### Transfer along a finite map commutes with residues through residue-field norms

`EllipticKTheory:E.3/naturality-for-finite-transfer` · lemma

For a finite morphism φ : X → Y of regular integral curves over F, the transfers N_{F(X)/F(Y)} and N_{X/Y} form a morphism of localisation sequences. Its component on the residue terms is ⊕_y Σ_{x↦y} N_{k(x)/k(y)}. In particular ∂_y(N a) = Π_{x↦y} N_{k(x)/k(y)}(∂_x a) for a in K₂(F(X)).

Hypotheses and conventions:

- φ is finite, so that direct image is exact on coherent and on torsion sheaves.

Construction or proof:

1. The functors M(X) → M(Y) and M_0(X) → M_0(Y) are compatible (K-book (6.6.3)).
2. Take homotopy groups (K-book (6.6.4)).

Acceptance checks:

- For the identity φ, N is the identity.
- In degree one the residue-term map is the norm N_{k(x)/k(y)}.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); `SchemeKTheoryOperations:S.2`; `GeneralAlgebraicKTheory:K.3`; `K2SymbolsBrauer:T.3/transfer-and-norm-residue`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3-6.6.4, PDF p. 418 (printed p. 410).

<a id="E3-what-the-sequence-does-not-identify"></a>

### K_2 of a curve over a number field injects rationally into K_2 of its function field

`EllipticKTheory:E.3/what-the-sequence-does-not-identify` · theorem

For a regular integral curve X over a number field k, K₂(X) ⊗ ℚ → K₂(k(X)) ⊗ ℚ is injective. The kernel of K₂(X) → K₂(k(X)) is the image of ⊕_x K₂(k(x)), which is torsion because each k(x) is a number field. In general the kernel of the tame symbol on K₂(k(X)) is only the image of K₂(X). Exactness says only that the kernel of the tame symbol on K_2(k(X)) is the IMAGE of K_2(X); identifying it with K_2(X) is this theorem after tensoring with Q, and is not a definition.

Hypotheses and conventions:

- k is a number field; the closed points of X have number fields as residue fields.

Construction or proof:

1. Exactness at K₂(X) (E.3/localisation-sequence-for-a-curve).
2. K_2 of a number field L is torsion: K_2(L) is the filtered colimit of K_2(O_{L,S}) over the finite sets S of finite places (K-theory commutes with filtered colimits of rings, GeneralAlgebraicKTheory K.1), and each K_2(O_{L,S}) is finite (ArithmeticKTheory N.3/finiteness-and-ranks-combined: every positive even K-group of a ring of S-integers is finite). The tame kernel sequence (K2SymbolsBrauer T.5) gives the same conclusion but is not needed.
3. ⊗ℚ is exact.
4. Apply the number-field residue statement to every closed point x, since k(x) is a finite extension of the base number field, not only to rational points. The direct sum of torsion K₂(k(x)) is torsion; no common annihilating exponent is required before tensoring with ℚ.

Acceptance checks:

- Injective after ⊗ℚ.
- Non-example: identifying ker ∂ with K₂(X) integrally asserts an injectivity that is not proved.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`; `GeneralAlgebraicKTheory:K.1`; `ArithmeticKTheory:N.2/even-degree-injectivity`; `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, PDF p. 424 (printed p. 416).

<a id="E3-integral-injectivity-over-a-finite-field"></a>

### K₂ of a curve over a finite field injects into K₂ of its function field

`EllipticKTheory:E.3/integral-injectivity-over-a-finite-field` · theorem

For a regular integral curve X over F_q, K₂(X) → K₂(F_q(X)) is injective, so K₂(X) is the kernel of the tame symbol ∂ : K₂(F_q(X)) → ⊕_x k(x)^×.

Hypotheses and conventions:

- Every k(x) is finite, so K₂(k(x)) = 0.

Construction or proof:

1. Exactness at K₂(X).
2. K_2 of a finite field is zero (K2SymbolsBrauer T.2/k2-finite-field).

Acceptance checks:

- 0 → K₂(X) → K₂(F) → ⊕_x k(x)^× is exact.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); `K2SymbolsBrauer:T.2/k2-finite-field`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6, opening (PDF p. 510, printed p. 502).

<a id="layer-e4"></a>

## E.4: SK₁, coniveau and weights

Curve SK₁ is the kernel of restriction to the function field. It retains
information lost by passing to an affine chart. Coniveau has two columns,
but its cokernel piece can be nonzero; a description of K₃ by a residue kernel
alone omits part of the group. Adams operations distinguish the field's
indecomposable weight-two contribution from the curve's geometric filtration.


<a id="E4-K1-and-SK1-of-a-curve"></a>

### The first K-group of a curve and its special subgroup

`EllipticKTheory:E.4/K1-and-SK1-of-a-curve` · definition

Let X be a regular integral curve, proper over a field F with H^0(X,O_X) = F. The image of K_1(X) in K_1(F(X)) = F(X)^× is F^×. Define SK_1(X) := ker(K_1(X) → K_1(F(X))). By exactness of the localisation sequence of E.3, SK_1(X) is the image of ⊕_x (i_x)_*: ⊕_x k(x)^× → K_1(X), hence isomorphic to the cokernel of the tame-symbol map ∂: K_2(F(X)) → ⊕_x k(x)^×. Pullback along π: X → Spec F splits K_1(X) = π^*K_1(F) ⊕ SK_1(X). For an affine regular integral curve Spec R the same kernel is the stable SK_1(R) = ker(det); for proper X it is in general non-zero although every affine open has vanishing stable SK_1 (e.g. X = P^1_F).

Hypotheses and conventions:

- X is integral, regular, of dimension one and proper over F, with H^0(X,O_X) = F; regularity is used for K = G in the localisation sequence, not for the image statement.
- The first K-group of a field is identified with its unit group by the determinant.
- SK_1(X) is defined as a kernel; its description as a cokernel is exactness and part of the statement.

Construction or proof:

1. The composite K_1(X) → K_1(F(X)) ≅ F(X)^× factors through det: K_1(X) → Γ(X,O_X)^× = F^× (naturality of det), and π^* makes F^× a subgroup of the image; so the image is F^×.
2. Define SK_1(X) as the kernel; exactness of E.3's sequence at K_1(X) identifies it with the image of ⊕_x (i_x)_* and with coker ∂.
3. π^*: K_1(F) → K_1(X) followed by K_1(X) → K_1(F(X)) is the inclusion F^× ⊂ F(X)^×, giving the splitting.
4. For X = Spec R affine regular: ker(K_1(R) → K_1(F(X))) = ker(det) since R^× → F(X)^× is injective.
5. For X = P^1_F: K_1(P^1_F) = F^×[O] ⊕ F^×[O(−1)] (S.5), the image in F(t)^× is F^×, so SK_1(P^1_F) = F^×·[O_∞] ≅ F^×; SK_1(F[t]) = 0 by homotopy invariance.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `curveK1Image` | characterisation | range (K_1(X) → K_1(F(X))) = image of F^× under π^* followed by restriction. |
| `curveSK1` | data | SK_1(X) := ker(K_1(X) → K_1(F(X))). |
| `curveSK1_eq_range_pushforward` | characterisation | SK_1(X) = range(⊕_x (i_x)_*: ⊕_x K_1(k(x)) → K_1(X)). |
| `curveSK1_eq_coker` | characterisation | SK_1(X) ≅ coker(∂: K_2(F(X)) → ⊕_x k(x)^×), compatibly with the maps from ⊕_x k(x)^×. |
| `curveSK1_split` | structure | K_1(X) = π^*K_1(F) ⊕ SK_1(X). |
| `curveSK1_norm` | compatibility | π_*((i_x)_* u) = N_{k(x)/F}(u) for u ∈ k(x)^× (K-book V.6.12.1 proof). |
| `curveSK1_affine_eq_stableSK1` | compatibility | For X = Spec R affine regular integral of dimension one, ker(K_1(R) → K_1(Frac R)) = SK_1(R) := ker(det). |

Unit tests:

- `curveSK1_projectiveLine` (computation): SK_1(P^1_F) = ∞_*(F^×) ≅ F^×, and K_1(P^1_F) ≅ F^× ⊕ F^×.
- `curveSK1_affine_line` (compatibility): For X = A^1_F = Spec F[t], the kernel ker(K_1(F[t]) → F(t)^×) equals SK_1(F[t]) = 0.
- `curveSK1_not_local` (non-example): P^1_F = Spec F[t] ∪ Spec F[t^{-1}] with SK_1 of both charts zero, but SK_1(P^1_F) ≅ F^× ≠ 0 for F ≠ F_2: the curve invariant of a proper curve is not the stable SK_1 of any affine piece and is not Zariski-local.
- `curveSK1_eq_coker_test` (characterisation): For P^1_F, coker(∂: K_2(F(t)) → ⊕_{x∈P^1} k(x)^×) ≅ k(∞)^× = F^×, and the isomorphism of curveSK1_eq_coker sends the class of u ∈ k(∞)^× to ∞_*(u).

Acceptance checks:

- The image of K_1(X) in F(X)^× is F^×.
- SK_1(X) = im(⊕_x k(x)^× → K_1(X)) ≅ coker(∂).
- K_1(X) = π^*F^× ⊕ SK_1(X).
- SK_1(P^1_F) ≅ F^× while SK_1(F[t]) = 0.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); [`EllipticKTheory:E.1/geometric-properties-of-the-curve`](#E1-geometric-properties-of-the-curve); `SchemeKTheoryOperations:S.2`; `SchemeKTheoryOperations:S.5`; `KTheoryLowDegrees:U.3`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6, opening discussion, printed p. 502 (PDF p. 510); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof, printed p. 412 (PDF p. 420); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.13.2, printed p. 417 (PDF p. 425).

Atlas planet: **The special first K-group of a curve**.

<a id="E4-rational-base-point-splitting"></a>

### A rational point splits the norm on SK_1 and kills SK_1 under pullback

`EllipticKTheory:E.4/rational-base-point-splitting` · lemma

Let X be as in E.4/K1-and-SK1-of-a-curve and P ∈ X(F) with closed immersion P: Spec F → X and structure map π. Then (a) π_*∘P_* = id on K_*(F); (b) π_*∘(i_x)_* = N_{k(x)/F} on K_1(k(x)); hence P_*: F^× → SK_1(X) is a section of π_*|: SK_1(X) → F^× and K_1(X) = π^*F^× ⊕ P_*F^× ⊕ V(X) with V(X) = ker(π_*|SK_1(X)); (c) P^* ∘ (i_x)_* = 0 for every closed point x, so P^*: K_1(X) → K_1(F) is the identity on π^*F^× and zero on SK_1(X).

Hypotheses and conventions:

- X is a regular integral curve, proper over F with H^0(X,O_X) = F, and P is an F-rational point; P and i_x are proper and perfect because X is regular.
- For x ≠ P the fibre product Spec F ×_X Spec k(x) is empty.
- For x = P the normal bundle of P is a trivial line bundle, so λ_{-1}(N^∨) = 1 − 1 = 0 in K_0(F).

Construction or proof:

1. (a) and (b): functoriality of proper pushforward, (π∘P) = id and π∘i_x = Spec of k(x)/F, with the transfer of a finite field extension equal to the norm on K_1.
2. Splitting: π_* is surjective on SK_1(X) because π_*P_* = id and P_*F^× ⊂ SK_1(X).
3. (c) for x ≠ P: base change (S.2) along the empty fibre product; for x = P: self-intersection formula P^*P_*(u) = λ_{-1}(N^∨)·u = 0 (S.7).

Acceptance checks:

- For X = P^1_F and P = ∞: V(P^1_F) = 0 and K_1(P^1_F) = π^*F^× ⊕ ∞_*F^×.
- P^* restricted to SK_1(X) is zero.

Prerequisites: [`EllipticKTheory:E.4/K1-and-SK1-of-a-curve`](#E4-K1-and-SK1-of-a-curve); `SchemeKTheoryOperations:S.2`; `SchemeKTheoryOperations:S.7`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12.1, proof, printed p. 417 (PDF p. 425).

<a id="E4-the-coniveau-spectral-sequence-of-a-curve"></a>

### The two-column coniveau spectral sequence of a curve

`EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve` · comparison

For a regular integral curve X over a field F with function field F(X), the coniveau spectral sequence of S.4 has E_1^{0,-n} = K_n(F(X)), E_1^{1,-n-1} = ⊕_{x closed} K_n(k(x)) and d_1 = the residue map ∂ of E.3; there are no other columns, so E_2 = E_∞. The coniveau filtration F^1K_n(X) := im(⊕_x (i_x)_*: ⊕_x K_n(k(x)) → K_n(X)) gives, for every n ≥ 0, the short exact sequence 0 → coker(∂_{n+1}: K_{n+1}(F(X)) → ⊕_x K_n(k(x))) → K_n(X) → ker(∂_n: K_n(F(X)) → ⊕_x K_{n−1}(k(x))) → 0, whose maps are those of the localisation sequence. The left term F^1K_n(X) is in general non-zero (it contains P_*K_n(F) when X is proper with a rational point P) and may vanish (X = A^1_F).

Hypotheses and conventions:

- X is regular, integral, of dimension one over F, so that K = G and the codimension filtration has two steps.
- The general codimension filtration and coniveau exact couple are owned by SchemeKTheoryOperations S.4; for a curve the statement is read off E.3's localisation sequence, as S.4 permits.
- Degeneration at E_2 holds in all degrees because only two columns are non-zero.

Construction or proof:

1. Identify E_1 and d_1 with the terms and residue maps of E.3's sequence (dévissage for the closed points).
2. Two columns imply d_r = 0 for r ≥ 2.
3. Split the long exact localisation sequence at K_n(X) into the displayed short exact sequence; F^1 is the image of the transfers.
4. Non-vanishing: if X is proper and P ∈ X(F), π_*P_* = id (S.2) shows P_*: K_n(F) → F^1K_n(X) is injective.
5. Vanishing example: for X = A^1_F, K_n(A^1_F) = K_n(F) (S.5) injects into K_n(F(t)) (K-book V.6.7.1), so F^1K_n(A^1_F) = 0.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `coniveauPage` | data | E_1 of the two-column spectral sequence, with d_1 = ∂. |
| `coniveauFiltration` | data | F^1K_n(X) := range(⊕_x (i_x)_*), F^0 = K_n(X), F^2 = 0. |
| `coniveau_eq_localisation` | compatibility | The edge and filtration maps equal the maps of E.3's localisation sequence. |
| `coniveauFiltration_left_eq_coker` | characterisation | F^1K_n(X) ≅ coker(∂_{n+1}). |
| `coniveau_gr0_eq_ker` | characterisation | K_n(X)/F^1K_n(X) ≅ ker(∂_n). |
| `coniveau_degenerate` | characterisation | E_2 = E_∞ in every degree. |

Unit tests:

- `two_columns` (degenerate): For X = Spec F (dimension zero) there is one column and F^1 = 0; for a curve exactly the columns p = 0, 1 are non-zero.
- `left_term_projectiveLine` (computation): For X = P^1_F, F^1K_3(P^1_F) = ∞_*K_3(F) ≅ K_3(F) and ker ∂_3 = K_3(F); for F = Q both are Z/48 and K_3(P^1_Q) ≅ (Z/48)^2.
- `left_term_affine_line` (non-example): F^1K_3(A^1_F) = 0: the left term is not always non-zero.
- `agrees_with_localisation` (compatibility): The composite ⊕_x K_n(k(x)) → F^1K_n(X) ⊂ K_n(X) is ⊕_x (i_x)_* of E.3.

Acceptance checks:

- E_2 = E_∞ in every degree.
- The displayed sequence is exact with the localisation maps.
- For E = 37a1 over Q (origin rational), F^1K_3(E) ⊇ O_*K_3(Q) ≅ Z/48, so K_3(E) → ker ∂_3 is not injective.
- F^1K_3(A^1_F) = 0.

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); `SchemeKTheoryOperations:S.4`; `SchemeKTheoryOperations:S.2`; `SchemeKTheoryOperations:S.5`; `K3BlochGroups:V.5/k3-Z-and-Q`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.9, opening paragraph, printed p. 435 (PDF p. 443); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.9.5 and 9.5.1, printed p. 437 (PDF p. 445); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.7.1, printed p. 411 (PDF p. 419).

<a id="E4-the-third-K-group-of-a-curve"></a>

### The third K-group of a curve from the two-column sequence

`EllipticKTheory:E.4/the-third-K-group-of-a-curve` · theorem

The third K-group of a smooth integral curve sits in an exact sequence between the cokernel of the residue map from the fourth K-group of the function field into the sum of the third K-groups of the residue fields, and the kernel of the residue map from the third K-group of the function field into the sum of the second K-groups of the residue fields. Both ends are needed: the description as a kernel alone is the associated graded of the filtration, not the group. The maps agree with those of the localisation sequence, and the field's indecomposable contribution is distinguished from the extra geometry of the curve by the weight decomposition of the next node.

Hypotheses and conventions:

- The curve is smooth and integral over a field.
- The sequence is the one of the two-step filtration, so its two ends are the two graded pieces.
- The indecomposable part of the third K-group of a field is the quotient by the image of the Milnor K-group, which K3BlochGroups owns.

Construction or proof:

1. Write the two graded pieces of the filtration in degree three.
2. Identify the lower piece with the cokernel of the residue from degree four and the upper with the kernel of the residue from degree three.
3. Assemble the exact sequence and check that its maps are those of the localisation sequence.
4. Record the non-example: taking only the kernel gives the graded piece, not the group, and the extension is the content.
5. Record the comparison with the field: the indecomposable third K-group of the function field maps into this group, and the difference is the geometry of the curve, which the weight decomposition of the next node separates.

Acceptance checks:

- The third K-group sits in the displayed exact sequence with both ends.
- The kernel description alone gives a subquotient, not the group.
- The maps agree with the localisation sequence.
- For E = 37a1 over Q, K_3(E) contains π^*K_3(Q) ⊕ O_*K_3(Q) ≅ (Z/48)^2, so K_3(E) is not the image of K_3^ind of the base field.

Prerequisites: [`EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve`](#E4-the-coniveau-spectral-sequence-of-a-curve); `K3BlochGroups:V.2/k3-indecomposable`; `K3BlochGroups:V.4/suslin-exact-sequence`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.12, PDF p. 424 (printed p. 416); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6.8, proof, PDF p. 513 (printed p. 505).

<a id="E4-adams-operations-and-the-weight-decomposition"></a>

### The weight components of the K-theory of a curve

`EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition` · construction

For a regular curve X over a field F, the Adams operations ψ^k of S.6 act on K_n(X), and the rational weight-j component K_n(X)_Q^{(j)} is the ψ^k = k^j eigenspace, equal by M.6 to H^{2j−n}(X, Q(j)); only 0 ≤ j ≤ n+1 occur (H^i(X,Q(j)) = 0 for i > j + 1). For K_0 the decomposition is integral: K_0(X) = Z·1 ⊕ ker(rank) with weights 0, 1; for K_1, π^*F^× has weight 1 and SK_1(X) weight 2 (rationally; integrally as far as S.6's Adams–Riemann–Roch for the codimension-one Gysin maps holds integrally). With coefficients Z/ℓ^ν the eigenspaces are defined when ℓ is prime to char F and the eigenvalues k^j, 0 ≤ j ≤ n+1, are pairwise distinct mod ℓ for some k prime to ℓ (the condition owned by S.6). The components are functorial for pullback along base change F ⊂ F′ and along morphisms of curves.

Hypotheses and conventions:

- X is regular, of dimension one, over a field F; the eigenvalue theorem ψ^k = k^j on weight j is S.6's, and the identification with motivic cohomology is M.6's.
- An integral decomposition is asserted for K_0 of a curve only; in general the projectors have denominators (K_0(P^2)).
- The finite-coefficient eigenspaces are asserted only under the stated condition on ℓ.

Construction or proof:

1. Rational projectors from S.6 and the bounded weight range from M.6 (H^i(X,Q(j)) = 0 for i > j + dim X).
2. K_0: ψ^k[L] = [L^{⊗k}] and products of rank-zero classes vanish on a curve.
3. K_1: ψ^k is multiplicative and acts by k on K_1(F); on (i_x)_*K_1(k(x)) it acts by k^2 by the Gysin weight shift of S.6.
4. Finite coefficients: the Lagrange projectors ∏_{i≠j}(ψ^k − k^i)/(k^j − k^i) are defined over Z/ℓ^ν under the condition on ℓ.
5. Functoriality: pullback commutes with ψ^k.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `weightComponent` | data | K_n(X)_Q^{(j)} := {a : ψ^k a = k^j a for all k}. |
| `weightProjector` | projection | The rational idempotent onto K_n(X)_Q^{(j)} built from finitely many ψ^k. |
| `weightComponent_iSup_eq_top` | characterisation | K_n(X)_Q = ⊕_{0≤j≤n+1} K_n(X)_Q^{(j)}. |
| `weightComponent_pullback` | functoriality | f^* maps K_n(Y)_Q^{(j)} into K_n(X)_Q^{(j)}; in particular base change F ⊂ F′. |
| `weightComponent_finiteCoeff` | other | The Z/ℓ^ν-coefficient eigenspace decomposition under the condition on ℓ. |
| `weightComponent_motivic` | compatibility | K_n(X)_Q^{(j)} ≅ H^{2j−n}(X, Q(j)) (M.6). |

Unit tests:

- `K0_curve_weights` (computation): For X = P^1_F: ψ^k(1 − [O(−1)]) = k(1 − [O(−1)]), so K_0(P^1_F) = Z·1 ⊕ Z·(1 − [O(−1)]) with weights 0, 1.
- `K0_P2_not_integral` (non-example): In K_0(P^2_F) = Z[z]/(z^3), the weight-one eigenvector is z + z^2/2 ∉ K_0(P^2_F), and Z·1 ⊕ Z(2z + z^2) ⊕ Z·z^2 has index 2.
- `K1_curve_weights` (computation): For X = P^1_F: ψ^k acts by k on π^*F^× and by k^2 on ∞_*F^× ⊂ K_1(P^1_F).
- `weight_zero_field` (degenerate): For X = Spec F and n ≥ 1, K_n(F)_Q^{(0)} = 0 and K_1(F)_Q = K_1(F)_Q^{(1)}.

Acceptance checks:

- K_0(X)^{(0)} = Z·1 and K_0(X)^{(1)} = ker(rank) ≅ Pic(X).
- K_1(X)_Q^{(1)} = π^*F^×⊗Q and K_1(X)_Q^{(2)} = SK_1(X)⊗Q.
- K_0(P^2_F) has no integral eigen-decomposition (index 2).

Prerequisites: [`EllipticKTheory:E.4/K1-and-SK1-of-a-curve`](#E4-K1-and-SK1-of-a-curve); [`EllipticKTheory:E.4/the-third-K-group-of-a-curve`](#E4-the-third-K-group-of-a-curve); [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); `SchemeKTheoryOperations:S.6`; `MotivicEtaleKTheory:M.6`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.4, after Example 4.5(iv), printed p. 484 (PDF p. 492); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), II.8.6, printed p. 149 (PDF p. 157).

<a id="E4-indecomposable-K3-sits-in-weight-two"></a>

### The indecomposable K_3 of a field is its weight-two part

`EllipticKTheory:E.4/indecomposable-K3-sits-in-weight-two` · theorem

For every field L, K_3(L)_Q = K_3(L)_Q^{(2)} ⊕ K_3(L)_Q^{(3)}, the image of K_3^M(L)_Q is K_3(L)_Q^{(3)}, and hence K_3^ind(L)_Q ≅ K_3(L)_Q^{(2)}. For a regular curve X over F, pullback maps K_3^ind(F)_Q into K_3(X)_Q^{(2)}, and F^1K_3(X)_Q has weights 3 and 4 (the Gysin shift of the weights 2 and 3 of the residue fields), which separates the base field's indecomposable contribution from the geometry of the curve.

Hypotheses and conventions:

- Rational coefficients throughout; the integral statement is false in general (K_3^M(L) → K_3(L) can have a 2-torsion kernel; K3BlochGroups V.2).
- M.4 supplies H^3(L, Z(3)) ≅ K_3^M(L) and H^i(L, Q(j)) = 0 for i > j; M.6 supplies K_3(L)_Q^{(j)} ≅ H^{2j−3}(L, Q(j)).

Construction or proof:

1. Weights j ≥ 4 vanish because 2j − 3 > j; weight 1 is H^{-1}(L,Q(1)) = 0; weight 0 vanishes for n > 0.
2. Products of weight-one classes have weight 3 (ψ^k multiplicative), so the image of K_3^M(L)_Q lies in weight 3, and equals it by M.4 and M.6.
3. Hence K_3^ind(L)_Q = coker(K_3^M(L)_Q → K_3(L)_Q) ≅ K_3(L)_Q^{(2)}.
4. For the curve: F^1K_3(X)_Q is the image of ⊕_x K_3(k(x))_Q under Gysin maps that raise the weight by one (S.6).

Acceptance checks:

- K_3^ind(Q)_Q = 0 = K_3(Q)_Q^{(2)} (K_3(Q) ≅ Z/48 is finite), consistent.
- For L a number field with r_2 complex places, dim K_3(L)_Q^{(2)} = r_2 (K3BlochGroups V.2/k3-rank-borel).

Prerequisites: [`EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`](#E4-adams-operations-and-the-weight-decomposition); `K3BlochGroups:V.2/k3-indecomposable`; `K3BlochGroups:V.2/k3-rank-borel`; `MotivicEtaleKTheory:M.4`; `MotivicEtaleKTheory:M.6`; `SchemeKTheoryOperations:S.6`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.4.3, Edge Map, printed p. 481 (PDF p. 489).

<a id="layer-e5"></a>

## E.5: operations and finite-field K-theory

Specialize the operations from S.2 and the projective-bundle theorem from
S.5. For an isogeny f of degree d, put P_f=det(f_*O) in Pic⁰(E)=E(k). The
projection formula gives f_*f*(r,e,P)=(dr,de,dP+rP_f). The determinant is the
integral obstruction to degree multiplication; the separable rational and
odd-multiplication integral cases retain their stated hypotheses.

The finite-field computation separates finiteness from descent. The Harder
application needs global-function-field producer extensions, and the geometric
calculation needs the actual coefficient spectral sequence with its compatible
splittings. Integral geometric and divisible-coefficient degrees differ:
K_{2i}(Ebar)=E(kbar)\[prime-to-p torsion\](i), whereas
K_{2i-1}(Ebar;D_ℓ)=E(kbar)\[ℓ∞\](i−1). Frobenius descent uses j≥2; degree one has
its separate exact-reciprocity/origin argument.

For i≥1 the resulting groups are K_{2i-1}(E)≅(ℤ/(q^i−1))² and
K_{2i}(E)≅B_i(E,kbar). The ℓ-primary even part is the **cokernel** of
1−q^iπ on T_ℓE; taking its lattice kernel would lose the group. Its order is
D_i=1−a_qq^i+q^{2i+1}, with a_q=q+1−#E(k). The determinant specifies the order,
while the integral operator is required to determine invariant factors.

| Curve | #E(k) | a_q | #K₂(E) | Further check |
| --- | ---: | ---: | ---: | --- |
| F₂, y²+y=x³+x+1 | 1 | 2 | 5 | K₁=0; K₃≅(ℤ/3)²; #K₄=25. |
| F₂, y²+y=x³+x | 5 | −2 | 13 | #K₄=41; the odd groups agree with the first curve. |
| F₃, y²=x³−x | 4 | 0 | 28 | K₁≅(ℤ/2)². |

The subgroup tests distinguish the missing twist, the trace sign and inclusion
of characteristic-primary torsion. P¹ has the same positive odd abstract groups
and zero positive even groups; the first curve gives a concrete difference.


<a id="E5-pullback-and-pushforward"></a>

### Pullback for arbitrary morphisms and pushforward for proper perfect morphisms

`EllipticKTheory:E.5/pullback-and-pushforward` · comparison

K-theory of noetherian schemes is contravariant for arbitrary morphisms, by derived pullback of perfect complexes, and covariant for proper morphisms of finite Tor-dimension (perfect maps), by derived pushforward; G-theory is covariant for all proper morphisms. For a finite flat morphism the pushforward is the transfer attached to the module structure, so the scheme-level and ring-level constructions agree. SchemeKTheoryOperations S.2 owns both constructions; this node records them, fixes which hypotheses each needs, and states the agreement for finite flat maps, which is what the isogeny computation of the next nodes uses.

Hypotheses and conventions:

- The schemes are noetherian; pullback needs no further hypothesis once K-theory is defined by perfect complexes.
- Pushforward on K needs properness and finite Tor-dimension; for a finite flat morphism both hold.
- The agreement with the ring-level transfer is for a finite flat morphism of affine schemes.

Construction or proof:

1. Record the two constructions and their owner.
2. State the hypotheses of each separately, since the layer uses pullback for maps that are not proper.
3. State the agreement with the module-theoretic transfer for a finite flat morphism.
4. Record the functoriality of each and the compatibility of pushforward with base change along a flat map.
5. Record that nothing of this exists at the library baseline, because the K-theory of a scheme does not.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `KPullback` | data | Pullback along an arbitrary morphism. |
| `KPushforward` | data | Pushforward along a proper morphism of finite Tor-dimension. |
| `KPullback_comp` | functoriality | Functoriality of pullback. |
| `KPushforward_comp` | functoriality | Functoriality of pushforward. |
| `KPushforward_eq_transfer` | compatibility | Agreement with the module-theoretic transfer for a finite flat morphism. |
| `KPushforward_baseChange` | compatibility | Compatibility with flat base change. |

Unit tests:

- `pushforward_structure_morphism_P1` (computation): For π: P^1_F → Spec F, π_*[O(n)] = n + 1 in K_0(F) = Z; in particular π_*[O(−1)] = 0.
- `pushforward_structure_morphism_elliptic` (compatibility): For an elliptic curve E with origin O, π_*[O_E] = χ(O_E) = 0 and π_*[O_E(O)] = 1, agreeing with tauceti:AlgebraicGeometry.Scheme.Modules.eulerCharBelow.
- `finite_field_extension_transfer` (compatibility): For f: Spec L → Spec F with L/F finite, f_*: K_1(L) → K_1(F) is N_{L/F}: L^× → F^× and f^* is the inclusion.
- `pullback_generic_point` (compatibility): For the generic point j: Spec F(X) → X of a curve (a morphism that is neither proper nor of finite type), j^*: K_1(X) → F(X)^× is the map of E.4/K1-and-SK1-of-a-curve.
- `open_immersion_not_proper` (non-example): For j: A^1_F → P^1_F, j_*O_{A^1} is quasi-coherent but not coherent (H^0 is infinite-dimensional), so the sheaf direct image does not define a map G_0(A^1_F) → G_0(P^1_F).

Acceptance checks:

- Pullback is functorial for arbitrary morphisms.
- Pushforward is functorial for proper morphisms of finite Tor-dimension.
- For a finite flat morphism the pushforward is the module-theoretic transfer.
- Pushforward along the structure morphism of a proper curve is the Euler characteristic in degree zero.

Prerequisites: `SchemeKTheoryOperations:S.2`; `GeneralAlgebraicKTheory:K.3`; [`EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward`](#E2-degree-euler-characteristic-and-pushforward).

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.3.11, PDF p. 403 (printed p. 395).

<a id="E5-projection-formula-and-isogenies"></a>

### The projection formula, and what the isogeny pull-push composite really is

`EllipticKTheory:E.5/projection-formula-and-isogenies` · theorem

For a proper morphism f of noetherian schemes the projection formula says that f_*(x · f^*y) = f_*(x) · y for x in G_*(X) and y in K_*(Y); taking x to be the unit gives that pushforward after pullback is multiplication by the class of f_*O_X. For an isogeny that class has rank the degree, but it is NOT the degree times the unit class in general: whether it is is decided by its determinant, a degree-zero line bundle that is 2-torsion for a separable isogeny. This node states the formula and the composite; E.5/class-of-the-pushed-forward-structure-sheaf computes the class.

Hypotheses and conventions:

- The morphism is proper of finite Tor-dimension; an isogeny of elliptic curves is finite flat and satisfies both.
- The class of the pushforward of the structure sheaf lives in the zeroth K-group of the target and has rank the degree of the isogeny.
- Whether [f_*O] equals its rank is decided by det(f_*O), which is 2-torsion for a separable isogeny; it is not assumed.

Construction or proof:

1. State the projection formula and record its owner.
2. Specialise the second argument to the unit and obtain the composite formula with the class of the pushforward of the structure sheaf.
3. Compute the rank of that class as the degree of the isogeny.
4. State the non-example: in integral K-theory the composite is not multiplication by the degree, because the determinant of the class need not be trivial.
5. The simplifications (rationally for separable isogenies, integrally for [m] with m odd) and the integral non-example are the lemma E.5/class-of-the-pushed-forward-structure-sheaf.
6. Record the use of the corrected formula in the later layers, where a class is transported along an isogeny.

Acceptance checks:

- The composite of pushforward after pullback is multiplication by the class of the pushforward of the structure sheaf.
- That class has rank the degree of the isogeny.
- It is not the degree times the unit in integral K-theory in general.
- For every separable isogeny f_*f^* = deg f after tensoring with Q; integrally it can fail (E.5/class-of-the-pushed-forward-structure-sheaf).

Prerequisites: [`EllipticKTheory:E.5/pullback-and-pushforward`](#E5-pullback-and-pushforward); [`EllipticKTheory:E.1/isogenies-as-scheme-morphisms`](#E1-isogenies-as-scheme-morphisms); `SchemeKTheoryOperations:S.2`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.3.12, PDF p. 403 (printed p. 395).

<a id="E5-class-of-the-pushed-forward-structure-sheaf"></a>

### The class of f_*O for an isogeny: rank, determinant, and when it is the degree

`EllipticKTheory:E.5/class-of-the-pushed-forward-structure-sheaf` · lemma

Let f: E′ → E be an isogeny of elliptic curves over a field F. Then f_*O_{E′} is locally free of rank deg f and det(f_*O_{E′}) ∈ Pic^0(E). (a) If f is separable, det(f_*O_{E′})^{⊗2} ≅ O_E; hence [f_*O_{E′}] = deg(f)·1 in K_0(E)⊗Q and f_*f^* = deg(f) on K_*(E)⊗Q. (b) If f = [m] with m odd and char F ∤ m, then det([m]_*O_E) ≅ O_E, [[m]_*O_E] = m^2 in K_0(E), and [m]_*[m]^* = m^2 on K_*(E). (c) If char F ≠ 2 and f is separable of degree 2, then det(f_*O_{E′}) is a non-trivial 2-torsion line bundle, so [f_*O_{E′}] ≠ 2 in K_0(E) and f_*f^*(1) ≠ 2·1.

Hypotheses and conventions:

- f is a non-zero isogeny, hence finite and flat (a finite dominant map of regular curves is flat).
- K_0(E) ≅ Z ⊕ Pic(E) by rank and determinant (E.2), and K_*(E) is a K_0(E)-module.
- Separability is used through étaleness (trace form perfect); (b) needs char F ∤ m; (c) needs char F ≠ 2 for the splitting by ½Tr.

Construction or proof:

1. Rank: the generic rank of f_*O_{E′} is [F(E′):F(E)] = deg f (tauceti:TauCeti.Isogeny.degree through E.1's comparison). deg det = χ(f_*O_{E′}) − deg f·χ(O_E) = 0.
2. (a) For f finite étale the trace pairing f_*O ⊗ f_*O → O is perfect, so f_*O ≅ (f_*O)^∨ and det^{⊗2} ≅ O; torsion classes vanish in Pic(E)⊗Q.
3. (b) E ×_{[m],E,[m]} E ≅ E × E[m] gives [m]^*[m]_*O_E ≅ O_E^{m^2} (flat base change), so det([m]_*O_E)^{⊗m} ≅ [m]^*det = O (theorem of the square on Pic^0); with (a), m odd gives det ≅ O.
4. (c) f_*O_{E′} = O_E ⊕ L with L = ker(½Tr); h^0(L) = h^0(E′,O) − h^0(E,O) = 0, so L ≇ O and det = L.
5. Conclude with the projection formula of E.5/projection-formula-and-isogenies: f_*f^*(a) = [f_*O_{E′}]·a.

Acceptance checks:

- For E: y^2 = x^3 − x over Q and its 2-isogeny to y^2 = x^3 + 4x: [f_*O_E] = (2, L) with L ≠ O, so f_*f^*(1) ≠ 2 in K_0.
- For f = [3] on any E over Q: f_*f^* = 9 on K_*(E).
- For every separable isogeny, f_*f^* = deg f on K_*(E)⊗Q.

Prerequisites: [`EllipticKTheory:E.1/isogenies-as-scheme-morphisms`](#E1-isogenies-as-scheme-morphisms); [`EllipticKTheory:E.2/K0-of-a-curve`](#E2-K0-of-a-curve); [`EllipticKTheory:E.5/pullback-and-pushforward`](#E5-pullback-and-pushforward); `tauceti:TauCeti.Isogeny.degree`; [`EllipticKTheory:E.5/projection-formula-and-isogenies`](#E5-projection-formula-and-isogenies).

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.3.12, PDF p. 403 (printed p. 395).

<a id="E5-the-projective-line-and-the-projective-bundle-theorem"></a>

### The projective line, by the projective bundle theorem

`EllipticKTheory:E.5/the-projective-line-and-the-projective-bundle-theorem` · application

For a projective space bundle over a quasi-compact scheme the zeroth K-group is a free module over that of the base, with basis the twisting line bundles, and the corresponding statement holds for the higher K-groups of a regular noetherian base. For the projective line over a field this gives that each K-group is two copies of that of the field, with basis the structure sheaf and the twisting sheaf of degree minus one. This is the first worked example of the layer and the pattern the elliptic computation of the next node follows.

Hypotheses and conventions:

- The bundle is the projectivisation of a vector bundle; the degree-zero statement holds over a quasi-compact base, and the higher statement over a quasi-projective base (K-book V.1.5), in particular for a regular noetherian base (V.6.13.2).
- The basis is the set of twisting line bundles in the stated range, and the module structure is by pullback and tensor product.
- For the projective line the rank is two, which is the length of the basis.

Construction or proof:

1. State the theorem in degree zero and record the basis.
2. State the higher-degree form for a regular noetherian base, which the source obtains from the localisation sequence and homotopy invariance.
3. Specialise to the projective line over a field and read off the answer in each degree.
4. Compare the projective-bundle basis with the rank-Pic basis of K_0 of the projective line (KTheoryLowDegrees Z.6, which owns that explicit change of basis under RS-18).
5. Record the two classes explicitly and the relation the basis satisfies, so that a computation can be checked.
6. Record the contrast with an elliptic curve: K_0(E) ≅ Z^2 ⊕ E(F) is generated by [O_E] and [O_E(−O)] over K_0(F) iff E(F) = 0, and even then the higher groups differ from K_*(F)^2.

Acceptance checks:

- Each K-group of the projective line over a field is two copies of that of the field.
- The basis is the structure sheaf and the twisting sheaf of degree minus one.
- K_0(E) is generated by [O_E] and [O_E(−O)] over K_0(F) iff E(F) = 0 (37a1 over F_2 has E(F_2) ≅ Z/5); even when E(F) = 0 the higher groups differ (y^2 + y = x^3 + x + 1 over F_2 has #K_2 = 5, while K_2(P^1 over F_2) = 0).
- SK_1 of the projective line is ∞_*F^×.

Prerequisites: `SchemeKTheoryOperations:S.5`; `KTheoryLowDegrees:Z.6`; [`EllipticKTheory:E.5/pullback-and-pushforward`](#E5-pullback-and-pushforward).

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), II.8.5, PDF p. 157 (printed p. 149); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.1.5, PDF p. 377 (printed p. 369); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.13.2, PDF p. 425 (printed p. 417).

<a id="E5-elliptic-operation-comparisons"></a>

### Scheme operations on an elliptic isogeny

`EllipticKTheory:E.5/elliptic-operation-comparisons` · comparison

For elliptic curves E′ and E over a field and a nonzero isogeny f:E′→E, use the scheme morphism supplied by E.1. It is finite flat of rank deg(f), hence proper and perfect. Its K-pullback is induced by Lf* and its K-pushforward by Rf*. On affine restrictions Spec B→Spec A, finite locally free B/A identifies Rf* with restriction of scalars on perfect complexes and agrees with the classical finite-flat transfer in every nonnegative degree. These maps agree with the existing function-field isogeny under the E.1 comparisons; a zero group homomorphism is not a finite isogeny.

Hypotheses and conventions:

- A field k; nonsingular pointed genus-one curves and a nonzero k-isogeny.
- The actual scheme K-theory and affine comparison exported by S.2, not a new K-functor.

Construction or proof:

1. Import E.1/isogenies-as-scheme-morphisms and regularity. A finite dominant morphism between regular curves is flat; its function-field degree is its locally free rank.
2. Apply S.2 pullback, proper perfect pushforward and affine-pushforward-is-transfer to f and to each finite affine restriction. The exact restriction-of-scalars functor is the comparison, including on higher groups.
3. Specialise the S.2 functor and base-change coherences; do not reconstruct the generic operations.

Acceptance checks:

- The identity isogeny gives identity maps in all degrees.
- The affine restriction of a separable or inseparable isogeny gives the same transfer as restriction of scalars.
- Exclude the constant-at-origin map from the finite-flat assertion.

Prerequisites: [`EllipticKTheory:E.1/isogenies-as-scheme-morphisms`](#E1-isogenies-as-scheme-morphisms); [`EllipticKTheory:E.1/regular-in-the-divisor-api-form`](#E1-regular-in-the-divisor-api-form); `SchemeKTheoryOperations:S.2/k-theory-pullback`; `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`; `SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer`; `tauceti:TauCeti.Isogeny.degree`.

Sources: [Kbook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.3.3.2 and V.3.11, chapter pp.21,29.

<a id="E5-isogeny-rank-determinant-action"></a>

### The determinant obstruction to degree multiplication

`EllipticKTheory:E.5/isogeny-rank-determinant-action` · theorem

For the preceding f of degree d and all n≥0, f_*f*(y)=[f_*O_E′]·y. Write L_f=det(f_*O_E′)∈Pic⁰(E) and P_f∈E(k) for its point coordinate. In K₀(E)≅Z⊕Z⊕E(k), [f_*O_E′]=(d,0,P_f), so f_*f*(r,e,P)=(dr,de,dP+rP_f). Equality f_*f*=d on K₀ is equivalent to L_f≅O_E; this condition then implies degree multiplication on every K_n. For separable f, L_f²≅O_E and the equality holds after tensoring with Q. For multiplication [m], m odd and char(k)∤m, L_[m]≅O_E and [m]_*[m]*=m² integrally. A separable degree-two isogeny in characteristic different from two has nontrivial L_f and fails the integral K₀ equality.

Hypotheses and conventions:

- Nonzero isogeny of elliptic curves over k; rational origins fixed.
- The separable, odd-m and degree-two clauses have exactly the extra hypotheses stated.

Construction or proof:

1. Import S.2/projection-formula and the determinant calculation of E.5/class-of-the-pushed-forward-structure-sheaf. Euler characteristic is zero for the structure sheaf of both genus-one curves; finite pushforward and Riemann–Roch give deg(L_f)=0.
2. Use the square-zero rank–Pic ring product of E.2/ring-structure-of-K0-of-a-curve to compute multiplication by (d,0,P_f). Testing y=[O_E]=(1,0,O) proves the necessity of P_f=O, while trivial determinant proves sufficiency in all degrees.
3. The trace pairing of E.5/class-of-the-pushed-forward-structure-sheaf proves det² trivial for a finite étale isogeny. For odd [m], pullback trivialises [m]_*O and [m]* acts by m on Pic⁰, so m-torsion and 2-torsion force triviality; the needed Pic⁰ pullback statement is an explicit upstream request.
4. For separable degree two, half-trace splits f_*O=O⊕L. Connectedness gives H⁰(L)=0, so L is not O. This rules out replacing rank by a K₀ equality.

Acceptance checks:

- Evaluate on [O_E]: the point component is P_f, which detects a nontrivial determinant.
- For [3] in characteristic different from three, the action is multiplication by nine.
- For a separable degree-two quotient in characteristic different from two, (1,0,O) maps to (2,0,P_f) with P_f≠O.

Prerequisites: [`EllipticKTheory:E.5/elliptic-operation-comparisons`](#E5-elliptic-operation-comparisons); `SchemeKTheoryOperations:S.2/projection-formula`; [`EllipticKTheory:E.5/class-of-the-pushed-forward-structure-sheaf`](#E5-class-of-the-pushed-forward-structure-sheaf); [`EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve`](#E2-ring-structure-of-K0-of-a-curve); [`EllipticKTheory:E.2/K0-of-an-elliptic-curve`](#E2-K0-of-an-elliptic-curve); `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`.

Sources: [Kbook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.3.12, chapter pp.29–30; [E.5 determinant and projection formulas](#E5-class-of-the-pushed-forward-structure-sheaf), E.5/class-of-the-pushed-forward-structure-sheaf and E.5/projection-formula-and-isogenies.

Atlas planet: **Isogeny projection formula**.

<a id="E5-harder-elliptic-input-closure"></a>

### Harder finiteness for a finite-field elliptic curve

`EllipticKTheory:E.5/harder-elliptic-input-closure` · theorem

If E is an elliptic curve over k=F_q of characteristic p, then K_n(E) is finite of order coprime to p for every n≥1. This is the elliptic specialisation of Harder, with explicit imports of global function-field finite generation, higher Milnor vanishing, finite prime-to-p tame kernel, and the Geisser–Levine Milnor-to-Quillen comparison. None is replaced by a number-field theorem or by Bloch–Gabber–Kato alone.

Hypotheses and conventions:

- E smooth projective geometrically integral of genus one with origin over a finite field.
- n≥1.

Construction or proof:

1. For n=1 use localization, vanishing SK₁ for the affine complement of the rational origin, and the exact normed tame reciprocity sequence, not merely vanishing of the normed composite. This gives the finite prime-to-p group k×⊕k×.
2. For n=2 E.3/integral-injectivity identifies K₂(E) with the tame kernel. Import its finiteness and absence of p-primary torsion from the function-field extension requested of T.5. The source’s citation III.7.2(a) does not prove this case.
3. For n≥3, Bass–Tate gives K_n^M(k(E))=0. Geisser–Levine supplies uniquely p-divisible kernel and cokernel of the natural comparison, so multiplication by p is bijective on K_n(k(E)) and K_{n+1}(k(E)).
4. Use the five-term localization segment K_{n+1}(k(E))→⊕_x K_n(k(x))→K_n(E)→K_n(k(E))→⊕_x K_{n−1}(k(x)). Multiplication by p is bijective on the four exterior terms by the field comparison and finite-field calculation. The five lemma gives bijectivity on K_n(E). Retain the first term; an unqualified four-term argument does not establish injectivity.
5. Import finite generation for an affine complement E minus {O} from Quillen/GQ82, then use localization with the single finite residue field to get finite generation for E. A finitely generated abelian group on which multiplication by p is bijective has rank zero and no p-primary subgroup.

Acceptance checks:

- The low-degree proof explicitly covers n=1 and n=2 instead of applying higher Milnor vanishing there.
- Every closed residue field is finite, including non-rational points.
- The conclusion is stronger than finite generation and is restricted to curves; it does not assume the general Parshin conjecture.

Prerequisites: [`EllipticKTheory:E.1/geometrically-integral-curve`](#E1-geometrically-integral-curve); [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); [`EllipticKTheory:E.3/integral-injectivity-over-a-finite-field`](#E3-integral-injectivity-over-a-finite-field); `ArithmeticKTheory:N.3:finite-generation`; `K2SymbolsBrauer:T.2:graded-map`; `K2SymbolsBrauer:T.5`; `K2SymbolsBrauer:T.4`; `MotivicEtaleKTheory:M.5d`; `KTheoryFiniteLocalFields:L.1/quillen-k-groups`; [`EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve`](#E4-the-coniveau-spectral-sequence-of-a-curve); [`EllipticKTheory:E.4/K1-and-SK1-of-a-curve`](#E4-K1-and-SK1-of-a-curve); [`EllipticKTheory:E.4/rational-base-point-splitting`](#E4-rational-base-point-splitting).

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6 opening and Theorem VI.6.1, chapter p.37; IV.6.9; VI.4.7.

Atlas planet: **Harder finiteness**.

<a id="E5-harder-finiteness"></a>

### Harder finiteness, separated from the Frobenius computation

`EllipticKTheory:E.5/harder-finiteness` · theorem

For an elliptic curve E/F_q, p=char(F_q), K_n(E) is finite of order prime to p for every n≥1.

Hypotheses and conventions:

- E is smooth, projective and geometrically connected over F_q with its rational origin; F_q is its full constant field.

Construction or proof:

1. For n=1 use the exact normed reciprocity sequence and the origin splitting; for n=2 use the finite prime-to-p global-function-field tame kernel. These are the two distinct low-degree contracts of E.5/harder-elliptic-input-closure.
2. For n≥3 use the Bass–Tate higher Milnor vanishing contract of E.5/harder-elliptic-input-closure, requested as a global-function-field extension from K2SymbolsBrauer T.5: K_n^M(F_q(E))=0.
3. Apply Geisser–Levine VI.4.7(c) to conclude that K_n(F_q(E)) is uniquely p-divisible. Merely knowing mod-p vanishing does not replace this comparison statement.
4. Use the five-term closed-point localization segment K_{n+1}(F_q(E)) → ⊕K_n(k(x)) → K_n(E) → K_n(F_q(E)) → ⊕K_{n−1}(k(x)). Multiplication by p is an automorphism on the two field terms by Geisser–Levine and on both residue sums by finite-field K-theory. The five-lemma diagram chase gives unique p-divisibility of K_n(E).
5. Use the affine-complement finite-generation and localization argument of E.5/harder-elliptic-input-closure, requested from ArithmeticKTheory N.3:finite-generation. A finitely generated abelian group with bijective multiplication by p is finite of order prime to p.

Unit tests:

- `harder_finiteness_1` (characterisation): The affine example F_q[t,t⁻¹] has an infinite K₁, so properness cannot be removed.
- `harder_finiteness_2` (characterisation): Finite generation alone does not exclude p-torsion; Geisser–Levine and localization supply that step.

Acceptance checks:

- The affine example F_q[t,t⁻¹] has an infinite K₁, so properness cannot be removed.
- Finite generation alone does not exclude p-torsion; Geisser–Levine and localization supply that step.

Prerequisites: [`EllipticKTheory:E.5/harder-elliptic-input-closure`](#E5-harder-elliptic-input-closure).

Sources: [Kbook.VI.chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.1 and proof, PDF p.37; VI.4.7, PDF p.20.

<a id="E5-geometric-elliptic-k-modules"></a>

### Geometric elliptic K-groups as Galois modules

`EllipticKTheory:E.5/geometric-elliptic-k-modules` · theorem

Put Ebar=E×_k kbar and G=Gal(kbar/k). For i≥1, K_{2i−1}(Ebar)≅D(i)⊕D(i) and K_{2i}(Ebar)≅E(kbar)\[prime-to-p torsion\](i), equivariantly for G, where D=⊕_{ℓ≠p}Q_ℓ/Z_ℓ and D(i) has arithmetic Frobenius q^i. The point torsion already has arithmetic Frobenius π, so its additional twist has action q^iπ. For ℓ≠p the divisible-coefficient groups are K_{2i}(Ebar;Q_ℓ/Z_ℓ)≅(Q_ℓ/Z_ℓ(i))² and K_{2i−1}(Ebar;Q_ℓ/Z_ℓ)≅E(kbar)\[ℓ∞\](i−1). These finite/divisible-coefficient groups are distinguished from integral K_n and from a completion.

Hypotheses and conventions:

- E/k elliptic over finite k; i≥1; ℓ prime different from p.
- A choice of geometric closure; G-equivariant maps and splittings are part of the assertion.

Construction or proof:

1. Write Ebar as the inverse limit of finite-base extensions and use filtered-colimit compatibility of K-theory. Harder makes every positive geometric K-group torsion with no p-primary part.
2. Use the imported universal-coefficient sequence and the M.6/M.7 coefficient spectral sequence/comparison. For a geometric curve only cohomological degrees zero, one and two survive.
3. Import the curve Kummer/Jacobian identification H¹(Ebar,Q_ℓ/Z_ℓ(j))≅E(kbar)\[ℓ∞\](j−1) and the normalized trace H²(Ebar,Q_ℓ/Z_ℓ(j))≅Q_ℓ/Z_ℓ(j−1). The origin identifies E with its Jacobian.
4. Prove degeneration and split the two even coefficient terms by the field e-invariant/structure-map summand. A two-piece associated graded does not by itself determine the group or its G-action. Apply universal coefficients to shift coefficient degree to integral degree.
5. Translate the source’s μ(i) into Q_ℓ/Z_ℓ(i); μ already denotes the roots-of-unity group as an underlying divisible torsion group. Do not add one extra twist. Correct the missing bar in the sentence preceding the source’s coefficient table.

Acceptance checks:

- K₁(Ebar) is two copies of kbar× with arithmetic Frobenius q.
- K₂(Ebar) is geometric prime-to-p elliptic torsion with the additional first twist.
- The coefficient group in degree 2i−1 uses twist i−1, while integral degree 2i uses twist i.

Prerequisites: [`EllipticKTheory:E.5/harder-elliptic-input-closure`](#E5-harder-elliptic-input-closure); [`EllipticKTheory:E.2/picard-decomposition-and-the-point-group`](#E2-picard-decomposition-and-the-point-group); `KTheoryFiniteLocalFields:L.1/algebraic-closure-k-groups`; `MotivicEtaleKTheory:M.6`; `MotivicEtaleKTheory:M.7`; `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings`; `StableHomotopyKTheory:H.6`.

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.3–6.4, chapter p.38; VI.4.6.1; [Kbook.IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), IV.2.3.1–2.5, chapter pp.19–20; Exercise IV.2.6, p.23.

<a id="E5-elliptic-cohomology-frobenius-descent"></a>

### Twisted cohomology descent for the elliptic curve

`EllipticKTheory:E.5/elliptic-cohomology-frobenius-descent` · theorem

For E/F_q, ℓ≠p and j≥2, the natural maps give H^r_et(E,Q_ℓ/Z_ℓ(j))≅H^r_et(Ebar,Q_ℓ/Z_ℓ(j))^G≅H^{r+1}_et(E,Z_ℓ(j)) for r≥0, and these groups vanish for r≥3. The geometric H⁰,H¹,H² groups are Q_ℓ/Z_ℓ(j), E(kbar)\[ℓ∞\](j−1), and Q_ℓ/Z_ℓ(j−1). Arithmetic Frobenius on the corresponding rational spaces has eigenvalues q^j, q^(j−1)α and q^(j−1)β, and q^(j−1), where αβ=q and |α|=|β|=sqrt(q). Thus F−1 is invertible rationally and surjective on each divisible torsion group. Do not assert absolute rational cohomology equals geometric invariants for twists zero or one.

Hypotheses and conventions:

- E/F_q elliptic; ℓ prime, ℓ≠p; j≥2.
- Use continuous ℓ-adic cohomology and the arithmetic Frobenius action on the actual Galois representations.

Construction or proof:

1. Import geometric curve cohomology with normalized trace/Kummer and the H¹/Tate duality of Weights R34.2; the elliptic characteristic polynomial and Hasse bound determine α,β. Arithmetic cohomology eigenvalues are inverse to geometric ones: H¹ untwisted has eigenvalues 1/α,1/β, equivalently α/q,β/q as a multiset. After twist j these are q^(j−1)α,q^(j−1)β.
2. For j≥2 none of the rational eigenvalues is one. F−1 is invertible on the rational spaces, so it is surjective on their divisible quotients.
3. Use the procyclic continuous Galois cohomology sequence 0→M^G→M→M→H¹(G,M)→0 and cd_ℓ(G)=1 in Hochschild–Serre. The H¹ terms vanish for these divisible geometric groups, giving the stated invariants.
4. The rational absolute cohomology vanishes in this range; the derived coefficient triangle Z_ℓ(j)→Q_ℓ(j)→Q_ℓ/Z_ℓ(j) gives the degree shift. Preserve the restriction j≥2 from VI.6.6. Parent sourceIssue E5 corrects the preceding false argument about rational Galois cohomology.

Acceptance checks:

- At j=0, H¹(Spec F_q,Q_ℓ)=Q_ℓ; this rejects an unrestricted invariants identity.
- H¹(Ebar,Q_ℓ/Z_ℓ(j)) carries elliptic torsion twist j−1.
- For j=2 all three rational Frobenius-minus-one operators are invertible.

Prerequisites: `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings`; `ArithmeticGaloisRepresentations:R01.1`; `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.5–6.6, chapter p.39, with the coefficient range j≥2 stated above.

<a id="E5-finite-elliptic-k-descent"></a>

### Descent of positive elliptic K-groups

`EllipticKTheory:E.5/finite-elliptic-k-descent` · theorem

For every n>0 the base-change map K_n(E)→K_n(Ebar)^G is an isomorphism. This is an elliptic calculation proved through the finite/divisible-coefficient comparison and Harder finiteness, not a claim of unrestricted integral Galois descent for scheme K-theory.

Hypotheses and conventions:

- E elliptic over a finite field; n>0.
- All coefficient comparisons and filtrations carry their Galois/base-change compatibility.

Construction or proof:

1. By Harder, compute K_n(E) one prime ℓ≠p at a time as K_{n+1}(E;Q_ℓ/Z_ℓ) via universal coefficients.
2. The curve motivic/coefficient spectral sequence, together with the previous cohomology descent node in weights j≥2, identifies the geometric base-change map with invariants and has no surviving differentials. Retain the e-invariant splitting for the two odd integral summands.
3. Handle n=1 separately with the exact tame reciprocity/SK₁ sequence and the origin section. This covers the weight-one boundary without applying VI.6.6 outside its range.
4. Assemble the primary parts using finite support. The resulting map is precisely the base-change map of the imported K-theory, not an arbitrary additive equivalence.

Acceptance checks:

- The n=1 map identifies both copies of k× inside the two geometric root-of-unity copies.
- There is no assertion that K₀(E) is finite.
- Base change to F_{q^r} replaces the generator σ by σ^r.

Prerequisites: [`EllipticKTheory:E.5/harder-elliptic-input-closure`](#E5-harder-elliptic-input-closure); [`EllipticKTheory:E.5/geometric-elliptic-k-modules`](#E5-geometric-elliptic-k-modules); [`EllipticKTheory:E.5/elliptic-cohomology-frobenius-descent`](#E5-elliptic-cohomology-frobenius-descent); `MotivicEtaleKTheory:M.6`; `MotivicEtaleKTheory:M.7`; [`EllipticKTheory:E.4/K1-and-SK1-of-a-curve`](#E4-K1-and-SK1-of-a-curve); [`EllipticKTheory:E.4/rational-base-point-splitting`](#E4-rational-base-point-splitting); `StableHomotopyKTheory:H.6`.

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.7 and proof, chapter pp.39–40; [Kbook.IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), IV.2.3.1–2.5, chapter pp.19–20; Exercise IV.2.6, p.23.

<a id="E5-twisted-frobenius-kernel"></a>

### The twisted Frobenius kernel on elliptic torsion

`EllipticKTheory:E.5/twisted-frobenius-kernel` · construction

For a finite field k of characteristic p and size q, a Weierstrass elliptic curve E/k and any field extension L/k, define B_i(E,L)⊆E(L), i≥0, as the points P killed by a positive integer prime to p and satisfying q^iπ(P)=P. Here π on points is the existing base-change point map of x↦x^q, agreeing with the upstream Frobenius isogeny; it is not named geometric Frobenius. For L=kbar this is the G-fixed subgroup of the additional i-th twist of prime-to-p elliptic torsion. No Tate module, K-functor, scheme model or general torsion theory is defined a second time.

Hypotheses and conventions:

- Finite field k, char(k)=p; elliptic Weierstrass equation; field extension L/k; i≥0.

Construction or proof:

1. Use Mathlib’s Point, its existing additive group and Point.map(FiniteField.frobeniusAlgHom k L). Form the additive subgroup directly from the displayed two conditions.
2. Closure under addition uses a product of coprime annihilators; closure under negation uses the same annihilator. The Frobenius equality is preserved because π is additive.
3. Derive the membership, rational-point and field-map API without unfolding any new point or group construction. For exclusion of p-torsion use Bézout on p and the prime-to-p annihilator.
4. For kbar use the upstream Tate-twist convention and the arithmetic Galois generator; only invariants are formed in this stage.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `EllipticK.twistedFrobeniusKernel` | constructor | The additive subgroup of points over any field extension L/k P killed by some positive m coprime to p and satisfying q^iπ(P)=P; inheritance of AddCommGroup is through AddSubgroup, not a second group law. |
| `EllipticK.mem_twistedFrobeniusKernel` | characterisation | Membership is exactly (∃m>0, gcd(m,p)=1 and mP=O) and q^iπ(P)=P. |
| `EllipticK.zero_mem_twistedFrobeniusKernel` | simp | The origin lies in the subgroup, witnessed by m=1. |
| `EllipticK.baseChange_mem_twistedFrobeniusKernel` | compatibility | For a k-rational P killed by a positive integer coprime to p, its image in E(L) lies in B_i iff q^iP=P, equivalently (q^i−1)P=O. |
| `EllipticK.map_twistedFrobeniusKernel` | functoriality | A k-algebra homomorphism between field extensions sends B_i(E,L) into B_i(E,M), via the existing point map commuting with q-power. Its field-isomorphism clause EllipticK.equiv_twistedFrobeniusKernel gives an additive equivalence with that point map as its underlying function. Identity and composition follow by restriction of the existing point-map laws. |
| `EllipticK.p_torsion_not_mem_twistedFrobeniusKernel` | characterisation | If pP=O and P lies in B_i, then P=O; coprime annihilators eliminate the entire p-primary component. |

Unit tests:

- `EllipticK.test_twistedKernel_origin` (degenerate): O belongs to B_i for every i≥0, including i=0.
- `EllipticK.test_twistedKernel_rational_two_torsion` (computation): On E/F₃ given by y²=x³−x, the nonzero rational point (0,0), of order two, belongs to B₁ since q−1=2.
- `EllipticK.test_twistedKernel_excludes_characteristic_torsion` (non-example): On E/F₂ given by y²+xy=x³+1, the rational nonzero point (0,1) has order two and is excluded from B₀, although it is fixed by Frobenius.
- `EllipticK.test_twistedKernel_F2_card_five` (computation): For E/F₂: y²+y=x³+x+1, #B₁=5, whereas #B₀=1. Omitting the first twist gives the wrong group.
- `EllipticK.test_twistedKernel_F2_trace_sign` (computation): For E/F₂: y²+y=x³+x, #E(F₂)=5, a=−2 and #B₁=13, in contrast to the previous curve’s a=2 and order five.

Acceptance checks:

- All five named discriminating tests are instantiated on the existing point type in the suggested file.
- The curve is required nonsingular in finite-cardinality theorems; the construction itself also makes sense on the existing nonsingular-point group.
- The i=0 input is available to test the convention but is not identified with positive even K₀.
- The subgroup inherits the existing additive structure and inclusion homomorphism. Extensionality reduces to equality of membership predicates; the universal property for maps into a subgroup is the standard restriction property. The field-isomorphism API includes its underlying-point compatibility, rather than only an unspecified abstract equivalence.

Prerequisites: `mathlib:WeierstrassCurve.Affine.Point`; `mathlib:WeierstrassCurve.Affine.Point.map`; `mathlib:FiniteField.frobeniusAlgHom`; `mathlib:AddSubgroup.torsionBy`; `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.4 and VI.6.7, chapter pp.38–40; VI.1.7 convention.

Atlas planet: **Twisted Frobenius kernel**.

<a id="E5-positive-odd-elliptic-k-groups"></a>

### Odd elliptic K-groups over a finite field

`EllipticKTheory:E.5/positive-odd-elliptic-k-groups` · theorem

For i≥1, K_{2i−1}(E)≅K_{2i−1}(F_q)⊕K_{2i−1}(F_q)≅(Z/(q^i−1))² as abelian groups. In degree one use the unit group itself: K₁(E)≅F_q×⊕F_q×, equivalently two copies of Additive(F_q×). Generators for cyclic coordinates are noncanonical. One summand is split by the structure morphism and origin; the other is identified through the normalized geometric coefficient/trace and e-invariant calculation.

Hypotheses and conventions:

- E/F_q elliptic; i≥1.
- Finite-field group identifications are additive; no chosen primitive root or ring decomposition is asserted.

Construction or proof:

1. Apply positive K-descent and the equivariant geometric odd decomposition. Arithmetic Frobenius is q^i on each D(i).
2. The fixed subgroup of Q_ℓ/Z_ℓ(i) is the kernel of q^i−1 and is cyclic of order ℓ^vℓ(q^i−1). Assemble finitely many primes and import Quillen’s finite-field result.
3. For i=1 retain the multiplicative units notation or its Additive wrapper and the rational-origin splitting; for higher i do not invent canonical cyclic generators.

Acceptance checks:

- For q=2, K₁(E)=0 and K₃(E)≅(Z/3)² for every elliptic E/F₂.
- For q=3, K₁(E)≅(Z/2)², independent of #E(F₃).
- The group is an additive direct sum of two copies, not E(F_q) or a statement about K₀.

Prerequisites: [`EllipticKTheory:E.5/finite-elliptic-k-descent`](#E5-finite-elliptic-k-descent); [`EllipticKTheory:E.5/geometric-elliptic-k-modules`](#E5-geometric-elliptic-k-modules); `KTheoryFiniteLocalFields:L.1/quillen-k-groups`.

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.7, chapter pp.39–40; VI.6 opening for K₁.

Atlas planet: **Finite-field elliptic K-groups**.

<a id="E5-positive-even-elliptic-k-groups"></a>

### Even elliptic K-groups and the Tate-lattice cokernel

`EllipticKTheory:E.5/positive-even-elliptic-k-groups` · theorem

For i≥1, K_{2i}(E)≅B_i(E,kbar)≅⊕_{ℓ≠p}ker(1−q^iπ:E(kbar)[ℓ∞]→E(kbar)[ℓ∞]). Each primary term is canonically identified, through T_ℓE⊂V_ℓE and V_ℓE/T_ℓE≅E(kbar)[ℓ∞], with coker(1−q^iπ:T_ℓE→T_ℓE). The operator is invertible on V_ℓE. Only finitely many primes contribute; use a direct sum, not an infinite product. This is a finite prime-to-p group, generally nonzero; the full group depends on the integral Frobenius operator, not only on its characteristic polynomial.

Hypotheses and conventions:

- E/F_q elliptic; i≥1; prime ℓ≠p for each lattice.
- T_ℓE and its continuous Frobenius action are imported from EllipticCurves Layer 2.

Construction or proof:

1. Apply K-descent to the even geometric term and identify the extra i-th twist with the equation q^iπP=P defining B_i.
2. Use the primary decomposition of prime-to-p elliptic torsion and the upstream rank-two Tate module. The roots of 1−q^iπ are nonzero because |q^iα|=q^(i+1/2)>1, and similarly for β.
3. Apply the snake lemma to T_ℓE→V_ℓE→V_ℓE/T_ℓE with vertical map 1−q^iπ. Its middle map is bijective, giving a canonical cokernel-to-kernel isomorphism. An invariant lattice kernel is zero here and would not give the desired group.
4. The characteristic polynomial gives determinant D_i=1−a_qq^i+q^(2i+1), a nonzero integer congruent to one modulo p. The primary cokernel is zero away from the finitely many primes dividing D_i; its detailed invariant factors require the integral lattice action.

Acceptance checks:

- For i=1 the operator is 1−qπ, not 1−π and not 1−q²π.
- A rational point need not belong: even groups are not the rational point group.
- Record the natural isomorphism to the Tate cokernel before choosing any basis or invariant factors.

Prerequisites: [`EllipticKTheory:E.5/finite-elliptic-k-descent`](#E5-finite-elliptic-k-descent); [`EllipticKTheory:E.5/geometric-elliptic-k-modules`](#E5-geometric-elliptic-k-modules); [`EllipticKTheory:E.5/twisted-frobenius-kernel`](#E5-twisted-frobenius-kernel); `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.4–6.7, chapter pp.38–40; cokernel form derived by the lattice exact sequence.

<a id="E5-projective-line-finite-field-comparison"></a>

### The projective-line basis and the finite elliptic contrast

`EllipticKTheory:E.5/projective-line-finite-field-comparison` · application

For P¹_k with π:P¹_k→Spec k and infinity section σ, the imported projective-bundle isomorphism sends (a,b) to π*a+[O(-1)]·π*b in every K_n. Its inverse is (π_*x,σ*x−π_*x). In K₀ its coordinates are (χ(x),rk(x)−χ(x)); [O(m)]=(m+1,-m) and [O_∞]=(1,-1). Over k=F_q, positive even K_n(P¹)=0 and K_{2i−1}(P¹)≅(Z/(q^i−1))². The same odd abstract groups occur for an elliptic curve, but its even groups are the twisted elliptic torsion computed below; do not transfer the P¹ even vanishing to E.

Hypotheses and conventions:

- A field k; the O,O(-1) convention supplied by S.5.
- i≥1 for the positive finite-field degrees.

Construction or proof:

1. Import S.5/projective-line-k-theory, including its explicit inverse and O(m) formulas, and the E.5 projective-line application.
2. Apply KTheoryFiniteLocalFields L.1/quillen-k-groups degree by degree. No second projective-bundle theorem or low-degree K-construction is made here.
3. Use the finite elliptic formulas below for the comparison; the example over F₂ has elliptic K₂ of order five while P¹ has K₂=0.

Acceptance checks:

- [O]=(1,0), [O(-1)]=(0,1), and [O_∞]=(1,-1) in the imported basis.
- For F₂, K₁(P¹)=0 and K₃(P¹)≅(Z/3)².
- For F₂, K₂(P¹)=0, unlike the elliptic example.

Prerequisites: `SchemeKTheoryOperations:S.5/projective-line-k-theory`; [`EllipticKTheory:E.5/the-projective-line-and-the-projective-bundle-theorem`](#E5-the-projective-line-and-the-projective-bundle-theorem); `KTheoryFiniteLocalFields:L.1/quillen-k-groups`; [`EllipticKTheory:E.5/positive-odd-elliptic-k-groups`](#E5-positive-odd-elliptic-k-groups); [`EllipticKTheory:E.5/positive-even-elliptic-k-groups`](#E5-positive-even-elliptic-k-groups).

Sources: [Kbook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.1.5 and V.1.5.1, chapter p.4 (proof continues on p.5).

<a id="E5-elliptic-k-group-orders"></a>

### Orders of finite-field elliptic K-groups

`EllipticKTheory:E.5/elliptic-k-group-orders` · theorem

Let a_q=q+1−#E(F_q). For i≥1, #K_{2i−1}(E)=(q^i−1)² and #K_{2i}(E)=D_i=1−a_qq^i+q^(2i+1). D_i is positive and coprime to p. Equivalently D_i=deg(1−[q^i]π). The map 1−[q^i]π is separable, and its geometric point kernel equals B_i. A cardinality does not specify the invariant factors of the even K-group.

Hypotheses and conventions:

- E/F_q elliptic; i≥1.
- Frobenius and degree refer to the existing elliptic isogeny theory with its point/scheme comparison.

Construction or proof:

1. The odd order is immediate from the odd group theorem. For even degrees, import the upstream quadratic degree form and π²−[a_q]π+[q]=0 to compute deg(1−[q^i]π)=D_i.
2. The Hasse bound gives D_i=(1−q^iα)(1−q^iβ)>0. As q is divisible by p, D_i≡1 mod p; the differential of 1−[q^i]π is the identity, so the map is separable.
3. The geometric kernel of this isogeny has D_i points by the upstream separable-degree/kernel theorem. Its order is prime to p, so it is exactly B_i; combine with the even K-group equivalence. This also proves the determinant/index order without a second general theory of lattice indices.
4. Compute finite examples from the Weierstrass equations and point counts. For y²+y=x³+x+1 over F₂, #E=1 and a=2: K₁=0, #K₂=5, K₃≅(Z/3)², #K₄=25. For y²+y=x³+x over F₂, #E=5 and a=−2: #K₂=13. For y²=x³−x over F₃, #E=4 and a=0: #K₂=28.

Acceptance checks:

- The two F₂ examples distinguish the sign of a_q and reject an untwisted rational-points formula.
- D_i≡1 mod p independently checks the characteristic-primary exclusion.
- Do not infer K₄≅Z/25 from its order 25.

Prerequisites: [`EllipticKTheory:E.5/positive-odd-elliptic-k-groups`](#E5-positive-odd-elliptic-k-groups); [`EllipticKTheory:E.5/positive-even-elliptic-k-groups`](#E5-positive-even-elliptic-k-groups); [`EllipticKTheory:E.5/twisted-frobenius-kernel`](#E5-twisted-frobenius-kernel); [`EllipticKTheory:E.1/isogenies-as-scheme-morphisms`](#E1-isogenies-as-scheme-morphisms); `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`; `tauceti:TauCeti.Isogeny.frobeniusIsogeny`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`; `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

Sources: [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.7, chapter pp.39–40, with the elliptic Frobenius degree calculation imported from upstream.

<a id="E5-an-elliptic-curve-over-a-finite-field"></a>

### The K-theory of an elliptic curve over a finite field

`EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field` · theorem

For an elliptic curve E/F_q with its rational origin, every positive K-group is finite of order prime to p. For odd n>0, K_n(E)≅K_n(F_q)⊕K_n(F_q); for n=2i>0 it is ⊕_{ℓ≠p} E(F̄_q)\[ℓ∞\](i)^Gal(F̄_q/F_q), with the Tate twist and Frobenius convention of K-book VI.6.7. In particular K₁(E)≅(F_q×)². Harder finiteness and the geometric/étale Frobenius computation are separate inputs; none follows from the base finite-field calculation alone.

Hypotheses and conventions:

- E is an elliptic curve over F_q, hence smooth projective geometrically connected with full constant field F_q and Jacobian E. No disconnected-curve version is asserted.
- The Galois module structure is the one the source computes over the algebraic closure, with the Tate twists.
- The finiteness and the primality to the characteristic are Harder's theorem and are a separate input.

Construction or proof:

1. Import E.5/harder-finiteness, with its distinct function-field finite-generation, Bass–Tate and Geisser–Levine inputs.
2. Apply the geometric computation VI.6.4 using the motivic/étale comparison and the curve’s étale cohomology, Jacobian Tate module and twists; this requires the requested M.6/M.7 and Tau Ceti elliptic interfaces.
3. Apply the Galois-descent sequence VI.6.6 and Weil’s Frobenius eigenvalue bounds, then VI.6.7, retaining twists before taking invariants.
4. Read off degree one and record that the answer is two copies of the unit group of the base field.
5. Record the reciprocity sequence the source derives for the function field, which links this computation with E.3's sequence.
6. State the non-example: the computation uses finite generation, the geometric computation and the Frobenius action, and does not follow from the K-theory of a finite field.

Acceptance checks:

- Every positive K-group is finite of order prime to the characteristic.
- In degree one the group is two copies of the unit group of the base field.
- In even degree the group is a twisted Galois-invariant part of the torsion of the Jacobian.
- The computation is not a consequence of the finite-field calculation alone.
- For E : y^2 + y = x^3 − x over F_2 (a_2 = −2): K_0(E) ≅ Z^2 ⊕ Z/5, K_1(E) = 0, K_2(E) has order 13, K_3(E) ≅ (Z/3)^2 and #K_4(E) = 41.
- SK_1(E) ≅ F_q^× for every elliptic curve E over F_q (the second summand of K_1).

Prerequisites: [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); [`EllipticKTheory:E.2/K0-of-an-elliptic-curve`](#E2-K0-of-an-elliptic-curve); `KTheoryFiniteLocalFields:L.1`; `MotivicEtaleKTheory:M.6`; [`EllipticKTheory:E.5/harder-finiteness`](#E5-harder-finiteness); `MotivicEtaleKTheory:M.7`; [`EllipticKTheory:E.5/geometric-elliptic-k-modules`](#E5-geometric-elliptic-k-modules); [`EllipticKTheory:E.5/finite-elliptic-k-descent`](#E5-finite-elliptic-k-descent); [`EllipticKTheory:E.5/positive-odd-elliptic-k-groups`](#E5-positive-odd-elliptic-k-groups); [`EllipticKTheory:E.5/positive-even-elliptic-k-groups`](#E5-positive-even-elliptic-k-groups); [`EllipticKTheory:E.5/elliptic-k-group-orders`](#E5-elliptic-k-group-orders).

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6.1, PDF p. 510 (printed p. 502); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6.7, PDF p. 513 (printed p. 505); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6.8, PDF p. 513 (printed p. 505).

Atlas planet: **The K-theory of a curve over a finite field**.

<a id="layer-e6"></a>

## E.6: arithmetic models and integral K₂

A proper flat regular arithmetic surface with marked generic curve is the
common carrier for the geometric and K-theoretic developments. The canonical
minimal model is obtained by finitely many vertical contractions, measured by
the number of fibre components at a fixed finite set of primes. Local terminal
mapping properties and the global contraction universal property descend a
common-resolution map. This proves marked arithmetic terminality, the local
minimality criterion and unique marked isomorphism.

Restriction to O_{F,S′} for S⊆S′ is a principal open restriction. Besides the
localization carrier it uses N.1/S-integers-localisation-of-torsion-class-group:
choose principal powers of the finitely many new prime ideals in O_F and invert
their product a. Then O_{F,S′}=O_{F,S}[1/a]. A localization description alone
does not establish this open immersion. Minimality and its comparison
isomorphisms are coherent under these restrictions.

The integral image can already be computed on any regular proper model. Its
independence uses proper G-theory pushforward, regular K/G comparison and flat
generic-fibre base change; a K-theory blowup formula and minimal-model uniqueness
are unnecessary for that argument. At good reduction primes finite-field K₁ is
finite, so their conditions vanish rationally. The remaining membership test
uses vertical residues with the codimension-two torsion obstruction retained.


<a id="E6-the-regular-proper-model"></a>

### Regular proper models over the S-integers

`EllipticKTheory:E.6/the-regular-proper-model` · definition

Let O = O_{F,S}. A regular proper model of E over O is a scheme 𝓔 with a proper flat morphism 𝓔 → Spec O, all of whose local rings are regular, together with an isomorphism of the generic fibre with the scheme of E.1. Its fibre 𝓔_v over a closed point v is a proper curve over k(v) with components C_i and multiplicities m_i, div(π_v) = Σ m_i C_i. Not every natural model is one: a Weierstrass model is regular at v iff its equation is minimal at v and the minimal regular model has irreducible fibre at v (Kodaira types I_0, I_1, II); the Néron model is proper iff E has good reduction at every prime of O.

Hypotheses and conventions:

- Regularity is required at every point, including the closed points of the fibres; the fibres themselves may be singular, reducible and non-reduced.
- The Néron model and the Weierstrass model are compared, not excluded by fiat.

Construction or proof:

1. Define the structure; import components, multiplicities and div(π) = Σ m_i C_i from upstream Stable reduction layer 5 over each localisation O_(v).
2. Record the Weierstrass criterion (Conrad Cor. 4.7 with the contraction description in its proof) and the Néron criterion (Conrad Ex. 5.3, Thm 5.4).

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `RegularProperModel` | structure | Data: 𝓔, a proper flat 𝓔 → Spec O with regular local rings, and an isomorphism of the generic fibre with E. |
| `RegularProperModel.isRegular` | projection | Every local ring of 𝓔 is a regular local ring. |
| `RegularProperModel.fibre` | data | 𝓔_v = 𝓔 ×_O k(v). |
| `RegularProperModel.components` | data | The irreducible components C_i of 𝓔_v, finitely many. |
| `RegularProperModel.multiplicity` | data | m_i = length of O_{𝓔_v} at the generic point of C_i; ord_{C_i}(π_v) = m_i. |
| `RegularProperModel.div_uniformiser` | characterisation | div(π_v) = Σ m_i C_i (Stacks 0C5Z). |
| `weierstrassModel_regular_iff` | relation | The projective Weierstrass model of an equation minimal at v is regular over v iff the minimal regular model has irreducible fibre at v. |
| `neronModel_isProper_iff` | relation | The Néron model over O is proper iff E has good reduction at every prime of O; at a bad prime its fibre is the smooth locus of the minimal regular model's fibre and is not proper. |

Unit tests:

- `weierstrass_37a1_regular` (computation): For y^2 + y = x^3 − x over Z (Δ = 37, Kodaira I_1 at 37), the fibre at 37 is singular only at (5,18) and F(5,18) = 222 ≢ 0 mod 37^2, so the projective Weierstrass model is a regular proper model (and the minimal one).
- `weierstrass_11a1_not_regular` (non-example): For y^2 + y = x^3 − x^2 − 10x − 20 (Kodaira I_5 at 11), F(5,5) = 0, so F ∈ (11, x−5, y−5)^2 and the Weierstrass model is not regular.
- `nonminimal_not_regular` (non-example): y^2 = x^3 − 81x has good reduction at 3 (it is the u = 3 rescaling of y^2 = x^3 − x), but its Weierstrass model is not regular at (3, x, y).
- `neron_good_reduction_proper` (compatibility): Over Z[1/37], the Néron model of 37a1 is its smooth proper Weierstrass model, which is a regular proper model.
- `neron_bad_reduction_not_proper` (non-example): Over Z, the fibre at 37 of the Néron model of 37a1 is the smooth locus of the nodal cubic (a non-split torus, since a_37 = −1), which is not proper.

Acceptance checks:

- 37a1's Weierstrass model over Z is a regular proper model.
- 11a1's Weierstrass model over Z is not regular at 11.

Prerequisites: [`EllipticKTheory:E.1/geometric-properties-of-the-curve`](#E1-geometric-properties-of-the-curve); `ArithmeticKTheory:N.1/S-integers-as-a-localisation`.

Sources: [Conrad.MinimalModels](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf), Definition 3.1, p. 6; [Conrad.MinimalModels](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf), Corollary 4.7 and proof, p. 12; [Conrad.MinimalModels](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf), Example 5.3, p. 13; [Stacks.SemistableReduction](https://stacks.math.columbia.edu/download/models.pdf), Tag 0C5Z (Lemma 9.1), p. 35.

<a id="E6-existence-of-a-regular-proper-model"></a>

### Existence of a regular proper model over the S-integers

`EllipticKTheory:E.6/existence-of-a-regular-proper-model` · theorem

Let F be a number field, S a finite set of finite primes and E/F an elliptic curve. There is a regular proper flat model of E over O_{F,S}; one is obtained by resolving the singularities of the projective Weierstrass model of an integral equation, and the resolution is an isomorphism over the regular locus of that model (in particular over the primes where the equation has unit discriminant). Over each localisation O_(v) a minimal regular model exists and is unique (genus one).

Hypotheses and conventions:

- O_{F,S} is a Dedekind domain with fraction field of characteristic 0, hence quasi-excellent.
- The Weierstrass model W is integral, two-dimensional, proper, flat and of finite type over O_{F,S} (ModularCurves layer 1).

Construction or proof:

1. Scale an equation of E to have coefficients in O_{F,S}; form W.
2. Resolution: W has a resolution of singularities X → W (Stacks 0ADX with 0BGP); X is regular, proper over O_{F,S}, and flat (integral and dominant over a Dedekind base).
3. The resolution is an isomorphism over the normal, in particular regular, locus of W, which contains E and the smooth locus (Stacks 0C2U).
4. Minimal model over O_(v): Stacks 0C2W (existence) and 0C6B (uniqueness in positive genus), or upstream Stable reduction layer 5.

Acceptance checks:

- For 37a1 over Z the resolution is the identity (F18).

Prerequisites: [`EllipticKTheory:E.6/the-regular-proper-model`](#E6-the-regular-proper-model).

Sources: [Stacks.ResolutionOfSurfaces](https://stacks.math.columbia.edu/download/resolve.pdf), Tag 0ADX (introduction), p. 1; [Stacks.SemistableReduction](https://stacks.math.columbia.edu/download/models.pdf), Tags 0C2U (Lemma 8.3) and 0C6B (Lemma 10.1), pp. 34, 39; [Conrad.MinimalModels](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf), Theorem 3.10, p. 8.

<a id="E6-the-integral-part"></a>

### The rational integral part of the second K-group

`EllipticKTheory:E.6/the-integral-part` · definition

Let 𝓔 be a regular proper flat model of E over O_F (E.6/existence-of-a-regular-proper-model) and j: E → 𝓔 the inclusion of the generic fibre. The rational integral part is K_2(E)_{Z,Q} := im(j^*: K_2(𝓔)⊗Q → K_2(E)⊗Q). For a set S of finite primes the S-integral variant is K_2(E)^S_{Z,Q} := im(K_2(𝓔_S)⊗Q → K_2(E)⊗Q), 𝓔_S = 𝓔 ×_{O_F} O_{F,S}. Then K_2(E)_{Z,Q} ⊆ K_2(E)^S_{Z,Q} ⊆ K_2(E)^{S′}_{Z,Q} for S ⊆ S′; the inclusions can be equalities (E.6/good-reduction-primes-impose-no-condition) and can be strict (an unramified class need not be integral: DJZ Theorem 8.3). Neither space is asserted to be finite-dimensional or to contain a lattice of full rank.

Hypotheses and conventions:

- The model is regular, proper and flat over O_F (resp. O_{F,S}); by E.6/model-independence the images do not depend on it.
- The integral part is a Q-subspace of K_2(E)⊗Q; the integral subgroup im(K_2(𝓔) → K_2(E)) is a different object and its finite generation is Bass's conjecture, not a theorem.
- Monotonicity in S is inclusion, not strict growth.

Construction or proof:

1. j^* is pullback along the flat morphism E → 𝓔 (S.2); 𝓔_S ⊂ 𝓔 is open, so im(K_2(𝓔)) ⊆ im(K_2(𝓔_S)) by functoriality of pullback, and likewise for S ⊆ S′.
2. Record the two warnings as tests (unramified_not_integral, no finite-dimensionality claim).

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `integralPart` | data | K_2(E)_{Z,Q} := range(K_2(𝓔)⊗Q → K_2(E)⊗Q), a Q-subspace. |
| `integralPartS` | data | K_2(E)^S_{Z,Q} := range(K_2(𝓔_S)⊗Q → K_2(E)⊗Q). |
| `integralPart_le_integralPartS` | characterisation | K_2(E)_{Z,Q} ≤ K_2(E)^S_{Z,Q}. |
| `integralPartS_mono` | functoriality | S ⊆ S′ ⇒ K_2(E)^S_{Z,Q} ≤ K_2(E)^{S′}_{Z,Q}. |
| `integralPart_le_unramified` | relation | K_2(E)_{Z,Q} ≤ K_2(E)⊗Q, the image of which in K_2(F(E))⊗Q is the unramified subspace (K2SymbolsBrauer T.5/unramified-subgroup); the inclusion can be strict (test unramified_not_integral). |

Unit tests:

- `contained_in_S_variant` (characterisation): K_2(E)_{Z,Q} ⊆ K_2(E)^S_{Z,Q} for every S.
- `good_prime_changes_nothing` (compatibility): For E = 37a1 (good reduction at 2), K_2(E)^{{2}}_{Z,Q} = K_2(E)_{Z,Q}; integrally K_2(𝓔) → K_2(𝓔[1/2]) is onto because K_1(𝓔_2) = (F_2^×)^2 = 0. (Proved after E.6/good-reduction-primes-impose-no-condition; place the example after that lemma in the suggested file.)
- `unramified_not_integral` (non-example): For C: y^2 + (x+12)y + x^3 = 0 over Q (conductor 390, split multiplicative I_6 at 2) and M = {y^2/x^3, 1 − x/4} ∈ K_2^T(C) (trivial tame symbol at every closed point), no non-zero multiple of M is integral (DJZ Theorem 8.3(2) with m(x) = x − 4, p = 2). (Proved through E.6/vertical-residues; place the example after that node.)
- `all_primes_inverted` (degenerate): If S is the set of all finite primes (O_{F,S} = F, Scholl 1.1.1 allows infinite S), the S-integral variant is all of K_2(E)⊗Q.

Acceptance checks:

- K_2(E)_{Z,Q} ⊆ K_2(E)^S_{Z,Q} ⊆ K_2(E)^{S′}_{Z,Q} for S ⊆ S′.
- For E = 37a1 and S = {2}, K_2(E)^S_{Z,Q} = K_2(E)_{Z,Q}.
- For C: y^2 + (x+12)y + x^3 = 0 over Q, the unramified class {y^2/x^3, 1 − x/4} is not in K_2(C)_{Z,Q} (DJZ Thm 8.3(2)).

Prerequisites: [`EllipticKTheory:E.6/the-regular-proper-model`](#E6-the-regular-proper-model); [`EllipticKTheory:E.6/existence-of-a-regular-proper-model`](#E6-existence-of-a-regular-proper-model); [`EllipticKTheory:E.3/what-the-sequence-does-not-identify`](#E3-what-the-sequence-does-not-identify); `SchemeKTheoryOperations:S.2`; `SchemeKTheoryOperations:S.3`.

Sources: [Scholl.IntegralElements](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), 1.1.2 and Theorem 1.1.6(iii), p. 4; [DJZ.2006](https://arxiv.org/abs/math/0405040), §3, p. 5 (arXiv v2); [DJZ.2006](https://arxiv.org/abs/math/0405040), Theorem 8.3, p. 23 (arXiv v2).

Atlas planet: **The integral part**.

<a id="E6-regular-models-linked-by-blowups"></a>

### Two regular proper models are linked by blow-ups in closed points

`EllipticKTheory:E.6/regular-models-linked-by-blowups` · lemma

Let 𝓔_1, 𝓔_2 be regular proper flat models of E over O = O_{F,S}. There are regular proper models X_n and morphisms of models X_n → 𝓔_1, X_n → 𝓔_2, each a composite of blow-ups in closed points.

Hypotheses and conventions:

- The models are integral (flat over a Dedekind domain with integral generic fibre), regular of dimension 2, proper over the Noetherian scheme Spec O, and O-birational (same generic fibre).

Construction or proof:

1. Apply Stacks 0C5S with S = Spec O; each X_i is regular and proper, and flat because integral and dominant over Spec O.

Acceptance checks:

- For two minimal regular models the chain is trivial (uniqueness in genus one, upstream Stable reduction layer 5).

Prerequisites: [`EllipticKTheory:E.6/the-regular-proper-model`](#E6-the-regular-proper-model).

Sources: [Stacks.ResolutionOfSurfaces](https://stacks.math.columbia.edu/download/resolve.pdf), Tag 0C5S (Lemma 17.2), p. 53.

<a id="E6-model-independence"></a>

### Independence of the regular model

`EllipticKTheory:E.6/model-independence` · theorem

For regular proper flat models 𝓔, 𝓔′ of E over O_{F,S}, im(K_n(𝓔) → K_n(E)) = im(K_n(𝓔′) → K_n(E)) for every n; in particular K_2(E)^S_{Z,Q} does not depend on the model. The statement fails for non-regular proper flat models with G-theory in place of K-theory.

Hypotheses and conventions:

- Both models are regular, so K = G on them (S.2 Cartan).
- The comparison uses a third regular model dominating both (E.6/regular-models-linked-by-blowups).

Construction or proof:

1. Reduce to a morphism of models π: 𝓔′ → 𝓔 using the dominating model.
2. ⊆: with j: E → 𝓔 and j′: E → 𝓔′ the generic fibres, π∘j′ = j, so j^* = j′^*∘π^* and im(j^*) ⊆ im(j′^*).
3. ⊇: for a ∈ K_n(𝓔′) = G_n(𝓔′), π_*a ∈ G_n(𝓔) = K_n(𝓔) and j^*π_*a = j′^*a by base change along the flat map j (π is an isomorphism over E).
4. Non-example: record Scholl 1.1.7 (de Jeu's elliptic example) for non-regular models.

Acceptance checks:

- The integral part is independent of the regular model, integrally and rationally.
- No blow-up formula is used.

Prerequisites: [`EllipticKTheory:E.6/the-integral-part`](#E6-the-integral-part); [`EllipticKTheory:E.6/regular-models-linked-by-blowups`](#E6-regular-models-linked-by-blowups); `SchemeKTheoryOperations:S.2`.

Sources: [Scholl.IntegralElements](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), 1.3.3, p. 8; [Scholl.IntegralElements](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), Remark 1.1.7, p. 4; [DJZ.2006](https://arxiv.org/abs/math/0405040), §3, p. 6 (arXiv v2).

<a id="E6-good-reduction-primes-impose-no-condition"></a>

### Primes of good reduction impose no integrality condition

`EllipticKTheory:E.6/good-reduction-primes-impose-no-condition` · lemma

Let v be a finite prime of F at which E has good reduction and let 𝓔 be a regular proper model smooth over v (e.g. the minimal one). Then G_1(𝓔_v) = K_1(𝓔_v) ≅ k(v)^× ⊕ k(v)^× is finite, hence K_2(E)^{S}_{Z,Q} = K_2(E)^{S∪{v}}_{Z,Q} for every S not containing v. Consequently only the finitely many primes of bad reduction can distinguish the integral part from the unramified part.

Hypotheses and conventions:

- E has good reduction at v; the fibre 𝓔_v of the smooth model is a smooth projective geometrically connected curve over the finite field k(v).
- Model independence (E.6/model-independence) allows the choice of 𝓔.

Construction or proof:

1. Localisation (S.3) for the open 𝓔_{S∪{v}} ⊂ 𝓔_S with complement 𝓔_v: K_2(𝓔_S) → K_2(𝓔_{S∪{v}}) → G_1(𝓔_v).
2. G_1(𝓔_v) = K_1(𝓔_v) (regular) is k(v)^× ⊕ k(v)^× by the finite-field computation of E.5, so the cokernel of the first map is finite.
3. Tensor with Q and take images in K_2(E)⊗Q.

Acceptance checks:

- For E = 37a1 and v = 2 the map K_2(𝓔) → K_2(𝓔[1/2]) is surjective (K_1(𝓔_2) = 0).

Prerequisites: [`EllipticKTheory:E.6/the-integral-part`](#E6-the-integral-part); [`EllipticKTheory:E.6/model-independence`](#E6-model-independence); [`EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`](#E5-an-elliptic-curve-over-a-finite-field); `SchemeKTheoryOperations:S.3`; [`EllipticKTheory:E.5/positive-odd-elliptic-k-groups`](#E5-positive-odd-elliptic-k-groups).

Sources: [Scholl.IntegralElements](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), Proposition 1.3.6 and proof, p. 9; [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.6, opening, PDF p. 510 (printed p. 502); [DJZ.2006](https://arxiv.org/abs/math/0405040), §8, p. 22 (arXiv v2).

<a id="E6-vertical-residues"></a>

### The vertical-residue description of the integral part

`EllipticKTheory:E.6/vertical-residues` · comparison

Let 𝓔 be a regular proper flat model of E over O_F. For every finite prime v and irreducible component C of the fibre 𝓔_v, let ∂_C: K_2(F(E)) → k(C)^× be the tame symbol of the discrete valuation ord_C (whose value on π_v is the multiplicity m_C). For α ∈ K_2(E)⊗Q (viewed in K_2(F(E))⊗Q, E.3), α ∈ K_2(E)_{Z,Q} iff ∂_C(α) = 0 in k(C)^×⊗Q for every vertical C. At primes of good reduction the condition holds automatically, so it is a finite set of conditions. Integrally: if ∂_C(α) is trivial for all C, some positive multiple of α lies in im(K_2(𝓔) → K_2(E)).

Hypotheses and conventions:

- 𝓔 is regular, proper and flat; its fibres have components C with multiplicities m_C and div(π_v) = Σ m_C C (upstream Stable reduction layer 5, Stacks 0C5Z).
- The boundary of the localisation sequence at the generic point of C on symbols is the tame symbol of ord_C, up to the inversion fixed in E.3/the-tame-symbol-boundary (S.3).
- K_1 of a finite field is finite (L.1).

Construction or proof:

1. Localisation for 𝓔 ⊃ 𝓔_U (S.3) and the colimit over dense opens U of the base: exact K_2(𝓔) → K_2(E) → ⊕_v G_1(𝓔_v).
2. Coniveau on the one-dimensional fibre (S.4, K-book V.9.5): the kernel of G_1(𝓔_v) → ⊕_C K_1(k(C)) is a quotient of ⊕_{x ∈ 𝓔_v closed} K_1(k(x)), a torsion group.
3. The composite K_2(E) → G_1(𝓔_v) → K_1(k(C)) = k(C)^× is ±∂_C.
4. Hence, after ⊗Q, α is in the image iff all ∂_C(α) are torsion; integrally the obstruction lies in a torsion group.
5. Good reduction primes: E.6/good-reduction-primes-impose-no-condition.

Acceptance checks:

- A class in K_2(E)_{Z,Q} has ∂_C(α) torsion for every vertical C, and conversely.
- For C: y^2 + (x+12)y + x^3 = 0 over Q and M = {y^2/x^3, 1 − x/4}, some component D of the fibre at 2 of the regular model has ∂_D(M) non-torsion (DJZ proof of Thm 8.3(2)).
- Only the finitely many bad primes can contribute conditions.

Prerequisites: [`EllipticKTheory:E.6/the-integral-part`](#E6-the-integral-part); [`EllipticKTheory:E.6/model-independence`](#E6-model-independence); [`EllipticKTheory:E.6/good-reduction-primes-impose-no-condition`](#E6-good-reduction-primes-impose-no-condition); [`EllipticKTheory:E.3/what-the-sequence-does-not-identify`](#E3-what-the-sequence-does-not-identify); `SchemeKTheoryOperations:S.3`; `SchemeKTheoryOperations:S.4`; `K2SymbolsBrauer:T.3/tame-symbol`; `KTheoryFiniteLocalFields:L.1`.

Sources: [DJZ.2006](https://arxiv.org/abs/math/0405040), (3.5)–(3.6), p. 6 (arXiv v2); [Scholl.IntegralElements](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf), Introduction, (0.1), p. 1; [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.9.5, printed p. 437 (PDF p. 445).

<a id="E6-minimal-arithmetic-model"></a>

### Minimal regular arithmetic models

`EllipticKTheory:E.6/minimal-arithmetic-model` · definition

Let F be a number field, S a finite set of finite places and O = O_{F,S}. Fix the smooth proper geometrically integral genus-one curve E/F of E.1 and its generic-fibre identification in each regular proper O-model. A model morphism f : X → Y is an O-scheme morphism inducing the identity of this fixed E. Write i_X : E → X for the generic-fibre projection; equivalently f respects the structure maps and i_X followed by f is i_Y. A regular proper model M is minimal if every model morphism M → N to another regular proper model is an isomorphism. The category retains the generic-fibre marking; it does not identify models just because their underlying schemes are isomorphic. Local relative minimality means that, for every closed point v of Spec O, M ×_O O_(v) has no exceptional curve of the first kind, in the sense imported from StableReduction layer 5.

Hypotheses and conventions:

- All models are the E.6 regular proper models, with regularity of the total scheme, not smoothness of every fibre.
- The minimality predicate uses outgoing morphisms; its equivalence with incoming terminality and with local relative minimality is proved in separate nodes.

Construction or proof:

1. Use the regular proper model of E.6/the-regular-proper-model and its generic-fibre projection, and form morphisms by the two compatibility equalities.
2. Define the isomorphism condition using the scheme category. Identity, composition and transport along marked isomorphisms use these equalities.
3. For morphism uniqueness, regularity implies reducedness and flatness makes the generic fibre dense. Apply Mathlib ext_of_isDominant_of_isSeparated to the proper, hence separated, target.
4. After localization at v, forget regularity and properness to the pinned TauCeti.Model over the DVR O_(v); retain them as separately verified properties. The marked-morphism condition agrees with TauCeti.Model.Hom.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `RegularProperModel.Hom` | constructor | For regular proper models X,Y, package a scheme map f with f followed by Y.toBase = X.toBase and i_X followed by f = i_Y. These equalities are the complete constructor conditions. |
| `RegularProperModel.Hom.hom` | projection | The underlying scheme morphism of a model morphism, with the over-base and generic-fibre compatibility equalities. |
| `RegularProperModel.Hom.id` | functoriality | The identity scheme morphism is a model morphism X → X. |
| `RegularProperModel.Hom.comp` | functoriality | The composite of model morphisms X → Y → Z has the composite scheme morphism; identity and associativity follow from the scheme category. |
| `RegularProperModel.Hom.id_hom` | simp | The underlying scheme map of Hom.id M is the identity on M.X. |
| `RegularProperModel.Hom.comp_hom` | simp | For marked model maps f : Hom M N and g : Hom N P, (Hom.comp f g).hom = f.hom followed by g.hom. |
| `RegularProperModel.category` | instance | Regular proper models of the fixed marked E form a category with Hom, Hom.id and Hom.comp; identity and associativity laws follow from the scheme category and Hom.ext. |
| `RegularProperModel.Hom.ext` | extensionality | Two model morphisms with equal underlying scheme morphisms are equal. |
| `RegularProperModel.Hom.subsingleton` | extensionality | For any two regular proper models of the same marked generic curve, there is at most one model morphism between them. This is an application of the existing Mathlib reduced-source, dominant-map, separated-target equality theorem. |
| `RegularProperModel.isMinimal_iff` | characterisation | M.IsMinimal holds exactly when every marked model morphism M → N is an isomorphism on total schemes. |
| `RegularProperModel.IsMinimal.of_iso` | compatibility | If f : M → N is a marked model morphism whose underlying scheme morphism is an isomorphism, then M.IsMinimal implies N.IsMinimal. |
| `RegularProperModel.toLocalModel` | compatibility | For a closed point v, localize an arithmetic model to O_(v) and forget regularity and properness to TauCeti.Model O_(v) F E; the generic-fibre marking is unchanged. Its morphisms are TauCeti.Model.Hom after this forgetful comparison. |
| `RegularProperModel.toLocalModelHom` | functoriality | A marked model morphism f : Hom M N induces a TauCeti.Model.Hom (toLocalModel M v) (toLocalModel N v) by scalar extension to the same local DVR. Its underlying map is the base change of f.hom under toLocalModel_totalIso; its generic-fibre equality uses genericFiberTowerIso. |
| `RegularProperModel.toLocalModel_totalIso` | compatibility | The total scheme of toLocalModel M v is canonically isomorphic to M ×_O O_(v), over O_(v) and with the fixed generic-fibre identification. |

Unit tests:

- `smooth_37a1_minimal` (computation): The projective Weierstrass model y²z + yz² = x³ − xz² over Z[1/37] is smooth proper and minimal: Δ = 37 is a unit, and its localized fibres are smooth genus-one curves, with no exceptional rational component.
- `nodal_37a1_minimal` (computation): The same projective model over Z is regular and minimal although its fibre at 37 is nodal. At the nodal point (5,18), f = 222 ∉ (37²); the minimal equation has v_37(Δ)=1 and irreducible type I₁ fibre. The fibre is not smooth, but has no exceptional curve of the first kind.
- `point_blowup_not_minimal` (non-example): Blow up the rational closed point (x,y) = (0,0) in the fibre at 2 of the preceding smooth model over Z[1/37]. The new total surface is still regular proper and flat, with the same marked generic fibre, but is not minimal: its blowdown to the original model has exceptional fibre P¹_{F₂}, hence is not an isomorphism.

Acceptance checks:

- A blowdown of a point blowup of a minimal model violates the outgoing-isomorphism condition.
- A minimal model can have a singular special fibre.
- The local forgetful comparison uses the existing TauCeti.Model and does not introduce a second local model carrier.

Prerequisites: [`EllipticKTheory:E.6/the-regular-proper-model`](#E6-the-regular-proper-model); [`EllipticKTheory:E.1/geometric-properties-of-the-curve`](#E1-geometric-properties-of-the-curve); `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`; `mathlib:AlgebraicGeometry.ext_of_isDominant_of_isSeparated`; `tauceti:TauCeti.Model`; `tauceti:TauCeti.genericFiberTowerIso`.

Sources: [Conrad.MinimalModels](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf), Definition 3.8 and Example 3.9, p. 8; [Stacks.SemistableReduction](https://stacks.math.columbia.edu/download/models.pdf), Section 55.8, opening conventions and Definition 55.8.4 (0C2V), pp. 33–34.

Atlas planet: **Minimal regular arithmetic model**.

<a id="E6-exists-locally-minimal-arithmetic-model"></a>

### Existence of a locally minimal arithmetic model

`EllipticKTheory:E.6/exists-locally-minimal-arithmetic-model` · theorem

For every number field F, finite S and elliptic curve E/F, there is a projective regular proper flat O_{F,S}-model M of E such that M ×_O O_(v) is relatively minimal for every closed point v. It is obtained from a projective regular proper model by a finite sequence of contractions of vertical exceptional curves of the first kind. Each contraction fixes the marked generic fibre.

Hypotheses and conventions:

- O_{F,S} is an excellent Noetherian Dedekind domain; E is smooth proper geometrically integral of genus one.
- Exceptional curves are effective Cartier divisors isomorphic to P¹ over their field of constants, with normal sheaf O(−1), not just rational components with a guessed self-intersection.

Construction or proof:

1. Use the E.6/existence-of-a-regular-proper-model construction: take projective closure, finite normalization and projective blowups resolving the arithmetic surface. It supplies a projective model, not only an unspecified proper one.
2. The nonsmooth locus has closed image under the proper structure map and does not meet the generic point. Thus only finitely many base primes have nonsmooth fibres, and the union of their finitely many irreducible components is finite. In a smooth fibre the components are disjoint; locally each component is the uniformizer divisor, so its normal sheaf is trivial and it cannot be exceptional.
3. A local exceptional fibre component is the same closed Cartier curve on the global surface: localization at its base prime preserves the local rings along it and its normal sheaf. Import the projective curve-on-surface contraction (Stacks 54.16.9(1)) from StableReduction layer 4. The contracted point has regular local ring of dimension two; elsewhere the map is an isomorphism.
4. The target is projective, regular and integral, still has generic fibre E, and is flat over O because its local rings are torsion-free O-modules (flatness over a Dedekind domain). Each contraction removes exactly one component over the fixed finite set of primes and does not change the other fibres.
5. Induct on this finite component count. With no exceptional component left, every localization satisfies StableReduction layer 5’s relative-minimality criterion.

Acceptance checks:

- A smooth proper elliptic model is already an output, with zero contractions.
- An initial point blowup of such a model requires a contraction; mere regularity of the initial model does not terminate the algorithm.
- The argument uses finitely many bad primes and never an infinite gluing of independently chosen DVR models.

Prerequisites: [`EllipticKTheory:E.6/minimal-arithmetic-model`](#E6-minimal-arithmetic-model); [`EllipticKTheory:E.6/existence-of-a-regular-proper-model`](#E6-existence-of-a-regular-proper-model); `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`; `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`.

Sources: [Stacks.ResolutionOfSurfaces](https://stacks.math.columbia.edu/download/resolve.pdf), Lemma 54.16.9(1), tag 0C2N, pp. 50–51; [Stacks.SemistableReduction](https://stacks.math.columbia.edu/download/models.pdf), Lemma 55.8.5 (0CD9) and Proposition 55.8.6 (0C2W), pp. 34–35.

<a id="E6-locally-minimal-terminal-model"></a>

### The arithmetic terminal mapping property

`EllipticKTheory:E.6/locally-minimal-terminal-model` · theorem

Let M be a regular proper O_{F,S}-model of E/F whose localization at every closed point v is relatively minimal. For every regular proper model X of this fixed E there exists exactly one marked O-model morphism X → M. Thus M is terminal among regular proper models, and M is minimal in the outgoing sense.

Hypotheses and conventions:

- F is a number field, S finite, and E/F elliptic (positive genus is essential).
- The source X need not be smooth over O and need not have minimal Weierstrass equations.

Construction or proof:

1. Use E.6/regular-models-linked-by-blowups to obtain a common regular model Z, with Z → X a finite sequence of closed-point blowups and Z → M a marked model morphism.
2. For the last blowup Z = X_n → X_{n−1}, its exceptional curve lies over one base prime v. StableReduction layer 5 makes M_(v) terminal in the local regular-model category. There is a map X_{n−1,(v)} → M_(v), and uniqueness shows that its composite with the local blowup is the localization of Z → M. Hence Z → M maps the exceptional curve to a point.
3. Import the universal property of this blowdown from StableReduction layer 4 (Stacks 54.16.1): Z → M factors uniquely through X_{n−1}. The factorization is over O and respects the generic marking, because the blowup is surjective and is an isomorphism on E.
4. Repeat until the map X → M exists. For uniqueness apply Mathlib ext_of_isDominant_of_isSeparated: X is reduced, its generic fibre is dense by flatness, and M is separated over O.
5. For f : M → N, terminality supplies g : N → M. Morphism uniqueness gives both composites equal to the identities, so f is an isomorphism.

Acceptance checks:

- The terminal morphism from a point blowup of M is the blowdown, with its fixed generic marking.
- For X = M the unique endomorphism is the identity.
- In the genus-zero example of Stacks 55.10.3 the corresponding assertion fails; the local positive-genus hypothesis is not silently dropped.

Prerequisites: [`EllipticKTheory:E.6/minimal-arithmetic-model`](#E6-minimal-arithmetic-model); [`EllipticKTheory:E.6/regular-models-linked-by-blowups`](#E6-regular-models-linked-by-blowups); `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`; `mathlib:AlgebraicGeometry.ext_of_isDominant_of_isSeparated`.

Sources: [Stacks.SemistableReduction](https://stacks.math.columbia.edu/download/models.pdf), Lemma 55.10.2, tag 0C9Z, p. 40; [Stacks.ResolutionOfSurfaces](https://stacks.math.columbia.edu/download/resolve.pdf), Lemma 54.16.1, tag 0C5J, p. 46.

Atlas planet: **Arithmetic minimal-model theorem**.

<a id="E6-minimality-local-criterion"></a>

### Local criterion for arithmetic minimality

`EllipticKTheory:E.6/minimality-local-criterion` · theorem

For a regular proper O_{F,S}-model M of an elliptic E/F, the following are equivalent: (i) M.IsMinimal; (ii) every localization M ×_O O_(v) is relatively minimal; (iii) for every regular proper model X of this fixed marked E there is exactly one model morphism X → M. In particular a minimal regular proper arithmetic model exists.

Hypotheses and conventions:

- F is a number field, S finite, and E is the elliptic generic curve of E.1.
- The local condition uses actual exceptional curves, with their normal sheaves; it is not the minimality of a numerical dual graph.

Construction or proof:

1. Condition (ii) implies (iii) and (i) by locally-minimal-terminal-model.
2. Given (i), choose a locally minimal model L by exists-locally-minimal-arithmetic-model. Its terminal property gives M → L. By (i) that morphism is an isomorphism, so localization identifies M_(v) with the relatively minimal L_(v); this gives (ii).
3. For (iii) implies (i), use the reverse map N → M for any M → N and uniqueness of model morphisms to identify both composites with identities.
4. The same locally minimal L establishes existence in the outgoing-minimality formulation. No general-base gluing theorem is needed.

Acceptance checks:

- Both the smooth and nodal 37a1 models in the definition’s tests satisfy all three conditions.
- The point blowup fails (i) and (ii), and its blowdown shows why it cannot be terminal.

Prerequisites: [`EllipticKTheory:E.6/minimal-arithmetic-model`](#E6-minimal-arithmetic-model); [`EllipticKTheory:E.6/exists-locally-minimal-arithmetic-model`](#E6-exists-locally-minimal-arithmetic-model); [`EllipticKTheory:E.6/locally-minimal-terminal-model`](#E6-locally-minimal-terminal-model).

Sources: [Conrad.MinimalModels](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf), Definition 3.8, Theorem 3.10 and Remark 3.11, p. 8.

<a id="E6-unique-minimal-arithmetic-model"></a>

### Uniqueness of the minimal regular arithmetic model

`EllipticKTheory:E.6/unique-minimal-arithmetic-model` · theorem

For minimal regular proper O_{F,S}-models M and N of the same fixed elliptic E/F, there is a unique O-scheme isomorphism M ≅ N inducing the identity on E. Every model morphism M → N is this isomorphism. The localized isomorphism agrees with the unique marked minimal-model isomorphism over each O_(v).

Hypotheses and conventions:

- The generic-fibre markings are fixed and part of the objects.
- Uniqueness is among isomorphisms inducing the identity on E; unmarked schemes can have automorphisms.

Construction or proof:

1. Use minimality-local-criterion to obtain the terminal morphisms M → N and N → M.
2. Their composites are the identity because model morphisms between any fixed pair are unique (apply the cited Mathlib separated-target equality theorem).
3. These maps define inverse scheme isomorphisms, over O and with the fixed marking. Any second marked isomorphism has the same underlying model morphism.
4. Localize and use the local uniqueness supplied by StableReduction layer 5.

Acceptance checks:

- Changing the chosen starting resolution gives canonically isomorphic minimal models.
- The 37a1 projective model has the elliptic involution, but it is not a second identity-marked isomorphism: on its generic curve it sends (x,y) to (x,−y−1).

Prerequisites: [`EllipticKTheory:E.6/minimal-arithmetic-model`](#E6-minimal-arithmetic-model); [`EllipticKTheory:E.6/minimality-local-criterion`](#E6-minimality-local-criterion); `mathlib:AlgebraicGeometry.ext_of_isDominant_of_isSeparated`; `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

Sources: [Stacks.SemistableReduction](https://stacks.math.columbia.edu/download/models.pdf), Lemma 55.10.1, tag 0C6B, pp. 39–40.

Atlas planet: **Uniqueness of the arithmetic minimal model**.

<a id="E6-minimal-model-localisation"></a>

### Minimal arithmetic models and inversion of primes

`EllipticKTheory:E.6/minimal-model-localisation` · theorem

Let S ⊆ S′ be finite sets of finite places of a number field F. If M is the minimal regular proper model of E/F over O_{F,S}, then M ×_{O_{F,S}} O_{F,S′} is a minimal regular proper model over O_{F,S′}. It is canonically isomorphic, with identity generic marking, to every independently constructed minimal model there. For S ⊆ S′ ⊆ S″ these comparison isomorphisms compose to the direct comparison under the canonical iterated-base-change identification.

Hypotheses and conventions:

- Only inversion of primes within the same number field is asserted.
- Spec O_{F,S′} is an open subscheme of Spec O_{F,S}; at every retained prime the local DVR and generic curve are unchanged.

Construction or proof:

1. Import S-integers-localisation-of-torsion-class-group, using the finite class group of O_F. For each v in S′ but not in S choose h_v ≥ 1 and a_v with v^{h_v} = (a_v), and set a = ∏ a_v (a = 1 for the empty set). Then O_{F,S′} = O_{F,S}[1/a], so the base change is the principal open restriction D(a). Base change preserves properness and flatness; open restriction preserves regularity. Its generic-fibre marking is the original E.
2. At every retained closed point the localized model is the same M_(v). Apply minimality-local-criterion over O_{F,S′}.
3. Apply unique-minimal-arithmetic-model to obtain the canonical comparison. Composites and the direct comparison induce the identity on E, hence are equal by model-morphism uniqueness.
4. E.6/model-independence can therefore be evaluated on this canonical model. The already defined integralPart_le_integralPartS supplies the inclusion of rational K₂-images; no new K-theory formula is needed here.

Acceptance checks:

- For S = S′ the comparison is the identity.
- Inverting 37 in the nodal 37a1 model yields the smooth minimal model of the first definition test.
- Inverting 2 deletes both the fibre containing the chosen point and its exceptional blowup component; it illustrates why minimality may improve on restricting a nonminimal model.
- No assertion is made for arbitrary ramified DVR extensions, which can change regularity and minimality.

Prerequisites: [`EllipticKTheory:E.6/minimal-arithmetic-model`](#E6-minimal-arithmetic-model); [`EllipticKTheory:E.6/minimality-local-criterion`](#E6-minimality-local-criterion); [`EllipticKTheory:E.6/unique-minimal-arithmetic-model`](#E6-unique-minimal-arithmetic-model); `ArithmeticKTheory:N.1/S-integers-as-a-localisation`; `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`; [`EllipticKTheory:E.6/the-integral-part`](#E6-the-integral-part); [`EllipticKTheory:E.6/model-independence`](#E6-model-independence).

Sources: [Stacks.SemistableReduction](https://stacks.math.columbia.edu/download/models.pdf), Definition 55.8.4, tag 0C2V, p. 34; [Conrad.MinimalModels](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf), Remark 3.11, p. 8.

<a id="layer-e7"></a>

## E.7: certified symbols and Bloch classes

Represent a candidate by a finite sum of Steinberg symbols. A horizontal
certificate supplies finite divisor support and tame values equal to one in
the actual residue fields. Integral certificates add vertical components and
their residue computations. These certify membership and liftability; the
rational number-field injectivity theorem identifies the resulting curve class.

Torsion functions come from the existing divisor-class criterion. Bloch's
correction multiplies by an annihilator before adding constant-symbol terms.
His classes are independent of choices modulo torsion and constants; this is
not a linear-independence assertion. Transfer preserves horizontal
certificates through residue-field norms. Rational Galois descent does not
discharge the separate vertical conditions for integrality.


<a id="E7-symbol-certificates"></a>

### Finite-support certificates for a sum of symbols

`EllipticKTheory:E.7/symbol-certificates` · construction

Let E be an elliptic curve over a field k with function field K = k(E), and let the places of K/k (Tau Ceti's TauCeti.Place k K; these are the closed points of the smooth projective model) be the closed points. A candidate is a finitely supported function alpha from pairs (f, g) of units of K to the integers, read as the formal sum of n_(f,g) {f, g}. Its tame value at a place P is tame_P(alpha) = product of tame_P(f, g)^(n_(f,g)), where tame_P(f, g) = (-1)^(ord_P f * ord_P g) times the residue in the residue field k(P) of f^(ord_P g) / g^(ord_P f), the convention of K2SymbolsBrauer:T.3/tame-symbol. A certificate for alpha consists of: (i) a named finite set S of places; (ii) for every P outside S and every (f, g) in the support of alpha, a proof that ord_P f = ord_P g = 0; (iii) for every P in S, a uniformiser t_P, the orders ord_P f, ord_P g and the leading units (the residues of f t_P^(-ord_P f) and g t_P^(-ord_P g)) of the functions involved; (iv) for every P in S, a proof that tame_P(alpha) = 1 IN k(P)^x, computed from (iii) by the leading-unit formula. Soundness: a certified candidate has tame_P(alpha) = 1 at every place, so its image {alpha} in K_2(K) (Matsumoto) lies in the kernel of the tame symbol, hence (E.3) in the image of K_2(E). Completeness: a candidate admits a certificate if and only if tame_P(alpha) = 1 for all P; the union of the supports of the divisors of the functions involved is always an admissible S.

Hypotheses and conventions:

- k is a field and E an elliptic curve over k given by a Weierstrass equation W with W.IsElliptic; K = W.FunctionField and the places are TauCeti.Place k K.
- The condition in (iv) is triviality in the residue field k(P), not triviality of its norm to k; at a place of degree larger than one these differ.
- The tame symbol is K2SymbolsBrauer's; the K-book's III.6.3 symbol is its inverse, and triviality is the same condition in both conventions, while the recorded values in (iii) must name the convention.

Construction or proof:

1. Define tame_P(f, g) from TauCeti.Place.ord and TauCeti.Place.residueUnit applied to the unit f^(ord g)/g^(ord f), whose order is zero.
2. Prove the leading-unit formula: for a uniformiser t with f = t^(ord f) u and g = t^(ord g) w (TauCeti.Place.exists_eq_zpow_mul_unit), tame_P(f, g) = (-1)^(ord f ord g) res(u)^(ord g) res(w)^(-ord f); in particular the value does not depend on t.
3. Prove that tame_P(f, g) = 1 when ord_P f = ord_P g = 0, so field (ii) makes the tame value trivial outside S; the finiteness of the set of places where some function has nonzero order is TauCeti.Place.finite_setOf_ord_ne_zero.
4. Prove soundness and completeness as stated, and identify tame_P on the image {alpha} in K_2(K) with K2SymbolsBrauer:T.3/tame-symbol evaluated on the Steinberg symbols.
5. Deduce, with EllipticKTheory:E.3/what-the-sequence-does-not-identify, that a certified class lies in the image of K_2(E), and over a number field defines a class in K_2(E) tensor Q.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `tameValue` | data | tameValue P f g : (P.ResidueField)^x, equal to (-1)^(ord f ord g) * residueUnit(f^(ord g)/g^(ord f)). |
| `tameValue_eq_leading` | characterisation | For a uniformiser t at P, tameValue P f g = (-1)^(ord f ord g) lead_t(f)^(ord g) lead_t(g)^(-ord f); independent of t. |
| `tameValue_of_ord_eq_zero` | simp | If ord_P f = ord_P g = 0 then tameValue P f g = 1. |
| `SymbolCandidate` | structure | Finitely supported functions (K^x x K^x) -> Z, with SymbolCandidate.tame P : (P.ResidueField)^x multiplicative in the candidate. |
| `SymbolCandidate.toK2` | projection | The class of the candidate in K_2(K), sum of n {f, g} (K2SymbolsBrauer:T.2). |
| `SymbolCertificate` | structure | Fields: support (a finset of places), unit_outside (orders zero off the support), leading data at each place of the support, tame_eq_one (tame value one in the residue field at each place of the support). |
| `SymbolCertificate.support` | projection | The named finite set of places. |
| `SymbolCertificate.tame_eq_one_everywhere` | characterisation | A certified candidate has tame value one at every place. |
| `SymbolCertificate.nonempty_iff` | characterisation | Nonempty (SymbolCertificate alpha) iff tame P alpha = 1 for all places P. |
| `SymbolCertificate.sound` | compatibility | A certified candidate's class lies in the kernel of K2SymbolsBrauer's tame symbol, hence in the image of K_2(E) (E.3). |

Unit tests:

- `SymbolCertificate.empty` (degenerate): The zero candidate has a certificate with empty support.
- `certificate_11a3` (computation): On W = [0,-1,1,0,0] over Q, {x, y} + {-1, x} has a certificate with support {(0,0), (0,-1), (1,0), O}, while {x, y} alone does not (tame values -1 at (0,0) and (0,-1)).
- `norm_only_not_certificate` (non-example): On W = [0,0,0,0,1] over Q, {x - 1, -1} has norm-to-Q of every tame value equal to one but tame value -1 in Q(sqrt 2) at the place x = 1; it has no certificate. A definition that tests norms would accept it.
- `certificate_convention_invariant` (compatibility): tame_P(alpha) = 1 in K2SymbolsBrauer's convention iff the K-book III.6.3 value of alpha at P is 1 (the two values are inverse).
- `SymbolCertificate.nonempty_iff_test` (characterisation): For the 11a3 candidate 5{x, y} + sum over the four nonzero rational torsion points P of {f_P, tame_P{x, y}}, with div f_P = 5(P) - 5(O), the certificate exists and all nine listed tame values equal one.

Acceptance checks:

- On y^2 + y = x^3 - x^2 over Q (11a3), the candidate {x, y} + {-1, x} has a certificate with S = {(0,0), (0,-1), (1,0), O}; the tame values of {x, y} there are -1, -1, 1, 1 and those of {-1, x} are -1, -1, 1, 1.
- On y^2 = x^3 + 1 over Q (36a1), the candidate {x - 1, -1} has no certificate: its tame value at the degree-two place x = 1 (residue field Q(sqrt 2)) is -1, although that value has norm 1 to Q and the tame value is 1 at every other place.
- Soundness and completeness as stated.

Prerequisites: `K2SymbolsBrauer:T.3/tame-symbol`; `K2SymbolsBrauer:T.3/finite-support`; `K2SymbolsBrauer:T.2/matsumoto`; [`EllipticKTheory:E.3/the-tame-symbol-boundary`](#E3-the-tame-symbol-boundary); [`EllipticKTheory:E.3/what-the-sequence-does-not-identify`](#E3-what-the-sequence-does-not-identify); `tauceti:TauCeti.Place`; `tauceti:TauCeti.Place.ord`; `tauceti:TauCeti.Place.residueUnit`; `tauceti:TauCeti.Place.exists_eq_zpow_mul_unit`; `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`; `tauceti:TauCeti.Divisor.principal`.

Sources: [DJZ.2006](https://arxiv.org/abs/math/0405040), Section 4, opening paragraphs, p. 7 (arXiv v2); [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma III.6.3, PDF p. 242 (printed p. 234).

<a id="E7-integral-certificates"></a>

### Integral certificates: vertical conditions on a regular proper model

`EllipticKTheory:E.7/integral-certificates` · construction

Let k be a number field with ring of integers O_k, E/k an elliptic curve and X a regular proper flat model of E over O_k (E.6). An integral certificate for a candidate alpha consists of a certificate for alpha (previous node), a named finite set S' of maximal ideals of O_k with a proof that for every p outside S' the fibre X_p is smooth and irreducible and every function involved has order zero along X_p, and for every p in S' the list of irreducible components D of X_p with, for each D, the orders of the functions involved along D, the leading units in the function field k(D) and a proof that the tame value of alpha at the generic point of D is one in k(D)^x. Soundness: a candidate with an integral certificate lies in the kernel of the tame symbols at all codimension-one points of X; under the hypotheses of E.6/vertical-residues this places its class, tensored with Q, in the integral part.

Hypotheses and conventions:

- X is regular, proper and flat over O_k with generic fibre E; its vertical prime divisors are the components of the fibres.
- Outside S' the vertical condition holds because every function involved is a unit at the generic point of the fibre; this is what makes the list of vertical conditions finite.
- Rationally, vertical conditions can fail non-trivially only at primes of split multiplicative reduction (the fibre's K_1' has rank one there and is torsion elsewhere).

Construction or proof:

1. Define the vertical tame value at the generic point of a component D, a discrete valuation of k(E) with residue field k(D).
2. Prove that orders zero along D give tame value one, so the conditions outside S' are automatic.
3. Prove soundness against E.6/vertical-residues.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `IntegralCertificate` | structure | A certificate together with the finite set of primes S', the exhaustiveness proof outside S', and the vertical data and conditions at each component over S'. |
| `IntegralCertificate.primes` | projection | The named finite set S' of primes. |
| `IntegralCertificate.sound` | compatibility | An integrally certified candidate is killed by every codimension-one tame symbol of the model, hence lies in the integral part (E.6/vertical-residues). |

Unit tests:

- `integral_certificate_11a3` (computation): {x, y} + {-1, x} on 11a3 has an integral certificate with S' = {11}.
- `unramified_not_integral_DGJK` (non-example): For u = 1/3, alpha = {v, w} + {-1, h} has a certificate and no nonzero multiple has an integral certificate.
- `integral_of_constant` (degenerate): The candidate {c, d} with c, d units of O_k has an integral certificate with empty S and empty S'.

Acceptance checks:

- On 11a3, the minimal Weierstrass model over Z is regular (type I_1 at 11, good elsewhere) and {x, y} + {-1, x} has an integral certificate with S' = {11}: x and y have order zero along the irreducible fibre at 11.
- For u = 1/3 the element alpha = {v, w} + {-1, h} on y^2 = x(x+1)(x+u^2) (DGJK) has a certificate but no nonzero multiple has an integral certificate: at the component V = 0 of the fibre at 3 of the model (V^2-Z^2)(W^2-Z^2) + 4uVWZ^2 = 0 cleared of denominators, the tame value of {v, w} is the class of Z/W, of infinite order.

Prerequisites: [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); [`EllipticKTheory:E.6/the-regular-proper-model`](#E6-the-regular-proper-model); [`EllipticKTheory:E.6/vertical-residues`](#E6-vertical-residues).

Sources: [DJZ.2006](https://arxiv.org/abs/math/0405040), Remark 3.8, p. 6 (arXiv v2); [Young.1995](https://etheses.durham.ac.uk/id/eprint/5114/1/5114_2567.PDF), Theorem 3.3, printed p. 41.

<a id="E7-reciprocity-determines-the-last-rational-point"></a>

### Reciprocity as the consistency condition: the last rational point is free

`EllipticKTheory:E.7/reciprocity-determines-the-last-rational-point` · lemma

Let E be an elliptic curve over k and alpha a candidate. The normed tame values satisfy the product over all places P of N_(k(P)/k)(tame_P(alpha)) = 1 (imported). Consequently, if tame_P(alpha) = 1 at every place P other than one place P_0 of degree one, then tame_(P_0)(alpha) = 1. More generally, if tame_P(alpha) = 1 for all P other than P_0, then N_(k(P_0)/k)(tame_(P_0)(alpha)) = 1, and this does not imply tame_(P_0)(alpha) = 1 when deg P_0 > 1.

Hypotheses and conventions:

- Weil reciprocity is used in the form of K2SymbolsBrauer:T.4/weil-reciprocity, with the residue-field norms.
- The product over geometric points (all embeddings of each k(P) into an algebraic closure) is the same identity, since each place contributes its norm; what fails is a product that takes ONE value per closed point.

Construction or proof:

1. Apply K2SymbolsBrauer:T.4/weil-reciprocity to the candidate (multiplicativity of tame values in the candidate).
2. At a place of degree one the norm is the identity, which gives the first consequence.
3. Record the non-examples: on 36a1, {x - 1, -1} has tame value -1 (norm 1) at the degree-two place x = 1 and value one elsewhere; and for {y - 3, x} the product of one value per closed point, taking x = -1 + sqrt(-3) at the degree-two point, is -1 - sqrt(-3), not 1, while the normed product is (1/2)(1/4)(-2)(-4)(1) = 1.

Acceptance checks:

- On 36a1 the tame values of {y - 3, x} are 1/2 at (2,3), 1/x0 at the place {x^2 + 2x + 4 = 0, y = 3} (norm 1/4), -2 at (0,1), -4 at (0,-1) and 1 at O; the normed product is one.
- In the certificate for {x, y} + {-1, x} on 11a3 the value at O follows from the other three by this lemma.

Prerequisites: `K2SymbolsBrauer:T.4/weil-reciprocity`; [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); `tauceti:TauCeti.Place.normResidue`; `tauceti:TauCeti.Place.finiteDimensional_residueField`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Weil Reciprocity Formula V.6.12.1, PDF p. 424 (printed p. 416); proof on PDF p. 425; [DJZ.2006](https://arxiv.org/abs/math/0405040), Proof of Lemma 4.2, p. 8 (arXiv v2).

<a id="E7-principal-divisors-on-rational-torsion"></a>

### A divisor supported on rational torsion is principal when its sum vanishes

`EllipticKTheory:E.7/principal-divisors-on-rational-torsion` · lemma

Let W be an elliptic Weierstrass curve over a field k and D = sum of n_i (P_i) a divisor of degree zero on k(W) supported on k-rational points. Then D is the divisor of a function in k(W)^x if and only if the sum of n_i P_i is zero in W(k). In particular: (a) for a rational point T with C T = 0 there is f_T with div f_T = C(T) - C(O) (this case is Tau Ceti's exists_principal_zsmul_pointPlace_sub_infinity); (b) if all points of order C are rational, there is rho with div rho = (C^2 - 1)(O) - sum over nonzero a in E[C] of (a), because the points of E[C] sum to zero.

Hypotheses and conventions:

- W.IsElliptic, so that W.CoordinateRing is a Dedekind domain (isIntegrallyClosed_coordinateRing, isDedekindDomain_coordinateRing_of_isIntegrallyClosed).
- The points are k-rational; the non-rational case is handled by passing to a finite extension (E.7/transfer-of-certified-classes).

Construction or proof:

1. Write D = sum n_i ((P_i) - (O)) and apply the additive equivalence pointEquivDegreeZeroDivisorClass with its computation rule val_pointEquivDegreeZeroDivisorClass_some.
2. A degree-zero class vanishes iff its divisor is principal (TauCeti.Divisor.divisorClass_eq_zero_iff).
3. For (b): the points of E[C] sum to zero (pair a with -a; for even C the 2-torsion points sum to zero).

Acceptance checks:

- On 11a3 the functions f_P with div f_P = 5(P) - 5(O) for the four nonzero rational torsion points are x^2 + xy + y, -x^2 + (y+1)x + (y+1), -2x^2 + (y+3)x - 1 and 2x^2 + (y-2)x + 1 (computed in L(5 O)).
- On y^2 = x^3 - x over Q with C = 2, rho = 1/y and f_(0,0) = x.

Prerequisites: `tauceti:WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`; `tauceti:WeierstrassCurve.Affine.val_pointEquivDegreeZeroDivisorClass_some`; `tauceti:WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity`; `tauceti:TauCeti.Divisor.divisorClass_eq_zero_iff`; `tauceti:WeierstrassCurve.Affine.isDedekindDomain_coordinateRing_of_isIntegrallyClosed`; `tauceti:WeierstrassCurve.Affine.isIntegrallyClosed_coordinateRing`.

Sources: [Bloch.CRM11](https://bookstore.ams.org/crmm-11), Lecture 10, 10.1, printed p. 76 (supplied scan PDF p. 88).

<a id="E7-bloch-correction"></a>

### Bloch's Proposition 10.1.1: multiplication by C and constant-symbol corrections

`EllipticKTheory:E.7/bloch-correction` · theorem

Let E be an elliptic curve over a field k, T a finite subgroup of E(k) and C a positive integer with C T = 0. Let f, g be in k(E)^x with divisors supported on T. For each nonzero P in T let f_P have divisor C(P) - C(O) and let c_P = tame_P{f, g} (in k^x, since P is rational). Then the candidate C{f, g} + sum over nonzero P in T of {f_P, c_P} has tame value one at every place of E. In Bloch's formulation T = E[C] with all points of order C rational; the proof needs only that the support is rational and killed by C.

Hypotheses and conventions:

- The divisors of f and g are supported on the finite subgroup T of k-rational points, and C kills T.
- Convention: K2SymbolsBrauer's tame symbol, for which tame_P{f_P, c} = c^(-C) at P and c^(C) at O.

Construction or proof:

1. Outside T all functions involved are units, so the tame values are one there.
2. At a nonzero P in T the value is c_P^C times c_P^(-C) = 1.
3. At O the value is one by E.7/reciprocity-determines-the-last-rational-point, all places of T being of degree one.
4. Equivalently (Bloch's proof): tame{f, g} lies in Div(E) tensor k^x, its image in Pic(E) tensor k^x is killed by C (the degree part by reciprocity, the Pic^0 part because C T = 0), and the exact sequence k(E)^x tensor k^x -> Div(E) tensor k^x -> Pic(E) tensor k^x -> 0 supplies the correction.

Acceptance checks:

- On 11a3 with T = E(Q)_tors (order 5), f = x, g = y, C = 5: the tame values of {x, y} at the four nonzero points are -1, -1, 1, 1, and 5{x, y} + sum {f_P, c_P} has tame value one at all points of T and at O (PARI, checker C).
- The statement is false without the factor C in general: see the non-example of E.7/bloch-classes.

Prerequisites: [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); [`EllipticKTheory:E.7/reciprocity-determines-the-last-rational-point`](#E7-reciprocity-determines-the-last-rational-point); [`EllipticKTheory:E.7/principal-divisors-on-rational-torsion`](#E7-principal-divisors-on-rational-torsion).

Sources: [Bloch.CRM11](https://bookstore.ams.org/crmm-11), Proposition 10.1.1, printed p. 75 (supplied scan PDF p. 87); [Young.1995](https://etheses.durham.ac.uk/id/eprint/5114/1/5114_2567.PDF), Lemma 3.1, printed p. 37.

<a id="E7-bloch-classes"></a>

### Bloch's classes S_a

`EllipticKTheory:E.7/bloch-classes` · construction

Let E/k be an elliptic curve with all points of order C rational (so E[C] = (Z/C)^2 and mu_C is contained in k), rho with div rho = (C^2 - 1)(O) - sum over nonzero points of E[C], and for nonzero a in E[C] f_a with div f_a = C(a) - C(O). Let K2T(E) be the kernel of the tame symbol on K_2(k(E)) and Q_E the subgroup of K_2(k(E)) generated by torsion and by the symbols {c, d} with c, d in k^x. Define S_a in K2T(E) tensor Z[1/C] as (1/C) times the class of C{rho, f_a} + sum {f_i, c_i}, the correction supplied by E.7/bloch-correction. Then S_a is independent of the choices of rho, f_a (each fixed up to a constant) and of the correction, modulo Q_E; when K_2(k) is torsion (k a number field) S_a is well defined modulo torsion. The classes S_a are NOT asserted to be linearly independent: the independence in Bloch's text is independence of choices.

Hypotheses and conventions:

- All points of order C are defined over k; for C >= 3 this forces mu_C in k, so over Q only C <= 2 occurs, and the classes over Q come from E.7/rational-galois-descent.
- Well-definedness is modulo torsion and symbols with both entries constant, as in Bloch (10.1.2).

Construction or proof:

1. Obtain rho and f_a from E.7/principal-divisors-on-rational-torsion.
2. Apply E.7/bloch-correction to (rho, f_a).
3. Well-definedness: two corrections differ by an element of the image of k(E)^x tensor k^x lying in the kernel of the tame symbol, which is the image of the kernel of div tensor Id; that kernel is generated by k^x tensor k^x and torsion (Tor(Pic(E), k^x)). Changing rho or f_a by constants changes C{rho, f_a} by symbols {c, h}, absorbed in the same way.
4. Non-example (integrality of the definition): for C = 2, E: y^2 = x^3 - x over Q, a = (0,0), rho = 1/y, f_a = x, the tame values of {rho, f_a} are -1 at (0,0), 1 at (1,0), -1 at (-1,0), 1 at O, whose image in Pic(E) tensor Q^x is (1,0) tensor (-1), nonzero; so {rho, f_a} itself admits no correction, and the factor C is needed.
5. Non-example (independence): by DJZ Proposition 4.3, the three symbols attached to three rational points with pairwise torsion differences span a subgroup of rank at most one modulo torsion.

API:

| Declaration | Role | Contract |
| --- | --- | --- |
| `blochRho` | data | A function with divisor (C^2 - 1)(O) - sum over nonzero a in E[C] of (a), under the rationality hypothesis. |
| `torsionFunction` | data | f_a with divisor C(a) - C(O), from Tau Ceti's exists_principal_zsmul_pointPlace_sub_infinity. |
| `blochClass` | constructor | S_a in K2T(E) tensor Z[1/C]. |
| `blochClass_wellDefined` | characterisation | Independence of rho, f_a and the correction modulo torsion and constant symbols. |
| `divisor_blochRho` | simp | The divisor of rho, needed by EllipticRegulators:ER.4. |
| `divisor_torsionFunction` | simp | div f_a = C(a) - C(O). |

Unit tests:

- `blochClass_C2_needs_factor` (non-example): On y^2 = x^3 - x over Q, C = 2, a = (0,0): {1/y, x} has tame values (-1, 1, -1, 1) at ((0,0), (1,0), (-1,0), O) and cannot be corrected by symbols {h, c} with c in Q^x; 2{1/y, x} can.
- `blochClass_not_independent` (non-example): For three rational points P1, P2, P3 with pairwise torsion differences the symbols S1, S2, S3 of DJZ Construction 4.1 span a subgroup of rank at most one of K2T modulo torsion.
- `divisor_blochRho_C2` (computation): For C = 2 on y^2 = x^3 - x, rho = 1/y has divisor 3(O) - ((0,0)) - ((1,0)) - ((-1,0)).
- `blochClass_wellDefined_test` (characterisation): Replacing f_a by c f_a (c in k^x) changes C S_a by an element of the subgroup generated by torsion and {k^x, k^x}.

Acceptance checks:

- S_a is defined in K2T(E) tensor Z[1/C] and is independent of choices modulo torsion and constant symbols.
- For C = 2 on y^2 = x^3 - x, {rho, f_(0,0)} is not correctable but 2{rho, f_(0,0)} is.
- No linear independence of the S_a is claimed; a test records a dependence.

Prerequisites: [`EllipticKTheory:E.7/bloch-correction`](#E7-bloch-correction); [`EllipticKTheory:E.7/principal-divisors-on-rational-torsion`](#E7-principal-divisors-on-rational-torsion); [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); [`EllipticKTheory:E.2/picard-decomposition-and-the-point-group`](#E2-picard-decomposition-and-the-point-group).

Sources: [Bloch.CRM11](https://bookstore.ams.org/crmm-11), Lecture 10, (10.1.2) and the following paragraph, printed p. 76 (supplied scan PDF p. 88); [DJZ.2006](https://arxiv.org/abs/math/0405040), Proposition 4.3(1), p. 8 (arXiv v2).

Atlas planet: **Bloch's elements S_a**.

<a id="E7-transfer-of-certified-classes"></a>

### Transfer along a constant-field extension, with the norm-residue formula

`EllipticKTheory:E.7/transfer-of-certified-classes` · theorem

Let L/k be a finite extension, E_L = E x_k L, and N: K_2(L(E)) -> K_2(k(E)) the transfer for the finite extension L(E)/k(E) (a field extension because E is geometrically integral). For every place P of k(E), tame_P(N beta) = product over the places Q of L(E) above P of N_(k(Q)/k(P))(tame_Q(beta)). Hence N maps K2T(E_L) to K2T(E), a certificate for beta over L yields one for N beta over k with the residues computed by the norms, and N(res gamma) = [L:k] gamma, N{f, c} = {N f, c} for c in k^x.

Hypotheses and conventions:

- E is geometrically integral over k, so L(E) = L tensor_k k(E) is a field of degree [L:k] over k(E).
- The formula is the norm-residue formula of K2SymbolsBrauer:T.3/transfer-and-norm-residue applied to the place P of k(E) and the places of L(E) above it.

Construction or proof:

1. Import the transfer and the norm-residue formula from K2SymbolsBrauer:T.3/transfer-and-norm-residue.
2. Identify the places of L(E) above P with the closed points of E_L above P, with residue fields k(Q) finite over k(P).
3. Deduce the statements on kernels, certificates and the projection formula.

Acceptance checks:

- For E: y^2 = x^3 - 2x over Q and L = Q(sqrt 2), beta = {x - sqrt 2, y} has N beta = {x^2 - 2, y}. At the degree-two place Q2 = {x^2 = 2, y = 0} of E, with x0 the class of x (x0^2 = 2), tame_Q2(N beta) = 1/x0 = x0/2; the places of E_L above Q2 are (sqrt 2, 0) and (-sqrt 2, 0), where tame(beta) = 1/4 and -2 sqrt 2, and transporting the second along sqrt 2 -> -x0 gives the product (1/4)(2 x0) = x0/2 (PARI, checker C).
- N o res = multiplication by [L:k] on K_2(k(E)).

Prerequisites: `K2SymbolsBrauer:T.3/transfer-and-norm-residue`; [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); [`EllipticKTheory:E.3/naturality-for-finite-transfer`](#E3-naturality-for-finite-transfer).

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Remark III.6.3.1, PDF p. 242 (printed p. 234); [Bloch.CRM11](https://bookstore.ams.org/crmm-11), Exercise 10.1.2, printed p. 76.

<a id="E7-rational-galois-descent"></a>

### Galois descent for K2T of an elliptic curve, rationally and integrally

`EllipticKTheory:E.7/rational-galois-descent` · theorem

Let L/k be a finite Galois extension with group G. Restriction res: K2T(E) -> K2T(E_L)^G satisfies N o res = [L:k] and res o N = sum over sigma in G of sigma. Hence the kernel and the cokernel of res: K2T(E) -> K2T(E_L)^G are killed by [L:k], and res tensor Q: K2T(E) tensor Q -> (K2T(E_L) tensor Q)^G is an isomorphism with inverse N/[L:k]. In particular a G-invariant certified class over L (for instance a G-stable combination of the S_a) descends, rationally, to the class N(beta)/[L:k] over k. The descent does NOT give integrality in the sense of E.6: a descended class need not lie in the integral part, which is a separate vertical condition.

Hypotheses and conventions:

- L/k finite Galois; E geometrically integral.
- The integral (Z-coefficient) statement is only up to [L:k]-torsion; no claim of surjectivity or non-surjectivity is made integrally beyond that bound.

Construction or proof:

1. res o N = sum of sigma on K_2(L(E)): L(E)/k(E) is Galois with group G, and f^* f_* = sum of g for a Galois extension (K-book Ex. IV.6.13).
2. N o res = [L:k] (projection formula; K2SymbolsBrauer:T.3/transfer-and-norm-residue).
3. Both maps preserve the kernels of the tame symbols (E.7/transfer-of-certified-classes and K-book Remark III.6.3.1).
4. Deduce the bounds and the rational isomorphism; record the integrality non-example (DGJK, u = 1/3: alpha is defined over Q, hence Galois-invariant after any base change, and no nonzero multiple is integral).

Acceptance checks:

- res tensor Q is an isomorphism onto the G-invariants.
- A G-invariant class need not be integral (E.6).

Prerequisites: [`EllipticKTheory:E.7/transfer-of-certified-classes`](#E7-transfer-of-certified-classes); `K2SymbolsBrauer:T.3/transfer-and-norm-residue`; [`EllipticKTheory:E.7/integral-certificates`](#E7-integral-certificates).

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Exercise IV.6.13, PDF p. 335 (printed p. 327); [DJZ.2006](https://arxiv.org/abs/math/0405040), Remark 4.14, p. 11 (arXiv v2).

<a id="layer-e8"></a>

## E.8: public interfaces and worked examples

The public interface aggregates the curve K₀–K₃ calculation and symbol APIs.
The worked examples supply actual curves, functions, closed points and vertical
components. They distinguish a corrected horizontal symbol, a non-rational
residue whose norm is one, and an unramified class with a nontrivial vertical
obstruction. Infinite order and regulator values are separate regulator targets.


<a id="E8-worked-example-certificate"></a>

### Worked example: a certified symbol on y^2 = x(x+1)(x+16)

`EllipticKTheory:E.8/worked-example-certificate` · application

Let E_4: y^2 = x(x+1)(x+16) over Q (conductor 15; torsion Z/4 x Z/2), v = (x+16)/y, w = (4 - xv)/(4 + xv), h = (4(x+1)+y)/(x+4) and alpha = {v, w} + {-1, h}. Divisors: (v) = ((-16,0)) - ((0,0)) - ((-1,0)) + (O); (w) = ((-4,-12)) + ((4,20)) - ((-4,12)) - ((4,-20)); (h) = ((-1,0)) + ((4,-20)) - ((-4,-12)) - (O). A certificate for alpha has support S = {O, (0,0), (-1,0), (-16,0), (4,20), (4,-20), (-4,12), (-4,-12)}; the tame values of {v, w} there are -1, 1, -1, 1, 1, -1, 1, -1 and those of {-1, h} the same, so every tame value of alpha is 1. Nontriviality: alpha is not in the image of K_2(Q): the specialisations at P = (0,0) and Q = (-16,0) (defined on the kernel of the tame symbol at those places) give 0 and {-1, 5}, and {-1, 5} is nonzero in K_2(Q) because its tame symbol at 5 is -1. That alpha is of infinite order is a regulator statement owned by EllipticRegulators.

Hypotheses and conventions:

- Tame symbols in K2SymbolsBrauer's convention.
- Specialisation at a place R is the map on the kernel of tame_R to K_2(k(R)) of K2SymbolsBrauer:T.3/higher-milnor-residues; it agrees on constants, so a class in the image of K_2(Q) has equal specialisations at two rational points.

Construction or proof:

1. Exhibit the divisors (each of degree zero, so exhaustive) and the valuations at the eight points.
2. Exhibit the tame values; the value at O also follows from the other seven by E.7/reciprocity-determines-the-last-rational-point.
3. Compute the specialisations: h(P) = w(P) = 1 gives 0 at P; h(Q) = 5 and w(Q) = 1 give {-1, 5} at Q.

Acceptance checks:

- All eight tame values of alpha equal 1 (verified in PARI by checker C for u = 2, 4 and 1/3).
- {-1, 5} is nonzero in K_2(Q).

Prerequisites: [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); [`EllipticKTheory:E.7/reciprocity-determines-the-last-rational-point`](#E7-reciprocity-determines-the-last-rational-point); `K2SymbolsBrauer:T.3/higher-milnor-residues`; `K2SymbolsBrauer:T.5/k2-of-the-rationals`; [`EllipticKTheory:E.6/the-regular-proper-model`](#E6-the-regular-proper-model); [`EllipticKTheory:E.6/vertical-residues`](#E6-vertical-residues).

Sources: [DGJK.2026](https://arxiv.org/abs/2605.11100), Proposition 10.2(1) and its proof, pp. 29-30 (arXiv v1); [DGJK.2026](https://arxiv.org/abs/2605.11100), Section 10, after Remark 10.3, p. 31 (arXiv v1).

<a id="E8-worked-example-nonrational-residue"></a>

### Worked example: a residue at a closed point of degree two

`EllipticKTheory:E.8/worked-example-nonrational-residue` · application

On E: y^2 = x^3 + 1 over Q (36a1), the symbol {y - 3, x} is supported on (2,3), the closed point Z = {x^2 + 2x + 4 = 0, y = 3} of degree two with residue field Q(x0) = Q(sqrt(-3)), (0,1), (0,-1) and O. Its tame values are 1/2, 1/x0 = -x0/4 - 1/2, -2, -4 and 1; N_(Q(x0)/Q)(1/x0) = 1/4 and the normed product is (1/2)(1/4)(-2)(-4)(1) = 1, while the product of the values with x0 read as -1 + sqrt(-3) is -1 - sqrt(-3), not 1. Moreover {x - 1, -1} has tame value -1 (norm 1) at the degree-two point {x = 1, y^2 = 2} and value one elsewhere, so it is not in the kernel of the tame symbol although every normed value is one.

Hypotheses and conventions:

- Tame symbols in K2SymbolsBrauer's convention; residue fields as TauCeti.Place.ResidueField.

Construction or proof:

1. Exhibit the divisors: div(y - 3) = ((2,3)) + Z - 3(O), div(x) = ((0,1)) + ((0,-1)) - 2(O).
2. Exhibit the local parameters and leading units and compute the five tame values.
3. Check the normed product (K2SymbolsBrauer:T.4/weil-reciprocity) and the failing unnormed product.

Acceptance checks:

- The values listed (verified in PARI by checker C).
- The unnormed product is not 1; the normed product is 1.

Prerequisites: [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); [`EllipticKTheory:E.7/reciprocity-determines-the-last-rational-point`](#E7-reciprocity-determines-the-last-rational-point); `tauceti:TauCeti.Place.normResidue`.

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.3, PDF p. 244 (printed p. 236).

<a id="E8-worked-example-bad-fibre"></a>

### Worked example: integrality at a split multiplicative fibre

`EllipticKTheory:E.8/worked-example-bad-fibre` · application

(a) Positive: on 11a3, y^2 + y = x^3 - x^2 (minimal discriminant -11, type I_1 split multiplicative at 11, good elsewhere), the minimal Weierstrass model over Z is regular and proper, every fibre is irreducible, and x, y have order zero along every fibre; hence {x, y} + {-1, x} has an integral certificate with S' = {11}. (b) Negative: for u = 1/3 and E: y^2 = x(x+1)(x+1/9) (type I_4 split multiplicative at 3), alpha = {v, w} + {-1, h} (with u = 1/3) has a certificate, but on the model 3(V^2-Z^2)(W^2-Z^2) + 4VWZ^2 = 0 the local ring at the generic point eta of the component V = 0 of the fibre at 3 is a discrete valuation ring with uniformiser 3, v has order 1 and w order 0 there, and the vertical tame value of {v, w} is the class of 1/w, of infinite order in F_3(w)^x; so no nonzero multiple of alpha is integral. Only split multiplicative primes can give such a failure rationally.

Hypotheses and conventions:

- Integrality is membership in the kernel of all codimension-one tame symbols of a regular proper model (E.6/vertical-residues).
- For (b), a regular proper model maps to the displayed normal model and is an isomorphism over the regular point eta.

Construction or proof:

1. (a) Regularity of the minimal Weierstrass model at the node of the I_1 fibre (v(Delta) = 1) and at good fibres; orders along fibres are zero.
2. (b) From the equation, 4vw = -3(v^2 - 1)(w^2 - 1) with w and (v^2 - 1)(w^2 - 1) units at eta, so v is 3 times a unit and the maximal ideal is (3); compute the tame value.
3. Record why the prime must be split multiplicative: at good, additive and non-split fibres K_1' of the fibre is torsion (Young, Theorem 3.3), so the vertical conditions hold after multiplying by an integer.

Acceptance checks:

- (a) holds with S' = {11}.
- (b): T_eta(m alpha) is not 1 for every nonzero integer m.

Prerequisites: [`EllipticKTheory:E.7/integral-certificates`](#E7-integral-certificates); [`EllipticKTheory:E.6/vertical-residues`](#E6-vertical-residues); [`EllipticKTheory:E.6/the-regular-proper-model`](#E6-the-regular-proper-model).

Sources: [DGJK.2026](https://arxiv.org/abs/2605.11100), Proof of Proposition 10.2(2), p. 30 (arXiv v1); [Young.1995](https://etheses.durham.ac.uk/id/eprint/5114/1/5114_2567.PDF), Theorem 3.3, printed p. 41.

<a id="E8-the-completion-criterion"></a>

### The completion criterion as a checklist of nodes

`EllipticKTheory:E.8/the-completion-criterion` · application

For every elliptic curve E over a field k covered by E.1 (and, for the integral items, k a number field), the roadmap is complete when the following items are supplied, each by the node named: (1) K_0, ..., K_3 of E, of its function field and of its residue fields from one K-theory functor on schemes: GeneralAlgebraicKTheory:K.1 with SchemeKTheoryOperations:S.2, applied to E.1/the-elliptic-curve-as-a-scheme; (2) the degree-zero computation: E.2/K0-of-an-elliptic-curve; (3) localisation: E.3/localisation-sequence-for-a-curve and E.3/the-tame-symbol-boundary; coniveau: E.4/the-coniveau-spectral-sequence-of-a-curve and E.4/the-third-K-group-of-a-curve; (4) functoriality: E.5/pullback-and-pushforward and E.5/projection-formula-and-isogenies; (5) the rational symbol interface: E.7/symbol-certificates, E.7/bloch-classes, E.7/transfer-of-certified-classes, E.7/rational-galois-descent; (6) the arithmetic-integral symbol interface: E.6/the-integral-part, E.6/vertical-residues, E.7/integral-certificates; (7) the three worked examples: E.8/worked-example-certificate, E.8/worked-example-nonrational-residue, E.8/worked-example-bad-fibre. No item asserts finite generation of, or an explicit abstract-group classification of, any K-group of an elliptic curve over a number field.

Hypotheses and conventions:

- Items (1)-(5) for E over any field covered by E.1; item (6) for k a number field.
- The same functor in (1) is what makes the maps in (3)-(6) comparable.

Construction or proof:

1. For each item, cite the node and check that its statement supplies the item.
2. Record the items that rest on imports: (1) and the Adams operations of E.4.

Acceptance checks:

- Every item names at least one node and each named node's statement supplies it.
- No finite generation or classification over a number field is claimed.

Prerequisites: `GeneralAlgebraicKTheory:K.1`; `SchemeKTheoryOperations:S.2`; [`EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`](#E1-the-elliptic-curve-as-a-scheme); [`EllipticKTheory:E.2/K0-of-an-elliptic-curve`](#E2-K0-of-an-elliptic-curve); [`EllipticKTheory:E.3/localisation-sequence-for-a-curve`](#E3-localisation-sequence-for-a-curve); [`EllipticKTheory:E.3/the-tame-symbol-boundary`](#E3-the-tame-symbol-boundary); [`EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve`](#E4-the-coniveau-spectral-sequence-of-a-curve); [`EllipticKTheory:E.4/the-third-K-group-of-a-curve`](#E4-the-third-K-group-of-a-curve); [`EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`](#E4-adams-operations-and-the-weight-decomposition); [`EllipticKTheory:E.5/pullback-and-pushforward`](#E5-pullback-and-pushforward); [`EllipticKTheory:E.5/projection-formula-and-isogenies`](#E5-projection-formula-and-isogenies); [`EllipticKTheory:E.6/the-integral-part`](#E6-the-integral-part); [`EllipticKTheory:E.6/vertical-residues`](#E6-vertical-residues); [`EllipticKTheory:E.7/symbol-certificates`](#E7-symbol-certificates); [`EllipticKTheory:E.7/integral-certificates`](#E7-integral-certificates); [`EllipticKTheory:E.7/bloch-classes`](#E7-bloch-classes); [`EllipticKTheory:E.7/rational-galois-descent`](#E7-rational-galois-descent); [`EllipticKTheory:E.8/worked-example-certificate`](#E8-worked-example-certificate); [`EllipticKTheory:E.8/worked-example-nonrational-residue`](#E8-worked-example-nonrational-residue); [`EllipticKTheory:E.8/worked-example-bad-fibre`](#E8-worked-example-bad-fibre).

Sources: [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem VI.6.7, PDF p. 513 (printed p. 505).

## Completion and suggested signatures

The E.8 core interface and worked examples are accompanied by the full E.5
positive-degree finite-field results and the E.6 arithmetic minimal-model
theorems. Completion requires the actual supplier interfaces, the declared API
and tests, and proofs of the targets above. A route to a supplier alone does not
close a mathematical gap. The unresolved E.5 producer obligations are collected
in the [handoff](../handoff/ASM-EllipticKTheory.md).

The [suggested Lean file](../suggested/EllipticKTheory.lean) combines the
signatures and expressible tests. The shared arithmetic carrier and its generic
projection are defined once. The parent signature forms use supplier variables;
their admitted statements are specifications to instantiate with the suppliers'
actual maps and laws, not theorems for arbitrary contravariant functors. The E.5
point subgroup uses actual Mathlib point and field-map types. E.6 compares to
the actual pinned TauCeti local-model API. Missing scheme K-theory, coefficient,
cohomology, Tate and geometric-test interfaces remain named comments, with
their contracts above. These comments and admitted proofs claim no implementation.

The machine-readable specifications are the
[parent packet](../packets/EllipticKTheory.json),
[E.5 packet](../packets/EllipticKTheory--E.5.json) and
[E.6 packet](../packets/EllipticKTheory--E.6.json). They preserve node IDs,
source editions, baseline declarations and supplier requests. Compilation and
assembly validation are recorded in the handoff rather than as mathematical
completion claims.
