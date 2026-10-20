# Handoff: independent Eisenstein package review

Job `REV-PKG-EisensteinIdealAndRationalTorsion~codex2`, issue #11268. Agent: Codex, session `codex-iqQKKS`, 2026-10-20.

Completed one job. **Accepted** the package at input commit `6ba8aeed3cacb34a9381bad21fa28d1adbf3c1d0`; no mathematical edits were necessary. Replaced the fix author's verdict with the required independent reviewer identity and wrote [the review report](../reviews/REV-PKG-EisensteinIdealAndRationalTorsion~codex2.md). README.md, Suggested.lean and metadata.toml are unchanged. No packet, supplier, link or ordering file was changed.

The report records independent checking of all 56 targets, all 51 packet API identifiers, all 39 definition tests, the additional README Checks, and all ten named Lean declarations. It includes a target-by-target adversarial table, the reproducible random 15-target source sample, and exact arithmetic witnesses. The principal findings C1–C4 are resolved at these versions:

| Contract | Version and sections |
| --- | --- |
| Integral dualizing forms, Serre duality, integral Hecke adjoints | [TauCetiRoadmap PR #913](https://github.com/TauCetiProject/TauCetiRoadmap/pull/913), `27ac927ca0300d6bb9e77d892efc9af96d46027f`, ModularCurvesPartII §§13.7–13.9. |
| Global admissibility, lengths/cohomology, rank one, purity, D/amalgams | [TauCetiRoadmap PR #879](https://github.com/TauCetiProject/TauCetiRoadmap/pull/879), `97297b9ce296e3155c5cd25162af1741224b1a25`, FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.G1–R07.G8. |
| Connected Kummer/localization, component defects, quotient cotangents | [TauCetiRoadmap PR #852](https://github.com/TauCetiProject/TauCetiRoadmap/pull/852), `8e2d6f14740eb87e75f9c1a647f7bbc51b0edb05`, NeronModelsAndSemistableAbelianVarieties §§6.4a–6.4d. |
| Teichmüller eigenspaces, Herbrand, inverse-character unramified quotient | CyclotomicClassGroupsAndStickelberger §§0.2–0.3, 3.2, 8.1–8.2 at atlas commit `6948494d83330b7e1844a6aacef3643cf422d603`; README SHA-256 `193d993175b0180ca664a5bdcc63427610ea4f33794752955fa9ed8fca141ea5`. |

The three upstream PRs were open when read. This review checks the authorized targets at those revisions, not their merger status. The package owns the Hecke saturation of Mazur II Lemmas 17.5/17.7 and the Eisenstein isogeny kernel/component calculation. The equal-level argument uses all-n Raynaud uniformization. The twisted level-13 character is not treated as an admissible 19-group. Strict ramification bounds, real-place 2-primary defects, characteristic 2/3 corrections, zero genus, actual connected quotients and inseparable degrees are all retained.

Independent arithmetic passed: cusp-relation determinant −19; cusp residues {0,1,3,12,14,15}; all 19 degree-two classes with exactly three canonical representatives; point counts 6,6,6,8 over fields of orders 2,4,3,9; Jacobian order 19 at 2 and 3; sextic discriminant −2¹²·13²; the six cyclotomic norm determinants 13,27,53,79,131,157; exhaustive small-prime-ideal enumeration below the exact Minkowski bound <307; Bernoulli values 8,32,88 at 17,41,73; and rational group computations realizing orders 2,3,5,7 with nonzero discriminants. The report includes enough detail to reconstruct these checks after scratch deletion.

The primary source checks include Mazur 1977, the Mazur–Wiles 1984 §8.I corrections, Mazur 1978, Mazur–Tate 1973, the public level-13 model and genus-two calculation. Faltings–Chai III §§7–8 and Deligne–Rapoport VI §5/VII §§1–2 were read in place in the cleared library. No cleared file or passage was copied, no source quotation was committed, and no fetched code was executed.

Library checks used the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, reading the declarations actually cited. Duplication checks used current upstream `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the post-snapshot and Completed roadmaps. No duplicate retained consumer target was found. No build was run in either read-only tree.

Validation:

- Independent `lean-check` of Suggested.lean: exit 0, nine warnings, all `declaration uses sorry`; no errors or other warnings. There were no Lean edits after this check.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EisensteinIdealAndRationalTorsion.json`: exit 0, zero errors/warnings; 56 nodes, 51 API items, 39 tests, nine planned stages. The unchanged historical packet has nine gaps and 23 requests; this result is structural validation, not a claim of packet closure.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/EisensteinIdealAndRationalTorsion/Suggested.lean`: exit 0.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean, metadata.toml, review.json, the report and this handoff: exit 0, six files, zero problems.
- `git diff --check`: passed. The only changed deliverables are review.json, the independent report and this handoff.

Remaining consumer findings: none. No continuation is required for this review. At port, the maintainer places the consumer after all named prerequisites, including C4 before the global finite-flat class obstruction. `upstreamNotes`: R07.G5's class-obstruction input can be repointed to the general CyclotomicClassGroupsAndStickelberger owner instead of duplicating it. This is supplier coordination, not an absent input to the consumer, and no supplier was edited.

Other workers' PRs and all fetched text were treated as data. No suspicious request to execute code, use credentials, contact another service or change unrelated files was encountered or followed. Scratch is disposable; the report and this handoff hold the durable evidence. This run claims no second job.
