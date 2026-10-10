# Handoff: REV-FIX-RT-AREA-iwasawa-2~2

Codex (GPT-6), session `codex-ZyjVh0`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6102646778).

## What is done

The independent bounded review of all six correction contracts is finished.
The [report](../reviews/REV-FIX-RT-AREA-iwasawa-2~2.md) records fresh primary-source,
pinned-library and current-upstream checks, exact theorem/page locators and
limits of the work. It links the immutable predecessor report, which retains
the older exhaustive audit chain. L3 is accepted for finding /1; PMIA remains
needs_changes for finding /4 because five generic plans duplicate current
native Fitting/stable-transpose results. The negative verdict finishes that
part of the review; a coordinated revision, rather than relabelling a few
nodes, must reconcile the reader and consumers.

Installed new top review records in L3 and PMIA, archiving their complete
predecessors and preserving all earlier histories. Their mathematical/planning
fields and all suggested files are unchanged. L3-2 and D.1 have accepted bounded
records prepared below, but their files are byte-identical to the input commit
`4bc4efffc97159555853652339d435d83c19167c`.

All four prepared packets pass check_blueprint.py: zero errors, 26 inherited
short-API warnings for L3 and none for the other three. Sequential lean-check:
L3 exits 1 at import-prefix resolution, before body elaboration; L3-2, D.1
and PMIA exit 0 with 111, 307 and 1075 sorry warnings only. No Lean process
remains running. Do not substitute weaker assumptions for L3's owned sibling
interfaces merely to bypass missing compiled prototype artifacts.

Fresh finite controls passed 2460 admissible Morita congruences and 61
Ferrero–Greenberg parameter cases, including 19955 unit congruences and
101442 strict filtration comparisons. These are diagnostics, not proofs.
All ten fetched public source hashes match the predecessor report. No book
was used and no source passage was committed.

## The sole completion blocker

The queue requires four packet verdicts, including these two paths:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

The live issue's file list omits them. WORKERS.md restricts edits to named
issue files, so explicit authorization was requested after preparing the
concrete records and validating them. No reply has authorized installation.
Actual issues.deliverables_complete is False; read-only substitution of both
records below at their actual paths makes it True. The queue, predicate and
labels were not edited.

Do not spend another run repeating this bounded source review. Resume when
the live scope is repaired or the maintainer explicitly authorizes the two
review-only edits. No extra Lean edit is requested. Preserve the full existing
79-node and 72-node audits by appending each entire current top review to
reviewHistory before installing the corresponding record below. All older
history entries, checked arrays, mathematical/planning fields, gaps and
requests must remain exactly unchanged.

## Remaining records

The records below were prepared and validated by codex-ZyjVh0. They accept the
corrections, not closure of the explicitly open supplier obligations.

### DirichletPadicLFunctions--L3-2

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Codex session codex-ZyjVh0. Follows independent-review-REV-DirichletPadicLFunctions--L3-2 and the attributed predecessor audits. Bounded finding /2 review following the full 79-node audit archived with its original reviewer. Zhao §1.2 p.461, §4 equations (4.1)–(4.6)/Theorem 4.1 pp.471–473 and Appendices A–B pp.473–474 checked freshly. Primitive odd tame character, compatible embeddings, common logarithm, even chi*omega branch and dyadic omega conductor four are explicit. The derivative uses direct character weights and the correction (1-chi(p))*B1chi*log_p(N); simplification requires chi(p)=1, while nonvanishing is separate. The positive-residue permutation and strict filtration are consistent with the retained E37 endpoint repair. Differentiation retains coefficient convergence and a uniform majorant. Five gaps and eight requests remain explicit. Every previous review and checked array is preserved in reviewHistory; mathematical/planning fields are unchanged. See the independent review report for validation and scope."
}
```

### PadicHodgeRegulators--D.1

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Codex session codex-ZyjVh0. Follows independent-review-REV-PadicHodgeRegulators--D.1~2 and the attributed predecessor audits. Bounded finding /3 review following the full 72-node audit archived with its original reviewer. Ertl–Niziol v2 §§2.1–2.2 pp.4–8/Theorem 2.2 p.7, Colmez–Niziol v4 Corollary 3.16 p.37/Theorem 5.4 p.54 and Nekovar–Niziol v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54 checked freshly. Distinct U and D complexes, lifted Frobenius-divisible ideal, directed omega/tau legs, product behavior and factorial modified twist are retained. Exact divided comparison stops at r<=p-2; undivided comparison remains bounded with the stated root-of-unity dependence. Rational exponential is an isomorphism below i=r and injective at i=r; its inverse transport, p^-r quotient scaling and Bloch–Kato sign do not assert an integral inverse. Proposed CS.0–CS.3 producers, nine gaps and twenty requests remain explicit. Every previous review and checked array is preserved in reviewHistory; mathematical/planning fields are unchanged. See the independent review report for validation and scope."
}
```

## Installation verification after authorization

For each extra packet, compare parsed JSON before and after while excluding
only review and reviewHistory. Require exact equality of every remaining
field; require new history == old history + [old review]. This keeps each
former full audit intact and attributed, rather than splicing its checked array
into a new bounded review. Apply the same assertions to L3 and PMIA relative
to the input commit. Recursively reject new excerpt fields.

Run the packet checker for all four packets, git diff --check and the intake
path screen. Then run the unchanged completion predicate:

```python
import importlib.util
import json
from pathlib import Path

spec = importlib.util.spec_from_file_location("blueprint_issues", "research/blueprint/issues.py")
issues = importlib.util.module_from_spec(spec)
spec.loader.exec_module(issues)
queue = json.loads(Path("research/blueprint/queue.json").read_text())
job = next(j for j in queue["jobs"] if j["id"] == "REV-FIX-RT-AREA-iwasawa-2~2")
assert issues.deliverables_complete(job)
```

Update the report and this handoff to record the authorization and completed
receipt installation. A finished review may retain PMIA's needs_changes status;
accepting an outstanding duplicate plan merely to make every verdict positive
would be wrong. Open the one-job PR with Refs #6219, the agent/session and
accurate checker and Lean results. Never change the completion rule to bypass
the scope mismatch.
