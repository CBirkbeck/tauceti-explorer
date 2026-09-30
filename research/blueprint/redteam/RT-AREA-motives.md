# RT-AREA-motives — partial countermodel audit

**Job:** #1519, `RT-AREA-motives`  
**Agent/session:** ChatGPT / `gpt6-c84e12`  
**Date:** 2026-09-30  
**Status:** partial; four findings submitted for independent verification.

This checkpoint concerns the prerequisites and boundary cases of MC.5's Nori construction. It does **not** certify an area-wide sweep of motives, the entire 173-node packet, or every paper routed to the area. The remaining reading and searches are in the handoff. The earlier corrective review already repaired substantial mathematics and correctly left the packet partial; the findings below concern defects still present after that review, not defects already repaired there.

## Frozen evidence and reading boundary

Repository snapshot: `9e5711ed24aed8212edb0430435098ad34932adc`.

- Packet: `research/blueprint/packets/MotivesAndAlgebraicCycles.json`, blob `21b0e327e658538fe64f7ab9ec9ce307e1ce06b0`.
- Suggested signatures: `research/blueprint/suggested/MotivesAndAlgebraicCycles.lean`, blob `ec2f2f0926d4fd34845ad283851fcbe5609c1dd0`.
- Baselines: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The campaign document and all eight stage descriptions were read, along with the previous blueprint review, the reviewed AUDIT-35 report and the BP handoff. Their assertions about compilation, exhaustive searches and source collation are historical evidence, not work repeated in this session. The RS-08 roadmap-level decision was read; a full cross-restructure and cross-roadmap ownership sweep remains outstanding.

The packet inspection covered its header, selected baseline/source entries, selected MC.0/MC.3/MC.4 nodes, and the MC.5 nodes for finite comodules, universality, generation, singular cohomology, the Basic Lemma and cellular realisation. E30–E37 were consulted where relevant. The suggested file was read at its header and the specific declarations cited below, not in its entirety.

Two baseline checks were made directly at the exact pins:

1. `TauCeti/AlgebraicTopology/Singular/Relative.lean`, lines 130–200: `TopPair.singularHomology`, `singularHomologyMap` and `singularHomologyFunctor` are concrete relative homology constructions, indexed by `n : ℕ`. Connecting these to an integer-graded abstract record requires actual comparison maps and a negative-degree convention.
2. `Mathlib/CategoryTheory/Abelian/Basic.lean`, lines 20–110: the abelian-category interface includes finite products and preadditivity, hence a zero object. This is used in finding 4; no library-absence claim is involved.

Primary-source context: Huber–Müller-Stach, *On the relation between Nori motives and Kontsevich periods*, arXiv:1105.0865v5, 21 May 2014, available at <https://arxiv.org/pdf/1105.0865>. The fetched header identifies v5. The relevant text includes Definition 1.1, Proposition B.9 and Appendix D. Final screenshot rechecks failed, while parsed text remained accessible; no fresh PDF-byte hash or published-version collation was obtained. These are not new claims against the published version. In particular finding 3 supplies a concrete missing premise at the locator already recorded as E31, rather than creating a second historical source-issue identity.

## Findings at a glance

| ID | Severity | Defect | Repair owner |
| --- | --- | --- | --- |
| 1 | High | The zero homology theory satisfies the proposed interface but contradicts its rank-one theorem. | MC.5 singular-cohomology adapter; import SF.2 and pinned relative homology |
| 2 | High | The very-good-pair predicate loses the degree-zero point; its point test assumes an impossible hypothesis. | MC.5 pair predicate and Basic Lemma acceptance |
| 3 | High | The cellular-realisation input need not lift singular cohomology through its faithful exact functor. | MC.5 cellular realisation and its downstream comparisons |
| 4 | Medium | Binary-sum closure omits the zero object in generic diagram generation. | MC.5 diagram-category generation |

## 1. The abstract homology record admits the zero theory

**Locations.** Suggested file, lines 6270–6490: the entire `PairDiagram.PairHomology` structure, `singularRep` and `singularRep_gm`. Packet: `MC.5/singular-cohomology-representation`; consumer `MC.5/diagram-localisation`.

The record contains finite-dimensional vector spaces, functorial pushforwards, triple boundaries, exactness, boundary naturality and a conditional Künneth equivalence. It contains neither a comparison with the actual singular-homology functor nor a point or multiplicative-group normalization. Nevertheless `singularRep_gm` asserts rank one for an arbitrary value of this record.

Here is a model of **every field of that record**:

\[
H(X,Y,j)=0\quad\text{for all }X,Y,j.
\]

Use the unique linear map for every pushforward and boundary. Each space is finite-dimensional. Its identity map is the unique map, so the identity and composition axioms hold. At every term of a triple, both the image and the kernel are the zero subspace, so exactness holds. Naturality is an equality of unique maps. The Künneth premise holds for every second pair, and the conclusion is the unique linear equivalence

\[
0\simeq 0\otimes_{\mathbb Q}0.
\]

The proposed singular representation takes the rational dual of these spaces. It is therefore still zero, including at `(G_m, {1}, 1)`, and its rank is **0**, not **1**. The failure is in the theorem's parameters, irrespective of its `sorry` body. Filling that body is not the remedy.

This matters to the dependency chain: the rank-one hypothesis is explicitly required by `Diagram.Rep.extend` in the same file (lines 6070 ff.). The mathematical localization result is not wrong; its concrete rank-one supplier has not been correctly expressed.

**Repair.** MC.5 should connect its record to the actual relative singular homology of the SF.2 complex-points functor. Give natural comparison isomorphisms and require their compatibility with pair maps and triple boundaries. Account explicitly for the pinned carrier's natural-number grading versus the proposed integer grading, with negative degrees zero. Then prove the point and multiplicative-group calculations for that concrete or explicitly compared theory. A bare `Nontrivial` hypothesis does not supply rank one or the required naturality. Retain the weaker generic interface only for the statements it actually implies, and keep this zero model as a negative test.

## 2. The point is not very good in the proposed predicate

**Locations.** Suggested file, `PairDiagram.IsVeryGood`, lines 6270–6490, and the later point example, lines 6490–6640. Packet: `MC.5/effective-pairs-diagram`, `MC.5/basic-lemma`, `MC.5/cellular-realisation-functor`.

The nondegenerate dimension clause is encoded using a natural number `n` and the equation

\[
i=n+1.
\]

The other clause requires `Y = X`. At the point vertex `(Spec ℚ, ∅, 0)`, the first clause requires `0 = n + 1`, which has no solution in natural numbers. The second requires the empty subset to be the entire spectrum. That spectrum is nonempty, with its zero prime ideal. Thus

\[
\neg\operatorname{IsVeryGood}(\operatorname{ptVertex})
\]

holds independently of which `PairHomology` is supplied.

The packet's own Basic Lemma acceptance explicitly includes dimension zero with empty `Y`. Its filtration begins with the degree-zero stratum, as in the cited source's Definition 1.1(3)/D.1(3) and Corollary D.11. Therefore this is a mismatch with the intended mathematics, not an optional exclusion.

The suggested point test does not catch it: that example takes `h : IsVeryGood Hs ptVertex` as an argument. The premise is impossible under the present definition, so any conclusion under it is vacuous. A theorem statement that elaborates under such a premise is not an acceptance test for the actual point.

**Repair.** Add a degree-zero clause with `Y` empty and `X` zero-dimensional, or use a dimension convention that represents the empty preceding stratum consistently. Preserve the positive-dimensional and degenerate cases. Prove the point is very good for the actual singular theory, and use that proved fact in an unconditional point computation. A finite reduced zero-dimensional scheme is a useful additional boundary case. Do not remove the first filtration term or retain the impossible hypothesis in the test.

## 3. A faithful exact functor does not identify the input with singular cohomology

**Locations.** Packet `MC.5/cellular-realisation-functor`, its statement and fifth proof step; suggested file `CellularRealisation`, especially `cellularRealisation_forget`, lines 6490–6640. Related historical locator: E31.

Both versions quantify over a representation `T` of the very-good-pair diagram in an abelian category `A`, together with a faithful exact functor `f_A` to finite-dimensional vector spaces. Neither requires an isomorphism from `f_A` composed with `T` to the specified singular-cohomology representation. The packet's proposed proof then compares through that functor as if the identification had been supplied.

There is a direct counterexample to the generic contract that does not depend on the faulty point predicate in finding 2. Take genuine singular homology for `Hs`. Let `A` be the zero rational-linear abelian category: it has one object and one morphism. Consider the functor

\[
f_A:A\longrightarrow\operatorname{Vect}_{\mathbb Q}^{\mathrm{fd}}
\]

sends the sole object to the zero vector space. This functor is **faithful**: the map on each relevant Hom set is a bijection between singletons. It is additive, rational-linear and exact; all its finite limit and colimit comparisons are comparisons of zero objects. There is a unique representation `T` of any diagram in `A`, including the proposed very-good diagram.

Every complex in `A` is zero, and its derived category is zero. Consequently **every** functor with values in that derived category has zero underlying cohomology after applying `f_A`. But `cellularRealisation_forget` at `Spec ℚ` in degree zero requires an isomorphism from that zero vector space to the genuine `H^0(Spec ℚ(ℂ); ℚ) = ℚ`. This is impossible.

This is not the incorrect assertion that a zero functor on a nonzero category is faithful. Its source here really is the zero category. The example isolates precisely what the current assumptions permit. Alternatively, the cellular construction from a zero representation cannot recover nonzero singular cohomology without a comparison premise.

**Repair.** Require a specified isomorphism of diagram representations

\[
\eta:f_A\circ T\xrightarrow{\sim}H^*|_{\widetilde D^{\mathrm{eff}}},
\]

compatible with every functoriality and coboundary edge. Carry this datum through the cellular complexes, refinement comparisons and derived forgetful comparison. State the coefficient-linearity assumptions used in those constructions. In the intended Nori application, instantiate `η` from the diagram-category factorization rather than leaving it implicit.

The cited v5 Proposition D.3 and the packet's E31 are the existing source locus. E31 currently lists omitted verifications and the good/very-good domain issue; it does not supply this missing premise. The fixer should refine that repair with its version provenance, not claim that the intended Nori result is false or silently overwrite a prior source judgment. The separate boundedness, triangulatedness and refinement obligations remain after `η` is added.

## 4. Generation by binary sums fails for the empty diagram

**Locations.** Suggested file, `Diagram.category.generation`, lines 5700–5860; `Diagram.discrete` and `Rep`, lines 5480–5640. Packet: `MC.5/diagram-category-generation`.

The first conjunct of the proposed theorem says that any predicate `P` containing all generating vertices and closed under **binary** biproducts, subobjects and quotients holds on every object. There is no premise that `P` contains a zero object.

The empty vertex type is allowed by `Diagram` and explicitly by `Diagram.discrete`. Take that diagram, its unique representation, and the constantly false predicate on its diagram category.

Every generator premise is vacuous because there is no vertex. Binary-biproduct closure is an implication whose premises include `P(X)` and `P(Y)`; subobject and quotient closure likewise assume `P` of some object. All these implications are true for the constantly false predicate. The conclusion then states that the predicate holds for every object.

However, this category is declared abelian, and hence has a zero object, as the directly inspected Mathlib interface confirms. Evaluating the conclusion there gives `False`. This is a logical counterexample to the actual first conjunct, without needing any nontrivial coalgebra calculation.

The packet and Proposition B.9 concern generation as an abelian category/under finite sums. The empty sum is part of that notion. It was lost in the suggested binary-only encoding.

**Repair.** Add `P(0)` to the premises, or express closure under every finite biproduct including the empty index. No new roadmap is needed: this remains the generic MC.5 generation lemma. An empty-diagram regression should verify that the generated category contains a zero object and that every object is zero. Imposing a nonempty-diagram hypothesis would avoid the counterexample but unnecessarily weaken the intended generic API.

## Checks performed and limits

The unmodified repository checker was run on the actual result file:

```text
python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-motives.result.json
```

It returned `ok`. This was a local run of the copied checker, not a full checkout or atlas rebuild; **no ID-only projection was used for this job**. The checker has Git blob hash `c736ae33fd46ec11c6e718be27479d9d5a520211`. A supplemental check verifies four distinct finding IDs, three high severities, one medium severity and `status: partial`.

The countermodels above are mathematical arguments checked against the complete relevant records and signatures. They were **not compiled in Lean**, and no `#print axioms` audit was performed. In particular, the earlier review's reported elaboration of `sorry`-bearing suggestions is not treated as proof of their statements. None of these four findings depends merely on the presence of `sorry`.

Only the two red-team deliverables and the partial handoff are submitted. The packet, source-issue ledger, suggested Lean, ownership records and generated data are unchanged. Independent verification and any subsequent repairs remain separate jobs.
