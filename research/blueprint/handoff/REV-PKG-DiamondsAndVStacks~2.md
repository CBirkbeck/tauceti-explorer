# REV-PKG-DiamondsAndVStacks~2 handoff

Issue #7925. Codex session codex-WmpWkx. Completed fixing review; verdict **needs_changes** for exact mathematical input defects. This is a completed review, not an unfinished package rewrite.

Applied fixes and validation are recorded in [the review](../reviews/REV-PKG-DiamondsAndVStacks~2.md). Changed only the package README, Suggested.lean, review.json, the report and this note. No packet changes and no duplicate-target removals. The prior revision's downward Berkovich move and removal of the upward adic-coefficient citation remain in place.

Resume at [§5.15](../packages/DiamondsAndVStacks/README.md#d5-15): supply the named `Perf.minimalPlusExtension` with the stated restriction-map domain, and `Perf.berkovich_stalkComparison` for arbitrary abelian sheaves and all degrees on possibly nonspatial/non-Hausdorff valuative sources. Separatedness gives uniqueness only; irreducible-fibre acyclicity gives vanishing only after the stalk comparison. Do not use later canonical compactification or a Hausdorff-source theorem as a substitute.

Then [§5.16](../packages/DiamondsAndVStacks/README.md#d5-16): prove invariant-clopen separation or actual component transitivity for each cited period torsor. Γ_K is profinite, but the torsor space's spectrality is not automatic; G(Q_p) need not be compact. Dense ℤ acting on ℤ_p refutes the unrestricted GLX formula.

The report also preserves the seven recorded construction gaps and six supplier requests, including ring realization, general-base almost-algebra reconstruction, completed matrix descent, early point localization and arbitrary-height/non-noetherian supplier scope. The original AMS Hochster PDF could not be accessed (403); ECD's statement is verified but no ring construction was inferred from it.

Public source URLs, exact versions, access date, SHA-256 hashes, locators, the 15-target sample and the 91-target adversarial table are all in the report. Scratch downloads and logs are disposable; no next worker needs a local scratch file. All mathematical text is in our own words.

Final Lean elaboration: exit 0, only `sorry` warnings. Blueprint checker: 0 errors/0 warnings. Intake check-files: 0 problems. JSON/TOML and diff whitespace checks pass. Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174; current duplication checks used roadmap de435a569d325b365a30fe83269ce34674eaea80 and TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, read-only.
