# Algebraic cycles, pure and mixed motives

Blueprint for the roadmap `MotivesAndAlgebraicCycles`, job `BP-MotivesAndAlgebraicCycles` (issue #1014).
Packet: `research/blueprint/packets/MotivesAndAlgebraicCycles.json`. Suggested Lean file:
`research/blueprint/suggested/MotivesAndAlgebraicCycles.lean`. Handoff:
`research/blueprint/handoff/BP-MotivesAndAlgebraicCycles.md`.

**Status: partial.** Six of the eight layers in scope are decomposed to declaration granularity; MC.4 and
MC.7 are left partial, each with a precise `remaining` list in the packet's coverage record. The packet has
84 nodes, 172 API items and 112 unit tests, cites 48 declarations of the pinned libraries, records 6 gaps and
makes 6 requests to other roadmaps.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Every source is freely available and was opened and read; the sections read are listed in the packet.

- **`STACKS.WEIL`** — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*. LaTeX source weil.tex at commit a04446e57ec1fbc252a871afcec7752fb2807b14 (28 July 2026)
  <https://stacks.math.columbia.edu/tag/0FFG>, read 2026-09-24.
  SHA-256 `3861f2d85eb151058b6a0248e7f1b06910adf8c4f4f017e856cc76f7a439ad3b`.
- **`STACKS.CHOW`** — The Stacks Project authors, *The Stacks Project, chapter "Chow Homology and Chern Classes" (tag 02P3)*. LaTeX source chow.tex at commit a04446e57ec1fbc252a871afcec7752fb2807b14 (28 July 2026)
  <https://stacks.math.columbia.edu/tag/02P3>, read 2026-09-24.
  SHA-256 `0522bd9a5934c5a65d9fccd651c77c1e012d9937aec49737d0b7fea6190dc001`.
- **`JANNSEN.1992`** — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*. Inventiones mathematicae 107 (1992), 447-452; the author's copy in the University of Regensburg repository
  <https://epub.uni-regensburg.de/26642/>, read 2026-09-24.
  SHA-256 `f2a285cb7ba9f53a1dcb3844e41901dd4f8391cc2655b1b8195bc7a62a277fab`.
- **`HMS.2014`** — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*. arXiv:1105.0865v5, 21 May 2014
  <https://arxiv.org/abs/1105.0865v5>, read 2026-09-24.
  SHA-256 `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563`.
- **`MVW.2006`** — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*. Clay Mathematics Monographs 2, American Mathematical Society, 2006; the freely posted Clay Mathematics Institute PDF
  <https://www.claymath.org/library/monographs/cmim02.pdf>, read 2026-09-24.
  SHA-256 `1197e239873e2a7f7f4dcbd1d115af67281a6d0867eff8816cc630b86b67f020`.
- **`MILNE.MOT`** — James S. Milne, *Motives - Grothendieck's Dream*. Expository article on the author's page, jmilne.org/math/xnotes/MOT.pdf, ten pages
  <https://www.jmilne.org/math/xnotes/MOT.pdf>, read 2026-09-24.
  SHA-256 `a701ee93d7cefbcc9570afce76b0bd235b6a1bffbf1567a1d73c307d700cd768`.

## What this roadmap owns, and what it imports

The restructuring proposal RS-08 was accepted before this job started and is binding. It keeps this
roadmap with its title and purpose, assigns it rational-equivalence Chow correspondences, pure Chow
motives with their idempotent completion, twists and duals, and the geometric mixed-motive comparison
including the Tate stabilisation, and narrows MC.4 so that the higher Chow complexes come from
`MotivicEtaleKTheory:M.4` and the finite correspondences and effective motivic category from
`MotivicEtaleKTheory:M.5a`. This packet is written to that assignment. Nothing another roadmap plans is
planned again here; every import is a `requests` entry:

- **`SchemeAndStackFoundations:SF.5`** — Chow groups with rational equivalence in every codimension, proper pushforward with its functoriality, flat and lci Gysin pullback, the intersection product with associativity and the projection formula, the compatibility of flat pullback with proper pushforward in a fibre square, the proper intersection formula identifying the product of two cycles meeting properly with the class of their scheme theoretic intersection, the degree of a zero cycle, the Chow ring of a projective bundle, the top Chern class of a locally free module and the Chern classes of a twist by a line bundle. Every one of these is cited by name in the construction of correspondences and of the projective bundle formula for motives, and none is planned in this packet; the reviewed audit of SF.5 records all of them as absent from both pinned libraries.
- **`SchemeAndStackFoundations:SF.2`** — An actual Weil cohomology theory: etale cohomology with torsion and l-adic coefficients, algebraic de Rham cohomology and Betti cohomology of the complex points, each with its cycle class map, its trace map and the verification of Poincare duality, the Kuenneth formula and the compatibilities with cycle classes. This packet plans what a realisation is and proves that realisations are the same thing as monoidal functors on motives; it does not construct a single theory, and the reviewed audit of SF.2 records that neither pinned library has a named etale cohomology API.
- **`SchemeAndStackFoundations:SF.6`** — The comparison isomorphisms between the realisations: Betti against de Rham over an embedding into the complex numbers, and etale against Betti with finite coefficients. The torsor statement of MC.6 is about the two fibre functors on Nori motives given by algebraic de Rham and singular cohomology, and it needs the comparison over the complex numbers as an input; this packet takes it as given from the owner of the comparison theorems.
- **`SchemeAndStackFoundations:SF.3`** — Smooth projective curves with their divisors and the degree map, and normal crossings divisors on a smooth projective variety. The pointed curve decomposition of MC.0 and the generators of Nori motives in MC.5 both need these; this packet uses them and plans neither.
- **`MotivicEtaleKTheory:M.4`** — Bloch's higher Chow groups defined by the cycle complexes, with the moving lemma, localisation, homotopy invariance and products, and their vanishing in negative simplicial degree. The comparison in MC.4 identifying motivic cohomology with higher Chow groups is one half of an isomorphism between an object this packet owns and an object M.4 owns; RS-08 assigns the cycle complexes to M.4 and the comparison to this roadmap.
- **`MotivicEtaleKTheory:M.5a`** — Finite correspondences between smooth schemes and their composition, presheaves and Nisnevich sheaves with transfers, the A^1-localisation producing the triangulated category of effective motives with the motive M(X) of a smooth scheme and the motivic complexes, the tensor structure, and Voevodsky's cancellation theorem with the base field and coefficient restrictions of the proof chosen. MC.4 builds the geometric subcategory and the Tate stabilisation on top of these and plans none of them; RS-08 assigns them to M.5a and names the narrowing of MC.4 accordingly.

## Layers

---

## MC.0 Cycle correspondences and equivalence relations

**Coverage: source_decomposed.** The graded category of correspondences over Q from the Stacks Project's Weil cohomology chapter: the groups Corr^r with their dimension shift, the action on cycles, composition through the triple product with associativity and the two identifications with Chow groups, graphs, the diagonal as identity, the contravariant functor, the transpose, what graphs do to cycles, the symmetric monoidal structure, and the two orthogonal projectors on the projective line together with the three on a pointed curve, which are the layer's own acceptance tests. The equivalence relations are decomposed as well: adequate relations and numerical equivalence from Jannsen and Milne, homological equivalence relative to a chosen theory, and the implication from homological to numerical. Algebraic equivalence is in the layer's brief and is recorded as a gap, since no source read here defines it. The Chow groups themselves, the intersection product, the projection formula, proper intersections and the degree of a zero cycle are imported from SchemeAndStackFoundations:SF.5 and are not planned here.

Everything in this roadmap is built on one object: the graded category over the rationals
whose objects are smooth projective schemes over a field and whose morphisms are rational cycle classes on
products. This layer builds it and nothing else. The Chow groups it is built from, the intersection product,
the projection formula, proper intersections and the degree of a zero cycle are not built here: they belong
to `SchemeAndStackFoundations:SF.5`, which the reviewed library audit records as absent from both pinned
libraries, and this layer imports them through a request.

The grading is the point of the construction and the place where an implementation first goes wrong. A
correspondence of degree `r` from `X` to `Y` is not a class of codimension `r` on `X × Y`: it is a class of
codimension `d + r` on `X_d × Y` for each equidimensional part `X_d` of `X`. The shift by `d` is what makes
the graph of a morphism have degree zero whatever the dimensions are, and it is what makes composition add
degrees. Every statement below is stated with that shift in place.

The layer also fixes the equivalence relations. Rational equivalence arrives with the Chow groups. Numerical
equivalence is defined here, by pairing against all cycles of complementary dimension. Homological equivalence
is defined here too, but relative to a chosen Weil cohomology theory, so its definition points forward to
MC.2; that dependency is real and is recorded as a prerequisite rather than hidden. Algebraic equivalence is
in the layer's brief and is **not** planned: no source read for this packet defines it, and the gap is
recorded rather than filled from memory.

**Planets of this layer** (6): *Correspondences*, *Composition of correspondences*, *Graph of a morphism*, *Category of correspondences*, *Adequate equivalence relation*, *Numerical equivalence*.

### Nodes (15)

#### `correspondence-group` — Correspondences of degree r

*definition.* **Planet:** *Correspondences*.

**Statement.** Let k be a field and let X and Y be smooth projective schemes over k. Write X as the disjoint union of its open and closed parts X_d that are equidimensional of dimension d. For an integer r define the Q-vector space of correspondences of degree r from X to Y as the direct sum over d of CH^{d+r}(X_d times Y) tensored with Q, viewed inside CH^*(X times Y) tensor Q. The grading is by codimension on each equidimensional part, and the shift by d is what makes the degree of a graph equal to zero whatever the dimension of X.

**Hypotheses.**

- k is a field.
- X and Y are smooth projective schemes over k, not assumed equidimensional or connected.
- Chow groups are taken with rational coefficients throughout; the integral groups are not used here.

**Construction, or proof, in steps.**

1. Decompose X into the open and closed subschemes X_d equidimensional of dimension d; this decomposition is finite and canonical.
2. For each d take CH^{d+r}(X_d times Y) tensor Q and form the direct sum over d.
3. Check that the sum embeds in CH^*(X times Y) tensor Q, so a correspondence is a rational cycle class on the product and nothing more.
4. Record that degree zero is the degree of a graph: for a morphism from Y to X the graph meets X_d times Y in pure codimension d.

**Acceptance.**

- For X equidimensional of dimension d the group of correspondences of degree r from X to Y is CH^{d+r}(X times Y) tensor Q; a definition that forgets the shift by d fails this already for X a point against X a curve.
- For X the spectrum of k the group of correspondences of degree r from X to Y is CH^r(Y) tensor Q.
- The group is a Q-vector space and vanishes for r outside a finite range determined by the dimensions of X and Y.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Corr` | data | For smooth projective X and Y over k and an integer r, the Q-vector space of correspondences of degree r from X to Y. |
| `Corr.toChow` | coercion | The inclusion of the correspondences of degree r into CH^*(X times Y) tensor Q. |
| `Corr.of_equidimensional` | characterisation | If X is equidimensional of dimension d then the correspondences of degree r from X to Y are exactly CH^{d+r}(X times Y) tensor Q. |
| `Corr.of_point` | characterisation | The correspondences of degree r from the spectrum of k to Y are CH^r(Y) tensor Q, and those from X to the spectrum of k are CH_{-r}(X) tensor Q. |
| `Corr.addCommGroup` | instance | Corr^r(X, Y) is a Q-vector space, the structure inherited from the Chow groups. |
| `Corr.disjointUnion` | compatibility | Corr^r(X disjoint union X', Y) is the product of Corr^r(X, Y) and Corr^r(X', Y). |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`: the composition law is defined on these groups and raises the degree additively
- `MotivesAndAlgebraicCycles:MC.1/chow-motive`: a morphism of motives from (X, p, m) to (Y, q, n) is an element of Corr^{n-m}(X, Y) fixed by p on the right and q on the left
- `MotivesAndAlgebraicCycles:MC.2/realization-equivalence`: a realisation is determined by what it does to these groups, since every morphism of motives is one of their elements

**Unit tests.** A plausible wrong definition fails one of these.

- `point_to_point`: The correspondences of degree zero from the spectrum of k to itself form Q, and those of nonzero degree vanish.
- `graph_has_degree_zero`: For a morphism f from Y to X of smooth projective schemes the class of the graph of f lies in degree zero, whatever the dimensions of X and Y. A definition without the shift by d puts it in degree dim X.
- `projective_line_degree_zero`: For X the projective line the correspondences of degree zero from X to X are CH^1(X times X) tensor Q, a two-dimensional Q-vector space.
- `not_graded_by_plain_codimension`: For X a point and Y a curve the correspondences of degree one from X to Y are CH^1(Y) tensor Q, which is not CH^1(X times Y) read with the codimension of X times Y unshifted when X is replaced by a surface; the two gradings disagree.

**Prerequisites.**

- `SchemeAndStackFoundations:SF.5`
- `mathlib:AlgebraicGeometry.Scheme`
- `mathlib:AlgebraicGeometry.Smooth`
- `mathlib:AlgebraicGeometry.IsProper`
- `mathlib:AlgebraicGeometry.AlgebraicCycle`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FFZ, the displayed definition opening the section.

  > We define the Q-vector space of correspondences of degree r from X to Y by the formula Corr^r(X, Y) = direct sum over d of CH^{d+r}(X_d times Y) tensor Q, contained in CH^*(X times Y) tensor Q.

  The node is that formula, with the decomposition of X into equidimensional parts spelled out as a hypothesis rather than left to the notation.

#### `correspondence-action-on-cycles` — Pullback and pushforward of cycles by a correspondence

*construction.*

**Statement.** Let c be a correspondence of degree r from X to Y. For a cycle class b in CH_j(Y) tensor Q define the pullback of b by c to be the pushforward along the first projection of the intersection product of c with the pullback of b along the second projection; it lies in CH_{j-r}(X) tensor Q. For a cycle class a in CH^i(X) tensor Q define the pushforward of a by c to be the pushforward along the second projection of the intersection product of c with the pullback of a along the first projection; it lies in CH^{i+r}(Y) tensor Q. Both are Q-linear in the cycle and in c.

**Hypotheses.**

- X and Y are smooth projective over k, so that the projections from X times Y are proper and flat on each equidimensional part.
- c is a correspondence of degree r from X to Y.
- Cycle classes are rational.

**Construction, or proof, in steps.**

1. Check that the second projection restricted to X_d times Y is flat of relative dimension d, so that the flat pullback of a cycle of dimension j is a cycle of dimension d + j.
2. Intersect with c, which lies in codimension d + r on X_d times Y, to land in dimension j - r.
3. Push forward along the first projection, which is proper, preserving dimension, and conclude that the pullback lands in CH_{j-r}(X) tensor Q.
4. Repeat the bookkeeping in codimension for the pushforward: the first projection pullback of a class of codimension i has codimension i, the product with c has codimension i + d + r on X_d times Y, and the proper pushforward along the second projection lands in codimension i + r on Y.
5. Prove Q-bilinearity of both operations in c and in the cycle, from linearity of flat pullback, proper pushforward and the intersection product.

**Acceptance.**

- The degrees are as stated: pullback lowers dimension by r and pushforward raises codimension by r. An implementation that keeps the degree fixed is wrong.
- For c the class of the diagonal both operations are the identity.
- Both operations are Q-linear in the cycle and in the correspondence.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Corr.pullback` | data | The map from CH_j(Y) tensor Q to CH_{j-r}(X) tensor Q attached to a correspondence of degree r. |
| `Corr.pushforward` | data | The map from CH^i(X) tensor Q to CH^{i+r}(Y) tensor Q attached to a correspondence of degree r. |
| `Corr.pullback_linear` | functoriality | Both operations are Q-linear in the cycle class and additive in the correspondence. |
| `Corr.pullback_diagonal` | simp | Pullback and pushforward by the class of the diagonal are the identity. |
| `Corr.pushforward_degree` | projection | The degree bookkeeping, stated as an equality of the gradings rather than as a side condition. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.0/composition-associative`: the compatibility of composition with these two operations is part (4) of the composition lemma
- `MotivesAndAlgebraicCycles:MC.1/chow-group-of-motive`: the functoriality of the Chow groups of a motive is pushforward by the morphism, read through this operation

**Unit tests.** A plausible wrong definition fails one of these.

- `diagonal_acts_trivially`: Pullback and pushforward by the diagonal class of X are the identity on CH_*(X) tensor Q.
- `graph_of_a_point`: For X the projective line, x a rational point and c the class of x times X, pushforward by c sends the class of X to the class of x times X pushed to X, and the degree bookkeeping identifies the target group.
- `zero_correspondence`: The zero correspondence induces the zero map in both directions, and a nonzero correspondence need not: the diagonal is a witness.

**Prerequisites.**

- `SchemeAndStackFoundations:SF.5`
- `MotivesAndAlgebraicCycles:MC.0/correspondence-group`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FFZ, the two displayed formulas after the definition of Corr^r(X, Y).

  > Given c in Corr^r(X, Y) and b in CH_j(Y) tensor Q we can define the pullback of b by c using the formula c^*(b) = pr_{1,*}(c . pr_2^*b) in CH_{j-r}(X) tensor Q. Similarly, switching to grading by codimension, given a in CH^i(X) tensor Q, c_*(a) = pr_{2,*}(c . pr_1^*a) in CH^{i+r}(Y) tensor Q.

  The node is those two formulas together with the dimension bookkeeping the source gives immediately after each, which is what fixes the target degrees.

#### `correspondence-composition` — Composition of correspondences through the triple product

*construction.* **Planet:** *Composition of correspondences*.

**Statement.** For smooth projective X, Y, Z over k define a Q-bilinear composition from correspondences of degree s from Y to Z and correspondences of degree r from X to Y to correspondences of degree r + s from X to Z by sending a pair (c', c) to the pushforward along the projection from X times Y times Z to X times Z of the intersection product of the pullback of c along the projection to X times Y with the pullback of c' along the projection to Y times Z.

**Hypotheses.**

- X, Y and Z are smooth projective schemes over k.
- c is a correspondence of degree r from X to Y and c' one of degree s from Y to Z.
- The three projections from the triple product are used: the first two are flat on each equidimensional part and the projection to X times Z is proper.

**Construction, or proof, in steps.**

1. Pull c back along the projection to X times Y and c' back along the projection to Y times Z, both flat pullbacks on each equidimensional piece.
2. Take the intersection product of the two pulled back classes on the triple product.
3. Push the result forward along the proper projection to X times Z.
4. Check the degree: the result has degree r + s, by the same dimension count as for the action on cycles.
5. Check Q-bilinearity, from linearity of flat pullback, proper pushforward and the intersection product.

**Acceptance.**

- Composition is Q-bilinear and raises degree additively.
- Composing the graphs of two composable morphisms gives the graph of the composite, in the opposite order.
- Composition with the class of the diagonal on either side is the identity.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Corr.comp` | data | The composition map from correspondences of degree s from Y to Z and degree r from X to Y to correspondences of degree r + s from X to Z. |
| `Corr.comp_bilinear` | functoriality | Composition is Q-bilinear in each argument. |
| `Corr.comp_degree` | projection | The degree of a composite is the sum of the degrees. |
| `Corr.comp_graph` | compatibility | The composite of the graphs of two morphisms is the graph of the composite, with the order reversed. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`: composition is the composition of the graded category
- `MotivesAndAlgebraicCycles:MC.1/chow-motive`: composition of morphisms of motives is this composition, restricted to the subgroups cut out by the projectors

**Unit tests.** A plausible wrong definition fails one of these.

- `degree_adds`: The composite of a correspondence of degree one and one of degree minus one has degree zero.
- `projective_line_projectors`: On the projective line the classes of a point times the line and of the line times a point compose to zero in both mixed orders and to themselves in the two pure orders.
- `diagonal_is_a_unit`: Composition with the class of the diagonal of X is the identity on correspondences into and out of X.

**Prerequisites.**

- `SchemeAndStackFoundations:SF.5`
- `MotivesAndAlgebraicCycles:MC.0/correspondence-group`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FFZ, the display defining the composition of correspondences.

  > We define a composition of correspondences Corr^s(Y, Z) times Corr^r(X, Y) to Corr^{r+s}(X, Z) by the rule (c', c) maps to c' composed with c = pr_{13,*}(pr_{12}^*c . pr_{23}^*c').

  The node is that display, with the flatness and properness of the three projections written out as the hypotheses the pullbacks and the pushforward need.

#### `composition-associative` — Composition is associative and computes the action on cycles

*theorem.*

**Statement.** Composition of correspondences is Q-bilinear and associative. There is a canonical isomorphism from CH_{-r}(X) tensor Q to the correspondences of degree r from X to the spectrum of k under which pullback by a correspondence corresponds to composition, and a canonical isomorphism from CH^r(X) tensor Q to the correspondences of degree r from the spectrum of k to X under which pushforward corresponds to composition. Consequently composition is compatible with the action on cycles: the pullback by a composite is the composite of the pullbacks in the opposite order, and the pushforward by a composite is the composite of the pushforwards.

**Hypotheses.**

- X, Y, Z and W are smooth projective over k.
- All cycle classes are rational.

**Construction, or proof, in steps.**

1. Prove bilinearity from linearity of the three operations that make up the composition.
2. For associativity, expand both bracketings on the fourfold product X times Y times Z times W and reduce them to the same pushforward of one triple intersection product.
3. The four identities used are: flat pullback against proper pushforward in a fibre square; the intersection product commutes with the Gysin map of a flat projection; the projection formula for the projection from the fourfold to the threefold product; and functoriality of proper pushforward. These are the four Chow-homology facts this roadmap imports rather than proves.
4. Conclude associativity from associativity of the intersection product.
5. Identify the correspondence groups into and out of the spectrum of k with Chow groups, by tracking codimension and dimension.
6. Deduce the compatibility with the action on cycles by combining the three previous points.

**Acceptance.**

- Associativity is an equality of correspondences of degree r + s + t, not merely of their actions on cycles.
- Pullback by a composite equals the pullback by the first factor after the pullback by the second, and pushforward composes in the same order as the correspondences.
- The two identifications with Chow groups are inverse to the two descriptions of degree in the definition of a correspondence.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`
- `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FG0, parts (1) to (4), with its proof.

  > (1) composition of correspondences is Q-bilinear and associative, (2) there is a canonical isomorphism CH_{-r}(X) tensor Q = Corr^r(X, Spec(k)) under which pullback corresponds to composition, (3) there is a canonical isomorphism CH^r(X) tensor Q = Corr^r(Spec(k), X) such that pushforward corresponds to composition, (4) composition is compatible with pushforward and pullback of cycles.

  The node is the lemma verbatim, with its four parts kept separate and the four imported Chow-homology identities named in the proof steps because the source's proof cites them by name.

#### `graph-correspondence` — The graph of a morphism as a correspondence of degree zero

*construction.* **Planet:** *Graph of a morphism*.

**Statement.** Let f be a morphism from Y to X of smooth projective schemes over k and let the graph of f be the image of the closed immersion (f, identity) from Y into X times Y. Then the intersection of the graph with X_d times Y has pure codimension d for every d, so the class of the graph is a correspondence of degree zero from X to Y.

**Hypotheses.**

- f is a morphism of smooth projective schemes over k, from Y to X.
- X is decomposed into its equidimensional parts X_d.

**Construction, or proof, in steps.**

1. Show that (f, identity) is a closed immersion, since its composite with the second projection is the identity.
2. Compute the dimension of the graph over each part: the intersection of the graph with X_d times Y is isomorphic to the preimage of X_d in Y, of dimension equal to that of that preimage, so its codimension in X_d times Y is d.
3. Conclude that the class of the graph lies in CH^d(X_d times Y) tensor Q for each d, that is, in degree zero.

**Acceptance.**

- The degree is zero for every f, independently of the dimensions of X and Y.
- For f the identity the graph is the diagonal.
- The construction is compatible with composition in the reverse order, which is the content of the functoriality statement.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Corr.graph` | constructor | The correspondence of degree zero from X to Y attached to a morphism f from Y to X. |
| `Corr.graph_id` | simp | The graph of the identity of X is the class of the diagonal of X. |
| `Corr.graph_comp` | functoriality | The graph of a composite is the composite of the graphs, in the opposite order. |
| `Corr.graph_degree` | projection | The graph of a morphism has degree zero. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.0/correspondence-functor`: the graph construction is the action on morphisms of the contravariant functor into correspondences
- `MotivesAndAlgebraicCycles:MC.1/motive-functor-h`: the motive functor sends a morphism to the class of its graph

**Unit tests.** A plausible wrong definition fails one of these.

- `graph_of_identity`: The graph of the identity is the diagonal class, which is the unit for composition.
- `graph_of_a_rational_point`: For a rational point x of X, viewed as a morphism from the spectrum of k to X, the graph is the class of x in CH^0 of the point times X after the identification; composing it with the structure morphism recovers the projector of the point.
- `contravariance`: The graph of the composite g after f is the composite of the graph of f with the graph of g in the opposite order. A covariant convention fails this.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/correspondence-group`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Example 0FG1.

  > Let f : Y to X be a morphism of smooth projective schemes over k. Denote Gamma_f in X times Y the graph of f, the image of the closed immersion (f, id_Y). Then Gamma_f intersected with X_d times Y has pure codimension d. Hence the class of Gamma_f is contained in Corr^0(X times Y), that is, it is a correspondence of degree 0 from X to Y.

  The node is that example, with the codimension computation made a proof step.

#### `category-of-correspondences` — The graded category of correspondences

*construction.* **Planet:** *Category of correspondences*.

**Statement.** Smooth projective schemes over k, with the groups of correspondences as graded morphism spaces and the composition above, form a graded category over Q. The identity of X is the class of the diagonal of X, which is the graph of the identity morphism.

**Hypotheses.**

- k is a field.
- Objects are smooth projective schemes over k; morphism spaces are the graded correspondence groups.

**Construction, or proof, in steps.**

1. Take bilinearity and associativity of composition from the composition lemma.
2. For the identity, prove that composing the class of the diagonal with an arbitrary correspondence gives back that correspondence. Reduce to the class of an integral closed subscheme Z of X times Y, then to X and Y integral.
3. Identify the image of Z under the map (diagonal, identity) with the scheme theoretic intersection of the diagonal times Y with X times Z inside X times X times Y, check that the dimensions add up to a proper intersection and that the generic point has Cohen-Macaulay local rings, and apply the proper intersection formula to identify the intersection product with the class of that image.
4. Push forward along the projection to X times Y, which maps that image isomorphically to Z, and conclude.
5. Repeat on the other side.

**Acceptance.**

- The diagonal class is a two-sided identity, not only an identity on the action on cycles.
- Composition is associative and bilinear, so the data is a graded category over Q.
- The morphism spaces in each degree are Q-vector spaces and the composition respects the grading additively.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `CorrCat` | data | The graded category over Q whose objects are smooth projective schemes over k and whose morphisms of degree r are the correspondences of degree r. |
| `CorrCat.id_eq_diagonal` | characterisation | The identity of X in this category is the class of the diagonal. |
| `CorrCat.linear` | instance | Each morphism space is a Q-vector space and composition is Q-bilinear. |
| `CorrCat.degree_zero_subcategory` | structure | The degree zero part is an ordinary Q-linear category, the one the motive functor factors through. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/chow-motive`: motives are built from the degree zero part of this category by splitting idempotents and adding a twist
- `MotivesAndAlgebraicCycles:MC.1/motives-universal-property`: the universal property is stated for functors out of the degree zero part of this category

**Unit tests.** A plausible wrong definition fails one of these.

- `diagonal_is_identity`: The diagonal class composed with any correspondence on either side returns it.
- `endomorphisms_of_the_point`: The degree zero endomorphisms of the spectrum of k form Q.
- `endomorphisms_of_the_line`: The degree zero endomorphisms of the projective line form the product of two copies of Q, with the two orthogonal projectors as the idempotents.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/composition-associative`
- `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`
- `mathlib:CategoryTheory.Preadditive`
- `mathlib:CategoryTheory.Linear`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FG2 with its proof.

  > Smooth projective schemes over k with correspondences and composition of correspondences as defined above form a graded category over Q. Everything is clear from the construction except for the existence of identity morphisms. Given a smooth projective scheme X consider the class of the diagonal in Corr^0(X, X).

  The node is the lemma, with the source's proof of the identity axiom turned into the five proof steps, including the reduction to integral X and Y and the proper intersection input the source cites.

#### `correspondence-functor` — The contravariant functor from schemes to correspondences

*theorem.*

**Statement.** There is a contravariant functor from the category of smooth projective schemes over k to the degree zero part of the category of correspondences which is the identity on objects and sends a morphism f from Y to X to the class of its graph, a correspondence of degree zero from X to Y.

**Hypotheses.**

- f and g are morphisms of smooth projective schemes over k, with g from Z to Y and f from Y to X.

**Construction, or proof, in steps.**

1. Identities go to identities, because the graph of the identity is the diagonal.
2. For composites, reduce as in the identity axiom to X, Y and Z integral and show that the composite of the two graph classes is the pushforward along the projection to X times Z of the intersection product of the graph of f times Z with X times the graph of g.
3. Identify that intersection scheme theoretically with the image of Z under the map (f after g, g, identity), check the proper intersection hypotheses and apply the proper intersection formula.
4. Push forward along the projection to X times Z and identify the result with the graph of f after g.

**Acceptance.**

- The functor is contravariant: the graph of f after g is the composite of the graph of f with the graph of g in the opposite order.
- It is the identity on objects, so it does not change the indexing of the theory.
- It lands in degree zero.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`
- `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FG3 with its proof.

  > There is a contravariant functor from the category of smooth projective schemes over k to the category of correspondences which is the identity on objects and sends f : Y to X to the element the class of Gamma_f in Corr^0(X, Y).

  The node is the lemma, with the source's proof of functoriality on composites written out in the four steps, including the identification of the scheme theoretic intersection the source performs.

#### `transpose-correspondence` — The transpose of a correspondence

*construction.*

**Statement.** Let X be equidimensional of dimension d and Y equidimensional of dimension e, both smooth projective over k. The isomorphism from X times Y to Y times X switching the factors induces an isomorphism from the correspondences of degree r from X to Y to the correspondences of degree d - e + r from Y to X, called the transpose. It is defined on cycles as well as on cycle classes, and the transpose of the graph of a morphism f from Y to X is the transposed graph.

**Hypotheses.**

- X and Y are smooth projective over k and equidimensional, of dimensions d and e; the transpose is not defined by this formula without equidimensionality.
- r is an integer.

**Construction, or proof, in steps.**

1. Take the isomorphism of schemes switching the two factors and its induced isomorphism on Chow groups.
2. Compute the effect on the grading: a class of codimension d + r on X times Y becomes a class of codimension d + r on Y times X, which is codimension e + (d - e + r), that is, degree d - e + r.
3. Record that the construction is defined on cycles and descends to classes, since the switch is an isomorphism of schemes.
4. Check the effect on graphs.

**Acceptance.**

- The degree shift is d - e + r and not r; for X a surface and Y a curve the transpose of a degree zero correspondence has degree one.
- The transpose is an isomorphism of Q-vector spaces and is an involution up to the degree bookkeeping.
- The transpose of the graph of f is the transposed graph of f.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Corr.transpose` | data | The transpose isomorphism between correspondence groups, with its degree shift. |
| `Corr.transpose_graph` | simp | The transpose of the graph of f is the transposed graph. |
| `Corr.transpose_transpose` | characterisation | Transposing twice is the identity, after the two degree shifts cancel. |
| `Corr.transpose_comp` | compatibility | The transpose of a composite is the composite of the transposes in the opposite order. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.0/graph-acts-as-gysin-and-pushforward`: the transposed graph is what makes the Gysin map and the proper pushforward both available as correspondences
- `MotivesAndAlgebraicCycles:MC.3/trace-formula-for-correspondences`: Jannsen's trace formula pairs a correspondence with the transpose of another

**Unit tests.** A plausible wrong definition fails one of these.

- `transpose_of_the_diagonal`: The transpose of the diagonal class of X is itself.
- `degree_shift_is_real`: For X a surface and Y a curve the transpose of a degree zero correspondence from X to Y has degree one; a transpose that preserves the degree fails this.
- `transpose_involution`: Transposing the transpose of a correspondence returns it.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/correspondence-group`
- `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Remark 0FG4.

  > Assume X is equidimensional of dimension d and Y is equidimensional of dimension e. Then the isomorphism X times Y to Y times X switching the factors determines an isomorphism Corr^r(X, Y) to Corr^{d-e+r}(Y, X), c maps to c transposed, called the transpose. It acts on cycles as well as cycle classes. An example which is sometimes useful is the transpose of the graph of a morphism f : Y to X.

  The node is that remark, with the equidimensionality made an explicit hypothesis since the degree shift is stated only under it.

#### `graph-acts-as-gysin-and-pushforward` — What the graph and the transposed graph do to cycles

*theorem.*

**Statement.** Let f be a morphism from Y to X of smooth projective schemes over k. Pushforward of cycles by the correspondence given by the graph of f agrees with the Gysin map from CH^*(X) to CH^*(Y), and pullback of cycles by that correspondence agrees with the proper pushforward from CH_*(Y) to CH_*(X). If moreover X and Y are equidimensional of dimensions d and e, then pushforward by the transposed graph is the proper pushforward along f and pullback by the transposed graph is the Gysin map.

**Hypotheses.**

- f is a morphism of smooth projective schemes over k.
- For the last two statements X and Y are equidimensional.

**Construction, or proof, in steps.**

1. Expand the pushforward by the graph as the pushforward along the second projection of the product of the graph class with the pullback of the cycle along the first projection.
2. Use that intersecting with the class of a regularly embedded closed subscheme is the pushforward of the Gysin map of that embedding, applied to (f, identity).
3. Use that the Gysin map of a flat morphism is its flat pullback and that Gysin maps compose, together with the identity that the first projection composed with (f, identity) is f.
4. Conclude with functoriality of proper pushforward.
5. Run the same computation for the pullback and, after transposing, for the transposed graph.

**Acceptance.**

- The four statements pair up as stated: the graph gives the Gysin map in one direction and the proper pushforward in the other, and the transposed graph exchanges them.
- For f a closed immersion of a point in the projective line the graph recovers the restriction of a cycle class to the point, and the transposed graph recovers the class of the point.
- Each statement is an equality of maps on Chow groups with rational coefficients.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`
- `MotivesAndAlgebraicCycles:MC.0/transpose-correspondence`
- `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FG5 with its proof.

  > (1) pushforward of cycles by the correspondence [Gamma_f] agrees with the Gysin map f^! from CH^*(X) to CH^*(Y), (2) pullback of cycles by that correspondence agrees with the pushforward map f_* from CH_*(Y) to CH_*(X), (3) if X and Y are equidimensional of dimensions d and e then the transposed graph exchanges the two.

  The node is the lemma with all four assertions, and the proof steps follow the source's computation, naming the three Chow-homology inputs it cites.

#### `tensor-of-correspondences` — The symmetric monoidal structure on correspondences

*construction.*

**Statement.** Define the tensor product of two smooth projective schemes to be their product over k, and the tensor product of a correspondence of degree r from X to Y with a correspondence of degree r' from X' to Y' to be the intersection product on the fourfold product of the pullback of the first along the projection to X times Y with the pullback of the second along the projection to X' times Y'; it is a correspondence of degree r + r' from X times X' to Y times Y'. With the usual associativity constraint of products of schemes and the switch of factors as commutativity constraint this makes the category of correspondences symmetric monoidal with unit the spectrum of k.

**Hypotheses.**

- X, X', Y and Y' are smooth projective over k.
- The four projections from the fourfold product are the ones used, and the pullbacks are flat pullbacks on equidimensional parts.

**Construction, or proof, in steps.**

1. Define the tensor product on objects as the product of schemes and on morphisms by the displayed formula.
2. Check the degree: the product of a class of degree r and one of degree r' has degree r + r'.
3. Check bifunctoriality: the tensor product of composites is the composite of tensor products.
4. Take the associativity constraint from the associativity of products of schemes and the commutativity constraint from the switch of factors, and verify the pentagon and hexagon axioms.
5. Check that the spectrum of k is a unit.

**Acceptance.**

- The unit is the spectrum of k and the tensor product of objects is the product of schemes.
- The tensor product of graphs is the graph of the product morphism.
- The commutativity constraint is the switch, so the structure is symmetric and not merely braided.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Corr.tensorObj` | data | The tensor product of objects, the product of schemes over k. |
| `Corr.tensorHom` | data | The tensor product of two correspondences, of degree the sum of the degrees. |
| `Corr.tensor_graph` | compatibility | The tensor product of two graphs is the graph of the product morphism. |
| `Corr.symmetric` | instance | The switch of factors is a symmetry for this tensor product. |
| `Corr.tensorUnit` | characterisation | The spectrum of k is a unit object. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/motives-monoidal`: the tensor product of motives is defined from this one on the underlying correspondences
- `MotivesAndAlgebraicCycles:MC.2/weil-to-monoidal-functor`: the Kuenneth axiom is the statement that a realisation is monoidal for this structure

**Unit tests.** A plausible wrong definition fails one of these.

- `unit_law`: Tensoring with the spectrum of k is isomorphic to the identity functor.
- `tensor_of_graphs`: The tensor product of the graphs of f and g is the graph of f times g.
- `degree_adds_under_tensor`: The tensor product of a correspondence of degree one and one of degree zero has degree one.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`
- `mathlib:CategoryTheory.MonoidalCategory`
- `mathlib:CategoryTheory.SymmetricCategory`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FFZ, the paragraph after Example 0FG6, and Lemma 0FG7.

  > The category of correspondences is a symmetric monoidal category. We define X tensor Y = X times Y, and a tensor product by the rule (c, c') maps to c tensor c' = pr_{13}^*c . pr_{24}^*c'. As associativity constraint we use the usual associativity constraint on products of schemes. The commutativity constraint will be given by the isomorphism X times Y to Y times X switching the factors.

  The node is that paragraph together with Lemma 0FG7, whose proof the source omits; the verification of the pentagon and hexagon axioms is therefore listed as a proof step of this blueprint and not as something the source carries out.

#### `projective-line-idempotents` — The two orthogonal projectors on the projective line

*lemma.*

**Statement.** Let X be the projective line over k and let x be a k-rational point. Inside the degree zero correspondences from X to X, which are CH^1(X times X) tensor Q, put c_0 the class of x times X and c_2 the class of X times x. Then the class of the diagonal is c_0 + c_2, the four composites satisfy c_0 after c_0 = c_0, c_2 after c_2 = c_2 and both mixed composites vanish, and the algebra of degree zero endomorphisms of X is the product of two copies of Q.

**Hypotheses.**

- k is a field and X is the projective line over k.
- x is a k-rational point of X.

**Construction, or proof, in steps.**

1. Compute CH^1(X times X) tensor Q and exhibit the classes of x times X and X times x as a basis.
2. Write the diagonal in that basis and check that it is the sum of the two classes.
3. Compute the four composites by intersecting on the triple product; the mixed ones are supported in a fibre of too large dimension and vanish, and the pure ones return the same class.
4. Conclude that the two classes are orthogonal idempotents summing to the identity and that the algebra is the product of two copies of Q.

**Acceptance.**

- The diagonal is the sum of the two classes, which is the acceptance test of the layer for projective space.
- The two mixed composites vanish and the two pure ones are idempotent; a computation that returns a nonzero mixed composite has made a dimension error.
- The endomorphism algebra is two-dimensional, not one-dimensional: the projective line is not indecomposable as a correspondence object.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`
- `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Example 0FG6.

  > Let X = P^1_k. Choose a k-rational point x and consider the cycles c_0 = [x times X] and c_2 = [X times x]. A computation shows that 1 = [Delta] = c_0 + c_2 in Corr^0(X, X) and that we have the following rules for composition c_0 after c_0 = c_0, c_0 after c_2 = 0, c_2 after c_0 = 0, c_2 after c_2 = c_2. In other words Corr^0(X, X) = Q times Q as a Q-algebra.

  The node is that example, with the computation the source leaves implicit written out as proof steps.

#### `pointed-curve-idempotents` — The three orthogonal projectors on a pointed smooth projective curve

*lemma.*

**Statement.** Let C be a geometrically irreducible smooth projective curve over k with a k-rational point e. Inside the degree zero correspondences from C to C put p_0 the class of e times C and p_2 the class of C times e. Then p_0 and p_2 are orthogonal idempotents, p_1 defined as the class of the diagonal minus p_0 minus p_2 is an idempotent orthogonal to both, and the three sum to the class of the diagonal.

**Hypotheses.**

- k is a field, C is a geometrically irreducible smooth projective curve over k and e is a k-rational point of C.
- Degree zero correspondences from C to C are CH^1(C times C) tensor Q.

**Construction, or proof, in steps.**

1. Identify p_0 with the composite of the graph of the structure morphism from C to the spectrum of k with the graph of the point e, and p_2 with the transpose of that composite, using the description of composition through the triple product.
2. Compute the four composites among p_0 and p_2 exactly as for the projective line: each mixed composite is a pushforward from a fibre of dimension one to a point class of the wrong dimension and vanishes, and each pure composite returns the same class because the point is rational and the degree of e is one.
3. Define p_1 as the class of the diagonal minus p_0 minus p_2 and check idempotence and orthogonality from the previous step, using that the class of the diagonal is the identity.
4. Record that the three classes sum to the class of the diagonal by construction, so that they are a complete orthogonal family.

**Acceptance.**

- The three classes are orthogonal idempotents summing to the identity, which is the layer's acceptance test for a pointed curve.
- p_1 is not zero unless the curve has genus zero; for the projective line with e the chosen point p_1 vanishes and the family reduces to the two projectors of the previous node.
- The construction depends on the chosen rational point: a different point changes p_0 and p_2, and it changes p_1 by a correspondence that is not in general zero.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/projective-line-idempotents`
- `MotivesAndAlgebraicCycles:MC.0/composition-associative`
- `MotivesAndAlgebraicCycles:MC.0/graph-correspondence`
- `MotivesAndAlgebraicCycles:MC.0/transpose-correspondence`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Example 0FG6 together with Lemma 0FG0 and Lemma 0FG3.

  > A computation shows that 1 = [Delta] = c_0 + c_2 in Corr^0(X, X) and that we have the following rules for composition c_0 after c_0 = c_0, c_0 after c_2 = 0, c_2 after c_0 = 0, c_2 after c_2 = c_2.

  The node is the same computation with the projective line and its chosen point replaced by a pointed geometrically irreducible curve. Only the first two projectors are claimed to be given by the source's formula; the third is defined as the complement, and the source is cited for the composition rules and for the fact that the diagonal is the identity, which are the two inputs the computation uses. The source does not state the curve case, and the blueprint does not claim it does.

#### `adequate-equivalence-relation` — Adequate equivalence relations on algebraic cycles

*definition.* **Planet:** *Adequate equivalence relation*.

**Statement.** Fix a field F of characteristic zero. An adequate equivalence relation on F-linear algebraic cycles on smooth projective varieties over k is an equivalence relation, compatible with the F-linear structure, for which pullback, pushforward and intersection of cycles are all well defined on the quotient. For such a relation and a variety X write A^j(X) for the F-vector space of F-linear cycles of codimension j on X modulo the relation. Rational equivalence is the finest adequate equivalence relation and numerical equivalence is the coarsest.

**Hypotheses.**

- k is a field and F a field of characteristic zero.
- Varieties means smooth projective varieties over k throughout.
- The relation is required to make pullback, pushforward and intersection well defined; without that requirement the quotient carries no composition law.

**Construction, or proof, in steps.**

1. Record the three conditions that make a relation adequate, each as the statement that a given operation on cycles descends to the quotient.
2. Define A^j(X) as the quotient F-vector space and record that the composition law of correspondences, written with A in place of the rational Chow groups, is again associative.
3. Record that rational equivalence is adequate and is the finest such relation, and that numerical equivalence is adequate and is the coarsest.
4. Record that the construction of correspondences, of the composition law and of the category of motives goes through verbatim with A in place of the rational Chow groups; this is the parametrisation Jannsen's theorem quantifies over.

**Acceptance.**

- The three closure conditions are part of the definition and not consequences; a relation for which the intersection product does not descend gives no composition law.
- Rational equivalence and numerical equivalence are both adequate, and every adequate relation lies between them.
- The coefficient field F is a parameter: A^j(X, F) for different F are different groups and the theory is not silently identified across them.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Adequate` | data | The predicate on an equivalence relation on F-linear cycles that pullback, pushforward and intersection descend. |
| `Adequate.cycles` | data | The quotient A^j(X, F) for an adequate relation. |
| `Adequate.comp` | structure | The composition law on correspondences modulo an adequate relation, and its associativity. |
| `Adequate.rat_finest` | characterisation | Rational equivalence is adequate and refines every adequate relation. |
| `Adequate.num_coarsest` | characterisation | Numerical equivalence is adequate and is refined by every adequate relation. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation`: the category of motives is formed for an arbitrary adequate relation, which is the generality Jannsen's theorem needs
- `MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity`: the theorem quantifies over adequate relations and singles out numerical equivalence among them

**Unit tests.** A plausible wrong definition fails one of these.

- `rational_is_adequate`: Rational equivalence satisfies the three closure conditions, so the rational Chow groups are an instance.
- `numerical_is_adequate`: Numerical equivalence satisfies the three closure conditions.
- `equality_is_not_adequate`: Equality of cycles is not an adequate relation: the intersection product is not defined on cycles that do not meet properly, so the third condition fails. A definition that only asks for an F-linear equivalence relation admits this non-example.
- `between_the_extremes`: Every adequate relation is coarser than rational and finer than numerical equivalence.

**Prerequisites.**

- `SchemeAndStackFoundations:SF.5`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 447, the second paragraph.

  > Fix a field F of characteristic zero, and an adequate equivalence relation on F-linear algebraic cycles (in short, pull-back, push-forward and intersection of cycles is always well defined modulo the relation). For a variety X and an integer j at least 0, denote by A^j(X) = A^j(X, F) the group of F-linear algebraic cycles of codimension j on X modulo the relation.

  The node is that paragraph, with the three closure conditions listed separately and the coefficient field kept explicit, as the source does when it writes A^j(X, F).

- MILNE.MOT — James S. Milne, *Motives - Grothendieck's Dream*, the section on rational and numerical equivalence.

  > Rational equivalence is the finest equivalence relation on algebraic cycles giving a well defined map on equivalence classes and satisfying certain natural conditions. The coarsest such equivalence relation is numerical equivalence.

  This is cited for the two extreme cases, which Jannsen states only in passing as the remark that numerical equivalence is the coarsest adequate equivalence relation.

#### `numerical-equivalence` — Numerical equivalence

*definition.* **Planet:** *Numerical equivalence*.

**Statement.** Two algebraic cycles on a smooth projective variety X are numerically equivalent if the intersection number of their difference with every algebraic cycle of complementary dimension, for which the intersection number is defined, is zero. The quotient of the cycles by this relation is a graded ring, a quotient of the Chow ring, and it is an adequate equivalence relation.

**Hypotheses.**

- X is a smooth projective variety over k.
- Intersection numbers are taken as the degree of a zero cycle, so the test cycles run over complementary dimension.
- Coefficients are F-linear as in the adequate relation definition.

**Construction, or proof, in steps.**

1. Define the pairing between cycles of complementary dimension as the degree of the intersection product, using the degree map on zero cycles.
2. Define the relation as vanishing of that pairing against all complementary test cycles, and check it is an F-linear equivalence relation.
3. Check that the pairing descends, so that the quotient is a graded ring and a quotient of the Chow ring.
4. Record that the relation is adequate and that it is the coarsest adequate relation.

**Acceptance.**

- The test is against all complementary cycles, not against a chosen realisation: equality of cohomology classes is a different and finer relation.
- The quotient is a ring, so numerical equivalence is compatible with the intersection product.
- On a smooth projective curve numerical equivalence of zero cycles is equality of degrees.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `NumEquiv` | data | The numerical equivalence relation on cycles of a smooth projective variety. |
| `NumEquiv.pairing` | data | The intersection number pairing between complementary dimensions that defines it. |
| `NumEquiv.ring` | structure | The quotient ring modulo numerical equivalence, with the induced product. |
| `NumEquiv.of_hom` | relation | Homological equivalence with respect to any Weil cohomology implies numerical equivalence. |
| `NumEquiv.adequate` | characterisation | Numerical equivalence is adequate and is the coarsest adequate relation. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity`: the theorem singles out this relation as the unique adequate one making the motives semisimple abelian
- `MotivesAndAlgebraicCycles:MC.7/conjecture-D`: Conjecture D is the converse implication, that numerical equivalence implies homological equivalence

**Unit tests.** A plausible wrong definition fails one of these.

- `curve_zero_cycles`: On a smooth projective curve two zero cycles are numerically equivalent exactly when they have the same degree.
- `all_complements`: A cycle that pairs to zero with one complementary cycle need not be numerically trivial: the test quantifies over all of them. On the product of two elliptic curves a single test cycle does not suffice.
- `not_rational_equivalence`: On an elliptic curve the difference of two distinct rational points is numerically trivial and not rationally trivial, so numerical equivalence is strictly coarser.
- `ring_structure`: The product of a numerically trivial class with any class is numerically trivial.

**Prerequisites.**

- `SchemeAndStackFoundations:SF.5`
- `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation`

**Sources.**

- MILNE.MOT — James S. Milne, *Motives - Grothendieck's Dream*, the section on rational and numerical equivalence.

  > The coarsest such equivalence relation is numerical equivalence: two algebraic cycles are numerically equivalent if the intersection numbers with all algebraic cycles of complementary dimension for which the intersection numbers are defined agree. The numerical equivalence classes of algebraic cycles form a ring which is a quotient of the Chow ring.

  The node is that definition together with the assertion that the quotient is a ring, both stated there; the adequacy is cited to the same source and to Jannsen page 447.

#### `homological-equivalence` — Homological equivalence relative to a chosen Weil cohomology

*definition.*

**Statement.** Fix data (D1) and (D2) of a Weil cohomology theory, that is, a contravariant functor to graded commutative F-algebras together with cycle class maps. A cycle is homologically trivial if its cycle class vanishes. The resulting relation depends on the chosen theory and is written with that theory named; it is adequate, it is coarser than rational equivalence, and it is finer than or equal to numerical equivalence.

**Hypotheses.**

- A classical Weil cohomology theory, or at least its data (D1) and (D2) together with the compatibilities (C), has been fixed.
- X is a smooth projective variety over the algebraically closed base field of that theory.
- The coefficient field F of the theory is an F-algebra for the coefficients of the cycle groups, as Jannsen's proof requires.

**Construction, or proof, in steps.**

1. Define the relation as the kernel of the cycle class map in each codimension.
2. Check that it is adequate: the compatibilities (C)(a), (C)(b) and (C)(c) say exactly that pullback, pushforward and intersection descend.
3. Prove that homological triviality implies numerical triviality, by writing the intersection number as the trace of a cup product of cycle classes and using that one factor is zero.
4. Record that the relation is attached to the chosen theory, and that two theories may give different relations as long as Conjecture D is open.

**Acceptance.**

- The relation is a function of the chosen Weil cohomology theory and is written with it; an unqualified phrase homological equivalence is not well formed.
- Homological triviality implies numerical triviality, with the proof passing through the degree computation of the layer above.
- The converse implication is Conjecture D and is not available.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `HomEquiv` | data | The homological equivalence relation attached to a chosen Weil cohomology theory. |
| `HomEquiv.adequate` | characterisation | It is an adequate equivalence relation, the three conditions coming from axiom (C). |
| `HomEquiv.le_num` | relation | Homological triviality implies numerical triviality. |
| `HomEquiv.depends_on_theory` | structure | The relation is a function of the theory, recorded as an explicit argument. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.3/radical-of-homological-correspondences`: Corollary 1 compares the correspondence algebras modulo homological and modulo numerical equivalence
- `MotivesAndAlgebraicCycles:MC.7/conjecture-D`: the conjecture is the statement that the two relations agree

**Unit tests.** A plausible wrong definition fails one of these.

- `implies_numerical`: A homologically trivial cycle is numerically trivial.
- `theory_is_an_argument`: The relation takes the Weil cohomology theory as an argument; two theories give two relations, and no lemma identifies them.
- `divisors_on_a_curve`: On a smooth projective curve a divisor of degree zero is homologically trivial for a theory whose H^2 is one-dimensional with the degree as trace.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/weil-cohomology-data`
- `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`
- `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 448, the proof of the implication from (c) to (b).

  > Let the relation be numerical equivalence, and fix a Weil cohomology X to H(X), for example the one given by the etale cohomology groups. Denote the corresponding homological equivalence by the second relation, and the cycle groups modulo it by B^s(X).

  The node is the notion Jannsen introduces there, made a definition in its own right, with the dependence on the chosen theory recorded as a hypothesis because the source fixes a theory before using the word.

- MILNE.MOT — James S. Milne, *Motives - Grothendieck's Dream*, the paragraph stating Conjecture D.

  > Conjecture D. If an algebraic cycle is numerically equivalent to zero, then its cohomology class is zero.

  Cited for the direction that is open: the definition records that only one of the two implications between homological and numerical equivalence is a theorem.

---

## MC.1 Pure motives and Tate objects

**Coverage: source_decomposed.** Pure motives, from the same chapter: the triples (X, p, m) with the two-sided cut morphism groups, the Q-linear Karoubian additive category, the motive functor h, the symmetric monoidal structure, the Tate twist, the identification of the Lefschetz motive with the inverse twist, the decomposition of the motive of the projective line, the universal property, duality for an equidimensional scheme and rigidity in general, the Chow groups of a motive with their representability by twisted units, Manin's identity principle, the projective bundle formula with the explicit correspondences realising it and the class of the diagonal of a projective bundle. The same construction modulo an arbitrary adequate relation, which is what the semisimplicity layer quantifies over, is taken from Jannsen.

A Chow motive is a triple: a smooth projective scheme, an idempotent correspondence of degree
zero, and an integer. The first two slots are the Karoubi envelope of the degree zero part of the category of
correspondences, which Mathlib has as `CategoryTheory.Idempotents.Karoubi`; the third is a formal twist that
has no counterpart in the pinned libraries and is what makes the Lefschetz object invertible.

The layer builds the category, proves that it is additive, Karoubian, symmetric monoidal and rigid, computes
the motive of the projective line and of a projective bundle, and proves the universal property that makes it
the receptacle every realisation factors through. Two computations are the acceptance tests: the projectors on
the projective line, which split its motive into the unit and a twist of the unit, and the projectors on a
pointed curve, which split its motive into three pieces.

The same construction modulo an arbitrary adequate equivalence relation is also planned here, because that is
the generality the semisimplicity layer quantifies over. Rigidity holds for every adequate relation, so
rigidity is not what distinguishes numerical equivalence; MC.3 says what does.

**Planets of this layer** (6): *Chow motive*, *The motive functor h*, *Tate twist*, *Lefschetz motive*, *Duality for motives*, *Projective bundle formula*.

### Nodes (18)

#### `chow-motive` — Chow motives over k

*definition.* **Planet:** *Chow motive*.

**Statement.** A Chow motive over k is a triple consisting of a smooth projective scheme X over k, an idempotent p in the degree zero correspondences from X to X, and an integer m. A morphism from (X, p, m) to (Y, q, n) is an element of the subgroup q composed with the correspondences of degree n - m from X to Y composed with p, inside those correspondences. Composition is the composition of correspondences.

**Hypotheses.**

- X and Y are smooth projective schemes over k.
- p and q are idempotent for the composition of correspondences.
- m and n are integers; the convention is contravariant, so that the motive functor sends a morphism to the class of its graph.

**Construction, or proof, in steps.**

1. Take the degree zero part of the category of correspondences and its idempotents.
2. Define the objects as triples and the morphism groups as the displayed two-sided cut.
3. Check that the cut is closed under the composition of correspondences and that the degree adds up: a morphism from (X, p, m) to (Y, q, n) followed by one to (Z, r, l) has degree l - m.
4. Check that the class of p is the identity of (X, p, m).
5. Record that the first two slots are the Karoubi envelope of the degree zero category and the third is a formal twist.

**Acceptance.**

- Morphisms are cut on both sides: an element of the correspondences of degree n - m that is not fixed by q on the left and p on the right is not a morphism.
- The degree of a morphism is n - m, so twisting shifts degrees and the identity of a twisted object is still p.
- For p and q the identities and m = n = 0 the morphisms are the degree zero correspondences, so the category of correspondences embeds.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Motive` | data | The type of Chow motives over k: a smooth projective scheme, an idempotent correspondence of degree zero, and an integer. |
| `Motive.Hom` | data | The morphism group, the two-sided cut of the correspondences of degree n - m. |
| `Motive.id` | constructor | The identity of (X, p, m) is p. |
| `Motive.comp` | structure | Composition of morphisms, inherited from composition of correspondences. |
| `Motive.mem_hom_iff` | characterisation | A correspondence of degree n - m is a morphism exactly when it is fixed by q on the left and by p on the right. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/motives-karoubian`: the Karoubian property is proved by exhibiting the kernel of a projector as a motive of this shape
- `MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity`: the theorem is about this category, formed with an arbitrary adequate relation
- `MotivesAndAlgebraicCycles:MC.4/chow-motives-into-geometric-motives`: the comparison functor is defined on these triples

**Unit tests.** A plausible wrong definition fails one of these.

- `unit_motive`: The triple with X the spectrum of k, p the identity and m zero is a unit for the tensor product, and its endomorphism ring is Q.
- `twist_changes_degree`: A morphism from (X, p, 0) to (X, p, 1) is a correspondence of degree one, not of degree zero; a definition ignoring m fails this.
- `two_sided_cut`: For X the projective line, p the projector of a point and q the complementary projector, the morphism group from (X, p, 0) to (X, q, 0) is zero, although the ambient correspondence group is two-dimensional.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/category-of-correspondences`
- `MotivesAndAlgebraicCycles:MC.0/composition-associative`
- `mathlib:CategoryTheory.Idempotents.Karoubi`
- `mathlib:CategoryTheory.Idempotents.Karoubi.Hom`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FG9, the definition of a motive and of a morphism of motives.

  > A motive or a Chow motive over k will be a triple (X, p, m) where X is a smooth projective scheme over k, p in Corr^0(X, X) satisfies p composed with p = p, and m is an integer. We define a morphism of motives to be an element of Hom((X, p, m), (Y, q, n)) = q composed with Corr^{n-m}(X, Y) composed with p, inside Corr^{n-m}(X, Y).

  The node is that definition, with the closure of the cut under composition made a proof step and the relation to the Karoubi envelope recorded.

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 447, the definition of M_k.

  > Objects of M_k are triples (X, p, m), where X is a variety, p in A^{dim X}(X times X) is a projector, and m is an integer. The morphism sets are defined by putting Hom((X, p, m), (Y, q, n)) = q A^{dim(X)-m+n}(X times Y) p.

  Cited for the same definition with an arbitrary adequate equivalence relation in place of rational equivalence, which is the form the semisimplicity layer uses; the two agree when the relation is rational equivalence.

#### `motives-category` — Motives form a Q-linear category

*construction.*

**Statement.** The motives over k with the morphism groups above form a Q-linear category, written M_k.

**Hypotheses.**

- The composition of correspondences is bilinear and associative and the diagonal classes are identities.

**Construction, or proof, in steps.**

1. Check that each morphism group is a Q-vector space, being a two-sided cut of one.
2. Check that composition is Q-bilinear.
3. Check that the class of p is a two-sided identity for (X, p, m).
4. Conclude that the data is a Q-linear category.

**Acceptance.**

- Morphism groups are Q-vector spaces and composition is bilinear.
- The identity of (X, p, m) is p, not the class of the diagonal of X unless p is that class.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `MotiveCat` | data | The Q-linear category of motives over k. |
| `MotiveCat.hom_vectorSpace` | instance | Each morphism group is a Q-vector space. |
| `MotiveCat.comp_bilinear` | structure | Composition is Q-bilinear. |
| `MotiveCat.id_eq_projector` | characterisation | The identity of (X, p, m) is p. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/motive-functor-h`: the motive functor lands in this category
- `MotivesAndAlgebraicCycles:MC.1/motives-karoubian`: the splitting of idempotents is a statement about this category

**Unit tests.** A plausible wrong definition fails one of these.

- `identity_is_the_projector`: The identity of (X, p, m) is p and not the class of the diagonal of X unless p is that class.
- `hom_is_a_vector_space`: Morphism groups are Q-vector spaces, so a motive can be multiplied by a rational scalar.
- `composition_bilinear`: Composition is bilinear in both arguments.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/chow-motive`
- `mathlib:CategoryTheory.Linear`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGA with its proof.

  > The category M_k whose objects are motives over k and morphisms are morphisms of motives over k is a Q-linear category.

  The node is the first assertion of that lemma; the second, the functor h, is the next node.

#### `motive-functor-h` — The motive of a smooth projective scheme

*construction.* **Planet:** *The motive functor h*.

**Statement.** There is a contravariant functor h from the category of smooth projective schemes over k to the category of motives, defined on objects by sending X to the triple (X, the class of the diagonal, 0) and on a morphism f by the class of its graph. It sends disjoint unions to direct sums and products to tensor products.

**Hypotheses.**

- X is a smooth projective scheme over k and f a morphism of such.

**Construction, or proof, in steps.**

1. Take the contravariant functor into correspondences and compose with the inclusion of the degree zero category into motives that sends X to the triple with the diagonal projector and zero twist.
2. Check that the graph of f, which has degree zero, is a morphism of motives between the corresponding triples, since it is already fixed by both diagonals.
3. Check functoriality, which is the functoriality of graphs.
4. Check that disjoint unions go to direct sums and products to tensor products, from the corresponding statements about correspondences.

**Acceptance.**

- The functor is contravariant, and is the identity on the underlying scheme.
- It sends the product of two schemes to the tensor product of their motives and a disjoint union to a direct sum.
- It is faithful on the degree zero correspondences by construction but is not full onto all motives, since a general motive carries a projector and a twist.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `motive` | data | The motive h(X) of a smooth projective scheme X. |
| `motive.map` | functoriality | The morphism h(f) attached to f, the class of the graph of f. |
| `motive.map_comp` | functoriality | h is contravariant on composites. |
| `motive.tensor` | compatibility | h of a product is the tensor product of the motives. |
| `motive.coprod` | compatibility | h of a disjoint union is the direct sum of the motives. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/h-projective-line`: the decomposition of the motive of the projective line is a statement about h
- `MotivesAndAlgebraicCycles:MC.2/realization-equivalence`: a Weil cohomology theory is recovered as a monoidal functor evaluated on h(X)
- `MotivesAndAlgebraicCycles:MC.4/chow-motives-into-geometric-motives`: the comparison with geometric motives is stated on the images of h

**Unit tests.** A plausible wrong definition fails one of these.

- `h_of_a_point`: h of the spectrum of k is the unit motive and its endomorphism ring is Q.
- `h_of_the_line`: h of the projective line decomposes as the unit plus a twist of the unit.
- `contravariance`: h of the composite g after f is h(f) after h(g); a covariant convention fails this and also breaks the identification of pushforward by a graph with the Gysin map.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motives-category`
- `MotivesAndAlgebraicCycles:MC.0/correspondence-functor`
- `mathlib:CategoryTheory.Idempotents.toKaroubi`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGA, second assertion, with the section's opening paragraph.

  > There is a contravariant functor h from smooth projective schemes over k to M_k defined by h(X) = (X, 1, 0) and h(f) = [Gamma_f]. In this section we construct an additive Karoubian Q-linear category M_k endowed with a symmetric monoidal structure and a contravariant functor h which maps products to tensor products and disjoint unions to direct sums.

  The node is that functor together with the two structural properties the section's opening paragraph states for it.

#### `motives-karoubian` — The category of motives is Karoubian

*theorem.*

**Statement.** Every idempotent endomorphism of a motive splits. Concretely, if a is an idempotent endomorphism of (X, p, m) then the triple (X, a, m) is a motive, a defines a morphism from it to (X, p, m), and this morphism is the kernel of the idempotent given by the identity minus a.

**Hypotheses.**

- (X, p, m) is a motive and a an idempotent endomorphism of it.

**Construction, or proof, in steps.**

1. Note that a is idempotent both as an endomorphism of the motive and as a correspondence, so (X, a, m) is a motive.
2. Use the identity a = p after a after p to see that a defines a morphism from (X, a, m) to (X, p, m).
3. Given b from (Y, q, n) to (X, p, m) with (identity minus a) after b zero, deduce b = a after b and b = b after q, so that b factors through (X, a, m).
4. Conclude that the identity minus a has a kernel, so idempotents split.

**Acceptance.**

- Splitting is by the same scheme X with a different projector; the construction does not enlarge the class of underlying schemes.
- The splitting is functorial in the sense required by the definition of a Karoubian category.
- Applied to the two projectors on the projective line this splits h of the line into two summands.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motives-category`
- `mathlib:CategoryTheory.IsIdempotentComplete`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGB with its proof.

  > The category M_k is Karoubian. Let M = (X, p, m) be a motive and let a be a projector in the endomorphisms of M. Set N = (X, a, m). Since we have a = p after a after a in Corr^0(X, X) we see that a : N to M is a morphism of M_k.

  The node is that lemma with the source's proof written out; the universal property of the kernel is spelled out as the third proof step.

#### `motives-monoidal` — The tensor product of motives

*construction.*

**Statement.** Define the tensor product of (X, p, m) and (Y, q, n) to be (X times Y, p tensor q, m + n), and the tensor product of morphisms by the tensor product of correspondences. With the associativity and commutativity constraints induced from products of schemes this makes the category of motives symmetric monoidal with unit the triple consisting of the spectrum of k, the identity and zero.

**Hypotheses.**

- (X, p, m) and (Y, q, n) are motives and the morphisms are given in the two-sided cut form.
- The tensor product of correspondences is the one constructed on the category of correspondences.

**Construction, or proof, in steps.**

1. Check that the tensor product of two idempotent correspondences is idempotent, so the formula on objects gives a motive.
2. For morphisms, write each as q after c after p and check that the tensor product of the two cut expressions is again in cut form for the tensor product objects.
3. Transport the associativity and commutativity constraints from correspondences.
4. Check the unit laws.

**Acceptance.**

- The twist adds: the tensor product of an m-twist and an n-twist is an (m+n)-twist.
- The unit is the motive of the spectrum of k.
- The structure is symmetric, with the switch of factors as the constraint; this is the constraint Jannsen's corollary later modifies by a sign.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Motive.tensorObj` | data | The tensor product of two motives. |
| `Motive.tensorHom` | data | The tensor product of two morphisms of motives. |
| `Motive.tensorUnit` | characterisation | The unit motive is h of the spectrum of k. |
| `Motive.symmetry` | instance | The switch of factors is a symmetry. |
| `Motive.tensor_twist` | simp | Twists add under tensor product. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/tate-twist`: the Tate twist is tensoring with a twisted unit
- `MotivesAndAlgebraicCycles:MC.1/motives-rigid`: duality is stated for this monoidal structure
- `MotivesAndAlgebraicCycles:MC.3/numerical-motives-tannakian`: the corollary changes this commutativity constraint by a sign and no other datum

**Unit tests.** A plausible wrong definition fails one of these.

- `unit_law`: Tensoring with the unit motive is isomorphic to the identity.
- `twists_add`: The tensor product of the unit twisted by m and the unit twisted by n is the unit twisted by m + n.
- `symmetry_is_the_switch`: The commutativity constraint on h(X) tensor h(Y) is induced by the isomorphism of schemes switching the factors.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/chow-motive`
- `MotivesAndAlgebraicCycles:MC.0/tensor-of-correspondences`
- `mathlib:CategoryTheory.MonoidalCategory`
- `mathlib:CategoryTheory.SymmetricCategory`
- `mathlib:CategoryTheory.BraidedCategory`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FG9, the paragraph defining the tensor functor, and Lemma 0FGC.

  > On objects we use the formula (X, p, m) tensor (Y, q, n) = (X times Y, p tensor q, m + n). The category M_k with tensor product defined as above is symmetric monoidal with the obvious associativity and commutativity constraints and with unit 1 = (Spec(k), 1, 0).

  The node is that construction and lemma; the source omits the details of the verification, so the checks are listed as proof steps of this blueprint.

#### `tate-twist` — The Tate twist and the twisted unit motives

*definition.* **Planet:** *Tate twist*.

**Statement.** For an integer n write 1(n) for the motive consisting of the spectrum of k, the identity and n. Then 1(0) is the unit, 1(n + m) is 1(n) tensor 1(m), and tensoring with 1(1) is an autoequivalence of the category of motives. For a motive M write M(n) for M tensor 1(n); if M is (X, p, m) then M(n) is (X, p, m + n).

**Hypotheses.**

- n and m are integers and M is a motive.

**Construction, or proof, in steps.**

1. Define 1(n) and check the two displayed identities from the definition of the tensor product.
2. Check that tensoring with 1(1) has tensoring with 1(-1) as an inverse up to natural isomorphism, so it is an autoequivalence.
3. Check the formula for M(n) on triples.

**Acceptance.**

- Twisting only changes the third slot of the triple, so the underlying scheme and projector are unchanged.
- Tensoring with 1(1) is invertible, which is what makes the category of motives, unlike the category of effective motives, closed under the twist.
- 1(0) is the unit.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Motive.tate` | data | The twisted unit motive 1(n). |
| `Motive.twist` | data | The twist M(n) of a motive. |
| `Motive.twist_add` | simp | 1(n + m) is 1(n) tensor 1(m), and M(n)(m) is M(n + m). |
| `Motive.twist_equiv` | equivalence | Tensoring with 1(1) is an autoequivalence, with inverse tensoring with 1(-1). |
| `Motive.twist_triple` | projection | The twist of (X, p, m) by n is (X, p, m + n). |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/lefschetz-motive`: the Lefschetz motive is identified with 1(-1)
- `MotivesAndAlgebraicCycles:MC.1/chow-groups-representable`: the Chow group functor in degree i is represented by 1(-i)
- `MotivesAndAlgebraicCycles:MC.2/realization-equivalence`: the normalisation of a realisation is the choice of an isomorphism from F placed in degree minus two to the value on 1(1)

**Unit tests.** A plausible wrong definition fails one of these.

- `twist_zero`: 1(0) is the unit motive.
- `twist_is_invertible`: 1(1) tensor 1(-1) is the unit; a definition of the twist as an endofunctor without an inverse fails this.
- `twist_of_h`: h(X)(n) is the triple (X, diagonal, n), so twisting does not change the underlying scheme.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motives-monoidal`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FG9, the paragraph following Lemma 0FGC.

  > The motives 1(n) = (Spec(k), 1, n) are useful. Observe that 1 = 1(0) and 1(n + m) = 1(n) tensor 1(m). Thus tensoring with 1(1) is an autoequivalence of the category of motives. Given a motive M we sometimes write M(n) = M tensor 1(n). Observe that if M = (X, p, m), then M(n) = (X, p, m + n).

  The node is that paragraph verbatim.

#### `lefschetz-motive` — The Lefschetz motive is the inverse Tate twist

*theorem.* **Planet:** *Lefschetz motive*.

**Statement.** Let X be the projective line with the two orthogonal projectors c_0 and c_2 attached to a rational point. Then (X, c_0, 0) is isomorphic to the unit motive and (X, c_2, 0) is isomorphic to 1(-1). The second is the Lefschetz motive; it is invertible with inverse 1(1), the Tate motive.

**Hypotheses.**

- X is the projective line over k with a chosen rational point x, and c_0 and c_2 are the two projectors.

**Construction, or proof, in steps.**

1. For the first statement, let a be the correspondence attached to the structure morphism from X to the spectrum of k and b the one attached to the point x. Check that b after a is the identity of the point and that a after b is c_0, then check that a and b are morphisms between the two motives and are mutually inverse.
2. For the second statement, let a' be the class of the point x in the correspondences of degree one from the spectrum of k to X and b' the class of X in the correspondences of degree minus one from X to the spectrum of k. Compute that b' after a' is the identity of the point, using that the intersection of the class of x with the class of X is the class of x.
3. Compute the intersection product on X times the point times X to see that a' after b' is c_2.
4. Identify the morphism groups between 1(-1) and (X, c_2, 0) with the cut subgroups and conclude that a' and b' are mutually inverse morphisms.
5. Record the invertibility of the Lefschetz motive and the names in the literature.

**Acceptance.**

- The isomorphism to 1(-1) is with the twist minus one and not plus one; the sign is fixed by the computation of a' after b'.
- The Lefschetz motive is invertible for the tensor product, which is what makes the twist an autoequivalence.
- The unit summand is the image of the projector of a point and the Lefschetz summand is the image of the complementary projector.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/projective-line-idempotents`
- `MotivesAndAlgebraicCycles:MC.1/tate-twist`
- `MotivesAndAlgebraicCycles:MC.1/motive-functor-h`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGD with its proof, and Remark 0FGE.

  > With notation as in Example 0FG6, (1) the motive (X, c_0, 0) is isomorphic to the motive 1 = (Spec(k), 1, 0), (2) the motive (X, c_2, 0) is isomorphic to the motive 1(-1) = (Spec(k), 1, -1). In the literature the motive (X, c_2, 0) is sometimes called the Lefschetz motive. By Lemma 0FGD the Lefschetz motive is isomorphic to 1(-1). Hence the Lefschetz motive is invertible with inverse 1(1).

  The node is that lemma and remark, with the source's two computations kept as separate proof steps because they fix the sign of the twist.

#### `motives-additive` — The category of motives is additive

*theorem.*

**Statement.** The category of motives is additive. For two motives with the same twist a direct sum is given by the disjoint union of the schemes with the sum of the projectors and that twist; for different twists one first replaces the smaller twist by a tensor product with copies of the Lefschetz motive.

**Hypotheses.**

- (Y, p, m) and (Z, q, n) are motives; without loss of generality n is at most m.

**Construction, or proof, in steps.**

1. If m = n, form the disjoint union of Y and Z with the sum of the two projectors and check the biproduct axioms.
2. If n is less than m, rewrite (Z, q, n) as (Z, q, m) tensor a tensor power of 1(-1), replace each factor 1(-1) by (X, c_2, 0) using the identification of the Lefschetz motive, and rewrite the result as a single triple with twist m.
3. Apply the equal-twist case.

**Acceptance.**

- The direct sum of two motives with the same twist is again a motive on the disjoint union, with no new scheme introduced.
- The reduction to equal twists uses the invertibility of the Lefschetz motive and nothing else.
- With the zero motive, given by the empty scheme, this makes the category additive.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/lefschetz-motive`
- `MotivesAndAlgebraicCycles:MC.1/motives-monoidal`
- `mathlib:CategoryTheory.Limits.HasBinaryBiproducts`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGF with its proof.

  > The category M_k is additive. Let (Y, p, m) and (Z, q, n) be motives. If n = m, then a direct sum is given by (Y disjoint union Z, p + q, m). Suppose that n < m. Then we consider (Z, q, n) = (Z, q, m) tensor (Spec(k), 1, -1) tensor ... and use Lemma 0FGD. This reduces us to the case discussed in the first paragraph.

  The node is that lemma with the source's reduction written out.

#### `h-projective-line` — The motive of the projective line

*theorem.*

**Statement.** In the category of motives, h of the projective line is isomorphic to the direct sum of the unit and 1(-1).

**Hypotheses.**

- k is a field and the projective line carries a rational point, which it does over any field.

**Construction, or proof, in steps.**

1. Split h of the line along the two orthogonal projectors, using that idempotents split.
2. Identify the two summands with the unit and 1(-1).
3. Assemble the two identifications into an isomorphism of motives.

**Acceptance.**

- The decomposition has exactly two summands, one of which is a twist of the unit; a decomposition into two copies of the unit is wrong and is detected by any realisation, where the second summand sits in degree two.
- The isomorphism depends on the chosen rational point only up to the identifications already made.
- This is the first computation any implementation of motives should reproduce.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/lefschetz-motive`
- `MotivesAndAlgebraicCycles:MC.1/motives-karoubian`
- `MotivesAndAlgebraicCycles:MC.1/motives-additive`
- `mathlib:CategoryTheory.Idempotents.Karoubi.decomposition`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGG.

  > In M_k we have h(P^1_k) isomorphic to 1 plus 1(-1). This follows from Example 0FG6 and Lemma 0FGD.

  The node is that lemma with the two ingredients of its one-line proof made prerequisites.

#### `motives-universal-property` — The universal property of the category of Chow motives

*theorem.*

**Statement.** Let C be a Q-linear Karoubian symmetric monoidal category. Any Q-linear symmetric monoidal functor from the category whose objects are smooth projective schemes over k and whose morphisms are correspondences of degree zero to C, such that the image of the projector c_2 on the projective line is an invertible object of C, factors uniquely through a symmetric monoidal functor from the category of motives to C.

**Hypotheses.**

- C is Q-linear, Karoubian and symmetric monoidal.
- F is a Q-linear symmetric monoidal functor from the degree zero correspondence category to C.
- The image of c_2 in F of the projective line is invertible; without this the extension to twists does not exist.

**Construction, or proof, in steps.**

1. Write U for the invertible object given by the image of c_2 and extend F to objects by sending (X, p, m) to the image of the projector F(p) tensored with the inverse of U to the m-th power; this uses that C is Karoubian and that U is invertible.
2. Check that this rule is compatible with tensor products on objects.
3. Extend F to morphisms: for equal twists use F directly; for unequal twists compare through the canonical isomorphisms produced by the same replacement of a twist by copies of the Lefschetz object that proves additivity.
4. Check that the two extensions agree and that the result is a symmetric monoidal functor.
5. Check uniqueness, which follows because every motive is a summand of a twist of some h(X).

**Acceptance.**

- The hypothesis is invertibility of the image of c_2 and not of the image of the whole of h of the projective line.
- The factorisation is unique up to canonical isomorphism, which is what makes the category of motives the universal receptacle.
- Applied with C the category of graded vector spaces this is the statement that a Weil cohomology theory is the same as a monoidal functor on motives.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motives-monoidal`
- `MotivesAndAlgebraicCycles:MC.1/motives-karoubian`
- `MotivesAndAlgebraicCycles:MC.1/lefschetz-motive`
- `mathlib:CategoryTheory.Functor.Monoidal`
- `mathlib:CategoryTheory.Functor.Braided`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGH with its proof.

  > Let C be a Q-linear Karoubian symmetric monoidal category. Any Q-linear functor F from smooth projective schemes over k with morphisms correspondences of degree 0 to C of symmetric monoidal categories such that the image of F(c_2) on F(X) is an invertible object, factors uniquely through a functor F : M_k to C of symmetric monoidal categories.

  The node is that lemma; the source omits the verification that the extension is a monoidal functor, so that verification is listed as a proof step of this blueprint rather than as something the source does.

#### `motive-dual` — The motive of an equidimensional scheme is dualisable

*theorem.*

**Statement.** Let X be a smooth projective scheme over k, equidimensional of dimension d. Then h(X)(d) is a left dual of h(X) in the category of motives. The unit and the counit of the duality are both given by the class of the diagonal of X, viewed in the appropriate correspondence groups.

**Hypotheses.**

- X is smooth projective over k and equidimensional of dimension d.

**Construction, or proof, in steps.**

1. Compute the group of morphisms from the unit to h(X) tensor h(X)(d) as CH^d(X times X) and take the class of the diagonal as the unit of the duality.
2. Compute the group of morphisms from h(X)(d) tensor h(X) to the unit as CH_d(X times X) and take the class of the diagonal as the counit.
3. Write both composites in the zig-zag identities as cycles on the fourfold and fivefold products of X, identify each with the class of the small diagonal, and push forward to see that both composites are the class of the diagonal, that is, the identity.

**Acceptance.**

- The dual of h(X) is the d-fold twist of h(X) and not h(X) itself; the twist is what makes the degrees match.
- Both structure maps of the duality are the diagonal class, so the duality is canonical and does not depend on choices.
- For X a point this is the statement that the unit is self dual.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/tate-twist`
- `MotivesAndAlgebraicCycles:MC.1/motives-monoidal`
- `MotivesAndAlgebraicCycles:MC.0/composition-associative`
- `mathlib:CategoryTheory.ExactPairing`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGI with its proof.

  > Let X be a smooth projective scheme over k which is equidimensional of dimension d. Then h(X)(d) is a left dual to h(X) in M_k. We compute Hom(1, h(X) tensor h(X)(d)) = Corr^d(Spec(k), X times X) = CH^d(X times X). Here we have eta = [Delta]. On the other hand Hom(h(X)(d) tensor h(X), 1) = CH_d(X times X) and here we have the class epsilon = [Delta] of the diagonal as well.

  The node is that lemma with its computation of both zig-zag composites, which the source carries out on the fourfold and fivefold products.

#### `motives-rigid` — Every Chow motive has a dual

*theorem.* **Planet:** *Duality for motives*.

**Statement.** Every object of the category of motives has a left dual, so the category is rigid.

**Hypotheses.**

- M is a motive.

**Construction, or proof, in steps.**

1. Write M as a summand of h(X)(m) for the underlying scheme X and twist m.
2. Use that a summand of a dualisable object in a Karoubian category is dualisable.
3. Reduce to h(X), since 1(-m) is a left dual of 1(m) and a tensor product of dualisable objects is dualisable.
4. Decompose X into its irreducible components, reduce to the equidimensional case, and apply the duality for an equidimensional scheme.

**Acceptance.**

- Rigidity holds for every motive, not only for motives of equidimensional schemes.
- The proof passes through Karoubian summands and through the tensor product, both of which must be available.
- The dual of h(X) for X equidimensional of dimension d is h(X)(d).

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motive-dual`
- `MotivesAndAlgebraicCycles:MC.1/motives-karoubian`
- `mathlib:CategoryTheory.LeftRigidCategory`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGJ with its proof.

  > Every object of M_k has a left dual. Let M = (X, p, m) be an object of M_k. Then M is a summand of (X, 1, m) = h(X)(m). It suffices to show that h(X)(m) = h(X) tensor 1(m) has a dual. By construction 1(-m) is a left dual of 1(m). Hence it suffices to show that h(X) has a left dual. Let X be the disjoint union of its irreducible components.

  The node is that lemma with its four reduction steps kept separate.

#### `chow-group-of-motive` — Chow groups of a motive

*definition.*

**Statement.** For a motive (X, p, m) and an integer i define the i-th Chow group of the motive as the image of the projector p acting on CH^{i+m}(X) tensor Q. For X smooth projective this gives back CH^i(X) tensor Q on h(X). A morphism of motives acts by pushforward of cycles, so each Chow group is a functor from motives to Q-vector spaces.

**Hypotheses.**

- (X, p, m) is a motive and i an integer.
- The action of p on cycles is the pushforward by the correspondence p.

**Construction, or proof, in steps.**

1. Define the group as the image of the idempotent p acting on the twisted Chow group.
2. Check that for p the diagonal and m zero this is CH^i(X) tensor Q.
3. Check functoriality: a morphism c from (X, p, m) to (Y, q, n) is a correspondence of degree n - m, so pushforward by c maps CH^{i+m}(X) tensor Q to CH^{i+n}(Y) tensor Q, and the relation c = q after c after p makes it carry the image of p into the image of q.
4. Check compatibility with composition from the composition lemma.

**Acceptance.**

- The index shift by m is part of the definition; dropping it makes the functor disagree with the twist.
- On h(X) the functor returns the rational Chow groups of X.
- The functor is Q-linear and additive in the motive.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Motive.chow` | data | The i-th Chow group of a motive. |
| `Motive.chow_h` | characterisation | On h(X) it is CH^i(X) tensor Q. |
| `Motive.chow_map` | functoriality | A morphism of motives induces a map of Chow groups, by pushforward of cycles. |
| `Motive.chow_twist` | simp | The i-th Chow group of M(n) is the (i + n)-th Chow group of M. |
| `Motive.chow_additive` | compatibility | The functor takes direct sums of motives to direct sums of Q-vector spaces. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.1/chow-groups-representable`: the functor is shown to be represented by a twisted unit
- `MotivesAndAlgebraicCycles:MC.1/manin-identity-principle`: the identity principle tests a morphism on all these groups after tensoring with an arbitrary scheme

**Unit tests.** A plausible wrong definition fails one of these.

- `chow_of_the_unit`: The zeroth Chow group of the unit motive is Q and the others vanish.
- `twist_shifts`: The zeroth Chow group of 1(-i) is Q placed so that it represents the i-th Chow group functor.
- `projector_matters`: For the projective line and the projector of a point the Chow groups of the summand are those of a point, not those of the line.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/chow-motive`
- `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Definition 0FGL and the paragraph after it.

  > Let M = (X, p, m) be a Chow motive over k. For i in Z we define the i-th Chow group of M by the formula CH^i(M) = p(CH^{i+m}(X) tensor Q). We have CH^i(h(X)) = CH^i(X) tensor Q if X is a smooth projective scheme over k. Observe that CH^i(-) is a functor from M_k to Q-vector spaces.

  The node is that definition with the functoriality the source establishes in the following paragraph.

#### `chow-groups-representable` — Chow groups of motives are representable

*theorem.*

**Statement.** For each integer i the functor sending a motive to its i-th Chow group is represented by 1(-i): there is an isomorphism, natural in the motive, between the i-th Chow group of M and the group of morphisms from 1(-i) to M.

**Hypotheses.**

- M is a motive and i an integer.

**Construction, or proof, in steps.**

1. Unfold the morphism group from 1(-i) to (X, p, m): it is the two-sided cut of the correspondences of degree m + i from the spectrum of k to X.
2. Identify the correspondences of degree m + i from the spectrum of k to X with CH^{m+i}(X) tensor Q.
3. Check that cutting by p on the left is exactly taking the image of the projector.
4. Check naturality in M, which is the compatibility of composition with pushforward of cycles.

**Acceptance.**

- The representing object is 1(-i), with the sign as stated.
- The isomorphism is natural, which is what makes it usable in the identity principle.
- For i zero and M the unit the statement returns Q on both sides.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/chow-group-of-motive`
- `MotivesAndAlgebraicCycles:MC.1/tate-twist`
- `MotivesAndAlgebraicCycles:MC.0/composition-associative`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGM.

  > The functor CH^i(-) on the category of motives M_k is representable by 1(-i), that is, we have CH^i(M) = Hom_{M_k}(1(-i), M) functorially in M in M_k. Immediate from the definitions and Lemma 0FG0.

  The node is that lemma, with the unfolding the source calls immediate written out as four proof steps.

#### `manin-identity-principle` — Manin's identity principle

*theorem.*

**Statement.** Let c be a morphism of motives from M to N. If for every smooth projective scheme X over k the morphism c tensor the identity of h(X) induces an isomorphism on all Chow groups, then c is an isomorphism.

**Hypotheses.**

- c is a morphism of motives and the hypothesis is quantified over all smooth projective X over k.

**Construction, or proof, in steps.**

1. Note that every object of the category of motives is a summand of a twist of h(X) for some X, and that the Chow groups of M tensor h(X)(m) are those of M tensor h(X) up to a shift; deduce that the hypothesis holds with h(X) replaced by an arbitrary motive L.
2. Use representability to rewrite the hypothesis as the statement that the map from morphisms out of the unit into M tensor L to the same for N tensor L is bijective for every L.
3. Use that every object has a left dual to convert this into bijectivity of the map from morphisms out of K into M to morphisms out of K into N for every K.
4. Conclude by the Yoneda lemma.

**Acceptance.**

- The hypothesis must be tested after tensoring with every smooth projective X; testing only on the Chow groups of M and N is not enough.
- The conclusion is that c is an isomorphism of motives, not only that it induces isomorphisms on Chow groups.
- The proof uses rigidity, so it does not transfer to a setting where duals are missing.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/chow-groups-representable`
- `MotivesAndAlgebraicCycles:MC.1/motives-rigid`
- `mathlib:CategoryTheory.yoneda`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGN with its proof.

  > Let c : M to N be a morphism of motives. If for every smooth projective scheme X over k the map c tensor 1 : M tensor h(X) to N tensor h(X) induces an isomorphism on Chow groups, then c is an isomorphism.

  The node is that lemma, attributed to Manin in the source, with its four proof steps kept separate; the third uses that every object has a left dual, which is why rigidity is a prerequisite.

#### `projective-bundle-formula` — The projective bundle formula for motives

*theorem.* **Planet:** *Projective bundle formula*.

**Statement.** Let X be a smooth projective scheme over k and E a locally free module of rank r on X, with P the associated projective bundle and p its structure morphism, normalised so that the pushforward of the twisting sheaf of degree one is E. For i from 0 to r - 1 let c_i be the correspondence obtained by capping the class of the graph of p with the i-th power of the first Chern class of the pullback of the twisting sheaf along the second projection, viewed as a morphism from h(X)(-i) to h(P). Then the sum of the c_i is an isomorphism from the direct sum of the h(X)(-i) to h(P).

**Hypotheses.**

- X is smooth projective over k and E is locally free of rank r.
- The projective bundle is the Proj of the symmetric algebra of E, with the normalisation of the twisting sheaf stated.
- The Chern class used is that of the pullback of the twisting sheaf along the second projection.

**Construction, or proof, in steps.**

1. Define the correspondences c_i and check that each has degree i, so that it is a morphism from h(X)(-i) to h(P).
2. Apply the identity principle: it suffices to show that the sum induces isomorphisms on Chow groups after tensoring with an arbitrary smooth projective Z.
3. Observe that the projective bundle over X times Z is the one associated to the pullback of E, so the statement on Chow groups is the projective bundle formula for Chow groups, which this roadmap imports.
4. Identify the action of c_i on cycles with capping with the i-th power of the Chern class after flat pullback along p, using the description of pushforward by a graph.

**Acceptance.**

- The summands are twists h(X)(-i) for i from 0 to r - 1; a formula with r summands untwisted is wrong and fails already for the projective line.
- The isomorphism is given by the explicit correspondences c_i and not merely asserted to exist.
- For E free of rank two over the spectrum of k this recovers the decomposition of the motive of the projective line.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/manin-identity-principle`
- `MotivesAndAlgebraicCycles:MC.0/graph-acts-as-gysin-and-pushforward`
- `MotivesAndAlgebraicCycles:MC.1/tate-twist`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGQ with its proof, and the paragraph of Section 0FGP defining the correspondences c_i.

  > In the situation above, the map the sum over i = 0 to r - 1 of c_i from the direct sum of h(X)(-i) to h(P) is an isomorphism in the category of motives. By Lemma 0FGN it suffices to show that our map defines an isomorphism on Chow groups of motives after taking the product with any smooth projective scheme Z.

  The node is that lemma with the definition of the c_i from the preceding paragraph, including the normalisation of the twisting sheaf, which the source fixes explicitly.

#### `diagonal-of-projective-bundle` — The class of the diagonal of a projective bundle

*lemma.*

**Statement.** With the notation of the projective bundle formula, let S be the kernel of the canonical surjection from the pullback of E to the twisting sheaf of degree one on P. Then the class of the diagonal of P in the Chow groups of P times P is the cap product, with the pullback of the class of the diagonal of X along p times p, of the sum over i from 0 to r - 1 of the binomial coefficient r - 1 choose i times the (r - 1 - i)-th Chern class of the pullback of the dual of S along the first projection times the i-th power of the first Chern class of the pullback of the twisting sheaf along the second projection.

**Hypotheses.**

- The setting is that of the projective bundle formula.
- S is the kernel of the canonical surjection, locally free of rank r - 1.

**Construction, or proof, in steps.**

1. Reduce to the fibre product of P with itself over X, using that the pullback of the diagonal class of X along p times p is the class of that fibre product and that capping with Chern classes commutes with proper pushforward.
2. Consider the composite map from the tensor product of the pullback of S along the first projection with the pullback of the twisting sheaf of degree minus one along the second projection into the structure sheaf, built from the evaluation pairing, and check by a local computation that it vanishes exactly along the diagonal.
3. Conclude that the class of the diagonal inside the fibre product is the top Chern class of the dual of that rank r - 1 module.
4. Expand that top Chern class of a tensor product with a line bundle by the standard formula, which produces the displayed binomial sum.

**Acceptance.**

- The binomial coefficients and the dual of S both appear; a formula without the dual, or with the wrong Chern classes, fails already for r = 2.
- The identity is inside the fibre product before pushing forward, which is where the local computation takes place.
- For r = 1 the bundle is the base and the formula returns the diagonal of X.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/projective-bundle-formula`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGR with its proof.

  > The class of the diagonal of P in CH^*(P times P) can be written as the cap of the sum over i of (r - 1 choose i) c_{r-1-i}(pr_1^* S dual) with c_1(pr_2^* O_P(1))^i, applied to (p times p)^*[Delta_X], where S is the kernel of the canonical surjection p^* E to O_P(1).

  The node is that lemma with the source's proof, whose local computation identifying the vanishing locus of the evaluation map with the diagonal is the step that carries the content.

#### `motives-mod-adequate-relation` — Motives modulo an arbitrary adequate equivalence relation

*construction.*

**Statement.** Fix a field F of characteristic zero and an adequate equivalence relation on F-linear cycles. Repeat the construction of correspondences, composition and motives with the groups A^j in place of the rational Chow groups. The result is an F-linear pseudo-abelian tensor category, written M_k for that relation, with unit the triple consisting of the spectrum of k, the identity and zero, and with internal hom for irreducible X given by the triple consisting of X times Y, the transpose of p tensor q, and dim X - m + n.

**Hypotheses.**

- F is a field of characteristic zero and the relation is adequate.
- Varieties are smooth projective over k.
- The rigidity statement is for the internal hom formula as displayed, and the formula is stated for irreducible X.

**Construction, or proof, in steps.**

1. Check that the composition law of correspondences is defined and associative modulo an adequate relation, which is exactly what adequacy provides.
2. Form the triples and the two-sided cut morphism groups as in the rational case.
3. Check that the category is F-linear and pseudo-abelian, that is, that idempotents split, by the same argument as in the Karoubian case.
4. Check the tensor structure with the constraints induced by the isomorphisms of schemes, and record the unit.
5. Record the internal hom formula and that it makes the category rigid.

**Acceptance.**

- The construction is parametrised by the relation and by F; nothing identifies two different choices.
- Taking rational equivalence returns the category of Chow motives.
- The internal hom formula shows rigidity for every adequate relation, so rigidity is not what distinguishes numerical equivalence.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `MotiveMod` | data | The category of motives modulo a given adequate relation with coefficients in F. |
| `MotiveMod.pseudoAbelian` | instance | Idempotents split. |
| `MotiveMod.tensor` | structure | The tensor structure, with the twist adding. |
| `MotiveMod.internalHom` | characterisation | The internal hom formula, for irreducible underlying schemes. |
| `MotiveMod.of_rat` | compatibility | For rational equivalence the category is the category of Chow motives. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity`: the theorem is a statement about this category as the relation varies
- `MotivesAndAlgebraicCycles:MC.3/numerical-motives-tannakian`: the Tannakian corollary is about the numerical instance

**Unit tests.** A plausible wrong definition fails one of these.

- `rational_case`: For rational equivalence and F equal to Q the construction returns the Chow motives of the layer above.
- `rigid_for_every_relation`: The internal hom formula makes the category rigid for every adequate relation, so rigidity does not single out numerical equivalence.
- `coefficients_matter`: The categories for two different coefficient fields F are different, and no lemma identifies them.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation`
- `MotivesAndAlgebraicCycles:MC.1/chow-motive`
- `MotivesAndAlgebraicCycles:MC.1/motives-karoubian`
- `MotivesAndAlgebraicCycles:MC.1/motives-monoidal`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 447 and page 450, the proof of Corollary 2.

  > M_k is an F-linear, pseudo-abelian category. For every adequate equivalence relation, M_k is an F-linear tensor category, the tensor law being given by (X, p, m) tensor (Y, q, n) = (X times Y, p times q, m + n). Moreover, M_k is rigid, with the internal hom in the case of an irreducible X defined by Hom((X, p, m), (Y, q, n)) = (X times Y, transpose p times q, dim(X) - m + n).

  The node is that construction, taken from the two places in the source where it is set up and then recalled with its tensor structure and internal hom.

---

## MC.2 Realizations and cycle-class compatibility

**Coverage: source_decomposed.** Realisations, in the axiomatic form this roadmap owns: the data (D1), (D2), (D3), the three axioms, the cohomological pushforward with the projection formula, the identification of the trace of a cycle class with the degree, the trace on a product, the Kuenneth decomposition of the class of the diagonal with its sign, the Euler characteristic as a self-intersection, and the equivalence between classical Weil cohomology theories and Q-linear symmetric monoidal functors on motives with two extra conditions. The construction of the Betti, de Rham and etale theories themselves, and the comparison isomorphisms between them, are imported from SchemeAndStackFoundations:SF.2 and SF.6 through requests: this layer plans what a realisation is and what it must satisfy, not the theories. Cycle behaviour under algebraic extensions of the base field is decomposed here as well, since it is what a realisation argument needs when the base field is not algebraically closed.

This layer owns what a realisation **is**, and does not construct one. The distinction matters:
the reviewed audit of `SchemeAndStackFoundations:SF.2` records that neither pinned library has a named étale
cohomology API, constant torsion coefficient sheaves, or any comparison of cohomology across sites, so
building a theory here would duplicate the layer that owns it. What this layer plans is the axiomatics — the
data `(D1)`, `(D2)`, `(D3)` and the axioms `(A)`, `(B)`, `(C)` — together with everything those axioms give:
the cohomological pushforward and its projection formula, the identification of the trace of a cycle class
with the degree of a zero cycle, the Künneth decomposition of the class of the diagonal with its sign, and the
Euler characteristic as a self-intersection number.

The layer ends with the statement that makes the whole roadmap worth building: a classical Weil cohomology
theory is *the same thing as* a `ℚ`-linear symmetric monoidal functor from motives to graded vector spaces,
normalised on `𝟙(1)`, subject to two extra conditions. Those two conditions are exactly the two axioms the
functorial description does not see, and the proposal recorded in the packet's `restructure` list is that the
layer be narrowed to this axiomatic half, with the theories and their comparisons imported.

**Planets of this layer** (5): *Classical Weil cohomology theory*, *Cohomological pushforward*, *Class of the diagonal*, *Euler characteristic of a variety*, *Realisations are monoidal functors*.

### Nodes (11)

#### `weil-cohomology-data` — The data of a Weil cohomology theory

*definition.*

**Statement.** Fix an algebraically closed field k and a field F of characteristic zero. The data of a Weil cohomology theory over k with coefficients in F consists of (D1) a contravariant functor from smooth projective varieties over k to graded commutative F-algebras, written X to H^*(X), with the induced maps called pullback; (D2) for every smooth projective variety X a group homomorphism from CH^i(X) to H^{2i}(X), called the cycle class map; and (D3) for every smooth projective variety X of dimension d a map from H^{2d}(X) to F, called the trace map.

**Hypotheses.**

- k is algebraically closed and F has characteristic zero; both hypotheses are used by the axioms below and neither may be dropped silently.
- Variety means a variety over k in the sense of the source, so in particular irreducible and of a well defined dimension.
- The cycle class map is defined on the integral Chow groups and doubles the degree.

**Construction, or proof, in steps.**

1. Record the three pieces of data with their exact types, including that the target of (D1) is graded commutative F-algebras and not merely graded F-vector spaces.
2. Record that the cycle class map doubles degrees and that the trace map is defined on the top degree only, which is where the dimension of X enters.
3. Record the ambiguity the source flags: for a closed subscheme of a smooth projective subvariety of X the notation for the cycle class is ambiguous between the two ambient varieties, so every use names the ambient variety.

**Acceptance.**

- The data alone is not a Weil cohomology theory; the axioms are separate and are stated in the next node.
- The functor is contravariant and lands in algebras, so cup products are part of the data and not an extra structure.
- The trace map depends on the dimension of X.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `WeilData` | data | The three pieces of data of a Weil cohomology theory over k with coefficients in F. |
| `WeilData.pullback` | functoriality | The pullback along a morphism of smooth projective varieties, an algebra map. |
| `WeilData.cycleClass` | data | The cycle class map in each codimension, doubling degrees. |
| `WeilData.trace` | data | The trace map in top degree. |
| `WeilData.cup` | structure | The cup product, part of the algebra structure of (D1). |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`: the axioms are conditions on exactly this data
- `MotivesAndAlgebraicCycles:MC.0/homological-equivalence`: homological equivalence is the kernel of the cycle class map of a chosen theory, so it needs only (D1) and (D2)

**Unit tests.** A plausible wrong definition fails one of these.

- `degree_doubling`: The cycle class of a codimension i cycle lies in degree 2i; a cycle class map into degree i fails the compatibility with cup products.
- `trace_is_top_degree`: The trace map is defined on H^{2d} for X of dimension d, so it is a different map for varieties of different dimensions.
- `algebra_not_just_space`: Pullback is an algebra homomorphism, so it commutes with cup products; a definition landing in graded vector spaces loses this.

**Prerequisites.**

- `mathlib:DirectSum`
- `mathlib:Module.Finite`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FGS, the list of data (D1), (D2), (D3) with the remarks following it.

  > The data is given by: (D1) A contravariant functor H^* from the category of smooth projective varieties to the category of graded commutative F-algebras. (D2) For every smooth projective variety X a group homomorphism gamma from CH^i(X) to H^{2i}(X). (D3) For every smooth projective variety X of dimension d a map the integral over X from H^{2d}(X) to F.

  The node is that list together with the source's remarks naming pullback, the cycle class map and the trace map, and flagging the ambiguity of the cycle class notation.

#### `classical-weil-cohomology` — Classical Weil cohomology theories

*definition.* **Planet:** *Classical Weil cohomology theory*.

**Statement.** A classical Weil cohomology theory over an algebraically closed field k with coefficients in a field F of characteristic zero is data (D1), (D2), (D3) satisfying: (A) Poincare duality, namely for X of dimension d, finite dimensionality of each H^i(X), perfectness of the pairing from H^i(X) times H^{2d-i}(X) to F given by cup product followed by the trace, vanishing of H^i(X) outside the interval from 0 to 2d, and bijectivity of the trace map; (B) the Kuenneth formula, namely that the map from the tensor product of H^*(X) and H^*(Y) to H^*(X times Y) sending a tensor b to the cup product of the two pullbacks is an isomorphism; and (C) compatibility of cycle classes with Gysin pullback, with proper pushforward, with the intersection product against the cup product, and the normalisation that the trace of the class of the spectrum of k is one.

**Hypotheses.**

- k is algebraically closed and F has characteristic zero.
- The data (D1), (D2), (D3) is fixed.
- Axiom (A) is stated for a variety of dimension d, so the four parts are indexed by that dimension.

**Construction, or proof, in steps.**

1. State the four parts of Poincare duality separately, since the next node's construction of the cohomological pushforward uses only (A)(a) and (A)(b).
2. Define the cohomological pushforward as the contragredient of pullback under the pairing, which is available as soon as (A) holds.
3. State the Kuenneth axiom as an isomorphism, not as an equality of dimensions.
4. State the four parts of (C) separately and record the equivalent form of (C)(c) in terms of exterior products, which is how the classical reference states it.

**Acceptance.**

- All three axioms are required; the data alone does not determine any of them.
- Axiom (C)(d) is a normalisation and fixes the scale of the trace; without it the theory is defined only up to a scalar.
- Given (C)(a), axiom (C)(c) is equivalent to compatibility of cycle classes with exterior products, which is the form used in the classical reference.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `WeilCohomology` | data | The predicate that data (D1), (D2), (D3) satisfies (A), (B) and (C). |
| `WeilCohomology.poincare` | characterisation | The four parts of axiom (A), stated separately. |
| `WeilCohomology.kunneth` | characterisation | The Kuenneth isomorphism. |
| `WeilCohomology.cycle_pullback` | compatibility | Compatibility of cycle classes with the Gysin map. |
| `WeilCohomology.cycle_pushforward` | compatibility | Compatibility of cycle classes with proper pushforward. |
| `WeilCohomology.cycle_product` | compatibility | Cycle classes take the intersection product to the cup product, and the trace of the class of a point is one. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.2/realization-equivalence`: the equivalence with monoidal functors is a statement about this predicate
- `MotivesAndAlgebraicCycles:MC.3/trace-formula-for-correspondences`: Jannsen's trace formula is proved with respect to a fixed such theory
- `MotivesAndAlgebraicCycles:MC.0/homological-equivalence`: the relation is attached to a chosen theory of this kind

**Unit tests.** A plausible wrong definition fails one of these.

- `normalisation`: The trace of the cycle class of the spectrum of k is one; dropping (C)(d) allows an arbitrary rescaling of the whole theory.
- `vanishing_range`: Cohomology vanishes outside degrees 0 to 2d, so a theory with a nonzero H^{-1} is not classical in this sense.
- `kunneth_is_an_isomorphism`: The Kuenneth map is bijective; equality of dimensions in each degree is strictly weaker and is not enough to build the realisation functor.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/weil-cohomology-data`
- `MotivesAndAlgebraicCycles:MC.0/correspondence-group`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Definition 0FGV together with the statements of axioms (A), (B) and (C) in Section 0FGS, and Remark 0FGU.

  > A classical Weil cohomology theory over k with coefficients in F is given by data (D1), (D2), and (D3) satisfying Poincare duality, the Kuenneth formula, and compatibility with cycle classes, more precisely, satisfying (A), (B), and (C).

  The node is that definition with the three axioms written out from the same section, and the remark that (C)(c) is equivalent to compatibility with exterior products recorded as an acceptance point.

#### `weil-pushforward` — Cohomological pushforward and the projection formula

*construction.* **Planet:** *Cohomological pushforward*.

**Statement.** Assume data (D1) and (D3) satisfying axiom (A). For a morphism f from X to Y of smooth projective varieties with X of dimension d and Y of dimension e, define the pushforward from H^{2d-i}(X) to H^{2e-i}(Y) as the contragredient of the pullback under the two Poincare pairings; explicitly, the pushforward of a is characterised by the identity that the trace over X of the cup product of the pullback of b with a equals the trace over Y of the cup product of b with the pushforward of a, for all b. Then the pushforward of the cup product of a pullback with a class is the cup product of that class with the pushforward, and pushforward is functorial in f.

**Hypotheses.**

- Data (D1) and (D3) satisfying (A) is given; axioms (B) and (C) are not used.
- f is a morphism of smooth projective varieties and g a second one, composable with f.

**Construction, or proof, in steps.**

1. Use (A)(a) and (A)(b) to identify H^{2d-i}(X) with the F-dual of H^i(X), and likewise for Y.
2. Define the pushforward as the dual of the pullback under these identifications, and record the characterising identity.
3. Prove the projection formula by testing both sides against an arbitrary class under the pairing on Y and moving everything to X by the characterising identity.
4. Prove functoriality by the same test, using functoriality of pullback.

**Acceptance.**

- The pushforward lowers the cohomological degree by twice the difference of dimensions, as displayed.
- The projection formula and functoriality use only (A) and no other axiom.
- For f the identity the pushforward is the identity.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `WeilCohomology.pushforward` | data | The cohomological pushforward attached to a morphism. |
| `WeilCohomology.pushforward_spec` | characterisation | The characterising identity under the trace pairing. |
| `WeilCohomology.projection_formula` | compatibility | The projection formula. |
| `WeilCohomology.pushforward_comp` | functoriality | Functoriality of pushforward. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.2/cycle-class-degree`: the degree statement compares the trace with the degree of a zero cycle through this pushforward
- `MotivesAndAlgebraicCycles:MC.2/weil-to-monoidal-functor`: the realisation functor sends a correspondence to a map built from pullback, cup product and this pushforward

**Unit tests.** A plausible wrong definition fails one of these.

- `identity_pushforward`: The pushforward along the identity is the identity.
- `degree_shift`: For X a curve mapping to a point the pushforward goes from H^2(X) to H^0 of the point, which is the trace map.
- `projection_formula_holds`: The projection formula holds for every b, which pins the characterising identity; a pushforward defined only up to a scalar fails it.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Section 0FGS, the paragraph defining f_* after axiom (A), and Lemma 0FGT with its proof.

  > Using Poincare duality we can define a pushforward f_* from H^{2d-i}(X) to H^{2e-i}(Y) as the contragredient of f^*. For a in H^{2d-i}(X), the element f_*a is characterised by: the integral over X of f^*b cup a equals the integral over Y of b cup f_*a. Assume given (D1) and (D3) satisfying (A). Then f_*(f^*b cup a) = b cup f_*a, and g_* after f_* = (g after f)_*.

  The node is that construction and lemma, with the source's two short proofs kept as proof steps.

#### `cycle-class-degree` — The trace of a cycle class is the degree

*theorem.*

**Statement.** Let H be a classical Weil cohomology theory and X a smooth projective variety of dimension d. Then the square formed by the cycle class map from CH^d(X) to H^{2d}(X), the identification of CH^d(X) with CH_0(X), the trace map, and the degree map on zero cycles, commutes.

**Hypotheses.**

- H is a classical Weil cohomology theory and X is smooth projective of dimension d.

**Construction, or proof, in steps.**

1. Reduce to the class of a closed point, since CH_0(X) is generated by such classes.
2. For a closed point, factor the class through the structure morphism of the point and use compatibility of cycle classes with proper pushforward.
3. Apply the normalisation (C)(d) and functoriality of the trace under pushforward to identify the trace with the degree.

**Acceptance.**

- The statement identifies two maps into F, the trace of the cycle class and the image of the degree; it is not an inequality or a proportionality.
- It uses the normalisation axiom (C)(d): without it the two maps differ by a fixed scalar.
- For X a point both maps send the class of the point to one.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`
- `MotivesAndAlgebraicCycles:MC.2/weil-pushforward`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGW.

  > Let H^* be a classical Weil cohomology theory. Let X be a smooth projective variety of dimension d. The diagram with CH^d(X) to H^{2d}(X) by gamma, CH^d(X) equal to CH_0(X), the trace from H^{2d}(X) to F and the degree from CH_0(X) to Z commutes, where the degree is the degree of zero cycles.

  The node is that lemma, with the reduction to the class of a closed point made explicit as the first proof step.

#### `trace-of-a-product` — The trace on a product and the projection to a factor

*theorem.*

**Statement.** Let H be a classical Weil cohomology theory and X and Y smooth projective varieties. Then the trace map on X times Y is the tensor product of the trace maps on X and on Y, under the Kuenneth isomorphism. Moreover the pushforward along the second projection sends a class of the form a tensor b to the trace over X of a times b.

**Hypotheses.**

- H is a classical Weil cohomology theory and X and Y are smooth projective varieties.
- Classes on the product are written through the Kuenneth isomorphism.

**Construction, or proof, in steps.**

1. Write the top cohomology of the product through Kuenneth as the tensor product of the top cohomologies, using the vanishing range of axiom (A)(c).
2. Compare the two maps to F on that one-dimensional space and use the normalisation to see that they agree.
3. For the second statement, test the pushforward along the second projection against an arbitrary class on Y under the Poincare pairing, expand using Kuenneth and the first statement, and read off the formula.

**Acceptance.**

- Both statements are equalities of F-linear maps, and both use the Kuenneth isomorphism and not merely a comparison of dimensions.
- The second statement is the computation that makes the realisation of a correspondence come out as the expected formula.
- For Y a point the second statement returns the trace on X.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`
- `MotivesAndAlgebraicCycles:MC.2/weil-pushforward`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemmas 0FGX and 0FGY.

  > Let X and Y be smooth projective varieties. Then the integral over X times Y is the tensor product of the integral over X and the integral over Y. Then pr_{2,*} from H^*(X times Y) to H^*(Y) sends a tensor b to (the integral over X of a) times b.

  The node is those two lemmas, kept together because the second is proved from the first and both are used in the same place, the construction of the realisation functor.

#### `class-of-the-diagonal` — The Kuenneth decomposition of the class of the diagonal

*theorem.* **Planet:** *Class of the diagonal*.

**Statement.** Let H be a classical Weil cohomology theory and X a smooth projective variety of dimension d. Choose a basis of each H^i(X) over F and write the cycle class of the diagonal through the Kuenneth isomorphism as a sum over i and over the basis of tensors of a basis element in degree i with an element in degree 2d - i. Then the trace over X of the cup product of the i-th basis element with the corresponding element in complementary degree is the sign minus one to the i times the Kronecker delta of the two indices.

**Hypotheses.**

- H is a classical Weil cohomology theory and X is smooth projective of dimension d.
- A basis of each H^i(X) has been chosen; the statement is about the elements produced by the Kuenneth expansion of the diagonal class relative to that basis.

**Construction, or proof, in steps.**

1. Expand the cycle class of the diagonal through Kuenneth in the chosen basis and name the complementary elements.
2. Pull back along the diagonal and use that the pullback of the class of the diagonal computes cup products, together with compatibility of cycle classes with the Gysin map.
3. Pair against a basis element using the trace on the product and the formula for the pushforward along the second projection.
4. Read off the stated sign and delta.

**Acceptance.**

- The sign minus one to the i appears; a statement without it is wrong in odd degrees and breaks the computation of the Euler characteristic.
- The elements in complementary degree form the dual basis up to that sign, which is what makes the diagonal the identity correspondence.
- For X a point the statement is that the trace of the class of the point is one.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/trace-of-a-product`
- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGZ.

  > Let X be a smooth projective variety of dimension d. Choose a basis e_{i,j} of H^i(X) over F. Using Kuenneth write gamma([Delta]) as the sum over i and j of e_{i,j} tensor e'_{2d-i,j} with e'_{2d-i,j} in H^{2d-i}(X). Then the integral over X of e_{i,j} cup e'_{2d-i,j'} is minus one to the i times the Kronecker delta of j and j'.

  The node is that lemma verbatim, with the sign retained.

#### `euler-characteristic-self-intersection` — The Euler characteristic as a self-intersection of the diagonal

*theorem.* **Planet:** *Euler characteristic of a variety*.

**Statement.** Let H be a classical Weil cohomology theory and X a smooth projective variety of dimension d. Then the alternating sum over i from 0 to 2d of the F-dimension of H^i(X) equals the degree of the self-intersection of the class of the diagonal, and also the degree of the top Chern class of the tangent sheaf of X capped with the fundamental class.

**Hypotheses.**

- H is a classical Weil cohomology theory and X is smooth projective of dimension d.

**Construction, or proof, in steps.**

1. Compute the self-intersection of the diagonal class in cohomology by expanding both copies through Kuenneth and using the sign and delta of the previous node.
2. Collect the terms: the contribution of degree i is the dimension of H^i(X) with the sign minus one to the i.
3. Identify the degree of the self-intersection of the diagonal cycle with the degree of the top Chern class of the tangent sheaf, by self-intersection of a regularly embedded subscheme.
4. Conclude the two stated equalities.

**Acceptance.**

- The left-hand side is an alternating sum, so the identity is a statement about the Euler characteristic and not about the total dimension.
- The middle and right terms are numbers computed from cycles alone, independent of the chosen theory; in particular the Euler characteristic is the same for every classical Weil cohomology theory.
- For X the projective line both sides are two.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/class-of-the-diagonal`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FH0.

  > Let X be a smooth projective variety. We have the sum over i from 0 to 2 dim(X) of minus one to the i times dim_F H^i(X) equals deg([Delta] . [Delta]) equals deg(c_d(T_X) cap [X]).

  The node is that lemma, with the consequence that the Euler characteristic does not depend on the theory recorded as an acceptance point.

#### `weil-from-monoidal-functor` — A monoidal functor on motives gives Weil data

*theorem.*

**Statement.** Let k be algebraically closed and F of characteristic zero. Let G be a Q-linear symmetric monoidal functor from the category of motives to graded F-vector spaces such that G of 1(1) is nonzero only in degree minus two. Then G determines data (D1), (D2) and (D3) satisfying all of axioms (A), (B) and (C) except possibly (A)(c) and (A)(d).

**Hypotheses.**

- G is Q-linear and symmetric monoidal, from motives to graded F-vector spaces.
- G of 1(1) is concentrated in degree minus two; this is the normalisation that produces the doubling of degrees.

**Construction, or proof, in steps.**

1. Define (D1) by composing G with the motive functor h, and check that the monoidal structure makes the result a graded commutative F-algebra with cup product coming from the diagonal.
2. Define (D2) by sending a cycle class of codimension i, viewed as a morphism from 1(-i) to h(X) through the representability of Chow groups, to the induced map, and use the normalisation to land in degree 2i.
3. Define (D3) from the duality of h(X), whose unit and counit are the diagonal class.
4. Verify axioms (A)(a) and (A)(b), (B) and all four parts of (C), and record that (A)(c) and (A)(d), the vanishing range and the bijectivity of the trace, do not follow.

**Acceptance.**

- Exactly two parts of the axioms are not obtained: the vanishing range and the bijectivity of the trace. Any statement that a monoidal functor gives a full Weil cohomology theory is false without those two hypotheses.
- The construction of the cycle class map goes through representability of the Chow groups by twisted units.
- The normalisation of G on 1(1) is what makes degrees double.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motives-rigid`
- `MotivesAndAlgebraicCycles:MC.1/chow-groups-representable`
- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`
- `mathlib:CategoryTheory.Functor.Monoidal`
- `mathlib:CategoryTheory.Functor.Braided`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FH1.

  > Consider a Q-linear functor G from M_k to graded F-vector spaces of symmetric monoidal categories such that G(1(1)) is nonzero only in degree minus 2. Then we obtain data (D1), (D2), (D3) satisfying all of (A), (B), (C) except for possibly (A)(c) and (A)(d).

  The node is that lemma, with the two axioms that are not obtained named in the statement, as the source does.

#### `weil-to-monoidal-functor` — A Weil cohomology theory is a monoidal functor on motives

*theorem.*

**Statement.** Let k be algebraically closed, F of characteristic zero and H a classical Weil cohomology theory. Then there is a Q-linear symmetric monoidal functor G from the category of motives to graded F-vector spaces with G of h(X) equal to H^*(X) for every smooth projective variety X.

**Hypotheses.**

- H is a classical Weil cohomology theory over k with coefficients in F.

**Construction, or proof, in steps.**

1. Define a functor on the category whose objects are smooth projective varieties and whose morphisms are correspondences of degree zero, by sending X to H^*(X) and a correspondence c to the map sending a to the pushforward along the second projection of the cup product of the cycle class of c with the pullback of a along the first projection.
2. Check functoriality, using compatibility of cycle classes with pullback, pushforward and products, and the formula for the pushforward along the second projection.
3. Check that the functor is symmetric monoidal, which is the Kuenneth axiom together with compatibility of cycle classes with exterior products.
4. Check that the image of the projector c_2 on the projective line is invertible in graded F-vector spaces, namely a one-dimensional space in degree two.
5. Apply the universal property of the category of motives to extend the functor to all motives.

**Acceptance.**

- The extension to motives exists because the image of c_2 is invertible; a theory in which that image were zero would not extend.
- The value on h(X) is H^*(X) on the nose.
- The functor is symmetric monoidal, so it takes duals to duals and the Euler characteristic computation transports.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`
- `MotivesAndAlgebraicCycles:MC.2/trace-of-a-product`
- `MotivesAndAlgebraicCycles:MC.1/motives-universal-property`
- `MotivesAndAlgebraicCycles:MC.0/projective-line-idempotents`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FH2.

  > Let H^* be a classical Weil cohomology theory. Then we can construct a Q-linear functor G from M_k to graded F-vector spaces of symmetric monoidal categories such that H^*(X) = G(h(X)).

  The node is that lemma; the construction of the functor on correspondences and the verification that the image of c_2 is invertible are written out as proof steps because the extension to motives is what the universal property needs.

#### `realization-equivalence` — Realisations are exactly monoidal functors on motives

*theorem.* **Planet:** *Realisations are monoidal functors*.

**Statement.** Let k be algebraically closed and F of characteristic zero. A classical Weil cohomology theory over k with coefficients in F is the same thing as a Q-linear symmetric monoidal functor G from the category of motives to graded F-vector spaces together with an isomorphism from F placed in degree two to G of 1(1), such that for every smooth projective variety X the graded vector space G of h(X) lives in nonnegative degrees and its degree zero part is one-dimensional over F.

**Hypotheses.**

- k is algebraically closed and F has characteristic zero.
- The normalisation is an isomorphism from F in degree two, written F[2], to G of 1(1).
- The two extra conditions are quantified over all smooth projective varieties X.

**Construction, or proof, in steps.**

1. From a theory, build the functor and the normalisation by the previous node, and check the two extra conditions from the vanishing range and from connectedness of a variety.
2. From a functor with the normalisation, build the data and the axioms other than (A)(c) and (A)(d) by the node before that.
3. Derive the vanishing range (A)(c) from the condition that G of h(X) lives in nonnegative degrees, together with duality.
4. Derive the bijectivity of the trace (A)(d) from the condition that the degree zero part of G of h(X) is one-dimensional, together with duality.
5. Check that the two constructions are mutually inverse.

**Acceptance.**

- The two extra conditions are exactly what replaces the two axioms the functorial description does not see; dropping either gives a strictly larger class of functors.
- The normalisation is part of the data on both sides.
- This is the precise sense in which the category of motives is the universal receptacle of Weil cohomology theories, and it is what makes a realisation a functor rather than a family of maps.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/weil-from-monoidal-functor`
- `MotivesAndAlgebraicCycles:MC.2/weil-to-monoidal-functor`
- `MotivesAndAlgebraicCycles:MC.1/motives-rigid`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Proposition 0FH3.

  > A classical Weil cohomology theory is the same thing as a Q-linear functor G from M_k to graded F-vector spaces of symmetric monoidal categories together with an isomorphism F[2] to G(1(1)) of graded F-vector spaces such that in addition (1) G(h(X)) lives in nonnegative degrees, and (2) dim_F G^0(h(X)) = 1 for any smooth projective variety X.

  The node is that proposition, with the two extra conditions kept in the statement and identified in the proof steps with the two axioms the functorial description does not otherwise give.

#### `chow-groups-under-field-extension` — Chow groups under algebraic extensions of the base field

*lemma.*

**Statement.** Let K over k be an algebraic field extension and X a scheme of finite type over k. Then CH_i of the base change of X to K is the filtered colimit of CH_i of the base changes to the finite subextensions, and the kernel of the map from CH_i(X) to CH_i of the base change to K is torsion. Moreover for X smooth projective over k the group CH_0(X) is generated by classes of closed points with separable residue fields.

**Hypotheses.**

- K over k is an algebraic extension and X is of finite type over k; for the last statement X is smooth projective over k.
- Chow groups here are the integral ones, which is where the torsion statement has content.

**Construction, or proof, in steps.**

1. Write the base change to K as a filtered limit over the finite subextensions and use that Chow groups commute with such limits of schemes.
2. For the kernel, take a class that dies over K, find a finite subextension over which it already dies, and push forward along the finite flat map to multiply it by the degree.
3. For the last statement reduce to a closed point and move it into a separable position.

**Acceptance.**

- The kernel is torsion, not zero; a statement that Chow groups inject under base change is false.
- The colimit is over finite subextensions, which is what makes the torsion bound effective through the degrees.
- Over a perfect field the last statement is empty, and over an imperfect field it is not.

**Prerequisites.**

- `SchemeAndStackFoundations:SF.5`
- `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemmas 0FH5, 0FH6 and 0FH8.

  > Let K over k be an algebraic field extension, X of finite type over k. Then CH_i(X_K) is the colimit of CH_i(X_{k'}) over the finite subextensions. The kernel of the map CH_i(X) to CH_i(X_K) is torsion. Let X be a smooth projective scheme over k. Then CH_0(X) is generated by classes of closed points whose residue fields are separable over k.

  The node gathers those three lemmas, which the source proves in the same section and which are used together whenever a cycle statement is checked after an extension of the base field.

---

## MC.3 Numerical motives and semisimplicity

**Coverage: source_decomposed.** Jannsen's paper in full: the trace formula for correspondences, the lemma that a pseudo-abelian category with finite dimensional semisimple endomorphism algebras is semisimple abelian together with the dual numbers non-example that shows the hypothesis cannot be weakened, the three-way equivalence characterising numerical equivalence, the identification of the kernel of the comparison from homological to numerical correspondences with the Jacobson radical under algebraic Kuenneth projectors, the computation of the rank of a motive that forces the sign change, and the Tannakian conclusion after that sign change. Deligne's Tannakian criterion, which the last step invokes, was not obtained and is recorded as a gap.

This layer is one paper: Jannsen's six pages from 1992, read in full from the author's copy in
the University of Regensburg repository. It proves that among all adequate equivalence relations exactly one —
numerical equivalence — makes the category of motives semisimple abelian, and that this is unconditional: the
standard conjectures are not needed, which the paper's first paragraph says explicitly, against what it calls
general belief.

Three supporting results carry the proof. The trace formula expresses an intersection number as an alternating
sum of traces on cohomology. The Wedderburn lemma turns finite dimensional semisimple endomorphism algebras
into semisimplicity of the category — and the non-example of the dual numbers, also recorded here, shows that
the hypothesis cannot be weakened to *indecomposable implies simple*, which is the error Jannsen's remark
corrects in the literature. The radical computation identifies the kernel of the comparison from homological to
numerical correspondences with the Jacobson radical, under the algebraicity of the Künneth projectors.

The Tannakian conclusion needs one more thing, and it is a sign. Without modifying the commutativity
constraint the rank of the motive of a curve of genus `g` is `2 - 2g`, which is negative for `g ≥ 2`, and no
fibre functor can exist. Changing the constraint by `(-1)^{rs}` on the graded pieces makes every rank
nonnegative, and only then does the category become Tannakian.

**Planets of this layer** (4): *Trace formula for correspondences*, *Jannsen's semisimplicity theorem*, *Radical of the homological correspondences*, *Numerical motives are Tannakian*.

### Nodes (7)

#### `trace-formula-for-correspondences` — The trace formula for correspondences modulo homological equivalence

*theorem.* **Planet:** *Trace formula for correspondences*.

**Statement.** Fix a Weil cohomology theory and write B^{dim X}(X times X) for the correspondences of degree zero modulo homological equivalence with respect to it. Let the transposition be the map induced by interchanging the two factors of X times X. Then for f and g in that group the intersection number of f with the transpose of g equals the alternating sum, over i from 0 to twice the dimension of X, of the sign minus one to the i times the trace of the composite of f and g acting on the i-th cohomology group of X.

**Hypotheses.**

- X is a smooth projective variety over k and a Weil cohomology theory has been fixed.
- f and g are correspondences of degree zero from X to X, taken modulo homological equivalence so that the traces are defined.
- The traces are taken on the finite dimensional cohomology groups of the chosen theory.

**Construction, or proof, in steps.**

1. Realise a correspondence as an endomorphism of the total cohomology of X through the realisation functor, and record that it preserves the grading.
2. Expand the cycle class of the composite through Kuenneth and pair it against the diagonal, using the sign and delta of the Kuenneth decomposition of the diagonal.
3. Collect the terms by cohomological degree; the sign minus one to the i is the sign in that decomposition.
4. Identify the left-hand side with the intersection number of f against the transpose of g, which is the degree of a zero cycle on X times X.

**Acceptance.**

- The alternating sign is present; the identity fails without it already for a curve of positive genus.
- Both sides are defined modulo homological equivalence, and neither is defined on the Chow groups without first realising.
- For f and g the class of the diagonal the identity returns the Euler characteristic.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/class-of-the-diagonal`
- `MotivesAndAlgebraicCycles:MC.0/homological-equivalence`
- `MotivesAndAlgebraicCycles:MC.0/transpose-correspondence`
- `mathlib:LinearMap.trace`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 448, Lemma 1.

  > Let f to the transpose of f be the transposition on B^{dim(X)}(X times X), induced by interchanging the factors of X times X. Then for f, g in B^{dim(X)}(X times X) one has the intersection number of f with the transpose of g equal to the sum over i from 0 to 2 dim(X) of minus one to the i times Tr^i(f composed with g), where Tr^i(f) is the trace of f acting on H^i(X).

  The node is Jannsen's Lemma 1. He states it as well known and refers to Kleiman's 1968 article for the proof; the proof steps here are the derivation from the Kuenneth decomposition of the diagonal, which the Stacks chapter proves in Lemma 0FGZ, so that the node does not rest on a source that was not read.

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FGZ and Lemma 0FH0.

  > Using Kuenneth write gamma([Delta]) as the sum over i and j of e_{i,j} tensor e'_{2d-i,j}. Then the integral over X of e_{i,j} cup e'_{2d-i,j'} is minus one to the i times the Kronecker delta. We have the sum over i of minus one to the i times dim_F H^i(X) equals deg([Delta] . [Delta]).

  Cited as the source of the proof: the case f = g = the diagonal of the trace formula is exactly Lemma 0FH0, and the general case is the same computation with the diagonal replaced by the class of the composite.

#### `pseudo-abelian-semisimplicity` — A pseudo-abelian category with semisimple endomorphism algebras is semisimple abelian

*lemma.*

**Statement.** Let C be an F-linear pseudo-abelian category such that the endomorphism algebra of every object is a finite dimensional semisimple F-algebra. Then C is a semisimple abelian category.

**Hypotheses.**

- F is a field.
- C is F-linear and pseudo-abelian, that is, idempotents split.
- Every object has a finite dimensional semisimple endomorphism algebra; the hypothesis is on all objects and not only on the generators.

**Construction, or proof, in steps.**

1. By Wedderburn's theorem the endomorphism algebra of an object is a product of full matrix algebras over division rings, so an object is indecomposable exactly when its endomorphism algebra is a division ring.
2. Every object is a finite direct sum of indecomposables, because idempotents split and the endomorphism algebras are finite dimensional.
3. Show that for indecomposable objects M and N either the morphism group from M to N is zero or M and N are isomorphic: if the group is nonzero then the composition pairing into the endomorphism algebra of M is nonzero, since otherwise the off-diagonal part of the endomorphism algebra of the direct sum would be a nontrivial nilpotent two-sided ideal.
4. Take a composable pair with nonzero composite; as the endomorphism algebra of M is a division ring the composite is invertible, so one of the two maps has a left inverse and, M and N being indecomposable, is an isomorphism.
5. Conclude that C is equivalent to a direct sum, indexed by isomorphism classes of indecomposables, of categories of vector spaces over division rings, hence is semisimple abelian.

**Acceptance.**

- The hypothesis of semisimplicity of the endomorphism algebras cannot be weakened to indecomposable implies simple: the category of finitely generated free modules over the ring of dual numbers over Q is a counterexample, recorded separately.
- The conclusion is that the category is abelian, which is more than the existence of kernels of idempotents.
- The proof is by Wedderburn's theorem, so the finite dimensionality is used.

**Prerequisites.**

- `mathlib:IsSemisimpleRing`
- `tauceti:TauCeti.WedderburnPresentation`
- `tauceti:TauCeti.wedderburn_data_unique`
- `mathlib:CategoryTheory.Abelian`
- `mathlib:CategoryTheory.IsIdempotentComplete`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 449, Lemma 2 with its proof.

  > Let C be an F-linear, pseudo-abelian category such that End(M) is a finite-dimensional, semi-simple F-algebra for every object M of C. Then C is a semi-simple abelian category. By Wedderburn's theorem, End(M) is a product of full matrix algebras over skewfields. This shows that M is indecomposable if and only if End(M) is a skewfield.

  The node is Jannsen's Lemma 2 with his proof, whose four steps are kept separate; the last step is the equivalence with a sum of categories of vector spaces over division rings.

#### `dual-numbers-non-example` — Indecomposable and simple is not enough

*lemma.*

**Statement.** Let Q of epsilon be the Q-algebra of dual numbers, with epsilon squared zero. The category of finitely generated free modules over it is a Q-linear pseudo-abelian category carrying a faithful Q-linear functor to Q-vector spaces, every indecomposable object of it is simple, and it is not an abelian category: the endomorphism given by multiplication by epsilon on the ring itself has no kernel in the category.

**Hypotheses.**

- The base is the Q-algebra of dual numbers.
- Objects are the finitely generated free modules over it and morphisms are module maps.

**Construction, or proof, in steps.**

1. Check that the category is Q-linear and pseudo-abelian.
2. Check that the forgetful functor to Q-vector spaces is faithful and Q-linear.
3. Check that the only indecomposable object up to isomorphism is the ring itself and that it is simple in this category, since it has no proper nonzero free direct summand.
4. Exhibit multiplication by epsilon as an endomorphism of the ring with no kernel among finitely generated free modules, so that the category is not abelian.

**Acceptance.**

- The example shows that the hypothesis of the previous lemma cannot be replaced by the weaker one used in the literature; the endomorphism algebra of the ring is the ring itself, which is not semisimple.
- The functor to vector spaces is faithful, so faithfulness of a fibre functor does not repair the argument.
- The failure is the absence of a kernel and not the absence of a splitting of idempotents.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.3/pseudo-abelian-semisimplicity`
- `mathlib:CategoryTheory.Abelian`
- `mathlib:IsSemisimpleRing`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 451, Remark 3.

  > Lemma 2 should replace Lemma 6.6 in Deligne and Milne which is false: let Q[e] be the Q-algebra of dual numbers. Then the category C of finitely generated free Q[e]-modules is a Q-linear pseudo-abelian category with a faithful Q-linear functor into Vec_Q, and every indecomposable object of C is simple, but C is not an abelian category. In fact, the endomorphism e of Q[e] has no kernel.

  The node is that remark, recorded as a lemma of this blueprint because it is the non-example that pins down the hypothesis of Lemma 2; Jannsen also notes that the same wrong argument appears in Saavedra Rivano's proof.

#### `jannsen-semisimplicity` — Jannsen's theorem: semisimplicity characterises numerical equivalence

*theorem.* **Planet:** *Jannsen's semisimplicity theorem*.

**Statement.** Fix a field F of characteristic zero and let the category of motives be formed with respect to an adequate equivalence relation. The following are equivalent: the category of motives is a semisimple abelian category; for every variety X the algebra of correspondences of degree zero from X to X is a finite dimensional semisimple F-algebra; and the relation is numerical equivalence.

**Hypotheses.**

- k is a field, F has characteristic zero and the relation is adequate.
- Varieties are smooth projective over k.
- No standard conjecture is assumed; the theorem is unconditional.

**Construction, or proof, in steps.**

1. From the first condition to the third: the unit object has endomorphism algebra F, hence is irreducible, so every nonzero morphism from it into a twisted motive of X is a monomorphism and by semisimplicity splits; translating back, for every nonzero class f there is a class g with the intersection number of f and g equal to one, which says exactly that the relation is not coarser than numerical equivalence. Since numerical equivalence is the coarsest adequate relation, the two agree.
2. From the third condition to the second: fix a Weil cohomology theory and write B for the correspondences modulo homological equivalence and A for those modulo numerical equivalence. Both are finite dimensional over F after base change, so it suffices to show that the Jacobson radical of A vanishes over a coefficient field one may extend. Using the trace formula, an element of the radical of B has all traces zero on each cohomology group, so the image of the radical of B in A is zero; hence A is a quotient of a semisimple algebra and is semisimple.
3. From the second condition to the first: deduce that the endomorphism algebra of every direct factor of a motive of a variety is finite dimensional semisimple, by exhibiting the off-diagonal ideal attached to a nilpotent ideal as nilpotent in the endomorphism algebra of the sum, then apply the previous lemma.
4. Record that the three implications close the cycle.

**Acceptance.**

- The theorem is an equivalence of three conditions and is unconditional: no standard conjecture is used. The source states this explicitly, against what it calls general belief.
- The middle condition is about the algebra of correspondences of a single variety, so it is a finiteness and semisimplicity statement in linear algebra once a relation is fixed.
- Semisimplicity fails for Chow motives, that is, for rational equivalence, as soon as the two relations differ.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation`
- `MotivesAndAlgebraicCycles:MC.3/pseudo-abelian-semisimplicity`
- `MotivesAndAlgebraicCycles:MC.3/trace-formula-for-correspondences`
- `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`
- `MotivesAndAlgebraicCycles:MC.0/adequate-equivalence-relation`
- `mathlib:Ring.jacobson`
- `mathlib:IsSemisimpleRing`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 448, Theorem 1, with its proof on pages 448 to 449.

  > The following properties are equivalent. a) M_k is a semi-simple abelian category. b) A^{dim(X)}(X times X) is a finite-dimensional, semi-simple F-algebra for every variety X. c) The relation is numerical equivalence. Recall that, obviously, numerical equivalence is the coarsest adequate equivalence relation.

  The node is that theorem with its three implications, each of which is written out as a proof step following the source.

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 447, the abstract paragraph.

  > In this note we show that the category of motives, as defined via algebraic correspondences modulo an adequate equivalence relation, is a semi-simple abelian category if - and in fact, only if - the relation is numerical equivalence. Contrary to general belief Grothendieck's standard conjectures are not needed for this.

  Cited for the unconditionality, which is an acceptance point of the node: an implementation that assumes a standard conjecture has not proved this theorem.

#### `radical-of-homological-correspondences` — The radical of the algebra of homological correspondences

*theorem.* **Planet:** *Radical of the homological correspondences*.

**Statement.** Fix a Weil cohomology theory and a variety X, and write S for the surjective ring homomorphism from the correspondences of degree zero modulo homological equivalence to those modulo numerical equivalence. If the Kuenneth components of the diagonal of X are algebraic, then the kernel of S is the Jacobson radical of the source and is a nilpotent ideal.

**Hypotheses.**

- A Weil cohomology theory is fixed and X is a smooth projective variety whose Kuenneth components of the diagonal are algebraic.
- The coefficient field A of the theory is an algebra over the coefficient field F of the cycle groups, which is what makes both quotients defined.
- For the case where F and A differ the conclusion is obtained by a base change argument, since finite dimensionality of the source over F is not known in positive characteristic.

**Construction, or proof, in steps.**

1. Show that the radical of the source is contained in the kernel of S, which is the second implication of the theorem above.
2. For the converse, let f be numerically trivial. Using the defining property of the Kuenneth components, the trace of the composite of f with the j-th component is the j-th graded trace of f; combined with the trace formula this gives that all graded traces of f vanish.
3. Apply the same to all powers of f to conclude that the induced endomorphism of each cohomology group has all eigenvalues zero, hence is nilpotent; since the cycle class map into the sum of the endomorphism algebras of the cohomology groups is injective, f is nilpotent.
4. For F equal to the coefficient field of the theory conclude that the kernel is a nil ideal in a finite dimensional algebra, hence nilpotent and contained in the radical.
5. For general F use the commutative square relating the two coefficient fields, in which the left vertical map is injective, to deduce the same conclusion.

**Acceptance.**

- The hypothesis is algebraicity of the Kuenneth components for this X, and the conclusion is about this X.
- The kernel is nilpotent, not merely nil; the passage from nil to nilpotent is the step that needs the finiteness or the base change argument.
- The source is explicit that finite dimensionality of the algebra of homological correspondences over F is conjectural in positive characteristic, which is why the base change argument is needed.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity`
- `MotivesAndAlgebraicCycles:MC.3/trace-formula-for-correspondences`
- `MotivesAndAlgebraicCycles:MC.0/homological-equivalence`
- `MotivesAndAlgebraicCycles:MC.7/kunneth-conjecture-C`
- `mathlib:Ring.jacobson`
- `mathlib:IsArtinianRing`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 449, Corollary 1, with its proof on pages 449 to 450.

  > If for a variety X, the Kuenneth components pi^j of the diagonal are algebraic, then the kernel of the surjective ring homomorphism S from A_hom to A_num is the Jacobson radical of the source, and is a nilpotent ideal. In the general case it is conjectured but not known for char(k) > 0 that B is finite-dimensional over F.

  The node is that corollary with its proof, including the base change step and the source's own statement that finite dimensionality over F is open in positive characteristic.

#### `rank-of-a-motive` — The rank of a motive and the obstruction to a fibre functor

*lemma.*

**Statement.** In the category of motives modulo numerical equivalence with its unmodified commutativity constraint, the rank of the motive of a variety X, in the sense of a rigid tensor category, is the self-intersection number of the diagonal of X. This number can be negative, whereas in the presence of a fibre functor into vector spaces the rank would be the dimension of a vector space and hence nonnegative. Therefore no fibre functor exists for the unmodified constraint.

**Hypotheses.**

- The category is the numerical one, which is rigid by the internal hom formula.
- The rank is the composite of the coevaluation and the evaluation of the duality, an element of the endomorphism ring of the unit, which is F.
- The commutativity constraint is the unmodified one induced by the switch of factors.

**Construction, or proof, in steps.**

1. Compute the rank of the motive of X as the composite of the unit and counit of the duality, both given by the diagonal class, and identify it with the self-intersection number of the diagonal.
2. Use the trace formula with both arguments the diagonal to express that number as the alternating sum of the dimensions of the cohomology groups.
3. Exhibit a variety for which the alternating sum is negative, for instance a curve of genus at least one, so that the rank is negative.
4. Conclude that no fibre functor with values in vector spaces over an extension field can exist for the unmodified constraint.

**Acceptance.**

- The obstruction is a sign and not a size: the rank is an integer that can be of either sign.
- The computation of the rank uses only rigidity and the duality, which hold for every adequate relation.
- For a curve of genus g the rank of the motive is 2 minus 2g, which is negative as soon as g is at least two.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation`
- `MotivesAndAlgebraicCycles:MC.3/trace-formula-for-correspondences`
- `MotivesAndAlgebraicCycles:MC.2/euler-characteristic-self-intersection`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 450, inside the proof of Corollary 2.

  > It is well known that such a fibre functor cannot exist: under the above normalizations the rank of a motive h(X) can be negative, while in the presence of a fibre functor it should be non-negative, as the dimension of a vector space. One easily computes rk(h(X)) equals the self-intersection number of the diagonal, and this can be positive as well as negative.

  The node is that step of the source's proof, made a lemma in its own right because it is what forces the sign change in the commutativity constraint.

#### `numerical-motives-tannakian` — Numerical motives are Tannakian after a sign change

*theorem.* **Planet:** *Numerical motives are Tannakian*.

**Statement.** Suppose that for every variety X over k the Kuenneth components of the diagonal, with respect to a fixed Weil cohomology theory, are algebraic. Then their images modulo numerical equivalence are central idempotents, orthogonal for distinct indices, so every motive acquires a grading by the integers respected by all morphisms. Modifying the commutativity constraint by the sign minus one to the product of the two degrees makes the rank of every motive nonnegative, and the category of motives modulo numerical equivalence is then a semisimple F-linear Tannakian category.

**Hypotheses.**

- The Kuenneth components of the diagonal are algebraic for every variety over k.
- The relation is numerical equivalence and F has characteristic zero.
- The commutativity constraint is modified by the displayed sign; without that modification the conclusion is false.

**Construction, or proof, in steps.**

1. Record that the images of the Kuenneth components modulo numerical equivalence are central idempotents, pairwise orthogonal.
2. Define the grading of a motive by cutting with these idempotents, with the shift by twice the twist, and check that every morphism respects it.
3. Modify the commutativity constraint by the sign minus one to the product of the two degrees on the graded pieces.
4. Compute that with the modified constraint the rank of a motive is the sum over nonnegative i of the dimension of the corresponding graded piece of cohomology, hence nonnegative.
5. Apply Jannsen's theorem to get semisimple abelian, and then Deligne's criterion for a rigid tensor category with nonnegative integer ranks to conclude that the category is Tannakian.

**Acceptance.**

- The sign change is indispensable: without it the rank of a motive can be negative and no fibre functor exists.
- The hypothesis is the algebraicity of the Kuenneth components for every variety, which is open in general; the conclusion is therefore conditional.
- The same conclusion holds unconditionally for the subcategory generated by the unit twist and a family of varieties whose Kuenneth components are algebraic, in particular for the category generated by abelian varieties over any field.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.3/jannsen-semisimplicity`
- `MotivesAndAlgebraicCycles:MC.3/rank-of-a-motive`
- `MotivesAndAlgebraicCycles:MC.7/kunneth-conjecture-C`
- `MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation`
- `mathlib:CategoryTheory.BraidedCategory`
- `mathlib:CategoryTheory.LeftRigidCategory`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 450, Corollary 2 with its proof, and page 451, Remarks 1 and 2.

  > If the Kuenneth components of the diagonal are algebraic for every variety X over k, then M_k with respect to numerical equivalence is a semi-simple F-linear Tannakian category. If we modify the constraints by the sign minus one to the r s, then the computation of Lemma 1 shows rk((X, p, m)) equals the sum over i at least 0 of dim_A p H^i(X). By Deligne's theorem 7.1, M_k is Tannakian.

  The node is that corollary with its proof, and the two remarks that record the unconditional subcategories, in particular the category generated by abelian varieties.

---

## MC.4 Geometric mixed motives and motivic cohomology

**Coverage: partial.** What the restructuring proposal RS-08 leaves this layer: the geometric subcategory, the Tate stabilisation resting on the imported cancellation theorem, homotopy invariance and Mayer-Vietoris in the geometric subcategory, the motives of the affine line, the multiplicative group and projective space with the projective bundle isomorphism, the Gysin triangle with the boundary map at a closed point of a smooth curve, rigidity of the geometric motives, the embedding of Chow motives and the comparison of motivic cohomology with higher Chow groups. Everything the proposal assigns to MotivicEtaleKTheory:M.4 and M.5a is imported through requests and none of it is planned here.

**Remaining in this layer:**

- The blow-up triangle and the formula for the motive of a blow-up along a smooth centre are stated in the source read as displays 14.5.3 and 14.5.4 but their proofs are in lectures not read here; they are needed for the statement that the geometric subcategory contains the motive of every finite type scheme.
- Motives with compact support and Borel-Moore motivic homology, which the source constructs in Lecture 16, are used in the identification of the dual of the motive of a smooth scheme and are not decomposed here.
- The version of the cancellation theorem for a perfect base field, which the source attributes to a later paper of Voevodsky, was not read; every node of this layer that uses cancellation carries the resolution of singularities hypothesis of the version that was read.
- The comparison of the Nisnevich and etale constructions, and motives with rational coefficients, are in the source's Lecture 14 and are not decomposed here.

The restructuring proposal RS-08, accepted before this job started, narrows this layer. Bloch's
cycle complexes with moving and localisation belong to `MotivicEtaleKTheory:M.4`; finite correspondences,
Nisnevich sheaves with transfers, `A¹`-localisation, the effective motivic category and Voevodsky's
cancellation theorem belong to `MotivicEtaleKTheory:M.5a`. What is left to this layer is the geometric
subcategory, the Tate stabilisation resting on the imported cancellation theorem, the computations of the
motives of the affine line, the multiplicative group and projective space, the Gysin triangle with its
boundary map at a closed point of a smooth curve, rigidity, and the two comparisons: with Chow motives, and
with higher Chow groups.

The layer is left `partial` on purpose. The blow-up triangle, motives with compact support, Borel–Moore
motivic homology and the perfect-field form of cancellation are named in the coverage record's `remaining`
list, with the precise reason in each case, so that a continuation job can resume exactly where this one
stopped rather than re-reading the same lectures.

**Planets of this layer** (4): *Effective geometric motives*, *Geometric motives*, *Motive of projective space*, *Gysin triangle*.

### Nodes (8)

#### `effective-geometric-motives` — The category of effective geometric motives

*construction.* **Planet:** *Effective geometric motives*.

**Statement.** Let k be a field and R a coefficient ring. Inside the triangulated category of effective motives, which is the A^1-localisation of the derived category of bounded above complexes of Nisnevich sheaves with transfers and is imported from the layer that owns it, define the category of effective geometric motives to be the thick triangulated subcategory generated by the motives M(X) of smooth schemes X over k. If k admits resolution of singularities the subcategory contains M(Y) for every scheme of finite type over k and is generated by the motives of smooth projective schemes.

**Hypotheses.**

- k is a field, and for the last assertion k admits resolution of singularities.
- The ambient triangulated category of effective motives, the motive M(X) of a smooth scheme and the tensor structure are imported and not constructed here.
- Thick means triangulated and closed under direct summands.

**Construction, or proof, in steps.**

1. Take the ambient category and the objects M(X) for X smooth over k, both imported.
2. Form the smallest strictly full triangulated subcategory containing them and closed under direct summands.
3. Record that the tensor product restricts, since the tensor product of the motives of two smooth schemes is the motive of their product.
4. Under resolution of singularities, deduce from the blow-up triangle and the Gysin triangle that the motive of every finite type scheme lies in the subcategory and that the motives of smooth projective schemes generate it.

**Acceptance.**

- The subcategory is thick, so it is closed under direct summands; without that the image of an idempotent, and in particular the image of a Chow projector, would not be a geometric motive.
- The last two assertions are conditional on resolution of singularities and are stated with that hypothesis.
- The ambient category and the motives of smooth schemes are imported from the layer that owns them; nothing about finite correspondences or A^1-localisation is proved here.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `DMeffGm` | data | The thick triangulated subcategory of effective geometric motives. |
| `DMeffGm.of_smooth` | constructor | The motive of a smooth scheme is an effective geometric motive. |
| `DMeffGm.thick` | structure | The subcategory is triangulated and closed under direct summands. |
| `DMeffGm.tensor` | compatibility | The tensor product of two effective geometric motives is one. |
| `DMeffGm.generated_by_projective` | characterisation | Under resolution of singularities the motives of smooth projective schemes generate. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`: geometric motives are obtained from this category by inverting the Tate twist
- `MotivesAndAlgebraicCycles:MC.4/chow-motives-into-geometric-motives`: the image of the Chow motives lies in this subcategory

**Unit tests.** A plausible wrong definition fails one of these.

- `motive_of_a_point`: The motive of the spectrum of k is the unit and lies in the subcategory.
- `closed_under_summands`: The image of the projector of a rational point on the projective line is an effective geometric motive; a merely triangulated subcategory need not contain it.
- `not_all_of_the_ambient`: The subcategory is smaller than the ambient category of effective motives, which contains objects that are not compact.

**Prerequisites.**

- `MotivicEtaleKTheory:M.5a`
- `mathlib:CategoryTheory.Pretriangulated`
- `mathlib:CategoryTheory.Functor.IsLocalization`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Definition 14.1 with the paragraph following it.

  > We define DM^eff_gm(k, R) to be the thick subcategory of DM^{eff,-}_Nis(k, R) generated by the motives M(X), where X is smooth over k. Objects in DM^eff_gm(k, R) will be called effective geometric motives. If k admits resolution of singularities, DM^eff_gm contains M(Y) for every Y in Sch/k, and is generated by M(X) for X smooth and projective.

  The node is that definition, with the ambient category and the objects M(X) taken as imported from the layer that owns them, as the restructuring proposal for this roadmap requires.

#### `tate-stabilised-motives` — Geometric motives by inverting the Tate twist

*construction.* **Planet:** *Geometric motives*.

**Statement.** Define the category of geometric motives to be obtained from the effective geometric motives by inverting the Tate twist, the operation sending M to M tensor R(1). Every object of the corresponding stabilisation of the ambient category is isomorphic to a twist M(-n) for some nonnegative n and some effective object. The result is a tensor triangulated category and, by the cancellation theorem imported from the layer that owns it, the localisation functor from the effective geometric motives is fully faithful.

**Hypotheses.**

- k is a field; for the cancellation theorem in the form read here k admits resolution of singularities, and the source records that it also holds for k perfect.
- The Tate object R(1) and the cancellation theorem are imported.
- Coefficients R are fixed throughout.

**Construction, or proof, in steps.**

1. Invert the endofunctor given by tensoring with R(1) on the effective geometric motives, in the standard way for an endofunctor of a triangulated category.
2. Check that every object of the stabilisation of the ambient category is a twist of an effective object, which is what makes the construction a localisation rather than a completion.
3. Check that the tensor structure descends.
4. Deduce from the cancellation theorem that the functor from the effective geometric motives to the geometric motives is fully faithful.
5. Record that the geometric motives form a full tensor triangulated subcategory of the stabilisation of the ambient category.

**Acceptance.**

- Full faithfulness of the effective-to-stable functor is exactly the cancellation theorem and is not formal; it carries the hypothesis on k that the chosen proof needs.
- Every object is a twist of an effective one, with a nonnegative twist.
- The Tate twist becomes invertible, which is what this layer adds to the effective category.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `DMgm` | data | The category of geometric motives, obtained by inverting the Tate twist. |
| `DMgm.twist` | data | The Tate twist as an autoequivalence. |
| `DMgm.of_effective` | constructor | The fully faithful functor from effective geometric motives. |
| `DMgm.every_object_is_a_twist` | characterisation | Every object is a twist of an effective one. |
| `DMgm.tensor_triangulated` | structure | The tensor triangulated structure. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.4/chow-motives-into-geometric-motives`: the Chow motives embed into this category, the twist matching the Tate twist
- `MotivesAndAlgebraicCycles:MC.4/geometric-motives-rigid`: rigidity is proved in this category and not in the effective one

**Unit tests.** A plausible wrong definition fails one of these.

- `twist_invertible`: Tensoring with R(1) is an equivalence, with inverse tensoring with R(-1).
- `effective_embeds`: The functor from the effective geometric motives is fully faithful; this is where cancellation is used and a construction that does not use it cannot prove this.
- `motive_of_the_line`: The motive of the projective line is the unit plus R(1)[2], and its image is invertible after stabilisation.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`
- `MotivicEtaleKTheory:M.5a`
- `mathlib:CategoryTheory.Functor.IsLocalization`
- `mathlib:CategoryTheory.Functor.Full`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 14, the paragraph after Definition 14.2, and Theorem 16.25 with Remark 16.26.

  > DM^-(k, R) is obtained from DM^{eff,-}_Nis(k, R) by inverting the Tate twist M to M(1). Every object in DM^-(k, R) is isomorphic to M(-n) for some n at least 0. The localization is fully faithful, by Voevodsky's Cancellation Theorem 16.25. DM_gm(k, R) is obtained from DM^eff_gm(k, R) by inverting the Tate twist.

  The node is that construction together with the role of cancellation, which the source states in the same place; cancellation itself is imported from the layer that owns it.

#### `homotopy-invariance-and-mayer-vietoris` — Homotopy invariance, Mayer-Vietoris and vector bundles for geometric motives

*lemma.*

**Statement.** For X smooth over k the projection from X times the affine line to X induces an isomorphism of motives, for an open cover of a smooth scheme by two opens there is a distinguished Mayer-Vietoris triangle relating the motives of the two opens, their intersection and the whole, and for a vector bundle over X the projection induces an isomorphism on motives.

**Hypotheses.**

- X is smooth over k and the cover is by two Zariski opens.
- The ambient triangulated category and the three cited facts about the ambient category are imported from the layer that owns them.

**Construction, or proof, in steps.**

1. Import the three statements in the ambient category of effective motives.
2. Check that each of the objects involved is an effective geometric motive, so the statements restrict to the subcategory.
3. Record the triangle in the form used later, with the intersection first.

**Acceptance.**

- Homotopy invariance is an isomorphism and not merely a quasi-isomorphism after some further localisation.
- The Mayer-Vietoris triangle is distinguished, so it yields long exact sequences after applying any cohomological functor.
- The vector bundle statement is the same for any rank, in particular the motive of the affine plane is the unit.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`
- `MotivicEtaleKTheory:M.5a`
- `mathlib:CategoryTheory.Pretriangulated.Triangle`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Properties 14.5, the first three items with the display numbered 14.5.1.

  > By 14.4, we have M(X) isomorphic to C_* Z_tr(X). By 8.10, M(X) tensor M(Y) is M(X times Y), and 2.24 yields M(X) isomorphic to M(X times A^1). For each open cover of a smooth scheme X, proposition 13.15 yields the Mayer-Vietoris triangle M(U intersect V) to M(V) plus M(U) to M(X) to M(U intersect V)[1]. If E to X is a vector bundle, by 13.16 we have an isomorphism M(E) to M(X).

  The node is those three items of the source's summary list; each is proved elsewhere in the source and is imported by this roadmap from the layer that owns the ambient construction.

#### `motive-of-projective-space` — The motives of the affine line, the multiplicative group and projective space

*theorem.* **Planet:** *Motive of projective space*.

**Statement.** Let k be a perfect field. Then the motive of the affine line is the unit, the motive of the multiplicative group is the direct sum of the unit and R(1)[1], and for every n the motive of projective n-space is the direct sum over i from 0 to n of R(i)[2i]. More generally, for a projective bundle of rank n + 1 over a smooth X the canonical map from the direct sum over i from 0 to n of M(X)(i)[2i] to the motive of the bundle is an isomorphism.

**Hypotheses.**

- k is a perfect field; the source flags that perfectness is needed only for the input it cites.
- X is smooth over k and the projective bundle has rank n + 1.

**Construction, or proof, in steps.**

1. Deduce the motive of the affine line from homotopy invariance.
2. Prove that the quotient of the motive of the projective line by the unit is the shifted motive of the multiplicative group, by the Mayer-Vietoris triangle for the standard cover of the projective line, and identify it with R(1)[2]; this gives both the multiplicative group and the projective line.
3. Prove the general case of projective space by induction, splitting the triangle relating projective n-space to projective (n-1)-space by the fact that the inclusion is split injective.
4. State the projective bundle isomorphism, which the source proves separately and which specialises to projective space for a trivial bundle.

**Acceptance.**

- The summands are twists R(i)[2i] and not untwisted copies of the unit; this is the first computation any implementation should reproduce.
- The motive of the multiplicative group has two summands, one of which is a shifted Tate twist by one and not by two.
- For n equal to one this recovers the decomposition of the motive of the projective line, which matches the decomposition of its Chow motive under the comparison functor.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.4/homotopy-invariance-and-mayer-vietoris`
- `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`
- `MotivicEtaleKTheory:M.5a`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Example 13.17, Theorem 15.2, Corollary 15.5 and the projective bundle display 14.5.2.

  > Applying 13.15 to the usual cover of P^1 allows us to deduce that C_*(Z_tr(P^1)/Z) is C_* Z_tr(G_m)[1] = Z(1)[2]. There is a quasi-isomorphism M(P^n) = C_* Z_tr(P^n) to Z plus Z(1)[2] plus ... plus Z(n)[2n]. We will prove in 15.12 that if P(E) to X is a projective bundle of rank n + 1, then the canonical map induces an isomorphism from the direct sum of M(X)(i)[2i] to M(P(E)).

  The node is those computations; the identification of the motive of the multiplicative group is read off from the first display, which the source states for the quotient of the motive of the projective line.

#### `gysin-triangle` — The Gysin triangle and the boundary map at a closed point of a curve

*theorem.* **Planet:** *Gysin triangle*.

**Statement.** Let X be a smooth scheme over a perfect field and Z a smooth closed subscheme of codimension c. Then there is a distinguished Gysin triangle from the motive of the complement of Z, to the motive of X, to the motive of Z twisted by c and shifted by 2c, and back to the first shifted by one. In particular for X a smooth curve and Z a closed point the triangle reads: motive of the complement, motive of X, the unit twisted by one and shifted by two.

**Hypotheses.**

- X is smooth over a perfect field k and Z is a smooth closed subscheme of pure codimension c.
- For the special case X is a smooth curve and Z a closed point with residue field the base field, so that c is one.

**Construction, or proof, in steps.**

1. Import the Gysin map from the layer that owns the ambient construction and record that it vanishes on the motive of the complement.
2. State the triangle and record that it is distinguished.
3. Specialise to a smooth curve and a rational closed point: the codimension is one and the motive of the point is the unit, so the third term is the unit twisted by one and shifted by two.
4. Record the resulting long exact sequence of motivic cohomology groups, which is the boundary map the layer's acceptance test asks for.

**Acceptance.**

- The third term carries both the twist by c and the shift by 2c; a triangle with either omitted is wrong and fails the acceptance test at a point of a curve.
- The triangle is distinguished, so the boundary map is part of the data.
- For X the projective line and Z a rational point the triangle recovers the motive of the affine line as the unit.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`
- `MotivesAndAlgebraicCycles:MC.4/motive-of-projective-space`
- `MotivicEtaleKTheory:M.5a`
- `mathlib:CategoryTheory.Pretriangulated.Triangle`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Theorem 15.15 and the display 14.5.5.

  > Let X be a smooth scheme over a perfect field and Z a smooth closed subscheme of X of codimension c. Then there is a Gysin triangle C_* Z_tr(X - Z) to C_* Z_tr(X) to C_* Z_tr(Z)(c)[2c] to C_* Z_tr(X - Z)[1].

  The node is that theorem, with the specialisation to a closed point of a smooth curve written out because it is the acceptance test of this layer.

#### `geometric-motives-rigid` — Geometric motives are rigid

*theorem.*

**Statement.** Assume k admits resolution of singularities. Then the tensor category of geometric motives is rigid: every object has a dual, the natural map from an object to its double dual is an isomorphism, and the internal hom of two objects is the tensor product of the dual of the first with the second and is again a geometric motive. For X smooth of dimension d the dual of the motive of X is the motive with compact support of X untwisted by d and shifted by 2d, and for X smooth projective the motive of X is its own dual up to that twist and shift.

**Hypotheses.**

- k is a perfect field admitting resolution of singularities, the standing hypothesis of the source's lecture.
- Coefficients are the integers in the source's treatment.

**Construction, or proof, in steps.**

1. Construct the dual of an object from the derived internal hom of the ambient category, which is imported.
2. Prove that the canonical map from an object to its double dual is an isomorphism, by reducing to the motive of a smooth projective scheme.
3. Define the internal hom as the tensor product of the dual of the first object with the second and check that it is a geometric motive.
4. Check bi-distributivity of the internal hom over tensor products, and conclude rigidity.
5. Record the identification of the dual of the motive of a smooth scheme with its motive with compact support, twisted and shifted.

**Acceptance.**

- Rigidity is stated for the Tate-stabilised category and not for the effective one; the dual of the motive of a smooth scheme involves a negative twist.
- The double dual map is an isomorphism, which is proved and not assumed.
- For X smooth projective of dimension d the motive of X is isomorphic to its dual twisted by d and shifted by 2d, which matches the duality of Chow motives under the comparison functor.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`
- `MotivicEtaleKTheory:M.5a`
- `mathlib:CategoryTheory.LeftRigidCategory`
- `mathlib:CategoryTheory.ExactPairing`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Lecture 20: Proposition 20.12, Example 20.11, Definition 20.15 and Theorem 20.17.

  > There is a natural isomorphism from M to its double dual for M in DM_gm. If X is smooth of dimension d, the dual M(X) dual is just an untwisting of M_c(X): M_c(X) is RHom(M(X), Z(d))[2d] is M(X) dual (d)[2d]. In particular, if X is projective then M(X) is M(X) dual (d)[2d]. If M and N are two objects of DM_gm, we define their internal Hom to be M dual tensor N. The tensor category DM_gm is rigid.

  The node is those four statements of the source's lecture on geometric motives, taken together because rigidity is proved from the other three.

#### `chow-motives-into-geometric-motives` — Chow motives embed into geometric motives

*comparison.*

**Statement.** Assume k is perfect and admits resolution of singularities. Then Grothendieck's category of effective Chow motives embeds contravariantly into the effective geometric motives with integral coefficients, in the sense that for smooth projective X and Y the group of morphisms of Chow motives from the motive of Y to that of X is isomorphic to the group of morphisms of geometric motives from the motive of X to that of Y. The Lefschetz motive is sent to R(1)[2], so the embedding extends to an embedding of all Chow motives into the geometric motives.

**Hypotheses.**

- k is perfect and admits resolution of singularities.
- X and Y are smooth projective over k and coefficients are the integers.
- The category of effective Chow motives here is the idempotent completion of the category whose morphisms from Y to X are the Chow group of the product in dimension the dimension of X, which is the same category as the one this roadmap constructs.

**Construction, or proof, in steps.**

1. Write the group of morphisms of Chow motives as a Chow group of the product, which by the identification of motivic cohomology with higher Chow groups is a motivic cohomology group of the product.
2. Rewrite that motivic cohomology group as a group of morphisms in the ambient category out of the motive of the product into a twisted shift of the coefficients.
3. Use duality for smooth proper schemes and the cancellation theorem to rewrite it as the group of morphisms from the motive of X to the motive of Y.
4. Check that the assignment is functorial and contravariant, and that the idempotent completion is respected because the geometric motives are a thick subcategory.
5. Check that the Lefschetz motive goes to R(1)[2], and extend the embedding to the Tate-stabilised categories.

**Acceptance.**

- The embedding is contravariant; a covariant statement has the two schemes in the wrong places.
- It is fully faithful on morphism groups, which is what the displayed isomorphism says.
- The hypotheses on k are used: the proof passes through duality and cancellation, both of which are stated under resolution of singularities in the source read.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.1/chow-motive`
- `MotivesAndAlgebraicCycles:MC.1/lefschetz-motive`
- `MotivesAndAlgebraicCycles:MC.4/tate-stabilised-motives`
- `MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow`
- `MotivesAndAlgebraicCycles:MC.4/geometric-motives-rigid`
- `MotivicEtaleKTheory:M.5a`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Proposition 20.1 with its proof, Remark 20.2 and the display 14.5.6.

  > Assume that k is a perfect field which admits resolution of singularities. Then Grothendieck's category of effective Chow motives embeds contravariantly into DM^eff_gm(k, Z), in the sense that if X and Y are two smooth projective schemes, then Hom_Chow(Y, X) is isomorphic to Hom(M(X), M(Y)). The Lefschetz motive L is mapped to Z(1)[2] by 13.17.

  The node is that proposition with the source's four-step computation and the remark identifying the image of the Lefschetz motive, which is what extends the embedding past the effective categories.

#### `motivic-cohomology-higher-chow` — Motivic cohomology is higher Chow groups

*comparison.*

**Statement.** Let X be a smooth separated scheme over a perfect field k. Then for all n and all i at least zero there is a natural isomorphism from the motivic cohomology group in bidegree (n, i) with integral coefficients to Bloch's higher Chow group of X in codimension i and simplicial degree 2i - n. In particular the group in bidegree (2i, i) is the classical Chow group in codimension i, and motivic cohomology vanishes in simplicial degree below zero, that is, for n greater than 2i.

**Hypotheses.**

- X is smooth and separated over a perfect field k.
- Motivic cohomology is the one represented in the ambient category by the twisted shifts of the coefficients, imported from the layer that owns it.
- Higher Chow groups are Bloch's, imported from the layer that owns them.

**Construction, or proof, in steps.**

1. Import the definition of motivic cohomology as morphisms out of the motive of X into a twisted shift of the coefficients.
2. Import Bloch's higher Chow groups with their moving and localisation properties.
3. State the comparison isomorphism in the stated bidegrees and record its naturality in X.
4. Read off the two consequences: the classical Chow group in bidegree (2i, i), and the vanishing above the diagonal that follows because higher Chow groups vanish in negative simplicial degree.

**Acceptance.**

- The bidegree conversion is that the simplicial degree is 2i - n; a comparison with a different conversion fails the specialisation to the classical Chow group.
- The isomorphism is natural in X, which is what makes it a comparison of theories rather than a family of isomorphisms.
- The vanishing statement is a consequence and is worth recording separately, since it is the first sanity check on any implementation.

**Prerequisites.**

- `MotivicEtaleKTheory:M.4`
- `MotivicEtaleKTheory:M.5a`
- `MotivesAndAlgebraicCycles:MC.4/effective-geometric-motives`

**Sources.**

- MVW.2006 — Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, Theorem 19.1, Corollary 19.2 and Vanishing Theorem 19.3.

  > Let X be a smooth separated scheme over a perfect field k, then for all n and i at least 0 there is a natural isomorphism H^{n,i}(X, Z) to CH^i(X, 2i - n). Because CH^i(X, 0) is the classical Chow group CH^i(X) we obtain H^{2i,i}(X, Z) isomorphic to CH^i(X). It is clear from definition 17.1 that CH^i(X, m) = 0 for m < 0.

  The node is that theorem with its two immediate consequences, which the source states in the same place; the two sides of the comparison are imported from the two layers that own them, as the restructuring proposal for this roadmap requires.

---

## MC.5 Nori motives and diagram categories

**Coverage: source_decomposed.** Nori's construction, from Huber and Mueller-Stach: diagrams and representations, the endomorphism coalgebra of a representation, the diagram category as its finite comodules with its generation property, graded multiplicative diagrams with the tensor structure and the bialgebra, localisation of a diagram at a rank one vertex, the diagrams of effective, good and very good pairs, Nori motives with their tensor structure and the localisation statement, the comparison of the three diagrams, cohomology with supports with its long exact sequence and the computation of the twists, and rigidity. The universal property of the diagram category is used and is not proved in the source read, which says so and refers to a separate paper; that is recorded as a gap.

Nori's construction is a machine, and the machine is what this layer plans. Its input is a
*diagram* — a directed graph, not a category — together with a *representation*, which assigns a vector space
to each vertex and a linear map to each edge and is required to respect nothing else. Its output is the
universal abelian category through which the representation factors, realised concretely as the finite
comodules over a coalgebra built from the endomorphisms of the representation restricted to finite
subdiagrams. Tau Ceti already has that target category, `TauCeti.FGComoduleCat`, with its monoidal, symmetric
and rigid structures, so this layer plans the construction and not the comodule theory.

The geometric input is the diagram of pairs: vertices are triples `(X, Y, i)` of a variety, a closed
subvariety and an integer, with functoriality edges against morphisms and coboundary edges raising the degree
by one. Good pairs are those whose relative singular cohomology is concentrated in degree `i`; very good pairs
add affineness and smoothness conditions. The three diagrams give equivalent categories, which is what makes
the definition robust.

One thing this layer does **not** prove: the universal property of the diagram category. The source read here
states it and says in its own introduction that the proof is in a separate paper, which was not obtained. Both
nodes that use it name it, and it is recorded as a gap.

**Planets of this layer** (5): *Diagram and representation*, *Endomorphism coalgebra*, *Diagram category*, *Diagram of effective pairs*, *Nori motives*.

### Nodes (11)

#### `diagram` — Diagrams and their representations

*definition.* **Planet:** *Diagram and representation*.

**Statement.** A small diagram is a directed graph on a set of vertices such that every vertex carries a distinguished identity edge. A diagram is finite if it has finitely many vertices, and a finite subdiagram is a diagram on a finite subset of the vertices together with all edges between them. A representation of a diagram in the category of finitely generated modules over a ring R assigns to every vertex an object and to every edge from one vertex to another a homomorphism between the assigned objects.

**Hypotheses.**

- R is a commutative ring; in the case of interest it is a field of characteristic zero.
- Diagrams are small and carry distinguished identity edges, which the source adds to Nori's original definition and uses when multiplicative structures are considered.
- A representation takes values in finitely generated modules.

**Construction, or proof, in steps.**

1. Define a small diagram as a directed graph with a distinguished identity edge at each vertex.
2. Define finite diagrams and finite subdiagrams.
3. Define a representation as the pair of assignments on vertices and on edges, with no compatibility required beyond the types.
4. Record that any small category gives a diagram, with vertices its objects and edges its morphisms, so that the notion is strictly weaker than that of a functor.

**Acceptance.**

- A representation is not a functor: no compatibility with composition of edges is imposed, because a diagram has no composition.
- Identity edges are part of the data, which matters once multiplicative structures are considered.
- A small category yields a diagram, so every functor yields a representation, but not conversely.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Diagram` | data | A small diagram: vertices, edges and a distinguished identity edge at each vertex. |
| `Diagram.Rep` | data | A representation of a diagram in finitely generated R-modules. |
| `Diagram.finiteSubdiagram` | constructor | The finite subdiagram on a finite set of vertices. |
| `Diagram.ofCategory` | constructor | The diagram attached to a small category. |
| `Diagram.Rep.restrict` | functoriality | The restriction of a representation to a finite subdiagram. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.5/endomorphism-coalgebra`: the coalgebra is built from the endomorphisms of the restrictions of a representation to finite subdiagrams
- `MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram`: the diagram of effective pairs is an instance, with vertices triples of a variety, a closed subvariety and an integer

**Unit tests.** A plausible wrong definition fails one of these.

- `identity_edges`: Every vertex carries an identity edge; a directed graph without them is not a diagram in this sense.
- `representation_is_not_a_functor`: A representation of the diagram of a category need not respect composition, so the forgetful map from functors to representations is not surjective.
- `finite_subdiagrams_are_cofiltered`: The finite subdiagrams of a small diagram form a filtered system under inclusion, which is what makes the colimit below well defined.

**Prerequisites.**

- `mathlib:Module.Finite`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definition B.1 and Remark B.2, with the notation list at the start of Section 1.

  > A small diagram D is a directed graph on a set of vertices such that for every vertex there is a distinguished edge id from v to v. A finite subdiagram of a small diagram D is a diagram containing a finite subset of vertices of D and all edges in D between them. We added the notion of identity edges to Nori's definition.

  The node is that definition together with the notation for representations given at the start of Section 1: a representation assigns to every vertex an object and to every edge a homomorphism.

#### `endomorphism-coalgebra` — The endomorphism coalgebra of a representation

*construction.* **Planet:** *Endomorphism coalgebra*.

**Statement.** Let T be a representation of a diagram in finitely generated R-modules. For each finite subdiagram F let the endomorphism ring of the restriction of T to F be the subring of the product over the vertices of F of the endomorphism rings of the assigned modules, cut out by the condition that the components commute with the maps assigned to the edges of F. Taking R-duals and passing to the filtered colimit over finite subdiagrams produces an R-coalgebra attached to T.

**Hypotheses.**

- T is a representation of a small diagram in finitely generated R-modules; for the coalgebra structure R is a field or a Dedekind domain and the values are projective.
- The colimit is over the filtered system of finite subdiagrams.

**Construction, or proof, in steps.**

1. Define the endomorphism ring of a restriction as the displayed subring of a finite product.
2. Take the R-dual of each such ring, which is again finitely generated under the hypotheses, and check that the dual of a ring is a coalgebra.
3. Check that an inclusion of finite subdiagrams gives a map of duals in the right direction, so the system is filtered and its colimit exists.
4. Define the coalgebra as that colimit.

**Acceptance.**

- The construction takes duals, so the colimit is over a filtered system and not a limit; this is what makes the coalgebra a union of finite pieces.
- The endomorphism ring is cut out by commuting with the edge maps, so it depends on the edges and not only on the vertices.
- Over a field the dual of a finite dimensional algebra is a coalgebra, which is the case the construction is used in.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Diagram.Rep.endRing` | data | The endomorphism ring of the restriction of T to a finite subdiagram. |
| `Diagram.Rep.coalgebra` | data | The coalgebra attached to T, the colimit of the duals. |
| `Diagram.Rep.endRing_mem_iff` | characterisation | A tuple of endomorphisms lies in the ring exactly when it commutes with every edge map of the subdiagram. |
| `Diagram.Rep.colimit` | structure | The filtered colimit over finite subdiagrams, with the transition maps. |
| `Diagram.Rep.comodule` | compatibility | Each value of T is a comodule over the coalgebra. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.5/diagram-category`: the diagram category is the category of finite comodules over this coalgebra
- `MotivesAndAlgebraicCycles:MC.6/comparison-algebra`: the comparison algebra of two representations is built the same way from homomorphisms instead of endomorphisms

**Unit tests.** A plausible wrong definition fails one of these.

- `one_vertex`: For a diagram with one vertex and only its identity edge the coalgebra is the dual of the endomorphism algebra of the assigned module.
- `edges_cut_it_down`: Adding an edge between two vertices shrinks the endomorphism ring, so the coalgebra depends on the edges.
- `colimit_is_filtered`: The coalgebra is the union of the duals over finite subdiagrams; a construction taking a product instead fails already for an infinite diagram of points.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/diagram`
- `mathlib:Coalgebra`
- `mathlib:Module.Finite`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definitions B.5 and B.6.

  > Nori constructs a certain universal abelian category C(T) attached to a diagram and a representation T. Let T be a representation of D in R-Mod. For each finite subdiagram F of D let End(T restricted to F) be the ring of endomorphisms of the functor T restricted to F, as the subring of the product over p in F of End(T(p)) cut out by commutation with the edges.

  The node is that construction, with the passage to duals and the filtered colimit written out because they are what produce a coalgebra rather than a ring.

#### `diagram-category` — The diagram category and its universal property

*construction.* **Planet:** *Diagram category*.

**Statement.** Let T be a representation of a diagram D in finitely generated R-modules. The diagram category of the pair is the category of comodules over the endomorphism coalgebra of T that are finitely generated over R. It comes with a faithful functor to finitely generated R-modules through which T factors, and it is the universal abelian category with that property: every representation of D in an R-linear abelian category with a faithful forgetful functor to R-modules factors through it. As an abelian category it is generated by the objects attached to the vertices, and every object is a subquotient of a finite direct sum of such objects.

**Hypotheses.**

- T is a representation of a small diagram in finitely generated R-modules.
- R is a field in the case used here.

**Construction, or proof, in steps.**

1. Define the category as the finitely generated comodules over the endomorphism coalgebra.
2. Construct the faithful functor to R-modules and the factorisation of T through it.
3. State the universal property, and record that the full proof of universality is not carried out in the source read here: the source attributes it to a separate paper and says so.
4. Prove the generation statement: the subcategory generated by the objects attached to the vertices contains everything, and every object is a subquotient of a finite direct sum of them.
5. Record that an edge whose assigned map is an isomorphism gives an isomorphism in the diagram category.

**Acceptance.**

- The category is abelian by construction, being a comodule category, and the functor to R-modules is faithful.
- Generation is by subquotients of finite direct sums, not by direct sums alone.
- The universal property is the point of the construction and is the one statement this blueprint does not have a full proof of in the source read; it is recorded as a gap.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Diagram.category` | data | The diagram category of a representation, the finite comodules over its coalgebra. |
| `Diagram.category.fibre` | data | The faithful functor to finitely generated R-modules. |
| `Diagram.category.factors` | characterisation | The representation factors through the diagram category. |
| `Diagram.category.universal` | universal-property | Every representation into an R-linear abelian category with a faithful forgetful functor factors uniquely. |
| `Diagram.category.subquotient` | structure | Every object is a subquotient of a finite direct sum of the objects attached to vertices. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`: Nori motives are the diagram category of the diagram of good pairs with singular cohomology
- `MotivesAndAlgebraicCycles:MC.6/tensor-automorphism-group`: the motivic Galois group is the group of tensor automorphisms of the fibre functor of this category

**Unit tests.** A plausible wrong definition fails one of these.

- `comodule_description`: The diagram category is the category of finite comodules over the endomorphism coalgebra, so it is abelian and has a faithful fibre functor.
- `generation`: Every object is a subquotient of a finite direct sum of the objects attached to vertices; generation by direct sums alone is false.
- `isomorphism_edges`: If an edge is sent to an isomorphism by the representation then the corresponding map in the diagram category is an isomorphism.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/endomorphism-coalgebra`
- `tauceti:TauCeti.FGComoduleCat`
- `mathlib:CategoryTheory.Abelian`
- `mathlib:CategoryTheory.Functor.Faithful`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Section 1, the notation list, and Proposition B.9.

  > Let C(D, T) be its associated diagram category. It is the universal abelian category with a functor f_T to Q-Mod such that T factors via f_T. C(D, T) arises as the A(T)-comodules finite dimensional over Q for a coalgebra A(T). As an abelian category C(T) is generated by the objects attached to the vertices, and each object is a subquotient of a finite direct sum of them.

  The node is that description together with Proposition B.9; the source states that the proof of universality is in a separate paper, which this blueprint records as a gap rather than as something read.

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Section 1, the paragraph on what is missing from the account.

  > What is missing from our account is the proof of universality of Nori's diagram category for a diagram with a representation. The paper by von Wangenheim provides full details.

  Cited so that the node's reliance on an unread source for the universal property is recorded in the packet itself.

#### `graded-multiplicative-diagram` — Graded multiplicative diagrams and the tensor structure

*construction.*

**Statement.** A graded diagram is a diagram with an integer grading on its vertices. A commutative multiplicative structure on it is a product on vertices, additive on the grading, together with a unit vertex and with edges implementing the unit, commutativity and associativity isomorphisms. A representation is unital and graded multiplicative if it carries the corresponding isomorphisms of modules. For such data the diagram category is a commutative and associative tensor category with unit and the fibre functor is a tensor functor, and if R is a field or a Dedekind domain the endomorphism coalgebra carries a natural structure of a commutative bialgebra with unit and counit.

**Hypotheses.**

- The diagram is graded with a commutative product structure with unit.
- The representation is unital and graded multiplicative with values in projective modules of finite type.
- For the bialgebra statement R is a field or a Dedekind domain.

**Construction, or proof, in steps.**

1. Define the grading and the product on vertices, with the unit vertex and the three families of structural edges.
2. Define what it means for a representation to be unital and graded multiplicative.
3. Construct the tensor product on the diagram category by comparing finite subdiagrams F and F' with the property that the products of vertices of F lie in F'.
4. Check that the fibre functor is a tensor functor and that the constraints satisfy the coherence axioms.
5. Construct the bialgebra structure on the coalgebra under the hypothesis on R.
6. Record that the construction depends on a sign convention making the boundary edges compatible with cup products in the first variable and compatible up to sign in the second.

**Acceptance.**

- The tensor structure exists on the diagram category and not merely on the values of the representation.
- The sign convention is part of the data; the source flags that properties of the tensor structure depend on a choice of signs for the boundary maps.
- Over a field the coalgebra becomes a bialgebra, which is what makes the Tannakian theory available.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Diagram.graded` | data | A grading on the vertices of a diagram. |
| `Diagram.multiplicative` | data | A commutative product structure with unit on a graded diagram. |
| `Diagram.Rep.unitalGraded` | data | A unital graded multiplicative representation. |
| `Diagram.category.tensor` | structure | The tensor structure on the diagram category, with the fibre functor a tensor functor. |
| `Diagram.Rep.bialgebra` | instance | The bialgebra structure on the coalgebra, over a field or a Dedekind domain. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.5/nori-tensor-category`: the tensor structure on Nori motives is this construction applied to the diagram of good pairs
- `MotivesAndAlgebraicCycles:MC.6/tensor-automorphism-group`: the group of tensor automorphisms is taken with respect to this tensor structure

**Unit tests.** A plausible wrong definition fails one of these.

- `unit_object`: The unit vertex gives the unit object of the tensor category.
- `grading_is_additive`: The product of vertices adds the grading; a product that does not is not a multiplicative structure in this sense.
- `fibre_is_tensor`: The fibre functor takes the tensor product of two objects to the tensor product of the underlying modules.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/diagram-category`
- `tauceti:TauCeti.FGComoduleCat.instMonoidalCategory`
- `tauceti:TauCeti.FGComoduleCat.instSymmetricCategory`
- `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definition B.14 and Proposition B.16.

  > Let D be a graded diagram with commutative product structure with unit and T a unital graded representation of D in R-Proj. (1) Then C(T) is a commutative and associative tensor category with unit and T from C(T) to R-Mod is a tensor functor. (2) If in addition R is a field or a Dedekind domain, the coalgebra A(T) carries a natural structure of commutative bialgebra with unit and counit.

  The node is that definition and proposition, with the sign convention the source flags in the proof of Theorem 1.6 recorded as an acceptance point.

#### `diagram-localisation` — Localisation of a diagram at an invertible vertex

*construction.*

**Statement.** Let T be a graded multiplicative unital representation of a diagram of effective objects whose value at a chosen vertex is locally free of rank one over R. Then T extends uniquely to a graded multiplicative representation of the localised diagram, whose vertices are the original ones together with an integer twist, with the value at a twisted vertex the original value tensored with the chosen rank one value to that power. The diagram category of the localised diagram is the localisation of the effective diagram category at the object attached to the chosen vertex, and the coalgebra of the localised diagram is the localisation of the effective coalgebra at the corresponding group-like element.

**Hypotheses.**

- T is graded multiplicative and unital with values in projective modules of finite type.
- The chosen vertex has value locally free of rank one, which is the assumption the source isolates.
- The localisation of the diagram adds an integer twist to each vertex.

**Construction, or proof, in steps.**

1. Record the assumption on the chosen vertex.
2. Construct the extension of T to the localised diagram by the displayed formula on vertices and edges, and check uniqueness.
3. Check that the extension is multiplicative and unital with the induced choices.
4. Identify the diagram category of the localised diagram with the localisation of the effective one at the object attached to the chosen vertex.
5. Identify the coalgebra with the localisation of the effective coalgebra at the group-like element attached to that object.

**Acceptance.**

- The assumption of rank one is essential: the localisation is at an invertible object and there is nothing to invert otherwise.
- The extension is unique, so the localised theory is determined by the effective one together with the choice of vertex.
- Localising the coalgebra at a group-like element is the algebraic counterpart of inverting the corresponding object.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Diagram.localise` | data | The localised diagram, with vertices the original ones together with an integer twist. |
| `Diagram.Rep.extend` | constructor | The unique extension of a representation to the localised diagram. |
| `Diagram.localise.category` | characterisation | The diagram category of the localised diagram is the localisation of the effective one. |
| `Diagram.localise.coalgebra` | compatibility | The coalgebra is the localisation at the corresponding group-like element. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`: Nori motives are the diagram category of the localisation of the effective diagram at the pair given by the multiplicative group and the point one
- `MotivesAndAlgebraicCycles:MC.6/formal-periods`: the algebra of formal periods is the localisation of the effective one at the period of that same pair

**Unit tests.** A plausible wrong definition fails one of these.

- `rank_one_needed`: If the chosen value has rank two the extension does not exist as stated; the assumption is not decorative.
- `uniqueness`: Two extensions agreeing on the effective part agree.
- `localisation_of_the_category`: The diagram category of the localised diagram is the localisation at the invertible object, so its objects are twists of effective ones.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`
- `MotivesAndAlgebraicCycles:MC.5/endomorphism-coalgebra`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Assumption B.20, Lemma B.21 and Proposition B.22.

  > Let T be a graded multiplicative unital representation of D^eff with values in R-Proj such that T(f_0) is locally free of rank 1 as R-module. T extends uniquely to a graded multiplicative representation of D such that T(f(n)) = T(f) tensor T(f_0) to the n for all vertices and T(alpha(n)) = T(alpha) tensor T(id) to the n for all edges.

  The node is that assumption with the lemma and proposition that follow it; the identification of the localised diagram category with a localisation of the effective one is Proposition B.22, which the source uses to prove the corresponding statement for Nori motives.

#### `effective-pairs-diagram` — The diagrams of effective pairs, good pairs and very good pairs

*definition.* **Planet:** *Diagram of effective pairs*.

**Statement.** Work over the rational numbers, with variety meaning a reduced separated scheme of finite type. The diagram of effective pairs has as vertices the triples consisting of a variety X, a closed subvariety Y of X and an integer i, and two kinds of edges: for every morphism from X to X' carrying Y into Y' a functoriality edge from the triple on X' to the triple on X in the same degree, and for every chain of closed subschemes Z inside Y inside X a coboundary edge from the triple on Y and Z in degree i to the triple on X and Y in degree i plus one. The diagram is graded by i. The subdiagram of effective good pairs is the full subdiagram of triples for which the relative singular cohomology of the pair vanishes outside degree i, and that of effective very good pairs is the full subdiagram of good pairs with X affine, the complement of Y in X smooth, and either X of dimension i and Y of dimension i minus one, or X equal to Y of dimension less than i. The diagrams of pairs, good pairs and very good pairs are the localisations of these at the vertex given by the multiplicative group, the point one, and degree one.

**Hypotheses.**

- The base field is the rational numbers and coefficients are rational; the source notes that Nori's machine also works with integral coefficients.
- Variety means a reduced separated scheme of finite type over the base field.
- Y is a closed subvariety of X, and for the coboundary edges Z is a closed subscheme of Y.

**Construction, or proof, in steps.**

1. Define the vertices and the two kinds of edges, with the direction of each edge as displayed.
2. Define the grading by the integer i and check that the coboundary edges raise it by one.
3. Define the good pairs by the vanishing condition on relative singular cohomology, and add the freeness condition on the surviving group that the appendix imposes.
4. Define the very good pairs by the four geometric conditions.
5. Localise all three diagrams at the vertex given by the multiplicative group with the point one in degree one.

**Acceptance.**

- The functoriality edges go against the morphisms, since singular cohomology is contravariant, and the coboundary edges raise the degree by one.
- A good pair is a condition on the pair and the degree together; the same pair in a different degree is a different vertex and need not be good.
- The very good condition includes affineness and smoothness of the complement, which is what the appendix on the basic lemma is needed for.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `PairDiagram.eff` | data | The diagram of effective pairs. |
| `PairDiagram.good` | data | The full subdiagram of good pairs. |
| `PairDiagram.veryGood` | data | The full subdiagram of very good pairs. |
| `PairDiagram.grading` | projection | The grading by the integer of a triple. |
| `PairDiagram.localised` | constructor | The localisation at the pair given by the multiplicative group and the point one in degree one. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`: Nori motives are the diagram category of the diagram of good pairs
- `MotivesAndAlgebraicCycles:MC.5/diagram-comparison`: the three diagrams are compared and give equivalent categories
- `MotivesAndAlgebraicCycles:MC.6/formal-periods`: the generators of the algebra of formal periods are indexed by effective pairs

**Unit tests.** A plausible wrong definition fails one of these.

- `gm_is_good`: The triple given by the multiplicative group, the point one and degree one is a good pair, since the relative cohomology is concentrated in degree one.
- `degree_matters`: The same pair in a degree where its relative cohomology does not vanish is not a good pair.
- `coboundary_raises_degree`: A coboundary edge goes from degree i to degree i plus one; an edge preserving the degree cannot represent the connecting map of a triple.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/diagram`
- `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`
- `SchemeAndStackFoundations:SF.3`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definition 1.1, parts (1), (2) and (3), with Definition D.1.

  > The diagram D^eff of effective pairs consists of triples (X, Y, i). There are two types of edges: functoriality, for every f from X to X' with f(Y) inside Y' an edge from (X', Y', i) to (X, Y, i); and coboundary, for every chain X, Y, Z an edge from (Y, Z, i) to (X, Y, i+1). The diagram is graded by i. The effective good pairs are the triples with H^j(X(C), Y(C); Q) zero unless j = i.

  The node is that definition together with the very good pairs of part (3) and the freeness condition Definition D.1 adds to the notion of a good pair.

#### `nori-motives` — Nori motives

*definition.* **Planet:** *Nori motives*.

**Statement.** The category of effective mixed Nori motives is the diagram category of the diagram of effective good pairs with respect to the representation given by relative singular cohomology of the complex points with rational coefficients, and the category of mixed Nori motives is the diagram category of its localisation. For a good pair the corresponding object is written as the Nori cohomology of the pair in that degree, and the twisted unit is defined as the first Nori cohomology of the multiplicative group relative to the point one.

**Hypotheses.**

- The base field is the rational numbers and the coefficients are rational.
- The representation sends a triple to the relative singular cohomology of the complex points in degree i.
- The categories are the diagram categories of the corresponding diagrams.

**Construction, or proof, in steps.**

1. Take the diagram of effective good pairs and the representation by relative singular cohomology.
2. Form the diagram category, which is the category of finite comodules over the endomorphism coalgebra.
3. Form the localised diagram category and record that it is the localisation of the effective one at the twisted unit.
4. Define the twisted unit as the first Nori cohomology of the multiplicative group relative to the point one, and the higher twists as its tensor powers.

**Acceptance.**

- The twist is defined as a cohomology object of an explicit pair and not axiomatically.
- The effective category sits inside the localised one, and the localisation is at that object.
- The definition is unconditional: no conjecture is used to produce the category.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `NoriMotives.eff` | data | The category of effective mixed Nori motives. |
| `NoriMotives` | data | The category of mixed Nori motives. |
| `NoriMotives.ofGoodPair` | constructor | The object attached to a good pair. |
| `NoriMotives.twist` | data | The twisted unit and its tensor powers. |
| `NoriMotives.fibre` | data | The fibre functor given by singular cohomology. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.6/tensor-automorphism-group`: the motivic Galois group is the tensor automorphism group of the fibre functor of this category
- `MotivesAndAlgebraicCycles:MC.6/period-torsor`: the torsor statement is about this category and its two fibre functors

**Unit tests.** A plausible wrong definition fails one of these.

- `twist_is_the_multiplicative_group`: The twisted unit is the first Nori cohomology of the multiplicative group relative to the point one; a definition by fiat does not connect to periods.
- `effective_inside`: The effective category is a full subcategory of the localised one.
- `fibre_functor_is_faithful`: Singular cohomology is a faithful exact functor on this category, which is what makes it a fibre functor.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/diagram-category`
- `MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram`
- `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definition 1.3 and Definition 1.11.

  > The category of effective mixed Nori motives MM^eff_Nori is defined as the diagram category C(D^eff_Nori, H^*), and MM_Nori as C(D_Nori, H^*). For a good pair (X, Y, i) we write H^i_Nori(X, Y) for the corresponding object in MM_Nori. We put 1(-1) = H^1_Nori(G_m, {1}) in MM^eff_Nori.

  The node is those two definitions; the representation is the one fixed just above Definition 1.3, relative singular cohomology with rational coefficients.

#### `nori-tensor-category` — Nori motives form a tensor category and the localisation statement

*theorem.*

**Statement.** The definition of Nori motives agrees with Nori's original one. The effective category and the localised category are commutative tensor categories with a faithful fibre functor given by singular cohomology, and the localised category is the localisation of the effective one at the twisted unit.

**Hypotheses.**

- The diagram of effective good pairs with its grading and product structure, and the representation by singular cohomology, are as defined above.
- The product of two pairs is the pair given by the product of the varieties with the union of the two mixed subvarieties, and the unit is the spectrum of the base field with the empty subvariety in degree zero.
- Properties of the tensor structure depend on a sign convention for the boundary maps, which is fixed once.

**Construction, or proof, in steps.**

1. Check that the diagram of effective good pairs is graded and carries a commutative multiplicative structure with unit, given by the displayed product of pairs.
2. Check that singular cohomology is a graded multiplicative unital representation, which is where the sign convention is fixed: the boundary is compatible with cup products in the first variable and compatible up to sign in the second.
3. Apply the tensor structure construction for graded multiplicative diagrams.
4. Check that the pair given by the multiplicative group and the point one satisfies the rank one assumption, and apply the localisation statement.
5. Compare with the description in the literature as comodules over a localised ring and conclude that the two definitions agree.

**Acceptance.**

- The sign convention is part of the theorem; the source states that properties of the tensor structure depend on it.
- The localisation statement identifies the localised category with the localisation of the effective one, which is what makes the twist invertible.
- The fibre functor is faithful, which is what allows Tannakian arguments later.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`
- `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`
- `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Theorem 1.6 with its proof.

  > (1) This definition is equivalent to Nori's original definition. (2) MM^eff_Nori and MM_Nori are commutative tensor categories with a faithful fiber functor H^*. (3) MM_Nori is the localization of MM^eff_Nori with respect to 1(-1). Properties (2) and (3) depend on a sign convention such that the boundary map is compatible with cup products in the first variable and up to sign in the second.

  The node is that theorem with the source's proof, including the sign convention it flags and the two appendix results it applies.

#### `diagram-comparison` — Pairs, good pairs and very good pairs give the same category

*theorem.*

**Statement.** The diagram categories of the diagram of all effective pairs and of the diagram of effective very good pairs, both with respect to singular cohomology, are equivalent as abelian categories to the category of effective Nori motives, and the same holds after localisation. Moreover every object of the effective category is a subquotient of a direct sum of objects attached to good pairs of a particularly simple form: the complement of a divisor in a smooth projective variety, relative to the corresponding piece of a second divisor, where the union of the two divisors has normal crossings.

**Hypotheses.**

- The three diagrams are as defined above and the representation is singular cohomology.
- For the last statement resolution of singularities over a field of characteristic zero is used.

**Construction, or proof, in steps.**

1. Observe that the inclusions of diagrams induce faithful functors between the three diagram categories.
2. Represent the diagram of all effective pairs inside the diagram category of very good pairs, using the triangulated functor on bounded complexes of varieties that the appendix on good pairs provides, and check that restricting the representation to the very good pairs returns singular cohomology up to natural isomorphism.
3. Deduce from the universal property a functor in the other direction whose composite with the first is the identity, hence that both functors are equivalences.
4. For the generation statement use that every object is a subquotient of a direct sum of objects of very good pairs, then apply resolution of singularities to replace a very good pair by one of the displayed normal crossings form, using proper base change in the form of excision.

**Acceptance.**

- The three diagrams give equivalent categories, so nothing depends on which one is used; this is what makes the definition robust.
- The generators have the displayed normal crossings form, but the source explicitly does not claim that the corresponding relations are all captured by the smaller diagram.
- The comparison is an equivalence of abelian categories, and after localisation an equivalence of tensor categories.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`
- `MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram`
- `MotivesAndAlgebraicCycles:MC.5/diagram-category`
- `mathlib:CategoryTheory.Equivalence`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Corollary 1.7 with its proof, Corollary 1.8 and Remark 1.9.

  > The diagram categories of D^eff and of the very good effective diagram are equivalent to MM^eff_Nori as abelian categories, and those of D and of the very good diagram to MM_Nori. Every object of MM^eff_Nori is a subquotient of a direct sum of objects H^i_Nori(X, Y) with X = W minus W_infinity and Y = W_0 minus the intersection, W smooth projective and the union of the divisors normal crossings.

  The node is those two corollaries; Remark 1.9, which says that it is not clear whether the smaller diagram has enough relations, is recorded as an acceptance point.

#### `cohomology-with-supports` — Cohomology with supports and the long exact sequence in Nori motives

*theorem.*

**Statement.** Let Z be a closed subscheme of a variety X. Then there is a natural object of the category of Nori motives representing cohomology with supports in Z, and a natural long exact sequence relating it, the Nori cohomology of X and the Nori cohomology of the complement of Z in X. Moreover, for X smooth and Z smooth irreducible closed of pure codimension n the object in degree twice n is the n-th negative twist of the unit; the same holds for the top cohomology of a projective variety of dimension n and for the cohomology of projective space in degree twice n.

**Hypotheses.**

- X is a variety over the rational numbers and Z a closed subscheme; for the computations X is smooth and Z smooth irreducible of pure codimension n.
- The functor on complexes of varieties constructed in the appendix on good pairs is used.

**Construction, or proof, in steps.**

1. Apply the functor from bounded complexes of varieties to the bounded derived category of the diagram category to the cone of the inclusion of the complement into X, and define the object with supports as its cohomology.
2. Read off the long exact sequence from the natural triangle relating the three complexes.
3. Compute the top cohomology of projective space by embedding projective spaces linearly into larger ones and reducing to the projective line.
4. Deduce the computations for a projective variety of dimension n and for a smooth pair of codimension n.

**Acceptance.**

- The long exact sequence is natural and is obtained from a triangle, not assembled by hand.
- The three computations identify twists of the unit, which is what makes the Tate objects of this category geometric.
- For Z a point in a smooth curve the statement gives the second cohomology with supports as the negative first twist of the unit.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`
- `MotivesAndAlgebraicCycles:MC.5/diagram-comparison`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Corollary 1.10, Lemma 1.12 and Proposition D.3.

  > Let Z inside X be a closed immersion. Then there is a natural object H^i_Z(X) in MM_Nori representing cohomology with supports, and a natural long exact sequence H^i_Z(X) to H^i_Nori(X) to H^i_Nori(X minus Z) to H^{i+1}_Z(X). (1) H^{2n}_Nori(P^N) = 1(-n) for N at least n at least 0. (3) For X smooth and Z smooth irreducible closed of pure codimension n, H^{2n}_Z(X) is 1(-n).

  The node is that corollary together with the three computations of Lemma 1.12, which the source proves in the same place and which fix the twists.

#### `nori-rigidity` — Rigidity of Nori motives

*theorem.*

**Statement.** The category of Nori motives is rigid. The criterion used is that an abelian tensor category with a faithful fibre functor, generated by an object admitting a perfect duality, is rigid; the geometric input is that for a very good pair arising from a smooth projective variety of dimension i with two divisors whose union has normal crossings, there is a morphism from the unit into the tensor product of the Nori cohomology of the pair with the Nori cohomology of the complementary pair, twisted by i, whose image under the fibre functor is dual to a perfect pairing.

**Hypotheses.**

- The pairs involved are very good and arise from a smooth projective variety with a normal crossings divisor as displayed.
- The fibre functor is singular cohomology, which is faithful.
- For the reduction to such generators, resolution of singularities is used.

**Construction, or proof, in steps.**

1. State the duality morphism for the displayed pairs and check that the fibre functor takes it to a perfect pairing, which is Poincare duality for the corresponding relative cohomology groups.
2. Reduce an arbitrary generator to one of the displayed form using the generation statement and the remark that enlarging the closed subscheme makes the dual very good as well.
3. Apply the rigidity criterion of the appendix to the subcategory generated by such an object.
4. Conclude rigidity of the whole category, since it is generated by such objects.

**Acceptance.**

- Rigidity is proved and not assumed; it is what makes the Tannakian formalism applicable.
- The geometric input is Poincare duality for the relative cohomology of a very good pair, transported through the fibre functor.
- The criterion needs the fibre functor to be faithful, which it is.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`
- `MotivesAndAlgebraicCycles:MC.5/diagram-comparison`
- `tauceti:TauCeti.FGComoduleCat.instRigidCategory`
- `mathlib:CategoryTheory.LeftRigidCategory`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Lemma 1.13 with Remark 1.9, and Definitions C.1 and C.2 with Lemma C.3.

  > Let W be smooth projective of dimension i with W_0 and W_infinity divisors whose union has normal crossings. Set X = W minus W_infinity, Y = W_0 minus the intersection, X' = W minus W_0, Y' = W_infinity minus the intersection, and assume (X, Y) is very good. Then there is a morphism q from the unit to H^i_Nori(X, Y) tensor H^i_Nori(X', Y')(i) such that the dual of H^*(q) is a perfect pairing.

  The node is that lemma together with the rigidity criterion of the appendix that it feeds; the criterion itself is stated there for a general abelian tensor category with a faithful fibre functor.

---

## MC.6 Motivic Galois groups and periods

**Coverage: source_decomposed.** The motivic Galois group and the formal period torsor: the basepoint free notion of a torsor with the two affine group schemes it carries, the group of tensor automorphisms of a fibre functor with Tannakian reconstruction taken from the pinned Tau Ceti library, the comparison algebra of two representations, the space of periods of a diagram and its identification with the comparison algebra, the algebra of formal periods with its three relations and its localisation, the identification of the three algebras, the extension of the second representation to a fibre functor, the torsor structure on the scheme of tensor isomorphisms, and the conclusion that the spectrum of the formal periods is a torsor under the motivic Galois group. The period conjecture is not used anywhere and is not planned.

Two fibre functors on the same Tannakian category are compared by a torsor, not by a group,
because there is no canonical isomorphism between them. The layer therefore begins with a basepoint free
notion of a torsor — a set with a ternary operation satisfying four identities — and records that a torsor
with a chosen point is a group and that an affine torsor carries affine group schemes on both sides.

The motivic Galois group is the group of tensor automorphisms of the fibre functor. Tau Ceti already has the
functor of tensor automorphisms and Tannaka reconstruction for affine group schemes, together with the
equivalence between finite representations and finite comodules, so this layer imports them and plans the
identification of the group with the spectrum of the Hopf algebra of the diagram.

The payoff is a theorem about an algebra presented by generators and relations. The formal periods `P` are
generated by symbols `(X, D, ω, γ)` modulo linearity, a change of variables relation for morphisms of pairs
and a boundary relation for triples, localised at the period of `(𝔾_m, {1})`. The theorem is that `Spec(P)` is
a torsor under the motivic Galois group of Nori motives over `ℚ`. The period conjecture — injectivity of the
evaluation map to `ℂ` — is not used anywhere and is not planned.

**Planets of this layer** (6): *Torsor*, *Motivic Galois group*, *Comparison algebra*, *Space of periods*, *Formal periods*, *Formal period torsor*.

### Nodes (10)

#### `torsor` — Torsors in the sense of a ternary operation

*definition.* **Planet:** *Torsor*.

**Statement.** A torsor is a set together with a ternary operation satisfying the two identities that the operation applied to a triple whose last two entries agree returns the first entry, that the operation applied to a triple whose first two entries agree returns the last entry, and the two associativity identities saying that the operation may be nested in either of the two admissible ways. Any group is a torsor under the operation sending a triple to the first times the inverse of the second times the third; conversely a torsor with a chosen element becomes a group under the operation with that element in the middle, and the two constructions are inverse. A torsor in the category of affine schemes carries affine group schemes acting on the left and on the right, for each of which it is a torsor in the usual sense.

**Hypotheses.**

- The ternary operation is defined on the whole set, with no basepoint chosen.
- For the last statement the torsor is in the category of affine schemes over a base, and the construction of the two group schemes uses quotients by equivalence relations in that category.

**Construction, or proof, in steps.**

1. State the four identities that define a torsor.
2. Prove that a group with the displayed ternary operation is a torsor, by direct computation.
3. Prove that a torsor with a chosen element is a group, and that the two constructions are mutually inverse.
4. For the affine case, construct the left and right group schemes as quotients of the square of the torsor by the two evident equivalence relations, and check that the action morphisms are algebraic.
5. Record that the notion is basepoint free, which is why it is the right formulation for a comparison of two fibre functors.

**Acceptance.**

- The definition is basepoint free; choosing a point turns the torsor into a group and different points give canonically isomorphic groups.
- A group is a torsor and every torsor with a point is a group, so the notion adds nothing for pointed objects and everything for unpointed ones.
- In the affine case there are two group schemes, acting on the two sides, and they need not be identified without a point.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `Torsor` | data | A set with a ternary operation satisfying the four identities. |
| `Torsor.ofGroup` | constructor | The torsor structure on a group. |
| `Torsor.toGroup` | constructor | The group structure on a torsor with a chosen element. |
| `Torsor.group_equiv` | equivalence | The two constructions are mutually inverse. |
| `Torsor.affine` | structure | For an affine torsor, the left and right affine group schemes and their actions. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.6/iso-torsor`: the scheme of tensor isomorphisms between two fibre functors is shown to be a torsor in this sense
- `MotivesAndAlgebraicCycles:MC.6/period-torsor`: the conclusion about formal periods is that they form such a torsor under the motivic Galois group

**Unit tests.** A plausible wrong definition fails one of these.

- `group_is_a_torsor`: A group with the displayed operation satisfies the four identities.
- `pointing_recovers_the_group`: A torsor with a chosen point is a group whose torsor structure is the original one.
- `no_canonical_point`: A torsor need not have a distinguished element, so the two group schemes attached to an affine torsor are not canonically identified.

**Prerequisites.**

- `mathlib:CategoryTheory.Equivalence`
- `tauceti:TauCeti.FGPointRepresentationCat`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Appendix A: the definition of a torsor, Lemmas A.2 and A.3, and Proposition A.6.

  > Let G be a group. Then (g, h, k) = g h inverse k defines a torsor structure on G. Let X be a torsor, e in X. Then G_e = X carries a group structure via g h = (g, e, h). Let X be a torsor in the category of affine schemes. Then there are affine group schemes G_l and G_r operating from the left and the right on X such that X is a G_l- and a G_r-torsor.

  The node is the appendix's definition together with the two lemmas and the proposition; the source notes that this notion of torsor goes back to a 1929 paper of Baer.

#### `tensor-automorphism-group` — The motivic Galois group as tensor automorphisms of the fibre functor

*construction.* **Planet:** *Motivic Galois group*.

**Statement.** Let a neutral Tannakian category be given by a diagram category with a fibre functor. The functor sending a commutative algebra to the group of tensor automorphisms of the fibre functor after extension of scalars to that algebra is represented by an affine group scheme, the spectrum of the Hopf algebra built from the endomorphism coalgebra of the representation; for Nori motives and the fibre functor given by singular cohomology this group scheme is the motivic Galois group. Reconstruction holds: every tensor automorphism of the fibre functor arises from a point of the group scheme, and the finite-dimensional representations of the group scheme are equivalent to the finite comodules over the Hopf algebra, that is, to the objects of the category.

**Hypotheses.**

- The category is the diagram category of a graded multiplicative unital representation over a field, so that the coalgebra is a bialgebra.
- The fibre functor is faithful and exact with values in finite-dimensional vector spaces.
- For rigidity of the category, which makes the bialgebra a Hopf algebra, the rigidity statement of the previous layer is used.

**Construction, or proof, in steps.**

1. Define the functor of tensor automorphisms of the fibre functor on commutative algebras, following the pinned construction of the tensor automorphism functor of a fibre functor.
2. Show that it is represented by the spectrum of the Hopf algebra obtained from the endomorphism coalgebra, using rigidity to produce the antipode.
3. Record the reconstruction statement, that a tensor automorphism comes from a point, in the form available in the pinned library.
4. Record the equivalence between finite representations of the group scheme and finite comodules, which identifies the category with the representations of its motivic Galois group.

**Acceptance.**

- The group is attached to a fibre functor and not to the category alone; two fibre functors give two groups, related by a torsor and not by a canonical isomorphism.
- The construction needs rigidity to produce the antipode, so it is not available before the rigidity of the category is proved.
- The identification with representations of the group is what turns statements about motives into statements about a group scheme.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `MotivicGalois` | data | The affine group scheme of tensor automorphisms of a fibre functor. |
| `MotivicGalois.spec` | characterisation | It is the spectrum of the Hopf algebra attached to the representation. |
| `MotivicGalois.reconstruct` | universal-property | A tensor automorphism of the fibre functor comes from a point of the group scheme. |
| `MotivicGalois.representations` | equivalence | The category is equivalent to the finite representations of the group scheme. |
| `MotivicGalois.depends_on_fibre` | structure | The group is a function of the chosen fibre functor. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.6/period-torsor`: the torsor of formal periods is a torsor under this group
- `MotivesAndAlgebraicCycles:MC.6/iso-torsor`: the scheme of tensor isomorphisms carries actions of the two such groups

**Unit tests.** A plausible wrong definition fails one of these.

- `point_of_the_group`: A tensor automorphism of the fibre functor over the base field is a rational point of the group scheme.
- `representations`: The finite representations of the group scheme are the objects of the category, so a Tate object corresponds to a character.
- `two_fibre_functors`: The groups attached to two fibre functors are not canonically isomorphic; only the torsor between them is canonical.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/nori-motives`
- `MotivesAndAlgebraicCycles:MC.5/nori-rigidity`
- `MotivesAndAlgebraicCycles:MC.5/diagram-category`
- `tauceti:TauCeti.Tannaka.tensorAutFunctor`
- `tauceti:TauCeti.Tannaka.reconstructedPoint`
- `tauceti:TauCeti.fgPointRepresentationCategoryEquivalence`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Lemma 3.2.

  > Assume C(T_1) is a neutral Tannakian category. In this way we obtain two affine group schemes G_1 = Aut tensor (T_1), G_2 = Aut tensor (T_2) and an affine scheme X = X_{1,2} = Iso tensor (T_1, T_2). If A_1, A_2 and A_{1,2} denote the Hopf algebras defined above then we have G_1 = Spec(A_1), G_2 = Spec(A_2), and X = Spec(A_{1,2}).

  The node is the first half of that lemma, the identification of the group of tensor automorphisms of a fibre functor with the spectrum of the corresponding Hopf algebra. The source says the argument follows the Tannakian pattern almost verbatim and refers to Deligne and Milne for it; the pinned library supplies the reconstruction and the equivalence with representations, which is why they are prerequisites.

#### `comparison-algebra` — The comparison algebra of two representations

*definition.* **Planet:** *Comparison algebra*.

**Statement.** Let T_1 and T_2 be two representations of the same diagram in finite dimensional vector spaces. Define the comparison algebra as the filtered colimit over finite subdiagrams of the duals of the spaces of homomorphisms from the restriction of T_1 to the restriction of T_2. It is a commutative ring, with multiplication induced by the tensor structure of the diagram category, and the composition of an endomorphism of the restriction of T_1 with such a homomorphism induces a comultiplication making the comparison algebra a comodule over the coalgebra of T_1.

**Hypotheses.**

- T_1 and T_2 are representations of the same graded multiplicative diagram in finite dimensional vector spaces over a field.
- The colimit is over the filtered system of finite subdiagrams.
- The multiplication requires the multiplicative structure on the diagram, which is where the tensor structure enters.

**Construction, or proof, in steps.**

1. Define the spaces of homomorphisms between the restrictions and their duals, and form the filtered colimit.
2. Construct the multiplication by repeating the construction of the tensor structure on the diagram category with homomorphisms in place of endomorphisms, which is the step the source describes as the hard part.
3. Construct the comultiplication from the composition of endomorphisms of the restriction of T_1 with homomorphisms.
4. Record that when the two representations are equal this is the Hopf algebra of the tensor automorphism group.

**Acceptance.**

- The object is a commutative ring and a comodule, not a Hopf algebra: there is no unit element distinguished by the construction.
- The multiplication is the substantial part of the construction and uses the multiplicative structure of the diagram.
- For de Rham and singular cohomology on the diagram of pairs this is the algebra whose spectrum is the torsor of periods.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `ComparisonAlgebra` | data | The comparison algebra of two representations of a diagram. |
| `ComparisonAlgebra.mul` | structure | The commutative multiplication induced by the tensor structure. |
| `ComparisonAlgebra.comul` | structure | The comodule structure over the coalgebra of the first representation. |
| `ComparisonAlgebra.diagonal` | characterisation | For equal representations it is the Hopf algebra of the tensor automorphism group. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.6/periods-equal-comparison-algebra`: the main theorem identifies the space of periods of a diagram with this algebra
- `MotivesAndAlgebraicCycles:MC.6/iso-torsor`: its spectrum is the scheme of tensor isomorphisms and carries the torsor structure

**Unit tests.** A plausible wrong definition fails one of these.

- `equal_representations`: For T_1 equal to T_2 the comparison algebra is the coalgebra of that representation.
- `commutative`: The multiplication is commutative.
- `colimit_is_filtered`: The algebra is a filtered colimit over finite subdiagrams, so every element comes from a finite subdiagram.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/endomorphism-coalgebra`
- `MotivesAndAlgebraicCycles:MC.5/graded-multiplicative-diagram`
- `mathlib:Coalgebra`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definition 2.1 and Lemma 2.2, with Example 2.3.

  > Let A_1 = A(D, T_1), A_2 = A(D, T_2). Put A_{1,2} = colim over F of the dual of Hom(T_1 restricted to F, T_2 restricted to F), where F runs through all finite subdiagrams of D. A_{1,2} is a commutative ring with multiplication induced by the tensor structure of the diagram category. The operation End(T_1|F) times Hom(T_1|F, T_2|F) to Hom(T_1|F, T_2|F) induces a compatible comultiplication.

  The node is that definition with the lemma that follows it; Example 2.3 records that for de Rham and singular cohomology this induces the operation of the motivic Galois group on the torsor.

#### `period-space-of-a-diagram` — The space of periods of a diagram

*definition.* **Planet:** *Space of periods*.

**Statement.** Let T_1 and T_2 be two representations of a diagram in finite dimensional vector spaces. The space of periods of the pair is the vector space generated by symbols consisting of a vertex, an element of the first representation at that vertex and an element of the dual of the second representation at that vertex, modulo linearity in the two elements and the change of variables relation attached to each edge. It is a commutative algebra, with multiplication given on generators by the product of vertices and the tensor products of the two entries, and there is a natural map from it to the comparison algebra.

**Hypotheses.**

- T_1 and T_2 are representations of the same graded multiplicative diagram in finite dimensional vector spaces.
- The change of variables relation is the one attached to each edge, equating the symbol built from the pullback along the edge on one side with the symbol built from the pushforward on the other.

**Construction, or proof, in steps.**

1. Define the generators and the two families of relations.
2. Check that the displayed multiplication respects the relations, which is immediate from their shape.
3. Construct the natural map to the comparison algebra by sending a generator to the functional on homomorphisms that evaluates a homomorphism at the first entry and pairs the result with the second.
4. Record that the map is a homomorphism of algebras.

**Acceptance.**

- The relations are linearity and change of variables only; no further relation is imposed.
- The multiplication is defined on generators and is well defined precisely because the relations are stable under it.
- The map to the comparison algebra is natural in the diagram and in the two representations.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `PeriodSpace` | data | The space of periods of a pair of representations of a diagram. |
| `PeriodSpace.gen` | constructor | The generator attached to a vertex and two elements. |
| `PeriodSpace.mul` | structure | The commutative multiplication on generators. |
| `PeriodSpace.toComparison` | compatibility | The natural algebra map to the comparison algebra. |
| `PeriodSpace.relations` | characterisation | The two families of relations, linearity and change of variables. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.6/periods-equal-comparison-algebra`: the theorem says the natural map is an isomorphism
- `MotivesAndAlgebraicCycles:MC.6/formal-periods`: the algebra of formal periods is the instance for the diagram of pairs with de Rham and singular cohomology

**Unit tests.** A plausible wrong definition fails one of these.

- `linearity`: The generator is linear in each of its two entries.
- `change_of_variables`: For an edge, the two symbols related by the change of variables relation are equal; this is the relation that makes the space a quotient and not a free object.
- `multiplication_on_generators`: The product of two generators is the generator at the product vertex with the tensor products of the entries.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.6/comparison-algebra`
- `MotivesAndAlgebraicCycles:MC.5/diagram`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definition 2.4 and Proposition 2.5, with the paragraph defining the natural transformation.

  > We define the space of periods P_{1,2} as the Q-vector space generated by symbols (p, omega, gamma), p a vertex of D, omega in T_1(p), gamma in the dual of T_2(p), with relations: linearity in omega and gamma; and change of variables for each edge. P_{1,2} is a commutative Q-algebra with multiplication (p, omega, gamma)(p', omega', gamma') = (p times p', omega tensor omega', gamma tensor gamma').

  The node is that definition with the proposition and the construction of the natural map, all of which the source gives in the same place.

#### `periods-equal-comparison-algebra` — The space of periods is the comparison algebra

*theorem.*

**Statement.** The natural map from the space of periods of a pair of representations of a diagram to their comparison algebra is an isomorphism of algebras. The same statement holds with coefficients in a Dedekind ring as long as the representations take values in projective modules of finite type.

**Hypotheses.**

- T_1 and T_2 are representations of the same diagram in finite dimensional vector spaces over a field, or in projective modules of finite type over a Dedekind ring.
- The natural map is the one constructed with the space of periods.

**Construction, or proof, in steps.**

1. Reduce to a finite subdiagram, defining the space of periods of a finite subdiagram and checking that the colimit of these is the whole space of periods.
2. For a finite subdiagram, identify the space of periods with the dual of the space of homomorphisms between the restrictions, by writing both as quotients of the same free object by the same relations.
3. Pass to the colimit and conclude that the map is an isomorphism.
4. Record that the argument is insensitive to the coefficients, as long as the values are projective of finite type.

**Acceptance.**

- The statement is an isomorphism of algebras and not only of vector spaces.
- The proof is by reduction to finite subdiagrams, which is why the colimit in the definition of the comparison algebra is filtered.
- The extension to Dedekind coefficients is stated in the source and is recorded here because it is what makes the integral version of the theory possible.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.6/period-space-of-a-diagram`
- `MotivesAndAlgebraicCycles:MC.6/comparison-algebra`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Theorem 2.6 with its proof, and Remark 2.7.

  > The above map Psi from P_{1,2} to A_{1,2} is an isomorphism of Q-algebras. For a finite subdiagram F of D let P_{1,2}(F) be the space of periods. This works for coefficients in Dedekind rings as long as the representations take values in projective modules of finite type.

  The node is that theorem with the source's reduction to finite subdiagrams, and the remark on Dedekind coefficients.

#### `formal-periods` — Formal periods

*definition.* **Planet:** *Formal periods*.

**Statement.** The space of effective formal periods is the vector space over the rational numbers generated by symbols consisting of a variety over the rational numbers, a subvariety, a class in relative algebraic de Rham cohomology in degree d and a class in relative singular homology in degree d, modulo three families of relations: linearity in the last two entries; for every morphism of pairs, the equality of the symbol formed with the pullback of a de Rham class and the symbol formed with the pushforward of the homology class; and for every triple of nested subvarieties, the equality of the symbol formed with the connecting map in homology and the symbol formed with the connecting map in de Rham cohomology. It becomes an algebra by the product of pairs with the exterior product of the two entries. The space of formal periods is the localisation of the effective one at the period of the pair given by the multiplicative group, the point one, the logarithmic differential form and the unit circle.

**Hypotheses.**

- The base field is the rational numbers.
- The relative de Rham and singular homology groups are those of the pair, in the same degree d.
- The localisation is at the single displayed element.

**Construction, or proof, in steps.**

1. List the generators and the three families of relations, in the order the source gives them.
2. Define the algebra structure by the product of pairs, with the union of the two mixed products as the subvariety and the exterior products of the two entries.
3. Define the localisation at the displayed period.
4. Record that the definition is a variant of Kontsevich's, which restricts to smooth varieties with a normal crossings divisor, uses top degree differential forms rather than cohomology classes, and imposes the third relation only in a special case.

**Acceptance.**

- All three relations are part of the definition; dropping the third makes the object too large to be a torsor under the motivic Galois group.
- The localisation is at one explicit element, the period of the multiplicative group, which is two pi i.
- The definition does not presuppose any category of mixed motives; it is a presentation by generators and relations.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `FormalPeriods.eff` | data | The algebra of effective formal periods. |
| `FormalPeriods` | data | The algebra of formal periods, the localisation at the period of the multiplicative group. |
| `FormalPeriods.gen` | constructor | The generator attached to a variety, a subvariety, a de Rham class and a homology class. |
| `FormalPeriods.mul` | structure | The algebra structure by products of pairs. |
| `FormalPeriods.eval` | compatibility | The evaluation map to the complex numbers, by integrating the form over the cycle. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.6/formal-periods-equal-comparison-algebra`: the theorem identifies this algebra with the comparison algebra of de Rham and singular cohomology
- `MotivesAndAlgebraicCycles:MC.6/period-torsor`: the torsor statement is about this algebra

**Unit tests.** A plausible wrong definition fails one of these.

- `two_pi_i_is_inverted`: The period of the multiplicative group, which evaluates to two pi i, is invertible in the localised algebra.
- `third_relation_is_needed`: The relation for a triple of nested subvarieties is imposed for every triple, not only in special cases; Kontsevich's variant imposes it only in a special case and the source flags the difference.
- `evaluation_is_an_algebra_map`: The evaluation by integration is an algebra homomorphism to the complex numbers, whose injectivity is the period conjecture and is not claimed.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.6/period-space-of-a-diagram`
- `MotivesAndAlgebraicCycles:MC.5/effective-pairs-diagram`
- `MotivesAndAlgebraicCycles:MC.5/diagram-localisation`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Definition 2.8 with Remark 2.9.

  > P^+ is generated by symbols (X, D, omega, gamma), omega in H^d_dR(X, D), gamma in H_d(X(C), D(C), Q), with relations (1) linearity; (2) for f from X to X' with f(D) inside D', (X, D, f^* omega', gamma) = (X', D', omega', f_* gamma); (3) for Z inside Y inside X, (Y, Z, omega, boundary gamma) = (X, Y, delta omega, gamma). P is the localization of P^+ at the period of (G_m, {1}, dX/X, S^1).

  The node is that definition together with the remark recording the three ways in which it differs from Kontsevich's.

#### `formal-periods-equal-comparison-algebra` — Formal periods are the comparison algebra of de Rham and singular cohomology

*theorem.*

**Statement.** Let the diagram be the diagram of pairs, with the first representation algebraic de Rham cohomology and the second singular cohomology. Then the algebra of formal periods agrees with the space of periods of that pair of representations and with their comparison algebra: the three algebras are canonically isomorphic. Moreover the algebra of formal periods is unchanged if the generators are restricted to those with the variety affine of dimension d, the subvariety of dimension d minus one and their difference smooth.

**Hypotheses.**

- The base field is the rational numbers and the diagram is the diagram of pairs.
- The two representations are algebraic de Rham cohomology and singular cohomology, both in the degree of the vertex.
- For the restriction statement one uses the comparison of the diagram of pairs with the diagram of very good pairs.

**Construction, or proof, in steps.**

1. Identify the generators and relations of the algebra of formal periods with those of the space of periods of the two representations, first in the effective case: the generators match, and the three families of relations match the two families of the general definition once the edges of the diagram of pairs are spelled out.
2. Apply the theorem identifying the space of periods with the comparison algebra.
3. Pass from the effective case to the localised one, using that both sides are localised at the same element.
4. For the restriction statement, run the same argument for the diagram of very good pairs and use the comparison of the two diagram categories.

**Acceptance.**

- The theorem is an identification of three algebras and is what turns a presentation by generators and relations into a Tannakian object.
- The restriction to very good generators is a corollary and is what makes the algebra of Kontsevich-Zagier periods generated by very explicit data.
- The evaluation to the complex numbers plays no part in the theorem; its injectivity is the period conjecture, which the source does not address.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.6/formal-periods`
- `MotivesAndAlgebraicCycles:MC.6/periods-equal-comparison-algebra`
- `MotivesAndAlgebraicCycles:MC.5/diagram-comparison`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Theorem 2.10 with its proof, and Corollaries 2.11 and 2.12.

  > Let D be the diagram of pairs. Let T_1 = H^*_dR (de Rham cohomology) and T_2 = H^* (singular cohomology), then the space of formal periods P agrees with the comparison algebra A_{1,2}. P = P_{1,2} = A_{1,2}. The algebra of formal periods P remains unchanged when we restrict in Definition 2.8 to (X, D, omega, gamma) with X affine of dimension d, D of dimension d - 1 and X minus D smooth.

  The node is that theorem and its two corollaries. The theorem's two parenthetical cross references are misprinted in the version read, which is recorded as a finding of this packet.

#### `fibre-functor-extension` — A second representation extends to a fibre functor

*lemma.*

**Statement.** Let T_1 and T_2 be two representations of a diagram in finite dimensional vector spaces, related by an isomorphism after extension of scalars to a field extension. Then T_2 extends to a fibre functor on the diagram category of T_1.

**Hypotheses.**

- T_1 and T_2 are representations of the same diagram in finite dimensional vector spaces over a field.
- There is an isomorphism between their extensions of scalars to a common extension field.
- The diagram category is that of T_1.

**Construction, or proof, in steps.**

1. Form the abelian category whose objects are pairs of vector spaces together with an isomorphism between their extensions of scalars, and observe that the two representations and the comparison isomorphism together define a representation of the diagram in it.
2. Note that the projection to the first component is compatible with the first representation, so the universal property of the diagram category gives a commuting triangle of functors.
3. Compose with the projection to the second component to obtain the extension of the second representation to the diagram category.
4. Check that the result is exact and faithful, so it is a fibre functor.

**Acceptance.**

- The extension is through the universal property and not by hand; this is where the universality of the diagram category is used.
- The resulting functor is a fibre functor, so both representations give fibre functors on the same category.
- The comparison isomorphism over the extension field is part of the data, and the construction depends on it.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.5/diagram-category`
- `MotivesAndAlgebraicCycles:MC.6/tensor-automorphism-group`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Lemma 3.1 with its proof.

  > T_2 extends to a fiber functor T_2 from C(T_1) to Q-Mod. Consider the abelian category A whose objects are pairs (V_1, V_2) with an isomorphism from V_1 tensor K to V_2 tensor K. The data T_1, T_2 and the comparison define a representation T of D in A. Via the projection to the first component T is compatible with T_1. The universal property gives a commutative diagram of functors.

  The node is that lemma with its proof, which is the place where the universal property of the diagram category is used in the torsor argument.

#### `iso-torsor` — The scheme of tensor isomorphisms is a torsor

*theorem.*

**Statement.** Let the diagram category of the first representation be a neutral Tannakian category, and let the two affine group schemes of tensor automorphisms and the affine scheme of tensor isomorphisms between the two fibre functors be as above. Then there is a natural isomorphism of affine schemes from the scheme of isomorphisms in one direction to the scheme in the other, given by inversion, and both carry the structure of affine torsors in the sense of the ternary operation.

**Hypotheses.**

- The diagram category of the first representation is neutral Tannakian, which for Nori motives is the rigidity statement of the previous layer.
- The two fibre functors are the two representations, extended by the previous lemma.
- The schemes are the spectra of the corresponding Hopf and comparison algebras.

**Construction, or proof, in steps.**

1. Construct the inversion map and check that it is an isomorphism of affine schemes.
2. Construct the ternary operation on the scheme of isomorphisms, as the composite of the first, the inverse of the second and the third.
3. Check the four torsor identities as identities of morphisms of affine schemes, by the commutative diagram the source displays.
4. Record that the group schemes acting on the two sides are the two tensor automorphism groups, as the appendix on torsors provides.

**Acceptance.**

- The torsor structure is basepoint free, which is essential because there is no canonical isomorphism between de Rham and singular cohomology over the rationals.
- The inversion identifies the two schemes of isomorphisms, so the choice of order of the two fibre functors is immaterial.
- The identities are checked at the level of affine schemes and not only on rational points.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.6/torsor`
- `MotivesAndAlgebraicCycles:MC.6/tensor-automorphism-group`
- `MotivesAndAlgebraicCycles:MC.6/comparison-algebra`
- `MotivesAndAlgebraicCycles:MC.6/fibre-functor-extension`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Theorem 3.3 with its proof, and Lemma 3.2.

  > There is a natural isomorphism of affine schemes iota from X_{1,2} to X_{2,1} given by f to f inverse. Furthermore, X_{1,2} and X_{2,1} carry the structure of affine torsors in the sense of appendix A. Using the natural maps above, one obtains a commutative diagram.

  The node is that theorem with Lemma 3.2, which identifies the three schemes with the spectra of the three algebras.

#### `period-torsor` — The spectrum of the formal periods is a torsor under the motivic Galois group

*theorem.* **Planet:** *Formal period torsor*.

**Statement.** The algebra of formal periods over the rational numbers carries a natural torsor structure under the motivic Galois group of Nori's category of mixed motives over the rational numbers: the spectrum of that algebra is a torsor under that group scheme. Equivalently, there is a natural map from the algebra of formal periods to the threefold tensor product of itself with itself, which on period matrices is the rule sending an entry to the sum over two indices of the entry times the inverse entry times the entry.

**Hypotheses.**

- The base field is the rational numbers.
- The two fibre functors are algebraic de Rham cohomology and singular cohomology on Nori motives.
- The motivic Galois group is the tensor automorphism group of the first of them.

**Construction, or proof, in steps.**

1. Identify the algebra of formal periods with the comparison algebra of the two fibre functors.
2. Apply the torsor theorem to that comparison algebra, which yields the map to the threefold tensor product.
3. Identify the group acting on the left with the motivic Galois group, by definition of the latter as the tensor automorphism group of the first fibre functor.
4. Record the formula on period matrices and that the torsors are naturally torsors in the pro-fppf topology.

**Acceptance.**

- The statement is about a torsor structure on an explicitly presented algebra, so it is a theorem about generators and relations and not only an abstract Tannakian statement.
- The period conjecture, the injectivity of the evaluation map to the complex numbers, plays no part and is not used.
- The result is due to Nori and stated without proof by Kontsevich; the source read here supplies the proof.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.6/iso-torsor`
- `MotivesAndAlgebraicCycles:MC.6/formal-periods-equal-comparison-algebra`
- `MotivesAndAlgebraicCycles:MC.6/tensor-automorphism-group`
- `MotivesAndAlgebraicCycles:MC.5/nori-motives`

**Sources.**

- HMS.2014 — Annette Huber and Stefan Mueller-Stach, *On the relation between Nori motives and Kontsevich periods*, Corollary 3.4 with its proof, Theorem 0.2 and Remark 3.5.

  > The algebra of formal periods P has a natural torsor structure under G_mot. By Theorems 2.6 and 2.9 we have A_{1,2} = P = P_{1,2}. The previous theorem defines a natural map P to P tensor P tensor P. Finally note that G_1 = G_mot is the motivic fundamental group by definition. Spec(P) is a torsor under the motivic Galois group of Nori's category of mixed motives over Q.

  The node is that corollary, which is the paper's main theorem as announced in the introduction; the cross reference to Theorem 2.9 in its proof is a misprint recorded as a finding of this packet.

---

## MC.7 Cycle conjectures and proven special cases

**Coverage: partial.** The two conjectures the sources read state precisely, Conjecture C and Conjecture D, each as a typed predicate relative to a chosen Weil cohomology theory, with the register of known cases of Conjecture C and the one unconditional nilpotence statement available in the sources read. Nothing in this packet assumes either conjecture without naming it in its hypotheses.

**Remaining in this layer:**

- The Hodge conjecture and the Tate conjecture are not stated: neither source read here gives a precise statement, and a source that does was not obtained. They are named in the layer's brief and must be added by a continuation job with its own source.
- The Lefschetz standard conjecture in its strong form, and the Hodge standard conjecture, are named in the sources read only in passing and are not stated precisely here.
- The Bloch-Beilinson filtration and Murre's conjectures are in the layer's brief and no source read here states them.
- A motivic t-structure on the geometric motives is in the layer's brief; the source read for the geometric motives says only that a triangulated category is not an abelian category of mixed motives, and no statement is planned.
- The register of proved special cases contains only what Jannsen's remarks report; the three primary sources behind those cases were not obtained, which is recorded as a gap, and a continuation job should obtain them and either confirm or restate each case.

A conjecture is a statement, and a statement needs a source. This layer plans the two
conjectures the sources read state precisely — the algebraicity of the Künneth projectors, and the assertion
that numerical equivalence implies homological equivalence — as typed predicates, each relative to a chosen
Weil cohomology theory, together with the register of known cases of the first and the one unconditional
nilpotence statement the sources supply.

It plans nothing else. The Hodge conjecture, the Tate conjecture, the Lefschetz and Hodge standard
conjectures, the Bloch–Beilinson filtration and a motivic t-structure are all in the layer's brief, and no
source read for this packet states any of them precisely. They are recorded in the coverage record's
`remaining` list with the reason, and in the packet's `gaps`, rather than written from memory. The packet's
`restructure` list proposes dividing this layer into a statements sub-layer and a proved-cases register, since
the two halves have different acceptance tests and different source routes.

**Planets of this layer** (3): *Conjecture C: algebraic Kuenneth projectors*, *Conjecture D: numerical equals homological*, *Smash nilpotence*.

### Nodes (4)

#### `kunneth-conjecture-C` — Conjecture C: algebraicity of the Kuenneth projectors

*definition.* **Planet:** *Conjecture C: algebraic Kuenneth projectors*.

**Statement.** Fix a Weil cohomology theory over k. Conjecture C for a variety X asserts that the Kuenneth components of the class of the diagonal, that is, the components of the cohomology class of the diagonal in the summands of the Kuenneth decomposition of the cohomology of X times X, are algebraic: each is the cohomology class of an algebraic cycle on X times X. Equivalently, in the ring of correspondences modulo numerical equivalence the diagonal has a canonical decomposition into a sum of orthogonal idempotents indexed by the cohomological degrees. The conjecture is stated for a variety and the general conjecture is its assertion for every variety over k.

**Hypotheses.**

- A Weil cohomology theory over k is fixed; the statement depends on it and is written with it named.
- X is a smooth projective variety over k.
- The conjecture is a statement about X, and the unqualified name refers to its assertion for all X.

**Construction, or proof, in steps.**

1. State the Kuenneth decomposition of the cohomology of the product, using the Kuenneth axiom.
2. Define the Kuenneth components of the diagonal as the components of its cycle class in that decomposition.
3. State the conjecture as algebraicity of each component.
4. State the equivalent form in the ring of numerical correspondences, as the existence of a canonical decomposition of the diagonal into orthogonal idempotents indexed by degree.
5. Record that the conjecture is open in general and is a weak form of the Lefschetz standard conjecture.

**Acceptance.**

- The statement is relative to a chosen Weil cohomology theory and to a variety; there is no unqualified predicate.
- The conjecture is an existence statement about algebraic cycles, which is what makes it hard: there is no general method for producing them.
- It is known in the cases listed in the register node and open in general.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `ConjectureC` | data | The predicate on a variety, relative to a chosen Weil cohomology theory. |
| `ConjectureC.kunnethComponents` | data | The Kuenneth components of the class of the diagonal. |
| `ConjectureC.idempotents` | characterisation | The equivalent form: a canonical orthogonal idempotent decomposition of the diagonal modulo numerical equivalence. |
| `ConjectureC.central` | structure | The images of the components modulo numerical equivalence are central and pairwise orthogonal. |
| `ConjectureC.forall` | relation | The general conjecture, the assertion for every variety over k. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.3/radical-of-homological-correspondences`: the corollary on the radical takes this as a hypothesis for a single variety
- `MotivesAndAlgebraicCycles:MC.3/numerical-motives-tannakian`: the Tannakian corollary takes it as a hypothesis for all varieties

**Unit tests.** A plausible wrong definition fails one of these.

- `theory_is_an_argument`: The predicate takes the Weil cohomology theory as an argument; the statement for two theories is two statements.
- `projective_space`: For projective space the components are algebraic, since the diagonal decomposes into the classes of the linear subspaces; this is the easiest positive case.
- `not_a_theorem`: Nothing in this roadmap proves the general conjecture, and no node may take it as an unstated hypothesis.
- `orthogonal_idempotents`: Modulo numerical equivalence the components are orthogonal idempotents summing to the diagonal; a decomposition that is not orthogonal does not give a grading.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/class-of-the-diagonal`
- `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`
- `MotivesAndAlgebraicCycles:MC.0/homological-equivalence`

**Sources.**

- MILNE.MOT — James S. Milne, *Motives - Grothendieck's Dream*, the statement of Conjecture C.

  > Conjecture C. In the ring End(hX) = C^{dim X}_num(X times X), the diagonal has a canonical decomposition into a sum of orthogonal idempotents. Our Conjecture C is a weak form of the Lefschetz standard conjecture.

  The node is that statement, in the equivalent form the source gives it, together with its remark on the relation to the Lefschetz standard conjecture.

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 449, the hypothesis of Corollary 1, and page 450 in Corollary 2.

  > If for a variety X, the Kuenneth components pi^j in H^{2 dim X - j}(X) tensor H^j(X) of the diagonal are algebraic, then the kernel of S is the Jacobson radical. Assume that for every X the Kuenneth components pi^j are algebraic, and denote their images in A_num again by pi^j. The pi^j are central idempotents, with pi^j orthogonal to pi^i for i not equal to j.

  Cited for the cohomological form of the statement and for the fact that the images modulo numerical equivalence are orthogonal central idempotents, which is the bridge between the two formulations.

#### `conjecture-D` — Conjecture D: numerical equivalence implies homological equivalence

*definition.* **Planet:** *Conjecture D: numerical equals homological*.

**Statement.** Fix a Weil cohomology theory over k. Conjecture D asserts that an algebraic cycle numerically equivalent to zero has cohomology class zero, that is, that homological and numerical equivalence agree. Equivalently, using Poincare duality: if there is a cohomology class whose cup product with the class of a given cycle is nonzero, then there is an algebraic cycle whose intersection number with the given cycle is nonzero. The conjecture is what is needed for a Weil cohomology theory to factor through the category of numerical motives.

**Hypotheses.**

- A Weil cohomology theory over k is fixed.
- The conjecture is stated for all varieties and all codimensions unless restricted explicitly.

**Construction, or proof, in steps.**

1. State the conjecture as the implication from numerical to homological triviality.
2. State the equivalent form obtained by Poincare duality, and record that in that form it is an existence statement about algebraic cycles.
3. Record the reason the conjecture is wanted: a correspondence numerically equivalent to zero defines the zero map on motives, and a Weil cohomology theory factors through numerical motives exactly when such a correspondence also acts as zero on cohomology.
4. Record the known cases: in characteristic zero the conjecture holds for abelian varieties and follows from the Hodge conjecture.

**Acceptance.**

- The converse implication, that homological triviality implies numerical triviality, is a theorem and is recorded separately; only this direction is open.
- The conjecture is what makes the category of numerical motives a receptacle for cohomology theories; without it the quotient by numerical equivalence loses information a theory may see.
- The equivalent form is an existence statement for algebraic cycles, which is why no general method attacks it.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `ConjectureD` | data | The predicate, relative to a chosen Weil cohomology theory. |
| `ConjectureD.equiv_dual` | characterisation | The form obtained by Poincare duality, as an existence statement for cycles. |
| `ConjectureD.of_hom_le_num` | relation | One implication is a theorem: homological triviality implies numerical triviality. |
| `ConjectureD.factorisation` | compatibility | Under the conjecture a Weil cohomology theory factors through the numerical motives. |

**Uses.**

- `MotivesAndAlgebraicCycles:MC.3/radical-of-homological-correspondences`: under Conjecture C the kernel of the comparison is the radical, and Conjecture D is the statement that this kernel vanishes
- `MotivesAndAlgebraicCycles:MC.0/homological-equivalence`: the conjecture is the missing converse of the implication recorded there

**Unit tests.** A plausible wrong definition fails one of these.

- `one_direction_is_a_theorem`: Homological triviality implies numerical triviality unconditionally; only the converse is conjectural.
- `divisors`: For divisors on a smooth projective variety the two relations agree, so the conjecture holds in codimension one.
- `not_assumed`: No node of this roadmap assumes the conjecture without naming it in its hypotheses.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.0/homological-equivalence`
- `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`
- `MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation`

**Sources.**

- MILNE.MOT — James S. Milne, *Motives - Grothendieck's Dream*, the statement of Conjecture D with the paragraph following it.

  > Conjecture D. If an algebraic cycle is numerically equivalent to zero, then its cohomology class is zero. By Poincare duality: if there is a cohomology class whose cup product with the class of the cycle is nonzero, then there is an algebraic cycle whose intersection number with it is nonzero. In characteristic zero it is known for abelian varieties and is implied by the Hodge conjecture.

  The node is that statement with the two remarks the source makes about it, including the known cases in characteristic zero.

#### `known-cases-of-conjecture-C` — The register of known cases of Conjecture C

*theorem.*

**Statement.** Conjecture C, the algebraicity of the Kuenneth components of the diagonal, holds in the following cases: for a variety of dimension at most two; for an abelian variety; for every variety when the base field is contained in the algebraic closure of a finite field; and for a product of two varieties for which it holds. Consequently the Tannakian conclusion for numerical motives holds unconditionally when the base field is an algebraic extension of a finite field, and for the subcategory generated by the twisted unit and any family of varieties for which the conjecture is known, in particular for the category generated by abelian varieties over any field.

**Hypotheses.**

- A Weil cohomology theory is fixed, as in the statement of the conjecture.
- Each case is attributed in the source to a separate primary reference: the surface case to Murre, the abelian variety case to Lieberman as reported in Kleiman's survey, and the case of a base field inside the algebraic closure of a finite field to Katz and Messing.
- The product case is proved in the source itself from the Kuenneth formula.

**Construction, or proof, in steps.**

1. Record each case with its attribution.
2. Prove the product case: the Kuenneth components of the diagonal of a product are the sums of the products of the components of the two factors, by the Kuenneth formula.
3. Deduce the two unconditional Tannakian conclusions from the corresponding corollary of the semisimplicity layer.
4. Record that the three individual cases rest on primary sources that were not obtained for this packet, and that this node therefore stands on the source's own report of them.

**Acceptance.**

- The four cases are as listed; in particular no case beyond dimension two is claimed in general.
- The product case is the only one proved in the source read here, and the proof steps say so.
- The two Tannakian consequences are unconditional, unlike the general corollary, and are the ones a downstream layer may use.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.7/kunneth-conjecture-C`
- `MotivesAndAlgebraicCycles:MC.3/numerical-motives-tannakian`
- `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`

**Sources.**

- JANNSEN.1992 — Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*, page 451, Remarks 1 and 2.

  > The assumption of Corollary 1 holds if dim X is at most 2 or X is an abelian variety, and for all X if k is inside the algebraic closure of a finite field. If it holds for X and Y, it holds for X times Y. Corollary 2 holds for every subcategory generated by 1(1) and varieties for which the components are algebraic; in particular the category generated by abelian varieties is Tannakian over any k.

  The node is those two remarks. The three individual cases are attributed there to Murre, to Lieberman as reported by Kleiman, and to Katz and Messing; none of those three papers was obtained for this packet, which is recorded as a gap.

#### `smash-nilpotence` — Smash nilpotence of a difference of rational points

*theorem.* **Planet:** *Smash nilpotence*.

**Statement.** Let X be a geometrically irreducible smooth projective scheme over a field k and let x and x' be k-rational points of X. Then for n large enough the class of the zero cycle given by the n-fold exterior product of the difference of the two points, on the n-fold product of X, is torsion in the Chow group of zero cycles.

**Hypotheses.**

- X is geometrically irreducible, smooth and projective over k.
- x and x' are k-rational points.
- The conclusion is that the class is torsion, over the base field, for n large enough.

**Construction, or proof, in steps.**

1. Reduce to a statement after a finite separable extension of the base field, using that the kernel of the pullback on Chow groups along an algebraic extension is torsion.
2. Use that for an integer invertible in k there is a finite separable extension over which the difference of the two points becomes divisible by that integer in the Chow group of zero cycles.
3. Take exterior products and count divisibility: the n-fold product becomes divisible by a high power, and the kernel of the pullback is torsion, so the class is torsion for n large.
4. Record that the statement is about torsion and not about vanishing.

**Acceptance.**

- The conclusion is torsion, not zero, and it holds only for n large enough.
- The two points are rational; the statement as given does not apply verbatim to closed points of higher degree.
- This is an instance of the general expectation that homologically trivial cycles are smash nilpotent, and it is one of the few unconditional results in that direction available in the sources read here.

**Prerequisites.**

- `MotivesAndAlgebraicCycles:MC.2/chow-groups-under-field-extension`
- `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- STACKS.WEIL — The Stacks Project authors, *The Stacks Project, chapter "Weil Cohomology Theories" (tag 0FFG)*, Lemma 0FH9, with Lemmas 0FH7 and 0FH8.

  > Let X be a geometrically irreducible smooth projective scheme over k. Let x, x' in X be k-rational points. For n large enough the class of the zero cycle ([x] - [x']) times ... times ([x] - [x']) in CH_0(X^n) is torsion. Let n be an integer invertible in k. Then there exists a finite separable extension k'/k such that the pullback of [x] - [x'] to X_{k'} is divisible by n in CH_0(X_{k'}).

  The node is that lemma with the two lemmas its proof uses, which the source proves in the same section; the source attributes the result to the literature on nilpotence.

---

## Gaps

Each of these is something this packet could not establish from the sources read. None is papered over,
and no node depends on one without naming it.

### Algebraic equivalence is not defined by any source read here

The brief of MC.0 asks for rational, algebraic, homological and numerical equivalence with the proved implications between them. Rational equivalence comes with the Chow groups imported from SF.5, numerical equivalence is defined in Milne's expository article and in Jannsen's setting, and homological equivalence is defined relative to a chosen Weil cohomology theory. Algebraic equivalence, the relation generated by moving a cycle in a family over a smooth connected curve, is not defined in any of the six sources read for this packet, and no node of this packet defines it. A continuation job should obtain a free source that states it with the proof that it is adequate, and add the two implications, from rational to algebraic and from algebraic to homological, as nodes of MC.0.

### The universal property of Nori's diagram category is not proved in the source read

The diagram category is used in MC.5 and MC.6 through its universal property, which is what lets a representation into an abelian category with a faithful forgetful functor factor through it; the extension of the second fibre functor in MC.6 is exactly such a factorisation. The source read states the universal property and says in its introduction that the proof of universality of Nori's diagram category for a diagram with a representation is not included in its account and is supplied by a separate paper of von Wangenheim, which was not obtained. The two nodes that use it name it in their statements, and no node of this packet asserts a proof of it.

### The primary sources for the known cases of Conjecture C were not obtained

The register of known cases of the algebraicity of the Kuenneth projectors records four cases: dimension at most two, abelian varieties, base fields inside the algebraic closure of a finite field, and products. Only the product case is proved in a source read for this packet. The other three are attributed by Jannsen to Murre's 1990 paper on the motive of an algebraic surface, to Lieberman as reported in Kleiman's 1968 survey, and to Katz and Messing's 1974 paper, none of which was obtained. The node stands on Jannsen's report of them and says so; a continuation job should obtain the three papers and either confirm each case or restate it with the hypotheses of its own source.

### Deligne's Tannakian criterion was not obtained

The last step of the Tannakian conclusion for numerical motives, after the commutativity constraint has been changed by a sign, applies Deligne's criterion that a rigid abelian tensor category over a field of characteristic zero whose objects have nonnegative integer rank is Tannakian; Jannsen cites it as Theorem 7.1 of Deligne's article on Tannakian categories. That article is not freely available and was not obtained. Everything up to and including the computation that the modified rank is nonnegative is decomposed here from Jannsen's own text; the final implication rests on the cited criterion.

### Kleiman's survey, which Jannsen cites for the trace formula, was not obtained

Jannsen states the trace formula for correspondences as well known and refers to Kleiman's 1968 survey for it. That survey was not obtained. Rather than resting the node on an unread source, the proof steps of the trace formula node derive it from the Kuenneth decomposition of the class of the diagonal, which the Stacks Project proves in the Weil cohomology chapter, together with the self-intersection computation there; the case in which both arguments are the diagonal is exactly that computation. The general case is the same argument with the diagonal replaced by the class of the composite, and the node records that this derivation, not a transcription, is what supports it.

### No source read here states the Hodge or Tate conjectures precisely

MC.7's brief asks for typed statements of the Hodge conjecture, the Tate conjecture, the standard conjectures and the Bloch-Beilinson filtration. The expository article read for this packet states Conjecture C and Conjecture D precisely and mentions the Hodge conjecture, the Tate conjecture and the two standard conjectures only in passing, without statements. This packet therefore plans only the two conjectures it can state from a source, and records the rest in the remaining list of MC.7's coverage. A continuation job should obtain a source that states the others and add them; the layer is deliberately left partial rather than filled with statements written from memory.

## Mistakes found in the sources

Recorded in the packet's `sourceIssues` under PROTOCOL section 18. Every node uses the corrected reading.

### `MotivesAndAlgebraicCycles/E1` (misprint, affects nothing)

**Where.** Huber and Mueller-Stach, arXiv:1105.0865v5, Theorem 2.10, page 11

**Printed.**

> then the space of formal periods P (Definition 2.4) agrees with the comparison algebra A_{1,2} (Definition 2.8). P = P_{1,2} = A_{1,2}.

**Correction.** The two parenthetical references are crossed and neither is right. The space of formal periods P is Definition 2.8; the comparison algebra A_{1,2} is Definition 2.1; Definition 2.4 defines the third term of the display, the space of periods P_{1,2} of a diagram. The sentence should read: the space of formal periods P (Definition 2.8) agrees with the comparison algebra A_{1,2} (Definition 2.1).

**Why.** Checked against the numbering in the same section of the same file. Definition 2.1 puts A_{1,2} equal to the colimit over finite subdiagrams of the dual of the homomorphisms between the two restricted representations. Definition 2.4 defines the space of periods P_{1,2} by generators and relations attached to vertices of the diagram. Definition 2.8 defines the effective formal periods and then P as a localisation. Corollary 3.4, on page 13, cites Definition 2.8 for P, which confirms the intended attribution.

**Existing correction:** new. Searched: the arXiv abstract page for arXiv:1105.0865, which lists v5 of 21 May 2014 as the latest version, with no later version and no comment recording an erratum; the published version's own numbering could not be compared, since this finding is about the version read

### `MotivesAndAlgebraicCycles/E2` (misprint, affects nothing)

**Where.** Huber and Mueller-Stach, arXiv:1105.0865v5, proof of Corollary 3.4, page 13

**Printed.**

> By Theorems 2.6 and 2.9 we have A_{1,2} = P = P_{1,2}

**Correction.** The second reference should be Theorem 2.10. The numbered item 2.9 in that paper is a remark, comparing the definition of formal periods with Kontsevich's; the result that identifies P with P_{1,2} is Theorem 2.10.

**Why.** Checked against the numbering of Section 2 in the same file: 2.1 and 2.4 and 2.8 are definitions, 2.2 and 2.5 are a lemma and a proposition, 2.6 is the theorem that the natural map from P_{1,2} to A_{1,2} is an isomorphism, 2.7 and 2.9 are remarks, and 2.10 is the theorem that P equals P_{1,2}. The displayed chain of three equalities needs exactly 2.6 and 2.10.

**Existing correction:** new. Searched: the arXiv listing for arXiv:1105.0865, where v5 is the most recent version and no erratum is recorded

### `MotivesAndAlgebraicCycles/E3` (misprint, affects nothing)

**Where.** The Stacks Project, tag 0FG0, proof of the composition lemma, in the list of justifications after the displayed chain of equalities

**Printed.**

> The fourth equality follows from the projection formula for p^{1234}_{134}. The fourth equality is that proper pushforward is compatible with composition.

**Correction.** The second occurrence should read: the fifth equality is that proper pushforward is compatible with composition.

**Why.** The displayed computation in that proof is a chain of six expressions, hence five equalities, and the justifications are given in order: the first is the definition of composition, the second is flat pullback against proper pushforward, the third is that the intersection product commutes with the Gysin map of a flat projection, and then two more remain. Naming the fourth twice leaves the fifth unjustified and one justification attached to the wrong step.

**Existing correction:** new. Searched: the current master of the Stacks Project source repository, where the file weil.tex at commit a04446e57ec1fbc252a871afcec7752fb2807b14 still contains both occurrences; the tag page for 0FG0, which displays the same text

### `MotivesAndAlgebraicCycles/E4` (misprint, affects the proof)

**Where.** The Stacks Project, tag 0FG5, proof of part (2)

**Printed.**

> Proof of (2). Recall that [Gamma_f]_*(beta) = pr_{1,*}([Gamma_f] . pr_2^*beta).

**Correction.** The operation on the left is the pullback by the correspondence and should be written [Gamma_f]^*(beta); the displayed formula is the definition of pullback, not of pushforward.

**Why.** In the same chapter the two operations are defined by c^*(beta) = pr_{1,*}(c . pr_2^*beta) and c_*(alpha) = pr_{2,*}(c . pr_1^*alpha). Part (2) of the lemma is the statement about pullback of cycles by the correspondence, and the displayed right hand side is the first of those two formulas. Written as printed, the proof of part (2) opens by recalling a formula for the operation that part (1) is about, with the wrong right hand side attached to it.

**Existing correction:** new. Searched: the current master of the Stacks Project source repository, where weil.tex at commit a04446e57ec1fbc252a871afcec7752fb2807b14 still prints the subscript star; the tag page for 0FG5, which displays the same text

### `MotivesAndAlgebraicCycles/E5` (misprint, affects nothing)

**Where.** The Stacks Project, tag 0FG5, proof of part (1), last sentence

**Printed.**

> Then we coclude because pr_{2,*} composed with (f, 1)_* = 1_*.

**Correction.** Read: then we conclude.

**Why.** A spelling slip; the sentence is otherwise correct and the identity it states is the one the proof needs.

**Existing correction:** new. Searched: the current master of the Stacks Project source repository, where weil.tex at commit a04446e57ec1fbc252a871afcec7752fb2807b14 still contains the misspelling

## Structural proposals

Recorded in the packet's `restructure` list. This packet works with the current structure.

### MC.2 should own the axioms of a realisation, not the construction of any realisation (`narrow-layer`)

The brief of MC.2 asks both for the axiomatics of cycle class compatibility and for the construction and comparison of the Betti, de Rham and etale realisations. The first is planned here in full, and it is what makes this roadmap the owner of the notion of a realisation: the data, the three axioms, the cohomological pushforward, the Kuenneth decomposition of the diagonal and the equivalence between classical Weil cohomology theories and Q-linear symmetric monoidal functors on motives. The second belongs to the layers that own the cohomology theories: the reviewed audit of SchemeAndStackFoundations:SF.2 records that neither pinned library has a named etale cohomology API, constant torsion coefficients or any comparison of cohomology across sites, and SF.6 is the layer the atlas already names for the comparison theorems. Constructing a theory here would plan the same mathematics twice, which PROTOCOL section 15 forbids. The proposal is to narrow MC.2 to the axiomatics and the functorial characterisation, with the theories and their comparisons imported from SF.2 and SF.6; this packet is written to that narrowing and files the two requests that implement it. RS-08 narrowed MC.4 for the same reason and did not reach MC.2.

### MC.7 should be divided into a statements sub-layer and a proved-cases register (`split-layer`)

MC.7 is asked to do two different things: to give typed statements of open conjectures, which is mathematics this roadmap can own and which needs only a source that states them, and to maintain a register of proved special cases, each of which needs its own primary source and its own hypotheses on the base field, the characteristic, the codimension and the coefficient field. The two have different acceptance tests and different source routes, and mixing them is what makes the layer hard to close: this packet can state Conjecture C and Conjecture D from the sources read but can only report the known cases of Conjecture C on Jannsen's authority, because the three primary papers were not obtained. The proposal is to divide MC.7 into a sub-layer for the statements and the implications between them, and a sub-layer for the register of proved cases with one entry per case and its source. The atlas would then show the conjectures as planets of the first sub-layer, and the register would be a separate piece of work whose progress is visible.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCycles.json

Zero errors and zero warnings against the pinned declaration index.
