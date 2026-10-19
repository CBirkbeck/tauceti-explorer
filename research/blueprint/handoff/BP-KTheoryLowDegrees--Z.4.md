# BP-KTheoryLowDegrees--Z.4 — completed standalone part

Issue #10818; worker Codex, session `codex-xjHnOz`; 19 October 2026.
Base commit `f6e2d853a3ceb70b0f31bfa482c8e0b703e98048`.
Claim comment: https://github.com/CBirkbeck/tauceti-explorer/issues/10818#issuecomment-6267990133;
the bot confirmed this session before work began.

## Result and ownership

The issue's U.1 predecessor pointer is stale. U.1 covers Z.1, Z.2 and
U.1–U.6 and has no Z.4 coverage. The accepted Z.3 companion already supplies
every Z.4 target, with `source_decomposed` coverage and no remaining Z.4 work.
Its independent review is `independent-review-REV-KTheoryLowDegrees--Z.3~3`,
accepted 7 October 2026; this worker neither performs nor claims a new review.

Following the no-duplication rule, this packet introduces **zero new nodes**
and explicitly imports all **43 existing Z.4 IDs**. They comprise 21 lemmas,
12 theorems, five constructions, four applications and one definition,
with 45 API items, 26 definition tests and six planets. Its nine target groups
partition those imports. The original packet remains authoritative and unchanged.
The general packet checker counts zero local nodes/API/tests/planets; the
separate importedCounts inventory records the reused work, never a second plan.

The new standalone reader gives exact hypotheses, proof routes, ownership,
all API/test contracts, source locators and arithmetic examples. It treats the
zero projective separately, uses the square-zero rank/Pic ring, distinguishes
actual localizations from arbitrary valuation overrings, and retains the
algebra determinant in finite-flat transfer. The normalized Picard norm is
transported from the existing class-group norm. The determinant comparison
uses an evaluation-image index ideal and a localized ideal-norm calculation,
without assuming a global integral basis. The nonprincipal ideal of
Z[√−5] exercises the nontrivial rank-zero torsion class and localization at 2.

Z.4 remains `source_decomposed`, with an empty remaining list. There are zero
new gaps, requests, restructuring proposals or duplicate source-issue records.
All imported implementation statuses stay `unchecked`. The three gaps and
sixteen requests elsewhere in the Z.3 companion are not declared resolved.
No mathematics was moved between owners. General S-integer localization and
the exact set of primes in a finite-extension arithmetic application retain
their ArithmeticKTheory:N.1 ownership; no backward dependency is introduced.

## Reading and evidence boundary

Read the binding worker/protocol/upstream instructions, complete issue, Z.4
atlas targets and incident stage links, reviewed AUDIT-29 coverage, accepted
RS-18, the imported nodes' statements/proofs/API/tests/source locators, and
relevant arithmetic consumers. No blueprint link-map entry explicitly names
Z.4. Read current upstream GrothendieckEulerForms and AlgebraicVectorBundles
readers and their relevant suggested signatures; their current-main commit
and current Tau Ceti/Mathlib commits are in the packet. Neither the existing
categorical K0 plan nor vector-bundle geometry is replanned.

Freshly read the official standalone K-book chapters I, pp. 16–19 and 24–25,
and II, pp. 8, 11, 13–14; Milne ANT v3.08 Theorem 3.31 and notes, printed
pp. 57–58, Example 4.6 p. 71 and S-units p. 90. The packet records exact PDF
hashes, URLs and PDF/printed page conventions. Repository text is in our own
words. No PDFs, extracted source passages or source excerpts are committed.
The existing Weibel corrections E1/E2/E16/E18 are preserved by reference.
Cohen was not read in this pass: its accepted node provenance and corrections
E6/E17/E29 remain inherited, rather than being relabelled as fresh checks.
The norm/determinant proof is identified as a derivation from the imported
argument and native norm interfaces, rather than attributed to an unverified
source statement. No new source-access or errata job was opened.

Read 35 directly cited baseline declarations with enclosing hypotheses at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All eleven associated source files
were byte-compared with those Git objects; module paths and hashes are in
baseline.sourceFiles. Other baseline evidence in imported prerequisite chains
retains its accepted provenance. The graph contains 219 reachable baseline
references, which is not a claim to have freshly audited all 219.

## Verification

* `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.4.json`:
  exit 0, zero errors and warnings, using the environment's pinned declaration
  index; 35 direct baseline references and one planned stage.
* Recoverable import check below: 43 exact imports; matching API/test inventory
  and all names in the reader; 96 reachable planned nodes and 219 baseline
  references; zero unresolved leaves and cycles; no gap/request record's
  neededBy intersects the closure. Coverage groups partition all 43 imports.
* `python3 scripts/check_sorry_data.py research/blueprint/suggested/KTheoryLowDegrees--Z.4.lean`:
  exit 0. The file has 195 lines and no admitted data definition.
* `lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.4.lean`:
  exit 0, 18 intentional theorem-admission warnings, no other diagnostics.
  Available memory was above 80 GiB before checking. No build, update, cache
  download or language server was started. The compiled file hash is below.
  This checks native signatures and small real definitions, not theorems' proofs.

The suggested file uses actual finite-projective, SplitK0, Pic, ClassGroup,
tensor and ideal carriers. Heavy rank/determinant, monoidal, base-change and
transfer constructions remain fully stated README targets under the binding
12 October shape rule. The reader gives an explicit omission table for all
six imported definition/construction APIs and tests. Existence theorems pin
down native coordinate maps through their generator/inverse formulas; there
are no invented proposition surrogates or auxiliary theory developments.

## Next action

Independently review the standalone import presentation and native signatures.
At assembly retain the existing 43 IDs and their six planets once, import
this reader and compact signatures, and preserve all 45 API contracts and
26 definition tests. Do not regenerate the same Z.4 nodes. No further Z.4
planning refinement is requested by this pass. Formalizing the accepted
classification, determinant/index comparison and functorial maps remains
Tau Ceti implementation work. This is the only issue handled by this session.

## Deliverable hashes

Paths below are relative to research/blueprint. These hashes cover the files
submitted with this handoff; no scratch artifact is needed to resume.

* `packets/KTheoryLowDegrees--Z.4.json`: `0c0bcb76e724a475bf40c8f984de2ea81fb8cf45701f0679c1558f92ca2a0a54`.
* `readmes/KTheoryLowDegrees--Z.4.md`: `80920fe54c3912e48bea2abdf3c0352710cde43d10084cb37317b59ee31c6c2e`.
* `suggested/KTheoryLowDegrees--Z.4.lean`: `e5048b9c2b51c3eb58c4fa81ee5e3a065cb9a493bc6d97ec02265b12a4b3949a`.

## Recoverable import verification

From the repository root, save the following Python in a worker scratch file
and run it with Python 3. It only reads repository files. A changed owner-packet
hash intentionally requires rechecking the imported contracts and review.

```python
import collections, hashlib, json, re
from pathlib import Path
root=Path.cwd(); base=root/'research/blueprint'
packet=json.loads((base/'packets/KTheoryLowDegrees--Z.4.json').read_text())
owner_path=base/'packets/KTheoryLowDegrees--Z.3.json';owner=json.loads(owner_path.read_text())
assert hashlib.sha256(owner_path.read_bytes()).hexdigest()==packet['importProvenance']['sha256']
stage='KTheoryLowDegrees:Z.4'
expected={n['id']:n for n in owner['nodes'] if stage in n.get('realises',[])}
assert not packet['nodes']
assert set(expected)=={n['nodeId'] for n in packet['imports']}
assert len(packet['imports'])==len(expected)==43
assert all(n['implementationStatus']=='unchecked' for n in expected.values())
assert all(n['implementationStatus']=='unchecked' for n in packet['imports'])
assert packet['coverage'][0]['status']=='source_decomposed' and not packet['coverage'][0]['remaining']
assert sorted(n for t in packet['targetCoverage'] for n in t['nodeIds'])==sorted(expected)
counts=dict(nodes=len(expected),kinds=dict(collections.Counter(n['kind'] for n in expected.values())),apiItems=sum(len(n.get('api',[])) for n in expected.values()),unitTests=sum(len(n.get('tests',[])) for n in expected.values()),planets=sum(bool(n.get('planet')) for n in expected.values()))
assert counts==packet['importedCounts']
reader=(base/'readmes/KTheoryLowDegrees--Z.4.md').read_text()
for d in packet['importedDefinitions']:
 n=expected[d['nodeId']]
 assert d['apiNames']==[a['name'] for a in n['api']]
 assert d['testNames']==[t['name'] for t in n['tests']]
 for name in d['apiNames']+d['testNames']:assert '`'+name.rsplit('.',1)[-1]+'`' in reader,name
for n in expected.values():assert '`'+n['id'].split('/',1)[1]+'`' in reader,n['id']
world={}; packets=[]
for path in sorted((base/'packets').glob('*.json')):
 p=json.loads(path.read_text());packets.append(p)
 for n in p.get('nodes',[]):world.setdefault(n['id'],n)
for path in sorted((root/'data/decompositions').glob('*.json')):
 p=json.loads(path.read_text());packets.append(p)
 for n in p.get('nodes',[]):world.setdefault(n['id'],n)
world.update({n['id']:n for n in owner['nodes']})
seen=set();active=set();leaves=set()
def visit(nid):
 if nid in active:raise AssertionError('dependency cycle: '+nid)
 if nid in seen:return
 seen.add(nid)
 if nid.startswith(('mathlib:','tauceti:')):return
 if nid not in world:leaves.add(nid);return
 active.add(nid)
 for pre in world[nid].get('prerequisites',[]):visit(pre)
 active.remove(nid)
for nid in expected:visit(nid)
assert not leaves, sorted(leaves)
relevant_gaps=[];relevant_requests=[]
for p in packets:
 for key,acc in [('gaps',relevant_gaps),('requests',relevant_requests)]:
  for g in p.get(key,[]):
   intersection=set(g.get('neededBy',[]))&seen
   if intersection:acc.append(dict(id=g.get('id',g.get('title')),neededBy=sorted(intersection)))
assert not relevant_gaps, relevant_gaps
assert not relevant_requests,relevant_requests
lean=(base/'suggested/KTheoryLowDegrees--Z.4.lean').read_bytes()
assert len(lean.splitlines())==packet['suggestedCheck']['lines']<=5000
assert hashlib.sha256(lean).hexdigest()==packet['suggestedCheck']['sha256']
for path in [base/'packets/KTheoryLowDegrees--Z.4.json',base/'readmes/KTheoryLowDegrees--Z.4.md',base/'suggested/KTheoryLowDegrees--Z.4.lean']:
 text=path.read_text()
 assert not re.search(chr(47)+r'(?:home|Users|tmp|private)'+chr(47)+r'|file:'+chr(47)*2,text),path
print(json.dumps(dict(importedCounts=counts,closure=dict(total=len(seen),blueprintNodes=sum(n in world for n in seen),baselineRefs=sum(n.startswith(('mathlib:','tauceti:')) for n in seen),unresolvedLeaves=sorted(leaves),cycles=0,intersectingGapRecords=relevant_gaps,intersectingRequestRecords=relevant_requests),readerApiAndTestNames='all present',leanHashAndSize='match',privatePaths='none'),ensure_ascii=False,indent=2))
```
