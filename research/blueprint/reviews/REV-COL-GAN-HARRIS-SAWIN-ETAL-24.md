Verdict: rejected

Independent review `REV-COL-GAN-HARRIS-SAWIN-ETAL-24`, issue #3722, by Codex, session `codex-5ebb6f`, 2026-09-29. The collation author was ChatGPT Pro, session `cgpt-20260926-qseries-a91f`; this reviewer did not write its result.

All **four identical outcomes are verified**. The batch is rejected as a completed collation because **PAPER-GAN-HARRIS-SAWIN-ETAL-24/E17 has no permitted outcome**: its `printed` field rewords the lemma's introduction. The worker correctly flagged this and explicitly recorded a partial result requiring manual review. No false identical claim is alleged. The owner must repair that quotation before assigning an outcome; the three permitted classifications should not be filled by misrepresenting the presence of the underlying published statement.

## Version of record

Independently downloaded the [Cambridge publisher PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/10EEB98855332F11F5555C45665BBA5F/S2050508624000106a.pdf/local-parameters-of-supercuspidal-representations.pdf) on 2026-09-29. It has 41 pages and 682,163 bytes; SHA-256 `9b0e4a6b51caaf29f677d7e7d4aa13becf51099c0bd33c19c61f8da6265a82bc`. The DOI endpoint in the issue did not open through the browser tool, so the copy was fetched from the publisher URL recorded in the collation. Its first page independently verifies DOI `10.1017/fmp.2024.10` and publication identity.

The typeset first page gives **Forum of Mathematics, Pi (2024), volume 12, e13, pages 1–41**, the Cambridge imprint, the article title and all four authors: Wee Teck Gan, Michael Harris, Will Sawin and Raphaël Beuzart-Plessis. It shows receipt on 14 August 2023, revision on 10 April 2024 and acceptance on 14 May 2024. This is the published research article, not an accepted manuscript with a journal cover sheet. Its appendix on globalization is credited to Beuzart-Plessis on p.37.

Read the extracted text at every batch locator and visually inspected locally rendered pages **1, 7, 8, 14, 23, 30, 32, 35 and 37**. Also read Theorem 1.5 on p.4 in the downloaded text. Printed/PDF page numbers coincide. This is a targeted collation review; no full-paper mathematical review is claimed.

The original worker's published `sourceVersions` entry names this same PDF, DOI, publication identity and targeted reading scope. Its lack of a measured hash is explicitly explained by the failed binary download in its session. This review supplies an independent measurement, without attributing it to that worker or claiming that its page-image access was independently logged here.

Independently fetched the [arXiv v3 HTML](https://arxiv.org/html/2109.07737v3), and inspected only Lemma 4.7 and the version metadata. Its HTML bytes have SHA-256 `58329127067855f87be59a1e1c3659c880c5274b2c5423be7024dbda87db075e`. The [version history](https://arxiv.org/abs/2109.07737v3) identifies v3 as 13 June 2022, agreeing with the worker's source citation. The HTML itself was regenerated on 24 August 2026; that rendering date is not a new manuscript-version date. No preprint PDF hash or whole-preprint comparison is claimed. No finding in the collation was assigned preprint-only.

## Finding verdicts

| Finding | Worker outcome | Independent check |
| --- | --- | --- |
| `PAPER-GAN-HARRIS-SAWIN-ETAL-24/E2` | identical | **Verified.** The opening and principal-series conclusion of Theorem 7.12 on p.23, the case-(b) conclusion of Lemma 10.7 on p.32, and the first conclusion of Proposition 10.10 with its residue-field bound on p.35 all match the three separated input excerpts. The marked ellipsis omits hypotheses that remain in print; it does not establish their absence. Read Theorem 1.5 on p.4 as parallel context. |
| `PAPER-GAN-HARRIS-SAWIN-ETAL-24/E12` | identical | **Verified.** The second paragraph and quoted beginning of the third paragraph of Corollary 11.8 on p.37 match. Its preceding n-closeness, residue-field, Weyl-group and Conjecture 11.7 hypotheses are present. Matching this excerpt does not validate a transfer argument outside those hypotheses. |
| `PAPER-GAN-HARRIS-SAWIN-ETAL-24/E15` | identical | **Verified.** Definition 2.5, spanning pp.7–8, contains “some (equivalently, for all) faithful representations”; Definition 3.3(b) on p.8 contains “some (equivalently every) faithful representation”. The singular/plural and comma distinctions agree with the two separate input fragments. |
| `PAPER-GAN-HARRIS-SAWIN-ETAL-24/E17` | null; nonliteral-input | **Mismatch correctly identified; incomplete outcome.** Lemma 4.7 on p.14 begins “Let ℒ be a rank one local system”, while the input uses a different introductory phrase and digit. Its displayed trace identity, including the inverse on the inertia element, agrees with the source. The same introduction and identity occur in the v3 HTML lemma. This is an input-transcription defect, not evidence of a correction made at publication or of an absent underlying lemma. The worker's replacement transcription agrees with the published statement. |
| `PAPER-GAN-HARRIS-SAWIN-ETAL-24/E22` | identical | **Verified.** The exact input sentence is the final sentence of the more-general alternative of Proposition 10.5 on p.30. It is not a rewritten version of the first alternative. Read both alternatives and their hypotheses; Corollary 10.11 on p.35 provides context but does not replace the quoted sentence. |

Counts: **four verified identical comparisons, zero verified preprint-only comparisons, zero verified absent underlying statements and one unresolved input-quotation defect**. The result contains exactly the five batch finding IDs without duplicates. The mathematical corrections, reasons and earlier independent-review verdicts were not re-derived or certified by this sentence comparison.

## Inputs and remaining repair

Read the complete job batch, collation result and all five relevant extraction findings. Their Git blob identities match the worker's recorded inputs: batch `85e2d2a762e37cf7247890da5b25c664c96f5623`, extraction `f483cfd1cf7d35f7e32f2eb571536af80f342980`. The `readFrom: preprint` batch label does not override the published locators or the current source-version evidence.

An authorized record-maintenance pass should replace E17's editorial introduction with a literal quotation, preserve its mathematical finding and review history, refresh the batch, and collate that replacement. Leave the present result partial until this is done. Do not label the reworded introduction absent or preprint-only merely to obtain a permitted outcome. No extraction, collation input/result or mathematical statement is changed in this review; only its report and handoff are submitted.

## Checks

- `python3 scripts/collation.py`: exit 0, without writing register files; 238 records, 69 exposed papers and 336 quoted statements. This scan does not validate sentence comparisons.
- `python3 -m unittest discover -s tests -p 'test_collation.py'`: **17 tests passed**.
- Required full suite, `python3 -m unittest discover -s tests -p 'test_*.py'`: **307 tests, 306 passed, one failed**. The existing failure is `test_redteam_queue.Queue.test_a_proposal_its_review_sent_back_is_revised_before_its_family_is_blueprinted`: `RS-09` has no queued revision round despite a `needs_changes` review and completed `REV-RS-09`. The suite was run before writing this report on the unchanged base; no queue/test file is modified.
- Independent source hashes, published-page renders, bounded preprint check, exact input blob matches, unique five-finding coverage, allowed deliverable paths and `git diff --check` are recorded. Lean validation is not applicable.

The review is complete. E17's literal-quotation repair remains work for the input owner, rather than unfinished source checking by this reviewer.
