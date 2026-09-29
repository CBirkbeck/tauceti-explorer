# Handoff: PAPER-KEDLAYA-LIU-15 (Kedlaya–Liu, Relative p-adic Hodge theory: Foundations)

Claude Code, session cc-58621d; issue #4546; 29 September 2026. Checkpoint 1 of about three.

## Done

- **Source.** arXiv 1301.0792v5 (the version to appear in Astérisque; PDF and LaTeX source), and the
  authors' errata for this paper, which are Appendix A of part II (arXiv 1602.06899v3). The published
  Astérisque text was not obtained: the eScholarship copy returned HTTP 403.
- **Coverage.** The introduction and chapters 1–3 (pp. 3–102), read line by line with their proofs.
  They give 172 items, whose statuses were checked against the pinned libraries and the atlas.
- **Routes.** Sixteen `source` routes take every missing item of chapters 1–3. Chapter 3 goes
  mainly to PerfectoidSpaces P1–P3, which name this paper as a primary source; Katz's
  correspondence goes to PhiGammaModulesAndIwasawaCohomology PG.1, the Witt-vector norms to
  RelativeFarguesFontaine RF0, and preperfectoid algebras to AdicSpacesPartII R5.
- **Mistakes.** 38 recorded for chapters 1–3 (E1–E38). 20 are new; the other 18 are corrected in
  the part II appendix.

## Remaining

- **Chapter 4** (pp. 102–113) reviews Kedlaya's slope theory over the Robba ring, mostly with
  proofs by reference; its Remarks 4.2.19 and 4.3.6 correct earlier papers, not this one. Likely
  owners are PadicDifferentialEquationsAndRigidCohomology, VectorBundlesAndIsocrystals VB0 and
  PhiGammaModulesAndIwasawaCohomology PG.0–PG.2.
- **Chapters 5–7** (pp. 113–156): relative extended Robba rings, their sheaf properties, ϕ-modules
  and vector bundles on relative Fargues–Fontaine curves, and slopes in families. Likely owners are
  RelativeFarguesFontaine RF0–RF4 and VectorBundlesAndIsocrystals VB1. Chapter 5 was read to
  Lemma 5.3.5 (p. 122); notes:
  - known erratum: Corollary 5.2.12, second display of the proof;
  - new: Remark 5.1.6 (p. 116) lifts y ∈ R̃^{int,r}_S to x ∈ R̃^{int,r}_S where R̃^{int,r}_R is
    meant; the proofs of Lemma 5.2.8 (p. 118, twice) and Lemma 5.2.10 (p. 119) define z = y − x
    and y = z − x where x − y and x − z are meant (the lemmas write x = y + z).
- **Chapters 8–9** (pp. 156–211): perfectoid spaces, local systems, the relative Fargues–Fontaine
  curve and ampleness, B-pairs, the pro-étale topology and relative (ϕ, Γ)-modules. Likely owners
  are PerfectoidSpaces, DiamondsAndVStacks, AdicEtaleGeometry, RelativeFarguesFontaine,
  VectorBundlesAndIsocrystals and PadicHodgeTheory P8. The part II appendix also corrects
  Proposition 6.2.4, Lemma 5.5.5, Remark 7.4.12, Definition 8.1.6, Remark 8.1.7, Definition 8.2.11,
  Proposition 8.2.20, Theorem 8.6.4 and Proposition 9.2.6.
- Set `status` to `complete` only after chapter 9. Then update the summary, the prerequisites
  (so far only Kedlaya, Nonarchimedean geometry of Witt vectors) and the report.

## Where to resume

- **Page map.** The v5 LaTeX source numbers statements by subsection (Theorem x.y.z, shared
  counter), and the PDF page of each statement is in the extraction's locators.
- **Next items.** Start chapter 4 at Hypothesis 4.1.1, p. 103. The next item id is
  PAPER-KEDLAYA-LIU-15/173 and the next finding id is E39.
