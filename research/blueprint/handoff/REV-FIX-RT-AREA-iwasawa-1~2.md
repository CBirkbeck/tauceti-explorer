# Handoff: REV-FIX-RT-AREA-iwasawa-1~2

Issue #6217; Codex — `codex-TRbVPK`; 10 October 2026.
Branch: `codex-TRbVPK-review-6217`.

## Status

**Blocked checkpoint.** The live issue's HE.0 review is finished and accepted.
Completion of the queue job needs a scope reconciliation, not another HE.0
review. The previous PR #7275 also completed HE.0 but was taken as a checkpoint.

The live issue lists only the HE.0 packet/suggested file and the review report.
The local queue and live main queue list eleven packets. The intake's
`deliverables_complete` requires the current job's reviewer marker in all eleven,
but WORKERS.md restricts edits to files named by the issue. The remaining ten
cannot be stamped without independent review and authorization of their scope.
A scope clarification was requested during this run and had no answer when the
checkpoint was prepared. No queue, bot, labels, atlas edges or supplier files
were changed.

## Completed work and evidence

- Independently checked the four HE.0 findings /2, /8, /9 and /10 against the
  red-team verification, round-two fix, exact primary passages and supplier
  statements. The report gives each verdict and the remaining supplier boundaries.
- Corrected `HE.6/primitivity-versus-nonzero`: removed the Mazur–Rubin-over-Q
  dependency, pointed the proof to the requested Howard-over-K primitivity
  definition/formula, stated both dual H.0–H.5 lists, the prime-set condition,
  nonzero bottom class and p≥5, and synchronized its Lean comment. The suggested
  signature now retains `5 ≤ p`.
- Added independent confirmations of source issues E9/E10. E9's explanation
  now uses the read Elkies source and an explicit finite p=5 matrix subgroup;
  it does not depend on an unchecked LMFDB record. The report gives the subgroup
  calculation. Neither issue claims a counterexample to Zhang's main theorem.
- Read all thirteen baseline declarations at the exact Mathlib pin, the
  reviewed library audit, current upstream roadmaps and read-only Tau Ceti.
  Generic Tate, pairing, Kummer, image and self-dual results remain imports.
- Checked the current declaration graph (30,584 unique nodes): no reachable
  HE.0 cycle; exact six/thirteen HE.6 partition; no outside Zhang consumer;
  no Zhang-to-clean dependency; no period-to-Heegner dependency. The current
  HE.8 family has 62 nodes and no HE.6 dependency. The proposed sub-layers and
  stale-edge removal still need the maintainer's action.
- Updated the packet review and preserved both prior accepted reviews. Full
  new receipts/check results are in
  `verification.independentFixReviewContinuation`; the report uses source URLs,
  locators and paraphrases, with no copied source passages.

Final validation: `check_blueprint.py` gives zero errors/warnings;
`check_issues`/`versions_checked` give zero problems for ten issues and 24
receipts; intake `check-files` gives zero problems for the four changed files.
`lean-check` exits 0 with 114 warnings, all `sorry`, at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. Suggested-file SHA-256:
9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b.
All 78 statement comments and 120 node/API/test name records are accounted for. The
prototype still explicitly omits unexpressible supplier conditions. The packet
retains 21 gaps and 63 requests; this is a fix-review acceptance, not closure
or implementation.

## Where to resume

First reconcile the issue and queue. If the intended job is HE.0 only, the
maintainer needs to remove the other ten packet/suggested pairs from this job's
outputs; all authorized deliverables are finished. If all eleven are intended,
update the live issue's deliverables/full instructions, then independently
review the following ten packets and their suggested files before assigning
this job's reviewer marker:

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

Their existing independent reviews are retained. Do not treat this report as
a review of them or replace their markers without checking the fixes. Use
`RT-AREA-iwasawa-1.result.json`, its verification and `.fixes-2.md` to establish
which additional findings each packet carries.

The HE.0 reader is not an issue deliverable. Its regeneration needs the expanded
scope or a separate authorized job: this run changed the primitivity node, and
the previous review already left the reader behind on the primitivity request
and BSD.4 cycle descriptions. Regenerate it from the accepted packet rather
than copying historical prose from the old report.

Source receipts and all necessary mathematical notes are in the packet/report.
Scratch can be deleted after opening the pull request. The maintainer-cleared
Zhang source remains solely in the shared library; no file or passage was copied.
No Lean process or language server remains running.
