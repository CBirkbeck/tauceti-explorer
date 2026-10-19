# REV-FIX-RT-AREA-padic-2~4: blocked by issued-scope mismatch

Refs #6519. Codex, session **codex-ESvajv**, 19 October 2026.
Checkout: `3e0797a48ffa72f490c00bf83579f92011c2034b`.
Independently fetched GitHub main: `8ef33b78858968d3ba365ab147d3adb965f4d20c`.
Branch: `codex-ESvajv-padic-review-checkpoint`.
The bot confirmed [claim 6263926956](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6263926956)
in [comment 6263930173](https://github.com/CBirkbeck/tauceti-explorer/issues/6519#issuecomment-6263930173).
The issue was fetched and re-read after confirmation. This session wrote none
of the fixes or previous reviews and claimed no second job.

## Completed work and current blocker

The issue's three-packet review is already recorded. Faltings and Adic are
accepted for the scoped fixes; Perfectoid has `needs_changes` for its broader
audit. The [report](../reviews/REV-FIX-RT-AREA-padic-2~4.md) preserves the
finding-by-finding review, source records and earlier successful Lean checks,
with their original authorship. This continuation checks the administrative
blocker and changes only the report's current notice and this handoff.

The live issue permits **seven outputs / three packets**. The checkout and
independently fetched GitHub-main queues require **27 outputs / thirteen
packets**, with identical ordered output lists and dependencies. The fix
requires 46 outputs. All outputs exist. Fresh execution of the unmodified
`issues.deliverables_complete` returns **True** for a copy with the issued
seven outputs and **False** for both generated job entries. The three scoped
verdicts already name this job. Perfectoid's `needs_changes` counts as a
completed review and is not the blocker.

These ten additional packets each have an accepted review under a different
independent job identifier. Metadata inspection does not review their
mathematics; overwriting their verdicts cannot repair the issued scope.
All are in `research/blueprint/packets/`:

| Additional packet | Existing reviewer after `independent-review-` |
|---|---|
| AInfCohomology.json | REV-AInfCohomology |
| CohomologyComparisons.json | REV-CohomologyComparisons~2 |
| IgusaVarietiesAndTorsionConcentration.json | REV-IgusaVarietiesAndTorsionConcentration~2 |
| PadicHodgeTheory.json | REV-PadicHodgeTheory |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory.json | REV-FiniteFlatGroupsAndIntegralPadicHodgeTheory |
| PrismaticCohomology.json | REV-PrismaticCohomology~2 |
| DerivedDeRhamCohomology.json | REV-DerivedDeRhamCohomology~2 |
| AutomorphicGaloisRepresentations.json | REV-FIX-RT-AREA-langlands-2~4 |
| AutomorphicGaloisRepresentationsPartII.json | REV-AutomorphicGaloisRepresentationsPartII~2 |
| PadicDifferentialEquationsAndRigidCohomology.json | REV-PadicDifferentialEquationsAndRigidCohomology |

The current generator's `made` assignment in `fix_rounds` still excludes
`missing` and `sent_back` cases. Fresh calls to `intake.file_problems` reject
`research/blueprint/queue.json` and `research/blueprint/make_queue.py`.
WORKERS.md and the live issue also restrict edits to named deliverables.
No permitted packet or verdict edit resolves this mismatch.

## Maintainer repair and resume criteria

1. Restore `outputs` and `after` for `FIX-RT-AREA-padic-2~4` and
   `REV-FIX-RT-AREA-padic-2~4` from the historical queue at
   `888f12f5c9d80d8205c6f7dd55cbbb933633b5e6`. A fresh fetch confirms its
   ten-output fix and exact seven-output issued review.
2. In `fix_rounds`, preserve an existing following round whenever it is in
   `states`: retrieve `previous_jobs.get(following)` without the
   `not (missing or sent_back)` condition. Check preservation of both ordered
   output lists and dependency lists, including genuinely new rounds.
3. Regenerate twice and run the actual completion predicate without replacing
   unrelated reviews. Synchronize the issue and verify persistence and intake.
4. Keep this issue unavailable until the issued and generated contracts agree.
   Workers cannot change labels or close it. Reassigning it beforehand cannot
   advance the recorded mathematical review.

The report retains self-contained isolated and full-generator reproductions
from earlier sessions. Their candidate runs preserved both historical
contracts, while stock generation mutated them. Those experiments were not
rerun here, and no proposed repair was applied. The harness excludes real
persistence, issue synchronization and intake; those checks remain necessary
under separate authorization. No scratch artifact is needed to resume.

## Fresh validation and preserved evidence

All three authorized packets pass `scripts/check_blueprint.py` against the
manifest-matching declaration index: **Faltings 56, Perfectoid 326, Adic 537
nodes; zero errors and zero warnings**. Pins: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

These are structural/index checks. No packet, reader, suggested Lean file,
source record or review verdict changes. No link map or restructuring
proposal is under review. No new mathematical review or source reading is
claimed. Lean was not rerun for documentation edits; prior elaboration evidence
retains its authorship. No build, language server or background process was
started. This submission is a **blocked checkpoint**.
