# FIX-PKG-AnalyticNumberTheoryPartII~adv — blocked checkpoint

Refs #10301. Codex, session `codex-Hvxv8k`, 2026-10-17. The claim bot confirmed this session's claim. **The fix is unfinished: the remaining defect requires a maintainer identity migration outside the issue's permitted files.** No second job was claimed. This is a fixing assessment, not an independent review or an implementation claim.

## What is established

The complete independent review [REV-PKG-AnalyticNumberTheoryPartII~adv](../reviews/REV-PKG-AnalyticNumberTheoryPartII~adv.md), issue #10272, explicitly says its mathematical work is finished and identifies exactly one unresolved defect. I confirmed that defect against the files at base `f1c503021e780c28eb5f743400588b3dc531c185`:

| Identity-bearing record | Actual project |
| --- | --- |
| `packages/AnalyticNumberTheoryPartII/README.md` and `Suggested.lean` | Layers 4–6 of the split AnalyticNumberTheory package: Lerch/Hurwitz/Barnes functions, quadratic double and binary-cubic zeta functions, Bost–Connes and compact scalar determinants. |
| `roadmaps/AnalyticNumberTheoryPartII.json` | The effective class number problem; six stages ECN.0–ECN.5, with AnalyticNumberTheory as parent. |
| `packets/AnalyticNumberTheoryPartII.json` | The effective-class-number plan: 39 nodes, 8 definitions, 31 theorems, 45 API items and 31 definition tests. It is not a plan of the Layer 4–6 targets. |
| `readmes/AnalyticNumberTheoryPartII.md` and `suggested/AnalyticNumberTheoryPartII.lean` | The effective-class-number project's separate reader and signatures. |
| `queue.json`, DESIGN/REV-DESIGN records with this identity | The effective-class-number project, including revision #8919 and its pending independent review. |
| `queue.json`, REV-PKG/FIX-PKG records with this identity | The new Layers 4–6 split package, including this job. |

The latest effective-class-number revision is not abandoned material. [DESIGN-AnalyticNumberTheoryPartII~2](DESIGN-AnalyticNumberTheoryPartII~2.md), issue #8919, synchronizes its reader and real-bodied definitions and is awaiting its own independent review. Its inherited packet verdict must not be replaced by this package's fixing verdict.

The actual plan lineage for the Layer 4–6 package is the **AnalyticNumberTheory** packet family: `packets/AnalyticNumberTheory.json`, `packets/AnalyticNumberTheory--AN.0.json` and `packets/AnalyticNumberTheory--AN.8.json`. In that family, the special-function targets use AN.7, and double/cubic zeta, Bost–Connes and scalar spectral targets use AN.8/AN.9. The compaction/split is recorded in [FIX-PKG-AnalyticNumberTheory~adv3](FIX-PKG-AnalyticNumberTheory~adv3.md), issue #10249. The independent review has already checked preservation across that split. Identifying this lineage does not itself repair discovery or establish a new packet-to-package association.

## Finding-by-finding disposition

| Review finding | Disposition in this run |
| --- | --- |
| Package/plan identity collision | **Unresolved.** Verified in the roadmap record, packet, reader, suggested file and queue. The issue permits only four paths: this handoff and the package README, Suggested.lean and review.json. A complete repair must change other files. |
| Finite-dihedral-ball tube-growth argument | The independent review's correction and computed counterexamples are already in the package; preserved without changes. |
| Current profinite/substitution suppliers; duplicate generic ratio-set, KMS-limit and factor/type targets | The review's supplier boundaries and removals are already applied; preserved without changes. |
| Hyperbolic Laplacian sign, BC positivity-extension argument and stale prerequisite wording | The review's repairs are already applied; preserved without changes. |
| Weak topology of high-inverse-temperature barycentres | The review's uniform Gibbs-tail/compactness argument is already applied; preserved without changes. |
| Source locator, Markdown rendering and negative controls | The review's DLMF locator, grouping-bracket fix, character and totalized-series controls are already applied; preserved without changes. |

There is no newly discovered missing mathematics or ownership move. The present run changes only this handoff and the fixing review object. Rewording the README to distinguish the two topics, or changing its title/Lean namespace alone, would leave the identity-bearing records inconsistent. Replacing the package by the effective-class-number reader would erase the expressly assigned Layer 4–6 project. Neither is a repair.

## Concrete migration and resume plan for the maintainer

One possible migration is to retain `AnalyticNumberTheoryPartII` for the Layer 4–6 package and give the effective-class-number project a descriptive identity such as `EffectiveClassNumbers`. **That spelling is a proposal, not an approved rename.** Alternatively, preserve the older ECN identity and rename the new package; that choice also requires out-of-scope changes. Choose one mapping before assigning another package-only fix.

For the first mapping:

1. Move the ECN roadmap, packet, reader and suggested files together to the chosen identity. Update the roadmap `id`, the packet `roadmapId`, all ECN stage/node IDs, internal prerequisites, coverage, consumer IDs, exact supplier-request consumers, reader pointers and its suggested namespace. Preserve its 39 mathematical nodes, APIs, tests, two recorded certificate gaps, twelve requests and independent-review history. Its parent remains AnalyticNumberTheory.
2. Update the ECN design/revision/review jobs' `roadmapIds`, deliverable paths and source pointers. Preserve historical job IDs, issue numbers and independence relationships rather than applying an unrestricted textual replacement. The pending independent review of revision #8919 must still read the ECN files.
3. Associate the Layer 4–6 package with the AnalyticNumberTheory plan lineage named above, with an explicit scope map AN.7 → Layer 4 and AN.8/AN.9 → Layers 5–6. Keep AN stage/node identifiers usable by existing consumers. Make discovery and the package-review input resolve to that association rather than to the ECN plan. Update the Part I and unsuffixed compatibility-index associations consistently.
4. Check incoming references by their mathematical meaning. The package paths and `s5-*` anchors in `packages/ArithmeticStatisticsPartII`, `PartIII`, `PartIV` and `PartVII`, and the unsuffixed AnalyticNumberTheory routing index, refer to the Layer 4–6 project and must keep reaching it. ECN stage references must reach the renamed ECN owner. Historical handoffs/reports document the old names; they are not current ownership declarations to rewrite indiscriminately.
5. Re-run packet and intake checks, elaborate any suggested file whose namespace/imports changed, and verify all local links and prerequisites after the migration. Confirm that both the ECN plan and the split package remain present and that the package review now receives the correct plan. Then resume this fix, record the migration commit and change the fixing verdict to accepted only if that sole defect is resolved.

A follow-up must authorize those paths or supply the already-merged migration. Repeating the mathematical review does not discharge this blocker.

## Pass table and preservation

No theorem, definition, hypothesis, convention, Check, example or supplier target was edited. Consequently there are no touched mathematical statements requiring a fresh adversarial calculation. The earlier review's complete pass remains its own evidence; this checkpoint does not claim to have repeated it.

| Statement or contract checked | Instances tried | Result / change |
| --- | --- | --- |
| One roadmap identity selects one mathematical plan | Layer 4–6 package versus ECN.0–ECN.5 packet and roadmap; latest ECN revision | Fails: the two projects share the same identity. Retained `needs_changes`. |
| A package-only edit can repair the remaining finding | README/title/namespace-only changes; replacement by ECN material | Both fail to preserve a consistent association and both assigned projects. No mathematical edit made. |
| Existing consumer links retain their supplier | ArithmeticStatistics `s5-4`, `s5-5`, `s5-21`, `s5-28`, `s5-29`; unsuffixed split index | These refer to the analytic Layer 5 package, not ECN. A blanket rename is unsuitable. |
| Fixing acceptance requires every finding resolved | Successful Lean elaboration and schema checks with the collision still present | Checks pass but the identity defect remains. Fixing acceptance is withheld. |
| Mathematical preservation | Byte comparison of package README and Suggested.lean against the base | Both files are unchanged. No generality, sign, source, Check or target is lost. |

README: 349,107 bytes, 72 Checks markers, SHA-256 `9ed16cb2185055a36860c30c553adaa3cc32ed0e119322b0ebcc850ccdcbf214`.
Suggested.lean: 270 lines, SHA-256 `1f3ba63364f23cac003c1f894513836019e77ce3e852a1b373b944d1627fc0a1`.

## Validation and submission

- `lean-check research/blueprint/packages/AnalyticNumberTheoryPartII/Suggested.lean`: exit **0**; exactly **17** warnings, all `declaration uses sorry`; no other diagnostics. Available memory before the run was 78 GB. The shared build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No language server or library build was started.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/AnalyticNumberTheoryPartII/Suggested.lean`: exit **0**.
- `python3 scripts/check_blueprint.py` for each of `AnalyticNumberTheory.json`, `AnalyticNumberTheory--AN.0.json`, `AnalyticNumberTheory--AN.8.json` and `AnalyticNumberTheoryPartII.json`: each reports **0 errors, 0 warnings**. Their respective node counts are 239, 254, 240 and 39. These checks validate the separate packets, not the conflicting package association.
- Intake file checks and `git diff --check` pass for the two changed deliverables.

Submit this as a **draft checkpoint PR for maintainer disposition**: the identity migration needs files excluded by this issue. The fix remains unfinished regardless of file-existence-based automation. No scratch file is needed to resume, and no private source or passage has been copied. Do not promote the package on the strength of this checkpoint.
