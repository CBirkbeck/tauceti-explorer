# PAPER-YANG-ZHAO-25 handoff

Codex — `codex-c83e7a`; issue #1218; 2026-09-23. Second partial checkpoint,
continuing PR #1963 by codex-a71f92. Nothing is claimed formalized.

## Completed in this continuation

- Reread all 51 pages of arXiv v4; matched its prior SHA-256 and inspected the
  character-choice page as an image. The full alternative-proof reading remains
  attributed to the previous worker; it was not repeated.
- Added Q01–Q10: explicit finite local character coefficients, linear-retraction
  detection, transport of ULA/trace/defect/supported classes/nearby cycles,
  invariance of integer total dimension, and conditional Milnor descent.
  Coefficient degree need not be invertible. The supported lift is compared
  before forgetting support.
- Read Saito18 pp.1–5 including Lemma 2 and its full proof; M17/M18 supply the
  finite étale characteristic-cycle and Chow pushforward step in M14. Retained
  the distinction between coefficient extension and geometric field extension.
- Read all eight exact pinned library statements, adding the monic quotient
  power basis, Artinian-localization surjectivity, finite-flat local freeness
  and residue criterion for a split injection.
- Retained every old item/route/source issue. Now 130 items, 272 acyclic edges,
  8 library / 10 planned / 112 missing; 47 definitions/constructions with
  141 API statements and 141 proposed mathematical tests; five routes.
- Added E8 (character-choice proof omission) and E9 (Saito18 support typo),
  without independent-review verdicts. The nine findings are version-specific.
  All eleven gap IDs remain; the solved subparts of G07/G10 are identified.

## Resume here

1. Obtain the final Umezaki–Yang–Zhao journal paper for G09. The correct
   author-linked URL is
   https://www.ams.org/journals/tran/2020-373-10/S0002-9947-2020-08187-2/S0002-9947-2020-08187-2.pdf
   (HTTP 403 in this pass). Reconcile the precise quasi-projective pencil,
   smooth-center and transversal-fiber hypotheses; do not infer a false
   theorem from a difference with the older arXiv version.
2. Obtain the Yang–Zhao journal PDF for G01 and reconcile numbering/findings.
   Both ordinary and encoded Springer PDF endpoints returned HTML previews.
3. Close G07's actual local Fourier and finite-local/modular-to-adic input:
   final UYZ 5.2.6 and the exact Laumon statements. Preserve Q01–Q10 rather
   than reintroducing an invertible coefficient-degree assumption.
4. Continue G02–G06/G08 and G10: enhanced geometric six operations, precise
   purity/finiteness, full ULA extension with its open identification,
   nearby-cycle goodness, microlocal existence/integrality, Bloch localized
   Chern classes and Saito2021 Lemmas 2.1.3(2)/2.1.4.
5. Refine broad supplier leaves (G11) into exact blueprint interfaces. Keep
   formal coefficient comparison in EDS conditional on already constructed
   operations; geometric instantiations import B02 separately. Preserve the
   acyclic prefix dependencies and the same five ownership routes.

## Checks and limits

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YANG-ZHAO-25.result.json`: passed.
- `python3 research/blueprint/intake.py check-files` on the three deliverables:
  passed, 3 files and 0 problems.
- Custom resolved-ID, DAG, route, API/test/use and gap audit: passed.
- Exact finite diagnostics: 159 cases passed, including F2→F4 with trace(1)=0
  and a linear retraction, characteristic-4 cyclotomic coefficients, residue
  non-detection, wild-invariant base change and the skyscraper sign. These
  computations do not establish the general geometric comparison theorems.
- Earlier worker checker-suite and finite diagnostics remain attributed to
  that checkpoint and were not rerun here.

No Lean file is authorized for this paper issue and none was compiled. The
141 mathematical specification tests remain proposed proof obligations.
Source hashes, exact reading scopes and inherited-reading attribution are in
the JSON. No author contact occurred. Library and ownership inputs were
refreshed before publication; the snapshot is in `ownershipAudit`.
