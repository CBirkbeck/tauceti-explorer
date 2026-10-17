# FIX-RT-AREA-iwasawa-3~4 handoff

Refs #8925. Codex, session `codex-rmGSAt`, 17 October 2026.
One claimed job; bounded fix pass complete, independent review pending.

The full findings/dispositions, source versions, excluded atlas replacement
and fresh validation receipts are in
`research/blueprint/redteam/RT-AREA-iwasawa-3.fixes-4.md`.

- GH.1 now separately carries finite unramified F/Q_p and smooth proper
  models; its selected-CM application and arbitrary-twist non-example are
  explicit. The GH revision handoff records this correction.
- Kato Lemma 8.8 now uses r′ in n^(r′−1). Its two light scalar definitions,
  source-normalized evaluation adapter and three proved regressions prevent
  the remaining error from reintroducing the wrong Euler linear term.
  Findings /2 and /4–/7 were already correct and were freshly checked.
- Four MC.6 targets specify the actual full comparison algebra, its canonical
  coefficient inclusion/localization, extended fibres and complex comparison,
  heap, both action conventions and period point. The reader's **Full Nori
  comparison adapter** section gives the exact construction and equations.
  New heavy carriers are reader targets under the current roadmap shape rule.
  The legacy Suggested file is not an implementation or a package; the
  implementation gap and unrelated MC.5/reconstruction gaps remain explicit.
- PS.9's genuine consumer imports that full interface without changing
  Brown's graded H into a localized period algebra.
- PS.2 integration and the 2πi normalization still belong to
  `BP-PeriodsAndSpecialValues--PS.0`. Use the exact PS.2 atlas/campaign
  replacement in the report; neither excluded atlas path was changed.

Every review/reviewHistory object, node id and implementationStatus is
preserved. Motives remains partial with its independent needs_changes
verdict. Do not accept or promote it from this worker's own fix metadata.
The next job is the independent REV-FIX round, not another rewrite of the
correct arithmetic nodes.

All four packet checks passed without errors or warnings. All four complete
suggested files passed fresh sequential lean-check at the pins, with only
sorry warnings (GH 242, Kato 134, Motives 817, PS 192). The report records
current-upstream revisions and public-source hashes so the temporary PDFs
and logs are unnecessary. Scratch is removed after submission; no Lean
process or source copy is left for a successor to depend on.
