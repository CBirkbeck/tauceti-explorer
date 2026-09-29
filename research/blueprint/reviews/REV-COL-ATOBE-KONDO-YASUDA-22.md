Verdict: rejected

Independent review `REV-COL-ATOBE-KONDO-YASUDA-22`, issue #3738, by Codex, session `codex-5ebb6f`, 2026-09-29. The collation author was ChatGPT Pro, session `cgpt-20260926-qseries-a91f`; this reviewer did not write that result.

Both findings marked **identical** are verified. The collation is rejected as a completed batch because **PAPER-ATOBE-KONDO-YASUDA-22/E3 has no permitted outcome**. The worker correctly recognized the quotation defect and honestly marked the result partial, with `requiresManualReview: true`; this review does not accuse it of claiming a false identical comparison. The original collation job requires an assigned outcome for every finding. E3 needs an authorized correction of its input quotation before that requirement can be met without misrepresenting the paper.

## Published copy independently inspected

Fetched the [publisher PDF specified by the job](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/div-class-title-local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field-div.pdf) on 2026-09-29. The downloaded file begins with the PDF signature, has 56 pages and is 878,927 bytes. SHA-256: `a428e6528c7a4085770c233d1e26f5efe7d5b43e83f8fdc7cd704aa986e78cd5`.

Read its first page and visually inspected locally rendered pages 1, 47, 48 and 54. Page 1 identifies the authors Hiraku Atobe, Satoshi Kondo and Seidai Yasuda, the title, **Forum of Mathematics, Pi (2022), volume 10, e24, pages 1–56**, DOI `10.1017/fmp.2022.17`, the Cambridge imprint and the article's publication notice. It is the typeset published article, rather than an accepted manuscript with a cover sheet. Printed page numbers coincide with PDF page numbers. Read the extracted text at the three finding locators and compared it to those page images. No reading of the entire article or independent mathematical adjudication is claimed.

The original worker's `sourceVersions` entry names the same Cambridge content identifier and article identifier, using the shorter equivalent filename. Its reported text-layer reading, date and publication identity agree with the copy inspected here. Its null hash is explicitly explained by inability to download bytes in that session; this independent measurement is new evidence, not a hash retroactively attributed to that worker. The report does not treat its failed page-image requests as successful visual inspection. No finding was re-scoped to a preprint in this result.

## Finding verdicts

| Finding | Worker outcome | Independent check |
| --- | --- | --- |
| `PAPER-ATOBE-KONDO-YASUDA-22/E1` | identical | **Verified.** Printed p.48, Theorem 9.1, contains the exact five-word fragment “There exists a unique function”. Definition 9.2 on that page also identifies the essential vector through uniqueness. The quoted fragment is present in the version of record. This checks publication of the statement, not the alleged failure of uniqueness. |
| `PAPER-ATOBE-KONDO-YASUDA-22/E3` | null; explicitly unresolved | **Input defect verified; incomplete outcome.** Printed p.47, Lemma 8.10, gives the spanning assertion for the parameter-indexed functions with equality of parameter multisets. Its proof uses the row-permutation quotient and bounds the relevant dimension by the count of parameter choices. The batch's `printed` field is an editorial description of these assertions, not their literal sentence. The worker correctly refrained from marking that description identical. This does not establish a preprint-only statement or absence of the underlying assertion; both are visible in print. A literal input quotation is required before completing this finding's comparison. |
| `PAPER-ATOBE-KONDO-YASUDA-22/E19` | identical | **Verified.** Printed p.54, immediately after the proof of Proposition 9.6, contains the entire batch sentence: conjugacy of the two indicated compact subgroups, the citation of Propositions 9.5 and 9.6, and completion of Theorem 2.1 for the stated Speh representation under `L(s,π)=1`. The words and mathematical content match; differences are only line wrapping and serialization of typeset symbols. The preceding paragraph invokes Theorem 9.1 uniqueness, as the worker records. This confirms the sentence's version, not the correctness of the existing gap allegation. |

Counts: **two verified identical comparisons; zero verified preprint-only comparisons; zero verified absent underlying statements; one input-quotation defect without an outcome**. The batch and result contain exactly the same three finding IDs, with no duplicates.

## Input identity and required revision

Read the job batch, complete collation result and the three current extraction findings. The extraction and batch still match the worker's recorded Git blob hashes: `34248f38ebcd173f65c6a37182dfb0e7a28a862f` and `010af3c3b44882ff18d6d06a08a0a67518ff4bf0`, respectively. Thus E3's quotation defect is present in the stated input, not a mismatch caused by a later edit.

The record-maintenance owner should replace E3's editorial `printed` field with the exact published assertion it challenges, retain its mathematical finding and review history, refresh the batch, and obtain a new literal comparison. Do not classify the paraphrase as preprint-only or absent merely to fill the schema. This review changes only its report and handoff; it does not rewrite the extraction, collation result or mathematics. The original result remains explicitly partial pending that repair.

## Validation

- `python3 scripts/collation.py`: exit 0; run without writing generated register files. It reports 238 paper records, 69 exposed papers and 336 quoted statements. This is a register scan, not proof that each collation outcome is correct.
- `python3 -m unittest discover -s tests -p 'test_collation.py'`: **17 tests passed**.
- Required full suite, `python3 -m unittest discover -s tests -p 'test_*.py'`: **307 tests run, 306 passed, one failed**. The failure is `test_redteam_queue.Queue.test_a_proposal_its_review_sent_back_is_revised_before_its_family_is_blueprinted`, because the checked-in queue has no revision round for `RS-09` while its review is `needs_changes` and `REV-RS-09` is done. It occurred on the unchanged base checkout before this report was written; no queue or test file is changed by this review.
- The source copy was independently hashed and rendered. All three finding IDs were checked, recorded input blob identities match, no input record was modified, and `git diff --check` passed.

Lean validation is not applicable: this job changes no Lean file. The complete collation review is finished; the rejected finding's quotation repair is the remaining work for its owner.
