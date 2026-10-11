# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-aNVzdW`, 11 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6104747484).
Input commit: `9e77d5c183d3c758c5971353e4069181095b2b2c`.

## Status: blocked by missing file-scope authorization

The six-finding correction review is complete. Its attributed verdicts and
primary-source evidence are in the [report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md).
L3 already carries this job's accepted receipt; PMIA carries its justified
`needs_changes` receipt. Only installation of the exact L3-2 and D.1 records
below remains. Preserve their `codex-jIGDIK` attribution.

Issue #6219 omits these two packets from its deliverable list:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

The queue requires both records. [WORKERS.md](../WORKERS.md) says,
"Edit only the files the issue names, plus your own scratch space."
This session requested explicit authorization to change only `review` and
`reviewHistory` in those two packets. The checked candidates are ready, but
no approval has arrived and no packet has been edited. Queue/intake allowlists
alone do not override the issue's file-scope restriction.

Do not repeat the completed mathematical review, append another L3/PMIA
receipt, or edit the queue/completion rule. Resume installation after explicit
authorization or repair of the live issue's list. A finished correction review
retains PMIA's justified `needs_changes` verdict.

## This session's verification

Reproduced both exact candidates from the preceding handoff. All input and
candidate hashes match the guards below. The entire 79-node L3-2 review and
72-node D.1 review are preserved in history, with original attribution; every
non-review parsed field is identical. All four actual packets pass the
pinned-index checker with zero errors (L3 has 26 inherited short-API warnings,
all others zero). Both candidates pass at canonical paths in a read-only
context with zero errors/warnings. Actual completion is False; substituting
only these two records makes it True. No repository packet was substituted.

All four actual packets and all four suggested files retain their input byte
hashes. No source audit or Lean elaboration was repeated. The report preserves
previous source and Lean evidence with its original attribution. The current
read-only upstream commits remain TauCetiRoadmap
`070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Previous `codex-YXQsbh` Lean results remain that session's checks: L3 fails on
an unknown `research` import before body elaboration; L3-2, D.1 and PMIA
elaborate with 111, 307 and 1,075 expected proof-placeholder warnings only.
No Lean source changed, and no process remains running.

## Preserved source evidence

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) retains the six-finding
verdicts, exact primary-source locators, five native declarations and immutable
links to earlier exhaustive reviews. Its preceding source checks retain the
original sessions' attribution. This continuation fetched no source PDF,
used no book, and copied no source passage.

The following public-PDF hashes were reproduced by `codex-KJ9aP3` on
11 October 2026; they are preserved as earlier evidence, not new readings.

| Source | SHA-256 |
| --- | --- |
| [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf) | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2) | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| [Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4) | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| [Nekovar–Niziol v5](https://arxiv.org/pdf/1309.7620v5) | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |

## Installation guards

SHA-256 of the exact UTF-8 JSON files. Candidate serialization is
`json.dumps(..., ensure_ascii=False, indent=2)` plus one final newline.
Inspect intervening changes if an input hash differs; never replace new
mathematics or erase newer review evidence.

| Packet | Expected input | Prepared candidate |
| --- | --- | --- |
| L3-2 | `d671033f9875533c41aeccd7a9382f87feb616c4f947376109f907713b26cd14` | `71f6162cd144fe45eaef0ed07832db8f88e2006e9d7382894cbfe44de32d5223` |
| D.1 | `2f70c0c000179cbd10c77a243d003214ca1ad0b171ff2e7f977972e62405f22c` | `510b0ca6219eef4450391bfedcee0d0dc6b7d27b198edf2f25a67365ca410caf` |

## Remaining records

These exact records were prepared by `codex-jIGDIK`. They accept the bounded
corrections and preserve open supplier obligations. Keep that attribution.

### DirichletPadicLFunctions--L3-2

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Bounded independent review of finding /2 by Codex session codex-jIGDIK, following independent-review-REV-DirichletPadicLFunctions--L3-2 and its full 79-node audit, archived intact with its original attribution. Read Zhao §1.2 p.461, §4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and Appendix A p.473. Primitive odd tame character, compatible embeddings, the even chi*omega branch including dyadic conductor four, and the common logarithm are explicit. Direct character weights and correction (1-chi(p))*B1chi*log_p(N) agree with the source; simplification requires chi(p)=1 and nonvanishing is separate. Convergence/majorant requirements and the strict endpoint repair remain explicit. Five gaps and eight requests are retained. All mathematical/planning fields and earlier review evidence are preserved. See the report for checks and the limited correction-review scope."
}
```

### PadicHodgeRegulators--D.1

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Bounded independent review of finding /3 by Codex session codex-jIGDIK, following independent-review-REV-PadicHodgeRegulators--D.1~2 and its full 72-node audit, archived intact with its original attribution. Read Ertl–Niziol v2 §§2.1–2.2 pp.4–8/Theorem 2.2 p.7, Colmez–Niziol v4 Corollary 3.16 p.37/Theorem 5.4 p.54 and Nekovar–Niziol v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54. Distinct divided and undivided complexes, lifted divisible ideals, directed omega/tau legs, product behavior, factorial modified twist and exact divided range r<=p-2 are retained. Rational exponential is invertible below i=r and injective at i=r; inverse comparison, p^-r scaling and Bloch–Kato sign assert no integral inverse. Proposed CS.0–CS.3 producer obligations, nine gaps and twenty requests remain explicit. All mathematical/planning fields and earlier review evidence are preserved. See the report for checks and the limited correction-review scope."
}
```

## Installation after authorization

1. Require the input hashes above to match; otherwise inspect intervening edits.
2. Append each entire existing top review to `reviewHistory`, then install its
   corresponding exact record above. Assert parsed equality of all other
   fields, and history equality to old history plus the entire old review.
3. Keep L3, PMIA and every suggested file byte-identical to input. Recursively
   reject excerpt fields.
4. Run the packet checker on all four packets using the existing pinned index,
   `git diff --check`, and `intake.py check-files` on changed paths.
5. Import `issues` from `research/blueprint`, select the queue job with id
   `REV-FIX-RT-AREA-iwasawa-2~2`, and call `deliverables_complete(job, root=...)`
   with the actual repository root. Require True without any monkeypatch.
6. Update the report and handoff with explicit authorization and installation
   results; submit a finished review PR with Refs #6219 and accurate attribution.

A finished review retains PMIA's justified `needs_changes` verdict. No queue
or predicate change is authorized. Repeating source audits cannot resolve
this remaining scope mismatch.

## Checkpoint submission

Only this handoff and the review report are changed. The two exact candidates
were checked and are fully specified above. No mathematical or Lean file was
edited. Actual completion remains False; approval or live-issue scope repair
is required before their installation. Do not submit another scope-only
checkpoint without an external change to that blocker.

Final submission checks: `git diff --check` passes and
`intake.py check-files` reports two files and zero problems.
