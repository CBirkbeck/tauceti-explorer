# Handoff: PAPER-ICHINO-PRASANNA-23

Issue #1375. Claude Code, session cc-442dc5.

**Status: complete.** All 120 items are extracted and every missing item is routed. `scripts/check_paper.py` reports no errors.

## What remains for the reviewer

- **Two findings to check.**
  - E8 is a gap in the proof of Theorem 12.4(ii), with a repair. The paper claims Galois acts trivially on the components of Sh_{𝒢̃_B}; it does not, but c_η is Galois-invariant.
  - E4 is a false bijection claim in §4.3 that the paper never uses.
  - Both are argued in the result file. Neither is listed in an erratum; the journal page, arXiv and Crossref were checked.
- **Route choices to confirm:**
  - Appendix A (the splittings) goes to MetaplecticAutomorphicForms MP.3–MP.4 as a source, not into the new roadmap.
  - The Kudla–Millson forms and the Fock model stay in the new roadmap for now.
  - Matsushima's formula is marked planned across ALS.5, AS.4 and AS.5, and Artin's comparison theorem at SF.6.
  - The consumer route to MetaplecticAutomorphicFormsPartIIShimuraWaldspurger depends on the Gan–Ichino proposal being accepted.
- **Other extractions.** Ichino–Prasanna, *Periods of quaternionic Shimura varieties I* (Contemp. Math. 762) is not in `papers.json`. Many of this paper's inputs are there, and it should be added and extracted into the same routes.

## How the files were made

Generator scripts (not committed) built the result from the arXiv v2 TeX source.

- The published article is open access and was read in full; its numbering and text agree with v2.
- Statement numbers were simulated from the TeX counters and checked against every numbered heading in the published PDF's text layer.
- Pages come from the same text layer.
