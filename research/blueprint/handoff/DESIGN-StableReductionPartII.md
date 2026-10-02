# DESIGN-StableReductionPartII — native dual generator and correction checkpoint

Worker: Codex — codex-rtOQ9t. Refs #3342. Date: 2026-10-02.
Claim5959735522; bot confirmation5959737855. Complete issue read before claiming
and reread after confirmation. Base46ed8c0cbf3c6b017383bcbf58177a0c672dfcae.

## Result and limits

This is a partial blueprint checkpoint. It names and instantiates the existing
canonical dual generator ε on the native ideal J and correction map K on R.
It adds eight consumed lemma nodes, eight APIs and four tests to the packet,
reader and admitted suggested sketch. The actual proof bodies are preserved
in an immutable allowed-file archive and checked separately. Nothing is
reported formalized: all implementation statuses remain unchecked, all eight
stages partial, the shared geometric key and all existing gaps open.

The preceding handoff-only C1–C8 coefficient-module exactness, natural Hom
exchange, canonical bidual/Ext and specified cokernel derivations are preserved
in full at the base revision:

https://github.com/CBirkbeck/tauceti-explorer/blob/46ed8c0cbf3c6b017383bcbf58177a0c672dfcae/research/blueprint/handoff/DESIGN-StableReductionPartII.md

Their mathematical derivations are predecessor research. This checkpoint
integrates the native ε calculation and K composition; it does not attribute
the predecessor's regressions or certify its unintegrated C1–C7 claims.
The prior actual projection/splitting proofs were recovered verbatim from
637b45159fc2451aa40ce5b5cf9a31ce755c646f, checked again as dependencies, and
included in the new archive. Their original proof source SHA-256 is
3d93800d52ffe26a39e1ce5e793b5294fd27d03599472a652adaf0243a4720e9.
The complete preceding canonical-splitting handoff remains at:

https://github.com/CBirkbeck/tauceti-explorer/blob/18d7d3768b68d381b78021dcd84b4fe9114a8e98/research/blueprint/handoff/DESIGN-StableReductionPartII.md

## Exact algebra and dependencies

For any commutative coefficient ring A, including zero, retain the actual
F=X²+C(γY)X+C(δY²−q(s,t)) in A[Y][X], R=AdjoinRoot(F), coefficient map
ι, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt,
a=ιδ·v+ιδ·ιt+ιγ·u and J=span{c,d}. No polynomial truncation, chosen scalar
action, presentation axiom, inverse of d or substitute dual is introduced.

The native quotient relation gives cb+da=0. Monicity of F supplies free
A[Y]-module structure on the actual R. The built free-module torsion-freeness
instance makes multiplication by the monic Y−t injective on R; the inherited
algebra action identifies it with multiplication by d. This short route does
not assume the still-required full two-coefficient normal form.

Native binary ideal membership expresses j∈J as xc+yd. The witness
−ax+by satisfies d(−ax+by)=bj. Choose such a witness for each j; regularity
of d proves its uniqueness, additivity and R-linearity. This gives the named
`dualGenerator`, with dε(j)=bj, ε(c)=−a and ε(d)=b. The old existence/uniqueness,
generic values and extensionality APIs are proved on this actual carrier.
Both section-coordinate membership lemmas have real proofs in the archive.

Compose the existing coefficient-linear projection p(r)=r−ι(ev(r)) with
ε restricted to A to define the named `dualCorrectionMap`. Then
K(r)=ε(p(r)), dK(r)=b(r−ι(ev(r))),
K(rz)=rK(z)+ι(ev(z))K(r), K(c)=−a, K(d)=b and K(ι(α))=0.
The product formula follows by multiplying by d, using multiplicativity of
both ring maps and cancelling d. Cancellation proves uniqueness for arbitrary
A-linear K satisfying the characterization. The old three correction APIs and
three arbitrary-K tests keep their contracts.

Eight added lemma IDs under MC.2 are section-polynomial-monic,
section-polynomial-freeness, section-polynomial-relation,
section-dual-divisibility, section-dual-generator-formula,
section-dual-generator-values, section-dual-correction-formula and
section-dual-correction-product. The last two are consumed by coefficient
naturality and tensor-action plans. The two construction IDs remain unchanged;
their named maps are refinements of those owners, not new parallel objects.

Four named-map fixtures use the actual untruncated quotient: the nonreduced
Z/4 base at a nonzero section gives ε(d)=u+1; over F₃ the two values retain
the sign and u≠−u follows from the degree bound for the nonzero polynomial
X+X modulo a monic quadratic; characteristic two with unit discriminant gives
K(u)=u; and the product law gives K(rd)=rb for arbitrary r, detecting its
orientation at r=1. Five old arbitrary-map/zero-ring fixtures and seven inherited
splitting/projection fixtures are also proved, for sixteen examples total.
The older custom-presentation `dualSignThree` example stays admitted at head;
the new canonical sign fixture is proved. No statement parity for that older
custom-presentation test is claimed.

## Fresh reads and pinned-library boundary

WORKERS and the full issue were read; the binding protocol, expansion protocol
and upstream guide are unchanged from their earlier full reads in this ongoing
loop. The complete latest handoff and preceding canonical handoff, all125
inherited node statements, the eight own stage briefs and relevant full node
API/test contracts were read. Parent StableReduction layers1 and3 in the
reviewed library audit were freshly read with their targets, evidence and
duplication flags. StableReduction and JacobianChallenge upstream documents
were read in full earlier in this continuing session; no new whole-document
read is attributed here. No own PartII reviewed audit row was found.

The exact nineteen Yuan and two DGH route items assigned to this owner were
freshly read. The reserved `StableReductionPartII:key/moduli-curves`, six key
consumers, all binding routes, stage ownership and supplier requests are
preserved. No general matrix-factorization/MCM ownership is transferred from
StablePeriodicCurved; the existing restructuring proposal stays unapproved.

Fresh primary-source reading: Knudsen, arXiv:1106.1588v2 §3 Key Example through
the complete Proposition3.1 and Corollary3.2 proofs, HTML:
https://arxiv.org/html/1106.1588v2 . Published noetherian/unit-discriminant
hypotheses remain separate from the native arbitrary-ring algebra deductions.
Ile, arXiv:1110.3909, Definitions3.1/3.4, full Proposition3.5 and Remark3.6
proofs, printed pp.6–8, parsed primary PDF:
https://arxiv.org/pdf/1110.3909 . No whole-paper, screenshot, Bourbaki or
Eisenbud proof audit is claimed. Earlier bibliographic/PDF hashes and broader
reading inventories remain historical; no new source file hash was computed.

At Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 the actual full statements
and ambient hypotheses of the four new baseline entries were read:
AdjoinRoot.mk_self (AdjoinRoot.lean:222, blob1945b7728630a10baf56374f183be1bcfa3727f0),
Ideal.mem_span_pair (Ideal/Span.lean:154, blobab0d0df7f1a1c29ec6eb9588a3cc0cf2efdfde2a),
Module.Basis.isTorsionFree (Basis/Basic.lean:289, blob0a4b3f8556ca2e41bde93bfbad9dbe0b385f8ead),
LinearMap.restrictScalars (LinearMap/Defs.lean:427, blobf17b667368926cdb52b767809edd102254cda83d).
The actual priority-annotated Module.Free.instIsTorsionFree instance was also
read at FreeModule/Basic.lean:103, blobe91f04cde835056b8839f2bdc5a3f4668b58f5e2;
Lean uses it, but its name is not indexed. The packet cites its indexed
supporting basis theorem and does not plan the existing instance again.
The existing Monic.free_adjoinRoot, Monic.isRegular, monic_X_sub_C,
IsRegular.isSMulRegular and AdjoinRoot degree-bound statements were reread at
the pin. Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 remains an input;
this Mathlib-only prototype does not compile any Tau Ceti imports.

## Validation and durable reproduction

Indexed packet checker: zero errors/warnings.133 nodes (8 definitions,
35 constructions,27 lemmas,62 theorems,1 application),150 API items,
139 definition/construction tests plus two inherited exactness tests,35 planets,
77 baseline references,135 requests and14 gaps.

The exact complete submitted suggested file elaborates: exit0, zero errors,
187 admitted-proof warnings only,78 examples,13.50seconds, peakRSS2,934,236KiB,
65GiB available before compilation. Lean4.34.0-rc2 in the existing exact pinned
Mathlib build. No setup, cache download, dependency build or language server.

The separate actual 539-line canonical archive elaborates: exit0, zero errors
and warnings,16 examples,34 axiom prints,4.60seconds, peakRSS2,856,376KiB,
65GiB available. All printed axioms are contained in propext, Classical.choice
and Quot.sound where needed; no admitted-proof axiom. The thirteen inherited
and21 new canonical declaration signatures match head after whitespace,
lemma/theorem keyword and local-coordinate-notation normalization. All four
new example statements match head after whitespace. Compiling the admitted
head is not evidence for its remaining proofs.

The exact actual source is archived in the allowed suggested file at:

https://github.com/CBirkbeck/tauceti-explorer/blob/5e2a9a9380351b0dfa9dfd19e384be86d7b3a5d8/research/blueprint/suggested/StableReductionPartII.lean

Extract from that immutable revision, not the admitted final file:

```python
from pathlib import Path
import hashlib, subprocess
archive = "5e2a9a9380351b0dfa9dfd19e384be86d7b3a5d8"
path = "research/blueprint/suggested/StableReductionPartII.lean"
blob = subprocess.check_output(["git", "show", archive + ":" + path], text=True)
source = blob.split("BEGIN ARCHIVED CHECKED DUAL GENERATOR\n", 1)[1]
source = source.split("END ARCHIVED CHECKED DUAL GENERATOR\n", 1)[0]
assert hashlib.sha256(source.encode()).hexdigest() == "6f9da32441bc234d7b32ee00cd2342c33176a81a8c50d9c45211f403589840f8"
Path("canonical-section-dual.lean").write_text(source)
```

Use your own disk scratch and retain the final newline. Check free memory;
with at least20GiB available run one `lake env lean` on that absolute scratch
filename from an already-built exact pinned environment. Do not initialize
Lake, fetch a cache, build a library or run a server. The archive is a complete
standalone source with individual imports, definitions, actual proofs, all16
examples and34 axiom prints. Its diagnostic hash below excludes the timing
wrapper. The head diagnostic hash normalizes its filename to the repository
relative suggested path. Timings are observations, not reproducible hashes.

- Actual proof source: 6f9da32441bc234d7b32ee00cd2342c33176a81a8c50d9c45211f403589840f8
- Actual proof diagnostics: 0e5855c121d826fc8b49f03713de82452435d1aa2d097dbf619800a726d103e2
- Full admitted suggested file: 0086e2e8e5bda51b27a9426ca664bbace76f4ebc83223a67ea6719180a904245
- Full sketch normalized diagnostics: 042ba2d07b9eafcb2439ee5921248c139f1dcaef101e56453542217c5b032d29

The real read-only atlas assembler was called with own packet/definition
injected before decomposition trimming, and compared with the original packet.
Stages3,050/8,750, own declarations133/303, and scoped stages/declarations/requests
3,148/9,300 are acyclic. All81 computed required stage pairs are reachable;
no own skipped links; original stage edges and unrelated skips unchanged.
This is a scoped closure check, not a global audit of unrelated declarations.

All125 inherited IDs, kinds, statements, hypotheses, API/test contracts,
acceptance, sources, uses and unchecked statuses are preserved;119 old node
objects are identical. All135 requests,14 gaps,35 planets, consumer/key,
source/version, restructuring and upstream-import records and the old73
baseline entries are preserved. The roadmap definition is unchanged.
Four edited paths are all allowed issue deliverables. Private-path, whitespace,
signature/API/test, archive-extraction and indexed-baseline checks pass.

The complete fresh assembly/preservation recipe follows. Run it from the
repository root, placing the script in your own disk scratch; it writes only
a JSON receipt beside its own filename and does not regenerate atlas data.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="StableReductionPartII"
packetpath="research/blueprint/packets/"+rid+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="46ed8c0cbf3c6b017383bcbf58177a0c672dfcae"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if v.get("roadmapId")!=rid]+[(rid,packet)],
   {**ds,rid:"research/blueprint/readmes/"+rid+".md"},
   [x for x in defs if x.get("id")!=rid]+[definition])
 build.load_promoted=overlay
 return build.assemble(require_distances=False)[0]
a=assemble(p,r);control=assemble(old,oldr)
def dag(vertices,edges):
 vertices=set(vertices)|{x for e in edges for x in e};following=defaultdict(set);indegree=dict.fromkeys(vertices,0)
 for s,t in set(edges):
  following[s].add(t);indegree[t]+=1
 q=deque(v for v in vertices if not indegree[v]);seen=[]
 while q:
  v=q.popleft();seen.append(v)
  for w in following[v]:
   indegree[w]-=1
   if not indegree[w]:q.append(w)
 assert len(seen)==len(vertices),("cycle",sorted(v for v in vertices if indegree[v])[:10])
 return {"vertices":len(vertices),"edges":len(set(edges)),"acyclic":True}
se={(e["source"],e["target"]) for e in a["stageEdges"]}
ce={(e["source"],e["target"]) for e in control["stageEdges"]}
assert se==ce
stageids={s["id"] for s in a["stages"]}
own={n["id"]:n for n in p["nodes"]}
oe={(dep,n["id"]) for n in own.values() for dep in n.get("prerequisites",[]) if dep in own}
stageDAG=dag(stageids,se);ownDAG=dag(own,oe)
allnodes=dict(own)
for folder in ("data/decompositions","data/blueprints","research/blueprint/packets"):
 for path in sorted((root/folder).glob("*.json")):
  for n in json.loads(path.read_text()).get("nodes",[]):allnodes.setdefault(n["id"],n)
used=set(own);todo=list(own)
while todo:
 v=todo.pop()
 for d in allnodes[v].get("prerequisites",[]):
  if d in allnodes and d not in used:used.add(d);todo.append(d)
edges=set(se)
for v in used:
 n=allnodes[v]
 parent=n.get("parentStageId")
 if parent:edges.add((parent,v))
 for d in n.get("prerequisites",[]):
  if d in stageids or d in used:edges.add((d,v))
for request in p["requests"]:
 for v in request["neededBy"]:edges.add((request["supplier"],v))
combined=dag(stageids|used,edges)
following=defaultdict(set)
for s,t in se:following[s].add(t)
def reachable(s,t):
 todo=[s];seen=set()
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo+=list(following[x])
 return False
pairs=set()
for stage in r['stages']:
 for dep in stage.get('requires',[]):pairs.add((dep,rid+':'+stage['key']))
def stage_of(v):
 seen=set()
 while v in allnodes and v not in seen:
  seen.add(v);v=allnodes[v].get('parentStageId')
 return v
for n in own.values():
 for d in n.get("prerequisites",[]):
  if d in stageids and d not in allnodes and d!=stage_of(n['id']):pairs.add((d,stage_of(n['id'])))
for req in p["requests"]:
 for v in req["neededBy"]:
  target=stage_of(v)
  if req["supplier"]!=target:pairs.add((req["supplier"],target))
missing=[(s,t) for s,t in pairs if not reachable(s,t)]
assert not missing,missing
ar={x["id"]:x for x in a["roadmaps"]};cr={x["id"]:x for x in control["roadmaps"]}
assert ar[rid]["blueprint"]["declarations"]==133
assert ar[rid]["blueprint"]["planets"]==35
assert not ar[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("requests","gaps","sources","sourceIssues","sourceVersions","consumerCoverage","keyDefinitionCoverage","restructure","upstreamImportEncoding"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","acceptance","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
 assert all(t in own[id].get("api",[]) for t in n.get("api",[]))
assert p["baseline"]["declarations"][:len(old["baseline"]["declarations"])]==old["baseline"]["declarations"]
unchanged=sum(own[id]==n for id,n in on.items())
lean=(root/"research/blueprint/suggested/StableReductionPartII.lean").read_text()
for node in p["nodes"]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,roadmappath,"research/blueprint/readmes/"+rid+".md","research/blueprint/suggested/"+rid+".lean","research/blueprint/handoff/DESIGN-"+rid+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":133,"planets":35,"ownSkippedLinks":[],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairsReachable":len(pairs),"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix(".json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
```

Assembly script SHA-256: 892326134dc1670e5b1a4f0f19fa7b19827939fa8c5e16a5523186322031a592.

## Resume

Keep these canonical ε/K maps and the prior native projection. Integrate C1–C7
from the predecessor into granular consumed nodes after matching the libraries
and supplier owners: arbitrary coefficient-module monicity and exactness,
the two specified cokernel equivalences, natural Hom exchange and actual
bidual evaluation, both Ext vanishings and coefficient flatness. Preserve
canonical map formulas, matrix transposes and the negative second dual-cokernel
generator. Do not assume normal dual coordinates as a premise for ε.

Then finish the existing normal-coordinate/residue, tensor and coefficient
naturality APIs and tests, including arbitrary nonflat coefficient change.
The actual native scalar correction is now checked; its use in the full dual
coordinate action is still a separate unproved theorem.

The two-base completion comparison, Appendix relative stable-reflexivity
criterion and unacquired Bourbaki input/unproved exercise, pointed hull and
actual nodal-family identification, sheaf descent and arbitrary-base finite
presentation approximation remain open. MC.0–MC.7 moduli-stack/Hilbert/
properness, positivity, fine-level, determinant/Deligne-pairing, Picard/Torelli
and source-collation targets remain required. No geometric key, stage,
completion claim or general stable-reflexivity theorem is closed.

Open one checkpoint PR with Refs #3342; once the submission is taken in,
continue to the next available issue under WORKERS. No owned processes remain
running at submission; delete this job's scratch after the PR opens. All proof
bodies and reproduction material cited above survive in allowed immutable
repository history or this handoff.
