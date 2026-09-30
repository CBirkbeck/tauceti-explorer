# FIX-RT-PAPER-HE-LI-SHI-ETAL-23

Refs #4996. Codex — codex-5ebb6f, 30 September 2026. Input revision `6daead3a85ff31d2f06e629f82e46b6cfd0408ef`. Applies confirmed finding RT-PAPER-HE-LI-SHI-ETAL-23/1 with the two material qualifications in [its independent verifier](RT-PAPER-HE-LI-SHI-ETAL-23.review.json). Independent REV-FIX remains pending.

## Source receipts and the seven statements

Added explicit sourceVersions for the actual author-copy and arXiv v2 readings. The inherited 22 September full read/comparison is attributed to the extraction's Claude Code cc-fb70e5; the later full reread by Claude Code cc-442dc5 remains historical. Fresh 30 September receipts state this fixer's limited checks: hashing and page/version metadata, plus selected author-copy locators. Neither fresh receipt claims a new full proof read, full comparison, or independent mathematical verification of the 30 source issues.

The [author copy](https://www.math.columbia.edu/~chaoli/Kramer.pdf) has SHA-256 `a29d282011c4972663376d1dd86c40d8dc494d259c82d6d652e23bd1fffc8623`; [arXiv v2](https://arxiv.org/pdf/2208.07988v2) has SHA-256 `00e096d6e9b511934382db1e41dc4cf22419a021df06af58d2689dfb60b98b17`. Fresh downloads match both historical receipts and both PDFs have 82 pages.

E1, E2, E7, E9, E14, E23 and E24 each gain an explicit author-copy/preprint-only versionScope. The top-level sourceIssueScope and reader explain the same limitation, including the reported Lemma 9.6/induction defect: none asserts that the publisher printed identical text. E6 remains specifically the arXiv exponent corrected in the author copy. All original source-issue printed/correction/reason/searched/review fields, and their existing verdicts, are preserved.

The version of record was not read or collated. A fresh request to the publisher's PDF URL returned HTTP 200 with text/html, 329,945 bytes, rather than a PDF. The JSON records that as publisherAccess, alongside the historical failed access. **No `kind: published` sourceVersions entry is added.** The verifier showed that even an entry saying “not read” is treated by current collation.provenance as a completed published reading and suppresses the exposure. A negative in-memory check reproduces that failure. The original proposed fix's unread-published entry is therefore deliberately replaced by the verifier's safe correction.

## Catalog correction

Only this paper's papers.json entry changes: its citation now gives *Invent. Math. 234 (2023), no. 2, 721–817*, and its link is [the DOI](https://doi.org/10.1007/s00222-023-01209-1). The [Crossref deposit](https://api.crossref.org/works/10.1007/s00222-023-01209-1), fetched on 30 September, confirms journal, volume 234, issue 2, pages 721–817 and online publication on 21 July 2023. Metadata establishes the publication, not the mathematical content of its pages.

With the corrected DOI, the current published_exists returns true, provenance remains preprint, and exposure includes this paper's seven stated-result findings and all 30 total findings. The previous catalog entry returned false. No other catalog entry changes.

## Maintainer handoff: the broader collation detector

`scripts/collation.py` is outside this job's deliverables. Its JOURNAL expression still misses full Inventiones/Acta/Mathematica journal names. Please arrange a tooling fix, with regressions for those full names, actual arXiv-only/to-appear records, and failed publisher access. Prefer evidence of an established version of record (including a verified DOI) over a broad word match; a naive `Mathematic\w*` also matches the adjective in “A mathematical preprint (2023)”. An in-memory test using the exact journal alternatives Invent(iones), Acta and Mathematica(e), with the existing year requirement, avoids that particular false positive. This is a lead for the tooling owner, not a deployed repair or a complete detector specification.

Follow the verifier's scope correction: the original eight records contain 53 stated-result findings, but publication was established for seven papers/51 entries. Koymans–Pagano's catalog is undated and the verifier found “To Appear in Acta Mathematica”; do not invent a publication date or classify it as an established version of record. The seven established cases were HE-LI-SHI-ETAL-23, LI-ZHANG-22, CLAUSEN-MATHEW-21, CALEGARI-GERAGHTY-18, ESNAULT-GROECHENIG-20, NELSON-VENKATESH-21 and NIKOLAUS-SCHOLZE-18.

At this fix's input revision, ESNAULT-GROECHENIG-20 already records published provenance. Accordingly, after this paper's catalog correction, the unmodified detector exposes 70 papers/356 stated-result findings. The in-memory exact-name expansion exposes 75/398, adding LI-ZHANG-22 (5), CLAUSEN-MATHEW-21 (6), CALEGARI-GERAGHTY-18 (27), NELSON-VENKATESH-21 (2) and NIKOLAUS-SCHOLZE-18 (2). ESNAULT-GROECHENIG-20 stays excluded because its published text is recorded as read. Koymans–Pagano and synthetic arXiv-only/to-appear examples stay excluded. These current counts differ from the verifier's historical worklist; that history is not overwritten.

The next ordinary regeneration of the collation worklist can now include this extraction's seven statements. This job does not write the generated worklist, data/collation.json, or any tooling file. Actual version-of-record collation remains work for that job and must record what it reads before widening any finding's scope.

## Validation

All 46 item records (three planned, 43 missing), all 13 prerequisite records and all three routes are unchanged as parsed JSON from the input. All 30 original source-issue payloads are unchanged except for the seven new scope fields. The read-only errata collector retains all 30 existing confirmed verdicts; none is independently reissued here. No mathematics, ownership, stage direction or library status changes, so no new atlas graph or library claim is proposed.

Checks passed: `scripts/check_paper.py`; explicit `check_errata.versions_checked`; parsed preservation and single-catalog-entry checks; both PDF hashes and page counts; current detector exposure and the unread-published negative test; the scoped in-memory journal-name/arXiv/to-appear checks; `research/blueprint/intake.py check-files` on exactly the four deliverables; and `git diff --check`. No Lean file was changed or compiled, and no Lake project/build/cache/LSP was started. Only the four issue deliverables are edited. Supplier/tooling/generated files and the inherited independent review remain untouched.
