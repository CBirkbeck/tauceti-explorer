# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-Ocof1q`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6105241649).
Input commit: `1e39b91ecd76e1bfdf116c6502efc2f2b5fd3b7f`.

## Status: blocked by file-scope authorization

The six-finding correction review is ready. Preserve the attribution in the
[report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) and its immutable
predecessor links. L3 already records acceptance under this review job; PMIA
already records its justified `needs_changes`. The queue finishes when the
exact L3-2 and D.1 records below are installed. Their original
`codex-jIGDIK` attribution must remain.

The live issue omits these queue-required packets:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

[WORKERS.md](../WORKERS.md), Doing the work, says:
“Edit only the files the issue names, plus your own scratch space.”
The issue also restricts edits to its named files under review. After
preparing and validating the concrete two-record changes, I asked through
the worker conversation for authorization to change only `review` and
`reviewHistory` in those two packets. The question remains unanswered.
Neither packet was edited; queue ownership and intake eligibility do not
supersede this instruction.

Authorize these two paths or repair the live issue before redispatch.
Repeating the completed review cannot finish the scope-blocked job.
Negative PMIA review does not prevent this review finishing; its coordinated
revision is a separate job. Do not change the completion predicate, add
another identical L3/PMIA history entry or replan existing upstream work.

## Fresh checks in this continuation

Prepared the exact two candidates from the preceding handoff and matched
both input/candidate hashes below. Their full prior reviews retain 79 and
72 `checked` node decisions. Asserted that every non-review field is equal
and each history equals the prior history plus the entire prior review.
All four actual packets pass the exact pinned-index checker with zero errors;
L3 retains 26 inherited short-API warnings, the other three have none. Both
scratch candidates pass with zero errors and warnings. Actual completion is
false; a read-only substitution of exactly the two candidates makes it true.
The actual four packets and four Suggested files retain their input hashes.
No packet contains an `excerpt` field.

Read all six finding claims, verifier decisions and the round-two fix report.
Directly checked Zhao §1.2 p.461, §4 pp.471–473 and Appendix A p.473;
Ertl–Niziol v2 §§2.1–2.2 pp.4–8/Theorem 2.2 p.7;
Colmez–Niziol v4 Corollary 3.16 p.37/Theorem 5.4 p.54;
Nekovář–Niziol v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54.
Text readings and visual checks of Zhao p.472 and Ertl–Niziol p.7 agree with
the bounded /2 and /3 contracts. Five gaps/eight requests in L3-2 and nine
gaps/twenty requests in D.1 remain explicit. Four public-PDF hashes reproduced
below; no book used and no source passage copied into the repository.

Read the five current native Fitting/transpose declarations named in the
report and their PMIA counterparts. Their exact hypotheses support PMIA's
negative ownership verdict. Consulted current ArithmeticDirichletSeries and
StableReduction README/Suggested interfaces. Current read-only upstream heads
are TauCetiRoadmap `070dc2becd74419e76303ede84b465ed4a69461f` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the current LAD complex
conventions and RS-16 I.5 proof-route decision. These checks preserve earlier
full source/node audits with their original attribution.

Lean was not repeated for metadata-only candidates. The unchanged Suggested
hashes below preserve `codex-YXQsbh`'s evidence: L3 fails at its `research`
import; L3-2, D.1 and PMIA elaborate with 111, 307 and 1,075 admission warnings
only. This session makes no fresh compilation claim.

## Installation guards

Exact UTF-8 file SHA-256. Candidate serialization is
`json.dumps(..., ensure_ascii=False, indent=2)` plus one final newline.
If an input differs, inspect intervening changes rather than overwrite newer
evidence or mathematics.

| Packet | Input | Candidate |
| --- | --- | --- |
| L3-2 | `d671033f9875533c41aeccd7a9382f87feb616c4f947376109f907713b26cd14` | `71f6162cd144fe45eaef0ed07832db8f88e2006e9d7382894cbfe44de32d5223` |
| D.1 | `2f70c0c000179cbd10c77a243d003214ca1ad0b171ff2e7f977972e62405f22c` | `510b0ca6219eef4450391bfedcee0d0dc6b7d27b198edf2f25a67365ca410caf` |

## Exact remaining records

Prepared by `codex-jIGDIK`; retain that attribution. These records accept the
bounded corrections and preserve open supplier obligations.

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

## Resume after authorization

1. Require the guarded input hashes above to match.
2. Append each entire current `review` to its existing `reviewHistory`, then
   install the corresponding exact record above. Assert that all other parsed
   fields and the full earlier histories are unchanged.
3. Keep L3, PMIA and every Suggested file byte-identical. Reject any `excerpt`
   field recursively.
4. Run all four packets through `scripts/check_blueprint.py` using the existing
   pinned declaration index. Run `git diff --check` and
   `intake.py check-files` on the changed paths.
5. Import `issues` from `research/blueprint`, select queue job
   `REV-FIX-RT-AREA-iwasawa-2~2` and require `deliverables_complete(job, root=...)`
   to return true on the actual checkout, without an overlay.
6. Update this report/handoff to completed status with the authorization and
   installation evidence; submit the finished review with Refs #6219.

## Fresh source receipts

Public PDFs fetched on 11 October 2026; full locators are in the report.

| Source | SHA-256 |
| --- | --- |
| [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf) | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| [Ertl–Niziol v2](https://arxiv.org/pdf/1603.01705v2) | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| [Colmez–Niziol v4](https://arxiv.org/pdf/1505.06471v4) | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| [Nekovář–Niziol v5](https://arxiv.org/pdf/1309.7620v5) | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |

## Unchanged Suggested-file hashes

| File | SHA-256 |
| --- | --- |
| DirichletPadicLFunctions--L3 | `46fe3cba63b8c88eb0e0d734e8138009d421aac3fae334b70116b8f31da1af85` |
| DirichletPadicLFunctions--L3-2 | `d8be865820fe7491d3bd196c4a47c78e753595786bd939e8328ac20b121fa2a2` |
| PadicHodgeRegulators--D.1 | `6398a506a4195e0f606576e60253f412d5be2cb30b6c39f455439777f9acfee8` |
| PadicMeasuresIwasawaAlgebras | `85f103506252ce8d18359d5b8610365132592e4286e182acf0760857fbde1bc5` |

## Checkpoint scope

Only this handoff and the review report change. Both exact candidates are
fully specified here and validated; disposable scratch is unnecessary to
resume. Actual dispatch remains incomplete because scope authorization is
pending. Only #6219 was claimed; opening this checkpoint ends this run.
