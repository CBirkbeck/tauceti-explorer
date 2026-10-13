# Current checkpoint: Codex codex-EOSC2v, 13 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input commit `4490514872d8f031b22a352370bb5e6a47501ea3`;
branch `codex-EOSC2v-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6157342663)
confirms claimant comment `6157340268`. This session did none of the author
fixes or earlier reviews. One issue claimed; no second job.

**Blocked checkpoint.** The prior handoff's orchestration repair remains
uninstalled. Reread #5704 after claim confirmation and fetched #6519 afresh.
The issued lists and the stock completion function give:

| Job | Issued outputs / packets | Queue outputs / packets | Completion, issued / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 23 / 11 | true / false |

Both ordered issued lists equal their historical queue assignments at
`c69e5b6c9` and `888f12f5c9`. Every queued output exists. The #6519 queue has
changed since the preceding checkpoint, from ten packets to eleven; it still
conflicts with its issued three-packet scope.

Read `issues.deliverables_complete` and reran the preserved read-only
completion-collision reproduction. Issued scopes return `[false, true]`;
restoring #5704's archived P0 and ASII reviews only in memory returns
`[true, false]`. The function consults only current top-level reviews.
Replacing those reviews would transfer the completion failure to #6519.

Reran all ten assertions in the preserved assessment-bound history fixture.
The candidate preserves current top-level verdicts and accepts the archived
review only with a matching scoped assessment. Its tests reject expanded
scopes and invalidate that historical fallback on changed mathematics,
suggested files, output scope, mismatched digests and nonverdicts.
These in-memory cases are regression evidence for a repair, not an installed
completion mechanism. Source and reader inputs still need an explicit
assessment-binding policy; unbound legacy review history must not count.
The fixture also verifies that all three assigned packets, excluding only
`review` and `reviewHistory`, and every byte of their suggested files are
unchanged from the scoped review merge `331007b5e`.

Fresh stock blueprint checks, using the configured declaration index, report
**zero errors and warnings** for P0 (326 nodes), AEG (153) and ASII (537).
No link map or restructuring proposal is assigned. These are structural
checks; this continuation issues no fresh mathematical verdict or source or
baseline-statement audit. No Lean compilation ran for these documentation
changes. Earlier elaborations retain their attribution and their limitation:
the missing P7 tower signatures and tests were not elaborated.

WORKERS.md restricts edits to issue-named files and scratch space. The queue,
generator, completion function and generated review prompt are outside this
assignment; all four also fail `intake.ALLOWED`. Only this report's current
checkpoint and the handoff change. The earlier finding dispositions and
runnable fixtures below remain intact. Resume after an authorized repair
reconciles issued scopes, preserves them through regeneration and allows both
content-bound scoped reviews to finish together. Repeated review dispatch
cannot resolve the excluded orchestration defect.

---

# Archived checkpoint: Codex codex-OXxmHe, 11 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input and independently fetched GitHub main:
`8bc06a21c0192ff9ad96ce3c3c63bfa0a9edfc4a`;
branch `codex-OXxmHe-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6108582954),
confirming claimant comment `6108581908`. This session did none of the author
fixes or earlier reviews. It continues `codex-yEUnDK`, claims one issue, and
will stop after submitting this checkpoint.

**Blocked checkpoint.** The repair gate in the preceding handoff remains
unmet on current main. Fresh post-confirmation issue bodies, the local queue
and the unmodified completion function reproduce both conflicts:

| Job | Issued outputs / packets | Queue outputs / packets | Completion, issued / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 31 / 15 | true / false |

Both ordered issued output lists equal their historical queues at
`c69e5b6c9` and `888f12f5c9`, respectively. Every queued output exists.
The issue body was reread after claim confirmation; the assignment is still
three packets and three suggested files, plus this report.

Read `issues.deliverables_complete`: review completion uses current top-level
verdicts and does not consult assessment history. P0 and ASII currently name
#6519; AEG names #5704. Reran the preserved read-only collision fixture below:
issued scopes yield `[false, true]`, while substituting #5704's archived P0
and ASII verdicts only in memory yields `[true, false]`. Replacing current
verdicts would transfer the failure to the other issued review. The expanded
queue remains incomplete independently of that collision.

Fresh `check_blueprint.py` checks with the configured pinned declaration index
pass with **zero errors and warnings**: P0 326 nodes, AEG 153, ASII 537.
No assigned link map or restructuring proposal needs validation. These are
structural checks, not a fresh mathematical or baseline-statement audit.
No Lean compiler ran because the blocked continuation changes documentation
only. Earlier mathematical dispositions, source checks and qualified successful
elaborations below retain their original attribution. No new verdict is issued.
The earlier generator and assessment fixtures were not rerun in this session.

WORKERS.md restricts edits to issue-named deliverables and scratch space.
The required repair paths `queue.json`, `make_queue.py`, `issues.py` and this
job's generated prompt are outside the assignment; fresh checks also show
that each fails `intake.ALLOWED`. Only this report's current checkpoint and
the handoff change. Packet contents, review metadata and suggested files are
untouched. The detailed finding dispositions and runnable reproductions below
remain available to an authorized maintainer repair.

Before another worker is assigned, reconcile both issued scopes, preserve
content-bound historical completion alongside current promotion reviews, and
verify the two jobs together through stable regeneration. Repeated dispatch
of this issue cannot repair the excluded orchestration code. The handoff lists
the concrete resume conditions.

---

# Archived checkpoint: Codex codex-CLBrB6, 11 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `9ed13b38327bb8500c9e4c307e8f08979a7a04d1`;
branch `codex-CLBrB6-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6108234434).
Continues `codex-SvKnTK`; this session did none of the author fixes or prior
reviews and claimed no second issue.

**Blocked checkpoint.** Independent live-scope and completion checks confirm
that the resumption gate in the previous handoff has not been met. The issued
#5704 scope has seven outputs and three packets; its queue scope has 47
outputs and 23 packets. #6519 has seven issued outputs and three packets,
versus 31 queued outputs and 15 packets. Both live lists exactly match their
historical queues at `c69e5b6c9` and `888f12f5c9`. All queued files exist.

The stock completion function returns `[false, true]` for the two issued
scopes and false for both queue scopes. The preserved read-only collision
fixture returns `[true, false]` after restoring #5704's archived reviews only
in memory. Overwriting the later verdicts therefore cannot finish both jobs.
All ten assessment-history regression assertions pass, including invalidation
on changed mathematics, suggested files, scope and digests. That fixture also
confirms the three packets' mathematical content and all suggested-file bytes
are unchanged from `331007b5e`. These results reproduce the blocker; none of
the candidate substitutions was installed.

Fresh stock blueprint checks, using the configured pinned declaration index,
report zero errors and warnings for P0 (326 nodes), AEG (153) and ASII (537).
No assigned link map or restructuring proposal needs checking. This
continuation performs no fresh source audit or Lean compilation and issues
no mathematical verdict. The archived per-finding review and its attributed
successful elaborations remain qualified as before, including P0's unresolved
almost-category comparisons, tower interfaces and omitted P7 signatures.

WORKERS.md says “Edit only the files the issue names, plus your own scratch
space.” The queue, generator, completion function and generated prompt are
outside this assignment and each fails `intake.ALLOWED`. Only this report
and the handoff change. Resume after the maintainer reconciles issued scopes
and establishes content-bound historical completion; the paired fixtures
below provide the required regression evidence. Repeating the mathematical
review does not resolve this assignment conflict.

---

# Archived checkpoint: Codex codex-SvKnTK, 11 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `b3576ca2efde68ac43a54554771352510420790b`;
branch `codex-SvKnTK-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6108143835).
This session did none of the author fixes or previous reviews. It continues
`codex-iJ9Di6`, with one claim and no second job.

**Blocked checkpoint.** Fresh live issue scopes and the stock completion
function reproduce the assignment and review-attribution conflict. Resolving
it requires files outside the issue's authorized deliverables. This session
issues no new independent mathematical verdict.

| Job | Issued outputs / packets | Queue outputs / packets | Stock completion, issued / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 31 / 15 | true / false |

Both freshly fetched issued lists exactly match their historical queues at
`c69e5b6c9` and `888f12f5c9`. All queued outputs exist. The completion function
reads only current top-level reviews: P0 and ASII identify #6519, while AEG
identifies #5704. The preserved collision fixture returns `[false, true]`;
restoring #5704's archived reviews only in memory returns `[true, false]`.
Replacing those reviews would transfer the failure to the other issued job.

Reran all three preserved read-only fixtures. The generator's eight cases
pass 4/8 stock, 6/8 with the later-only candidate, and 8/8 with the two-site
candidate. All ten assessment-history assertions pass, including rejection
of changed mathematics, changed suggested files, altered scope, mismatched
digests and nonverdicts. The assessment fixture confirms that the three
packets, excluding review metadata, and every suggested-file byte are
unchanged from `331007b5e`. All candidate changes remain in memory; unbound
legacy review history is not a valid completion repair.

Fresh stock blueprint checks, using the configured pinned declaration index,
report **zero errors and warnings** for P0 (326 nodes), AEG (153), and ASII
(537). No assigned link map or restructuring proposal needs validation.
No Lean compiler or fresh source audit ran in this continuation. The last
fresh sequential elaborations are attributed to `codex-iJ9Di6` in
[#8854](https://github.com/CBirkbeck/tauceti-explorer/pull/8854): exit 0 for
all three unchanged files, with only admitted-proof warnings. Compilation
still does not cover the missing P7 tower signatures and tests. The archived
source-qualified mathematical dispositions below remain their authors' work.

WORKERS.md restricts edits to issue-named deliverables. Queue, generator,
completion-function and generated-prompt paths are outside this issue and
all fail `intake.ALLOWED`. Only this report and the handoff change. The
maintainer must reconcile issued scopes and assessment attribution through
an authorized repair, test both jobs together and regenerate twice before
redispatch. No current review, review history, packet mathematics, suggested
file, label or issue state was changed by hand.

---

# Archived checkpoint: Codex codex-OyLXWL, 11 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `517d1829d0fc041f39f5b88fd54e5ba8459ba55c`;
branch `codex-OyLXWL-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6107928215).
This session wrote none of the author fixes or preceding reviews and claimed
no second issue. It continues the `codex-XBKxEG` handoff.

**Blocked checkpoint.** Fresh checks reproduce the unresolved assignment and
review-attribution conflict. The mathematical review and runnable fixtures
below retain their original attribution. This continuation changes only this
report and the handoff, without issuing new mathematical verdicts.

| Job | Live outputs / packets | Queue outputs / packets | Completion, live / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 31 / 15 | true / false |

Both freshly fetched issue output lists exactly match the historical queues
at `c69e5b6c9` and `888f12f5c9`, respectively. Every current queue output
exists. The stock completion function reads only current top-level reviews:
P0 and ASII identify #6519, while AEG identifies #5704. The read-only collision
fixture returns `[false, true]`; restoring #5704's archived reviews only in
memory returns `[true, false]`. Replacing verdicts therefore transfers the
failure rather than resolving both assignments.

Reran all three preserved fixtures. The generator's eight cases pass 4/8
stock, 6/8 with the later-only candidate, and 8/8 with the two-site candidate.
All ten assessment-history cases pass, including invalidation for changed
mathematics, changed suggested files, altered scope and invalid verdicts.
The fixture also confirms packet content excluding review metadata and all
three suggested-file byte sequences equal `331007b5e`. Candidate repairs
remain in memory; no production queue, generator or completion code changed.

The stock blueprint checker, using the configured pinned declaration index,
reports **zero errors and warnings** for P0 (326 nodes), AEG (153 nodes), and
ASII (537 nodes). No link map or restructuring proposal is assigned. No fresh
source audit or Lean compilation ran; the unchanged files' earlier elaboration
results and the omitted P7 signatures retain their original qualifications.

WORKERS.md's issue-path restriction applies to this assignment. The necessary
queue, generator, completion-function and generated-prompt paths are outside
its deliverables and each fails `intake.ALLOWED`. The maintainer must reconcile
issued scopes and assessment attribution through an authorized repair, then
verify both jobs together and regenerate twice before redispatching this job.
The handoff specifies that resumption gate. No label or issue state was changed
by hand.

---

# Archived checkpoint: Codex codex-i7wp9f, 11 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `3bb796f9d239e9568caaf90e1f4c18fe2bfcb2ab`;
branch `codex-i7wp9f-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6107074305).
This session did none of the author fixes or earlier reviews.

**Blocked checkpoint.** Fresh checks confirm that the existing scope and
review-attribution conflict remains. The assigned mathematical review is
already recorded below. This continuation adds no mathematical verdict and
changes only this report and its handoff.

| Job | Live outputs / packets | Queue outputs / packets | Completion, live / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 31 / 15 | true / false |

Both live deliverable lists match the historical queues at `c69e5b6c9` and
`888f12f5c9`. Every current queue output exists. The stock completion predicate
still reads only current top-level reviews. P0 and ASII currently identify
#6519, while AEG identifies #5704. The report's read-only collision fixture
returns `[false, true]`; restoring #5704's archived reviews only in memory
returns `[true, false]`. Replacing those current reviews therefore cannot
finish both jobs. No review was replaced.

Reran the preserved generator fixture: stock 4/8, later-round-only candidate
6/8, two-site candidate 8/8. All ten assessment-bound history assertions pass.
The assessment fixture also confirms that the three packets' mathematical
content and the suggested files equal the earlier review merge `331007b5e`.
All candidates and hypothetical metadata changes remained in memory.

The stock blueprint checker, using the existing 316,810-record pinned index,
reports zero errors and zero warnings for all three packets (326, 153 and
537 nodes). No suggested file changed, and no Lean compiler or fresh source
audit ran. Earlier source checks and successful elaborations retain their
original attribution and qualifications.

The necessary queue, generator, completion-function and generated-prompt
paths are outside the live issue's seven deliverables and all fail
`intake.ALLOWED`. No repair is possible within this assignment. The maintainer
must restore issued scopes, preserve them during regeneration, and establish
content-bound historical completion without replacing promotion verdicts.
The existing fixtures below specify checks for both jobs together and for
later scoped reviews; assessed source and reader inputs still need a policy.
The handoff records where to resume. One issue was claimed; no second job.

---

# Archived checkpoint: Codex codex-atPpUi, 11 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `1c714a0498c1a1f857f214636c180d9d319d37fc`; branch `codex-atPpUi-review-padic-fixes`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6106832351).
This session wrote none of the author fixes or earlier reviews.

**Blocked checkpoint.** The assigned mathematical review is already recorded
below, and its assessed content is unchanged. Fresh checks confirm the same
scope and attribution conflict. This continuation changes only this report
and its handoff; it adds no mathematical verdict or source-audit claim.

| Job | Live outputs / packets | Queue outputs / packets | Stock completion, live / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 31 / 15 | true / false |

Fresh live issue bodies exactly match the historical output lists at
`c69e5b6c9` and `888f12f5c9`, respectively. Every queue output exists.
The preserved collision fixture returns `[false, true]` for those live
assignments and `[true, false]` after restoring #5704's archived verdicts
only in memory. Consequently, neither missing files nor P0's negative verdict
causes the block. Overwriting current reviews would transfer the failure.

The existing eight generator cases pass 4/8 with stock code, 6/8 with the
later-round-only candidate, and 8/8 with the two-site candidate. All ten
assessment-bound history assertions pass. The runnable fixtures remain below;
all candidate substitutions and assessments were in memory. No production
repair was installed. Parsed packet objects excluding only top-level review
metadata, and every byte of the three suggested files, equal `331007b5e`.

All three stock blueprint checks pass with zero errors and zero warnings,
using the configured 316,810-record pinned declaration index: P0 326 nodes,
AEG 153, ASII 537. No Lean compiler ran in this continuation. The previous
workers' successful elaborations retain their original attribution; omitted
P7 declarations and the recorded mathematical gaps remain unresolved.

The older [draft checkpoint #8206](https://github.com/CBirkbeck/tauceti-explorer/pull/8206)
also remains open, with its submission check successful. Its queue-only repair
proposal predates the current shared-review collision: restoring output lists
alone now leaves #5704 incomplete. The paired completion and assessment-bound
history fixtures are therefore necessary acceptance checks for the repair.
This run neither modifies that other session's branch nor treats its green
submission check as evidence that dispatch has been repaired.

WORKERS.md restricts edits to issue-named files; queue, generator, completion
logic and prompt paths also fail `intake.ALLOWED`. Expanded repair scope was
requested during this run; no response was received before this checkpoint.
The maintainer must restore both author/review scopes, preserve issued
assignments on regeneration, and establish content-bound historical review
attribution without replacing current promotion verdicts. Verify both jobs
simultaneously, including later scoped reviews, and regenerate twice. Arrange
an authorized submission route for the excluded repair files. The existing
history candidate still requires a policy for assessed sources and readers.
No second job was claimed.

---

# Archived checkpoint: Codex codex-lKSK2t, 11 October 2026

Refs [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704).
Input `a51b147164c4e9cd0643f8039a45f10f1b22423f`; branch `codex-lKSK2t-review-5704`.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6106723698).

**Blocked by assignment and review-attribution conflicts.** The three-packet
mathematical review is already recorded below. This continuation confirms the
external blocker; it does not repeat that review or supply new mathematical
verdicts. Only this report and the handoff change.

Freshly parsed both live issue bodies and compared their output lists with
historical queues: #5704 matches `c69e5b6c9`; #6519 matches `888f12f5c9`.

| Job | Live outputs / packets | Queue outputs / packets | Stock completion, live / queue |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | false / false |
| #6519 | 7 / 3 | 31 / 15 | true / false |

Every queue output exists. The preserved read-only collision fixture returns
`[false, true]` for the live scopes and `[true, false]` after restoring #5704's
archived verdicts in memory. Thus replacing verdicts would move the failure
between jobs. The current P0 and ASII verdicts identify #6519; AEG identifies
#5704. All current reviews and histories are preserved.

Reran the existing generator fixture: stock 4/8, later-round-only candidate
6/8, two-site candidate 8/8. Reran the assessment-bound history fixture: all
ten assertions pass, including content, signature, scope and verdict rejection
cases. These candidates remain in-memory demonstrations, not installed repairs.
The three packets excluding only review metadata, and every byte of their
suggested files, still equal `331007b5e`. Stock blueprint checks, using the
316,811-record declaration index, report zero errors and zero warnings for
P0 (326 nodes), AEG (153) and ASII (537). No Lean compilation or fresh source
audit was performed; earlier evidence retains its original attribution.

The required queue, generator, completion-function and generated-prompt paths
are outside the issue and fail `intake.ALLOWED`. There is no permitted repair
within this assignment. The maintainer must restore and preserve the original
scopes, establish content-bound historical review attribution, regenerate twice,
and verify that both scoped reviews remain complete together. The candidate's
source/reader assessment limitation remains unresolved. The handoff gives the
exact authorized output list and resumption conditions. This is an external
block, not a time limit; no second issue was claimed.

---

# Archived checkpoint: Codex codex-yV48XO, 11 October 2026

Issue [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704),
input `20f5269874fb14bdf618f0c984e5b448e682acb0`;
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6106554331).
This is a **blocked checkpoint**. The assigned three-packet mathematical
review already exists below. This continuation verifies its administrative
blockers and adds a reproducible candidate for preserving assessed review
history. It adds no mathematical verdict and changes no packet or suggested
file. One issue was claimed; no second job was taken.

## Fresh evidence

The output lists were parsed from the live issue bodies and independently
compared with the historical queues at `c69e5b6c9` and `888f12f5c9`.

| Job | Live outputs / packets | Queue outputs / packets | Additional packets |
| --- | --- | --- | --- |
| #5704 | 7 / 3 | 47 / 23 | 20 |
| #6519 | 7 / 3 | 31 / 15 | 12 |

Every queue output exists. The unmodified completion function produces
`[false, true]` for the two original issue scopes and `[false, false]` for the
expanded queue scopes. Restoring #5704's archived verdicts only in memory
produces `[true, false]` for the original scopes. Thus overwriting current
reviews would transfer the failure to #6519. No verdict was overwritten.

The three assigned packets, after excluding only `review` and `reviewHistory`,
equal their mathematical objects at `331007b5e`. All three suggested files
are byte-identical to that commit. This comparison preserves the earlier
review's evidence; it does not constitute a fresh source audit. Current
Perfectoid P0 `needs_changes` and the scoped AEG/ASII acceptances retain all
qualifications recorded below.

The stock blueprint checker reports zero errors and zero warnings for P0
(326 nodes), AdicEtaleGeometry (153) and AdicSpacesPartII (537). The existing
eight-case generator fixture again gives 4/8 passing stock cases, 6/8 for the
later-round-only candidate and 8/8 for the two-site scope-preservation
candidate. No link map or restructuring proposal is assigned to this review.
No Lean file changed or was compiled in this continuation; earlier successful
elaborations remain attributed to the workers who ran them.

## Content-bound review-history candidate

The prior checkpoint requires content and scope safeguards before an archived
verdict can count. The new fixture below supplies an executable candidate for
that fallback. It binds a historical review to its exact output list and to
SHA-256 digests of every packet and suggested file in that list. Packet hashes
exclude only top-level review metadata; suggested-file hashes include every
byte. The report remains an existence requirement rather than a hashed input,
so adding a continuation to the report does not create a self-referential hash.

For #5704, binding is performed only after checking assessed mathematical
content against its earlier review merge at `331007b5e`. #6519's current
verdicts are bound to the current scoped files. Both bindings are made only in
memory. Legacy history without such an assessment is ignored. A matching
historical verdict completes review work; it does not promote a packet or
replace the current verdict used by promotion.

All ten fixture assertions pass:

| Scenario | #5704 | #6519 |
| --- | --- | --- |
| Bound original scopes, candidate | true | true |
| Same bound histories, stock predicate | false | true |
| Expanded queue scopes | false | false |
| Move a bound current verdict into history | true | true |
| Change a packet's mathematical statement | false | true |
| Add unrelated review metadata | true | true |
| Change a suggested file | false | true |
| Narrow #5704's output list | false | true |
| Corrupt #5704's archived digest | false | true |
| Replace #5704's archived disposition with a non-verdict | false | true |

The last six assertions exercise invalidation and metadata stability. They
preserve stock treatment of an applicable top-level review, so #6519's `true`
in the changed-content cases is compatibility behavior, not a new assessment
of changed mathematics. This candidate deliberately addresses historical
completion only. It is not a complete migration, a whole-generator test, an
assessment of omitted supplier mathematics, or an authorization to stamp
arbitrary historical records. Review producers, archival handling and
backfilling must establish what each review actually assessed; the fixture's
content equality is evidence for this specific historical comparison only.
The owner must also decide how to record source inputs and any assessed
reader files outside a review's editable output list.

## Required maintainer action

[WORKERS.md](../WORKERS.md) says: "Edit only the files the issue names,
plus your own scratch space." `make_queue.py`, `issues.py`, `queue.json`
and the generated prompts are outside this assignment; all four classes of
path fail `intake.ALLOWED`. The repair needs explicit expanded scope and a
maintainer submission route. Those were requested during this run; no
response or authorization was received before this checkpoint was prepared.

Restore both author and review scopes for #5704 and #6519, preserve issued
assignments during regeneration, and bind eligible historical assessments
using established content evidence. Check both original scopes together
before and after another legitimate scoped review. Regenerate twice; verify
stable output lists, prompts, prerequisites and runtime state. Arrange issue
synchronization through the maintainer route. Newly available owner work needs
its own scoped assignments. Workers must not change labels or close issues.

Only this report and its handoff change. The next continuation should resume
at that repair, using the executable candidate below and the existing
scope-preservation fixture, rather than repeat the completed packet review.
All mathematical gaps and excluded-owner handoffs below remain intact.

<details><summary>Read-only assessment-bound history regression fixture</summary>

Run from the repository root. All substitutions, metadata bindings and test
mutations occur in memory. It invokes a candidate derived from the actual
stock completion function and writes no repository file. The assertions
were run against this checkpoint's input commit.

```python
import ast, copy, hashlib, json, subprocess, sys
from pathlib import Path
from unittest.mock import patch
sys.dont_write_bytecode = True
sys.path.insert(0, 'research/blueprint')
import issues
ROOT = Path.cwd()
FIRST = 'REV-FIX-RT-AREA-padic-1~3'
SECOND = 'REV-FIX-RT-AREA-padic-2~4'
queue = {j['id']: j for j in json.loads(
    (ROOT / 'research/blueprint/queue.json').read_text())['jobs']}
jobs = []
for jid, commit in [(FIRST, 'c69e5b6c9'), (SECOND, '888f12f5c9')]:
    old = json.loads(subprocess.check_output(
        ['git', 'show', commit + ':research/blueprint/queue.json'], text=True))
    old = {j['id']: j for j in old['jobs']}
    job = copy.deepcopy(queue[jid])
    job['outputs'] = old[jid]['outputs']
    assert len(job['outputs']) == 7
    jobs.append(job)

# Proposal: metadata-only changes do not invalidate a mathematical assessment.
# Everything else in the JSON and every byte of Suggested.lean is assessed.
def digest(path, root):
    file = root / path
    if file.suffix == '.json':
        data = json.loads(file.read_text())
        for key in ('review', 'reviewHistory'):
            data.pop(key, None)
        content = json.dumps(data, sort_keys=True, ensure_ascii=False,
                             separators=(',', ':')).encode('utf-8')
    else:
        content = file.read_bytes()
    return hashlib.sha256(content).hexdigest()

def assessed_paths(job):
    return sorted(p for p in job['outputs'] if
        Path(p).parent.name in ('packets', 'links', 'keydefs', 'restructure')
        and p.endswith('.json') or p.startswith('research/blueprint/suggested/'))

def assessment(job, root):
    return {'outputs': sorted(job['outputs']),
            'sha256': {p: digest(p, root) for p in assessed_paths(job)}}

def review_complete(path, job, root):
    data = json.loads(path.read_text())
    def belongs(review):
        return (isinstance(review, dict) and
                review.get('reviewer') == 'independent-review-' + job['id'] and
                review.get('status') in ('accepted', 'needs_changes', 'rejected'))
    # Keep existing behavior for top-level verdicts. Only the archived fallback
    # is proposed here; this is not a complete orchestration migration.
    if belongs(data.get('review')):
        return True
    expected = assessment(job, root)
    return any(belongs(r) and r.get('assessment') == expected
               for r in data.get('reviewHistory', []))

# Substitute only the relevant block of the real completion function in memory.
node = next(n for n in ast.walk(ast.parse(Path(issues.__file__).read_text()))
            if isinstance(n, ast.FunctionDef) and n.name == 'deliverables_complete')
code = ast.unparse(node)
old = "reviews = [json.loads(path.read_text()).get('review') or {} for path in reviewed]\n                    return all((review.get('reviewer') == f\"independent-review-{job['id']}\" and review.get('status') in ('accepted', 'needs_changes', 'rejected') for review in reviews))"
assert old in code
code = code.replace(old, 'return all(review_complete(path, job, root) for path in reviewed)')
env = dict(vars(issues), review_complete=review_complete)
exec(compile(code, '<assessment candidate>', 'exec'), env)
candidate = env['deliverables_complete']

def results(function):
    return [function(j) for j in jobs]
assert results(issues.deliverables_complete) == [False, True]
assert results(candidate) == [False, True]  # Unbound legacy history cannot count.

# Bind FIRST only after separately verifying its assessed mathematics against
# the old review merge. Bind SECOND only to its current assessed files.
for p in assessed_paths(jobs[0]):
    file = ROOT / p
    previous = subprocess.check_output(['git', 'show', '331007b5e:' + p])
    if p.endswith('.json'):
        now, then = json.loads(file.read_text()), json.loads(previous)
        for data in (now, then):
            for key in ('review', 'reviewHistory'):
                data.pop(key, None)
        assert now == then, p
    else:
        assert file.read_bytes() == previous, p

virtual = {}
for job in jobs:
    bound = assessment(job, ROOT)
    for p in assessed_paths(job):
        if not p.endswith('.json'):
            continue
        path = ROOT / p
        data = virtual.setdefault(path, json.loads(path.read_text()))
        for r in [data.get('review', {})] + data.get('reviewHistory', []):
            if r.get('reviewer') == 'independent-review-' + job['id']:
                r['assessment'] = copy.deepcopy(bound)

read_text, read_bytes = Path.read_text, Path.read_bytes
lean_changes = {}
def virtual_text(path, *args, **kwargs):
    if path.resolve() in virtual:
        return json.dumps(virtual[path.resolve()])
    return read_text(path, *args, **kwargs)
def virtual_bytes(path, *args, **kwargs):
    return lean_changes.get(path.resolve(), read_bytes(path, *args, **kwargs))

cases = []
def check(name, expected, fn=candidate, selected=jobs):
    got = [fn(j) for j in selected]
    assert got == expected, (name, got, expected)
    cases.append({'case': name, 'complete': got})

with patch.object(Path, 'read_text', virtual_text), patch.object(Path, 'read_bytes', virtual_bytes):
    check('bound original scopes', [True, True])
    check('stock still collides', [False, True], issues.deliverables_complete)
    check('expanded scopes rejected', [False, False], selected=[queue[FIRST], queue[SECOND]])
    p0 = ROOT / 'research/blueprint/packets/PerfectoidSpaces--P0.json'
    saved = copy.deepcopy(virtual[p0])
    archived = next(r for r in reversed(virtual[p0]['reviewHistory'])
                    if r['reviewer'] == 'independent-review-' + FIRST)
    virtual[p0]['reviewHistory'].append(virtual[p0]['review'])
    virtual[p0]['review'] = copy.deepcopy(archived)
    check('later review can move to history', [True, True])
    virtual[p0] = copy.deepcopy(saved)
    virtual[p0]['nodes'][0]['statement'] += ' changed'
    check('mathematical change invalidates archive', [False, True])
    virtual[p0] = copy.deepcopy(saved)
    virtual[p0]['reviewHistory'].append({'reviewer': 'unrelated', 'status': 'accepted'})
    check('unrelated review metadata preserves assessment', [True, True])
    virtual[p0] = copy.deepcopy(saved)
    lean = ROOT / 'research/blueprint/suggested/PerfectoidSpaces--P0.lean'
    lean_changes[lean] = read_bytes(lean) + b'\n-- changed\n'
    check('suggested-file change invalidates archive', [False, True])
    lean_changes.clear()
    altered = copy.deepcopy(jobs)
    altered[0]['outputs'] = altered[0]['outputs'][1:]
    check('narrowed output scope rejected', [False, True], selected=altered)
    for r in virtual[p0]['reviewHistory']:
        if r.get('reviewer') == 'independent-review-' + FIRST:
            r['assessment']['sha256'][str(p0.relative_to(ROOT))] = '0' * 64
    check('mismatched digest rejected', [False, True])
    virtual[p0] = copy.deepcopy(saved)
    for r in virtual[p0]['reviewHistory']:
        if r.get('reviewer') == 'independent-review-' + FIRST:
            r['status'] = 'pending'
    check('nonverdict rejected', [False, True])
print(json.dumps(cases, indent=2))
```

</details>

---

# Archived checkpoint: Codex codex-QmXEhb, 11 October 2026

Issue [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704),
input `bc77f117ef2960db87bcc24331b59fde6d8d38d8`;
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6106431030).
This continuation is a **blocked checkpoint**. It independently reproduces
the scope and attribution failures documented below. It does not add a
mathematical verdict or replace another job's review.

The live issue names seven outputs covering three packets. The queue names
47 outputs covering 23 packets, including 20 extra packets. All queue outputs
exist. The author round still has 78 outputs, compared with its original ten.
For #6519, the live scope has seven outputs and the queue has 31, including
12 extra packets. The unmodified completion predicate gives:

| Inputs | #5704 live scope | #6519 live scope |
| --- | --- | --- |
| Current packet reviews | false | true |
| Restore #5704 reviews only in memory | true | false |

Both expanded queue scopes fail completion. No repository verdict was changed
for this reproduction. Mathematical packet objects, excluding `review` and
`reviewHistory`, and all three suggested files equal their versions at
`331007b5e`.

Fresh stock blueprint checks pass with zero errors and warnings for P0
(326 nodes), AEG (153) and ASII (537). The preserved eight-case generator
fixture reproduces 4/8 passing cases for stock, 6/8 for the later-round-only
candidate and 8/8 for the two-site candidate. This tests a candidate in memory,
not a full regeneration. No Lean file changed or was compiled in this run;
previous successful elaborations remain attributed to their original workers.

[WORKERS.md](../WORKERS.md) requires: "Edit only the files the issue names,
plus your own scratch space." The queue, generator and completion-code paths
are outside the assignment and fail `intake.ALLOWED`. Expanded scope and a
maintainer submission route were requested; no authorization is assumed.
The repair must preserve both jobs' original scopes and review attribution
for the content each review assessed. The existing fixtures and mathematical
follow-ups below remain the concrete repair starting point. Another packet
review cannot resolve these administrative failures.

Only this report and the handoff change. All existing review metadata,
mathematical gaps, supplier handoffs and scoped qualifications are preserved.
A maintainer should keep this assignment out of worker selection until the
repair is installed; workers must not change labels themselves.

---

# Archived checkpoint: Codex codex-SlG5m8, 11 October 2026

Issue [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704),
input `3c1b280982a2481cd37a45e929918db2ecc0623a`;
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6106345902).
This is a **blocked checkpoint**, continuing the preceding handoff. No
manager-priority issue was available; this was the first fallback in the
worker order. This session did none of the author job and claimed no second
job. The earlier mathematical review and every packet verdict remain intact.

Fresh read-only verification confirms both administrative blockers. The live
issue still assigns seven files and three packets, matching the historical
scope at `c69e5b6c9`; the queue assigns 47 files and 23 packets. All queue
outputs exist, but all 20 extra packets name other reviewers. The author
round still has 78 outputs and 23 packets instead of its original ten outputs
and three packets.

The live scope of [#6519](https://github.com/CBirkbeck/tauceti-explorer/issues/6519)
also matches its historical seven outputs at `888f12f5c9`. Its queue instead
assigns 31 outputs and 15 packets. Using the stock completion predicate:

| State supplied to the predicate | #5704 live scope | #6519 live scope |
| --- | --- | --- |
| Current checkout | false | true |
| Restore #5704's archived verdicts only in memory | true | false |

Both expanded queue scopes return false. Consequently, replacing the current
packet reviews would transfer the attribution failure to #6519. This session
made no such replacement. All three mathematical packet objects, excluding
only `review` and `reviewHistory`, and all three suggested files still equal
their versions at `331007b5e`. No new mathematical acceptance is inferred from
that comparison.

Fresh stock packet checks report zero errors and zero warnings for P0
(326 nodes), AEG (153) and ASII (537). Lean was not rerun because no suggested
file changed; earlier elaboration results remain the earlier workers' evidence.
No fresh source audit is claimed. No link map or restructuring proposal is
among this issue's files.

[WORKERS.md](../WORKERS.md) requires: "Edit only the files the issue names,
plus your own scratch space." The required queue, generator, completion-code
and generated-prompt paths are outside that scope and all fail `intake.ALLOWED`.
The existing generator candidate and collision reproduction below remain the
maintainer's starting point. Repair both author/review scopes and preserve
attribution for the content and scope each review actually assessed. Verify
both jobs together, regenerate twice, and synchronize through a maintainer
submission route. Hold this assignment out of worker selection until that
repair is complete; workers must not change labels themselves.

Only this report and its handoff changed. All existing mathematical gaps,
scoped qualifications and excluded-owner actions are preserved below. A
continuation needs no disposable scratch files and should resume at the
administrative repair, rather than repeat the completed mathematical review.

---

# Archived checkpoint: Codex codex-fyvoiO, 11 October 2026

Issue [#5704](https://github.com/CBirkbeck/tauceti-explorer/issues/5704);
input commit `5cbcf764a67eb29027a3af3f4518b483c8f950ea`.
The bot confirmed this session's claim in
[comment 6106045366](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6106045366).
This is a **blocked checkpoint**. The issue's mathematical review is already
recorded below; this continuation identifies an additional completion defect
and preserves both jobs' verdicts. No fresh source audit, mathematical verdict
or Lean compilation is claimed.

## Current evidence supersedes the earlier completion result

The live issue still assigns seven files covering three packets. The generated
queue still requires 47 files covering 23 packets. All required files exist;
all 20 additional packets name other review jobs. Historical author merge
`c69e5b6c9` independently supplies the original ten author outputs and seven
review outputs, and the latter agree exactly, including their order, with the
current issue body. Both queue and generator paths fail `intake.ALLOWED` and
are outside this issue's permitted files.

**The original seven-file scope now also fails completion.** Commit
`f5f5175aca241e538a5607637724f8f7349826b4`, merged through
[#8468](https://github.com/CBirkbeck/tauceti-explorer/pull/8468), appended this
job's PerfectoidSpaces P0 and AdicSpacesPartII verdicts to `reviewHistory`,
then replaced their top-level `review` with
`independent-review-REV-FIX-RT-AREA-padic-2~4`. AdicEtaleGeometry still names
this job. `issues.deliverables_complete` examines only top-level reviews,
so the previous continuations' seven-file completion result is historical.

Fresh evaluations use the unmodified stock predicate and the deliverable
lists parsed independently from the live bodies of #5704 and
[#6519](https://github.com/CBirkbeck/tauceti-explorer/issues/6519):

| Packet review state supplied to the predicate | #5704, seven files | #6519, seven files |
| --- | --- | --- |
| Current checkout | false | true |
| Restore #5704's two archived verdicts in memory | true | false |

The second row changes no repository file. It moves the current verdicts to
history in memory and restores the last archived verdict belonging to this
job. Thus restoring this job's top-level reviewer merely transfers the
completion failure to the other job. Both expanded queue scopes remain
incomplete independently of that collision. An honest `needs_changes`
disposition counts as completed review work; P0's mathematical gaps are not
the cause of either administrative defect.

For all three issue-named packets, removing only `review` and `reviewHistory`
gives JSON objects exactly equal to those at `331007b5e`, the preceding scoped
review merge. All three suggested files are byte-for-byte equal to that
commit's files. The later change therefore displaced review attribution
without changing the mathematical contracts those reviews assessed. This
comparison does not add a new acceptance or reverify their sources.

## Checks and retained verdicts

The stock packet checker reports zero errors and zero warnings for
PerfectoidSpaces P0 (326 nodes), AdicEtaleGeometry (153) and
AdicSpacesPartII (537). The existing read-only AST fixture below reproduces
four passing cases for stock, six for the later-round-only candidate, and
eight for the two-site candidate. These are focused generator tests, not full
regeneration evidence. No suggested declaration changed, so Lean was not
rerun; the archived successful elaborations remain attributed to their
original workers.

P0 retains `needs_changes`, including its root-annihilator/almost-flatness,
almost-elements and field-base comparisons, missing precise tower supplier
interfaces, omitted P7 theorem signatures/tests, and unfinished broader audit.
AEG and ASII retain their scoped acceptances and qualifications. All current
reviews and their histories are preserved, including #6519's newer reviews.
No excluded owner, queue, generator, prompt, reader, atlas or label was edited.

## Required maintainer repair

Restore and preserve both original author and review scopes as described in
the earlier candidate and historical output lists below. Then address the
additional collision: completion must retain each finished scoped review's
attribution when another legitimate review assesses the same packet. An
unconditional acceptance of every archived verdict would be insufficient
after mathematical changes; any historical-review rule must establish which
content and scope the review assessed. In this reproduction the three
mathematical JSON objects and suggested files are demonstrably unchanged.

Verify both #5704 and #6519 together, including regeneration twice, prompt and
prerequisite agreement, runtime-state preservation and completion before and
after a later scoped review. The scope-preservation candidate alone cannot
pass that last acceptance condition. Newly available owner work still needs
separately scoped assignments. The maintainer must arrange the permitted
submission and issue-synchronization route; workers must not change labels.

An expanded-scope question was sent during this run. No repair authorization
has arrived. WORKERS.md's issue-path restriction therefore remains binding.
Only this report and the job's handoff change. The fresh collision evidence
and repair requirements are retained here so that another continuation need
not rediscover the failure or overwrite the newer review.

<details><summary>Read-only completion-collision reproduction</summary>

Run from the repository root. The historical output lists were separately
checked against the two live issue bodies. This fixture uses those same lists
without making network requests or changing any file. Its expected values
describe the input commit of this continuation.

```python
import copy, json, subprocess, sys
from pathlib import Path
from unittest.mock import patch
sys.path.insert(0, 'research/blueprint')
import issues

def historical(commit):
    text = subprocess.check_output(
        ['git', 'show', commit + ':research/blueprint/queue.json'], text=True)
    return {j['id']: j for j in json.loads(text)['jobs']}

first = 'REV-FIX-RT-AREA-padic-1~3'
second = 'REV-FIX-RT-AREA-padic-2~4'
current = {j['id']: j for j in json.loads(
    Path('research/blueprint/queue.json').read_text())['jobs']}
jobs = []
for jid, commit in [(first, 'c69e5b6c9'), (second, '888f12f5c9')]:
    job = copy.deepcopy(current[jid])
    job['outputs'] = historical(commit)[jid]['outputs']
    assert len(job['outputs']) == 7
    jobs.append(job)

def completion():
    return [issues.deliverables_complete(j) for j in jobs]

before = completion()
read = Path.read_text
replacements = {}
for name in ['PerfectoidSpaces--P0', 'AdicSpacesPartII']:
    path = Path('research/blueprint/packets') / (name + '.json')
    packet = json.loads(read(path))
    archived = [r for r in packet['reviewHistory']
                if r['reviewer'] == 'independent-review-' + first][-1]
    packet['reviewHistory'].append(packet['review'])
    packet['review'] = archived
    replacements[path.resolve()] = json.dumps(packet)

def virtual_read(path, *args, **kwargs):
    if path.resolve() in replacements:
        return replacements[path.resolve()]
    return read(path, *args, **kwargs)

with patch.object(Path, 'read_text', virtual_read):
    after = completion()
assert before == [False, True], before
assert after == [True, False], after
print({'current': before, 'restored_in_memory': after})
```

</details>

---

# Archived scope check: Codex codex-Wrws1L, 10 October 2026

Issue #5704; base `15da55e6f65878bbea28010a47d360dbd47cf57c`.
The bot confirmed this session's claim in
[comment 6093026776](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6093026776).
This continuation preserves the completed mathematical review below, including
P0's `needs_changes` verdict and the two scoped acceptances. It makes no fresh
source-audit, mathematical acceptance or Lean-compilation claim.

Fresh checks of the live issue body, current queue and stock intake establish:

- The issue names seven outputs covering three packets; the queue names 47
  outputs covering 23 packets. Every queue output exists.
- `issues.deliverables_complete` returns true with the issue's exact output
  list and false with the unmodified queue. All 20 extra packets carry another
  job's review. The honest P0 verdict is not the completion blocker.
- Intake computes completion from the queue after merge, independently of the
  PR's description. Both queue and generator paths fail its output allowlist.
- The historical queue at `c69e5b6c9` reproduces the original ten author
  outputs and seven review outputs, listed in the handoff below.
- All three stock packet checks pass with zero errors and zero warnings:
  PerfectoidSpaces P0 326 nodes, AdicEtaleGeometry 153, AdicSpacesPartII 537.
- Rerunning the preserved read-only AST regression fixture reproduces all
  eight passing cases for the two-site scope-preservation candidate. Stock
  fails four cases; the later-round-only candidate fails two. This does not
  certify full queue regeneration or authorize applying the candidate.

Requested explicit permission to reconcile the queue scope. No authorization
has arrived. WORKERS.md restricts edits to issue-named files and the handoff,
so this submission is a **blocked checkpoint**, changing only this report and
the handoff. No packet verdict, suggested file, queue, generator, prompt,
atlas record or label is changed. Lean was not rerun because no suggested
file changed and this continuation concerns only the scope blocker; the
earlier successful elaborations remain their original workers' evidence.

The next action is the maintainer repair already specified below: restore
both author and review scopes, preserve published scopes during generation,
and verify stable regeneration and intake synchronization. Repeating the
completed three-packet review cannot resolve this mismatch.

---

# Blocked continuation: Codex codex-B7F2hV, 10 October 2026

Issue #5704; base `e0374256903bf50963674b4ec9ba17807347620e`.
The bot confirmed this session's claim in
[comment 6092681996](https://github.com/CBirkbeck/tauceti-explorer/issues/5704#issuecomment-6092681996).
This continuation preserves the completed mathematical review and all its
verdicts. It adds no source audit or mathematical acceptance claim.

Fresh read-only checks reproduce the existing scope blocker:

| Check | Result |
| --- | --- |
| Live issue deliverables | 7 files, including 3 packets |
| Queue deliverables | 47 files, including 23 packets |
| Every queue output exists | true |
| Stock completion predicate, live issue scope | true |
| Stock completion predicate, unmodified queue | false |
| Extra packets carrying another review job's verdict | 20 of 20 |
| Intake permits queue or generator edits | false for both paths |

The issue outputs were parsed from its live body, rather than reconstructed
from the prior handoff. Both completion evaluations invoked the stock
`issues.deliverables_complete` with the same repository contents; only the
in-memory output list differed. `intake.merge` uses the queue entry after
merge, so changing the submission description cannot make this a complete
job. The permitted repair still belongs to the maintainer.

Fresh stock blueprint checks return **zero errors and zero warnings** for
PerfectoidSpaces P0 (326 nodes), AdicEtaleGeometry (153) and AdicSpacesPartII
(537). No packet or suggested file changed; Lean was not rerun. The earlier
successful elaborations remain their original workers' evidence.

Scope reconciliation was requested during this run. No expanded scope or
repair authorization has been received. This is a **blocked checkpoint**,
changing only this report and the handoff. Before another mathematical worker
continues #5704, restore and preserve its original author/review scopes or
publish a reconciled assignment and submission route. The existing repair
fixture and mathematical follow-ups below are preserved.

---

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
