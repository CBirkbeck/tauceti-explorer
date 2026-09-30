# Explicit K₂: symbols, residues and reciprocity — blueprint (part from T.1)

Blueprint packet for the roadmap `K2SymbolsBrauer`, stages T.1 and T.2 with their sub-stages (`research/blueprint/packets/K2SymbolsBrauer--T.1.json`). Written for job `BP-K2SymbolsBrauer--T.1`, issue #761, by Claude Code, session `cc-7b31c4`, 24 September 2026. Nothing here is formalised: every node carries `implementationStatus: "unchecked"`, and the suggested Lean file is signatures only.

**Source.** Weibel, *The K-book: An Introduction to Algebraic K-theory* (Graduate Studies in Mathematics 145), read in the author-hosted combined draft of 29 August 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`: III.5.1–5.5.1, III.5.10–5.11.1, III.6.1–6.1.3, III.7.1–7.3.1, and IV.1.20 with Exercise IV.1.9. **Not obtained:** Milnor's 1971 book, to which the source refers for the proof of Matsumoto's theorem, and the papers of Bass–Tate, Dennis–Stein, and Maazen–Stienstra–van der Kallen/Keune; the four statements taken on their authority are listed as gaps. **Added for the recognition package (2026-09-30):** Clara Löh, *Group Cohomology*, lecture notes, Universität Regensburg, Sommersemester 2019 (https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf, SHA-256 `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76`): Theorem 1.4.1, Corollary 1.4.6, Theorem 1.5.1, Proposition 1.6.21–Corollary 1.6.23, Theorem 3.2.12, Remark 3.2.14 and Theorem 3.2.18 with its proof; and the K-book re-read at III.5.3–5.5.1, Exercise III.5.7, IV.1.7–1.7.1 and Exercises IV.1.8–1.9.

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

The universal-central-extension package is planned here in full, as the earliest purely
algebraic consumer of it (red-team findings RT-AREA-ktheory-1/29 and /30): pullbacks and
composites of central extensions, splitting over a universal extension, H₁ as the
abelianisation, superperfect groups, existence of a universal central extension for every
perfect group, Hopf's formula through its four-term exact sequence, the kernel as H₂(G; ℤ), the
four implications of the Recognition Theorem, and the lift of a homomorphism of perfect groups
to their universal central extensions with its naturality on kernels. Three of these nodes
(`central-extension-comp`, `split-extensions-kill-h2`, `uce-source-superperfect`) were first
planned in `K3BlochGroups:V.1` and moved here; V.1 now deduces the superperfection of St(A) as a
corollary. `StableHomotopyKTheory:H.3` should import the Recognition Theorem and the kernel
identification for its plus-construction node instead of citing K-book III.5.4 unread. The one
open input is the Hochschild–Serre low-degree sequence behind Hopf's formula (gap below).

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

A central extension of G by an abelian group A is a GroupExtension A G whose included kernel
lies in the centre of the total group. It is split if it admits a section, equivalently if it is
equivalent, with identity on A and G, to the product extension. Equivalence retains the kernel
and quotient identifications.

**Hypotheses.** G is a group; A is an abelian group.

**Construction and proof.**

1. Add the central-kernel predicate to GroupExtension; exactness identifies the image of its
   inclusion with the projection kernel.
1. Use the product construction and the displayed section formula to characterize splitness.
1. Use existing extension equivalences, with fixed kernel and quotient maps; no classification
   is asserted in this definition.

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsCentralExtension` | characterisation | The predicate that an extension is central. |
| `CentralExtension.split` | characterisation | Splitness. |
| `CentralExtension.Equiv` | structure | Equivalence of two extensions of G by A. |
| `CentralExtension.product` | constructor | The inclusion A -> A x G and projection A x G -> G form a split central extension. |
| `CentralExtension.section_equiv` | equivalence | A homomorphic section gives an extension equivalence to A x G, with formula (a,g) -> inl(a)*section(g). |

**Used by.** *T.1's universal central extension*: the universal object is defined in this category. *T.1's Recognition Theorem*: the characterisation by splitting of central extensions is stated here. *K3BlochGroups:V.1/steinberg-superperfect*: superperfection of St(A) is the corollary of T.1:classical/uce-source-superperfect for this notion of central extension. *StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension*: π_2(BG⁺) is central in π_1 F(f), which is a central extension of P (K-book IV.1.7).

**Unit tests.**

- `product_extension` — For A=C2 and G=C2, the product projection is central and split.
- `cyclic_nonsplit` — The quotient C4 -> C2 modulo two is central but has no homomorphic
  section.
- `marked_kernel` — For C9 -> C3 modulo three, kernel inclusions C3 -> C9 given by 1 -> 3 and 1
  -> 6 give inequivalent extensions although both total groups are C9: a map over C3 has
  multiplier 1 mod 3, whereas preserving these marked kernels would require multiplier 2 mod 3.

**Acceptance.**

- The split extension corresponds to the zero cohomology class.
- An extension built from a trivial-action factor set is central, which is the pinned statement.
- Equivalence is finer than isomorphism of groups: two inequivalent extensions can have
  isomorphic total groups.

**Depends on.** **baseline** `mathlib:GroupExtension`, `tauceti:TauCeti.FactorSet.inl_range_le_center`, `mathlib:Subgroup.center`.

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
1. Record that existence is not automatic; for perfect groups it is perfect-uce-exists, and a
   group that is not perfect has none (uce-perfect).

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsUniversalCentralExtension` | characterisation | The universal property. |
| `uce_unique` | characterisation | Uniqueness up to isomorphism over G. |
| `uce_hom` | constructor | The unique homomorphism to any central extension. |
| `uce_hom_unique` | characterisation | Its uniqueness. |
| `UCE.equiv_over` | equivalence | Two universal central extensions of G have a unique equivalence commuting with their projections. |

**Used by.** *T.1's identification of the Steinberg group*: St(R) is the universal central extension of E(R). *K3BlochGroups:V.1/steinberg-superperfect*: the source of a universal central extension is superperfect (T.1:classical/uce-source-superperfect), applied to St(A) → E(A). *T.1:plus*: the comparison with H_2 runs through the universal property. *StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension*: π_1 of the homotopy fibre of the plus construction relative to a perfect normal subgroup P is the universal central extension of P (K-book IV.1.7).

**Unit tests.**

- `trivial_uce` — The identity extension of the trivial group is universal: its unique map to
  any group is over the trivial quotient.
- `cyclic_obstruction` — The identity C2 -> C2 is not universal; it has two different lifts to
  C2 x C2 -> C2, given by the zero and identity first coordinates.
- `split_target` — For a universal extension X -> G and abelian A, its map to A x G -> G is
  (1,p(x)); perfectness forces every map X -> A to be trivial.

**Acceptance.**

- The universal object is unique up to isomorphism over G.
- A group with a nontrivial abelianisation has none, which is the next lemma.
- Existence is a theorem, not part of the definition.

**Depends on.** **inside this roadmap** `central-extension`, `central-extension-hom`.

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

### `central-extension-pullback` — Pulling a central extension back along a homomorphism

*construction*

Let q : Y → G be a surjective homomorphism whose kernel lies in the centre of Y, and let f : H →
G be any homomorphism. The pullback P = {(h, y) ∈ H × Y : f(h) = q(y)} is a subgroup of H × Y,
and its first projection pr_H : P → H is a central extension of H: it is surjective, and its
kernel {(1, y) : y ∈ ker q} is central in P and isomorphic to ker q. The second projection pr_Y
: P → Y satisfies q ∘ pr_Y = f ∘ pr_H, and a pair of homomorphisms a : X → H, b : X → Y with f ∘
a = q ∘ b factors uniquely through P.

**Hypotheses.** G, H and Y are groups; q : Y → G is surjective and ker q is contained in the centre of Y; f : H → G is a homomorphism.

**Construction and proof.**

1. P is the subgroup of H × Y on which the homomorphisms f ∘ fst and q ∘ snd agree
   (MonoidHom.eqLocus), so it is a group.
1. pr_H is surjective: for h in H choose y with q(y) = f(h), using that q is surjective.
1. ker pr_H = {(1, y) : q(y) = 1}. For (h', y') in P, (h', y')(1, y)(h', y')⁻¹ = (1, y'yy'⁻¹) =
   (1, y) because y is central in Y; so the kernel is central, and y ↦ (1, y) identifies ker q
   with it.
1. For a, b with f ∘ a = q ∘ b, the product homomorphism X → H × Y lands in P; it is the unique
   factorisation because P → H × Y is injective.

**API.**

| name | role | statement |
| --- | --- | --- |
| `CentralExtension.pullback` | constructor | The subgroup P = {(h, y) : f(h) = q(y)} of H × Y, for q : Y → G central and surjective and f : H → G. |
| `CentralExtension.pullbackFst` | projection | pr_H : P → H; it is surjective and its kernel is central. |
| `CentralExtension.pullbackSnd` | projection | pr_Y : P → Y, with q ∘ pr_Y = f ∘ pr_H. |
| `CentralExtension.pullbackLift` | universal-property | For a : X → H and b : X → Y with f ∘ a = q ∘ b, the unique homomorphism X → P with pr_H ∘ lift = a and pr_Y ∘ lift = b. |
| `CentralExtension.pullbackKerEquiv` | characterisation | ker pr_H ≅ ker q, by y ↦ (1, y). |
| `CentralExtension.pullbackId` | compatibility | Along the identity of G the pullback is isomorphic to Y over G, by y ↦ (q(y), y). |

**Used by.** *K2SymbolsBrauer:T.1:classical/split-central-extension-universal*: a central extension of G is pulled back along X → G, where condition (2) of the Recognition Theorem splits it (K-book III.5.4, '(2) ⇒ (1) is immediate'). *K2SymbolsBrauer:T.1:classical/uce-lift*: the lift of a homomorphism of bases to universal central extensions factors through the pullback of the target extension.

**Unit tests.**

- `pullback_id` (degenerate) — For f = id_G, y ↦ (q(y), y) is an isomorphism from Y onto P
  commuting with the projections to G.
- `pullback_trivial_subgroup` (computation) — For q : C_4 → C_2 reduction modulo two and f the
  inclusion of the trivial group, P ≅ C_2 and pr_H : C_2 → 1.
- `pullback_split` (characterisation) — The pullback of the product projection A × G → G along f
  : H → G is isomorphic over H to the product projection A × H → H.
- `pullback_noncentral` (non-example) — For q the sign map S_3 → C_2, whose kernel A_3 is not
  central, and f = id, the kernel of pr_H is not central in P ≅ S_3: the centrality hypothesis
  is used.

**Acceptance.**

- Along the identity of G the pullback is isomorphic over G to Y, by y ↦ (q(y), y).
- The pullback of the product projection A × G → G along f is isomorphic over H to A × H → H.
- Centrality is inherited but universality is not: along the inclusion of the trivial group the
  pullback is ker q → 1, which is universal only when ker q is trivial, since a universal
  central extension has a perfect source and ker q is abelian.

**Depends on.** **inside this roadmap** `central-extension`, `central-extension-hom`; **baseline** `mathlib:MonoidHom.eqLocus`, `mathlib:MonoidHom.ker`, `mathlib:Subgroup.center`.

**Source.** Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “The implication (1)⇒(2) is Lemma 5.3.2 and Ex. 5.7, and (2) ⇒ (1) is immediate.” — The source calls (2) ⇒ (1) immediate: a central extension Y → G is pulled back along X → G to a central extension of X, which condition (2) splits. The pullback is not displayed in the source; this node makes it a declaration.


### `central-extension-comp` — Composite of central extensions with perfect middle term

*lemma*

Let ρ : Y → X and π : X → G be surjective homomorphisms whose kernels are central in Y and in X.
If X is perfect, then πρ : Y → G is surjective with central kernel.

**Hypotheses.** ker ρ is contained in the centre of Y and ker π in the centre of X; ρ and π are surjective. X is perfect.

**Construction and proof.**

1. Surjectivity of πρ is the composite of two surjections.
1. For z in ker(πρ), ρ(z) is central in X, so [y, z] lies in ker ρ, which is central in Y, for
   every y in Y.
1. Hence y ↦ [y, z] is a homomorphism from Y to the centre of Y, since [yy', z] = [y', z][y, z]
   when the values are central.
1. Its target is abelian, so it kills [Y, Y]; it kills ker ρ, which is central. As X is perfect,
   Y = [Y, Y]·ker ρ, so the homomorphism is trivial and z is central.

**Acceptance.**

- Non-example without perfectness: D_8 → D_8/Z(D_8) ≅ (Z/2)² and (Z/2)² → Z/2 are central
  extensions, but the composite has kernel {1, r², s, sr²}, which contains the non-central
  reflection s.
- With X a universal central extension (perfect by Lemma III.5.3.2) this is the first sentence
  of Exercise III.5.7 as the Recognition Theorem uses it.

**Depends on.** **inside this roadmap** `central-extension`; **baseline** `mathlib:Subgroup.center`, `mathlib:Group.IsPerfect`.

**Source.** Kbook.2013, Exercise III.5.7 (PDF p. 237, printed p. 229): “If Y →ρ X and X →π G are central extensions, show that the “composition” Y →πρ G is also a central extension. If X is a universal central extension of G, conclude that every central extension Y →ρ X splits.” — The first sentence, with the perfectness hypothesis the printed exercise omits: the D_8 example shows the printed statement is false without it (recorded as K3BlochGroups/E2 in the K3BlochGroups packet, where this lemma was first planned as V.1/central-extension-comp). The second sentence is uce-extensions-split.


### `uce-extensions-split` — Central extensions of a universal central extension split

*lemma*

If p : X → G is a universal central extension, then every central extension ρ : Y → X (ρ
surjective with central kernel, Y in the universe of X) has a homomorphic section s : X → Y with
ρ ∘ s = id_X.

**Hypotheses.** p : X → G is a universal central extension. ρ : Y → X is surjective and ker ρ lies in the centre of Y.

**Construction and proof.**

1. X is perfect (K2SymbolsBrauer:T.1/uce-perfect), so p ∘ ρ : Y → G is a central extension
   (central-extension-comp).
1. Universality of p gives σ : X → Y with p ∘ ρ ∘ σ = p.
1. Both ρ ∘ σ and id_X are homomorphisms X → X over G from p to p, so the uniqueness clause of
   universality gives ρ ∘ σ = id_X; σ is the required section.

**Acceptance.**

- For X = G trivial, every central extension A → 1 is split by the trivial homomorphism.
- Universality cannot be dropped: id : C_2 → C_2 is a central extension, and the central
  extension C_4 → C_2 of its source does not split.

**Depends on.** **inside this roadmap** `universal-central-extension`, `uce-perfect`, `central-extension-hom`, `central-extension-comp`.

**Source.** Kbook.2013, Exercise III.5.7 (PDF p. 237, printed p. 229): “If Y →ρ X and X →π G are central extensions, show that the “composition” Y →πρ G is also a central extension. If X is a universal central extension of G, conclude that every central extension Y →ρ X splits.” — The second sentence; the proof steps are the intended solution, using the first sentence with the perfectness of X that Lemma III.5.3.2 supplies.


### `split-extensions-kill-h2` — Split central extensions force vanishing Schur multiplier

*lemma*

Let G be a group in Type. If every central extension of G by the circle group T = Q/Z (AddCircle
(1 : ℚ), written multiplicatively, with trivial G-action) splits, then H_2(G, Z) = 0, integral
homology with trivial coefficients. More precisely, the evaluation map H²(G; T) → Hom(H_2(G, Z),
T) is surjective, and H²(G; T) = 0 under the hypothesis.

**Hypotheses.** G is a group in Type (Mathlib's integral group homology and the Tau Ceti factor-set classification are stated there); T carries the trivial G-action.

**Construction and proof.**

1. Pair inhomogeneous 2-cocycles G × G → T with 2-cycles; the pairing kills coboundaries against
   cycles and cocycles against boundaries, so it descends to ev : H²(G; T) → Hom(H_2(G, Z), T).
1. ev is surjective: a character φ of H_2(G, Z), composed with the projection from 2-cycles,
   extends along the inclusion of 2-cycles into the 2-chains G × G →₀ Z
   (CharacterModule.dual_surjective_of_injective) to a function f : G × G → T; f vanishes on
   boundaries, so it is a 2-cocycle with ev[f] = φ.
1. H²(G; T) = 0: every class is the class of a factor set
   (TauCeti.FactorSet.exists_cohomologyClass_eq), whose extension
   (TauCeti.FactorSet.groupExtension) is central because the action is trivial, hence splits by
   hypothesis, so its class is 0
   (TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero).
1. So every character of H_2(G, Z) vanishes, and H_2(G, Z) = 0 by
   CharacterModule.eq_zero_of_character_apply.

**Acceptance.**

- For G = A_5, H_2 ≅ Z/2 and the non-split central extension SL_2(F_5) → A_5 realises the class
  of the nonzero character, so the hypothesis fails as it must.
- The lemma is Recognition (2) ⇒ (3) in degree two; it uses only extensions by Q/Z, not all
  central extensions.

**Depends on.** **inside this roadmap** `central-extension`; **baseline** `mathlib:groupHomology.H2`, `mathlib:Rep.trivial`, `mathlib:groupCohomology.H2`, `mathlib:groupHomology.inhomogeneousChains`, `mathlib:groupHomology.d₃₂`, `mathlib:AddCircle`, `mathlib:CharacterModule`, `mathlib:CharacterModule.dual_surjective_of_injective`, `mathlib:CharacterModule.eq_zero_of_character_apply`, `tauceti:TauCeti.FactorSet.exists_cohomologyClass_eq`, `tauceti:TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`, `tauceti:TauCeti.FactorSet.groupExtension`.

**Sources.**

- Kbook.2013, III.5.3 (PDF p. 227, printed p. 219): “It is well-known that the equivalence classes of central extensions of G by a fixed group A are in 1–1 correspondence with the elements of the cohomology group H2(G; A)” — The classification of central extensions by H² used in the third step, with the trivial action on T.
- Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.” — The implication (2) ⇒ (3) in degree two that this lemma supplies. First planned as K3BlochGroups:V.1/split-extensions-kill-h2 (review REV-K3BlochGroups); moved here by FIX-RT-AREA-ktheory-1.


### `h1-trivial-perfect` — First integral homology is the abelianisation; vanishing is perfectness

*lemma*

For a group G in Type, groupHomology.H1AddEquivOfIsTrivial for the trivial representation Z,
followed by the unit isomorphism Additive(G_ab) ⊗_Z Z ≅ Additive(G_ab) (TensorProduct.rid), is
an isomorphism H_1(G, Z) ≅ Additive(G_ab), natural in G: for f : G → H it carries
groupHomology.map f to Abelianization.map f. Consequently H_1(G, Z) = 0 if and only if G is
perfect.

**Hypotheses.** G is a group in Type; Z carries the trivial action (Rep.trivial ℤ G ℤ).

**Construction and proof.**

1. Apply groupHomology.H1AddEquivOfIsTrivial to A = Rep.trivial ℤ G ℤ and compose with
   TensorProduct.rid ℤ.
1. Naturality: both composites send the class of the 1-cycle single g 1 to the class of f(g)
   (H1AddEquivOfIsTrivial_single and groupHomology.H1π_comp_map); such classes generate H_1.
1. G_ab = G/[G, G] is trivial exactly when commutator G = ⊤, which is Group.isPerfect_def.

**Acceptance.**

- H_1(Z/2, Z) ≅ Z/2 ≠ 0, and Z/2 is not perfect.
- H_1(A_5, Z) = 0 because A_5 is perfect.
- The identification uses the trivial action: with a nontrivial coefficient module H_1 is not
  the abelianisation.

**Depends on.** **baseline** `mathlib:groupHomology.H1`, `mathlib:groupHomology.H1AddEquivOfIsTrivial`, `mathlib:groupHomology.map`, `mathlib:groupHomology.H1π_comp_map`, `mathlib:Rep.trivial`, `mathlib:TensorProduct.rid`, `mathlib:Abelianization`, `mathlib:Abelianization.map`, `mathlib:Group.IsPerfect`, `mathlib:Group.isPerfect_def`.

**Sources.**

- Loeh.GroupCohomology.2019, Corollary 1.4.6 (printed p. 23; PDF p. 31): “Corollary 1.4.6 (homological characterisation of perfect groups). Let G be a group. Then G is perfect if and only if H1(G; Z) ≅ 0.” — The characterisation of perfectness, which is what the Recognition Theorem's H_1 = 0 means.
- Loeh.GroupCohomology.2019, Theorem 1.4.1 (printed p. 20; PDF p. 28): “Theorem 1.4.1 (group homology in degree 1). Let G be a group. Then (where Z carries the trivial G-action) there is a canonical isomorphism H1(G; Z) ≅ Gab.” — The natural isomorphism with the abelianisation; at the pin Mathlib supplies it as H1AddEquivOfIsTrivial up to the unit isomorphism of the tensor product.


### `superperfect` — Superperfect groups

*definition*

A group G in Type is superperfect if H_1(G, Z) = 0 and H_2(G, Z) = 0, where H_n(G, Z) =
groupHomology (Rep.trivial ℤ G ℤ) n is Mathlib's integral group homology with trivial
coefficients. Equivalently (h1-trivial-perfect), G is perfect and H_2(G, Z) = 0. This is
condition (3) of the Recognition Theorem.

**Hypotheses.** G is a group in Type: Mathlib's group homology over ℤ puts the group in the universe of ℤ.

**Construction and proof.**

1. Define the predicate as the conjunction of the two vanishing statements, each as
   subsingleton-ness of the ModuleCat ℤ object.
1. Prove the characterisation by perfectness with h1-trivial-perfect.
1. Prove invariance under group isomorphisms with groupHomology.mapIso.

**API.**

| name | role | statement |
| --- | --- | --- |
| `Group.IsSuperperfect` | characterisation | The predicate H_1(G, Z) = 0 ∧ H_2(G, Z) = 0 for a group G in Type, with trivial integral coefficients. |
| `Group.isSuperperfect_iff` | characterisation | IsSuperperfect G ↔ Group.IsPerfect G ∧ H_2(G, Z) = 0. |
| `Group.IsSuperperfect.isPerfect` | compatibility | A superperfect group is perfect in Mathlib's sense (Group.IsPerfect). |
| `Group.IsSuperperfect.of_mulEquiv` | functoriality | Superperfectness is invariant under group isomorphisms. |
| `Group.IsSuperperfect.of_subsingleton` | example | The trivial group is superperfect. |

**Used by.** *K2SymbolsBrauer:T.1/recognition-theorem*: condition (3) of Recognition Theorem III.5.4, H_1(X; Z) = H_2(X; Z) = 0. *K3BlochGroups:V.1/steinberg-superperfect*: the stable Steinberg group is superperfect, which makes BSt(A)⁺ two-connected. *StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension*: π_1 of the acyclic homotopy fibre of a plus construction is perfect with H_2 = 0, hence the universal central extension (K-book IV.1.7).

**Unit tests.**

- `isSuperperfect_trivial` (degenerate) — The trivial group is superperfect.
- `not_isSuperperfect_cyclic` (non-example) — Z/2 is not superperfect: H_1(Z/2, Z) ≅ Z/2.
- `not_isSuperperfect_free` (non-example) — The free group on one generator is not superperfect
  although its H_2 vanishes (free-group-higher-homology): a definition asking only for H_2 = 0
  fails this test.
- `not_isSuperperfect_alternating` (non-example) — A_5 is perfect but not superperfect (H_2(A_5,
  Z) ≅ Z/2): a definition asking only for perfectness fails this test.
- `isSuperperfect_iff_perfect` (compatibility) — For every group G in Type, IsSuperperfect G ↔
  Group.IsPerfect G ∧ H_2(G, Z) = 0.

**Acceptance.**

- The trivial group is superperfect; Z/2 and every nontrivial free group are not.
- A_5 is perfect but not superperfect, so the predicate is strictly stronger than
  Group.IsPerfect.

**Depends on.** **inside this roadmap** `h1-trivial-perfect`; **baseline** `mathlib:groupHomology`, `mathlib:Rep.trivial`, `mathlib:groupHomology.H1`, `mathlib:groupHomology.H2`, `mathlib:groupHomology.mapIso`, `mathlib:Group.IsPerfect`.

**Source.** Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.” — Condition (3). The source does not use the word 'superperfect'; it is the standard name for this condition and the one the consuming roadmaps use.


### `hopf-extension-perfect` — The Hopf extension of a perfect group is perfect

*lemma*

Let π : F → G be a surjective homomorphism with kernel R. If G is perfect, then F = [F, F]·R and
[F, F] = [[F, F], [F, F]]·[R, F]; hence [F, F]/[R, F] is a perfect group.

**Hypotheses.** F is a group and π : F → G is surjective with kernel R (F need not be free). G is perfect.

**Construction and proof.**

1. π maps [F, F] onto [G, G] = G (Subgroup.map_commutator and surjectivity), so every f in F is
   c·r with c in [F, F] and r in R.
1. For f = cr and f' = c'r', the commutator [f, f'] is congruent to [c, c'] modulo [R, F],
   because R is normal in F and its elements are central modulo [R, F].
1. Hence the commutator generators of [F, F] lie in [[F, F], [F, F]]·[R, F]; since [R, F] ⊆ [F,
   F], the quotient [F, F]/[R, F] equals its own commutator subgroup.

**Acceptance.**

- For F free on one generator and R = F (G trivial), [F, F]/[R, F] is trivial, hence perfect.
- Perfectness of G is needed: for F free on a, b and R = [F, F] (G = Z²), [F, F]/[[F, F], F] is
  a nontrivial abelian group, detected by [a, b] in the integral Heisenberg quotient, so it is
  not perfect.

**Depends on.** **inside this roadmap** `commutator-central-extension`; **baseline** `mathlib:Group.IsPerfect`, `mathlib:commutator`, `mathlib:Subgroup.map_commutator`.

**Source.** Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “Given any central extension X of G, the map F → G lifts to a map h : F → X because F is free. Since h(R) is in the center of X, h([R, F]) = 1. Thus h induces a map from [F, F]/[R, F] to X over G. This map is unique by Lemma 5.3.3.” — Lemma 5.3.3 applies only to a perfect source, here [F, F]/[R, F]; the source uses its perfectness without comment, and this node supplies it.


### `perfect-uce-exists` — Every perfect group has a universal central extension

*theorem*

Let G be a perfect group and π : F → G a surjection from a free group F = FreeGroup S, with
kernel R. The restricted projection [F, F]/[R, F] → G (commutator-central-extension, whose
target [G, G] is G) is a universal central extension of G. In particular every perfect group G
has a universal central extension in its own universe, from the canonical presentation FreeGroup
G → G.

**Hypotheses.** G is perfect. π : FreeGroup S → G is surjective with kernel R.

**Construction and proof.**

1. [F, F]/[R, F] → G is surjective with central kernel (R ∩ [F, F])/[R, F]
   (commutator-central-extension, G perfect).
1. Given a central extension q : Y → G, choose for each generator s in S a preimage in Y of
   π(s); FreeGroup.lift gives h : F → Y with q ∘ h = π.
1. h(R) ⊆ ker q, which is central in Y, so h([R, F]) = 1; restrict h to [F, F] and descend to a
   homomorphism [F, F]/[R, F] → Y over G.
1. Uniqueness: [F, F]/[R, F] is perfect (hopf-extension-perfect) and ker q is central, so
   perfect-extension-rigidity allows at most one homomorphism over G.
1. For existence in general take S = G and π = FreeGroup.lift id.

**Acceptance.**

- For G trivial and S empty the universal central extension is the trivial group.
- Its kernel is the Hopf quotient (R ∩ [F, F])/[R, F], which uce-kernel-h2 identifies with
  H_2(G, Z).
- Perfectness of G cannot be dropped: a group that is not perfect has no universal central
  extension (K2SymbolsBrauer:T.1/uce-perfect).

**Depends on.** **inside this roadmap** `commutator-central-extension`, `relation-central-extension`, `hopf-extension-perfect`, `perfect-extension-rigidity`, `universal-central-extension`; **baseline** `mathlib:FreeGroup`, `mathlib:FreeGroup.lift`, `mathlib:Group.IsPerfect`.

**Sources.**

- Kbook.2013, III.5.4, statement (PDF p. 227, printed p. 219): “Recognition Theorem 5.4. Every perfect group G has a universal central extension, namely the extension (5.3.5): 1 → H2(G; Z) → [F, F]/[R, F] → G → 1.” — The existence half of the theorem, with the extension (5.3.5).
- Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “Given any central extension X of G, the map F → G lifts to a map h : F → X because F is free. Since h(R) is in the center of X, h([R, F]) = 1. Thus h induces a map from [F, F]/[R, F] to X over G. This map is unique by Lemma 5.3.3.” — The proof, followed step by step; the perfectness that Lemma 5.3.3 needs is hopf-extension-perfect.


### `free-group-higher-homology` — Integral homology of a free group vanishes above degree one

*lemma*

Let F be a free group in Type (IsFreeGroup F; for example FreeGroup S). Then H_k(F, Z) = 0 for
every k ≥ 2, with trivial integral coefficients, and H_1(F, Z) is free abelian on a basis of F.

**Hypotheses.** F is a group in Type with IsFreeGroup F.

**Construction and proof.**

1. For F = FreeGroup S, the complex 0 → ZF^(S) → ZF → Z → 0 with e_s ↦ s − 1 followed by the
   augmentation is exact (Löh, Proposition 1.6.21: the image of ∂ is the augmentation ideal, and
   ∂ is injective by a reduced-word support argument).
1. Its two nonzero terms are free, hence projective, representations, so it is a projective
   resolution of Rep.trivial ℤ F ℤ of length one (CategoryTheory.ProjectiveResolution).
1. groupHomologyIso computes H_k(F, Z) as the homology of the coinvariants of this resolution,
   which vanishes for k ≥ 2; in degree one ∂ becomes zero after coinvariants and leaves Z^(S).
1. For a general free group transport along the isomorphism with FreeGroup of a basis
   (groupHomology.mapIso).

**Acceptance.**

- H_2(Z, Z) = 0 for the free group of rank one.
- H_1 of the free group on two generators is Z².
- With Nielsen-Schreier (subgroupIsFreeOfIsFree) the lemma applies to every subgroup of a free
  group, as Hopf's formula needs for the relator subgroup.

**Depends on.** **baseline** `mathlib:groupHomology`, `mathlib:groupHomologyIso`, `mathlib:CategoryTheory.ProjectiveResolution`, `mathlib:Rep.trivial`, `mathlib:FreeGroup`, `mathlib:IsFreeGroup`, `mathlib:groupHomology.mapIso`.

**Source.** Loeh.GroupCohomology.2019, Corollary 1.6.23 with Proposition 1.6.21 (printed pp. 56-57; PDF pp. 64-65): “Corollary 1.6.23 ((co)homology of free groups). Let S be a set, let F be the free group freely generated by S, and let A be a ZF-module. Then, for all k ∈ N≥2, Hk(F; A) ≅ 0 and H^k(F; A) ≅ 0.” — The vanishing statement with the length-one free resolution of Proposition 1.6.21 that proves it; the proof steps follow Löh's.


### `hopf-four-term-sequence` — Hopf's four-term exact sequence

*theorem*

Let F be a free group in Type, N a normal subgroup and G = F/N. There is an exact sequence 0 →
H_2(G, Z) → N/[F, N] → F/[F, F] → G_ab → 0 of abelian groups, in which N/[F, N] → F/[F, F] is
induced by the inclusion N ⊆ F and F/[F, F] → G_ab by the projection.

**Hypotheses.** F is a free group in Type; N is normal in F; G = F/N; homology has trivial integral coefficients.

**Construction and proof.**

1. N is free (Nielsen-Schreier, subgroupIsFreeOfIsFree), so H_k(F, Z) = H_k(N, Z) = 0 for k ≥ 2
   (free-group-higher-homology).
1. Exactness at F/[F, F] and surjectivity onto G_ab: this is the Mathlib
   corestriction-coinflation sequence H_1(N, Z) → H_1(F, Z) → H_1(G, Z)
   (groupHomology.H1CoresCoinfOfTrivial_exact, with groupHomology.H1CoresCoinfOfTrivial_g_epi),
   read through h1-trivial-perfect, since H_1(N, Z) = N_ab maps onto N/[F, N].
1. Identify the coinvariants H_1(N; Z)_G with N/[F, N]: H_1(N, Z) = N_ab (h1-trivial-perfect),
   and the coinvariants of the conjugation action of G on N_ab kill exactly the classes of f n
   f⁻¹ n⁻¹.
1. The injection H_2(G, Z) → N/[F, N] with image the kernel of N/[F, N] → F/[F, F]: in the
   Hochschild-Serre spectral sequence E²_pq = H_p(G; H_q(N; Z)) ⇒ H_p+q(F; Z) the rows q ≥ 2
   vanish, H_2(F) = 0 forces d²: E²_20 = H_2(G) → E²_01 = H_1(N)_G to be injective, and
   convergence gives 0 → E²_01/im d² → H_1(F) → H_1(G) → 0 (Löh, proof of Theorem 3.2.18); the
   maps on H_1 are identified, up to sign, with those induced by inclusion and projection
   through naturality of the spectral sequence (Löh, Remark 3.2.14).
1. Gap G-Hopf: the Hochschild-Serre spectral sequence of a group extension, or its low-degree
   exact sequence, is not in Mathlib at the pin, and no atlas stage plans it for discrete
   groups.

**Acceptance.**

- For N = 1 the sequence reads 0 → H_2(F, Z) → 0 → F_ab → F_ab → 0, consistent with H_2(F, Z) =
  0.
- For F free on a and N generated by a^m (G = Z/m): N/[F, N] = N ≅ mZ maps injectively to F_ab =
  Z, so H_2(Z/m, Z) = 0 and G_ab = Z/m.
- Exactness at N/[F, N] identifies H_2(G, Z) with (N ∩ [F, F])/[F, N], which is Hopf's formula.

**Depends on.** **inside this roadmap** `free-group-higher-homology`, `h1-trivial-perfect`; **baseline** `mathlib:subgroupIsFreeOfIsFree`, `mathlib:groupHomology.H1CoresCoinfOfTrivial_exact`, `mathlib:groupHomology.H1CoresCoinfOfTrivial_g_epi`, `mathlib:groupHomology.H2`, `mathlib:Rep.trivial`.

**Sources.**

- Loeh.GroupCohomology.2019, Theorem 3.2.18 (printed p. 129; PDF p. 137): “Theorem 3.2.18 (Hopf's formula). Let F be a free group, let N ⊂ F be a normal subgroup, and let G := F/N. Then there is an exact sequence 0 → H2(G; Z) → H1(N; Z)G → H1(F; Z) → H1(G; Z) → 0” — The four-term sequence, with H1(N; Z)_G rewritten as N/[F, N] as Löh does at the start of the proof.
- Loeh.GroupCohomology.2019, Proof of Theorem 3.2.18 (printed pp. 130-131; PDF pp. 138-139): “As subgroup of the free group F, also N is a free group (Theorem AT.2.3.52). Therefore, by Corollary 1.6.23, for all k ∈ N≥2, Hk(F; Z) ≅ 0 and Hk(N; Z) ≅ 0.” — The vanishing input of the first step; the spectral-sequence argument of the fourth step follows the same proof.

### `hopf-formula` — The Hopf formula and the two extensions attached to a presentation

*theorem*

For a presentation G = F/S with F free and S normal, H_2(G; Z) is isomorphic to (S ∩ [F, F])/[S,
F], the kernel of the commutator extension [F, F]/[S, F] → [G, G]; its naturality in the
presentation is hopf-formula-natural. The coefficients are the trivial integral representation,
and G is a group in Type.

**Hypotheses.** G is a group presented as a quotient of a free group F by a normal subgroup S.

**Construction and proof.**

1. Form the separate relation central extension F/[S, F] → G and its restricted commutator
   extension (relation-central-extension, commutator-central-extension).
1. Apply the four-term exact sequence 0 → H_2(G, Z) → S/[F, S] → F_ab → G_ab → 0
   (hopf-four-term-sequence): exactness at S/[F, S] identifies H_2(G, Z) with the kernel of
   S/[F, S] → F/[F, F], which is (S ∩ [F, F])/[S, F].
1. For a perfect G the restricted extension is onto G and its kernel is this intersection
   quotient, which is how uce-kernel-h2 uses the formula.
1. The remaining input is gap G-Hopf, carried by hopf-four-term-sequence: the Hochschild-Serre
   low-degree sequence. The K-book states the formula without proof (citing Weibel's homological
   algebra book, 6.8.8, not obtained); the decomposition follows Löh, Theorem 3.2.18.

**Acceptance.**

- H_2 of a free group is zero, for any presentation.
- The larger relation-module kernel S/[S, F] need not vanish for a free quotient G. Example F =
  Free(a, b), G = Z, a ↦ 1 and b ↦ 0: the class of b survives, detected by the b-exponent sum.
- For perfect G the restricted commutator extension has quotient G, and its kernel is H_2(G; Z)
  (uce-kernel-h2).

**Depends on.** **inside this roadmap** `central-extension`, `relation-central-extension`, `commutator-central-extension`, `hopf-four-term-sequence`; **baseline** `mathlib:groupHomology.H2`, `mathlib:groupHomology`, `mathlib:Rep.trivial`.

**Sources.**

- Kbook.2013, III.5.3.4 and III.5.3.5 (PDF p. 227): “The group (R intersect [F, F]) / [R, F] in (5.3.5) is the homology group H_2(G; Z); this identity was discovered in 1941 by Hopf.” — Hopf's formula and the two extensions, as displayed.
- Loeh.GroupCohomology.2019, Theorem 3.2.18 (printed p. 129; PDF p. 137): “Theorem 3.2.18 (Hopf's formula). Let F be a free group, let N ⊂ F be a normal subgroup, and let G := F/N. Then there is an exact sequence 0 → H2(G; Z) → H1(N; Z)G → H1(F; Z) → H1(G; Z) → 0” — The route from the four-term sequence to the formula, followed in the proof steps.

### `hopf-formula-natural` — Naturality of Hopf's formula

*theorem*

Let π : F → G and π' : F' → G' be surjections from free groups in Type with kernels R and R', f
: G → G' a homomorphism and φ : F → F' a homomorphism with π' ∘ φ = f ∘ π. Then φ(R) ⊆ R', φ
induces a homomorphism (R ∩ [F, F])/[R, F] → (R' ∩ [F', F'])/[R', F'], and under the Hopf
isomorphisms of K2SymbolsBrauer:T.1/hopf-formula this homomorphism is H_2(f; Z) =
groupHomology.map f (id) 2. In particular it does not depend on φ, and for f = id the Hopf
isomorphisms of two presentations of G agree.

**Hypotheses.** F, F' are free groups in Type; π, π' are surjective with kernels R, R'; π' ∘ φ = f ∘ π; homology has trivial integral coefficients.

**Construction and proof.**

1. From π' ∘ φ = f ∘ π, φ(R) ⊆ R'; then φ([R, F]) ⊆ [R', F'] and φ([F, F]) ⊆ [F', F'], so the
   map of Hopf quotients is defined.
1. The morphism (φ restricted to R, φ, f) from 1 → R → F → G → 1 to 1 → R' → F' → G' → 1 induces
   a morphism of Hochschild-Serre spectral sequences (Löh, Remark 3.2.14), hence a morphism of
   the four-term sequences of hopf-four-term-sequence whose H_2 component is H_2(f; Z) and whose
   middle component is induced by φ.
1. Restricting to the kernels of R/[F, R] → F_ab and R'/[F', R'] → F'_ab gives the statement;
   independence of φ follows because H_2(f; Z) does not involve φ.
1. Gap G-natural-Hopf: this rests on the naturality of the same missing Hochschild-Serre input
   as hopf-four-term-sequence.

**Acceptance.**

- For G' = G, F' = F and φ = id the induced map is the identity.
- Different lifts can differ on the larger relation module: for F free on a, b → Z (a ↦ 1, b ↦
  0) the lifts id and b ↦ b² of the identity differ on the class of b in R/[R, F] (b-exponent
  sums 1 and 2), but they agree on the Hopf quotient, which is zero here since H_2(Z, Z) = 0.
- It makes the kernel identification of uce-kernel-h2 independent of the presentation.

**Depends on.** **inside this roadmap** `hopf-formula`, `hopf-four-term-sequence`, `relation-central-extension`, `commutator-central-extension`; **baseline** `mathlib:groupHomology.map`, `mathlib:Rep.trivial`.

**Sources.**

- Kbook.2013, III.5.3.4 (PDF p. 227, printed p. 219): “Example 5.3.4. Every presentation of G gives rise to two natural central extensions as follows.” — The source calls the two extensions natural but does not prove the naturality of the Hopf identification.
- Loeh.GroupCohomology.2019, Proof of Theorem 3.2.18 (printed p. 131; PDF p. 139): “By the naturality of the Hochschild-Serre spectral sequence (Remark 3.2.14), this leads to a corresponding transformation between the associated Hochschild-Serre spectral sequences” — Löh uses this naturality to identify the maps on H_1; the same morphism of spectral sequences for a morphism of presentations gives the H_2 statement of this node.


### `uce-kernel-h2` — The kernel of a universal central extension is the second homology

*theorem*

Let G be a perfect group in Type and p : X → G a universal central extension with X in Type.
Then ker p ≅ H_2(G, Z) as abelian groups (trivial integral coefficients): the unique isomorphism
over G from X to the Hopf extension [F, F]/[R, F] of the canonical presentation F = FreeGroup G
→ G restricts to an isomorphism of kernels, and Hopf's formula identifies the Hopf kernel (R ∩
[F, F])/[R, F] with H_2(G, Z). That the identification does not depend on the presentation is
uce-kernel-h2-natural.

**Hypotheses.** G is a perfect group in Type; p : X → G is a universal central extension, X in Type (universality quantifies over central extensions in that universe, which contains the Hopf model FreeGroup G).

**Construction and proof.**

1. perfect-uce-exists gives the Hopf universal central extension U = [F, F]/[R, F] → G.
1. Two universal central extensions of G are isomorphic over G by a unique isomorphism
   (UCE.equiv_over of K2SymbolsBrauer:T.1/universal-central-extension); it maps ker p onto ker(U
   → G).
1. ker(U → G) = (R ∩ [F, F])/[R, F] (commutator-central-extension), which is H_2(G, Z) by
   K2SymbolsBrauer:T.1/hopf-formula.

**Acceptance.**

- For G = E(R) and X = St(R) this is K_2(R) ≅ H_2(E(R), Z), which
  K2SymbolsBrauer:T.1/k2-h2-elementary consumes.
- For G trivial both sides are zero.
- The statement is about perfect groups: Z² has H_2 = Z but no universal central extension.

**Depends on.** **inside this roadmap** `perfect-uce-exists`, `universal-central-extension`, `commutator-central-extension`, `hopf-formula`; **baseline** `mathlib:groupHomology.H2`, `mathlib:Rep.trivial`.

**Sources.**

- Kbook.2013, III.5.4, statement (PDF p. 227, printed p. 219): “Recognition Theorem 5.4. Every perfect group G has a universal central extension, namely the extension (5.3.5): 1 → H2(G; Z) → [F, F]/[R, F] → G → 1.” — The kernel of the displayed universal central extension is H_2(G; Z).
- Kbook.2013, Before Proposition IV.1.7 (PDF p. 272, printed p. 264): “Recall from III.5.4 that every perfect group P has a universal central extension E → P, and that the kernel of this extension is the abelian group H2(P; Z).” — The form in which the plus-construction chapter uses the statement, for an arbitrary universal central extension of a perfect group.


### `uce-lift` — Lifting homomorphisms to universal central extensions

*construction*

Let p : X → G and p' : X' → G' be universal central extensions (groups in one universe) and f :
G → G' a homomorphism. There is a unique homomorphism f̃ : X → X' with p' ∘ f̃ = f ∘ p. The lift
of the identity of G along p itself is the identity of X, the lift of a composite is the
composite of the lifts, and f̃ maps ker p into ker p', giving a homomorphism of abelian groups
ker p → ker p'.

**Hypotheses.** p : X → G and p' : X' → G' are universal central extensions; f : G → G' is a homomorphism.

**Construction and proof.**

1. Pull p' back along f: P = G ×_G' X' → G is a central extension of G
   (central-extension-pullback).
1. Universality of p gives a homomorphism X → P over G; compose with pr_X' to obtain f̃ with p'
   ∘ f̃ = f ∘ p.
1. Uniqueness: if h and k both satisfy p' ∘ h = f ∘ p = p' ∘ k, then (p, h) and (p, k) are
   homomorphisms X → P over G (pullback lift), equal by universality of p; so h = k.
1. Functoriality: the identity satisfies the defining equation for id_G, and lift(g) ∘ lift(f)
   satisfies it for g ∘ f; uniqueness gives both laws.
1. If p(x) = 1 then p'(f̃(x)) = f(1) = 1; kernels are central, hence abelian.

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsUniversalCentralExtension.lift` | constructor | The lift f̃ : X → X' of f : G → G' between universal central extensions p and p'. |
| `IsUniversalCentralExtension.proj_comp_lift` | universal-property | p' ∘ f̃ = f ∘ p. |
| `IsUniversalCentralExtension.lift_unique` | characterisation | Any homomorphism h : X → X' with p' ∘ h = f ∘ p equals f̃. |
| `IsUniversalCentralExtension.lift_id` | functoriality | The lift of id_G along p itself is id_X. |
| `IsUniversalCentralExtension.lift_comp` | functoriality | The lift of g ∘ f is the lift of g composed with the lift of f. |
| `IsUniversalCentralExtension.kerMap` | projection | The restriction of f̃ to kernels, a homomorphism of abelian groups ker p → ker p'. |

**Used by.** *K2SymbolsBrauer:T.1/k2-h2-elementary*: naturality of K_2(R) ≅ H_2(E(R), Z) in the ring: St(R) → St(S) is the lift of E(R) → E(S). *K2SymbolsBrauer:T.1:classical/uce-kernel-h2-natural*: its kernel map is compared with H_2(f; Z). *StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension*: the naturality in R that the node's acceptance asks to check on representatives.

**Unit tests.**

- `lift_id_self` (degenerate) — For G' = G, p' = p and f = id_G, the lift is id_X.
- `lift_trivial_hom` (characterisation) — For the trivial homomorphism f : G → G', the lift is
  the trivial homomorphism X → X'.
- `lift_steinberg` (compatibility) — For a ring map φ : R → S, the lift of E(φ) along St(R) →
  E(R) and St(S) → E(S) sends x_ij(r) to x_ij(φ(r)).
- `lift_not_unique_nonuniversal` (non-example) — For the central extension id : C_2 → C_2, which
  is not universal, the identity of C_2 has two different lifts to the split extension C_2 × C_2
  → C_2 (first coordinate trivial or the identity).

**Acceptance.**

- The lift of the trivial homomorphism is trivial: it maps X into the abelian group ker p', and
  X is perfect.
- For a ring map R → S the lift of E(R) → E(S) along the Steinberg extensions is the
  functoriality map St(R) → St(S), by uniqueness.
- Uniqueness needs a universal source: for id : C_2 → C_2, the identity of C_2 has two lifts to
  the split extension C_2 × C_2 → C_2.

**Depends on.** **inside this roadmap** `universal-central-extension`, `uce-perfect`, `central-extension-pullback`, `central-extension-hom`.

**Source.** Kbook.2013, III.5.3.1 (PDF p. 227, printed p. 219): “Definition 5.3.1. A universal central extension of G is a central extension X → G such that for every other central extension Y → G there is a unique homomorphism f over G from X to Y.” — The universal property from which the lift is derived. The source states uniqueness up to isomorphism over G but not the lift along a homomorphism of bases or its functoriality; they are derived here through the pullback.


### `uce-kernel-h2-natural` — Naturality of the kernel of the universal central extension

*theorem*

Let f : G → G' be a homomorphism of perfect groups in Type with universal central extensions p :
X → G and p' : X' → G'. Under the isomorphisms ker p ≅ H_2(G, Z) and ker p' ≅ H_2(G', Z) of
uce-kernel-h2, the kernel map of the lift f̃ (uce-lift) is H_2(f; Z) = groupHomology.map f (id)
2. Taking f = id_G shows that the isomorphism of uce-kernel-h2 does not depend on the
presentation used to build it.

**Hypotheses.** G, G' are perfect groups in Type with universal central extensions p, p'; f : G → G' is a homomorphism.

**Construction and proof.**

1. Reduce to the Hopf models of the canonical presentations F = FreeGroup G → G and F' =
   FreeGroup G' → G': the isomorphisms over G and G' commute with the lifts, by the uniqueness
   clause of uce-lift.
1. φ = FreeGroup.map f satisfies π' ∘ φ = f ∘ π; the map it induces [F, F]/[R, F] → [F',
   F']/[R', F'] lies over f, so it is the lift by uniqueness.
1. Its restriction to kernels is the map of Hopf quotients, which is H_2(f; Z) by
   hopf-formula-natural.

**Acceptance.**

- For f = id_G the kernel map is the identity, whatever presentations are used.
- For a ring map R → S it gives the naturality of K_2(R) ≅ H_2(E(R), Z) that
  K2SymbolsBrauer:T.1/k2-h2-elementary asserts.

**Depends on.** **inside this roadmap** `uce-kernel-h2`, `uce-lift`, `hopf-formula-natural`; **baseline** `mathlib:FreeGroup.map`, `mathlib:groupHomology.map`.

**Source.** Kbook.2013, Theorem III.5.5 (PDF p. 228, printed p. 220): “Theorem 5.5. (Kervaire, Steinberg) The Steinberg group St(R) is the universal central extension of E(R). Hence K2(R) ≅ H2(E(R); Z).” — The identification whose naturality in the ring the later chapters use; the source does not state the naturality, which is derived here from uce-lift and hopf-formula-natural.


### `uce-source-superperfect` — The source of a universal central extension is superperfect

*theorem*

Let p : X → G be a universal central extension of groups in Type. Then X is superperfect: H_1(X,
Z) = 0 and H_2(X, Z) = 0. Only the universal property is used. This is Recognition (1) ⇒ (3).

**Hypotheses.** p : X → G is a universal central extension; X and G are groups in Type.

**Construction and proof.**

1. X is perfect (K2SymbolsBrauer:T.1/uce-perfect, K-book Lemma III.5.3.2), so H_1(X, Z) = 0
   (h1-trivial-perfect).
1. Every central extension of X splits (uce-extensions-split), in particular every central
   extension of X by Q/Z with trivial action.
1. split-extensions-kill-h2 gives H_2(X, Z) = 0.

**Acceptance.**

- For the Steinberg extension St(R) → E(R) (K2SymbolsBrauer:T.1/steinberg-is-uce) it gives
  H_1(St(R), Z) = H_2(St(R), Z) = 0, the corollary K3BlochGroups V.1 draws.
- Universality, not merely a perfect source, is used: the identity of A_5 is a central extension
  with perfect source, but H_2(A_5, Z) ≠ 0.
- For X = G trivial both homology groups vanish.

**Depends on.** **inside this roadmap** `uce-perfect`, `uce-extensions-split`, `split-extensions-kill-h2`, `h1-trivial-perfect`, `superperfect`.

**Sources.**

- Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.” — The implication (1) ⇒ (3), by the route (1) ⇒ (2) ⇒ (3) the source indicates. First planned as K3BlochGroups:V.1/uce-superperfect; moved here by FIX-RT-AREA-ktheory-1 so that V.1 imports it.
- Kbook.2013, Exercise IV.1.9 (PDF p. 282, printed p. 274): “Suppose that A → S → P is a universal central extension (III.5.3.1). In particular, S and P are perfect groups.” — The perfectness half, in the form the plus-construction exercise uses.


### `superperfect-extensions-split` — A superperfect group is its own universal central extension

*lemma*

Let X be a superperfect group in Type. Then the identity X → X is a universal central extension
of X, and every central extension ρ : Y → X (Y in Type) splits. This is Recognition (3) ⇒ (2).

**Hypotheses.** X is a superperfect group in Type.

**Construction and proof.**

1. X is perfect (h1-trivial-perfect), so perfect-uce-exists gives the universal central
   extension U = [F, F]/[R, F] → X for F = FreeGroup X.
1. Its kernel (R ∩ [F, F])/[R, F] (commutator-central-extension) is H_2(X, Z) = 0 by
   K2SymbolsBrauer:T.1/hopf-formula, so U → X is an isomorphism and the identity of X is a
   universal central extension.
1. For a central extension ρ : Y → X, universality of the identity gives s : X → Y with ρ ∘ s =
   id_X.

**Acceptance.**

- For X trivial, every central extension A → 1 is split by the trivial homomorphism.
- Both vanishing conditions are needed: Z/2 has H_2 = 0 but H_1 ≠ 0, and C_4 → Z/2 does not
  split; A_5 is perfect with H_2 ≠ 0, and SL_2(F_5) → A_5 does not split.

**Depends on.** **inside this roadmap** `superperfect`, `h1-trivial-perfect`, `perfect-uce-exists`, `commutator-central-extension`, `hopf-formula`, `universal-central-extension`.

**Source.** Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.” — The implication (3) ⇒ (2), which the source obtains from the existence half and the identification of the kernel with H_2.


### `split-central-extension-universal` — A perfect central extension whose central extensions split is universal

*lemma*

Let p : X → G be surjective with central kernel. If X is perfect and every central extension of
X splits, then p is a universal central extension of G. This is Recognition (2) ⇒ (1); no
homology enters and there is no universe restriction beyond the one in the definition of
universality.

**Hypotheses.** p : X → G is surjective and ker p lies in the centre of X. X is perfect, and every central extension of X (in the universe over which universality quantifies) splits.

**Construction and proof.**

1. Given a central extension q : Y → G, pull it back along p (central-extension-pullback): P = X
   ×_G Y → X is a central extension of X.
1. By hypothesis it has a section s : X → P; then pr_Y ∘ s : X → Y satisfies q ∘ pr_Y ∘ s = p ∘
   pr_X ∘ s = p, a homomorphism over G.
1. Uniqueness: X is perfect and ker q is central, so perfect-extension-rigidity.

**Acceptance.**

- The Steinberg application: St(R) is perfect and every central extension of St(R) splits (glued
  from finite-rank splitting), so St(R) → E(R) is universal;
  K2SymbolsBrauer:T.1/steinberg-is-uce uses the lemma in this form.
- Perfectness of X is needed: every central extension of a nontrivial free group F splits, but
  the identity of F is not universal, since F is not perfect.

**Depends on.** **inside this roadmap** `central-extension-pullback`, `perfect-extension-rigidity`, `central-extension-hom`, `universal-central-extension`; **baseline** `mathlib:Group.IsPerfect`.

**Source.** Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “The implication (1)⇒(2) is Lemma 5.3.2 and Ex. 5.7, and (2) ⇒ (1) is immediate.” — The implication (2) ⇒ (1), which the source calls immediate; the proof steps make the pullback explicit.

### `recognition-theorem` — The Recognition Theorem ★

*theorem* · planet **Recognition Theorem**

Let G be a perfect group and p : X → G a central extension (p surjective, ker p central), X in
Type. The following are equivalent: (1) p is a universal central extension; (2) X is perfect and
every central extension of X splits; (3) H_1(X; Z) = H_2(X; Z) = 0, that is, X is superperfect.
Every perfect group has a universal central extension, the Hopf extension of any free
presentation (perfect-uce-exists), and its kernel is H_2(G; Z) (uce-kernel-h2).

**Hypotheses.** G is a perfect group; p : X → G is surjective with ker p in the centre of X; X is a group in Type, as Mathlib's integral group homology requires.

**Construction and proof.**

1. (1) ⇒ (2): X is perfect (uce-perfect) and every central extension of X splits
   (uce-extensions-split).
1. (2) ⇒ (3): H_1(X; Z) = 0 by h1-trivial-perfect and H_2(X; Z) = 0 by split-extensions-kill-h2.
1. (3) ⇒ (2): superperfect-extensions-split.
1. (2) ⇒ (1): split-central-extension-universal.
1. Assemble the four implications as one equivalence of three conditions; the existence and
   kernel statements are the separate nodes perfect-uce-exists and uce-kernel-h2, restated here
   for reference.
1. The composite (1) ⇒ (3) is also the named theorem uce-source-superperfect, which
   K3BlochGroups V.1 imports; StableHomotopyKTheory H.3 uses (3) ⇒ (1) for π_1 of the homotopy
   fibre of a plus construction (K-book IV.1.7).

**Acceptance.**

- For a free group the theorem is vacuous, since a free group is perfect only when trivial.
- Condition (3) is the one K3BlochGroups V.1 uses for the Steinberg group and
  StableHomotopyKTheory H.3 uses for π_1 of an acyclic homotopy fibre.
- Perfectness of a central-extension source alone does not imply universality; the recognition
  criterion also requires H_2 of that source to vanish.
- The hypotheses that p is surjective with central kernel are kept: universality is recognised
  on central extensions of a perfect group, not on arbitrary extensions.

**Depends on.** **inside this roadmap** `uce-perfect`, `universal-central-extension`, `uce-extensions-split`, `h1-trivial-perfect`, `split-extensions-kill-h2`, `superperfect-extensions-split`, `split-central-extension-universal`, `superperfect`, `perfect-uce-exists`, `uce-kernel-h2`; **baseline** `mathlib:groupHomology.H1`, `mathlib:groupHomology.H2`.

**Sources.**

- Kbook.2013, III.5.4, statement (PDF p. 227, printed p. 219): “Recognition Theorem 5.4. Every perfect group G has a universal central extension, namely the extension (5.3.5): 1 → H2(G; Z) → [F, F]/[R, F] → G → 1.” — The existence statement and the extension (5.3.5).
- Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “Let X be any central extension of G, the following are equivalent: (1) X is a universal central extension; (2) X is perfect, and every central extension of X splits; (3) H1(X; Z) = H2(X; Z) = 0.” — The three equivalent conditions.
- Kbook.2013, III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220): “The implication (1)⇒(2) is Lemma 5.3.2 and Ex. 5.7, and (2) ⇒ (1) is immediate.” — The source's own division of the implications, which the proof steps refine into separate nodes.

### `steinberg-is-uce` — The Steinberg group is the universal central extension of the elementary group ★

*theorem* · planet **St(R) is the universal central extension**

For every ring R the stable Steinberg group St(R) is the universal central extension of E(R).
Consequently K_2(R) is isomorphic to the second integral homology of E(R).

**Hypotheses.** R is an associative unital ring.

**Construction and proof.**

1. Observe that E(R) is perfect, so the Recognition Theorem applies.
1. Prove that St(R) is a central extension of E(R), which is Steinberg's centre theorem.
1. Pull a central extension of St(R) back to St_n(R) for each n >= 5. Finite splitting gives a
   section; perfectness and rigidity make the sections compatible. The group-colimit universal
   property glues them to a section.
1. Apply split-central-extension-universal (Recognition (2) ⇒ (1)) using stable centrality,
   Steinberg perfectness and the glued splitting; the separate T.1:plus node makes the H2
   comparison.

**Acceptance.**

- The identification of K_2 with the second homology is the statement T.1:plus starts from.
- For the ring of integers both sides are cyclic of order two.
- No finite-rank UCE conclusion is drawn without a separate centrality hypothesis.

**Depends on.** **inside this roadmap** `recognition-theorem`, `k2-is-centre`, `finite-rank-splitting`, `steinberg-perfect`, `perfect-extension-rigidity`, `stable-steinberg-perfect`, `split-central-extension-universal`; **other roadmaps** `KTheoryLowDegrees:U.1`.

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

1. Import that St(R) is the universal central extension of E(R) (steinberg-is-uce); E(R) is
   perfect.
1. uce-kernel-h2 applied to St(R) → E(R), with kernel K_2(R) (k2-definition), gives K_2(R) ≅
   H_2(E(R), Z); the isomorphism is of kernels, compatible with the projections to E(R).
1. Naturality in the ring: for φ : R → S the functoriality map St(R) → St(S) is the lift of E(φ)
   (uce-lift, by uniqueness), and uce-kernel-h2-natural identifies its kernel map with H_2(E(φ);
   Z).
1. Gap G-natural-Hopf enters through hopf-formula-natural.

**Acceptance.**

- For the ring of integers both sides are cyclic of order two.
- The isomorphism is natural, which is what the comparison with homotopy needs.
- The identification is of kernels, not merely an abstract isomorphism of abelian groups; the
  acceptance test is the compatibility with the two projections.

**Depends on.** **inside this roadmap** `steinberg-is-uce`, `hopf-formula`, `k2-definition`, `uce-kernel-h2`, `uce-lift`, `uce-kernel-h2-natural`; **baseline** `mathlib:groupHomology.H2`.

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

**Hopf's formula rests on the Hochschild–Serre low-degree sequence.** Hopf's formula is decomposed as in Löh's Theorem 3.2.18: free groups, and by Nielsen–Schreier
their subgroups, have no integral homology above degree one, and the four-term exact sequence 0
→ H₂(G) → N/[F, N] → F_ab → G_ab → 0 gives the formula. Mathlib supplies exactness at F_ab and
surjectivity onto G_ab (groupHomology.H1CoresCoinfOfTrivial_exact and _g_epi) but no map H₂(F/N)
→ H₁(N)_{F/N}: the Hochschild–Serre spectral sequence of a group extension, or its low-degree
exact sequence, is missing at the pin and no atlas stage plans it for discrete groups. The same
input gives the naturality of Hopf's formula (gap G-natural-Hopf). Löh points to
Hilton–Stammbach VI.9 for a proof by basic homological algebra; that book was not obtained. The
recognition-theorem implications that do not pass through Hopf's formula ((1) ⇒ (2) ⇒ (3) and
(2) ⇒ (1)) do not depend on this gap.

## Structure

## Mistakes found in the sources

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.1.json

reports 0 errors and 0 warnings against the pinned declaration index. The suggested Lean file was not compiled: no Lean toolchain at the pinned commits was available in this session, and the file is signatures and `example` statements only.

FIX-RT-AREA-ktheory-1 (2026-09-30, findings /29 and /30): after the recognition-package nodes
were added the checker still reports 0 errors and 0 warnings (62 nodes). The suggested file was
then elaborated with `lake env lean` against a build of Mathlib 082e2d3: the new declarations
give only `sorry` warnings; five errors older than this fix remain (the commutator bracket on
the presented Steinberg group).
