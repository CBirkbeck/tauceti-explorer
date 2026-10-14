# REV-ClassicalArithmeticCompletion--CA.5

Issue #9678. Claude, session `claude-92wfjX`, 14 October 2026. The bot confirmed
`/claim Claude — claude-92wfjX` before work began. This session wrote no part of the reviewed plan
(BP by Codex, `codex-SSHEsg`, #9669).

## Done

- **Verdict: accepted, with corrections in place.** The review object is in
  `research/blueprint/packets/ClassicalArithmeticCompletion--CA.5.json`. The report is
  `research/blueprint/reviews/REV-ClassicalArithmeticCompletion--CA.5.md`.
- **Packet.** All eight new nodes were corrected:
  - closer pinned suppliers for the narrow-principal comparison and for the unit normal form;
  - source locators and matches;
  - two test kinds;
  - one new acceptance check.
  The sixteen resolution-ledger entries were checked and verified. Four baseline declarations were
  added, giving 48, all read at the pins. Three new source findings, E1501–E1503, were confirmed, and
  `sourceVersions` were added.
- **Reader.** The node sections were re-rendered from the corrected packet, after the renderer was
  validated byte for byte on the committed version. Every inherited target gained a source line, and
  the source-findings paragraph and the declaration inventory were updated.
- **Suggested file.** `lean-check` elaborates it at Mathlib 082e2d3 / Tau Ceti f790474, with admitted
  proofs as the only warnings, before and after the edits.
- **Checks.** `check_blueprint.py` with the pinned index reports 0 errors and 0 warnings. The
  `sourceIssues` pass `check_errata.check`, and `intake.py check-files` passes on the deliverables.

## For the next jobs

- **ClassicalArithmeticCompletion assembly.** Mark the parent packet's sixteen "Independent review: …"
  CA.5 gaps resolved by this packet's `frontierResolution`, and set CA.5 coverage to `closed`. Keep one
  Lean form each of the determinant criterion (`natAbs_det_eq_classNumber_iff` or
  `relationDet_eq_classNumber_iff`) and of the negative Pell norm (`Algebra.norm ℤ` on 𝓞 K or
  `Algebra.norm ℚ` on K). Use the namespace `TauCeti.ClassicalArithmetic`, not `…CA5`.
- **ComputationalNumberTheory (tier 15).** Its CN.2 nodes `units-complete-of-regulator-bound`,
  `joint-class-unit-index-certificate` and `certified-class-unit-completeness` restate CA.5 targets.
  The next CN revision should cite CA.5's regulator-bound, joint and interval certificates.
- **Errata register.** E1501–E1503 (Biasse–Fieker Lemma 4.4 and its precision count; Conrad's Example
  2.5 misprint) are new, with confirmed verdicts.
