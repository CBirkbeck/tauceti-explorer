# Hacon–Witaszek: relative fourfold MMP

## Status and scope

Partial checkpoint for #1369, by Codex, session codex-a71f92. The **published paper has been read completely**. This is not a closed transitive proof extraction: source defects and named unread proof frontiers remain. No result is claimed formalized.

The result file contains 156 items: 10 library carriers/theorems, 5 planned interfaces and 141 missing items. All missing items have exactly one route. The 353 dependency edges are acyclic. All 44 definitions/constructions have use-derived API outlines and three mathematical planning tests (132 total).

The paper proves two special relative fourfold MMPs, not the general fourfold MMP:

- **Theorem 4.1:** Q-factorial dlt fourfolds birational over a normal Q-factorial target, with exceptional locus in the floor boundary, over perfect fields of characteristic greater than five or the stated mixed-characteristic DVRs. Standard coefficients suffice; otherwise the strong non-snc-blowup log-resolution assumption is required.
- **Theorem 5.1:** arbitrary MMP sequences for the specified standard-coefficient dlt fourfolds over a DVR terminate when the generic adjoint has nonnegative Iitaka dimension and the special support lies in the floor. The standing strong-resolution hypothesis remains. In equal characteristic, the model must spread over a curve over an algebraically closed field.
- **Theorem 6.1:** for a flat projective lift of a terminal Q-factorial threefold with pseudoeffective canonical class, some possibly non-Q-factorial minimal model lifts. With surjective restriction on rational numerical divisor classes, every chosen MMP sequence and every Q-factorial minimal model lift. With big canonical class, the canonical model lifts. Resolutions are assumed for pairs birational to the **total space**.
- **Theorem 6.2:** the birational liftability statement for terminal Q-factorial Calabi–Yau threefolds requires a **complete** DVR. The source convention includes trivial canonical sheaf and vanishing of intermediate structure-sheaf cohomology.

Other outputs include adjoint-section extension, pl-flips with an ample boundary component, conditional special termination, Witt-rational klt fourfold singularities, the finite-field point congruence with an RCC resolution, dlt modifications and inversion of adjunction. The result file splits the principal theorem conclusions.

## Sources and exact reading boundary

Primary source: Christopher Hacon and Jakub Witaszek, *On the relative minimal model program for fourfolds in positive and mixed characteristic*, Forum of Mathematics, Pi 11 (2023), e10, pp.1–35, [DOI 10.1017/fmp.2023.6](https://doi.org/10.1017/fmp.2023.6).

The published PDF was acquired on 22 September 2026; SHA-256:

`d7ba34ecde6764ca39071e14e79854e3c8e8db0750343c0dcc1729b84eda328b`.

All sections and references were read, with separately inspected images of pages 5, 6, 12 and 13. The [arXiv v2](https://arxiv.org/abs/2009.02631v2) was compared only at the difficulty/Lemma 2.16 passage; it was **not** fully collated. Its SHA-256 is `161c63089dadc8f9aecd3da1753563fe8f7f9fc2b2722952307cd19bacda7c66`. No claim of an author-approved erratum is made.

The machine-readable reading log records URLs, hashes and bounded reading for:

- [AHK07](https://arxiv.org/abs/math/0605137): §§1–2 through Theorem 2.15, plus Lemma 3.1's statement. This is a characteristic-zero source; transfer is not automatic.
- [BMPSTWW v3](https://arxiv.org/abs/2012.15801v3): selected full proof blocks in §§2–4,6–7, plus 9.32–9.37, not the whole 132-page paper. In particular, the Matlis/local-cohomology, absolute-closure vanishing, adjoint stable-section and inversion-of-adjunction blocks were inspected. Their Bhatt/Popescu and lower-MMP dependencies remain open.
- [Witaszek's relative semiampleness paper](https://arxiv.org/abs/2106.06088): Theorem 1.2's statement and all of §2.4, including Theorem 2.22's proof. The full fibrewise theorem proof is not yet read.
- [de Fernex–Hacon](https://arxiv.org/abs/0901.0389): the characteristic-zero convention, Proposition 3.1's complete proof and neighboring corollary/remarks.
- Stacks [08Z9](https://stacks.math.columbia.edu/tag/08Z9), [08BE](https://stacks.math.columbia.edu/tag/08BE), its [08B7 setup](https://stacks.math.columbia.edu/tag/08B7), [09ZT](https://stacks.math.columbia.edu/tag/09ZT) and [09ZW](https://stacks.math.columbia.edu/tag/09ZW): the selected statements/proofs, not their transitive closure.
- The preceding partial PAPER-WITASZEK-22 extraction: its entire 46-page preprint reading and bounded Keel/CT20/quotient/descent audit are reused with their existing gaps.

The source list also gives direct primary pointers for the still-unread ABL22, Ber21, Waldron, CR12, BBE07, NT20, GNH19 and Schwede proofs. Locating an abstract is not counted as reading its theorem or proof.

## Source diagnostics: do not silently repair

### 1. Lemma 2.2's canonical index

The published page 5 image says that the Cartier index of **K_X** at a codimension-one point of the boundary controls every Weil divisor and gives the different coefficient. This cannot be used literally.

Over an algebraically closed field of characteristic greater than five, put

```text
X = Spec k[x,y,z]/(xy-z²),   S = V(x,z).
```

The minimal resolution has charts

```text
(x,z,y) = (u,uv,uv²),      (x,z,y) = (st²,st,s).
```

Its exceptional curve E has self-intersection −2. On the second chart, the strict transform S′ is t=0 and E is s=0. Since div(x)=2S, the pullback is S′+E/2. The canonical form dx∧dz/x becomes du∧dv and −ds∧dt, so the resolution is crepant and K_X is Cartier. The local ideal (x,z) needs two generators at the vertex and is not invertible there; S has index two. Adjunction on S′ gives different coefficient 1/2. Thus index(K_X)=1 cannot give the asserted universal index or different coefficient.

The pair (X,S) is plt, as its log pullback is the snc pair (resolution,S′+E/2). The plausible **log-index** correction must still be located and proved in the general source setting; this checkpoint does not silently substitute it.

### 2. Difficulty sign and domains

Published page 12 (also the compared preprint passage) indexes the first weighted boundary-rank sum by b_i≤0. [AHK07 Definition 2.3](https://arxiv.org/abs/math/0605137) uses ordinary discrepancy a(B_i)≤0, which with a(B_i)=−b_i means b_i≥0. The distinction matters: W(b)=0 when b≤0.

The main paper also prints the same domain for w and W although W evaluates w at k(1−b), possibly at least one. AHK's w is defined on positive arguments and vanishes at arguments at least one; W has b<1. Before proving positivity, pullback invariance or monotonicity, transcribe all sums and domains and check the base transfer.

The rank in this argument is AHK's resolution rank minus the number of exceptional prime divisors, **not automatically** the ordinary Picard rank of a singular variety.

### 3. Lemma 2.16 needs a boundary restriction

Its printed statement quantifies over all ε-lc excellent surface pairs with at most m distinct resolution discrepancies. The same A1 surface gives an explicit variable-boundary obstruction.

Take B=bS for rational 0<b<1/2. Its log pullback is bS′+(b/2)E. Therefore the exceptional ordinary discrepancy is −b/2 and its log discrepancy is 1−b/2. The boundary component has log discrepancy 1−b. This snc resolution is 1/2-lc for every such b; subsequent point blowups preserve that bound. There are at most two distinct discrepancy values on the resolution (one if only exceptional components are counted), but the exceptional value varies infinitely.

The exact rational sanity check used b=1/n for n=3,…,102 and verified 100 distinct values, the ε guards and the intersection equation b−2(b/2)=0. That bounded computation is not the geometric proof; the chart argument above is the mathematical evidence.

This does **not** refute the intended fixed-boundary flip termination theorem. The missing task is to extract and prove the narrower coefficient/graph lemma actually needed by that sequence. The printed graph proof's self-intersection signs also need correction. No unpublished ACC statement is imported as an axiom.

### 4. Q-Cartier deformation is local first

Main Lemma 6.6 is phrased globally for an arbitrary normal scheme over a DVR. The cited [dFH11 Proposition 3.1](https://arxiv.org/abs/0901.0389) concludes on a **neighborhood** of the central Cartier divisor and states its ambient convention over the complex numbers.

A safe implementation must transfer its local-cohomology proof to the required base, then prove a neighborhood Q-Cartier statement. In the actual projective lifting application, a closed bad locus disjoint from the special fibre can be excluded by properness, after proving the necessary openness/coherence facts. Those are explicit obligations. Related global claims in Corollary 6.7 are kept guarded too.

### 5. Numerical classes are not line-bundle lifts

Theorem 6.1 uses N¹=Pic⊗Q modulo numerical equivalence. Its part (2b) proof asks for Cartier divisors restricting to prescribed divisors, although numerical surjectivity gives only rational numerical representatives, possibly after multiples.

The design job must show that numerical representatives suffice at each amplitude, perturbation and contraction step, or explicitly add an actual Picard hypothesis. Lemma 6.5 really gives Picard lifting, but only with completeness and H²(O)=0; those hypotheses cannot be borrowed for the general theorem.

### 6. Additional guards

- Definition 2.4 uses **floor** rounding; B⁰ trace twists use **ceiling**.
- Adjoint B⁰ uses a direct sum of sheaves before trace. Its images form a sum of submodules, not necessarily a direct sum.
- The B⁰ Weil restriction theorem does not need the extra Q-factorial/strong-F-regular/dimension assumptions of the non-Cartier S⁰ version.
- X⁺ is an inverse limit of schemes, with filtered-colimit structure algebra. Class-by-class finite-cover killing is not uniform killing by one cover.
- A small flip is an isomorphism off a set of codimension at least two; the wording in Theorem 4.3's proof must not be upgraded to an isomorphism in codimension two.
- Proposition 5.2 applies dlt modification to a perturbed general-coefficient boundary although its citation 4.8 is standard-coefficient. Supply the adapter.
- Claim 5.5 leaves an N¹ generation check to the reader. It is now an explicit item.
- Conjecture 5.7 remains conjectural. Mere resolution existence is not the stronger non-snc-blowup hypothesis.
- In the point-count proof, the smooth resolution's cohomology is used in its trace formula. The slope≥1 assertion concerns positive degrees; H⁰ contributes the required one.
- The R-boundary termination statements need a justified bridge to their proofs' Q-linearly effective representatives.

## Library baseline and ownership

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

Actual declarations were opened, not inferred from search hits. Existing material includes the invertible-sheaf carrier, proper/finite/integral morphism predicates, `DerivedCategory`, the **Ext-colimit** `localCohomology` functor, `WittVector` and its map, Frobenius, the Rees regular-sequence/Ext criterion and Nakayama.

Important negative boundaries:

- The local-cohomology file explicitly still needs derived-torsion/Čech comparisons and the geometric package used here.
- Witt-vector rings do not supply rational Witt sheaves or their higher direct images.
- The derived category does not supply Matlis or finite trace duality.
- The regular-sequence criterion does not mean the entire depth/CM API is built.
- Tau Ceti's invertible-sheaf full category is not automatically the Picard groupoid; its noninvertible morphisms must be excluded when taking the core.

Ownership was refreshed against main `fbc1f2dc26a49dd78e582e589f3ecb3265e8f73f`, with reviewed coverage blob `5e708cfc74a51b10e62149113872fe4e00eb5846`. Relevant reviewed entries, roadmap documents and stage descriptions were read. No reviewed entries for CR.4, Adic F0, AnalyticStacks AS.1 or RD.6/RD.7 were found; their stage plans are not library evidence. All 38 current paper-result route sets were screened for direct overlap.

## Routes

| Owner | Missing items | Decision |
|---|---:|---|
| SchemeAndStackFoundations SF.0 | 4 | General divisor/reflexive and absolute-closure indexing foundations |
| SchemeAndStackFoundations SF.4 | 11 | Formal/lifting/obstruction and guarded Q-Cartier deformation adapters |
| SchemeAndStackFoundations SF.5 | 1 | Flat-family intersection constancy |
| DeformationAndDerivedPatchingAlgebra R03.3 | 1 | Missing Matlis/local-algebra refinement; depth itself is already planned |
| AnalyticStacks AS.1 | 2 | Singular coherent duality, finite trace and derived local-cohomology adapters |
| SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry | 103 | New Part II for the source-scoped birational theory and its applications |
| CrystallineCohomologySingularWittRationality | 5 | New Part II for singular rational-Witt cohomological suppliers |
| SchemeAndStackFoundationsMixedCharacteristicPositivity | 6 | Reuse the pending PAPER-WITASZEK-22 Part II |
| NumericalPicardAndContractionDescent | 8 | Reuse the pending PAPER-SCHROER-23 Part II |

The five planned interfaces are general depth/CM, coherent base change, formal existence, Witt sheaves and the rigid/crystalline trace comparison. The new birational extension imports them and does not reconstruct them.

The coherent duality route refines the classical coherent-formalism owner; its smooth Serre-duality target is not evidence that arbitrary singular finite traces are already planned or proved. The singular-Witt extension starts beyond CR.4's Witt complexes and RD.7's smooth proper comparison. It owns the cohomological supplier, while the birational extension owns the singularity predicate and fourfold theorem.

Pending proposals are deliberately marked **missing**, not planned. Reuse their IDs during design; do not mint another positivity or numerical-Picard roadmap. Every Part II brief specifies final theorem hypotheses, imports and acceptance/diagnostic obligations.

## Proof frontier and next pass

There are fourteen named gap records. The highest-priority mathematical repairs are the Lemma 2.2 index, the difficulty definition, the actual fixed-boundary surface lemma, the locality of Q-Cartier deformation and the numerical-lift proof. The main source's conclusions remain theorem targets, not certified consequences of defective lemmas.

Next, decompose the exact Tanaka/DW/HNT/BMP lower-dimensional MMP inputs, ABL/Bernasconi descent and CM results, F-different/S₃/Bertini proofs, CT20/Wit21b/Keel gluing, CR12/BBE/NT20/GNH19 Witt inputs and formal obstruction/algebraization dependencies. The aggregate lower-threefold supplier is explicitly a frontier placeholder to split, not a claim that every theorem in those papers has been extracted.

Only after those repairs and transitive source/library audits should the job become complete. Do not replace a proof obligation with a structure field assuming its conclusion.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HACON-WITASZEK-23.result.json`: passed.
- Custom audit: unique IDs, all dependencies resolved, no cycles, exactly one route per missing item, valid gap references, and three tests plus APIs/uses for all definitions/constructions: passed.
- A1-family bounded rational arithmetic: passed; not a Lean proof.
- Lean: not run; this paper job has no Lean deliverable.

Only the result, this report and the handoff are submitted.
