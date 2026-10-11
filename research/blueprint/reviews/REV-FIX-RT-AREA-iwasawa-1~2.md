# #6217: blocked continuation with an applicable scope-repair patch

Codex — **codex-AatBZG**, 11 October 2026. Input commit:
`ea4eca69090e655ae3fae93bd5ef846d43661f94`.
Claim confirmed in [comment 6106143621](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6106143621).
This session did none of the fixes under review and claimed only this issue.

**The remaining blocker is the disagreement between the issued scope and the
queue.** The live issue names HE.0, its suggested file and this report. The
queue names eleven packet/Lean pairs and the report. All 23 outputs exist.
The actual `issues.deliverables_complete` is false for that queue entry and
true for its historical three-output scope. HE.0 already has this job's
accepted review marker; the other ten packets retain their own review
identifiers. ES.0 additionally retains `needs_changes`. This session adds
no mathematical verdict and changes no packet or Lean file.

## New verification and concrete repair

I reconstructed the two historical round-two output lists from commit
`88f9bcd44`, retaining every other queue field, and prepared the unified patch
below. It applies cleanly to this input tree with `git apply --check`.
It restores the original four fix outputs and three review outputs and uses
the previously proposed guard that preserves every existing successor.
The patch is **a maintainer proposal, not an applied repository change**.

The actual completion predicate passes with the restored review output list.
Both preserved focused regression scripts were rerun against the current
nested helper: six state/trigger fixtures with repeat generation, rejection
reason and absent-successor checks pass, as do the seven original regression
cases. This run did not repeat the earlier full-generator replay or test
GitHub issue refresh; those earlier results retain their attribution below.
Before publishing generated metadata, inspect the wider scheduling effects
reported by the earlier worker and synchronize the issue and queue.

[WORKERS.md](../WORKERS.md) says “Edit only the files the issue names, plus
your own scratch space.” The queue and generator are outside those paths;
`intake.file_problems` also rejects both as outside swarm output paths. A
scope extension was requested from the user. None was received before this
checkpoint was prepared. No automatic approval review was requested or
rejected. The existing issue scope therefore permits only this report and
the required handoff for the blocked continuation.

Current packet check: **zero errors and warnings**; 78 nodes, 24 API items,
18 tests, 43 planets, 13 baseline declarations, 21 gaps and 63 requests.
All eight stages remain planned and none is closed. Lean was not rerun for
these Markdown-only changes; previous successful receipts remain attributed
to their workers. No primary source was fetched or reread in this session.

## Proposed patch for the maintainer

The patch contains only queue metadata and generator code. It contains no
source-document passage, mathematical declaration or private path. The
current scope does not authorize applying it. Once authorized, apply it
against the stated input or refresh its context, run the focused and full
replays below, and reconcile generated prompts and the live issue. Do not
replace unrelated packet review identifiers merely to satisfy completion.

```diff
--- a/research/blueprint/queue.json
+++ b/research/blueprint/queue.json
@@ -80042,45 +80042,9 @@
    ],
    "outputs": [
     "research/blueprint/redteam/RT-AREA-iwasawa-1.fixes-2.md",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.7s.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.7s.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.7s.lean",
-    "research/blueprint/handoff/BP-HeegnerPointEulerSystems--HE.7s~2.md",
     "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
     "research/blueprint/readmes/HeegnerPointEulerSystems--HE.0.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
-    "research/blueprint/handoff/BP-HeegnerPointEulerSystems--HE.0~2.md",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.0.json",
-    "research/blueprint/readmes/GrossZagierAndArithmeticHeights--GZ.0.md",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.0.lean",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/readmes/RankZeroOneBSD--BSD.0.md",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.7.json",
-    "research/blueprint/readmes/RankZeroOneBSD--BSD.7.md",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.7.lean",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.0.json",
-    "research/blueprint/readmes/EulerSystemsAndKolyvaginSystems--ES.0.md",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean",
-    "research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json",
-    "research/blueprint/readmes/GeneralizedHeegnerCycles--GH.0.md",
-    "research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean",
-    "research/blueprint/handoff/BP-GeneralizedHeegnerCycles--GH.0~2.md",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.8.json",
-    "research/blueprint/readmes/GrossZagierAndArithmeticHeights--GZ.8.md",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.8.lean",
-    "research/blueprint/handoff/BP-GrossZagierAndArithmeticHeights--GZ.8~2.md",
-    "research/blueprint/packets/PadicHodgeRegulators--D.1.json",
-    "research/blueprint/readmes/PadicHodgeRegulators--D.1.md",
-    "research/blueprint/suggested/PadicHodgeRegulators--D.1.lean",
-    "research/blueprint/handoff/BP-PadicHodgeRegulators--D.1~2.md",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.8.json",
-    "research/blueprint/readmes/EulerSystemsAndKolyvaginSystems--ES.8.md",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.8.lean",
-    "research/blueprint/packets/KatoEulerSystems.json",
-    "research/blueprint/readmes/KatoEulerSystems.md",
-    "research/blueprint/suggested/KatoEulerSystems.lean",
-    "research/blueprint/handoff/BP-KatoEulerSystems~2.md"
+    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
    ],
    "after": [
     "FIX-RT-AREA-iwasawa-1"
@@ -80108,28 +80072,8 @@
    ],
    "outputs": [
     "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.7s.json",
     "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.0.json",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.7.json",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.0.json",
-    "research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.8.json",
-    "research/blueprint/packets/PadicHodgeRegulators--D.1.json",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.8.json",
-    "research/blueprint/packets/KatoEulerSystems.json",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.7s.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.0.lean",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.7.lean",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean",
-    "research/blueprint/suggested/GeneralizedHeegnerCycles--GH.0.lean",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.8.lean",
-    "research/blueprint/suggested/PadicHodgeRegulators--D.1.lean",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.8.lean",
-    "research/blueprint/suggested/KatoEulerSystems.lean"
+    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
    ],
    "after": [
     "FIX-RT-AREA-iwasawa-1~2"
--- a/research/blueprint/make_queue.py
+++ b/research/blueprint/make_queue.py
@@ -1954,7 +1954,7 @@
             earlier_report, report = report, f"research/blueprint/redteam/{rt}.fixes-{k}.md"
             # A round an earlier run made is kept as it was made, though its files may now carry a later
             # round's verdict: the rounds after it are then still found, and a later send-back still counts.
-            made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None
+            made = previous_jobs.get(following)
             if made:
                 sent_back = made.get("after") == [review]
             why = (f"This is round {k} of the fix. The review of round {k - 1} sent it back: make the corrections research/blueprint/reviews/{review}.md asks for.\n"
```

---

The historical continuation and mathematical reports below are preserved
with their original authors and validation limits.

# #6217: blocked checkpoint — preserve issued review scope

Codex — **codex-XyECDt**, 11 October 2026. Input commit:
`43d1333d8377cdfa82317a22d2a67ec03b9fdab6`. Branch:
`codex-XyECDt-review-6217`. The bot confirmed this claim in
[comment 6105801105](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6105801105).

**The issue-named HE.0 fix review is already accepted; completion remains
blocked by a different queue scope.** After claiming, this session reread the
whole live issue: it names the report, HE.0 packet and its suggested file.
The queue instead requires this report, eleven packets and eleven suggested
files. All 23 outputs exist. The ten additional packets retain other jobs'
review markers, including ES.0's `needs_changes`. The actual
`issues.deliverables_complete` returns false for the current queue entry and
true for an in-memory copy with just the issue's three outputs. No verdict
or mathematical statement was changed to satisfy the expanded predicate.

This session checked the blocker and the proposed repair, rather than
repeating the already accepted mathematical review. The three mathematical
reports below retain their authors, source-reading scope and Lean receipts.
No source was fetched or reread; no mathematical result is newly certified.

## New repair evidence

The earlier completed-round guard fixes this completed fix round, but leaves
another way to change a worker's assigned scope. A focused replay of the
actual nested `fix_rounds` AST tests saved rounds in states `pending`,
`external` and `done`, each with a new-input or send-back trigger. When new
inputs arrive, the stock generator and completed-only guard both expand
pending and external rounds. Preserving every existing successor retains
those scopes. It also retains the saved rejection reason and permits a new
successor when none exists. Each fixture preserves the saved fix/review
output lists across a second generation. The earlier seven-case regression
for the completed-only proposal also passes, but deliberately accepts
expansion of unfinished work; it does not test the issued-scope requirement.

The revised candidate therefore uses
`made = previous_jobs.get(following)`. This deliberately freezes existing
pending scopes as well as completed ones: newly arrived work joins another
round after the saved round finishes. It needs maintainer review of that
scheduling policy. Restoring the historical four/three output lists remains
necessary; preserving an already expanded list does not repair it.

The standalone focused replay below reproduces these checks without changing
repository files. The full-generator comparison and its limits are recorded
below. These are proposed repairs for the maintainer, not changes to the
queue or generator in this submission.

## Fresh full-generator comparison

The actual generator was run in memory with repository writes forbidden,
its lock redirected to scratch and dry-run changed only to return jobs and
prompts. Only the two Iwasawa round-two output arrays were restored from
`88f9bcd44`; all other queue entries were current at the input commit above.

| Candidate | Round-two fix/review outputs | Round-three fix/review outputs |
| --- | --- | --- |
| Stock | 27 / 15 | No new round |
| Completed-only | 4 / 3 | 30 / 17 |
| All existing rounds | 4 / 3 | 30 / 17 |

Both candidates retain the historical round-two lists and route additional
work to round three. Neither changes any job's output list on its second
full generation. Compared with stock, completed-only changes 36 jobs, adds
twenty and removes none. All-existing differs from completed-only in just
`FIX-RT-AREA-finitefields~2` and its review, adding/removing no jobs. The
finite-fields difference demonstrates that freezing pending scopes has a
real effect beyond this fixture. A maintainer must inspect those wider
family changes before publishing generated metadata.

This replay does not test issue refresh, GitHub claims, intake, or deployment.
It evaluates proposed scheduling behavior only. The standalone replay below
preserves the exact experiment; first save the historical queue as directed
in the historical full-generator section. Pass task scratch as its argument.
No repository snapshot, source document, or scratch artifact is needed.

```python
import ast
import builtins
import contextlib
import copy
import io
import json
import sys
from pathlib import Path
from unittest.mock import patch

REPO=Path.cwd()
SCRATCH=Path(sys.argv[1])
source_path=REPO/'research/blueprint/make_queue.py'
source=source_path.read_text()
old='made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None'
new='''made = previous_jobs.get(following) if (
                states.get(following) == "done" or (following in states and not (missing or sent_back))
            ) else None'''
rt='RT-AREA-iwasawa-1'; base='FIX-'+rt
current=json.loads((REPO/'research/blueprint/queue.json').read_text())
historical={j['id']:j for j in json.loads((SCRATCH/'historical-queue.json').read_text())['jobs']}
restored=copy.deepcopy(current)
for j in restored['jobs']:
    if j['id'] in (base+'~2','REV-'+base+'~2'):
        j['outputs']=historical[j['id']]['outputs'][:]

real_read=Path.read_text
real_open=builtins.open

def generate(source, queue):
    tree=ast.parse(source)
    main=next(n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name=='main')
    dry=next(n for n in main.body if isinstance(n,ast.If) and isinstance(n.test,ast.Attribute) and n.test.attr=='dry_run')
    dry.body=[ast.Return(value=ast.Dict(keys=[ast.Constant('jobs'),ast.Constant('prompts')],values=[ast.Name(id='merged',ctx=ast.Load()),ast.Name(id='prompts',ctx=ast.Load())]))]
    ast.fix_missing_locations(tree)
    namespace={'__file__':str(source_path),'__name__':'scope_repair_dry_run'}
    exec(compile(tree,str(source_path),'exec'),namespace)
    def read(path,*args,**kwargs):
        return json.dumps(queue) if path==REPO/'research/blueprint/queue.json' else real_read(path,*args,**kwargs)
    def open_safe(file,*args,**kwargs):
        if Path(file)==REPO/'research/blueprint/.queue.lock': file=SCRATCH/'generation.lock'
        return real_open(file,*args,**kwargs)
    sys.path.insert(0,str(REPO/'research/blueprint'))
    with patch.object(Path,'read_text',read), patch.object(Path,'write_text',side_effect=AssertionError('dry-run attempted write')), patch('builtins.open',open_safe), patch.object(sys,'argv',[str(source_path),'--library','library','--baseline','baseline','--workers','workers','--dry-run']), contextlib.redirect_stdout(io.StringIO()):
        return namespace['main']()

runs={}
for label,src in [('stock',source),('completed_only',source.replace(old,new)),
                  ('all_existing',source.replace(old,'made = previous_jobs.get(following)'))]:
    first=generate(src,restored)
    jobs={j['id']:j for j in first['jobs']}
    print(label,[(jid,len(j['outputs'])) for jid,j in jobs.items()
                 if jid.startswith((base,'REV-'+base))])
    runs[label]=first
    if label!='stock':
        assert jobs[base+'~2']['outputs']==historical[base+'~2']['outputs']
        assert jobs['REV-'+base+'~2']['outputs']==historical['REV-'+base+'~2']['outputs']
        second=generate(src,{'jobs':first['jobs']})
        second_jobs={j['id']:j for j in second['jobs']}
        changes=[jid for jid,j in jobs.items() if jid in second_jobs and
                 j['outputs']!=second_jobs[jid]['outputs']]
        print(label,'second-generation output changes:', changes)
        for jid in (base+'~2','REV-'+base+'~2',base+'~3','REV-'+base+'~3'):
            assert second_jobs[jid]['outputs']==jobs[jid]['outputs']
        if label=='all_existing':
            assert not changes
for a,b in [('stock','completed_only'),('completed_only','all_existing')]:
    aj={j['id']:j for j in runs[a]['jobs']};bj={j['id']:j for j in runs[b]['jobs']}
    changed=sorted(jid for jid in aj.keys()&bj.keys() if aj[jid]!=bj[jid])
    added=sorted(bj.keys()-aj.keys());removed=sorted(aj.keys()-bj.keys())
    print(a,'to',b,'changed:',len(changed),'added:',len(added),'removed:',len(removed))
    print('changed jobs:',changed);print('added:',added);print('removed:',removed)
```

## Packet and submission boundary

HE.0's checker reports zero errors and warnings: 78 nodes, 24 API items,
eighteen tests, 43 planets, thirteen baseline declarations, 21 gaps and 63
requests; all eight stages are planned and none is closed. The suggested
file remains SHA-256
`9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
Lean was not rerun for this Markdown-only checkpoint; earlier successful
elaborations retain their attribution below.

[WORKERS.md](../WORKERS.md) says “Edit only the files the issue names, plus
your own scratch space.” The required queue and generator repair paths are
outside that scope; fresh `intake.file_problems` calls reject both as outside
swarm output paths. No mutation was submitted for automatic approval.
The authorized work cannot resolve that blocker, so this run submits the
checkpoint the task permits when blocked. Only this report and the required
handoff change. Synchronize the issue and queue before reassigning this job.

## Issued-scope focused replay

Run from the repository root. This compiles only the real nested helper and
stubs its boundaries. It makes no repository edit and needs no source file.

```python
"""Exercise the real fix_rounds function without changing repository files."""
import ast
import copy
import re
from pathlib import Path

source = Path('research/blueprint/make_queue.py').read_text()
old = 'made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None'
new = '''made = previous_jobs.get(following) if (
                states.get(following) == "done" or (following in states and not (missing or sent_back))
            ) else None'''
assert source.count(old) == 1
base = 'FIX-RT-FIXTURE'
report = 'research/blueprint/redteam/RT-FIXTURE.fixes.md'
packet = 'research/blueprint/packets/Fixture.json'
suggested = 'research/blueprint/suggested/Fixture.lean'
added_packet = 'research/blueprint/packets/NewFixture.json'
added_suggested = 'research/blueprint/suggested/NewFixture.lean'
round_two = [report.replace('.fixes.md', '.fixes-2.md'), packet, suggested]
historical = [
    {'id': base, 'state': 'done', 'outputs': [report]},
    {'id': base + '~2', 'state': 'done', 'outputs': round_two, 'after': [base]},
    {'id': 'REV-' + base + '~2', 'state': 'pending', 'outputs': []},
]

def generate(src, prior, blueprints, verdicts=None):
    function = next(n for n in ast.walk(ast.parse(src))
                    if isinstance(n, ast.FunctionDef) and n.name == 'fix_rounds')
    module = ast.Module(body=[function], type_ignores=[])
    jobs = {}
    env = {
        'states': {j['id']: j['state'] for j in prior},
        'previous_outputs': {j['id']: j['outputs'] for j in prior},
        'previous_jobs': {j['id']: j for j in prior},
        'PROMOTABLE': re.compile(r'^research/blueprint/packets/'),
        'review_of': lambda p: (verdicts or {}).get(p, {}),
        'findings_text': lambda *args: '', 'fill': {},
        'FIX_TEMPLATE': '', 'FIX_REVIEW_TEMPLATE': '',
        'add': lambda job, prompt: jobs.update({job['id']: job}),
    }
    exec(compile(module, '<real fix_rounds>', 'exec'), env)
    env['fix_rounds']('RT-FIXTURE', 'fixture', 'fixture', [], 0, {}, [],
                      [report], blueprints, {}, [])
    return jobs


completed_only = source.replace(old, new)
all_existing = source.replace(old, 'made = previous_jobs.get(following)')
checks = 0
for state in ['pending', 'external', 'done']:
    for trigger in ['new_input', 'send_back']:
        prior = copy.deepcopy(historical)
        prior[0]['outputs'] = [report, packet, suggested]
        prior[1]['state'] = state
        verdicts = {}
        blueprint_list = [packet, suggested]
        if trigger == 'new_input':
            blueprint_list += [added_packet, added_suggested]
        else:
            prior += [{'id': 'REV-' + base, 'state': 'done', 'outputs': []}]
            verdicts = {packet: {'status': 'needs_changes',
                                 'reviewer': 'independent-review-REV-' + base}}
        original = generate(source, prior, blueprint_list, verdicts)
        limited = generate(completed_only, prior, blueprint_list, verdicts)
        preserved = generate(all_existing, prior, blueprint_list, verdicts)
        original_grows = original[base + '~2']['outputs'] != round_two
        limited_grows = limited[base + '~2']['outputs'] != round_two
        assert preserved[base + '~2']['outputs'] == round_two
        assert preserved[base + '~2']['after'] == prior[1]['after']
        if trigger == 'send_back':
            assert original[base + '~2']['after'] == ['REV-' + base]
            assert limited[base + '~2']['after'] == (prior[1]['after'] if state == 'done' else ['REV-' + base])
        expected = trigger == 'new_input'
        assert original_grows == expected
        assert limited_grows == (expected and state != 'done')
        for key in [base + '~2', 'REV-' + base + '~2']:
            again = [dict(j, state=next((p['state'] for p in prior if p['id']==jid), 'pending'))
                     for jid,j in preserved.items()]
            twice = generate(all_existing, again, blueprint_list, verdicts)
            assert twice[key]['outputs'] == preserved[key]['outputs']
        checks += 1
        print(state, trigger, 'stock grows:', original_grows,
              'completed-only grows:', limited_grows, 'all-existing stable: True')
# A saved rejection round keeps its reason even when the prior review changes.
prior = copy.deepcopy(historical)
prior[1]['state'] = 'external'
prior[1]['after'] = ['REV-' + base]
out = generate(all_existing, prior, [packet, suggested, added_packet, added_suggested])
assert out[base + '~2']['after'] == ['REV-' + base]
assert out[base + '~2']['outputs'] == round_two
# No saved successor: new work must still form the next round.
prior = [historical[0]]
out = generate(all_existing, prior, [packet, suggested, added_packet, added_suggested])
assert added_packet in out[base + '~2']['outputs']
print('PASS:', checks, 'state/trigger fixtures, repeat generation, rejection reason, new successor')
```

---

## Ready-to-review repair

Apply the following patch to `research/blueprint/make_queue.py`. It preserves
every existing following round even when more finished blueprints have arrived.
The existing `after` value continues to distinguish a rejection round from a
round that applies newly available blueprints.

```diff
--- a/research/blueprint/make_queue.py
+++ b/research/blueprint/make_queue.py
@@ -1954,7 +1954,7 @@
             earlier_report, report = report, f"research/blueprint/redteam/{rt}.fixes-{k}.md"
             # A round an earlier run made is kept as it was made, though its files may now carry a later
             # round's verdict: the rounds after it are then still found, and a later send-back still counts.
-            made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None
+            made = previous_jobs.get(following)
             if made:
                 sent_back = made.get("after") == [review]
             why = (f"This is round {k} of the fix. The review of round {k - 1} sent it back: make the corrections research/blueprint/reviews/{review}.md asks for.\n"
```

Also restore the two historical `outputs` lists in `queue.json` from historical queue commit
`88f9bcd44`, following [PR #6753](https://github.com/CBirkbeck/tauceti-explorer/pull/6753).
The current round-two fix is already marked `done`; preserve its state and
other fields. The desired lists are:

```json
{
  "FIX-RT-AREA-iwasawa-1~2": [
    "research/blueprint/redteam/RT-AREA-iwasawa-1.fixes-2.md",
    "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.0.md",
    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
  ],
  "REV-FIX-RT-AREA-iwasawa-1~2": [
    "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md",
    "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
  ]
}
```

Restoring the lists is essential: applying the guard to the already expanded
completed round would preserve its incorrect forty-output scope. Regenerate
only after restoring them. Newly routed work then belongs to a separate
round-three fix and its independent review, with matching live issue bodies.
Do not change the ten extra packet reviewer names to force completion.

## Historical completed-only focused regression

Run the following from the repository root, saving the script in task scratch.
It compiles only the actual nested function's AST and stubs its input/output
boundary. It writes no repository file, fetches no source and calls no GitHub API.
This historical replay tests the earlier completed-only candidate, not the
issued-scope candidate above. Its unfinished-expansion expectation is intentional.

```python
"""Exercise the real fix_rounds function without changing repository files."""
import ast
import copy
import re
from pathlib import Path

source = Path('research/blueprint/make_queue.py').read_text()
old = 'made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None'
new = '''made = previous_jobs.get(following) if (
                states.get(following) == "done" or (following in states and not (missing or sent_back))
            ) else None'''
assert source.count(old) == 1
base = 'FIX-RT-FIXTURE'
report = 'research/blueprint/redteam/RT-FIXTURE.fixes.md'
packet = 'research/blueprint/packets/Fixture.json'
suggested = 'research/blueprint/suggested/Fixture.lean'
added_packet = 'research/blueprint/packets/NewFixture.json'
added_suggested = 'research/blueprint/suggested/NewFixture.lean'
round_two = [report.replace('.fixes.md', '.fixes-2.md'), packet, suggested]
historical = [
    {'id': base, 'state': 'done', 'outputs': [report]},
    {'id': base + '~2', 'state': 'done', 'outputs': round_two, 'after': [base]},
    {'id': 'REV-' + base + '~2', 'state': 'pending', 'outputs': []},
]

def generate(src, prior, blueprints, verdicts=None):
    function = next(n for n in ast.walk(ast.parse(src))
                    if isinstance(n, ast.FunctionDef) and n.name == 'fix_rounds')
    module = ast.Module(body=[function], type_ignores=[])
    jobs = {}
    env = {
        'states': {j['id']: j['state'] for j in prior},
        'previous_outputs': {j['id']: j['outputs'] for j in prior},
        'previous_jobs': {j['id']: j for j in prior},
        'PROMOTABLE': re.compile(r'^research/blueprint/packets/'),
        'review_of': lambda p: (verdicts or {}).get(p, {}),
        'findings_text': lambda *args: '', 'fill': {},
        'FIX_TEMPLATE': '', 'FIX_REVIEW_TEMPLATE': '',
        'add': lambda job, prompt: jobs.update({job['id']: job}),
    }
    exec(compile(module, '<real fix_rounds>', 'exec'), env)
    env['fix_rounds']('RT-FIXTURE', 'fixture', 'fixture', [], 0, {}, [],
                      [report], blueprints, {}, [])
    return jobs

blueprints = [packet, suggested, added_packet, added_suggested]
original = generate(source, historical, blueprints)
assert original[base + '~2']['outputs'] != round_two
assert base + '~3' not in original
fixed_source = source.replace(old, new)
fixed = generate(fixed_source, historical, blueprints)
assert fixed[base + '~2']['outputs'] == round_two
assert fixed[base + '~3']['after'] == [base + '~2']
assert added_packet in fixed[base + '~3']['outputs']
assert added_suggested in fixed[base + '~3']['outputs']
assert fixed['REV-' + base + '~2']['outputs'] == [
    'research/blueprint/reviews/REV-FIX-RT-FIXTURE~2.md', packet, suggested]
prior = [dict(j, state=next((p['state'] for p in historical if p['id'] == jid),
                            'pending')) for jid, j in fixed.items()]
twice = generate(fixed_source, prior, blueprints)
assert {k: v['outputs'] for k, v in fixed.items()} == {
    k: v['outputs'] for k, v in twice.items()}

# Unfinished work still absorbs newly available inputs.
pending = copy.deepcopy(historical)
pending[1]['state'] = 'pending'
unfinished = generate(fixed_source, pending, blueprints)
assert added_packet in unfinished[base + '~2']['outputs']
assert base + '~3' not in unfinished

# The genuine rejection path keeps the independent review dependency.
rejected = copy.deepcopy(historical)
rejected[2]['state'] = 'done'
sent_back = generate(fixed_source, rejected, [packet, suggested], {
    packet: {'status': 'needs_changes',
             'reviewer': 'independent-review-REV-' + base + '~2'}})
assert sent_back[base + '~3']['after'] == ['REV-' + base + '~2']

# An existing completed rejection round keeps its recorded reason/dependency.
saved_rejection = copy.deepcopy(historical)
saved_rejection[1]['after'] = ['REV-' + base]
preserved = generate(fixed_source, saved_rejection, blueprints)
assert preserved[base + '~2']['after'] == ['REV-' + base]
assert preserved[base + '~2']['outputs'] == round_two
print('PASS: original bug, completed scope, new-work routing, repeat generation, '
      'unfinished expansion, rejection dependency, historical dependency')
```

---

Earlier mathematical reviews follow with their original attribution.

## Preserved broader validation

Earlier continuations ran the complete generator in memory with repository
writes forbidden. With the historical scopes restored, the original guard
produced round-two fix/review counts of 27/15; the repaired guard kept 4/3 and
routed additional work to round three at 30/17. Both repaired rounds remained
stable across a second generation. That comparison changed 36 existing jobs,
added twenty and removed none. These are historical receipts, not results from
codex-bbmvKh; inspect the other affected families before applying a full
regeneration. Those receipts belong to earlier continuations; the fresh comparison is
recorded separately above.

## Self-contained full-generator regression replay

Save the Python below as `full_generation.py` in task scratch. First save the
historical queue there using the read-only command
`git show 88f9bcd44:research/blueprint/queue.json > "$TASK_SCRATCH/historical-queue.json"`.
Run `python3 "$TASK_SCRATCH/full_generation.py" "$TASK_SCRATCH"` from the
repository root. It executes the module from its existing tree in memory;
there is no repository copy, queue generation on disk, synchronization or
promotion. It raises if the generator tries to write any file with
`Path.write_text`, and redirects its lock file into scratch. The only AST
change besides the proposed guard is returning the generated jobs/prompts
when `--dry-run` would otherwise return no value. Counts reflect the inputs
at the recorded commit and may differ after new work lands.

```python
import ast
import builtins
import contextlib
import copy
import io
import json
import sys
from pathlib import Path
from unittest.mock import patch

REPO=Path.cwd()
SCRATCH=Path(sys.argv[1])
source_path=REPO/'research/blueprint/make_queue.py'
source=source_path.read_text()
old='made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None'
new='''made = previous_jobs.get(following) if (
                states.get(following) == "done" or (following in states and not (missing or sent_back))
            ) else None'''
rt='RT-AREA-iwasawa-1'; base='FIX-'+rt
current=json.loads((REPO/'research/blueprint/queue.json').read_text())
historical={j['id']:j for j in json.loads((SCRATCH/'historical-queue.json').read_text())['jobs']}
restored=copy.deepcopy(current)
for j in restored['jobs']:
    if j['id'] in (base+'~2','REV-'+base+'~2'):
        j['outputs']=historical[j['id']]['outputs'][:]

real_read=Path.read_text
real_open=builtins.open

def generate(source, queue):
    tree=ast.parse(source)
    main=next(n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name=='main')
    dry=next(n for n in main.body if isinstance(n,ast.If) and isinstance(n.test,ast.Attribute) and n.test.attr=='dry_run')
    dry.body=[ast.Return(value=ast.Dict(keys=[ast.Constant('jobs'),ast.Constant('prompts')],values=[ast.Name(id='merged',ctx=ast.Load()),ast.Name(id='prompts',ctx=ast.Load())]))]
    ast.fix_missing_locations(tree)
    namespace={'__file__':str(source_path),'__name__':'scope_repair_dry_run'}
    exec(compile(tree,str(source_path),'exec'),namespace)
    def read(path,*args,**kwargs):
        return json.dumps(queue) if path==REPO/'research/blueprint/queue.json' else real_read(path,*args,**kwargs)
    def open_safe(file,*args,**kwargs):
        if Path(file)==REPO/'research/blueprint/.queue.lock': file=SCRATCH/'generation.lock'
        return real_open(file,*args,**kwargs)
    sys.path.insert(0,str(REPO/'research/blueprint'))
    with patch.object(Path,'read_text',read), patch.object(Path,'write_text',side_effect=AssertionError('dry-run attempted write')), patch('builtins.open',open_safe), patch.object(sys,'argv',[str(source_path),'--library','library','--baseline','baseline','--workers','workers','--dry-run']), contextlib.redirect_stdout(io.StringIO()):
        return namespace['main']()

runs={}
for label,src in [('original',source),('repaired',source.replace(old,new))]:
    first=generate(src,restored)
    jobs={j['id']:j for j in first['jobs']}
    print(label,[(jid,len(j['outputs'])) for jid,j in jobs.items() if jid.startswith((base,'REV-'+base))])
    runs[label]=first
    if label=='repaired':
        assert jobs[base+'~2']['outputs']==historical[base+'~2']['outputs']
        assert jobs['REV-'+base+'~2']['outputs']==historical['REV-'+base+'~2']['outputs']
        assert base+'~3' in jobs
        second=generate(src,{'jobs':first['jobs']})
        for round_ in (base+'~2','REV-'+base+'~2',base+'~3','REV-'+base+'~3'):
            assert next(j for j in second['jobs'] if j['id']==round_)['outputs']==jobs[round_]['outputs']
        print('full dry-run: historical scope stable across two generations; additional work assigned to round three')

original={j['id']:j for j in runs['original']['jobs']}
repaired={j['id']:j for j in runs['repaired']['jobs']}
changed=[jid for jid in original.keys() & repaired.keys() if original[jid]!=repaired[jid]]
added=list(repaired.keys()-original.keys())
removed=list(original.keys()-repaired.keys())
print('different jobs:',sorted(changed));print('added jobs:',sorted(added));print('removed jobs:',sorted(removed))
```

---

## Preserved mathematical reviews

# Independent fix review: codex-kEnFR2, 10 October 2026

Issue #6217; reviewer Codex — `codex-kEnFR2`. This session did none of the
fixes, red team or verification. The bot confirmed the claim before work began.

**HE.0 fixes: accepted. Whole queue job: blocked checkpoint.**

The four findings applicable to the issue-named packet were checked against
the verified red-team result, round-two fix report, current packet and supplier
statements. No further mathematical or Lean signature correction was necessary.
Earlier reviews are preserved in `reviewHistory` and below; this session's
source locators, hashes and check results are in
`verification.independentFixReviewSession`.

| Finding | Verdict and independently checked correction |
|---|---|
| /2 | Accepted with explicit supplier obligations. Zhang Theorem 2.1, pp.203–204, requires the exact raised level and trivial character. HE.0 distinguishes this export from Diamond's weaker q-new criterion, rational Jacquet–Langlands, and the separately requested integral multiplicity-one and transport statements. |
| /8 | Accepted with explicit supplier obligations. Zhang §6.3 and Theorems 6.4–6.5, pp.228–231, use geometric component groups. Theorem 7.1, pp.231–232, requires the recorded discriminant correction when deduced from Skinner A/B, pp.1–2; Skinner §2.5, pp.15–16, supplies the weaker integral argument under its separate residual and coinvariant conditions. The period and nonsquarefree variants remain requests. |
| /9 | Accepted as an ownership correction. The accepted PAPER-CALEGARI-GERAGHTY-20 route assigns the general large-image theorems to the Faltings Part II. HE.7 keeps applications and records missing all-prime, adelic and GL₂-type exports. This checks ownership, rather than independently proving the general image theorem. |
| /10 | Accepted with explicit supplier obligations. Howard Definition 1.2.3 and H.0–H.5, pp.7–9, and Theorems 1.6.1/1.6.5, pp.16–19, support ES.5's self-dual descent contract. Proposition 1.7.4 and Theorem 1.7.5, p.21, support the corrected cyclic-tensor system. Zanarella Definition 2.3.2, Proposition 2.3.3 and Theorem 2.3.6, pp.19–20, retain p≥5, both dual hypothesis lists, the prime-set condition and a nonzero bottom class. The exact equality is requested from ES.5, without the unrelated over-Q divisibility prerequisite. |

Primary versions read: [Zhang, version of record](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf),
[Howard v1](https://arxiv.org/pdf/1202.6340v1),
[Skinner v1](https://arxiv.org/pdf/1407.1093v1), and
[Zanarella v1](https://arxiv.org/pdf/1908.09197v1).
Zhang was read in the maintainer-cleared library; neither its file nor passages
were copied. This continuation does not claim a fresh rereading of every HE.0
source or all ten source issues.

All thirteen Mathlib baseline statements were read at the exact pin. The two
p-adic ideal/valuation lemmas keep their nonzero restrictions. The current
Tau Ceti `levelRaise` is a degeneracy operator, not the exact-level supplier.
Current upstream boundaries and the reviewed library audit were inspected;
the generic arithmetic carriers remain imports rather than new HE definitions.

Validation: packet checker zero errors/warnings; source-issue schema and version
checks zero problems (ten issues, 24 receipts); `lean-check` exit 0 with 114
warnings, all `sorry`. The suggested file is unchanged. Across 30,589 indexed
nodes, there are no duplicate ids or cycles reachable from HE.0. HE.6 has six
clean and thirteen Zhang nodes; none of the 62 HE.8-family nodes depends on
HE.6. The period export has no Heegner input. All 78 node names and every API/test name
are present in Lean. These checks do not establish implementation or remove
the packet's 21 gaps and 63 requests.

The live issue authorizes only HE.0, its suggested file and this report. The
queue instead requires eleven packets: `deliverables_complete` is false for
that job and true for an in-memory copy restricted to the live issue's three
outputs. [WORKERS.md](../WORKERS.md) says “Edit only the files the issue names,
plus your own scratch space.” Scope clarification was requested and remains
unanswered. Completing the ten extra independent reviews requires authorization,
or the queue must be aligned with the live issue. The handoff lists those
packets. No extra packet or queue entry was edited.

---

Preserved earlier reports follow, with their original verification scope.

# Continuation: codex-mVQR9r, 10 October 2026

Issue #6217; independent reviewer Codex — `codex-mVQR9r`.
This session did none of the fixes, their red team, verification or earlier reviews.
The bot confirmed the claim before this continuation began.

**Authorized HE.0 verdict: accepted. Queue-job status: blocked checkpoint.**

## What this continuation establishes

I independently rechecked the four HE.0 findings against the confirmed findings,
round-two fix report, current packet/supplier statements and the primary passages
listed below. The previous continuation's mathematical corrections remain sound;
this continuation adds verification receipts and an executable diagnosis of the
scope blocker. It changes no mathematical statement or Lean signature.

| Finding | Verdict | Check |
|---|---|---|
| /2 | Accepted within the recorded supplier obligations | Zhang Theorem 2.1, pp.203–204, preserves exact level and trivial character. The Diamond criterion is weaker; rational Jacquet–Langlands and integral transports remain distinct contracts. |
| /8 | Accepted within the recorded supplier obligations | Zhang §6.3 and Theorems 6.4–6.5, pp.228–231, use geometric component lengths over K at inert primes. Theorem 7.1, pp.231–232, is repaired using Skinner's integral input and the prime-to-discriminant condition; the missing period/transport variants remain explicit requests. |
| /9 | Accepted as an ownership correction | The accepted image-theory paper route and Part II brief own the general results; HE.7 keeps their application and exact requests for the all-prime, adelic and GL₂-type exports. I checked the ownership contract, not a new proof of Serre's theorem. |
| /10 | Accepted within the recorded supplier obligations | Howard's H.0–H.5, self-dual DVR theorem and cyclic-tensor systems belong to ES.5. Zanarella's equality keeps both dual hypothesis lists, p≥5, the prime-set condition and nonzero bottom class. The Howard-system formula remains requested, rather than supplied by a Mazur–Rubin-over-Q theorem. |

Sources read in this continuation:

- [Zhang, version of record](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf): Theorem 2.1 pp.203–204; §6.3 and Theorems 6.4–6.5 pp.228–231; Theorems 7.1–7.2 pp.231–233. Read from the maintainer-cleared copy, without copying the file or passages.
- [Howard, arXiv:1202.6340v1](https://arxiv.org/pdf/1202.6340v1): Definition 1.2.3 p.7; H.0–H.5 pp.8–9; Theorem 1.6.1 and its proof pp.16–18; Theorem 1.6.5 and its proof pp.18–19.
- [Skinner, arXiv:1407.1093v1](https://arxiv.org/pdf/1407.1093v1): Theorems A/B pp.1–2; Theorem 2.5.2 and its integral-coefficient discussion pp.15–16.
- [Zanarella, arXiv:1908.09197v1](https://arxiv.org/pdf/1908.09197v1): Definition 2.3.2, Proposition 2.3.3, and Theorem 2.3.6 with its proof pp.19–20.

The four hashes match the previous receipts. These receipts are in
`verification.independentFixReviewScopeCheck`. The historical review below
retains its own source scope; I do not claim a new independent rereading of all
78 targets or all ten source issues.

I read all thirteen Mathlib baseline statements at the exact pin
082e2d37e8b0463410cdb532e111cd43d5a66174, including the two nonzero restrictions
in the p-adic ideal/valuation lemmas. The current upstream EllipticCurves layers
2/7, ModularCurves scope, LocalGaloisGroups and ProfiniteArithmetic prototypes
were inspected read-only. They keep generic Tate, pairing and Kummer material
outside HE's ownership. The current Tau Ceti `levelRaise` is a degeneracy
operator and supplies no exact-level Ribet/Diamond–Taylor theorem.

## Current verification

- Packet checker: zero errors and warnings; 78 nodes, 24 API items, eighteen unit tests, 21 gaps and 63 requests.
- Source-issue schema/version checks: ten issues, 24 version receipts, zero problems.
- Intake file checks: three changed files, zero problems; `git diff --check` passes.
- `lean-check`: exit 0, 114 warnings, all `sorry`; no other warnings or errors. The suggested file is unchanged, SHA-256 `9e4fa52693e51e06ea4f6147f430ddf021a845d22b892bec0e8524f478dc546b`.
- Current declaration graph: 30,589 unique indexed nodes; no duplicate ids or cycle reachable from HE.0. The HE.6 split remains six clean and thirteen Zhang nodes. No outside node consumes the Zhang group; it consumes no clean node. None of the 62 HE.8-family nodes depends on HE.6. The period export's closure has no Heegner node.

These checks support acceptance of the four HE.0 fixes, with the supplier and
stage-restructuring gaps preserved. They do not certify closure or implementation.

## Reproduced completion blocker

The live issue was re-read after claim confirmation. It names only this report,
`HeegnerPointEulerSystems--HE.0.json` and its suggested file. Both the local
queue and a fresh read of the live main queue instead name eleven packets.
`issues.deliverables_complete` returns **false** for that actual queue job and
**true** for an in-memory copy restricted to the live issue's three outputs.
The ten extra packets retain other independent-review markers; one supplier
packet, ES.0, has a `needs_changes` verdict. Their existing reviews do not
constitute this job's independent fix review.

[WORKERS.md](../WORKERS.md) requires edits to issue-named files. Scope
clarification was requested in this session and remains unanswered. The extra
packets and queue are untouched. This checkpoint needs a scope reconciliation:
either align the queue outputs with the live issue, or authorize the ten extra
reviews before they receive this job's verdict. The handoff lists them exactly.
Repeating the already accepted HE.0 review cannot change that completion predicate.

---

The following is the preserved historical report of codex-TRbVPK. Its findings,
corrections and source receipts remain part of the handoff evidence.

# REV-FIX-RT-AREA-iwasawa-1~2

Independent continuation review for issue #6217, by Codex — `codex-TRbVPK`,
10 October 2026. This session did none of FIX-RT-AREA-iwasawa-1~2
(Claude `claude-PWOydn`, PR #6753), its red team or verification. This follows
Claude `claude-yM8YCo`'s accepted HE.0 review of 7 October and the independent
HE.0 round-two review of 6 October. Both historical review objects are preserved.

**HE.0 verdict: accepted after corrections in place. Job completion: blocked
by the issue/queue scope mismatch.**

## Scope and completion blocker

The live issue's deliverables and full instructions name the HE.0 packet,
its suggested file and this report. WORKERS.md restricts edits to issue-named
files and requires a handoff on stopping. This submission changes those files
and its handoff only.

Both the local and live main queue instead list eleven packets for this job.
`research/blueprint/issues.py::deliverables_complete` requires this job's
reviewer marker on every listed packet. Ten still have other reviews. Thus the
permitted HE.0 review can be finished, but intake cannot recognize completion
without an issue-scope update or a queue correction. Scope clarification was
requested during this run. No unreviewed packet receives this session's
verdict, and no queue or automation file is changed.

The ten extra packet stems are HeegnerPointEulerSystems--HE.7s,
GrossZagierAndArithmeticHeights--GZ.0, RankZeroOneBSD--BSD.0,
RankZeroOneBSD--BSD.7, EulerSystemsAndKolyvaginSystems--ES.0,
GeneralizedHeegnerCycles--GH.0, GrossZagierAndArithmeticHeights--GZ.8,
PadicHodgeRegulators--D.1, EulerSystemsAndKolyvaginSystems--ES.8 and
KatoEulerSystems. Their suggested files are also queue outputs.

## Finding verdicts

I compared the four confirmed findings affecting HE.0 with their verified
evidence, the fix report, the packet changes, current supplier statements and
primary sources. The other 32 area findings are outside the live issue's file
scope; their fixes have no verdict from this session.

| Finding | HE.0 verdict | Reason |
|---|---|---|
| /2: level raising and quaternionic transport | Accepted | The exact-level statement is requested separately from Diamond's weaker criterion. Rational global JL, integral residual multiplicity, Shimura-set realization and local Kummer transport keep distinct owners. |
| /8: Zhang suppliers, periods and dependency order | Accepted | R17.3 replaces the wrong transfer layer. The GL₂-type rank-zero contract and period normalization retain their exact hypotheses and supplier gaps. The proposed dependency split checks out. |
| /9: general open-image ownership | Accepted | HE.7 imports the accepted Part II image-theory route and requests the all-p, adelic and GL₂-type exports missing from its large-p brief. It owns only the Heegner application. |
| /10: Howard's self-dual systems | Accepted after correction | ES.5 owns the hypotheses/DVR theorem and ES.8 the Λ-adic theorem. I removed the lingering Mazur–Rubin primitivity dependency and made all the self-dual equality hypotheses explicit. |

### /2: exact level and integral transports

Zhang Theorem 2.1, pp.203–204, requires a weight-two form of level N with
trivial character, irreducible residual representation, p≥5 and an admissible
q. Notations (xiv), p.203, includes q∤NDp, inertness, p∤q²−1 and the Hecke
congruence. It supplies level Nq with trivial character and the same residual
representation; its proof keeps the local inertial types.

R20.2/level-raising-diamond is weaker. The request retains the missing exact
level and type conditions, citing Diamond–Taylor's Duke Math. J. 74,
Theorem 1, and Invent. Math. 115, Theorem B. The proposed stage is still a
maintainer action. R17.3/global-jl and multiplicity-one supply rational
transfer; definite-infinity assigns its function space to R18.3. These do not
supply integral residual multiplicity. That is separately requested from
Zhang Lemma 3.3, p.215, and (4.8), p.219. The transport in (4.9), p.219,
is specifically a Heegner Kummer comparison.

### /8: rank-zero, periods and stage order

Zhang Theorem 7.1 and proof, pp.231–233, use the GL₂-type quotient and its
quadratic twist. The node retains good ordinarity, residual SL₂(F_p),
ramification at a prime dividing N exactly once and p∤D_K. Skinner Theorems
A/B, arXiv v1 pp.1–2, Theorem 2.5.2 and its integrality discussion,
pp.15–16, supply the repaired input: irreducibility and a tame element with
free rank-one coinvariants. Canonical-period and local-condition comparisons
remain exact supplier obligations. The split multiplicative exceptional-zero
condition does not arise at prime-to-p level.

Zhang §6.3, pp.228–229, and Theorem 6.4, pp.229–230, use geometric component
length over K_ℓ. The residue extension at an inert multiplicative prime makes
that component group constant; a Q_ℓ notation alone does not prove the
identification. The request records this and separates Pollack–Weston's
squarefree result from the Ribet–Takahashi, Khare and Helm inputs for the
nonsquarefree case. Theorem 6.5, pp.230–231, uses these normalizations in the
special-value unit test.

My current graph check indexed 30,584 packet declarations without duplicate
ids. The closure reachable from HE.0 has no declaration cycle. The proposed
split partitions its nineteen HE.6 declarations into six clean-descent and
thirteen Zhang declarations. All thirteen lie in the closure of
zhang-indivisibility; none depends on a clean-descent declaration, and no
outside declaration depends on the Zhang group. The current HE.8/HE.8b/HE.8c
packet has **62**, rather than the previous report's 60, declarations; none
directly or indirectly depends on HE.6.

The period node's closure contains no Heegner declaration. Of the Zhang
suppliers, only ModularIwasawaMainConjectures:L1 is reachable from HE.8; no
clean-descent supplier is. The old R17.5→HE.6 atlas edge and RS-21
InductionRestriction link remain. Their removal and the HE.6z/BSD.3a
sub-layers remain maintainer proposals. The gap retains both the HE.6→BSD.5
cycle and the route through BSD.4/kato-heegner-comparison. These checks do
not claim that the stage graph has already been restructured or that the
packet has closure.

### /9: a separate owner for image theory

The accepted OpenImageTheoremsForAbelianVarieties route in
PAPER-CALEGARI-GERAGHTY-20 and its
FaltingsFinitenessAndIsogenyTheoremsPartII design handoff supply the owner.
Their large-p brief alone does not give all-p/adelic finite index, uniform
homothety bounds or all GL₂-type exports. HE.0 requests those via R28.4/R01.4
and does not reprove them. The earlier R28.7 proposal is withdrawn. The CM
semilinear theory keeps its separate owner.

### /10: Howard systems and primitivity

Howard §1.3 H.0–H.5 and Theorem 1.6.5's proof, arXiv v1 pp.8–9,18–19,
support the actual Tate/local checks: full Tate image, the symmetric
conjugation-twisted Weil pairing and conjugate local orthogonality.
Definition 1.2.3, p.7, and Theorem 1.7.5, p.21, use Howard systems over K
with the cyclic tensor. The existing gap about extending local χ to global
cohomology remains explicit; this review does not solve it.

HE.6 applies ES.5/howard-dvr-theorem (Howard Theorem 1.6.1, p.16), keeping
the paired finite part and an inequality. It does not use a Mazur–Rubin
core-rank-one theorem over Q. Howard Proposition 2.1.3, pp.23–24, reuses that
generic theorem and hypothesis verification in specializations, so a new
HE.6→HE.8 dependency is unnecessary. ES.8 owns the Λ-adic theorem.

Zanarella Definition 2.3.2, Proposition 2.3.3 and Theorem 2.3.6, arXiv v1
pp.19–20, require p>4, H.0–H.5 for both the triple and its dual,
𝓛⊇𝓛_s(T) and κ_1≠0. The finite-length formula has defect d(κ), which
vanishes exactly for a nonzero residual Howard system. The prior review
corrected the request but retained a proof reference and prerequisite to
ES.5/divisibility-invariants, a Mazur–Rubin statement over Q. I corrected
both. The statement/hypotheses now give all the inputs; its matching Lean
comment explicitly records the missing supplier conditions, and its
signature retains 5≤p. The general definition/formula remain requested from
ES.5. Multiplication by p preserves a nonzero bottom class, increases its
rank-one index by one and kills the residual system; non-torsion does not
justify sharpness.

## Independent source-issue checks

E9 and E10 now have confirmed review objects. E9 remains a proof error and
E10 a gap in the stated result. Neither refutes Zhang's main theorems.

For E9, Elkies, arXiv v1 Abstract/Introduction pp.1–2, supplies the p=3
failure of residual-to-integral lifting. The curves are additive at 3 and
are not instances of all Theorem 7.1 hypotheses. Skinner §2.5, pp.15–16,
supplies the weaker integral inputs; residual ramification at ℓ∥N gives a
primitive tame unipotent element and rank-one coinvariants.

I also checked the p=5 ramified-coefficient subgroup assertion explicitly.
In O=Z₅[√5], put φ=(1+√5)/2. Since φ−2 has residue 1, Hensel gives
r²=φ−2 with r≡1. Set b=(−φ+r)/2 and c=b+φ, and take

```text
A = [ 0   1 ]       B = [ 1/2  b   ]
    [−1   0 ]           [ c    1/2 ]
```

Here bc=−3/4, both determinants are 1, and A²=B³=(AB)⁵=−I. Modulo {±I},
the subgroup is an image of the finite (2,3,5) triangle group of order 60,
so it has at most 120 elements. Modulo √5 the generators are [0,1;4,0]
and [3,4;2,3]; direct finite multiplication gives all 120 elements of
SL₂(F₅). The subgroup is finite and reduces surjectively, so cannot contain
a conjugate of SL₂(Z₅). This is a group counterexample, not a Galois-image
claim. Manoharmayum's Main Theorem, arXiv v2 p.1, excludes n=2, k=F₅.
I shortened E9's reason to this verified evidence, removing reliance on an
unchecked LMFDB record and the earlier quaternion-algebra explanation.

For E10, Zhang Notations (i), (x), pp.200,202, impose prime-to-N conditions,
but the displayed Theorem 7.1 omits p∤D_K. The proof applies ordinary
formulas to g and g⊗χ_K. When p|D_K and p∤N, the twist has p² dividing its
level and that argument is unavailable. The planned result keeps p∤D_K,
as Zhang's main theorem already does. This diagnoses the argument's missing
domain condition, without claiming the broader-domain statement false.

## Sources and checks

All mathematical statements here are paraphrases. Zhang's version of record
was read in the maintainer-cleared library without copying its file or text;
its hash matches the historical publisher receipt. The other five PDFs were
retrieved from the public primary URLs below. Howard, Skinner and Zanarella
match the packet receipts. Full hashes are preserved in
`verification.independentFixReviewContinuation.sourceRetrieval`.

| Source | Version and URL | Locators checked |
|---|---|---|
| Zhang | [Camb. J. Math. 2 (2014), version of record](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf) | Notations pp.200–203; Theorem 2.1 pp.203–204; Lemma 3.3 p.215; (4.7)–(4.9) pp.218–219; §6.3 and Theorems 6.4–6.5 pp.228–231; Theorems 7.1–7.2 pp.231–233 |
| Howard | [arXiv:1202.6340v1](https://arxiv.org/pdf/1202.6340v1) | Theorem A p.2; Definition 1.2.3 p.7; H.0–H.5 pp.8–9; Theorems 1.6.1, 1.6.5 pp.16,18–19; Theorem 1.7.5 p.21; Proposition 2.1.3 pp.23–24 |
| Skinner | [arXiv:1407.1093v1](https://arxiv.org/pdf/1407.1093v1) | Theorems A/B pp.1–2; §2.5 pp.15–16; §3.2 pp.20–21 |
| Zanarella | [arXiv:1908.09197v1](https://arxiv.org/pdf/1908.09197v1) | Definition 2.3.2, Propositions 2.3.3–2.3.4 and Theorem 2.3.6 pp.19–20 |
| Elkies | [arXiv:math/0612734v1](https://arxiv.org/pdf/math/0612734v1) | Abstract/Introduction pp.1–2 |
| Manoharmayum | [arXiv:1304.1196v2](https://arxiv.org/pdf/1304.1196v2) | Main Theorem p.1 |

All thirteen cited Mathlib declarations were read at commit
082e2d37e8b0463410cdb532e111cd43d5a66174, including the nonzero restrictions
on the p-adic ideal/valuation lemmas. No completed Tau Ceti Heegner declaration
is claimed. I inspected its pinned source, the current read-only library and
upstream roadmaps, and the reviewed library audit. The generic Tate/Weil
pairing and Galois/Kummer interfaces remain upstream imports.

The six definition/construction nodes have 24 API items and eighteen tests,
with suggested-file counterparts. They distinguish a point from its trace,
a sum of coefficient ideals from a product, unique descent from unrestricted
restriction, inverse correction from raw classes, squarefree support count
from multiplicity, and good-prime base locus from coefficient/bad primes.
Each has three distinct tests. All 78 mathematical statement comments and all
node/API/test names are present. No new definition was added.

Final checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`: zero errors and warnings.
- `check_issues` and `versions_checked`: ten source issues, 24 version receipts, zero problems.
- `python3 research/blueprint/intake.py check-files` on all four changed files: zero problems.
- `lean-check research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean`: exit 0, 114 warnings, all declarations using `sorry`, at the exact pinned Mathlib. Available memory was 97 GB. No Tau Ceti olean build was performed.
- Current node/stage graph and statement/name coverage checks as above.

The prototype omits explicitly named supplier conditions under PROTOCOL §13;
elaboration checks its forms, not arithmetic validity. All 21 gaps, 63
requests and unchecked implementation statuses remain. Acceptance here does
not mean closure. The reader is outside this issue's deliverables and needs
regeneration from the corrected packet when its scope is authorized.

## Summary

The four HE.0 fixes are accepted after correcting the Howard primitivity
reference, full hypothesis list, Lean prime bound and source-issue evidence.
The checks pass and the prototype elaborates with only `sorry` warnings.
Completion of issue #6217 remains blocked: the live issue permits HE.0 only,
while intake expects ten further packet reviews. The handoff identifies the
scope reconciliation needed before another worker proceeds.
