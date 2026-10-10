# REV-FIX-RT-AREA-langlands-2~3 handoff

## Current blocker, 10 October 2026 — codex-98Bf6X

Issue #5871; bot-confirmed claim
[6097922103](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6097922103).
Base `fb99cf051cb90cec265ac63529c9541642546aee`. All seven authorized files
matched merged [PR #7816](https://github.com/CBirkbeck/tauceti-explorer/pull/7816),
commit `050d2f7375134cb0ca18afa7b73d4d8dfc4196b1`, byte for byte before this update.
There is no new mathematical change to review. Inherited verdicts and review
objects remain CSM accepted, Global accepted and GL2 needs_changes.

The intake blocker is still present. Read the completion function, intake
allowlist and historical-round generator. Parsed the live issue's seven
paths and reproduced completion **false** for the pending 27-output queue
entry and **true** with only its output list replaced in memory by those
seven paths. All 27 outputs exist; the ten extra packets name other review
jobs. The done parent fix still lists 40 outputs. Queue and generator edits
are outside the issue scope and fail the intake allowlist. No allowed edit
can settle those historical scopes by overwriting other jobs' reviews.
A needs_changes verdict is a completed review outcome and is not the blocker.

Fresh packet checks: zero errors and warnings for each packet (37, 73 and
67 nodes). All 177 nodes remain unchecked, no packet has an excerpt field,
and all forty confirmed findings have matching verification identifiers and
exactly one report disposition. Unchanged suggested files were not recompiled;
earlier Lean receipts remain historical evidence. No fresh primary-source,
pinned-declaration or graph audit is claimed. Only the report and handoff change.

**Resume after maintainer metadata repair.** The exact seven review outputs,
ten historical parent-fix outputs, generator path and read-only reproduction
below remain current. Reconcile those scopes, preserve them through queue
regeneration, then run normal intake/sync before scheduling another worker.
Another unchanged-input checkpoint cannot clear this excluded-files blocker.
The separate GL2 revision still needs the 53 API signatures and 46 tests
listed below. No scratch file is needed to resume.

## Blocked intake continuation, 8 October 2026 — codex-CiCHr3

Codex session `codex-CiCHr3` claimed issue #5871 after the bot confirmed
[comment 6070643940](https://github.com/CBirkbeck/tauceti-explorer/issues/5871#issuecomment-6070643940).
Base commit: `c1083c227a727701522fb930d7082b0fc1286de2`.

The independent review was completed and merged in [PR #7265](https://github.com/CBirkbeck/tauceti-explorer/pull/7265).
It has been released again after several intake checkpoints. This run
re-read the findings, confirmations and fix report, reviewed the subsequent
GL2 supplier changes, rechecked all pinned baseline records, and reproduced
the intake blocker. The three verdicts are retained, with current review
objects and their preceding objects preserved in `reviewHistory`.

Before this continuation, the CSM and Global packets and suggested files were
byte-for-byte identical to completed-review commit `0ca7bd10c`. GL2 had five
packet edits and an eleven-line comment from [PR #7714](https://github.com/CBirkbeck/tauceti-explorer/pull/7714).
The affected consumers now name the two fine R23.1 CHT supplier nodes, include
the proof page in the locator, and keep the deeper supplier requests open.
Checked the complete suppliers and consumers against fresh matching-hash
public CHT Lemmas 4.1.1–4.1.2, pp. 116–117, and KW II Definition 7.9/Lemma 7.10,
pp. 68–69. The finite-order/p-primary character refinement and prescribed
Galois completion contracts support these consumers. The broader R23.5 side
of /26 remains outside this review's scope.

The report gives one disposition for each of the forty findings, followed by
this continuation's evidence. Packet verdicts remain CSM **accepted**, Global
**accepted**, GL2 **needs_changes**. The latter is a completed review outcome;
its typed API/test revision belongs to a subsequent fix job. The historical
CHT handoff below is superseded: the two supplier nodes are now planned, while
their reciprocity/S-unit/ray-class interfaces remain open requests.

### Reproduced blocker

At this base, `issues.deliverables_complete` returns **false** for the committed
queue entry (27 outputs), and **true** when only its `outputs` list is replaced
in memory by the live issue's seven deliverables. The other job fields are unchanged.
Every output exists. The failure comes from ten extra packets whose reviews
correctly name other jobs; their ten suggested files are also outside this issue's scope.

| Extra packet | Its current review job |
| --- | --- |
| AutomorphicGaloisRepresentations | REV-AutomorphicGaloisRepresentations~2 |
| ClassicalSerreModularity--R26.1 | REV-ClassicalSerreModularity--R26.1~2 |
| GL2AutomorphicRepresentationsAndTransfer--R17.3 | REV-FIX-RT-AREA-automorphic-1~5 |
| GL2ModularityLifting--R32.3 | REV-GL2ModularityLifting--R32.3~2 |
| HilbertModularVarietiesAndShimuraCurves--R18.2 | REV-FIX-RT-AREA-automorphic-1~5 |
| LocalGaloisDeformationRings | REV-LocalGaloisDeformationRings~2 |
| ModularityAndLanglandsExtensions | REV-ModularityAndLanglandsExtensions |
| PotentialModularityAndCompatibleSystems--R23.1 | REV-PotentialModularityAndCompatibleSystems--R23.1~2 |
| PotentialModularityAndCompatibleSystems--R24.3 | REV-PotentialModularityAndCompatibleSystems--R24.3~2 |
| WeightsInEtaleCohomology | REV-WeightsInEtaleCohomology~2 |


### Exact maintainer action

Reconcile `REV-FIX-RT-AREA-langlands-2~3.outputs` in
`research/blueprint/queue.json` to this list, preserving its other fields:

- `research/blueprint/reviews/REV-FIX-RT-AREA-langlands-2~3.md`
- `research/blueprint/packets/ClassicalSerreModularity--R27.3.json`
- `research/blueprint/packets/GL2ModularityLifting--R22.1.json`
- `research/blueprint/packets/GlobalGaloisDeformations.json`
- `research/blueprint/suggested/ClassicalSerreModularity--R27.3.lean`
- `research/blueprint/suggested/GL2ModularityLifting--R22.1.lean`
- `research/blueprint/suggested/GlobalGaloisDeformations.lean`


Then let the normal intake/sync process record completion. No new mathematical
review, replacement of another job's reviewer, or acceptance of GL2 is required.

Queue generation must preserve the reconciled round scope. In
`research/blueprint/make_queue.py`, `fix_rounds` derives review outputs from the
fix round's `current_outputs` (lines 1940–1944 at this base). When `missing` or
`sent_back` is true, line 1955 declines to reuse `previous_jobs[following]`;
the fallback at lines 1965–1966 adds newly available blueprints to that round.
The committed parent
`FIX-RT-AREA-langlands-2~3` is marked done but now lists 40 outputs, whereas its
completed fix report explicitly restricts work to these three blueprints.
Reconcile that historical fix scope too: its report plus the packet, reader
and suggested file of these three blueprints (ten files):

- `research/blueprint/redteam/RT-AREA-langlands-2.fixes-3.md`
- `research/blueprint/packets/ClassicalSerreModularity--R27.3.json`
- `research/blueprint/readmes/ClassicalSerreModularity--R27.3.md`
- `research/blueprint/suggested/ClassicalSerreModularity--R27.3.lean`
- `research/blueprint/packets/GL2ModularityLifting--R22.1.json`
- `research/blueprint/readmes/GL2ModularityLifting--R22.1.md`
- `research/blueprint/suggested/GL2ModularityLifting--R22.1.lean`
- `research/blueprint/packets/GlobalGaloisDeformations.json`
- `research/blueprint/readmes/GlobalGaloisDeformations.md`
- `research/blueprint/suggested/GlobalGaloisDeformations.lean`

Verify that
regeneration retains the fixed historical scopes and seven review outputs.
This is the code path to investigate, not a claim that this run has tested a
generator repair.

The queue and generator are outside the issue's editable files. Additionally,
`intake.ALLOWED` excludes `research/blueprint/queue.json`, so a queue repair needs
maintainer handling rather than ordinary worker intake. Further checkpoints
containing only unchanged mathematical deliverables cannot clear this blocker.

### Reproduction and validation

From the repository root, this read-only check reproduces the two results:

```python
import json, sys
sys.path.insert(0, "research/blueprint")
from issues import deliverables_complete
queue = json.load(open("research/blueprint/queue.json"))
job = next(j for j in queue["jobs"]
           if j["id"] == "REV-FIX-RT-AREA-langlands-2~3")
authorized = [
    "research/blueprint/reviews/REV-FIX-RT-AREA-langlands-2~3.md",
    "research/blueprint/packets/ClassicalSerreModularity--R27.3.json",
    "research/blueprint/packets/GL2ModularityLifting--R22.1.json",
    "research/blueprint/packets/GlobalGaloisDeformations.json",
    "research/blueprint/suggested/ClassicalSerreModularity--R27.3.lean",
    "research/blueprint/suggested/GL2ModularityLifting--R22.1.lean",
    "research/blueprint/suggested/GlobalGaloisDeformations.lean",
]
assert not deliverables_complete(job)
assert deliverables_complete({**job, "outputs": authorized})
```

Re-ran `scripts/check_blueprint.py` on all three packets: each has zero errors
and zero warnings. Checked that all 177 nodes retain `implementationStatus:
unchecked`, no packet has an `excerpt` field, and each of the forty findings
has exactly one disposition in the report. Re-read all 36 baseline records
(35 distinct declarations) at the exact pinned commits and the applicable
CSM library-audit rows. Ran all three `lean-check` commands sequentially:
zero errors, only `sorry` warnings (CSM 23, GL2 13, Global 18). The GL2 addition
is a comment; this does not elaborate its missing supplier-dependent APIs/tests.
The current concrete declaration registry has 28,671 nodes; both precedence
orders reach no cycles, and the R33.1–R33.4 forbidden-ancestor checks pass.
All fresh receipts are in the report. The earlier full stage/assembly receipts
below remain historical. Scratch is disposable; this note contains the
completion reproduction and the next action.

## Completed review from the preceding run

The following is the retained 7 October review handoff. The current
continuation above supersedes its old claim that R23.1 has not planned CHT.

Issue #5871, Codex session `codex-t0EaB3`, 7 October 2026; base `5f858d95`.
Completed independent review of FIX-RT-AREA-langlands-2~3 (#5870, Claude `claude-c9TlsS`, PR #6724),
continuing and rechecking the merged Claude `claude-hd6PQ0` checkpoint PR #7024.
The review report is [REV-FIX-RT-AREA-langlands-2~3](../reviews/REV-FIX-RT-AREA-langlands-2~3.md).
No review work remains for the live issue's authorized scope. Negative packet verdicts are completed review outcomes.

Final packet verdicts:

- CSM R27.3: **accepted** for this fix round. Corrected six test classifications and the positive-level
  Newform parameter in its suggested-file comment.
- Global: **accepted** for this fix round. Explicit Cayley–Hamilton quotient in Chenevier reconstruction,
  exact existing IHG.1 supplier/request, conditional reducible counterexample, thirty test classifications.
- GL2 R22.1: **needs_changes**. Corrected the final dyadic base-change step (allowable, not necessarily split
  above 2), the stale potentially-semistable sketch gap, twenty test classifications and the missing-test count.
  Its never-accepted base review still requires the typed APIs/tests and used-API promotion listed below.

Previous review objects are preserved verbatim in reviewHistory. Node IDs, partial statuses, source-issue
verdicts and unchecked implementation statuses are retained. No source graph or upstream roadmap was edited.

The next GL2 revision resumes at the gap **Typed suggested signatures and tests are incomplete**:

| Definition/construction node suffix | APIs | Tests |
| --- | ---: | ---: |
| R22.1/minimal-level-data | 4 | 3 |
| R22.1/deformation-to-hecke-map | 4 | 3 |
| R22.1/framed-hecke-module | 4 | 3 |
| R22.2/auxiliary-level-groups | 4 | 3 |
| R22.2/auxiliary-hecke-algebra | 5 | 4 |
| R22.2/taylor-wiles-module-system | 3 | 3 |
| R22.2/dyadic-twists-of-forms | 4 | 3 |
| R22.3/arithmetic-patching-data | 3 | 3 |
| R22.4/ihara-avoidance-comparison | 3 | 3 |
| R22.5/strong-residual-modularity | 3 | 3 |
| R22.6/dyadic-patched-ring | 4 | 3 |
| R32.1/lifting-statement-table | 3 | 3 |
| R32.1/dyadic-lifting-proposition | 3 | 3 |
| R32.1/residually-reducible-lifting-proposition | 3 | 3 |
| R32.1/ordinary-three-lifting-proposition | 3 | 3 |
| Total | 53 | 46 |

Give these real typed supplier interfaces or explicitly scoped stand-ins, packet-named API signatures and
meaningful examples under PROTOCOL §13. The corrected total is 46: dyadicDet_smul is inside an unelaborated
block comment. The four typed §8 definitions and p-star are already covered; do not re-add them to this gap.
Under §4 promote API lemmas used elsewhere, including the auxiliary U_v comparison and framed-module
properties consumed by delta-actions/patching. The three recorded bundles identify constructors and
properties needing separation; target-level planning does not require every theorem to be split further.
Retain the existing prescribed-type and Durham source gaps until their exact source hypotheses are supplied.

All forty confirmed findings have a disposition in the report: eleven local repairs, twenty-nine routed
externally. The maintainer's stage/ownership edits remain /1, /12, /20, /22, /37; external CHT suppliers,
R24.4 consumers, other CSM parts and ML.1 are explicitly listed. IHG.1/henselian-irreducible is an existing
planned node whose packet needs changes, so Global imports it as an open request, not an accepted formal theorem.
The separate Global own-fix review #5720 retains its own verdicts. Legacy CSM/Global suggested-interface
omissions predate this fix; this acceptance does not certify a fresh exhaustive base-plan review.

Validation: all three pinned-index packet checks have zero errors/warnings; source-version and test-kind
checks pass; all three final lean-check runs have zero errors and only sorry warnings (CSM 23, GL2 13,
Global 18). Both declaration-graph precedences and trial atlas assemblies are acyclic and skip no links.
The inherited R26.6 → R27.1 stage edge still needs the maintainer's edit; its removal in memory clears the
unwanted R26 ancestors of R33.2–R33.5 while R33.6 retains them. Forty findings covered exactly once;
review-history preservation and final intake/path checks pass. The public source URLs, hashes and locators
are in the report. Scratch is discarded after the PR opens; no subsequent worker needs it.

Automation blocker: queue.json lists 27 outputs (13 packets, 13 suggested files and the report),
while live issue #5871 lists seven (three packets, three suggested files and the report).
The queue completion check is false even after the authorized work is complete; scoped to the
live issue's outputs it is true. This explains PR #7024's checkpoint classification. The maintainer
must reconcile the queue entry; do not edit other jobs' reviews merely to satisfy the stale list.
This PR submits the completed authorized review and identifies this external completion blocker.
