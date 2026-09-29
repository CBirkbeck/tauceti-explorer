# Handoff: PAPER-KEDLAYA-LIU-15 (Kedlaya–Liu, Relative p-adic Hodge theory: Foundations)

Issue #4546. Checkpoint 1 (chapters 1–3): Claude Code, session cc-58621d. Checkpoint 2 (chapters
4–7): Claude Code, session cc-fb70e5, 29 September 2026. One checkpoint remains.

## Done

- **Source.** arXiv 1301.0792v5 (the version to appear in Astérisque; PDF and LaTeX source), and the
  authors' errata for this paper, which are Appendix A of part II (arXiv 1602.06899v3). The published
  Astérisque text was not obtained: the eScholarship copy returned HTTP 403.
- **Coverage.** The introduction and chapters 1–7 (pp. 3–156), read line by line with their proofs.
  They give 228 items (18 library, 108 planned, 102 missing).
- **Routes.** Nineteen `source` routes take every missing item.
  - Routes 1–16 come from checkpoint 1.
  - Checkpoint 2 extends route 12 (PerfectoidSpaces P3) with the finite étale comparison of §5.5,
    and names almost purity there.
  - Route 17 (RelativeFarguesFontaine RF0:annuli, RF1) takes the relative Robba rings of chapter 5.
  - Route 18 (VectorBundlesAndIsocrystals VB2:ampleness) takes two items of §6.3.
  - Route 19 (VB4) takes the slopes-in-families items of chapter 7.
- **Mistakes.** 53 recorded (E1–E53): 31 new, 22 in the authors' errata.
- **Prerequisites.** Three so far: Kedlaya's *Nonarchimedean geometry of Witt vectors*, his *Slope
  filtrations for relative Frobenius*, and Rodriguez's thesis.

## Remaining

- **Chapter 8** (pp. 156–188).
  - Contents:
    - topological properties and adic spaces (§§8.1–8.2);
    - perfectoid spaces (§8.3);
    - étale local systems (§8.4);
    - ϕ-modules and local systems (§8.5);
    - cohomology (§8.6);
    - the relative Fargues–Fontaine curve and ampleness (§§8.7–8.8);
    - B-pairs (§8.9).
  - Likely owners: PerfectoidSpaces P2–P6, AdicEtaleGeometry, DiamondsAndVStacks,
    RelativeFarguesFontaine RF1–RF4, and VectorBundlesAndIsocrystals VB2 and VB4 (slope-zero bundles
    as local systems, Fargues–Scholze II.2.20).
  - Chapter 7 points ahead to Corollaries 8.5.13–8.5.14 and Examples 8.5.17–8.5.18 (purity and the
    counterexamples in Remark 7.3.5).
- **Chapter 9** (pp. 188–203; the references follow).
  - Contents:
    - the pro-étale topology for adic spaces;
    - perfectoid subdomains;
    - ϕ-modules and local systems;
    - comparison of cohomology;
    - comparison with classical p-adic Hodge theory.
  - Likely owners: PerfectoidSpaces P6, EnhancedDerivedSheaves, PhiGammaModulesAndIwasawaCohomology
    and PadicHodgeTheory P8.
- **Known errata to check.** The part II appendix also corrects Definition 8.1.6, Remark 8.1.7,
  Definition 8.2.11, Proposition 8.2.20, Theorem 8.6.4 and Proposition 9.2.6.
- **Overlap with atlas findings.** These atlas findings already concern this paper; check them
  for overlap and for the `known` field:
  - AdicEtaleGeometry/E4, E5, E13, E18, E21 (E21 is Proposition 8.2.20);
  - AdicSpacesPartII/E20, E21, E39, E58;
  - PerfectoidSpaces/E10, E11, E16, E19, E20, E56.
- **Numbering.** The next item is 229 and the next finding is E54. The theorem counter is shared
  within each subsection.
- **Finishing.** Set `status` to `complete` only after chapter 9. Then update the summary, the
  prerequisites and the report.
