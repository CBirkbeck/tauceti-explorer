# StableReductionPartII: coefficient-module tensor–Hom checkpoint

Codex — codex-a71f92; 2026-10-03. Refs #3342. Winning claim5963812041 and our bot confirmation5963813232 were read before work. Mathematical input base aeae47c9a675600efe5c88a0b7ab4cc82b9d13f3. The shared clone was used read-only; only the five authorized proposal files and owned scratch sources were edited.

## Outcome and limits

The actual polynomial model over any commutative A has both canonical R-linear isomorphisms

- Hom_R(J,R)⊗_A M ≃ Hom_R(J,R⊗_A M);
- J⊗_A M ≃ Hom_R(Hom_R(J,R),R⊗_A M),

for every A-module M, without M-flatness. They use the inherited left R-action, the signed actual P_J and P_D presentations and the previously checked coefficient-universal transpose complexes. Both are natural for arbitrary A-linear coefficient maps. With M=A, native right-unit equivalences identify the first map with the identity of the actual dual and the second with native bidual evaluation.

The checkpoint adds32 declaration-sized nodes (six constructions,26 lemmas),18 promoted API items and24 named tests. Of226 incoming nodes,225 are whole-object identical. The remaining dual-section-ideal node preserves all statement, hypothesis, API, test, acceptance, source and ownership contracts and appends only five prerequisites and one proof step. Baseline123-prefix entries are unchanged and17 freshly read native references are appended. All135 requests,14 gaps,35 planets, six key-definition consumer contracts and21 routed Yuan/DGH items remain; one existing gap detail and the MC.2 remaining list gain explicit clarification, not closure.

Final packet:258 nodes, eight definitions,53 constructions,133 lemmas,63 theorems and one application;224 API entries overall (223 on definitions/constructions);233 unit-test entries overall (214 on definitions/constructions);35 planets;140 baseline declarations;14 gaps,135 open requests; eight partial stages, zero closed stages. Every implementationStatus remains unchecked.

The reserved StableReductionPartII:key/moduli-curves node is unchanged: it still owns the general smooth/stable ordered pointed-curve groupoid, not only this affine section model, and keeps stack/coarse/fine-level distinctions.

## Exact checks

The entire current2809-line suggested file imports only individual Mathlib modules and elaborates against the existing exact pinned Mathlib build: zero errors,413 expected declaration-admission warnings and no other warnings;171 examples. Source SHA256 cee923e71ffc381319f1ca3080b23fcb129e7bbe1b6738cbce9e4fe487ecc5d9. Normalized diagnostics SHA256 49e023599443b57ccbae7418a1794846216d549060c548a9bbdb7fbe03e8fde9. Wall time24.61s, peak RSS3170080KiB. This is the full §13 admitted sketch, not a proof or library implementation claim.

The separate3246-line native proof preserves the whole predecessor2586-line source, adding only one pinned import and the authored continuation. It has zero errors, warnings and admissions;109 examples;200 axiom audits, all limited to ordinary propext/Classical.choice/Quot.sound. Source SHA256 03240fdfbc18f39e88621d22efed1d0a0433df5feb3beb7162f630090c77515d. Normalized diagnostics SHA256 c3689dc9c2d9fa4e7542d28350ffb634b35f3eb7c027d2fe9c01df9a92a2760f. Wall time25.61s, peak RSS3368176KiB. Of34 new native declarations,32 correspond to new nodes; the other two merely abbreviate the existing native finite-product tensor/Hom coordinates and their pure-tensor evaluation, and are recorded as baseline adapters.

Before each single compiler invocation, available memory was at least42GiB. No library setup, update, cache download, build or language server was run. Mathlib is 082e2d37e8b0463410cdb532e111cd43d5a66174; recorded Tau Ceti baseline is f790474821cf4256814db967cb154e7af3d0c369. No Tau Ceti import was needed by these signatures, so the compiler receipt certifies the exact Mathlib artifacts, not a rebuilt Tau Ceti checkout.

The immutable packet checker, five-path intake/private-path check, mathematical preservation/header/test parity checks and actual atlas assembly are recorded with the final graph receipt. The actual assembler is run against immutable Git inputs with only these five overlays; no repository snapshot or substitute graph is used.

## Reading and provenance

Fresh primary reading: arXiv:1106.1588v2 introduction/Main Lemma, complete §3 Key Example through Proposition3.1/Corollary3.2 proofs, and §4 proof. Downloaded HTML SHA2562c89ce4072046d546ff9256a5c64cd488f41026c561f8858f4a78ce14c21d685. No fresh whole-paper, visual PDF, Appendix/Ile, Bourbaki or Eisenbud proof audit is claimed. The printed noetherian and unit-discriminant geometric hypotheses are retained; arbitrary-ring polynomial Hom exchange is an authored signed-presentation deduction.

Fresh pinned library statements include heterobasic lift/map/ext/unit, finite-product tensor and finite-free Hom coordinates, Hom precomposition, right-tensor surjectivity/exactness commutation and scalar restriction. The near matches in Contraction.lean require finite projectivity over the same tensor ring, while FinitePresentation.isBaseChange_map needs a flat ambient algebra; neither supplies the required coefficient-module theorem. The generic Matrix.toLin_transpose interface is reused conceptually, not replanned as a new matrix-dual theory.

Open Mathlib PR8495 was inspected: it is categorical Tensor-Hom adjunction, not the actual section-ideal arbitrary-coefficient Hom isomorphism. The full Apr23 2025 tensor-maps Zulip thread was read; native tensor/linear-map vocabulary is retained. No external code was copied. The governing documents, current whole issue, latest handoff, eight stage contracts, full reserved key definition, consumer coverage, routed Yuan/DGH briefs and accepted REV-AUDIT-02 report were read. The parent stable-reduction scope and relevant layer1/3 audit retain nodal-family/sheaf/contraction inputs as imports rather than duplicating them.

All preceding paper acquisition, printed-page, source-error, compiler and graph receipts remain historical under their original scopes. Fresh receipt metadata is appended rather than silently recertifying those checks.

## Where to resume

1. Identify the actual finite-free R-resolutions with their alternating Φ/Ψ differentials and P_J/P_D augmentations. Instantiate native Hom cochain complexes with coefficient target R⊗_A M, use the coefficient transpose bridge to identify differentials, and establish higher Ext vanishing for both J and D. Raw universal matrix exactness plus Hom exchange is not itself that native resolution/Ext comparison.
2. Read and use the exact Knudsen Appendix/Ile relative stable-reflexivity theorem. Prove/import Proposition6's different base/source completion comparison and account for Proposition7's exercise; the existing flat ambient R→B completion adapters do not imply these.
3. Finish the pointed completed-local hull, smooth/node chart comparison, family/sheaf descent and arbitrary-base approximation. Then discharge the listed geometric MC.0–MC.7 and source/supplier obligations. All inherited targets remain binding.

No new supplier request or planet was needed. Packet status remains partial. The proof source and replayable immutable checker are archived at a public immutable revision retained as a parent of the final submission; the final canonical suggested file remains entirely an admitted blueprint sketch.

## Replayable immutable validation sources

```python
# BEGIN ARCHIVED COEFFICIENT MODULE HOM VALIDATOR
"""Actual immutable checker, intake, atlas assembly and mathematical parity."""
from pathlib import Path
import os,sys,json,re,ast,hashlib,collections,copy
import immutable_view as gv
HERE=Path(__file__).resolve().parent
RID="StableReductionPartII";STEM=RID
FILES={"research/blueprint/roadmaps/"+RID+".json":"roadmaps/"+RID+".json",
"research/blueprint/packets/"+RID+".json":"packets/"+RID+".json",
"research/blueprint/readmes/"+RID+".md":"readmes/"+RID+".md",
"research/blueprint/suggested/"+RID+".lean":"suggested/"+RID+".lean",
"research/blueprint/handoff/DESIGN-"+RID+".md":"handoff/DESIGN-"+RID+".md"}
PACKET="research/blueprint/packets/"+RID+".json"
original=json.loads(gv.blob(PACKET))
oldroadmap=json.loads(gv.blob("research/blueprint/roadmaps/"+RID+".json"))
oldreader=gv.blob("research/blueprint/readmes/"+RID+".md").decode()
oldlean=gv.blob("research/blueprint/suggested/"+RID+".lean").decode()
for dst,name in FILES.items():gv.CACHE[dst]=(HERE/name).read_bytes()
gv.install()
import check_blueprint
errors,warnings,summary=check_blueprint.check(gv.REPO/PACKET,
check_blueprint.load_index(Path(os.environ["TAUCETI_BASELINE"])),check_blueprint.world())
print(json.dumps({"checker":summary,"errors":errors,"warnings":warnings}),flush=True)
assert not errors and not warnings,(errors,warnings)
p=json.loads((HERE/FILES[PACKET]).read_text())
reader=(HERE/("readmes/"+RID+".md")).read_text()
lean=(HERE/("suggested/"+RID+".lean")).read_text()
old={n["id"]:n for n in original["nodes"]};new={n["id"]:n for n in p["nodes"]}
changed=RID+":MC.2/dual-section-ideal"
assert len(old)==226 and len(new)==258 and set(old)<=set(new)
assert all(new[nid]==n for nid,n in old.items() if nid!=changed)
for key,value in old[changed].items():
 if key not in {"proofSteps","prerequisites"}:assert new[changed][key]==value,key
assert new[changed]["proofSteps"][:-1]==old[changed]["proofSteps"]
assert new[changed]["prerequisites"][:-5]==old[changed]["prerequisites"]
allowed={"summary","sources","nodes","baseline","coverage","gaps","sourceReadReceipts","sourceVersions","prototypeCoverage"}
for key in original:
 if key not in allowed:assert p[key]==original[key],key
assert p["sources"][:-3]==original["sources"]
assert p["baseline"]["declarations"][:123]==original["baseline"]["declarations"]
assert len(p["baseline"]["declarations"])==140
for key,value in original["baseline"].items():
 if key!="declarations":assert p["baseline"][key]==value,key
assert p["sourceReadReceipts"][:-1]==original["sourceReadReceipts"]
assert p["sourceVersions"][:-1]==original["sourceVersions"]
assert p["summary"].startswith(original["summary"])
assert len(p["coverage"])==8
for row,row0 in zip(p["coverage"],original["coverage"]):
 if row["stageId"]!=RID+":MC.2":assert row==row0
 else:
  assert row["remaining"][:-1]==row0["remaining"]
  for key,value in row0.items():
   if key!="remaining":assert row[key]==value
assert len(p["gaps"])==14
for row,row0 in zip(p["gaps"],original["gaps"]):
 if row["title"]!="Pointed noetherian-to-arbitrary-base passage":assert row==row0
 else:
  assert row["detail"].startswith(row0["detail"])
  for key,value in row0.items():
   if key!="detail":assert row[key]==value
for key,value in original["prototypeCoverage"].items():
 if key=="reason":assert p["prototypeCoverage"]["coefficientModuleHomPreviousReason"]==value
 elif key in {"expressedNodes","expressedApi","expressedTests"}:
  assert p["prototypeCoverage"][key][:len(value)]==value,key
 else:assert p["prototypeCoverage"][key]==value,key
assert p["status"]=="partial" and all(n["implementationStatus"]=="unchecked" for n in new.values())
assert new[RID+":key/moduli-curves"]==old[RID+":key/moduli-curves"]
r=json.loads((HERE/("roadmaps/"+RID+".json")).read_text())
for key,value in oldroadmap.items():
 if key not in {"summary","stages"}:assert r[key]==value,key
assert r["summary"].startswith(oldroadmap["summary"])
for row,row0 in zip(r["stages"],oldroadmap["stages"]):
 if row["key"]!="MC.2":assert row==row0
 else:
  assert row["description"].startswith(row0["description"])
  for key,value in row0.items():
   if key!="description":assert row[key]==value
assert reader.startswith(oldreader)
assert lean.replace("import Mathlib.LinearAlgebra.TensorProduct.Pi\n","",1).startswith(oldlean)
for nid,node in new.items():
 if nid in old:continue
 assert node["statement"] in reader and node["declarationName"] in reader,nid
 assert node["declarationName"].split(".")[-1] in lean,nid
 for test in node.get("tests",[]):assert test["name"] in lean and test["statement"] in reader,test
tree=ast.parse(gv.blob("research/blueprint/intake.py").decode())
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {"ALLOWED","PRIVATE"} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=="file_problems"]
env={"json":json,"re":re};exec(compile(ast.Module(body=picked,type_ignores=[]),"actual-intake","exec"),env)
problems=[v for dst,name in FILES.items() for v in env["file_problems"](dst,(HERE/name).read_text())]
assert not problems,problems
for name in FILES.values():
 txt=(HERE/name).read_text()
 assert not re.search(r"[ \t]+$",txt,re.M),name
 assert not re.search(r"/(?:home|Users)/[^/\s]+/",txt),name
native=(HERE/"Native.lean").read_text()
inherited=(HERE/"InheritedNative.lean").read_text()
assert hashlib.sha256(inherited.encode()).hexdigest()=="de4a6b846c7e33b576a7e9119947292ab5bd513e70b67c094b8a4303627904e5"
assert native.replace("import Mathlib.LinearAlgebra.TensorProduct.Pi\n","",1).startswith(inherited)
nlog=(HERE/"Native.log").read_text();clog=(HERE/"Canonical.log").read_text()
assert nlog.count("depends on axioms:")==200 and not re.search(r"error|warning|sorryAx",nlog)
assert "Exit status: 0" in (HERE/"Native.resources").read_text()
assert "error" not in clog and clog.count("warning:")==clog.count("warning: declaration uses")==413
assert "Exit status: 0" in (HERE/"Canonical.resources").read_text()
assert len(re.findall(r"^example\b",native,re.M))==109
assert len(re.findall(r"^example\b",lean,re.M))==171
assert hashlib.sha256(native.encode()).hexdigest()=="03240fdfbc18f39e88621d22efed1d0a0433df5feb3beb7162f630090c77515d"
assert hashlib.sha256(lean.encode()).hexdigest()=="cee923e71ffc381319f1ca3080b23fcb129e7bbe1b6738cbce9e4fe487ecc5d9"
assert not re.search(r"\bsorry\b",native)
names=["sectionDualTensorHom","sectionDualTensorHom_tmul","sectionFreeTensorHom","sectionFreeTensorHom_tmul","sectionFreeTensorHom_matrix","sectionIdealHomCoordinates","sectionIdealHomCoordinates_injective","sectionIdealHomCoordinates_relation","sectionIdealPresentation_generators","sectionIdealHomCoordinates_presentation","transposeLeft_rTensor_rotation","sectionDualTensorHom_injective","sectionDualTensorHom_surjective","sectionDualTensorHomEquiv","sectionDualTensorHomEquiv_tmul","sectionDualTensorHom_natural","sectionIdealTensorHom","sectionIdealTensorHom_tmul","sectionDualHomCoordinates","sectionDualHomCoordinates_injective","sectionDualHomCoordinates_relation","sectionDualHomCoordinates_presentation","transposeRight_rTensor_rotation","sectionIdealTensorHom_injective","sectionIdealTensorHom_surjective","sectionIdealTensorHomEquiv","sectionIdealTensorHomEquiv_tmul","sectionIdealTensorHom_natural","sectionDualTensorHomEquiv_inverse","sectionIdealTensorHomEquiv_inverse","sectionDualTensorHomEquiv_unique","sectionIdealTensorHomEquiv_unique","sectionDualTensorHom_unit","sectionIdealTensorHom_unit"]
def headers(s):
 found={}
 for name in names:
  match=re.search(r"^(?:noncomputable )?(?:def|lemma|theorem) "+re.escape(name)+r"\b[\s\S]*?:=",s,re.M)
  assert match,name
  found[name]=match.group(0).split(":=",1)[0].rstrip()
 return found
assert headers(native)==headers(lean)
newtests=["NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_zero","NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_inclusion","NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_negative_epsilon","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_zero","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_inclusion","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_negative_second","NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_zero","NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_negative_second","NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_faithful","NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_zero","NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_negative_epsilon","NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_faithful","NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_inverse","NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_ring_action","NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_torsion","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_inverse","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_ring_action","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_torsion","NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_naturality","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_naturality","NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_unit","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_bidual","NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_nonreduced","NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_zero_ring"]
def tests(s):
 found={}
 for name in newtests:
  match=re.search(r"-- test: "+re.escape(name)+r"\n(example[\s\S]*?):=",s)
  assert match,name
  found[name]=match.group(1).rstrip()
 return found
assert tests(native)==tests(lean)
print(json.dumps({"preservedWholeNodeObjects":225,"incomingContracts":226,"newNodes":32,
"api":sum(len(n.get("api",[])) for n in p["nodes"]),
"tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"intake":"pass",
"newPublicHeadersMatched":34,"namedTestHeadersMatched":24}),flush=True)
import build,blueprints
root=gv.REPO
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert not otherparts
own_definition=json.loads((HERE/"roadmaps"/(RID+".json")).read_text())
old_definition=json.loads(gv.blob("research/blueprint/roadmaps/"+RID+".json"))
definitions=[q for q in definitions if q.get("id")!=RID]+[own_definition]

keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate, definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy([q for q in definitions if q.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,own_definition);b=assemble(original,old_definition)
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
pairs |= {(source,RID+":"+row["key"]) for row in own_definition["stages"] for source in row.get("requires",[])}
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
assert not missingpairs, missingpairs
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
controlnew={n["id"]:n for n in original["nodes"]}
controledges={(q,nid) for nid,node in controlnew.items() for q in node.get("prerequisites",[]) if q in controlnew}
print(json.dumps({"controlOwnDAG":dag(controlnew,controledges),"incomingDeclarations":len(controlnew),"incomingPlanets":sum("planet" in n for n in original["nodes"])}),flush=True)

print(json.dumps({"readPaths":sorted(gv.READS)}),flush=True)
# END ARCHIVED COEFFICIENT MODULE HOM VALIDATOR
```

```python
# BEGIN ARCHIVED COEFFICIENT MODULE HOM IMMUTABLE READER
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('P8_VALIDATE_BASE', '14122f5410315c7254b29874b6b80bf3f7bdd159')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.relative_to(REPO))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
# END ARCHIVED COEFFICIENT MODULE HOM IMMUTABLE READER
```
