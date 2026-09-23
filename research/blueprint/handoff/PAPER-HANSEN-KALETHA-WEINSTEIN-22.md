# Handoff: PAPER-HANSEN-KALETHA-WEINSTEIN-22

Issue #1391. Claude Code, session cc-442dc5.

**Status: complete.** All 126 items are extracted and every missing item is routed. `scripts/check_paper.py` reports no errors.

## What remains for the reviewer

- **Route choices to confirm:**
  - Rigid inner forms and the refined LLC (items 007–014) are in the HeckeStacksAndLocalShtukas Part II. They should move if the Kaletha extraction's proposed EndoscopicTransferRigidInnerFormsPartII is accepted.
  - The generic 2-categorical trace (item 049) is in the VStack Part II. The Abe extraction's proposed EtaleDualityAndPerverseSheavesPartIIRelativeTraces plans the same interface for schemes, so the two should share one home.
  - Local terms on Grassmannians (items 079–087) are in the Hecke-stack Part II rather than a GeometricSatakeAndFusion Part II.
  - Items 094–095 (decency of Bun_G, and shtuka spaces as fibres of the Hecke stack) could be sources for BG3 and HS2 instead.
- **Source issues.** All fourteen were checked in the TeX source of arXiv v4 and in the published text layer. E3 is a real error in the proof of Lemma 3.1.1: the parametrization of tori lands in a kernel, not all of H^1(F, N(T, G)). The lemma itself is unaffected.

## How the files were made

Generator scripts (not committed) built the result from the arXiv v4 TeX source. Statement numbers were simulated from the TeX counters. Published page numbers were taken from the published PDF's text layer and spot-checked by hand.
