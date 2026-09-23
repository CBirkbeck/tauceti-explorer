# REV-PAPER-ANDRE-18

Final verdict: **revise**. This independent review is complete; PAPER-ANDRE-18
is returned to **partial**, with explicit correction and acceptance boundaries.

Reviewer: Codex — codex-a71f92, 2026-09-23. Refs #1465.
Claim comment 5801030880 was confirmed by bot comment 5801032950.
The reviewer did not author input PRs #1638, #1807 or #2009.
The source and extraction were read in full. Exact source hashes, auxiliary
reading scopes, library statements, route contracts and mathematical evidence
are in [the corrected extraction report](../papers/PAPER-ANDRE-18.md).

## Decisions

- Accept route 1, PerfectoidSpaces P0/P3/P8, as source ownership.
- Reject route 2, the currently overbroad PerfectoidRamification Part II.
- Reject route 3, the generic norm package incorrectly assigned to R0.
- Confirm E1, E2 and E4–E20; reject E3's proposed numbering erratum.
  E14 is already corrected by André and concerns Güntzer's source.
  E19/E20 are newly added candidates with explicit counterexamples, not
  claims of historical novelty or disproof of the main Abhyankar theorem.

## Change record

1. Replace contradictory completeness, item-count and retrieval metadata.
   Preserve previous workers' provenance as history. Distinguish the freshly
   read published PDF from inherited arXiv comparisons.
2. Correct the false unrestricted faithful-projective claim with the
   evaluation-ideal criterion and add its definition.
3. Correct the sharp uniformity bound for nondense value groups.
4. Remove automatic complete-spectral-norm invariance and the circular
   orbit-polynomial repair. Use finite-projective continuity in the
   finite-étale full-faithfulness argument.
5. Reconcile the separate errata E1–E18, retaining IDs and attribution and
   adding this review's own verdicts. Correct the Shimomoto E12 pointer.
6. Repair the free-object functor, unconditional localization injectivity,
   pointwise completion, domain nontriviality, Banach finite levels,
   localization naming, categorical epi/mono distinction and mixed-
   characteristic Frobenius typing. Keep conditional §5.4 conclusions.
7. Add five omitted §3.5 interfaces. Add four exact library subinterfaces
   for A°, A°°, ordinary integral closure and invariant integrality.
8. Demote four unsupported whole-category planned claims. Retain rejected
   routes as explicitly provisional candidates, with each missing item
   listed once. Do not create owner contracts or modify other roadmaps.
9. Expose unclosed granularity, remaining §4–5 coverage, provider comparisons,
   Lemma 2.3.5 proof direction and §3.4.4 proof ordering as gaps.

Counts: original 199 = 8 library + 65 planned + 126 missing;
revised 209 = 12 library + 62 planned + 135 provisional missing.
Source issues: 20 = 19 confirmed + 1 rejected.
The 22 prerequisite records are retained, with the E12 pointer corrected;
their underlying papers were not all read in this review.

## Verification

Executed validation (2026-09-23):

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDRE-18.result.json`: pass.
- `python3 research/blueprint/intake.py check-files` on exactly the five deliverables: 5 files, 0 problems.
- `python3 -m unittest tests.test_check_paper tests.test_source_issues tests.test_papers_queue tests.test_intake tests.test_check_errata tests.test_errata`: 55 tests pass.
- Additional read-only assertions: 209 unique IDs, status counts 12/62/135,
  each missing ID routed exactly once even though status is partial,
  twenty source issues with nineteen confirmed and one rejected,
  all verdicts attributed to this review.
- Exact finite regression checks over p=2,3,5 for the E4 valuation,
  E6 lower-bound example, E7 Boolean relations, E16 two-factor localization
  and E20 powers of π: pass. These support the written arguments and do not
  prove general theorems or the infinite counterexample E19.
- Fresh-main overlap guard at 713360d7f9daf3804fda79874399973194dc9f19:
  the five deliverables, binding instructions, checker/intake files and four
  cited roadmap contracts are unchanged from the inspected snapshot.
  Publication uses the fresh main tree, preserving other workers' changes.

No Lean deliverable is required; no Lean build was run.

This is a negative review, not an exhaustive absence certificate: residual
per-item providers, granular API coverage and final owner assignments remain
for revision. Rejecting incomplete routes prevents them from becoming design
jobs on the strength of structural validation alone.
