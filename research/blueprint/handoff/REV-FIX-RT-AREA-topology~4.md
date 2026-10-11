# REV-FIX-RT-AREA-topology~4: scope-blocked checkpoint

Refs #6521. Codex (GPT-6), session `codex-r5QH15`, 11 October 2026,
branch `codex-r5QH15-review-topology-6521`. Bot-confirmed claim comment
6107797977. Input commit `1c06f95484a07926ea860dbcec1344dc75b9c275`.
No manager-priority issue was available. This was the only job claimed; the
session authored neither the plans nor the fix under review.

The [report](../reviews/REV-FIX-RT-AREA-topology~4.md) records independent
verdicts and reasons for all 27 assigned findings, actual source locators,
current/pinned library ownership and numerical convention checks. It preserves
the predecessor report in a clearly attributed historical section. Each of
the three issue-named packets records this session's bounded review; its whole
previous review is appended once to reviewHistory. Mathematical fields are
unchanged. Polylogarithms /7 and Habiro /11 are accepted. QSeries /13 remains
needs_changes for the reader multiplier mismatch, retaining the separately
attributed full-plan objections from codex-jnfi6H (#6469).

All five packets pass the pinned-index blueprint checker with zero errors and
warnings. Serial lean-check calls on all five suggested files exit 0, with only
sorry warnings: P 462, HB 441, QSeries 1491, P.2 52, QT 65. Suggested files are
unchanged. These establish signatures, not proofs. Intake check-files accepts
all five changed paths; git diff --check is clean. Structural checks confirm
all 27 finding dispositions, whole predecessor-report preservation and metadata-only
packet changes. No compiler is left running.

## Exact blocker and remaining changes

The live issue names three packets and three suggested files. Its queue job
requires five of each plus the report. Every output exists, but the actual
unchanged issues.deliverables_complete result is false because the P.2 and QT
packets still identify their full-plan review jobs.

[WORKERS.md](../WORKERS.md) requires “Edit only the files the issue names,
plus your own scratch space.” Authorization was requested for the four omitted
paths. No answer has arrived. Those canonical packets/suggested files, queue
and completion code are unchanged. This is a checkpoint because completion
requires edits beyond that binding scope, not because a negative verdict is
incomplete.

The proposed packet objects have been independently prepared and validated
without writing the canonical files. Read-only canonical-path substitution
passes the full checker, including the actual pinned declaration index, and
changes the unchanged completion predicate from false to true. The one added
prerequisite has no reverse path in the blueprint node graph.

Obtain scope authorization, or have the maintainer reconcile the live issue
with the queue, before another worker repeats the source review. Then:

1. For `research/blueprint/packets/Polylogarithms--P.2.json`, preserve the entire
   current review, including all 14 checked entries, in reviewHistory. Record
   a bounded /7 fix review naming independent-review-REV-FIX-RT-AREA-topology~4,
   the actual new session/date and status accepted. Check only the formula
   ownership and GT 7/8 inputs; retain all 14 nodes, two gaps and three requests,
   especially ideal regions, signed integration and regulator calibration.
2. For `research/blueprint/packets/ArithmeticQuantumTopology.json`, preserve
   the whole accepted 106-node full-plan audit by codex-qw7qpA,
   independent-review-REV-ArithmeticQuantumTopology~2. It is an accepted audit,
   not a negative one. Add Polylogarithms:P.2/hyperbolic-volume to the direct
   prerequisites of ArithmeticQuantumTopology:QT.5/volume-and-chern-simons,
   whose statement already uses that supplier. Record the bounded review of
   /1–/16 with the same fix-review marker and actual session/date. The drafted
   verdict is needs_changes for the outstanding geometric-carrier, manifold,
   preferred extended-lift and period comparisons retained in G4/G5. Explain
   the specific remaining consumer work rather than claiming a fresh whole-plan
   audit. Preserve all 106 nodes, eight gaps, nineteen requests and earlier
   review evidence. HB membership is not topological identification; scalar
   QM.5 examples are not knot modularity.
3. The corresponding two suggested files are also absent from the live issue.
   They already elaborate; edit them only if a signature correction is needed
   after the scoped review. Neither scope authorization nor a review stamp
   establishes the missing geometric or analytic proofs.

No scratch file is needed to perform these changes. Preserve the existing
mixed JSON formatting and all mathematical fields except that one prerequisite.
Run the checker on all five canonical packets and the actual predicate:

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

Never remove outputs or modify completion code to bypass this discrepancy.

## Separate reader and upstream follow-ups

The QSeries reader QM.5/kontsevich-quantum-modular, lines 9069/9071 at this
input commit, must state the lower-boundary epsilon: inverse eta except for
an extra minus sign at c=0,d<0. At -I, epsilon=-i and the boundary factor=i,
so the action is identity. The packet and suggested file already agree.
The Habiro reader identification-theorem still gives Theorem 3 p.13 instead
of the fixed-v2 p.14. These reader paths also require scope authorization.

Current AT Suggested.lean:341 already defines relative homotopy groups for
arbitrary based pairs; NDR belongs in comparison theorems. Its README stage
8.1 still restricts the definition. Current DG owns manifold forms, d,
orientation, Stokes, abstract corner boundaries and the scoped homogeneity
result. Current Tau Ceti owns the upper-half-space metric, Riemannian measure
and Markov/Jones trace (unknot value delta). Import these owners rather than
planning duplicates. Stronger supported isotopy/collar/gluing and ideal-region
interfaces remain explicit requests. Upstream discrepancies are maintainer
notes; do not edit upstream or generated atlas extracts here.

Read-only roadmap HEAD was c251d2e42c66f14c279d1e5c2708c5a91d8c8aec;
current Tau Ceti was a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. No Lake
command ran in either read-only tree. Baseline pins remain Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.
