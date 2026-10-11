# REV-FIX-RT-AREA-topology~4: scope-blocked checkpoint

Refs #6521. Codex (GPT-6), session `codex-yMAXQs`, 11 October 2026,
branch `codex-yMAXQs-review-topology-6521`. Bot-confirmed claim comment
6105773577. No issue in the manager's priority list was available; this
eligible focus review was selected in the permitted fallback order. This
session authored none of the original plans/fixes and claimed only this job.

## Work completed

The [review report](../reviews/REV-FIX-RT-AREA-topology~4.md) gives dispositions
for all 27 assigned findings. Fresh public-source reads, pinned declaration
statements, current read-only upstream owners, supplier contracts, relevant
APIs/tests and suggested signatures were checked. The three live-issue
packet reviews now record this session, preserving each entire predecessor
review in `reviewHistory`:

- Polylogarithms: accepted for /7's sole ideal-tetrahedron owner and the
  explicit GeometricTopology inputs. Keep canonical region, signed geometry
  and regulator calibration obligations.
- HabiroNahmSeries: accepted for /11's six formal, analytic and arithmetic
  exports. Corrected one source locator: on `HB.8/identification-theorem`,
  GSWZ v2 Theorem 3, equation (38), is on printed p. 14, not p. 13. The
  rendered source page was checked.
- QSeriesPartitionsAndMockModularForms: needs_changes. /13's scalar owner
  split is sound, but its reader still omits the packet's negative-real-cut
  multiplier correction. Keep the full negative review by codex-jnfi6H,
  `REV-QSeriesPartitionsAndMockModularForms~2`, #6469, and its remaining
  proof/supplier obligations.

All five packets passed fresh blueprint checks with zero errors and warnings.
After the Habiro locator correction, its exact file passed again. Fresh
serial `lean-check` on the three listed suggested files exited 0, with
462/441/1491 admitted-declaration warnings and no other diagnostics. These
are elaborated signatures, not completed proofs. No suggested file changed.
Memory exceeded the required 20 GB, and no compiler remains running.
All prior reviews, gaps and requests are preserved; all mathematical statements,
hypotheses, proof outlines, prerequisites, APIs, tests and coverage in the
three listed packets are unchanged. Source provenance is in the report; no
scratch material is needed to resume.
The five edited files pass `intake.py check-files` with zero problems, and
`git diff --check` passes.

## Completion blocker

The actual queue job requires eleven outputs and five packet verdicts. The
live issue authorizes seven outputs and three packets. All eleven outputs
exist, but the two omitted packet reviews still name earlier jobs.
The actual, unchanged `issues.deliverables_complete` returns false. A read-only
in-memory check supplying just the two proposed packet objects returns true
with all eleven queue outputs retained; it wrote neither packet and changed
no completion code.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” The concrete two-packet changes were prepared
in scratch and authorization requested; no answer arrived. Neither omitted
packet, the queue, the issue scope nor the completion predicate was edited.
A negative mathematical verdict is allowed to finish a review. The file scope
is the blocker.

Resolve the two-path authorization or correct the live issue's file list
before another worker repeats the same three-packet review. The source and
Lean work is already recorded here and in the report.

## Two exact changes that finish the review

Once authorized, make these bounded edits, retaining each complete current
review object unchanged in `reviewHistory` before replacing it:

1. `research/blueprint/packets/Polylogarithms--P.2.json`: record status
   `accepted`, reviewer `independent-review-REV-FIX-RT-AREA-topology~4`,
   actual date and session. Accept only /7's owner/input fix. Preserve all
   14 nodes, two gaps and three requests. In particular the canonical
   ideal-region, signed-sector integral and map-level Borel scalar remain
   proof obligations. Import the current metric/measure; do not introduce
   an arbitrary carrier with an assumed volume field.
2. `research/blueprint/packets/ArithmeticQuantumTopology.json`: append
   `Polylogarithms:P.2/hyperbolic-volume` to the prerequisites of
   `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`, where it is
   currently missing. Record status `needs_changes`, this review's reviewer
   ID, actual date and session. Keep all 106 nodes, eight gaps and nineteen
   requests. G4/G5 must still require the ordered geometric carrier,
   orientation, incidence/manifold comparison and genuine extended lift.
   For the same tuple, `rQ=1/rP`; `(0,1,-i,2)` gives `(1+i)/4` and `2-2i`.
   A first-two-vertex swap already reverses signed volume; an additional
   minus requires a documented comparison. Neumann v2 Theorem 2.6 and §3,
   pp. 420-421, fixes the `i Vol - CS` extended regulator convention.
   Ordinary Bloch/Suslin descent supplies no preferred extended lift.

Validate both packets and the preservation of their prior reviews/gaps/requests.
No extra Lean signature or proof edit is necessary for these bounded verdicts.
Run the actual predicate, retaining all queue outputs:

```python
import importlib.util
import json
from pathlib import Path

spec = importlib.util.spec_from_file_location(
    "blueprint_issues", "research/blueprint/issues.py")
issues = importlib.util.module_from_spec(spec)
spec.loader.exec_module(issues)
queue = json.loads(Path("research/blueprint/queue.json").read_text())
job = next(j for j in queue["jobs"]
           if j["id"] == "REV-FIX-RT-AREA-topology~4")
assert issues.deliverables_complete(job)
```

## Separate follow-up qualifications

The QSeries reader's `QM.5/kontsevich-quantum-modular` theorem and ambient
hypotheses (lines 9069/9071 in this base) need the packet's full cut correction.
At `-I`, the corrected multiplier is `-i`, the lower-boundary weight factor is
`i`, and the product is 1. Naive inverse eta gives -1. Its reader path is not
in this issue's editable list. The Habiro reader's identification-theorem
source locator should also be synchronized to the corrected printed p. 14 on
an authorized reader path. Neither reader was changed here.

Current upstream imports must not be planned anew: Markov/Jones trace,
upper-half-space metric and Riemannian volume are library suppliers. Current
DG owns forms/d, abstract corner boundaries, boundaryless finite-dimensional
homogeneity and Stokes. Their exact contracts and commits are in the report.
Knot presentation invariance, analytic all-orders asymptotics, arithmetic
membership and the scalar weak predicate retain separate hypotheses.

Submit with Refs #6521 and the agent/check information after checking the
actual allowed paths; stop after this one job. This checkpoint leaves the
scope discrepancy explicit rather than claiming the queue is complete.
