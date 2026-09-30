# REV-RT-PAPER-CESNAVICIUS-21

**Complete: all six findings confirmed.** Four of the fixes are corrected below.

- **Job:** Refs #4327.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction, its review and the red team (RT-PAPER-CESNAVICIUS-21, session `cc-f805bf`) were done by other sessions.
- **Verdicts:** `research/blueprint/redteam/RT-PAPER-CESNAVICIUS-21.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

- **Sources read:**
  - arXiv:1810.04493v2 (SHA-256 a07d62e6…07b9) and its LaTeX source.
  - The author's PDF, re-fetched. Its hash matches the extraction's record. It is dated 28 July 2020 and has 24 pages; the Duke article runs to 37.
- **Not read:** the Duke Math. J. 170 (2021) text. Project Euclid returned a bot-block page for both the DOI and the download link.
- **Verifiers:** two worked in parallel, one on findings 1–2 and one on 3–6.
- **What was checked:**
  - `make_queue.py` and `queue.json`. The grouping was re-run read-only.
  - The stage texts: AS.1, R03.3, SF.0, SF.2, StableReduction Layer 4, R09.7a.
  - The accepted routes of IKM-24, CG-18, LLL-20, Pilloni-20, BIP-23, PQ-26, CMM-21 and KW-09-II.
  - The libraries.

## /1 — confirmed; fix refined (medium)

**The dependency is real.** The proof of Proposition 4.4 (route 1) uses Theorem 3.14, Lemma 3.6 and the module blowups of §3.13 (route 2), and the avoidance Lemma 4.3 (route 6). Route 1's prerequisites name neither.

**The queue behaves as the finding says.** Since commit 7685a59f (28 September, after the review) there is one design job per Part II parent.
- The Scheme Part II job has order 31, the commutative Part II job order 146, and neither has an `after`.
- Workers claim jobs by (priority, order), so the Macaulayfication side is taken first.
- The review's `make_queue` sentence was true when written but is now obsolete.

**Refinements to the fix:**
- **Put the ordering on the right job.** The Scheme Part II job now has 10 continuations, and its instructions say to design only the first (flat cohomology) and send the rest to restructure proposals. The ordering constraint therefore belongs on whichever job ends up designing Macaulayfication. Making the whole Scheme job wait would hold back unrelated work.
- **Name the supplier fully.** Give its title, its id and a pointer to route 2 of this extraction. The id alone is not enough: `DeformationAndDerivedPatchingAlgebraPartII` could stop naming the Kawasaki work if IKM-24 route 1, which comes earlier in `papers.json`, is accepted.
- **Reserved ids are the maintainer's.** `reserved-ids.json` is generated from `make_queue.py`'s `RESERVED` table, and design jobs may not edit it.
- **For the maintainer:** the underlying problem, that route ids no longer name design jobs, affects many extractions. It is already recorded as "Residual 3" in `RT-AREA-etale.fixes.md`. One general fix may be better than one fix per paper.

## /2 — confirmed; fix simplified (medium)

**AS.1 does not own this.** Its text plans no dualizing complex of a Noetherian ring and no local duality. The paper uses them only for rings, where Mathlib's derived categories suffice. Routing them to AS.1 would make the commutative route 2 depend on AS.0, condensed anima, animated rings and derived de Rham, none of which the mathematics needs.

**The IKM-24 rejection is misread.** Its gap G2 says the owner is still to be settled and never names AS.1.

**R03.3 is the right owner, and the case is stronger than the finding says.** This extraction already gives R03.3 local cohomology and Matlis duality, the inputs of local duality. The accepted CG-18 route 4 gives it canonical modules and Gorenstein theory, which is the Cohen–Macaulay case of dualizing complexes.

**Correction:** nothing needs to move together across papers. The AS.1 items of Hacon–Witaszek-23, BLMM-23 and Zavyalov-25 are scheme-level. They can stay with item 52 and import the ring-level items. The fixer can therefore act now:
1. Move items 39, 79 and 80 to route 4 (R03.3), stating the extension explicitly so that the IKM objection is met.
2. Reduce route 5 to item 52 and correct its reason: drop the IKM sentence and the "single owner" claim.
3. Update route 2's brief and drop AnalyticStacks from its prerequisites.
4. Update route 1's brief and the notes of items 39, 79, 80 and 81.

## /3 — confirmed; owner changed (low)

Neither R03.3 (finite modules) nor SF.0 (quasi-coherent modules) plans the sheaf-level (S_n) and Cohen–Macaulay notions. Route 1's brief states no adapter, so item 16's note is false.

**Correction:** do not put them on route 1. Accepted routes already use Cohen–Macaulay sheaves and schemes inside SchemeAndStackFoundations: LLL-20/T58 at SF.0 and Pilloni-20 route 24 at SF.2. SF.0 and SF.2 cannot depend on a Part II that starts after them.

**Right fix:** split item 16.
- The module-level part stays planned in R03.3.
- The sheaf-level definitions become a missing item on source route 3 (SF.0).
- Route 1 imports them.

## /4 — confirmed; placement changed (low)

EGA IV₂ 7.4.4 has no item, and its regular case, used in Proposition 2.7, has no supplier. Corollaries 1.8 and 1.11 need the finite-type case, which is the substantial part of the theorem. Items 6 and 28 carry the Cohen–Macaulay and (S_n) consequences.

**Accepted routes already give R03.3 special cases of the regular case:**
- BIP-23/088 and PQ-26/76: finitely generated algebras over complete local rings are excellent.
- CMM-21/080 and KW-09-II/60: related excellence facts.

Item 1's own note also puts ring-level excellence in R03.3.

**Right fix:**
- State the theorem in ring form on route 4, as a source for R03.3, together with the quasi-excellence corollary (7.8.3(ii)).
- Route 1 keeps the scheme-level consequences and imports the theorem.
- LLL-23/Z79 should point to the same item once that extraction is reviewed.

Putting the general theorem on route 1 would plan the regular case twice.

## /5 — confirmed (low)

No layer plans the bound dim Bl_I(Supp M) ≤ dim Supp M (HIO 12.14), and neither library has it. The layers checked were StableReduction Layer 4, R03.3 and its accepted decomposition, and R09.7a. The bound was checked through dim Proj S ≤ dim S − 1 and dim R[It] ≤ dim R + 1.

The fix is right. One inaccuracy: item 49's statement does mention the bound as a cited step, so "only in the references" is slightly off. The ring-level bound may alternatively go to R03.3.

## /6 — confirmed; fix changed (low)

**The file is not the published version.** The file the extraction calls "the author's copy of the published version" is the author's final manuscript:
- its PDF metadata date it 28 July 2020, and page 1 prints that date;
- it is the author's own pdfTeX build;
- it has 24 pages, while the Duke article has 37.

The extraction has no `sourceVersions`, and every E1–E9 locator repeats the description. Crossref shows no registered correction.

**Correction to the fix:** do not add the paper to `research/blueprint/collation/REQUESTS.md`. That file is regenerated by `scripts/collation.py --write` and lists only findings whose `affects` is "a stated result". E1–E9 are "nothing" or "the proof", so a hand edit would be lost.

**Instead:**
- Describe the file correctly.
- Add `sourceVersions` entries for the author's manuscript and arXiv v2.
- Leave a maintainer note asking for the Duke text to be checked by hand, especially for E1 and E2.

## For the fix job

Findings 1 and 2 are medium and become FIX-RT-PAPER-CESNAVICIUS-21. Apply them with the refinements above:
- /1: put the ordering on the job that designs Macaulayfication, and name the supplier by title, id and extraction route.
- /2: move items 39, 79 and 80 to R03.3 now, with no cross-paper move needed.

The low findings, if applied, should follow the corrected placements:
- /3: SF.0;
- /4: R03.3, in ring form;
- /6: a maintainer note, not `REQUESTS.md`.
