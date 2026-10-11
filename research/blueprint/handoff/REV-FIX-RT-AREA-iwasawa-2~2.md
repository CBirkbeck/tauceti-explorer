# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-Yjzufy`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
Input: `897618096af2bb002a83d22044f03ed8e63fd066`.
Branch: `codex-Yjzufy-review-iwasawa-2`. One job; none of its fixes were mine.

## Resumption gate

**Scope-blocked checkpoint.** The six bounded correction decisions are done.
The [review](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) contains the source
locators, mathematical boundaries and current-library overlap. L3 is accepted
for /1; PMIA needs changes for /4. Both live issue-named packets carry this
session's verdict, preserving the full previous reviews and histories.

The live issue and its full instructions omit L3-2 and D.1. The queue requires
both to carry this review's identifier. The stock completion predicate returns
false on the permitted tree and true with exactly the two metadata candidates
below; a `needs_changes` verdict is a completed review.
[WORKERS.md](../WORKERS.md), Doing the work, says “Edit only the files the issue
names, plus your own scratch space.” I requested authorization for these two
paths in the worker conversation. No answer arrived, and neither was changed.

Before redispatching, reconcile #6219's live file list and instructions with
its queue outputs, or expressly authorize the two metadata paths. Repeating
the same mathematical audit cannot resolve this gate. After authorization,
compare intervening changes, install the guarded records below and check all
four packets, intake file rules and the stock completion predicate. Preserve
the prior full-layer `checked` ledgers (79 nodes in L3-2, 72 in D.1). These
records certify bounded corrections, not repeated whole-layer audits.

## Checks and mathematical follow-up

All four actual packets and both exact candidates have zero blueprint checker
errors. L3 has 26 inherited short-API warnings; the others have none. All
non-review fields and Suggested files match the input. Preceding review
objects are appended intact after existing histories. No packet or candidate
contains an `excerpt` field. Intake checks and `git diff --check` pass.

Fresh sequential `lean-check`: PMIA exits 0 with 1,075 `sorry` warnings;
L3-2 exits 0 with 111; D.1 exits 0 with 307. Those files have no other
diagnostics. L3 exits 1 before body elaboration on unresolved `research`
imports. More than 20 GB was available before each run. No language server,
dependency build or update ran. Finite Gamma-sign/dyadic-period, FG
permutation/congruence/strict-filtration and rectangular compound-preimage
controls pass. They do not prove the admitted theorems.

Pinned sources were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; the four relevant shared-build
source files match their pins. Current read-only heads are TauCetiRoadmap
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current declarations are never
attributed to the older pin. ProfiniteArithmetic and StableReduction were
read as upstream examples; they were not replanned.

PMIA requires a separate coordinated packet/reader/Suggested/consumer revision
to reuse `TauCeti.fittingIdeal`,
`Submodule.minorsIdeal_span`, `TauCeti.minorsIdealOfSet_eq_of_span_eq`,
`TauCeti.fittingIdeal_eq_minorsIdealOfSet`, `Submodule.minorsIdeal_ker_eq_of_surjective`,
`TauCeti.fittingIdeal_eq_minorsIdeal_ker`, `TauCeti.fittingIdeal_baseChange` and
`TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`. Exact
hypotheses and file locations are in the report. Keep arithmetic image orders,
inverse-character sharp scalar transport, arbitrary-family span/image
adapters, nonflat examples and dual factors P0×Q1 versus P1×Q0.
This pass narrows the previous handoff: the current Generators module already
supplies arbitrary kernel-generator sets without finite-relation assumptions.
A family not generating its ambient module must use its finite span/image:
the family ((2,0)) in Z² has degree-one relation-minors ideal Z, whereas
Fitt¹(Z²)=0. Concrete coordinate-minor comparisons remain adapters. Scheme-level
Fitting targets still need their scheme-level work. PMIA's negative verdict
must not be treated as acceptance or erased to complete this review job.

The [input handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/897618096af2bb002a83d22044f03ed8e63fd066/research/blueprint/handoff/REV-FIX-RT-AREA-iwasawa-2~2.md)
retains the previous checkpoint history. No disposable scratch file is needed.

## Guarded records

Run from the repository root **only after the two omitted paths are
authorized**. All guards are checked before either packet is written. A failed
guard requires inspection of intervening changes, not bypassing it.

```python
import copy
import hashlib
import json
from pathlib import Path

records = json.loads(r'''[
  {
    "path": "research/blueprint/packets/DirichletPadicLFunctions--L3-2.json",
    "inputSha256": "d671033f9875533c41aeccd7a9382f87feb616c4f947376109f907713b26cd14",
    "candidateSha256": "20728fb00b86035fbde0712ef9a8deeb5657eec794cc1f5d52a990a1b07ebb90",
    "review": {
      "status": "accepted",
      "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
      "date": "2026-10-11",
      "notes": "Bounded correction review by Codex (GPT-6), session codex-Yjzufy. Follows independent-review-REV-DirichletPadicLFunctions--L3-2; its entire 79-node checked ledger is archived intact. Independently checked finding /2 against Zhao section 1.2 p.461, section 4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and Appendix B p.474. The primitive odd tame character determines the even chi-omega branch; weights are chi(a) directly and the additional term is (1-chi(p))*B1,chi*log_p(N). It disappears only under chi(p)=1. Dyadic branch conventions, the E37 strict endpoint repair, convergence and separate arithmetic nonvanishing requests are retained. Finite permutation/congruence/strict-filtration controls passed for (5,3,25),(2,3,4),(2,3,16),(3,1,9), including the N=1 auxiliary control. Checker: zero errors/warnings. Fresh lean-check: exit0,111 admission warnings only. This is a bounded correction review, not a repetition of the complete layer audit. No mathematical or Suggested field changed."
    }
  },
  {
    "path": "research/blueprint/packets/PadicHodgeRegulators--D.1.json",
    "inputSha256": "2f70c0c000179cbd10c77a243d003214ca1ad0b171ff2e7f977972e62405f22c",
    "candidateSha256": "6c860191e54187e99495c5039cdd9b4b42bcea459be03816d99d192daa0145db",
    "review": {
      "status": "accepted",
      "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
      "date": "2026-10-11",
      "notes": "Bounded correction review by Codex (GPT-6), session codex-Yjzufy. Follows independent-review-REV-PadicHodgeRegulators--D.1~2; its entire 72-node checked ledger is archived intact. Independently checked finding /3 against Ertl–Niziol v2 sections 2.1–2.2 pp.4–8/Theorems 2.2–2.3, Colmez–Niziol v4 Corollary 3.16 p.37/Theorem 5.4 p.54, and Nekovar–Niziol v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54. The lifted divisible ideal, divided/undivided complexes, omega and tau directions with p^r composites, omega product compatibility, modified Tate twist and exact small-weight range are correct. Integral bounded error is kept separate from rational exponential comparison; boundary sign and scaling are explicit. CS.0–CS.3 remain shared producer requests. Checker: zero errors/warnings. Fresh lean-check: exit0,307 admission warnings only. This is a bounded correction review, not a repetition of the complete layer audit. No mathematical or Suggested field changed."
    }
  }
]''')
prepared = []
for record in records:
    path = Path(record["path"])
    raw = path.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == record["inputSha256"], path
    old = json.loads(raw)
    packet = copy.deepcopy(old)
    packet.setdefault("reviewHistory", []).append(copy.deepcopy(old["review"]))
    packet["review"] = record["review"]
    assert {k: v for k, v in packet.items() if k not in ("review", "reviewHistory")} == {
        k: v for k, v in old.items() if k not in ("review", "reviewHistory")}
    assert packet["reviewHistory"] == old.get("reviewHistory", []) + [old["review"]]
    candidate = (json.dumps(packet, ensure_ascii=False, indent=2) + "\n").encode("utf-8")
    assert hashlib.sha256(candidate).hexdigest() == record["candidateSha256"], path
    prepared.append((path, candidate))
for path, candidate in prepared:
    path.write_bytes(candidate)
```

## Public-source receipts

Fresh retrieval on 11 October 2026. Every PDF hash matches the previous
handoff. Only the report's cited locations were used; no book, source passage,
PDF or extracted source text is stored in these deliverables.

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
