# GeneralAlgebraicKTheory — K.6 and K.7

The blueprint for the nonconnective extension (K.6) and for invariance, products
and universal interfaces (K.7). This document is definitive; the packet
`research/blueprint/packets/GeneralAlgebraicKTheory--K.6.json` is its machine
form and the suggested Lean file is a naming proposal, not an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

Revised by FIX-RT-AREA-ktheory-1 for the red-team findings RT-AREA-ktheory-1/4, /17,
/18 and /19; the revision awaits independent review, and the packet's earlier
accepted review is kept as it was. The revision adds the ring-level inputs of the
Fundamental Theorem (the projective line over an associative ring as a gluing
category, the Nil groups, the localisation at t), the contracted negative groups
and their identification with the Bass spectrum, and excision for Milnor squares
in degrees at most zero; it hands the scheme clauses of the agreement and
vanishing theorems to SchemeKTheoryOperations S.5 and S.2; it makes K.7 the only
owner of the K-theoretic pairing; and it makes both layers import the early ring
functor of K.2:plus instead of restating it. Every node section below is rendered
from the packet.

## The sources

Three, all freely available:

> Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
> <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>,
> SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, accessed 2026-09-24.

> Marco Schlichting, *Negative K-theory of derived categories*. Author preprint dated 16 June 2003, 28 pages; the published version (Math. Z. 253, 2006) was not compared.
> <https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf>,
> SHA-256 `f59620e3ba25d5a8591a108d2b9647b68b5caf04794745862d2aa71e178b5aa6`, accessed 2026-09-24.

> Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*. arXiv:1803.10897v2 (20 July 2020, the revised and final version); published in J. Amer. Math. Soc. 34 (2021), 411–473, which was not compared.
> <https://arxiv.org/pdf/1803.10897v2>,
> SHA-256 `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`, accessed 2026-09-30.

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
- FIX-RT-AREA-ktheory-1, 2026-09-30: the same file (SHA-256 reproduced) read through its text layer at printed pages (PDF page = printed + 8): II.7.4.4 (p. 133), II.7.7.2 to II.7.8.4 (pp. 137 to 138); III.2.2.1, III.2.3, III.2.6 and Ex. III.2.1 to 2.6 (pp. 193 to 196); III.3.5.3, III.3.6, III.3.7 and III.3.8.1 with proofs (pp. 205 to 207); III.4.1 to III.4.5 with Ex. III.4.1 to 4.7 (pp. 210 to 215); IV.1.10.2 (p. 267), Ex. IV.1.23 (p. 276), Ex. IV.4.14 (p. 311), IV.6.7 (pp. 323 to 324), IV.8.11 (p. 342), IV.10.1 to IV.10.6 and Ex. IV.10.1 (pp. 349 to 351); V.1.5 to V.1.5.4 with proofs and Ex. V.1.1 to 1.10 (pp. 369 to 375), V.3.5.1 (p. 388), Ex. V.3.13 and 3.14 (p. 399), V.7.1 and V.7.1.1 (pp. 420 to 421), Ex. V.7.5 to 7.7 (pp. 429 to 430), V.8.1 and V.8.2 with proofs, V.8.3 and V.8.4 (pp. 430 to 432), and Ex. V.8.1 (p. 434).

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
- FIX-RT-AREA-ktheory-1, 2026-09-30: the same file (SHA-256 reproduced) re-read at §7, pp. 14 to 15: Theorem 7.1 with its whole proof and Remarks 7.2 and 7.3, to separate the ring and additive-category clauses from the scheme clause.

### Clausen–Mathew–Morrow: what was read

The file's SHA-256 reproduces the value the paper extraction PAPER-CLAUSEN-MATHEW-MORROW-21 records for arXiv v2.

- p. 35 of the arXiv v2 PDF, through its text layer: Theorem 4.33, Proposition 4.34 with its proof, and Corollary 4.35. The text layer drops the blackboard-bold font, so 𝕂 (nonconnective K-theory) and 𝔽 are restored from the sentences that name them.
- NOT read: the rest of the paper, and Bass's Algebraic K-theory, Theorem XII.8.3, which Proposition 4.34 cites.

## What the pinned libraries already have

The reviewed audit `AUDIT-28` records both layers as *not built*, and the
declaration index confirms each of its claims. What exists at the pins, and is
therefore cited rather than planned:

- `mathlib:CategoryTheory.Functor.IsEquivalence` (`Mathlib/CategoryTheory/Equivalence.lean`) — Equivalence of categories, the hypothesis of the invariance statements; the enhanced version K.7 needs is not pinned and the comparison node says so.
- `mathlib:CategoryTheory.Idempotents.Karoubi` (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean`) — The idempotent completion, which the stage text names as one of the three enlargements; it exists at the pin, so K.6 cites it rather than building it.
- `mathlib:CategoryTheory.Limits.HasFilteredColimits` (`Mathlib/CategoryTheory/Limits/Filtered.lean`) — Filtered colimits, pinned at the level of categories; the K-theoretic commutation statement is what K.7 adds.
- `mathlib:CategoryTheory.ObjectProperty.IsTriangulated` (`Mathlib/CategoryTheory/Triangulated/Subcategory.lean`) — Triangulated subcategories, pinned; the input to a Verdier quotient, which is not itself pinned.
- `mathlib:CategoryTheory.ObjectProperty.trW` (`Mathlib/CategoryTheory/Triangulated/Subcategory.lean`) — The class of maps whose cone lies in a triangulated subcategory, pinned; the morphisms a Verdier quotient inverts.
- `mathlib:IsMoritaEquivalent` (`Mathlib/RingTheory/Morita/Basic.lean`) — The Morita equivalence predicate, pinned; K.7 supplies the K-theoretic consequence, which is absent.
- `mathlib:IsMoritaEquivalent.matrix` (`Mathlib/RingTheory/Morita/Matrix.lean`) — The instance that a ring is Morita equivalent to its matrix ring, pinned and cited by the invariance node.
- `mathlib:IsNilpotent` (`Mathlib/Algebra/GroupWithZero/Basic.lean`) — Nilpotence of an element (some power is zero), the condition on the endomorphisms of the Nil category.
- `mathlib:LaurentPolynomial` (`Mathlib/Algebra/Polynomial/Laurent.lean`) — The Laurent polynomial ring, the third term of that sequence and the ring whose K-theory the fundamental theorem decomposes.
- `mathlib:Matrix` (`Mathlib/LinearAlgebra/Matrix/Defs.lean`) — Matrices, out of which the cone ring and the infinite matrix ring of the flasque and axiom nodes are built.
- `mathlib:ModuleCat` (`Mathlib/Algebra/Category/ModuleCat/Basic.lean`) — The category of modules over a ring, not necessarily commutative; the components of the glued triples of the projective line over a ring live in it.
- `mathlib:ModuleCat.matrixEquivalence` (`Mathlib/RingTheory/Morita/Matrix.lean`) — The equivalence between modules over a ring and modules over its matrix ring, which is the pinned form of the Morita instance K.7 cites.
- `mathlib:Polynomial` (`Mathlib/Algebra/Polynomial/Basic.lean`) — The polynomial ring in one variable, one of the two rings in the four-term sequence that defines the contraction.
- `mathlib:RingHom` (`Mathlib/Algebra/Ring/Hom/Defs.lean`) — Ring maps, the morphisms of the functors this layer defines.
- `mathlib:TensorProduct` (`Mathlib/LinearAlgebra/TensorProduct/Defs.lean`) — The tensor product, the biexact functor from which the external products of K.7 are built.
- `tauceti:TauCeti.ExactK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — The Grothendieck group of an exact category, the degree-zero model against which this layer's invariance statements are checked.
- `tauceti:TauCeti.ExactK0.mapEquiv` (`TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`) — Invariance of that group under an exact equivalence, the pinned degree-zero shadow of the derived invariance K.7 states.
- `tauceti:TauCeti.ExactStructure.IsFrobenius` (`TauCeti/CategoryTheory/Exact/Frobenius.lean`) — The Frobenius condition on an exact structure, PINNED in Tau Ceti: it is the hypothesis of the second construction of K.6, and the packet cites it rather than defining it again.
- `tauceti:TauCeti.ExactStructure.split_isFrobenius` (`TauCeti/CategoryTheory/Exact/Frobenius.lean`) — The split exact structure is Frobenius, pinned; it is the degenerate unit test of the Frobenius-pair node.
- `tauceti:TauCeti.SplitK0` (`TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`) — The split model of the zeroth K-group, in which the pinned product statement is proved.
- `tauceti:TauCeti.SplitK0.of_mul_of` (`TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean`) — The pinned statement that the product of the classes of two objects is the class of their tensor product, the degree-zero unit test of K.7's product.

What does not exist at either pin, and is therefore this blueprint's own work:
spectra of any kind, homotopy colimits, connective covers, Karoubi's flasque
rings (the pinned `IsFlasque` of both trees is the sheaf-theoretic predicate and
is a different notion with the same name), the Eilenberg swindle, contracted
functors, the negative K-groups, the Nil category and the Nil groups, the
projective line over a ring, Frobenius categories and their stable categories,
Verdier quotients of triangulated categories, the K-theory of a Waldhausen
category, and the first K-group — which is absent from both trees, so every
statement of this blueprint in degree one is stated against a group that has yet
to be built. The connective K-theory of rings itself, with scalar extension,
finite products and filtered colimits, is not this blueprint's either: it is the
early ring node `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring` of
K.2:plus, which K.6 and K.7 import.

## Relation to the reviewed decomposition

`data/decompositions/GeneralAlgebraicKTheory.json` carries an accepted
independent review of 15 September 2026 and has six nodes for these two layers.
Four of its node identifiers are kept here
(`schlichting-set-up-and-negative-localization`,
`frobenius-pairs-flasque-envelope-and-suspension`,
`nonconnective-spectrum-and-derived-invariance`,
`agreement-and-vanishing-of-negative-K`), each split where declaration
granularity asked for it: the definitions of a Frobenius pair, of the set-up and
of the negative groups are their own nodes, and additivity with filtered
colimits is a fifth. Its two K.7 nodes are not kept as nodes — their content is
spread across the seven K.7 nodes here, at one statement per node — but every
locator they carry is reused, and this packet adds the K-book's Bass-side
development of K.6, which the decomposition does not have.

The two K.7 identifiers of the decomposition, which other blueprints and the
red-team report cite, correspond to nodes of this packet as follows.
`K.7/biexact-pairings-and-products` is `K.7/products-from-biexact-functors`
(the pairing and its coherence), with `K.7/graded-commutativity`,
`K.7/compatibility-with-relative-groups-and-transfers` and
`K.7/unit-multiplication-and-K0-tensor-comparison` for its consequences.
`K.7/invariance-products-and-colimits` is `K.7/morita-invariance`,
`K.7/derived-morita-and-enhancements` and
`K.7/invariance-under-filtered-colimits-and-products`; the elementary connective
statements it also made — exact-equivalence invariance, finite products and
filtered colimits of rings — belong to K.1 and to the early ring node of K.2:plus,
which the K.7 nodes import.

## The scheme roadmap imports this one

`AUDIT-28` records two duplications, and the red team (RT-AREA-ktheory-1/17)
found two more places where scheme statements had entered K.6. None is an overlap
to be removed; each is a boundary, and in every case the scheme roadmap, which
the atlas places after K.6 and K.7, imports this one:

- **`SchemeKTheoryOperations:S.5`** owns the Fundamental Theorem with Nil terms
  *for schemes* (V.8.3), Thomason's projective line and projective bundle
  theorems, and the agreement of Schlichting's groups with Thomason's for
  quasi-compact quasi-separated schemes. The source states the ring form (V.8.2)
  and the scheme form separately; this packet proves the ring form, down to the
  projective line over an associative ring, and S.5 imports it. The earlier
  prerequisite of the fundamental-theorem node on S.5 went against the stage
  order and closed a cycle; it is removed.
- **`SchemeKTheoryOperations:S.2`** owns the vanishing of negative G-theory of a
  noetherian scheme, the instance for Coh(X) of the theorem proved here for
  noetherian abelian categories.
- **`SchemeKTheoryOperations:S.6`** owns the external products *for schemes* and
  the graded commutativity of the total K-group of a scheme. The ring-level
  pairing from biexact functors is developed here, and the former prerequisite
  of the graded-commutativity node on S.6, which also went against the stage
  order, is removed.

All three are filed as requests that hand over ownership, and the structural note
asks that the stage texts say so in a sentence.

## K.6 — Nonconnective extension

The layer builds the negative K-groups along both of the routes its stage text
names, and proves that they agree.

**The algebraic route** (eighteen nodes, from the K-book) is Bass's: the negative
groups are the iterated contraction Lⁿ K_0 of the zeroth K-group of the early
ring functor, the Fundamental Theorem says that each K-group is a contracted
functor, and the Bass delooping turns that into a spectrum whose negative
homotopy groups are those contractions. The Fundamental Theorem is decomposed
down to its ring-level inputs, in the order the source proves it:

1. the projective line over an associative ring, as the gluing category of
   triples (M₊, M₋, α) of projective modules over R[t] and R[t⁻¹] — not a scheme,
   since for a noncommutative ring there is none — and the splitting
   K(R) × K(R) ≃ K(P¹_R) by the Koszul resolution and additivity (V.1.5.4);
2. the Nil category and the Nil groups, and the localisation sequences at t
   through R[t] and through P¹_R, whose common fibre is K(Nil(R)) (V.7.1,
   Ex. V.7.5);
3. Nil_n(R) ≅ NK_{n+1}(R) (V.8.1), exactness in positive degrees (V.8.2), and the
   splitting of the boundary by multiplication by t (Ex. V.8.1), which is an
   external product and so uses K.7's pairing;
4. the contractedness of K_1, K_0 and every K_{−n} (III.3.6, III.3.7, III.4.2),
   and the assembly of the theorem in every degree.

Mayer–Vietoris for a Milnor square continues into negative degrees (III.4.3),
and its spectrum form — excision in degrees at most zero for the relative Bass
spectrum, so that the birelative term is concentrated in degrees ≥ 0 — is what
Clausen, Mathew and Morrow's Proposition 4.34 uses. The K_1–K_0 part and the
degree-zero excision are imported from K.5; in degree one only the classical
surjectivity is recorded, and its spectrum form (birelative term in degrees ≥ 1)
is handed to KTheoryLowDegrees U.6, which lies downstream of K.6. No unrestricted
higher excision is asserted. The comparison of the classical K_1 = GL/E with
Quillen's K_1 is taken from the plus = Q comparison and StableHomotopyKTheory
H.3, not from K.2:low-degree-comparisons, which lies downstream of K.6.

**The homotopical route** (seven nodes, from Schlichting) is the flasque
enlargement, suspension and idempotent completion the stage text asks for by
name. It runs on Frobenius pairs rather than on rings; the countable envelope
is flasque in exactly Karoubi's sense, with the swindle in functorial form; the
suspension is the quotient of the enlargement by the original; and the negative
groups are the zeroth invariant of the iterated suspension. Its localisation
theorem holds in non-positive degrees for formal reasons, and in every degree
once the spectrum is built.

**They agree.** Schlichting's Theorem 7.1 identifies the groups of the second
route with Bass's, Pedersen's, Karoubi's and Pedersen–Weibel's for rings and
additive categories. So the independence-of-enlargement target of the stage text
is met twice: by the model-independence of the Bass construction, and by that
agreement theorem. The scheme clause of the same theorem (Thomason's groups) is
SchemeKTheoryOperations S.5's.

**The trap the stage text names.** The connective model has no homotopy in
negative degrees, for any ring at all. That absence is a property of the model
and carries no information about the ring. Vanishing of the negative K-groups
of a *singular* ring may not be inferred from it; the vanishing theorem here is
for regular noetherian rings and is proved from the Fundamental Theorem.

**One stage-order point.** The Bass delooping and the splitting of the
Fundamental Theorem use the external product with [t] ∈ K_1(ℤ[t,t⁻¹]), which
K.7 owns. The product node depends on nothing in K.6, so the node graph is
acyclic, but it contradicts the atlas stage order K.6 → K.7; the structural
proposals ask for an early K.7 product stage before K.6.

Coverage: **source_decomposed**.

Twenty-five nodes, covering both of the constructions the stage text asks for. The algebraic half: Karoubi’s flasque rings with the Eilenberg swindle, the infinite sum rings and the cone ring, stated with the explicit warning that the pinned IsFlasque of both libraries is the sheaf-theoretic predicate and that a formalisation must not reuse the name; Bass’s contracted functors, with the contraction LF defined as the cokernel of the map out of the two polynomial rings and with the splitting required natural in the variable as well as in the ring; the negative K-groups as the iterated contraction Lⁿ K_0 of the early ring functor; the Fundamental Theorem in every degree, decomposed down to its ring-level inputs — the projective line over an associative ring as a gluing category of projective modules (Weibel V.1.5.4; not a scheme, since for a noncommutative ring there is none), the splitting K(R) × K(R) ≃ K(P¹_R) by the Koszul resolution and additivity, the Nil category and its groups, the localisation sequences at t through R[t] and through P¹_R (V.7.1, Ex. V.7.5), Nil_n(R) ≅ NK_{n+1}(R) (V.8.1), exactness in positive degrees and the splitting by multiplication by t (V.8.2, Ex. V.8.1), and the contractedness of K_1, K_0 and every K_{−n} (III.3.6, III.3.7, III.4.1.2, III.4.2); the four axioms a theory of negative K-theory must satisfy, with Bass’s groups as the example that makes them non-vacuous; Mayer–Vietoris for a Milnor square in negative degrees (III.4.3) and its spectrum form, excision in degrees at most zero from K.5's degree-zero excision and the contraction (IV.10.1), which is what Clausen–Mathew–Morrow’s Proposition 4.34 uses, with the classical degree-one surjectivity (Remark III.2.2.1) recorded and its spectrum form handed to KTheoryLowDegrees U.6; the Bass delooping, built as the homotopy colimit of the iterated desuspensions, with the identification of its negative homotopy with Bass’s groups as its own node; and the vanishing theorem for regular noetherian rings with the non-example the stage text names by hand. The homotopical half is the flasque enlargement, the suspension and the idempotent completion the stage text asks for by name, decomposed from Schlichting: Frobenius categories, Frobenius pairs and their derived categories, with the bounded complexes over an exact category as the standing example; the countable envelope with the swindle in functorial form (Lemma 4.2), the enlargement functor F, the c-compact generation that identifies the idempotent completion of the derived category with the c-compact part of the enlargement, and the suspension S, together with the verification (Theorem 4.8) that the three axioms of the set-up hold; the axiomatic set-up itself and the negative groups it defines; localisation in non-positive degrees with the connecting map constructed by lifting, and the first negative group characterised as the obstruction to idempotent completeness of Verdier quotients; additivity and filtered colimits; the IK-theory spectrum with its homotopy groups computed in all three ranges and the localisation sequence in every degree; and the agreement with Bass’s, Pedersen’s, Karoubi’s and Pedersen–Weibel’s groups for rings and additive categories, with the presentation of the first negative group, the vanishing for noetherian abelian categories, the deduction of Bass’s vanishing theorem for a regular ring, and the conjecture for a general small abelian category recorded as a conjecture. The scheme clauses of the source’s agreement and vanishing theorems (Thomason’s groups of a qcqs scheme; negative G-theory of a noetherian scheme) are handed to SchemeKTheoryOperations S.5 and S.2 by request, since S.1 and S.2 define Perf(X), K(X) and G(X) after this layer. Every stage target has a node, and the independence-of-enlargement target is met twice over: by the model-independence statement of the Bass construction and by the agreement theorem, which identifies the two routes’ outputs with each other and with the classical groups. The localisation clause of the stage text is carried by the Schlichting localisation nodes in the nonconnective formulation the text asks for. The ring functor, its scalar extension, finite products and filtered colimits are imported from the early ring node of K.2:plus, not restated.

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

**Prerequisites.** `mathlib:Matrix`, `mathlib:RingHom`

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

- `cone_ring_flasque` (*computation*) — The cone ring of any ring is flasque.
- `K0_vanishes` (*degenerate*) — The zeroth K-group of a flasque ring is trivial.
- `not_sheaf_notion` (*non-example*) — The predicate is about bimodules, not about sheaves; the pinned IsFlasque is a different statement.
- `infinite_sum_is_flasque` (*computation*) — Every infinite sum ring is flasque, by taking the bimodule to be the ring.

**Sources.**

- K-book, II.2.1.3 (Example 2.1.3), printed p. 69 (PDF p. 77). The definition and the swindle. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Example 2.1.3. (Karoubi) We say a ring R is flasque if there is an R-bimodule M, finitely generated projective as a right module, and a bimodule isomorphism θ : R ⊕ M ≅ M. If R is flasque then K0(R) = 0. This is because for every P we have a natural isomorphism P ⊕ (P ⊗R M) ≅ P ⊗R (R ⊕ M) ≅ (P ⊗R M).

- K-book, Exercise I.1.8 (Cone Ring), printed p. 5 (PDF p. 13). The cone ring; it is an exercise, not an item I.1.8. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > 1.8. Cone Ring. For any ring R, the endomorphism ring EndR(R∞) of the previous exercise contains a smaller ring, namely the subring C(R) consisting of row-and-column finite matrices. The ring C(R) is called the cone ring of R. Show that C(R) is a direct sum ring.

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

- `K0_contracted` (*computation*) — The zeroth K-group is a contracted functor.
- `iterate_agrees` (*compatibility*) — The iterated contraction of the special first K-group is the first negative K-group.
- `naturality_in_t` (*non-example*) — The splitting is natural in the variable; a splitting natural only in the ring does not make the functor contracted.
- `retract_closed` (*computation*) — A natural retract of a contracted functor is contracted.

**Sources.**

- K-book, III.4.1.1 (Definition 4.1.1), printed p. 210 (PDF p. 218). The definition. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 4.1.1 (Contracted functors). Let F be a functor from rings to abelian groups. For each R, we define LF(R) to be the cokernel of the map F(R[t]) ⊕ F(R[t−1]) → F(R[t, t−1]). … We say that F is acyclic if Seq(F, R) is exact for all R. We say that F is a contracted functor if F is acyclic and in addition there is a splitting

### Bass's negative K-groups

`GeneralAlgebraicKTheory:K.6/negative-k-groups` · *definition* · planet **Bass's negative K-groups**

For n positive define the n-th negative K-group of a ring inductively as the cokernel of the difference map from the direct sum of the (n-1)-st negative group of the two polynomial rings into that of the Laurent ring; the case n = 1 starts from the zeroth K-group of the early ring functor (K.2:plus). In the notation of the contraction this says K_{−n} = Lⁿ K_0 (Definition III.4.1.1). Each is a functor from rings to abelian groups. The first negative group is what the Fundamental Theorem for the zeroth K-group produces: that theorem gives a split exact sequence exhibiting the zeroth K-group of the Laurent ring as the direct sum of the zeroth group, the first negative group and two copies of the N-term, which is the obstruction to homotopy invariance. That K_0 and every K_{−n} are contracted functors, with that decomposition, is K.6/negative-k-groups-are-contracted; this node is the definition, and its identification with the negative homotopy of the Bass spectrum is K.6/bass-spectrum-homotopy-groups.

**Hypotheses.**

- R is a ring; the groups are defined for every ring, with no regularity or noetherian hypothesis.
- The definition is by iterated contraction, so it depends on the previous node's machine and on nothing else.
- The N-terms are the cokernels of the maps from the K-group of the ring to that of the polynomial ring, and vanish exactly when the K-group in that degree is homotopy invariant.

**Proof outline.**

1. Define the groups by the displayed induction and prove functoriality.
2. Record that the Fundamental Theorem for the zeroth K-group, which makes these cokernels the contractions of contracted functors and gives the four-term decomposition of the zeroth group of the Laurent ring, is proved in K.6/negative-k-groups-are-contracted, not here.
3. Read off from Definition III.4.1.1 that the first negative group is the contraction LK_0, and more generally that K_{−n} = Lⁿ K_0, so that the two definitions agree.
4. Prove the elementary consequences: the groups commute with finite products of rings, and they vanish on a flasque ring, both of which follow from the corresponding statements in degree zero.
5. Record the alternative approach of Karoubi and Villamayor that the source mentions, and that it is not the one developed here.

**Acceptance.**

- For a regular noetherian ring every negative group vanishes, which is the theorem of a later node.
- For a flasque ring every negative group vanishes, which is one of the axioms.
- The groups are not defined by homotopy groups of a connective spectrum; the connective model has no negative homotopy, and inferring vanishing from that absence is the error the stage text forbids.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `mathlib:LaurentPolynomial`, `tauceti:TauCeti.ExactK0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `negativeK` | data | The n-th negative K-group. |
| `negativeK_functor` | functoriality | Functoriality in the ring. |
| `negativeK_one` | characterisation | The first negative group is the contraction of the zeroth K-group. |
| `negativeK_eq_contraction_iterate` | characterisation | K_{−n} = Lⁿ K_0: the n-th negative group is the n-fold contraction of the zeroth K-group. |
| `negativeK_flasque` | example | The negative groups of a flasque ring vanish. |
| `negativeK_prod` | compatibility | Compatibility with finite products of rings. |

**Used by.**

- *K.6, the axioms* — Bass’s groups are the model that satisfies the four axioms, which is what makes the axioms non-vacuous.
- *K.6, the nonconnective spectrum* — The spectrum is built so that its negative homotopy groups are these groups.
- *K.7* — The products and the invariance statements are asserted for the nonconnective theory, hence for these groups as well.
- *K.6, Mayer–Vietoris and excision for Milnor squares; Clausen–Mathew–Morrow, the proof of Proposition 4.34 (p. 35)* — Bass's groups are the non-positive homotopy of the nonconnective K-theory whose birelative term that proof needs concentrated in degrees ≥ 0 (K.6/milnor-square-excision-in-nonpositive-degrees).

**Unit tests.**

- `regular_vanishes` (*computation*) — For a regular noetherian ring the negative groups vanish.
- `flasque_vanishes` (*computation*) — For a flasque ring they vanish.
- `laurent_four_pieces` (*computation*) — The zeroth group of the Laurent ring decomposes into four named pieces.
- `not_from_connective` (*non-example*) — The groups are not the negative homotopy of the connective spectrum, which is zero; a formalisation that identified them would be wrong.

**Sources.**

- K-book, III.4.1 (Definition 4.1), printed p. 210 (PDF p. 218). The definition. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 4.1. For n > 0, we inductively define K−n(R) to be the cokernel of the map K−n+1(R[t]) ⊕ K−n+1(R[t−1]) → K−n+1(R[t, t−1]). Clearly, each K−n is a functor from rings to abelian groups.

- K-book, III.3.7 (Fundamental Theorem for K0 3.7), printed p. 206 (PDF p. 214). The first negative group from the Fundamental Theorem for K0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Fundamental Theorem for K0 3.7. For every ring R, there is a naturally split exact sequence: 0 → K0(R) → K0(R[t]) ⊕ K0(R[t−1]) → K0(R[t, t−1]) → K−1(R) → 0. Consequently, we have a natural direct sum decomposition: K0(R[t, t−1]) ≅ K0(R) ⊕ K−1(R) ⊕ NK0(R) ⊕ NK0(R).

- K-book, III.4.1.1, the paragraph after the definition, printed p. 210 (PDF p. 218). K_{−n} = Lⁿ K_0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > By iterating this definition, we can speak about the functors NLF, L2F, etc. For example, Definition 4.1 states that K−n = Ln(K0).

### The projective line over an associative ring, as a gluing category

`GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring` · *construction*

Let R be a unital associative ring, not necessarily commutative. The category mod-P¹_R has as objects the triples F = (M₊, M₋, α) in which M₊ is a right R[t]-module, M₋ a right R[t⁻¹]-module and α : M₊ ⊗_{R[t]} R[t,t⁻¹] → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹] an isomorphism of R[t,t⁻¹]-modules; a morphism is a pair of module maps compatible with the gluing isomorphisms. It is abelian, with kernels and cokernels taken componentwise, because inverting the central element t is exact. VB(P¹_R) is the full exact subcategory of triples whose components M₊ and M₋ are finitely generated projective, and K(P¹_R) := K(VB(P¹_R)), the K-theory of that exact category (K.1, on a small model). The twist is F(n) = (M₊, M₋, t⁻ⁿα), with the two maps X₀ = (1, 1/t) and X₁ = (t, 1) from F(n−1) to F(n); the exact functors u_i : P(R) → VB(P¹_R) send P to (P[t], P[t⁻¹], tⁱ), so that u_i(P)(n) = u_{i−n}(P); and π_* and R¹π_* : mod-P¹_R → mod-R are the kernel and the cokernel of d : M₊ × M₋ → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹], d(x, y) = α(x) − y. This is NOT the scheme P¹ over an affine scheme Spec R: for noncommutative R there is no such scheme, and nothing here uses one. For commutative R the source records that mod-P¹_R and VB(P¹_R) are equivalent to the quasi-coherent sheaves and the vector bundles on the scheme P¹_R; that comparison belongs to SchemeKTheoryOperations S.5, which imports this node, and no node of this packet uses it.

**Hypotheses.**

- R is a unital associative ring and modules are right modules, as in the source. The element t is central in R[t], so R[t,t⁻¹] is the localisation of R[t] (and of R[t⁻¹]) at a central element, and the two base changes into R[t,t⁻¹] are exact.
- The gluing α is part of the data of an object: two triples with isomorphic components and different gluings are in general not isomorphic (unit test pi_u1).
- VB(P¹_R) is closed under extensions in mod-P¹_R and essentially small; K(P¹_R) is computed on a small model, as K.1 prescribes.
- The functors u_i land in VB(P¹_R) and are exact because the exact structure on P(R) is the split one and base change is additive (K.2:plus scalar extension).

**Proof outline.**

1. Define mod-P¹_R, with morphisms the pairs (f₊, f₋) such that (f₋ ⊗ 1) ∘ α = α′ ∘ (f₊ ⊗ 1), and prove that it is abelian with componentwise kernels and cokernels, using that R[t] → R[t,t⁻¹] and R[t⁻¹] → R[t,t⁻¹] are flat (localisation at the central element t).
2. Define VB(P¹_R), prove that it is an exact subcategory closed under extensions, take a small model and set K(P¹_R) := K(VB(P¹_R)) by K.1.
3. Define the twists F(n) and the maps X₀, X₁ : F(n−1) → F(n), and prove that the Koszul sequence 0 → F(−2) → F(−1)² → F → 0, with maps (X₁, −X₀) and (X₀, X₁), is exact for every F in mod-P¹_R and lies in VB(P¹_R) when F does.
4. Define u_i : P(R) → VB(P¹_R), P ↦ (P ⊗_R R[t], P ⊗_R R[t⁻¹], tⁱ), prove that it is exact, and prove u_i(P)(n) = u_{i−n}(P) naturally in P.
5. Define π_* and R¹π_* by the four-term exact sequence 0 → π_*F → M₊ × M₋ → M₋ ⊗ R[t,t⁻¹] → R¹π_*F → 0 with d(x, y) = α(x) − y, and compute them on u_0(R), u_1(R) and u_2(R) (the unit tests).
6. Prove functoriality in R: a unital ring map R → R′ induces base change mod-P¹_R → mod-P¹_{R′} componentwise, exact on VB and compatible with the twists, with the u_i, with identities and with composition (K.2:plus scalar extension).

**Acceptance.**

- π_*(u_0(R)) ≅ R and R¹π_*(u_0(R)) = 0, while π_*(u_1(R)) = 0 = R¹π_*(u_1(R)): u_0(R) and u_1(R) have isomorphic components and are not isomorphic, which is what the gluing records.
- R¹π_*(u_2(R)) ≅ R: in the cokernel of (x, y) ↦ t²x − y from R[t] × R[t⁻¹] to R[t,t⁻¹] exactly the coefficient of t survives.
- For R = 0 the category VB(P¹_0) is zero and K(P¹_0) is contractible.
- The construction makes sense for every associative ring and uses no scheme; a definition through the centre of R, or through Spec of anything, is not this object.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `mathlib:ModuleCat`, `mathlib:Polynomial`, `mathlib:LaurentPolynomial`

**API.**

| name | role | statement |
| --- | --- | --- |
| `ProjectiveLine.Module` | data | The abelian category mod-P¹_R of glued triples (M₊, M₋, α), with morphisms compatible with the gluing. |
| `ProjectiveLine.VectorBundle` | data | The full exact subcategory VB(P¹_R) of triples with finitely generated projective components. |
| `ProjectiveLine.KSpace` | data | K(P¹_R) := K(VB(P¹_R)), by K.1 on a small model. |
| `ProjectiveLine.twist` | data | The twist F(n) = (M₊, M₋, t⁻ⁿα), with the maps X₀ = (1, 1/t) and X₁ = (t, 1) : F(n−1) → F(n). |
| `ProjectiveLine.u` | constructor | The exact functor u_i : P(R) → VB(P¹_R), P ↦ (P[t], P[t⁻¹], tⁱ). |
| `ProjectiveLine.u_twist` | simp | u_i(P)(n) ≅ u_{i−n}(P), naturally in P. |
| `ProjectiveLine.koszul` | characterisation | The Koszul sequence 0 → F(−2) → F(−1)² → F → 0 is exact for every F. |
| `ProjectiveLine.directImage` | data | π_* and R¹π_* : mod-P¹_R → mod-R, the kernel and the cokernel of d(x, y) = α(x) − y. |
| `ProjectiveLine.map` | functoriality | Base change along a unital ring map R → R′, exact on VB and compatible with the twists, with the u_i, with identities and with composition. |

**Used by.**

- *K.6, the projective-line splitting (K-book V.1.5.4)* — K(R) × K(R) ≃ K(P¹_R) through u_0 and u_1 is a statement about this category, proved with its Koszul sequence and twists.
- *K.6, the t-torsion localisation sequences (Ex. V.7.5) and Nil_n(R) ≅ NK_{n+1}(R) (V.8.1)* — Nil(R) is the category of objects (M, 0, 0) with a length-one resolution by objects of VB(P¹_R), and the restriction j^*F = M₋ is the chart R[t⁻¹].
- *SchemeKTheoryOperations S.5, the projective-line and projective-bundle theorems for schemes* — For commutative R the source identifies VB(P¹_R) with the vector bundles on the scheme P¹_R; S.5 imports this ring-level object and its splitting and makes that comparison.

**Unit tests.**

- `pi_u0` (*computation*) — π_*(u_0(R)) ≅ R and R¹π_*(u_0(R)) = 0.
- `pi_u1` (*non-example*) — π_*(u_1(R)) = 0 and R¹π_*(u_1(R)) = 0, so u_1(R) is not isomorphic to u_0(R) although both have components R[t] and R[t⁻¹]; a definition that forgot the gluing would identify them.
- `R1pi_u2` (*computation*) — R¹π_*(u_2(R)) ≅ R and π_*(u_2(R)) = 0.
- `zero_ring` (*degenerate*) — For R = 0 the category VB(P¹_0) is zero, so K(P¹_0) is contractible.
- `u_twist_shift` (*compatibility*) — u_i(P)(n) ≅ u_{i−n}(P) for all integers i and n, naturally in P.

**Sources.**

- K-book, V.1, 'The projective line over a ring', printed p. 370 (PDF p. 378). The gluing category and its vector bundles. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Let R be any associative ring. We define mod-P1R to be the abelian category of triples F = (M+, M−, α), where M± is in mod-R[t±1] … α … an isomorphism M+ ⊗R[t] R[t, 1/t] ≃ M− ⊗R[1/t] R[t, 1/t] … VB(P1R) consisting of triples where M± are finitely generated projective modules, and we write K(P1R) for K VB(P1R).

- K-book, V.1, the same paragraph, printed p. 370 (PDF p. 378). The direct image functors. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > We define the functors π∗, R1π∗ : mod-P1R → mod-R via the exact sequence 0 → π∗(F) → M+ × M− --d--> M− ⊗R[1/t] R[t, 1/t] → R1π∗(F) → 0. where d(x, y) = α(x) − y. If R is commutative, these are the usual functors π∗ and R1π∗.

- K-book, V.1, the same paragraph and the next, printed pp. 370 to 371 (PDF pp. 378 to 379). The comparison for commutative R (S.5's, not used here) and the functors u_i. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > If R is commutative, it is well known that mod-P1R is equivalent to the category of quasi-coherent sheaves on P1R, and VB(P1R) is equivalent to the usual category of vector bundles on the line P1R … There are exact functors ui : P(R) → VB(P1R), sending P to the triple (P[t], P[1/t], ti)

- K-book, V.1.5.4, proof, printed p. 371 (PDF p. 379). The twists and the Koszul sequence. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > If F = (M+, M−, α), we define F(n) to be (M+, M−, t−nα), and let X0, X1 : F(n − 1) → F(n) be the maps (1, 1/t) and (t, 1), respectively. Then we have an exact sequence (the Koszul resolution of F). 0 → F(−2) --(X1, −X0)--> F(−1)2 --(X0, X1)--> F → 0.

### The K-theory of the projective line over a ring: K(R) × K(R) ≃ K(P¹_R)

`GeneralAlgebraicKTheory:K.6/projective-line-splitting` · *theorem*

For every unital associative ring R the exact functors u_0 and u_1 induce a homotopy equivalence (u_0, u_1) : K(R) × K(R) → K(P¹_R), so that K_n(P¹_R) ≅ K_n(R) ⊕ K_n(R) for every n ≥ 0, naturally in R; and (u_{i+1})_* + (u_{i+1})_* ≃ (u_i)_* + (u_{i+2})_* for every integer i. Equivalently (u_0, u_0 − u_1) is a homotopy equivalence, which is the form the proof of V.8.1 uses. No commutativity is assumed. For commutative R and the scheme P¹_R this is the case of a trivial bundle of rank two in the projective bundle theorem V.1.5, which SchemeKTheoryOperations S.5 owns and which imports this ring statement.

**Hypotheses.**

- R is a unital associative ring, not necessarily commutative; K is the connective K-theory of the exact categories P(R) and VB(P¹_R) (K.1 and the early ring node of K.2:plus).
- The statement is connective, in degrees n ≥ 0; nothing is claimed here about negative K-groups of P¹_R.
- The source leaves the adaptation of the proof of V.1.5 to the gluing category as Exercise V.1.3 and points to Quillen; the Mumford-regularity and canonical-resolution steps below are therefore proof obligations of this node (gap: the noncommutative projective-line inputs are exercises in the source).

**Proof outline.**

1. Apply the Koszul sequence to u_i(P) and use u_i(P)(n) = u_{i−n}(P): this is a short exact sequence u_{i+2} ↣ u_{i+1}² ↠ u_i of exact functors P(R) → VB(P¹_R), and Additivity gives (u_{i+1})_* + (u_{i+1})_* ≃ (u_i)_* + (u_{i+2})_*.
2. Call F Mumford-regular when R¹π_*(F(−1)) = 0; write MR ⊂ VB(P¹_R) for the exact subcategory of such F and MR(n) for the F with F(−n) in MR. VB(P¹_R) is the increasing union of the MR(n) as n → −∞, so K(VB(P¹_R)) is the filtered colimit of the K(MR(n)) (K.1, filtered colimits).
3. Each inclusion MR(n) ⊂ MR(n−1) is a K-equivalence: the Koszul sequence gives exact functors back into MR(n), and Additivity makes their alternating sum a homotopy inverse (the argument of Lemma V.1.5.2 with r = 1).
4. For F in MR construct Quillen's canonical resolution 0 → u_1(T_1F) → u_0(T_0F) → F → 0 by exact functors T_0 = π_* and T_1 : MR → P(R), and conclude by Additivity that u_* : K(R) × K(R) → K(MR) is split up to homotopy (the gluing-category form of II.8.7.8, left to Exercise V.1.3).
5. Set v_i(F) = π_*(F(i)); then v_i u_j(P) is 0 for i < j and P for i = j, so (v_0, v_1)_* ∘ (u_0, u_1)_* is triangular with diagonal entries homotopic to the identity, hence a homotopy equivalence, and with the previous step (u_0, u_1) is an equivalence.
6. Naturality in R follows from the base-change functoriality of the gluing category; the form (u_0, u_0 − u_1) follows by an invertible change of basis.

**Acceptance.**

- For a field F, K_0(P¹_F) ≅ ℤ², with basis the classes of u_0(F) and u_1(F).
- In K_0(P¹_R), [u_0(R)] + [u_2(R)] = 2[u_1(R)], the relation the Koszul sequence gives.
- The theorem holds for noncommutative R, where there is no scheme P¹_R; an argument through Spec R does not prove this node.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- K-book, V.1.5.4 (Theorem 1.5.4) and the sentence before it, printed p. 371 (PDF p. 379). The theorem. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > There are exact functors ui : P(R) → VB(P1R), sending P to the triple (P[t], P[1/t], ti) … Theorem 1.5.4. The functors u0, u1 induce an equivalence K(R) ⊕ K(R) ≃ K(P1R). In addition, (ui+1)∗ + (ui+1)∗ ≃ (ui)∗ + (ui+2)∗ for all i.

- K-book, V.1.5.4, proof, printed p. 371 (PDF p. 379). The Koszul relation, and the reduction to the proof of V.1.5. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Applying this to ui(P) and using ui(P)(n) = ui−n(P) yields the exact sequence ui+2 ↣ (ui+1)2 ↠ ui of functors, and the relations follow from Additivity 1.2. The proof of Theorem 1.5 now goes through to prove Theorem 1.5.4 (see Ex. 1.3).

- K-book, Exercise V.1.3, printed p. 375 (PDF p. 383). The gluing-category proof is left as an exercise, with a pointer to Quillen that was not followed. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > 1.3. Complete the proof of Theorem 1.5.4, modifying the proof of 1.5 for P1R. (See Quillen [Q341] …)

- K-book, V.1.5.2 (Lemma 1.5.2) with its proof, printed p. 369 (PDF p. 377). The Mumford-regular filtration, for a projective bundle over a scheme; the node adapts it. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Lemma 1.5.2. MR ⊂ VB(P) induces an equivalence K MR ≃ K(P). … Thus K(P) = lim K MR(n). Hence it suffices to show that each inclusion ιn : MR(n) ⊂ MR(n − 1) induces a homotopy equivalence on K-theory. … By Additivity (1.2.1), ιn has Σ(−1)iλi as a homotopy inverse.

- K-book, V.1.5, the proof of Theorem 1.5, printed p. 370 (PDF p. 378). The triangularity argument, for a projective bundle over a scheme; the node adapts it. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Define vi : MR → VB(X) by vi(F) = π∗(F(i)). … It follows that v∗ ◦ u∗ : K(X)r+1 → K(X)r+1 is given by a triangular matrix whose diagonal entries are homotopic to the identity. Thus v∗ ◦ u∗ is a homotopy equivalence, as desired.

### The Nil category of a ring and the Nil groups

`GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups` · *definition*

For a unital ring R, Nil(R) is the category of pairs (P, ν) in which P is a finitely generated projective R-module and ν is a nilpotent endomorphism of P, with morphisms the module maps commuting with the endomorphisms; it is an exact category, an exact subcategory of the endomorphism category, whose conflations are the sequences of pairs that are exact on the underlying modules. The forgetful functor Nil(R) → P(R), (P, ν) ↦ P, is exact and is split by the exact functor P ↦ (P, 0). The Nil spectrum Nil(R) is the homotopy fibre of the forgetful map K(Nil(R)) → K(R), and Nil_n(R) := π_n Nil(R), the kernel of K_n Nil(R) → K_n(R); because of the splitting, K(Nil(R)) ≃ K(R) × Nil(R) and K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R) for n ≥ 0. Nil(R) is equivalent to the category H_{1,T}(R[t]) of t-torsion R[t]-modules with a resolution of length at most one by finitely generated projective R[t]-modules: (P, ν) goes to P_ν, the module P on which t acts by ν, resolved by the characteristic sequence 0 → P[t] → P[t] → P_ν → 0 whose first map is t − ν.

**Hypotheses.**

- R is unital and associative; ν is nilpotent, not merely an endomorphism: the group built from all endomorphisms is a different and larger object (unit test nilpotent_required).
- Nil_n(R) is defined for n ≥ 0 from connective K-theory; negative degrees are not defined here.
- The equivalence with H_{1,T}(R[t]) uses T = {tⁿ}, a set of central nonzerodivisors of R[t].

**Proof outline.**

1. Define Nil(R), its morphisms and its exact structure, and prove that the forgetful functor and the zero section are exact, with forget ∘ zero = id.
2. Deduce from the functoriality of K (K.1) that K(Nil(R)) ≃ K(R) × Nil(R), with Nil(R) the homotopy fibre of the forgetful map, and that K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R) naturally in R.
3. Prove the equivalence Nil(R) ≃ H_{1,T}(R[t]) of Lemma II.7.8.2: the characteristic sequence resolves P_ν, and conversely a t-torsion module with a length-one projective resolution is projective over R, by the Tor sequence the source gives.
4. Record the degree-zero description: Nil_0(R) is generated by the classes [(Rⁿ, ν)] − n[(R, 0)] with ν a nilpotent matrix.
5. Prove functoriality in unital ring maps by base change of pairs.

**Acceptance.**

- K_0 Nil(R) = K_0(R) ⊕ Nil_0(R), as the source states in II.7.4.4.
- For a field F every (Fⁿ, ν) is filtered by the kernels of the powers of ν with quotients of the form (F^a, 0), so Nil_0(F) = 0.
- For A = k[ε] with k a field, Nil_0(A) ≅ (1 + εt·k[t])^× is non-zero (the source's Example III.3.8.1).

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `mathlib:IsNilpotent`, `mathlib:Polynomial`

**API.**

| name | role | statement |
| --- | --- | --- |
| `NilCat` | data | Nil(R), with its exact structure. |
| `NilCat.forget` | projection | The exact forgetful functor (P, ν) ↦ P. |
| `NilCat.zero` | constructor | The exact zero section P ↦ (P, 0), a section of the forgetful functor. |
| `nilGroup` | data | Nil_n(R) := π_n of the homotopy fibre of K(Nil(R)) → K(R), for n ≥ 0. |
| `KGroup.nilCat_decomposition` | characterisation | K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R), naturally in R. |
| `NilCat.equivTorsion` | equivalence | Nil(R) ≃ H_{1,T}(R[t]), (P, ν) ↦ P_ν. |
| `nilGroup_map` | functoriality | Base change along unital ring maps. |

**Used by.**

- *K.6, Nil_n(R) ≅ NK_{n+1}(R) (K-book V.8.1)* — The Nil groups are the terms the N-groups of the Fundamental Theorem are identified with.
- *K.6, the t-torsion localisation sequences* — K(H_{1,T}(R[t])) is K(Nil(R)) through the equivalence, which is how the localisation sequences acquire the fibre K(R) × Nil(R).
- *K.7, products* — The tensor pairing End(k) × Nil(A) → Nil(A) makes Nil_0(A) a module (II.7.4.4); the products node records it as an application of its machine.

**Unit tests.**

- `nil0_field` (*computation*) — For a field F, Nil_0(F) = 0.
- `nil0_dual_numbers` (*computation*) — For A = k[ε] over a field k, Nil_0(A) ≅ (1 + εt·k[t])^× ≠ 0.
- `K0_nil_split` (*characterisation*) — K_0 Nil(R) ≅ K_0(R) ⊕ Nil_0(R) through the zero section and the forgetful functor.
- `nilpotent_required` (*non-example*) — Dropping nilpotence changes the object: (ℤ, 2) is an endomorphism of ℤ that is not nilpotent, and its class 1 − 2t in the endomorphism group of ℤ (Almkvist) is non-zero, while Nil_0(ℤ) = 0.

**Sources.**

- K-book, II.7.4.4 (Example 7.4.4), printed p. 133 (PDF p. 141). The Nil category and the split forgetful functor. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Example 7.4.4. If R is a ring, let Nil(R) denote the category whose objects (P, ν) are pairs, where P is a finitely generated projective R-module and ν is a nilpotent endomorphism of P. This is an exact subcategory of End(R). The forgetful functor Nil(R) → P(R) sending (P, ν) to P is exact, and is split by the exact functor P(R) → Nil(R) sending P to (P, 0).

- K-book, IV.6.7, printed p. 324 (PDF p. 332). The Nil spectrum and the Nil groups in every degree. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Let Nil(R) denote the fiber of the forgetful functor K Nil(R) → K(R); since this is split, we have K Nil(R) ≃ K(R) × Nil(R) and K∗Nil(R) ≅ K∗(R) × Nil∗(R), where Nil∗(R) = π∗Nil(R) is a graded End∗(k)-module.

- K-book, II.7.8.2 (Lemma 7.8.2) with its proof, printed p. 138 (PDF p. 146). The equivalence with t-torsion modules. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Lemma 7.8.2. Let S be the multiplicative set {tn} in the polynomial ring R[t]. Then Nil(R) is equivalent to the category H1,S(R[t]) of all t-torsion R[t]-modules M in H1(R[t]). Proof. If (P, ν) is in Nil(R), let Pν denote the R[t] … P on which t acts as ν. … A projective resolution of Pν is given by the "characteristic sequence" of ν

- K-book, III.3.8.1 (Example 3.8.1), printed p. 207 (PDF p. 215). The non-zero Nil group of a truncated polynomial ring, used as a unit test. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Example 3.8.1. If R is a commutative regular ring, and A = R[x]/(xN), it follows from 2.4 and 3.8 that … Nil0(A) ≅ NK1(A) ≅ … = (1 + xtA[t])×.

### Localisation at t: the sequences through R[t] and through P¹_R

`GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences` · *theorem*

Let R be a unital ring and T = {tⁿ} ⊂ R[t], a set of central nonzerodivisors. (a) The inclusion of H_{1,T}(R[t]) and the localisation R[t] → R[t,t⁻¹] give a homotopy fibration K(H_{1,T}(R[t])) → K(R[t]) → K(R[t,t⁻¹]) of connective K-theory spaces, whose long exact sequence ends with K_0(H_{1,T}(R[t])) → K_0(R[t]) → K_0(R[t,t⁻¹]), a map that need not be onto (Caveat V.7.1.1). (b) Write H_1 for the objects of mod-P¹_R with a length-one resolution by objects of VB(P¹_R) and H_{1,t} ⊂ H_1 for those of the form (M, 0, 0). Then M ↦ (M, 0, 0) is an equivalence H_{1,T}(R[t]) ≃ H_{1,t}, the restriction j^* : VB(P¹_R) → P(R[t⁻¹]), j^*F = M₋, is exact, and K(H_{1,T}(R[t])) → K(P¹_R) → K(R[t⁻¹]) is a homotopy fibration. (c) Restriction to the chart R[t], F ↦ M₊, maps the sequence of (b) to that of (a), identically on the fibre. Through Nil(R) ≃ H_{1,T}(R[t]) the fibre of both is K(Nil(R)) ≃ K(R) × Nil(R).

**Hypotheses.**

- t is central in R[t] and a nonzerodivisor, so the Localisation Theorem V.7.1 applies with S = T; for a multiplicative set containing zero divisors the torsion category does not model the fibre (the source's Ex. V.2.9, recorded by K.5).
- H_{1,T}(R[t]) and the category H_T(R[t]) of all t-torsion modules of finite projective dimension have the same K-theory by the Resolution Theorem, as in Corollary II.7.7.3; the sequences use H_{1,T} because that is the category equivalent to Nil(R).
- For commutative R, (b) is the scheme sequence V.7.6.1 for the origin of P¹_R, which is SchemeKTheoryOperations S.3/S.5's and is not used here; for noncommutative R the source states (b) as Exercise V.7.5, and its fibration is a proof obligation of this node (gap: the noncommutative projective-line inputs are exercises in the source).

**Proof outline.**

1. (a) by the source's indirect proof: the support fibration K(R[t] on T) → K(R[t]) → K(R[t,t⁻¹]) is K.5's (Theorem V.2.6.3), and Exercise V.3.14 identifies K(R[t] on T) with K(H_T(R[t])) through the Approximation Theorem; the source's direct proof after Quillen (from Definition V.7.2 on) is not used.
2. Replace H_T(R[t]) by H_{1,T}(R[t]) by the Resolution Theorem: H_{1,T} is closed under extensions and under kernels of surjections in H_T, and every object of H_T has a finite resolution by objects of H_{1,T} (the argument of Corollary II.7.7.3).
3. (b): the equivalence H_{1,T}(R[t]) ≃ H_{1,t} and the exactness of j^* are Exercise V.7.5(a)–(b); K(P¹_R) ≃ K(H_1) is Exercise V.3.13, by the Resolution Theorem; the fibration is Exercise V.7.5(c), obtained as in (a) from the fibration and approximation theorems applied to length-one resolutions in mod-P¹_R, with the quotient identified with P(R[t⁻¹]) through j^*.
4. (c): the base change mod-P¹_R → mod-R[t], F ↦ M₊, is exact, carries H_{1,t} identically onto H_{1,T}(R[t]), VB(P¹_R) into P(R[t]) and P(R[t⁻¹]) into P(R[t,t⁻¹]), and so induces a map of fibration sequences that is the identity on the fibres.
5. Record Caveat V.7.1.1: the connective sequence (a) ends with a map K_0(R[t]) → K_0(R[t,t⁻¹]) that need not be onto; its continuation uses negative K-groups.

**Acceptance.**

- In degree zero, (a) is the exact sequence K_0 H_T(R[t]) → K_0(R[t]) → K_0(R[t,t⁻¹]) of Corollary II.7.7.4.
- The fibres of (a) and (b) are the same space K(Nil(R)); the class of (R, 0) goes to [R[t]/tR[t]] in (a) and to [(R, 0, 0)] = [u_0(R)] − [u_1(R)] in (b).
- The centrality and nonzerodivisor hypotheses on T are used; they are not decorative.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.5/relative-versus-support`, `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `GeneralAlgebraicKTheory:K.4/fibration-theorem`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- K-book, V.7.1 (Theorem 7.1) and the paragraph after it, printed pp. 420 to 421 (PDF pp. 428 to 429). Sequence (a), for S = T, and the indirect proof this node follows. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Theorem 7.1 (Localization for Nonzerodivisors). Let S be a central multiplicatively closed subset of R consisting of nonzerodivisors. Then K HS(R) → K(R) → K(S−1R) is a homotopy fibration. … We note that an indirect proof is given in Exercise 3.14 above, using Theorem 2.6.3.

- K-book, V.7.1.1 (Caveat 7.1.1), printed p. 421 (PDF p. 429). Why the connective sequence stops at K_0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Caveat 7.1.1. The map K0(R) → K0(S−1R) is not onto. Instead, the sequence continues with K−1HS(R) etc., using negative K-groups.

- K-book, Exercise V.3.14, printed p. 399 (PDF p. 407). The identification of the support term with the torsion category. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > 3.14. Let S be a set of central nonzerodivisors in a ring R. … (c) Show that the inclusion of Chb(H) in Chperf(MS) satisfies property (App), and conclude that K(R on S) ≃ K HS(R). By Theorem 2.6.3, this yields a long exact sequence Kn+1(S−1R) → KnHS(R) → Kn(R) → Kn(S−1R) →

- K-book, II.7.7.3 (Corollary 7.7.3), printed p. 137 (PDF p. 145). The reduction from H_S to H_{1,S}, in degree zero; the same resolution argument gives every degree. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Corollary 7.7.3. K0HS(R) ≅ K0Hn,S(R) ≅ K0H1,S(R) for all n ≥ 1. Proof. We apply the Resolution Theorem with P = H1,S(R).

- K-book, Exercise V.3.13, printed p. 399 (PDF p. 407). K(P¹_R) through modules with short resolutions. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > 3.13. Let P1R denote the projective line over an associative ring R, as in 1.5.4, and let Hn denote the subcategory of mod-P1R of modules having a resolution of length n by vector bundles. Show that K(P1R) ≃ K Hn for all n.

- K-book, Exercise V.7.5, printed p. 429 (PDF p. 437). Sequence (b): the torsion objects on P¹_R. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > 7.5. Let P1R denote the projective line over an associative ring R, as in 1.5.4, let H1 denote the subcategory of modules which have a resolution of length 1 by vector bundles, as in Ex. 3.13, and let H1,t denote the subcategory … H1 consisting of modules F = (M, 0, 0). (a) Show that H1,T(R[t]) → H1,t, M ↦ (M, 0, 0), is an equivalence of categories.

- K-book, Exercise V.7.5(b)–(c), printed p. 429 (PDF p. 437). Sequence (b): the fibration, stated for an associative ring as an exercise (s = 1/t). Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > (b) Show that there is an exact functor VB(P1R) --j∗--> P(R[1/t]), j∗(F) = M−. (c) Using Ex. 3.13, show that the inclusion H1,t ⊂ H1 induces a homotopy fibration sequence K HT(R[t]) → K(P1R) → K(R[s]) …

### Nil_n(R) ≅ NK_{n+1}(R)

`GeneralAlgebraicKTheory:K.6/nil-groups-are-NK` · *theorem*

For every unital ring R and every n ≥ 0 there is a natural isomorphism NK_{n+1}(R) ≅ Nil_n(R), where NK_{n+1}(R) is the cokernel of the split injection K_{n+1}(R) → K_{n+1}(R[t]) (equivalently of K_{n+1}(R) → K_{n+1}(R[t⁻¹])). It comes from the localisation sequence (b) of K.6/t-torsion-localisation-sequences, K_{n+1}(R[t⁻¹]) → K_n(R) ⊕ Nil_n(R) → K_n(P¹_R) → K_n(R[t⁻¹]) (the source's (8.1.1)), in which the summand K_n(R) maps to K_n(P¹_R) by u_0 − u_1 and Nil_n(R) maps to zero; the sequence therefore splits into 0 → K_n(R) → K_n(P¹_R) → K_n(R) → 0 and the isomorphism K_{n+1}(R[t⁻¹])/K_{n+1}(R) ≅ Nil_n(R).

**Hypotheses.**

- R is unital and associative. For commutative R the source uses the scheme sequence V.7.6.1; for noncommutative R it uses the gluing-category sequence of Ex. V.7.5, and this node uses the latter for every R.
- n ≥ 0: both sides are defined from connective K-theory.
- The isomorphism is natural in unital ring maps.

**Proof outline.**

1. Substitute Nil(R) ≃ H_{1,t} into the fibration (b) to obtain (8.1.1), with K_n H_{1,t} = K_n(R) ⊕ Nil_n(R).
2. Identify the map on the summand K_n(R): the composite P(R) → Nil(R) → H_1, P ↦ (P, 0, 0), sits in the exact sequence u_1(P) ↣ u_0(P) ↠ (P, 0, 0), obtained by tensoring P with 0 → O(−1) → O → (R, 0, 0) → 0, so by Additivity it induces u_0 − u_1.
3. By the projective-line splitting, (u_0, u_0 − u_1) : K(R) × K(R) → K(P¹_R) is an equivalence; so K_n(R) → K_n(P¹_R) is split injective and Nil_n(R) → K_n(P¹_R) is zero.
4. j^* u_0(P) = P ⊗_R R[t⁻¹], so j^* ∘ u_0 is the base change K(R) → K(R[t⁻¹]) that splits off K_n(R) from K_n(R[t⁻¹]) = K_n(R) ⊕ NK_n(R).
5. Conclude by the source's diagram chase that (8.1.1) splits as stated and that the boundary K_{n+1}(R[t⁻¹]) → K_n(R) ⊕ Nil_n(R) induces NK_{n+1}(R) ≅ Nil_n(R), naturally in R.

**Acceptance.**

- For n = 0 this is Nil_0(R) ≅ NK_1(R), the classical Proposition III.3.5.3.
- For A = k[ε], NK_1(A) ≅ Nil_0(A) ≅ (1 + εt·k[t])^× is non-zero, so N-terms genuinely occur.
- No regularity is assumed.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`, `GeneralAlgebraicKTheory:K.6/projective-line-splitting`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- K-book, V.8.1 (Theorem 8.1), printed p. 430 (PDF p. 438). The theorem. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 8.1. For every R and every n, Niln(R) ≅ NKn+1(R)

- K-book, V.8.1, proof, printed p. 430 (PDF p. 438). The localisation sequence the proof starts from. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Proof. We know from Ex. 7.5 that Nil(R) is equivalent to the category H1,t of modules F on the projective line P1R with j∗F = 0, and which have a length 1 resolution by vector bundles. Substituting this into Corollary 7.6.1 (or Ex. 7.5 if R is not commutative) yields the exact sequence Kn+1(R[1/t]) → Kn(R) ⊕ Niln(R) → Kn(P1R) → Kn(R[1/t]). (8.1.1)

- K-book, V.8.1, proof, continued, printed p. 430 (PDF p. 438). The map on the summand K_n(R). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Now the composition P(R) ⊂ Nil(R) → H(P1R) sends P to (P, 0, 0), and there is an exact sequence u1(P) ↣ u0(P) ↠ (P, 0, 0) obtained by tensoring P with the standard resolution 0 → O(−1) → O → (R, 0, 0) → 0. By Additivity 1.2, the corresponding map K(R) → K(P1R) in (8.1.1) is u0 − u1.

- K-book, V.8.1, proof, end, printed p. 430 (PDF p. 438). The splitting and the conclusion. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > By the Projective Bundle Theorem 1.5 (or 1.5.4 if R is not commutative), the map (u0, u0 − u1) : K(R) × K(R) → K(P1R) is an equivalence. … Thus (8.1.1) splits into the split extension 0 → Kn(R) --(u0 − u1)--> Kn(P1R) → Kn(R) → 0 and the desired isomorphism NKn+1(R) ≅ Kn+1(R[t])/Kn+1(R) ≅ Niln(R).

- K-book, III.3.5.3 (Proposition 3.5.3), printed p. 205 (PDF p. 213). The classical degree-zero case, an acceptance test. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Proposition 3.5.3. Nil0(R) ≅ NK1(R), and K0Nil(R) ≅ K0(R) ⊕ NK1(R).

### The Fundamental Theorem in positive degrees: exactness

`GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees` · *theorem*

For every unital ring R and every n ≥ 1 the sequence 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t,t⁻¹]) → K_{n−1}(R) → 0 is exact. The first map is the pair of base changes, the second their difference, and the last, ∂, is the boundary of the t-localisation sequence (a) of K.6/t-torsion-localisation-sequences followed by the forgetful retraction K_{n−1} Nil(R) = K_{n−1}(R) ⊕ Nil_{n−1}(R) → K_{n−1}(R). The splitting of ∂ is K.6/multiplication-by-t-splits-the-boundary; with the maps t ↦ 1 it makes the sequence naturally split.

**Hypotheses.**

- R is unital and associative and n ≥ 1, where K_n is Quillen's; degree zero is Bass's theorem for K_0 (K.6/negative-k-groups-are-contracted) and the negative degrees are Bass's.
- The transfer along f : R[t] → R = R[t]/(t) is the finite-projective-dimension transfer of K.3, since R has the resolution 0 → R[t] → R[t] → R → 0 over R[t].

**Proof outline.**

1. Base change mod-P¹_R → mod-R[t] maps the localisation sequence (b) to (a) (part (c) of K.6/t-torsion-localisation-sequences), giving a commutative ladder of long exact sequences that is the identity on the terms K_n(H_{1,T}(R[t])).
2. In the lower row, the map K_n(R) → K_n Nil(R) → K_n(R[t]) on the summand K_n(R) is the transfer f_* along f : R[t] → R, which is zero by Additivity applied to 0 → M[t] → M[t] → M → 0 (Example V.3.5.1).
3. In the upper row, Nil_n(R) → K_n(P¹_R) is zero and K_n(R) → K_n(P¹_R) is u_0 − u_1 (the proof of K.6/nil-groups-are-NK).
4. Chase the ladder to obtain the exactness of Seq(K_n, R) for n ≥ 1, with ∂ as stated; injectivity on the left is split by t ↦ 1.

**Acceptance.**

- For n = 1 the sequence is the classical Fundamental Theorem for K_1 (III.3.6) under the plus = Q identification of K.2:plus.
- The theorem is asserted only for n ≥ 1; for n ≤ 0 the corresponding sequence is Bass's (K.6/negative-k-groups-are-contracted), not a consequence of this node.
- No regularity hypothesis is used: the terms NK_n(R) ≅ Nil_{n−1}(R) sit inside the middle terms.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`, `GeneralAlgebraicKTheory:K.6/nil-groups-are-NK`, `GeneralAlgebraicKTheory:K.6/projective-line-splitting`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- K-book, V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438). The theorem (the bracket is the source's). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 8.2. [Fundamental Theorem] There is a canonically split exact sequence 0 → Kn(R) → Kn(R[t]) ⊕ Kn(R[1/t]) → Kn(R[t, 1/t]) → Kn−1(R) → 0. in which the splitting of ∂ is given by multiplication by t ∈ K1(Z[t, t−1]).

- K-book, V.8.2, proof, printed p. 431 (PDF p. 439). The ladder. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Proof. Because the base change mod-P1R → mod-R[t] … between the localization sequences for T in Theorem 7.1 and (8.1.1), yielding the commutative diagram

- K-book, V.8.2, proof, continued, printed p. 431 (PDF p. 439). Exactness in positive degrees. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Now Kn(R) → KnNil(R) → Kn(R[t]) … f∗ of (3.3.2), induced from the ring map f : R[t] → R, and Niln(R) → Kn(P1R) is zero by the proof of Theorem 8.1, Since f∗ is zero by 3.5.1, the diagram yields the exact sequence Seq(Kn, R) displayed in the Theorem, for n ≥ 1.

- K-book, V.3.5.1 (Example 3.5.1), printed p. 388 (PDF p. 396). The vanishing of the transfer. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > In contrast, the transfer maps K(R) --f∗--> K(R[s]) … G(R) --f∗--> G(R[s]) are zero. This follows from the Additivity Theorem applied to the sequence of functors i∗ ↣ i∗ ↠ f∗ sending an R-module M to 0 → M[s] --s--> M[s] → M → 0.

### Multiplication by the class of t splits the boundary

`GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary` · *lemma*

Let [t] ∈ K_1(ℤ[t,t⁻¹]) be the class of the unit t, and for a unital ring R and x ∈ K_n(R), n ≥ 0, let {t, x} ∈ K_{n+1}(R[t,t⁻¹]) be the external product of [t] with x for the pairing induced by the biexact functor ⊗_ℤ : P(ℤ[t,t⁻¹]) × P(R) → P(R[t,t⁻¹]) (K.7/products-from-biexact-functors). Then the boundary ∂ of the t-localisation sequence satisfies ∂({t, x}) = x̄, where x̄ is the image of x under K_n(R) → K_n(R[t]/tR[t]) = K_n(R) → K_n(H_{1,T}(R[t])), that is the class (x, 0) in K_n(R) ⊕ Nil_n(R). Consequently x ↦ {t, x} is a right inverse of the boundary of the Fundamental Theorem, natural in R, and with the maps t ↦ 1 it splits the sequence of K.6/fundamental-theorem-positive-degrees. The sign is the one the source's conventions give, ∂[t] = [ℤ[t]/tℤ[t]]; with another sign convention for ∂ a universal sign ±1 appears and must be carried.

**Hypotheses.**

- R is unital and associative; the pairing is external, with ℤ[t,t⁻¹] as the left factor, so no commutativity of R is needed.
- [t] is the class of the unit t in the classical K_1(ℤ[t,t⁻¹]) = GL/E (KTheoryLowDegrees U.2 and U.3/units-to-K1), carried to Quillen's K_1, the first homotopy group of the K-theory space, by the plus = Q comparison (K.2:plus/plus-equals-Q) and π_1 BGL(ℤ[t,t⁻¹])⁺ = GL/E with the matrix-loop compatibility (StableHomotopyKTheory H.3, requested). The identification of the classical low-degree models registered in K.2:low-degree-comparisons is not used: that stage lies downstream of K.6.
- The boundary is linear for the pairing because the biexact functors ⊗_ℤ with P(R) carry the t-localisation fibration for ℤ[t] to that for R[t]; this compatibility is the content of Exercise V.8.1 and Ex. IV.1.23, and it is proved here from the naturality of K.7's pairing.

**Proof outline.**

1. The biexact functors P(ℤ[t]) × P(R) → P(R[t]), P(ℤ[t,t⁻¹]) × P(R) → P(R[t,t⁻¹]) and H_{1,T}(ℤ[t]) × P(R) → H_{1,T}(R[t]), all given by ⊗_ℤ, are compatible with the functors of the two t-localisation sequences (a). They are exact in each variable because the objects of H_{1,T}(ℤ[t]) are free abelian groups (Lemma II.7.8.2), so tensoring over ℤ with a projective R-module preserves their resolutions.
2. By K.7's pairing and its naturality in each variable, these functors give a map from the smash product of the ℤ[t]-sequence with K(R) to the R[t]-sequence that commutes with the boundaries (Ex. IV.1.23); hence ∂(y · x) = ∂(y) · x for y ∈ K_{m+1}(ℤ[t,t⁻¹]) and x ∈ K_n(R) (Exercise V.8.1).
3. Compute ∂[t] = [ℤ[t]/tℤ[t]] in K_0 H_{1,T}(ℤ[t]), the class of (ℤ, 0) in K_0 Nil(ℤ), and observe that its product with x is x̄.
4. Conclude that ∂ ∘ {t, −} is the inclusion of K_n(R) as the first summand of K_n(R) ⊕ Nil_n(R), so that after the forgetful retraction it is the identity; naturality in R follows from the naturality of the pairing in its second variable.

**Acceptance.**

- ∂({t, [R]}) = [R] in K_0(R): the product of the unit class with t has boundary the unit class.
- x ↦ {t, x} commutes with the maps induced by unital ring maps R → R′.
- Only the external product with the fixed class [t] over ℤ is used, never an internal product on K_*(R), so the lemma holds for noncommutative R.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`, `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`, `KTheoryLowDegrees:U.3/units-to-K1`, `KTheoryLowDegrees:U.2/K1`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.3`, `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- K-book, V.8.2, proof, the splitting, printed p. 431 (PDF p. 439). The splitting and the formula. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > To see that Seq(Kn, R) is split exact, we only need to show that ∂ is split by t ∈ K1(R[t, 1/t]) … commute with multiplication by K∗(R), by Exercise 8.1 (or Ex. IV.1.23). Hence we have the formula: ∂({t, x}) = ∂(t)x = [R[t]/tR[t]]x = x. This shows that x ↦ {t, x} is a right inverse to ∂

- K-book, Exercise V.8.1, printed p. 434 (PDF p. 442). The boundary formula, for the general central nonzerodivisor. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > 8.1. For any central nonzerodivisor s ∈ R … yields a map Kn(R) → Kn+1(R[1/s]) … ∂ : Kn+1(R[1/s]) → KnHs(R) satisfies ∂({s, x}) = x̄ for every x ∈ Kn(R), where x̄ is the image of x under the natural map Kn(R) → Kn(R/sR) → KnHs(R). Hint: … the ring map Z[t] → R, t ↦ s, induces compatible pairings

- K-book, Exercise IV.1.23, printed p. 276 (PDF p. 284). Pairings of fibrations commute with the boundaries (the exercise's displayed diagram, which the text layer does not carry). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > 1.23. Let F → E --p--> B and F′ → E′ --p′--> B′ be homotopy fibrations (1.2), and suppose given pairings e : E ∧ X → E′, b : B ∧ X → B′ so that p′e = b(p ∧ 1).

### K_1, K_0 and every K_{−n} are contracted functors: K_{−n} = Lⁿ K_0

`GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted` · *theorem*

The functors K_1 and K_0 on unital rings are contracted in the sense of Definition III.4.1.1, with LK_1 = K_0 and LK_0 = K_{−1}: for every R the sequences 0 → K_i(R) → K_i(R[t]) ⊕ K_i(R[t⁻¹]) → K_i(R[t,t⁻¹]) → K_{i−1}(R) → 0, for i = 1 and i = 0, are exact with splittings natural in R and in t, and K_0(R[t,t⁻¹]) ≅ K_0(R) ⊕ K_{−1}(R) ⊕ NK_0(R) ⊕ NK_0(R). Consequently every K_{−n}, n ≥ 0, is a contracted functor with L K_{−n} = K_{−n−1}, that is K_{−n} = Lⁿ K_0, with naturally split exact sequences 0 → K_{−n}(R) → K_{−n}(R[t]) ⊕ K_{−n}(R[t⁻¹]) → K_{−n}(R[t,t⁻¹]) → K_{−n−1}(R) → 0, and NL K_{−n} ≅ LN K_{−n}.

**Hypotheses.**

- R is unital and associative; the splittings are natural in the ring and in the variable, which is what contractedness requires.
- In degree one the splitting is multiplication by [t] (K.6/multiplication-by-t-splits-the-boundary); in degree zero it is obtained from degree one in a second variable, as in the source's proof of III.3.7.
- The negative groups are Bass's, defined by iterated cokernels (K.6/negative-k-groups); this node proves that the iteration is the contraction of contracted functors.

**Proof outline.**

1. Degree one: K.6/fundamental-theorem-positive-degrees at n = 1, with the splitting x ↦ {t, x} and the maps t ↦ 1, shows that K_1 is contracted with LK_1 = K_0 (under plus = Q this is III.3.6).
2. Degree zero (III.3.7): apply degree one in the variable t to R[s], R[s⁻¹] and R[s,s⁻¹]; the natural decompositions make the map K_1(R[s,t,t⁻¹]) ⊕ K_1(R[s⁻¹,t,t⁻¹]) → K_1(R[s,s⁻¹,t,t⁻¹]) a direct sum of maps, so its cokernel, which is K_0(R[t,t⁻¹]) by degree one in the variable s, inherits a natural splitting; this gives the sequence for K_0 and the four-term decomposition.
3. Prove Proposition III.4.2: the kernel and the cokernel of a morphism of contracted functors are contracted, NF and LF are contracted when F is, and NLF ≅ LNF.
4. Induct: K_{−n−1} = L K_{−n} by Definition III.4.1, and L of a contracted functor is contracted, so every K_{−n} is contracted (Example III.4.1.2).

**Acceptance.**

- K_0(R[t,t⁻¹]) ≅ K_0(R) ⊕ K_{−1}(R) ⊕ NK_0(R) ⊕ NK_0(R) naturally, as III.3.7 states.
- For R regular noetherian NK_0(R) = 0 = K_{−1}(R) (Theorem II.7.8), so K_0(R[t,t⁻¹]) ≅ K_0(R).
- An acyclic functor need not be contracted (Ex. III.4.1): the contractedness of K_{−n} uses the natural splittings, not only exactness.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- K-book, III.3.6 (Fundamental Theorem for K1 3.6), printed p. 205 (PDF p. 213). Degree one, in the classical form. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Fundamental Theorem for K1 3.6. For every ring R, there is a split surjection K1(R[t, t−1]) --∂--> K0(R), with inverse … This map fits into a naturally split exact sequence: 0 → K1(R) → K1(R[t]) ⊕ K1(R[t−1]) → K1(R[t, t−1]) → K0(R) → 0.

- K-book, III.3.7 (Fundamental Theorem for K0 3.7), printed p. 206 (PDF p. 214). Degree zero. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Fundamental Theorem for K0 3.7. For every ring R, there is a naturally split exact sequence: 0 → K0(R) → K0(R[t]) ⊕ K0(R[t−1]) → K0(R[t, t−1]) → K−1(R) → 0. Consequently, we have a natural direct sum decomposition: K0(R[t, t−1]) ≅ K0(R) ⊕ K−1(R) ⊕ NK0(R) ⊕ NK0(R).

- K-book, III.3.7, proof, printed p. 206 (PDF p. 214). The two-variable argument. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Proof. Let s be a second indeterminate. The Fundamental Theorem for K1, applied to the variable t, gives a natural decomposition K1(R[s, t, t−1]) ≅ K1(R[s]) ⊕ NK1(R[s]) ⊕ NK1(R[s]) ⊕ K0(R[s]), and similar decompositions for the other terms … Therefore the cokernel of this map also has a natural splitting.

- K-book, III.4.1.2 (Example 4.1.2), printed p. 210 (PDF p. 218). Every negative group is contracted. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Example 4.1.2 (Fundamental Theorem for K−n). We can restate the Fundamental Theorems for K1 and K0 as the assertions that these are contracted functors. It follows from Proposition 4.2 below that each K−n is a contracted functor

- K-book, III.4.2 (Proposition 4.2), printed p. 211 (PDF p. 219). The closure properties the induction uses. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Proposition 4.2. Let η : F ⇒ F′ be a morphism of contracted functors. Then both ker(η) and coker(η) are also contracted functors. In particular, if F is contracted, then NF and LF are also contracted functors. Moreover, there is a natural isomorphism of contracted functors NLF ≅ LNF.

- K-book, III.4.1.1, the paragraph after the definition, printed p. 210 (PDF p. 218). Bass's groups are the iterated contractions of K_0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > By iterating this definition, we can speak about the functors NLF, L2F, etc. For example, Definition 4.1 states that K−n = Ln(K0).

### The Fundamental Theorem with Nil terms, in every degree

`GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms` · *theorem*

For every unital ring R and every integer n there is a canonically split exact sequence 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t,t⁻¹]) → K_{n−1}(R) → 0, natural in R, in which the splitting of the boundary is multiplication by the class of the variable t in K_1(ℤ[t,t⁻¹]) and the maps t ↦ 1 give the rest of the splitting; for n ≤ 0 the groups are Bass's and the sequence is the one that makes K_n a contracted functor. Writing NK_n(R) for the cokernel of K_n(R) → K_n(R[t]), this gives K_n(R[t,t⁻¹]) ≅ K_n(R) ⊕ K_{n−1}(R) ⊕ NK_n(R) ⊕ NK_n(R), and for n ≥ 0 the N-terms are Nil groups: NK_{n+1}(R) ≅ Nil_n(R). When the N-terms vanish the decomposition has the two terms K_n(R) ⊕ K_{n−1}(R). The scheme form (V.8.3) is not part of this node: SchemeKTheoryOperations S.5 owns it and imports this ring theorem, and no prerequisite of this node lies in that roadmap.

**Hypotheses.**

- R is unital and associative and n is any integer: K_n is Quillen's for n ≥ 0 and Bass's for n < 0.
- The Nil category is the category of pairs of a finitely generated projective module and a nilpotent endomorphism, and the Nil groups are the reduced part of its K-theory (K.6/nil-category-and-nil-groups); the identification NK_{n+1} ≅ Nil_n is for n ≥ 0.
- The vanishing of the N-terms for a regular noetherian ring is not part of this node: in degrees ≤ 0 it comes from II.7.8 through the contraction, which is all that K.6/vanishing-for-regular-noetherian-rings needs; in positive degrees it is the homotopy invariance of K-theory for regular rings (V.6.3), which this packet records but does not decompose.

**Proof outline.**

1. n ≥ 1: exactness is K.6/fundamental-theorem-positive-degrees, and the splitting of the boundary by x ↦ {t, x} is K.6/multiplication-by-t-splits-the-boundary; the maps t ↦ 1 split the left half.
2. n ≤ 0: K_0 and every K_{−n} are contracted with LK_{−n} = K_{−n−1} (K.6/negative-k-groups-are-contracted), which is the sequence in these degrees; in degree zero its splitting is induced from multiplication by t in degree one, as in the proof of III.3.7.
3. The four-term decomposition follows from the split sequence and the definition of NK_n.
4. Identify the N-terms with the Nil groups in degrees n + 1 ≥ 1 by K.6/nil-groups-are-NK.
5. Record the relation to the contracted-functor formalism: the theorem says exactly that every K_n, n ∈ ℤ, is a contracted functor with LK_n = K_{n−1}.
6. Record the boundary with the scheme roadmap: the scheme form V.8.3 is SchemeKTheoryOperations S.5's, which imports this node; the earlier prerequisite on S.5 was the reverse of the stage order and is removed.

**Acceptance.**

- For a singular ring the N-terms can be non-zero and the decomposition has four terms; no node may drop them (for A = k[ε], NK_1(A) ≅ Nil_0(A) ≠ 0).
- The splitting is by multiplication by the class of the variable, and a different splitting would change the identification of the boundary.
- When NK_n(R) = 0 the decomposition has the two terms K_n(R) ⊕ K_{n−1}(R).

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/nil-groups-are-NK`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/contracted-functors`, `mathlib:LaurentPolynomial`

**Sources.**

- K-book, V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438). The theorem (the bracket is the source's). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 8.2. [Fundamental Theorem] There is a canonically split exact sequence 0 → Kn(R) → Kn(R[t]) ⊕ Kn(R[1/t]) → Kn(R[t, 1/t]) → Kn−1(R) → 0. in which the splitting of ∂ is given by multiplication by t ∈ K1(Z[t, t−1]).

- K-book, V.8.1 (Theorem 8.1), printed p. 430 (PDF p. 438). The identification of the N-terms with Nil. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 8.1. For every R and every n, Niln(R) ≅ NKn+1(R)

- K-book, V.8, the opening paragraph, printed p. 430 (PDF p. 438). The regular case. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > The main goal of this section is to prove the Fundamental Theorem, which gives a decomposition of K∗(R[t, 1/t]). For regular rings, the decomposition simplifies to the formulas NKn(R) = 0 and Kn(R[t, 1/t]) ≅ Kn(R) ⊕ Kn−1(R) of Theorem 6.3.

- K-book, V.8.2, proof, printed p. 431 (PDF p. 439). The non-positive degrees come from Bass's contraction. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > The exact sequence Seq(Kn, R) for n ≤ 0 was constructed in III.4.1.2.

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

- `bass_satisfies` (*computation*) — Bass’s groups satisfy all four axioms.
- `nonunital` (*non-example*) — The second axiom is stated for non-unital rings; restricting to unital rings weakens it.
- `infinite_matrices` (*non-example*) — The fourth axiom is about the infinite matrix ring, not the finite ones.
- `degree_zero` (*computation*) — In degree zero the theory is the Grothendieck group, so the axioms extend the existing definition rather than replacing it.

**Sources.**

- K-book, III.4.4 (Definition 4.4), printed p. 213 (PDF p. 221). The definition. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 4.4. A theory of negative K-theory for (nonunital) rings consists of a sequence of functions Kn (n ≤ 0) from nonunital rings to abelian groups, together with natural boundary maps ∂ : Kn(R/I) → Kn−1(I) for every 2-sided ideal I ⊂ R, satisfying the following axioms.

- K-book, III.4.4, axioms (3)–(4), printed p. 213 (PDF p. 221). The last two axioms, checked against the node's list. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > (3) If Λ is a flasque ring (II.2.1.3), then Kn(Λ) = 0 for all n ≤ 0; (4) The inclusion R ⊂ M(R) = ∪Mm(R) induces an isomorphism Kn(R) ≅ Kn(M(R)) for each n ≤ 0.

- K-book, III.4.4.1 (Example 4.4.1), printed p. 214 (PDF p. 222). Bass's groups satisfy the axioms. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Example 4.4.1. Bass' negative K-groups (4.1) form a theory of negative K-theory for rings.

### Mayer–Vietoris for a Milnor square, continued into negative degrees

`GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k` · *theorem*

Let f : R → S be a homomorphism of unital rings and I ⊂ R an ideal that f maps isomorphically onto an ideal J of S, so that R → S, R/I → S/J is a Milnor square. The Mayer–Vietoris sequence of Theorem III.2.6, K_1(R) → K_1(S) ⊕ K_1(R/I) → K_1(S/J) → K_0(R) → K_0(S) ⊕ K_0(R/I) → K_0(S/J), continues as a long exact sequence of Bass's negative K-groups: … → K_{1−n}(S/J) → K_{−n}(R) → K_{−n}(S) ⊕ K_{−n}(R/I) → K_{−n}(S/J) → K_{−n−1}(R) → … for every n ≥ 0, each negative boundary being the contraction of the one above it. The sequence starts at K_1(R): no exactness is asserted at K_n for n ≥ 2, where excision fails in general. The K_1–K_0 part is imported from K.5 (K.5/milnor-square-mayer-vietoris); the spectrum form in degrees ≤ 0 is K.6/milnor-square-excision-in-nonpositive-degrees. This is the form of excision available in negative degrees, and one of the two reasons the negative groups are useful.

**Hypotheses.**

- The square is the one determined by a ring map and an ideal carried bijectively onto an ideal (a Milnor square); no commutativity is assumed.
- The sequence is asserted from K_1(R) downward only; it continues downwards indefinitely, which is what distinguishes the negative groups from the connective theory.
- The K_1–K_0 part of the sequence (III.2.6), with its boundary, is K.5/milnor-square-mayer-vietoris and is imported, natural in maps of Milnor squares. There K_1 is the classical GL/E (KTheoryLowDegrees U.2); for the contraction it is identified with Quillen's K_1, naturally in the ring, by the plus = Q comparison (K.2:plus/plus-equals-Q) and π_1 BGL(R)⁺ = GL(R)/E(R) (StableHomotopyKTheory H.3, requested), not through K.2:low-degree-comparisons, which lies downstream of K.6.

**Proof outline.**

1. State the hypotheses and note that the square stays a Milnor square after R ↦ R[t], R[t⁻¹], R[t,t⁻¹] (with I[t] and so on), so the K_1–K_0 sequence exists for each of these squares, naturally.
2. Import the K_1–K_0 Mayer–Vietoris sequence of III.2.6 (K.5/milnor-square-mayer-vietoris), and pass from the classical K_1 to Quillen's, naturally in the ring, through the plus = Q comparison and π_1 BGL(R)⁺ = GL(R)/E(R) (H.3).
3. Use that K_1, K_0 and every K_{−n} are contracted (K.6/negative-k-groups-are-contracted), and check that every map of the sequence is a morphism of contracted functors of the Milnor square: for the maps induced by ring maps this is naturality; for the boundary it is the compatibility of the patching boundary with the natural splittings, which the source leaves implicit and which is a proof obligation of this node.
4. Apply L: on naturally split sequences of contracted functors with compatible maps L is exact (the argument of Proposition III.4.2), and it turns the K_1–K_0 sequence into the K_0–K_{−1} sequence, whose first three terms are the last three of the K_1–K_0 sequence; splice, and iterate.
5. Record the consequence: an excision failure in degree zero is measured by a first negative group, which is how the negative groups are computed in practice.

**Acceptance.**

- Dayton's example III.4.3.1: for the Milnor square of the n-dimensional tetrahedron over a field F the sequence gives K_{−n}(Δ_n(F)) ≅ ℤ, so the negative groups of singular rings can be non-zero.
- The sequence does not terminate below, which is what makes the negative groups a genuinely infinite family.
- No statement is made at K_2 or above, and the connective theory has no negative groups: the continuation is a statement about Bass's groups, equivalently about K^B (K.6/bass-spectrum-homotopy-groups).

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`, `KTheoryLowDegrees:U.2/K1`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.3`

**Sources.**

- K-book, III.4.3 (Theorem 4.3), printed pp. 212–213 (PDF pp. 220–221). The theorem; the displayed sequence follows on p. 213. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 4.3 (Mayer-Vietoris). Suppose we are given a ring map f : R → S and an ideal I of R mapped isomorphically into an ideal of S. Then the Mayer-Vietoris sequence of Theorem 2.6 continues as a long exact Mayer-Vietoris sequence of negative K-groups.

- K-book, III.4, the paragraph before Theorem 4.3, printed p. 212 (PDF p. 220). The proof by contraction. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Applying the contraction operation L to this sequence gives a sequence relating K0 to K−1, whose first three terms are identical to the last three terms of the displayed sequence. Splicing these together yields a longer sequence. Repeatedly applying L and splicing sequences leads to the following result.

- K-book, III.2.6 (Theorem 2.6), printed p. 195 (PDF p. 203). The K_1–K_0 part, imported from K.5. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 2.6 (Mayer-Vietoris). Given a Milnor square as above, there is an exact sequence K1(R) → K1(S) ⊕ K1(R/I) → K1(S/I) → K0(R) → K0(S) ⊕ K0(R/I) → K0(S/I).

- K-book, III.4.3.1 (Example 4.3.1), printed p. 213 (PDF p. 221). Dayton's example, an acceptance test. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > In particular, if F is a field then Δn(F) is an n-dimensional noetherian ring with K−n(Δn(F)) ≅ Z

### The nonconnective Bass K-theory spectrum

`GeneralAlgebraicKTheory:K.6/nonconnective-spectrum` · *construction* · planet **The Bass K-theory spectrum**

For a functor E from rings to spectra, let LE be the homotopy cofiber of the map from the homotopy pushout of the two polynomial spectra over the spectrum of the ring into the spectrum of the Laurent ring, and let the desuspended functor be its loop space; there is a cofibration sequence natural in both arguments. Multiplication by the class of the variable, the external product with [x] ∈ K_1(ℤ[x,x⁻¹]) (K.7/products-from-biexact-functors), gives a natural map from the K-theory spectrum to its desuspension, which the Fundamental Theorem shows is the inclusion of the minus-one-connective cover; iterating gives maps of the k-fold desuspensions, each the inclusion of a deeper connective cover, and the nonconnective Bass spectrum is the homotopy colimit of that diagram. Its homotopy groups, the K-groups in non-negative degrees and Bass's negative groups below, are computed in K.6/bass-spectrum-homotopy-groups.

**Hypotheses.**

- E is a functor from rings to spectra; for the main statements E is a functorial model of connective K-theory of rings, here the early ring functor of K.2:plus with the spectrum that K.4:construction and StableHomotopyKTheory H.5:S-delooping assemble.
- The homotopy pushout, the homotopy cofiber, loops and the homotopy colimit are taken in spectra, which StableHomotopyKTheory H.5:spectra supplies; neither pinned library has spectra, which the audit records.
- The comparison map is multiplication by the class of the variable in the first K-group of the Laurent polynomial ring over the integers, an instance of K.7's pairing; the atlas stage order places K.7 after K.6, and the packet's restructuring proposal asks for an early K.7 product stage.

**Proof outline.**

1. Define the functor LE by the displayed homotopy cofiber and the desuspension as its loop space, and record the natural cofibration sequence.
2. Construct the comparison map as the external product with a map S¹ → K(ℤ[x,x⁻¹]) representing [x] (IV.1.10.2, Ex. IV.4.14), followed by K(R[x,x⁻¹]) → LK(R); record that the Fundamental Theorem identifies it with the inclusion of the (−1)-connective cover (IV.10.2, the topological form V.8.4).
3. Iterate the construction to obtain maps from the (k−1)-fold desuspension to the k-fold one.
4. Define the nonconnective spectrum as the homotopy colimit of the resulting diagram (IV.10.4).
5. Record naturality in the ring and in the model: the construction is natural in E, so two models with a natural equivalence give equivalent nonconnective spectra.
6. Leave the computation of the homotopy groups to K.6/bass-spectrum-homotopy-groups, to which the former API items bassSpectrum_pi_nonneg and bassSpectrum_pi_neg are promoted.

**Acceptance.**

- In non-negative degrees the nonconnective spectrum has the K-groups of the connective one, which is the agreement the stage text asks for.
- In degree minus k it has Bass's k-th negative group.
- The construction uses no regularity hypothesis, and for a regular noetherian ring it produces a spectrum with vanishing negative homotopy, which is the vanishing theorem and not an input.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:S-delooping`

**API.**

| name | role | statement |
| --- | --- | --- |
| `deloop` | data | The functor LE and its desuspension. |
| `deloop_cofibration` | characterisation | The natural cofibration sequence. |
| `bassSpectrum` | data | The nonconnective Bass K-theory spectrum. |
| `bassSpectrum_natural` | functoriality | Naturality in the ring and in the model of connective K-theory. |
| `bassSpectrum_independent` | compatibility | Two naturally equivalent models of connective K-theory give equivalent nonconnective spectra. |

**Used by.**

- *K.6, localisation* — The nonconnective formulation of localisation is a statement about this spectrum and is what makes the boundary maps extend into negative degrees.
- *K.7* — The invariance and product statements are asserted at the level of this spectrum, not only of the connective one.
- *The stage text* — The flasque-enlargement route the text names is an alternative construction; it is compared with this one through the axioms of the previous node.

**Unit tests.**

- `agrees_above_zero` (*non-example*) — In non-negative degrees the homotopy groups are the K-groups of the connective spectrum.
- `degree_minus_one` (*computation*) — In degree minus one the homotopy group is the first negative K-group.
- `regular_case` (*computation*) — For a regular noetherian ring the negative homotopy vanishes.
- `model_independence` (*computation*) — Two models of connective K-theory related by a natural equivalence give equivalent nonconnective spectra.

**Sources.**

- K-book, IV.10.1 (Definition 10.1), printed p. 349 (PDF p. 357). The construction. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 10.1. Write LE(R) for the spectrum homotopy cofiber of the map f0 from this homotopy pushout to E(R[x, x−1]), and ΛE(R) for the desuspension ΩLE(R). Since the mapping cone is natural, LE and ΛE are functors and there is a cofibration sequence, natural in E and R

- K-book, IV.10.2 (Fundamental Theorem 10.2), printed p. 349 (PDF p. 357). The first desuspension. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Fundamental Theorem 10.2. For any ring R, the map K(R) → ΛK(R) induces a homotopy equivalence between K(R) and the (−1)-connective cover of the spectrum ΛK(R). In particular, Kn(R) ≅ πnΛK(R) for all n ≥ 0.

- K-book, IV.10, before Theorem 10.2, printed p. 349 (PDF p. 357). The comparison map is a product with the class of x. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > Fix a map S1 → K(Z[x, x−1]) represented by the element x ∈ K1(Z[x, x−1]) … 1.10.2 and Ex. 4.14 that this map induces a product map K(R) --x--> K(R[x, x−1]) … Composing with K(R[x, x−1]) → LK(R) … yields a map of spectra K(R) → ΛK(R).

- K-book, IV.10.3 (Corollary 10.3), printed p. 349 (PDF p. 357). The iteration (the corollary's last clause carries the misprint recorded as E1). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Corollary 10.3. For k > 0 the map Λk−1K(R) → ΛkK(R) induces a homotopy equivalence between Λk−1K(R) and the (−k)-connective cover of ΛkK(R), with Kn(R) ≅ πnΛkK(R) for n > −k

- K-book, IV.10.4 (Definition 10.4), printed p. 350 (PDF p. 358). The Bass spectrum. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 10.4. We define KB(R) to be the homotopy colimit of the diagram K(R) → ΩLK(R) ← ΛK(R) → · · · Λk−1K(R) → ΛkΩLK(R) ← ΛkK(R) → · · ·

### The homotopy groups of the Bass spectrum are the K-groups and Bass's negative groups

`GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups` · *theorem*

For every unital ring R the canonical map K(R) → K^B(R) induces isomorphisms K_n(R) ≅ π_n K^B(R) for all n ≥ 0, and for every n ≥ 1 there is an isomorphism π_{−n} K^B(R) ≅ K_{−n}(R) = Lⁿ K_0(R) with Bass's negative group; both are natural in unital ring maps. The isomorphism in degree −k is the one Corollary IV.10.3 constructs: the composite of multiplication by x, K_{−k}(R) → K_{1−k}(R[x,x⁻¹]), with K_{1−k}(R[x,x⁻¹]) ≅ π_{1−k}Λ^{k−1}K(R[x,x⁻¹]) → π_{−k}Λ^kK(R), so the contraction splittings of Bass's groups are realised by multiplication by x on spectra. This is the identification of the negative groups of rings with Bass's construction that the stage text asks for; for Schlichting's IK(R) the same groups are obtained by the ring clause of K.6/agreement-and-vanishing-of-negative-K, which proves that comparison.

**Hypotheses.**

- K^B(R) is the homotopy colimit of the iterated desuspensions of K.6/nonconnective-spectrum, built from a functorial model of connective K-theory of rings (the early ring node of K.2:plus, with the spectrum of K.4:construction and H.5:S-delooping).
- The negative groups are Bass's iterated contractions; the connective model K(R) has π_{−n} K(R) = 0 for n ≥ 1, so the identification has to go through K^B.
- Corollary IV.10.3 is read with the misprint E1 corrected.

**Proof outline.**

1. The first desuspension: the Fundamental Theorem in every degree (K.6/fundamental-theorem-with-nil-terms) gives π_n LK(R) ≅ K_{n−1}(R) for n > 0, and with the theorems for K_1 and K_0 it gives π_0 ΛK(R) = K_0(R), π_{−1} ΛK(R) = K_{−1}(R) and π_n ΛK(R) = 0 for n < −1; so K(R) → ΛK(R) is the (−1)-connective cover (IV.10.2, the topological form V.8.4).
2. Iterate (Corollary IV.10.3): Λ^{k−1}K(R) → Λ^kK(R) is the (−k)-connective cover, with π_n Λ^kK(R) ≅ K_n(R) for n > −k and π_{−k}Λ^kK(R) ≅ K_{−k}(R) through the composite with multiplication by x, using that every K_{−n} is contracted.
3. Pass to the homotopy colimit (Definition IV.10.4): π_n K^B(R) is the colimit of the π_n Λ^kK(R), which is attained at a finite stage, giving the stated isomorphisms.
4. Naturality in R: Λ and the homotopy colimit are functorial, and every map in the previous steps is natural in R; multiplication by x is natural by K.6/multiplication-by-t-splits-the-boundary.
5. Record that π_{−n} of the connective spectrum is zero for every ring, which is why the vanishing of Bass's groups can never be read off from K(R).

**Acceptance.**

- π_{−1}K^B(R) ≅ K_{−1}(R) = coker(K_0(R[t]) ⊕ K_0(R[t⁻¹]) → K_0(R[t,t⁻¹])).
- For Dayton's n-dimensional tetrahedron Δ_n(F) over a field F, π_{−n}K^B(Δ_n(F)) ≅ ℤ (III.4.3.1), while π_{−n}K(Δ_n(F)) = 0.
- The isomorphisms commute with the maps induced by unital ring homomorphisms.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`

**Sources.**

- K-book, IV.10, the opening paragraph, printed p. 349 (PDF p. 357). The purpose: the negative homotopy is Bass's groups (the source's own spelling kept). Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > In §III.4 we introduced the negative K-groups of a ring using Bass' Fundamental Theorem III.3.7 … a non-connective "Bass K-theory spectrum" KB(R) with πnKB(R) = Kn(R) for all n < 0. In this section we constuct such a non-connective spectrum starting from any one of the functorial models of a connective K-theory spectrum K(R).

- K-book, IV.10.3, proof, printed p. 350 (PDF p. 358). The identification in degree −k, through multiplication by x. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > It follows from III.4.1.2 that for n > −k the maps Kn(R) ≅ πnΛk−1K(R) → πnΛkK(R) are isomorphisms, and that the composite K−k(R) --x--> K1−k(R[x, x−1]) ≅ π1−kΛk−1K(R[x, x−1]) → π−kΛkK(R) is an isomorphism.

- K-book, IV.10.4 (Definition 10.4), last sentence, printed p. 350 (PDF p. 358). The homotopy groups of the Bass spectrum. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > By 10.3, the canonical map K(R) → KB(R) induces isomorphisms Kn(R) ≅ πnKB(R) for n ≥ 0, and Kn(R) ≅ πnKB(R) for all n ≤ 0 as well.

- K-book, V.8.4 (Theorem 8.4), printed p. 432 (PDF p. 440). The topological Fundamental Theorem the first step uses. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 8.4. For any ring R, the map K(R) → ΛK(R) induces a homotopy equivalence between K(R) and the (−1)-connective cover of the spectrum ΛK(R). In particular, Kn(R) ≅ πnΛK(R) for all n ≥ 0.

### Excision for a Milnor square in degrees at most zero

`GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees` · *theorem*

Let f : R → S be a homomorphism of unital associative rings and I ⊂ R a two-sided ideal that f maps bijectively onto a two-sided ideal J = f(I) of S, so that R → S, R/I → S/J is a Milnor square: R is the pullback of S and R/I over S/J, and S → S/J is onto. Write 𝕂 = K^B for the Bass spectrum and 𝕂(R, I) for the homotopy fibre of 𝕂(R) → 𝕂(R/I), and similarly 𝕂(S, J). Then the induced map 𝕂(R, I) → 𝕂(S, J) is an isomorphism on π_n for every n ≤ 0. In particular its homotopy fibre, the birelative term, is concentrated in degrees ≥ 0 (its π_n vanishes for n ≤ −1, and its π_0 is the cokernel of the map on π_1), and, applied to ℤ ⋉ I → R, π_n 𝕂(R, I) depends only on the nonunital ring I for n ≤ 0. In degree one this node records only the classical statement: the classical relative groups K_1(R, I) = GL(I)/E(R, I) → K_1(S, J) form a surjection, because both are quotients of GL(I) = GL(J) (Remark III.2.2.1, the exactness at K_1(S) ⊕ K_1(R/I) of K.5/milnor-square-mayer-vietoris). The spectrum form of that surjection — π_1 𝕂(R, I) → π_1 𝕂(S, J) onto, equivalently the birelative term concentrated in degrees ≥ 1 — needs the identification of π_1 of K.5's relative fibre with GL(I)/E(R, I), which is KTheoryLowDegrees U.6's and lies downstream of K.6; it is handed to U.6 by request and is not asserted here. Nothing is claimed in degrees ≥ 2, and the degree-one map is not claimed injective: excision for K_1 already fails (Swan's example, Ex. III.2.3), and the general criteria are K.5/excision-and-its-failure's. This is the non-positive part of Bass's excision theorem (Bass, Algebraic K-theory, Theorem XII.8.3, as Clausen–Mathew–Morrow cite it). The proof of Clausen–Mathew–Morrow's Proposition 4.34 uses only that the birelative term is concentrated in degrees ≥ 0, which this node proves; their parenthesis 'even ≥ 1' is U.6's.

**Hypotheses.**

- The rings are unital and associative, f is unital, and f restricted to I is a bijection onto the two-sided ideal J = f(I) of S; the pullback property and the surjectivity of S → S/J then hold automatically. These are the Milnor-square hypotheses of Clausen–Mathew–Morrow's Theorem 4.33 and Proposition 4.34; no commutativity is assumed.
- 𝕂 is the Bass nonconnective spectrum; by the ring clause of K.6/agreement-and-vanishing-of-negative-K, Schlichting's IK has the same homotopy groups in degrees ≤ 0, so the statement does not depend on that choice.
- The degree-zero input is K.5's absolute excision in degree zero for its homotopy-fibre relative theory (K.5/excision-and-its-failure), not the identification of π_0 of the fibre with the classical K_0(I): that identification, like the one of π_1 with GL(I)/E(R, I), is KTheoryLowDegrees U.6's (U.6/relative-K1-homotopy-comparison), which lies downstream of K.6 and is not used.
- Only isomorphisms in degrees ≤ 0 are asserted for 𝕂; the degree-one statement is the classical one, and its spectrum form is U.6's.

**Proof outline.**

1. Check the Milnor-square facts: R ≅ S ×_{S/J} R/I, and the square is preserved by R ↦ R[t], R[t⁻¹], R[t,t⁻¹], with I[t] and so on, so the pairs form a category of Milnor squares closed under polynomial and Laurent extension.
2. Connective and nonconnective relative theories agree in degrees ≥ 0: K(R) → 𝕂(R) is an isomorphism on π_n for n ≥ 0 (K.6/bass-spectrum-homotopy-groups), so comparing the two long exact sequences of the pair gives π_0 K(R, I) ≅ π_0 𝕂(R, I), and likewise for (S, J).
3. Degree zero: K.5's absolute excision in degree zero says that the comparison map from the relative theory of the augmentation ℤ ⋉ I → ℤ to the relative theory of the pair (K.5/nonunital-rings-and-unitisation, K.5/relative-K-theory) is an isomorphism on π_0 for every unital ring containing I as a two-sided ideal. Apply it to I ⊂ R and to J ⊂ S; f identifies ℤ ⋉ I with ℤ ⋉ J and the triangle of comparison maps commutes, so π_0 𝕂(R, I) → π_0 𝕂(S, J) is an isomorphism.
4. Negative degrees: the cofibration sequence 𝕂(A) → 𝕂(A[t]) ∪_{𝕂(A)} 𝕂(A[t⁻¹]) → 𝕂(A[t,t⁻¹]) → Σ𝕂(A) of the Bass construction is natural in the ring A (IV.10.1) and its last map is split naturally by multiplication by t (K.6/fundamental-theorem-with-nil-terms, K.6/bass-spectrum-homotopy-groups). Taking homotopy fibres along A = R → R/I gives the same naturally split sequence for the relative spectra, so π_{n−1}𝕂(R, I) is naturally the contraction L of the functor (R, I) ↦ π_n 𝕂(R, I) on Milnor squares, and the map to (S, J) is a morphism of contracted functors.
5. Induct downwards: a morphism of contracted functors that is an isomorphism in degree n induces an isomorphism of their contractions (the argument of Proposition III.4.2), so the degree-zero isomorphism gives isomorphisms in every negative degree.
6. Consequences: the long exact sequence of the fibre of 𝕂(R, I) → 𝕂(S, J) shows that the birelative term has π_n = 0 for n ≤ −1 and π_0 equal to the cokernel of the map on π_1; applying the theorem to ℤ ⋉ I → R shows that π_n 𝕂(R, I), n ≤ 0, depends only on I. Compare K.6/mayer-vietoris-for-negative-k, which states the continuation of the classical Mayer–Vietoris sequence.
7. Degree one, classical: K_1(R, I) → K_1(S, J) is onto because both are quotients of GL(I) = GL(J) (Remark III.2.2.1); this is imported as the exactness at K_1(S) ⊕ K_1(R/I) of K.5/milnor-square-mayer-vietoris. Record that the spectrum form belongs to KTheoryLowDegrees U.6, which proves it from its relative comparison and this classical exactness.
8. Record what is not claimed: injectivity in degree one fails in general (Remark III.2.2.1 and Ex. III.2.3), and excision in degrees ≥ 2 needs the hypotheses of K.5/excision-and-its-failure.

**Acceptance.**

- Applied to ℤ ⋉ I → R, the theorem makes π_n 𝕂(R, I), n ≤ 0, an invariant of the nonunital ring I alone, which is how K_n(I) of a nonunital ring can be read off from any unital ring containing it.
- Swan's square (R the upper triangular 2 × 2 matrices over a field F, I its strictly upper triangular ideal, R_0 = F ⊕ I ⊂ R): the classical degree-one map K_1(R_0, I) ≅ F → K_1(R, I) = 0 is onto but not injective, which is why only surjectivity is recorded in degree one.
- The birelative term in the proof of Clausen–Mathew–Morrow's Proposition 4.34 is concentrated in degrees ≥ 0, which is all that proof uses ('it suffices to show that F is also concentrated in degrees ≥0'); the refinement to degrees ≥ 1 is U.6's.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`, `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`, `GeneralAlgebraicKTheory:K.6/contracted-functors`, `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`, `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`, `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`, `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`, `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- K-book, IV.10.1 (Definition 10.1), printed p. 349 (PDF p. 357). The cofibration sequence whose naturality in R lets the contraction pass to relative spectra. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 10.1. Write LE(R) for the spectrum homotopy cofiber of the map f0 from this homotopy pushout to E(R[x, x−1]), and ΛE(R) for the desuspension ΩLE(R). Since the mapping cone is natural, LE and ΛE are functors and there is a cofibration sequence, natural in E and R

- K-book, Exercise IV.10.1, printed p. 351 (PDF p. 359). The source's route to the same conclusion, through the classical K_0(I); this node replaces that identification, which is U.6's, by K.5's degree-zero excision. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

  > 10.1. Let I be an ideal in a ring R, and write KB(R, I) for the homotopy fiber of KB(R) → KB(R/I). Let K≤0(R, I) denote the homotopy cofiber of the 0-connected cover KB(R, I)⟨0⟩ → KB(R, I) … Thus πnK≤0(R, I) = 0 for n > 0, and π0K≤0(R, I) ≅ K0(I) by Ex. 1.15. Use III.2.3 to show that πnK≤0(R, I) ≅ Kn(I) for all n < 0.

- K-book, III.2.2.1 (Remark 2.2.1), printed p. 193 (PDF p. 201). The classical degree-one surjectivity, and why injectivity is not claimed. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Remark 2.2.1. Suppose that R → S is a ring map sending an ideal I of R isomorphically onto an ideal of S. The induced map K1(R, I) → K1(S, I) must be a surjection, as both groups are quotients of GL(I). However, Swan discovered that they need not be isomorphic; a simple example is given in Ex. 2.3 below.

- Clausen–Mathew–Morrow, Theorem 4.33, p. 35. The Milnor-square hypotheses, for associative rings. Verbatim from the text layer of the arXiv v2 PDF.

  > Theorem 4.33 (Cortiñas; Geisser–Hesselholt; Dundas–Kittang; Land–Tamme). Suppose R is a unital associative ring, I ⊂ R a two-sided ideal, and f : R → S a homomorphism such that f restricts to an isomorphism from I to a two-sided ideal J of S (so one has a Milnor square, cf. Definition 3.20).

- Clausen–Mathew–Morrow, Proposition 4.34, proof, p. 35. The use of this node: the proof needs only that the fibre 𝔽 of 𝕂(R, I) → 𝕂(S, J) is concentrated in degrees ≥ 0. Verbatim from the text layer of the arXiv v2 PDF, whose text layer drops the blackboard-bold font; 𝕂 and 𝔽 are restored from the proof's first sentence, which names F and 𝔽 as the fibres of the connective and the nonconnective maps. Bass's Theorem XII.8.3 was not read.

  > Note that the maps K(R) → 𝕂(R), K(R/I) → 𝕂(R/I), etc. are equivalences in degrees ≥0 … On the other hand, 𝔽 is concentrated in degrees ≥0 (even ≥1) by the excision theorem of Bass and Bass–Heller–Swan, [7, Thm. XII.8.3]. Thus it suffices to show that F is also concentrated in degrees ≥0.

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

- K-book, III.4.1, after Definition 4.1, printed p. 210 (PDF p. 218). The vanishing itself, stated by the source; the packet had not cited it. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > It follows from Theorem II.7.8 that if R is regular noetherian then Kn(R) = 0 for all n < 0.

- K-book, V.8, the opening paragraph, printed p. 430 (PDF p. 438). The vanishing of the N-terms. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > For regular rings, the decomposition simplifies to the formulas NKn(R) = 0 and Kn(R[t, 1/t]) ≅ Kn(R) ⊕ Kn−1(R) of Theorem 6.3.

- K-book, I.3.7.1 (Definition 3.7.1), printed p. 23 (PDF p. 31). The definition of regular; the packet's 'II.6.5 and I.3.7.1' merged two places. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 3.7.1. A noetherian ring R is called regular if every R-module M has a finite resolution 0 → Pn → · · · → P0 → M → 0 with the Pi projective.

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
5. Record exactly what the pinned libraries supply. Tau Ceti already HAS the Frobenius condition on an exact structure, as a predicate, with the proof that injectives and projectives then agree and with the split structure as an instance, so this node cites it rather than defining it again. Mathlib has triangulated subcategories, the class of maps whose cone lies in one, and the general localisation of a category at a class of maps. What is absent is the enough-objects data, the stable category with its triangulated structure, the Verdier quotient as a triangulated category, and the notion of a Frobenius pair; those are this node's own work.

**Acceptance.**

- Bounded complexes over an exact category form a Frobenius pair with derived category the bounded derived category.
- A map of Frobenius pairs induces a triangle functor of derived categories.
- The stable category of a Frobenius category is triangulated; without the coincidence of projectives and injectives it is not.
- The split exact structure on an additive category is Frobenius, which is Tau Ceti's pinned instance and the degenerate test of the definition.

**Prerequisites.** `tauceti:TauCeti.ExactStructure.IsFrobenius`, `tauceti:TauCeti.ExactStructure.split_isFrobenius`, `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`, `mathlib:CategoryTheory.ObjectProperty.trW`, `tauceti:TauCeti.ExactK0`, `mathlib:CategoryTheory.Idempotents.Karoubi`

**API.**

| name | role | statement |
| --- | --- | --- |
| `FrobeniusCategory` | structure | Enough projectives and injectives, which coincide; Tau Ceti’s pinned IsFrobenius is the coincidence, and this adds the enough-objects data. |
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

- `split_is_frobenius` (*compatibility*) — The split exact structure is Frobenius; this is Tau Ceti’s pinned instance and the definition here must agree with it.
- `complexes_are_a_pair` (*computation*) — The bounded complexes over an exact category form a Frobenius pair.
- `derived_is_bounded_derived` (*computation*) — Its derived category is the bounded derived category of the exact category.
- `projinj_coincide` (*non-example*) — Dropping the coincidence of projectives and injectives breaks the triangulation; an exact category with enough projectives only is not a Frobenius category.

**Sources.**

- Schlichting, §3.3 to 3.5, pp. 8 to 9. The definitions, verbatim; the ligature and accent damage of the scan has been repaired without changing a word.

  > Recall that a Frobenius category is an exact category with enough injectives and projectives, and where injectives and projectives coincide. Its stable category is a triangulated category. 3.4 Definition. A Frobenius pair A = (A, A_0) is a fully faithful inclusion A_0 -> A of small Frobenius categories. ... 3.5 Definition. If A = (A, A_0) is a Frobenius pair, then the map of small ...

- Schlichting, §5.3 and Definition 5.4, p. 11. The standing example and the definition it feeds, verbatim.

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

- `envelope_flasque` (*computation*) — The countable envelope is flasque.
- `IK0_of_enlargement_vanishes` (*computation*) — The zeroth group of an enlarged pair is zero.
- `suspension_derived` (*computation*) — The derived category of the suspension is the quotient of the enlarged derived category by the original.
- `not_sheaf_flasque` (*non-example*) — Flasque here is the swindle condition on a functor, not the sheaf-theoretic predicate of the pinned libraries.

**Sources.**

- Schlichting, Lemma 4.2, p. 9. The flasqueness of the envelope with its proof, verbatim.

  > The countable envelope FE of an exact category E is flasque, i.e., there is an exact functor T : FE -> FE and a natural equivalence T (+) id = T of functors. Proof. Countable direct sums exist in FE and are exact, so the functor sending E to the countable sum and the natural equivalence make FE into a flasque exact category. ... Now the functor A -> TA = sum of the t^i A makes sense and ...

- Schlichting, §4.1, Definition 4.3, Proposition 4.4 and Definition 4.7, pp. 9 to 10. The envelope, the functor F, its properties and the suspension, verbatim.

  > The category FE is an exact category whose objects are sequences of inflations in E. The morphism set from a sequence A to B is lim_i colim_j hom(A_i, B_j). ... 4.4 Proposition. Let A be a Frobenius pair. Then the map A -> F A induces a fully faithful map D A -> D F A of triangulated categories. Moreover, D F A has countable coproducts, and it is c-compactly generated by D A. ... 4.7 ...

- Schlichting, Theorem 4.8, p. 10. The verification that the flasque route satisfies the axioms, verbatim.

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

- `idempotent_complete_case` (*computation*) — For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group.
- `frobenius_instance` (*computation*) — Frobenius pairs with the envelope and the suspension satisfy the set-up.
- `quasi_iso_invariance` (*computation*) — A quasi-isomorphism of differential graded algebras induces isomorphisms of all the groups.
- `cofinal_not_equivalence` (*non-example*) — The third functor of an exact sequence is required to be cofinal, not an equivalence; requiring an equivalence would exclude the intended examples.

**Sources.**

- Schlichting, Definition 1.1, Facts 1.2, Set-up 1.3 and Definition 1.4, pp. 4 to 5. The set-up and the definition, verbatim.

  > 1.1 Definition. Call a sequence of small triangulated categories A -> B -> C exact if the composition is zero, the map A -> B is fully faithful and the map from B/A to C is cofinal, i.e., it is fully faithful, and every object of C is a direct summand of an object of B/A. ... We define IK_0(T) = K_0 of the idempotent completion. ... 1.3 Set-up. ... We suppose that there are two ...

- Schlichting, §5.5, p. 11. The degree-zero identification, verbatim.

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

- Schlichting, Lemma 1.6, Theorem 1.7, Corollary 1.8 and Remark 1.9, pp. 5 to 6. The localisation theorem with its corollary and the obstruction remark, verbatim.

  > 1.6 Lemma. The map delta yields a well defined map IK_i(C) -> IK_{i-1}(A) of abelian groups, i <= 0. 1.7 Theorem. Let A -> B -> C be a short exact sequence in M. Then the sequence of abelian groups ... IK_i(A) -> IK_i(B) -> IK_i(C) -> IK_{i-1}(A) -> ... is exact, i <= 0. ... 1.8 Corollary. Let f : A -> B be a map in M such that D(f) is cofinal, e.g. an equivalence of categories. Then ...

- Schlichting, §5.5, p. 11. The instance for exact categories and the localisation example, verbatim.

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

- Schlichting, Theorem 6.1, Corollary 6.2, Lemma 6.3 and Corollary 6.4, pp. 13 to 14. Additivity and the colimit statements, verbatim.

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

- Schlichting, Definitions 11.1 and 11.4, Lemma 11.3, pp. 20 to 21. The construction of the spectrum, verbatim.

  > 11.1 Definition. Let A be a Frobenius pair. Its associated category with cofibrations and weak equivalences has as cofibrations the inflations in A and as weak equivalences the maps in A which are isomorphisms in D A. The K-theory space of A is K(A) = Omega |wS.A|. ... 11.3 Lemma. There is a contraction of K(F A), functorial in the Frobenius pair A. ... 11.4 Definition (The IK-theory ...

- Schlichting, Theorem 11.7, p. 21. The computation of the homotopy groups, verbatim.

  > 11.7 Theorem. Let A be a Frobenius pair. Then the spectrum Omega IK(A) is an Omega-spectrum. The homotopy groups of IK(A) are given by pi_i IK(A) = pi_i K(A) for i > 0 as defined in 11.1, IK_0(A) = K_0 of the idempotent completion of D(A) for i = 0, and IK_i(A) for i < 0 as defined in sections 1 and 4.

- Schlichting, Theorem 11.10 and §11.13, pp. 21–22. Localisation at the spectrum level and the instance for exact categories, verbatim.

  > 11.10 Theorem. Let A -> B -> C be an exact sequence of Frobenius pairs. Then, applying the IK-theory functor yields a homotopy cartesian square. ... 11.13. IK(E), E an exact category. As in 5.4 we define the IK-theory spectrum of an exact category E. ... a sequence A -> B -> C of exact categories induces a long exact sequence.

- Schlichting, Proposition 11.15, p. 22. The derived-invariance statement, with the bracketed words supplying from the surrounding text what the scan drops.

  > 11.15 Proposition. Let F : A → B be a map of Frobenius pairs such that DA → DB is a an equivalence. Then K(A) → K(B) is a homotopy equivalence.

### Agreement with Bass, Karoubi and Pedersen–Weibel, and the vanishing theorems

`GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K` · *theorem*

The groups the Frobenius-pair route constructs are the classical ones for rings and additive categories: for a ring R, not necessarily commutative, IK_i(R) is naturally isomorphic to Bass's and Pedersen's K_i(R) for every i ≤ 0, and for an additive category A, IK_i(A) is naturally isomorphic to Karoubi's and Pedersen and Weibel's K_i(A) for every i ≤ 0. The first negative group of an exact category has a presentation: it is the monoid of isomorphism classes of idempotents of the unbounded derived category under direct sum, modulo those that split, so it vanishes exactly when that category is idempotent complete. It vanishes for every small abelian category, and every negative group vanishes for a small noetherian abelian category; the vanishing for a regular ring follows, because the inclusion of the finitely generated projectives into the finitely generated modules is then a derived equivalence and the latter category is abelian. Whether all negative groups of an arbitrary small abelian category vanish is stated by the source as a conjecture, and this packet states it as such. The scheme clauses of the source — agreement with Thomason's K^B_i(X) for a quasi-compact quasi-separated scheme, which the source proves from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b), and the vanishing of negative G-theory of a noetherian scheme — are not part of this node: they need Perf(X), K(X) and G(X), which SchemeKTheoryOperations S.1 and S.2 define after this layer, and they are handed to S.5 and S.2 by request.

**Hypotheses.**

- The ring is arbitrary, not necessarily commutative; the additive category is small.
- Noetherian abelian means every object is noetherian; the proof runs through the categories of objects with an endomorphism and the nilpotent ones.
- The vanishing for a regular ring is deduced, not assumed, and is the theorem of Bass that the stage text names.

**Proof outline.**

1. Prove the agreement with Karoubi's and Pedersen and Weibel's groups through the cone and suspension categories of an additive category: the sequence A → CA → SA gives an exact sequence of bounded derived categories, the cone is flasque, and so IK_{−i}(A) = IK_0(SⁱA), the zeroth K-group of the idempotent completion of SⁱA, which is Karoubi's and Pedersen and Weibel's group.
2. Deduce the ring case from the additive category P(R), as the source does: IK_i(R) = IK_i(P(R)) is Karoubi's group of R, and Karoubi's (and Pedersen's) groups coincide with Bass's for every ring. That comparison is cited by the source ([Kar71], [Ped84]) and was not read (gap). The source's Remark 7.2 notes an alternative proof through the projective line over a noncommutative ring, whose connective input is K.6/projective-line-splitting.
3. Prove the presentation of the first negative group: identify it with the zeroth group of the unbounded derived category by the Eilenberg swindle on bounded-above and bounded-below complexes, then apply the classification of dense subcategories.
4. Prove the vanishing of the first negative group of a small abelian category, and then the vanishing of all of them for a noetherian abelian category by descending induction, using the sequence of the nilpotent endomorphism category, the polynomial category and the Laurent category together with additivity.
5. Deduce the vanishing for a regular ring.
6. State the conjecture for a general small abelian category as a conjecture, together with the remark that commuting with filtered colimits does not reduce it to the noetherian case.
7. Record the handoff: agreement with Thomason's groups of a quasi-compact quasi-separated scheme, and the vanishing of negative G-theory of a noetherian scheme (an instance of the noetherian abelian theorem for Coh(X)), are SchemeKTheoryOperations S.5's and S.2's, which import this node; no node of this packet depends on them.

**Acceptance.**

- For a regular ring the negative K-groups vanish, which reproves Bass's theorem from this construction.
- The first negative group of an exact category vanishes exactly when its unbounded derived category is idempotent complete.
- The vanishing for a general small abelian category is a conjecture of the source and is recorded as one, not as a theorem.

**Prerequisites.** `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings`

**Sources.**

- Schlichting, Theorem 7.1, the ring and additive-category clauses, pp. 14 to 15. The ring and additive-category clauses, verbatim; the scheme clause between them (Thomason's groups of a quasi-compact quasi-separated scheme) is SchemeKTheoryOperations S.5's and is elided here.

  > 7.1 Theorem. Let R be a ring. Then there are natural isomorphisms between Bass’ and Pedersen’s groups K_i(R) and the groups IK_i(R) defined in 5.4 for i <= 0. … Let A be an additive category, then there are natural isomorphisms between Karoubi’s and Pedersen-Weibel’s groups K_i(A) and the groups IK_i(A) defined in 5.4 for i <= 0.

- Schlichting, Proof of Theorem 7.1, the ring case, p. 15. The ring case is deduced from the additive-category case and Karoubi's comparison, verbatim.

  > In particular, negative K-groups as defined by Bass and Pedersen are isomorphic to our negative IK-groups for a (not necessarily commutative) ring. Karoubi [Kar71] (Pedersen [Ped84]) showed that his groups coincide with Bass groups.

- Schlichting, Remark 7.2, p. 15. The alternative route through the noncommutative projective line, verbatim.

  > Alternatively, one can prove a projective space bundle theorem for the non-commutative projective line over a non-commutative ring R or an “admissible abelian category” [Yao92] following Thomason’s arguments for the commutative case [Tho93]. This would lead to an alternative proof of agreement for non-commutative rings

- Schlichting, Lemma 8.1 and Corollary 8.2, p. 15. The presentation of the first negative group, verbatim.

  > 8.1 Lemma. Let E be an exact category and D(E) its unbounded derived category. Then IK_{n-1}(E) = IK_n(Ch E, Ac E), n <= 0. In particular, IK_{-1}(E) = K_0(D(E)). ... 8.2 Corollary. The group IK_{-1}(E) is the quotient of the abelian monoid of isomorphism classes of idempotents in D(E), under direct sum operation, modulo the submonoid of those idempotents which split in D(E). In ...

- Schlichting, §9, Examples 9.5 and 9.6, Conjecture 9.7 and Remark 9.8, pp. 16 to 17. The vanishing theorems, the regular case and the conjecture, verbatim.

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

**One owner for each statement.** The connective statements about rings —
functoriality in ring maps, finite products, filtered colimits — are the early
ring node's, and exact-equivalence invariance is K.1's; K.7 imports them and
owns only their enhanced and nonconnective refinements. The K-theoretic pairing
K(A) ∧ K(B) → K(C) of a biexact functor, with its coherence, is owned here and
nowhere else: the smash product of spectra it is built on is StableHomotopyKTheory
H.5:spectra's, and the assembly of the K-theory spectrum (H.5:S-delooping)
requires no product.

**The homotopies are data.** The associativity, unit and symmetry of the
external product are transported from the coherence isomorphisms of the tensor
product. A formalisation that asserts them, or that leaves them implicit, has
not built the product; the API of the product node lists them as items.

Coverage: **source_decomposed**.

Seven nodes. Morita invariance with the Structure Theorem, the matrix instance and the compatibility with products, resting on the three pinned Mathlib declarations the audit names, on the K-book’s statement in every degree for K and for G, and on the early ring model of K.2:plus and the functoriality of K.1, which it imports; the derived statement as a comparison node, which states the enhancement hypothesis in Schlichting’s precise form — a map of Frobenius pairs inducing an equivalence of derived categories, not an equivalence of triangulated categories — imports the approximation theorem of K.4 and Proposition 11.15 from K.6, records that the K-theory construction consumes a category with cofibrations and weak equivalences rather than a homotopy category, and gives the failure of the naked form as a non-example, while keeping the degree-zero part that does survive and citing Tau Ceti’s pinned exact-equivalence invariance for it; the nonconnective refinements of compatibility with filtered colimits and finite products — for Bass’s groups, the Bass spectrum and Schlichting’s IK — whose connective form for rings is imported from the early ring node (RT-AREA-ktheory-1/19); the external products from biexact functors, the only owner of the K-theoretic pairing K(A) ∧ K(B) → K(C) and of its associativity, unit and symmetry homotopies, carried as transported data, with the generic smash product imported from StableHomotopyKTheory H.5:spectra and no product asked of spectrum assembly (RT-AREA-ktheory-1/4); graded commutativity of the total K-group, with the degree-one specialisation and the link to the splitting of K.6’s fundamental theorem; the compatibilities with relative groups, localisation boundaries and transfers, each stated as a separate assertion with its own proof obligation; and the two unit tests the stage text names. Every stage target has a node. What is stated rather than proved is the construction of the spectrum-level pairing, which the K-book attributes to Waldhausen; the gap records that and names the next source action. The pairing is also needed by K.6 (the Bass delooping and the splitting of the Fundamental Theorem), and the restructuring proposal asks for an early K.7 product stage before K.6.

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
3. Deduce that the equivalence restricts to an exact equivalence of the categories of finitely generated projective modules, so it induces isomorphisms on all K-groups by the functoriality of K under exact functors (K.1) applied to the early ring model P(R) of K.2:plus, which this node imports rather than re-defining.
4. Negative degrees: the bimodule giving the equivalence also gives equivalences over R[t], R[t⁻¹] and R[t,t⁻¹], compatibly with the maps between them, so the isomorphism passes to the cokernels that define Bass's groups (K.6/negative-k-groups).
5. Record the instance for matrix rings and the source's exercise that the matrix ring over a ring is Morita equivalent to it.
6. State the compatibility with products: the induced isomorphism is a ring isomorphism for the product structure of the next nodes, because the equivalence is monoidal for the relevant tensor.
7. Record the source's remark that the Morita equivalence classes are not the isomorphism classes, so the statement has content.

**Acceptance.**

- The ring and its n by n matrix ring have isomorphic K-groups in every degree.
- A Morita equivalence induces an isomorphism compatible with the products.
- Morita equivalent rings need not be isomorphic, so the theorem is not a triviality.

**Prerequisites.** `mathlib:ModuleCat.matrixEquivalence`, `mathlib:IsMoritaEquivalent`, `mathlib:IsMoritaEquivalent.matrix`, `mathlib:Matrix`, `tauceti:TauCeti.ExactK0`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`

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

- `matrix_invariance` (*compatibility*) — The K-groups of a ring and of its matrix ring agree.
- `not_isomorphism` (*non-example*) — Morita equivalent rings need not be isomorphic, so the statement is not vacuous.
- `respects_product` (*computation*) — The induced isomorphism carries the external product to the external product.
- `negative_degrees` (*computation*) — The isomorphism holds in negative degrees.

**Sources.**

- K-book, II.2.7 (Theorem 2.7), printed p. 75 (PDF p. 83). The structure theorem. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 2.7 (Structure Theorem for Morita Equivalence). If R and S are Morita equivalent, and P, Q are as above, then: (a) P and Q are finitely generated projective, both as R-modules and as S-modules;

- K-book, II.2.7.1 (Corollary 2.7.1), printed p. 76 (PDF p. 84). Degree zero. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Corollary 2.7.1. If R and S are Morita equivalent then K0(R) ≅ K0(S).

- K-book, II.2.7.2 (Example 2.7.2), printed p. 76 (PDF p. 84). The matrix ring. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Example 2.7.2. R = Mn(S) is always Morita equivalent to S; P is the bimodule S^n of “column vectors” and Q is the bimodule (S^n)^t of “row vectors.”

- K-book, IV.6.3.5 (Morita Invariance 6.3.5), printed p. 321 (PDF p. 329). All degrees. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Morita Invariance 6.3.5. Recall from II.2.7 that if two rings R and S are Morita equivalent then there are equivalences P(R) ≅ P(S) and M(R) ≅ M(S). It follows that Kn(R) ≅ Kn(S) and Gn(R) ≅ Gn(S) for all n.

### Derived invariance needs an enhancement, not a triangulated equivalence

`GeneralAlgebraicKTheory:K.7/derived-morita-and-enhancements` · *comparison*

At the derived level the invariance statement is about enhanced categories: K-theory is invariant under an equivalence of the underlying differential graded or stable categories of perfect complexes, and the enhancement is part of the hypothesis. A bare equivalence of triangulated categories is not enough, because the K-theory of a Waldhausen category is built from the category with its cofibrations and weak equivalences, not from the homotopy category alone, and mapping cones in a triangulated category are not functorial. This node states what the correct hypothesis is, records the failure of the naked form as a non-example, and says exactly which data a formalisation must carry. The stage text names this as the trap of the layer.

**Hypotheses.**

- The categories are the perfect complexes over the rings, with their standard Waldhausen structure.
- The hypothesis is an equivalence of enhancements: a quasi-equivalence of differential graded categories, or an equivalence of the associated stable infinity-categories.
- Neither pinned library has enhanced categories or a K-theory of them, which is recorded here as the reason the node is a comparison and not a construction.

**Proof outline.**

1. Record the source's construction of K-theory from a category with cofibrations and weak equivalences, so that it is visible which data the construction consumes.
2. State the invariance: an exact equivalence of Waldhausen categories induces a homotopy equivalence of K-theory spectra, and more generally an equivalence of enhancements does. The Waldhausen form is K.4's approximation theorem and Schlichting's form (Proposition 11.15) is stated in K.6/nonconnective-spectrum-and-derived-invariance; this node imports both and adds the enhanced formulation and the non-example.
3. State the non-example: a triangulated equivalence of homotopy categories does not by itself induce an isomorphism on K-theory, because the homotopy category forgets the weak equivalences that the construction uses.
4. Record the elementary part that does survive: an equivalence of homotopy categories does induce an isomorphism on the zeroth K-group, since that group depends only on the triangulated structure.
5. Name the data a formalisation must carry: the category, its cofibrations, its weak equivalences, and the functor's exactness, and record that dropping any of them breaks the statement.

**Acceptance.**

- An exact equivalence of Waldhausen categories induces a homotopy equivalence on K-theory, in every degree.
- A triangulated equivalence induces an isomorphism on the zeroth group but is not sufficient for the higher groups.
- Tau Ceti's pinned exact-equivalence invariance for the zeroth group is the degree-zero shadow of this statement and is cited as baseline.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/morita-invariance`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.4/approximation-theorem`, `tauceti:TauCeti.ExactK0.mapEquiv`, `mathlib:CategoryTheory.Functor.IsEquivalence`

**Sources.**

- K-book, II.9.1.1 (Definition 9.1.1), printed p. 158 (PDF p. 166). The data a K-theory is built from. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 9.1.1. A Waldhausen category C is a category with cofibrations, together with a family w(C) of morphisms in C called “weak equivalences” (abbreviated ‘w.e.’). Every isomorphism in C is to be a weak equivalence, and weak equivalences are to be closed under composition

- K-book, II.9.7 (Theorem 9.7, Approximation Theorem), printed p. 167 (PDF p. 175). The invariance statement at the level of Waldhausen categories, which is what the enhancement hypothesis provides. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 9.7 (Approximation Theorem). Let F : A → B be an exact functor between two Waldhausen categories. Suppose also that F satisfies the following conditions: (a) A morphism f in A is a weak equivalence if and only if F(f) is a weak equivalence in B.

- Schlichting, Definition 11.1 and Proposition 11.15, pp. 20 and 22. Derived invariance for maps of Frobenius pairs: the hypothesis is a map of models, not a bare triangulated equivalence. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > 11.1 Definition. Let A be a Frobenius pair. Its associated category with cofibrations and weak equivalences has as cofibrations the inflations in A and as weak equivalences the maps in A which are isomorphisms in D A. … 11.15 Proposition. Let F : A → B be a map of Frobenius pairs such that DA → DB is a an equivalence. Then K(A) → K(B) is a homotopy equivalence.

### Filtered colimits and finite products in the nonconnective theory

`GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products` · *theorem*

The connective statements — K_n(R × R′) ≅ K_n(R) × K_n(R′) for a finite product of unital rings and colim_i K_n(R_i) ≅ K_n(colim_i R_i) for a filtered colimit, n ≥ 0 — belong to the early ring node (K.2/functorial-K-theory-of-a-ring, from K.1/elementary-properties-of-K-groups) and are imported, not re-proved here. This node adds their nonconnective refinements. (a) For every n ≥ 1, Bass's K_{−n} takes finite products of rings to products (K.6/negative-k-groups) and commutes with filtered colimits of rings, because R ↦ R[t], R[t⁻¹], R[t,t⁻¹] commute with filtered colimits and so do cokernels. (b) Hence the Bass spectrum satisfies K^B(R × R′) ≃ K^B(R) × K^B(R′) and hocolim_i K^B(R_i) ≃ K^B(colim_i R_i), the maps being isomorphisms on π_n for every integer n by (a), the connective statements and K.6/bass-spectrum-homotopy-groups. (c) For Frobenius pairs and exact categories the non-positive filtered-colimit statement is K.6/additivity-and-colimits-for-negative-K's (Schlichting's Lemma 6.3 and Corollary 6.4), cited here, not restated. (d) Consequently the K-theory of the infinite matrix ring M(R) = colim_n M_n(R) is the colimit of the K-theories of the M_n(R), each isomorphic to that of R by Morita invariance, in every degree; this is the form in which the fourth axiom of K.6 is checked for K^B. Infinite products are not claimed.

**Hypotheses.**

- Filtered colimits are over small filtered categories of unital rings and unital maps and are taken in rings; products are finite.
- The connective statements are imported from the early ring node; this node owns only the nonconnective refinements, for Bass's groups, the Bass spectrum and Schlichting's IK.
- The pinned library has filtered colimits of categories but not the K-theoretic statement, which the audit records.

**Proof outline.**

1. Import the connective finite-product and filtered-colimit statements for rings from K.2/functorial-K-theory-of-a-ring, which applies K.1/elementary-properties-of-K-groups to idempotent-matrix models.
2. Negative degrees: finite products from K.6/negative-k-groups; filtered colimits by induction on n, since polynomial and Laurent extensions and cokernels commute with filtered colimits.
3. Spectrum level: compare π_n in every degree, using K.6/bass-spectrum-homotopy-groups with the connective statements for n ≥ 0 and the previous step for n < 0.
4. Frobenius pairs: cite K.6/additivity-and-colimits-for-negative-K for the non-positive filtered-colimit statement.
5. Record the consequence for the infinite matrix ring, with Morita invariance.

**Acceptance.**

- The negative K-groups of a finite product ring are the products of the negative K-groups, and K^B(R × R′) ≃ K^B(R) × K^B(R′).
- The negative K-groups of a filtered colimit of rings are the colimits of the negative K-groups.
- Neither statement is claimed for infinite products; the source records that those are different.

**Prerequisites.** `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.6/negative-k-groups`, `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`, `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`, `GeneralAlgebraicKTheory:K.7/morita-invariance`, `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- K-book, II.2, the paragraph after Example 2.1.3, printed p. 69 (PDF p. 77). Products in degree zero; the connective statement is the early ring node's and is quoted so that the boundary is visible. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > If R = R1 × R2 then P(R) ≅ P(R1) × P(R2). As in Exercise 1.2, this implies that K0(R) ≅ K0(R1) × K0(R2). Thus K0 may be computed componentwise.

- K-book, IV.6.4 (Elementary properties 6.4), printed p. 321 (PDF p. 329). Products in all non-negative degrees, the connective statement imported from the early ring node. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > For example, if R1 and R2 are rings then P(R1 × R2) ≅ P(R1) ⊕ P(R2) and we have Kn(R1 × R2) ≅ Kn(R1) ⊕ Kn(R2).

- K-book, IV.6.4, the filtered-colimit clause, printed p. 321 (PDF p. 329). Filtered colimits in all non-negative degrees, the connective statement imported from the early ring node. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Finally, suppose that i ↦ Ai is a functor from some small filtering category I to exact categories and exact functors. Then the filtered colimit A = lim Ai is an exact category (Ex. II.7.9), and QA = lim QAi. … For example, if a ring R is the filtered union of subrings Ri we have Kn(R) ≅ lim Kn(Ri).

- Schlichting, Lemma 6.3 and Corollary 6.4, pp. 13–14. Filtered colimits in non-positive degrees, stated in K.6/additivity-and-colimits-for-negative-K and cited here. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > 6.3 Lemma. Let i → Ai be a functor from a small, filtered index category I to the category of Frobenius pairs. Then colim Ai is a Frobenius pair and the natural map colim IKn(Ai) → IKn(colim Ai) is an isomorphism for n ≤ 0.

### External products from biexact functors: the K-theoretic pairing and its coherence

`GeneralAlgebraicKTheory:K.7/products-from-biexact-functors` · *construction* · planet **External products in K-theory**

A biexact functor induces a pairing of K-theory. For exact categories A, B, C and a functor F : A × B → C exact in each variable with F(A, 0) = F(0, B) = 0, the induced map on Q-constructions gives a pairing K(A) ∧ K(B) → K(C) and bilinear products K_i(A) ⊗ K_j(B) → K_{i+j}(C), which in degree zero send [A] ⊗ [B] to [F(A, B)]. For Waldhausen categories the same holds for a biexact functor satisfying Waldhausen's condition that F(A′, B) ∪_{F(A,B)} F(A, B′) → F(A′, B′) is a cofibration for all cofibrations A ↣ A′ and B ↣ B′: the induced map wS.A × wS.B → wwS.S.C gives a pairing K(A) ∧ K(B) → K(C) of spectra, natural in exact functors and natural transformations of each variable. If F is associative, unital or symmetric up to coherent natural isomorphism, the pairing is associative, unital or symmetric up to homotopies transported from those isomorphisms; the homotopies are data. For algebras A and B over a commutative ring k, ⊗_k : P(A) × P(B) → P(A ⊗_k B) gives the external product K(A) ∧ K(B) → K(A ⊗_k B), and for a commutative ring R the internal product that makes K(R) a commutative ring spectrum and K_*(R) a graded ring with unit [R]. This node is the only owner of the K-theoretic pairing K(A) ∧ K(B) → K(C) and its coherence: the smash product of spectra, its own coherence and the sign of the twist on spheres are imported from StableHomotopyKTheory H.5:spectra, the connective K-theory spectrum from K.4:construction and H.5:S-delooping, and the assembly of that spectrum requires no product.

**Hypotheses.**

- A, B and C are small exact or Waldhausen categories and the functor is biexact, with Waldhausen's cofibration condition in the Waldhausen case.
- For the ring case the tensor product is over a fixed commutative base k and the modules are finitely generated projective over the respective k-algebras; the external product needs no commutativity of the algebras.
- The unit is the class of the base ring as a module over itself, and the symmetry is the swap of the two factors; the coherence homotopies are transported from the coherence isomorphisms of the tensor product, not asserted.

**Proof outline.**

1. State biexactness for exact and for Waldhausen categories and the induced bilinear map on the zeroth groups (II.7.4, II.9.5.1), with the formula [A]·[B] = [F(A, B)].
2. Construct the space-level pairing: the bisimplicial map wS.A × wS.B → wwS.S.C and, on realisation, K(A) ∧ K(B) → K(C), using the S-construction deloopings of K.4:construction assembled by H.5:S-delooping and the smash product of H.5:spectra (IV.8.11, after Waldhausen); for exact categories compare with the pairing out of the Q-construction (IV.6.6) through the comparison of iS with Q.
3. Prove naturality in exact functors and natural transformations of each variable; this is what makes the pairing compatible with maps of fibration sequences, as K.6/multiplication-by-t-splits-the-boundary uses.
4. Record the associativity, unit and symmetry homotopies as data transported from the coherence isomorphisms of the biexact functor, and the resulting ring- and module-spectrum structures (IV.8.11).
5. Specialise to rings: the external product K(A) ∧ K(B) → K(A ⊗_k B) and, for a commutative ring, the internal product with unit [R]; record Tau Ceti's pinned degree-zero product statement for the split model as the baseline instance and say exactly what it does and does not give.
6. Record the other applications of the same machine, in particular the pairing that makes the Nil groups a module over the zeroth K-group (II.7.4.4), and that SchemeKTheoryOperations S.6 extends this pairing to schemes and imports it.

**Acceptance.**

- The zeroth K-group of a commutative ring is a commutative ring with unit the class of the ring itself.
- The pinned Tau Ceti statement that the class of a tensor product is the product of the classes is the degree-zero instance and is cited, not reproved.
- The pairing is bilinear, so it is determined by its values on classes of modules, which is what makes it computable.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`, `GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:S-delooping`, `tauceti:TauCeti.SplitK0.of_mul_of`, `tauceti:TauCeti.SplitK0`, `mathlib:TensorProduct`

**API.**

| name | role | statement |
| --- | --- | --- |
| `KTheory.biexactPairing` | data | The pairing induced by a biexact functor. |
| `KTheory.biexactPairing_natural` | functoriality | The pairing is natural in exact functors and natural transformations of each variable, and so maps fibration sequences in one variable to fibration sequences. |
| `KTheory.biexactPairing_K0` | characterisation | In degree zero the pairing sends [A] ⊗ [B] to [F(A, B)]. |
| `KTheory.externalProduct` | data | The external product of the K-groups of two algebras. |
| `KTheory.mul` | data | The internal product for a commutative ring. |
| `KTheory.mul_assoc` | compatibility | The associativity homotopy. |
| `KTheory.mul_one` | compatibility | The unit homotopy, with unit the class of the ring. |
| `KTheory.mul_comm_graded` | compatibility | The symmetry homotopy, giving graded commutativity. |

**Used by.**

- *K.6, the Fundamental Theorem and the Bass spectrum* — Multiplication by [t] ∈ K_1(ℤ[t,t⁻¹]) is the external product of this node; it splits the boundary of the Fundamental Theorem (K.6/multiplication-by-t-splits-the-boundary) and defines the maps of the Bass delooping (K.6/nonconnective-spectrum).
- *K.7, graded commutativity* — The symmetry homotopy is what produces the sign in the commutativity of the total K-group.
- *K.7, compatibilities* — The product is asserted compatible with relative groups, boundaries and transfers.
- *SchemeKTheoryOperations S.6* — The scheme-level external product is the same construction for a different input.

**Unit tests.**

- `K0_is_a_ring` (*computation*) — The zeroth K-group of a commutative ring is a commutative ring.
- `unit_is_the_class_of_R` (*computation*) — The unit of the product is the class of the ring as a module over itself.
- `tensor_of_classes` (*compatibility*) — The product of the classes of two modules is the class of their tensor product; this is the pinned Tau Ceti statement.
- `homotopies_are_data` (*non-example*) — The associativity and symmetry are given by transported coherence isomorphisms, not asserted.

**Sources.**

- K-book, II.7, 'Products', and Lemma 7.4, printed p. 132 (PDF p. 140). The definition and the pairing on K0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Products Let A, B and C be exact categories. A functor F : A × B → C is called biexact if F(A, −) and F(−, B) are exact functors for every A in A and B in B, and F(0, −) = F(−, 0) = 0. … Lemma 7.4. A biexact functor F : A × B → C induces a bilinear map K0A ⊗ K0B → K0C.

- K-book, II.9.5.2 (Definition 9.5.2), printed p. 165 (PDF p. 173). The Waldhausen version (the pairing of spectra is IV.8.11, not here). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 9.5.2. A functor F : A × B → C between Waldhausen categories is called biexact if each F(A, −) and F(−, B) is exact, and the following condition is satisfied

- K-book, II.7.4.1 (Application 7.4.1), printed p. 132 (PDF p. 140). The tensor product. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Application 7.4.1. Let R be a commutative ring. The tensor product ⊗R defines a biexact functor P(R) × P(R) → P(R), as well as a biexact functor P(R) × M(R) → M(R). The former defines the product [P][Q] = [P ⊗ Q] in the commutative ring K0(R)

- K-book, IV.6.6 (Definition 6.6), printed p. 322 (PDF p. 330). Higher products for exact categories. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Definition 6.6. If A, B and C are exact categories, a functor ⊗ : A × B → C is called biexact if (i) each partial functor A ⊗ – : B → C and – ⊗ B : A → C is exact, and (ii) A ⊗ 0 = 0 ⊗ B = 0 for the distinguished zero objects of A, B and C.

- K-book, IV.8.11 (Products), printed p. 342 (PDF p. 350). The pairing of spectra. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > We saw in II.9.5.1 that a biexact functor induces a bilinear map K0(A) ⊗ K0(B) → K0(C). It also induces a morphism of bisimplicial bicategories wS•A × wS•B → wwS•S•C

### The total K-group is a graded-commutative ring

`GeneralAlgebraicKTheory:K.7/graded-commutativity` · *theorem*

For a commutative ring the internal product makes the direct sum of the K-groups a graded ring, and the symmetry homotopy makes it graded commutative: the product of a class in degree p and one in degree q equals minus one to the power p times q times the product in the other order. In degree one the statement specialises to the anticommutativity of the symbol of two units, and the product of a class in degree zero with one in degree one is given by the action of the zeroth K-group. The sign is a consequence of the symmetry of the tensor product together with the sign rule of the smash product of spheres, and it is not a convention that can be chosen.

**Hypotheses.**

- R is commutative; the total K-group is the direct sum over non-negative degrees, or over all degrees in the nonconnective theory.
- The sign comes from the symmetry homotopy of the previous node and from the standard sign of the graded smash; the node records both contributions.
- The pinned libraries have no first K-group at all, which the audit records, so the degree-one specialisation cannot be stated against them.
- The scheme form of graded commutativity is SchemeKTheoryOperations S.6's, which imports this node; this node does not depend on S.6, which the atlas places after K.7.

**Proof outline.**

1. State the graded ring structure and the graded commutativity with the sign.
2. Specialise to two classes in degree one: the symbol of two units is the inverse of the symbol in the other order.
3. Specialise to degrees zero and one: the product is the module action of the zeroth K-group, and multiplication by the class of the ring is the identity.
4. Record the source's statement that the first K-group of the Laurent polynomial ring over the integers contains the class of the variable and that multiplication by it is the splitting of the fundamental theorem (K.6/multiplication-by-t-splits-the-boundary), so the product structure and K.6 are linked.
5. Record the non-example: for a non-commutative ring there is no internal product of this kind, only the external one, and the graded ring statement fails.

**Acceptance.**

- The total K-group of a commutative ring is graded commutative.
- In degree one the symbol is anticommutative, which is the classical statement.
- Multiplication by the class of the variable in the first K-group of the integral Laurent ring is the splitting of K.6's fundamental theorem.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- K-book, IV.1.10 (Theorem 1.10, Loday), printed p. 266 (PDF p. 274). Graded commutativity; the packet cited 'IV.1 and the product structure (PDF p. 302)' with a formula that is not in the source. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Theorem 1.10. (Loday) The product map is natural in A and B, bilinear and associative. If A is commutative, the induced product Kp(A) ⊗ Kq(A) → Kp+q(A ⊗ A) → Kp+q(A) is graded-commutative.

- K-book, V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438). Multiplication by the class of the variable. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > in which the splitting of ∂ is given by multiplication by t ∈ K1(Z[t, t−1]).

### Compatibility of the product with relative groups, boundaries and transfers

`GeneralAlgebraicKTheory:K.7/compatibility-with-relative-groups-and-transfers` · *lemma*

The external product is compatible with the other structure of the theory. It descends to relative groups, so that the product of an absolute class and a relative class is relative; it commutes with the boundary maps of the localisation sequences up to the expected sign, that is, the boundary is K_*(R)-linear up to sign (a module map, not a derivation of a ring); and it satisfies the projection formula for a transfer, namely that the transfer of a product of a class pulled back along the map with a class upstairs equals the product of the first with the transfer of the second. Each is a separate assertion with its own proof and none follows from the construction of the product alone.

**Hypotheses.**

- The relative groups are those of a ring map or of an ideal, as the source defines them.
- The boundary maps are those of the localisation and Mayer-Vietoris sequences.
- The transfer is the one attached to a finite map with the appropriate finiteness hypothesis, which the node records rather than assumes.

**Proof outline.**

1. State the relative compatibility and record which pairing it refers to.
2. State the linearity of the boundary with respect to the product, with its sign: the boundary is a map of K_*(R)-modules, not a derivation of a ring. The instance for the localisation at the variable t is K.6/multiplication-by-t-splits-the-boundary.
3. State the projection formula for a transfer, with the hypothesis on the map under which the transfer exists.
4. Record that each of the three is used elsewhere in the atlas: the linearity of the boundary in the localisation sequences, the projection formula in the transfer arguments.
5. Record what is not claimed: no compatibility with an infinite product, and no statement about a transfer along a map that is not finite.

**Acceptance.**

- The boundary of the product of a class from the base with a class of the localisation is the product of that class with the boundary, with the expected sign.
- The projection formula holds for a finite map.
- None of the three follows from bilinearity alone; each is a separate statement.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.7/graded-commutativity`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `GeneralAlgebraicKTheory:K.5/relative-K-theory`

**Sources.**

- K-book, V.3.12 (Projection Formula 3.12), printed p. 395 (PDF p. 403). The projection formula for the transfer. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Projection Formula 3.12. Let f : X → Y be a proper morphism of noetherian schemes. Then f∗ : G∗(X) → G∗(Y) is a graded K∗(Y)-module homomorphism: for all x ∈ Gm(X) and y ∈ Kn(Y): f∗(x · f∗y) = f∗(x) · y.

- K-book, IV.8.11 (Products), printed p. 342 (PDF p. 350). The spectrum-level pairing the compatibilities are statements about. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > We saw in II.9.5.1 that a biexact functor induces a bilinear map K0(A) ⊗ K0(B) → K0(C). It also induces a morphism of bisimplicial bicategories wS•A × wS•B → wwS•S•C

### The K-zero tensor comparison and multiplication by a unit in K-one

`GeneralAlgebraicKTheory:K.7/unit-multiplication-and-K0-tensor-comparison` · *lemma*

Two concrete consequences of the product structure serve as the unit tests of the layer. First, the comparison in degree zero: the product of the classes of two finitely generated projective modules is the class of their tensor product, so that the map from the tensor square of the zeroth K-group to itself is determined on classes; Tau Ceti has exactly this statement for the split model and it is cited as baseline. Second, multiplication in degree one: the product of the class of a unit in the first K-group with a class in the zeroth K-group is computed by the action, and multiplication by the class [u] of a unit in the first K-group raises degree by one; since [u⁻¹] = −[u] in the first K-group, multiplication by [u⁻¹] is the negative of multiplication by [u] (it is not an inverse, and neither map is an automorphism of a K-group). The second cannot be stated against the pinned libraries, which have no first K-group.

**Hypotheses.**

- R is commutative; the modules are finitely generated projective.
- The unit is an element of the unit group of the ring, and its class in the first K-group is its image under the determinant-like map.
- The audit records that the first K-group is absent from both pinned trees, so the second statement has no baseline and must be built.

**Proof outline.**

1. State the degree-zero comparison and cite the pinned Tau Ceti statement for the split model.
2. Record the gap between the split model and the general one: the pinned statement is for the split K-zero and a comparison with the exact-category model is needed before it can be used in general.
3. State the degree-one multiplication: the product of the class [u] of a unit with a class in the zeroth K-group is computed by the action and raises degree by one; since [u⁻¹] = −[u] in the first K-group, multiplication by [u⁻¹] is the negative of multiplication by [u], not an inverse.
4. Record that these two are the unit tests by which a formalisation of the product is checked, and that failing either means the construction is wrong.
5. Record the source's statement of the map from units to the first K-group, and the fact that it is an isomorphism for a commutative local ring, which is where the second test is most easily checked.

**Acceptance.**

- The product of two classes is the class of the tensor product; this is the pinned Tau Ceti statement for the split model.
- Multiplication by [u⁻¹] is the negative of multiplication by [u], because [u] + [u⁻¹] = [uu⁻¹] = 0 in the first K-group; neither map is an automorphism of a K-group.
- Neither statement can be checked in degree one against the pinned libraries, since the first K-group is absent there.

**Prerequisites.** `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `tauceti:TauCeti.SplitK0.of_mul_of`, `tauceti:TauCeti.SplitK0`

**Sources.**

- K-book, II.7.4.1 (Application 7.4.1), printed p. 132 (PDF p. 140). The K0 comparison. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Application 7.4.1. Let R be a commutative ring. The tensor product ⊗R defines a biexact functor P(R) × P(R) → P(R), as well as a biexact functor P(R) × M(R) → M(R). The former defines the product [P][Q] = [P ⊗ Q] in the commutative ring K0(R)

- K-book, III.1.1.1 (Example 1.1.1, SK1), printed p. 180 (PDF p. 188). Units in K1; [u] + [u⁻¹] = [u u⁻¹] = 0 since K1 is additive in the product of units. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

  > Example 1.1.1 (SK1). If R happens to be commutative, the determinant of a matrix provides a group homomorphism from GL(R) onto the group R× of units of R. It is traditional to write SK1(R) for the kernel of the induced surjection det : K1(R) → R×.

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

### The noncommutative projective-line inputs are exercises in the source

Needed by: `GeneralAlgebraicKTheory:K.6/projective-line-splitting`, `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`.

The source proves the projective bundle theorem for quasi-projective schemes (V.1.5) and leaves its adaptation to the gluing category of an associative ring as Exercise V.1.3, with a pointer to Quillen's Higher algebraic K-theory I (LNM 341); it states the localisation sequence through P¹_R for a noncommutative ring only as Exercise V.7.5(c). Quillen was not read. The two nodes state the results and decompose the source's proofs of their commutative analogues step by step, with three proof obligations named in their steps: Mumford regularity and Quillen's canonical resolution in the gluing category, and the localisation theorem for H_{1,t} ⊂ H_1. NEXT SOURCE ACTION: read Quillen, Higher algebraic K-theory I, the section on the projective line over a ring and the fundamental theorem, and decompose the three obligations. (This gap replaces the earlier gap 'The proof of the Fundamental Theorem was not read, only its statement': V.8.1 and V.8.2 have now been read with their proofs and decomposed into K.6/nil-groups-are-NK, K.6/fundamental-theorem-positive-degrees and K.6/multiplication-by-t-splits-the-boundary.)

### Karoubi's comparison of his negative groups with Bass's was not read

Needed by: `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`.

With the scheme clause removed, the ring clause of Schlichting's Theorem 7.1 rests on its additive-category clause and on the comparison of Karoubi's (and Pedersen's) negative groups with Bass's, which the source cites as [Kar71] and [Ped84]. Neither was read. Within the K-book the same comparison can be made through Theorem III.4.5 — every theory of negative K-theory satisfying the four axioms is canonically Bass's, proved there through the cone and suspension rings — together with Ex. III.4.10 and Variant IV.10.4.1; III.4.5 was read with its proof, the other two only as statements. NEXT SOURCE ACTION: read Karoubi 1971 or Pedersen 1984, or decompose the suspension-ring route through III.4.5 into nodes of this layer.

## Requests

- **`SchemeKTheoryOperations:S.5`** — An ownership handoff, not an input: no node of this packet depends on S.5, and no edge S.5 → K.6 may be added, since K.6 precedes S.2 to S.5 in the atlas and the edge would close a cycle. S.5 owns the scheme forms and imports the ring theorems of K.6. (1) Thomason's projective line and projective bundle theorems for quasi-compact quasi-separated schemes, compared for X = Spec R with K.6/projective-line-over-a-ring and K.6/projective-line-splitting (the source identifies VB(P¹_R) with the vector bundles on the scheme P¹_R only for commutative R). (2) The Fundamental Theorem for schemes (K-book V.8.3, Thomason–Trobaugh 6.6(b)), compared on affine schemes with K.6/fundamental-theorem-with-nil-terms and K.6/nil-groups-are-NK. (3) The scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17: for a quasi-compact quasi-separated scheme X, IK_i(X) ≅ Thomason's K^B_i(X) for i ≤ 0 (Schlichting, Theorem 7.1, proved there from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b)), keeping the qcqs hypotheses and giving, for X = Spec R, the explicit comparison with the ring clause of K.6/agreement-and-vanishing-of-negative-K and with K.6/bass-spectrum-homotopy-groups.

- **`SchemeKTheoryOperations:S.2`** — An ownership handoff, not an input: the second scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17. For a noetherian scheme X, negative G-theory vanishes: IK_n(Coh(X)) = 0 for n < 0, as the instance for the small noetherian abelian category Coh(X) of the theorem K.6/agreement-and-vanishing-of-negative-K proves for noetherian abelian categories, with an explicit comparison of S.2's nonconnective G-theory with IK of Coh(X). No node of this packet depends on S.2.

- **`SchemeKTheoryOperations:S.6`** — An ownership handoff, not an input: external products for schemes, supports and relative theories, and the graded commutativity of the total K-group of a scheme, are S.6's and extend K.7/products-from-biexact-functors and K.7/graded-commutativity, which S.6 imports. AUDIT-28 records this as a duplication with K.7; the ring-level pairing is developed here. The former prerequisite of K.7/graded-commutativity on S.6 was the reverse of the stage order (S.6 requires K.7) and is removed.

- **`StableHomotopyKTheory:H.5:spectra`** — The generic spectrum toolkit K.6 and K.7 build on: homotopy pushouts and cofibres, loops and desuspensions, homotopy colimits of sequences, connective covers, homotopy fibres with their long exact sequences, stable homotopy groups indexed by all integers, and the smash product of spectra with its associativity, unit and symmetry and the sign of the twist on S^p ∧ S^q. K.7/products-from-biexact-functors builds the K-theoretic pairing K(A) ∧ K(B) → K(C) on this smash product and is its only owner; H.5:spectra is asked for the generic smash product only. Needed by: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`, `GeneralAlgebraicKTheory:K.7/graded-commutativity`.

- **`StableHomotopyKTheory:H.5:S-delooping`** — The connective K-theory spectrum of a small Waldhausen category, and of an exact category, assembled from the iterated S-construction and the deloopings of K.4:construction (K.4/delooping-and-the-spectrum), functorial in exact functors and natural transformations; applied to the early ring model of K.2:plus it is the functorial model of connective K-theory of rings that the Bass delooping takes as input. No product structure is asked of spectrum assembly: the pairing is K.7's (RT-AREA-ktheory-1/4). This request replaces the earlier request to GeneralAlgebraicKTheory:K.3, which does not construct Waldhausen spectra. Needed by: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`.

- **`StableHomotopyKTheory:H.3`** — The absolute degree-one comparison K.6 uses, from H.3's plus construction: for a connected space X and a perfect normal subgroup P of π_1X, π_1(X⁺_P) = π_1(X)/P, natural for maps carrying the selected perfect subgroup into the selected one; applied to X = BGL(R) and P = E(R) (perfect, by the Whitehead lemma of KTheoryLowDegrees U.1), this gives π_1 BGL(R)⁺ ≅ GL(R)/E(R) = K_1(R) (KTheoryLowDegrees U.2's classical K_1), natural in unital ring maps, and compatible with matrix loops: the loop in BGL(R) given by g ∈ GL_n(R) goes to the class of g in GL(R)/E(R). With the plus = Q comparison (K.2:plus/plus-equals-Q) this identifies the classical K_1 with the first homotopy group of the K-theory space, which K.6 uses for the class [t] of the unit t ∈ ℤ[t,t⁻¹] and for applying the contraction to the classical K_1–K_0 Mayer–Vietoris sequence. K.6 cites H.3 rather than K.2:low-degree-comparisons/explicit-low-degree-models or KTheoryLowDegrees U.6, which lie downstream of K.6 in the assembled atlas. Needed by: `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`, `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`.

- **`KTheoryLowDegrees:U.6`** — An ownership handoff, not an input: the spectrum form of the degree-one clause of Bass's excision for a Milnor square (f : R → S carrying a two-sided ideal I bijectively onto an ideal J). U.6 proves that π_1 𝕂(R, I) → π_1 𝕂(S, J) is onto, equivalently that the birelative term of relative nonconnective K-theory is concentrated in degrees ≥ 1 (the 'even ≥ 1' of Clausen–Mathew–Morrow, Proposition 4.34), from its identification of π_1 of the relative fibre of GeneralAlgebraicKTheory:K.5/relative-K-theory with GL(I)/E(R, I) (U.6/relative-K1-homotopy-comparison), the classical surjectivity K_1(R, I) → K_1(S, J) (the exactness at K_1(S) ⊕ K_1(R/I) of GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris), and the agreement of connective and nonconnective relative theory in degrees ≥ 0 (K.6/bass-spectrum-homotopy-groups). K.6 proves the isomorphisms in degrees ≤ 0 (K.6/milnor-square-excision-in-nonpositive-degrees) and records only the classical degree-one surjectivity; no node of this packet depends on the spectrum form, because U.6 lies downstream of K.6 in the assembled atlas.

- **`K2SymbolsBrauer:T.6`** — The first and second K-groups with their symbols. K.7's degree-one unit test needs the class of a unit in the first K-group and the anticommutativity of the symbol; neither pinned library has the first K-group at all, and T.6 is where the symbols are owned.

## Structural proposals

### The two duplications AUDIT-28 records are boundaries, not overlaps to remove

*note-duplicate-boundary*

AUDIT-28 records SchemeKTheoryOperations S.5 as duplicating K.6's fundamental theorem and S.6 as duplicating K.7's external products. Read against the source these are not duplications but the ring and scheme forms of the same theorem, and the source states them separately for exactly that reason: V.8.2 for rings and V.8.3 for quasi-projective schemes. The resolution is that the ring form, with its ring-level inputs (the projective line over an associative ring, the Nil groups, the localisation at t), is proved in this roadmap, and the scheme roadmap imports it for its scheme forms: S.5 and S.6 come after K.6 and K.7 in the atlas, so no node here may cite them (RT-AREA-ktheory-1/17 found the former prerequisite S.5 → K.6 closing a cycle). The scheme clauses of Schlichting's agreement theorem are likewise S.5's and S.2's. The stage texts of K.6, S.2, S.5 and S.6 should each say so in a sentence. No layer should be dropped on this account.

### K.6 carries two independent developments and could be split

*propose-split*

K.6's stage text asks both for Bass's negative groups, which need only the zeroth and first K-groups and no homotopy theory, and for the Fundamental Theorem in every degree and the nonconnective spectrum, which need connective K-theory spaces, spectra, homotopy colimits and connective covers, none of which exists in either pinned library. The first part is formalisable against the pins today; the second is blocked on a library of spectra. As one layer it cannot be closed until the homotopy theory arrives, and a reader cannot see that the algebraic part is independently available. Splitting into a negative-K-groups layer and a nonconnective layer would make that visible. Along that line the Bass-side nodes divide as follows: flasque rings, contracted functors, the negative groups, the axioms and the Mayer–Vietoris continuation go to the first layer (their degree-zero and degree-one inputs being the classical K_0 and K_1); the projective line over a ring and its splitting, the Nil groups, the localisation sequences at t, Nil_n ≅ NK_{n+1}, the Fundamental Theorem in positive degrees and its splitting, the contractedness of the K-groups, the Bass spectrum and its homotopy groups, the spectrum form of Milnor-square excision and the vanishing theorem go to the second.

### The name 'flasque' is taken in both pinned libraries by a different notion

*note-naming-collision*

Both trees have IsFlasque for the sheaf-theoretic predicate, and K.6 needs Karoubi's flasque rings, which are unrelated. The packet records the collision in the node, in its unit tests and here, because a formalisation that reused the name would produce a statement that reads as true and means something else. A name such as IsFlasqueRing, or Karoubi's own terminology of an infinite sum ring where that stronger notion suffices, should be fixed before any of this layer is written.

### K.7's product construction is needed before K.6

*propose-split*

The Bass delooping (K-book IV.10) and the splitting of the Fundamental Theorem in positive degrees (V.8.2, Ex. V.8.1) use the external product with the class [t] ∈ K_1(ℤ[t,t⁻¹]), and K.7/products-from-biexact-functors is the only owner of that pairing (RT-AREA-ktheory-1/4). The pairing needs only K.1, K.2:plus, K.4:construction, StableHomotopyKTheory H.5:spectra and H.5:S-delooping, all upstream of K.6, but the atlas orders K.6 → K.7. Proposal: an early stage K.7:products holding K.7/products-from-biexact-functors (its parent), with edges K.2:plus, K.4:construction, H.5:spectra, H.5:S-delooping → K.7:products → K.6, and the rest of K.7 after K.6 as now. Until that stage exists the node keeps its parent K.7, and K.6/nonconnective-spectrum and K.6/multiplication-by-t-splits-the-boundary cite it directly; the node graph is acyclic, because the pairing node depends on no node of K.6.

## What this blueprint does not claim

No Lean was compiled for this job or for its revision. The Mathlib build on this
machine is a shared cache that must not be rebuilt, and this working tree has no
elaborated dependency modules. Every `implementationStatus` is `unchecked`, the
suggested Lean file is a naming proposal whose proofs are all `sorry` or whose
signatures are comments, and nothing here is claimed to be formalised.

Several excerpts are elided where the source's sentence runs past four hundred
characters or where the PDF's text layer drops words; an ellipsis marks each
elision, and the locators name the pages so the full text can be read in the
source.
