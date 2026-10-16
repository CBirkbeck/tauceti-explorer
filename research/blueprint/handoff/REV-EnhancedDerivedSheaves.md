# Handoff: REV-EnhancedDerivedSheaves (issue #9917)

Independent review of the whole-roadmap plan `BP-EnhancedDerivedSheaves` (session claude-r1SP4N, PR #9953).
Reviewer: Claude (Claude Code, Opus 5.5), session claude-6SMRPk, 16 October 2026. Verdict: **accepted after
corrections**. The report is `research/blueprint/reviews/REV-EnhancedDerivedSheaves.md`. The packet's `review`
object names `independent-review-REV-EnhancedDerivedSheaves` and has one verdict per new or corrected declaration.

## Files changed

- `research/blueprint/packets/EnhancedDerivedSheaves.json`:
  - the corrections listed in the report and the review object;
  - 32 new declarations (3 withdrawn);
  - 13 corrected part declarations, with new correction fields on 5 of them;
  - 134 triaged requests;
  - 16 gaps (new: G-EDS-W4);
  - one source issue (EnhancedDerivedSheaves/E6, SAG) and SAG added to `sources` and `sourceVersions`;
  - 5 restructure proposals.
- `research/blueprint/readmes/EnhancedDerivedSheaves.md`: the reader, brought in line.
- `research/blueprint/suggested/EnhancedDerivedSheaves.lean`: adds `cotangentComplex_ordinary` and updates
  comments and docstrings. It elaborates at the pins: 646 placeholder warnings and nothing else.
- The part packets `EnhancedDerivedSheaves--E0.json` and `--E5.json` are unchanged; their hashes still
  match `assembly.imports`.

## What the next jobs need to know

- **Ordinary cotangent complex.** The ordinary cotangent complex is owned upstream by DerivedModuleAlgebra
  (TauCetiRoadmap pull request #944, first in the merge order). This roadmap's E5:cotangent-export holds
  only the animated refinements and compares them with it through `cotangentComplex_ordinary`, as the
  upstream README of #908 does.
  - DerivedDeRhamCohomology DD.0's plan and package should import both, per `assembly.moves`.
  - The three withdrawn ids were `E5:cotangent-export/cotangent-naive-comparison`, `cotangent-smooth-and-etale`
    and `cotangent-regular-quotients`. Nothing outside this packet cited them.
- **Gap G-EDS-W4.** DerivedModuleAlgebra, BordismFormalGroups and GeneralizedCohomology are not atlas
  roadmaps. Once they are registered, replace G-EDS-W4 by stage citations and decide restructure proposal 5:
  the accepted parts' module-level and generic ∞-categorical nodes overlap those upstream foundation
  roadmaps.
- **Upward stage edges.** The atlas stage graph still records three upward edges:
  - E4 → DerivedDeRhamCohomology:DD.1;
  - E5:cotangent-export → DD.0;
  - E5:spectra-comparison → StableHomotopyKTheory:H.5.

  Restructure proposals 1–3 now remove them explicitly.
- **PerfectoidSpaces.** The PerfectoidSpaces package (#818) states the classical cotangent complex as its
  own §0.19, while DerivedModuleAlgebra lists PerfectoidSpaces as a consumer of its §0.4. This is for the
  maintainer.
- **Requests merged mid-plan.** Four DiamondEtaleCohomology requests merged after the plan and are now
  entries 131–134. Their open parts are in the E2 and E3 coverage `remaining` lists.
- **Package revision.** A revision of `research/blueprint/packages/EnhancedDerivedSheaves/` should follow
  the upstream README of #908, which already has the DerivedModuleAlgebra design.

Nothing in the scratch directory is needed to resume.
