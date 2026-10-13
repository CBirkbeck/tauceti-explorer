# REV-PKG-RelativeFarguesFontaine — handoff

Issue #9237. Reviewer: Claude, session `claude-Ejovdd`, 2026-10-13. The bot confirmed the claim on comment 6155542196. Branch: `claude-Ejovdd-rev-pkg-relative-fargues-fontaine`. The reviewer wrote none of the package (PR #9485, Codex).

The review is complete, with verdict **accepted**: the corrections were applied in place. The packets were not edited.

## Delivered

- `packages/RelativeFarguesFontaine/review.json`: the verdict and summary notes.
- `reviews/REV-PKG-RelativeFarguesFontaine.md`: the full record, covering the six checks, the source audit with edition hashes, every correction, the duplication search, the Lean spot checks, the adversarial pass and the open supplier contracts.
- `packages/RelativeFarguesFontaine/README.md`:
  - §6.8 rescoped from a theorem resting on an unowned supplier to meromorphic complement data, with knock-on edits in §6.7, §6.9(e), §7.2(iii), the R3 contract and the Conventions.
  - §2.5 base field and §4.7 locator corrected; §6.11 slope note added.
  - Tau Ceti citations added in Scope, §0.13 and §6.10.
  - Process language and node identifiers removed; five uncited references removed.
- `packages/RelativeFarguesFontaine/Suggested.lean`: standard note, layer titles and the `Glueable` docstring. `lean-check` exits 0 with 31 `sorry` warnings and nothing else.

## For the maintainer

The report's last section lists what the package cannot fix by itself:
- RelativeFarguesFontaine, VectorBundlesAndIsocrystals and BunGAndNewtonStrata cite each other, so they can only go upstream together, as one bundle.
- The Lubin–Tate inputs have no owner: DESIGN-LocalFieldsRamificationPartII is pending and its brief does not mention them.
- VB4 does not yet supply SW 12.3.5 or 12.4.1.
- The BG0 plan is marked needs_changes.
- `drops.json` moves the linear patching of Layer 6 into AInfCohomology AI.2.

No scratch files are needed to resume; the report records everything.
