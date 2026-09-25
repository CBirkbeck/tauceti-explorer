# EllipticKTheory — E.1 to E.8

The blueprint for the whole roadmap: the scheme, its K-groups in degrees zero
through three, functoriality, arithmetic models and certified symbol classes.
This document is definitive; the packet
`research/blueprint/packets/EllipticKTheory.json` is its machine form and the
suggested Lean file is a naming proposal, not an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The source

One book:

> Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
> <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>,
> SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, accessed 2026-09-24.

The file was already on disk from this session's earlier jobs and was re-hashed; the hash reproduces the value recorded by six other packets of this programme.

Sections read:

- II.8.5, the Projective Bundle Theorem (PDF p. 148), in degree zero.
- III.6.5.3, the Weil Reciprocity Formula with the first step of its proof, and III.7.5.1, its Milnor form (PDF pp. 235 and 247): the tame symbols of a rational function field, the reciprocity they satisfy and the residue-field norms that appear in it.
- V.6.6 with the Dedekind-domain discussion and Corollary 6.6.2 (PDF pp. 408 to 409): the localisation sequence with its transfer maps, and the degree-two row.
- V.3.5.3, the projection formula with the construction of its two sides (PDF p. 425).
- V.6.13, 6.13.1 and 6.13.2 (PDF p. 416): the projective line and the homotopy invariance statements for a regular noetherian base.
- VI.6, complete (PDF pp. 501 to 505): Harder's Theorem 6.1, the geometric computation 6.4 with its Galois module structure and its finite-coefficient form, the arithmetic computation 6.7 by descent, and the function-field companion 6.8 with its reciprocity sequence.
- NOT read: the proofs of VI.6.4 and VI.6.7, which go through the motivic spectral sequence of VI.4; the blow-up formulas and the theory of arithmetic surfaces, which are not in this book; and the elliptic symbol construction the E.7 stage text attributes to Bloch, whose source was not obtained.

There is **no integrated decomposition** for this roadmap.

## What the pinned libraries already have

`AUDIT-28` records E.2 as *partly built* and the rest as *not built*. Every
claim was checked against the declaration index. Cited, never re-planned:

- `mathlib:AlgebraicGeometry.Scheme` (`Mathlib/AlgebraicGeometry/Scheme.lean`) — Schemes; the projective spectrum of a graded ring is a scheme at the pin, which is what makes E.1's construction available.
- `mathlib:AlgebraicGeometry.Scheme.functionField` (`Mathlib/AlgebraicGeometry/FunctionField.lean`) — The function field of an irreducible scheme; E.1 compares it with the function field of the Weierstrass equation.
- `mathlib:CommRing.Pic` (`Mathlib/RingTheory/PicardGroup.lean`) — The Picard group of a commutative ring; the scheme-level line-bundle classes are only a monoid at the pin, which E.2 records.
- `mathlib:WeierstrassCurve` (`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`) — Weierstrass equations in affine, projective and Jacobian coordinates; the input of E.1, which turns one into a scheme.
- `mathlib:WeierstrassCurve.Affine.Point` (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean`) — The point group of a Weierstrass curve with its group law, fully built; E.1 compares it with the scheme-valued points and E.2 uses it as the third summand of the zeroth K-group.
- `tauceti:AlgebraicGeometry.Scheme.Modules.eulerCharBelow` (`TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean`) — The Euler characteristic of a sheaf of modules on a scheme over a field, additive on short exact sequences; E.2 makes it a map out of the zeroth K-group.
- `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` (`TauCeti/AlgebraicGeometry/LineBundle/Class.lean`) — Line-bundle classes on a scheme, as a commutative MONOID; the group structure is part of what E.2 needs and does not have.
- `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor` (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean`) — Weil divisors on a scheme with their cycle map, the divisor side of E.2 and E.3.
- `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.degreeSplitForward` (`TauCeti/AlgebraicGeometry/WeilDivisor/Degree/Splitting.lean`) — The degree splitting of the divisor class group at a weight-one rational point, proved in greater generality than the elliptic case; the other half of E.2's Picard decomposition.
- `tauceti:TauCeti.ExactK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — The Grothendieck group of an exact category, the pinned degree-zero object; no K-group of a SCHEME exists at the pins.
- `tauceti:TauCeti.Isogeny` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean`) — The function-field isogeny theory the layer treats as given; E.1 compares it with scheme morphisms.
- `tauceti:TauCeti.Isogeny.degree` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean`) — The degree of an isogeny, which E.5 shows is the RANK of the class governing the pull-push composite, not the composite itself.
- `tauceti:WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass` (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/DivisorClass.lean`) — The identification of the points of a Weierstrass curve with the degree-zero divisor classes of its function field, proved and complete; E.2 cites it rather than reproving it, and the roadmap does not record it.

Absent at both pins: **the scheme itself** — no elliptic curve is produced as an
`AlgebraicGeometry.Scheme` anywhere — and with it every K-group of a scheme, the
localisation sequence, the tame symbol, `SK₁`, the coniveau tower, Adams
operations, and any arithmetic model. The pinned scheme-level Picard object is
not even a group.

## E.1 — The scheme and the existing elliptic-curve carriers

**No elliptic curve is a scheme at the pins.** `grep -rn Scheme` over both
libraries' elliptic-curve directories returns nothing; the pinned projective
model is a quotient of a point set. So this layer builds the scheme, its
geometric properties and its function field, and compares the existing
function-field isogeny theory — which Tau Ceti has in full — with scheme
morphisms.

**The zero morphism is not in that comparison**: it induces no embedding of
function fields, and it gets its own treatment.

Coverage: **source_decomposed**.

Four nodes. The scheme itself, built as the projective spectrum of the graded quotient with its two standard charts and its section at infinity, because no elliptic curve is a scheme anywhere at the pins and the pinned projective model is a quotient of a point set; its geometric properties, smoothness, properness, geometric connectedness and regularity, with the note that regularity does not imply smoothness, which E.6 needs; the identification of its function field with the one the existing elliptic-curve development uses, which is what makes every statement of E.3 a statement about the existing interface; and the comparison of the existing function-field isogenies with scheme morphisms, matching degree, separability, kernels and pullbacks, with the ZERO morphism treated separately because it induces no embedding of function fields. The Tau Ceti modular-curves roadmap owns the same construction over an arbitrary base and is filed as the supplier.

### The smooth projective scheme of a Weierstrass equation

`EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme` · *construction* · planet **The elliptic curve as a scheme**

For a Weierstrass equation over a field, construct the closed subscheme of the projective plane it cuts out, with its section at infinity. The construction is by the projective spectrum of the graded quotient ring, and the two standard affine charts are the spectra of the corresponding affine coordinate rings. Mathlib has the projective spectrum of a graded ring as a scheme and has Weierstrass curves in affine, projective and Jacobian coordinates, but NO elliptic curve is ever produced as a scheme: the projective model there is a quotient of a point set. This node builds the scheme and the section, and the Tau Ceti roadmap on modular curves owns the same construction over an arbitrary base, which is recorded as the supplier.

**Hypotheses.**

- The equation is a Weierstrass equation over a field with non-vanishing discriminant, which is Mathlib's elliptic-curve condition.
- The section at infinity is the point with the standard homogeneous coordinates, and it is part of the data, not a consequence.
- The construction is over a field here; the Tau Ceti modular-curves roadmap does it over an arbitrary base ring, and this node imports that where it is available.

**Proof outline.**

1. Form the graded quotient of the polynomial ring in three variables by the homogeneous Weierstrass equation and take its projective spectrum.
2. Exhibit the two standard affine charts and identify their coordinate rings with the affine Weierstrass ring and with the ring of the chart at infinity.
3. Construct the section at infinity as a morphism from the base and check that it lands in the second chart.
4. Record the pinned material on both sides: the projective spectrum as a scheme, and the Weierstrass equation with its coordinate ring.
5. Record the supplier for the same construction over a base: the modular-curves roadmap's layer on elliptic curves over a base scheme, which also proves properness and smoothness.

**Acceptance.**

- The two affine charts cover the scheme, and their equations are the classical ones.
- The section at infinity is a morphism from the base and is disjoint from the affine chart.
- No elliptic curve exists as a scheme at the pins; the pinned projective model is a quotient of a point set and is not a scheme.

**Prerequisites.** `mathlib:WeierstrassCurve`, `mathlib:AlgebraicGeometry.Scheme`, `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor`

**API.**

| name | role | statement |
| --- | --- | --- |
| `EllipticScheme` | data | The projective scheme of a Weierstrass equation. |
| `EllipticScheme.charts` | characterisation | The two affine charts with their coordinate rings. |
| `EllipticScheme.zeroSection` | data | The section at infinity. |
| `EllipticScheme.cover` | compatibility | The charts cover the scheme. |
| `EllipticScheme.ofBase` | relation | The construction over an arbitrary base, imported from the modular-curves roadmap. |

**Used by.**

- *E.2 and E.3* — Every K-group in this roadmap is a K-group of this scheme.
- *E.6* — The arithmetic model is a scheme over the S-integers whose generic fibre is this one.
- *The consumer roadmaps* — EllipticRegulators and SpecialValuesBirchTate speak of the K-theory of this scheme.

**Unit tests.**

- `charts_cover` — The two standard charts cover the scheme.
- `affine_chart_equation` — The first chart is the spectrum of the affine Weierstrass ring.
- `section_disjoint` — The section at infinity does not meet the affine chart.
- `not_pinned` — No elliptic curve is a scheme at the pins; a formalisation that used the pinned point-set model would not have a scheme.

**Sources.**

- VI.6, the opening of the curve sections (PDF p. 501), The object this roadmap works with throughout; the source assumes the scheme and computes its K-theory, which is why this layer has to build it.

  > Let X be a smooth projective curve over a finite field of characteristic p.

### Smoothness, properness, geometric connectedness and regularity

`EllipticKTheory:E.1/geometric-properties-of-the-curve` · *theorem*

The scheme of the previous node is smooth and proper over the base, geometrically connected, and regular; it is a curve, that is of dimension one. Smoothness comes from the non-vanishing of the discriminant through the Jacobian criterion on each chart; properness from the closed immersion into the projective plane; geometric connectedness from the irreducibility of the defining equation over the algebraic closure; and regularity from smoothness over a field. None of these is available at the pins, where nonsingularity is a pointwise condition on a Weierstrass point and there is no scheme to carry the properties.

**Hypotheses.**

- The discriminant of the equation is non-zero, which is the elliptic condition.
- Properness is over the base field; the closed immersion into the projective plane is the one of the previous node.
- Regularity follows from smoothness over a field and is stated separately because the arithmetic models of E.6 are regular without being smooth.

**Proof outline.**

1. Prove smoothness chart by chart from the Jacobian criterion, using the discriminant.
2. Prove properness from the closed immersion into the projective plane and the properness of projective space.
3. Prove geometric connectedness from the irreducibility of the Weierstrass equation over the algebraic closure.
4. Deduce regularity from smoothness over a field, and record that the converse fails, which is what E.6 will need.
5. Record that the pinned nonsingularity is a pointwise condition on a point of the Weierstrass curve and is not any of these.

**Acceptance.**

- The curve is smooth, proper, geometrically connected and regular of dimension one.
- Regularity does not imply smoothness over a non-perfect base, which E.6 uses.
- The pinned pointwise nonsingularity is not a scheme-theoretic smoothness statement.

**Prerequisites.** `EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`

**Sources.**

- VI.6.1, Harder’s Theorem (PDF p. 501), The hypotheses this node supplies, verbatim: every theorem of the roadmap about a curve assumes smooth and projective.

  > Harder's Theorem 6.1. Let X be a smooth projective curve over a finite field of characteristic p. For n >= 1, each K_n(X) is a finite group of order prime to p.

### The function field of the scheme and of the Weierstrass equation agree

`EllipticKTheory:E.1/the-function-field-of-the-curve` · *comparison*

The function field of the scheme, that is the local ring at its generic point, is the fraction field of the affine coordinate ring of the Weierstrass equation, which is the function field the existing elliptic-curve development uses. Both objects exist at the pins and are never compared, because the scheme does not exist there. This node states the comparison, which is what makes every statement of E.3 about the K-theory of the function field a statement about the existing function-field API.

**Hypotheses.**

- The scheme is the one of the first node and is integral, so it has a generic point and a function field.
- The affine coordinate ring is the quotient of the polynomial ring in two variables by the affine Weierstrass equation, which is a Dedekind domain.
- The comparison is an isomorphism of fields over the base, natural in the base field.

**Proof outline.**

1. Identify the generic point of the scheme with the generic point of the affine chart.
2. Identify the local ring there with the fraction field of the affine coordinate ring.
3. Record the pinned function field of an irreducible scheme and the pinned function field of a Weierstrass curve, and state that the comparison is what is missing.
4. Record the consequence: places, divisors and valuations of the function field, which the function-field roadmap owns, transport to the scheme.

**Acceptance.**

- The two function fields agree, over the base field.
- Places of the function field correspond to closed points of the scheme, with the point at infinity corresponding to the place at infinity.
- The comparison is natural in the base field.

**Prerequisites.** `EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`, `mathlib:AlgebraicGeometry.Scheme.functionField`, `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor`

**Sources.**

- VI.6.8 (PDF p. 504), The source passes freely between the curve and its function field, which is exactly the comparison this node supplies, verbatim.

  > Theorem 6.8. If F is the function field of a smooth projective curve X over F_q, then for all i >= 1: F_q in F induces an isomorphism K_{2i+1}(F_q) = K_{2i+1}(F), and there is an exact reciprocity sequence: 0 -> K_{2i}(X) -> K_{2i}(F) -> (+)_{x in X} K_{2i-1}(F_q(x)) -> K_{2i-1}(F_q) -> 0.

### Isogenies as morphisms of schemes, including the zero morphism

`EllipticKTheory:E.1/isogenies-as-scheme-morphisms` · *comparison*

The existing isogeny theory is developed on function fields: an isogeny is an embedding of function fields with a degree, a separability condition, a kernel and a differential. A non-zero isogeny corresponds to a finite morphism of the schemes, and under that correspondence the degree, separability, kernel, pullback of divisors and pullback of the invariant differential match. The ZERO morphism is not covered, because it does not induce an embedding of function fields; it must be handled separately, and this node says so rather than leaving a gap in the correspondence.

**Hypotheses.**

- The curves are the schemes of the first node over the same base field.
- A non-zero isogeny is a non-constant morphism preserving the origin; the correspondence with function-field embeddings is contravariant.
- The zero morphism is the constant morphism to the origin, which is a perfectly good morphism of schemes and is not in the image of the correspondence.

**Proof outline.**

1. Construct the morphism of schemes attached to a function-field embedding, using that both schemes are regular projective curves.
2. Prove that the degree of the morphism is the degree of the field extension, which is the pinned isogeny degree.
3. Match separability, the kernel as a group scheme, the pullback of divisors and the pullback of the invariant differential.
4. Treat the zero morphism separately and record that it has degree zero, empty function-field data, and pulls every divisor back to zero.
5. Record the pinned function-field isogeny theory, which the layer treats as given, and state that the scheme side is what is missing.

**Acceptance.**

- A non-zero isogeny corresponds to a finite morphism of schemes, with matching degree and separability.
- The zero morphism is not in that correspondence and must be given its own definition and properties.
- Pullback of divisors and of the invariant differential match under the correspondence.

**Prerequisites.** `EllipticKTheory:E.1/the-function-field-of-the-curve`, `tauceti:TauCeti.Isogeny`, `tauceti:TauCeti.Isogeny.degree`

**Sources.**

- VI.6.4 (PDF p. 503), The source works with morphisms of curves and their base changes throughout; this node supplies the correspondence with the existing function-field development that the roadmap names as given.

  > Theorem 6.4. Let X be a smooth projective curve over F_q, and set Xbar = X (x) Fbar_q. Then for all n >= 0 we have isomorphisms of Galois modules: ...

## E.2 — K₀ of a curve and of an elliptic curve

`K₀(E) ≅ ℤ ⊕ ℤ ⊕ E(F)`, as a **group**, with the chosen origin.

**Half of this layer is already proved in Tau Ceti and the roadmap does not say
so.** `pointEquivDegreeZeroDivisorClass` identifies the points of a Weierstrass
curve with the degree-zero divisor classes of its function field, and
`OrderSystem.degreeSplitForward` splits the class group by degree at a rational
point — in greater generality than the elliptic case. Both are cited here.

Two warnings the stage text makes: the right-hand side is **not a product ring**
(the multiplication comes from the tensor product and is transported
separately), and a Galois-invariant geometric line-bundle class **need not**
descend.

Coverage: **source_decomposed**.

Four nodes. The rank-determinant isomorphism, imported from KTheoryLowDegrees with the two class formulas this layer uses fixed; the degree, the Euler characteristic and the pushforward to the base, with Tau Ceti's pinned additive Euler characteristic cited and made a map out of the K-group; the Picard decomposition with the identification of the degree-zero part with the point group, where BOTH halves are pinned in Tau Ceti and carry no incomplete proofs and the roadmap does not record it; and the resulting group description of the zeroth K-group of an elliptic curve, stated as a GROUP isomorphism with the chosen origin, with the tensor-product multiplication transported separately so that the right-hand side is not read as a product ring, and with the descent warning about Galois-invariant geometric classes.

### The zeroth K-group of a curve by rank and determinant

`EllipticKTheory:E.2/K0-of-a-curve` · *comparison*

For a connected regular noetherian curve the rank and the determinant give an isomorphism from the zeroth K-group onto the direct sum of the integers and the Picard group. The statement is owned by KTheoryLowDegrees, which proves it with the structure-sheaf and skyscraper class formulas; this node imports it and fixes the two formulas the rest of the layer uses, that the class of the structure sheaf has rank one and trivial determinant and that the class of a skyscraper at a closed point has rank zero and determinant the class of that point. Neither the zeroth K-group of a scheme nor a rank or determinant map exists at the pins, and the pinned Picard object for schemes is only a commutative monoid.

**Hypotheses.**

- The curve is connected, regular and noetherian, with the finiteness assumptions the owner states.
- The Picard group is the group of isomorphism classes of line bundles; the pinned scheme-level object is a monoid and the group structure is part of what is missing.
- The isomorphism is by rank and determinant and is natural for pullback along a morphism of such curves.

**Proof outline.**

1. Record the owner and the imported statement.
2. Fix the two class formulas, for the structure sheaf and for a skyscraper at a closed point.
3. Record the pinned material: Tau Ceti's Grothendieck group of finitely generated projectives over a ring in the affine case, Mathlib's Picard group of a commutative ring, and the fact that the scheme-level line-bundle classes form only a monoid.
4. State the naturality used later, for pullback along a finite morphism and along an open immersion.

**Acceptance.**

- The class of the structure sheaf has rank one and trivial determinant.
- The class of a skyscraper at a closed point has rank zero and determinant the class of that point.
- The isomorphism is natural for pullback.
- Nothing of this exists at the pins; even the Picard object for schemes is not a group there.

**Prerequisites.** `KTheoryLowDegrees:Z.5`, `EllipticKTheory:E.1/geometric-properties-of-the-curve`, `mathlib:CommRing.Pic`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`, `tauceti:TauCeti.ExactK0`

**Sources.**

- VI.6.7 (PDF p. 504), The degree-zero statement for a curve, verbatim.

  > Theorem 6.7. Let X be the smooth projective curve corresponding to a global field F over F_q. Then K_0(X) = Z (+) Pic(X), and the finite groups K_n(X) for n > 0 are given by: ...

### The degree map, the Euler characteristic and pushforward to the base

`EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward` · *construction*

On a proper curve over a field the degree of a line bundle, the Euler characteristic of a coherent sheaf and the pushforward of a K-class to the base are three closely related maps, and the layer needs all three. The Euler characteristic is additive on short exact sequences, so it factors through the zeroth K-group; the degree is its non-constant part, normalised by Riemann-Roch; and the pushforward to the base is the map induced by the structure morphism, which in degree zero is the Euler characteristic. Tau Ceti has the Euler characteristic of a sheaf of modules on a scheme over a field with its additivity, and the degree of a scheme Weil divisor relative to a morphism, and neither is a map out of a K-group.

**Hypotheses.**

- The curve is proper over a field and the sheaves are coherent; additivity of the Euler characteristic needs properness through the finiteness of the cohomology.
- The degree is normalised so that the class of a rational point has degree one.
- The pushforward exists because the structure morphism is proper and perfect, which E.5 states in general.

**Proof outline.**

1. Record the pinned Euler characteristic with its additivity and the pinned relative degree of a divisor.
2. Deduce that the Euler characteristic factors through the zeroth K-group, by additivity.
3. Define the degree of a line bundle and prove Riemann-Roch in the form that relates it to the Euler characteristic and the genus.
4. Define the pushforward to the base and identify it in degree zero with the Euler characteristic.
5. Record the class formulas of the previous node in terms of these maps, so that a computation can be carried out numerically.

**Acceptance.**

- The Euler characteristic is additive and factors through the zeroth K-group.
- The class of a rational point has degree one.
- The pushforward of the class of the structure sheaf is the Euler characteristic of the structure sheaf, which for an elliptic curve is zero.

**Prerequisites.** `EllipticKTheory:E.2/K0-of-a-curve`, `tauceti:AlgebraicGeometry.Scheme.Modules.eulerCharBelow`, `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor`

**API.**

| name | role | statement |
| --- | --- | --- |
| `degree` | data | The degree of a line bundle on a proper curve. |
| `eulerChar` | data | The Euler characteristic of a coherent sheaf, which factors through the zeroth K-group. |
| `eulerChar_additive` | characterisation | Additivity on short exact sequences. |
| `pushforwardToBase` | data | The pushforward of a K-class along the structure morphism. |
| `riemannRoch` | characterisation | The relation between the degree, the Euler characteristic and the genus. |
| `degree_point` | example | A rational point has degree one. |

**Used by.**

- *E.2, the elliptic computation* — The degree splitting of the Picard group is stated with this degree.
- *E.3, the localisation sequence* — The bottom row of the sequence ends in the degree map onto the integers.
- *E.5, the projection formula* — The pushforward of this node is the one the formula is about.

**Unit tests.**

- `point_degree_one` — A rational point has degree one.
- `structure_sheaf_elliptic` — On an elliptic curve the Euler characteristic of the structure sheaf is zero.
- `additive` — The Euler characteristic is additive on short exact sequences.
- `factors_through_K0` — It factors through the zeroth K-group, which is what makes it a K-theoretic invariant.

**Sources.**

- VI.6.7, the statement for a curve (PDF p. 504), The splitting whose two components are the rank and the determinant; the degree and the Euler characteristic of this node are how the second is computed.

  > Then K_0(X) = Z (+) Pic(X)

### The Picard group of an elliptic curve and its degree-zero part

`EllipticKTheory:E.2/picard-decomposition-and-the-point-group` · *theorem*

On an elliptic curve with a rational origin the degree splits the Picard group as the direct sum of the degree-zero part and the integers, and the degree-zero part is canonically the group of points of the curve, the class of a point P corresponding to the class of the divisor P minus the origin. BOTH halves are proved in Tau Ceti with no incomplete proofs: the degree splitting for an order system with a weight-one rational point, in greater generality than the elliptic case, and the identification of the points of a Weierstrass curve over a field with the degree-zero divisor classes of its function field. The roadmap does not record this, and the audit says so; this node cites both.

**Hypotheses.**

- The curve is an elliptic curve over a field with its rational origin; the origin is used twice, once for the splitting and once for the identification.
- The identification is with the degree-zero divisor classes of the FUNCTION FIELD, which by E.1 are the degree-zero classes of the scheme.
- The splitting depends on the chosen origin and is not canonical without it.

**Proof outline.**

1. Record the pinned degree splitting and its hypothesis, a weight-one rational point.
2. Record the pinned identification of the point group with the degree-zero divisor classes, with the computation rule sending an affine point to the class of the difference of the point and the origin.
3. Transport both across the comparison of E.1 to obtain the statement for the scheme.
4. Record the dependence on the origin and that no canonical splitting exists without it.

**Acceptance.**

- The Picard group is the direct sum of the point group and the integers, with the chosen origin.
- The class of a point corresponds to the class of the point minus the origin.
- Both halves are pinned in Tau Ceti and are cited, not reproved.
- Without a rational origin the splitting does not exist.

**Prerequisites.** `EllipticKTheory:E.2/K0-of-a-curve`, `tauceti:WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`, `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.degreeSplitForward`, `mathlib:WeierstrassCurve.Affine.Point`

**Sources.**

- VI.6.4 (PDF p. 503), The shape of the answer in degree zero for a curve over an algebraically closed field, with the Jacobian as the third summand; over the base field the Jacobian is replaced by the point group, which is the content of this node.

  > K_n(Xbar) = Z (+) Z (+) J(Xbar), n = 0

### The zeroth K-group of an elliptic curve

`EllipticKTheory:E.2/K0-of-an-elliptic-curve` · *theorem*

Combining the rank-determinant isomorphism with the Picard decomposition, the zeroth K-group of an elliptic curve with a rational origin is the direct sum of two copies of the integers and the group of points. This is an isomorphism of GROUPS, with the chosen origin; the multiplication induced by the tensor product is a separate structure and the right-hand side is not to be read as a product ring. And the identification of the geometric Picard group with the point group is over the base field: a Galois-invariant class of a geometric line bundle need not come from a line bundle over the base, and the descent obstruction must be controlled before any such identification is made.

**Hypotheses.**

- The curve is elliptic over a field with a rational origin; the rationality of the origin is used in the Picard comparison and again in descent.
- The isomorphism is of abelian groups; the ring structure induced by the tensor product is transported separately and is not the product ring structure.
- The descent statement is about the map from classes over the base field to Galois-invariant geometric classes, which is injective but need not be surjective.

**Proof outline.**

1. Combine the two previous nodes to obtain the group isomorphism.
2. Transport the tensor-product multiplication and write out what it is on the three summands, so that it is visible that the answer is not a product ring.
3. State the descent warning with the obstruction named: the cokernel of the map to Galois-invariant classes is measured by a Brauer-group term, and a class is in the image only when that obstruction vanishes.
4. Record the sanity check over an algebraically closed field, where the source's own computation gives the same shape with the Jacobian in place of the point group.

**Acceptance.**

- The zeroth K-group is two copies of the integers plus the point group, as a group, with the chosen origin.
- The tensor product induces a multiplication that is not the product ring structure on the right-hand side.
- A Galois-invariant geometric line-bundle class need not be defined over the base field.

**Prerequisites.** `EllipticKTheory:E.2/picard-decomposition-and-the-point-group`, `EllipticKTheory:E.2/K0-of-a-curve`, `KTheoryLowDegrees:Z.5`

**Sources.**

- VI.6.4 (PDF p. 503), The geometric statement, verbatim; this node is its arithmetic counterpart, with the descent warning that the source does not need because it works with the Galois module.

  > Theorem 6.4. Let X be a smooth projective curve over F_q, and set Xbar = X (x) Fbar_q. Then for all n >= 0 we have isomorphisms of Gal(Fbar_q/F_q)-modules: K_n(Xbar) = Z (+) Z (+) J(Xbar), n = 0; ...

## E.3 — Localisation in degrees zero through three

One sequence over **all** closed points, not just the rational ones, with the
tame symbol as its degree-two boundary in the symbols roadmap's convention.

**The kernel of the tame symbol is the image of `K₂(X)`, not `K₂(X)`.** Over a
number field the residue groups are torsion, so the map is injective
rationally; over a finite field they vanish, so it is injective integrally.
Both are comparison theorems with inputs, not definitional identifications.

Coverage: **source_decomposed**.

Four nodes. The localisation sequence over ALL closed points in the displayed range, with the transfers out of the residue-field terms and the classical divisor sequence as its bottom row; the identification of the degree-two boundary with the tame symbol of the symbols roadmap, in that roadmap's order and sign convention, imported rather than reproved; naturality for open immersions and finite maps, with the ramification index for pullback and the residue-field norm for transfer; and the node the stage text demands, that the kernel of the tame symbol is the IMAGE of the curve's second K-group and not the group, with the two comparison theorems that repair it — torsion residue groups over a number field, giving rational injectivity, and vanishing residue groups over a finite field, giving integral injectivity — each stated with its input.

### The localisation sequence of a curve in degrees zero through three

`EllipticKTheory:E.3/localisation-sequence-for-a-curve` · *theorem* · planet **The localisation sequence of a curve**

For a smooth integral curve with function field the localisation sequence runs over ALL closed points, not only the rational ones, and in low degrees reads: from the third K-group of the curve to that of the function field, then to the sum of the second K-groups of the residue fields, then to the second K-group of the curve, then to that of the function field, then by the tame symbol to the sum of the unit groups of the residue fields, then to the first K-group of the curve, then to the multiplicative group of the function field, then by the divisor map to the free group on the closed points, then to the zeroth K-group, then by the degree to the integers and onto zero. Exactness holds at every term. The maps into the sums are the residues; the maps out are the transfers.

**Hypotheses.**

- The curve is smooth and integral over a field; the closed points are all of them, with residue fields finite over the base but not necessarily equal to it.
- The sequence is the Dedekind-domain localisation sequence of the general roadmap, glued over the affine charts, together with the identification of the generic stalk with the function field.
- The bottom row is the classical divisor sequence, whose terms Tau Ceti has for function fields.

**Proof outline.**

1. Obtain the sequence from Quillen's localisation theorem for the abelian category of coherent sheaves and the Serre subcategory of those with finite support, and identify the quotient with the modules over the function field.
2. Identify the terms in each degree, with the residue fields of the closed points appearing one degree down.
3. Identify the boundary in degree two with the tame symbol of the symbols roadmap, with the same order and sign convention, which is what the stage text requires.
4. Identify the boundary in degree one with the divisor map and the tail with the degree map onto the integers.
5. Record the surjectivity of the degree map for a curve with a rational point, and what replaces it in general.

**Acceptance.**

- The sequence is exact at every displayed term.
- The boundary in degree two is the tame symbol, with the convention fixed in the symbols roadmap.
- The bottom row is the classical divisor sequence.
- The sum is over ALL closed points; restricting to rational points breaks exactness.

**Prerequisites.** `EllipticKTheory:E.1/the-function-field-of-the-curve`, `EllipticKTheory:E.2/K0-of-a-curve`, `GeneralAlgebraicKTheory:K.3`, `SchemeKTheoryOperations:S.3`

**Sources.**

- V.6.6, Dedekind Domains (PDF pp. 408 to 409), The affine form of the sequence, verbatim; the projective curve is obtained by gluing it over the charts.

  > Hence the localization sequence of 6.1 with S = R - {0} becomes the long exact sequence: ... K_{n+1}(F) -> (+)_p K_n(R/p) -> K_n(R) -> K_n(F) -> ... Here p runs over the nonzero prime ideals of R, and the maps (i_p)_* are the transfer maps.

- VI.6.8 (PDF p. 504), The projective form over a finite field, verbatim, in which the sum runs over all closed points and ends with the norm to the base.

  > there is an exact reciprocity sequence: 0 -> K_{2i}(X) -> K_{2i}(F) -> (+)_{x in X} K_{2i-1}(F_q(x)) -> K_{2i-1}(F_q) -> 0.

### The boundary in degree two is the tame symbol

`EllipticKTheory:E.3/the-tame-symbol-boundary` · *comparison*

The boundary from the second K-group of the function field to the sum of the unit groups of the residue fields is, at each closed point, the tame symbol of the symbols roadmap: the sign times the residue of the ratio of the two functions raised to each other's valuations. The convention — the order of the arguments and the sign — is fixed there and this roadmap uses it unchanged; the two must agree, because the certificates of E.7 are conditions on the values of this map. The symbols roadmap also proves that the tame symbol agrees with the connecting map of the localisation sequence, which is exactly this statement, so it is imported rather than reproved.

**Hypotheses.**

- The point is a closed point of the curve with its discrete valuation on the function field.
- The convention is the one of the symbols roadmap, and this node states it explicitly so that a reader can check agreement.
- The residue field may be larger than the base field, and the symbol lands in its unit group, not in that of the base.

**Proof outline.**

1. State the tame symbol at a closed point in the fixed convention.
2. Record the two statements imported from the symbols roadmap, the definition with its independence of the uniformiser and the identification with the connecting map.
3. Record the Steinberg relation, which is what makes the symbol well defined on the second K-group.
4. Record the consequence for E.7: a certificate is a finite list of closed points at which the symbol is computed together with a proof that it is trivial everywhere else.

**Acceptance.**

- The boundary is the tame symbol in the fixed convention.
- The symbol lands in the unit group of the residue field, which may be larger than the base field.
- The identification with the connecting map is imported, not reproved here.

**Prerequisites.** `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `K2SymbolsBrauer:T.3:symbols`, `K2SymbolsBrauer:T.3:localization-comparison`

**Sources.**

- III.6.5.3, the Weil Reciprocity Formula (PDF p. 235), The tame symbols of a rational function field with the reciprocity they satisfy, verbatim; E.7 turns this into the certificate condition.

  > Since the symbol (f, g)_infinity vanishes on K_2(F), it must be expressable in terms of the tame symbols d_p(f, g) = (f, g)_p. The appropriate reciprocity formula first appeared in Weil's 1940 paper on the Riemann Hypothesis for curves: (f, g)_infinity times the product over p of N_p (f, g)_p = 1 in F^x. In Weil's formula, N_p denotes the usual norm map.

### Naturality for open immersions and finite maps

`EllipticKTheory:E.3/naturality-of-the-sequence` · *lemma*

The sequence is natural for an open immersion, where the terms at the removed points simply disappear, and for a finite map of curves, where the residue-field terms are related by norms and the multiplicities are the ramification indices. Concretely: for a finite map the pullback commutes with the residues up to the ramification index at each point above, and the transfer commutes with them up to the residue-field norm. Both statements are used in E.5 and again in E.7, where a class is constructed over an extension and pushed down.

**Hypotheses.**

- The open immersion is the inclusion of the complement of a finite set of closed points; the finite map is a finite morphism of smooth integral curves.
- The ramification index is the valuation of a uniformiser of the target at a point above, and the residue-field norm is the usual one.
- Naturality is asserted for the whole sequence, which is what makes a diagram chase legitimate.

**Proof outline.**

1. State naturality for an open immersion and read off the effect on each term.
2. State the compatibility of pullback with the residues, with the ramification index as the multiplicity.
3. State the compatibility of transfer with the residues, with the residue-field norm.
4. Record the two consequences the later layers use: a class supported away from a set may be computed after removing that set, and a class constructed over an extension descends by transfer with a computable effect on residues.

**Acceptance.**

- Pullback multiplies residues by the ramification index.
- Transfer composes residues with the residue-field norm.
- The sequence is natural for both kinds of map, and the diagrams commute.

**Prerequisites.** `EllipticKTheory:E.3/the-tame-symbol-boundary`, `K2SymbolsBrauer:T.3:symbols`

**Sources.**

- III.6.5.3 (PDF p. 235), The norms that appear in the reciprocity formula are exactly the transfers of this node, verbatim.

  > In Weil's formula, N_p denotes the usual norm map (F[t]/p)^x -> F^x.

### The kernel of the tame symbol is the image, not the group

`EllipticKTheory:E.3/what-the-sequence-does-not-identify` · *comparison*

Exactness says that the kernel of the tame-symbol map on the second K-group of the function field is the IMAGE of the second K-group of the curve. It is not the second K-group of the curve itself unless that map is injective, which is a separate theorem. Over a number field each residue second K-group is torsion, so the map becomes injective after tensoring with the rationals; over a finite field each is zero, so it is injective integrally. Both are comparison theorems with their own hypotheses, and neither is a definitional identification; the stage text says so and this node states both with their inputs.

**Hypotheses.**

- The curve is smooth and integral; the base is a number field in the first statement and a finite field in the second.
- Over a number field the residue fields are number fields and their second K-groups are torsion, which is a theorem of the arithmetic roadmap.
- Over a finite field the second K-group of a finite field vanishes, which is Quillen's computation.

**Proof outline.**

1. State exactness and what it gives.
2. State the rational injectivity over a number field, with the torsion input named.
3. State the integral injectivity over a finite field, with the vanishing input named.
4. State the non-example: without such an input the kernel is only the image, and a formalisation that identified the two would be asserting the injectivity for free.
5. Record where the injectivity is used later, namely in the definition of the integral part of E.6 and in the certificates of E.7.

**Acceptance.**

- Over a finite field the map from the curve to the function field is injective in degree two.
- Over a number field it is injective after tensoring with the rationals.
- In general the kernel of the tame symbol is only the image, and the identification is a theorem.

**Prerequisites.** `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `ArithmeticKTheory:N.3`, `GeneralAlgebraicKTheory:K.1`

**Sources.**

- VI.6, the opening of the finite-field section (PDF p. 501), The finite-field case, verbatim; the source can write the kernel as the group because over a finite field the residue terms vanish, which is exactly the hypothesis this node isolates.

  > the kernel K_2(X) of the boundary is finite of order prime to p

## E.4 — K₁, SK₁ and the coniveau description of K₃

The curve's `SK₁` is the kernel of `K₁(X) → F(X)ˣ`, equivalently the cokernel of
the tame-symbol map. **It is not the stable-matrix `SK₁` of an affine ring**,
which shares the name.

The coniveau sequence of a curve has **two columns**, and the node keeps the
**left filtration term** — dropping it is the error the stage text names, and
the `K₃` description is an extension between two graded pieces, not a kernel.

Coverage: **source_decomposed**.

Four nodes. The image of the first K-group in the function field and the special first K-group of the curve, defined as its kernel and identified with the cokernel of the tame-symbol map, with the constant-unit splitting and with the explicit warning that this is NOT the stable-matrix invariant of an affine ring; the two-column coniveau spectral sequence with its filtration, its comparison with the localisation sequence, and its LEFT filtration term kept, whose omission the stage text names as the error; the third K-group as the extension between the two graded pieces, with the note that the kernel description alone is a subquotient; and the Adams operations with the rational weight eigenspaces, exported as eigenspaces with their finite-coefficient versions and base-change maps, with the non-example that no integral decomposition exists.

### The first K-group of a curve and its special subgroup

`EllipticKTheory:E.4/K1-and-SK1-of-a-curve` · *definition* · planet **The special first K-group of a curve**

For a proper geometrically connected curve whose zeroth cohomology of the structure sheaf is the base field, the image of the first K-group in the multiplicative group of the function field is exactly the multiplicative group of the base field. The SPECIAL first K-group of the curve is defined as the kernel of that map, and by exactness of the localisation sequence it is the cokernel of the tame-symbol map from the second K-group of the function field into the sum of the residue-field unit groups. The constant units split off, and a rational base point gives a compatible splitting. This invariant is a CURVE invariant and must be kept apart from the stable-matrix special first K-group of an affine ring, which is a different object with the same name.

**Hypotheses.**

- The curve is proper and geometrically connected with the stated cohomology condition, which is what forces the image to be the constants.
- The definition is as a kernel; the identification with a cokernel is exactness and is part of the statement.
- The stable-matrix invariant of an affine ring is the kernel of the determinant on the first K-group of the ring, which is not this group.

**Proof outline.**

1. Prove that the image of the first K-group in the multiplicative group of the function field is the constants, using properness and the cohomology condition.
2. Define the special subgroup as the kernel and identify it with the cokernel of the tame-symbol map.
3. Prove the constant-unit splitting and the compatibility with a rational base point.
4. Record the distinction from the stable-matrix invariant, with the two definitions side by side.
5. Record the value in the two computed cases: over a finite field the first K-group of the curve is two copies of the unit group of the base field, so the special subgroup is one copy.

**Acceptance.**

- Over a finite field the first K-group of the curve is two copies of the unit group of the field, so the special subgroup is one of them.
- The special subgroup is the cokernel of the tame-symbol map, by exactness.
- The constant units split off.
- This is not the stable-matrix invariant of an affine ring.

**Prerequisites.** `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.1/geometric-properties-of-the-curve`, `KTheoryLowDegrees:U.4`

**API.**

| name | role | statement |
| --- | --- | --- |
| `curveK1Image` | characterisation | The image of the first K-group in the function field is the constants. |
| `curveSK1` | data | The special first K-group of the curve. |
| `curveSK1_eq_coker` | characterisation | Its identification with the cokernel of the tame-symbol map. |
| `curveSK1_split` | compatibility | The constant-unit splitting. |
| `curveSK1_basepoint` | compatibility | Compatibility with a rational base point. |
| `curveSK1_ne_stableSK1` | relation | It is not the stable-matrix invariant of an affine ring. |

**Used by.**

- *E.5, the finite-field computation* — The computation there gives the value of both groups.
- *E.7, the certificates* — A certificate produces a class in the second K-group whose residues vanish; the cokernel description says what is left over.
- *EllipticRegulators* — The regulator is defined on classes that this description locates.

**Unit tests.**

- `finite_field_value` — Over a finite field the first K-group is two copies of the unit group of the base.
- `constants_split` — The constant units split off.
- `is_cokernel` — The special subgroup is the cokernel of the tame-symbol map.
- `not_stable_SK1` — It is not the stable-matrix invariant; the two disagree already for an affine curve with non-trivial class group.

**Sources.**

- VI.6.7 (PDF p. 504), The value in degree one over a finite field, verbatim: two copies of the K-group of the base field, whose degree-one case is its unit group.

  > the finite groups K_n(X) for n > 0 are given by: K_n(X) = K_n(Xbar)^G = K_n(F_q) (+) K_n(F_q), n odd

### The two-column coniveau spectral sequence of a curve

`EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve` · *construction* · planet **The two-column coniveau sequence**

A curve has codimension zero and one only, so its coniveau spectral sequence has two columns: the first is the K-theory of the function field and the second is the sum over closed points of the K-theory of the residue fields, shifted by one. The associated filtration on each K-group of the curve has two steps, and the resulting exact sequences are exactly the localisation sequence of E.3. This node constructs the spectral sequence, its filtration and the comparison, and it keeps the LEFT filtration term, whose omission is the error the stage text names.

**Hypotheses.**

- The curve is smooth and integral over a field, so that the coniveau filtration has two steps.
- The general coniveau and support filtration is owned by MotivicEtaleKTheory; this node states the two-column case and the comparison.
- The filtration is by codimension of support, and its left term is the part supported in codimension one, which is not zero.

**Proof outline.**

1. Record the general construction and its owner.
2. Write out the two columns for a curve and the differentials between them.
3. Identify the associated graded pieces and the two-step filtration on each K-group.
4. Prove that the resulting exact sequences agree with the localisation sequence of E.3, which is what makes the two descriptions interchangeable.
5. State the non-example: dropping the left filtration term gives a sequence that is not exact, and the third K-group description of the next node depends on keeping it.

**Acceptance.**

- The spectral sequence has two columns and degenerates at the second page for degree reasons in the relevant range.
- Its exact sequences agree with the localisation sequence.
- The left filtration term is not zero and may not be dropped.

**Prerequisites.** `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `MotivicEtaleKTheory:M.6a`

**API.**

| name | role | statement |
| --- | --- | --- |
| `coniveauPage` | data | The second page of the two-column spectral sequence. |
| `coniveauFiltration` | data | The two-step filtration on each K-group of the curve. |
| `coniveau_eq_localisation` | compatibility | Agreement with the localisation sequence. |
| `coniveauFiltration_left` | projection | The left filtration term, which is not zero. |
| `coniveau_degenerate` | characterisation | Degeneration in the relevant range. |

**Used by.**

- *E.4, the third K-group* — The description of that group is read off this sequence.
- *E.4, the weight decomposition* — The Adams eigenspaces are compared with the filtration.
- *E.6* — The integral part is defined by a map of these sequences for the model and the generic fibre.

**Unit tests.**

- `two_columns` — A curve has exactly two columns; a surface would have three.
- `agrees_with_localisation` — The exact sequences agree with those of E.3.
- `left_term_nonzero` — The left filtration term is not zero; dropping it breaks exactness.
- `degenerates` — The sequence degenerates in the range where the two descriptions are used.

**Sources.**

- VI.6.7, the proof (PDF p. 504), The source computes the K-theory of a curve by a spectral sequence that degenerates, which is the pattern this node makes explicit in the coniveau form, verbatim.

  > It suffices to calculate the l-primary part K_{n+1}(X; Z/l^infinity) of K_n(X). But this follows from the motivic spectral sequence (4.2), which degenerates by 6.6.

### The third K-group of a curve from the two-column sequence

`EllipticKTheory:E.4/the-third-K-group-of-a-curve` · *theorem*

The third K-group of a smooth integral curve sits in an exact sequence between the cokernel of the residue map from the fourth K-group of the function field into the sum of the third K-groups of the residue fields, and the kernel of the residue map from the third K-group of the function field into the sum of the second K-groups of the residue fields. Both ends are needed: the description as a kernel alone is the associated graded of the filtration, not the group. The maps agree with those of the localisation sequence, and the field's indecomposable contribution is distinguished from the extra geometry of the curve by the weight decomposition of the next node.

**Hypotheses.**

- The curve is smooth and integral over a field.
- The sequence is the one of the two-step filtration, so its two ends are the two graded pieces.
- The indecomposable part of the third K-group of a field is the quotient by the image of the Milnor K-group, which K3BlochGroups owns.

**Proof outline.**

1. Write the two graded pieces of the filtration in degree three.
2. Identify the lower piece with the cokernel of the residue from degree four and the upper with the kernel of the residue from degree three.
3. Assemble the exact sequence and check that its maps are those of the localisation sequence.
4. Record the non-example: taking only the kernel gives the graded piece, not the group, and the extension is the content.
5. Record the comparison with the field: the indecomposable third K-group of the function field maps into this group, and the difference is the geometry of the curve, which the weight decomposition of the next node separates.

**Acceptance.**

- The third K-group sits in the displayed exact sequence with both ends.
- The kernel description alone gives a subquotient, not the group.
- The maps agree with the localisation sequence.
- The field's indecomposable part is not the whole of the curve's third K-group.

**Prerequisites.** `EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve`, `K3BlochGroups:V.4`

**Sources.**

- VI.6.4 (PDF p. 503), The geometric answer in odd degrees, verbatim; over the base field the extension this node keeps is what produces the arithmetic answer of VI.6.7.

  > K_n(Xbar) = (mu^{(i)}) (+) (mu^{(i)}), n = 2i-1 > 0

### Adams operations and the weight components

`EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition` · *comparison*

The Adams operations of the scheme roadmap act on the K-theory of the curve, and rationally they decompose each group into weight eigenspaces, on which the k-th operation acts by the k-th power of the weight. The layer exports the weight components as actual eigenspaces or subquotients, together with their finite-coefficient versions and the base-change maps, rather than as a formal decomposition; and it uses them to separate the indecomposable contribution of the function field from the extra geometry of the curve. The operations, the eigenvalue statement and the rational projectors are owned by the scheme roadmap, and the rational motivic comparison by the motivic one.

**Hypotheses.**

- The decomposition into eigenspaces is rational; integrally the operations act but the projectors need not exist.
- The eigenvalue statement is that the k-th operation acts on the weight-j part by the k-th power of j, which is the owner's theorem.
- The finite-coefficient versions are needed because the groups of interest are often torsion, and the base-change maps because the constructions of E.7 pass through extensions.

**Proof outline.**

1. Record the operations and the eigenvalue theorem with their owner.
2. Record the rational projectors and the resulting eigenspace decomposition.
3. State the finite-coefficient versions and the base-change compatibility.
4. Apply the decomposition to the third K-group and identify which weight carries the indecomposable contribution of the function field.
5. Record the non-example: integrally there is no eigenspace decomposition, and a formalisation that produced one would be wrong.

**Acceptance.**

- Rationally each K-group decomposes into weight eigenspaces.
- Integrally no such decomposition exists in general.
- The decomposition is compatible with base change and with finite coefficients.
- The indecomposable part of the function field's third K-group sits in a single weight.

**Prerequisites.** `EllipticKTheory:E.4/the-third-K-group-of-a-curve`, `SchemeKTheoryOperations:S.6`, `MotivicEtaleKTheory:M.6a`

**Sources.**

- VI.6.4 (PDF p. 503), The finite-coefficient statements with their twists, verbatim; the twists are the weights this node exports.

  > For l not p, the l-primary subgroup of K_{n-1}(Xbar) is isomorphic to K_n(Xbar; Z/l^infinity), n > 0, whose Galois module structure is given by: K_n(Xbar; Z/l^infinity) = Z/l^infinity(i) (+) Z/l^infinity(i), n = 2i >= 0; J(Xbar)_l(i-1), n = 2i-1 > 0.

## E.5 — Functoriality and initial examples

**`f_*f^*(a) = [f_*O_X]·a`, not `deg(f)·a`.** For an isogeny that class has rank
the degree, but equals its rank only under a proved condition. The stage text
calls this the qualification that matters, and it is stated as one.

Then the two worked computations: `P¹` by the projective bundle theorem, and a
curve over a finite field — Harder's finiteness, the geometric computation with
its Galois module structure, and descent, giving `K₁(E/F_q) ≅ F_qˣ ⊕ F_qˣ`.
**Not** a consequence of the finite-field calculation alone.

Coverage: **source_decomposed**.

Four nodes. Pullback for arbitrary morphisms and pushforward for proper morphisms of finite Tor-dimension, with the agreement with the module-theoretic transfer for a finite flat map; the projection formula with the isogeny composite stated CORRECTLY, as multiplication by the class of the pushed-forward structure sheaf, whose rank is the degree but which is not the degree times the unit in integral K-theory, together with the two conditions under which the simplification is available; the projective line by the projective bundle theorem, in degree zero and in higher degrees; and the complete computation for a curve over a finite field, with Harder's finiteness, the geometric computation with its Galois module structure, the descent, the value in degree one and the statement that the computation does not follow from the K-theory of a finite field alone.

### Pullback for arbitrary morphisms and pushforward for proper perfect morphisms

`EllipticKTheory:E.5/pullback-and-pushforward` · *construction* · planet **Pullback and pushforward**

K-theory of schemes is contravariant for arbitrary morphisms, by pullback of perfect complexes, and covariant for proper morphisms of finite Tor-dimension, by derived pushforward. For a finite flat morphism the pushforward is the transfer attached to the module structure, so the scheme-level and ring-level constructions agree. The scheme roadmap owns both constructions; this node records them, fixes which hypotheses each needs, and states the agreement for finite flat maps, which is what the isogeny computation of the next node uses.

**Hypotheses.**

- Pullback needs no hypothesis beyond being a morphism of schemes, once K-theory is defined by perfect complexes.
- Pushforward needs properness and finite Tor-dimension; for a finite flat morphism both hold.
- The agreement with the ring-level transfer is for a finite flat morphism of affine schemes and is the statement that the two constructions give the same map.

**Proof outline.**

1. Record the two constructions and their owner.
2. State the hypotheses of each separately, since the layer uses pullback for maps that are not proper.
3. State the agreement with the module-theoretic transfer for a finite flat morphism.
4. Record the functoriality of each and the compatibility of pushforward with base change along a flat map.
5. Record that nothing of this exists at the pins, because the K-theory of a scheme does not.

**Acceptance.**

- Pullback is functorial for arbitrary morphisms.
- Pushforward is functorial for proper morphisms of finite Tor-dimension.
- For a finite flat morphism the pushforward is the module-theoretic transfer.
- Pushforward along the structure morphism of a proper curve is the Euler characteristic in degree zero.

**Prerequisites.** `EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward`, `SchemeKTheoryOperations:S.4`, `GeneralAlgebraicKTheory:K.3`

**API.**

| name | role | statement |
| --- | --- | --- |
| `KPullback` | data | Pullback along an arbitrary morphism. |
| `KPushforward` | data | Pushforward along a proper morphism of finite Tor-dimension. |
| `KPullback_comp` | functoriality | Functoriality of pullback. |
| `KPushforward_comp` | functoriality | Functoriality of pushforward. |
| `KPushforward_eq_transfer` | compatibility | Agreement with the module-theoretic transfer for a finite flat morphism. |
| `KPushforward_baseChange` | compatibility | Compatibility with flat base change. |

**Used by.**

- *E.5, the projection formula* — The formula relates the two maps and is the next node.
- *E.6* — The integral part is the image of a pullback along the inclusion of the generic fibre.
- *E.7* — A class constructed over an extension is pushed down by the transfer.

**Unit tests.**

- `finite_flat_agrees` — For a finite flat morphism the pushforward is the transfer.
- `structure_morphism` — Pushforward along the structure morphism of a proper curve is the Euler characteristic in degree zero.
- `pullback_needs_nothing` — Pullback needs no properness hypothesis.
- `pushforward_needs_proper` — Pushforward along an open immersion is not defined; properness is not decorative.

**Sources.**

- V.3.5.3, the projection formula discussion (PDF p. 425), The construction of pullback and pushforward through resolution and their use in the projection formula, verbatim.

  > By the Resolution Theorem, K(L_E) is homotopy equivalent to G(Y). The functor L_E -> M(Y) given by tensoring with the pullback is exact, and induces the map in question. Similarly, the exact functors sending F to its pushforward and to the tensor product with the pullback induce the other two maps.

### The projection formula, and what the isogeny pull-push composite really is

`EllipticKTheory:E.5/projection-formula-and-isogenies` · *theorem*

For a proper morphism of finite Tor-dimension the projection formula says that the pushforward of the product of a pulled-back class with a class upstairs is the product of the first class with the pushforward of the second; taking the second class to be the unit gives that the composite of pushforward after pullback is multiplication by the class of the pushforward of the structure sheaf. For an isogeny that class has rank the degree, but it is NOT the degree times the unit class in general: it equals its rank only when a further condition holds, and the stage text names this as the qualification that matters. This node states the formula, states the composite correctly, and states the conditions under which the simplification to multiplication by the degree is available.

**Hypotheses.**

- The morphism is proper of finite Tor-dimension; an isogeny of elliptic curves is finite flat and satisfies both.
- The class of the pushforward of the structure sheaf lives in the zeroth K-group of the target and has rank the degree of the isogeny.
- The simplification requires that class to equal its rank, which holds rationally and in the cases named, and is a condition to be proved, not assumed.

**Proof outline.**

1. State the projection formula and record its owner.
2. Specialise the second argument to the unit and obtain the composite formula with the class of the pushforward of the structure sheaf.
3. Compute the rank of that class as the degree of the isogeny.
4. State the non-example: in integral K-theory the composite is not multiplication by the degree, because the determinant of the class need not be trivial.
5. State the two simplifications: rationally, where the determinant part is killed by the weight decomposition; and in the special elliptic cases where the class is proved to be its rank.
6. Record the use of the corrected formula in the later layers, where a class is transported along an isogeny.

**Acceptance.**

- The composite of pushforward after pullback is multiplication by the class of the pushforward of the structure sheaf.
- That class has rank the degree of the isogeny.
- It is not the degree times the unit in integral K-theory in general.
- Rationally the simplification holds; integrally it needs a proof.

**Prerequisites.** `EllipticKTheory:E.5/pullback-and-pushforward`, `EllipticKTheory:E.1/isogenies-as-scheme-morphisms`, `SchemeKTheoryOperations:S.4`, `tauceti:TauCeti.Isogeny.degree`

**Sources.**

- V.3.5.3, Projection Formula (PDF p. 425), The projection formula with the construction of its two sides, verbatim.

  > Thus it suffices to show that the projection formula holds when x is the class of E in P(f). ... the exact functors sending F to its pushforward and to the tensor product with the pullback induce the maps y -> f_*(y) and y -> x f_*(y).

### The projective line, by the projective bundle theorem

`EllipticKTheory:E.5/the-projective-line-and-the-projective-bundle-theorem` · *theorem*

For a projective space bundle over a quasi-compact scheme the zeroth K-group is a free module over that of the base, with basis the twisting line bundles, and the corresponding statement holds for the higher K-groups of a regular noetherian base. For the projective line over a field this gives that each K-group is two copies of that of the field, with basis the structure sheaf and the twisting sheaf of degree minus one. This is the first worked example of the layer and the pattern the elliptic computation of the next node follows.

**Hypotheses.**

- The bundle is the projectivisation of a vector bundle over a quasi-compact scheme; for the higher statement the base is regular noetherian.
- The basis is the set of twisting line bundles in the stated range, and the module structure is by pullback and tensor product.
- For the projective line the rank is two, which is the length of the basis.

**Proof outline.**

1. State the theorem in degree zero and record the basis.
2. State the higher-degree form for a regular noetherian base, which the source obtains from the localisation sequence and homotopy invariance.
3. Specialise to the projective line over a field and read off the answer in each degree.
4. Record the two classes explicitly and the relation the basis satisfies, so that a computation can be checked.
5. Record the contrast with an elliptic curve, whose zeroth K-group is not free of finite rank over that of the base.

**Acceptance.**

- Each K-group of the projective line over a field is two copies of that of the field.
- The basis is the structure sheaf and the twisting sheaf of degree minus one.
- For an elliptic curve the corresponding statement is false; the point group appears.

**Prerequisites.** `EllipticKTheory:E.5/pullback-and-pushforward`, `SchemeKTheoryOperations:S.4`

**Sources.**

- II.8.5, the Projective Bundle Theorem (PDF p. 148), The theorem in degree zero, verbatim.

  > Projective Bundle Theorem 8.5. Let P be the projective space bundle of E over a quasi-compact scheme X. Then K_0(P) is a free K_0(X)-module with basis the twisting line bundles.

- V.6.13.2 (PDF p. 416), The higher-degree statements for a regular noetherian base, verbatim.

  > Corollary 6.13.2. If X is regular noetherian then for all n: K_n(X) = K_n(X[s]), K_n(X[s, s^{-1}]) = K_n(X) (+) K_{n-1}(X) and K_n(X x P^1) = ...

### The K-theory of an elliptic curve over a finite field

`EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field` · *theorem* · planet **The K-theory of a curve over a finite field**

For a smooth projective curve over a finite field every K-group in positive degree is finite of order prime to the characteristic, and the groups are computed by Galois descent from the geometric ones: in odd degree they are two copies of the K-group of the base field, and in even degree a twisted Galois-invariant part of the torsion of the Jacobian. In degree one this gives two copies of the unit group of the base field. The theorem's proof has three inputs — finite generation, the cohomological computation of the geometric groups, and the Frobenius action — and it is NOT a consequence of the K-theory of a finite field alone, which the stage text says in as many words.

**Hypotheses.**

- The curve is smooth and projective over a finite field; for an elliptic curve the Jacobian is the curve itself.
- The Galois module structure is the one the source computes over the algebraic closure, with the Tate twists.
- The finiteness and the primality to the characteristic are Harder's theorem and are a separate input.

**Proof outline.**

1. Record Harder's theorem, the finiteness with order prime to the characteristic.
2. Record the geometric computation over the algebraic closure, in all four cases, with the twists.
3. Record the descent to the base field and the resulting formulas in odd and even degree.
4. Read off degree one and record that the answer is two copies of the unit group of the base field.
5. Record the reciprocity sequence the source derives for the function field, which links this computation with E.3's sequence.
6. State the non-example: the computation uses finite generation, the geometric computation and the Frobenius action, and does not follow from the K-theory of a finite field.

**Acceptance.**

- Every positive K-group is finite of order prime to the characteristic.
- In degree one the group is two copies of the unit group of the base field.
- In even degree the group is a twisted Galois-invariant part of the torsion of the Jacobian.
- The computation is not a consequence of the finite-field calculation alone.

**Prerequisites.** `EllipticKTheory:E.5/the-projective-line-and-the-projective-bundle-theorem`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.2/K0-of-an-elliptic-curve`

**Sources.**

- VI.6.1, Harder’s Theorem (PDF p. 501), The finiteness input, verbatim.

  > Harder's Theorem 6.1. Let X be a smooth projective curve over a finite field of characteristic p. For n >= 1, each K_n(X) is a finite group of order prime to p.

- VI.6.7 (PDF p. 504), The computation, verbatim.

  > Theorem 6.7. Let X be the smooth projective curve corresponding to a global field F over F_q. Then K_0(X) = Z (+) Pic(X), and the finite groups K_n(X) for n > 0 are given by: K_n(X) = K_n(Xbar)^G = K_n(F_q) (+) K_n(F_q), n odd; the Galois-invariant twisted Jacobian torsion, n = 2i even.

- VI.6.8 (PDF p. 504), The function-field companion with the reciprocity sequence, verbatim.

  > Theorem 6.8. If F is the function field of a smooth projective curve X over F_q, then for all i >= 1: F_q in F induces an isomorphism K_{2i+1}(F_q) = K_{2i+1}(F), and there is an exact reciprocity sequence: 0 -> K_{2i}(X) -> K_{2i}(F) -> (+)_x K_{2i-1}(F_q(x)) -> K_{2i-1}(F_q) -> 0.

## E.6 — Arithmetic surfaces and the integral part

`K₂(E)_{ℤ,ℚ} = im(K₂(𝓔) ⊗ ℚ → K₂(E) ⊗ ℚ)` for a **regular proper flat** model.

**Two models that are not substitutes**: a Néron model is smooth but not proper;
a Weierstrass model is proper but not regular at bad primes. A regular-scheme
comparison theorem applies to neither.

**Two warnings inside the definition**: an unramified symbol on the generic curve
need not be integral on a model, and a rational subspace called an integral part
is not automatically a lattice.

Coverage: **source_decomposed**.

Four nodes. The regular proper flat model with its special fibres, their components and their multiplicities, and with the two non-substitutes named: a Neron model is smooth but not proper, a Weierstrass model is proper but not regular, and a comparison theorem for regular schemes applies to neither; the rational integral part as the image of the rationalised K-theory of the model, with the S-integral variant defined separately and with both of the stage text's warnings built into the definition node, that an unramified symbol need not be integral and that a subspace called an integral part is not automatically a lattice; model independence, by domination and the blow-up formula whose regularity hypotheses are stated; and the vertical-residue description with the codimension-two compatibility and with its own hypotheses, since the equivalence does not hold unconditionally.

### A regular proper flat model over the S-integers

`EllipticKTheory:E.6/the-regular-proper-model` · *construction* · planet **The regular proper model**

For an elliptic curve over a number field, a MODEL over the ring of S-integers is a scheme, proper and flat over that ring, whose generic fibre is the curve; the models this layer uses are REGULAR. Their existence is the resolution theory of arithmetic surfaces, and a minimal regular model exists and is unique up to isomorphism. Two objects that are NOT substitutes are named here: a smooth group scheme of finite type such as the Neron model, which is not proper, and a Weierstrass model, which is proper but singular at bad primes. Using a comparison theorem for regular schemes on either of them is an error, and this node records it as one.

**Hypotheses.**

- The base is the ring of S-integers of a number field and the generic fibre is the elliptic curve of E.1.
- Regular means regular as a scheme, in codimension two as well; the fibres over bad primes are singular curves and that is expected.
- Properness is essential for the pushforward and for the vertical-residue description; the Neron model is smooth but not proper, and the Weierstrass model is proper but not regular.

**Proof outline.**

1. Define a model and state the regularity and properness conditions.
2. Record the existence of a regular proper model and of a minimal one, with their source in the resolution theory of arithmetic surfaces, and state that this roadmap imports them.
3. Record the local charts, the vertical components of the special fibres and their intersection multiplicities, which the next nodes use.
4. State the two non-examples with the property each fails: the Neron model is not proper, the Weierstrass model is not regular.
5. Record the consequence: for a singular model the K-theory comparison of E.2 does not apply and one must use G-theory or resolve first.

**Acceptance.**

- A regular proper flat model exists over the S-integers, and a minimal one is unique.
- The Neron model is not proper and is not a substitute.
- A Weierstrass model is not regular at bad primes and is not a substitute.
- The special fibres are curves over residue fields and may be reducible.

**Prerequisites.** `EllipticKTheory:E.1/geometric-properties-of-the-curve`, `ArithmeticKTheory:N.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `EllipticModel` | structure | A proper flat model over the S-integers with the given generic fibre. |
| `EllipticModel.isRegular` | projection | Regularity of the model. |
| `EllipticModel.minimal` | data | The minimal regular model. |
| `EllipticModel.specialFibre` | data | The fibre over a prime, with its components. |
| `EllipticModel.multiplicity` | data | The multiplicity of a vertical component. |
| `EllipticModel.neron_not_proper` | relation | The Neron model is not proper and is not a model in this sense. |

**Used by.**

- *E.6, the integral part* — The integral part is defined as an image out of the K-theory of this scheme.
- *E.6, the vertical residues* — The description uses the components of the special fibres.
- *E.7* — A certificate for an integral class needs the vertical conditions this model supplies.

**Unit tests.**

- `good_reduction` — At a prime of good reduction the minimal model has a smooth fibre and the Weierstrass model is already regular.
- `bad_reduction` — At a prime of bad reduction the Weierstrass model is singular, so it is not a model in this sense.
- `neron_excluded` — The Neron model is smooth but not proper and is excluded.
- `generic_fibre` — The generic fibre of the model is the given elliptic curve.

**Sources.**

- V.6.13, the base-change discussion for schemes (PDF p. 416), The scheme-theoretic hypotheses the layer works under, verbatim; the arithmetic surface theory itself is not in the source read and is recorded as a gap.

  > Corollary 6.13.1. If X is noetherian, then X x P^1 and X induce homotopy equivalences ...

### The rational integral part of the second K-group

`EllipticKTheory:E.6/the-integral-part` · *definition* · planet **The integral part**

For a model over the full arithmetic base the RATIONAL INTEGRAL PART of the second K-group of the elliptic curve is the image of the rationalised second K-group of the model under the restriction to the generic fibre. The S-integral variant is defined the same way with the model over the S-integers and is a DIFFERENT subspace, so the two are given different names. Two warnings belong to the definition rather than to a remark: an unramified symbol on the generic curve need not be integral on a model, and a rational subspace called an integral part is not automatically a finitely generated lattice; lattice statements are made only where a theorem provides them.

**Hypotheses.**

- The model is a regular proper flat model as in the previous node; the base is the full ring of integers for the first variant and a ring of S-integers for the second.
- Rationalisation is tensoring with the rationals; the integral part is a subspace of a rational vector space, not a subgroup of the integral group.
- The two variants are different: inverting more primes gives a larger image.

**Proof outline.**

1. Define the restriction map from the K-theory of the model to that of the generic fibre and rationalise.
2. Define the integral part as its image and the S-integral variant separately.
3. Prove the elementary containments: the full integral part is contained in every S-integral variant, and enlarging S enlarges the subspace.
4. State the first warning as a non-example: an unramified symbol on the curve, that is one whose tame residues vanish, need not lie in the image from a model.
5. State the second warning: the subspace need not be a lattice, and finite generation is proved only where a theorem gives it, never inferred from the name.
6. Record the use in the regulator roadmap, which evaluates the regulator on this subspace.

**Acceptance.**

- The integral part is a subspace of the rationalised second K-group, not a subgroup of the integral one.
- The S-integral variant contains it and grows with S.
- An unramified symbol need not be integral.
- No lattice property may be asserted without a theorem.

**Prerequisites.** `EllipticKTheory:E.6/the-regular-proper-model`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `EllipticKTheory:E.5/pullback-and-pushforward`

**API.**

| name | role | statement |
| --- | --- | --- |
| `integralPart` | data | The rational integral part for a model over the full base. |
| `integralPartS` | data | The S-integral variant. |
| `integralPart_le` | characterisation | The containment of the first in the second. |
| `integralPartS_mono` | compatibility | Monotonicity in S. |
| `integralPart_not_lattice` | relation | No lattice property is asserted by the definition. |
| `unramified_not_integral` | relation | An unramified symbol need not be integral. |

**Used by.**

- *E.7* — A certificate for a class in the integral part must supply the vertical conditions.
- *EllipticRegulators* — The regulator is evaluated on this subspace, which is why its definition must be fixed here.
- *SpecialValuesBirchTate* — The special-value statements are about this subspace.

**Unit tests.**

- `contained_in_S_variant` — The full integral part is contained in the S-integral variant.
- `monotone_in_S` — The S-integral variant grows with S.
- `unramified_witness` — There is an unramified symbol that is not integral; the two notions are different.
- `no_lattice_claim` — The definition asserts no finite generation; a formalisation that did would be claiming a theorem.

**Sources.**

- VI.6.8 (PDF p. 504), The exactness pattern that makes the image of a proper model the right object to call integral, verbatim, in the geometric case where the base is a finite field; the arithmetic case is the subject of this layer and its source is recorded as a gap.

  > 0 -> K_{2i}(X) -> K_{2i}(F) -> (+)_x K_{2i-1}(F_q(x)) -> K_{2i-1}(F_q) -> 0

### Independence of the model

`EllipticKTheory:E.6/model-independence` · *theorem*

The integral part does not depend on the choice of regular proper model: two such models are dominated by a third and the restriction maps agree, so the images coincide. The proof is by the comparison of regular models through blow-ups and the localisation formulas for a blow-up, with their hypotheses stated. This is what makes the definition of the previous node a definition of an invariant of the curve and of the base, rather than of a chosen model.

**Hypotheses.**

- The models are regular, proper and flat over the same base with the same generic fibre.
- The comparison is by a chain of blow-ups with regular centres, which is where the resolution theory enters.
- The blow-up formula computes the K-theory of a blow-up along a regularly embedded centre and is owned by the scheme roadmap.

**Proof outline.**

1. State the domination of two models by a third and record its source.
2. Record the blow-up formula and its hypotheses.
3. Prove that the restriction maps from the two models have the same image, by comparing both with the third.
4. Record the localisation formula that handles the change of base from the full ring to a ring of S-integers.
5. Record the non-example: for a singular model the argument breaks, because the blow-up formula needs regularity.

**Acceptance.**

- The integral part is independent of the regular proper model chosen.
- The argument needs regularity of the models and of the centres.
- The change from the full base to a ring of S-integers is a localisation and is computed by the localisation formula.

**Prerequisites.** `EllipticKTheory:E.6/the-integral-part`, `SchemeKTheoryOperations:S.4`, `SchemeKTheoryOperations:S.3`

**Sources.**

- V.6.13.1 (PDF p. 416), The prototype of the blow-up computation, verbatim; the blow-up formula proper is owned by the scheme roadmap and is imported.

  > Corollary 6.13.1. If X is noetherian, then the projection and the section induce homotopy equivalences G(X) (+) G(X) -> G(X x P^1).

### The vertical-residue description, and where it applies

`EllipticKTheory:E.6/vertical-residues` · *comparison*

Where the comparison applies, the integral part has an equivalent description as the subspace of classes whose VERTICAL residues vanish: for each prime of the base and each component of the special fibre there is a residue map to the multiplicative group of the residue field of that component, and a class is integral exactly when all of them vanish. The description needs the codimension-two compatibility of the residues and the identification of the components, and it does not apply unconditionally; this node states the description, its hypotheses and the failure mode that the previous node's warning names.

**Hypotheses.**

- The model is regular and proper; the components of the special fibre are the irreducible ones, with their multiplicities.
- The residue at a vertical component is the tame symbol at the discrete valuation of the local ring at the generic point of that component.
- The equivalence with the definition by image holds under the stated hypotheses and is not asserted in general.

**Proof outline.**

1. Define the vertical residue at a component and record the multiplicity that enters it.
2. State the codimension-two compatibility that relates the vertical residues to the horizontal ones.
3. State the equivalence with the image description, with its hypotheses.
4. State the failure mode: without the hypotheses a class with vanishing vertical residues need not be in the image, which is the sharper form of the warning of the definition node.
5. Record how a certificate uses this description: the vertical conditions are finitely many and can be checked component by component.

**Acceptance.**

- A class in the integral part has vanishing vertical residues.
- The converse holds under the stated hypotheses and not in general.
- The residues are indexed by the components of the special fibres, of which there are finitely many.
- The multiplicities of the components enter the residue computation.

**Prerequisites.** `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.6/model-independence`, `EllipticKTheory:E.3/the-tame-symbol-boundary`

**Sources.**

- III.6.5.3 (PDF p. 235), The pattern of a residue condition at every valuation, verbatim; the vertical residues of this node are the same construction at the valuations coming from the components of the special fibres.

  > Since the symbol (f, g)_infinity vanishes on K_2(F), it must be expressable in terms of the tame symbols d_p(f, g) = (f, g)_p.

## E.7 — Certified symbol constructions

A certificate has four fields: divisors, local leading units, triviality of the
product of tame symbols at each point of a **named** finite support, and a proof
that the support is exhaustive. Integral classes carry one vertical condition
per component of each special fibre.

**Weil reciprocity is the consistency condition** — and its residue-field norms
are not optional: without them the formula fails as soon as a closed point has a
bigger residue field, which is exactly what E.8's second worked example tests.

Coverage: **source_decomposed**.

Four nodes. Certificates, defined as a record of four fields — divisors, local leading units, the triviality of the product of tame symbols at each point of a named finite support, and the proof that the support is exhaustive — with the integral variant carrying one vertical condition per component of each special fibre, and with the soundness lemma stated in the sharp form E.3 forces: a certified candidate lands in the IMAGE, and identifying it with a class on the curve is E.3's theorem; Weil reciprocity as the consistency condition, derived from the localisation sequence and with the residue-field norms whose omission makes the formula false; Bloch's construction from rational torsion divisors, stated as the stage text states it with the function obtained from the Riemann-Roch criterion rather than assumed, and with an explicit record that the source proving it was not obtained; and the non-rational case, by transfer with the norm formula and with the descent warning.

### Certificates for a symbol class on an elliptic curve

`EllipticKTheory:E.7/symbol-certificates` · *construction* · planet **Symbol certificates**

A candidate class is a finite sum of symbols of pairs of rational functions on the curve, written in the existing coordinate and function-field interface. A CERTIFICATE for it consists of: the divisors of all the functions involved; the local leading units at every point in the support; a computation showing that the product of the tame symbols is trivial at each such point; and a proof that every point outside a named finite set has all valuations zero, so that the symbol is automatically trivial there. Where the class is required to lie in the integral part of E.6, the certificate also carries the vertical conditions at each component of each special fibre.

**Hypotheses.**

- The functions are non-zero rational functions on the curve, given through the existing function-field interface.
- The finite set is named explicitly and the proof that it contains the whole support is part of the certificate.
- The tame symbol is the one of E.3, in the fixed convention; a certificate in another convention is not a certificate.

**Proof outline.**

1. Define a candidate as a finite formal sum of symbols and record how it is written in the existing interface.
2. Define a certificate as a record of the four fields, with the finite support field carrying the proof of exhaustiveness.
3. Prove the soundness lemma: a candidate with a certificate defines a class in the kernel of the tame-symbol map, hence by E.3 a class in the image of the second K-group of the curve.
4. Record the sharper reading forced by E.3: the certificate gives a class in the IMAGE, and identifying it with a class on the curve needs the injectivity theorem of that node.
5. Extend the definition with the vertical fields for an integral certificate, and prove the corresponding soundness statement against the description of E.6.
6. Record the computational shape: all four fields are finite data, so a certificate is checkable.

**Acceptance.**

- A certificate is finite data and is checkable.
- A certified candidate lies in the kernel of the tame symbol, hence in the image of the curve's second K-group.
- Identifying the class with one on the curve needs the injectivity theorem of E.3, not the certificate alone.
- An integral certificate additionally carries one vertical condition per component of each special fibre.

**Prerequisites.** `EllipticKTheory:E.3/the-tame-symbol-boundary`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `EllipticKTheory:E.6/vertical-residues`, `K2SymbolsBrauer:T.5`

**API.**

| name | role | statement |
| --- | --- | --- |
| `SymbolCandidate` | structure | A finite sum of symbols of rational functions. |
| `SymbolCertificate` | structure | The four fields of a certificate. |
| `SymbolCertificate.support` | projection | The named finite set with the proof of exhaustiveness. |
| `SymbolCertificate.sound` | characterisation | A certified candidate lies in the kernel of the tame symbol. |
| `IntegralCertificate` | structure | A certificate with the vertical conditions. |
| `IntegralCertificate.sound` | characterisation | Soundness against the vertical-residue description. |

**Used by.**

- *E.8* — The completion criterion asks for at least one worked certificate.
- *EllipticRegulators* — The regulator is computed on certified classes.
- *E.7, the torsion construction* — The construction of the next node produces candidates that this machinery certifies.

**Unit tests.**

- `trivial_candidate` — The empty sum has a certificate with empty support.
- `reciprocity_respected` — A candidate whose symbols violate reciprocity has no certificate; the four fields cannot all be satisfied.
- `finite_data` — A certificate is finite data and is checkable.
- `image_not_group` — Soundness gives a class in the image, not on the curve; the identification is E.3’s theorem.

**Sources.**

- III.6.5.3, the Weil Reciprocity Formula (PDF p. 235), The reciprocity that every certificate must respect, verbatim: the tame symbols cannot all be prescribed independently.

  > The appropriate reciprocity formula first appeared in Weil's 1940 paper on the Riemann Hypothesis for curves: (f, g)_infinity times the product over p of N_p (f, g)_p = 1 in F^x.

### Weil reciprocity is the consistency condition on a certificate

`EllipticKTheory:E.7/weil-reciprocity-as-the-consistency-condition` · *theorem*

The tame symbols of a pair of rational functions on a complete curve cannot be prescribed independently: the product over all closed points of the norms of the tame symbols is trivial. This is Weil's reciprocity formula, and it is exactly the exactness of the localisation sequence at the residue term composed with the transfer to the base. For a certificate it is the consistency condition: a list of local symbol values that violates reciprocity cannot come from any pair of functions, so checking reciprocity is the first check a certificate must pass.

**Hypotheses.**

- The curve is complete and smooth over the base field; the norms are the residue-field norms of E.3.
- The functions are non-zero rational functions; the symbols are the tame symbols in the fixed convention.
- The formula is stated with the norms, and dropping them makes it false as soon as a closed point has a residue field larger than the base.

**Proof outline.**

1. State the reciprocity formula with its norms.
2. Derive it from the localisation sequence, as the statement that the composite of the residue map with the transfer to the base is zero on the second K-group of the function field.
3. Record the source's rational-function-field case with the place at infinity written out, which is the classical form.
4. State the consequence for certificates: reciprocity is a necessary condition on the list of local values.
5. State the non-example: forgetting the residue-field norms gives a formula that fails on a curve with a non-rational closed point in the support, which is exactly the situation E.8 asks to be worked out.

**Acceptance.**

- The product of the normed tame symbols over all closed points is trivial.
- The formula is the exactness of the localisation sequence composed with the transfer.
- Without the residue-field norms the formula is false.
- A list of local values violating reciprocity cannot be certified.

**Prerequisites.** `EllipticKTheory:E.7/symbol-certificates`, `EllipticKTheory:E.3/naturality-of-the-sequence`, `K2SymbolsBrauer:T.4`

**Sources.**

- III.6.5.3 (PDF p. 235), The formula with its norms and the first step of its proof, verbatim.

  > the symbol (f, g)_infinity times the product over p of N_p (f, g)_p = 1 in F^x. In Weil's formula, N_p denotes the usual norm map (F[t]/p)^x -> F^x. To establish this reciprocity formula, we observe that K_2 F(t)/K_2 F injects into K_2 Fbar(t)/K_2 Fbar, so we may assume that F is algebraically closed.

- III.7.5.1, the Milnor form (PDF p. 247), The same statement in Milnor K-theory, verbatim.

  > Weil Reciprocity Formula 7.5.1. The sum over v of N_v d_v(x) = 0 for all x in the Milnor K-group of F(t).

### Bloch's construction from rational torsion divisors

`EllipticKTheory:E.7/classes-from-torsion-divisors` · *comparison*

The construction the stage text asks for attaches to a rational torsion point of order dividing a given integer a function whose divisor is that integer times the difference of the point and the origin, obtained from the Riemann-Roch criterion rather than assumed to exist; the symbols built from such functions have tame residues that are removed after multiplying by the order and correcting by explicit constant symbols, and the resulting classes are independent modulo torsion and constants. Over a number field this produces rational classes in the second K-group of the curve through the comparison of E.3. This packet states the construction and its properties AS THE STAGE TEXT DOES, and records that the source in which it is proved was not obtained; the gap names it.

**Hypotheses.**

- The torsion point is rational over the base field; the non-rational case is the next node.
- The function attached to a torsion divisor exists by Riemann-Roch because the divisor of degree zero is principal exactly when its class vanishes, which is what the torsion hypothesis gives.
- The independence is modulo torsion classes and modulo the classes of constant symbols; it is not an independence of the classes themselves.

**Proof outline.**

1. Construct the function attached to a rational torsion point from the Riemann-Roch criterion, with its divisor computed.
2. Form the symbol of two such functions and compute its tame residues at the points of the support.
3. Record the correction: multiplying by the order and adding explicit constant symbols removes the residues, which is the proposition the stage text names.
4. Record the independence statement modulo torsion and constants.
5. Record the consequence over a number field: the classes obtained are rational classes on the curve, through the injectivity theorem of E.3.
6. Record what is missing: the source proving the proposition was not obtained, so the proof is not decomposed and the statement is recorded with its attribution.

**Acceptance.**

- A rational torsion point of order dividing an integer gives a function with the stated divisor.
- The corrected symbols have vanishing tame residues.
- The classes are independent modulo torsion and constants.
- The proof is not decomposed here; the source was not obtained and the gap says so.

**Prerequisites.** `EllipticKTheory:E.7/weil-reciprocity-as-the-consistency-condition`, `EllipticKTheory:E.2/picard-decomposition-and-the-point-group`, `tauceti:WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass`

**Sources.**

- III.6.5.3 (PDF p. 235), The mechanism by which constant symbols correct residues, verbatim in the rational-function-field case; the elliptic construction the stage text names is attributed there to Bloch and its source was not obtained.

  > Since the symbol (f, g)_infinity vanishes on K_2(F), it must be expressable in terms of the tame symbols

### Non-rational torsion, transfer and the descent warning

`EllipticKTheory:E.7/non-rational-torsion-and-descent` · *comparison*

When the torsion point is not rational the construction is carried out over a finite extension where it is defined, and the class is brought down by the transfer of E.3, whose effect on residues is the residue-field norm. The resulting norm and descent formulas are what relate the class over the extension to a class over the base. A Galois-invariant formal expression is NOT automatically the restriction of a class over the base: the descent obstruction must be controlled, exactly as in the degree-zero statement of E.2, and this node records the warning as a non-example.

**Hypotheses.**

- The extension is finite and separable, generated by the coordinates of the torsion point.
- The transfer is the one of E.3, with its compatibility with residues through the residue-field norm.
- The descent statement concerns the map from classes over the base to Galois-invariant classes over the extension, which is injective up to torsion and need not be surjective.

**Proof outline.**

1. Carry out the construction over the extension and record the class obtained.
2. Apply the transfer and compute the effect on the residues by the norm compatibility.
3. State the norm formula relating the class over the extension to its transfer.
4. State the descent warning as a non-example, with the obstruction named.
5. Record the boundary with the regulator roadmap: the comparison of these classes with regulator values is that roadmap's responsibility and is not asserted here.

**Acceptance.**

- The transfer of a certified class over an extension is certified over the base, with residues computed by the norm.
- A Galois-invariant expression need not come from a class over the base.
- The regulator comparison is not part of this layer.

**Prerequisites.** `EllipticKTheory:E.7/classes-from-torsion-divisors`, `EllipticKTheory:E.3/naturality-of-the-sequence`, `EllipticKTheory:E.2/K0-of-an-elliptic-curve`

**Sources.**

- VI.6.8 (PDF p. 504), The sequence in which the residue-field terms carry their own fields and the last map is the norm, verbatim; that norm is the transfer this node uses.

  > there is an exact reciprocity sequence: 0 -> K_{2i}(X) -> K_{2i}(F) -> (+)_x K_{2i-1}(F_q(x)) -> K_{2i-1}(F_q) -> 0

## E.8 — Completion criterion

An interface, not a classification. **No finite generation and no explicit
classification of every K-group of every elliptic curve over a number field is
claimed anywhere in this roadmap.**

Three things must actually be worked out: a non-trivial symbol certificate, a
residue at a **non-rational** closed point, and an integrality calculation at a
**bad** fibre — the first tests the machinery, the second the norms, the third
the vertical conditions.

Coverage: **source_decomposed**.

Two nodes. The completion criterion written out as a checklist against the nodes of this packet, with each item attached to the node or the supplier that provides it, and with the non-claim the stage text insists on: no finite generation and no explicit classification of every K-group of every elliptic curve over a number field is asserted anywhere; and the three worked examples the criterion requires, with the standard of a worked example fixed — each certificate field exhibited, not asserted — and with the reason each example is required, namely that without a non-rational closed point the residue-field norms never appear and without a bad fibre the vertical conditions are vacuous.

### What the layer must deliver to be complete

`EllipticKTheory:E.8/the-completion-criterion` · *comparison*

The criterion for this roadmap is an interface, not a classification: for every elliptic curve covered by the scheme construction the public interface supplies the K-groups in degrees zero to three from ONE K-theory functor, the computation in degree zero, the localisation and coniveau descriptions, the functoriality, and the rational and arithmetic-integral symbol interfaces. This node writes the criterion out as a checklist against the nodes of this packet, so that a reader can see which node supplies each item and what remains.

**Hypotheses.**

- The curve is an elliptic curve over a field covered by the construction of E.1; for the integral interface the field is a number field.
- The K-groups must come from one functor, so that the maps between them are the ones the layer's theorems are about.
- The criterion is about the interface; it makes no claim about the values of the groups.

**Proof outline.**

1. List the six items of the criterion.
2. Attach to each the node of this packet that supplies it, and the roadmap that supplies what this packet imports.
3. Record the two items that rest entirely on imports, the K-groups themselves and the Adams operations.
4. State the non-claim: no finite generation and no explicit classification of every K-group of every elliptic curve over a number field is asserted anywhere in this roadmap.
5. Record the three worked items the next node requires.

**Acceptance.**

- Every item of the criterion has a node or a named supplier.
- The K-groups come from one functor, so the localisation and coniveau descriptions are about the same groups.
- No finite generation or explicit classification is claimed.

**Prerequisites.** `EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`, `EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`, `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.7/symbol-certificates`

**Sources.**

- VI.6.7 (PDF p. 504), The kind of complete answer that is available over a FINITE field, verbatim; over a number field no such classification is claimed, which is the point of this node.

  > Then K_0(X) = Z (+) Pic(X), and the finite groups K_n(X) for n > 0 are given by: ...

### The three worked examples the criterion requires

`EllipticKTheory:E.8/the-three-worked-examples` · *comparison*

The criterion requires at least three things actually worked out: one non-trivial symbol certificate on an elliptic curve; one residue at a non-rational closed point, which is where the residue-field norms of E.3 and E.7 become visible; and one integrality calculation at a bad fibre, which is where the vertical residues of E.6 become visible. This node states the three, says which nodes they exercise, and fixes what counts as worked out, namely that each of the four certificate fields is exhibited rather than asserted.

**Hypotheses.**

- The curve is an elliptic curve over a number field with at least one prime of bad reduction, so that the third example is non-vacuous.
- The non-rational closed point must have residue field strictly larger than the base, so that the norm is not the identity.
- Worked out means that the certificate's four fields are exhibited, not that the existence of a certificate is asserted.

**Proof outline.**

1. State the three examples and the nodes each exercises.
2. State the standard of a worked example: each field of the certificate exhibited.
3. Record why the second example is required: without a non-rational point the residue-field norms never appear and a formalisation could use a wrong reciprocity formula undetected.
4. Record why the third is required: without a bad fibre the vertical conditions are vacuous and the integral part is indistinguishable from the unramified classes.
5. Record that the regulator values of these examples are the regulator roadmap's responsibility.

**Acceptance.**

- A worked certificate exhibits all four fields.
- The second example must have a residue field larger than the base, or it does not test the norms.
- The third example must have bad reduction, or it does not test the vertical conditions.
- The regulator values are not part of this roadmap.

**Prerequisites.** `EllipticKTheory:E.8/the-completion-criterion`, `EllipticKTheory:E.7/symbol-certificates`, `EllipticKTheory:E.6/vertical-residues`

**Sources.**

- III.6.5.3 (PDF p. 235), The norms that the second worked example is required to exercise, verbatim.

  > In Weil's formula, N_p denotes the usual norm map (F[t]/p)^x -> F^x.

## Gaps

### The theory of arithmetic surfaces is not in the source read

Needed by: `EllipticKTheory:E.6`.

E.6 needs the existence of a regular proper flat model, the minimal regular model with its uniqueness, resolution by blow-ups with regular centres, and the description of the special fibres with their components and multiplicities. None of this is in the K-book, and no other source was read for it, so the model node records the statements as imports with their standard attribution and decomposes none of them. NEXT SOURCE ACTION: read Liu, 'Algebraic Geometry and Arithmetic Curves', chapters 8 to 10, or Silverman's 'Advanced Topics', chapter IV, for the existence and the minimal model, and decompose the existence statement, the blow-up comparison and the structure of the special fibres.

### The source for the elliptic symbol construction was not obtained

Needed by: `EllipticKTheory:E.7`.

The stage text names a proposition of Bloch's Irvine lectures for the construction of K-theory classes from rational torsion divisors: multiplication by the order of the torsion together with explicit constant-symbol corrections removes the tame residues, and the resulting classes are independent modulo torsion and constants. That source, the CRM monograph 'Higher regulators, algebraic K-theory, and zeta functions of elliptic curves', is not freely available and was not obtained. The node states the construction as the stage text states it, with its attribution, and decomposes only the parts that follow from Weil reciprocity and the Riemann-Roch criterion. NEXT SOURCE ACTION: obtain the monograph, or Beilinson's and Schappacher-Scholl's expositions of the same construction, and decompose the proposition and the independence statement.

### The proofs of the finite-field computations were not read

Needed by: `EllipticKTheory:E.5`.

Harder's theorem is quoted as a statement; the geometric computation and the arithmetic descent are quoted with their statements and with the one-line indication that the motivic spectral sequence degenerates. That spectral sequence is developed in the sections of the same chapter that were not read. NEXT SOURCE ACTION: read VI.4 and VI.6.5 to 6.6 of the same file and decompose the degeneration, which will also serve the arithmetic roadmap's corresponding gap.

### The blow-up formula is imported without a source here

Needed by: `EllipticKTheory:E.6`.

Model independence rests on the computation of the K-theory of a blow-up along a regularly embedded centre. The source read has the projective-bundle and homotopy-invariance statements but not the blow-up formula, which is filed as an import from the scheme roadmap. NEXT SOURCE ACTION: read Thomason-Trobaugh section 4 for the blow-up formula and decompose it in the roadmap that owns it.

### The construction of the scheme over an arbitrary base was not decomposed

Needed by: `EllipticKTheory:E.1`.

E.1 builds the scheme over a field. The Tau Ceti modular-curves roadmap constructs the projective Weierstrass cubic over an arbitrary base ring with its zero section and proves properness and smoothness, and the audit records this as a duplication. This packet cites that layer as the supplier for the general case and builds only the field case. NEXT SOURCE ACTION: read that layer's own decomposition and, if it is complete, narrow E.1's stage text to the field case with a request for the general one.

## Requests

- **`tauceti:TauCetiRoadmap/ModularCurves#layer-1-elliptic-curves-over-a-base-scheme`** — The projective Weierstrass cubic as a closed subscheme over an arbitrary base ring, with its zero section, properness and smoothness, and the identification of its points with the pinned point group. AUDIT-28 records this as covering E.1's scheme, its geometric properties and the point-group comparison over a base; this packet builds the field case and imports the general one.

- **`KTheoryLowDegrees:Z.5`** — The rank-determinant isomorphism for a connected regular noetherian curve with the structure-sheaf and skyscraper class formulas, and its combination with the elliptic Picard decomposition. AUDIT-28 names Z.5 as the owner of E.2's first, second and last targets.

- **`GeneralAlgebraicKTheory:K.1`** — The K-groups themselves, for schemes through the exact category of vector bundles, with their elementary properties. Every group in this roadmap is one of these.

- **`GeneralAlgebraicKTheory:K.3`** — Quillen's localisation theorem, the resolution theorem and the projection formula, of which E.3 and E.5 are the curve instances.

- **`SchemeKTheoryOperations:S.3`** — The localisation sequence for schemes with supports, which is the form E.3 glues over the charts and which E.6 uses for the change of base.

- **`SchemeKTheoryOperations:S.4`** — Pullback, pushforward, the projection formula and the blow-up formula for schemes. E.5 states the curve instances and E.6's model independence rests on the blow-up formula.

- **`SchemeKTheoryOperations:S.6`** — Adams operations with the eigenvalue theorem and the rational projectors, which E.4 exports as the weight decomposition.

- **`MotivicEtaleKTheory:M.6a`** — The coniveau and support filtration with the homotopy-coniveau tower; E.4 restates the two-column case for a curve and compares it with the localisation sequence.

- **`K2SymbolsBrauer:T.3:symbols`** — The tame symbol with its order and sign convention, its independence of the uniformiser and the Steinberg relation. E.3 uses that convention unchanged and E.7's certificates are conditions on that map.

- **`K2SymbolsBrauer:T.3:localization-comparison`** — The identification of the tame symbol with the connecting map of the localisation sequence, which E.3 imports rather than reproving.

- **`K2SymbolsBrauer:T.4`** — Weil reciprocity in the form with residue-field norms, which E.7 turns into the consistency condition on a certificate.

- **`K2SymbolsBrauer:T.5`** — The certified-presentation discipline for the second K-group, with which E.7's certificates must agree on what counts as certified.

- **`K3BlochGroups:V.4`** — The indecomposable third K-group of a field with Suslin's sequence, which E.4 distinguishes from the extra geometry of the curve.

- **`KTheoryLowDegrees:U.4`** — The first K-group of a ring with the determinant and the vanishing of the special subgroup in the arithmetic cases, against which E.4 keeps its curve invariant distinct.

- **`ArithmeticKTheory:N.1`** — The ring of S-integers as a carrier with its properties, which is the base of E.6's model.

- **`ArithmeticKTheory:N.3`** — The finiteness and rank statements for the K-groups of rings of S-integers, which E.3's rational injectivity statement over a number field uses through the torsion of the residue groups.

## Structural proposals

### E.1's scheme construction is owned over a base by the Tau Ceti modular-curves roadmap

*note-duplicate-boundary*

AUDIT-28 records that layer 1 of the upstream ModularCurves roadmap constructs the projective Weierstrass cubic over an arbitrary base ring with its zero section, proves properness and smoothness, identifies its points over a field with the pinned point group and proves the group laws agree. That is E.1's first, second and fourth targets, over a base rather than over a field. E.1's stage text should say that the general construction is imported and that what this roadmap owns is the field case together with the isogeny comparison, which the upstream layer does not treat. Nothing is dropped; the packet builds the field case and files the request.

### The roadmap document does not record two pinned Tau Ceti theorems that settle half of E.2

*note-missing-record*

Tau Ceti proves, complete, that the points of a Weierstrass curve over a field are the degree-zero divisor classes of its function field, and that the divisor class group of an order system with a weight-one rational point splits by degree. Together these are the entire Picard half of E.2, and the audit says the roadmap does not record them. The stage text should cite both, so that a reader plans only the rank-determinant isomorphism and the descent statement, which are what is genuinely missing.

### E.6 carries two independent developments

*propose-split*

E.6 asks both for the arithmetic-surface theory — existence of a regular proper model, minimal models, resolution, special fibres — and for the K-theoretic definition of the integral part with its model independence and its vertical description. The first is geometry with no K-theory in it and has no source in this roadmap's reading list; the second is K-theory that takes the first as input. As one layer it cannot record that the second half is ready as soon as the first is imported. The four nodes divide one to three along that line.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming
proposal whose proofs are all `sorry`, and nothing here is claimed to be
formalised.

No excerpt ran past four hundred characters, so none was elided; every quotation
in this document is the full sentence or sentences the locator names.
