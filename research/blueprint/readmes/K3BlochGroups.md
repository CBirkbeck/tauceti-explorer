# Explicit K₃ and Bloch groups — blueprint

Blueprint packet for the roadmap `K3BlochGroups`, stages V.1–V.6 (`research/blueprint/packets/K3BlochGroups.json`). Written for job `BP-K3BlochGroups`, issue #72, by Claude Code, session `cc-7b31c4`, 24 September 2026. Nothing here is formalised: every node carries `implementationStatus: "unchecked"`, and the suggested Lean file is signatures only.

**Sources.** Weibel, *The K-book: An Introduction to Algebraic K-theory* (Graduate Studies in Mathematics 145), read in the author-hosted combined draft of 29 August 2013, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`; chapters IV.1, VI.1, VI.2, VI.4 and the whole of VI.5. Calegari, Garoufalidis and Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, arXiv:1712.04887v3, SHA-256 `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`; §1.1, §2.5 and §4.2. Suslin's own paper is not freely available and was not read; every statement taken from it is read in the K-book, which reproduces the proof, and the three steps that are used exactly as the K-book states them are listed as a gap.

**Library baseline.** Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit `AUDIT-29` records all six layers as not built, with two partial entries; 33 pinned declarations are cited as baseline, and nothing the libraries already contain is planned. Two of them deserve emphasis: `groupHomology.inhomogeneousChains` with `chainsIso₃` and `d₃₂` give the bar model of V.1 for free, and `TauCeti.antisymmetricTensors` is the (−1)-eigenspace **submodule** of the flip, whose splitting theorem `TauCeti.isCompl_symmetricTensors_antisymmetricTensors` assumes `Invertible (2 : R)` — over ℤ it does not apply, which is exactly why V.3 builds a quotient rather than reusing that submodule.

| layer | nodes | planets | coverage |
| --- | --- | --- | --- |
| `K3BlochGroups:V.1` | 7 | 3 | source_decomposed |
| `K3BlochGroups:V.2` | 7 | 3 | source_decomposed |
| `K3BlochGroups:V.3` | 14 | 5 | source_decomposed |
| `K3BlochGroups:V.4` | 18 | 5 | source_decomposed |
| `K3BlochGroups:V.5` | 7 | 5 | source_decomposed |
| `K3BlochGroups:V.6` | 9 | 3 | source_decomposed |

In total: 62 nodes (9 comparison, 8 construction, 8 definition, 15 lemma, 22 theorem), 85 API items, 63 unit tests, 24 planets, 12 requests and 4 gaps.

## V.1 — A concrete homological model

The layer builds one thing: a model of `K₃` that a proof can compute with. The Steinberg group
and its universal-central-extension property are imported from `K2SymbolsBrauer:T.1`; the plus
construction is imported from `StableHomotopyKTheory:H.3`. What is proved here is that the
stable Steinberg group is superperfect, that `BSt(A)⁺` is therefore two-connected with the same
homotopy as `BGL(A)⁺` from degree three, and that Hurewicz in the first nonvanishing degree
gives `K₃(A) ≅ H₃(St(A), ℤ)`. The bar model makes the isomorphism explicit on representatives,
which is what V.6's certificates and Lee and Szczarba's calculation of `K₃(ℤ)` need.
`GeneralAlgebraicKTheory:K.2:low-degree-comparisons` consumes this model; it does not build a
second one.

### `uce-superperfect` — A group carrying a universal central extension is superperfect

*lemma*

Let S -> P be a universal central extension of groups. Then S is perfect and H_2(S, Z) = 0;
equivalently H_1(S, Z) = H_2(S, Z) = 0. Only the universal property is used: no property of the
elementary or Steinberg groups enters.

**Hypotheses.** S -> P is a central extension with kernel A, universal among central extensions of P.

**Construction and proof.**

1. A universal central extension is by definition a central extension that maps uniquely to
   every central extension of the same base; the source of a universal central extension is
   perfect, since otherwise the trivial extension by the abelianisation admits two distinct
   maps.
1. Because S is perfect, H_1(S, Z) = 0, by the identification of degree-one homology with the
   abelianisation for trivial coefficients.
1. If H_2(S, Z) were nonzero, the central extension of S classified by a nonzero class would be
   a central extension of P admitting two distinct lifts over the identity of P, contradicting
   uniqueness. Conclude H_2(S, Z) = 0.
1. Record the converse direction as a separate statement: a perfect group with vanishing H_2
   carries a universal central extension of itself only in the trivial sense; the converse is
   not used below.

**Acceptance.**

- For S = P = the trivial group the statement is vacuously true and both homology groups vanish.
- For a perfect group with nonvanishing Schur multiplier, for instance the alternating group on
  five letters, the statement correctly fails to apply: that group is perfect but is not the
  source of a universal central extension of itself.

**Depends on.** **other roadmaps** `K2SymbolsBrauer:T.1`; **baseline** `mathlib:Group.IsPerfect`, `mathlib:groupHomology.H1`, `mathlib:groupHomology.H2`.

**Source.** Kbook.2013, Ex. IV.1.9 (PDF p. 282): “Suppose that A -> S -> P is a universal central extension. In particular, S and P are perfect groups.” — States the perfectness half; the vanishing of H_2 is the standard characterisation used in the same exercise.

### `steinberg-superperfect` — The stable Steinberg group is superperfect ★

*theorem* · planet **Superperfection of St(A)**

For every ring A the stable Steinberg group St(A) satisfies H_1(St(A), Z) = 0 and H_2(St(A), Z)
= 0. The statement is about the stable group; no claim is made for the finite-rank groups
St_n(A), whose kernels need not even be central.

**Hypotheses.** A is an associative unital ring. St(A) is the stable Steinberg group, the colimit of the St_n(A).

**Construction and proof.**

1. Import from K2SymbolsBrauer T.1 that the stable map St(A) -> E(A) is a universal central
   extension with kernel K_2(A).
1. Apply the previous lemma to that universal central extension.
1. Record explicitly that the finite-rank statement is not being asserted: T.1 keeps the finite-
   rank and stable objects distinct, and so does this node.

**Acceptance.**

- For A the zero ring both groups are trivial and the statement holds.
- The conclusion is used only through the two vanishing statements; no generator-level
  computation in St(A) is needed to state it.

**Depends on.** **inside this roadmap** `uce-superperfect`; **other roadmaps** `K2SymbolsBrauer:T.1`; **baseline** `mathlib:groupHomology.H1`, `mathlib:groupHomology.H2`.

**Source.** Kbook.2013, Ex. IV.1.9 (PDF p. 282): “Since the Steinberg group St(R) is the universal central extension of E(R), this shows that K_n(R) = pi_n St(R)+ for all n >= 3, and that K_3(R) = H_3(St(R); Z).” — The cited exercise runs through exactly this superperfection step.

### `bst-plus` — The plus construction on the classifying space of the stable Steinberg group

*construction*

Construct BSt(A)+, the plus construction of B St(A) relative to the whole of St(A), which is
perfect. Then BSt(A)+ is simply connected, its homotopy groups vanish in degrees at most two,
and for every n >= 3 there are natural isomorphisms pi_n(BSt(A)+) = pi_n(BE(A)+) = pi_n(BGL(A)+)
= K_n(A). The space BSt(A)+ is the two-connected cover of BGL(A)+ up to homotopy, not a new
K-theory space.

**Hypotheses.** A is an associative unital ring. The plus construction is the one imported from StableHomotopyKTheory H.3, taken relative to the named perfect normal subgroup.

**Construction and proof.**

1. Apply the imported plus construction to B St(A) relative to St(A), which is perfect by the
   previous node.
1. Use the imported homotopy fibration B K_2(A) -> BSt(A)+ -> BE(A)+ coming from the central
   extension, and the fact that K_2(A) is central, to compute the low-degree homotopy groups.
1. Read off pi_1 = 0 from the imported description of pi_1 of a plus construction, pi_2 = 0 from
   the fibration and the vanishing of H_2(St(A), Z) with the Hurewicz theorem, and the
   isomorphisms in degrees at least three from the long exact sequence of the fibration.
1. Identify pi_n(BE(A)+) with pi_n(BGL(A)+) for n >= 2 by the imported comparison of BE(A)+ with
   the universal cover of BGL(A)+.
1. State every assertion at the level the imported construction supports: the space is
   determined up to homotopy, and no chosen model is asserted to be equal to another.

**API.**

| name | role | statement |
| --- | --- | --- |
| `bStPlus` | constructor | For a ring A, the space BSt(A)+, together with the canonical map from B St(A). |
| `bStPlus_simplyConnected` | characterisation | BSt(A)+ is simply connected. |
| `bStPlus_pi_le_two` | characterisation | pi_n(BSt(A)+) = 0 for n <= 2. |
| `bStPlus_pi_eq_K` | compatibility | For n >= 3 there is an isomorphism pi_n(BSt(A)+) = K_n(A), natural in A. |
| `bStPlus_map` | functoriality | A ring map A -> B induces a map BSt(A)+ -> BSt(B)+ compatible with the isomorphisms above. |
| `bStPlus_fibration` | structure | The homotopy fibration B K_2(A) -> BSt(A)+ -> BE(A)+. |

**Used by.** *V.1's identification of K_3 with H_3(St(A), Z)*: the degree-three isomorphism is read off this space through the Hurewicz theorem. *GeneralAlgebraicKTheory K.2:low-degree-comparisons*: the explicit K_3 model this roadmap exports is assembled there with the K_1 and K_2 models. *V.5's route to K_3(Z)*: Lee and Szczarba's calculation runs through a variant of this model, as the K-book records.

**Unit tests.**

- `zero_ring` — For the zero ring the space is contractible and all homotopy groups vanish.
- `degree_two_vanishes` — pi_2(BSt(A)+) = 0, which is the assertion that fails for BE(A)+ and so
  distinguishes the two spaces.
- `agrees_with_K` — pi_3(BSt(A)+) = K_3(A) for A = Z, where the right-hand side is the group
  computed in V.5.
- `not_BGL_plus` — BSt(A)+ is not homotopy equivalent to BGL(A)+ whenever K_1(A) or K_2(A) is
  nonzero: a non-example that a wrong definition would miss.

**Acceptance.**

- Applying the construction with the trivial subgroup instead returns a weak equivalence, the
  test recorded in StableHomotopyKTheory H.3.
- For A the zero ring the space is contractible.
- The degree-two vanishing is what fails if superperfection is dropped, so the acceptance test
  is that the construction refuses a group whose H_2 is nonzero.

**Depends on.** **inside this roadmap** `steinberg-superperfect`; **other roadmaps** `StableHomotopyKTheory:H.3`, `GeneralAlgebraicKTheory:K.2`, `K2SymbolsBrauer:T.1`.

**Source.** Kbook.2013, Ex. IV.1.9 (PDF p. 282): “Show that there is a homotopy fibration BA -> BS+ -> BP+. Conclude that pi_n(BS+) = 0 for n <= 2, and that pi_n(BS+) = pi_n(BP+) = pi_n(BG+) for all n >= 3.” — The construction and its three consequences are exactly the cited exercise.

### `k3-h3-steinberg` — K_3 of a ring is the third homology of its stable Steinberg group ★

*theorem* · planet **K3(A) = H3(St(A),Z)**

For every ring A there is an isomorphism K_3(A) = H_3(St(A), Z), natural in A. It is the
Hurewicz map of the two-connected space BSt(A)+ in its first nonvanishing degree.

**Hypotheses.** A is an associative unital ring.

**Construction and proof.**

1. By the previous construction BSt(A)+ is simply connected with vanishing pi_2, so it is two-
   connected.
1. Apply the Hurewicz theorem in the first nonvanishing degree: pi_3(BSt(A)+) = H_3(BSt(A)+, Z).
1. Identify H_3(BSt(A)+, Z) with H_3(B St(A), Z) = H_3(St(A), Z), using the homology isomorphism
   that the imported plus construction provides.
1. Identify pi_3(BSt(A)+) with K_3(A) by the degree-three case of the previous node.
1. Check naturality by running the same argument on the induced maps, which the imported
   functoriality supplies.

**Acceptance.**

- The composite isomorphism is natural in A; the naturality square for a ring map is the
  acceptance test.
- For A a finite field the right-hand side is a finite group, matching the finite value computed
  in V.5.
- The statement is about the stable Steinberg group: replacing St(A) by St_3(A) makes it false
  in general, and this is recorded rather than hidden.

**Depends on.** **inside this roadmap** `bst-plus`; **other roadmaps** `StableHomotopyKTheory:H.3`; **baseline** `mathlib:groupHomology`.

**Source.** Kbook.2013, Ex. IV.1.9 (PDF p. 282): “Since the Steinberg group St(R) is the universal central extension of E(R), this shows that K_n(R) = pi_n St(R)+ for all n >= 3, and that K_3(R) = H_3(St(R); Z).” — The displayed isomorphism is the statement of this node.

### `bar-cycle-model` — The bar model for H_3 of the stable Steinberg group

*construction*

Present H_3(St(A), Z) through the inhomogeneous (bar) chain complex: degree-three chains are the
free abelian group on triples of elements of St(A), the differential is the imported explicit
degree-three differential, and a class of K_3(A) is represented by a bar 3-cycle. Construct the
evaluation of the isomorphism of the previous node on such a representative, and the induced
chain map for a ring homomorphism.

**Hypotheses.** A is an associative unital ring. Coefficients are the trivial representation on Z.

**Construction and proof.**

1. Instantiate the imported inhomogeneous chain complex at G = St(A) and the trivial module Z.
1. Use the imported degree-three identification of chains with the free module on triples, and
   the imported explicit differential out of degree three, to define what a bar 3-cycle and a
   bar 3-boundary are in coordinates.
1. Define the evaluation map: a bar 3-cycle determines a class in H_3(St(A), Z), hence, through
   the isomorphism of the previous node, an element of K_3(A).
1. Construct the induced chain map along a ring homomorphism from the imported functoriality of
   the bar complex, and prove that evaluation commutes with it.
1. Record that a representative is not unique: two 3-cycles differing by a boundary evaluate
   equally, and the API states this rather than choosing representatives.

**API.**

| name | role | statement |
| --- | --- | --- |
| `barCycle3` | data | The type of bar 3-cycles of St(A) with trivial integer coefficients. |
| `evalBarCycle` | constructor | A bar 3-cycle determines an element of K_3(A). |
| `evalBarCycle_boundary` | simp | A bar 3-boundary evaluates to zero. |
| `evalBarCycle_surjective` | characterisation | Every element of K_3(A) is the evaluation of some bar 3-cycle. |
| `evalBarCycle_map` | functoriality | For a ring map A -> B, evaluation commutes with the induced chain map. |
| `evalBarCycle_ext` | extensionality | Two bar 3-cycles evaluate equally exactly when their difference is a boundary. |

**Used by.** *V.6's certificates*: a relation certificate is transported to a bar 3-cycle so that an integral comparison can be evaluated. *V.4's comparison of the degree-three map with V.1*: the configuration-complex map is compared with this evaluation on representatives. *V.5's route to K_3(Z)*: Lee and Szczarba compute with an explicit variant of this model.

**Unit tests.**

- `boundary_is_zero` — The evaluation of the boundary of a 4-chain is zero.
- `degenerate_triple` — A triple with an identity entry evaluates to zero.
- `naturality_square` — For the inclusion of a subring, evaluation commutes with the induced map
  on K_3.
- `not_injective_on_cycles` — Two distinct 3-cycles differing by a boundary have the same
  evaluation: the map is not injective on cycles, which a wrong definition would get wrong.

**Acceptance.**

- A boundary evaluates to zero.
- The evaluation commutes with a ring map, checked on an explicit cycle.
- Degenerate triples, those with an identity entry, are boundaries and evaluate to zero.

**Depends on.** **inside this roadmap** `k3-h3-steinberg`; **baseline** `mathlib:groupHomology.inhomogeneousChains`, `mathlib:groupHomology.chainsIso₃`, `mathlib:groupHomology.d₃₂`, `mathlib:groupHomology.cycles`, `mathlib:groupHomology.chainsMap`.

**Source.** Kbook.2013, IV.1 and Ex. IV.1.9 (PDF pp. 277-282): “K_3(R) = H_3(St(R); Z)” — The K-book states the isomorphism; the bar presentation of the right-hand side is the standard model, available in the pinned library as the inhomogeneous chains.

### `k3-naturality` — Naturality and stabilisation compatibility of the homological model

*lemma*

The isomorphism K_3(A) = H_3(St(A), Z) is natural in the ring: for every unital ring map f : A
-> B the square formed by K_3(f) and H_3(St(f), Z) commutes. It is also compatible with
stabilisation: the isomorphism is the colimit of its finite-rank approximations wherever those
are defined, and no finite-rank statement is asserted beyond the stable range.

**Hypotheses.** f : A -> B is a unital ring homomorphism.

**Construction and proof.**

1. A ring map induces a homomorphism of Steinberg groups, compatible with stabilisation, by the
   imported construction of St.
1. Apply the imported functoriality of the plus construction and of the bar complex to the
   induced maps.
1. Compare the two resulting squares through the Hurewicz map, which is natural.
1. For stabilisation, observe that St(A) is by construction a colimit and that homology commutes
   with filtered colimits of groups.

**Acceptance.**

- The naturality square commutes for the inclusion Z -> Q, the case used in V.5.
- The isomorphism for a product of rings is the product of the isomorphisms.

**Depends on.** **inside this roadmap** `k3-h3-steinberg`, `bar-cycle-model`; **other roadmaps** `K2SymbolsBrauer:T.1`.

**Source.** Kbook.2013, IV.1 (PDF pp. 277-282): “K_3(R) = H_3(St(R); Z)” — Naturality is the form in which the isomorphism is used in the K-book, for example in the localisation comparison of K_3(Z) with K_3(Q).

### `k2-to-k3-h3-e` — The product with [-1] and the surjection onto H_3 of the elementary group ★

*theorem* · planet **The [-1]-product sequence**

For every ring R the product with the class [-1] in K_1(Z) fits into an exact sequence K_2(R) ->
K_3(R) -> H_3(E(R), Z) -> 0, the second map being the Hurewicz map. For a field F the map K_3(F)
-> H_3(SL(F), Z) is onto and its kernel is the subgroup of K_3^M(F) generated by the symbols
with a -1 entry.

**Hypotheses.** R is an associative unital ring; F is a field.

**Construction and proof.**

1. Use that BGL(R)+ is an H-space, so that composition with the Hopf map is multiplication by
   the image of that map in K_1(R), namely [-1].
1. Apply the imported lemma computing the third homotopy group of a simply connected H-space
   modulo the image of the Hopf composition, to the space BE(R)+.
1. Identify pi_n BE(R)+ with K_n(R) for n >= 2, and conclude exactness.
1. For a field, restrict along SL(F) inside GL(F) and identify the kernel with the stated
   subgroup of Milnor K_3, as recorded at the head of the K-book's section on K_3 of a field.

**Acceptance.**

- For R = Z the sequence is consistent with the value of K_3(Z) computed in V.5 and with the
  nonvanishing of the symbol with three -1 entries.
- The map K_3(F) -> H_3(SL(F), Z) is surjective but not injective in general; the acceptance
  test is that the kernel is exhibited, not asserted to be zero.

**Depends on.** **inside this roadmap** `k3-h3-steinberg`; **other roadmaps** `K2SymbolsBrauer:T.1`, `GeneralAlgebraicKTheory:K.2`.

**Source.** Kbook.2013, IV.1.20 (PDF p. 281) and VI.5 opening (PDF p. 495): “For any ring R the product with [-1] in K_1(Z) fits into an exact sequence K_2(R) -> K_3(R) -> H_3(E(R), Z) -> 0. ... By IV.1.20, the map K_3(F) -> H_3(SL(F)) is onto, and its kernel is the subgroup of K_3^M(F) generated by the symbols {-1, a, b}.” — Both halves are quoted from the two cited places.

## V.2 — Decomposable and indecomposable parts

Two groups are easy to confuse. The decomposable part of `K₃(F)` is the **image** of the degree-
three Milnor-to-Quillen map, and it is a copy of `K₃ᴹ(F)` only once injectivity is proved —
which it is, for fields, through the motivic description. The indecomposable quotient is the
cokernel. For a number field the decomposable part is `(ℤ/2)^{r₁}` and the quotient has rank
`r₂`, so rationalisation keeps the rank and destroys every torsion distinction the rest of this
roadmap is about; the last node says so in as many words, because the temptation to identify
models that agree rationally is exactly what the roadmap's ownership note warns against.

### `milnor-to-quillen-degree-three` — The degree-three part of the graded Milnor-to-Quillen map

*construction*

Specialise the graded ring map K^M_*(F) -> K_*(F) imported from K2SymbolsBrauer T.2:graded-map
to degree three, obtaining a homomorphism K_3^M(F) -> K_3(F) determined by the product of three
units. Nothing about this map is asserted in degrees other than three, and its degree-two case,
an isomorphism by Matsumoto's theorem, is not a model for degree three.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Import the graded map K^M_*(F) -> K_*(F) constructed from products in K-theory.
1. Take its degree-three component and prove that it sends the Milnor symbol of three units to
   the triple product of their classes in K_1(F).
1. Prove multiplicativity of the product in the two orders and the sign rule, so that the map is
   well defined on the Steinberg quotient.
1. Record that the degree-three map is not asserted to be an isomorphism; injectivity is a
   separate theorem below and surjectivity is false for most fields.

**API.**

| name | role | statement |
| --- | --- | --- |
| `milnorToQuillen3` | constructor | The homomorphism K_3^M(F) -> K_3(F). |
| `milnorToQuillen3_symbol` | characterisation | It sends the Milnor symbol of three units to the product of their K_1 classes. |
| `milnorToQuillen3_map` | functoriality | It is natural in the field for every field homomorphism. |
| `milnorToQuillen3_graded` | compatibility | It is the degree-three component of the imported graded ring map. |

**Used by.** *V.2's definition of the indecomposable quotient*: the quotient is formed by the cokernel of exactly this map. *V.5's bookkeeping for Q*: the decomposable class of order two in K_3(Q) is the image of the Milnor symbol with three -1 entries. *V.4's Suslin sequence*: the sequence is stated for the indecomposable quotient, so its construction depends on this map.

**Unit tests.**

- `finite_field_source_zero` — For a finite field the source vanishes, so the map is zero.
- `symbol_of_minus_ones` — For F = Q the symbol with three -1 entries has nonzero image, of
  order two.
- `natural_in_F` — For Q inside R the square with the induced maps commutes.
- `not_surjective` — For a number field with r_2 > 0 the map is not surjective, since the target
  has positive rank and the source is torsion.

**Acceptance.**

- The symbol with a repeated entry maps to the class of the corresponding product, and the
  Steinberg relation holds on the image.
- For a finite field the source is zero in degree three, so the map is zero; the target is not.
- For F = Q the image is the subgroup of order two identified in V.5.

**Depends on.** **inside this roadmap** `k3-h3-steinberg`; **other roadmaps** `K2SymbolsBrauer:T.2`, `GeneralAlgebraicKTheory:K.2`.

**Source.** Kbook.2013, VI.4.3.2 and VI.5 opening (PDF pp. 488, 495): “By Proposition VI.4.3.2, K_3^M(F) injects into K_3(F).” — The K-book uses the degree-three component of the graded map; T.2:graded-map constructs the graded map itself.

### `k3-indecomposable` — The indecomposable K_3 of a field ★

*definition* · planet **K3^ind(F)**

Define K_3^ind(F) as the cokernel of the degree-three Milnor-to-Quillen map, together with the
quotient map K_3(F) -> K_3^ind(F). The decomposable part is by definition the image of that map;
it is a subgroup of K_3(F) isomorphic to K_3^M(F) only once injectivity has been proved, which
is a separate theorem.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Form the image of the degree-three map and the quotient of K_3(F) by it.
1. Prove that the quotient map is surjective with the stated kernel.
1. Prove functoriality in the field, which follows from the naturality of the degree-three map.
1. Keep the decomposable part as the image, and record separately that it is isomorphic to
   Milnor K_3 exactly when the degree-three map is injective.

**API.**

| name | role | statement |
| --- | --- | --- |
| `K3ind` | data | The abelian group K_3^ind(F). |
| `K3ind.mk` | constructor | The surjection K_3(F) -> K_3^ind(F). |
| `K3ind.mk_eq_zero_iff` | characterisation | A class dies in the quotient exactly when it lies in the image of the degree-three map. |
| `K3ind.map` | functoriality | A field homomorphism induces a map of indecomposable quotients, compatibly with the quotient maps. |
| `K3ind.ext` | extensionality | Two homomorphisms out of K_3^ind(F) agree when their composites with the quotient map agree. |
| `K3ind.decomposable` | structure | The decomposable subgroup, defined as the image, with its inclusion. |

**Used by.** *V.4's Suslin exact sequence*: the middle term of the sequence is this group. *V.5's number-field answers*: the structure theorem is stated for this quotient before it is lifted to K_3. *HabiroNumberFields HB.1*: the integral convention consumed there is a statement about this quotient and the Bloch group.

**Unit tests.**

- `finite_field` — For a finite field the quotient map is an isomorphism.
- `rational_numbers` — For Q the quotient is cyclic of order 24 while K_3 is cyclic of order 48.
- `rank_r2` — For a number field the quotient has free rank r_2.
- `not_a_subgroup` — The decomposable part is defined as an image; asserting it is a copy of
  Milnor K_3 without injectivity is the error this definition avoids.

**Acceptance.**

- The quotient is zero exactly when the degree-three map is onto.
- For a finite field the quotient map is an isomorphism, because the source of the degree-three
  map vanishes.
- For a number field the quotient has rank r_2, matching the rank of K_3.

**Depends on.** **inside this roadmap** `milnor-to-quillen-degree-three`.

**Source.** Kbook.2013, VI.5 opening (PDF p. 495): “The focus of this section will be to relate the group K_3^ind(F) := K_3(F)/K_3^M(F) to Bloch's group B(F) of a field F.” — The displayed definition, with the caution about the image made explicit here.

### `decomposable-exactness` — Exactness and functoriality of the decomposable-indecomposable sequence

*lemma*

The sequence K_3^M(F) -> K_3(F) -> K_3^ind(F) -> 0 is exact and natural in F. Exactness on the
left is not asserted here; it is the content of the injectivity theorem.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Exactness at the middle and the right is the definition of a cokernel.
1. Naturality follows from naturality of the degree-three map and the universal property of the
   cokernel.
1. State the missing left-exactness as a hypothesis to be supplied by the injectivity theorem,
   not as part of this lemma.

**Acceptance.**

- The sequence for a finite field reduces to 0 -> K_3(F_q) -> K_3^ind(F_q) -> 0.
- Naturality is checked on the inclusion of Q in a number field.

**Depends on.** **inside this roadmap** `k3-indecomposable`.

**Source.** Kbook.2013, VI.5 opening (PDF p. 495): “K_3^ind(F) := K_3(F)/K_3^M(F)” — The exactness statement is the definition of the quotient; the left-hand end is treated separately in VI.4.3.2.

### `milnor-k3-injective` — Milnor K_3 of a field injects into Quillen K_3 ★

*theorem* · planet **Injectivity of Milnor K3**

For every field F the degree-three map K_3^M(F) -> K_3(F) is injective. Consequently the
decomposable part is isomorphic to K_3^M(F) and the sequence of the previous lemma is short
exact.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Import the statement from the motivic description of K_3 that the K-book records: the map is
   identified with the edge map of the motivic spectral sequence in the relevant bidegree, whose
   source is Milnor K_3.
1. Deduce injectivity from the identification of Milnor K_3 with the motivic cohomology group in
   the corresponding weight.
1. Conclude the short exact sequence 0 -> K_3^M(F) -> K_3(F) -> K_3^ind(F) -> 0, natural in F.

**Acceptance.**

- For a number field the short exact sequence has torsion left-hand term of order 2 to the power
  r_1, which is the input to the V.5 calculations.
- The theorem is false with Milnor K_3 replaced by the image of an arbitrary product map, which
  is why the statement is about the specified map.

**Depends on.** **inside this roadmap** `milnor-to-quillen-degree-three`, `decomposable-exactness`; **other roadmaps** `MotivicEtaleKTheory:M.7`, `K2SymbolsBrauer:T.2`.

**Source.** Kbook.2013, VI.4.3.2 and VI.5.3 proof (PDF pp. 488, 496): “By VI.4.3.1 and Proposition VI.4.3.2, there is an exact sequence 0 -> K_3^M(F) -> K_3(F) -> H_1(F, Z(2)) -> 0.” — The displayed short exact sequence contains the injectivity asserted here, with the indecomposable quotient identified with the motivic group.

### `milnor-k3-number-field` — Milnor K_3 of a number field is elementary abelian of rank the number of real places

*theorem*

For a number field F with r_1 real embeddings, K_3^M(F) is isomorphic to the elementary abelian
2-group of rank r_1. In particular it is torsion and is detected entirely at the real places; it
vanishes exactly when F is totally imaginary.

**Hypotheses.** F is a number field with r_1 real and r_2 complex embeddings.

**Construction and proof.**

1. Import the computation of Milnor K-theory of a number field in degree three from
   K2SymbolsBrauer, where the graded Milnor ring is constructed.
1. Identify the invariant r_1 with the pinned count of real places.
1. Record the two consequences used later: the group is torsion, so it disappears after
   tensoring with the rationals, and it vanishes for a totally imaginary field.

**Acceptance.**

- For F = Q the group is cyclic of order two, generated by the symbol with three -1 entries.
- For F = Q(i) the group is trivial.
- The rank is the number of real places, not the number of infinite places.

**Depends on.** **other roadmaps** `K2SymbolsBrauer:T.2`; **baseline** `mathlib:NumberField.InfinitePlace.nrRealPlaces`.

**Source.** Kbook.2013, VI.5.3 proof and III.7.2(d) as cited there (PDF p. 496): “Then K_3^M(F) = (Z/2)^{r_1} by III.7.2(d), and K_3(F) is finitely generated by IV.6.9 and V.6.8.” — The displayed isomorphism is the statement of this node.

### `k3-rank-borel` — The rank of K_3 of a number field is the number of complex places ★

*theorem* · planet **Borel rank of K3**

For a number field F, K_3(F) is finitely generated and its free rank is r_2, the number of
complex places. The same holds for the indecomposable quotient, since the kernel of the quotient
map is torsion by the previous node.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Import Borel's rank theorem from BorelRegulators R.3 in the case n = 3, where the period-four
   pattern gives rank r_2.
1. Import finite generation of the K-groups of a number field.
1. Combine with the previous node: the decomposable part is torsion, so the quotient has the
   same rank.

**Acceptance.**

- For F = Q the rank is zero, consistent with K_3(Q) finite.
- For F = Q(i) the rank is one, consistent with the value recorded in V.5.
- The rank is r_2 and not r_1 + r_2, which is the answer in degree one modulo four; using the
  wrong row of the period-four pattern is the error this test catches.

**Depends on.** **inside this roadmap** `milnor-k3-number-field`, `k3-indecomposable`; **other roadmaps** `BorelRegulators:R.3`.

**Source.** Kbook.2013, IV.1.18 and VI.5.3 (PDF pp. 279, 496): “By Borel's Theorem IV.1.18, K_3(F) is the sum of Z^{r_2} and a finite group.” — Borel's theorem in the shape used by the K-book for degree three.

### `rationalisation-loss` — What rationalisation destroys

*comparison*

For a number field F, tensoring with the rationals sends the short exact sequence of V.2 to an
isomorphism K_3(F) tensor Q = K_3^ind(F) tensor Q, a rational vector space of dimension r_2, and
kills K_3^M(F) entirely. Every distinction this roadmap draws between integral Bloch-group
conventions therefore becomes invisible rationally: the decomposable class, the enhanced torsion
term of V.4 and the 2-primary difference between conventions in V.3 all vanish.

**Hypotheses.** F is a number field.

**Construction and proof.**

1. Tensor the short exact sequence with the rationals, which is exact on the right and kills the
   torsion left-hand term.
1. Identify the resulting dimension with r_2 by the rank theorem.
1. List the three pieces of information lost, each with a pointer to the node that retains it
   integrally.
1. State the consequence used downstream: an agreement of two models after rationalisation is
   not evidence that they agree integrally.

**Acceptance.**

- For F = Q both sides are zero, so the comparison is vacuous there and no integral information
  can be recovered from it.
- For F = Q(i) both sides are one-dimensional while the integral groups differ by a cyclic group
  of order 24.

**Depends on.** **inside this roadmap** `milnor-k3-injective`, `k3-rank-borel`, `milnor-k3-number-field`.

**Source.** Kbook.2013, VI.5.3 (PDF p. 496): “K_3^ind(F) = Z^{r_2} + Z/w, and: (a) If F is totally imaginary then K_3(F) = Z^{r_2} + Z/w; (b) If F has r_1 > 0 embeddings into R then K_3(F) = Z^{r_2} + Z/(2w) + (Z/2)^{r_1-1}.” — The integral answers whose torsion is exactly what rationalisation destroys.

## V.3 — Bloch-group conventions

Conventions, fixed once. The target of the boundary is Suslin's antisymmetric tensor quotient
`(A ⊗ A)/⟨a⊗b + b⊗a⟩`, **not** the exterior square: the two differ by a copy of `A/2A`,
generated by the classes `a ∧ a`, and over ℤ that copy does not split off — the pinned Tau Ceti
splitting theorem for the tensor square needs 2 invertible. The pre-Bloch group is presented on
the symbols `[x]`, `x ≠ 0`, by `[1] = 0` and the five-term relations in the normalisation quoted
below; the Bloch group is the kernel of `[x] ↦ x ∧ (1−x)`. Two further nodes fix the elements `c
= [x] + [1−x]` and `⟨x⟩ = [x] + [x⁻¹]`, whose orders control every torsion statement downstream.
The comparison with the Calegari–Garoufalidis–Zagier convention is proved, not asserted: their
group is a quotient of Suslin's by a subgroup of exponent two, so the two agree after inverting
2 and differ integrally.

### `antisymmetric-tensor-quotient` — Suslin's antisymmetric tensor quotient ★

*definition* · planet **Antisymmetric tensor quotient**

For an abelian group A define the antisymmetric tensor quotient as the quotient of A tensor A
over the integers by the subgroup generated by all elements a tensor b + b tensor a. Write the
class of a tensor b as a wedge b in this quotient. This group is not the exterior square: the
class of a wedge a need not vanish, and the exterior square is the further quotient by those
classes.

**Hypotheses.** A is an abelian group; all tensor products are over the integers.

**Construction and proof.**

1. Form the tensor square of A over the integers, using the additive type tag to regard a
   multiplicative group such as the units of a field as a module.
1. Take the subgroup generated by the symmetrised elements a tensor b + b tensor a and form the
   quotient.
1. Prove bilinearity of the induced pairing and the antisymmetry relation a wedge b = -(b wedge
   a).
1. Prove the universal property: homomorphisms out of the quotient correspond to bilinear maps
   that vanish on symmetrised elements.
1. Do not divide by two anywhere: the construction is required to work over the integers, where
   the symmetric and antisymmetric parts do not split.

**API.**

| name | role | statement |
| --- | --- | --- |
| `antisymSquare` | data | The group of the antisymmetric tensor quotient of A. |
| `antisymSquare.mk` | constructor | The bilinear map A x A -> antisymSquare A. |
| `antisymSquare.antisymm` | relation | a wedge b + b wedge a = 0 for all a, b. |
| `antisymSquare.lift` | universal-property | A bilinear map vanishing on all symmetrised elements factors uniquely through the quotient. |
| `antisymSquare.map` | functoriality | A homomorphism of abelian groups induces a homomorphism of antisymmetric quotients, compatibly with composition. |
| `antisymSquare.toExterior` | compatibility | The canonical surjection onto the exterior square of A. |

**Used by.** *V.3's boundary map*: the boundary of the pre-Bloch group lands in this group, and Suslin's Bloch group is its kernel. *V.4's spectral sequence*: the group appears as a summand of the invariants of the second homology of the diagonal torus. *V.3's comparison with the Calegari-Garoufalidis-Zagier convention*: their boundary lands in the exterior square, and the difference between the two targets is exactly the kernel recorded here.

**Unit tests.**

- `square_class_nonzero` — For A of order two the class of the nonzero element wedged with
  itself is nonzero.
- `antisymmetry` — a wedge b = -(b wedge a) for all a and b.
- `agrees_with_eigenspace_when_two_invertible` — When 2 is invertible the quotient agrees with
  the pinned antisymmetric-tensor submodule of the tensor square; over the integers the pinned
  splitting theorem does not apply.
- `not_exterior_square` — For A cyclic of order two the map to the exterior square is not
  injective: a non-example a wrong definition would fail.

**Acceptance.**

- For A the additive group of order two, the quotient is cyclic of order two generated by the
  class of the nonzero element tensored with itself, so the class of a wedge a is nonzero: this
  is the acceptance test that distinguishes the quotient from the exterior square.
- Antisymmetry holds: a wedge b + b wedge a = 0.
- For A free of rank one the quotient is cyclic of order two, while the exterior square is
  trivial.

**Depends on.** **baseline** `mathlib:TensorProduct`, `mathlib:Additive`, `mathlib:Subgroup.closure`, `mathlib:QuotientGroup.mk`, `tauceti:TauCeti.antisymmetricTensors`, `tauceti:TauCeti.isCompl_symmetricTensors_antisymmetricTensors`.

**Source.** Kbook.2013, VI.5 opening (PDF p. 495): “For any abelian group A, let ~^2 A denote the quotient of the group A tensor A by the subgroup generated by all a tensor b + b tensor a. The exterior power ^2 A is the quotient of ~^2 A by the subgroup (isomorphic to A/2A) of all symbols x wedge x.” — The definition and its relation to the exterior square, both quoted.

### `antisym-exterior-comparison` — The antisymmetric quotient over the exterior square, and its A/2A kernel ★

*theorem* · planet **Antisymmetric versus exterior square**

For every abelian group A the canonical surjection from the antisymmetric tensor quotient onto
the exterior square has kernel generated by the classes a wedge a, and that kernel is isomorphic
to A/2A by the map sending a modulo 2A to a wedge a. The sequence A/2A -> antisymSquare A ->
exteriorSquare A -> 0 is exact, and the left map is injective.

**Hypotheses.** A is an abelian group.

**Construction and proof.**

1. The exterior square is by definition the quotient by the subgroup generated by the classes a
   wedge a, which gives exactness at the middle and the right.
1. Show that the assignment a -> a wedge a is additive modulo the relations: expand (a+b) wedge
   (a+b) and use the antisymmetry relation to cancel the cross terms.
1. Show that the induced map kills 2A, because 2a wedge 2a is four times a wedge a and a wedge a
   has order dividing two in the quotient.
1. Prove injectivity of the induced map from A/2A, which is the content of the parenthetical
   identification in the source.
1. Record the consequence: over the integers the two groups differ by a group of exponent two,
   which is the source of every 2-primary discrepancy between Bloch-group conventions.

**Acceptance.**

- For A cyclic of order two the kernel is cyclic of order two and the exterior square is
  trivial.
- For A uniquely 2-divisible the map is an isomorphism; this is why no 2-primary discrepancy
  appears rationally.
- For A the group of units of a finite field of odd order, A/2A is cyclic of order two.

**Depends on.** **inside this roadmap** `antisymmetric-tensor-quotient`.

**Source.** Kbook.2013, VI.5 opening (PDF p. 495): “The exterior power ^2 A is the quotient of ~^2 A by the subgroup (isomorphic to A/2A) of all symbols x wedge x.” — The identification of the kernel with A/2A is quoted; the proof of additivity and injectivity is supplied here.

### `five-term-relation` — The five-term relation ★

*definition* · planet **Five-term relation**

For a field F and elements x, y of F with x and y outside the set consisting of 0 and 1 and with
x different from y, the five-term element of the free abelian group on the symbols [z], z in F
without 0, is [x] - [y] + [y/x] - [(1 - x^{-1})/(1 - y^{-1})] + [(1 - x)/(1 - y)]. The five-term
subgroup is the subgroup generated by all these elements together with the element [1]. This is
Suslin's normalisation, as presented in the K-book; the Calegari-Garoufalidis-Zagier
normalisation indexes the same expression over the projective line and is compared in a separate
node.

**Hypotheses.** F is a field; x and y lie in F, are different from 0 and 1, and are different from each other. The five arguments are then all defined and different from 0.

**Construction and proof.**

1. Check that each of the five arguments lies in F without 0 under the stated hypotheses, so
   that the expression is a well-formed element of the free abelian group.
1. Define the five-term subgroup as the subgroup generated by these elements and by [1].
1. Record the degenerate conventions explicitly: [1] is set to zero, and the arguments 0 and
   infinity are excluded from the generators rather than silently given values.
1. Prove the two derived relations used constantly below, by subtracting and adding the relation
   to its variants with x and y interchanged or inverted: [x] + [1 - x] is independent of x, and
   [x] + [x^{-1}] has order dividing two.

**API.**

| name | role | statement |
| --- | --- | --- |
| `fiveTerm` | constructor | The five-term element attached to an admissible pair x, y. |
| `fiveTermSubgroup` | data | The subgroup generated by all five-term elements and by [1]. |
| `fiveTerm_mem` | characterisation | Membership in the five-term subgroup as a finite integer combination of five-term elements. |
| `fiveTerm_symm` | relation | The relation obtained by interchanging x and y, and the relation obtained by inverting both, as derived identities. |
| `fiveTerm_map` | functoriality | A field homomorphism sends five-term elements to five-term elements. |

**Used by.** *V.3's pre-Bloch group*: the pre-Bloch group is the quotient by exactly this subgroup. *V.6's certificates*: a certificate is a finite list of five-term instances with integer coefficients. *V.4's configuration complex*: the boundary of a 4-simplex of the configuration complex is a five-term element.

**Unit tests.**

- `arguments_defined` — For an admissible pair all five arguments are nonzero elements of F.
- `c_independent` — The derived relation that [x] + [1 - x] does not depend on x follows from
  two instances.
- `inverse_two_torsion` — The derived relation that twice [x] + [x^{-1}] vanishes follows from
  two instances.
- `degenerate_excluded` — The pair x = y is not admissible; a definition that accepts it
  produces an undefined argument.

**Acceptance.**

- Substituting y = x is excluded by hypothesis, and the expression is not defined there.
- For F with four elements the set of admissible pairs is nonempty, which is why the standing
  hypothesis of the section is that F has at least four elements.
- The two derived relations hold, which is the acceptance test for the normalisation.

**Depends on.** **baseline** `mathlib:FreeAbelianGroup`, `mathlib:Subgroup.closure`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “with relations [1] = 0 and [x] - [y] + [y/x] - [(1 - x^{-1})/(1 - y^{-1})] + [(1 - x)/(1 - y)] = 0, x not equal to y in F without 0 and 1.” — The relation in the normalisation used throughout this roadmap.

### `pre-bloch-group` — The pre-Bloch group ★

*definition* · planet **Pre-Bloch group P(F)**

For a field F define the pre-Bloch group P(F) as the abelian group presented by generators [x],
one for each x in F without 0, subject to [1] = 0 and to all five-term relations. Equivalently
it is the quotient of the free abelian group on F without 0 by the five-term subgroup.

**Hypotheses.** F is a field, of at least four elements wherever a statement of this section is invoked.

**Construction and proof.**

1. Form the free abelian group on the set of nonzero elements of F.
1. Quotient by the five-term subgroup defined above.
1. Prove the universal property: a homomorphism out of P(F) is the same as a function on
   generators killing [1] and every five-term element.
1. Prove functoriality in F: a field homomorphism induces a homomorphism of pre-Bloch groups.
1. Record the degenerate-symbol convention: the generator set excludes 0, and [1] is zero; the
   symbols [0] and [infinity] of the projective-line convention are handled in the comparison
   node, not silently identified.

**API.**

| name | role | statement |
| --- | --- | --- |
| `preBloch` | data | The pre-Bloch group P(F). |
| `preBloch.gen` | constructor | The class [x] of a nonzero element. |
| `preBloch.gen_one` | simp | [1] = 0. |
| `preBloch.fiveTerm` | relation | Every five-term element is zero in P(F). |
| `preBloch.lift` | universal-property | A function on nonzero elements killing [1] and all five-term elements extends uniquely to a homomorphism out of P(F). |
| `preBloch.map` | functoriality | A field homomorphism induces a homomorphism of pre-Bloch groups, functorially. |

**Used by.** *V.3's Bloch group*: the Bloch group is the kernel of the boundary defined on P(F). *V.4's configuration complex*: the degree-three homology of the coinvariant complex is identified with P(F). *V.6's constructors*: an explicit Bloch element is produced as a finite combination of generators of P(F) with vanishing boundary.

**Unit tests.**

- `one_is_zero` — [1] = 0.
- `five_term_vanishes` — A five-term element evaluates to zero.
- `c_well_defined` — [x] + [1 - x] is independent of x, computed for two different admissible
  values.
- `not_free` — P(F) is not free on the generators: for a field with at least four elements a
  nontrivial relation holds, which a wrong definition would miss.

**Acceptance.**

- [1] is zero in P(F).
- For a field with four elements the group is nonzero, so the presentation is not vacuous.
- The class of [x] + [1 - x] is independent of x, by the derived relation of the previous node.

**Depends on.** **inside this roadmap** `five-term-relation`; **baseline** `mathlib:FreeAbelianGroup`, `mathlib:PresentedGroup`, `mathlib:QuotientGroup.mk`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “Definition 5.1. For any field F, let P(F) denote the abelian group presented with generators symbols [x] for x in F without 0, with relations [1] = 0 and [the five-term relation].” — The definition of this node.

### `bloch-boundary` — The boundary of the pre-Bloch group

*construction*

Construct the homomorphism from P(F) to the antisymmetric tensor quotient of the group of units
of F sending [x] to x wedge (1 - x) for x different from 1, and [1] to 0. The sign convention is
the one displayed here; the opposite sign gives the same kernel but a different map, and the
choice is recorded rather than left implicit.

**Hypotheses.** F is a field. The target is the antisymmetric tensor quotient of the multiplicative group of F, written additively.

**Construction and proof.**

1. Define the map on generators by the displayed formula, using the additive type tag on the
   units.
1. Verify that every five-term element maps to zero: expand the five images in the target and
   cancel using bilinearity and the antisymmetry relation. This is where the antisymmetric
   quotient, rather than the exterior square, is needed to make the computation an identity
   rather than a congruence modulo two-torsion.
1. Conclude by the universal property of P(F) that the map descends.
1. Prove naturality in F.

**API.**

| name | role | statement |
| --- | --- | --- |
| `blochBoundary` | constructor | The homomorphism P(F) -> antisymSquare of the units of F. |
| `blochBoundary_gen` | simp | The boundary of [x] is x wedge (1 - x). |
| `blochBoundary_one` | simp | The boundary of [1] is zero. |
| `blochBoundary_map` | functoriality | The boundary commutes with the maps induced by a field homomorphism. |
| `blochBoundary_comp_exterior` | compatibility | Composing with the surjection onto the exterior square gives the classical boundary. |

**Used by.** *V.3's Bloch group*: the Bloch group is its kernel. *V.3's four-term exact sequence*: its cokernel is identified with K_2(F). *V.6's constructors*: an element is admitted only when its boundary is proved to vanish.

**Unit tests.**

- `five_term_to_zero` — The boundary of a five-term element is zero.
- `sign_convention` — The boundary of [x] is x wedge (1 - x) and not (1 - x) wedge x; the two
  differ by a sign in the target.
- `compatible_with_exterior` — The composite with the projection to the exterior square is the
  classical boundary.
- `not_injective` — The boundary is not injective whenever the Bloch group is nonzero, for
  example for the rational numbers.

**Acceptance.**

- The image of [x] + [1 - x] is computed and is not zero in general, which pins the sign
  convention.
- The five-term element maps to zero, checked symbolically.
- The composite with the surjection onto the exterior square is the classical Bloch boundary,
  which is the map used by the Calegari-Garoufalidis-Zagier convention.

**Depends on.** **inside this roadmap** `pre-bloch-group`, `antisymmetric-tensor-quotient`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “There is a canonical map P(F) -> ~^2 F^x sending [1] to 0 and [x] to x wedge (1 - x) for x not equal to 1.” — The map of this node, with its target.

### `bloch-group` — The Bloch group in Suslin's convention ★

*definition* · planet **Bloch group B(F)**

Define B(F), Suslin's Bloch group, as the kernel of the boundary from P(F) to the antisymmetric
tensor quotient of the units of F. It is a subgroup of P(F), not a quotient, and the target of
the boundary is the antisymmetric quotient rather than the exterior square.

**Hypotheses.** F is a field, of at least four elements wherever a theorem of this section is applied.

**Construction and proof.**

1. Take the kernel of the boundary constructed above.
1. Prove functoriality: a field homomorphism carries the kernel into the kernel.
1. Record membership as the statement that a finite combination of generators has vanishing
   boundary; this is the form the V.6 constructors consume.
1. Record the two standing distinctions: the target is the antisymmetric quotient, and the group
   is defined before any quotient by five-term relations is taken a second time, unlike the
   projective-line convention.

**API.**

| name | role | statement |
| --- | --- | --- |
| `blochGroup` | data | The subgroup B(F) of P(F). |
| `blochGroup.mem_iff` | characterisation | An element lies in B(F) exactly when its boundary vanishes. |
| `blochGroup.map` | functoriality | A field homomorphism induces a homomorphism of Bloch groups. |
| `blochGroup.coe` | coercion | The inclusion of B(F) into P(F). |
| `blochGroup.ext` | extensionality | Two elements of B(F) are equal exactly when their images in P(F) are. |

**Used by.** *V.4's Suslin exact sequence*: the right-hand term of the sequence is this group. *Polylogarithms P.2*: the Bloch-Wigner function is descended through exactly this convention, as that layer states. *HabiroNumberFields HB.1*: the convention comparison consumed there is between this group and the Calegari-Garoufalidis-Zagier group.

**Unit tests.**

- `rational_numbers` — B(Q) is cyclic of order six.
- `membership_needs_boundary` — The class of [x] alone does not lie in B(F) unless x wedge (1 -
  x) vanishes.
- `c_lies_in_B` — The element [x] + [1 - x] lies in B(F) for every admissible x.
- `not_all_of_P` — B(F) is a proper subgroup of P(F) whenever K_2(F) is nonzero.

**Acceptance.**

- For the rational numbers B(F) is cyclic of order six, generated by the class of [2] + [-1], as
  recorded in V.5.
- For the field with two elements the group is trivial and for the field with three elements it
  is infinite cyclic; both are excluded by the standing hypothesis.
- An element of B(F) has vanishing boundary by definition, so the constructor of V.6 cannot
  produce a class without a proof.

**Depends on.** **inside this roadmap** `bloch-boundary`, `pre-bloch-group`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “and Bloch's group B(F) is defined to be its kernel.” — The definition of this node.

### `bloch-four-term-exact` — The four-term exact sequence of the Bloch group

*theorem*

For every field F the sequence 0 -> B(F) -> P(F) -> antisymSquare of the units of F -> K_2(F) ->
0 is exact. In particular the cokernel of the boundary is Matsumoto's presentation of K_2(F).

**Hypotheses.** F is a field.

**Construction and proof.**

1. Exactness at B(F) and at P(F) is the definition of the kernel.
1. Identify the cokernel of the boundary with K_2(F): the antisymmetric quotient modulo the
   classes x wedge (1 - x) is exactly Matsumoto's presentation of K_2 of a field, imported from
   K2SymbolsBrauer.
1. Check that the imported presentation is the one with the Steinberg relation and not a
   quotient of it.

**Acceptance.**

- For a finite field K_2 vanishes, so the boundary is onto.
- For the rational numbers the sequence is consistent with the orders recorded in V.5.
- Replacing the antisymmetric quotient by the exterior square breaks exactness on the right by a
  group of exponent two.

**Depends on.** **inside this roadmap** `bloch-group`, `bloch-boundary`; **other roadmaps** `K2SymbolsBrauer:T.2`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “Thus we have an exact sequence 0 -> B(F) -> P(F) -> ~^2 F^x -> K_2(F) -> 0.” — The displayed sequence.

### `element-c` — The element c and the elements in angle brackets

*lemma*

Assume F has at least four elements. Then c = [x] + [1 - x] does not depend on the choice of x,
and for every x the element in angle brackets, [x] + [x^{-1}], satisfies twice it equals zero.
Both lie in B(F).

**Hypotheses.** F is a field with at least four elements. x lies in F and is different from 0 and 1.

**Construction and proof.**

1. Write down the two auxiliary five-term relations that the source displays, obtained from the
   defining relation by substituting the complementary and inverse arguments.
1. Subtract the first auxiliary relation from the defining relation: the result is [x] + [1 - x]
   - [y] - [1 - y] = 0, which is independence of the choice.
1. Add the second auxiliary relation to the defining relation: the result expresses the
   difference of two angle-bracket elements as a third, so that interchanging x and y and using
   the symmetry of the quotient argument gives twice an angle-bracket element equal to zero.
1. Use that F has at least four elements to write an arbitrary admissible z as a quotient, so
   that the two-torsion statement holds for every z rather than for quotients only.
1. Check that both elements have vanishing boundary, so that they lie in B(F).

**Acceptance.**

- Independence of x is checked for two different admissible values in a field with four
  elements.
- Twice an angle-bracket element is zero; this fails without the hypothesis on the size of F.
- Both elements lie in the Bloch group.

**Depends on.** **inside this roadmap** `pre-bloch-group`, `bloch-group`, `five-term-relation`.

**Source.** Kbook.2013, VI.5.4 and its proof (PDF pp. 496-497): “Lemma 5.4. Assuming |F| >= 4, (a) c = [x] + [1 - x] is independent of the choice of x in F without 0 and 1. (b) For each x in F without 0 and 1, twice the angle-bracket element is 0.” — Parts (a) and (b) of the cited lemma, with the proof steps as displayed there.

### `angle-bracket-homomorphism` — The angle-bracket homomorphism and the order of c

*lemma*

Assume F has at least four elements. The assignment sending a unit x to the angle-bracket
element [x] + [x^{-1}] is a homomorphism from the units of F to B(F). Three times c equals the
angle-bracket element at -1, and consequently six times c equals zero.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. From the additivity relation derived in the previous lemma, the angle-bracket assignment
   turns products into sums, so it is a homomorphism on units.
1. Compute three times c as the sum of the six generators obtained from x, its complement and
   their inverses, and collapse the sum with the two-torsion relation to the angle-bracket
   element at minus the square of one minus x.
1. Use that the angle-bracket assignment is a homomorphism and that squares die, by the two-
   torsion relation, to identify the result with the angle-bracket element at -1.
1. Conclude that six times c vanishes, since twice an angle-bracket element is zero.

**Acceptance.**

- Six times c is zero in every admissible field.
- For the rational numbers c has order exactly six, so the bound is attained and cannot be
  improved in general.
- The homomorphism sends a square to zero.

**Depends on.** **inside this roadmap** `element-c`.

**Source.** Kbook.2013, VI.5.4 (c), (d) and proof (PDF pp. 496-497): “(c) There is a homomorphism F^x -> B(F) sending x to the angle-bracket element. (d) Three times c equals the angle-bracket element at -1 and hence six times c is 0 in B(F).” — Parts (c) and (d) of the cited lemma, with the displayed computation.

### `c-characteristic-torsion` — When c has smaller order

*lemma*

If the characteristic of F is two, or F contains a square root of -1, then three times c
vanishes in B(F). If the characteristic is three, or F contains a cube root of -1, then twice c
vanishes. Neither statement says that c is zero.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. In each case the relevant angle-bracket element at -1 vanishes: for a square root of -1
   because the argument is a square and squares die, and in characteristic two because -1 is 1.
1. Combine with the identity that three times c is the angle-bracket element at -1 to get the
   first assertion.
1. For the second assertion use the cube-root hypothesis to rewrite the angle-bracket element at
   -1 as three times an angle-bracket element, which is itself two-torsion, so that six times c
   collapses to twice c being zero.
1. State the two hypotheses separately: a claim that c always has order six is false.

**Acceptance.**

- For the field with four elements three times c is zero.
- For the rational numbers neither hypothesis holds and c has order exactly six.
- The lemma is about the order of c, not about its vanishing: c is nonzero in the rational
  numbers.

**Depends on.** **inside this roadmap** `angle-bracket-homomorphism`.

**Source.** Kbook.2013, VI.5.4.1 (PDF p. 497): “Corollary 5.4.1. If char(F) = 2 or a square root of -1 lies in F then three times c is 0 in B(F); if char(F) = 3 or a cube root of -1 lies in F then twice c is 0 in B(F).” — The corollary as displayed.

### `bloch-wigner-dilogarithm` — The Bloch-Wigner dilogarithm

*definition*

Define the Bloch-Wigner function D on the complex projective line by D(z) = Im(Li_2(z)) + arg(1
- z) log|z| on the cut domain where the two ingredients are defined, extended by zero at 0, 1
and infinity. The resulting function is real analytic away from those three points and
continuous on the whole projective line, and it is independent of the presentation used to
define it. The dilogarithm Li_2, the branch conventions and the cut domain are imported from
Polylogarithms P.1, which owns them; what is added here is only the descent of the function to
the algebraic objects of this layer. This node carries a reserved id and is the subject of the
restructure proposal recorded in this packet: the construction belongs to Polylogarithms P.1,
whose stage text plans it.

**Hypotheses.** z is a point of the complex projective line. Li_2 and the branch of the argument are the ones fixed by Polylogarithms P.1.

**Construction and proof.**

1. Import the dilogarithm and its cut domain, together with the principal argument and the
   complex logarithm, from Polylogarithms P.1.
1. Define the function by the displayed formula off the three special points.
1. Prove that the two discontinuities cancel: the jump of the imaginary part of the dilogarithm
   across the cut is minus the jump of the argument term, so the sum extends continuously.
1. Extend by zero at 0, 1 and infinity and prove continuity there, using that the logarithmic
   singularities are killed by the vanishing of the other factor.
1. Prove independence of the presentation: any two of the standard expressions for the same
   single-valued function agree, which is the statement P.1 proves for the general single-valued
   polylogarithm.

**API.**

| name | role | statement |
| --- | --- | --- |
| `blochWigner` | constructor | The function D from the complex projective line to the reals. |
| `blochWigner_zero_one_infty` | simp | D vanishes at 0, at 1 and at infinity. |
| `blochWigner_conj` | relation | D of the conjugate is minus D. |
| `blochWigner_inv` | relation | D of the inverse is minus D. |
| `blochWigner_continuous` | characterisation | D is continuous on the whole projective line and real analytic off the three special points. |

**Used by.** *V.3's torsion warning*: D kills torsion, so agreement of two conventions under D is not evidence that they agree integrally. *Polylogarithms P.2*: the weight-two regulator is this function descended through the Bloch group of this layer. *V.5's order of c*: the order of c in B(Q) is detected by the Rogers function built from D.

**Unit tests.**

- `vanishes_at_specials` — D(0) = D(1) = D(infinity) = 0.
- `odd_under_conjugation` — D of the conjugate is minus D, so D vanishes on the real points.
- `value_at_i` — D at the imaginary unit is Catalan's constant, a specific nonzero value that a
  wrong normalisation fails.
- `not_analytic_at_one` — D is continuous but not real analytic at 1: a non-example that
  distinguishes continuity from analyticity.

**Acceptance.**

- D vanishes at 0, at 1 and at infinity.
- D of the conjugate of z is minus D of z, and D of the inverse of z is minus D of z.
- D is not given by a globally continuous choice of argument: the acceptance test is that the
  definition does not use the argument as a global function.

**Depends on.** **other roadmaps** `Polylogarithms:P.1`; **baseline** `mathlib:Complex.log`, `mathlib:Complex.arg`.

**Source.** Kbook.2013, VI.5.2.1 (PDF p. 496): “This may be proven using the Rogers L-function, which is built from the dilogarithm function.” — The K-book uses the analytic function only to detect the order of c; the construction itself is planned by Polylogarithms P.1, quoted in the restructure entry of this packet.

### `bloch-wigner-five-term` — The Bloch-Wigner function satisfies the five-term relation

*theorem*

The Bloch-Wigner function satisfies the five-term relation: for admissible x and y the
alternating sum of its values at the five arguments of the five-term element vanishes.
Consequently D induces a homomorphism from P(C) to the reals, and by restriction a homomorphism
from B(C) to the reals. The identity itself is proved in Polylogarithms P.1; what this node adds
is the descent through the presentation of P(C) fixed by this layer. This node carries a
reserved id and is the subject of the restructure proposal recorded in this packet.

**Hypotheses.** x and y are admissible for the five-term relation over the complex numbers.

**Construction and proof.**

1. Import the five-term identity for D from Polylogarithms P.1, whose stage text states it.
1. Check that the arguments of the imported identity are the five arguments of this layer's
   normalisation of the five-term element, which is the step the two conventions make necessary.
1. Apply the universal property of P(C): the assignment sending a generator to its value under D
   kills [1] and every five-term element, hence descends.
1. Restrict the descended homomorphism to B(C).
1. Record that the descended map kills all torsion, since the reals are torsion-free; this is
   the warning that V.3 makes central.

**Acceptance.**

- The descended homomorphism vanishes on c and on every angle-bracket element, because both are
  torsion.
- The descended homomorphism is nonzero on B(C), which is what makes it a regulator rather than
  the zero map.
- The identity is checked on one explicit admissible pair as a numerical acceptance test with an
  error bound.

**Depends on.** **inside this roadmap** `bloch-wigner-dilogarithm`, `pre-bloch-group`, `bloch-group`, `five-term-relation`; **other roadmaps** `Polylogarithms:P.1`.

**Source.** Kbook.2013, VI.5.2.1 (PDF p. 496): “In fact, the element c = [2] + [-1] has order exactly 6 in both B(Q) and B(R). This may be proven using the Rogers L-function, which is built from the dilogarithm function.” — The use the K-book makes of the analytic function; the five-term identity for D is planned by Polylogarithms P.1, quoted in the restructure entry.

### `cgz-convention-comparison` — Suslin's convention against the Calegari-Garoufalidis-Zagier convention

*comparison*

Calegari, Garoufalidis and Zagier define the Bloch group as the quotient A(F)/C(F), where A(F)
is the kernel of the boundary from the free abelian group on the projective line to the exterior
square of the units, and C(F) is the subgroup of A(F) generated by the five-term elements.
Suslin's group is instead the kernel of a boundary defined on the quotient by the five-term
subgroup, with the antisymmetric quotient as target. Construct the comparison homomorphism and
prove that their group is a quotient of Suslin's by a subgroup of exponent two, so that the two
agree after inverting two, and in particular for every odd torsion coefficient.

**Hypotheses.** F is a field. Both conventions are read in their own sources and neither is adjusted to the other.

**Construction and proof.**

1. Write out both definitions with their generator sets: the projective-line convention adjoins
   the symbols at 0, 1 and infinity and sets them to zero, while Suslin's convention omits them
   from the generators.
1. Construct the map from Suslin's group to theirs: a kernel element in the quotient lifts to
   the free group, the lift lies in their kernel by compatibility of the two boundaries, and its
   class modulo the five-term subgroup is well defined.
1. Identify the failure of injectivity with the difference between the two targets: the
   antisymmetric quotient surjects onto the exterior square with kernel of exponent two, so the
   two kernels differ by a group of exponent two.
1. Conclude that the comparison is an isomorphism after inverting two, and record their own
   statement that the definitions in the literature usually agree up to 6-torsion, together with
   the extra 3-torsion carried by c.
1. Record what the comparison is for: a finite regulator distinguishes the conventions, a real
   regulator does not.

**Acceptance.**

- After tensoring with the integers modulo an odd number the comparison is an isomorphism, which
  is the form used in the Calegari-Garoufalidis-Zagier argument.
- For the rational numbers both groups are cyclic of order six, so the exponent-two discrepancy
  is invisible there; the test is stated so that this does not pass for the wrong reason.
- A wrong comparison that forgets the difference of targets would make the map an isomorphism
  integrally, which the exponent-two statement forbids.

**Depends on.** **inside this roadmap** `bloch-group`, `antisym-exterior-comparison`, `five-term-relation`.

**Source.** CGZ.2018, Definition 1.1 and its remarks, p. 1: “The Bloch group of a field F is the quotient B(F) = A(F)/C(F), where A(F) is the kernel of the map d from Z(F) to the exterior square of the units, [X] maps to X wedge (1 - X) (and [0], [1], [infinity] map to 0) and C(F) inside A(F) the group generated by the five-term relation. ... Our Bloch group is a quotient of Suslin's Bloch group by a subgroup of exponent 2 (see Lemma 2.2).” — Their definition and their own comparison with Suslin's group.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “and Bloch's group B(F) is defined to be its kernel.” — Suslin's side of the comparison.

### `small-field-conventions` — The two small fields, and the Bloch group of a finite field

*lemma*

The Bloch group of the field with two elements is trivial and the Bloch group of the field with
three elements is infinite cyclic; both are pathological and are excluded by the standing
hypothesis that F has at least four elements. For a finite field with q > 3 elements, B(F_q) is
cyclic of order (q + 1)/2 when q is odd and cyclic of order q + 1 when q is even.

**Hypotheses.** F is a finite field with q elements.

**Construction and proof.**

1. Treat the two small fields directly from the presentation: for two elements there are no
   admissible generators, and for three elements a single generator survives with no relation.
1. For q > 3 derive the order from Suslin's exact sequence of V.4 together with the value of K_3
   of a finite field recorded in V.5, dividing by the order of the enhanced roots of unity.
1. Separate the two parities: the roots of unity of a field of odd order have even order, so the
   enhanced group is a nontrivial extension, while in even characteristic it is not.
1. Record the constraint this places on every general statement of the section: an infinite-
   field theorem may not be applied to a finite field without its hypothesis.

**Acceptance.**

- For the field with four elements the group is cyclic of order five.
- For the field with five elements the group is cyclic of order three.
- The two exceptional small fields are not covered by the general formula, which is the point of
  the lemma.

**Depends on.** **inside this roadmap** `bloch-group`, `suslin-exact-sequence`, `k3-finite-field`.

**Source.** Kbook.2013, VI.5.1.1 (PDF p. 495): “Since the cases B(F_2) = 0 and B(F_3) = Z are pathological, we will tacitly assume that |F| >= 4 in this section. Theorem 5.2 below implies that if q > 3 is odd then B(F_q) is cyclic of order (q + 1)/2, while if q > 3 is even then B(F_q) is cyclic of order q + 1.” — The remark as displayed.

## V.4 — Suslin's exact sequence

Suslin's theorem, decomposed. The configuration complex on the projective line is acyclic for an
infinite set, so its hyperhomology computes group homology; its degree-three coinvariants are
exactly `P(F)`, with the boundary of the four-simplex the five-term element. The spectral
sequence identifies the third differential out of that corner with the Bloch boundary of V.3,
which is what makes the surviving term `B(F)` rather than an unnamed subgroup, and produces `ψ`
on `H₃(GL₂(F))`. The projective plane and the cyclic complex extend `ψ` to `H₃(GL₃(F))`, which
is already stable. The monomial-matrix sequence and the computation `π₃^ind(BM⁺) ≅ μ̃(F) ⊕ ℤ/12`
then give the theorem. The left-hand term is the **enhanced** group of roots of unity — the
unique nontrivial extension by `ℤ/2` in even order — and a node is spent on why it is not
`Tor₁^ℤ(μ(F), μ(F))` with a tilde written next to it.

### `configuration-complex` — The configuration complex of a set ★

*construction* · planet **Configuration complex**

For a set X let C_n(X) be the free abelian group on the ordered tuples of n + 1 pairwise
distinct points of X, with the alternating-sum differential that deletes one entry, and with the
augmentation sending each singleton to 1. When a group acts on X this is a complex of modules
over the group ring. The tuples are ordered and the entries are required to be distinct; both
are part of the definition.

**Hypotheses.** X is a set; G is a group acting on X when the equivariant structure is used.

**Construction and proof.**

1. Define the degree-n term as the free abelian group on the set of injective tuples of length n
   + 1.
1. Define the differential by the alternating sum of the deletion maps and prove that it squares
   to zero, using that deleting two entries in either order gives the same tuple with opposite
   signs.
1. Define the augmentation to the integers and prove that it kills the image of the differential
   from degree one.
1. Transport a group action on X to an action on each term, and prove that the differential and
   augmentation are equivariant.
1. Record the two variants used later: the subcomplex of tuples in general position in the
   projective plane, and the associated simplicial abelian group with duplicated entries
   allowed.

**API.**

| name | role | statement |
| --- | --- | --- |
| `configComplex` | data | The chain complex C_*(X) with its augmentation. |
| `configComplex.d_comp_d` | relation | The differential squares to zero. |
| `configComplex.aug` | constructor | The augmentation to the integers. |
| `configComplex.smul` | structure | The action of a group acting on X, by permutation of entries. |
| `configComplex.map` | functoriality | An injection of sets induces a chain map. |

**Used by.** *V.4's computation of the coinvariants for the projective line*: the degree-three coinvariants are identified with the pre-Bloch group. *V.4's map psi on the homology of the general linear groups*: the map is the edge map of the hyperhomology spectral sequence of this complex. *Polylogarithms P.2*: the configuration and cross-ratio cocycle used there is built on this complex.

**Unit tests.**

- `d_squared` — The differential squares to zero in every degree.
- `one_point` — For a one-point set the complex is the integers in degree zero.
- `distinctness` — A tuple with a repeated entry is not a generator; a definition that admits it
  computes a different homology.
- `equivariance` — The differential commutes with the action of a group acting on X.

**Acceptance.**

- The differential squares to zero.
- For X with a single point the complex is the integers in degree zero and nothing else.
- The complex is not the standard simplicial chain complex on X, since duplicated entries are
  excluded; that variant appears separately.

**Depends on.** **baseline** `mathlib:FreeAbelianGroup`, `mathlib:Finsupp`.

**Source.** Kbook.2013, VI.5.5 (PDF p. 497): “Definition 5.5. If X is any set, let C_*(X) denote the 'configuration' chain complex in which C_n is the free abelian group on the set of (n + 1)-tuples (x_0, ..., x_n) of distinct points in X, with differential the alternating sum of the deletions. There is a natural augmentation C_0(X) -> Z sending each (x) to 1.” — The definition as displayed.

### `configuration-acyclicity` — Acyclicity of the configuration complex

*lemma*

If X is infinite the augmentation from C_*(X) to the integers is a quasi-isomorphism. If X is
finite with more than n + 1 elements the homology of C_*(X) still vanishes in degree n.
Consequently, for a group G acting on X, the hyperhomology of G with coefficients in C_*(X) is
the ordinary homology of G in the corresponding range.

**Hypotheses.** X is a set, infinite or of cardinality greater than n + 1. G acts on X.

**Construction and proof.**

1. For X infinite pick a proper subset and a point outside it, and define the contracting
   homotopy that prepends that point; this gives a chain homotopy from the inclusion of the
   subcomplex to the projection onto the integers.
1. Deduce that the augmentation is a quasi-isomorphism by passing to the colimit over finite
   subsets.
1. For the finite case run the same argument in the range where a point outside is available,
   which gives the vanishing in degree n under the stated cardinality bound.
1. Feed the quasi-isomorphism into the hyperhomology spectral sequence to get the identification
   with ordinary group homology.

**Acceptance.**

- For the projective line over the field with two elements, which has seven points, the homology
  vanishes in degrees at most three, which is exactly the range the proof for finite fields
  needs.
- For a two-point set the complex is not acyclic in degree one, so the cardinality hypothesis is
  sharp.
- The identification of hyperhomology with group homology holds in the stated range only.

**Depends on.** **inside this roadmap** `configuration-complex`.

**Source.** Kbook.2013, VI.5.5.1 and VI.5.5.2 (PDF p. 497): “Lemma 5.5.1. If X is infinite then C_*(X) -> Z is a quasi-isomorphism. ... Corollary 5.5.2. If a group G acts on X, and X is infinite (or |X| > n + 1), then H_n(G, C_*(X)) = H_n(G, Z).” — The lemma and corollary as displayed, with the prepending homotopy of the cited proof.

### `hyperhomology-map` — Hyperhomology of a group with configuration coefficients, and the map to the coinvariants

*construction*

For a group G acting on a set X construct the hyperhomology of G with coefficients in the
configuration complex and the canonical map from it to the homology of the coinvariant complex
C_*(X) tensored over G with the integers. Together with the acyclicity lemma this produces, in
the right range, a map from the homology of G to the homology of the coinvariant complex.

**Hypotheses.** G is a group acting on the set X.

**Construction and proof.**

1. Construct the hyperhomology as the homology of the total complex of the double complex formed
   from a projective resolution over the group ring and the configuration complex.
1. Construct the edge map to the homology of the coinvariant complex.
1. Combine with the acyclicity lemma to obtain the map out of the homology of G in the stated
   range.
1. Prove naturality for an equivariant map of pairs consisting of a group and a set it acts on.

**API.**

| name | role | statement |
| --- | --- | --- |
| `configHyperhomology` | data | The hyperhomology of G with coefficients in the configuration complex. |
| `configHyperhomology.toCoinvariants` | constructor | The canonical map to the homology of the coinvariant complex. |
| `configHyperhomology.iso_groupHomology` | compatibility | In the range of the acyclicity lemma it agrees with the ordinary homology of G. |
| `configHyperhomology.map` | functoriality | Naturality for an equivariant pair map. |

**Used by.** *V.4's map psi on the homology of GL_2*: psi is the composite of this map with the identification of the coinvariants with the pre-Bloch group. *V.4's map psi on the homology of GL_3*: the same construction applied to the projective plane and the cyclic subcomplex.

**Unit tests.**

- `trivial_group` — For the trivial group the map is the identity.
- `shapiro_terms` — For a transitive action the first-page terms are the homology of a
  stabiliser.
- `range_restriction` — Outside the range of the acyclicity lemma the identification with group
  homology fails.

**Acceptance.**

- For the trivial group the map is the identity on the homology of the complex.
- For a transitive action on tuples, Shapiro's lemma identifies the terms with the homology of a
  stabiliser, which is the computation the next lemma performs.
- The map is not an isomorphism in general; only its edge behaviour in low degrees is used.

**Depends on.** **inside this roadmap** `configuration-complex`, `configuration-acyclicity`; **baseline** `mathlib:groupHomology`.

**Source.** Kbook.2013, VI.5.5 (PDF p. 497): “If a group G acts on X, then C_*(X) is a complex of G-modules, and we may form its hyperhomology H_n(G, C_*(X)). There is a canonical map H_n(G, C_*(X)) -> H_n(C_G), where C_G denotes C_*(X) tensored over G with Z.” — The construction as displayed.

### `coinvariants-p1-homology` — The coinvariant complex of the projective line

*lemma*

Let F be a field, G the group of invertible two by two matrices over F acting on the projective
line of F, and C_G the coinvariant complex. Then the degree-zero homology is the integers, the
homology vanishes in degrees one and two, and the degree-three homology is the pre-Bloch group
P(F). The identification sends the class of the tuple consisting of 0, infinity, 1 and x to the
generator [x].

**Hypotheses.** F is a field; G is the group of invertible two by two matrices over F acting on the projective line.

**Construction and proof.**

1. In degrees at most two the action of G on the basis of each term is transitive, so the
   coinvariants are the integers by Shapiro's lemma applied to the stabiliser.
1. Compute the differential from degree two to degree one on the class of the tuple 0, 1,
   infinity and find that it is an isomorphism, which gives the vanishing in degrees one and
   two.
1. In degree three write the basis as the free module over the group ring on the tuples
   consisting of 0, infinity, 1 and x, with x outside 0 and 1, so that the coinvariants are free
   on the symbols [x].
1. Compute the image of the differential from degree four on the tuple consisting of 0,
   infinity, 1, x and y: it is exactly the five-term element in the normalisation of V.3.
1. Conclude that the cokernel is P(F).

**Acceptance.**

- The boundary of the four-simplex is the five-term element, which is the acceptance test tying
  the geometry to the presentation of V.3.
- The argument goes through for every finite field as well, since the projective line over the
  field with two elements already has seven points.
- The degree-one and degree-two vanishing uses transitivity, which fails for a general action;
  the lemma is about this action.

**Depends on.** **inside this roadmap** `configuration-complex`, `configuration-acyclicity`, `pre-bloch-group`, `five-term-relation`; **baseline** `mathlib:OnePoint.equivProjectivization`, `mathlib:Projectivization.generalLinearGroup_is_two_pretransitive`.

**Source.** Kbook.2013, VI.5.6 and VI.5.6.1 (PDF p. 498): “Lemma 5.6. H_0(C_G) = Z, H_n(C_G) = 0 for n = 1, 2 and H_3(C_G) = P(F). ... Thus the cokernel H_3(C_G) of d from C_4 tensor_G Z to C_3 tensor_G Z is P(F).” — The lemma and the displayed computation of the boundary of the four-simplex.

### `gl2-spectral-sequence` — The low-degree terms of the configuration spectral sequence for the two by two matrices

*lemma*

For G the invertible two by two matrices over F acting on the projective line, the hyperhomology
spectral sequence with first page the homology of G with coefficients in the terms of the
configuration complex converges to the homology of G. Its first-page rows are computed by
Shapiro's lemma from the stabilisers, the first differential in the relevant column is induced
by the involution exchanging the two diagonal entries, and the third differential out of the
corner term P(F) is the boundary of V.3 followed by a split inclusion.

**Hypotheses.** F is a field. T is the diagonal subgroup, B the upper triangular subgroup, and the stabilisers are as computed in the source.

**Construction and proof.**

1. Identify the first-page terms: the stabiliser of a point is B, of an ordered pair is T, and
   of an ordered triple is the antidiagonal copy of the units.
1. Use that the inclusion of T in B induces an isomorphism on homology, imported as a cited
   input, to replace B by T.
1. Show that the first differential from the triple column to the pair column is a split
   injection, so that the column dies on the second page.
1. Show that the first differential on the pair column is induced by one minus the exchange
   involution, so that the second-page terms are the coinvariants and the quotient recorded in
   the source.
1. Identify the third differential out of the corner: it is the boundary of V.3 followed by the
   split inclusion of the antisymmetric quotient into the invariants of the second homology of
   the diagonal torus, by the Kunneth formula.
1. Read off that the corner survives to the third page as B(F).

**Acceptance.**

- The second page in the row of degree one is the units of F in the corner column and zero next
  to it.
- The identification of the third differential with the boundary of V.3 is what makes the kernel
  B(F) rather than an unidentified subgroup.
- The Kunneth computation produces the antisymmetric quotient as a summand, not the exterior
  square; substituting the exterior square breaks the identification.

**Depends on.** **inside this roadmap** `hyperhomology-map`, `coinvariants-p1-homology`, `bloch-boundary`, `antisymmetric-tensor-quotient`.

**Source.** Kbook.2013, VI.5.8, VI.5.8.1, VI.5.8.2 and the proof of VI.5.7 (PDF pp. 498-499): “A routine but tedious calculation shows that the differential d_3 from P(F) to the invariants of H_2(T_2) is the canonical map P(F) -> ~^2(F^x) of 5.1 followed by the split inclusion. ... Thus we have E^3 in the corner equal to B(F).” — The spectral sequence and the identification of its differentials, as displayed.

### `psi-gl2` — The map psi on the third homology of the two by two matrices ★

*theorem* · planet **psi on H3 of GL2**

For every field F the first and second homology of the group of invertible two by two matrices
are the units of F and the direct sum of the exterior square of the units with K_2(F), and there
is a map psi fitting into an exact sequence from the third homology of the monomial subgroup to
the third homology of the general linear group, onto B(F), and then to zero.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Read the first and second homology off the second and third pages of the spectral sequence of
   the previous lemma.
1. Define psi as the edge map from the third homology of the group to the corner term, which the
   previous lemma identifies with B(F).
1. Identify the kernel of psi: the spectral sequence exhibits it as an extension of a quotient
   of the second homology of the diagonal torus by a quotient of the third, and the source shows
   that this is the image of the third homology of the monomial subgroup.
1. Conclude exactness of the displayed sequence.

**Acceptance.**

- The second homology contains K_2(F) as a direct summand, which is a check on the
  identification of the third differential.
- psi is surjective onto B(F), not onto P(F); a construction landing in P(F) at this stage would
  be wrong.
- For a finite field both sides are finite and the orders match the values of V.5.

**Depends on.** **inside this roadmap** `gl2-spectral-sequence`, `bloch-group`; **other roadmaps** `K2SymbolsBrauer:T.2`.

**Source.** Kbook.2013, VI.5.7 (PDF p. 498): “Theorem 5.7. For all F, H_1(GL_2(F), Z) = F^x, H_2(GL_2(F), Z) = (^2 F^x) + K_2(F) and there is a map psi and an exact sequence H_3(M_2, Z) -> H_3(GL_2(F), Z) -> B(F) -> 0.” — The theorem as displayed; the K-book notes that the published version has a typographical error here, which this node records in the source issues.

### `cyclic-complex-d` — The cyclic structure and the associated acyclic complex

*construction*

The simplicial abelian group associated with the configuration complex carries a cyclic
structure. Construct the associated acyclic complex obtained by omitting the last face operator,
the norm chain map from the reduced complex to it, and the mapping cone D_* of the induced
morphism of truncated complexes. The cone is quasi-isomorphic to the shifted cone of the norm
map, and its degree-zero term is the degree-one term of the acyclic complex.

**Hypotheses.** X is a set with the simplicial abelian group of tuples, duplications allowed.

**Construction and proof.**

1. Define the cyclic operators on each degree and check the three families of identities that
   make the simplicial abelian group cyclic.
1. Form the acyclic complex by omitting the last face, and prove it is acyclic.
1. Define the norm chain map as the alternating sum of the powers of the cyclic operator.
1. Truncate away the degree-zero terms, where the norm is the identity, and form the mapping
   cone D_* of the resulting morphism, with the differential displayed in the source.
1. Prove that the shifted cone of the norm map maps quasi-isomorphically to D_*.
1. Record the variant needed for the projective plane: the subcomplex of tuples with no three
   collinear points is closed under the cyclic operator, so it inherits the structure, and for
   infinite X its augmentation is a quasi-isomorphism.

**API.**

| name | role | statement |
| --- | --- | --- |
| `cyclicConfig` | structure | The cyclic structure on the simplicial abelian group of tuples. |
| `acyclicConfig` | data | The acyclic complex obtained by omitting the last face. |
| `normMap` | constructor | The norm chain map from the reduced complex to the acyclic one. |
| `coneD` | data | The complex D_* with the displayed differential. |
| `coneD_quasiIso` | characterisation | The shifted cone of the norm map maps quasi-isomorphically to D_*. |
| `coneD.generalPosition` | compatibility | The general-position subcomplex in the projective plane inherits the structure and is acyclic for infinite fields. |

**Used by.** *V.4's map psi on the homology of the three by three matrices*: psi is defined on the coinvariants of D_* for the projective plane. *V.4's vanishing on the diagonal torus*: the equivariant splitting of the augmentation of D_* is what makes the restriction of psi vanish.

**Unit tests.**

- `acyclicity` — The acyclic complex has vanishing homology in positive degrees.
- `cone_degree_zero` — The degree-zero term of D_* is the degree-one term of the acyclic
  complex.
- `cyclic_identities` — The cyclic operator in degree n has order n + 1 and satisfies the face
  and degeneracy identities.
- `finite_failure` — For a small finite set the general-position subcomplex need not be acyclic,
  a non-example the infinite hypothesis excludes.

**Acceptance.**

- The complex D_* is acyclic over the augmentation for infinite X.
- The degree-zero term of D_* is the degree-one term of the acyclic complex, as displayed.
- For a finite set the general-position subcomplex may fail to be acyclic, so the infinite
  hypothesis is recorded.

**Depends on.** **inside this roadmap** `configuration-complex`.

**Source.** Kbook.2013, VI.5.9, VI.5.9.1 and VI.5.9.2 (PDF p. 500): “We write D_* for the associated mapping cone of this morphism. Thus D_0 is the degree-one term of the acyclic complex, and D_n is the direct sum of the acyclic term in degree n + 1 and C_n for n > 0 with differential (x, y) -> (d^a x - Ny, -dy).” — The construction as displayed, together with the general-position variant of Example 5.9.1.

### `psi-gl3` — The map psi on the third homology of the three by three matrices, and its image ★

*theorem* · planet **psi on H3 of GL3**

For an infinite field F construct a homomorphism psi from the third homology of the group of
invertible three by three matrices to P(F), by sending the distinguished three-simplex to twice
c and the distinguished four-simplex with parameters a and x to the generator [a]. Its image is
B(F), and there is an exact sequence from the direct sum of the third homologies of the monomial
subgroup in rank two and of the diagonal subgroup in rank three, to the third homology of the
general linear group in rank three, onto B(F), and then to zero.

**Hypotheses.** F is an infinite field. The action is on the projective plane, and the complex is the general-position subcomplex.

**Construction and proof.**

1. Write the coinvariants of D_* in low degrees using the four distinguished points of the
   projective plane, as the source does, and identify the degree-three and degree-four terms.
1. Define psi on the coinvariants by the two displayed values and verify that it kills the image
   of the degree-four term, which is the calculation the source performs.
1. Compose with the canonical map from the third homology of the group to the homology of the
   coinvariant complex to obtain psi.
1. Prove that the restriction of psi to the third homology of the diagonal subgroup vanishes,
   using the equivariant splitting of the augmentation of D_* over that subgroup.
1. Import the generation statement that the third homologies of the diagonal subgroup and of the
   two by two matrices generate the third homology in rank three, and combine with the rank-two
   theorem to identify the image with B(F) and to get the displayed exact sequence.

**Acceptance.**

- The composite of the inclusion of the rank-two group with psi is the rank-two map, which is
  the compatibility lemma.
- psi vanishes on the third homology of the diagonal subgroup.
- The image is B(F), so the construction never produces an element of P(F) outside the kernel of
  the boundary.

**Depends on.** **inside this roadmap** `cyclic-complex-d`, `psi-gl2`, `hyperhomology-map`, `pre-bloch-group`, `element-c`, `homological-stability`.

**Source.** Kbook.2013, VI.5.10, VI.5.11 and VI.5.12 (PDF pp. 500-502): “The map psi' on the degree-three coinvariants defined by psi'(P) = 2c and psi' of the four-simplex equal to a vanishes on the image of the degree-four term, so it induces a homomorphism psi from H_3(GL_3(F), Z) to P(F). ... Proposition 5.12. The image of psi is B(F), and there is an exact sequence H_3(M_2, Z) + H_3(T_3, Z) -> H_3(GL_3(F), Z) -> B(F) -> 0.” — The construction and the proposition as displayed.

### `psi-compatibility` — Compatibility of the two constructions of psi

*lemma*

The composite of the map induced by the inclusion of the two by two matrices into the three by
three matrices with the map psi of the rank-three construction is the map psi of the rank-two
theorem, followed by the inclusion of B(F) into P(F).

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. Use that the rank-two group fixes the third distinguished point of the projective plane, so
   it acts on the complement.
1. Construct the equivariant chain map that appends the fixed point to a tuple, and restrict it
   to the subcomplex whose image lies in the general-position subcomplex.
1. Factor the composite through the coinvariants of that restricted complex.
1. Project from the punctured plane to the projective line with centre the fixed point, which is
   equivariant, and identify the resulting composite with the inclusion of the rank-two theorem
   by inspection on generators.

**Acceptance.**

- The composite lands in B(F) inside P(F), not in P(F) generally.
- The identification is checked on the distinguished three-simplex, where both sides give twice
  c.

**Depends on.** **inside this roadmap** `psi-gl3`, `psi-gl2`.

**Source.** Kbook.2013, VI.5.10 and its proof (PDF p. 501): “Lemma 5.10. The composition H_3(GL_2, Z) -> H_3(GL_3, Z) -> P(F) is the homomorphism H_3(GL_2(F), Z) -> B(F) inside P(F) of Theorem 5.7.” — The lemma as displayed, with the projection argument of its proof.

### `homological-stability` — The homological stability input

*lemma*

For an infinite field F the map from the homology of the rank-r general linear group to the
homology of the stable general linear group is an isomorphism in degree n whenever r is at least
n, and the quotient of the degree-n homology in rank n by the image from rank n - 1 is Milnor
K_n(F). Only the case n = 3 is used below, where it gives that the third homology in rank three
is already stable.

**Hypotheses.** F is an infinite field.

**Construction and proof.**

1. Import the stability theorem for general rings in terms of the stable range, and the sharper
   statement for infinite fields, both of which the K-book attributes to Suslin.
1. Specialise to n = 3 to obtain that the third homology in rank three maps isomorphically to
   the stable third homology.
1. Record the second half, the identification of the quotient with Milnor K-theory, which is
   what connects the stability statement to V.2.
1. Record that these are imported statements: if StableHomotopyKTheory later owns general
   homological stability, these are its specialisations and this node becomes a citation.

**Acceptance.**

- In degree three, rank three suffices; rank two does not, which is why the rank-three
  construction is needed at all.
- The quotient identification in degree three gives Milnor K_3(F), matching V.2.
- For a finite field the stability bound is different and the statement is not applied.

**Depends on.** **other roadmaps** `GeneralAlgebraicKTheory:K.2`, `StableHomotopyKTheory:H.3`.

**Source.** Kbook.2013, IV.1.14, IV.1.14.1 and IV.1.15 (PDF p. 278): “Proposition 1.15. (Suslin) If F is an infinite field, then H_n(GL_r(F)) -> H_n(GL(F)) is an isomorphism for all r >= n. In addition, there is a canonical isomorphism H_n(GL_n(F))/im H_n(GL_{n-1}(F)) = K^M_n(F).” — The statement as displayed.

### `symmetric-group-image` — The image of the homology of the symmetric groups

*lemma*

Regard the infinite symmetric group as the group of permutation matrices inside the stable
general linear group. Then the image of its third homology under psi is the subgroup generated
by twice c, which is trivial or cyclic of order three. The three-primary part comes from the
alternating group on three letters, whose image under psi is generated by twice c.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Import the computation of the third homology of the infinite symmetric group and the
   stabilisation statement that it is reached at six letters.
1. Use the Sylow transfer argument: the primary torsion of the homology of a finite group is the
   image of the homology of a Sylow subgroup, so only the two- and three-primary parts can
   survive.
1. Import the vanishing of the two-primary part in B(F).
1. For the three-primary part reduce to the alternating group on three letters and compute:
   build a comparison of the periodic free resolution with the configuration complex, evaluate
   psi on the resulting degree-three class, and simplify the six-term expression to minus twice
   c.
1. In characteristic three the permutation representation is conjugate to an upper triangular
   one, so the image is trivial, and twice c is zero there anyway.

**Acceptance.**

- In characteristic three the image is trivial.
- Over a field with at least four elements the simplification of the six-term expression to
  minus twice c uses a choice of parameters with x different from minus one, which the
  cardinality hypothesis provides.
- The image is generated by twice c, not by c: a wrong computation that produced c would
  contradict the order of c.

**Depends on.** **inside this roadmap** `psi-gl3`, `element-c`, `c-characteristic-torsion`.

**Source.** Kbook.2013, VI.5.13 and VI.5.14 (PDF pp. 502-503): “Proposition 5.13. The image of H_3 of the infinite symmetric group in B(F) is the subgroup generated by 2c, which is trivial or cyclic of order 3. ... Lemma 5.14. If |F| >= 4, the image of Z/3 = H_3(A_3) in B(F) is generated by 2c.” — The two statements as displayed, with the resolution comparison of the cited proof.

### `monomial-sequence` — The monomial-matrix exact sequence

*theorem*

Let M be the group of monomial matrices in the stable general linear group of F and let the
infinite symmetric group sit inside it by permutation matrices. Then the sequence from the third
homology of M to the direct sum of the third homology of the stable general linear group and the
third homology of the infinite symmetric group, by psi on the first factor and minus psi
composed with the inclusion on the second, onto B(F), and then to zero, is exact.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Let the kernel of the map from the third homology of the rank-n monomial group to that of the
   symmetric group be the relative term; it suffices to identify its image with the kernel of
   psi for large n.
1. One inclusion follows from the rank-three exact sequence, since the kernel of psi comes from
   the images of the diagonal subgroup and of the rank-two monomial group, both of which lie in
   the relative term.
1. For the other inclusion decompose the relative term by the Kunneth formula for the product of
   the rank-two monomial group with a symmetric group, and import the statement that two of the
   three summands land in the image of the diagonal subgroup for large n.
1. Conclude that the image of the relative term is exactly the kernel of psi, which gives
   exactness.

**Acceptance.**

- The sequence specialises to the rank-two theorem when the symmetric-group factor is dropped.
- For a field of characteristic three the symmetric-group contribution is trivial, consistent
  with the previous lemma.

**Depends on.** **inside this roadmap** `psi-gl3`, `symmetric-group-image`, `homological-stability`.

**Source.** Kbook.2013, VI.5.15 and its proof (PDF pp. 503-504): “Proposition 5.15. Let iota be the inclusion of the infinite symmetric group into GL(F). Then there is an exact sequence H_3(M, Z) -> H_3(GL(F), Z) + H_3 of the infinite symmetric group -> B(F) -> 0.” — The proposition as displayed.

### `pi3-bm-plus` — The cokernel of the third homotopy of the plus construction on the monomial group

*theorem*

For a field F with at least four elements the cokernel of the map from the third homotopy group
of the plus construction on the classifying space of the monomial group to K_3(F) is B(F) modulo
the subgroup generated by twice c, and there is an exact sequence with the same shape as the
monomial sequence but with the third homotopy groups in place of the third homologies. Dividing
by the products from lower degrees gives an exact sequence from the indecomposable part of the
third homotopy group to the direct sum of the indecomposable K_3 and the cyclic group of order
twelve, onto B(F), and then to zero.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Import that the homotopy groups of the plus construction on the monomial group form a graded
   ring with the stated first and second groups, and that the map to K-theory is a ring map.
1. Use Matsumoto's theorem to see that the second homotopy group maps onto K_2(F), and multiply
   by the first to see that Milnor K_3 lies in the image in degree three.
1. Chase the diagram formed by the commutator subgroup of the monomial group and the special
   linear group, with the Hurewicz maps, to identify the quotient of K_3(F) by the image with
   the quotient of the third homology of the special linear group by that of the monomial
   subgroup.
1. Use the compatible Kunneth splittings of the homology of the general linear and monomial
   groups over the determinant to reduce to the special linear case.
1. Combine with the monomial sequence and the computation of the symmetric-group image to obtain
   the cokernel and the exact sequence.
1. Divide by the products from the first and second homotopy groups, which map into Milnor K_3,
   to get the indecomposable reformulation.

**Acceptance.**

- The indecomposable reformulation has the cyclic group of order twelve as the symmetric-group
  contribution, which matches the stable homotopy group modulo the Hopf cube.
- The cokernel is B(F) modulo twice c, not B(F): the difference is the three-torsion detected by
  the symmetric groups.
- For a field of characteristic three the two statements coincide, since twice c vanishes there.

**Depends on.** **inside this roadmap** `monomial-sequence`, `k2-to-k3-h3-e`, `k3-indecomposable`, `milnor-to-quillen-degree-three`; **other roadmaps** `K2SymbolsBrauer:T.2`, `StableHomotopyKTheory:H.3`.

**Source.** Kbook.2013, VI.5.16 and VI.5.16.1 (PDF pp. 504-505): “Theorem 5.16. The cokernel of pi_3 BM+ -> K_3(F) is B(F)/(2c), and there is an exact sequence pi_3(BM+) -> K_3(F) + pi^s_3 -> B(F) -> 0. ... Corollary 5.16.1. The sequence of Theorem 5.16 induces an exact sequence pi_3^ind(BM+) -> K_3^ind(F) + Z/12 -> B(F) -> 0.” — The theorem and its corollary as displayed.

### `enhanced-mu` — The enhanced group of roots of unity ★

*definition* · planet **Enhanced roots of unity**

For a finite cyclic group A of even order there is a unique nontrivial central extension of A by
the group of order two; call it the enhancement of A. For A cyclic of odd order set the
enhancement to be A itself. Since the group of roots of unity of a field is the union of its
finite cyclic subgroups, define the enhanced group of roots of unity as the union of the
enhancements of the groups of n-th roots of unity. This is not the ordinary Tor group of the
roots of unity with themselves, and the tilde is not decoration: in even characteristic and in
the odd-order case the enhancement is trivial, while in the even-order case it doubles the
order.

**Hypotheses.** F is a field; the roots of unity are those of F.

**Construction and proof.**

1. Prove the uniqueness of the nontrivial extension of a finite cyclic group of even order by
   the group of order two, by classifying extensions with the second cohomology of a cyclic
   group.
1. Define the enhancement on each finite cyclic subgroup and check that the enhancements are
   compatible with the inclusions, so that the colimit exists.
1. Define the enhanced group of roots of unity as that colimit.
1. Prove functoriality for a field extension: the inclusion of roots of unity induces an
   injection of enhanced groups, which is the step Suslin's proof needs.
1. Record the relation with the ordinary Tor group: the first Tor group of the roots of unity
   with themselves is canonically the roots of unity, and the enhancement is a nontrivial
   extension of it in the even case.

**API.**

| name | role | statement |
| --- | --- | --- |
| `enhancedRootsOfUnity` | data | The enhanced group of roots of unity of a field. |
| `enhancedRootsOfUnity.toRoots` | projection | The surjection onto the roots of unity with kernel of order at most two. |
| `enhancedRootsOfUnity.odd_eq` | characterisation | In odd order, and in particular in even characteristic, the surjection is an isomorphism. |
| `enhancedRootsOfUnity.even_card` | characterisation | When the roots of unity have even order the enhancement has twice the order and is a nonsplit extension. |
| `enhancedRootsOfUnity.map` | functoriality | A field extension induces an injection of enhanced groups. |
| `enhancedRootsOfUnity.ne_tor` | compatibility | The comparison with the first Tor group of the roots of unity with themselves, which is a nontrivial extension in the even case. |

**Used by.** *V.4's Suslin exact sequence*: it is the left-hand term of the sequence. *V.5's calculation for the rational numbers*: its order four is what turns the order 24 of the indecomposable part into the order 6 of the Bloch group. *HabiroNumberFields HB.1*: the integral convention consumed there depends on which of the two groups is used.

**Unit tests.**

- `characteristic_two` — In characteristic two the enhancement is the identity.
- `rational_numbers` — For the rational numbers the enhanced group is cyclic of order four while
  the roots of unity have order two.
- `nonsplit` — The extension does not split in the even case, so the enhancement is not the
  direct sum with the group of order two.
- `not_ordinary_tor` — The enhancement is not the first Tor group of the roots of unity with
  themselves, a non-example the roadmap insists on.

**Acceptance.**

- For a field of characteristic two the enhancement is the identity, since the roots of unity
  have odd order.
- For the rational numbers the group of roots of unity has order two and its enhancement has
  order four, which is the value used in V.5.
- For an algebraically closed field of characteristic zero the enhanced group is a nontrivial
  extension of the roots of unity by the group of order two, and in particular is not isomorphic
  to the ordinary Tor group.

**Depends on.** **baseline** `mathlib:rootsOfUnity`, `mathlib:CommGroup.torsion`, `mathlib:CategoryTheory.Tor`, `mathlib:ZMod`.

**Source.** Kbook.2013, VI.5.1.2 and the paragraph before VI.5.2 (PDF p. 495): “For any finite cyclic abelian group A of even order m, there is a unique nontrivial extension of A by Z/2. If A is cyclic of odd order, we set the enhancement to be A. Since the group of roots of unity of F is a union of finite cyclic groups, we may define the enhanced group as the union of the enhancements.” — The definition as displayed.

### `pi3ind-bm-plus` — The indecomposable third homotopy group of the plus construction on the monomial group

*theorem*

For a field F the indecomposable part of the third homotopy group of the plus construction on
the classifying space of the monomial group is the direct sum of the enhanced group of roots of
unity and the cyclic group of order twelve. The proof proceeds through an exact sequence with
the group of square roots of unity on the left and the direct sum of the roots of unity with the
cyclic group of order twelve on the right, a computation of the composite with the diagonal
embedding, and the detection of the image by the e-invariant.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Analyse the Atiyah-Hirzebruch spectral sequence for the plus construction on the monomial
   group over the units of F, as a module over the stable homotopy ring, to obtain the exact
   sequence with the square roots of unity and the direct sum on the right.
1. Show that the composite of the diagonal embedding of the roots of unity with the projection
   of that sequence is squaring.
1. Show that the composite of the diagonal embedding with the map to indecomposable K_3 and then
   the e-invariant is injective, and an isomorphism for an algebraically closed field, by
   comparing etale Chern classes with the Bockstein.
1. Reduce to an algebraically closed field by naturality and injectivity of the enhancement
   under field extension, and conclude the direct sum decomposition.

**Acceptance.**

- In characteristic two the decomposition is immediate from the exact sequence.
- For an algebraically closed field of characteristic zero the enhanced summand is detected by
  the e-invariant, which is the acceptance test of the argument.
- The summand is the enhanced group and not the roots of unity: substituting the latter breaks
  the count for the rational numbers in V.5.

**Depends on.** **inside this roadmap** `enhanced-mu`, `pi3-bm-plus`; **other roadmaps** `MotivicEtaleKTheory:M.7`, `ArithmeticKTheory:N.5`.

**Source.** Kbook.2013, VI.5.17, VI.5.18, VI.5.19 and VI.5.20 (PDF pp. 505-507): “Proposition 5.17. There is an exact sequence 0 -> mu_2(F) -> pi_3^ind(BM+) -> mu(F) + Z/12 -> 0. ... Corollary 5.20. pi_3^ind(BM+) = the enhanced roots of unity + Z/12.” — The chain of statements as displayed.

### `suslin-exact-sequence` — Suslin's exact sequence ★

*theorem* · planet **Suslin's exact sequence**

For every field F with at least four elements there is an exact sequence 0 -> enhanced roots of
unity of F -> K_3^ind(F) -> B(F) -> 0. Equivalently, in Suslin's own formulation, the left-hand
term is the enhanced first Tor group of the roots of unity with themselves. The sequence is
natural in F.

**Hypotheses.** F is a field with at least four elements. B(F) is the Bloch group in Suslin's convention of V.3 and K_3^ind is the quotient of V.2.

**Construction and proof.**

1. Combine the indecomposable reformulation of the monomial sequence with the computation of the
   indecomposable third homotopy group: the kernel of the map from K_3^ind(F) to B(F) is the
   image of the enhanced group of roots of unity.
1. Prove that the enhanced summand injects into K_3^ind(F). For an algebraically closed field
   this is the e-invariant detection lemma.
1. Reduce the general case to the algebraically closed case by naturality, using that the
   enhancement is injective under field extension.
1. Conclude exactness, and record naturality in the field.
1. State the hypothesis honestly: the sequence is proved for fields with at least four elements,
   which covers the infinite fields the roadmap names and the finite fields with more than three
   elements.

**Acceptance.**

- For the rational numbers the sequence reads 0 -> Z/4 -> Z/24 -> Z/6 -> 0, which is consistent
  with the orders recorded in V.5.
- For a finite field with q > 3 elements the sequence gives the order of the Bloch group
  recorded in V.3.
- For the two excluded small fields the sequence is not asserted, which is the point of the
  hypothesis.

**Depends on.** **inside this roadmap** `pi3ind-bm-plus`, `pi3-bm-plus`, `enhanced-mu`, `k3-indecomposable`, `bloch-group`.

**Source.** Kbook.2013, VI.5.2 and the proof at the end of the section (PDF pp. 495, 507): “Theorem 5.2. (Suslin) For any field F with |F| >= 4, there is an exact sequence 0 -> the enhanced roots of unity -> K_3^ind(F) -> B(F) -> 0.” — The theorem as displayed, with the proof collated from 5.16.1 and 5.20.

### `tor-form-comparison` — The Tor form of the left-hand term

*comparison*

Suslin states the left-hand term of the sequence as an enhanced first Tor group of the roots of
unity of F with themselves. Construct the canonical isomorphism between that group and the
enhanced group of roots of unity defined here, and record the characteristic-dependent
convention: the enhancement is nontrivial exactly when the roots of unity have even order, which
fails in even characteristic. An ordinary Tor group with a tilde written next to it does not
satisfy the integral statement.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Compute the first Tor group of the roots of unity with themselves: for a cyclic group of
   order n it is cyclic of order n, and the computation passes to the colimit, so the Tor group
   is canonically the roots of unity.
1. Compare the two enhancements: both are determined by the unique nontrivial extension by the
   group of order two in the even-order case, so the canonical isomorphism of the underlying
   groups lifts.
1. Record the characteristic convention explicitly.
1. State the negative result the roadmap asks for: the ordinary Tor group, without enhancement,
   does not make the sequence exact when the roots of unity have even order, because the orders
   do not match.

**Acceptance.**

- For the rational numbers the ordinary Tor group has order two and the enhanced group has order
  four, so the two differ.
- In characteristic two the two agree, so the distinction is invisible there.
- The comparison is an isomorphism of groups, not merely an equality of orders.

**Depends on.** **inside this roadmap** `enhanced-mu`, `suslin-exact-sequence`; **baseline** `mathlib:CategoryTheory.Tor`.

**Source.** Kbook.2013, VI.5.1.2 and VI.5.2 (PDF p. 495): “For any finite cyclic abelian group A of even order m, there is a unique nontrivial extension of A by Z/2.” — The enhancement whose Tor form is compared here; the Tor formulation is Suslin's own, as the roadmap document records.

### `suslin-functoriality` — Functoriality and compatibility of the degree-three map

*lemma*

The Suslin sequence is natural for field extensions, and the composite from K_3(F) to B(F)
agrees with the map psi of the rank-three construction composed with the homological model of
V.1, and with the quotient map onto the indecomposable part.

**Hypotheses.** F and its extension have at least four elements.

**Construction and proof.**

1. Check naturality termwise: the enhancement is functorial, the indecomposable quotient is
   functorial by V.2, and the Bloch group is functorial by V.3.
1. Compare the two constructions of the map to B(F): the one through psi and the one through the
   quotient by the image of the monomial group, using the diagram in the proof of the cokernel
   theorem.
1. Compare with the homological model: the Hurewicz map of V.1 identifies K_3 with the third
   homology of the Steinberg group, which maps to the third homology of the general linear
   group, on which psi is defined.
1. Conclude that the degree-three map agrees with V.1 and with the indecomposable quotient,
   which is the compatibility the roadmap requires.

**Acceptance.**

- For the inclusion of the rational numbers into the reals the naturality square commutes.
- The composite through V.1 and the composite through V.2 agree, checked on the class of c.

**Depends on.** **inside this roadmap** `suslin-exact-sequence`, `psi-gl3`, `k3-h3-steinberg`, `k3-indecomposable`.

**Source.** Kbook.2013, VI.5.16 proof and VI.5.12.1 (PDF pp. 502, 504-505): “The map psi extends to a map defined on H_3(GL(F), Z), because of the stability result H_3(GL_3(F), Z) = H_3(GL(F), Z); see IV.1.15.” — The extension and the compatibility used here.

## V.5 — Concrete K₃ calculations

The calculations, each imported from its owner and specialised here. `K₃(𝔽_q) ≅ ℤ/(q²−1)` is the
case `j = 2` of `KTheoryFiniteLocalFields:L.1`, and it covers `q = 2` and `q = 3`, which no
Bloch-group presentation does. `K₃(ℤ) ≅ K₃(ℚ) ≅ ℤ/48` and `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24` come from
`ArithmeticKTheory:N.8`; what this layer adds is the bookkeeping the roadmap asks for — for ℚ
the four orders `2`, `24`, `4`, `6` of the decomposable part, the indecomposable quotient, the
enhanced roots of unity and the Bloch group, and the generator `c = [2] + [−1]` of order exactly
six.

### `k3-finite-field` — K_3 of a finite field ★

*theorem* · planet **K3 of a finite field**

For every finite field with q elements, K_3 is cyclic of order q squared minus one. The
statement includes q = 2 and q = 3, where it is obtained from the finite-field calculation and
not from any Bloch-group presentation, since the Bloch groups of those two fields are
exceptional.

**Hypotheses.** F is a finite field with q elements.

**Construction and proof.**

1. Import Quillen's calculation from KTheoryFiniteLocalFields L.1 in the case j = 2, which gives
   the odd K-group in degree three as the cyclic group of order q squared minus one.
1. Record that the import is valid for every q, including the two exceptional small fields,
   because L.1 states it for every finite field.
1. Check consistency with V.2: Milnor K_3 of a finite field vanishes, so the indecomposable
   quotient is the whole group.
1. Record the prohibition the roadmap states: the two small cases must not be deduced from the
   Suslin sequence, whose Bloch-group input is exceptional there.

**Acceptance.**

- For q = 2 the group is cyclic of order three and for q = 3 it is cyclic of order eight; both
  come from the import, not from a Bloch-group count.
- For q = 4 the group is cyclic of order fifteen, which together with the enhanced roots of
  unity of order three gives the Bloch group of order five recorded in V.3.
- The group is cyclic; a wrong deduction through a presentation excluding small fields would
  leave the two exceptional cases unproved.

**Depends on.** **inside this roadmap** `k3-indecomposable`; **other roadmaps** `KTheoryFiniteLocalFields:L.1`; **baseline** `mathlib:FiniteField.card`, `mathlib:ZMod`.

**Source.** Kbook.2013, VI.1.5 and VI.1.4 (PDF p. 474): “the odd K-group K_{2i-1}(F_q) = Z/(q^i - 1).” — The case i = 2 is the statement of this node; KTheoryFiniteLocalFields L.1 owns the general calculation.

### `finite-field-transfer` — Restriction and transfer in degree three for finite fields

*lemma*

For a finite extension of finite fields of degree d, the restriction on K_3 is the inclusion of
the cyclic group of order q squared minus one into the cyclic group of order q to the power 2d
minus one, and the transfer composed with the restriction is multiplication by d. Both maps are
computed in the imported finite-field model, and the formulas do not depend on choosing a
generator of the cyclic group.

**Hypotheses.** The extension is of finite fields, of degree d.

**Construction and proof.**

1. Import the restriction and transfer maps of KTheoryFiniteLocalFields L.1 and their formulas
   in the functorial model.
1. Specialise to degree three and record both composites.
1. Check that no choice of cyclic generator enters: the statement is about the maps, not about
   chosen isomorphisms with a cyclic group.
1. Record the divisibility that makes the inclusion well defined: q squared minus one divides q
   to the power 2d minus one.

**Acceptance.**

- The composite of transfer after restriction is multiplication by d.
- For d = 1 both maps are the identity.
- The formulas are stated without choosing a generator, which is the acceptance test the
  imported layer asks for.

**Depends on.** **inside this roadmap** `k3-finite-field`; **other roadmaps** `KTheoryFiniteLocalFields:L.1`.

**Source.** Kbook.2013, VI.1.5 (PDF p. 474): “K_{2i-1}(F_q) = Z/(q^i - 1)” — The transfer formulas belong to the same finite-field model, which L.1 constructs.

### `bloch-group-finite-field` — The Bloch group of a finite field ★

*theorem* · planet **Bloch group of a finite field**

For a finite field with q > 3 elements the Bloch group is cyclic, of order (q + 1)/2 when q is
odd and of order q + 1 when q is even. The two excluded fields are the exceptions recorded in
V.3.

**Hypotheses.** F is a finite field with q > 3 elements.

**Construction and proof.**

1. Apply Suslin's exact sequence, which is available because the field has at least four
   elements.
1. Substitute the value of the indecomposable K_3, which is the whole of K_3 since Milnor K_3
   vanishes, namely the cyclic group of order q squared minus one.
1. Substitute the enhanced roots of unity: the units form a cyclic group of order q minus one,
   so in odd characteristic the enhancement has order twice that, and in even characteristic it
   has order q minus one.
1. Divide, using that all groups involved are cyclic, to obtain the two displayed orders.
1. Record the consistency check against the exceptional cases: the formula is not applied to the
   two small fields.

**Acceptance.**

- For q = 4 the group is cyclic of order five and for q = 5 it is cyclic of order three, as
  recorded in V.3.
- For q = 2 and q = 3 the formula is not applied; the values there are the exceptional ones.
- The parity split is essential: using the odd formula in even characteristic halves the order
  incorrectly.

**Depends on.** **inside this roadmap** `k3-finite-field`, `suslin-exact-sequence`, `enhanced-mu`, `small-field-conventions`.

**Source.** Kbook.2013, VI.5.1.1 (PDF p. 495): “Theorem 5.2 below implies that if q > 3 is odd then B(F_q) is cyclic of order (q + 1)/2, while if q > 3 is even then B(F_q) is cyclic of order q + 1.” — The statement as displayed, with the derivation from the exact sequence indicated there.

### `k3-Z-and-Q` — K_3 of the integers and of the rational numbers ★

*theorem* · planet **K3 of the integers is Z/48**

K_3 of the integers and K_3 of the rational numbers are both cyclic of order forty-eight, and
the map between them induced by the inclusion is an isomorphism. The group structures are
imported from ArithmeticKTheory; what is recorded here is the route through the homological
model of V.1, which is how Lee and Szczarba computed the first group, and the consequence that
the e-invariant to the cyclic group of order twenty-four is not injective.

**Hypotheses.** No hypotheses beyond the two rings named.

**Construction and proof.**

1. Import the group structures from ArithmeticKTheory N.8, which owns the first four K-groups of
   the integers, and from N.5 for the comparison of the S-integers with the field.
1. Record that the historical computation used a variant of the identification of K_3 with the
   third homology of the Steinberg group, which is the model built in V.1; this is why V.1 is a
   prerequisite of this node rather than a parallel development.
1. Deduce that the e-invariant to the cyclic group of order twenty-four cannot be injective,
   since the source has order forty-eight.
1. Record the nonzero symbol with three entries equal to minus one, which is the decomposable
   class tracked in the next node.

**Acceptance.**

- The order is forty-eight, not twenty-four: the extension by the decomposable class of order
  two is nontrivial.
- The comparison between the integers and the rational numbers is an isomorphism, which is the
  localisation statement.
- The e-invariant is not injective, which is the acceptance test that detects a wrong extension
  class.

**Depends on.** **inside this roadmap** `k3-h3-steinberg`, `k3-indecomposable`; **other roadmaps** `ArithmeticKTheory:N.8`, `ArithmeticKTheory:N.5`.

**Source.** Kbook.2013, VI.2.1.2 and VI.2.1.3 (PDF p. 478): “In [LSz], Lee and Szczarba used a variant of the formula K_3(R) = H_3(St(R); Z) (Ex. IV.1.9) to show that K_3(Z) = K_3(Q) = Z/48. It follows that the e-invariant K_3(Q) -> Z/24 cannot be an injection.” — The statement and the route, as displayed.

### `k3-Q-splitting` — The decomposable and indecomposable parts for the rational numbers, and the Bloch group

*comparison*

For the rational numbers, Milnor K_3 is cyclic of order two generated by the symbol with three
entries equal to minus one, the indecomposable quotient is cyclic of order twenty-four, the
enhanced roots of unity form a cyclic group of order four, and the Bloch group is cyclic of
order six, generated by the class of the sum of the symbols at two and at minus one, which has
order exactly six there and also in the real numbers.

**Hypotheses.** The field is the rational numbers.

**Construction and proof.**

1. Substitute the three imported values into the short exact sequence of V.2 and into Suslin's
   exact sequence.
1. Compute: the order forty-eight of K_3 divided by the order two of Milnor K_3 gives the order
   twenty-four of the indecomposable quotient, and dividing by the order four of the enhanced
   roots of unity gives the order six of the Bloch group.
1. Identify the generator: the element c equal to the sum of the symbols at two and at minus one
   has order six, by the bound of V.3 and the analytic detection recorded in the source.
1. Record that the analytic detection uses the Rogers function built from the Bloch-Wigner
   function, so it depends on the analytic nodes and hence on Polylogarithms P.1.

**Acceptance.**

- The four orders are two, twenty-four, four and six, and they are consistent with both exact
  sequences.
- The element c has order exactly six, not dividing six: the lower bound is the part that needs
  the analytic input.
- The same element has order six in the real numbers, so the order is not an artefact of the
  rational field.

**Depends on.** **inside this roadmap** `k3-Z-and-Q`, `suslin-exact-sequence`, `angle-bracket-homomorphism`, `milnor-k3-number-field`, `bloch-wigner-five-term`.

**Source.** Kbook.2013, VI.5.2.1 (PDF p. 496): “In fact, B(Q) = Z/6. This follows from Theorem 5.2 and the calculations that K_3(Q) = Z/48, K_3^M(Q) = Z/2 and the enhanced roots of unity of Q form Z/4. In fact, the element c = [2] + [-1] has order exactly 6 in both B(Q) and B(R).” — The four values and the generator, as displayed.

### `k3-number-field` — K_3 of a number field ★

*theorem* · planet **K3 of a number field**

Let F be a number field with r_1 real and r_2 complex embeddings and let w be the second Adams-
Bott invariant of F. Then the indecomposable K_3 is the direct sum of a free group of rank r_2
and a cyclic group of order w. If F is totally imaginary then K_3 itself is that group; if F has
at least one real embedding then K_3 is the direct sum of a free group of rank r_2, a cyclic
group of order twice w, and an elementary abelian two-group of rank r_1 minus one.

**Hypotheses.** F is a number field; w is the second Adams-Bott invariant.

**Construction and proof.**

1. Import the structure theorem from ArithmeticKTheory N.5, whose degree-three row is the case n
   = 3.
1. Import from V.2 that Milnor K_3 is elementary abelian of rank r_1, so that the totally
   imaginary case has no decomposable part.
1. For the real case, use the short exact sequence of V.2 together with the nonvanishing of the
   symbol with three entries equal to minus one, which is inherited from the rational numbers,
   to see that the extension is nontrivial.
1. Record that the decomposition is an abstract isomorphism, not a natural splitting, and that
   no canonical generator of the free part is asserted.

**Acceptance.**

- For the rational numbers the second case gives the cyclic group of order forty-eight.
- For an imaginary quadratic field the first case gives a free group of rank one and a cyclic
  torsion group.
- The extension in the real case is nontrivial, which is what distinguishes the two rows.

**Depends on.** **inside this roadmap** `milnor-k3-injective`, `k3-rank-borel`, `k3-Z-and-Q`; **other roadmaps** `ArithmeticKTheory:N.5`.

**Source.** Kbook.2013, VI.5.3 (PDF p. 496): “Corollary 5.3. Let F be a number field, with r_1 real embeddings and r_2 complex embeddings, and set w = w_2(F). Then K_3^ind(F) = Z^{r_2} + Z/w, and: (a) If F is totally imaginary then K_3(F) = Z^{r_2} + Z/w; (b) If F has r_1 > 0 embeddings into R then K_3(F) = Z^{r_2} + Z/(2w) + (Z/2)^{r_1-1}.” — The corollary as displayed.

### `k3-gaussian` — K_3 of the Gaussian rationals ★

*theorem* · planet **K3 of the Gaussian rationals**

K_3 of the field obtained by adjoining a square root of minus one to the rational numbers is the
direct sum of a free group of rank one and a cyclic group of order twenty-four. The free summand
is the assertion that a basis exists; no canonical generator is asserted, and none is available
from the proof.

**Hypotheses.** The field is the rational numbers with a square root of minus one adjoined.

**Construction and proof.**

1. Import the value from ArithmeticKTheory N.8, which owns this certified example.
1. Check it against the number-field theorem: the field is totally imaginary with r_2 equal to
   one, and the second Adams-Bott invariant is twenty-four, so the first case applies.
1. Record that Milnor K_3 vanishes here, so K_3 and its indecomposable quotient agree.
1. State the caveat about the free summand explicitly.

**Acceptance.**

- The torsion order is twenty-four and the rank is one.
- Milnor K_3 vanishes, so there is no decomposable class to track, unlike the rational numbers.
- No canonical generator of the free part is produced; a definition that names one is asserting
  more than the proof gives.

**Depends on.** **inside this roadmap** `k3-number-field`, `milnor-k3-number-field`; **other roadmaps** `ArithmeticKTheory:N.8`.

**Source.** Kbook.2013, VI.5.3 (PDF p. 496): “(a) If F is totally imaginary then K_3(F) = Z^{r_2} + Z/w” — The Gaussian field is the case r_2 = 1 with the invariant equal to 24; ArithmeticKTheory N.8 owns the certified example.

## V.6 — Explicit elements and certificates

What a downstream layer is handed. A Bloch element is built from a finite combination of field
elements **together with a proof that its boundary vanishes**; a relation is proved by a five-
term certificate, a finite list of admissible pairs with integer coefficients, whose validity is
decidable and whose completeness is pure existence with no length bound — stated as such. A
certificate transports to a bar 3-cycle through V.4 and V.1, which is what makes an integral
comparison computable. The root-of-unity node answers the roadmap's acceptance test: `[ζ]` is
not automatically in the Bloch group, and the admissible substitutes are a multiple, a quotient
class or a localised class. Three comparisons are exported — rational, integral, finite-
coefficient — and each names which consumer uses it.

### `five-term-certificate` — A five-term certificate ★

*definition* · planet **Five-term certificate**

Define a five-term certificate for a relation in the pre-Bloch group to be a finite list of
pairs consisting of an integer coefficient and an admissible pair of field elements, together
with the claim that the corresponding integer combination of five-term elements, plus an integer
multiple of the symbol [1], equals a given element of the free abelian group on the nonzero
elements of F. The certificate is the data; its validity is a decidable check on the free
abelian group.

**Hypotheses.** F is a field. Each pair in the list is admissible for the five-term relation.

**Construction and proof.**

1. Define the data type: a finitely supported function from admissible pairs to the integers,
   together with an integer coefficient for the symbol [1].
1. Define the evaluation of a certificate as the corresponding element of the free abelian
   group.
1. Define validity of a certificate for a given element as equality of the evaluation with that
   element.
1. Prove that validity is decidable when equality in F is decidable, since both sides are finite
   combinations.
1. Define composition and inversion of certificates, so that certificates form a groupoid-like
   structure under addition.

**API.**

| name | role | statement |
| --- | --- | --- |
| `FiveTermCertificate` | data | The type of certificates over a field. |
| `FiveTermCertificate.eval` | constructor | The element of the free abelian group a certificate evaluates to. |
| `FiveTermCertificate.Valid` | characterisation | Validity of a certificate for a given element. |
| `FiveTermCertificate.add` | structure | Addition of certificates, valid for the sum. |
| `FiveTermCertificate.decidable` | instance | Validity is decidable over a field with decidable equality. |

**Used by.** *V.6's soundness theorem*: a valid certificate is exactly what proves an equality in the pre-Bloch group. *V.6's transport to bar cycles*: the certificate is the input from which a bar cycle is produced. *HabiroNumberFields and PadicHodgeRegulators*: a regulator may be applied to a class only once its defining relation is certified.

**Unit tests.**

- `empty_certificate` — The empty certificate evaluates to zero.
- `single_relation` — The certificate with one admissible pair and coefficient one evaluates to
  that five-term element.
- `additivity` — Evaluation is additive in the certificate.
- `not_a_proof_of_nonmembership` — Failure to find a certificate does not certify that an
  element is outside the subgroup: a non-example that keeps the format honest.

**Acceptance.**

- The empty certificate is valid exactly for the zero element.
- A certificate for a relation remains valid after adding a certificate for another relation.
- Validity is not the same as membership in the five-term subgroup: a certificate proves
  membership, and the absence of a certificate proves nothing.

**Depends on.** **inside this roadmap** `five-term-relation`; **baseline** `mathlib:Finsupp`, `mathlib:FreeAbelianGroup`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “with relations [1] = 0 and [the five-term relation]” — A certificate is a witness that an element lies in the subgroup generated by exactly these relations.

### `bloch-element-constructor` — Constructing a Bloch element from field data ★

*construction* · planet **Bloch element constructor**

Construct an element of B(F) from a finite list of pairs consisting of an integer coefficient
and a nonzero element of F, together with a proof that the corresponding boundary vanishes in
the antisymmetric tensor quotient. The construction refuses input whose boundary has not been
proved to vanish; it does not silently project into a quotient where the boundary happens to
die.

**Hypotheses.** F is a field. The input is a finitely supported integer combination of nonzero elements of F.

**Construction and proof.**

1. Form the element of the free abelian group and its class in P(F).
1. Compute the boundary of the class as the corresponding combination of wedge terms, using the
   formula of V.3.
1. Require a proof that this combination vanishes in the antisymmetric quotient, and produce the
   element of B(F) from it.
1. Prove that two inputs with the same class in P(F) produce the same element, and give the
   extensionality lemma.
1. Provide the variant that takes a five-term certificate for the difference of two inputs and
   concludes that they produce the same element.

**API.**

| name | role | statement |
| --- | --- | --- |
| `ofData` | constructor | From a finite combination and a proof of vanishing boundary, an element of B(F). |
| `ofData_coe` | projection | Its image in P(F) is the class of the combination. |
| `ofData_ext` | extensionality | Two combinations with equal classes in P(F) give equal elements. |
| `ofData_certificate` | characterisation | A five-term certificate for the difference of two combinations proves that they give equal elements. |
| `ofData_map` | functoriality | A field homomorphism carries the construction to the construction over the image field. |

**Used by.** *V.5's generator of the Bloch group of the rational numbers*: the element c is produced by this constructor. *Polylogarithms P.2*: the real regulator is evaluated on elements produced this way. *HabiroNumberFields HB.1*: the finite Chern comparison is applied to elements with certified relations.

**Unit tests.**

- `constructs_c` — The two-term input at x and one minus x is accepted and gives c.
- `rejects_bad_boundary` — The one-term input at a generic x is rejected, since its boundary is
  nonzero.
- `certificate_equality` — Two inputs differing by a five-term element give the same element.
- `not_projected` — The construction does not pass to the exterior square to make a boundary
  vanish, which a wrong implementation might do.

**Acceptance.**

- The element c is produced from the two-term input at x and one minus x, whose boundary
  vanishes.
- An input whose boundary does not vanish is rejected; this is the acceptance test the roadmap
  asks for.
- The class of the single symbol at a root of unity is not accepted without further data, which
  is the subject of the next node.

**Depends on.** **inside this roadmap** `bloch-group`, `bloch-boundary`, `five-term-certificate`; **baseline** `mathlib:Finsupp`.

**Source.** Kbook.2013, VI.5.1 and VI.5.4 (PDF pp. 495-496): “and Bloch's group B(F) is defined to be its kernel. ... c = [x] + [1 - x] is independent of the choice of x” — The constructor produces exactly the elements of the kernel; the element c is the worked example.

### `certificate-soundness` — Soundness and relative completeness of certificates

*theorem*

A valid five-term certificate for the difference of two finite combinations proves that they
have the same class in P(F). Conversely, if two combinations have the same class in P(F), then
some valid certificate for their difference exists. Existence is not effective: no bound on the
length of the certificate is claimed.

**Hypotheses.** F is a field.

**Construction and proof.**

1. Soundness: the evaluation of a certificate lies in the five-term subgroup by construction, so
   the classes agree.
1. Completeness: equality of classes means the difference lies in the five-term subgroup, and
   every element of a subgroup generated by a set is a finite integer combination of its
   generators, which is exactly a certificate.
1. Record the honest limitation: the completeness statement is pure existence, with no length
   bound and no search procedure, and this is stated rather than hidden.

**Acceptance.**

- Soundness is checked on the certificate for the independence of c from its parameter.
- Completeness is used only to justify the format, never to produce a certificate.
- No complexity claim is made; a claimed bound would be an unproved addition.

**Depends on.** **inside this roadmap** `five-term-certificate`, `pre-bloch-group`.

**Source.** Kbook.2013, VI.5.1 (PDF p. 495): “let P(F) denote the abelian group presented with generators symbols [x]” — Soundness and completeness are the two halves of what it means to present a group by generators and relations.

### `certificate-to-bar-cycle` — From a certificate to a bar cycle

*comparison*

Transport a five-term certificate for an element of B(F) to a bar 3-cycle of the stable
Steinberg group representing the corresponding class of K_3(F), through the configuration
complex and the map psi of V.4 and the homological model of V.1. The transport is what makes an
integral comparison computable on explicit elements, rather than only up to the maps of the
exact sequence.

**Hypotheses.** F is an infinite field, or a finite field with more than three elements where the corresponding statements of V.4 apply.

**Construction and proof.**

1. Realise each five-term instance of the certificate as the boundary of the corresponding four-
   simplex of the configuration complex, by the computation of V.4.
1. Assemble the certificate into a chain whose image under the coinvariant map is the given
   combination.
1. Lift through the hyperhomology spectral sequence to a class in the third homology of the
   general linear group, which is possible exactly because psi is surjective onto B(F).
1. Transport to the third homology of the Steinberg group and then to K_3(F) through the
   homological model of V.1 and the comparison lemma of V.4.
1. Record that the lift is not unique: two lifts differ by the kernel of psi, which is the image
   of the monomial subgroup.

**Acceptance.**

- A certificate for the zero element transports to a boundary.
- The transport of the certificate for c gives a class of order dividing six in K_3(F).
- The lift is not canonical, and the comparison states this rather than choosing one.

**Depends on.** **inside this roadmap** `five-term-certificate`, `coinvariants-p1-homology`, `psi-gl3`, `bar-cycle-model`, `suslin-functoriality`.

**Source.** Kbook.2013, VI.5.6 and VI.5.12 (PDF pp. 498, 502): “Thus the cokernel H_3(C_G) of d from C_4 tensor_G Z to C_3 tensor_G Z is P(F). ... Proposition 5.12. The image of psi is B(F)” — The two facts that make the transport possible.

### `root-of-unity-symbol` — When a root-of-unity symbol is a Bloch element ★

*theorem* · planet **Validity of a root-of-unity symbol**

For a root of unity z in F the symbol [z] need not lie in B(F): its boundary is z wedge (1 - z),
which vanishes only under conditions on z. Determine exactly when the symbol lies in the Bloch
group, and otherwise produce the admissible substitutes: an integer multiple whose boundary
vanishes, the class in a quotient where it does, or the class after inverting the relevant
primes. A regulator may be applied only after one of these has been produced.

**Hypotheses.** F is a field; z is a root of unity of F, different from 0 and 1.

**Construction and proof.**

1. Compute the boundary of the symbol at z and characterise its vanishing in the antisymmetric
   quotient in terms of z and one minus z.
1. Give the two easy cases: if z is a sixth root of unity in a field where one minus z is a unit
   power of z the boundary may vanish, and in general it does not.
1. Produce the multiple: the order of the boundary in the antisymmetric quotient is finite when
   the units involved generate a finite group, and the corresponding multiple of the symbol lies
   in B(F).
1. Produce the quotient class and the localised class as the other two admissible substitutes,
   each with the statement of what it does and does not prove.
1. Record the consequence for the consumers: the p-adic and finite regulators of the downstream
   layers distinguish these substitutes, while the real regulator does not.

**Acceptance.**

- For a primitive sixth root of unity in a suitable field the symbol lies in the Bloch group,
  while for a primitive fourth root it need not.
- The multiple that works is computed, not asserted.
- Applying a regulator to a symbol whose boundary has not been shown to vanish is rejected by
  the constructor of V.6, which is the acceptance test.

**Depends on.** **inside this roadmap** `bloch-element-constructor`, `bloch-boundary`, `antisym-exterior-comparison`, `angle-bracket-homomorphism`.

**Source.** Kbook.2013, VI.5.2.1 (PDF p. 496): “In fact, the element c = [2] + [-1] has order exactly 6 in both B(Q) and B(R).” — The worked example of an explicit element of the Bloch group, whose second term is a root of unity but which is admitted only as part of the combination c.

### `comparison-rational` — The rational comparison

*comparison*

After tensoring with the rational numbers, Suslin's sequence gives an isomorphism between the
indecomposable K_3 and the Bloch group, for every field with at least four elements. Every
convention of V.3 gives the same rational answer, so nothing in this comparison distinguishes
them.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Tensor Suslin's sequence with the rational numbers; the left-hand term is torsion, so it
   dies.
1. Conclude the isomorphism, natural in F.
1. Record what is lost: by the comparison of V.3, the conventions differ by groups of exponent
   two and by the three-torsion carried by c, all of which are invisible here.
1. State the prohibition: an agreement of two models rationally is not evidence for an integral
   comparison.

**Acceptance.**

- For a finite field both sides vanish rationally, so the comparison is vacuous there.
- For a number field both sides have dimension r_2.
- The comparison cannot detect the difference between the two Bloch-group conventions.

**Depends on.** **inside this roadmap** `suslin-exact-sequence`, `rationalisation-loss`, `cgz-convention-comparison`.

**Source.** Kbook.2013, VI.5.2 (PDF p. 495): “Theorem 5.2. (Suslin) For any field F with |F| >= 4, there is an exact sequence 0 -> the enhanced roots of unity -> K_3^ind(F) -> B(F) -> 0.” — Rationalising the displayed sequence is the content of this comparison.

### `comparison-integral` — The integral comparison, with torsion retained

*comparison*

Integrally, Suslin's sequence is a nonsplit extension in general, and the identification of the
indecomposable K_3 with the Bloch group is false: the two differ by the enhanced roots of unity.
Export the sequence together with the two conventions of V.3 and their exponent-two comparison,
so that a consumer that needs an integral statement knows which group it is using and what the
discrepancy is.

**Hypotheses.** F is a field with at least four elements.

**Construction and proof.**

1. Export the sequence of V.4 with its left-hand term named and its enhancement recorded.
1. Export the convention comparison of V.3, with the exponent-two kernel.
1. State the two prohibitions the roadmap requires: the enhanced term is not the ordinary Tor
   group, and the Bloch group is not a substitute for the indecomposable K_3 integrally.
1. Record the worked example for the rational numbers, where the orders four, twenty-four and
   six make the extension visible.

**Acceptance.**

- For the rational numbers the extension of the cyclic group of order six by the cyclic group of
  order four is nonsplit, since the middle group is cyclic of order twenty-four.
- For a field of characteristic two the left-hand term is the ordinary roots of unity, so the
  distinction disappears; the export says so.
- A consumer that takes the Bloch group for the indecomposable K_3 gets the wrong torsion, which
  is what this comparison prevents.

**Depends on.** **inside this roadmap** `suslin-exact-sequence`, `tor-form-comparison`, `cgz-convention-comparison`, `k3-Q-splitting`.

**Source.** Kbook.2013, VI.5.2 and VI.5.2.1 (PDF pp. 495-496): “0 -> the enhanced roots of unity -> K_3^ind(F) -> B(F) -> 0 ... In fact, B(Q) = Z/6.” — The sequence and the worked example that exhibits the nonsplit extension.

### `comparison-finite-coefficients` — The finite-coefficient comparisons

*comparison*

With coefficients in the integers modulo n, the comparison between the indecomposable K_3 and
the Bloch group holds under hypotheses on n: for odd n the two conventions of V.3 agree and the
comparison is induced by the integral sequence, while for even n the exponent-two discrepancy
and the enhanced roots of unity both intervene. State the hypotheses rather than transporting
the odd case to the general one.

**Hypotheses.** F is a field with at least four elements; n is a positive integer.

**Construction and proof.**

1. Reduce the integral sequence modulo n and record the resulting six-term sequence, keeping the
   torsion terms.
1. For odd n use the exponent-two comparison of V.3 to identify the two conventions, and record
   that the Calegari-Garoufalidis-Zagier argument uses exactly this case.
1. For even n keep both discrepancies explicit and state that no identification is asserted.
1. Record the consumer statement: the finite Chern comparison of HabiroNumberFields and the
   p-adic regulator of PadicHodgeRegulators consume this comparison, not the rational one.

**Acceptance.**

- For odd n the two conventions give the same group modulo n.
- For n a power of two the comparison is not an isomorphism in general.
- The odd-n statement is not extended to general n by tensoring, which would be the error this
  node prevents.

**Depends on.** **inside this roadmap** `comparison-integral`, `cgz-convention-comparison`, `enhanced-mu`.

**Source.** CGZ.2018, 2.5 The 5-term relation, Theorem 2.11 and its proof, p. 14: “when n is odd, the groups B(F)/nB(F) and B(F; Z/nZ) coincide with Suslin's Bloch group modulo n and the corresponding group with coefficients respectively by Lemma 2.2.” — The odd-coefficient identification, stated in the source with its hypothesis.

### `regulator-agreement` — Agreement of the regulators with the abstract K-theory regulators

*comparison*

Export the statement that the real regulator built from the Bloch-Wigner function and the p-adic
regulator built from the p-adic dilogarithm agree, under the comparisons above, with the
abstract regulators on K_3. The analytic constructions and the comparison proofs belong to
Polylogarithms P.2 and PadicHodgeRegulators D.2 respectively; what this layer supplies is the
integral model through which they are compared, and the statement of which comparison each one
uses.

**Hypotheses.** F is a number field; the regulators are the ones constructed by the consuming layers.

**Construction and proof.**

1. State the real case: the Bloch-Wigner function descends through the Bloch group of V.3, and
   the resulting map is identified with the Borel class by Polylogarithms P.2. Record that this
   identification includes a sign and a scalar, and that it cannot distinguish two integral
   conventions.
1. State the p-adic case: the syntomic regulator in degree three is compared with the p-adic
   dilogarithm on the Bloch-group model by PadicHodgeRegulators D.2, and that comparison is
   sensitive to the finite-coefficient statement.
1. Record which comparison each consumer uses: the real one uses the rational comparison, the
   p-adic and finite ones use the finite-coefficient comparison.
1. Record what this layer does not prove: neither analytic comparison is proved here, and no
   numerical evaluation is asserted.

**Acceptance.**

- The real regulator kills torsion, so it agrees with the abstract regulator only after the
  rational comparison.
- The p-adic comparison is stated with its coefficient hypotheses.
- No claim is made that either regulator is nonzero on a specific element; that is a separate
  assertion of the consuming layers.

**Depends on.** **inside this roadmap** `comparison-rational`, `comparison-finite-coefficients`, `bloch-wigner-five-term`; **other roadmaps** `Polylogarithms:P.2`, `PadicHodgeRegulators:D.3`.

**Source.** Kbook.2013, VI.5.2.1 (PDF p. 496): “This may be proven using the Rogers L-function, which is built from the dilogarithm function.” — The only use the K-book makes of the analytic regulator; the comparison theorems belong to the consuming layers.

## Requests to other roadmaps

- `KTheoryFiniteLocalFields:L.1` — The finite-field calculation in the case j = 2, namely that
  K_3 of a finite field with q elements is cyclic of order q squared minus one, for every q
  including 2 and 3, together with the restriction and transfer maps in degree three and their
  formulas in the functorial model, stated without choosing a cyclic generator. V.5 specialises
  this and must not reprove it.
- `ArithmeticKTheory:N.8` — The certified examples this layer consumes: the first four K-groups
  of the integers, in particular that K_3 of the integers is cyclic of order forty-eight, and
  that K_3 of the Gaussian rationals is the direct sum of a free group of rank one and a cyclic
  group of order twenty-four, with the free summand stated as the existence of a basis.
- `ArithmeticKTheory:N.5` — The degree-three row of the odd-group structure theorem, for a
  number field and for its rings of S-integers, in the two cases totally imaginary and with a
  real embedding, with the extension data rather than only the abstract group.
- `Polylogarithms:P.1` — The dilogarithm with its cut domain and branch conventions, the Bloch-
  Wigner function and the five-term identity it satisfies. This layer's two reserved analytic
  nodes state the descent of that function to the pre-Bloch group and should, by the restructure
  proposal below, be moved to P.1 and imported from there.
- `Polylogarithms:P.2` — The identification of the descended Bloch-Wigner map with the Borel
  class, with its sign and scalar, and the certified numerical evaluation. V.6 exports the
  integral model this comparison runs through and states which comparison the real regulator
  uses.
- `PadicHodgeRegulators:D.3` — The comparison of the syntomic regulator in degree three with the
  p-adic dilogarithm on the Bloch-group model, with the coefficient hypotheses under which it
  holds, so that V.6's finite-coefficient comparison has a consumer with stated hypotheses.
- `K2SymbolsBrauer:T.1` — The stable Steinberg group, the surjection onto the stable elementary
  group, the centrality of its kernel and the universal-central-extension property, all in the
  stable range. V.1 imports these and proves only superperfection and the homotopy-theoretic
  consequences.
- `StableHomotopyKTheory:H.3` — The plus construction with its universal property, functoriality
  and relative form, and, if that roadmap takes ownership of homological stability, Suslin's
  stability theorem for the general linear groups of an infinite field, whose degree-three case
  V.4 uses.
- `K2SymbolsBrauer:T.2` — Milnor K-theory as the tensor algebra of the units modulo the
  homogeneous Steinberg ideal, in all degrees, together with the graded map to Quillen K-theory
  whose degree-three component V.2 uses, and Matsumoto's presentation of K_2 of a field, which
  V.3 needs to identify the cokernel of the Bloch boundary.
- `GeneralAlgebraicKTheory:K.2` — The K-theory space and its plus-construction model, and the
  low-degree comparison layer that assembles the explicit K_1, K_2 and K_3 models. The K_3 model
  is exported by V.1 of this roadmap and consumed there, so the two must not both construct it.
- `MotivicEtaleKTheory:M.7` — The degree-three arithmetic descriptions in the comparison range,
  which V.2 uses for the injectivity of Milnor K_3 into Quillen K_3 and V.4 for the etale Chern
  class step in the detection of the enhanced summand.
- `BorelRegulators:R.3` — Borel's rank theorem in the case n = 3, where the period-four pattern
  gives the rank r_2 that V.2 records for K_3 of a number field.

## Gaps

**Suslin's original paper was not obtained.** Every statement of V.4 is read in Weibel's K-book, which reproduces Suslin's proof and cites the
original at 2.1, 2.4, 3.3, 3.4, 4.3, 5.2, 5.4 and pages 219 to 223. The original, K_3 of a field
and the Bloch group, Proceedings of the Steklov Institute 183 (1991), is not freely available
and was not read. Three steps are used as the K-book states them without further detail: the
vanishing of the two-primary part of the third homology of the symmetric group on six letters in
the Bloch group, the statement that two of the three Kunneth summands of the relative monomial
term land in the image of the diagonal subgroup for large n, and the identification of the
kernel of psi in rank two with the image of the monomial subgroup. A continuation that obtains
the original should check these three.

**The homological stability input is imported, not proved.** The lemma recording Suslin's stability theorem and the identification of the top quotient with
Milnor K-theory is stated with its source but is not decomposed into nodes here. It belongs
either to StableHomotopyKTheory or to GeneralAlgebraicKTheory; no stage of either currently
states it, so it is recorded as a request rather than planned here. Only the degree-three case
is used.

**The e-invariant detection step is stated at the level of its source.** The proof that the enhanced summand injects into the indecomposable K_3 for an algebraically
closed field runs through etale Chern classes, the Bockstein isomorphism and a compatibility
that the K-book takes from its own Chapter V. Those inputs are cited to MotivicEtaleKTheory M.7
and ArithmeticKTheory N.5 rather than decomposed, so the node states the argument and names its
inputs without closing them.

**No numerical evaluation of the analytic function is planned.** The order of c in the Bloch group of the rational numbers is six, and the lower bound uses the
Rogers function built from the Bloch-Wigner function. The certified numerical evaluation with
truncation and tail bounds is planned by Polylogarithms P.2, not here, so this layer records the
dependence and does not assert a numerical value.

## Structure

**The two analytic nodes of V.3 belong to Polylogarithms P.1.** This job is required to deliver nodes with the reserved ids for the Bloch-Wigner function and
for the five-term identity it satisfies, under stage V.3. Both are delivered. The mathematics,
however, is planned by Polylogarithms P.1, whose stage text reads: For weight two define the
Bloch-Wigner dilogarithm D(z) = Im(Li_2(z)) + arg(1 - z) log|z| on a cut domain and prove that
the resulting single-valued function is independent of the presentation. Prove conjugation,
inversion, the five-term identity and the differential formula. The stage text of V.3 plans
nothing analytic: it plans the pre-Bloch group, the five-term relations, the antisymmetric
tensor quotient and the conventions comparison, and its only mention of the analytic side is the
warning not to erase 2- or 3-torsion merely because the real dilogarithm kills it. The reviewed
library audit agrees: it records no analytic target for V.3. The proposal is to move the two
nodes to Polylogarithms P.1, keeping their content, and to have V.3 cite them for its torsion
warning, which is what it needs them for. Until that is decided, the nodes here import the
dilogarithm, the branch conventions and the five-term identity from P.1 rather than rebuilding
them, and neither is marked as a planet of V.3. The same conflict is recorded on the job's issue
by an earlier worker and in the red-team finding it cites.

## Mistakes found in the sources

**K3BlochGroups/E1** (misprint, affects nothing) — The K-book, author-hosted draft of 29 August 2013, Theorem VI.5.7 (PDF p. 498). Printed: “Note: there was a typo in the published version.)”.

The parenthetical note is the author's own, flagging a typographical error in the published
Graduate Studies in Mathematics printing of the same theorem. A reader working from the
published book should take the statement in the form given in this draft: the first homology of
the group of invertible two by two matrices is the units of the field, the second homology is
the direct sum of the exterior square of the units and K_2 of the field, and the displayed
sequence from the third homology of the monomial subgroup through the third homology of the
general linear group onto the Bloch group is exact.

*Why.* The draft carries an unbalanced parenthesis and an explicit note that the published
version differs. The correction records which form this packet uses, since the two differ in a
statement every node of V.4 depends on. The published text was not obtained, so no claim is made
about what it prints.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups.json

reports 0 errors and 0 warnings against the pinned declaration index. The suggested Lean file was not compiled: no Lean toolchain at the pinned commits was available in this session, and the file is signatures and `example` statements only.
