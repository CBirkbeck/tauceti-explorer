# Current blocked continuation: 10 October 2026

Codex, session `codex-0zxhBp`, claimed issue #5704; bot confirmation
[6092606975](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6092606975).
Base: `8a53daaaae8b929368fd89963c6b220443fcb164`. This continuation
verifies the completion blocker identified below. It preserves the completed
three-packet review and makes no new mathematical verdict or source-audit claim.

The live issue still names seven deliverables. The generated queue names 47,
including 20 additional packets. Every queue-listed file exists, so missing
files do not explain the failure. A fresh invocation of the stock
`issues.deliverables_complete` returns **true** for a copy of the job with
exactly the live issue's seven paths and **false** for the unmodified queue
entry. All 20 additional packets name other review jobs; none names
`independent-review-REV-FIX-RT-AREA-padic-1~3`. P0's honest `needs_changes`
verdict satisfies the predicate for the authorized scope.

Re-read the intake's actual merge path: it evaluates completion from the
queue job, independently of the submission's description, then releases an
incomplete job as available. Calling this submission complete cannot resolve
that mismatch. Both `queue.json` and `make_queue.py` fail intake's output-path
allowlist, in addition to being outside this issue's deliverables. The
historical author-merge queue at `c69e5b6c9` still confirms ten author outputs
and seven review outputs, both covering only these three packets.

Fresh stock `check_blueprint.py` runs report **zero errors and zero warnings**
for P0 (326 nodes), AEG (153) and ASII (537). No packet or suggested file
changed. Lean was not rerun: the preceding session's successful sequential
elaborations remain its evidence, not a fresh compilation claim.

Scope reconciliation was requested from the manager during this run. No
answer or repair authorization has been received. Only this report and the
job handoff change. This is a blocked checkpoint under WORKERS.md, rather than
another mathematical review of the three already reviewed packets.

The maintainer must restore and preserve the original author/review scopes,
or publish an explicitly expanded assignment with a permitted submission
route. Until then, this issue should be held out of available worker selection;
otherwise automatic checkpoint intake releases the same blocked assignment
again. Workers must not change its labels themselves. The detailed repair
candidate, regression fixture, historical scopes and mathematical follow-ups
below remain available to the maintainer.

---

# Scope-preservation regression checks: 10 October 2026

Codex, session `codex-AQARNU`, continued issue #5704 from
`7717a66bbabd800f7cccc4efbd991743cceca516`. The bot confirmed the claim
in comment 6092370661. The preceding mathematical review is preserved:
PerfectoidSpaces P0 needs_changes; AdicEtaleGeometry and AdicSpacesPartII
accepted for their scoped corrections. This continuation adds reproducible
regression evidence for the unresolved scope blocker; it does not replace
any verdict or claim a new source audit.

## Current completion boundary

The live issue still authorizes seven deliverables, covering three packets.
The current generated queue requires 47 deliverables, covering 23 packets.
At author merge `c69e5b6c9`, the author fix had ten deliverables and this review
had seven, agreeing with the issue. The current author fix has 78. Fresh
`issues.deliverables_complete` results remain false for the current queue
and true for a copy containing the issue's seven paths. P0's needs_changes
verdict is a valid completed review disposition; the twenty additional packets
cause the completion failure.

WORKERS.md limits edits to the issue's named files and the job handoff.
The queue, generator, generator tests and generated prompts are outside that
scope. Moreover, `intake.py` excludes generator and queue paths from its
submission allowlist. Applying the repair requires a maintainer-owned change
or explicit authorization and a maintainer-reviewed submission route. A scope
question was sent during this run; no reply or repair authorization is assumed.
No queue, generator, prompt, packet or suggested file was changed. This is a
blocked checkpoint, not an unfinished repeat of the three-packet review.

## Additional defects and candidate correction

The preceding checkpoint's proposed change at `made` preserves existing later
rounds. It does not protect an existing **first** round: `fix_rounds` reuses its
old outputs only when its state is done. A first round with state external
(already claimed) or pending can therefore acquire a newly available owner
without an updated issue. Both cases fail the later-round-only candidate.

A separate fixture shows that, even when outputs happen to be unchanged, an
existing later round's `after` can change from the preceding author job to its
review when a send-back is detected. Unconditional reuse of the existing later
round preserves the stored prerequisite as well as its paths. This matters
because regeneration must not rewrite the instructions of an assignment
already issued to a worker.

The tested two-site candidate is:

```diff
-        if states.get(current) == "done" and current in previous_outputs:
+        if current in previous_outputs:
             current_outputs = list(previous_outputs[current])

-            made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None
+            made = previous_jobs.get(following)
```

This is a candidate policy of preserving every existing fix assignment,
including pending ones. The maintainer must decide whether an unpublished
pending assignment may be recomputed and, if so, identify it explicitly;
state pending alone does not establish that an issue was never published.
New assignments continue to acquire new owners and follow a finished review
when that review sends the preceding round back.

## Focused regression results

The fixture extracts the actual nested function with Python's AST. All other
dependencies are inert fixtures, and generated jobs and prompts are captured
in memory. It writes no repository file. Pass means expected output paths
are retained; the existing-send-back case also checks its original `after`.
The full candidate additionally checks author/reviewer path and prompt
agreement, preserved prerequisites for existing rounds, and the review
prerequisite for a new send-back round.

| Fixture | Stock | Later-round-only candidate | Two-site candidate |
| --- | --- | --- | --- |
| Claimed first round, new owner | fail | fail | pass |
| Pending first round, new owner | fail | fail | pass |
| Finished first round, unchanged owners | pass | pass | pass |
| Existing later round, new owner | fail | pass | pass |
| Existing later round, new send-back | fail | pass | pass |
| New round required by new owner | pass | pass | pass |
| New round required by send-back | pass | pass | pass |
| Existing third round, new owner | pass | pass | pass |

All eight focused cases pass for the two-site candidate. The final row does
not vindicate stock behavior: its already-done preceding second round can
absorb the new owner before the third round is visited. The fourth row is the
fixture that catches that mutation directly.

This does not certify full generation, all job kinds, downstream scheduling,
the final state merge or automatic issue synchronization. Restoring only the
review's seven paths is insufficient: the author round's original ten paths
must be restored too, otherwise regeneration derives the broadened review
from the broadened author assignment. Newly available owner work still needs
its own properly scoped assignments. Any repair must regenerate twice and
compare queue entries, prompts, prerequisites and completion before intake.

## Validation and next action

Fresh stock `check_blueprint.py` checks report zero errors and zero warnings
for all three issue-named packets: P0 326 nodes; AEG 153; ASII 537. The pinned
declaration index was found by the checker. No Lean signature changed and
Lean was not rerun; the preceding report's successful sequential elaborations
remain that session's evidence. No new mathematical completeness or source
verification is claimed.

Only this report and the handoff change. The next action is a maintainer scope
repair, rather than another independent audit of the completed three-packet
review. The handoff gives the exact historical deliverables, preserved
mathematical follow-ups and repair acceptance conditions. The runnable fixture
below preserves all new evidence without relying on disposable scratch files.

<details><summary>Read-only regression fixture</summary>

Run from the repository root in disposable scratch space. It uses the current
stock generator as its input and applies candidate transformations in memory.

```python
import ast, copy, json, re
from pathlib import Path
ROOT=Path.cwd()
source=(ROOT/'research/blueprint/make_queue.py').read_text()
original=next(n for n in ast.walk(ast.parse(source)) if isinstance(n,ast.FunctionDef) and n.name=='fix_rounds')
A='research/blueprint/packets/A.json'; B='research/blueprint/packets/B.json'
S='research/blueprint/suggested/A.lean'; F='FIX-RT-X'; V='REV-'+F

def run(previous,blueprints,verdicts=None,variant='stock'):
    node=copy.deepcopy(original)
    if variant!='stock':
        made=next(n for n in ast.walk(node) if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='made' for t in n.targets))
        made.value=ast.parse('previous_jobs.get(following)',mode='eval').body
    if variant=='full':
        condition=next(n for n in ast.walk(node) if isinstance(n,ast.If) and ast.unparse(n.test)=='states.get(current) == \'done\' and current in previous_outputs')
        condition.test=ast.parse('current in previous_outputs',mode='eval').body
    captured=[]
    env=dict(states={j['id']:j['state'] for j in previous},previous_outputs={j['id']:j['outputs'] for j in previous},previous_jobs={j['id']:j for j in previous},
             findings_text=lambda *args:'finding',PROMOTABLE=re.compile(r'^research/blueprint/packets/.*\.json$'),fill={},
             FIX_TEMPLATE='{JOB}|{ROUND}|{PACKETS}|{DELIVERABLES}',FIX_REVIEW_TEMPLATE='{JOB}|{FILES}',
             add=lambda job,prompt: captured.append((job,prompt)),review_of=lambda path:(verdicts or {}).get(path,{}))
    exec(compile(ast.fix_missing_locations(ast.Module(body=[node],type_ignores=[])),'<stock AST fixture>','exec'),env)
    env['fix_rounds']('RT-X','area:X','fixture',[],0,{},[],['report',A,S],blueprints,{},[])
    return {j['id']:(j,p) for j,p in captured}

def job(id,state,outputs,after=[]):return dict(id=id,state=state,outputs=outputs,after=after)
first=['research/blueprint/redteam/RT-X.fixes.md',A,S]
second=['research/blueprint/redteam/RT-X.fixes-2.md',A,S]
third=['research/blueprint/redteam/RT-X.fixes-3.md',A,S]
cases=[
('claimed first round',[job(F,'external',first)],[A,S,B],None,F,first),
('pending first round',[job(F,'pending',first)],[A,S,B],None,F,first),
('finished first round',[job(F,'done',first)],[A,S],None,F,first),
('existing later, new owner',[job(F,'done',first),job(F+'~2','external',second,[F])],[A,S,B],None,F+'~2',second),
('existing later, send-back',[job(F,'done',first),job(V,'done',['review',A,S]),job(F+'~2','external',second,[F])],[A,S],{A:{'reviewer':'independent-review-'+V,'status':'needs_changes'}},F+'~2',second),
('new owner round',[job(F,'done',first)],[A,S,B],None,F+'~2',second+[B]),
('new send-back round',[job(F,'done',first),job(V,'done',['review',A,S])],[A,S],{A:{'reviewer':'independent-review-'+V,'status':'needs_changes'}},F+'~2',second),
('third round retained',[job(F,'done',first),job(F+'~2','done',second,[F]),job(F+'~3','external',third,[V+'~2'])],[A,S,B],None,F+'~3',third),
]
result=[]
for name,previous,blueprints,verdicts,target,expected in cases:
    row={'case':name}
    for variant in ['stock','later_only','full']:
        got=run(previous,blueprints,verdicts,variant)
        row[variant]=got[target][0]['outputs']==expected
        if name=='existing later, send-back':row[variant]=row[variant] and got[target][0]['after']==[F]
        if variant=='full':
            assert row[variant],(name,got[target][0]['outputs'],expected)
            # The review and prompts agree with their generated author job, including existing rounds.
            for id,(j,p) in got.items():
                if id.startswith('REV-'):continue
                packets=[o for o in j['outputs'] if o.endswith('.json')]
                review=got['REV-'+id]
                assert all(o in review[0]['outputs'] and o in review[1] and o in p for o in packets)
            if name=='existing later, send-back':assert got[target][0]['after']==[F]
            if name=='new send-back round':assert got[target][0]['after']==[V]
            if name=='third round retained':assert got[target][0]['after']==[V+'~2']
    result.append(row)
print(json.dumps(result,indent=2))
```

</details>

---

# REV-FIX-RT-AREA-padic-1~3

## Read-only generator reproduction: 10 October 2026

Codex, session `codex-oCcEpY`, continued issue #5704 from `bb373205d`.
The bot confirmed this claim. The issue still lists the original seven
outputs; the queue still lists 47. The preceding scoped review is finished.
No new mathematical verdict, source audit or Lean compilation is claimed.
The three current verdicts and all earlier evidence remain unchanged.

Fresh `issues.deliverables_complete` results are **false** for the unmodified
queue entry and **true** for an in-memory copy with the issue's seven paths.
All three named packets pass the stock checker with zero errors and warnings.
Exactly 20 additional packets carry other review jobs' verdicts.

A controlled, read-only reproduction now demonstrates the generator's
broadening, rather than only identifying a possible code path. Extracted the
actual nested `fix_rounds` function with Python's AST, executed it with captured
`add` calls and inert prompt templates, and supplied this minimal fixture:

- A completed first round contains one original packet.
- An already published second round has state `external`, the same packet and
  its second-round report, and follows the first round's review.
- The newly computed blueprint list adds one new owner packet; no review has
  sent work back.

The stock function adds the new owner's packet to both the published second
round and its review. The cause is `missing`: it disables reuse of the existing
second-round job at the `made` assignment. In the same isolated fixture,
replacing that assignment's value with `previous_jobs.get(following)` preserves
both scopes. Both assertions pass. The generator, queue and prompts were not
executed or edited; the fixture wrote no repository files. This is a candidate
repair, not a tested complete generator change. A maintainer repair must also
check first-round preservation, send-back cases, new-round creation, prompt
consistency and full regeneration.

The author-merge queue at `c69e5b6c9` independently confirms ten fix outputs
and seven review outputs, with exactly the three issue-named packets. Restore
those historical scopes before checking the preservation change; retaining
already broadened outputs alone would preserve the defect.

Scope clarification was requested in this run. Without explicit authorization,
WORKERS' issue-path restriction prevents applying the queue/generator repair.
This submission is a checkpoint for that administrative blocker. Only this
report and the handoff change. The next worker should obtain scope resolution
and repair the metadata, rather than repeat the completed mathematical review.

## Scope diagnostic continuation: 10 October 2026

Codex, session `codex-I2abtS`, continued issue #5704 from commit
`91df8604a`. The bot confirmed this session's claim. The preceding scoped
review is finished; this continuation leaves its mathematical verdicts and
validation history intact. It adds evidence about the administrative blocker,
rather than claiming another independent source audit.

The mismatch arose after the author submission. At the author-fix merge
`c69e5b6c9` (#6883), the queue lists **10 outputs and three packets** for
`FIX-RT-AREA-padic-1~3`, and **seven outputs and three packets** for its review.
Those seven review outputs agree exactly with the current issue body. At
`109496aed` (#8083), `331007b5e` (#8131), and this continuation's base, the
same fix has **78 outputs and 23 packets**, and the review has **47 outputs
and 23 packets**. Thus the current broad queue is not evidence that the author
submitted fixes to the additional 20 packets in this round.

Executed the stock `issues.deliverables_complete` on the unmodified checkout:

| Output list supplied to the predicate | Result |
| --- | --- |
| Current queue entry, all 47 outputs | false |
| Copy of that entry with exactly the issue's seven outputs | true |

Every additional packet has another job's review object. None has this job's
reviewer. The predicate requires this job's reviewer in every listed packet;
it accepts an honest `needs_changes` verdict, so P0's disposition is not the
reason completion fails. The two scope evaluations require no packet edit.

The generator's `fix_rounds` function in `make_queue.py` derives review outputs
from the fix's promotable outputs and suggested files. When choosing a later
fix round, it preserves `previous_jobs[following]` only if neither `missing`
nor `sent_back` holds. Otherwise it computes the round's outputs again,
including newly available blueprints. The final queue merge preserves job
state and other runtime metadata, but does not preserve historical `outputs`.
These code paths explain how scope can expand during regeneration; they were
inspected, not executed or changed in this run. The exact invocation that
first broadened this particular round has not been identified.

The maintainer can reconcile the scope by restoring this review's original
seven outputs and preserving the author round's original three-packet scope
across regeneration. Newly available owner work needs explicit separate
assignments or an explicitly expanded issue, followed by actual independent
reviews; copying their existing verdicts under this job's name would not
discharge that work. A queue-only correction should be checked against
`fix_rounds` so that regeneration does not reintroduce the mismatch. The
handoff records the exact seven paths.

Fresh stock checks of the three issue-named packets report zero errors and
zero warnings. The configured pinned declaration index was present (316,811
lines). No suggested file changed, and Lean was not rerun; the preceding
successful elaborations remain that session's evidence. No packet, reader,
source, generator, queue, label or existing verdict was changed here.

A scope clarification was requested during this continuation. In the absence
of an answer, WORKERS' issue-path restriction still applies. This submission
is a checkpoint for the scope blocker. The next mathematical worker should
resume only after scope reconciliation, rather than repeat the finished
three-packet review.

## Current continuation: 10 October 2026

Codex, session `codex-HQccLS`, independently reviewed FIX #5703 from base
`8b716e0182c8d2d50d14908a8421d02160e4546b`. This session did none of the fixes
or preceding reviews. **The issue's three scoped verdicts remain: P0
needs_changes; AdicEtaleGeometry accepted; AdicSpacesPartII accepted.** The
review is complete within the issue's authorization. Submission is a
checkpoint because the queue additionally requires 20 unauthorized packets.

Continued from the preceding review below rather than reopening its completed
reader-synchronization work. Re-read the confirmed findings and fix report and
independently checked the public primary-source statements and proofs at the
locators and versions listed in the archived evidence table: Berkeley
Definitions 6.2.9 and 6.3.1, Lemma 6.2.10, Theorem 6.2.11 and Propositions
6.3.3–6.3.4; ECD Theorems 3.13–3.17, Definition 5.7(ii), Theorem 5.8 and
Propositions 6.4(iv), 7.23 and 9.3; Česnavičius Lemmas 4.7, 5.1 and 5.2.
The downloaded public copies have the same hashes as the table. This is fresh
evidence for the scoped boundaries, not a certification of every inherited
source record. Each finding's disposition in the archived table is retained;
excluded-owner handoffs still mean neither installation nor acceptance.

The root-annihilator/almost-flatness, almost-elements and field-base
comparisons remain unresolved in P0. The two P7 tower targets still lack
precise supplier interfaces and actual Lean theorem signatures and tests.
These are mathematical gaps, so the `needs_changes` verdict is appropriate;
that verdict itself completes a review under the stock completion predicate.
Neither these gaps nor the older broad audit have been silently accepted.
AEG retains the constructed characteristic-p comparison and ASII retains a
pending split proposal, with their inherited qualifications.

Fresh checks strengthen and corroborate the preceding evidence:

- Each of the six affected P1/P7 reader contracts contains its packet's exact
  authored statement, hypotheses and proof steps. No reader edit was needed.
- The mandatory tilting and mod-pseudouniformizer prerequisite cones contain
  93 and 153 vertices and exclude both optional deformation-route nodes.
  P0's nilpotent lifting still reaches its almost-deformation supplier. AEG
  has no Q4 prerequisite.
- ASII's prefix contains 19 of 42 R5 nodes and is closed under R5 inputs.
  Following prerequisites through all three packets gives a cone of 626
  vertices with no `ClassicalAdicEtaleCohomology:H0` input. This strengthens
  the preceding direct-input check. Unprovided external nodes and stages are
  leaves; no whole-atlas closure or cycle certificate is claimed.
- The combined graph is acyclic, with 1,016 packet nodes and 1,852 total
  vertices. The stock packet checker reports zero errors and zero warnings
  for each packet against the pinned declaration index.
- All three suggested files were freshly checked sequentially with
  `lean-check` and exited 0: P0 1,285, AEG 361 and ASII 912 warnings, all
  `sorry`. Memory was checked before every run. No compiler processes remain.
  Compilation does not validate the omitted P7 targets.

Read the actual pinned `IsRegularLocalRing`, `IsAdicComplete`, `Module.Flat`,
`WittVector`, `IsIntegrallyClosedIn`, `IsAnalyticPoint` and `spaAnalytic`
statements. The reviewed library audit's `layers` has no entries for these
three roadmaps. That absence does not justify rebuilding existing carriers.
Read the current upstream AdicSpaces and AlgebraicVectorBundles roadmaps at
`618e0b30d21791d6a492ce88ba8602745697b21a`, and searched current suggested
files and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` for the changed
perfectoid/sousperfectoid/tower interfaces. The ownership conclusions below
remain qualified; neither read-only tree was modified or built.

Only the three current review objects, their appended historical reviews,
this report and the handoff changed. No mathematical contract, source record,
API, test, planet or suggested declaration changed. Intake file checks and
`git diff --check` pass. The reader already contains source quotations near
the tower contracts. They were not copied here or added by this continuation;
the reader owner must replace them with authored descriptions under the
manager's standing source rule. The reader is outside this issue's editable
deliverables.

Re-evaluated `issues.deliverables_complete`: it returns **true** for the
issue's seven deliverables and **false** for the queue's 47 outputs (23
packets, 23 suggested files and this report). Exactly 20 additional packets
lack this job's reviewer. WORKERS restricts edits to issue-named files, so
assigning those verdicts or editing the queue is unauthorized. A scope
clarification was requested during this continuation and remains unanswered.
The handoff gives the concrete reconciliation needed; this blocker is the
reason for the checkpoint, not incomplete scoped review work.

## Archived review: 9 October 2026

The preceding worker's report is preserved below as historical evidence.
Its dates, base commit and broader validation claims refer to that worker;
the continuation above specifies what this session checked independently.

**Scoped verdicts: AdicEtaleGeometry accepted; AdicSpacesPartII accepted;
PerfectoidSpaces--P0 needs_changes.** The third-round reader synchronization
is correct. P0 still has mathematical supplier and general-base category gaps,
and its two new tower targets have no Lean theorem signatures. All three
existing suggested files now elaborate successfully, with only `sorry`
warnings. Successful elaboration does not cover targets left in comments.

Reviewer: Codex, session `codex-iTQbCz`, 9 October 2026; issue
[#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Base commit: `c4a0d4ba9c6463f0fea0bc4dfafd06ea4725ee74`.
Reviewed Codex `codex-NIfClf`, FIX issue
[#5703](https://github.com/CBirkbeck/tauceti-explorer/issues/5703),
[third-round fixes report](../redteam/RT-AREA-padic-1.fixes-3.md).
This reviewer did none of the fix, earlier reviews or original blueprints.

The issue limits this review to three packets and their suggested files. Read
all 32 original findings, their independent verification reasons, both earlier
fix reports and the [round-two review](REV-FIX-RT-AREA-padic-1~2.md).
Excluded-owner actions are assessed as handoffs, not as completed fixes or new
acceptances of those owners' mathematics. The issue and queue disagree about
the review's deliverables; the completion consequence is recorded below.

## /5 and /8: tilting, reduction and untilts

**The submitted synchronization passes.** Compared the statement, hypotheses,
proof steps, acceptance items and declaration-index prerequisites of six
affected reader contracts with their packet nodes: the characteristic-p
Frobenius inverse-limit lift, optional cotangent vanishing, optional deformation
lifting, mod-pseudouniformizer equivalence and the two P7 towers. They agree.
The reader is an input here, not an authorized deliverable.

Both mandatory P1 equivalences avoid the optional cotangent/deformation nodes
in their entire prerequisite ancestry. The optional deformation theorem still
uses the optional cotangent lemma. P0's finite-étale lifting still reaches
almost deformation through nilpotent lifting and retains its genuine DD.0
input. Thus the narrower mandatory P1 proof does not remove P0's own uses.

Fresh Berkeley Definition 6.2.9, Lemma 6.2.10 and Theorem 6.2.11, printed
pp. 46–47, and ECD Theorems 3.13–3.17, pp. 17–18, support the primitive-ideal
classification route: primitive degree one, its nonzerodivisor property,
converse construction, both functors and the untilt's plus ring must remain.
This check supports the added Berkeley records; it does not freshly audit
every inherited Kedlaya–Liu/AWS citation. E-linear comparisons in RF/F4 remain
consumer work rather than a second classification owner.

The mod-pseudouniformizer reader now uses the truncated root ring over
characteristic p and root-ideal almost flatness, keeps the divisibility
condition on the chosen pseudouniformizer, and displays the existing
root-annihilator gap. The erroneous historical E8 source diagnosis appears
under its rejection, rather than as an established source error. ECD
Proposition 7.23 and proof, pp. 38–39, supply the flatness used in Proposition
9.3 and proof, p. 44, for a totally disconnected base. Those hypotheses are
retained in the acceptance item.

**P0 remains needs_changes.** The packet still needs declaration-level proofs
identifying its elementwise root-annihilator criterion with root-ideal almost
flatness, showing invariance under almost elements, and comparing the resulting
general-base category with the field-base category. Reading the field-base
source or the totally disconnected descent argument does not discharge those
obligations. P1's coverage correctly stays `partial`. The older broad
baseline/source/dependency/API/test/planet audit also remains unfinished; this
scoped review does not overwrite that limitation with a full acceptance.

## /7: regular finite-flat towers

**The source hypotheses, baseline correction and negative explanation pass.**
Fresh Česnavičius v4, Lemma 4.7 and proof, printed p. 8, and Lemmas 5.1–5.2
and proofs, pp. 11–12, agree with the two inherited P7 statements. The first
starts from a complete regular local ring; p-power ranks need the separably
closed residue field of positive characteristic. Its residue-field colimit
is not claimed complete. The perfectoid tower needs mixed characteristic and
perfect residue field, completes p-adically, and retains the ramified
unit-multiple-of-p step. Its local integral-closedness criterion is an inline
instance, not a new general Cohen or perfectoidization owner.

Read pinned Mathlib `RingTheory/RegularLocalRing/Defs.lean`, declaration
`IsRegularLocalRing` at line 51 and neighboring characterizations. It already
provides the local/noetherian carrier and the generator-count/Krull-dimension
condition. The reader, packet prerequisites and suggested import credit that
carrier. Also read the pinned declarations `IsAdicComplete`, `Module.Flat`,
`WittVector` and `IsIntegrallyClosedIn` used by these two nodes. They provide
the named carriers; their presence alone does not supply the cited Cohen
presentations or the necessary power-series, quotient, normality and filtered
colimit comparison theorems. Matsumura was not read: its theorem numbers here
are Česnavičius's references, not independently verified book evidence.

The corrected negative example distinguishes the stages. For stage zero of
the p-root tower over the p-adic integers, Frobenius on the residue field is
surjective; the obstruction is that an integral valuation cannot satisfy
p times the valuation of the proposed pseudouniformizer equal to one. At
positive stage m the reduction is the truncated polynomial ring with
nilpotence exponent p^m. Frobenius produces exponents divisible by p, so the
class of T has no preimage. These are mathematical acceptance contracts.

**The remaining supplier/signature gap is real.** The Cohen/tower gap is
appropriately narrower than the former false claim that regular local rings
are missing, but it still lacks precise supplier interfaces. In the suggested
file, `Perfectoid.exists_regularFiniteFlatTower_isAlgClosed` and
`Perfectoid.exists_regularFiniteFlatTower_perfectoid` are explicitly not
stated. Their negative contracts are comments, not elaborated examples.
PROTOCOL §13 requires named theorem signatures and honest tests. The native
compiler therefore certifies neither these two targets nor their negative
examples. Keep this shortfall visible until the actual tower carriers and
suppliers permit faithful statements; an arbitrary proposition field would
not repair it. This supports P0's needs_changes verdict independently of the
unfinished older broad audit.

## /6 and /15: the adic étale boundary

**Accepted for the retained scoped correction.** The node
`A3/zariski-closed-immersion-ecd-comparison` assumes characteristic p and an
explicitly constructed embedding. Its surjection and plus-ring integral
closure give the required strongly closed comparison directly. It no longer
imports the universal converse of ECD Theorem 5.8 or Q4. Fresh ECD Definition
5.7(ii), p. 24, Theorem 5.8, p. 25, and Proposition 6.4(iv) and proof,
pp. 27–28, confirm that distinction. The latter proof uses the sousperfectoid
ball, pseudocoherent equations, perturbation and étale tilting. No packet
prerequisite names Q4. This is not a new verification of every auxiliary A3
proof or every Fargues–Scholze citation.

`A0/analytic-locus-restriction` is present, with its API and six tests. Read
pinned Tau Ceti `AdicSpace/Spa/Analytic.lean`: `IsAnalyticPoint` and
`spaAnalytic` already supply the affinoid analytic subset. The A0 contract
builds the global restriction interface on that input; it does not need a
second affinoid definition. Deleting the atlas Q4 edge/requires entry and
correcting RS-05's omission remain maintainer actions. The accepted scoped
verdict preserves the earlier full review and existing source-qualified gaps.

## /9: the sousperfectoid prefix

**Accepted as a pending proposal.** The listed prefix contains 19 of the
current 42 R5 nodes. Following R5 prerequisites recursively closes on exactly
those 19. The other 23 remain outside it. Its direct external node/stage inputs
are R0, R3, A1 and P1–P3, alongside baseline carriers, without H0. This is a
node-boundary check, not a new whole-atlas stage-graph verification.

Fresh Berkeley Definition 6.3.1 and Propositions 6.3.3–6.3.4, printed
pp. 47–48, support the split continuous topological-module injection,
rational/finite-étale/Tate-variable stability, and stable-uniform/sheafy
conclusion. The product nodes retain separate perfectoid-times-smooth and
base-change reasoning; one perfectoid factor does not by itself prove that a
product is perfectoid. Definition APIs and their recorded tests remain
unchanged under this scoped review.

`AdicSpacesPartII:R5:sousperfectoid` is absent from the current atlas. Retaining
the existing valid parents and IDs is correct until the maintainer installs
the proposed stage, changes its early aggregate edges and updates coverage.
The fresh Berkeley PDF matches P0's recorded version; ASII's different
historical version hash is preserved. This review checks the specified 6.3
content, not every locator in that older PDF.

## Disposition of every finding

For excluded owners, “handoff retained” means the round-three report preserves
the finding and its verifier's qualifications. It does not mean that the
excluded packet has been reviewed or its proposed correction installed.

| Finding | Verdict and reason |
| --- | --- |
| /1 | Handoff retained: general integral perfectoidization and J-almost purity belong to the PerfectoidQuotients direction, with P8/Shimura imports. Classical P3 purity is not that supplier. |
| /2 | Handoff retained: reconcile the common Abhyankar supplier and the direct-summand designs, keeping the rejected André route and verifier's additional Bhatt proposal distinct. |
| /3 | Handoff retained: pre-adic v-sheaves and formal/non-Tate consumers require the early D6 supplier; these three adic packets do not construct it. |
| /4 | Handoff retained: finite-level T6 and tower S6 need the qualified supplier/consumer interface, not a claim of unrelated duplicate owners. |
| /5 | Reader synchronization accepted; mandatory-route ancestry and retained P0 deformation pass. General-base comparison obligations still prevent P0 acceptance. |
| /6 | Inherited A3 correction accepted for its constructed characteristic-p comparison. Live Q4 edge/requires deletion is not installed by this review. |
| /7 | Reader baseline and finite-stage corrections accepted; tower source hypotheses pass. Cohen/tower interfaces and absent named Lean signatures remain gaps. |
| /8 | Berkeley source addition accepted for primitive ideals and untilt classification; E-linear RF/F4 adapters remain handoffs. |
| /9 | Pending 19-node prefix proposal accepted; stage creation, early-edge replacement, reparenting and coverage update remain installation work. |
| /10 | Handoff retained: an early Berkovich-spectrum owner should supply D5's comparison, rather than another general spectrum construction. |
| /11 | Handoff retained: compactification ownership and descent references must be reconciled together; the report does not claim to install C4/D5/S5 corrections. |
| /12 | Handoff retained: enhanced sheaf statements /58–/61 require the enhanced owner, not ordinary D0 before that owner. |
| /13 | Handoff retained despite omission from FIX #5703's enumerated list: both integral Part II ID collisions, including the Hecke/shtuka collision, and the pre-adic import need reconciliation. |
| /14 | Excluded source-routing action retained: R2's nondiscrete/nonnoetherian formal models cannot be replaced by F0's noetherian models. No new theorem is needed in these deliverables. |
| /15 | Existing A0 analytic restriction retained and baseline boundary checked; RS-05's missing decision-record content remains outside scope. |
| /16 | Handoff retained: the Div¹ presentation over the finite-residue base uses E; the unramified-completion variant belongs after the appropriate base restriction. |
| /17 | Handoff retained: properness and cohomological smoothness follow their later C4/S5 suppliers, rather than becoming inputs to the early untilt construction. |
| /18 | Handoff retained: RF0's crystalline end and the named bundle/AI consumers require that owner's period-ring geometry. |
| /19 | Handoff retained: BKF full faithfulness is distinct from essential surjectivity and its later curve/classification inputs. |
| /20 | Handoff retained: rational B_dR and relative completion serve distinct roles and need the coefficient-qualified comparison. |
| /21 | Handoff retained: the VB/RF ordering blocker remains to evaluate against RS-20; the verifier did not certify the proposed split's optimality. |
| /22 | Handoff retained: preserve T2→S3 and the verifier's cycle qualification instead of installing the original ownership reversal unchanged. |
| /23 | Handoff retained: completed-cohomology comparisons belong to the actual TC.2/HigherHida comparison suppliers, not T4–T6's different subjects. |
| /24 | Handoff retained: early primitive/log-primitive interfaces must precede their CP.3/P8 consumers without a reverse dependency cycle. |
| /25 | Handoff retained: local p-divisible classification must precede global consumers, with a reconciled shared prismatic Dieudonné owner. |
| /26 | Handoff retained: the early general BT₁ Hasse/LF/Hodge–Tate supplier needs specialized elliptic, Hilbert and boundary adapters. |
| /27 | Outside the fix's assigned list: derived splitting/direct-summand routing is not a completed correction here. |
| /28 | Outside the fix's assigned list: old P7 source locators still need their own review; fresh checking of the two new towers does not certify all old P7 nodes. |
| /29 | Outside the fix's assigned list: the obsolete AdicSpaces baseline/import and duplicate-sheafiness claims require their broader owner audit. |
| /30 | Outside the fix's assigned list: F0's anchor dependency is not corrected or accepted by this scoped R5 review. |
| /31 | Outside the fix's assigned list: early ramified-Witt ownership remains a shared VB0/GS supplier action. |
| /32 | Outside the fix's assigned list: T1's dangling C0/H0 reference is not repaired in these files. |

The explicit excluded-job routing remains in the third-round fixes report.
No excluded packet, paper extraction, restructuring result or atlas data was
edited. No source passages or excerpts were added.

## Evidence and checks

Public source copies read afresh on 9 October 2026:

| Source | Checked locators | SHA-256 |
| --- | --- | --- |
| [Česnavičius v4](https://arxiv.org/pdf/1711.06456v4) | Lemma 4.7 p. 8; Lemmas 5.1–5.2 and proofs pp. 11–12 | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` |
| [Berkeley Lectures](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), 27 March 2020 | §§6.2.5–6.2.11 pp. 45–47; §§6.3.1–6.3.4 pp. 47–48 | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| [Étale cohomology of diamonds v4](https://arxiv.org/pdf/1709.07343v4) | §§3.13–3.17 pp. 17–18; Definition 5.7 p. 24/Theorem 5.8 p. 25; Proposition 6.4(iv) pp. 27–28; Proposition 7.23 pp. 38–39; Proposition 9.3 p. 44 | `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |

Baseline pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`;
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed library
coverage audit has no layer entries for these three roadmaps; this absence is
not evidence that a carrier is absent. Actual pinned declarations were read
for the affected regular-local and analytic-locus boundaries.

Read the complete current upstream AdicSpaces and AlgebraicVectorBundles
roadmaps before writing, at roadmap commit
`de435a569d325b365a30fe83269ce34674eaea80`. The former already owns base Huber
and affinoid analytic-locus machinery; the latter plans scheme bundles rather
than these analytic R5 objects. Searched current roadmap suggested files and
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` for the changed
perfectoid/sousperfectoid/tower interfaces. This focused overlap check supplies
no justification to re-plan the existing carriers or to delete the recorded
missing tower interfaces. Neither read-only tree was built or modified.

- The stock blueprint checker, explicitly using the pinned declaration index,
  reports **0 errors and 0 warnings** for each packet: P0 326 nodes, AEG 153,
  ASII 537. No claim is made to have freshly read all 325/177/510 inherited
  baseline records respectively.
- The combined prerequisite graph is acyclic: 1,016 packet nodes and 1,852
  vertices counting external node/stage/baseline leaves. Outside inputs are
  boundary leaves, so this is not a full assembled-atlas cycle certificate.
  Mandatory P1 ancestry, retained P0 deformation/DD.0, no AEG Q4 input,
  analytic-locus presence, the R5 closure and six reader/index comparisons
  pass the focused checks described above.
- Ran `lean-check` sequentially on all three issue-named suggested files.
  Each exited **0**: P0 1,285, AEG 361 and ASII 912 warnings, all declarations
  using `sorry`; no errors or other warnings. Checked available memory before
  compiling. The runner's Mathlib commit matches the pin, and all 5,477 Tau
  Ceti source files match the pinned source tree byte for byte. The previous
  missing-object failures are historical; this run reached elaboration.
  No build, dependency update, cache download or language server was started.
- Intake file checks and `git diff --check` pass. All nodes, baselines,
  source/version/issue records, coverage, APIs, tests and planets are unchanged.
  The three previous top-level reviews are appended unchanged to their
  respective `reviewHistory`; only the current verdicts are replaced.

## Completion boundary and corrections made

The review corrects the stale current validation account by recording successful
native elaboration and distinguishing it from omitted tower signatures. No
mathematical edits were needed for the third-round synchronization. Updated
only the three review objects/history, this report and the handoff.

Issue #5704 authorizes three packets and three suggested files. Its current
`queue.json` entry instead requires 23 packets and 23 suggested files, plus
this report. `issues.deliverables_complete` checks the current job's reviewer
on every listed packet, even when its verdict is needs_changes. Thus the three
scoped verdicts finish the issue's stated review, but cannot satisfy the
broader queue predicate. The 20 excluded packets have not been relabelled as
reviewed. The handoff records the required maintainer scope reconciliation;
this is the reason the current intake may treat the PR as a checkpoint.
