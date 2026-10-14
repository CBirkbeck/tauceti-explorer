# Arithmetic dynamics: periodic-point equations and finite bounds

This document continues the accepted ArithmeticDynamics blueprint at DY.3. It builds the missing geometry behind the periodic-point equations and connects finite-height bounds to exact computation. It also supplies the explicit rational three-cycle reduction. The packet is [ArithmeticDynamics--DY.3.json](../packets/ArithmeticDynamics--DY.3.json); the accepted parent is [ArithmeticDynamics.json](../packets/ArithmeticDynamics.json). Parent declarations keep their identifiers and statements. A reference of the form `DY.3/key` below means `ArithmeticDynamics:DY.3/key`.

The pass is complete at target level. DY.3 is **planned**, with three recorded gaps and eleven supplier-stage requests; it is not closed. The 23 new items consist of four definitions, five constructions, ten theorems and four comparisons, with 64 API items and 27 definition/construction tests. Every implementation status remains unchecked. The compact suggested file elaborates at the pins and contains no implemented curve, ray or enumeration machine. The full intended mathematical signatures, including all APIs and tests, are here.

## Scope, conventions and existing work

A rational map of the projective line has degree at least two throughout the height and finiteness statements. Field degree is positive; a bound for a fixed map over a fixed number field is distinguished from a uniform bound as the map varies. The inherited Uniform Boundedness and Poonen conjecture nodes state propositions and supply no unconditional proof input. The power map and existing elliptic canonical-height comparisons are examples already owned by the parent/library, not new general constructions here.

For a unicritical map write f_c(z)=z^d+c, with d≥2. The period index is n≥1. Its dynatomic polynomial uses Möbius exponent μ(n/e) on f_c^e(z)−z. This is the corrected convention of the parent finding `ArithmeticDynamics/E401`; FPS's printed exponent is not repeated. The quadratic half-count is ν(n)=½Σ_{e|n}μ(n/e)2^e. Thus deg_z Φ*ₙ,₂=2ν(n), not ν(n). For other d, ν_d(n)=Σ_{e|n}μ(n/e)d^e is the full degree. Divisor sums and genus identities are interpreted in ℚ: subtraction is not truncated natural subtraction.

Formal period is a root condition for Φ*. It agrees with exact point period on the generic unramified locus and can differ at parabolic parameters. In characteristic zero a lower exact period m contributes at n=mr precisely when the multiplier is a primitive r-th root, r>1. For example Φ*₂(z,−3/4)=(z+1/2)² although −1/2 is fixed. A smooth affine curve can have a parameter fibre with a repeated root. This specialization does not contradict total-space smoothness.

X₁,d(n) means the regular projective model of the dynatomic function field. It is the normalization of the projective closure, rather than the possibly singular closure itself. X₀,d(n) means the rotation fixed-field model. A rational point on the latter represents a Galois-stable cycle on its free locus; it need not lift to a rational marked point. The index1 denotes a marking and index0 a cycle quotient, independently of the subscript in a genus expression. The notation C₁(n),C₀(n) in FPS agrees with these quadratic projective models.

The reviewed library audit for DY.3 records native periodic-point and height machinery, but no general dynatomic/polarization enumeration library. The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also inspected read-only. In particular the current AlgebraicCurves, ConformalMapping and JacobianChallenge documents and suggested statements establish the ownership boundary used here. Targeted searches for dynatomic, kneading and rational quadratic pushforward found no such development there; this is an audit of those checked source trees, not a claim about all available formalization.

AlgebraicCurves owns function fields, places, integral closure, regular models, genus, base change, different/Hurwitz and finite automorphism quotients. ConformalMapping owns normalized conformal maps, continuation and general monodromy. This roadmap owns their dynamical specialization: Φ*, the iteration/rotation action, branch parameters, external rays for z^d+c, labelled orbit monodromy and the arithmetic adapters. ComputationalNumberTheory owns exact number-field arithmetic; EffectiveDiophantineMethods owns the point-list and height-enumeration certificates. The request ledger below states precisely which inputs are required.

### Target coverage

| DY.3 target | Existing owner or inherited declaration | This continuation |
|---|---|---|
| Period forms, multiplicities, formal/exact period and integral dynatomic polynomials | Parent `period-form` through `dynatomic-polynomial-dehomogenisation`, including the characteristic-zero classification | Reused unchanged; local analytic specialization is compared with the inherited polynomial |
| Affine dynatomic curve and its smoothness/irreducibility | Parent `dynatomic-curve`, `unicritical-dynatomic-curve-smooth-irreducible` | Quadratic differential contraction, kneading, labelled monodromy and analytic/algebraic comparison, with G1/G2 explicit |
| Projective X₁ and X₀ and their quadratic genera | AlgebraicCurves owns the general geometric carriers | Named regular models, rotation quotient, finite/infinite different and corrected genus formulas |
| Fixed-map finite rational/bounded-degree preperiodic sets | Parent `height-bound-for-preperiodic-points`, `finiteness-of-rational-preperiodic-points`, `finiteness-of-bounded-degree-preperiodic-points` | No replanning of Northcott or canonical height |
| Effective enumeration over ℚ and number fields | Parent `orbit-repetition-check`, `preperiodic-filter-correct`, and both rational enumeration endpoints | Exact runtime/projective adapter and native relative-height two-list adapter |
| Rational quadratic cycle and preperiodic restrictions | Parent period≤3 parametrizations, 4/5/6-cycle exclusions and Poonen type reductions | Morton's missing two-3-cycle reduction and a supplier-hypothesis comparison |
| Uniform bounds as the map varies | Parent `uniform-boundedness-conjecture`, `poonen-conjecture` | Statement-only conjectures remain separate from every algorithm |

The six accepted DY.3 planets are retained: Effectivity of dynatomic cycles; Dynatomic polynomial; Dynatomic curve Y₁(n); Northcott finiteness of preperiodic points; Certified enumeration of preperiodic points; Uniform boundedness conjecture. No new planet is added, so the union of parent and part keeps the layer limit of six. The new declaration identifiers are fresh; the parent packet is not rewritten.

## DY.3: build order and mathematical interface

The four groups below form one layer. Finite word combinatorics comes before geometric use of words at infinity. The analytic route is quadratic differentials → transversality and ray inputs → labelled monodromy → smooth integral affine model → regular projective model/rotation quotient → ramification/genus. Morton uses the inherited period3 parametrization and ED's actual elliptic point list. Enumeration uses the inherited height bound/filter and exact supplier outputs. These chains have the supplier and gap endpoints recorded below.

### Projective models and quadratic genera

#### Smooth projective models of marked dynatomic curves

**`DY.3/projective-dynatomic-model` — construction.** For d≥2,n≥1 and a characteristic-zero field k, put A=k[c,x]/(Φ*ₙ,d), using the inherited monic dynatomic polynomial. Once geometric integrality of A is established, F=Frac(A) is a one-variable function field with exact constants k. Define X₁,d(n) as the regular projective model of F supplied by AlgebraicCurves, with the open immersion Y₁,d(n)→X₁,d(n) from the smooth affine model. The element c∈F induces a finite morphism π₁:X₁,d(n)→ℙ¹_k of degree ν_d(n)=Σ_{e|n} μ(n/e)d^e. This is the normalization of the projective closure; the possibly singular plane closure is not the model used for genus or rational points.

Hypotheses and domain conventions: k a field of characteristic zero; d≥2,n≥1. Geometric integrality and affine smoothness are discharged by the analytic identification target, not assumed to follow from monicity.

The construction or proof proceeds as follows.

1. Use the inherited coordinate ring and its geometric-integrality endpoint, refined by analytic-dynatomic-identification below. Monicity makes A finite over k[c].
2. Use AlgebraicCurves Layers 0,2,12 to form the function field and its unique regular projective model; characteristic zero makes the regular model smooth.
3. Extend c and x as rational functions on the model; the field inclusion k(c)⊂F gives π₁, of degree deg_x Φ*. Uniqueness of the model gives the normalization and base-change comparisons.

Direct dependencies: `ArithmeticDynamics:DY.3/analytic-dynatomic-identification`, `ArithmeticDynamics:DY.3/dynatomic-curve`, `ArithmeticDynamics:DY.3/dynatomic-polynomial-degree`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-0-function-fields-constant-fields-and-places`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

Source support: [E. V. Flynn, B. Poonen, E. F. Schaefer](https://arxiv.org/pdf/math/9508211v1), §2, pp.3–5 — Projective normalization, rotation and geometric irreducibility.; [J. R. Doyle, B. Poonen](https://arxiv.org/pdf/1711.04233v2), §1, pp.1–2 — Smooth projective X₁(n) as normalization, in characteristic zero.

**API.** These are mathematical signatures on the specified object and domain.

- `dynatomicProjectiveModel` (constructor): The regular projective k-curve with function field F=Frac(k[c,x]/Φ*).
- `dynatomicAffineOpen` (compatibility): Open immersion of the inherited smooth Y₁ inducing identity on F.
- `dynatomicParameterMap` (projection): Finite map to ℙ¹ extending c, of degree ν_d(n).
- `dynatomicModel_ext` (universal-property): A k-isomorphism of the named function fields extends uniquely to an isomorphism of their regular projective models.
- `dynatomicModel_baseChange` (functoriality): For k⊂K characteristic zero, base-changing X₁ agrees with the regular projective model of Frac(K[c,x]/Φ*); identity and composite base changes commute.
- `dynatomicBoundary` (characterisation): The complement of Y₁ is precisely the places of F at which c has a pole, since A is its integral closure over k[c].

The interface serves `quadratic-dynatomic-genera`: Defines the curves whose genera are computed.; `EffectiveDiophantineMethods:ED.4`: Supplies the actual smooth curves to arithmetic computations.

**Unit tests.**

- `projective_dynatomic_model_1` (computation): n=1,d=2: Y₁ has coordinate ring k[x] and projective model ℙ¹.
- `projective_dynatomic_model_2` (compatibility): n=2,d=2: Φ₂*=x²+x+c+1 gives X₁≅ℙ¹ and two geometric points over generic c.
- `projective_dynatomic_model_3` (non-example): n=4,d=2: the regular model has genus2; a claim that every monic plane model normalizes to ℙ¹ fails.

Acceptance: For d=2,n=1, X₁ is ℙ¹ with c=x−x² and π₁ degree2. At n=5, genus is14, not the arithmetic genus of its degree30 plane closure.

#### Projective quotient by cycle rotation

**`DY.3/dynatomic-cycle-quotient` — construction.** Extend the inherited rotation σ(x)=x^d+c, σ(c)=c to F and its smooth projective model. Its order is exactly n (including order1 at n=1), since a generic marked point has exact period n. Set F₀=F^{⟨σ⟩}; X₀,d(n) is the regular projective model of F₀. The inclusion F₀⊂F gives q:X₁→X₀ of degree n, and π₁ factors uniquely through π₀:X₀→ℙ¹ of degree ν_d(n)/n. On the open subset of exact-period points away from ramification, geometric fibres of q are the n cyclic markings of one cycle. A k-point of X₀ there represents a Galois-stable cycle, which need not have any k-rational marked point.

Hypotheses and domain conventions: Characteristic zero field k; d≥2,n≥1. Use the open exact-period locus for the cycle interpretation; boundary and lower-period points remain in the projective quotient.

The construction or proof proceeds as follows.

1. The ring automorphism extends to the fraction field; its n-th power is identity. Generic exact period gives order exactly n.
2. Import AlgebraicCurves Layer11 fixed-field degree theorem and Layer12 dictionary to define the quotient model and finite maps.
3. Over an algebraic closure, q identifies precisely the rotation orbits; descent of that orbit is Galois stability. A rational lift requires trivial Galois action on the marked points, an additional condition.

Direct dependencies: `ArithmeticDynamics:DY.3/projective-dynatomic-model`, `ArithmeticDynamics:DY.3/formal-period-classification-char-zero`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-11-automorphisms-and-the-hurwitz-bound`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

Source support: [E. V. Flynn, B. Poonen, E. F. Schaefer](https://arxiv.org/pdf/math/9508211v1), §2, pp.3–5; Theorem2 p.6 — Quotient by rotation, field degree and Galois-stable cycles.; [J. R. Doyle, B. Poonen](https://arxiv.org/pdf/1711.04233v2), §1, p.2 — X₀(n) and quotient map by the order-n automorphism.

**API.** These are mathematical signatures on the specified object and domain.

- `dynatomicCycleModel` (constructor): Regular projective model of F^{⟨σ⟩}.
- `dynatomicRotation` (structure): Automorphism σ of X₁, order exactly n, with σ(x)=x^d+c and σ(c)=c on function fields.
- `dynatomicCycleProjection` (projection): q:X₁→X₀, q∘σ=q, finite of degree n.
- `cycleProjection_factor` (universal-property): Any invariant morphism from X₁ to a regular projective curve factors uniquely through q.
- `cycleProjection_fibre` (characterisation): On the unramified exact-period locus, q(P)=q(Q) iff Q=σ^j(P) for some 0≤j<n.
- `cycleModel_baseChange` (functoriality): Characteristic-zero field extensions commute with the fixed-field quotient and its maps.
- `rationalCyclePoint_iff` (compatibility): A rational quotient point on the free locus is a Galois-stable geometric cycle; rational marked lift iff every point in that cycle is rational.

The interface serves `FPS Theorem1`: Projects a putative rational marked 5-cycle to the quotient curve.; `Morton genus formulas`: Uses the fixed field, not a set quotient with an unspecified scheme structure.

**Unit tests.**

- `dynatomic_cycle_quotient_1` (degenerate): n=1: σ=id, q is identity, X₀=X₁.
- `dynatomic_cycle_quotient_2` (computation): d=2,n=2: q has degree2; the lower-period point (x,c)=(−1/2,−3/4) is fixed by σ and is ramified.
- `dynatomic_cycle_quotient_3` (non-example): For f(z)=z² over ℚ the two primitive cube roots form a Galois-stable 2-cycle and a rational X₀(2) point, with no rational marking.

Acceptance: The degree of q is n even though special fibres can contain fewer than n distinct points. X₀(3) has rational points for cycles over cubic fields; this is not a rational 3-cycle theorem.

#### Primitive binary necklaces at infinity

**`DY.3/quadratic-infinity-necklaces` — definition.** For n≥1, a binary word is w:Fin n→Fin2. It is primitive when no nonidentity rotation fixes it. Let Bₙ be primitive words modulo cyclic rotation. Complement w↦1−w induces an involution on Bₙ; let Iₙ be its orbit set. The separate ramification theorem identifies these finite quotients with the geometric places over c=∞ in X₀,2(n). Write ν(n)=ν₂(n)/2 and eₙ=|Iₙ|. Then |Bₙ|=2ν(n)/n and eₙ=ν(n)/n for odd n; for even n, eₙ=ν(n)/n+(1/(2n))Σ_{r|n,2|r,n/r odd} μ(n/r)2^{r/2}. All divisions in these formulas are rational equalities, followed by integrality theorems.

Hypotheses and domain conventions: n≥1; binary words have labelled positions before quotienting. Primitivity excludes all proper cyclic periods, not only constant words.

The construction or proof proceeds as follows.

1. Use finite cyclic group rotation on Fin n and its action on functions; define primitive words by stabilizer triviality. Complement commutes with rotation.
2. Möbius inversion counts primitive words. Burnside on rotations and complement counts Iₙ; rotations paired with complement contribute only in the even case with the displayed parity restriction.
3. Morton Lemma12 identifies these complement-orbits with places at infinity after adjoining u with c=u²; the sign change u↦−u exchanges binary symbols.

Direct dependencies: `mathlib:MulAction.orbitRel`, `mathlib:ArithmeticFunction.moebius`, `mathlib:Nat.totient`.

Source support: [P. Morton](https://www.numdam.org/article/CM_1996__103_3_319_0.pdf), §3, Lemma12, pp.340–341; Theorem13 proof, p.342 — Primitive necklace count and its infinity-place interpretation.; [E. V. Flynn, B. Poonen, E. F. Schaefer](https://arxiv.org/pdf/math/9508211v1), §2, p.5 — Quadratic specialization of the even-period correction.

**API.** These are mathematical signatures on the specified object and domain.

- `primitiveBinaryWord` (characterisation): A word has trivial cyclic-rotation stabilizer.
- `primitiveNecklace` (constructor): Orbit of a primitive word under position rotation.
- `necklace_eq_iff` (extensionality): Two words define the same necklace iff one is a cyclic shift of the other.
- `necklaceComplement` (structure): Complement involution on necklaces, commuting with rotation and squaring to identity.
- `infinityNecklace` (constructor): Orbit under complement of a primitive necklace.
- `infinityNecklace_eq_iff` (characterisation): Equality iff words differ by a rotation, or by a rotation followed by complement.
- `infinityNecklace_card` (characterisation): The finite cardinality is the displayed Burnside count; its geometric interpretation belongs to quadratic-parameter-ramification.

The interface serves `quadratic-parameter-ramification`: Counts the quotient places and different contribution at infinity.; `quadratic-dynatomic-genera`: Provides the even-period correction.

**Unit tests.**

- `quadratic_infinity_necklaces_1` (degenerate): n=1: two primitive words, two necklaces, one complement-orbit.
- `quadratic_infinity_necklaces_2` (computation): n=2: 01 and10 are primitive, one necklace fixed by complement, one infinity-place.
- `quadratic_infinity_necklaces_3` (non-example): At n=4 word0101 is excluded; word0011 is primitive and its complement is a rotation, whereas0001 and1110 give two necklaces in one complement-orbit.

Acceptance: e₁,e₂,e₃,e₄,e₅,e₆ are 1,1,1,2,3,5. The unquotiented primitive word count is ν₂(n), while the quotient curve degree is ν₂(n)/n.

#### Ramification of the quadratic parameter maps

**`DY.3/quadratic-parameter-ramification` — theorem.** Over an algebraically closed characteristic-zero field, put ν(n)=½Σ_{e|n}μ(n/e)2^e. For X₁(n)→ℙ¹_c the degree is2ν(n); above∞ there are ν(n) places each of index2. The finite branch parameters partition into primitive period-n parabolic parameters (bₙ of them) and satellite parameters of exact cycle period e<n with multiplier of order n/e (b_{n,e} of them). Here b_{n,e}=ν(e)φ(n/e) and bₙ=ν(n)−Σ_{e|n,e<n}b_{n,e}. Each primitive parameter has n ramified places of index2; each satellite parameter has e places of index n/e; all other places above those parameters are unramified. Consequently deg Diff(F/k(c))=nν(n)−Σ_{e|n,e<n}eν(e)φ(n/e)+ν(n). For F₀/k(c), finite different degree is bₙ and infinity different degree is 2ν(n)/n−eₙ.

Hypotheses and domain conventions: k algebraically closed, char0; n≥1. Ramification of the normalized curve is used; the discriminant of a possibly nonnormal multiplier plane equation is not its field different.

The construction or proof proceeds as follows.

1. Use parabolic-parameter-transversality and the local branch descriptions to count primitive and satellite branch parameters via multiplier/cyclotomic factors.
2. Morton Proposition9 proves the affine coordinate ring is the integral closure and computes finite different exponents, including the satellite contribution n−e.
3. At infinity use c=u² and the distinct Laurent expansions of periodic roots (Morton Proposition10); for F₀ use primitive binary necklaces and their complement stabilizers.
4. Characteristic zero is tame, so import different exponent e−1 from AlgebraicCurves Layer7; sum contributions with residue degree1. The quotient is unramified at satellite parameters, not at primitive ones.

Direct dependencies: `ArithmeticDynamics:DY.3/dynatomic-cycle-quotient`, `ArithmeticDynamics:DY.3/quadratic-infinity-necklaces`, `ArithmeticDynamics:DY.3/parabolic-parameter-transversality`, `ArithmeticDynamics:DY.3/unicritical-ray-landing`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`.

Source support: [P. Morton](https://www.numdam.org/article/CM_1996__103_3_319_0.pdf), §3, Propositions9–10, pp.337–339; Theorems11,13, pp.339–343 — Finite different and infinity contributions.; [E. V. Flynn, B. Poonen, E. F. Schaefer](https://arxiv.org/pdf/math/9508211v1), §2, p.5 — Quadratic specialization.

Acceptance: n=2: X₁ degree2, one satellite branch at c=−3/4 and one place above∞, both index2; quotient degree1 has zero different. n=6: quotient degree9, b₆=20 and e₆=5, giving different degree24 and genus4.

#### Genus formulas for quadratic dynatomic models

**`DY.3/quadratic-dynatomic-genera` — theorem.** For every n≥1 over any characteristic-zero field, the smooth projective models of z²+c have genera g₁(n)=1+(n−3)ν(n)/2−½Σ_{e|n,e<n}eν(e)φ(n/e), and g₀(n)=1+(½−3/(2n))ν(n)−½Σ_{e|n,e<n}ν(e)φ(n/e)−ε(n), where ν(n)=½Σ_{e|n}μ(n/e)2^e, ε(n)=0 for odd n, and ε(n)=(1/(4n))Σ_{r|n,2|r,n/r odd}μ(n/r)2^{r/2} for even n. These are equalities in ℚ with the natural-number genus cast into ℚ. For n=1,…,10, the pairs (g₀,g₁) are (0,0),(0,0),(0,0),(0,2),(2,14),(4,34),(16,124),(32,285),(79,745),(162,1690).

Hypotheses and domain conventions: n≥1; char0; smooth projective models, not affine curves or singular plane closures.

The construction or proof proceeds as follows.

1. Base change to an algebraic closure preserves genus by AlgebraicCurves Layer8.
2. Apply the Hurwitz genus formula to both finite separable parameter maps using quadratic-parameter-ramification and genus0 of ℙ¹.
3. Insert the necklace formula for eₙ and simplify over ℚ. This also proves integrality and nonnegativity; no truncated natural subtraction is used.

Direct dependencies: `ArithmeticDynamics:DY.3/quadratic-parameter-ramification`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-1-the-rational-function-field`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`.

Source support: [E. V. Flynn, B. Poonen, E. F. Schaefer](https://arxiv.org/pdf/math/9508211v1), §2, p.5, formulas and Table1 — Both formulas and numerical checks.; [P. Morton](https://www.numdam.org/article/CM_1996__103_3_319_0.pdf), §3, Theorems11,13, pp.339–343 — Hurwitz proof supplying the formulas.

Acceptance: In particular X₁(4) has genus2, X₀(5) genus2, and X₀(6) genus4, matching the arithmetic supplier models. The even correction cannot be omitted: at n=2 omitting it gives genus1/4, not0.


### Analytic inputs and marked monodromy

#### Rational quadratic differentials on the complex plane

**`DY.3/rational-quadratic-differentials` — definition.** A rational quadratic differential is q(z)dz² with q∈RatFunc ℂ. Its pole orders are those of q on the affine plane; at∞ use w=1/z, giving coefficient q(1/w)/w⁴. For a bounded measurable U⊂ℂ and q with at most simple affine poles, define its local mass ∫_U |q(z)| dA, using Lebesgue area on ℂ≃ℝ² and ignoring finitely many poles. It is finite on bounded sets. The double-pole differentials used for multiplier variation are the same rational carrier but are not assigned a finite mass on sets containing their poles.

Hypotheses and domain conventions: q rational; local mass assertions require at most simple affine poles. Affine local integrability does not imply integrability on the sphere.

The construction or proof proceeds as follows.

1. Use RatFunc ℂ; polynomial numerator/denominator and multiplicity give pole orders. The dz² notation is a coordinate label, with the stated inversion rule.
2. Represent evaluation away from poles by numerator/denominator; the arbitrary values at the finite poles do not change the integral.
3. Near a simple pole use |q(z)|≤C/|z−a| and polar integration; cover the bounded closure by finitely many pole discs and regular compact pieces.

Direct dependencies: `mathlib:RatFunc`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-1-the-rational-function-field`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §2.1, pp.2–3; §2.3, pp.8–10 — Local mass for simple poles and separate double-pole coefficients.

**API.** These are mathematical signatures on the specified object and domain.

- `rationalQuadraticDifferential` (data): Reuse RatFunc ℂ for the coefficient; record dz² and pole-coordinate convention.
- `quadraticDifferential_ext` (extensionality): Equality is equality of rational coefficients, equivalently agreement on any nonempty open set avoiding poles.
- `quadraticDifferentialPoleOrder` (projection): At a finite point use denominator minus numerator order; at∞ use q(1/w)/w⁴.
- `quadraticDifferentialMass` (data): Local Lebesgue integral of |q| over a bounded measurable set.
- `quadraticDifferentialMass_zero` (simp): The zero differential has mass0 on every set.
- `quadraticDifferentialMass_smul` (structure): Mass(aq,U)=|a|Mass(q,U); mass is subadditive.
- `quadraticDifferentialMass_mono` (relation): U⊂V implies mass(U)≤mass(V); strictly so for q≠0 if V∖U contains a nonempty open set away from poles.
- `quadraticDifferential_pole_change` (compatibility): Under z=h(w), coefficient becomes q(h(w))h′(w)²; at inversion this is q(1/w)/w⁴.

The interface serves `Gao–Ou Lemma2.2`: Supplies the local norm on which pushforward contracts.; `Gao–Ou Lemmas2.8–2.9`: Carries explicit double-pole multiplier differentials without a false integrability assertion.

**Unit tests.**

- `rational_quadratic_differentials_1` (computation): q=1/z has simple pole at0 and mass2πR on disc radiusR.
- `rational_quadratic_differentials_2` (non-example): q=1/z² has double pole at0 and infinite mass on every disc about0.
- `rational_quadratic_differentials_3` (compatibility): q=1 has no affine poles but a fourth-order pole at∞; treating it as a holomorphic differential on the sphere fails.

Acceptance: ∫_{|z|<R}|1/z|dA=2πR for R>0. ∫_{|z|<R}|1/z²|dA diverges; it is not admitted to the simple-pole mass theorem.

#### Pushforward of rational quadratic differentials

**`DY.3/polynomial-quadratic-pushforward` — construction.** For a nonconstant polynomial f over ℂ, define f_*q at regular values z by Σ_{f(w)=z}q(w)/f′(w)², summing distinct preimages; extend this rational function across the finite exceptional set. This gives a ℂ-linear operator RatFunc ℂ→RatFunc ℂ, functorial as (f∘g)_*=f_*∘g_*, with identity pushforward the identity. Simple affine poles stay at most simple; double poles can stay double. For f(z)=z^d+c, d≥2, f_*(1/z)=0 and, for a≠0, f_*(1/(z−a))=(1/f′(a))(1/(z−f(a))−1/(z−c)).

Hypotheses and domain conventions: f nonconstant; formulas on regular values first, rational extension second. The second displayed formula requires a≠0 for the unicritical map.

The construction or proof proceeds as follows.

1. Form the finite separable extension ℂ(f(z))⊂ℂ(z) and use its trace on q/f′²; identify the target rational coefficient with variable z.
2. On regular fibres trace equals the displayed finite sum. Extension, linearity and composition follow from rational-function equality and trace transitivity.
3. At poles use local expansions to bound the pushed pole order. For z^d+c sum over d-th roots to obtain Levin’s formulas.

Direct dependencies: `ArithmeticDynamics:DY.3/rational-quadratic-differentials`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §2.1, p.3; Lemma2.4, pp.3–4 — Pushforward definition, preservation of simple poles and unicritical formulas.

**API.** These are mathematical signatures on the specified object and domain.

- `polynomialQuadraticPushforward` (constructor): Linear trace operator with regular-fibre evaluation formula.
- `quadraticPushforward_regular` (characterisation): At a regular value avoiding pole images it equals the finite fibre sum.
- `quadraticPushforward_zero` (simp): Pushforward0=0.
- `quadraticPushforward_id` (simp): Pushforward by identity is identity.
- `quadraticPushforward_comp` (functoriality): (f∘g)_*=f_*∘g_* for nonconstant polynomials.
- `quadraticPushforward_poles` (relation): Affine poles lie among critical values and images of coefficient poles; simple poles remain simple.
- `unicriticalPushforward_simple` (compatibility): The two explicit formulas in the statement, including a≠0 for the second.

The interface serves `local-quadratic-contraction`: Uses the regular-fibre sum for the area change of variables.; `parabolic-parameter-transversality`: Expresses parameter derivatives as coefficients of f_*Q−Q.

**Unit tests.**

- `polynomial_quadratic_pushforward_1` (computation): For f=z², the coefficient1/z pushes to0 by cancellation of the two preimages.
- `polynomial_quadratic_pushforward_2` (computation): For f=z² and a=1, 1/(z−1) pushes to½(1/(z−1)−1/z).
- `polynomial_quadratic_pushforward_3` (non-example): For f=id, every coefficient is fixed by pushforward; nonconstant alone cannot imply absence of fixed differentials.

Acceptance: The construction extends rationally at critical values instead of evaluating a term with zero derivative. It applies to nonzero simple-pole coefficients used by smoothness and to the explicitly punctured double-pole calculation.

#### Local contraction for nonzero simple-pole differentials

**`DY.3/local-quadratic-contraction` — theorem.** Let f∈ℂ[z] have degree≥2 and q≠0 have at most simple affine poles. There is R>0 such that U=f⁻¹(ball(0,R)) has closure contained in V=ball(0,R), and for every sufficiently large such R, mass(f_*q,V)≤mass(q,U)<mass(q,V). Hence f_*q≠q. The zero differential and degree-one identity are excluded.

Hypotheses and domain conventions: Degree f≥2; q≠0; at most simple affine poles.

The construction or proof proceeds as follows.

1. Polynomial growth of degree≥2 gives a sufficiently large disc with relatively compact preimage.
2. Away from critical points the complex Jacobian is |f′|²; partition regular fibres and apply area change of variables and the triangle inequality. Exceptional finite sets have measure0.
3. The annular complement contains a nonempty open set; a nonzero rational coefficient cannot vanish there, giving strict mass loss.

Direct dependencies: `ArithmeticDynamics:DY.3/polynomial-quadratic-pushforward`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §2.1 Lemma2.2 and Corollary2.3, p.3 — Corrected local contraction with the necessary nonzero and degree hypotheses; see E9301.

Acceptance: For q=0 both masses are0; strict inequality fails. For f=id a nonzero q is fixed, demonstrating the degree hypothesis.

#### Transversality at unicritical parabolic parameters

**`DY.3/parabolic-parameter-transversality` — theorem.** For f_c(z)=z^d+c,d≥2, at an exact m-cycle with multiplierρ=1 the derivative ∂_c(f_c^m(z)−z) is nonzero and the cycle has one attracting petal. At an exact m-cycle with primitive r-th-root multiplierρ≠1 (r>1), the implicit continuation ζ(c) exists and its multiplierρ(c) has ρ′(c₀)≠0. For P(c,z)=(f_c^{mr}(z)−z)/(f_c^m(z)−z), polynomial division gives ∂_cP(c₀,z₀)=rρ′(c₀)/(ρ(ρ−1))≠0. Locally the relevant dynatomic branch is a graph c=c(z), with ramification index2 in the first case and r in the second.

Hypotheses and domain conventions: d≥2; m≥1; exact m-cycle and specified primitive multiplier. The one-petal and exact local ramification assertions use the unicritical ray/attracting-basin input recorded separately, not the simple-pole contraction alone.

The construction or proof proceeds as follows.

1. At multiplier1, form the rational simple-pole differential whose coefficients solve the orbit recurrence; its pushforward difference has the parameter derivative as its sole critical-value coefficient. Local-quadratic-contraction forces that coefficient nonzero.
2. At ρ≠1, use the implicit function theorem for the m-period equation and differentiate the divided equation to obtain the displayed identity.
3. For multiplier variation use Q=Σ_k(1/(z−z_k)²+μ_k/(z−z_k)), with μ_{k+1}=μ_k/f′(z_k)−(d−1)/(d z_k^d). Lemma2.8 gives f_*Q−Q=−(ρ′/ρ)/(z−c₀). Lemma2.9 excludes equality by puncturing discs about the cycle and comparing annular masses; double poles cannot use the simple-pole integral theorem.
4. Use the local parabolic normal form and the unique critical basin to give one petal for primitive parameters and r petals for a multiplier of exact order r; this is the named ray/basin gap G1.

Direct dependencies: `ArithmeticDynamics:DY.3/local-quadratic-contraction`, `ArithmeticDynamics:DY.3/unicritical-ray-landing`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §2.2 Cases2–3, pp.4–8; Lemmas2.6,2.8,2.9, pp.7,9–10; Lemma3.9 p.15 — Derivative calculation and the distinct double-pole argument.

Acceptance: For z²+c at(c,z)=(1/4,1/2), ∂_c(f−z)=1 and local projection is quadratic. At(c,z)=(−3/4,−1/2), m=1,r=2, the Φ₂ branch has local projection of index2.

#### Kneading sequences with a boundary symbol

**`DY.3/unicritical-kneading-sequence` — definition.** Fix d≥2. On T=ℝ/ℤ use τ(θ)=dθ. For θ represented in[0,1), let b_j=(θ+j)/d for0≤j<d. For k≥1, ν_θ(k) is ⋆ if τ^{k−1}(θ)=b_j for some j; it is j+1 if it lies strictly between b_j and b_{j+1} for0≤j<d−1; it is0 on the remaining open circular arc from b_{d−1} to b₀. The value ⋆ belongs to Option(Fin d), distinct from every digit. For θ of exact τ-period n, the first ⋆ is at k=n and the kneading sequence is periodic of length n. A word of length n ending in⋆ is cyclic if it is w^{s−1}w⋆ for a word w of length t<n with n=ts; w⋆ replaces only the final digit by⋆. Its cyclic expression uses the unique primitive such w.

Hypotheses and domain conventions: d≥2; normalized representative of θ in[0,1); indices k begin at1. Circular wrap interval has label0, not d; endpoints have label⋆.

The construction or proof proceeds as follows.

1. Use AddCircle1 for ℝ/ℤ and its normalized representative; make endpoint tests before open-arc tests.
2. The nth iterate criterion gives the first boundary visit and period of the sequence.
3. Primitive word means trivial cyclic-rotation stabilizer; the word-combinatorics node proves uniqueness of the primitive cyclic expression.

Direct dependencies: `mathlib:AddCircle`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §3.1 pp.11–13; Definitions3.3,3.6–3.7 pp.13–14 — Circle partition, boundary symbol, primitive and cyclic words.

**API.** These are mathematical signatures on the specified object and domain.

- `unicriticalKneading` (constructor): Sequence of Option(Fin d) obtained from the specified moving partition.
- `kneading_boundary_iff` (characterisation): ν_θ(k)=⋆ iff τ^{k−1}θ∈τ⁻¹{θ}.
- `kneading_digit_iff` (characterisation): Digit j iff in the explicitly labelled open arc; the arc for0 wraps around1.
- `kneading_period` (relation): Exact period n of θ gives first⋆ at n and n-periodic sequence.
- `cyclicKneadingExpression` (data): Primitive w,t,s with n=ts and displayed starred repetition.
- `cyclicExpression_unique` (extensionality): Two primitive cyclic expressions have equal word, length and repetition count.
- `maximalAngle_kneading` (compatibility): If θ has maximal representative in its orbit and base-d expansion .ε₁…εₙ, then εₙ≤d−2 and its block is ε₁…εₙ₋₁⋆.

The interface serves `Gao–Ou Lemmas3.11–3.12`: Distinguishes primitive from satellite parabolic parameters.; `transitive-marked-monodromy`: Gives a finite digit-sum ascent algorithm.

**Unit tests.**

- `unicritical_kneading_sequence_1` (computation): d=3,θ=1/7:12102⋆ repeats, with first⋆ at6.
- `unicritical_kneading_sequence_2` (computation): d=4,θ=28/31: maximal angle with expansion .32130 and kneading block3213⋆.
- `unicritical_kneading_sequence_3` (degenerate): θ=0 for every d: every symbol is⋆; no digit is assigned to the boundary.

Acceptance: For d=3,θ=1/7 the length6 block is12102⋆. The endpoint symbol must not be collapsed to digit0.

#### Primitive-word facts for kneading monodromy

**`DY.3/kneading-primitive-word-lemmas` — theorem.** Every nonempty finite word has a unique primitive root under concatenation. If a nonprimitive word is changed at exactly its last digit, the resulting word is primitive. A cyclic starred kneading block has a unique primitive cyclic expression. For a τ-periodic angle maximal in its orbit, its kneading block is its periodic base-d expansion with the last digit replaced by⋆.

Hypotheses and domain conventions: Nonempty words over Fin d; d≥2 for angle statements; maximality uses normalized representatives.

The construction or proof proceeds as follows.

1. Prove primitive-root uniqueness using the common-period/commuting-word argument.
2. If two words differing only in the last position were both powers, compare their distinct primitive-root lengths and repeat the cancellation argument of Gao–Ou Lemma3.5.
3. Two starred cyclic expressions either agree at the missing digit, so have the same primitive root, or give the forbidden one-digit change between powers.
4. For the maximal-angle assertion compare the moving partition with the fixed d-adic partition; the orbit avoids the intervening arcs.

Direct dependencies: `ArithmeticDynamics:DY.3/unicritical-kneading-sequence`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §3.1 Lemma3.2 pp.12–13; §3.2 Lemmas3.4–3.5, Proposition3.8 pp.13–14 — Combinatorial inputs without an internal-address theory.

Acceptance: 0101 is nonprimitive, whereas0100 is primitive. The cyclic expression of111⋆ is w=1,s=4; w=11,s=2 is not primitive.

#### Böttcher coordinates and unicritical external rays

**`DY.3/unicritical-external-ray-system` — construction.** For d≥2 let K_c={z: the forward orbit under f_c=z^d+c is bounded}, using the inherited escape-rate/bounded-orbit comparison and M_d={c:0∈K_c}. Construct the normalized Böttcher coordinate near∞, φ_c(f_c(z))=φ_c(z)^d and φ_c(z)/z→1. For c∈M_d extend it to ℂ∖K_c≅ℂ∖closedDisc(0,1). Define dynamical rays as inverse radial half-lines, with landing a radial limit as radius decreases to1; for c∉M_d extend the rays maximally, stopping at a critical preimage if continuation breaks. Construct the parameter coordinate Φ_d(c)=φ_c(c), a biholomorphism ℂ∖M_d→ℂ∖closedDisc(0,1); parameter rays are its inverse radial half-lines. These are actual curves, not names for arbitrary choices of landing functions.

Hypotheses and domain conventions: d≥2; normalization at∞ fixes the d−1 root-of-unity ambiguity. For disconnected K_c do not assert a global Böttcher isomorphism ℂ∖K_c; use maximal rays and their critical obstructions.

The construction or proof proceeds as follows.

1. Construct the near∞ Böttcher coordinate from iterated d-th roots and uniform convergence, normalized by its asymptotic expansion.
2. Extend on the escaping basin when K_c is connected; prove parameter uniformization and connectivity of M_d using the critical-value coordinate.
3. Analytic continuation along rays defines the maximal external ray; continuation ends at a precritical point or lands on K_c. The foundational source-to-baseline proof of these dynamical inputs is gap G1; the general conformal/monodromy theory is imported, not replanned.

Direct dependencies: `ArithmeticDynamics:DY.3/unicritical-kneading-sequence`, `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`, `ArithmeticDynamics:DY.2/escape-rate-nonpos-iff-bounded-orbit`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §3.3, pp.14–18 — Böttcher coordinates, dynamical and parameter rays, and critical obstructions.

**API.** These are mathematical signatures on the specified object and domain.

- `unicriticalBottcher` (constructor): Normalized conformal conjugacy near∞ with φ_c(z)/z→1.
- `bottcher_unique` (extensionality): Two normalized germs satisfying the conjugacy coincide.
- `bottcher_dynamics` (relation): φ_c∘f_c=(φ_c)^d on its specified domain.
- `unicriticalDynamicRay` (data): Inverse radial curve on its maximal continuation domain, with specified endpoint or critical obstruction.
- `unicriticalParameterRay` (data): Inverse radial curve for Φ_d(c)=φ_c(c).
- `externalRay_landing` (projection): Landing is the limit of the actual ray as its radial parameter tends down to1, when it exists.
- `externalRay_dynamics` (compatibility): f_c sends an unobstructed ray of angleθ to angle dθ and sends their landing points accordingly.
- `parameterCoordinate_unique` (universal-property): Normalized parameter biholomorphism is fixed by Φ_d(c)=φ_c(c), not an arbitrary Riemann map.

The interface serves `unicritical-ray-landing`: Specifies the actual rays and limits to which landing theorems apply.; `escaping-itinerary-conjugacy`: Defines the precritical-ray cuts which label symbolic sectors.

**Unit tests.**

- `unicritical_external_ray_system_1` (computation): c=0: dynamic rayθ lands at exp(2πiθ), and f_c carries that endpoint to exp(2πidθ).
- `unicritical_external_ray_system_2` (degenerate): θ=0,c=0: the ray is the positive real half-line (1,∞), with endpoint1.
- `unicritical_external_ray_system_3` (non-example): For d=2,c=2, the critical point escapes; a global conformal equivalence of its whole complement with the exterior unit disc is not the claimed coordinate.

Acceptance: For c=0, φ_c(z)=z outside the unit disc and the ray landing point is exp(2πiθ). Ray landing below is a separate theorem; general Carathéodory for Jordan boundaries does not imply it for Multibrot sets.

#### Periodic ray landing and unicritical parabolic structure

**`DY.3/unicritical-ray-landing` — theorem.** For d≥2, every periodic parameter ray of exact angle period n lands at a parabolic parameter c₀. Its dynamic ray lands at an exact m-period point with m|n and multiplier a primitive (n/m)-th root of unity. Each period-n hyperbolic component has one root at which two period-n parameter rays land and d−2 co-roots at which one such ray lands; the root is primitive when the two ray orbits are distinct. An exact m-cycle with primitive r-th-root multiplier has the local splitting into one m-cycle and one mr-cycle described in Gao–Ou Lemma3.9; at primitive multiplier1 a single parabolic cycle splits into two m-cycles. Unicriticality gives the one critical attracting basin and the exact petal count used in transversality. For approaching parameters along a landing ray, For the compactified critical-value ray R, any Hausdorff subsequential limit meets ∂K only at the corresponding parabolic point, agrees outside K with its landing ray, and meets int K only inside that point’s immediate basin. The limit S of the precritical pullbacks is f⁻¹(R), so its boundary intersection lies in the preimages of that point. These are the primitive and distinguished-satellite configurations used by the two monodromy propositions.

Hypotheses and domain conventions: d≥2; periodic angles; hyperbolic-component root/co-root assertion for n>1 as used in §3.3. This target uses gap G1: Gao–Ou recall deep ray and basin inputs rather than proving them; no existing ConformalMapping layer supplies polynomial dynamics.

The construction or proof proceeds as follows.

1. Prove periodic landing and the multiplier/angle-period relation using Böttcher coordinates, orbit portraits and parabolic local dynamics.
2. Use the multiplier map of a unicritical hyperbolic component (degree d−1, one branch point) to distinguish its unique root from d−2 co-roots.
3. Prove the local petal/splitting statement and the stated ray-limit control. Gao–Ou cite Douady–Hubbard, Eberlein and Petersen–Ryd here; a full source-to-library extraction is the remaining gap G1, with the exact required outputs in this statement.

Direct dependencies: `ArithmeticDynamics:DY.3/unicritical-external-ray-system`, `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §3.3 pp.14–18, Lemma3.9 p.15; §3.4 proof of Proposition3.13 pp.24–25 and Proposition3.15 pp.26–28 — Exact invoked ray/basin and Hausdorff-limit contracts, with their unexpanded suppliers identified.

Acceptance: For d=2,n=2 the period2 root c=−3/4 has fixed point−1/2, multiplier−1, and angle period2, not exact point period2. The co-root count is0 for d=2 and1 for d=3; copying the quadratic two-ray statement to every root/co-root fails.

#### Symbolic coding outside the Multibrot set

**`DY.3/escaping-itinerary-conjugacy` — theorem.** For c∉M_d lying on a nonzero-angle parameter ray, the d precritical dynamic rays cut the plane into sectors U₀,…,U_{d−1}, with U₀ containing ray0 and the others numbered counterclockwise. Itinerary gives a bijection ι_c:K_c→(Fin d)^ℕ conjugating f_c to the left shift. Thus exact point period equals exact sequence period. On X=ℂ∖(M_d∪R_{M_d}(0)), the inverse x(ι,c) for a fixed sequence is continuous in c, and for a periodic sequence is holomorphic. This supplies the consistent labels for periodic roots in the monodromy calculation.

Hypotheses and domain conventions: d≥2; c∈X; the cut label convention is part of the statement. Holomorphic periodic-root continuation is asserted on X, not across parabolic landing parameters.

The construction or proof proceeds as follows.

1. Each sector maps conformally to the slit critical-value complement; inverse branches form nested compact sets with unique intersection.
2. Recover the unique itinerary point; show conjugacy and exact period preservation. For periodic itineraries apply the implicit function theorem since their cycles are repelling outside M_d.
3. Parameter uniformization slit at ray0 makes X simply connected and fixes the labels.

Direct dependencies: `ArithmeticDynamics:DY.3/unicritical-external-ray-system`, `ArithmeticDynamics:DY.3/unicritical-ray-landing`, `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), §3.4, p.23 — The itinerary bijection, period equality and parameter dependence.

Acceptance: Constant itineraries give fixed points, not exact n-period points for n>1. Changing the sector orientation changes the labels and invalidates the specific adjacent-digit transposition below.

#### Local monodromy on labelled periodic points

**`DY.3/unicritical-parabolic-monodromy` — theorem.** Let θ have exact angle period n≥2 and kneading block ε₁…εₙ₋₁⋆. If its parameter ray lands at a primitive parabolic parameter, a sufficiently small positively oriented loop there exchanges the periodic roots labelled ε₁…εₙ₋₁k and ε₁…εₙ₋₁(k+1), where k is the final base-d digit of θ and labels are read mod d, and makes the corresponding exchanges on their cyclic iterates; other nearby roots are fixed. For θ=1−1/(d^n−1), the landing is satellite with fixed parabolic point and the loop permutes cyclically all n points in the cycle labelled (d−1)…(d−1)(d−2). A satellite landing of a maximal angle has cyclic kneading w^{s−1}w⋆ and final digit w_t−1; its parabolic period is |w|.

Hypotheses and domain conventions: d≥2,n≥2; analytic continuation based on the consistent labels from X; loops avoid all other branch parameters.

The construction or proof proceeds as follows.

1. At a primitive point the local projection is c=c₀+δ²; a turn exchanges its two branches. Ray-limit control identifies the two symbolic labels and their rotations.
2. At the distinguished satellite point the local projection is c=c₀+δ^n, so the branches cycle. Identify its fixed parabolic point with the maximal-angle orbit using Lemma3.14 and the ray-limit exclusion in Proposition3.15.
3. Lemma3.11 gives the satellite cyclic-expression constraint; Lemma3.12 constructs primitive landing angles when its digit constraint fails.

Direct dependencies: `ArithmeticDynamics:DY.3/parabolic-parameter-transversality`, `ArithmeticDynamics:DY.3/escaping-itinerary-conjugacy`, `ArithmeticDynamics:DY.3/kneading-primitive-word-lemmas`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), Lemmas3.11–3.12 pp.20–23; Proposition3.13 pp.23–25; Lemma3.14 and Proposition3.15 pp.25–28 — Labelled primitive transpositions and terminal satellite cycle.

Acceptance: A primitive loop exchanges whole orbit markings under rotation, not just two isolated marked roots while fixing their iterates. For d=2,n=2, a turn around−3/4 exchanges both points of the emerging 2-cycle.

#### Transitivity of unicritical marked-point monodromy

**`DY.3/transitive-marked-monodromy` — theorem.** For d≥2,n≥1, remove from the parameter plane the finite branch parameters of the period-n dynatomic curve. Analytic continuation acts transitively on its generic formal period-n roots (all exact period n there). Consequently the smooth affine dynatomic curve has one connected component and its defining polynomial is irreducible over ℂ[c,x].

Hypotheses and domain conventions: Generic parameter away from every branch value; n=1 handled by the explicit graph c=z−z^d.

The construction or proof proceeds as follows.

1. For n>1 rotate a primitive periodic word to its maximal lexicographic marking. If its maximal angle fails the satellite condition, primitive monodromy raises the last digit.
2. If it satisfies the satellite condition, use the primitive angles of Lemma3.12 successively to reach a word whose total digit sum increases. The sum is bounded by n(d−1)−1, so the process reaches the distinguished orbit with word(d−1)…(d−1)(d−2).
3. Use the distinguished satellite loop to connect every marking in that orbit; concatenate and reverse loops to connect any two initial roots.
4. For a smooth affine plane curve, transitivity gives connectedness and hence irreducibility; use analytic/algebraic comparison gap G2 for this final bridge.

Direct dependencies: `ArithmeticDynamics:DY.3/unicritical-parabolic-monodromy`, `ArithmeticDynamics:DY.3/formal-period-classification-char-zero`, `ArithmeticDynamics:DY.3/unicritical-dynatomic-polynomial`, `ArithmeticDynamics:DY.3/parabolic-parameter-transversality`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), Theorem3.1, pp.10–11; §3.5 pp.28–29 — Terminating digit-sum ascent and final orbit rotation.

Acceptance: Connectedness of unmarked cycles alone is insufficient; the terminal satellite loop connects all n markings. At n=1 the explicit graph is irreducible for every d≥2.

#### From analytic branches to the algebraic dynatomic curve

**`DY.3/analytic-dynatomic-identification` — comparison.** For d≥2,n≥1, the complex zero scheme of the inherited Φ*ₙ,d is reduced, smooth and geometrically integral; its complex points are the closure in ℂ² of exact n-period pairs with multiplier≠1. At a pair of exact period m dividing n with multiplier of order r>1, it belongs to that closure exactly when n=mr; multiplier1 points of exact n-period also belong. The complex smoothness/irreducibility descends to any characteristic-zero field by the integral-coefficient model and faithful field extension. This refines the inherited smooth-irreducible endpoint with the missing closure-to-equation and descent contracts.

Hypotheses and domain conventions: d≥2,n≥1; do not identify every root of f_c^n(z)−z with a dynatomic point. Formal/exact-period classification is the inherited one; boundary means closure minus the open exact-period, multiplier≠1 locus, not the topological boundary of a curve in ℂ².

The construction or proof proceeds as follows.

1. Use the inherited formal-period classification to list possible lower-period roots. Local transversality and parabolic splitting identify exactly which branches occur in the closure.
2. Local defining equations have a nonzero partial derivative; compare the monic product factorization f_c^n−z=∏_{e|n}Φ*ₑ to identify the reduced local equations, not only their zero sets.
3. Transitive marked monodromy gives irreducibility of the reduced curve. Transfer the analytic Jacobian and component assertions to smooth/geometrically integral affine schemes and descend by faithful field extension; gap G2 states the exact comparison input.

Direct dependencies: `ArithmeticDynamics:DY.3/unicritical-dynatomic-polynomial`, `ArithmeticDynamics:DY.3/dynatomic-polynomial-of-a-polynomial-map-product`, `ArithmeticDynamics:DY.3/formal-period-classification-char-zero`, `ArithmeticDynamics:DY.3/parabolic-parameter-transversality`, `ArithmeticDynamics:DY.3/transitive-marked-monodromy`.

Source support: [Y. Gao, Y. Ou](https://arxiv.org/pdf/1304.4751v1), Theorems1.1–1.2 p.1, Theorem2.1 p.2; §2.2 pp.4–9 and §3.5 pp.28–29 — Analytic closure and local branch description.; [E. V. Flynn, B. Poonen, E. F. Schaefer](https://arxiv.org/pdf/math/9508211v1), §2, pp.3–4 — Algebraic dynatomic curve and geometric irreducibility overℚ.

Acceptance: (c,z)=(−3/4,−1/2) belongs to the period2 curve but is exact period1, with multiplicity2 in the specialized Φ₂. (c,z)=(1/4,1/2) is on the period1 closure although removed from its multiplier≠1 open subset.


### Two rational three-cycles and the elliptic reduction

#### The symmetric curve for two marked 3-cycles

**`DY.3/morton-symmetric-three-cycle-curve` — definition.** Define H(t,u)=(t²−1)u³+(t³−2t²−9t+2)u²−9(t²−1)u−(t³−2t²−9t+2) overℚ, and let the affine Morton curve be H=0. It is symmetric in t,u. With ζ=t+u,υ=tu, its equation is υ²(ζ−2)−υ(6ζ+4)−(ζ³−2ζ²−9ζ+2)=0. Define t(c,x)=1+2c+2x+2x² on a marked period3 point. For t²≠1, its inverse is x=(t³+t²−t+7)/(4(t²−1)), c=−(t⁶−2t⁵+11t⁴+20t³+23t²−18t+29)/(16(t²−1)²). The rotation sends t to(t+3)/(1−t), and η(t)=(t³−9t)/(t²−1) is constant on the cycle, with c=−(η²−2η+29)/16.

Hypotheses and domain conventions: All explicit coordinates overℚ; inverses and rotation formulas have their displayed nonzero denominators. Two different cycles at the same c have η values adding to2; repeating the same cycle does not supply the required symmetric-curve point.

The construction or proof proceeds as follows.

1. Use the explicit Φ₃ polynomial of Morton §1 and eliminate c after introducing t; polynomial division gives the inverse formulas.
2. Substitute f_c(x) into t to find the fractional-linear rotation; sum its three orbit values to obtain η and its quadratic parameter relation.
3. For two distinct cycles the two roots η and2−η of that quadratic give H(t,u)=0. Expand in symmetric functions to obtain the displayed equation.

Direct dependencies: `ArithmeticDynamics:DY.3/quadratic-rational-cycles-of-length-at-most-three`, `mathlib:Polynomial.eval`.

Source support: [P. Morton](https://matwbn.icm.edu.pl/ksiazki/aa/aa62/aa6243.pdf), Theorem4 and equations(7)–(9), pp.347–348; §2 equations(17)–(24), pp.354–355; Lemma6 equation(35), p.363 — Parametrization, two-cycle relation and symmetric form.

**API.** These are mathematical signatures on the specified object and domain.

- `mortonThreeCycleEquation` (data): The explicit polynomial function H(t,u).
- `mortonThreeCycleEquation_swap` (simp): H(t,u)=H(u,t).
- `mortonThreeCycleEquation_symmetric` (characterisation): H(t,u)=υ²(ζ−2)−υ(6ζ+4)−(ζ³−2ζ²−9ζ+2) for ζ=t+u,υ=tu.
- `mortonThreeCycleParameter` (constructor): t(c,x)=1+2c+2x+2x² with inverse x(t),c(t) when t²≠1.
- `mortonThreeCycleRotation_compatibility` (compatibility): t(c,f_c(x))=(t+3)/(1−t) on exact period3 points; three applications give identity.
- `mortonCycleTrace_relation` (relation): η(t) is rotation invariant and c=−(η²−2η+29)/16.
- `distinctCycles_mortonEquation` (relation): Distinct rational exact3 cycles supply rational t,u with H=0 and t,u≠±1.

The interface serves `morton-elliptic-quotient-map`: Supplies the symmetric coordinates for the quotient.; `morton-rational-three-cycle-reduction`: Turns two distinct rational cycles into an excluded affine point.

**Unit tests.**

- `morton_symmetric_three_cycle_curve_1` (computation): All four sign pairs(t,u)=(±1,±1) satisfy H=0.
- `morton_symmetric_three_cycle_curve_2` (non-example): H(0,0)=−2; the equation is not identically0.
- `morton_symmetric_three_cycle_curve_3` (compatibility): For c=−29/16 the cycle(5/4,−1/4,−7/4) has t-coordinates3,−3,0 respectively, all sharing η=0.

Acceptance: The excluded t=±1 are poles/cusps of the parameter map; never substitute them into its rational inverse without a guard. The affine H-equation has the four rational solutions(t,u)=(±1,±1) after the arithmetic supplier theorem.

#### Explicit map from Morton’s curve to an elliptic curve

**`DY.3/morton-elliptic-quotient-map` — construction.** For H(t,u)=0 and ζ=t+u≠0, set υ=tu, X=(ζ+2)/ζ, Y=(υ(ζ−2)−(3ζ+2))/ζ². Then Y²=4X³−11X²+8X. On ζ≠0,2 this defines the quotient by t↔u; the inverse symmetric coordinates are ζ=2/(X−1), υ=(ζ²Y+3ζ+2)/(ζ−2), with t,u the roots of T²−ζT+υ. On the regular projective models this is the degree2 fixed-field quotient, but the affine point-exclusion proof uses only the guarded formulas. At ζ=0 the H-equation forces υ=−1, and at ζ=2 it forces υ=1; hence these cases have(t,u)=(1,−1),(−1,1), or(1,1).

Hypotheses and domain conventions: Rational coordinates; affine map requires ζ≠0; inverse requires ζ≠2, equivalently X≠2, and X≠1. Use the actual elliptic equation. Arithmetic rank-zero completeness belongs to ED.3, not this map.

The construction or proof proceeds as follows.

1. Insert the symmetric H equation and complete the square to derive the elliptic equation after multiplying by ζ⁴.
2. Solve the rational equations for ζ,υ with the guarded denominators; the quadratic T²−ζT+υ recovers the unordered pair.
3. Treat ζ=0,2 by polynomial substitution before division. Field invariants and AlgebraicCurves give the projective quotient if used, without adding its rational point computation.

Direct dependencies: `ArithmeticDynamics:DY.3/morton-symmetric-three-cycle-curve`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-11-automorphisms-and-the-hurwitz-bound`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

Source support: [P. Morton](https://matwbn.icm.edu.pl/ksiazki/aa/aa62/aa6243.pdf), §3 Lemma6, equations(33)–(36), p.363 — Map, inverse coordinates and exceptional points.

**API.** These are mathematical signatures on the specified object and domain.

- `mortonEllipticCoordinates` (constructor): The displayed X,Y on ζ≠0, with equation certificate from H=0.
- `mortonEllipticEquation` (compatibility): Y²=4X³−11X²+8X on the guarded domain.
- `mortonEllipticCoordinates_swap` (simp): Swapping t and u preserves X andY.
- `mortonElliptic_inverse` (relation): Recover ζ andυ by the displayed inverses when ζ≠0,2.
- `mortonElliptic_fibre` (characterisation): Away from the branch/exceptional locus equal X,Y gives equal unordered pairs {t,u}.
- `mortonExceptionalCoordinates` (relation): ζ=0 or2 implies the listed sign pairs, proved without rational division.
- `mortonElliptic_baseChange` (functoriality): The formulas commute with characteristic-zero field homomorphisms on their nonzero-denominator domains.

The interface serves `morton-rational-three-cycle-reduction`: Uses ED.3’s exact affine elliptic point list to exclude noncuspidal rational H-points.; `Morton Lemma6`: Identifies the involution fixed field on regular projective models.

**Unit tests.**

- `morton_elliptic_quotient_map_1` (computation): (t,u)=(−1,−1) has ζ=−2 and maps to(X,Y)=(0,0).
- `morton_elliptic_quotient_map_2` (degenerate): (1,−1) has ζ=0 and is outside the affine map domain; its symmetric relation still holds.
- `morton_elliptic_quotient_map_3` (non-example): (0,0) gives(X,Y) undefined by ζ=0 and is not on H=0; denominator guards cannot replace the curve hypothesis.

Acceptance: The exceptional ζ=0 case cannot be assigned the totalized value of rational division and treated as a valid map value. The unordered pair is encoded by the symmetric coordinates; the double cover needs its quadratic discriminant, not just a rational X,Y.

#### Reduction excluding two rational 3-cycles

**`DY.3/morton-rational-three-cycle-reduction` — theorem.** Using the certified ED.3 point list for E:Y²=4X³−11X²+8X, every rational solution of H(t,u)=0 has t∈{−1,1} and u∈{−1,1}. Consequently for f_c=z²+c overℚ there is at most one exact rational 3-cycle. The dynamical-to-H step requires two distinct cycles, and produces t,u≠±1, so contradicts the affine point statement. No general genus-four rational point enumeration is required.

Hypotheses and domain conventions: The arithmetic input is the ED.3 theorem for this actual elliptic curve: affine rational points exactly(0,0),(1,±1),(2,±2). It is a requested implementation theorem, not a test asserting the number of points or an arbitrary certificate parameter.

The construction or proof proceeds as follows.

1. If ζ=0 or2 use the exceptional-coordinate identities. Otherwise form the elliptic X,Y from the guarded map.
2. The point list forces X=0,1,2. X=1 is impossible from X=1+2/ζ; X=2 implies ζ=2, already excluded. At X=0 the list forces Y=0, hence ζ=−2 andυ=1, giving t=u=−1.
3. For two exact rational3 cycles, the inherited parametrization plus Morton t-coordinate gives distinct η roots and an H-point away from t,u=±1. The exceptional c=−7/4 has Φ₃=(x³+x²/2−9x/4−1/8)², whose cubic has no rational root by the rational root theorem, so contributes no rational3 cycle.
4. Import ED.3/rank-zero-curves only for the Morton model; its separate E11 rank gap does not affect this argument. This supplies the missing reduction behind the inherited at-most-one-cycle claim.

Direct dependencies: `ArithmeticDynamics:DY.3/morton-elliptic-quotient-map`, `EffectiveDiophantineMethods:ED.3/rank-zero-curves`.

Source support: [P. Morton](https://matwbn.icm.edu.pl/ksiazki/aa/aa62/aa6243.pdf), Theorem3 p.346; §3(iii), Lemma6 and its following argument pp.362–364 — At-most-one-cycle theorem and elliptic reduction; the affine elimination is an equivalent shorter adapter.

Acceptance: For c=−29/16 the cycle(5/4,−1/4,−7/4) exists; the theorem permits it and excludes a disjoint second cycle. The argument proves an exact affine list for H; it does not identify four affine points with the nine rational places on its normalization.


### Certified candidates, execution and arithmetic consumers

#### Relative height bounds for certified dynamical candidates

**`DY.3/relative-height-candidate-adapter` — comparison.** Let K be a number field of degree s=[K:ℚ]>0. For P∈ℙ¹(K), use the inherited absolute logarithmic height h_abs(P)=Height.logHeight(P.rep)/s. Suppose the DY.3 preperiodic bound gives h_abs(P)≤B for every preperiodic P. Given the ED.0 certified enumeration with rational D≥1,0<τ≤1 and D≥exp(sB), its projective union T of both output lists plus∞ contains every preperiodic point. Filtering T by the inherited orbit-repetition check of fuel |T|+1 yields exactly PrePer(f,ℙ¹(K)); equality tests at the height boundary are unnecessary. This adapter supplies a sufficient finite superset, and does not advertise T as an exact height-cutoff list.

Hypotheses and domain conventions: Degree f≥2; the rational map is defined over K and has no projective base point. An explicit valid B, integral power basis and complete embedding certificates are supplied; D≥exp(sB), with s present. Exact field/projective evaluation and equality are supplied by the runtime adapter.

The construction or proof proceeds as follows.

1. Multiply the absolute-height inequality by positive s; exponentiate to get native multiplicative height≤D. The affine/projective height dictionary identifies Height.logHeight₁(x)=Height.logHeight![x,1].
2. ED.0 completeness applies to both lists together, including every boundary point; add∞ of height0 as in its projective contract.
3. Forward iterates of a preperiodic point remain preperiodic and hence stay in T. The inherited filter correctness theorem supplies both soundness and completeness with finite fuel. No uniform-in-map bound is used.

Direct dependencies: `ArithmeticDynamics:DY.3/height-bound-for-preperiodic-points`, `ArithmeticDynamics:DY.3/preperiodic-filter-correct`, `ArithmeticDynamics:DY.3/rational-preperiodic-enumeration-over-a-number-field`, `EffectiveDiophantineMethods:ED.0/bounded-height-enumeration`, `ArithmeticDynamics:DY.3/exact-dynamical-runtime-adapter`, `mathlib:Height.logHeight₁_eq_logHeight`, `mathlib:NumberField.mulHeight₁_eq`.

Source support: [J. R. Doyle, D. Krumm](https://arxiv.org/pdf/1111.4963v4), §2 p.2; Algorithm4 output, §4.3 p.11 — Relative height and complete two-list contract; the factor s converts DY’s absolute height convention.

Acceptance: K=ℚ,s=1: D≥exp(B) is sufficient. For a quadratic field and rational point[2:1], h_abs=log2 but native multiplicative height=4; D=2 would use the wrong normalization. An additional near-boundary wandering candidate is rejected by the orbit check; preperiodic points on the boundary are retained.

#### Exact evaluation and equality on computational projective points

**`DY.3/exact-dynamical-runtime-adapter` — comparison.** Transport CN.0’s exact number-field representation and operations through its certified realization into K, then use the two-chart representation K⊔{∞} of ℙ¹(K). Evaluate the inherited coprime homogeneous forms F₀,F₁ on a representative; if F₁=0 return∞, otherwise return F₀/F₁ in the affine chart. Equality is infinity-vs-affine discrimination plus exact equality in K. Prove realization commutes with evaluation, equality and every iterate. This is the bridge needed to execute the inherited finite orbit filter; a classical DecidableEq on K or a floating-point approximation is not the runtime contract.

Hypotheses and domain conventions: K a number field given by an irreducible rational defining polynomial and certified realization; exact coefficients of F₀,F₁. No common projective zero; CN.0 must supply exact terminating arithmetic/equality with semantic realization, not only isolated-number certificates unconnected to K.

The construction or proof proceeds as follows.

1. Request the carrier/realization and operation correctness from CN.0; its existing algebraic-equality-check node alone does not give a computable realization of the whole number field.
2. Use the inherited projective chart equivalence and rational-map action. The base-point-free hypothesis excludes(F₀,F₁)=(0,0), including at∞.
3. Induct over the finite orbit trace to transport every exact comparison and iterate; the repeated state is a genuine projective equality.

Direct dependencies: `ComputationalNumberTheory:CN.0`, `ComputationalNumberTheory:CN.0/algebraic-equality-check`, `ArithmeticDynamics:DY.0/rational-map-action-on-points`, `ArithmeticDynamics:DY.3/orbit-repetition-check`.

Source support: [J. R. Doyle, D. Krumm](https://arxiv.org/pdf/1111.4963v4), §1 p.1; §2 p.2; §4.3 pp.11–13 — Dynamical motivation and exact algebraic outputs whose orbit evaluation is the consumer-side adapter.

Acceptance: For f=z²−1,∞ evaluates to∞ and0↦−1↦0 is detected exactly. For f=1/z²,∞↦0↦∞ must be represented, not dropped by an affine-only evaluator. Conjugate roots of one minimal polynomial are not equal unless the selected exact field representations realize the same element.

#### Arithmetic point-list hypotheses retained by the dynamical reductions

**`DY.3/arithmetic-point-list-contracts` — comparison.** The inherited dynamical-to-curve reductions consume the actual ED.3/ED.4 models with their stated completeness hypotheses. Morton’s elliptic list and the FPS C₀(5) six-point list are unconditional targets. The eight-point list on C₁(3₂):y²=x⁶−2x⁴+2x³+5x²+2x+1 requires rank Jac(C₁(3₂))(ℚ)≤1; the supplier presently proves completeness only for points in the saturation of its known subgroup without that rank bound. The ten-point list on X₀^dyn(6) requires rank Jac(X₀^dyn(6))(ℚ)≤3; its unconditional saturation result is likewise not all-point completeness. Every inherited exclusion or classification using either list must retain the corresponding rank hypothesis until the supplier closes it. No UBC or Poonen conjecture is used to certify these lists.

Hypotheses and domain conventions: Use ED’s actual models and birational exceptional-point bookkeeping. E11’s missing rank-zero proof is independent of the unconditional Morton elliptic list. The analytic route to the genus-four rank bound requires analytic continuation, functional equation, weak BSD and certified L‴(J,1)≠0; a decimal approximation is not the certificate.

The construction or proof proceeds as follows.

1. Match the explicit polynomial models, known points, base point and Jacobian rank contract before invoking the supplier.
2. Transport rational points through the inherited birational maps with every denominator-zero case included; a rational cycle quotient point only gives a Galois-stable cycle until the lift is checked.
3. For C₁(3₂) and X₀^dyn(6), apply all-point completeness only under their rank bounds. Otherwise expose the precise saturation conclusion and leave unconditional dynamical exclusion gated.
4. Import descent, torsion, saturation and Chabauty from ED; this node compares their scope with DY’s consumers, rather than proving the arithmetic a second time.

Direct dependencies: `EffectiveDiophantineMethods:ED.3/rank-zero-curves`, `EffectiveDiophantineMethods:ED.3/poonen-genus-two-mordell-weil`, `EffectiveDiophantineMethods:ED.3/stoll-genus-four-subgroup`, `EffectiveDiophantineMethods:ED.4/fps-quintic-cycle-curve`, `EffectiveDiophantineMethods:ED.4/poonen-type-three-two-curve`, `EffectiveDiophantineMethods:ED.4/stoll-six-cycle-curve`, `ArithmeticDynamics:DY.3/poonen-type-three-two`, `ArithmeticDynamics:DY.3/stoll-conditional-no-rational-six-cycles`, `ArithmeticDynamics:DY.3/dynatomic-cycle-quotient`.

Source support: [E. V. Flynn, B. Poonen, E. F. Schaefer](https://arxiv.org/pdf/math/9508211v1), Theorems1–3, pp.1–2,6–8 — Genus-two quotient model and distinction between Galois-stable and rational marked cycles.

Acceptance: At x=2 on the Poonen model the sextic equals73, while at x=−2 it equals33; the supplier’s corrected rank gap cannot be silently removed. An all-point theorem under rank≤3 remains conditional even when its ten known points and subgroup rank3 are certified.

### Examples and endpoint checks

The quadratic genus formulas give the following independent arithmetic checks. They refer to geometric genus of the regular model, not arithmetic genus of a plane embedding.

| n | g(X₀(n)) | g(X₁(n)) |
|---|---:|---:|
| 1 | 0 | 0 |
| 2 | 0 | 0 |
| 3 | 0 | 0 |
| 4 | 0 | 2 |
| 5 | 2 | 14 |
| 6 | 4 | 34 |
| 7 | 16 | 124 |
| 8 | 32 | 285 |
| 9 | 79 | 745 |
| 10 | 162 | 1690 |

For n=6, ν=27 and b₆=20. The quotient degree is2ν/n=9 and it has five places above infinity. Its different degree is20+(9−5)=24; Hurwitz gives2g−2=−18+24, hence g=4. On the marked model the degree is54, the finite different is6·27−(2+4+9)=147 and the infinity contribution is27. Thus2g−2=−108+174=66 and g=34. The two map degrees and their distinct infinity inertia must not be interchanged.

For c=−29/16 the cycle(5/4,−1/4,−7/4) has Morton coordinates3,−3,0, all with trace0. The theorem permits these three markings of one cycle. To exclude a disjoint cycle, the trace relation constructs a point of H away from t,u=±1, which the affine elliptic list excludes. At ζ=0 or2, polynomial identities give the exceptional sign pairs before any division. At the remaining rational elliptic points X=1 is impossible for finite nonzero ζ, X=2 returns the excluded ζ=2 case, and X=0,Y=0 gives t=u=−1. The four affine H-points are distinct from the nine rational places on its normalization.

## Supplier contracts and open closure

- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-0-function-fields-constant-fields-and-places`: One-variable function fields, exact constants and places for the dynatomic function field. Consumed by `DY.3/projective-dynatomic-model`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-1-the-rational-function-field`: Genus0 of the rational function field, rational differential coefficient and places. Consumed by `DY.3/quadratic-dynatomic-genera`, `DY.3/rational-quadratic-differentials`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`: Integral closure and the smooth affine-model/function-field comparison. Consumed by `DY.3/projective-dynatomic-model`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`: Genus of a function field and its regular projective model. Consumed by `DY.3/quadratic-dynatomic-genera`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields`: Finite separable extension degree and rational-function trace. Consumed by `DY.3/dynatomic-cycle-quotient`, `DY.3/polynomial-quadratic-pushforward`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula`: Tame different exponent e−1 and the Hurwitz genus formula. Consumed by `DY.3/quadratic-parameter-ramification`, `DY.3/quadratic-dynatomic-genera`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`: Characteristic-zero base change preserves geometric integrality and genus. Consumed by `DY.3/projective-dynatomic-model`, `DY.3/quadratic-dynatomic-genera`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-11-automorphisms-and-the-hurwitz-bound`: Fixed-field degree and quotient by a finite cyclic automorphism group. Consumed by `DY.3/dynatomic-cycle-quotient`, `DY.3/morton-elliptic-quotient-map`.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`: Unique regular projective models, finite maps from inclusions of function fields, normalization, and extension of affine maps. Consumed by `DY.3/projective-dynatomic-model`, `DY.3/dynatomic-cycle-quotient`, `DY.3/morton-elliptic-quotient-map`.
- `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l4--analytic-continuation--the-reflection-principle`: Normalized conformal coordinates, analytic continuation, and general monodromy/lifting theorems, specialized to the explicitly specified dynamical domains. This request does not assert periodic ray landing or parabolic basin theory. Consumed by `DY.3/unicritical-external-ray-system`, `DY.3/unicritical-ray-landing`, `DY.3/escaping-itinerary-conjugacy`.
- `ComputationalNumberTheory:CN.0`: For an irreducible p∈ℚ[X], a computable exact carrier for ℚ[X]/(p), a field realization into the specified K, terminating arithmetic and decidable equality, each operation/equality commuting with realization. This is stronger than algebraic-equality-check on isolated numbers. DY owns only the projective evaluator adapter. Consumed by `DY.3/exact-dynamical-runtime-adapter`.

The arithmetic node imports are finer than stage requests: `ED.0/bounded-height-enumeration`, `ED.3/rank-zero-curves`, `ED.3/poonen-genus-two-mordell-weil`, `ED.3/stoll-genus-four-subgroup`, `ED.4/fps-quintic-cycle-curve`, `ED.4/poonen-type-three-two-curve` and `ED.4/stoll-six-cycle-curve` refer throughout to `EffectiveDiophantineMethods`. Their existence as blueprint targets does not mean that their Lean certificates have been implemented. FPS's C₀(5) list is exactly its two infinities and (0,±1),(−3,±1). Its quotient point does not by itself give a rational 5-cycle; the inherited lift check is essential. Poonen's C₁(3₂) eight points and Stoll's ten points have the rank conditions stated above. ED retains E11's separate unresolved descent. DY's inherited consumers of E11 retain that supplier gap; it does not contaminate the Morton list.

Every inherited Poonen type exclusion, no-long-tails statement or final classification that uses C₁(3₂) completeness is read with the rank≤1 gate of `arithmetic-point-list-contracts`. Until that gate is supplied, the corrected conditional chain is the deliverable. This continuation does not rewrite the accepted parent into an unsupported unconditional proof. Stoll's period6 theorem retains its rank≤3 gate and any analytic proof of the gate retains the extra analytic hypotheses and a nonvanishing certificate. The genus-four subgroup lower bound of3 is not an upper bound.

The candidate routine deliberately uses the union of both ED lists. Their contract gives a superset of the exact height ball, including every boundary point. If T includes wandering points just outside the ball, filtering discards them. If a preperiodic point is in T, all its iterates are also in T by the same universal preperiodic height bound; after |T|+1 states a repetition occurs. If a wandering orbit leaves T it cannot later be mistakenly accepted; if it stays within T for the fuel it repeats and is therefore preperiodic. This is finite termination for each input map, independent of the Uniform Boundedness conjecture.

A quadratic map example f(z)=z²−1 has the exact finite orbit0→−1→0 and a fixed infinity. An affine-only evaluator misses infinity, and rounded equality can create a false cycle. The chart test f(z)=1/z² exercises∞→0→∞. Over a quadratic field, the rational scalar2 has native multiplicative height4 and absolute logarithmic heightlog2. Therefore the certified relative-height radius is exp(2B), not exp(B). Exact arithmetic in the field and a semantic realization are needed even when an isolated algebraic-number comparison routine exists.

### G1: foundational unicritical ray, basin and ray-limit inputs

Gao–Ou §3.3 and proofs of Propositions3.13,3.15 recall rather than derive Böttcher/parameter uniformization, periodic parameter-ray landing for every d≥2, root/co-root and petal structure, and the precise Hausdorff R,S limit contracts. These are now named targets with exact output statements, but their source-to-pinned-library extraction is missing. General ConformalMapping continuation does not supply polynomial dynamics. Resume with the cited Douady–Hubbard/Eberlein/Petersen–Ryd primary proofs, keeping the d≥2 scope. No claim of closed analytic chains. Needed by `DY.3/unicritical-external-ray-system`, `DY.3/unicritical-ray-landing`, `DY.3/parabolic-parameter-transversality`, `DY.3/unicritical-parabolic-monodromy`.

### G2: analytic-to-algebraic dynatomic comparison

Need the precise comparison identifying the reduced analytic closure with the integral-coefficient dynatomic zero scheme, transferring the nonzero local partial derivative to algebraic smoothness, and transferring connected smooth analytic curve to geometric integrality with faithful characteristic-zero descent. The parent states the algebraic endpoint, but its earlier complex-dynamics gap does not discharge this bridge. Baseline algebraic Jacobian/descent ingredients and AlgebraicCurves models do not by themselves constitute this analytic comparison. Needed by `DY.3/analytic-dynatomic-identification`, `DY.3/transitive-marked-monodromy`.

### G3: supplier Poonen rank bound remains conditional

ED.3/poonen-genus-two-mordell-weil records the corrected descent rank≤1 calculation as missing. ED.4 supplies saturation completeness without it. Retain rank≤1 on every dependent all-point exclusion; source correction/proof belongs to ED, not a duplicated DY descent. Needed by `DY.3/arithmetic-point-list-contracts`.

G1 and G2 are precise remaining extraction/comparison work, rather than missing targets silently supplied by general complex analysis. G3 is an arithmetic supplier gap. The stage is planned because every target and key input now has an exact node, a checked library import, a supplier contract or one of these named gaps. It is not closed while these remain. The additional genus-four rank hypothesis is explicit conditional mathematics, not a claim that its analytic proof has already been certified.

## Baseline declarations and prototyping boundary

- `mathlib:RatFunc`, `Mathlib/FieldTheory/RatFunc/Defs.lean`: For a commutative ring K, rational functions are carried by FractionRing(K[X]); used over fields. Statement read at pinned commit on 2026-10-14; Mathlib/FieldTheory/RatFunc/Defs.lean:67.
- `mathlib:Polynomial.eval`, `Mathlib/Algebra/Polynomial/Eval/Defs.lean`: Evaluation of a polynomial in a semiring at an element; used for the explicit Morton equations. Statement read at pinned commit on 2026-10-14; Mathlib/Algebra/Polynomial/Eval/Defs.lean:250.
- `mathlib:MulAction.orbitRel`, `Mathlib/GroupTheory/GroupAction/Defs.lean`: For a group acting on a type, the setoid of being in the same orbit; used for finite word quotients. Statement read at pinned commit on 2026-10-14; Mathlib/GroupTheory/GroupAction/Defs.lean:287.
- `mathlib:ArithmeticFunction.moebius`, `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`: Integer-valued Möbius function, zero on nonsquarefree integers and (−1)^cardFactors otherwise. Statement read at pinned commit on 2026-10-14; Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51.
- `mathlib:Nat.totient`, `Mathlib/Data/Nat/Totient.lean`: Counts natural numbers below n coprime with n; used in the ramification/genus sums. Statement read at pinned commit on 2026-10-14; Mathlib/Data/Nat/Totient.lean:39.
- `mathlib:AddCircle`, `Mathlib/Topology/Instances/AddCircle/Defs.lean`: For an additive commutative group, the quotient by integer multiples of p; p=1 over ℝ supplies angles. Statement read at pinned commit on 2026-10-14; Mathlib/Topology/Instances/AddCircle/Defs.lean:188.
- `mathlib:Height.logHeight₁_eq_logHeight`, `Mathlib/NumberTheory/Height/Basic.lean`: Under the ambient admissible absolute-value/height assumptions, scalar logarithmic height equals tuple height of[x,1]. Statement read at pinned commit on 2026-10-14; Mathlib/NumberTheory/Height/Basic.lean:562.
- `mathlib:NumberField.mulHeight₁_eq`, `Mathlib/NumberTheory/Height/NumberField.lean`: For a number field, native multiplicative height equals the product of max(|x|,1) over infinite places with multiplicities and finite places; no division by field degree. Statement read at pinned commit on 2026-10-14; Mathlib/NumberTheory/Height/NumberField.lean:111.

The suggested file keeps real rational functions for H, t(c,x), inverse x(t),c(t), the rotation, trace and elliptic coordinates. Its milestones express the affine elliptic identity, exceptional cases, the exact-list-to-H-point reduction, the at-most-one-cycle conclusion using native `Function.minimalPeriod`, and the native-height radius conversion. Numeric abbreviations `quadraticNu`, `quadraticEvenCorrection`, `quadraticGenusOneExpression` and `quadraticGenusZeroExpression` record the rational formulas; they are not constructed geometric genus carriers. The full geometric equality is a reader target. The real-bodied definitions do not use placeholder data. The equation-based arithmetic hypothesis in `mortonRationalAffinePoints` is precisely the future ED theorem, rather than an arbitrary property field replacing a proof.

The unavailable carrier-dependent signatures are retained above for `dynatomicProjectiveModel`, `dynatomicCycleModel`, the necklace and kneading interfaces, rational quadratic pushforward/local mass, Böttcher/ray objects, monodromy/comparison and the certified runtime representation. They require the corresponding planned theory. They are omitted from the Lean file rather than turned into axioms, structures of abstract propositions, or invented projective-model/ray types. All their APIs, tests and domains remain mandatory mathematical targets in the reader/packet. Even when a coefficient carrier such as RatFunc exists, the coordinate differential/trace/integration interface is part of that mathematical target; no new theory is developed in the suggested file.

## Sources and corrections

All following source statements and proof outlines are in the worker's own words. Locators refer to printed page numbers or arXiv page numbers, not PDF cover pages. Source PDFs were read only in scratch; none is a repository artifact. The packet records the SHA-256 of each exact PDF and the access date 2026-10-14. The Gao–Ou PDF served by the v1 URL has a December 6, 2021 heading, so its exact hash, URL and locators identify the version used without inferring a different version history.

- [E. V. Flynn, B. Poonen, E. F. Schaefer, *Cycles of quadratic polynomials and rational points on a genus-2 curve*](https://arxiv.org/pdf/math/9508211v1). arXiv:math/9508211v1. Read: §§1–3, pp.1–8: dynatomic models, genera, rational-cycle reduction. SHA-256 `95d4c96eb64febc9b4fc7cb980715777e27fa4d315a8e88cd20fc8d6cfb7577d`.
- [Y. Gao, Y. Ou, *The dynatomic periodic curves for polynomial z↦z^d+c are smooth and irreducible*](https://arxiv.org/pdf/1304.4751v1). arXiv:1304.4751v1, exact downloaded PDF. Read: §§1–3, pp.1–29: smoothness, quadratic differentials, kneading and marked monodromy. SHA-256 `a2c363d622ba6d6dee71cb803eca1f4a4bf411a110e5c783c7737a0ba0e6ee69`.
- [J. R. Doyle, B. Poonen, *Gonality of dynatomic curves and strong uniform boundedness of preperiodic points*](https://arxiv.org/pdf/1711.04233v2). arXiv:1711.04233v2. Read: §1, pp.1–3: normalization, rotation quotient and characteristic-zero conventions. SHA-256 `421ecf47e166109186ac8e4b6c583070693bf8af9ee8c242318a9dab13a25625`.
- [P. Morton, *Arithmetic properties of periodic points of quadratic maps*](https://matwbn.icm.edu.pl/ksiazki/aa/aa62/aa6243.pdf). Acta Arithmetica62 (1992),343–372. Read: §§1–3, pp.343–364: Theorems3–4, parametrization, symmetric curve and elliptic quotient. SHA-256 `ae8322fcbd7d8e1faa98163c5587d8884d527b233803c2f809fd8ee821c0b7af`.
- [P. Morton, *On certain algebraic curves related to polynomial maps*](https://www.numdam.org/article/CM_1996__103_3_319_0.pdf). Compositio Mathematica103 (1996),319–350. Read: §1 pp.319–324; §3 pp.336–343: different, infinity places, and characteristic-zero genus formulas. SHA-256 `9d821a7eb4453dd5864f8aa9b46907f5c3ea70b2eb53d381eabf6a899e91cda7`.
- [P. Morton, *Corrigendum: On certain algebraic curves related to polynomial maps*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/86C226AF3E2053463B6871D90108413F/S0010437X1000480Xa.pdf/corrigendum_on_certain_algebraic_curves_related_to_polynomial_maps_compositio_math_103_1996_319350.pdf). Compositio Mathematica147 (2011),332–334. Read: All pp.332–334: finite-characteristic correction; no change to the characteristic-zero formulas used here. SHA-256 `5eec9fba8946071061522eba81de2b6559e5720e62796ad054b2930c3b9ee6bd`.
- [J. R. Doyle, D. Krumm, *Computing algebraic numbers of bounded height*](https://arxiv.org/pdf/1111.4963v4). arXiv:1111.4963v4. Read: §1 p.1; §2 p.2; §4.3 Algorithm4 p.11 and §4.4 p.13: relative height and two-list guarantee. SHA-256 `8dc2ca7f92654510e4cb20c7198abd345b603972959774def58173defa36fab8`.

Corrections relevant to this continuation:

- **`ArithmeticDynamics/E9301`**, Gao–Ou, arXiv:1304.4751v1, Lemma2.2 and Corollary2.3, p.3 (downloaded PDF hash in sources). The strict local-mass inequality and absence of fixed quadratic differentials are stated without excluding the zero differential; the corollary also does not state the polynomial degree restriction. This is a paraphrase, not a source quotation. Correction: Require q≠0 and degree(f)≥2. Keep the non-strict pushforward mass estimate for q=0. Reason: q=0 has equal zero masses and is fixed; identity f has degree1 and fixes every differential. The proof requires a disc whose preimage is relatively compact in itself, provided by degree≥2. All f=z^d+c consumers already have d≥2. Reach: a stated result. Correction provenance: No correction located in the primary arXiv record or the correction searches on 2026-10-14; recorded for independent checking, not asserted to be a new discovery.
- **`ArithmeticDynamics/E9302`**, Gao–Ou, arXiv:1304.4751v1, Lemma2.9 proof, p.10. The coefficient near the cycle point is described with a first-order pole although Q was defined with coefficient1 on its double pole; the ensuing radial integral uses inverse-square growth. The printed annular set labels also interchange the two differences. This records the content in own words. Correction: Use q(z)~1/(z−z₀)². Bound the relevant annular difference near each cycle point by an annulus with inner/outer radii ratio tending to1; its double-pole mass is asymptotically2π log of that ratio. State the inclusions for the annular difference actually being bounded. Reason: The explicit Q in Lemma2.8 has a double pole at each cycle point. A first-order asymptotic contradicts that definition. The displayed disc containment cannot literally hold for a difference excluding the disc. The logarithmic annular estimate is the intended calculation. Reach: the proof. Correction provenance: No published correction located by the same primary-record and author/title searches on 2026-10-14.
- **`ArithmeticDynamics/E9303`**, Morton 1996 Theorem15 Case2 and Proposition17 p.346, as identified by Morton’s 2011 corrigendum pp.332–333 (the correction was read in full). The original characteristic-p argument passes from a factorization after reduction to polynomial factors over the lifted p-adic coefficient field using Hensel lifting alone. Own-word account of the gap identified by the author. Correction: Hensel lifting first gives power-series coefficients. Use the distinct Laurent expansions of dynatomic roots to obtain degree bounds independent of the lifting precision, forcing the limit coefficients to be polynomials, as in the2011 corrigendum. Reason: Hensel lifting without the degree bound yields R[[c]], not R[c]. The characteristic-zero genus results used by this packet are in §3 and do not rely on this characteristic-p lifting step. Reach: the proof. Correction provenance: Published correction: Morton, Compositio Mathematica 147 (2011),332–334, DOI10.1112/S0010437X1000480X. The corrigendum also gives bibliography renumbering17–20 to16–19.

The parent `ArithmeticDynamics/E401` already records and independently confirms the FPS Möbius exponent correction. The present packet references it without duplicating its identifier or copying its source quotation. The Morton 2011 corrigendum repairs a finite-characteristic lifting proof; it does not alter the characteristic-zero genus statements used here. The Poonen descent correction and missing upper-rank calculation are owned and recorded by ED.3. No uncleared book was used. The primary deep ray/basin proofs identified by Gao–Ou remain the missing-source extraction in G1, rather than falsely being listed as read.
