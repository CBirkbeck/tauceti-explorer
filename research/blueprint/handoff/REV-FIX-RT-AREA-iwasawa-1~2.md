# Handoff: REV-FIX-RT-AREA-iwasawa-1~2

Issue #6217; Codex — `codex-kEnFR2`; 10 October 2026.
Branch: `codex-kEnFR2-review-6217`.

**Blocked checkpoint.** The issue-named HE.0 fix review is complete and accepted.
The live issue authorizes one packet; the queue requires eleven. WORKERS.md
limits edits to the issue's named files. Scope clarification was requested in
this session but remains unanswered. No further HE.0 re-review will resolve
this mismatch; the extra packets and queue are untouched.

## Completed

Independently checked confirmed findings /2, /8, /9 and /10, their round-two
fix report, current HE.0 and supplier statements, baseline citations, relevant
API/tests and ownership. No further mathematical or Lean change was needed.
The report gives each verdict and source locator; the packet's
`verification.independentFixReviewSession` gives this session's receipts.
Prior reviews and source checks are preserved. All 21 gaps, 63 requests and
unchecked implementation statuses remain.

Read Zhang Theorem 2.1, §6.3 and Theorems 6.4–6.5/7.1 in the cleared version
of record; Howard Definition 1.2.3, H.0–H.5, Theorems 1.6.1/1.6.5 and
Proposition 1.7.4/Theorem 1.7.5; Skinner A/B and §2.5; Zanarella Definition
2.3.2, Proposition 2.3.3 and Theorem 2.3.6. The four source hashes match the
previous receipts. No cleared source file or source passage entered the repository.

Read all thirteen Mathlib baseline statements at the exact pin; inspected
current upstream boundaries and the Tau Ceti degeneracy operator read-only.
Rechecked the reachable declaration graph: 30,589 unique indexed nodes,
no HE.0 cycle; six clean/thirteen Zhang HE.6 nodes; 62 HE.8-family nodes
with no HE.6 dependency; no period-to-Heegner dependency. All 78 target names and every API/test
name are present in the suggested file.

Validation: packet checker zero errors/warnings; source-issue schema/version
checks zero problems for ten issues and 24 receipts; intake file checks and
`git diff --check` pass. `lean-check` exits 0 with 114 warnings, all `sorry`.
Suggested-file SHA-256:
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
The suggested file is unchanged. No Lean process or language server remains.

## Required scope resolution

For HE.0-only scope, align this queue job's outputs with the live issue:

1. `research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md`
2. `research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`
3. `research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean`

The actual `issues.deliverables_complete` returns false; an in-memory copy
with those three outputs returns true.

If the queue's broader scope is intended, authorize these ten packet and
suggested-file pairs in the live issue, then independently check their
applicable findings from the red-team result, verification and round-two fix
report before recording this job's verdict:

1. HeegnerPointEulerSystems--HE.7s
2. GrossZagierAndArithmeticHeights--GZ.0
3. RankZeroOneBSD--BSD.0
4. RankZeroOneBSD--BSD.7
5. EulerSystemsAndKolyvaginSystems--ES.0
6. GeneralizedHeegnerCycles--GH.0
7. GrossZagierAndArithmeticHeights--GZ.8
8. PadicHodgeRegulators--D.1
9. EulerSystemsAndKolyvaginSystems--ES.8
10. KatoEulerSystems

ES.0 has a needs_changes review; the other nine have accepted reviews by other
jobs. Those reviews do not replace this job's independent fix review. Never
stamp an unreviewed packet. The reader is outside the live issue's scope; its
regeneration remains needed after scope resolution, as the earlier report
records. All information needed to resume is in this handoff, the report and
packet; scratch may be deleted.
