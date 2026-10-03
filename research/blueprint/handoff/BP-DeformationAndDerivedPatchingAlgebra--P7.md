# Finite equation jets and actual curve lengths — #551 checkpoint

Codex — codex-7e92bd, 2026-10-03. Winning claim 5963743079, bot
confirmation 5963744198. Mathematical base `bfef64afffd06e4c8a18b53a76c331a147dd7eb7`;
publication base `9a3905af27dd59b81ab74e7df6ff86d5398eeb12`. All twenty governing,
audit, ownership, deliverable and checker inputs were unchanged at publication.

Two new lemma nodes make the finite quotient argument explicit: an equation
jet is finite over any commutative coefficient ring in finitely many variables;
over a field, its actual series-ring length equals its finite coefficient
dimension. The combined native proof then establishes the existing ambient
length, shifted length balance, all-index equation length, actual cumulative
curve function and separate zero-equation signatures. It handles the N<d
branch separately. No subtraction or natural conversion of an unproved
infinite length occurs.

For R=k[[x,y]], v=(x,y), A=R/(f), q=image(v), and order(f)=d finite,
H_q,A(N)=binom(N+2,2)−binom(N+2−d,2), with natural subtraction before
the extended-natural cast. This includes units and nonreduced equations in
positive characteristic. The zero equation has the ambient triangular count.
Neither general multiplicity nor curve dimension is defined by this formula.

All 123 old statement, hypothesis, acceptance, API, test, use and source
contracts are preserved; 121 whole node objects are unchanged. Two old proof
plans/dependency lists consume the checked finite adapter and exactness API.
The canonical source is the full incoming source plus two lemma signatures
and three examples. The reader retains its whole incoming text after the
new current section. The reserved multiplicity object, eight partial stages,
source findings, two requests and all historical remaining lists are retained.

Inventory: 125 nodes (8 definitions, 22 constructions, 79 lemmas,
16 theorems), 125 API items, 115 definition/construction tests and 156 total
test records, 13 planets, 268 indexed baseline declarations, 15 gaps and
2 requests. This checkpoint adds two lemmas and three tests; no API or
planet is added. All implementation statuses remain unchecked.

## Checks and proof boundary

The native source preserves the entire mathematical bodies of the incoming
975-line shifted-jet proof, the 121-line residue/length proof and the
128-line quotient-ring proof. Their imports are gathered into the top block;
no mathematical body is rewritten. The original hashes and archives are
checked by verify.py below. Credit remains with codex-J6LwjP, codex-a71f92,
codex-5ebb6f, codex-rtOQ9t, codex-7e92bd, ChatGPT —
gpt6astra-20261002-7d2f90 and ChatGPT Pro — cp-20261002-sr-c72e81.
The preceding complete handoff and its historical receipts remain available
[at the incoming base](https://github.com/CBirkbeck/tauceti-explorer/blob/bfef64afffd06e4c8a18b53a76c331a147dd7eb7/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
Earlier finite computational regressions were not rerun.

The combined native check contains 64 examples and 65 named axiom audits.
Every audit excludes sorryAx and uses only propext, Classical.choice and
Quot.sound. Five existing actual-curve tests are freshly checked, along with
three new finite-coefficient/rank tests. The graded-function example is not
claimed proved. Eight declaration headers and eight example headers match
the admitted canonical source exactly after whitespace normalization.

Both complete files elaborate in the existing Lean 4.34.0-rc2 / exact
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build. They import no
Tau Ceti module. The shared checkout's Tau Ceti HEAD is
cf386627e9176a3827c1a5fe804989fd94a4d216, not the source-audit pin; this
is full Mathlib-only elaboration. The independent source baseline remains
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each final compile had
45 GiB available, ran one Lean process with timeout 1200, and used no library
build, cache download, new project or language server. No compiler remains
running.

```json
{
  "Native": {
    "sourceSha256": "245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402",
    "normalizedLogSha256": "1c6b32b6725be1a7377c50f1a5ac40fa032a27c411f5f63fd0c496d70d3be2d4",
    "lines": 1430,
    "examples": 64,
    "axiomAudits": 65,
    "errors": 0,
    "warnings": 0,
    "admissionWarnings": 0,
    "sorryAx": 0,
    "availableGiBBeforeCompile": 45,
    "seconds": 7.2,
    "maxRSSKiB": 3511764
  },
  "Canonical": {
    "sourceSha256": "c9035fb0d224d44c110e99d6e5c777692f1b7c7a1a4d19833abc17f101d41b79",
    "normalizedLogSha256": "38cbb579368216055c73e9cfbb476be1d2dc2d17fd4b0e338c16f70c945c513b",
    "lines": 2792,
    "examples": 180,
    "axiomAudits": 0,
    "errors": 0,
    "warnings": 352,
    "admissionWarnings": 352,
    "sorryAx": 0,
    "availableGiBBeforeCompile": 45,
    "seconds": 25.11,
    "maxRSSKiB": 3550000
  }
}
```

The indexed packet checker has zero errors and warnings. Full contract and
header preservation, actual intake file checks and whitespace checks pass.
The actual assembler overlays candidate and original packets in the same
publication tree. All three graphs are acyclic; the R03.6 part is retained;
there are no unresolved declaration dependencies or new missing stage paths.
All 65 accepted restructure paths are reachable. Twelve of thirteen scoped
supplier paths are reachable: the inherited LocalFieldsRamification layer-0
→ R03.4 gap remains in candidate and control, with its recorded request.
Stage edges and other roadmaps' skipped/pending links are unchanged; this
roadmap has no skipped/pending links.

```json
{
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 125,
    "edges": 192,
    "acyclic": true
  },
  "combinedDAG": {
    "vertices": 3116,
    "edges": 8815,
    "acyclic": true
  },
  "reachableDeclarations": 126,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "reachableBaselineReferences": 237,
  "unresolved": [],
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "partDeclarations": 125,
  "partPlanets": 13,
  "roadmapDeclarations": 178,
  "requiredStagePairs": 13,
  "requiredStagePairsReachable": 12,
  "inheritedMissingStagePairs": [
    [
      "tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions",
      "DeformationAndDerivedPatchingAlgebra:R03.4"
    ]
  ],
  "acceptedRestructurePairs": 65,
  "acceptedRestructurePairsReachable": 65,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true
}
```

Fresh reading: complete issue before claiming and unchanged-body verification
after bot confirmation; incoming current handoff/proof recipe and continuation;
all eight applicable reviewed AUDIT-17 rows; campaign document, scoped stage
descriptions and original stage edges; accepted RS-08 own keeps/owners and
scoped link overlap; full reserved multiplicity entry and current owner node;
selected integrated depth/perfect-complex contracts. All three public proof
archives were recovered and hash-verified; the entire residue and quotient
proofs and selected incoming jet/shifted proof sections were freshly read.
DDPA-JET-HANDOFF §§3–4 and DDPA-CURVE-POSTULATION §§1–3 were freshly read.
HS-EQUATION-LENGTH-PIN records bounded native declaration reads and file
hashes. Earlier upstream-style and whole-source readings remain historical;
this is not a fresh complete read of every routed paper or the whole libraries.

Fresh open-PR search found [Mathlib #9819](https://github.com/leanprover-community/mathlib4/pull/9819),
head 413e5b872a7c758e0eb91f99cb96d6a61c81f0a2, still open. Its body and
file inventory were checked; the earlier full 131-line HilbertPolynomial
reading remains historical. Its general graded Hilbert–Serre work must be
reconciled before that open induction is implemented. No unmerged theorem is
used here. Two bounded public Zulip searches for Hilbert–Samuel/power-series
length and Hilbert polynomials returned no relevant mathematical thread;
this is not an absence proof.

## Recovery and reproduction

The complete checked native proof is archived in the allowed suggested path
at [6292c37bd3730574a75b771115a52ad684dcea31](https://github.com/CBirkbeck/tauceti-explorer/commit/6292c37bd3730574a75b771115a52ad684dcea31),
in an inert nested comment in the preceding commit. The final suggested file
removes only that archive comment and retains admitted bodies under PROTOCOL
§13. Save the following as recover.py in small disk scratch, then run it from
the existing clone with that scratch directory as argument. It fetches only
specific public commits if absent; it creates no repository snapshot.

```python
from pathlib import Path
import hashlib, subprocess, sys
out=Path(sys.argv[1]); assert out.is_dir()
archive="6292c37bd3730574a75b771115a52ad684dcea31"
base="bfef64afffd06e4c8a18b53a76c331a147dd7eb7"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
commits=[archive,base,"25a2ed36500d86f9158bfddf498d6f9f57a78ab3",
 "20fb961cd54398638ba6a9b1b9b818fb546163bf","30299125337a2f2532f316bd5390b3729c64c1b2"]
for commit in commits:
 if subprocess.run(["git","cat-file","-e",commit+"^{commit}"],
     stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL).returncode:
  subprocess.run(["git","fetch","origin",commit],check=True)
t=subprocess.check_output(["git","show",archive+":"+path],text=True)
canonical,nested=t.split("\n/- BEGIN ARCHIVED CHECKED EQUATION JET LENGTHS\n",1)
native=nested.split("END ARCHIVED CHECKED EQUATION JET LENGTHS -/\n",1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="245b3ef78743d357299ec7d332c46534d930aa3780f5cb466b39e494c39e2402"
assert hashlib.sha256(canonical.encode()).hexdigest()=="c9035fb0d224d44c110e99d6e5c777692f1b7c7a1a4d19833abc17f101d41b79"
(out/"Native.lean").write_text(native)
(out/"Canonical.lean").write_text(canonical)
packet="research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json"
(out/"original-packet.json").write_bytes(subprocess.check_output(["git","show",base+":"+packet]))
print("Recovered and hash-verified both checked sources and the original packet.")
```

After checking free -g reports at least 20 GiB available, from the existing
exact-pin build run one file at a time:
`/usr/bin/time -f 'Elapsed %e seconds; peak %M KiB' timeout 1200 lake env lean "$task_dir/Native.lean"`
and then the corresponding Canonical.lean command. Capture combined output.
For the diagnostic hash, drop the final Elapsed timing line, replace the
compiled filename by `<lean-file>` and retain a final newline.

Save the following as verify.py and run from the submitted clone with the
recovery directory as argument. SHA-256:
`b28c312f377243d3adfff2ec996386d788f79afbc0e6b61424721a8bf4b3a342`.

```python
from pathlib import Path
import collections, hashlib, json, re, subprocess, sys

root = Path.cwd()
s = Path(sys.argv[1])
stem = 'DeformationAndDerivedPatchingAlgebra--P7'
path = 'research/blueprint/suggested/' + stem + '.lean'
p = json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text())
old = json.loads((s/'original-packet.json').read_text())
byid = {n['id']: n for n in p['nodes']}
contracts = ['statement', 'hypotheses', 'acceptance', 'api', 'tests', 'uses', 'sources']
for n in old['nodes']:
    assert all(byid[n['id']].get(k) == n.get(k) for k in contracts), n['id']
changed = [n['id'] for n in old['nodes'] if n != byid[n['id']]]
assert sorted(x.rsplit('/',1)[-1] for x in changed) == [
    'plane-equation-jet-length', 'plane-equation-jet-length-balance']
for k, v in old.items():
    if k not in ['nodes','sources','baseline','gaps']:
        assert p[k] == v, k
assert p['baseline']['declarations'][:len(old['baseline']['declarations'])] == old['baseline']['declarations']
assert p['sources'][:len(old['sources'])] == old['sources']
assert p['gaps'][:-1] == old['gaps'][:-1]
assert p['gaps'][-1]['detail'].startswith(old['gaps'][-1]['detail'])
assert all(n['implementationStatus'] == 'unchecked' for n in p['nodes'])

native = (s/'Native.lean').read_text()
canonical = (s/'Canonical.lean').read_text()
assert canonical == (root/path).read_text()
base = p['equationLengthContinuation']['base']
incoming = subprocess.check_output(['git','show',base+':'+path],text=True)
assert canonical.startswith(incoming)
readerpath = 'research/blueprint/readmes/'+stem+'.md'
oldreader = subprocess.check_output(['git','show',base+':'+readerpath],text=True)
assert (root/readerpath).read_text().endswith(oldreader)
assert not re.search(r'\bsorry\b|\baxiom\b',native)

archives = [
 ('25a2ed36500d86f9158bfddf498d6f9f57a78ab3', 'EXACT ORDER SHIFTED JETS',
  '7df121750db08c9caf5a04386c16f9b835a7e05642c586cab997d7a0870c8111'),
 ('20fb961cd54398638ba6a9b1b9b818fb546163bf', 'SERIES RESIDUE AND LENGTH',
  'e123da1f4b68b77a81bd08a2fb116c7a77f5475b568af9c8872e33ea5959321d'),
 ('30299125337a2f2532f316bd5390b3729c64c1b2', 'QUOTIENT RING HILBERT SAMUEL',
  'cd8cb5cd1291a582f25dc0363a0a8d020b1bcc57b79766b3471388f2862d3c11')]
for commit, marker, expected in archives:
    t = subprocess.check_output(['git','show',commit+':'+path],text=True)
    body = t.split('BEGIN ARCHIVED CHECKED '+marker+'\n',1)[1].split(
        'END ARCHIVED CHECKED '+marker,1)[0]
    assert hashlib.sha256(body.encode()).hexdigest() == expected
    body = ''.join(l for l in body.splitlines(keepends=True) if not l.startswith('import '))
    assert body in native

def header(t, start):
    tail = t[t.index(start):]
    end = re.search(r' := (?:by(?: sorry)?\n|rfl\n|\n)',tail)
    assert end, start
    return ' '.join(tail[:end.start()].split())

names = ['equationJet_finite','equationJet_length_eq_finrank',
 'totalJet_length_eq_finrank','planeTotalJet_length','planeEquationJet_length_balance',
 'planeEquationJet_length','planeCurve_function','planeZeroEquation_function']
for name in names:
    assert header(native,'lemma '+name+' ') == header(canonical,'lemma '+name+' '),name
tests = ['PlaneCurveAcceptance.'+x for x in ['unit_boundary','zero_equation_six',
 'smooth_linear','nonreduced_cumulative','below_equation_order']]
tests += ['HilbertSamuelEquationJetTest.'+x for x in ['nonreduced_rank',
 'nilpotent_coefficients_finite','zero_coefficients_finite']]
for name in tests:
    assert header(native,'-- test: '+name+'\n') == header(canonical,'-- test: '+name+'\n'),name

print(json.dumps(dict(oldContractsPreserved=len(old['nodes']),
 wholeOldNodesUnchanged=len(old['nodes'])-len(changed),
 canonicalPrefixPreserved=True,readerSuffixPreserved=True,
 predecessorProofBodiesPreserved=len(archives),namedHeadersMatched=len(names),
 exampleHeadersMatched=len(tests),nodes=len(p['nodes']),
 kinds=dict(collections.Counter(n['kind'] for n in p['nodes'])),
 apiItems=sum(len(n.get('api',[])) for n in p['nodes']),
 totalTestRecords=sum(len(n.get('tests',[])) for n in p['nodes']),
 definitionConstructionTests=sum(len(n.get('tests',[])) for n in p['nodes']
     if n['kind'] in ['definition','construction']),
 planets=sum('planet' in n for n in p['nodes']),
 baselineDeclarations=len(p['baseline']['declarations']),gaps=len(p['gaps']),
 requests=len(p['requests'])),indent=2))
```

Save the following actual assembler check as graph.py and run from the
submitted clone with original-packet.json as argument. It does not write
atlas files or add artificial realization edges. SHA-256:
`1df378b97a169e8ebf8a89036aaf6170d5dfa79a3cb512587f2dbfd9277c7a3b`.

```python
from pathlib import Path
import sys,json,copy,collections
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((Path.cwd()/'research/blueprint/packets'/f'{STEM}.json').read_text())
original=json.loads(Path(sys.argv[1]).read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
world={}
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
 for path in sorted((root/folder).glob("*.json")):
  q=json.loads(path.read_text())
  for n in q.get("nodes",[]):world.setdefault(n["id"],n)
world.update(new)
stages={x["id"]:x for x in a["stages"]}
stageids=set(stages)|set(check_blueprint.world()[1])
stageedges={(e["source"],e["target"]) for e in a["stageEdges"]}
def dag(vertices,edges):
 vertices=set(vertices)|{v for edge in edges for v in edge}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for source,target in edges:
  if target not in out[source]:out[source].add(target);indeg[target]+=1
 stack=[v for v,count in indeg.items() if count==0];count=0
 while stack:
  v=stack.pop();count+=1
  for w in out[v]:
   indeg[w]-=1
   if indeg[w]==0:stack.append(w)
 assert count==len(vertices),[v for v,count in indeg.items() if count][:15]
 return {"vertices":len(vertices),"edges":len(edges),"acyclic":True}
ownedges={(q,nid) for nid,node in new.items() for q in node.get("prerequisites",[]) if q in new}
stack=list(new);seen=set();dep=set();unresolved=set();baseref=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 for q in world[nid].get("prerequisites",[]):
  if q.startswith(("mathlib:","tauceti:")) and q not in stageids:baseref.add(q);continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
dep|={(n["parentStageId"],nid) for nid,n in new.items() if n.get("parentStageId") in new}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
out=collections.defaultdict(set)
for source,target in stageedges:out[source].add(target)
def reachable(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(out[v]-seen)
 return False
pairs={(e["source"],e["target"]) for e in a0["stageEdges"] if e["target"].startswith(RID+":")}
for node in p["nodes"]:
 for q in node.get("prerequisites",[]):
  if q in stageids and q not in world and q!=node["parentStageId"]:pairs.add((q,node["parentStageId"]))
for req in p.get("requests",[]):
 for consumer in req.get("neededBy",[]):
  if consumer in new:pairs.add((req["supplier"],new[consumer]["parentStageId"]))
  elif consumer in stageids:pairs.add((req["supplier"],consumer))
missingpairs={(s,t) for s,t in pairs if not reachable(s,t)}
oldout=collections.defaultdict(set)
for edge in b['stageEdges']:oldout[edge['source']].add(edge['target'])
def reachable0(source,target):
 stack=[source];seen=set()
 while stack:
  v=stack.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);stack.extend(oldout[v]-seen)
 return False
assert missingpairs=={(s,t) for s,t in pairs if not reachable0(s,t)}
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
# Independently retain all accepted restructure links touching the whole roadmap.
acceptedpairs=set()
for path in (root/"research/blueprint/restructure").glob("*.result.json"):
 q=json.loads(path.read_text())
 if q.get("review",{}).get("status")!="accepted":continue
 for row in q.get("links",[]):
  if any(row.get(k,"").startswith(RID+":") for k in ["source","target"]):
   acceptedpairs.add((row["source"],row["target"]))
assert all(reachable(s,t) for s,t in acceptedpairs),[(s,t) for s,t in acceptedpairs if not reachable(s,t)]
report={"stageDAG":dag(stages,stageedges),"ownDAG":dag(new,ownedges),
 "combinedDAG":dag(set(stages)|seen,stageedges|dep),"reachableDeclarations":len(seen),
 "externalDeclarations":sorted(seen-set(new)),"reachableBaselineReferences":len(baseref),
 "unresolved":sorted(unresolved),"otherPartsRetained":[stem for stem,_ in otherparts],
 "partDeclarations":len(new),"partPlanets":sum("planet" in n for n in p["nodes"]),
 "roadmapDeclarations":roadmap["blueprint"]["declarations"],
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missingpairs),
 "inheritedMissingStagePairs":sorted(missingpairs),
 "acceptedRestructurePairs":len(acceptedpairs),"acceptedRestructurePairsReachable":len(acceptedpairs),
 "stageEdgesUnchanged":True,"otherSkippedPendingUnchanged":True,"ownSkippedPendingEmpty":True}
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

## Continuation

Use the checked all-index cumulative formula to prove the existing native
gradedFunction formula, its rational postulation defect and sharp cumulative
agreement threshold, preserving the zero/unit and low-cutoff boundaries.
The existing polynomial identification still relies on its general existence
and uniqueness theorem. Prove the full tangent-cone kernel, actual curve
dimension and intrinsic/ambient multiplicity comparisons.

General Hilbert–Serre induction (reconciling #9819), degree/dimension,
Artin–Rees, finite top-dimensional localized lengths, associativity,
completion, parameter-ideal and regular-local comparisons, all P7/P8/P9 and
R03.1–R03.5 targets and every routed-paper obligation remain open. The two
supplier requests and the inherited local-field path gap are unchanged.
