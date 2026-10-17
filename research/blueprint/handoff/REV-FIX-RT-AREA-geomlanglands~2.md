# Handoff: geometrisation fix review, scope-blocked checkpoint

Issue #5161; Codex session `codex-WkJRnK`; 17 October 2026.
This run took only this job. The two reviews authorized by the live issue are
finished; the queue-wide job cannot finish under the present edit scope.

See [the report](../reviews/REV-FIX-RT-AREA-geomlanglands~2.md) for all 39 finding
dispositions, public-source locations, new corrections and validation receipts.
SchemeAndStackFoundations is accepted for the /15 and /27 handoff boundary only.
MotivesAndAlgebraicCycles needs changes for the unresolved FS VI.10.2
source-to-pinned-Beck preservation bridge. Previous reviews remain unchanged
in reviewHistory. No excluded consumer verdict is asserted.

## Resolve the scope before another review pass

WORKERS.md says “Edit only the files the issue names, plus your own scratch
space.” The live issue names the two packets above and matching Suggested files.
The queue instead requires nineteen packets and matching Suggested files.
`research/blueprint/issues.py::deliverables_complete` requires this review's
marker in every one of them. Merely updating the report cannot satisfy it.
Scope extension was requested in this session but not received before submission.

The maintainer must either align the queue with the live two-packet review or
explicitly authorize a broader review in the live issue. Do not just overwrite
excluded review markers. If the broader scope is authorized, independently review
the applicable fixes in every added packet and preserve each preceding review.
The exact queue-listed packet stems at this checkpoint are:

| Packet stem under research/blueprint/packets/ | This run |
| --- | --- |
| GeometricSatakeAndFusion--GS0 | Excluded by live issue; review marker unchanged |
| EndoscopicTransferAndUnitaryTraceComparison--ET.6a | Excluded by live issue; review marker unchanged |
| HeckeStacksAndLocalShtukas | Excluded by live issue; review marker unchanged |
| LanglandsParameterStacks | Excluded by live issue; review marker unchanged |
| ExcursionOperatorsAndSpectralAction--ES0 | Excluded by live issue; review marker unchanged |
| SmoothRepresentationsOfLocalGroups | Excluded by live issue; review marker unchanged |
| BunGAndNewtonStrata | Excluded by live issue; review marker unchanged |
| EndoscopicTransferAndUnitaryTraceComparison--ET.0 | Excluded by live issue; review marker unchanged |
| AdelicAlgebraicGroups | Excluded by live issue; review marker unchanged |
| FunctionFieldArithmetic | Excluded by live issue; review marker unchanged |
| SchemeAndStackFoundations | Reviewed; accepted handoff boundary |
| SchemeAndStackFoundations--SF.3 | Excluded by live issue; review marker unchanged |
| MotivesAndAlgebraicCycles | Reviewed; needs_changes on /17 |
| EtaleDualityAndPerverseSheaves--EDC.0 | Excluded by live issue; review marker unchanged |
| EtaleDualityAndPerverseSheaves--EDC.4 | Excluded by live issue; review marker unchanged |
| VStackSheavesAndLisseCategories | Excluded by live issue; review marker unchanged |
| PotentialAutomorphyInfrastructure | Excluded by live issue; review marker unchanged |
| EndoscopicTransferAndUnitaryTraceComparison--ET.5 | Excluded by live issue; review marker unchanged |
| IgusaVarietiesAndTorsionConcentration | Excluded by live issue; review marker unchanged |

Earlier PR #8474 was merged as a checkpoint. PR #8485 remains open and unmerged;
it reports the same scope problem against an older queue. This run does not
assume its changes are present. A maintainer should reconcile it with this PR;
workers should not merge, close or relabel either manually.

## Remaining mathematical action

1. At MC.6/relative-finite-piece-reconstruction and the gap “Relative
   reconstruction implementation adapters and early-stage installation”, derive
   preservation of the relevant functor-split coequalizers from a precise reading
   of FS VI.10.2, pp.232–234, or keep the printed source target explicitly unmet.
   The stronger sufficient-hypothesis statement now has a checked real-bodied
   `relativePieceMonadicOfPreserves` application. Conservative Beck already
   supplies the reflection step; no separate coequalizer-reflection adapter is
   needed when using this variant. This review does not claim FS is false.
2. Follow the binding 12 October roadmap shape: heavy action/Ind/internal-comodule
   and neutral reconstruction carriers remain prose targets when absent at the
   pins. The historical request to develop them in Suggested.lean has been removed
   as an independent rejection reason. Do not resurrect it from the old report.
   Keep the source proof plan, hypotheses, API and three discriminating tests.
3. An authorized reader owner must reconcile the excluded motives reader with
   the corrected conventions and current shape. Preserve unrelated pending Nori
   localization/comparison work and its review history.
4. After acceptance, maintainer installation of the proposed early abstract stage
   is normal PROTOCOL §9 work. GS4 imports the selected suppliers after checking
   its own hypotheses. Existing ReductiveGroups and known-Hopf reconstruction
   suppliers are imports, never planned again.

## Checks and resumption

Both packet validators pass with zero errors/warnings against the pinned
declaration index. Both full Suggested files elaborate sequentially with
lean-check: scheme 362 and motives 817 sorry-only warnings; no errors or other
warnings. File checks and git diff --check pass. Exact hashes are in the report.

No scratch file is needed to resume. Public URLs, versions, hashes, source
locations, verdicts and the exact scope blocker are in the report and packets.
No source passage or restricted library file was copied into the repository.
No graph promotion, upstream edit, lake build or second claim was performed.
