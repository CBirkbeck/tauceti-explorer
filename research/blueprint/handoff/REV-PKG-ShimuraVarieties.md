# REV-PKG-ShimuraVarieties handoff

Claude (Opus 5.5), session `claude-HnwevD`, issue [#9239](https://github.com/CBirkbeck/tauceti-explorer/issues/9239), 13 October 2026. Branch `claude-HnwevD-rev-pkg-shimura`.

None of the manager's priority issues was available, and the `top` issues still labelled available carried maintainer hold comments. This was the next eligible job: a package review in a `focus` area, whose package Codex wrote (session `codex-drcLi9`). The bot confirmed this session's claim, and only this issue was claimed.

## Result

The review is complete. The verdict is **accepted**, in `research/blueprint/packages/ShimuraVarieties/review.json`. The report, with every change, the source spot-check list and the adversarial pass table, is `research/blueprint/reviews/REV-PKG-ShimuraVarieties.md`. No review work remains.

## Changed files

- `research/blueprint/packages/ShimuraVarieties/README.md`:
  - repaired garbled text and slug references;
  - removed process wording;
  - merged duplicate supplier contracts;
  - added the BKT erratum citation;
  - fixed one locator;
  - added the new Section 5.1 (CM types, reflex fields, reflex norms), moved down from ComplexMultiplicationAndExplicitReciprocity CM.0 under the tier rule, and renumbered Layer 5.
- `research/blueprint/packages/ShimuraVarieties/Suggested.lean`: removed a duplicate of Mathlib's `PUnit.mulAction` and added real-bodied CM-type declarations with examples. `lean-check` exits 0 with 15 `sorry` warnings and no errors.
- `research/blueprint/packages/ShimuraVarieties/review.json`, the report and this note.

`metadata.toml` was checked and is unchanged. No packet, reader, link map or other roadmap's file was edited.

## Moves recorded for other roadmaps

- **ComplexMultiplicationAndExplicitReciprocity CM.0 to ShimuraVarieties Section 5.1:** `CMType`, `reflexField`, `reflexNorm` and `typeNorm_identities`, and `ReflexNorm.cm_type`. CM.0's `cm-type`, `trace-reflex-field`, `reflex-type` and `type-product-identities` should import these rather than plan them again.
- **ShimuraData D5/cm-torus (tier 12)** also cites CM.0. When ShimuraData is packaged it must own the CM types itself, and Section 5.1 here then becomes an import from ShimuraData.

## Open items for the maintainer

These are listed in the report under "What remains":

- the supplier obligations that no roadmap yet plans (the plan's explicit gaps);
- links to AdelicAlgebraicGroups and ReductiveGroupsPartII on TauCetiRoadmap main, which resolve only after pull requests #792 and #785 merge;
- the atlas link map's incomplete roadmap-level prerequisites.

The scratch directory (sources, extracted text, scripts) is deleted with this run; no later step needs it. The sources' URLs and SHA-256 values are in the report.
