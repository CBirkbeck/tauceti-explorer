# Handoff: PAPER-CLOZEL-THORNE-17

Claude Code, session `cc-442dc5`, 22 September 2026 (issue #1336).

## Done

The extraction is complete (`status: complete`). `scripts/check_paper.py` reports ok, `intake.py check-files` reports no problems, and every missing item is routed exactly once.

**Deliverables:**

- `research/blueprint/papers/PAPER-CLOZEL-THORNE-17.result.json`: 56 items (9 planned, 47 missing), four routes, 15 prerequisites and five source issues.
- The report, `research/blueprint/papers/PAPER-CLOZEL-THORNE-17.md`.

**The four routes:**

- a Part II of ModularityAndLanglandsExtensions (33 items);
- sources to ML.0/ML.2/ML.3 (8 items), SmoothRepresentationsOfLocalGroups SR.1–SR.3 (4 items) and LocalGaloisDeformationRings L7 (2 items).

**What was read.** The accepted manuscript (10 December 2015, 53 pages), read in full, from the author's homepage and the Cambridge repository; the two copies have identical text. The paper is not on arXiv. The published Duke article could not be accessed: Project Euclid blocks automated access. Locators therefore give accepted-manuscript pages, and the source issues were not checked against the published text.

## Judgement calls for the reviewer

These are listed in the report. The main ones:

- Thorne 2015 and Theorem 5.7 sit in this Part II rather than in the proposed PolarizedAutomorphyLifting Part II of Boxer–Calegari–Gee.
- Kazhdan–Lusztig is a source of SR.3.
- The line between the endpoints (ML.3) and the method (the Part II) is drawn at Theorem 6.1 versus Theorem 6.2.

## Not done

Nothing remains in the extraction. A later worker with access to the published version should check whether E1–E5 survive. Clozel–Thorne I and II are prerequisites not yet in the paper batches.
