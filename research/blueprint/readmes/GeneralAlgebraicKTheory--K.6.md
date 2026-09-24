# GeneralAlgebraicKTheory — K.6 and K.7

The blueprint for the nonconnective extension (K.6) and for invariance, products
and universal interfaces (K.7). This document is definitive; the packet
`research/blueprint/packets/GeneralAlgebraicKTheory--K.6.json` is its machine
form and the suggested Lean file is a naming proposal, not an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The sources

Two, both freely available:

> Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
> <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>,
> SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, accessed 2026-09-24.

> Marco Schlichting, *Negative K-theory of derived categories*. Author preprint dated 16 June 2003, 28 pages; the published version (Math. Z. 253, 2006) was not compared.
> <https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf>,
> SHA-256 `f59620e3ba25d5a8591a108d2b9647b68b5caf04794745862d2aa71e178b5aa6`, accessed 2026-09-24.

### The K-book: what was read

The file was already on disk from the K2SymbolsBrauer job of this session and was re-hashed; the hash reproduces the value recorded by the packets of K2SymbolsBrauer, Polylogarithms, MotivesAndAlgebraicCycles and ArithmeticKTheory, so this is the same file those cite.

- I.1.8 (PDF p. 5): the cone ring of a ring, as a direct sum ring.
- II.2.1.2 and II.2.1.3 (PDF p. 105): the behaviour of the zeroth K-group on a finite product of rings; Karoubi's flasque rings, the Eilenberg swindle and the infinite sum rings.
- II.2.7, II.2.7.1, II.2.7.2 and Remark 2.8 (PDF pp. 110 to 111): the Structure Theorem for Morita equivalence, the resulting isomorphism of zeroth K-groups, the matrix example, and the remark that Morita equivalence is coarser than isomorphism.
- II.7.4, II.7.4.1 and II.7.4.4 (PDF pp. 145 to 146): biexact functors and the induced bilinear pairing; the tensor product of projectives and the ring structure on the zeroth K-group; the Nil category and the module structure on its zeroth group.
- II.9.1.1, II.9.1.2, II.9.5.2 and II.9.6.1 (PDF pp. 158 to 163): categories with cofibrations, Waldhausen categories, biexact functors of Waldhausen categories and the pairing of spectra, and the invariance of K-theory under an exact equivalence of Waldhausen categories.
- III.1.1 and III.1.2 (PDF p. 190): the determinant and the map from the units of a commutative ring to the first K-group, an isomorphism for a commutative local ring.
- III.3.6 and III.3.7 (PDF pp. 207 to 208): the Fundamental Theorems for the first and the zeroth K-groups, with the four-term split exact sequence and the resulting decomposition of the zeroth K-group of the Laurent ring.
- III.4.1, III.4.1.1, III.4.3, III.4.4 and III.4.4.1 (PDF pp. 210 to 213): the negative K-groups by iterated cokernel; contracted functors, acyclicity and the natural splitting; Mayer-Vietoris for the negative groups; the four axioms for a theory of negative K-theory and Bass's groups as an example.
- IV.10.1 to IV.10.4 (PDF pp. 349 to 350): the functor LE and its desuspension with the natural cofibration sequence; the Fundamental Theorem identifying connective K-theory with the minus-one-connective cover; the iteration; and the nonconnective spectrum as the homotopy colimit.
- V.8, V.8.1, V.8.2 and V.8.3 (PDF pp. 430 to 431): the Fundamental Theorem in every degree with the splitting by the class of the variable, the identification of the Nil groups with the N-groups one degree up, the degenerate form for a regular noetherian ring, and the version for quasi-projective schemes.
- II.6.5 and I.3.7.1 (PDF pp. 132 and 24): the definition of a regular noetherian ring and the stability of regularity under localisation, used by the vanishing theorem.
- IV.6.3.5, IV.6.4 and IV, Definition 6.6 (PDF pp. 320 to 321), and the pairing of spectra (PDF p. 342): Morita invariance in every degree for K and for G; the behaviour of K_n on finite products and on filtered colimits of exact categories, with proofs; the definition of a biexact functor of exact categories and the map out of the Q-construction; and the ring- and module-spectrum structures with their hypotheses.

### Negative K-theory of derived categories: what was read

Downloaded and hashed on 24 September 2026; the hash reproduces the value recorded in the reviewed integrated decomposition data/decompositions/GeneralAlgebraicKTheory.json, so this is the same file the accepted review of 15 September 2026 checked.

- Introduction, pp. 1 to 3: the purpose, the summary of the results for an exact category, and the statement that no theory of negative K-groups for exact categories had been developed before.
- §1, pp. 4 to 6, complete with proofs: Definition 1.1, Facts 1.2, Set-up 1.3, Definition 1.4, the connecting map 1.5, Lemma 1.6, Theorem 1.7 with its proof, Corollary 1.8 and Remark 1.9.
- §2, pp. 6 to 8: c-compact objects, homotopy colimits, c-compactly generated categories, Lemma 2.6, Corollary 2.7 and the statements of Theorem 2.9 and Lemma 2.11.
- §3, pp. 8 to 9, complete: exact categories, the embedding in left exact functors, Frobenius categories, Definitions 3.4 and 3.5.
- §4, pp. 9 to 10, complete: countable envelopes 4.1, Lemma 4.2 with proof, Definition 4.3, Proposition 4.4 with proof, Remark 4.6, Definition 4.7 and Theorem 4.8.
- §5, pp. 11 to 13: 5.3, Definition 5.4, §5.5 with the localisation example, 5.8, Definition 5.9 and 5.10. The proofs of 5.6 and 5.7 were read only in sketch.
- §6, pp. 13 to 14, complete with proofs: Theorem 6.1, Corollary 6.2, Lemma 6.3 and Corollary 6.4.
- §7, pp. 14 to 15: Theorem 7.1 with its proof, Remarks 7.2 and 7.3.
- §8, pp. 15 to 16: Lemma 8.1 with proof, Corollary 8.2 with proof, and the explicit map of 8.3.
- §9, pp. 16 to 17: the proof of Theorem 9.3 through the nilpotent, polynomial and Laurent categories, Lemma 9.4, Examples 9.5 and 9.6, Conjecture 9.7 and Remark 9.8. Theorem 9.1 was read as a statement, its proof was not.
- §11, pp. 20 to 23: Definition 11.1, Remark 11.2, Lemma 11.3 with proof, Definition 11.4 with the square 11.5 and the structure map 11.6, Theorem 11.7 with proof, Theorem 11.10, §11.13 and 11.14, and the statements of Propositions 11.15 and 11.17.
- NOT read: §10, Appendix A, and the proofs of 2.9, 9.1, 11.10, 11.15 and 11.17.
- The scan's text layer damages ligatures and accents; every excerpt quoted in this packet was repaired character by character against the surrounding text, without changing a word, and the two places where the layer drops a clause are marked with square brackets.

## What the pinned libraries already have

The reviewed audit `AUDIT-28` records both layers as *not built*, and the
declaration index confirms each of its claims. What exists at the pins, and is
therefore cited rather than planned:

- `mathlib:CategoryTheory.Functor.IsEquivalence` (`Mathlib/CategoryTheory/Equivalence.lean`) — Equivalence of categories, the hypothesis of the invariance statements; the enhanced version K.7 needs is not pinned and the comparison node says so.
- `mathlib:CategoryTheory.Idempotents.Karoubi` (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean`) — The idempotent completion, which the stage text names as one of the three enlargements; it exists at the pin, so K.6 cites it rather than building it.
- `mathlib:CategoryTheory.Limits.HasFilteredColimits` (`Mathlib/CategoryTheory/Limits/Filtered.lean`) — Filtered colimits, pinned at the level of categories; the K-theoretic commutation statement is what K.7 adds.
- `mathlib:IsMoritaEquivalent` (`Mathlib/RingTheory/Morita/Basic.lean`) — The Morita equivalence predicate, pinned; K.7 supplies the K-theoretic consequence, which is absent.
- `mathlib:IsMoritaEquivalent.matrix` (`Mathlib/RingTheory/Morita/Matrix.lean`) — The instance that a ring is Morita equivalent to its matrix ring, pinned and cited by the invariance node.
- `mathlib:LaurentPolynomial` (`Mathlib/Algebra/Polynomial/Laurent.lean`) — The Laurent polynomial ring, the third term of that sequence and the ring whose K-theory the fundamental theorem decomposes.
- `mathlib:Matrix` (`Mathlib/LinearAlgebra/Matrix/Defs.lean`) — Matrices, out of which the cone ring and the infinite matrix ring of the flasque and axiom nodes are built.
- `mathlib:ModuleCat.matrixEquivalence` (`Mathlib/RingTheory/Morita/Matrix.lean`) — The equivalence between modules over a ring and modules over its matrix ring, which is the pinned form of the Morita instance K.7 cites.
- `mathlib:Polynomial` (`Mathlib/Algebra/Polynomial/Basic.lean`) — The polynomial ring in one variable, one of the two rings in the four-term sequence that defines the contraction.
- `mathlib:RingHom` (`Mathlib/Algebra/Ring/Hom/Defs.lean`) — Ring maps, the morphisms of the functors this layer defines.
- `mathlib:TensorProduct` (`Mathlib/LinearAlgebra/TensorProduct/Defs.lean`) — The tensor product, the biexact functor from which the external products of K.7 are built.
- `tauceti:TauCeti.ExactK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — The Grothendieck group of an exact category, the degree-zero model against which this layer's invariance statements are checked.
- `tauceti:TauCeti.ExactK0.mapEquiv` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — Invariance of that group under an exact equivalence, the pinned degree-zero shadow of the derived invariance K.7 states.
- `tauceti:TauCeti.SplitK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`) — The split model of the zeroth K-group, in which the pinned product statement is proved.
- `tauceti:TauCeti.SplitK0.of_mul_of` (`TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean`) — The pinned statement that the product of the classes of two objects is the class of their tensor product, the degree-zero unit test of K.7's product.

What does not exist at either pin, and is therefore this blueprint's own work:
spectra of any kind, homotopy colimits, connective covers, Karoubi's flasque
rings (the pinned `IsFlasque` of both trees is the sheaf-theoretic predicate and
is a different notion with the same name), the Eilenberg swindle, contracted
functors, the negative K-groups, the Nil groups, Frobenius categories and their
stable categories, Verdier quotients of triangulated categories, the K-theory of
a Waldhausen category, and the first K-group — which is absent from both trees,
so every statement of this blueprint in degree one is stated against a group that
has yet to be built.

## Relation to the reviewed decomposition

`data/decompositions/GeneralAlgebraicKTheory.json` carries an accepted
independent review of 15 September 2026 and has six nodes for these two layers.
Four of its node identifiers are kept here
(`schlichting-set-up-and-negative-localization`,
`frobenius-pairs-flasque-envelope-and-suspension`,
`nonconnective-spectrum-and-derived-invariance`,
`agreement-and-vanishing-of-negative-K`), each split where declaration
granularity asked for it: the definitions of a Frobenius pair, of the set-up and
of the negative groups are now their own nodes, and additivity with filtered
colimits is a fifth. Its two K.7 nodes are not kept as nodes — their content is
spread across the seven K.7 nodes here, at one statement per node — but every
locator they carry is reused, and this packet adds the K-book's Bass-side
development of K.6, which the decomposition does not have.

## Two duplications, read as boundaries

`AUDIT-28` records two duplications. Neither is an overlap to be removed:

- **`SchemeKTheoryOperations:S.5`** owns the Fundamental Theorem with Nil terms
  *for schemes*. The source states the ring form (V.8.2) and the scheme form
  (V.8.3) as separate theorems, and this packet proves the first and imports the
  second by name.
- **`SchemeKTheoryOperations:S.6`** owns the external products *for schemes* and
  the graded commutativity of the total K-group of a scheme. The ring-level
  construction from biexact functors is developed here and the scheme-level
  statement is imported.

Both are filed as requests, and the structural note asks that the two stage
texts each say so in a sentence.

## K.6 — Nonconnective extension

The layer builds the negative K-groups along both of the routes its stage text
names, and proves that they agree.

**The algebraic route** (eight nodes, from the K-book) is Bass's: the negative
groups are the iterated contraction of the zeroth K-group, the Fundamental
Theorem says that each K-group is a contracted functor, and the Bass delooping
turns that into a spectrum whose negative homotopy groups are those contractions.

**The homotopical route** (seven nodes, from Schlichting) is the flasque
enlargement, suspension and idempotent completion the stage text asks for by
name. It runs on Frobenius pairs rather than on rings; the countable envelope
is flasque in exactly Karoubi's sense, with the swindle in functorial form; the
suspension is the quotient of the enlargement by the original; and the negative
groups are the zeroth invariant of the iterated suspension. Its localisation
theorem holds in non-positive degrees for formal reasons, and in every degree
once the spectrum is built.

**They agree.** Schlichting's Theorem 7.1 identifies the groups of the second
route with Bass's, Pedersen's, Karoubi's, Pedersen–Weibel's and Thomason's. So
the independence-of-enlargement target of the stage text is met twice: by the
model-independence of the Bass construction, and by that agreement theorem.

**The trap the stage text names.** The connective model has no homotopy in
negative degrees, for any ring at all. That absence is a property of the model
and carries no information about the ring. Vanishing of the negative K-groups
of a *singular* ring may not be inferred from it; the vanishing theorem here is
for regular noetherian rings and is proved from the Fundamental Theorem.

Coverage: **source_decomposed**.

Fifteen nodes, covering both of the constructions the stage text asks for. The algebraic half: Karoubi’s flasque rings with the Eilenberg swindle, the infinite sum rings and the cone ring, stated with the explicit warning that the pinned IsFlasque of both libraries is the sheaf-theoretic predicate and that a formalisation must not reuse the name; Bass’s contracted functors, with the contraction LF defined as the cokernel of the map out of the two polynomial rings and with the splitting required natural in the variable as well as in the ring; the negative K-groups as the iterated contraction, with the four-term decomposition of the zeroth K-group of the Laurent ring; the Fundamental Theorem in every degree with the Nil terms identified as the N-groups one degree up; the four axioms a theory of negative K-theory must satisfy, with Bass’s groups as the example that makes them non-vacuous; Mayer–Vietoris in negative degrees; the Bass delooping, built as the homotopy colimit of the iterated desuspensions with each map the inclusion of a deeper connective cover; and the vanishing theorem for regular noetherian rings with the non-example the stage text names by hand. The homotopical half is the flasque enlargement, the suspension and the idempotent completion the stage text asks for by name, decomposed from Schlichting: Frobenius categories, Frobenius pairs and their derived categories, with the bounded complexes over an exact category as the standing example; the countable envelope with the swindle in functorial form (Lemma 4.2), the enlargement functor F, the c-compact generation that identifies the idempotent completion of the derived category with the c-compact part of the enlargement, and the suspension S, together with the verification (Theorem 4.8) that the three axioms of the set-up hold; the axiomatic set-up itself and the negative groups it defines; localisation in non-positive degrees with the connecting map constructed by lifting, and the first negative group characterised as the obstruction to idempotent completeness of Verdier quotients; additivity and filtered colimits; the IK-theory spectrum with its homotopy groups computed in all three ranges and the localisation sequence in every degree; and the agreement with Bass’s, Pedersen’s, Karoubi’s, Pedersen–Weibel’s and Thomason’s groups, with the presentation of the first negative group, the vanishing for noetherian abelian categories, the deduction of Bass’s vanishing theorem for a regular ring, and the conjecture for a general small abelian category recorded as a conjecture. Every stage target has a node, and the independence-of-enlargement target is met twice over: by the model-independence statement of the Bass construction and by the agreement theorem, which identifies the two routes’ outputs with each other and with the classical groups. The localisation clause of the stage text is carried by the Schlichting localisation nodes in the nonconnective formulation the text asks for.

### Flasque rings, infinite sum rings and the Eilenberg swindle

`GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle` · *definition* · planet **Flasque ring**

A ring is FLASQUE, in Karoubi's sense, when there is a bimodule M, finitely generated projective as a right module, together with a bimodule isomorphism from the direct sum of the ring with M onto M. For a flasque ring the zeroth K-group vanishes, because for every finitely generated projective P the natural isomorphism from the direct sum of P with its tensor product against M onto that tensor product makes the class of P equal to zero; this is the Eilenberg swindle. When the underlying right module structure on M is the ring itself the ring is called an INFINITE SUM RING, and the cone rings are examples, hence flasque. The notion has nothing to do with the flasque sheaves that both pinned libraries call by that name, and a formalisation must not reuse the name.

**Hypotheses.**

- R is a ring, not necessarily commutative; M is an R-bimodule, finitely generated projective as a right module.
- The isomorphism is of bimodules and is part of the data, not merely an abstract isomorphism of underlying modules.
- The pinned libraries' IsFlasque is the sheaf-theoretic notion; the audit records this and the name must be kept apart.

**Proof outline.**

1. Define the flasque structure as a record carrying the bimodule and the isomorphism.
2. Prove the swindle: for every finitely generated projective P, tensoring the defining isomorphism with P gives that the class of P vanishes in the zeroth K-group, so that group is trivial.
3. Define an infinite sum ring as a flasque ring whose bimodule is the ring itself as a right module, and record the equivalent formulation the source gives through a ring map from the infinite matrix ring.
4. Record the cone ring of a ring as an example, namely the ring of row-and-column finite infinite matrices, and prove that it is an infinite sum ring.
5. Record the two library facts the audit names: idempotent completion exists in Mathlib, and the flasque notion of this node does not.

**Acceptance.**

- The cone ring of any ring is flasque, so its zeroth K-group vanishes; this is the standard example.
- A flasque ring has vanishing zeroth K-group; the converse is false and the node does not claim it.
- The sheaf-theoretic flasque predicate of the libraries is a different notion with the same name, and neither implies the other.

**Prerequisites.** `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:Matrix`, `mathlib:RingHom`

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsFlasqueRing` | structure | The bimodule and the isomorphism witnessing flasqueness. |
| `IsFlasqueRing.K0_eq_zero` | characterisation | The zeroth K-group of a flasque ring vanishes. |
| `IsInfiniteSumRing` | structure | A flasque ring whose bimodule is the ring as a right module. |
| `coneRing` | data | The cone ring of a ring, the row-and-column finite infinite matrices. |
| `coneRing_isInfiniteSumRing` | example | The cone ring is an infinite sum ring, hence flasque. |
| `IsFlasqueRing.not_sheaf_flasque` | relation | The notion is unrelated to the sheaf-theoretic predicate the libraries call flasque. |

**Used by.**

- *K.6, the axioms for negative K-theory* — Vanishing on flasque rings is one of the four axioms that characterise a theory of negative K-theory.
- *K.6, the nonconnective construction* — The flasque route to a nonconnective spectrum, which the stage text names, is built from these rings.
- *The libraries* — The audit records that the K-theoretic notion is absent and that the name is taken; a formalisation must choose a different name.

**Unit tests.**

- `cone_ring_flasque` — The cone ring of any ring is flasque.
- `K0_vanishes` — The zeroth K-group of a flasque ring is trivial.
- `not_sheaf_notion` — The predicate is about bimodules, not about sheaves; the pinned IsFlasque is a different statement.
- `infinite_sum_is_flasque` — Every infinite sum ring is flasque, by taking the bimodule to be the ring.

**Sources.**

- II.2.1.3 (PDF p. 105), The definition, the swindle and the infinite sum rings, verbatim.

  > Example 2.1.3. (Karoubi) We say a ring R is flasque if there is an R-bimodule M, finitely generated projective as a right module, and a bimodule isomorphism from R + M to M. If R is flasque then K_0(R) = 0. This is because for every P we have a natural isomorphism from P + (P tensor_R M) to (P tensor_R M). If R is flasque and the underlying right R-module structure on M is R, we say that ...

- I.1.8, the cone ring (PDF p. 5), The cone ring, verbatim; the source records that these are infinite sum rings and hence flasque.

  > For any ring R, the endomorphism ring End_R(R^infinity) contains a smaller ring, namely the subring C(R) consisting of row-and-column finite matrices. The ring C(R) is called the cone ring of R. Show that C(R) is a direct sum ring.

### Contracted functors and the contraction LF

`GeneralAlgebraicKTheory:K.6/contracted-functors` · *construction*

For a functor F from rings to abelian groups define LF(R) to be the cokernel of the difference map from the direct sum of F of the polynomial ring in t and of the polynomial ring in t inverse into F of the Laurent polynomial ring. Call F ACYCLIC when the four-term sequence, from F of the ring through those two, to the Laurent ring and onto LF, is exact for every ring; call it CONTRACTED when it is acyclic and the defining surjection onto LF admits a splitting natural in both the ring and the variable. Iterating gives the functors NLF and L-squared F. This is the machine that produces the negative K-groups, and the naturality of the splitting is the part that does the work.

**Hypotheses.**

- F is a functor from rings to abelian groups; the polynomial and Laurent rings are over the given ring.
- The splitting of a contracted functor is natural in the variable as well as in the ring; naturality in the ring alone is not enough for the iteration.
- The notation F with subscript minus one is the source's alternative name for LF and is recorded so that the literature can be read.

**Proof outline.**

1. Define LF as the displayed cokernel and prove that it is functorial.
2. Define the four-term sequence and the acyclicity and contractedness conditions.
3. Prove the elementary closure properties: a direct sum of contracted functors is contracted, and a natural retract of a contracted functor is contracted.
4. Define the iterates NF, NLF and L-squared F and record the source's formula for the value of a contracted functor on a Laurent ring in several variables, as a sum of copies of the iterates indexed by a formal polynomial in two symbols.
5. Record the two examples the source gives: the zeroth K-group is contracted with contraction the first negative group, and the special first K-group iterates to the same place.

**Acceptance.**

- The zeroth K-group is a contracted functor, and its contraction is the first negative K-group; this is the source's starting point.
- The iterated contraction of the special first K-group is again the first negative K-group, which is the consistency the source records.
- A functor that is acyclic but has no natural splitting is not contracted, and the iteration is then unavailable; the distinction is the content of the definition.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`, `mathlib:Polynomial`, `mathlib:LaurentPolynomial`

**API.**

| name | role | statement |
| --- | --- | --- |
| `contraction` | data | The functor LF. |
| `IsAcyclic` | data | The acyclicity predicate. |
| `IsContracted` | structure | Acyclicity together with the natural splitting. |
| `IsContracted.splitting` | projection | The splitting, natural in the ring and the variable. |
| `contraction_iterate` | data | The iterates NLF and L-squared F. |
| `IsContracted.sum` | compatibility | A direct sum of contracted functors is contracted. |

**Used by.**

- *K.6, the negative K-groups* — They are defined as the iterated contraction of the zeroth K-group.
- *K.6, the fundamental theorem* — The theorem is the statement that the zeroth and first K-groups are contracted, with the splitting given by multiplication by the variable.
- *SchemeKTheoryOperations S.5* — The scheme-level fundamental theorem is the same statement for a different input, and the contraction formalism is shared.

**Unit tests.**

- `K0_contracted` — The zeroth K-group is a contracted functor.
- `iterate_agrees` — The iterated contraction of the special first K-group is the first negative K-group.
- `naturality_in_t` — The splitting is natural in the variable; a splitting natural only in the ring does not make the functor contracted.
- `retract_closed` — A natural retract of a contracted functor is contracted.

**Sources.**

- III.4.1.1 (PDF p. 210), The definition in full, verbatim.

  > Definition 4.1.1 (Contracted functors). Let F be a functor from rings to abelian groups. For each R, we define LF(R) to be the cokernel of the map F(R[t]) + F(R[t^{-1}]) -> F(R[t,t^{-1}]). ... We say that F is acyclic if the sequence is exact for all R. We say that F is a contracted functor if F is acyclic and in addition there is a splitting h of the defining map F(R[t,t^{-1}]) -> LF(R) ...

### Bass's negative K-groups

`GeneralAlgebraicKTheory:K.6/negative-k-groups` · *definition* · planet **Bass's negative K-groups**

For n positive define the n-th negative K-group of a ring inductively as the cokernel of the difference map from the direct sum of the (n-1)-st negative group of the two polynomial rings into that of the Laurent ring; the case n = 1 starts from the zeroth K-group. Each is a functor from rings to abelian groups. The first negative group is what the Fundamental Theorem for the zeroth K-group produces: that theorem gives a split exact sequence exhibiting the zeroth K-group of the Laurent ring as the direct sum of the zeroth group, the first negative group and two copies of the N-term, which is the obstruction to homotopy invariance.

**Hypotheses.**

- R is a ring; the groups are defined for every ring, with no regularity or noetherian hypothesis.
- The definition is by iterated contraction, so it depends on the previous node's machine and on nothing else.
- The N-terms are the cokernels of the maps from the K-group of the ring to that of the polynomial ring, and vanish exactly when the K-group in that degree is homotopy invariant.

**Proof outline.**

1. Define the groups by the displayed induction and prove functoriality.
2. State the Fundamental Theorem for the zeroth K-group: the four-term sequence is split exact and yields the direct sum decomposition of the zeroth group of the Laurent ring into four pieces.
3. Read off that the first negative group is the contraction of the zeroth group, so that the two definitions agree.
4. Prove the elementary consequences: the groups commute with finite products of rings, and they vanish on a flasque ring, both of which follow from the corresponding statements in degree zero.
5. Record the alternative approach of Karoubi and Villamayor that the source mentions, and that it is not the one developed here.

**Acceptance.**

- For a regular noetherian ring every negative group vanishes, which is the theorem of a later node.
- For a flasque ring every negative group vanishes, which is one of the axioms.
- The groups are not defined by homotopy groups of a connective spectrum; the connective model has no negative homotopy, and inferring vanishing from that absence is the error the stage text forbids.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/contracted-functors`, `mathlib:LaurentPolynomial`, `tauceti:TauCeti.ExactK0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `negativeK` | data | The n-th negative K-group. |
| `negativeK_functor` | functoriality | Functoriality in the ring. |
| `negativeK_one` | characterisation | The first negative group is the contraction of the zeroth K-group. |
| `K0_laurent_decomposition` | characterisation | The four-term decomposition of the zeroth K-group of the Laurent ring. |
| `negativeK_flasque` | example | The negative groups of a flasque ring vanish. |
| `negativeK_prod` | compatibility | Compatibility with finite products of rings. |

**Used by.**

- *K.6, the axioms* — Bass’s groups are the model that satisfies the four axioms, which is what makes the axioms non-vacuous.
- *K.6, the nonconnective spectrum* — The spectrum is built so that its negative homotopy groups are these groups.
- *K.7* — The products and the invariance statements are asserted for the nonconnective theory, hence for these groups as well.

**Unit tests.**

- `regular_vanishes` — For a regular noetherian ring the negative groups vanish.
- `flasque_vanishes` — For a flasque ring they vanish.
- `laurent_four_pieces` — The zeroth group of the Laurent ring decomposes into four named pieces.
- `not_from_connective` — The groups are not the negative homotopy of the connective spectrum, which is zero; a formalisation that identified them would be wrong.

**Sources.**

- III.4.1 (PDF p. 210), The definition, verbatim.

  > Definition 4.1. For n > 0, we inductively define K_{-n}(R) to be the cokernel of the map K_{-n+1}(R[t]) + K_{-n+1}(R[t^{-1}]) -> K_{-n+1}(R[t,t^{-1}]). Clearly, each K_{-n} is a functor from rings to abelian groups.

- III.3.7 (PDF p. 208), The theorem and the decomposition, verbatim.

  > Fundamental Theorem for K_0 3.7. For every ring R, there is a naturally split exact sequence 0 -> K_0(R) -> K_0(R[t]) + K_0(R[t^{-1}]) -> K_0(R[t,t^{-1}]) -> K_{-1}(R) -> 0. Consequently, we have a natural direct sum decomposition K_0(R[t,t^{-1}]) = K_0(R) + K_{-1}(R) + NK_0(R) + NK_0(R).

### The Fundamental Theorem with Nil terms, in every degree

`GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms` · *theorem*

For every ring and every degree there is a split exact sequence from the K-group of the ring, through the direct sum of the K-groups of the two polynomial rings, to the K-group of the Laurent ring, onto the K-group one degree lower, with the splitting given by multiplication by the class of the variable in the first K-group of the Laurent polynomial ring over the integers. The obstruction terms are the N-groups, and they are identified with the Nil groups: the n-th Nil group of a ring is the (n+1)-st N-group. For a regular noetherian ring the N-groups vanish and the sequence degenerates to the statement that the K-group of the Laurent ring is the direct sum of the K-group of the ring and the K-group one degree lower. The same statement holds for quasi-projective schemes, with the splitting again given by multiplication by the coordinate.

**Hypotheses.**

- R is a ring and n an integer; for the degenerate form R is regular noetherian.
- The Nil category is the category of pairs of a finitely generated projective module and a nilpotent endomorphism, and the Nil groups are the reduced part of its K-theory.
- The scheme version is for quasi-projective schemes, as the source states it.

**Proof outline.**

1. State the theorem in the form the source gives, with the splitting named.
2. State the identification of the Nil groups with the N-groups in the next degree.
3. Record the degenerate form for a regular noetherian ring and the fact that it is the source of the vanishing theorem for negative K-groups.
4. Record the scheme version with its hypothesis.
5. Record the relation to the contracted-functor formalism: the theorem says exactly that each K-group is a contracted functor with the stated natural splitting, which is what makes the negative groups well defined.

**Acceptance.**

- For a regular noetherian ring the Nil groups vanish and the decomposition has two terms rather than four.
- For a singular ring the Nil terms can be non-zero and the decomposition has four terms; no node may drop them.
- The splitting is by multiplication by the class of the variable, and a different splitting would change the identification of the boundary.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/contracted-functors`, `SchemeKTheoryOperations:S.5`, `mathlib:LaurentPolynomial`

**Sources.**

- V.8.2 (PDF p. 430), The theorem with its splitting, verbatim.

  > Theorem 8.2. [There is a split exact] sequence 0 -> K_n(R) -> K_n(R[t]) + K_n(R[1/t]) -> K_n(R[t,1/t]) -> K_{n-1}(R) -> 0, in which the splitting of the boundary is given by multiplication by t in K_1(Z[t,t^{-1}]).

- V.8.1 (PDF p. 430), The identification of the Nil terms, verbatim.

  > Theorem 8.1. For every R and every n, Nil_n(R) = NK_{n+1}(R).

- V.8, the opening (PDF p. 430), The degenerate form and the hypothesis under which it holds, verbatim.

  > The main goal of this section is to prove the Fundamental Theorem, which gives a decomposition of K_*(R[t,1/t]); [for regular noetherian rings it] simplifies to the formulas NK_n(R) = 0 and K_n(R[t,1/t]) = K_n(R) + K_{n-1}(R).

- V.8.3 (PDF p. 431), The scheme version, verbatim.

  > Theorem 8.3. For every quasi-projective scheme X we have canonically split exact sequences for all n, where the splitting of the boundary is by multiplication by t.

### The axioms a theory of negative K-theory must satisfy

`GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory` · *definition*

A theory of negative K-theory for possibly non-unital rings is a sequence of functors in degrees at most zero together with natural boundary maps from the K-group of a quotient to the next group down of the ideal, satisfying four axioms: in degree zero the functor is the Grothendieck group; for every two-sided ideal the five-term sequence through the ideal, the ring and the quotient is exact; every flasque ring has vanishing groups in all degrees at most zero; and the inclusion of a ring in its infinite matrix ring induces isomorphisms in all those degrees. Bass's groups form such a theory. The axioms are what a second construction must be checked against, and they are the interface through which this layer's nonconnective spectrum is compared with the Bass groups.

**Hypotheses.**

- The rings are allowed to be non-unital, which is what makes the ideal axiom usable.
- The matrix ring in the fourth axiom is the union of the finite matrix rings.
- The axioms do not determine the theory by themselves; the source records that Bass's groups satisfy them, which is what the axioms are for.

**Proof outline.**

1. State the four axioms in the source's order.
2. Record that Bass's negative K-groups satisfy them, with the source's pointers to the contraction and the exercises where each axiom is checked.
3. Record the role of the flasque axiom: it is the one that forces the theory to be non-trivial in negative degrees rather than being extendable by zero.
4. Record that the excision-type axiom is stated for non-unital rings and that restricting to unital rings weakens it.
5. Record the use this layer makes of the axioms: any second construction, including the flasque-enlargement route the stage text names, is compared with Bass's groups by checking them.

**Acceptance.**

- Bass's groups satisfy all four axioms.
- A theory that is zero in all negative degrees fails the flasque axiom only if some flasque ring has a non-zero group, so the axiom must be read together with the exactness axiom; the source's formulation is the one recorded here.
- The fourth axiom is about the infinite matrix ring, not about finite matrix rings, and the distinction matters.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`, `mathlib:Matrix`

**API.**

| name | role | statement |
| --- | --- | --- |
| `NegativeKTheory` | structure | The functors in degrees at most zero together with the boundary maps. |
| `NegativeKTheory.k0` | characterisation | Axiom one: in degree zero the functor is the Grothendieck group. |
| `NegativeKTheory.exact_ideal` | characterisation | Axiom two: the five-term sequence of an ideal is exact. |
| `NegativeKTheory.flasque` | characterisation | Axiom three: a flasque ring has vanishing groups. |
| `NegativeKTheory.matrix` | characterisation | Axiom four: the inclusion in the infinite matrix ring is an isomorphism. |
| `bassTheory` | example | Bass’s negative groups form such a theory. |

**Used by.**

- *K.6, the nonconnective spectrum* — The axioms are the interface through which a second construction is compared with the Bass groups.
- *K.6, the flasque rings* — The third axiom is the only place the flasque notion enters the characterisation.
- *The stage text* — The text asks for independence of the enlargement; the axioms are what that independence is checked against.

**Unit tests.**

- `bass_satisfies` — Bass’s groups satisfy all four axioms.
- `nonunital` — The second axiom is stated for non-unital rings; restricting to unital rings weakens it.
- `infinite_matrices` — The fourth axiom is about the infinite matrix ring, not the finite ones.
- `degree_zero` — In degree zero the theory is the Grothendieck group, so the axioms extend the existing definition rather than replacing it.

**Sources.**

- III.4.4 (PDF p. 213), The four axioms, verbatim.

  > Definition 4.4. A theory of negative K-theory for (nonunital) rings consists of a sequence of functions K_n (n at most 0) from nonunital rings to abelian groups, together with natural boundary maps from K_n(R/I) to K_{n-1}(I) for every 2-sided ideal I, satisfying the following axioms. (1) K_0(R) is the Grothendieck group of chapter II; (2) the five-term sequence is exact for every ideal ...

- III.4.4.1 (PDF p. 213), The example that makes the axioms non-vacuous, verbatim.

  > Example 4.4.1. Bass' negative K-groups (4.1) form a theory of negative K-theory for rings.

### Mayer-Vietoris for the negative K-groups

`GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k` · *theorem*

Given a ring map and an ideal of the source mapped isomorphically onto an ideal of the target, the Mayer-Vietoris sequence in low degrees continues as a long exact sequence of negative K-groups: from the direct sum of the zeroth groups of the target and of the quotient, through the zeroth group of the quotient of the target, to the first negative group of the source, and so on downwards without end. This is the form of excision available in negative degrees, and it is one of the two reasons the negative groups are useful.

**Hypotheses.**

- The square is the one determined by a ring map and an ideal carried isomorphically onto an ideal.
- The sequence continues downwards indefinitely, which is the statement that distinguishes the negative groups from the connective theory.
- The low-degree part of the sequence is the classical Mayer-Vietoris of the source's earlier section and is imported.

**Proof outline.**

1. State the hypotheses on the square.
2. Record the classical low-degree Mayer-Vietoris sequence from the source's earlier section.
3. State the continuation into negative degrees, in the form the source gives.
4. Record the consequence: an excision failure in degree zero is measured by a first negative group, which is how the negative groups are computed in practice.

**Acceptance.**

- For a Milnor square with one map surjective the sequence specialises to the classical patching statement.
- The sequence does not terminate, which is what makes the negative groups a genuinely infinite family.
- No analogous statement holds for the connective theory in negative degrees, since those groups are zero there.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/negative-k-groups`

**Sources.**

- III.4.3 (PDF p. 212), The theorem and the shape of the sequence, verbatim.

  > Theorem 4.3 (Mayer-Vietoris). Suppose we are given a ring map f from R to S and an ideal I of R mapped isomorphically into an ideal of S. Then the Mayer-Vietoris sequence continues as a long exact Mayer-Vietoris sequence of negative K-groups: ... K_0(S) + K_0(R/I) -> K_0(S/I) -> K_{-1}(R) -> K_{-1}(S) + K_{-1}(R/I) -> K_{-1}(S/I) -> ...

### The nonconnective Bass K-theory spectrum

`GeneralAlgebraicKTheory:K.6/nonconnective-spectrum` · *construction* · planet **The Bass K-theory spectrum**

For a functor E from rings to spectra, let LE be the homotopy cofiber of the map from the homotopy pushout of the two polynomial spectra over the spectrum of the ring into the spectrum of the Laurent ring, and let the desuspended functor be its loop space; there is a cofibration sequence natural in both arguments. Applying this to connective K-theory and using the Fundamental Theorem, the homotopy groups of the desuspension recover the K-groups one degree down in positive degrees, and the zeroth and first negative groups in degrees zero and minus one. Multiplication by the class of the variable gives a natural map from the K-theory spectrum to its desuspension, which the Fundamental Theorem shows is the inclusion of the minus-one-connective cover; iterating gives maps of the k-fold desuspensions, each the inclusion of a deeper connective cover, and the nonconnective Bass spectrum is the homotopy colimit of that diagram. Its homotopy groups are the K-groups in non-negative degrees and Bass's negative groups below.

**Hypotheses.**

- E is a functor from rings to spectra; for the main statements E is one of the functorial models of connective K-theory the source lists.
- The homotopy pushout and the homotopy cofiber are taken in spectra; neither pinned library has spectra, which the audit records.
- The comparison map is multiplication by the class of the variable in the first K-group of the Laurent polynomial ring over the integers.

**Proof outline.**

1. Define the functor LE by the displayed homotopy cofiber and the desuspension as its loop space, and record the natural cofibration sequence.
2. Compute the homotopy groups of the desuspension of connective K-theory from the Fundamental Theorem: they are the K-groups one degree down in positive degrees, the zeroth K-group in degree zero and the first negative group in degree minus one, and zero below that.
3. Construct the comparison map by multiplication by the class of the variable, and state the Fundamental Theorem in its topological form: the map identifies the K-theory spectrum with the minus-one-connective cover of the desuspension.
4. Iterate: the k-fold desuspension receives the (k-1)-fold one as its minus-k-connective cover, with the homotopy groups agreeing above degree minus k and the k-th negative group appearing in degree minus k.
5. Define the nonconnective spectrum as the homotopy colimit of the resulting diagram, and read off its homotopy groups.
6. Record what makes the construction independent of the model: the input is any functorial model of connective K-theory and the construction is natural in it, so two models with a natural equivalence give equivalent nonconnective spectra.

**Acceptance.**

- In non-negative degrees the nonconnective spectrum has the K-groups of the connective one, which is the agreement the stage text asks for.
- In degree minus k it has Bass's k-th negative group.
- The construction uses no regularity hypothesis, and for a regular noetherian ring it produces a spectrum with vanishing negative homotopy, which is the vanishing theorem and not an input.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory`

**API.**

| name | role | statement |
| --- | --- | --- |
| `deloop` | data | The functor LE and its desuspension. |
| `deloop_cofibration` | characterisation | The natural cofibration sequence. |
| `bassSpectrum` | data | The nonconnective Bass K-theory spectrum. |
| `bassSpectrum_pi_nonneg` | characterisation | Its homotopy groups in non-negative degrees are the K-groups. |
| `bassSpectrum_pi_neg` | characterisation | Its homotopy groups in negative degrees are Bass’s negative groups. |
| `bassSpectrum_natural` | functoriality | Naturality in the ring and in the model of connective K-theory. |
| `bassSpectrum_independent` | compatibility | Two naturally equivalent models of connective K-theory give equivalent nonconnective spectra. |

**Used by.**

- *K.6, localisation* — The nonconnective formulation of localisation is a statement about this spectrum and is what makes the boundary maps extend into negative degrees.
- *K.7* — The invariance and product statements are asserted at the level of this spectrum, not only of the connective one.
- *The stage text* — The flasque-enlargement route the text names is an alternative construction; it is compared with this one through the axioms of the previous node.

**Unit tests.**

- `agrees_above_zero` — In non-negative degrees the homotopy groups are the K-groups of the connective spectrum.
- `degree_minus_one` — In degree minus one the homotopy group is the first negative K-group.
- `regular_case` — For a regular noetherian ring the negative homotopy vanishes.
- `model_independence` — Two models of connective K-theory related by a natural equivalence give equivalent nonconnective spectra.

**Sources.**

- IV.10.1 (PDF p. 349), The construction, verbatim.

  > Definition 10.1. Write LE(R) for the spectrum homotopy cofiber of the map f_0 from this homotopy pushout to E(R[x,x^{-1}]), [and write the desuspension] for the loop space of LE(R). Since the mapping cone is natural, LE and the desuspension are functors and there is a cofibration sequence, natural in E and R.

- IV.10.2 (PDF p. 349), The comparison with the connective theory, verbatim.

  > Fundamental Theorem 10.2. For any ring R, the map from K(R) to the desuspension of K(R) induces a homotopy equivalence between K(R) and the (-1)-connective cover of that spectrum. In particular, K_n(R) = pi_n of it for all n at least 0.

- IV.10.3 and IV.10.4 (PDF pp. 349 to 350), The iteration and the definition of the nonconnective spectrum, verbatim.

  > Corollary 10.3. For k > 0 the map from the (k-1)-fold desuspension to the k-fold one induces a homotopy equivalence with the (-k)-connective cover, with K_n(R) = pi_n for n > -k, and K_{-k}(R) = pi_{-k} of the k-fold desuspension. Definition 10.4. We define K^B(R) to be the homotopy colimit of the diagram.

### Vanishing of the negative K-groups for a regular noetherian ring

`GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings` · *theorem*

For a regular noetherian ring the N-groups vanish in every degree, so the Fundamental Theorem degenerates and every negative K-group vanishes. In the intended finite-dimensional applications this is what makes the nonconnective and the connective theories agree. The converse is emphatically not available: the connective model has no homotopy in negative degrees for any ring whatever, and inferring from that absence that a singular ring has vanishing negative K-groups is a mistake the stage text names and this node records as a non-example.

**Hypotheses.**

- R is regular noetherian, that is every module has a finite projective resolution; the noetherian hypothesis is part of the statement.
- The vanishing of the N-groups for such a ring is the source's statement in the section on the Fundamental Theorem, proved there by resolution.
- The statement is about the Bass groups, equivalently about the negative homotopy of the nonconnective spectrum.

**Proof outline.**

1. Record the vanishing of the N-groups for a regular noetherian ring, with the resolution argument the source gives.
2. Substitute into the Fundamental Theorem to obtain the two-term decomposition of the K-groups of the Laurent ring.
3. Deduce by induction on the degree that every negative K-group vanishes.
4. State the non-example: the connective model has zero homotopy in negative degrees for every ring, so that absence carries no information, and a proof of vanishing for a singular ring must come from the Bass definition or from the nonconnective spectrum.
5. Record an example where the negative groups do not vanish, so that the statement has content: the source's exercises and the Mayer-Vietoris theorem produce non-zero first negative groups for suitable singular rings.

**Acceptance.**

- For a regular noetherian ring all negative groups vanish and the nonconnective spectrum is connective.
- For a singular ring they need not vanish, and the Mayer-Vietoris sequence is how they are computed.
- The vanishing may not be inferred from the connective model, which is the error the stage text forbids by name.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`

**Sources.**

- V.8, the opening (PDF p. 430), The vanishing of the N-groups and the degenerate decomposition, verbatim.

  > [For regular noetherian rings the decomposition] simplifies to the formulas NK_n(R) = 0 and K_n(R[t,1/t]) = K_n(R) + K_{n-1}(R).

- II.6.5 and I.3.7.1 (PDF pp. 132 and 24), The hypothesis, verbatim, with the stability under localisation that the induction uses.

  > A noetherian ring R is called regular if every R-module M has a finite resolution by projectives. Every localization of a regular ring is also regular.

### Frobenius categories, Frobenius pairs and their derived categories

`GeneralAlgebraicKTheory:K.6/frobenius-pairs` · *definition* · planet **Frobenius pair**

A Frobenius category is an exact category with enough projective and enough injective objects in which the projectives and the injectives coincide; its stable category, obtained by killing the maps that factor through a projective-injective, is triangulated. A FROBENIUS PAIR is a fully faithful inclusion of one small Frobenius category in another carrying projective-injectives into projective-injectives, and its DERIVED CATEGORY is the Verdier quotient of the two stable categories. This is the category of models on which the whole nonconnective construction of this layer runs: the bounded complexes over an exact category, with degreewise split conflations and the homotopy-acyclic complexes as the subcategory, form a Frobenius pair whose derived category is the bounded derived category, and that is how an exact category enters the machine.

**Hypotheses.**

- The categories are small; the inclusion is fully faithful and exact and preserves projective-injective objects.
- The stable category is triangulated, with the shift given by the cokernel of an inflation into an injective object.
- For the example, the conflations of the complex category are the degreewise split ones, and the subcategory is the complexes homotopy equivalent to acyclic complexes; acyclic has the exact-category meaning, that each differential factors through a conflation.

**Proof outline.**

1. Define a Frobenius category and prove that its stable category is triangulated.
2. Define a Frobenius pair, its maps, and its derived category as the Verdier quotient, and prove that the map of stable categories is fully faithful, which is what makes the quotient the right object.
3. Prove the standing example: bounded complexes over an exact category with degreewise split conflations form a Frobenius category whose projective-injectives are the contractible complexes and whose stable category is the homotopy category, and the homotopy-acyclic complexes form a Frobenius pair with it whose derived category is the bounded derived category.
4. Record the other examples the source gives, so that the scope of the machine is visible: complicial biWaldhausen categories, cell modules over a differential graded algebra, and small triangulated subcategories of the derived category of a Grothendieck abelian category.
5. Record the relation to the pinned libraries: Tau Ceti's exact structures supply the exact-category input, and neither library has Frobenius categories, stable categories or Verdier quotients of them.

**Acceptance.**

- Bounded complexes over an exact category form a Frobenius pair with derived category the bounded derived category.
- A map of Frobenius pairs induces a triangle functor of derived categories.
- The stable category of a Frobenius category is triangulated; without the coincidence of projectives and injectives it is not.

**Prerequisites.** `tauceti:TauCeti.ExactK0`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**API.**

| name | role | statement |
| --- | --- | --- |
| `FrobeniusCategory` | structure | An exact category with enough projectives and injectives, which coincide. |
| `FrobeniusCategory.stable` | data | The stable category, with its triangulated structure. |
| `FrobeniusPair` | structure | A fully faithful inclusion of small Frobenius categories preserving projective-injectives. |
| `FrobeniusPair.derived` | data | The derived category, the Verdier quotient of the stable categories. |
| `FrobeniusPair.map` | functoriality | A map of pairs induces a triangle functor of derived categories. |
| `FrobeniusPair.ofExact` | example | The bounded complexes over an exact category, with the homotopy-acyclic ones. |

**Used by.**

- *K.6, the flasque envelope* — The functors F and S are endofunctors of the category of Frobenius pairs; the whole construction lives there.
- *K.6, the IK-spectrum* — The K-theory space is that of the Waldhausen category attached to a Frobenius pair, inflations as cofibrations and derived isomorphisms as weak equivalences.
- *K.7, derived invariance* — The correct hypothesis of derived Morita invariance is a map of Frobenius pairs inducing an equivalence of derived categories.

**Unit tests.**

- `complexes_are_a_pair` — The bounded complexes over an exact category form a Frobenius pair.
- `derived_is_bounded_derived` — Its derived category is the bounded derived category of the exact category.
- `stable_is_triangulated` — The stable category of a Frobenius category is triangulated.
- `projinj_coincide` — Dropping the coincidence of projectives and injectives breaks the triangulation; an exact category with enough projectives only is not a Frobenius category.

**Sources.**

- §3.3 to 3.5, pp. 8 to 9, The definitions, verbatim; the ligature and accent damage of the scan has been repaired without changing a word.

  > Recall that a Frobenius category is an exact category with enough injectives and projectives, and where injectives and projectives coincide. Its stable category is a triangulated category. 3.4 Definition. A Frobenius pair A = (A, A_0) is a fully faithful inclusion A_0 -> A of small Frobenius categories. ... 3.5 Definition. If A = (A, A_0) is a Frobenius pair, then the map of small ...

- §5.3 and Definition 5.4, p. 11, The standing example and the definition it feeds, verbatim.

  > Declare a sequence in Ch E to be a conflation if it is isomorphic to the split conflation in each degree. This makes Ch E into an exact category. One checks that Ch E is a Frobenius category whose projective-injective objects are the contractible chain complexes. Its stable category is the usual homotopy category K(E). Let Ac(E) be the full subcategory of chain complexes which are ...

### The countable flasque envelope and the suspension of a Frobenius pair

`GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension` · *construction* · planet **The countable flasque envelope**

The COUNTABLE ENVELOPE of a small exact category has as objects the sequences of inflations, with morphism groups the limit over the source index of the colimit over the target index; it is exact, has exact countable coproducts, and is FLASQUE: the functor sending a sequence to the countable sum of its shifts satisfies the direct sum of the identity with it being naturally isomorphic to it, which is the Eilenberg swindle in functorial form. Applied to a Frobenius pair this gives an endofunctor F of Frobenius pairs whose derived category has countable coproducts and is c-compactly generated by the original, so that the idempotent completion of the original derived category is the c-compact part of the enlarged one. The SUSPENSION S of a pair is the enlarged Frobenius category together with the objects that vanish in the quotient of the enlarged derived category by the original, so that the derived category of the suspension is exactly that quotient. The natural transformations from the identity through F to S then satisfy the axioms of the model set-up, and this is the flasque enlargement and suspension the stage text asks for.

**Hypotheses.**

- The exact category and the Frobenius pairs are small; the envelope is taken with the source's morphism formula, not with a naive colimit.
- Flasque is used in Karoubi's sense of the earlier node, a functor T with the identity plus T naturally isomorphic to T, and has nothing to do with the sheaf-theoretic predicate the pinned libraries call by that name.
- c-compact means that the represented functor commutes with countable coproducts; the generation statement is by countable homotopy colimits.

**Proof outline.**

1. Construct the countable envelope and prove that it is exact with exact countable coproducts.
2. Prove the flasqueness lemma by constructing the shift functor on sequences and the natural isomorphism, which is the swindle.
3. Define F on Frobenius pairs, prove that the enlarged pair is a Frobenius pair and that the derived category embeds fully faithfully in the enlarged one.
4. Prove that the enlarged derived category has countable coproducts and is c-compactly generated by the original, and deduce that the idempotent completion of the original is the c-compact part of the enlargement.
5. Define the suspension as the enlarged category together with the objects vanishing in the quotient, and prove that its derived category is that quotient.
6. Prove that the identity, F and S satisfy the three conditions of the model set-up: the functors preserve exact sequences, the zeroth group of an enlargement vanishes, and the sequence from a pair through its enlargement to its suspension is exact.

**Acceptance.**

- The countable envelope is flasque, so the zeroth group of an enlarged pair vanishes; this is the swindle in the form the construction needs.
- The derived category of the suspension is the quotient of the enlarged derived category by the original.
- The three conditions of the set-up hold for the category of Frobenius pairs, which is what makes the negative groups of the next node well defined.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/frobenius-pairs`, `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**API.**

| name | role | statement |
| --- | --- | --- |
| `countableEnvelope` | data | The countable envelope of a small exact category. |
| `countableEnvelope_isFlasque` | characterisation | The envelope is flasque, with the shift functor as witness. |
| `FrobeniusPair.enlarge` | data | The endofunctor F of Frobenius pairs. |
| `FrobeniusPair.enlarge_generates` | characterisation | The enlarged derived category is c-compactly generated by the original. |
| `FrobeniusPair.suspension` | data | The suspension endofunctor S. |
| `FrobeniusPair.setup` | compatibility | The identity, F and S satisfy the three conditions of the model set-up. |

**Used by.**

- *K.6, the negative groups of a model* — The groups are defined as the zeroth group of an iterated suspension.
- *K.6, the IK-spectrum* — The structure maps of the spectrum come from the square built out of the enlargement and the suspension.
- *K.6, the axioms* — The vanishing of the zeroth group on an enlargement is the flasqueness axiom, here proved rather than assumed.

**Unit tests.**

- `envelope_flasque` — The countable envelope is flasque.
- `IK0_of_enlargement_vanishes` — The zeroth group of an enlarged pair is zero.
- `suspension_derived` — The derived category of the suspension is the quotient of the enlarged derived category by the original.
- `not_sheaf_flasque` — Flasque here is the swindle condition on a functor, not the sheaf-theoretic predicate of the pinned libraries.

**Sources.**

- Lemma 4.2, p. 9, The flasqueness of the envelope with its proof, verbatim.

  > The countable envelope FE of an exact category E is flasque, i.e., there is an exact functor T : FE -> FE and a natural equivalence T (+) id = T of functors. Proof. Countable direct sums exist in FE and are exact, so the functor sending E to the countable sum and the natural equivalence make FE into a flasque exact category. ... Now the functor A -> TA = sum of the t^i A makes sense and ...

- §4.1, Definition 4.3, Proposition 4.4 and Definition 4.7, pp. 9 to 10, The envelope, the functor F, its properties and the suspension, verbatim.

  > The category FE is an exact category whose objects are sequences of inflations in E. The morphism set from a sequence A to B is lim_i colim_j hom(A_i, B_j). ... 4.4 Proposition. Let A be a Frobenius pair. Then the map A -> F A induces a fully faithful map D A -> D F A of triangulated categories. Moreover, D F A has countable coproducts, and it is c-compactly generated by D A. ... 4.7 ...

- Theorem 4.8, p. 10, The verification that the flasque route satisfies the axioms, verbatim.

  > If we take M to be the category of Frobenius pairs, then the sequence id -> F -> S of functors from Frobenius pairs to Frobenius pairs satisfies the hypothesis of the set-up (1.3).

### The set-up: negative K-groups of a triangulated category with models

`GeneralAlgebraicKTheory:K.6/schlichting-set-up` · *definition*

For a small triangulated category the zeroth invariant is the zeroth K-group of its idempotent completion. A SET-UP consists of a category of models with a functor to small triangulated categories, together with endofunctors F and S and natural transformations from the identity through F to S, such that both preserve exact sequences, the zeroth invariant of an enlargement vanishes, and the sequence from a model through its enlargement to its suspension is exact; a sequence of small triangulated categories is EXACT when the composite is zero, the first functor is fully faithful and the induced functor from the Verdier quotient to the third is cofinal. The negative groups of a model are then the zeroth invariant of its iterated suspension. Taking the models to be Frobenius pairs and the functors of the previous node gives the negative K-groups of an exact category, of a ring, of a scheme and of a differential graded algebra.

**Hypotheses.**

- The categories are small; cofinal means fully faithful with every object a direct summand of one in the image.
- The idempotent completion carries a canonical triangulated structure, which is what makes the zeroth invariant well defined.
- The axiomatic form is deliberate: the source records that it allows models other than Frobenius pairs, which it does not develop.

**Proof outline.**

1. Define an exact sequence of small triangulated categories, and record the three elementary facts the construction uses: the idempotent completion is triangulated, the zeroth K-group classifies dense triangulated subcategories, and an exact sequence induces an exact sequence of zeroth invariants.
2. State the three conditions of the set-up and define the negative groups as the zeroth invariant of the iterated suspension.
3. Instantiate at Frobenius pairs and record the resulting definitions for an exact category, for a ring through its finitely generated projectives, for a quasi-compact quasi-separated scheme and for a differential graded algebra.
4. Record the source's observation about the zeroth invariant: if the exact category is idempotent complete the zeroth invariant is the usual zeroth K-group, and otherwise it is that of the idempotent completion, which is where the degree-zero correction of this theory sits.
5. Record the two maps of the classical five-term sequence that this construction extends, and that neither is injective or surjective in general, which is the reason the theory exists.

**Acceptance.**

- For a ring the construction gives groups in every non-positive degree, with the zeroth one the zeroth K-group of the idempotent completion.
- The set-up is satisfied by Frobenius pairs, which is the previous node's theorem, so the definition is non-vacuous.
- A quasi-isomorphism of differential graded algebras induces isomorphisms of all these groups, because it induces an equivalence of derived categories.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**API.**

| name | role | statement |
| --- | --- | --- |
| `IsExactSequence` | structure | An exact sequence of small triangulated categories, with the cofinality condition. |
| `IK0` | data | The zeroth invariant, the K-group of the idempotent completion. |
| `NegativeKSetup` | structure | A category of models with F, S and the three conditions. |
| `negativeIK` | data | The negative groups of a model. |
| `negativeIK_frobenius` | example | The instance at Frobenius pairs. |
| `IK0_eq_K0_of_idempotentComplete` | compatibility | For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group. |

**Used by.**

- *K.6, the localisation theorem* — The long exact sequence is a statement about these groups and uses only the three conditions.
- *K.6, agreement* — The comparison with Bass’s groups is a statement about this definition.
- *K.7* — The filtered-colimit statement in non-positive degrees is proved at this level of generality.

**Unit tests.**

- `idempotent_complete_case` — For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group.
- `frobenius_instance` — Frobenius pairs with the envelope and the suspension satisfy the set-up.
- `quasi_iso_invariance` — A quasi-isomorphism of differential graded algebras induces isomorphisms of all the groups.
- `cofinal_not_equivalence` — The third functor of an exact sequence is required to be cofinal, not an equivalence; requiring an equivalence would exclude the intended examples.

**Sources.**

- Definition 1.1, Facts 1.2, Set-up 1.3 and Definition 1.4, pp. 4 to 5, The set-up and the definition, verbatim.

  > 1.1 Definition. Call a sequence of small triangulated categories A -> B -> C exact if the composition is zero, the map A -> B is fully faithful and the map from B/A to C is cofinal, i.e., it is fully faithful, and every object of C is a direct summand of an object of B/A. ... We define IK_0(T) = K_0 of the idempotent completion. ... 1.3 Set-up. ... We suppose that there are two ...

- §5.5, p. 11, The degree-zero identification, verbatim.

  > If E is idempotent complete, then so is D^b(E). In this case IK_0(E) is the usual K_0(E). If E is not idempotent complete, then IK_0(E) = K_0 of the idempotent completion.

### Localisation in negative degrees, and the first negative group as an obstruction

`GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization` · *theorem*

An exact sequence of models induces a long exact sequence of the negative groups in every non-positive degree, with a connecting map constructed by lifting an object through the enlargement; a map whose derived functor is cofinal, in particular an equivalence, induces isomorphisms in all those degrees. The first negative group has an exact meaning: it vanishes for a model exactly when, for every exact sequence out of that model, the Verdier quotient of the idempotent completions is again idempotent complete. So the negative groups are the obstruction to the classical five-term sequence continuing, and the first of them is the obstruction to idempotent completeness of quotients. This is the localisation clause of the stage text in the nonconnective formulation.

**Hypotheses.**

- The sequence is exact in the sense of the previous node, so the third functor is only required to be cofinal.
- The long exact sequence is asserted in degrees at most zero; its continuation to all degrees is the spectrum-level statement of a later node.
- The connecting map is defined on objects by choosing a lift through the enlargement and is proved independent of the lift.

**Proof outline.**

1. Construct the connecting map: lift an object of the third derived category to the enlargement of the second, observe that its image in the third suspension vanishes, and take the class of its image in the first suspension.
2. Prove independence of the lift, using that the difference of two lifts has cone in the enlargement of the first, whose zeroth invariant vanishes.
3. Prove that the map respects distinguished triangles, so that it is defined on the group, and iterate to every non-positive degree.
4. Prove exactness at the three places, which the source does by a diagram chase using the classification of dense subcategories.
5. Deduce the cofinality corollary by applying the theorem to the sequence with zero first term.
6. Prove the obstruction characterisation of the first negative group in both directions.

**Acceptance.**

- An exact sequence of exact categories whose bounded derived categories form an exact sequence gives a long exact sequence of negative groups.
- A derived equivalence induces isomorphisms in all non-positive degrees, so resolution gives an isomorphism.
- The first negative group vanishes exactly when the relevant Verdier quotients of idempotent completions are idempotent complete.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/schlichting-set-up`, `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`

**Sources.**

- Lemma 1.6, Theorem 1.7, Corollary 1.8 and Remark 1.9, pp. 5 to 6, The localisation theorem with its corollary and the obstruction remark, verbatim.

  > 1.6 Lemma. The map delta yields a well defined map IK_i(C) -> IK_{i-1}(A) of abelian groups, i <= 0. 1.7 Theorem. Let A -> B -> C be a short exact sequence in M. Then the sequence of abelian groups ... IK_i(A) -> IK_i(B) -> IK_i(C) -> IK_{i-1}(A) -> ... is exact, i <= 0. ... 1.8 Corollary. Let f : A -> B be a map in M such that D(f) is cofinal, e.g. an equivalence of categories. Then ...

- §5.5, p. 11, The instance for exact categories and the localisation example, verbatim.

  > Given a sequence A -> B -> C of exact categories such that D^b A -> D^b B -> D^b C is exact, Theorem 1.7 yields a long exact sequence IK_0(A) -> IK_0(B) -> IK_0(C) -> IK_{-1}(A) -> IK_{-1}(B) ... For example, let R be a ring, and let S be a multiplicative set of central non-zero-divisors.

### Additivity and filtered colimits for the negative groups

`GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K` · *theorem*

If a natural transformation of maps of models is objectwise an inflation then the quotient is again a map of models and the induced maps in every non-positive degree add: the middle one is the sum of the outer two. For exact categories this gives the usual additivity of a short exact sequence of exact functors. The negative groups also commute with filtered colimits of models, and hence with filtered colimits of exact categories, because the colimit of the enlargements is again flasque and additivity makes its groups vanish. Both statements are proved directly from the axioms of the set-up, and both are needed by the vanishing theorem.

**Hypotheses.**

- The index category of the colimit is small and filtered.
- The additivity hypothesis is that the transformation is objectwise an inflation, not merely a natural transformation.
- The statements are for degrees at most zero; the source does not treat positive degrees here, and the corresponding positive statement belongs to the connective theory.

**Proof outline.**

1. Prove additivity in degree zero and propagate it to every degree by applying it to the iterated suspension.
2. Deduce the exact-functor form: a short exact sequence of exact functors gives additivity of the induced maps, using that a map factoring through the subcategory induces zero and that the cone of the canonical map is acyclic.
3. Prove that a filtered colimit of models is a model and that the colimit of the enlargements is flasque, so its groups vanish by additivity.
4. Compare the two long exact sequences, of the colimit of the sequences and of the sequence of the colimits, and conclude by iteration.
5. Record the corollary for exact categories, obtained from the equivalence of the colimit of the complex categories with the complex category of the colimit.

**Acceptance.**

- A short exact sequence of exact functors gives additivity in every non-positive degree.
- The negative groups of a filtered colimit of exact categories are the colimit of the negative groups.
- The proofs use only the axioms of the set-up, so they apply to any model category satisfying them.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`

**Sources.**

- Theorem 6.1, Corollary 6.2, Lemma 6.3 and Corollary 6.4, pp. 13 to 14, Additivity and the colimit statements, verbatim.

  > 6.1 Theorem (Additivity). Let F -> G : A -> B be a natural transformation of maps between Frobenius pairs. If F(A) -> G(A) is an inflation for all objects A of A, then G/F is a map of Frobenius pairs and IK_i(F) + IK_i(G/F) = IK_i(G) for all i <= 0. 6.2 Corollary. Let 0 -> F -> G -> H -> 0 be an exact sequence of exact functors between exact categories. Then IK_i(F) + IK_i(H) = IK_i(G) ...

### The IK-theory spectrum of a Frobenius pair, and what it computes

`GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance` · *theorem* · planet **Schlichting's IK-theory spectrum**

A Frobenius pair is a Waldhausen category with the inflations as cofibrations and the maps inverted in the derived category as weak equivalences, so it has a K-theory space. The enlargement has a contractible K-theory space, functorially, because the flasqueness of the envelope gives a functorial homotopy from the identity to a self-map; the square built from the pair, its enlargement and its suspension then yields a natural map from the K-theory space to the loop space of the suspension's, and the sequence of these spaces is the IK-THEORY SPECTRUM. Its loop spectrum is an omega-spectrum; its homotopy groups are the Quillen K-groups in positive degrees, the zeroth K-group of the idempotent completion of the derived category in degree zero, and the negative groups of the earlier nodes below. An exact sequence of pairs gives a homotopy cartesian square and a long exact sequence in ALL degrees, and a map inducing an equivalence of derived categories induces a homotopy equivalence of K-theory spaces. This is the nonconnective spectrum of the stage text, built by flasque enlargement and suspension.

**Hypotheses.**

- The Waldhausen structure is the one named: inflations as cofibrations, derived isomorphisms as weak equivalences.
- The construction needs a factorisation of every map into a cofibration followed by a weak equivalence, which the source supplies without functoriality; the appendix replaces Waldhausen's cylinder functor by that weaker hypothesis.
- The degree-zero value is the group of the idempotent completion, which differs from the K-group of the category itself when that is not idempotent complete.

**Proof outline.**

1. Attach the Waldhausen category to a Frobenius pair and define its K-theory space as the loop space of the realisation of the weak-equivalence S-construction.
2. Prove that the K-theory space of an enlargement is contractible, functorially: the flasqueness isomorphism gives a functorial homotopy between a self-map and the sum of it with the identity, and an H-space inverse then contracts.
3. Build the commutative square from the pair, its enlargement, its suspension and the pair regarded as a pair with itself, whose two corners are contractible, and take the resulting map to the loop space.
4. Define the spectrum as the sequence of K-theory spaces of the iterated suspensions with these structure maps.
5. Prove that the loop spectrum is an omega-spectrum, using cofinality and the fibration property, and compute the homotopy groups in the three ranges.
6. Prove the localisation statement at the spectrum level and deduce the long exact sequence in all degrees, which extends the non-positive sequence of the earlier node.
7. Record the derived-invariance statement and the cofinality statement, which are the two comparison tools the layer exports.

**Acceptance.**

- The homotopy groups are the Quillen K-groups above degree zero, so the spectrum extends the connective theory rather than replacing it.
- In negative degrees they are the groups defined from the set-up, so the two constructions of the layer agree.
- For an exact category the resulting groups agree with Bass's and Thomason's, which is the next node.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`, `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`

**Sources.**

- Definitions 11.1 and 11.4, Lemma 11.3, pp. 20 to 21, The construction of the spectrum, verbatim.

  > 11.1 Definition. Let A be a Frobenius pair. Its associated category with cofibrations and weak equivalences has as cofibrations the inflations in A and as weak equivalences the maps in A which are isomorphisms in D A. The K-theory space of A is K(A) = Omega |wS.A|. ... 11.3 Lemma. There is a contraction of K(F A), functorial in the Frobenius pair A. ... 11.4 Definition (The IK-theory ...

- Theorem 11.7, p. 21, The computation of the homotopy groups, verbatim.

  > 11.7 Theorem. Let A be a Frobenius pair. Then the spectrum Omega IK(A) is an Omega-spectrum. The homotopy groups of IK(A) are given by pi_i IK(A) = pi_i K(A) for i > 0 as defined in 11.1, IK_0(A) = K_0 of the idempotent completion of D(A) for i = 0, and IK_i(A) for i < 0 as defined in sections 1 and 4.

- Theorem 11.10 and §11.13, pp. 22 to 23, Localisation at the spectrum level and the instance for exact categories, verbatim.

  > 11.10 Theorem. Let A -> B -> C be an exact sequence of Frobenius pairs. Then, applying the IK-theory functor yields a homotopy cartesian square. ... 11.13. IK(E), E an exact category. As in 5.4 we define the IK-theory spectrum of an exact category E. ... a sequence A -> B -> C of exact categories induces a long exact sequence.

- Proposition 11.15, p. 23, The derived-invariance statement, with the bracketed words supplying from the surrounding text what the scan drops.

  > 11.15 Proposition. Let F : A -> B be a map of Frobenius pairs [inducing an equivalence of derived categories; then it induces a homotopy equivalence of K-theory spaces].

### Agreement with Bass, Karoubi and Thomason, and the vanishing theorems

`GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K` · *theorem*

The groups this layer constructs are the classical ones: for a ring they are Bass's and Pedersen's negative K-groups, for a quasi-compact quasi-separated scheme they are Thomason's, and for an additive category they are Karoubi's and Pedersen and Weibel's, in every non-positive degree. The first negative group of an exact category has a presentation: it is the monoid of isomorphism classes of idempotents of the unbounded derived category under direct sum, modulo those that split, so it vanishes exactly when that category is idempotent complete. It vanishes for every small abelian category, and every negative group vanishes for a small noetherian abelian category; the vanishing for a regular ring follows, because the inclusion of the finitely generated projectives into the finitely generated modules is then a derived equivalence and the latter category is abelian. Negative G-theory of a noetherian scheme is therefore trivial. Whether all negative groups of an arbitrary small abelian category vanish is stated by the source as a conjecture, and this packet states it as such.

**Hypotheses.**

- The ring is arbitrary; the scheme is quasi-compact and quasi-separated, and for the comparison with vector bundles it admits an ample family of line bundles.
- Noetherian abelian means every object is noetherian; the proof runs through the categories of objects with an endomorphism and the nilpotent ones.
- The vanishing for a regular ring is deduced, not assumed, and is the theorem of Bass that the stage text names.

**Proof outline.**

1. Prove the agreement for schemes by the projective-line bundle theorem and the resulting four-term sequence, and deduce the ring case.
2. Prove the agreement with Karoubi's and Pedersen and Weibel's groups through the cone and suspension categories of an additive category, using that the cone is flasque.
3. Prove the presentation of the first negative group: identify it with the zeroth group of the unbounded derived category by the Eilenberg swindle on bounded-above and bounded-below complexes, then apply the classification of dense subcategories.
4. Prove the vanishing of the first negative group of a small abelian category, and then the vanishing of all of them for a noetherian abelian category by descending induction, using the sequence of the nilpotent endomorphism category, the polynomial category and the Laurent category together with additivity.
5. Deduce the vanishing for a regular ring and for negative G-theory of a noetherian scheme.
6. State the conjecture for a general small abelian category as a conjecture, together with the remark that commuting with filtered colimits does not reduce it to the noetherian case.

**Acceptance.**

- For a regular ring the negative K-groups vanish, which reproves Bass's theorem from this construction.
- The first negative group of an exact category vanishes exactly when its unbounded derived category is idempotent complete.
- The vanishing for a general small abelian category is a conjecture of the source and is recorded as one, not as a theorem.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings`

**Sources.**

- Theorem 7.1 and Remark 7.3, pp. 14 to 15, The agreement theorem, verbatim.

  > 7.1 Theorem. Let R be a ring. Then there are natural isomorphisms between Bass' and Pedersen's groups K_i(R) and the groups IK_i(R) defined in 5.4 for i <= 0. Let X be a quasi-compact and quasi-separated scheme, then there are natural isomorphisms between Thomason's groups K^B_i(X) and the groups IK_i(X) defined in 5.10 for i <= 0. Let A be an additive category, then there are natural ...

- Lemma 8.1 and Corollary 8.2, p. 15, The presentation of the first negative group, verbatim.

  > 8.1 Lemma. Let E be an exact category and D(E) its unbounded derived category. Then IK_{n-1}(E) = IK_n(Ch E, Ac E), n <= 0. In particular, IK_{-1}(E) = K_0(D(E)). ... 8.2 Corollary. The group IK_{-1}(E) is the quotient of the abelian monoid of isomorphism classes of idempotents in D(E), under direct sum operation, modulo the submonoid of those idempotents which split in D(E). In ...

- §9, Examples 9.5 and 9.6, Conjecture 9.7 and Remark 9.8, pp. 16 to 17, The vanishing theorems, the regular case and the conjecture, verbatim.

  > Descending induction on n starting with n = -1 (9.1) shows that IK_n(A) = 0, n < 0, for any noetherian abelian category A. ... 9.5 Example. Regular rings. Let R be a regular ring. Then the inclusion of the category of finitely generated projective R-modules into the category of all finitely generated R-modules induces an equivalence of bounded derived categories. As the latter category is ...

## K.7 — Invariance, products and universal interfaces

Three invariance statements and a product structure, with their compatibilities.

**The trap the stage text names.** Derived Morita invariance is a statement
about *enhanced* categories. K-theory is constructed from a category together
with its cofibrations and weak equivalences; the homotopy category forgets the
weak equivalences, and mapping cones in a triangulated category are not
functorial. So an equivalence of triangulated categories is not a sufficient
hypothesis, and the node that states the invariance carries the failure as an
explicit non-example. What does survive is the degree-zero part, for which Tau
Ceti's pinned `TauCeti.ExactK0.mapEquiv` is cited.

**The homotopies are data.** The associativity, unit and symmetry of the
external product are transported from the coherence isomorphisms of the tensor
product. A formalisation that asserts them, or that leaves them implicit, has
not built the product; the API of the product node lists them as items.

Coverage: **source_decomposed**.

Seven nodes. Morita invariance with the Structure Theorem, the matrix instance and the compatibility with products, resting on the three pinned Mathlib declarations the audit names and on the K-book’s statement in every degree for K and for G; the derived statement as a comparison node, which states the enhancement hypothesis in Schlichting’s precise form — a map of Frobenius pairs inducing an equivalence of derived categories, not an equivalence of triangulated categories — records that the K-theory construction consumes a category with cofibrations and weak equivalences rather than a homotopy category, and gives the failure of the naked form as a non-example, while keeping the degree-zero part that does survive and citing Tau Ceti’s pinned exact-equivalence invariance for it; compatibility with filtered colimits and with finite products, with the K-book’s proof for every degree of the connective theory and Schlichting’s for the non-positive range of the nonconnective one; the external products from biexact functors, with the definition for exact categories, the map out of the Q-construction, the spectrum-level pairing and its ring- and module-spectrum hypotheses stated as natural isomorphisms of functors, and with the associativity, unit and symmetry homotopies carried as transported data rather than asserted; graded commutativity of the total K-group, with the degree-one specialisation and the link to the splitting of K.6’s fundamental theorem; the compatibilities with relative groups, localisation boundaries and transfers, each stated as a separate assertion with its own proof obligation; and the two unit tests the stage text names. Every stage target has a node. What is stated rather than proved is the construction of the spectrum-level pairing, which the K-book attributes to Waldhausen; the gap records that and names the next source action.

### Morita invariance

`GeneralAlgebraicKTheory:K.7/morita-invariance` · *theorem* · planet **Morita invariance**

Two rings are Morita equivalent when their module categories are equivalent; the structure theorem says that this happens exactly when there is a finitely generated projective generator of one whose endomorphism ring is the other, and that the equivalence is then given by tensoring against a bimodule. Since K-theory is defined from the category of finitely generated projective modules, and an equivalence of module categories restricts to an equivalence of those subcategories, Morita equivalent rings have isomorphic K-groups in every degree, connective and negative alike. The standard instance is the matrix ring: the ring and its ring of n by n matrices are Morita equivalent, so their K-theories agree. The isomorphism is induced by an equivalence of categories, so it is compatible with everything this layer asserts, in particular with the products.

**Hypotheses.**

- R and S are rings, not necessarily commutative; the module categories are of right modules, as the source has them.
- The equivalence is an additive equivalence of abelian categories; Morita theory says that every such equivalence is of the tensor form.
- Both pinned instances, the matrix equivalence of module categories and the Morita predicate with its matrix instance, exist in Mathlib and are cited, so the node is a comparison for them rather than a construction.

**Proof outline.**

1. Record the pinned material: the equivalence between modules over a ring and modules over its matrix ring, the Morita equivalence predicate and its matrix instance.
2. State the structure theorem in the source's form: an equivalence is given by tensoring against a bimodule, the bimodule is a finitely generated projective generator, and the other ring is its endomorphism ring.
3. Deduce that the equivalence restricts to the finitely generated projective modules and is exact, so it induces isomorphisms on all K-groups.
4. Record the instance for matrix rings and the source's exercise that the matrix ring over a ring is Morita equivalent to it.
5. State the compatibility with products: the induced isomorphism is a ring isomorphism for the product structure of the next nodes, because the equivalence is monoidal for the relevant tensor.
6. Record the source's remark that the Morita equivalence classes are not the isomorphism classes, so the statement has content.

**Acceptance.**

- The ring and its n by n matrix ring have isomorphic K-groups in every degree.
- A Morita equivalence induces an isomorphism compatible with the products.
- Morita equivalent rings need not be isomorphic, so the theorem is not a triviality.

**Prerequisites.** `mathlib:ModuleCat.matrixEquivalence`, `mathlib:IsMoritaEquivalent`, `mathlib:IsMoritaEquivalent.matrix`, `mathlib:Matrix`, `tauceti:TauCeti.ExactK0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `KTheory.moritaEquiv` | data | The induced isomorphism of K-groups from a Morita equivalence. |
| `KTheory.moritaEquiv_matrix` | example | The instance for the matrix ring. |
| `KTheory.moritaEquiv_mul` | compatibility | The isomorphism respects the external products. |
| `moritaStructure` | characterisation | The structure theorem: the equivalence is tensoring against a projective generator. |
| `KTheory.moritaEquiv_negative` | compatibility | The isomorphism holds in negative degrees as well. |

**Used by.**

- *K.6* — One of the four axioms for negative K-theory is matrix invariance, which this node supplies in the finite case.
- *K.7, the products* — The compatibility statement is what lets a computation be transported along a Morita equivalence.
- *The libraries* — Mathlib has the predicate and the matrix instance; what is missing is the K-theoretic consequence.

**Unit tests.**

- `matrix_invariance` — The K-groups of a ring and of its matrix ring agree.
- `not_isomorphism` — Morita equivalent rings need not be isomorphic, so the statement is not vacuous.
- `respects_product` — The induced isomorphism carries the external product to the external product.
- `negative_degrees` — The isomorphism holds in negative degrees.

**Sources.**

- II.2.7, the structure theorem (PDF p. 110), The structure theorem, verbatim.

  > Structure Theorem for Morita Equivalence 2.7. If mod-R and mod-S are equivalent, and P is the projective corresponding to S, then P is a finitely generated projective generator of mod-R, and S is isomorphic to End_R(P); the equivalence is given by tensoring with P.

- II.2.7.1 (PDF p. 111), The consequence in degree zero, verbatim; the same argument gives every degree.

  > Corollary 2.7.1. If R and S are Morita equivalent rings then K_0(R) is isomorphic to K_0(S).

- II.2.7.2 (PDF p. 111), The matrix instance, verbatim.

  > Example 2.7.2. R is Morita equivalent to the matrix ring M_n(R) for every n, since the free module R^n is a projective generator with endomorphism ring M_n(R).

- IV.6.3.5 (PDF p. 320), The statement in every degree, for K-theory and for G-theory, verbatim.

  > Morita Invariance 6.3.5. Recall from II.2.7 that if two rings R and S are Morita equivalent then there are equivalences P(R) = P(S) and M(R) = M(S). It follows that K_n(R) = K_n(S) and G_n(R) = G_n(S) for all n.

### Derived invariance needs an enhancement, not a triangulated equivalence

`GeneralAlgebraicKTheory:K.7/derived-morita-and-enhancements` · *comparison*

At the derived level the invariance statement is about enhanced categories: K-theory is invariant under an equivalence of the underlying differential graded or stable categories of perfect complexes, and the enhancement is part of the hypothesis. A bare equivalence of triangulated categories is not enough, because the K-theory of a Waldhausen category is built from the category with its cofibrations and weak equivalences, not from the homotopy category alone, and mapping cones in a triangulated category are not functorial. This node states what the correct hypothesis is, records the failure of the naked form as a non-example, and says exactly which data a formalisation must carry. The stage text names this as the trap of the layer.

**Hypotheses.**

- The categories are the perfect complexes over the rings, with their standard Waldhausen structure.
- The hypothesis is an equivalence of enhancements: a quasi-equivalence of differential graded categories, or an equivalence of the associated stable infinity-categories.
- Neither pinned library has enhanced categories or a K-theory of them, which is recorded here as the reason the node is a comparison and not a construction.

**Proof outline.**

1. Record the source's construction of K-theory from a category with cofibrations and weak equivalences, so that it is visible which data the construction consumes.
2. State the invariance: an exact equivalence of Waldhausen categories induces a homotopy equivalence of K-theory spectra, and more generally an equivalence of enhancements does.
3. State the non-example: a triangulated equivalence of homotopy categories does not by itself induce an isomorphism on K-theory, because the homotopy category forgets the weak equivalences that the construction uses.
4. Record the elementary part that does survive: an equivalence of homotopy categories does induce an isomorphism on the zeroth K-group, since that group depends only on the triangulated structure.
5. Name the data a formalisation must carry: the category, its cofibrations, its weak equivalences, and the functor's exactness, and record that dropping any of them breaks the statement.

**Acceptance.**

- An exact equivalence of Waldhausen categories induces a homotopy equivalence on K-theory, in every degree.
- A triangulated equivalence induces an isomorphism on the zeroth group but is not sufficient for the higher groups.
- Tau Ceti's pinned exact-equivalence invariance for the zeroth group is the degree-zero shadow of this statement and is cited as baseline.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/morita-invariance`, `tauceti:TauCeti.ExactK0.mapEquiv`, `mathlib:CategoryTheory.Functor.IsEquivalence`

**Sources.**

- II.9.1.1 and II.9.1.2 (PDF pp. 158 to 159), The data the construction consumes, verbatim.

  > Definition 9.1.1. A category with cofibrations is a category C with a distinguished zero object, together with a subcategory co(C) whose morphisms are called cofibrations. Definition 9.1.2. A Waldhausen category C is a category with cofibrations, together with a family w(C) of morphisms in C called weak equivalences.

- II.9.6.1 (PDF p. 163), The correct form of the invariance, verbatim.

  > If F from C to D is an exact functor which is an equivalence of Waldhausen categories, then it induces an isomorphism on K_0 and a homotopy equivalence of K-theory spectra.

- Proposition 11.15 with Definition 11.1, pp. 20 and 23, The enhanced statement in the precise form this node asks for: the hypothesis is a map of MODELS inducing an equivalence of derived categories, not an equivalence of the derived categories alone. The bracketed words supply from the surrounding text what the scan drops.

  > 11.1 Definition. Let A be a Frobenius pair. Its associated category with cofibrations and weak equivalences has as cofibrations the inflations in A and as weak equivalences the maps in A which are isomorphisms in D A. ... 11.15 Proposition. Let F : A -> B be a map of Frobenius pairs [inducing an equivalence of derived categories; then it induces a homotopy equivalence of K-theory spaces].

### Compatibility with filtered colimits and with finite products

`GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products` · *theorem*

K-theory commutes with filtered colimits of rings: the natural map from the colimit of the K-groups to the K-group of the colimit ring is an isomorphism in every degree. It also carries finite products of rings to products of groups, the map being induced by the two projections; this is the statement that the K-theory of a product ring splits as the product of the K-theories, and it holds because a finitely generated projective module over a product ring is a pair of such modules. Both statements hold in the nonconnective theory, and the second is used to reduce computations for semilocal and artinian rings.

**Hypotheses.**

- The colimit is over a filtered system of rings and ring maps; the colimit is taken in rings.
- The product is a finite product; infinite products are not claimed, and the source records that they behave differently.
- The pinned library has filtered colimits of categories but not the K-theoretic statement, which the audit records.

**Proof outline.**

1. Prove the product statement: the category of finitely generated projective modules over a finite product ring is equivalent to the product of the categories, and the K-theory construction carries that equivalence to a product of groups.
2. Prove the colimit statement in degree zero from the corresponding statement for finitely generated projective modules, namely that every one over the colimit is induced from a finite stage and that two become isomorphic at a finite stage.
3. State the general-degree form and record that it follows from the same finiteness argument applied to the construction, with the source's pointer.
4. State both in the nonconnective theory, using that the construction of the negative groups is by cokernels of maps of groups and hence commutes with filtered colimits and finite products.
5. Record the standard consequence: the K-theory of an infinite matrix ring is the colimit of the K-theories of the finite ones, which is the shape in which the fourth axiom of K.6 is checked.

**Acceptance.**

- The K-groups of a finite product ring are the products of the K-groups.
- The K-groups of a filtered colimit are the colimits of the K-groups.
- Neither statement is claimed for infinite products; the source records that those are different.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/morita-invariance`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- II.2.1.2 and the product statement (PDF p. 105), The product statement, verbatim.

  > If R = R_1 x R_2, then every finitely generated projective R-module is a product P_1 x P_2, and K_0(R) is isomorphic to K_0(R_1) x K_0(R_2).

- IV.6.4 (PDF p. 320), Both statements in every degree, with the proofs, verbatim from the Q-construction chapter.

  > The product or direct sum of two exact categories is exact, and Q(A + A') = QA x QA'. Since the geometric realization preserves products, we have BQ(A + A') = BQA x BQA' and hence K_n(A + A') = K_n(A) + K_n(A'). For example, if R_1 and R_2 are rings then P(R_1 x R_2) = P(R_1) + P(R_2) and we have K_n(R_1 x R_2) = K_n(R_1) + K_n(R_2). ... Finally, suppose that i -> A_i is a functor from ...

- Lemma 6.3 and Corollary 6.4, pp. 13 to 14, The same statement in non-positive degrees, verbatim; the two together cover every degree.

  > 6.3 Lemma. Let i -> A_i be a functor from a small, filtered index category I to the category of Frobenius pairs. Then colim A_i is a Frobenius pair and the natural map colim IK_n(A_i) -> IK_n(colim A_i) is an isomorphism for n <= 0. 6.4 Corollary. Let E_i be a diagram of exact categories and exact functors indexed over a filtered category I. Then the natural map colim IK_n(E_i) -> ...

### External products from biexact functors

`GeneralAlgebraicKTheory:K.7/products-from-biexact-functors` · *construction* · planet **External products in K-theory**

A functor of two variables that is exact in each variable separately induces a bilinear pairing of the zeroth K-groups, sending the pair of classes to the class of the value, and more generally a pairing of the K-theory spectra. For rings and the tensor product over a commutative base this gives the external product from the K-groups of two algebras to those of the tensor product algebra, and for a single commutative ring the internal product that makes the total K-group a graded ring. The construction is by a biexact functor of the relevant categories and carries associativity, unit and symmetry homotopies from the corresponding coherence of the tensor product; those homotopies are the data that must be carried, not consequences to be rediscovered.

**Hypotheses.**

- A and B are exact categories and the functor is biexact, meaning exact in each variable when the other is fixed.
- For the ring case the tensor product is over a fixed commutative base and the modules are finitely generated projective over the respective algebras.
- The unit is the class of the base ring as a module over itself, and the symmetry is the swap of the two factors.

**Proof outline.**

1. State the biexactness condition and the induced bilinear map on the zeroth groups, with the source's formula for the value.
2. Record the source's application to the tensor product: for algebras over a commutative ring the tensor product is biexact on finitely generated projectives and gives the external product.
3. Specialise to a single commutative ring to obtain the internal product and prove that the zeroth K-group becomes a commutative ring with unit the class of the ring.
4. Record the associativity, unit and symmetry homotopies as data: they come from the corresponding coherence isomorphisms of the tensor product, and a formalisation must transport them rather than assume them.
5. Record Tau Ceti's pinned degree-zero product statement as the baseline instance and say exactly what it does and does not give.
6. Record the source's other applications of the same machine, in particular the pairing that makes the Nil groups a module over the zeroth K-group.

**Acceptance.**

- The zeroth K-group of a commutative ring is a commutative ring with unit the class of the ring itself.
- The pinned Tau Ceti statement that the class of a tensor product is the product of the classes is the degree-zero instance and is cited, not reproved.
- The pairing is bilinear, so it is determined by its values on classes of modules, which is what makes it computable.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products`, `tauceti:TauCeti.SplitK0.of_mul_of`, `tauceti:TauCeti.SplitK0`, `mathlib:TensorProduct`

**API.**

| name | role | statement |
| --- | --- | --- |
| `KTheory.biexactPairing` | data | The pairing induced by a biexact functor. |
| `KTheory.externalProduct` | data | The external product of the K-groups of two algebras. |
| `KTheory.mul` | data | The internal product for a commutative ring. |
| `KTheory.mul_assoc` | compatibility | The associativity homotopy. |
| `KTheory.mul_one` | compatibility | The unit homotopy, with unit the class of the ring. |
| `KTheory.mul_comm_graded` | compatibility | The symmetry homotopy, giving graded commutativity. |

**Used by.**

- *K.7, graded commutativity* — The symmetry homotopy is what produces the sign in the commutativity of the total K-group.
- *K.7, compatibilities* — The product is asserted compatible with relative groups, boundaries and transfers.
- *SchemeKTheoryOperations S.6* — The scheme-level external product is the same construction for a different input.

**Unit tests.**

- `K0_is_a_ring` — The zeroth K-group of a commutative ring is a commutative ring.
- `unit_is_the_class_of_R` — The unit of the product is the class of the ring as a module over itself.
- `tensor_of_classes` — The product of the classes of two modules is the class of their tensor product; this is the pinned Tau Ceti statement.
- `homotopies_are_data` — The associativity and symmetry are given by transported coherence isomorphisms, not asserted.

**Sources.**

- II.7.4 (PDF p. 145), The construction, verbatim.

  > Products 7.4. Let A, B and C be exact categories, and suppose given a functor T from A x B to C which is biexact, meaning that T(A,-) and T(-,B) are exact functors for every A and B. Then T induces a bilinear map from K_0(A) tensor K_0(B) to K_0(C), sending the class of A tensor the class of B to the class of T(A,B).

- II.9.5.2 (PDF p. 162), The spectrum-level version, verbatim.

  > A functor of two variables between Waldhausen categories is called biexact if it is exact in each variable and satisfies the additional condition on cofibrations; such a functor induces a pairing of K-theory spectra.

- II.7.4.1 (PDF p. 146), The instance that gives the ring structure, verbatim.

  > Application 7.4.1. The tensor product of modules over a commutative ring R is biexact on finitely generated projective modules, and the induced product makes K_0(R) a commutative ring.

- IV, Definition 6.6 (PDF p. 321), The definition for exact categories and the map out of the Q-construction that produces the higher product, verbatim.

  > Definition 6.6. If A, B and C are exact categories, a functor from A x B to C is called biexact if (i) each partial functor is exact, and (ii) A (x) 0 = 0 (x) B = 0 for the distinguished zero objects. ... Given such a biexact functor, the bicategory map QA (x) QB -> bi(QC) factors through the forgetful functor QQC -> bi(QC).

- IV, the pairing of spectra (PDF p. 342), The spectrum-level pairing with the associativity and commutativity hypotheses stated as natural isomorphisms of functors, verbatim.

  > It also induces a morphism of bisimplicial bicategories wS.A x wS.B -> wwS.S.C ... K(A) ^ K(B) -> K(C) of spectra. If A x A -> A is not only biexact but associative up to natural isomorphism, the pairing makes K(A) into a ring spectrum; it is a commutative ring spectrum if the pairing is commutative up to natural isomorphism. If in addition, A x B -> B is biexact and A x A x B -> B is ...

### The total K-group is a graded-commutative ring

`GeneralAlgebraicKTheory:K.7/graded-commutativity` · *theorem*

For a commutative ring the internal product makes the direct sum of the K-groups a graded ring, and the symmetry homotopy makes it graded commutative: the product of a class in degree p and one in degree q equals minus one to the power p times q times the product in the other order. In degree one the statement specialises to the anticommutativity of the symbol of two units, and the product of a class in degree zero with one in degree one is given by the action of the zeroth K-group. The sign is a consequence of the symmetry of the tensor product together with the sign rule of the smash product of spheres, and it is not a convention that can be chosen.

**Hypotheses.**

- R is commutative; the total K-group is the direct sum over non-negative degrees, or over all degrees in the nonconnective theory.
- The sign comes from the symmetry homotopy of the previous node and from the standard sign of the graded smash; the node records both contributions.
- The pinned libraries have no first K-group at all, which the audit records, so the degree-one specialisation cannot be stated against them.

**Proof outline.**

1. State the graded ring structure and the graded commutativity with the sign.
2. Specialise to two classes in degree one: the symbol of two units is the inverse of the symbol in the other order.
3. Specialise to degrees zero and one: the product is the module action of the zeroth K-group, and multiplication by the class of the ring is the identity.
4. Record the source's statement that the first K-group of the Laurent polynomial ring over the integers contains the class of the variable and that multiplication by it is the splitting of the fundamental theorem, so the product structure and K.6 are linked.
5. Record the non-example: for a non-commutative ring there is no internal product of this kind, only the external one, and the graded ring statement fails.

**Acceptance.**

- The total K-group of a commutative ring is graded commutative.
- In degree one the symbol is anticommutative, which is the classical statement.
- Multiplication by the class of the variable in the first K-group of the integral Laurent ring is the splitting of K.6's fundamental theorem.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `SchemeKTheoryOperations:S.6`

**Sources.**

- IV.1 and the product structure (PDF p. 302), The graded commutativity, verbatim.

  > The product on K_*(R) for a commutative ring R is graded-commutative: for x in K_p and y in K_q we have x y = (-1)^{pq} y x.

- V.8.2 (PDF p. 430), The link between the product structure and the fundamental theorem, verbatim.

  > [The splitting of the boundary is] given by multiplication by t in K_1(Z[t,t^{-1}]).

### Compatibility of the product with relative groups, boundaries and transfers

`GeneralAlgebraicKTheory:K.7/compatibility-with-relative-groups-and-transfers` · *lemma*

The external product is compatible with the other structure of the theory. It descends to relative groups, so that the product of an absolute class and a relative class is relative; it commutes with the boundary maps of the localisation sequences up to the expected sign, which is the statement that the boundary is a derivation for the product; and it satisfies the projection formula for a transfer, namely that the transfer of a product of a class pulled back along the map with a class upstairs equals the product of the first with the transfer of the second. Each is a separate assertion with its own proof and none follows from the construction of the product alone.

**Hypotheses.**

- The relative groups are those of a ring map or of an ideal, as the source defines them.
- The boundary maps are those of the localisation and Mayer-Vietoris sequences.
- The transfer is the one attached to a finite map with the appropriate finiteness hypothesis, which the node records rather than assumes.

**Proof outline.**

1. State the relative compatibility and record which pairing it refers to.
2. State the derivation property of the boundary with respect to the product, with the sign.
3. State the projection formula for a transfer, with the hypothesis on the map under which the transfer exists.
4. Record that each of the three is used elsewhere in the atlas: the derivation property in the localisation sequences, the projection formula in the transfer arguments.
5. Record what is not claimed: no compatibility with an infinite product, and no statement about a transfer along a map that is not finite.

**Acceptance.**

- The boundary of a product is given by the derivation formula with the expected sign.
- The projection formula holds for a finite map.
- None of the three follows from bilinearity alone; each is a separate statement.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.7/graded-commutativity`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`

**Sources.**

- II.7.4.4 (PDF p. 146), One instance of the module-structure compatibility, verbatim.

  > Application 7.4.4. The Nil category of a ring is an exact category, and the product makes Nil_0(R) a module over K_0(R).

- II.9.5.2 (PDF p. 162), The compatibility at the spectrum level, verbatim.

  > [A biexact functor of Waldhausen categories] induces a pairing of K-theory spectra, compatible with the structure maps.

### The K-zero tensor comparison and multiplication by a unit in K-one

`GeneralAlgebraicKTheory:K.7/unit-multiplication-and-K0-tensor-comparison` · *lemma*

Two concrete consequences of the product structure serve as the unit tests of the layer. First, the comparison in degree zero: the product of the classes of two finitely generated projective modules is the class of their tensor product, so that the map from the tensor square of the zeroth K-group to itself is determined on classes; Tau Ceti has exactly this statement for the split model and it is cited as baseline. Second, multiplication in degree one: the product of the class of a unit in the first K-group with a class in the zeroth K-group is computed by the action, and in particular multiplication by the class of a unit of the base ring is an automorphism of each K-group, inverse to multiplication by the inverse unit. The second cannot be stated against the pinned libraries, which have no first K-group.

**Hypotheses.**

- R is commutative; the modules are finitely generated projective.
- The unit is an element of the unit group of the ring, and its class in the first K-group is its image under the determinant-like map.
- The audit records that the first K-group is absent from both pinned trees, so the second statement has no baseline and must be built.

**Proof outline.**

1. State the degree-zero comparison and cite the pinned Tau Ceti statement for the split model.
2. Record the gap between the split model and the general one: the pinned statement is for the split K-zero and a comparison with the exact-category model is needed before it can be used in general.
3. State the degree-one multiplication and prove that multiplication by a unit is invertible, with the inverse given by the inverse unit.
4. Record that these two are the unit tests by which a formalisation of the product is checked, and that failing either means the construction is wrong.
5. Record the source's statement of the map from units to the first K-group, and the fact that it is an isomorphism for a commutative local ring, which is where the second test is most easily checked.

**Acceptance.**

- The product of two classes is the class of the tensor product; this is the pinned Tau Ceti statement for the split model.
- Multiplication by the class of a unit is an automorphism of each K-group.
- Neither statement can be checked in degree one against the pinned libraries, since the first K-group is absent there.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `tauceti:TauCeti.SplitK0.of_mul_of`, `tauceti:TauCeti.SplitK0`

**Sources.**

- II.7.4.1 (PDF p. 146), The degree-zero comparison, verbatim.

  > Application 7.4.1. The tensor product of modules over a commutative ring R is biexact on finitely generated projective modules, and the induced product makes K_0(R) a commutative ring.

- III.1.1 and III.1.2 (PDF p. 190), The unit map in degree one, verbatim.

  > The determinant gives a map from K_1(R) to the units of R for a commutative ring, split by the map sending a unit u to the class of the automorphism of R given by multiplication by u; for a commutative local ring this map is an isomorphism.

## Gaps

### Schlichting section 10 and Appendix A were not read

Needed by: `GeneralAlgebraicKTheory:K.6`.

The IK-spectrum node rests on the fact that the Waldhausen category attached to a Frobenius pair admits a factorisation of every map into a cofibration followed by a weak equivalence, which the source supplies in Appendix A in place of Waldhausen’s cylinder functor, and on the fibration and approximation theorems proved there. Appendix A was not read, so the node records the hypothesis and its role but does not decompose its proof. Section 10, on exact versus additive K-theory and the homotopy fibre of the map from the split exact category, was also not read; it is what would justify the source’s remark that the conjecture of section 9 would give an isomorphism between the split and the ambient negative groups. NEXT SOURCE ACTION: read Appendix A (pp. 24 to 27) and decompose the non-functorial factorisation together with the approximation and fibration theorems it proves; then read section 10 (pp. 18 to 19).

### The proofs of the spectrum-level localisation and cofinality statements were not read

Needed by: `GeneralAlgebraicKTheory:K.6`.

Theorem 11.10 (the homotopy cartesian square and the long exact sequence in all degrees), Proposition 11.15 (derived invariance) and Proposition 11.17 (cofinality) were read as statements and are quoted as such; their proofs, which occupy pp. 22 to 24 and use the approximation property, were not read. The proof of Theorem 11.7, which computes the homotopy groups, was read. NEXT SOURCE ACTION: read pp. 22 to 24 in full and decompose the three proofs, which will also settle the saturation hypothesis the source mentions in passing at 11.13.

### The construction of the spectrum-level product is deferred by the source

Needed by: `GeneralAlgebraicKTheory:K.7`.

The K-book gives the definition of a biexact functor for exact categories and for Waldhausen categories, the map out of the Q-construction, and the resulting pairing of spectra with the hypotheses under which it makes K a ring spectrum, but refers to Waldhausen for the construction of the pairing itself. The bilinear pairing on the zeroth groups is constructed in full at II.7.4 and is decomposed here; the higher-degree pairing is stated with its attribution and its coherence is listed as data to be carried, not as something proved. NEXT SOURCE ACTION: read Waldhausen, ‘Algebraic K-theory of spaces’ section 1.5, for the construction of the pairing and for the associativity and unit coherence.

### No counterexample was read for the failure of naked triangulated invariance

Needed by: `GeneralAlgebraicKTheory:K.7`.

The comparison node now states the correct hypothesis in two forms — an exact equivalence of Waldhausen categories, and a map of Frobenius pairs inducing an equivalence of derived categories — and supports the second with Schlichting’s Proposition 11.15. What is still asserted without a source is the negative half: that an equivalence of triangulated categories alone does not suffice. The node argues it from the fact that the construction consumes the weak equivalences rather than the homotopy category, which is a reason but not a counterexample. NEXT SOURCE ACTION: read Schlichting’s ‘A note on K-theory and triangulated categories’ (Invent. Math. 150, 2002) for the counterexample, and record it as its own non-example node.

### The proof of the Fundamental Theorem was not read, only its statement

Needed by: `GeneralAlgebraicKTheory:K.6`.

V.8.1, V.8.2 and V.8.3 were read as statements, together with the section opening that gives the degenerate form for a regular noetherian ring. The proofs in V.8, which go through the localisation sequence for the polynomial ring and the identification of the Nil category, were not read, so the proof steps of the fundamental-theorem node record the shape of the argument rather than its details. NEXT SOURCE ACTION: read V.8 in full (PDF pp. 430 to 436) together with III.3.6, and decompose the proof into its two halves, the localisation input and the Nil identification.

## Requests

- **`SchemeKTheoryOperations:S.5`** — The Fundamental Theorem with Nil terms for schemes. AUDIT-28 records this as a duplication with K.6 and names S.5 as the owner of the scheme form. This packet states the ring form, which is what K.6's stage text asks for, and cites S.5 for the scheme form rather than planning it again; the source's V.8.3 is quoted so that the boundary is visible.

- **`SchemeKTheoryOperations:S.6`** — External products for schemes and the graded commutativity of the total K-group of a scheme. AUDIT-28 records this as a duplication with K.7. The ring-level product is developed here, from biexact functors, and the scheme-level statement is imported by name.

- **`GeneralAlgebraicKTheory:K.3`** — The K-theory of a Waldhausen category as a spectrum, with the additivity and localisation theorems. K.6's nonconnective construction takes a functorial model of connective K-theory as input and K.7's invariance and product statements are statements about that model; both are stated here against the model rather than re-constructing it.

- **`GeneralAlgebraicKTheory:K.5`** — The localisation sequence in the connective theory, whose boundary maps K.6 extends into negative degrees and with which K.7's compatibility node asserts the derivation property of the product.

- **`K2SymbolsBrauer:T.6`** — The first and second K-groups with their symbols. K.7's degree-one unit test needs the class of a unit in the first K-group and the anticommutativity of the symbol; neither pinned library has the first K-group at all, and T.6 is where the symbols are owned.

## Structural proposals

### The two duplications AUDIT-28 records are boundaries, not overlaps to remove

*note-duplicate-boundary*

AUDIT-28 records SchemeKTheoryOperations S.5 as duplicating K.6's fundamental theorem and S.6 as duplicating K.7's external products. Read against the source these are not duplications but the ring and scheme forms of the same theorem, and the source states them separately for exactly that reason: V.8.2 for rings and V.8.3 for quasi-projective schemes. The right resolution is the one taken here, that the ring form is proved in this roadmap and the scheme form imported from the scheme roadmap, and the stage texts of K.6 and S.5 should each say so in a sentence. No layer should be dropped on this account.

### K.6 carries two independent developments and could be split

*propose-split*

K.6's stage text asks both for Bass's negative groups with the fundamental theorem, which is pure algebra and needs no homotopy theory, and for the nonconnective spectrum, which needs spectra, homotopy colimits and connective covers, none of which exists in either pinned library. The first half is formalisable against the pins today; the second is blocked on a library of spectra. As one layer it cannot be closed until the homotopy theory arrives, and a reader cannot see that the algebraic half is independently available. Splitting into a negative-K-groups layer and a nonconnective-spectrum layer would make that visible; the eight nodes here divide five to three along exactly that line.

### The name 'flasque' is taken in both pinned libraries by a different notion

*note-naming-collision*

Both trees have IsFlasque for the sheaf-theoretic predicate, and K.6 needs Karoubi's flasque rings, which are unrelated. The packet records the collision in the node, in its unit tests and here, because a formalisation that reused the name would produce a statement that reads as true and means something else. A name such as IsFlasqueRing, or Karoubi's own terminology of an infinite sum ring where that stronger notion suffices, should be fixed before any of this layer is written.

## What this blueprint does not claim

No Lean was compiled for this job. The Mathlib build on this machine is a shared
cache that must not be rebuilt, and this working tree has no elaborated
dependency modules. Every `implementationStatus` is `unchecked`, the suggested
Lean file is a naming proposal whose proofs are all `sorry`, and nothing here is
claimed to be formalised.

Seventeen excerpts ran past four hundred characters and were elided at a word
boundary, marked with an ellipsis; the locators name the pages so the full text
can be read in the source.
