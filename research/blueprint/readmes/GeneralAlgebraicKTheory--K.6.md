# GeneralAlgebraicKTheory — K.6 and K.7

The blueprint for the nonconnective extension (K.6) and for invariance, products
and universal interfaces (K.7). This document is definitive; the packet
`research/blueprint/packets/GeneralAlgebraicKTheory--K.6.json` is its machine
form and the suggested Lean file is a naming proposal, not an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The source

Everything here is decomposed from one book:

> Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
> <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, accessed 2026-09-24.

Sections read:

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

The file was already on disk from the K2SymbolsBrauer job of this session and was re-hashed; the hash reproduces the value recorded by the packets of K2SymbolsBrauer, Polylogarithms, MotivesAndAlgebraicCycles and ArithmeticKTheory, so this is the same file those cite.

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
functors, the negative K-groups, the Nil groups, the K-theory of a Waldhausen
category, and the first K-group — which is absent from both trees, so every
statement of this blueprint in degree one is stated against a group that has yet
to be built.

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

The layer builds the negative K-groups twice: once algebraically, as Bass's
iterated contraction of the zeroth K-group, and once homotopically, as the
negative homotopy of a spectrum obtained by iterated desuspension. The two
agree because the Fundamental Theorem identifies connective K-theory with the
minus-one-connective cover of the first desuspension.

The stage text asks for the nonconnective extension through a flasque
enlargement, a suspension and an idempotent completion. The source read here
gives the Bass delooping instead. The first five nodes are the algebra, the
next two the homotopy theory, and the axioms node is the interface through
which the flasque route — when a source for it is read — is compared with this
one. The first gap says exactly what to read for that.

**The trap the stage text names.** The connective model has no homotopy in
negative degrees, for any ring at all. That absence is a property of the model
and carries no information about the ring. Vanishing of the negative K-groups
of a *singular* ring may not be inferred from it; the vanishing theorem here is
for regular noetherian rings and is proved from the Fundamental Theorem.

Coverage: **source_decomposed**.

Eight nodes. Karoubi's flasque rings with the Eilenberg swindle, the infinite sum rings and the cone ring, stated with the explicit warning that the pinned IsFlasque of both libraries is the sheaf-theoretic predicate and that a formalisation must not reuse the name; Bass's contracted functors, with the contraction LF defined as the cokernel of the map out of the two polynomial rings and with the splitting required natural in the variable as well as in the ring, which is the part that makes the iteration work; the negative K-groups as the iterated contraction, with the four-term decomposition of the zeroth K-group of the Laurent ring; the Fundamental Theorem in every degree with the Nil terms identified as the N-groups one degree up and the splitting given by the class of the variable; the four axioms a theory of negative K-theory must satisfy, with Bass's groups as the example that makes them non-vacuous; Mayer-Vietoris in negative degrees; the nonconnective spectrum, built as the homotopy colimit of the iterated desuspensions with each map the inclusion of a deeper connective cover, so that its homotopy groups are the K-groups above degree zero and Bass's groups below, together with the model-independence statement the stage text's 'independence of enlargement' asks for; and the vanishing theorem for regular noetherian rings, stated with the non-example the stage text names by hand. Every stage target has a node. The localisation clause of the stage text is carried by the nonconnective spectrum node and by Mayer-Vietoris rather than by a node of its own, because the source develops localisation for this roadmap in the earlier layers and the only new content here is that the sequence continues downwards; that is stated. What is not decomposed here is the alternative flasque-enlargement construction of the spectrum, which the source does not give; the axioms node records how it would be compared with this one, and the gap says so.

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

Seven nodes. Morita invariance with the Structure Theorem, the matrix instance and the compatibility with products, resting on the three pinned Mathlib declarations the audit names; the derived statement as a comparison node, which states the enhancement hypothesis, records that the K-theory construction consumes a category with cofibrations and weak equivalences rather than a homotopy category, and gives the failure of a naked triangulated equivalence as a non-example, exactly as the stage text demands, while keeping the degree-zero part that does survive and citing Tau Ceti's pinned exact-equivalence invariance for it; compatibility with filtered colimits and with finite products, in both the connective and the nonconnective theory; the external products from biexact functors, with the associativity, unit and symmetry homotopies carried as transported data rather than asserted, and with the pinned Tau Ceti degree-zero product cited; graded commutativity of the total K-group, with the degree-one specialisation and the link to the splitting of K.6's fundamental theorem; the compatibilities with relative groups, localisation boundaries and transfers, each stated as a separate assertion with its own proof obligation; and the two unit tests the stage text names. Every stage target has a node. The higher-degree product statements rest on the source's spectrum-level pairing, which is stated but whose construction the source defers to Waldhausen's paper; the gap records that and names the next source action.

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

- II.2.1 and V.1, on filtered colimits (PDF pp. 104 and 374), The colimit statement, verbatim.

  > K_0 commutes with filtered colimits of rings: if R is the colimit of a filtered system R_i then K_0(R) is the colimit of the K_0(R_i). The same holds for K_n for all n.

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

### The flasque-enlargement construction of the nonconnective spectrum has no source here

Needed by: `GeneralAlgebraicKTheory:K.6`.

The stage text asks for the nonconnective extension through a flasque enlargement, a suspension and an idempotent completion, which is the Pedersen-Weibel and Thomason route. The K-book gives the Bass delooping instead: the functor LE, its desuspension, the identification with the connective cover and the homotopy colimit. This packet decomposes that route in full and states the four axioms as the interface through which a second construction would be compared with it, but it does not decompose the flasque route, because no source for it was read. NEXT SOURCE ACTION: obtain Pedersen and Weibel, 'A nonconnective delooping of algebraic K-theory' (Lecture Notes in Mathematics 1126, 1985), and Thomason and Trobaugh section 6, and decompose the flasque enlargement, the suspension and the proof that the resulting spectrum satisfies the four axioms; the comparison with the Bass spectrum is then a theorem rather than an assumption.

### The construction of the spectrum-level product is deferred by the source

Needed by: `GeneralAlgebraicKTheory:K.7`.

II.9.5.2 states that a biexact functor of Waldhausen categories induces a pairing of K-theory spectra, and the source refers to Waldhausen for the construction. The bilinear pairing on the zeroth groups is constructed in full at II.7.4 and is decomposed here; the higher-degree pairing is stated with its attribution and its coherence is listed as data to be carried, not as something proved. NEXT SOURCE ACTION: read Waldhausen, 'Algebraic K-theory of spaces' section 1.5, for the construction of the pairing and for the associativity and unit coherence, and decompose the proof that the pairing is well defined on the K-theory of a Waldhausen category.

### No source was read for the enhanced form of derived Morita invariance

Needed by: `GeneralAlgebraicKTheory:K.7`.

The comparison node states the correct hypothesis, that the equivalence is of enhancements rather than of triangulated categories, and supports it with the source's own definition of a Waldhausen category and with the invariance under an exact equivalence of Waldhausen categories. The differential graded and stable infinity-categorical formulations, and the counterexamples showing that a triangulated equivalence is genuinely insufficient, were not read. NEXT SOURCE ACTION: read Toen, 'The homotopy theory of dg-categories and derived Morita theory', and Schlichting's 'A note on K-theory and triangulated categories', the latter for the failure; decompose the statement that K-theory is invariant under a quasi-equivalence of dg-categories and record the counterexample explicitly as a non-example node.

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

Three excerpts ran past four hundred characters and were elided at a word
boundary, marked with an ellipsis; the locators name the pages so the full text
can be read in the source.
