# Handoff: #6217 needs a scope decision

Refs #6217. Job `REV-FIX-RT-AREA-iwasawa-1~2`.
Codex — **codex-2jxtZG**, 19 October 2026.
Branch `codex-2jxtZG-review-iwasawa-fixes`;
input `84c400fa116c1f6ec339db0fcd9a4843fef7e88d`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6217#issuecomment-6259371234).
Submission: **blocked checkpoint**. No second job was claimed.

The accepted HE.0 mathematical verdict is preserved. Do not repeat that
audit. The issued review has three outputs; the queue requires twelve
packets and 25 outputs. WORKERS.md limits edits to issue-named files;
intake also rejects the two repair paths. A session clarification asked
for authorization to apply the concrete repair; it had no answer when
this checkpoint was prepared. No out-of-scope edit was made.

The [report](../reviews/REV-FIX-RT-AREA-iwasawa-1~2.md) records the fresh
completion check, packet check, 59 tests and full generator comparison.
No Lean statement changed or was recompiled. The previous attributed
review's successful Lean check is historical evidence only. No new
mathematical or implementation claim is made.

## Repair awaiting authorization

The patch below is **not applied**. It restores only the original fix and
review output arrays from `88f9bcd44` and preserves an existing following
round's assignment when new blueprints become ready. All states and
review verdicts stay as they are. The current generator comparison
preserves 50 existing assignments, adds twelve separate fix/review pairs
and removes none. The whole regenerated queue must not be installed as
this narrow repair.

```diff
--- a/research/blueprint/queue.json
+++ b/research/blueprint/queue.json
@@ -99459,44 +99459,7 @@
     "research/blueprint/redteam/RT-AREA-iwasawa-1.fixes-2.md",
     "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
     "research/blueprint/readmes/HeegnerPointEulerSystems--HE.0.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8c.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.8c.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8c.lean",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.8.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8.lean",
-    "research/blueprint/handoff/BP-HeegnerPointEulerSystems--HE.0~2.md",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights.json",
-    "research/blueprint/readmes/GrossZagierAndArithmeticHeights.md",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights.lean",
-    "research/blueprint/packets/HeightsRationalPointsAndObstructions.json",
-    "research/blueprint/readmes/HeightsRationalPointsAndObstructions.md",
-    "research/blueprint/suggested/HeightsRationalPointsAndObstructions.lean",
-    "research/blueprint/handoff/BP-HeightsRationalPointsAndObstructions~2.md",
-    "research/blueprint/packets/ModularIwasawaMainConjectures.json",
-    "research/blueprint/readmes/ModularIwasawaMainConjectures.md",
-    "research/blueprint/suggested/ModularIwasawaMainConjectures.lean",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/readmes/RankZeroOneBSD--BSD.0.md",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/handoff/BP-RankZeroOneBSD--BSD.0~2.md",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json",
-    "research/blueprint/readmes/HeegnerPointEulerSystems--HE.8b.md",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean",
-    "research/blueprint/packets/AutomorphicPadicLFunctions.json",
-    "research/blueprint/readmes/AutomorphicPadicLFunctions.md",
-    "research/blueprint/suggested/AutomorphicPadicLFunctions.lean",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json",
-    "research/blueprint/readmes/EulerSystemsAndKolyvaginSystems.md",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean",
-    "research/blueprint/packets/SelmerIwasawaCohomology.json",
-    "research/blueprint/readmes/SelmerIwasawaCohomology.md",
-    "research/blueprint/suggested/SelmerIwasawaCohomology.lean",
-    "research/blueprint/packets/KatoEulerSystems.json",
-    "research/blueprint/readmes/KatoEulerSystems.md",
-    "research/blueprint/suggested/KatoEulerSystems.lean",
-    "research/blueprint/handoff/BP-KatoEulerSystems~2.md"
+    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
    ],
    "after": [
     "FIX-RT-AREA-iwasawa-1"
@@ -99525,29 +99488,7 @@
    "outputs": [
     "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-1~2.md",
     "research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8c.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8.json",
-    "research/blueprint/packets/GrossZagierAndArithmeticHeights.json",
-    "research/blueprint/packets/HeightsRationalPointsAndObstructions.json",
-    "research/blueprint/packets/ModularIwasawaMainConjectures.json",
-    "research/blueprint/packets/RankZeroOneBSD--BSD.0.json",
-    "research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json",
-    "research/blueprint/packets/AutomorphicPadicLFunctions.json",
-    "research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json",
-    "research/blueprint/packets/SelmerIwasawaCohomology.json",
-    "research/blueprint/packets/KatoEulerSystems.json",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8c.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8.lean",
-    "research/blueprint/suggested/GrossZagierAndArithmeticHeights.lean",
-    "research/blueprint/suggested/HeightsRationalPointsAndObstructions.lean",
-    "research/blueprint/suggested/ModularIwasawaMainConjectures.lean",
-    "research/blueprint/suggested/RankZeroOneBSD--BSD.0.lean",
-    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean",
-    "research/blueprint/suggested/AutomorphicPadicLFunctions.lean",
-    "research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean",
-    "research/blueprint/suggested/SelmerIwasawaCohomology.lean",
-    "research/blueprint/suggested/KatoEulerSystems.lean"
+    "research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean"
    ],
    "after": [
     "FIX-RT-AREA-iwasawa-1~2"
--- a/research/blueprint/make_queue.py
+++ b/research/blueprint/make_queue.py
@@ -2212,7 +2212,7 @@
             earlier_report, report = report, f"research/blueprint/redteam/{rt}.fixes-{k}.md"
             # A round an earlier run made is kept as it was made, though its files may now carry a later
             # round's verdict: the rounds after it are then still found, and a later send-back still counts.
-            made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None
+            made = previous_jobs.get(following)
             if made:
                 sent_back = made.get("after") == [review]
             why = (f"This is round {k} of the fix. The review of round {k - 1} sent it back: make the corrections research/blueprint/reviews/{review}.md asks for.\n"
```

## Resume steps

1. Obtain authorization for these two paths and maintainer intake. Apply
   only the narrow patch; its arrays have four and three outputs.
2. Check that no state, verdict or unrelated queue field changed. Run the
   real completion predicate on the restored review: its existing HE.0
   verdict should make it true. Give no verdict on additional packets.
3. Repeat the read-only generator comparison below. Issued scopes must
   survive, and new work must receive a separate round with an independent
   review. Check the current owning parts rather than assuming stale
   assembled-packet paths must be carried forward.
4. Run `test_redteam_queue`, `test_issues` and `test_followups`, then
   reconcile the published assignment with the queue through maintainer
   intake. These repair paths cannot pass normal swarm output intake.

Alternatively, publish a new mathematical assignment that explicitly
names the additional fixes to review. Until one route is chosen, the job
has an administrative scope blocker. No process remains running and no
scratch file is needed to resume.

## Standalone read-only reproducer

Save this script outside the repository, run it from the repository root,
and pass an on-disk scratch directory as its only argument. It writes
only replay results, a lock and the candidate patch in that scratch
directory. It replays the actual generator twice with all repository
writes blocked. On the recorded input it reports 6,338 versus 6,362 jobs,
50 preserved assignments, 24 additions and no removals. As new sources
and blueprints arrive, these counts may change; the assertions are the
contracts to inspect. The script expects the unapplied selector.

```python
import ast, builtins, contextlib, copy, difflib, io, json, pathlib, subprocess, sys, types
from unittest import mock
ROOT=pathlib.Path.cwd()
SCRATCH=pathlib.Path(sys.argv[1]).resolve()
SCRATCH.mkdir(parents=True, exist_ok=True)
sys.path[:0]=[str(ROOT/'research/blueprint'),str(ROOT/'scripts')]
import issues
queue_path=ROOT/'research/blueprint/queue.json'
source_path=ROOT/'research/blueprint/make_queue.py'
queue=json.loads(queue_path.read_text())
historical=json.loads(subprocess.check_output(['git','show','88f9bcd44:research/blueprint/queue.json'],cwd=ROOT,text=True))
history={j['id']:j for j in historical['jobs']}
ids=('FIX-RT-AREA-iwasawa-1~2','REV-FIX-RT-AREA-iwasawa-1~2')
restored=copy.deepcopy(queue)
for j in restored['jobs']:
 if j['id'] in ids:j['outputs']=history[j['id']]['outputs']
current_jobs={j['id']:j for j in queue['jobs']}
restored_jobs={j['id']:j for j in restored['jobs']}
changes=[k for k in current_jobs if current_jobs[k]!=restored_jobs[k]]
assert changes==list(ids),changes
for k in ids:
 a,b=copy.deepcopy(current_jobs[k]),copy.deepcopy(restored_jobs[k]);a.pop('outputs');b.pop('outputs');assert a==b
assert not issues.deliverables_complete(current_jobs[ids[1]])
assert issues.deliverables_complete(restored_jobs[ids[1]])
source=source_path.read_text()
old='made = previous_jobs.get(following) if following in states and not (missing or sent_back) else None'
new='made = previous_jobs.get(following)'
assert source.count(old)==1
candidate=source.replace(old,new)
patch=''.join(difflib.unified_diff(queue_path.read_text().splitlines(True),(json.dumps(restored,ensure_ascii=False,indent=1)+'\n').splitlines(True),fromfile='a/research/blueprint/queue.json',tofile='b/research/blueprint/queue.json'))
patch+=''.join(difflib.unified_diff(source.splitlines(True),candidate.splitlines(True),fromfile='a/research/blueprint/make_queue.py',tofile='b/research/blueprint/make_queue.py'))
(SCRATCH/'scope-repair.patch').write_text(patch)
print('Completion: current false; restored issued scope true. Two output arrays only:',{k:len(restored_jobs[k]['outputs']) for k in ids})

def run_replay(code,label):
 tree=ast.parse(code,filename=str(source_path))
 main=next(n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name=='main')
 returns=[n for n in main.body if isinstance(n,ast.If) and ast.unparse(n.test)=='args.dry_run' and any(isinstance(x,ast.Return) for x in n.body)]
 assert len(returns)==1
 returns[0].body=[ast.Return(value=ast.Tuple(elts=[ast.Name(id='merged',ctx=ast.Load()),ast.Name(id='prompts',ctx=ast.Load())],ctx=ast.Load()))]
 ast.fix_missing_locations(tree)
 module=types.ModuleType('scope_replay_'+label);module.__file__=str(source_path)
 exec(compile(tree,str(source_path),'exec'),module.__dict__)
 original_read=pathlib.Path.read_text
 original_open=builtins.open
 def read(path,*args,**kwargs):
  if path==queue_path:return json.dumps(restored)
  return original_read(path,*args,**kwargs)
 def guarded_open(file,mode='r',*args,**kwargs):
  if pathlib.Path(file)==ROOT/'research/blueprint/.queue.lock':return original_open(SCRATCH/'replay.lock',mode,*args,**kwargs)
  if any(c in mode for c in 'wax+'):raise AssertionError(('blocked open for write',file,mode))
  return original_open(file,mode,*args,**kwargs)
 with contextlib.ExitStack() as stack:
  stack.enter_context(mock.patch.object(pathlib.Path,'read_text',read))
  stack.enter_context(mock.patch.object(pathlib.Path,'write_text',side_effect=AssertionError('all writes disabled')))
  stack.enter_context(mock.patch.object(pathlib.Path,'mkdir',return_value=None))
  stack.enter_context(mock.patch('builtins.open',guarded_open))
  stack.enter_context(mock.patch.object(sys,'argv',['make_queue.py','--dry-run','--library',str(SCRATCH),'--baseline',str(SCRATCH),'--workers',str(SCRATCH)]))
  stack.enter_context(contextlib.redirect_stdout(io.StringIO()))
  jobs,prompts=module.main()
 result={j['id']:j for j in jobs}
 (SCRATCH/f'replay-{label}.json').write_text(json.dumps(result,ensure_ascii=False))
 print(label, 'jobs',len(result),'issued scopes',{k:len(result[k]['outputs']) for k in ids})
 return result
baseline=run_replay(source,'baseline')
fixed=run_replay(candidate,'candidate')
for k in ids:assert fixed[k]['outputs']==restored_jobs[k]['outputs']
changed=[]
for k in sorted(baseline.keys()&fixed.keys()):
 if baseline[k]==fixed[k]:continue
 fields=[f for f in baseline[k].keys()|fixed[k].keys() if baseline[k].get(f)!=fixed[k].get(f)]
 assert fields==['outputs'],(k,fields)
 assert fixed[k]['outputs']==restored_jobs[k]['outputs'],k
 changed.append(k)
added=sorted(fixed.keys()-baseline.keys());removed=sorted(baseline.keys()-fixed.keys())
assert not removed
for k in added:
 if fixed[k]['kind']=='review':
  parent=k.removeprefix('REV-');assert fixed[k]['after']==[parent];assert parent in fixed[k]['independentOf']
assert 'FIX-RT-AREA-iwasawa-1~3' in added
assert fixed['FIX-RT-AREA-iwasawa-1~3']['after']==['FIX-RT-AREA-iwasawa-1~2']
assert set(baseline[ids[0]]['outputs'])-{baseline[ids[0]]['outputs'][0]}<=set(fixed['FIX-RT-AREA-iwasawa-1~3']['outputs'])
print('Preserved arrays',len(changed),'new jobs',len(added),'removed',len(removed))
print('New jobs:',', '.join(added))
print('All assertions passed; no repository write or queue state change.')
```
