# Handoff: independent CM package review

Job `REV-PKG-ComplexMultiplicationAndExplicitReciprocity~codex2`, issue #11243.
Codex, session `codex-mX4Mn6`, 2026-10-19. Claim confirmed in bot comment 6279458863.

**Complete; verdict `accepted`.** The [independent report](../reviews/REV-PKG-ComplexMultiplicationAndExplicitReciprocity~codex2.md) records the full coverage, source sample, supplier comparison, adversarial table and signature checks. No second job was claimed.

## What was checked and changed

- Independently read the complete package, accepted packet (58 retained nodes and seven separately recorded API lemmas within those 58), prior review and latest fix handoff. The 11 computational nodes excluded by maintainer #10742 stay excluded; no packet edit.
- Closed the previous review's R1 by reading AbelianSchemesAndArithmeticModuli A1.3a/A4.7a at TauCetiRoadmap PR #849 head `a9b3fcc2b312e1f29db816eb2f6802bb70f19801`, plus A6.12. Arbitrary-base representability, projective modules, functoriality, base change and realization variance cover the package. The CM finite-flat ideal-degree proof, including the characteristic-five connected-kernel example, was independently checked.
- Verified the reproducible 15-target source sample and all previously flagged source/proof concerns. All 20 public PDFs hash-match the packet's versions. No uncleared book, source passage or source-by-source summary was put in the repository.
- Read the current upstream/library objects at roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine newer roadmaps and four named Completed roadmaps. No build was run there.
- Corrected two README details: consume the ordinary finite-field endomorphism-order theorem from EllipticCurves Layer 1, explicitly distinguishing the fuller Deuring variant; extend the Kings–Sprang reference entry through the period-lattice formulas on p.12. No entire target was removed. Suggested.lean and metadata are unchanged.
- Set `review.json` to the independent accepted verdict and wrote the report.

## Validation

- `lean-check` Suggested.lean: exit 0, 22 warnings, all `declaration uses sorry`, no errors, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Available memory checked first; no remaining process. File length 303 lines, with real data bodies and proved examples.
- Sorry-data check passes. Packet checker: 0 errors, 0 warnings.
- Intake `check-files`: 0 problems on the four changed deliverables. JSON/TOML, source hashes, README anchors/reference links and `git diff --check` pass.

## Maintainer coordination

The atlas ShimuraVarieties package §5.1 still describes CM types/reflex fields/primitive cores assigned to CM.0 by RS-04. Its owner should align that package to consume CM.0. It was not edited here; no new ownership move is proposed. CM.0 → V4/V5 → CM.2 remains the binding direction.

PR #849 was open at the inspected head. If its target numbering changes, update the CM consumer locators; this review verifies the named supplier contracts at that recorded head, not an implementation already merged into the library.

Nothing suspicious was encountered in untrusted comments, supplier files or source texts. No source files or scratch evidence need to be retained: all durable versions, locators and conclusions needed by another worker are in the report. No resumption or checkpoint is needed.
