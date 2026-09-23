# Independent review of ERRATA-PAPER-KISIN-PAPPAS-18

Job `REV-ERRATA-PAPER-KISIN-PAPPAS-18`, issue #1879.
Codex, session `codex-a71f92`, 23 September 2026.

**Complete: all eight findings confirmed after amendments; none rejected or added.**
E1–E7 are known published corrections; E8 remains new within the recorded search.

The original errata worker was `cc-442dc5`, and the extraction was by `codex-c83e7a` / `cc-fb70e5`. I wrote neither. The winning claim was comment 5796076859, confirmed by bot comment 5796079263.

## Evidence and scope

I read the original **published** KP18 passages and the **published** KPZ26 corrections, not just an inherited report. Exact URLs, hashes, locators, image checks, version differences and direct calculations are in [the amended explanation](../errata/PAPER-KISIN-PAPPAS-18.md). The corresponding correction passages of KPZ26 arXiv v3 were compared as well. This is a complete check of the eight findings, not a complete audit of either paper.

## Verdicts

| Finding | Verdict and amendment |
| --- | --- |
| E1 | Confirmed. Added a rank-two change of normal decomposition giving u′=u+[t]v; the horizontal map kills this nonzero difference. The correct comparison exists, but is not the old recipe. |
| E2 | Confirmed as a **gap**, not a disproved general assertion. Smoothness cannot supply tensor preservation of a prescribed reduction; very-goodness supplies it. The sequel conjectures good⇒very good. |
| E3 | Confirmed as a **gap** reaching the justified scope of stated results. Checked propagation into the local-model diagram and its corollaries, and the published replacement hypotheses. Fixed published/preprint numbering. |
| E4 | Confirmed with an action qualifier. q_loc is not a torsor projection for the natural action; checked the action-map factorization and inverse giving smoothness. Do not deny torsor structures for other transported actions. |
| E5 | Confirmed. Added an explicit τ-Cauchy sequence over Z_p[ε]/(ε²) having no limit; checked the tail-shift convergence in the sequel's replacement. Clarified the lattice p-adic topology after inverting p. |
| E6 | Confirmed. Checked the conjugated stabilizers, disjoint union and closure construction. The Yu Luo / Peihang Wu acknowledgment belongs here, not E7. |
| E7 | Confirmed. Spelled out the type-D real-place condition and the obstruction from incompatible kernel degrees. The abelian-type application satisfies the extra condition. |
| E8 | Confirmed. Published page image has the full-rank typo; the correct rank is dim(V′)/2. The same typo persists in v3 and the current author PDF. |

All entries carry `review.by = REV-ERRATA-PAPER-KISIN-PAPPAS-18`.
Classification totals after review: four errors, three gaps, one misprint; five affect stated-result scope, two affect a proof, one affects nothing as intended.

## Limits and checks

Zink's general logarithmic-coordinate/completeness theorems and Deligne's classification are background results used by the published correction; no claim is made to reprove them here. No counterexample to good⇒very good or to all original geometric conclusions is claimed. Correction-search absence is bounded by the sources listed.

No Lean file was changed or compiled. Validation and registry checks are recorded in the handoff.
