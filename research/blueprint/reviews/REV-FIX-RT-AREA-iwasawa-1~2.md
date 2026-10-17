# Review #6217: blocked by incompatible issued and queued scopes

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-xnTg4o**, 17 October 2026.
Input commit: `c844b396e21e1fa45d3ee5127b777294f9deb8eb`.
The bot confirmed this session's claim in
[comment 6241476191](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6241476191),
identifying claim comment 6241473945. This session did none of the fixes.

**Blocked checkpoint.** The published issue permits a review of the HE.0
packet. That review already has an accepted verdict. The queue requires this
job's independent verdict on nine additional packets, which the issue does
not authorize editing. The mismatch persists on current main, with a different
set of outputs from the previous checkpoint. This report records the current
blocker; it does not repeat or extend the mathematical review.

## Published assignment and actual completion rule

I reread the live issue after the bot confirmed the claim. Its deliverables
and full instructions name these three files:

- `research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md`
- `research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`
- `research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean`

The local queue and a fresh GitHub contents read of main's queue agree:
**21 outputs**, comprising this report, ten packets and ten suggested files.
All exist. `issues.deliverables_complete` requires every packet's reviewer to
be `independent-review-REV-FIX-RT-AREA-iwasawa-1~2`, with a recognized verdict.
The current packet markers are:

| Packet | Reviewer | Status |
| --- | --- | --- |
| `HeegnerPointEulerSystems--HE.0.json` | `independent-review-REV-FIX-RT-AREA-iwasawa-1~2` | accepted |
| `HeegnerPointEulerSystems--HE.8c.json` | `independent-review-REV-HeegnerPointEulerSystems--HE.8c` | accepted |
| `HeegnerPointEulerSystems--HE.8.json` | `independent-review-REV-HeegnerPointEulerSystems--HE.8` | accepted |
| `GrossZagierAndArithmeticHeights.json` | `independent-review-REV-GrossZagierAndArithmeticHeights` | accepted |
| `HeightsRationalPointsAndObstructions.json` | `independent-review-REV-HeightsRationalPointsAndObstructions~2` | accepted |
| `RankZeroOneBSD--BSD.0.json` | `independent-review-REV-RankZeroOneBSD--BSD.0~2` | accepted |
| `HeegnerPointEulerSystems--HE.8b.json` | `independent-review-REV-HeegnerPointEulerSystems--HE.8b` | accepted |
| `EulerSystemsAndKolyvaginSystems.json` | `independent-review-REV-EulerSystemsAndKolyvaginSystems` | needs_changes |
| `SelmerIwasawaCohomology.json` | `independent-review-REV-SelmerIwasawaCohomology` | accepted |
| `KatoEulerSystems.json` | `independent-review-REV-KatoEulerSystems~2` | accepted |

Fresh execution of that actual function gives:

| Job passed to the function | Result |
| --- | --- |
| Unchanged local queue job | `False` |
| Unchanged live-main queue job | `False` |
| Either job with only its outputs replaced in memory by the three published paths | `True` |

Thus missing files are not the cause, and rewriting HE.0's accepted verdict
cannot finish the queued assignment. The earlier checkpoint described eleven
packets and 23 outputs; those counts and its list of extra packets are no
longer current. The table above supersedes them.

## Issued mathematical review and fresh validation

The HE.0 record retains acceptance of findings **/2, /8, /9 and /10**:

| Finding | Preserved issued-review outcome |
| --- | --- |
| /2: level raising | Exact-level Ribet/Diamond–Taylor raising is an explicit supplier request; rational Jacquet–Langlands and integral transports have distinct contracts. |
| /8: Zhang's prerequisites | The rank-zero, period and transfer inputs have exact supplier contracts; the proposed HE.6z split separates the Zhang branch from clean descent. |
| /9: open-image ownership | HE.7 keeps the Heegner application and imports general image theory from its designated Part II owner. |
| /10: Howard systems | ES.5 owns self-dual hypotheses/DVR descent; ES.8 owns the Λ-adic result. The primitivity equality uses the Howard-system supplier, with its extra hypotheses explicit. |

These are historical review outcomes, not fresh source verdicts by this
session. The full mathematical arguments, locators, source receipts and Lean
checks remain in the
[report at commit 508e89592](https://github.com/CBirkbeck/tauceti-explorer/blob/508e89592/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md)
and in the packet's attributed verification fields and review history.
The fixes themselves are in
[PR #6753](https://github.com/CBirkbeck/tauceti-explorer/pull/6753).

I read the confirmed findings, verifier decisions and round-two fix report,
then ran the packet checker on the unchanged HE.0 packet. It reports **zero
errors and zero warnings**: 78 nodes, 24 API items, eighteen tests, thirteen
baseline declarations, 21 gaps, 63 requests and eight planned stages.
This is structural validation, not proof closure or a new source audit.
No mathematical statement, signature or review marker changes in this run.
Primary sources were not reread, and Lean was not rerun for these Markdown
changes. Earlier compilation receipts retain their original attribution.

## Required reconciliation before redispatch

[WORKERS.md](../WORKERS.md), “Doing the work”, requires edits to issue-named
files and scratch only. I also evaluated `intake.file_problems` for both
possible automation repair paths. It returns “file outside swarm output
paths” for `research/blueprint/queue.json` and
`research/blueprint/make_queue.py`. This is an existing scope restriction,
not an automatic approval-review rejection.

The maintainer must choose and publish one consistent assignment:

1. Restore this issued review's three outputs and its fix's four outputs,
   then preserve already-issued round scopes in the generator. The historical
   arrays are recorded at commit `88f9bcd44`; the extra work needs a distinct
   subsequent round with matching issue instructions.
2. Explicitly authorize and publish the expanded review scope, identifying
   which fixes were made in the nine additional packets and assigning their
   independent checks. Existing accepted reviews, and the Euler-system
   packet's `needs_changes`, are not this job's fix-review verdicts.

The old proposed generator change replaced the conditional assignment to
`made` in `fix_rounds` by `made = previous_jobs.get(following)`. It still needs
maintainer review of wider scheduling effects. Applying that guard alone
would preserve the already-expanded arrays, so it cannot repair the current
scope. The earlier report contains the historical patch and regression
experiments; its old line numbers, packet lists and replay counts must not be
assumed current.

A scope question was sent during this run; no answer authorizing expanded
work has arrived. The queue, generator and other packets remain unchanged.
Resume only after reconciling the issued scope with the completion rule.

## Reproducing the completion mismatch without writes

Run this Python from the repository root. It imports the actual completion
function and changes only an in-memory copy of the queue entry:

```python
import copy
import importlib.util
import json
from pathlib import Path

root = Path.cwd()
spec = importlib.util.spec_from_file_location(
    "issues", root / "research/blueprint/issues.py")
issues = importlib.util.module_from_spec(spec)
spec.loader.exec_module(issues)
job = next(j for j in json.loads(
    (root / "research/blueprint/queue.json").read_text())["jobs"]
    if j["id"] == "REV-FIX-RT-AREA-iwasawa-1~2")
issued = copy.deepcopy(job)
issued["outputs"] = [
    "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md",
    "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
]
print(len(job["outputs"]))                     # 21 at this checkpoint
print(issues.deliverables_complete(job, root))  # False
print(issues.deliverables_complete(issued, root))  # True
```
