# REV-FIX-RT-AREA-topology~4: scope-blocked checkpoint

Refs #6521. Codex (GPT-6), session `codex-kCCEnu`, 11 October 2026,
branch `codex-kCCEnu-review-topology-6521`. The bot confirmed
claim comment 6107135532 for this session. No manager-priority issue was available; this eligible focus
review was the only claim. This session did not author the reviewed plans/fix.

The [report](../reviews/REV-FIX-RT-AREA-topology~4.md) independently assesses
all 27 assigned findings. Three live-scope packet reviews were updated,
preserving their predecessors whole in reviewHistory and all mathematical
payloads. P /7 and HB /11 corrections are accepted within the fix's scope;
QSeries remains needs_changes, including the full earlier negative audit.
No suggested file was modified. Five packet checks returned zero errors and
warnings. Three serial lean-check runs exited 0, with 462/441/1491 `sorry`
warnings and no other diagnostics. These are signature checks, not proofs.
Source URLs, locators and hashes are in the report; no source text is committed.

The preserved upstream qualification for finding /23 remains: current
AlgebraicTopology Suggested.lean:341 already defines group-valued relative
homotopy for arbitrary based pairs, with NDR hypotheses on the comparison
theorems at 404/418. README stage 8.1 still restricts the groups to NDR pairs.
The maintainer should reconcile those documents; do not replan either owner.
Current DG owns forms, Stokes, boundary faces and homogeneity; current Tau Ceti
already supplies the hyperbolic metric, Riemannian measure and Jones/Markov
trace, with the normalization limitations documented in the report.

## Resolve scope before repeating this audit

The live issue names three packets and three suggested files; the queue
requires five of each plus the report. All eleven exist. The actual unchanged
completion predicate is false because P.2 and QT still use their full-plan
reviewer IDs. A read-only check replacing only the two prepared review objects
and the one missing QT prerequisite returns true.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” Concrete edits for the two omitted packet paths
were prepared and user scope authorization requested. No answer arrived before
checkpoint submission. Those packets, readers, queue and predicate remain
unchanged. Negative review verdicts can finish this job; the output-scope
mismatch is its blocker.

Obtain authorization for these two paths, or have the maintainer correct the
live issue's deliverable list, then perform exactly this bounded work:

1. `research/blueprint/packets/Polylogarithms--P.2.json`: append the entire
   preceding review to reviewHistory. Set review.status accepted, reviewer
   independent-review-REV-FIX-RT-AREA-topology~4, actual date and session.
   Notes accept /7's sole formula owner and GT geometry imports only. Preserve
   all 14 nodes, two gaps, three requests, canonical-region/signed-integration
   and regulator-calibration obligations.
2. `research/blueprint/packets/ArithmeticQuantumTopology.json`: append the
   entire preceding review to reviewHistory. Add
   `Polylogarithms:P.2/hyperbolic-volume` to the prerequisites of
   `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, which already uses
   the formula in its statement. Set review.status needs_changes and the same
   reviewer, actual date/session. Preserve the prior full audit by codex-qw7qpA,
   REV-ArithmeticQuantumTopology~2, all 106 nodes/eight gaps/nineteen requests,
   especially G4/G5's geometric carrier, orientation/incidence/manifold
   comparisons and preferred extended lift. This is a bounded fix review.

Rerun blueprint checks and the actual predicate against all eleven outputs;
do not remove outputs or edit completion code:

```python
import importlib.util
import json
from pathlib import Path
spec = importlib.util.spec_from_file_location("issues", "research/blueprint/issues.py")
issues = importlib.util.module_from_spec(spec)
spec.loader.exec_module(issues)
job = next(j for j in json.loads(Path("research/blueprint/queue.json").read_text())["jobs"]
           if j["id"] == "REV-FIX-RT-AREA-topology~4")
assert len(job["outputs"]) == 11
assert issues.deliverables_complete(job)
```

No scratch artifact is required to resume. Packet formats differ: P uses one
space/unescaped Unicode; QSeries uses two spaces/escaped Unicode. Preserve
formatting to keep the changes reviewable.

## Separate reader follow-ups

QSeries reader QM.5/kontsevich-quantum-modular (lines 9069/9071 in this base)
omits the negative-real-cut multiplier correction at c=0,d<0. Its packet and
Lean have the correction; the reader must agree before this bounded finding
is accepted. Retain the larger codex-jnfi6H full-plan objections independently.
HB reader identification-theorem still says Theorem 3 p.13 rather than p.14.
Both reader paths are outside the current live issue's scope.

The prepared two-packet objects also passed the full blueprint checker in a
read-only canonical-path substitution, with the declaration index, zero
errors/warnings. The five submitted paths pass intake check-files;
git diff --check is clean. No link/restructure map changed or requires checking.
