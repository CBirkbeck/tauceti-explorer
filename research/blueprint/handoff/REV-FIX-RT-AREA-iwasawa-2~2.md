# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-7I2eky`, 11 October 2026. Refs
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219).
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6107628852).
Input: `ac2c5de6a52455c01121d8261db3cbece54382db`.
Branch: `codex-7I2eky-review-6219`. One claim; I authored none of the fixes.

## Status and next action

**Scope-blocked checkpoint, not a time limit.** The bounded review of all six
correction decisions is complete in the
[report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md). L3 is accepted for finding
/1; PMIA remains `needs_changes` for current-library duplication. The two
issue-named packets have fresh top review records attributed to this session;
the entire preceding top verdict and history are archived intact. All
mathematical fields and all four Suggested files equal the input.

The live issue permits L3 and PMIA. The queue also requires L3-2 and D.1 to
name `independent-review-REV-FIX-RT-AREA-iwasawa-2~2` in their top review
objects. Those omitted packets still name their accepted earlier layer
reviews. The unmodified `issues.deliverables_complete` returns false. A
read-only overlay of precisely the two candidates below returns true. PMIA's
negative verdict qualifies as a completed review and is not the blocker.

[WORKERS.md](../WORKERS.md), Doing the work, says “Edit only the files the issue
names, plus your own scratch space.” I asked in the worker conversation to
include the two omitted review-metadata updates. No authorization has arrived;
neither candidate is installed. Before redispatching, reconcile the issue's
file list with the queue or explicitly authorize those two packet paths.
Another review under the same scope cannot finish this job.

Once authorized, inspect intervening changes and use the guarded installation
below. Rerun packet/intake checks and the stock completion predicate, then
submit the finished review. This bounded correction review does not replace
or claim authorship of the complete preceding 79-node L3-2 and 72-node D.1
ledgers. Their full records must remain intact in reviewHistory.

## Evidence and remaining work

All four actual packets and both exact candidates pass the pinned-index
blueprint checker with zero errors. L3 has 26 inherited short-API warnings;
the other three have none. Non-review fields equal input. Each fresh review
appends exactly one complete preceding verdict after its original history.
No packet/candidate has an `excerpt` field. Intake file rules and
`git diff --check` pass.

Fresh sequential shared-build `lean-check`: L3 fails on unresolved `research`
imports before its body; L3-2, D.1 and PMIA elaborate with respectively 111,
307 and 1,075 `sorry` warnings and no other diagnostics. No Suggested edits,
Lean language server, library build or dependency update ran. Memory exceeded
20 GB before every compile.

Signed Gamma/period, strict FG permutation/filtration and compound-map finite
examples pass. The report gives their distinguishing values and source
locators; these examples are not theorem proofs. Nine public PDFs were freshly
retrieved and checked against the preceding receipts. No book was used; no
source passages are stored in these deliverables.

Current read-only heads: TauCetiRoadmap
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`; Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Programme pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The report identifies the pinned
statements read and separates them from newer implemented interfaces.

PMIA needs a separate coordinated packet/reader/Suggested/consumer revision:
reuse current higher Fitting and stable-transpose implementations for five
generic L6 targets, preserving arithmetic image orders, inverse-character
sharp transport, arbitrary-family span/image adapters, nonflat examples and
opposite-ring dual factors P0×Q1 and P1×Q0. Exact declarations and hypotheses
are in the report. Reader and consumer paths are outside this live issue;
scheme-level targets are not supplied by ring-module Fitting ideals alone.
ProfiniteArithmetic and StableReduction were the upstream models read.

The [input handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ac2c5de6a52455c01121d8261db3cbece54382db/research/blueprint/handoff/REV-FIX-RT-AREA-iwasawa-2~2.md)
retains preceding checkpoint history. All continuation material is below;
no disposable scratch path is needed.

## Exact candidates and guarded installation

Run from the repository root only after the scope is authorized. This checks
both input hashes before writing either file, archives each preceding verdict
once and checks exact candidate bytes. If an input guard fails, compare the
intervening review and mathematical changes; do not bypass the guard.

```python
import copy
import hashlib
import json
from pathlib import Path

records = json.loads(r'''[
  {
    "path": "research/blueprint/packets/DirichletPadicLFunctions--L3-2.json",
    "inputSha256": "d671033f9875533c41aeccd7a9382f87feb616c4f947376109f907713b26cd14",
    "candidateSha256": "07ee019e6884f9bf3b99c3dde614b946404e62633a553edbe280bb644502397c",
    "review": {
      "status": "accepted",
      "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
      "date": "2026-10-11",
      "notes": "Bounded independent correction review of finding /2 by Codex (GPT-6), session codex-7I2eky, following independent-review-REV-DirichletPadicLFunctions--L3-2; the full 79-node ledger is archived intact in reviewHistory. Re-read Zhao section 1.2 p.461, section 4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and Appendix B p.474. Verified primitive odd tame chi, the even chi-omega branch, direct chi(a) Gamma weights and conductor term (1-chi(p))*B1,chi*log_p(N), removed only under chi(p)=1. Strict FG permutation/filtration examples pass, including N=1 and dyadic cases. The recorded E37 endpoint repair, convergence inputs and separate nonvanishing request remain. Five gaps and eight requests remain. Pinned-index checker: zero errors/warnings. Fresh lean-check: exit 0, 111 admission warnings and no other diagnostics. No mathematical or Lean field changed."
    }
  },
  {
    "path": "research/blueprint/packets/PadicHodgeRegulators--D.1.json",
    "inputSha256": "2f70c0c000179cbd10c77a243d003214ca1ad0b171ff2e7f977972e62405f22c",
    "candidateSha256": "77eb1c00266d6425fc2d1afdf06cfda2157c00ca406dbf896c8b04a4740179ab",
    "review": {
      "status": "accepted",
      "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
      "date": "2026-10-11",
      "notes": "Bounded independent correction review of finding /3 by Codex (GPT-6), session codex-7I2eky, following independent-review-REV-PadicHodgeRegulators--D.1~2; the full 72-node ledger is archived intact in reviewHistory. Re-read Ertl–Niziol v2 sections 2.1–2.2 pp.4–8/Theorems 2.2–2.3, Colmez–Niziol v4 Corollary 3.16 p.37/Theorem 5.4 p.54 and Nekovar–Niziol v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54. Checked divided/undivided fibers, lifted divisible ideal, directed omega/tau legs, only omega multiplicative, factorial-modified twist, exact divided range i≤r≤p−2, bounded undivided integral error and rational exponential/sign normalization. Shared CS.0–CS.3 remain supplier requests; nine gaps and twenty requests remain. Pinned-index checker: zero errors/warnings. Fresh lean-check: exit 0, 307 admission warnings and no other diagnostics. No mathematical or Lean field changed."
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

Fresh retrieval on 11 October 2026; SHA-256 bytes match the preceding handoff.
Read only at the source locators in the report. No PDF or extracted source
text is needed in the repository.

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
