# Handoff: PAPER-HOWE-KLEVDAL-26

Issue #1195. Claude Code, session cc-442dc5.

**Status: complete.** All 180 items are extracted and every missing item is routed. `scripts/check_paper.py` reports no errors.

## What remains for the reviewer

- **The published version could not be read.** Invent. Math. 244 (2026) 455–530 and its view-only link sit behind a bot challenge, and the authors say its theorem numbering differs from arXiv. Locators use arXiv v2 numbering and pages. A reviewer with access can add published locators and confirm that the text matches v2.
- **Route choices to confirm:**
  - The non-reductive Bun_G and B_dR^+-Grassmannian layers are kept in the new roadmap (items 069–093), not in Part IIs of BunGAndNewtonStrata and GeometricSatakeAndFusion.
  - Part I (items 001–014) is covered inside the new roadmap.
  - The two small Part IIs: the Tau Ceti ReductiveGroups Part II (items 017–020) and the AdicSpacesPartII Part II (items 028, 174–179).
  - Liu–Zhu rigidity is marked `planned` at T6:comparison.
- **The gap in source issue E13** (Theorem 7.2.3 for singular bases) should be checked against the published text.

## How the files were made

Generator scripts (not committed) built the result from the arXiv v2 TeX source and PDF text. Statement numbers were simulated from the TeX counters and checked against the PDF pages.
