# Exact-order shifted jet quotients — partial checkpoint for #551

Codex — codex-J6LwjP, 2026-10-03. Winning claim 5963369810;
explicit bot confirmation 5963371332. The whole issue was read before
claim and reread after confirmation. Mathematical base:
`f0401e396395a306b58cb28db79f3b24721e6fb3`.
Publication guard: main `b80fdf573cd685fc5723bd55865eb7392a56c9c2` was
checked read-only; all 20 governing and incoming deliverable inputs are
unchanged from the mathematical base. Work remains on the worker’s own branch.

The new exact-order ideal-preimage lemma converts fg∈v^(d+r) to g∈v^r
by native order multiplicativity and cancellation of the finite left
addend d in ℕ∞. Zero arguments remain at infinite order. It imposes only
finite variables, commutative coefficients with no zero divisors and
exact finite order of f. Neither a field nor reduced equation is required.

The checked native prototype now proves the existing shifted denominator,
actual map/projection agreement with the preceding principal quotient
constructions, exact-order injection, range–kernel equality with a
surjective projection, and small-index projection bijectivity. Right
exactness uses only the lower-order bound over arbitrary commutative
coefficients. Twelve fresh native examples include the actual nonzero
image and injectivity for X_0⁴ over F₂, the unit/zero equations, a loose
order bound over ℚ, a nonzero zero-divisor kernel class over ℤ/4, the
small-index exclusion and unshifted multiplication failure over ℚ.

All 122 incoming statement/hypothesis/acceptance/API/test/use/source
contracts are retained; 117 entire node objects are unchanged. One lemma,
two construction API items and six test records are appended. Five prior
proof plans now explicitly consume the checked adapters. The general
reserved multiplicity object is unchanged. Every request, source finding,
coverage status and historical remaining obligation is preserved. All
nodes stay unchecked; all eight stages stay open.

Inventory: 123 nodes (8 definitions, 22 constructions, 77 lemmas,
16 theorems); 125 API items; 115 definition/construction tests and
153 total test records; 13 planets; 263 indexed baseline declarations;
15 gaps; 2 requests. The separate promoted R03.6 part remains present.

## Validation and mathematical boundary

The native file contains the predecessor's entire 531-line total-jet
prototype byte-for-byte and the complete mathematical body of the
186-line principal-quotient prototype (its top import block is supplied
by the combined file). Their original source hashes are respectively
`2bf7077e7323128a5568e0aa3f5da2022d890955fd757f016c57f0d43a44707c`
and `1a1603703e935b9e81014dba4f2020e52bab8391b2afc9961b21271a357cf7aa`.
Credit remains with codex-7e92bd, codex-a71f92, codex-5ebb6f and
ChatGPT — gpt6astra-20261002-7d2f90's source handoff. Earlier finite
computational regressions were not rerun. The present combined proof
was compiled afresh, including those actual native examples.

All 45 named declaration axiom audits exclude sorryAx; they use only
propext, Classical.choice and Quot.sound. The complete canonical file
retains every incoming byte following one additional import. Its nine
new declaration/example headers match the native proof, and every new
outer body is admitted under PROTOCOL §13. Native and canonical files
both elaborate at the existing Lean 4.34.0-rc2 / Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 build. No Tau Ceti module
is imported. There was one Lean process at a time, a 1200-second timeout,
47 GiB available before each final check, and no project/cache/library
build or language server. No compiler remains running.

The current full suggested source contains 177 examples; this count is
made from actual top-level example headers. The preserved incoming text
contains 171. Earlier historical count receipts are not rewritten.

```json
{
  "Native.lean": {
    "sourceSha256": "7df121750db08c9caf5a04386c16f9b835a7e05642c586cab997d7a0870c8111",
    "normalizedLogSha256": "2f1e6841c1a94a65fff957812489bb9d532d2bad8fcc062cefbe0f5f59eae702",
    "lines": 975,
    "examples": 44,
    "warnings": 0,
    "admissionWarnings": 0,
    "axiomAudits": 45,
    "errors": 0,
    "timing": "Elapsed 5.00 seconds; peak 3469308 KiB"
  },
  "Canonical.lean": {
    "sourceSha256": "46929f041d9a362c0f483e3da99beeefd3cf1f7e7741b0c406d41c3372686d7d",
    "normalizedLogSha256": "55206988d8a31290ddd8af96d854592f15f007a547f7bc33c35e0ac64d4a158b",
    "lines": 2750,
    "examples": 177,
    "warnings": 347,
    "admissionWarnings": 347,
    "axiomAudits": 0,
    "errors": 0,
    "timing": "Elapsed 24.01 seconds; peak 3549968 KiB"
  }
}
```

The indexed packet checker has zero errors and warnings. Actual intake
check-files covers all four authorized deliverables; whitespace, scope,
full contract preservation and the nine new header comparisons pass.
The actual read-only assembler compares candidate and original packet
promotion overlays, retaining the R03.6 part and all other promoted work.
The stage, own and combined recursive declaration graphs are acyclic.
No unresolved prerequisite or new missing supplier path is introduced.
All 65 accepted restructure paths are reachable. The inherited
LocalFieldsRamification layer-0 → R03.4 path remains missing in both
candidate and control (12 of 13 scoped supplier paths reachable); it is
preserved as a gap. Own skipped/pending links are empty, and the stage
edges and unrelated skipped/pending sets are unchanged.

```json
{
  "stageDAG": {
    "vertices": 3003,
    "edges": 8623,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 123,
    "edges": 187,
    "acyclic": true
  },
  "combinedDAG": {
    "vertices": 3114,
    "edges": 8810,
    "acyclic": true
  },
  "reachableDeclarations": 124,
  "externalDeclarations": [
    "DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds"
  ],
  "reachableBaselineReferences": 234,
  "unresolved": [],
  "otherPartsRetained": [
    "DeformationAndDerivedPatchingAlgebra--R03.6"
  ],
  "partDeclarations": 123,
  "partPlanets": 13,
  "roadmapDeclarations": 176,
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

Fresh reading scope: full issue pre/post claim, whole incoming handoff,
full campaign document and eight scoped atlas descriptions; all eight
applicable reviewed AUDIT-17 rows; accepted RS-08 scoped keeps, owners,
links and review acceptance; the full reserved Hilbert–Samuel survey and
current general owner node; relevant integrated depth/perfect-complex
contracts and the scoped link overlap. Source research reads the full
DDPA-JET-HANDOFF §4 and §3 comparison paragraphs, the complete recovered
principal proof and selected recovered jet-coordinate sections. Fresh
pinned statements/proofs and hashes are recorded in HS-SHIFTED-ORDER-PIN.
These are bounded library/source reads, not an absence claim, a fresh
full read of the 531-line predecessor or a new complete survey of every
routed paper. JacobianChallenge and StablePeriodicCurved upstream
roadmaps were read completely earlier in this continuous worker loop.
General source inventory and all routes remain inherited and open.

## Durable checked proof and recovery

The combined proof is publicly archived at
[25a2ed36500d86f9158bfddf498d6f9f57a78ab3](https://github.com/CBirkbeck/tauceti-explorer/commit/25a2ed36500d86f9158bfddf498d6f9f57a78ab3),
in a nested comment in the issue's allowed suggested path. The submitted
canonical file removes only that archive comment. The archive is an
ancestor of the submission. The following program extracts both checked
sources and verifies their actual hashes; save it as recover.py in a
small disk scratch directory and run from the existing clone with that
directory as the argument. Fetch the public immutable archive read-only
if absent; do not create a repository snapshot or a Lean project.

```python
from pathlib import Path
import hashlib,subprocess,sys
out=Path(sys.argv[1]);assert out.is_dir()
archive="25a2ed36500d86f9158bfddf498d6f9f57a78ab3"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
t=subprocess.check_output(["git","show",archive+":"+path],text=True)
canonical,nested=t.split("\n/- BEGIN ARCHIVED CHECKED EXACT ORDER SHIFTED JETS\n",1)
native=nested.split("END ARCHIVED CHECKED EXACT ORDER SHIFTED JETS -/\n",1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="7df121750db08c9caf5a04386c16f9b835a7e05642c586cab997d7a0870c8111"
assert hashlib.sha256(canonical.encode()).hexdigest()=="46929f041d9a362c0f483e3da99beeefd3cf1f7e7741b0c406d41c3372686d7d"
(out/"Native.lean").write_text(native)
(out/"Canonical.lean").write_text(canonical)
```

From the existing exact-pin build, after checking free -g shows at least
20 GiB available, run one file at a time:
`/usr/bin/time -f 'Elapsed %e seconds; peak %M KiB' timeout 1200 lake env lean "$task_dir/Native.lean"`
and the corresponding Canonical.lean command. Capture combined output.
For diagnostic hashing, discard the trailing “Elapsed” timing line and
replace the compiled filename with `<lean-file>`. The stated timing and
RSS are measurements of this combined proof, not estimates.

## Read-only graph reproduction

Recover the original packet from the mathematical base with git show;
save it as original-packets.json in scratch. Save the following actual
assembler program as graph.py and run it from the submitted repository
with that original packet as its argument. It writes no atlas files and
inserts no synthetic realization edges. Graph script SHA-256:
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

Use the checked shifted sequence, total-jet basis/count and native
quotient/scalar comparison to prove every-index curve lengths, including
the separate N<d case. Prove the full tangent-cone kernel, curve dimension
and actual intrinsic/ambient multiplicity comparisons. Do not identify
equation order with the general multiplicity definition by declaration.

General graded Hilbert–Serre induction (reconciling current Mathlib #9819),
degree/dimension, Artin–Rees, finite top-dimensional localization,
associativity, completion, parameter-ideal and regular-local comparisons,
all P7/P8/P9 and R03.1–R03.5 targets and every routed-paper obligation
remain open. The inherited local-field stage-path gap belongs to its
supplier/owner reconciliation. The existing two requests are unchanged.

The complete incoming handoff follows unchanged. Its historical proof,
source and regression receipts retain their authorship. The public
archive/recovery recipe above carries this continuation after task
scratch cleanup; it does not depend on private paths.

# BP-DeformationAndDerivedPatchingAlgebra--P7 — total-jet coefficients and monomial bases

Partial checkpoint by Codex — codex-7e92bd, 2026-10-02. Refs #551.
Winning claim `5963004842`; bot confirmation `5963006307`.
Base `fb5db1bbb6ec5ef68ea8ff02a54ea0ade874f446`. Governing worker/protocol/guide files are unchanged from
the versions already read in this continuous worker session. Latest main
checked: `82974c4339c719693457ae009b07cbee4eed5772`; all four incoming
deliverables, rules, checker/assembler/intake, audit, RS-08 and reserved ids
were unchanged from the job base. Work is on the worker's own branch.

## Mathematical continuation

Six new declarations separate equality of jets by low coefficients,
surjectivity of the native total-truncation algebra map, the low-coefficient
linear map, its bijectivity, its coordinate equivalence and the cardinality
of the two-variable exponent index. The existing kernel, polynomial
algebra equivalence, monomial basis and plane-jet rank nodes receive precise
proof dependencies. Their contracts are retained.

For finite σ and any commutative k, R/v^r has coordinates indexed by native
exponents of total degree strictly below r. Descending actual coefficient
maps makes the coordinates independent of the representative. A tuple is
realized by a formal series with exactly those low coefficients. Native
Basis.ofEquivFun then provides the actual monomial basis. Its representation
is the original coefficient function. This works at r=0, with no variables,
over Z/4 and over the zero ring. The separate algebra equivalence uses the
native truncation map into the polynomial quotient, its kernel, and its
commutation with polynomial inclusion. It never asserts unquotiented
truncation is multiplicative.

For two variables the actual index is equivalent to the dependent finite
sum of Fin(t+1) over t∈Fin r. The inverse exponents are i and t−i with i≤t.
The binomial summation theorem gives binom(r+1,2); native basis cardinality
then yields the rank. The checked F₂ length at cutoff three is 6.

All 116 incoming statement/hypothesis/API/test/use/source contracts are
retained; 112 whole node objects are unchanged. Six nodes, six API items
and fourteen test records are added. The reserved general finite-module,
ideal-of-definition multiplicity object is byte-semantically unchanged.
No scope, request, source issue or predecessor continuation receipt is
removed. All nodes remain unchecked, and all eight stages remain open.

Counts: 122 nodes (8 definitions, 22 constructions, 76 lemmas, 16 theorems),
123 API items, 113 definition/construction unit tests and 147 total test
records, 13 planets, 258 indexed baseline declarations, 15 gaps and
2 requests. The other promoted R03.6 part is retained separately.

## Checks and boundaries

- Actual native prototype: 531 lines, 25 examples,
  26 axiom audits, no errors, warnings, admissions or sorryAx.
  Its audits use only propext, Classical.choice and Quot.sound.
  It includes the predecessor's entire 217-line proof unchanged, SHA-256
  `7fe19f09fe60d201a6caa91ae3bc7e71cdae708045b3e7bf6d4acafc2d99c57a`.
  New tests check strict cutoffs, representative independence, inverse
  reconstruction, empty variables, zero coefficients, mixed monomials,
  polynomial inclusion, counts 0/1/6 and the actual F₂ quotient length.
- Full canonical suggested file: 2685 lines,
  170 examples, zero errors and exactly
  338 placeholder-proof warnings; no other warnings.
  All original imports and the full original suggested text are retained.
  No Tau Ceti module is imported, so this is full Mathlib-only elaboration,
  not certification of an unavailable Tau Ceti build.
- Existing Lean 4.34.0-rc2 / exact pinned Mathlib build. One Lean process at
  a time, timeout 1200 seconds, no setup/cache/update/library build or LSP.
  Available memory before final native/canonical checks: 51/50 GiB.
  Native: 0:03.80 elapsed, 3435432 KiB maximum RSS.
  Canonical: 0:24.41 elapsed, 3527408 KiB maximum RSS.
- Indexed packet checker: zero errors and warnings. Actual intake
  file_problems is checked for all four deliverables; git diff --check
  and contract-preservation assertions pass.
- Actual assembler with candidate and original control promotion inputs:
  stage graph 3003 vertices/8623 edges;
  own graph 122/184; combined graph
  3113/8807; all acyclic.
  123 reachable declarations, one external declaration,
  229 reachable baseline references and zero unresolved references.
  All 65 accepted restructure paths are reachable. Twelve of thirteen
  scoped supplier paths are reachable; the same inherited missing
  LocalFieldsRamification layer-0 → R03.4 path fails in the original
  control. It remains a gap, not a successful path or a fabricated edge.
  Stage edges, unrelated skipped/pending links, and the other part are
  unchanged. This roadmap's skipped and pending links are empty.

Fresh source/read scope: full issue before claim; bot reply and unchanged
issue on reread; current handoff; scoped audit rows; campaign document,
atlas stage descriptions and original edges; accepted RS-08 decisions and
scoped link overlap; reserved multiplicity survey entry; DDPA-JET-HANDOFF
§§3–4; the whole recovered 217-line predecessor proof; selected pinned
native statements and constructions recorded in HS-JET-COORDINATE-PIN;
Stacks 00K4's mathematical section. ModularCurves 4D's entire supplier
contract was freshly read. The complete JacobianChallenge and HodgeStructures
roadmap readings earlier in this worker loop supply upstream style context;
this is not a claim to have freshly read the whole 2550-line ModularCurves
roadmap or every routed paper. Historical source/regression receipts retain
their authorship. No predecessor computational regression was rerun.

Positive current prior art: [Mathlib #9819](https://github.com/leanprover-community/mathlib4/pull/9819)
(head `413e5b872a7c758e0eb91f99cb96d6a61c81f0a2`) has graded Hilbert–Serre
and Hilbert-polynomial work. The full 131-line HilbertPolynomial file was
read; its 1010-line theorem proof was not. Reconcile it before implementing
the open general induction. [Mathlib #35561](https://github.com/leanprover-community/mathlib4/pull/35561)
(head `3b12c410f2d9cb896c191fc0cce3ed125b7f69ee`) proves regularity of
power-series rings; its whole 70-line file was read. Neither PR is a pinned
baseline theorem or an imported proof here. Bounded public Zulip search
returned no relevant result; that does not establish absence.

## Durable proof archive and recovery

Archive commit [d15cdc9a0b96a908627d44ddaa6c0dac25877403](https://github.com/CBirkbeck/tauceti-explorer/commit/d15cdc9a0b96a908627d44ddaa6c0dac25877403).
Only the issue's allowed suggested path carries the proof, inside a nested
comment in this preceding commit. The submitted canonical file removes the
comment and retains admitted suggested signatures. The archive is an
ancestor of the submission and contains the complete checked native source.
Both strings below were actually recovered from the commit and byte-compared.

Native SHA-256 `2bf7077e7323128a5568e0aa3f5da2022d890955fd757f016c57f0d43a44707c`;
normalized diagnostic SHA-256 `9cdfca2a23526d50664f2dc973af4b6b9c73757e7940046977ac8aeba27fa4e9`.
Canonical SHA-256 `04ff501c4ab173d6a8390d8e558fc07de2776b204c92fae94044405815bec170`;
normalized diagnostic SHA-256 `f50d13ae3e073514c6431e53f433c39ebf90db33ae61b656c109b90c9e2568c4`.
Normalization takes the combined compiler output before the time utility's
“Command being timed” line and replaces the compiled filename with
`<lean-file>`. Timing lines and machine-specific filenames are excluded.

Reuse the existing atlas clone, and a disk scratch directory under 1 GB.
Save the following as recover.py there and run it with that directory as
its argument from the existing clone. Fetch the public archive read-only
if it is not already present; do not create a repository snapshot.

```python
from pathlib import Path
import hashlib,subprocess,sys
out=Path(sys.argv[1]);assert out.is_dir()
archive="d15cdc9a0b96a908627d44ddaa6c0dac25877403"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
text=subprocess.check_output(["git","show",archive+":"+path],text=True)
canonical,nested=text.split("\n/- BEGIN ARCHIVED CHECKED TOTAL JET COORDINATES\n",1)
native=nested.split("END ARCHIVED CHECKED TOTAL JET COORDINATES -/\n",1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="2bf7077e7323128a5568e0aa3f5da2022d890955fd757f016c57f0d43a44707c"
assert hashlib.sha256(canonical.encode()).hexdigest()=="04ff501c4ab173d6a8390d8e558fc07de2776b204c92fae94044405815bec170"
(out/"Native.lean").write_text(native)
(out/"Canonical.lean").write_text(canonical)
```

Before each compile check free -g and require at least 20 GiB available.
Use the existing exact-pin build to run one command at a time:
`/usr/bin/time -v timeout 1200 lake env lean "$task_dir/Native.lean"`
and then the corresponding Canonical.lean command. Capture combined logs.

## Read-only graph reproduction

The graph program below uses the actual repository assembler and actual
promotion loader. It retains the other roadmap part, checks the original
packet as a control, and inserts no synthetic realization edges. Save it as
graph.py in scratch. Recover original-packet.json by reading this job's base
packet with git show; run the script from the submitted repository tree
with original-packet.json as its argument. It writes no atlas files.

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

## Where to resume

Prove shifted series multiplication injectivity using exact finite order
and the domain/no-zero-divisors hypothesis, and connect it to the preceding
principal-quotient multiplication/projection/range-kernel proof. With the
now-checked total-jet basis and count, derive the all-index curve lengths,
tangent-cone kernel, curve dimension and actual intrinsic/ambient
multiplicity comparisons. Preserve the separate small-index case.

Keep the general graded Hilbert–Serre induction, degree/dimension,
Artin–Rees, finite top-dimensional localization, associativity, completion,
parameter-ideal and regular-local comparisons, all P7/P8/P9 and R03.1–R03.5
targets, and every routed-paper obligation open. Reconcile #9819's current
upstream work before filling its overlapping induction. The existing
local-field supplier gap remains its owner's reconciliation task.

The entire preceding handoff and its earlier proof/recovery receipts remain
available at [the immutable incoming tree](https://github.com/CBirkbeck/tauceti-explorer/blob/fb5db1bbb6ec5ef68ea8ff02a54ea0ade874f446/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).
Predecessor archive `596ea8e0e75ec76e52e256b941f75aec05a9cc09` supplied the
byte-identical checked ideal-power proof; no predecessor is re-credited.

After submission retain only the cited Native.lean, Canonical.lean,
native.log, canonical.log, lean-evidence.json, graph.py, graph.json,
packet-check.json, preservation.json and submission receipts. Remove other
task scratch; the public commits and this recovery recipe carry the proof.
