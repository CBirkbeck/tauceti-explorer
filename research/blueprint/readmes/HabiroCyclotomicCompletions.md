# HabiroCyclotomicCompletions — HC.1 to HC.6

The blueprint for the whole roadmap: the cyclotomic completion of a polynomial
ring, its expansions and algorithms, evaluation and Taylor maps, the rigidity
theorems, modules and the exported interface. This document is definitive; the
packet `research/blueprint/packets/HabiroCyclotomicCompletions.json` is its
machine form and the suggested Lean file is a naming proposal, not an
implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The source

One paper — the one the stage texts cite by theorem number throughout:

> Kazuo Habiro, *Cyclotomic Completions of Polynomial Rings*. Publications of the Research Institute for Mathematical Sciences 40 (2004), pp. 1127 to 1146; open access. Locators give the printed page, which the PDF carries in its headers.
> <https://doi.org/10.2977/prims/1145475444>,
> SHA-256 `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f`, accessed 2026-09-25.

- Obtained by resolving the article's DOI to the publisher's page and downloading the article file it names. The publisher's own DOI mapping for this volume is unreliable: the DOI printed in several secondary sources resolves to a different article, and the correct one was found through a bibliographic lookup by title. The hash recorded here is of the file actually read.
- §1, the introduction, pp. 1127 to 1129: the two properties that justify calling the completion a ring of analytic functions on the roots of unity, the evaluation map and its injectivity, the expansion homomorphism and its injectivity, the non-injectivity over the rationals with the injectivity of the map from the integral completion, and the Kontsevich series with the isomorphism exhibiting it as an element.
- §2, p. 1129: conventions, adic completion notation, separatedness and completeness, and the directed set of positive integers under divisibility.
- §3.1, pp. 1130 to 1131: monic completions of polynomial rings, the directed multiplicative set, the linear topology, the completion as an inverse limit and the restriction homomorphisms.
- Proposition 3.1 and Corollary 3.1, pp. 1131 to 1134: the one-step injectivity statement with its proof by reduction to a complete coefficient ring, and the connected-subset corollary.
- §4 with Lemma 4.1 and Theorem 4.1, pp. 1134 to 1136: the identification of the cyclotomic completion with the monic one, the two cyclotomic lemmas, the adjacency relation and the injectivity theorem with its chain hypothesis and its two corollaries.
- §5 with Lemma 5.1, Theorem 5.1, Lemma 5.2, Remark 5.1 and Theorem 5.2, pp. 1137 to 1138: the adjacency relation on roots with its three equivalent conditions, the connected-subset theorem for roots, the comparison of connectedness for roots and for orders, and the rootwise Taylor injectivity theorem with all its hypotheses.
- §6, Theorem 6.1 with its proof and the consequence quoted in the introduction, pp. 1140 to 1141: evaluation uniqueness with the precise infinite-set condition.
- §7.3 with Theorem 7.1, and §7.4 with Proposition 7.4, pp. 1143 to 1145: the module completion with the module form of the injectivity theorem, and the three non-surjectivity statements with the proof of the first.
- NOT read in full: §3.2 and §3.3, the proofs in §5 beyond their statements and Lemma 5.1, §6.2, §7.1, §7.2 and §7.5. The statements quoted from §7.5 are the ones repeated in the introduction.
- The PDF's text layer inserts spaces inside words and drops some subscripts; every excerpt quoted here was repaired character by character against the surrounding text, without changing a word, and mathematical symbols are written out in words where the layer lost them.

There is **no integrated decomposition** for this roadmap.

## What the pinned libraries already have

`AUDIT-17` records every layer as *not built*, and what it finds is a striking
amount of exactly the right infrastructure with nothing assembled. Every claim
was re-checked against the declaration index. Cited, never re-planned:

- `mathlib:AdjoinRoot` (`Mathlib/RingTheory/AdjoinRoot.lean`) — The quotient of a polynomial ring by a polynomial, the pinned carrier of the target of HC.3's evaluation.
- `mathlib:IsAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Basic.lean`) — Adic completeness, the hypothesis under which the re-expansions of HC.3 are defined.
- `mathlib:IsPrecomplete` (`Mathlib/RingTheory/AdicCompletion/Basic.lean`) — The precompleteness half of the same, used for the completion statements of HC.1.
- `mathlib:IsPrimitiveRoot` (`Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`) — Primitive roots of unity, the points at which HC.3 evaluates.
- `mathlib:LaurentPolynomial` (`Mathlib/Algebra/Polynomial/Laurent.lean`) — Laurent polynomials as the localisation at the indeterminate, the comparison HC.2 makes when the indeterminate is invertible.
- `mathlib:Polynomial.Monic` (`Mathlib/Algebra/Polynomial/Degree/Defs.lean`) — Monicity, which is what makes division with remainder and the whole index monoid work.
- `mathlib:Polynomial.cyclotomic` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`) — Cyclotomic polynomials over any ring, monic and defined by base change from the integers; the index set of the whole roadmap is built from them.
- `mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`) — The prime-power cyclotomic polynomial as a geometric sum, the pinned half of the congruence HC.4's adjacency lemma uses.
- `mathlib:Polynomial.hasseDeriv` (`Mathlib/Algebra/Polynomial/HasseDeriv.lean`) — Hasse derivatives, which are the higher Taylor coefficients and are NOT the ordinary derivatives divided by factorials over a general ring.
- `mathlib:Polynomial.modByMonic` (`Mathlib/Algebra/Polynomial/Div.lean`) — Division with remainder by a monic polynomial over any commutative ring, with its degree bound and uniqueness; this is exactly the normalisation of HC.2.
- `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean`) — The factorisation of q to the n minus one into the cyclotomic polynomials of its divisors, which is the multiplicity count HC.1's cofinality proof needs.
- `mathlib:Polynomial.taylor` (`Mathlib/Algebra/Polynomial/Taylor.lean`) — The polynomial Taylor shift, whose completed version is HC.3's Taylor map.
- `mathlib:Polynomial.taylor_coeff` (`Mathlib/Algebra/Polynomial/Taylor.lean`) — The identification of its coefficients with Hasse derivatives, which HC.3 consumes rather than reproving.
- `mathlib:PowerSeries` (`Mathlib/RingTheory/PowerSeries/Basic.lean`) — Formal power series, the target of the Taylor map.
- `mathlib:PowerSeries.subst` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`) — Substitution into a power series, which requires exactly the topological nilpotence hypothesis HC.3 insists on for a re-expansion.
- `tauceti:TauCeti.TopCommRingCat.IsCompleteSeparated` (`TauCeti/Topology/Category/TopCommRingCat/CompleteSeparated/Basic.lean`) — Complete separated topological commutative rings as a category, the target of HC.1's universal property.

Nothing named Habiro exists in either tree; `P_N(q)` has no carrier (Mathlib
lists q-Pochhammer symbols as a TODO); and no cyclotomic completion, evaluation
or Taylor map out of one is constructed anywhere.

## HC.1 — The directed system and its topology

`R[q]^S = lim_{f} R[q]/(f)` over the monoid generated by `Φ_n(q)`, `n ∈ S`,
directed by divisibility — with projections, extensionality by finite
quotients, completeness, separatedness and a universal property.

**Two cautions from the stage text, both carried.** No injectivity of
`R[q] → R[q]^S` is asserted for arbitrary `R` and `S`. And for `S = ℕ_{>0}`
the products `P_N = ∏_{i≤N}(1−qⁱ)` are cofinal, so this completion is
**neither the q-adic nor the (q−1)-adic** one.

Coverage: **source_decomposed**.

Three nodes. The completion itself, built as the inverse limit over the directed monoid of products of cyclotomic polynomials, with the projections, the dense polynomial map, extensionality by the finite quotients, completeness, separatedness and the universal property, and with the stage text's caution honoured: NO injectivity of the polynomial map is asserted, and the degenerate empty-product case is recorded. The cofinality of the factorial products for the set of all orders, with the multiplicity count and the comparison with the system of ideals generated by a power of q minus one, and with the non-example the stage text names, that this is neither the q-adic nor the q-minus-one-adic completion. And the two functorialities, covariant in the ring and contravariant in the order set, with the identity and composition laws, the canonical isomorphism for cofinal systems, and the distinction between completed and uncompleted base change with the explicit statement that flatness does not license the interchange.

### The cyclotomic completion of a polynomial ring

`HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion` · *construction* · planet **The cyclotomic completion**

For a ring R and a set S of positive integers, let the index set be the multiplicative monoid generated by the cyclotomic polynomials of order in S, directed by divisibility; the CYCLOTOMIC COMPLETION is the inverse limit of the quotients of the polynomial ring by the principal ideals those products generate. The construction comes with projections to the finite quotients, a dense map from the polynomial ring, extensionality by the finite quotients, completeness and separatedness for the resulting linear topology, and the universal property for continuous maps into complete separated rings. The source defines it in the greater generality of an arbitrary set of monic polynomials, and the cyclotomic case is the instance where the set is the one of cyclotomic polynomials of order in S.

**Hypotheses.**

- R is commutative and unital; S is a set of positive integers, possibly empty or infinite.
- The index monoid is directed by divisibility, which is what makes the inverse limit a limit over a directed set.
- The map from the polynomial ring is NOT injective for every R and S, and no injectivity is asserted here; the hypotheses under which it is injective are the subject of HC.4.

**Proof outline.**

1. Define the monoid generated by the cyclotomic polynomials of order in S and prove that it is directed by divisibility.
2. Define the completion as the inverse limit of the quotients and construct the projections and the transition maps, checking compatibility.
3. Prove independence of the representative of a product, so that the quotient depends only on the ideal.
4. Prove extensionality: two elements are equal when their images in every finite quotient agree.
5. Prove completeness and separatedness for the linear topology the ideals define.
6. State and prove the universal property for continuous maps into complete separated rings.
7. Record the degenerate cases: the empty product is one, its quotient is the zero ring and contributes only the initial stage of the system, and the source's own notational warning about the singleton case.

**Acceptance.**

- Two elements with the same image in every finite quotient are equal.
- The completion is complete and separated for its linear topology.
- The map from the polynomial ring need NOT be injective; no such statement is made here.
- The empty product is one and its quotient is the zero ring.

**Prerequisites.** `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.Monic`, `mathlib:IsPrecomplete`, `tauceti:TauCeti.TopCommRingCat.IsCompleteSeparated`

**API.**

| name | role | statement |
| --- | --- | --- |
| `cycloIndex` | data | The directed monoid of products of cyclotomic polynomials of order in S. |
| `cycloCompletion` | data | The completion itself. |
| `cycloCompletion.proj` | projection | The projection to a finite quotient. |
| `cycloCompletion.fromPoly` | data | The map from the polynomial ring, with dense image. |
| `cycloCompletion.ext` | characterisation | Extensionality by the finite quotients. |
| `cycloCompletion.universal` | characterisation | The universal property for continuous maps into complete separated rings. |
| `cycloCompletion.complete` | characterisation | Completeness and separatedness. |

**Used by.**

- *HC.2* — The expansions are computed through the projections.
- *HC.3* — Evaluation and the Taylor map are constructed from compatible quotient maps.
- *HC.6* — The completion, its projections and its universal property are what this roadmap exports.

**Unit tests.**

- `empty_product` — The empty product is one and its quotient is the zero ring.
- `ext_by_quotients` — Two elements agreeing in every finite quotient are equal.
- `no_injectivity` — No injectivity of the map from the polynomial ring is asserted; it fails for suitable R and S.
- `universal_property` — A continuous map into a complete separated ring factors uniquely through the completion.

**Sources.**

- §3.1, p. 1130 of the PDF, The construction in the generality the source uses, verbatim; the cyclotomic completion is the instance where M is the set of cyclotomic polynomials of order in S.

  > For a ring R, let M_R denote the set of the monic polynomials in R[q], which is a directed set with respect to the divisibility relation. For a subset M of M_R, let M* denote the multiplicative set in R[q] generated by M, which is a directed subset of M_R. The principal ideals (f), f in M*, define a linear topology of the ring R[q]. Let R[q]^M = lim_{f in M*} R[q]/(f) denote the completion.

- §4, p. 1134 of the PDF, The identification of the cyclotomic case with the general construction, verbatim.

  > If R a ring, and S is a subset of N, then the completion R[q]^S defined in the introduction can be identified with R[q]^{Phi_S}.

### Cofinality of the factorial products, and which completion this is not

`HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products` · *theorem* · planet **Cofinality of the factorial products**

For the set of ALL positive integers the products of the first N factors of the form one minus a power of q are cofinal in the index monoid, so the completion is the inverse limit of the quotients by those products; equivalently it is the limit of the completions at the ideals generated by a power of q minus one, using divisibility in the exponent. The comparison is by exhibiting each system's ideals as cofinal in the other's, and it requires counting the multiplicity with which each cyclotomic factor occurs. This completion is neither the q-adic nor the q-minus-one-adic completion, and the node records that as a non-example.

**Hypotheses.**

- The set of orders is all of the positive integers; for a general S the factorial products are not available.
- The counting uses that q to the n minus one is the product of the cyclotomic polynomials of the divisors of n, which is pinned.
- Cofinality is mutual: each ideal of one system contains an ideal of the other.

**Proof outline.**

1. Record the pinned factorisation of q to the n minus one into cyclotomic factors.
2. Compute the multiplicity of each cyclotomic factor in the factorial product of the first N terms.
3. Prove that the two systems of ideals are mutually cofinal and conclude that the completions agree.
4. Record the source's own statement of this isomorphism in the introduction, which is where the Kontsevich series is exhibited as an element.
5. State the non-example: neither the q-adic nor the q-minus-one-adic topology gives this completion, since each is the completion at a single ideal and this one is not.

**Acceptance.**

- The factorial products are cofinal, so the completion is their inverse limit.
- The same completion is obtained from the ideals generated by a power of q minus one.
- It is not the q-adic completion and not the q-minus-one-adic completion.
- The multiplicity count is part of the proof and not a formality.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`

**Sources.**

- §1, the introduction, p. 1128 of the PDF, The cofinality statement in the form the source uses it, verbatim, together with the standing example it produces.

  > some specific elements of Z[q]^N [are given by] the series sum over n >= 0 of (1 - q)(1 - q^2) ... (1 - q^n), which was introduced by Kontsevich, and which can be regarded as an element of Z[q]^N since we have an isomorphism Z[q]^N = lim_n Z[q]/((1 - q) ... (1 - q^n)).

### Functoriality in the coefficient ring and restriction in the order set

`HabiroCyclotomicCompletions:HC.1/functoriality-in-the-ring-and-in-the-order-set` · *construction*

The completion is covariant and continuous in the coefficient ring and contravariant in the set of orders: a ring map induces a continuous map of completions, and an inclusion of order sets induces a restriction map, with the identity and composition laws in both variables and with compatibility between them. Two completions attached to cofinal systems are canonically topologically isomorphic. The node also fixes the distinction the stage text insists on: base change followed by completion is not completion followed by base change, and flatness alone does not license interchanging a base change with an arbitrary infinite inverse limit.

**Hypotheses.**

- The ring maps are unital; the restriction is along an inclusion of subsets of the positive integers.
- Cofinal systems give a canonical topological isomorphism, which is the general fact about inverse limits over cofinal subsets.
- The interchange statement is a NON-statement: it is recorded to prevent its use, and no flatness hypothesis is offered as a substitute.

**Proof outline.**

1. Construct the induced map for a ring homomorphism and prove continuity.
2. Construct the restriction map for an inclusion of order sets.
3. Prove the identity and composition laws in both variables and their compatibility.
4. Prove the canonical isomorphism for cofinal systems.
5. State the distinction between completed base change and uncompleted base change, with the non-example that flatness does not license the interchange.
6. Record the source's own use of the restriction maps, which are the maps whose injectivity HC.4 studies.

**Acceptance.**

- The two functorialities commute with each other.
- Cofinal systems give canonically isomorphic completions.
- Completed base change is not uncompleted base change, and flatness does not repair this.
- The restriction maps are the ones whose injectivity is the subject of HC.4.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`

**API.**

| name | role | statement |
| --- | --- | --- |
| `cycloCompletion.mapRing` | functoriality | The map induced by a ring homomorphism. |
| `cycloCompletion.restrict` | functoriality | The restriction along an inclusion of order sets. |
| `cycloCompletion.restrict_comp` | compatibility | The composition law for restrictions. |
| `cycloCompletion.cofinal_iso` | characterisation | Cofinal systems give canonically isomorphic completions. |
| `cycloCompletion.baseChange_ne` | relation | Completed base change is not uncompleted base change. |

**Used by.**

- *HC.4* — The injectivity theorems are statements about the restriction maps.
- *HC.5* — The module version uses the same two functorialities.
- *HC.6* — Both are part of the exported interface.

**Unit tests.**

- `identity` — The restriction along the identity inclusion is the identity.
- `composition` — Restrictions compose.
- `cofinal` — A cofinal subsystem gives the same completion.
- `no_interchange` — Base change does not commute with the completion; flatness alone does not license it.

**Sources.**

- §3.1, p. 1130 of the PDF, The restriction maps, verbatim.

  > If M' is contained in M and both are subsets of M_R, then (M')* is a directed subset of M*, and hence the identity of R[q] induces a homomorphism rho^R_{M, M'} : R[q]^M -> R[q]^{M'}.

## HC.2 — Expansions and coefficient algorithms

Every element is `∑ a_N(q) P_N(q)`. **Unrestricted expansions are not**
**unique**; the normalised one — divide with remainder by the monic `P_N` —
exists and is unique, and Mathlib's `modByMonic` gives it.

Algorithms with congruence correctness, and a finite-dependence statement: a
computation to precision `N` uses finitely many coefficients. `q` is a unit;
**a cyclotomic polynomial of an order in `S` is not**, and no formal division
by it is admitted.

Coverage: **source_decomposed**.

Three nodes. The factorial expansion, obtained from successive representatives, with the stage text's distinction built in: unrestricted expansions are not unique, the normalised one obtained by division with remainder by the monic factorial product exists and is unique, and Mathlib's division with remainder is cited for it. The algorithms for addition, multiplication and coefficient extraction, each with a congruence correctness theorem and with the finite-dependence statement that makes a computation to precision N use only finitely many coefficients. And the invertibility of the indeterminate with the comparison of the polynomial and Laurent constructions, together with the prohibition the stage text states, that no formal division by a cyclotomic polynomial that is not a unit is admitted.

### Factorial expansions of a compatible element

`HabiroCyclotomicCompletions:HC.2/factorial-expansions` · *construction* · planet **Factorial expansions**

Building representatives successively modulo the factorial products shows that every compatible family is the limit of a series whose N-th term is a polynomial coefficient times the N-th factorial product. The expansion is convergent in the completion's topology because the products divide one another. Unrestricted coefficient expansions are NOT unique; a normalised expansion, obtained by dividing with remainder by the monic factorial product so that each coefficient has bounded degree, exists and IS unique, and that is the form the algorithms of the next node use. Division with remainder by a monic polynomial over any commutative ring, with its degree bound and uniqueness, is pinned in Mathlib and each factorial product is monic.

**Hypotheses.**

- The order set is all the positive integers, so that the factorial products are available; for a general S the analogue uses whichever cofinal system that S provides.
- Uniqueness holds only for the normalised expansion; without the degree bound the coefficients can be changed by multiples of the next factor.
- Convergence is in the completion's own topology, not in any q-adic sense.

**Proof outline.**

1. Construct representatives successively modulo the factorial products from a compatible family.
2. Prove that the resulting series converges in the completion and represents the element.
3. Define the normalised expansion by division with remainder, using the pinned statement for monic divisors.
4. Prove existence and uniqueness of the normalised expansion.
5. State the non-uniqueness of unrestricted expansions, with the explicit ambiguity that the next coefficient absorbs.
6. Record the standing example: the Kontsevich series, whose normalised expansion has all coefficients one.

**Acceptance.**

- Every element has a normalised expansion and it is unique.
- Unrestricted expansions are not unique.
- The Kontsevich series is an element, with all normalised coefficients one.
- Convergence is in the completion's topology and not in a q-adic one.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`, `mathlib:Polynomial.modByMonic`, `mathlib:Polynomial.Monic`

**API.**

| name | role | statement |
| --- | --- | --- |
| `factorialExpansion` | data | The normalised expansion of an element. |
| `factorialExpansion_unique` | characterisation | Its uniqueness. |
| `factorialExpansion_sum` | characterisation | The expansion converges to the element. |
| `factorialExpansion_degree_bound` | projection | The degree bound on each coefficient. |
| `unrestricted_not_unique` | relation | Unrestricted expansions are not unique. |

**Used by.**

- *HC.2, the algorithms* — The algorithms operate on normalised expansions.
- *HC.6* — The acceptance examples compute expansions to finite precision.
- *HabiroNumberFields* — The exported elements are given by their expansions.

**Unit tests.**

- `kontsevich` — The Kontsevich series has all normalised coefficients one.
- `uniqueness` — The normalised expansion is unique.
- `unrestricted` — Two different unrestricted expansions can represent the same element.
- `truncation` — Truncating at N gives the image in the N-th finite quotient.

**Sources.**

- §1, the introduction, p. 1128 of the PDF, The standing example of an element given by a factorial expansion, verbatim.

  > the series sum over n >= 0 of (1 - q)(1 - q^2) ... (1 - q^n), which was introduced by Kontsevich, and which can be regarded as an element of Z[q]^N

### Algorithms on normalised expansions, with congruence correctness

`HabiroCyclotomicCompletions:HC.2/algorithms-on-expansions` · *construction*

Addition, multiplication and coefficient extraction are computed on normalised expansions by finite algorithms: a computation to precision N depends on only finitely many input coefficients, and each algorithm carries a correctness theorem stated as a congruence modulo the N-th factorial product. Tau Ceti already has executable, proved-correct arithmetic modulo a monic polynomial by synthetic division on coefficient lists, which is the layer beneath these algorithms; what is new is the bookkeeping that turns a finite computation into a statement about the completion.

**Hypotheses.**

- The expansions are the normalised ones of the previous node.
- Precision N means modulo the N-th factorial product; the correctness statements are congruences at that precision.
- The finiteness statement is that the first N output coefficients depend only on the first N input coefficients, which is what makes the algorithms executable.

**Proof outline.**

1. State the addition algorithm and prove its congruence correctness.
2. State the multiplication algorithm, with the renormalisation step, and prove its congruence correctness.
3. State coefficient extraction and prove that it depends on finitely many input coefficients.
4. Prove the finiteness statement in the form the previous point needs.
5. Record the pinned executable arithmetic modulo a monic polynomial that the algorithms call.
6. Record the acceptance example: computing a product to precision three by hand and checking it against the definition.

**Acceptance.**

- Each algorithm is correct modulo the relevant factorial product.
- A computation to precision N uses only finitely many coefficients.
- The algorithms agree with the ring operations of the completion.
- The renormalisation step in multiplication is necessary; without it the output is an unrestricted expansion.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.2/factorial-expansions`, `mathlib:Polynomial.modByMonic`

**API.**

| name | role | statement |
| --- | --- | --- |
| `expansionAdd` | data | Addition of normalised expansions. |
| `expansionMul` | data | Multiplication with renormalisation. |
| `expansionCoeff` | data | Coefficient extraction. |
| `expansionAdd_correct` | characterisation | Congruence correctness of addition. |
| `expansionMul_correct` | characterisation | Congruence correctness of multiplication. |
| `expansion_finite_dependence` | characterisation | Finite dependence at each precision. |

**Used by.**

- *HC.6* — The acceptance examples are runs of these algorithms.
- *HC.3* — The evaluation and Taylor maps are computed from truncated expansions.
- *ArithmeticQuantumTopology* — The quantum invariants are computed in this form.

**Unit tests.**

- `add_precision` — Addition to precision N uses only the first N coefficients.
- `mul_renormalises` — Multiplication renormalises; without it the result is not normalised.
- `agreement` — The algorithms agree with the ring operations.
- `worked_product` — A product computed to precision three matches the definition.

**Sources.**

- §3.1, p. 1130 of the PDF, The topology in which the precision statements are made, verbatim; the algorithms are the computational form of working modulo those ideals.

  > The principal ideals (f), f in M*, define a linear topology of the ring R[q].

### The indeterminate is invertible, and what may not be inverted

`HabiroCyclotomicCompletions:HC.2/invertibility-of-q` · *theorem*

In the full completion, over the set of all positive integers, the indeterminate is a unit, and its inverse can be computed to any finite precision by the algorithms of the previous node. The polynomial and Laurent-polynomial constructions therefore give the same completion in that case. What may NOT be done is to divide formally by a cyclotomic polynomial that is not a unit: the completion is not a field, its finite quotients are not domains in general, and a formal division by a non-unit produces no element.

**Hypotheses.**

- The order set contains one, which is what makes the indeterminate invertible; for a set of orders not containing one the statement can fail.
- The inverse is computed by the algorithms and its normalised expansion is exhibited to a small precision.
- The comparison with the Laurent construction is an isomorphism of topological rings.

**Proof outline.**

1. Prove that the indeterminate is a unit, exhibiting the inverse as a limit of polynomial approximations.
2. Compute the inverse to a small precision as a worked example.
3. Prove that the Laurent-polynomial construction gives the same completion when the indeterminate is invertible.
4. State the non-example: a cyclotomic polynomial of an order in the set is not a unit, and no formal division by it is available.
5. Record what the pinned library supplies: the unit criteria and the Laurent polynomials as the localisation at the indeterminate.

**Acceptance.**

- The indeterminate is a unit and its inverse is computable to any precision.
- The polynomial and Laurent constructions agree in that case.
- A cyclotomic polynomial of an order in the set is not a unit.
- No formal division by a non-unit is admitted.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.2/algorithms-on-expansions`, `mathlib:LaurentPolynomial`

**Sources.**

- §2, p. 1129 of the PDF, The standing convention, verbatim; the invertibility statement of this node is about units of the completion under it.

  > Throughout the paper, rings are unital and commutative, and homomorphisms of rings are unital.

## HC.3 — Root evaluation and Taylor maps

`ev_ζ` factors through one finite quotient because `q − ζ | Φ_{ord ζ}(q)`;
`σ_ζ : R[q]^S → R[ζ][[q − ζ]]` because `(q−ζ)ⁱ | Φ_{ord ζ}(q)ⁱ`.

**The higher coefficients are Hasse derivatives**, and Mathlib proves exactly
that at polynomial level. Comparing with ordinary derivatives keeps the
factorial denominators — which matters over ℤ.

**Re-expansion needs nilpotence.** Substituting a constant into a power series
is not defined; Mathlib's `PowerSeries.subst` requires precisely the hypothesis
the stage text insists on.

Coverage: **source_decomposed**.

Three nodes. Evaluation at a root whose order lies in the set, through a single finite quotient and independent of the truncation, with the source's own assembled map to functions on the roots of unity and with the record that no evaluation exists at an order outside the set. The Taylor map, with the divisibility that makes it well defined, its constant term identified with the evaluation and its higher coefficients identified with HASSE derivatives, citing Mathlib's polynomial-level statement and carrying the stage text's warning that the comparison with ordinary derivatives keeps the factorial denominators. And naturality in all four senses the stage text lists, together with the re-expansion maps, which are constructed only under topological nilpotence in a complete coefficient ring — exactly the hypothesis Mathlib's power-series substitution requires — and their cocycle law.

### Evaluation at a root of unity

`HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity` · *construction* · planet **Evaluation at a root of unity**

For a root of unity whose order lies in the set of orders, evaluation of an element of the completion at that root is well defined: the linear factor divides the cyclotomic polynomial of that order, so evaluation factors through a single finite quotient, and the result is independent of which truncation is used. Over the integers with all orders this gives a map from the completion to the functions on the roots of unity, which is the sense in which the source says that its elements are functions on the roots of unity. Mathlib's quotient by a cyclotomic polynomial as an adjoined root is the pinned carrier of the target.

**Hypotheses.**

- The order of the root lies in the set of orders; for an order outside it there is no evaluation.
- The target is the ring obtained by adjoining the root to the coefficient ring, which is the pinned quotient by the cyclotomic polynomial when the polynomial is irreducible there.
- Independence of the truncation is part of the construction: any quotient whose defining product is divisible by the cyclotomic polynomial computes the same value.

**Proof outline.**

1. Prove that the linear factor divides the cyclotomic polynomial of the order, so that evaluation is defined on the corresponding finite quotient.
2. Define evaluation as the composite of a projection with that quotient map, and prove independence of the chosen projection.
3. Assemble the evaluations into the map to functions on the roots of unity and record the source's own statement of it.
4. Record the pinned carrier of the target and the identification of the cyclotomic polynomial as the minimal polynomial of a primitive root.
5. Record that no evaluation exists at a root whose order is outside the set, which is what makes the set of orders meaningful.

**Acceptance.**

- Evaluation is independent of the truncation used.
- Over the integers with all orders the evaluations assemble into a map to functions on the roots of unity.
- There is no evaluation at a root whose order is outside the set of orders.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `mathlib:AdjoinRoot`, `mathlib:IsPrimitiveRoot`, `mathlib:Polynomial.cyclotomic`

**API.**

| name | role | statement |
| --- | --- | --- |
| `evalAt` | data | Evaluation at a root of unity of order in the set. |
| `evalAt_indep` | characterisation | Independence of the truncation. |
| `evalAt_ringHom` | compatibility | It is a ring homomorphism. |
| `evalMap` | data | The assembled map to functions on the roots of unity. |
| `no_evalAt_outside` | relation | No evaluation exists at an order outside the set. |

**Used by.**

- *HC.3, the Taylor map* — The constant term of the Taylor map is this evaluation.
- *HC.4* — The evaluation uniqueness theorem is about the assembled map.
- *ArithmeticQuantumTopology* — The quantum invariants at a root of unity are these evaluations.

**Unit tests.**

- `at_one` — Evaluation at one sends the Kontsevich series to the expected value.
- `indep` — Two truncations give the same value.
- `ring_hom` — Evaluation is a ring homomorphism.
- `outside_orders` — There is no evaluation at a root of unity whose order is not in the set.

**Sources.**

- §1, the introduction, p. 1128 of the PDF, The construction with the divisibility that makes it work, verbatim.

  > If f(q) is in Z[q]^N and zeta is a root of unity, then the evaluation f(zeta) of f(q) at zeta is well defined, since q - zeta divides Phi_n(q) with n = ord zeta. Hence there is a well defined map ev : Z[q]^N -> Map(Z_N, Z[Z_N]) such that ev(f(q)) = (f(zeta))_{zeta}.

### The Taylor map at a root of unity

`HabiroCyclotomicCompletions:HC.3/the-taylor-map` · *construction* · planet **The Taylor map**

For a root of unity of order in the set of orders there is an expansion homomorphism from the completion into the power series over the ring obtained by adjoining the root, in the variable q minus the root, induced by the inclusion of polynomial rings and by the fact that the i-th power of the linear factor divides the i-th power of the cyclotomic polynomial. Its constant term is the evaluation of the previous node, and its higher coefficients are the HASSE derivatives, not the ordinary ones: the comparison with ordinary derivatives keeps the factorial denominators, which matters over a ring where factorials are not invertible. At the polynomial level Mathlib has exactly this, that the n-th coefficient of the Taylor expansion is the n-th Hasse derivative evaluated at the point.

**Hypotheses.**

- The order of the root lies in the set; the target is the power series ring over the ring with the root adjoined.
- The divisibility that makes the map well defined is that the i-th power of the linear factor divides the i-th power of the cyclotomic polynomial, which is the source's observation.
- The higher coefficients are Hasse derivatives; identifying them with ordinary derivatives divided by factorials is legitimate only where the factorials are invertible.

**Proof outline.**

1. Prove the divisibility of the powers and deduce that the expansion is compatible with the projections.
2. Define the Taylor map and prove that it is a ring homomorphism.
3. Prove that its constant term is the evaluation.
4. Identify the higher coefficients with the Hasse derivatives, citing the pinned polynomial-level statement.
5. Record the warning about factorial denominators with a concrete instance over the integers.
6. Record the source's own description of the map as the power series expansion at the root.

**Acceptance.**

- The constant term is the evaluation.
- The higher coefficients are Hasse derivatives.
- Over a ring where factorials are not invertible the identification with ordinary derivatives fails.
- The map is a ring homomorphism into the power series ring.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`, `mathlib:Polynomial.taylor`, `mathlib:Polynomial.taylor_coeff`, `mathlib:Polynomial.hasseDeriv`, `mathlib:PowerSeries`

**API.**

| name | role | statement |
| --- | --- | --- |
| `taylorAt` | data | The Taylor map at a root of unity. |
| `taylorAt_constantCoeff` | characterisation | Its constant term is the evaluation. |
| `taylorAt_coeff` | characterisation | Its higher coefficients are Hasse derivatives. |
| `taylorAt_ringHom` | compatibility | It is a ring homomorphism. |
| `taylorAt_factorials` | relation | The comparison with ordinary derivatives keeps the factorial denominators. |

**Used by.**

- *HC.4* — The rootwise Taylor injectivity theorem is about this map.
- *HC.6* — The difference between a value and a full Taylor series is one of the acceptance tests.
- *HabiroNumberFields* — The exported expansions are these.

**Unit tests.**

- `constant_term` — The constant term is the evaluation.
- `hasse` — The first higher coefficient is the first Hasse derivative, not the derivative divided by one.
- `integer_factorials` — Over the integers the identification with derivatives divided by factorials fails in degree two.
- `ring_hom` — The map is a ring homomorphism.

**Sources.**

- §1, the introduction, p. 1128 of the PDF, The construction with the divisibility it rests on, verbatim.

  > For zeta each root of unity, there is an expansion homomorphism sigma_zeta : Z[q]^N -> Z[zeta][[q - zeta]], induced by Z[q] -> Z[zeta][q], since (q - zeta)^i divides Phi_{ord zeta}(q)^i for i >= 0. For f(q) in Z[q]^N, sigma_zeta(f(q)) can be regarded as the power series expansion of f(q) at zeta.

### Naturality of the two maps, and the re-expansion that needs nilpotence

`HabiroCyclotomicCompletions:HC.3/naturality-and-re-expansion` · *theorem*

Evaluation and the Taylor map are natural under change of the coefficient ring, under conjugation of the root, under restriction of the set of orders, and under the substitution sending the indeterminate to a power of itself whenever that substitution preserves the completion topology. What is NOT available is substitution of an arbitrary constant into a power series: a re-expansion is defined only through topological nilpotence in a coefficient ring proved complete, and Mathlib's substitution for power series requires exactly that hypothesis. The p-adic re-expansion maps are constructed under that hypothesis and satisfy a cocycle law.

**Hypotheses.**

- The index map for the power substitution must preserve the chosen topology, which is a condition on the set of orders.
- The re-expansion is between Taylor expansions at different roots and is defined only when the difference of the roots is topologically nilpotent in a complete coefficient ring.
- The cocycle law is the compatibility of three re-expansions among three roots.

**Proof outline.**

1. State naturality in the coefficient ring and under conjugation of the root.
2. State naturality under restriction of the set of orders.
3. State the substitution sending the indeterminate to a power, with the condition on the index map.
4. Construct the p-adic re-expansion maps under the nilpotence hypothesis, citing the pinned substitution statement.
5. Prove the cocycle law.
6. State the non-example: substituting a constant into a power series without the nilpotence hypothesis is not defined, and the layer forbids it.

**Acceptance.**

- The two maps are natural in all four senses listed.
- The power substitution needs its condition on the index map.
- Re-expansion needs topological nilpotence in a complete coefficient ring.
- The re-expansions satisfy the cocycle law.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `mathlib:PowerSeries.subst`, `mathlib:IsAdicComplete`

**Sources.**

- §5, p. 1137 of the PDF, The three equivalent conditions under which two roots are adjacent, verbatim; they are exactly the separatedness hypotheses this node requires for a re-expansion.

  > 1. (q - zeta) => R (q - zeta'), 2. R is (zeta - zeta')-adically separated, 3. ord(zeta^{-1} zeta') is a power of some prime p such that R is p-adically separated.

## HC.4 — Arithmetic connectedness and rigidity

Adjacency: `m ⇔_R n` when `n/m` is a prime power for a prime at which `R` is
separated. Habiro's two cyclotomic lemmas make it work.

Three rigidity theorems, each with its **full** hypothesis:

| | statement | hypothesis kept |
| --- | --- | --- |
| 4.1 | `ρ_{S,S'}` injective | the **chain** runs inside `S` |
| 5.2 | one Taylor map injective | domain, char 0, separation at odd `p`, and at 2 if `4 ∣ n` |
| 6.1 | evaluation determines | **infinitely many** `m ∈ T` adjacent to one `n` |

**And none of them is an isomorphism.** §7.4's three non-surjectivity
statements are a node of their own.

Coverage: **source_decomposed**.

Five nodes, one per target and one for the non-surjectivity the stage text demands. The adjacency relation, defined through prime-power ratios and separatedness, with Habiro's two cyclotomic lemmas, the congruence modulo the prime with the membership of the prime in the ideal, and the comaximality for a non-prime-power ratio. Theorem 4.1 with its FULL chain hypothesis, which the node states as a hypothesis and not as a simplification. Theorem 5.2, rootwise Taylor injectivity, with the coefficient-domain hypothesis and the separation conditions including their asymmetry between odd primes and the prime two. Theorem 6.1, evaluation uniqueness, with the precise infinite-set condition and with both non-examples the stage text names: a finite set of values never determines a general element, and infinitude alone is not a substitute for adjacency. And the three non-surjectivity statements of §7.4, so that an injective Taylor or restriction map is never treated as an isomorphism anywhere.

### Adjacency of cyclotomic orders and connectedness

`HabiroCyclotomicCompletions:HC.4/adjacency-of-orders` · *definition* · planet **Adjacency of cyclotomic orders**

Two orders are ADJACENT over a coefficient ring when their ratio is an integer power of a prime for which the ring is separated in the adic topology of that prime; a set of orders is CONNECTED when any two of its elements are joined by a chain of adjacent ones inside it. The relation is the one the source defines, and its point is a pair of lemmas on cyclotomic polynomials: modulo the prime the cyclotomic polynomial of the multiplied order is a power of the original one, and the prime lies in the ideal generated by the two cyclotomic polynomials; while for a ratio that is not a prime power the two cyclotomic polynomials are comaximal.

**Hypotheses.**

- The ring is commutative; separatedness at a prime means that the intersection of the powers of that prime ideal is zero.
- Adjacency is not symmetric-looking in the source's notation but is an equivalence-generating relation once chains are allowed; the packet uses chains, as the source does.
- For the ring of integers every prime is separated, so any two orders with prime-power ratio are adjacent.

**Proof outline.**

1. Record the two cyclotomic lemmas with their exact statements: the congruence modulo the prime and the membership of the prime in the ideal generated by the two polynomials.
2. Record the comaximality lemma for a ratio that is not a prime power.
3. Define adjacency and connectedness.
4. Prove the standing instances: over the integers the set of divisors of a fixed integer is connected exactly when the ring is separated at each prime factor, which for the integers is automatic.
5. Record the resultant computation that the comaximality lemma rests on.

**Acceptance.**

- Over the integers any two orders with prime-power ratio are adjacent.
- For a ratio that is not a prime power the two cyclotomic polynomials are comaximal, so the two completions have nothing to say to each other.
- The set of divisors of an integer is connected over a ring separated at each of its prime factors.
- Over the rationals no prime is separated, so no two distinct orders are adjacent; this is what makes the rational case different.

**Prerequisites.** `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum`

**API.**

| name | role | statement |
| --- | --- | --- |
| `Adjacent` | data | The adjacency relation on orders over a ring. |
| `IsConnectedSet` | data | Connectedness of a set of orders. |
| `cyclotomic_congr_mod_p` | characterisation | The congruence modulo the prime. |
| `prime_mem_ideal` | characterisation | The membership of the prime in the ideal generated by the two polynomials. |
| `cyclotomic_comaximal` | characterisation | Comaximality for a non-prime-power ratio. |
| `adjacent_over_Z` | example | Over the integers, prime-power ratios are adjacent. |

**Used by.**

- *HC.4, the injectivity theorems* — Connectedness is the hypothesis of both.
- *HC.5* — Inversion of a prime changes which orders are adjacent, which is the point of the module and localisation nodes.
- *HC.6* — The acceptance example with an inverted prime exercises this.

**Unit tests.**

- `integers` — Over the integers any two orders with prime-power ratio are adjacent.
- `rationals` — Over the rationals no two distinct orders are adjacent.
- `comaximal` — For a ratio of six the two cyclotomic polynomials are comaximal.
- `divisors_connected` — The set of divisors of an integer is connected over a ring separated at its prime factors.

**Sources.**

- Lemma 4.1, p. 1134 of the PDF, The two lemmas on cyclotomic polynomials that make the adjacency relation work, verbatim.

  > (1) Let n be in N, p a prime, and e >= 1. Then we have Phi_{p^e n}(q) = Phi_n(q)^d (mod (p)) in Z[q], where d = deg Phi_{p^e n}(q) / deg Phi_n(q). Also, we have p in (Phi_n(q), Phi_{p^e n}(q)) in Z[q]. (2) If m, n are in N, and n/m is not an integer power of a prime, then we have (Phi_n(q), Phi_m(q)) = (1) in Z[q].

### Injectivity of the restriction maps along a connected chain

`HabiroCyclotomicCompletions:HC.4/injectivity-of-restriction` · *theorem* · planet **Injectivity of restriction**

If every order of a set is joined to the smaller set by a chain of adjacent orders inside it, then the restriction map from the larger completion to the smaller is INJECTIVE. In particular a connected set restricts injectively onto any non-empty subset, and over the integers the completion at all orders restricts injectively onto the completion at any non-empty set of orders. This is the source's Theorem 4.1 with its full chain hypothesis, which this node keeps: it is not enough that the two sets be connected separately, the chain must run inside the larger set and reach the smaller one.

**Hypotheses.**

- The chain hypothesis is as stated: for each element of the larger set there is a chain of adjacent elements inside the larger set ending in the smaller set.
- Adjacency is over the coefficient ring, so the hypothesis involves the separatedness of that ring at the relevant primes.
- The conclusion is injectivity of the restriction, not surjectivity; non-surjectivity is a later node.

**Proof outline.**

1. State the theorem with its chain hypothesis.
2. Record the reduction to the one-step case, which is the source's Proposition on monic completions.
3. Record the one-step argument, which uses the congruence and the ideal membership of the previous node.
4. Record the two corollaries the source states: a connected set restricts injectively onto any non-empty subset, and the integral case with all orders.
5. State the non-example: without the chain hypothesis the restriction can fail to be injective, which is why the hypothesis is carried.

**Acceptance.**

- A connected set restricts injectively onto any non-empty subset.
- Over the integers the completion at all orders restricts injectively onto any non-empty subset.
- The chain must lie inside the larger set; connectedness of the two sets separately is not enough.
- The theorem gives injectivity only; surjectivity is false in the cases of a later node.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.4/adjacency-of-orders`, `HabiroCyclotomicCompletions:HC.1/functoriality-in-the-ring-and-in-the-order-set`

**Sources.**

- Theorem 4.1, p. 1135 of the PDF, The theorem with its chain hypothesis and its two corollaries, verbatim.

  > Let R be a ring and let S' be contained in S contained in N. Suppose that for each element n in S, there is a sequence in S' finishing at n of elements adjacent over R. Then the homomorphism rho^R_{S, S'} is injective. In particular, if S is connected over R, then for any non-empty subset S' of S the homomorphism rho^R_{S, S'} : R[q]^S -> R[q]^{S'} is injective. More particularly, for any ...

### A single Taylor expansion determines the element

`HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity` · *theorem* · planet **Rootwise Taylor injectivity**

For an integral domain of characteristic zero, a connected set of orders and an order in it, if the ring is separated at each odd prime factor of that order and also at two when four divides it, then the Taylor map at a primitive root of that order is INJECTIVE. In particular over the integers, with all orders, the Taylor expansion at any single root of unity determines the element completely. The hypotheses are the source's and are carried here: a domain of characteristic zero, connectedness, and the separation conditions with their asymmetry between odd primes and the prime two.

**Hypotheses.**

- The coefficient ring is an integral domain of characteristic zero; the root need not lie in it, and the target is the power series over the ring with the root adjoined.
- The separation hypotheses are at each odd prime factor of the order, and at two when four divides the order; the asymmetry is the source's and is not a simplification.
- Connectedness of the set of orders over the ring is assumed.

**Proof outline.**

1. State the theorem with all four hypotheses.
2. Record the source's proof structure: reduce to the case where the root lies in the ring, then factor the Taylor map as a restriction followed by an adic map, and apply the previous node to the first factor.
3. Record the integral corollary, that over the integers the expansion at any root determines the element.
4. Record the source's remark that the case of the expansion at one was obtained independently by Vogel.
5. State the non-example: injectivity fails over the rationals, where no two orders are adjacent, which the source records separately.

**Acceptance.**

- Over the integers a single Taylor expansion determines the element.
- The hypotheses on separation are asymmetric between odd primes and two.
- Over the rationals the analogous map is not injective.
- The theorem gives injectivity only, never surjectivity.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.4/injectivity-of-restriction`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`

**Sources.**

- Theorem 5.2, p. 1138 of the PDF, The theorem with all its hypotheses and its integral corollary, verbatim.

  > Let R be an integral domain of characteristic 0, S a connected subset of N over R, and n in S. Assume that R is p-adically separated for each odd prime factor p of n, and also that if 4 divides n, then R is 2-adically separated. Let zeta be a primitive n-th root of unity in the algebraic closure of the quotient field of R, which may or may not be contained in R. Then the homomorphism ...

### Evaluation uniqueness, with the precise infinite-set condition

`HabiroCyclotomicCompletions:HC.4/evaluation-uniqueness-and-its-exact-hypothesis` · *theorem*

For a subring of the algebraic numbers, a connected set of orders and a subset of it, if for SOME order in the set there are infinitely many elements of the subset adjacent to it, then the map given by evaluating at the roots of the orders in the subset is injective. In particular for a subring of the algebraic integers, evaluation at the roots of any set containing infinitely many prime powers determines the element. The condition is the source's and it is a condition of infinitude TOGETHER with adjacency: a finite set of values never determines a general element, and infinitude alone is not a substitute for the adjacency requirement.

**Hypotheses.**

- The coefficient ring is a subring of the algebraic numbers; for the corollary it is a subring of the algebraic integers.
- The condition is the existence of one order with infinitely many adjacent elements in the subset, not that the subset be infinite.
- Connectedness of the ambient set of orders is assumed.

**Proof outline.**

1. State the theorem with its condition and the corollary about prime powers.
2. Record the source's proof: use the injectivity of the restriction to a single order, expand along the powers of its cyclotomic polynomial, and use that infinitely many adjacent orders force the leading coefficient to vanish.
3. State the two non-examples: a finite set of evaluations never determines a general element, and an infinite subset with no order adjacent to a common one does not satisfy the hypothesis.
4. Record the source's own statement in the introduction that an element vanishing at infinitely many roots of prime-power order vanishes.
5. Record the resulting description of the completion over the integers as a ring of functions on the roots of unity.

**Acceptance.**

- Over the integers an element vanishing at infinitely many roots of prime-power order is zero.
- A finite set of evaluations does not determine a general element.
- Infinitude alone is not the hypothesis; adjacency to a common order is required.
- The completion over the integers embeds in the functions on the roots of unity.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.4/injectivity-of-restriction`, `HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity`

**Sources.**

- Theorem 6.1, p. 1140 of the PDF, The theorem with its exact infinite-set condition and its corollary, verbatim.

  > Let R be a subring of the algebraic numbers, S a connected subset of N over R, and T a subset of S. Suppose that for some n in S there are infinitely many elements m in T with m adjacent to n over R. Then the homomorphism ev^R_{S, T} : R[q]^S -> P_T(R) is injective. In particular, if R is a subring of the ring of algebraic integers, then, for any subset T of N containing infinitely many ...

- §1, the introduction, p. 1128 of the PDF, The integral consequence, verbatim.

  > Theorem 6.2 implies for example that f(q) in Z[q]^N vanishes if f(q) vanishes at infinitely many roots of unity of prime power order.

### The injective maps are not isomorphisms

`HabiroCyclotomicCompletions:HC.4/non-surjectivity` · *comparison*

Injectivity is never upgraded to an isomorphism in this roadmap, and the source proves three non-surjectivity statements that this node records: for two distinct adjacent orders the restriction between the corresponding completions is not surjective; for a proper divisor the restriction between the completions at the divisor sets is not surjective; and for every non-empty finite set of orders the restriction from the completion at all orders is not surjective. The proofs go through a commutative square in which one map is visibly not surjective, using the prime-adic quotient of the cyclotomic quotient ring.

**Hypotheses.**

- The coefficient ring is the integers in the source's statements.
- The three statements are about the restriction maps of HC.1, not about the Taylor maps; the non-surjectivity of the Taylor maps is stated in the same section of the source.
- The arguments use the two cyclotomic lemmas of the adjacency node.

**Proof outline.**

1. State the three non-surjectivity statements.
2. Record the source's proof of the first through the commutative square with the prime-adic quotient.
3. Record the consequence for the roadmap: the injective maps of the previous nodes give embeddings and never identifications.
4. State the rule this layer exports: no statement anywhere in the atlas may treat an injective Taylor or restriction map as an isomorphism.
5. Record the source's parallel statement that the Taylor maps are also not surjective.

**Acceptance.**

- The restriction between the completions at two distinct adjacent orders is not surjective.
- The restriction from all orders to any non-empty finite set is not surjective.
- An injective Taylor map is not an isomorphism.
- No identification may be made anywhere on the strength of injectivity.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`, `HabiroCyclotomicCompletions:HC.4/injectivity-of-restriction`

**Sources.**

- Proposition 7.4, p. 1144 of the PDF, The three non-surjectivity statements, verbatim.

  > We have the following. 1. If m, n are in N, m is adjacent to n over Z, and m is not n, then the homomorphism rho^Z_{{m,n}, {m}} is not surjective. 2. If m divides n and m is not n, then the homomorphism rho^Z_{div n, div m} is not surjective. 3. For each non-empty, finite subset S of N, the homomorphism rho^Z_{N, S} is not surjective.

## HC.5 — Modules, inversion of primes and components

The module completion, with **no exactness assumption**: the derived-limit
correction is stated instead, which is why the derived construction belongs to
`HabiroRings:HR.2`. The source's module theorem takes adjacency over the
**module**, not the ring.

Chinese remainder under comaximality; and **inverting a prime destroys**
**adjacency across it** — over ℚ no two distinct orders are adjacent, so `ev`
and `σ_ζ` are not injective there, while `ℤ[q]^ℕ → ℚ[q]^ℕ` is.

Restricted root orders are **not** a localisation.

Coverage: **source_decomposed**.

Four nodes. The module completion, with functoriality, the finite-direct-sum comparison, the continuous scalar action and — as the stage text requires — exactness only under a hypothesis, with the derived-limit correction stated rather than an exactness assumption, together with the source's module form of the injectivity theorem, whose adjacency is taken over the MODULE. The Chinese remainder decomposition for a disconnected collection, with the comaximality hypothesis stated exactly and with the consequence that a completion at a disconnected set is not a domain whatever the coefficient ring. The effect of inverting a prime, with the two computed cases the stage text asks for, the rationals and the integers with a prime inverted, and with the rule that properties of the completion are not inherited from the coefficient ring. And the comparison of restricted root orders with localisation, which shows where the naive localisation fails to have the universal property.

### The cyclotomic completion of a module

`HabiroCyclotomicCompletions:HC.5/the-completed-module` · *construction* · planet **The completed module**

For an abelian group, or a module over the coefficient ring, the same ideals define a completion of the polynomial module, and it is a complete topological module over the completed ring. The construction is functorial in the module, carries finite direct sums to direct sums, has a continuous scalar action, and is exact only under hypotheses; in general an inverse limit of exact sequences is exact only up to a derived-limit correction, and this node states that correction rather than assuming exactness. The source defines exactly this and states the module form of the injectivity theorem with the module's own separation conditions.

**Hypotheses.**

- The module is over the coefficient ring, or merely an abelian group in the source's generality.
- The topology is the one defined by the same products of cyclotomic polynomials acting on the polynomial module.
- Exactness of the completion functor is NOT assumed; the derived-limit term is part of the statement.

**Proof outline.**

1. Define the completion of the polynomial module by the same system of submodules.
2. Prove that it is a complete topological module over the completed ring, with continuous scalar action.
3. Prove functoriality in the module and the comparison for finite direct sums.
4. State the exactness question: the inverse limit of a system of short exact sequences is left exact, and the failure is measured by the first derived limit, which vanishes under the Mittag-Leffler condition.
5. Record the source's module form of the injectivity theorem, with the adjacency relation defined by the module's own separation and with the degenerate case of the zero module.
6. Record that no completion functor is assumed exact anywhere in this roadmap, which is the boundary the interface layer states.

**Acceptance.**

- The completion of a finite direct sum is the direct sum of the completions.
- Exactness holds under the Mittag-Leffler condition and not in general.
- The module version of the injectivity theorem uses the module's own separation, not the ring's.
- For the zero module every pair of orders is adjacent, which is the degenerate case the source records.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.4/adjacency-of-orders`

**API.**

| name | role | statement |
| --- | --- | --- |
| `cycloModuleCompletion` | data | The completion of a polynomial module. |
| `cycloModuleCompletion.module` | structure | Its module structure over the completed ring, with continuous action. |
| `cycloModuleCompletion.map` | functoriality | Functoriality in the module. |
| `cycloModuleCompletion.prod` | compatibility | Compatibility with finite direct sums. |
| `cycloModuleCompletion.exact_of_ML` | characterisation | Exactness under the Mittag-Leffler condition. |
| `cycloModuleCompletion.derivedLimit` | relation | The derived-limit correction in general. |

**Used by.**

- *HC.5, the injectivity extension* — The module form of the theorem is stated for these.
- *HC.6* — The completed modules are part of the exported interface.
- *HabiroRings* — The derived Habiro completion is built on these, and no exactness is assumed here.

**Unit tests.**

- `finite_sum` — The completion of a finite direct sum is the direct sum of the completions.
- `zero_module` — For the zero module every pair of orders is adjacent and the completion is zero.
- `not_exact` — The functor is not exact in general; the derived-limit term is not always zero.
- `module_separation` — The injectivity theorem uses the module’s separation, which can differ from the ring’s.

**Sources.**

- §7.3, p. 1143 of the PDF, The module completion, verbatim.

  > We can define cyclotomic completions also for any Z-module, as follows. Let A be a Z-module, and let A[q] be the module of polynomials in q with coefficients in A. For each S contained in N, let A[q]^S denote the completion A[q]^S = lim_{f in Phi*_S} A[q]/f A[q]. If A is a ring, then this definition of A[q]^S is compatible with the previous one.

- Theorem 7.1, p. 1143 of the PDF, The module form of the injectivity theorem, with adjacency taken over the MODULE, verbatim.

  > Let A be a Z-module, and let S' be contained in S contained in N. Suppose that for each n in S there is a sequence in S' finishing at n of elements adjacent over A. Then the homomorphism rho^A_{S, S'} : A[q]^S -> A[q]^{S'} induced by the identity of A[q] is injective.

### Chinese remainder for a disconnected collection of orders

`HabiroCyclotomicCompletions:HC.5/chinese-remainder-for-disconnected-collections` · *theorem*

When two sets of orders are mutually non-adjacent, so that the corresponding cyclotomic polynomials are comaximal, the completion at their union is the product of the two completions. This is the Chinese remainder theorem in this setting and it needs exactly the comaximality hypothesis of HC.4; without it the two factors interact and the product description fails. Consequently a completion at a disconnected set of orders decomposes into components, one for each connected piece, and properties such as being a domain are properties of the pieces and not of the whole.

**Hypotheses.**

- The two sets are mutually non-adjacent, which by the comaximality lemma means that the cyclotomic polynomials of an order in one and an order in the other generate the unit ideal.
- The decomposition is as topological rings, with the product topology.
- The hypothesis is about the coefficient ring as well, since adjacency is defined over it.

**Proof outline.**

1. State the comaximality hypothesis and deduce the product decomposition for the finite quotients.
2. Pass to the limit and obtain the decomposition of the completions.
3. Deduce the decomposition into connected components for a general set of orders.
4. Record the consequence: a completion at a disconnected set is not a domain even when the coefficient ring is.
5. State the non-example: without comaximality the product description fails, and the injectivity theorems of HC.4 are exactly the statements that replace it in the connected case.

**Acceptance.**

- A completion at a disconnected set is a product over the connected components.
- It is not a domain when there is more than one component, whatever the coefficient ring.
- The decomposition needs comaximality; connectedness of the pieces is not enough by itself.
- In the connected case there is no such decomposition and the injectivity theorems apply instead.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.4/adjacency-of-orders`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`

**Sources.**

- Lemma 4.1(2), p. 1134 of the PDF, The comaximality that makes the decomposition possible, verbatim.

  > If m, n are in N, and n/m is not an integer power of a prime, then we have (Phi_n(q), Phi_m(q)) = (1) in Z[q].

### Inverting a prime changes which orders are adjacent

`HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case` · *comparison*

Adjacency is defined through separatedness of the coefficient ring at a prime, so INVERTING a prime destroys adjacency across that prime: over the integers with a prime inverted, orders whose ratio is a power of that prime are no longer adjacent, and over the rationals no two distinct orders are adjacent at all. The consequences are immediate and are the two worked examples the stage text asks for: over the rationals the evaluation and Taylor maps are not injective, while the map from the integral completion to the rational one IS injective. This node records both and the rule they illustrate: properties of the completion are not inherited from properties of the coefficient ring.

**Hypotheses.**

- The coefficient rings are the rationals and the integers with a prime inverted.
- Separatedness at a prime fails as soon as the prime is invertible, which is why adjacency is lost.
- The injectivity of the map from the integral to the rational completion is a separate statement and is the source's.

**Proof outline.**

1. Compute the adjacency relation over the rationals and over the integers with one prime inverted.
2. Record the source's statement that the analogues of the evaluation and Taylor maps over the rationals are not injective.
3. Record the source's statement that the natural map from the integral completion to the rational one is injective.
4. State the rule: neither being a domain nor connectedness of the completion follows from the corresponding property of the coefficient ring.
5. Record the worked example the stage text asks for, with a prime inverted, and what changes in the adjacency graph.

**Acceptance.**

- Over the rationals no two distinct orders are adjacent.
- Over the rationals the evaluation and Taylor maps are not injective.
- The map from the integral completion to the rational one is injective.
- Properties of the completion are not inherited from the coefficient ring.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.5/chinese-remainder-for-disconnected-collections`, `HabiroCyclotomicCompletions:HC.4/adjacency-of-orders`

**Sources.**

- §1, the introduction, p. 1128 of the PDF, Both statements about the rational case, verbatim.

  > The above-mentioned properties do not hold for a general ring R. For example, the analogues of the homomorphisms ev and sigma_zeta over the rational numbers, are not injective; nevertheless, the natural homomorphism Z[q]^N -> Q[q]^N is injective. For more details, see Section 7.5.

### Restricted root orders are not a localisation

`HabiroCyclotomicCompletions:HC.5/restricted-root-orders-versus-localisation` · *comparison*

Restricting the set of orders is not the same operation as localising the completed ring, and the node makes the difference precise: the restriction map of HC.1 is injective under the connectedness hypothesis and is never surjective in the cases of HC.4, whereas a localisation is by construction surjective onto its image in a different sense and satisfies a universal property that the restriction does not. Naively localising the completed ring does not produce the completion at a smaller set of orders, and this node exhibits where the universal property fails.

**Hypotheses.**

- The restriction is along an inclusion of order sets; the localisation is at a multiplicative set of the completed ring.
- The comparison is of the two universal properties, which is where the difference is visible.
- The failure is exhibited concretely by the non-surjectivity statements of HC.4.

**Proof outline.**

1. State the universal property of the restriction, from HC.1.
2. State the universal property of the localisation.
3. Show that the completion at a smaller set of orders does not satisfy the localisation property, using the non-surjectivity statements.
4. Record the correct statement: the completion at a smaller set receives the restriction, and that is all.
5. Record the rule this exports to the consumer roadmaps, which is that an order-change map is not to be modelled as a localisation.

**Acceptance.**

- The completion at a smaller order set is not a localisation of the larger one.
- The restriction map has its own universal property, stated in HC.1.
- The non-surjectivity statements of HC.4 are what exhibit the difference.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.4/non-surjectivity`, `HabiroCyclotomicCompletions:HC.1/functoriality-in-the-ring-and-in-the-order-set`

**Sources.**

- Proposition 7.4, p. 1144 of the PDF, The statement that makes the difference visible, verbatim.

  > 3. For each non-empty, finite subset S of N, the homomorphism rho^Z_{N, S} is not surjective.

## HC.6 — Interfaces and acceptance examples

What is exported, to whom, and the standard for a claimed element: **a**
**compatible family of quotient classes, not a divergent formal expression**.

Six acceptance computations, chosen so that the finite-precision algorithms,
the difference between a value and a full Taylor series, and the change of
adjacency under inversion are each tested.

Coverage: **source_decomposed**.

Three nodes. The exported interface, listing each object with the node that supplies it and each consumer with what it takes, and stating that no completion functor is assumed exact here, which is why the derived construction belongs to the Habiro-rings roadmap; the acceptance examples, with the standard that an element is a compatible family of quotient classes and not a divergent formal expression; and the comparison with the rational-number-field case, which is the coefficient functoriality of HC.1 and which the source proves injective, with the explicit record that it is not surjective so that results do not transfer back along it.

### What this roadmap exports, and to whom

`HabiroCyclotomicCompletions:HC.6/the-exported-interface` · *comparison*

The interface this roadmap exports consists of the complete topological rings with their projections, the evaluation and Taylor maps, the p-adic substitutions and the completed modules. The number-field roadmap consumes all of them; the Habiro-rings roadmap consumes the ordinary comparison objects and the order-change maps, and builds a derived completion on top using enhanced derived sheaves; the cohomology roadmap then consumes that derived interface. NO completion functor is assumed exact here, which is why the derived version is built elsewhere, and the links to the consumers do not make this roadmap depend on their theorems.

**Hypotheses.**

- The exported objects are those of HC.1 through HC.5; nothing about derived completion is asserted here.
- The consumers are named in the stage text and are recorded as requests, not as dependencies of this roadmap.
- The exactness question is left open on purpose: HC.5 states the derived-limit correction and the derived construction belongs to the Habiro-rings roadmap.

**Proof outline.**

1. List the exported objects with the node that supplies each.
2. Record each consumer and what it takes.
3. State that no exactness is assumed and point at HC.5's correction term.
4. State that the links to consumers are one-directional: this roadmap does not depend on their completed theorems.
5. Record the boundary with the enhanced-derived-sheaves roadmap, which supplies the machinery the derived construction needs.

**Acceptance.**

- Every exported object has a node that supplies it.
- No completion functor is assumed exact.
- The dependency runs from this roadmap to its consumers and not back.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.5/the-completed-module`

**Sources.**

- §7.3, p. 1143 of the PDF, The compatibility of the module and ring constructions that makes a single interface possible, verbatim; the source is careful to say that SOME results generalise, which is the caution this node records as the absence of an exactness assumption.

  > If A is a ring, then this definition of A[q]^S is compatible with the previous one. Some results in the present paper can be generalized to A[q]^S.

### The acceptance examples

`HabiroCyclotomicCompletions:HC.6/the-acceptance-examples` · *comparison*

The layer is accepted when a specific list of computations has been carried out: the integers at the values one and minus one and at a primitive third root; the element given by the polynomial one minus q; the factorial series of Kontsevich; the inverse of the indeterminate; and a coefficient ring with a prime inverted. Each exercises a different part of the development, and the list is chosen so that the finite-precision algorithms, the difference between a value and a full Taylor series, and the change of adjacency under inversion are all tested. Every claimed element must carry a compatible family of quotient classes rather than a divergent formal expression.

**Hypotheses.**

- The examples are over the integers except the last, which is over the integers with a prime inverted.
- A claimed element is accepted only with its compatible family; a formal series that does not converge in the completion's topology is not an element.
- The third-root example is the first where the coefficient ring of the target is larger than the base.

**Proof outline.**

1. List the six examples and the node each exercises.
2. Record the standard for an element: a compatible family of classes, not a formal expression.
3. Record what the value-versus-expansion example tests, namely the difference between the constant term and the whole Taylor series.
4. Record what the inverted-prime example tests, namely that the adjacency graph changes.
5. Record the comparison the stage text asks for at the end: the map from the classical integral completion to the rational-number-field case of the neighbouring roadmap.

**Acceptance.**

- Every example has a node that supplies what it tests.
- A divergent formal expression is not an element.
- The value at a root and the full Taylor expansion at it are different data.
- Inverting a prime changes which restriction maps are injective.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.2/algorithms-on-expansions`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`

**Sources.**

- §1, the introduction, p. 1128 of the PDF, The standing example, verbatim, together with the reason it IS an element: it has a compatible family of quotient classes.

  > the series sum over n >= 0 of (1 - q)(1 - q^2) ... (1 - q^n), which was introduced by Kontsevich, and which can be regarded as an element of Z[q]^N since we have an isomorphism Z[q]^N = lim_n Z[q]/((1 - q) ... (1 - q^n))

### The comparison with the rational-number-field Habiro ring

`HabiroCyclotomicCompletions:HC.6/the-comparison-with-the-number-field-case` · *comparison*

The stage text asks for the map from the classical integral completion to the rational-number-field case of the neighbouring roadmap, which is the Habiro ring of the rationals as it is used in the Nahm-series and number-field developments. This node states the map, records that it is the instance of the coefficient functoriality of HC.1 together with the identification of the two constructions, and records what it does NOT give: the target is a different ring and the map is not surjective, so results proved there do not transfer back without a separate argument.

**Hypotheses.**

- The source of the map is the completion over the integers at all orders; the target is the neighbouring roadmap's ring for the rationals.
- The map is the coefficient functoriality of HC.1 composed with the identification of the two definitions.
- The source's own statement is that the map to the completion over the rationals is injective; surjectivity is not claimed and fails.

**Proof outline.**

1. Construct the map from the coefficient functoriality.
2. Record the identification of the neighbouring roadmap's construction with the one here.
3. Record the source's injectivity statement for the map to the rational completion.
4. State the non-example: the map is not surjective, and a theorem proved over the rationals does not transfer back.
5. Record the two roadmaps that consume this comparison.

**Acceptance.**

- The map exists and is the coefficient functoriality.
- It is injective, by the source's statement.
- It is not surjective, and results do not transfer back along it.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`, `HabiroCyclotomicCompletions:HC.1/functoriality-in-the-ring-and-in-the-order-set`, `HabiroNumberFields:HB.1`

**Sources.**

- §1, the introduction, p. 1128 of the PDF, The injectivity of exactly this comparison, verbatim.

  > nevertheless, the natural homomorphism Z[q]^N -> Q[q]^N is injective

## Gaps

### Three sections of the source were not read in full

Needed by: `HabiroCyclotomicCompletions:HC.1`, `HabiroCyclotomicCompletions:HC.5`.

§3.2 and §3.3, which develop the monic completions further, §7.1 and §7.2, and §7.5, which is where the rational case is treated in detail, were not read; the statements quoted from §7.5 are the ones the introduction repeats. The corresponding proof steps therefore record the strategy rather than the argument, and the rational-case node rests on the introduction's summary. NEXT SOURCE ACTION: read pp. 1131 to 1134 and pp. 1142 to 1146 in full, which is about nine pages, and decompose §7.5 in particular, since HC.5's rational case is currently quoted rather than proved.

### The proofs of the three rigidity theorems were read only in outline

Needed by: `HabiroCyclotomicCompletions:HC.4`.

Theorems 4.1, 5.2 and 6.1 were read as statements, with the opening of the proof of 6.1 and the sketch in Remark 5.1. Their full proofs, and the proof of Proposition 3.1 on which the first rests, were not read, so the proof steps of those nodes record the reductions and the inputs rather than the arguments. NEXT SOURCE ACTION: read the proofs on pp. 1131 to 1141, which is the technical core of the paper.

### The algorithms of HC.2 are the packet's own, not the source's

Needed by: `HabiroCyclotomicCompletions:HC.2`.

Habiro's paper constructs the completion and proves the rigidity theorems; it does not give algorithms for arithmetic on expansions, and the stage text asks for them. The node therefore states algorithms assembled from the normalised expansion and from division with remainder, with congruence correctness theorems that are this packet's own statements rather than quotations. NEXT SOURCE ACTION: none available in the source; the correctness statements should be proved directly, and Tau Ceti's executable arithmetic modulo a monic polynomial is the layer they should be built on.

### The Deligne-style universal property of the completion is stated, not sourced

Needed by: `HabiroCyclotomicCompletions:HC.1`.

The source constructs the completion as an inverse limit and uses its projections; it does not state a universal property for continuous maps into complete separated rings, which the stage text asks for. The node states it as the standard property of a separated completion for a linear topology and cites Tau Ceti's complete separated topological rings as the target category. NEXT SOURCE ACTION: prove it directly from the limit description, or cite the general statement in the topological-algebra roadmap that owns it.

## Requests

- **`HabiroNumberFields:HB.1`** — The Habiro ring of a number field, which consumes the completion, the projections, the evaluation and Taylor maps, the p-adic substitutions and the completed modules exported here, and which HC.6 compares with the classical integral case.

- **`HabiroRings:HR.2`** — The derived Habiro completion, which consumes the ordinary comparison objects and the order-change maps of this roadmap. No completion functor is assumed exact here, which is exactly why the derived construction lives there.

- **`HabiroCohomologyFoundations:HQ.1`** — The consumer of the derived interface; the link is one-directional and this roadmap does not depend on its theorems.

- **`EnhancedDerivedSheaves:E3`** — The enhanced derived machinery that the derived completion of the Habiro-rings roadmap is built with; recorded here because HC.6's interface node names the chain.

- **`ArithmeticQuantumTopology:QT.1`** — The quantum invariants whose values at roots of unity are the evaluations of HC.3 and whose unified invariant is an element of the completion; this is the original motivation the source records.

## Structural proposals

### HC.2's algorithms have no source and should be marked as the roadmap's own

*note-source-boundary*

Every other target of this roadmap is a theorem of Habiro's paper, quoted by number in the stage texts. The coefficient algorithms of HC.2 are not: the paper constructs the completion and proves rigidity, and says nothing about computing with expansions. The stage text should say so, so that a worker does not search the paper for them, and should point at the pinned executable arithmetic modulo a monic polynomial as the layer they are to be built on.

### The separation hypotheses are hypotheses on the coefficient ring, and HC.5 makes them hypotheses on the module

*note-hypothesis-boundary*

Adjacency is defined through separatedness, so every rigidity theorem of HC.4 is a theorem about the coefficient ring as much as about the set of orders; and the source's module version replaces the ring's separation by the module's. The stage texts of HC.4 and HC.5 should say this in the same words, because a reader who carries the ring's hypothesis into the module statement will prove something weaker than the source does.

### HC.4 carries two kinds of theorem

*propose-split*

HC.4 contains three positive rigidity theorems and the negative statements that stop them being read as isomorphisms. The positive ones share a proof strategy and a hypothesis; the negative ones are separate computations. Splitting would let the rigidity half be closed while the non-surjectivity half is still being written, and would make the stage text's warning — that injective Taylor maps are never isomorphisms — the subject of a layer rather than a sentence. The five nodes divide four to one.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming
proposal whose proofs are all `sorry`, and nothing here is claimed to be
formalised.

Three excerpts ran past four hundred characters and were elided at a word
boundary; the locators name the printed pages so the full text can be read.
