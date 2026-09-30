# REV-RT-PAPER-KOYMANS-PAGANO — verification of the red-team findings on PAPER-KOYMANS-PAGANO

**Verdict: all thirteen findings are confirmed, at the severities the red team gave: five medium and eight low.**

Every fix except /7's needs adjusting. The largest changes are to /1 and /2, where two items the red team would make library stay planned, and to /4, where the new item is missing rather than planned. Each reason in `RT-PAPER-KOYMANS-PAGANO.review.json` states the corrected fix.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4337).
- **Independence.** This verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-KOYMANS-PAGANO (Claude Code, `cc-f805bf`, #4338);
  - the extraction, PAPER-KOYMANS-PAGANO (`cc-39fac3`, #2194);
  - its review, REV-PAPER-KOYMANS-PAGANO (`cc-d67081`, #2195).

**What was checked.**

- **The sources**, with the red team's hashes:
  - Koymans–Pagano, *On Stevenhagen's conjecture*, arXiv:2201.13424v1 (`c7a93ffe…50cbd`), still the only version; Crossref has no published record on 30 September 2026. Page images were used for pp. 3, 28, 30, 53 and 63.
  - Smith, arXiv:1702.02325v2 (`e768b5ad…a59e`), the version the paper's bibliography names.
  - Chan–Koymans–Milovic–Pagano, arXiv:1908.01752v1 (`385c90c9…698c8d`), and its published version, Forum Math. Sigma 10 (2022) e46.
  - Watkins's two notes, the paper's [46] and [47], as now served.
  - Crossref for Jutila (1975), Rédei, Rédei–Reichardt, Heilbronn and MacWilliams.
- **The records.**
  - The extraction and its review.
  - The ArithmeticStatistics and ClassicalArithmeticCompletion packets. Both are merged; their reviews (#546, #532) are open and blocked.
  - The reviewed library audit, `data/library-coverage.json`: AUDIT-04, -05, -22 and -23.
- **The atlas.** The stages each fix names, on the atlas `scripts/build.py` assembles.
- **Library claims.** Read at Mathlib `082e2d3` and Tau Ceti `f790474`.
- **Collation.** `scripts/collation.py`, run against this paper's record.

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## Library statuses (/1, /2)

Both findings are right that the notes describe built Tau Ceti layers as plans. But §16 makes an item library only when a declaration states it as the item states it. Where a short adapter is still missing, the item keeps its status and cites the declarations. This is the reading REV-RT-PAPER-TEMKIN-17 used.

**/1: confirmed.** The declarations exist at the cited lines, and the index-2 corestriction computation gives (3.1)–(3.2) exactly. Item by item:

- **/36: library.** `d1_apply` is the paper's d_x term by term. Its note should say that the twisted module N(χ) is item /35.
- **/52: library, for a different reason.** The claim that d is applied only to 1-cochains is wrong: the proof of Proposition 2.16 (p. 18) and §5 (p. 40) apply it to 2-cochains. Mathlib's `inhomogeneousCochains.d`, for the trivial 𝔽₂ representation, is the paper's d in every degree.
- **/28: library,** citing `proPKernel_le`. The item should be stated as the quotient G_ℚ ⧸ proPKernel, with the field-theoretic description in the note.
- **/83: stays planned.** Every ingredient is built, but no declaration states the index-2 criterion.
- **/21: stays planned,** the red team's own fallback. The audit rates μ₂ ≅ 𝔽₂ absent, at QuadraticFormInvariants 7a.

Library therefore becomes 9 and planned 14.

**/2: confirmed.** Multiquadratic Layers 2–3 are built (AUDIT-04). But neither genus-theory surjection of item 227 is stated in the paper's form. Four pieces of glue are needed:
- the square of each ramified prime's class;
- the step from generation to the surjection;
- the transpose of the injective genus-character map;
- the bridge from Galois to ideal-theoretic characters.

So item 227 stays planned, with a rewritten note citing the declarations. Alternatively it is restated in the library's form. Item 5 cites `card_ker_toClassGroup_le_two`.

## Routes and owners (/3, /4, /5)

**/3: confirmed; the red team's derivation needs the other ordering.**
- The paper cites only Smith's Proposition 6.6, which Smith proves from Jutila (Acta Arith. 27, 1975). Heath-Brown's 1995 large sieve is not cited anywhere in the paper.
- With x₁ outer, a log³tᵢ factor remains, and Proposition 7.6(ii) allows tᵢ up to e^{t₁^{c₂}}. The bound over the whole range comes from putting xᵢ outer, which reciprocity allows.
- Part (b) of the fix is void, since item 263 never names Heath-Brown.
- The summary field and the brief's list of prerequisite papers need the same correction.
- Do not coalesce with PAPER-SKOROBOGATOV-SOFOS-23's Heath-Brown item at SV.2.

**/4: confirmed.** P(m, n, j) has two planned owners, and /218, routed to ST.5, is stated with a definition routed downstream to the Part II. Two corrections:
- The ST packet is merged but not accepted.
- The split-off item is *missing* on route 3, like /205, /207 and /218, not planned.

Route 1 stays at 219 items, route 3 goes to 6, and the total to 265.

**/5: confirmed.**
- The CA.5 node covers only d ≢ 1 (mod 4), which excludes every odd d ∈ 𝒟.
- Both missing cases check out: for d ≡ 1 (mod 8) the units lie in ℤ[√d], and for d ≡ 5 (mod 8) the cube does.
- Tau Ceti already has one direction, `exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`, so only the converse is missing.

Route 2's reason should split /2–/4 (CA.4) from /5, /9 and /12 (CA.5). Item 9's note needs the sentence too, and the brief imports CA.5.

## Mistakes in the paper and the extraction (/6–/10)

**/6: confirmed; the review's strike of E12 was wrong.**
- Lemma 4.5 allows a zero raw cocycle, and L(0) = ℚ by the definition on p. 6. So S = {65}, k = 1, ψ₂ = 0 gives ramification index 1 at 5.
- Adjustments:
  - Drop "(as in every application)", since Theorem 5.10's triples do not exclude zero cocycles either.
  - Item 104 should state the corrected "at most 2", because §18 says items use corrected statements.
  - The extraction's report carries the strike too.

**/7: confirmed; the fix stands.** For A = ℤ/4 and s = 1 the note gives rk₂ = 0.

**/8: confirmed.** With a = 1, Theorem 4.6(b)'s support contains 0, and its proof's appeal to Theorem 3.2 fails. "Misprint, affects nothing" matches E5 and E27. Two adjustments:
- 'a > 1' belongs in item 98, where a is introduced.
- The reason should say that §8.4 uses only non-zero kernel vectors (p. 93).

**/9: confirmed.**
- Smith v2 has no Lemma 4.1.
- Its Proposition 4.1 assumes d ≥ 2.
- Proposition 6.6 does follow from Smith's Proposition 4.4, which is on p. 40 (not p. 38), fibre by fibre, for |S| ≥ 2.

**/10: confirmed.**
- CKMP's Proposition 5.7 uses Siegel's theorem, in v1 and in the published version.
- The chain the red team gives (through Propositions 5.12–5.13) is slightly off, but the conclusion is not affected.
- E55 should cite Watkins [47], whose 8-rank results are stated to be effective, as the repair.
- The box form required by E41 must be effective too.
- The pointer goes into item 214 as well as item 8.

## Bookkeeping (/11–/13)

**/11: confirmed.** Crossref confirms every proposed citation and gives DOIs. Adjustments:
- Each Rédei work gets its own reason: only [40] is behind (7.27), and [39] is Rédei reciprocity.
- Both Watkins notes are listed. The note [46] now served post-dates the paper's retrieval.

**/12: confirmed.** Of fourteen "(issues file)" tags, eleven point to existing entries.
- Item 13's (1.3) indexing slip should be recorded as a misprint, because §18 says mistakes are never silently corrected.
- Item 23's tag should just be deleted: an overloaded notation is not a mistake.
- Item 93's claim is wrong. Proposition 3.3 with transitivity of norms gives the step.

**/13: confirmed.** The sourceVersions rule entered the protocol on 24 September, the day after the extraction.
- Add only the preprint entry. A "published" entry for the unread Acta text would take the paper off the collation worklist.
- The red team says a year in the citation would list the paper. That is wrong: `published_exists` stays false until papers.json has a DOI link.

## For the fixer: three points the red team did not raise

- **Proposition 6.6 as printed allows S = ∅, and there it fails.** For X a single point, |F⁻¹(0)| ∈ {0, 1} cannot be within ε < ½ of ½. Its one application has |S| ≥ 3, so item 159 should carry S ≠ ∅ (or |S| ≥ 2, as in Smith). This may be recorded as a misprint that affects nothing.
- **Reference [38] prints 1935.** Crossref and zbMATH give 1934. This is a bibliographic misprint, like E51.
- **The '(issues file)' tags.** The other eleven tags could name their entries (E2–E9).

## What becomes a fix job

The five medium findings (/1–/5) will be queued as FIX-RT-PAPER-KOYMANS-PAGANO, with these adjustments:
- **/1:** /28, /36 and /52 become library, and /21 and /83 stay planned.
- **/2:** item 227 stays planned or is restated.
- **/3:** the ordering in the derivation, and the extra places to correct.
- **/4:** the new item is missing on route 3.
- **/5:** the per-item split, item 9, and the built direction.

Under §17 only medium and high findings become a fix job. The eight low findings are confirmed here, with their adjusted fixes, for whoever next edits the extraction.

No Lean file is a deliverable, and no Lean was run.
