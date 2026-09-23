# Handoff: PAPER-SCHROER-23

Issue #1087. Claude Code, session cc-442dc5, 23 September 2026. It continues the merged checkpoints of Codex sessions codex-a71f92 (#1653) and codex-c83e7a (#1661).

**Status: complete.**
- 212 items: 16 library, 12 planned, 184 missing.
- Every missing item is routed exactly once, across the nine routes of the checkpoints.
- 17 mistakes are recorded under `sourceIssues`.
- `scripts/check_paper.py` and the intake file check pass.

## What this continuation did

- **Read and recomputed.**
  - The arXiv v3 TeX source was read in full, with its PDF.
  - Statement and equation numbers were simulated and matched to the PDF.
  - The eleven Weierstrass equations and the Gram matrices (14) and (16) were recomputed independently. Everything agrees with the paper.
- **Checked the repairs.** The repairs of Propositions 5.5, 9.3(v) and 9.5 (/63, /94, /97) were checked independently. The Proposition 5.5 gap was found from the paper before reading the checkpoint's argument, and was repaired the same way.
- **Added items /189–/212.** These are inputs the paper uses in its proofs that had no item: Kodaira–Néron, Szydło, the canonical bundle formula, tame and wild fibers, Lang 1956, twisted forms of P¹, isogeny invariance of point counts, rational elliptic and quasi-elliptic surfaces, Lang 2000 as used, Tate's algorithm, Mathlib's Weierstrass curves, the Weil conjectures, cycle classes, the Brauer–Hasse–Noether sequence, Pic(ℤ) = Br(ℤ) = 0, Kummer sequences, Tsen, the unimodular classification, norm maps, minimal models, Enriques reducibility, Artin's representability and Raynaud's subgroup–torsor correspondence. The briefs of the genus-one fibrations Part II and the Enriques roadmap now name them.
- **Converted the findings into `sourceIssues`.** The checkpoints' eleven findings were converted into E1–E17, and five slips were added (E2, E3, E9, parts of E16 and E17). Four entries carry repairs of proof steps: E6, E12, E13 and E14.
- **Restored stripped spaces.** The spaces lost before digits in the checkpoint's strings ("Proposition5.5, p16") were restored in the result and the report.

## What remains for the reviewer

- **Check the repairs:** E6 (with /176–/179 and /184), E13, E14 and E12.
- **Confirm the route choices:**
  - the widened SchemeAndStackFoundations source route (SF.1–SF.2);
  - /207 in the Enriques roadmap;
  - /211–/212 in the A0-extension source route.
- **Prerequisites.** Lang 2000, Lang 1983, Cossec–Dolgachev (1989 edition), Ekedahl–Shepherd-Barron and Fontaine 1993 are stated as the paper uses them. They were not re-derived. They are listed as prerequisites for the design jobs.
- **Published version.** The 63-page published version was not available. Locators follow the author version, which equals arXiv v3.
