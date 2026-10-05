# Elliptic curves, Part II: Legendre models, descent and character interfaces

This roadmap constructs the equation-level interfaces used in Bennett–Siksek’s treatment of perfect powers in arithmetic progressions. It extends **tauceti:TauCetiRoadmap/EllipticCurves** and starts after its generic Weierstrass equations, point group, torsion, reduction, quadratic twists and descent. The new work is not another elliptic-curve carrier or another descent map. It names specific coefficient models, fixes the order in which their split cubic is evaluated, and proves the rational and finite-field statements that these equations support.

The endpoints are independent mathematical results: normalization of a rational full-two-torsion curve by an admissible coordinate change and a Legendre twist; good-odd-prime units for every associated parameter; support and divisibility of primitive quadratic-character conductors; an embedded group Z/2×Z/4 when the finite-field parameter is a square at a prime 3 modulo 4; exact two-adic point-count valuation at the parameter −1 and primes 5 modulo 8; a corrected explicit point of order four on the twist by two; and trace zero on the symmetric cubic at primes 3 modulo 4. There are no progression length, exponent, irreducibility or modularity hypotheses in these generic finite-field statements.

## Scope and conventions

Write Lλ for the Weierstrass equation y²=x(x−1)(x−λ), and Ld,λ for y²=x(x−d)(x−dλ). Their native five coefficient tuples are (0,−(1+λ),0,λ,0) and (0,−d(1+λ),0,d²λ,0). These models are defined over any commutative ring, including at degenerate parameters. Assertions of ellipticity, descent or torsion use a field K with 2≠0, d≠0 and λ≠0,1. A definition of an equation is not an assertion of its smoothness. Over general rings, a nonzero discriminant is not enough for the native ellipticity class: it must be a unit.

Points are always the existing nonsingular affine point type with its point at infinity O. No pair of field elements is treated as a point without a nonsingularity argument. The existing native projective pointCount counts all affine equation solutions, including singular ones on a singular model, and adds O. Only on an elliptic model with finite solutions is it identified with the cardinality of the nonsingular point group. In finite-field applications this distinction is resolved before applying group-theoretic cardinality results. The trace convention is the integer a_p=p+1−pointCount, not its negative.

The root order is fixed as (0,d,dλ). Products with three components are right-associated, so their projections are first, second-first and second-second. This order determines every descent tuple. The squareclass of a is formed only for a≠0, in K×/(K×)². A statement that a field element is a square includes a=0; a statement about a unit squareclass does not. This distinction is essential at the three two-torsion roots. The descent map itself is the pinned native μ, whose point-group domain is expressed multiplicatively by the existing Multiplicative transport. Its kernel is the existing range of doubling.

Rational prime valuations are additive integer valuations. All parameters and 1−parameters occurring in rational unit arguments are nonzero; the native total convention for the valuation of zero is not used to infer unit properties. Good reduction is curve-level good reduction, evaluated through a minimal local Weierstrass equation over ℚ_p. The coefficient model printed on the page need not be minimal or integral. Equality of j-invariants transfers j-integrality, not good reduction: a ramified twist can have the same j-invariant and bad reduction.

For the quadratic twist, the native parameters are (t,n) and their discriminant is t²−4n. The scaled Legendre equation uses (0,−d/4), with discriminant exactly d. Using (0,−d) changes the coefficient scaling to 4d; it describes the same squareclass over an odd field but not the same literal five-coefficient equation. The prototypes and the descent readings require the literal coefficient identity.

## Sources and library boundaries

The mathematical source is Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), no. 2, 355–392, DOI 10.4007/annals.2020.191.2.2. The publisher’s [version of record](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) is the quoted source, with SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf. The paper was read in full for the adjoining progression design; §§5–6 and the proofs of Lemmas 6.2, 6.3, 6.5 and the local witness part of 6.6 were reread for this design on 5 October 2026. This roadmap covers the seven results routed here by the independently reviewed extraction, not all unrelated results of the paper.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The source statements, not declaration names alone, establish the 54 baseline citations in the packet. The reviewed library audit was read before planning. In particular μ, its kernel, its corrected root representative, CRT at one root, finite point types, pointCount, the native twist, and two-torsion cardinalities are already present. The new nodes specialize or read those declarations; they do not reconstruct their generic content. A bounded search of the pinned source trees, declaration index and public Mathlib development leads found no exact completed Legendre normalization or the finite-field exports planned here. That is not a claim about all work outside the recorded search.

The upstream EllipticCurves and ModularForms documents provide the library-building style. Existing EllipticCurves Layers 2–6 remain the owners of generic group law, finite-field counts, local reduction, twists and descent. The exact CA.1 node ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass supplies the primitive character of a rational squareclass and its conductor formula. RankZeroOneBSD:BSD.0 supplies generic quadratic-twist Euler-factor comparison. ArithmeticGaloisRepresentations:R01.3 supplies actual elliptic-conductor support and its comparison with reduction. EllipticCurves Layer 4 explicitly does not identify its algorithmic Ogg exponent with the actual ramification conductor; this roadmap does not assume that identification.

ModularCurves Layer 9E owns the moduli-level six Möbius transformations, j-invariant map and invariant-ring discussion. The labelled coordinate tuple here is a concrete reading of ordered roots, not an independent moduli action or classification by j. This roadmap neither changes that upstream plan nor needs its moduli theory as a prerequisite for the elementary root-ordering calculation. The progression roadmap consumes the outputs and proves its own nonsquare partitions, character nontriviality and large-exponent arguments. Those hypotheses are not transplanted into the generic interfaces.

## Layer structure

LG.0 supplies the equations, their simultaneous coefficient invariants, the labelled six parameters, rational normalization and distinguished two-torsion. LG.1 uses LG.0 and the local and character suppliers to obtain the good-prime and conductor interfaces. LG.2 uses LG.0 to read native μ through the split cubic. LG.3 and LG.4 each use LG.0 and LG.2: one develops two-primary group results, the other the explicit corrected halving point. LG.5 uses LG.0 for the symmetric cubic and the native twist identity, importing the generic twist comparison from BSD.0. There is no dependency from a generic character, reduction or twist supplier back to an application of its output in this roadmap.

All six layers are planned at target level, not closed. Each target has a declaration-sized node, and its prerequisite chain terminates in a checked baseline, an exact supplier node, a requested supplier stage or an explicit gap. The mathematical plan is complete as a target-level pass; it is not an implementation claim. Every declaration remains unchecked. The reader states the mathematical interfaces even where an unimplemented supplier object prevents its native prototype from being written.

## LG.0 — Legendre equations and root orderings

The normalization has two distinct steps. First complete the square by the native variable change so that a₁=a₃=0. The native point-group equivalence preserves the doubling kernel, and its cardinality theorem turns full rational two-torsion into three rational roots of the cubic. Ellipticity supplies separability. Second choose an ordering of those roots, translate the first root to zero, and set d=e₁−e₀ and λ=(e₂−e₀)/d. The resulting model is literally Ld,λ. The translation is an isomorphism over the ground field; replacing Ld,λ by Lλ is a twist and need not be an isomorphism over that field.

The six root orderings are labels, not a set of six distinct numbers. For orders (012),(021),(102),(120),(210),(201), the ratios are λ,1/λ,1−λ,1/(1−λ),λ/(λ−1),(λ−1)/λ. Coincidences are expected at the exceptional j-values. For example the parameter −1 gives (−1,−1,2,1/2,1/2,2). Keeping Fin 6 labels prevents a false cardinality assertion and lets a consumer choose a root ordering without a genericity assumption. No hypothesis excludes j=0 or j=1728.

The discriminant calculations are simultaneous coefficient identities over commutative rings. The j formulas then use the unit discriminant on an elliptic model; they are not asserted as a native invariant on a singular model. The tests at −1,2,1/2 and 3 distinguish the sign of a₂, the scaling powers of d, the six labels and the singular boundary. The native three-point tuple excludes O and is injective under the root-separation assumptions. Its enumeration theorem includes O separately, giving exactly four points killed by 2. This is an equation-specific enumeration, not a new generic torsion construction.

### The Legendre equation

Declaration: WeierstrassCurve.legendre. Node: EllipticLegendreCharacterInterfaces:LG.0/legendre-model.

For any commutative ring R and λ∈R, legendre λ is the existing WeierstrassCurve with coefficients a₁=a₃=a₆=0, a₂=−(1+λ), a₄=λ. Its equation is y²=x(x−1)(x−λ). This defines a model even at λ=0,1; no ellipticity is claimed there.

Construction or proof. Specify the five coefficients in WeierstrassCurve; the factored equation follows by ring algebra from Affine.equation_iff.

Direct inputs: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Affine.Equation.

Uses.

- BS20 §6 Lemmas 6.3,6.5: The equations and distinguished roots determine torsion and halving.
- ErdosProgressionPowers EP.4: Consumes the rational Legendre parameter and nonsingular reductions; no progression hypotheses enter its definition.

API.

- WeierstrassCurve.legendre_equation (characterisation): The native affine equation of legendre λ is equivalent to y²=x(x−1)(x−λ).
- WeierstrassCurve.legendre_map (functoriality): (legendre λ).map f=legendre(f λ) for every ring homomorphism f.
- WeierstrassCurve.legendre_ext (extensionality): legendre λ=legendre μ iff λ=μ, over every commutative ring (compare a₄).
- WeierstrassCurve.legendre_normalForm (instance): legendre λ is in native IsCharNeTwoNF normal form: a₁=a₃=0.

Unit tests.

- WeierstrassCurve.legendre_test_minus_one (computation): Over ℚ, (legendre (−1)).a₂=0 and (legendre (−1)).a₄=−1.
- WeierstrassCurve.legendre_test_two (computation): Over ℚ, (legendre 2).Δ=64.
- WeierstrassCurve.legendre_test_half (computation): Over ℚ, (legendre (1/2)).Δ=1.
- WeierstrassCurve.legendre_test_zero (non-example): Over ℚ, legendre 0 is not elliptic (Δ=0).

Acceptance: λ=−1 has equation y²=x³−x; λ=2 has Δ=64; λ=1/2 has Δ=1 over ℚ.

Source: BS20, §6, equation (17), p.367. Specialization of the existing Weierstrass carrier, not a new elliptic-curve type.

Atlas planet: Legendre model.

### The scaled Legendre equation

Declaration: WeierstrassCurve.scaledLegendre. Node: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model.

For a commutative ring R and d,λ∈R, scaledLegendre d λ has coefficients (0,−d(1+λ),0,d²λ,0), hence equation y²=x(x−d)(x−dλ). For fields with 2≠0 it is the native quadraticTwistOf (legendre λ) with parameters (0,−d/4): its twisting discriminant is d, not 4d.

Construction or proof. Specify the coefficients and factor the cubic. At 2≠0 compare all five coefficients with native quadraticTwistOf at t=0,n=−d/4; do not copy the generic twist construction.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/legendre-model, tauceti:WeierstrassCurve.quadraticTwistOf.

Uses.

- BS20 Lemma 6.6: The corrected point lies on the twist by 2, with roots 0,2,2λ.
- BS20 Lemma 6.2 proof: For λ=b/a,d=a the integral model y²=x(x−a)(x−b) is this scaled equation.

API.

- WeierstrassCurve.scaledLegendre_equation (characterisation): The affine equation is equivalent to y²=x(x−d)(x−dλ).
- WeierstrassCurve.scaledLegendre_one (simp): scaledLegendre 1 λ=legendre λ.
- WeierstrassCurve.scaledLegendre_map (functoriality): Mapping coefficients along f gives scaledLegendre (f d) (f λ).
- WeierstrassCurve.scaledLegendre_eq_quadraticTwistOf (compatibility): Over a field with 2≠0, scaledLegendre d λ=(legendre λ).quadraticTwistOf 0 (−d/4).

Unit tests.

- WeierstrassCurve.scaledLegendre_test_one (compatibility): Over ℚ, scaledLegendre 1 (1/2)=legendre (1/2).
- WeierstrassCurve.scaledLegendre_test_two_half (computation): scaledLegendre 2 (1/2) over ℚ has a₂=−3,a₄=2,Δ=64.
- WeierstrassCurve.scaledLegendre_test_zero (degenerate): For d=0 all five coefficients vanish, and Δ=0, for every λ.

Acceptance: d=1 recovers legendre λ; d=2 recovers F′λ exactly, not merely the same j-invariant.

Source: BS20, §6, proof of Lemma 6.6, p.371. The d=2 model used by the source; extending the scalar d uses the same explicit coefficient comparison.

Atlas planet: Scaled Legendre model.

### Six labelled Legendre parameters

Declaration: WeierstrassCurve.legendreParameters. Node: EllipticLegendreCharacterInterfaces:LG.0/legendre-parameters.

For a field K, legendreParameters λ is the Fin 6-indexed tuple (λ,1/λ,1−λ,1/(1−λ),λ/(λ−1),(λ−1)/λ). Labelled entries are retained, including repetitions. Mathematical parameter assertions require λ≠0,1; the tuple is a total rational-expression construction but its degenerate values are not valid parameters.

Construction or proof. Evaluate the six rational expressions at their labels. Do not quotient by equality: exceptional parameters have coincident entries. The moduli-level S₃-action and invariant-ring theory remain ModularCurves 9E imports, not targets here.

Direct inputs: mathlib:WeierstrassCurve.

Uses.

- BS20 Lemma 6.2: The good-prime and conductor statements apply to every root ordering.
- ErdosProgressionPowers EP.4 squareclass split: The finite labelled family is partitioned by rational squareclasses even when values coincide.

API.

- WeierstrassCurve.legendreParameters_apply (data): The six evaluations, in the declared order, are exactly the displayed rational expressions.
- WeierstrassCurve.legendreParameters_valid (characterisation): If λ≠0,1 then every labelled entry is different from 0 and 1.
- WeierstrassCurve.legendreParameters_inverse_pairs (relation): Labels (0,1), (2,3), and (4,5) have product 1 when λ≠0,1.
- WeierstrassCurve.legendreParameters_map (functoriality): An injective field homomorphism maps every labelled entry to the corresponding entry at f λ.

Unit tests.

- WeierstrassCurve.legendreParameters_test_minus_one (computation): At −1 over ℚ the tuple is (−1,−1,2,1/2,1/2,2).
- WeierstrassCurve.legendreParameters_test_two (computation): At 2 over ℚ the tuple is (2,1/2,−1,−1,2,1/2).
- WeierstrassCurve.legendreParameters_test_half (computation): At 1/2 over ℚ the tuple is (1/2,2,1/2,2,−1,−1).
- WeierstrassCurve.legendreParameters_test_generic (computation): At 3 over ℚ the tuple is (3,1/3,−2,−1/2,3/2,2/3).

Acceptance: The generic rational tuple at λ=3 has six distinct values; at λ=−1 its image is only {−1,2,1/2}.

Source: BS20, §6, proof of Lemma 6.2, p.368. With λ=b/a these are the six labelled values.

Atlas planet: Six Legendre parameters.

### Legendre discriminant and ellipticity

Declaration: WeierstrassCurve.legendre_invariants. Node: EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants.

For every commutative ring, Δ(Lλ)=16λ²(1−λ)² and c₄(Lλ)=16(λ²−λ+1). Over a field with 2≠0, Lλ is elliptic iff λ≠0 and λ≠1; for these parameters its native j-invariant equals 256(λ²−λ+1)³/(λ²(1−λ)²). The identities form one simultaneous coefficient calculation.

Construction or proof. Substitute the five coefficients into native b₂,b₄,b₆,b₈,c₄,Δ. Factor the discriminant; over a field apply IsElliptic iff Δ is a unit. Divide c₄³ by Δ only on an elliptic model. No hypothesis j≠0 or j≠1728 is imposed.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/legendre-model, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.c₄, mathlib:WeierstrassCurve.j, mathlib:WeierstrassCurve.IsElliptic.

Acceptance: At λ=−1,2,1/2 the j-invariant is 1728. In characteristic 2 the discriminant vanishes for every λ.

Source: BS20, §6, equation (17), p.367; explicit coefficient computation. The equation determines these invariants in the pinned convention; the computation is provided explicitly rather than attributing an unstated formula to the paper.

Atlas planet: Legendre discriminant.

### Scaled Legendre discriminant

Declaration: WeierstrassCurve.scaledLegendre_invariants. Node: EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants.

Δ(Ld,λ)=16d⁶λ²(1−λ)² and c₄(Ld,λ)=16d²(λ²−λ+1). For a field with 2≠0 and d≠0, Ld,λ is elliptic iff λ≠0,1; on elliptic models j(Ld,λ)=j(Lλ).

Construction or proof. Compute the coefficients or specialize Δ_quadraticTwistOf and c₄_quadraticTwistOf with twisting discriminant d. Apply native j_quadraticTwistOf. The d≠0 assumption is indispensable; over a ring nonzero must be replaced by IsUnit where ellipticity is claimed.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants, tauceti:WeierstrassCurve.Δ_quadraticTwistOf, tauceti:WeierstrassCurve.c₄_quadraticTwistOf, tauceti:WeierstrassCurve.j_quadraticTwistOf.

Acceptance: At d=2, λ=1/2, Δ=64 and j=1728; at d=0 singularity is explicit.

Source: BS20, §6, F′λ in proof of Lemma 6.6, p.371. Native twist invariant comparison specialized to the scaled equation.

### Root-ordering cross-ratios

Declaration: WeierstrassCurve.legendreParameters_from_roots. Node: EllipticLegendreCharacterInterfaces:LG.0/parameters-from-root-orderings.

Let e₀,e₁,e₂ be pairwise distinct in a field, and λ=(e₂−e₀)/(e₁−e₀). The cross-ratios obtained from root orders (012),(021),(102),(120),(210),(201) equal, respectively, the six entries of legendreParameters λ. Each lies outside {0,1}. Repetitions in values do not collapse the six root orderings.

Hypotheses: The three roots are pairwise distinct.

Construction or proof. Write every quotient in terms of d=e₁−e₀ and λ using e₂−e₀=dλ. Cancel only the nonzero differences; compute each numerator and denominator. Do not deduce that these are all curves with this j-invariant or that they are rationally isomorphic. The scheme-theoretic S₃-action is not reconstructed.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/legendre-parameters.

Acceptance: Roots (0,1,−1) produce exactly the labelled exceptional tuple; roots (0,1,3) produce the generic tuple.

Source: BS20, §6, six ratios in proof of Lemma 6.2, p.368. These are coordinate changes attached to ordered split roots, not the moduli quotient of ModularCurves 9E.

### Legendre normalization of a split cubic

Declaration: WeierstrassCurve.scaledLegendre_normalization. Node: EllipticLegendreCharacterInterfaces:LG.0/split-normalization.

Let W over a field K with 2≠0 be in native IsCharNeTwoNF normal form, with cubic f=(X−e₀)(X−e₁)(X−e₂) and pairwise distinct roots. Set d=e₁−e₀, λ=(e₂−e₀)/d. Translation x_old=x_new+e₀,y_old=y_new gives a native VariableChange C with C•W=scaledLegendre d λ. Hence W is a quadratic twist of Lλ in the precise native coefficient sense, d≠0 and λ≠0,1. Reordering roots yields exactly the six parameters, with the corresponding twist scalar recomputed.

Hypotheses: K is a field; 2≠0; a₁=a₃=0; the cubic has three distinct K-rational roots.

Construction or proof. Expand the split monic cubic and translate by e₀ using the native VariableChange action. The translated roots are 0,d,dλ; compare the five coefficients with scaledLegendre. Apply parameters_from_root_orderings to every ordering and the scaled/native-twist coefficient identity. Translation is a K-isomorphism; passage to Lλ itself is a twist, not generally a K-isomorphism.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/parameters-from-root-orderings, mathlib:WeierstrassCurve.VariableChange.

Acceptance: For roots (3,5,9), d=2,λ=3; translation gives y²=x(x−2)(x−6).

Source: BS20, §6, Legendre discussion p.367 and proof of Lemma 6.2 p.368. The source uses the normalized split equation; this node gives the missing explicit construction from ordered roots.

Atlas planet: Legendre twist normalization.

### Normalization from full rational two-torsion

Declaration: WeierstrassCurve.exists_scaledLegendre_of_full_two_torsion. Node: EllipticLegendreCharacterInterfaces:LG.0/full-two-torsion-normalization.

If E/ℚ is an elliptic Weierstrass curve whose native rational point group has exactly four points killed by 2, there exist a native rational VariableChange C, d∈ℚ× and λ∈ℚ\{0,1} such that C•E=scaledLegendre d λ. All associated parameters are precisely the labelled six root-ordering parameters, allowing coincidences.

Hypotheses: E is elliptic; Nat.card of the kernel of doubling on E(ℚ) is 4.

Construction or proof. Use native toCharNeTwoNF to complete the square. Transport the native point group by the variable change. Apply native card_ker_nsmul_two: the normalized cubic has exactly three rational roots. Ellipticity makes it separable, so they are distinct; degree three and monicity give the split factorization. Apply split-normalization. The normalization does not use an automorphism classification and works at j=0 and j=1728 as well.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/split-normalization, mathlib:WeierstrassCurve.toCharNeTwoNF, tauceti:WeierstrassCurve.Affine.card_ker_nsmul_two, tauceti:WeierstrassCurve.Affine.Point.equivVariableChange, tauceti:WeierstrassCurve.Affine.separable_f.

Acceptance: E:y²=x³−x is normalized by d=1,λ=−1 and has the three nonzero rational two-torsion points (0,0),(1,0),(−1,0).

Source: BS20, §6, following equation (17), p.367. The paper’s full-two-torsion assertion is realized by the root-count and coefficient construction rather than assumed as a new predicate.

### The three labelled two-torsion points

Declaration: WeierstrassCurve.scaledLegendreTwoTorsion. Node: EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion.

For a field K with 2≠0,d≠0,λ≠0,1, scaledLegendreTwoTorsion d λ is the Fin 3-indexed tuple of native points (0,0),(d,0),(dλ,0) of Ld,λ, each supplied with its native nonsingularity proof. Their y-coordinate is zero; the point at infinity is not an entry.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1.

Construction or proof. Use scaled-invariants for ellipticity and the factored equation to prove each displayed point nonsingular. Use native negation and addition to show doubling is zero; distinct roots distinguish the three points. Their sum is O by the horizontal line y=0.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants, mathlib:WeierstrassCurve.Affine.Point.

Uses.

- BS20 Lemmas 6.3,6.5,6.6: Halving and descent are tested at these exact nonzero two-torsion points.
- LG.3 two-by-four-subgroup: A labelled independent two-torsion point complements an order-four point.

API.

- WeierstrassCurve.scaledLegendreTwoTorsion_coordinates (data): The three labelled points have exactly the root coordinates displayed in the definition.
- WeierstrassCurve.scaledLegendreTwoTorsion_double (simp): 2•T_j=O for every label j.
- WeierstrassCurve.scaledLegendreTwoTorsion_injective (extensionality): The Fin 3 tuple is injective and all its entries are nonzero points.
- WeierstrassCurve.scaledLegendreTwoTorsion_exhausts (characterisation): A native point P satisfies 2•P=O iff P=O or P is one of the three labelled points.

Unit tests.

- WeierstrassCurve.scaledLegendreTwoTorsion_test_minus_one (computation): For d=1,λ=−1 over ℚ the labelled coordinates are (0,0),(1,0),(−1,0).
- WeierstrassCurve.scaledLegendreTwoTorsion_test_two_half (computation): For d=2,λ=1/2 over ℚ the coordinates are (0,0),(2,0),(1,0).
- WeierstrassCurve.scaledLegendreTwoTorsion_test_sum (compatibility): For d=1,λ=3 over ℚ the sum of the three labelled native points is O, and each is killed by doubling.

Acceptance: The native kernel of doubling consists of O and these three points.

Source: BS20, §6, descent discussion and Lemma 6.5, p.370. The distinguished points label the coordinate evaluations of native descent.

Atlas planet: Legendre two-torsion points.

### The native scalar-twist identity

Declaration: WeierstrassCurve.scaledLegendre_eq_quadraticTwistOf. Node: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-twist-identity.

Over a field with 2≠0, scaledLegendre d λ=(legendre λ).quadraticTwistOf 0 (−d/4). The native twisting discriminant 0²−4(−d/4) is exactly d, so the twist is elliptic iff d≠0 and Lλ is elliptic.

Hypotheses: K is a field; 2≠0.

Construction or proof. Compare all five native coefficients. Use isElliptic_quadraticTwistOf_iff rather than any j-invariant classification.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/legendre-model, tauceti:WeierstrassCurve.quadraticTwistOf, tauceti:WeierstrassCurve.isElliptic_quadraticTwistOf_iff.

Acceptance: d=2 gives parameters (0,−1/2), not (0,−2); the latter produces scalar 8.

Source: BS20, §6, proof of Lemma 6.6, p.371. Promotes the scaled-model compatibility API because the finite-field specialization consumes it.

### Exhaustion of Legendre two-torsion

Declaration: WeierstrassCurve.scaledLegendreTwoTorsion_exhausts. Node: EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion-exhausts.

On Ld,λ over a field with 2≠0,d≠0,λ≠0,1, a native point P is killed by doubling iff P=O or P is one of (0,0),(d,0),(dλ,0). These four points are distinct; hence the doubling kernel has cardinality 4.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1.

Construction or proof. Native y_eq_zero_of_order_two gives y=0 for any affine two-torsion point. The factored cubic then forces x∈{0,d,dλ}; the construction supplies all three, and the native point constructors distinguish them from O. This is an equation-specific enumeration, not a general torsion-basis construction.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion, EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants, tauceti:WeierstrassCurve.y_eq_zero_of_order_two, tauceti:WeierstrassCurve.Affine.card_ker_nsmul_two.

Acceptance: For λ=−1 the four points are O,(0,0),(1,0),(−1,0); none is lost at j=1728.

Source: BS20, §6, Lemmas 6.3 and 6.5, pp.368,370. The source uses full two-torsion; this node supplies the exact enumeration on these equations.

## LG.1 — Good reduction and character conductors

This layer does not begin by assuming a globally primitive integral split-cubic model. Instead it uses the explicit j formula and local valuation cases. Set a=v_p(λ), b=v_p(1−λ). If a<0, then b=a and the λ² term has the uniquely smallest valuation in λ²−λ+1. If a>0, then b=0 and the numerator factor is a unit. The symmetric case b>0 gives a=0. In these cases the displayed j has valuation 2a,−2a,−2b respectively, hence negative. They exhaust failure of a=b=0. At an odd good prime the minimal local model has integral c₄ and unit Δ, so its j is integral. Invariance under the admissible normalization and the native twist gives the desired units for each parameter.

There is deliberately no converse assertion that equal j-invariants give equal reduction. The separate converse proved here applies only to the unscaled Lλ coefficient equation when λ and 1−λ are p-adic units: its coefficients are integral, its discriminant is a unit, and its residue parameter avoids 0 and 1. The local supplier must identify this model with the native minimal reduction framework. At λ=−1,p=3, j=1728 is integral but not a unit; this example excludes an erroneous stronger j-unit condition.

For ω∈{±1,±2}, the odd-prime valuations of ω vanish. The CA.1 conductor formula says that an odd prime divides the primitive character conductor exactly when the valuation of ωλ is odd; the odd conductor is squarefree. Good-prime units exclude that possibility at every odd good prime. The actual elliptic-conductor comparison then turns support containment into divisibility of the whole odd conductor. The trivial character of conductor 1 is admitted. Nontriviality of the odd conductor is a downstream application theorem, not a generic consequence of the Legendre equation. The native good-unit prototype is the normalized-model core; transporting an arbitrary rational curve into that core uses LG.0 and the local supplier.

### Nonintegral Legendre parameters force nonintegral j

Declaration: WeierstrassCurve.legendre_j_valuation. Node: EllipticLegendreCharacterInterfaces:LG.1/legendre-j-valuation.

Let p be an odd rational prime and λ∈ℚ\{0,1}. Write a=v_p(λ), b=v_p(1−λ). If a<0 then b=a and v_p(j(Lλ))=2a<0. If a>0 then b=0 and v_p(j(Lλ))=−2a<0. If b>0 then a=0 and v_p(j(Lλ))=−2b<0. Consequently v_p(j(Lλ))≥0 implies a=b=0.

Hypotheses: p is an odd prime; λ is a rational different from 0 and 1.

Construction or proof. Apply native padicValRat.add_eq_min to λ+(1−λ)=1; the three bad cases above exhaust failure of a=b=0. When λ or 1−λ has positive valuation, λ²−λ+1 is a unit; when a<0 its λ² term uniquely has the least valuation 2a. Use j=256(λ²−λ+1)³/(λ²(1−λ)²). The factor 256 is a p-adic unit even at p=3. There is no assumption that j itself is a unit.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants, mathlib:padicValRat, mathlib:padicValRat.mul, mathlib:padicValRat.div, mathlib:padicValRat.add_eq_min.

Acceptance: λ=3 at p=3 gives valuations (1,0) and v₃(j)=−2; λ=1/3 at p=3 gives (−1,−1) and v₃(j)=−2. At λ=−1,p=3 j=1728 has positive valuation although both parameter factors are units.

Source: BS20, §6, Lemma 6.2(i), pp.367–368; alternate explicit invariant proof. The source proves the implication via an odd-primitive integral model; this node gives an independent direct valuation calculation from its equation.

Atlas planet: Legendre parameter unit criterion.

### Parameters at good odd primes

Declaration: WeierstrassCurve.legendre_units_of_good_reduction. Node: EllipticLegendreCharacterInterfaces:LG.1/good-prime-units.

Let F/ℚ be elliptic with full rational two-torsion, semistable away from 2, and let λ be any associated Legendre parameter. If an odd prime p is of good reduction for the curve F, then v_p(λ)=v_p(1−λ)=0. The reduction hypothesis is applied to a minimal equation of F over ℚ_p, not to the arbitrary displayed scaled Legendre model.

Hypotheses: F is elliptic with full rational two-torsion and semistable away from 2; p is an odd prime of good curve-level reduction; λ is any of the six associated parameters.

Construction or proof. At a good minimal local model, c₄ is integral and Δ is a unit, so j is integral. The generic local/minimal-model comparison is imported from EllipticCurves Layer 4. Native j invariance under VariableChange and quadraticTwistOf identifies j(F) with j(Lλ). Apply legendre-j-valuation. For every root ordering the same argument applies; never infer good reduction of a ramified quadratic twist merely from equal j.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.1/legendre-j-valuation, EllipticLegendreCharacterInterfaces:LG.0/full-two-torsion-normalization, EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, mathlib:WeierstrassCurve.variableChange_j, mathlib:WeierstrassCurve.minimal.

Acceptance: F:y²=x³−x, λ=−1,2,1/2: at every odd good prime all three parameters and their complements are units.

Source: BS20, §6, Lemma 6.2(i), pp.367–368. Exactly the source theorem, with the model-versus-curve reduction convention made explicit.

Atlas planet: Good-prime Legendre units.

### Nonsingular reduction of the unit Legendre model

Declaration: WeierstrassCurve.legendre_good_reduction_of_units. Node: EllipticLegendreCharacterInterfaces:LG.1/legendre-good-model.

For λ∈ℚ\{0,1} and an odd prime p with v_p(λ)=v_p(1−λ)=0, the coefficient model Lλ is integral over ℤ_p with unit discriminant. Its reduction is an elliptic Legendre model over 𝔽_p with parameter λ̄≠0,1; the curve has good reduction at p. This statement is about Lλ itself, not an arbitrary d-twist.

Hypotheses: p is an odd prime; λ and 1−λ are p-adic units.

Construction or proof. The coefficients −(1+λ),λ are integral; Δ=16λ²(1−λ)² is a unit. The integral unit-discriminant equation is minimal and reduces nonsingularly, using native reduction predicates and the generic local comparison. Reduction of both nonzero units excludes the two singular parameters.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants, EllipticLegendreCharacterInterfaces:LG.0/legendre-model, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, mathlib:WeierstrassCurve.HasGoodReduction, mathlib:WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction, mathlib:WeierstrassCurve.minimal.

Acceptance: λ=3,p=5 gives good reduction; λ=3,p=3 fails the unit hypothesis and Δ is divisible by 3.

Source: BS20, §6, proof of Lemma 6.4, p.368. Explains the coefficient-level unit-discriminant step the source uses.

### Odd support of the attached primitive character

Declaration: WeierstrassCurve.legendre_character_odd_support. Node: EllipticLegendreCharacterInterfaces:LG.1/character-odd-support.

Let F,λ be as in good-prime-units, let ω∈{1,−1,2,−2}, and let χ be the CA.1 primitive character of the nonzero rational squareclass ωλ, of conductor N. Every odd prime dividing N is a bad prime of F. Equivalently the odd prime support of N is contained in the bad odd prime set of F.

Hypotheses: F/ℚ has full rational two-torsion and is semistable away from 2; λ is associated; ω∈{±1,±2}.

Construction or proof. Import CA.1: an odd prime p divides N iff v_p(ωλ) is odd, and the odd conductor is squarefree. For odd p the four allowed ω are units, so v_p(ωλ)=v_p(λ). At a good p good-prime-units makes this zero. Use contraposition. No character construction or reciprocity theorem is repeated here.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.1/good-prime-units, ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass, mathlib:padicValRat.mul.

Acceptance: For λ=3 the characters attached to ±3,±6 have possible odd support {3}, whereas for λ=−1,2,1/2 every such odd conductor is 1.

Source: BS20, §6, Lemma 6.2(ii), pp.367–368. The support portion of the source conductor conclusion, separated from the elliptic-conductor bridge.

### Odd character conductor divides the elliptic conductor

Declaration: WeierstrassCurve.legendre_character_odd_conductor_dvd. Node: EllipticLegendreCharacterInterfaces:LG.1/character-conductor-divides.

Under the preceding hypotheses, if M is the actual elliptic conductor of F and N is the primitive conductor of the CA.1 character of ωλ, then ordCompl[2](N) divides M. In particular at semistable odd primes it divides the squarefree odd part of M. The theorem permits N=1 and does not assert nontriviality of the odd conductor.

Hypotheses: M is the elliptic conductor of F, not a displayed discriminant or an unproved Ogg-exponent surrogate; F,λ,ω as in character-odd-support.

Construction or proof. Use the imported elliptic conductor comparison: an odd bad prime p of F divides M; semistable odd primes have conductor exponent 1. CA.1 gives the squarefree odd part of N. The support containment and prime factorization give divisibility. Nontriviality of the odd conductor belongs to the downstream progression argument.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.1/character-odd-support, ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass, ArithmeticGaloisRepresentations:R01.3, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Acceptance: F:y²=x³−x has conductor 32; all four ω at λ=−1 give characters with odd conductor 1, so the result is valid without a nontrivial-character hypothesis.

Source: BS20, §6, Lemma 6.2(ii), pp.367–368. The actual conductor-divisibility assertion, with its precise imported bridge.

Atlas planet: Odd character conductor support.

## LG.2 — Split-cubic readings of the native descent map

The existing étale algebra is A=AdjoinRoot(f), with f the cubic of the native normal form. For Ld,λ its roots are pairwise distinct. Apply the native CRT at 0 and then polynomial CRT at the two cofactor roots to obtain ordered evaluation at 0,d,dλ. The equivalence is the one induced by evaluation; its inverse is quadratic Lagrange interpolation modulo f. The API evaluates every polynomial class, detects equality componentwise, evaluates the root and detects units. A root is not a unit: its first evaluation is zero. That non-example distinguishes the algebra map from a map defined only on units.

Transporting units through CRT and then quotienting by squares gives the squareclass equivalence. It is not a new homomorphism from the point group. It composes with the existing μ, and its multiplicativity and identity laws are inherited from the ring and quotient equivalences. The constant 4 over ℚ gives three trivial classes, whereas the constant 2 gives three nontrivial classes. These tests expose both an incorrect quotient and an incorrect root order.

At a nonroot x the native representative is x−θ. At a root r it is the corrected unit r−θ+fCofactor(r). The cofactor evaluates at r to f′(r), and at each other root to zero. Thus the root coordinate is the product of the two other differences, while the other two coordinates remain those differences. No class of zero occurs. This is precisely the branch that a naive formula ([x],[x−d],[x−dλ]) would mishandle at two-torsion. The separate root and nonroot readings are then combined with the already proved kernel theorem to obtain halving iff all three differences are squares as field elements. The norm condition is read as the product of the three squareclasses being 1, including O and all roots.

### The Legendre split-cubic CRT

Declaration: WeierstrassCurve.scaledLegendreCrt. Node: EllipticLegendreCharacterInterfaces:LG.2/split-cubic-crt.

For Ld,λ under the nonsingularity hypotheses, scaledLegendreCrt d λ is the canonical root-evaluation ring equivalence A=K[X]/(X(X−d)(X−dλ)) ≃ K×K×K, in root order (0,d,dλ). It is an adapter for the native Affine.A étale algebra, not a replacement algebra.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. The three linear factors are pairwise coprime because d, dλ, d(1−λ) are nonzero. Apply the native CRT decomposition at root 0 (equivProdA′), then the polynomial CRT on its cofactor and quotientSpanXSubC at d and dλ. The inverse is degree-at-most-two Lagrange interpolation modulo the cubic; keep the declared order.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants, tauceti:WeierstrassCurve.Affine.A, tauceti:WeierstrassCurve.Affine.equivProdA', tauceti:WeierstrassCurve.Affine.equivProdA'_apply, mathlib:Ideal.quotientMulEquivQuotientProd, mathlib:Polynomial.quotientSpanXSubCAlgEquiv.

Uses.

- BS20 §6 two-descent discussion: Identifies the three factors in the native x−θ descent target.
- LG.2 descent-at-root: Evaluates the corrected representative rather than assigning a class to zero.

API.

- WeierstrassCurve.scaledLegendreCrt_mk (projection): The class of h(X) maps to (h(0),h(d),h(dλ)).
- WeierstrassCurve.scaledLegendreCrt_ext (extensionality): Two native A classes agree iff their three root evaluations agree.
- WeierstrassCurve.scaledLegendreCrt_root (simp): The native AdjoinRoot root maps to (0,d,dλ).
- WeierstrassCurve.scaledLegendreCrt_unit_iff (characterisation): A class is a unit iff every root evaluation is nonzero.

Unit tests.

- WeierstrassCurve.scaledLegendreCrt_test_minus_one (computation): At d=1,λ=−1 over ℚ, the root maps to (0,1,−1).
- WeierstrassCurve.scaledLegendreCrt_test_two_half (computation): At d=2,λ=1/2 over ℚ, the root maps to (0,2,1).
- WeierstrassCurve.scaledLegendreCrt_test_nonunit (non-example): The class of X is not a unit, since its first coordinate is zero; its squareclass is not formed.

Acceptance: A polynomial class maps to (h(0),h(d),h(dλ)), and constants map diagonally.

Source: BS20, §6, two-descent display preceding Lemma 6.5, p.370. The displayed triple is the split reading of the already implemented étale-algebra descent.

Atlas planet: Split-cubic CRT.

### Root readings of native squareclasses

Declaration: WeierstrassCurve.scaledLegendreSquareclassEquiv. Node: EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-equivalence.

scaledLegendreSquareclassEquiv d λ is the induced multiplicative equivalence from native M=Aˣ/(Aˣ)² to (Kˣ/(Kˣ)²)³, obtained from scaledLegendreCrt. It transports μ values; it defines neither a new generic descent homomorphism nor a new kernel theorem.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. Map units through the root-evaluation ring equivalence. This carries the square subgroup bijectively onto the product of the three square subgroups; descend it and its inverse through the native quotient construction. Use the equivalence to read the existing μ and normM.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/split-cubic-crt, tauceti:WeierstrassCurve.Affine.M, mathlib:QuotientGroup.map.

Uses.

- BS20 Lemmas 6.3,6.5,6.6: Reads native descent coordinate values and detects the native kernel.
- LG.2 halving-square-criterion: A triple of trivial coordinate classes is exactly a trivial μ value.

API.

- WeierstrassCurve.scaledLegendreSquareclassEquiv_unit (projection): For a native A unit u, its image is the triple of squareclasses of the three CRT unit evaluations.
- WeierstrassCurve.scaledLegendreSquareclassEquiv_one (simp): The trivial native squareclass maps to (1,1,1).
- WeierstrassCurve.scaledLegendreSquareclassEquiv_eq_one (characterisation): A native squareclass is 1 iff all three coordinate squareclasses are 1.
- WeierstrassCurve.scaledLegendreSquareclassEquiv_mul (structure): The reading preserves multiplication; it is an equivalence, not merely a map.

Unit tests.

- WeierstrassCurve.scaledLegendreSquareclassEquiv_test_one (degenerate): At d=1,λ=−1 over ℚ, the class of 1 maps to (1,1,1).
- WeierstrassCurve.scaledLegendreSquareclassEquiv_test_constant_square (computation): At d=1,λ=2 over ℚ, the class of constant 4 maps to (1,1,1).
- WeierstrassCurve.scaledLegendreSquareclassEquiv_test_constant_nonsquare (non-example): At d=1,λ=1/2 over ℚ, constant 2 is a unit whose class maps to ([2],[2],[2])≠(1,1,1).

Acceptance: A unit class maps to the three unit-evaluation classes; the class of 1 maps to (1,1,1).

Source: BS20, §6, two-descent display preceding Lemma 6.5, p.370. Names only the new identification of native squareclasses with the triple; μ remains the sole descent map.

Atlas planet: Split squareclass reading.

### Native descent away from the roots

Declaration: WeierstrassCurve.scaledLegendre_descent_off_roots. Node: EllipticLegendreCharacterInterfaces:LG.2/descent-off-roots.

For an affine native point (x,y) on Ld,λ with x∉{0,d,dλ}, the split reading of μ(P) is ([x],[x−d],[x−dλ]), with all three representatives nonzero. The image of O is (1,1,1).

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. The factored cubic is nonzero at x, so native μX uses its nonroot representative x−θ. Apply the CRT evaluation and quotient-unit reading. At O use native μ_apply and μ₀_zero. This does not define a second Θ map.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-equivalence, EllipticLegendreCharacterInterfaces:LG.2/split-cubic-crt, EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, tauceti:WeierstrassCurve.Affine.μ, tauceti:WeierstrassCurve.Affine.μ_apply, tauceti:WeierstrassCurve.Affine.μX_of_eval_f_ne_zero, tauceti:WeierstrassCurve.Affine.μ₀_zero, EllipticLegendreCharacterInterfaces:LG.2/split-cubic-evaluation, EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-unit-reading.

Acceptance: For a nonroot point the product class is [y²]=1, not the class of an arbitrary cubic value.

Source: BS20, §6, two-descent discussion, p.370. The native nonroot branch produces the familiar coordinates; all exclusions needed to form units are retained.

### Native descent at the three two-torsion points

Declaration: WeierstrassCurve.scaledLegendre_descent_at_roots. Node: EllipticLegendreCharacterInterfaces:LG.2/descent-at-root.

The split readings at T₀,T_d,T_dλ on Ld,λ are respectively ([d²λ],[−d],[−dλ]), ([d],[d²(1−λ)],[d(1−λ)]), and ([dλ],[d(λ−1)],[d²λ(λ−1)]). All representatives are nonzero. The entry at a root is the derivative product of the other two differences, not zero.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. At a root r native μX uses r−θ+fCofactor(r), not r−θ alone. At its own root evaluation fCofactor(r)(r)=f′(r)=∏_{s≠r}(r−s); at other roots the cofactor vanishes and r−s remains. Compute the displayed three tuples in declared CRT order; units follow from distinct roots.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-equivalence, EllipticLegendreCharacterInterfaces:LG.2/split-cubic-crt, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion, EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, tauceti:WeierstrassCurve.Affine.μX_of_eval_f_eq_zero, tauceti:WeierstrassCurve.Affine.μ_apply, EllipticLegendreCharacterInterfaces:LG.2/split-cubic-evaluation, EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-unit-reading.

Acceptance: At d=1,λ=−1,p=5 the tuples reduce to (1,1,1),(1,[2],[2]),(1,[2],[2]); at d=2 and conic λ=2t²,1−λ=2v² the last tuple is entirely square over a field containing i²=−1.

Source: BS20, §6, Lemma 6.5 and proof of Lemma 6.6, pp.370–371. The corrected representative of the native implementation gives the source’s root-coordinate computations.

Atlas planet: Two-torsion descent coordinates.

### Product of the split descent coordinates

Declaration: WeierstrassCurve.scaledLegendre_descent_product. Node: EllipticLegendreCharacterInterfaces:LG.2/descent-product.

For every native point P on Ld,λ, the product of the three split readings of μ(P) is 1. This is the native normM condition read through the split algebra; it holds at O and at the two-torsion roots as well.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. The algebra norm in a split cubic is the product of the three evaluations. Native normM_μ₀_eq_one states that μ(P) has trivial norm squareclass. Transport this statement along the CRT and quotient equivalences.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-equivalence, EllipticLegendreCharacterInterfaces:LG.2/split-cubic-crt, tauceti:WeierstrassCurve.Affine.normM_μ₀_eq_one, tauceti:WeierstrassCurve.Affine.μ_apply.

Acceptance: At T₀ the product of the representatives is d⁴λ²; it is a nonzero square.

Source: BS20, §6, two-descent discussion p.370. A compatibility lemma for the existing norm map, not a new generic norm theory.

### The Legendre halving criterion

Declaration: WeierstrassCurve.scaledLegendre_halving_iff_squares. Node: EllipticLegendreCharacterInterfaces:LG.2/halving-square-criterion.

For a native affine point P=(x,y) on Ld,λ over K with 2≠0,d≠0,λ≠0,1, there exists Q∈Ld,λ(K) with 2Q=P iff x,x−d,x−dλ are all squares in K. Here IsSquare includes 0, but zero is not passed to a unit squareclass. The criterion also covers the three two-torsion points.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. Native ker_μ_eq gives halving iff μ(P)=1. Apply the split squareclass equivalence. Away from the roots, use descent-off-roots and the unit squareclass criterion. At a root exactly one difference is zero. The other two classes are explicit and the root component is their product, so their being squares is equivalent to all three split classes being trivial. Zero is a square in the field, but it is never a unit representative.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/descent-off-roots, EllipticLegendreCharacterInterfaces:LG.2/descent-at-root, EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-equivalence, tauceti:WeierstrassCurve.Affine.ker_μ_eq.

Acceptance: At λ=−1 over ℚ, (0,0) is not divisible by 2 because −1 is not a rational square. Over 𝔽₅ it is divisible by 2.

Source: BS20, §6, proof of Lemma 6.3, p.368. The source’s square criterion is derived from native descent, including the special root branch.

Atlas planet: Legendre halving criterion.

### Evaluation through the split-cubic CRT

Declaration: WeierstrassCurve.scaledLegendreCrt_mk. Node: EllipticLegendreCharacterInterfaces:LG.2/split-cubic-evaluation.

The class of h(X) maps to (h(0),h(d),h(dλ)).

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. Evaluate the two successive native CRT maps on a polynomial class; the native equivProdA′_apply and the linear quotient evaluation give the three values.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/split-cubic-crt, tauceti:WeierstrassCurve.Affine.equivProdA'_apply, mathlib:Polynomial.quotientSpanXSubCAlgEquiv.

Acceptance: The constant 1 maps to (1,1,1), the root to (0,d,dλ).

Source: BS20, §6, split descent discussion p.370. Promotes the consuming API item rather than leaving a dependency hidden in a constructor API.

### Unit-class root readings

Declaration: WeierstrassCurve.scaledLegendreSquareclassEquiv_unit. Node: EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-unit-reading.

For a native A unit u, its image is the triple of squareclasses of the three CRT unit evaluations.

Hypotheses: K is a field; 2≠0; d≠0; λ≠0,1; root order is 0,d,dλ.

Construction or proof. Map the native unit through CRT; quotient maps identify its three evaluations modulo squares.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-equivalence, EllipticLegendreCharacterInterfaces:LG.2/split-cubic-evaluation, mathlib:QuotientGroup.map.

Acceptance: A constant square maps to three trivial classes; zero never supplies a unit.

Source: BS20, §6, split descent discussion p.370. Promotes the consuming API item rather than leaving a dependency hidden in a constructor API.

## LG.3 — Two-primary torsion over prime fields

At p≡3 modulo 4, −1 is a nonsquare. For λ=η² with η≠0,±1, apply the root halving criterion. If 1−η² is a square, (1,0) has a half. If not, its negative η²−1 is a square, so (η²,0) has a half. A half of a nonzero two-torsion point has exact order four. Choosing another nonzero two-torsion point outside its doubled subgroup gives an injection ZMod 2×ZMod 4 into the native point group. Finiteness and the point-count comparison give the corresponding divisibility by eight. The endpoint is an embedded subgroup, not a claim that the whole group equals that subgroup.

At p≡5 modulo 8, −1 is a square but 2 is a nonsquare. On L−1, only (0,0) among the three nonzero two-torsion points is divisible by two. Choose i²=−1. The point (i,1−i) doubles to (0,0), and its first descent class is [i]. Every other half of (0,0) differs from it by a two-torsion point; all such points have trivial first class. But i is a nonsquare: a square root of i would give an element of multiplicative order eight, impossible when p−1≡4 modulo 8. Thus no point of order four has a half, and there is no point of order eight.

Absence of order eight alone does not prove that the two-part of the group order is exactly eight. The finite-abelian structure theorem and the four-element doubling kernel give two two-primary cyclic factors. Each has order at most four. The order-sixteen possibility would make both factors order four, hence every two-torsion point divisible by two, contradicting the root computation. The two-primary group therefore has order eight. Explicit counts 8,8,40,40,40,72 at p=5,13,29,37,53,61 have valuation three and check that odd factors have not been discarded.

### Two-by-four torsion over prime fields

Declaration: WeierstrassCurve.legendre_two_by_four_subgroup. Node: EllipticLegendreCharacterInterfaces:LG.3/two-by-four-subgroup.

Let p be prime, p≡3 mod4, and η∈𝔽_p\{0,1,−1}. The native point group of L_{η²}:y²=x(x−1)(x−η²) contains a subgroup additively isomorphic to ZMod 2 × ZMod 4. In particular 8 divides the native pointCount.

Hypotheses: p is prime and p%4=3; η≠0,η≠1,η≠−1.

Construction or proof. The two-torsion enumeration supplies all four points. Apply the halving criterion at (1,0). If 1−η² is a square, this point is a double. Otherwise the nonzero 1−η² is a nonsquare. Since −1 is a nonsquare when p≡3 mod4, η²−1 is a square. The criterion at (η²,0) now gives a half. A half P of a nonzero point killed by 2 has exact order 4. A different nonzero two-torsion point T is not 2P, hence is independent of ⟨P⟩. The map (a,b)↦aT+bP embeds ZMod 2×ZMod 4; native finite-point and count comparison give 8|pointCount.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.2/halving-square-criterion, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion-exhausts, EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants, mathlib:legendreSym.at_neg_one, mathlib:legendreSym.eq_neg_one_iff, tauceti:WeierstrassCurve.Affine.finite_point, tauceti:WeierstrassCurve.pointCount_eq_card_point.

Acceptance: At p=7,η=2,λ=4 the count is 8. Excluding η=0,±1 is essential: these give repeated cubic roots and not an elliptic group.

Source: BS20, §6, Lemma 6.3, p.368. Exactly the source subgroup theorem, with subgroup independence and the count consequence spelled out.

Atlas planet: Two-by-four torsion.

### A half of the zero root on the minus-one model

Declaration: WeierstrassCurve.minusOneOrderFour. Node: EllipticLegendreCharacterInterfaces:LG.3/minus-one-order-four.

Over a field K with 2≠0 and i²=−1, minusOneOrderFour i is the native point (i,1−i) on L_{−1}. Its double is (0,0), hence its order is exactly 4. Over 𝔽_p with p≡5 mod8 such i exists by the supplementary law at −1; this is the source application.

Hypotheses: K is a field; 2≠0; i²=−1.

Construction or proof. Membership is (1−i)²=−2i=i(i−1)(i+1). The native tangent/doubling formula gives x(2P)=0,y(2P)=0; characteristic 2 is excluded and the tangent denominator is nonzero. The double is a nonzero two-torsion point, so order is 4.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/legendre-model, EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion, mathlib:ZMod.exists_sq_eq_neg_one_iff, mathlib:WeierstrassCurve.Affine.Point.

Uses.

- BS20 Lemma 6.5: All four halves of (0,0) are its translates by native two-torsion.
- LG.3 minus-one-no-order-eight: The nonsquare first descent coordinate rules out further halving.

API.

- WeierstrassCurve.minusOneOrderFour_coordinates (data): The coordinates are (i,1−i).
- WeierstrassCurve.minusOneOrderFour_double (relation): 2•minusOneOrderFour i is the native point (0,0) on L_{−1}.
- WeierstrassCurve.minusOneOrderFour_order (characterisation): addOrderOf(minusOneOrderFour i)=4.
- WeierstrassCurve.minusOneOrderFour_first_descent (compatibility): The first split coordinate of native μ at this point is the squareclass [i].

Unit tests.

- WeierstrassCurve.minusOneOrderFour_test_five_i_two (computation): For p=5,i=2, the coordinates are (2,4).
- WeierstrassCurve.minusOneOrderFour_test_five_i_three (computation): For p=5,i=3, the coordinates are (3,3).
- WeierstrassCurve.minusOneOrderFour_test_double (compatibility): At p=5,i=2, native doubling is (0,0) and the point is not two-torsion.

Acceptance: At p=5,i=2 the point is (2,4), and at i=3 it is (3,3).

Source: BS20, §6, proof of Lemma 6.5, p.370. Native point construction for the source’s explicit half, not a formal pair with an assumed group law.

Atlas planet: Minus-one order-four point.

### No order-eight point on the minus-one model

Declaration: WeierstrassCurve.legendre_minus_one_no_order_eight. Node: EllipticLegendreCharacterInterfaces:LG.3/minus-one-no-order-eight.

For p≡5 mod8 prime, L_{−1}(𝔽_p) has no point of exact order 8. Only (0,0) among the three nonzero two-torsion points is divisible by 2; each of its four halves has nonsquare first descent coordinate.

Hypotheses: p is prime and p%8=5.

Construction or proof. The supplementary law says 2 is a nonsquare and −1 is a square. In descent-at-roots the tuples at (0,0),(1,0),(−1,0) are (1,1,1),(1,[2],[2]),(1,[2],[2]). Every point of order 4 must double to (0,0); its halves are the four translates of minusOneOrderFour by the doubling kernel (enumerated by EX). Their first descent class is [i], since every root tuple has first class 1. An i with i²=−1 is a nonsquare: otherwise a square root of i would have order 8 in 𝔽_p×, contrary to p−1≡4 mod8 (equivalently Euler’s criterion gives i^((p−1)/2)=−1). Native ker_μ_eq rules out halving any point of order 4, hence rules out order 8.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.3/minus-one-order-four, EllipticLegendreCharacterInterfaces:LG.2/descent-at-root, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion-exhausts, EllipticLegendreCharacterInterfaces:LG.2/halving-square-criterion, mathlib:legendreSym.at_two, mathlib:ZMod.euler_criterion, EllipticLegendreCharacterInterfaces:LG.3/minus-one-double, EllipticLegendreCharacterInterfaces:LG.3/minus-one-order, EllipticLegendreCharacterInterfaces:LG.3/minus-one-first-descent.

Acceptance: At p=5 the point group has 8 elements but exponent 4; thus 8|#E does not imply an order-eight element.

Source: BS20, §6, proof of Lemma 6.5, p.370. The proof’s finite group and nonsquare input are retained; it does not assert a cyclic full point group.

### Exact two-adic order of the minus-one point count

Declaration: WeierstrassCurve.legendre_minus_one_point_count_v_two. Node: EllipticLegendreCharacterInterfaces:LG.3/minus-one-point-count.

For p prime with p≡5 mod8, v₂(pointCount(L_{−1}/𝔽_p))=3, equivalently 8 divides this positive integer and 16 does not divide it. The count is the full projective elliptic count, including O.

Hypotheses: p is prime and p%8=5.

Construction or proof. The native point group is finite and its doubling kernel has cardinality 4. The explicit order-four half with an independent two-torsion point gives a subgroup of order 8. Use the existing finite-abelian-group structure theorem. Since there is no point of order 8, each two-primary cyclic factor has order at most 4. Exactly two factors contribute to the doubling kernel, so the 2-part is at most 16. If it were 16, both factors would have order 4 and every two-torsion point would be divisible by 2, contradicting NO, which identifies only one nonzero divisible point. Thus the two-primary group is Z/2×Z/4, of order 8. Compare native pointCount and Nat.card Point.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.3/minus-one-order-four, EllipticLegendreCharacterInterfaces:LG.3/minus-one-no-order-eight, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion-exhausts, mathlib:AddCommGroup.equiv_directSum_zmod_of_finite, tauceti:WeierstrassCurve.Affine.finite_point, tauceti:WeierstrassCurve.pointCount_eq_card_point, EllipticLegendreCharacterInterfaces:LG.3/minus-one-double, EllipticLegendreCharacterInterfaces:LG.3/minus-one-order.

Acceptance: p=5,13,29 give counts 8,8,40 respectively, all of exact two-adic valuation 3.

Source: BS20, §6, Lemma 6.5, p.370. The source’s exact valuation, not merely divisibility by 8; the finite group bridge is made explicit.

Atlas planet: Minus-one two-adic point count.

### Doubling the minus-one half

Declaration: WeierstrassCurve.minusOneOrderFour_double. Node: EllipticLegendreCharacterInterfaces:LG.3/minus-one-double.

2•minusOneOrderFour i is the native point (0,0) on L_{−1}.

Hypotheses: K is a field; 2≠0; i²=−1.

Construction or proof. Use i²=−1 and the native tangent formula; its denominator 2(1−i) is nonzero. The doubled coordinates are (0,0).

Direct inputs: EllipticLegendreCharacterInterfaces:LG.3/minus-one-order-four, mathlib:WeierstrassCurve.Affine.Point.add_self_of_Y_ne.

Acceptance: At p=5,i=2 the native double of (2,4) is (0,0).

Source: BS20, §6, Lemma 6.5 proof p.370. Promotes the consuming API item rather than leaving a dependency hidden in a constructor API.

### Order of the minus-one half

Declaration: WeierstrassCurve.minusOneOrderFour_order. Node: EllipticLegendreCharacterInterfaces:LG.3/minus-one-order.

addOrderOf(minusOneOrderFour i)=4.

Hypotheses: K is a field; 2≠0; i²=−1.

Construction or proof. Use the nonzero double (0,0) and the native root two-torsion enumeration. Exactly 4, not 1 or 2, is the additive order.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.3/minus-one-double, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion-exhausts.

Acceptance: The p=5 example has 2P≠O,4P=O.

Source: BS20, §6, Lemma 6.5 proof p.370. Promotes the consuming API item rather than leaving a dependency hidden in a constructor API.

### First descent class of the minus-one half

Declaration: WeierstrassCurve.minusOneOrderFour_first_descent. Node: EllipticLegendreCharacterInterfaces:LG.3/minus-one-first-descent.

The first split coordinate of native μ at this point is the squareclass [i].

Hypotheses: K is a field; 2≠0; i²=−1.

Construction or proof. The x-coordinate i is not 0,1,−1 since i²=−1 and characteristic is odd. Apply the native nonroot reading with d=1,λ=−1.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.3/minus-one-order-four, EllipticLegendreCharacterInterfaces:LG.2/descent-off-roots.

Acceptance: At p=5 both i=2 and i=3 have the nontrivial squareclass.

Source: BS20, §6, Lemma 6.5 proof p.370. Promotes the consuming API item rather than leaving a dependency hidden in a constructor API.

## LG.4 — Explicit order-four points in the twist by two

The witness is an algebraic construction over every field of characteristic not two satisfying the stated relations. Set λ=2t², with t,v nonzero and 2t²+2v²=1, and choose i²=−1. These hypotheses force λ≠0,1. Write r=2t and s=2iv. Then r²=2λ, s²=2λ−2, r²−s²=2 and rs=4itv. The point has x=r²+rs and y=rs(r+s). Its three root differences are r(r+s),s(r+s),rs, whose product is y². If r+s vanished, then r²=s² would force 2=0; thus its y-coordinate and tangent denominator are nonzero.

The native tangent calculation must use a₂=−(2r²−s²) and a₄=r²(r²−s²), since the roots are 0,r²−s²,r². The tangent numerator and denominator simplify to 2rs(r+s)² and 2rs(r+s), giving slope r+s. Doubling gives (r²,0), namely (2λ,0). This point is nonzero and killed by two, so the witness has exact order four. Its third native descent coordinate is [rs]=[4itv], without any assumption that this class is trivial.

The published y-coordinate is not used. The independently confirmed atlas finding PAPER-BENNETT-SIKSEK-20/E14 supplies y=8itv(t+iv). The retained x-coordinate and third descent coordinate agree with the intended proof. At p=5,t=v=2,i=3, the printed (4,4) is off the curve, while the corrected (4,3) doubles to (1,0). Changing i to 2 gives (3,4), also with double (1,0). These are tests of the local coordinate identity; they are not claimed to satisfy every global hypothesis of the progression lemma. The packet preserves the source version, locator, correction and prior independent finding, without claiming a new independent review of this plan.

### The corrected order-four witness

Declaration: WeierstrassCurve.twistHalvingPoint. Node: EllipticLegendreCharacterInterfaces:LG.4/twist-halving-point.

Over a field K with 2≠0, let t,v be nonzero, i²=−1 and 2t²+2v²=1, and put λ=2t². twistHalvingPoint t v i is the native point P=(2λ+4itv,8itv(t+iv)) on L_{2,λ}:y²=x(x−2)(x−2λ). The conditions imply λ≠0,1 and y(P)≠0. This algebraic construction is valid without any progression hypothesis; the source applies it at p≡5 mod8.

Hypotheses: K is a field; 2≠0; t≠0,v≠0; i²=−1; 2t²+2v²=1.

Construction or proof. Set r=2t,s=2iv: r²=2λ,s²=2λ−2,rs=4itv. Then x=r²+rs and y=rs(r+s). The three factors x,x−2,x−2λ equal r(r+s),s(r+s),rs, so the product is y². Distinct cubic roots and the scaled-invariant criterion give nonsingularity. If r+s=0 then r²=s² would force 2=0, so y is nonzero. Use the corrected y-coordinate from the independently confirmed published-source finding; the printed coordinate fails the equation.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion.

Uses.

- BS20 proof of Lemma 6.6: Supplies the actual order-four point whose third descent class is [4itv].
- ErdosProgressionPowers EP.4: The finite-field conic branch uses the witness after supplying the local hypotheses, not as a progression-specific construction.

API.

- WeierstrassCurve.twistHalvingPoint_coordinates (data): Coordinates are exactly (4t²+4itv,8itv(t+iv)).
- WeierstrassCurve.twistHalvingPoint_double (relation): 2•twistHalvingPoint t v i is the native two-torsion point (2λ,0).
- WeierstrassCurve.twistHalvingPoint_order (characterisation): addOrderOf(twistHalvingPoint t v i)=4.
- WeierstrassCurve.twistHalvingPoint_third_descent (compatibility): The third split reading of native μ(P) is [4itv].
- WeierstrassCurve.twistHalvingPoint_map (functoriality): Field extension maps the native point to the point with mapped t,v,i, preserving the chosen square root i.

Unit tests.

- WeierstrassCurve.twistHalvingPoint_test_five (computation): Over 𝔽₅ with t=v=2,i=3, the corrected coordinates are (4,3).
- WeierstrassCurve.twistHalvingPoint_test_other_i (computation): Over 𝔽₅ with t=v=2,i=2, the corrected coordinates are (3,4).
- WeierstrassCurve.twistHalvingPoint_test_double (compatibility): At p=5,t=v=2,i=3, native doubling is (1,0)=(2λ,0).
- WeierstrassCurve.twistHalvingPoint_test_printed (non-example): At p=5,t=v=2,i=3, the printed pair (4,4) does not satisfy the native scaled Legendre equation.

Acceptance: For p=5,t=v=2,i=3,λ=3, P=(4,3) belongs to y²=x(x−2)(x−1); the printed point (4,4) does not.

Source: BS20, §6, proof of Lemma 6.6, p.371, corrected by atlas finding E14. The printed x is retained; the y is corrected to 8itv(t+iv), preserving the local proof.

Atlas planet: Corrected order-four witness.

### Doubling the corrected witness

Declaration: WeierstrassCurve.twistHalvingPoint_double. Node: EllipticLegendreCharacterInterfaces:LG.4/twist-halving-double.

Under the corrected-witness hypotheses, native doubling of P is exactly (2λ,0). With r=2t,s=2iv the tangent slope is r+s and the doubled coordinates are (r²,0).

Hypotheses: The hypotheses of twist-halving-point.

Construction or proof. Write r=2t,s=2iv, so 2=r²−s², a₂=−(2r²−s²),a₄=r²(r²−s²), and P=(r²+rs,rs(r+s)). The tangent numerator is 2rs(r+s)² and denominator 2rs(r+s), which is nonzero. The native slope is r+s. The native doubling x is (r+s)²−a₂−2(r²+rs)=r², and y is −y(P)+(r+s)(x(P)−r²)=0.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.4/twist-halving-point, EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion, mathlib:WeierstrassCurve.Affine.Point.add_self_of_Y_ne.

Acceptance: At the p=5 tuple, (4,3)+(4,3)=(1,0), which is nonzero.

Source: BS20, §6, proof of Lemma 6.6, p.371. A denominator-checked native doubling calculation for the corrected point.

### Exact order four of the corrected witness

Declaration: WeierstrassCurve.twistHalvingPoint_order. Node: EllipticLegendreCharacterInterfaces:LG.4/twist-halving-order.

Under the corrected-witness hypotheses, addOrderOf P=4. In particular it is neither O nor two-torsion, although its double is a two-torsion point.

Hypotheses: The hypotheses of twist-halving-point.

Construction or proof. Use TD and nonzero of the native labelled point (2λ,0). That labelled point doubles to O. Hence 4P=O and 2P≠O; the divisors of 4 leave only exact order 4.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.4/twist-halving-double, EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion.

Acceptance: The p=5 tuple satisfies 4P=O and 2P=(1,0)≠O.

Source: BS20, §6, proof of Lemma 6.6, p.371. This order assertion is separately exported from the coordinate construction.

Atlas planet: Twist order-four theorem.

### The witness’s third native descent coordinate

Declaration: WeierstrassCurve.twistHalvingPoint_third_descent. Node: EllipticLegendreCharacterInterfaces:LG.4/twist-halving-descent.

Under the corrected-witness hypotheses, the third split reading of native μ(P) is the nonzero squareclass [4itv]. Indeed x(P)−2λ=4itv; y(P)≠0 implies x(P) avoids all three roots.

Hypotheses: The hypotheses of twist-halving-point.

Construction or proof. The corrected point has nonzero y, so the nonroot descent formula applies. In declared root order (0,2,2λ), the third difference is exactly 4itv. Its nonzero value follows from 2,t,v,i all being nonzero. No condition that this class is square is assumed.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.4/twist-halving-point, EllipticLegendreCharacterInterfaces:LG.2/descent-off-roots.

Acceptance: At p=5,t=v=2,i=3 this representative is 3, a nonsquare; at i=2 it is 2, also a nonsquare.

Source: BS20, §6, proof of Lemma 6.6, p.371. The coordinate driving the source proof is unchanged by the corrected y-coordinate.

## LG.5 — Trace and downstream interfaces

The symmetric cubic has a direct point-count proof. For y²=x(x−u)(x+u), its cubic f is odd. At p≡3 modulo 4 the quadratic character of −1 is −1, so the integer sum of quadraticChar(f(x)) cancels under x↦−x. The zero values cause no exception. The existing square-root count writes the full projective count as p+1 plus that sum, giving p+1 and trace zero. This does not import CM distribution, Hasse, analytic continuation or a theorem about supersingular-prime density. Those topics are unnecessary for this particular polynomial symmetry.

The twist export has a different ownership boundary. BSD.0 supplies generic quadratic-twist Euler-factor comparison. This layer identifies the actual Legendre coefficient model with its native twist and specializes that comparison. For nonzero d and nonsingular λ over an odd prime field, the trace is multiplied by quadraticChar(d); the good Euler polynomial is 1−quadraticChar(d)a_p(Lλ)T+pT². At p≡5 modulo 8 and d=2 this is a sign change. Over 𝔽₅ with λ=3, the unscaled count is four, the scaled-by-two count eight, and the traces are 2 and −2 respectively. A square d keeps the trace. The specialization does not claim anything about a rational bad-prime local factor or a global L-function factorization. Those remain BSD.0 targets, and its precise finite-field comparison is an explicit supplier request.

### Trace zero for a symmetric split cubic

Declaration: WeierstrassCurve.scaledLegendre_minus_one_trace_zero. Node: EllipticLegendreCharacterInterfaces:LG.5/symmetric-cubic-trace-zero.

For p prime with p≡3 mod4 and u∈𝔽_p×, the native Weierstrass curve with equation y²=x(x−u)(x+u) has pointCount p+1 and frobeniusTrace 0. It is scaledLegendre u (−1), hence is elliptic. No CM distribution or Hasse-bound input is required.

Hypotheses: p is prime and p%4=3; u≠0.

Construction or proof. Use the finite quadratic-character square-root count to write pointCount=p+1+Σ_x quadraticChar(x(x−u)(x+u)). The cubic is odd: f(−x)=−f(x). Since −1 is a nonsquare, the quadratic character changes sign under x↦−x, including its zero values. The sum equals its own negative; it is an integer sum so it vanishes. Use the native frobeniusTrace definition.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model, EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants, mathlib:quadraticChar, mathlib:quadraticChar_card_sqrts, mathlib:legendreSym.at_neg_one, tauceti:WeierstrassCurve.pointCount, tauceti:WeierstrassCurve.frobeniusTrace_def.

Acceptance: At p=3,u=1 the point count is 4; at p=7,u=2 it is 8; u=0 is excluded because the model is singular.

Source: BS20, §5, proof of Lemma 5.2, p.366. The equation-specific trace-zero fact isolated from the progression argument; direct counting replaces the unread generic CM citation.

Atlas planet: Symmetric-cubic trace zero.

### Legendre specialization of the twist-factor interface

Declaration: WeierstrassCurve.scaledLegendre_frobeniusTrace. Node: EllipticLegendreCharacterInterfaces:LG.5/twist-euler-factor-specialization.

For p odd prime and d∈𝔽_p×,λ∉{0,1}, specialize the BSD.0 good-prime quadratic-twist comparison along the native identity Ld,λ=(Lλ).quadraticTwistOf 0 (−d/4): frobeniusTrace(Ld,λ)=quadraticChar(d)·frobeniusTrace(Lλ). The good Euler polynomial is 1−quadraticChar(d)a_p(Lλ)T+pT². In particular at p≡5 mod8 the d=2 trace is −a_p(Lλ). This node exports only the equation-specific identification; the generic Euler-factor theorem and rational bad-prime factors stay in BSD.0.

Hypotheses: p is prime and p≠2; d≠0; λ≠0,1.

Construction or proof. Use the native scalar-twist identity to align the actual coefficient model and the imported twist comparison. BSD.0 supplies the generic local-factor comparison and its Frobenius-trace normalization; read its good-prime case here. The finite quadratic character of 2 is −1 at p≡5 mod8 by the native supplementary law. No analytic continuation is needed for this specialization.

Direct inputs: EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-twist-identity, EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants, EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants, RankZeroOneBSD:BSD.0, mathlib:quadraticChar, mathlib:legendreSym.at_two, tauceti:WeierstrassCurve.frobeniusTrace.

Acceptance: At p=5,λ=3, Lλ and L2,λ have counts 4 and 8, traces 2 and −2. If d is a square the traces agree.

Source: BS20, §6, proof of Lemma 6.6, p.371. The source’s twist-by-two sign is an adapter for the already owned generic BSD.0 comparison.

## Supplier requests and precise remaining work

The generic reduction request to EllipticCurves Layer 4 is the ℚ-to-ℚ_p transport, good minimal-model j-integrality, unit-discriminant minimality and residue-field comparison, including the bridge from additive rational valuations to ℤ_p units. This request consumes its existing local theory; it does not add that theory to this roadmap. R01.3 is asked for the actual elliptic conductor’s odd support and exponent-one identification at odd semistable bad primes. BSD.0 is asked for its generic finite-field/good-prime twist trace comparison in the native trace convention. The CA.1 character construction is already specified by its exact node and does not need a second conductor-definition request.

LG.0’s refinement is the native full-two-torsion factorization and point-transport chain. LG.1’s refinements are the three local and conductor interfaces and native types for the imported character. LG.2’s refinement is elaboration of the CRT and quotient transports against a compiled Tau Ceti baseline, followed by their compatibility proofs. LG.3’s refinement is native finite-group implementation of the halving and exact two-primary argument. LG.4’s refinement is denominator-cleared native doubling and μ compatibility for the corrected point. LG.5’s refinement is the direct character sum and the supplied generic twist comparison.

The organizational rescope note retains the six current layer ids and their owners. A maintainer-selected restructuring can organize the thin elliptic Part IIs together, but the present plan neither merges roadmaps nor moves generic BSD, local reduction, character or conductor ownership. The existing Tau Ceti roadmap and all its links are unchanged.

## Verification and prototype status

The complete suggested native file was not compiled: no existing compiled Tau Ceti build at f790474 was available. The libraries were not built and no caches were downloaded. The Mathlib-only projection was elaborated at the exact recorded pin with one Lean worker and an 8 GiB memory cap. It contains actual Mathlib carriers and theorem-shaped signatures, including the minimal ℚ_p good-reduction conditions, rather than surrogate propositions. It has zero errors and only the expected admission warnings. Its source hash and resource receipt are recorded in the handoff. The two native character/conductor signatures cannot yet name the unimplemented CA.1 and actual-conductor objects and are explicitly omitted; their exact mathematical statements remain in LG.1. This omission is a prototype gap, not an alternate definition of those objects.

Separate scratch kernel checks, using Mathlib’s actual native point constructors and addition, prove both corrected 𝔽₅ doubles, both minus-one doubles, the nonzero two-torsion doubles, the off-curve printed witness and the small discriminants without admissions. These finite proofs do not prove the universal proposed theorems. Independent exact Python regressions test all nonsingular Legendre halving instances over primes below 80, root descent products, trace signs and symmetry, corrected witness tuples, subgroup orders, labelled rational parameters and bad-valuation cases. The regression receipt is summarized in the handoff so that an independent reviewer can reproduce its bounds.

All packet nodes retain implementationStatus unchecked. No review verdict is claimed for this plan. The existing source-error confirmation is attributed to its prior independent errata review; this plan still requires its own independent review. Complete means that every target in the six-layer design is represented and backward-chained. It does not mean that the supplier requests, native prototype gaps or implementation work have been discharged.
