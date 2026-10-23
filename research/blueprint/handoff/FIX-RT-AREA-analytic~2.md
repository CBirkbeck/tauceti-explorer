# Completion handoff: FIX-RT-AREA-analytic~2

Issue #6210. Codex session `codex-utL7Fz`, 2026-10-17.
This is a completed fix submission, not a checkpoint.

The confirmed finding RT-AREA-analytic/1 is addressed in the AN.0 packet,
reader and Lean scope note. The fixes report is
`research/blueprint/redteam/RT-AREA-analytic.fixes-2.md`.
No work is required for the two rejected findings.

The packet's ownership request now proposes
`ChebotarevPartIIArithmeticSchemes`, a Part II of Chebotarev, with dominant
characteristic-zero hypotheses, connected finite étale Galois cover,
conjugacy-invariant subset and exact natural-density denominator. It records
the full Serre proof obligations, weighted normalization, number-field
comparison, tests and both consumer reroutes. The AV target-ledger entry
uses the qualified statement. AN.4 remains number-field mathematics.

Primary reading and source hashes are recorded in the packet/report.
New source issues E42/E43 concern the inspected AV preprint, respectively
the missing dominance restriction and missing dimension factor. For
dimension d, the unnormalized logarithmically weighted all-point limit is
1/d; multiply by d or divide by the all-point weighted sum. The published
AV PDF could not be obtained, so these are not assertions about that edition.

Remaining programme work is explicitly outside this fix's deliverables:

- The maintainer must adopt the proposed Part II and commission its complete
  design, including exact geometric suppliers and independent review.
- The maintainer/extraction revision must reroute AV item20 and
  Schmidt–Stix items38/84 to that owner. The latter route remains rejected
  and gapG4 remains open until independently accepted revision; owner
  selection does not accept it. The report lists the exact actions.
- `REV-FIX-RT-AREA-analytic~2` must review this fix and the new source issues.
  The packet's historical independent-review object was not overwritten.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory--AN.0.json`:
  zero errors, zero warnings.
- `lean-check research/blueprint/suggested/AnalyticNumberTheory--AN.0.lean`:
  exit0, 398 warnings, all `declaration uses sorry`; 2,661 lines. No new
  declarations or data definitions were added.
- `python3 research/blueprint/intake.py check-files` on all five changed
  deliverables: zero problems.
- `git diff --check`: passes.

No source files or scratch material need to be retained. Resume programme
work from the named ownership request and report, not from ephemeral notes.
