# BP-DeformationAndDerivedPatchingAlgebra--P7 — principal quotient multiplication

**Partial checkpoint by Codex — codex-5ebb6f, 2026-10-02. Refs #551.** Winning claim `5961837497`, bot confirmation `5961839745`. Publication includes main at `9f4ec81d1839ece8d10129830133db03a6d5d430`, merged into this worker’s branch after all job inputs and binding instructions were verified unchanged. The mathematical input is main at `13f9d3f1562ceaaf4b305a800542a67aa53d3ea9`; the pinned libraries remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## What changed

Five new declaration-sized nodes supply the ring-level algebra used by the existing shifted-jet argument: ideal-power multiplication denominator; actual principal multiplication between ideal quotients; its range–kernel equality and surjective projection; its exact injectivity criterion; and bijectivity when the equation already belongs to the target ideal. For any commutative A, actual ideals J,K and f with fJ⊆K, multiplication μ:A/J→A/K sends [g] to [fg] and the actual projection π:A/K→A/((f)+K) sends [g] to [g]. The proof of range μ=ker π uses representatives x=af+b, b∈K. It works with zero divisors and f=0; injectivity remains a separate condition fg∈K⇒g∈J.

The canonical packet, reader and suggested file add this strand. Four existing proof outlines import it; all 108 incoming statements, hypotheses, acceptance criteria, APIs, tests, uses and sources are preserved, with 104 entire incoming node objects unchanged. The reserved general multiplicity definition is byte-for-byte equal as a parsed node object. All existing gaps, requests and eight stage-coverage records are unchanged. The packet now has 113 nodes (8 definitions, 20 constructions, 69 lemmas, 16 theorems), 117 API items, 103 definition/construction tests (122 total test records), 13 planets, 233 baseline references, 15 gaps and 2 requests. Zero stages are closed.

Seven checked examples cover d=n and n=d=0, the zero equation, the unit equation, a noninjective but right-exact map over ℤ/4, a genuinely nonzero shifted map A/(2)→A/(2)² over ℤ/4, and the failure of unshifted multiplication by 2 on ℤ/(4) despite the ambient ring being a domain. The latter two reject a zero-map replacement and an unjustified domain cancellation. Native ideal quotients and their chosen maps are used throughout.

The [complete incoming handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/13f9d3f1562ceaaf4b305a800542a67aa53d3ea9/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md) retains all preceding work, source/regression credit and receipts. Its latest quotient-ring length prototype is credited to Codex — codex-rtOQ9t, PR #5883, archived at `30299125337a2f2532f316bd5390b3729c64c1b2`. The older mathematical/regression source `ab76ddae905be2ec38836c070c5495c6d1c4e3c0`, by ChatGPT Pro — cp-20261002-sr-c72e81 and integrated by Codex — codex-J6LwjP, remains historical; its 36,686-assertion regression was not rerun. The residue-length archive `20fb961cd54398638ba6a9b1b9b818fb546163bf` remains historical. The new native file is independent of all preceding prototype files and has no admissions.

## Reading and mathematical boundary

The whole issue was read before and after bot confirmation, along with all eight applicable reviewed library-audit records, the campaign document, incoming handoff, key-definition entry and applicable accepted RS-08 keeps, owners, links and review. All incoming node contracts are preserved mechanically; selected current shifted-jet nodes were read in full for the new specialization. The source handoff’s §4 was freshly read in full, including sequences (6) and (7) and the small-index counterexample. This is selected-source research, not a new full survey of every routed paper.

Actual native statements and their ambient assumptions were read at the exact pin: quotient mapQ/representatives, factor and its complete surjectivity proof; quotient equality/zero criterion and mkQ surjectivity; singleton ideal membership, membership in (f)+K and containment; ideal multiplication membership and two-sided power addition including exponent zero; actual linear mulLeft; and both zero-kernel characterizations. Eight new baseline records are appended; already built generic quotient, kernel and ideal algebra receive no duplicate construction nodes. Bounded name searches in pinned Mathlib and Tau Ceti RingTheory and the atlas packets found no matching specialized principal-quotient adapter names. This is not an exhaustive absence claim. Fresh order and truncation inspection is recorded as continuation investigation only; no variable-ideal/order or total-jet kernel theorem was established here.

In the series application take A=R, J=v^(N+1−d), K=v^(N+1). The separate order-to-ideal adapter must still prove f∈v^d; ideal-power-mul-denominator then supplies fJ⊆K. The generic exactness proof can be imported. To obtain left injectivity one must prove the reverse-membership condition using exact finite order, native order_mul and the variable-ideal adapter. The arbitrary-ring primitive does not smuggle that condition into a data field, nor claim the series injectivity theorem. For small indices, first establish f∈v^(N+1), then use the proved projection lemma.

## Compilation and preservation receipts

The complete 186-line actual native prototype elaborated with 0 errors, 0 warnings and 0 admissions. All eight named declarations were audited without sorryAx. Its seven examples are proved. The complete 2438-line canonical suggested file elaborated with 145 examples, 0 errors, 309 expected admission warnings and 0 other warnings. All 15 new native/canonical declaration and example headers agree; every new canonical body is admitted in accordance with PROTOCOL §13. No implementation status changes.

Both runs used one Lean process at a time, the existing exact-pinned Mathlib build and Lean v4.34.0-rc2. Memory was checked before each run (56 GiB available); the timeout was 20 minutes. No Lake project, library setup, cache download or language server was used, and no compiler remains running.

```json
{
  "native": {
    "sourceSha256": "1a1603703e935b9e81014dba4f2020e52bab8391b2afc9961b21271a357cf7aa",
    "normalizedLogSha256": "1cfdfeb9d826309cbcec5a78df58c7bbddf2e221989f5f56d680db8a5e820774",
    "lines": 186,
    "examples": 7,
    "errors": 0,
    "admissionWarnings": 0,
    "otherWarnings": 0,
    "axiomAudits": 8,
    "availableGiBBefore": 56,
    "elapsedSeconds": 1.7,
    "maxRSSKiB": 2567192
  },
  "canonical": {
    "sourceSha256": "e5ef713601bb5e18c5cf2532056c1d5378938906cac3c55930786c1b4afbcff4",
    "normalizedLogSha256": "234435b9d8272f2ddaa10ac077acb52a068f386ea7122a1b87c0bf584e156a9b",
    "lines": 2438,
    "examples": 145,
    "errors": 0,
    "admissionWarnings": 309,
    "otherWarnings": 0,
    "axiomAudits": 0,
    "availableGiBBefore": 56,
    "elapsedSeconds": 23.71,
    "maxRSSKiB": 3547700
  },
  "preservedIncomingContracts": 108,
  "wholeNodeObjectsUnchanged": 104,
  "nativeCanonicalHeadersMatched": 15,
  "newNodes": 5,
  "allStatuses": "unchecked",
  "stageCoverageUnchanged": true,
  "reservedMultiplicityObjectUnchanged": true,
  "partial": true
}
```

The indexed blueprint checker reports 0 errors and 0 warnings. The actual intake’s four-file scanner and whitespace/scope checks pass. The actual read-only build.py projection replaces only this P7 packet; all other promoted parts, including this roadmap’s R03.6 packet, remain in both trial and control overlays. Stage, own-declaration and combined recursive-declaration graphs are acyclic; all 63 required original/accepted-RS-08 stage paths are reachable. No unresolved prerequisite, own skipped link, fabricated realization edge or change to the stage-edge or unrelated skipped-link sets is introduced. The roadmap keeps all 166 declarations across its parts. No atlas data is written.

```json
{
  "actualAssembler": true,
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 113,
    "edges": 173,
    "acyclic": true
  },
  "stagesAndReachableDeclarations": {
    "vertices": 3104,
    "edges": 8794,
    "acyclic": true
  },
  "reachableDeclarations": 114,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "reachableBaselineReferences": 205,
  "unresolved": [],
  "ownSkippedLinks": [],
  "otherSkipsMatchOriginal": true,
  "stageEdgesUnchanged": true,
  "requiredStagePairs": 63,
  "requiredStagePairsReachable": 63,
  "inheritedMissingStagePairs": [],
  "unchangedNodeObjects": 104,
  "partDeclarations": 113,
  "partPlanets": 13,
  "roadmapDeclarations": 166,
  "scriptSha256": "e340e078d7f99367b63b2f2be585b4a82a99ad3cc556b5818994af95b7d4c097"
}
```

## Public native reproduction

The actual proved source is archived, byte-for-byte, in a block comment in the allowed suggested file at [immutable proof commit 4c5fd9654e1f835ffdbc7f184c4a6409d0a3216b](https://github.com/CBirkbeck/tauceti-explorer/blob/4c5fd9654e1f835ffdbc7f184c4a6409d0a3216b/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean), between the unique BEGIN/END ARCHIVED CHECKED PRINCIPAL QUOTIENT MULTIPLICATION markers. It is removed from the final canonical file so that its new active bodies remain admitted signatures. The public commit preserves the reusable proofs and examples.

Save the following as reconstruct.py and run it from the repository root, passing your own on-disk scratch directory as its sole argument. The selected public commits must exist in the local Git object store. No private worker path or vanished scratch file is required.

```python
import sys,subprocess,hashlib
from pathlib import Path
folder=Path(sys.argv[1]);folder.mkdir(parents=True,exist_ok=True)
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
archived=subprocess.check_output(["git","show","4c5fd9654e1f835ffdbc7f184c4a6409d0a3216b:"+path])
start=b"BEGIN ARCHIVED CHECKED PRINCIPAL QUOTIENT MULTIPLICATION\n"
end=b"END ARCHIVED CHECKED PRINCIPAL QUOTIENT MULTIPLICATION"
proof=archived.split(start,1)[1].split(end,1)[0]
assert hashlib.sha256(proof).hexdigest()=="1a1603703e935b9e81014dba4f2020e52bab8391b2afc9961b21271a357cf7aa"
(folder/"principal-native.lean").write_bytes(proof)
base="13f9d3f1562ceaaf4b305a800542a67aa53d3ea9"
original=subprocess.check_output(["git","show",base+":research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json"])
(folder/"base-DeformationAndDerivedPatchingAlgebra--P7.json").write_bytes(original)
print("Proof hash checked; original projection control saved.")
```

In an already existing build at the recorded Mathlib pin, run lake env lean on the reconstructed principal-native.lean and the complete final suggested file, respecting WORKERS’ memory, single-process and timeout rules. No library build or cache download is needed. Normalize diagnostic source paths to basenames when comparing the recorded log hashes. Source hashes are exact; resource usage and diagnostics may vary with the build environment.

Save this exact next fragment as graph.py in the same scratch directory and run it from the repository root with that directory as its first argument. It reads the checked-in atlas, retains every other promoted part, and writes overlays/receipts only to the supplied scratch directory. Its source hash appears in the graph receipt.

```python
import sys,json,hashlib
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sc=Path(sys.argv[1]).resolve();sys.path.insert(0,str(root/'scripts'));from build import assemble
stem='DeformationAndDerivedPatchingAlgebra--P7';rid='DeformationAndDerivedPatchingAlgebra';packet=json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text());original=json.loads((sc/('base-'+stem+'.json')).read_text())
def overlay(name,p):
 d=sc/name;d.mkdir(exist_ok=True)
 for f in (root/'data/blueprints').iterdir():
  if f.name==stem+'.json':continue
  t=d/f.name
  if not t.exists():t.symlink_to(f,target_is_directory=f.is_dir())
 (d/(stem+'.json')).write_text(json.dumps(p))
 return d
a,ctx=assemble(require_distances=False,blueprints=overlay('overlay',packet));control,cctx=assemble(require_distances=False,blueprints=overlay('control',original))
def stats(vertices,edges):
 vs=set(vertices);out=defaultdict(set);ins=defaultdict(int)
 for s,t in edges:
  vs.update([s,t]);out[s].add(t)
 for s in out:
  for t in out[s]:ins[t]+=1
 q=deque(sorted(v for v in vs if ins[v]==0));n=0
 while q:
  s=q.popleft();n+=1
  for t in out[s]:
   ins[t]-=1
   if ins[t]==0:q.append(t)
 return {'vertices':len(vs),'edges':sum(map(len,out.values())),'acyclic':n==len(vs)},out
stages={s['id'] for s in a['stages']};se={(e['source'],e['target']) for e in a['stageEdges']};ce={(e['source'],e['target']) for e in control['stageEdges']}
# Exact virtual upstream stage references are graph vertices, never library leaves.
st,following=stats(stages,se)
own={n['id']:n for n in packet['nodes']};oe={(x,n['id']) for n in own.values() for x in n['prerequisites'] if x in own};og,_=stats(own,oe)
universe={}
for folder in ['data/decompositions','research/blueprint/packets','data/blueprints']:
 for f in sorted((root/folder).glob('*.json')):
  p=json.loads(f.read_text())
  for n in p.get('nodes',[]):universe[n['id']]=n
universe.update(own);reachable={};unresolved=set();baselines=set();dep=set();todo=list(own)
while todo:
 nid=todo.pop()
 if nid in reachable:continue
 n=universe[nid];reachable[nid]=n
 for ref in n.get('prerequisites',[]):
  if ref in universe:
   dep.add((ref,nid));todo.append(ref)
  elif ref in stages or ref.startswith('tauceti:TauCetiRoadmap/'):
   stages.add(ref);dep.add((ref,nid))
  elif ref.startswith(('mathlib:','tauceti:')):baselines.add(ref)
  else:unresolved.add(ref)
combined,_=stats(stages|set(reachable),se|dep)
# Required stage paths come from the original touching links and binding RS-08.
# Planet declaration ids are not their parent stage ids.
scope=set(packet['scope']);pairs=set()
for path in ['data/atlas.json','data/restructure/RS-08.result.json']:
 record=json.loads((root/path).read_text())
 for edge in record.get('stageEdges',record.get('links',[])):
  if edge['source'] in scope or edge['target'] in scope:
   pairs.add((edge['source'],edge['target']))
def reaches(s,t):
 seen=set();todo=[s]
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo.extend(following.get(x,()))
 return False
missing=[list(x) for x in sorted(pairs) if not reaches(*x)]
roadmaps={r['id']:r for r in a['roadmaps']};cr={r['id']:r for r in control['roadmaps']}
skips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in a['roadmaps'] if r['id']!=rid}
cskips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in control['roadmaps'] if r['id']!=rid}
unchanged=sum(own[n['id']]==n for n in original['nodes']);assert unchanged==104
rec={'actualAssembler':True,'stageDAG':st,'ownDeclarationDAG':og,'stagesAndReachableDeclarations':combined,'reachableDeclarations':len(reachable),'externalDeclarations':sorted(set(reachable)-set(own)),'reachableBaselineReferences':len(baselines),'unresolved':sorted(unresolved),'ownSkippedLinks':roadmaps[rid]['blueprint']['skippedLinks'],'otherSkipsMatchOriginal':skips==cskips,'stageEdgesUnchanged':se==ce,'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'inheritedMissingStagePairs':missing,'unchangedNodeObjects':unchanged,'partDeclarations':len(own),'partPlanets':sum('planet' in n for n in own.values()),'roadmapDeclarations':roadmaps[rid]['blueprint']['declarations'],'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
assert st['acyclic'] and og['acyclic'] and combined['acyclic'];assert not unresolved;assert se==ce and skips==cskips and not missing
(sc/'graph-receipt.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec,indent=2))
```

## Resume here

Integrate the eight actual bodies if implementation is requested. Keep the quotient maps’ explicit representative formulas, the legitimate denominator containment, and the separate injectivity criterion. Specialize the primitives in the four existing jet proof outlines once the variable-ideal-power-order bridge is proved.

The next missing mathematical strand remains finite-variable algebraic ideal powers versus total order, followed by total-jet kernel/equivalence/basis/count, series shifted injectivity and every-index plane-curve length. All cumulative/graded indexing, zero-equation, unit, zero-cutoff, positive-characteristic and nonreduced boundaries in the incoming handoff remain binding. General Hilbert–Serre/support-dimension, Artin–Rees, completion, associativity, intrinsic versus ambient-degree normalization, both external requests and every P7/P8/P9 and R03.1–R03.5 routed-paper obligation remain required. The general owner and accepted RS-08 supplier boundaries are preserved. This is a depth checkpoint with zero stages or full source routes closed.
