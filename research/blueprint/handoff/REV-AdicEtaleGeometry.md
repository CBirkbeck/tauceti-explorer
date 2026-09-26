# Handoff: REV-AdicEtaleGeometry

Issue #343; ChatGPT Pro; session `cp-20260926-6f2c`; 2026-09-26.
Claim 5847596653 was confirmed by bot comment 5847597652.

## Partial review, not acceptance

Read `research/blueprint/reviews/REV-AdicEtaleGeometry.md` first. It is the deliverable from this pass. The recommendation is **needs changes**, based on five concrete findings. This is a report-and-handoff checkpoint, not a completed review of all 153 nodes or an applied packet repair.

Inspected snapshot: `f1d6d5fae611f9e4455112d6ffe0c258081fe1ee`; packet blob `6a704b53c186e889c2aae8617f7b16325314044f`.

Only the review report and this handoff were written. The packet, suggested Lean file, roadmap document and previous author's handoff are unchanged. In particular, no top-level packet review object or source-issue review child was inserted. The available contents write action requires a complete replacement of the large packet; this pass did not safely reconstruct that file for a partial edit. Do not mistake the report's proposed edits for committed mathematical corrections.

## Exact next actions

1. Apply F1 to `A3/perturbation-of-generators`: transported equations use the inverse substitution for pi' = pi composed with theta. Check downstream presentation transport. Add the Q_3 translation test from the report.
2. Apply F2 to the same node: X is in the image of X -> varpi X; use the convergent geometric series whose putative preimage has coefficients all equal to 1 as the non-surjectivity witness.
3. Apply F3 to `A3/restricted-power-series-newton`: either retain the frozen inverse and prove linear valuation growth, or use a changing Jacobian and prove the genuine Newton estimate. Keep the exact Q_3 residual sequence 1,2,... as a regression for the frozen iteration.
4. Apply F4 to source issue E7: reject the current argument about simply connected analytic discs, using C_p<U>/C_p<T>, T = U^p - U. Independently justify any proposed corrected-covering convention; do not infer that the intended topology is false.
5. Repair the final proof step of `A3/conormal-description` (F5). The cited underived base-change API has hypotheses not established there. Tor_1^{C_p<T_1,T_2>}(C_p,(T_1,T_2)) is C_p, even in this regular embedding. Use the local Koszul/conormal and gluing route, not an invented Tor-vanishing assertion.
6. Record the focused source-issue results after rechecking their exact wording: E19's incomplete-base obstruction is supported against the literal arXiv v4 statement; E20 is confirmed with the existing Berkeley attribution. Neither result completes review of the other 17 source-issue records.
7. Continue the item-by-item review of every remaining node, source locator, baseline entry, API and test. In this pass only the three basic Tau Ceti declarations `PairOfDefinition`, `IsPseudoUniformizer`, `IsTateRing` were independently read at the pin; the remaining baseline entries are not certified.
8. Reconcile the packet and suggested file under the issue's allowed paths. The issue does not authorize editing the companion roadmap document; record any required synchronization for its owner rather than silently editing it.
9. Run `scripts/check_blueprint.py` with the pinned declaration index, check the whole dependency graph and compile the suggested Lean file where the pinned environment is available. Then write the required top-level review object, using `independent-review-REV-AdicEtaleGeometry`, with an honest per-node ledger. Acceptance requires the full checks in the issue.

## Checks actually executed

Exact rational arithmetic checked the translation image (6 rather than 0 for the wrong generator) and nine frozen-Jacobian residual valuations. The report gives proofs of the general counterexamples. ECD's Lemma 15.3 page and the erratum pages were rendered and inspected; Berkeley p. 75 was read as parsed text only. Stacks 064Z, 062D, 0C1B and 05ZI were read.

No local repository validator, declaration-index check, global cycle check, or Lean compilation ran. The author's previous compilation result is not this reviewer's result. The suggested Lean file remains unchanged and was not compiled in this pass.
