# FIX-RT-PAPER-BENOIST-WITTENBERG-20

All three independently confirmed findings are applied. The extraction now uses Geyer's actual Picard descent map, restricts algebraic perfect duality to finite stalks, and restores the correct positive pushforward-degree shift in E5. Its 193 item statuses and seven route memberships are retained.

Worker: **Codex**, session **codex-rtOQ9t**, 2 October 2026. Refs [#5510](https://github.com/CBirkbeck/tauceti-explorer/issues/5510). Base: `695be4285859480286f1dcf7ad31d8f0441d14e3`. This session authored the earlier red team, which was independently verified before the repair was claimed. This submission is a fix, not a self-review verdict. Only the three authorized deliverables change: the paper result, reader and this fixes report.

## 1. Restore the Geyer descent arrow

**Changed:** /geyer's active statement and proof steps, a compatibility note in /phi-genus, and the reader. The MC.7 owner and /pic-descent-parity are unchanged. No source erratum is added for this extraction reversal.

Published Lemma 3.7 on p.50 concerns `Pic(B)[2∞]→Pic(B_C)^G[2∞]`, for a smooth proper geometrically integral curve B over a real closed R, with B(R)=∅. Its surjectivity criterion is even genus. The extraction had substituted the following Brauer-obstruction arrow to Br(R)=F₂. Restricted to invariant 2-primary torsion, that obstruction is zero in even genus and onto in odd genus.

The source proof explains both parities. Exact sequence (3.6) embeds Pic(B) in invariant complex Picard classes, with cokernel Br(R). In even genus, a torsion class has degree zero, so Sublemma 3.8 makes it descend. In odd genus, choose a nondescent class; after a closed-point twist it has degree zero. Its double descends. Divisibility of Pic⁰(B) lets one subtract a real class with the same double, giving a nondescent invariant 2-torsion class. The descent arrow is therefore not onto in odd genus. This argument distinguishes the two maps rather than changing the parity of the source lemma.

**Anisotropic-conic regression:** over ℝ the smooth conic `x²+y²+z²=0` has no real point and genus zero. Its complexification is P¹, with Picard group Z and no 2-primary torsion. Thus descent on torsion is `0→0`, which is onto, while the obstruction on torsion is `0→F₂`, which is not. On the full invariant Picard group, descent is multiplication by two and obstruction is degree modulo two; the full obstruction must not be confused with its torsion restriction. This is an acceptance case for MC.7 integration.

**Consumer check:** on pp.49–50, normalize the curve and use the proper-pushforward square. Theorem 3.3 and corrected Geyer identify the normalized curve's ψ-surjectivity with surjectivity of Picard descent on torsion, hence with even genus. Conjugate components contribute zero through the norm map. The /phi-genus statement remains valid. Its transitive consumer statements were checked: main-even-genus, main-no-pic2-genus, surface-genus, threefold-criterion, real-hc-criterion, euler-cycle-map, karpenko-quadric, quartic-hodge-empty and enriques-even. This correction introduces no parity reversal in those conclusions. The existing E1 exclusion for dimension-one varieties with real points remains in the main even-genus contract.

## 2. Require finite stalks for algebraic perfect duality

**Changed:** /semialg-duality, the EquivariantTopologyRealVarieties brief and reader. New E11 records the inherited coefficient omission in published §1.1.4, equation (1.16), p.14. It has no fabricated source-issue review verdict.

The active statement requires a locally constant sheaf of finite abelian groups, rather than merely finite exponent. The algebraic perfect-pairing contract means that both adjoints to Hom(−,Q/Z) are isomorphisms. Finite point-stalk evaluation, the excluded infinite exponent-two example and compatibility with finite consumers are named acceptance cases.

For the excluded example take V to be one point, `M=⊕_N F₂` and `M^∨=∏_N F₂`. The product modulo its finite-support subspace is nonzero: the all-ones sequence has nonzero image. Choose a nonzero F₂-linear functional on that quotient and pull it back to the product. It vanishes on all coordinate vectors but is nonzero. Evaluation by a finite-support element of M is a finite linear combination of coordinate projections. If it vanishes on every coordinate vector, all its coefficients are zero. Consequently the chosen functional is not an evaluation, and `M→M^{∨∨}` is not onto. This proves the obstruction without claiming that finite truncations can reproduce an infinite-dimensional failure.

The cited supplier [SGA4 XVIII §3.2.6](https://www.normalesup.org/~forgogozo/SGA4/18/18.pdf), marginal printed p.586, retyped PDF p.78, explicitly assumes locally constant constructible Z/n-module coefficients. Its derived-duality and cohomology passage supports the finite-coefficient contract; it does not justify discarding constructibility in a claim about two-sided algebraic biduality. This supplier passage was independently inspected visually for the repair.

**Preserved consumers:** /complement-duality already assumes a finite G-module. /psi-real uses F₂. /integral-pontryagin separately states finite generation, profinite completion, Pontryagin duality and the limit proof obligation. Their records remain unchanged. No broader continuous-dual theorem is silently substituted for algebraic perfection, and GAP-SEMIALG/GAP-DUAL-LIMIT remain deferred. The shared Part II brief now carries the finite-stalk restriction and the distinguishing tests to its design/blueprint job; the sibling paper and upstream Algebraic Topology roadmap are not edited.

## 3. Correct E5's introduced sign

**Changed:** E5's correction text and its reader copy. The previous correction is retained in `correctionBeforeRepair`, and a repair note separates the extraction error from the published typo. The original review record is unchanged: it confirmed the domain correction and explicitly reported that it could not resolve the target exponent.

The image of published p.19 shows target `H^{p+c}(X(R),F₂)`, with `c=dim X−dim Y`. Only the domain's printed variety is wrong; it should be `H^p(Y(R),F₂)`. The active /real-push-coordinates item already had this positive shift and remains unchanged. No second source mistake is invented for the correct printed sign.

**Regression:** for a real point included in P¹, c=1. The degree-zero generator pushes to the nonzero point class in `H¹(RP¹,F₂)`. A shift to p−c would land in H⁻¹=0. The mod-two circle cellular complex has one degree-zero and one degree-one generator with zero differential, giving the distinguishing groups and pairing with the fundamental class. This control is passed to the Part II brief.

## Source/version discipline and scope

The primary source is Olivier Benoist and Olivier Wittenberg, *On the integral Hodge conjecture for real varieties, I*, Inventiones mathematicae 222 (2020), 1–77, [author-hosted published PDF](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), [publisher article](https://link.springer.com/article/10.1007/s00222-020-00965-8). The fresh download has 77 pages and SHA-256 `daeb43ec861bd6c30564543dac796c55c7f21aa943c442f826b32613e72a46a9`, matching the extraction and red team. Read pp.13–15,18–19,49–55, and inspected images of pp.14,19,50. These are the published numbers, not the differently numbered 67-page preprint.

SGA4 XVIII was downloaded with SHA-256 `458851856ba253e0a6047adb15da13a9124c9fe2ac922b214f2ac8c27b7abbc5`; the bounded supplier reading is §3.2.6 and its immediately preceding duality context on PDF p.78. `sourceVersions` records both sources and their actual scopes. No fresh full-paper, full-SGA or preprint collation is claimed.

Fresh correction checks on 2 October 2026 covered the publisher article, [Benoist's publications](https://www.math.ens.psl.eu/~benoist/), [Wittenberg's publications](https://www.math.univ-paris13.fr/~wittenberg/), [arXiv history](https://arxiv.org/abs/1801.00872) through v3 (11 March 2020), Crossref DOI metadata (`relation={}`, no `update-to`/`updated-by`) and bounded title/author/DOI erratum/corrigendum searches. No relevant correction was located. The authors' listed 2025 erratum concerns *Intermediate Jacobians and rationality over arbitrary fields*, not this paper. These checks do not prove exhaustive novelty or exclude unpublished corrections.

The affected contracts, their consumer statements, the Part II brief and MC.7's current description were inspected. No claim is made to redo the earlier 193-item source audit, whole-library absence search or global atlas audit. The seven library statuses, original baseline and prior exact-declaration evidence remain unchanged at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

There are no new identifiers, owners, route memberships or item prerequisite edges. The original graph is rechecked for dangling prerequisites and cycles; the broad-stage integration-order gap is preserved. The missing mathematical restrictions and regression cases are placed in the existing item contracts and owning Part II brief, without inventing a new roadmap or bypassing the deferred supplier proofs.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BENOIST-WITTENBERG-20.result.json`
- `python3 research/blueprint/intake.py check-files` on the three deliverables.
- Shared source-issue and source-version validators, including the new E11 record.
- Baseline preservation of all 193 IDs/statuses (7 library, 9 planned, 177 missing), 190 unrelated item records, all original prerequisites, seven owner/membership records (21,5,4,28,67,49,3), and single routing of all 177 missing items.
- Preservation of baseline/source/coverage/provenance/gaps, all ten original review records, and nine unrelated source-issue records; E5 retains its old wording separately.
- Exact conic Picard-sequence, finite point-stalk evaluation and positive-degree cellular-cohomology diagnostics, together with the mathematical proofs above.
- Item dependency acyclicity, no dangling prerequisites, three-file scope and `git diff --check`.

No Lean deliverable is required or compiled. No library build, cache download, new Lake project or language server was run. The executable controls are exact supporting calculations; they do not formalize Picard descent, semialgebraic duality or geometric pushforward.
