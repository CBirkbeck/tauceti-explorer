# Scheme, stack, cohomology and intersection foundations — SF.5

SF.5 constructs dimension-graded Chow groups on the existing cycle carrier, then builds the intersection operations needed for Chern classes, projective Grothendieck–Riemann–Roch, surface Riemann–Roch and the Hodge index theorem. The surface form gives the Weil bound through graphs of every power of Frobenius. Two further routes provide stack cycle groups with their coefficient restrictions, and Keel's criterion for semiampleness in positive characteristic. Arithmetic-surface intersection theory enters through the existing Stable Reduction roadmap.

The scope is exactly `SchemeAndStackFoundations:SF.5`. The packet is a complete target-level planning pass; the stage has coverage **planned**, with the precise gaps and supplier requests recorded below. Every proposed implementation is **unchecked**. The [packet](../packets/SchemeAndStackFoundations--SF.5.json) records machine-readable dependencies and source versions; the [suggested file](../suggested/SchemeAndStackFoundations--SF.5.lean) gives elaborated proposed signatures and examples. This document specifies the mathematics, including the hypotheses that a signature cannot yet express.

## Conventions and domains

Write CH_d(X) for dimension-graded Chow homology and CH^i(X)=CH_(n−i)(X) only when X is smooth of pure dimension n. General Chow homology uses a locally Noetherian universally catenary base S equipped with an integer dimension function. On X locally of finite type over S, use the induced residue-transcendence-degree function. Restriction to an open keeps its inherited values. Cycles and generating families of rational relations have locally finite support; a finite sum model does not cover this scope.

The underlying cycle is Mathlib's `AlgebraicGeometry.AlgebraicCycle X ℤ`. A graded cycle is its subgroup supported on points of the chosen dimension. Proper pushforward is a restriction and quotient descent of the existing weighted cycle map. It is not a new raw pushforward. Coherent and invertible sheaves use the native module category and Tau Ceti's invertible-sheaf subcategory.

Projectivization uses the quotient convention P(E)=Proj(Sym E), with π*E→O(1). A source using lines in E instead gives the same space by replacing E with E∨. Complete a normal bundle by P(N∨⊕O) in the quotient convention. A flag bundle has a filtration with line quotients; it need not make E a direct sum of lines.

For a regular immersion of codimension c, its normal cone is a rank-c normal bundle and refined Gysin lowers dimension by c. Regularity belongs to the original immersion. Its arbitrary base change can have excess and need not remain regular. The excess formula still lands in grade d−c. Chern classes are operators on homology before they become classes in a smooth intersection ring.

The open normal deformation removes the strict transform of the zero fibre of the blowup. Its parameter is Cartier, its special fibre is the normal cone and its restriction over G_m is X×G_m. For an empty centre the deformation is X×G_m. Over a field its parameter map to A¹ is flat. No general flatness claim is made about the blowup map to X×A¹.

| Route | Stated domain | Coefficients and boundary |
| --- | --- | --- |
| Chow homology, first Chern and refined Gysin | The dimension base just specified; proper maps, pure-dimensional flat maps, or original regular immersions as appropriate | Integral; the locally finite relation subgroup is essential |
| Intersection ring and local multiplicities | Smooth separated pure-dimensional schemes for the diagonal product; the read local proper-intersection comparison is in the algebraically closed variety setting | Integral; local multiplicity is the alternating Tor length, with ordinary length only under its Cohen–Macaulay reduction |
| Projective GRR | Projective morphism between smooth quasiprojective varieties over an algebraically closed field, in any characteristic | Rational Chow; a scheme theorem does not supply nodal-family or stack GRR |
| Surface RR, Hodge and graphs | Smooth projective integral surface over an algebraically closed field; geometric base change of the finite-field curve product | Integral pairings; the ample-orthogonality inequality precedes a separate numerical-quotient signature gap |
| Stack cycles and DM intersections | Finite-type Artin/DM stacks with the source's quotient-stratification and representability hypotheses | Integral Kresch theory; naive DM comparison and unrestricted proper DM degree require rational coefficients |
| Keel semiampleness | Projective scheme over a field of characteristic p>0 and a nef line bundle | No smoothness or bigness hypothesis on the main criterion; the exceptional locus has its reduced structure |

## Ownership and inputs

SF.5 imports curve divisors, line-bundle operations and curve Riemann–Roch through `SchemeAndStackFoundations:SF.3`, which builds on the existing Jacobian Challenge layers. Smooth proper coherent duality has exactly one owner: `SchemeAndStackFoundations:key/coherent-duality`, with the existing `SchemeAndStackFoundations:SF.2/smooth-proper` and `SchemeAndStackFoundations:SF.2/serre-proper` specializations. These supply the surface H²/H⁰ comparison rather than a second duality construction here.

The upstream tier order puts this roadmap below Algebraic Moduli for Arithmetic Geometry. Consequently the general projective and flag bundles, O(1), and positivity definitions needed here belong to SF.5; relative Proj remains an SF.0 input. `AlgebraicModuliForArithmeticGeometry:R09.1` consumes those definitions and retains its lattice, Grassmannian and arithmetic-moduli work. Foundational Koszul complexes are requested from SF.0, adopting the exterior-power design already identified in Derived de Rham; scheme-site stack carriers and quotient spaces are requested from SF.1. Neither higher roadmap is an SF.5 prerequisite.

Retain `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces` for blowups and the arithmetic pairing comparison. Delete the blanket SF.4 input and the forwarded Néron-model, abelian semistable reduction and Stable Reduction Layers 7–9 inputs described by RT-AREA-algebraicgeometry/15. Keel uses precisely requested contraction, formal-functions and conductor facts; it does not restore those unrelated edges.

The principal consumers are modular-curve divisor degrees (`ModularCurves:MC.0`), the surface route in `WeilConjectures:WC.5`, cycle and Chern operations in `SchemeKTheory:S.4` and `SchemeKTheory:S.7`, determinant positivity in `GeometricSatakeWitt:GS.0`, intersections in `GenericDoublePoint:GI.3`, and the determinant and positivity routes in `StableReductionPartII:MC.4` and `StableReductionPartII:MC.5`. The Néron-model direction consumes the arithmetic comparison supplied here; it does not supply general Chow theory.

## Existing library interface

The reviewed audit and the source statements were checked at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The following declarations are baseline citations rather than new nodes. The cycle map's quasi-compactness and weight-match convention, the finite-support restriction of native Weil divisors, and the finite-cutoff interpretation of the Euler characteristic are material boundaries.

| Baseline declaration | Supplies | Boundary verified at the pins |
| --- | --- | --- |
| mathlib:AlgebraicGeometry.AlgebraicCycle | Locally finitely supported coefficient functions on the points of an existing Scheme. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Requires Zero R; the generic point convention identifies integral closed subspaces. No grading or rational equivalence is built into this carrier. |
| mathlib:AlgebraicGeometry.AlgebraicCycle.map | The weighted raw cycle pushforward for a quasi-compact morphism. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Requires Semiring R, QuasiCompact f and decidable equality on the weight type; coefficient is residue degree when the two weights agree and zero otherwise. Restriction and quotient descent are new work. |
| mathlib:AlgebraicGeometry.AlgebraicCycle.mapCoeff | The weight-match and residue-degree coefficient used by the existing map. | Statement and ambient parameters read at the recorded pins on 2026-10-09. It is a natural number. For homogeneous input, equality of source and image dimensions is the exact nonvanishing condition. |
| mathlib:AlgebraicGeometry.AlgebraicCycle.map_id | Identity law for the native weighted cycle map. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Uses one common weight function; it does not supply composition or descent. |
| mathlib:Function.locallyFinsuppWithin.single | One-point locally finite support coefficient function. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Requires DecidableEq X and Zero Y. Supplies cycle generators without another free-cycle carrier. |
| mathlib:AlgebraicGeometry.Scheme.Modules | The native abelian category of structure-sheaf modules on a Scheme. | Statement and ambient parameters read at the recorded pins on 2026-10-09. This includes all module sheaves, not only coherent or finite locally free ones. |
| mathlib:AlgebraicGeometry.Scheme.Modules.pullback | Pullback functor on native module sheaves. | Statement and ambient parameters read at the recorded pins on 2026-10-09. For f:X→Y its source is Y.Modules and target X.Modules. It is not Chow pullback. |
| tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf | The full subcategory of native module sheaves that are locally free of rank one. | Statement and ambient parameters read at the recorded pins on 2026-10-09. The file explicitly leaves tensor and Picard construction to the Jacobian lane. Reuse its objects; request that lane for tensor powers and pullback. |
| tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial | The globally free rank-one invertible sheaf. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Its underlying module is the native free sheaf on PUnit. |
| tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toAlgebraicCycle | The additive inclusion of native scheme Weil divisors into native algebraic cycles. | Statement and ambient parameters read at the recorded pins on 2026-10-09. It has finite support on coheight-one points, without requiring a new cycle carrier. |
| tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFiniteCodimensionOneCycles | Additive equivalence between native scheme Weil divisors and finite-support codimension-one cycles. | Statement and ambient parameters read at the recorded pins on 2026-10-09. This finite-support codimension grading is not the locally finite dimension grading over a non-field base. |
| tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme | Native orders of nonzero rational functions and their finite support on a Noetherian integral scheme. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Requires IsIntegral and IsNoetherian. It does not cover a non-quasi-compact locally Noetherian integral scheme. |
| tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.principalDivisor | Native finitely supported principal divisor from an order system. | Statement and ambient parameters read at the recorded pins on 2026-10-09. The coefficients are the order homomorphisms; multiplication of functions becomes addition. |
| tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ClassGroup | The native Weil-divisor quotient by the image of principal divisors. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Only the abstract divisor-class quotient is provided, not arbitrary-dimensional Chow groups or the scheme Picard comparison. |
| tauceti:AlgebraicGeometry.Scheme.Modules.eulerCharBelow | The native alternating sum of cohomology finranks below a cutoff. | Statement and ambient parameters read at the recorded pins on 2026-10-09. X is over Spec k with k a field. True Euler characteristic requires finite-dimensional cohomology and vanishing at and above the cutoff; infinite-dimensional finrank has a junk value. |
| mathlib:AlgebraicGeometry.SmoothOfRelativeDimension | The native affine-local smoothness condition of specified natural relative dimension. | Statement and ambient parameters read at the recorded pins on 2026-10-09. Its smooth lemma implies Smooth; it has base-change and composition results. It does not express regular immersions or arbitrary lci morphisms. |

Read native cycle, module, line, principal-divisor and Euler-characteristic files; searched algebraic-geometry namespaces for Chow, rational equivalence, Gysin, Chern, Todd, surface RR and Hodge. No corresponding implementation found in the pinned search. Open Mathlib PR searches for Chow/Gysin/Chern returned no relevant algebraic-geometric implementation; public Zulip archive queries supplied no settled competing design. These are scoped search observations, not a claim about all external work.

## Dimension-graded Chow homology

The generators retain generic scheme lengths, including nilpotents, while proper pushforward retains residue degrees. Rational relations must allow locally finite families on non-quasi-compact schemes. Localization is right exact; the closed-subscheme map need not be injective. Flat pullback has an explicit pure relative dimension and therefore a fixed grade shift. These choices make the generic open of a one-dimensional base and finite flat nonreduced fibres usable without changing carriers.

<a id="dimension-function"></a>

### Dimension functions

**Definition** · `SchemeAndStackFoundations:SF.5/dimension-function` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.DimensionFunction`.

Fix a locally Noetherian universally catenary base S with an integer dimension function δS. For X locally of finite type over S set δX(x)=δS(f(x))+trdeg(κ(x)/κ(f(x))). Along an immediate specialization the value falls by one. Dimension grades always use this induced function, including on open subschemes; they are not silently replaced by Krull dimension of the open scheme.

**Hypotheses.** Situation 42.7.1: S locally Noetherian and universally catenary, with a dimension function; X locally of finite type over S.

**Construction or proof.**

1. Use the dimension-function specialization rule and the transcendence-degree tower formula. Restriction to opens retains the values of the ambient function.

**Direct prerequisites.** `mathlib:AlgebraicGeometry.AlgebraicCycle`; `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Situation 42.7.1, tag 02QL, p. 15. Supplies the ambient base and induced dimension function; the one-dimensional base example fixes the generic-point shift.

**Uses that determine the interface.**

- SchemeKTheory:S.4 coniveau cycles and StableReduction Layer 4: The dimension grading must survive passage to the generic open of a one-dimensional base.
- Stacks 42.14 and 42.19: Flat relative dimension and rational boundaries shift these integer grades.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.shift_value | simp | Adding a constant n adds n to every dimension value. |
| TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.ext | extensionality | Dimension functions with the same value at every point are equal. |
| TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.cover_value | data | At a cover x immediately specializing from y, δ(y)=δ(x)+1. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.test_shift_twice | computation | Shifting by 2 and then by −1 shifts the original value by 1. |
| TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.test_dvr_generic_shift | non-example | For a DVR base with δ(closed)=0 the generic value is 1; the inherited grade on its generic open is 1 even though that open has Krull dimension 0. |
| TauCeti.AlgebraicGeometry.Intersection.DimensionFunction.test_shift_zero | degenerate | Zero shift preserves the entire dimension function. |

**Suggested-signature boundary.** The prototype records the exact cover rule. The universally catenary base, the scheme-level transcendence-degree construction and induced-function proof are an SF.0 request; no unspecified dimension axiom is substituted.

<a id="graded-cycle"></a>

### Homogeneous algebraic cycles

**Definition** · `SchemeAndStackFoundations:SF.5/graded-cycle` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.cycleSubgroup`.

Z_d(X) is the additive subgroup of the native integer AlgebraicCycle X ℤ whose coefficient is zero at every x with δX(x)≠d. It inherits local finiteness from the native carrier. A generator is the unit coefficient at the generic point of an integral closed subscheme with δ-dimension d.

**Hypotheses.** The base and induced dimension function of Situation 42.7.1.

**Construction or proof.**

1. Cut out the native additive group by vanishing off the dimension-d locus. The zero, addition and negation laws hold pointwise. Use native locallyFinsupp single for a generator.

**Direct prerequisites.** [Dimension functions](#dimension-function) (`SchemeAndStackFoundations:SF.5/dimension-function`); `mathlib:AlgebraicGeometry.AlgebraicCycle`; `mathlib:Function.locallyFinsuppWithin.single`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.8.1, tag 02QR, p. 17. Defines locally finite integral combinations in a fixed dimension; the native carrier supplies the underlying local-finiteness data.

**Uses that determine the interface.**

- MotivesAndAlgebraicCycles:MC.0 and SchemeKTheory:S.4: These consumers require a graded cycle group without duplicating the native locally finite carrier.
- Stacks 42.9, 42.12 and 42.14: Fundamental cycles and geometric push/pull operations use the grading.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.Cycle.coe_injective | coercion | The inclusion into the native AlgebraicCycle is injective. |
| TauCeti.AlgebraicGeometry.Intersection.Cycle.coeff_single | simp | The coefficient of n[x] at x is n. |
| TauCeti.AlgebraicGeometry.Intersection.Cycle.ext | extensionality | Homogeneous cycles are equal exactly when all point coefficients agree. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.Cycle.test_coefficient_two | computation | The generator 2[x] has coefficient 2, so multiplicities survive the subtype. |
| TauCeti.AlgebraicGeometry.Intersection.Cycle.test_wrong_grade_zero | non-example | A d-cycle has coefficient zero at a point of dimension d+1. |
| TauCeti.AlgebraicGeometry.Intersection.Cycle.test_native_weil_coefficient | compatibility | The coheight-one coefficient of a native scheme Weil divisor is unchanged by the existing cycle inclusion. |

**Suggested-signature boundary.** The source hypotheses above govern the declaration.

<a id="fundamental-cycle"></a>

### Fundamental cycles with generic lengths

**Construction** · `SchemeAndStackFoundations:SF.5/fundamental-cycle` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.fundamental`.

For a closed subscheme Z⊂X with δ-dimension at most d, its d-dimensional fundamental cycle has coefficient length(O_Z,η) at a generic point η of a d-dimensional irreducible component and zero elsewhere. Nilpotents contribute generic lengths. Lower-dimensional components and embedded associated points do not contribute to this top-dimensional cycle.

**Hypotheses.** Z is locally Noetherian and closed in X; δ-dim Z≤d.

**Construction or proof.**

1. Take generic points of d-dimensional components, attach the lengths of their Artinian local rings and assemble the native locally finite support function.

**Direct prerequisites.** [Homogeneous algebraic cycles](#graded-cycle) (`SchemeAndStackFoundations:SF.5/graded-cycle`); `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.9.2, tag 02QU, p. 18. The top-dimensional fundamental cycle uses generic local lengths and the dimension bound.

**Uses that determine the interface.**

- Stacks 42.14 and 42.54: Flat inverse images and normal cone specialization must retain generic multiplicities.
- GenericDoublePointInterpolation:GI.3: Nonreduced plane curve intersections are counted by their scheme lengths.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.fundamental_coefficient | data | The coefficient at a top-dimensional generic point is its generic Artinian local length. |
| TauCeti.AlgebraicGeometry.Intersection.fundamental_reduced_integral | characterisation | An integral closed subscheme of δ-dimension d has fundamental cycle equal to its unit generic-point generator. |
| TauCeti.AlgebraicGeometry.Intersection.fundamental_open_restrict | compatibility | Restriction to an open subscheme preserves all coefficients at points of that open. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.fundamental_test_dual_point | computation | Spec(ℚ[ε]/ε²) has zero-dimensional fundamental coefficient 2. |
| TauCeti.AlgebraicGeometry.Intersection.fundamental_test_reduced_point | computation | Spec ℚ has zero-dimensional fundamental coefficient 1. |
| TauCeti.AlgebraicGeometry.Intersection.fundamental_test_empty | degenerate | The fundamental cycle of the empty scheme is zero in every grade. |

**Suggested-signature boundary.** The δ-dimension bound and locally Noetherian local-length finiteness are stated in the packet; their predicate-level signatures are not yet available. The auxiliary genericLength/restriction/base-change functions below are explicit SF.0 supplier prototypes, not new subscheme carriers.

<a id="coherent-cycle"></a>

### Cycles of coherent sheaves

**Construction** · `SchemeAndStackFoundations:SF.5/coherent-cycle` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.coherentCycle`.

For a coherent O_X-module M with δ-dimension of its support at most d, form [M]_d by length(M_η) at the d-dimensional generic support points. On short exact sequences with this common support bound the resulting cycle is additive, and [O_Z]_d equals the fundamental cycle of Z.

**Hypotheses.** X locally Noetherian; M coherent; δ-dim Supp M≤d.

**Construction or proof.**

1. Use native module sheaves, take generic stalk lengths and assemble a homogeneous cycle. Additivity of finite length gives the exact-sequence law.

**Direct prerequisites.** [Fundamental cycles with generic lengths](#fundamental-cycle) (`SchemeAndStackFoundations:SF.5/fundamental-cycle`); `mathlib:AlgebraicGeometry.Scheme.Modules`; `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.10.2 and Lemma 42.10.4, tags 02QX and 02QZ, pp. 19–20. Defines the sheaf cycle and proves exact-sequence additivity under the support bound.

**Uses that determine the interface.**

- Stacks 43.14 and 43.16: Tor sheaves contribute their generic lengths to the intersection cycle.
- SchemeKTheory:S.4: The associated coherent cycle supplies the coniveau comparison, without a second G-theory construction.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.coherentCycle_exact | compatibility | A short exact sequence with common support bound yields [M₂]_d=[M₁]_d+[M₃]_d. |
| TauCeti.AlgebraicGeometry.Intersection.coherentCycle_structure | compatibility | The pushforward structure module of a closed subscheme gives its fundamental cycle. |
| TauCeti.AlgebraicGeometry.Intersection.coherentCycle_iso | functoriality | An isomorphism of coherent modules preserves its cycle. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.coherentCycle_test_free_rank_two | computation | A free rank-two module on a reduced point has coefficient 2. |
| TauCeti.AlgebraicGeometry.Intersection.coherentCycle_test_zero | degenerate | The zero module has zero cycle. |
| TauCeti.AlgebraicGeometry.Intersection.coherentCycle_test_dual_number_residue | non-example | The residue module on the doubled point has length 1, whereas the structure module has length 2. |

**Suggested-signature boundary.** Coherence and the common support dimension bounds are omitted only from the Lean signatures, because the pinned sheaf predicates are incomplete; the packet gives the exact domain.

<a id="locally-finite-principal-boundary"></a>

### Locally finite principal boundaries

**Construction** · `SchemeAndStackFoundations:SF.5/locally-finite-principal-boundary` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.principalBoundary`.

For an integral closed W⊂X of δ-dimension d+1 and u∈κ(W)×, extend the existing Noetherian principal-divisor construction across Noetherian opens of W. Its locally finite order cycle pushes along W→X to a d-cycle ∂_W(u). The local order is length(A/aA)−length(A/bA) for u=a/b in a one-dimensional local domain, so normality is not required.

**Hypotheses.** W integral and locally Noetherian, closed in X; the induced dimension function has generic value d+1.

**Construction or proof.**

1. On Noetherian affine opens use the native ofScheme order system and principalDivisor. The local length definition agrees on overlaps. Local finiteness, not global finite support, glues the orders; include the closed immersion with the existing native raw map.

**Direct prerequisites.** [Homogeneous algebraic cycles](#graded-cycle) (`SchemeAndStackFoundations:SF.5/graded-cycle`); `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme`; `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.principalDivisor`; `mathlib:AlgebraicGeometry.AlgebraicCycle.map`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definitions 42.17.1 and 42.19.1, tags 02RO and 02RW, pp. 27 and 30. Orders on nonnormal integral schemes and locally finite principal relations give the needed extension of the finite native lane.

**Uses that determine the interface.**

- Stacks 42.19–20 and SchemeKTheory:S.4: Principal boundary cycles generate rational equivalence and descend proper pushforward.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.principalBoundary_add | relation | Multiplication of rational functions adds principal boundary cycles. |
| TauCeti.AlgebraicGeometry.Intersection.principalBoundary_native | compatibility | On a Noetherian integral W the boundary is the native principal divisor, included in cycles and pushed to X with the induced dimensions. |
| TauCeti.AlgebraicGeometry.Intersection.principalBoundary_neg | simp | The boundary of the inverse function is the negative boundary. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.principalBoundary_test_unit | degenerate | The unit rational function has zero boundary. |
| TauCeti.AlgebraicGeometry.Intersection.principalBoundary_test_inverse_cancel | computation | A function and its inverse cancel before quotienting by rational equivalence. |
| TauCeti.AlgebraicGeometry.Intersection.principalBoundary_test_p1_coordinate | computation | The standard coordinate on P¹ has boundary [0]−[∞], with both coefficients 1. |

**Suggested-signature boundary.** The local Noetherian and δ-dimension hypotheses are absent only from the prototype. P¹, its coordinate and marked point cycles are exact upstream Jacobian Layer A fixtures.

<a id="rational-equivalence"></a>

### Rational equivalence

**Definition** · `SchemeAndStackFoundations:SF.5/rational-equivalence` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.rationalRelations`.

Rat_d(X)⊂Z_d(X) consists of sums of principal boundary cycles from a locally finite family of integral closed (d+1)-dimensional W⊂X with a rational unit on each W. Local finiteness refers to the family of closed supports. In the Noetherian quasi-compact case this is the subgroup generated by finite principal sums; for a non-quasi-compact scheme finite generation alone is too small.

**Hypotheses.** Situation 42.7.1; local finiteness of the closed family in each relation.

**Construction or proof.**

1. Each locally finite family gives a native locally finite coefficient sum. Unions of two such families and inversion make the set an additive subgroup. On a quasi-compact Noetherian scheme the family is finite.

**Direct prerequisites.** [Locally finite principal boundaries](#locally-finite-principal-boundary) (`SchemeAndStackFoundations:SF.5/locally-finite-principal-boundary`); [Homogeneous algebraic cycles](#graded-cycle) (`SchemeAndStackFoundations:SF.5/graded-cycle`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.19.1 and Example 42.19.5, tag 02RW, pp. 30–32. Locally finite principal sums define rational equivalence, and the infinite curve example prevents a finite-only definition.

**Uses that determine the interface.**

- MotivesAndAlgebraicCycles:MC.0 and SchemeKTheory:S.4: The quotient must agree with ordinary finite cycles on varieties and the locally finite base theory.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.rationalRelations_principal | constructor | Every individual principal boundary lies in Rat_d(X). |
| TauCeti.AlgebraicGeometry.Intersection.rationalRelations_finite_sum | structure | A finite sum of principal boundary relations is again a relation. |
| TauCeti.AlgebraicGeometry.Intersection.rationalRelations_noetherian_generators | characterisation | For Noetherian X the relation subgroup is the additive closure of the set of individual principal boundaries. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.rationalRelations_test_p1 | computation | On P¹, [0]−[∞] is a rational relation. |
| TauCeti.AlgebraicGeometry.Intersection.rationalRelations_test_zero | degenerate | The zero cycle is a relation, with the empty family. |
| TauCeti.AlgebraicGeometry.Intersection.rationalRelations_test_point_nonzero | non-example | A unit point on Spec ℚ is not a relation: there are no one-dimensional closed supports. |

**Suggested-signature boundary.** The source hypotheses above govern the declaration.

<a id="chow-group"></a>

### Chow groups

**Definition** · `SchemeAndStackFoundations:SF.5/chow-group` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.Chow`.

CH_d(X;ℤ)=Z_d(X)/Rat_d(X) as the native additive quotient. Rational coefficients mean ℚ⊗_ℤ CH_d(X;ℤ), not a change to the underlying integer relation. The class map is additive and universal for additive maps killing locally finite principal relations.

**Hypotheses.** Situation 42.7.1.

**Construction or proof.**

1. Apply the native additive quotient machinery to rationalRelations. Define scalar extension by the native tensor product.

**Direct prerequisites.** [Rational equivalence](#rational-equivalence) (`SchemeAndStackFoundations:SF.5/rational-equivalence`); `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ClassGroup`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.19.1, tag 02RW, p. 30. Chow homology is the quotient by the specified relation, with its integer grading.

**Uses that determine the interface.**

- MotivesAndAlgebraicCycles:MC.0, SchemeKTheory:S.7 and WeilConjectures:WC.5:surface-alternative: Integral Chow operations underlie correspondences and surface intersections; characteristic classes in GRR require scalar extension to ℚ.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.cycleClass_surjective | universal-property | Every Chow class is represented by a homogeneous cycle. |
| TauCeti.AlgebraicGeometry.Intersection.cycleClass_eq_iff | characterisation | Two cycles have equal classes exactly when their difference is a rational relation. |
| TauCeti.AlgebraicGeometry.Intersection.Chow.lift_class | universal-property | The descended map of an additive cycle map φ killing Rat evaluates on [a] as φ(a). |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.Chow.test_p1_points | computation | The zero and infinity points of P¹ have the same Chow class. |
| TauCeti.AlgebraicGeometry.Intersection.Chow.test_principal_zero | degenerate | Every principal boundary becomes zero. |
| TauCeti.AlgebraicGeometry.Intersection.Chow.test_point_integer | characterisation | CH₀(Spec ℚ;ℤ) is additively isomorphic to ℤ, with the unit point mapping to 1. |

**Suggested-signature boundary.** The source hypotheses above govern the declaration.

<a id="proper-relations"></a>

### Proper pushforward preserves rational equivalence

**Theorem** · `SchemeAndStackFoundations:SF.5/proper-relations` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.proper_relations`.

For a proper S-morphism f:X→Y, the existing dimension-weighted native cycle map carries Rat_d(X) into Rat_d(Y). For W generically finite over its image use the norm of a rational unit; if its image loses one dimension use degree zero of a principal divisor on the proper generic curve; greater dimension loss gives zero.

**Hypotheses.** f proper over S; the same base induces δX and δY.

**Construction or proof.**

1. Separate the image dimensions. Apply the order-of-norm identity in the equal-dimensional case, the proper-curve principal-degree identity in relative dimension one, and the native weight cutoff for all remaining cases. Properness keeps images of locally finite closed families locally finite.

**Direct prerequisites.** [Rational equivalence](#rational-equivalence) (`SchemeAndStackFoundations:SF.5/rational-equivalence`); `mathlib:AlgebraicGeometry.AlgebraicCycle.map`; `SchemeAndStackFoundations:SF.3`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.18.1, 42.18.3 and 42.20.3, tags 02RT, 02RU and 02S2, pp. 27–30 and 33–34. Provides the norm and generic-curve cases in the proper descent proof.

**Acceptance.**

- For a finite map of integral curves the norm identity holds with inseparable residue degrees as well as separable ones.

**Suggested-signature boundary.** Compatibility of the two induced dimension functions is omitted from the prototype; arbitrary unrelated weight functions do not satisfy the theorem.

<a id="chow-proper-push"></a>

### Proper pushforward on Chow groups

**Construction** · `SchemeAndStackFoundations:SF.5/chow-proper-push` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.properPush`.

Restrict the native weighted AlgebraicCycle.map for a proper S-map f to Z_d, then descend to f_*:CH_d(X;ℤ)→CH_d(Y;ℤ). On [W] the coefficient is [κ(W):κ(f(W))] when image dimension is d, and zero when dimension drops. No new raw cycle map is constructed.

**Hypotheses.** f proper over S; compatible induced dimension functions.

**Construction or proof.**

1. Homogeneity is preserved by the native weight match. Its pointwise linearity gives an additive homomorphism. Apply proper-relations to descend the quotient.

**Direct prerequisites.** [Proper pushforward preserves rational equivalence](#proper-relations) (`SchemeAndStackFoundations:SF.5/proper-relations`); [Chow groups](#chow-group) (`SchemeAndStackFoundations:SF.5/chow-group`); `mathlib:AlgebraicGeometry.AlgebraicCycle.map`; `mathlib:AlgebraicGeometry.AlgebraicCycle.map_id`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.12.1 and Lemma 42.20.3, tags 02R4 and 02S2, pp. 20–21 and 33–34. The new work is quotient descent of the weighted geometric pushforward.

**Uses that determine the interface.**

- MotivesAndAlgebraicCycles:MC.0 and Stacks 42.41: Graph correspondences and degree maps use proper pushforward of Chow classes.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.properPush_class | compatibility | Pushforward of a cycle class is the class of its existing native weighted cycle map. |
| TauCeti.AlgebraicGeometry.Intersection.properPush_id | functoriality | The identity proper pushforward is the identity homomorphism. |
| TauCeti.AlgebraicGeometry.Intersection.properPush_comp | functoriality | For proper f and g, (g∘f)_*=g_*∘f_* with common induced dimensions. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.properPush_test_degree_two | computation | A finite map with residue extension degree 2 sends a unit point to twice the image point. |
| TauCeti.AlgebraicGeometry.Intersection.properPush_test_dimension_drop | non-example | A positive-dimensional integral support contracted to a lower-dimensional image pushes to zero. |
| TauCeti.AlgebraicGeometry.Intersection.properPush_test_native_identity | compatibility | Identity descent preserves any cycle class, in agreement with native map_id. |

**Suggested-signature boundary.** The compatibility of induced dimensions and S-linearity is omitted only in the Lean forms.

<a id="flat-pullback"></a>

### Flat pullback

**Construction** · `SchemeAndStackFoundations:SF.5/flat-pullback` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.flatPull`.

For a flat S-map f:X→Y locally of finite type of constant relative dimension r, pull back a generator [W] to the (d+r)-dimensional fundamental cycle of X×Y W, with its generic lengths. This extends to locally finite cycles and descends to f*:CH_d(Y)→CH_(d+r)(X). A flat map with fibres of mixed dimension does not have this single graded pullback.

**Hypotheses.** f flat and locally of finite type, with every nonempty fibre pure of the same dimension r≥0.

**Construction or proof.**

1. Flatness preserves the generic support dimension and controls local finiteness. Generic lengths define the cycle pullback. The valuation and flat length calculation carries principal relations to principal relations.

**Direct prerequisites.** [Fundamental cycles with generic lengths](#fundamental-cycle) (`SchemeAndStackFoundations:SF.5/fundamental-cycle`); [Chow groups](#chow-group) (`SchemeAndStackFoundations:SF.5/chow-group`); `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.14.1 and Lemma 42.20.2, tags 02RB and 02S1, pp. 23–24 and 33. Defines the fundamental-cycle pullback and proves descent with relative pure dimension.

**Uses that determine the interface.**

- Stacks 42.36 and Edidin–Graham Definition–Proposition 1: Projective/vector bundle operations and mixed-quotient approximation use relative-dimension shifts.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.flatPull_fundamental | simp | Pullback of an integral support class is the fundamental class of its scheme-theoretic inverse image, including nonreduced multiplicity. |
| TauCeti.AlgebraicGeometry.Intersection.flatPull_id | functoriality | Flat pullback for the identity has relative dimension 0 and is the identity. |
| TauCeti.AlgebraicGeometry.Intersection.flatPull_comp | functoriality | Relative dimensions add in the composition law for flat pullback. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.flatPull_test_identity | degenerate | Relative dimension zero for the identity does not shift the grade. |
| TauCeti.AlgebraicGeometry.Intersection.flatPull_test_double_point | computation | Pulling back the unit point along Spec ℚ[ε]/ε²→Spec ℚ gives the doubled fundamental point, rather than its reduction. |
| TauCeti.AlgebraicGeometry.Intersection.flatPull_test_affine_line_shift | computation | The pullback of the unit point to A¹ is its one-dimensional fundamental class. |

**Suggested-signature boundary.** Locally finite type, constant relative pure dimension and compatibility of induced dimensions are omitted from the prototype; Flat alone is insufficient.

<a id="proper-flat-basechange"></a>

### Proper-flat base change

**Theorem** · `SchemeAndStackFoundations:SF.5/proper-flat-basechange` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.proper_flat_basechange`.

In a Cartesian square X′→X over Y′→Y with f:X→Y proper and g:Y′→Y flat of pure relative dimension r, g*f_*=f′_*g′* on CH_d(X), with common target CH_(d+r)(Y′).

**Hypotheses.** Cartesian square of S-morphisms; proper vertical map; flat horizontal map of constant pure relative dimension r; induced dimensions.

**Construction or proof.**

1. Check the identity on integral supports by the residue-degree/generic-length formula, then descend to Chow.

**Direct prerequisites.** [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`); [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.15.1, tag 02RG, p. 25. Residue-degree and generic-fibre-length comparison gives proper-flat base change.

**Acceptance.**

- The flat base change of the push of a rational point to its residue field has the expected residue-weighted fibre cycle.

**Suggested-signature boundary.** S-linearity, induced-dimension compatibility and pure relative dimension r are omitted.

<a id="finite-flat-degree"></a>

### Finite-flat push-pull degree

**Theorem** · `SchemeAndStackFoundations:SF.5/finite-flat-degree` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.finite_flat_push_pull`.

For a finite locally free S-morphism f:X→Y of constant rank n, f_*f*=n on CH_d(Y) in every grade, with the pure relative dimension zero pullback. Generic nonreduced lengths are part of n.

**Hypotheses.** Cartesian square over S; proper vertical map; flat horizontal map of relative pure dimension r. For the second assertion finite locally free rank n.

**Construction or proof.**

1. Check the fibre algebra length weighted by residue degrees is its vector-space rank n on every integral generator. Descend by the existing proper and flat relation compatibilities.

**Direct prerequisites.** [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`); [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.15.2, tag 02RH, p. 25. The finite-rank generic fibre length sum computes the push-pull coefficient.

**Acceptance.**

- For a rank-two finite flat algebra, the push-pull of a point is twice the point even when its fibre is nonreduced.

**Suggested-signature boundary.** Finite locally free constant rank n, S-linearity and compatible induced dimensions are omitted. Proper and flat alone do not give this rank-n formula.

<a id="chow-localization"></a>

### Localization for Chow homology

**Theorem** · `SchemeAndStackFoundations:SF.5/chow-localization` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.chow_localization`.

For a closed immersion i:Z→X with complementary open j:U→X, CH_d(Z)→CH_d(X)→CH_d(U)→0 is exact, using restricted ambient dimensions. The closed pushforward need not be injective.

**Hypotheses.** Closed/open complementary pair in Situation 42.7.1.

**Construction or proof.**

1. Restrict locally finite cycles to the open. Extend integral supports by closure and rational units by their function fields. The difference of two lifts is supported on Z, yielding the kernel description.

**Direct prerequisites.** [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`); [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`); [Rational equivalence](#rational-equivalence) (`SchemeAndStackFoundations:SF.5/rational-equivalence`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.19.3, tag 02RX, p. 31. Provides the right-exact sequence; it does not assert injectivity at the closed term.

**Acceptance.**

- For {0}⊂A¹ the point class pushes to zero in CH₀(A¹), so left injectivity fails.

**Suggested-signature boundary.** The complementary-image condition is omitted from the Lean signature; it is not implied by the two immersion classes.

<a id="affine-bundle-homotopy"></a>

### Affine bundle homotopy invariance

**Theorem** · `SchemeAndStackFoundations:SF.5/affine-bundle-homotopy` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.affine_bundle_homotopy`.

For a vector bundle, or a Zariski locally trivial affine-space bundle, p:E→X of constant relative rank r, flat pullback p*:CH_d(X)→CH_(d+r)(E) is an additive isomorphism. This is not asserted for every flat morphism.

**Hypotheses.** Zariski locally trivial affine-space bundle of constant rank r, over the same S.

**Construction or proof.**

1. Use the affine-line relation and Chow localization to establish the trivial bundle case; noetherian induction on a trivializing cover glues the assertion. The non-quasi-compact case is treated locally with locally finite cycles.

**Direct prerequisites.** [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`); [Localization for Chow homology](#chow-localization) (`SchemeAndStackFoundations:SF.5/chow-localization`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.32.1 and 42.36.3, tags 02TT and 02TY, pp. 58 and 72. Supplies affine bundle surjectivity and the vector bundle isomorphism used by specialization.

**Acceptance.**

- CH₀(A¹)=0 and CH₁(A¹)=ℤ over a field, so unshifted homotopy invariance is wrong.

**Suggested-signature boundary.** The affine-space bundle condition, its constant rank and induced dimensions are omitted from the prototype; arbitrary Flat p does not suffice.

## Chern operators and projective bundles

A rational section defines the first Chern operator modulo rational equivalence. Projection, commutation and flat compatibility are distinct theorem targets. Effective Cartier Gysin has both the proper-intersection divisor case and the contained-support normal-line case. The quotient projective bundle formula fixes the sign and index of O(1); its iterated flag construction gives an injective splitting-principle map and line quotients for defining higher Chern operators.

<a id="first-chern"></a>

### First Chern class operators

**Construction** · `SchemeAndStackFoundations:SF.5/first-chern` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.firstChern`.

For an invertible sheaf L on X, c₁(L)∩−:CH_d(X;ℤ)→CH_(d−1)(X;ℤ) sends an integral support W to the divisor of a nonzero rational section of L|W, pushed to X. Different rational sections differ by a principal divisor. The operator, unlike intersection of arbitrary Weil divisors on a singular scheme, is defined on every X in Situation 42.7.1.

**Hypotheses.** L is the existing invertible-sheaf object; the same dimension base as Chow.

**Construction or proof.**

1. Construct the rational-section divisor by local trivializations and glue the order coefficients. Principal boundaries remove the choice of rational section. The two-dimensional tame-boundary formula proves that this operation kills rational relations.

**Direct prerequisites.** [Chow groups](#chow-group) (`SchemeAndStackFoundations:SF.5/chow-group`); [Locally finite principal boundaries](#locally-finite-principal-boundary) (`SchemeAndStackFoundations:SF.5/locally-finite-principal-boundary`); `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`; `SchemeAndStackFoundations:SF.3`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definitions 42.24.1 and 42.25.1; Lemma 42.28.2, tags 02SJ, 02SO and 02TI, pp. 43–44 and 51. The section divisor gives the integral cap operator; the descent proof uses Lemma 42.27.1, p. 49.

**Uses that determine the interface.**

- GeometricSatakeWitt:GS.0 and StableReductionPartII:MC.4: Determinant bundles are tested for positivity using integral first Chern numbers.
- Stacks 42.36–38: The O(1) cap operator constructs all higher Chern operations.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.firstChern_tensor | relation | c₁(L⊗M)∩a=c₁(L)∩a+c₁(M)∩a. |
| TauCeti.AlgebraicGeometry.Intersection.firstChern_trivial | simp | The trivial invertible sheaf has zero first Chern operator. |
| TauCeti.AlgebraicGeometry.Intersection.firstChern_dual | compatibility | Dualizing a line bundle negates its first Chern operator. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.firstChern_test_p1_o1 | computation | c₁(O(1))∩[P¹] is the class of a single point. |
| TauCeti.AlgebraicGeometry.Intersection.firstChern_test_p1_o2 | computation | c₁(O(2))∩[P¹] is twice a point, detecting the tensor convention. |
| TauCeti.AlgebraicGeometry.Intersection.firstChern_test_trivial | degenerate | The trivial bundle kills every Chow class in every grade. |

**Suggested-signature boundary.** The source hypotheses above govern the declaration.

<a id="chern-projection"></a>

### Projection formula for first Chern operators

**Theorem** · `SchemeAndStackFoundations:SF.5/chern-projection` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.firstChern_projection`.

For a proper S-map f:X→Y and an invertible L on Y, f_*(c₁(f*L)∩a)=c₁(L)∩f_*a in CH_(d−1)(Y).

**Hypotheses.** Proper S-map; invertible sheaf on the target; compatible induced dimension functions.

**Construction or proof.**

1. Compare section-divisor orders using the proper norm formula on integral supports and descend to Chow.

**Direct prerequisites.** [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.26.4, tag 02SU, p. 47. Norms and section divisors give the proper projection formula.

**Acceptance.**

- On P¹×P¹ the two ruling line bundles have commuting product of degree 1.

**Suggested-signature boundary.** S-linearity and induced-dimension compatibility are omitted.

<a id="chern-commutation"></a>

### Commutation of first Chern operators

**Theorem** · `SchemeAndStackFoundations:SF.5/chern-commutation` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.firstChern_commute`.

For two invertible sheaves L,M in Situation 42.7.1, c₁(L)c₁(M)∩a=c₁(M)c₁(L)∩a in CH_(d−2)(X).

**Hypotheses.** L and M invertible; f proper or flat with pure relative dimension as stated; compatible induced dimensions.

**Construction or proof.**

1. Exchange the two section divisors on integral supports. The tame-symbol boundary makes the discrepancy a rational relation.

**Direct prerequisites.** [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.28.3, tag 02TJ, p. 51. The tame-boundary identity exchanges two first Chern operators modulo rational equivalence.

**Acceptance.**

- On P¹×P¹ the two ruling line bundles have commuting product of degree 1.

**Suggested-signature boundary.** The ambient dimension base is omitted. The two line objects are native invertible sheaves.

<a id="chern-flat"></a>

### Flat compatibility of first Chern operators

**Theorem** · `SchemeAndStackFoundations:SF.5/chern-flat` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.firstChern_flat`.

For a flat S-map f:X→Y of constant pure relative dimension r and a line L on Y, c₁(f*L)∩f*a=f*(c₁(L)∩a) in CH_(d+r−1)(X).

**Hypotheses.** L and M invertible; f proper or flat with pure relative dimension as stated; compatible induced dimensions.

**Construction or proof.**

1. Pull back local section equations and use the generic-length identity for flat inverse images. Pass to the relation quotient.

**Direct prerequisites.** [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.26.2, tag 02SS, p. 46. Flat inverse-image lengths and the rational-section divisor commute.

**Acceptance.**

- On P¹×P¹ the two ruling line bundles have commuting product of degree 1.

**Suggested-signature boundary.** S-linearity, dimension compatibility and relative pure dimension r are omitted.

<a id="cartier-gysin"></a>

### Gysin maps for Cartier divisors

**Construction** · `SchemeAndStackFoundations:SF.5/cartier-gysin` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.cartierGysin`.

For an effective Cartier divisor i:D→X with associated invertible sheaf O_X(D), define i!:CH_d(X)→CH_(d−1)(D). If an integral support W is not contained in D, use the Cartier intersection cycle on D∩W; if W is contained in D, use c₁(O_X(D)|W)∩[W]. The contained case is essential for self-intersection.

**Hypotheses.** D effective Cartier; compatible induced dimensions.

**Construction or proof.**

1. Split the supports into the contained and properly meeting cases. Rational-section and tame-boundary calculations establish descent and show i_*i!=c₁(O_X(D))∩−.

**Direct prerequisites.** [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`); [Chow groups](#chow-group) (`SchemeAndStackFoundations:SF.5/chow-group`); `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definition 42.29.1 and Lemmas 42.29.4, 42.30.2–42.30.3, tags 02T8, 02T9, 02TO and 0F95, pp. 52–56. The two support cases, descent and self-intersection are part of the Cartier construction.

**Uses that determine the interface.**

- Milne Theorem 11.27 and Stacks 42.54.7: Surface divisor intersections and the codimension-one comparison of refined Gysin use the contained-support rule.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.cartierGysin_push | compatibility | Pushing the Cartier Gysin image back to X gives the first Chern cap operator of O_X(D). |
| TauCeti.AlgebraicGeometry.Intersection.cartierGysin_self | relation | i! i_*a equals c₁(O_X(D)\|D)∩a. |
| TauCeti.AlgebraicGeometry.Intersection.cartierGysin_flat | functoriality | In a flat Cartesian base change, shifted flat pullback commutes with Cartier Gysin. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.cartierGysin_test_hyperplane | computation | A hyperplane in P² meets a line not contained in it in one point. |
| TauCeti.AlgebraicGeometry.Intersection.cartierGysin_test_self_line | non-example | The same line in P² has self-intersection of degree 1, not zero merely because it is contained. |
| TauCeti.AlgebraicGeometry.Intersection.cartierGysin_test_empty_divisor | degenerate | The empty effective Cartier divisor has zero Gysin map. |

**Suggested-signature boundary.** The effective Cartier condition is omitted from the Lean signatures; an arbitrary closed immersion does not define this map. The flat signature also omits the induced-dimension and relative-pure-dimension data.

<a id="projective-bundle"></a>

### Projective bundles and tautological quotients

**Construction** · `SchemeAndStackFoundations:SF.5/projective-bundle` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.projectiveBundle`.

For a finite locally free O_X-module E of rank r, construct P_X(E)=Proj_X(Sym E) with the quotient convention, π:P(E)→X and the universal rank-one quotient π*E→O(1). It represents invertible quotients up to isomorphism and commutes with arbitrary base change. For r=0 it is empty; for r=1 it is X with O(1)=E.

**Hypotheses.** E finite locally free; X in Situation 42.7.1. The quotient convention is fixed throughout.

**Construction or proof.**

1. Use the SF.0 relative Proj construction and its homogeneous standard opens to glue the quotient classifiers. Glue O(1) and the universal quotient from the degree-one generators; apply the same construction after base change.

**Direct prerequisites.** `mathlib:AlgebraicGeometry.Scheme.Modules`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`; `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Section 42.36 before Lemma 42.36.1, p. 70; Lemma 42.36.2, tag 02TX, pp. 71–72. Uses Proj(Sym E), π_*O(1)=E and the canonical quotient. This pins the convention needed by the Chern relation.

**Uses that determine the interface.**

- Stacks 42.36–43 and Krämer IV.3: Projective formulas, splitting and the projective projection step of GRR need the quotient and O(1).
- AlgebraicModuliForArithmeticGeometry:R09.1: The higher-tier moduli roadmap imports this general bundle foundation; Grassmannian and invariant-lattice targets remain its own.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_basechange | functoriality | Base-changing P_X(E) to Y is canonically P_Y(f*E), with the same O(1). |
| TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_rank_one | characterisation | For an invertible E, P(E) is X and its tautological quotient identifies O(1) with E. |
| TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_quotient_epi | universal-property | The canonical map π*E→O(1) is an epimorphism of native module sheaves. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_test_rank_zero | degenerate | The projectivization of the zero module is the empty scheme. |
| TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_test_rank_two | computation | The trivial rank-two bundle over Spec ℚ gives P¹. |
| TauCeti.AlgebraicGeometry.Intersection.projectiveBundle_test_quotient_sign | compatibility | For rank one, pulling E back along the projection is isomorphic to O(1), not its dual. |

**Suggested-signature boundary.** Finite local freeness and rank are omitted from the prototype. Relative Proj itself remains an SF.0 supplier rather than a second construction here.

<a id="projective-bundle-formula"></a>

### Projective bundle formula

**Theorem** · `SchemeAndStackFoundations:SF.5/projective-bundle-formula` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.projective_bundle_formula`.

For E of constant positive rank r, with ξ=c₁(O(1)), the map ⊕_(j=0)^(r−1) CH_(d−r+1+j)(X)→CH_d(P(E)), (a_j)↦Σ ξ^j∩π*a_j, is an isomorphism. Moreover π_*(ξ^s∩π*a)=0 for s<r−1 and equals a for s=r−1.

**Hypotheses.** E finite locally free of constant rank r>0; π flat of relative dimension r−1 and proper.

**Construction or proof.**

1. On a trivial bundle identify classes by powers of the hyperplane. Localization and noetherian induction give the general statement; the leading push coefficient proves uniqueness.

**Direct prerequisites.** [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`); [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`); [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`); [Localization for Chow homology](#chow-localization) (`SchemeAndStackFoundations:SF.5/chow-localization`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.36.1–42.36.2, tags 02TW–02TX, pp. 70–72. States the shifted direct-sum decomposition and the push coefficients with the fixed quotient convention.

**Acceptance.**

- For the trivial rank-two bundle, the two summands have grades d−1 and d. For rank one there is just the identity summand.

**Suggested-signature boundary.** The constant rank r and finite locally free hypotheses are omitted from the Lean form; the integer grading of the expansion is retained.

<a id="flag-bundle"></a>

### Complete flag bundles

**Construction** · `SchemeAndStackFoundations:SF.5/flag-bundle` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.flagBundle`.

Construct the complete quotient flag bundle q:F(E)→X by successive projectivizations of the kernels of the tautological quotient. Its pullback of E has a filtration with invertible quotients L₁,…,L_r. Pullback on every Chow group is injective, also after each base change; splitting means a filtration, not a claimed direct-sum isomorphism.

**Hypotheses.** E finite locally free of constant rank r; successive projective kernels are finite locally free.

**Construction or proof.**

1. Iterate the projective quotient classifier and its locally split kernel. Projective bundle push coefficients produce a left inverse at each step; compose them to prove injectivity.

**Direct prerequisites.** [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`); [Projective bundle formula](#projective-bundle-formula) (`SchemeAndStackFoundations:SF.5/projective-bundle-formula`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.43.1, tag 02UL, p. 85; Lemma 42.40.4, tag 02UJ, p. 81. The flag construction gives line quotients and universally injective Chow pullback for the splitting principle.

**Uses that determine the interface.**

- Stacks 42.40, 42.43 and Krämer IV.1: Whitney and the characteristic polynomials are proved after this injective splitting pullback.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.flagBundle_pull_injective | characterisation | The flat flag pullback is injective in each grade. |
| TauCeti.AlgebraicGeometry.Intersection.flagBundle_basechange | functoriality | The complete flag bundle commutes with arbitrary base change. |
| TauCeti.AlgebraicGeometry.Intersection.flagBundle_line_quotients | data | The complete quotient flag has r invertible graded pieces. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.flagBundle_test_rank_one | degenerate | For rank one the flag bundle is the base itself. |
| TauCeti.AlgebraicGeometry.Intersection.flagBundle_test_rank_two | computation | For a trivial rank-two bundle over a point the complete flag scheme is P¹. |
| TauCeti.AlgebraicGeometry.Intersection.flagBundle_test_detect_zero | characterisation | A Chow class whose flag pullback is zero was already zero. |

**Suggested-signature boundary.** The finite locally free rank-r and flag-filtration hypotheses are stated in the packet but omitted from these suggested forms.

<a id="chern-operators"></a>

### Chern class operators

**Construction** · `SchemeAndStackFoundations:SF.5/chern-operators` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.chern`.

For a finite locally free E of constant rank r, define integral cap operators c_i(E):CH_d(X)→CH_(d−i)(X) by the unique projective relation ξ^r−π*c₁(E)ξ^(r−1)+…+(−1)^rπ*c_r(E)=0. Set c₀=id and c_i=0 for i>r. They are central natural operations for proper pushforward, flat pullback and Cartier Gysin; X need not be smooth.

**Hypotheses.** E finite locally free of constant rank r; quotient projective bundle convention.

**Construction or proof.**

1. Use projective bundle uniqueness to solve the relation for its coefficients. The rank-one case is the section-divisor first Chern operator. Pull the projective relation through proper/flat/Cartier operations to prove compatibility; splitting proves integral centrality.

**Direct prerequisites.** [Projective bundle formula](#projective-bundle-formula) (`SchemeAndStackFoundations:SF.5/projective-bundle-formula`); [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Projection formula for first Chern operators](#chern-projection) (`SchemeAndStackFoundations:SF.5/chern-projection`); [Complete flag bundles](#flag-bundle) (`SchemeAndStackFoundations:SF.5/flag-bundle`); [Gysin maps for Cartier divisors](#cartier-gysin) (`SchemeAndStackFoundations:SF.5/cartier-gysin`); [Commutation of first Chern operators](#chern-commutation) (`SchemeAndStackFoundations:SF.5/chern-commutation`); [Flat compatibility of first Chern operators](#chern-flat) (`SchemeAndStackFoundations:SF.5/chern-flat`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definitions 42.37.1 and 42.38.1; Lemmas 42.38.3–42.38.9, tags 02U0, 02U5–02UA, pp. 73–77. Defines the integral operators by the projective relation and their naturality and commutation.

**Uses that determine the interface.**

- SchemeKTheory:S.7 and MotivesAndAlgebraicCycles:MC.0: Integral characteristic operators precede rational characters and smooth intersection classes.
- Kresch Section 3.6: Stack Chern classes compare with these operators under scheme approximations.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.chern_zero | simp | c₀(E) is the identity after the zero grade shift. |
| TauCeti.AlgebraicGeometry.Intersection.chern_rank_one | compatibility | For a line bundle, c₁ agrees with the existing first Chern cap construction. |
| TauCeti.AlgebraicGeometry.Intersection.chern_projection | compatibility | Chern operators commute with proper pushforward when the bundle is pulled back. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.chern_test_trivial_rank_two | degenerate | Every positive Chern operator of the trivial rank-two bundle is zero. |
| TauCeti.AlgebraicGeometry.Intersection.chern_test_split_o1_o1 | computation | On P², c₂(O(1)⊕O(1))∩[P²] is one point. |
| TauCeti.AlgebraicGeometry.Intersection.chern_test_line_c2_zero | non-example | The second Chern operator of any line bundle is zero. |

**Suggested-signature boundary.** Finite local freeness and constant rank are omitted only from the prototype. A varying-rank bundle is handled componentwise; no untruncated total class on a non-quasi-compact scheme is asserted.

<a id="whitney"></a>

### Whitney sum formula

**Theorem** · `SchemeAndStackFoundations:SF.5/whitney` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.whitney`.

For an exact sequence 0→E′→E→E″→0 of finite locally free modules, c_n(E)∩a=Σ_(i+j=n)c_i(E′)∩c_j(E″)∩a. The individual degree shifts are transported to d−n. The exact sequence need not split on X.

**Hypotheses.** All three modules finite locally free with locally constant ranks; for a single rank formula work on a constant-rank component.

**Construction or proof.**

1. Pull to the flag bundles of the submodule and quotient. There the filtration reduces the identity to the projective line-root relation, and injective pullback descends it to X.

**Direct prerequisites.** [Chern class operators](#chern-operators) (`SchemeAndStackFoundations:SF.5/chern-operators`); [Complete flag bundles](#flag-bundle) (`SchemeAndStackFoundations:SF.5/flag-bundle`); [Projection formula for first Chern operators](#chern-projection) (`SchemeAndStackFoundations:SF.5/chern-projection`); [Commutation of first Chern operators](#chern-commutation) (`SchemeAndStackFoundations:SF.5/chern-commutation`); [Flat compatibility of first Chern operators](#chern-flat) (`SchemeAndStackFoundations:SF.5/chern-flat`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.40.3, tag 02UI, pp. 80–81. Proves the exact-sequence formula, with splitting only on an injective flag pullback.

**Acceptance.**

- For O(1)⊕O(−1) on P², c₁=0 and c₂=−[point]; replacing c₂ by zero loses the mixed product.

**Suggested-signature boundary.** The three finite locally free conditions are omitted from the prototype. The expansion is an iterated cap sum with explicit grade transport, not an assumed Whitney identity.

<a id="chern-regular-section"></a>

### Top Chern class of a regular section

**Theorem** · `SchemeAndStackFoundations:SF.5/chern-regular-section` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.top_chern_regular_section`.

If a section s of a rank-r finite locally free E is regular with zero scheme i:Z→X of codimension r, then c_r(E)∩[X]=i_*[Z] in CH_(dimδX−r)(X). At a regular embedding this gives the self-intersection factor c_r of its normal bundle.

**Hypotheses.** X pure δ-dimension d; s a regular section, so its zero immersion has codimension r.

**Construction or proof.**

1. Compare the zero section and its translate by s in the vector bundle. Homotopy invariance and Cartier intersections on the projective completion identify the top Chern operator with the zero scheme cycle.

**Direct prerequisites.** [Chern class operators](#chern-operators) (`SchemeAndStackFoundations:SF.5/chern-operators`); [Affine bundle homotopy invariance](#affine-bundle-homotopy) (`SchemeAndStackFoundations:SF.5/affine-bundle-homotopy`); [Gysin maps for Cartier divisors](#cartier-gysin) (`SchemeAndStackFoundations:SF.5/cartier-gysin`); [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.44.1, tag 0FA9, pp. 88–89. The regular zero locus represents the top Chern cap class.

**Acceptance.**

- Two independent linear sections of O(1)⊕O(1) on P² have one reduced zero, giving top Chern degree 1.

**Suggested-signature boundary.** Pure dimension, finite locally free rank r, the specified section and its regularity/zero-scheme identification are omitted from the prototype; they are not replaced by a hypothesis equal to this conclusion.

## Refined intersection and arithmetic comparison

Normal deformation and vector-bundle homotopy construct refined Gysin after arbitrary base change. Proper and flat compatibility, excess, self-intersection, interchange and composition retain the original normal rank. The lci construction records the read global regular/smooth-factorization case and an explicit general gluing gap. The smooth ring uses the diagonal, and the local proper-intersection comparison uses Tor. Plane Bézout counts isolated intersections even when two forms share components. The arithmetic pairing is a compatibility with existing Stable Reduction work.

<a id="normal-cone"></a>

### Normal cones and normal bundles

**Construction** · `SchemeAndStackFoundations:SF.5/normal-cone` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.normalCone`.

For a closed immersion i:Z→X with ideal I, the normal cone C_ZX is Spec_Z(⊕_(n≥0) I^n/I^(n+1)). Its zero section and projection are intrinsic. For a regular immersion of constant codimension c, I/I² is locally free of rank c and C_ZX is the normal vector bundle (I/I²)∨. Proj of this graded algebra is the projectivized cone, not the cone itself.

**Hypotheses.** Closed immersion between locally Noetherian schemes; regularity and constant codimension only for the vector bundle identification.

**Construction or proof.**

1. Construct the graded normal algebra on affine charts and glue by relative Spec. The regular-sequence associated-graded calculation identifies it with Sym(I/I²).

**Direct prerequisites.** `SchemeAndStackFoundations:SF.0`; [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.2, printed pp. 81–85; III.4 Proposition 4.1, pp. 91–92. Defines cones by relative Spec and the normal algebra; the deformation chart recovers the same algebra.
- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Section 42.53, tag 0FBH, p. 118, item (7). The open exceptional cone is Spec of the normal algebra.

**Uses that determine the interface.**

- Stacks 42.53–54 and Krämer III.4–6: Normal deformation specializes a support to its normal cone, then regular-immersion homotopy identifies Chow groups.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.normalCone_flat_basechange | functoriality | Normal cones commute with flat base change; arbitrary nonflat base change need not preserve the normal algebra. |
| TauCeti.AlgebraicGeometry.Intersection.normalCone_regular | characterisation | For a regular immersion the cone is the total space of its normal vector bundle. |
| TauCeti.AlgebraicGeometry.Intersection.normalCone_identity | simp | The normal cone of the identity is the zero vector bundle, hence Z. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.normalCone_test_origin_line | computation | The normal cone of the origin in A¹ over ℚ is A¹, not P⁰. |
| TauCeti.AlgebraicGeometry.Intersection.normalCone_test_identity | degenerate | The identity immersion has zero normal rank. |
| TauCeti.AlgebraicGeometry.Intersection.normalCone_test_node | non-example | At the origin of V(xy) in A² the normal cone is V(xy), a reducible cone rather than a rank-one vector space. |

**Suggested-signature boundary.** Regularity is omitted from normalCone_regular. vectorBundle is the SF.0 relative-Spec supplier. Affine schemes and the origin fixtures use native Scheme objects.

<a id="normal-deformation"></a>

### Deformation to the normal cone

**Construction** · `SchemeAndStackFoundations:SF.5/normal-deformation` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.normalDeformation`.

For a closed immersion i:Z→X, the open deformation M_ZX is Bl_(Z×{0})(X×A¹) with the strict transform of X×{0} removed. Its parameter t is a nonzerodivisor, its special fibre is C_ZX, and its restriction over G_m is X×G_m. Over a field k the parameter map M_ZX→A¹_k is flat. Over a general dimension base only the Cartier parameter and fibre identities are asserted. In the P¹ blowup compactification the exceptional divisor is the projective completion of C_ZX with an added trivial direction. For regular i this is P(N_ZX∨⊕O_Z) in the quotient convention. Its intersection with the strict transform is the projectivized cone without that direction. The blowup is imported from existing StableReduction Layer 4.

**Hypotheses.** Closed immersion in the common locally Noetherian dimension base; a field base for parameter flatness; regularity only for the normal-bundle identification.

**Construction or proof.**

1. Apply the imported blowup to I+(t). Its open affine algebra is O_X[t,I/t] inside O_X[t,t⁻¹]; setting t=0 gives the normal algebra and inverting t gives O_X[t,t⁻¹]. Multiplication by t is injective. Over a field, this subalgebra is torsion-free as a k[t]-module, hence flat over k[t].

**Direct prerequisites.** [Normal cones and normal bundles](#normal-cone) (`SchemeAndStackFoundations:SF.5/normal-cone`); `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.4 Proposition 4.1, printed pp. 91–92. The blowup construction and affine deformation algebra identify the two fibres.
- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Section 42.53, pp. 118–120, tags 0FBG–0FBH. The compactified blowup and open normal-cone chart supply the specialization geometry.

**Uses that determine the interface.**

- Krämer III.5–6 and IV.3; Kresch Section 4.1: Specialization, regular-embedding GRR and stack local Gysin use the same deformation rather than an unexplained Gysin primitive.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.normalDeformation_zero | data | The t=0 fibre is canonically the normal cone. |
| TauCeti.AlgebraicGeometry.Intersection.normalDeformation_generic | data | The restriction where t is invertible is X×G_m. |
| TauCeti.AlgebraicGeometry.Intersection.normalDeformation_flat | compatibility | Over a field k the parameter map M_ZX→A¹_k is flat. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.normalDeformation_test_empty | degenerate | The empty centre has empty special fibre; its open normal deformation is X×G_m. |
| TauCeti.AlgebraicGeometry.Intersection.normalDeformation_test_origin | computation | Deforming the origin of A¹ gives A² with coordinates t and x/t. |
| TauCeti.AlgebraicGeometry.Intersection.normalDeformation_test_node_special | non-example | The special fibre for the origin of V(xy) is the reducible node, retaining both branches. |

**Suggested-signature boundary.** The relative A¹/G_m, parameter/fibre helpers are native schemes supplied by SF.0 and the imported blowup. Flatness is stated for the parameter map to A¹_k with the field explicit; it is not a flatness assertion about M_ZX→X×A¹.

<a id="specialization"></a>

### Specialization of Chow classes

**Construction** · `SchemeAndStackFoundations:SF.5/specialization` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.specialize`.

Normal deformation gives σ_i:CH_d(X)→CH_d(C_ZX): lift the class to the compactified family and intersect with its special Cartier fibre. The trivial normal line kills the ambiguity of a lift. For an integral support W⊂X its specialization is the fundamental cycle of C_(W∩Z)W inside C_ZX, including generic multiplicities.

**Hypotheses.** i closed immersion; the common induced dimension functions on the deformation and cone; normal fibre uses grade d.

**Construction or proof.**

1. Use localization to lift a generic-fibre class. Cartier Gysin on the special fibre gives the map. Two lifts differ by a class from that fibre, and its Cartier self-intersection is zero because its normal line is trivial.

**Direct prerequisites.** [Deformation to the normal cone](#normal-deformation) (`SchemeAndStackFoundations:SF.5/normal-deformation`); [Localization for Chow homology](#chow-localization) (`SchemeAndStackFoundations:SF.5/chow-localization`); [Gysin maps for Cartier divisors](#cartier-gysin) (`SchemeAndStackFoundations:SF.5/cartier-gysin`); [Fundamental cycles with generic lengths](#fundamental-cycle) (`SchemeAndStackFoundations:SF.5/fundamental-cycle`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.4 Corollary 4.2, printed p. 93. Gives the normal-cone specialization and its formula on integral supports.
- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.48.1–42.48.3, tags 0F9J, 0GUH and 0FAQ, pp. 102–103. The Cartier-fibre construction, restriction and proper compatibility prove independence.

**Uses that determine the interface.**

- Krämer III.5–6 and Stacks 42.54: Refined Gysin is specialization followed by inclusion in the pulled-back normal bundle and inverse homotopy.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.specialize_fundamental | simp | The class of an integral W specializes to the normal-cone fundamental class of W∩Z in W. |
| TauCeti.AlgebraicGeometry.Intersection.specialize_add | structure | Specialization adds cycles without changing the grade. |
| TauCeti.AlgebraicGeometry.Intersection.specialize_identity | simp | For the identity immersion specialization is the identity under C_XX≅X. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.specialize_test_zero | degenerate | The zero Chow class has zero specialization. |
| TauCeti.AlgebraicGeometry.Intersection.specialize_test_line | computation | The fundamental class of A¹ specializes to the fundamental class of its tangent line at the origin. |
| TauCeti.AlgebraicGeometry.Intersection.specialize_test_node_branches | non-example | The node specializes with two component coefficients 1, rather than to one smooth tangent line. |

**Suggested-signature boundary.** Compatible induced cone dimensions and pure support dimensions are omitted. The coneSupportClass helper denotes the stated closed normal-cone fundamental class, not an assumed specialization result.

<a id="refined-gysin"></a>

### Refined Gysin maps

**Construction** · `SchemeAndStackFoundations:SF.5/refined-gysin` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.refinedGysin`.

For a regular closed immersion i:Z→X of constant codimension c and any f:Y→X, define i!_f:CH_d(Y)→CH_(d−c)(Z×X Y). Specialize to C_(Z×X Y)Y, embed this cone in f_Z* N_ZX and invert rank-c vector-bundle homotopy. The base-changed immersion may fail to be regular; the rank is that of the original normal bundle.

**Hypotheses.** i regular of constant codimension c; f arbitrary; all schemes in the common dimension base.

**Construction or proof.**

1. Use the surjection from the pulled-back normal algebra to the inverse-image normal algebra. Its cone closed immersion gives a proper push to the normal bundle. Apply the inverse of the affine-bundle homotopy isomorphism.

**Direct prerequisites.** [Specialization of Chow classes](#specialization) (`SchemeAndStackFoundations:SF.5/specialization`); [Normal cones and normal bundles](#normal-cone) (`SchemeAndStackFoundations:SF.5/normal-cone`); [Affine bundle homotopy invariance](#affine-bundle-homotopy) (`SchemeAndStackFoundations:SF.5/affine-bundle-homotopy`); [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.6 Definition 6.1 and Theorem 6.2, printed pp. 98–99. Defines the refined operation for arbitrary inverse images.
- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.54.2, tag 0FBK, pp. 121–122. The normal-bundle construction produces the codimension-c refined map.

**Uses that determine the interface.**

- Krämer III.6, Kresch 4.1–4.3 and Stacks 42.60–62: Excess, stack diagonal intersections and smooth-scheme multiplication need the arbitrary-base-change operation.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.refinedGysin_cartier | compatibility | In codimension one refined Gysin agrees with the Cartier map on the original ambient scheme. |
| TauCeti.AlgebraicGeometry.Intersection.refinedGysin_identity | simp | A codimension-zero identity has identity refined Gysin. |
| TauCeti.AlgebraicGeometry.Intersection.refinedGysin_chern | compatibility | Every Chern cap operator commutes with refined Gysin, after pulling its bundle to the inverse image. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.refinedGysin_test_transverse_lines | computation | Two transverse lines in P² give one point in codimension one. |
| TauCeti.AlgebraicGeometry.Intersection.refinedGysin_test_self_line | non-example | Refining a line against itself retains its normal Chern class, of degree 1. |
| TauCeti.AlgebraicGeometry.Intersection.refinedGysin_test_identity | degenerate | Codimension-zero refined Gysin preserves any class. |

**Suggested-signature boundary.** Regularity and constant codimension c of the original immersion are omitted in Lean. refinedOriginal transports along the canonical pullback-with-identity isomorphism; it is not a second Gysin definition.

<a id="gysin-proper-flat"></a>

### Proper compatibility of refined Gysin

**Theorem** · `SchemeAndStackFoundations:SF.5/gysin-proper-flat` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.refined_proper`.

For an original regular immersion Z→X of constant codimension c and a proper Y′→Y over X, refined Gysin commutes with proper pushforward. Both routes have target CH_(d−c)(Z×X Y).

**Hypotheses.** Original regular closed immersion of constant codimension c; proper map of the base-change inputs; induced dimensions.

**Construction or proof.**

1. Extend the diagram to the normal deformations. Use specialization compatibility, base change for cone inclusions and homotopy; check generic supports with their lengths.

**Direct prerequisites.** [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Proper-flat base change](#proper-flat-basechange) (`SchemeAndStackFoundations:SF.5/proper-flat-basechange`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.48.3, tag 0FAQ, p. 103; refined construction in Section 42.54, pp. 121–126. Proper compatibility of specialization and homotopy gives the refined push formula.

**Acceptance.**

- The transverse line computation is invariant under replacing either support by a proper resolution and pushing back.

**Suggested-signature boundary.** Original regularity/codimension and compatible dimensions are omitted. The right-side helper is pulled-back proper push with grade transport.

<a id="gysin-flat"></a>

### Flat compatibility of refined Gysin

**Theorem** · `SchemeAndStackFoundations:SF.5/gysin-flat` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.refined_flat`.

For an original regular immersion Z→X of constant codimension c and Y′→Y flat of pure relative dimension r over X, refined Gysin commutes with flat pullback. Both routes have target CH_(d+r−c)(Z×X Y′), with the rank c of the original immersion.

**Hypotheses.** Original regular immersion of codimension c; Cartesian diagrams; proper or relative-pure-dimensional flat comparison map.

**Construction or proof.**

1. Apply flat compatibility of specialization, then of the cone inclusion and inverse vector-bundle homotopy.

**Direct prerequisites.** [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Proper-flat base change](#proper-flat-basechange) (`SchemeAndStackFoundations:SF.5/proper-flat-basechange`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.48.4, tag 0FAR, p. 103; refined construction in Section 42.54, pp. 121–126. Flat specialization and homotopy give the refined flat compatibility.

**Acceptance.**

- The transverse line computation is invariant under replacing either support by a proper resolution and pushing back.

**Suggested-signature boundary.** Original regularity/codimension, compatible dimensions and flat relative pure dimension are omitted. The right-side helper is the actual pulled-back flat operation with its canonical transports.

<a id="gysin-excess"></a>

### Excess intersection formula

**Theorem** · `SchemeAndStackFoundations:SF.5/gysin-excess` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.excess_intersection`.

In a Cartesian square pulling a regular immersion of codimension c back to a regular immersion of codimension c′≤c, the excess bundle E fits 0→N_(Z′)Y→f_Z* N_ZX→E→0 and has rank c−c′. Refined pullback equals c_(c−c′)(E) capped with the codimension-c′ ordinary Gysin. Its target is CH_(d−c)(Z′), never CH_(d−c−c′) or CH_(d−c−rank E).

**Hypotheses.** Both original and pulled-back immersions regular of the stated constant codimensions; normal injection and locally free excess quotient.

**Construction or proof.**

1. Compute the embedding of the pulled-back normal cone into the original normal bundle. The vector bundle inclusion formula supplies the top Chern cap factor; homotopy accounts for the two rank shifts.

**Direct prerequisites.** [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Top Chern class of a regular section](#chern-regular-section) (`SchemeAndStackFoundations:SF.5/chern-regular-section`); [Whitney sum formula](#whitney) (`SchemeAndStackFoundations:SF.5/whitney`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.5 Corollary 5.8, printed p. 96; III.6 Theorem 6.2(d), p. 99. The first locator fixes the rank and target; the second has the recorded excess-target misprint.
- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.54.3–42.54.4, tags 0FBL and 0FV7, pp. 122–123. Confirms the corrected degree and normal excess formula.

**Acceptance.**

- For a line self-intersection in P² the pulled-back immersion is the identity, c′=0, and the excess line has first Chern degree 1.

**Suggested-signature boundary.** Regularity, the normal exact sequence and identification of E with its excess quotient are omitted; E is a native module, not a container for the desired equation.

<a id="gysin-self-intersection"></a>

### Self-intersection formula

**Theorem** · `SchemeAndStackFoundations:SF.5/gysin-self-intersection` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.gysin_self_intersection`.

For a regular immersion i:Z→X of codimension c, i!i_*a=c_c(N_ZX)∩a in CH_(d−c)(Z). This is the excess case with pulled-back immersion the identity.

**Hypotheses.** Regular immersion of constant codimension c and its normal bundle.

**Construction or proof.**

1. Apply excess to the square obtained by pulling i back along itself; the zero normal bundle of the identity leaves the full original normal bundle as excess.

**Direct prerequisites.** [Excess intersection formula](#gysin-excess) (`SchemeAndStackFoundations:SF.5/gysin-excess`); [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.5 Example 5.9, printed p. 97. Identifies the self-intersection with the normal top Chern operator.

**Acceptance.**

- The exceptional curve of a blowup of a smooth surface at a point has self-intersection −1, by the imported Layer 4 normal calculation.

**Suggested-signature boundary.** Regularity and the codimension condition are omitted from Lean.

<a id="gysin-interchange"></a>

### Interchange of refined Gysin maps

**Theorem** · `SchemeAndStackFoundations:SF.5/gysin-interchange` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.regular_gysin_interchange`.

For regular immersions Z→X and W→Y of constant codimensions c,e and a map Y→X, applying their refined Gysin operations in either order gives the same class on the canonical common fibre product, in grade d−c−e. Only the original immersions are required to be regular; their base changes can have excess.

**Hypotheses.** Compositions and Cartesian inverse images as stated; regular immersions of the original ambient schemes.

**Construction or proof.**

1. Form the two-parameter deformation for the two original immersions. Compare Cartier specializations in its two parameters, then use the two normal vector-bundle homotopy inverses.

**Direct prerequisites.** [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Deformation to the normal cone](#normal-deformation) (`SchemeAndStackFoundations:SF.5/normal-deformation`); [Specialization of Chow classes](#specialization) (`SchemeAndStackFoundations:SF.5/specialization`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemma 42.54.8, tag 0FBP, pp. 124–125. The two-parameter deformation identifies both orders of refined intersection.

**Acceptance.**

- Two coordinate hyperplanes of A² give the same unit origin cycle in either order.

**Suggested-signature boundary.** Original regularity and codimensions, common induced dimensions, and the fibre-product isomorphism transports are omitted. The right side is the second order of refined operations transported to the common fibre product.

<a id="gysin-composition"></a>

### Composition of regular Gysin maps

**Theorem** · `SchemeAndStackFoundations:SF.5/gysin-composition` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.regular_gysin_comp`.

For regular closed immersions W→Z→X of constant codimensions e and c, their composite is regular of codimension c+e and its refined Gysin map is the composite of the two refined maps, including after arbitrary base change.

**Hypotheses.** Compositions and Cartesian inverse images as stated; regular immersions of the original ambient schemes.

**Construction or proof.**

1. Build the double deformation and compare specializing in either parameter order. Its normal exact sequence, specialization commutation and homotopy identify the resulting maps.

**Direct prerequisites.** [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Excess intersection formula](#gysin-excess) (`SchemeAndStackFoundations:SF.5/gysin-excess`); [Deformation to the normal cone](#normal-deformation) (`SchemeAndStackFoundations:SF.5/normal-deformation`); [Interchange of refined Gysin maps](#gysin-interchange) (`SchemeAndStackFoundations:SF.5/gysin-interchange`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.54.8 and 42.54.10, tags 0FBP and 0FEC, pp. 124–126. The double-deformation argument proves interchange and composition.

**Acceptance.**

- Two coordinate hyperplanes of A² give the same unit origin cycle in either order.

**Suggested-signature boundary.** Regularity/codimension are omitted. The right side is the two composed Gysin maps with the canonical restriction and grade transports; proving their equality requires the double-deformation input recorded as a gap.

<a id="lci-pullback"></a>

### Pullback for globally factorable lci morphisms

**Construction** · `SchemeAndStackFoundations:SF.5/lci-pullback` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.lciPull`.

For a morphism f:X→Y with a global factorization X→P→Y, first map a regular immersion of codimension c and second map smooth of pure relative dimension r, define f!=i!∘p*:CH_d(Y)→CH_(d+r−c)(X). This is independent of the chosen such factorization. A merely locally factorable lci morphism requires a separate gluing theorem; the read Stacks definition does not supply it.

**Hypotheses.** A specified global regular-immersion/smooth factorization, of constant ranks c and r.

**Construction or proof.**

1. Define the composite. Compare two factorizations using their product over Y, smooth sections and composition of regular Gysin; apply the normal exact sequence.

**Direct prerequisites.** [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`); [Composition of regular Gysin maps](#gysin-composition) (`SchemeAndStackFoundations:SF.5/gysin-composition`); `SchemeAndStackFoundations:SF.0`; `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`; [Flat compatibility of refined Gysin](#gysin-flat) (`SchemeAndStackFoundations:SF.5/gysin-flat`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.59.1–42.59.3 and Definition 42.59.4, tags 0FF0–0FF3, pp. 136–138. Independence is proved for the explicitly globally factorable morphisms of the definition.

**Uses that determine the interface.**

- SchemeKTheory:S.7 and Stacks 42.60: Regular/flat comparison and smooth diagonals need the signed virtual dimension.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.lciPull_factorization | characterisation | The pullback is the shifted smooth pull followed by regular Gysin. |
| TauCeti.AlgebraicGeometry.Intersection.lciPull_smooth | compatibility | For a smooth morphism factored with the identity regular immersion, lci pullback is flat pullback. |
| TauCeti.AlgebraicGeometry.Intersection.lciPull_flat | compatibility | If the globally factorable lci map is also flat of pure relative dimension s=r−c, its lci pull is its flat pull. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.lciPull_test_identity | degenerate | The identity has virtual relative dimension zero. |
| TauCeti.AlgebraicGeometry.Intersection.lciPull_test_hyperplane | computation | A hyperplane immersion has virtual dimension −1 and gives the line intersection class in P². |
| TauCeti.AlgebraicGeometry.Intersection.lciPull_test_affine_line | compatibility | A¹→Spec ℚ has virtual dimension +1 and gives the affine-line fundamental class. |

**Suggested-signature boundary.** The regular codimension-c and smooth relative-dimension-r hypotheses are omitted; Flat p alone is not sufficient. Factorization independence is a separate node below. The arbitrary locally factorable route remains a recorded gap.

<a id="lci-factorization-independence"></a>

### Independence of lci factorization

**Theorem** · `SchemeAndStackFoundations:SF.5/lci-factorization-independence` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.lci_factorization_independent`.

Two global regular-immersion/smooth factorizations of the same f give equal pullback homomorphisms after transporting the virtual-dimension grade. The same comparison proves composition when the relevant global factorizations exist.

**Hypotheses.** Two global factorizations with equal composite and equal virtual relative dimension; common compatible dimensions.

**Construction or proof.**

1. Use the product of the ambient smooth schemes over Y. Smooth section Gysin is inverse to its smooth pullback, and regular composition compares the two maps.

**Direct prerequisites.** [Pullback for globally factorable lci morphisms](#lci-pullback) (`SchemeAndStackFoundations:SF.5/lci-pullback`); [Composition of regular Gysin maps](#gysin-composition) (`SchemeAndStackFoundations:SF.5/gysin-composition`); [Flat compatibility of refined Gysin](#gysin-flat) (`SchemeAndStackFoundations:SF.5/gysin-flat`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Lemmas 42.59.2–42.59.3 and 42.59.6, tags 0FF1, 0FF2 and 0FF5, pp. 137–139. The global-factor comparison and composition hypotheses are retained.

**Acceptance.**

- For the identity, its factorization through the zero section of a line bundle gives the same identity operation.

**Suggested-signature boundary.** Regular and smooth rank hypotheses are omitted in Lean.

<a id="exterior-product"></a>

### Exterior products of Chow classes

**Construction** · `SchemeAndStackFoundations:SF.5/exterior-product` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.exterior`.

For finite-type schemes X,Y over a field k, form a×b in CH_(d+e)(X×kY) from the fundamental cycles of the tensor-product supports. If W×kV is nonreduced or reducible, use all its generic lengths. This is bilinear, associative and commutes with proper push and pure-dimensional flat pull, without assuming k algebraically closed.

**Hypotheses.** Finite-type schemes over one field; field-induced dimension functions.

**Construction or proof.**

1. Compute products of integral supports by scheme-theoretic fibre product and fundamental cycles. Flat length calculations carry each principal relation to relations, giving a biadditive quotient map.

**Direct prerequisites.** [Fundamental cycles with generic lengths](#fundamental-cycle) (`SchemeAndStackFoundations:SF.5/fundamental-cycle`); [Chow groups](#chow-group) (`SchemeAndStackFoundations:SF.5/chow-group`); [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`); [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`); `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Section 42.61 and Lemmas 42.61.1–42.61.5, tags 0FBU–0FBZ, pp. 144–146. Defines products over arbitrary fields and proves descent and associativity.

**Uses that determine the interface.**

- MotivesAndAlgebraicCycles:MC.0 and WeilConjectures:WC.5: Correspondences and products of curves use field-independent exterior products.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.exterior_add | structure | Exterior product is additive in its first argument as well as its second. |
| TauCeti.AlgebraicGeometry.Intersection.exterior_fundamental | simp | The product of fundamental integral support classes is the entire fibre-product fundamental class. |
| TauCeti.AlgebraicGeometry.Intersection.exterior_point | simp | Product with a unit rational point preserves the class under X×Spec k≅X. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.exterior_test_zero | degenerate | Multiplying by the zero Chow class gives zero. |
| TauCeti.AlgebraicGeometry.Intersection.exterior_test_p1 | computation | The exterior square of [P¹] is the two-dimensional fundamental class of P¹×P¹. |
| TauCeti.AlgebraicGeometry.Intersection.exterior_test_inseparable | non-example | For a purely inseparable degree-p field extension K/k, K⊗kK has generic length p, which survives the product cycle. |

**Suggested-signature boundary.** Finite type, induced dimensions and support purity are omitted. The inseparable test additionally assumes K/k purely inseparable of degree p, omitted from Lean; it does not claim this coefficient for arbitrary extensions.

<a id="smooth-intersection"></a>

### Intersection rings of smooth schemes

**Construction** · `SchemeAndStackFoundations:SF.5/smooth-intersection` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.TotalChow`.

For X smooth and separated of pure dimension n over a field, multiply homological classes by Δ_X! applied to their exterior product. Reindex CH^j(X)=CH_(n−j)(X) and form the graded direct sum ⊕_j CH^j(X); it is a commutative ring with unit [X]. Only here are Chern operators identified with multiplication by Chern classes. Arbitrary singular Chow homology is not given this ring.

**Hypotheses.** X smooth separated of finite type over k, pure dimension n; field dimension function.

**Construction or proof.**

1. The diagonal is a regular immersion of codimension n. Refined Gysin and exterior associativity/interchange give associativity and symmetry; diagonal pullback against [X] gives the unit.

**Direct prerequisites.** [Exterior products of Chow classes](#exterior-product) (`SchemeAndStackFoundations:SF.5/exterior-product`); [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Composition of regular Gysin maps](#gysin-composition) (`SchemeAndStackFoundations:SF.5/gysin-composition`); [Chern class operators](#chern-operators) (`SchemeAndStackFoundations:SF.5/chern-operators`); `SchemeAndStackFoundations:SF.0`; `mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Sections 42.60 and 42.62, tags 0FBR and 0FC0; Lemmas 42.62.1–42.62.4, pp. 143–144 and 146–148. The smooth diagonal supplies the intersection ring and proper projection formula.

**Uses that determine the interface.**

- Krämer IV.1–3 and Milne Chapter 11: Todd polynomials, surface pairings and graph intersections require a genuine smooth intersection ring.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.intersect_comm | relation | The intersection of a and b equals that of b and a after grade transport. |
| TauCeti.AlgebraicGeometry.Intersection.intersect_unit | simp | The pure-dimensional fundamental class is the multiplicative unit. |
| TauCeti.AlgebraicGeometry.Intersection.smoothChowRing | data | The codimension-graded direct sum has the stated commutative ring structure. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.intersect_test_p2_lines | computation | Two P² line classes multiply to one point. |
| TauCeti.AlgebraicGeometry.Intersection.intersect_test_p1_square | degenerate | The square of a point class on P¹ lies in grade −1 and is zero. |
| TauCeti.AlgebraicGeometry.Intersection.intersect_test_rulings | non-example | On P¹×P¹ the two ruling classes multiply to one point, although each ruling has square zero. |

**Suggested-signature boundary.** Smoothness, separatedness, finite type and pure dimension n are omitted in these signatures. No CommRing instance is supplied for arbitrary X or arbitrary dimension function; smoothChowRing is only a future structure constructor under those omitted conditions.

<a id="tor-intersection"></a>

### Local Tor formula for proper intersections

**Theorem** · `SchemeAndStackFoundations:SF.5/tor-intersection` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.local_tor_intersection`.

On a smooth variety over an algebraically closed field, integral supports V,W meeting properly have intersection coefficients Σ_i(−1)^i length Tor_i^(O_X,η)(O_V,η,O_W,η). All lengths are finite and only finitely many are nonzero. If both supports are Cohen–Macaulay, the higher Tor terms vanish and the coefficient is length O_(V∩W),η. Without those hypotheses the raw intersection length can be wrong.

**Hypotheses.** Smooth ambient; proper meeting; the indicated generic intersection points. Cohen–Macaulayness for the length-only conclusion.

**Construction or proof.**

1. Use a finite free resolution in the ambient regular local ring and its alternating coherent cycle. The moving/deformation comparison identifies it with the diagonal product. The depth/regular-sequence calculation removes higher Tor under the Cohen–Macaulay assumptions.

**Direct prerequisites.** [Intersection rings of smooth schemes](#smooth-intersection) (`SchemeAndStackFoundations:SF.5/smooth-intersection`); [Cycles of coherent sheaves](#coherent-cycle) (`SchemeAndStackFoundations:SF.5/coherent-cycle`); `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Intersection Theory](https://stacks.math.columbia.edu/download/intersection.pdf), Section 43.14, tag 0AZR, pp. 9–11; Lemma 43.16.1, tag 0B02, p. 14. The Tor coefficient and the Cohen–Macaulay reduction are distinct; Example 43.14.4, tag 0B2S, p. 11 has length 3 but coefficient 2.

**Acceptance.**

- In the source local four-dimensional example V(xz,xw,yz,yw) and W(x−z,y−w), intersection length 3 and Tor multiplicity 2 distinguish the two formulas.

**Suggested-signature boundary.** Regular Noetherian ambient local ring, finite modules, proper intersection and the finite-length Tor conditions are omitted. The two integer helpers are the described independently constructed length invariants; neither is defined by the equality being asserted.

<a id="degree"></a>

### Degree of zero cycles

**Construction** · `SchemeAndStackFoundations:SF.5/degree` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.degree`.

For a proper finite-type k-scheme, push CH₀(X;ℤ) to CH₀(Spec k)=ℤ. A closed point x has degree [κ(x):k], including inseparable degree. Rational extension gives CH₀(X;ℚ)→ℚ. This is not a degree map on nonproper X: a point on A¹ can be rationally equivalent to zero.

**Hypotheses.** X proper over k; field dimension grading; finite type.

**Construction or proof.**

1. Identify cycles on Spec k with ℤ and show it has no positive-dimensional principal relations. Descend structure-map pushforward; tensor with ℚ for rational degree.

**Direct prerequisites.** [Proper pushforward on Chow groups](#chow-proper-push) (`SchemeAndStackFoundations:SF.5/chow-proper-push`); [Chow groups](#chow-group) (`SchemeAndStackFoundations:SF.5/chow-group`); `SchemeAndStackFoundations:SF.3`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Section 42.41 and Lemmas 42.41.1–42.41.3, tags 0AZ1–0AZ3, pp. 81–82. Defines degree and its residue-field and curve Euler-characteristic formulas.

**Uses that determine the interface.**

- Milne surface pairings and GenericDoublePointInterpolation:GI.3: Numerical intersections are obtained by degree only after proper geometric intersection.
- MotivesAndAlgebraicCycles:MC.0: Composition and numerical realizations of correspondences require residue-weighted degree.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.degree_closed_point | simp | A closed-point unit class has its full residue extension degree. |
| TauCeti.AlgebraicGeometry.Intersection.degree_proper | compatibility | Degree commutes with proper push over k. |
| TauCeti.AlgebraicGeometry.Intersection.degree_curve_chern | compatibility | On a proper curve, deg(c₁(L)∩[C])=χ(L)−χ(O_C). |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.degree_test_p1_o2 | computation | The degree of c₁(O(2)) on P¹ is 2. |
| TauCeti.AlgebraicGeometry.Intersection.degree_test_point | degenerate | A rational point has degree 1. |
| TauCeti.AlgebraicGeometry.Intersection.degree_test_degree_two | non-example | A closed point of residue degree 2 is not counted with degree 1. |

**Suggested-signature boundary.** Properness, finite type, field-induced dimensions and the pure proper curve condition are omitted. eulerCharacteristic is the native finite-cutoff expression with the required finite-dimensionality and vanishing certificate; it is not another cohomology definition.

<a id="isolated-plane-bezout"></a>

### Bézout bound for isolated plane intersections

**Theorem** · `SchemeAndStackFoundations:SF.5/isolated-plane-bezout` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.isolated_plane_bezout`.

Let F,G be nonzero homogeneous polynomials of positive degrees m,n on P² over an algebraically closed field. Sum the local scheme lengths only over isolated points of V(F)∩V(G). The sum is at most mn, even if F and G have common curve components. If there are no common components, equality holds. Remove their homogeneous greatest common divisor H; an isolated point is outside V(H), so its local length equals that of the residual coprime pair.

**Hypotheses.** Algebraically closed field; nonzero plane forms; isolated intersection points, not arbitrary points on a shared component.

**Construction or proof.**

1. At a shared-component point the intersection has positive-dimensional local support and is not isolated. On the complement of H it is a unit and leaves the local ideals unchanged. Residual coprime plane divisors meet properly; their Cohen–Macaulay local lengths equal the product degree (m−deg H)(n−deg H)≤mn.

**Direct prerequisites.** [Intersection rings of smooth schemes](#smooth-intersection) (`SchemeAndStackFoundations:SF.5/smooth-intersection`); [Local Tor formula for proper intersections](#tor-intersection) (`SchemeAndStackFoundations:SF.5/tor-intersection`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`); `SchemeAndStackFoundations:SF.0`; [Projective bundle formula](#projective-bundle-formula) (`SchemeAndStackFoundations:SF.5/projective-bundle-formula`).

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Proposition 11.7, Corollary 11.8 and Theorem 11.9, pp. 7–8. Linear-equivalence invariance and the surface pairing apply to degree-m and degree-n plane Cartier divisors. The plane Chow projective-bundle formula computes the product mn.
- [The Stacks Project Authors, Intersection Theory](https://stacks.math.columbia.edu/download/intersection.pdf), Lemma 43.16.1, tag 0B02, p. 14. Plane Cartier complete intersections have the needed scheme-length multiplicities.

**Acceptance.**

- For F=xy and G=xz the shared line x=0 is excluded; their sole isolated point [1:0:0] has length 1≤4. For y²z−x³ and y−x² in an affine chart, the local cusp contribution at the origin is 3.

**Suggested-signature boundary.** Algebraic closedness, nonzero homogeneous forms and their specified degrees are omitted. The integer helper is the finite sum of lengths at isolated projective intersections, not total length of a positive-dimensional common locus.

<a id="arithmetic-surface-comparison"></a>

### Comparison with arithmetic surface intersections

**Theorem** · `SchemeAndStackFoundations:SF.5/arithmetic-surface-comparison` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.arithmetic_surface_pairing`.

On a regular proper arithmetic surface over a Dedekind base, compare the imported StableReduction Layer 4 Cartier/Weil pairing with the local Cartier-Gysin lengths of SF.5. At proper vertical intersections the coefficients agree before taking residue-weighted fibre degree; self-intersection uses the normal line and agrees with the imported pairing. Keep the base dimension function: vertical curves have grade 1 and closed points grade 0. No global field-valued degree is asserted for a nonproper generic open.

**Hypotheses.** The regular proper arithmetic surface and the residue weighting/normal conventions of imported Layer 4.

**Construction or proof.**

1. Use native Weil-to-cycle inclusion and the Cartier length formula at the same local rings. The normal-line self-intersection matches the imported exceptional/vertical pairing. Projection follows from the common proper push coefficient.

**Direct prerequisites.** [Gysin maps for Cartier divisors](#cartier-gysin) (`SchemeAndStackFoundations:SF.5/cartier-gysin`); [Self-intersection formula](#gysin-self-intersection) (`SchemeAndStackFoundations:SF.5/gysin-self-intersection`); [Dimension functions](#dimension-function) (`SchemeAndStackFoundations:SF.5/dimension-function`); `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toAlgebraicCycle`; `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Definitions 42.29.1 and Lemma 42.30.3, pp. 52 and 56. The local length and contained-support Chern formulas are the comparison formulas.

**Acceptance.**

- Two transverse vertical components meeting at a rational residue point contribute 1; an exceptional curve contributes −1 to its self-pairing with the imported normalization.

**Suggested-signature boundary.** Regular proper arithmetic-surface/base/fibre and divisor support conditions are omitted. Both integer pairing helpers denote their independently specified constructions; Layer 4 owns the pairing and all reduction/contraction mathematics.

## Riemann–Roch and characteristic classes

Finite locally free resolutions on smooth quasiprojective varieties allow the character to extend from vector bundles to coherent sheaves. Positive codimension is nilpotent in the dimension-truncated rational ring; its graded pieces need not be finite-dimensional vector spaces. Koszul character, projective-space RR for all integer twists, zero-section RR and regular-embedding RR feed the projective factorization proof of GRR. The source's smooth scheme hypotheses remain visible at every step.

<a id="finite-resolutions"></a>

### Finite locally free resolutions

**Theorem** · `SchemeAndStackFoundations:SF.5/finite-resolutions` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.coherent_finite_resolution`.

On a smooth quasiprojective variety over an algebraically closed field, every coherent module has a finite locally free resolution. Two resolutions give the same alternating Chern character; exact sequences of coherent modules give additive characters. The construction needed here is the minimal resolution comparison, not a replacement for SchemeKTheory S.7 K₀/G₀ or λ-operations.

**Hypotheses.** Smooth quasiprojective variety; coherent module. A uniform finite bound follows from regular dimension and enough locally free surjections.

**Construction or proof.**

1. Use Serre twisting to obtain a finite locally free surjection and iterate its coherent kernel. Regular local projective-dimension bounds terminate the resolution. Compare resolutions by a common refinement and exact-complex additivity.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.2`; [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`); [Whitney sum formula](#whitney) (`SchemeAndStackFoundations:SF.5/whitney`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.2 Lemma 2.4 and the paragraph following it, printed p. 117. Supplies the finite resolutions and the coherent/locally free comparison used in the GRR proof.
- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Opening of Section 42.46, tag 0ESY, p. 91. Alternating characters of bounded locally free complexes are resolution-independent in the required scope.

**Acceptance.**

- A skyscraper on P¹ has the length-one resolution 0→O(−1)→O→O_p→0, giving character 1−exp(−h).

**Suggested-signature boundary.** Smoothness, quasiprojectivity, coherence and local freeness of each C.X n are omitted. The suggested form retains boundedness, vanishing positive homology and the degree-zero homology comparison to the actual native module M.

<a id="chern-character"></a>

### Rational Chern characters

**Construction** · `SchemeAndStackFoundations:SF.5/chern-character` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.RationalTotalChow`.

On a smooth separated pure n-dimensional finite-type k-scheme, ch(E)=Σ_i exp(α_i) in CH^*(X;ℚ), truncated above n, where α_i are the first Chern roots on the flag bundle. Thus ch₀=r, ch₁=c₁, ch₂=(c₁²−2c₂)/2. For coherent M in the smooth quasiprojective resolution scope, define ch(M) by the alternating character of a finite locally free resolution. These are finite characteristic polynomials with denominators, not integral classes or an unbounded exponential.

**Hypotheses.** Finite locally free E; smooth intersection ring; the extra finite-resolution scope for coherent M.

**Construction or proof.**

1. Newton symmetric polynomials express each root power sum in the integral Chern operators. Divide by j!, truncate at n and descend through injective flag pullback. Whitney gives exact additivity; tensor-root sums give multiplicativity. Resolution comparison extends additivity to coherent modules.

**Direct prerequisites.** [Chern class operators](#chern-operators) (`SchemeAndStackFoundations:SF.5/chern-operators`); [Complete flag bundles](#flag-bundle) (`SchemeAndStackFoundations:SF.5/flag-bundle`); [Whitney sum formula](#whitney) (`SchemeAndStackFoundations:SF.5/whitney`); [Intersection rings of smooth schemes](#smooth-intersection) (`SchemeAndStackFoundations:SF.5/smooth-intersection`); [Finite locally free resolutions](#finite-resolutions) (`SchemeAndStackFoundations:SF.5/finite-resolutions`).

**Source support.**

- [The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Section 42.45 and Lemmas 42.45.2–42.45.4, tags 02UM, 0F9C, 0F9D and 0FAB, pp. 90–91. The rational character polynomials and their sum/tensor/dual rules.
- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.1–2, printed pp. 111–117. Uses truncated roots and finite resolutions for coherent characters.

**Uses that determine the interface.**

- Krämer IV.3 and SchemeKTheory:S.7: The GRR identity uses this rational character; the higher K-theory roadmap imports the geometric construction for its comparisons.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.chernCharacter_exact | compatibility | The character is additive on an exact sequence in the stated locally free/coherent scope. |
| TauCeti.AlgebraicGeometry.Intersection.chernCharacter_tensor | relation | For locally free E,F, ch(E⊗F)=ch(E)ch(F). |
| TauCeti.AlgebraicGeometry.Intersection.chernCharacter_line | simp | For a line bundle ch(L) is the exponential of c₁(L), truncated at dimension n. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.chernCharacter_test_rank_two_point | computation | At a rational point the free rank-two module has character 2. |
| TauCeti.AlgebraicGeometry.Intersection.chernCharacter_test_zero | degenerate | The zero coherent module has zero character. |
| TauCeti.AlgebraicGeometry.Intersection.chernCharacter_test_line_c2 | non-example | A line on P² has degree-two character h²/2 although its second Chern class vanishes. |

**Suggested-signature boundary.** Smooth pure dimension, finite local freeness or the coherent finite-resolution conditions are omitted. Tensor and finite rational polynomial helpers use the native modules and direct-sum Chow carrier, with the stated smooth ring structure; no arbitrary singular Chow ring instance is introduced.

<a id="todd-class"></a>

### Todd classes

**Construction** · `SchemeAndStackFoundations:SF.5/todd-class` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.todd`.

For a finite locally free bundle E on a smooth pure n-dimensional scheme, td(E)=∏ α_i/(1−exp(−α_i)) in the dimension-truncated rational Chow ring. Its terms begin 1+c₁/2+(c₁²+c₂)/12+c₁c₂/24. It is multiplicative on exact sequences and has constant term 1, hence an inverse because the positive-degree ideal of the dimension-truncated graded ring is nilpotent. Define td(T_X) using the tangent bundle on a smooth variety.

**Hypotheses.** Finite locally free bundle and smooth pure finite-dimensional scheme; rational coefficients.

**Construction or proof.**

1. Use the symmetric polynomial expansion in Chern roots and descend from the flag bundle. Whitney gives multiplicativity; a finite geometric series in the positive-degree part gives the inverse.

**Direct prerequisites.** [Rational Chern characters](#chern-character) (`SchemeAndStackFoundations:SF.5/chern-character`); [Complete flag bundles](#flag-bundle) (`SchemeAndStackFoundations:SF.5/flag-bundle`); [Whitney sum formula](#whitney) (`SchemeAndStackFoundations:SF.5/whitney`); `SchemeAndStackFoundations:SF.2`.

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.1 Proposition 1.2 and Lemma 1.3, printed pp. 112–114. Todd polynomials, multiplicativity and the Koszul character identity required by regular-embedding RR.

**Uses that determine the interface.**

- Krämer IV.3 and StableReductionPartII:MC.5: Smooth projective GRR needs td(T); a nodal-family determinant formula requires its own additional singular RR comparison, recorded as a gap.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.todd_exact | relation | td(E)=td(E′)td(E″) for an exact sequence of finite locally free modules. |
| TauCeti.AlgebraicGeometry.Intersection.todd_zero | simp | The zero bundle has Todd class 1. |
| TauCeti.AlgebraicGeometry.Intersection.todd_inverse | data | Multiplying td(E) by its finite inverse gives the unit of the truncated rational Chow ring. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.todd_test_p1 | computation | The degree-one Todd number of P¹ is 1, since c₁(T_P¹)=2h. |
| TauCeti.AlgebraicGeometry.Intersection.todd_test_p2 | computation | The degree-two Todd number of P² is (9+3)/12=1. |
| TauCeti.AlgebraicGeometry.Intersection.todd_test_trivial | degenerate | The trivial line has Todd class 1 in every dimension. |

**Suggested-signature boundary.** The smooth pure-dimension and finite locally free hypotheses are omitted. The tangent bundle is the dual of the imported smooth cotangent module; the SF.2 smooth-proper duality node supplies canonical sheaf compatibility, not a new duality theory.

<a id="koszul-character"></a>

### Koszul character identity

**Theorem** · `SchemeAndStackFoundations:SF.5/koszul-character` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.koszul_character`.

For a rank-r bundle E, ch(λ₋₁E∨)=c_r(E)td(E)⁻¹. If its section is regular, the associated Koszul complex resolves the zero-scheme structure sheaf, so this virtual expression is its coherent character. This is a minimal alternating exterior-power formula, not a new general λ-ring.

**Hypotheses.** Finite locally free E; smooth rational intersection ring; regular section for the resolution assertion.

**Construction or proof.**

1. After injective flag pullback, multiply ∏(1−exp(−α_i))=∏α_i·td(E)⁻¹. Exactness of a regular-sequence Koszul complex gives the coherent comparison.

**Direct prerequisites.** [Todd classes](#todd-class) (`SchemeAndStackFoundations:SF.5/todd-class`); [Top Chern class of a regular section](#chern-regular-section) (`SchemeAndStackFoundations:SF.5/chern-regular-section`); [Finite locally free resolutions](#finite-resolutions) (`SchemeAndStackFoundations:SF.5/finite-resolutions`); [Complete flag bundles](#flag-bundle) (`SchemeAndStackFoundations:SF.5/flag-bundle`); `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.1 Lemma 1.3, printed p. 114; IV.3 zero-section proof, pp. 119–120. The identity supplies the top Chern and inverse Todd factors for zero-section RR.

**Acceptance.**

- For the zero section of O(1) over P², ch(O_Z)=1−exp(−h)=h−h²/2.

**Suggested-signature boundary.** Finite local freeness, rank, smooth dimension and regularity are omitted. The missing general Koszul construction and exactness are explicitly requested from the lower algebra foundations owner.

<a id="projective-space-rr"></a>

### Riemann–Roch on projective space

**Theorem** · `SchemeAndStackFoundations:SF.5/projective-space-rr` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.projective_space_rr`.

For P^n and O(m), with every integer m, χ(O(m))=binom(m+n,n), using the polynomial binomial convention for negative m. Equivalently the degree-n coefficient of exp(mh)(h/(1−exp(−h)))^(n+1) is this Euler characteristic.

**Hypotheses.** Projective space over an algebraically closed field; all m∈ℤ; ordinary coherent Euler characteristic.

**Construction or proof.**

1. Compute the cohomology of O(m) and its Euler sum. In the Chow ring ℚ[h]/(h^(n+1)), use the tangent Euler sequence and the residue substitution from the source to compute the same coefficient.

**Direct prerequisites.** [Todd classes](#todd-class) (`SchemeAndStackFoundations:SF.5/todd-class`); [Rational Chern characters](#chern-character) (`SchemeAndStackFoundations:SF.5/chern-character`); [Projective bundle formula](#projective-bundle-formula) (`SchemeAndStackFoundations:SF.5/projective-bundle-formula`); `SchemeAndStackFoundations:SF.2`.

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.3 Proposition 3.1, printed pp. 118–119. The projective-space polynomial RR computation is the projection step.

**Acceptance.**

- On P², O(−3) has χ=1 and O(−1) has χ=0; truncating to nonnegative m would miss the resolution use.

**Suggested-signature boundary.** The source hypotheses above govern the declaration.

<a id="zero-section-rr"></a>

### Riemann–Roch for zero sections

**Theorem** · `SchemeAndStackFoundations:SF.5/zero-section-rr` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.zero_section_rr`.

For the zero section i:X→V(E) of a bundle on a smooth quasiprojective variety, ch(i_*M)=i_*(ch(M)td(E)⁻¹). Use the projective completion to prove the identity and restrict to the vector bundle. With the quotient convention that completion is P(E∨⊕O); the lines convention in Krämer writes P(E⊕O).

**Hypotheses.** Smooth quasiprojective varieties over an algebraically closed field; coherent M; vector bundle E.

**Construction or proof.**

1. For M locally free use its pulled-back Koszul resolution. Apply the Koszul character identity and top Chern zero-locus formula. Finite resolutions extend to all coherent M; localization restricts the completion formula.

**Direct prerequisites.** [Koszul character identity](#koszul-character) (`SchemeAndStackFoundations:SF.5/koszul-character`); [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`); [Top Chern class of a regular section](#chern-regular-section) (`SchemeAndStackFoundations:SF.5/chern-regular-section`); [Localization for Chow homology](#chow-localization) (`SchemeAndStackFoundations:SF.5/chow-localization`); [Projection formula for first Chern operators](#chern-projection) (`SchemeAndStackFoundations:SF.5/chern-projection`); [Commutation of first Chern operators](#chern-commutation) (`SchemeAndStackFoundations:SF.5/chern-commutation`); [Flat compatibility of first Chern operators](#chern-flat) (`SchemeAndStackFoundations:SF.5/chern-flat`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), Proof of IV.3 Theorem 3.2, Step 1, printed pp. 119–120. Zero-section RR is established on the projective completion by a Koszul resolution.

**Acceptance.**

- For a line zero section the correction factor begins 1−c₁(E)/2; its sign distinguishes normal from conormal.

**Suggested-signature boundary.** Smoothness, quasiprojectivity and coherence are omitted. Each side denotes the displayed independently constructed rational Chow expression, with the zero-section proper push; no conclusion is a premise.

<a id="regular-embedding-rr"></a>

### Riemann–Roch for regular embeddings

**Theorem** · `SchemeAndStackFoundations:SF.5/regular-embedding-rr` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.regular_embedding_rr`.

For a closed immersion i:X→Y between smooth quasiprojective varieties, ch(i_*M)=i_*(ch(M)td(N_i)⁻¹). The normal tangent exact sequence converts this to ch(i_*M)td(T_Y)=i_*(ch(M)td(T_X)).

**Hypotheses.** Closed immersion of smooth quasiprojective varieties over an algebraically closed field; coherent M.

**Construction or proof.**

1. Deform to the normal bundle. Extend M to the deformation using a finite locally free resolution. Apply zero-section RR to the normal fibre and specialization compatibilities to the original fibre. Use the normal tangent exact sequence for the Todd conversion.

**Direct prerequisites.** [Deformation to the normal cone](#normal-deformation) (`SchemeAndStackFoundations:SF.5/normal-deformation`); [Specialization of Chow classes](#specialization) (`SchemeAndStackFoundations:SF.5/specialization`); [Riemann–Roch for zero sections](#zero-section-rr) (`SchemeAndStackFoundations:SF.5/zero-section-rr`); [Finite locally free resolutions](#finite-resolutions) (`SchemeAndStackFoundations:SF.5/finite-resolutions`); [Todd classes](#todd-class) (`SchemeAndStackFoundations:SF.5/todd-class`); [Proper compatibility of refined Gysin](#gysin-proper-flat) (`SchemeAndStackFoundations:SF.5/gysin-proper-flat`); [Flat compatibility of refined Gysin](#gysin-flat) (`SchemeAndStackFoundations:SF.5/gysin-flat`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), Proof of IV.3 Theorem 3.2, Step 2, printed pp. 120–122. The deformation argument proves regular-embedding RR with the inverse normal Todd factor.

**Acceptance.**

- Embedding a smooth plane degree-d curve recovers its arithmetic genus from the degree-two component.

**Suggested-signature boundary.** Smoothness, quasiprojectivity, coherence and dimensions are omitted; the two helpers are the rational Chow expressions specified above.

<a id="projective-grr"></a>

### Projective Grothendieck–Riemann–Roch

**Theorem** · `SchemeAndStackFoundations:SF.5/projective-grr` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.projective_grr`.

For a projective morphism f:X→Y of smooth quasiprojective varieties over an algebraically closed field and coherent M, Σ_i(−1)^i ch(R^i f_*M)·td(T_Y)=f_*(ch(M)·td(T_X)) in CH^*(Y;ℚ). The higher direct images are coherent and vanish beyond a finite bound. This source proves projective GRR in all characteristics; it does not prove arbitrary proper, singular, nodal-family, or stack GRR.

**Hypotheses.** f projective; X and Y smooth quasiprojective over the same algebraically closed field; coherent M; rational coefficients.

**Construction or proof.**

1. Factor f through a closed immersion into Y×P^N and its projection. Apply regular-embedding RR. Resolve modules for the projection by twists O(m) over Y and use projective-space RR, the projection formula and the higher-direct-image composition comparison.

**Direct prerequisites.** [Riemann–Roch for regular embeddings](#regular-embedding-rr) (`SchemeAndStackFoundations:SF.5/regular-embedding-rr`); [Riemann–Roch on projective space](#projective-space-rr) (`SchemeAndStackFoundations:SF.5/projective-space-rr`); [Finite locally free resolutions](#finite-resolutions) (`SchemeAndStackFoundations:SF.5/finite-resolutions`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`); `SchemeAndStackFoundations:SF.2`.

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.3 Theorem 3.2 and Step 3 of its proof, printed pp. 119–123. Exactly the projective smooth-quasiprojective theorem and its finite-resolution/projection proof.

**Acceptance.**

- For P¹→Spec k and O(m), either side is m+1 for every integer m.

**Suggested-signature boundary.** Projectivity, common algebraically closed field, smoothness, quasiprojectivity, coherence and dimensions are omitted. IsProper alone is insufficient; the two independently defined sides contain the finite alternating higher images and the rational proper Chow push.

<a id="hirzebruch-rr"></a>

### Hirzebruch–Riemann–Roch

**Theorem** · `SchemeAndStackFoundations:SF.5/hirzebruch-rr` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.hirzebruch_rr`.

For a smooth projective n-dimensional variety over an algebraically closed field and coherent M, χ(M)=deg([ch(M)td(T_X)]_n). For a surface this gives χ(O_X)=(K_X²+c₂(T_X))/12 and χ(L)=χ(O_X)+(c₁(L)²−c₁(L)K_X)/2.

**Hypotheses.** Smooth projective variety; coherent module; finite-dimensional coherent cohomology and finite vanishing.

**Construction or proof.**

1. Apply projective GRR to the structure map. The rational Chow ring of a point is ℚ and its Todd class is 1. Extract the surface degree-two polynomials.

**Direct prerequisites.** [Projective Grothendieck–Riemann–Roch](#projective-grr) (`SchemeAndStackFoundations:SF.5/projective-grr`); [Todd classes](#todd-class) (`SchemeAndStackFoundations:SF.5/todd-class`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`).

**Source support.**

- [Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.3 Corollary 3.3, printed p. 123. The structure-map specialization gives the Euler characteristic formula.

**Acceptance.**

- For O(m) on P² this is (m+1)(m+2)/2.

**Suggested-signature boundary.** Smooth projective, algebraically closed field, dimension n and coherence hypotheses are omitted.

## Generation and projective positivity

Global generation is an evaluation epimorphism of native modules. On a quasi-compact scheme the chosen finite family form agrees with global generation of a coherent module. Semiampleness asks for a generated positive power; very ampleness asks for O(1) under a projective immersion; ampleness asks for a very ample positive power in the projective field setting. In particular the trivial line on P¹ is semiample but not ample. These definitions are inputs to both the surface proof and Keel's theorem.

<a id="global-generation"></a>

### Global generation of coherent modules

**Definition** · `SchemeAndStackFoundations:SF.5/global-generation` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.IsGloballyGenerated`.

A finite-type quasi-coherent module M on a quasi-compact scheme is globally generated when finitely many sections give a surjective evaluation O_X^n→M. This finite definition agrees in this scope with generation by an arbitrary family: stalkwise finite generation and quasi-compactness yield a finite subfamily. Tensor products and pullbacks of generated modules are generated. For a line, this is the basepoint-free condition.

**Hypotheses.** Projective finite-type scheme over a field unless an API states broader scope.

**Construction or proof.**

1. Use native invertible sheaves and section evaluation; establish the stated tensor, power and restriction laws from the numbered sources.

**Direct prerequisites.** `mathlib:AlgebraicGeometry.Scheme.Modules`; `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [The Stacks Project Authors, Sheaves of Modules](https://stacks.math.columbia.edu/download/modules.pdf), Definition 17.4.1 and Lemmas 17.4.2–17.4.3, tags 01AM–01AO, pp. 4–5. Generation is evaluation surjectivity, detected on stalks and preserved by tensor.
- [The Stacks Project Authors, Properties of Schemes](https://stacks.math.columbia.edu/download/properties.pdf), Proposition 28.27.13, tag 01Q3, proof, pp. 45–46. For finite-type modules on a quasi-compact scheme the generating family can be made finite.

**Uses that determine the interface.**

- GeometricSatakeWitt:GS.0, StableReductionPartII:MC.4 and AlgebraicModuliForArithmeticGeometry:R09.1: Determinant ampleness and moduli projective embeddings use the shared positivity definitions.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.IsGloballyGenerated.trivial | simp | The unit module is generated by its unit section. |
| TauCeti.AlgebraicGeometry.Intersection.IsGloballyGenerated.tensor | relation | Generated line bundles have generated tensor product. |
| TauCeti.AlgebraicGeometry.Intersection.IsGloballyGenerated.pullback | functoriality | Pullback of a globally generated line is globally generated. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.globalGeneration_test_zero | degenerate | The zero module is generated by the empty family. |
| TauCeti.AlgebraicGeometry.Intersection.globalGeneration_test_p1_o1 | computation | The two coordinate sections generate O(1) on P¹. |
| TauCeti.AlgebraicGeometry.Intersection.globalGeneration_test_p1_negative | non-example | O(−1) on P¹ has no nonzero section and is not globally generated. |

**Suggested-signature boundary.** The finite-type/quasi-compact hypotheses for equivalence with arbitrary-family generation are omitted. The concrete finite evaluation body is valid as a predicate on all native modules; it does not identify a large module with its finite generation.

<a id="projective-positivity"></a>

### Semiample line bundles

**Definition** · `SchemeAndStackFoundations:SF.5/projective-positivity` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.IsSemiample`.

An invertible sheaf L is semiample if L^m is globally generated for some integer m>0. Positive powers, arbitrary pullbacks and tensor products of semiample lines are semiample. The trivial line is semiample even on a positive-dimensional projective scheme where it is not ample.

**Hypotheses.** Projective finite-type scheme over a field unless an API states broader scope.

**Construction or proof.**

1. Use native invertible sheaves and section evaluation; establish the stated tensor, power and restriction laws from the numbered sources.

**Direct prerequisites.** [Global generation of coherent modules](#global-generation) (`SchemeAndStackFoundations:SF.5/global-generation`); `SchemeAndStackFoundations:SF.3`.

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Introduction and Definition 0.0, printed pp. 253–254; Section 1, pp. 259–261. Semiample powers and ample twists are the input language of the theorem.

**Uses that determine the interface.**

- GeometricSatakeWitt:GS.0, StableReductionPartII:MC.4 and AlgebraicModuliForArithmeticGeometry:R09.1: Determinant ampleness and moduli projective embeddings use the shared positivity definitions.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.IsSemiample.power | functoriality | Every positive tensor power of a semiample line is semiample. |
| TauCeti.AlgebraicGeometry.Intersection.IsSemiample.trivial | simp | The trivial line is semiample. |
| TauCeti.AlgebraicGeometry.Intersection.IsGloballyGenerated.semiample | compatibility | A generated line is semiample using exponent one. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.semiample_test_p1_o1 | computation | O(1) on P¹ is semiample. |
| TauCeti.AlgebraicGeometry.Intersection.semiample_test_p1_trivial | degenerate | The trivial line is semiample on P¹. |
| TauCeti.AlgebraicGeometry.Intersection.semiample_test_p1_negative | non-example | No positive power of O(−1) on P¹ is generated. |

**Suggested-signature boundary.** The tensor-power helper is the exact imported SF.3/Jacobian operation. Projectivity is needed for the numerical comparisons, not for the displayed power-of-generated predicate.

<a id="very-ample"></a>

### Very ample line bundles

**Definition** · `SchemeAndStackFoundations:SF.5/very-ample` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.IsVeryAmple`.

On a projective k-scheme, L is very ample if some closed k-immersion i:X→P^n_k identifies L with i*O(1). This agrees with relative very ampleness over k: finite type gives a finite projective space and properness makes the immersion closed. The quotient O(1) convention is retained. Positive powers and restriction to closed subschemes are very ample.

**Hypotheses.** Projective finite-type scheme over a field unless an API states broader scope.

**Construction or proof.**

1. Use native invertible sheaves and section evaluation; establish the stated tensor, power and restriction laws from the numbered sources.

**Direct prerequisites.** [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`); [Global generation of coherent modules](#global-generation) (`SchemeAndStackFoundations:SF.5/global-generation`); `SchemeAndStackFoundations:SF.3`.

**Source support.**

- [The Stacks Project Authors, Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf), Definition 29.39.1, Lemmas 29.39.2/8 and 29.40.1, tags 01VM, 01VN, 0B3F and 02NP, pp. 86–90; Lemma 29.40.3 proof, p. 91. The embedding definition, finite-type reduction and Segre proof give the stated projective scope.

**Uses that determine the interface.**

- GeometricSatakeWitt:GS.0, StableReductionPartII:MC.4 and AlgebraicModuliForArithmeticGeometry:R09.1: Determinant ampleness and moduli projective embeddings use the shared positivity definitions.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.IsVeryAmple.generated | compatibility | A very ample line is generated by the pulled-back projective coordinates. |
| TauCeti.AlgebraicGeometry.Intersection.IsVeryAmple.power | relation | A positive tensor power of a very ample line is very ample by Veronese. |
| TauCeti.AlgebraicGeometry.Intersection.IsVeryAmple.closed_restriction | functoriality | Closed restriction preserves very ampleness. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.veryAmple_test_p1_o1 | computation | O(1) on P¹ is very ample. |
| TauCeti.AlgebraicGeometry.Intersection.veryAmple_test_p2_o1 | compatibility | O(1) on P² gives the identity projective embedding. |
| TauCeti.AlgebraicGeometry.Intersection.veryAmple_test_p1_trivial | non-example | The constant map given by the trivial line cannot embed P¹. |

**Suggested-signature boundary.** Projectivity/finite type are omitted from ambient parameters; the closed restriction API also omits i.IsOver. The body explicitly includes an over-k closed immersion, so no arbitrary morphism is called a projective embedding.

<a id="ample"></a>

### Ample line bundles

**Definition** · `SchemeAndStackFoundations:SF.5/ample` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.IsAmple`.

On a projective k-scheme, L is ample if a positive power is very ample. This agrees with the general ample-section definition by the finite-type embedding criterion. Every sufficiently large power is very ample and globally generated. Ample restriction to a closed subscheme is ample; ample lines are semiample and numerically nef.

**Hypotheses.** Projective finite-type scheme over a field unless an API states broader scope.

**Construction or proof.**

1. Use native invertible sheaves and section evaluation; establish the stated tensor, power and restriction laws from the numbered sources.

**Direct prerequisites.** [Very ample line bundles](#very-ample) (`SchemeAndStackFoundations:SF.5/very-ample`); [Semiample line bundles](#projective-positivity) (`SchemeAndStackFoundations:SF.5/projective-positivity`).

**Source support.**

- [The Stacks Project Authors, Properties of Schemes](https://stacks.math.columbia.edu/download/properties.pdf), Definition 28.27.1, Lemmas 28.27.2–3 and Proposition 28.27.13, tags 01PS–01PU and 01Q3, pp. 41 and 44–46. Ample powers, closed restriction and eventual generation.
- [The Stacks Project Authors, Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf), Lemmas 29.40.3–5, tags 01VS–01VU, pp. 90–92. Finite type over the affine field base makes ampleness equivalent to a very ample positive power.

**Uses that determine the interface.**

- GeometricSatakeWitt:GS.0, StableReductionPartII:MC.4 and AlgebraicModuliForArithmeticGeometry:R09.1: Determinant ampleness and moduli projective embeddings use the shared positivity definitions.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.IsAmple.semiample | compatibility | Ample implies semiample. |
| TauCeti.AlgebraicGeometry.Intersection.IsAmple.power | relation | For m>0, L^m is ample exactly when L is. |
| TauCeti.AlgebraicGeometry.Intersection.IsAmple.closed_restriction | functoriality | Restriction of an ample line to a closed subscheme is ample. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.ample_test_p1_o1 | computation | O(1) on P¹ is ample. |
| TauCeti.AlgebraicGeometry.Intersection.ample_test_p1_trivial | non-example | The trivial line on P¹ is not ample despite being semiample. |
| TauCeti.AlgebraicGeometry.Intersection.ample_test_p1_negative | non-example | O(−1) on P¹ is not ample. |

**Suggested-signature boundary.** Projectivity/finite type are ambient source hypotheses; the restriction API omits i.IsOver. The power-of-embedding predicate is intentionally the absolute projective-field form, not general relative ampleness over an arbitrary noncompact base.

## Surfaces and the Weil bound

The surface pairing specializes the dimension-two smooth Chow product. Adjunction uses curve canonical degree; surface RR uses the unique smooth-proper coherent-duality input. Bertini is used for sufficiently high very ample twists, including in positive characteristic. Hodge index asserts D·H=0 implies D²≤0 for ample H; its converse fails. Its Cauchy inequality includes zero-square classes and gives the Frobenius graph estimate after every finite extension.

<a id="surface-pairing"></a>

### Surface intersection pairings

**Construction** · `SchemeAndStackFoundations:SF.5/surface-pairing` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.surfacePair`.

On a smooth projective integral surface over an algebraically closed field, Cartier divisors or their Picard line classes have the integer symmetric bilinear pairing (D,E)=deg(c₁(O(D))c₁(O(E))∩[S]). Properly meeting effective divisors use the sum of local intersection lengths. The pairing is invariant under linear equivalence; a general self-intersection uses the normal-line rule rather than an improper local length.

**Hypotheses.** Smooth projective integral surface; algebraically closed field; divisor-to-line comparison from Jacobian/SF.3.

**Construction or proof.**

1. Use Cartier line classes and commuting first Chern operators, then degree. Linear equivalence makes principal classes trivial; proper local intersections match Cartier lengths.

**Direct prerequisites.** [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Projection formula for first Chern operators](#chern-projection) (`SchemeAndStackFoundations:SF.5/chern-projection`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`); [Gysin maps for Cartier divisors](#cartier-gysin) (`SchemeAndStackFoundations:SF.5/cartier-gysin`); `SchemeAndStackFoundations:SF.3`; [Commutation of first Chern operators](#chern-commutation) (`SchemeAndStackFoundations:SF.5/chern-commutation`); [Flat compatibility of first Chern operators](#chern-flat) (`SchemeAndStackFoundations:SF.5/chern-flat`).

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Theorem 11.9, Proposition 11.11 and Theorem 11.14, pp. 8–10. The local/global divisor pairing and its linear-equivalence invariance.

**Uses that determine the interface.**

- WeilConjectures:WC.5:surface-alternative and Milne 11.27–11.55: Adjunction, Hodge index and Frobenius graph calculations use the same symmetric numerical pairing.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.surfacePair_comm | relation | The surface pairing is symmetric. |
| TauCeti.AlgebraicGeometry.Intersection.surfacePair_add | structure | The pairing is additive in either divisor. |
| TauCeti.AlgebraicGeometry.Intersection.surfacePair_chern | compatibility | The native Weil divisor line comparison identifies this pairing with the two first Chern cap degree. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.surfacePair_test_plane_line | computation | A line in P² has square 1. |
| TauCeti.AlgebraicGeometry.Intersection.surfacePair_test_rulings | non-example | Two distinct ruling classes of P¹×P¹ pair to 1 while one ruling has square 0. |
| TauCeti.AlgebraicGeometry.Intersection.surfacePair_test_zero | degenerate | The zero divisor pairs to zero. |

**Suggested-signature boundary.** Smooth projective integral surface, algebraically closed ground field and its dimension grading are omitted. On these regular schemes native Weil divisors are Cartier; divisorToLine is the imported Jacobian Layer A comparison.

<a id="surface-adjunction"></a>

### Adjunction for surface curves

**Theorem** · `SchemeAndStackFoundations:SF.5/surface-adjunction` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.surface_adjunction`.

For a smooth curve C embedded as an effective divisor in a smooth projective surface S, ω_C≅(ω_S⊗O_S(C))|C, so 2g(C)−2=C·(C+K_S). In particular a smooth degree-d plane curve has genus (d−1)(d−2)/2, and the diagonal in C×C has square 2−2g(C).

**Hypotheses.** Smooth projective integral surface and smooth projective curve; algebraically closed field; canonical line from coherent duality.

**Construction or proof.**

1. Take determinants of the conormal exact sequence, identify the normal line O(C)|C and use the imported canonical degree of a curve.

**Direct prerequisites.** [Surface intersection pairings](#surface-pairing) (`SchemeAndStackFoundations:SF.5/surface-pairing`); [Normal cones and normal bundles](#normal-cone) (`SchemeAndStackFoundations:SF.5/normal-cone`); `SchemeAndStackFoundations:SF.2/smooth-proper`; `SchemeAndStackFoundations:SF.3`; `SchemeAndStackFoundations:key/coherent-duality`.

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Theorem 11.27 and Examples 11.28–11.30, pp. 18–21. Adjunction, the plane genus and diagonal degree.

**Acceptance.**

- A smooth plane cubic has genus 1 and diagonal square 0; a line has genus 0.

**Suggested-signature boundary.** Smooth proper surface/curve, Cartier condition and the ground field are omitted.

<a id="surface-bertini"></a>

### Bertini and ample twists on surfaces

**Theorem** · `SchemeAndStackFoundations:SF.5/surface-bertini` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.surface_smooth_difference`.

Over an algebraically closed field, sufficiently high ample twists of any divisor on a smooth projective surface admit smooth effective representatives. Consequently every divisor class is a difference of smooth effective divisors. The tangent-incidence proof is valid in this very ample setting in every characteristic; it does not assert smooth members of arbitrary positive-characteristic base-point-free systems.

**Hypotheses.** Smooth projective surface over an algebraically closed field; an ample line bundle and sufficiently high power.

**Construction or proof.**

1. Serre vanishing makes large twists very ample. In the resulting projective embedding, the hyperplanes containing the tangent plane form an incidence variety of smaller dimension than the dual projective space. Choose a hyperplane outside its image.

**Direct prerequisites.** [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`); `SchemeAndStackFoundations:SF.2`; [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`); [Very ample line bundles](#very-ample) (`SchemeAndStackFoundations:SF.5/very-ample`).

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Theorem 11.45 and Corollaries 11.46–11.47, pp. 30–33. The incidence proof and large-twist application provide smooth divisor representatives.

**Acceptance.**

- On P² a line is the difference of a smooth conic and another line after a suitable linear-equivalence replacement.

**Suggested-signature boundary.** Smooth projective surface, algebraically closed ground field, and smooth effective representatives E,F are omitted. The signature retains native linear equivalence D∼E−F, rather than equality of Weil divisors.

<a id="surface-weak-rr"></a>

### Euler characteristic recurrence on surfaces

**Theorem** · `SchemeAndStackFoundations:SF.5/surface-weak-rr` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.surface_euler_rr`.

For a divisor D on a smooth projective surface, χ(O(D))−χ(O_S)=D·(D−K_S)/2. Prove this directly from the exact restriction sequence for smooth effective divisors and curve Riemann–Roch, then write a divisor class as the difference of such divisors. This route supplies the surface formula independently of the stronger GRR theorem.

**Hypotheses.** Smooth projective integral surface over an algebraically closed field; canonical divisor class.

**Construction or proof.**

1. For smooth C use 0→O(D−C)→O(D)→O_C(D)→0, curve χ and adjunction. The recurrence telescopes for the smooth difference representation; bilinearity gives the displayed quadratic expression.

**Direct prerequisites.** [Adjunction for surface curves](#surface-adjunction) (`SchemeAndStackFoundations:SF.5/surface-adjunction`); [Bertini and ample twists on surfaces](#surface-bertini) (`SchemeAndStackFoundations:SF.5/surface-bertini`); [Surface intersection pairings](#surface-pairing) (`SchemeAndStackFoundations:SF.5/surface-pairing`); `SchemeAndStackFoundations:SF.3`; `SchemeAndStackFoundations:SF.2`.

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Theorem 11.35, pp. 23–24. The proof reduces the surface Euler characteristic to curve RR and divisor exact sequences.

**Acceptance.**

- On P², K=−3H and χ(O(d))=1+d(d+3)/2.

**Suggested-signature boundary.** Surface, field, coherence and canonical-divisor identification of K are omitted.

<a id="surface-rr"></a>

### Riemann–Roch for smooth projective surfaces

**Theorem** · `SchemeAndStackFoundations:SF.5/surface-rr` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.surface_riemann_roch`.

For a divisor D on a smooth projective surface, h⁰(D)−h¹(D)+h⁰(K_S−D)=χ(O_S)+D·(D−K_S)/2. The equality h²(D)=h⁰(K_S−D) is the imported SF.2 Serre duality theorem, not a newly planned duality theory.

**Hypotheses.** Smooth projective integral surface over an algebraically closed field; finite coherent cohomology and canonical line.

**Construction or proof.**

1. Combine the Euler recurrence with the exact SF.2 proper Serre-duality node and its smooth-proper canonical identification.

**Direct prerequisites.** [Euler characteristic recurrence on surfaces](#surface-weak-rr) (`SchemeAndStackFoundations:SF.5/surface-weak-rr`); `SchemeAndStackFoundations:SF.2/serre-proper`; `SchemeAndStackFoundations:SF.2/smooth-proper`; `SchemeAndStackFoundations:key/coherent-duality`.

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Theorems 11.37 and 11.44, pp. 24 and 29. Serre duality turns weak Euler RR into the h⁰/h¹ formula.

**Acceptance.**

- For D=0 the formula gives h⁰(O)−h¹(O)+h⁰(K)=χ(O).

**Suggested-signature boundary.** The smooth projective surface, base field and canonical identity of K are omitted; the h⁰/h¹ helpers denote native coherent-cohomology dimensions under finite-dimensionality certificates.

<a id="hodge-index"></a>

### Hodge index theorem

**Theorem** · `SchemeAndStackFoundations:SF.5/hodge-index` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.hodge_index`.

For a smooth projective integral surface over an algebraically closed field, an ample divisor H and any divisor D with D·H=0 satisfy D²≤0. On divisors modulo the radical of numerical equivalence the real intersection form has one positive direction and all other directions negative. The inequality is one-way: D²≤0 does not imply D·H=0.

**Hypotheses.** Smooth projective integral surface over an algebraically closed field; H ample.

**Construction or proof.**

1. Assume D²>0. Surface RR makes the sum of section dimensions for ±mD grow quadratically. The ample degree-zero constraint bounds those sections and the dual sections after choosing a fixed smooth ample curve; restriction and its exact sequence give a bound independent of m. This contradiction proves the inequality. Linear algebra on the numerical quotient gives the signature.

**Direct prerequisites.** [Riemann–Roch for smooth projective surfaces](#surface-rr) (`SchemeAndStackFoundations:SF.5/surface-rr`); [Bertini and ample twists on surfaces](#surface-bertini) (`SchemeAndStackFoundations:SF.5/surface-bertini`); [Surface intersection pairings](#surface-pairing) (`SchemeAndStackFoundations:SF.5/surface-pairing`); `SchemeAndStackFoundations:SF.3`; [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`).

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Lemma 11.49, Theorem 11.50 and Corollaries 11.51–11.52, pp. 35–36. The section bound, one-way Hodge inequality and numerical signature. The implication symbol was checked visually because text extraction corrupts it.
- [Alexandre Grothendieck; public transcription by Denise Vella-Chemla, Sur une note de Mattuck–Tate](https://denisevellachemla.eu/AG-Mattuck-Tate.pdf), Theorem 1.1 and Proposition 2.1, transcription pp. 1 and 4–6 (original article pp. 208–215). The section-growth proof gives the ample orthogonality inequality in every characteristic; the finite-dimensional Néron–Severi assertion is not used as an unexplained prerequisite.

**Acceptance.**

- On P¹×P¹, H=A+B and D=A−B give D·H=0 and D²=−2. The ruling A has square 0 but A·H=1, refuting the converse.

**Suggested-signature boundary.** Smooth projective integral surface and algebraic closedness of the ground field are omitted. The field, ampleness of H and ample orthogonality are explicit. The full numerical-radical quotient signature has its own recorded SF.5 gap; numerical and algebraic equivalence are not identified.

<a id="hodge-cauchy"></a>

### Cauchy inequality on the ample orthogonal space

**Theorem** · `SchemeAndStackFoundations:SF.5/hodge-cauchy` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.hodge_cauchy`.

If D·H=E·H=0 for ample H, then (D·E)²≤D²E². Both squares on the right are nonpositive. This includes zero-square classes and follows from the nonpositive quadratic form on span(D,E), without assuming either class has strictly negative square.

**Hypotheses.** The Hodge-index surface hypotheses and ample orthogonality for both classes.

**Construction or proof.**

1. Apply Hodge index to aD+bE for integers a,b. Extend the rational homogeneous inequality to reals or use the discriminant directly; its discriminant is nonpositive, including the degenerate case.

**Direct prerequisites.** [Hodge index theorem](#hodge-index) (`SchemeAndStackFoundations:SF.5/hodge-index`); [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`).

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Corollaries 11.53–11.54, p. 37. The Castelnuovo–Severi and Cauchy defect inequalities specialize the Hodge form.
- [Alexandre Grothendieck; public transcription by Denise Vella-Chemla, Sur une note de Mattuck–Tate](https://denisevellachemla.eu/AG-Mattuck-Tate.pdf), Section 1, formulas (1.5)–(1.8), transcription pp. 2–3. The two-ruling defect form gives the same product-of-curves inequality.

**Acceptance.**

- For E=D on P¹×P¹ with D=A−B, equality is 4=4.

**Suggested-signature boundary.** Smooth projective integral surface and algebraic closedness are omitted. The field, ampleness and both orthogonality hypotheses are explicit.

<a id="curve-product-graphs"></a>

### Diagonal and graph intersections on curve products

**Theorem** · `SchemeAndStackFoundations:SF.5/curve-product-graphs` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.graph_normal_degree`.

For smooth projective geometrically connected C,D over an algebraically closed field and a finite morphism φ:C→D of degree e, the graph Γ has normal line φ*T_D and square e(2−2g(D)); inseparability causes no exception. For C×C with A={P}×C, B=C×{P}, one has A²=B²=0, A·B=1, Δ·A=Δ·B=1, Δ²=2−2g. Moreover Γ·A=1 and Γ·B=e for Γ=(x,φ(x)).

**Hypotheses.** Smooth projective geometrically connected curves; finite φ; algebraically closed field for the chosen point.

**Construction or proof.**

1. The graph section of the first projection identifies its normal quotient with φ*T_D even if dφ=0. Curve canonical degree and self-intersection give its square. Projection to the two factors gives the ruling intersections.

**Direct prerequisites.** [Adjunction for surface curves](#surface-adjunction) (`SchemeAndStackFoundations:SF.5/surface-adjunction`); [Self-intersection formula](#gysin-self-intersection) (`SchemeAndStackFoundations:SF.5/gysin-self-intersection`); [Surface intersection pairings](#surface-pairing) (`SchemeAndStackFoundations:SF.5/surface-pairing`); `SchemeAndStackFoundations:SF.3`; [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`).

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Examples 11.15, 11.30 and 11.55, pp. 10, 21 and 37–38. Rulings, diagonal and graph normal degree, including the inseparable case.

**Acceptance.**

- For C=P¹ and φ the q-power Frobenius, Γ²=2q, Γ·A=1 and Γ·B=q.

**Suggested-signature boundary.** The actual smooth curve graph/degree/genus data are omitted from this numerical signature; graphSelfNumber denotes their independently constructed surface intersection number.

<a id="frobenius-fixed-points"></a>

### Frobenius fixed points and intersection numbers

**Theorem** · `SchemeAndStackFoundations:SF.5/frobenius-fixed-points` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.frobenius_diagonal_count`.

For a smooth projective geometrically connected curve C/F_q and every r≥1, work over an algebraic closure and let Γ_r be the graph of q^r-power Frobenius. Its intersection with Δ consists of C(F_(q^r)), with every local intersection multiplicity 1 because 1−dF^r=1. Thus Δ·Γ_r=N_r; Γ_r²=(2−2g)q^r, Γ_r·A=1 and Γ_r·B=q^r. The field-degree/base-change bookkeeping is imported from the curve lane.

**Hypotheses.** Finite field of size q; r≥1; smooth projective geometrically connected curve; geometric base change and the specified Frobenius iterate.

**Construction or proof.**

1. Identify the fixed-point scheme with rational points over the rth extension. Smooth tangent spaces and zero Frobenius differential make the fixed points transverse. The graph formula supplies its square and ruling degrees.

**Direct prerequisites.** [Diagonal and graph intersections on curve products](#curve-product-graphs) (`SchemeAndStackFoundations:SF.5/curve-product-graphs`); [Local Tor formula for proper intersections](#tor-intersection) (`SchemeAndStackFoundations:SF.5/tor-intersection`); `SchemeAndStackFoundations:SF.3`.

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Finite-field argument following Example 11.55, p. 38. Graph–diagonal intersections count Frobenius fixed points; iterate the same construction for all extensions.

**Acceptance.**

- On P¹/F_q, N_r=q^r+1 for every r≥1.

**Suggested-signature boundary.** Finite field, curve, genus and actual Frobenius/extension data are omitted from the numerical helpers; their exact geometric meaning is stated in the packet.

<a id="weil-bound"></a>

### Weil bound over every finite extension

**Theorem** · `SchemeAndStackFoundations:SF.5/weil-bound` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.weil_bound_all_extensions`.

For C/F_q smooth projective geometrically connected of genus g, for every r≥1 one has |#C(F_(q^r))−q^r−1|≤2g√(q^r). Set D=Δ−A−B and E_r=Γ_r−q^r A−B. Both are orthogonal to ample A+B; D²=−2g, E_r²=−2gq^r and D·E_r=N_r−q^r−1. Apply Hodge Cauchy and take a nonnegative square root. The zeta function/eigenvalue deduction remains the WeilConjectures consumer, not a theorem imported to prove this bound.

**Hypotheses.** Finite field of size q, g genus, smooth projective geometrically connected curve; every positive integer r.

**Construction or proof.**

1. Compute the three pairings by bilinearity and the graph formulas. Apply the ample-orthogonal Cauchy inequality to get the squared estimate 4g²q^r, then the real absolute-value estimate.

**Direct prerequisites.** [Cauchy inequality on the ample orthogonal space](#hodge-cauchy) (`SchemeAndStackFoundations:SF.5/hodge-cauchy`); [Frobenius fixed points and intersection numbers](#frobenius-fixed-points) (`SchemeAndStackFoundations:SF.5/frobenius-fixed-points`); [Diagonal and graph intersections on curve products](#curve-product-graphs) (`SchemeAndStackFoundations:SF.5/curve-product-graphs`); `SchemeAndStackFoundations:SF.3`; [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`).

**Source support.**

- [J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Corollary 11.54 and the finite-field argument, pp. 37–38. The graph defect estimate proves the finite-field bound. Repeating it for the Frobenius iterate retains the quantifier over all r.

**Acceptance.**

- The genus-zero case forces N_r=q^r+1 for all r, rather than merely bounding the base-field count.

**Suggested-signature boundary.** The curve and finite-field data are omitted from this numerical suggested form. The statement uses every r≥1; q and g stand for the field size and genus of that fixed curve.

## Integral stack cycles and rational degree

Kresch's integral construction uses vector bundles and projective modifications. It is not the naive group of stack cycles; negative-degree torsion is a necessary test. For a group of dimension g acting on X, A_d([X/G]) matches the equivariant group in dimension d+g; an l-dimensional representation gives mixed quotient dimension d+g+l−g=d+l in the same convention. The smooth DM ring uses the source's local regular Gysin construction. A rational stabilizer degree such as 1/n on Bμ_n cannot be an integral degree map.

<a id="stack-chow"></a>

### Integral Chow groups of finite type stacks

**Construction** · `SchemeAndStackFoundations:SF.5/stack-chow` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.StackPresentation`.

For a finite-type Artin stack over a field, use Kresch’s cycle group A_d obtained from projective modifications and vector-bundle approximations, modulo the specified relations. For schemes and algebraic spaces it is the naive integral cycle quotient. For DM stacks its comparison with naive cycles is an isomorphism after tensoring with ℚ, not in general over ℤ. Negative homological grades may contain torsion. The stack carrier, descent and quotient presentations belong to SF.1, below this stage.

**Hypotheses.** Finite-type Artin stack over a field; the DM hypothesis only for the rational naive comparison.

**Construction or proof.**

1. First take the vector-bundle limit of naive groups; then projective modification data and the relation quotient of Kresch Definitions 2.1.4 and 2.1.11. Excision and high-codimension quotient approximations prove the comparisons.

**Direct prerequisites.** [Chow groups](#chow-group) (`SchemeAndStackFoundations:SF.5/chow-group`); [Affine bundle homotopy invariance](#affine-bundle-homotopy) (`SchemeAndStackFoundations:SF.5/affine-bundle-homotopy`); [Localization for Chow homology](#chow-localization) (`SchemeAndStackFoundations:SF.5/chow-localization`); `SchemeAndStackFoundations:SF.1`.

**Source support.**

- [Andrew Kresch, Cycle groups for Artin stacks](https://arxiv.org/pdf/math/9810166), Definitions 2.1.4 and 2.1.11; Theorem 2.1.12(i)–(iii), pp. 4–7. The integral construction is distinct from naive cycle homology and agrees rationally in the DM case.

**Uses that determine the interface.**

- Kresch Theorem 2.1.12 and MotivesAndAlgebraicCycles:MC.0: Integral stack intersections and rational cycle correspondences must specify which coefficient comparison is used.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.stackChow_scheme | compatibility | For a finite-type scheme viewed as a stack, Kresch homology is its integral Chow group. |
| TauCeti.AlgebraicGeometry.Intersection.stackChow_dm_rational | compatibility | For a DM stack, rational extension agrees with naive cycle homology. |
| TauCeti.AlgebraicGeometry.Intersection.stackChow_trivial_vector | compatibility | Pullback along a trivial rank-r vector bundle gives A_d(F)≅A_(d+r)(F×A^r); the full vector-bundle formula is required. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.stackChow_test_point | degenerate | The scheme point has A₀=ℤ. |
| TauCeti.AlgebraicGeometry.Intersection.stackChow_test_bmu2 | non-example | Bμ₂ over ℚ has A_−1≅ℤ/2; naive negative-dimensional cycles would give zero. |
| TauCeti.AlgebraicGeometry.Intersection.stackChow_test_bmu2_rational | compatibility | That negative-degree torsion dies after rational extension. |

**Suggested-signature boundary.** The pseudofunctor is the native bicategorical carrier. Stack descent, groupoid-valuedness, finite type and DM predicates are omitted; they are exact SF.1 requests, not unconstrained Prop fields. schemeAsStack, stackAffineBundle, naive cycles and Bμ_n are supplier/fixture prototypes. The Bμ_n fixture is over ℚ, so n>0 is invertible.

<a id="mixed-quotients"></a>

### Equivariant mixed quotients

**Construction** · `SchemeAndStackFoundations:SF.5/mixed-quotients` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.equivariantChow`.

For a g-dimensional linear algebraic group G acting on a finite-type space X, choose an l-dimensional representation V and invariant free open U with codim(V−U)>dim X−i. Define A_i^G(X)=CH_(i+l−g)((X×U)/G). This is independent of such a sufficiently good pair and functorial for equivariant proper/flat maps. For the quotient stack F=[X/G], A_d(F)=A_(d+g)^G(X); this homological shift is essential.

**Hypotheses.** Linear algebraic group; free open with the displayed codimension bound; existence of the mixed algebraic-space quotient.

**Construction or proof.**

1. Compare two pairs inside V⊕V′. Remove the high-codimension complements by localization and identify the two open vector-bundle projections by homotopy. Presentation independence follows from the fibre product of the two quotient approximations.

**Direct prerequisites.** [Integral Chow groups of finite type stacks](#stack-chow) (`SchemeAndStackFoundations:SF.5/stack-chow`); [Localization for Chow homology](#chow-localization) (`SchemeAndStackFoundations:SF.5/chow-localization`); [Affine bundle homotopy invariance](#affine-bundle-homotopy) (`SchemeAndStackFoundations:SF.5/affine-bundle-homotopy`); [Exterior products of Chow classes](#exterior-product) (`SchemeAndStackFoundations:SF.5/exterior-product`); `SchemeAndStackFoundations:SF.1`.

**Source support.**

- [Dan Edidin and William Graham, Equivariant intersection theory](https://arxiv.org/pdf/alg-geom/9609018), Definition–Proposition 1 in Section 2.2, p. 5; Proposition 16 in Section 5.3, p. 28. The first formula fixes the representation shift and the second fixes A_d([X/G])=A_(d+g)^G(X); the concluding line on p. 28 has the recorded opposite-sign misprint.

**Uses that determine the interface.**

- Kresch Theorem 2.1.12(iii), Section 4.5 and Edidin–Graham Sections 3.2/5.3: Good pairs implement quotient-stack comparisons and the torsion tests.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.equivariantChow_mixed | characterisation | A good pair gives the prescribed shifted Chow group of its mixed quotient. |
| TauCeti.AlgebraicGeometry.Intersection.equivariantChow_presentation | compatibility | Quotient-stack homology is the equivariant theory shifted by +dim G. |
| TauCeti.AlgebraicGeometry.Intersection.equivariantChow_independent | functoriality | Two good-pair mixed quotients yield canonically isomorphic groups in the same equivariant grade. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.equivariantChow_test_trivial_group | degenerate | For the trivial group the equivariant theory is ordinary Chow. |
| TauCeti.AlgebraicGeometry.Intersection.equivariantChow_test_bg_m | computation | CH*(BG_m)=ℤ[t] with t the universal first Chern class. |
| TauCeti.AlgebraicGeometry.Intersection.equivariantChow_test_bmu_n | non-example | CH*(Bμ_n)=ℤ[t]/(nt) over ℚ for n≥1, so A_−1=ℤ/n. |

**Suggested-signature boundary.** Group structure, action, base field, good-pair freeness/codimension and dimensions l,g are omitted. The trivial-group test also places X over ℚ. Mixed quotients and quotient stacks are the specified SF.1 constructions. The Bμ_n ring calculation follows from G_m approximation and localization for the weight-n line; no rational-only comparison is used for its integral torsion.

<a id="dm-gysin-ring"></a>

### Gysin maps and rings on smooth DM stacks

**Theorem** · `SchemeAndStackFoundations:SF.5/dm-gysin-ring` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.smooth_dm_intersection_ring`.

For finite-type DM stacks over a field, regular local immersions of constant codimension have integral refined Gysin maps, compatible with flat pullback and projective representable pushforward. Smooth DM stacks have an integral intersection ring via their regular local diagonal. For the more general lci construction in the read source, impose stratification by global quotient stacks; DM stacks satisfy this condition by Proposition 4.5.5(iii). The source does not give unrestricted integral pushforward for a nonrepresentable proper map.

**Hypotheses.** Finite-type DM stacks; smoothness and pure dimension for the ring; regular local immersion means the representable unramified étale-locally closed-immersion notion.

**Construction or proof.**

1. Carry normal deformation and vector-bundle homotopy through quotient approximations. Glue along excision using the projective-modification construction. Double deformation proves composition; the smooth diagonal then gives the ring.

**Direct prerequisites.** [Integral Chow groups of finite type stacks](#stack-chow) (`SchemeAndStackFoundations:SF.5/stack-chow`); [Equivariant mixed quotients](#mixed-quotients) (`SchemeAndStackFoundations:SF.5/mixed-quotients`); [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`); [Composition of regular Gysin maps](#gysin-composition) (`SchemeAndStackFoundations:SF.5/gysin-composition`); [Intersection rings of smooth schemes](#smooth-intersection) (`SchemeAndStackFoundations:SF.5/smooth-intersection`); `SchemeAndStackFoundations:SF.1`.

**Source support.**

- [Andrew Kresch, Cycle groups for Artin stacks](https://arxiv.org/pdf/math/9810166), Theorem 2.1.12(vii)–(x), pp. 6–7; Sections 4.1–4.3, pp. 22–25; Proposition 4.5.5(iii), p. 27. The integral operations and the DM stratification hypotheses are retained.

**Acceptance.**

- On Bμ₂ the universal line has nonzero first Chern 2-torsion, which an integral naive-cycle ring would lose.

**Suggested-signature boundary.** Finite type, DM, smoothness and pure dimension n are omitted. The precise local-Gysin/composition construction invokes unread references in Kresch and is recorded as a proof gap; scheme diagonal Gysin is not treated as sufficient by itself.

<a id="dm-rational-degree"></a>

### Rational degree on proper DM stacks

**Construction** · `SchemeAndStackFoundations:SF.5/dm-rational-degree` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.stackDegree`.

A proper finite-type DM stack over a field has degree A₀(F;ℚ)→ℚ compatible with rational proper push. Over an algebraically closed field the fundamental point of a residual gerbe with finite stabilizer G has degree 1/|G|. For Bμ_n with n invertible, the finite atlas has degree n and normalizes deg[Bμ_n]=1/n. This construction requires the Vistoli rational push comparison cited by Kresch; integral Kresch projective push alone cannot supply a general nonrepresentable degree.

**Hypotheses.** Proper finite-type DM stack over a field; rational coefficients; algebraically closed field for the stabilizer formula.

**Construction or proof.**

1. Use rational naive-cycle comparison and the rational proper push construction with stabilizer weights. Normalize by a finite representable atlas and check independence through common refinements.

**Direct prerequisites.** [Integral Chow groups of finite type stacks](#stack-chow) (`SchemeAndStackFoundations:SF.5/stack-chow`); [Equivariant mixed quotients](#mixed-quotients) (`SchemeAndStackFoundations:SF.5/mixed-quotients`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`); `SchemeAndStackFoundations:SF.1`.

**Source support.**

- [Andrew Kresch, Cycle groups for Artin stacks](https://arxiv.org/pdf/math/9810166), Section 4.3, p. 24, rational integration paragraph. Rational integration is explicitly based on Vistoli; the cited proof is not supplied by this read source.

**Uses that determine the interface.**

- StableReductionPartII:MC.5 and MotivesAndAlgebraicCycles:MC.0: Intersection numbers on DM moduli stacks must retain stabilizer denominators; a separate stack RR proof is required for determinant formulas.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.stackDegree_scheme | compatibility | On a proper scheme stack this is rational extension of the scheme degree. |
| TauCeti.AlgebraicGeometry.Intersection.stackDegree_gerbe | simp | A finite stabilizer gerbe has reciprocal stabilizer order degree. |
| TauCeti.AlgebraicGeometry.Intersection.stackDegree_add | structure | Rational integration is additive. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.stackDegree_test_point | degenerate | The trivial-stabilizer point has degree 1. |
| TauCeti.AlgebraicGeometry.Intersection.stackDegree_test_bmu2 | non-example | Bμ₂ has degree 1/2, which is not an integer degree. |
| TauCeti.AlgebraicGeometry.Intersection.stackDegree_test_bmu3 | computation | Bμ₃ has degree 1/3. |

**Suggested-signature boundary.** Proper finite-type DM conditions are omitted; the scheme test works over ℚ. Bμ_n is over ℚ. The rational proper push proof is a named gap, not silently inferred from integral projective representable push.

## Nefness, bigness and Keel

Nefness is tested on proper integral curves after field extensions. Bigness records maximal section growth on every reduced irreducible component; its numerical comparison is a theorem with an asymptotic RR gap. The exceptional locus is the reduced closed union of positive-dimensional integral subvarieties on which the top power vanishes. Frobenius descends sections through finite universal homeomorphisms. Connected-fibre conductor gluing and the ample-plus-effective reduction feed Keel's criterion. The weaker finite-exceptional-fibre gluing form is used only over an algebraic closure of a finite field. The characteristic-zero product-of-curves example prevents exporting the criterion across characteristics.

<a id="nef-big"></a>

### Nef line bundles

**Definition** · `SchemeAndStackFoundations:SF.5/nef-big` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.IsNef`.

A line L on a projective k-scheme is nef if its degree on every integral closed curve is nonnegative. Tensoring nef lines and taking positive powers preserve nefness; for a positive power the condition is equivalent. An ample line is nef. This numerical condition alone does not imply global generation or semiampleness.

**Hypotheses.** Projective finite-type scheme over a field unless an API states broader scope.

**Construction or proof.**

1. Use native invertible sheaves and section evaluation; establish the stated tensor, power and restriction laws from the numbered sources.

**Direct prerequisites.** [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`); [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); `SchemeAndStackFoundations:SF.3`.

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Definition 0.0 and the ensuing numerical discussion, printed p. 254; Lemma 1.7, p. 262. Componentwise big/nef top intersections and the ample-plus-effective argument.

**Uses that determine the interface.**

- Keel Theorem 0.2 and Corollary 0.3; GeometricSatakeWitt:GS.0: Nefness and componentwise bigness separate numerical inputs from the section-generation conclusion.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.IsAmple.nef | compatibility | An ample line is nef. |
| TauCeti.AlgebraicGeometry.Intersection.IsNef.power | relation | For m>0, L^m is nef exactly when L is. |
| TauCeti.AlgebraicGeometry.Intersection.IsNef.tensor | structure | The tensor product of nef lines is nef. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.nef_test_p1_o1 | computation | O(1) on P¹ is nef. |
| TauCeti.AlgebraicGeometry.Intersection.nef_test_p1_trivial | degenerate | The trivial line is nef with all curve degrees zero. |
| TauCeti.AlgebraicGeometry.Intersection.nef_test_p1_negative | non-example | O(−1) has negative degree on P¹ itself and is not nef. |

**Suggested-signature boundary.** Projectivity and the ground field are omitted from ambient parameters. The curve-degree helper denotes the actual restricted first-Chern degree, not a chosen numerical function; integral curves are native schemes with closed immersions.

<a id="big-line"></a>

### Big line bundles

**Definition** · `SchemeAndStackFoundations:SF.5/big-line` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.IsBig`.

On a reduced projective scheme, L is big if each irreducible component Z of dimension d has h⁰(Z,L^m|Z)≥c m^d for some c>0 and all sufficiently large m. This componentwise convention excludes a bundle whose sections grow maximally on only one component. Positive powers preserve bigness and detect it; ample lines are big. The section-growth definition does not require nefness.

**Hypotheses.** Projective finite-type scheme over a field unless an API states broader scope.

**Construction or proof.**

1. Use native invertible sheaves and section evaluation; establish the stated tensor, power and restriction laws from the numbered sources.

**Direct prerequisites.** [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`); [Global generation of coherent modules](#global-generation) (`SchemeAndStackFoundations:SF.5/global-generation`); `SchemeAndStackFoundations:SF.2`.

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Definition 0.0 and the ensuing numerical discussion, printed p. 254; Lemma 1.7, p. 262. Componentwise big/nef top intersections and the ample-plus-effective argument.

**Uses that determine the interface.**

- Keel Theorem 0.2 and Corollary 0.3; GeometricSatakeWitt:GS.0: Nefness and componentwise bigness separate numerical inputs from the section-generation conclusion.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.IsBig.power | relation | For m>0, L^m is big exactly when L is. |
| TauCeti.AlgebraicGeometry.Intersection.IsAmple.big | compatibility | An ample line is big in the componentwise reduced projective scope. |
| TauCeti.AlgebraicGeometry.Intersection.IsBig.tensor_generated | functoriality | Tensoring a big line by a generated line preserves bigness. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.big_test_p1_o1 | computation | O(1) has m+1 sections on P¹ and is big. |
| TauCeti.AlgebraicGeometry.Intersection.big_test_p1_trivial | non-example | The trivial line on P¹ has constant section dimension and is not big. |
| TauCeti.AlgebraicGeometry.Intersection.big_test_p1_negative | non-example | Positive powers of O(−1) on P¹ have no sections and are not big. |

**Suggested-signature boundary.** Projectivity, reducedness and ground field are omitted. componentSectionCount is the native h⁰ finrank on the reduced component after restricting the actual line power. Its cohomology finiteness comes from SF.2; asymptotic comparison and Kodaira inputs remain a named gap.

<a id="nef-big-numerical"></a>

### Numerical characterization of nef bigness

**Theorem** · `SchemeAndStackFoundations:SF.5/nef-big-numerical` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.IsBig.nef_numeric`.

For a nef line on a reduced projective scheme over a field, componentwise bigness is equivalent to strictly positive top self-intersection on every irreducible component. On a positive-dimensional component zero top intersection makes that component exceptional; bigness on another component cannot remove it.

**Hypotheses.** Reduced projective finite-type scheme over a field; nef invertible sheaf.

**Construction or proof.**

1. Use the nef asymptotic-RR comparison on each reduced integral component; positive leading coefficient gives maximal section growth. Conversely a big nef line has positive top intersection. The precise asymptotic proof is recorded as a gap.

**Direct prerequisites.** [Big line bundles](#big-line) (`SchemeAndStackFoundations:SF.5/big-line`); [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`); [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`).

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Definition 0.0 and the ensuing numerical discussion, printed p. 254; Lemma 1.7, p. 262. Componentwise big/nef top intersections and the ample-plus-effective argument.

**Acceptance.**

- O(1) on P¹ is big with degree 1; the nef trivial line has degree 0 and is not big.

**Suggested-signature boundary.** Reduced projectivity and finite type are omitted. This theorem supplies the numerical equivalence used to identify exceptional components; the section-growth and numerical predicates are not made equal by definition.

<a id="exceptional-locus"></a>

### Exceptional loci of nef line bundles

**Definition** · `SchemeAndStackFoundations:SF.5/exceptional-locus` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.exceptionalSet`.

For nef L on a projective scheme, E(L) is the union of positive-dimensional integral closed subvarieties Z with (c₁(L)^dim Z·[Z])=0, given its reduced induced structure. This is a closed subset with finitely many irreducible components: on a big component use a power L^m=A⊗O(D) to put each exceptional Z inside D, then induct on dimension; a nonbig component belongs to E(L) itself. Zero-dimensional points are excluded.

**Hypotheses.** Nef invertible sheaf on a projective finite-type scheme over a field.

**Construction or proof.**

1. Define the numerical zero subvarieties with their actual top Chern degree. Kodaira decomposition and dimension induction establish a finite union, permitting the reduced closed-scheme structure.

**Direct prerequisites.** [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`); [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`); [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`); `SchemeAndStackFoundations:SF.0`; [Big line bundles](#big-line) (`SchemeAndStackFoundations:SF.5/big-line`); [Numerical characterization of nef bigness](#nef-big-numerical) (`SchemeAndStackFoundations:SF.5/nef-big-numerical`); [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`).

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Definition 0.1, printed p. 254; Lemma 1.7, p. 262. Defines positive-dimensional exceptional subvarieties and proves their finite closed union.

**Uses that determine the interface.**

- Keel Theorem 0.2/1.9: The semiampleness criterion restricts to this reduced closed scheme; a union of curves without closedness would not define its input.

**Planning API.**

| Proposed declaration | Role | Statement |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.exceptionalSet_closed | data | The exceptional union of a nef bundle is closed. |
| TauCeti.AlgebraicGeometry.Intersection.exceptionalSet_power | relation | Taking a positive power does not change the exceptional locus. |
| TauCeti.AlgebraicGeometry.Intersection.exceptionalScheme_support | characterisation | The exceptional scheme is reduced and its immersion has exactly the exceptional union as image. |

**Unit tests.**

| Named example | Kind | Required result |
| --- | --- | --- |
| TauCeti.AlgebraicGeometry.Intersection.exceptional_test_ample | degenerate | The exceptional locus of O(1) on P¹ is empty. |
| TauCeti.AlgebraicGeometry.Intersection.exceptional_test_trivial | computation | The trivial line on P¹ has exceptional locus all of P¹. |
| TauCeti.AlgebraicGeometry.Intersection.exceptional_test_surface_fibre | non-example | For the first ruling line bundle on P¹×P¹, the fibres of the first projection fill the exceptional locus, although the other ruling degree is positive. |

**Suggested-signature boundary.** Projectivity, field and nefness are omitted from the scheme constructors; they are needed for the closed-union theorem. The subset body has the exact positive-dimensional zero-top-number condition; it is not a Prop placeholder.

<a id="frobenius-descent"></a>

### Frobenius descent along finite universal homeomorphisms

**Theorem** · `SchemeAndStackFoundations:SF.5/frobenius-descent` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.semiample_universal_homeomorphism`.

In characteristic p>0, a finite universal homeomorphism between projective schemes detects semiampleness: L is semiample exactly when its pullback is. After a sufficiently high p-power, sections of the pulled-back line bundle descend, including through nilpotent thickenings. A finite cover of degree divisible by p cannot be handled by dividing a trace.

**Hypotheses.** Finite universal homeomorphism; projective schemes over a field of positive characteristic.

**Construction or proof.**

1. Use the finite-algebra p-power descent bound locally and a common exponent on a finite cover. Raise generating sections to that exponent; descent and their unchanged vanishing loci give global generation.

**Direct prerequisites.** [Semiample line bundles](#projective-positivity) (`SchemeAndStackFoundations:SF.5/projective-positivity`); `SchemeAndStackFoundations:SF.0`.

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Lemma 1.4, printed pp. 260–261. The p-power section/Picard descent argument provides semiampleness equivalence and reduction invariance.

**Acceptance.**

- A nilpotent thickening and its reduction have the same semiampleness test in characteristic p.

**Suggested-signature boundary.** Finite universal homeomorphism, projectivity and characteristic p>0 are omitted; the precise finite-algebra bound cited to Kollár by the source is recorded as an unread proof input.

<a id="semiample-gluing"></a>

### Gluing semiample line bundles

**Theorem** · `SchemeAndStackFoundations:SF.5/semiample-gluing` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.semiample_conductor_gluing`.

In the locally pushout conductor diagram of a reduced projective scheme and a proper cover normal outside a closed D, nef L is semiample if its pullback and L|D are semiample and the induced contraction on the reduced conductor intersection has geometrically connected fibres as in Keel Theorem 2.10. The Frobenius power matches sections in characteristic p>0. General positive characteristic uses the connected-fibre hypothesis; the weaker finitely-many-exceptional-fibres statement for semiampleness uses the algebraic closure of a finite field.

**Hypotheses.** The locally pushout/conductor diagram; perfect positive-characteristic field; nef bundle; semiampleness on the two pieces; specified connectedness.

**Construction or proof.**

1. Descend powers of sections across the locally pushout ring diagram, using Frobenius to clear purely inseparable discrepancies. Connected contraction fibres make the sections agree on the overlap.

**Direct prerequisites.** [Frobenius descent along finite universal homeomorphisms](#frobenius-descent) (`SchemeAndStackFoundations:SF.5/frobenius-descent`); [Semiample line bundles](#projective-positivity) (`SchemeAndStackFoundations:SF.5/projective-positivity`); `SchemeAndStackFoundations:SF.1`.

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Definition 2.3, Corollary 2.9, Theorem 2.10 and Proposition 2.12, printed pp. 265–269. The gluing hypotheses and the special finite-field relaxation are separated.

**Acceptance.**

- On a union of two curves, matching positive-power sections along their finite conductor glues a generating family when the stated fibre condition holds.

**Suggested-signature boundary.** Nefness, positive characteristic, conductor pushout and connectedness are omitted. The SF.1 request names exactly the conductor pushout; the source’s Raynaud proof input remains a gap.

<a id="ample-effective-semiample"></a>

### Semiampleness from an ample plus effective decomposition

**Theorem** · `SchemeAndStackFoundations:SF.5/ample-effective-semiample` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.ample_effective_semiample`.

In characteristic p>0, if a nef bundle L on a projective scheme has a power L^m=A⊗O(D), with A ample and D effective Cartier, then L is semiample exactly when L|D_red is semiample. The proof passes from formal thickenings to an algebraic-space contraction and descends a power of the line bundle; it is not just a numerical top-intersection argument.

**Hypotheses.** Projective over positive-characteristic field; L nef; positive power decomposition with A ample and D effective Cartier.

**Construction or proof.**

1. Use Serre vanishing and formal functions on the thickenings of D. Apply the required algebraic-space contraction criterion, descend the line bundle after a Frobenius power, and produce enough sections. The reverse implication is restriction.

**Direct prerequisites.** [Frobenius descent along finite universal homeomorphisms](#frobenius-descent) (`SchemeAndStackFoundations:SF.5/frobenius-descent`); [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`); [Semiample line bundles](#projective-positivity) (`SchemeAndStackFoundations:SF.5/projective-positivity`); `SchemeAndStackFoundations:SF.2`; `SchemeAndStackFoundations:SF.1`; [Big line bundles](#big-line) (`SchemeAndStackFoundations:SF.5/big-line`); [Numerical characterization of nef bigness](#nef-big-numerical) (`SchemeAndStackFoundations:SF.5/nef-big-numerical`); [Ample line bundles](#ample) (`SchemeAndStackFoundations:SF.5/ample`).

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Proposition 1.6 and Lemma 1.10, printed pp. 261–264. The contraction and formal-neighbourhood arguments are essential proof inputs.

**Acceptance.**

- An ample line has empty exceptional locus and is semiample.

**Suggested-signature boundary.** Characteristic, nefness, the ample-plus-effective decomposition, and identification of D with its reduced Cartier support are omitted; the Artin contraction theorem invoked by the source is a precise recorded gap.

<a id="keel-semiampleness"></a>

### Keel semiampleness criterion

**Theorem** · `SchemeAndStackFoundations:SF.5/keel-semiampleness` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.keel_semiample`.

For every nef line bundle L on a projective scheme over a field of characteristic p>0, L is semiample if and only if L restricted to the reduced exceptional locus E(L) is semiample. The theorem does not assume smoothness or bigness of X or L. Reduce nilpotents by Frobenius descent, use ample-plus-effective decomposition on big components, induct on exceptional dimension and glue reducible components.

**Hypotheses.** Projective scheme over a positive-characteristic field; nef invertible sheaf.

**Construction or proof.**

1. Reduction is harmless by finite universal-homeomorphism descent. Nonbig components are themselves exceptional. On a big component choose an ample-plus-effective power, whose exceptional locus is contained in the divisor; induct and apply Proposition 1.6. Use conductor gluing to assemble components.

**Direct prerequisites.** [Exceptional loci of nef line bundles](#exceptional-locus) (`SchemeAndStackFoundations:SF.5/exceptional-locus`); [Semiampleness from an ample plus effective decomposition](#ample-effective-semiample) (`SchemeAndStackFoundations:SF.5/ample-effective-semiample`); [Gluing semiample line bundles](#semiample-gluing) (`SchemeAndStackFoundations:SF.5/semiample-gluing`); [Frobenius descent along finite universal homeomorphisms](#frobenius-descent) (`SchemeAndStackFoundations:SF.5/frobenius-descent`).

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Theorem 0.2, printed p. 254; Lemmas 1.7–1.8 and Theorem 1.9, pp. 262–263. The main criterion and the inductive/reducible proof retain all characteristic and reduced-support conditions.

**Acceptance.**

- The criterion covers the trivial nef bundle, whose exceptional locus is all of X, and an ample bundle, whose locus is empty.

**Suggested-signature boundary.** Projectivity and positive characteristic are omitted. The characteristic-zero counterexample below precludes silently dropping the latter.

<a id="finite-field-semiampleness"></a>

### Finite field consequences of Keel semiampleness

**Theorem** · `SchemeAndStackFoundations:SF.5/finite-field-semiampleness` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.finite_field_nef_big_surface`.

Over the algebraic closure of a finite field, a nef line bundle whose restriction to E(L) is numerically trivial is semiample, since numerically trivial line bundles on a projective scheme are torsion. On a projective surface, a nef bundle is semiample if it is big or numerically trivial: in the big case the exceptional locus has dimension at most one and all its curve degrees vanish. The general numerically-trivial-torsion result needs finite-type Picard boundedness, not merely the curve Picard variety.

**Hypotheses.** Projective over an algebraic closure of a finite field; nef L; the stated exceptional numerical triviality, or the surface alternatives.

**Construction or proof.**

1. Put all tensor powers of a numerically trivial line bundle into one finite-type Picard/Hilbert bounded family over a finite subfield. Finiteness of its rational points yields torsion. Restrict to E(L) and apply Keel; use dimension and nefness for the surface big case.

**Direct prerequisites.** [Keel semiampleness criterion](#keel-semiampleness) (`SchemeAndStackFoundations:SF.5/keel-semiampleness`); [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`); `SchemeAndStackFoundations:SF.1`; [Big line bundles](#big-line) (`SchemeAndStackFoundations:SF.5/big-line`).

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Corollary 0.3, printed p. 254; Lemma 2.16, p. 270. The finite-field torsion proof and surface consequence; its cited Picard boundedness is an exact supplier request.

**Acceptance.**

- On a surface over the algebraic closure of a finite field, the nef big bundle in the product-curve example is semiample.

**Suggested-signature boundary.** Surface, projectivity and algebraic-closure-of-finite-field hypotheses are omitted. Arbitrary positive-characteristic fields do not supply the torsion conclusion.

<a id="keel-characteristic-zero"></a>

### Failure of the Keel criterion in characteristic zero

**Theorem** · `SchemeAndStackFoundations:SF.5/keel-characteristic-zero` · proposed declaration `TauCeti.AlgebraicGeometry.Intersection.keel_characteristic_zero_counterexample`.

For a smooth projective curve C of genus g≥2 in characteristic zero, on C×C take L=ω_(π₁)(Δ). It is nef and big, has square 2g−2, restricts trivially to Δ and has E(L)=Δ, yet is not semiample. The first infinitesimal neighbourhood of Δ carries a nontorsion obstruction. In characteristic p>0 the same exceptional-locus criterion makes the corresponding bundle semiample.

**Hypotheses.** Algebraically closed characteristic-zero field; smooth projective curve of genus at least two.

**Construction or proof.**

1. Compute intersections by adjunction and the curve-product graph formulas. Identify the obstruction on the first diagonal thickening by the first Chern class of ω_C in H¹(ω_C); in characteristic zero it is nonzero and persists under positive powers.

**Direct prerequisites.** [Diagonal and graph intersections on curve products](#curve-product-graphs) (`SchemeAndStackFoundations:SF.5/curve-product-graphs`); [Adjunction for surface curves](#surface-adjunction) (`SchemeAndStackFoundations:SF.5/surface-adjunction`); [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`); [Exceptional loci of nef line bundles](#exceptional-locus) (`SchemeAndStackFoundations:SF.5/exceptional-locus`); `SchemeAndStackFoundations:SF.2`; [Big line bundles](#big-line) (`SchemeAndStackFoundations:SF.5/big-line`).

**Source support.**

- [Seán Keel, Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149), Theorem 3.0 and Lemmas 3.3–3.5, printed pp. 270–272. The product-of-curves counterexample shows why the characteristic hypothesis is necessary.

**Acceptance.**

- For genus 2 the self-square is 2 while the diagonal restriction is trivial; a criterion based only on nefness and this restriction would give a false characteristic-zero conclusion.

**Suggested-signature boundary.** Smooth projective curve, algebraically closed characteristic-zero field and genus≥2 are omitted. keelProductLine denotes the concrete relative canonical line twisted by the diagonal on the actual scheme C×C.

## The product-of-curves calculation

Let C/F_q be smooth, projective and geometrically connected, of genus g. Work on the geometric surface C×C. For a geometric point P let A={P}×C and B=C×{P}; write Δ for the diagonal and Γ_r for the graph x↦(x,F^r(x)). The source graph convention matters: Γ_r·A=1 and Γ_r·B=q^r.

| Pairing | Value | Reason |
| --- | --- | --- |
| A² and B² | 0 | A ruling moves to a disjoint fibre |
| A·B | 1 | Transverse point intersection |
| Δ·A and Δ·B | 1 | Both diagonal projections have degree one |
| Δ² | 2−2g | Adjunction, or the diagonal normal tangent line |
| Γ_r² | (2−2g)q^r | The graph normal line is pulled back from the second factor; Frobenius has zero differential |
| Δ·Γ_r | N_r=#C(F_(q^r)) | The fixed-point intersection is simple because 1−dF^r is invertible |

The divisor H=A+B is ample. Put D=Δ−A−B and E_r=Γ_r−q^r A−B. Bilinearity gives D·H=E_r·H=0, D²=−2g, E_r²=−2gq^r and D·E_r=N_r−1−q^r. Cauchy on the H-orthogonal space gives (N_r−1−q^r)²≤4g²q^r and hence the absolute-value estimate for every r≥1. This uses neither the Weil-conjectures conclusion nor a zeta-function theorem as an input. The curve cohomology and geometric-base-change facts are requested through SF.3. The supporting surface calculations are Milne, Examples 11.30 and 11.55 and the argument on pp. 21 and 37–38, together with Grothendieck's product-defect formula (1.8), p. 3 of the read transcription.

## Exact supplier requests

The following requests are mathematical prerequisites, not implementation tickets. Each has the stage as a direct prerequisite where a supplying node does not yet exist. The exact existing coherent-duality nodes are cited directly and are not replaced by requests.

### Request 1: `SchemeAndStackFoundations:SF.0`

For schemes locally of finite type over a locally Noetherian universally catenary dimension base, construct the induced integer dimension function by residue transcendence degree, restriction to closed/open immersions, and pure-dimensional flat fibre shifts. Supply finite generic stalk/module lengths, locally finite irreducible supports, relative Spec and relative Proj with graded symmetric/normal algebras, regular immersion/conormal exact sequences and constant-rank vector bundles. Reuse native scheme ideals and pullbacks.

Consumers: [Dimension functions](#dimension-function) (`SchemeAndStackFoundations:SF.5/dimension-function`), [Fundamental cycles with generic lengths](#fundamental-cycle) (`SchemeAndStackFoundations:SF.5/fundamental-cycle`), [Cycles of coherent sheaves](#coherent-cycle) (`SchemeAndStackFoundations:SF.5/coherent-cycle`), [Flat pullback](#flat-pullback) (`SchemeAndStackFoundations:SF.5/flat-pullback`), [Gysin maps for Cartier divisors](#cartier-gysin) (`SchemeAndStackFoundations:SF.5/cartier-gysin`), [Projective bundles and tautological quotients](#projective-bundle) (`SchemeAndStackFoundations:SF.5/projective-bundle`), [Normal cones and normal bundles](#normal-cone) (`SchemeAndStackFoundations:SF.5/normal-cone`), [Deformation to the normal cone](#normal-deformation) (`SchemeAndStackFoundations:SF.5/normal-deformation`), [Pullback for globally factorable lci morphisms](#lci-pullback) (`SchemeAndStackFoundations:SF.5/lci-pullback`), [Exterior products of Chow classes](#exterior-product) (`SchemeAndStackFoundations:SF.5/exterior-product`), [Intersection rings of smooth schemes](#smooth-intersection) (`SchemeAndStackFoundations:SF.5/smooth-intersection`), [Local Tor formula for proper intersections](#tor-intersection) (`SchemeAndStackFoundations:SF.5/tor-intersection`), [Exceptional loci of nef line bundles](#exceptional-locus) (`SchemeAndStackFoundations:SF.5/exceptional-locus`).

### Request 2: `SchemeAndStackFoundations:SF.0`

Supply the finite-sequence Koszul chain complex on exterior powers, its augmentation and exactness for a regular sequence, plus finite projective-dimension/Tor-length bounds over regular Noetherian local rings. This foundational input is moved down from DerivedDeRham DD.1, rather than imported from that higher-tier package.

Consumers: [Koszul character identity](#koszul-character) (`SchemeAndStackFoundations:SF.5/koszul-character`), [Finite locally free resolutions](#finite-resolutions) (`SchemeAndStackFoundations:SF.5/finite-resolutions`), [Local Tor formula for proper intersections](#tor-intersection) (`SchemeAndStackFoundations:SF.5/tor-intersection`).

### Request 3: `SchemeAndStackFoundations:SF.0`

Prove the finite characteristic-p algebra bound for a finite universal homeomorphism: some common p-power sends local sections of the target algebra into the source; include nilpotent thickenings and gluing over a finite affine cover. Supply homogeneous gcd and local-unit residual intersection facts for nonzero plane forms.

Consumers: [Frobenius descent along finite universal homeomorphisms](#frobenius-descent) (`SchemeAndStackFoundations:SF.5/frobenius-descent`), [Bézout bound for isolated plane intersections](#isolated-plane-bezout) (`SchemeAndStackFoundations:SF.5/isolated-plane-bezout`).

### Request 4: `SchemeAndStackFoundations:SF.1`

Supply finite-type Artin/DM stacks as groupoid-valued pseudofunctors on the scheme site, representable projective/flat maps, quotient stacks and free mixed algebraic-space quotients. Include quotient stratifications for finite-type DM stacks and sufficiently high-codimension free opens in linear-group representations, with dimension bookkeeping. This is an SF.1 stack extension, not an upward DiamondsAndVStacks dependency.

Consumers: [Integral Chow groups of finite type stacks](#stack-chow) (`SchemeAndStackFoundations:SF.5/stack-chow`), [Equivariant mixed quotients](#mixed-quotients) (`SchemeAndStackFoundations:SF.5/mixed-quotients`), [Gysin maps and rings on smooth DM stacks](#dm-gysin-ring) (`SchemeAndStackFoundations:SF.5/dm-gysin-ring`), [Rational degree on proper DM stacks](#dm-rational-degree) (`SchemeAndStackFoundations:SF.5/dm-rational-degree`).

### Request 5: `SchemeAndStackFoundations:SF.1`

Supply the reduced conductor/normalization diagram as a locally pushout of schemes or algebraic spaces, including the proper-cover form normal off the closed centre in Keel Theorem 2.10. Separately supply the precise Artin algebraic-space contraction criterion used by Keel Proposition 1.6; no resolution or semistable-reduction hypothesis is required.

Consumers: [Gluing semiample line bundles](#semiample-gluing) (`SchemeAndStackFoundations:SF.5/semiample-gluing`), [Semiampleness from an ample plus effective decomposition](#ample-effective-semiample) (`SchemeAndStackFoundations:SF.5/ample-effective-semiample`).

### Request 6: `SchemeAndStackFoundations:SF.1`

Supply finite-type Picard/Hilbert boundedness for all numerically trivial line bundles on a projective scheme, sufficient to put every tensor power into one finite-type family over a finite subfield. Curve Picard alone is insufficient for Keel Lemma 2.16. Own this general representability foundation below AlgebraicModuli R09.3.

Consumers: [Finite field consequences of Keel semiampleness](#finite-field-semiampleness) (`SchemeAndStackFoundations:SF.5/finite-field-semiampleness`).

### Request 7: `SchemeAndStackFoundations:SF.2`

Supply finite-dimensional proper coherent cohomology, bounded vanishing, coherent higher direct images for projective morphisms, their composition comparison and projective-space O(m) cohomology for all integer m. Include finite section-evaluation epimorphisms after twisting by O(1) for a fixed quasiprojective immersion (formulated without SF.5 positivity predicates), regular local resolution bounds, exact restriction sequences and the cohomological first-diagonal-thickening calculation used by Keel. The already planned coherent-duality/smooth-proper/serre-proper nodes are reused unchanged.

Consumers: [Finite locally free resolutions](#finite-resolutions) (`SchemeAndStackFoundations:SF.5/finite-resolutions`), [Riemann–Roch on projective space](#projective-space-rr) (`SchemeAndStackFoundations:SF.5/projective-space-rr`), [Projective Grothendieck–Riemann–Roch](#projective-grr) (`SchemeAndStackFoundations:SF.5/projective-grr`), [Bertini and ample twists on surfaces](#surface-bertini) (`SchemeAndStackFoundations:SF.5/surface-bertini`), [Euler characteristic recurrence on surfaces](#surface-weak-rr) (`SchemeAndStackFoundations:SF.5/surface-weak-rr`), [Failure of the Keel criterion in characteristic zero](#keel-characteristic-zero) (`SchemeAndStackFoundations:SF.5/keel-characteristic-zero`), [Big line bundles](#big-line) (`SchemeAndStackFoundations:SF.5/big-line`).

### Request 8: `SchemeAndStackFoundations:SF.2`

Supply formal functions and Serre-vanishing control of the ideal-graded H¹ groups on thickenings in Keel Lemma 1.10, with its proper contraction/line-bundle descent hypotheses. This exact cohomology input does not import all of SF.4.

Consumers: [Semiampleness from an ample plus effective decomposition](#ample-effective-semiample) (`SchemeAndStackFoundations:SF.5/ample-effective-semiample`).

### Request 9: `SchemeAndStackFoundations:SF.3`

Reuse TauCetiRoadmap/JacobianChallenge Layers A–C for divisor/invertible-sheaf comparison, tensor powers and pullback, Picard classes, proper-curve principal degree zero, χ(L)=deg L+1−g, canonical degree 2g−2 and extension-field/base-change genus invariance. Provide the scheme-level comparison to the native Euler characteristic and to existing abstract divisor RR. For graphs include q-power Frobenius degree q and its zero differential, fixed-point schemes over every finite extension and geometric connectedness preservation.

Consumers: [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`), [Proper pushforward preserves rational equivalence](#proper-relations) (`SchemeAndStackFoundations:SF.5/proper-relations`), [Semiample line bundles](#projective-positivity) (`SchemeAndStackFoundations:SF.5/projective-positivity`), [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`), [Degree of zero cycles](#degree) (`SchemeAndStackFoundations:SF.5/degree`), [Surface intersection pairings](#surface-pairing) (`SchemeAndStackFoundations:SF.5/surface-pairing`), [Adjunction for surface curves](#surface-adjunction) (`SchemeAndStackFoundations:SF.5/surface-adjunction`), [Euler characteristic recurrence on surfaces](#surface-weak-rr) (`SchemeAndStackFoundations:SF.5/surface-weak-rr`), [Hodge index theorem](#hodge-index) (`SchemeAndStackFoundations:SF.5/hodge-index`), [Diagonal and graph intersections on curve products](#curve-product-graphs) (`SchemeAndStackFoundations:SF.5/curve-product-graphs`), [Frobenius fixed points and intersection numbers](#frobenius-fixed-points) (`SchemeAndStackFoundations:SF.5/frobenius-fixed-points`), [Weil bound over every finite extension](#weil-bound) (`SchemeAndStackFoundations:SF.5/weil-bound`), [Global generation of coherent modules](#global-generation) (`SchemeAndStackFoundations:SF.5/global-generation`), [Very ample line bundles](#very-ample) (`SchemeAndStackFoundations:SF.5/very-ample`).

### Request 10: `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Import the existing general finite-type ideal blowup/relative-Proj construction and strict-transform/affine-chart API for deformation I+(t). Import its regular arithmetic-surface Cartier/Weil vertical pairing, normal-line self-intersection, residue weighting and projection formula for the comparison. No Néron model, abelian semistable reduction, resolution or Layers 7–9 result is required.

Consumers: [Deformation to the normal cone](#normal-deformation) (`SchemeAndStackFoundations:SF.5/normal-deformation`), [Comparison with arithmetic surface intersections](#arithmetic-surface-comparison) (`SchemeAndStackFoundations:SF.5/arithmetic-surface-comparison`).

## Open proof and source obligations

These obligations prevent coverage from being closed. A complete target-level pass records them explicitly; it does not claim their proof inputs have been established.

### Gap 1: Tame-boundary reciprocity and double deformation proof leaves

Stacks Lemma 42.27.1 (0AYC), p. 49 is used by first-Chern descent; its two-dimensional order/tame-symbol reciprocity argument has not been fully chased to the native order API. The double-deformation proof of refined interchange/composition in 42.54.8/42.54.10 needs its two-parameter blowup chart comparison. The read statement and dependency route are recorded, but these proof inputs require a source-to-library pass.

Needed by: [First Chern class operators](#first-chern) (`SchemeAndStackFoundations:SF.5/first-chern`), [Projection formula for first Chern operators](#chern-projection) (`SchemeAndStackFoundations:SF.5/chern-projection`), [Composition of regular Gysin maps](#gysin-composition) (`SchemeAndStackFoundations:SF.5/gysin-composition`), [Commutation of first Chern operators](#chern-commutation) (`SchemeAndStackFoundations:SF.5/chern-commutation`), [Interchange of refined Gysin maps](#gysin-interchange) (`SchemeAndStackFoundations:SF.5/gysin-interchange`).

### Gap 2: General lci gluing

The read Definition 42.59.4 (0FF3) provides only a global regular/smooth factorization. Establish descent of the local refined operations for an arbitrary lci morphism, including independence on intersections of local factorizations and composition. The global-factorable construction is complete at target level; this gap supplies the broader unqualified lci target.

Needed by: [Pullback for globally factorable lci morphisms](#lci-pullback) (`SchemeAndStackFoundations:SF.5/lci-pullback`), [Independence of lci factorization](#lci-factorization-independence) (`SchemeAndStackFoundations:SF.5/lci-factorization-independence`).

### Gap 3: Moving and local Tor comparison

The proper-intersection Tor coefficient and the Cohen–Macaulay reduction were read, but their full comparison to the diagonal-defined product invokes moving/deformation and regular-local intersection facts not all traced through the pinned source. Supply the moving comparison in the stated algebraically closed smooth scope; do not replace Tor by raw intersection length.

Needed by: [Local Tor formula for proper intersections](#tor-intersection) (`SchemeAndStackFoundations:SF.5/tor-intersection`), [Bézout bound for isolated plane intersections](#isolated-plane-bezout) (`SchemeAndStackFoundations:SF.5/isolated-plane-bezout`).

### Gap 4: Asymptotic RR and Kodaira decomposition

Keel Definition 0.0/Lemma 1.7 use the equivalence between maximal section growth, positive top intersection for nef bundles on every component, and an ample-plus-effective power on an integral big component. The source invokes standard asymptotic/Kodaira results rather than proving all of them. Identify and read a public proof with projective singular/reducible scope, then give its backward chain under the SF.5 positivity owner.

Needed by: [Nef line bundles](#nef-big) (`SchemeAndStackFoundations:SF.5/nef-big`), [Exceptional loci of nef line bundles](#exceptional-locus) (`SchemeAndStackFoundations:SF.5/exceptional-locus`), [Semiampleness from an ample plus effective decomposition](#ample-effective-semiample) (`SchemeAndStackFoundations:SF.5/ample-effective-semiample`), [Keel semiampleness criterion](#keel-semiampleness) (`SchemeAndStackFoundations:SF.5/keel-semiampleness`), [Big line bundles](#big-line) (`SchemeAndStackFoundations:SF.5/big-line`), [Numerical characterization of nef bigness](#nef-big-numerical) (`SchemeAndStackFoundations:SF.5/nef-big-numerical`).

### Gap 5: Artin contraction and formal descent

Keel Proposition 1.6 invokes Artin’s 1970 algebraic-space contraction theorem; Lemma 1.10 supplies part of the formal-thickening descent. That original contraction proof has not been read. Obtain the exact theorem with its properness, positivity and formal-neighbourhood conditions, and resolve the SF.1/SF.2 requests before claiming proof closure.

Needed by: [Semiampleness from an ample plus effective decomposition](#ample-effective-semiample) (`SchemeAndStackFoundations:SF.5/ample-effective-semiample`), [Keel semiampleness criterion](#keel-semiampleness) (`SchemeAndStackFoundations:SF.5/keel-semiampleness`).

### Gap 6: Finite universal-homeomorphism p-power bound

Keel Lemma 1.4 cites Kollár 1995, Section 6.6 for the finite algebra factorization through a Frobenius power. That cited proof was not read. Prove the exact local p-power statement in SF.0 and its finite-cover uniformity, then use the source’s section-descent argument.

Needed by: [Frobenius descent along finite universal homeomorphisms](#frobenius-descent) (`SchemeAndStackFoundations:SF.5/frobenius-descent`), [Gluing semiample line bundles](#semiample-gluing) (`SchemeAndStackFoundations:SF.5/semiample-gluing`), [Keel semiampleness criterion](#keel-semiampleness) (`SchemeAndStackFoundations:SF.5/keel-semiampleness`).

### Gap 7: Conductor pushout and Picard boundedness proof leaves

The source’s Raynaud conductor pushout and Altman–Kleiman Picard boundedness inputs were not read. The requests identify their exact uses: locally pushout gluing in Theorem 2.10 and finite-type control of all numerical-trivial powers in Lemma 2.16. No general moduli stage is used as a substitute.

Needed by: [Gluing semiample line bundles](#semiample-gluing) (`SchemeAndStackFoundations:SF.5/semiample-gluing`), [Finite field consequences of Keel semiampleness](#finite-field-semiampleness) (`SchemeAndStackFoundations:SF.5/finite-field-semiampleness`).

### Gap 8: Stack local Gysin and rational proper push proof leaves

Kresch Section 4.1 refers to Fulton/Kresch for the double-deformation details, and Section 4.3 invokes Vistoli 1989 for rational integration and nonrepresentable proper push. Those referenced proofs were not read. Supply them with representability/projectivity/DM and coefficient conditions; Kresch’s integral projective push is not a proof of unrestricted integral degree.

Needed by: [Gysin maps and rings on smooth DM stacks](#dm-gysin-ring) (`SchemeAndStackFoundations:SF.5/dm-gysin-ring`), [Rational degree on proper DM stacks](#dm-rational-degree) (`SchemeAndStackFoundations:SF.5/dm-rational-degree`).

### Gap 9: Stack Riemann–Roch for determinant consumers

Smooth projective scheme GRR does not establish GRR for DM stacks or nodal families. StableReductionPartII MC.5 needs an explicit source-scoped stack/nodal-family determinant RR comparison, including the singular Todd/dualizing correction and boundary terms. This requested extension belongs to the SF.5 RR owner and is not claimed by projective-grr.

Needed by: [Projective Grothendieck–Riemann–Roch](#projective-grr) (`SchemeAndStackFoundations:SF.5/projective-grr`), [Rational degree on proper DM stacks](#dm-rational-degree) (`SchemeAndStackFoundations:SF.5/dm-rational-degree`).

### Gap 10: Numerical quotient signature

The ample-orthogonality Hodge inequality and Cauchy proof are independent of a finite-rank Néron–Severi theorem. The full finite-dimensional signature statement needs the construction of divisors modulo the numerical radical and a finite-dimensionality proof. Do not identify numerical equivalence with algebraic equivalence or import unrelated Néron-model theory.

Needed by: [Hodge index theorem](#hodge-index) (`SchemeAndStackFoundations:SF.5/hodge-index`).

### Gap 11: Public replacement and original-source collation

Fulton Intersection Theory is not in the cleared library and no authorized full public edition was used. The scheme route is replaced by the fully acquired public Stacks chapters and author lecture notes, with precise read ranges. The 1958 Hodge paper was acquired as an entire public 2022 transcription; its original journal text has not been collated. Two transcription sign slips are recorded against that transcription alone. Collate the version of record before attributing either slip to Grothendieck.

Needed by: [Refined Gysin maps](#refined-gysin) (`SchemeAndStackFoundations:SF.5/refined-gysin`), [Projective Grothendieck–Riemann–Roch](#projective-grr) (`SchemeAndStackFoundations:SF.5/projective-grr`), [Hodge index theorem](#hodge-index) (`SchemeAndStackFoundations:SF.5/hodge-index`).

## Source versions and read inventory

All source statements in this document are in our own words. The inventory records acquired versions and the ranges actually read. It does not claim that cited external proofs were read when a gap says they were not. Each document was accessed on 9 October 2026. No book passage, source file or extracted source text is part of this roadmap.

### stacks-chow

The Stacks Project Authors. [Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf). Chapter 42, version ed88ff78, compiled 14 July 2026.

Read inventory: Situation 7.1 through Section 21, pp. 15–36: dimension functions, locally finite cycles, orders, rational equivalence and descent.; Sections 24–30, pp. 43–57: first Chern operators and Cartier Gysin.; Sections 33–34, pp. 62–64: bivariant and operational classes.; Sections 36–43, pp. 70–85; Sections 44–45, pp. 88–91; Lemma 46.11, pp. 97–98: projective bundles, Chern operations, degree, splitting and characteristic polynomials.; Lemmas 48.1–48.5, pp. 102–103: Cartier-fibre specialization and its compatibilities.; Section 53 through Lemma 54.10, pp. 118–126: normal deformation, refined operations, excess and composition.; Sections 59–62, pp. 136–148: globally factorable lci morphisms, smooth diagonal, exterior product and smooth intersection ring.

Acquired file SHA-256: `28aaf3c7a76d359c3be56f1c86167ab42fcb40bc35b1ae6ef3b47cb41f9a41f5`.

### stacks-intersection

The Stacks Project Authors. [Intersection Theory](https://stacks.math.columbia.edu/download/intersection.pdf). Chapter 43, version ed88ff78, compiled 14 July 2026.

Read inventory: Sections 1–5, pp. 1–3: scope and cycle conventions.; Sections 13–16, pp. 9–15: proper intersections, alternating Tor lengths, the Cohen–Macaulay reduction and the non-Cohen–Macaulay counterexample.

Acquired file SHA-256: `f8695a6eaca154785876a2a2348b57d9e37a541173e7d71c1854ca7a5d5bd2e5`.

### kraemer

Thomas Krämer. [Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf). HU Berlin summer 2023 lecture notes, 20 July 2023.

Read inventory: Chapter I opening material and contents: algebraically closed ground field and the plane intersection examples.; II.4, printed pp. 57–61: projective bundle conventions and Segre operators.; III.2, printed pp. 81–85: cones, normal cones, completion and Segre classes.; III.4–6, printed pp. 91–99: normal deformation, specialization and refined Gysin; the excess target on p. 99 checked visually.; IV.1–3, printed pp. 111–123: Todd polynomials, finite locally free resolutions, projective space Riemann–Roch and projective GRR.

Acquired file SHA-256: `8ca288e136cfcc235b5f5dd02c4c81d7f6e672940ba5b78db27eb02f137998a6`.

### milne

J. S. Milne. [Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf). Author course notes, 4 November 2024.

Read inventory: Sections a–b, pp. 1–14: local and divisor intersections and the canonical sheaf; the support formula on p. 7 checked visually.; Theorem 11.27 and its applications, pp. 18–21: adjunction, plane curve genus and diagonal self-intersection.; Theorems 11.35 and 11.37, pp. 23–24: Euler characteristic recurrence and surface duality.; Theorems 11.44–11.50 and Corollaries 11.51–11.54, pp. 29–37: surface Riemann–Roch, Bertini, Hodge index and its inequalities.; Example 11.55 and the finite field argument, pp. 37–38: graph normal bundle, Frobenius and point counts.

Acquired file SHA-256: `406fb352181c133c48e2e07aac0310cd8f2a21b98f7300a6bd1cfca3648a4fde`.

### keel

Seán Keel. [Basepoint freeness for nef and big line bundles in positive characteristic](https://arxiv.org/pdf/math/9901149). arXiv math/9901149 v1, 1 January 1999; Annals of Mathematics 149 (1999), 253–286, typeset author text.

Read inventory: Introduction, printed pp. 253–255: big bundles, exceptional locus, Theorem 0.2 and Corollary 0.3.; Section 1, printed pp. 259–264: Frobenius powers, ample plus effective divisor, finiteness of the exceptional locus and the thickening argument.; Section 2, printed pp. 265–269 and Lemma 2.16 on p. 270: pushout gluing, descent and finite field torsion.; Section 3, printed pp. 270–272: the characteristic-zero product-of-curves counterexample.

Acquired file SHA-256: `2ec4141aea36ad77e5b504f01617ffbbe17de0af27f8b2c5f4a1f4ee6afde398`.

### kresch

Andrew Kresch. [Cycle groups for Artin stacks](https://arxiv.org/pdf/math/9810166). arXiv math/9810166 v1, 28 October 1998.

Read inventory: Sections 1–2, pp. 1–8: naive groups, vector bundle and projective modification construction; Theorem 2.1.12 and rational comparison.; Sections 3.6 and 4.1–4.3, pp. 20–25: Chern operations, regular local immersions, exterior products and smooth DM intersections.; Section 4.5, pp. 27–29: quotient stratifications and approximation; Proposition 4.5.5(iii) supplies the DM case.

Acquired file SHA-256: `d8c2fca1493871667f2aa63124b053c45d303f51df388ffef0a76e44c5102a48`.

### edidin-graham

Dan Edidin and William Graham. [Equivariant intersection theory](https://arxiv.org/pdf/alg-geom/9609018). arXiv alg-geom/9609018 v3, 16 May 1997.

Read inventory: Sections 1–2.5, pp. 1–8: mixed quotients, codimension bounds, independence, operations and equivariant Chern classes.; Sections 3.1–3.2, pp. 13–14: torus approximations and polynomial Chow rings.; Sections 5.1–5.3, pp. 27–29: quotient stack comparison and invariance of the integral theory.

Acquired file SHA-256: `9a7b60f5b4584c3dc44d759bc10d3a0915280edc5f3cc5377477d9a4baed3df8`.

### groth-hodge

Alexandre Grothendieck; public transcription by Denise Vella-Chemla. [Sur une note de Mattuck–Tate](https://denisevellachemla.eu/AG-Mattuck-Tate.pdf). 1958 article, J. reine angew. Math. 200, 208–215; LaTeX transcription August 2022, 12 PDF pages.

Read inventory: Entire transcription, Sections 1–3 and bibliography, PDF pp. 1–12. Theorem 1.1 and Proposition 2.1 with proof, pp. 1 and 4–6; product-of-curves inequality (1.8), p. 3. Transcription pagination differs from the journal.

Acquired file SHA-256: `23d5fd52d2a9c36960bdf427e431c5a0e311577a20007e3be2ba5710013777a0`.

### stacks-modules

The Stacks Project Authors. [Sheaves of Modules](https://stacks.math.columbia.edu/download/modules.pdf). Chapter 17, version ed88ff78, compiled 14 July 2026.

Read inventory: Definition 17.4.1 and Lemmas 17.4.2–17.4.3, pp. 4–5: sections as maps from the unit module, global generation and its stalk/tensor tests.

Acquired file SHA-256: `7effc55750a81b6969a94ca3432fb71c366b3d91acdd4016ea4149dd28b475e6`.

### stacks-properties

The Stacks Project Authors. [Properties of Schemes](https://stacks.math.columbia.edu/download/properties.pdf). Chapter 28, version ed88ff78, compiled 14 July 2026.

Read inventory: Definition 28.27.1 through Proposition 28.27.13 and Lemmas 28.27.14–15, pp. 41–46: ample sections, positive powers, closed restriction and the finite-generation criterion.

Acquired file SHA-256: `2f5b9ba41e07dd3a888da40496e07afae6caedd550597d96313ab16db4380316`.

### stacks-morphisms

The Stacks Project Authors. [Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf). Chapter 29, version ed88ff78, compiled 14 July 2026.

Read inventory: Definitions 29.38.1 and 29.39.1, Lemmas 29.39.2/7/8 and 29.40.1/3/4/5/8, pp. 83–93: relative positivity, finite type projective embeddings, eventual very ampleness and base change.

Acquired file SHA-256: `0bebe1d93baa7e4e99cb4f36fe50c7bcb6094772b8a2f760885a492892eca75f`.

## Source corrections used by the plan

The locators refer to the exact read versions above. A reported error in the 2022 Grothendieck transcription is attributed to that transcription, and the Edidin–Graham shift finding is restricted to arXiv v3. The Milne Hodge implication was checked visually and is correct in the source; an extraction artefact is not a source erratum.

### SchemeAndStackFoundations/E-SF5-1

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.6 Theorem 6.2(d), printed p. 99, 20 July 2023 author notes.

Observed form, in our words: The excess formula labels its target A_(n−d−e), where e is the excess rank.

Corrected form: The target is A_(n−d); the rank-e cap is applied after a codimension-(d−e) Gysin.

Reason: The total grade loss is (d−e)+e=d; Corollary 5.8, p. 96 and Stacks 42.54.3–4 confirm it.

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-2

[J. S. Milne, Algebraic Geometry, Chapter 11: Surfaces](https://www.jmilne.org/math/CourseNotes/AG11.pdf), Proposition 11.6(a), p. 7, 4 November 2024 AG11.

Observed form, in our words: The tensor support is described as the union of the two divisor supports.

Corrected form: For effective Cartier D,E it is the intersection of their supports; the finite local-length formula also requires proper meeting.

Reason: Tensoring two disjoint effective divisor quotient modules gives zero, not support on their union.

Correction search/status: new. 2026-10-09: Milne course page and addenda/correction search for AG11 Proposition 11.6; no correction found.

### SchemeAndStackFoundations/E-SF5-3

[The Stacks Project Authors, Chow Homology and Chern Classes](https://stacks.math.columbia.edu/download/chow.pdf), Proof of Lemma 42.46.11, tag 0FAG, p. 98, ed88ff78.

Observed form, in our words: The displayed P₂ tensor-product and c₁ tensor-square expansions carry one copy of each mixed P₁P₁ or c₁c₁ term.

Corrected form: Both mixed terms require coefficient 2.

Reason: Squaring r_F c₁(E)+r_E c₁(F) gives 2r_Er_F c₁(E)c₁(F). For two lines on P² the corrected expression has c₂(E⊗F)=0.

Correction search/status: new. 2026-10-09: live tag 0FAG proof and comments (same formula; no comments), Stacks correction/history search; no correction found.

### SchemeAndStackFoundations/E-SF5-4

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), II.4 proof of Proposition 4.6, printed p. 61.

Observed form, in our words: With r,s explicitly the bundle ranks, the proof uses ξ^(r+i) and ξ^(s+j) to define their Segre push expressions.

Corrected form: Use ξ^(r−1+i) and ξ^(s−1+j), or rename r,s as projective relative dimensions.

Reason: For a rank-one bundle, the zeroth Segre push is π_*π*a=a, not π_*(ξπ*a). The earlier projective formula uses rank minus one.

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-5

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.4 proof of Proposition 4.1, final line, printed p. 92.

Observed form, in our words: The Proj of the normal graded algebra is identified with the normal cone itself.

Corrected form: It is P(C_YX); the normal cone is relative Spec of that algebra.

Reason: For an origin in A¹, the projectivized normal cone is P⁰ and the normal cone is A¹.

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-6

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.6 Definition 6.1, printed p. 98.

Observed form, in our words: The image of a support V under the refined map uses X·V where the fixed immersed support is Y.

Corrected form: The support expression is Y·V.

Reason: The preceding definition and fibre product are for the regular immersion Y→X; intersecting the whole ambient X would have grade loss zero.

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-7

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.1 tangent-product display, printed p. 112.

Observed form, in our words: Both tangent summands are pulled back along the first projection.

Corrected form: The T_Y summand uses the second projection.

Reason: T_Y is a module on Y and cannot be pulled back by X×Y→X.

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-8

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), IV.2 Definition 2.1 introductory wording, printed p. 116.

Observed form, in our words: The category of vector bundles is called abelian.

Corrected form: Use its exact-category structure with locally free short exact sequences, not an abelian-category assertion.

Reason: On P¹ the cokernel of multiplication O(−1)→O at a point is a skyscraper, not a vector bundle. K₀ uses the specified exact sequences.

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-9

[Dan Edidin and William Graham, Equivariant intersection theory](https://arxiv.org/pdf/alg-geom/9609018), Section 5.3, definition after Proposition 16, p. 28, arXiv v3.

Observed form, in our words: The stack group A_i([X/G]) is assigned equivariant grade i−dim G.

Corrected form: Use A_(i+dim G)^G(X).

Reason: Proposition 16 immediately above compares A_(i+g)^G(X) across presentations. The mixed quotient has dimension dim X+l−g, which gives the same plus shift.

Correction search/status: new. 2026-10-09: arXiv version history (v3 latest), publisher DOI 10.1007/s002220050214 preview (full text subscription-only), public errata search. Finding scoped to acquired v3, not asserted about the journal text.

### SchemeAndStackFoundations/E-SF5-10

[Alexandre Grothendieck; public transcription by Denise Vella-Chemla, Sur une note de Mattuck–Tate](https://denisevellachemla.eu/AG-Mattuck-Tate.pdf), Section 1, formula (1.2), transcription p. 2.

Observed form, in our words: The determinant sign condition is written (−1)^(m−1)det≤0 for a subspace with a positive direction.

Corrected form: For a nondegenerate restriction of signature (1,m−1), this signed determinant is positive; the inequality is ≥0 including degeneracy.

Reason: For m=1 and f(x,x)>0 the printed sign fails. The statement following (1.2) also uses the corrected positive sign.

Correction search/status: new. 2026-10-09: public transcription and Grothendieck bibliography/archive/translation search; original journal text not acquired, so this finding is limited to the 2022 transcription.

### SchemeAndStackFoundations/E-SF5-11

[Alexandre Grothendieck; public transcription by Denise Vella-Chemla, Sur une note de Mattuck–Tate](https://denisevellachemla.eu/AG-Mattuck-Tate.pdf), Section 3, formula (3.7 bis), transcription p. 9.

Observed form, in our words: The equivalent canonical-square inequality has K²≤8χ(X).

Corrected form: The preceding χ(K/2)≤0 and χ(K/2)=−K²/8+χ(X) imply K²≥8χ(X).

Reason: Rearranging the displayed equality reverses the printed inequality; its equivalent signature sign (3.7 ter) agrees with the correction.

Correction search/status: new. 2026-10-09: public transcription and Grothendieck bibliography/archive/translation search; original journal text not acquired, so this finding is limited to the 2022 transcription.

### SchemeAndStackFoundations/E-SF5-12

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), II.4 proof of Proposition 4.6, printed p. 61.

Observed form, in our words: The projection-formula test class α is assigned to A_*(X), although f:Y→X and f_*(s_i(E)∩α) requires α on Y.

Corrected form: Assign α to A_*(Y).

Reason: Both the cap by a bundle on Y and its subsequent f-push have source A_*(Y).

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-13

[Thomas Krämer, Intersection Theory](https://www.mathematik.hu-berlin.de/~kraemeth/old-stuff/intersection/Notes.pdf), III.5 Remark 5.4, printed p. 94.

Observed form, in our words: The component expansion omits the generic multiplicities m_i and labels the target using dim W−d.

Corrected form: Use Σ_i m_i(Y·Z_i) in A_(dim Z−d)(W).

Reason: A doubled integral support must contribute twice its refined intersection; the operation lowers the input support dimension by d even when the inverse image has excess dimension.

Correction search/status: new. 2026-10-09: author course/archive page and public search for errata/corrections; no posted correction found.

### SchemeAndStackFoundations/E-SF5-14

[The Stacks Project Authors, Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf), Proof of Lemma 29.40.8, tag 0FVC, p. 93, ed88ff78.

Observed form, in our words: The final Segre argument calls j an immersion, although j was built only from globally generating sections.

Corrected form: Use j_d, the previously constructed immersion from the sufficiently high ample power, to make (j,j_d) an immersion.

Reason: A generated line can give a constant map, so j itself need not be an immersion; its second component is the stated embedding.

Correction search/status: Stacks tag 0FVC, Comment 11743 by K. F., 14 September 2026, https://stacks.math.columbia.edu/tag/0FVC#comment-11743. 2026-10-09: acquired ed88ff78 PDF, live tag 0FVC proof/comments and public Stacks correction search; the matching September 14, 2026 Comment 11743 reports this slip.

Recorded correction: [Stacks comment](https://stacks.math.columbia.edu/tag/0FVC#comment-11743).

## Restructuring and atlas planets

- WORKERS upstream-tier order puts SchemeAndStackFoundations in tier 2 and AlgebraicModuliForArithmeticGeometry in tier 4. General projective/flag quotient bundles, O(1) and the projective positivity language must be below Chern/GRR rather than an upward R09.1 import. Own projective-bundle, flag-bundle and projective-positivity in SF.5, with relative Proj in SF.0. R09.1 imports those nodes and retains Grassmannian/lattice/base-change, boundedness and arithmetic moduli specifics. General Picard boundedness needed by Keel moves to the requested SF.1 extension rather than citing R09.3 upward.
- The regular-sequence Koszul and scheme-site DM/quotient-stack carriers are lower foundational proof inputs. Their higher-tier occurrences cannot supply tier-2 SF.5. Supply the general Koszul complex/regular-sequence exactness through SF.0, adopting the existing DD.1/koszul-complex exterior-power design. Supply finite-type scheme-site Artin/DM stacks and mixed quotients in SF.1; higher derived and v-stack consumers import these foundations without being SF.5 ancestors.
- RT-AREA-algebraicgeometry/15 identifies SF.4 and forwarded Néron/reduction edges as unrelated to intersection theory. Remove SF.4→SF.5 and the forwarded R11.1, R11.3 and StableReduction Layers 7,8,9 inputs. Keep existing StableReduction Layer 4 for blowups and arithmetic pairing; add exact SF.3 curve inputs and the unique SF.2 coherent-duality/smooth-proper/serre-proper nodes. Keel requests only its precise contraction/formal-functions inputs, never the whole reduction chain.

The six SF.5 planets are **Chow groups**, **Chern classes**, **Refined Gysin maps**, **Grothendieck–Riemann–Roch theorem**, **Hodge index theorem**, **Keel semiampleness theorem**. These mark central objects and named theorems, with every implementation unchecked.

## Acceptance of this planning pass

The packet contains 80 declaration nodes: 11 definitions, 24 constructions and 45 theorem targets. Its definitions and constructions have 105 API items and 105 named unit tests; each has at least three of each. The reader, packet and suggested file name the same declarations, APIs and examples. The pinned declaration index matches both baseline commits. The packet checker reports zero errors and zero warnings.

The suggested file elaborated at the pinned baseline using the shared Lean checker. Its warnings concern unproved planned declarations. Elaboration checks the stated types and examples; it proves none of the mathematical targets. Omitted hypotheses are listed with each node and must be restored in an implementation. No stage is closed: SF.5 is planned with 11 explicit gaps and 10 precise requests. The [handoff](../handoff/BP-SchemeAndStackFoundations--SF.5.md) records where an independent review and proof-closure pass should start.
