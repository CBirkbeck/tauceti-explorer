# REV-PerfectoidSpaces--P0: needs changes — checkpoint

Independent reviewer: **Codex — codex-hjdg0j**, 26 September 2026. Refs #470.
The input was written by Claude Code sessions cc-e94dc5 and cc-7b31c4;
the reviewed snapshot is commit `65cc1e33961bd786aedb943df9631eab12f08985`.

**This review is unfinished.** The packet is not accepted, and no node is certified
as fully verified. The `checked` entries record nine bounded corrections. They do
not substitute for checking every dependency, source excerpt, API item and test.
The checkpoint preserves the source work and repairs below for the continuation.

| Item | Independently established in this checkpoint |
|---|---|
| Packet inventory | 324 nodes; 804 API items; 345 tests; 46 planets |
| Original source findings | All 46 examined at their locators; 39 confirmed, 7 rejected |
| Added source findings | 12, E47–E58; 58 total entries, 51 confirmed and 7 rejected |
| Duplicate source findings | E21/E41 and E34/E43; stable IDs retained, two underlying findings |
| Baseline names/modules | All 324 agree with the pinned declaration index |
| Baseline source statements | 32 independently read; 292 remain unread in this review |
| Baseline edits | Four descriptions clarified; no citation removed or replaced |
| Node edits | Nine nodes corrected; no node added or split |
| Gaps and requests | 16 gaps (one added), 13 requests; comprehensive request/supplier audit unfinished |
| Coverage | P1 returned to partial; other author coverage claims are not independently certified |

The relevant RS-05 dispositions and ownership entries, the campaign scope P0–P7,
the author handoff, and the beginning of the 14,475-line blueprint reader were
read. The entire reader was not audited. There is no reviewed PerfectoidSpaces
entry in `data/library-coverage.json` in the input snapshot. Of the cross-roadmap
suppliers, the finite-etale comparison statements in AdicSpacesPartII R0 and
AdicEtaleGeometry A1 were read for E24; this is not a review of all 181 external
node references or the 13 requests.

## Corrections that change the proposed mathematics

1. **The mod-pseudouniformizer category was inconsistent.** Its auxiliary ring
   was Z[x^(1/p^infinity)]/(x). That ring is Z-torsion free, so multiplication by p
   is injective on a flat module over it; a nonzero characteristic-p object cannot
   satisfy the claimed ordinary flatness. The coefficient ring is now F_p, and
   the intended condition is root-ideal almost flatness. The neighboring
   characteristic-p lifting statement and the suggested-file documentation agree.
   The actual Lean predicate is an almost annihilator criterion: its equivalence
   to almost flatness, invariance under almost elements, and field-base comparison
   are an explicit new gap. This checkpoint does not prove the general comparison.
   The claim against ECD Proposition 9.3 (E8) is rejected: its totally disconnected
   base satisfies exactly the flatness supplied by Proposition 7.23.
2. **The p-finite input lost a source hypothesis.** Scholze 2012 Definition 2.6(iii)
   explicitly includes S⁺ = S° in the topologically-finite-type condition.
   Restore it in the node and the actual `IsPFinite` predicate; reject E13's claim
   that Proposition 6.10(i) is wrong. Both preprint and published text were read.
3. **The absolute product proof needed inverse Frobenius continuity.** Its forward
   continuity estimate alone does not give a homeomorphism. For the chart ring
   D = D0[u,v], with a = varpi tensor 1, b = 1 tensor varpi-prime,
   u = a^m/b and v = b^n/a, D0 is perfect. The inverse-Frobenius generators
   u^(i/p)v^(j/p), 0 ≤ i,j < p, satisfy a^(m+1)Phi^-1(D) subset D, hence
   Phi^-1(a^(pk)D) subset a^(k-m-1)D. Both maps extend to completion.
   The node title now says absolute products; the remaining chart prerequisites
   still need the full node audit.
4. **The singular-cardinal argument overreached.** Being a supremum of a
   mu-sequence does not prove that every cutoff kappa(mu) is singular. The
   counterexamples are restricted to kappa(omega_1), which suffices. E40 is
   confirmed in that scope. E34/E43 concern the same false kappa-filtered
   presentation. A repair must use relative hulls containing the image of O(X);
   absolute countably generated hulls do not preserve the base. The proposed
   Cech/cohomology repair is explicitly unverified.
5. **Small full subcategories need not exist.** The extra part (c) of
   `P6/kappa-bounded-pro-etale-presentations` asked for a full subcategory with a
   bounded number of morphisms in an arbitrary index category. A one-object
   cofiltered category coming from a large commutative monoid with zero refutes
   this. Select a non-full subcategory instead, closing the chosen objects and
   arrows under identities, composition and finite cones in countably many rounds.
   The resulting poset is directed; the surviving claim of kappa-directedness in
   the consumer description is removed.

Other node corrections: use the bound 1, not 0, for the empty space's zero ring;
replace the asserted inclusion of an uncompleted colimit into its completion by
the canonical map (the packet already contains the shrinking-disc counterexample);
write the correct intersection with R-prime in the countable-hull boundedness
argument; correct KL I Lemma 2.2.9's locator to p. 31. Coverage P6's stale node
count and its cardinality explanation were corrected. The restructuring detail
and summary were brought into line with these qualifications.

## Source findings

The seven rejected entries are **E6, E8, E9, E13, E23, E31 and E37**. E6 drops
a standing divisibility hypothesis. E8 drops the totally disconnected base.
E13 drops the explicit plus-ring convention. E9, E23 and E31 do not demonstrate
a failed argument: an adaptation using preceding lemmas, standard introductory
reductions, and an explicitly invoked completed-tensor theorem, respectively,
still need blueprint prerequisites but are not established source mistakes.
E37 is the ordinary finite-affinoid-cover extension of a limit statement.

E4, E30, E35, E36 and E42 are confirmed only as missing justifications in the
specified proof passages. No false theorem is asserted by those verdicts. The
individual entries explain the missing argument and the limits of verification.
E11 is a circular invocation; E20 is the tensor-product proof omission acknowledged
by Kedlaya–Liu themselves. E26 and E32 concern the erroneous closed-quotient
warning corrected by ECD Theorem 5.8. E27's counterexample now respects the fixed
base field by taking a perfectoid extension with a residue valuation trivial on
the base residue field. E18/E19 concern actual plus-ring defects, not the valid
ring-level completed-tensor theorem.

| Added ID | Edition and correction |
|---|---|
| E47 | Berkeley author copy p. 33: analytic/nonanalytic slip |
| E48 | Berkeley author copy p. 43: union, not intersection, of inverse Frobenius images |
| E49 | Berkeley author copy p. 61: the absolute product is perfectoid; it need not be affinoid |
| E50 | ECD v4 p. 24: the generalizing subsets lie in X-prime |
| E51 | AWS author copy p. 69: generator-list upper index n |
| E52 | AWS author copy p. 72: finite etale categories over the fixed base A and its tilt |
| E53 | Bhatt notes printed p. 113: free root-polynomial algebra has coefficients A-plus |
| E54 | Bhatt notes printed p. 120: invert t after reduction to characteristic p |
| E55 | AWS author copy p. 58: choose the subset in the tilt before applying sharp |
| E56 | KL I v5 pp. 96–97: omitted uniformity argument, acknowledged in KL II v3 p. 64 |
| E57 | AWS author copy p. 72: missing i on the numerator in the rational-localization formula |
| E58 | ECD v4 pp. 27–28: finite-stage fiber product and morphism are over X_i |

The published Scholze 2012 paper confirms E14 and both occurrences of E22;
the published torsion paper confirms E26/E27, and the published rigid paper
retains E44's narrower-reference mismatch. E45/E46 remain scoped to arXiv v2:
the publisher DOI returned HTTP 403. A downloaded author/preprint copy is never
represented as a collated published book. The three-page rigid-paper erratum was
read and does not address E44. No author was contacted.

Bounded correction searches on 26 September covered the authors' domains for
AWS, Berkeley, ECD and Bhatt's notes. No matching correction to the new slips
was located; this is not an exhaustive novelty claim. Exact source URLs, editions
and SHA-256 values are in `sourceVersions`; the following are physical PDF pages
actually read during this review, not just files downloaded.

| PDF | Physical pages read |
|---|---|
| [ecd-v4](https://arxiv.org/pdf/1709.07343v4) | 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 33, 37, 38, 39, 40, 44, 55 |
| [ecd-author](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf) | 1, 14, 15, 17, 20, 21, 26, 39 |
| [gr-v3](https://arxiv.org/pdf/math/0201175v3) | 9, 16, 46, 72, 103 |
| [berkeley-author](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | 1, 43, 53, 61, 64, 65, 71, 72 |
| [sch12-v1](https://arxiv.org/pdf/1111.4914v1) | 2, 7, 8, 21, 22, 24, 35, 36, 37, 40, 43, 44, 45 |
| [sch12-published](https://numdam.org/item/10.1007/s10240-012-0042-x.pdf) | 10, 11, 28, 40, 47, 48, 49, 50, 53 |
| [aws-author](https://kskedlaya.org/papers/aws-notes.pdf) | 57, 58, 59, 62, 63, 69, 70, 71, 72, 73, 74, 145 |
| [bhatt-notes](https://websites.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf) | 110, 111, 112, 113, 114, 115, 121 |
| [torsion-v2](https://arxiv.org/pdf/1306.2070v2) | 13, 14, 15 |
| [kl1-v5](https://arxiv.org/pdf/1301.0792v5) | 29, 31, 82, 86, 87, 89, 92, 93, 94, 96, 97 |
| [torsion-published](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf) | 11, 12, 13, 14, 16, 17 |
| [kl2-v3](https://arxiv.org/pdf/1602.06899v3) | 55, 58, 62, 63, 64, 65 |
| [bms-v3](https://arxiv.org/pdf/1602.03148v3) | 22, 27 |
| [pdiv-v2](https://arxiv.org/pdf/1211.6357v2) | 17, 18, 19 |
| [rigid-v2](https://arxiv.org/pdf/1205.3463v2) | 25, 26 |
| [rigid-erratum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) | 1, 2, 3 |
| [rigid-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9C5E8381BE3CD320ECADDDEAD2616B55/S2050508613000012a.pdf/dollarpdollar-adic-hodge-theory-for-rigid-analytic-varieties.pdf) | 35 |

## Pinned baseline boundary

The source blobs for the 32 declarations below were hash-checked against Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Their statements were read, including
surrounding hypotheses. The four clarified descriptions concern nonzero bases
for cardinal exponentiation, the characteristic-p quotient in the multiplicative
perfection equivalence, metrizability/completeness in the open mapping theorem,
and injectivity in integral closedness. No declaration was removed or replaced.
These checks confirm the stated library ingredients, not their fitness in every
one of the 324 nodes. The other 292 baseline entries retain the author's evidence
and need independent statement and use-site checking.

- `mathlib:AdicCompletion`
- `mathlib:AdicCompletion.isAdicComplete`
- `mathlib:Cardinal.IsRegular`
- `mathlib:Cardinal.iSup_lt_of_lt_cof_ord`
- `mathlib:Cardinal.mk_iUnion_le`
- `mathlib:Cardinal.mk_set`
- `mathlib:Cardinal.power_le_power_left`
- `mathlib:CategoryTheory.IsCofiltered`
- `mathlib:CategoryTheory.Limits.HasBinaryProducts`
- `mathlib:CommRingCat.FilteredColimits.colimitCoconeIsColimit`
- `mathlib:Ideal.span`
- `mathlib:IsAdicComplete`
- `mathlib:IsIdempotentElem`
- `mathlib:IsIntegrallyClosedIn`
- `mathlib:Module.Flat`
- `mathlib:Perfection`
- `mathlib:Perfection.quotientMulEquiv`
- `mathlib:QuasiSeparatedSpace`
- `mathlib:UniformSpace.Completion`
- `mathlib:UniformSpace.Completion.extensionHom`
- `mathlib:integralClosure`
- `tauceti:TauCeti.Huber.IsPseudoUniformizer.hasBasis_nhds_zero`
- `tauceti:TauCeti.Huber.IsRingOfIntegralElements`
- `tauceti:TauCeti.Huber.IsRingOfIntegralElements.mem_of_isTopologicallyNilpotent`
- `tauceti:TauCeti.Huber.IsStronglyNoetherian`
- `tauceti:TauCeti.Huber.IsTateRing`
- `tauceti:TauCeti.Huber.IsTateRing.isOpenMap`
- `tauceti:TauCeti.Huber.Pair`
- `tauceti:TauCeti.Huber.Pair.Hom`
- `tauceti:TauCeti.Huber.PairOfDefinition`
- `tauceti:TauCeti.Huber.powerBoundedSubring`
- `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`

## Validation and continuation

The indexed blueprint validator passes with **0 errors and 0 warnings**. Source
issue records and version metadata are checked through the packet-compatible
`check_issues` and `versions_checked` functions; the standalone errata CLI expects
an errata-job envelope and is not the packet checker.

The final suggested file is checked against Lean 4.34.0-rc2 and the exact pinned
libraries. The import audit checked 8,482 Mathlib source modules against the pin
and cached source, and built 96 Tau Ceti modules. Compilation succeeds with
**0 errors and 1,285 warnings, all caused by declarations containing `sorry`**.
The geometric API comments remain comments. Compilation does not prove the
mathematics or validate all 804 API items and 345 tests; that semantic audit is
unfinished. No Lean source was written outside the suggested file under review.

Continuation must first establish the new general-base mod-pseudouniformizer gap
and trace its consumers, including completed-colimit tilting. Then check every
node's locators/excerpts and proof closure, all remaining baseline statements and
all use sites, the 13 requests against their suppliers, all API/tests and all
46 planet choices. Revisit the proposed singular-cutoff repair at the actual
DiamondsAndVStacks D2 consumer. Read the full suggested file, not just the focused
sections. Neither the author coverage flags nor this successful compilation
discharge those checks.

Questions for the orchestrator: preserve this as an unfinished review and route
the remaining audit for continuation; synchronize the author's generated reader
and handoff with these corrections through their owning job. Those two files are
outside #470's named deliverables. In particular their universal-singularity,
rejected-source-issue and mod-pseudouniformizer explanations are stale. Do not
promote the packet from this checkpoint. The input intake implementation tests
review-output existence rather than full audit coverage; an automated completion
label would not change the explicit unfinished status recorded here.
