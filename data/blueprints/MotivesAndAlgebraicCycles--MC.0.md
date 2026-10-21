# Correspondences, equivalence and support of algebraic cycles — MC.0

This layer builds the algebra of correspondences on smooth projective schemes, compares equivalence relations on cycles, and supplies two integral tools: support of zero-cycles and Euler characteristic modulo a lower index. The correspondence category is the input to the motive constructions of MC.1. The support and Euler tools are inputs to the real-cycle questions of MC.7. Their coefficient conventions differ deliberately: rational coefficients for the classical correspondence category, integral coefficients before the support and Euler arguments.

Every mathematical statement below is a target specification. The native baseline contains locally finite point cycles and a codimension-one divisor comparison; it does not contain general Chow groups, rational equivalence, intersection products or these correspondence categories. No implementation is asserted.

The layer has 34 target specifications: nineteen supplied by the [existing correspondence plan](../packets/MotivesAndAlgebraicCycles.json) and fifteen additional targets in the [MC.0 packet](../packets/MotivesAndAlgebraicCycles--MC.0.json). Each supplied target retains its identifier and ownership. This document collects their specifications so that a reader can use the whole layer without reconstructing its conventions from separate files. Definitions and constructions carry their API and discriminating tests. The coverage is **planned**: all targets have dependency chains, with three precise verification obligations and eight supplier extensions stated below. [Independent review](../reviews/REV-MotivesAndAlgebraicCycles--MC.0.md) accepted this target-level planning pass on 19 October 2026 after corrections; it did not certify closed coverage or implementation.

## Conventions

A field is denoted by \(k\). Schemes in the correspondence category are smooth projective over \(k\); proper variants used by the real-support application are specified explicitly. Write \(X=\coprod_d X_d\) for its finite decomposition by pure dimension. General finite-type schemes are allowed in the algebraic-equivalence and Euler definitions under the hypotheses stated there. Integral Chow groups and all their operations come from SchemeAndStackFoundations:SF.5.

For the correspondence category use

\[
 \operatorname{Corr}^r(X,Y)
 =\bigoplus_d \operatorname{CH}^{d+r}(X_d\times_kY)\otimes\mathbf Q.
\]

For pure-dimensional \(X\) of dimension \(d\), this is \(\operatorname{CH}^{d+r}(X\times Y)_{\mathbf Q}\). For \(c:X\rightsquigarrow Y\) of degree \(r\), pin the two actions as

\[
 c_*\alpha=p_{2,*}(c\cdot p_1^*\alpha)
 \in\operatorname{CH}^{i+r}(Y)_{\mathbf Q},
 \quad \alpha\in\operatorname{CH}^i(X)_{\mathbf Q},
\]
\[
 c^*\beta=p_{1,*}(c\cdot p_2^*\beta)
 \in\operatorname{CH}_{j-r}(X)_{\mathbf Q},
 \quad \beta\in\operatorname{CH}_j(Y)_{\mathbf Q}.
\]

Composition is

\[
 c'\circ c=p_{13,*}(p_{12}^*c\cdot p_{23}^*c').
\]

A morphism \(f:Y\to X\) gives the graph \((f,\mathrm{id}_Y)\subset X\times Y\), a degree-zero correspondence **from \(X\) to \(Y\)**. Its forward action is \(f^!\), its reverse action is \(f_*\). For pure dimensions \(d=\dim X\), \(e=\dim Y\), transposition changes degree \(r\) to \(r+d-e\). In particular the graph-against-diagonals identity has degree \(-e\), not \(d\).

A characteristic-zero coefficient field \(F\) is allowed for adequate quotients. Algebraic equivalence is first an integral subgroup over the ground field; its \(F\)-linear relation is the span of its image after scalar extension. Homological equivalence always names a selected geometric classical Weil theory. Integral **arithmetic** étale cohomology in the quadric example is a separate cycle-class target. Rationalization kills that example’s torsion class.

Support of zero-cycles is integral. Universal support of dimension at most \(s\) quantifies over **every algebraically closed extension**, with a support allowed to depend on that extension. A fixed support surjecting on zero-cycles over **all** extensions is a stronger, separately named input. Integral universal triviality over all extensions is not inferred from the first condition.

For Euler indices, \(\operatorname{ELW}_i(X)\) is an ideal of \(\mathbf Z\) and \(\operatorname{ind}_i(X)\) its nonnegative generator. Set \(\operatorname{ELW}_{-1}=0\), including \(\mathbf Z/(0)=\mathbf Z\). Ideal inclusion \(\operatorname{ELW}_i\subset\operatorname{ELW}_{i+1}\) means \(\operatorname{ind}_{i+1}\mid\operatorname{ind}_i\). The Euler characteristic of a formal cycle is the coefficientwise sum on its integral components, not the Euler characteristic of their union.

## Baseline and ownership

The checked pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

| Existing declaration | What it supplies | What MC.0 imports from a mathematical owner |
| --- | --- | --- |
| `AlgebraicGeometry.AlgebraicCycle` | Locally finite, weighted point cycles | SF.5: dimension grading, Chow quotient and operations |
| `AlgebraicGeometry.AlgebraicCycle.map` | Quasi-compact weighted-cycle map with the coefficient-preservation condition | SF.5: proper Chow pushforward and its descent through rational equivalence |
| `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivFiniteCodimensionOneCycles` | Native Weil divisors as finite integer codimension-one cycles | JacobianChallenge and SF.3: divisor/Picard and curve interfaces; SF.5: higher codimension |

These declarations were read in their actual Lean source at the pins. Searches in the current read-only Tau Ceti library gave the same boundary for this layer. The reviewed SF.5 library audit records partial point-cycle coverage, not an implemented Chow ring. AlgebraicVectorBundles supplies its native bundle/relative-Spec interfaces; its Chow motivation does not supply intersection theory. JacobianChallenge supplies the existing curve-divisor/Picard/coherent-cohomology direction. RealAlgebraicGeometry supplies real algebraic geometry and explicitly excludes semialgebraic homology, so its CAD interface cannot supply the cohomology sheaves below.

| Owner | Interface used here |
| --- | --- |
| SchemeAndStackFoundations:SF.5 | Integral Chow groups; proper push; flat pull; localization; refined Gysin and interchange; smooth intersection; degree; projective bundle and excess formulas |
| SchemeAndStackFoundations:SF.3; TauCetiRoadmap/JacobianChallenge | Smooth projective curve models, Picard/Jacobian and Abel maps; divisibility through multiplication on Jacobians |
| SchemeAndStackFoundations:SF.4 | Prescribed-point Bertini; Chow lemma; characteristic-zero smooth models of supports |
| SchemeAndStackFoundations:SF.2 | Coherent Euler characteristic; Bloch–Ogus and real closed semialgebraic cohomology interfaces; integral arithmetic Hochschild–Serre adapter |
| SchemeKTheoryOperations:S.3 and S.7 | Coherent support dévissage; cycle-to-graded-\(G_0\); proper Euler pushforward; the integral quadric filtration adapter |
| QuadraticFormInvariantsPartII:Q2.2 and Q2.4 | Odd-degree anisotropy and the explicit Laurent-valuation/Clifford-index calculation |
| EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map | Cycle-class supplier, with the additional arithmetic integral compatibility requested below |
| Early MC.2 cohomology nodes and the geometric class-map formula below | Weil-cohomology data, classical axioms, componentwise cohomology, homological equivalence and flat field-extension limits; these precede the realization on motives |

The elementary Chow operations already have exact supplier nodes. The extensions not covered by those nodes are specified under MC0-R1–R8, rather than assumed from their stage names. The order for quotient comparisons is: early Weil axioms and Chow operations → algebraic/homological comparison → adequate quotient correspondences → MC.1 motives → realization functors on motives. A reference to the early MC.2 nodes is not a prerequisite on the whole realization stage. In particular the full MC.2/weil-cohomology-by-base-change node lists MC.1/motives-universal-property: its elementary class-map formula is used directly below, and assembly must separate it from the later realization construction.

## Correspondence algebra

The following nineteen targets retain the identifiers in the existing correspondence plan. Their specifications below use the pinned conventions above.
### Correspondences of degree r

**Target:** `MotivesAndAlgebraicCycles:MC.0/correspondence-group` (definition).

Let k be a field and let X and Y be smooth projective schemes over k. Write X as the disjoint union of its open and closed parts X_d that are equidimensional of dimension d. For an integer r define the Q-vector space of correspondences of degree r from X to Y as the direct sum over d of CH^{d+r}(X_d times Y) tensored with Q, viewed inside CH^*(X times Y) tensor Q. The grading is by codimension on each equidimensional part, and the shift by d is what makes the degree of a graph equal to zero whatever the dimension of X.

**Hypotheses.** k is a field. Chow groups are taken with rational coefficients. The integral Chow groups CH^i are imported from SF.5 and tensored with Q here, so the integral groups are retained upstream of this definition, as the layer's boundary requires. X and Y are smooth projective, without an equidimensionality or connectedness assumption. Smooth proper versions use the same Chow operations and must carry those interfaces explicitly.

**API.**

- `Corr` (data): For smooth projective X and Y over k and an integer r, the Q-vector space of correspondences of degree r from X to Y.
- `Corr.toChow` (coercion): The inclusion of the correspondences of degree r into CH^*(X times Y) tensor Q.
- `Corr.of_equidimensional` (characterisation): If X is equidimensional of dimension d then the correspondences of degree r from X to Y are exactly CH^{d+r}(X times Y) tensor Q.
- `Corr.of_point` (characterisation): The correspondences of degree r from the spectrum of k to Y are CH^r(Y) tensor Q, and those from X to the spectrum of k are CH_{-r}(X) tensor Q.
- `Corr.addCommGroup` (instance): Corr^r(X, Y) is a Q-vector space, the structure inherited from the Chow groups.
- `Corr.disjointUnion` (compatibility): Corr^r(X disjoint union X', Y) is the product of Corr^r(X, Y) and Corr^r(X', Y).

**Unit tests.**

- **point_to_point.** The correspondences of degree zero from the spectrum of k to itself form Q, and those of nonzero degree vanish.
- **graph_has_degree_zero.** For a morphism f from Y to X of smooth projective schemes the class of the graph of f lies in degree zero, whatever the dimensions of X and Y. A definition without the shift by d puts it in degree dim X.
- **projective_line_degree_zero.** For X the projective line the correspondences of degree zero from X to X are CH^1(X times X) tensor Q, a two-dimensional Q-vector space.
- **point_of_a_surface.** For X a smooth projective surface and x a rational point, the graph of x : Spec(k) -> X lies in Corr^0(X, Spec(k)) = CH^2(X) tensor Q, the zero-cycles of X. A grading without the shift by dim X would put degree-zero correspondences from X to Spec(k) in CH^0(X) tensor Q = Q[X] and would not contain this graph.

**Construction or proof.**

1. Decompose X into the open and closed subschemes X_d equidimensional of dimension d; this decomposition is finite and canonical.
2. For each d take CH^{d+r}(X_d times Y) tensor Q and form the direct sum over d.
3. Check that the sum embeds in CH^*(X times Y) tensor Q, so a correspondence is a rational cycle class on the product and nothing more.
4. Record that degree zero is the degree of a graph: for a morphism from Y to X the graph meets X_d times Y in pure codimension d.

**Check.** For X equidimensional of dimension d the group of correspondences of degree r from X to Y is CH^{d+r}(X times Y) tensor Q; a definition that forgets the shift by d fails this already for X a point against X a curve. For X the spectrum of k the group of correspondences of degree r from X to Y is CH^r(Y) tensor Q. The group is a Q-vector space and vanishes for r outside a finite range determined by the dimensions of X and Y.

**Uses.** MotivesAndAlgebraicCycles:MC.0/correspondence-composition: the composition law is defined on these groups and raises the degree additively MotivesAndAlgebraicCycles:MC.1/chow-motive: a morphism of motives from (X, p, m) to (Y, q, n) is an element of Corr^{n-m}(X, Y) fixed by p on the right and q on the left MotivesAndAlgebraicCycles:MC.2/realization-equivalence: a realisation is determined by what it does to these groups, since every morphism of motives is one of their elements

**Dependencies.** `SchemeAndStackFoundations:SF.5`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.AlgebraicCycle`.

**Source.** **STACKS.WEIL**, Section 0FFZ, the displayed definition opening the section (§3, pp. 3–4). The node is that formula, with the decomposition of X into equidimensional parts spelled out as a hypothesis rather than left to the notation.
### Pullback and pushforward of cycles by a correspondence

**Target:** `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles` (construction).

Let c be a correspondence of degree r from X to Y. For a cycle class b in CH_j(Y) tensor Q define the pullback of b by c to be the pushforward along the first projection of the intersection product of c with the pullback of b along the second projection; it lies in CH_{j-r}(X) tensor Q. For a cycle class a in CH^i(X) tensor Q define the pushforward of a by c to be the pushforward along the second projection of the intersection product of c with the pullback of a along the first projection; it lies in CH^{i+r}(Y) tensor Q. Both are Q-linear in the cycle and in c.

**Hypotheses.** X and Y are smooth projective over k, so that the projections from X times Y are proper and flat on each equidimensional part. c is a correspondence of degree r from X to Y. Cycle classes are rational.

**API.**

- `Corr.pullback` (data): The map from CH_j(Y) tensor Q to CH_{j-r}(X) tensor Q attached to a correspondence of degree r.
- `Corr.pushforward` (data): The map from CH^i(X) tensor Q to CH^{i+r}(Y) tensor Q attached to a correspondence of degree r.
- `Corr.pullback_linear` (functoriality): Both operations are Q-linear in the cycle class and additive in the correspondence.
- `Corr.pullback_diagonal` (simp): Pullback and pushforward by the class of the diagonal are the identity.
- `Corr.pushforward_degree` (projection): The degree bookkeeping, stated as an equality of the gradings rather than as a side condition.

**Unit tests.**

- **diagonal_acts_trivially.** Pullback and pushforward by the diagonal class of X are the identity on CH_*(X) tensor Q and on CH^*(X) tensor Q.
- **point_times_line_on_P1.** For X = P^1_k, x a rational point and c = [x × X] in Corr^0(X, X): c_* fixes [X] in CH^0(X) and kills the class of a point in CH^1(X), while c^* kills [X] in CH_1(X) and fixes the class of a point in CH_0(X). An implementation that exchanges the roles of pr_1 and pr_2 in the two formulas fails this.
- **zero_and_diagonal.** The zero correspondence induces the zero maps in both directions, and the diagonal, which is nonzero, induces the identity maps.

**Construction or proof.**

1. Check that the second projection restricted to X_d times Y is flat of relative dimension d, so that the flat pullback of a cycle of dimension j is a cycle of dimension d + j.
2. Intersect with c, which lies in codimension d + r on X_d times Y, to land in dimension j - r.
3. Push forward along the first projection, which is proper, preserving dimension, and conclude that the pullback lands in CH_{j-r}(X) tensor Q.
4. Repeat the bookkeeping in codimension for the pushforward: the first projection pullback of a class of codimension i has codimension i, the product with c has codimension i + d + r on X_d times Y, and the proper pushforward along the second projection lands in codimension i + r on Y.
5. Prove Q-bilinearity of both operations in c and in the cycle, from linearity of flat pullback, proper pushforward and the intersection product.

**Check.** The degrees are as stated: pullback lowers dimension by r and pushforward raises codimension by r. An implementation that keeps the degree fixed is wrong. For c the class of the diagonal both operations are the identity. Both operations are Q-linear in the cycle and in the correspondence.

**Uses.** MotivesAndAlgebraicCycles:MC.0/composition-associative: the compatibility of composition with these two operations is part (4) of the composition lemma MotivesAndAlgebraicCycles:MC.1/chow-group-of-motive: the functoriality of the Chow groups of a motive is pushforward by the morphism, read through this operation

**Dependencies.** `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0/correspondence-group`.

**Source.** **STACKS.WEIL**, Section 0FFZ, the two displayed formulas after the definition of Corr^r(X, Y) (§3, pp. 3–4). The node is those two formulas together with the dimension bookkeeping the source gives immediately after each, which is what fixes the target degrees.
### Composition of correspondences through the triple product

**Target:** `MotivesAndAlgebraicCycles:MC.0/correspondence-composition` (construction).

For smooth projective X, Y, Z over k define a Q-bilinear composition from correspondences of degree s from Y to Z and correspondences of degree r from X to Y to correspondences of degree r + s from X to Z by sending a pair (c', c) to the pushforward along the projection from X times Y times Z to X times Z of the intersection product of the pullback of c along the projection to X times Y with the pullback of c' along the projection to Y times Z.

**Hypotheses.** X, Y and Z are smooth projective schemes over k. c is a correspondence of degree r from X to Y and c' one of degree s from Y to Z. The three projections from the triple product are used: the first two are flat on each equidimensional part and the projection to X times Z is proper.

**API.**

- `Corr.comp` (data): The composition map from correspondences of degree s from Y to Z and degree r from X to Y to correspondences of degree r + s from X to Z.
- `Corr.comp_bilinear` (functoriality): Composition is Q-bilinear in each argument.
- `Corr.comp_degree` (projection): The degree of a composite is the sum of the degrees.
- `Corr.comp_graph` (compatibility): The composite of the graphs of two morphisms is the graph of the composite, with the order reversed.

**Unit tests.**

- **degree_adds.** The composite of a correspondence of degree one and one of degree minus one has degree zero.
- **projective_line_projectors.** On the projective line the classes of a point times the line and of the line times a point compose to zero in both mixed orders and to themselves in the two pure orders.
- **diagonal_is_a_unit.** Composition with the class of the diagonal of X is the identity on correspondences into and out of X.

**Construction or proof.**

1. Pull c back along the projection to X times Y and c' back along the projection to Y times Z, both flat pullbacks on each equidimensional piece.
2. Take the intersection product of the two pulled back classes on the triple product.
3. Push the result forward along the proper projection to X times Z.
4. Check the degree: the result has degree r + s, by the same dimension count as for the action on cycles.
5. Check Q-bilinearity, from linearity of flat pullback, proper pushforward and the intersection product.

**Check.** Composition is Q-bilinear and raises degree additively. Composing the graphs of two composable morphisms gives the graph of the composite, in the opposite order. Composition with the class of the diagonal on either side is the identity.

**Uses.** MotivesAndAlgebraicCycles:MC.0/category-of-correspondences: composition is the composition of the graded category MotivesAndAlgebraicCycles:MC.1/chow-motive: composition of morphisms of motives is this composition, restricted to the subgroups cut out by the projectors

**Dependencies.** `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0/correspondence-group`.

**Source.** **STACKS.WEIL**, Section 0FFZ, the display defining the composition of correspondences (§3, pp. 3–4). The node is that display, with the flatness and properness of the three projections written out as the hypotheses the pullbacks and the pushforward need.
### Composition of correspondences is bilinear and associative

**Target:** `MotivesAndAlgebraicCycles:MC.0/composition-associative` (theorem).

Composition of correspondences is Q-bilinear and associative: for smooth projective X, Y, Z, W over k and c in Corr^r(X, Y), c' in Corr^s(Y, Z), c'' in Corr^t(Z, W) one has c'' o (c' o c) = (c'' o c') o c in Corr^{r+s+t}(X, W).

**Hypotheses.** X, Y, Z and W are smooth projective over k. All cycle classes are rational.

**Construction or proof.**

1. Bilinearity: from the linearity of flat pullback and proper pushforward and the bilinearity of the intersection product.
2. Expand c'' o (c' o c) on X × Y × Z × W in five equalities, as the source does: (i) the definition of composition; (ii) flat pullback along pr^{134}_{13} after proper pushforward along pr^{123}_{13} equals proper pushforward along pr^{1234}_{134} after flat pullback along pr^{1234}_{123}, for the fibre square of projections (Stacks 02RG); (iii) flat pullback along pr^{1234}_{123} commutes with the intersection product (Stacks 0FFB, with 0FF4 identifying the Gysin map of a flat morphism with flat pullback), together with functoriality of flat pullback for the composite projections; (iv) the projection formula for pr^{1234}_{134} (Stacks 0FFC), again with functoriality of flat pullback; (v) functoriality of proper pushforward (Stacks 02R5).
3. The result is pr^{1234}_{14,*}((pr_{12}^*c . pr_{23}^*c') . pr_{34}^*c''). The same five steps applied to (c'' o c') o c give pr^{1234}_{14,*}(pr_{12}^*c . (pr_{23}^*c' . pr_{34}^*c'')), and associativity of the intersection product (Stacks 0FC1) identifies the two.
4. The source labels the justification of step (v) as a second 'fourth equality' (sourceIssues MotivesAndAlgebraicCycles/E3); the five justifications are the ones listed here.

**Check.** Associativity is an equality of correspondences of degree r + s + t, not merely of their actions on cycles. Bilinearity holds in each argument separately. On the projective line with the projectors c_0 and c_2 of Example 0FG6, both bracketings of c_2 o c_0 o c_2 are zero and both bracketings of c_0 o c_0 o c_0 are c_0.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Lemma 0FG0, part (1), with the proof of associativity (§3, pp. 3–4). The node is part (1) of the lemma with the source's five-step proof of associativity; parts (2) to (4) are separate nodes.
### The graph of a morphism as a correspondence of degree zero

**Target:** `MotivesAndAlgebraicCycles:MC.0/graph-correspondence` (construction).

Let f be a morphism from Y to X of smooth projective schemes over k and let the graph of f be the image of the closed immersion (f, identity) from Y into X times Y. Then the intersection of the graph with X_d times Y has pure codimension d for every d, so the class of the graph is a correspondence of degree zero from X to Y.

**Hypotheses.** f is a morphism of smooth projective schemes over k, from Y to X. X is decomposed into its equidimensional parts X_d.

**API.**

- `Corr.graph` (constructor): The correspondence of degree zero from X to Y attached to a morphism f from Y to X.
- `Corr.graph_id` (simp): The graph of the identity of X is the class of the diagonal of X.
- `Corr.graph_comp` (functoriality): The graph of a composite is the composite of the graphs, in the opposite order.
- `Corr.graph_degree` (projection): The graph of a morphism has degree zero.

**Unit tests.**

- **graph_of_identity.** The graph of the identity is the diagonal class, which is the unit for composition.
- **graph_of_a_rational_point.** For a rational point x of X, viewed as a morphism x : Spec(k) -> X, the graph of x is the class of x in Corr^0(X, Spec(k)) = CH_0(X) tensor Q (codimension dim X on X, not codimension zero). Composing it with the graph of the structure morphism X -> Spec(k), which is [X] in Corr^0(Spec(k), X) = CH^0(X) tensor Q, gives [x × X] in Corr^0(X, X), and composing in the other order gives the identity of Spec(k).
- **contravariance.** The graph of the composite g after f is the composite of the graph of f with the graph of g in the opposite order. A covariant convention fails this.

**Construction or proof.**

1. Show that (f, identity) is a closed immersion, because X is separated over k and a graph is the pullback of its diagonal.
2. Compute the dimension of the graph over each part: the intersection of the graph with X_d times Y is isomorphic to the preimage of X_d in Y, of dimension equal to that of that preimage, so its codimension in X_d times Y is d.
3. Conclude that the class of the graph lies in CH^d(X_d times Y) tensor Q for each d, that is, in degree zero.

**Check.** The degree is zero for every f, independently of the dimensions of X and Y. For f the identity the graph is the diagonal. The construction is compatible with composition in the reverse order, which is the content of the functoriality statement.

**Uses.** MotivesAndAlgebraicCycles:MC.0/correspondence-functor: the graph construction is the action on morphisms of the contravariant functor into correspondences MotivesAndAlgebraicCycles:MC.1/motive-functor-h: the motive functor sends a morphism to the class of its graph

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-group`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Example 0FG1 (§3, p. 4). The node is that example, with the codimension computation made a proof step. The source's 'Corr^0(X times Y)' is a misprint for Corr^0(X, Y) (sourceIssues MotivesAndAlgebraicCycles/E6); the node uses the corrected group.
### The graded category of correspondences

**Target:** `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences` (construction).

Smooth projective schemes over k, with the groups of correspondences as graded morphism spaces and the composition above, form a graded category over Q. The identity of X is the class of the diagonal of X, which is the graph of the identity morphism.

**Hypotheses.** k is a field. Objects are smooth projective schemes over k; morphism spaces are the graded correspondence groups.

**API.**

- `CorrCat` (data): The graded category over Q whose objects are smooth projective schemes over k and whose morphisms of degree r are the correspondences of degree r.
- `CorrCat.id_eq_diagonal` (characterisation): The identity of X in this category is the class of the diagonal.
- `CorrCat.linear` (instance): Each morphism space is a Q-vector space and composition is Q-bilinear.
- `CorrCat.degree_zero_subcategory` (structure): The degree zero part is an ordinary Q-linear category, the one the motive functor factors through.
- `CorrCat.biproduct` (structure): The degree zero category is additive: a disjoint union X' coproduct X'' is a biproduct of X' and X'' and the empty scheme is a zero object. This is promoted to the lemma node MC.0/correspondences-of-disjoint-union, which the additivity of motives and the motive of a disjoint union use.

**Unit tests.**

- **diagonal_is_identity.** The diagonal class composed with any correspondence on either side returns it.
- **endomorphisms_of_the_point.** The degree zero endomorphisms of the spectrum of k form Q.
- **endomorphisms_of_the_line.** The degree zero endomorphisms of the projective line form the product of two copies of Q, with the two orthogonal projectors as the idempotents.

**Construction or proof.**

1. Take bilinearity and associativity of composition from the composition lemma.
2. For the identity, prove that composing the class of the diagonal with an arbitrary correspondence gives back that correspondence. Reduce to the class of an integral closed subscheme Z of X times Y, then to X and Y integral.
3. Identify the image of Z under the map (diagonal, identity) with the scheme theoretic intersection of the diagonal times Y with X times Z inside X times X times Y, check that the dimensions add up to a proper intersection and that the generic point has Cohen-Macaulay local rings, and apply the proper intersection formula to identify the intersection product with the class of that image.
4. Push forward along the projection to X times Y, which maps that image isomorphically to Z, and conclude.
5. Repeat on the other side.

**Check.** The diagonal class is a two-sided identity, not only an identity on the action on cycles. Composition is associative and bilinear, so the data is a graded category over Q. The morphism spaces in each degree are Q-vector spaces and the composition respects the grading additively.

**Uses.** MotivesAndAlgebraicCycles:MC.1/chow-motive: motives are built from the degree zero part of this category by splitting idempotents and adding a twist MotivesAndAlgebraicCycles:MC.1/motives-universal-property: the universal property is stated for functors out of the degree zero part of this category

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/composition-associative`, `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`, `mathlib:CategoryTheory.Preadditive`, `mathlib:CategoryTheory.Linear`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Lemma 0FG2 with its proof (§3, pp. 4–5). The node is the lemma, with the source's proof of the identity axiom turned into the proof steps, including the reduction to integral X and Y and the proper intersection input the source cites (Stacks 0FFD).
### The contravariant functor from schemes to correspondences

**Target:** `MotivesAndAlgebraicCycles:MC.0/correspondence-functor` (theorem).

There is a contravariant functor from the category of smooth projective schemes over k to the degree zero part of the category of correspondences which is the identity on objects and sends a morphism f from Y to X to the class of its graph, a correspondence of degree zero from X to Y.

**Hypotheses.** f and g are morphisms of smooth projective schemes over k, with g from Z to Y and f from Y to X.

**Construction or proof.**

1. Identities go to identities, because the graph of the identity is the diagonal.
2. For composites, reduce as in the identity axiom to X, Y and Z integral and show that the composite of the two graph classes is the pushforward along the projection to X times Z of the intersection product of the graph of f times Z with X times the graph of g.
3. Identify that intersection scheme theoretically with the image of Z under the map (f after g, g, identity), check the proper intersection hypotheses and apply the proper intersection formula.
4. Push forward along the projection to X times Z and identify the result with the graph of f after g.

**Check.** The functor is contravariant: the graph of f after g is the composite of the graph of f with the graph of g in the opposite order. It is the identity on objects, so it does not change the indexing of the theory. It lands in degree zero.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`, `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`.

**Source.** **STACKS.WEIL**, Lemma 0FG3 with its proof (§3, p. 5). The node is the lemma, with the source's proof of functoriality on composites written out in the four steps, including the identification of the scheme theoretic intersection the source performs.
### The transpose of a correspondence

**Target:** `MotivesAndAlgebraicCycles:MC.0/transpose-correspondence` (construction).

Let X be equidimensional of dimension d and Y equidimensional of dimension e, both smooth projective over k. The isomorphism from X times Y to Y times X switching the factors induces an isomorphism from the correspondences of degree r from X to Y to the correspondences of degree d - e + r from Y to X, called the transpose. It is defined on cycles as well as on cycle classes, and the transpose of the graph of a morphism f from Y to X is the transposed graph.

**Hypotheses.** X and Y are smooth projective over k and equidimensional, of dimensions d and e; the transpose is not defined by this formula without equidimensionality. r is an integer.

**API.**

- `Corr.transpose` (data): The transpose isomorphism between correspondence groups, with its degree shift.
- `Corr.transpose_graph` (simp): The transpose of the graph of f is the transposed graph.
- `Corr.transpose_transpose` (characterisation): Transposing twice is the identity, after the two degree shifts cancel.
- `Corr.transpose_comp` (compatibility): The transpose of a composite is the composite of the transposes in the opposite order.

**Unit tests.**

- **transpose_of_the_diagonal.** The transpose of the diagonal class of X is itself.
- **degree_shift_is_real.** For X a surface and Y a curve the transpose of a degree zero correspondence from X to Y has degree one; a transpose that preserves the degree fails this.
- **transpose_involution.** Transposing the transpose of a correspondence returns it.

**Construction or proof.**

1. Take the isomorphism of schemes switching the two factors and its induced isomorphism on Chow groups.
2. Compute the effect on the grading: a class of codimension d + r on X times Y becomes a class of codimension d + r on Y times X, which is codimension e + (d - e + r), that is, degree d - e + r.
3. Record that the construction is defined on cycles and descends to classes, since the switch is an isomorphism of schemes.
4. Check the effect on graphs.

**Check.** The degree shift is d - e + r and not r; for X a surface and Y a curve the transpose of a degree zero correspondence has degree one. The transpose is an isomorphism of Q-vector spaces and is an involution up to the degree bookkeeping. The transpose of the graph of f is the transposed graph of f.

**Uses.** MotivesAndAlgebraicCycles:MC.0/graph-acts-as-gysin-and-pushforward: the transposed graph is what makes the Gysin map and the proper pushforward both available as correspondences MotivesAndAlgebraicCycles:MC.3/trace-formula-for-correspondences: Jannsen's trace formula pairs a correspondence with the transpose of another

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-group`, `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`.

**Source.** **STACKS.WEIL**, Remark 0FG4 (§3, pp. 5–6). The node is that remark, with the equidimensionality made an explicit hypothesis since the degree shift is stated only under it.
### What the graph and the transposed graph do to cycles

**Target:** `MotivesAndAlgebraicCycles:MC.0/graph-acts-as-gysin-and-pushforward` (theorem).

Let f be a morphism from Y to X of smooth projective schemes over k. Pushforward of cycles by the correspondence given by the graph of f agrees with the Gysin map from CH^*(X) to CH^*(Y), and pullback of cycles by that correspondence agrees with the proper pushforward from CH_*(Y) to CH_*(X). If moreover X and Y are equidimensional of dimensions d and e, then pushforward by the transposed graph is the proper pushforward along f and pullback by the transposed graph is the Gysin map.

**Hypotheses.** f is a morphism of smooth projective schemes over k. For the last two statements X and Y are equidimensional.

**Construction or proof.**

1. Expand the pushforward by the graph: [Gamma_f]_*(alpha) = pr_{2,*}([Gamma_f] . pr_1^*alpha).
2. Intersecting with the class of the regularly embedded Gamma_f is (f, 1)_* of the Gysin map of (f, 1) (Stacks 0FFE): [Gamma_f] . pr_1^*alpha = (f, 1)_*((f, 1)^! pr_1^*alpha).
3. The Gysin map of the flat pr_1 is flat pullback (Stacks 0FF4) and Gysin maps compose (Stacks 0FF5); since pr_1 o (f, 1) = f this is (f, 1)_*(f^! alpha).
4. Conclude with pr_{2,*} o (f, 1)_* = id (Stacks 02R5), which gives part (1).
5. For part (2) the same computation with pr_2 gives [Gamma_f] . pr_2^*beta = (f, 1)_*beta, whose pushforward by pr_1 is f_*beta; the source writes the pullback here with a lower star (sourceIssues MotivesAndAlgebraicCycles/E4).
6. Part (3) is the same computation after transposing, for X and Y equidimensional.

**Check.** The four statements pair up as stated: the graph gives the Gysin map in one direction and the proper pushforward in the other, and the transposed graph exchanges them. For f a closed immersion of a point in the projective line the graph recovers the restriction of a cycle class to the point, and the transposed graph recovers the class of the point. Each statement is an equality of maps on Chow groups with rational coefficients.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`, `MotivesAndAlgebraicCycles:MC.0/transpose-correspondence`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Lemma 0FG5 with its proof. The node is the lemma with all four assertions, proved simultaneously by the same computation; the proof steps follow the source's computation (source issues E4 and E5 are in this proof).
### The symmetric monoidal structure on correspondences

**Target:** `MotivesAndAlgebraicCycles:MC.0/tensor-of-correspondences` (construction).

Define the tensor product of two smooth projective schemes to be their product over k, and the tensor product of a correspondence of degree r from X to Y with a correspondence of degree r' from X' to Y' to be the intersection product on the fourfold product of the pullback of the first along the projection to X times Y with the pullback of the second along the projection to X' times Y'; it is a correspondence of degree r + r' from X times X' to Y times Y'. With the usual associativity constraint of products of schemes and the switch of factors as commutativity constraint this makes the category of correspondences symmetric monoidal with unit the spectrum of k.

**Hypotheses.** X, X', Y and Y' are smooth projective over k. The four projections from the fourfold product are the ones used, and the pullbacks are flat pullbacks on equidimensional parts.

**API.**

- `Corr.tensorObj` (data): The tensor product of objects, the product of schemes over k.
- `Corr.tensorHom` (data): The tensor product of two correspondences, of degree the sum of the degrees.
- `Corr.tensor_graph` (compatibility): The tensor product of two graphs is the graph of the product morphism.
- `Corr.symmetric` (instance): The switch of factors is a symmetry for this tensor product.
- `Corr.tensorUnit` (characterisation): The spectrum of k is a unit object.
- `Corr.tensor_bilinear` (instance): The tensor product of correspondences is Q-bilinear, so the degree zero category of correspondences is MonoidalPreadditive and MonoidalLinear over Q in Mathlib's sense.
- `Corr.tensor_comp` (functoriality): (d tensor d') o (c tensor c') = (d o c) tensor (d' o c'), promoted to the lemma node MC.0/tensor-interchange.

**Unit tests.**

- **unit_law.** Tensoring with the spectrum of k is isomorphic to the identity functor.
- **tensor_of_graphs.** The tensor product of the graphs of f and g is the graph of f times g.
- **degree_adds_under_tensor.** The tensor product of a correspondence of degree one and one of degree zero has degree one.

**Construction or proof.**

1. Define the tensor product on objects as the product of schemes and on morphisms by c tensor c' = pr_{13}^*c . pr_{24}^*c'.
2. Check the degree: the product of a class of degree r and one of degree r' has degree r + r'.
3. Bifunctoriality and the value on graphs and diagonals are the interchange lemma MC.0/tensor-interchange.
4. Take the associativity constraint from the associativity of products of schemes and the commutativity constraint from the switch of factors, both as graphs of isomorphisms of schemes; their naturality with respect to correspondences follows from the interchange lemma and the fact that the graph of an isomorphism acts by transport of cycles; the pentagon and hexagon axioms hold because they hold for the underlying isomorphisms of schemes and the graph functor is a functor.
5. Check that Spec(k) is a unit, the unitors being graphs of the canonical isomorphisms X × Spec(k) = X = Spec(k) × X, and that the tensor product is Q-bilinear on morphisms, so that the degree zero category is monoidal linear over Q.

**Check.** The unit is the spectrum of k and the tensor product of objects is the product of schemes. The tensor product of graphs is the graph of the product morphism. The commutativity constraint is the switch, so the structure is symmetric and not merely braided.

**Uses.** MotivesAndAlgebraicCycles:MC.1/motives-monoidal: the tensor product of motives is defined from this one on the underlying correspondences MotivesAndAlgebraicCycles:MC.2/weil-to-monoidal-functor: the Kuenneth axiom is the statement that a realisation is monoidal for this structure

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`, `MotivesAndAlgebraicCycles:MC.0/tensor-interchange`, `MotivesAndAlgebraicCycles:MC.0/correspondence-functor`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.SymmetricCategory`, `mathlib:CategoryTheory.MonoidalPreadditive`, `mathlib:CategoryTheory.MonoidalLinear`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Section 0FFZ, the paragraph after Example 0FG6, and Lemma 0FG7 (§3, pp. 3–4). The node is that paragraph together with Lemma 0FG7, whose proof the source omits ('Omitted.'); the verification is therefore listed as proof steps of this blueprint and its one non-routine identity is the lemma node MC.0/tensor-interchange.
### The two orthogonal projectors on the projective line

**Target:** `MotivesAndAlgebraicCycles:MC.0/projective-line-idempotents` (lemma).

Let X be the projective line over k and let x be a k-rational point. Inside the degree zero correspondences from X to X, which are CH^1(X times X) tensor Q, put c_0 the class of x times X and c_2 the class of X times x. Then the class of the diagonal is c_0 + c_2, the four composites satisfy c_0 after c_0 = c_0, c_2 after c_2 = c_2 and both mixed composites vanish, and the algebra of degree zero endomorphisms of X is the product of two copies of Q.

**Hypotheses.** k is a field and X is the projective line over k. x is a k-rational point of X.

**Construction or proof.**

1. Compute CH^1(X × X) tensor Q for X = P^1 from the projective bundle formula for Chow groups (Stacks 02TX, imported from SF.5) applied to the projection X × X -> X, and exhibit the classes of x × X and X × x as a basis.
2. Write the diagonal in that basis by intersecting with the two basis classes: [Delta] . [x × X] and [Delta] . [X × x] are both the class of the point (x, x), of degree one, so [Delta] = c_0 + c_2.
3. Compute the four composites on X × X × X. For c_0 o c_0 and c_2 o c_2 the two pulled back classes meet transversally in x × x × X, respectively X × x × x, which pr_13 maps isomorphically onto x × X, respectively X × x, so each is idempotent.
4. c_2 o c_0 = pr_{13,*}([x × X × X] . [X × X × x]) = pr_{13,*}[x × X × x] vanishes because pr_13 contracts the curve x × X × x to a point, so the proper pushforward of its class is zero.
5. c_0 o c_2 = pr_{13,*}([X × x × X] . [X × x × X]) is a self-intersection that is not proper: it equals the flat pullback along pr_2 of [x] . [x] in CH^2(X) = 0, so it vanishes for dimension reasons and not because of a pushforward.
6. Conclude that c_0 and c_2 are orthogonal idempotents summing to the identity and that Corr^0(X, X) is Q × Q as a Q-algebra.

**Check.** The diagonal is the sum of the two classes, which is the acceptance test of the layer for projective space. The two mixed composites vanish and the two pure ones are idempotent; a computation that returns a nonzero mixed composite has made a dimension error. The endomorphism algebra is two-dimensional, not one-dimensional: the projective line is not indecomposable as a correspondence object.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Example 0FG6 (§3, p. 6). The node is that example, with the computation the source leaves implicit written out as proof steps.
### The three orthogonal projectors on a pointed smooth projective curve

**Target:** `MotivesAndAlgebraicCycles:MC.0/pointed-curve-idempotents` (lemma).

Let C be a geometrically irreducible smooth projective curve over k with a k-rational point e. Inside the degree zero correspondences from C to C put p_0 the class of e times C and p_2 the class of C times e. Then p_0 and p_2 are orthogonal idempotents, p_1 defined as the class of the diagonal minus p_0 minus p_2 is an idempotent orthogonal to both, and the three sum to the class of the diagonal.

**Hypotheses.** k is a field, C is a geometrically irreducible smooth projective curve over k and e is a k-rational point of C. Degree zero correspondences from C to C are CH^1(C times C) tensor Q.

**Construction or proof.**

1. Identify p_0 = [e × C] with the composite of the graph of the point e : Spec(k) -> C, a correspondence of degree zero from C to Spec(k), followed by the graph of the structure morphism C -> Spec(k), a correspondence of degree zero from Spec(k) to C, exactly as in the proof of Lemma 0FGD; and p_2 = [C × e] with its transpose, of degree 1 - 1 + 0 = 0.
2. p_0 o p_0 = p_0 and p_2 o p_2 = p_2: the pulled back classes meet transversally in e × e × C, respectively C × e × e, which pr_13 maps isomorphically onto e × C, respectively C × e; this uses that e is a rational point.
3. p_2 o p_0 = pr_{13,*}[e × C × e] = 0 because pr_13 contracts the curve e × C × e to a point.
4. p_0 o p_2 = pr_{13,*}([C × e × C] . [C × e × C]) is a non-proper self-intersection; it is the flat pullback along pr_2 of [e] . [e] in CH^2(C) = 0, hence zero.
5. Define p_1 = [Delta] - p_0 - p_2 and check idempotence and orthogonality from the previous steps and the fact that [Delta] is the identity.
6. Record that the three classes sum to [Delta] by construction, so that they are a complete orthogonal family.

**Check.** The three classes are orthogonal idempotents summing to the identity, which is the layer's acceptance test for a pointed curve. p_1 is not zero unless the curve has genus zero; for the projective line with e the chosen point p_1 vanishes and the family reduces to the two projectors of the previous node. The construction depends on the chosen rational point: a different point changes p_0 and p_2, and it changes p_1 by a correspondence that is not in general zero.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/projective-line-idempotents`, `MotivesAndAlgebraicCycles:MC.0/composition-associative`, `MotivesAndAlgebraicCycles:MC.0/correspondences-with-the-point`, `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`, `MotivesAndAlgebraicCycles:MC.0/correspondence-functor`, `MotivesAndAlgebraicCycles:MC.0/transpose-correspondence`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Example 0FG6 together with Lemma 0FG0 and Lemma 0FG3 (§3, pp. 3–4). The node is the same computation with the projective line and its chosen point replaced by a pointed geometrically irreducible curve. Only the first two projectors are claimed to be given by the source's formula; the third is defined as the complement, and the source is cited for the composition rules and for the fact that the diagonal is the identity, which are the two inputs the computation uses. The source does not state the curve case, and the blueprint does not claim it does.
### Adequate equivalence relations on algebraic cycles

**Target:** `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation` (definition).

Fix a field F of characteristic zero. An adequate equivalence relation on F-linear cycles on smooth projective schemes over k is recorded by the classes it identifies with zero: a family I of graded F-subspaces I^*(X) of CH^*(X) tensor F, one for each smooth projective X over k, such that (a) f^*(I^*(X)) is contained in I^*(Y) for every morphism f : Y -> X; (b) f_*(I(Y)) is contained in I(X) for every morphism f : Y -> X, pushforward being taken on dimension-graded Chow groups; and (c) alpha . beta lies in I^*(X) whenever alpha lies in I^*(X) and beta in CH^*(X) tensor F. Write A^j(X) = A^j(X, F) = (CH^j(X) tensor F)/I^j(X). Two F-linear cycles are equivalent when the difference of their classes lies in I. Rational equivalence is the family I = 0 and is finer than every adequate relation; the trivial relation, I^*(X) = CH^*(X) tensor F for every X, is adequate as well.

**Hypotheses.** k is a field and F a field of characteristic zero; the Chow groups CH^*(X) are the integral ones imported from SF.5. Jannsen defines adequacy on cycles, following Samuel and Kleiman: pullback, pushforward and intersection of cycles are well defined modulo the relation. The relations of that kind which are coarser than rational equivalence, the only ones any consumer in this roadmap uses, are the same data as the families of the statement. The family form is the one a formalisation can state, since the intersection of two cycles is defined only when they meet properly. The trivial relation, which identifies every class with zero, satisfies the three conditions; every statement comparing adequate relations with numerical equivalence must exclude it.

**API.**

- `Adequate` (data): An adequate family I: F-subspaces I^*(X) of CH^*(X) tensor F for all smooth projective X over k, stable under pullback, pushforward and products with arbitrary classes.
- `Adequate.quotient` (data): The quotient A^j(X, F) = (CH^j(X) tensor F)/I^j(X), with its F-vector space structure.
- `Adequate.mem_exterior` (characterisation): An adequate family is stable under exterior products and under the action c_* of any correspondence.
- `Adequate.comp` (structure): Composition and tensor product of correspondences descend to correspondences modulo I, and composition stays associative.
- `Adequate.rat` (example): The family I = 0, rational equivalence, the least adequate family.
- `Adequate.trivial` (example): The family I = everything, the trivial relation, the greatest adequate family; all quotients A^j vanish.
- `Adequate.le` (relation): The order 'finer than' is inclusion of families; adequate families form a complete lattice under sums and intersections.

**Unit tests.**

- **rational_is_adequate.** The family I = 0 satisfies (a), (b) and (c); its quotients are the Chow groups CH^j(X) tensor F.
- **trivial_is_adequate.** The family I^*(X) = CH^*(X) tensor F satisfies (a), (b) and (c), and every A^j(X, F) is zero, including A^0(Spec(k), F).
- **positive_codimension_not_adequate.** The family I^j(X) = CH^j(X) tensor F for j >= 1 and I^0(X) = 0 satisfies (a) and (c) but not (b): the pushforward of the class of a rational point of P^1 along P^1 -> Spec(k) is [Spec(k)], which is not in I^0(Spec(k)) = 0. A definition that omits pushforward admits it.
- **sum_is_adequate.** The sum and the intersection of two adequate families are adequate.

**Construction or proof.**

1. Record the three closure conditions (a), (b), (c) as the definition of an adequate family.
2. Deduce stability under exterior products, alpha × beta = pr_1^*alpha . pr_2^*beta, from (a) and (c), and stability under the action of any correspondence, c_*(alpha) = pr_{2,*}(c . pr_1^*alpha), from (a), (b) and (c).
3. Define A^j(X) and check that composition and tensor product of correspondences descend: in c' o c = pr_{13,*}(pr_{12}^*c . pr_{23}^*c') a factor lying in I stays in I under the pullbacks (a), the product (c) and the pushforward (b).
4. Record that I = 0 (rational equivalence) and I = everything (the trivial relation) are adequate, that I = 0 is contained in every adequate family, and that the adequate families are closed under sums and intersections.

**Check.** The three closure conditions are part of the definition. Without condition (b) the family of all classes of positive codimension would qualify, and composition of correspondences would not descend to the quotient. Rational equivalence (I = 0) is adequate and finer than every adequate relation. The trivial relation is adequate; no statement of this roadmap may claim that every adequate relation is finer than numerical equivalence without excluding it. The coefficient field F is a parameter: A^j(X, F) for different F are different groups.

**Uses.** MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation: the category of motives is formed for an arbitrary adequate relation, which is the generality Jannsen's theorem needs MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity: the theorem quantifies over adequate relations and singles out numerical equivalence among them MotivesAndAlgebraicCycles:MC.0/numerical-equivalence: numerical equivalence is shown to be adequate and to contain every adequate family other than the trivial one

**Dependencies.** `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`.

**Source.** **JANNSEN.1992**, page 447, the second paragraph. The node is that paragraph. Jannsen's relation is on cycles and refers to Kleiman for the definition; the node records it through the classes it identifies with zero, which is the form in which the paper uses it (the groups A^j and the composition law on them). **MILNE.MOT**, Section 4 (Algebraic cycles), subsection Definitions, page 5. Cited for the two extreme cases. Milne's 'coarsest' is informal; the precise comparison, which must exclude the trivial relation, is in the numerical equivalence node (sourceIssues MotivesAndAlgebraicCycles/E10).
### Numerical equivalence

**Target:** `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence` (definition).

Let F be a field of characteristic zero and X a smooth projective scheme over k. The degree pairing sends alpha in CH^j(X) tensor F and beta in CH_j(X) tensor F to deg(alpha . beta) in F, the degree over k of the zero-cycle class alpha . beta. A class alpha is numerically trivial if deg(alpha . beta) = 0 for every beta in CH_j(X) tensor F, and two F-linear cycles are numerically equivalent if the difference of their classes is numerically trivial. The numerically trivial classes form an adequate family, so the quotient A_num^*(X) is a graded ring, a quotient of the Chow ring tensor F. An adequate family I with I^0(Spec(k)) = 0 consists of numerically trivial classes, and an adequate family with I^0(Spec(k)) nonzero is the trivial relation; so numerical equivalence is the coarsest adequate relation other than the trivial one.

**Hypotheses.** X is a smooth projective scheme over k; for X not equidimensional the pairing is taken on each equidimensional part, which is what grading beta by dimension does. Intersection numbers are degrees over k of zero-cycle classes (the degree deg : CH_0(X) -> Z of SF.5, extended F-linearly). They are computed on Chow groups, where every pair of classes has a product; Milne's 'for which the intersection numbers are defined' refers to cycles. Coefficients are F-linear as in the adequate relation definition.

**API.**

- `NumEquiv` (data): The adequate family of numerically trivial classes.
- `NumEquiv.pairing` (data): The degree pairing CH^j(X) tensor F × CH_j(X) tensor F -> F, (alpha, beta) -> deg(alpha . beta).
- `NumEquiv.ring` (structure): The quotient ring A_num^*(X), a quotient of the Chow ring tensor F.
- `NumEquiv.adequate` (instance): Numerically trivial classes are stable under pullback, pushforward and products.
- `NumEquiv.le_of_point` (relation): An adequate family I with I^0(Spec(k)) = 0 is contained in NumEquiv.
- `NumEquiv.eq_trivial_of_point` (relation): An adequate family with I^0(Spec(k)) nonzero is the trivial relation.
- `NumEquiv.point_class` (example): The class of Spec(k) is not numerically trivial, so NumEquiv is not the trivial relation.

**Unit tests.**

- **curve_zero_cycles.** On a connected smooth projective curve two zero cycles are numerically equivalent exactly when they have the same degree over k.
- **all_complements.** On P^1 × P^1 the class alpha = [pt × P^1] - [P^1 × pt] pairs to zero with the diagonal, deg(alpha . [Delta]) = 1 - 1 = 0, but deg(alpha . [pt × P^1]) = -1; so alpha is not numerically trivial although it is orthogonal to one test class.
- **not_rational_equivalence.** For an elliptic curve E/ℂ and an infinite-order point P, [P]−[O] is numerically trivial but nonzero in CH_0(E)⊗ℚ by its Picard class. Over a finite field the curve’s degree-zero divisor classes are torsion, so this rational example is unavailable.
- **ring_structure.** The product of a numerically trivial class with any class is numerically trivial.
- **trivial_relation_is_coarser.** The trivial relation is adequate and kills [Spec(k)], which is not numerically trivial; so a statement 'every adequate relation is finer than numerical equivalence' without the hypothesis I^0(Spec(k)) = 0 is false.

**Construction or proof.**

1. Define the pairing from the intersection product and the degree of zero cycles (SF.5).
2. Stability under pullback: for f : Y -> X and beta on Y, deg(f^*alpha . beta) = deg(f_*(f^*alpha . beta)) = deg(alpha . f_*beta) = 0, by the projection formula and the compatibility of the degree with proper pushforward.
3. Stability under pushforward: deg(f_*gamma . beta) = deg(gamma . f^*beta) = 0, by the projection formula.
4. Stability under products: deg((alpha . gamma) . beta) = deg(alpha . (gamma . beta)) = 0, by associativity and commutativity of the intersection product.
5. Comparison: let I be adequate with I^0(Spec(k)) = 0 and alpha in I^j(X); for beta in CH_j(X) tensor F, alpha . beta lies in I by (c), and its pushforward to Spec(k), which is deg(alpha . beta) times [Spec(k)], lies in I^0(Spec(k)) = 0 by (b); so alpha is numerically trivial. If instead I^0(Spec(k)) is nonzero it contains [Spec(k)], so [X] = pi^*[Spec(k)] lies in I^0(X) for every X by (a), and then I is everything by (c).

**Check.** The test is against all classes of complementary dimension, not against a chosen realisation; equality of cohomology classes is a different relation. The quotient is a ring, so numerical equivalence is compatible with the intersection product. On a connected smooth projective curve numerical equivalence of zero cycles is equality of degrees. The comparison with other adequate relations excludes the trivial relation, which is adequate and strictly coarser than numerical equivalence.

**Uses.** MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity: the theorem singles out this relation as the unique adequate one making the motives semisimple abelian MotivesAndAlgebraicCycles:MC.7/conjecture-D: Conjecture D is the converse implication, that numerical equivalence implies homological equivalence

**Dependencies.** `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation`.

**Source.** **MILNE.MOT**, Section 4 (Algebraic cycles), subsection Definitions, page 5. The node is that definition, stated on Chow groups with F-coefficients; Milne's next sentence, that the classes form a ring which is a quotient of the Chow ring, is the ring structure. **JANNSEN.1992**, page 448, first sentence of the proof of Theorem 1. Cited with a correction: the statement fails for the trivial relation (sourceIssues MotivesAndAlgebraicCycles/E10); the node proves the corrected comparison.
### Correspondences to and from the point are Chow groups

**Target:** `MotivesAndAlgebraicCycles:MC.0/correspondences-with-the-point` (lemma).

For a smooth projective scheme X over k and an integer r there are canonical Q-linear isomorphisms CH_{-r}(X) tensor Q = Corr^r(X, Spec(k)) and CH^r(X) tensor Q = Corr^r(Spec(k), X), induced by X × Spec(k) = X = Spec(k) × X. Under the first, pullback of cycles by a correspondence c in Corr^s(W, X) is composition with c: c^*(beta) corresponds to beta o c. Under the second, pushforward of cycles by c in Corr^s(X, W) is composition: c_*(alpha) corresponds to c o alpha.

**Hypotheses.** X and W are smooth projective over k; r and s are integers. Cycle classes are rational.

**Construction or proof.**

1. On X_d, codimension d + r is dimension -r, so Corr^r(X, Spec(k)) = direct sum over d of CH^{d+r}(X_d) tensor Q = CH_{-r}(X) tensor Q; and Corr^r(Spec(k), X) = CH^{0+r}(X) tensor Q, since Spec(k) has dimension zero.
2. For beta in CH_{-r}(X) and c in Corr^s(W, X), beta o c = pr_{13,*}(pr_{12}^*c . pr_{23}^*beta) on W × X × Spec(k) = W × X, where pr_13 and pr_23 become pr_1 and pr_2; this is the defining formula of c^*(beta), in CH_{-r-s}(W).
3. For alpha in CH^r(X) and c in Corr^s(X, W), c o alpha = pr_{13,*}(pr_{12}^*alpha . pr_{23}^*c) on Spec(k) × X × W = X × W, which is pr_{2,*}(pr_1^*alpha . c) = c_*(alpha) by commutativity of the intersection product.

**Check.** The degrees match: beta o c has degree r + s and c^*(beta) has dimension -r - s. For X = Spec(k) both isomorphisms identify Corr^0(Spec(k), Spec(k)) with Q and all other degrees with zero. The class [X] in CH^0(X) corresponds to the graph of the structure morphism X -> Spec(k), a correspondence of degree zero from Spec(k) to X.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-group`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Lemma 0FG0, parts (2) and (3) (§3, pp. 3–4). The node is parts (2) and (3), which the source proves together by 'carefully bookkeeping where various cycles live'; the bookkeeping is written out as proof steps.
### Composition of correspondences computes the action on cycles

**Target:** `MotivesAndAlgebraicCycles:MC.0/composition-compatible-with-action` (lemma).

For c in Corr^r(X, Y) and c' in Corr^s(Y, Z) one has (c' o c)^*(beta) = c^*((c')^*(beta)) for beta in CH_*(Z) tensor Q and (c' o c)_*(alpha) = (c')_*(c_*(alpha)) for alpha in CH^*(X) tensor Q.

**Hypotheses.** X, Y and Z are smooth projective over k. Cycle classes are rational.

**Construction or proof.**

1. Under the identifications of MC.0/correspondences-with-the-point, (c' o c)^*(beta) corresponds to beta o (c' o c) and c^*((c')^*(beta)) to (beta o c') o c; they agree by associativity.
2. Likewise (c' o c)_*(alpha) corresponds to (c' o c) o alpha and (c')_*(c_*(alpha)) to c' o (c o alpha).

**Check.** Pullback is contravariant and pushforward covariant in the correspondence. For c' the diagonal both identities are trivial. The identities hold in every degree, not only in degree zero.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondences-with-the-point`, `MotivesAndAlgebraicCycles:MC.0/composition-associative`.

**Source.** **STACKS.WEIL**, Lemma 0FG0, part (4), with the last paragraph of its proof (§3, pp. 3–4). The node is part (4) with the source's one-line proof.
### Correspondences between disjoint unions, and additivity of the degree zero category

**Target:** `MotivesAndAlgebraicCycles:MC.0/correspondences-of-disjoint-union` (lemma).

Let X = X' coproduct X'' and Y = Y' coproduct Y'' be decompositions of smooth projective schemes over k into open and closed subschemes. Restriction gives a Q-linear isomorphism of Corr^r(X, Y) with the direct sum of Corr^r(X', Y'), Corr^r(X', Y''), Corr^r(X'', Y') and Corr^r(X'', Y''), under which composition of correspondences is multiplication of 2 × 2 matrices. In particular X is a biproduct of X' and X'' in the degree zero category of correspondences, the projections being the graphs of the inclusions and the injections the classes of the diagonals of X' and X'' viewed in X' × X and X'' × X, and the empty scheme is a zero object; the degree zero category is additive.

**Hypotheses.** X' and X'' (and Y', Y'') are open and closed in X (and Y); either may be empty. Cycle classes are rational.

**Construction or proof.**

1. The Chow groups of a disjoint union are the direct sum of those of the pieces (SF.5), (X' coproduct X'') × Y = (X' × Y) coproduct (X'' × Y), and the equidimensional decomposition of X is the union of those of X' and X'', so the degree shift is compatible.
2. Composition is matrix multiplication: in pr_{13,*}(pr_{12}^*c . pr_{23}^*c'), classes supported on X × Y' and on Y'' × Z pull back to classes supported on disjoint open and closed subschemes of X × Y × Z, whose product is zero.
3. Biproduct identities: projection to X' after injection of X' is [Delta_{X'}], projection to X' after injection of X'' is zero, and the sum of the two composites injection after projection is [Delta_X], from the matrix description and the fact that the diagonal is the identity.
4. Corr^r(empty, Y) and Corr^r(Y, empty) are zero.

**Check.** The matrix description holds in every degree r, not only in degree zero. For X' = X and X'' empty the lemma is trivial. h of a disjoint union is the direct sum of the h of the pieces, which is the property MC.1 uses.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-group`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`, `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`, `SchemeAndStackFoundations:SF.5`, `mathlib:CategoryTheory.Limits.HasBinaryBiproducts`.

**Source.** **STACKS.WEIL**, §3, Lemmas 0FG0 and 0FG2, pp. 3–5 (§3, pp. 3–4). The matrix and biproduct argument is the open-and-closed decomposition of these correspondence formulas; its proof is spelled out here.
### The interchange law for the tensor product of correspondences

**Target:** `MotivesAndAlgebraicCycles:MC.0/tensor-interchange` (lemma).

For c in Corr^r(X, Y), d in Corr^s(Y, Z), c' in Corr^{r'}(X', Y') and d' in Corr^{s'}(Y', Z') one has (d tensor d') o (c tensor c') = (d o c) tensor (d' o c') in Corr^{r+s+r'+s'}(X × X', Z × Z'). The tensor product of the diagonals of X and X' is the diagonal of X × X', and the tensor product of the graphs of f : Y -> X and f' : Y' -> X' is the graph of f × f', and likewise for transposed graphs.

**Hypotheses.** All schemes are smooth projective over k. Cycle classes are rational.

**Construction or proof.**

1. Identify c tensor c' = pr_{13}^*c . pr_{24}^*c' with the exterior product c × c' transported along the isomorphism X × X' × Y × Y' = (X × Y) × (X' × Y').
2. On (X × Y × Z) × (X' × Y' × Z'), use that exterior products commute with flat pullback, that (a × a') . (b × b') = (a . b) × (a' . b'), and that (g × g')_*(a × a') = g_*a × g'_*a' for proper g, g' (SF.5), to identify both sides.
3. For graphs, Gamma_f × Gamma_{f'} = Gamma_{f × f'} as subschemes, isomorphic to the smooth Y × Y', so the exterior product of their classes is the class of the graph of f × f'; the diagonal case is f and f' identities, and transposed graphs are the same subschemes read in the switched product.

**Check.** The degrees add: (r + s) + (r' + s'). Taking d and d' diagonals recovers c tensor c', so the law is consistent with the identities. On P^1 × P^1 with the projectors c_0, c_2: (c_0 tensor c_2) o (c_0 tensor c_2) = c_0 tensor c_2.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`, `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, §3, Lemma 0FG7 and proof, p. 7 (§3, p. 7). Tensor compatibility reduces to exterior product, flat pullback and proper pushforward; the interchange proof below spells out the required identity.
### The graph of a morphism against the diagonals

**Target:** `MotivesAndAlgebraicCycles:MC.0/graph-against-diagonals` (lemma).

Let f : Y -> X be a morphism of smooth projective schemes over k, with X and Y equidimensional of dimensions d and e. Put a = [Gamma_f] in Corr^0(X, Y), a^t = [Gamma_f^t] in Corr^{d-e}(Y, X), eta_X in Corr^0(X × X, X) and eta_Y in Corr^0(Y × Y, Y) the graphs of the diagonal morphisms, and [X] in Corr^{-d}(X, Spec(k)), [Y] in Corr^{-e}(Y, Spec(k)) the fundamental classes. Then [Y] o eta_Y o (a tensor id_Y) = [X] o eta_X o (id_X tensor a^t) in Corr^{-e}(X × Y, Spec(k)) = CH^d(X × Y) tensor Q, and both equal the class of Gamma_f.

**Hypotheses.** X and Y are equidimensional of dimensions d and e. Cycle classes are rational.

**Construction or proof.**

1. By MC.0/correspondences-with-the-point, Corr^{-e}(X × Y, Spec(k)) = CH_e(X × Y) tensor Q and composition with a correspondence is pullback by it.
2. One way round: eta_Y^*[Y] = [Delta_Y] (pullback by the graph of the diagonal is pushforward along the diagonal, MC.0/graph-acts-as-gysin-and-pushforward), and a tensor id_Y is the graph of f × id_Y (MC.0/tensor-interchange), whose pullback is (f × id)_*, giving (f × id)_*[Delta_Y] = [Gamma_f].
3. Other way round: eta_X^*[X] = [Delta_X], id_X tensor a^t is the transposed graph of id × f, whose pullback is the Gysin map (id × f)^!, and (id × f)^![Delta_X] = [Gamma_f] because (id × f)^{-1}(Delta_X) = Gamma_f with the expected codimension (Stacks 0FF7).
4. The source writes the common value as an element of Corr^d(X × Y, Spec(k)); the degree is -e (sourceIssues MotivesAndAlgebraicCycles/E11).

**Check.** Both composites have degree -e, the degree of a cycle of dimension e on X × Y. For f the identity of X both sides are the class of the diagonal. The equality is of correspondences, not only of their actions on cycles.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/correspondences-with-the-point`, `MotivesAndAlgebraicCycles:MC.0/graph-acts-as-gysin-and-pushforward`, `MotivesAndAlgebraicCycles:MC.0/tensor-interchange`, `MotivesAndAlgebraicCycles:MC.0/transpose-correspondence`, `SchemeAndStackFoundations:SF.5`.

**Source.** **STACKS.WEIL**, Lemma 0FG8 with its proof (§3, p. 7). The node is the lemma with its two computations; the degree printed as d is corrected to -e (E11).

## Algebraic equivalence and quotient comparisons

These targets complete the equivalence-relation interface on the imported Chow carrier. They do not replace adequate equivalence or numerical equivalence with a second definition. The parameter points are rational over the ground field, and the homological comparison uses geometric classical Weil cohomology with characteristic-zero coefficients.
### Algebraic equivalence over the ground field

**Target:** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence` (definition).

For a finite-type separated k-scheme X, let Alg_i(X/k) be the subgroup of the integral Chow group CH_i(X) generated by differences t₁!Z − t₀!Z, where T is a smooth geometrically integral quasi-projective k-scheme of dimension e, t₀,t₁ are k-points, Z lies in CH_{i+e}(T×X), and t! denotes refined Gysin for the fibre inclusion. Two integral cycles are algebraically equivalent over k when their Chow-class difference lies in this subgroup. For smooth pure-dimensional X and a characteristic-zero coefficient field F, let I_alg^j(X;F) be the F-span of the image of Alg_{dim X−j}(X/k) in CH^j(X)⊗F, and put A_alg^j(X;F)=(CH^j(X)⊗F)/I_alg^j. Disconnected X is treated componentwise.

**Hypotheses.** k is any field for the definition; X is separated of finite type. The parameter is connected through geometric integrality and has two ground-field rational points; geometric algebraic equivalence after base change is a different relation. Integral CH_i, refined fibre Gysin and scalar extension are imported, not encoded using raw cycle equality.

**API.**

- `AlgTrivial` (data): An additive subgroup of CH_i(X), together with its quotient map.
- `AlgTrivial.fibre_difference` (constructor): Every permitted family difference belongs to Alg_i(X/k); the constant family gives zero.
- `AlgTrivial.mem_iff_family` (characterisation): After the parameter-space comparison, a member can be expressed by one smooth integral parameter family with two k-points.
- `AlgTrivial.baseChange` (functoriality): A field extension carries Alg_i(X/k) into Alg_i(X_L/L), by base changing the whole family; no converse is asserted.
- `AlgTrivial.coeffSpan` (compatibility): For characteristic-zero F use the F-span of the integral image; coefficient extension commutes with span and quotient.
- `AlgQuotient.lift` (universal-property): A group homomorphism out of integral CH_i factors uniquely through CH_i/Alg_i precisely when it kills all family differences; the analogous F-linear universal property holds for A_alg.
- `AlgTrivial.divisor_picard` (compatibility): On a smooth proper pointed curve the degree-zero divisor subgroup agrees with the Picard-degree kernel via the existing JacobianChallenge divisor/Picard interface.

**Unit tests.**

- **point_degree.** For Spec k, Alg_0=0 and the class 1 is not algebraically trivial: every permitted family has constant degree.
- **projective_line.** On P¹_k the two rational point classes agree already in CH_0, while a degree-one point is not algebraically trivial.
- **elliptic_nonrational.** For an elliptic curve E/ℂ and a point P of infinite order, [P]−[O] is algebraically trivial but is nonzero in CH_0(E)⊗ℚ, by the divisor/Picard identification.
- **geometric_base_change.** Base change preserves membership; the Karpenko quadric application below prevents replacing the ground-field relation by geometric or integral arithmetic homological equivalence.

**Construction or proof.**

1. Use the SF.5 Chow carrier and fibre Gysin along the regular immersions supplied by smoothness of T.
2. Take the subgroup generated by these differences; exchanging the two points gives negatives. Products of parameter spaces combine sums.
3. Use ACMV Proposition 2.10 to compare with the smooth-integral-parameter definition without a quasi-projectivity restriction. Extend coefficients by span, not by declaring torsion cycles nonzero rational classes.

**Check.** Membership is invariant under changing a representative by rational equivalence. The relation is reflexive, symmetric and transitive; it is not defined as equality of cycle classes in a selected cohomology theory.

**Uses.** MC.0 algebraic adequacy and quotient comparisons; MC.1 motives modulo a relation: Defines the kernel family and the correct quotient maps. CTV Proposition 9.1; Kollár Proposition 14; BW Remark 3.13: Both cohomology-sheaf actions and the Euler congruence must annihilate actual ground-field family differences.

**Dependencies.** `SchemeAndStackFoundations:SF.5/chow-group`, `SchemeAndStackFoundations:SF.5/refined-gysin`, `SchemeAndStackFoundations:SF.5/gysin-composition`, `SchemeAndStackFoundations:SF.5/exterior-product`.

**Source.** **ACMV.2017**, Definition 2.1 and Remark 2.3, p. 4; Proposition 2.10, pp. 7–8; Proposition 2.5, p. 5. Ground-field algebraic triviality is represented by refined fibre differences; quasi-projective parameters give the same subgroup.
### Algebraic equivalence is adequate

**Target:** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence-adequate` (theorem).

For smooth projective k-schemes and characteristic-zero F, the family I_alg is an adequate relation in MC.0/adequate-equivalence-relation: it is graded, stable under all morphism pullbacks, proper pushforwards and multiplication by arbitrary Chow classes. The integral dimension-graded subgroup is also preserved by proper pushforward, flat pullback, refined Gysin and exterior product with an arbitrary class. Consequently composition, action, transpose and tensor of correspondences descend to the algebraic quotient.

**Hypotheses.** Use algebraic equivalence over k as defined above, and the imported SF.5 operations. A morphism between smooth projective schemes factors as its regular graph followed by a smooth projection, supplying the required lci pullback.

**Construction or proof.**

1. Commute fibre Gysin with proper pushforward, flat pullback and refined Gysin, using the respective SF.5 base-change/interchange identities. Each family difference remains a family difference.
2. Multiplication by a fixed class is diagonal Gysin applied to exterior product; carry the fixed class along T and apply the same compatibility.
3. Tensor with F and apply the existing adequate-relation quotient construction. For sums of families use products of geometrically integral parameters, not a disconnected parameter joining unrelated fibres.

**Check.** A relation that only permits proper pushforward, without pullback or multiplication, does not meet adequacy. Every correspondence operation already imported descends with exactly the same degree convention.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence`, `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation`, `SchemeAndStackFoundations:SF.5/gysin-proper-flat`, `SchemeAndStackFoundations:SF.5/gysin-flat`, `SchemeAndStackFoundations:SF.5/gysin-interchange`, `SchemeAndStackFoundations:SF.5/lci-pullback`, `SchemeAndStackFoundations:SF.5/smooth-intersection`.

**Source.** **ACMV.2017**, Proposition 2.5 and proof, p. 5; Introduction, p. 1. The subgroup is stable under the basic Chow operations. Applying the operation identities to a family proves adequacy in the imported convention.
### Curve parameters for algebraic equivalence

**Target:** `MotivesAndAlgebraicCycles:MC.0/curve-parameterisation` (theorem).

Over a perfect field k, a class in Alg_i(X/k) is a difference of refined fibres of one cycle on C×X for a smooth projective geometrically integral curve C/k and two k-points. Over an arbitrary field a smooth quasi-projective geometrically integral curve suffices. These descriptions agree with the smooth-parameter subgroup, and for a smooth projective geometrically integral X over an algebraically closed field, Alg_0(X/k)=ker(deg:CH_0(X)→ℤ).

**Hypotheses.** X is separated and of finite type over k. Projective smooth curve normal form is asserted integrally only when k is perfect; no such assertion is made over an imperfect field without the source’s p-power qualification.

**Construction or proof.**

1. Use the prescribed-point Bertini statement requested of SF.4 (ACMV Appendix A), not the weaker existing smoothness-only Bertini target.
2. Restrict the family to a smooth quasi-projective curve containing the marked points, as in Proposition 2.10; closure of its cycle and refined Gysin give the projective form over a perfect field (Lemma 2.8).
3. For zero-cycles use Lemma 2.9 and Proposition 2.11: degree-zero combinations on a smooth parameter are algebraically trivial; apply the diagonal family on smooth X to degree-zero zero-cycles as in Lemma 2.9. Retain smoothness and projectivity, the explicit Proposition 2.11 hypotheses.

**Check.** For P¹ a degree-zero class is zero already rationally, whereas a positive-genus curve has nonzero algebraically trivial classes. The theorem retains the ground-field rational marked points; passing to an algebraic closure is not a descent proof.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.3/nonsingular-projective-model`, `SchemeAndStackFoundations:SF.5/chow-localization`, `SchemeAndStackFoundations:SF.5/refined-gysin`.

**Source.** **ACMV.2017**, Lemma 2.8 p. 6; Proposition 2.10 pp. 7–8; Proposition 2.11 p. 8; Proposition 2.14 pp. 9–10; Appendix A, Theorem A.1 pp. 17–18. These give curve parameter spaces, the perfect-field projective form, and degree-zero zero-cycles. Only the projective integral zero-cycle case is consumed here.
### Algebraic equivalence is homological for a selected Weil theory

**Target:** `MotivesAndAlgebraicCycles:MC.0/algebraic-implies-homological` (comparison).

Let k be any field, F be a characteristic-zero coefficient field, and H be a selected classical Weil cohomology of the geometric base change, with F embedded in its coefficient field. Then I_alg^j(X;F) is contained in I_H^j(X;F) for every smooth projective X/k. Define I_H directly as the kernel of CH^j(X)⊗F → CH^j(X_k̄)⊗F → H^{2j}(X_k̄), using flat base change and the componentwise classical Weil cycle class. This agrees with the geometric relation named by MC.2/homological-equivalence and the class-map formula in MC.2/weil-cohomology-by-base-change; its later realization on motives is not consumed here. It depends on H; independence of H is not a theorem here.

**Hypotheses.** The early MC.2 axioms include products, Poincaré duality, trace and cycle classes with the usual degree and Gysin compatibilities. Classical Weil cohomology has characteristic-zero coefficients; integral arithmetic étale cohomology is outside this assertion. For nonclosed k the cycle-class formula is defined directly by the existing flat field-extension maps, their filtered algebraic-extension limit, and the componentwise Weil theory. The full MC.2/weil-cohomology-by-base-change node also constructs motive realization and lists MC.1/motives-universal-property; importing that full construction before MC.0 would be circular. Only the displayed geometric formula is used here.

**Construction or proof.**

1. Base change an algebraic family to an algebraic closure; the subgroup base-change map preserves its class.
2. Use curve-parameterisation over the algebraically closed field and extend the cycle to a smooth projective curve parameter using localization.
3. The two rational point classes of that connected curve agree in H²(C)(1), since their traces are both one and top cohomology has dimension one.
4. Fibre cycle classes are obtained by the same pull-product-push formula from the parameter point class. Their difference therefore has cycle class zero. Extend linearly to F.

**Check.** The elliptic divisor [P]−[O] is killed by the geometric Weil cycle class even when its rational Chow class is nonzero. No conclusion that an integral arithmetic class vanishes is extracted from this comparison.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence`, `MotivesAndAlgebraicCycles:MC.0/curve-parameterisation`, `MotivesAndAlgebraicCycles:MC.2/homological-equivalence`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`, `MotivesAndAlgebraicCycles:MC.2/weil-cohomology-of-schemes`, `MotivesAndAlgebraicCycles:MC.2/chow-groups-under-field-extension`, `SchemeAndStackFoundations:SF.5/chow-localization`.

**Source.** **STACKS.WEIL**, Section 7, Definition 7.3 (tag 0FGV), axioms (A)–(C) pp. 14–16; Lemma 7.4 (tag 0FGW), p. 16. Supplies top-degree trace, Künneth and cycle-class pull-product-push compatibility. Together with curve parameterisation these prove the stated inclusion; this is a derivation from the axioms, not a separately quoted comparison theorem. **ACMV.2017**, Lemma 2.8 p. 6; Proposition 2.10 pp. 7–8. Supplies the reduction of a family to a smooth projective curve over the geometric base field.
### The comparison chain of cycle quotients

**Target:** `MotivesAndAlgebraicCycles:MC.0/equivalence-quotient-comparisons` (comparison).

For smooth projective X/k over any field k and a selected geometric classical Weil theory H, rational equivalence implies algebraic equivalence, which implies H-homological equivalence, which implies numerical equivalence. With F coefficients this gives surjective graded maps CH^*(X)⊗F → A_alg^*(X;F) → A_H^*(X;F) → A_num^*(X;F), and identity-on-objects F-linear tensor functors between the corresponding degree-zero correspondence categories. All maps respect composition, graphs, tensor, transpose and the actions for which the corresponding quotient is defined.

**Hypotheses.** Use the already planned adequate-equivalence quotient construction and numerical relation. Numerical equivalence tests the degree against every complementary-codimension class, componentwise; the zero relation is rational equivalence on the Chow carrier. No reverse implication, independence of H or standard conjecture is asserted.

**Construction or proof.**

1. A rationally zero class is the zero element of CH and hence belongs to Alg. Compare with the rational-curve-fibre presentation of rational equivalence.
2. Use algebraic-implies-homological. For H⇒num use cycle-class multiplicativity and the trace-degree formula: a zero cycle class has zero degree pairing with every complementary class. This is already an API theorem of MC.2/homological-equivalence.
3. Apply quotient universal properties to inclusions of kernel families. Adequacy supplies well-defined composition and tensor on each quotient; quotient surjectivity on each Hom gives the functors.

**Check.** On P¹, degree distinguishes a point from zero in all four quotients. On an elliptic curve over ℂ, an infinite-order degree-zero divisor is nonzero rationally and zero algebraically, so the first quotient map need not be injective. The zero adequate family and the indiscrete family are distinct. Numerical equivalence is coarsest only among nontrivial adequate families (I⁰(Spec k)=0), as retained in the numerical-equivalence target.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence-adequate`, `MotivesAndAlgebraicCycles:MC.0/algebraic-implies-homological`, `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`, `MotivesAndAlgebraicCycles:MC.2/homological-equivalence`.

**Source.** **MILNE.MOT**, §4, pp. 4–5; §6, p. 8 (Conjecture D). Provides rational/numerical quotient and cycle-class context, and identifies the reverse numerical-to-homological comparison as conjectural. The forward chain here is derived from the preceding algebraic comparison and the imported trace-degree API, rather than stated in this source. **ACMV.2017**, §2.7, Remarks 2.20 and 2.23, p. 11. Rational-curve triviality represents precisely the zero Chow class, so rational equivalence is contained in algebraic equivalence.

## Support, diagonal action and the quartic input

The support route passes through an integral multiple of the diagonal and its action on cohomology sheaves. Its output is bounded exponent integrally and vanishing rationally. For the real closed application the relevant cohomology is semialgebraic, with its equivariant version and regular-representation summand; it is not obtained by substituting an étale coefficient group into an unrelated formula.
### Universal support for zero-cycles

**Target:** `MotivesAndAlgebraicCycles:MC.0/universal-ch0-support` (definition).

For a proper geometrically integral k-variety X and an integer s≥0, UniversalCH0Support(X,s) means: for every algebraically closed field extension L/k, there exists a closed reduced subvariety Y_L⊂X_L with dim Y_L≤s for which CH_0(Y_L)→CH_0(X_L) is surjective, with integral coefficients. The support may depend on L. Separately, a fixed support Y⊂X is universally supporting if this same surjectivity holds for every field extension L/k with Y_L the base change of Y. Keep these two quantified statements distinct.

**Hypotheses.** Properness makes the closed-immersion pushforward and degree available. The zero-cycle Chow group and base change belong to SF.5. This is a property of existing schemes/Chow groups, not a replacement for those carriers.

**API.**

- `UniversalCH0Support.witness` (projection): For each algebraically closed L/k obtain Y_L and surjectivity of its proper pushforward.
- `UniversalCH0Support.mono` (relation): A support bound s implies every larger bound; for nonempty X its dimension is a bound.
- `UniversalCH0Support.baseChange` (functoriality): For any extension K/k, a universal support bound for X/k implies the same bound for X_K/K.
- `FixedCH0Support.toUniversal` (compatibility): A fixed support of dimension at most s universally surjecting over all extensions implies UniversalCH0Support(X,s). The converse is not built into the definition.
- `UniversalCH0Support.properImage` (functoriality): A proper map surjective on CH_0 after every algebraically closed base extension transports a support bound to its image variety.
- `UniversalCH0Support.degree_one` (characterisation): For a proper geometrically integral variety over algebraically closed L, a single rational point supports CH_0 exactly when deg:CH_0→ℤ is an isomorphism.

**Unit tests.**

- **projective_space.** For every n≥0, Pⁿ_k has universal support of dimension zero: after every algebraically closed extension its CH_0 is ℤ generated by a rational point.
- **curve_product.** For a smooth projective curve C/k, C×Pⁿ has universal support at most one, using C×{point} after each algebraically closed extension and the projective bundle formula.
- **elliptic_nonexample.** For an elliptic curve over ℂ no zero-dimensional closed support surjects onto CH_0: the image of its finite set of points is finitely generated, whereas the degree-zero subgroup E(ℂ) is uncountable.
- **fixed_vs_varying.** A supplied fixed Y over all extensions is a stronger usable input; a witness Y over k or over one algebraic closure alone does not discharge either universal quantifier.

**Construction or proof.**

1. State the algebraically closed extension quantifier before the existential support and use the actual SF.5 closed-immersion pushforward.
2. Package witnesses, dimension bounds and monotonicity; separate the stronger fixed-support condition needed by the elementary generic-point decomposition.
3. Prove stability under base-field extension by composing the field embeddings. Transport through a proper map when its base-changed CH_0 pushforward is surjective and the image of a support has the required dimension.

**Check.** Support over one algebraic closure is not the definition. No rational coefficient replacement is used for the quartic or Euler-index applications.

**Uses.** BW Proposition 5.2 and MC.0/real-universal-surface-vanishing: Supplies the dimension-two hypothesis for rational cohomology-sheaf vanishing. BW Proposition 5.7 and MC.0/quartic-universal-support: Records the quartic’s zero-dimensional support independently of real points or an integral Hodge conjecture.

**Dependencies.** `SchemeAndStackFoundations:SF.5/chow-group`, `SchemeAndStackFoundations:SF.5/chow-proper-push`, `SchemeAndStackFoundations:SF.5/degree`.

**Source.** **BW.2020**, Proposition 5.2 hypothesis and proof, p. 66; Proposition 5.7 proof, p. 71. The surface-support hypothesis ranges over every algebraically closed extension of the real closed base, and the quartic supplies support of dimension zero. **CTV.2011**, Proposition 3.3(ii), pp. 10–11. Gives the complex fixed-support formulation used in the diagonal argument.
### Support and decomposition of a multiple of the diagonal

**Target:** `MotivesAndAlgebraicCycles:MC.0/diagonal-decomposition` (theorem).

Let X/k be smooth projective geometrically integral of dimension d and Y⊂X a closed reduced support of dimension at most s. If CH_0(Y_Ω)→CH_0(X_Ω) is surjective for an algebraic closure Ω of k(X), then there are N>0, a proper closed D⊊X, and Γ_D,Γ_Y in integral CH_d(X×X), supported respectively on D×X and X×Y, such that N[Δ_X]=Γ_D+Γ_Y. If surjectivity already holds over k(X), N=1 is possible. The first factor is the generic-point factor. A characteristic-zero smooth proper version and the passage from varying algebraically closed supports to a usable decomposition are separately identified assembly obligations.

**Hypotheses.** X is nonempty; d=0 is allowed and yields D empty. The hypothesis specifies a fixed Y defined over k and its base change to Ω, rather than a support chosen only after an unrelated extension. The smooth proper extension uses a smooth projective birational model and birational invariance of CH_0.

**Construction or proof.**

1. Restrict the diagonal along the generic point of the first factor. Its class is a zero-cycle on X_{k(X)}. Surjectivity gives a cycle from Y after passage to Ω.
2. Cycles, rational functions and their finite relations descend to a finite extension E/k(X). Apply the proper norm: restriction followed by norm is multiplication by [E:k(X)].
3. Spread the normed Y-cycle and the equality over a nonempty open U⊂X, using the direct-limit description of Chow groups at the generic point.
4. Localization for (X∖U)×X makes the remaining difference the pushforward of a class supported on D×X. Enlarging D is harmless. No injectivity at the left of the localization sequence is used.

**Check.** For P¹, Δ=[point×P¹]+[P¹×point], with N=1 and the indicated support orientation. Surjectivity only over Ω permits a nonunit N; it does not give an integral universal degree isomorphism. For a positive-genus complex curve, zero-dimensional support would force the identity on H¹ to factor through points and hence vanish, a contradiction.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/universal-ch0-support`, `SchemeAndStackFoundations:SF.5/chow-localization`, `SchemeAndStackFoundations:SF.5/chow-proper-push`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5/finite-flat-degree`, `SchemeAndStackFoundations:SF.4/chow-lemma`.

**Source.** **CTV.2011**, Proposition 3.3(ii), proof pp. 10–11. Uses a decomposition of a multiple of the diagonal with a divisor in the first factor and the supporting subvariety in the second. **BW.2020**, Proposition 5.2, proof p. 66. Invokes the same support argument in the real closed setting; the adapter from its quantified support hypothesis is tracked explicitly. **ACMV.DIAG.2025**, Definition 2.1 pp. 11–12; Lemma 3.1 pp. 15–16; Proposition 4.1 proof pp. 19–20. Confirms the support orientation, smooth-model factorization and generic-point/localization mechanism. Only these ingredients, not the motive consequences, are imported.
### Correspondences on cohomology sheaves

**Target:** `MotivesAndAlgebraicCycles:MC.0/cohomology-sheaf-correspondence-action` (construction).

For smooth projective pure-dimensional complex X,Y, a constant abelian coefficient group A and c∈CH^{dim X+r}(X×Y), construct c_*:H^p(X,ℋ_X^q(A))→H^{p+r}(Y,ℋ_Y^{q+r}(A(r))), where ℋ^q is the Zariski sheaf associated to U↦H^q(U(ℂ),A). The action is additive in c, annihilates algebraic equivalence, has the diagonal as identity, and respects composition with the displayed shifts. The real closed application uses the corresponding nonequivariant semialgebraic cohomology over C=R(i), with its supplier interface explicitly requested; ordinary Zariski cohomology of a constant sheaf is a different object.

**Hypotheses.** The Bloch–Ogus/Gersten interface supplies cycle classes in bidegree (c,c), cup products, proper trace, flat pullback, residues and the projection and base-change formulas. For negative sheaf-cohomology degrees the groups are zero. Twists in an iterated action are added. Integral coefficients are retained for the action; rationalization is applied only in the vanishing theorem.

**API.**

- `CohSheafCorr.act` (constructor): An additive action with source, target, shifts and coefficient twist as stated; scalar extension commutes with it.
- `CohSheafCorr.diagonal` (simp): [Δ_X] acts as the identity in bidegree (p,q).
- `CohSheafCorr.comp` (compatibility): (c′∘c)_*=c′_*∘c_* with total shift r+r′ and twist r+r′.
- `CohSheafCorr.algQuotient` (universal-property): Algebraically equivalent correspondences have the same action; the quotient universal property supplies the induced map.
- `CohSheafCorr.graph` (compatibility): A graph gives the existing pullback or proper pushforward as dictated by its orientation and degree; the action is not defined independently of these maps.
- `CohSheafCorr.supportFactor` (compatibility): In characteristic zero, an action supported on D×Y is a finite sum of factorizations through smooth projective resolutions of the actual first-projection images of its integral cycle components; their dimensions are at most dim D. For support X×W use the actual second-projection images and the corresponding shifted groups. Resolve those images and take strict transforms over their birational isomorphism loci, so pushforward recovers the integral components with degree one. An arbitrary preselected resolution of the whole support is not asserted to lift every component.
- `CohSheafCorr.changeCoefficients` (functoriality): A homomorphism A→B intertwines the two actions, including every twist and residue map.

**Unit tests.**

- **point.** For a point, H⁰(ℋ⁰(A))=A and the integer correspondence n acts by multiplication by n; it must not be the identity for every n.
- **projective_line_projectors.** On P¹, the two point/line projectors act separately on the degree-zero and top cycle-class bidegrees; their sum is the diagonal and mixed compositions vanish, fixing the orientation.
- **elliptic_difference.** On E/ℂ, the algebraically trivial divisor [P]−[O] gives the zero correspondence action, although its Chow class can be nonzero; a degree-one point gives the nonzero trace map.
- **shift_boundary.** A correspondence of degree r has output bidegree (p+r,q+r); a support factor with negative output sheaf-cohomology degree gives zero rather than a reindexed nonzero group.

**Construction or proof.**

1. Use c’s Bloch–Ogus class on X×Y. Pull back α by the first projection, cup with that class and trace along the second projection. Codimension dim X+r and trace shift −dim X give the shift (r,r) and twist r.
2. Prove the formula on Gersten/Cousin representatives, checking residue compatibility and the push-pull square. Correct the ambient target of CTV Lemma 9.3 as recorded in E48.
3. Projection and base change on X×Y×Z identify the iterated action with composition. For c=Δ use the graph/projection identities.
4. For a family over a smooth connected curve, the two fibre restrictions have the same action; the Gersten/cycle-class argument of Proposition 9.1 kills their difference. Thus factor through the algebraic quotient, not merely the rational quotient.

**Check.** The action is a map of the actual Bloch–Ogus groups supplied by SF.2, not an arbitrary collection of linear maps called a realization. All support-factorization formulas are checked with the forward p₂-push convention.

**Uses.** CTV Proposition 3.3(ii) and MC.0/supported-diagonal-vanishing: Converts the supported diagonal into two vanishing actions. BW Proposition 5.2 and its MC.7 consumer: Supplies the nonequivariant input before the induced-module summand argument.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/composition-associative`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.5/smooth-intersection`, `SchemeAndStackFoundations:SF.5/chow-proper-push`, `SchemeAndStackFoundations:SF.5/flat-pullback`.

**Source.** **CTV.2011**, Appendix §9, Proposition 9.1 and proof, pp. 42–44; Lemmas 9.2–9.3. Constructs the action modulo algebraic equivalence using cup product, trace, projection formula and base change. **BW.2020**, §5.1 pp. 62–65; Proposition 5.2 proof pp. 66–67. Specifies the real closed semialgebraic and equivariant sheaves used by the surface-support application. **ACMV.DIAG.2025**, Lemma 3.1 and proof, pp. 15–16, characteristic-zero degree-one case. Replaces the proposed support by the actual projection image of each integral cycle component before resolution; strict transform then gives integral pushforward equality without an extra multiplier.
### Vanishing from a supported diagonal

**Target:** `MotivesAndAlgebraicCycles:MC.0/supported-diagonal-vanishing` (theorem).

Let X/ℂ be smooth projective connected of dimension d, with NΔ=Γ_D+Γ_Y as above, dim D≤d−1 and dim Y≤s. For every abelian group A and every p<d−s with p≥0, multiplication by N annihilates H^p(X,ℋ_X^d(A)). In particular H^p(X,ℋ_X^d(ℚ))=0 in that range. The same implication applies to the nonequivariant characteristic-zero semialgebraic cohomology-sheaf theory satisfying the explicitly requested Bloch–Ogus and support-factorization interface.

**Hypotheses.** Use integral diagonal decomposition and the forward correspondence action. Resolve the actual projected images of individual integral cycle components in characteristic zero; their dimensions satisfy the support bounds, and their strict transforms push forward with generic degree one. The universal-support-to-decomposition adapter is not an extra unmentioned hypothesis: its verification is recorded as gap MC0-G1 for the real closed target.

**Construction or proof.**

1. Write each supported correspondence as a finite sum of integral cycle components. For a component take its actual image W in the supported factor, resolve W projectively, and close the inverse image over the birational isomorphism locus. The component dominates W, so its strict transform pushes forward to that component with degree one. This gives a finite sum of factorizations without changing N; clear denominators first only if starting from a rational decomposition.
2. For each D×X component with smooth model W̃ of its first-projection image, the action factors through H^p(W̃,ℋ_{W̃}^d(A)), which vanishes because dim W̃≤dim D<d.
3. For each X×Y component put w=dim W̃≤s for a smooth model of its second-projection image. Its action factors through H^{p−(d−w)}(W̃,ℋ_{W̃}^w(A(w−d))); the twist w−d agrees with the correspondence degree. This group vanishes because p−(d−w)<0 when p<d−s.
4. The diagonal action is the identity, so N kills the group. On ℚ-vector spaces N is invertible; this is the reason for rational vanishing.

**Check.** For surface support s=2 and d≥3, p=d−3 is strictly below d−2. At p=d−s the second factor has degree zero and the argument supplies no vanishing. Integral annihilation by N is never reported as integral vanishing.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/diagonal-decomposition`, `MotivesAndAlgebraicCycles:MC.0/cohomology-sheaf-correspondence-action`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.2`.

**Source.** **CTV.2011**, Proposition 3.3(ii) and proof, pp. 10–11; Proposition 9.1, p. 42. Proves bounded-exponent vanishing in sheaf-cohomology degrees less than the support codimension. **BW.2020**, Proposition 5.2 proof, pp. 66–67. Uses the same argument for semialgebraic cohomology and then rationalizes. **ACMV.DIAG.2025**, Lemma 3.1 and proof, pp. 15–16, characteristic-zero degree-one case. Replaces the proposed support by the actual projection image of each integral cycle component before resolution; strict transform then gives integral pushforward equality without an extra multiplier.
### Universal surface support over a real closed field

**Target:** `MotivesAndAlgebraicCycles:MC.0/real-universal-surface-vanishing` (application).

Let R be real closed, C=R(i), and X/R smooth proper geometrically integral of dimension d≥3. Suppose UniversalCH0Support(X,2). Then H^{d−3}(X_C,ℋ_{X_C}^d(ℚ))=0 and H^{d−3}(X,ℋ_X^d(ℚ(d−1)))=0. Here the first sheaf is defined by nonequivariant semialgebraic cohomology of U(C), and the second by G-equivariant semialgebraic cohomology, G=Gal(C/R). These are the two rational vanishings in the proof of BW Proposition 5.2, not its further torsion/finite-dimensional conclusions.

**Hypotheses.** The support hypothesis is integral and quantified over all algebraically closed extensions of R. No hypothesis X(R)=∅ is imposed. The SF.2 real closed Bloch–Ogus interface, universal-support adapter and proper/projective adapter are explicitly requested or recorded as gaps. The Tate twist ℚ(d−1) has the sign action (−1)^{d−1}; division by two is allowed.

**Construction or proof.**

1. Use universal support and the diagonal argument with s=2, p=d−3 to obtain the nonequivariant rational vanishing; the exact descent/spread step from varying supports remains MC0-G1.
2. Write π:X_C→X. BW Proposition 5.1(i) identifies ℋ_X^d(ℚ[G]) with π_*ℋ_{X_C}^d(ℚ), and its acyclicity gives the corresponding isomorphism on H^{d−3}.
3. Split the regular rational G-module by (1+σ)/2 and (1−σ)/2. The sign representation ℚ(d−1) is a direct summand, so its cohomology group is a direct summand of the zero group.

**Check.** For d=3 the first group is H⁰(ℋ³(ℚ)); p=d−3 is not substituted into the second sheaf degree. Neither ℓ-adic replacement of the semialgebraic sheaf nor an integral splitting by 1/2 is accepted. MC.7 imports these two vanishing statements; the integral Hodge assertions and BW Proposition 5.2’s remaining consequences are outside MC.0.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/universal-ch0-support`, `MotivesAndAlgebraicCycles:MC.0/supported-diagonal-vanishing`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.4`.

**Source.** **BW.2020**, §5.1 pp. 62–65, Proposition 5.1(i); Proposition 5.2 proof pp. 66–67. Gives precisely the nonequivariant vanishing and the rational induced-module summand argument under universal surface support.
### Zero-cycles on low-degree hypersurfaces

**Target:** `MotivesAndAlgebraicCycles:MC.0/low-degree-hypersurface-ch0` (theorem).

Let K be algebraically closed of characteristic zero, n≥2, and X⊂Pⁿ_K a smooth geometrically integral hypersurface of degree e with 1≤e≤n. Then deg:CH_0(X)→ℤ is an isomorphism. In particular this remains true over every algebraically closed extension of K. This is the low-degree conclusion of Roitman’s Theorem 6(a), extended from that paper’s uncountable-field convention by the elementary proof below, with n the ambient projective dimension, not dim X.

**Hypotheses.** Integral Chow groups are used; e may equal n. The proof imports the existing Jacobian/abelian-variety interface for divisibility of degree-zero zero-cycles, and SF.5’s refined excess-intersection formula. Roitman globally assumes an uncountable algebraically closed characteristic-zero field (Introduction, p. 571). Here the special-line existence argument uses only finitely many equations and the projective dimension theorem, and the curve/Jacobian divisibility argument uses surjectivity on points over any algebraically closed field. Thus this proof also covers countable algebraically closed characteristic-zero fields; no very-general-point argument is imported.

**Construction or proof.**

1. At x∈X choose a line whose first e−1 homogeneous intersection coefficients vanish; there are at most e−1 equations in P^{n−1}, so a nonzero direction exists. The line is contained in X or intersects it only at x with multiplicity e (Roitman Lemma 17).
2. Intersect this ambient line class with X using refined Gysin. In the proper-intersection case this gives e[x]; in the contained-line case the excess Chern class on the line gives the same value. All ambient line classes are rationally equivalent, so e([x]−[y])=0.
3. Degree-zero zero-cycles on a smooth projective connected variety over algebraically closed K are divisible: reduce to curves and use surjectivity of multiplication on their Jacobians (Roitman Proposition 1). A divisible group killed by e is zero.
4. A K-point exists, so degree is surjective. Smoothness, degree and the dimension inequality are preserved by algebraically closed base extension.

**Check.** e=1 gives projective space; a smooth plane conic has degree isomorphism, including e=n=2. For a smooth plane cubic, e=3>n=2 and CH_0⁰ is nonzero; this rejects the weaker bound e≤n+1. A smooth quartic in P⁴ has e=n=4 and tests the valid boundary. An anisotropic conic over a nonclosed field has degree image 2ℤ, so algebraic closedness cannot be removed.

**Dependencies.** `SchemeAndStackFoundations:SF.5/chow-group`, `SchemeAndStackFoundations:SF.5/degree`, `SchemeAndStackFoundations:SF.5/refined-gysin`, `SchemeAndStackFoundations:SF.5/projective-bundle-formula`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5/gysin-excess`, `SchemeAndStackFoundations:SF.3/abel-maps-high-degree`.

**Source.** **ROITMAN.1972**, Introduction p. 571 (uncountable-field convention); §2, Proposition 1 and Lemma 13, pp. 582–583; §5, Theorem 6(a) and Lemma 17, pp. 587–588. Combines Jacobian divisibility with the special-line bounded-exponent argument for e≤ambient n. The displayed proof explains why this low-degree conclusion extends beyond the source’s global uncountability assumption. **BW.2020**, Proposition 5.7 proof, p. 71. Cites Roitman Theorem 6 for the quartic threefold’s universal zero-dimensional support.
### Universal zero-dimensional support for quartic threefolds

**Target:** `MotivesAndAlgebraicCycles:MC.0/quartic-universal-support` (application).

For every real closed R and every smooth quartic hypersurface X⊂P⁴_R, X is geometrically integral of dimension three and UniversalCH0Support(X,0). More explicitly, for each algebraically closed extension L/R, degree identifies CH_0(X_L) with ℤ and every L-point generates it. Hence X satisfies the surface-support hypothesis and the two rational vanishing conclusions above with d=3.

**Hypotheses.** Smooth means the hypersurface is geometrically smooth; over the algebraic closure a smooth positive-dimensional hypersurface in P⁴ is connected and integral. No assertion that X has an R-point, or that CH_0(X_K)→ℤ is an integral isomorphism for every nonclosed K/R, is included.

**Construction or proof.**

1. Base change to any algebraically closed L/R; char L=0, e=n=4, so apply low-degree-hypersurface-ch0.
2. Choose an L-point and its zero-dimensional reduced support. Its CH_0 pushforward is surjective by the degree computation.
3. Apply monotonicity from bound zero to two and then real-universal-surface-vanishing.

**Check.** The Fermat quartic x₀⁴+⋯+x₄⁴=0 over R has no R-points but satisfies this support conclusion after every algebraically closed extension. A rational point over R is not used to choose all the witnesses; witnesses are chosen over each L. This application is independent of the real integral Hodge conjecture for quartics, which is an MC.7 target.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/low-degree-hypersurface-ch0`, `MotivesAndAlgebraicCycles:MC.0/universal-ch0-support`, `MotivesAndAlgebraicCycles:MC.0/real-universal-surface-vanishing`, `SchemeAndStackFoundations:SF.4`.

**Source.** **BW.2020**, Proposition 5.7 proof, p. 71. Uses exactly the quartic’s universal zero-dimensional CH_0 support, before invoking Proposition 5.2. **ROITMAN.1972**, Theorem 6(a), pp. 587–588. The low-degree-hypersurface-ch0 node justifies the extension of the source’s degree bound 4≤4 from its uncountable-field convention to every algebraically closed characteristic-zero extension.

## Euler congruences and the quadric input

These three targets keep the dimension filtration integral. Passing immediately to rational cycles would erase the nonzero class in the quadric example and would make it incapable of testing the difference between algebraic and integral arithmetic homological equivalence.
### Intermediate Euler indices

**Target:** `MotivesAndAlgebraicCycles:MC.0/intermediate-index` (definition).

For a proper finite-type k-scheme X and i≥0, define the ideal ELW_i(X)⊂ℤ generated by χ(X,F) for coherent F with support dimension at most i. Set ELW_{−1}(X)=0; set ind_i(X) to the nonnegative generator of ELW_i(X). For i≥dim X the ideals stabilize. In particular ind_0 is the ordinary index, the gcd of the degrees of closed points. Zero ideals, including the empty scheme, have generator zero. Here BW’s notation ind_i is separated from Kollár’s ideal-valued elw_i.

**Hypotheses.** Coherent Euler characteristic is the finite alternating sum of k-dimensions for proper schemes, imported from SF.2. The support filtration on coherent G_0 and proper pushforward belong to SchemeKTheoryOperations, not a second construction in MC.0. No regularity or smoothness hypothesis is needed for the definition.

**API.**

- `EulerIndex.ideal` (data): An ideal of ℤ for each i≥−1, with its nonnegative generator and ideal-generator equality.
- `EulerIndex.membership` (characterisation): Membership is a finite integer linear combination of Euler characteristics of coherent sheaves of support dimension at most i.
- `EulerIndex.integralSubvarieties` (characterisation): The same ideal is generated by χ(Z,O_Z) for integral closed Z of dimension at most i; normalization or a proper birational model gives the same ideal.
- `EulerIndex.mono` (relation): i≤j implies ELW_i⊂ELW_j, equivalently ind_j divides ind_i; include the zero-ideal boundary.
- `EulerIndex.properPush` (functoriality): For a proper k-morphism X→Y, ELW_i(X)⊂ELW_i(Y), through the alternating derived pushforward and its support bound.
- `EulerIndex.zero` (compatibility): ELW_0 is the degree ideal of zero-cycles under SF.5 degree; each closed point contributes its full residue-field degree.
- `EulerIndex.rationalPoint` (simp): A k-point forces every ELW_i with i≥0 to equal ℤ. The empty scheme has all ideals zero.
- `EulerIndex.baseChange` (compatibility): A field extension preserves coherent Euler characteristic of a fixed sheaf and gives ELW_i(X)⊂ELW_i(X_L); equality is not asserted. This uses proper coherent flat base change.

**Unit tests.**

- **point_and_empty.** Spec k has ind_i=1 for i≥0; the empty scheme has ind_i=0 and ELW_{−1}=0. A definition forcing a positive generator for the zero ideal fails.
- **anisotropic_conic.** A smooth conic with no real points has ind_0=2 and ind_1=1: every closed point has even degree, while χ(O_C)=1. Thus adjacent indices need not coincide.
- **projective_space.** Pⁿ_k has index one in every nonnegative stage by its rational point, agreeing with the ordinary zero-cycle degree ideal.
- **base_extension_drop.** The anisotropic real conic becomes split over ℂ; ind_0 drops from 2 to 1. Base-change invariance would be false.

**Construction or proof.**

1. Take the image under coherent Euler characteristic of the dimension-i support filtration, then the generated ideal of ℤ.
2. Apply existing coherent-support dévissage: χ(F) modulo the lower-support ideal is the sum of generic lengths times χ(O_Z) on top-dimensional integral supports.
3. Use proper birational pushforward to replace each O_Z by the structure sheaf of its normalization modulo lower-dimensional terms. This also proves the gcd formula used in BW Proposition 3.10.

**Check.** ELW_i⊂ELW_{i+1}; hence ind_{i+1} divides ind_i, not the reverse. The index is a gcd of degrees of arbitrary integral zero-cycles; it need not be the degree of an effective point.

**Uses.** MC.0/euler-characteristic-mod-index; BW Remark 3.13: Supplies the lower-dimensional modulus and the image ideal. MC.0/karpenko-quadric; BW Remark 3.13: ind_0=2 makes the odd Euler characteristic a nonzero obstruction to algebraic triviality.

**Dependencies.** `SchemeAndStackFoundations:SF.2`, `SchemeKTheoryOperations:S.3/coherent-support-devissage`, `SchemeKTheoryOperations:S.7/pushforward-euler-class`, `SchemeKTheoryOperations:S.7`, `SchemeAndStackFoundations:SF.5/degree`.

**Source.** **KOLLAR.2014**, Definition 1 p. 1; Lemma 3 and Proposition 4 pp. 2–3; Lemma 5 pp. 2–3. Defines the support-filtered Euler ideals and proves dévissage, normalization and proper-push congruences. **BW.2020**, Proposition 3.10, pp. 50–52; Remark 3.13, p. 52. Uses the corresponding integer generators for Euler congruences of cycles.
### Euler characteristic modulo the lower index

**Target:** `MotivesAndAlgebraicCycles:MC.0/euler-characteristic-mod-index` (construction).

For proper X/k and i≥0, send a dimension-i integral cycle α=Σ_Z n_Z[Z] to χ_i(α)=Σ_Z n_Z χ(Z,O_Z) modulo ELW_{i−1}(X), equivalently modulo ind_{i−1}(X). This factors through rational and then algebraic equivalence to a homomorphism CH_i(X)/Alg_i(X/k)→ELW_i(X)/ELW_{i−1}(X)⊂ℤ/ELW_{i−1}(X). For i=0 the lower ideal is zero and the map is ordinary degree into ℤ. Normalizing Z leaves its congruence unchanged.

**Hypotheses.** X is proper of finite type over any field k, with the actual ground-field algebraic equivalence defined above. The displayed sum defines χ of a formal cycle linearly; it is not χ of the structure sheaf of its union or of a nonreduced thickening. In the target ℤ/(0)=ℤ; no division or modulus-by-a-positive-generator convention is imposed at index zero.

**API.**

- `CycleEulerMod.map` (constructor): An additive map on dimension-i cycles, followed by its induced map on CH_i and the algebraic quotient.
- `CycleEulerMod.integralCycle` (simp): The generator [Z] has value χ(Z,O_Z) modulo ELW_{i−1}; multiplying a cycle multiplies this value.
- `CycleEulerMod.devissage` (compatibility): A coherent sheaf of support dimension at most i has Euler congruence equal to the generic-length-weighted top cycle; lower-dimensional support maps to zero.
- `CycleEulerMod.normalization` (compatibility): χ(Z̃,O_{Z̃})≡χ(Z,O_Z) modulo ELW_{i−1}, for normalization or any proper birational model of integral i-dimensional Z.
- `CycleEulerMod.properPush` (functoriality): For proper f:X→Y, coefficientwise cycle pushforward intertwines χ_i after the quotient map ℤ/ELW_{i−1}(X)→ℤ/ELW_{i−1}(Y). A dimension-dropping component has zero value in the latter quotient.
- `CycleEulerMod.algQuotient` (universal-property): The map kills every permitted family difference and therefore uniquely factors through CH_i/Alg_i.
- `CycleEulerMod.degree` (compatibility): At i=0 its value is precisely the SF.5 degree with residue-field multiplicities; after any field extension it respects the quotient by the possibly larger lower ideal.

**Unit tests.**

- **closed_point.** A closed point with residue degree m has χ_0=m in ℤ. The trivial zero target for every i would fail this test.
- **lower_support.** A sheaf supported on finitely many points maps to zero in the i=1 congruence, even when its integer Euler characteristic is nonzero.
- **nodal_normalization.** For a proper integral nodal curve, the normalization correction is the Euler characteristic of a finite-support quotient; it vanishes modulo ind_0, illustrating why the congruence survives normalization while integer χ can change.
- **quadric_torsion.** For the Karpenko threefold below, χ_1 of the torsion generator is 1 modulo 2. A definition using only its rational or geometric cycle class would incorrectly give zero.

**Construction or proof.**

1. Use the cycle-to-associated-graded coherent G_0 map already owned by SchemeKTheoryOperations:S.7. Coherent dévissage and Euler characteristic send its lower-filtration ambiguity to ELW_{i−1}. This proves rational invariance.
2. For algebraic invariance replace an algebraically trivial cycle by an actual difference of effective flat cycle fibres over a smooth curve (ACMV Lemma 2.18, with the two projections corrected as in E51).
3. Apply constancy of Euler characteristic to each proper flat family. Dévissage identifies a fibre’s structure-sheaf Euler characteristic with the sum over its top components, modulo ELW_{i−1}; embedded/lower-dimensional pieces give exactly that error ideal. Thus the two cycle congruences agree.
4. Use proper-push Euler characteristic and the generic-degree dévissage formula to prove naturality; normalization changes the value only by lower-dimensional support.

**Check.** A rationally or algebraically trivial cycle maps to zero; this assertion concerns the congruence, not the integer-valued sum. The target image is ELW_i/ELW_{i−1}; components of dimension below i contribute nothing there. No factorization through integral arithmetic homological equivalence over arbitrary k is claimed.

**Uses.** BW Remark 3.13; MC.0/karpenko-quadric: Detects a non-algebraically-trivial torsion cycle whose integral arithmetic cycle class is zero. BW real Euler congruences at MC.7: Supplies the general-field factorization through algebraic equivalence; the stronger real homological factorization needs MC.7’s separate inputs.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/algebraic-equivalence`, `MotivesAndAlgebraicCycles:MC.0/curve-parameterisation`, `MotivesAndAlgebraicCycles:MC.0/intermediate-index`, `SchemeKTheoryOperations:S.7/cycle-class-to-graded-k0`, `SchemeKTheoryOperations:S.7/pushforward-euler-class`, `SchemeKTheoryOperations:S.3/coherent-support-devissage`, `SchemeKTheoryOperations:S.7`, `SchemeAndStackFoundations:SF.2`.

**Source.** **KOLLAR.2014**, Definition 13 and Proposition 14 with proof, p. 4; Lemmas 3 and 5, pp. 2–3. Proves invariance of Euler characteristic modulo the lower-support ideal under algebraic equivalence and the generic-degree congruence. **ACMV.2017**, Definition 2.17 and Lemma 2.18 with proof, pp. 10–11. Realizes an algebraically trivial cycle as a difference of effective flat fibres; the proof’s swapped projections are corrected. **BW.2020**, Remark 3.13, p. 52. Asserts this general-field algebraic-invariance statement before giving a counterexample to homological factorization.
### A homologically trivial cycle detected by Euler parity

**Target:** `MotivesAndAlgebraicCycles:MC.0/karpenko-quadric` (application).

Let F=ℂ((t))((u))((v)) and let X⊂P⁴_F be the smooth anisotropic quadric of q=⟨1,t,u,tu,v⟩. Then dim X=3, ind_0(X)=2, and CH_1(X) has a torsion subgroup ℤ/2 with generator τ whose χ_1 value is 1 modulo 2. The integral arithmetic group H⁴_et(X,ℤ₂(2)) is torsion-free, so the integral arithmetic cycle class of τ is zero. Consequently τ is homologically trivial for this map but not algebraically trivial over F. Tensoring CH_1 with ℚ kills τ, so this does not contradict the classical rational comparison chain.

**Hypotheses.** Characteristic is zero and the étale group is arithmetic over F, not the group after algebraic closure and not a selected classical Weil theory. The complete Clifford/K_0 calculation of χ_1(τ) and the integral Hochschild–Serre calculation are verification obligations MC0-G2 and MC0-G3, rather than assumptions silently absorbed into a cycle-class API.

**Construction or proof.**

1. Successive Laurent valuations prove anisotropy: ⟨1,t⟩ over ℂ((t)), then its twofold Pfister product ⟨1,t,u,tu⟩ over ℂ((t))((u)), and finally its sum with v⟨1⟩. Springer’s odd-degree anisotropy theorem makes all closed-point degrees even; adjoining √(−v) gives a degree-two point. Thus ind_0=2.
2. Since −1 is a square, the first four coefficients form a twofold Pfister form. Karpenko Theorem 5.3 gives TCH²(X)=ℤ/2; for the threefold CH²=CH_1.
3. Use the topological filtration on integral K_0, the CH²≃gr²_top K_0 comparison (§3.1), and the Clifford-index lattice of §3.3–3.8. Identify the torsion lift with the integral class whose split representative is ℓ₀=[O_point] and hence has χ=1. The explicit index/lift computation is MC0-G2.
4. Calculate H⁴_et(X,ℤ₂(2)) by integral Hochschild–Serre over F, including its filtration, differentials and extensions, to establish torsion-freeness (MC0-G3). A rational spectral sequence does not establish this.
5. A homomorphism from the order-two τ to a torsion-free target is zero; the Euler congruence is nonzero and factors through algebraic equivalence, proving the non-equivalence.

**Check.** Preserve all three Laurent parameters and the fifth coefficient v; replacing F by ℂ destroys the example. The nonzero Euler parity distinguishes τ from zero even though its arithmetic integral cycle class and rational Chow class are zero. Torsion-free geometric H⁴ alone is insufficient: arithmetic Hochschild–Serre contributions must be checked.

**Dependencies.** `MotivesAndAlgebraicCycles:MC.0/euler-characteristic-mod-index`, `MotivesAndAlgebraicCycles:MC.0/intermediate-index`, `QuadraticFormInvariantsPartII:Q2.4`, `QuadraticFormInvariantsPartII:Q2.2/odd-degree-anisotropy`, `SchemeKTheoryOperations:S.7/cycle-class-to-graded-k0`, `SchemeKTheoryOperations:S.7/pushforward-euler-class`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering`.

**Source.** **BW.2020**, Remark 3.13, p. 52. Gives precisely this field, quadric, torsion generator, Euler parity and torsion-free arithmetic cohomology as a counterexample to homological factorization over arbitrary fields. **KARPENKO.1991**, §3.1–3.9, pp. 126–129, especially Theorem 3.8 p. 128; Theorem 5.3 p. 132. Provides the integral K-theory filtration and torsion of codimension-two cycles on an anisotropic three-dimensional Pfister-neighbour quadric; the remaining explicit specialization is recorded.

## Worked examples across the interfaces

### The two projectors on the projective line

Put \(h_1=[x\times\mathbf P^1]\), \(h_2=[\mathbf P^1\times x]\). The projective bundle formula gives
\(\operatorname{CH}^*(\mathbf P^1\times\mathbf P^1)=\mathbf Z[h_1,h_2]/(h_1^2,h_2^2)\), with \(\deg(h_1h_2)=1\). The diagonal is \(h_1+h_2\). Under the forward action, \(h_1\) fixes \(1\in\operatorname{CH}^0\) and kills \(h\in\operatorname{CH}^1\); \(h_2\) kills \(1\) and fixes \(h\). In the reverse dimension-graded action, \(h_1\) kills the fundamental one-cycle and fixes a point. Composition gives the algebra \(\mathbf Q\times\mathbf Q\), not the product in the Chow ring of the square. This distinguishes correspondence composition, Chow multiplication and the two orientations.

The integral diagonal formula also supplies the simplest support decomposition: take \(D=Y=\{x\}\) and \(N=1\). All its terms are needed. In particular the hyperplane expansion for \(\mathbf P^r\) has \(r+1\) terms, indexed from zero through \(r\).

### One complementary pairing does not test numerical equivalence

On \(\mathbf P^1\times\mathbf P^1\), let \(a=h_1-h_2\). Its pairing with the diagonal is \(1-1=0\), but \(\deg(ah_1)=-1\). Thus \(a\) is not numerically trivial. The definition must quantify over every complementary class. On an elliptic curve over \(\mathbf C\), an infinite-order divisor \([P]-[O]\) has degree zero and is algebraically and numerically trivial while its rational Chow class is nonzero. These examples test different parts of the quotient chain.

### Universal support does not require a real point

The smooth quartic \(x_0^4+\cdots+x_4^4=0\) in \(\mathbf P^4_R\) has no point over a real closed \(R\): a sum of fourth powers can vanish only when all coordinates vanish. Over each algebraically closed extension \(L/R\), Roitman’s bound is \(e=4\le n=4\), so \(\operatorname{CH}_0(X_L)\cong\mathbf Z\). A point over that \(L\) is a zero-dimensional support. This verifies the quantified support input without producing an \(R\)-point or an integral degree isomorphism over every nonclosed field.

### Euler indices distinguish closed and nonclosed bases

For a conic \(C/R\) with no real points, each closed point has degree two and a complex point supplies such a point, so \(\operatorname{ind}_0(C)=2\). The genus-zero coherent-cohomology calculation gives \(\chi(\mathcal O_C)=1\), hence \(\operatorname{ind}_1(C)=1\). After extension to \(R(i)\), the conic is a projective line and its zero-index is one. Thus the Euler ideals grow with the support dimension, their positive generators decrease by divisibility, and base extension may enlarge the ideals. The zero ideal uses generator zero; it is retained at index minus one.

For the Laurent-field quadric, the planned integral K-theory calculation gives a torsion cycle with Euler value one modulo two. Since the Euler map kills algebraic equivalence, that single value proves non-algebraic-triviality. Its arithmetic integral cycle class is zero only after the separate integral Hochschild–Serre computation. Geometric torsion-freeness or rational coefficients cannot replace that calculation.

## Supplier extensions and verification obligations

Every extension here is assigned to the mathematical owner of its general theory. The request identifier gives a stable reference for assembly; it does not create a duplicate target in this layer.

### MC0-R1 — SchemeAndStackFoundations:SF.5

Extend the existing Chow localization/finite-flat-degree API with (a) the direct-limit isomorphism colim_{U⊂S nonempty} CH_{dim S+i}(U×X)≃CH_i(X_{k(S)}) for integral S and finite-type X, (b) descent of cycles and rational-equivalence witnesses along filtered field unions and an algebraic closure to a finite field extension, and (c) spread and specialization compatibilities with refined Gysin and proper transfer. State the norm identity res then cor=[E:K] for finite extensions including inseparable residue degrees. Existing finite-flat-degree already owns the degree formula; existing localization owns only right exactness, not a left injection. These supply the fixed-support generic-point proof and the missing varying-support adapter. Use a dimension grading on integral cycles before scalar extension.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/diagonal-decomposition`, `MotivesAndAlgebraicCycles:MC.0/real-universal-surface-vanishing`.

### MC0-R2 — SchemeAndStackFoundations:SF.4

Strengthen prescribed-point Bertini to ACMV Appendix A Theorem A.1 (pp. 17–18): a smooth geometrically integral quasi-projective variety of dimension at least one over any field has a smooth geometrically integral quasi-projective curve containing a specified finite smooth subscheme (in the applications, two rational points). Specify the finite-field construction. Import the existing smoothness-only Bertini node and extend it rather than define another Bertini theory. For the characteristic-zero proper support argument, add smooth projective birational models of integral proper supports of every required dimension, retaining dimension and generic degree one, via Chow lemma and resolution. The existing resolution-of-curves node alone is insufficient. Include connectedness/geometric integrality of smooth hypersurfaces of dimension at least two in projective space.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/curve-parameterisation`, `MotivesAndAlgebraicCycles:MC.0/diagonal-decomposition`, `MotivesAndAlgebraicCycles:MC.0/supported-diagonal-vanishing`, `MotivesAndAlgebraicCycles:MC.0/real-universal-surface-vanishing`, `MotivesAndAlgebraicCycles:MC.0/quartic-universal-support`.

### MC0-R3 — SchemeAndStackFoundations:SF.2

Bloch–Ogus supplier interface: Zariski sheaves ℋ_X^q(A(t)) of singular cohomology over ℂ, Gersten/Cousin resolution, cycle class CH^c/Alg→H^c(ℋ^c(ℤ(c))), products, flat pullback, proper trace, residue compatibility, projection formula and Cartesian flat base change. Supply ℋ_X^q=0 for q>dim X for complex singular and nonequivariant semialgebraic cohomology sheaves. This is neither a claim about ordinary topological cohomology nor a general vanishing assertion for G-equivariant sheaves: real points can contribute in high degree (BW Proposition 5.1(iv), pp. 64–65). The real equivariant rational vanishing is instead deduced using the regular-module pushforward and splitting below. Over a real closed R with C=R(i), supply the nonequivariant semialgebraic and G-equivariant semialgebraic versions from BW §5.1 pp. 62–65, including ℋ_X^q(A[G])≃π_*ℋ_XC^q(A) and R^aπ_*ℋ_XC^q(A)=0 for a>0, so H^p commutes with this π_*. Prove the support-factorization compatibilities after smooth proper models and their cohomological shifts. This is additional scope of the cohomology owner; generic Godement resolutions and RealAlgebraicGeometry CAD are not substitutes. The correspondence action itself is owned here.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/cohomology-sheaf-correspondence-action`, `MotivesAndAlgebraicCycles:MC.0/supported-diagonal-vanishing`, `MotivesAndAlgebraicCycles:MC.0/real-universal-surface-vanishing`.

### MC0-R4 — SchemeAndStackFoundations:SF.2

Provide coherent Euler characteristic of proper finite-type schemes, its compatibility with alternating higher proper pushforwards and extension of the base field, and its constancy for a coherent sheaf flat over a connected smooth curve with proper support. Combine with existing coherent G_0 dévissage; do not reconstruct K-theory here. A flat effective cycle fibre may have lower-dimensional/embedded structure, so the Euler-to-top-cycle comparison is a congruence modulo the lower support ideal, not an integer equality.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/intermediate-index`, `MotivesAndAlgebraicCycles:MC.0/euler-characteristic-mod-index`.

### MC0-R5 — SchemeAndStackFoundations:SF.3

Using the current TauCetiRoadmap JacobianChallenge divisor/Picard/Abel–Jacobi interfaces and the existing Abel-map target, supply divisibility of CH_0⁰ of a smooth projective connected variety over an algebraically closed characteristic-zero field: put finite zero-cycle support on smooth projective curves and use surjectivity of multiplication by every nonzero integer on the curve Jacobian. Include the curve-to-variety CH_0 pushforward compatibility. This is Roitman Proposition 1, pp. 582–583; do not use an Albanese isomorphism for higher-dimensional CH_0.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/low-degree-hypersurface-ch0`.

### MC0-R6 — QuadraticFormInvariantsPartII:Q2.4

Add the explicit non-Pfister diagonal-form valuation adapter: for residue characteristic different from two, anisotropic q₀ and q₁ over K remain anisotropic in q₀⊥t q₁ over K((t)), by the parity of the two least valuations. Apply successively to ⟨1,t⟩, ⟨1,t,u,tu⟩ and ⟨1,t,u,tu,v⟩ over ℂ and its three Laurent extensions. Existing unit-reduction/independent-values targets concern Pfister forms and do not directly cover the five-dimensional form. Import Q2.2/odd-degree-anisotropy. Identify the even Clifford algebra index for this five-dimensional Pfister neighbour (the exact value needed by Karpenko §3.3–3.8), with a splitting/valuation proof, to discharge MC0-G2.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/karpenko-quadric`.

### MC0-R7 — SchemeKTheoryOperations:S.7

Extend the existing codimension-filtered cycle-class-to-graded-k0 interface to the dimension-of-support filtration on coherent G_0 of every separated finite-type k-scheme: CH_i(X)→gr_i G_0(X), compatible with proper pushforward, generic lengths, and the Euler congruence modulo support dimension i−1. No equidimensionality is assumed in the Euler-index targets; on pure-dimensional schemes identify this with the existing codimension filtration using the dimension formula. Use the existing pushforward-euler-class and support-dévis­sage targets. Also provide the specialized Karpenko filtration adapter: CH²≃gr²_top K_0 for a three-dimensional quadric, its integral K_0 image inside split K_0 from the Clifford index, and an integral lift of the order-two CH² class with split representative ℓ₀=[O_point] and odd Euler characteristic. This is the source calculation in Karpenko §3.1–3.8, pp. 126–129, not rational Chern-character comparison; rationalization loses the class. MC.0 owns the counterexample assembled from this imported calculation.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/intermediate-index`, `MotivesAndAlgebraicCycles:MC.0/euler-characteristic-mod-index`, `MotivesAndAlgebraicCycles:MC.0/karpenko-quadric`.

### MC0-R8 — SchemeAndStackFoundations:SF.2

Extend the existing Hochschild–Serre covering interface to the integral continuous étale ℤ₂(2) groups of the explicit quadric over F=ℂ((t))((u))((v)). Calculate the E₂ terms in total degree four, possible incoming/outgoing differentials, and the integral filtration extensions, to prove H⁴_et(X,ℤ₂(2)) has no two-torsion as asserted in BW Remark 3.13. Coordinate its integral arithmetic cycle-class map with EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map, whose geometric torsion-coefficient construction alone is insufficient. An ℚ₂ calculation or geometric torsion-freeness is not a proof of the arithmetic integral statement. MC0-G3 records this precise source-verification obligation.

**Used by:** `MotivesAndAlgebraicCycles:MC.0/karpenko-quadric`.

The following obligations prevent a claim of closed coverage. The sourced target statements above remain the intended results; each obligation names the step whose source specialization has not been established.

### MC0-G1 — From varying algebraically closed support to the real closed diagonal argument

BW Proposition 5.2 (pp. 66–67) invokes the CTV proof for its all-algebraically-closed-extensions hypothesis. The elementary node here proves a decomposition only from a fixed Y over k that supports the generic point after algebraic closure. Verify the spread/specialization argument that passes from supports Y_L that may vary with L to the decomposition or an equivalent vanishing argument in this exact real closed setting, and the proper-to-projective adapter. Source CTV proves its fixed-support complex formulation; it is not itself a proof of this change of quantifiers. MC0-R1–R3 name the required operations. Until this is checked, the universal real closed application is a sourced target with this recorded gap, not closed coverage.

**Target:** `MotivesAndAlgebraicCycles:MC.0/real-universal-surface-vanishing`.

### MC0-G2 — Explicit Clifford and K-theory lift for the quadric Euler parity

Karpenko Theorem 5.3 proves the order-two CH² class for the given Pfister neighbour; §3.1–3.8 give the general K_0 lattice/filtration computation, and BW Remark 3.13 states its Euler parity. Work out the even Clifford index for q and identify the integral K_0 lift of the torsion generator inside the split lattice, checking χ≡1 modulo 2. Reading the general theorems does not by itself identify that lift. MC0-R6–R7 give exact supplier boundaries; do not replace the lift by an arbitrary rational point class over F.

**Target:** `MotivesAndAlgebraicCycles:MC.0/karpenko-quadric`.

### MC0-G3 — Integral arithmetic Hochschild–Serre computation for the quadric

BW Remark 3.13 asserts H⁴_et(X,ℤ₂(2)) is torsion-free by Hochschild–Serre, without displaying its computation. The integral E₂ terms, differentials and extensions for the explicit F and quadric have not been verified here. Supply the MC0-R8 computation; geometric H⁴ and rational coefficients do not resolve this obligation.

**Target:** `MotivesAndAlgebraicCycles:MC.0/karpenko-quadric`.

## Suggested forms and acceptance

The [Suggested file](../suggested/MotivesAndAlgebraicCycles--MC.0.lean) contains the standard note and the required Mathlib import. None of this layer’s new milestones has an easy statement on the pinned native carriers: the Chow quotient, refined intersection, algebraic subgroup and cohomology-sheaf groups are mathematical work assigned above. The full definitions, API items and tests therefore stay in this document. Point-cycle calculations cannot substitute for these targets. There are no stand-in types, admitted data definitions or unrelated numerical examples.

The layer passes its mathematical acceptance checks when the correspondence identities hold as equalities of cycle classes, the point and curve projectors have the indicated actions, numerical equivalence uses all complementary pairings, and the quotient comparison is typed for a selected geometric Weil theory. The integral support checks retain the all-algebraically-closed-extensions quantifier and the factor N. The Euler checks retain the lower-dimensional modulus and the arithmetic integral nature of the quadric example. Closed coverage additionally requires discharge of MC0-G1–G3 and supplier realization of MC0-R1–R8.

The atlas retains six planets: the correspondence group, composition, graph, category, adequate equivalence and numerical equivalence targets. This continuation adds no seventh planet. Algebraic equivalence, support and Euler targets remain fully specified in the reader.

## Source corrections used by this plan

The existing whole-roadmap record already identifies the Stacks associativity-label slip (E3), the graph-group notation (E6), the nontriviality qualification for the coarsest adequate relation (E10), and the final degree in the graph/diagonal identity (E11). The retained targets use their corrected forms; this packet does not issue those findings again.

**MotivesAndAlgebraicCycles/E48 — misprint.** CTV.2011, Lemma 9.3, final display, printed p. 44 in both the 13 June 2011 author preprint and arXiv:1005.2778v2; journal not collated. The target group’s base is written X×Y, although its cohomology sheaf is indexed by Y×Z and both sides have just been pushed to Y×Z. **Correction:** Replace the ambient base of that final cohomology group by Y×Z; retain the stated bidegree, coefficient group and twist. **Check:** The displayed map p₂₃ has codomain Y×Z, and pullback along the first projection of Y×Z followed by cup product also lies on Y×Z. The printed base does not type-check. This is an ambient-name slip, not a failure of flat base change. **Effect:** nothing. The packet records the source versions and correction searches; independent review REV-MotivesAndAlgebraicCycles--MC.0 confirms this finding at the stated versions.

**MotivesAndAlgebraicCycles/E49 — misprint.** ACMV.2017, Formula (2.6), proof of Proposition 2.14, printed p. 9 in 11 July 2017 revision; publisher HTML §3.5 proof of Proposition 3.14 formula (3.2); current author copy formula (3.6), p. 9. The projective-bundle expansion uses an upper exponent equal to the bundle rank N+1−g and gives W_j dimension i+1−(N−g)+j, even though the symmetrized class has dimension i+N. **Correction:** Use exponents 0≤j≤N−g (relative projective dimension) and W_j∈CH_{i+g+j}(Pic^N(C)×X). Then flat pullback raises dimension by N−g and j Chern caps lower it by j, giving i+N. **Check:** The rank is N+1−g, so the free projective-bundle basis ends at rank minus one. Dimension counting gives dim W_j+(N−g)−j=i+N. With the printed dimension, the terms instead have dimension i+1. The corrected formula still has only j=0 contributing to rational-point fibres, so the intended parameter-space theorem is unchanged. **Effect:** nothing. The packet records the source versions and correction searches; independent review REV-MotivesAndAlgebraicCycles--MC.0 confirms this finding at the stated versions.

**MotivesAndAlgebraicCycles/E50 — misprint.** ACMV.DIAG.2025, Example 2.3, printed p. 12 (PDF p. 36) of Astérisque 455 (2025); also current author copy Example 2.3. The hyperplane expansion of the projective-space diagonal stops at i=r−1. **Correction:** Sum the terms H₁^i H₂^{r−i} for 0≤i≤r, including H₁^r. **Check:** For r=1 the printed expression is P¹×point alone, whose forward action kills CH⁰; the diagonal must act identically on CH⁰ and CH¹. Adding point×P¹ gives the standard two projectors. The stated support decomposition works after this correction. **Effect:** nothing. The packet records the source versions and correction searches; independent review REV-MotivesAndAlgebraicCycles--MC.0 confirms this finding at the stated versions.

**MotivesAndAlgebraicCycles/E51 — misprint.** ACMV.2017, Proof of Lemma 2.18, printed p. 11 in 11 July 2017 revision; publisher HTML §3.6 proof of Lemma 3.18; current author copy proof of Lemma 3.18. For s₁=(p₁,p₀), s₀=(p₀,p₁), the effective cycle is built as pr₂*Z⁺+pr₁*Z⁻ but the claimed fibre difference has the sign of Z_{p₁}−Z_{p₀}. **Correction:** Use pr₁*Z⁺+pr₂*Z⁻ with the same marked points, or interchange s₀ and s₁ throughout the construction. **Check:** Expanding the printed V_{s₁}−V_{s₀} gives Z⁺_{p₀}−Z⁺_{p₁}+Z⁻_{p₁}−Z⁻_{p₀}=−(Z_{p₁}−Z_{p₀}). Swapping the two projection indices preserves effectivity and flatness and restores the claimed sign; the existence theorem remains valid. **Effect:** nothing. The packet records the source versions and correction searches; independent review REV-MotivesAndAlgebraicCycles--MC.0 confirms this finding at the stated versions.

**MotivesAndAlgebraicCycles/E52 — misprint.** ACMV.DIAG.2025, Remark 2.5, proof display, printed p. 12 (PDF p. 36) of Astérisque 455 (2025); also current author copy Remark 2.5. The action of the unmultiplied diagonal on β is identified with Nβ in the calculation for a decomposition of NΔ. **Correction:** Use (NΔ)_*β=Nβ. The resulting correct equality is Nβ=deg(β)α for the particular α defining Z₂. **Check:** The diagonal is the identity correspondence. Scalar N comes from NΔ and cannot be dropped in its action notation. E53 separately records the unjustified cancellation in the next sentence. **Effect:** nothing. The packet records the source versions and correction searches; independent review REV-MotivesAndAlgebraicCycles--MC.0 confirms this finding at the stated versions.

**MotivesAndAlgebraicCycles/E53 — error.** ACMV.DIAG.2025, Remark 2.5, assertion about every degree-N zero-cycle and its proof, printed p. 12 (PDF p. 36) of Astérisque 455 (2025); coefficient rings as in Definition 2.1 p. 11. For a strict R-decomposition of NΔ, the remark identifies Z₂ with the pullback of any degree-N zero-cycle and claims all such cycles are rationally equivalent to its chosen α, without a hypothesis excluding N-torsion. **Correction:** The action argument gives Nβ=deg(β)α, hence N(β−α)=0 when deg β=deg α=N. Keep this bounded-exponent conclusion; uniqueness requires additional N-torsion-freeness (or that N be invertible). The special N=1 conclusion with a rational point is valid. MC.0 uses only annihilation and then rationalization. **Check:** Cancellation of N in CH_0 is not valid generally. A counterexample within the stated arbitrary-ring scope is R=ℤ/2, N=2, and X=E_K for an elliptic curve E/ℂ and K=ℂ(E). Then 2Δ=0 admits the zero strict decomposition. The degree-two integral cycle β=2[O]+([η]−[O]) has nonzero image in CH_0(X)⊗ℤ/2: η is not twice a K-point, since that would extend to a rational map φ:E→E with [2]∘φ=id, contradicting degrees 4·deg φ=1. Thus the pullback pr₂^*β is nonzero (restrict to {O}×X), although Z₂=0. The display only forces 2β=0 in these coefficients. This finding concerns the general coefficient assertion, not the N=1 universal-triviality equivalence. **Effect:** a stated result. The packet records the source versions and correction searches; independent review REV-MotivesAndAlgebraicCycles--MC.0 confirms this finding at the stated versions.

## Boundaries of inherited comparison findings

These findings concern the roadmap beyond MC.0. They do not introduce targets of this layer.

- **RT-AREA-iwasawa-3/8.** Owner: PeriodsAndSpecialValues:PS.2; MotivesAndAlgebraicCycles:MC.5–MC.6. Outside MC.0. PS.2 owns effective periods, Tate localization and extension of evaluation; MC.5–MC.6 supply the category/torsor. The whole-roadmap packet already records supplier fixes and a review requiring comparison compatibility. This MC.0 pass neither duplicates them nor claims to close that review. Tests of the Tate inverse, its evaluation and the rank-one Tate torsor belong there.

- **RT-AREA-algebraicgeometry/31.** Owner: ComplexComparisonPartII:C5; SchemeAndStackFoundations:SF.6; MotivesAndAlgebraicCycles:MC.2. Outside MC.0. Add the C5 comparison-supplier edges to the SF.6 and MC.2 consumers and retain cup, pullback and trace compatibility. This pass imports only the independently axiomatized early MC.2 Weil interface, not a de Rham–Betti comparison; it creates no competing supplier.

- **RT-AREA-geomlanglands/17.** Owner: Foundational relative Tannakian reconstruction owner; MotivesAndAlgebraicCycles:MC.6 and GeometricSatakeAndFusion:GS4 consumers. Outside MC.0. General relative reconstruction and the Deligne–Milne recognition criteria must have one foundational owner; MC.6 and GS4 import it. This pass supplies correspondence categories only and introduces no reconstruction target or field-only duplicate.

## References and reading scope

All locators refer to the stated version. The entries record the parts used to justify targets, rather than a section-by-section account of a source. The version hashes and version-of-record collations are in the packet. All reading dates are 19 October 2026.

- **STACKS.WEIL.** The Stacks Project Authors, [Weil Cohomology Theories](https://stacks.math.columbia.edu/download/weil.pdf). Live chapter downloaded 2026-10-19; tags, not mutable lemma numbers, identify targets. Used locators: Section 3, tags 0FFZ–0FG8, PDF pp. 3–7: correspondences; Section 4, tags 0FGF and 0FGJ, pp. 9–11: projectors and tensor identities; Section 7, tags 0FGV–0FGW, pp. 14–16: classical Weil axioms and trace-degree.

- **MILNE.MOT.** James S. Milne, [Motives—Grothendieck’s Dream](https://www.jmilne.org/math/xnotes/MOT.pdf). Author notes, 15-page version downloaded 2026-10-19. Used locators: Sections 4–5, pp. 4–6: rational/numerical cycle quotients and motives; Section 6 p. 8: cycle-class and Conjecture D context. This note does not state the algebraic-to-homological comparison attributed to it in the initial packet.

- **ACMV.2017.** Jeffrey D. Achter; Sebastian Casalaina-Martin; Charles Vial, [Parameter spaces for algebraic equivalence](https://www.math.colostate.edu/~achter/math/abtriv0717.pdf). Author revision dated 11 July 2017; proposition numbering refers to this revision. Used locators: Introduction pp. 1–2; §2.1–2.7 pp. 4–11, especially Definition 2.1, Proposition 2.5, Lemmas 2.8–2.9, Propositions 2.10–2.11 and 2.14, Lemma 2.18 and Remarks 2.20–2.23; Appendix A, Theorem A.1, pp. 17–18.

- **BW.2020.** Olivier Benoist; Olivier Wittenberg, [On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf). Author copy of Inventiones mathematicae 222 (2020), 1–77; DOI 10.1007/s00222-020-00965-8. Used locators: Proposition 3.10 and Remark 3.13, pp. 50–52; §5.1, pp. 62–65 (definitions and Proposition 5.1(i)); Proposition 5.2 and proof, pp. 66–67; Proposition 5.7 proof, p. 71.

- **CTV.2011.** Jean-Louis Colliot-Thélène; Claire Voisin, [Cohomologie non ramifiée et conjecture de Hodge entière](https://www.cmls.polytechnique.fr/perso/voisin/Articlesweb/CTVoisin13juin11.pdf). Author preprint dated 13 June 2011; locators are printed preprint pages, not journal pages. Used locators: §3.2, Proposition 3.3(ii) and proof, pp. 10–11; Appendix §9, Proposition 9.1, Lemmas 9.2–9.3 and proofs, pp. 42–44.

- **KOLLAR.2014.** János Kollár, [Esnault–Levine–Wittenberg indices](https://arxiv.org/pdf/1312.3923v2). arXiv:1312.3923v2, 10 January 2014. Used locators: §1, Definition 1 p. 1, Lemmas 3 and 5 and Proposition 4 pp. 2–3; Definition 13, Proposition 14 with proof, p. 4.

- **KARPENKO.1991.** N. A. Karpenko, [Algebro-geometric invariants of quadratic forms](https://sites.ualberta.ca/~karpenko/publ/agiqf.pdf). Published English scan, Leningrad Mathematical Journal 2 (1991), 119–138. Used locators: §3.1–3.9, pp. 126–129, including Theorem 3.8 and proof; Theorem 5.3 and proof, p. 132. Scanned pages read visually.

- **ROITMAN.1972.** A. A. Roitman, [Rational equivalence of zero-cycles](https://www.mathnet.ru/php/getFT.phtml?jrnid=sm&option_lang=eng&paperid=3248&what=fullteng). Mathematics of the USSR-Sbornik 18 (1972), 571–588; English translation. Used locators: Introduction pp. 571–574, including the uncountable-field convention; §2, Lemma 13 and Proposition 1, pp. 582–583; §5, Theorem 6(a) and Lemma 17, pp. 587–588. Read through the publisher’s public web rendering; no local PDF hash.

- **ACMV.DIAG.2025.** Jeffrey D. Achter; Sebastian Casalaina-Martin; Charles Vial, [Decomposition of the diagonal, intermediate Jacobians, and universal codimension-2 cycles in positive characteristic](https://smf.emath.fr/system/files/filepdf/smf_ast_455.pdf). Astérisque 455 (2025), DOI 10.24033/ast.1244; publisher PDF. Used locators: Chapter 2, Definitions 2.1 and 2.4, Example 2.3 and Remarks 2.5–2.10, pp. 11–13; Lemma 3.1 and proof pp. 15–16; Proposition 4.1 and proof pp. 19–20. The generic-point localization proof corroborates the fixed-support adapter; the unrelated motive consequences are not MC.0 targets.

- **JANNSEN.1992.** Uwe Jannsen, [Motives, numerical equivalence, and semi-simplicity](https://epub.uni-regensburg.de/26642/1/jannsen10.pdf). Inventiones mathematicae 107 (1992), 447–452; published scan in author institutional repository. Used locators: Opening definitions p. 447 and first comparison paragraph of Theorem 1 proof p. 448, for the retained adequate and numerical targets. The nontriviality correction is already recorded as MotivesAndAlgebraicCycles/E10, not a new finding.
