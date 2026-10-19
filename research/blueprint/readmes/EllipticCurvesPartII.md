# Elliptic curves, Part II: Legendre interfaces

This document is an import index. The mathematical specification is
[EllipticLegendreCharacterInterfaces](EllipticLegendreCharacterInterfaces.md),
which extends [EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves).
Every target assigned to this identifier is already a target of that owner.
Use its node identifiers, API and tests. This index introduces no competing
objects, theorem names or planets. Its [packet](../packets/EllipticCurvesPartII.json)
records the complete seven-item source crosswalk and the proposed merger.

## Scope and conventions

The mathematical endpoints are rational Legendre normalization, units at odd
good primes, odd primitive-character conductor divisibility, two explicit
finite-field torsion results, a corrected order-four witness and trace zero
for a symmetric cubic. The general progression theorem is a consumer of these
interfaces, not an assumption. Large-exponent hypotheses do not belong in
the local finite-field statements.

Write Lλ for the native Weierstrass model with coefficients
(0,−(1+λ),0,λ,0), and Ld,λ for (0,−d(1+λ),0,d²λ,0).
These coefficient models make sense over any commutative ring. Elliptic,
point-group and descent assertions use a field with 2≠0 and d≠0,λ≠0,1.
Their equations are y²=x(x−1)(x−λ) and y²=x(x−d)(x−dλ).
Their discriminants are 16λ²(1−λ)² and 16d⁶λ²(1−λ)²;
the c₄ invariants are 16(λ²−λ+1) and 16d²(λ²−λ+1).
Both elliptic models have
j=256(λ²−λ+1)³/(λ²(1−λ)²).

The native twist uses parameters t,n and discriminant t²−4n.
The scalar-d equation is the native twist of Lλ at (0,−d/4).
A twist need not be isomorphic over the base field. Neither equal j nor
permuting the roots supplies a rational isomorphism to the unscaled equation.
The six parameters form a labelled tuple, not a six-element set.

The native descent is `WeierstrassCurve.Affine.μ`, already implemented at the
pin with kernel the doubled points. LG.2 reads this map through evaluation
of its native cubic algebra at (0,d,dλ); it constructs no second descent map.
Squareclasses are classes of units. The halving criterion uses squares in
the field, where zero is allowed, but never forms the unit squareclass of zero.
Finite-field counts use `WeierstrassCurve.pointCount`, all affine solutions
plus O. The native trace is the integer q+1−pointCount. Its comparison with
the cardinality of the native point group requires ellipticity.

Rational good reduction is curve-level reduction through a minimal local
model. An arbitrary scaled equation is not asserted to have good reduction.
The elliptic conductor is the ramification-theoretic conductor, not the
discriminant and not an unproved identification with an algorithmic exponent.
Primitive characters come from CA.1 and may be trivial, of conductor 1.

## Layers and ownership

The alias uses the same layer keys solely to index the existing owner.
Each row imports the corresponding owner layer; no arrow back to the alias
is added. The owner's internal order and prerequisites are unchanged.

| Alias layer | Single owner | Imported targets | Nodes |
| --- | --- | --- | ---: |
| LG.0 | EllipticLegendreCharacterInterfaces:LG.0 | Equations, six parameters, normalization and two-torsion | 11 |
| LG.1 | EllipticLegendreCharacterInterfaces:LG.1 | Good-prime units and character-conductor support | 5 |
| LG.2 | EllipticLegendreCharacterInterfaces:LG.2 | CRT and readings of existing descent | 8 |
| LG.3 | EllipticLegendreCharacterInterfaces:LG.3 | Two-by-four subgroup and exact two-adic count | 7 |
| LG.4 | EllipticLegendreCharacterInterfaces:LG.4 | Corrected halving point and its API | 4 |
| LG.5 | EllipticLegendreCharacterInterfaces:LG.5 | Symmetric trace zero and twist specialization | 2 |

The owner has 37 nodes, eight definitions/constructions, 33 API items,
27 definition tests and 19 planets. This alias owns zero of each.
All six alias coverage records are `source_decomposed`: that means the
import accounting is complete. It is not mathematical closure. All six
owner layers remain `planned`; every implementation status stays unchecked.
The existing four gaps and three supplier requests are listed below.

## Source targets and proof routes

The following statements are in our own words. Each entry maps the exact
Bennett–Siksek extraction item to existing declarations. A full list of all
37 imports follows the definition contracts. A short node reference such as
LG.0/legendre-model always means
`EllipticLegendreCharacterInterfaces:LG.0/legendre-model`.

### PAPER-BENNETT-SIKSEK-20/28 — Normalization and six labelled parameters

A rational elliptic Weierstrass curve F with four rational points killed by 2 admits a rational variable change to y²=x(x−d)(x−dλ), with d≠0 and λ≠0,1. The possible parameters, counted by root ordering, are λ,1/λ,1−λ,1/(1−λ),λ/(λ−1),(λ−1)/λ. There are six labels even when values coincide. The resulting curve is the scalar-d twist of Lλ, not necessarily rationally isomorphic to Lλ.

Source: BS20, §6, equation (17), p.367; six parameters in the proof of Lemma 6.2, p.368.

Imported nodes: `LG.0/legendre-model`, `LG.0/scaled-legendre-model`, `LG.0/legendre-parameters`, `LG.0/legendre-invariants`, `LG.0/scaled-invariants`, `LG.0/parameters-from-root-orderings`, `LG.0/split-normalization`, `LG.0/full-two-torsion-normalization`, `LG.0/scaled-legendre-twist-identity`.

Proof route. Complete the square using the parent normal form. Nonzero rational two-torsion points have y=0 and give three distinct rational roots of the separable monic cubic. For ordered roots e₀,e₁,e₂ translate x by e₀; set d=e₁−e₀ and λ=(e₂−e₀)/d. Compare the five native coefficients with the scaled model. Recompute the ratio for root orders (012),(021),(102),(120),(210),(201). Compare with the native twist at parameters (0,−d/4), whose twisting discriminant is d.

Checks. At λ=−1 the labelled tuple is (−1,−1,2,1/2,1/2,2), not six distinct elements. At λ=3 it is (3,1/3,−2,−1/2,3/2,2/3). The discriminants at λ=−1,2,1/2 over Q are 64,64,1; d=0 or λ=0,1 is singular.

### PAPER-BENNETT-SIKSEK-20/29 — Units at odd good primes

Let F/Q be elliptic, have full rational two-torsion, and be semistable at every odd prime. For each associated parameter λ and each odd good prime p of F, v_p(λ)=v_p(1−λ)=0. Good reduction concerns the curve through its minimal local model.

Source: BS20, §6, Lemma 6.2(i) and proof, pp.367–368.

Imported nodes: `LG.1/legendre-j-valuation`, `LG.1/good-prime-units`, `LG.1/legendre-good-model`.

Proof route. The source uses an odd-primitive integral split model. The owner instead expands j=256(λ²−λ+1)³/(λ²(1−λ)²) and proves the three valuation cases directly. Writing a=v_p(λ), b=v_p(1−λ), failure of a=b=0 gives: a<0 implies b=a and v_p(j)=2a; a>0 implies b=0 and v_p(j)=−2a; b>0 implies a=0 and v_p(j)=−2b. The parent local comparison supplies integral j at a good minimal model. Variable-change and twist invariance of j identify this j with that of Lλ. A separate unit-discriminant argument proves good reduction of the unscaled Lλ, without asserting good reduction for every twist.

Checks. At p=3, λ=3 and λ=1/3 give v₃(j)=−2. For λ=−1 at p=3 the two parameters are units but j=1728 is not a unit; only integrality of j is needed.

### PAPER-BENNETT-SIKSEK-20/30 — Odd primitive-character conductor

Under the preceding rational hypotheses, take ω in {1,−1,2,−2}. If N is the primitive conductor of the CA.1 quadratic character of the nonzero rational squareclass ωλ and M is the actual elliptic conductor of F, then the largest odd divisor of N divides M. The trivial character, N=1, is allowed.

Source: BS20, §6, Lemma 6.2(ii) and proof, pp.367–368.

Imported nodes: `LG.1/character-odd-support`, `LG.1/character-conductor-divides`.

Proof route. Import ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass: odd conductor support is given by odd valuation parity, and its odd part is squarefree. At an odd good prime, ω is a unit and the preceding unit theorem makes v_p(ωλ)=0. Every odd character-conductor prime is therefore bad for F. Use the actual elliptic conductor support comparison from R01.3 and parent Layer 4, then squarefreeness gives divisibility. The owner retains the exact supplier request; no discriminant or algorithmic exponent substitutes for M.

Checks. For F:y²=x³−x and λ=−1 every allowed ω gives odd conductor 1, consistent with elliptic conductor 32. At λ=3 the possible odd support is {3}; imposing a nontrivial odd conductor would wrongly exclude the preceding case.

### PAPER-BENNETT-SIKSEK-20/31 — Two-by-four subgroup

For a prime p≡3 mod4 and η in F_p with η≠0,1,−1, the native point group of L_(η²) contains a subgroup isomorphic as an additive group to Z/2 × Z/4. Its projective point count is divisible by 8.

Source: BS20, §6, Lemma 6.3 and proof, p.368.

Imported nodes: `LG.0/legendre-two-torsion`, `LG.0/legendre-two-torsion-exhausts`, `LG.2/halving-square-criterion`, `LG.3/two-by-four-subgroup`.

Proof route. Read the existing native descent through the split cubic (LG.2); the native kernel theorem gives the halving criterion in terms of three field squares. If 1−η² is a square, (1,0) is a double. Otherwise −1 is nonsquare and η²−1 is a square, so (η²,0) is a double. The exclusions ensure a nonsingular model and a nonzero doubled point. A chosen half has order four. A different independent two-torsion point gives the Z/2 factor; use the native point-count comparison for divisibility.

Checks. At p=7, η=2, the count is 8. At p=11, η=2, the count is 16. η=0,1,−1 is excluded because it gives λ=0 or 1; p=3 has no admissible η.

### PAPER-BENNETT-SIKSEK-20/34 — Exact two-adic order on the minus-one curve

For every prime p≡5 mod8, the projective point count of L_(-1):y²=x(x−1)(x+1) has exact 2-adic valuation 3: it is divisible by 8 and not by 16.

Source: BS20, §6, Lemma 6.5 and proof, p.370.

Imported nodes: `LG.2/descent-off-roots`, `LG.2/descent-at-root`, `LG.2/descent-product`, `LG.2/halving-square-criterion`, `LG.3/minus-one-order-four`, `LG.3/minus-one-double`, `LG.3/minus-one-order`, `LG.3/minus-one-first-descent`, `LG.3/minus-one-no-order-eight`, `LG.3/minus-one-point-count`.

Proof route. Choose i²=−1. The point (i,1−i) lies on L_(-1), doubles to (0,0), and has order four. The square tests show that only (0,0) among the nonzero two-torsion points is divisible by 2. Its four halves have first descent coordinate represented by i or −i. Since (p−1)/4 is odd, i and −i are nonsquares; no point has order eight. The finite abelian 2-primary subgroup has rank two. The order-four point gives a factor four; absence of order eight bounds the exponents. Excluding halving of (±1,0) rules out Z/4 × Z/4, so the subgroup is Z/2 × Z/4. Absence of order eight alone would not prove the required count.

Checks. For p=5,13,29,37 the projective counts are 8,8,40,40, each of exact 2-adic valuation 3. At p=5 the choices i=2 and i=3 give (2,4) and (3,3), both doubling to (0,0).

### PAPER-BENNETT-SIKSEK-20/69 — Trace zero of a symmetric cubic

If p is prime, p≡3 mod4 and u≠0 in F_p, the curve y²=x(x−u)(x+u) has projective point count p+1 and native Frobenius trace zero.

Source: BS20, §5, proof of Lemma 5.2, p.366.

Imported nodes: `LG.0/scaled-legendre-model`, `LG.0/scaled-invariants`, `LG.5/symmetric-cubic-trace-zero`.

Proof route. The model is L_(u,-1), hence elliptic. For its odd cubic f, f(−x)=−f(x). Count each fibre as 1+χ(f(x)), where χ(0)=0. Pair x with −x and use χ(−1)=−1; the x=0 term is zero. The affine count is p and adding O gives p+1. Translate using the native integer trace convention, without any appeal to a CM distribution theorem.

Checks. For p=3,7,11 and every nonzero u, the counts are respectively 4,8,12. At p=5,u=1 the count is 8 and trace −2, so the residue-class hypothesis matters.

### PAPER-BENNETT-SIKSEK-20/77 — Corrected half on the scalar-two twist

Over any field with 2≠0, let t,v be nonzero and i²=−1, 2t²+2v²=1. Put λ=2t². On L_(2,λ), P=(2λ+4itv,8itv(t+iv)) doubles to (2λ,0), has exact order four, and has third split native descent coordinate [4itv]. This local construction does not require the progression hypotheses of Lemma 6.6.

Source: BS20, §6, local point computation in the proof of Lemma 6.6, p.371.

Imported nodes: `LG.2/descent-off-roots`, `LG.4/twist-halving-point`, `LG.4/twist-halving-double`, `LG.4/twist-halving-order`, `LG.4/twist-halving-descent`, `LG.5/twist-euler-factor-specialization`.

Proof route. Use the correction already recorded as EllipticLegendreCharacterInterfaces/E1, prior finding PAPER-BENNETT-SIKSEK-20/E14. Set r=2t,s=2iv, so r²−s²=2 and 2λ=r². Then x=r(r+s), x−2=s(r+s), x−2λ=rs, y=rs(r+s). These identities prove membership and y≠0. The tangent numerator is 2rs(r+s)²; its denominator is 2rs(r+s), so its slope is r+s and doubling gives (r²,0). This nonzero two-torsion double proves exact order four; read the third descent difference rs=4itv. The trace-sign step consumed by the source is a specialization of BSD.0 along the native scalar-twist identity, retained by the owner as LG.5/twist-euler-factor-specialization. It does not require a second generic twist theorem.

Checks. At p=5,t=v=2,i=3,λ=3 the corrected point is (4,3) and its double is (1,0). The printed pair (4,4) fails the curve equation. With the other square root i=2 the corrected point is (3,4). These test the local coordinate identity, not the global assumptions of Lemma 6.6.

## Imported definition contracts

These are the eight existing definitions/constructions, with the operations
and tests that consumers require. Their precise proposed names and test
names are in `importedDefinitionContracts` in the packet and in the owner
nodes. No new declarations are assigned here. Each contract carries the
field/ring and nonsingularity conditions above where applicable.

### LG.0/legendre-model — `WeierstrassCurve.legendre`

Carrier: the existing five-coefficient model over a commutative ring, with
a₂=−(1+λ),a₄=λ and the other coefficients zero.
API: `legendre_equation` identifies the factored affine equation;
`legendre_map` commutes with every ring homomorphism;
`legendre_ext` characterizes equality by equality of λ;
`legendre_normalForm` gives the existing normal-form instance a₁=a₃=0.
The equation and map interfaces serve normalization and reduction; the
coefficient equality criterion prevents loss of parameter information.

Checks: at λ=−1 over Q, a₂=0,a₄=−1; at λ=2, Δ=64;
at λ=1/2, Δ=1; λ=0 has Δ=0 and is not elliptic.
Source: BS20 §6, equation (17), p.367.

### LG.0/scaled-legendre-model — `WeierstrassCurve.scaledLegendre`

Carrier: the native model over a commutative ring, with a₂=−d(1+λ),a₄=d²λ
and the other coefficients zero.
API: `scaledLegendre_equation` gives the factored equation;
`scaledLegendre_one` recovers Lλ at d=1;
`scaledLegendre_map` commutes with ring maps;
`scaledLegendre_eq_quadraticTwistOf` identifies the exact native scalar twist.
The twist identity is also the owner's separate LG.0 theorem and is the
interface consumed by BSD.0 specialization.

Checks: d=1,λ=1/2 agrees with L_(1/2); d=2,λ=1/2 has
(a₂,a₄,Δ)=(−3,2,64); d=0 has all coefficients and discriminant zero.
Source: BS20 §6, equation (17), p.367, and twist equation in Lemma 6.6, p.371.

### LG.0/legendre-parameters — `WeierstrassCurve.legendreParameters`

Carrier: a Fin 6-indexed tuple over a field, in order
λ,1/λ,1−λ,1/(1−λ),λ/(λ−1),(λ−1)/λ.
The expression is total; valid elliptic parameters require λ≠0,1.
API: `legendreParameters_apply` gives the six entries;
`legendreParameters_valid` excludes 0 and 1 from every entry under those
hypotheses; `legendreParameters_inverse_pairs` gives reciprocal pairs
(0,1),(2,3),(4,5); `legendreParameters_map` respects field embeddings.
The root-ordering theorem uses (012),(021),(102),(120),(210),(201) in that
order; the scalar twist is recomputed for each root ordering.

Checks over Q: λ=−1 gives (−1,−1,2,1/2,1/2,2);
λ=2 gives (2,1/2,−1,−1,2,1/2);
λ=1/2 gives (1/2,2,1/2,2,−1,−1);
λ=3 gives (3,1/3,−2,−1/2,3/2,2/3).
Source: BS20 §6, six parameters in the proof of Lemma 6.2, p.368.
The moduli-level S₃ action remains in ModularCurves 9E; it is not an
action on the normalized curve family over Q. ModularCurves 4C also owns
the distinct Legendre rigidifier construction.

### LG.0/legendre-two-torsion — `WeierstrassCurve.scaledLegendreTwoTorsion`

Carrier: a Fin 3-indexed tuple of native nonsingular affine points of
Ld,λ, namely (0,0),(d,0),(dλ,0).
API: the `_coordinates` lemma specifies these coordinates, `_double` kills
each by doubling, `_injective` separates all three nonzero points, and
`_exhausts` characterizes the entire double kernel as these points and O.
The exhaustion assertion is also the owner's LG.0 theorem. LG.3 uses an
independent two-torsion point to complement an order-four point.

Checks: d=1,λ=−1 gives (0,0),(1,0),(−1,0);
d=2,λ=1/2 gives (0,0),(2,0),(1,0);
d=1,λ=3 gives three points whose sum is O and whose doubles are O.
Source: BS20 §6, Lemmas 6.3 and 6.5, pp.368,370.

### LG.2/split-cubic-crt — `WeierstrassCurve.scaledLegendreCrt`

Carrier: a ring equivalence from the native cubic algebra
K[X]/(X(X−d)(X−dλ)) to K×K×K, in root order (0,d,dλ).
API: `_mk` evaluates a polynomial h to (h(0),h(d),h(dλ));
`_ext` detects equality by all three evaluations; `_root` gives the
three roots; `_unit_iff` says that all three evaluations are nonzero.
The construction composes the existing native one-root CRT with polynomial
CRT for the cofactor, and uses interpolation for the inverse. It does not
replace the native algebra. The evaluation formula is also a separate
owner target because the descent readings consume it.

Checks: at d=1,λ=−1 the root maps to (0,1,−1);
at d=2,λ=1/2 it maps to (0,2,1);
X is not a unit, since its first evaluation is zero, so it gets no unit
squareclass. Constants evaluate diagonally.
Source: BS20 §6, split two-descent display preceding Lemma 6.5, p.370;
the CRT construction is the adapter to the pinned native implementation.

### LG.2/split-squareclass-equivalence — `WeierstrassCurve.scaledLegendreSquareclassEquiv`

Carrier: the multiplicative equivalence induced by CRT from the native
unit-squareclass quotient to three copies of Kˣ modulo squares.
API: `_unit` reads a unit class through its three nonzero evaluations;
`_one` sends the trivial class to (1,1,1); `_eq_one` detects triviality
in all three factors; `_mul` preserves multiplication. These operations
compose with the already defined μ and its kernel theorem.
At a root r, the corrected representative reads f′(r) at r, not zero.
The resulting triples at the three two-torsion points are
([d²λ],[−d],[−dλ]),
([d],[d²(1−λ)],[d(1−λ)]), and
([dλ],[d(λ−1)],[d²λ(λ−1)]).
The direct nonroot/root/O case calculation gives product 1.

Checks over Q: constant 1 at d=1,λ=−1 gives (1,1,1);
constant 4 at d=1,λ=2 also gives (1,1,1);
constant 2 at d=1,λ=1/2 gives ([2],[2],[2]), which is not (1,1,1).
Source: BS20 §6, split two-descent display and Lemma 6.5, p.370;
the native quotient and corrected representatives supply the construction.

### LG.3/minus-one-order-four — `WeierstrassCurve.minusOneOrderFour`

Carrier: the native point (i,1−i) on L_(-1), for i²=−1 in a field
with 2≠0. Such i exists over F_p when p≡5 mod8.
API: `_coordinates` fixes the pair; `_double` gives (0,0);
`_order` gives exact additive order four; `_first_descent` reads [i].
The last three are also owner target nodes. They are the explicit input
to the no-order-eight argument and the exact two-adic count.

Checks: over F₅, i=2 gives (2,4), i=3 gives (3,3);
doubling (2,4) gives (0,0), so it is not a two-torsion point.
Source: BS20 §6, proof of Lemma 6.5, p.370.

### LG.4/twist-halving-point — `WeierstrassCurve.twistHalvingPoint`

Carrier: the native point (2λ+4itv,8itv(t+iv)) on L_(2,λ),
with λ=2t², 2≠0, t,v≠0, i²=−1 and 2t²+2v²=1.
API: `_coordinates` fixes that pair; `_double` gives (2λ,0);
`_order` gives exact order four; `_third_descent` reads [4itv];
`_map` commutes with field embeddings, mapping the chosen i as well.
These coordinate, group and descent contracts are consumed together;
correcting y leaves the third descent class intact.

Checks: over F₅ with t=v=2, i=3 gives (4,3), i=2 gives (3,4);
the first point doubles to (1,0)=(2λ,0);
the printed pair (4,4) does not lie on the curve.
Source: BS20 §6, proof of Lemma 6.6, p.371, using the existing correction
EllipticLegendreCharacterInterfaces/E1 (prior PAPER-BENNETT-SIKSEK-20/E14).
The small-field checks concern the local formula only.

## Complete import inventory

The following nodes are owned in the canonical packet. Their exact
statements, hypotheses, sources and direct prerequisites are there; the
alias creates no renamed versions. The corresponding LG.n layer is the
same layer as in the mapping table above.

### Imported LG.0

- `EllipticLegendreCharacterInterfaces:LG.0/legendre-model` — The Legendre equation.
- `EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-model` — The scaled Legendre equation.
- `EllipticLegendreCharacterInterfaces:LG.0/legendre-parameters` — Six labelled Legendre parameters.
- `EllipticLegendreCharacterInterfaces:LG.0/legendre-invariants` — Legendre discriminant and ellipticity.
- `EllipticLegendreCharacterInterfaces:LG.0/scaled-invariants` — Scaled Legendre discriminant.
- `EllipticLegendreCharacterInterfaces:LG.0/parameters-from-root-orderings` — Root-ordering cross-ratios.
- `EllipticLegendreCharacterInterfaces:LG.0/split-normalization` — Legendre normalization of a split cubic.
- `EllipticLegendreCharacterInterfaces:LG.0/full-two-torsion-normalization` — Normalization from full rational two-torsion.
- `EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion` — The three labelled two-torsion points.
- `EllipticLegendreCharacterInterfaces:LG.0/scaled-legendre-twist-identity` — The native scalar-twist identity.
- `EllipticLegendreCharacterInterfaces:LG.0/legendre-two-torsion-exhausts` — Exhaustion of Legendre two-torsion.

### Imported LG.1

- `EllipticLegendreCharacterInterfaces:LG.1/legendre-j-valuation` — Nonintegral Legendre parameters force nonintegral j.
- `EllipticLegendreCharacterInterfaces:LG.1/good-prime-units` — Parameters at good odd primes.
- `EllipticLegendreCharacterInterfaces:LG.1/legendre-good-model` — Nonsingular reduction of the unit Legendre model.
- `EllipticLegendreCharacterInterfaces:LG.1/character-odd-support` — Odd support of the attached primitive character.
- `EllipticLegendreCharacterInterfaces:LG.1/character-conductor-divides` — Odd character conductor divides the elliptic conductor.

### Imported LG.2

- `EllipticLegendreCharacterInterfaces:LG.2/split-cubic-crt` — The Legendre split-cubic CRT.
- `EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-equivalence` — Root readings of native squareclasses.
- `EllipticLegendreCharacterInterfaces:LG.2/descent-off-roots` — Native descent away from the roots.
- `EllipticLegendreCharacterInterfaces:LG.2/descent-at-root` — Native descent at the three two-torsion points.
- `EllipticLegendreCharacterInterfaces:LG.2/descent-product` — Product of the split descent coordinates.
- `EllipticLegendreCharacterInterfaces:LG.2/halving-square-criterion` — The Legendre halving criterion.
- `EllipticLegendreCharacterInterfaces:LG.2/split-cubic-evaluation` — Evaluation through the split-cubic CRT.
- `EllipticLegendreCharacterInterfaces:LG.2/split-squareclass-unit-reading` — Unit-class root readings.

### Imported LG.3

- `EllipticLegendreCharacterInterfaces:LG.3/two-by-four-subgroup` — Two-by-four torsion over prime fields.
- `EllipticLegendreCharacterInterfaces:LG.3/minus-one-order-four` — A half of the zero root on the minus-one model.
- `EllipticLegendreCharacterInterfaces:LG.3/minus-one-no-order-eight` — No order-eight point on the minus-one model.
- `EllipticLegendreCharacterInterfaces:LG.3/minus-one-point-count` — Exact two-adic order of the minus-one point count.
- `EllipticLegendreCharacterInterfaces:LG.3/minus-one-double` — Doubling the minus-one half.
- `EllipticLegendreCharacterInterfaces:LG.3/minus-one-order` — Order of the minus-one half.
- `EllipticLegendreCharacterInterfaces:LG.3/minus-one-first-descent` — First descent class of the minus-one half.

### Imported LG.4

- `EllipticLegendreCharacterInterfaces:LG.4/twist-halving-point` — The corrected order-four witness.
- `EllipticLegendreCharacterInterfaces:LG.4/twist-halving-double` — Doubling the corrected witness.
- `EllipticLegendreCharacterInterfaces:LG.4/twist-halving-order` — Exact order four of the corrected witness.
- `EllipticLegendreCharacterInterfaces:LG.4/twist-halving-descent` — The witness’s third native descent coordinate.

### Imported LG.5

- `EllipticLegendreCharacterInterfaces:LG.5/symmetric-cubic-trace-zero` — Trace zero for a symmetric split cubic.
- `EllipticLegendreCharacterInterfaces:LG.5/twist-euler-factor-specialization` — Legendre specialization of the twist-factor interface.

## Baseline and suppliers

Pins: Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti
**f790474821cf4256814db967cb154e7af3d0c369**.
The 16 baseline declarations in the packet were read at these commits.
The native Tau Ceti files used here were compared byte-for-byte with their
pinned source. This is a small import-boundary audit, not a replacement
for the owner's 56-declaration audit.

| Input | Existing supplier | Boundary checked |
| --- | --- | --- |
| Native coefficients and Δ | Mathlib `WeierstrassCurve`, b₂,b₄,b₆,b₈,Δ | Arbitrary commutative coefficient ring; Δ uses the native sign |
| Affine equation | Mathlib `WeierstrassCurve.Affine.Equation`, `equation_iff` | Polynomial equation, before the nonsingularity requirement for Point |
| Scalar twist | Tau Ceti `WeierstrassCurve.quadraticTwistOf` | D=t²−4n; scalar d uses (0,−d/4) |
| Descent and doubling kernel | Tau Ceti `WeierstrassCurve.Affine.μ`, `ker_μ_eq` | Elliptic characteristic-not-two normal form; unit squareclasses |
| Counts | Tau Ceti `WeierstrassCurve.pointCount`, `pointCount_def`, `pointCount_eq_card_point` | O included; comparison with native group requires ellipticity |
| Trace | Tau Ceti `WeierstrassCurve.frobeniusTrace`, `frobeniusTrace_def` | Finite field; integer q+1−count |
| Rational character | ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass | Primitive, squarefree odd conductor, parity support and conductor 1 |
| Elliptic conductor | ArithmeticGaloisRepresentations:R01.3/elliptic-exponent-and-parts | Actual Tate-module conductor; local independence and parent local comparison are required |
| Generic twist trace | RankZeroOneBSD:BSD.0/finite-field-twist-trace | All nonzero d in odd finite fields, including squares; exact native parameters |

The last two finer supplier nodes exist in the current packets. They refine
the owner's stage-level requests; they are planned targets, not pinned
library theorems. The conductor node imports its
R01.3/elliptic-local-independence theorem. The generic trace node counts
fibres and includes square scalars. No claim is made here that either
supplier has been implemented or that the owner's requests are discharged.

The reviewed `data/library-coverage.json` audit was read for the elliptic
torsion, finite-field and local layers, CA.1, R01.3 and BSD.0. It treats the
existing native twists, descent and point counts as inputs and leaves the
conductor and character bridges incomplete. Those are not duplicate
Legendre targets. The current read-only TauCetiRoadmap checkout was checked,
including the nine roadmaps newer than the atlas snapshot, and the current
Tau Ceti source was searched for Legendre and explicit halving interfaces.
The bounded search found no additional owner for these seven equation-level
targets. Current sources are distinct from the pins and are not substituted
for them. Nearby EllipticCurves and ModularCurves README and Suggested files
were read to check the local/group and moduli boundaries.

## Remaining work belongs to the owner

The owner keeps four recorded gaps:

1. Its full native prototype was not compiled in the build available at its
   review. The shared build now compiles this alias's small examples. That
   does not check the owner's native normalization, CRT or quotient signatures.
2. The parent EllipticCurves Layer 4 must supply the exact minimal-model,
   Q_p-unit and reduction comparisons; R01.3 must supply actual conductor
   support and semistable exponents.
3. The generic BSD.0 twist comparison is required. Its present finer node
   supplies a mathematical statement for the request, not an implementation.
4. The native CA.1 squareclass-character and actual elliptic conductor
   declarations must exist before the owner can state those signatures
   on their intended carriers. No substitute proposition is introduced here.

The owner's three supplier requests remain: parent Layer 4 for integral j
at a good minimal model, the unit-discriminant criterion and rational-to-local
unit transport; R01.3 for bad-prime support of the actual elliptic conductor
and exponent one at odd semistable primes; BSD.0 for the native good-prime
quadratic-twist trace/Euler-factor comparison including square scalars.
They are referenced in `inheritedObligations`, with their original consumers.
There are no new alias requests and no new mathematical gaps to assign.

Within the owner, LG.0 retains native normalization refinement; LG.1 retains
the local, character and conductor comparisons; LG.2 retains native CRT and
quotient elaboration and descent compatibility; LG.3 retains halving and the
finite-abelian cardinality proof; LG.4 retains the corrected native doubling
proof and descent compatibility; LG.5 retains direct character-sum counting
and the BSD.0 specialization. None of these layers is closed by this index.

## Merger and validation record

Keep EllipticLegendreCharacterInterfaces as the single owner with its node
identifiers unchanged. Map EllipticCurvesPartII:LG.n to that owner's LG.n
for n=0,…,5, route the duplicate design metadata there, and retire the four
alias publication files when the maintainer applies the merger. Check inbound
references at application time. This index supplies no declarations to move.
The merger is proposed, not applied; no other packet or roadmap is edited.

The [suggested file](../suggested/EllipticCurvesPartII.lean) contains only
anonymous acceptance examples on existing carriers, plus a local prime
instance. Its examples elaborate cleanly with `lean-check` at the pins.
They check native discriminants, the exact twist scalar, repeated labels,
minus-one coordinates, the corrected F₅ point, the failing printed pair and
the native integer trace convention. No new theory is developed there,
and the file does not certify the owner's full suggested file.

Independent arithmetic regressions checked root-ordering labels, rational
j-valuation cases, explicit eight-element subgroups, the exact minus-one
2-primary count, corrected halving tuples and trace comparisons over small
prime fields. These are evidence for conventions and counterexamples, not
proofs of the general planned theorems. Details and counts are in the handoff.

## Independent review

[REV-DESIGN-EllipticCurvesPartII](../reviews/REV-DESIGN-EllipticCurvesPartII.md)
accepted this import index on 2026-10-19. The review independently checked
the seven source mappings, all 37 imported statements and proof routes,
the 16 pinned baseline declarations, all eight definition contracts and
their 33 API items and 27 tests, and the 19 imported planets. No mathematical
correction or new declaration was needed. The existing coordinate finding
was confirmed at BS20, proof of Lemma 6.6, p.371; it remains owned by the
canonical plan.

The suggested file passed `lean-check` with no errors or warnings. Fresh
finite arithmetic checks covered the halving criterion at 12,876 affine
points, 616 corrected local halving tuples, and 4,160 twist-trace cases,
including square scalars. These checks do not establish the general
theorems or the owner's native prototype. The
[review handoff](../handoff/REV-DESIGN-EllipticCurvesPartII.md) records the
other regression counts and the remaining work. All four owner gaps and
three supplier requests remain, and the merger is still a maintainer action.

## Sources and provenance

BS20: Michael A. Bennett and Samir Siksek,
*A conjecture of Erdős, supersingular primes and short character sums*,
Annals of Mathematics 191 (2020), no. 2, 355–392,
[DOI 10.4007/annals.2020.191.2.2](https://annals.math.princeton.edu/2020/191-2/p02).
The [publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf)
was read on 2026-10-19 at pp.365–372; SHA-256
`3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`.
The per-target locators above distinguish source theorems from the owner's
native adapters and its alternative valuation proof. No source passage is
reproduced. The coordinate correction is an existing confirmed finding;
this job adds no erratum claim and performs no fresh correction search.

The route and seven item IDs come from
[PAPER-BENNETT-SIKSEK-20](../papers/PAPER-BENNETT-SIKSEK-20.result.json).
The canonical plan was submitted in [#1692](https://github.com/CBirkbeck/tauceti-explorer/issues/1692)
and [PR #6151](https://github.com/CBirkbeck/tauceti-explorer/pull/6151),
and accepted in independent review [#1721](https://github.com/CBirkbeck/tauceti-explorer/issues/1721),
[PR #6155](https://github.com/CBirkbeck/tauceti-explorer/pull/6155).
Its [accepted review](../reviews/REV-DESIGN-EllipticLegendreCharacterInterfaces.md)
was read; acceptance of that plan does not mean its mathematics is formalized.
The already accepted import-only
[EllipticCurveModularityPartII](EllipticCurveModularityPartII.md) provides
the corresponding ownership-reconciliation precedent.
