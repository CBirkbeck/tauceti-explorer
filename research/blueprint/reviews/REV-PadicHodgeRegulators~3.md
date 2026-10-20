# Independent review: P-adic regulators, revision 3

Job **REV-PadicHodgeRegulators~3**, issue **#11302**. Reviewer: **Codex**, session
**codex-UKTQ4c**, 20 October 2026. The bot confirmed claim comment 6289703629.
This session did none of BP-PadicHodgeRegulators, its second revision, or its
third revision. The third revision was submitted by codex-ZI4oNx in
[PR #11350](https://github.com/CBirkbeck/tauceti-explorer/pull/11350).

**Verdict: accepted.** The submitted revision correctly repairs validation
metadata. Its mathematical content is the content accepted by the
[second independent review](REV-PadicHodgeRegulators~2.md). This review also
corrects the suggested file's import block to the current guide's convention.
All ten stages remain `planned`, with **22 gaps, 32 requests and 40 unapplied
part-correction records**. Acceptance does not discharge those obligations or
certify formalisation.

## Scope and provenance

I compared the submitted packet at `b2640acac` with the accepted second-review
commit `7449ccf63`. The only changed top-level field is `leanValidation`. Its
changes replace stale counts of 198 lines and six examples by 229 lines and
eight examples, replace nine admission warnings by ten, preserve the old receipt
in history, and add the third revision's compilation receipt. Every mathematical
field, supplier contract, source citation, source-issue verdict, part-correction
request and accepted review is identical. The reader and suggested file are
byte-for-byte identical to the accepted second-review versions.

The earlier review's conclusion that another mathematical revision was
unnecessary is therefore consistent with the actual diff. The third revision
still had a concrete bookkeeping correction to make, and that correction is
right. I inherited the second review's mathematical acceptance rather than
claiming another inspection of all 34 mathematical sources or all 31 baseline
declarations. Its complete review object, including the individual node,
baseline and source-issue receipts, is preserved in the root's `reviewHistory`.
The current review object describes the checks performed in this session.

## Independent regression checks

| Check | Result |
| --- | --- |
| Revision's mathematical delta | None; only `leanValidation` changed. |
| Imported parts | Both SHA-256 receipts equal the files; all 131 imported node IDs belong to the named part. |
| Canonical merge | Recomputed with `scripts/blueprints.py:merge_blueprints`, the live atlas and the three research packets in sorted order: 132 declarations, 34 planets, no skipped links. |
| Declaration inventory | 132 unique IDs, all unchecked; kind counts match `inventory`; 280 API items and 196 tests. Every definition/construction has an API and at least three tests. |
| Prerequisite graph | The within-roadmap node graph is acyclic. This check does not assert that external requests have been supplied. |
| Reader correspondence | 2,884 comparisons across all 132 targets: statements, hypotheses, proof steps, acceptance conditions, prerequisites, API/test names and statements, and source locators/matches. Comparisons stop before each owed-correction block; only Markdown table escaping of vertical bars is normalized. |
| Owed corrections | All 40 name existing targets and their actual owning part, remain `applied: false`, and retain their inherited verdicts. |
| Coverage | Ten stages planned, none closed; 22 gaps and 32 requests unchanged. |
| Source excerpts | No `excerpt` field in the root packet. No new source text is copied. |
| Lean before repair | Exit 0; ten `sorry` warnings only; 229 lines, four definitions, eight proved examples, eleven theorems, of which one is proved. |
| Lean after repair | Exit 0; the same ten `sorry` warnings only; 223 lines; every declaration and proof body unchanged. |

The researched-part merge is intentionally distinguished from the published
parts. The accepted second review already records that the promoted L3 copy
predates its interface edits; that qualification and the promoted-part receipt
are unchanged. The representation check above uses the research copies and
makes no claim that a future fix has already republished the L3 part.

## Correction made in place

The suggested file used seven individual Mathlib imports. The standing
20 October checkout of [UPSTREAM_GUIDE.md](../UPSTREAM_GUIDE.md), under
“Imports and examples in Suggested.lean,” requires one `import Mathlib`.
I replaced the import block accordingly and ran `lean-check` again. No
signature, hypothesis, definition body, example proof or admission changed.
The packet's top-level line count and import explanation now describe the final
223-line file; the preceding 229-line receipt remains in validation history.

The final suggested file has SHA-256
`003c6a00406847e4e5883b0c91d35752d462cdacf6b02398317ad89b14d96ca5`.
The unchanged reader has SHA-256
`d7cf3fa004240c132ce0d9d3d53d2eecf7bdf6e3671592ebf09222700393b5c2`.

The read-only upstream roadmap tree was at `0d144d04`, and the current Tau Ceti
library at `a91d3aa`. I inspected the ownership/convention sections of
LocalFieldsRamification and LocalGaloisGroups, and the latter's actual
`padicCompletionTransition`, `padicCompletionUnits` and canonical-map
signatures in Layer 7. The reader already imports that completed multiplicative
carrier; it does not reconstruct it. Object searches in the current roadmap
and library trees found no additional owner of this roadmap's regulator engine.
At the pinned baseline I also read the Teichmüller section and finite Kummer
class-map statements: those provide the limited interfaces the reader names,
not a completed continuous regulator. This is a focused regression screen;
it does not replace the inherited source-by-source review.

## Checks and remaining ownership

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeRegulators.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/PadicHodgeRegulators.lean`: **exit 0, ten `sorry` warnings only**, before and after the import repair, at Mathlib `082e2d3` / Tau Ceti `f790474`. Available memory was 78 GiB before the final check.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PadicHodgeRegulators.lean`: **exit 0**.
- `python3 research/blueprint/intake.py check-files` on this job's changed files: **0 problems**.
- The regression comparisons and inventories in the table passed. Neither the mathematical reader nor either imported part was edited.

Applying the known corrections still belongs to a fix explicitly authorized to
edit `PadicHodgeRegulators--D.1.json` and `PadicHodgeRegulators--L3.json`, followed
by its independent review. That fix must also republish the L3 interface edits.
Only after that can an authorized root/reader update remove matching requests
and correction blocks. The remaining mathematical and supplier gaps retain
their recorded owners.

No new mathematical source was needed for this validation-metadata review.
No suspicious instruction was encountered in the issue comments or review
material inspected.
