# REV-FIX-RT-AREA-topology~4: reconcile scope before another worker run

Refs #6521. Codex, `codex-sP1hgJ`, 18 October 2026;
branch `codex-sP1hgJ-review-topology-fixes`, input
`663b4462fd0c660392965ef07632adc8164990de`.
Bot [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6256187863).
This session authored neither the fixes nor the plans and claimed no second job.

The [report](../reviews/REV-FIX-RT-AREA-topology~4.md) contains all 27 finding
verdicts, public-source URLs/locators and fresh validation of all seven packet
and suggested-file pairs. The three issue-listed review objects are updated,
with each complete predecessor review appended once to history. Every
mathematical payload and every suggested file is unchanged. P /7 and HB /11
are accepted within the bounded ownership/export review; QSeries /13 remains
needs_changes for the inconsistent reader multiplier. Earlier whole-plan
reviews and gaps remain in force.

## Blocking scope discrepancy

The live issue, re-read after claim confirmation, names three packets and
three suggested files plus the report. `queue.json` requires **seven packets,
seven suggested files and the report, 15 outputs**. The actual unchanged
`issues.deliverables_complete` returns false because four packets still name
their separate whole-plan reviewers. A needs_changes verdict is allowed and
does not cause this blocker.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names, plus your own scratch space.” Requested authorization to include the
eight omitted queue paths and two readers below; no answer arrived. The
maintainer must update the live issue or expressly authorize those edits.
Do not repeat a metadata-only checkpoint before resolving this. Do not
remove queue outputs, alter the predicate or change labels to force completion.

All omitted paths below are relative to `research/blueprint/`:

| Packet | Suggested file |
|---|---|
| packets/Polylogarithms--P.2.json | suggested/Polylogarithms--P.2.lean |
| packets/ArithmeticQuantumTopology.json | suggested/ArithmeticQuantumTopology.lean |
| packets/HabiroNahmSeries--HB.4.json | suggested/HabiroNahmSeries--HB.4.lean |
| packets/HabiroNahmSeries--HB.10.json | suggested/HabiroNahmSeries--HB.10.lean |

Reader paths: `readmes/QSeriesPartitionsAndMockModularForms.md` and
`readmes/HabiroNahmSeries.md`. No temporary proposal or downloaded source is
needed to reconstruct the remaining work.

## Exact work after authorization

1. Add `Polylogarithms:P.2/hyperbolic-volume` to the direct prerequisites of
   `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`. Its statement
   already imports that formula. Check for a reverse path before adding the
   edge. Retain the separate manifold-volume, extended-lift and period/sign
   comparisons and the G4/G5 gaps.
2. In the QSeries reader's `QM.5/kontsevich-quantum-modular` statement and
   ambient hypotheses, replace the global inverse-eta assertion by inverse
   eta for `c != 0` or `d > 0`, and **minus** inverse eta for `c=0,d<0`.
   Add the negative control: `j_(3/2)(-I,x)=i`, corrected epsilon is `-i`,
   so the slash factor is 1; the naive inverse produces -1. The packet and
   Lean already carry this convention. Reassess the bounded /13 verdict after
   synchronization; preserve codex-jnfi6H's separate whole-plan objections
   in REV-QSeriesPartitionsAndMockModularForms~2 (#6469).
3. In the HB reader's `HB.8/identification-theorem`, correct GSWZ v2 Theorem
   3's introduction locator from p.13 to **printed p.14, equation (38)**.
   Keep Theorem 8 pp.35–36, the coefficient ring `Q[zeta]((x))[[t]]` and
   the coprime auxiliary-order restriction inherited from equation (126).
4. Record bounded fix-review objects in all four omitted packets, reviewer
   `independent-review-REV-FIX-RT-AREA-topology~4`, actual new date/session.
   Append each entire prior review, including its checked array, once to
   `reviewHistory`. Do not replace a whole-plan audit with an alleged new one:

   | Packet | Bounded disposition and qualifications to preserve |
   |---|---|
   | Polylogarithms--P.2 | Accept /7. Preserve its accepted 14-node audit, 2 gaps/3 requests. The analytic Milnor target does not construct ideal regions, signed integration or regulator calibration. |
   | ArithmeticQuantumTopology | Needs_changes /1–/16 until its geometric/comparison obligations are addressed. Preserve the **accepted** 106-node whole-plan audit by codex-qw7qpA (REV-ArithmeticQuantumTopology~2), 8 gaps/19 requests. Add only the concrete premise above unless a further correction is established. |
   | HabiroNahmSeries--HB.4 | Accept qualified /11 export. Preserve its accepted 13-node audit, 3 gaps/1 request. Retain positive definiteness, odd coprime orders, strong cancellation-safe remainder, branch choices, coefficientwise Kummer and rational-data normalization gaps. |
   | HabiroNahmSeries--HB.10 | Accept qualified /11 export. Preserve its accepted 14-node audit, 5 gaps/3 requests. Keep finite étale scalar change, specified K3 lift, tame-kernel primes, restricted orders, HB.9 local-section/arbitrary-rank gluing inputs, global-line/completion and cohomology comparison gaps. |

The parent HB export also explicitly retains HB.8 refined-Gaussian prefactor
and uniform-t-regularity gaps, HB.9 Kummer/gluing obligations and HB.4
coefficientwise descent. Do not erase these because the signatures compile.
Suggested-file signature edits are needed only if a mathematical correction
requires them; none was established by this session.

## Fresh validation and current owners

All seven canonical packets pass `scripts/check_blueprint.py`: zero errors
and warnings with the declaration index. Nodes/gaps/requests remain
P 75/19/21; HB 109/22/9; QSeries 537/24/27; P.2 14/2/3;
QT 106/8/19; HB.4 13/3/1; HB.10 14/5/3.
All seven suggested files elaborate serially through `lean-check`, exit 0,
with only sorry warnings: respectively 462, 441, 1491, 52, 65, 31 and 28.
Memory was checked before each invocation. No compiler is left running.
The exact Mathlib pin was verified in the shared build. Every file imports
only Mathlib; elaboration makes no new Tau Ceti baseline claim.

After the authorized edits, run the packet/file checks and the actual predicate:

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

Current roadmap HEAD `0d144d044dacebca17b654695b6f1ad58f159b27`;
current Tau Ceti HEAD `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Audit pins stay Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Read current owners before planning anything further: DG forms/orientation,
Stokes and abstract boundary already exist as plans; DG 3.3 homogeneity is
scoped to connected finite-dimensional boundaryless manifolds; AT already
states relative homotopy for arbitrary based pairs; GT 7 consumes the shared
connection and existing Riemannian measure. Stronger isotopy/collar/gluing
and ideal-region contracts remain requests. Never run Lake in the read-only
trees or edit upstream/generated atlas outputs in this job.
