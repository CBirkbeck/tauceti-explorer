# HabiroCohomologyFoundations — HQ.1 to HQ.7

Part one of two for *q-Hodge filtrations and Habiro cohomology*: the global q-de
Rham complex and its derived form, q-Hodge filtrations and the q-Hodge complex,
Habiro descent to the Habiro ring, the positive-degree q-de Rham–Witt theory with
its Nygaard filtration, the two existence theorems and the trace-theoretic import,
the algebraic-against-analytic boundary, and the acceptance suite. HQ.8, the
comparison atlas, is the companion part and is out of scope here.

This document is definitive; the packet
`research/blueprint/packets/HabiroCohomologyFoundations--HQ.1.json` is its machine
form, and the suggested Lean file is a naming proposal, not an implementation.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The sources

Three papers by one author, all taken as LaTeX from the arXiv e-print endpoint.
The hashes are of the gzipped files that endpoint returns.

> Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*. arXiv:2510.04782v2, LaTeX source. Statements are numbered by a single counter per section, shared by the numbered paragraphs and the theorem environments, with lettered appendix sections; that is the numbering the stage texts use, and it is confirmed by the cross-references in the author's companion papers.
> <https://arxiv.org/abs/2510.04782>, SHA-256 `9c338455871808eb2265681199279607b4b179b3973752d48eca3f711bc25b47`, accessed 2026-09-25.

- Downloaded from the arXiv e-print endpoint as LaTeX source; the hash recorded is of the gzipped file the endpoint returns. Quotations are from that source with the mathematics written out in words.
- Section 1, the introduction: the two questions, the introductory definition of a q-Hodge filtration with its four clauses, the two remarks on the smooth case and on the independence of the p-completed rational clause, the coordinate description of the q-Hodge complex and the no-go result it quotes, the descent theorem in its introductory form, the smooth existence theorem, the paragraph on algebraic Habiro cohomology, the three recorded differences between the algebraic and the analytic theories, the quasi-regular existence theorems, the paragraph on uniqueness, and the notation paragraph in full.
- Section 3 in full as statements: the quotient convention, the definition of a q-Hodge filtration with all its coherence data, the no-go lemma with its proof sketch, the q-Hodge complex and the remark on completions, the symmetric monoidality proposition with its proof, the conjugate filtration and the abstract graded lemma with their proofs, the descent theorem with its proof outline, the coordinate example, the etale corollary with its proof, the twisted q-de Rham complexes with their construction and fracture square, the transition maps and the two remarks on why the naive limit fails, the deformation proposition, the Nygaard subsection as statements with the construction of the filtration, the Hodge-against-Nygaard lemma and the smooth animation corollary, the twisted q-Hodge filtration p-adically and globally with the monoidality paragraphs and the two compatibility lemmas, the partial descents with the denominator lemma, the Habiro-Hodge complex and its monoidality, the decalage proposition and the two remarks on q-de Rham descent, and the multiplicative upgrades with the cohomology corollary.
- Section 4 in full as statements: the truncation lemma, the two paragraphs constructing the canonical smooth filtration, the framed and fixed-point remarks, the two lemmas verifying the construction, the functoriality paragraph with its pushout and comparison lemmas, the smooth existence theorem, the monoidality paragraph with the sub-operad, the truncated completion lemma, the lax-versus-oplax paragraph, the cartesian-lift lemma and the operadic corollary, the rings-of-interest paragraph, the staticity lemma with its two remarks, the naive construction with its argument for the filtered map, the well-behavedness theorem with the Burklund remark and the two examples, the injectivity and flat base change lemmas, the global construction, the quasi-regular section theorem with its two remarks, and the monoidality paragraph with its lemma and corollary.
- Appendix A in full as statements: the global theorem with its four clauses and base change, the derived commutative remark, the implicit completion convention, the rationalised q-crystalline lemma, the two technical divided power lemmas and the reverse remark, the paragraph on the framed comparison, the framed lemma and the compatibility lemma, the paragraph carrying the bound uniform in the prime, the construction of the global complex, the derived commutative lift and the derived global complex.
- Appendix B: the definition of Habiro-complete spectra by killing an idempotent, the four-part characterisation, the derived Nakayama lemma and its corollary, and the remark on which families of polynomials may be used; the solid condensed subsection was read only at the level of its final statement.
- NOT read: the proofs in section 3 of the Nygaard lemmas, of the two compatibility lemmas for the twisted filtration, of the partial descent proposition and of the monoidality lemma; the proofs in section 4 of the truncation lemma, of the pushout and comparison lemmas, of the well-behavedness theorem, and of the cartesian-lift lemma; the proofs of the appendix lemmas. In each case the node records the strategy the source states, not a verified line-by-line reading.

> Ferdinand Wagner, *q-Witt vectors*. arXiv:2410.23078v5, LaTeX source, with the same per-section numbering convention as the companion paper.
> <https://arxiv.org/abs/2410.23078>, SHA-256 `800822a7f26d26d2cb9011e404674ee3256e1f1a95418ac3580ae385dd906f87`, accessed 2026-09-25.

- Downloaded from the arXiv e-print endpoint as LaTeX source; the hash is of the gzipped file the endpoint returns.
- Section 2: the paragraph explaining that the usual restriction maps do not extend, with its proof and its consequence for the untruncated limit; the corollary on p-torsion and the lemma on joint injectivity of the ghost maps.
- Section 3 as statements: the definitions of q-V-systems, q-FV-systems and the torsion-free variant with all their axioms, the two lemmas on the interaction of the differential with the Verschiebung and on the V-divided-power property, the paragraph explaining the absence of restrictions and why Langer and Zink's universal property survives their deletion, the existence proposition and the definition of the q-de Rham-Witt complex, the ghost map paragraph with its Verschiebung formula, the relative base change lemma, the Frobenius proposition, the remark producing the comparison with ordinary de Rham-Witt complexes, the etale base change proposition, the etale sheaf corollary and the localisation corollary.
- Section 4 as statements: the torsion-freeness proposition for smooth inputs, the p-completion proposition in both its forms, the main theorem identifying the cohomology of the coordinate-dependent q-Hodge complex, and the arithmetic fracture square corollary.
- Section 5: the no-go theorem with its exact hypotheses, the paragraph defining the q-de Rham-Witt filtration by animating the Postnikov filtration, and the technical lemma it uses.
- NOT read: section 1, section 2 apart from the statements listed, and every proof in sections 3 to 5. The nodes state the results and record the source's own account of the arguments.

> Ferdinand Wagner, *ku and q-de Rham cohomology*. arXiv:2510.06057v1, LaTeX source, with the same per-section numbering convention as the companion papers.
> <https://arxiv.org/abs/2510.06057>, SHA-256 `9a23a2b000b8eef7075efba59a1246edad4df06ab079534dd170ae3203419227`, accessed 2026-09-25.

- Downloaded from the arXiv e-print endpoint as LaTeX source; the hash is of the gzipped file the endpoint returns.
- Section 1: the main theorem in its introductory form, the paragraphs on the one-disc version, on the prime two and on whether lifts over connective complex K-theory suffice, with the counterexample given there; the paragraph relating the results to the companion paper on Habiro descent.
- Section 3: the assumptions on the base and on the input, in full, with the remark motivating the one-disc condition.
- Section 4: the assumptions paragraph for the global case with its addendum at the prime two, the theorem giving the explicit description of the filtration in the quasi-regular case, and the global comparison theorem.
- Section 6: the corollary computing the Habiro ring of a number field from periodic complex K-theory.
- NOT read: section 2 on the solid even filtration, the rest of section 3 on solid topological Hochschild homology, section 5 on genuine equivariant Habiro descent, the appendices, and every proof. This roadmap imports the trace-theoretic construction rather than owning it.

**The numbering is the stage texts' numbering.** The source runs one counter per
section, shared by its numbered paragraphs and its theorem environments alike, and
letters its appendix sections. Counted that way every citation in the stage texts
lands on the statement it describes, and the cross-references in the companion
papers confirm it: the paper on connective complex K-theory cites Definition 3.2
for q-Hodge filtrations, Theorem 3.11 for the descent and Example 4.24 for the
counterexample, which are exactly the statements those numbers name here.

**Not obtained**: the author's 2026 thesis, the joint manuscript with Meyer cited
for the elementary proof of the higher-powers case, and any written source for the
analytic Habiro stack, which the paper attributes to a lecture series.

There is **no integrated decomposition** for this roadmap, and no unreviewed
external draft.

## What the pinned libraries have

The reviewed audit gives HQ.1 the verdict *partly built*, HQ.7 *process*, and
every other layer in scope *not built*. What is actually there is the elementary
q-integer layer and a handful of ancestors:

| what exists | where | what it is not |
| --- | --- | --- |
| `geom_sum_mul`, `Polynomial.eval_geom_sum` | `Mathlib/Algebra/Ring/GeomSum.lean` | there is no named `[n]_q`, and no q-difference operator |
| `Polynomial.cyclotomic_prime`, `cyclotomic_prime_pow_eq_geom_sum`, `eval_one_cyclotomic_prime` | `Mathlib/RingTheory/Polynomial/Cyclotomic/` | the prism `(ℤ_p[[q−1]], [p]_q)` does not exist |
| `Ideal.Filtration`, `CategoryTheory.FilteredObject` | `Mathlib/RingTheory/Filtration.lean`, `Mathlib/CategoryTheory/Filtration/Basic.lean` | underived; no associated graded, completion or Day convolution |
| `WittVector.frobenius`, `verschiebung`, `ghostMap`, `TruncatedWittVector` | `Mathlib/RingTheory/WittVector/` | degree zero and p-typical only, **and they carry restrictions** |
| `RingTheory.Sequence.IsRegular`, `Algebra.Etale`, `Algebra.Smooth`, `KaehlerDifferential` | `Mathlib/RingTheory/` | no Koszul-regularity, no de Rham complex, no derived de Rham |
| `CategoryTheory.Tor`, `Condensed` | `Mathlib/CategoryTheory/Monoidal/Tor.lean`, `Mathlib/Condensed/Basic.lean` | no derived tensor product of animated rings, no solid or analytic rings |

A thorough search of Tau Ceti's seventy thousand declarations for Λ-rings,
δ-rings, prisms, Habiro rings, q-Witt vectors, Nygaard filtrations and q-de Rham
objects returns **nothing**. Twenty baseline declarations are cited, all as the
ancestors of what has to be built; thirteen node prerequisites resolve to them.

## The restructuring proposal is not accepted

`research/blueprint/restructure/RS-10.result.json` would narrow HQ.1 and HQ.4 and
move the positive-degree q-de Rham–Witt theory to a draft roadmap on q-Witt
vectors. Its recorded review asks for changes: seven existing atlas edges would
have to be removed, sixty-five supplier links are missing, and three of its target
roadmaps — among them the q-Witt one and the analytic Habiro stack — are not in
the atlas at all. This packet therefore **works with the current structure**, as
the job instruction directs, and says so here and in a structural note.

## HQ.1 — q-differentials and coordinate comparisons

**The local calculation is imported.** The q-crystalline site, the framed
q-difference complex with `D_q(x^n) = [n]_q x^(n−1)`, the twisted Leibniz rule,
`d∘d = 0`, change of framing and the p-complete comparison with prismatic
cohomology all belong to `PrismaticCohomology:PR.6`. **The prism ideal is**
**`([p]_q)`, not `(q−1)`.** The q-integer identities are already in Mathlib and
are cited as baseline, not planned.

**What is owned is Appendix A's gluing**, and it is not formal. The global
complex is a pullback of the product of all p-completions against rational de
Rham data; for the right-hand map to exist one needs a denominator bound
**uniform in the prime** — `N_n = ∏_{ℓ≤n} ℓ^(2(ℓ^(n−1)+⋯+1))` — which comes from
an estimate on iterated divided powers in the q-PD envelope.

Coordinatewise formulas are computation tools inside a chart. Framing
independence is a **theorem**, proved by a compatibility square between the
explicit Koszul isomorphism and the coordinate-free one.

Coverage: **source_decomposed**.

Eight nodes. The division of labour with the prismatic roadmap, which owns the local q-crystalline site, the framed complex and the p-complete comparison over the q-de Rham prism whose ideal is generated by the p-th q-integer; then the appendix's gluing in full: the coordinate-free rationalised q-crystalline comparison, the two denominator estimates for the delta-map, the q-divided power and the iterated ordinary divided power, the bound uniform in the prime that makes the product over all primes converge, the framed comparison with the logarithmic formula for the partial q-derivative and its compatibility square, the global complex as a pullback, its four properties with base change, and its lift to a derived commutative algebra through cosimplicial divided-power realisations.

### The local q-crystalline calculation is imported; only the global gluing is owned

`HabiroCohomologyFoundations:HQ.1/what-this-layer-imports-and-what-it-owns` · *comparison*

The local theory of the q-de Rham complex at a single prime is not constructed here. For a prime p, a p-completely smooth algebra S over the p-completion of the base with a p-completely etale framing, the q-crystalline cohomology of S relative to the q-PD pair given by the power series ring in q-1 over that completion is computed by the coordinate-dependent q-difference complex, whose differential sends the n-th power of a coordinate to the q-integer [n]_q times its (n-1)-st power times the differential of the coordinate, obeys the twisted Leibniz rule and squares to zero; and its p-completion is prismatic cohomology relative to the q-de Rham prism whose ideal is generated by [p]_q. All of this is the prismatic roadmap's, and is imported. What this layer owns is the gluing of those p-complete objects with rational de Rham data into one global object over the power series ring in q-1, together with the comparisons that make the gluing well posed. The prism ideal is generated by [p]_q and not by q-1: modulo p the two differ, and using q-1 would make the p-complete comparison false.

**Hypotheses.**

- A is a Lambda-ring that is p-torsion free for every prime p.
- For each prime p the local q-crystalline site, its q-PD envelopes and the coordinate-dependent complex are supplied by PrismaticCohomology:PR.6 and are not re-derived here.
- The q-integer [n]_q is the geometric sum of the first n powers of q; its identities are already in the pinned Mathlib and are cited as baseline, not planned.

**Proof outline.**

1. List the local inputs that the prismatic roadmap supplies and that this layer consumes verbatim: the q-crystalline site, the q-PD envelope, the framed complex, change of framing, the cocycle identities for a cover by framed charts, and the p-complete identification with prismatic cohomology over the q-de Rham prism.
2. Record the interface checks on the q-integers as baseline citations: the identity that [n]_q times (q-1) is q^n-1, the value n of [n]_q at q=1, the identification of [p]_q with the p-th cyclotomic polynomial for p prime, and the identification of [p^k]_q with the cyclotomic polynomial of order p^(k+1) evaluated at q.
3. Record the prism ideal explicitly: the q-de Rham prism is the p-complete power series ring in q-1 over the p-completion of A together with the ideal generated by [p]_q.
4. State, as the boundary of this layer, that coordinatewise formulas are computation tools inside a chart and are never a globally canonical definition; the global object is defined by the pullback square of the next nodes.

**Acceptance.**

- A reader can point to each local statement this layer uses and name the roadmap stage that owns it.
- No node of this packet re-proves a statement about the local q-crystalline site or the framed complex.
- The four q-integer identities are cited from the pinned Mathlib by name and module.

**Prerequisites.** `PrismaticCohomology:PR.6`, `HabiroRings:HR.1/perfectly-covered`, `mathlib:geom_sum_mul`, `mathlib:Polynomial.eval_geom_sum`, `mathlib:Polynomial.cyclotomic_prime`, `mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum`, `mathlib:Polynomial.eval_one_cyclotomic_prime`

**Sources.**

- Appendix A, opening, The division of labour: the p-complete theory is Bhatt-Scholze's and is imported; the appendix, and therefore this layer, is about the global case.

  > In [Prismatic, section 16], Bhatt and Scholze construct a functorial (p,q-1)-complete q-de Rham complex relative to any q-PD pair. This verifies Scholze's conjecture after p-completion, but leaves open the global case.

- Theorem A.1(b), Names the prism and its ideal; this is the statement whose ideal is [p]_q rather than q-1.

  > For all primes p, the p-completion of the q-de Rham complex agrees with prismatic cohomology relative to the q-de Rham prism given by the p-completed power series ring in q-1 over A together with the ideal generated by [p]_q.

### After rationalisation, derived q-de Rham cohomology is a base change of derived de Rham cohomology

`HabiroCohomologyFoundations:HQ.1/rationalised-q-crystalline-comparison` · *theorem*

Fix a prime p and let A be a Lambda-ring that is p-torsion free. For every p-complete animated algebra R over the p-completion of A there is an equivalence, functorial in R, of E-infinity algebras over the power series ring in q-1 with coefficients in the rationalisation of the p-completion of A, between the (q-1)-completed rationalisation of the derived q-de Rham complex of R and the power series ring in q-1 over the rationalisation of the derived de Rham complex of R. The equivalence is constructed coordinate-freely, from the definition of the q-de Rham complex by q-crystalline cohomology, and not by choosing a framing.

**Hypotheses.**

- R is a p-complete animated algebra over the p-completion of A.
- All q-de Rham and de Rham complexes relative to a p-complete ring are implicitly p-completed.
- Rationalisation means the derived tensor product with the rationals, and the result is then completed at q-1.

**Proof outline.**

1. Reduce to the case of a surjection onto R from a p-completely ind-smooth algebra P with a p-completely ind-etale framing, so that the q-crystalline and crystalline cohomologies are computed by the q-PD and PD envelopes of the kernel.
2. On the envelopes, extend the delta-structure to the (q-1)-completed rationalisation, where p and [p]_q are invertible, and compare the divided power gamma, which sends x to its p-th power divided by p, with the q-divided power gamma_q, which sends x to its Frobenius divided by [p]_q, minus its delta.
3. Prove the denominator estimates of the next node, which show that each iterated divided power of an element of the ideal lands in the other envelope after inverting a bounded power of p.
4. Deduce that the unique continuous extension of the structure map exists in both directions, and that the two extensions are mutually inverse after (q-1)-completed rationalisation.
5. Check that the comparison is functorial and compatible with the identification modulo q-1.

**Acceptance.**

- The equivalence is stated without reference to a framing.
- Its reduction modulo q-1 is the identity on the rationalised derived de Rham complex.
- The proof cites the denominator estimates and does not assume that the divided powers of one envelope lie in the other without them.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/what-this-layer-imports-and-what-it-owns`, `PrismaticCohomology:PR.6`, `DerivedDeRhamCohomology:DD.2`

**Sources.**

- Lemma A.4, The statement of the node, in the source's own terms.

  > For all p-complete animated algebras R over the p-completion of A there is a functorial equivalence of E-infinity algebras over the power series ring in q-1 with rational coefficients between the (q-1)-completed rationalisation of the derived q-de Rham complex and the power series ring in q-1 over the rationalised derived de Rham complex.

- Appendix A, subsection on rationalised q-crystalline cohomology, Why the coordinate-free proof is needed and not merely the framed one; this is the hypothesis-level point the node records.

  > In coordinates, such an equivalence was already constructed in [Toulouse, Lemma 4.1], but here we need a different argument: We want a coordinate-independent equivalence, so we have to work with the definition of the q-de Rham complex via q-crystalline cohomology.

### Denominator estimates for delta, for the q-divided power, and for iterated divided powers

`HabiroCohomologyFoundations:HQ.1/divided-power-denominators-in-the-q-pd-envelope` · *lemma*

Let qD be the q-PD envelope of the kernel of a surjection onto R from an ind-smooth algebra with a chosen framing, and work in its (q-1)-completed rationalisation. First: for all n at least 1 and all alpha at least 1, delta carries the submodule of (q-1)^n-multiples of qD into itself, and carries p^(-alpha) times that submodule into p^(-(p alpha + 1)) times it; the q-divided power gamma_q carries the (q-1)^n-multiples into the (q-1)^(n+1)-multiples, and p^(-alpha) times the former into p^(-(p alpha + 1)) times the latter. Second: for x in the ideal and every n at least 1, the n-fold iterate of the ordinary divided power gamma can be written, in the rationalisation of qD, as a sum of an element of qD admitting q-divided powers and of n terms, the i-th of which is p^(-2(p^(i-1) + ... + p + 1)) times (q-1)^(p-2+i) times an element of qD. The mirror statement, with the roles of the two envelopes exchanged, holds with an infinite sum of terms of the same shape.

**Hypotheses.**

- The delta-structure on the ind-smooth algebra is the one determined by sending each framing coordinate to zero, extended uniquely along the formally etale structure map.
- p and [p]_q are invertible after rationalisation, so both gamma and gamma_q are defined on the rationalisation.
- The estimates are on denominators only; no claim is made that the iterated divided powers lie in the envelope itself.

**Proof outline.**

1. Write [p]_q as p times a unit congruent to 1 modulo q-1, plus (q-1)^(p-1); this is the identity that converts a p in a denominator into a (q-1)^(p-1).
2. For delta and gamma_q, argue on the defining formulas: delta of a sum and of a product introduce at most one extra factor of p in the denominator and raise the exponent of p in the numerator by p.
3. For gamma_q, use the identity above to see that dividing by [p]_q raises the (q-1)-adic order by one at the cost of the stated power of p.
4. For the iterated gamma, induct on n: the inductive step checks that the three operations gamma, multiplication by the unit minus one applied to delta, and p^(-1)(q-1)^(p-1) delta all preserve expressions of the stated shape.
5. For the mirror statement, expand p divided by [p]_q as a convergent series in p^(-i)(q-1)^((p-1)i) and check that multiplication by it preserves the shape.

**Acceptance.**

- Every exponent in the statement is the source's, in particular the exponent 2(p^(i-1)+...+1) of p and the exponent (p-2)+i of q-1.
- The statement is about the rationalisation; nothing is claimed inside qD itself except for the leading term.
- A reader can see which estimate is used for which direction of the comparison.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/rationalised-q-crystalline-comparison`

**Sources.**

- Lemma A.5, The first half of the node, verbatim in words.

  > For all n at least 1 and all alpha at least 1, the map delta sends (q-1)^n times qD into itself, and p^(-alpha)(q-1)^n times qD into p^(-(p alpha+1))(q-1)^n times qD. For all n at least 1 and all alpha at least 1, the map gamma_q sends (q-1)^n times qD into (q-1)^(n+1) times qD, and p^(-alpha)(q-1)^n times qD into p^(-(p alpha+1))(q-1)^(n+1) times qD.

- Lemma A.6, The second half, with the exact exponents.

  > Let x be in the ideal J. For every n at least 1, there are elements y_0, ..., y_n of qD such that y_0 admits q-divided powers in qD and the n-fold iterate of gamma applied to x equals y_0 plus the sum over i from 1 to n of p^(-2(p^(i-1)+...+p+1)) times (q-1)^((p-2)+i) times y_i, in the rationalisation of qD.

- Remark A.7, The mirror statement, which the node records as the reverse direction.

  > There's also an analogue of Lemma A.6 with the roles of D and qD reversed. For every x in J and n at least 1, there's an infinite sequence of elements of D such that y_0 admits divided powers and the n-fold iterate of gamma_q is the same kind of sum.

### One denominator that works for every prime at once

`HabiroCohomologyFoundations:HQ.1/a-denominator-bound-uniform-in-the-prime` · *theorem*

For a positive integer n let N_n be the product over the primes l at most n of l raised to 2(l^(n-1) + ... + l + 1). Then for every prime p and every animated algebra R over A, the canonical map from the p-completed derived de Rham complex of the p-completion of R into the reduction modulo (q-1)^n of the rationalised derived q-de Rham complex already factors through the submodule of N_n-inverted, but not further denominator-inverted, elements: that is, through N_n^(-1) times the derived q-de Rham complex modulo (q-1)^n. The bound N_n does not depend on p. Taking the product over all primes and the limit over n therefore produces an equivalence between the power series ring in q-1 over the rationalisation of the product over all primes of the p-completed derived de Rham complexes and the (q-1)-completed rationalisation of the product over all primes of the p-completed derived q-de Rham complexes, compatible with the comparison of the previous node prime by prime.

**Hypotheses.**

- R is an animated algebra over A; the products are over all primes p, and for each the complexes are relative to the p-completion of A.
- The factorisation is what makes the infinite product of the local comparisons converge; without a bound uniform in p the product of the local equivalences does not define a map.

**Proof outline.**

1. Apply the iterated divided power expansion of the previous node with the given n; the denominators that appear for the prime p are p raised to 2(p^(i-1)+...+1) for i at most n, and vanish for p greater than n because the relevant powers of q-1 already exceed n.
2. Conclude that N_n clears every denominator, whatever the implicit prime p was.
3. Build the canonical maps from the p-completed derived de Rham complex to N_n^(-1) times the derived q-de Rham complex modulo (q-1)^n for every animated R and every n.
4. Take the product over all primes and the limit over n to obtain the displayed map between the two products.
5. Check that the map is an equivalence by reducing modulo q-1, where it becomes the identity.

**Acceptance.**

- The bound N_n is written out and is visibly independent of p.
- The argument for why primes larger than n contribute nothing is recorded.
- The resulting map is checked to be an equivalence modulo q-1 and not asserted to be one before that check.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/divided-power-denominators-in-the-q-pd-envelope`, `HabiroCohomologyFoundations:HQ.1/rationalised-q-crystalline-comparison`

**Sources.**

- Appendix A, paragraph A.11, The definition of the bound and the assertion that it is uniform in p, which is the content of the node.

  > Fix n and put N_n equal to the product over all primes l at most n of l raised to 2(l^(n-1) + ... + l + 1). ... But in fact, Lemma A.6 shows that this extension already factors through N_n^(-1) qD/(q-1)^n, no matter how our implicit prime p is chosen.

- Appendix A, paragraph A.11, end, How the bound is used and how the resulting map is verified.

  > Taking the product over all p and the limit over all n allows us to construct a map ... This map is an equivalence as indicated, as one immediately checks modulo q-1.

### The framed comparison, and its compatibility with the coordinate-free one

`HabiroCohomologyFoundations:HQ.1/the-coordinate-comparison-and-its-compatibility` · *comparison*

Suppose S is a p-completely smooth algebra over the p-completion of A with a p-completely etale framing in d coordinates. After rationalisation the partial q-derivative in the i-th coordinate equals an invertible operator, namely log(q)/(q-1) plus a sum over n at least 2 of log(q)^n/(n!(q-1)) times the (n-1)-st divided power of the i-th partial derivative applied to the i-th coordinate, composed with the ordinary partial derivative in that coordinate. Because the first factor is an invertible automorphism, and because Koszul complexes of commuting endomorphisms are isomorphic after multiplying each endomorphism by a commuting automorphism, one obtains an explicit isomorphism between the (q-1)-completed rationalisation of the framed q-de Rham complex and the power series ring in q-1 over the rationalised de Rham complex. The same construction applies to the PD and q-PD de Rham complexes of a surjection from an ind-smooth algebra with an ind-etale framing. The square formed by this explicit isomorphism, the coordinate-free comparison, and the two quasi-isomorphisms identifying q-crystalline and crystalline cohomology with the framed complexes commutes.

**Hypotheses.**

- The framing is p-completely etale; the automorphism used in the Koszul argument need not commute with the endomorphism it multiplies in the same index, only with those in the other indices.
- log(q) is the usual Taylor series of the logarithm around q = 1 and is used only after rationalisation and (q-1)-completion.

**Proof outline.**

1. Record the formula expressing the partial q-derivative in terms of the ordinary partial derivative and identify the first factor as an invertible automorphism after rationalisation.
2. Apply the general fact about Koszul complexes of commuting endomorphisms twisted by commuting automorphisms to obtain the explicit isomorphism of complexes.
3. Repeat the construction for the PD and q-PD de Rham complexes attached to a surjection from an ind-smooth framed algebra.
4. Compare with the coordinate-free equivalence by checking commutativity of the square whose vertical arrows are the two quasi-isomorphisms with q-crystalline and crystalline cohomology.
5. Conclude that framing independence of the global object follows from the coordinate-free side, while explicit computations may be carried out in a chart.

**Acceptance.**

- The formula for the partial q-derivative is recorded with its coefficients.
- The Koszul argument is stated with the exact commutation hypotheses, including the explicit warning that the automorphism need not commute with the endomorphism of the same index.
- The compatibility square is recorded as a statement to be proved, not assumed.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/rationalised-q-crystalline-comparison`, `PrismaticCohomology:PR.6`

**Sources.**

- Appendix A, paragraph A.8, The construction of the framed comparison and the exact commutation hypotheses of the Koszul argument.

  > One first observes that, after rationalisation, the partial q-derivatives can be computed in terms of the usual partial derivative via the formula ... Noticing that the first factor is an invertible automorphism, one can then appeal to the following general fact: if M is an abelian group together with commuting endomorphisms and commuting automorphisms such that each automorphism commutes ...

- Lemma A.10, The compatibility statement of the node.

  > The square whose horizontal arrows are the coordinate-free comparison and the explicit isomorphism, and whose vertical arrows are the quasi-isomorphism of q-crystalline cohomology with the q-PD de Rham complex and the usual quasi-isomorphism between crystalline cohomology and PD de Rham complexes, commutes.

### The global q-de Rham complex, as a pullback of p-completions and rational de Rham data

`HabiroCohomologyFoundations:HQ.1/the-global-q-de-rham-complex` · *construction* · planet **Global q-de Rham complex**

Let A be a Lambda-ring that is p-torsion free for every prime p and let S be a smooth A-algebra. The global q-de Rham complex of S over A is defined as the pullback of the diagram whose upper right corner is the product over all primes p of the p-complete q-de Rham complexes of the p-completions of S over the p-completions of A, whose lower left corner is the power series ring in q-1 over the rationalisation of the ordinary de Rham complex of S over A, and whose lower right corner is the power series ring in q-1 over the rationalisation of the product over all primes of the p-completed de Rham complexes; the right-hand vertical map is the equivalence of the uniform-bound node. This is a (q-1)-complete E-infinity algebra over the power series ring in q-1 over A, and it is functorial in S.

**Hypotheses.**

- A is p-torsion free for every prime p; this is what makes the arithmetic fracture square available.
- The right-hand vertical map is the one produced by the uniform denominator bound, not an arbitrary choice of comparison.
- No global q-crystalline site is constructed; the object is defined by the pullback.

**Proof outline.**

1. Form the three corners: the product of the p-complete local complexes, the rational de Rham side, and the common rationalised product.
2. Supply the right-hand vertical map from the uniform denominator bound node.
3. Supply the lower horizontal map by rationalising the canonical map from the de Rham complex of S to the product of its p-completions.
4. Take the pullback in (q-1)-complete E-infinity algebras over the power series ring in q-1 over A.
5. Check functoriality in S: each corner is functorial and the two maps are natural.

**Acceptance.**

- The construction names all three corners and both maps of the square.
- The definition uses the uniform bound node and would not typecheck without it.
- Nothing in the construction refers to a choice of framing.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/a-denominator-bound-uniform-in-the-prime`, `HabiroCohomologyFoundations:HQ.1/the-coordinate-comparison-and-its-compatibility`

**API.**

| name | role | statement |
| --- | --- | --- |
| `q-de-rham-complex` | constructor | For a Lambda-ring A that is p-torsion free for all p and a smooth A-algebra S, an object qOmega of S over A in (q-1)-complete E-infinity algebras over the power series ring in q-1 over A. |
| `fracture-square` | characterisation | The defining pullback square, with its four corners and the two maps named, as the characterisation of the object. |
| `p-completion` | projection | For each prime p, the projection from qOmega to the p-complete q-de Rham complex of the p-completion of S. |
| `rationalisation` | projection | The map from qOmega to the power series ring in q-1 over the rationalised de Rham complex. |
| `functoriality` | functoriality | The assignment of qOmega to S is a functor from smooth A-algebras to (q-1)-complete E-infinity algebras over the power series ring in q-1 over A. |
| `base-change` | compatibility | For a map of Lambda-rings from A to A' with A' also p-torsion free for all p, a canonical equivalence from the (q-1)-completed base change of qOmega along A to A' to the q-de Rham complex of the base-changed algebra. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.2* — Its animation is the derived q-de Rham complex, the object every q-Hodge filtration filters.
- *HabiroCohomologyFoundations:HQ.4* — Its decalage twists and Frobenius glueings are the twisted q-de Rham complexes.
- *HabiroCohomologyFoundations:HQ.8* — It is one side of every square in the comparison atlas.

**Unit tests.**

- `recovers-the-de-rham-complex` — The quotient of qOmega by q-1 is the ordinary de Rham complex of S over A; in particular for S the polynomial ring in one variable over the integers it is the two-term complex of that ring and its module of differentials.
- `degenerate-base` — If A is a ring in which every prime is invertible, so that the upper right corner of the square vanishes, qOmega is the power series ring in q-1 over the rationalised de Rham complex, the trivial q-deformation.
- `agreement-with-the-framed-model` — For a framed smooth S, the underlying object of qOmega is the coordinate-dependent q-difference complex of that framing; a construction that failed to see the framed model would fail this.
- `not-the-naive-product` — qOmega is not the product over all primes of the p-complete complexes: the pullback keeps the rational de Rham data, and a definition that forgot the lower left corner would already differ for S the polynomial ring in one variable.

**Sources.**

- Construction A.12, The construction, verbatim in words.

  > For all smooth A-algebras S, we construct the q-de Rham complex of S over A as the pullback of the square whose upper right corner is the product over all primes of the p-complete q-de Rham complexes, whose lower left corner is the power series ring in q-1 over the rationalised de Rham complex, and whose lower right corner is the power series ring in q-1 over the rationalised product of ...

### The four properties of the global q-de Rham complex, and base change

`HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies` · *theorem* · planet **Properties of the global q-de Rham complex**

Let A be a Lambda-ring that is p-torsion free for all primes p. The functor of the previous node, from smooth A-algebras to (q-1)-complete E-infinity algebras over the power series ring in q-1 over A, satisfies: (a) its quotient by q-1 is the ordinary de Rham complex functor, so it is a q-deformation of it; (b) for every prime p its p-completion is prismatic cohomology of the p-adic Frobenius twist of the algebra, with a p-th root of unity adjoined, relative to the q-de Rham prism whose ideal is generated by [p]_q; (c) after rationalisation and (q-1)-completion it is the trivial q-deformation, namely the power series ring in q-1 over the rationalised de Rham complex; (d) for every framed smooth algebra its underlying object is the coordinate-dependent q-difference complex of that framing. Moreover, for a map of Lambda-rings from A to A' with A' also p-torsion free for all p, the (q-1)-completed base change along it is the q-de Rham complex over A', and modulo q-1 this reduces to the usual base change of the de Rham complex.

**Hypotheses.**

- A and A' are p-torsion free for all primes p.
- In (b) the Frobenius twist is the p-completed base change along the p-th Adams operation.
- Property (d) identifies the underlying object only; it is not a claim that the framed model is canonical.

**Proof outline.**

1. Property (a): reduce the defining square modulo q-1; the upper right corner becomes the product of the p-completed de Rham complexes and the lower left the rationalised de Rham complex, and their pullback is the de Rham complex by the arithmetic fracture square.
2. Property (b): the p-completion of the pullback is the upper right factor at p, which is the imported local identification with prismatic cohomology over the q-de Rham prism.
3. Property (c): the rationalised (q-1)-completion of the pullback is its lower left corner, by construction of the right-hand vertical map.
4. Property (d): combine the imported identification of q-crystalline cohomology with the framed complex at each prime with the framed comparison node, and use the compatibility square to see that the resulting identification is the one coming from the pullback.
5. Base change: check it on each of the three corners, using base change for the local prismatic theory and for the de Rham complex, and conclude by functoriality of pullbacks.

**Acceptance.**

- Each of the four properties is checked against the defining square rather than assumed.
- Property (b) names [p]_q as the prism ideal.
- The base change statement carries its (q-1)-completion.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/the-global-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/what-this-layer-imports-and-what-it-owns`

**Sources.**

- Theorem A.1, The four properties of the node, in the source's order.

  > There exists a functor from smooth A-algebras to (q-1)-complete E-infinity algebras over the power series ring in q-1 over A such that: its quotient by q-1 is the usual de Rham complex functor; for all primes p its p-completion agrees with prismatic cohomology relative to the q-de Rham prism; after rationalisation it becomes the trivial q-deformation; and for every framed smooth algebra ...

- Theorem A.1, final paragraph, The base change clause and its reduction modulo q-1.

  > Moreover, if A maps to A' as Lambda-rings, with A' also p-torsion free for all primes, there's a canonical base change equivalence from the (q-1)-completion of the base change of the q-de Rham complex to the q-de Rham complex over A'. Modulo q-1 this reduces to the usual base change equivalence of the de Rham complex.

### The global complex lifts to a derived commutative algebra, by cosimplicial PD realisations

`HabiroCohomologyFoundations:HQ.1/the-derived-commutative-lift` · *construction* · planet **Derived commutative lift**

The q-de Rham complex functor lifts canonically along the forgetful functor from derived commutative algebras over the power series ring in q-1 over A to E-infinity algebras over it. The lift is constructed by lifting each of the three corners of the defining pullback square, which suffices because limits and colimits of derived commutative algebras are computed on underlying E-infinity algebras. For the two p-complete corners the comparison with q-crystalline and crystalline cohomology provides functorial cosimplicial realisations. For the rational de Rham corner one takes a functorial surjection onto S from an ind-smooth A-algebra, forms its Cech nerve, takes the kernel of the augmentation and its PD envelope, and proves that the de Rham complex of S over A is the totalisation of that cosimplicial PD envelope; the proof checks that each column of the associated cosimplicial complex is quasi-isomorphic to the zeroth by the Poincare lemma and that each row in positive degree is nullhomotopic.

**Hypotheses.**

- The surjection onto S from an ind-smooth A-algebra is chosen functorially, for instance the polynomial algebra on the underlying set of S.
- Limits and colimits of derived commutative algebras are computed on underlying E-infinity algebras; this is the imported fact that makes the corner-by-corner argument work.
- The resulting structure is a derived commutative algebra structure, which is strictly more than an E-infinity structure; no claim is made that every E-infinity structure lifts.

**Proof outline.**

1. Reduce to lifting the three corners of the pullback square, using compatibility of the forgetful functor with limits.
2. Lift the two p-complete corners through the cosimplicial realisations supplied by the comparison with q-crystalline and crystalline cohomology.
3. For the rational corner, build the functorial surjection, its Cech nerve, the kernel and the PD envelope.
4. Prove that the de Rham complex is the totalisation of the cosimplicial PD envelope: the columns are quasi-isomorphic to the zeroth column by the Poincare lemma, and each positive row is nullhomotopic.
5. Observe that the PD de Rham complexes are commutative differential graded algebras, hence give a second construction of the derived commutative structure, and that the totalisation identification holds as derived commutative algebras.

**Acceptance.**

- The argument is corner by corner and cites the fact that limits are computed on underlying E-infinity algebras.
- The totalisation statement for the ordinary de Rham complex is proved and not assumed.
- The distinction between an E-infinity structure and a derived commutative structure is stated.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/the-global-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies`, `EnhancedDerivedSheaves:E5`

**API.**

| name | role | statement |
| --- | --- | --- |
| `lift` | constructor | A lift of the q-de Rham complex functor to (q-1)-complete derived commutative algebras over the power series ring in q-1 over A. |
| `underlying` | projection | Its composition with the forgetful functor to E-infinity algebras is the q-de Rham complex functor of the previous nodes. |
| `corners` | compatibility | The lift restricts on each corner of the defining square to the cosimplicial realisation named there. |
| `de-rham-totalisation` | characterisation | The ordinary de Rham complex of S over A is the totalisation of the PD envelopes of the Cech nerve, as derived commutative algebras. |
| `functoriality` | functoriality | The lift is functorial in S and natural in the base A. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The derived commutative upgrade of Habiro descent needs the q-de Rham complex to carry this structure, not merely an E-infinity structure.
- *HabiroCohomologyFoundations:HQ.5* — The canonical filtration on quasi-regular quotients is asserted to be a filtered derived commutative algebra, which presupposes this lift.

**Unit tests.**

- `underlying-structure` — Applying the forgetful functor recovers the E-infinity q-de Rham complex, with the same four properties.
- `de-rham-at-q-equals-one` — Modulo q-1 the lift is the derived commutative structure on the ordinary de Rham complex coming from its commutative differential graded algebra structure.
- `totalisation-is-not-degreewise` — The totalisation of the cosimplicial PD envelope is not the PD envelope in cosimplicial degree zero: a construction that took the zeroth term would already fail for a non-smooth quotient.
- `not-every-e-infinity-lifts` — The construction proves a lift exists for this functor; it is not a statement that the forgetful functor from derived commutative algebras is essentially surjective.

**Sources.**

- Appendix A, paragraph A.13, The strategy of the construction.

  > The key observation is that all limits and colimits in derived commutative algebras over the power series ring in q-1 over A can be computed on the level of underlying E-infinity algebras. Thus, by compatibility with pullbacks, it'll be enough to lift the three components of the pullback from Construction A.12 to derived commutative algebras.

- Appendix A, paragraph A.13, second half, The construction for the rational corner and the two checks its proof needs.

  > Let P surject onto S from an ind-smooth A-algebra, form the Cech nerve, let J be the kernel of the augmentation, and let D be its PD envelope. Then the de Rham complex of S over A is the totalisation of the PD envelopes, by a straightforward adaptation of the proof of [Prismatic, Theorem 16.22]: one checks that each column is quasi-isomorphic to the zeroth (the Poincare lemma) and that ...

## HQ.2 — Animated inputs and derived q-de Rham

The conventions are fixed once and for all here: descending and ascending
filtrations, associated graded, exhaustive, complete, **every filtration is the**
**pullback of its completion**, `M/f = cofib(f)` — which agrees with the ordinary
quotient **only for Koszul-regular sequences** — derived completion, the fracture
square, and the detection principle for complete objects.

Two conventions are specific and both are load-bearing. The filtered coefficient
ring is presented as `A[β,t]/(βt − (q−1))` with `|β| = 1`, `|t| = −1`: modding `t`
is the associated graded, modding `β` is reduction modulo `q−1`. And the quotient
`fil^★M/(q^m−1)` **always** means the base change with `q^m−1` in filtration
degree one — **not** the degreewise quotient.

`qdR` is the animation of `qΩ` on polynomial algebras. **Animation changes the**
**answer on smooth algebras** globally, though not p-completely; the repair is the
q-Hodge completion, not an identification.

Two rational comparisons are needed, and the source records that the
**p-completed one does not appear to follow** from the others. This packet carries
it as a hypothesis everywhere it is used.

Coverage: **source_decomposed**.

Nine nodes. The filtered, graded, derived-quotient and completion conventions the whole roadmap uses, with the detection principle; the graded presentation of the filtered coefficient ring by two generators whose product is the deformation parameter, which is the device that produces both the conjugate and the q-Witt filtrations; the quotient convention that places the deformation parameter in filtration degree one; the derived q-de Rham complex by animation, with the explicit record of where animation changes the answer and where it does not; base change with its completion hypothesis; the two rational comparisons with the source's statement that the p-completed one is a separate axiom; what the decalage import supplies and what is owned; and the smooth comparison identifying the underived complex with the q-Hodge completion of the derived one.

### Filtered and graded objects, derived quotients, derived completions and fracture squares

`HabiroCohomologyFoundations:HQ.2/filtered-graded-and-completion-conventions` · *definition* · planet **Filtered and completion conventions**

Fix the following conventions, which every later statement of this roadmap uses. A descending filtration on X is a diagram indexed by the integers with maps from the (n+1)-st to the n-th term; its associated graded in degree n is the cofibre of that map. A filtration constant in degrees at most zero is written starting at its zeroth term. The filtration is exhaustive if X is the colimit of its terms as the index goes to minus infinity, and complete if the limit as the index goes to plus infinity vanishes; the completion is the limit over n of the cofibres of the (star+n)-th term in the star-th, and every filtration is the pullback of its completion along the map from its underlying object to the underlying object of the completion. Filtered objects of a stable category are the modules over the graded unit with a degree minus one polynomial generator t, and passing to the associated graded is modding out t; filtered and graded objects carry the Day convolution symmetric monoidal structure when the tensor product of the ambient category commutes with colimits in each variable. For an element f of a ring, M modulo f is the cofibre of multiplication by f; for a sequence it is the iterated cofibre, and this agrees with the ordinary quotient only when the sequence is Koszul-regular on M. The derived completion at an ideal generated by a finite sequence is the limit over n of the quotients by the n-th powers; for a principal ideal there is always a fracture pullback square with corners M, its completion, its localisation and the localisation of its completion, called arithmetic when the element is an integer. Finally, if M is complete at a finite sequence and the homology of M modulo that sequence vanishes in some degree, then the homology of M vanishes in that degree.

**Hypotheses.**

- The ambient category is stable; for the monoidal statements its tensor product commutes with colimits in each variable.
- Ascending filtrations are indexed in the opposite direction and their graded pieces are the cofibres of the maps into the n-th term.
- These conventions are the enhanced-category import; what is specific to this roadmap is the coefficient ring of the next node.

**Proof outline.**

1. Fix the indexing conventions for descending and ascending filtrations and for the associated graded.
2. Record the identification of filtered objects with modules over the graded unit with a degree minus one generator, and the identification of the associated graded with the quotient by that generator.
3. Record the Day convolution monoidal structures and the hypothesis under which they exist.
4. Record the derived quotient and the derived completion, together with the warning that the derived quotient agrees with the ordinary one only for Koszul-regular sequences.
5. Record the fracture square for a principal ideal and the completeness detection principle.

**Acceptance.**

- Every convention that a later node relies on is stated here once and not restated differently elsewhere.
- The derived-versus-ordinary quotient warning is explicit.
- The completeness detection principle is stated with its hypothesis that M is already complete.

**Prerequisites.** `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E4`, `DerivedDeRhamCohomology:DD.1`, `mathlib:Ideal.Filtration`, `mathlib:CategoryTheory.FilteredObject`

**API.**

| name | role | statement |
| --- | --- | --- |
| `filtration` | structure | A descending filtration on X, with its associated graded, and the conventions for filtrations constant in degrees at most zero. |
| `completion-pullback` | characterisation | Every filtration is the pullback of its completion along the map of underlying objects. |
| `graded-module-description` | equivalence | Filtered objects are modules over the graded unit with a degree minus one generator, and the associated graded is the quotient by that generator. |
| `derived-quotient` | constructor | The quotient of M by a finite sequence, as an iterated cofibre, together with the criterion for agreement with the ordinary quotient. |
| `fracture-square` | characterisation | For a principal ideal, the pullback square with corners M, its completion, its localisation and the localisation of its completion. |
| `detection` | characterisation | For a complete object, vanishing of a homology degree may be checked modulo the completion ideal. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — Every clause of the definition of a q-Hodge filtration is a statement about filtered modules in these conventions.
- *HabiroCohomologyFoundations:HQ.4* — The Nygaard and stupid filtrations, and their associated gradeds, are taken in these conventions.
- *HabiroCohomologyFoundations:HQ.1* — The global complex is defined by a fracture square in exactly this sense.

**Unit tests.**

- `graded-of-the-adic-filtration` — For the (q-1)-adic filtration on the power series ring in q-1, the n-th graded piece is the free module on the n-th power of q-1; a convention that shifted the indexing by one would fail this.
- `derived-quotient-of-a-non-regular-element` — For M the ring of integers modulo p and f equal to p, the derived quotient has homology in two degrees while the ordinary quotient has homology in one; this separates the two quotients.
- `completion-detection-is-not-unconditional` — For M the rational numbers, which are not p-complete, the quotient by p vanishes but M does not; the detection principle needs completeness and this is the non-example.
- `every-filtration-is-the-pullback-of-its-completion` — For the filtration by the powers of an element on a module where that element acts invertibly, the completion vanishes and the pullback recovers the original filtration.

**Sources.**

- Paragraph 1.22(a), The filtered conventions, including the pullback-of-its-completion principle the later nodes use repeatedly.

  > We let Gr and Fil denote the categories of graded and descendingly filtered objects. We say that a filtration is exhaustive if X is the colimit of its terms, complete if the limit of its terms vanishes, and we define the completion as the limit of the cofibres. By construction there's a pullback square; we'll often refer to this by saying that every filtration is the pullback of its completion.

- Paragraph 1.22(c)-(d), The derived quotient convention with its warning, and the detection principle.

  > For an element f and an object M we let M/f be the cofibre of multiplication by f. We warn the reader that for ordinary modules the derived quotient agrees with the usual quotient only if the sequence is Koszul-regular on M. ... The following fact will be used countless times: if M is complete and the homology of M modulo the sequence vanishes in some degree, then also the homology of M ...

### The filtered coefficient ring as a graded ring with one generator in each direction

`HabiroCohomologyFoundations:HQ.2/the-graded-presentation-of-the-coefficient-ring` · *definition*

Write the filtered ring given by the (q-1)-adic filtration on the polynomial ring in q over A as the graded ring obtained from A by adjoining two generators, one of degree one and one of degree minus one, whose product is q-1. In this presentation the degree minus one generator is the filtration parameter, so that modding it out is passing to the associated graded, and the degree one generator is the element q-1 placed in filtration degree one, so that modding it out is reduction modulo q-1 in the filtered sense. Consequently, for a filtered object over this ring, the quotient by the degree one generator is the associated Hodge-type filtration on the de Rham side, the quotient by the degree minus one generator is the associated graded of the original filtration, and the quotient by both is the associated graded of the de Rham side. The same presentation is used with q-1 replaced by q^m-1, where the relation becomes that the product of the two generators is q^m-1 and q itself has degree zero.

**Hypotheses.**

- A is the base Lambda-ring; the presentation is an identification of filtered modules with graded modules and carries no extra data.
- The degree conventions are fixed once: the filtration parameter has degree minus one and the deformation parameter degree one.
- For the twisted case the ambient graded ring also contains q in degree zero.

**Proof outline.**

1. Identify filtered objects with graded modules over the graded unit with a degree minus one generator, as in the conventions node.
2. Observe that the (q-1)-adic filtration on the polynomial ring in q corresponds to adjoining a degree one generator whose product with the filtration parameter is q-1.
3. Compute the three quotients: by the degree one generator, by the degree minus one generator, and by both.
4. Repeat with q^m-1 in place of q-1, keeping q in degree zero.
5. Record that this presentation is the device by which the conjugate and q-Witt filtrations are produced from one abstract lemma.

**Acceptance.**

- The degrees of both generators and their product relation are stated.
- The three quotients are computed and named.
- The twisted version with q^m-1 is included, since the descent argument uses it for every m.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/filtered-graded-and-completion-conventions`

**API.**

| name | role | statement |
| --- | --- | --- |
| `presentation` | equivalence | An identification of the filtered ring with the stated graded ring, natural in A. |
| `mod-deformation-parameter` | projection | Modding out the degree one generator is reduction modulo q-1 in the filtered sense. |
| `mod-filtration-parameter` | projection | Modding out the degree minus one generator is passage to the associated graded. |
| `mod-both` | compatibility | Modding out both generators is the associated graded of the reduction modulo q-1. |
| `twisted-version` | functoriality | The same presentation with q^m-1 in place of q-1, with q in degree zero. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The conjugate filtration and the q-Witt filtration are both produced from the abstract graded lemma stated in this presentation.
- *HabiroCohomologyFoundations:HQ.3* — The symmetric monoidality of the q-Hodge complex is checked after inverting the degree one generator, which only makes sense in this presentation.

**Unit tests.**

- `the-relation` — The product of the degree one and degree minus one generators is q-1; a presentation with the degrees exchanged would give the wrong associated graded.
- `associated-graded-of-the-coefficient-ring` — Modding out the degree minus one generator gives the polynomial ring in q and the degree one generator over A, which is the associated graded of the (q-1)-adic filtration.
- `reduction-modulo-the-deformation-parameter` — Modding out the degree one generator gives the polynomial ring in the filtration parameter over the quotient of the polynomial ring in q by q-1, that is over A.
- `not-the-q-adic-filtration` — The presentation is of the (q-1)-adic filtration and not of the filtration by powers of q; the two differ already in degree one, where the latter is not a q-deformation of anything.

**Sources.**

- Proof of Lemma 3.9, The presentation and the roles of the two generators, verbatim in words.

  > To avoid ambiguous notation, let us identify the filtered ring given by the (q-1)-adic filtration on the polynomial ring in q over A with the graded ring obtained from A by adjoining beta of degree one and t of degree minus one, with beta times t equal to q-1. The filtered structure comes from the module structure over the polynomial ring in t, so t can be regarded as the filtration ...

- Proof outline of Theorem 3.11, The twisted version of the presentation, used for every m in the descent.

  > For this we identify the filtered ring given by the (q^m-1)-adic filtration on the polynomial ring in q over A with the graded ring obtained from A by adjoining q of degree zero, beta of degree one and t of degree minus one, modulo the relation that beta times t is q^m-1.

### The quotient of a filtered module by q^m-1 places the element in filtration degree one

`HabiroCohomologyFoundations:HQ.2/the-quotient-convention-for-filtered-modules` · *definition* · planet **The quotient convention**

For a filtered module over the filtered ring given by the (q^m-1)-adic filtration on the polynomial ring in q over A, the quotient of that filtered module by q^m-1 always means the base change along the map from that filtered ring to A taken in filtered objects; equivalently, q^m-1 is regarded as sitting in filtration degree one rather than degree zero. Concretely, the n-th filtered piece of the quotient is the cofibre of multiplication by q^m-1 from the (n-1)-st piece of the original to its n-th piece. This is not the degreewise quotient, whose n-th piece would be the cofibre of multiplication by q^m-1 on the n-th piece itself, and the two differ already for the (q-1)-adic filtration on the coefficient ring.

**Hypotheses.**

- The filtered module is a module over the filtered ring in which q^m-1 sits in degree one.
- The convention is in force for every quotient by q^m-1 written in this roadmap, including the quotients appearing in the definition of a q-Hodge filtration and in the descent theorem.

**Proof outline.**

1. Define the quotient as the base change of filtered modules along the map to A.
2. Compute the n-th filtered piece of the base change as the cofibre of multiplication from the (n-1)-st to the n-th piece.
3. Contrast with the degreewise quotient and record that the two are different functors.
4. Record that in the graded presentation of the previous node the convention is exactly the quotient by the degree one generator.

**Acceptance.**

- The convention is stated once, with its formula for the n-th piece.
- The contrast with the degreewise quotient is recorded, since taking the wrong one makes the q-deformation clause of the q-Hodge filtration false.
- The convention is tied to the graded presentation.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/filtered-graded-and-completion-conventions`, `HabiroCohomologyFoundations:HQ.2/the-graded-presentation-of-the-coefficient-ring`

**API.**

| name | role | statement |
| --- | --- | --- |
| `quotient` | constructor | The quotient of a filtered module by q^m-1, as a base change in filtered objects. |
| `piecewise-formula` | characterisation | Its n-th piece is the cofibre of multiplication by q^m-1 from the (n-1)-st to the n-th piece of the original. |
| `graded-description` | compatibility | In the graded presentation it is the quotient by the degree one generator. |
| `degree-zero` | projection | In filtration degrees at most zero it is the ordinary quotient of the underlying object by q^m-1. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — Clause (b) of the definition of a q-Hodge filtration is an equivalence of filtered modules after this quotient; with the degreewise quotient the clause would be false.
- *HabiroCohomologyFoundations:HQ.4* — The identification of the twisted q-de Rham complex modulo q^m-1 with the q-de Rham-Witt complex is stated with this convention.

**Unit tests.**

- `on-the-coefficient-ring` — The quotient of the (q-1)-adic filtration on the polynomial ring in q by q-1 is the filtration on A whose n-th piece is the n-th graded piece; a degreewise quotient would give A in every degree.
- `degree-zero-agreement` — In filtration degrees at most zero the convention agrees with the ordinary quotient of the underlying object.
- `not-the-degreewise-quotient` — For the (q-1)-adic filtration the degreewise quotient is A in every filtration degree with identity transition maps, which is a different filtered object; this is the non-example the convention rules out.
- `compatibility-with-the-graded-presentation` — Under the graded presentation the quotient is the cofibre of multiplication by the degree one generator, shifted by one in the grading.

**Sources.**

- Convention 3.1, The convention and the formula for the n-th piece, verbatim in words.

  > For a filtered module over the filtered ring given by the (q^m-1)-adic filtration on the polynomial ring in q over A, we always let the quotient by q^m-1 denote the base change to A in filtered objects, or in other words, the quotient by q^m-1 sitting in filtration degree one, not filtration degree zero. In particular, the n-th filtered piece of the quotient is the cofibre of ...

### The derived q-de Rham complex, by animation of the global complex on polynomial algebras

`HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex` · *construction* · planet **Derived q-de Rham complex**

Let A be a perfectly covered Lambda-ring. The derived q-de Rham complex is the unique sifted-colimit-preserving extension to animated A-algebras of the restriction of the global q-de Rham complex functor to polynomial A-algebras in finitely many variables. It takes values in (q-1)-complete derived commutative algebras over the power series ring in q-1 over A, it sits inside the pullback square whose corners are the product over all primes of the p-completed derived q-de Rham complexes of the p-completions, the power series ring in q-1 over the rationalised derived de Rham complex, and the power series ring in q-1 over the rationalised product of those p-completed derived de Rham complexes, and its quotient by q-1 is the derived de Rham complex.

**Hypotheses.**

- A is a perfectly covered Lambda-ring, so that the local q-de Rham complexes exist for all primes.
- The extension is by the universal property of animation: animated A-algebras are freely generated under sifted colimits by finitely generated polynomial A-algebras.
- The values on polynomial algebras are the global q-de Rham complexes of the previous stage; the values on general smooth algebras are not.

**Proof outline.**

1. Restrict the global q-de Rham complex functor to finitely generated polynomial A-algebras.
2. Extend it uniquely along the universal property of animation to a sifted-colimit-preserving functor on animated A-algebras.
3. Check that the pullback square of the global construction is preserved, using that the three corners are themselves animations and that animation commutes with colimits.
4. Check that the quotient by q-1 is the derived de Rham complex, by checking it on polynomial algebras and extending.
5. Check that the derived commutative structure of the previous stage is inherited, using that colimits of derived commutative algebras are computed on underlying objects.

**Acceptance.**

- The construction is by the universal property of animation and not by a new site.
- The pullback square is stated for the derived functor and is not merely asserted for the underived one.
- The values are recorded as agreeing with the underived functor on polynomial algebras only.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/the-global-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/the-derived-commutative-lift`, `EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`, `EnhancedDerivedSheaves:E5:animation/universal-property-of-animation`, `EnhancedDerivedSheaves:E5:animation/sifted-colimits`, `HabiroRings:HR.1/perfectly-covered`

**API.**

| name | role | statement |
| --- | --- | --- |
| `derived-q-de-rham` | constructor | A sifted-colimit-preserving functor from animated A-algebras to (q-1)-complete derived commutative algebras over the power series ring in q-1 over A. |
| `on-polynomial-algebras` | characterisation | Its restriction to finitely generated polynomial A-algebras is the global q-de Rham complex functor. |
| `mod-q-minus-one` | projection | Its quotient by q-1 is the derived de Rham complex functor. |
| `fracture-square` | characterisation | The pullback square with the three named corners, for every animated A-algebra. |
| `sifted-colimits` | universal-property | It preserves sifted colimits, and is the unique such extension of its restriction to polynomial algebras. |
| `derived-commutative-structure` | structure | It lifts the E-infinity structure to a derived commutative algebra structure. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — It is the object a q-Hodge filtration filters; the definition of that filtration is a list of conditions on filtrations of this complex.
- *HabiroCohomologyFoundations:HQ.5* — The canonical filtrations for smooth and for quasi-regular inputs are built on it, in the second case by a one-categorical preimage inside a static ring.
- *RefinedTraceMethods:RT.4:q-Hodge* — The trace-theoretic construction produces a filtration of this same complex.

**Unit tests.**

- `polynomial-value` — For the polynomial ring in one variable over the integers, the derived q-de Rham complex is the underived one, namely the two-term q-difference complex.
- `q-equals-one` — Its quotient by q-1 is the derived de Rham complex; for a polynomial algebra this is the ordinary de Rham complex, and for a quotient by a regular element it is the divided power envelope.
- `sifted-colimit-preservation` — For a filtered colimit of polynomial algebras the value is the colimit of the values; a construction that took a limit somewhere would fail this.
- `not-the-underived-complex-on-smooth-inputs` — For a smooth algebra that is not a localisation of a polynomial algebra the derived and underived complexes differ, already in characteristic zero; this is the non-example.

**Sources.**

- Paragraph 1.22(b), The universal property by which the derived functor is defined.

  > We'll often use the fact that any functor from polynomial A-algebras into a category with all sifted colimits can be uniquely extended to a sifted colimits preserving functor on animated A-algebras. We often call this the animation or the non-abelian derived functor. The most important examples for us will be the q-de Rham complex and the Hodge-filtered de Rham complex.

- Appendix A, paragraph A.14, The pullback square and the reduction modulo q-1 for the derived functor.

  > We let the derived q-de Rham complex denote the animation of the q-de Rham complex. By construction, it sits inside a pullback square whose corners are the product of the p-completed derived q-de Rham complexes, the power series ring in q-1 over the rationalised derived de Rham complex, and the power series ring over the rationalised product of the p-completed derived de Rham complexes. ...

### Where animation changes the answer, and where it does not

`HabiroCohomologyFoundations:HQ.2/animation-does-not-preserve-the-values-on-smooth-algebras` · *comparison*

After p-completion, animation leaves the values on p-completely smooth algebras unchanged: this can be seen modulo p and q-1, where it reduces to the corresponding fact about derived de Rham cohomology in characteristic p. Globally this fails. The derived q-de Rham complex agrees with the underived global q-de Rham complex on polynomial algebras only, not on all smooth algebras, and the failure is already present for the derived de Rham complex in characteristic zero, where the derived de Rham complex of a smooth algebra is not its de Rham complex but has the de Rham complex as its Hodge completion. The repair is not to conflate the two but to complete: for an object carrying a q-Hodge filtration, the underived q-de Rham complex of a smooth algebra is the completion of the derived one at that filtration.

**Hypotheses.**

- The p-complete statement is about p-completely smooth algebras over the p-completion of the base.
- The global failure is a statement about the underived functor of the previous stage versus its animation, not about two different animations.
- The repair presupposes a chosen q-Hodge filtration, which is the datum of the next stage.

**Proof outline.**

1. State the p-complete agreement and its proof by reduction modulo p and q-1.
2. State the global failure and locate it in the characteristic zero behaviour of the derived de Rham complex.
3. Record that the ordinary de Rham complex of a smooth algebra is the Hodge-completed derived de Rham complex, so that the discrepancy is exactly a completion.
4. Record the q-analogue as the statement proved in the smooth comparison node below, and note that it is available only once a q-Hodge filtration is chosen.

**Acceptance.**

- The two regimes, p-complete and global, are separated and each is stated with its hypotheses.
- The claim that animation preserves smooth values is never made globally.
- The repair is stated as a completion, not as an equivalence of the uncompleted objects.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`

**Sources.**

- Appendix A, paragraph A.14, The global failure, in the source's own words.

  > However, in contrast to the p-complete situation, it's no longer true that the values on smooth A-algebras remain unchanged under animation (only the values on polynomial algebras do). In fact, this already fails for the derived de Rham complex in characteristic zero.

- Appendix A, subsection on rationalised q-crystalline cohomology, The p-complete agreement, which is the other half of the contrast.

  > Observe that animation leaves the values on p-completely smooth algebras over the p-completion of A unchanged, as can be seen modulo p and q-1, where it reduces to a well-known fact about derived de Rham cohomology in characteristic p.

### Base change for the derived q-de Rham complex, with the completion it actually requires

`HabiroCohomologyFoundations:HQ.2/derived-base-change-and-its-completion-hypotheses` · *theorem*

Let A map to A' as Lambda-rings, with both p-torsion free for every prime p. Then for every smooth A-algebra the canonical map from the (q-1)-completed base change of its q-de Rham complex along A to A' to the q-de Rham complex of the base-changed algebra over A' is an equivalence, and modulo q-1 this reduces to the usual base change equivalence of the de Rham complex. The same holds for the animations. The completion is part of the statement: the uncompleted base change is not the q-de Rham complex of the base-changed algebra, and the tensor product is the derived one.

**Hypotheses.**

- A and A' are p-torsion free for every prime p; A' need not be flat over A.
- The base change is derived and then completed at q-1.
- For the animated statement the base change is taken in (q-1)-complete derived commutative algebras.

**Proof outline.**

1. Check the statement on each corner of the defining pullback square: for the p-complete corners it is base change for the local prismatic theory, and for the rational corner it is base change for the de Rham complex after rationalisation.
2. Check that the right-hand vertical map of the square is compatible with base change, using that the uniform denominator bound does not depend on the base.
3. Conclude by functoriality of pullbacks that the map on pullbacks is an equivalence after (q-1)-completion.
4. Reduce modulo q-1 and identify the result with the usual base change for the de Rham complex.
5. Extend to animations by checking on polynomial algebras and using that both sides preserve sifted colimits.

**Acceptance.**

- The (q-1)-completion appears in the statement and is not dropped.
- The tensor product is the derived one throughout, and the statement distinguishes it from the ordinary one.
- The animated version is deduced and not assumed.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies`, `HabiroCohomologyFoundations:HQ.2/filtered-graded-and-completion-conventions`

**Sources.**

- Theorem A.1, final paragraph, The statement of the node with its completion hypothesis.

  > Moreover, if A maps to A' as Lambda-rings with A' also p-torsion free for all primes p, there's a canonical base change equivalence from the (q-1)-completion of the derived tensor product of the q-de Rham complex with A' to the q-de Rham complex of the base-changed algebra over A'. Modulo q-1 this reduces to the usual base change equivalence of the de Rham complex.

### The rational comparison, the p-completed rational comparison, and their independence

`HabiroCohomologyFoundations:HQ.2/the-two-rational-comparisons-and-why-the-second-is-an-axiom` · *theorem*

Two comparisons are available for the derived q-de Rham complex of an animated A-algebra R. First, the (q-1)-completed rationalisation of the derived q-de Rham complex is the power series ring in q-1 over the rationalised derived de Rham complex. Second, for every prime p, the (q-1)-completion of the p-completed derived q-de Rham complex with p inverted is the power series ring in q-1 over the p-completed derived de Rham complex with p inverted. The two are compatible along the map from the rationalisation to the product of the p-completed rationalisations. Both are used, and they are genuinely different conditions when one asks a filtration to be compatible with them: the source states that the second does not appear to follow from the first together with the deformation condition, and treats it as a crucial separate assumption. This packet therefore carries the second as a hypothesis wherever it is used and records the non-implication as an open question rather than as a theorem.

**Hypotheses.**

- R is an animated A-algebra; A is a perfectly covered Lambda-ring.
- The first comparison is the global rationalisation; the second is taken after p-completion and then inverting p, in that order.
- The independence is the source's own assessment and is not proved there; nothing in this packet depends on the non-implication being a theorem.

**Proof outline.**

1. Obtain the first comparison from the defining pullback square of the derived complex, whose lower left corner is by construction the power series ring in q-1 over the rationalised derived de Rham complex.
2. Obtain the second from the coordinate-free rationalised q-crystalline comparison applied to the p-completion.
3. Write the square expressing the compatibility of the two, with vertical maps the completion and localisation maps, and record it as the diagram that a q-Hodge filtration is later required to lift.
4. Record the source's statement that the second condition does not seem to follow from the others and is a crucial assumption, and mark it as such in every later node that uses it.

**Acceptance.**

- Both comparisons are stated with the exact order of completion, localisation and rationalisation.
- The compatibility diagram is written out.
- The independence is recorded as an open question with an attribution, and no node treats it as proved.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/rationalised-q-crystalline-comparison`, `HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies`

**Sources.**

- Remark 1.8, The source's own statement that the p-completed rational condition is independent and crucial; the node carries it as a hypothesis.

  > The conditions from Definition 1.6(c) and (c_p) are natural to ask in view of the rationalised comparison and of the p-completed rationalised comparison. It doesn't seem to be the case that (c_p) follows from the other conditions and it will be a crucial assumption.

- Definition 3.2(c) and (c_p), preamble, Why both comparisons are needed, which is what the node records.

  > In addition to the obvious q-deformation condition, we also wish the filtration to be compatible with the rational equivalence, which leads to condition (c). For technical reasons, we also need to require the same for the rationalisations of the p-completed (q-)de Rham complexes, which is why we have to include condition (c_p).

### The decalage functor is imported; the q-specific applications are owned here

`HabiroCohomologyFoundations:HQ.2/what-the-decalage-import-supplies` · *comparison*

The Berthelot-Ogus decalage functor at an element f, its behaviour on cohomology, and its compatibility with completion at f are imported from the A-infinity roadmap and are not constructed here. What this roadmap owns is their use at the specific elements q-1 and [m]_q: that the p-completion of the decalage of the q-de Rham complex at [p^alpha]_q is the decalage of its p-completion, because the complex is (q-1)-complete so that p-completion agrees with completion at [p^alpha]_q and the latter always commutes with the decalage; that the relative Frobenius induces an equivalence from the Frobenius twist of prismatic cohomology to the decalage of prismatic cohomology at the prism ideal; and that the decalage of the q-Hodge complex at q-1 recovers the underived q-de Rham complex for smooth inputs. The canonical filtration that the decalage functor carries does not glue across the local pieces, and that failure is what forces the extra datum of a q-Hodge filtration.

**Hypotheses.**

- The generic decalage functor and its torsion-correcting description of cohomology are supplied by AInfCohomology:AI.1.
- The commutation of decalage with completion is used at the element [p^alpha]_q and requires the object to be (q-1)-complete.
- The failure of the canonical decalage filtrations to glue is a statement about this particular family and is recorded, not proved, here.

**Proof outline.**

1. Name the imported interface: the decalage functor, its cohomology formula, and its commutation with completion at the same element.
2. Record the two q-specific applications used in the construction of the twisted q-de Rham complexes: the completion argument and the relative Frobenius equivalence.
3. Record the smooth application proved in this roadmap: the decalage of the q-Hodge complex at q-1 is the underived q-de Rham complex.
4. Record the non-gluing of the canonical decalage filtrations, with the explicit reason that the filtration on the identity functor is trivial while the filtration on the decalage at [p]_q is not.

**Acceptance.**

- Every use of decalage in this packet is either an import named here or one of the three listed applications.
- The completion argument is stated with the hypothesis that the object is (q-1)-complete.
- The non-gluing is stated as an obstruction, with the reason, and not as a theorem that gluing is impossible.

**Prerequisites.** `AInfCohomology:AI.1`, `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`

**Sources.**

- Paragraph 3.14, The completion argument, which is the first q-specific application.

  > Now the p-completion of the decalage at [p^alpha]_q of the q-de Rham complex is the decalage of its p-completion. Indeed, the q-de Rham complex is (q-1)-complete, so p-completion agrees with completion at [p^alpha]_q, which always commutes with the decalage.

- Remark 3.49, The precise reason the canonical decalage filtrations do not glue.

  > The filtration on the decalage at [1]_q, which is the identity, is trivial. But the trivial filtration on the Frobenius twist will not be compatible with the natural filtration on the decalage at [p]_q of the p-completion, so gluing fails.

### For smooth inputs, q-Omega is the q-Hodge completion of the derived complex and the decalage of the q-Hodge complex

`HabiroCohomologyFoundations:HQ.2/the-smooth-comparison-of-q-omega-with-the-q-hodge-completion` · *theorem* · planet **q-Omega is the q-Hodge completion**

Let S be a smooth A-algebra and suppose the derived q-de Rham complex of S over A has been equipped with a q-Hodge filtration. Then the underived q-de Rham complex of S over A is the completion of the derived q-de Rham complex at that filtration; and the decalage at q-1 of the q-Hodge complex of the pair is the underived q-de Rham complex, so that the decalage at q-1 of the Habiro-Hodge complex is a Habiro descent of the underived q-de Rham complex. Neither statement asserts that the uncompleted derived complex agrees with the underived one; for a general smooth algebra it does not.

**Hypotheses.**

- S is smooth over the perfectly covered Lambda-ring A.
- A q-Hodge filtration on the derived complex has been chosen; both statements depend on that choice as data, though the first identifies the completion with an object defined without it.
- The decalage is the Berthelot-Ogus functor at the element q-1.

**Proof outline.**

1. Reduce the first statement to the fact that the ordinary de Rham complex of a smooth algebra is the Hodge completion of the derived de Rham complex, transported along the q-deformation clause of the filtration.
2. Use that every filtration is the pullback of its completion to pass between filtrations on the derived and on the underived complex.
3. For the second statement, compute the decalage of the q-Hodge complex at q-1 through the conjugate filtration, whose graded pieces are the shifted de Rham forms, and identify the result with the underived complex.
4. Deduce the Habiro descent statement by applying the decalage to the Habiro-Hodge complex and using that decalage commutes with the relevant completions.
5. Record explicitly that no statement identifies the uncompleted derived complex with the underived one.

**Acceptance.**

- Both clauses carry the hypothesis that a q-Hodge filtration has been chosen.
- The first clause is about the completion at the q-Hodge filtration and not about the Hodge completion of the de Rham complex alone.
- The packet contains no statement that the derived and underived q-de Rham complexes of a smooth algebra agree.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.2/animation-does-not-preserve-the-values-on-smooth-algebras`, `HabiroCohomologyFoundations:HQ.2/what-the-decalage-import-supplies`, `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`, `HabiroCohomologyFoundations:HQ.3/the-conjugate-filtration`, `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex`

**Sources.**

- Proposition 3.47, The two clauses of the node, in the source's order.

  > Let a pair of a smooth A-algebra S and a q-Hodge filtration on its derived q-de Rham complex be given. Then: the underived q-de Rham complex is the completion of the derived q-de Rham complex at the q-Hodge filtration; and the decalage at q-1 of the q-Hodge complex is the underived q-de Rham complex, so that the decalage at q-1 of the Habiro-Hodge complex is a Habiro descent of the ...

- Remark 3.6, The explicit statement that the two complexes differ, which the node records as what is not being claimed.

  > In the above we've used the derived q-de Rham complex since many of our examples later on will be outside of the smooth case. But note that even if R is smooth over A, the underived q-de Rham complex usually doesn't agree with the derived q-de Rham complex, because the de Rham complex and the derived de Rham complex usually differ in characteristic zero.

## HQ.3 — q-Hodge filtrations and modification

**Definition 3.2 in full**: a `(q−1)`-complete filtered module over
`(q−1)^★A[q]` with (a) degree-zero identification with `qdR`, (b) filtered
specialisation to the Hodge filtration, (c) the rational comparison and (c_p) the
p-completed rational comparison — **each with its agreement below degree one**,
and with every coherence square listed as a datum. No opaque predicate stands for
these conditions.

**There is no functorial choice** (Lemma 3.3): over a non-rational base the
forgetful functor is not even essentially surjective, so no section exists, not
even over smooth algebras.

`qHdg` is the `(q−1)`-completed colimit `fil⁰ → (q−1)fil¹ → (q−1)²fil² → ⋯`.
Theorem 3.11 factors it **symmetric monoidally** through the Habiro-complete
objects, and for each `m` the quotient by `q^m − 1` carries an **exhaustive**
**ascending filtration** with graded pieces `Σ^(−*) qW_m dR^*` — the *derived*
q-de Rham–Witt objects. This is a filtration statement, not an unfiltered
equality with some q-Witt complex.

For a framed smooth algebra there is an explicit Koszul model over the relative
Habiro ring; for an étale algebra the answer **is** that ring.

Coverage: **source_decomposed**.

Thirteen nodes. The definition of a q-Hodge filtration with all four clauses and every coherence datum; the no-go lemma; the q-Hodge complex with the interchangeability of a filtration and its completion; the symmetric monoidal structure on pairs and on the q-Hodge complex functor; the conjugate filtration and the abstract graded colimit lemma that computes it; the twisted q-Hodge filtration p-adically by recursion and globally by gluing, with the independence of the auxiliary integer; the partial descents with the denominator lemma; the Habiro-Hodge complex and the descent theorem in both clauses; the coordinate model with its explicit Koszul complex over the relative Habiro ring and the etale specialisation; and the operadic and derived commutative upgrades with the Bockstein identification.

### q-Hodge filtrations: the four conditions and the coherences between them

`HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations` · *definition* · planet **q-Hodge filtration**

Let A be a perfectly covered Lambda-ring and R an animated A-algebra. A q-Hodge filtration on the derived q-de Rham complex of R over A is a filtered module over the filtered ring given by the (q-1)-adic filtration on the polynomial ring in q over A, indexed by the non-negative integers and constant below zero, equipped with: (a) an equivalence of modules over the polynomial ring in q from the derived q-de Rham complex onto the zeroth filtration step, so that the filtration is a descending filtration on that complex; (b) an equivalence of filtered A-modules from the quotient of the filtration by q-1, taken in the sense that q-1 sits in filtration degree one, onto the Hodge filtration on the derived de Rham complex, agreeing in filtration degrees at most zero with the usual identification; (c) an equivalence of filtered modules from the (q-1)-completed rationalisation of the filtration onto the combined Hodge and (q-1)-adic filtration on the power series ring in q-1 over the rationalised derived de Rham complex, agreeing in degrees at most zero with the usual identification and fitting with (b) into a commutative square; and (c_p) for every prime p an equivalence of filtered modules from the (q-1)-completed localisation at p of the p-completed filtration onto the combined Hodge and (q-1)-adic filtration on the power series ring over the p-completed derived de Rham complex with p inverted, agreeing in degrees at most zero with the usual identification, compatible with (c) in a commutative square, compatible with (b) in a second commutative square, and with those two compatibilities themselves compatible. Since these are statements in higher category theory, every compatibility is itself a datum. Pairs consisting of an animated A-algebra and a q-Hodge filtration on its derived q-de Rham complex form a category, expressible as an iterated pullback of the category of animated A-algebras with categories of filtered modules.

**Hypotheses.**

- A is a perfectly covered Lambda-ring; R is an animated A-algebra.
- The quotient by q-1 in clause (b) is the filtered quotient of the conventions stage, with q-1 in filtration degree one; with the degreewise quotient the clause would be a different and false condition.
- Clause (c_p) is a separate axiom: the source records that it does not appear to follow from the others and that it is a crucial assumption.
- Every equivalence is required to agree in filtration degrees at most zero with the already-known unfiltered identification.

**Proof outline.**

1. Fix the filtered coefficient ring and the indexing convention, and require the filtration to be a module over it.
2. Impose clause (a) and read it as saying that the filtration is a descending filtration on the derived q-de Rham complex.
3. Impose clause (b) with the filtered quotient convention and its agreement in degrees at most zero.
4. Impose clause (c) with its agreement in degrees at most zero and its commutative square with (b).
5. Impose clause (c_p) with its agreement in degrees at most zero, its square with (c), its square with (b) and the compatibility between those two squares.
6. Assemble the category of pairs as an iterated pullback of the category of animated A-algebras with categories of filtered modules.

**Acceptance.**

- All four clauses appear, and (c_p) is present and not derived from the others.
- Every clause carries its agreement in filtration degrees at most zero.
- The coherence data are listed as data and not left implicit.
- The definition is stated for the derived q-de Rham complex; the underived variant is obtained by pullback, as the following node records.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.2/the-quotient-convention-for-filtered-modules`, `HabiroCohomologyFoundations:HQ.2/the-two-rational-comparisons-and-why-the-second-is-an-axiom`, `HabiroCohomologyFoundations:HQ.2/filtered-graded-and-completion-conventions`, `DerivedDeRhamCohomology:DD.2`, `DerivedDeRhamCohomology:DD.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `q-hodge-filtration` | structure | The data of a q-Hodge filtration on the derived q-de Rham complex of an animated A-algebra. |
| `zeroth-step` | projection | The equivalence identifying the zeroth step with the derived q-de Rham complex. |
| `deformation` | characterisation | The equivalence between the filtered quotient by q-1 and the Hodge filtration on the derived de Rham complex. |
| `rational-comparison` | compatibility | The equivalence with the combined Hodge and (q-1)-adic filtration after rationalisation, with its square against the deformation clause. |
| `p-adic-rational-comparison` | compatibility | The corresponding equivalence after p-completion and inverting p, with its two squares and their compatibility. |
| `category-of-pairs` | structure | The category of pairs of an animated A-algebra and a q-Hodge filtration, with its forgetful functor to animated A-algebras. |
| `underived-variant` | equivalence | For a smooth algebra, a filtration of the underived complex satisfying the analogous conditions pulls back to one of the derived complex. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The q-Hodge complex and the whole descent are functors on the category of pairs, so the definition fixes their domain.
- *HabiroCohomologyFoundations:HQ.5* — Both existence theorems produce sections of the forgetful functor, so they are statements about this definition.
- *RefinedTraceMethods:RT.4:q-Hodge* — The trace-theoretic construction produces an object of this category, which is how its output enters this roadmap.

**Unit tests.**

- `dimension-at-most-one` — For a smooth algebra of relative dimension at most one over the integers, the Hodge filtration vanishes above degree one, so any q-Hodge filtration is the (q-1)-adic filtration on its first step; this pins the higher steps and is the source's motivating computation.
- `the-naive-pullback-fails` — The pullback of the Hodge filtration along the map from the q-de Rham complex to the de Rham complex contains all of the (q-1)-multiples in every step, so it satisfies clause (c) only in degrees at most one; this is the non-example that shows clauses (b) and (c) are not both automatic.
- `agreement-below-degree-one` — In filtration degrees at most zero every clause reduces to the already-known unfiltered identification; a definition that did not impose this could be satisfied by an unrelated filtration.
- `rational-base` — If A is an algebra over the rationals the combined Hodge and (q-1)-adic filtration itself is a q-Hodge filtration, so the forgetful functor is surjective on objects; this is the degenerate case the no-go theorem excludes.

**Sources.**

- Definition 3.2, The four clauses of the definition, in the source's order.

  > A q-Hodge filtration on the derived q-de Rham complex is a filtered module over the (q-1)-adically filtered polynomial ring in q over A equipped with: an equivalence of modules from the derived q-de Rham complex onto the zeroth step; an equivalence of filtered A-modules from the quotient by q-1 onto the Hodge filtration on the derived de Rham complex; an equivalence of filtered modules ...

- Definition 3.2, footnote, That the coherences are data, which is why the node lists them explicitly.

  > Since we're working with higher categories, each compatibility is again a datum that needs to be provided.

- Remark 1.8, The independence of clause (c_p), recorded as a hypothesis of the definition.

  > It doesn't seem to be the case that (c_p) follows from the other conditions and it will be a crucial assumption.

### The forgetful functor is not essentially surjective, so it has no section

`HabiroCohomologyFoundations:HQ.3/no-functorial-choice-of-q-hodge-filtration` · *theorem* · planet **No functorial q-Hodge filtration**

Let A be a perfectly covered Lambda-ring which is not an algebra over the rationals. Then the forgetful functor from pairs to animated A-algebras is not essentially surjective: there is an animated A-algebra whose derived q-de Rham complex admits no q-Hodge filtration at all. In particular the forgetful functor admits no section, not even when restricted to the full subcategory of smooth A-algebras, because a section on smooth algebras could be animated to a section on all animated algebras.

**Hypotheses.**

- A is not an algebra over the rationals, so that some p-completion of A is non-zero.
- The witness is the quotient of the free p-complete perfect delta-ring on one generator by that generator.
- The argument uses clause (c_p) of the definition; it is not available if that clause is dropped.

**Proof outline.**

1. Choose a prime p with non-zero p-completion of A and set R to be the quotient of the free p-complete perfect delta-ring on a generator by that generator.
2. Identify the p-completed derived q-de Rham complex of R with the corresponding prismatic envelope; in particular it is static.
3. Observe that the Hodge filtration on the p-completed derived de Rham complex is the divided power filtration of the divided power envelope, so that by clause (b) a q-Hodge filtration would be a descending chain of submodules.
4. Deduce that its p-th step would contain an element congruent modulo q-1 to the p-th power of the generator divided by p, and that by clause (c_p) this element would lie in the p-th power of the ideal generated by the generator and q-1 after completed rationalisation.
5. Check on the explicit prismatic envelope that no such element exists, by the computation carried out in the quasi-regular example of the existence stage.
6. Conclude non-essential-surjectivity, and deduce the absence of a section on smooth algebras by animating a hypothetical section.

**Acceptance.**

- The hypothesis that A is not a rational algebra is present and used.
- The witness object and the reason it fails are both recorded.
- The deduction from non-essential-surjectivity to the absence of a section on smooth algebras is by animation and is written out.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.5/when-the-naive-filtration-deforms-the-hodge-filtration`

**Sources.**

- Lemma 3.3, The statement of the node.

  > If A is not an algebra over the rationals, then the forgetful functor from the category of pairs to animated A-algebras is not essentially surjective. In particular, it has no section, not even when restricted to the full subcategory of smooth A-algebras.

- Proof sketch of Lemma 3.3, The witness and the shape of the argument.

  > Let p be a prime such that the p-completion of A is non-zero, and let R be the quotient of the free p-complete perfect delta-ring on a generator by that generator. We'll show that the q-de Rham complex of R admits no q-Hodge filtration. ... it is straightforward to check that the prismatic envelope doesn't contain any element with these properties.

### The q-Hodge complex, as the completed colimit of the filtration along multiplication by q-1

`HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex` · *construction* · planet **q-Hodge complex**

Given a pair of an animated A-algebra R and a q-Hodge filtration on its derived q-de Rham complex, the q-Hodge complex is the (q-1)-completion of the colimit of the sequence whose terms are the filtration steps and whose maps are multiplication by q-1 from the n-th step into the (n+1)-st. It does not matter whether the filtration or its completion is used, since every element of the n-th step becomes divisible by the n-th power of q-1 in the colimit and the result is (q-1)-complete. If R is smooth and the filtration is given on the underived q-de Rham complex, the pullback along the canonical map from the derived to the underived complex gives a q-Hodge filtration in the sense of the definition, and the associated q-Hodge complex is unchanged; this is why the coordinate-dependent construction on a framed smooth algebra produces an object of the same theory.

**Hypotheses.**

- The pair is an object of the category of the definition node.
- The colimit is taken in the derived category over the polynomial ring in q, before completion.
- The interchangeability of the filtration with its completion is a statement about this construction and not about the filtrations themselves.

**Proof outline.**

1. Form the sequential colimit along multiplication by q-1 and complete at q-1.
2. Show that the result is unchanged if the filtration is replaced by its completion, by observing that each step becomes divisible by the corresponding power of q-1 and that the target is complete.
3. For smooth R, construct the pullback of a filtration on the underived complex along the canonical map, and check the four clauses for the pullback using that every filtration is the pullback of its completion and that the ordinary de Rham complex is the Hodge completion of the derived one.
4. Check that the q-Hodge complex of the pullback filtration agrees with the one computed from the underived filtration.

**Acceptance.**

- The construction is stated with the completion and with the colimit in the right order.
- The interchangeability with the completion is proved and not assumed.
- The smooth transfer between underived and derived filtrations is recorded as a construction with its justification.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.2/filtered-graded-and-completion-conventions`

**API.**

| name | role | statement |
| --- | --- | --- |
| `q-hodge-complex` | constructor | For a pair of an animated A-algebra and a q-Hodge filtration, a (q-1)-complete module over the polynomial ring in q over A. |
| `completion-invariance` | characterisation | The construction is unchanged when the filtration is replaced by its completion. |
| `underived-transfer` | compatibility | For smooth inputs, a filtration on the underived complex pulls back to one on the derived complex with the same q-Hodge complex. |
| `functoriality` | functoriality | The construction is a functor from the category of pairs to (q-1)-complete modules. |
| `mod-q-minus-one` | projection | Its reduction modulo q-1 carries the conjugate filtration of the following node. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The descent theorem factors this functor through the Habiro-complete objects.
- *HabiroCohomologyFoundations:HQ.2* — Its decalage at q-1 is the underived q-de Rham complex for smooth inputs.
- *RefinedTraceMethods:RT.4:q-Hodge* — Its rationalised form is the graded piece of an even filtration on a topological cyclic homology object.

**Unit tests.**

- `coordinate-model` — For a framed smooth algebra with the coordinate-dependent filtration, the q-Hodge complex is the q-difference complex with every differential multiplied by q-1.
- `mod-q-minus-one` — Its reduction modulo q-1 has an exhaustive ascending filtration with graded pieces the shifted de Rham forms; in particular it is not the de Rham complex on the nose.
- `filtration-versus-completion` — Replacing the filtration by its completion does not change the answer; a construction that omitted the final (q-1)-completion would fail this.
- `not-the-q-de-rham-complex` — The q-Hodge complex is not the q-de Rham complex: for a framed smooth algebra the differentials differ by a factor of q-1, and the two agree only after applying the decalage functor at q-1.

**Sources.**

- Paragraph 3.5, The construction.

  > Given a q-Hodge filtration for R over A, we can construct the q-Hodge complex as the (q-1)-completion of the colimit of the diagram whose terms are the filtration steps and whose maps are multiplication by q-1.

- Remark 3.6, The smooth transfer and the interchangeability with the completion.

  > If we're given a filtration on the underived q-de Rham complex that satisfies the obvious analogues of the conditions, then its pullback along the canonical map yields a filtration as in the definition. Indeed, this follows from the fact that the de Rham complex always agrees with the Hodge-completed derived de Rham complex and the fact that any filtration is the pullback of its ...

### The category of pairs is symmetric monoidal and the q-Hodge complex functor is monoidal

`HabiroCohomologyFoundations:HQ.3/the-symmetric-monoidal-structure-on-pairs` · *theorem*

The category of pairs of an animated A-algebra and a q-Hodge filtration carries a canonical symmetric monoidal structure, in which the tensor product of two pairs has underlying algebra the derived tensor product over A and underlying filtration the (q-1)-completed derived tensor product of the two filtrations over the filtered coefficient ring. With this structure the q-Hodge complex functor into (q-1)-complete modules over the polynomial ring in q carries a canonical symmetric monoidal structure, not merely a lax one.

**Hypotheses.**

- The tensor product of filtrations is taken as filtered modules over the filtered coefficient ring and is then completed at q-1.
- Strict, as opposed to lax, monoidality is proved after reduction modulo q-1, which is legitimate because the values are (q-1)-complete.

**Proof outline.**

1. Express the category of pairs as an iterated pullback of symmetric monoidal categories along symmetric monoidal functors, so that it inherits a symmetric monoidal structure and both forgetful functors become symmetric monoidal; this gives the formula for the tensor product.
2. Construct a lax symmetric monoidal structure on the q-Hodge complex functor by writing it as the zeroth filtration step of a localisation, using that localisation is symmetric monoidal and that taking the zeroth step is lax symmetric monoidal.
3. Reduce the verification of strict monoidality modulo q-1, using completeness of the values.
4. Equip the conjugate filtration with a compatible lax symmetric monoidal structure and observe that its associated graded is the Hodge-graded de Rham functor, which is symmetric monoidal.
5. Check strict monoidality of the conjugate filtration on associated gradeds and conclude.

**Acceptance.**

- The formula for the tensor product of two pairs is recorded, including the completion.
- The passage from lax to strict monoidality is by reduction modulo q-1 and is justified by completeness.
- The proof cites the symmetric monoidality of the Hodge-graded de Rham functor as its base case.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`, `HabiroCohomologyFoundations:HQ.3/the-conjugate-filtration`

**Sources.**

- Proposition 3.7, The statement of the node.

  > The category of pairs admits a canonical symmetric monoidal structure. The tensor product of two pairs is given by the derived tensor product of the algebras together with the (q-1)-completed derived tensor product of the filtrations as filtered modules over the filtered coefficient ring. Furthermore, the q-Hodge complex functor into (q-1)-complete modules can be equipped with a canonical ...

- Proof of Proposition 3.7, The mechanism of the proof, which the node records as its steps.

  > Since localising is symmetric monoidal and passing to the zeroth filtration step is lax symmetric monoidal, we get a lax symmetric monoidal structure on the q-Hodge complex functor. Strict symmetric monoidality can then be checked modulo q-1 because the values are (q-1)-complete. ... we win since it's well-known that the Hodge-graded derived de Rham functor is symmetric monoidal.

### The conjugate filtration on the q-Hodge complex modulo q-1, and its associated graded

`HabiroCohomologyFoundations:HQ.3/the-conjugate-filtration` · *construction*

Let a pair be given. Localising the filtration at q-1 and completing gives the (q-1)-adic filtration on the q-Hodge complex. Before taking the colimit the diagram is a bifiltered object with one ascending filtration, given by the steps of the colimit, and one descending filtration, given by the filtration on each step. Passing to the associated graded in the descending direction exhibits the reduction of the q-Hodge complex modulo q-1 as the colimit of the associated graded pieces along multiplication by q-1, and this presentation is an exhaustive ascending filtration, the conjugate filtration. Its associated graded is the shifted derived de Rham forms, equivalently the associated graded of the Hodge filtration on the derived de Rham complex.

**Hypotheses.**

- The pair is an object of the category of the definition node.
- The two directions of the bifiltration must not be interchanged; the conjugate filtration is the ascending one.
- The identification of the associated graded uses clause (b) of the definition of a q-Hodge filtration.

**Proof outline.**

1. Localise the filtered module at q-1 and observe that after completing the filtration one obtains the (q-1)-adic filtration on the q-Hodge complex.
2. Regard the pre-colimit diagram as a bifiltered object and pass to the associated graded in the descending direction.
3. Define the conjugate filtration as the resulting exhaustive ascending filtration on the reduction modulo q-1.
4. Compute its associated graded through the graded presentation of the coefficient ring and the abstract colimit lemma of the next node, using that modding out the degree one generator gives the Hodge filtration and modding out the degree minus one generator gives the associated graded.

**Acceptance.**

- The bifiltration and the direction of each filtration are recorded.
- The identification of the associated graded is derived from the abstract lemma and clause (b), not asserted.
- The filtration is stated to be exhaustive.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`, `HabiroCohomologyFoundations:HQ.2/the-graded-presentation-of-the-coefficient-ring`, `HabiroCohomologyFoundations:HQ.3/the-abstract-colimit-filtration-lemma`

**API.**

| name | role | statement |
| --- | --- | --- |
| `conjugate-filtration` | constructor | An exhaustive ascending filtration on the reduction of the q-Hodge complex modulo q-1. |
| `associated-graded` | characterisation | Its associated graded is the shifted derived de Rham forms. |
| `bifiltration` | structure | The bifiltered object from which it is produced, with its ascending and descending directions named. |
| `monoidality` | compatibility | A lax symmetric monoidal structure compatible with the one on the q-Hodge complex modulo q-1, whose associated graded is the symmetric monoidal Hodge-graded de Rham functor. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — It is the case m equal to one of the ascending filtration in the descent theorem, and the proof of the general case is modelled on it.
- *HabiroCohomologyFoundations:HQ.3* — It is the vehicle for checking strict symmetric monoidality of the q-Hodge complex functor.

**Unit tests.**

- `associated-graded-in-degree-zero` — Its zeroth graded piece is the underlying algebra of the input, since the zeroth Hodge graded piece of the derived de Rham complex is the algebra itself.
- `exhaustiveness` — The colimit of the filtration is the whole reduction modulo q-1; a filtration that stopped at a finite stage would fail this for an algebra of positive dimension.
- `ascending-not-descending` — The conjugate filtration is ascending; reading it as descending would give the wrong associated graded, with the shifts in the opposite direction.
- `not-the-hodge-filtration` — The conjugate filtration is a filtration on the reduction of the q-Hodge complex modulo q-1, not on the de Rham complex; its graded pieces are the shifted forms and its underlying object is not the de Rham complex.

**Sources.**

- Paragraph 3.8, The construction of the conjugate filtration.

  > Before taking the colimit, the diagram can be regarded as a bifiltered object, with one ascending horizontal filtration given by the steps in the colimit and one descending vertical filtration given by the filtrations on each step. If we pass to the associated graded in the vertical direction, we obtain the q-Hodge complex modulo q-1 as the colimit of the graded pieces. This ...

- Lemma 3.9, Its associated graded.

  > The associated graded of the conjugate filtration on the q-Hodge complex modulo q-1 is the shifted derived de Rham forms, equivalently the associated graded of the Hodge filtration on the derived de Rham complex.

### One graded lemma produces both the conjugate filtration and the q-Witt filtration

`HabiroCohomologyFoundations:HQ.3/the-abstract-colimit-filtration-lemma` · *theorem*

Let M be a graded module over the graded ring obtained from A by adjoining a generator of degree one and a generator of degree minus one. Then the degree-zero part of the base change of M along inverting the degree one generator, taken modulo the product of the two generators, admits a canonical exhaustive ascending filtration whose associated graded is the quotient of M by both generators. The proof filters the localisation of the polynomial ring on the degree one generator by the powers of that generator, whose associated graded is the direct sum of shifted copies of A, and transports that filtration along the base change.

**Hypotheses.**

- M is an arbitrary graded module over the stated graded ring; no completeness or connectivity hypothesis is needed.
- The filtration produced is the one that the conjugate filtration and the q-Witt filtration both are, once the graded presentation of the coefficient ring is fixed.
- The same statement with q adjoined in degree zero gives the twisted case.

**Proof outline.**

1. Rewrite the degree-zero part of the localisation modulo the product of the generators as the degree-zero part of the base change of the quotient by the degree minus one generator.
2. Filter the localisation of the polynomial ring on the degree one generator by the ascending filtration whose terms are the shifted copies of that polynomial ring, with transition maps multiplication by the generator, and whose colimit is the localisation.
3. Base change M along that filtration and take degree-zero parts to obtain an exhaustive ascending filtration.
4. Compute the associated graded of the filtration on the polynomial ring as the direct sum of shifted copies of A, and deduce that the associated graded of the resulting filtration on M is the quotient of M by both generators.

**Acceptance.**

- The lemma is stated for an arbitrary graded module, so that it can be applied for every index m.
- The proof of the identification of the associated graded is recorded.
- The filtration produced is identified with the conjugate filtration by inspection, and that identification is recorded as part of the statement's use.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-graded-presentation-of-the-coefficient-ring`

**Sources.**

- Lemma 3.10, The statement of the node.

  > Let M be a graded module over the graded ring obtained by adjoining a degree one and a degree minus one generator. Then the degree-zero part of the base change of M along inverting the degree one generator, modulo the product of the two generators, admits a canonical exhaustive ascending filtration whose associated graded is the quotient of M by both generators.

- Proof of Lemma 3.10, The proof, which the node records as its steps.

  > Let the ascending filtration on the localisation of the polynomial ring on the degree one generator be the diagram of shifted copies with transition maps multiplication by that generator. Its colimit is the localisation. Since the associated graded is the direct sum of shifted copies of A, the associated graded of the filtration we've just constructed is the quotient by both generators.

### The p-adic twisted q-Hodge filtration, by recursion on the exponent

`HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-p-adically` · *construction*

Fix a prime p. For a pair of an animated A-algebra and a q-Hodge filtration, define filtrations on the p-completed twisted q-de Rham complexes of index p to the alpha by recursion on alpha. For alpha zero the twisted complex is the q-de Rham complex itself and the filtration is the given q-Hodge filtration, p-completed. For alpha at least one, rescale the filtration of the previous stage by the cyclotomic polynomial of order p to the alpha evaluated at q, meaning that the transition maps are multiplied by that polynomial, equip the previous twisted complex with the adic filtration for that polynomial, and take the pullback of filtered objects whose other leg is the Nygaard filtration of the current twisted complex mapping by the relative Frobenius into the rescaled previous one. The result is inductively a filtered module over the filtered ring given by the adic filtration for q to the p to the alpha minus one. Reducing the recursive square modulo that element recovers the pullback square relating the stupid and Nygaard filtrations, so the reduction of the twisted q-Hodge filtration is the stupid filtration on the p-completed q-de Rham-Witt complex. The construction is lax symmetric monoidal, and there are canonical maps from the filtration of index p to the alpha to that of index p to the alpha minus one, compatible with the relative Frobenius; after inverting p the filtration becomes the combined Hodge and cyclotomic-adic filtration, and after inverting p and completing at a lower cyclotomic polynomial the canonical maps become equivalences.

**Hypotheses.**

- p is fixed and the recursion is on the exponent alpha.
- Rescaling a filtration by a polynomial is restriction along the map of graded rings sending the filtration parameter to that polynomial times itself; it is lax symmetric monoidal but not symmetric monoidal.
- The Frobenius leg is a symmetric monoidal transformation, which is proved by quasi-syntomic descent to the case of a p-complete quasi-syntomic algebra with a surjection from a perfectoid-style polynomial algebra, where the filtrations are by ideals.

**Proof outline.**

1. Set the base case of the recursion to the p-completed given q-Hodge filtration.
2. Define the rescaling of a filtration by the cyclotomic polynomial, and record that in the graded presentation it is restriction along the map sending the filtration parameter to that polynomial times itself.
3. Form the pullback of filtered objects with legs the Nygaard filtration and the rescaled previous filtration, and equip the result with its filtered module structure over the adic filtration for q to the p to the alpha minus one.
4. Prove that reducing the square modulo that element gives the Hodge-against-Nygaard square, by induction on alpha and the Nygaard comparison, and deduce the identification of the reduction with the stupid filtration.
5. Equip the construction with a lax symmetric monoidal structure, using that the rescaling is lax symmetric monoidal and that the Frobenius leg is symmetric monoidal by quasi-syntomic descent.
6. Construct the canonical maps to the previous index and prove the two compatibility statements after inverting p.

**Acceptance.**

- The recursion, its base case and its inductive step are all written down.
- The rescaling is defined precisely and its monoidality is recorded as lax.
- The reduction modulo the cyclotomic element is identified with the Hodge-against-Nygaard square and hence with the stupid filtration.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.4/the-nygaard-filtration-on-q-de-rham-witt-complexes`, `HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard`, `HabiroCohomologyFoundations:HQ.4/twisted-q-de-rham-complexes`, `HabiroCohomologyFoundations:HQ.2/the-quotient-convention-for-filtered-modules`

**API.**

| name | role | statement |
| --- | --- | --- |
| `twisted-filtration-p-adic` | constructor | For each prime p and exponent alpha, a filtration on the p-completed twisted q-de Rham complex of index p to the alpha. |
| `recursion` | characterisation | The pullback square defining the filtration of index p to the alpha from that of index p to the alpha minus one and the Nygaard filtration. |
| `rescaling` | constructor | The rescaling of a filtration by a polynomial, as restriction along the map of graded rings sending the filtration parameter to that polynomial times itself. |
| `reduction` | compatibility | Its reduction modulo the cyclotomic element is the stupid filtration on the p-completed q-de Rham-Witt complex. |
| `transition` | data | The canonical map to the filtration of index p to the alpha minus one, compatible with the relative Frobenius. |
| `rational-description` | equivalence | After inverting p, the filtration is the combined Hodge and cyclotomic-adic filtration on an Adams-twisted de Rham complex. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — It is the p-complete input to the global twisted q-Hodge filtration.
- *HabiroCohomologyFoundations:HQ.3* — Its reduction is what makes the descent theorem's identification of associated gradeds come out as the q-de Rham-Witt forms.

**Unit tests.**

- `base-case` — For exponent zero the filtration is the p-completion of the given q-Hodge filtration.
- `reduction-to-the-stupid-filtration` — Reducing modulo the cyclotomic element gives the stupid filtration; a construction that produced the Nygaard filtration instead would fail this.
- `rescaling-is-not-monoidal` — The rescaling functor is lax symmetric monoidal but not symmetric monoidal; this is why the whole construction is only lax.
- `after-inverting-p` — After inverting p the filtration is the combined Hodge and cyclotomic-adic filtration, which is the hypothesis clause (c_p) of the q-Hodge filtration supplies.

**Sources.**

- Paragraph 3.32, The recursive construction.

  > Let's first construct the filtration for prime powers and after p-completion. We'll use a recursive definition. For exponent zero the twisted complex is just the q-de Rham complex and we choose the given q-Hodge filtration. For exponent at least one, we consider the rescaling of the previous filtration by the cyclotomic polynomial and take the pullback whose other leg is the Nygaard ...

- Remark 3.33, The reduction of the recursion.

  > If we reduce the pullback diagram above modulo the cyclotomic element we obtain the pullback diagram of the Hodge-against-Nygaard lemma. It follows that the twisted q-Hodge filtration modulo that element is the stupid filtration on the p-completed q-de Rham-Witt complex.

- Paragraph 3.34 and Lemmas 3.36, 3.37, The monoidality and the two compatibility statements.

  > The functor comes equipped with a canonical lax symmetric monoidal structure. The Frobenius becomes a symmetric monoidal transformation by quasi-syntomic descent. The rescaling functor is lax symmetric monoidal. After inverting p there is a canonical equivalence with the combined Hodge and cyclotomic-adic filtration, and the canonical maps become equivalences after inverting p and ...

### The global twisted q-Hodge filtration, glued along a fracture square

`HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-globally` · *construction* · planet **Twisted q-Hodge filtration**

Fix m and a non-zero integer N divisible by m. Using the animated fracture square for the m-th twisted q-de Rham complex, put on each factor a filtration: on the factors obtained by inverting N, the base-changed q-Hodge filtration along the relevant Adams operation, completed at the relevant cyclotomic polynomial; on the p-completed and p-inverted factors, again the base-changed q-Hodge filtration; and on the p-complete factors, the base change of the p-adic twisted q-Hodge filtration of the previous node. Each of these is a module over the filtered ring given by the adic filtration for q^m-1. The first two agree by inspection; the first and the third agree because, after reduction to a prime power by base change, both are identified with the combined Hodge and cyclotomic-adic filtration, by the two compatibility lemmas of the previous node together with the axioms of a q-Hodge filtration. The choice of N is irrelevant, because enlarging N adds only factors on which the iterated Frobenius is the identity and the filtration is the base-changed q-Hodge filtration; letting N run through a totally ordered cofinal subset and taking the limit gives a canonical construction. The result is lax symmetric monoidal in the pair, and its reduction modulo q^m-1 is the stupid filtration on the m-truncated derived q-de Rham-Witt complex. For n dividing m there are canonical maps to the filtration of index n, obtained by projecting to the factors indexed by divisors of n and applying the transition maps of the previous node; these assemble into a symmetric monoidal transformation of lax symmetric monoidal functors.

**Hypotheses.**

- m is a positive integer and N a non-zero multiple of it; the construction is then shown to be independent of N.
- The compatibility of the p-complete and the rational filtrations uses clause (c_p) of the definition of a q-Hodge filtration and the two lemmas of the previous node.
- The individual transition maps are constructed; the full functoriality over the divisibility poset is not, and is not needed because limits over that poset may be computed along the factorials.

**Proof outline.**

1. Write the animated fracture square for the m-th twisted complex with the chosen N.
2. Put the three families of filtrations on the three families of factors, and record that each is a module over the filtered ring for q^m-1.
3. Check compatibility of the rational and the p-inverted factors by inspection.
4. Check compatibility of the p-complete and the p-inverted factors by base change to the prime power case and the two compatibility lemmas, identifying both with the combined Hodge and cyclotomic-adic filtration.
5. Check independence of N by comparing the fracture squares for N and a multiple, noting that the additional primes do not divide m so the iterated Frobenii are identities.
6. Take the limit over a cofinal totally ordered family of N to get a canonical construction, and record lax symmetric monoidality and the transition maps.

**Acceptance.**

- All three families of filtrations are named and their pairwise compatibilities are proved, not assumed.
- Independence of N is proved and the canonical form of the construction is recorded.
- The reduction modulo q^m-1 is identified with the stupid filtration on the derived q-de Rham-Witt complex.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-p-adically`, `HabiroCohomologyFoundations:HQ.4/twisted-q-de-rham-complexes`, `HabiroCohomologyFoundations:HQ.4/the-twisted-complex-deforms-the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`

**API.**

| name | role | statement |
| --- | --- | --- |
| `twisted-filtration` | constructor | For each positive integer m, a filtration on the m-th twisted q-de Rham complex, functorial in the pair. |
| `gluing` | characterisation | The fracture square with the three families of filtrations, as the characterisation of the object. |
| `independence-of-n` | characterisation | The construction does not depend on the auxiliary integer N. |
| `reduction` | compatibility | Its reduction modulo q^m-1 is the stupid filtration on the m-truncated derived q-de Rham-Witt complex. |
| `transition` | data | For n dividing m, a canonical map to the filtration of index n, forming a symmetric monoidal transformation. |
| `lax-monoidality` | compatibility | The functor is lax symmetric monoidal in the pair. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The m-truncated Habiro descent is defined by adjoining this filtration divided by powers of q^m-1.
- *HabiroCohomologyFoundations:HQ.3* — Its reduction is what identifies the graded pieces in the descent theorem with the q-de Rham-Witt forms.

**Unit tests.**

- `index-one` — For m equal to one the twisted complex is the q-de Rham complex and the filtration is the given q-Hodge filtration.
- `reduction` — Its reduction modulo q^m-1 is the stupid filtration on the derived q-de Rham-Witt complex, whose n-th graded piece is the n-th derived q-de Rham-Witt form.
- `independence-of-the-auxiliary-integer` — The filtrations built with N and with a multiple of N agree; a construction that depended on N would not be canonical.
- `not-a-filtration-over-the-q-minus-one-adic-ring` — For m greater than one the filtration is a module over the filtered ring for q^m-1 and not over the one for the q-integer of m; this is exactly why the naive Habiro descent of the q-de Rham complex does not exist.

**Sources.**

- Paragraph 3.38, The construction and the three families of filtrations.

  > Choose N non-zero divisible by m. Using the animated version of the fracture square we obtain a pullback diagram. To construct the twisted filtration we'll equip each factor of the pullback with a filtration and then check that these filtrations are compatible: on the rational factors the base-changed q-Hodge filtration; on the p-adic rational factors again the base-changed q-Hodge ...

- Paragraph 3.38, later, The independence of N.

  > Let us now argue that the choice of N is irrelevant. ... Note that for any such prime we also have that it does not divide m, so each iterated Frobenius is the identity. ... To get a canonical construction, we can let N vary through a totally ordered initial sub-poset and then take the limit.

- Proposition 3.39, The identification of the reduction.

  > For all m, the equivalence between the twisted complex modulo q^m-1 and the derived q-de Rham-Witt complex upgrades canonically to an equivalence of filtered modules from the twisted q-Hodge filtration modulo q^m-1 onto the stupid filtration on the derived q-de Rham-Witt complex.

### Adjoining the twisted filtration divided by powers of q^m-1, and its compatibility in m

`HabiroCohomologyFoundations:HQ.3/the-m-truncated-descent` · *construction*

For each m define the m-th partial descent as the (q^m-1)-completion of the colimit of the twisted q-Hodge filtration along multiplication by q^m-1; informally, it is obtained from the m-th twisted q-de Rham complex by adjoining the i-th filtration step divided by the i-th power of q^m-1 for all i at least one. For every divisor n of m the transition map induces an equivalence from the (q^n-1)-completion of the m-th partial descent onto the n-th; in particular the m-th partial descent is a descent of the q-Hodge complex along the map from the polynomial ring in q completed at q^m-1 to the power series ring in q-1. The proof uses the computation that adjoining the Nygaard filtration divided by powers of the cyclotomic polynomial recovers the p-completed q-de Rham complex, while adjoining it divided by powers of q to the p minus one gives zero, since it inverts q-1 in a (q-1)-complete object.

**Hypotheses.**

- The pair is an object of the category of the definition node; m and n are positive integers with n dividing m.
- The completions are at q^m-1 and q^n-1 respectively, and the colimit is taken before completing.
- The denominator computation distinguishes the cyclotomic polynomial from q to the p minus one; using the wrong one makes the statement false.

**Proof outline.**

1. Define the partial descent as the completed colimit along multiplication by q^m-1.
2. Prove the denominator lemma: adjoining the Nygaard filtration divided by powers of the cyclotomic polynomial recovers the p-completed q-de Rham complex, and dividing instead by powers of q to the p minus one gives zero.
3. Use the fracture square and the denominator lemma to compare the m-th and the n-th partial descents after completing at q^n-1.
4. Conclude that the transition map is an equivalence and that the m-th partial descent is a descent of the q-Hodge complex.

**Acceptance.**

- The informal description by adjoining divided filtration steps is matched with the formal colimit definition.
- The denominator lemma is stated with both cases, including the one that vanishes.
- The descent claim names the map along which the descent takes place.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-globally`, `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`, `HabiroCohomologyFoundations:HQ.4/the-nygaard-filtration-on-q-de-rham-witt-complexes`

**API.**

| name | role | statement |
| --- | --- | --- |
| `partial-descent` | constructor | For each positive integer m, a (q^m-1)-complete module over the polynomial ring in q, functorial in the pair. |
| `compatibility` | characterisation | For n dividing m, the (q^n-1)-completion of the m-th partial descent is the n-th. |
| `index-one` | example | For m equal to one the partial descent is the q-Hodge complex. |
| `denominators` | relation | The denominator lemma distinguishing division by the cyclotomic polynomial from division by q to the p minus one. |
| `lax-monoidality` | compatibility | Each partial descent is lax symmetric monoidal in the pair, compatibly with the transition equivalences. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The Habiro-Hodge complex is the limit over m of the partial descents.
- *HabiroCohomologyFoundations:HQ.3* — The ascending filtration of the descent theorem is read off from the partial descent modulo q^m-1.

**Unit tests.**

- `index-one` — For m equal to one the partial descent is the q-Hodge complex, since the twisted complex is the q-de Rham complex and the filtration is the given one.
- `divisor-compatibility` — For n dividing m the (q^n-1)-completion of the m-th partial descent is the n-th; a construction without the denominator lemma would not satisfy this.
- `the-wrong-denominator-vanishes` — Adjoining the Nygaard filtration divided by powers of q to the p minus one gives zero; this non-example shows that the choice of denominator is not a matter of convention.
- `completeness` — Each partial descent is (q^m-1)-complete by construction, so the limit over m is Habiro-complete.

**Sources.**

- Paragraph 3.42, The construction and the informal description.

  > For all m we consider the (q^m-1)-completion of the colimit of the twisted q-Hodge filtration along multiplication by q^m-1. We'll informally write this as the twisted complex with the i-th filtration step divided by the i-th power of q^m-1 adjoined, and we'll say that the partial descent is given by adjoining the rescaled filtration.

- Proposition 3.43, The compatibility statement.

  > Let m be a positive integer. For all divisors n of m, the transition map induces an equivalence from the (q^n-1)-completion of the m-th partial descent onto the n-th. In particular the m-th partial descent is a descent of the q-Hodge complex along the map from the polynomial ring in q completed at q^m-1 to the power series ring in q-1.

- Lemma 3.44, The denominator lemma with both cases.

  > The relative Frobenius induces functorial equivalences: adjoining the Nygaard filtration divided by the powers of the cyclotomic polynomial to the p-completed twisted complex of index p gives the p-completed q-de Rham complex; and adjoining it divided by the powers of q to the p minus one gives the p-completed q-de Rham complex with q-1 inverted, which is zero.

### The Habiro-Hodge complex, and the symmetric monoidality of the descent

`HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex` · *construction* · planet **Habiro-Hodge complex**

The Habiro-Hodge complex of a pair is the limit over the positive integers, ordered by divisibility, of the partial descents. Because each partial descent is complete at the corresponding element and the transition maps are the completion equivalences, the limit is Habiro-complete, and its (q-1)-completion is the q-Hodge complex. The construction carries a lax symmetric monoidal structure compatible with the one on the q-Hodge complex, obtained as in the monoidality proof for the q-Hodge complex, and that lax structure is in fact strict: the functor into the Habiro-complete objects is symmetric monoidal.

**Hypotheses.**

- The pair is an object of the category of the definition node.
- The limit may be computed along the cofinal sequence of factorials, which is why only the individual transition maps are needed.
- Habiro-completeness is in the sense of the coefficient roadmap, namely the limit over m of the completions at q^m-1.

**Proof outline.**

1. Form the limit of the partial descents along the divisibility poset, or equivalently along the factorials.
2. Check Habiro-completeness and that the (q-1)-completion recovers the q-Hodge complex, using the compatibility of the partial descents.
3. Transport the lax symmetric monoidal structure from the partial descents, using that the transition equivalences are monoidal.
4. Upgrade lax to strict symmetric monoidality, by the same reduction as for the q-Hodge complex: check modulo the cyclotomic elements, where the associated gradeds are the symmetric monoidal q-de Rham-Witt forms.

**Acceptance.**

- The limit is over the divisibility poset and its computation along the factorials is recorded.
- The relation to the q-Hodge complex is stated as a (q-1)-completion.
- Strict monoidality is proved and not merely asserted.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/the-m-truncated-descent`, `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`, `HabiroCohomologyFoundations:HQ.3/the-symmetric-monoidal-structure-on-pairs`, `HabiroRings:HR.2/habiro-complete-modules`, `HabiroRings:HR.2/the-monoidal-structure`

**API.**

| name | role | statement |
| --- | --- | --- |
| `habiro-hodge-complex` | constructor | For a pair, a Habiro-complete object of the derived category of the polynomial ring in q over A. |
| `recovers-the-q-hodge-complex` | projection | Its (q-1)-completion is the q-Hodge complex. |
| `partial-descents` | characterisation | Its completions at q^m-1 are the partial descents. |
| `monoidality` | compatibility | The functor into Habiro-complete objects is symmetric monoidal. |
| `functoriality` | functoriality | It is a functor on the category of pairs, natural in the base Lambda-ring. |

**Used by.**

- *HabiroRings:HR.6* — In degree zero, for finite etale inputs, it is the relative Habiro ring of that roadmap.
- *HabiroCohomologyFoundations:HQ.5* — Its sheafified form on a smooth scheme is algebraic Habiro cohomology.
- *HabiroCohomologyFoundations:HQ.2* — Its decalage at q-1 is a Habiro descent of the underived q-de Rham complex for smooth inputs.

**Unit tests.**

- `etale-input` — For an etale A-algebra the Habiro-Hodge complex is the relative Habiro ring of the coefficient roadmap.
- `q-minus-one-completion` — Its (q-1)-completion is the q-Hodge complex; a construction that returned the q-de Rham complex instead would fail this.
- `smooth-cohomology` — For a smooth algebra with a chosen filtration, the cohomology of its reduction modulo q^m-1 is the m-truncated q-de Rham-Witt complex, as a graded algebra when the input is at least homotopy-unital.
- `not-a-descent-of-the-q-de-rham-complex` — The Habiro-Hodge complex descends the q-Hodge complex and not the q-de Rham complex; the latter admits a descent only after applying the decalage functor, and only for smooth inputs.

**Sources.**

- Paragraph 3.45, The definition and the lax structure.

  > Let a pair be given. We define the Habiro-Hodge complex of R over A to be the limit over the positive integers of the partial descents. The same argument as in the proof of the monoidality of the q-Hodge complex allows us to equip the partial descents with a lax symmetric monoidal structure, and the compatibility equivalences are compatible with it.

- Lemma 3.46, Strict monoidality.

  > The lax symmetric monoidal functor sending a pair to its Habiro-Hodge complex is, in fact, symmetric monoidal.

### The descent theorem: a symmetric monoidal factorisation, and the q-de Rham-Witt graded pieces

`HabiroCohomologyFoundations:HQ.3/habiro-descent` · *theorem* · planet **Habiro descent**

Let A be a perfectly covered Lambda-ring. (a) The q-Hodge complex functor from the category of pairs to (q-1)-complete objects admits a symmetric monoidal factorisation through the Habiro-complete objects of the derived category of the polynomial ring in q over A, along the (q-1)-completion functor; the lift is the Habiro-Hodge complex. (b) For every positive integer m the quotient of the Habiro-Hodge complex by q^m-1 admits an exhaustive ascending filtration whose associated graded is the shifted derived m-truncated q-de Rham-Witt forms; that filtration carries a canonical lax symmetric monoidal structure compatible with the one on the quotient, and the identification of associated gradeds is an equivalence of lax symmetric monoidal functors.

**Hypotheses.**

- A is a perfectly covered Lambda-ring; R ranges over animated A-algebras equipped with a q-Hodge filtration.
- The factorisation is through the Habiro-complete objects, which is a proper subcategory of the (q-1)-complete ones; the factorisation is non-trivial precisely because of that.
- In (b) the graded pieces are the derived q-de Rham-Witt forms, shifted; for smooth inputs they agree with the underived ones by the smooth comparison, but in general they do not.

**Proof outline.**

1. Construct the twisted q-de Rham complexes and their Nygaard filtrations, and prove that the twisted complexes deform the q-de Rham-Witt complexes.
2. Construct the twisted q-Hodge filtration, p-adically by recursion and globally by gluing, and prove that its reduction modulo q^m-1 is the stupid filtration on the derived q-de Rham-Witt complex.
3. Form the partial descents and prove that they are compatible under completion, so that their limit is the Habiro-Hodge complex; this proves (a) apart from monoidality.
4. Prove strict symmetric monoidality of the lift.
5. For (b), argue as for the conjugate filtration: the reduction of the partial descent modulo q^m-1 is the colimit of the graded pieces of the twisted q-Hodge filtration, which is an exhaustive ascending filtration, and compute its associated graded by the abstract colimit lemma in the graded presentation with q in degree zero.
6. Record the lax monoidality statements, which are formal once the corresponding statements for the filtration are known.

**Acceptance.**

- Clause (a) states a factorisation through the Habiro-complete objects and calls it non-trivial.
- Clause (b) states an ascending filtration and the identification of its associated graded, not an unfiltered isomorphism with a q-Witt complex.
- The derived q-de Rham-Witt forms appear, with their shift, and the smooth comparison is cited separately.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex`, `HabiroCohomologyFoundations:HQ.3/the-m-truncated-descent`, `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-globally`, `HabiroCohomologyFoundations:HQ.3/the-conjugate-filtration`, `HabiroCohomologyFoundations:HQ.3/the-abstract-colimit-filtration-lemma`, `HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard`, `HabiroCohomologyFoundations:HQ.4/the-twisted-complex-deforms-the-q-de-rham-witt-complex`

**Sources.**

- Theorem 3.11, Both clauses of the theorem.

  > Let A be a perfectly covered Lambda-ring and let the category of pairs be as above. (a) The q-Hodge complex functor admits a symmetric monoidal factorisation through the Habiro-complete objects of the derived category of the polynomial ring in q over A, along the (q-1)-completion. (b) For all m, the quotient of the lift by q^m-1 admits an exhaustive ascending filtration with associated ...

- Theorem 1.11, The introduction's form, which records that the factorisation is non-trivial.

  > The q-Hodge complex functor admits a non-trivial symmetric monoidal factorisation through the Habiro-complete objects.

### The framed q-Hodge filtration, its explicit Koszul descent, and the etale specialisation

`HabiroCohomologyFoundations:HQ.3/the-coordinate-model-and-the-etale-case` · *comparison*

Let S be smooth over A with an etale framing in n coordinates. The formula assigning to a filtration degree the (q-1)-power indexed by the positive part of that degree minus the form degree, applied to the coordinate-dependent q-de Rham complex, defines a filtration; pulling it back along the map from the derived complex gives a q-Hodge filtration, so the framed pair is an object of the category of pairs, with an algebra structure for the trivial operad. Its q-Hodge complex is the coordinate-dependent q-Hodge complex, in which every q-differential is multiplied by q-1. Its Habiro-Hodge complex has an explicit model: equip the polynomial ring in the coordinates with the toric Lambda-structure in which the Adams operations raise each coordinate to the corresponding power, form the relative Habiro ring of S over that polynomial ring, extend to it the endomorphism scaling the i-th coordinate by q, which exists uniquely on each factor of the equaliser presentation by the lifting property of formally etale maps and is congruent to the identity modulo the i-th coordinate, and take the Koszul complex of the commuting operators obtained by subtracting the identity and dividing by the coordinate. If S is etale over A the Habiro-Hodge complex is the relative Habiro ring of S over A itself.

**Hypotheses.**

- S is smooth over A with a chosen etale framing; the filtration and the model both depend on the framing, although the cohomology of the reduction modulo q^m-1 does not.
- The toric Lambda-structure on the polynomial ring is the one in which the Adams operations raise each coordinate to the corresponding power.
- The etale case is a specialisation, and the identification with the relative Habiro ring is as E-infinity algebras over the Habiro ring.

**Proof outline.**

1. Define the framed filtration by the displayed formula and check the analogues of the four clauses on the level of complexes, then pull back along the map from the derived complex.
2. Identify the associated q-Hodge complex with the coordinate-dependent one, using that the framed filtration is already complete.
3. Construct the coordinate-scaling automorphisms of the relative Habiro ring factor by factor, using the unique lifting property of formally etale maps, and check that each is congruent to the identity modulo its coordinate.
4. Form the Koszul complex of the resulting commuting operators and identify it with the Habiro-Hodge complex by unravelling the descent.
5. For the etale case, combine the smooth derived-to-underived comparison with the descent theorem and the q-Witt identification to see that the reductions modulo q^m-1 agree, then lift the identification uniquely by the deformation theory of etale extensions and check compatibility in m.

**Acceptance.**

- The framed filtration is given by an explicit formula.
- The explicit Koszul model is described with the construction of the scaling operators and the reason they exist.
- The etale identification is proved through the reductions and the uniqueness of etale deformations, not asserted.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/habiro-descent`, `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex`, `HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard`, `HabiroRings:HR.5/the-relative-habiro-ring`, `HabiroRings:HR.5/the-equaliser-presentation`, `HabiroRings:HR.6/the-degree-zero-identification`

**Sources.**

- Example 3.12, The framed filtration, its q-Hodge complex and the explicit Koszul model.

  > If S is smooth over A and a framing is given, then we can define a filtration on the coordinate-dependent q-de Rham complex whose n-th step is the (q-1)-power indexed by the maximum of n minus the form degree and zero. ... The derived q-Hodge complex associated to this pair is the coordinate-dependent q-Hodge complex. ... Letting the operators be the coordinate scaling minus the identity ...

- Corollary 3.13, The etale specialisation.

  > If R is etale over A, then the Habiro-Hodge complex is the relative Habiro ring constructed in the coefficient roadmap.

### Operadic and derived commutative upgrades of the descent, and the differential on cohomology

`HabiroCohomologyFoundations:HQ.3/multiplicative-upgrades` · *theorem*

Suppose the q-Hodge filtration of a pair carries the structure of an algebra over the little n-discs operad in filtered modules over the filtered coefficient ring, compatibly with the algebra structure on the derived q-de Rham complex and with all the data of the definition. Then the Habiro-Hodge complex is an algebra over that operad in the Habiro-complete objects, the ascending filtration on its reduction modulo q^m-1 is a filtered algebra over it, and the identification of associated gradeds is a graded monoidal equivalence. The same holds with filtered derived commutative algebra structures in place of operadic ones, and then the associated graded is a derived differential graded algebra. For smooth S the ascending filtration is the Whitehead filtration of the reduction modulo q^m-1; the identification becomes an isomorphism of graded modules from the cohomology of that reduction onto the m-truncated q-de Rham-Witt complex, an isomorphism of graded algebras as soon as the pair is at least a homotopy-unital algebra; and the canonical differential on the q-de Rham-Witt complex corresponds to the Bockstein differential.

**Hypotheses.**

- The multiplicative hypothesis is on the filtration together with all the coherence data of the definition, not merely on the underlying complex.
- The smooth clauses require S smooth over A and a chosen q-Hodge filtration.
- The identification of the differential with the Bockstein is part of the statement and fixes the differential on the q-Witt side.

**Proof outline.**

1. Deduce the operadic transport from the symmetric monoidality of the descent functor and the lax symmetric monoidality of the filtration.
2. Deduce the derived commutative transport in the same way, using that the stupid filtration on the q-de Rham-Witt complexes carries a filtered derived commutative structure and that the derived q-de Rham complex carries a derived commutative structure.
3. For smooth S, identify the ascending filtration with the Whitehead filtration by comparing associated gradeds, using that the derived q-de Rham-Witt forms are shifted underived forms.
4. Read off the isomorphism on cohomology and upgrade it to an algebra isomorphism under the homotopy-unitality hypothesis.
5. Identify the differential with the Bockstein by transporting the derived differential graded structure.

**Acceptance.**

- Every upgrade carries the hypothesis that the input already has the structure.
- The smooth clauses are stated separately and carry the smoothness hypothesis.
- The Bockstein identification is stated and is what fixes the differential.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/habiro-descent`, `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex`, `HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard`, `HabiroCohomologyFoundations:HQ.1/the-derived-commutative-lift`

**Sources.**

- Paragraph 3.50 and Paragraph 3.51, The two transport statements with their hypotheses.

  > Suppose that the q-Hodge filtration can be equipped with the structure of an algebra over the little n-discs operad in filtered modules, compatible with the structure on the derived q-de Rham complex, and that the data of the definition can be made compatible. Then the Habiro-Hodge complex becomes such an algebra. Similarly, suppose the filtration can be equipped with the structure of a ...

- Corollary 3.54, The three smooth clauses.

  > Let a pair be given with S smooth over A. Then the ascending filtration is the Whitehead filtration of the reduction modulo q^m-1; the identification becomes an isomorphism of graded modules from the cohomology onto the m-truncated q-de Rham-Witt complex, and an isomorphism of graded algebras as soon as the pair is at least a homotopy-unital algebra; and the canonical differential ...

## HQ.4 — q-Witt and cyclotomic descent

**There are no restriction operators**, and the reason is proved: one would
induce a map `R[ζ_m] → R[ζ_d]`, which does not exist. So there is no untruncated
q-Witt ring. What replaces them is the observation that **Langer–Zink's universal**
**property never uses the restrictions either**, which yields a comparison
`W_{α+1}Ω → qW_{p^α}Ω` compatible with `F` and `V`.

The positive-degree complex is the initial q-V-system, and carries a *unique*
q-FV-structure. The relation `V∘F = [m/d]_{q^d}` is the q-deformed one; `F∘V` is
the integer `m/d`. Ghost maps exist for every divisor; they are an isomorphism
**after inverting m** and injective only under the actual torsion hypotheses.

Twisted complexes `qΩ^(m)` are glued from décalage twists by the **p-adic**
**Frobenii** — global Adams operations do not exist, already for étale inputs.
Their naive limit is **not** a Habiro descent. The Nygaard filtration is the
auxiliary object through which the twisted q-Hodge filtration is defined, and
Lemma 3.30 relates it to the stupid filtration by a pullback square.

A descended complex is not a family of cohomology groups: the q-Witt paper's
Theorem 5.1 shows the cohomology-level statement is **impossible** functorially.

Coverage: **source_decomposed**.

Thirteen nodes, decomposed from the companion q-Witt paper together with the Nygaard subsection of the main source. The three categories of systems of differential graded algebras with all their axioms; the proof that no restriction operator exists and the observation that Langer and Zink's universal property survives the deletion of restrictions, which is what produces the comparison with ordinary de Rham-Witt complexes; the q-de Rham-Witt complex as the initial object with its two universal properties; the ghost maps with the exact torsion hypotheses their injectivity needs; etale base change and the sheaf property; the p-completion; the twisted q-de Rham complexes with their fracture square and transition maps; their reduction modulo the deformation parameter; the Nygaard filtration with its comparison, its fibre sequences and its descent; the Hodge-against-Nygaard square with the smooth derived-to-underived comparison; the cyclotomic descent with the distinction between a descended complex and a family of cohomology groups; and the discipline that multiplicative structure is carried and never created.

### q-V-systems of commutative differential graded algebras, and the torsion-free variant

`HabiroCohomologyFoundations:HQ.4/q-v-systems-of-differential-graded-algebras` · *definition* · planet **q-V-system**

Fix a base Lambda-ring A and an A-algebra R. A q-V-system of differential graded A-algebras over R is a family, indexed by the positive integers m, of commutative differential graded algebras over the polynomial ring in q over A, together with: for each m an algebra map from the degree-zero relative q-Witt ring of R over A into the degree-zero part of the m-th member; and for each pair of divisors d dividing m a map of graded modules, the Verschiebung from the d-th to the m-th member, compatible with the Verschiebungen of the relative q-Witt rings, transitive along chains of divisors, and satisfying that the Verschiebung of a product of a form and the differential of another form is the product of their Verschiebungen with the differential. In addition the V-Teichmueller condition is imposed: for divisors d dividing m, a form over the d-th member and an element r of R, the product of the Verschiebung of the form with the differential of the m-th Teichmueller lift of r equals the Verschiebung of the form times the (m/d-1)-st power of the d-th Teichmueller lift, multiplied by the differential of the Verschiebung of that Teichmueller lift. A torsion-free q-V-system is the same data on degreewise integrally torsion-free members, and then the V-Teichmueller condition is automatic, because it always holds up to torsion by the (m/d-1)-st power of m/d. In any q-V-system the Verschiebung indexed by n satisfies that its composite after the differential is n times the differential after it; and the composite from the q-Witt ring to degree one is a V-divided-power derivation, which for a prime factor p satisfies that the differential of the Verschiebung of a p-th power equals the Verschiebung of the (p-1)-st power times the differential of the Verschiebung.

**Hypotheses.**

- A is a Lambda-ring and R an A-algebra; no smoothness is assumed for the definition.
- The degree-zero relative q-Witt rings and their Verschiebungen are imported from HabiroRings HR.4 and are not defined here.
- There are no restriction maps in the data, and none can be added; this is the subject of a separate node.

**Proof outline.**

1. List the two pieces of structure: the map out of the q-Witt ring in degree zero, and the Verschiebungen for each pair of divisors.
2. Impose transitivity of the Verschiebungen and their compatibility with the q-Witt Verschiebungen.
3. Impose the product rule relating the Verschiebung of a product with a differential to the product of Verschiebungen.
4. Impose the V-Teichmueller condition, and record that on torsion-free members it is automatic.
5. Derive the two consequences: the commutation rule between the differential and the Verschiebung with its factor n, and the V-divided-power property of the composite into degree one.

**Acceptance.**

- The data and the axioms are listed in full, with the V-Teichmueller condition written out.
- The absence of restriction maps is explicit in the data.
- The torsion-free variant is defined and its relation to the general one recorded as a fully faithful inclusion.

**Prerequisites.** `HabiroRings:HR.4/relative-q-witt-rings`, `HabiroRings:HR.4/there-is-no-restriction-map`, `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`

**API.**

| name | role | statement |
| --- | --- | --- |
| `q-v-system` | structure | The category of q-V-systems of differential graded A-algebras over R, with its objects and morphisms. |
| `degree-zero-map` | data | For each m, the algebra map from the relative q-Witt ring into degree zero of the m-th member. |
| `verschiebung` | data | For each pair of divisors, the Verschiebung, with its transitivity and its product rule. |
| `teichmueller-condition` | relation | The V-Teichmueller condition, as an identity between the two sides named in the statement. |
| `d-after-v` | relation | The relation that the Verschiebung indexed by n intertwines the differential up to the factor n. |
| `torsion-free-inclusion` | functoriality | The forgetful functor from torsion-free q-V-systems is fully faithful. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.4* — The q-de Rham-Witt complex is defined as the initial object of this category, so the axioms are exactly what its universal property quantifies over.
- *HabiroCohomologyFoundations:HQ.4* — The ghost system is shown to be a q-V-system, which is how the ghost maps are constructed.

**Unit tests.**

- `the-ghost-system` — The family of products over divisors d of m of the de Rham complex base-changed along the d-th Adams operation, with d-th roots of unity adjoined, is a q-V-system with Verschiebung given in degree i by multiplication by the (i+1)-st power of m/n on the matching factor and zero elsewhere.
- `m-equals-one` — For m equal to one the member is the ordinary de Rham complex of R over A and all Verschiebungen are identities.
- `the-factor-in-d-after-v` — The relation between the differential and the Verschiebung carries the factor n; a definition omitting it would already fail on the ghost system, where the Verschiebung multiplies by the (i+1)-st power rather than the i-th.
- `no-restrictions` — The data contain no map from the m-th member to the d-th for d dividing m other than the Frobenius of the next node; a definition that added restrictions would have no examples.

**Sources.**

- Definition 3.1, The definition of the node, in the source's own terms.

  > A q-V-system of differential graded A-algebras over R is a system of commutative differential graded algebras over the polynomial ring in q over A equipped with: for all m, an algebra morphism from the relative q-Witt ring into the degree-zero part; and for all divisors d of m, a morphism of graded modules from the d-th to the m-th member, compatible with the Verschiebungen on relative ...

- Definition 3.9 and Remark 3.10, The torsion-free variant and why its axiom list is shorter.

  > A torsion-free q-V-system is a system of degreewise integrally torsion-free differential graded algebras with the structure of a q-V-system minus the V-Teichmueller condition. Every torsion-free q-V-system is also a q-V-system: in general the V-Teichmueller condition always holds up to torsion, so it's automatically true in the torsion-free case.

- Lemma 3.2 and Lemma 3.4, The two derived properties the node records.

  > In any q-V-system the Verschiebungen satisfy that V_n after the differential is n times the differential after V_n. For any q-V-system the composite from the q-Witt ring into degree one is a V-PD-derivation; in fact for any prime factor p the differential of the Verschiebung of a p-th power is the Verschiebung of the (p-1)-st power times the differential of the Verschiebung.

### q-FV-systems: the Frobenius operators and the relations they satisfy

`HabiroCohomologyFoundations:HQ.4/q-fv-systems` · *definition* · planet **q-FV-system**

A q-FV-system over R is a q-V-system together with, for each pair of divisors d dividing m, a morphism of graded algebras from the m-th member to the d-th, the Frobenius, compatible with the Frobenius maps on q-Witt vectors, transitive along chains of divisors, and satisfying: the Frobenius after the differential after the Verschiebung is the differential; the Verschiebung of a product of a form with the Frobenius of another equals the Verschiebung of the first times the second; the Frobenius indexed by n commutes with the Verschiebung indexed by k whenever n and k are coprime; the Frobenius after the Verschiebung is multiplication by m/d; and the Verschiebung after the Frobenius is multiplication by the q-integer of m/d evaluated at the d-th power of q. In addition the F-Teichmueller condition is imposed: the Frobenius of the differential of the m-th Teichmueller lift of an element r equals the (m/d-1)-st power of the d-th Teichmueller lift times its differential. In any q-FV-system the Frobenius intertwines the differential in the mirror way to the Verschiebung.

**Hypotheses.**

- The underlying q-V-system is as in the previous node.
- The Frobenius maps are maps of graded algebras, not merely of graded modules, in contrast with the Verschiebungen.
- The last relation is the q-deformed one: the Verschiebung after the Frobenius is the q-integer of m/d at the d-th power of q, not the integer m/d.

**Proof outline.**

1. Add the Frobenius maps to the data of a q-V-system with their transitivity and compatibility with the q-Witt Frobenius.
2. Impose the four relations with the Verschiebung, including the coprime commutation.
3. Impose the two multiplication relations, taking care that the composite in one order is an integer and in the other a q-integer.
4. Impose the F-Teichmueller condition.
5. Record the resulting category and the forgetful functor to q-V-systems.

**Acceptance.**

- Every relation is listed, and the asymmetry between the integer m/d and the q-integer of m/d is explicit.
- The Frobenius is recorded as a map of graded algebras while the Verschiebung is only a map of graded modules.
- The F-Teichmueller condition is written out.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/q-v-systems-of-differential-graded-algebras`

**API.**

| name | role | statement |
| --- | --- | --- |
| `q-fv-system` | structure | The category of q-FV-systems over R and the forgetful functor to q-V-systems. |
| `frobenius` | data | For each pair of divisors, the Frobenius as a map of graded algebras. |
| `fv-relations` | relation | The five relations between the Frobenius and the Verschiebung, including the coprime commutation. |
| `fv-composites` | relation | The Frobenius after the Verschiebung is the integer m/d; the Verschiebung after the Frobenius is the q-integer of m/d at the d-th power of q. |
| `f-teichmueller` | relation | The F-Teichmueller condition on the differential of a Teichmueller lift. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.4* — The q-de Rham-Witt complex is shown to carry a unique q-FV-structure and to be initial among q-FV-systems.
- *HabiroCohomologyFoundations:HQ.4* — The twisted Frobenius, obtained by rescaling the Frobenius by a power of m/d in each degree, is what makes the transition maps of the twisted q-de Rham complexes differential graded algebra maps.

**Unit tests.**

- `degenerate-composite` — For m equal to d both composites are the identity, since the integer is one and the q-integer of one is one.
- `q-deformation-of-the-classical-relation` — Setting q to one turns the q-integer of m/d into the integer m/d and recovers the classical relation that the Verschiebung after the Frobenius is multiplication by m/d.
- `frobenius-is-multiplicative` — The Frobenius respects products while the Verschiebung does not; a definition that made the Verschiebung multiplicative would contradict the projection formula listed among the relations.
- `no-restriction-is-implied` — The relations do not produce a map from the m-th to the d-th member of the shape of a restriction; the next node shows that none can exist.

**Sources.**

- Definition 3.6, The definition of the node, with the exact relations.

  > A q-FV-system is a q-V-system together with, for all divisors d of m, a morphism of graded algebras from the m-th to the d-th member, compatible with the Frobenius maps on q-Witt vectors and transitive, such that the Frobenius after the differential after the Verschiebung is the differential, the Verschiebung of a form times the Frobenius of another is the Verschiebung of the form times ...

### Why there are no restrictions, and the comparison with ordinary de Rham-Witt that survives

`HabiroCohomologyFoundations:HQ.4/there-are-no-restriction-operators-and-what-replaces-them` · *theorem* · planet **No restriction operators**

The usual restriction maps between truncated Witt rings do not extend to maps of polynomial-ring-in-q algebras between the q-Witt rings: such a map would have to commute with the Verschiebungen and would therefore induce a map from R with an m-th root of unity adjoined to R with a d-th root of unity adjoined, which does not exist already when m is a prime power and R is not of characteristic that prime. Consequently there is no ring of untruncated q-Witt vectors formed as a limit along restrictions, and the definitions of q-V-systems, q-FV-systems and their torsion-free variant deliberately contain no restriction maps. What replaces the restrictions is the observation that Langer and Zink's universal property of the ordinary de Rham-Witt pro-complex does not use them either: the ordinary de Rham-Witt pro-complex remains initial in the category of FV-pro-complexes with the restriction maps deleted. Combining this with the initiality of the q-de Rham-Witt complex among q-FV-systems yields, over a base that is an algebra over the integers localised at a prime p, canonical maps from the (alpha+1)-st ordinary de Rham-Witt complex to the q-de Rham-Witt complex of index p to the alpha, for every alpha, compatible with Frobenius and Verschiebung.

**Hypotheses.**

- The non-existence argument needs R not to be of characteristic p when m is a power of p; the source's example is exactly that.
- The comparison map requires A to be an algebra over the integers localised at p.
- The comparison is compatible with Frobenius and Verschiebung; no compatibility with restriction is claimed, because one side has none.

**Proof outline.**

1. Suppose a restriction existed as a map of polynomial-ring-in-q algebras; deduce that it commutes with Verschiebungen and hence descends to a map between the two cyclotomic quotients of R.
2. Exhibit the failure of such a map in the stated case, and conclude that no restriction exists and that the untruncated limit along restrictions does not.
3. Read Langer and Zink's construction and check that compatibility with the restrictions is never enforced, so that the pro-complex remains initial when they are deleted.
4. Build the forgetful functor from q-FV-systems to the restriction-free FV-pro-complexes by sending the family indexed by m to the subfamily indexed by powers of p.
5. Apply the universal property on the ordinary side to obtain the comparison maps and their compatibility with Frobenius and Verschiebung.

**Acceptance.**

- The non-existence is proved, not asserted, and its hypothesis is recorded.
- The claim about Langer and Zink is stated as what it is: their argument never uses the restrictions, so the universal property survives their deletion.
- The comparison map goes from the ordinary de Rham-Witt complex to the q-one and is not claimed to be an isomorphism.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/q-v-systems-of-differential-graded-algebras`, `HabiroCohomologyFoundations:HQ.4/q-fv-systems`, `HabiroRings:HR.4/there-is-no-restriction-map`, `CrystallineCohomology:CR.4`

**Sources.**

- Paragraph 2.14, The non-existence of restrictions with its proof and the consequence for the untruncated limit.

  > Unfortunately, it turns out that the usual restriction maps do not extend to morphisms of polynomial-ring-in-q algebras between the q-Witt rings. Indeed, such a morphism would necessarily commute with the Verschiebungen and thus induce a morphism from R with an m-th root of unity adjoined to R with a d-th root of unity adjoined, which fails to exist even in very simple cases. So there is ...

- Paragraph 3.11, The replacement for the restrictions, which is what makes the comparison map exist.

  > Observe that we do not include any restriction maps in the definitions. This is of course necessitated by the fact that there are no restrictions for q-Witt vectors. Surprisingly though, restrictions are also not needed for Langer-Zink's construction: the de Rham-Witt pro-complex is still initial in the category of FV-pro-complexes with the restriction maps deleted; compatibility with the ...

- Remark 3.18, The comparison map and its compatibilities.

  > As a consequence we get a comparison map between ordinary and q-de Rham-Witt complexes when A is an algebra over the integers localised at p: the forgetful functor sending a q-FV-system to its subfamily indexed by powers of p induces morphisms from the (alpha+1)-st ordinary de Rham-Witt complex to the q-de Rham-Witt complex of index p to the alpha, compatible with Frobenii and Verschiebungen.

### The m-truncated q-de Rham-Witt complex, as the initial q-V-system

`HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex` · *construction* · planet **q-de Rham-Witt complex**

For an A-algebra R the category of q-V-systems of differential graded A-algebras over R has an initial object, the family of m-truncated q-de Rham-Witt complexes of R relative to A. It has two further properties: for every m the canonical map from the module of Kaehler differential forms of the relative q-Witt ring over the polynomial ring in q over A onto the m-th member is surjective, and for m equal to one it is an isomorphism onto the de Rham complex of R over A; and for every m the structure map identifies the relative q-Witt ring with the degree-zero part of the m-th member. There is a unique choice of Frobenius operators making the family a q-FV-system, and with them the family is also initial among q-FV-systems. For smooth R the members are degreewise integrally torsion free, so the family is also initial among torsion-free q-V-systems. The complex is functorial in R and satisfies base change along maps of Lambda-rings: the tensor product of the m-th member with A' over A is the m-th member of the base-changed algebra over A'.

**Hypotheses.**

- R is an A-algebra; nothing beyond that is needed for existence.
- The degreewise torsion-freeness is a theorem about smooth R and is false in general.
- The construction is not (q-1)-completed; completing degreewise recovers the object of the author's earlier work.

**Proof outline.**

1. Construct the initial object by generators and relations from the q-V-system axioms, or equivalently as a quotient of the de Rham complex of the q-Witt ring, and check the universal property.
2. Prove surjectivity of the map from the Kaehler differentials of the q-Witt ring and identify the case m equal to one with the de Rham complex of R.
3. Identify degree zero with the relative q-Witt ring, using the degree-zero structure map.
4. Construct the Frobenius operators and prove that the choice is unique and that the family becomes initial among q-FV-systems.
5. Prove degreewise torsion-freeness for smooth R and deduce initiality among torsion-free q-V-systems.
6. Prove base change along a map of Lambda-rings by comparing universal properties.

**Acceptance.**

- The universal property is stated for both categories, q-V-systems and q-FV-systems.
- Degree zero is identified with the q-Witt ring and m equal to one with the de Rham complex.
- The torsion-freeness statement carries its smoothness hypothesis.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/q-v-systems-of-differential-graded-algebras`, `HabiroCohomologyFoundations:HQ.4/q-fv-systems`, `HabiroCohomologyFoundations:HQ.4/there-are-no-restriction-operators-and-what-replaces-them`

**API.**

| name | role | statement |
| --- | --- | --- |
| `q-de-rham-witt` | constructor | For an A-algebra R and a positive integer m, a commutative differential graded algebra over the polynomial ring in q over A. |
| `universal-property` | universal-property | It is initial among q-V-systems over R, and with its unique Frobenii initial among q-FV-systems. |
| `degree-zero` | projection | Its degree-zero part is the relative q-Witt ring of R over A. |
| `m-equals-one` | example | For m equal to one it is the de Rham complex of R over A. |
| `surjection-from-kaehler-differentials` | projection | The canonical map from the Kaehler differentials of the q-Witt ring is surjective in every degree. |
| `base-change` | compatibility | Base change along a map of Lambda-rings is an isomorphism. |
| `torsion-freeness` | characterisation | For smooth R the members are degreewise integrally torsion free. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — It is the target of the descent theorem's second clause: the graded pieces of the ascending filtration on the Habiro-Hodge complex modulo q^m-1 are its shifted forms.
- *HabiroCohomologyFoundations:HQ.4* — The twisted q-de Rham complex modulo q^m-1 is identified with it.
- *HabiroRings:HR.4* — In degree zero it is the relative q-Witt ring that roadmap owns.

**Unit tests.**

- `degree-zero-and-index-one` — In degree zero the m-th member is the relative q-Witt ring, and for m equal to one the whole complex is the de Rham complex of R over A.
- `after-inverting-m` — Inverting m turns the ghost maps into an isomorphism onto the product over divisors d of m of the de Rham complex base-changed along the d-th Adams operation with a d-th root of unity adjoined.
- `etale-base-change` — For an etale map of A-algebras the complex is obtained from the source by extension of scalars along the map of q-Witt rings; a construction failing this would not be an etale sheaf.
- `not-the-de-rham-witt-complex` — For m a power of a prime p the q-de Rham-Witt complex is not the ordinary de Rham-Witt complex: there is only a comparison map from the latter, and the two carry different operator systems because one has restrictions and the other does not.

**Sources.**

- Proposition 3.12 and Definition 3.13, Existence, the two properties and the name.

  > The category of q-V-systems has an initial object with the following properties: for all m the canonical map from the Kaehler differentials of the relative q-Witt ring over the polynomial ring in q onto the m-th member is surjective, and for m equal to one it induces an isomorphism with the de Rham complex of R over A; and for all m the structure map induces an isomorphism from the ...

- Proposition 3.17, Uniqueness of the Frobenii and the second universal property.

  > There is a unique choice of Frobenius operators making the family into a q-FV-system. Moreover, this exhibits the family as an initial object of the category of q-FV-systems.

- Proposition 4.1 and Lemma 3.16, Torsion-freeness in the smooth case and base change.

  > Let R be smooth over A. Then the m-truncated q-de Rham-Witt complex is degreewise integrally torsion free for all m; in particular the family is also an initial object among torsion-free q-V-systems. If A maps to A' as Lambda-rings, the canonical map from the base change of the m-th member to the m-th member of the base-changed algebra is an isomorphism.

### Ghost maps on the q-de Rham-Witt complex, and the torsion hypotheses their injectivity needs

`HabiroCohomologyFoundations:HQ.4/ghost-maps-and-what-they-do-not-define` · *theorem*

For every divisor d of m there is a map of differential graded algebras over the polynomial ring in q over A from the m-truncated q-de Rham-Witt complex to the de Rham complex of R over A base-changed along the d-th Adams operation with a d-th primitive root of unity adjoined; these generalise the ghost maps of relative q-Witt vectors and are constructed by exhibiting the product of those targets over the divisors of m as a q-V-system, with Verschiebung given in degree i by multiplication by the (i+1)-st power of m/n on the matching factor and by zero elsewhere. Inverting m makes the resulting map to the product an isomorphism. Injectivity without inverting m holds only under torsion hypotheses: in degree zero the ghost maps of relative q-Witt vectors are jointly injective when R is p-torsion free for every prime factor p of m, and the relative q-Witt rings inherit p-torsion freeness and bounded p-power torsion from R. A formula in ghost coordinates is therefore never an unconditional definition of the q-de Rham-Witt complex.

**Hypotheses.**

- The ghost targets involve a choice of primitive d-th root of unity; the family is indexed by the divisors of m.
- Injectivity in degree zero requires R to be p-torsion free for every prime factor p of m; nothing weaker is claimed.
- Inverting m is what makes the ghost description an isomorphism, and m is not invertible in the cases the roadmap cares about.

**Proof outline.**

1. Exhibit the product of the ghost targets as a q-V-system, by supplying the degree-zero map from the product of the q-Witt ghost maps and the Verschiebung with its stated degree-dependent factor.
2. Apply the universal property of the q-de Rham-Witt complex to obtain the ghost maps.
3. Prove that inverting m turns the total ghost map into an isomorphism of differential graded algebras.
4. Record the degree-zero injectivity statement with its torsion hypothesis and the inheritance of torsion properties by the q-Witt rings.
5. Record explicitly that no unconditional description by ghost coordinates is available.

**Acceptance.**

- The Verschiebung formula on the ghost system carries the exponent i+1 and not i.
- The isomorphism statement is after inverting m and is not stated integrally.
- The torsion hypotheses of the injectivity statement are recorded and are not weakened.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.4/q-v-systems-of-differential-graded-algebras`, `HabiroRings:HR.4/relative-q-witt-rings`

**Sources.**

- Paragraph 3.15, The construction of the ghost maps and the exponent in the Verschiebung formula.

  > It turns out that the q-de Rham-Witt complex comes equipped with maps of differential graded algebras to the de Rham complex base changed along the d-th Adams operation with a d-th root of unity adjoined, for all divisors d of m, generalising the ghost maps for relative q-Witt vectors. If a form is homogeneous of degree i, the Verschiebung is given by multiplication by the (i+1)-st power ...

- Corollary 3.34, The isomorphism after inverting m.

  > For any A-algebra R and any positive integer m, the ghost maps induce an isomorphism of differential graded algebras from the m-truncated q-de Rham-Witt complex with m inverted onto the product over divisors d of m of the de Rham complex base changed along the d-th Adams operation with m inverted and a d-th root of unity adjoined.

- Lemma 2.23 and Corollary 2.22, The degree-zero injectivity with its hypothesis, and the inheritance of torsion properties.

  > If R is p-torsion-free for all prime factors p of m, then the ghost maps from the relative q-Witt ring are jointly injective. If R is p-torsion-free then so is the q-Witt ring for all m; likewise if R has bounded p-power torsion then so has the q-Witt ring.

### Etale base change for the q-de Rham-Witt complex, and the resulting etale sheaf

`HabiroCohomologyFoundations:HQ.4/etale-base-change-and-the-sheaf-property` · *theorem*

Let R map to R' etale as A-algebras. Then the canonical morphism induces an isomorphism of differential graded algebras over the relative q-Witt ring of R' from the extension of scalars of the m-truncated q-de Rham-Witt complex of R along the map of q-Witt rings onto the m-truncated q-de Rham-Witt complex of R'. Consequently, for every m the functor sending an A-algebra to the E-infinity algebra underlying its m-truncated q-de Rham-Witt complex is an etale sheaf.

**Hypotheses.**

- The map from R to R' is etale; flatness alone does not suffice.
- The extension of scalars is along the map of relative q-Witt rings, which is itself etale by the corresponding statement for q-Witt vectors.
- The sheaf statement is for the underlying E-infinity algebra, for each fixed m.

**Proof outline.**

1. Construct the differential graded algebra structure on the extension of scalars, using that the q-Witt ring of R' is etale over that of R so that the module of differentials is inherited.
2. Check that the extension of scalars, with that structure, is a q-V-system over R'.
3. Compare universal properties to deduce the isomorphism.
4. Deduce the sheaf property by descent along etale covers from the isomorphism together with the corresponding statement for the q-Witt rings.

**Acceptance.**

- The isomorphism is stated as one of differential graded algebras over the q-Witt ring of the target.
- The sheaf statement names the fixed m and the underlying E-infinity algebra.
- The construction of the differential graded structure on the extension of scalars is listed as a step, since it is what the proof actually needs.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.4/ghost-maps-and-what-they-do-not-define`

**Sources.**

- Proposition 3.31, The base change statement.

  > Let R map to R' etale as A-algebras. Then the canonical morphism induces isomorphisms of differential graded algebras over the relative q-Witt ring of R' from the extension of scalars of the m-truncated q-de Rham-Witt complex of R onto that of R'.

- Corollary 3.33, The sheaf property.

  > For all positive integers m, the functor sending an A-algebra to the E-infinity algebra underlying its m-truncated q-de Rham-Witt complex is an etale sheaf.

### After p-completion the q-de Rham-Witt complex is a product of Frobenius-twisted de Rham complexes

`HabiroCohomologyFoundations:HQ.4/the-p-completion-of-the-q-de-rham-witt-complex` · *theorem*

Let R be smooth over the perfectly covered Lambda-ring A and let p be a prime. For every exponent alpha there is an equivalence, functorial in smooth R, of p-complete E-infinity algebras over the polynomial ring in q over A from the p-completion of the de Rham complex of R over A, derived-tensored along the Adams operation indexed by p to the alpha into the quotient of the polynomial ring in q by q to the p to the alpha minus one, onto the p-completion of the q-de Rham-Witt complex of index p to the alpha. More generally, writing m as p to the alpha times an integer n prime to p, the p-completion of the m-truncated q-de Rham-Witt complex is the product over the divisors d of n of the p-completion of the de Rham complex base changed along the Adams operation indexed by p to the alpha times d, modulo the cyclotomic polynomial of order d evaluated at q to the p to the alpha.

**Hypotheses.**

- R is smooth over A; the statement is false without smoothness.
- The base changes are along Adams operations of the Lambda-ring A, and the quotients are by the stated cyclotomic factors.
- The equivalences are of p-complete E-infinity algebras and are functorial in R.

**Proof outline.**

1. Prove the prime-power case by comparing both sides with the ghost description after p-completion, using the torsion-freeness of the complex for smooth R.
2. Identify the relevant factor of the ghost product with the Frobenius-twisted de Rham complex modulo the correct cyclotomic factor.
3. Deduce the general case by splitting m into its p-part and its prime-to-p part and applying the prime-power case to each factor.
4. Check functoriality in smooth R.

**Acceptance.**

- Both displayed equivalences carry their cyclotomic quotients exactly.
- The smoothness hypothesis is stated.
- The statement is about p-completions and is not asserted integrally.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.4/ghost-maps-and-what-they-do-not-define`

**Sources.**

- Proposition 4.2, Both clauses of the node.

  > Let R be smooth over A and let p be a prime. Then for every exponent alpha there is an equivalence of p-complete E-infinity algebras over the polynomial ring in q over A from the p-completion of the de Rham complex derived-tensored along the Adams operation indexed by p to the alpha into the polynomial ring in q modulo q to the p to the alpha minus one, onto the p-completion of the q-de ...

### The twisted q-de Rham complexes, glued from decalage twists by the p-adic Frobenii

`HabiroCohomologyFoundations:HQ.4/twisted-q-de-rham-complexes` · *construction* · planet **Twisted q-de Rham complex**

Let A be a perfectly covered Lambda-ring, S a smooth A-algebra and m a positive integer. Global Adams operations on the q-de Rham complex do not exist, already for S etale over A, because Lambda-structures do not extend along etale maps; the best available structure is, for each prime p, a Frobenius on the p-completion. The m-th twisted q-de Rham complex is nevertheless constructed by gluing: for each divisor d of m take the completion at the cyclotomic polynomial of order d evaluated at q of the decalage at the q-integer of m/d of the q-de Rham complex, base changed along the Adams operation indexed by d; for each prime p with p times d dividing m supply the p-adic gluing equivalence, which after reducing to the case of a single prime is the equivalence induced by the relative Frobenius from the Frobenius twist of prismatic cohomology onto the decalage of prismatic cohomology at the prism ideal. The complete-descent principle then glues these into a single (q^m-1)-complete E-infinity algebra over the polynomial ring in q over A. Animating gives a functor on animated A-algebras agreeing with the underived one on polynomial algebras, but not on all smooth algebras. Whenever n divides m there is a map from the (q^n-1)-completion of the m-th twisted complex to the n-th, functorial in S; these maps are usually far from equivalences, and their limit over m is a pathological object which is not a Habiro descent of the q-de Rham complex, except when S is etale over A, where it recovers the relative Habiro ring.

**Hypotheses.**

- S is smooth over A and the gluing uses the complete-descent corollary of the coefficient roadmap.
- The decalage functors are at the elements given by the q-integers of m/d, and the completions are at the cyclotomic polynomials.
- The p-adic gluing equivalence is the relative Frobenius equivalence for prismatic cohomology and is imported.
- The construction supplies the individual transition maps, not the whole functor from the divisibility poset with all its coherences.

**Proof outline.**

1. Record why global Adams operations do not exist and what replaces them.
2. Define the local pieces indexed by the divisors of m, as completions of decalage twists of Adams base changes.
3. Construct the p-adic gluing equivalences, reducing first to prime powers by inverting a unit factor, then using that p-completion agrees with completion at the relevant q-integer and commutes with the decalage, and finally the relative Frobenius equivalence for prismatic cohomology.
4. Apply the complete-descent principle to glue the pieces into the twisted complex.
5. Read off the arithmetic fracture square for the twisted complex and construct the transition maps for n dividing m, both from the gluing and from the fracture square.
6. Record the failure of the limit over m to be a Habiro descent, and the etale exception.

**Acceptance.**

- The construction never uses a global Adams operation.
- Each gluing equivalence is named and its reduction to the relative Frobenius equivalence is recorded.
- The transition maps are recorded as maps, without the claim that they assemble into a functor with all higher coherences.
- The failure of the naive limit is stated.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.2/what-the-decalage-import-supplies`, `HabiroRings:HR.3/the-complete-descent-corollary`, `PrismaticCohomology:PR.6`, `AInfCohomology:AI.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `twisted-complex` | constructor | For smooth S and a positive integer m, a (q^m-1)-complete E-infinity algebra over the polynomial ring in q over A, functorial in S. |
| `fracture-square` | characterisation | The arithmetic fracture pullback square whose corners are the products of Adams base changes and their p-completions and localisations, with the iterated relative Frobenii as the right vertical map. |
| `transition` | data | For n dividing m, a map from the (q^n-1)-completion of the m-th complex to the n-th, functorial in S. |
| `index-one` | example | For m equal to one the twisted complex is the q-de Rham complex itself. |
| `prime-power-p-completion` | projection | For m a power of p, the p-completion is the corresponding iterated Frobenius twist of the p-completed q-de Rham complex. |
| `animation` | functoriality | Its animation is defined on animated A-algebras and agrees with the underived functor on polynomial algebras. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The twisted q-Hodge filtration is a filtration of this object, and the m-truncated Habiro descent is built by adjoining that filtration divided by powers of q^m-1.
- *HabiroCohomologyFoundations:HQ.4* — Its Nygaard filtration is the auxiliary filtration through which the twisted q-Hodge filtration is defined.

**Unit tests.**

- `index-one` — For m equal to one the construction returns the q-de Rham complex, since the decalage at the q-integer of one is the identity and the only divisor is one.
- `modulo-the-deformation-parameter` — The quotient of the m-th twisted complex by q^m-1 is the m-truncated q-de Rham-Witt complex, and the transition map for n dividing m induces the rescaled Frobenius on those complexes.
- `etale-limit` — For S etale over A the limit over m of the twisted complexes is the relative Habiro ring; this is the one case where the naive limit is not pathological.
- `the-naive-limit-is-not-a-descent` — For S smooth but not etale the limit over m of the twisted complexes is not a Habiro descent of the q-de Rham complex; this non-example is what motivates the whole q-Hodge modification.

**Sources.**

- Paragraph 3.14, The construction of the pieces and the requirement of gluing data.

  > Let S be a smooth A-algebra. We'll construct a (q^m-1)-complete E-infinity algebra using the complete-descent corollary. Take the d-th piece to be the completion at the cyclotomic polynomial of order d of the decalage at the q-integer of m/d of the q-de Rham complex, base changed along the Adams operation indexed by d. We must also provide p-adic gluing equivalences.

- Subsection on deformations of q-de Rham-Witt complexes, opening, Why the naive Adams twist is unavailable and what replaces it.

  > However, such global Adams operations don't exist in general (this already fails if S is etale over A, as Lambda-structures usually don't extend along etale maps). The best we have is, for every prime p, a Frobenius on the p-completion. Still, these p-adic Frobenii are enough to construct the twisted complexes.

- Remark after 3.16, The failure of the naive limit and the etale exception.

  > The maps from the (q^n-1)-completion of the m-th twisted complex to the n-th are usually quite far from being equivalences. Thus we can form the limit over m, but it will usually be a pathological object (unless S is etale over A, in which case we recover the relative Habiro ring). In particular, it won't be a Habiro descent of the q-de Rham complex.

### Reducing the twisted complex modulo q^m-1 gives the q-de Rham-Witt complex

`HabiroCohomologyFoundations:HQ.4/the-twisted-complex-deforms-the-q-de-rham-witt-complex` · *theorem*

Let A be a perfectly covered Lambda-ring and S a smooth A-algebra. There is an equivalence, functorial in S, of E-infinity algebras over the polynomial ring in q over A modulo q^m-1, from the quotient of the m-th twisted q-de Rham complex by q^m-1 onto the m-truncated q-de Rham-Witt complex of S over A. Under this identification, the transition map from the m-th to the d-th twisted complex, reduced modulo the respective elements, becomes the rescaled Frobenius, namely the Frobenius from the m-th to the d-th q-de Rham-Witt complex multiplied in degree n by the n-th power of m/d; that rescaling is exactly what turns the Frobenius, which satisfies that the differential after it is m/d times it, into a map of differential graded algebras.

**Hypotheses.**

- S is smooth over A.
- The rescaling of the Frobenius by a power of m/d depending on the degree is part of the statement.
- The equivalence is independent of the auxiliary integer N used in the fracture squares.

**Proof outline.**

1. Write down the arithmetic fracture square for the q-de Rham-Witt complex and for the twisted q-de Rham complex with the same auxiliary integer N divisible by m.
2. Reduce the twisted square modulo q^m-1 and check corner by corner that every occurrence of the q-de Rham complex may be replaced by the de Rham complex, because q-1 maps to zero under the relevant Adams operation and the cyclotomic factors differ from q^m-1 by units.
3. Identify the two squares and conclude the equivalence.
4. Check independence of the choice of N by comparing the squares for N and a multiple.
5. For the transition maps, compare the two squares again, the only non-formal point being that the rescaled Frobenius and the relative Frobenius agree under the p-complete identification.

**Acceptance.**

- Both fracture squares are written and compared corner by corner.
- The rescaling of the Frobenius is recorded with its degree-dependent factor and the reason for it.
- Independence of the auxiliary integer is checked and not assumed.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/twisted-q-de-rham-complexes`, `HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.4/the-p-completion-of-the-q-de-rham-witt-complex`

**Sources.**

- Proposition 3.19, The statement of the node.

  > Let A be a perfectly covered Lambda-ring and S a smooth A-algebra. There's a functorial equivalence of E-infinity algebras over the polynomial ring in q modulo q^m-1 from the quotient of the m-th twisted q-de Rham complex by q^m-1 onto the m-truncated q-de Rham-Witt complex. Under this identification, the map induced by the transition maps agrees with the rescaled Frobenius.

- Paragraph before Proposition 3.19, Why the rescaling is needed, which the node records as part of the statement.

  > Recall that there is a map of graded algebras, the Frobenius on q-de Rham-Witt complexes, satisfying that the differential after it equals m/d times it. Therefore, if the rescaled Frobenius is given by the n-th power of m/d in degree n, then it is a map of differential graded algebras.

### The Nygaard filtration, its comparison with the prismatic one, and the fibre sequences it satisfies

`HabiroCohomologyFoundations:HQ.4/the-nygaard-filtration-on-q-de-rham-witt-complexes` · *definition* · planet **Nygaard filtration**

Fix a prime p and let S be smooth over A. The Nygaard filtration on the q-de Rham-Witt complex of index p to the alpha is the filtration whose n-th term is the subcomplex which in degrees below n is the image of the Verschiebung from the complex of index p to the alpha minus one, multiplied by p to the power n minus one minus the degree, and which agrees with the ambient complex in degrees at least n. On the other side, the p-completed twisted q-de Rham complex of index p to the alpha carries the prismatic Nygaard filtration, defined as the preimage of the decalage filtration under the relative Frobenius. These agree: there is a unique functorial equivalence of filtered E-infinity algebras between the quotient of the second by q to the p to the alpha minus one and the p-completion of the first, recovering in degree zero the identification of the previous node. The filtration satisfies: the rescaled Frobenius restricted to the n-th term is divisible by p to the n, and the divided Frobenius induces a map from the n-th graded piece to the n-truncation of the complex of index p to the alpha minus one modulo p which is surjective in degree n and an isomorphism in all other degrees; the kernel of the Frobenius in each degree is the de Rham form base changed along the Adams operation with a p to the alpha-th root of unity adjoined; the animated filtration satisfies quasi-syntomic descent and agrees with the un-animated one on smooth inputs; and after inverting p the filtration becomes the combined Hodge and cyclotomic-adic filtration.

**Hypotheses.**

- p is a fixed prime and alpha at least one; the filtration of index one is the trivial one.
- The subcomplex description uses the Verschiebung from the previous index and the explicit powers of p, one for each degree below n.
- The comparison with the prismatic Nygaard filtration is at the level of p-completions and uses the quotient convention of the filtered stage.

**Proof outline.**

1. Define the filtration explicitly, degree by degree, as the stated subcomplex.
2. Define the prismatic Nygaard filtration as the preimage of the decalage filtration under the relative Frobenius, and extend it to higher alpha by pullback along the Frobenius of the coefficient ring.
3. Prove the divisibility of the rescaled Frobenius on the n-th term and compute the induced map on the n-th graded piece, showing surjectivity in degree n and bijectivity elsewhere.
4. Compute the kernel of the Frobenius in each degree and identify it with the Adams-twisted de Rham form with a root of unity adjoined.
5. Assemble the two fibre sequences, one on each side, and compare them to obtain the unique functorial filtered equivalence.
6. Prove quasi-syntomic descent for the animated filtration and its agreement with the un-animated one on smooth inputs, and compute the rationalisation.

**Acceptance.**

- The explicit subcomplex is written with its powers of p.
- The comparison is stated as a unique functorial equivalence of filtered E-infinity algebras and its degree-zero restriction is named.
- The two fibre sequences, one for each filtration, are recorded as the mechanism of the comparison.
- Quasi-syntomic descent is stated for the animated filtration only.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/twisted-q-de-rham-complexes`, `HabiroCohomologyFoundations:HQ.4/the-twisted-complex-deforms-the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.2/the-quotient-convention-for-filtered-modules`, `PrismaticCohomology:PR.6`, `AInfCohomology:AI.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `nygaard-filtration` | constructor | For a prime p, an exponent alpha and smooth S, a descending filtration by subcomplexes of the q-de Rham-Witt complex of index p to the alpha. |
| `explicit-terms` | characterisation | Its n-th term, degree by degree, as the stated powers of p times Verschiebungen below degree n and the ambient complex from degree n. |
| `prismatic-comparison` | equivalence | The unique functorial filtered equivalence with the prismatic Nygaard filtration on the p-completed twisted complex modulo the cyclotomic element. |
| `divided-frobenius` | projection | The divided Frobenius on the n-th graded piece, with its surjectivity in degree n and bijectivity elsewhere. |
| `frobenius-kernel` | characterisation | The kernel of the Frobenius in degree n, as an Adams-twisted de Rham form with a root of unity adjoined. |
| `descent` | compatibility | Quasi-syntomic descent for the animated filtration, and agreement with the un-animated filtration on smooth inputs. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.3* — The p-adic twisted q-Hodge filtration is defined by a recursive pullback one of whose legs is the Nygaard filtration.
- *HabiroCohomologyFoundations:HQ.4* — The Hodge-versus-Nygaard pullback square is the reduction modulo the cyclotomic element of that recursion.

**Unit tests.**

- `index-one` — For alpha equal to zero the complex is the q-de Rham complex and the filtration is the trivial one; the recursion starts there.
- `degree-zero-term` — The zeroth term of the filtration is the whole complex, and the first term in degree zero is the image of the Verschiebung.
- `after-inverting-p` — After inverting p and completing at the cyclotomic element the filtration becomes the combined Hodge and cyclotomic-adic filtration on the Adams-twisted de Rham complex.
- `not-the-hodge-filtration` — The Nygaard filtration is not the stupid or Hodge filtration: the two are related by the pullback square of the following node, and identifying them would already fail in degree one for a smooth algebra of dimension one.

**Sources.**

- Paragraph 3.21, The explicit definition of the filtration.

  > The Nygaard filtration is the filtration whose n-th term is the subcomplex given by p to the n minus one times the Verschiebung of the degree-zero part of the complex of index p to the alpha minus one, through p to the zero times the Verschiebung of its degree n minus one part, and then the ambient complex from degree n on.

- Proposition 3.22, The comparison theorem.

  > For smooth A-algebras S there exists a unique functorial equivalence of filtered E-infinity algebras from the quotient by q to the p to the alpha minus one of the Nygaard filtration on the p-completed twisted complex onto the Nygaard filtration on the p-completed q-de Rham-Witt complex, which in degree zero recovers the identification of the previous paragraph.

- Lemma 3.23, Lemma 3.24 and Corollary 3.26, The three properties the node records after the definition.

  > For all n at least zero the rescaled Frobenius restricted to the n-th Nygaard term is divisible by p to the n, and the divided Frobenius induces a map from the n-th graded piece to the n-truncation of the complex of index p to the alpha minus one modulo p which is surjective in degree n and an isomorphism in all other degrees. The kernel of the Frobenius in degree n is the n-th de Rham ...

### The stupid filtration is the pullback of the Nygaard filtration along the divided Frobenius

`HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard` · *theorem*

Let S be smooth over A, p a prime and alpha at least one. For every n at least zero the square whose upper left corner is the n-th term of the stupid filtration on the q-de Rham-Witt complex of index p to the alpha, whose upper right corner is the n-th Nygaard term of the same complex, whose lower left corner is the n-th term of the stupid filtration on the complex of index p to the alpha minus one and whose lower right corner is that whole complex, with right vertical map the divided Frobenius, is a pullback in the derived category of the polynomial ring in q over A. As a consequence, for smooth S the derived q-de Rham-Witt forms agree with the underived ones up to shift: the n-th animated q-de Rham-Witt form is the (minus n)-fold shift of the n-th underived form, for every index m and every degree n.

**Hypotheses.**

- S is smooth over A; the corollary is false for general animated inputs.
- The stupid filtration in degree n is the brutal truncation of the complex in degrees at least n.
- The shift in the corollary is by minus n and is part of the statement.

**Proof outline.**

1. Compare the two fibre sequences of the Nygaard node: the one for the divided Frobenius on the Nygaard graded pieces and the one for the stupid filtration.
2. Identify the fibres on both sides with the Adams-twisted de Rham forms with a root of unity adjoined, and conclude that the square is a pullback.
3. Induct on alpha to reach all prime powers.
4. Deduce the smooth derived-to-underived comparison by descending induction on the filtration degree, using that the stupid filtration is finite for a smooth algebra of finite relative dimension.

**Acceptance.**

- The square is stated with all four corners and the divided Frobenius as its right vertical map.
- The corollary carries the shift by minus n explicitly.
- The smoothness hypothesis appears in both statements.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/the-nygaard-filtration-on-q-de-rham-witt-complexes`, `HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex`, `HabiroCohomologyFoundations:HQ.4/twisted-q-de-rham-complexes`

**Sources.**

- Lemma 3.30, The pullback square of the node.

  > For all smooth A-algebras S, all primes p and all alpha at least one, the square with upper left corner the n-th stupid filtration term of the q-de Rham-Witt complex of index p to the alpha, upper right corner its n-th Nygaard term, lower left corner the n-th stupid term of the complex of index p to the alpha minus one and lower right corner that complex, with right vertical map the ...

- Corollary 3.31, The smooth derived-to-underived comparison with its shift.

  > If S is smooth over A, then the n-th derived q-de Rham-Witt form is the (minus n)-fold shift of the n-th underived q-de Rham-Witt form, for all m and all degrees n at least zero.

### The fracture squares that glue the cyclotomic pieces, and what a descended complex is not

`HabiroCohomologyFoundations:HQ.4/the-arithmetic-fracture-squares-and-cyclotomic-descent` · *theorem*

Fix m and an auxiliary non-zero integer N divisible by m. For a smooth A-algebra S the m-th twisted q-de Rham complex is the pullback of a square whose upper right corner is the product over primes p dividing N and divisors of the prime-to-p part of m of the Adams base change of the q-de Rham complex completed at p and at the relevant cyclotomic polynomial, whose lower left corner is the product over divisors d of m of the Adams base change with N inverted completed at the cyclotomic polynomial of order d, and whose right vertical map is the iterated relative Frobenius; and the reduction of that square modulo q^m-1 is the corresponding arithmetic fracture square for the q-de Rham-Witt complex, in which each q-de Rham complex is replaced by the ordinary de Rham complex. These squares are what the coefficient roadmap's complete-descent principle is applied to, and their compatibility for varying m is what produces the transition maps. A descended complex must be distinguished from a collection of its homotopy groups: the descent produces an object of the Habiro-complete derived category, whereas a functorial family of isomorphisms on cohomology with the Frobenius as transition map is provably impossible for smooth inputs.

**Hypotheses.**

- S is smooth over A and N is a non-zero integer divisible by m.
- In the fracture squares the completions are at the stated cyclotomic polynomials and at the primes dividing N, and the right vertical map is the appropriate iterated relative Frobenius.
- The impossibility statement is about a functor on smooth A-algebras with values in (q-1)-complete modules together with functorial cohomology isomorphisms and Frobenius transition maps; it presupposes that A is not an algebra over the rationals.

**Proof outline.**

1. Write the fracture square for the twisted complex and check that it is the completed arithmetic fracture square, using that the q-integer of m/d becomes a unit in the rationalised corners so the decalage functors may be ignored there.
2. Reduce modulo q^m-1 and identify the result with the fracture square for the q-de Rham-Witt complex.
3. Apply the complete-descent principle of the coefficient roadmap to the resulting diagram of cyclotomically complete algebras.
4. Record the no-go theorem for a functorial q-Hodge complex with functorial cohomology identifications, and note that it is the reason the descent is stated for complexes and not for cohomology.
5. Record that derived commutative or E-infinity structures are carried only when the input supplies them, and are not produced by the descent itself.

**Acceptance.**

- Both fracture squares are stated with all corners and the Frobenius maps.
- The no-go statement is recorded with its hypotheses, in particular that the base is not a rational algebra.
- The distinction between a descended complex and a family of cohomology groups is stated explicitly.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.4/twisted-q-de-rham-complexes`, `HabiroCohomologyFoundations:HQ.4/the-twisted-complex-deforms-the-q-de-rham-witt-complex`, `HabiroRings:HR.3/the-complete-descent-corollary`, `HabiroRings:HR.2/habiro-complete-modules`

**Sources.**

- Lemma 3.15, The fracture square for the twisted complex.

  > Fix m and N non-zero divisible by m. Then we have a functorial pullback square whose upper right corner is the product over primes p dividing N and divisors of the prime-to-p part of m of the Adams base change of the q-de Rham complex completed at p and at the cyclotomic polynomial, whose lower left corner is the product over divisors d of m of the Adams base change with N inverted, and ...

- Corollary 4.37, The matching fracture square on the q-de Rham-Witt side.

  > Let R be a smooth A-algebra, m a positive integer, and N non-zero divisible by m. Then there exists a functorial pullback diagram for the q-de Rham-Witt complex whose left vertical map is the product of the ghost maps and whose right vertical map is the iterated relative Frobenius coming from the identification of the p-completed de Rham complex with crystalline cohomology.

- Theorem 5.1, The no-go theorem that forces the distinction between a complex and its cohomology.

  > Let A be a perfectly covered Lambda-ring. If A is not an algebra over the rationals, then there can be no functor from smooth A-algebras to derived (q-1)-complete modules over the power series ring in q-1 over A such that for all m there is a functorial graded isomorphism from the (q-1)-completed q-de Rham-Witt complex onto the cohomology of the quotient by q^m-1, and such that for all ...

### Multiplicative structure is carried, never created

`HabiroCohomologyFoundations:HQ.4/no-automatic-multiplicative-upgrade` · *comparison*

The descent machinery transports whatever multiplicative structure the input carries and creates none. If the chosen q-Hodge filtration is an algebra for the little n-discs operad in filtered modules over the filtered coefficient ring, compatibly with the algebra structure on the derived q-de Rham complex and with all the coherence data of the filtration, then the Habiro-Hodge complex is an algebra for the same operad, and the ascending filtration on its reduction modulo q^m-1 is a filtered algebra for it with a graded equivalence on associated gradeds; and the same holds with derived commutative algebra structures in place of operadic ones. Nothing in the descent produces such a structure on an input that does not already have one, and the source explicitly does not expect the Habiro-Hodge complex of a general smooth scheme to carry a homotopy-coherent commutative structure. Smooth instances must therefore not be silently upgraded.

**Hypotheses.**

- The hypothesis is that the q-Hodge filtration and all the data of its definition are compatible with the given multiplicative structure; compatibility of the underlying object alone is not enough.
- The conclusion is for the same operad, with no increase in coherence.
- The expectation that no homotopy-coherent commutative structure exists in general is the source's, and is not a theorem.

**Proof outline.**

1. State the transport statement for algebras over the little n-discs operads and record that it follows from the symmetric monoidality of the descent functor.
2. State the same for derived commutative algebra structures, with the same hypotheses.
3. Record the source's expectation that the Habiro-Hodge complex of a smooth scheme does not carry a homotopy-coherent commutative structure, together with the reason: the multiplication comes from the diagonal, which requires more primes inverted as the coherence increases.
4. Record that no node of this packet upgrades a multiplicative structure beyond the input's.

**Acceptance.**

- The transport statement carries the full compatibility hypothesis.
- The non-expectation is attributed and is not stated as a theorem.
- No other node of this packet asserts a multiplicative structure without naming where it comes from.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/multiplicative-upgrades`, `HabiroCohomologyFoundations:HQ.4/the-arithmetic-fracture-squares-and-cyclotomic-descent`

**Sources.**

- Paragraph 3.50, The transport statement, with its hypotheses.

  > Suppose that the q-Hodge filtration can be equipped with the structure of an algebra over the little n-discs operad in filtered modules, compatible with the algebra structure on the derived q-de Rham complex, and that the data of the definition can be made compatible with this structure. Then the Habiro-Hodge complex becomes an algebra over the same operad, and the filtration on its ...

- Paragraph 1.17(c), The source's explicit non-expectation, which the node records as a caution and not as a theorem.

  > By construction, analytic Habiro cohomology comes with a stacky approach. For algebraic Habiro cohomology, we don't expect a stacky approach to exist. In fact, we don't even expect the Habiro-Hodge complex of a smooth scheme to carry a homotopy-coherent commutative algebra structure.

## HQ.5 — Existence classes and number fields

**Theorem 4.11**: a section over smooth `S` with every prime `p ≤ dim(S/A)`
inverted. Both the base and the bound are carried. The construction truncates at
degree `n`, takes a pullback there, and continues by the `(q−1)`-adic filtration
through a **left adjoint** — the naive pullback fails above degree one.

**Corollary 4.16 is a partial-operad statement.** The category is *not* closed
under tensor products. A `d`-dimensional input needs primes through `2d` inverted
for a multiplication, `rd` for coherence through `r` factors. Inverting through
`d` alone gives **no multiplication at all**.

Quasi-regular inputs are treated separately, under **condition (R)**. The naive
one-categorical preimage filtration is always injective onto the Hodge filtration;
**Theorem 4.22** gives surjectivity under either a Koszul-regular sequence of
**higher powers** `x_i^(a_i)`, `a_i ≥ 2`, or an `E₁`-lift **of `R_∞`** — an
existence condition, with no canonical choice. For `p > 2` the second implies the
first; at `p = 2` it does not.

**Theorem 4.29** is a section on the subcategory where each local filtration
actually q-deforms Hodge — not on every regular quotient. Uniqueness needs an
extra datum in the smooth case: compatibility with the truncated map, or a
`ℤ_p^×`-action.

Coverage: **source_decomposed**.

Fourteen nodes. The truncation adjunction with its projection formula; the canonical smooth filtration with the two-regime factorisation argument; the framed and fixed-point descriptions; the functoriality across dimensions through a pushout of categories; the smooth existence theorem with both the base and the dimension bound; the partial-operad multiplicativity with the doubled and the r-fold bounds and the explicit statement that inverting up to the dimension gives no multiplication; algebraic Habiro cohomology of a scheme with perfectness over the Habiro completion of the localised ring; condition (R) and the quasi-lci inputs with the counterexample showing relative semiperfectness is not automatic; the naive filtration with its unconditional injectivity; the well-behavedness theorem with both conditions and the prime-two restriction on the implication between them; flat base change; the global quasi-regular section with its monoidality; the two uniqueness statements with the extra datum the smooth case needs; and the export to the coefficient roadmap with its boundary.

### Filtrations supported in a bounded range, their truncation functor and its left adjoint

`HabiroCohomologyFoundations:HQ.5/truncated-filtered-objects-and-the-left-adjoint` · *theorem*

Let the category of filtered objects constant in degrees at most zero be given, and inside it the full subcategory of those that also vanish in degrees at least n plus one. (a) The inclusion has a left adjoint which replaces all filtration degrees at least n plus one by zero; moreover the canonical map from the truncation of the tensor product of one filtered object with the truncation of another to the truncation of the tensor product of the two is an equivalence, so that both the subcategory and the truncation functor carry canonical symmetric monoidal structures. (b) For a filtered E-infinity algebra T the induced symmetric monoidal functor on module categories admits an oplax symmetric monoidal left adjoint. (c) For a map of filtered E-infinity algebras and a module over the truncation of the source, there is a natural equivalence between the left adjoint applied to the base change and the base change of the left adjoint, a projection formula.

**Hypotheses.**

- The filtered objects are constant in degrees at most zero; without that normalisation the truncation functor is not the stated one.
- The left adjoint of (b) is only oplax symmetric monoidal, which is what forces the operadic rather than monoidal statements later.
- The projection formula in (c) is natural in both variables.

**Proof outline.**

1. Construct the truncation functor by replacing high degrees by zero and verify the adjunction by inspection.
2. Verify the monoidality equivalence for the tensor product of filtered objects, and deduce the symmetric monoidal structures.
3. Construct the left adjoint on modules by the adjoint functor theorem applied to the symmetric monoidal truncation, and observe that a left adjoint of a symmetric monoidal functor is oplax symmetric monoidal.
4. Prove the projection formula by checking it on free modules and extending by colimits.

**Acceptance.**

- The left adjoint is recorded as oplax and not lax.
- The monoidality equivalence of (a) is stated as the equivalence it is, since it is what makes the truncation symmetric monoidal.
- The projection formula names both algebras.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/filtered-graded-and-completion-conventions`

**Sources.**

- Lemma 4.2, The three clauses of the node.

  > The inclusion of the filtered objects vanishing above degree n into those constant below degree zero has a left adjoint, which on objects replaces all filtration degrees above n by zero. Moreover the canonical map from the truncation of the tensor product with a truncation to the truncation of the tensor product is an equivalence, so there is a canonical way to equip both with symmetric ...

### The canonical q-Hodge filtration on a smooth algebra with small primes inverted

`HabiroCohomologyFoundations:HQ.5/the-canonical-smooth-q-hodge-filtration` · *construction*

Let S be smooth over A and let n be a positive integer such that every prime at most n is invertible in S. Then the canonical map from the q-de Rham complex to the de Rham complex factors through an E-infinity algebra map into the power series ring in q-1 over the de Rham complex modulo the n-th power of q-1: it suffices to check this after p-completion, where for primes larger than n the factorisation through the (p-1)-st power is available and for primes at most n the p-completion of the q-de Rham complex vanishes. Equip the target with the combined Hodge and (q-1)-adic filtration reduced modulo the n-th power of q-1, regarded as an object in filtration degree n, and take the pullback of filtered objects in degrees at most n along the truncation functor. Applying the left adjoint of the previous node and completing at q-1 gives a filtered module over the (q-1)-adically filtered power series ring; pulling back along the map from the derived complex gives a filtration of the derived q-de Rham complex. If in addition the relative dimension of S over A is at most n, this is a q-Hodge filtration in the sense of the definition, and the filtration on the underived complex is automatically the completion of the one on the derived complex.

**Hypotheses.**

- Every prime at most n is invertible in S; this is what makes both halves of the factorisation argument work.
- The relative dimension of S over A is at most n for the q-Hodge conclusion; the construction itself only needs the invertibility.
- The reduction modulo the n-th power of q-1 is regarded as sitting in filtration degree n, which is not the (q-1)-adic filtration in the sense of the conventions stage.
- The construction depends on n, and the comparison of the constructions for different n is the subject of the functoriality node.

**Proof outline.**

1. Prove the factorisation of the canonical map through the truncated power series ring, by checking it after p-completion in the two regimes.
2. Define the combined Hodge and (q-1)-adic filtration on the truncated target and record that its top piece sits in filtration degree n.
3. Take the pullback of filtered objects in degrees at most n, in modules over the truncation of the filtered coefficient ring.
4. Apply the left adjoint and complete at q-1 to extend the filtration to all degrees, which realises the intended (q-1)-adic continuation above degree n.
5. Pull back along the map from the derived to the underived complex to land in the setting of the definition.
6. Under the dimension hypothesis, verify the four clauses of the definition and that the underived filtration is the completion of the derived one.

**Acceptance.**

- The factorisation argument is written out in both regimes.
- The truncated filtration and the role of the left adjoint are explicit, so that the continuation above degree n is not left as an intuition.
- The dimension hypothesis appears exactly where it is needed.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/truncated-filtered-objects-and-the-left-adjoint`, `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies`

**API.**

| name | role | statement |
| --- | --- | --- |
| `canonical-filtration` | constructor | For smooth S with all primes at most n invertible, a filtration on its derived q-de Rham complex. |
| `factorisation` | characterisation | The factorisation of the canonical map through the power series ring over the de Rham complex modulo the n-th power of q-1. |
| `truncated-pullback` | characterisation | The pullback square in filtered objects of degrees at most n which defines the filtration below degree n. |
| `extension` | constructor | The extension above degree n by the left adjoint, followed by (q-1)-completion. |
| `is-a-q-hodge-filtration` | compatibility | Under the dimension hypothesis, the resulting filtration satisfies the four clauses of the definition. |
| `underived-is-the-completion` | compatibility | The filtration on the underived complex is the completion of the one on the derived complex. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.5* — It is the construction that the existence theorem assembles into a functor across dimensions.
- *HabiroCohomologyFoundations:HQ.3* — Applied to a framed smooth algebra it agrees with the coordinate-dependent filtration.
- *HabiroCohomologyFoundations:HQ.7* — It is the input to the acceptance test on a smooth scheme with small primes inverted.

**Unit tests.**

- `dimension-at-most-one` — For relative dimension at most one and n equal to one the construction is the naive pullback of the Hodge filtration in degree one, continued by the (q-1)-adic filtration above; this is the source's motivating case.
- `framed-agreement` — For a framed smooth algebra the construction agrees with the coordinate-dependent filtration, which can be checked after reduction modulo q-1.
- `the-naive-pullback-fails-above-degree-one` — Without the truncation, the pullback of the Hodge filtration contains all of the (q-1)-multiples in every step and violates the rational clause above degree one; this is the non-example that forces the truncation.
- `small-primes-must-be-invertible` — If a prime at most n is not invertible in S the factorisation fails, and the construction does not produce a filtration; this is where the hypothesis is used.

**Sources.**

- Paragraph 4.1, The factorisation and its two-regime proof.

  > Let S be smooth of arbitrary dimension over A and let n be a positive integer such that all primes at most n are invertible in S. This assumption ensures that the canonical map factors through an E-infinity algebra map into the power series ring in q-1 over the de Rham complex modulo the n-th power of q-1. Indeed, for primes larger than n the p-completion factors through the (p-1)-st ...

- Paragraph 4.1, footnote and Paragraph 4.3, The filtration on the truncated target, the warning that it is not the adic filtration, and the use of the left adjoint.

  > Said differently, we wish to equip the power series ring modulo the n-th power of q-1 with the finite filtration given by the powers of q-1 in each degree. This is not the (q-1)-adic filtration in our sense. ... Applying the left adjoint we obtain a filtered module, and we can also take the pullback along the map from the derived complex.

- Lemma 4.6 and Lemma 4.7, The two conclusions under the dimension hypothesis.

  > With notation as above, assume additionally that the relative dimension of S over A is at most n. Then the filtration can naturally be equipped with the structure of a q-Hodge filtration. With the same assumptions, the filtration on the underived complex is automatically the completion of the one on the derived complex.

### Two other descriptions: the framed one, and the one through the p-tilde-de Rham complex

`HabiroCohomologyFoundations:HQ.5/framed-and-fixed-point-descriptions-of-the-canonical-filtration` · *comparison*

Two further descriptions of the canonical smooth filtration are available and are recorded because the uniqueness statement uses one of them. First, if S carries an etale framing in n coordinates and satisfies the hypotheses of the construction, then there is an equivalence of filtered modules between the canonical filtration and the coordinate-dependent one; both sit in the same pullback square below degree n, and the map produced by the left adjoint is an equivalence, which may be checked modulo q-1. Second, fix a prime p and recall the p-tilde-de Rham complex of Bhatt and Lurie, the homotopy fixed points of the action of the roots of unity of order p minus one inside the p-adic units on the p-completed q-de Rham complex, where a unit acts on the prism by raising q to that power. One may take the pullback of the Hodge filtration along the canonical map from the p-tilde-de Rham complex to the p-completed de Rham complex, with no combined filtration needed, extend by the left adjoint, and base change to the (q-1)-adically filtered coefficient ring; gluing these for all primes with the combined Hodge and (q-1)-adic filtration on the rationalisation gives the same filtration.

**Hypotheses.**

- The framed comparison needs the hypotheses of the construction and a chosen framing.
- The fixed-point description is p-complete and uses the action of the p-adic units on the q-de Rham prism through raising q to a power.
- The second description is recorded because the uniqueness statement may be phrased either through compatibility with the truncated map or through the action of the p-adic units.

**Proof outline.**

1. Observe that the truncation of the coordinate-dependent filtration and the truncated canonical filtration sit in the same pullback square, hence agree.
2. Apply the left adjoint and deduce a comparison map, then check that it is an equivalence modulo q-1.
3. Recall the definition of the p-tilde-de Rham complex as homotopy fixed points and the action of the p-adic units on the q-de Rham prism.
4. Build the pullback of the Hodge filtration along the canonical map, extend by the left adjoint and base change.
5. Glue over all primes with the rational combined filtration and check that the result is the canonical filtration.

**Acceptance.**

- Both descriptions are recorded with their hypotheses, and neither is asserted to be the definition.
- The framed comparison is proved by reduction modulo q-1 and not by inspection.
- The role of the action of the p-adic units in the uniqueness statement is recorded.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/the-canonical-smooth-q-hodge-filtration`, `HabiroCohomologyFoundations:HQ.3/the-coordinate-model-and-the-etale-case`, `PrismaticCohomology:PR.6`

**Sources.**

- Remark 4.4, The framed comparison and its proof.

  > If S satisfies the assumptions and is additionally equipped with an etale framing, then there exists an equivalence of filtered modules between the canonical filtration and the coordinate-dependent one. Indeed, the truncations agree since both sides fit into the same pullback diagram, and since the extension was defined as a left adjoint we obtain the map; to see that it is an equivalence ...

- Remark 4.5, The fixed-point description.

  > Recall that Bhatt and Lurie have defined a p-tilde-de Rham complex. Explicitly, it is the homotopy fixed points of the action of the roots of unity of order p minus one inside the p-adic units on the p-completed q-de Rham complex, where a unit acts on the prism by sending q to its power. We can then define a filtration as the pullback of the Hodge filtration along the canonical map, with ...

### Assembling the constructions for different bounds into one functor

`HabiroCohomologyFoundations:HQ.5/functoriality-across-dimensions` · *theorem*

For non-negative integers n and d let the category of smooth A-algebras of relative dimension at most d in which every prime at most n is invertible be given; let the union over d at most n of those with the two bounds equal be the n-th approximation, and let the union over all n be the category of smooth A-algebras with the factorial of the dimension inverted. Then (a) for every n the square formed by the four categories with bounds n and n plus one is a pushout of categories, and (b) in the category of functors from the smooth A-algebras of dimension at most n with the factorial of n plus one inverted, the constructions with bounds n and n plus one are naturally equivalent. Consequently the constructions assemble into a single functor on the whole union.

**Hypotheses.**

- The categories are full subcategories of smooth A-algebras determined by the two numerical conditions.
- The pushout in (a) is a pushout of infinity-categories and is the combinatorial input; the natural equivalence in (b) is the mathematical one.
- The assembled functor is a partial section of the forgetful functor, defined on the union and not on all smooth algebras.

**Proof outline.**

1. Prove the pushout statement by analysing which objects and morphisms lie in each of the four categories.
2. Prove the natural equivalence of the two constructions on the overlap, by comparing their truncations and using the projection formula for the left adjoint.
3. Combine the two to define the functor on the n plus first approximation by the universal property of the pushout.
4. Pass to the union over n.

**Acceptance.**

- The pushout square is stated with its four corners.
- The natural equivalence is stated on the overlap category and is what the pushout needs.
- The resulting functor is recorded as defined on the union only.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/the-canonical-smooth-q-hodge-filtration`, `HabiroCohomologyFoundations:HQ.5/truncated-filtered-objects-and-the-left-adjoint`

**Sources.**

- Paragraph 4.8 and Lemma 4.9, The combinatorial input.

  > For all non-negative n and d let the category of smooth A-algebras of relative dimension at most d with all primes at most n invertible be given. Our goal is to show that the functors for varying n combine into a single functor. For all n at least zero, the square formed by these categories with bounds n and n plus one is a pushout of infinity-categories.

- Lemma 4.10, The natural equivalence on the overlap.

  > For all n at least zero, in the infinity-category of functors from the smooth A-algebras of dimension at most n with the factorial of n plus one inverted to the category of pairs, there exists a natural equivalence between the constructions with bounds n and n plus one.

### Existence away from small primes

`HabiroCohomologyFoundations:HQ.5/existence-of-q-hodge-filtrations-for-smooth-algebras` · *theorem* · planet **Existence away from small primes**

Let A be a perfectly covered Lambda-ring and let S be a smooth A-algebra in which every prime at most the relative dimension of S over A is invertible. Then the derived q-de Rham complex of S over A admits a canonical q-Hodge filtration. More precisely, there is a functor from the category of such smooth A-algebras to the category of pairs which is a partial section of the forgetful functor. Both the base and the dimension bound are part of the statement: the primes to be inverted are those at most the relative dimension over A, and the base is an arbitrary perfectly covered Lambda-ring, not only the integers.

**Hypotheses.**

- A is a perfectly covered Lambda-ring.
- The primes to be inverted are those at most the relative dimension of S over A; inverting fewer does not suffice, and the bound is on the relative and not the absolute dimension.
- The section is partial: it is defined on the stated full subcategory and, by the no-go theorem, cannot be extended to all smooth A-algebras when A is not a rational algebra.

**Proof outline.**

1. Combine the construction with bound n equal to the relative dimension with the verification that it is a q-Hodge filtration.
2. Use the pushout and the natural equivalence of the functoriality node to assemble the constructions for varying n into a single functor.
3. Record that the functor is a section of the forgetful functor by construction.
4. Record the boundary: by the no-go theorem there is no extension to all smooth A-algebras over a non-rational base.

**Acceptance.**

- The dimension bound and the base hypothesis are both in the statement.
- The conclusion is a functor, not merely an existence statement object by object.
- The statement is recorded as a partial section, with the no-go theorem cited for why it cannot be total.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/the-canonical-smooth-q-hodge-filtration`, `HabiroCohomologyFoundations:HQ.5/functoriality-across-dimensions`, `HabiroCohomologyFoundations:HQ.3/no-functorial-choice-of-q-hodge-filtration`

**Sources.**

- Theorem 4.11, The statement of the node.

  > Let A be a perfectly covered Lambda-ring and let S be a smooth A-algebra such that all primes at most the relative dimension of S over A are invertible in S. Then the derived q-de Rham complex admits a canonical q-Hodge filtration. More precisely, there exists a functor from that category to the category of pairs which is a partial section of the forgetful functor.

- Theorem 1.15, The introduction's form, which is how the stage text cites it.

  > The forgetful functor admits a section over the full subcategory of smooth algebras such that all primes at most the relative dimension become invertible.

### The multiplicativity is operadic and partial: the category is not closed under tensor products

`HabiroCohomologyFoundations:HQ.5/partial-operad-multiplicativity` · *theorem* · planet **Partial-operad multiplicativity**

The full subcategory of smooth A-algebras with the factorial of the dimension inverted is not closed under tensor products inside smooth A-algebras, and the source records no way of making it symmetric monoidal. What exists instead is a non-full sub-operad of the operad attached to the symmetric monoidal category of smooth A-algebras: an object of the fibre over a finite pointed set lies in it exactly when all its entries do, and a morphism lies in it exactly when both its source and its target do and the target of a cocartesian lift of its image also does, equivalently when the morphism factors through a cocartesian lift. The functor of the existence theorem underlies a map of operads from this sub-operad to the operad attached to the category of pairs, preserving all cocartesian lifts that exist in the source. The multiplicative structure this induces is exactly the one the source object has in that sub-operad: for an algebra of relative dimension d, once every prime at most twice d is invertible the multiplication map is a morphism of the sub-operad and one obtains a homotopy-unital multiplication; once every prime at most r times d is invertible one obtains coherent associativity for up to r factors. Inverting the primes up to d alone therefore gives no multiplication at all, and no amount of inverting a fixed finite set of primes gives a homotopy-coherent commutative structure for an algebra of positive dimension.

**Hypotheses.**

- The sub-operad is non-full; taking the full sub-operad spanned by the subcategory would make the construction fail.
- The bounds are 2d for a multiplication and r times d for coherence through r factors, where d is the relative dimension over A.
- The left adjoint used in the construction is oplax symmetric monoidal, which is why the statement is about operads and cartesian lifts rather than about lax monoidal functors.

**Proof outline.**

1. Define the sub-operad by the two conditions on objects and morphisms, and record that it is not full.
2. Prove that the truncated construction is symmetric monoidal on the category of smooth algebras with the small primes inverted, using the monoidality of the truncation functor and the (q-1)-completed tensor product.
3. Pass to the dual cartesian fibrations to encode the oplax structure of the composite with the left adjoint and the completion.
4. Prove that cartesian morphisms whose sources all have relative dimension at most n are preserved, which is the technical heart.
5. Conclude that the functor underlies a map of operads preserving the cocartesian lifts that exist, and read off the arity bounds from the definition of the sub-operad.

**Acceptance.**

- The failure of closure under tensor products is stated first, as a fact about the category.
- The sub-operad is defined precisely and its non-fullness is recorded.
- The arity bounds 2d and r times d are stated, and the statement that inverting up to d alone gives no multiplication is explicit.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/existence-of-q-hodge-filtrations-for-smooth-algebras`, `HabiroCohomologyFoundations:HQ.5/truncated-filtered-objects-and-the-left-adjoint`, `HabiroCohomologyFoundations:HQ.5/functoriality-across-dimensions`

**Sources.**

- Paragraph 4.12, The failure of closure and the definition of the sub-operad.

  > The category of smooth A-algebras with the factorial of the dimension inverted is not closed under tensor products in smooth A-algebras and we don't see a way of equipping it with a symmetric monoidal structure. To address this problem we define a sub-operad: an object lies in it exactly when all entries do, and a morphism exactly when source and target do and the target of a cocartesian ...

- Paragraph 4.12, continued, The arity bounds.

  > As soon as all primes at most twice the relative dimension are invertible in S, the multiplication map is a morphism in the sub-operad, and so S will have a homotopy-unital multiplication there. If for some r at least three all primes at most r times the relative dimension are invertible, then the multiplication will be coherently associative for up to r factors.

- Corollary 4.16, The operadic statement.

  > The functor of the existence theorem underlies a functor of operads from the sub-operad to the operad attached to the category of pairs, which preserves all cocartesian lifts that exist in the source.

### Algebraic Habiro cohomology, and perfectness in the smooth proper case

`HabiroCohomologyFoundations:HQ.5/algebraic-habiro-cohomology-of-a-scheme` · *construction* · planet **Algebraic Habiro cohomology**

Combining the descent theorem with the existence theorem gives, for every smooth scheme over A on which every prime at most the relative dimension is invertible, a canonical object of the derived category of the scheme with coefficients in the Habiro ring, obtained by sheafifying the Habiro-Hodge complex of the canonical filtration on affines and gluing by etale descent. Its sheaf cohomology is the algebraic Habiro cohomology of the scheme. If moreover the scheme is smooth and proper over the ring of integers with an integer N inverted, where N is also divisible by every prime at most the relative dimension, then the global sections of that object form a perfect complex over the Habiro completion of the Habiro ring with N inverted, and not over a raw localisation of the Habiro ring.

**Hypotheses.**

- The scheme is smooth over A with every prime at most the relative dimension invertible on it; the construction is by gluing the affine case.
- For the perfectness statement the scheme is smooth and proper over the ring of integers with N inverted, and N is divisible by every small prime.
- The coefficient ring in the perfectness statement is the Habiro completion of the localisation, which is not the localisation of the Habiro ring.

**Proof outline.**

1. Apply the existence theorem on affines to get canonical pairs, and apply the descent theorem to get Habiro-Hodge complexes.
2. Check that the assignment is a sheaf for the etale topology, using the etale base change of the underlying complexes, and glue.
3. Define algebraic Habiro cohomology as the sheaf cohomology of the resulting object.
4. In the smooth proper case, prove perfectness of the global sections over the Habiro completion of the localised ring, by reducing modulo the cyclotomic elements to the corresponding statement for the q-de Rham-Witt complexes and using Habiro-completeness to lift.
5. Record that the coefficient ring is the completion of the localisation and not the localisation of the completion.

**Acceptance.**

- The gluing is by etale descent and the sheaf property is checked.
- The perfectness statement carries both hypotheses on N.
- The coefficient ring is named exactly.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/existence-of-q-hodge-filtrations-for-smooth-algebras`, `HabiroCohomologyFoundations:HQ.3/habiro-descent`, `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex`, `HabiroCohomologyFoundations:HQ.4/etale-base-change-and-the-sheaf-property`, `HabiroRings:HR.2/habiro-complete-modules`, `HabiroRings:HR.5/the-relative-habiro-ring`

**API.**

| name | role | statement |
| --- | --- | --- |
| `habiro-cohomology` | constructor | For a smooth scheme with the small primes inverted, an object of its derived category with Habiro-ring coefficients, and its sheaf cohomology. |
| `etale-descent` | characterisation | The assignment is an etale sheaf, which is how the affine construction glues. |
| `affine-case` | example | On an affine it is the Habiro-Hodge complex of the canonical q-Hodge filtration. |
| `perfectness` | characterisation | For smooth proper schemes over the localised base, the global sections are perfect over the Habiro completion of the localised ring. |
| `mod-cyclotomic` | projection | Its reduction modulo a cyclotomic element has the ascending filtration of the descent theorem, with q-de Rham-Witt graded pieces. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.6* — It is the algebraic side of the comparison problem with the analytic Habiro stack.
- *HabiroCohomologyFoundations:HQ.7* — It is what the acceptance test on a smooth scheme computes.
- *HabiroRings:HR.6* — In relative dimension zero its degree-zero part is the relative Habiro ring.

**Unit tests.**

- `relative-dimension-zero` — For a finite etale algebra the construction is the relative Habiro ring, since no primes need to be inverted and the Habiro-Hodge complex is that ring.
- `no-information-at-small-primes` — By construction the theory contains no information at primes at most the relative dimension, since those primes are inverted; this is a property, not a defect, and is what distinguishes it from the analytic theory.
- `perfectness-coefficient-ring` — The perfect complex is over the Habiro completion of the localised ring; a statement over the raw localisation of the Habiro ring would be a different and unproved assertion.
- `gluing-is-etale-and-not-zariski-only` — The sheaf property is for the etale topology, which is what the base change of the q-de Rham-Witt complexes supplies.

**Sources.**

- Paragraph 1.16, The construction and the name.

  > Combining the descent theorem and the smooth existence theorem allows us to define canonical objects in the derived category of X with coefficients in the Habiro ring for any smooth scheme X over the integers such that all primes at most the dimension are invertible on X. The sheaf cohomology then deserves to be called the algebraic Habiro cohomology of X.

- Paragraph 1.16, continued, The perfectness statement with its coefficient ring.

  > For example, if X is smooth and proper over the integers with N inverted, where N is also divisible by all primes at most the dimension, then the global sections will be a perfect complex over the Habiro completion of the Habiro ring with N inverted.

### The rings of interest: p-completely perfectly covered bases, quasi-lci algebras and relative semiperfectness

`HabiroCohomologyFoundations:HQ.5/the-quasi-lci-inputs-and-condition-R` · *definition* · planet **Condition (R)**

Work p-completely. A p-completely perfectly covered delta-ring is a p-complete delta-ring whose map to its p-completed colimit perfection is p-completely faithfully flat, equivalently whose Frobenius is p-completely flat; such a ring is p-torsion free. A p-quasi-lci algebra over it is a p-complete ring whose p-completed cotangent complex has p-complete Tor-amplitude in homological degrees zero and one. Such an algebra is relatively semiperfect if its reduction modulo p has surjective relative Frobenius, which forces the module of differentials modulo p to vanish and the cotangent complex to be concentrated in degree one. An algebra of perfect-regular presentation is a quotient of a p-complete relatively perfect delta-algebra, meaning one whose relative Frobenius is an isomorphism, by an ideal generated by a Koszul-regular sequence. For such inputs: the derived de Rham complex, its Hodge completion, every degree of the completed Hodge filtration and the derived q-de Rham complex are all static and p-torsion free; and the uncompleted Hodge filtration is static in every degree if and only if the reduction modulo p is relatively semiperfect. Globally, condition (R) on an A-algebra R asks that for every prime p the ring R is p-torsion free, its p-completion is p-quasi-lci over the p-completion of A, and its reduction modulo p is relatively semiperfect over that completion; the introduction's equivalent phrasing is that R is p-torsion free, the p-completed derived de Rham complex is static, and the Hodge filtration is a descending filtration of ideals. A useful class of examples is the quotient of an etale algebra over a perfect Lambda-ring by a Koszul-regular ideal, when the quotient is p-torsion free. There are p-complete algebras whose cotangent complex is concentrated in degree one but whose reduction modulo p is not semiperfect, so relative semiperfectness is a genuine extra condition.

**Hypotheses.**

- The p-complete notions are relative to a fixed prime; condition (R) quantifies over all primes.
- Relative semiperfectness is not implied by the Tor-amplitude condition; the source cites a counterexample for primes at least three.
- Perfect-regular presentation is a sufficient condition, not a characterisation.

**Proof outline.**

1. Define the p-completely perfectly covered delta-rings and record that they are p-torsion free.
2. Define the p-quasi-lci algebras by the Tor-amplitude of the p-completed cotangent complex.
3. Define relative semiperfectness and derive the vanishing of the differentials modulo p and the concentration of the cotangent complex in degree one.
4. Define algebras of perfect-regular presentation and record the explicit description of the de Rham and q-de Rham complexes as the divided power and q-divided power envelopes.
5. Prove the staticity and torsion statements, and the equivalence between staticity of the uncompleted Hodge filtration and relative semiperfectness.
6. State condition (R) globally and record the example class and the counterexample to the implication.

**Acceptance.**

- All three p-complete conditions are stated, and their relations are recorded as implications with directions.
- The equivalence between staticity of the uncompleted Hodge filtration and relative semiperfectness is stated as an equivalence.
- The counterexample showing that relative semiperfectness is not automatic is recorded.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.2/the-derived-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies`, `HabiroRings:HR.1/perfectly-covered`, `PrismaticCohomology:PR.0`, `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:Algebra.Etale`

**API.**

| name | role | statement |
| --- | --- | --- |
| `perfectly-covered-delta-ring` | structure | The p-complete base: a delta-ring whose Frobenius is p-completely flat. |
| `quasi-lci` | structure | A p-complete algebra whose p-completed cotangent complex has Tor-amplitude in degrees zero and one. |
| `relatively-semiperfect` | characterisation | Surjectivity of the relative Frobenius modulo p, with its consequences for the differentials and the cotangent complex. |
| `perfect-regular-presentation` | example | A quotient of a relatively perfect delta-algebra by a Koszul-regular ideal, with the divided power and q-divided power envelope descriptions. |
| `staticity` | characterisation | Staticity and torsion-freeness of the de Rham and q-de Rham complexes and of the completed Hodge filtration. |
| `condition-R` | structure | The global condition on an A-algebra, quantified over all primes. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.5* — The naive filtration is defined as a one-categorical preimage, which needs the staticity that these conditions supply.
- *HabiroCohomologyFoundations:HQ.5-trace* — The trace-theoretic theorem's quasi-lci hypothesis is the same condition.
- *HabiroCohomologyFoundations:HQ.7* — The acceptance suite includes a quasi-regular input, which must be checked against these conditions.

**Unit tests.**

- `koszul-regular-quotient` — The quotient of a perfect Lambda-ring by a Koszul-regular ideal, when p-torsion free, satisfies all the conditions; for instance the quotient of the free p-complete perfect delta-ring on a generator by a power of that generator.
- `staticity-is-an-equivalence` — The uncompleted Hodge filtration is static in every degree exactly when the reduction modulo p is relatively semiperfect; a definition that asserted staticity without this hypothesis would be wrong.
- `semiperfectness-is-not-automatic` — There are p-complete algebras with cotangent complex concentrated in degree one whose reduction modulo p is not semiperfect; this is the non-example.
- `smooth-is-not-quasi-lci-in-this-sense` — A smooth algebra of positive relative dimension has cotangent complex in degree zero, so it is quasi-lci but not relatively semiperfect; the two existence theorems therefore treat disjoint classes.

**Sources.**

- Paragraph 4.17, The three p-complete conditions.

  > Temporarily, A will be a p-completely perfectly covered delta-ring, by which we mean a p-complete delta-ring for which the map into its p-completed colimit perfection is p-completely faithfully flat; equivalently the Frobenius is p-completely flat. Since perfect delta-rings are p-torsion free, A must be too. We will consider p-quasi-lci algebras: p-complete rings whose cotangent complex ...

- Lemma 4.18, The staticity statements and the equivalence.

  > Let R be p-torsion free with cotangent complex of p-complete Tor-amplitude concentrated in degree one. Then the de Rham complex, its Hodge completion, every degree in the completed Hodge filtration and the q-de Rham complex are all static and p-torsion free. The uncompleted Hodge filtration is static in every degree if and only if the reduction modulo p is relatively semiperfect.

- Paragraph 1.18 and Remark 4.20, The example class and the counterexample.

  > For example, this happens in the following case: let B be a perfect Lambda-ring, B' an etale B-algebra, and R the quotient of B' by an ideal generated by a Koszul-regular sequence; if R is p-torsion free it satisfies the other conditions as well. There exist p-complete algebras whose cotangent complex has p-complete Tor-amplitude concentrated in degree one but whose reduction modulo p is ...

### The one-categorical preimage filtration, and the injectivity that always holds

`HabiroCohomologyFoundations:HQ.5/the-naive-filtration-for-quasi-regular-inputs` · *construction*

Let R be a p-torsion free p-quasi-lci algebra over a p-completely perfectly covered delta-ring, with reduction modulo p relatively semiperfect. After inverting p and completing at q-1 the derived de Rham and derived q-de Rham complexes are related by a functorial equivalence, and both sides are static rings. Equip the target with the combined Hodge and (q-1)-adic filtration, which is a descending filtration by ideals, and define the filtration on the q-de Rham complex as the one-categorical preimage of that filtration under the rationalisation map; equivalently as the pullback taken in the one-category of filtered modules over the (q-1)-adically filtered power series ring. The result is a descending filtration of ideals in a static ring and is automatically a filtered E-infinity algebra. The canonical projection to the de Rham complex induces a unique filtered map to the Hodge filtration, because the Hodge filtration is the preimage of its rationalisation, which follows from injectivity of the map on associated gradeds. The canonical map always induces a degreewise injection from the quotient of this filtration by q-1 into the Hodge filtration; only surjectivity is at issue, and in general this filtration is not a q-deformation of the Hodge filtration.

**Hypotheses.**

- The preimage is taken in the one-category, not derived; this is legitimate exactly because both sides are static.
- The filtration is by ideals in a static ring, which is why no coherence data have to be supplied by hand.
- The injectivity statement is unconditional under the standing hypotheses; the deformation statement is not.

**Proof outline.**

1. Record the rationalised comparison and the staticity of both sides.
2. Equip the target with the combined Hodge and (q-1)-adic filtration and record that it is a filtration by ideals.
3. Define the filtration as the one-categorical preimage and record that it is a filtered E-infinity algebra.
4. Construct the unique filtered map to the Hodge filtration, by checking that the Hodge filtration is the preimage of its rationalisation, which reduces to injectivity of the map of associated gradeds, which holds since the exterior powers of the cotangent complex are p-completely flat over a p-torsion free ring.
5. Prove that the induced map from the quotient by q-1 to the Hodge filtration is a degreewise injection.

**Acceptance.**

- The preimage is explicitly one-categorical and the reason that is allowed is recorded.
- The construction of the filtered map to the Hodge filtration is proved, using the injectivity on associated gradeds.
- The statement that the filtration is in general not a q-deformation is recorded here, not hidden.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/the-quasi-lci-inputs-and-condition-R`, `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.1/rationalised-q-crystalline-comparison`

**API.**

| name | role | statement |
| --- | --- | --- |
| `naive-filtration` | constructor | For a quasi-lci input, a descending filtration of ideals on the static q-de Rham complex. |
| `preimage-description` | characterisation | It is the one-categorical preimage of the combined Hodge and (q-1)-adic filtration under the rationalisation map. |
| `filtered-algebra` | structure | It is automatically a filtered E-infinity algebra over the filtered coefficient ring. |
| `map-to-hodge` | projection | The unique filtered map to the Hodge filtration induced by the projection to the de Rham complex. |
| `injectivity` | characterisation | The induced map from the quotient by q-1 into the Hodge filtration is a degreewise injection. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.5* — The well-behavedness theorem asks precisely whether this map is surjective, hence an equivalence.
- *HabiroCohomologyFoundations:HQ.5* — The global construction glues these p-complete filtrations with the rational combined filtration.
- *RefinedTraceMethods:RT.4:q-Hodge* — The trace-theoretic construction produces the same filtration when only an algebra structure for the little one-disc operad is available.

**Unit tests.**

- `the-alpha-equals-one-failure` — For the quotient of the free p-complete delta-ring on a generator by that generator, the filtration is not a q-deformation of the Hodge filtration; this is the source's counterexample and the reason the construction alone is insufficient.
- `higher-powers-succeed` — For the quotient by the square of the generator a modification of the q-divided power lies in the p-th filtration step and reduces to the right divided power modulo q-1.
- `injectivity-is-unconditional` — The map from the quotient by q-1 into the Hodge filtration is injective under the standing hypotheses alone; a construction that failed this would already be wrong for an etale input.
- `not-a-derived-preimage` — The preimage is taken in the one-category; the derived preimage would give a different filtration, and the construction is well posed only because both sides are static.

**Sources.**

- Construction 4.21, The construction and the argument for the filtered map to the Hodge filtration.

  > We now construct the filtration as the one-categorical preimage of the combined Hodge and (q-1)-adic filtration under the rationalisation map; in other words, as the pullback taken in the one-category of filtered modules. We remark that it will be a descending filtration of ideals in a static ring, hence automatically a filtered E-infinity algebra. ... to see this we must check that the ...

- Lemma 4.26 and the sentence before Theorem 4.22, That the construction is in general not a deformation, and the unconditional injectivity.

  > In general, the filtration will be nonsense. But it does behave as desired in the following cases. ... The canonical map induces a degree-wise injection from the quotient of the filtration by q-1 into the Hodge filtration.

### Two sufficient conditions: higher powers of a regular sequence, or a spherical lift of the perfection

`HabiroCohomologyFoundations:HQ.5/when-the-naive-filtration-deforms-the-hodge-filtration` · *theorem* · planet **The well-behavedness theorem**

Let A be a p-completely perfectly covered delta-ring and R a p-torsion free p-quasi-lci A-algebra whose reduction modulo p is relatively semiperfect. Suppose one of the following holds: (a) R admits a perfect-regular presentation whose ideal is generated by a Koszul-regular sequence of higher powers, that is, a sequence of powers of the members of a Koszul-regular sequence with every exponent at least two; or (b) the p-completed base change of R to the colimit perfection of A admits a lift to a p-complete connective algebra over the sphere spectrum for the little one-disc operad whose base change to the p-complete integers recovers it. Then the naive filtration is a q-deformation of the Hodge filtration: the canonical map induces an equivalence from its quotient by q-1 onto the Hodge filtration on the derived de Rham complex, the quotient being taken with q-1 in filtration degree one. Condition (b) is an existence condition only and the resulting filtration does not depend on the chosen lift. For primes larger than two condition (b) implies condition (a), by lifting the perfection to a commutative ring spectrum and applying Burklund's theorem on multiplicative structures on quotients; at the prime two the same argument only gives the implication when all exponents are even and at least four, so that condition (a) at the prime two is not subsumed.

**Hypotheses.**

- The standing hypotheses of the previous node are in force.
- In (b) the lift is of the base change to the perfection, not of R itself, and it is only required to be an algebra for the little one-disc operad.
- The implication from (b) to (a) holds for odd primes; at the prime two it holds only under the stated restriction on the exponents.

**Proof outline.**

1. Reduce to surjectivity, since injectivity is unconditional.
2. Reduce to the case where the base is perfect, by the flat base change property of the naive filtration.
3. In case (a), analyse the q-divided powers explicitly: modify the q-divided power of the generator of the ideal by elements divisible by q-1 so that the result lies in the required power of the ideal after completed rationalisation; the decomposition of the delta of a higher power into a multiple of a power of the generator and a multiple of p is what makes this possible.
4. In case (b), use the spherical lift to produce the required elements, and record that the construction of the filtration does not use the lift, so the answer is independent of it.
5. Record Burklund's argument giving the implication from (b) to (a) for odd primes, and the weaker statement at the prime two.

**Acceptance.**

- Both conditions are stated with their exact hypotheses, in particular that the lift in (b) is of the base change to the perfection.
- The independence of the choice of lift is recorded.
- The implication from (b) to (a) is recorded with its prime restriction, and condition (a) is not presented as a special case of (b) at the prime two.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/the-naive-filtration-for-quasi-regular-inputs`, `HabiroCohomologyFoundations:HQ.5/the-quasi-lci-inputs-and-condition-R`, `HabiroCohomologyFoundations:HQ.5/flat-base-change-for-the-naive-filtration`

**Sources.**

- Theorem 4.22, The statement of the node with both conditions.

  > Let A be a p-completely perfectly covered delta-ring and R a p-torsion free quasi-lci A-algebra whose reduction modulo p is relatively semiperfect. Suppose one of the following: there exists a perfect-regular presentation whose ideal is generated by a Koszul-regular sequence of higher powers with all exponents at least two; or the p-completed base change of R to the perfection admits a ...

- Remark 4.23, The implication between the two conditions and its prime restriction.

  > For primes larger than two, condition (b) implies condition (a). Indeed, the perfection lifts uniquely to a connective p-complete commutative ring spectrum, and Burklund's theorem on multiplicative structures on quotients provides the required structures. For the prime two the same argument shows the implication only if all exponents are even and at least four. It is somewhat surprising ...

- Example 4.24, The mechanism of case (a) and the failure at exponent one.

  > If the exponent is one, there's nothing we can do: no modification by elements divisible by q-1 will ever get rid of a non-integral multiple of the delta of the generator, as that delta is a polynomial variable. For the exponent two, however, the delta of the square decomposes, and the modified q-divided power is contained in the required filtration step and reduces correctly modulo q-1.

### Flat base change, which reduces the well-behavedness theorem to a perfect base

`HabiroCohomologyFoundations:HQ.5/flat-base-change-for-the-naive-filtration` · *theorem*

Let R be a p-torsion free p-quasi-lci algebra over a p-completely perfectly covered delta-ring A whose reduction modulo p is relatively semiperfect, and let A map to A' by a p-completely flat map of delta-rings with A' also p-completely perfectly covered. Put R' for the p-completed base change. Then the canonical map from the (p,q-1)-completed base change of the naive filtration along A to A' onto the naive filtration of R' over A' is an equivalence.

**Hypotheses.**

- The map of delta-rings is p-completely flat and the target is again p-completely perfectly covered.
- The base change is completed at p and at q-1.
- The statement is about the naive filtration and not about arbitrary filtrations.

**Proof outline.**

1. Check the statement on the underlying q-de Rham complexes, where it is base change for the derived q-de Rham complex.
2. Check it on the rationalised side, where the filtration is the combined Hodge and (q-1)-adic filtration and base change is flat.
3. Deduce the statement for the preimage, using flatness to see that the one-categorical preimage commutes with the base change.
4. Record that this is what allows the well-behavedness theorem to be proved after replacing the base by its perfection.

**Acceptance.**

- The flatness hypothesis is used where it is needed, namely to commute the preimage with the base change.
- The completions in the statement are recorded.
- The use of the lemma in the proof of the well-behavedness theorem is recorded.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/the-naive-filtration-for-quasi-regular-inputs`, `HabiroCohomologyFoundations:HQ.5/the-quasi-lci-inputs-and-condition-R`

**Sources.**

- Lemma 4.27, The statement of the node.

  > Let R be a p-torsion free p-quasi-lci A-algebra whose reduction modulo p is relatively semiperfect, let A map to A' p-completely flatly with A' also p-completely perfectly covered, and let R' be the p-completed base change. Then the canonical map from the (p,q-1)-completed base change of the filtration onto the filtration of R' over A' is an equivalence.

- Sentence before Lemma 4.27, Why the lemma is stated, which the node records as its use.

  > The filtration from the construction enjoys a general flat base change property. This will allow us to reduce the proof of the well-behavedness theorem to the case where A is perfect.

### The global filtration for quasi-regular inputs, and the section it defines

`HabiroCohomologyFoundations:HQ.5/the-canonical-section-on-quasi-regular-inputs` · *theorem* · planet **Canonical section on quasi-regular inputs**

Let A be a perfectly covered Lambda-ring and let R be an A-algebra such that for every prime p the ring R is p-torsion free, its p-completion is p-quasi-lci over the p-completion of A, and its reduction modulo p is relatively semiperfect over that completion. Define a filtration on the derived q-de Rham complex of R over A as the pullback, in filtered E-infinity algebras over the (q-1)-adically filtered power series ring, of the product over all primes of the p-complete naive filtrations against the combined Hodge and (q-1)-adic filtration on the power series ring over the rationalised derived de Rham complex, over their common rationalised product; the right vertical map exists because both sides are filtrations by submodules, so only a set-level condition has to be checked. Let the quasi-regular q-Hodge category be the full subcategory of those R for which in addition each p-complete naive filtration is a q-deformation of the p-complete Hodge filtration. Then this construction defines a functor from that category to commutative algebra objects in the category of pairs, and that functor is a partial section of the forgetful functor. The filtration can moreover be upgraded to a filtered derived commutative algebra, compatibly with all the data. The category is not closed under tensor products, but it fails only through staticity and torsion: if the derived tensor product of two of its objects is static and p-torsion free for every prime, then it lies in the category and the completed filtered tensor product of the two filtrations is its filtration; consequently the functor underlies a map of operads out of the corresponding non-full sub-operad, and it is symmetric monoidal on the full subcategory of objects flat over A.

**Hypotheses.**

- The pullback is taken in filtered E-infinity algebras and its right vertical map exists for the stated set-level reason.
- The membership condition in the quasi-regular q-Hodge category is the conclusion of the well-behavedness theorem, not one of its hypotheses; the theorem is what populates the category.
- The failure of closure under tensor products is only through staticity and torsion-freeness, which is stated as an equivalence.

**Proof outline.**

1. Construct the global filtration by the displayed pullback and check that the right vertical map exists.
2. Verify the four clauses of the definition of a q-Hodge filtration for the glued object, using the p-complete deformation hypothesis for clause (b), the construction for clause (c), and the construction of the p-complete filtration for clause (c_p).
3. Record the upgrade to a filtered derived commutative algebra.
4. Prove that the derived tensor product of two objects of the category lies in it when it is static and p-torsion free, and that the completed filtered tensor product computes its filtration.
5. Deduce the operadic statement and the symmetric monoidality on the flat subcategory.
6. Record the example class: quotients of relatively perfect Lambda-algebras by Koszul-regular sequences of higher powers lie in the category by the well-behavedness theorem.

**Acceptance.**

- The gluing square is written with all its corners and the reason its right vertical map exists.
- The defining condition of the category is stated, and it is recorded that the well-behavedness theorem is what produces objects.
- The failure of closure under tensor products is stated precisely, together with the exact circumstances under which it does not fail.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/when-the-naive-filtration-deforms-the-hodge-filtration`, `HabiroCohomologyFoundations:HQ.5/the-naive-filtration-for-quasi-regular-inputs`, `HabiroCohomologyFoundations:HQ.5/flat-base-change-for-the-naive-filtration`, `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.1/the-derived-commutative-lift`

**Sources.**

- Construction 4.28, The global construction.

  > Let R be an A-algebra such that for all primes p it is p-torsion free, its p-completion is p-quasi-lci and its reduction modulo p is relatively semiperfect. We construct the filtration as the pullback of the product of the p-complete filtrations against the combined Hodge and (q-1)-adic filtration on the rationalisation, taken in filtered E-infinity algebras. To see that the right ...

- Theorem 4.29, The theorem of the node.

  > Let the quasi-regular q-Hodge category be the category of all A-algebras satisfying those conditions and such that the canonical morphism induces an equivalence from the p-complete filtration modulo q-1 onto the p-complete Hodge filtration for every prime. Then the construction determines a functor into commutative algebra objects in the category of pairs, which is a partial section of ...

- Lemma 4.33 and Corollary 4.34 and Remark 4.31, Monoidality, the operadic statement and the derived commutative upgrade.

  > If the derived tensor product is static and p-torsion free for all primes, then it also lies in the category, and the canonical map from the completed filtered tensor product of the two filtrations onto its filtration is an equivalence. The functor underlies a functor of operads which preserves all cocartesian lifts that exist in the source; in particular, restricted to the objects flat ...

### In what sense each section is unique, and what extra datum the smooth case needs

`HabiroCohomologyFoundations:HQ.5/uniqueness-of-the-two-sections` · *theorem*

In the quasi-regular case the section constructed is terminal among all q-Hodge filtrations on its inputs, and the q-deformation clause then forces it to be unique. In the smooth case uniqueness requires an additional compatibility: either that the q-Hodge filtration be compatible with the map from the q-de Rham complex to the power series ring over the de Rham complex modulo the n-th power of q-1 used in the construction, or that the p-completed filtration carry an action of the p-adic units compatible with the action on p-completed q-de Rham cohomology coming from the identification with prismatic cohomology over the q-de Rham prism. Under either additional assumption the constructed section is initial among all choices, and the q-deformation clause again forces uniqueness. Without such an additional datum, no uniqueness is claimed.

**Hypotheses.**

- The terminality in the quasi-regular case and the initiality in the smooth case go in opposite directions; each is then upgraded to uniqueness by the deformation clause.
- The action of the p-adic units is the one induced on the prism by sending q to a power, transported through the prismatic comparison.
- Neither statement asserts uniqueness without the additional compatibility in the smooth case.

**Proof outline.**

1. In the quasi-regular case, show that any q-Hodge filtration maps to the constructed one, so that it is terminal, and use the deformation clause to conclude that the map is an equivalence.
2. In the smooth case, record the two possible additional compatibilities and show that under either the constructed filtration is initial.
3. Use the deformation clause to upgrade initiality to uniqueness.
4. Record explicitly that no uniqueness statement is available in the smooth case without one of the two additional data.

**Acceptance.**

- The two directions, terminal and initial, are recorded with the case each belongs to.
- The two alternative additional data in the smooth case are both stated.
- The absence of an unconditional uniqueness statement in the smooth case is recorded.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/existence-of-q-hodge-filtrations-for-smooth-algebras`, `HabiroCohomologyFoundations:HQ.5/the-canonical-section-on-quasi-regular-inputs`, `HabiroCohomologyFoundations:HQ.5/framed-and-fixed-point-descriptions-of-the-canonical-filtration`

**Sources.**

- Paragraph 1.21, Both uniqueness statements with their hypotheses.

  > It's natural to ask if the sections are unique. In the quasi-regular case, it will be straightforward to see that the section we construct is terminal among all choices, and then the q-deformation condition forces it to be unique. In the smooth case, we need to assume additionally that our q-Hodge filtrations are compatible with the morphism to the power series ring over the de Rham ...

### What is exported for finite etale arithmetic inputs, and the comparison that is not claimed

`HabiroCohomologyFoundations:HQ.5/the-export-to-the-coefficient-roadmap` · *comparison*

For a finite etale algebra over the base, the Habiro-Hodge complex of the canonical filtration is concentrated in degree zero and is the relative Habiro ring; this object is exported to the coefficient roadmap, which owns its comparison with the explicitly presented number-field Habiro ring and the Frobenius-glued Taylor maps that present it. What this roadmap proves is the comparison with the q-1 completion, namely that the (q-1)-completion of the exported object is the q-Hodge complex, and that its reduction modulo a cyclotomic element is the corresponding q-Witt ring. The comparison of the modules graded by the third K-group, and the possible loss of information indexed by that group on completion, belong to the coefficient and number-field roadmaps and are imported, not proved here. A comparison of rings in relative dimension zero does not identify every module graded by the third K-group with a cohomology class on a higher-dimensional scheme, and no node of this packet makes that identification.

**Hypotheses.**

- The input is finite etale over the base, so the Habiro-Hodge complex is static.
- The presentation of the number-field ring by Frobenius-glued Taylor maps is the number-field roadmap's and is imported with its hypotheses on the inverted integer.
- The module comparison and the K-group-indexed loss of information are imported statements, with their own hypotheses.

**Proof outline.**

1. Specialise the descent theorem and the etale case to a finite etale input and record that the result is the relative Habiro ring.
2. State the q-1 completion comparison and the reduction modulo a cyclotomic element.
3. Name the two imported statements and the roadmaps that own them.
4. Record the boundary: a ring comparison in relative dimension zero is not a statement about higher-dimensional cohomology classes.

**Acceptance.**

- Each exported and imported statement is attributed to the roadmap that owns it.
- The boundary statement is explicit.
- No node of this packet proves a statement about the modules graded by the third K-group.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/algebraic-habiro-cohomology-of-a-scheme`, `HabiroCohomologyFoundations:HQ.3/the-coordinate-model-and-the-etale-case`, `HabiroRings:HR.6`, `HabiroNumberFields:HB.6`, `HabiroNumberFields:HB.7`

**Sources.**

- Corollary 3.13, The identification that is exported.

  > If R is etale over A, then the Habiro-Hodge complex is the relative Habiro ring constructed in the coefficient roadmap.

- Paragraph 1.4, The attribution of the explicit presentation to the other roadmap.

  > The Habiro ring of a number field is recovered by this construction, and its explicit presentation by Frobenius-glued Taylor series is the subject of the companion work.

## HQ.5-trace — Trace-theoretic existence

Imported from `RefinedTraceMethods:RT.4:q-Hodge`. In the form the stage text
cites: `R` quasi-syntomic, **2 invertible**, and a **connective spherical `E₂`**
**lift** `S_R` with `S_R ⊗ Hℤ ≃ HR`. The body theorem is more general and carries
a longer hypothesis list, including an **addendum at `p = 2`**.

**A lift merely over `ku` is not enough**, and for the `E₁` version that is
*proved*: `ℤ_p{x}_∞/x` carries an `E₁`-`ku`-algebra structure but its filtration
is not a q-deformation of Hodge. A lift to `j` is expected to suffice; the
obstruction is named.

The `E₁` refinement is not this theorem with hypotheses removed: it carries
**even-resolution assumptions** instead, and buys independence of the lift.

Coverage: **source_decomposed**.

Four nodes. The trace-theoretic existence theorem in both the imported introductory form and the body form with its full hypothesis list and its addendum at the prime two; the counterexample showing that a lift over connective complex K-theory does not suffice, together with the expectation about the image-of-J spectrum and its named obstruction; the one-disc refinement with the even-resolution hypotheses it carries in place of the two-discs assumption and the independence of the chosen lift; and the identification of the number-field Habiro ring as a limit of genuine fixed points.

### q-Hodge filtrations from topological cyclic homology over connective complex K-theory

`HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations` · *theorem* · planet **Trace-theoretic existence**

In the form the roadmap imports, the statement is: let R be a quasi-syntomic ring in which two is invertible and which admits a lift to a connective algebra for the little two-discs operad over the sphere spectrum whose base change to the integers recovers R. Then the derived q-de Rham complex of R over the integers admits a q-Hodge filtration, and the completion of that filtration is, up to a doubling shift, the associated graded of the circle-equivariant even filtration on the negative topological cyclic homology of connective complex K-theory tensored with that lift, relative to connective complex K-theory. The body version of the theorem is more general and carries its hypotheses explicitly: the base is a perfectly covered Lambda-ring each of whose p-completions admits a p-complete connective commutative lift whose Tate-valued Frobenius agrees with the delta-ring Frobenius and is equipped with a circle-equivariant structure, so that the lift is a cyclotomic base; the input is a quasi-lci algebra with bounded p-power torsion each of whose p-completions admits either a lift for the little two-discs operad or, for that prime, a quasi-syntomic cover whose reduction modulo p is relatively semiperfect together with a cosimplicial resolution by algebras for the little one-disc operad; and in addition the two-adic completion must satisfy the second of those two conditions. The conclusion is the equivalence of the completed q-Hodge filtration with the even filtration, together with the identifications of its reduction and its rationalisation that make the pair an object of the category of pairs of this roadmap.

**Hypotheses.**

- The importing roadmap is RefinedTraceMethods, which owns the construction; this roadmap consumes its output as an object of the category of pairs.
- In the imported form: R is quasi-syntomic, two is invertible in R, and the lift is for the little two-discs operad over the sphere spectrum, with base change to the integers recovering R.
- In the body form the hypotheses on the base and on the input are as stated, and the addendum on the two-adic completion is a genuine extra condition, not a consequence.
- A lift over connective complex K-theory alone does not suffice; that is the subject of the next node.

**Proof outline.**

1. Import the construction of the even filtration on the negative topological cyclic homology of the lift relative to connective complex K-theory, in the solid condensed setting the source uses.
2. Import the comparison of that filtration with the p-complete q-de Rham complex and the resulting p-complete q-Hodge filtration.
3. Glue the p-complete filtrations with the rational combined Hodge and adic filtration to obtain a global filtration, which needs the addendum at the prime two.
4. Verify the clauses of the definition of a q-Hodge filtration for the glued object: the reduction modulo the deformation parameter gives the Hodge filtration and the rationalisation gives the combined filtration.
5. Record the resulting pair as an object of the category of pairs of this roadmap, and hence as an input to the descent theorem.

**Acceptance.**

- Both the imported and the body form of the hypotheses are recorded, and the difference between them is visible.
- The addendum at the prime two is present.
- The conclusion is stated as producing an object of the category of pairs, so that the descent theorem applies to it.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.5/the-quasi-lci-inputs-and-condition-R`, `RefinedTraceMethods:RT.4:q-Hodge`, `RefinedTraceMethods:RT.6`

**Sources.**

- Theorem 1.2, The imported form of the theorem, which is the form the stage text cites.

  > Let R be a quasi-syntomic ring such that two is invertible in R. Assume that R admits a lift to a connective algebra for the little two-discs operad over the sphere spectrum whose base change to the integers recovers R. Then the derived q-de Rham complex can be equipped with a q-deformation of the Hodge filtration, and the completion of this filtration agrees, up to shift, with the graded ...

- Paragraph 4.25 and Theorem 4.27, The body form with its full hypothesis list and the addendum at the prime two.

  > From now on, the base is a perfectly covered Lambda-ring each of whose p-completions carries a p-complete connective commutative lift whose Tate-valued Frobenius agrees with the delta-ring Frobenius with a circle-equivariant structure; the input is a quasi-lci algebra with bounded p-power torsion each of whose p-completions satisfies the two-discs or the one-disc condition. From now on ...

### Why the spherical lift cannot be weakened to a lift over connective complex K-theory

`HabiroCohomologyFoundations:HQ.5-trace/a-lift-over-connective-complex-k-theory-is-not-enough` · *comparison*

It is natural to ask whether the spherical lift for the little two-discs operad can be replaced by an algebra over connective complex K-theory for that operad whose base change to the integers recovers the ring. The source considers this unlikely and proves the corresponding statement false for the one-disc version. The counterexample is the quotient of the free p-complete perfect delta-ring on a generator by that generator: the perfect delta-ring lifts uniquely to the sphere spectrum, hence to connective complex K-theory, and the quotient carries an algebra structure over connective complex K-theory for the little one-disc operad by the theory of even quotients; but the corresponding naive filtration on the p-completed q-de Rham complex of that quotient is provably not a q-deformation of the Hodge filtration. The source does expect that a lift to the connective image-of-J spectrum would be enough, but records that the diagram which would make that argument work is not circle-equivariantly commutative, so this remains an expectation.

**Hypotheses.**

- The counterexample is for the one-disc version; for the two-discs version the source states that it knows no counterexample but considers the weakening unlikely.
- The witness object is the same one that witnesses the non-existence theorem of the filtration stage.
- The statement about the image-of-J spectrum is an expectation with a named obstruction and is not a theorem.

**Proof outline.**

1. Record the question and the source's assessment.
2. Exhibit the witness object and the two structures it carries: the unique lift of the perfect delta-ring and the one-disc algebra structure on the quotient over connective complex K-theory.
3. Record that the naive filtration for that ring is not a q-deformation of the Hodge filtration, which is the computation of the existence stage.
4. Conclude that the one-disc version with a lift over connective complex K-theory is false.
5. Record the expectation about the image-of-J spectrum together with the obstruction, namely that the relevant diagram is not circle-equivariantly commutative.

**Acceptance.**

- The counterexample is given with both of its structures.
- The distinction between the disproved one-disc version and the merely doubted two-discs version is kept.
- The image-of-J expectation is recorded as an expectation, with its obstruction.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.5/the-naive-filtration-for-quasi-regular-inputs`, `HabiroCohomologyFoundations:HQ.3/no-functorial-choice-of-q-hodge-filtration`

**Sources.**

- Paragraph 1.11, The counterexample and its two structures.

  > It's natural to ask if the lift can be replaced by the weaker datum of an algebra over connective complex K-theory for the little two-discs operad. Although we don't know any counterexample, we consider this unlikely. At the very least, the one-disc version of the theorem is provably wrong if only a one-disc lift over connective complex K-theory is assumed. Here's a counterexample: let ...

- Paragraph 1.11, end, The expectation and the obstruction.

  > We do expect, however, that it's enough to have a lift to the image of J spectrum. Unfortunately, the diagram above is not circle-equivariantly commutative, similar to what happens for the p-adic integers. But the issue doesn't seem to be too serious.

### The one-disc refinement carries its own resolution hypotheses, and what it buys

`HabiroCohomologyFoundations:HQ.5-trace/the-one-disc-refinement-and-the-prime-two` · *theorem* · planet **The one-disc refinement**

When only a lift for the little one-disc operad is available the even filtration is not defined, and the source replaces it by an ad hoc filtration: one assumes a quasi-syntomic cover whose reduction modulo p is relatively semiperfect and a cosimplicial resolution of the lift by algebras for the little one-disc operad, each p-complete and connective, and defines the filtration as the limit over the cosimplicial diagram of the double-speed Whitehead filtrations. With those hypotheses the p-complete form of the existence theorem still holds, and the resulting q-Hodge filtration admits the explicit description of the existence stage: it is the one-categorical preimage of the combined Hodge and adic filtration under the rationalisation map, and therefore does not depend on the chosen one-disc lift. The two-inverted hypothesis of the imported form is expected to be removable once the corresponding statement about the Tate construction is proved at the prime two; in any case the one-disc version can be proved unconditionally at the prime two. None of this is the theorem with hypotheses removed: the one-disc refinement carries the even-resolution assumptions in place of the two-discs assumption.

**Hypotheses.**

- The ad hoc filtration is defined only relative to a chosen cosimplicial resolution; the theorem asserts that the resulting q-Hodge filtration is independent of the one-disc lift, not that the resolution is unique.
- The relative semiperfectness of the cover modulo p is part of the hypothesis list.
- The removability of the two-inverted hypothesis in the two-discs version is an expectation conditional on an unproved statement.

**Proof outline.**

1. Record the definition of the ad hoc filtration as a limit of double-speed Whitehead filtrations over a cosimplicial resolution.
2. Record the hypotheses this requires: a quasi-syntomic cover, relative semiperfectness modulo p, and a connective p-complete cosimplicial lift.
3. Record that the resulting filtration is the one-categorical preimage of the combined Hodge and adic filtration, hence independent of the lift.
4. Record the status at the prime two: the one-disc version is unconditional there, while the two-discs version currently carries the two-inverted hypothesis.
5. Record that the one-disc version is not the two-discs version with hypotheses deleted.

**Acceptance.**

- The ad hoc filtration is defined and its hypotheses are listed.
- The independence of the lift is stated as a theorem with its reason, namely the explicit description.
- The status at the prime two is recorded for each version separately.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.5/the-naive-filtration-for-quasi-regular-inputs`

**Sources.**

- Paragraph 1.9, The ad hoc filtration and the hypotheses it needs.

  > For the perfect even filtration to be defined, the lift needs to be an algebra for the little two-discs operad. However, in the case where the ring only admits a one-disc lift, it can still happen that the p-completed topological Hochschild homology is concentrated in even degrees, or more generally that the lift admits a cosimplicial resolution by one-disc algebras for which it is. In ...

- Theorem 4.17, The explicit description and the independence of the lift.

  > Under the assumptions above, the q-Hodge filtration is the descending filtration by ideals given by the one-categorical preimage of the combined Hodge and adic filtration under the rationalisation map. In particular, it is independent of the choice of the spherical one-disc lift, and canonically a filtered E-infinity algebra over the filtered coefficient ring.

- Paragraph 1.10, The status at the prime two.

  > We expect that the assumption that two is invertible can be removed once the corresponding statement is proved at the prime two as well. In any case, the one-disc version of the theorem can be proved unconditionally for the prime two.

### The Habiro ring of a number field as a limit of genuine fixed points

`HabiroCohomologyFoundations:HQ.5-trace/the-number-field-ring-from-periodic-complex-k-theory` · *comparison*

For a number field and an integer divisible by six and by the discriminant, let the unique lift of the ring of integers with that integer inverted to an etale extension of the sphere spectrum be given. Then the relative Habiro ring of that ring is the degree-zero homotopy of the limit, over the positive integers ordered by divisibility, of the homotopy fixed points for the quotient circle of the genuine fixed points for the cyclic subgroup of order m of the topological Hochschild homology of periodic complex K-theory tensored with that lift, relative to periodic complex K-theory. This is the homotopy-theoretic form of the degree-zero comparison that the coefficient roadmap owns; it is recorded here because it identifies the object this roadmap exports, and it is not used as an input to any construction of this packet.

**Hypotheses.**

- The integer inverted is divisible by six and by the discriminant of the field; this is the hypothesis under which the etale lift and the comparison exist.
- The genuine fixed points are for the cyclic subgroups of the circle and the outer fixed points are homotopy fixed points for the quotient circle.
- The statement is about the degree-zero homotopy group only.

**Proof outline.**

1. Record the hypotheses on the field and the inverted integer.
2. Record the construction of the etale spherical lift and its uniqueness.
3. Record the formula for the relative Habiro ring as the stated degree-zero homotopy group.
4. Record that this is an identification of the exported object and not an input to any construction here.

**Acceptance.**

- The hypothesis on the inverted integer is stated with both divisibility conditions.
- The genuine and homotopy fixed points are distinguished.
- The node is marked as recording an identification and not as supplying an input.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.5/the-export-to-the-coefficient-roadmap`, `HabiroRings:HR.5`

**Sources.**

- Corollary 6.15, The statement of the node.

  > Let F be a number field and let an integer be divisible by six and by the discriminant of F. Let the unique lift of the ring of integers with that integer inverted to an etale extension of the sphere spectrum be given. Then the relative Habiro ring is the degree-zero homotopy of the limit over the positive integers of the homotopy fixed points for the quotient circle of the genuine fixed ...

## HQ.6 — Algebraic and analytic boundaries

The comparison is a **named problem**, not a theorem: construct a natural
transformation after base change to a completed localisation of the analytic
Habiro ring, and determine where it is an equivalence. The source *expects*
equality after that base change and records that the base change **erases**
**information on either side**.

Three differences must survive any statement. **Small primes**: the algebraic
theory has none by construction, the analytic one usually does. **Roots of**
**unity**: the analytic side becomes the de Rham stack, hence infinitesimal
cohomology, ill-behaved in characteristic `p`; the algebraic side gives q-de
Rham–Witt cohomology. **Stacky approach**: not expected on the algebraic side,
and the reason is the proved arity bound.

The condensed and analytic-stack machinery supplies a **language**, not a
comparison. Nothing here is used as a theorem in K-theory, diamonds or Langlands.

Coverage: **source_decomposed**.

Three nodes. The comparison problem stated with its domain, its coefficient change and the transformation to be constructed, recorded as an expectation and not as a theorem; the three differences the source records, with the root-of-unity difference tied to the second clause of the descent theorem and the absence of a coherent commutative structure tied to the proved arity bounds; and the discipline that the analytic machinery supplies a language and not a comparison, with the one condensed statement this roadmap actually uses named and attributed.

### The comparison problem, stated with its domain, its coefficient change and its status

`HabiroCohomologyFoundations:HQ.6/the-algebraic-against-analytic-comparison-problem` · *definition* · planet **Algebraic against analytic**

State the following as a named mathematical problem and not as a theorem. Let X be a smooth scheme over the base on which every prime at most the relative dimension is invertible, so that its algebraic Habiro cohomology is defined; and let the analytic Habiro cohomology of X be the sheaf cohomology of the analytic Habiro stack attached to X in the analytic framework. The problem is to construct a natural transformation between the two after base change to a suitably completed localisation of the analytic Habiro ring, and to determine on which class of X it is an equivalence. The expected answer, which the source states as an expectation, is that the two become equal after that base change; the source also records that the base change erases a great deal of information on either side, so an equivalence after base change is not an equivalence of the original theories. The problem is not used as a theorem anywhere in this roadmap, and no statement of this packet about K-theory, diamonds or geometric Langlands rests on it.

**Hypotheses.**

- The algebraic side requires the small primes to be invertible; the analytic side does not, which is one of the three recorded differences.
- The comparison is expected only after base change to a completed localisation of the analytic Habiro ring, and that base change loses information.
- The analytic objects are supplied by the analytic roadmap and are not constructed here; that roadmap is a draft and its acceptance is a prerequisite for this layer to be actionable.

**Proof outline.**

1. Fix the algebraic side as the object constructed in the existence stage.
2. Name the analytic side and the roadmap that owns it, together with the coefficient ring of the base change.
3. State the problem as the construction of a natural transformation and the determination of its domain of validity.
4. Record the expected answer as an expectation with its attribution, and record the information loss on either side.
5. Record the discipline: the statement is never used as a hypothesis or a theorem elsewhere in this packet.

**Acceptance.**

- The problem is stated with its domain, its coefficient change and the transformation expected.
- The status is recorded as an expectation, with an attribution.
- The discipline that it is not used as a theorem is recorded and is verifiable by inspecting the prerequisites of the other nodes.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.5/algebraic-habiro-cohomology-of-a-scheme`, `AnalyticHabiroStack:HS.3`

**API.**

| name | role | statement |
| --- | --- | --- |
| `problem-statement` | structure | The comparison problem, with the algebraic object, the analytic object, the coefficient change and the transformation to be constructed. |
| `domain` | characterisation | The class of schemes for which both sides are defined: smooth with the small primes invertible. |
| `expected-answer` | relation | The expected equivalence after base change to a completed localisation of the analytic Habiro ring, recorded as an expectation. |
| `information-loss` | compatibility | The record that the base change loses information on either side, so the expectation is not an equivalence of the original theories. |
| `non-use` | relation | The discipline that the statement is not used as a hypothesis or conclusion anywhere else in this packet. |

**Used by.**

- *HabiroCohomologyFoundations:HQ.7* — The acceptance suite records that no test may rely on this statement.
- *AnalyticHabiroStack:HS.3* — That roadmap supplies the analytic object and the base-change functor, with its own source gaps.

**Unit tests.**

- `relative-dimension-zero` — For a finite etale input both sides are rings and the comparison is a ring map; this is the only regime in which anything is currently provable.
- `domain-is-not-all-smooth-schemes` — For a smooth scheme of relative dimension d without the primes at most d inverted the algebraic side is not defined, so the problem does not even pose itself.
- `not-an-equivalence-of-the-original-theories` — An equivalence after base change would not give an equivalence before it, since the base change is not conservative; this non-example is the content of the information-loss clause.
- `no-downstream-use` — No node of this packet lists this statement among its prerequisites except the acceptance suite, which records the prohibition.

**Sources.**

- Paragraph 1.17, The problem, the expectation and the information loss.

  > It is not yet known how algebraic Habiro cohomology relates to the sheaf cohomology of Scholze's analytic Habiro stack, which we would like to call analytic Habiro cohomology for clarity. We expect algebraic and analytic Habiro cohomology to become equal after base change to a suitably completed localisation of Scholze's analytic Habiro ring. Note, however, that this base change erases ...

- Paragraph 1.3, The attribution of the analytic side.

  > Stacky approaches and Scholze's Habiro stack: the analytic construction comes with a stacky approach, whereas for the algebraic theory we do not expect one.

### Small primes, roots of unity and the absence of a stacky approach

`HabiroCohomologyFoundations:HQ.6/the-three-recorded-differences` · *comparison*

The source records three concrete differences between the two theories, each of which must survive any comparison statement. First, evaluation at small primes: by construction the algebraic theory of a smooth scheme contains no information at primes at most the relative dimension, because those primes are inverted, whereas the analytic theory usually does contain non-trivial information at such primes, since the inverted integer is not invertible everywhere on the analytic stack. Second, evaluation at roots of unity: with the current construction the analytic stack becomes the algebraic de Rham stack when the parameter is specialised to a root of unity, so its cohomology is Grothendieck's infinitesimal cohomology, which is ill-behaved in positive characteristic; whereas in the algebraic theory the same specialisation yields q-de Rham-Witt cohomology by the second clause of the descent theorem, which is much closer to crystalline cohomology in positive characteristic. In particular the root-of-unity infinitesimal theory is not the algebraic q-de Rham-Witt specialisation. Third, the stacky approach: the analytic theory comes with one by construction, the algebraic theory is not expected to, and the source does not even expect the Habiro-Hodge complex of a smooth scheme to carry a homotopy-coherent commutative structure, for the reason made precise by the partial-operad statement: the multiplication comes from the diagonal, whose target has twice the dimension, so more and more primes must be inverted as the coherence increases.

**Hypotheses.**

- The first difference is a consequence of the construction of the algebraic theory and is not a defect to be repaired.
- The second difference is a statement about the current construction of the analytic stack.
- The third is an expectation, made quantitative by the arity bounds of the existence stage.

**Proof outline.**

1. Record the small-prime difference and its reason on each side.
2. Record the root-of-unity difference, naming the infinitesimal cohomology on one side and the q-de Rham-Witt cohomology on the other, and the clause of the descent theorem that supplies the latter.
3. Record the absence of a stacky approach and the heuristic for the absence of a coherent commutative structure, and tie it to the arity bounds proved in the existence stage.
4. Record that each difference is a constraint any comparison statement must respect.

**Acceptance.**

- Each of the three differences is stated with the reason on each side.
- The second difference names both cohomology theories.
- The third is tied to a proved statement, the arity bounds, rather than left as a heuristic alone.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.6/the-algebraic-against-analytic-comparison-problem`, `HabiroCohomologyFoundations:HQ.3/habiro-descent`, `HabiroCohomologyFoundations:HQ.5/partial-operad-multiplicativity`, `HabiroCohomologyFoundations:HQ.4/no-automatic-multiplicative-upgrade`

**Sources.**

- Paragraph 1.17(a) and (b), The first two differences.

  > Evaluation at small primes: by construction, algebraic Habiro cohomology of a smooth scheme will contain no information at primes at most the dimension; by contrast, analytic Habiro cohomology usually does contain non-trivial information at such primes. Evaluation at roots of unity: with the current construction, the analytic Habiro stack becomes the algebraic de Rham stack if the ...

- Paragraph 1.17(c), The third difference and its reason.

  > By construction, analytic Habiro cohomology comes with a stacky approach. For algebraic Habiro cohomology, we don't expect a stacky approach to exist. In fact, we don't even expect the Habiro-Hodge complex to carry a homotopy-coherent commutative algebra structure. The reason goes roughly as follows: the multiplication should come from the diagonal embedding; thus, for the multiplication ...

### The discipline: a language for a comparison is not a comparison

`HabiroCohomologyFoundations:HQ.6/what-may-not-be-inferred-from-the-analytic-side` · *comparison*

The condensed and analytic-stack machinery of the surrounding campaign supplies a language in which the comparison problem can be posed: solid condensed spectra, analytic rings, six-functor formalisms and the analytic Habiro stack. It does not supply a proof that the two theories agree, and nothing in this packet treats it as doing so. In particular: the existence of a six-functor formalism on the analytic side is not an input to any algebraic statement of this packet; a lecture or course announcement is not a proof source and the statements attributed to one are recorded as such; and the expected comparison is not used as a hypothesis in any K-theoretic, diamond-theoretic or Langlands-theoretic statement. The source's own solid condensed appendix, which shows that bounded-below Habiro-complete objects are closed under the solid tensor product, is the only condensed input this roadmap actually uses, and it is owned by the coefficient roadmap.

**Hypotheses.**

- The analytic-stack roadmap is a draft; until it is accepted, this layer has no supplier for its analytic side.
- The only condensed statement used is the closure of bounded-below Habiro-complete objects under the solid tensor product, and it is imported.
- Statements attributed to a lecture series are recorded with that attribution.

**Proof outline.**

1. List the analytic machinery and state precisely what it supplies, namely a language.
2. State the three prohibitions: no six-functor input to an algebraic statement, no lecture-derived theorem, and no use of the expected comparison as a hypothesis.
3. Record the one condensed statement this roadmap does use and name its owner.
4. Record that the audit, and not a silent upgrade, is where the source-status questions are kept.

**Acceptance.**

- The three prohibitions are stated explicitly.
- The one condensed import is named and attributed.
- The status of lecture-based statements is recorded.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.6/the-algebraic-against-analytic-comparison-problem`, `HabiroRings:HR.2/the-solid-comparison-is-bounded-below`

**Sources.**

- Appendix B, opening, The only condensed material the source supplies, which is the one import this roadmap uses.

  > In this appendix we'll study the Habiro completion functor and show that it behaves for all practical purposes like completion at a finitely generated ideal. We'll also study Habiro completion in the setting of solid condensed mathematics.

- Paragraph 1.3, The attribution of the analytic construction to a lecture series, which the node records as a source-status point.

  > Stacky approaches and Scholze's Habiro stack.

## HQ.7 — Acceptance tests and Lean boundary

Five examples and four structural checks, each with a concrete witness and each
naming the node it exercises. **No test may assume the analytic comparison.**

The suggested Lean file is executable only at the elementary q-difference layer
over Mathlib's polynomial API. Everything above is a signature, and for each item
the missing machinery is named. **No `Prop` placeholder and no axiom stands for**
**the q-Hodge conditions.**

Coverage: **source_decomposed**.

Two nodes. The acceptance suite, with five examples each tested against the specialisation at the parameter value one and the p-adic comparison, four structural checks each with a concrete witness, and the prohibition on assuming the algebraic-against-analytic comparison; and the executable boundary, which separates the elementary q-difference layer that can be stated against the pinned Mathlib polynomial API from the signature-only layer and names, for each item of the latter, the machinery whose absence prevents an executable statement.

### The acceptance suite for this roadmap

`HabiroCohomologyFoundations:HQ.7/the-acceptance-tests` · *application*

The suite has five examples and four structural checks. The examples: a polynomial ring in one variable over the base, where the q-de Rham complex is the two-term q-difference complex and the canonical q-Hodge filtration exists with no primes inverted; the q-difference operator at the parameter one, where the q-integer of n specialises to n and the complex specialises to the ordinary de Rham complex; a finite etale algebra over a ring of integers, where the Habiro-Hodge complex is the relative Habiro ring and its reduction modulo a cyclotomic element is the corresponding q-Witt ring; a smooth scheme of relative dimension d with every prime at most d inverted, where algebraic Habiro cohomology is defined and its reduction modulo a cyclotomic element carries the ascending filtration with q-de Rham-Witt graded pieces; and a quasi-syntomic input in which two is invertible together with an explicit connective lift for the little two-discs operad, where the trace-theoretic theorem supplies the filtration. Each example must be checked to commute with the specialisation at the parameter one and with the p-adic comparison over the q-de Rham prism. The structural checks: that a filtered object differs from its colimit modification, by exhibiting the q-Hodge complex of a framed smooth algebra as differing from its q-de Rham complex by the factor in every differential; that derived limit and torsion corrections are retained, by exhibiting an example where the derived quotient differs from the ordinary one; that increasing tensor powers leave the smooth existence category, by exhibiting a d-dimensional algebra whose square needs primes up to twice d inverted; and that the Hodge-completed and uncompleted theories differ, by exhibiting a smooth algebra in characteristic zero whose derived de Rham complex is not its de Rham complex. No test may assume the algebraic-against-analytic comparison.

**Hypotheses.**

- Each example is tested against the two specialisations named, and not against a third that the roadmap has not proved.
- The fourth structural check is about the derived versus the underived complex and is a statement in characteristic zero.
- The prohibition on assuming the analytic comparison is part of the suite.

**Proof outline.**

1. Write out the five examples with the hypotheses each needs.
2. For each, record the two specialisations that must commute and the node that supplies each side.
3. Write out the four structural checks, each with a concrete witness.
4. Record the prohibition on the analytic comparison and the reason.
5. Record which node of this packet each test exercises, so that a failing test names a statement.

**Acceptance.**

- Every test names the node it exercises.
- Every test has a concrete witness object, not merely a shape.
- The prohibition on the analytic comparison is recorded.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies`, `HabiroCohomologyFoundations:HQ.3/habiro-descent`, `HabiroCohomologyFoundations:HQ.3/the-coordinate-model-and-the-etale-case`, `HabiroCohomologyFoundations:HQ.5/existence-of-q-hodge-filtrations-for-smooth-algebras`, `HabiroCohomologyFoundations:HQ.5/partial-operad-multiplicativity`, `HabiroCohomologyFoundations:HQ.5/algebraic-habiro-cohomology-of-a-scheme`, `HabiroCohomologyFoundations:HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.2/animation-does-not-preserve-the-values-on-smooth-algebras`, `HabiroCohomologyFoundations:HQ.6/the-algebraic-against-analytic-comparison-problem`

**Sources.**

- Paragraph 1.10, The witness for the first two examples and the formula they test.

  > In the coordinate-dependent q-de Rham complex of the polynomial ring in one variable, the q-differential sends the m-th power to the q-integer of m times the (m-1)-st power times the differential of the variable, where the q-integer is the sum of the first m powers of q.

- Paragraph 1.17(c) and Corollary 4.16, The witness for the third structural check.

  > For the multiplication to be defined, we need to invert all primes at most twice the dimension. ... The functor underlies a functor of operads which preserves all cocartesian lifts that exist in the source.

### What the suggested Lean file states, and what it does not

`HabiroCohomologyFoundations:HQ.7/the-executable-boundary` · *application*

The suggested Lean file contains executable signatures for the elementary q-difference layer over the existing polynomial API: the q-integer as a geometric sum with its four identities, the q-difference operator on the polynomial ring in one variable with its value on powers and its twisted Leibniz rule, the vanishing of the square of the induced differential in the one-variable case, and the specialisation at the parameter one to the ordinary derivative. Everything above that layer is a signature only: the derived q-de Rham complex, the q-Hodge filtration, the q-Hodge and Habiro-Hodge complexes, the q-de Rham-Witt complexes and the Nygaard filtration are declared with the types their statements require and proved by the placeholder tactic, because their construction needs filtered and graded objects in an enhanced derived category, animation, decalage and prismatic cohomology, none of which exists in either pinned library. No proposition standing for the q-Hodge conditions is introduced as an opaque hypothesis, and no axiom is used: where a contract cannot be stated it is left as a signature with a documented statement in the roadmap document, not replaced by a placeholder predicate.

**Hypotheses.**

- The pinned libraries supply only the polynomial API and the Witt vector API in degree zero; everything else is absent, as the reviewed audit records.
- The file is not compiled against the pinned commits in this job, and says so.
- No axiom and no opaque predicate standing for the q-Hodge conditions is admitted.

**Proof outline.**

1. List the executable layer and the Mathlib declarations it builds on.
2. List the signature-only layer and, for each item, the machinery whose absence prevents an executable statement.
3. Record the prohibition on opaque predicates and axioms.
4. Record that the document, not the Lean file, is the definitive statement of every contract above the elementary layer.

**Acceptance.**

- The executable and the signature-only layers are separated and each item is assigned to one of them.
- For each signature-only item the missing machinery is named.
- The prohibition on placeholders is recorded and is checkable by reading the file.

**Prerequisites.** `HabiroCohomologyFoundations:HQ.1/what-this-layer-imports-and-what-it-owns`, `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.4/the-q-de-rham-witt-complex`, `mathlib:geom_sum_mul`, `mathlib:Polynomial.comp`, `mathlib:Polynomial.derivative_X_pow`, `mathlib:Polynomial.cyclotomic_prime`

**Sources.**

- Paragraph 1.10, The content of the executable layer.

  > The q-differential sends the m-th power of the variable to the q-integer of m times the (m-1)-st power times the differential, where the q-integer is the sum of the first m powers of q. This formula gives special treatment to the parameter value one.

- Definition 3.2, The contract that is declared as a signature and not as an opaque predicate.

  > A q-Hodge filtration is a filtered module over the (q-1)-adically filtered polynomial ring equipped with the listed data and compatibilities.

## Mistakes found in the source

Three, all misprints whose intended meaning is clear from the surrounding text;
the nodes use the corrected statements. None of them affects a proof.

### HabiroCohomologyFoundations/E1 — misprint

**Where.** Section 1, the introductory definition of a q-Hodge filtration (Definition 1.6), the first display

**Printed.** The filtered module is displayed as the diagram whose first two terms are both the zeroth filtration step, with the arrow pointing from the second to the first.

**Correction.** The second term should be the first filtration step: the display should read the zeroth step, then the first step, then the second, with arrows pointing leftwards.

**Reason.** The very next clause of the same definition requires the filtration to be descending with the zeroth step the derived q-de Rham complex, and the body definition of the same notion displays the diagram correctly with the steps indexed zero, one, two.

**Known correction.** new. Looked for in: the arXiv abstract page for a later version, which lists v2 as current on the date of access; the body definition in the same file, which is correct; the companion paper on connective complex K-theory, which cites the body definition.

### HabiroCohomologyFoundations/E2 — misprint

**Where.** Section 3, the proposition on Habiro descent for q-de Rham complexes (Proposition 3.47), clause (b)

**Printed.** The clause reads that the decalage at q-1 of the q-Hodge complex of S over A is the q-de Rham complex of R over A.

**Correction.** The right-hand side should be the q-de Rham complex of S over A; the letter R does not occur in the statement of this proposition.

**Reason.** The proposition fixes a pair whose underlying algebra is called S and is assumed smooth over A; the following sentence of the same clause, and the whole proof, are about S. The letter R is the name used for a general animated algebra elsewhere in the section.

**Known correction.** new. Looked for in: the arXiv abstract page for a later version; the surrounding remark and the proof of the same proposition, both of which use S; the introduction's remark quoting the same statement, which also uses S.

### HabiroCohomologyFoundations/E3 — misprint

**Where.** Section 3, the construction of the twisted q-Hodge filtration p-adically and the two paragraphs on its lax symmetric monoidal structure (paragraphs 3.32, 3.34 and 3.35)

**Printed.** Three displays write the symbol for the q-Witt analogue of the Hodge filtration, the one defined on q-de Rham-Witt complexes, applied to the p-completed twisted q-de Rham complex.

**Correction.** In all three places the symbol should be the one for the twisted q-Hodge filtration, the object the construction is defining; the q-Witt Hodge filtration is a filtration of a different object.

**Reason.** The construction is labelled as the one defining the twisted q-Hodge filtration, the recursion is on that object, and the very next display in the same subsection, as well as the global construction and the deformation proposition, use the twisted q-Hodge symbol for the same object. The two symbols denote filtrations of different complexes, so the printed form does not typecheck.

**Known correction.** new. Looked for in: the arXiv abstract page for a later version; the neighbouring displays in the same subsection, which use the intended symbol; the global construction and the deformation proposition, which are stated with the intended symbol.

## Gaps

### The proofs of the long technical lemmas were read only as statements

Needed by: `HabiroCohomologyFoundations:HQ.3`, `HabiroCohomologyFoundations:HQ.4`, `HabiroCohomologyFoundations:HQ.5`.

The source's section 3 and section 4 contain a chain of technical lemmas whose statements this packet decomposes but whose proofs were not read line by line: the Nygaard fibre sequences and their comparison, the two compatibility lemmas for the twisted filtration after inverting p, the partial descent proposition, the monoidality lemma for the descent, the truncation lemma with its projection formula, the pushout and comparison lemmas for functoriality across dimensions, the cartesian-lift lemma, and the proof of the well-behavedness theorem beyond the worked example. The proofSteps of the corresponding nodes record the strategy the source states in its own outline, not a verified reading. NEXT SOURCE ACTION: read those proofs and either confirm the recorded strategies or replace them with the actual arguments; the Nygaard comparison and the well-behavedness theorem are the two that a Lean implementation would hit first.

### The trace-theoretic construction was imported, not decomposed

Needed by: `HabiroCohomologyFoundations:HQ.5-trace`.

The companion paper on connective complex K-theory was obtained and its statements were read, but its sections on the solid even filtration, on solid topological Hochschild homology and on genuine equivariant Habiro descent were not. This roadmap's stage text says to import that theorem from RefinedTraceMethods RT.4, and that is what the four nodes do: they state the hypotheses in both the introductory and the body form and record what may not be weakened. NEXT SOURCE ACTION: the trace roadmap must decompose the solid even filtration and the comparison with p-complete q-de Rham cohomology; until it does, the existence statement for trace-theoretic inputs rests on a cited theorem and not on a decomposed proof.

### The analytic side of the comparison layer has no obtainable source and no atlas owner

Needed by: `HabiroCohomologyFoundations:HQ.6`.

The analytic Habiro stack is attributed by the source to a lecture series, which was not obtained; the only description used here is the source's own summary of the three differences. Moreover the roadmap that would own the analytic side, AnalyticHabiroStack, exists only as a draft under research/blueprint/roadmaps and is not in the atlas, so the request filed against its third stage has no accepted owner. The three nodes of HQ.6 therefore state the problem, the three differences and the discipline, and prove nothing about the analytic side. NEXT SOURCE ACTION: obtain a written source for the analytic Habiro stack, and accept the draft roadmap or name another owner for the analytic object.

### The author's thesis and the earlier q-Hodge manuscript were not obtained

Needed by: `HabiroCohomologyFoundations:HQ.5`, `HabiroCohomologyFoundations:HQ.3`.

The campaign document lists the author's 2026 thesis among the primary sources, and the paper cites a joint manuscript with Meyer for the elementary proof of the higher-powers case of the well-behavedness theorem and for the construction of the q-Hodge complex in an earlier form. Neither was obtained. The affected nodes state the results as the paper states them and record the attribution; the worked example in the paper is enough to see why the exponent one fails and why higher exponents work, but not to reconstruct the general proof. NEXT SOURCE ACTION: obtain the thesis and the joint manuscript and decompose the elementary proof of the higher-powers case.

### The solid condensed appendix was read only at its final statement

Needed by: `HabiroCohomologyFoundations:HQ.3`, `HabiroCohomologyFoundations:HQ.6`.

The main source's second appendix ends with the statement that bounded-below Habiro-complete objects are closed under the solid tensor product. That statement is what the monoidal structure on Habiro-complete objects rests on, and it is owned by the coefficient roadmap. Its proof and the condensed recollections preceding it were not read here. NEXT SOURCE ACTION: the coefficient roadmap should decompose that appendix; this roadmap imports the conclusion by node.

## Requests

- **`PrismaticCohomology:PR.6`** — The local q-crystalline site, its q-PD envelopes, the framed q-difference complex with the formula for the differential on powers of a coordinate, the twisted Leibniz rule and the vanishing of the square of the differential, change of framing with the cocycle identities, and the p-complete identification of the q-de Rham complex with prismatic cohomology over the q-de Rham prism whose ideal is generated by the p-th q-integer, together with the relative Frobenius equivalence onto the decalage at that ideal. HQ.1 imports all of this and owns only the global gluing.

- **`PrismaticCohomology:PR.0`** — The delta-ring interface at a single prime, including free delta-rings, perfect delta-rings and their unique lifts, and the p-completed colimit perfection, which the quasi-regular inputs of HQ.5 and the witness of the no-go lemma use.

- **`DerivedDeRhamCohomology:DD.2`** — The derived de Rham complex from polynomial resolutions with its Hodge filtration, its Hodge completion and its filtered base change, including the fact that the ordinary de Rham complex of a smooth algebra is the Hodge completion of the derived one. Every clause of the definition of a q-Hodge filtration is stated against this object.

- **`DerivedDeRhamCohomology:DD.1`** — Complete filtered objects in an enhanced derived category, their associated graded, the completion functor and the completed filtered tensor product, over a filtered coefficient ring. HQ.2 fixes the conventions and the specific coefficient ring; the machinery is imported.

- **`DerivedDeRhamCohomology:DD.6`** — The comparison of the derived de Rham complex with crystalline cohomology in the p-complete setting, which the cosimplicial divided-power realisation of HQ.1 and the staticity statements of HQ.5 rely on.

- **`AInfCohomology:AI.1`** — The Berthelot-Ogus decalage functor at an element, its description of cohomology with the torsion correction, its symmetric monoidal structure, its natural filtration, and its commutation with completion at the same element. HQ.2 and HQ.4 own only the applications at the elements q-1 and the q-integers.

- **`CrystallineCohomology:CR.4`** — The ordinary de Rham-Witt complexes with their genuine restriction maps, Frobenius, Verschiebung and dlog, and their universal property, so that HQ.4 can state the comparison with the q-de Rham-Witt complexes and keep the two operator systems apart.

- **`EnhancedDerivedSheaves:E5`** — Derived commutative algebras in the sense of Raksit, their filtered, graded and differential graded variants, and the fact that limits and colimits in them are computed on underlying objects. The derived commutative lift of HQ.1 and the upgrades of HQ.3 rest on this.

- **`EnhancedDerivedSheaves:E1`** — The enhanced derived category of a ring with its derived tensor product and its presentability, which is the ambient category of every filtered object in this packet.

- **`EnhancedDerivedSheaves:E4`** — Derived completion at a finitely generated ideal in the enhanced setting, with the fracture square for a principal ideal and the detection principle for complete objects; HQ.2 records the conventions, not the theory.

- **`RefinedTraceMethods:RT.4:q-Hodge`** — The construction of the q-Hodge filtration from the circle-equivariant even filtration on negative topological cyclic homology over connective complex K-theory, with the full hypothesis list of the body theorem: a perfectly covered base whose p-completions carry cyclotomic spherical lifts, a quasi-lci input with bounded p-power torsion and, for each prime, either a two-discs lift or an even cosimplicial resolution by one-disc lifts, plus the addendum at the prime two. HQ.5-trace imports the output as an object of the category of pairs and proves nothing about it.

- **`RefinedTraceMethods:RT.6`** — The quasi-syntomic comparison of topological Hochschild homology with prismatic cohomology and the Nygaard and syntomic filtrations, which the trace-theoretic import of HQ.5-trace and the comparison atlas of the companion part depend on.

- **`CohomologyComparisons:CP.1`** — Commutativity of the classical integral comparison diagram, which the companion part's comparison atlas must commute with and which this part cites only as the boundary of what it does not prove.

- **`CohomologyComparisons:CP.6`** — The global compatibility of the classical comparisons, for the same reason.

- **`HabiroRings:HR.1`** — Lambda-rings with commuting Adams operations and perfectly covered Lambda-rings in both equivalent descriptions, with the consequence that the base is torsion free. Every statement of this roadmap is relative to such a base.

- **`HabiroRings:HR.2`** — Habiro-complete objects, the Habiro completion functor, the detection results and the completed monoidal structure, and the record that the solid comparison is a bounded-below statement. The descent theorem of HQ.3 factors through this category.

- **`HabiroRings:HR.3`** — The complete-descent principle for gluing cyclotomically complete algebras along prime edges, which is what the twisted q-de Rham complexes of HQ.4 are glued with.

- **`HabiroRings:HR.4`** — The degree-zero relative q-Witt rings with their Frobenius and Verschiebung, their ghost description under the actual torsion hypotheses, and the proof that no restriction operator exists. HQ.4 owns only the positive-degree extension.

- **`HabiroRings:HR.5`** — The relative Habiro ring as a limit, with its equaliser presentation by compatible cyclotomic Taylor series and the convergence of the substitutions, which the coordinate model of HQ.3 and the etale specialisation use.

- **`HabiroRings:HR.6`** — The degree-zero identification of the coefficient object of Habiro cohomology with the relative ring, and the module interfaces it exports; HQ.5 exports the completed cohomology object and imports that identification rather than proving it.

- **`HabiroCyclotomicCompletions:HC.1`** — The classical cyclotomic completion with its cofinal factorial tower, which is the underived ancestor of the Habiro completion this roadmap works over.

- **`HabiroCyclotomicCompletions:HC.3`** — Evaluation at a root of unity and the Taylor map, with the re-expansion that needs topological nilpotence, which the explicit coordinate model of HQ.3 uses to build the scaling automorphisms.

- **`HabiroNumberFields:HB.6`** — The explicit number-field Habiro ring with its Frobenius-glued Taylor presentation and the hypotheses on the inverted integer, with which the exported degree-zero object of HQ.5 is compared.

- **`HabiroNumberFields:HB.7`** — The modules graded by the third K-group and the possible loss of information indexed by that group on completion; HQ.5 records the boundary and proves nothing about them.

- **`AnalyticHabiroStack:HS.3`** — The analytic Habiro stack, its sheaf cohomology, the analytic Habiro ring and the completed localisation along which the comparison of HQ.6 is expected, together with the six-functor formalism in which the comparison would be stated. This supplier is a draft roadmap that is not yet in the atlas; until it is accepted HQ.6 has no owner for its analytic side.

## Structural proposals

### The restructuring proposal for this family has not been accepted, so this packet follows the current atlas

*note-structure-not-accepted*

The proposal RS-10 assigns this roadmap a narrowed HQ.1 and HQ.4 and moves the positive-degree q-de Rham-Witt theory to a draft roadmap on q-Witt vectors. Its recorded review status is that changes are needed: the report requires removing seven existing atlas edges, sixty-five supplier links for the narrowed layers are missing, and three of its target roadmaps, including the q-Witt one and the analytic Habiro stack, are not in the atlas at all. The job instruction is then to work with the current structure and say so, which is what this packet does: HQ.4 plans the positive-degree q-de Rham-Witt complex, its Frobenii, its ghost maps and its etale base change, and HQ.1 plans the whole global gluing. A worker who picks up this roadmap after RS-10 is accepted must not plan that material a second time in the q-Witt roadmap; the thirteen nodes of HQ.4 and the first six of HQ.1 are exactly what would move.

### HQ.2 is asked to prove a statement about objects defined in HQ.3

*propose-link*

The stage text of HQ.2 assigns the proposition comparing the underived q-de Rham complex with the q-Hodge completion of the derived one and with the decalage of the q-Hodge complex. Both halves of that statement quantify over pairs of an algebra and a chosen q-Hodge filtration, which is the object HQ.3 defines, and the second half mentions the Habiro-Hodge complex, which HQ.3 constructs. The packet follows the stage text and places the node in HQ.2, with prerequisites on three HQ.3 nodes. Either the atlas should record a supply edge from HQ.3 to HQ.2 for this statement, or the statement should move to HQ.3; as things stand the layer ordering suggests a dependency that runs the other way.

### HQ.5 carries three independent bodies of work

*propose-split*

HQ.5 asks for the smooth existence theorem with its dimension-dependent inversion of small primes and its partial-operad multiplicativity; for the quasi-regular existence theory under condition (R) with its own construction, its own base change and its own monoidality; and for the export of the completed cohomology object to the coefficient roadmap. The three share only the definition of a q-Hodge filtration: the smooth theory works with a truncation adjunction on filtered objects, the quasi-regular theory with one-categorical preimages inside static rings, and the export with the etale specialisation of the descent theorem. For the atlas they would read better as three sub-layers, and the fourteen nodes of this packet already fall into the three groups of six, six and two.

### HQ.7 is audited as a process layer but is planned here as two nodes

*note-audit-verdict*

The reviewed library audit gives HQ.7 the verdict that it is a process layer, and the job instruction says that such a layer is not mathematics and should get no nodes. This packet nevertheless plans two nodes for it, as the packet for the coefficient roadmap did for its own acceptance layer: the acceptance suite is a list of statements with concrete witnesses, each naming the node it exercises, and the executable boundary is a statement about what the suggested Lean file does and does not prove. Both are checkable claims rather than process. The alternative would be to close HQ.7 with no nodes and to move the acceptance tests into the acceptance lists of the nodes they exercise, where most of them already appear; that would be a reasonable restructuring but would lose the four structural checks, which are about the roadmap as a whole and belong to no single node.

## Dependencies between the layers

Inside the roadmap, following the atlas and this packet's node prerequisites:

- `HQ.1` needs `PrismaticCohomology:PR.6` and `DerivedDeRhamCohomology:DD.2`.
- `HQ.2` needs `HQ.1`, `AInfCohomology:AI.1`, `DerivedDeRhamCohomology:DD.1`/`DD.6`
  and `EnhancedDerivedSheaves:E5:animation`; **and three of its nodes' statements**
  **quantify over objects `HQ.3` defines** — see the structural note.
- `HQ.3` needs `HQ.2`, `HQ.4` and `HabiroRings:HR.2`.
- `HQ.4` needs `HQ.2`, `HabiroRings:HR.4` and `CrystallineCohomology:CR.4`.
- `HQ.5` needs `HQ.3` and `HQ.4`.
- `HQ.5-trace` needs `HQ.5` and `RefinedTraceMethods:RT.4:q-Hodge`.
- `HQ.6` needs `HQ.5`, and an analytic side that has **no atlas owner**.
- `HQ.7` needs `HQ.6` by the atlas; in practice its tests exercise `HQ.1`–`HQ.5`
  and `HQ.5-trace`, and its one reference to `HQ.6` is the prohibition on using it.

## What this blueprint does not claim

No Lean was compiled. The Mathlib build on this machine is a shared cache that
must not be rebuilt, and this working tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`, and the suggested Lean file is a
naming proposal whose proofs are all placeholders.

Nothing here asserts a canonical q-Hodge filtration for every ring — Lemma 3.3
rules that out — nor an unconditional identification with the analytic Habiro
stack, nor an `E∞`-structure on the Habiro–Hodge complex of a smooth scheme, nor
any statement about the modules graded by the third K-group beyond what the
number-field roadmap supplies.
