# Independent review: KTheoryLowDegrees U.6

**Accepted as a complete planning pass.** Issue #7550; reviewer Codex, session `codex-5GLOHQ`, independent of writer session `codex-C9FSaX`. Reviewed on 9 October 2026. U.6 remains **planned**, with six proof/supplier gaps and three precise requests; no stage is closed and no proof is claimed implemented. The review object contains a separate verdict and reason for every node.

| Measure | Before | After |
| --- | ---: | ---: |
| Nodes | 24 | 26 |
| Constructions | 1 | 1 |
| Lemmas | 17 | 18 |
| Comparisons | 3 | 4 |
| Theorems | 3 | 3 |
| API items / unit tests | 3 / 4 | 3 / 4 |
| Baseline declarations | 8 | 10 |
| Source findings | 0 | 3 |
| New planets / assembled U.6 planets | 1 / 6 | 1 / 6 |

The final node verdicts are 19 verified, five corrected and two added. The accepted U.1 packet supplies all 14 inherited U.6 targets. The Z.3 packet supplies the projective graded determinant and its spectrum extension. Neither is replanned. The recursive fine-node prerequisite audit reaches 357 nodes with no cycles or unresolved node IDs; stage prerequisites remain owner contracts, rather than proofs certified by this graph check.

## Corrections

1. Split `double-congruence-stable`: the added lemma `double-congruence-stabilisation` states finite-rank compatibility, while the existing node now states the stable comparison. Finite representatives and equality after stabilisation justify passage to the limit. The inverse compatibility follows from the finite equivalences.
2. Split `projective-loop-class`: it now states only the classical class identity. The added lemma `projective-loop-determinant` states the determinant consequence and imports the class identity, determinant-on-π₁ theorem and translated-loop evaluation. Both additions carry `addedBy: REV-KTheoryLowDegrees--U.6`.
3. Narrow `ring-spectrum-det-pi-one-natural` to its new determinant equation. The naturality of θ is already owned by the parent absolute comparison and remains an import, rather than a second target.
4. Replace the exterior expansion in `graded-det-free-map` with the existing Tau Ceti scalar theorem and top-exterior identification. This node still supplies the missing bridge to the graded determinant functor's morphism; it does not reprove the free exterior calculation.
5. Correct the degree-zero naturality proof sketch: remove its stray degree-one sentence and identify the induced map on the kernels defining K₀(I).
6. Synchronise the reader and all suggested omission statements/prerequisites. The suggested file has 24 exact omissions after the two additions. Its two active node signatures, two further API signatures and four examples remain mathematical planning placeholders.
7. Carry forward three source findings with fresh independent verdicts, readable-version limits and prior attribution. Add source-version records. No source passage or excerpt was copied.

## Sources and baseline

Both author PDFs were independently downloaded and read at every node locator. Their hashes match the packet. Weibel's [29 August 2013 combined draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) was checked at II Exercise 2.3, printed p.78; III.1.1.1 p.180, Lemma 1.6 p.185, Lemma 1.7/Corollary 1.7.1 p.187, relative definitions/Proposition 2.3 pp.193–194, Exercises 2.3/2.7 pp.196–197, Definition 5.7/Theorem 5.7.1 pp.222–223; IV.1.1–1.11 pp.260–268 and Exercise 1.15 p.275. Physical PDF pages are printed pages plus eight. The double-ring calculation is direct algebra. Exercise IV.1.15 is a strategy, not a supplied proof of the two unsplit fibre maps or their connecting-map compatibilities.

Bhatt–Scholze's [61-page author copy](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf) was checked at Construction 5.1/Proposition 5.3 p.18 and the relevant §12 interfaces pp.54–59, especially Proposition 12.3, Corollary 12.12 and Corollary 12.17. The corrected signed monoidal structure, group-completion unit and automorphism edges are the required interfaces. The source's infinite-loop machinery references remain supplier obligations.

The empty `sourceIssues` list missed two harmless misprints: the nerve arrow count on p.55 and the missing delooping symbol in Remark 12.11 on p.58. These were already confirmed in the reviewed paper extraction as E19/E20; the second is also KTheoryLowDegrees/E20 in Z.3. The nerve count is carried here as KTheoryLowDegrees/E31 to avoid the existing roadmap E19 identifier. Construction 12.5's missing nullary unit constraint, already KTheoryLowDegrees/E22, is also carried forward: an idempotent discrete monoid detects the generic omission, although the unit condition is forced in the projective/direct-sum and Picard applications used here. All three were independently checked in the author copy and [arXiv v3](https://arxiv.org/pdf/1507.06490v3). Publisher and author pages and prior reviewed findings were checked for corrections. The publisher PDF request returned HTML; no finding accuses the unread version of record. The packet records this limit.

Every baseline declaration's exact statement and enclosing hypotheses were read at its pin:

| Pin / module | Confirmed declarations |
| --- | --- |
| Mathlib 082e2d3, `RingTheory/LocalRing/Pullback` | `RingHom.pullback`, `RingHom.pullbackFst`, `RingHom.pullbackSnd` |
| Mathlib 082e2d3, `Data/Matrix/Basic` | `RingHom.mapMatrix` |
| Mathlib 082e2d3, `Algebra/Group/Units/Hom` | `Units.map` |
| Mathlib 082e2d3, `Algebra/Group/Subgroup/Ker` | `MonoidHom.ker` |
| Mathlib 082e2d3, `LinearAlgebra/Matrix/GeneralLinearGroup/Defs` | `Matrix.GeneralLinearGroup.det` |
| Mathlib 082e2d3, `Data/ZMod/Basic` | `ZMod.castHom` |
| Tau Ceti f790474, `LinearAlgebra/ExteriorPower` | `exteriorPower.topEquiv`, `exteriorPower.map_top_eq_det_smul` |

No original citation was removed or replaced. The last two citations were added to honour the reviewed audit's existing free exterior calculation. The explicit-basis scalar theorem has no `Nontrivial` hypothesis, so it supports the zero-ring case. The active Lean forms use only Mathlib; the Tau Ceti declarations were inspected in the pinned git object rather than inferred from the shared build's later HEAD.

## Closure, ownership and acceptance

The algebraic double equivalence works over associative rings without assuming q surjective. Normal-closure image equality uses the diagonal section to lift elementary conjugators; it does not assert general K₁ excision. The split fibre calculations use the section to kill the preceding LES boundary. The unsplit π₀/π₁ comparisons are separate explicitly open gaps. Naturality and inclusion statements are consequences of their specified fibre square and split-kernel identifications once those gaps are filled.

The two connecting-map equations retain fixed comparisons and path conventions. Neither exactness nor equality of kernels establishes their sign or representative-level normalisation. T.1:plus and T.6 requests refine existing κ and β, and K.4:construction must supply comparison under the projective nerve's unit. K.5's current early ring model introduces no return path to this U.6 comparison. The H.1/H.3/H.4/H.5 and K.2:plus plans retain their proof boundaries; acceptance does not certify these suppliers.

The determinant theorem reduces to free automorphism edges and finite representatives. Projective complements give the general class identity without constant rank. Transfer retains finite-free right-module and chosen-basis conventions and does not silently assume a norm theorem. The single construction's three API items, equivalence structure and four tests suffice for its uses; the mod-four inverse test detects an incorrect projection or diagonal lift.

Confirmed RT-AREA-ktheory-1/9 is respected: U.6 owns K₁(ℤ), Z.6 owns K₀(ℤ), T.5 owns the stated degree-two arithmetic computations and tame-kernel rows, and N.6 owns certificate-driven presentations. The packet records the directed imports/rescope as proposals; it does not claim consumer fixes have already been integrated. The five parent planets plus the one new determinant comparison planet remain appropriate. The audit shows no planned replacement of a library declaration or another owner's object.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.6.json` reports zero errors and warnings. Exact packet-to-suggested correspondence and source-issue/version schemas were checked. `lean-check` successfully elaborated the suggested file at pinned Mathlib, with eight `sorry` warnings and no other warnings or errors. It does not elaborate the 24 omitted carrier-dependent signatures. `git diff --check` passed.

No orchestrator question blocks this review. The next planning work must fill the two unsplit comparison proofs, both boundary computations and the three supplier requests, importing the existing owners' actual carriers and proofs. This is a finished independent review, not a checkpoint.
