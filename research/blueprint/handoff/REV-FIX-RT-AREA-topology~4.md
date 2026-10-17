# REV-FIX-RT-AREA-topology~4: scope reconciliation required

Refs #6521. Codex (GPT-6), `codex-BsNNY8`, 17 October 2026;
branch `codex-BsNNY8-review-topology-fixes`, input `37d735d33`.
Bot confirmation: [comment 6241633348](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6241633348),
for claim comment 6241630447. This session authored neither the reviewed
plans nor FIX~4 and claimed no second job.

The [report](../reviews/REV-FIX-RT-AREA-topology~4.md) gives all 27 assigned
verdicts, focused source checks and the complete predecessor report. The
three live-issue packets record the new bounded review/date and preserve
their entire previous reviews in `reviewHistory`. Mathematical fields are
unchanged. P /7 and HB /11 are accepted; QSeries /13 is needs_changes for the
reader multiplier mismatch. These are not new whole-plan audits. Preserve
codex-jnfi6H's separate QSeries objections (#6469).

## Resolve this before repeating the review

The live issue names three packets and three suggested files. The current
queue requires **seven packets and seven suggested files plus the report,
15 outputs**. The previous handoff's five-packet/11-output count is stale.
The unchanged `issues.deliverables_complete` returns false because **four**
packets retain their separate whole-plan review-job IDs. A negative verdict
is allowed by the completion predicate; it is not the blocker.

[WORKERS.md](../WORKERS.md), Doing the work, says “Edit only the files the
issue names, plus your own scratch space.” Authorization was requested for
the eight omitted queue paths below and the two reader paths. No response
arrived. Do not change their canonical files until the maintainer reconciles
the live issue scope with the queue or expressly authorizes the edits.
Never bypass the discrepancy by deleting outputs or changing completion code.

All eight omitted queue paths begin `research/blueprint/`:

| Packet | Corresponding suggested file |
|---|---|
| packets/Polylogarithms--P.2.json | suggested/Polylogarithms--P.2.lean |
| packets/ArithmeticQuantumTopology.json | suggested/ArithmeticQuantumTopology.lean |
| packets/HabiroNahmSeries--HB.4.json | suggested/HabiroNahmSeries--HB.4.lean |
| packets/HabiroNahmSeries--HB.10.json | suggested/HabiroNahmSeries--HB.10.lean |

The additional reader paths are
`research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md` and
`research/blueprint/readmes/HabiroNahmSeries.md`.

## Exact work after authorization

For every packet edited below, append its **entire** existing review to
`reviewHistory` once, including its `checked` array. Use the actual new
reviewer session/date and marker
`independent-review-REV-FIX-RT-AREA-topology~4`. Describe the bounded fix
scope explicitly; do not claim a new complete audit or erase earlier gaps.
Preserve mixed JSON formatting and all mathematical payload except the
single missing prerequisite identified below.

1. **Polylogarithms--P.2:** record the bounded /7 verdict accepted. Retain the
   complete 14-node accepted REV-Polylogarithms--P.2 audit, two gaps and three
   requests. P.2 owns the ordered tetrahedron formula; GT 7/8 supplies
   foundations, with ideal-region, integration and regulator calibration
   obligations still open. The analytic Milnor/angle-volume follow-up does
   not construct the geometric region.
2. **ArithmeticQuantumTopology:** add
   `Polylogarithms:P.2/hyperbolic-volume` to the direct prerequisites of
   `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`. Its statement
   already uses the formula. The blueprint-node graph has no reverse path
   for this edge. Record a bounded /1–/16 verdict, currently needs_changes
   for the G4/G5 geometric-carrier, manifold-volume, extended-lift and period
   comparisons. Preserve the **accepted** 106-node whole-plan audit by
   codex-qw7qpA (REV-ArithmeticQuantumTopology~2), all eight gaps and nineteen
   requests. It is not a negative audit. Formal HB membership and scalar
   QM.5 examples do not establish knot invariance or modularity.
3. **HabiroNahmSeries--HB.4:** record the bounded /11 export verdict,
   currently accepted with qualifications. Preserve the complete 13-node
   accepted REV-HabiroNahmSeries--HB.4 audit, three gaps and one request.
   Check radial-analytic-remainder-comparison against the parent corrected
   formula: rational positive-definite A, odd coprime orders, strong radial
   remainders and chosen branches remain. Keep the coefficientwise-Kummer
   identity and CGZ rational-data arithmetic normalization conditional.
4. **HabiroNahmSeries--HB.10:** record the bounded /11 export verdict,
   currently accepted with qualifications. Preserve the complete 14-node
   accepted REV-HabiroNahmSeries--HB.10 audit, five gaps and three requests.
   Check quartic-module-export, picard-and-regulator-export and
   higher-cohomology-export-obligation. Retain HB.9's local-section and
   arbitrary-rank gluing obligations, the HB.7 finite étale scalar-change
   interface, specified K3 lift, orders coprime to Delta, the unknown
   tame-kernel primes, and separate global-line/completion inputs. Restricted
   membership is not global generation or geometric cohomology.
5. **QSeries reader:** at QM.5/kontsevich-quantum-modular (input lines
   9069/9071), replace the assertion that epsilon is always inverse eta.
   State epsilon(gamma)=v_eta(gamma)^(-1) for c≠0 or d>0, and its negative
   for c=0,d<0. Update the ambient hypotheses consistently. Add the
   discriminating check: at -I, the lower-boundary factor is i and
   epsilon=-i, so the slash action is identity. The naive inverse gives -1.
   The packet and suggested statement already have this formula. Reassess
   the bounded /13 verdict after synchronization without discarding the
   separate full-plan objections.
6. **Habiro reader:** in HB.8/identification-theorem, correct the introduction
   locator for GSWZ v2 Theorem 3 from p.13 to **printed p.14**, equation (38),
   matching the packet. Keep the refined Theorem 8 locator pp.35–36, its
   coprime auxiliary order and the ring Q[zeta]((x))[[t]].
7. **Suggested files:** inspect the four added paths and compile serially
   through lean-check with the memory check. Change a signature only if a
   correction is necessary. No suggested signature change was established
   by this session. Never stamp away a geometric/analytic proof gap because
   a file elaborates.

Read-only canonical-path substitution of exactly those four proposed packet
objects passed the checker **with its declaration index** and changed the
unchanged completion predicate from false to true. Restoring either HB.4
or HB.10 independently made it false again. No scratch artifact is needed
to reconstruct the work above. Do not copy a proposal's old session/date.

## Validation already done

All **seven** canonical packets pass `scripts/check_blueprint.py`: zero
errors and warnings. Nodes/gaps/requests remain P 75/19/21, HB 109/22/9,
QSeries 537/24/27, P.2 14/2/3, QT 106/8/19, HB.4 13/3/1 and HB.10 14/5/3.
Serial lean-check runs on the **three live-issue** suggested files exit 0
with only sorry warnings: P 462, HB 441, QSeries 1491. The four omitted
suggested files were not compiled in this session. No compiler is running.
The three edited packets retain every mathematical field and predecessor
review, and contain no excerpt keys. Intake check-files and git diff checks
are recorded in the PR.

After the remaining authorized edits, validate all seven packets and run the
actual predicate, not a stale five-packet substitute:

```python
import importlib.util
import json
from pathlib import Path
spec = importlib.util.spec_from_file_location("issues", "research/blueprint/issues.py")
issues = importlib.util.module_from_spec(spec)
spec.loader.exec_module(issues)
job = next(j for j in json.loads(Path("research/blueprint/queue.json").read_text())["jobs"]
           if j["id"] == "REV-FIX-RT-AREA-topology~4")
assert len(job["outputs"]) == 15
assert issues.deliverables_complete(job)
```

## Existing owners and source access

The report links the public sources and exact printed locators. No source
passage or downloaded source is committed. Current read-only roadmap HEAD
was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti HEAD was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Baseline pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No Lake command ran in the
read-only trees.

Import current DG's forms/d/orientation/Stokes/abstract-boundary and scoped
homogeneity owners. Current AT Suggested.lean:341 already defines relative
homotopy for arbitrary based pairs; its README 8.1 still needs reconciliation.
GT 7 consumes the shared Hopf–Rinow connection and existing Riemannian
measure. Stronger isotopy/collar/gluing and ideal-region contracts remain
requests. Upstream discrepancies are maintainer notes, not edits to upstream
or generated atlas extracts in this job.
