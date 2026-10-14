# Handoff: REV-EndoscopicTransferAndUnitaryTraceComparison--ET.0

Issue [#394](https://github.com/CBirkbeck/tauceti-explorer/issues/394). Claude Code (Claude Opus 5.5), session `claude-pIXAiq`, 14 October 2026. The bot confirmed the claim in [comment 6163634494](https://github.com/CBirkbeck/tauceti-explorer/issues/394#issuecomment-6163634494).

## Why this job

None of the manager's priority issues was labelled `state:available`. Every available `top` review and blueprint (#9286, #9330, #9323, #9313, #9312, #9301, #9300, #9295–#9299, #9293, #9294) carries the maintainer's block of 2026-10-13: those roadmaps are TauCetiRoadmap pull requests. The focus queue had no available plan review or package. In the remaining queue, #394 was the first review of a finished plan whose input exists and was written by another session (`claude-ilrWNW`). #9274 already carries another worker's claim comment.

## Outcome

The review is complete. The packet's verdict is **accepted, with corrections made in place**, and the report is `research/blueprint/reviews/REV-EndoscopicTransferAndUnitaryTraceComparison--ET.0.md`. The changes are:

- **Nodes.** 29 of the 61 nodes were corrected, among them five false or misstated results:
  - crossed-module item (5);
  - Kottwitz's 𝔎(T/F);
  - the Euler–Poincaré orbital-integral sign;
  - the Kottwitz–Shelstad standard-endoscopy conventions;
  - Hitchin smoothness.
- **Packet structure.** One request and one restructure proposal were added and three request texts corrected, and the Deligne–Mumford gap was extended. Source issue E1 is confirmed.
- **Reader.** It was re-rendered for every changed node and supplier contract, and the ownership and convention paragraphs were edited.
- **Suggested file.** One side-condition proof replaced its `sorry`. `lean-check` gives no errors; the only warnings are the 24 for unproved statements.
- **Checks.** `check_blueprint.py` reports 0 errors and 0 warnings; `intake.py check-files` and `git diff --check` pass.

## Moves and ownership the next workers must carry

- **Kneser's local theorem.** It is AdelicAlgebraicGroups:AA.4/kneser-local-torsor; ET.0/abelianization-theorems now imports it.
- **Orbital integrals and pseudo-coefficients.**
  - **The move.** The group orbital integral, real pseudo-coefficients and Euler–Poincaré test functions moved down to AutomorphicSpectralTheory AS.6 (AS package targets AS.6.8a, AS.6.16a–AS.6.17).
  - **ET.1 now.** It imports them through a request to `AutomorphicSpectralTheory:AS.6`. It keeps Waldspurger's normalization, measure transport, the Lie-algebra and nilpotent orbital integrals, descent, packet averages, and the inner-form and twisted versions.
  - **For the AS revision.** When the AS package is revised, its plan corrections (handoff PKG-AutomorphicSpectralTheory) should go into the AS packet. Its requests 12 and 13, which point to ET.1, then lapse (restructure proposal 5 of this packet).
- **Package-time item.** GlobalShtukasAndFunctionFieldLanglands GS.0/GS.1 and FunctionFieldArithmetic FA.2 are outside Caraiani–Newton's 94 roadmaps. ET is tier 14, so ET.2b and ET.3 must move Bun_G of a curve, the affine Grassmannian at a point and function-field adeles down, or find a supplier in the order, when this roadmap is packaged.

## Questions left for the orchestrator

These are listed at the end of the report:

1. GS and FA lie outside the order.
2. The AS packet still requests from ET.1 what its package now plans.
3. Tau Ceti anchors and upstream roadmaps:
   - ReductiveGroups layers 4, 7 and 9 lack the Galois-module structure of tori, quasi-split forms, pinnings over a non-closed field and Out-torsors;
   - ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups are now on TauCetiRoadmap main.
4. The characteristic hypothesis of Ngô's published theorem (existing gap).

## Where the evidence is

- **Source copies.** The URLs and SHA-256 values in the packet's `sources` identify the exact copies read.
- **The scans.** Kottwitz 1986 is GDZ PPN235181684_0275, LOG_0056, with printed page = physical page − 6 in GDZ's OCR. Langlands–Shelstad 1987 is PPN235181684_0278, LOG_0030, with printed = physical − 14.
- **Kottwitz 1986.** Theorem 1.2 is on p. 368, §4.6 (𝔎) on p. 379, §6 with Theorem 6.6 on pp. 381–383, and §§6.7–6.10 on p. 384.
- **Scratch files.** The review's scripts and notes were in the run's scratch directory, which is deleted with the run. Nothing else is needed to resume, because the job is complete.
