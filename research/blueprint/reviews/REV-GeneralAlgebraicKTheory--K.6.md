# REV-GeneralAlgebraicKTheory--K.6 — independent review

Reviewer: Claude Code, session cc-fb70e5 (issue #415; claim comment 5872647209, confirmed by the bot). The blueprint under review
(BP-GeneralAlgebraicKTheory--K.6, PR #2882) was written by another session, cc-7b31c4. Date: 2026-09-28.

**Verdict: accepted after corrections.** Of the 22 nodes, 16 were corrected (2 mathematically, the rest in their citations) and 6 verified,
and none was added. All 19 baseline citations exist at the pins. One was misused and has been removed from the node that used it. One source
misprint is recorded.

## What was checked

- **Sources.** Weibel's *The K-book* (author PDF of 29 August 2013, sha256 `a04f53c9…058845`) and Schlichting, *Negative K-theory of
  derived categories* (sha256 `f59620e3…8b5aa6`). Both hashes reproduce the packet's. Every excerpt was checked mechanically, by searching
  for runs of six consecutive words of the excerpt in the source, and then read at its passage.
- **Baseline.** Every citation was checked against the pinned declaration index. The citations the nodes rely on were read at the pins:
  `TauCeti.SplitK0.of_mul_of`, `ExactK0.mapEquiv`, `ExactStructure.IsFrobenius` and `split_isFrobenius`; Mathlib's
  `ModuleCat.matrixEquivalence` and `IsMoritaEquivalent.matrix`.
- `check_blueprint --index` gives 0 errors and 0 warnings.

## Mathematical corrections

1. **`unit-multiplication-and-K0-tensor-comparison`** said that multiplication by the class of a unit is "an automorphism of each K-group,
   inverse to multiplication by the inverse unit". That is false. [u] ∈ K₁(R) raises degree by one, and [u⁻¹] = −[u], so multiplication by
   [u⁻¹] is the *negative* of multiplication by [u].
2. **`compatibility-with-relative-groups-and-transfers`** called the localisation boundary "a derivation for the product". The boundary is
   K_*(R)-linear up to sign, which makes it a module map, not a derivation of a ring. Neither of the node's two citations supported any of its
   claims:
   - II.7.4.4 is about the category Nil(R);
   - the "II.9.5.2" sentence is not in the source.

   They are replaced by the projection formula V.3.12 and the spectrum pairing IV.8.11. **No source was located for the boundary
   compatibility**, which should become a gap if a continuation cannot find one.
3. **`flasque-rings-and-the-swindle`** cited `mathlib:CategoryTheory.Idempotents.Karoubi`, the Karoubi *envelope* (idempotent completion),
   for Karoubi's flasque rings. The name is a coincidence of exactly the kind the node itself warns about. The prerequisite is removed. The
   declaration stays in the baseline because the Frobenius-pair nodes legitimately use idempotent completion.

## Citation corrections

Fifteen K-book excerpts were paraphrases presented as quotations, or were attributed to the wrong item:

- II.2.7 and II.2.7.2 (Morita);
- "II.9.6.1", which is actually a lemma on cofibrations; replaced by the Approximation Theorem II.9.7;
- II.9.1.1/9.1.2, where the numbering was shifted;
- "II.2.1.2", which is Example 2.1.2 on simple rings; the product formula follows Example 2.1.3;
- IV.6.4, II.7.4, II.9.5.2, II.7.4.1 and IV.6.6;
- "IV.1, graded-commutative", which is Loday's Theorem IV.1.10 on printed p. 266;
- II.7.4.4 and III.1.1;
- the bracketed paraphrases in V.8.2 and V.8;
- the merged IV.10.3/10.4.

Every K-book page number was also mislabelled. The packet's "PDF p." values were printed pages in chapters III–V and simply wrong in
chapter II (for example, II.2.1.3 is printed p. 69, not "PDF p. 105"). All citations are now verbatim and read "printed p. N (PDF p. N+8)".

Two citations were added:

- III.4.1's own statement that K_n(R) = 0 for n < 0 when R is regular noetherian, on the vanishing node;
- IV.6.4's filtered-colimit clause, since the colimit half of that node had no K-book citation.

The Schlichting nodes are faithful. In particular, D(E) in Corollary 8.2 is the unbounded derived category, as the node says (Lemma 8.1).
Two of their page numbers were fixed: Proposition 11.15 is on p. 22, and Theorem 11.10/§11.13 is on pp. 21–22. Test kinds were added;
none of the 40 tests had one.

## Source issues (PROTOCOL §18)

The packet had no `sourceIssues`. It now has one:

- **GeneralAlgebraicKTheory/E1** (misprint): in Corollary IV.10.3, "K₋ₖ(R) ≅ π_n Λ^{k−1}K(R)" should read π₋ₖ Λ^{k−1}K(R). Here n is
  unbound, and Λ^{k−1}K(R) is the (−k)-connective cover. The August 2012 chapter file prints the same, and the author's errata link returns 404.

`sourceVersions` records both sources.

## Suggested Lean file

The Lean file is unchanged. It contains neither corrected statement. It is heavily placeholdered: definitions are `structure … where
dummy : Unit` and most theorems are `: True`. Real signatures would need spectra, which neither pinned library has, but `IsFlasqueRing`
and the contracted-functor data could be given honest fields. That is recommended as a follow-up. Not compiled.

## Node-by-node

| node | verdict | note |
|---|---|---|
| `K.6/flasque-rings-and-the-swindle` | corrected | corrected: removed the prerequisite mathlib:CategoryTheory.Idempotents.Karoubi, the Karoubi ENVELOPE (idempotent completion), which has nothing to do with Karoubi's flasque rings — a name coincidence of exactly the kind the node itself warns about; locator page fixed (printed 69, not 'PDF p. 105'); cone-ring citation is Exercise I.1.8. |
| `K.6/contracted-functors` | corrected | verified; locator relabelled (printed 210). |
| `K.6/negative-k-groups` | corrected | verified; III.3.7 is on printed p. 206 (not 208); excerpts re-pulled verbatim. |
| `K.6/fundamental-theorem-with-nil-terms` | corrected | verified; the V.8.2 and V.8-opening excerpts had bracketed paraphrases in place of the source's words — re-pulled verbatim. |
| `K.6/axioms-for-negative-k-theory` | corrected | verified (all four axioms match); 4.4.1 is on printed p. 214; axioms (3)–(4) added as a citation. |
| `K.6/mayer-vietoris-for-negative-k` | corrected | verified; excerpt re-pulled verbatim; pages 212–213. |
| `K.6/nonconnective-spectrum` | corrected | verified; the 10.3/10.4 excerpt was a paraphrase joining two items — split and re-pulled; source misprint in 10.3 recorded (E1). |
| `K.6/vanishing-for-regular-noetherian-rings` | corrected | verified; added the source's own statement (III.4.1: K_n(R) = 0 for n < 0 when R is regular noetherian); the regularity excerpt re-pulled from I.3.7.1 (printed 23). |
| `K.7/morita-invariance` | corrected | verified; the II.2.7 and II.2.7.2 'excerpts' were not the source's text (paraphrases) — replaced by verbatim quotations; pages 75, 76, 321. |
| `K.7/derived-morita-and-enhancements` | corrected | verified; the 'II.9.6.1' citation (an exact equivalence induces a K-theory equivalence) is not what II.9.6.1 says (a lemma on cofibrations that are weak equivalences) — replaced by the Approximation Theorem II.9.7; 9.1.1 is the Waldhausen category (not 'category with cofibrations' as the excerpt had it); Proposition 11.15 is on p. 22, and its hypothesis/conclusion now quoted verbatim. |
| `K.7/invariance-under-filtered-colimits-and-products` | corrected | verified; the product citation was misattributed to II.2.1.2 (simple rings) and the IV.6.4 excerpt was a paraphrase; both re-pulled, and the filtered-colimit clause of IV.6.4 added. |
| `K.7/products-from-biexact-functors` | corrected | verified; four of five excerpts were paraphrases (II.7.4, II.9.5.2, II.7.4.1, IV.6.6) — re-pulled; pages 132, 165, 322, 342. |
| `K.7/graded-commutativity` | corrected | verified mathematically; the graded-commutativity citation was not in the source at the cited place — replaced by Loday's Theorem IV.1.10 (printed 266). |
| `K.7/compatibility-with-relative-groups-and-transfers` | corrected | corrected: 'the boundary is a derivation for the product' is wrong — the boundary of a localisation sequence is K_*(R)-linear up to sign, a module map; the two cited passages (II.7.4.4 on Nil(R), and an 'II.9.5.2' sentence not in the source) supported none of the node's claims — replaced by the Projection Formula V.3.12 and the pairing IV.8.11. The boundary compatibility has no located source and is recorded in the review as unsourced. |
| `K.7/unit-multiplication-and-K0-tensor-comparison` | corrected | corrected: the claim that multiplication by the class of a unit is 'an automorphism of each K-group, inverse to multiplication by the inverse unit' is false — [u] ∈ K_1 raises degree, and [u⁻¹] = −[u]; the III.1.1/1.2 excerpt was a paraphrase — replaced by Example 1.1.1 (printed 180). |
| `K.6/frobenius-pairs` | verified | verified against Schlichting (Definition 3.4, Lemma 4.2, Remark 1.9, Theorem 6.1, Lemma 8.1/Corollary 8.2 — D(E) is indeed the unbounded derived category — and §9 checked at their pages). |
| `K.6/frobenius-pairs-flasque-envelope-and-suspension` | verified | verified against Schlichting (Definition 3.4, Lemma 4.2, Remark 1.9, Theorem 6.1, Lemma 8.1/Corollary 8.2 — D(E) is indeed the unbounded derived category — and §9 checked at their pages). |
| `K.6/schlichting-set-up` | verified | verified against Schlichting (Definition 3.4, Lemma 4.2, Remark 1.9, Theorem 6.1, Lemma 8.1/Corollary 8.2 — D(E) is indeed the unbounded derived category — and §9 checked at their pages). |
| `K.6/schlichting-set-up-and-negative-localization` | verified | verified against Schlichting (Definition 3.4, Lemma 4.2, Remark 1.9, Theorem 6.1, Lemma 8.1/Corollary 8.2 — D(E) is indeed the unbounded derived category — and §9 checked at their pages). |
| `K.6/additivity-and-colimits-for-negative-K` | verified | verified against Schlichting (Definition 3.4, Lemma 4.2, Remark 1.9, Theorem 6.1, Lemma 8.1/Corollary 8.2 — D(E) is indeed the unbounded derived category — and §9 checked at their pages). |
| `K.6/nonconnective-spectrum-and-derived-invariance` | corrected | verified; pages fixed (11.10/11.13 on pp. 21–22, 11.15 on p. 22) and 11.15 quoted verbatim. |
| `K.6/agreement-and-vanishing-of-negative-K` | verified | verified against Schlichting (Definition 3.4, Lemma 4.2, Remark 1.9, Theorem 6.1, Lemma 8.1/Corollary 8.2 — D(E) is indeed the unbounded derived category — and §9 checked at their pages). |

## Questions for the orchestrator

1. The readme `readmes/GeneralAlgebraicKTheory--K.6.md` is not a deliverable of this review, so it was not edited. It should receive the
   two mathematical corrections above.
2. The same session's N.7 packet (reviewed in PR #3333) had the same pattern of paraphrased excerpts and mislabelled K-book pages. Other
   packets citing the K-book should be checked the same way.
