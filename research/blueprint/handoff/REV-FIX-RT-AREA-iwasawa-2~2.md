# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-kPnLrK`, 11 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6103517050).
Input commit: `0a5333428b0eb64b02aab302dca00b4495a91ef6`.

## Status: blocked by the live issue's file scope

The bounded six-finding correction review is finished. L3's accepted receipt
and PMIA's `needs_changes` receipt are already installed. L3-2 and D.1 have
accepted receipts prepared by `codex-jIGDIK`, reproduced exactly below.
PMIA's negative verdict is finished review work; do not accept duplicate
plans merely to obtain positive verdicts everywhere.

This continuation freshly checked all four packets, reread the five current
native Fitting/stable-transpose declarations, and validated a read-only candidate
receipt installation. It preserved all mathematical/planning fields and the
predecessor's full node audits. The [report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
separates this preflight from the predecessor's source review and Lean checks.
The [input handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/0a5333428b0eb64b02aab302dca00b4495a91ef6/research/blueprint/handoff/REV-FIX-RT-AREA-iwasawa-2~2.md)
also retains the earlier audit chain and installation rationale.

## Exact scope repair required

The live issue #6219 still omits:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

The queue lists both as outputs; `issues.deliverables_complete(job)` requires
their top reviews to name this job. Actual completion is False. Installing
only the two exact records below in a read-only candidate set makes it True.
WORKERS.md says, "Edit only the files the issue names, plus your own scratch
space." Explicit authorization for changing only `review` and `reviewHistory`
in these two paths was requested in the worker conversation; no answer has
arrived. Neither elapsed waiting time nor the queue/intake allowlist is approval.

Resume only when the live issue names both paths or explicit maintainer/user
authorization permits these two review-only edits. Do not repeat the completed
source review or append another L3/PMIA receipt. All packets and suggested
files are byte-identical to this continuation's input commit.

## Current validation

All four actual packets pass `check_blueprint.py` using the existing pinned
declaration index with zero errors. L3 has 26 inherited short-API warnings;
the other three have none. The two candidate packets have zero errors and
zero warnings. Recursive checks find no excerpt fields. Candidate preservation
assertions require exact equality of every field except `review` and
`reviewHistory`, and new history equals old history plus the entire old review,
including its 79-node or 72-node checked array and original attribution.

No Lean source changed and no new Lean run was performed. Predecessor
`codex-YXQsbh` ran all four suggested files: L3 fails before body elaboration
on an unknown `research` import; L3-2, D.1 and PMIA elaborate with respectively
111, 307 and 1,075 expected proof-placeholder warnings only. Do not weaken the
owned sibling interfaces to bypass the missing compiled prototype artifacts.

Current Tau Ceti remains at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The five native declarations listed in the report were reread; they still
supply the generic Fitting and projective-transpose targets duplicated by
PMIA. Their newer commit must not be attributed to programme pin `f790474`.
The coordinated PMIA reader/suggested/consumer revision remains required.
No source PDF was fetched in this continuation; earlier source audits and
elaborations retain their original attribution. No process remains running.

## Installation guards

Hashes below are SHA-256 of the exact UTF-8 JSON files. Candidates use
`json.dumps(..., ensure_ascii=False, indent=2)` plus one final newline.
If an input has changed, inspect the intervening edits before installing a
receipt; do not replace new mathematics or erase newer review evidence.

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

## Final installation checks after authorization

For each extra packet, archive the entire existing top review in
`reviewHistory`, then install the corresponding record above. Require exact
parsed equality of all fields except `review` and `reviewHistory`; require
new history == old history + [entire old review]. Keep L3, PMIA and every
suggested file byte-identical to input. Recursively reject excerpt fields.

Run the packet checker on all four packets with the pinned declaration index,
`git diff --check`, and `intake.py check-files` on changed paths. Run the
unchanged completion predicate with the actual repository root and require
True. The code for that check is in the predecessor's linked handoff; no
predicate or queue edit is authorized. Update the report and handoff with
explicit authorization and the actual installation results, then submit a
finished review PR with Refs #6219, accurate checks and attribution. A finished
review retains PMIA's justified `needs_changes` verdict.
