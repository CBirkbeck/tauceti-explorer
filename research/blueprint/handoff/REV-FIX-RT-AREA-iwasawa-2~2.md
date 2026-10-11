# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-k2zZva`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6106025819).
Input commit: `5cbcf764a67eb29027a3af3f4518b483c8f950ea`.
Only #6219 was claimed; this session authored none of the fixes under review.

## Status: scope-blocked checkpoint

The bounded six-finding review is ready. L3's acceptance and PMIA's
`needs_changes` already use this review job's identifier. The remaining work
is to install the two exact review-only candidates below. I reconstructed them
in scratch, reproduced the guarded hashes, preserved all non-review fields and
entire previous reviews/histories, and validated both candidates. A read-only
substitution makes the unmodified completion predicate true; actual completion
is false. PMIA's negative verdict completes its part of this review and its
coordinated revision belongs to a separate job.

The live issue still omits these queue-required paths:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

[WORKERS.md](../WORKERS.md), Doing the work, says:
“Edit only the files the issue names, plus your own scratch space.”
After preparing the concrete two-record changes, I requested explicit
permission through the worker conversation. No answer has arrived. Neither
packet was edited. Authorize these paths or update the live issue before
redispatching. Queue ownership and passing intake checks do not override this
restriction; another unchanged mathematical audit cannot resolve it.

## Work and checks completed

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) gives a reason for each
finding and precise source locators. Earlier exhaustive audits keep their
attribution; the exact candidate records retain `codex-jIGDIK`'s attribution
and dates. The 79-node and 72-node prior ledgers remain intact. L3 and PMIA get
no additional duplicate history entries.

Freshly fetched all nine public PDFs below and matched their hashes. Read the
bounded correction evidence, visually inspecting Morita and Gross–Koblitz;
read the six claims/verifier records, round-two fix report, relevant pinned
native statements, five current Fitting/transpose statements and corresponding
PMIA contracts, four library-coverage records, RS-16 I.5, and current upstream
owner interfaces. No book was used; no source passage enters the repository.
Current read-only heads: TauCetiRoadmap
`070dc2becd74419e76303ede84b465ed4a69461f`; Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

All four actual packets and both candidates pass the programme-pinned index
checker with zero errors. L3 retains 26 inherited short-API warnings; the other
five checks have none. Both candidates pass intake file rules. No packet or
candidate has an `excerpt` field. All eight actual packet/Suggested hashes
match below. Four sequential `lean-check` runs finish: L3 fails before body
elaboration on its unresolved `research` imports; L3-2/D.1/PMIA succeed with
111/307/1,075 `sorry` warnings only. No compilation remains running.
`git diff --check` and intake checks pass for the report and handoff.

This checkpoint changes only the report and handoff. It is blocked on scope,
not elapsed time. Disposable scratch is unnecessary to resume: exact records,
guarded hashes, receipts and installation checks are preserved below, from the
preceding attributed handoff.

## Installation guards

Exact UTF-8 file SHA-256. Candidate serialization is
`json.dumps(..., ensure_ascii=False, indent=2)` plus one final newline.
If an input differs, inspect intervening changes rather than overwrite newer
evidence or mathematics.

| Packet | Input | Candidate |
| --- | --- | --- |
| L3-2 | `d671033f9875533c41aeccd7a9382f87feb616c4f947376109f907713b26cd14` | `71f6162cd144fe45eaef0ed07832db8f88e2006e9d7382894cbfe44de32d5223` |
| D.1 | `2f70c0c000179cbd10c77a243d003214ca1ad0b171ff2e7f977972e62405f22c` | `510b0ca6219eef4450391bfedcee0d0dc6b7d27b198edf2f25a67365ca410caf` |

The unchanged issue-named packet hashes are L3
`209f46501fd667a585ba591ea805d2cab7180294f3f92eefcf9f3b09fc8d1cce`
and PMIA `96b645e4e42fc93fcc9c1199cace46c803e77af96b2d5bf1ab7ed7a3a93b41b3`.
Their histories have 44 and 45 entries respectively. Do not overwrite these
existing records or add identical review-history entries when installing the
two remaining candidates.

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
| [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3) | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| [BCGP25](https://arxiv.org/pdf/2502.20645) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |

## Unchanged Suggested-file hashes

| File | SHA-256 |
| --- | --- |
| DirichletPadicLFunctions--L3 | `46fe3cba63b8c88eb0e0d734e8138009d421aac3fae334b70116b8f31da1af85` |
| DirichletPadicLFunctions--L3-2 | `d8be865820fe7491d3bd196c4a47c78e753595786bd939e8328ac20b121fa2a2` |
| PadicHodgeRegulators--D.1 | `6398a506a4195e0f606576e60253f412d5be2cb30b6c39f455439777f9acfee8` |
| PadicMeasuresIwasawaAlgebras | `85f103506252ce8d18359d5b8610365132592e4286e182acf0760857fbde1bc5` |
