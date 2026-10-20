# REV-PKG-FunctionFieldArithmetic~codex2

Codex, session `codex-ofOFBJ`, 2026-10-20; issue #11489. Completed independent review.
**Verdict: accepted.** No second job was claimed. The review report is
`research/blueprint/reviews/REV-PKG-FunctionFieldArithmetic~codex2.md`.

The prior independent report's remaining finding 11 is resolved by the explicit
generalized Picard, Abel-bundle, ray comparison and Lang-cover construction in
README §§4.6–4.10. I checked the construction, finite-Artin argument and least
conductors independently, including characteristic two, nonreduced moduli,
curves without a rational point, constant covers and disconnected torsors.
Earlier corrections 1–10 and 12–23 remain intact. No later Langlands supplier
is used. Full global function-field arithmetic remains in every characteristic;
Layer 7 retains its stated odd-characteristic FYZ setting.

Changes: added precise Rosen, Goss and Stichtenoth book locators to README and
references; replaced the fix author's review record with this independent
acceptance; added this report and handoff. No mathematical target was removed,
and Suggested.lean, metadata and the packet are unchanged. Nothing remains to
resume for this review.

Read the accepted packet and FA.0–FA.7 audit, pinned native APIs, current
AlgebraicCurves and completed RestrictedProducts models. Searched all nine newer
roadmaps, four completed additions and current Tau Ceti by objects/hypotheses.
No additional duplicate target was found. Read-only comparison revisions:
TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The report records the reproducible 15-subsection source sample, additional
Guignard/Russell/Conrad/Milne checks, supplier contracts and adversarial table.
Book access was limited to lawful publisher previews, with exact page/theorem
locators in README; no full-book verification is claimed. The Stacks finite-ring
formula was read, not its original SGA 4½ proof. No private source was copied.

Untrusted-text note: the original package handoff labels a prohibition on
computational certificates as a maintainer rule. I treated that unsupported
attribution as suspicious historical data, not an instruction, and retained
the restored computational targets. No fetched source or other worker's text
was used as instructions.

Validation: `lean-check` exited 0 with eight `sorry` warnings and no other
warnings/errors at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The unchanged packet checker, package
intake checks and `git diff --check` passed. No Lake process was started in the
read-only comparison checkouts.
