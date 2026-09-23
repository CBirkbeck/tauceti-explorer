# Mistakes in Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*

Original job: ERRATA-PAPER-HARPAZ-WITTENBERG-20, Claude Code — cc-442dc5. Independent review: REV-ERRATA-PAPER-HARPAZ-WITTENBERG-20, Codex — codex-hjdg0j, 23 September 2026. The two findings are confirmed **with the corrections and source-version limits below**. The [review report](../reviews/REV-ERRATA-PAPER-HARPAZ-WITTENBERG-20.md) gives the independent reasoning and provenance.

The bibliographic reference is J. Amer. Math. Soc.33 (2020), 775–805, DOI10.1090/jams/943. The actual versions checked are the [author manuscript](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf) and [arXiv v2](https://arxiv.org/pdf/1802.09605v2). The relevant passages agree. The published AMS full text returned HTTP403, so **journal wording is unverified**. No correction was located in the author page, arXiv history, Crossref metadata or targeted correction searches; this is not a claim of priority or a proof of absence.

## E1 — Remarque4.5: an unstated extension of the cited fibration theorem

**Gap; affects the proof.** Theorem4.2(i), invoked on manuscript PDF17, carries the rational-connectedness hypothesis fixed at the start of §4. The remark does not verify that hypothesis for its new fibration. Adding rational connectedness of X is one sufficient restricted repair.

The earlier claim that this requires changing a stated result was too strong. Proposition3.3(i) already supplies a geometric section without rational connectedness. The classical fibration argument has a weaker section condition, so the original implication is not disproved. Preserving its full generality requires stating and justifying the corresponding section-based version of the fibration theorem. This review confirms the mismatch with the literal cited theorem; it does not assert that rational connectedness is necessary or certify the full split-fibre generalization. The superseded assessment is retained in the JSON history.

## E2 — Introduction: the quaternion-group range

**Misprint; affects nothing.** The manuscript PDF4 uses m≥1. In the convention of [Demarche's cited author manuscript](https://webusers.imj-prg.fr/~cyril.demarche/articles/BMgroupes.pdf), §8 PDF26, the presentation starts at m≥2 and includes Q4≅C4. Indeed, at m=2 its relations give x=y² and y⁴=1. The exponent 2^(m−2) is not integral at m=1.

Use **m≥2 with the cyclic endpoint Q4**, or explicitly restrict to **m≥3 for the nonabelian groups**. The previous correction m≥3 unnecessarily removed a case that Demarche includes. No weak-approximation conclusion for the actual groups is changed.

Neither finding supplies a counterexample to the main theorems. Their full proofs were not independently recertified in this two-finding review. JSON validation, four-file intake validation, whitespace checks, manuscript comparisons and exact finite group diagnostics pass. No Lean file was compiled.
