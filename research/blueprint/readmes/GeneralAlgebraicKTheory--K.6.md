# GeneralAlgebraicKTheory — K.6

The blueprint for the last two layers of the general algebraic K-theory roadmap: K.6, the nonconnective extension, and K.7, invariance, products and universal interfaces. Thirty-two nodes written from two sources, with one proposition of a third. The first is Weibel’s K-book in the author-hosted combined draft of 29 August 2013, whose hash reproduces the one four other packets of this programme already record. The second is Schlichting’s 2003 preprint on negative K-theory of derived categories, whose hash reproduces the one the reviewed integrated decomposition of this roadmap records, so this is the file its accepted review checked. The reviewed audit AUDIT-28 and that decomposition were both read first, and every claim the audit makes about the pinned libraries was checked against the declaration index. Both layers are recorded as not built, and the index agrees: there is an idempotent completion, a Morita equivalence predicate with its matrix instance, an equivalence of module categories over a matrix ring, filtered colimits of categories, polynomial and Laurent polynomial rings, and on the Tau Ceti side the Grothendieck group of an exact category with its invariance under exact equivalences and the degree-zero product statement. Tau Ceti also has the Frobenius condition on an exact structure, with the split structure as an instance, and Mathlib has triangulated subcategories with the morphism class attached to one; both are cited rather than re-planned. There is no spectrum, no flasque ring in the K-theoretic sense (the pinned IsFlasque of both trees is about sheaves and the packet says so in the node that would collide with it), no stable category of a Frobenius category, no Verdier quotient as a triangulated category, no Frobenius pair, no negative K-group, no Nil group and no first K-group at all. K.6 is decomposed along two independent routes, both of which the stage text asks for. The algebraic route is Bass’s: flasque rings and the Eilenberg swindle, contracted functors and the contraction LF, the negative K-groups as the iterated contraction Lⁿ K_0; the Fundamental Theorem with its Nil terms, decomposed down to its ring-level inputs — the projective line over an associative ring as a gluing category of projective modules (not a scheme), K(R) × K(R) ≃ K(P¹_R) by the Koszul resolution and additivity, the Nil category and its groups, the localisation sequences at t through R[t] and through P¹_R, Nil_n(R) ≅ NK_{n+1}(R), exactness in positive degrees, the splitting by multiplication by t, and the contractedness of K_1, K_0 and every K_{−n}; the four axioms a theory of negative K-theory must satisfy; Mayer–Vietoris for a Milnor square in negative degrees and its spectrum form, excision in degrees at most zero, which is what Clausen–Mathew–Morrow's Proposition 4.34 uses (the spectrum form of the degree-one surjectivity is handed to KTheoryLowDegrees U.6); the Bass delooping with the identification of its negative homotopy with Bass's groups; and the vanishing theorem for regular noetherian rings. The homotopical route is the flasque enlargement the stage text names, and it is Schlichting’s: Frobenius pairs and their derived categories, the countable flasque envelope with the swindle in functorial form and the suspension, the axiomatic set-up, localisation in negative degrees with the first negative group as the obstruction to idempotent completeness of quotients, additivity and filtered colimits, the IK-theory spectrum with its homotopy groups in all three ranges, and the agreement with Bass’s, Karoubi’s and Pedersen–Weibel’s groups together with the vanishing theorems; the scheme clauses of the source (Thomason’s groups, negative G-theory of noetherian schemes) are handed to SchemeKTheoryOperations S.5 and S.2. The vanishing node states the non-example the stage text demands: the connective model has no negative homotopy for any ring, so that absence proves nothing about a singular one. K.7 is decomposed into Morita invariance with the structure theorem, the derived statement with its enhancement hypothesis — stated in Schlichting’s precise form, a map of models inducing an equivalence of derived categories — and the explicit failure of a naked triangulated equivalence, the nonconnective refinements of compatibility with filtered colimits and finite products, whose connective form is imported from the early ring node of K.2:plus, the external products from biexact functors — the only owner of the K-theoretic pairing K(A) ∧ K(B) → K(C), with associativity, unit and symmetry carried as data and the generic smash product imported from StableHomotopyKTheory H.5:spectra — graded commutativity, the compatibilities with relative groups, localisation boundaries and transfers, and the two unit tests the stage text names, the degree-zero tensor comparison and multiplication by a unit in degree one. Two duplications the audit records are honoured rather than re-planned: SchemeKTheoryOperations S.5 owns the scheme form of the Fundamental Theorem and S.6 the scheme form of the external products; both come after K.6 and K.7 in the atlas and import this packet’s ring theorems, so they are handed their scheme forms by request and are not prerequisites of any node here. The fix job FIX-RT-AREA-ktheory-1 (findings 4, 17, 18 and 19) added the ring-level projective line, the Nil and localisation nodes, the contracted negative groups, the identification with the Bass spectrum and the Milnor-square excision, moved the scheme clauses out, and made K.6 and K.7 import the early ring functor of K.2:plus instead of restating it. Round2 FIX-RT-AREA-ktheory-1~2 expands the proof inputs described in the fix report, updates source-reading boundaries and retains precisely named supplier gaps. The revised plan awaits independent review; it is not a formalization.

FIX-RT-AREA-ktheory-1~2, issue #5541. Codex, session codex-5ebb6f, 2026-10-02. The five revised packets await independent review. Earlier review decisions are preserved as history. This document is the planning roadmap; the suggested Lean signatures remain unchecked and were not compiled.

This packet has 73 nodes, 124 API items, 83 unit-test obligations and 2 explicitly remaining gaps. A complete disposition of an assigned fix does not assert closure of the entire roadmap.

## Scope and pinned library inputs

`GeneralAlgebraicKTheory:K.6`, `GeneralAlgebraicKTheory:K.7`

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

- `mathlib:CategoryTheory.Functor.IsEquivalence` — Mathlib/CategoryTheory/Equivalence.lean. Equivalence of categories, the hypothesis of the invariance statements; the enhanced version K.7 needs is not pinned and the comparison node says so. No additional read assertion recorded.

- `mathlib:CategoryTheory.Idempotents.Karoubi` — Mathlib/CategoryTheory/Idempotents/Karoubi.lean. The idempotent completion, which the stage text names as one of the three enlargements; it exists at the pin, so K.6 cites it rather than building it. No additional read assertion recorded.

- `mathlib:CategoryTheory.Limits.HasFilteredColimits` — Mathlib/CategoryTheory/Limits/Filtered.lean. Filtered colimits, pinned at the level of categories; the K-theoretic commutation statement is what K.7 adds. No additional read assertion recorded.

- `mathlib:CategoryTheory.ObjectProperty.IsTriangulated` — Mathlib/CategoryTheory/Triangulated/Subcategory.lean. Triangulated subcategories, pinned; the input to a Verdier quotient, which is not itself pinned. No additional read assertion recorded.

- `mathlib:CategoryTheory.ObjectProperty.trW` — Mathlib/CategoryTheory/Triangulated/Subcategory.lean. The class of maps whose cone lies in a triangulated subcategory, pinned; the morphisms a Verdier quotient inverts. No additional read assertion recorded.

- `mathlib:IsMoritaEquivalent` — Mathlib/RingTheory/Morita/Basic.lean. The Morita equivalence predicate, pinned; K.7 supplies the K-theoretic consequence, which is absent. No additional read assertion recorded.

- `mathlib:IsMoritaEquivalent.matrix` — Mathlib/RingTheory/Morita/Matrix.lean. The instance that a ring is Morita equivalent to its matrix ring, pinned and cited by the invariance node. No additional read assertion recorded.

- `mathlib:IsNilpotent` — Mathlib/Algebra/GroupWithZero/Basic.lean. Nilpotence of an element (some power is zero), the condition on the endomorphisms of the Nil category. No additional read assertion recorded.

- `mathlib:LaurentPolynomial` — Mathlib/Algebra/Polynomial/Laurent.lean. The Laurent polynomial ring, the third term of that sequence and the ring whose K-theory the fundamental theorem decomposes. No additional read assertion recorded.

- `mathlib:Matrix` — Mathlib/LinearAlgebra/Matrix/Defs.lean. Matrices, out of which the cone ring and the infinite matrix ring of the flasque and axiom nodes are built. No additional read assertion recorded.

- `mathlib:ModuleCat` — Mathlib/Algebra/Category/ModuleCat/Basic.lean. The category of modules over a ring, not necessarily commutative; the components of the glued triples of the projective line over a ring live in it. No additional read assertion recorded.

- `mathlib:ModuleCat.matrixEquivalence` — Mathlib/RingTheory/Morita/Matrix.lean. The equivalence between modules over a ring and modules over its matrix ring, which is the pinned form of the Morita instance K.7 cites. No additional read assertion recorded.

- `mathlib:Polynomial` — Mathlib/Algebra/Polynomial/Basic.lean. The polynomial ring in one variable, one of the two rings in the four-term sequence that defines the contraction. No additional read assertion recorded.

- `mathlib:RingHom` — Mathlib/Algebra/Ring/Hom/Defs.lean. Ring maps, the morphisms of the functors this layer defines. No additional read assertion recorded.

- `mathlib:TensorProduct` — Mathlib/LinearAlgebra/TensorProduct/Defs.lean. The tensor product, the biexact functor from which the external products of K.7 are built. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. The Grothendieck group of an exact category, the degree-zero model against which this layer's invariance statements are checked. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.mapEquiv` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. Invariance of that group under an exact equivalence, the pinned degree-zero shadow of the derived invariance K.7 states. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.IsFrobenius` — TauCeti/CategoryTheory/Exact/Frobenius.lean. The Frobenius condition on an exact structure, PINNED in Tau Ceti: it is the hypothesis of the second construction of K.6, and the packet cites it rather than defining it again. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.split_isFrobenius` — TauCeti/CategoryTheory/Exact/Frobenius.lean. The split exact structure is Frobenius, pinned; it is the degenerate unit test of the Frobenius-pair node. No additional read assertion recorded.

- `tauceti:TauCeti.SplitK0` — TauCeti/CategoryTheory/GrothendieckGroup/Split.lean. The split model of the zeroth K-group, in which the pinned product statement is proved. No additional read assertion recorded.

- `tauceti:TauCeti.SplitK0.of_mul_of` — TauCeti/CategoryTheory/GrothendieckGroup/Monoidal.lean. The pinned statement that the product of the classes of two objects is the class of their tensor product, the degree-zero unit test of K.7's product. No additional read assertion recorded.

## Sources and actual reading coverage

### The K-book: An Introduction to Algebraic K-theory

Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013).

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)

SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

**Read scope.**

- The file was already on disk from the K2SymbolsBrauer job of this session and was re-hashed; the hash reproduces the value recorded by the packets of K2SymbolsBrauer, Polylogarithms, MotivesAndAlgebraicCycles and ArithmeticKTheory, so this is the same file those cite.
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

### Negative K-theory of derived categories

Marco Schlichting. Author preprint dated 16 June 2003, 28 pages; the published version (Math. Z. 253, 2006) was not compared..

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf)

SHA-256: `f59620e3ba25d5a8591a108d2b9647b68b5caf04794745862d2aa71e178b5aa6`.

**Read scope.**

- Downloaded and hashed on 24 September 2026; the hash reproduces the value recorded in the reviewed integrated decomposition data/decompositions/GeneralAlgebraicKTheory.json, so this is the same file the accepted review of 15 September 2026 checked.
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
- FIX-RT-AREA-ktheory-1~2: the reproduced hash was read in full at §10 pp.18–19, §11 pp.20–24 including every proof11.7,11.10,11.15,11.17,11.18, and AppendixA pp.24–27 with all approximation, fibration and cofinality proofs. Facts1.2 p.4 reread. Image p.20 verifies the factorization domain misprint; image p.18 verifies the representable-versus-finitely-presented wording. Keller96 and the published2006 version remain uninspected.

### K-theory and topological cyclic homology of henselian pairs

Dustin Clausen, Akhil Mathew and Matthew Morrow. arXiv:1803.10897v2 (20 July 2020, the revised and final version); published in J. Amer. Math. Soc. 34 (2021), 411–473, which was not compared..

[Source](https://arxiv.org/pdf/1803.10897v2)

SHA-256: `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`.

**Read scope.**

- The file's SHA-256 reproduces the value the paper extraction PAPER-CLAUSEN-MATHEW-MORROW-21 records for arXiv v2.
- p. 35 of the arXiv v2 PDF, through its text layer: Theorem 4.33, Proposition 4.34 with its proof, and Corollary 4.35. The text layer drops the blackboard-bold font, so 𝕂 (nonconnective K-theory) and 𝔽 are restored from the sentences that name them.
- NOT read: the rest of the paper, and Bass's Algebraic K-theory, Theorem XII.8.3, which Proposition 4.34 cites.

### Higher algebraic K-theory I

Daniel Quillen. Published chapter in Lecture Notes in Mathematics341 (1973), pp.85–147; Rochester-hosted scan of that chapter. Printed and PDF page pairs are recorded explicitly..

[Source](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)

SHA-256: `5d2db42d3fec06156da4e6f6d5a85fb9a04358df59141d3abe74a57b815bae04`.

**Read scope.**

- §8.1–§8.3, printed pp.130–135/PDF54–59: regularity, canonical resolution, coefficient projectivity, regular filtration and the noncommutative ring projective line. Text read in full; §8.3 formulas independently inspected in the p.135 image. Other sections of this scan have not been reread for this fix.

### The K-book, separately hosted author chapterV

Charles A. Weibel. Author chapter downloaded2026-10-02; distinguish its chapter pagination from the combined2013 draft..

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf)

SHA-256: `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.

**Read scope.**

- V.7.1–7.4, printed pp.52–55/PDF52–55, including the full direct proof; V.7.8 pp.57–58/PDF57–58; Ex.V.7.5 p.59/PDF59. Images pp.53–54 verify the resolution-fibre discrepancy. This does not claim the unrelated localization/excision statements of V.7.5–7.11 were fully audited.

### The classification of triangulated subcategories

R. W. Thomason. Published Compositio Mathematica105 (1997), pp.1–27; Cambridge-hosted PDF..

[Source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8FA43E2F659E004A21FE2F0652743CE8/S0010437X97000067a.pdf/div-class-title-the-classification-of-triangulated-subcategories-div.pdf)

SHA-256: `f4f31c35d2dcb3efc99f32d8cb9fda5a25d083347440affd9edd220e92114252`.

**Read scope.**

- §1 definitions1.1–1.7 pp.3–4; Theorem2.1, Lemma2.2 and Corollary2.3 pp.5–6, full proofs. Lemma2.4 p.7 read but not needed for the criterion proof. Scheme-support classification in §§3–4 not read.

### Higher algebraic K-theory of schemes and of derived categories

R. W. Thomason and Thomas Trobaugh. Published chapter in The Grothendieck FestschriftIII, pp.247–435. Institutional scan,95 two-page spreads..

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf)

SHA-256: `48cdb707515c4d2e3a525610f4ff2b5b3d579dbec3ddc01b508922a5e7a50a7b`.

**Read scope.**

- ImagesPDF13–16, printed pp.270–277:1.9.8 hypotheses and proof diagram1.9.8.3, strictification/homotopy pullback,1.10.1 cofinality proof. The text layer is empty. These are the published chapter pages, not an arXiv/preprint pagination.

### Algebraic K-theory of spaces

Friedhelm Waldhausen. Published chapter in Lecture Notes in Mathematics1126, pp.318–419; institutional scan. Printed-to-PDF offsets vary..

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf)

SHA-256: `2f452696998132a438fe7596deb681fefcf829829b4604ca1029083e4dcb1c6e`.

**Read scope.**

- §1.5 pairing paragraph and delooping statement, printed p.342/PDF25, text and image fully read; §1.6.5 swallowing lemma, printed p.352/PDF35, full image proof read. The paragraph indicates the pairing; the grid/coherence verification in these nodes is an explicitly identified derivation. This does not claim a complete modern E∞ construction was printed in §1.5.

### Foncteurs dérivés et K-théorie

Max Karoubi. Séminaire Heidelberg–Saarbrücken–Strasbourg1967/68, ExposéIV, Lecture Notes in Mathematics136(1970),107–186; author scan80pages..

[Source](https://webusers.imj-prg.fr/~max.karoubi/Publications/07.pdf)

SHA-256: `3658a17a15ec4f81c9d8669a0af59bb2df01449c057bcd77f8a25a8cf712f717`.

**Read scope.**

- §1 discrete/additive specialization, direct filtrations and quotient, PDF6–24; §2 relative index, Theorems2.9,2.13,Proposition2.16,PDF25–40; §3 flasque cone, derived groups, exactness and uniqueness,PDF41–61. Source diagrams are OCR-imperfect; the construction described below is the discrete algebraic specialization, where approximation becomes exact. §4 topological periodicity and §5 multiplicative recognition are not used.
- Matrix/index and boundary diagrams PDF37–38,53–55 inspected against rendered source images.

### La périodicité de Bott en K-théorie générale

Max Karoubi. Annales scientifiques de l’École Normale Supérieure,4e série4(1971),63–95; Numdam digitized published copy on author site..

[Source](https://webusers.imj-prg.fr/~max.karoubi/Publications/09.pdf)

SHA-256: `19591526e36387e946d554423b5cfebddb48f00642f7cbfe6b65d259cd1a5c19`.

**Read scope.**

- §I1.1–1.7 and§II2.1–2.7,64–72;§III3.1–3.2 and remark,73–74 (image73 inspected);§III3.3–3.7,74–75;§VI6.2–6.5,92–95. Only the nonpositive algebraic comparison is used; topological and positive-degree generalizations are not imported.

### A note on K-theory and triangulated categories

Marco Schlichting. Inventiones Mathematicae150(2002),111–116,DOI10.1007/s00222-002-0231-1. Published institutional scan..

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlk.pdf)

SHA-256: `6c7db56e5fa5f05bd55e0dae8f81c7952356eadf925c0e03d2ab5e252ede7ee9`.

**Read scope.**

- Introduction§0,§1.1–1.8,§2.1–2.3,111–116. The stable-category, fibration and K4-detection arguments were read. The underlying K3 computations cited to EF82 and ALPS85 were not independently reread and are retained as identified input work.

### A counterexample to vanishing conjectures for negative K-theory

Amnon Neeman. arXiv:2006.16536v2,30January2021.

[Source](https://arxiv.org/pdf/2006.16536v2)

SHA-256: `3d168bb7501f0cbb43e665bd78a9a183ebc4b8a4c9f0f358a3b35e6b970ca3e1`.

**Read scope.**

- Introduction pp1–2 only, used for historical/current-status correction, not a newly planned proof of his counterexample.

### On the Karoubi filtration of a category

Manuel Cárdenas and Erik Kjær Pedersen. MPIM1995-16 preprint,1995; finalK-Theory12(1997),165–191.

[Source](https://archive.mpim-bonn.mpg.de/547/1/preprint_1995_16.pdf)

SHA-256: `fade1b382a464d1a1cfc532bc304700042b0159006afcf30b73ecdacd14ee493`.

**Read scope.**

- MPIM1995-16 preprint:§3–§7.9 read;§4 and all§7 proof reread; relevant cylinder and fibre diagrams inspected. Final publicationK-Theory12(1997),165–191; no final-version identity asserted.

### Controlled algebra and the Novikov conjectures for K- and L-theory

Gunnar Carlsson and Erik Kjær Pedersen. Topology34(1995),731–758, published scan.

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/carlped.pdf)

SHA-256: `df13804a22b9df2b7d8653cd43ebf0ee5ce2fc97e03afb5c774303983c84a529`.

**Read scope.**

- Only§4.6–4.8 and the complex-lifting part of Theorem4.1 proof,pp750–752/PDF20–22. The L-theory results are not replanned here.

### The algebraic theory of finiteness obstruction

Andrew Ranicki. Mathematica Scandinavica57(1985),105–126, published scan.

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/finite.pdf)

SHA-256: `2882abe515b8fa191a120a28dcbb555ec84e28da7b075cf3bc788078e08ca4b8`.

**Read scope.**

- ImagesPDF1–20,printed105–124: introductory definitions,§1,§2,§3 full finite-domination construction and relative Proposition3.2. Topological applications at the end are not used.

## Declarations and proof obligations

### Flasque rings, infinite sum rings and the Eilenberg swindle

`GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle` · definition · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `mathlib:Matrix`
- `mathlib:RingHom`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IsFlasqueRing` | structure | The bimodule and the isomorphism witnessing flasqueness. |
| `IsFlasqueRing.K0_eq_zero` | characterisation | The zeroth K-group of a flasque ring vanishes. |
| `IsInfiniteSumRing` | structure | A flasque ring whose bimodule is the ring as a right module. |
| `coneRing` | data | The cone ring of a ring, the row-and-column finite infinite matrices. |
| `coneRing_isInfiniteSumRing` | example | The cone ring is an infinite sum ring, hence flasque. |
| `IsFlasqueRing.not_sheaf_flasque` | relation | The notion is unrelated to the sheaf-theoretic predicate the libraries call flasque. |

**Consumers.**

- K.6, the axioms for negative K-theory — Vanishing on flasque rings is one of the four axioms that characterise a theory of negative K-theory.
- K.6, the nonconnective construction — The flasque route to a nonconnective spectrum, which the stage text names, is built from these rings.
- The libraries — The audit records that the K-theoretic notion is absent and that the name is taken; a formalisation must choose a different name.

**Unit tests.**

- `cone_ring_flasque` (computation) — The cone ring of any ring is flasque.
- `K0_vanishes` (degenerate) — The zeroth K-group of a flasque ring is trivial.
- `not_sheaf_notion` (non-example) — The predicate is about bimodules, not about sheaves; the pinned IsFlasque is a different statement.
- `infinite_sum_is_flasque` (computation) — Every infinite sum ring is flasque, by taking the bimodule to be the ring.

**Sources.**

- `Kbook.2013`: II.2.1.3 (Example 2.1.3), printed p. 69 (PDF p. 77). The definition and the swindle. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: Exercise I.1.8 (Cone Ring), printed p. 5 (PDF p. 13). The cone ring; it is an exercise, not an item I.1.8. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Contracted functors and the contraction LF

`GeneralAlgebraicKTheory:K.6/contracted-functors` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`
- `mathlib:Polynomial`
- `mathlib:LaurentPolynomial`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `contraction` | data | The functor LF. |
| `IsAcyclic` | data | The acyclicity predicate. |
| `IsContracted` | structure | Acyclicity together with the natural splitting. |
| `IsContracted.splitting` | projection | The splitting, natural in the ring and the variable. |
| `contraction_iterate` | data | The iterates NLF and L-squared F. |
| `IsContracted.sum` | compatibility | A direct sum of contracted functors is contracted. |

**Consumers.**

- K.6, the negative K-groups — They are defined as the iterated contraction of the zeroth K-group.
- K.6, the fundamental theorem — The theorem is the statement that the zeroth and first K-groups are contracted, with the splitting given by multiplication by the variable.
- SchemeKTheoryOperations S.5 — The scheme-level fundamental theorem is the same statement for a different input, and the contraction formalism is shared.

**Unit tests.**

- `K0_contracted` (computation) — The zeroth K-group is a contracted functor.
- `iterate_agrees` (compatibility) — The iterated contraction of the special first K-group is the first negative K-group.
- `naturality_in_t` (non-example) — The splitting is natural in the variable; a splitting natural only in the ring does not make the functor contracted.
- `retract_closed` (computation) — A natural retract of a contracted functor is contracted.

**Sources.**

- `Kbook.2013`: III.4.1.1 (Definition 4.1.1), printed p. 210 (PDF p. 218). The definition. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Bass's negative K-groups

`GeneralAlgebraicKTheory:K.6/negative-k-groups` · definition · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/contracted-functors`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `mathlib:LaurentPolynomial`
- `tauceti:TauCeti.ExactK0`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `negativeK` | data | The n-th negative K-group. |
| `negativeK_functor` | functoriality | Functoriality in the ring. |
| `negativeK_one` | characterisation | The first negative group is the contraction of the zeroth K-group. |
| `negativeK_eq_contraction_iterate` | characterisation | K_{−n} = Lⁿ K_0: the n-th negative group is the n-fold contraction of the zeroth K-group. |
| `negativeK_flasque` | example | The negative groups of a flasque ring vanish. |
| `negativeK_prod` | compatibility | Compatibility with finite products of rings. |

**Consumers.**

- K.6, the axioms — Bass’s groups are the model that satisfies the four axioms, which is what makes the axioms non-vacuous.
- K.6, the nonconnective spectrum — The spectrum is built so that its negative homotopy groups are these groups.
- K.7 — The products and the invariance statements are asserted for the nonconnective theory, hence for these groups as well.
- K.6, Mayer–Vietoris and excision for Milnor squares; Clausen–Mathew–Morrow, the proof of Proposition 4.34 (p. 35) — Bass's groups are the non-positive homotopy of the nonconnective K-theory whose birelative term that proof needs concentrated in degrees ≥ 0 (K.6/milnor-square-excision-in-nonpositive-degrees).

**Unit tests.**

- `regular_vanishes` (computation) — For a regular noetherian ring the negative groups vanish.
- `flasque_vanishes` (computation) — For a flasque ring they vanish.
- `laurent_four_pieces` (computation) — The zeroth group of the Laurent ring decomposes into four named pieces.
- `not_from_connective` (non-example) — The groups are not the negative homotopy of the connective spectrum, which is zero; a formalisation that identified them would be wrong.

**Sources.**

- `Kbook.2013`: III.4.1 (Definition 4.1), printed p. 210 (PDF p. 218). The definition. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.3.7 (Fundamental Theorem for K0 3.7), printed p. 206 (PDF p. 214). The first negative group from the Fundamental Theorem for K0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.4.1.1, the paragraph after the definition, printed p. 210 (PDF p. 218). K_{−n} = Lⁿ K_0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The projective line over an associative ring, as a gluing category

`GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let R be a unital associative ring, not necessarily commutative. The category mod-P¹_R has as objects the triples F = (M₊, M₋, α) in which M₊ is a right R[t]-module, M₋ a right R[t⁻¹]-module and α : M₊ ⊗_{R[t]} R[t,t⁻¹] → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹] an isomorphism of R[t,t⁻¹]-modules; a morphism is a pair of module maps compatible with the gluing isomorphisms. It is abelian, with kernels and cokernels taken componentwise, because inverting the central element t is exact. VB(P¹_R) is the full exact subcategory of triples whose components M₊ and M₋ are finitely generated projective, and K(P¹_R) := K(VB(P¹_R)), the K-theory of that exact category (K.1, on a small model). The twist is F(n) = (M₊, M₋, t⁻ⁿα), with the two maps X₀ = (1, 1/t) and X₁ = (t, 1) from F(n−1) to F(n); the exact functors u_i : P(R) → VB(P¹_R) send P to (P[t], P[t⁻¹], tⁱ), so that u_i(P)(n) = u_{i−n}(P); and π_* and R¹π_* : mod-P¹_R → mod-R are the kernel and the cokernel of d : M₊ × M₋ → M₋ ⊗_{R[t⁻¹]} R[t,t⁻¹], d(x, y) = α(x) − y. This is NOT the scheme P¹ over an affine scheme Spec R: for noncommutative R there is no such scheme, and nothing here uses one. For commutative R the source records that mod-P¹_R and VB(P¹_R) are equivalent to the quasi-coherent sheaves and the vector bundles on the scheme P¹_R; that comparison belongs to SchemeKTheoryOperations S.5, which imports this node, and no node of this packet uses it.

**Hypotheses.**

- R is a unital associative ring and modules are right modules, as in the source. The element t is central in R[t], so R[t,t⁻¹] is the localisation of R[t] (and of R[t⁻¹]) at a central element, and the two base changes into R[t,t⁻¹] are exact.
- The gluing α is part of the data of an object: two triples with isomorphic components and different gluings are in general not isomorphic (unit test pi_u1).
- VB(P¹_R) is closed under extensions in mod-P¹_R and essentially small; K(P¹_R) is computed on a small model, as K.1 prescribes.
- The functors u_i land in VB(P¹_R) and are exact because the exact structure on P(R) is the split one and base change is additive (K.2:plus scalar extension).
- Right-module convention: in these gluing-category arguments P(R) means the pinned finite projective modules over Rᵐᵒᵖ, not ModuleCat R (which consists of left modules). The early ring model uses left modules; transport the right-module K-groups to that model through K.2/functorial-K-theory-of-a-ring’s opposite-ring duality, naturally in ring maps. No identification of left and right module categories is assumed.

**Proof outline.**

1. Define mod-P¹_R, with morphisms the pairs (f₊, f₋) such that (f₋ ⊗ 1) ∘ α = α′ ∘ (f₊ ⊗ 1), and prove that it is abelian with componentwise kernels and cokernels, using that R[t] → R[t,t⁻¹] and R[t⁻¹] → R[t,t⁻¹] are flat (localisation at the central element t).
2. Define VB(P¹_R), prove that it is an exact subcategory closed under extensions, take a small model and set K(P¹_R) := K(VB(P¹_R)) by K.1.
3. Define the twists F(n) and the maps X₀, X₁ : F(n−1) → F(n), and prove that the Koszul sequence 0 → F(−2) → F(−1)² → F → 0, with maps (X₁, −X₀) and (X₀, X₁), is exact for every F in mod-P¹_R and lies in VB(P¹_R) when F does.
4. Define u_i : P(R) → VB(P¹_R), P ↦ (P ⊗_R R[t], P ⊗_R R[t⁻¹], tⁱ), prove that it is exact, and prove u_i(P)(n) = u_{i−n}(P) naturally in P.
5. Define π_* and R¹π_* by the four-term exact sequence 0 → π_*F → M₊ × M₋ → M₋ ⊗ R[t,t⁻¹] → R¹π_*F → 0 with d(x, y) = α(x) − y, and compute them on u_0(R), u_1(R) and u_2(R) (the unit tests).
6. Prove functoriality in R: a unital ring map R → R′ induces base change mod-P¹_R → mod-P¹_{R′} componentwise, exact on VB and compatible with the twists, with the u_i, with identities and with composition (K.2:plus scalar extension).

**Acceptance.**

- π_*(u_0(R)) ≅ R and R¹π_*(u_0(R)) = 0, while π_*(u_1(R)) = 0 = R¹π_*(u_1(R)): for nonzero R, u_0(R) and u_1(R) have isomorphic components and are not isomorphic, which is what the gluing records.
- R¹π_*(u_2(R)) ≅ R: in the cokernel of (x, y) ↦ t²x − y from R[t] × R[t⁻¹] to R[t,t⁻¹] exactly the coefficient of t survives.
- For R = 0 the category VB(P¹_0) is zero and K(P¹_0) is contractible.
- The construction makes sense for every associative ring and uses no scheme; a definition through the centre of R, or through Spec of anything, is not this object.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`
- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `mathlib:ModuleCat`
- `mathlib:Polynomial`
- `mathlib:LaurentPolynomial`

**Planning API.**

| Name | Role | Contract |
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

**Consumers.**

- K.6, the projective-line splitting (K-book V.1.5.4) — K(R) × K(R) ≃ K(P¹_R) through u_0 and u_1 is a statement about this category, proved with its Koszul sequence and twists.
- K.6, the t-torsion localisation sequences (Ex. V.7.5) and Nil_n(R) ≅ NK_{n+1}(R) (V.8.1) — Nil(R) is the category of objects (M, 0, 0) with a length-one resolution by objects of VB(P¹_R), and the restriction j^*F = M₋ is the chart R[t⁻¹].
- SchemeKTheoryOperations S.5, the projective-line and projective-bundle theorems for schemes — For commutative R the source identifies VB(P¹_R) with the vector bundles on the scheme P¹_R; S.5 imports this ring-level object and its splitting and makes that comparison.

**Unit tests.**

- `pi_u0` (computation) — π_*(u_0(R)) ≅ R and R¹π_*(u_0(R)) = 0.
- `pi_u1` (non-example) — π_*(u_1(R)) = 0 and R¹π_*(u_1(R)) = 0, so, if R is nonzero, u_1(R) is not isomorphic to u_0(R) although both have components R[t] and R[t⁻¹]; a definition that forgot the gluing would identify them.
- `R1pi_u2` (computation) — R¹π_*(u_2(R)) ≅ R and π_*(u_2(R)) = 0.
- `zero_ring` (degenerate) — For R = 0 the category VB(P¹_0) is zero, so K(P¹_0) is contractible.
- `u_twist_shift` (compatibility) — u_i(P)(n) ≅ u_{i−n}(P) for all integers i and n, naturally in P.

**Sources.**

- `Kbook.2013`: V.1, 'The projective line over a ring', printed p. 370 (PDF p. 378). The gluing category and its vector bundles. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.1, the same paragraph, printed p. 370 (PDF p. 378). The direct image functors. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.1, the same paragraph and the next, printed pp. 370 to 371 (PDF pp. 378 to 379). The comparison for commutative R (S.5's, not used here) and the functors u_i. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.1.5.4, proof, printed p. 371 (PDF p. 379). The twists and the Koszul sequence. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The K-theory of the projective line over a ring: K(R) × K(R) ≃ K(P¹_R)

`GeneralAlgebraicKTheory:K.6/projective-line-splitting` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For every unital associative ring R the exact functors u_0 and u_1 induce a homotopy equivalence (u_0, u_1) : K(R) × K(R) → K(P¹_R), so that K_n(P¹_R) ≅ K_n(R) ⊕ K_n(R) for every n ≥ 0, naturally in R; and (u_{i+1})_* + (u_{i+1})_* ≃ (u_i)_* + (u_{i+2})_* for every integer i. Equivalently (u_0, u_0 − u_1) is a homotopy equivalence, which is the form the proof of V.8.1 uses. No commutativity is assumed. For commutative R and the scheme P¹_R this is the case of a trivial bundle of rank two in the projective bundle theorem V.1.5, which SchemeKTheoryOperations S.5 owns and which imports this ring statement.

**Hypotheses.**

- R is a unital associative ring, not necessarily commutative; K is the connective K-theory of the exact categories P(R) and VB(P¹_R) (K.1 and the early ring node of K.2:plus).
- The statement is connective, in degrees n ≥ 0; nothing is claimed here about negative K-groups of P¹_R.
- The noncommutative inputs are projective-line-eventual-regularity, projective-line-regularity-lemmas, projective-line-canonical-resolution and projective-line-regular-filtration, read and expanded from Quillen §8.1–3. The resolution is in VB, not entirely in MR.

**Proof outline.**

1. Apply the Koszul sequence to u_i(P) and use u_i(P)(n) = u_{i−n}(P): this is a short exact sequence u_{i+2} ↣ u_{i+1}² ↠ u_i of exact functors P(R) → VB(P¹_R), and Additivity gives (u_{i+1})_* + (u_{i+1})_* ≃ (u_i)_* + (u_{i+2})_*.
2. Call F Mumford-regular when R¹π_*(F(−1)) = 0; write MR ⊂ VB(P¹_R) for the exact subcategory of such F and MR(n) for the F with F(−n) in MR. VB(P¹_R) is the increasing union of the MR(n) as n → −∞, so K(VB(P¹_R)) is the filtered colimit of the K(MR(n)) (K.1, filtered colimits).
3. Each inclusion MR(n) ⊂ MR(n−1) is a K-equivalence: the Koszul sequence gives exact functors back into MR(n), and Additivity makes their alternating sum a homotopy inverse (the argument of Lemma V.1.5.2 with r = 1).
4. For F in MR construct Quillen’s canonical resolution 0 → u_1(T_1F) → u_0(T_0F) → F → 0 by exact functors T_0 = π_* and T_1 : MR → P(R). The sequence takes values in VB(P¹_R), not in MR: u_1(P) need not be Mumford-regular. Additivity gives (u_0, u_1)_* ∘ (T_0, −T_1)_* ≃ the inclusion K(MR) → K(VB), an equivalence by the preceding steps. Hence (u_0, u_1)_* has a right homotopy inverse.
5. The exact functors v_i : MR → P(R), v_i(F) = π_*(F(i)), for i = 0,1 induce maps on K(VB) by composing with a homotopy inverse of K(MR) → K(VB). Compute them first on u_0 and u_{−1}, which do land in MR: (v_0u_0, v_0u_{−1}) = (id, 2·id) and (v_1u_0, v_1u_{−1}) = (2·id, 3·id). The Koszul relation u_1 = 2u_0 − u_{−1} on K(VB) then gives v_0u_1 = 0 and v_1u_1 = id. Thus (v_0, v_1)_* ∘ (u_0, u_1)_* is triangular with diagonal identities. Together with the right inverse above this proves the equivalence; it does not apply π_* as an exact functor on all vector bundles.
6. Naturality in R follows from the base-change functoriality of the gluing category; the form (u_0, u_0 − u_1) follows by an invertible change of basis.

**Acceptance.**

- For a field F, K_0(P¹_F) ≅ ℤ², with basis the classes of u_0(F) and u_1(F).
- In K_0(P¹_R), [u_0(R)] + [u_2(R)] = 2[u_1(R)], the relation the Koszul sequence gives.
- The theorem holds for noncommutative R, where there is no scheme P¹_R; an argument through Spec R does not prove this node.
- For a nonzero field F, u_1(F) = O(−1) is not Mumford-regular: R¹π_*(u_1(F)(−1)) = R¹π_*u_2(F) ≅ F. The proof must not factor u_1 through MR.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`
- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`
- `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.6/projective-line-koszul`
- `GeneralAlgebraicKTheory:K.6/projective-line-canonical-resolution`
- `GeneralAlgebraicKTheory:K.6/projective-line-regular-filtration`

**Sources.**

- `Kbook.2013`: V.1.5.4 (Theorem 1.5.4) and the sentence before it, printed p. 371 (PDF p. 379). The theorem. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.1.5.4, proof, printed p. 371 (PDF p. 379). The Koszul relation, and the reduction to the proof of V.1.5. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: Exercise V.1.3, printed p. 375 (PDF p. 383). The gluing-category proof is left as an exercise, with a pointer to Quillen that was not followed. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.1.5.2 (Lemma 1.5.2) with its proof, printed p. 369 (PDF p. 377). The Mumford-regular filtration, for a projective bundle over a scheme; the node adapts it. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.1.5, the proof of Theorem 1.5, printed p. 370 (PDF p. 378). The triangularity argument, for a projective bundle over a scheme; the node adapts it. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Quillen.HigherI.1973`: §8.3 Theorem3.1, printed p.135/PDF59. Primary source for the arbitrary associative-ring result. All omitted chart checks used here are supplied in the prerequisite nodes.

### The Nil category of a ring and the Nil groups

`GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups` · definition · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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
- For A = k[ε]/(ε²) with k a field, Nil_0(A) ≅ (1 + εt·k[t])^× is non-zero (the source's Example III.3.8.1).

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `mathlib:IsNilpotent`
- `mathlib:Polynomial`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `NilCat` | data | Nil(R), with its exact structure. |
| `NilCat.forget` | projection | The exact forgetful functor (P, ν) ↦ P. |
| `NilCat.zero` | constructor | The exact zero section P ↦ (P, 0), a section of the forgetful functor. |
| `nilGroup` | data | Nil_n(R) := π_n of the homotopy fibre of K(Nil(R)) → K(R), for n ≥ 0. |
| `KGroup.nilCat_decomposition` | characterisation | K_n Nil(R) ≅ K_n(R) ⊕ Nil_n(R), naturally in R. |
| `NilCat.equivTorsion` | equivalence | Nil(R) ≃ H_{1,T}(R[t]), (P, ν) ↦ P_ν. |
| `nilGroup_map` | functoriality | Base change along unital ring maps. |

**Consumers.**

- K.6, Nil_n(R) ≅ NK_{n+1}(R) (K-book V.8.1) — The Nil groups are the terms the N-groups of the Fundamental Theorem are identified with.
- K.6, the t-torsion localisation sequences — K(H_{1,T}(R[t])) is K(Nil(R)) through the equivalence, which is how the localisation sequences acquire the fibre K(R) × Nil(R).
- K.7, products — The tensor pairing End(k) × Nil(A) → Nil(A) makes Nil_0(A) a module (II.7.4.4); the products node records it as an application of its machine.

**Unit tests.**

- `nil0_field` (computation) — For a field F, Nil_0(F) = 0.
- `nil0_dual_numbers` (computation) — For A = k[ε]/(ε²) over a field k, Nil_0(A) ≅ (1 + εt·k[t])^× ≠ 0.
- `K0_nil_split` (characterisation) — K_0 Nil(R) ≅ K_0(R) ⊕ Nil_0(R) through the zero section and the forgetful functor.
- `nilpotent_required` (non-example) — Dropping nilpotence changes the object: (ℤ, 2) is an endomorphism of ℤ that is not nilpotent, and its class 1 − 2t in the endomorphism group of ℤ (Almkvist) is non-zero, while Nil_0(ℤ) = 0.

**Sources.**

- `Kbook.2013`: II.7.4.4 (Example 7.4.4), printed p. 133 (PDF p. 141). The Nil category and the split forgetful functor. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.6.7, printed p. 324 (PDF p. 332). The Nil spectrum and the Nil groups in every degree. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: II.7.8.2 (Lemma 7.8.2) with its proof, printed p. 138 (PDF p. 146). The equivalence with t-torsion modules. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: III.3.8.1 (Example 3.8.1), printed p. 207 (PDF p. 215). The non-zero Nil group of a truncated polynomial ring, used as a unit test. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

### Localisation at t: the sequences through R[t] and through P¹_R

`GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let R be a unital ring and T = {tⁿ} ⊂ R[t], a set of central nonzerodivisors. (a) The inclusion of H_{1,T}(R[t]) and the localisation R[t] → R[t,t⁻¹] give a homotopy fibration K(H_{1,T}(R[t])) → K(R[t]) → K(R[t,t⁻¹]) of connective K-theory spaces, whose long exact sequence ends with K_0(H_{1,T}(R[t])) → K_0(R[t]) → K_0(R[t,t⁻¹]), a map that need not be onto (Caveat V.7.1.1). (b) Write H_1 for the objects of mod-P¹_R with a length-one resolution by objects of VB(P¹_R) and H_{1,t} ⊂ H_1 for those of the form (M, 0, 0). Then M ↦ (M, 0, 0) is an equivalence H_{1,T}(R[t]) ≃ H_{1,t}, the restriction j^* : VB(P¹_R) → P(R[t⁻¹]), j^*F = M₋, is exact, and K(H_{1,T}(R[t])) → K(P¹_R) → K(R[t⁻¹]) is a homotopy fibration. (c) Restriction to the chart R[t], F ↦ M₊, maps the sequence of (b) to that of (a), identically on the fibre. Through Nil(R) ≃ H_{1,T}(R[t]) the fibre of both is K(Nil(R)) ≃ K(R) × Nil(R).

**Hypotheses.**

- t is central in R[t] and a nonzerodivisor, so the Localisation Theorem V.7.1 applies with S = T; for a multiplicative set containing zero divisors the torsion category does not model the fibre (the source's Ex. V.2.9, recorded by K.5).
- H_{1,T}(R[t]) and the category H_T(R[t]) of all t-torsion modules of finite projective dimension have the same K-theory by the Resolution Theorem, as in Corollary II.7.7.3; the sequences use H_{1,T} because that is the category equivalent to Nil(R).
- For noncommutative R the chart fibration is proved through projective-line-localisation-models, resolution-fibres, directed-lattices and localisation-comparison. SchemeKTheoryOperations S.3/S.5 import the commutative specialization; they are not inputs here.

**Proof outline.**

1. Use the direct central-nonzerodivisor proof V.7.2–7.4 and its resolution/extension diagram, expanded in the projective-line localization prerequisites. For the affine R[t] case replace bundles by projectives and the lattice enlargements I⁻ⁿK by t⁻ⁿK. This uses neither scheme support K-theory nor a late S.3 input.
2. Replace H_T(R[t]) by H_{1,T}(R[t]) by the Resolution Theorem: H_{1,T} is closed under extensions and under kernels of surjections in H_T, and every object of H_T has a finite resolution by objects of H_{1,T} (the argument of Corollary II.7.7.3).
3. For (b), apply projective-line-localisation-comparison and its canonical map identification, with H₁,t≃H₁,T(R[t]) and K(VB)≃K(H₁) supplied by the localization-models node. These prove the exercise’s required fibration, rather than citing its statement alone.
4. (c): the base change mod-P¹_R → mod-R[t], F ↦ M₊, is exact, carries H_{1,t} identically onto H_{1,T}(R[t]), VB(P¹_R) into P(R[t]) and P(R[t⁻¹]) into P(R[t,t⁻¹]), and so induces a map of fibration sequences that is the identity on the fibres.
5. Record Caveat V.7.1.1: the connective sequence (a) ends with a map K_0(R[t]) → K_0(R[t,t⁻¹]) that need not be onto; its continuation uses negative K-groups.

**Acceptance.**

- In degree zero, (a) is the exact sequence K_0 H_T(R[t]) → K_0(R[t]) → K_0(R[t,t⁻¹]) of Corollary II.7.7.4.
- The fibres of (a) and (b) are the same space K(Nil(R)); the class of (R, 0) goes to [R[t]/tR[t]] in (a) and to [(R, 0, 0)] = [u_0(R)] − [u_1(R)] in (b).
- The centrality and nonzerodivisor hypotheses on T are used; they are not decorative.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`
- `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`
- `GeneralAlgebraicKTheory:K.4/approximation-theorem`
- `GeneralAlgebraicKTheory:K.4/fibration-theorem`
- `GeneralAlgebraicKTheory:K.3/resolution-theorem`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.6/projective-line-localisation-comparison`

**Sources.**

- `Kbook.2013`: V.7.1 (Theorem 7.1) and the paragraph after it, printed pp. 420 to 421 (PDF pp. 428 to 429). Sequence (a), for S = T, and the indirect proof this node follows. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.7.1.1 (Caveat 7.1.1), printed p. 421 (PDF p. 429). Why the connective sequence stops at K_0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: Exercise V.3.14, printed p. 399 (PDF p. 407). The identification of the support term with the torsion category. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: II.7.7.3 (Corollary 7.7.3), printed p. 137 (PDF p. 145). The reduction from H_S to H_{1,S}, in degree zero; the same resolution argument gives every degree. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: Exercise V.3.13, printed p. 399 (PDF p. 407). K(P¹_R) through modules with short resolutions. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: Exercise V.7.5, printed p. 429 (PDF p. 437). Sequence (b): the torsion objects on P¹_R. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: Exercise V.7.5(b)–(c), printed p. 429 (PDF p. 437). Sequence (b): the fibration, stated for an associative ring as an exercise (s = 1/t). Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.

### The Nil inclusion factors through the forgetful map on K-theory

`GeneralAlgebraicKTheory:K.6/nil-inclusion-is-forgetful` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let R be a unital associative ring and I : Nil(R) → H_1(P¹_R) send (P, ν) to (P_ν, 0, 0). Under the resolution equivalence K(H_1(P¹_R)) ≃ K(P¹_R), the induced map is homotopic to ((u_0)_* − (u_1)_*) ∘ forget_*. In particular it vanishes on the reduced Nil homotopy fibre in every nonnegative degree.

**Hypotheses.**

- Use the right-module gluing convention of projective-line-over-a-ring, transported to the early ring model by opposite-ring duality.
- ν is nilpotent, and H_1 is the category of objects admitting a length-one vector-bundle resolution, as in t-torsion-localisation-sequences.

**Proof outline.**

1. For (P, ν), the pair of maps (t − ν, 1 − t⁻¹ν) defines u_1(P) → u_0(P): the gluing square commutes since (1 − t⁻¹ν)t = t − ν.
2. Its plus component is injective with cokernel P_ν by the characteristic sequence. Its minus component is invertible, with inverse the finite sum Σ_j(t⁻¹ν)^j, since ν is nilpotent. Thus 0 → u_1(P) → u_0(P) → (P_ν,0,0) → 0 is exact in the gluing category.
3. Maps commuting with ν give maps of these resolutions. Consequently this is a conflation of exact functors Nil(R) → H_1(P¹_R), with first two terms u_1∘forget and u_0∘forget. Apply K.3 additivity and the resolution equivalence.
4. On the homotopy fibre of forget_* the factorization is null, proving the reduced-Nil vanishing. Split injectivity of u_0−u_1 alone would not imply this.

**Acceptance.**

- For ν = 0 the resolution is the standard u_1(P) ↣ u_0(P) ↠ (P,0,0).
- For ν² = 0, (1−t⁻¹ν)⁻¹ = 1+t⁻¹ν on the second chart.
- For R = ℤ, P = ℤ and ν = 1, the second-chart map 1−t⁻¹ is not invertible; this pair is outside Nil(R), so the argument cannot omit nilpotence.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`
- `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`
- `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`
- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`

**Sources.**

- `Kbook.2013`: Proof of Theorem V.8.1, book p.430 (full PDF p.438; chapter V PDF pp.60–61), with the characteristic resolution of Lemma II.7.8.2. The source states the zero-endomorphism restriction. This node supplies the explicit nilpotent-endomorphism resolution needed to identify the map on the whole Nil category; this is the reviewer’s derivation.

### Nil_n(R) ≅ NK_{n+1}(R)

`GeneralAlgebraicKTheory:K.6/nil-groups-are-NK` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For every unital ring R and every n ≥ 0 there is a natural isomorphism NK_{n+1}(R) ≅ Nil_n(R), where NK_{n+1}(R) is the cokernel of the split injection K_{n+1}(R) → K_{n+1}(R[t]) (equivalently of K_{n+1}(R) → K_{n+1}(R[t⁻¹])). It comes from the localisation sequence (b) of K.6/t-torsion-localisation-sequences, K_{n+1}(R[t⁻¹]) → K_n(R) ⊕ Nil_n(R) → K_n(P¹_R) → K_n(R[t⁻¹]) (the source's (8.1.1)), in which the summand K_n(R) maps to K_n(P¹_R) by u_0 − u_1 and Nil_n(R) maps to zero; the sequence therefore splits into 0 → K_n(R) → K_n(P¹_R) → K_n(R) → 0 and the isomorphism K_{n+1}(R[t⁻¹])/K_{n+1}(R) ≅ Nil_n(R).

**Hypotheses.**

- R is unital and associative. For commutative R the source uses the scheme sequence V.7.6.1; for noncommutative R it uses the gluing-category sequence of Ex. V.7.5, and this node uses the latter for every R.
- n ≥ 0: both sides are defined from connective K-theory.
- The isomorphism is natural in unital ring maps.

**Proof outline.**

1. Substitute Nil(R) ≃ H_{1,t} into the fibration (b) to obtain (8.1.1), with K_n H_{1,t} = K_n(R) ⊕ Nil_n(R).
2. Identify the map on the summand K_n(R): the composite P(R) → Nil(R) → H_1, P ↦ (P, 0, 0), sits in the exact sequence u_1(P) ↣ u_0(P) ↠ (P, 0, 0), obtained by tensoring P with 0 → O(−1) → O → (R, 0, 0) → 0, so by Additivity it induces u_0 − u_1.
3. By nil-inclusion-is-forgetful, the entire map K(Nil(R)) → K(P¹_R) factors as (u_0 − u_1) ∘ forget, so it vanishes on Nil_n(R). The projective-line splitting then identifies its K_n(R) summand with a split direct summand of K_n(P¹_R).
4. j^* u_0(P) = P ⊗_R R[t⁻¹], so j^* ∘ u_0 is the base change K(R) → K(R[t⁻¹]) that splits off K_n(R) from K_n(R[t⁻¹]) = K_n(R) ⊕ NK_n(R).
5. Conclude by the source's diagram chase that (8.1.1) splits as stated and that the boundary K_{n+1}(R[t⁻¹]) → K_n(R) ⊕ Nil_n(R) induces NK_{n+1}(R) ≅ Nil_n(R), naturally in R.

**Acceptance.**

- For n = 0 this is Nil_0(R) ≅ NK_1(R), the classical Proposition III.3.5.3.
- For A = k[ε]/(ε²), NK_1(A) ≅ Nil_0(A) ≅ (1 + εt·k[t])^× is non-zero, so N-terms genuinely occur.
- No regularity is assumed.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`
- `GeneralAlgebraicKTheory:K.6/projective-line-splitting`
- `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`
- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.6/nil-inclusion-is-forgetful`

**Sources.**

- `Kbook.2013`: V.8.1 (Theorem 8.1), printed p. 430 (PDF p. 438). The theorem. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.1, proof, printed p. 430 (PDF p. 438). The localisation sequence the proof starts from. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.1, proof, continued, printed p. 430 (PDF p. 438). The map on the summand K_n(R). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.1, proof, end, printed p. 430 (PDF p. 438). The splitting and the conclusion. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: III.3.5.3 (Proposition 3.5.3), printed p. 205 (PDF p. 213). The classical degree-zero case, an acceptance test. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The Fundamental Theorem in positive degrees: exactness

`GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`
- `GeneralAlgebraicKTheory:K.6/nil-groups-are-NK`
- `GeneralAlgebraicKTheory:K.6/projective-line-splitting`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- `Kbook.2013`: V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438). The theorem (the bracket is the source's). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.2, proof, printed p. 431 (PDF p. 439). The ladder. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.8.2, proof, continued, printed p. 431 (PDF p. 439). Exactness in positive degrees. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: V.3.5.1 (Example 3.5.1), printed p. 388 (PDF p. 396). The vanishing of the transfer. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Multiplication by the class of t splits the boundary

`GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `GeneralAlgebraicKTheory:K.6/t-torsion-localisation-sequences`
- `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`
- `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`
- `KTheoryLowDegrees:U.3/units-to-K1`
- `KTheoryLowDegrees:U.2/K1`
- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`
- `StableHomotopyKTheory:H.3`
- `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- `Kbook.2013`: V.8.2, proof, the splitting, printed p. 431 (PDF p. 439). The splitting and the formula. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: Exercise V.8.1, printed p. 434 (PDF p. 442). The boundary formula, for the general central nonzerodivisor. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: Exercise IV.1.23, printed p. 276 (PDF p. 284). Pairings of fibrations commute with the boundaries (the exercise's displayed diagram, which the text layer does not carry). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### K_1, K_0 and every K_{−n} are contracted functors: K_{−n} = Lⁿ K_0

`GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/contracted-functors`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`
- `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- `Kbook.2013`: III.3.6 (Fundamental Theorem for K1 3.6), printed p. 205 (PDF p. 213). Degree one, in the classical form. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: III.3.7 (Fundamental Theorem for K0 3.7), printed p. 206 (PDF p. 214). Degree zero. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.3.7, proof, printed p. 206 (PDF p. 214). The two-variable argument. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: III.4.1.2 (Example 4.1.2), printed p. 210 (PDF p. 218). Every negative group is contracted. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.4.2 (Proposition 4.2), printed p. 211 (PDF p. 219). The closure properties the induction uses. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.4.1.1, the paragraph after the definition, printed p. 210 (PDF p. 218). Bass's groups are the iterated contractions of K_0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The Fundamental Theorem with Nil terms, in every degree

`GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

- For a singular ring the N-terms can be non-zero and the decomposition has four terms; no node may drop them (for A = k[ε]/(ε²), NK_1(A) ≅ Nil_0(A) ≠ 0).
- The splitting is by multiplication by the class of the variable, and a different splitting would change the identification of the boundary.
- When NK_n(R) = 0 the decomposition has the two terms K_n(R) ⊕ K_{n−1}(R).

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/fundamental-theorem-positive-degrees`
- `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`
- `GeneralAlgebraicKTheory:K.6/nil-groups-are-NK`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/contracted-functors`
- `mathlib:LaurentPolynomial`

**Sources.**

- `Kbook.2013`: V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438). The theorem (the bracket is the source's). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.1 (Theorem 8.1), printed p. 430 (PDF p. 438). The identification of the N-terms with Nil. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8, the opening paragraph, printed p. 430 (PDF p. 438). The regular case. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.2, proof, printed p. 431 (PDF p. 439). The non-positive degrees come from Bass's contraction. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The axioms a theory of negative K-theory must satisfy

`GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory` · definition · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

A theory of negative K-theory for possibly non-unital rings is a sequence of functors in degrees at most zero together with natural boundary maps from the K-group of a quotient to the next group down of the ideal, satisfying four axioms: in degree zero the functor is the Grothendieck group; for every two-sided ideal the five-term sequence through the ideal, the ring and the quotient is exact; every flasque ring has vanishing groups in all degrees at most zero; and the inclusion of a ring in its infinite matrix ring induces isomorphisms in all those degrees. Bass's groups form such a theory. The axioms are what a second construction must be checked against, and they are the interface through which this layer's nonconnective spectrum is compared with the Bass groups.

**Hypotheses.**

- The rings are allowed to be non-unital, which is what makes the ideal axiom usable.
- The matrix ring in the fourth axiom is the union of the finite matrix rings.
- The four axioms determine the negative theory canonically by bass-cone-uniqueness (III.4.5), including its boundary maps; checking the axioms remains necessary for any alternative model.

**Proof outline.**

1. State the four axioms in the source's order.
2. Record that Bass's negative K-groups satisfy them, with the source's pointers to the contraction and the exercises where each axiom is checked.
3. Record the role of the flasque axiom: it is the one that forces the theory to be non-trivial in negative degrees rather than being extendable by zero.
4. Record that the excision-type axiom is stated for non-unital rings and that restricting to unital rings weakens it.
5. Record the use this layer makes of the axioms: any second construction, including the flasque-enlargement route the stage text names, is compared with Bass's groups by checking them.
6. Apply bass-cone-uniqueness only after the four axioms have been established for the candidate; no duplicate definition of negative ring groups is introduced.

**Acceptance.**

- Bass's groups satisfy all four axioms.
- A theory that is zero in all negative degrees fails the flasque axiom only if some flasque ring has a non-zero group, so the axiom must be read together with the exactness axiom; the source's formulation is the one recorded here.
- The fourth axiom is about the infinite matrix ring, not about finite matrix rings, and the distinction matters.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`
- `mathlib:Matrix`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `NegativeKTheory` | structure | The functors in degrees at most zero together with the boundary maps. |
| `NegativeKTheory.k0` | characterisation | Axiom one: in degree zero the functor is the Grothendieck group. |
| `NegativeKTheory.exact_ideal` | characterisation | Axiom two: the five-term sequence of an ideal is exact. |
| `NegativeKTheory.flasque` | characterisation | Axiom three: a flasque ring has vanishing groups. |
| `NegativeKTheory.matrix` | characterisation | Axiom four: the inclusion in the infinite matrix ring is an isomorphism. |
| `bassTheory` | example | Bass’s negative groups form such a theory. |

**Consumers.**

- K.6, the nonconnective spectrum — The axioms are the interface through which a second construction is compared with the Bass groups.
- K.6, the flasque rings — The third axiom is the only place the flasque notion enters the characterisation.
- The stage text — The text asks for independence of the enlargement; the axioms are what that independence is checked against.

**Unit tests.**

- `bass_satisfies` (computation) — Bass’s groups satisfy all four axioms.
- `nonunital` (non-example) — The second axiom is stated for non-unital rings; restricting to unital rings weakens it.
- `infinite_matrices` (non-example) — The fourth axiom is about the infinite matrix ring, not the finite ones.
- `degree_zero` (computation) — In degree zero the theory is the Grothendieck group, so the axioms extend the existing definition rather than replacing it.

**Sources.**

- `Kbook.2013`: III.4.4 (Definition 4.4), printed p. 213 (PDF p. 221). The definition. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.4.4, axioms (3)–(4), printed p. 213 (PDF p. 221). The last two axioms, checked against the node's list. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.4.4.1 (Example 4.4.1), printed p. 214 (PDF p. 222). Bass's groups satisfy the axioms. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Mayer–Vietoris for a Milnor square, continued into negative degrees

`GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`
- `GeneralAlgebraicKTheory:K.6/contracted-functors`
- `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`
- `KTheoryLowDegrees:U.2/K1`
- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`
- `StableHomotopyKTheory:H.3`

**Sources.**

- `Kbook.2013`: III.4.3 (Theorem 4.3), printed pp. 212–213 (PDF pp. 220–221). The theorem; the displayed sequence follows on p. 213. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.4, the paragraph before Theorem 4.3, printed p. 212 (PDF p. 220). The proof by contraction. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.2.6 (Theorem 2.6), printed p. 195 (PDF p. 203). The K_1–K_0 part, imported from K.5. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.4.3.1 (Example 4.3.1), printed p. 213 (PDF p. 221). Dayton's example, an acceptance test. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The nonconnective Bass K-theory spectrum

`GeneralAlgebraicKTheory:K.6/nonconnective-spectrum` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory`
- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `StableHomotopyKTheory:H.5:spectra`
- `StableHomotopyKTheory:H.5:S-delooping`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `deloop` | data | The functor LE and its desuspension. |
| `deloop_cofibration` | characterisation | The natural cofibration sequence. |
| `bassSpectrum` | data | The nonconnective Bass K-theory spectrum. |
| `bassSpectrum_natural` | functoriality | Naturality in the ring and in the model of connective K-theory. |
| `bassSpectrum_independent` | compatibility | Two naturally equivalent models of connective K-theory give equivalent nonconnective spectra. |

**Consumers.**

- K.6, localisation — The nonconnective formulation of localisation is a statement about this spectrum and is what makes the boundary maps extend into negative degrees.
- K.7 — The invariance and product statements are asserted at the level of this spectrum, not only of the connective one.
- The stage text — The flasque-enlargement route the text names is an alternative construction; it is compared with this one through the axioms of the previous node.

**Unit tests.**

- `agrees_above_zero` (non-example) — In non-negative degrees the homotopy groups are the K-groups of the connective spectrum.
- `degree_minus_one` (computation) — In degree minus one the homotopy group is the first negative K-group.
- `regular_case` (computation) — For a regular noetherian ring the negative homotopy vanishes.
- `model_independence` (computation) — Two models of connective K-theory related by a natural equivalence give equivalent nonconnective spectra.

**Sources.**

- `Kbook.2013`: IV.10.1 (Definition 10.1), printed p. 349 (PDF p. 357). The construction. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.10.2 (Fundamental Theorem 10.2), printed p. 349 (PDF p. 357). The first desuspension. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.10, before Theorem 10.2, printed p. 349 (PDF p. 357). The comparison map is a product with the class of x. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: IV.10.3 (Corollary 10.3), printed p. 349 (PDF p. 357). The iteration (the corollary's last clause carries the misprint recorded as E1). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.10.4 (Definition 10.4), printed p. 350 (PDF p. 358). The Bass spectrum. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The homotopy groups of the Bass spectrum are the K-groups and Bass's negative groups

`GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`
- `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`

**Sources.**

- `Kbook.2013`: IV.10, the opening paragraph, printed p. 349 (PDF p. 357). The purpose: the negative homotopy is Bass's groups (the source's own spelling kept). Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: IV.10.3, proof, printed p. 350 (PDF p. 358). The identification in degree −k, through multiplication by x. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.10.4 (Definition 10.4), last sentence, printed p. 350 (PDF p. 358). The homotopy groups of the Bass spectrum. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.4 (Theorem 8.4), printed p. 432 (PDF p. 440). The topological Fundamental Theorem the first step uses. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Excision for a Milnor square in degrees at most zero

`GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let f : R → S be a homomorphism of unital associative rings and I ⊂ R a two-sided ideal that f maps bijectively onto a two-sided ideal J = f(I) of S, so that R → S, R/I → S/J is a Milnor square: R is the pullback of S and R/I over S/J, and S → S/J is onto. Write 𝕂 = K^B for the Bass spectrum and 𝕂(R, I) for the homotopy fibre of 𝕂(R) → 𝕂(R/I), and similarly 𝕂(S, J). Then the induced map 𝕂(R, I) → 𝕂(S, J) is an isomorphism on π_n for every n ≤ 0. In particular its homotopy fibre, the birelative term, is concentrated in degrees ≥ 0 (its π_n vanishes for n ≤ −1, and its π_0 is the cokernel of the map on π_1), and, applied to ℤ ⋉ I → R, π_n 𝕂(R, I) depends only on the nonunital ring I for n ≤ 0. In degree one this node records only the classical statement: the classical relative groups K_1(R, I) = GL(I)/E(R, I) → K_1(S, J) form a surjection, because both are quotients of GL(I) = GL(J) (Remark III.2.2.1, the exactness at K_1(S) ⊕ K_1(R/I) of K.5/milnor-square-mayer-vietoris). The spectrum form of that surjection — π_1 𝕂(R, I) → π_1 𝕂(S, J) onto, equivalently the birelative term concentrated in degrees ≥ 1 — needs the identification of π_1 of K.5's relative fibre with GL(I)/E(R, I), which is KTheoryLowDegrees U.6's and lies downstream of K.6; it is handed to U.6 by request and is not asserted here. Nothing is claimed in degrees ≥ 2, and the degree-one map is not claimed injective: excision for K_1 already fails (Swan's example, Ex. III.2.3), and the general criteria are K.5/excision-and-its-failure's. This is the non-positive part of Bass's excision theorem (Bass, Algebraic K-theory, Theorem XII.8.3, as Clausen–Mathew–Morrow cite it). The proof of Clausen–Mathew–Morrow's Proposition 4.34 uses only that the birelative term is concentrated in degrees ≥ 0, which this node proves; their parenthesis 'even ≥ 1' is U.6's.

**Hypotheses.**

- The rings are unital and associative, f is unital, and f restricted to I is a bijection onto the two-sided ideal J = f(I) of S; the pullback property and the surjectivity of S → S/J then hold automatically. These are the Milnor-square hypotheses of Clausen–Mathew–Morrow's Theorem 4.33 and Proposition 4.34; no commutativity is assumed.
- 𝕂 is the Bass nonconnective spectrum; by the ring clause of K.6/agreement-and-vanishing-of-negative-K, Schlichting's IK has the same homotopy groups in degrees ≤ 0, so the statement does not depend on that choice.
- The degree-zero input is the actual early K5 ideal-degree-zero-excision proof: relative projective triples map to fibre components, ideal patching identifies them with augmented-ring kernels, and a split Milnor square proves independence of the ambient ring. Only π1 comparison remains the later U6 obligation.
- Only isomorphisms in degrees ≤ 0 are asserted for 𝕂; the degree-one statement is the classical one, and its spectrum form is U.6's.

**Proof outline.**

1. Check the Milnor-square facts: R ≅ S ×_{S/J} R/I, and the square is preserved by R ↦ R[t], R[t⁻¹], R[t,t⁻¹], with I[t] and so on, so the pairs form a category of Milnor squares closed under polynomial and Laurent extension.
2. Connective and nonconnective relative theories agree in degrees ≥ 0: K(R) → 𝕂(R) is an isomorphism on π_n for n ≥ 0 (K.6/bass-spectrum-homotopy-groups), so comparing the two long exact sequences of the pair gives π_0 K(R, I) ≅ π_0 𝕂(R, I), and likewise for (S, J).
3. Degree zero: apply K5/ideal-degree-zero-excision, whose three separate nodes construct the fibre-component map, verify its automorphism boundary, identify the augmented-ring kernel and prove excision by the split augmented Milnor square. The commuting unitization triangle gives the stated π0 comparison. Absolute negative Mayer–Vietoris alone is not used as this proof.
4. Negative degrees: the cofibration sequence 𝕂(A) → 𝕂(A[t]) ∪_{𝕂(A)} 𝕂(A[t⁻¹]) → 𝕂(A[t,t⁻¹]) → Σ𝕂(A) of the Bass construction is natural in the ring A (IV.10.1) and its last map is split naturally by multiplication by t (K.6/fundamental-theorem-with-nil-terms, K.6/bass-spectrum-homotopy-groups). Taking homotopy fibres along A = R → R/I gives the same naturally split sequence for the relative spectra, so π_{n−1}𝕂(R, I) is naturally the contraction L of the functor (R, I) ↦ π_n 𝕂(R, I) on Milnor squares, and the map to (S, J) is a morphism of contracted functors.
5. Induct downwards: a morphism of contracted functors that is an isomorphism in degree n induces an isomorphism of their contractions (the argument of Proposition III.4.2), so the degree-zero isomorphism gives isomorphisms in every negative degree.
6. Consequences: the long exact sequence of the fibre of 𝕂(R, I) → 𝕂(S, J) shows that the birelative term has π_n = 0 for n ≤ −1 and π_0 equal to the cokernel of the map on π_1; applying the theorem to ℤ ⋉ I → R shows that π_n 𝕂(R, I), n ≤ 0, depends only on I. Compare K.6/mayer-vietoris-for-negative-k, which states the continuation of the classical Mayer–Vietoris sequence.
7. Degree one, classical: K_1(R, I) → K_1(S, J) is onto because both are quotients of GL(I) = GL(J) (Remark III.2.2.1); this is imported as the exactness at K_1(S) ⊕ K_1(R/I) of K.5/milnor-square-mayer-vietoris. Record that the spectrum form belongs to KTheoryLowDegrees U.6, which proves it from its relative comparison and this classical exactness.
8. Record what is not claimed: injectivity in degree one fails in general (Remark III.2.2.1 and Ex. III.2.3), and excision in degrees ≥ 2 needs the hypotheses of K.5/excision-and-its-failure.

**Acceptance.**

- Applied to ℤ ⋉ I → R, the theorem makes π_n 𝕂(R, I), n ≤ 0, an invariant of the nonunital ring I alone, which is how K_n(I) of a nonunital ring can be read off from any unital ring containing it.
- Swan's square (R the upper triangular 2 × 2 matrices over a field F, I its strictly upper triangular ideal, R_0 = F ⊕ I ⊂ R): the classical degree-one map K_1(R_0, I) ≅ F → K_1(R, I) = 0 is onto but not injective, which is why only surjectivity is recorded in degree one.
- The birelative term in the proof of Clausen–Mathew–Morrow's Proposition 4.34 is concentrated in degrees ≥ 0, which is all that proof uses ('it suffices to show that F is also concentrated in degrees ≥0'); the refinement to degrees ≥ 1 is U.6's.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`
- `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`
- `GeneralAlgebraicKTheory:K.6/contracted-functors`
- `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`
- `GeneralAlgebraicKTheory:K.5/excision-and-its-failure`
- `GeneralAlgebraicKTheory:K.5/relative-K-theory`
- `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`
- `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`
- `StableHomotopyKTheory:H.5:spectra`
- `GeneralAlgebraicKTheory:K.5/ideal-degree-zero-excision`

**Sources.**

- `Kbook.2013`: IV.10.1 (Definition 10.1), printed p. 349 (PDF p. 357). The cofibration sequence whose naturality in R lets the contraction pass to relative spectra. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: Exercise IV.10.1, printed p. 351 (PDF p. 359). The source's route to the same conclusion, through the classical K_0(I); this node replaces that identification, which is U.6's, by K.5's degree-zero excision. Prose verbatim from the text layer of the author-hosted PDF, with the words that layer drops elided (…); formulas transcribed.
- `Kbook.2013`: III.2.2.1 (Remark 2.2.1), printed p. 193 (PDF p. 201). The classical degree-one surjectivity, and why injectivity is not claimed. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `CMM.2021`: Theorem 4.33, p. 35. The Milnor-square hypotheses, for associative rings. Verbatim from the text layer of the arXiv v2 PDF.
- `CMM.2021`: Proposition 4.34, proof, p. 35. The use of this node: the proof needs only that the fibre 𝔽 of 𝕂(R, I) → 𝕂(S, J) is concentrated in degrees ≥ 0. Verbatim from the text layer of the arXiv v2 PDF, whose text layer drops the blackboard-bold font; 𝕂 and 𝔽 are restored from the proof's first sentence, which names F and 𝔽 as the fibres of the connective and the nonconnective maps. Bass's Theorem XII.8.3 was not read.
- `CMM.2021`: arXiv:1803.10897v2 p35,full proof of Proposition4.34 read. Two fibre comparisons preserve π≥0 because the necessary positive absolute terms are isomorphisms. Henselian relative connective spectra are1-connective from K0-isomorphism and K1-surjectivity; their birelative fibre is0-connective. The nonconnective birelative fibre is0-connective by the proved relative π≤0 excision; its stronger1-connectivity still needs U6.

### Vanishing of the negative K-groups for a regular noetherian ring

`GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`
- `GeneralAlgebraicKTheory:K.6/mayer-vietoris-for-negative-k`

**Sources.**

- `Kbook.2013`: III.4.1, after Definition 4.1, printed p. 210 (PDF p. 218). The vanishing itself, stated by the source; the packet had not cited it. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8, the opening paragraph, printed p. 430 (PDF p. 438). The vanishing of the N-terms. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: I.3.7.1 (Definition 3.7.1), printed p. 23 (PDF p. 31). The definition of regular; the packet's 'II.6.5 and I.3.7.1' merged two places. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Morita invariance

`GeneralAlgebraicKTheory:K.7/morita-invariance` · theorem · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

Two rings are Morita equivalent when their module categories are equivalent; the structure theorem says that this happens exactly when there is a finitely generated projective generator of one whose endomorphism ring is the other, and that the equivalence is then given by tensoring against a bimodule. Since K-theory is defined from the category of finitely generated projective modules, and an equivalence of module categories restricts to an equivalence of those subcategories, Morita equivalent rings have isomorphic K-groups in every degree, connective and negative alike. The standard instance is the matrix ring: the ring and its ring of n by n matrices for n ≥ 1 are Morita equivalent, so their K-theories agree. The comparison is additive and natural for the chosen equivalence. Compatibility with an external product requires a commuting diagram of the relevant biexact functors. An internal unital ring comparison additionally requires compatible unit-preserving monoidal data; an arbitrary Morita equivalence does not supply those data.

**Hypotheses.**

- R and S are rings, not necessarily commutative; the module categories are of right modules, as the source has them.
- The equivalence is an additive equivalence of abelian categories; Morita theory says that every such equivalence is of the tensor form.
- Both pinned instances, the matrix equivalence of module categories and the Morita predicate with its matrix instance, exist in Mathlib and are cited, so the node is a comparison for them rather than a construction.
- The matrix case requires n ≥ 1 (equivalently a nonempty finite index type). A Morita equivalence is not assumed monoidal. Right modules are represented by ModuleCat Rᵐᵒᵖ at the pin and compared with the early left-module ring model through K.2’s opposite-ring comparison.

**Proof outline.**

1. Record the pinned material: the equivalence between modules over a ring and modules over its matrix ring, the Morita equivalence predicate and its matrix instance.
2. State the structure theorem in the source's form: an equivalence is given by tensoring against a bimodule, the bimodule is a finitely generated projective generator, and the other ring is its endomorphism ring.
3. Deduce that the equivalence restricts to an exact equivalence of the categories of finitely generated projective modules, so it induces isomorphisms on all K-groups by the functoriality of K under exact functors (K.1) applied to the early ring model P(R) of K.2:plus, which this node imports rather than re-defining.
4. Negative degrees: the bimodule giving the equivalence also gives equivalences over R[t], R[t⁻¹] and R[t,t⁻¹], compatibly with the maps between them, so the isomorphism passes to the cokernels that define Bass's groups (K.6/negative-k-groups).
5. Record the instance for matrix rings and the source's exercise that the matrix ring over a ring is Morita equivalent to it.
6. Given equivalences on the two inputs and the target together with a natural isomorphism between the two composite biexact functors, apply naturality of K.7/products-from-biexact-functors to obtain the external-product comparison. Only in a compatible unit-preserving monoidal setting does this become an internal unital ring isomorphism.
7. Record the source's remark that the Morita equivalence classes are not the isomorphism classes, so the statement has content.

**Acceptance.**

- For n ≥ 1 a ring and its n by n matrix ring have isomorphic K-groups in every degree; M₀(k) is the zero ring and has K₀ = 0, whereas K₀(k) = ℤ.
- External-product compatibility carries the natural isomorphism of biexact functors as data; no unital ring isomorphism is inferred from a bare Morita equivalence.
- Morita equivalent rings need not be isomorphic, so the theorem is not a triviality.

**Prerequisites.**

- `mathlib:ModuleCat.matrixEquivalence`
- `mathlib:IsMoritaEquivalent`
- `mathlib:IsMoritaEquivalent.matrix`
- `mathlib:Matrix`
- `tauceti:TauCeti.ExactK0`
- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KTheory.moritaEquiv` | data | The induced isomorphism of K-groups from a Morita equivalence. |
| `KTheory.moritaEquiv_matrix` | example | The instance for the matrix ring. |
| `KTheory.moritaEquiv_mul` | compatibility | Given Morita equivalences of both input categories and the target, and a compatible natural isomorphism of their external-product biexact functors, the induced K-group isomorphisms commute with that external product. |
| `moritaStructure` | characterisation | The structure theorem: the equivalence is tensoring against a projective generator. |
| `KTheory.moritaEquiv_negative` | compatibility | The isomorphism holds in negative degrees as well. |

**Consumers.**

- K.6 — One of the four axioms for negative K-theory is matrix invariance, which this node supplies in the finite case.
- K.7, the products — The compatibility statement is what lets a computation be transported along a Morita equivalence.
- The libraries — Mathlib has the predicate and the matrix instance; what is missing is the K-theoretic consequence.

**Unit tests.**

- `matrix_invariance` (compatibility) — For n ≥ 1, K_*(M_n(R)) ≅ K_*(R); the n = 0 case over a field fails.
- `not_isomorphism` (non-example) — Morita equivalent rings need not be isomorphic, so the statement is not vacuous.
- `respects_product` (non-example) — For a commutative ring with an invertible module L whose class differs from [R] in K₀, the Morita autoequivalence L ⊗_R − sends [R] to [L]. Thus it is not a unital K₀-ring automorphism. A product comparison must carry additional monoidal/biexact compatibility data.
- `negative_degrees` (computation) — The isomorphism holds in negative degrees.

**Sources.**

- `Kbook.2013`: II.2.7 (Theorem 2.7), printed p. 75 (PDF p. 83). The structure theorem. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: II.2.7.1 (Corollary 2.7.1), printed p. 76 (PDF p. 84). Degree zero. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: II.2.7.2 (Example 2.7.2), printed p. 76 (PDF p. 84). The matrix ring. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.6.3.5 (Morita Invariance 6.3.5), printed p. 321 (PDF p. 329). All degrees. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Derived invariance needs an enhancement, not a triangulated equivalence

`GeneralAlgebraicKTheory:K.7/derived-morita-and-enhancements` · comparison · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/morita-invariance`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`
- `GeneralAlgebraicKTheory:K.4/approximation-theorem`
- `tauceti:TauCeti.ExactK0.mapEquiv`
- `mathlib:CategoryTheory.Functor.IsEquivalence`

**Sources.**

- `Kbook.2013`: II.9.1.1 (Definition 9.1.1), printed p. 158 (PDF p. 166). The data a K-theory is built from. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: II.9.7 (Theorem 9.7, Approximation Theorem), printed p. 167 (PDF p. 175). The invariance statement at the level of Waldhausen categories, which is what the enhancement hypothesis provides. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Schlichting.NegativeK.2003`: Definition 11.1 and Proposition 11.15, pp. 20 and 22. Derived invariance for maps of Frobenius pairs: the hypothesis is a map of models, not a bare triangulated equivalence. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Filtered colimits and finite products in the nonconnective theory

`GeneralAlgebraicKTheory:K.7/invariance-under-filtered-colimits-and-products` · theorem · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

The connective statements — K_n(R × R′) ≅ K_n(R) × K_n(R′) for a finite product of unital rings and colim_i K_n(R_i) ≅ K_n(colim_i R_i) for a filtered colimit, n ≥ 0 — belong to the early ring node (K.2/functorial-K-theory-of-a-ring, from K.1/elementary-properties-of-K-groups) and are imported, not re-proved here. This node adds their nonconnective refinements. (a) For every n ≥ 1, Bass's K_{−n} takes finite products of rings to products (K.6/negative-k-groups) and commutes with filtered colimits of rings, because R ↦ R[t], R[t⁻¹], R[t,t⁻¹] commute with filtered colimits and so do cokernels. (b) Hence the Bass spectrum satisfies K^B(R × R′) ≃ K^B(R) × K^B(R′) and hocolim_i K^B(R_i) ≃ K^B(colim_i R_i), the maps being isomorphisms on π_n for every integer n by (a), the connective statements and K.6/bass-spectrum-homotopy-groups. (c) For Frobenius pairs and exact categories the non-positive filtered-colimit statement is K.6/additivity-and-colimits-for-negative-K's (Schlichting's Lemma 6.3 and Corollary 6.4), cited here, not restated. (d) The infinite matrix ring M(R) = colim_n M_n(R) uses corner embeddings, which are nonunital. Its continuity statement is supplied by nonunital-filtered-continuity, using unitization fibres and matrix-corner-morita-naturality. The target is the nonunital spectrum K^B_nu(M(R)); the actual corner inclusion induces the comparison. Infinite products are not claimed.

**Hypotheses.**

- Filtered colimits are over small filtered categories of unital rings and unital maps and are taken in rings; products are finite.
- The connective statements are imported from the early ring node; this node owns only the nonconnective refinements, for Bass's groups, the Bass spectrum and Schlichting's IK.
- The pinned library has filtered colimits of categories but not the K-theoretic statement, which the audit records.
- Clause(d) imports the explicit nonunital unitization/fibre adapter and the corner-map compatibility calculation. No transition is treated as unital.

**Proof outline.**

1. Import the connective finite-product and filtered-colimit statements for rings from K.2/functorial-K-theory-of-a-ring, which applies K.1/elementary-properties-of-K-groups to idempotent-matrix models.
2. Negative degrees: finite products from K.6/negative-k-groups; filtered colimits by induction on n, since polynomial and Laurent extensions and cokernels commute with filtered colimits.
3. Spectrum level: compare π_n in every degree, using K.6/bass-spectrum-homotopy-groups with the connective statements for n ≥ 0 and the previous step for n < 0.
4. Frobenius pairs: cite K.6/additivity-and-colimits-for-negative-K for the non-positive filtered-colimit statement.
5. Apply nonunital-filtered-continuity to the corner matrix diagram. The standard Morita bimodules identify every transition with identity by matrix-corner-morita-naturality; the fibre-map calculation includes the complementary augmentation idempotent.

**Acceptance.**

- The negative K-groups of a finite product ring are the products of the negative K-groups, and K^B(R × R′) ≃ K^B(R) × K^B(R′).
- The negative K-groups of a filtered colimit of rings are the colimits of the negative K-groups.
- Neither statement is claimed for infinite products; the source records that those are different.
- The corner map M_n(R) → M_{n+1}(R), A ↦ diag(A,0), sends 1 to diag(1,0), not to 1 for a nonzero R. The theorem for unital filtered diagrams cannot be applied before unitisation.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`
- `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`
- `GeneralAlgebraicKTheory:K.7/morita-invariance`
- `mathlib:CategoryTheory.Limits.HasFilteredColimits`
- `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`
- `GeneralAlgebraicKTheory:K.5/relative-K-theory`
- `GeneralAlgebraicKTheory:K.7/nonunital-filtered-continuity`

**Sources.**

- `Kbook.2013`: II.2, the paragraph after Example 2.1.3, printed p. 69 (PDF p. 77). Products in degree zero; the connective statement is the early ring node's and is quoted so that the boundary is visible. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.6.4 (Elementary properties 6.4), printed p. 321 (PDF p. 329). Products in all non-negative degrees, the connective statement imported from the early ring node. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.6.4, the filtered-colimit clause, printed p. 321 (PDF p. 329). Filtered colimits in all non-negative degrees, the connective statement imported from the early ring node. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Schlichting.NegativeK.2003`: Lemma 6.3 and Corollary 6.4, pp. 13–14. Filtered colimits in non-positive degrees, stated in K.6/additivity-and-colimits-for-negative-K and cited here. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### External products from biexact functors: the K-theoretic pairing and its coherence

`GeneralAlgebraicKTheory:K.7/products-from-biexact-functors` · construction · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.7:products`; maintainer integration is pending.

A biexact functor induces a pairing of K-theory. For exact categories A, B, C and a functor F : A × B → C exact in each variable with F(A, 0) = F(0, B) = 0, the induced map on Q-constructions gives a pairing K(A) ∧ K(B) → K(C) and bilinear products K_i(A) ⊗ K_j(B) → K_{i+j}(C), which in degree zero send [A] ⊗ [B] to [F(A, B)]. For Waldhausen categories the same holds for a biexact functor satisfying Waldhausen's condition that F(A′, B) ∪_{F(A,B)} F(A, B′) → F(A′, B′) is a cofibration for all cofibrations A ↣ A′ and B ↣ B′: the induced map wS.A × wS.B → wwS.S.C gives a pairing K(A) ∧ K(B) → K(C) of spectra, natural in exact functors and natural transformations of each variable. If F is associative, unital or symmetric up to coherent natural isomorphism, the pairing is associative, unital or symmetric up to homotopies transported from those isomorphisms; the homotopies are data. For algebras A and B over a commutative ring k, ⊗_k : P(A) × P(B) → P(A ⊗_k B) gives the external product K(A) ∧ K(B) → K(A ⊗_k B), and for a commutative ring R the internal product that makes K(R) a commutative ring spectrum and K_*(R) a graded ring with unit [R]. This node is the only owner of the K-theoretic pairing K(A) ∧ K(B) → K(C) and its coherence: the smash product of spectra, its own coherence and the sign of the twist on spheres are imported from StableHomotopyKTheory H.5:spectra, the connective K-theory spectrum from K.4:construction and H.5:S-delooping, and the assembly of that spectrum requires no product.

**Hypotheses.**

- A, B and C are small exact or Waldhausen categories and the functor is biexact, with Waldhausen's cofibration condition in the Waldhausen case.
- For the ring case the tensor product is over a fixed commutative base k and the modules are finitely generated projective over the respective k-algebras; the external product needs no commutativity of the algebras.
- The unit is the class of the base ring as a module over itself, and the symmetry is the swap of the two factors; the coherence homotopies are transported from the coherence isomorphisms of the tensor product, not asserted.

**Proof outline.**

1. State biexactness for exact and for Waldhausen categories and the induced bilinear map on the zeroth groups (II.7.4, II.9.5.1), with the formula [A]·[B] = [F(A, B)].
2. Use biexact-S-grid and biexact-stabilized-pairing: verify the joint latching cofibration, construct the bisimplicial map, remove the doubled weak-map nerve by the swallowing lemma, and assemble the compatible iterated-S level maps through H.5.
3. Prove naturality in exact functors and natural transformations of each variable; this is what makes the pairing compatible with maps of fibration sequences, as K.6/multiplication-by-t-splits-the-boundary uses.
4. Use biexact-pairing-coherence to transport natural associator/unit/symmetry isomorphisms and their diagrams. The full coherent multilinear/E∞ recognition step is a stated H.5 supplier requirement, not attributed to Waldhausen’s one-page indication.
5. Specialise to rings: the external product K(A) ∧ K(B) → K(A ⊗_k B) and, for a commutative ring, the internal product with unit [R]; record Tau Ceti's pinned degree-zero product statement for the split model as the baseline instance and say exactly what it does and does not give.
6. Record the other applications of the same machine, in particular the pairing that makes the Nil groups a module over the zeroth K-group (II.7.4.4), and that SchemeKTheoryOperations S.6 extends this pairing to schemes and imports it.

**Acceptance.**

- The zeroth K-group of a commutative ring is a commutative ring with unit the class of the ring itself.
- The pinned Tau Ceti statement that the class of a tensor product is the product of the classes is the degree-zero instance and is cited, not reproved.
- The pairing is bilinear, so it is determined by its values on classes of modules, which is what makes it computable.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`
- `GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q`
- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `StableHomotopyKTheory:H.5:spectra`
- `StableHomotopyKTheory:H.5:S-delooping`
- `tauceti:TauCeti.SplitK0.of_mul_of`
- `tauceti:TauCeti.SplitK0`
- `mathlib:TensorProduct`
- `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`
- `GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KTheory.biexactPairing` | data | The pairing induced by a biexact functor. |
| `KTheory.biexactPairing_natural` | functoriality | The pairing is natural in exact functors and natural transformations of each variable, and so maps fibration sequences in one variable to fibration sequences. |
| `KTheory.biexactPairing_K0` | characterisation | In degree zero the pairing sends [A] ⊗ [B] to [F(A, B)]. |
| `KTheory.externalProduct` | data | The external product of the K-groups of two algebras. |
| `KTheory.mul` | data | The internal product for a commutative ring. |
| `KTheory.mul_assoc` | compatibility | The associativity homotopy. |
| `KTheory.mul_one` | compatibility | The unit homotopy, with unit the class of the ring. |
| `KTheory.mul_comm_graded` | compatibility | The symmetry homotopy, giving graded commutativity. |

**Consumers.**

- K.6, the Fundamental Theorem and the Bass spectrum — Multiplication by [t] ∈ K_1(ℤ[t,t⁻¹]) is the external product of this node; it splits the boundary of the Fundamental Theorem (K.6/multiplication-by-t-splits-the-boundary) and defines the maps of the Bass delooping (K.6/nonconnective-spectrum).
- K.7, graded commutativity — The symmetry homotopy is what produces the sign in the commutativity of the total K-group.
- K.7, compatibilities — The product is asserted compatible with relative groups, boundaries and transfers.
- SchemeKTheoryOperations S.6 — The scheme-level external product is the same construction for a different input.

**Unit tests.**

- `K0_is_a_ring` (computation) — The zeroth K-group of a commutative ring is a commutative ring.
- `unit_is_the_class_of_R` (computation) — The unit of the product is the class of the ring as a module over itself.
- `tensor_of_classes` (compatibility) — The product of the classes of two modules is the class of their tensor product; this is the pinned Tau Ceti statement.
- `homotopies_are_data` (non-example) — The associativity and symmetry are given by transported coherence isomorphisms, not asserted.

**Sources.**

- `Kbook.2013`: II.7, 'Products', and Lemma 7.4, printed p. 132 (PDF p. 140). The definition and the pairing on K0. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: II.9.5.2 (Definition 9.5.2), printed p. 165 (PDF p. 173). The Waldhausen version (the pairing of spectra is IV.8.11, not here). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: II.7.4.1 (Application 7.4.1), printed p. 132 (PDF p. 140). The tensor product. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.6.6 (Definition 6.6), printed p. 322 (PDF p. 330). Higher products for exact categories. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.8.11 (Products), printed p. 342 (PDF p. 350). The pairing of spectra. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The total K-group is a graded-commutative ring

`GeneralAlgebraicKTheory:K.7/graded-commutativity` · theorem · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`
- `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- `Kbook.2013`: IV.1.10 (Theorem 1.10, Loday), printed p. 266 (PDF p. 274). Graded commutativity; the packet cited 'IV.1 and the product structure (PDF p. 302)' with a formula that is not in the source. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.8.2 (Theorem 8.2), printed p. 430 (PDF p. 438). Multiplication by the class of the variable. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Compatibility of the product with relative groups, boundaries and transfers

`GeneralAlgebraicKTheory:K.7/compatibility-with-relative-groups-and-transfers` · lemma · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `GeneralAlgebraicKTheory:K.7/graded-commutativity`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`
- `GeneralAlgebraicKTheory:K.6/multiplication-by-t-splits-the-boundary`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `GeneralAlgebraicKTheory:K.5/relative-K-theory`

**Sources.**

- `Kbook.2013`: V.3.12 (Projection Formula 3.12), printed p. 395 (PDF p. 403). The projection formula for the transfer. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: IV.8.11 (Products), printed p. 342 (PDF p. 350). The spectrum-level pairing the compatibilities are statements about. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The K-zero tensor comparison and multiplication by a unit in K-one

`GeneralAlgebraicKTheory:K.7/unit-multiplication-and-K0-tensor-comparison` · lemma · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `tauceti:TauCeti.SplitK0.of_mul_of`
- `tauceti:TauCeti.SplitK0`

**Sources.**

- `Kbook.2013`: II.7.4.1 (Application 7.4.1), printed p. 132 (PDF p. 140). The K0 comparison. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.1.1.1 (Example 1.1.1, SK1), printed p. 180 (PDF p. 188). Units in K1; [u] + [u⁻¹] = [u u⁻¹] = 0 since K1 is additive in the product of units. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Frobenius categories, Frobenius pairs and their derived categories

`GeneralAlgebraicKTheory:K.6/frobenius-pairs` · definition · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `tauceti:TauCeti.ExactStructure.IsFrobenius`
- `tauceti:TauCeti.ExactStructure.split_isFrobenius`
- `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`
- `mathlib:CategoryTheory.ObjectProperty.trW`
- `tauceti:TauCeti.ExactK0`
- `mathlib:CategoryTheory.Idempotents.Karoubi`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `FrobeniusCategory` | structure | Enough projectives and injectives, which coincide; Tau Ceti’s pinned IsFrobenius is the coincidence, and this adds the enough-objects data. |
| `FrobeniusCategory.stable` | data | The stable category, with its triangulated structure. |
| `FrobeniusPair` | structure | A fully faithful inclusion of small Frobenius categories preserving projective-injectives. |
| `FrobeniusPair.derived` | data | The derived category, the Verdier quotient of the stable categories. |
| `FrobeniusPair.map` | functoriality | A map of pairs induces a triangle functor of derived categories. |
| `FrobeniusPair.ofExact` | example | The bounded complexes over an exact category, with the homotopy-acyclic ones. |

**Consumers.**

- K.6, the flasque envelope — The functors F and S are endofunctors of the category of Frobenius pairs; the whole construction lives there.
- K.6, the IK-spectrum — The K-theory space is that of the Waldhausen category attached to a Frobenius pair, inflations as cofibrations and derived isomorphisms as weak equivalences.
- K.7, derived invariance — The correct hypothesis of derived Morita invariance is a map of Frobenius pairs inducing an equivalence of derived categories.

**Unit tests.**

- `split_is_frobenius` (compatibility) — The split exact structure is Frobenius; this is Tau Ceti’s pinned instance and the definition here must agree with it.
- `complexes_are_a_pair` (computation) — The bounded complexes over an exact category form a Frobenius pair.
- `derived_is_bounded_derived` (computation) — Its derived category is the bounded derived category of the exact category.
- `projinj_coincide` (non-example) — Dropping the coincidence of projectives and injectives breaks the triangulation; an exact category with enough projectives only is not a Frobenius category.

**Sources.**

- `Schlichting.NegativeK.2003`: §3.3 to 3.5, pp. 8 to 9. The definitions, verbatim; the ligature and accent damage of the scan has been repaired without changing a word.
- `Schlichting.NegativeK.2003`: §5.3 and Definition 5.4, p. 11. The standing example and the definition it feeds, verbatim.

### The countable flasque envelope and the suspension of a Frobenius pair

`GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs`
- `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`
- `mathlib:CategoryTheory.Idempotents.Karoubi`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `countableEnvelope` | data | The countable envelope of a small exact category. |
| `countableEnvelope_isFlasque` | characterisation | The envelope is flasque, with the shift functor as witness. |
| `FrobeniusPair.enlarge` | data | The endofunctor F of Frobenius pairs. |
| `FrobeniusPair.enlarge_generates` | characterisation | The enlarged derived category is c-compactly generated by the original. |
| `FrobeniusPair.suspension` | data | The suspension endofunctor S. |
| `FrobeniusPair.setup` | compatibility | The identity, F and S satisfy the three conditions of the model set-up. |

**Consumers.**

- K.6, the negative groups of a model — The groups are defined as the zeroth group of an iterated suspension.
- K.6, the IK-spectrum — The structure maps of the spectrum come from the square built out of the enlargement and the suspension.
- K.6, the axioms — The vanishing of the zeroth group on an enlargement is the flasqueness axiom, here proved rather than assumed.

**Unit tests.**

- `envelope_flasque` (computation) — The countable envelope is flasque.
- `IK0_of_enlargement_vanishes` (computation) — The zeroth group of an enlarged pair is zero.
- `suspension_derived` (computation) — The derived category of the suspension is the quotient of the enlarged derived category by the original.
- `not_sheaf_flasque` (non-example) — Flasque here is the swindle condition on a functor, not the sheaf-theoretic predicate of the pinned libraries.

**Sources.**

- `Schlichting.NegativeK.2003`: Lemma 4.2, p. 9. The flasqueness of the envelope with its proof, verbatim.
- `Schlichting.NegativeK.2003`: §4.1, Definition 4.3, Proposition 4.4 and Definition 4.7, pp. 9 to 10. The envelope, the functor F, its properties and the suspension, verbatim.
- `Schlichting.NegativeK.2003`: Theorem 4.8, p. 10. The verification that the flasque route satisfies the axioms, verbatim.

### The set-up: negative K-groups of a triangulated category with models

`GeneralAlgebraicKTheory:K.6/schlichting-set-up` · definition · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`
- `mathlib:CategoryTheory.Idempotents.Karoubi`
- `GeneralAlgebraicKTheory:K.6/dense-triangulated-class-criterion`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IsExactSequence` | structure | An exact sequence of small triangulated categories, with the cofinality condition. |
| `IK0` | data | The zeroth invariant, the K-group of the idempotent completion. |
| `NegativeKSetup` | structure | A category of models with F, S and the three conditions. |
| `negativeIK` | data | The negative groups of a model. |
| `negativeIK_frobenius` | example | The instance at Frobenius pairs. |
| `IK0_eq_K0_of_idempotentComplete` | compatibility | For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group. |

**Consumers.**

- K.6, the localisation theorem — The long exact sequence is a statement about these groups and uses only the three conditions.
- K.6, agreement — The comparison with Bass’s groups is a statement about this definition.
- K.7 — The filtered-colimit statement in non-positive degrees is proved at this level of generality.

**Unit tests.**

- `idempotent_complete_case` (computation) — For an idempotent complete exact category the zeroth invariant is the usual zeroth K-group.
- `frobenius_instance` (computation) — Frobenius pairs with the envelope and the suspension satisfy the set-up.
- `quasi_iso_invariance` (computation) — A quasi-isomorphism of differential graded algebras induces isomorphisms of all the groups.
- `cofinal_not_equivalence` (non-example) — The third functor of an exact sequence is required to be cofinal, not an equivalence; requiring an equivalence would exclude the intended examples.

**Sources.**

- `Schlichting.NegativeK.2003`: Definition 1.1, Facts 1.2, Set-up 1.3 and Definition 1.4, pp. 4 to 5. The set-up and the definition, verbatim.
- `Schlichting.NegativeK.2003`: §5.5, p. 11. The degree-zero identification, verbatim.

### Localisation in negative degrees, and the first negative group as an obstruction

`GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/schlichting-set-up`
- `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`

**Sources.**

- `Schlichting.NegativeK.2003`: Lemma 1.6, Theorem 1.7, Corollary 1.8 and Remark 1.9, pp. 5 to 6. The localisation theorem with its corollary and the obstruction remark, verbatim.
- `Schlichting.NegativeK.2003`: §5.5, p. 11. The instance for exact categories and the localisation example, verbatim.

### Additivity and filtered colimits for the negative groups

`GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`

**Sources.**

- `Schlichting.NegativeK.2003`: Theorem 6.1, Corollary 6.2, Lemma 6.3 and Corollary 6.4, pp. 13 to 14. Additivity and the colimit statements, verbatim.

### The IK-theory spectrum of a Frobenius pair, and what it computes

`GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

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
5. Use frobenius-completion-spectrum for the completed Ω-spectrum and its stable comparison, including the positive/zero/negative degree distinctions.
6. Apply frobenius-spectrum-localization, whose proof uses saturation, nested-weak fibration, cofinality and exactness of all suspensions.
7. Import frobenius-derived-invariance and frobenius-model-cofinality. Their proofs use the weak-inflation replacement and dual approximation, with the generic nonfunctorial apparatus owned once in early K.4.
8. The negative test is the explicit odd-prime stable Artin pair above; mere reliance on weak equivalences in the construction is no longer offered as a proof of non-invariance.

**Acceptance.**

- The homotopy groups are the Quillen K-groups above degree zero, so the spectrum extends the connective theory rather than replacing it.
- In negative degrees they are the groups defined from the set-up, so the two constructions of the layer agree.
- For an exact category the resulting groups agree with Bass's and Thomason's, which is the next node.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`
- `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`
- `GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance`
- `GeneralAlgebraicKTheory:K.6/frobenius-completion-spectrum`
- `GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization`

**Sources.**

- `Schlichting.NegativeK.2003`: Definitions 11.1 and 11.4, Lemma 11.3, pp. 20 to 21. The construction of the spectrum, verbatim.
- `Schlichting.NegativeK.2003`: Theorem 11.7, p. 21. The computation of the homotopy groups, verbatim.
- `Schlichting.NegativeK.2003`: Theorem 11.10 and §11.13, pp. 21–22. Localisation at the spectrum level and the instance for exact categories, verbatim.
- `Schlichting.NegativeK.2003`: Proposition 11.15, p. 22. The derived-invariance statement, with the bracketed words supplying from the surrounding text what the scan drops.

### Agreement with Bass, Karoubi and Pedersen–Weibel, and the vanishing theorems

`GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

The groups the Frobenius-pair route constructs are the classical ones for rings and additive categories: for a ring R, not necessarily commutative, IK_i(R) is naturally isomorphic to Bass's and Pedersen's K_i(R) for every i ≤ 0, and for an additive category A, IK_i(A) is naturally isomorphic to Karoubi's and Pedersen and Weibel's K_i(A) for every i ≤ 0. The first negative group of an exact category has a presentation: it is the monoid of isomorphism classes of idempotents of the unbounded derived category under direct sum, modulo those that split, so it vanishes exactly when that category is idempotent complete. It vanishes for every small abelian category, and every negative group vanishes for a small noetherian abelian category; the vanishing for a regular ring follows, because the inclusion of the finitely generated projectives into the finitely generated modules is then a derived equivalence and the latter category is abelian. The2003 source states the all-negative vanishing for arbitrary small abelian categories as Conjecture9.7. This is a historical source statement, not a claim that it remains open today; later work of Neeman gives counterexamples (Neeman, arXiv:2006.16536v2, introduction pp1–2: an abelian heart with nonzero K−2). The scheme clauses of the source — agreement with Thomason's K^B_i(X) for a quasi-compact quasi-separated scheme, which the source proves from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b), and the vanishing of negative G-theory of a noetherian scheme — are not part of this node: they need Perf(X), K(X) and G(X), which SchemeKTheoryOperations S.1 and S.2 define after this layer, and they are handed to S.5 and S.2 by request.

**Hypotheses.**

- The ring is arbitrary, not necessarily commutative; the additive category is small.
- Noetherian abelian means every object is noetherian; the proof runs through the categories of objects with an endomorphism and the nilpotent ones.
- The vanishing for a regular ring is deduced, not assumed, and is the theorem of Bass that the stage text names.

**Proof outline.**

1. Apply additive-cone-frobenius-comparison: the quotient-complex lifting, finite-domination idempotent model, restricted Euler-class completion and two approximation maps are separately decomposed. The flasque cone then supplies the boundary identification in each nonpositive degree.
2. For arbitrary associative rings, compose that boundary-compatible additive model comparison with karoubi-bass-contraction-comparison. The earlier model-bridge source gap is discharged by the read CP/Ranicki proofs.
3. Prove the presentation of the first negative group: identify it with the zeroth group of the unbounded derived category by the Eilenberg swindle on bounded-above and bounded-below complexes, then apply the classification of dense subcategories.
4. Prove the vanishing of the first negative group of a small abelian category, and then the vanishing of all of them for a noetherian abelian category by descending induction, using the sequence of the nilpotent endomorphism category, the polynomial category and the Laurent category together with additivity.
5. Deduce the vanishing for a regular ring.
6. Record Conjecture9.7 as the historical2003 statement; do not present general abelian-category vanishing as a current theorem or current open problem. The noetherian theorem and degree−1 theorem retain their separate scopes.
7. Record the handoff: agreement with Thomason's groups of a quasi-compact quasi-separated scheme, and the vanishing of negative G-theory of a noetherian scheme (an instance of the noetherian abelian theorem for Coh(X)), are SchemeKTheoryOperations S.5's and S.2's, which import this node; no node of this packet depends on them.

**Acceptance.**

- For a regular ring the negative K-groups vanish, which reproves Bass's theorem from this construction.
- The first negative group of an exact category vanishes exactly when its unbounded derived category is idempotent complete.
- The vanishing for a general small abelian category is a conjecture of the source and is recorded as one, not as a theorem.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`
- `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/vanishing-for-regular-noetherian-rings`
- `GeneralAlgebraicKTheory:K.6/karoubi-bass-contraction-comparison`
- `GeneralAlgebraicKTheory:K.6/additive-cone-frobenius-comparison`

**Sources.**

- `Schlichting.NegativeK.2003`: Theorem 7.1, the ring and additive-category clauses, pp. 14 to 15. The ring and additive-category clauses, verbatim; the scheme clause between them (Thomason's groups of a quasi-compact quasi-separated scheme) is SchemeKTheoryOperations S.5's and is elided here.
- `Schlichting.NegativeK.2003`: Proof of Theorem 7.1, the ring case, p. 15. The ring case is deduced from the additive-category case and Karoubi's comparison, verbatim.
- `Schlichting.NegativeK.2003`: Remark 7.2, p. 15. The alternative route through the noncommutative projective line, verbatim.
- `Schlichting.NegativeK.2003`: Lemma 8.1 and Corollary 8.2, p. 15. The presentation of the first negative group, verbatim.
- `Schlichting.NegativeK.2003`: §9, Examples 9.5 and 9.6, Conjecture 9.7 and Remark 9.8, pp. 16 to 17. The vanishing theorems, the regular case and the conjecture, verbatim.

### The two-chart Koszul sequence

`GeneralAlgebraicKTheory:K.6/projective-line-koszul` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For every gluing module F and integer n, 0→F(n−2)→F(n−1)²→F(n)→0 is exact, with maps (X₁,−X₀) and (X₀,X₁). It is a conflation of vector bundles when F is a vector bundle, and is natural in F.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. On the plus chart the maps are (t,−1) and (1,t); on the minus chart they are (1,−s) and (s,1), where s=t⁻¹. Each sequence is split exact: the second map has a component equal to identity, and its kernel is the displayed first map.
2. Centrality of t and the gluing square identify these chart sequences. Componentwise exactness in the abelian gluing category proves exactness; projectivity of the chart components gives the vector-bundle conflation.

**Acceptance.**

- The signs give (1,t)(t,−1)=0 on the plus chart. This is valid over a noncommutative ring.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`

**Sources.**

- `Quillen.HigherI.1973`: §8.3, printed p.135/PDF59, displayed sequence after Theorem3.1. Read text and image. This is Quillen’s explicitly written two-chart sequence, with the packet’s right-module convention.

### Eventual regularity and projectivity of sections

`GeneralAlgebraicKTheory:K.6/projective-line-eventual-regularity` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For every vector bundle F in the ring gluing category there is n₀ such that for all n≥n₀ and every left R-module N, H¹(F(n)⊗_R N)=0 and H⁰(F(n))⊗_R N≅H⁰(F(n)⊗_R N). Moreover H⁰(F(n)) is a finitely generated projective right R-module.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. Choose finite generators on both charts. Clearing the finitely many powers of the central t in their gluing expressions gives a componentwise surjection L=u_a(R)^m→F for some a,m. Its kernel F′ is a vector bundle because the target is projective on each chart. The same construction applies to F′. This is the elementary two-chart version of §8.1 Lemma1.1(d).
2. The chart sequences split and remain exact after tensoring any left R-module N. The Čech complex has degrees0,1 only. Since H¹(L(n)⊗N)=0 for n large (the monomial calculation for u_a), the long exact sequence gives H¹(F(n)⊗N)=0. Applying the same argument to F′ gives its eventual vanishing.
3. Apply H⁰ to F′(n)→L(n)→F(n). Tensor its right-exact row by N and compare with the H⁰ row after tensoring. The monomial base-change isomorphism for L makes the map for F surjective; first doing this for F′ makes that map an isomorphism for sufficiently large n.
4. Tensoring F(n) by N is exact on both charts, and all resulting H¹ groups vanish in this range, so H⁰(F(n)⊗N) is exact in N. Base change therefore makes H⁰(F(n)) flat. The finite free presentations coming from L and a presentation for F′ show that H⁰(F(n)) is finitely presented. Flat and finitely presented implies projective.

**Acceptance.**

- For u_i(R), H⁰(u_i(R)(n)) has basis of n−i+1 monomials when n≥i; H¹ vanishes in this range.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`

**Sources.**

- `Quillen.HigherI.1973`: §8.1 Lemma1.1(d), printed p.130/PDF54; Lemma1.12 with proof, p.133/PDF57; §8.3 p.135/PDF59. The packet spells out the central-variable chart adaptation of Quillen’s proof, including arbitrary-module tensoring, finite presentation and flatness. Quillen leaves the noncommutative adaptation checks to the reader.

### Regularity and global generation on the two charts

`GeneralAlgebraicKTheory:K.6/projective-line-regularity-lemmas` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Call F regular when H¹(F(−1))=0. If F is regular, H¹(F(k))=0 for all k≥−1 and evaluation u_0(H⁰F)→F is onto. H⁰ is exact on regular vector-bundle conflations; for a regular vector bundle F, H⁰(F(k)) is finitely generated projective for every k≥−1.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. Apply the Koszul sequence to F(k), starting at k=0: H¹(F(k−1))²→H¹(F(k))→H²(F(k−2))=0. Induct from H¹(F(−1))=0.
2. For k≥1, the H⁰ sequence of 0→F(k−2)→F(k−1)²→F(k)→0 makes multiplication by X₀,X₁ onto, because H¹(F(k−2))=0. Thus H⁰(F(k)) is generated in degree0. Localizing these section maps on each chart, and using the eventual finite-generation presentation, proves evaluation onto.
3. On a conflation of regular bundles the H¹ of the first term vanishes, so H⁰ gives a short exact sequence. All positive twists stay regular.
4. For k≥−1, the same Koszul sequence in the form 0→F(k)→F(k+1)²→F(k+2)→0 gives a short exact H⁰ sequence. Its two terms on the right are finitely generated projective for k large by eventual-regularity. Descending induction, splitting the surjection onto the last projective term, proves finite projectivity for every k≥−1.

**Acceptance.**

- u_0(P)=O⊗P is regular; u_1(P)=O(−1)⊗P is not regular for nonzero projective P, since H¹(u_1(P)(−1))≅P.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-koszul`
- `GeneralAlgebraicKTheory:K.6/projective-line-eventual-regularity`

**Sources.**

- `Quillen.HigherI.1973`: §8.1 Lemmas1.2,1.3,1.7, printed p.131/PDF55; Lemma1.13 p.133/PDF57; §8.3 p.135/PDF59. Read the proofs. In rank2 they reduce to the displayed two-chart Koszul sequence and its Čech long exact sequence.

### The canonical resolution of a regular gluing bundle

`GeneralAlgebraicKTheory:K.6/projective-line-canonical-resolution` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let MR be the exact subcategory of regular vector bundles. Define T₀F=H⁰F, Z₀F=ker(u_0(T₀F)→F), and T₁F=H⁰(Z₀F(1)). These are exact functors T₀,T₁:MR→P(Rᵐᵒᵖ), and evaluation gives a natural conflation 0→u_1(T₁F)→u_0(T₀F)→F→0 in VB(P¹_R). The first term need not lie in MR.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. Global generation makes the evaluation onto; finite projectivity of T₀ makes its source a vector bundle, hence the chart-split kernel Z₀ is a vector bundle. Since evaluation induces identity on H⁰, its Čech sequence gives H⁰(Z₀)=0 and H¹(Z₀)=0. Thus Z₀(1) is regular.
2. T₁=H⁰(Z₀(1)) is finitely generated projective. Evaluation on Z₀(1), twisted back by −1, gives an epimorphism u_1(T₁)→Z₀. Let W be its vector-bundle kernel.
3. The twisted evaluation induces an isomorphism on H⁰, so H⁰(W(1))=0. In the untwisted sequence H⁰(Z₀)=H⁰(u_1T₁)=H¹(u_1T₁)=0, so H¹(W)=0. Therefore W(1) is regular; its global generation and zero H⁰ force W(1)=0. This proves u_1(T₁)≅Z₀.
4. T₀ is exact on MR. The kernel diagram of the evaluation maps and the snake lemma show that Z₀ is exact on regular conflations. Its twist by1 takes values in MR; exactness of H⁰ there proves exactness of T₁. All constructions commute with morphisms of regular bundles.

**Acceptance.**

- For F=u_0(P), (T₀,T₁)=(P,0). For F=u_{−1}(P)=O(1)⊗P, (T₀,T₁)=(P²,P). The resolution is a VB conflation, without the false claim u_1(P)∈MR.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-regularity-lemmas`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `P1.T0` | data | H⁰ on MR, as a finite projective right module. |
| `P1.Z0` | data | The kernel of evaluation. |
| `P1.T1` | data | H⁰(Z₀(1)), as a finite projective right module. |
| `P1.canonicalResolution` | constructor | The specified three-term conflation in VB. |
| `P1.canonicalResolution_natural` | functoriality | Bundle morphisms induce commuting maps of the resolution. |
| `P1.T0_T1_exact` | characterisation | Both coefficient functors preserve conflations of MR. |

**Consumers.**

- K.6/projective-line-splitting and t-torsion-localisation-sequences — Provides the explicit ring-level resolution or localization input, before the scheme consumers.

**Unit tests.**

- `p1_resolution_trivial` (degenerate) — For F=u_0(0), both coefficient modules and all resolution terms are zero.
- `p1_resolution_O` (computation) — For u_0(P), T₀=P and T₁=0.
- `p1_resolution_O1` (computation) — For u_{−1}(P), T₀=P² and T₁=P.
- `p1_resolution_not_MR` (non-example) — For nonzero P, the first term u_1(P) of the O(1) resolution is not regular.

**Sources.**

- `Quillen.HigherI.1973`: §8.1 construction1.9–1.11, printed p.132/PDF56; Lemma1.14 p.134/PDF58; §8.3 p.135/PDF59. Rank2 adaptation is expanded explicitly; the coefficient projectivity and exactness are checked rather than hidden inside ExerciseV.1.3.

### The regular filtration gives a K-equivalence

`GeneralAlgebraicKTheory:K.6/projective-line-regular-filtration` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For MR(n)={F | F(−n) is regular}, the inclusions MR(n)→MR(n−1) and MR→VB(P¹_R) induce K-equivalences.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. By regularity, MR(n)⊂MR(n−1); each is extension-closed. Eventual regularity makes their union, as n decreases without bound, equal to VB.
2. Twists by1 and2 give exact functors MR(n−1)→MR(n). The Koszul conflation 0→F→F(1)²→F(2)→0 yields, by exact-category additivity, the alternating map 2·twist1−twist2. Composing with inclusion in either order is homotopic to identity, on the appropriate regular category. Thus each adjacent inclusion is a K-equivalence.
3. Filtered continuity of K for small exact categories identifies K(VB) with the homotopy colimit of these equivalent K-spaces. In particular K(MR)→K(VB) is a K-equivalence.

**Acceptance.**

- This transports H⁰-based maps from MR to K(VB); it does not extend H⁰ to an exact functor on all vector bundles.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-regularity-lemmas`
- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`
- `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`

**Sources.**

- `Quillen.HigherI.1973`: §8.2 Lemma2.2 with proof, printed p.134/PDF58; §8.3 p.135/PDF59. The adjacent inclusion inverse is specified in the packet’s MR(n) convention, which is the negative of Quillen’s indexing.

### The resolution diagram for chart localization

`GeneralAlgebraicKTheory:K.6/projective-line-localisation-models` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let H₁ be the gluing modules with a length-one VB resolution and H₁,t those whose minus chart is zero. Let P be the split exact category of minus-chart projectives that extend from VB. Define F=QVB×_{QP}E(P), where E(P) is the exact-sequence category with target in QP. Define G with objects K↣V↠M⊕Q, where K,V,Q∈VB and M∈H₁,t, with the admissible span diagrams of V.7.3. The maps h:G→QH₁,t and f:G→F send this data respectively to M and (Q,j*K↣j*V↠j*Q). T=isoVB acts by adding a bundle to K and V, and the maps are equivariant.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. Chart kernels/cokernels identify H₁,t with H₁,T(R[t]). The forward functor sends M to (M,0); conversely a VB resolution of (M,0) gives a length-one projective resolution on the plus chart. The existing Nil equivalence and its characteristic resolution give the inverse embedding and its naturality.
2. VB is resolving in H₁: it is extension-closed; a kernel of a VB epimorphism to an H₁ object has projective components by Schanuel’s argument on each chart; every H₁ object has a VB resolution by definition. Thus the resolution theorem gives K(VB)≃K(H₁).
3. The category P contains free minus-chart modules and is cofinal in all finitely generated projectives, but j* is not claimed essentially surjective. All exact sequences in P split. Use the actual extension category and cartesian lift construction of K.2:plus for F.
4. Apply j* to K↣V↠M⊕Q: j*M=0, so the resulting quotient is j*Q, not j*M. This is the corrected map f, and addition of a bundle acts on its kernel and middle term. The span description and base changes follow the same pullback/pushout formulas as V.7.3 and Ex.7.1.

**Acceptance.**

- For M=(P_ν,0), the resolution u_1(P)↣u_0(P) realizes an object of H₁. Chart restriction is identity on this torsion model.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-over-a-ring`
- `GeneralAlgebraicKTheory:K.6/nil-category-and-nil-groups`
- `GeneralAlgebraicKTheory:K.3/resolution-theorem`
- `GeneralAlgebraicKTheory:K.2:plus/extension-cartesian-lifts`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `P1.localisationModels` | constructor | The equivariant diagram QH₁,t←G→F over QVB→QP. |
| `P1.localisationModels_h` | projection | h sends a resolution to its torsion quotient M. |
| `P1.localisationModels_f` | projection | f remembers Q and the split extension with quotient j*Q. |
| `P1.localisationModels_action` | structure | isoVB adds to kernel and middle object, equivariantly. |
| `P1.torsionChartEquiv` | equivalence | H₁,t≃H₁,T(R[t]), retaining the exact structures. |

**Consumers.**

- K.6/projective-line-splitting and t-torsion-localisation-sequences — Provides the explicit ring-level resolution or localization input, before the scheme consumers.

**Unit tests.**

- `p1_torsion_zero` (degenerate) — The zero gluing module corresponds to the zero torsion module.
- `p1_torsion_nil_resolution` (computation) — For ν=0 on P, the chart pair (t,1) gives u_1(P)↣u_0(P) with quotient (P,0).
- `p1_chart_not_essentially_surjective` (non-example) — Cofinality via free summands is sufficient; the construction does not assert that every chart projective extends individually.

**Sources.**

- `Kbook.V.chapter`: V.7.2–7.3, pp.52–53/PDF52–53; V.7.8 pp.57–58/PDF57–58; Ex.V.7.5 p.59/PDF59. Read the direct proof and exercises. This is its central two-chart adaptation, without use of a scheme or a downstream S.3 theorem.

### Contractibility of the resolution fibres

`GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For M∈H₁,t, the category G_M of VB epimorphisms V↠M with admissible monomorphisms over M is contractible. The Segal subdivision identifies it with the fibre of h up to nerve equivalence; consequently h and T⁻¹h are homotopy equivalences.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. Choose a VB resolution V₀↠M. On G_M use the functor V↠M ↦ V⊕V₀↠M with quotient map q+q₀. The two summand inclusions give natural transformations id→(−⊕V₀)←constant(V₀). Both are admissible monomorphisms with vector-bundle quotients. This contracts the nerve.
2. The Segal subdivision sends an admissible monomorphism of presentations to its quotient-plus-M diagram, giving the fibre equivalence described in Ex.V.7.2. The cartesian base changes of h and TheoremA give h a nerve equivalence.
3. T acts trivially on the h target. Equivariance and the fibre contraction make this action invertible on the source at nerve level; the monoidal localization equivalence of the H.4 request gives G→T⁻¹G a nerve equivalence as well.

**Acceptance.**

- The sum contraction uses arrows in G_M. The pullback projections V×_M V₀→V,V₀ are generally epimorphisms and cannot replace those monomorphisms.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-localisation-models`
- `StableHomotopyKTheory:H.1`
- `StableHomotopyKTheory:H.4`

**Sources.**

- `Kbook.V.chapter`: V.7.3.1, pp.53–54/PDF53–54; V.7.8 pp.57–58. The source’s pullback projection contraction does not lie in the stated monomorphism category. The packet supplies the sum contraction and records the discrepancy separately.

### Directed projective lattices for the chart extension

`GeneralAlgebraicKTheory:K.6/projective-line-directed-lattices` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For a split extension A₋↣V₋↠Q₋ in P, the poset of vector-bundle lattices V⊂j_*V₋ with j*V=V₋ and image equal to a fixed vector bundle Q is nonempty and directed. It is the comma model needed for f’s fibre over Q.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. Choose vector-bundle extensions of A₋ and Q₋ and a splitting V₋≅A₋⊕Q₋. In the common Laurent module, their plus-chart lattices define a vector-bundle lattice whose projection onto Q is onto. Its minus chart is the given extension. This proves nonemptiness without claiming arbitrary chart projectives extend.
2. Write I=u_1(R)↣u_0(R) using X₁=(t,1). On the plus chart, I⁻ⁿK enlarges the kernel lattice K by t⁻ⁿ; on the minus chart it leaves the same submodule. For two lattices V,V′ over Q, choose n clearing the finitely many Laurent denominators of their plus-chart generators relative to K=ker(V→Q). Then V″=V+I⁻ⁿK contains both lattices.
3. The sequence K↣V↠Q splits on each chart because Q’s chart modules are projective. Thus V″ has projective finitely generated components (on the plus chart it is t⁻ⁿK₊⊕Q₊ after a splitting; on the minus chart it is V₋), and is again a VB lattice with quotient Q. This establishes directedness.
4. The comma-category morphisms reduce to inclusion of these lattices after fixing their chart identification. Its nerve is contractible by the filtered-poset contract. This is the only denominator argument used in the chart adaptation of V.7.3.2.

**Acceptance.**

- Central t is essential for these lattice enlargements and their chart gluing. No smoothness, scheme normalization or commutativity of R is used.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-localisation-models`
- `StableHomotopyKTheory:H.1`

**Sources.**

- `Kbook.V.chapter`: V.7.3.2 p.54/PDF54; Lemma7.8.1 and proof of7.6.1 pp.57–58/PDF57–58. The source explains the replacement s⁻¹K→I⁻ⁿK. Here its two-chart module construction and projectivity are explicit.

### Identify the two chart-localization maps

`GeneralAlgebraicKTheory:K.6/projective-line-localisation-comparison` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

The maps T⁻¹h:T⁻¹G→QH₁,t and T⁻¹f:T⁻¹G→T⁻¹F are nerve equivalences. The induced fibre map QH₁,t→QVB agrees, up to additive inverse, with the canonical inclusion into QH₁ and the resolution equivalence. Hence K(H₁,t)→K(VB)→K(P) is a homotopy fibration.

**Hypotheses.**

- R is an arbitrary unital associative ring; right modules and a central polynomial variable t are used. Quillen’s left-module calculation is applied to Rᵐᵒᵖ, and u_i is his h_{−i}. No commutative scheme theorem is imported.

**Proof outline.**

1. For f, subdivision of presentations over Q reduces its fibre map to the extension functor. TheoremA and directed-lattices contract its comma categories. Cartesian base changes and TheoremB give a global nerve equivalence; equivariant monoidal localization preserves it.
2. The extension functor’s target lies in the split exact P. The localized total extension category is contractible, using the cofinal isoVB action and the H.4 contract specified in requests. The same cartesian-extension square as K.2:plus/localised-extension-fibration then gives T⁻¹F→QVB→QP a homotopy fibration.
3. Compare the maps of G to QH₁: one sends the resolution to M and one to Q. Additivity says their sum is the quotient M⊕Q. This quotient functor maps to the middle V; the natural Q arrows 0↣V and M⊕Q→V give its null homotopy. Therefore the M and Q maps are additive inverses. This is V.7.4’s sign calculation, using VB↪H₁ resolution.
4. Loop and identify K(VB)≃K(H₁). Composing the fibre equivalence with additive inverse yields the canonical inclusion fibre map. Cofinality K(P)→K(R[s]) identifies the homotopy fibre over zero and all positive-degree groups, while retaining the possible degree-zero cokernel of chart restriction.

**Acceptance.**

- The fibre inclusion has the canonical sign after the additive inverse correction. The proof never concludes surjectivity of K₀(VB)→K₀(R[s]) from cofinality.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/projective-line-resolution-fibres`
- `GeneralAlgebraicKTheory:K.6/projective-line-directed-lattices`
- `GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibration`
- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`
- `GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction`
- `StableHomotopyKTheory:H.4`

**Sources.**

- `Kbook.V.chapter`: V.7.2.1 pp.52–53, Lemmas7.3.1–7.4 pp.53–55, V.7.8 pp.57–58, Ex.7.5 p.59 (same PDF pages). Formal gluing-category adaptation of the read direct proof, with split chart extensions and the explicit directed-lattice lemma supplying its hypotheses.

### Existential factorization in a Frobenius pair

`GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

The Waldhausen category of a Frobenius pair has the factorization property of K.4:construction/waldhausen-factorization. This holds in its opposite too and requires no functorial choice of injectives.

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Proof outline.**

1. For f:A→B choose an inflation i:A↣I into a projective-injective. The graph (f,i):A→B⊕I is an inflation: compose i with the split graph inflation I→B⊕I after extending f:A→B when B is injective, or, in general, use the pushout of i along f and the exact-category graph lemma. The latter shows (f,i) is an inflation without requiring B injective.
2. The projection pr_B:B⊕I→B is an isomorphism in the stable category, since I is projective-injective, hence in the Verdier quotient. Its composite with (f,i) is f.
3. For the opposite choose a deflation P↠B from a projective-injective; the dual graph gives the required factorization. The opposite S-construction reverses filtrations and interchanges admissible subobjects and quotients, giving the natural K(Aᵒᵖ)≃K(A) comparison.

**Acceptance.**

- The projection has domain B⊕I; the printed A⊕I in Remark11.2 is corrected in the source issue.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs`
- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization`

**Sources.**

- `Schlichting.NegativeK.2003`: Remark11.2, p.20/PDF20; AppendixA.5, p.25. Read text and p.20 image. Factorization is existential, and the early K.4 apparatus is imported rather than recreated.

### Stable classes modulo a dense triangulated subcategory

`GeneralAlgebraicKTheory:K.6/dense-triangulated-stable-classes` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For an essentially small triangulated category T and strictly full dense triangulated A⊂T, define X∼Y when X⊕A₁≅Y⊕A₂ for A₁,A₂∈A. The quotient is an abelian group G_A under ⊕, with Euler relations; X∈A iff its quotient class is zero, and G_A≅K₀(T)/im K₀(A).

**Hypotheses.**

- Density means each X is a direct summand of an object of A. Both categories have triangulated structures and A is strictly full.

**Proof outline.**

1. Reflexivity uses zero, symmetry swaps the isomorphism, and transitivity adds the two A-summands. Direct sum respects this relation. A complement X′ with X⊕X′∈A provides an additive inverse in the quotient.
2. If X⊕A₁≅A₂, the split triangle A₁→X⊕A₁→X shows X∈A by two-out-of-three. The converse uses X itself as an A-summand.
3. For a triangle X→Y→Z choose complements X′,Z′ with X⊕X′,Z⊕Z′ in A. Add the two split triangles for those complements. The enlarged middle object Y⊕X′⊕Z′ is in A, proving [Y]=[X]+[Z] in G_A.
4. The universal Euler-relation map K₀(T)→G_A is onto. Every K₀ class is represented by an object, since [ΣX]=−[X]; its kernel consists exactly of classes of A-objects by the zero-class criterion. This proves the claimed quotient isomorphism.

**Acceptance.**

- The construction uses stable addition by A-objects, not ordinary isomorphism classes alone.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs`
- `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `DenseClasses` | constructor | Stable direct-sum quotient of T by A. |
| `DenseClasses.zero_iff` | characterisation | class(X)=0 iff X∈A. |
| `DenseClasses.euler` | compatibility | A distinguished triangle gives class(Y)=class(X)+class(Z). |
| `DenseClasses.quotientEquiv` | compatibility | G_A≃K₀(T)/im K₀(A). |

**Consumers.**

- K.6/nonconnective-spectrum-and-derived-invariance — Supplies an explicit comparison or factorization used in the spectrum construction, rather than assuming a functorial cylinder.

**Unit tests.**

- `all_objects` (computation) — If A=T the quotient is zero.
- `euler_parity` (computation) — For bounded complexes of finite-dimensional k-spaces, A={Euler characteristic even}; G_A≅ℤ/2 and k[0] has nonzero class.
- `stable_zero_not_ordinary_zero` (non-example) — A nonzero A-object has zero quotient class, so ordinary object isomorphism classes are the wrong quotient.

**Sources.**

- `Thomason.Classification.1997`: Lemma2.2, pp.5–6/PDF5–6. Read the full proof, and §1.6 for representation of every K₀ class by an object. Symbols damaged in the text layer are reconstructed from the Euler relations.

### The K-zero criterion for a dense triangulated subcategory

`GeneralAlgebraicKTheory:K.6/dense-triangulated-class-criterion` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For a strictly full dense triangulated A⊂T, X∈A iff [X] lies in im K₀(A)→K₀(T). Dense subcategories correspond to subgroups of K₀(T), and K₀(A)→K₀(T) is injective.

**Hypotheses.**

- T is essentially small; A is strictly full, triangulated and dense.

**Proof outline.**

1. Apply the stable-class quotient and its zero-class criterion to get the membership statement.
2. For a subgroup H⊂K₀(T), the objects with class in H form a strictly full triangulated category A_H. It is dense since X⊕ΣX has class0. Every class is represented by an object, so im K₀(A_H)=H. Membership recovers A from its image.
3. For N=ker(K₀(A)→K₀(T)), the dense subcategories of A corresponding to0 and N remain dense in T. Their images in K₀(T) are both0, so the classification identifies them. Their images in K₀(A) must then agree, giving N=0.

**Acceptance.**

- Even Euler characteristic is a dense but non-thick subcategory; the criterion does not assert closure under every direct summand.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/dense-triangulated-stable-classes`

**Sources.**

- `Thomason.Classification.1997`: Theorem2.1 and Corollary2.3, pp.5–6/PDF5–6. Read both proofs in full; the injected K₀ subgroup is the actual one used in cofinality.

### The weak inflation replacement of an exact functor

`GeneralAlgebraicKTheory:K.6/frobenius-replacement-category` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For F:A→B inducing a derived equivalence, form C_F with objects (a,i:F(a)↣b), and componentwise maps commuting with i. Conflations are evaluated at a,b and b/F(a). Its full subcategory C of weak inflations is Frobenius; with C₀=C_{F₀} it is a Frobenius pair. The embedding a↦(a,id) and projection (a,i,b)↦a are inverse K-equivalences.

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Proof outline.**

1. The cokernel functor identifies C_F with admissible short exact sequences whose first object comes from F. The exact-category 3×3 and pullback/pushout lemmas prove the specified pointwise conflations form an exact structure.
2. Enough projectives and injectives in A,B, and preservation by F, provide pointwise resolutions in C_F. Its projective-injectives are exactly the objects with a and b projective-injective.
3. Saturate the pairs first. Cone-zero inflations form an extension-, kernel-of-deflation- and cokernel-of-inflation-closed full subcategory containing those projective-injectives, hence a Frobenius category C. The subcategory C₀ consists of a∈A₀ and b∈B₀ and inherits the same condition.
4. The retraction onto a is literal on a↦(a,id); in the other direction (id,i):(a,id)→(a,i,b) is a natural pointwise weak equivalence. Objectwise natural weak equivalences induce homotopies on the wS construction.

**Acceptance.**

- The weak-inflation condition is essential; arbitrary inflations do not give the stated retraction homotopy.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs`
- `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`
- `GeneralAlgebraicKTheory:K.3/three-by-three-lemma`
- `StableHomotopyKTheory:H.1`
- `StableHomotopyKTheory:H.2`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `FrobeniusReplacement` | constructor | Objects (a,i:F(a)↣b) with i weak. |
| `FrobeniusReplacement.exactStructure` | structure | Conflations on a,b,coker(i). |
| `FrobeniusReplacement.toSource` | functoriality | Projection to a. |
| `FrobeniusReplacement.toTarget` | functoriality | Projection to b. |
| `FrobeniusReplacement.sourceKEquiv` | compatibility | The source embedding and retraction induce inverse K-equivalences. |

**Consumers.**

- K.6/nonconnective-spectrum-and-derived-invariance — Supplies an explicit comparison or factorization used in the spectrum construction, rather than assuming a functorial cylinder.

**Unit tests.**

- `identity_embedding` (computation) — For F=id, a↦(a,id) retracts onto a.
- `zero_to_injective` (compatibility) — (0,0↣I) is allowed for projective-injective I and is weakly zero.
- `nonweak_cokernel` (non-example) — For F=id on bounded complexes over k, 0↣k[0] has nonzero derived cokernel and is excluded.

**Sources.**

- `Schlichting.NegativeK.2003`: Proposition11.15 proof, pp.22–23/PDF22–23. Read full proof; C_F and its weak-inflation subcategory are distinguished, including the quotient conflation condition.

### Strictify the roof diagram for dual approximation

`GeneralAlgebraicKTheory:K.6/frobenius-roof-strictification` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

If F induces a derived equivalence, the target projection C→B from the weak-inflation replacement satisfies dual App2: for c=(a,F(a)↣b) and b′→b, there are a deflation c₃↠c in C and a weak map b′→pr_B(c₃) commuting over b. It also reflects weak equivalences.

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Proof outline.**

1. Full faithfulness and essential surjectivity in the Verdier quotients give the roof diagram of11.16: F(a)→b, F(a₂)→b₂, F(a₁)→b₁←b′, with horizontal weak maps and the two vertical source maps. The squares commute in the stable category, hence up to maps through projective-injectives. The required Verdier common-roof rule is a named categorical supplier below.
2. Factor F(a₂)→b₂ into an inflation followed by a weak equivalence. If gf and h differ by a map through a projective-injective I and f is an inflation, extend the map into I across f by injectivity. Subtract the resulting correction from g. Apply this to make the upper square strictly commute.
3. Choose F(a₁)↣I and b′↣J with I,J injective. Add I to b₁ to strictify the lower square, then J to strictify the right square while preserving the lower one. Adding projective-injectives does not change weak-equivalence status.
4. Choose a deflation (P,F(P)↣Q)↠(a₂,F(a₂)↣b₂) from a projective-injective C-object. Replace the bottom object by (a₁⊕P,F(a₁⊕P)↣b₁⊕Q). The lower vertical maps become deflations. Pull back them along the upper maps in C to obtain c₃. The universal property produces b′→b₃, and two-out-of-three makes it weak.
5. A map in C is pointwise weak. If its b-component is weak, its a-component becomes weak because the horizontal inflations are weak and F reflects derived isomorphisms. This proves App1.

**Acceptance.**

- The approximation is for the opposite projection and uses deflations; one cannot switch it silently to a statement with inflations.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-replacement-category`
- `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`
- `StableHomotopyKTheory:H.1`

**Sources.**

- `Schlichting.NegativeK.2003`: Proposition11.15, diagram11.16 and the pullback proof, p.23/PDF23. Read entire proof. The construction is Schlichting’s Frobenius translation; the original TT diagram is separately inspected.
- `TT.HigherK.1990`: 1.9.8.3–1.9.8.4, printed pp.272–274/PDF14–15. Published scan images read. TT treats complicial biWaldhausen categories; its hypotheses are not asserted for arbitrary Frobenius categories.

### Derived invariance through the replacement and approximation

`GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

A map of Frobenius pairs inducing an equivalence of derived categories induces K(A)≃K(B), and hence IK(A)≃IK(B).

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Proof outline.**

1. The source embedding A→C is a K-equivalence by its explicit retraction and natural weak equivalence.
2. Apply K.4/approximation-with-factorizations to (C→B)ᵒᵖ using the strictification lemma, saturation of the derived-isomorphism weak class and existential factorization of both opposite Frobenius pairs. Convert opposite K-theories back by reversing S-filtrations.
3. Every suspension SⁿF is a derived equivalence by the flasque-envelope/suspension construction. Apply the space comparison in every spectrum level; the natural structure squares identify the resulting level maps.

**Acceptance.**

- The hypothesis is an actual map of Frobenius pairs; an abstract equivalence of naked triangulated categories is not substituted.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-roof-strictification`
- `GeneralAlgebraicKTheory:K.4/approximation-with-factorizations`
- `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`

**Sources.**

- `Schlichting.NegativeK.2003`: Proposition11.15, pp.22–23; Theorem4.8, p.10. The read approximation proof is decomposed in the prerequisites; the levelwise suspension step gives the spectrum comparison.

### Cofinality of Frobenius models

`GeneralAlgebraicKTheory:K.6/frobenius-model-cofinality` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

If a map of Frobenius pairs induces a cofinal derived functor, K(A)→K(B) is an isomorphism on positive homotopy groups and an injection on π₀.

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Proof outline.**

1. Let B₁ be the full subcategory of B-objects whose derived images are isomorphic to objects in im D(A). It is Frobenius with the inherited projective-injectives; D(A)→D(B₁,B₀) is an equivalence, so derived invariance identifies K(A) with this K-space.
2. Density and the triangulated class criterion say b∈B₁ exactly when its class in K₀(D(B))/im K₀(D(A)) is zero. For the associated Waldhausen category, the canonical presentation by cofibration relations and derived weak maps identifies its K₀ with K₀(D(B)); triangles are represented by Frobenius conflations after adding projective-injectives.
3. Apply early K.3/cofinality-with-factorizations to that actual quotient class map and the Frobenius factorization property. It gives the discrete fibre quotient, the positive-degree isomorphisms and the π₀ injection.

**Acceptance.**

- Cofinality need not give a surjection on π₀; the missing classes are the displayed quotient.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-derived-invariance`
- `GeneralAlgebraicKTheory:K.6/dense-triangulated-class-criterion`
- `GeneralAlgebraicKTheory:K.3/cofinality-with-factorizations`

**Sources.**

- `Schlichting.NegativeK.2003`: Proposition11.17, pp.23–24; Facts1.2, p.4; AppendixA.4, p.25. Read proof and dense-subcategory input. This spells out the K₀-class criterion used when applying A.4.

### Fibration for nested Frobenius weak classes

`GeneralAlgebraicKTheory:K.6/frobenius-nested-weak-fibration` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For full thick stable-triangulated subcategories D₀⊂D₁⊂stable(B), let B_i consist of objects representing them. Then K(B₁,B₀)→K(B,B₀)→K(B,B₁) is a homotopy-fibre sequence.

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.
- Each D_i is closed under direct factors and contains the zero object.

**Proof outline.**

1. Each B_i is closed under extensions, kernels of deflations and cokernels of inflations and contains the projective-injectives of B. It inherits a Frobenius exact structure.
2. The corresponding weak classes v⊂w are the maps inverted in the two Verdier quotients. They are saturated, satisfy extension/gluing, and have the factorization property: the graph construction has projective-injective quotient error, which both weak classes invert.
3. The w-acyclic objects with the v weak class are exactly (B₁,B₀). Apply K.4/fibration-with-factorizations. K(B,B) is contractible since every wS_n object maps weakly to0. This gives the square11.19 and the asserted fibre.

**Acceptance.**

- This is the same underlying category with nested weak classes; here its K₀ map is surjective. General cofinal functors are treated separately.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`
- `GeneralAlgebraicKTheory:K.4/fibration-with-factorizations`

**Sources.**

- `Schlichting.NegativeK.2003`: Proposition11.18, p.24/PDF24; AppendixA.3, p.25. Read proof. The generic theorem belongs to K.4 and is explicitly imported.

### The completion comparison and the homotopy groups of IK

`GeneralAlgebraicKTheory:K.6/frobenius-completion-spectrum` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let Â=(B,FA₀), where B⊂FA consists of objects zero in D(SA). Then D(Â) is the idempotent completion of D(A). The maps K(Â)≃ΩK(SA) make the completed-level spectrum an Ω-spectrum, and IK(A)→ÎK(A) is a stable equivalence. Thus π_iIK(A)=π_iK(A) for i>0, K₀(D(A)῀) for i=0, and K₀(D(S^{−i}A)῀) for i<0.

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.

**Proof outline.**

1. D(A)→D(FA)→D(SA) is exact and D(FA) is idempotent complete. Its zero kernel contains precisely the completion of the dense image of D(A), so D(A)→D(Â) is the idempotent-completion embedding.
2. Model cofinality gives positive π-isomorphisms and a π₀ injection for K(A)→K(Â). Nested-weak fibration applied in FA has the other two corners K(FA) and K(FA,FA) contractible, giving K(Â)≃ΩK(SA). Looping the cofinality map identifies ΩK(SA) with ΩK(ŜA).
3. These maps, for all iterated suspensions, give an Ω-spectrum ÎK. The level map from IK is an isomorphism on positive π, and the positive-degree definition of stable groups then gives a stable equivalence. Read off π₀ from the completed level and negative groups from its iterated suspension levels.

**Acceptance.**

- The uncompleted IK level need not be an Ω-space equivalence at π₀; ΩIK is an Ω-spectrum.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-model-cofinality`
- `GeneralAlgebraicKTheory:K.6/frobenius-nested-weak-fibration`
- `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`

**Sources.**

- `Schlichting.NegativeK.2003`: Theorem11.7 proof, pp.21–22/PDF21–22. Read proof, with comparison inputs11.17 and11.18 decomposed rather than taken as black boxes.

### Localization of the Frobenius IK spectra in all degrees

`GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization` · theorem · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

An exact sequence of Frobenius pairs A→B→C gives a natural homotopy-fibre sequence IK(A)→IK(B)→IK(C), and a long exact sequence in every integer degree.

**Hypotheses.**

- Small Frobenius pairs; cofibrations are inflations and weak equivalences are the maps inverted in their Verdier derived category. Maps of pairs preserve the exact structures and projective-injectives.
- Exact means D(A)→D(B)→D(C) is exact with the Verdier-quotient functor cofinal.

**Proof outline.**

1. Replace C by its saturation: the subcategory C₀ becomes all objects zero in D(C). The associated Waldhausen category has the same cofibrations and weak maps, hence the same K-space.
2. Let B₁⊂B consist of objects zero in D(C). It inherits the Frobenius structure and projective-injectives of B. The two maps A→(B₁,B₀) and (B,B₁)→C are derived-cofinal; model cofinality makes their looped K-spaces equivalences.
3. Nested-weak fibration makes the square for these two B-pairs homotopy cartesian. Substitute the looped comparisons to obtain the looped K-space square11.12.
4. Suspension preserves exact sequences of pairs. Repeat this comparison at every Sⁿ level. Since ΩIK is an Ω-spectrum by the completion comparison, these cartesian looped-level squares imply the cartesian spectrum square. The stable homotopy fibre supplies the connecting maps in all integer degrees, naturally in exact-sequence maps.

**Acceptance.**

- No unjustified connective-space equivalence at degree zero is used in the cofinality substitutions.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-completion-spectrum`
- `GeneralAlgebraicKTheory:K.6/frobenius-nested-weak-fibration`
- `GeneralAlgebraicKTheory:K.6/frobenius-model-cofinality`
- `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- `Schlichting.NegativeK.2003`: Theorem11.10 proof, p.22/PDF22, and saturation qualification. Read full proof. Saturation is needed to obtain the quotient-to-C map of pairs, and does not change its Waldhausen K-theory.

### The nonunital extension of the Bass spectrum

`GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre` · construction · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

For A define K^B_nu(A)=fib(K^B(ℤ⋉A)→K^B(ℤ)) using the canonical augmentation. This is functorial for nonunital homomorphisms. When A is unital, (z,a)↦(z,z·1_A+a) identifies ℤ⋉A with ℤ×A as augmented unital rings and gives a natural equivalence K^B_nu(A)≃K^B(A) for unital maps.

**Hypotheses.**

- Associative nonunital rings and nonunital ring homomorphisms; ordinary K^B on unital rings is the existing Bass nonconnective spectrum.

**Proof outline.**

1. Reuse K.5’s unitization with product (z,a)(w,b)=(zw,zb+wa+ab). Its augmentation is a unital map toℤ; a nonunital h induces the unital augmentation-preserving map (z,a)↦(z,h(a)). Apply the existing functor K^B and take its homotopy fibre.
2. For unital A the displayed product-ring isomorphism has inverse (z,c)↦(z,c−z1_A). Verify multiplication and augmentation. Finite-product compatibility identifies K^B(ℤ⋉A) with K^B(ℤ)×K^B(A); the augmentation is projection, so its fibre is K^B(A).
3. This comparison is natural for unital maps. For a nonunital h:A→B the product-ring coordinate map instead is (z,c)↦(z,h(c)+z(1_B−h(1_A))). Its extra summand must be retained; the next node calculates the induced fibre map.

**Acceptance.**

- This definition uses nonconnective fibres. It is not a claim that every connective excision map is an equivalence.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`
- `GeneralAlgebraicKTheory:K.5/relative-K-theory`
- `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`
- `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `StableHomotopyKTheory:H.5:spectra`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `NonunitalBass` | constructor | The fibre of K^B of the unitization augmentation. |
| `NonunitalBass.map` | functoriality | A nonunital ring map induces the fibre map. |
| `NonunitalBass.unitalEquiv` | equivalence | For unital A, K^B_nu(A)≃K^B(A). |

**Consumers.**

- K.7/invariance-under-filtered-colimits-and-products; K.6/agreement-and-vanishing-of-negative-K — Extends continuity to the actual nonunital matrix diagram and verifies the map in the stabilization axiom.

**Unit tests.**

- `zero_ring` (computation) — A=0 gives fib(id:K^B(ℤ)→K^B(ℤ)), hence zero spectrum.
- `unital_integer_ring` (compatibility) — For A=ℤ the unitization is ℤ×ℤ and the fibre is the second K^B(ℤ).
- `corner_not_product_map` (non-example) — For the corner ℤ→M₂(ℤ), the second component sends (z,c) to diag(c,z), not diag(c,0); ignoring z breaks unitality.

**Sources.**

- `Kbook.2013`: IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps. The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the worker’s derivation supplying the missing adapter; they are not attributed to an unread source proof.

### Identify a nonunital fibre map between unital rings

`GeneralAlgebraicKTheory:K.7/nonunital-map-idempotent-extension` · lemma · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

For a possibly nonunital homomorphism h:A→B between unital rings, put e=h(1_A). Under K^B_nu(A)≃K^B(A) and K^B_nu(B)≃K^B(B), its map is induced by the exact functor P(A)→P(B), P↦P⊗_A eB for right modules. This functor preserves finite projectives.

**Hypotheses.**

- h preserves multiplication and addition; e²=e and h(a)e=eh(a)=h(a). The left A-action on eB is unital.

**Proof outline.**

1. The right ideal eB is a direct summand of the free right B-module B, and a finite projective P is a summand of A^m. Tensor therefore makes P⊗_A eB a summand of (eB)^m; split exact sequences are preserved.
2. Under the product-ring coordinates, the unitized map acts on the B component through the orthogonal idempotents e and1−e. Extension of scalars on a projective pair (U,P) over ℤ×A yields the pair (U, (U⊗_ℤ(1−e)B)⊕(P⊗_A eB)) over ℤ×B. Check the map on each summand using its identity idempotent.
3. The fibre inclusion is represented by P↦(0,P). The displayed extension sends it to (0,P⊗_A eB), proving the claimed map in connective K-theory. The polynomial and Laurent versions carry the same idempotent and tensor decomposition; their naturality passes through the Bass construction to all degrees.

**Acceptance.**

- For h unital, e=1 and this reduces to ordinary extension of scalars; for h=0, e=0 and the fibre map is zero.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre`
- `GeneralAlgebraicKTheory:K.7/morita-invariance`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`

**Sources.**

- `Kbook.2013`: IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps. The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the worker’s derivation supplying the missing adapter; they are not attributed to an unread source proof.

### Corner embeddings become identity under matrix Morita

`GeneralAlgebraicKTheory:K.7/matrix-corner-morita-naturality` · lemma · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

Let n≥1, A_n=M_n(R), and h_n:A_n→A_{n+1} the upper-left corner map. The standard right-module Morita functors Φ_n(P)=P⊗_{A_n}R^n identify K^B_nu(h_n) with id on K^B(R), coherently under iterated corner embeddings.

**Hypotheses.**

- R is any unital associative ring; R^n is the column (M_n(R),R)-bimodule, n≥1.

**Proof outline.**

1. Set e=diag(I_n,0)∈A_{n+1}. The preceding node identifies the corner K-map with P↦P⊗_{A_n}eA_{n+1}.
2. The multiplication isomorphism eA_{n+1}⊗_{A_{n+1}}R^{n+1}≅eR^{n+1} and the coordinate projection eR^{n+1}≅R^n give a natural bimodule isomorphism. Associating tensors proves Φ_{n+1}(P⊗eA_{n+1})≅Φ_n(P).
3. These coordinate isomorphisms compose literally for successive upper-left corners. The induced natural exact-functor isomorphisms yield compatible K-homotopies. Thus the colimit diagram of matrix spectra is identified with the constant spectrum K^B(R), rather than merely identifying its individual objects.

**Acceptance.**

- On K₀, the corner sends the rank-one primitive idempotent to the same primitive idempotent, hence to1 under Φ_n. The regular module of M_n(R) maps to rank n over R, so it is not the normalized generator.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/nonunital-map-idempotent-extension`
- `GeneralAlgebraicKTheory:K.7/morita-invariance`

**Sources.**

- `Kbook.2013`: IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps. The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the worker’s derivation supplying the missing adapter; they are not attributed to an unread source proof.

### Filtered continuity of the nonunital Bass spectrum

`GeneralAlgebraicKTheory:K.7/nonunital-filtered-continuity` · theorem · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

For a small filtered diagram of nonunital rings A_i, hocolim_i K^B_nu(A_i)≃K^B_nu(colim_i A_i). In particular the corner inclusion R=M₁(R)→M_∞(R) induces K^B(R)≃K^B_nu(M_∞(R)).

**Hypotheses.**

- Associative nonunital rings and nonunital ring homomorphisms; ordinary K^B on unital rings is the existing Bass nonconnective spectrum.

**Proof outline.**

1. Unitization preserves filtered colimits: the ℤ coefficient is unchanged and every finite sum/product in the nonunital part is represented at a finite stage. Thus colim(ℤ⋉A_i)≅ℤ⋉colim A_i as augmented unital rings.
2. First obtain unital K^B continuity directly: positive/zero degrees are the early K.2 continuity theorem, and negative degrees commute with filtered colimits by polynomial/Laurent extension and cokernel iteration. The Bass homotopy-group identification and stable Whitehead give the spectrum comparison. Apply this to the unitizations. The constant augmentation spectrum K^B(ℤ) has itself as hocolim because a nonempty filtered index has contractible nerve.
3. Filtered homotopy colimits of spectra commute with finite homotopy limits; in particular they commute with these augmentation fibres. This gives the comparison equivalence. The generic stable-category statement is an H.5 supplier, explicitly requested below.
4. Apply this to the corner matrix diagram and use matrix-corner-morita-naturality to identify all transitions with identity. Its hocolim is K^B(R), with the actual first-corner map as comparison.

**Acceptance.**

- The theorem permits nonunital transitions. An unital-ring colimit of the corner system is not substituted.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/nonunital-bass-fibre`
- `GeneralAlgebraicKTheory:K.7/matrix-corner-morita-naturality`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/bass-spectrum-homotopy-groups`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- `Kbook.2013`: IV.6.3.5–6.4, III.4.4 axiom4, and II.2.7.2; formal adapter for the nonunital corner maps. The matrix Morita and unital continuity statements are source inputs. The explicit unitization decomposition and corner-map calculation below are the worker’s derivation supplying the missing adapter; they are not attributed to an unread source proof.

### The bisimplicial S-grid of a biexact functor

`GeneralAlgebraicKTheory:K.7/biexact-S-grid` · construction · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.7:products`; maintainer integration is pending.

For filtrations A∈S_mA and B∈S_nB, the grid ((i,j),(k,l))↦F(A_{ij},B_{kl}) gives an object of S_mS_nC, naturally in both simplex variables. Weak maps in each argument give the two weak-map nerve directions of wwS_mS_nC.

**Hypotheses.**

- Small Waldhausen categories and a biexact functor F; F is zero when either argument is zero, exact in each argument, and its pushout-product map is a cofibration.

**Proof outline.**

1. Exactness in each variable gives zero diagonals, quotient identifications and the single-direction pushout squares. The joint latching inclusion is exactly F(A′,B)∪_{F(A,B)}F(A,B′)↣F(A′,B′); the pushout-product hypothesis makes this a cofibration.
2. For a cofibration of S_m objects, the induced map is objectwise a cofibration and the relative latching maps are again pushout products. Thus F(A,−) is exact as a functor into S_mC, including the Waldhausen structure, and the same holds after interchanging variables.
3. Restriction along Δ maps gives the two face/degeneracy compatibilities. Naturality of F makes the weak-map squares commute. If either filtration is the zero one, the output grid is zero, which makes the realized map factor through the smash quotient.

**Acceptance.**

- Separate exactness alone is not silently substituted for the joint latching condition.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`
- `GeneralAlgebraicKTheory:K.4:construction/S-construction`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `BiexactSGrid` | constructor | F:S_mA×S_nB→S_mS_nC with the joint latching condition. |
| `BiexactSGrid.simplex_natural` | functoriality | Compatibility with both simplicial directions. |
| `BiexactSGrid.zero_left` | simp | A zero input gives a zero grid. |
| `BiexactSGrid.pushoutProduct` | compatibility | The grid latching map is the displayed pushout product. |

**Consumers.**

- K.6/multiplication-by-t-splits-the-boundary and K.7/products-from-biexact-functors — Constructs the early pairing actually used by the Bass/Fundamental-Theorem route.

**Unit tests.**

- `zero_flag` (computation) — If one input flag is zero all F(A_ij,B_kl) are zero.
- `vector_tensor_grid` (computation) — For finite-dimensional k-spaces, a grid of flags has quotient (A_j/A_i)⊗(B_l/B_k); dimensions multiply.
- `sum_functor_excluded` (non-example) — F(A,B)=A⊕B on vector spaces is not a pairing input: F(A,0)=A rather than0.

**Sources.**

- `Waldhausen.KSpaces`: §1.5 pairing paragraph, printed p.342/PDF25, full text and image read. The source indicates the bisimplicial map, smash quotient and two-fold delooping. The grid verification and explicit coherence transport below are the worker’s elaboration of this construction, not a claim that the paragraph proves a modern E∞ recognition theorem.

### Stabilize the S-grid to a K-spectrum pairing

`GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing` · lemma · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.7:products`; maintainer integration is pending.

The S-grid yields a natural pairing K(A)∧K(B)→K(C), inducing K_i(A)⊗K_j(B)→K_{i+j}(C), with degree-zero formula [a]·[b]=[F(a,b)].

**Hypotheses.**

- Small Waldhausen categories and a biexact functor F; F is zero when either argument is zero, exact in each argument, and its pushout-product map is a cofibration.

**Proof outline.**

1. Realize the grid in both directions. Remove the second weak-map direction with K.4:construction/weak-double-nerve-swallow and use the iterated-S delooping comparisons. At the first two delooped levels this is the source’s |wSA|∧|wSB|→|wwS²C| map.
2. Repeat the same construction on S^rA and S^sB to obtain compatible level pairings into S^{r+s}C. The structure-map squares are natural in the grid; H.5’s spectrum-pairing assembly turns them into the displayed smash pairing.
3. An object gives the basic S₁ loop. The grid of two such loops gives the loop for F(a,b), so the induced map on K₀ has the stated formula. Compose representing spheres in degrees i,j with the pairing to obtain the higher products.

**Acceptance.**

- Spectrum assembly is a precise H.5 supplier; this node owns the K-theoretic grid and its structure-map compatibility.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/biexact-S-grid`
- `GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow`
- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `StableHomotopyKTheory:H.5:S-delooping`
- `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- `Waldhausen.KSpaces`: §1.5 pairing paragraph, printed p.342/PDF25, full text and image read. The source indicates the bisimplicial map, smash quotient and two-fold delooping. The grid verification and explicit coherence transport below are the worker’s elaboration of this construction, not a claim that the paragraph proves a modern E∞ recognition theorem.

### Transport biexact natural isomorphisms to pairing homotopies

`GeneralAlgebraicKTheory:K.7/biexact-pairing-coherence` · lemma · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.7:products`; maintainer integration is pending.

Natural exact-functor isomorphisms between iterated biexact composites give homotopies between the induced K-pairings. Associator, unit and symmetry diagrams yield the corresponding coherent pairing diagrams. For symmetric tensor product the sphere twist gives (−1)^{ij} on K_i⊗K_j.

**Hypotheses.**

- Small Waldhausen categories and a biexact functor F; F is zero when either argument is zero, exact in each argument, and its pushout-product map is a cofibration.

**Proof outline.**

1. Apply each natural isomorphism to every grid entry. It gives a natural transformation of the weak-map categories, hence a nerve homotopy, naturally in all simplex variables. Iterate for triple and higher grids.
2. The pentagon, triangle and symmetry identities for the underlying functors identify the boundary diagrams of the grid homotopies. H.5’s multilinear assembly transports these compatible homotopies to spectra. The tensor unit is identified by the actual natural isomorphisms F(1,−)≅id and F(−,1)≅id.
3. Swapping the two grid directions realizes the permutation of the two representing sphere factors. Import its degree (−1)^{ij} from H.5, and compose it with the symmetry isomorphism. This proves graded commutativity on groups.
4. A bare additive equivalence supplies no unit or monoidal coherence: tensoring by a nontrivial line bundle sends [R] to[L]. Thus Morita product comparisons require the explicitly compatible input and target pairing data. A modern E∞ refinement additionally requires the full coherent multilinear recognition supplier, not merely a binary homotopy.

**Acceptance.**

- Finite coherence diagrams and the full E∞ refinement are distinguished; no absent recognition theorem is treated as already formalized.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`
- `StableHomotopyKTheory:H.1`
- `StableHomotopyKTheory:H.5:spectra`

**Sources.**

- `Waldhausen.KSpaces`: §1.5 pairing paragraph, printed p.342/PDF25, full text and image read. The source indicates the bisimplicial map, smash quotient and two-fold delooping. The grid verification and explicit coherence transport below are the worker’s elaboration of this construction, not a claim that the paragraph proves a modern E∞ recognition theorem.

### Karoubi’s direct filtration in the discrete additive case

`GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

An A-filtration of an additive category C gives each X a directed family of split decompositions X=A_i⊕X_i with A_i∈A. Every map A→X factors through some A_i and every map X→A factors through some projection X→A_i; filtrations are compatible with⊕. The maps factoring through A form a two-sided additive ideal. Define C/A with the same objects and morphisms modulo that ideal.

**Hypotheses.**

- A is a strictly full additive subcategory and is closed under the indicated finite summands. Hom groups use the discrete0/1 quasi-norm, so the source’s approximate factorizations are exact.

**Proof outline.**

1. State F1 directed compatibility of inclusions and projections, F2/F3 the two factorization conditions, and F4 the sum condition. The two descriptions of finite-support maps agree by F2/F3.
2. Composition on either side preserves factorization through A. Directedness combines two factorizations into one A-object, so sums and negatives remain in the ideal. Thus the quotient composition is well-defined.
3. The identity ofX lies in that ideal iff X belongs toA (with its stipulated summand closure). Quotient zero-objects are exactly the old subcategory, not arbitrary zero classes in K0.

**Acceptance.**

- Retain both source and target factorization conditions. For a normed category they require approximation and closure; this node claims the discrete case only.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs`
- `mathlib:CategoryTheory.Idempotents.Karoubi`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KaroubiFiltration` | constructor | Actual split directed decompositions and the F1–F4 conditions. |
| `KaroubiFiltration.finiteIdeal` | constructor | Morphisms factoring through an A-object. |
| `KaroubiFiltration.quotient` | constructor | Same objects and quotient Hom groups. |
| `KaroubiFiltration.zeroObjects` | characterisation | An object becomes zero exactly when it belongs toA. |

**Consumers.**

- The negative comparison and triangulated-invariance tests of K.6/K.7 — Provides an actual cone, quotient or test model with all hypotheses, instead of assuming the desired comparison.

**Unit tests.**

- `finite_vectors` (computation) — Truncations of a countable sequence of finite projectives give the finite-support ideal.
- `identity_of_old` (computation) — If X∈A, id_X factors through X and vanishes in the quotient.
- `one_sided_insufficient` (non-example) — Maps out of finite objects alone do not prove the factorization ideal is compatible with maps into them.

**Sources.**

- `Karoubi.Derived.1970`: §1 Definition1.5,Propositions1.7–1.9,Lemma1.11,PDF9–21. Definitions and ideal proof read.

### The finite-defect index and the cone boundary

`GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For A⊂C a direct filtration, the relative index group K₀(C→C/A) is K₀(A^♮). The exact sequence K₁^cl(C)→K₁^cl(C/A)→K₀(A^♮)→K₀(C^♮)→K₀((C/A)^♮) is natural. If C is flasque, its two middle absolute groups vanish, so the index boundary K₁^cl(C/A)→K₀(A^♮) is an isomorphism.

**Hypotheses.**

- The classical additive-functor relative K0 triples and their five-term sequence are required from early K.3; this is independent of U.6’s relative ring K1 comparison.

**Proof outline.**

1. Represent an index class by a graded stable triple(X,Y,α). Outside sufficiently large finite A-summands, α has degree0 in the quotient. In the discrete case choose the source’s approximation exactly on that complementary part, using the two factorization conditions.
2. Use the source’s graded normal form E=H⊕H and a finite graded cutoff E_i. With F_i the image of the degree-one part of the lifted isomorphism, write α′ as the block matrix (α′_i,0;λ,α′′_i), with complementary block of degree0. Define Ind by the finite graded triple d̄(E_i,F_i,α′_i), exactly as in the source p38. Translate it to ordinary K0 via Theorem2.9. It is not an arbitrary difference of the degree-zero summands: retain the graded triple and its isomorphism.
3. For nested cutoffs E_j=E_i⊕E_ij and F_j=F_i⊕F_ij, the added triple is quasi-trivial after the shear (1,0;μ,1), which is elementary of degree0. This proves independence. The composition relation and the source’s two inverse maps prove the finite-defect index isomorphism (pp38–40).
4. The inverse sends a difference of old objects to its zero quotient-isomorphism triple. Splitting off the degree0 complement shows both composites are identity. Apply the early classical five-term sequence.
5. For a swindle T with id⊕T≅T, direct-sum additivity kills both K0 and automorphism K1: [X]+[TX]=[TX], and[X,α]+[TX,Tα]=[TX,Tα].

**Acceptance.**

- The natural index is the bridge invoked in1971,p73; it is a filtered-category statement, not a literal isomorphism between suspension and polynomial rings.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`
- `GeneralAlgebraicKTheory:K.3/additive-functor-five-term`
- `GeneralAlgebraicKTheory:K.6/flasque-rings-and-the-swindle`

**Sources.**

- `Karoubi.Derived.1970`: §2 Theorem2.13 proof,Proposition2.16,PDF36–40;§3 swindle and boundary,PDF50–51. Read finite-cutoff independence and both inverse maps; source matrix displays must be consulted during implementation.

### Karoubi’s derived groups from a flasque cone

`GeneralAlgebraicKTheory:K.6/karoubi-flasque-derived-groups` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For a small additive category A, the source’s cone CA has objects countable sequences drawn from finitely many A-object types and controlled matrix morphisms (finite sums of permutant matrices in the discrete case). Finite sequences identifyA as a filtered subcategory. Put SA=CA/A and Kar_{−n}(A)=K₀((SⁿA)^♮), n≥0. These derived groups have the natural localization boundary for direct filtrations.

**Hypotheses.**

- Use the controlled source cone, not an unexamined category of all infinite matrices. Idempotent completion is part of K0 in every degree.

**Proof outline.**

1. Truncations give the A-filtration. Controlled matrix morphisms to or from a finite sequence factor through a finite truncation, verifying F2/F3; directedness and sum compatibility are explicit.
2. Repeat each sequence countably and flatten ℕ×ℕ by a bijection. Matrix entries repeat blockwise; controlled morphisms remain controlled. Adding one column is a permutation, giving a natural id⊕T≅T and flasqueness.
3. Iterate the quotient construction. The cone preserves direct-filtered exact sequences (source3.12), and the quotient three-by-three lemma gives exact suspension sequences (3.13–3.14). The finite-defect index provides the initial K1/K0 exact germ.
4. Define the connecting map using the intermediate category CA/A′ for A′⊂A. Its map from A/A′ to this intermediate quotient and the inverse suspension identification give the boundary. The source’s two three-by-three diagrams prove exactness (3.23).
5. Uniqueness: a comparison in degree0 extends recursively through the suspension boundary. The same intermediate quotient diagram makes it commute with every localization boundary (3.21), so the result is natural and independent of the selected admissible flasque resolution.

**Acceptance.**

- The source uses cohomological indexn≥0 for these algebraically negative groups. A topological Banach-category periodicity theorem is not imported.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`
- `GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KaroubiCone` | constructor | Finite-type countable sequences and the controlled matrix Hom groups. |
| `KaroubiCone.swindle` | structure | The repeated-sequence functor and natural id⊕T≅T. |
| `KaroubiSuspension` | constructor | The direct-filtered quotient CA/A. |
| `KaroubiNegative` | constructor | K0 of the idempotent completion of each iterated suspension. |
| `KaroubiNegative.boundary` | compatibility | Natural direct-filtration localization boundaries. |

**Consumers.**

- The negative comparison and triangulated-invariance tests of K.6/K.7 — Provides an actual cone, quotient or test model with all hypotheses, instead of assuming the desired comparison.

**Unit tests.**

- `finite_sequence` (computation) — An old finite sequence becomes zero in the suspension.
- `countable_reindexing` (computation) — Adding the initial column to ℕ×ℕ is absorbed by a bijection.
- `uncontrolled_maps` (non-example) — Arbitrary column-finite matrices without the source’s row/control condition are not silently admitted as morphisms.

**Sources.**

- `Karoubi.Derived.1970`: §1 example3/Thm1.6,PDF11–13;§3 Thm3.2/3.10,Def3.11,Props3.12–14,Thms3.21/3.23,PDF41–57. The cone, exactness and derived-group uniqueness proofs are read; their source diagrams are retained as implementation locators.

### The cone proof of uniqueness for negative ring theories

`GeneralAlgebraicKTheory:K.6/bass-cone-uniqueness` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Every theory satisfying axioms-for-negative-k-theory is canonically naturally isomorphic to Bass’s. For the cone ring C(R) and suspension S(R)=C(R)/M∞R, its boundary identifies E_n(S(R)) with E_(n−1)(R), n≤0. Starting with the degree0 identification determines every negative comparison and its boundary compatibility.

**Hypotheses.**

- Nonunital rings and the actual M∞ corner inclusions belong to the axioms. Flasqueness applies to C(R).

**Proof outline.**

1. The ideal sequence M∞R→C(R)→S(R), matrix stability and the vanishing of the flasque middle term give the boundary isomorphism. Define h_(n−1)(R)=∂′ h_n(SR) ∂⁻¹.
2. For an ideal I⊂R, use the common quotient C(R)/M∞I and the map M∞(R/I)→C(R)/M∞I. Naturality of both theories’ boundaries identifies the original I-boundary with the composite through S(I). The comparison therefore commutes with that boundary, by the exact diagram in III.4.5.
3. This constructs the comparison recursively and proves its uniqueness from the four stated axioms, including stability under the actual nonunital corner maps. Verifying that stability for a candidate is a separate obligation: the K.7 nonunital adapter supplies it for Bass spectra. The uniqueness proof assumes the axiom and does not depend on that later verification theorem.

**Acceptance.**

- The proof neither asserts S(R[t])=S(R)[t] nor uses a scheme comparison.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/axioms-for-negative-k-theory`

**Sources.**

- `Kbook.2013`: III.4.4–4.5,chapter pp32–33/combinedPDFp224–225. Full uniqueness proof and its boundary diagram read. The earlier packet sentence denying uniqueness is corrected.

### Compare Karoubi’s negative groups with Bass contractions

`GeneralAlgebraicKTheory:K.6/karoubi-bass-contraction-comparison` · comparison · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For any unital associative ring R and n≥0, Kar_{−n}(R)≅LⁿK₀(R)=K^Bass_(−n)(R), naturally in ring maps and the polynomial/Laurent maps. In1971 the source denotes Kar_{−n} by K^n. The discrete0/1 norm turns its summable series into finite polynomials.

**Hypotheses.**

- The Karoubi theory is the derived cone theory in the preceding node, with idempotent completion. Only the nonpositive algebraic range is asserted.

**Proof outline.**

1. The finite-defect index and flasque cone identify K₁^cl(SR),K₁^cl(SR⟨t⟩),K₁^cl(SR⟨t⁻¹⟩),K₁^cl(SR⟨t,t⁻¹⟩) with the corresponding degree0 groups ofR and its polynomial/Laurent rings. These are the filtered-category comparisons printed before Theorem3.2, and are compatible with both polynomial inclusions.
2. Apply the K1 Laurent decomposition of§II (2.1–2.7) to the suspension ring and transport its exact maps and splitting through that index diagram. Repeating at successive flasque suspensions gives the natural sequence0→Kar_(−n)(R)→Kar_(−n)(R[t])⊕Kar_(−n)(R[t⁻¹])→Kar_(−n)(R[t,t⁻¹])→Kar_(−n−1)(R)→0 of Theorem3.2.
3. Its cokernel says L Kar_(−n)=Kar_(−n−1). Since Kar₀ is the ordinary projective K0, induction identifies each group with LⁿK0, which defines the Bass groups. This is a group and map comparison; it does not identify the suspension rings with polynomial extensions.
4. Equivalently, once the four nonunital ring axioms have been checked for a proposed cone model, bass-cone-uniqueness supplies the canonical boundary-compatible comparison. This alternative is recorded as a criterion, not as an unchecked assertion of those axioms for IK.

**Acceptance.**

- Check the polynomial inclusion square in the filtered index comparison, not just the group orders. No current claim is made about positive topological Karoubi groups.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/karoubi-index-and-cone-boundary`
- `GeneralAlgebraicKTheory:K.6/karoubi-flasque-derived-groups`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups`
- `GeneralAlgebraicKTheory:K.6/negative-k-groups-are-contracted`

**Sources.**

- `Karoubi.Bott.1971`: §II2.1–2.7,66–72;§III before Thm3.2 and Thm3.2,73–74. Full K1 Laurent proof and the degree≥0 cohomological contraction theorem read, including the imported filtered-category construction now decomposed above.

### Two Artin module models with equivalent triangulated stable categories

`GeneralAlgebraicKTheory:K.7/stable-artin-module-models` · construction · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

For an odd primep, the finite-module categories over R₁=ℤ/p² and R₂=𝔽_p[ε]/ε² are Frobenius. With monomorphisms as cofibrations and stable isomorphisms as weak equivalences, their stable categories are both equivalent to finite-dimensional 𝔽_p vector spaces with suspension id and split distinguished triangles.

**Hypotheses.**

- p is odd, as in the source counterexample. Objects are finitely generated modules over the indicated finite rings, not arbitrary infinite modules.

**Proof outline.**

1. Each finite module decomposes as a finite direct sum of free modules and copies of the simple module𝔽_p (elementary divisors for ℤ/p² and the length≤2 nilpotent Jordan decomposition for dual numbers). The free modules are precisely the projective-injectives and vanish stably.
2. Inflation from𝔽_p is fully faithful stably: a simple-to-simple map factoring through a free module is zero, since the inclusion lands in its socle and projection to the simple kills that socle. The module decomposition makes inflation essentially surjective.
3. The chosen injective hull of the simple module isR. Multiplication byp orε identifies R/simple with simple, hence suspension is id. Every triangle is a sum of rotations of the identity triangle because any map of finite vector spaces splits into its isomorphism and zero parts.

**Acceptance.**

- The resulting equivalence of triangulated categories is not asserted to lift to an exact weak-equivalence-preserving map between the two ring module models.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/frobenius-pairs`
- `GeneralAlgebraicKTheory:K.6/frobenius-pair-factorization`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ArtinStableModel` | constructor | Finite modules with monic cofibrations and stable-isomorphism weak equivalences. |
| `ArtinStableModel.projectiveInjective` | characterisation | The free modules are the projective-injective objects. |
| `ArtinStableModel.simpleEquivalence` | equivalence | Stable category≃finite𝔽_p vector spaces. |
| `ArtinStableModel.suspension` | compatibility | Multiplication byp orε identifies suspension with identity. |

**Consumers.**

- The negative comparison and triangulated-invariance tests of K.6/K.7 — Provides an actual cone, quotient or test model with all hypotheses, instead of assuming the desired comparison.

**Unit tests.**

- `p_three` (computation) — The two rings areℤ/9 and𝔽₃[ε]/ε²; their free modules disappear stably.
- `simple_survives` (computation) — The simple module𝔽_p has nonzero stable identity.
- `enhancement_absent` (non-example) — A triangulated equivalence alone supplies no exact map between the two Waldhausen models.

**Sources.**

- `Schlichting.TriangulatedCounterexample.2002`: §§0.2–0.3,1.1–1.4,112–113. Full module and suspension argument read.

### The K-theory fibration for each Artin stable module model

`GeneralAlgebraicKTheory:K.7/stable-artin-k-fibration` · lemma · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

For either R₁ orR₂ there is a natural homotopy fibration K(R)→K(𝔽_p)→K(mM(R)), where mM(R) is the stable-weak-equivalence module model. Consequently K₄(mM(R)) injects intoK₃(R), with image the kernel ofK₃(R)→K₃(𝔽_p).

**Hypotheses.**

- Use the opposite Waldhausen construction or the existential Frobenius factorization/fibration apparatus of early K.4.

**Proof outline.**

1. The acyclic objects for stable weak equivalences are the projective-injectives. The change from isomorphism weak equivalences to stable weak equivalences gives the fibration K(P(R))→K(M(R))→K(mM(R)).
2. Dévissage of the finite-length abelian categoryM(R) identifies its exact K-theory withK(𝔽_p), using the unique simple object.
3. The long exact sequence and K₄(𝔽_p)=0 give the displayed injection. The finite-field calculation is the L.1 supplier, not a fresh construction here.

**Acceptance.**

- The source fibration uses exactM(R), not its split-exact version.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/stable-artin-module-models`
- `GeneralAlgebraicKTheory:K.4/fibration-with-factorizations`
- `GeneralAlgebraicKTheory:K.3/devissage-theorem`
- `KTheoryFiniteLocalFields:L.1`

**Sources.**

- `Schlichting.TriangulatedCounterexample.2002`: §§1.5–1.6,113–114. Full fibration and dévissage proof read; the derived-invariance theorem is not assumed to prove its own counterexample.

### The two stable models have different fourth K-groups

`GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample` · application · parent `GeneralAlgebraicKTheory:K.7` · implementation unchecked

For an odd primep, despite the triangulated equivalence above, K₄(mM(ℤ/p²)) has p-primary subgroupC_(p²), while K₄(mM(𝔽_p[ε]/ε²)) has p-primary subgroupC_p⊕C_p. Their Waldhausen K-theories are therefore inequivalent.

**Hypotheses.**

- Numerical inputs: K₃(ℤ/p²)=C_(p²)⊕C_(p²−1); K₃(𝔽_p[ε]/ε²)=C_p⊕C_p⊕C_(p²−1); K₃(𝔽_p)=C_(p²−1),K₄(𝔽_p)=0. The Artin K3 calculations are explicitly requested, not claimed newly proved here.

**Proof outline.**

1. The stable-artin-k-fibration identifiesK4 with the kernel ofK3(R)→K3(𝔽_p). Its entire p-primary subgroup maps to0 because the target has order prime top.
2. The first source p-primary group contains an element of orderp². The second has exponentp, so cannot contain such an element. This distinguishes the K4 groups without needing the actual map on the prime-to-p summand.
3. Thus an equivalence of underlying triangulated stable categories is insufficient. Preserve the positive invariance theorem for a map of Frobenius pairs inducing a derived equivalence; the counterexample lacks that map.

**Acceptance.**

- At p=3 the distinguishing p-primary groups areC9 andC3×C3, not different cardinalities. The unread EF82/ALPS85 calculation inputs are recorded separately.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.7/stable-artin-k-fibration`
- `GeneralAlgebraicKTheory:K.7/stable-artin-module-models`

**Sources.**

- `Schlichting.TriangulatedCounterexample.2002`: §§1.6–1.7,114;§2.1–2.2,114–115. Counterexample proof read; only its separately cited finite-ring K3 computations remain unexamined.

### Finite domination of a chain complex

`GeneralAlgebraicKTheory:K.6/finite-chain-domination` · definition · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For A fully embedded in an additive U, a bounded complex V in U is A-dominated if a finite complex D in A admits chain maps f:V→D,g:D→V and h:gf≃id_V. The homotopy idempotent fg is not assumed to be an actual degreewise idempotent.

**Hypotheses.**

- Use the existing HomologicalComplex and Homotopy carriers; arbitrary finite degree support is shifted into nonnegative degrees for the source formulas.

**Proof outline.**

1. Store the finite support, the two chain maps and the specified homotopy.
2. An actual finite A-complex is dominated by itself. Domination is preserved by chain homotopy equivalence, direct sums and shifts.
3. gf≃id implies (fg)²≃fg, but generally not (fg)²=fg. The next construction supplies an actual finite idempotent model.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `FiniteChainDomination` | data | A finite A-complex D, chain maps f,g and homotopy gf≃id. |
| `FiniteChainDomination.transport` | functoriality | Transport along a chain homotopy equivalence. |
| `FiniteChainDomination.fg` | characterisation | fg is idempotent up to the induced homotopy. |
| `FiniteChainDomination.sum` | compatibility | Direct sums of the given finite dominations. |

**Consumers.**

- Schlichting7.1 additive and arbitrary-ring agreement — Identifies the bounded-complex quotient model with the additive suspension and its boundary.

**Unit tests.**

- `self_domination` (degenerate) — A finite A-complex has f=g=id,h=0.
- `contractible_domination` (computation) — A contractible complex is dominated by the zero complex.
- `homotopy_not_idempotent` (non-example) — A supplied homotopy (fg)²≃fg does not justify an idempotent-completion object (D,fg).

**Sources.**

- `Ranicki.Finiteness.1985`: §3 Proposition3.1 and relative Proposition3.2,pp118–123/PDF14–19. The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison.

### Turn finite domination into a finite idempotent complex

`GeneralAlgebraicKTheory:K.6/finite-domination-idempotent-model` · construction · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Every A-dominated complex in U is chain homotopy equivalent in U^♮ to a finite complex in A^♮. There is an explicit idempotent p on F=⊕D_i, with [V]=[F,p]−[D_odd] in K0(A^♮). Its image class in K0(U^♮) is the Euler class of V.

**Hypotheses.**

- D is supported in0,…,n after a shift; the homotopy convention is gf−id=dh+hd. The idempotent uses f,g,h and d_D, not the uncorrected fg.

**Proof outline.**

1. Construct C′_i=⊕_(j≤i)D_j with differential d′. On its finite blocks use diagonal fg or1−fg according to parity; adjacent block is (−1)^(j+k)d_D when j=k+1, and the lower blocks are (−1)^(k+1)fh^(k−j)g for j<k. The matrix is printed in Ranicki119. The identities for chain maps and h give(d′)²=0.
2. The inclusion with final component f and the row (h^ig,h^(i−1)g,…,g) give inverse chain equivalences V⇄C′. The source’s matrix k′ with identity on the first i blocks is the second homotopy (p120).
3. For i≥n every C′_i=F and d′ alternates p,1−p, so(d′)²=0 gives p²=p. Truncate at n with top idempotent p for even n and1−p for odd n. The maps identity in lower degrees and this top idempotent are inverse chain equivalences to the finite idempotent complex E.
4. Euler summation gives [E]=[F,p]−[D_odd]. This is valid also for A⊂U: every matrix entry of p has source/target in A because f,g compose through D, and A is full.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/finite-chain-domination`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `FiniteDomination.idempotent` | constructor | The actual finite block idempotent p on ⊕D_i. |
| `FiniteDomination.finiteModel` | constructor | The truncated complex E in A^♮ with the parity-dependent top idempotent. |
| `FiniteDomination.modelEquivalence` | equivalence | Chain homotopy equivalence V≃E in U^♮. |
| `FiniteDomination.euler` | compatibility | [V]=[F,p]−[D_odd], including its image in U^♮. |

**Consumers.**

- Schlichting7.1 additive and arbitrary-ring agreement — Identifies the bounded-complex quotient model with the additive suspension and its boundary.

**Unit tests.**

- `domination_degree_zero` (computation) — If f,g split strictly and D has only degree0, p=fg is the usual projector.
- `domination_identity` (computation) — For identity domination the Euler class is the usual alternating sum of D_i.
- `parity_matters` (non-example) — For odd top degree use1−p; replacing it by p changes the Euler formula.

**Sources.**

- `Ranicki.Finiteness.1985`: Proposition3.1 full proof,pp118–122/PDF14–18;Proposition3.2,123/PDF19. The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison.

### Return finite idempotent complexes when their Euler class lifts

`GeneralAlgebraicKTheory:K.6/restricted-completion-complex-return` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

A finite complex E in A^♮ is homotopy equivalent to a finite A-complex exactly when its Euler class belongs to im(K0(A)→K0(A^♮)). More generally an A-dominated V in U has a finite A^K-model, where K is the preimage of imK0(U) under K0(A^♮)→K0(U^♮).

**Hypotheses.**

- A^K denotes the full subcategory of A^♮ on object classes in K. U^K is obtained by adjoining these objects to U. The map is to K0(U^♮), not an unstated identification K0(U)=K0(U^♮).

**Proof outline.**

1. From the top degree down, add the elementary contractible complex (A_i,1−p_i) in degrees i,i−1. Replace (A_i,p_i)⊕(A_i,1−p_i) by A_i; all idempotents above degree0 become identities (Ranicki115–116).
2. Only (A0,p0) remains. If its reduced Euler class is zero, choose old objects B,C with (A0,p0)⊕B≅C. Adding the elementary contractible B-complex removes this final projector too.
3. For the relative version, finite-domination-idempotent-model gives its sole obstruction class. Its image equals the Euler class of V in U, so it lies in K. The same reduction places the finite model in A^K.
4. Apply this also to U⊂U^K: every bounded U^K-complex whose Euler class lifts to U can return to U. This is the restricted-completion comparison used in CP7.6–7.7.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/finite-domination-idempotent-model`

**Sources.**

- `Ranicki.Finiteness.1985`: Proposition2.1 pp115–116/PDF11–12;relative Proposition3.2 pp122–123/PDF18–19;CP§5 and7.4. The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison.

### Lift a quotient complex through a Karoubi filtration

`GeneralAlgebraicKTheory:K.6/karoubi-quotient-complex-lifting` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Every bounded complex over U/A is isomorphic in the quotient to the image of a bounded complex over U. A bounded U-complex becomes contractible over U/A exactly when it is A-dominated.

**Hypotheses.**

- U is A-filtered by the directed split filtration. Quotient morphisms are only classes modulo maps through A, so arbitrary differential lifts need not square to zero.

**Proof outline.**

1. Lift the differential maps. Start at the bottom with d1. The defect d1d2 factors through A; choose a split old summand in the domain large enough to contain that factorization, and restrict d2 to its complementary summand. This kills the defect exactly. Continue upwards finitely. Removing old summands does not change quotient objects, yielding the quotient-complex isomorphism (Carlsson–Pedersen751–752).
2. For a quotient contraction, lift its homotopy maps r_i. At the top, id−r_(n−1)d_n factors through A. Choose a split old summand A_n containing that factorization. Descend, enlarging A_(i−1) so d_i(A_i) lies in it and the next contraction defect factors through it.
3. These A_i form a finite A-complex. Inclusion g:A•→V and f=id−rd−dr:V→A• give gf≃id_V. Conversely an A-domination becomes domination by zero in the quotient, hence contractibility.
4. The same finite cutoff argument makes a quotient chain map strict after removing old source summands. This supplies the strict map needed for the cylinder comparison; no claim is made that an arbitrary representative was already a chain map.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/karoubi-direct-filtration`
- `GeneralAlgebraicKTheory:K.6/finite-chain-domination`

**Sources.**

- `CarlssonPedersen.Controlled.1995`: Proposition4.7 and proof of Theorem4.1,pp751–752/PDF21–22;CP7.2–7.5. The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison.

### Identify the quotient and acyclic complex models

`GeneralAlgebraicKTheory:K.6/karoubi-complex-approximation` · lemma · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

Let C(U) have degreewise split-monic cofibrations and chain-homotopy weak equivalences; let w be the maps becoming homotopy equivalences in C(U/A). Then K(C(U),w)≃K(C(U/A)), and K(C(U)^w)≃K(C(A^K)). The same strictification gives the Verdier quotient equivalence after the indicated restricted completion.

**Hypotheses.**

- Bounded complex models, their standard mapping cylinders and the explicit quotient functor are used. K is the preimage subgroup of restricted-completion-complex-return.

**Proof outline.**

1. The mapping cylinder of f has degree p terms U_p⊕U_(p−1)⊕V_p and differential (d,−1,0;0,−d,0;0,f,d). Its projection to V is weak, with the source’s specified contraction. Saturation and extension follow from mapping-cone identities (CP§4).
2. App1 for C(U,w)→C(U/A) is its definition. Quotient-complex lifting and strictification followed by the mapping cylinder give App2. Apply early K4 approximation.
3. The acyclic objects are precisely the A-dominated complexes. In U^K each is homotopy equivalent to an A^K-complex by the finite-domination model and Euler class return. For f:A•→B• and a homotopy equivalence i:B•→A′• with inverse r, take T(if). The map f′=(f,hf,r):T(if)→B• satisfies f′j1=f and is weak; the chain-map equality uses dh+hd=ri−id (CP7.7,p22–23). This verifies the second App2.
4. The two restricted-completion fibre diagrams have the same middle and quotient K-theories, hence equivalent fibres (CP7.6). The finite roof and strictification argument also identifies the homotopy-category Verdier quotient with the quotient complex category, as invoked in Schlichting7.1; for an idempotent-complete A the restricted fibre is A itself.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/karoubi-quotient-complex-lifting`
- `GeneralAlgebraicKTheory:K.6/restricted-completion-complex-return`
- `GeneralAlgebraicKTheory:K.4/approximation-theorem`
- `GeneralAlgebraicKTheory:K.4/fibration-theorem`
- `GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction`

**Sources.**

- `CardenasPedersen.Filtration.1997`: §4,§5,§6,full§7.1–7.9,preprintpp9–24;matrix and fibre diagrams inspected;Schlichting7.1. The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison.

### Compare the additive cone with the Frobenius negative model

`GeneralAlgebraicKTheory:K.6/additive-cone-frobenius-comparison` · comparison · parent `GeneralAlgebraicKTheory:K.6` · implementation unchecked

For a small idempotent-complete additive A, A→CA→SA gives the exact sequence of bounded-complex Frobenius models required for IK localization. Hence IK_(−n)(A)≅K0((SⁿA)^♮), naturally with the cone boundary. For projectives over an arbitrary associative ring, the Karoubi–Bass comparison identifies this with Bass K_(−n)(R).

**Hypotheses.**

- Each additive category has its split exact structure. Cone CA is the controlled flasque cone above; SA=CA/A. At subsequent stages use the source’s idempotent-completion convention.

**Proof outline.**

1. Apply karoubi-complex-approximation to the cone filtration. The bounded complexes with split conflations form Frobenius categories with contractible projective-injectives. Their derived categories are the bounded homotopy categories, and the quotient comparison gives an exact sequence of these models.
2. The countable repeat functor on CA extends degreewise to bounded complexes, with id⊕T≅T. Negative additivity gives IK_i(CA)=0 for i≤0.
3. The exact sequence and IK localization give the natural boundary isomorphism IK_i(SA)≅IK_(i−1)(A) for i≤0. Iterating reaches IK0(SⁿA)=K0((SⁿA)^♮). Naturality uses the same quotient and connecting map, not independent group isomorphisms.
4. For A=P(R), the classical finite-projective carrier is idempotent complete. Compose with karoubi-bass-contraction-comparison, preserving polynomial maps and boundaries. No equality of suspension and polynomial rings is used.

**Acceptance.**

- Track the actual quotient functor and chain homotopies; idempotent completion and the selected K0 subgroup remain explicit.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.6/karoubi-complex-approximation`
- `GeneralAlgebraicKTheory:K.6/karoubi-flasque-derived-groups`
- `GeneralAlgebraicKTheory:K.6/frobenius-spectrum-localization`
- `GeneralAlgebraicKTheory:K.6/additivity-and-colimits-for-negative-K`
- `GeneralAlgebraicKTheory:K.6/karoubi-bass-contraction-comparison`

**Sources.**

- `Schlichting.NegativeK.2003`: Theorem7.1 additive/ring proof pp14–15;CP7.1–7.9;Karoubi1970§3. The indicated proof was read, including matrix formulas where needed. This node separates an input of the additive-cone/Frobenius comparison.

## Remaining gaps

### The exact-versus-additive comparison still needs Keller’s derived criterion

Section10 and AppendixA have now been read. The existential Frobenius factorization, generic approximation/fibration and spectrum comparisons are decomposed in K.4/K.6. Section10’s finitely presented effaceable functors and the auxiliary exact category are understood, but its invocation of Keller96 §§11.7,12.1 for full faithfulness and its dual has not been independently read. This remaining exact-versus-additive comparison is not required for the spectrum-localization proof; the source’s conditional consequence from Conjecture9.7 must be treated historically rather than as a current vanishing theorem.

Needed by: `GeneralAlgebraicKTheory:K.6`.

### The finite Artin K-three calculations underlying the read counterexample remain inputs

Schlichting2002 §§0–2 were read and the stable-model, triangulated equivalence, fibration and p-primary K4 distinction are now separate nodes. His input K3(ℤ/p²) and K3(𝔽_p[ε]/ε²) calculations cite EF82 and ALPS85; neither calculation paper was independently read. The precise numerical contracts are listed in the application and requested from the relative ring K-theory owner K.5. Next source action: read the cited odd-prime K3 computations, not search again for a triangulated counterexample.

Needed by: `GeneralAlgebraicKTheory:K.7/naked-triangulated-invariance-counterexample`.

## Requests to existing owners

- `SchemeKTheoryOperations:S.5` — An ownership handoff, not an input: no node of this packet depends on S.5, and no edge S.5 → K.6 may be added, since K.6 precedes S.2 to S.5 in the atlas and the edge would close a cycle. S.5 owns the scheme forms and imports the ring theorems of K.6. (1) Thomason's projective line and projective bundle theorems for quasi-compact quasi-separated schemes, compared for X = Spec R with K.6/projective-line-over-a-ring and K.6/projective-line-splitting (the source identifies VB(P¹_R) with the vector bundles on the scheme P¹_R only for commutative R). (2) The Fundamental Theorem for schemes (K-book V.8.3, Thomason–Trobaugh 6.6(b)), compared on affine schemes with K.6/fundamental-theorem-with-nil-terms and K.6/nil-groups-are-NK. (3) The scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17: for a quasi-compact quasi-separated scheme X, IK_i(X) ≅ Thomason's K^B_i(X) for i ≤ 0 (Schlichting, Theorem 7.1, proved there from Thomason's projective line theorem and Thomason–Trobaugh 6.6(b)), keeping the qcqs hypotheses and giving, for X = Spec R, the explicit comparison with the ring clause of K.6/agreement-and-vanishing-of-negative-K and with K.6/bass-spectrum-homotopy-groups.

- `SchemeKTheoryOperations:S.2` — An ownership handoff, not an input: the second scheme clause removed from K.6/agreement-and-vanishing-of-negative-K by RT-AREA-ktheory-1/17. For a noetherian scheme X, negative G-theory vanishes: IK_n(Coh(X)) = 0 for n < 0, as the instance for the small noetherian abelian category Coh(X) of the theorem K.6/agreement-and-vanishing-of-negative-K proves for noetherian abelian categories, with an explicit comparison of S.2's nonconnective G-theory with IK of Coh(X). No node of this packet depends on S.2.

- `SchemeKTheoryOperations:S.6` — An ownership handoff, not an input: external products for schemes, supports and relative theories, and the graded commutativity of the total K-group of a scheme, are S.6's and extend K.7/products-from-biexact-functors and K.7/graded-commutativity, which S.6 imports. AUDIT-28 records this as a duplication with K.7; the ring-level pairing is developed here. The former prerequisite of K.7/graded-commutativity on S.6 was the reverse of the stage order (S.6 requires K.7) and is removed.

- `StableHomotopyKTheory:H.5:spectra` — The generic spectrum toolkit K.6 and K.7 build on: homotopy pushouts and cofibres, loops and desuspensions, homotopy colimits of sequences, connective covers, homotopy fibres with their long exact sequences, stable homotopy groups indexed by all integers, and the smash product of spectra with its associativity, unit and symmetry and the sign of the twist on S^p ∧ S^q. K.7/products-from-biexact-functors builds the K-theoretic pairing K(A) ∧ K(B) → K(C) on this smash product and is its only owner; H.5:spectra is asked for the generic smash product only.

- `StableHomotopyKTheory:H.5:S-delooping` — The connective K-theory spectrum of a small Waldhausen category, and of an exact category, assembled from the iterated S-construction and the deloopings of K.4:construction (K.4/delooping-and-the-spectrum), functorial in exact functors and natural transformations; applied to the early ring model of K.2:plus it is the functorial model of connective K-theory of rings that the Bass delooping takes as input. No product structure is asked of spectrum assembly: the pairing is K.7's (RT-AREA-ktheory-1/4). This request replaces the earlier request to GeneralAlgebraicKTheory:K.3, which does not construct Waldhausen spectra.

- `StableHomotopyKTheory:H.3` — The absolute degree-one comparison K.6 uses, from H.3's plus construction: for a connected space X and a perfect normal subgroup P of π_1X, π_1(X⁺_P) = π_1(X)/P, natural for maps carrying the selected perfect subgroup into the selected one; applied to X = BGL(R) and P = E(R) (perfect, by the Whitehead lemma of KTheoryLowDegrees U.1), this gives π_1 BGL(R)⁺ ≅ GL(R)/E(R) = K_1(R) (KTheoryLowDegrees U.2's classical K_1), natural in unital ring maps, and compatible with matrix loops: the loop in BGL(R) given by g ∈ GL_n(R) goes to the class of g in GL(R)/E(R). With the plus = Q comparison (K.2:plus/plus-equals-Q) this identifies the classical K_1 with the first homotopy group of the K-theory space, which K.6 uses for the class [t] of the unit t ∈ ℤ[t,t⁻¹] and for applying the contraction to the classical K_1–K_0 Mayer–Vietoris sequence. K.6 cites H.3 rather than K.2:low-degree-comparisons/explicit-low-degree-models or KTheoryLowDegrees U.6, which lie downstream of K.6 in the assembled atlas.

- `KTheoryLowDegrees:U.6` — An ownership handoff, not an input: the spectrum form of the degree-one clause of Bass's excision for a Milnor square (f : R → S carrying a two-sided ideal I bijectively onto an ideal J). U.6 proves that π_1 𝕂(R, I) → π_1 𝕂(S, J) is onto, equivalently that the birelative term of relative nonconnective K-theory is concentrated in degrees ≥ 1 (the 'even ≥ 1' of Clausen–Mathew–Morrow, Proposition 4.34), from its identification of π_1 of the relative fibre of GeneralAlgebraicKTheory:K.5/relative-K-theory with GL(I)/E(R, I) (U.6/relative-K1-homotopy-comparison), the classical surjectivity K_1(R, I) → K_1(S, J) (the exactness at K_1(S) ⊕ K_1(R/I) of GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris), and the agreement of connective and nonconnective relative theory in degrees ≥ 0 (K.6/bass-spectrum-homotopy-groups). K.6 proves the isomorphisms in degrees ≤ 0 (K.6/milnor-square-excision-in-nonpositive-degrees) and records only the classical degree-one surjectivity; no node of this packet depends on the spectrum form, because U.6 lies downstream of K.6 in the assembled atlas. The early K5/ideal-degree-zero-excision now supplies relative π0 with its actual boundary and patched-module comparison. For CMM4.34, compare absolute K→KB in all degrees≥0 and then take two fibres; use henselian K0-isomorphism and K1-surjectivity for connective relative1-connectivity. Do not infer relative π0 from negative absolute MV. The extra nonconnective birelative1-connectivity needs the positive relativeπ1 surjection after U6’s comparison;0-connectivity suffices for the cartesian square.

- `K2SymbolsBrauer:T.6` — The first and second K-groups with their symbols. K.7's degree-one unit test needs the class of a unit in the first K-group and the anticommutativity of the symbol; neither pinned library has the first K-group at all, and T.6 is where the symbols are owned.

- `StableHomotopyKTheory:H.1` — The Segal subdivision of a small category has naturally homotopy-equivalent nerve realization, and a nonempty filtered poset has contractible nerve. Needed in the resolution-fibre and directed-lattice comma models.

- `StableHomotopyKTheory:H.4` — Monoidal localization of an acted-on category preserves an equivariant nerve equivalence and is itself a nerve equivalence when every action acts invertibly on the nerve. For the split exact chart category P, a cofinal monoidal functor isoVB→isoP gives contractibility of the localized extension category and base-change fibre comparisons. Retain the actual action and cofinality hypotheses, not an arbitrary nonsplit direct-sum group-completion claim.

- `StableHomotopyKTheory:H.1` — Verdier localization/common-roof calculus for a triangulated stable category and a triangulated subcategory: derived full faithfulness/essential surjectivity produce the common roof diagram11.16, with stable commutativity witnessed by maps through projective-injectives. This is the categorical input to the explicit Frobenius strictification, not an assertion that every Frobenius category has a functorial cylinder.

- `StableHomotopyKTheory:H.2` — Objectwise natural weak equivalences of exact functors induce natural transformations on each wS_n category; the nerve homotopies realize to the same homotopy of K-spaces. Preserve the good realization assumptions used in K.4.

- `StableHomotopyKTheory:H.5:spectra` — Filtered homotopy colimits of spectra commute with finite homotopy limits, specifically fib(X_i→Y_i), and a constant spectrum has itself as hocolim over a nonempty filtered index. These map-level comparisons are needed for nonunital unitization fibres; group-level unital continuity alone does not provide them.

- `StableHomotopyKTheory:H.1` — A natural isomorphism of exact multifunctors gives a natural transformation of their weak-map S-grid categories and a nerve homotopy, compatible with the pentagon/triangle/symmetry diagrams.

- `StableHomotopyKTheory:H.5:spectra` — Assemble compatible multilinear pairings on iterated deloopings into smash pairings of spectra; preserve natural associativity/unit/symmetry diagrams and the degree(−1)^{ij} of the sphere twist. A commutative/E∞ ring-spectrum claim additionally needs the full coherent multilinear recognition theorem. The K-theoretic grids are owned by early K.7:products.

- `GeneralAlgebraicKTheory:K.3` — The classical additive-functor relative K0 triple group and natural K1^cl(C)→K1^cl(D)→K0(T)→K0(C)→K0(D) for cofinal additive T, with explicit stable boundary and its exactness, as in Karoubi1970 Theorem2.1 and KbookII2.10/Ex2.17. This is the index germ used by the filtered cone comparison; it is independent of the later U.6 ring-relative K1 homotopy comparison.

- `GeneralAlgebraicKTheory:K.5` — Finite Artin input for the triangulated counterexample: for oddp, K3(ℤ/p²)=C_(p²)⊕C_(p²−1) andK3(𝔽_p[ε]/ε²)=C_p²⊕C_(p²−1), with the relative-to-finite-field interpretation. Schlichting2002 §1.6 cites EF82/ALPS85. The counterexample proof is read; these calculations are not independently supplied by this packet.

- `KTheoryFiniteLocalFields:L.1` — For the stable Artin counterexample, K3(Fp) is cyclic of order p²−1 and K4(Fp)=0; this is the single-owner higher finite-field calculation, including agreement with the exact ring K model.

## Stage proposals awaiting maintainer integration

### The two duplications AUDIT-28 records are boundaries, not overlaps to remove

AUDIT-28 records SchemeKTheoryOperations S.5 as duplicating K.6's fundamental theorem and S.6 as duplicating K.7's external products. Read against the source these are not duplications but the ring and scheme forms of the same theorem, and the source states them separately for exactly that reason: V.8.2 for rings and V.8.3 for quasi-projective schemes. The resolution is that the ring form, with its ring-level inputs (the projective line over an associative ring, the Nil groups, the localisation at t), is proved in this roadmap, and the scheme roadmap imports it for its scheme forms: S.5 and S.6 come after K.6 and K.7 in the atlas, so no node here may cite them (RT-AREA-ktheory-1/17 found the former prerequisite S.5 → K.6 closing a cycle). The scheme clauses of Schlichting's agreement theorem are likewise S.5's and S.2's. The stage texts of K.6, S.2, S.5 and S.6 should each say so in a sentence. No layer should be dropped on this account.



### K.6 carries two independent developments and could be split

K.6's stage text asks both for Bass's negative groups, which need only the zeroth and first K-groups and no homotopy theory, and for the Fundamental Theorem in every degree and the nonconnective spectrum, which need connective K-theory spaces, spectra, homotopy colimits and connective covers, none of which exists in either pinned library. The first part is formalisable against the pins today; the second is blocked on a library of spectra. As one layer it cannot be closed until the homotopy theory arrives, and a reader cannot see that the algebraic part is independently available. Splitting into a negative-K-groups layer and a nonconnective layer would make that visible. Along that line the Bass-side nodes divide as follows: flasque rings, contracted functors, the negative groups, the axioms and the Mayer–Vietoris continuation go to the first layer (their degree-zero and degree-one inputs being the classical K_0 and K_1); the projective line over a ring and its splitting, the Nil groups, the localisation sequences at t, Nil_n ≅ NK_{n+1}, the Fundamental Theorem in positive degrees and its splitting, the contractedness of the K-groups, the Bass spectrum and its homotopy groups, the spectrum form of Milnor-square excision and the vanishing theorem go to the second.



### The name 'flasque' is taken in both pinned libraries by a different notion

Both trees have IsFlasque for the sheaf-theoretic predicate, and K.6 needs Karoubi's flasque rings, which are unrelated. The packet records the collision in the node, in its unit tests and here, because a formalisation that reused the name would produce a statement that reads as true and means something else. A name such as IsFlasqueRing, or Karoubi's own terminology of an infinite sum ring where that stronger notion suffices, should be fixed before any of this layer is written.



### K.7's product construction is needed before K.6

The Bass delooping (K-book IV.10) and the splitting of the Fundamental Theorem in positive degrees (V.8.2, Ex. V.8.1) use the external product with the class [t] ∈ K_1(ℤ[t,t⁻¹]), and K.7/products-from-biexact-functors is the only owner of that pairing (RT-AREA-ktheory-1/4). The pairing needs only K.1, K.2:plus, K.4:construction, StableHomotopyKTheory H.5:spectra and H.5:S-delooping, all upstream of K.6, but the atlas orders K.6 → K.7. Proposal: an early stage K.7:products holding K.7/products-from-biexact-functors (its parent), with edges K.2:plus, K.4:construction, H.5:spectra, H.5:S-delooping → K.7:products → K.6, and the rest of K.7 after K.6 as now. Until that stage exists the node keeps its parent K.7, and K.6/nonconnective-spectrum and K.6/multiplication-by-t-splits-the-boundary cite it directly; the node graph is acyclic, because the pairing node depends on no node of K.6.



## Source discrepancies

### GeneralAlgebraicKTheory/E1

IV.10.3 (Corollary 10.3), printed p. 349 (PDF p. 357); identical in the chapter file Kbook.IV.pdf of 17 August 2012

and K−k(R) ≅ π−kΛk−1K(R) ≅ π−kΛkK(R).

n is not bound in that clause (the preceding clause is 'for n > −k'); since Λ^{k−1}K(R) is the (−k)-connective cover of Λ^kK(R), the group meant is π_{−k}Λ^{k−1}K(R), which equals π_{−k}Λ^kK(R).

new

- Weibel's K-book page: its errata link (Kbook.errata.pdf) returned 404 on 2026-09-28.
- The chapter file Kbook.IV.pdf (17 August 2012) prints the same text.

### GeneralAlgebraicKTheory/E-localisation-extension-quotient

DefinitionV.7.3, p.53/PDF53, inspected text and image

The localized quotient in f:G→F is T⁻¹Q, not T⁻¹M. The full split extension is T⁻¹K↣T⁻¹P↠T⁻¹Q.

M is S-torsion, hence T⁻¹M=0. The target extension category has quotient T⁻¹Q, which can be nonzero already for M=0 and P=Q.

Novelty not established; scoped to the inspected author chapter.

- Author K-book page and indexed errata search on2026-10-02; direct author errata PDF URL returned404. Published edition not inspected.

### GeneralAlgebraicKTheory/E-resolution-fibre-contraction

LemmaV.7.3.1 proof, pp.53–54/PDF53–54, inspected text and both page images

Use P↠M ↦ P⊕P₀↠M with quotient q+q₀. The two summand inclusions give id→T←constant(P₀), through admissible monomorphisms.

The pullback projections are not generally monomorphisms: for M=0 and P=P₀=R≠0, projection R²→R has nonzero kernel. The sum inclusions are split monomorphisms and compatible with the quotient maps, so they give the required contraction in the stated category.

Novelty not established; scoped to the inspected author chapter.

- Author K-book page and indexed errata search on2026-10-02; direct author errata PDF URL returned404. Published edition not inspected.

### GeneralAlgebraicKTheory/E-frobenius-factorization-domain

Remark11.2 p.20/PDF20, text and image inspected

The projection has domain B⊕I, following the preceding graph inflation A↣B⊕I.

The actual composite is pr_B∘(f,i)=f. The stated A⊕I domain is not composable with that graph.

Novelty not established; discrepancy scoped to the hashed2003 preprint.

- 2026-10-02 author research/publication and title+errata searches found no independently inspected correction; published2006 text not compared.

### GeneralAlgebraicKTheory/E-fp-functors-cokernels

Lemma10.3 proof, p.18/PDF18, text and image inspected

Finitely presented functors are closed under cokernels and extensions; representables are projective and their extensions split, but their arbitrary cokernels need not be representable.

On finite free abelian groups, coker(Hom(−,ℤ)→×2 Hom(−,ℤ)) has value ℤ/2 at ℤ and cannot be represented by a finite free object. The subsequent argument uses finite presentations and effaceability to deduce the closure of fpC.

Novelty not established; discrepancy scoped to the hashed2003 preprint.

- 2026-10-02 author research/publication and title+errata searches found no independently inspected correction; published2006 text not compared.
