# Explicit K₂: symbols, residues and reciprocity — blueprint (part from T.1)

Blueprint packet for the roadmap `K2SymbolsBrauer`, stages T.1 and T.2 with their sub-stages (`research/blueprint/packets/K2SymbolsBrauer--T.1.json`). Written for job `BP-K2SymbolsBrauer--T.1`, issue #761, by Claude Code, session `cc-7b31c4`, 24 September 2026. Nothing here is formalised: every node carries `implementationStatus: "unchecked"`, and the suggested Lean file is signatures only.

**Source.** Weibel, *The K-book: An Introduction to Algebraic K-theory* (Graduate Studies in Mathematics 145), read in the author-hosted combined draft of 29 August 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`: III.5.1–5.5.1, III.5.10–5.11.1, III.6.1–6.1.3, III.7.1–7.3.1, and IV.1.20 with Exercise IV.1.9. **Not obtained:** Milnor's 1971 book, to which the source refers for the proof of Matsumoto's theorem, and the papers of Bass–Tate, Dennis–Stein, and Maazen–Stienstra–van der Kallen/Keune; the four statements taken on their authority are listed as gaps.

**Library baseline.** Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit `AUDIT-29` records every layer in scope as not built, and 23 pinned declarations are cited as baseline. Three are worth naming: Tau Ceti's `commutatorElement_transvectionUnit` **is** the Steinberg relations, proved for transvections, which is exactly what the map out of the presented group needs; `Matrix.diag2_decompose` writes `diag(a, a⁻¹)` as a product of six transvections, the matrix identity behind the lift `h_ij(a)`; and `GroupExtension` has **no** centrality predicate, so this layer adds one rather than pretending the pinned notion is central. The audit's warning is also respected: every Tau Ceti declaration whose name contains *Steinberg* is a Frobenius endomorphism of a group of Lie type, a representation of `GL₂`, or the quaternion relation — none of them is this group.

| layer | nodes | planets | coverage |
| --- | --- | --- | --- |
| `K2SymbolsBrauer:T.1:classical` | 13 | 6 | source_decomposed |
| `K2SymbolsBrauer:T.1:plus` | 2 | 2 | source_decomposed |
| `K2SymbolsBrauer:T.2:graded-map` | 2 | 1 | source_decomposed |
| `K2SymbolsBrauer:T.2:symbols` | 11 | 4 | source_decomposed |

In total: 28 nodes (1 comparison, 3 construction, 6 definition, 7 lemma, 11 theorem), 48 API items, 34 unit tests, 13 planets, 4 requests and 4 gaps.

## T.1:classical — The Steinberg group, K₂ and universal central extensions

`St_n(R)` for `n ≥ 3`, from the generators `x_ij(r)` and the three commutator relations **with
their index hypotheses attached** — rank two is excluded, as the source excludes it. The
elementary matrices satisfy those relations (the pinned Tau Ceti
`commutatorElement_transvectionUnit` is exactly this), so there is a surjection onto `E_n(R)`;
stabilise, and `K₂(R)` is the kernel. Steinberg's theorem then says that kernel **is** the
centre. The universal-central-extension theory follows in the generality the Recognition Theorem
needs — Hopf's formula for `H₂`, and the equivalence of universality with `H₁ = H₂ = 0`, which
is the superperfection criterion `K3BlochGroups:V.1` uses — and `St(R)` is identified as the
universal central extension of `E(R)`. A node is spent on what the **stable** theorem does not
give in finite rank, because the proof lets the rank grow.

### `steinberg-group-finite-rank` — The Steinberg group of a ring in finite rank ★

*definition* · planet **Steinberg group**

For a ring R and an integer n at least three define St_n(R) by generators x_ij(r), indexed by a
pair of distinct integers i and j between one and n and an element r of R, subject to the
Steinberg relations: x_ij(r) x_ij(s) = x_ij(r + s), and the commutator of x_ij(r) with x_kl(s)
is trivial when j is different from k and i is different from l, is x_il(rs) when j equals k and
i is different from l, and is x_kj(minus s r) when j is different from k and i equals l. The
distinct-index hypotheses are part of each relation and are never dropped. No definition is
given for n equal to two.

**Hypotheses.** R is an associative unital ring. n is at least three. i and j are distinct indices between one and n.

**Construction and proof.**

1. Take the free group on the indexed generator set and quotient by the normal closure of the
   displayed relations, using the pinned presented-group construction.
1. State each relation with its index hypothesis attached, so that the three commutator cases
   are disjoint and exhaustive for distinct pairs.
1. Prove the elementary consequences: x_ij(0) is the identity and x_ij(r) inverse is x_ij(minus
   r).
1. Prove the universal property: a group homomorphism out of St_n(R) is the same as a family of
   elements satisfying the relations.
1. Record that rank two is excluded, as the source does, because the relations degenerate there.

**API.**

| name | role | statement |
| --- | --- | --- |
| `Steinberg` | data | The group St_n(R) for n at least three. |
| `Steinberg.x` | constructor | The generator x_ij(r), taking the distinctness of the indices as a hypothesis. |
| `Steinberg.x_add` | relation | x_ij(r) x_ij(s) = x_ij(r + s). |
| `Steinberg.commutator` | relation | The three commutator relations, each with its index hypothesis. |
| `Steinberg.lift` | universal-property | A family satisfying the relations induces a unique homomorphism out of St_n(R). |
| `Steinberg.x_zero` | simp | x_ij(0) is the identity. |

**Used by.** *T.1's stabilisation*: the stable group is the colimit of these. *T.1's finite-rank splitting*: the splitting theorem for n at least five is a statement about these groups. *T.2's symbol*: the elements w_ij and h_ij, from which the symbol is built, are words in these generators.

**Unit tests.**

- `x_zero` — x_ij(0) is the identity.
- `x_inv` — The inverse of x_ij(r) is x_ij(minus r).
- `commutator_disjoint_cases` — For distinct pairs with j not k and i not l the commutator is
  trivial, which is the first case.
- `no_rank_two` — The definition is not given for n equal to two: a definition that extends it
  there asserts relations the source does not.

**Acceptance.**

- x_ij(0) is the identity.
- The three commutator cases are disjoint, and the case i equal to l with j equal to k is not
  covered by any of them, which is why rank two is excluded.
- For n at least three the group is nontrivial whenever R is.

**Depends on.** **baseline** `mathlib:PresentedGroup`, `mathlib:commutatorElement`.

**Source.** Kbook.2013, III.5.1 (PDF p. 225): “Definition 5.1. For n >= 3 the Steinberg group St_n(R) of a ring R is the group defined by generators x_ij(r), with i, j a pair of distinct integers between 1 and n and r in R, subject to the following Steinberg relations: x_ij(r) x_ij(s) = x_ij(r + s); [x_ij(r), x_kl(s)] = 1 if j is not k and i is not l, x_il(rs) if j = k and i is not l, x_kj(-sr) if j is not k and i = l.” — The definition and the three relations, as displayed.

### `elementary-matrices-satisfy` — The elementary matrices satisfy the Steinberg relations

*lemma*

For every ring R and every n at least three the elementary matrices e_ij(r) in the general
linear group satisfy the Steinberg relations. Consequently there is a canonical surjection from
St_n(R) onto the subgroup E_n(R) generated by the elementary matrices, sending x_ij(r) to
e_ij(r).

**Hypotheses.** R is an associative unital ring; n is at least three.

**Construction and proof.**

1. Import the elementary matrices and their commutator formulas from the pinned libraries, where
   they are proved for transvections over a commutative ring.
1. Check the additivity relation and each of the three commutator cases against the pinned
   formulas, keeping the index hypotheses aligned.
1. Apply the universal property of the Steinberg presentation to obtain the homomorphism.
1. Prove surjectivity onto E_n(R), which is immediate since the elementary matrices generate it
   by definition.
1. Record the boundary of the pinned input: the commutator formulas are stated over a
   commutative ring, and the noncommutative case is proved here.

**Acceptance.**

- The image of x_ij(r) is e_ij(r).
- The map is onto E_n(R) but not onto GL_n(R) in general.
- The relations hold for elementary matrices, which is what makes the Steinberg presentation an
  imitation of them rather than an arbitrary presentation.

**Depends on.** **inside this roadmap** `steinberg-group-finite-rank`; **baseline** `mathlib:Matrix.GeneralLinearGroup.transvection`, `tauceti:TauCeti.transvectionUnit`, `tauceti:TauCeti.commutatorElement_transvectionUnit`.

**Source.** Kbook.2013, III.5.1.2 (PDF p. 225): “As observed in 1.3.1, the Steinberg relations are also satisfied by the elementary matrices e_ij(r) which generate the subgroup E_n(R) of GL_n(R). Hence there is a canonical group surjection phi_n : St_n(R) -> E_n(R) sending x_ij(r) to e_ij(r).” — The observation and the resulting surjection, as displayed.

### `stabilisation` — Stabilisation and the stable Steinberg group ★

*construction* · planet **Stable Steinberg group**

The Steinberg relations for n plus one include those for n, so there is a canonical map from
St_n(R) to St_{n+1}(R). Define the stable Steinberg group St(R) as the colimit of this tower,
and observe that the maps onto the finite-rank elementary groups stabilise to a surjection from
St(R) onto the stable elementary group E(R). The stable and finite-rank objects are kept
distinct throughout.

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. Construct the map from St_n(R) to St_{n+1}(R) by sending each generator to the generator with
   the same indices, which is legitimate because the relations for the larger rank include those
   for the smaller.
1. Form the colimit of the tower, using the pinned direct-limit construction.
1. Construct the stable elementary group as the colimit of the finite-rank elementary groups and
   prove that the surjections are compatible with the two towers.
1. Deduce the stable surjection onto E(R).
1. Prove functoriality in the ring, for both the finite-rank and the stable objects.

**API.**

| name | role | statement |
| --- | --- | --- |
| `Steinberg.stabilise` | constructor | The map from rank n to rank n plus one. |
| `StableSteinberg` | data | The colimit St(R). |
| `StableSteinberg.phi` | constructor | The surjection onto the stable elementary group. |
| `StableSteinberg.phi_surjective` | characterisation | That surjection is onto. |
| `StableSteinberg.map` | functoriality | Functoriality in the ring. |

**Used by.** *T.1's definition of K_2*: K_2 is the kernel of the stable surjection. *K3BlochGroups V.1*: that layer's homological model is about this stable group and its superperfection. *T.1:plus*: the comparison with the K-theory space is stated for the stable objects.

**Unit tests.**

- `surjective` — The stable map onto E(R) is surjective.
- `colimit_property` — Every element of St(R) comes from some finite rank.
- `functorial` — A ring map induces a compatible map of stable Steinberg groups.
- `not_finite_rank` — A property of St(R) is not asserted for St_n(R): the two are different
  groups.

**Acceptance.**

- The stable map is surjective onto E(R).
- A statement proved for St(R) does not follow for St_n(R): the two are kept distinct, which is
  the discipline the layer requires.
- The construction is functorial in the ring.

**Depends on.** **inside this roadmap** `steinberg-group-finite-rank`, `elementary-matrices-satisfy`; **baseline** `mathlib:DirectLimit`.

**Source.** Kbook.2013, III.5.1.2 (PDF p. 225): “The Steinberg relations for n + 1 include the Steinberg relations for n, so there is an obvious map St_n(R) -> St_{n+1}(R). We write St(R) for the colimit of the St_n(R), and observe that by stabilizing the phi_n induce a surjection phi : St(R) -> E(R).” — The stabilisation and the stable surjection, as displayed.

### `k2-definition` — Classical K_2 of a ring ★

*definition* · planet **Classical K2**

Define K_2(R) as the kernel of the stable surjection from St(R) onto E(R). This gives the exact
sequence of groups from the trivial group to K_2(R) to St(R) to GL(R) to K_1(R) to the trivial
group. Both St and K_2 are covariant functors from rings to groups.

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. Take the kernel of the stable surjection.
1. Assemble the four-term exact sequence, using that E(R) is the commutator subgroup of GL(R)
   and that K_1(R) is the quotient, both imported.
1. Prove functoriality in the ring.
1. Record that abelianness is not part of the definition: it is Steinberg's theorem, proved
   next.

**API.**

| name | role | statement |
| --- | --- | --- |
| `K2` | data | The group K_2(R). |
| `K2.subtype` | coercion | Its inclusion into St(R). |
| `K2.mem_iff` | characterisation | An element lies in K_2(R) exactly when its image in E(R) is trivial. |
| `K2.map` | functoriality | Functoriality in the ring. |
| `K2.exact` | structure | The four-term exact sequence. |

**Used by.** *T.2's symbols*: every symbol is an element of this group. *T.1:plus*: the comparison identifies this group with a homotopy group. *K3BlochGroups V.1*: the kernel of the universal central extension there is this group.

**Unit tests.**

- `zero_ring` — K_2 of the zero ring is trivial.
- `integers` — K_2(Z) is cyclic of order two.
- `finite_field` — K_2 of a finite field is trivial.
- `not_by_definition_abelian` — Abelianness is a theorem, not part of the definition: a
  definition that assumes it assumes Steinberg's theorem.

**Acceptance.**

- The sequence is exact at each of its four places.
- K_2 of the zero ring is trivial.
- K_2(Z) is cyclic of order two, generated by the symbol of minus one with itself; this is the
  acceptance test that the group is not trivially zero.

**Depends on.** **inside this roadmap** `stabilisation`; **other roadmaps** `GeneralAlgebraicKTheory:K.2`.

**Source.** Kbook.2013, III.5.2 (PDF p. 225): “Definition 5.2. The group K_2(R) is the kernel of phi : St(R) -> E(R). Thus there is an exact sequence of groups 1 -> K_2(R) -> St(R) -> GL(R) -> K_1(R) -> 1.” — The definition and the exact sequence, as displayed.

### `k2-is-centre` — Steinberg's theorem: K_2 is the centre of the Steinberg group ★

*theorem* · planet **K2 is the centre of St**

For every ring R the group K_2(R) is abelian; in fact it is precisely the centre of St(R).

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. One inclusion: if an element is central in St(R) then its image is central in E(R), and the
   centre of E(R) is trivial, so the image is trivial and the element lies in K_2(R).
1. For the other inclusion take an element y of the kernel. Its commutator with every element of
   St(R) maps to the identity in E(R).
1. Choose n large enough that y is a word in the generators with indices below n. For each
   generator x_kn(s) with k below n, the Steinberg relations put the commutator of y with it
   inside the subgroup generated by the symbols x_in(r) with i below n.
1. That subgroup maps injectively into E(R), so the commutator is trivial and y commutes with
   every such generator.
1. By symmetry y commutes with every x_nk(s), hence with every x_kl(s) for k and l below n,
   since each such generator is a commutator of two of the previous ones. Let n grow to conclude
   that y is central.
1. Record the one input that is not self-contained: the injectivity of the displayed subgroup
   into E(R), which the source relegates to an exercise and which is proved here.

**Acceptance.**

- K_2(R) is abelian, which is what makes the four-term sequence a sequence of abelian groups at
  that spot.
- The centre of E(R) is trivial, which is the first half of the argument and is needed
  separately.
- The theorem is about the stable group: the centre of St_n(R) is a different question, treated
  in the finite-rank caveat.

**Depends on.** **inside this roadmap** `k2-definition`, `stabilisation`; **baseline** `mathlib:Subgroup.center`.

**Source.** Kbook.2013, III.5.2.1 (PDF p. 225): “Theorem 5.2.1. (Steinberg) K_2(R) is an abelian group. In fact it is precisely the center of St(R).” — The theorem, with the proof of the source followed step by step.

### `central-extension` — Central extensions and their equivalence

*definition*

A central extension of a group G by an abelian group A is a short exact sequence from the
trivial group to A to X to G to the trivial group in which A lies in the centre of X. It is
split when it is isomorphic to the projection from the product. Two extensions of G by A are
equivalent when there is an isomorphism between them that is the identity on A and induces the
identity on G, and the equivalence classes correspond to the elements of the second cohomology
group of G with coefficients in A. A homomorphism over G between two central extensions is a
group map commuting with the projections.

**Hypotheses.** G is a group; A is an abelian group.

**Construction and proof.**

1. Define a central extension as the pinned notion of a group extension together with the
   condition that the image of the kernel lies in the centre; the pinned extension API has no
   centrality predicate, so it is added here.
1. Define splitness and equivalence.
1. State the correspondence with the second cohomology group, importing the pinned
   classification of extensions with abelian kernel by the cohomology class of their factor
   sets.
1. Define a homomorphism over G and prove that composition and identities make central
   extensions of G into a category.

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsCentralExtension` | characterisation | The predicate that an extension is central. |
| `CentralExtension.split` | characterisation | Splitness. |
| `CentralExtension.Equiv` | structure | Equivalence of two extensions of G by A. |
| `CentralExtension.classify` | characterisation | The correspondence of equivalence classes with the second cohomology group. |
| `CentralExtension.homOver` | structure | A homomorphism over G, with composition and identities. |

**Used by.** *T.1's universal central extension*: the universal object is defined in this category. *T.1's Recognition Theorem*: the characterisation by splitting of central extensions is stated here. *K3BlochGroups V.1*: the superperfection argument there is about this notion.

**Unit tests.**

- `split_is_trivial_class` — A split extension has the zero class.
- `trivial_action_central` — An extension from a trivial-action factor set is central.
- `equivalence_finer` — Two inequivalent extensions can have isomorphic total groups: a non-
  example.

**Acceptance.**

- The split extension corresponds to the zero cohomology class.
- An extension built from a trivial-action factor set is central, which is the pinned statement.
- Equivalence is finer than isomorphism of groups: two inequivalent extensions can have
  isomorphic total groups.

**Depends on.** **baseline** `mathlib:GroupExtension`, `tauceti:TauCeti.FactorSet.inl_range_le_center`, `tauceti:TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq`, `mathlib:Subgroup.center`.

**Source.** Kbook.2013, III.5.3 (PDF p. 226): “Let G be a group and A an abelian group. A central extension of G by A is a short exact sequence of groups 1 -> A -> X -> G -> 1 such that A is in the center of X. We say that a central extension is split if it is isomorphic to an extension of the form 1 -> A -> A x G -> G -> 1.” — The definitions, as displayed.

### `universal-central-extension` — Universal central extensions

*definition*

A universal central extension of G is a central extension from which there is a unique
homomorphism over G to every other central extension of G. It is unique up to isomorphism over G
when it exists.

**Hypotheses.** G is a group.

**Construction and proof.**

1. Define the universal property in the category of central extensions of G.
1. Prove uniqueness up to isomorphism over G by the usual argument with the two composites.
1. Record that existence is not automatic and is the content of the Recognition Theorem.

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsUniversalCentralExtension` | characterisation | The universal property. |
| `uce_unique` | characterisation | Uniqueness up to isomorphism over G. |
| `uce_hom` | constructor | The unique homomorphism to any central extension. |
| `uce_hom_unique` | characterisation | Its uniqueness. |

**Used by.** *T.1's identification of the Steinberg group*: St(R) is the universal central extension of E(R). *K3BlochGroups V.1*: superperfection is deduced from this property. *T.1:plus*: the comparison with H_2 runs through the universal property.

**Unit tests.**

- `unique` — Two universal central extensions of the same group are isomorphic over it.
- `nonperfect_has_none` — A group with nontrivial abelianisation has no universal central
  extension.
- `existence_is_a_theorem` — Existence is not part of the definition.

**Acceptance.**

- The universal object is unique up to isomorphism over G.
- A group with a nontrivial abelianisation has none, which is the next lemma.
- Existence is a theorem, not part of the definition.

**Depends on.** **inside this roadmap** `central-extension`.

**Source.** Kbook.2013, III.5.3.1 (PDF p. 227): “Definition 5.3.1. A universal central extension of G is a central extension X -> G such that for every other central extension Y -> G there is a unique homomorphism f over G from X to Y. Clearly a universal central extension is unique up to isomorphism over G, provided it exists.” — The definition, as displayed.

### `uce-perfect` — A universal central extension forces perfectness, and rigidity of maps out of a perfect extension

*lemma*

If G has a universal central extension X then both G and X are perfect. If X and Y are central
extensions of G and X is perfect, there is at most one homomorphism over G from X to Y.

**Hypotheses.** G is a group; X and Y are central extensions of G.

**Construction and proof.**

1. For the first statement, suppose the abelianisation of X is nontrivial and form the split
   central extension of G by it; then the two obvious homomorphisms over G from X are distinct,
   contradicting uniqueness. Perfectness of G follows since it is a quotient of X.
1. For the second statement, write two homomorphisms as differing by central elements, evaluate
   on a commutator and observe that the central corrections cancel; since commutators generate X
   the two agree.

**Acceptance.**

- The two statements are what make the Recognition Theorem's proof work and are used separately.
- A perfect group can still have several central extensions; uniqueness is of the map, not of
  the extension.
- The first statement is the obstruction: a non-perfect group has no universal central extension
  at all.

**Depends on.** **inside this roadmap** `universal-central-extension`; **baseline** `mathlib:Group.IsPerfect`.

**Source.** Kbook.2013, III.5.3.2 and III.5.3.3 (PDF p. 227): “Lemma 5.3.2. If G has a universal central extension X -> G, then both G and X must be perfect groups. ... Lemma 5.3.3. If X and Y are central extensions of G, and X is a perfect group, there is at most one homomorphism over G from X to Y.” — The two lemmas, with the proofs of the source.

### `hopf-formula` — The Hopf formula and the two extensions attached to a presentation

*theorem*

A presentation of G as a free group F modulo a normal subgroup S gives two central extensions:
one with kernel S modulo the commutator of S with F, and one with kernel the intersection of S
with the commutator subgroup of F, modulo the same commutator. The second kernel is the second
integral homology of G, which is Hopf's formula.

**Hypotheses.** G is a group presented as a quotient of a free group F by a normal subgroup S.

**Construction and proof.**

1. Form the two displayed quotients and prove that both are central extensions, of G and of its
   commutator subgroup respectively.
1. Prove Hopf's formula identifying the second kernel with the second integral homology of G, by
   comparing the two with the bar resolution.
1. Record that when G is perfect the second extension is again an extension of G, which is the
   case the Recognition Theorem uses.

**Acceptance.**

- For a free group both kernels vanish and the second homology is trivial.
- For a perfect group the second extension is an extension of G itself.
- The formula computes the second homology from any presentation, so the answer does not depend
  on the presentation, which is the content.

**Depends on.** **inside this roadmap** `central-extension`; **baseline** `mathlib:groupHomology.H2`, `mathlib:groupHomology`.

**Source.** Kbook.2013, III.5.3.4 and III.5.3.5 (PDF p. 227): “The group (R intersect [F, F]) / [R, F] in (5.3.5) is the homology group H_2(G; Z); this identity was discovered in 1941 by Hopf.” — Hopf's formula and the two extensions, as displayed.

### `recognition-theorem` — The Recognition Theorem ★

*theorem* · planet **Recognition Theorem**

Every perfect group G has a universal central extension, namely the extension with kernel the
second integral homology of G coming from any presentation. Moreover, for a central extension X
of G the following are equivalent: X is a universal central extension; X is perfect and every
central extension of X splits; the first and second integral homology groups of X vanish.

**Hypotheses.** G is a perfect group; X is a central extension of G.

**Construction and proof.**

1. Given any central extension X of G, lift the map from the free group to X, which is possible
   because the free group is free.
1. The image of the relation subgroup is central in X, so the commutator of the relation
   subgroup with the free group dies, and the lift induces a map over G from the Hopf extension
   to X; it is unique by the rigidity lemma.
1. This proves both that the Hopf extension is universal and the equivalence of the first and
   third conditions.
1. The implication from the first to the second is the perfectness lemma together with the
   splitting of central extensions of a universal object; the converse is immediate.
1. Record the third condition in the form used downstream: a group is the source of a universal
   central extension exactly when it is superperfect.

**Acceptance.**

- For a free group the theorem is vacuous, since a free group is perfect only when trivial.
- The third condition is the one K3BlochGroups V.1 uses to prove superperfection of the
  Steinberg group.
- Perfectness alone does not make a group superperfect: the alternating group on five letters is
  perfect with nonvanishing second homology, and is not the source of a universal central
  extension of itself.

**Depends on.** **inside this roadmap** `hopf-formula`, `uce-perfect`, `universal-central-extension`; **baseline** `mathlib:groupHomology.H1`, `mathlib:groupHomology.H2`.

**Source.** Kbook.2013, III.5.4 (PDF p. 227): “Recognition Theorem 5.4. Every perfect group G has a universal central extension, namely the extension (5.3.5): 1 -> H_2(G; Z) -> [F, F] / [R, F] -> G -> 1. Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H_1(X; Z) = H_2(X; Z) = 0.” — The theorem and its three equivalent conditions, as displayed.

### `steinberg-is-uce` — The Steinberg group is the universal central extension of the elementary group ★

*theorem* · planet **St(R) is the universal central extension**

For every ring R the stable Steinberg group St(R) is the universal central extension of E(R).
Consequently K_2(R) is isomorphic to the second integral homology of E(R).

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. Observe that E(R) is perfect, so the Recognition Theorem applies.
1. Prove that St(R) is a central extension of E(R), which is Steinberg's centre theorem.
1. Apply the Recognition Theorem together with the finite-rank splitting result below: every
   central extension of St(R) splits, so St(R) is universal.
1. Read off the identification of K_2(R) with the second homology of E(R) from the uniqueness of
   the universal object and the Hopf formula.

**Acceptance.**

- The identification of K_2 with the second homology is the statement T.1:plus starts from.
- For the ring of integers both sides are cyclic of order two.
- The theorem is about the stable group; the finite-rank analogue needs n at least five and is
  stated separately.

**Depends on.** **inside this roadmap** `recognition-theorem`, `k2-is-centre`, `finite-rank-splitting`.

**Source.** Kbook.2013, III.5.5 (PDF p. 228): “Theorem 5.5. (Kervaire, Steinberg) The Steinberg group St(R) is the universal central extension of E(R). Hence K_2(R) = H_2(E(R); Z).” — The theorem, as displayed.

### `finite-rank-splitting` — Every central extension of the finite-rank Steinberg group splits, for n at least five

*theorem*

For n at least five every central extension of St_n(R) splits; consequently St_n(R) is the
universal central extension of E_n(R).

**Hypotheses.** R is an associative unital ring; n is at least five.

**Construction and proof.**

1. Show first that two elements of the extension lying over generators with disjoint index
   conditions commute, by introducing an auxiliary index distinct from the four given ones and
   writing one of the two as a commutator; this is where n at least five is used.
1. Choose distinct indices and elements over three generators, and show that the commutator
   subgroup of the subgroup they generate is abelian.
1. Use the Hall-Witt style identity to show that the element defined as a commutator of two
   lifts does not depend on the intermediate index nor on the chosen lifts.
1. Prove that these elements satisfy the Steinberg relations, so that they define a homomorphism
   from St_n(R) to the extension splitting it.
1. Deduce from the Recognition Theorem that St_n(R) is the universal central extension of
   E_n(R).

**Acceptance.**

- The bound n at least five is used in the first step and is recorded, not smoothed over.
- The splitting is by an explicit homomorphism, which is what makes the argument constructive.
- The statement does not say that the kernel of the finite-rank map is central, which is the
  separate caveat below.

**Depends on.** **inside this roadmap** `steinberg-group-finite-rank`, `recognition-theorem`, `elementary-matrices-satisfy`.

**Source.** Kbook.2013, III.5.5.1 (PDF p. 228): “Proposition 5.5.1. If n >= 5, every central extension Y -> St_n(R) is split. Hence St_n(R) is the universal central extension of E_n(R).” — The proposition, with the proof of the source followed step by step.

### `finite-rank-caveat` — What the stable theorem does not give in finite rank

*lemma*

The centrality of the kernel of the map from St_n(R) to E_n(R) is not asserted for every ring
and every rank. Steinberg's centre theorem is a statement about the stable group, and its proof
uses that the rank may be increased arbitrarily. This node records the boundary explicitly and
states what is available: the splitting result for n at least five, and the stable centrality.

**Hypotheses.** R is an associative unital ring; n is at least three.

**Construction and proof.**

1. State the two available results and their hypotheses: the stable centre theorem, with no rank
   hypothesis but about the colimit, and the finite-rank splitting for n at least five.
1. State explicitly what does not follow: that the kernel of the finite-rank map is central for
   every ring and every rank at least three.
1. Record where the stable proof uses growth of the rank, namely in the step that chooses n
   large enough for a given element and then lets n grow.

**Acceptance.**

- The stable theorem is used only for the stable group in every downstream node.
- The finite-rank splitting is stated with its hypothesis n at least five.
- No node of this packet asserts finite-rank centrality, which is the acceptance test.

**Depends on.** **inside this roadmap** `k2-is-centre`, `finite-rank-splitting`.

**Source.** Kbook.2013, III.5.2.1 proof (PDF p. 226): “Choose an integer n large enough that y can be expressed as a word in the symbols x_ij(r) with i, j < n. ... Since n can be arbitrarily large, this proves that y is in the center of St(R).” — The step of the stable proof that uses growth of the rank, which is why the finite-rank statement does not follow.

## T.1:plus — Comparison with homotopy K₂

Two steps, both short because the work is done: the uniqueness of the universal central
extension turns `K₂(R)` into `H₂(E(R), ℤ)`, and the plus construction turns that into `π₂` of
the K-theory space, Hurewicz applying because `BE(R)⁺` is simply connected. The plus
construction is `StableHomotopyKTheory:H.3`'s and the space is `GeneralAlgebraicKTheory:K.2`'s;
this layer supplies the explicit model they are compared with, and `K.2:low-degree-comparisons`
consumes it.

### `k2-h2-elementary` — K_2 is the second homology of the elementary group ★

*theorem* · planet **K2 is H2 of E(R)**

For every ring R there is an isomorphism from K_2(R) to the second integral homology of E(R),
natural in R. It is the identification of the kernel of the universal central extension with the
kernel given by the Hopf formula.

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. Import that St(R) is the universal central extension of E(R).
1. Import the Hopf extension of E(R) with kernel the second homology, which is also universal by
   the Recognition Theorem.
1. Compare the two by the uniqueness of the universal object over E(R); the resulting
   isomorphism over E(R) restricts to an isomorphism of kernels.
1. Prove naturality in the ring, using functoriality of both constructions.

**Acceptance.**

- For the ring of integers both sides are cyclic of order two.
- The isomorphism is natural, which is what the comparison with homotopy needs.
- The identification is of kernels, not merely an abstract isomorphism of abelian groups; the
  acceptance test is the compatibility with the two projections.

**Depends on.** **inside this roadmap** `steinberg-is-uce`, `hopf-formula`, `k2-definition`; **baseline** `mathlib:groupHomology.H2`.

**Source.** Kbook.2013, III.5.5 (PDF p. 228): “Hence K_2(R) = H_2(E(R); Z).” — The identification, as displayed.

### `k2-pi2` — K_2 is the second homotopy group of the K-theory space ★

*theorem* · planet **K2 is the second homotopy group**

For every ring R there is an isomorphism from K_2(R) to the second homotopy group of the plus
construction on the classifying space of the stable general linear group, natural in R. It is
obtained by combining the identification with the second homology of E(R) with the Hurewicz
theorem applied to the simply connected space obtained from the plus construction.

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. Import the plus construction and the K-theory space, and the fact that the plus construction
   on the classifying space of the stable elementary group is the universal cover of the plus
   construction on the classifying space of the stable general linear group.
1. That space is simply connected, and its second homotopy group is its second homology by the
   Hurewicz theorem.
1. Its second homology is the second homology of E(R), by the homology isomorphism the plus
   construction provides.
1. Compose with the identification of the previous node and prove naturality.
1. Record the division of labour: the plus construction belongs to StableHomotopyKTheory, the
   K-theory space to GeneralAlgebraicKTheory, and this layer supplies the explicit model they
   are compared with.

**Acceptance.**

- The composite isomorphism is natural in the ring.
- For a finite field both sides are trivial.
- The Hurewicz step needs simple connectivity, which is why the elementary group, and not the
  general linear group, appears.

**Depends on.** **inside this roadmap** `k2-h2-elementary`; **other roadmaps** `StableHomotopyKTheory:H.3`, `GeneralAlgebraicKTheory:K.2`; **baseline** `mathlib:HomotopyGroup`.

**Source.** Kbook.2013, Ex. IV.1.9 and IV.1.20 (PDF pp. 281-282): “Show that there is a homotopy fibration BA -> BS+ -> BP+. Conclude that pi_n(BS+) = 0 for n <= 2, and that pi_n(BS+) = pi_n(BP+) = pi_n(BG+) for all n >= 3.” — The plus-construction comparison this node instantiates in degree two, where the Hurewicz theorem applies to the simply connected cover.

## T.2:graded-map — The graded map to Quillen K-theory

The graded ring map `K^M_*(F) → K_*(F)`, whose degree-two component is Matsumoto's isomorphism
and whose degree-three component is what `K3BlochGroups:V.2` takes the cokernel of. No
isomorphism is asserted in degree three or above, and the two layers' ownership is stated
explicitly so that neither plans the other's half.

### `graded-map` — The graded map from Milnor to Quillen K-theory ★

*construction* · planet **Milnor to Quillen graded map**

Construct the natural graded ring map from Milnor K-theory of a field to Quillen K-theory,
determined by the products of degree-one classes. Its degree-two component is Matsumoto's
isomorphism. No isomorphism is asserted in degree three or above.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Import the products on Quillen K-theory from GeneralAlgebraicKTheory.
1. Define the map on the tensor algebra by sending the degree-one element attached to a nonzero
   x to the class of x in K_1(F) and extending multiplicatively.
1. Prove that it kills the Steinberg elements, using the degree-two Steinberg identity in
   Quillen K-theory, so that it descends to Milnor K-theory.
1. Prove that the result is a map of graded rings and is natural in the field.
1. Record what is and is not asserted: degree two is an isomorphism, by Matsumoto; degree three
   is a map whose cokernel defines the indecomposable K_3 in K3BlochGroups V.2; no general
   isomorphism is claimed.

**API.**

| name | role | statement |
| --- | --- | --- |
| `milnorToQuillen` | constructor | The graded ring map. |
| `milnorToQuillen_one` | simp | Degree one is the identity on the unit group. |
| `milnorToQuillen_two` | characterisation | Degree two is an isomorphism, by Matsumoto. |
| `milnorToQuillen_map` | functoriality | Naturality in the field. |
| `milnorToQuillen_graded` | structure | It is a map of graded rings. |

**Used by.** *K3BlochGroups V.2*: the degree-three component is the map whose cokernel is the indecomposable K_3. *MotivicEtaleKTheory M.5*: the norm-residue theorem is about the mod-m reduction of the source of this map. *HigherLocalFieldsAndHigherClassFieldTheory HL.1*: that layer imports the graded source and the map.

**Unit tests.**

- `degree_one` — Degree one is the identity.
- `degree_two_iso` — Degree two is an isomorphism.
- `degree_three_not_iso` — Degree three is not an isomorphism in general: for a number field
  with a real place the source is nonzero torsion and the target has positive rank.
- `graded` — The map respects the grading and the products.

**Acceptance.**

- Degree one is the identity on the unit group.
- Degree two is an isomorphism.
- Degree three is neither injective nor surjective in general; it is the map whose cokernel
  another roadmap studies.

**Depends on.** **inside this roadmap** `milnor-k-theory`, `matsumoto`; **other roadmaps** `GeneralAlgebraicKTheory:K.2`.

**Source.** Kbook.2013, III.7.1 and III.6.1 (PDF pp. 239, 253): “By Matsumoto's Theorem 6.1 we also have K^M_2(F) = K_2(F), the elements {x, y} being the usual Steinberg symbols, except that the group operation in K^M_2(F) is written additively.” — The degree-two identification, which is the special degree of this graded map.

### `graded-map-degree-three` — The degree-three component, and what consumes it

*comparison*

The degree-three component of the graded map is the map from the Milnor K-group in degree three
to Quillen K_3 of the field. K3BlochGroups V.2 defines the indecomposable K_3 as its cokernel
and proves that it is injective for a field; this layer supplies the map and does not duplicate
either statement.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Take the degree-three component of the graded map.
1. State the two facts the consuming layer proves: injectivity for a field, and the definition
   of the indecomposable quotient as the cokernel.
1. Record the ownership: the map is constructed here, the quotient and the injectivity theorem
   belong to K3BlochGroups V.2, and neither side plans the other.

**Acceptance.**

- The component sends a Milnor symbol of three units to the product of their classes.
- For a finite field the source vanishes.
- The injectivity theorem is not proved here; it is cited to the consuming layer.

**Depends on.** **inside this roadmap** `graded-map`; **other roadmaps** `K3BlochGroups:V.2`.

**Source.** Kbook.2013, III.7.1 (PDF p. 253): “Definition 7.1. The graded ring K^M_*(F) is defined to be the quotient of T(F^x) by the ideal generated by the homogeneous elements l(x) tensor l(1 - x) with x not 0, 1.” — The graded source whose degree-three part this component starts from.

## T.2:symbols — Symbols, Matsumoto and Milnor K-theory

The star product of commuting matrices, then `{r,s}` as the commutator of the diagonal lifts
`h_ij(r)` — whose matrix identity is the pinned `Matrix.diag2_decompose`, six transvections. The
Steinberg identity `{r,1−r} = 1` is proved by the explicit computation, and `{r,−r} = 1` is
recorded in **both** of its forms, since the general one rests on a later chapter. Then the
consequence the roadmap insists on: skew-symmetry gives `{a,a}² = 1`, and `{a,a} = {a,−1}`,
which is **not** trivial in general — `{−1,−1}` generates `K₂(ℤ)`. Matsumoto's theorem is stated
as a **presentation**, with the normal-form argument named as what the proof consists of. Milnor
K-theory is the tensor algebra modulo the homogeneous Steinberg ideal, in all degrees, with the
higher tame symbols built by Serre's argument.

### `star-product` — The star product of commuting matrices

*construction*

If two matrices of E(R) commute, lift them to St(R) and define their star product to be the
commutator of the lifts, an element of K_2(R). The definition does not depend on the lifts,
because two lifts differ by central elements. The star product is invariant under simultaneous
conjugation by an element of GL(R), is skew-symmetric, and is bilinear.

**Hypotheses.** R is an associative unital ring; the two matrices lie in E(R) and commute.

**Construction and proof.**

1. Choose lifts and form their commutator; the image in E(R) is trivial, so it lies in K_2(R).
1. Prove independence of the lifts: two lifts differ by central elements, which drop out of a
   commutator.
1. Prove conjugation invariance by lifting the block diagonal matrix built from the conjugating
   element and its inverse, and using that the commutator is central.
1. Prove skew-symmetry and bilinearity from the commutator identities.
1. Record that the construction needs the two matrices to commute; without that hypothesis the
   commutator does not land in K_2(R).

**API.**

| name | role | statement |
| --- | --- | --- |
| `starProduct` | constructor | The star product of two commuting elements of E(R). |
| `starProduct_lift_indep` | characterisation | It does not depend on the chosen lifts. |
| `starProduct_conj` | relation | Invariance under simultaneous conjugation by an element of GL(R). |
| `starProduct_skew` | relation | Skew-symmetry. |
| `starProduct_mul_left` | relation | Bilinearity in the first argument. |

**Used by.** *T.2's Steinberg symbol*: the symbol is the star product of two specific diagonal matrices. *T.2's Steinberg identity*: the identity is proved by a computation with lifts of these matrices.

**Unit tests.**

- `self` — The star product of a matrix with itself is trivial.
- `conjugation` — Simultaneous conjugation does not change it.
- `bilinear` — It is multiplicative in the first argument.
- `needs_commuting` — For non-commuting matrices the commutator of lifts is not in K_2(R): a
  non-example.

**Acceptance.**

- The star product of a matrix with itself is trivial.
- It is invariant under simultaneous conjugation.
- Bilinearity holds in each variable separately, for commuting arguments.

**Depends on.** **inside this roadmap** `k2-definition`, `k2-is-centre`; **baseline** `mathlib:commutatorElement`.

**Source.** Kbook.2013, III.5 Steinberg symbols (PDF p. 233): “If two matrices A, B in E(R) commute, we can construct an element in K_2(R) by lifting their commutator to St(R). ... This definition is independent of the choice of a and b because any other lift will equal ac, bc' for central elements c, c', and [ac, bc'] = [a, b].” — The construction and its independence of lifts, as displayed.

### `steinberg-symbol` — The Steinberg symbol ★

*definition* · planet **Steinberg symbol**

For commuting units r and s of a ring R define the Steinberg symbol as the star product of the
diagonal matrix with r and r inverse at two coordinates with the diagonal matrix with s and s
inverse at two coordinates chosen to overlap in exactly one index. Equivalently it is the
commutator of the elements h_ij(r) and h_ik(s) of St(R), where w_ij(r) is the word x_ij(r)
x_ji(minus r inverse) x_ij(r) and h_ij(r) is w_ij(r) w_ij(minus one). The symbol is skew-
symmetric and bilinear.

**Hypotheses.** R is an associative unital ring; r and s are commuting units.

**Construction and proof.**

1. Define w_ij(r) and h_ij(r) by the displayed words and compute their images in GL(R): w_ij(r)
   maps to the monomial matrix with r and minus r inverse in the two off-diagonal places, and
   h_ij(r) to the diagonal matrix with r and r inverse.
1. Import the pinned decomposition of that diagonal matrix as a product of six elementary
   matrices, which is the matrix identity behind the lift, and check that it matches the word
   h_ij(r).
1. Define the symbol as the star product of the two diagonal matrices, or equivalently as the
   commutator of h_ij(r) and h_ik(s), and prove the two agree.
1. Prove that the symbol does not depend on the choice of the three indices.
1. Deduce skew-symmetry and bilinearity from the corresponding properties of the star product.

**API.**

| name | role | statement |
| --- | --- | --- |
| `steinbergSymbol` | constructor | The symbol of two commuting units. |
| `steinbergSymbol_eq_commutator` | characterisation | It is the commutator of h_ij(r) and h_ik(s). |
| `steinbergSymbol_one` | simp | The symbol with a one entry is trivial. |
| `steinbergSymbol_mul_left` | relation | Bilinearity in the first entry. |
| `steinbergSymbol_skew` | relation | Skew-symmetry. |
| `steinbergSymbol_index_indep` | characterisation | Independence of the chosen indices. |

**Used by.** *T.2's Matsumoto theorem*: the theorem presents K_2 of a field by these symbols. *Milnor K-theory*: the degree-two Milnor symbols are identified with these. *K3BlochGroups V.5*: the decomposable class in K_3 of the rationals is built from the symbol with three minus-one entries.

**Unit tests.**

- `one_entry` — The symbol with a one entry is trivial.
- `minus_one_integers` — For the integers the symbol of minus one with itself is the nontrivial
  element of K_2(Z).
- `bilinear` — The symbol is multiplicative in each entry.
- `not_alternating_integrally` — The symbol of a with itself is not trivial in general, which
  the next node computes.

**Acceptance.**

- The symbol of one with anything is trivial.
- Skew-symmetry and bilinearity hold.
- The symbol is defined for commuting units of any ring, not only for a field; the field case is
  where Matsumoto's theorem applies.

**Depends on.** **inside this roadmap** `star-product`, `steinberg-group-finite-rank`, `stabilisation`; **baseline** `mathlib:Matrix.diag2_decompose`, `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`, `mathlib:Units`.

**Source.** Kbook.2013, III.5.10 and III.5.10.1 (PDF p. 233): “Definition 5.10. If r, s are commuting units in a ring R, we define the Steinberg symbol {r, s} in K_2(R) to be the star product of the two displayed diagonal matrices. ... For any unit r of R we set w_ij(r) = x_ij(r) x_ji(-r^{-1}) x_ij(r) and h_ij(r) = w_ij(r) w_ij(-1). ... By definition we then have: {r, s} = [h_12(r), h_13(s)] = [h_ij(r), h_ik(s)].” — The definition and the two descriptions, as displayed.

### `steinberg-identity` — The Steinberg identity and the symbol of a unit with its negative ★

*theorem* · planet **Steinberg identity**

If r and one minus r are both units of R then the symbol of r with one minus r is trivial, and
the symbol of r with minus r is trivial. The second statement holds for every unit r, even when
one minus r is not a unit.

**Hypotheses.** R is an associative unital ring; r is a unit, and for the first statement one minus r is also a unit.

**Construction and proof.**

1. Prove the first statement by the explicit computation in the Steinberg group that the source
   performs: rewrite the product of the three w-elements using the commutation rules, and use
   the four identities among r and one minus r that the source lists, to obtain the w-element of
   the product.
1. Multiply by the w-element at minus one to obtain the multiplicativity of the h-elements when
   the two arguments sum to one, and deduce that the symbol vanishes.
1. Deduce the second statement from the first by writing minus r as the quotient of one minus r
   by one minus r inverse and expanding.
1. For the general form of the second statement record the argument the source gives: it follows
   from an injectivity statement between K_2 of two localisations, proved later in the source,
   or from a direct proof in Milnor's book.

**Acceptance.**

- The symbol of r with one minus r vanishes whenever both are units.
- The symbol of r with minus r vanishes for every unit, which is the stronger form.
- The two statements have different hypotheses and the difference is recorded, not smoothed
  over.

**Depends on.** **inside this roadmap** `steinberg-symbol`, `steinberg-group-finite-rank`.

**Source.** Kbook.2013, III.5.10.2, III.5.10.3 and III.5.10.4 (PDF pp. 233-234): “Lemma 5.10.2. If both r and 1 - r are units of R, then in K_2(R) we have: {r, 1 - r} = 1 and {r, -r} = 1. ... Remark 5.10.4. The equation {r, -r} = 1 holds more generally for every unit r, even if 1 - r is not a unit.” — The lemma and the remark, as displayed, with the computation of the cited proof.

### `symbol-consequences` — Skew-symmetry, and the correct value of the symbol of a unit with itself

*lemma*

The Steinberg symbols are skew-symmetric: the symbol of a with b times the symbol of b with a is
trivial. The symbol of a with itself is the symbol of a with minus one, which is an element of
order dividing two; it is not trivial in general. Asserting that the symbol of a with itself
vanishes integrally is an error.

**Hypotheses.** R is an associative unital ring; a and b are commuting units.

**Construction and proof.**

1. Derive skew-symmetry from the identity for the symbol of a unit with its negative: expand the
   symbol of a with minus ab and the symbol of b with minus ab and use bilinearity.
1. From the vanishing of the symbol of a with minus a and bilinearity obtain that the symbol of
   a with itself is the inverse of the symbol of a with minus one.
1. Prove that the symbol of a with minus one squares to the symbol of a with one, which is
   trivial, so it has order dividing two; hence the symbol of a with itself equals the symbol of
   a with minus one.
1. Record the negative statement: skew-symmetry gives that the square of the symbol of a with
   itself is trivial, and nothing more.

**Acceptance.**

- For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z), so
  the symbol of a unit with itself is not always trivial.
- For a finite field of even order the symbol of a with itself is trivial, because minus one is
  one there.
- Skew-symmetry holds in general and is what the alternating property of Milnor K-theory rests
  on.

**Depends on.** **inside this roadmap** `steinberg-identity`, `steinberg-symbol`.

**Source.** Kbook.2013, III.6.1 (PDF p. 239): “Note that the calculation (5.10.3) implies that {x, -x} = 1 for all x, and this implies that the Steinberg symbols are skew-symmetric: {x, y}{y, x} = {x, -xy}{y, -xy} = {xy, -xy} = 1.” — The derivation of skew-symmetry, as displayed; the value of the symbol of a unit with itself follows from the same identity.

### `symbols-generate` — Steinberg symbols generate K_2 of a semilocal ring

*theorem*

If R is a field, a division ring, a local ring or a semilocal ring then K_2(R) is generated by
the Steinberg symbols. The statement is not asserted for a general ring.

**Hypotheses.** R is a field, a division ring, a local ring or a semilocal ring.

**Construction and proof.**

1. Import the generation statement from the source, which attributes the field and division-ring
   cases to Milnor's book and the semilocal extension to Dennis and Stein.
1. Record the hypothesis: for a general ring the symbols need not generate, which is why the
   Dennis-Stein symbols are introduced.
1. Record the consequence used below: for a field the presentation of Matsumoto's theorem is a
   presentation of the whole group, not of a subgroup.

**Acceptance.**

- For a field the symbols generate, which Matsumoto's theorem then presents.
- For a general commutative ring generation is not asserted.
- The Dennis-Stein symbols are introduced precisely because of that gap.

**Depends on.** **inside this roadmap** `steinberg-symbol`, `k2-definition`.

**Source.** Kbook.2013, III.5.10.5 (PDF p. 234): “Theorem 5.10.5. If R is a field, division ring, local ring, or even a semilocal ring, then K_2(R) is generated by the Steinberg symbols {r, s}.” — The theorem and its hypotheses, as displayed.

### `matsumoto` — Matsumoto's theorem ★

*theorem* · planet **Matsumoto's theorem**

For a field F the group K_2(F) is the abelian group generated by the Steinberg symbols of pairs
of nonzero elements, subject only to bilinearity in each entry and the Steinberg identity that
the symbol of x with one minus x is trivial for x different from zero and one. Equivalently,
K_2(F) is the quotient of the tensor square of the multiplicative group by the subgroup
generated by the elements x tensor one minus x.

**Hypotheses.** F is a field.

**Construction and proof.**

1. State the presentation and prove that the displayed relations hold, which is the content of
   the symbol nodes above.
1. Prove the converse, that no further relations are needed. This is the normal-form argument:
   it is not enough to check that the map respects the relations, and the source refers to
   Milnor's book for a self-contained proof, which this node follows.
1. Record the reformulation as a quotient of the tensor square, which is the form Milnor
   K-theory generalises.
1. Deduce skew-symmetry inside the presentation, by the computation already recorded.

**Acceptance.**

- The presentation gives K_2 of a finite field trivial, which is the next node and a genuine
  test of the presentation.
- The reformulation as a quotient of the tensor square is the degree-two case of Milnor
  K-theory.
- The theorem is a presentation, not merely a surjection: the normal-form argument is what
  distinguishes the two, and a proof that only checks the relations is incomplete.

**Depends on.** **inside this roadmap** `steinberg-symbol`, `steinberg-identity`, `symbols-generate`, `symbol-consequences`.

**Source.** Kbook.2013, III.6.1 (PDF p. 239): “Matsumoto's Theorem 6.1. If F is a field then K_2(F) is the abelian group generated by the set of Steinberg symbols {x, y} with x, y in F^x, subject only to the relations: (Bilinearity) ...; (Steinberg Identity) {x, 1 - x} = 1 for all x not 0, 1. In other words, K_2(F) is the quotient of F^x tensor F^x by the subgroup generated by the elements x tensor (1 - x).” — The theorem and its reformulation, as displayed.

### `k2-finite-field` — K_2 of a finite field is trivial

*theorem*

For every finite field the group K_2 is trivial.

**Hypotheses.** F is a finite field with q elements.

**Construction and proof.**

1. Reduce by Matsumoto's theorem to showing that the generator of the tensor square of the
   cyclic unit group dies, that is, that the symbol of a generator with itself is trivial.
1. In even characteristic use that minus one is one, so the symbol of a generator with itself is
   the symbol of the generator with its negative, which is trivial.
1. In odd characteristic use skew-symmetry to see that the symbol of the generator with itself
   squares to the trivial element, so it equals the symbol of any odd power of the generator
   with any other odd power.
1. Conclude by finding a non-square u for which one minus u is also a non-square: the map
   sending u to one minus u is an involution of the set of elements different from zero and one,
   which has (q minus one) halves non-squares and only (q minus three) halves squares, so such a
   u exists.
1. Apply the Steinberg identity at that u.

**Acceptance.**

- The counting step is what makes the argument work and is recorded, not asserted.
- The two characteristics are treated separately.
- The conclusion feeds the Milnor K-theory examples: all higher Milnor K-groups of a finite
  field vanish.

**Depends on.** **inside this roadmap** `matsumoto`, `symbol-consequences`; **baseline** `mathlib:ZMod`.

**Source.** Kbook.2013, III.6.1.1 (PDF p. 239): “Corollary 6.1.1. K_2(F_q) = 1 for every finite field F_q.” — The corollary, with the counting proof of the source.

### `rational-function-field` — K_2 of a field is a direct summand of K_2 of a rational function field, and the torsion kernel

*lemma*

For a field F the natural map from K_2(F) to K_2 of the rational function field in one variable
is a split injection, split by the leading-coefficient map. Consequently K_2(F) injects into K_2
of every purely transcendental extension, and for an arbitrary field extension the kernel of the
map on K_2 is a torsion subgroup.

**Hypotheses.** F is a field; the extension is arbitrary for the last statement.

**Construction and proof.**

1. Define the leading coefficient of a rational function as the quotient of the leading
   coefficients of numerator and denominator, and define a map on symbols by applying it to both
   entries.
1. Check the presentation of Matsumoto's theorem: bilinearity is immediate, and the Steinberg
   identity holds because the leading coefficient of one minus a rational function is one, one
   minus the leading coefficient, or minus the leading coefficient, according to the comparison
   of the degrees.
1. Deduce that the map is well defined and splits the natural inclusion.
1. Pass to filtered colimits for an arbitrary purely transcendental extension.
1. For the last statement reduce to a finite extension and use that the composite of restriction
   and transfer is multiplication by the degree.

**Acceptance.**

- The leading-coefficient map is a homomorphism, which is the content of the three-case check.
- The kernel of the map on K_2 for an arbitrary extension is torsion, not zero.
- The splitting is by an explicit map, not by an abstract argument.

**Depends on.** **inside this roadmap** `matsumoto`, `k2-finite-field`.

**Source.** Kbook.2013, III.6.1.2 and III.6.1.3 (PDF p. 239): “Example 6.1.2. Let F(t) be a rational function field in one variable t over F. Then K_2(F) is a direct summand of K_2 F(t). ... Lemma 6.1.3. For every field extension F in E, the kernel of K_2(F) -> K_2(E) is a torsion subgroup.” — The example and the lemma, with the leading-coefficient construction of the cited proof.

### `milnor-k-theory` — Milnor K-theory of a field ★

*definition* · planet **Milnor K-theory**

For a field F form the tensor algebra of the multiplicative group written additively, with the
degree-one element attached to a nonzero x written l(x). Define the graded ring K^M of F as the
quotient of that tensor algebra by the two-sided ideal generated by the homogeneous elements
l(x) tensor l(one minus x) with x different from zero and one. The Milnor K-group in degree n is
the degree-n part, presented by symbols that are multiplicative in each entry and vanish when
two consecutive entries sum to one. Degree zero is the integers and degree one is the
multiplicative group written additively.

**Hypotheses.** F is a field. All tensor products are over the integers.

**Construction and proof.**

1. Form the tensor algebra of the unit group, using the additive type tag and the pinned tensor
   algebra.
1. Form the two-sided ideal generated by the displayed homogeneous elements and take the
   quotient as a graded ring, using the pinned quotient construction.
1. Prove that the quotient is graded, so that the degree-n parts are defined.
1. Prove the two low-degree identifications, degree zero and degree one.
1. Prove the presentation statement: the degree-n group is generated by the symbols subject to
   multiplicativity in each entry and the vanishing relation.
1. Prove functoriality in the field.

**API.**

| name | role | statement |
| --- | --- | --- |
| `milnorK` | data | The graded ring, and its degree-n part. |
| `milnorK.symbol` | constructor | The symbol of an n-tuple of nonzero elements. |
| `milnorK.symbol_mul` | relation | Multiplicativity in each entry. |
| `milnorK.symbol_steinberg` | relation | Vanishing when two consecutive entries sum to one. |
| `milnorK.zero` | compatibility | Degree zero is the integers. |
| `milnorK.one` | compatibility | Degree one is the unit group written additively. |
| `milnorK.map` | functoriality | Functoriality in the field. |

**Used by.** *T.2's Matsumoto comparison*: the degree-two group is identified with K_2. *HigherLocalFieldsAndHigherClassFieldTheory HL.1*: that layer assembles these groups along a residue tower and imports rather than rebuilds them. *K3BlochGroups V.2*: the degree-three group is the source of the map whose cokernel is the indecomposable K_3.

**Unit tests.**

- `degree_zero_one` — Degree zero is the integers and degree one is the unit group.
- `finite_field` — For a finite field every degree at least two vanishes.
- `graded` — The quotient is graded, because the ideal is generated in a single degree.
- `not_alternating_by_fiat` — The alternating property is a theorem, proved from skew-symmetry
  in degree two, not an axiom.

**Acceptance.**

- Degree zero is the integers and degree one is the unit group written additively.
- Degree two is Matsumoto's presentation, hence K_2(F), which is the next node.
- The ideal is generated by homogeneous elements of degree two, so the quotient is graded; a
  non-homogeneous generator would destroy the grading.

**Depends on.** **baseline** `mathlib:TensorAlgebra`, `mathlib:Additive`, `mathlib:RingQuot`, `mathlib:Units`.

**Source.** Kbook.2013, III.7.1 (PDF p. 253): “Definition 7.1. The graded ring K^M_*(F) is defined to be the quotient of T(F^x) by the ideal generated by the homogeneous elements l(x) tensor l(1 - x) with x not 0, 1. The Milnor K-group K^M_n(F) is defined to be the subgroup of elements of degree n.” — The definition, as displayed.

### `milnor-alternating` — Milnor symbols are alternating

*lemma*

Interchanging two entries of a Milnor symbol replaces it by its inverse, and consequently for
any permutation the symbol of the permuted tuple is the sign of the permutation times the
original symbol.

**Hypotheses.** F is a field; the entries are nonzero.

**Construction and proof.**

1. Use that in degree two the sum of the symbol and its transpose vanishes, which is skew-
   symmetry proved above.
1. Deduce that interchanging two adjacent entries of an n-tuple changes the sign, since the
   degree-two relation can be applied in place inside the product.
1. Extend to an arbitrary transposition and then to an arbitrary permutation by decomposing it
   into transpositions.
1. Record what this does not say: the symbol with a repeated entry need not vanish integrally,
   and equals the symbol with that entry replaced by minus one in the appropriate position.

**Acceptance.**

- A transposition changes the sign.
- A symbol with a repeated entry is two-torsion but not necessarily zero, which is the same
  caveat as in degree two.
- For a field containing a square root of minus one the repeated-entry symbol does vanish.

**Depends on.** **inside this roadmap** `milnor-k-theory`, `symbol-consequences`.

**Source.** Kbook.2013, III.7.1 (PDF p. 253): “Since {x_i, x_{i+1}} + {x_{i+1}, x_i} = 0 in K^M_2(F), we see that interchanging two entries in {x_1, ..., x_n} yields the inverse. It follows that these symbols are alternating.” — The derivation, as displayed.

### `milnor-examples` — Milnor K-theory in the standard examples

*lemma*

For a finite field the Milnor K-groups vanish in every degree at least two, and for a field of
transcendence degree one over a finite field they vanish in every degree at least three. For an
algebraically closed field they are uniquely divisible. For the real numbers each group is the
direct sum of a cyclic group of order two generated by the symbol with every entry minus one and
a divisible subgroup, and the quotient by twice the group is the polynomial ring over the field
with two elements on the class of minus one. For a number field with r_1 real embeddings the
group in every degree at least three is the elementary abelian two-group of rank r_1.

**Hypotheses.** The field is as named in each clause.

**Construction and proof.**

1. For a finite field use that the degree-two group vanishes, and that the ring is generated in
   degree one, so every higher degree vanishes; cite Bass and Tate for the transcendence-degree-
   one statement.
1. For an algebraically closed field prove divisibility from divisibility of the unit group, and
   cite the source for the absence of torsion.
1. For the real numbers construct the graded ring map to the polynomial ring over the field with
   two elements sending the class of a negative number to the indeterminate and of a positive
   number to zero, check that it kills the Steinberg elements, and read off the splitting by
   induction.
1. For a number field construct the map to the product of the real groups over the real
   embeddings and cite Bass and Tate for the isomorphism in degree at least three.

**Acceptance.**

- For a finite field every degree at least two vanishes.
- For the real numbers the symbol with every entry minus one is nonzero, which is the generator
  of the two-torsion.
- For a number field the answer in degree at least three is elementary abelian of rank r_1,
  which K3BlochGroups V.2 uses in degree three.

**Depends on.** **inside this roadmap** `milnor-k-theory`, `k2-finite-field`; **baseline** `mathlib:NumberField.InfinitePlace.nrRealPlaces`.

**Source.** Kbook.2013, III.7.2 (PDF pp. 253-254): “Examples 7.2. (a) If F_q is a finite field, then K^M_n(F_q) = 0 for all n >= 2 ... (d) When F is a number field, let r_1 be the number of embeddings of F into R. ... Bass and Tate proved that this map is an isomorphism for all n >= 3: K^M_n(F) = (Z/2)^{r_1}.” — The four examples, as displayed.

## Requests to other roadmaps

- `GeneralAlgebraicKTheory:K.2` — The K-theory space and its plus-construction model, K_1 as the
  abelianisation of the stable general linear group, the identification of E(R) with its
  commutator subgroup, and the products on K-theory that the graded map uses. This layer
  supplies the explicit K_2 model that K.2:low-degree-comparisons assembles; the two must not
  both construct it.
- `StableHomotopyKTheory:H.3` — The plus construction with its universal property, its homology
  isomorphism and the identification of the plus construction on the classifying space of a
  perfect normal subgroup with the universal cover, which is what turns the second homology into
  the second homotopy group.
- `K3BlochGroups:V.2` — The indecomposable K_3 as the cokernel of the degree-three component of
  the graded map, and the injectivity of that component for a field. This layer constructs the
  map; that layer owns the quotient and the injectivity theorem.
- `HigherLocalFieldsAndHigherClassFieldTheory:HL.1` — Confirmation that the all-degree Milnor
  K-theory and the higher tame symbols are imported from here and assembled along a residue
  tower there, as the accepted restructuring RS-28 records, so that neither side rebuilds them.

## Gaps

**Matsumoto's theorem is stated, not decomposed.** The K-book states Matsumoto's theorem and refers to Milnor's 1971 book, section 12, for a self-
contained proof; that book was not obtained. The node states the theorem, records that the
normal-form and presentation argument is what the proof consists of, and does not pretend that
checking the relations is a proof. A continuation that obtains Milnor's book should decompose
that argument.

**Two statements are used exactly as the K-book gives them.** The injectivity of the subgroup generated by the symbols x_in(r) into E(R), which the source
relegates to an exercise and which the proof of Steinberg's centre theorem needs, and the
generation of K_2 by symbols for semilocal rings, attributed to Milnor and to Dennis and Stein.
Neither original was obtained. The Dennis-Stein symbols themselves belong to T.6 and are owned
by the companion packet for the T.3 part.

**The general form of the symbol of a unit with its negative rests on a later chapter.** The statement that the symbol of r with minus r is trivial for every unit, even when one minus r
is not a unit, is deduced in the source from an injectivity between K_2 of two localisations
proved in its chapter five, or from a direct proof in Milnor's book. Neither is decomposed here,
and the node records the dependence.

**Bass and Tate are cited for two Milnor K-theory computations.** The vanishing of the Milnor K-groups in degree at least three for a global field of finite
characteristic, and the isomorphism with the elementary abelian two-group of rank r_1 in degree
at least three for a number field, are both attributed by the source to Bass and Tate. That
paper was not obtained; the node states the results with the attribution.

## Structure

## Mistakes found in the sources

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.1.json

reports 0 errors and 0 warnings against the pinned declaration index. The suggested Lean file was not compiled: no Lean toolchain at the pinned commits was available in this session, and the file is signatures and `example` statements only.
