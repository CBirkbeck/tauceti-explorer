# Handoff: REV-ERRATA-PAPER-KISIN-MADAPUSIPERA-SHIN-22

Issue #1798. Codex — `codex-7e92bd`, 23 September 2026. **Partial checkpoint; not a completed review.** Continues the independent checkpoint by `codex-a71f92` merged in PR #2321.

Claim comment 5796994696 was confirmed by the bot at 14:47:11 UTC. The original errata is by cc-fb70e5; the extraction is by codex-c83e7a/cc-fb70e5/cc-442dc5. Neither independent reviewer authored those findings.

## Saved

- Preserved the preceding checkpoint's E1–E7 checks and E13, with their attribution and version limitations.
- Independently reconciled the extraction's E8–E12 in the 41-page author PDF. Added E8, E9, E11 and E12 to the errata JSON, now twelve findings; retained their existing identifiers.
- E8: checked the quaternion inner-twist calculation, including the inverse-Hodge case and distinction between ordinary and maximal admissible classes. The claim disproved is local; no global integral-model counterexample is asserted.
- E9: supplied a Hodge-type CM elliptic example showing the full generated Tannakian group has dimension one while the chosen tensor stabilizer has dimension two. Reclassified the failed equivalence from gap to error affecting the proof. The theorem's full functor/descent repair remains open.
- E10: rejected the extraction candidate in the report, with the closed-Q-subgroup argument proving the two intersections coincide. It was not previously in the errata JSON and is not added; its identifier remains reserved. The extraction itself is outside the allowed files.
- E11: checked the (m,n)=(0,1) test. E12: followed both cocharacters through the Newton, Hodge and Frobenius formulas, rather than changing a single sign in isolation.
- E13: read Kisin–Zhou v2 §4.3.7 and Proposition 4.4.10, which explicitly impose equal multipliers and verify related centralizer sequences. Their extra hypotheses prevent treating this as a completed repair of KMPS.
- Reacquired the author PDF and Shin errata, with matching hashes. Refreshed Crossref, author pages, correction searches, OpenAlex and publisher routes. The journal PDF remains unavailable through the public routes located. Noot's author page was read; its linked full text was not obtained.
- No `review` objects and **no final report under `reviews/`**: file existence there would incorrectly complete this partial job. No final verdict is being issued for a mistake in the published journal text.

## Resume

1. Obtain and collate the published Duke text, DOI 10.1215/00127094-2021-0063, through a public or authorized source. Challenge responses and absence of an open-access location are not evidence that author-version defects survive publication.
2. Independently verify the recorded author-version arguments and carry the twelve retained findings plus the rejected E10 candidate through the version comparison. The report distinguishes work by each reviewer; do not claim personal verification merely from these notes.
3. Obtain Noot, JLMS 79 (2009), 53–71, DOI 10.1112/jlms/jdn049, §2.3. The circular local definition was checked, but its external comparison remains open.
4. Finish E13's repaired lifting, centralizers and quotients in the precise KMPS hypotheses. Kisin–Zhou pp.40 and 45 supply a useful comparison, not an automatic proof. Keep E8's global scope and E9's incomplete full repair explicit.
5. Refresh the correction search; add supported per-finding verdicts and the final review report only when the review is complete.

The errata report records public URLs, complete hashes, read coverage and mathematical checks. No PDFs or machine-local paths are committed. No extraction, queue, generated register or atlas edits. Lean: not applicable.

## Validation

- Errata checker: twelve findings, no errors.
- Intake file check: the errata JSON, errata report and this handoff pass.
- `git diff --check` passes.
- Direct enumeration verifies the CM example has eight points over F₅ and Frobenius trace −2. The group-theoretic and slope arguments are written in the report; no formalization is claimed.
