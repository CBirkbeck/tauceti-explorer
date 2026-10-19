# REV-DESIGN-InertAnticyclotomicCMMainConjecture — handoff

Refs #1727. Claude (Opus), session `claude-VApKDW`, 19 October 2026. Branch
`claude-VApKDW-rev-design-inert-anticyclotomic`. The claim was confirmed by the bot in
[comment 6257699185](https://github.com/CBirkbeck/tauceti-explorer/issues/1727#issuecomment-6257699185). This
session did not write the design (Codex, `codex-VY453x`, PR #10445) and claimed no other job.

## Done

- **Verdict: accepted.** The full account is in the [review report](../reviews/REV-DESIGN-InertAnticyclotomicCMMainConjecture.md),
  and the `review` object of the packet has a verdict for each of its 36 nodes.
- **Main correction.** The inert input of IC.3 was stated as char(X)=char(U/C̄), which is Rubin's split-prime case.
  It is now Rubin 1991 Theorem 4.1(ii), on χ-parts nontrivial on the decomposition group of p. It is imported from
  CMAllPrimeMainConjectures `CZ.2/classical-two-variable-main-conjecture`, whose design merged the same day.
- **Gaps.** G4 and G6 are closed with complete arguments. G2 is narrowed to the translation for the Gross avatar. G5
  now names Billot Theorem 3.24 (Numdam), its hypotheses and its involution.
- **New lemma.** IC.5/specialization-length-bound, with four Mathlib declarations read at 082e2d3.
- **Source issues.** Three added, E1–E3, each with this review's verdict.
- **Suggested Lean file.** It now has real-bodied conductor/sign and control-element definitions. The AH/BKO sign swap
  is proved. `lean-check` exits 0 with only `sorry` warnings (10).
- **Roadmap definition.** Its README, its prerequisites, IC.3's `requires` (adds `CMAllPrimeMainConjectures:CZ.2`, a
  pending link until that roadmap is promoted), the IC.3/IC.5 descriptions and its sources are updated.
- **Checker.** `check_blueprint.py` reports 0 errors and 0 warnings.

## Needs the maintainer

The reader document `research/blueprint/readmes/InertAnticyclotomicCMMainConjecture.md` is a design output but not an
output of this review, so it was not edited. It still shows the design's text: the wrong Rubin formula, G4 and G6, and
the old strict-control node. Promotion copies it as it is. Re-render it from the reviewed packet, or queue a sync job.
The report's last section lists the passages by line.

## For later jobs

- CMAllPrimeMainConjectures review (REV-DESIGN, pending): IC.3 consumes CZ.0/standard-elliptic-unit,
  CZ.2/elliptic-unit-euler-system, CZ.2/rubin-iwasawa-modules and CZ.2/classical-two-variable-main-conjecture. The last
  of these already states part (ii) correctly.
- NonordinaryCMSpecialValues (design pending) is the G1 supplier: the Gross realization, root numbers, and
  nonvanishing of infinitely many matching twists.
- PadicMeasuresIwasawaAlgebras is merged upstream (TauCetiRoadmap #780). Its README §4.6 supplies the characteristic
  ideal API the packet cites by old packet ids. Two things are not there:
  - restriction of scalars over a base other than Z_p;
  - the identification of the divisor coefficient with the order of vanishing.

  Both are in the rewritten L4 request.
- Free sources now in the packet:
  - Rubin 1991: GDZ, `PPN356556735_0103/LOG_0009`, a scan; read §4 from page images.
  - Billot 1986: Numdam `CM_1986__58_3_341_0`.
  - AHI preprints: arXiv math/0302319 v1–v4. The TeX sources of v1 and v3 settle the numbering question.

Scratch files (the downloads and the rerunnable edit scripts) are disposable; nothing here depends on them.
