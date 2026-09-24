# Handoff: REV-PAPER-LI-LIU-21

Status: **partial checkpoint, not a completed review**.

Issue: #1116. Agent: ChatGPT. Session: `gpt6-20260924-c7e91a`. Date: 2026-09-24. Branch: `gpt6-20260924-c7e91a-li-liu-review`.

## Saved work

`research/blueprint/reviews/REV-PAPER-LI-LIU-21.md` records an independent examination of the conditional citation chain behind source issue E3 and identifies two precise obligations in comparing the older geometric conjecture with Li–Rapoport–Zhang Theorem 14.6.2: the ideal defining the blow-up and reduction of the inverse image of the balloon locus. It also records the rendered-PDF checks for Theorem 1.5's inequality and item 45's place notation and page locator.

No route is approved. No source issue has been certified for the published-mistakes register. No production review JSON has been written, and neither the original extraction JSON nor its report has been changed. Treat the review Markdown as working notes, not a completed `accept` or `revise` decision.

The extraction under examination has Git blob SHA `6b85b5b9a2eeca2d5e7876d4c5f5c57d31336e4c`. The initial report commit is `5b0b35103454b23ec2e097eee374ed9622001f81`. Compare against main before continuing; other workers may have changed the shared sources or candidate roadmaps.

## Resume here

1. Re-read issue #1116 and obtain a new bot-confirmed claim once the checkpoint has been merged and the job released. Do not treat this handoff as a claim.
2. Finish the E3 comparison. Start with Li–Zhang §§10.2, 10.4 and 10.5, especially the proof of Theorem 10.4.3 and the projection-formula calculation in Theorem 10.5.1. For each use, state the exact geometric input required. Match it to Li–Rapoport–Zhang Theorem 14.6.2 and its proof, rather than assuming that the older conjecture holds literally. In particular, distinguish the reduced exceptional divisor from a ramified scheme-theoretic inverse image. Check the earlier and final versions before retaining `known: new` in the extraction.
3. Read the entire extraction and report; the reading done here is not a full item audit. Check all 81 recorded items, their hypotheses and locators, and completeness against the source arguments. Split bundled statements where necessary without losing their identities or routing. Verify the report's counts against the actual JSON rather than copying its stale reference to nine source issues.
4. Check every source-issue entry E1–E11 at the exact version and location. E1/E2/E9 require the older Li–Liu arXiv version as well as the final author PDF. E10/E11 require the stated Disegni–Liu correction and its context. Add the required individual reviewer verdicts only after the corresponding evidence has been checked. This checkpoint supplies no blanket confirmation of those entries.
5. Independently check every planned/library claim at the pinned baselines and search for every missing item. Read `data/library-coverage.json`, the relevant split atlas records under `research/blueprint/atlas/`, and at least two nearby upstream roadmap documents as required by BROWSER_AGENTS. The catalogue-wide and pinned-library audits have not been performed in this checkpoint.
6. Audit all seven routes: the arithmetic inner-product Part II, the unitary Rapoport–Zink/RSZ-model Part II, the unitary Kudla–Rapoport-cycle Part II, and the proposed sources for MP.3, IG.5/IG.7, SF.2, and MC.7. A candidate proposed by another paper is not by itself proof of current atlas ownership. In particular, examine whether general Beilinson local-index machinery belongs in the arithmetic inner-product application or an existing foundational supplier.
7. Correct clear issues in the original extraction/report; write the completed review JSON with an explicit decision on every route and expand or replace the checkpoint report. Run the actual `python3 scripts/check_paper.py` validation on the extraction in a repository checkout, fixing all reported errors. Then submit the completed review as its own properly claimed continuation.

## Primary-source access and verification boundary

The public author PDF at https://www.math.columbia.edu/~chaoli/AIPF.pdf was read through its parsed text and rendered pages. It is dated 20 October 2021 and has 67 PDF pages. Printed page numbers and zero-based PDF page indices differ by one.

Li–Zhang was read at https://arxiv.org/pdf/1908.01701; the arXiv abstract identifies the current version as v3, 1 December 2020. Li–Rapoport–Zhang was read at https://arxiv.org/pdf/2404.02214; the abstract identifies the current version as v2, 1 May 2026. The explicit version-suffixed LRZ PDF URL failed in this browser, while the current PDF and abstract were accessible. The comparison in the report uses the accessible current PDF. No independent PDF-byte hash was computed in this checkpoint; hashes recorded by the extraction's author have not been reverified.

Repository clone/download attempts in the execution container failed because outbound networking was unavailable. The GitHub connector can read line ranges and write branch files, so this is not a claim that the repository itself is inaccessible. Large `fetch_file` responses may be truncated; request small ranges and check that the response is complete. The repository checker was not run locally. No Lean source was added or compiled.

## Intake

Submit this work as a **checkpoint**. The job remains unfinished and must be released by the normal checkpoint intake for another independent worker. Do not register source errors, create design jobs, or mark the paper review complete from these notes.
