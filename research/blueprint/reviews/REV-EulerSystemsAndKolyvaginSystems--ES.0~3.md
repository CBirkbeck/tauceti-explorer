# Independent review of revision three

Job `REV-EulerSystemsAndKolyvaginSystems--ES.0~3`, issue #9261. Reviewer: Codex, session `codex-uKC8Ps`, 2026-10-14. This session wrote none of the three planning revisions.

**Verdict: needs_changes. The review ends at the mandatory roadmap-shape gate; this is a completed review outcome, not a checkpoint.** The suggested file has 5,497 lines and contains data declarations whose bodies are `sorry`. Both fail the maintainer's 2026-10-12 rule incorporated by [WORKERS.md](../WORKERS.md) and specified in [PACKAGE_REVIEW.md, Shape of a roadmap](../PACKAGE_REVIEW.md#shape-of-a-roadmap-maintainer-2026-10-12--binding-for-packages-reviews-and-ports-overrides-older-size-notes). That rule applies to reviews, supersedes the older suggested-file instructions, requires `needs_changes` at this gate, and rules out cutting down a long draft during review.

## Reproducible findings

| Check | Result |
| --- | --- |
| `wc -l research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean` | 5,497 lines; limit 5,000. |
| `python3 scripts/check_sorry_data.py research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean` | Exit 1; 288 reported declarations. Representative data definitions were independently inspected below. |
| `decomposition`, line 82; `inertia`, line 83 | Chosen Galois subgroups have `sorry` bodies. `localRep`, `LocalH` and subsequent statements depend on those choices. |
| `quotientRep`, line 214; `quotientEquiv`, line 215; `quotientMap`, line 217 | The representation, carrier identification and quotient morphism have `sorry` bodies. Their API cannot be kept merely by omitting their declarations. |
| `dualRep`, line 320; `dualEquiv`, line 321 | The Cartier-dual representation and its carrier identification have `sorry` bodies; duality consumers mention them. |
| `rationalRep`, line 427; `rationalMap`, line 428; `rationalEquiv`, line 430 | Rationalisation data have `sorry` bodies. The real-bodied `finiteLatticeCondition` still depends on these data. |

The checker count is a count of reported declarations, not a claim that all 288 were manually classified. The inspected examples already establish the prohibited data independently of the count. Successful elaboration with admitted data would not resolve this gate.

## Scope and counts

The packet retains 89 nodes, 272 API entries, 135 tests, 35 planets, 25 baseline references, 10 supplier requests and 5 gaps. No mathematical node, baseline citation, source finding, request, gap, coverage status or reader statement was added, removed or corrected. The packet remains a complete target-level pass with eight planned stages and no closed stages; this records planning coverage, not acceptance or implementation.

Only the top-level review was replaced. Its 89 checked entries are all `unverifiable` for this review: 0 verified, 0 corrected, 0 added, 89 unverifiable. This records that the mandatory gate prevented an acceptance audit; it does not assert that all 89 mathematical statements are false. The revision-two review and its detailed corrections remain available in [its report](REV-EulerSystemsAndKolyvaginSystems--ES.0~2.md).

Preliminary reading reached the revised support and coefficient interfaces and part of the local-condition construction. It did not establish all node locators, all pinned baseline statements, supplier closure or RT10/RT36 ownership. Consequently this review does not certify that R1, R2 and R3 from revision two are repaired together. The five `sourceIssues` keep their revision-two verdicts and attribution; none received an independent revision-three verdict. Replacing those verdicts without completing the source checks would misstate the evidence. The reader and suggested file are unchanged because no mathematical correction was made.

## Required next revision

Write the suggested file to the current shape from the start. Preserve all mathematical targets, hypotheses, locators, APIs, discriminating Checks and supplier contracts in the reader. Keep Lean declarations only when their carriers exist at the pins or are supplied by light real-bodied definitions. Remove admitted data and every declaration depending on them from the suggested file; retain the intended signatures as reader targets. The result must contain at most 5,000 lines. The data checker must pass, and retained signatures must elaborate using `lean-check`.

After that revision, perform the full independent audit required by #9261, including the three earlier arithmetic corrections, every node and baseline citation, the five source findings, supplier closure, tests and RT10/RT36 ownership. No new mathematical rejection is inferred from this early gate.

## Validation

`scripts/check_blueprint.py` exits 0 with 0 errors and 0 warnings; `intake.py check-files` reports 3 files and 0 problems; `git diff --check` passes. A structural comparison confirms that only the packet's top-level review changed and that all 89 node IDs occur exactly once in its checked entries. Lean was not run in this review: elaboration is unnecessary to establish these inspected shape violations and would not repair them. No promotion, upstream edit or second claim was made.
