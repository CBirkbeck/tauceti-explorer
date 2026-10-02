# #551 quotient-ring Hilbert–Samuel comparison checkpoint

Partial checkpoint by Codex — `codex-rtOQ9t`, 2026-10-02. Winning claim [5961368083](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5961368083), confirmed by [5961370626](https://github.com/CBirkbeck/tauceti-explorer/issues/551#issuecomment-5961370626). Base `9be0d75234d712fb5773663482ee55c38ac60ce0`.

The existing plane-curve quotient comparison now specializes a reusable result for every commutative ring A, ideals I,J and n≥0:

H(image(J),A/I,n) = length_A(A/(I+J^(n+1))).

The left-hand length is over A/I, the right-hand length over A. Both use the actual quotient and scalar structures. Three new declaration-sized lemmas supply this comparison, its specialization when I⊆J^(n+1), and antitonicity under I⊆I′. The function definition exports them as API. Six actual examples cover zero and unit equations, every-index field length one, strict quotient inequality, a zero-divisor coefficient ring, and the failure of scalar-length equality for ℝ→ℂ. All original plane-curve hypotheses and its exact Lean header are retained.

## What is preserved

All 105 inherited node statements, hypotheses, acceptance clauses, source citations, library destinations and statuses are unchanged. Of these, 103 complete node objects are unchanged. The only refinements are three API items/six tests/three uses on the existing raw function and a generic-lemma prerequisite/proof route on the plane-curve adapter. The reserved general multiplicity definition, every original source object, baseline prefix, source issue, request, owner boundary and planet are preserved. Coverage records retain their prior status and remaining obligations, with progress appended to R03.3 and its existing finite-jet gap.

The packet has 108 nodes (8 definitions, 19 constructions, 65 lemmas, 16 theorems), 114 API items, 98 definition/construction tests (115 total test records), 13 planets, 225 baseline references, 15 gaps and 2 requests. All eight stages remain partial/not_read; none is closed.

The [complete predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/9be0d75234d712fb5773663482ee55c38ac60ce0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md) retains the curve formulas, native signatures, all prior work and credited historical receipts. Its mathematical proof/regression predecessor is [ab76ddae](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md), authored by ChatGPT Pro — cp-20261002-sr-c72e81, integrated by Codex — codex-J6LwjP. Its 36,686-assertion finite regression was not rerun here. The earlier residue/length native archive at `20fb961cd54398638ba6a9b1b9b818fb546163bf` remains historical. No numerical arbitrary-series formula is proved by this continuation.

## Mathematical and reading boundary

Use the regular quotient-module ideal action, Ideal.map_pow, the built A-algebra double-quotient equivalence and its underlying A-linear equivalence. Restrict scalars through the actual surjection A→A/I and apply the built length equality for surjective scalar maps. No field, local, Noetherian, proper-ideal or finite-length premise is needed. For the containment specialization, rewrite the sum of ideals. For antitonicity, use the built ambient A-linear quotient factor and its surjectivity; extended lengths decrease. These are adapters for the existing function, not replacements for any built quotient carrier or equivalence.

Fresh work followed the full issue before and after the bot confirmed the claim; the governing instructions read earlier in this continuous worker loop are unchanged at this base, and WORKERS and the applicable API/test/suggested-file requirements were reread. All eight applicable reviewed AUDIT-17 entries, the accepted RS-08 own keeps and relevant owner decisions, all 63 original/accepted touching paths, the complete campaign README and all 31 own-roadmap records across 30 link-map files were inspected. Existing source read/unread boundaries remain in place. The at-least-two upstream-document readings from the continuing worker session remain prior reading, not a new claim of reading the predecessor's SemisimpleAlgebras/AlgebraicCurves documents in this checkpoint.

[Stacks 10.52](https://stacks.math.columbia.edu/tag/00IU), Definition 10.52.1 and Lemmas 10.52.3/10.52.5, statements and proofs, were freshly read. [Stacks 10.59](https://stacks.math.columbia.edu/tag/00K4), its opening cumulative formulas and ideal-of-definition variant, were freshly read. These are selected passages, not a fresh complete source survey. The additional downloaded length-section bytes have SHA-256 `418363ef436c9d4fad059bf24be2cd832947c9dcaa8623db885f93f126804232`. The general quotient identity is derived, not misattributed to a numbered source theorem. No new paper erratum, routed-paper closure or exhaustive library-absence claim is made.

Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` are retained. Exact relevant native declarations were personally read with their assumptions: Length (definition/zero, linear equivalence, scalar surjectivity, quotient inequality, simple-module and finite-rank lengths), Ideal/Maps (top action and image powers), Ideal/Quotient/Operations (zero quotient and double-quotient algebra equivalence), Ideal/Quotient/Defs (quotient surjectivity), Quotient/Basic (factor and surjectivity), Complex/FiniteDimensional (native real dimension two), Ideal/Defs (positive powers stay in an ideal), Algebra/Operations (zero submodule powers) and Field/ZMod (prime-modulus field instance). Only six missing baseline records are appended; existing suppliers are reused. A bounded pinned Tau Ceti RingTheory name search found no HilbertSamuel/function_ringQuotient adapter; it is not an exhaustive absence proof.

Fresh pinned source-byte hashes:

```json
{
  "Mathlib/RingTheory/Length.lean": "28058afb0a726d046c7ef25ef25f86707d64762129baf08106944bcde811b466",
  "Mathlib/RingTheory/Ideal/Maps.lean": "a6cde2f875c2c8b9ea1aa57cf3aa654d5fd80981349de49f28556c77b56d9c11",
  "Mathlib/RingTheory/Ideal/Quotient/Operations.lean": "25359917b64f9434dbff99f3033ecba35badb45d0a4e3468aead0ba87743d109",
  "Mathlib/RingTheory/Ideal/Quotient/Defs.lean": "f906662e22c49025984808feb489892afe51914ccc7a10b95d5f162ef4fbfe1d",
  "Mathlib/LinearAlgebra/Quotient/Basic.lean": "564aad5ee0111df700cb30aca030018f26939ed1c307f19ee6d9ac02b6bc4312",
  "Mathlib/LinearAlgebra/Complex/FiniteDimensional.lean": "bab7e57a9e0ae400e63b945280ac5c139e4f59d012fba52afaf3a155f3ddb0a2",
  "Mathlib/RingTheory/Ideal/Defs.lean": "656d5aabba0ca74ab1fc906dc9cdf93b9fc6c6b25f0f155b58f261ec461e80d1",
  "Mathlib/Algebra/Algebra/Operations.lean": "913909c0cc53d9f1a34cf059ee192a34bac9b6d62661a710a91bbc245a87f3cc",
  "Mathlib/Algebra/Field/ZMod.lean": "5343882be47490c292c9da2f623221d3d0ea16e0ff252f0f944b4dffb07be5c3"
}
```

## Native proof archive and canonical suggested file

The [immutable intermediate Lean file](https://github.com/CBirkbeck/tauceti-explorer/blob/ARCHIVE_PENDING/research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean) contains a comment-delimited **128-line standalone checked proof**, SHA-256 `cd8cb5cd1291a582f25dc0363a0a8d020b1bcc57b79766b3471388f2862d3c11`. The final suggested file removes that archive comment and keeps admitted canonical signatures as PROTOCOL §13 requires. The archive implements exactly the three new headers and the unchanged planeCurve_jet_length header, and proves exactly the six registered examples. The raw function definition matches the canonical function. Five axiom audits report only propext, Classical.choice and Quot.sound, with no admission axiom. It does not implement the numerical curve/jet theorems.

The native proof elaborated with **0 errors, 0 admissions and 0 warnings**. The complete **2346-line canonical suggested file** elaborated with **0 errors, 294 admission warnings and 0 other warnings**, containing 138 Lean examples. These examples include inherited unregistered examples, so their number differs from the packet's test count. Both runs used one Lean process at a time, an existing pinned Mathlib build and Lean v4.34.0-rc2, without Lake setup/cache/library builds or language servers. Available memory was checked before each run; timeout was 20 minutes. No compiler remains running.

The canonical file uses only Mathlib imports. Its signature elaboration checks types, not mathematical implementations; every node remains unchecked. Receipts use SHA-256 of exact source bytes and log text after replacing the absolute source invocation path with its basename. Timing/RSS is recorded separately from that normalized log.

```json
{
  "native": {
    "exitCode": 0,
    "errors": 0,
    "admissionWarnings": 0,
    "otherWarnings": 0,
    "availableGiB": 58,
    "seconds": 1.8,
    "maxRSSKiB": 2425820,
    "lines": 128,
    "examples": 6,
    "sourceSha256": "cd8cb5cd1291a582f25dc0363a0a8d020b1bcc57b79766b3471388f2862d3c11",
    "normalizedLogSha256": "f901d0ad0a2ba4c182afc6f647e156b6ce287af2fe0089f37bc8806aef50d4fb"
  },
  "canonical": {
    "exitCode": 0,
    "errors": 0,
    "admissionWarnings": 294,
    "otherWarnings": 0,
    "availableGiB": 57,
    "seconds": 23.61,
    "maxRSSKiB": 3536460,
    "lines": 2346,
    "examples": 138,
    "sourceSha256": "bf5a2054c6098ccb22efc2892b9641c060c7e64265e7504a0472ad9afcd9f6c2",
    "normalizedLogSha256": "052ba610001182433b541592152c761f971ce57a3403c42cc9672615a8b93cba"
  }
}
```

The indexed blueprint checker reports 0 errors and 0 warnings. Whitespace and four-file scope checks pass. The preservation/header checks confirm all original contracts, 103 original objects, four exact theorem headers and six exact example headers, with the nine new canonical bodies admitted. No blueprint or reader embeds Lean code.

## Actual atlas dependency check

The actual read-only scripts/build.py assembler used an overlay replacing only this P7 packet and a base-packet control overlay. Every other promoted packet, including the same roadmap's R03.6 part, is retained. Stage, own-declaration and combined stage/recursive-declaration graphs are acyclic. No own links are skipped and no prerequisite is unresolved. All 63 required original/accepted-RS-08 stage paths remain reachable. Stage edges and unrelated skipped-link sets match the control; the roadmap has 161 declarations rather than dropping its other part. The graph inserts no synthetic realization edges and treats upstream roadmap references as stage vertices. No atlas data was written.

```json
{
  "actualAssembler": true,
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 108,
    "edges": 166,
    "acyclic": true
  },
  "stagesAndReachableDeclarations": {
    "vertices": 3099,
    "edges": 8787,
    "acyclic": true
  },
  "reachableDeclarations": 109,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "reachableBaselineReferences": 197,
  "unresolved": [],
  "ownSkippedLinks": [],
  "otherSkipsMatchOriginal": true,
  "stageEdgesUnchanged": true,
  "requiredStagePairs": 63,
  "requiredStagePairsReachable": 63,
  "inheritedMissingStagePairs": [],
  "unchangedNodeObjects": 103,
  "partDeclarations": 108,
  "partPlanets": 13,
  "roadmapDeclarations": 161,
  "scriptSha256": "f91f4e23511a1215d22d29bc6b5c10a78d41fac86d3da92bc45f9d2413185f3a"
}
```

## Public reconstruction

From the repository at this PR's final revision, save the following as a Python script in your own disk scratch directory and run it with one argument naming that directory. It reconstructs the exact standalone proof from the public archive commit and obtains the exact original packet. No retired worker scratch is required.

```python
import sys, subprocess, hashlib
from pathlib import Path
folder=Path(sys.argv[1]).resolve(); folder.mkdir(parents=True,exist_ok=True)
archive="ARCHIVE_PENDING"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
raw=subprocess.check_output(["git","show",archive+":"+path]).decode()
start="BEGIN ARCHIVE_PENDINGD CHECKED QUOTIENT RING HILBERT SAMUEL\n"
end="END ARCHIVE_PENDINGD CHECKED QUOTIENT RING HILBERT SAMUEL"
proof=raw.split(start,1)[1].split(end,1)[0].encode()
assert hashlib.sha256(proof).hexdigest()=="cd8cb5cd1291a582f25dc0363a0a8d020b1bcc57b79766b3471388f2862d3c11"
(folder/"quotient-native.lean").write_bytes(proof)
base="9be0d75234d712fb5773663482ee55c38ac60ce0"
original=subprocess.check_output(["git","show",base+":research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json"])
(folder/"base-DeformationAndDerivedPatchingAlgebra--P7.json").write_bytes(original)
print("Proof source SHA-256 checked; original control packet saved.")
```

In an already existing build at the recorded Mathlib pin, invoke `lake env lean` on the reconstructed quotient-native.lean and the complete final suggested file, observing WORKERS' memory, single-process and timeout rules. Do not set up, download a cache or build any library. Normalize diagnostic source paths to basenames to compare the recorded log hashes. Different build environments may change diagnostics or resource usage; the exact source hashes and checked mathematical headers remain reproducible.

Save this exact next fragment as graph.py in that same directory and run it from the repository root with the directory as its first argument. It reads the checked-in atlas, preserves all promoted parts, and writes overlays/receipts only to the supplied scratch directory. Its source hash is the one in the graph receipt.

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
unchanged=sum(own[n['id']]==n for n in original['nodes']);assert unchanged==103
rec={'actualAssembler':True,'stageDAG':st,'ownDeclarationDAG':og,'stagesAndReachableDeclarations':combined,'reachableDeclarations':len(reachable),'externalDeclarations':sorted(set(reachable)-set(own)),'reachableBaselineReferences':len(baselines),'unresolved':sorted(unresolved),'ownSkippedLinks':roadmaps[rid]['blueprint']['skippedLinks'],'otherSkipsMatchOriginal':skips==cskips,'stageEdgesUnchanged':se==ce,'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'inheritedMissingStagePairs':missing,'unchangedNodeObjects':unchanged,'partDeclarations':len(own),'partPlanets':sum('planet' in n for n in own.values()),'roadmapDeclarations':roadmaps[rid]['blueprint']['declarations'],'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
assert st['acyclic'] and og['acyclic'] and combined['acyclic'];assert not unresolved;assert se==ce and skips==cskips
(sc/'graph-receipt.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec,indent=2))
```

## Resume here

The denominator/double-quotient/scalar comparison of the raw Hilbert–Samuel function now has a reusable checked native prototype; the exact existing plane-curve scalar identity is its specialization. Integrate those bodies if implementation is requested, retaining the existing function and actual quotient actions. Do not repropose the built third isomorphism or scalar descent as constructions.

Next prove the inherited variable-ideal/order and total-jet kernel/equivalence/basis/count bodies, then the shifted multiplication denominator/injectivity/exact sequence and the numerical all-index curve formulas. The containment adapter can consume the low-index ideal containment once that theorem is supplied. Tangent-cone kernel, curve dimension, intrinsic/ambient multiplicity, coefficient-extension/coordinate-change/embedded-prime results remain open. Preserve unit, zero, positive-characteristic and nonreduced boundaries.

General Hilbert–Serre induction and support-dimension, completion, Artin–Rees, associativity, both external requests, and all original P7/P8/P9 and R03.1–R03.5 routed-paper obligations remain required. RS-08 supplier boundaries are unchanged. This is a depth checkpoint; zero stages or full source routes are declared closed.
