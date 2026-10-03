# Immutable section Hom and Ext proof evidence

Codex — codex-a71f92. Refs #3342. Actual checked polynomial proof experiment; not geometric closure.

```python
# BEGIN ARCHIVED SECTION EXT VALIDATOR
"""Read-only immutable blueprint/atlas validator with five caller-supplied overlays."""
from pathlib import Path
import os,sys,json,re,ast,hashlib,collections,copy,subprocess
import immutable_view as gv
HERE=Path(__file__).resolve().parent
RID="StableReductionPartII";STEM=RID
MATHBASE="cbc70097561abd69d9e3b1d6caff7bee676c019a"
FILES={"research/blueprint/roadmaps/"+RID+".json":"roadmap.json",
"research/blueprint/packets/"+RID+".json":"packet.json",
"research/blueprint/readmes/"+RID+".md":"reader.md",
"research/blueprint/suggested/"+RID+".lean":"Canonical.lean",
"research/blueprint/handoff/DESIGN-"+RID+".md":"handoff.md"}
PACKET="research/blueprint/packets/"+RID+".json"
original=json.loads(gv.blob(PACKET));oldroadmap=json.loads(gv.blob("research/blueprint/roadmaps/"+RID+".json"))
oldreader=gv.blob("research/blueprint/readmes/"+RID+".md").decode()
oldlean=gv.blob("research/blueprint/suggested/"+RID+".lean").decode()
GUARDS=['research/blueprint/roadmaps/StableReductionPartII.json', 'research/blueprint/packets/StableReductionPartII.json', 'research/blueprint/readmes/StableReductionPartII.md', 'research/blueprint/suggested/StableReductionPartII.lean', 'research/blueprint/handoff/DESIGN-StableReductionPartII.md', 'research/blueprint/WORKERS.md', 'research/blueprint/PROTOCOL.md', 'research/blueprint/UPSTREAM_GUIDE.md', 'research/expansion/PROTOCOL.md', 'data/library-coverage.json', 'research/blueprint/reviews/REV-AUDIT-02.md', 'data/keydefs/KEYDEF-algebraicgeometry.json', 'research/blueprint/papers/PAPER-YUAN-26.result.json', 'research/blueprint/papers/PAPER-DIMITROV-GAO-HABEGGER-21.result.json', 'research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_StableReduction.json', 'research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_JacobianChallenge.json', 'scripts/check_blueprint.py', 'scripts/build.py', 'scripts/blueprints.py', 'research/blueprint/intake.py', 'research/blueprint/reserved-ids.json']
for path in GUARDS:
 oldid=subprocess.check_output(["git","rev-parse",MATHBASE+":"+path],cwd=gv.REPO,text=True).strip()
 newid=subprocess.check_output(["git","rev-parse",gv.BASE+":"+path],cwd=gv.REPO,text=True).strip()
 assert oldid==newid,path
for dst,name in FILES.items():gv.CACHE[dst]=(HERE/name).read_bytes()
gv.install()
import check_blueprint
errors,warnings,summary=check_blueprint.check(gv.REPO/PACKET,check_blueprint.load_index(Path(os.environ["TAUCETI_BASELINE"])),check_blueprint.world())
assert not errors and not warnings,(errors,warnings)
print(json.dumps({"checker":summary,"errors":errors,"warnings":warnings}),flush=True)
p=json.loads((HERE/FILES[PACKET]).read_text());reader=(HERE/"reader.md").read_text();lean=(HERE/"Canonical.lean").read_text()
old={n["id"]:n for n in original["nodes"]};new={n["id"]:n for n in p["nodes"]}
assert len(old)==304 and len(new)==319 and set(old)<=set(new)
changed=RID+":MC.2/dual-section-ideal"
assert all(new[nid]==n for nid,n in old.items() if nid!=changed)
for key,value in old[changed].items():
 if key not in {"proofSteps","prerequisites"}:assert new[changed][key]==value,key
assert new[changed]["proofSteps"][:-1]==old[changed]["proofSteps"]
assert new[changed]["prerequisites"][:-3]==old[changed]["prerequisites"]
allowed={"summary","sources","nodes","baseline","coverage","sourceReadReceipts","prototypeCoverage","sectionExtContinuation"}
for key,value in original.items():
 if key not in allowed:assert p[key]==value,key
assert p["sources"][:-1]==original["sources"]
assert p["baseline"]["declarations"][:168]==original["baseline"]["declarations"] and len(p["baseline"]["declarations"])==181
for key,value in original["baseline"].items():
 if key!="declarations":assert p["baseline"][key]==value
assert p["sourceReadReceipts"][:-1]==original["sourceReadReceipts"]
assert p["summary"].startswith(original["summary"])
for row,row0 in zip(p["coverage"],original["coverage"]):
 if row["stageId"]!=RID+":MC.2":assert row==row0
 else:
  assert row["remaining"][:-1]==row0["remaining"]
  for key,value in row0.items():
   if key!="remaining":assert row[key]==value
for key,value in original["prototypeCoverage"].items():
 if key=="reason":assert p["prototypeCoverage"]["sectionExtPreviousReason"]==value
 elif key in {"expressedNodes","expressedApi","expressedTests"}:assert p["prototypeCoverage"][key][:len(value)]==value
 else:assert p["prototypeCoverage"][key]==value,key
assert p["status"]=="partial" and all(n["implementationStatus"]=="unchecked" for n in new.values())
assert new[RID+":key/moduli-curves"]==old[RID+":key/moduli-curves"]
r=json.loads((HERE/"roadmap.json").read_text())
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
imports="import Mathlib.CategoryTheory.Abelian.Ext\nimport Mathlib.CategoryTheory.Abelian.Projective.Ext\nimport Mathlib.Algebra.Category.ModuleCat.Ext.HasExt\n"
assert lean.startswith(imports+oldlean)
for nid,node in new.items():
 if nid in old:continue
 assert node["statement"] in reader and node["declarationName"] in reader
 for t in node.get("tests",[]):assert t["name"] in lean and t["statement"] in reader
# Invoke the actual intake's file checks, without importing side-effectful intake execution.
tree=ast.parse(gv.blob("research/blueprint/intake.py").decode())
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {"ALLOWED","PRIVATE"} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=="file_problems"]
env={"json":json,"re":re};exec(compile(ast.Module(body=picked,type_ignores=[]),"actual-intake","exec"),env)
problems=[v for dst,name in FILES.items() for v in env["file_problems"](dst,(HERE/name).read_text())]
assert not problems,problems
for name in FILES.values():
 txt=(HERE/name).read_text();assert not re.search(r"[ \t]+$",txt,re.M),name
 assert not re.search(r"/(?:home|Users)/[^/\s]+/",txt),name
native=(HERE/"Native.lean").read_text();inherited=(HERE/"IncomingNative.lean").read_text()
assert hashlib.sha256(inherited.encode()).hexdigest()=="30bc02cb3d84884b6727f34c127a01c366c8cbde987da6363d89a9962f7f5860"
assert native.startswith(imports+inherited) and not re.search(r"\bsorry\b",native)
runtime_logs=(HERE/"native.log").exists() and (HERE/"canonical.log").exists()
nlog=(HERE/("native.log" if runtime_logs else "NativeDiagnostics.txt")).read_text()
clog=(HERE/("canonical.log" if runtime_logs else "CanonicalDiagnostics.txt")).read_text()
assert nlog.count("depends on axioms:")==261 and not re.search(r"error|warning|sorryAx",nlog)
assert "Command exited" not in nlog
if runtime_logs:assert "Elapsed" in nlog
assert "error" not in clog and clog.count("warning:")==clog.count("warning: declaration uses")==513
assert "Command exited" not in clog
if runtime_logs:assert "Elapsed" in clog
assert len(re.findall(r"^example\b",native,re.M))==148 and len(re.findall(r"^example\b",lean,re.M))==210
for key,source in [("nativeProof",native),("canonicalSketch",lean)]:
 if p["sectionExtContinuation"][key]:assert hashlib.sha256(source.encode()).hexdigest()==p["sectionExtContinuation"][key]["sha256"]
for key,txt,name in [("nativeProof",nlog,"Native"),("canonicalSketch",clog,"Canonical")]:
 proof=p["sectionExtContinuation"][key]
 if proof:
  normalized=txt.split("\tCommand being timed:",1)[0].replace(str(HERE)+"/"+name+".lean",name+".lean")
  assert hashlib.sha256(normalized.encode()).hexdigest()==proof["diagnosticsSha256"],name
  assert proof["exit"]==0 and proof["errors"]==0,name
print(json.dumps({"leanDiagnostics":"runtime" if runtime_logs else "authenticated archived diagnostics; no new Lean invocation"}),flush=True)
# Find the true top-level body delimiter, protecting named arguments/let annotations.
def header(block):
 depth=0
 for i,c in enumerate(block):
  if c in "([{":depth+=1
  elif c in ")]}":depth-=1
  if depth==0 and (block.startswith(" :=",i) or block.startswith(" where",i)):
   return re.sub(r"\s+"," ",block[:i]).strip()
 raise AssertionError(block[:100])
ns="namespace TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel\nnoncomputable section\nuniverse u_ext"
nativepart=native.split(ns,1)[1];leanpart=lean.split(ns,1)[1]
for nid,node in new.items():
 if nid in old:continue
 name=node["declarationName"].split(".")[-1]
 pattern=r"^(?:def|lemma) "+re.escape(name)+r"\b[\s\S]*"
 assert header(re.search(pattern,nativepart,re.M).group())==header(re.search(pattern,leanpart,re.M).group()),name
for name in [t["name"] for n in new.values() if n["id"] not in old for t in n.get("tests",[])]:
 needle="-- test: "+name+"\n"
 assert header(nativepart.split(needle,1)[1])==header(leanpart.split(needle,1)[1]),name
print(json.dumps({"preservedWholeNodeObjects":303,"incomingContracts":304,"newNodes":15,"newApi":9,"namedTestHeadersMatched":12,"newPublicHeadersMatched":15,"intake":"pass"}),flush=True)
import build,blueprints
root=gv.REPO
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert not otherparts
own_definition=json.loads((HERE/"roadmap.json").read_text())
old_definition=oldroadmap
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
graph_text=json.dumps(report,ensure_ascii=False,indent=2)+'\n'
target=HERE/'graph.json'
if target.exists():
 patch='*** Begin Patch\n*** Update File: '+str(target)+'\n@@\n'+''.join('-'+x+'\n' for x in target.read_text().splitlines())+''.join('+'+x+'\n' for x in graph_text.splitlines())+'*** End Patch\n'
else:
 patch='*** Begin Patch\n*** Add File: '+str(target)+'\n'+''.join('+'+x+'\n' for x in graph_text.splitlines())+'*** End Patch\n'
subprocess.run(['apply_patch'],input=patch,text=True,check=True,capture_output=True)
if p['sectionExtContinuation']['graph']:assert p['sectionExtContinuation']['graph']==report
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
controlnew={n["id"]:n for n in original["nodes"]}
controledges={(q,nid) for nid,node in controlnew.items() for q in node.get("prerequisites",[]) if q in controlnew}
print(json.dumps({"controlOwnDAG":dag(controlnew,controledges),"incomingDeclarations":len(controlnew),"incomingPlanets":sum("planet" in n for n in original["nodes"])}),flush=True)

print(json.dumps({"immutableReadPathCount":len(gv.READS),"scopedGuardInputCount":len(GUARDS)}),flush=True)
# END ARCHIVED SECTION EXT VALIDATOR
```

```python
# BEGIN ARCHIVED SECTION EXT IMMUTABLE READER
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
BASE = os.environ.get('N12_VALIDATE_BASE', 'cbc70097561abd69d9e3b1d6caff7bee676c019a')
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
# END ARCHIVED SECTION EXT IMMUTABLE READER
```

```text
# BEGIN ARCHIVED SECTION EXT NATIVE DIAGNOSTICS
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionEval' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionEvaluationKernel' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientHom_eq_algebraMap' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionEval_smul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_coe' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_ideal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_coefficient' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_first' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_second' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSplit_section' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonic' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionPolynomialFree' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionCoordinateRegular' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRelation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_divisibility' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_spec' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGeneratorUnique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_existsUnique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionFirst_mem' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionSecond_mem' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGeneratorValues' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_spec' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_product' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_values' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarCorrection' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarCorrectionConstants' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarCorrectionUnique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_coefficient' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMap' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapValues' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapEvaluation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapCoordinates' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_coe' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_first' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_second' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_coefficient_naturality' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_coefficient_naturality' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualCorrectionMap_coefficient_naturality' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapIdentity' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.coefficientMapComposition' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_identity' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_comp' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealCoefficientMap_smul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.correctionCoefficientNaturality' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialNatDegree' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasisTwo' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasisTwo_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_symm' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_reconstruction' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_unique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_of' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_root' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.normalForm' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.normalFormFree' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialBasis_one' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_tower' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_repr' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
Try this:
  [apply] ring_nf
  
  The `ring` tactic failed to close the goal. Use `ring_nf` to obtain a normal form.
    
  Note that `ring` works primarily in *commutative* rings. If you have a noncommutative ring, abelian group or module, consider using `noncomm_ring`, `abel` or `module` instead.
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_coefficient_mul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_second_mul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_root_mul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_first_mul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_commutes' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_at_second' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_dualNumerator' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_decomposition' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalForm_exists' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualValue_coordinates_unique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalForm' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplication' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplicationApply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquiv' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_action' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualScalarAction' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidue' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquivInclusion' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualNormalEquivGenerator' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidueGenerator' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualResidueInclusion' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualMultiplicationInjective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_coefficient_projective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_flat' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDual_coefficient_free' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDual_flat' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionProjection_lTensor_retraction' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdeal_lTensor_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
Try this:
  [apply] ring_nf
  
  The `ring` tactic failed to close the goal. Use `ring_nf` to obtain a normal form.
    
  Note that `ring` works primarily in *commutative* rings. If you have a noncommutative ring, abelian group or module, consider using `noncomm_ring`, `abel` or `module` instead.
'TauCeti.ModuliCurves.NodeSectionFactorization.left' depends on axioms: [propext, Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.right' depends on axioms: [propext, Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealSyzygy' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_first' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.polynomialCoordinates_numerator_mul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualSyzygy' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_surjective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.right_mulVec' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.left_mulVec' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_kernel' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_surjective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_zero_iff' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_kernel' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdeal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdealGenerators' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelIdealUnique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDual' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDualGenerators' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.cokernelDualUnique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientLeftExact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientRightExact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_mulVec' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_mulVec' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeLeftExact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeRightExact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientExact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.leftImage_lTensor_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.rightImage_lTensor_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientLeft_lTensor_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientRight_lTensor_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_symm_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionRotation_square' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_rotation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_rotation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_lTensor_rotation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_lTensor_rotation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeLeft_lTensor_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.quotientTransposeRight_lTensor_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.idealPresentation_lTensor_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualPresentation_lTensor_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_mk' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_tmul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_unique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_mk' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_tmul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.tensorCokernelDual_unique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.dualGenerator_module_relation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidual_relation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidual_value_mem' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualInverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualInverse_value' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualInverse_eval' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidual_eval_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealReflexive' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualEquiv' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_native' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHom' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_tmul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionFreeTensorHom' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionFreeTensorHom_tmul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionFreeTensorHom_matrix' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_relation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealPresentation_generators' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_presentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeLeft_rTensor_rotation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_surjective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_tmul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_natural' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_tmul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_relation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_presentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.transposeRight_rTensor_rotation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_surjective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_tmul' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_natural' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_unique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_unique' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_unit' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_unit' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomLeftRight_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomRightLeft_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_sq' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_d' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_exactAt' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_isZero_homology' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_ideal_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_dual_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDifferential_periodic' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_X' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomCochain_shape' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomIdeal_augmentation_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionHomDual_augmentation_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_sq' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_d' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_exactAt' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_projective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainIdeal_augmentation_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDual_augmentation_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_quasiIso' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_quasiIso' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_ideal_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_dual_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChainDifferential_periodic' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_X' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_finiteFree' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionChain_shape' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHom_d' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_complex' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_augmentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_complex' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_augmentation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealResolution_quasiIso' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualResolution_quasiIso' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_inv_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHom_exact' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_inverse' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExt_isZero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualDerivedExt_isZero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionIdealExt_eq_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionDualExt_eq_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.ModuliCurves.NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_natural' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
# END ARCHIVED SECTION EXT NATIVE DIAGNOSTICS
```

```text
# BEGIN ARCHIVED SECTION EXT CANONICAL DIAGNOSTICS
Canonical.lean:74:8: warning: declaration uses `sorry`
Canonical.lean:77:8: warning: declaration uses `sorry`
Canonical.lean:81:8: warning: declaration uses `sorry`
Canonical.lean:88:0: warning: declaration uses `sorry`
Canonical.lean:89:0: warning: declaration uses `sorry`
Canonical.lean:91:0: warning: declaration uses `sorry`
Canonical.lean:94:0: warning: declaration uses `sorry`
Canonical.lean:114:8: warning: declaration uses `sorry`
Canonical.lean:120:0: warning: declaration uses `sorry`
Canonical.lean:127:0: warning: declaration uses `sorry`
Canonical.lean:131:0: warning: declaration uses `sorry`
Canonical.lean:166:4: warning: declaration uses `sorry`
Canonical.lean:172:4: warning: declaration uses `sorry`
Canonical.lean:175:8: warning: declaration uses `sorry`
Canonical.lean:176:8: warning: declaration uses `sorry`
Canonical.lean:177:8: warning: declaration uses `sorry`
Canonical.lean:181:8: warning: declaration uses `sorry`
Canonical.lean:183:8: warning: declaration uses `sorry`
Canonical.lean:191:8: warning: declaration uses `sorry`
Canonical.lean:205:8: warning: declaration uses `sorry`
Canonical.lean:235:8: warning: declaration uses `sorry`
Canonical.lean:240:8: warning: declaration uses `sorry`
Canonical.lean:247:8: warning: declaration uses `sorry`
Canonical.lean:255:8: warning: declaration uses `sorry`
Canonical.lean:268:8: warning: declaration uses `sorry`
Canonical.lean:278:8: warning: declaration uses `sorry`
Canonical.lean:281:8: warning: declaration uses `sorry`
Canonical.lean:289:8: warning: declaration uses `sorry`
Canonical.lean:306:8: warning: declaration uses `sorry`
Canonical.lean:309:8: warning: declaration uses `sorry`
Canonical.lean:315:6: warning: declaration uses `sorry`
Canonical.lean:318:6: warning: declaration uses `sorry`
Canonical.lean:322:18: warning: declaration uses `sorry`
Canonical.lean:324:6: warning: declaration uses `sorry`
Canonical.lean:327:6: warning: declaration uses `sorry`
Canonical.lean:329:6: warning: declaration uses `sorry`
Canonical.lean:333:18: warning: declaration uses `sorry`
Canonical.lean:334:8: warning: declaration uses `sorry`
Canonical.lean:336:8: warning: declaration uses `sorry`
Canonical.lean:338:8: warning: declaration uses `sorry`
Canonical.lean:340:8: warning: declaration uses `sorry`
Canonical.lean:343:0: warning: declaration uses `sorry`
Canonical.lean:349:0: warning: declaration uses `sorry`
Canonical.lean:352:0: warning: declaration uses `sorry`
Canonical.lean:358:0: warning: declaration uses `sorry`
Canonical.lean:361:0: warning: declaration uses `sorry`
Canonical.lean:364:0: warning: declaration uses `sorry`
Canonical.lean:370:0: warning: declaration uses `sorry`
Canonical.lean:375:8: warning: declaration uses `sorry`
Canonical.lean:380:8: warning: declaration uses `sorry`
Canonical.lean:387:8: warning: declaration uses `sorry`
Canonical.lean:395:6: warning: declaration uses `sorry`
Canonical.lean:397:6: warning: declaration uses `sorry`
Canonical.lean:399:6: warning: declaration uses `sorry`
Canonical.lean:401:18: warning: declaration uses `sorry`
Canonical.lean:403:6: warning: declaration uses `sorry`
Canonical.lean:406:6: warning: declaration uses `sorry`
Canonical.lean:408:6: warning: declaration uses `sorry`
Canonical.lean:410:18: warning: declaration uses `sorry`
Canonical.lean:412:6: warning: declaration uses `sorry`
Canonical.lean:416:6: warning: declaration uses `sorry`
Canonical.lean:419:6: warning: declaration uses `sorry`
Canonical.lean:423:6: warning: declaration uses `sorry`
Canonical.lean:426:6: warning: declaration uses `sorry`
Canonical.lean:428:8: warning: declaration uses `sorry`
Canonical.lean:433:8: warning: declaration uses `sorry`
Canonical.lean:438:8: warning: declaration uses `sorry`
Canonical.lean:444:8: warning: declaration uses `sorry`
Canonical.lean:451:8: warning: declaration uses `sorry`
Canonical.lean:457:8: warning: declaration uses `sorry`
Canonical.lean:466:8: warning: declaration uses `sorry`
Canonical.lean:474:8: warning: declaration uses `sorry`
Canonical.lean:479:8: warning: declaration uses `sorry`
Canonical.lean:484:8: warning: declaration uses `sorry`
Canonical.lean:489:8: warning: declaration uses `sorry`
Canonical.lean:495:8: warning: declaration uses `sorry`
Canonical.lean:504:8: warning: declaration uses `sorry`
Canonical.lean:509:8: warning: declaration uses `sorry`
Canonical.lean:512:8: warning: declaration uses `sorry`
Canonical.lean:513:8: warning: declaration uses `sorry`
Canonical.lean:518:8: warning: declaration uses `sorry`
Canonical.lean:527:8: warning: declaration uses `sorry`
Canonical.lean:540:4: warning: declaration uses `sorry`
Canonical.lean:545:8: warning: declaration uses `sorry`
Canonical.lean:553:8: warning: declaration uses `sorry`
Canonical.lean:562:4: warning: declaration uses `sorry`
Canonical.lean:567:8: warning: declaration uses `sorry`
Canonical.lean:576:8: warning: declaration uses `sorry`
Canonical.lean:580:8: warning: declaration uses `sorry`
Canonical.lean:592:8: warning: declaration uses `sorry`
Canonical.lean:610:8: warning: declaration uses `sorry`
Canonical.lean:622:4: warning: declaration uses `sorry`
Canonical.lean:627:8: warning: declaration uses `sorry`
Canonical.lean:634:8: warning: declaration uses `sorry`
Canonical.lean:645:8: warning: declaration uses `sorry`
Canonical.lean:656:4: warning: declaration uses `sorry`
Canonical.lean:659:8: warning: declaration uses `sorry`
Canonical.lean:667:4: warning: declaration uses `sorry`
Canonical.lean:670:8: warning: declaration uses `sorry`
Canonical.lean:675:8: warning: declaration uses `sorry`
Canonical.lean:681:4: warning: declaration uses `sorry`
Canonical.lean:687:8: warning: declaration uses `sorry`
Canonical.lean:695:8: warning: declaration uses `sorry`
Canonical.lean:704:0: warning: declaration uses `sorry`
Canonical.lean:707:0: warning: declaration uses `sorry`
Canonical.lean:712:0: warning: declaration uses `sorry`
Canonical.lean:714:0: warning: declaration uses `sorry`
Canonical.lean:717:0: warning: declaration uses `sorry`
Canonical.lean:727:0: warning: declaration uses `sorry`
Canonical.lean:732:0: warning: declaration uses `sorry`
Canonical.lean:738:0: warning: declaration uses `sorry`
Canonical.lean:743:0: warning: declaration uses `sorry`
Canonical.lean:745:0: warning: declaration uses `sorry`
Canonical.lean:748:0: warning: declaration uses `sorry`
Canonical.lean:752:0: warning: declaration uses `sorry`
Canonical.lean:754:0: warning: declaration uses `sorry`
Canonical.lean:761:0: warning: declaration uses `sorry`
Canonical.lean:764:0: warning: declaration uses `sorry`
Canonical.lean:774:0: warning: declaration uses `sorry`
Canonical.lean:776:0: warning: declaration uses `sorry`
Canonical.lean:778:0: warning: declaration uses `sorry`
Canonical.lean:789:0: warning: declaration uses `sorry`
Canonical.lean:796:0: warning: declaration uses `sorry`
Canonical.lean:798:0: warning: declaration uses `sorry`
Canonical.lean:800:0: warning: declaration uses `sorry`
Canonical.lean:807:0: warning: declaration uses `sorry`
Canonical.lean:813:0: warning: declaration uses `sorry`
Canonical.lean:815:0: warning: declaration uses `sorry`
Canonical.lean:817:0: warning: declaration uses `sorry`
Canonical.lean:819:0: warning: declaration uses `sorry`
Canonical.lean:821:0: warning: declaration uses `sorry`
Canonical.lean:830:0: warning: declaration uses `sorry`
Canonical.lean:832:0: warning: declaration uses `sorry`
Canonical.lean:834:0: warning: declaration uses `sorry`
Canonical.lean:839:0: warning: declaration uses `sorry`
Canonical.lean:846:0: warning: declaration uses `sorry`
Canonical.lean:855:0: warning: declaration uses `sorry`
Canonical.lean:860:0: warning: declaration uses `sorry`
Canonical.lean:867:0: warning: declaration uses `sorry`
Canonical.lean:869:0: warning: declaration uses `sorry`
Canonical.lean:871:0: warning: declaration uses `sorry`
Canonical.lean:875:0: warning: declaration uses `sorry`
Canonical.lean:877:0: warning: declaration uses `sorry`
Canonical.lean:880:0: warning: declaration uses `sorry`
Canonical.lean:886:0: warning: declaration uses `sorry`
Canonical.lean:889:0: warning: declaration uses `sorry`
Canonical.lean:902:0: warning: declaration uses `sorry`
Canonical.lean:910:0: warning: declaration uses `sorry`
Canonical.lean:922:0: warning: declaration uses `sorry`
Canonical.lean:942:8: warning: declaration uses `sorry`
Canonical.lean:952:4: warning: declaration uses `sorry`
Canonical.lean:956:8: warning: declaration uses `sorry`
Canonical.lean:960:8: warning: declaration uses `sorry`
Canonical.lean:967:4: warning: declaration uses `sorry`
Canonical.lean:971:8: warning: declaration uses `sorry`
Canonical.lean:978:8: warning: declaration uses `sorry`
Canonical.lean:986:4: warning: declaration uses `sorry`
Canonical.lean:989:8: warning: declaration uses `sorry`
Canonical.lean:994:8: warning: declaration uses `sorry`
Canonical.lean:1003:4: warning: declaration uses `sorry`
Canonical.lean:1007:8: warning: declaration uses `sorry`
Canonical.lean:1012:8: warning: declaration uses `sorry`
Canonical.lean:1021:8: warning: declaration uses `sorry`
Canonical.lean:1028:0: warning: declaration uses `sorry`
Canonical.lean:1031:0: warning: declaration uses `sorry`
Canonical.lean:1034:0: warning: declaration uses `sorry`
Canonical.lean:1036:0: warning: declaration uses `sorry`
Canonical.lean:1040:0: warning: declaration uses `sorry`
Canonical.lean:1044:0: warning: declaration uses `sorry`
Canonical.lean:1046:0: warning: declaration uses `sorry`
Canonical.lean:1050:0: warning: declaration uses `sorry`
Canonical.lean:1054:0: warning: declaration uses `sorry`
Canonical.lean:1060:4: warning: declaration uses `sorry`
Canonical.lean:1065:8: warning: declaration uses `sorry`
Canonical.lean:1071:8: warning: declaration uses `sorry`
Canonical.lean:1078:4: warning: declaration uses `sorry`
Canonical.lean:1083:8: warning: declaration uses `sorry`
Canonical.lean:1090:8: warning: declaration uses `sorry`
Canonical.lean:1101:0: warning: declaration uses `sorry`
Canonical.lean:1106:0: warning: declaration uses `sorry`
Canonical.lean:1108:0: warning: declaration uses `sorry`
Canonical.lean:1113:0: warning: declaration uses `sorry`
Canonical.lean:1117:0: warning: declaration uses `sorry`
Canonical.lean:1119:0: warning: declaration uses `sorry`
Canonical.lean:1130:0: warning: declaration uses `sorry`
Canonical.lean:1138:8: warning: declaration uses `sorry`
Canonical.lean:1145:8: warning: declaration uses `sorry`
Canonical.lean:1608:6: warning: declaration uses `sorry`
Canonical.lean:1612:4: warning: declaration uses `sorry`
Canonical.lean:1615:6: warning: declaration uses `sorry`
Canonical.lean:1619:6: warning: declaration uses `sorry`
Canonical.lean:1624:6: warning: declaration uses `sorry`
Canonical.lean:1629:6: warning: declaration uses `sorry`
Canonical.lean:1634:6: warning: declaration uses `sorry`
Canonical.lean:1639:6: warning: declaration uses `sorry`
Canonical.lean:1644:6: warning: declaration uses `sorry`
Canonical.lean:1648:6: warning: declaration uses `sorry`
Canonical.lean:1653:6: warning: declaration uses `sorry`
Canonical.lean:1658:0: warning: declaration uses `sorry`
Canonical.lean:1662:0: warning: declaration uses `sorry`
Canonical.lean:1671:0: warning: declaration uses `sorry`
Canonical.lean:1684:0: warning: declaration uses `sorry`
Canonical.lean:1690:0: warning: declaration uses `sorry`
Canonical.lean:1696:0: warning: declaration uses `sorry`
Canonical.lean:1715:4: warning: declaration uses `sorry`
Canonical.lean:1717:6: warning: declaration uses `sorry`
Canonical.lean:1721:6: warning: declaration uses `sorry`
Canonical.lean:1725:6: warning: declaration uses `sorry`
Canonical.lean:1729:6: warning: declaration uses `sorry`
Canonical.lean:1732:6: warning: declaration uses `sorry`
Canonical.lean:1735:4: warning: declaration uses `sorry`
Canonical.lean:1737:6: warning: declaration uses `sorry`
Canonical.lean:1740:4: warning: declaration uses `sorry`
Canonical.lean:1742:6: warning: declaration uses `sorry`
Canonical.lean:1746:6: warning: declaration uses `sorry`
Canonical.lean:1748:6: warning: declaration uses `sorry`
Canonical.lean:1750:6: warning: declaration uses `sorry`
Canonical.lean:1753:6: warning: declaration uses `sorry`
Canonical.lean:1758:0: warning: declaration uses `sorry`
Canonical.lean:1762:0: warning: declaration uses `sorry`
Canonical.lean:1766:0: warning: declaration uses `sorry`
Canonical.lean:1770:0: warning: declaration uses `sorry`
Canonical.lean:1773:0: warning: declaration uses `sorry`
Canonical.lean:1776:0: warning: declaration uses `sorry`
Canonical.lean:1779:0: warning: declaration uses `sorry`
Canonical.lean:1783:0: warning: declaration uses `sorry`
Canonical.lean:1788:0: warning: declaration uses `sorry`
Canonical.lean:1810:6: warning: declaration uses `sorry`
Canonical.lean:1814:6: warning: declaration uses `sorry`
Canonical.lean:1819:6: warning: declaration uses `sorry`
Canonical.lean:1825:6: warning: declaration uses `sorry`
Canonical.lean:1830:6: warning: declaration uses `sorry`
Canonical.lean:1834:6: warning: declaration uses `sorry`
Canonical.lean:1840:6: warning: declaration uses `sorry`
Canonical.lean:1843:6: warning: declaration uses `sorry`
Canonical.lean:1848:6: warning: declaration uses `sorry`
Canonical.lean:1854:6: warning: declaration uses `sorry`
Canonical.lean:1858:6: warning: declaration uses `sorry`
Canonical.lean:1865:6: warning: declaration uses `sorry`
Canonical.lean:1869:0: warning: declaration uses `sorry`
Canonical.lean:1874:0: warning: declaration uses `sorry`
Canonical.lean:1880:0: warning: declaration uses `sorry`
Canonical.lean:1886:0: warning: declaration uses `sorry`
Canonical.lean:1891:0: warning: declaration uses `sorry`
Canonical.lean:1897:0: warning: declaration uses `sorry`
Canonical.lean:1901:0: warning: declaration uses `sorry`
Canonical.lean:1905:0: warning: declaration uses `sorry`
Canonical.lean:1922:6: warning: declaration uses `sorry`
Canonical.lean:1925:6: warning: declaration uses `sorry`
Canonical.lean:1928:6: warning: declaration uses `sorry`
Canonical.lean:1933:6: warning: declaration uses `sorry`
Canonical.lean:1939:0: warning: declaration uses `sorry`
Canonical.lean:1947:0: warning: declaration uses `sorry`
Canonical.lean:1955:0: warning: declaration uses `sorry`
Canonical.lean:1963:0: warning: declaration uses `sorry`
Canonical.lean:1972:0: warning: declaration uses `sorry`
Canonical.lean:1980:0: warning: declaration uses `sorry`
Canonical.lean:2008:6: warning: declaration uses `sorry`
Canonical.lean:2013:6: warning: declaration uses `sorry`
Canonical.lean:2016:6: warning: declaration uses `sorry`
Canonical.lean:2020:6: warning: declaration uses `sorry`
Canonical.lean:2025:4: warning: declaration uses `sorry`
Canonical.lean:2028:6: warning: declaration uses `sorry`
Canonical.lean:2032:6: warning: declaration uses `sorry`
Canonical.lean:2035:6: warning: declaration uses `sorry`
Canonical.lean:2039:6: warning: declaration uses `sorry`
Canonical.lean:2043:6: warning: declaration uses `sorry`
Canonical.lean:2047:4: warning: declaration uses `sorry`
Canonical.lean:2050:6: warning: declaration uses `sorry`
Canonical.lean:2054:6: warning: declaration uses `sorry`
Canonical.lean:2057:6: warning: declaration uses `sorry`
Canonical.lean:2061:6: warning: declaration uses `sorry`
Canonical.lean:2065:6: warning: declaration uses `sorry`
Canonical.lean:2068:6: warning: declaration uses `sorry`
Canonical.lean:2071:6: warning: declaration uses `sorry`
Canonical.lean:2075:6: warning: declaration uses `sorry`
Canonical.lean:2079:6: warning: declaration uses `sorry`
Canonical.lean:2083:6: warning: declaration uses `sorry`
Canonical.lean:2088:0: warning: declaration uses `sorry`
Canonical.lean:2092:0: warning: declaration uses `sorry`
Canonical.lean:2096:0: warning: declaration uses `sorry`
Canonical.lean:2100:0: warning: declaration uses `sorry`
Canonical.lean:2104:0: warning: declaration uses `sorry`
Canonical.lean:2108:0: warning: declaration uses `sorry`
Canonical.lean:2112:0: warning: declaration uses `sorry`
Canonical.lean:2124:0: warning: declaration uses `sorry`
Canonical.lean:2136:0: warning: declaration uses `sorry`
Canonical.lean:2146:0: warning: declaration uses `sorry`
Canonical.lean:2157:0: warning: declaration uses `sorry`
Canonical.lean:2168:0: warning: declaration uses `sorry`
Canonical.lean:2197:6: warning: declaration uses `sorry`
Canonical.lean:2200:6: warning: declaration uses `sorry`
Canonical.lean:2203:6: warning: declaration uses `sorry`
Canonical.lean:2206:6: warning: declaration uses `sorry`
Canonical.lean:2211:4: warning: declaration uses `sorry`
Canonical.lean:2213:6: warning: declaration uses `sorry`
Canonical.lean:2216:6: warning: declaration uses `sorry`
Canonical.lean:2219:6: warning: declaration uses `sorry`
Canonical.lean:2222:6: warning: declaration uses `sorry`
Canonical.lean:2226:6: warning: declaration uses `sorry`
Canonical.lean:2234:6: warning: declaration uses `sorry`
Canonical.lean:2238:6: warning: declaration uses `sorry`
Canonical.lean:2242:6: warning: declaration uses `sorry`
Canonical.lean:2245:6: warning: declaration uses `sorry`
Canonical.lean:2251:6: warning: declaration uses `sorry`
Canonical.lean:2254:6: warning: declaration uses `sorry`
Canonical.lean:2257:4: warning: declaration uses `sorry`
Canonical.lean:2260:6: warning: declaration uses `sorry`
Canonical.lean:2264:6: warning: declaration uses `sorry`
Canonical.lean:2269:6: warning: declaration uses `sorry`
Canonical.lean:2273:6: warning: declaration uses `sorry`
Canonical.lean:2278:4: warning: declaration uses `sorry`
Canonical.lean:2281:6: warning: declaration uses `sorry`
Canonical.lean:2285:6: warning: declaration uses `sorry`
Canonical.lean:2290:6: warning: declaration uses `sorry`
Canonical.lean:2294:6: warning: declaration uses `sorry`
Canonical.lean:2300:0: warning: declaration uses `sorry`
Canonical.lean:2303:0: warning: declaration uses `sorry`
Canonical.lean:2307:0: warning: declaration uses `sorry`
Canonical.lean:2311:0: warning: declaration uses `sorry`
Canonical.lean:2315:0: warning: declaration uses `sorry`
Canonical.lean:2319:0: warning: declaration uses `sorry`
Canonical.lean:2323:0: warning: declaration uses `sorry`
Canonical.lean:2327:0: warning: declaration uses `sorry`
Canonical.lean:2331:0: warning: declaration uses `sorry`
Canonical.lean:2335:0: warning: declaration uses `sorry`
Canonical.lean:2340:0: warning: declaration uses `sorry`
Canonical.lean:2345:0: warning: declaration uses `sorry`
Canonical.lean:2350:0: warning: declaration uses `sorry`
Canonical.lean:2355:0: warning: declaration uses `sorry`
Canonical.lean:2360:0: warning: declaration uses `sorry`
Canonical.lean:2365:0: warning: declaration uses `sorry`
Canonical.lean:2370:0: warning: declaration uses `sorry`
Canonical.lean:2396:6: warning: declaration uses `sorry`
Canonical.lean:2399:6: warning: declaration uses `sorry`
Canonical.lean:2403:6: warning: declaration uses `sorry`
Canonical.lean:2406:4: warning: declaration uses `sorry`
Canonical.lean:2409:6: warning: declaration uses `sorry`
Canonical.lean:2413:6: warning: declaration uses `sorry`
Canonical.lean:2417:6: warning: declaration uses `sorry`
Canonical.lean:2421:8: warning: declaration uses `sorry`
Canonical.lean:2424:4: warning: declaration uses `sorry`
Canonical.lean:2427:6: warning: declaration uses `sorry`
Canonical.lean:2431:6: warning: declaration uses `sorry`
Canonical.lean:2435:6: warning: declaration uses `sorry`
Canonical.lean:2440:0: warning: declaration uses `sorry`
Canonical.lean:2444:0: warning: declaration uses `sorry`
Canonical.lean:2450:0: warning: declaration uses `sorry`
Canonical.lean:2456:0: warning: declaration uses `sorry`
Canonical.lean:2460:0: warning: declaration uses `sorry`
Canonical.lean:2464:0: warning: declaration uses `sorry`
Canonical.lean:2468:0: warning: declaration uses `sorry`
Canonical.lean:2472:0: warning: declaration uses `sorry`
Canonical.lean:2476:0: warning: declaration uses `sorry`
Canonical.lean:2481:0: warning: declaration uses `sorry`
Canonical.lean:2514:4: warning: declaration uses `sorry`
Canonical.lean:2517:6: warning: declaration uses `sorry`
Canonical.lean:2521:4: warning: declaration uses `sorry`
Canonical.lean:2525:6: warning: declaration uses `sorry`
Canonical.lean:2530:6: warning: declaration uses `sorry`
Canonical.lean:2537:4: warning: declaration uses `sorry`
Canonical.lean:2540:6: warning: declaration uses `sorry`
Canonical.lean:2544:6: warning: declaration uses `sorry`
Canonical.lean:2548:6: warning: declaration uses `sorry`
Canonical.lean:2554:6: warning: declaration uses `sorry`
Canonical.lean:2560:6: warning: declaration uses `sorry`
Canonical.lean:2565:6: warning: declaration uses `sorry`
Canonical.lean:2569:6: warning: declaration uses `sorry`
Canonical.lean:2573:4: warning: declaration uses `sorry`
Canonical.lean:2576:6: warning: declaration uses `sorry`
Canonical.lean:2580:6: warning: declaration uses `sorry`
Canonical.lean:2588:4: warning: declaration uses `sorry`
Canonical.lean:2591:6: warning: declaration uses `sorry`
Canonical.lean:2595:4: warning: declaration uses `sorry`
Canonical.lean:2598:6: warning: declaration uses `sorry`
Canonical.lean:2602:6: warning: declaration uses `sorry`
Canonical.lean:2606:6: warning: declaration uses `sorry`
Canonical.lean:2612:6: warning: declaration uses `sorry`
Canonical.lean:2617:6: warning: declaration uses `sorry`
Canonical.lean:2621:6: warning: declaration uses `sorry`
Canonical.lean:2625:4: warning: declaration uses `sorry`
Canonical.lean:2628:6: warning: declaration uses `sorry`
Canonical.lean:2632:6: warning: declaration uses `sorry`
Canonical.lean:2640:6: warning: declaration uses `sorry`
Canonical.lean:2645:6: warning: declaration uses `sorry`
Canonical.lean:2650:6: warning: declaration uses `sorry`
Canonical.lean:2656:6: warning: declaration uses `sorry`
Canonical.lean:2662:6: warning: declaration uses `sorry`
Canonical.lean:2668:6: warning: declaration uses `sorry`
Canonical.lean:2675:0: warning: declaration uses `sorry`
Canonical.lean:2679:0: warning: declaration uses `sorry`
Canonical.lean:2685:0: warning: declaration uses `sorry`
Canonical.lean:2692:0: warning: declaration uses `sorry`
Canonical.lean:2696:0: warning: declaration uses `sorry`
Canonical.lean:2702:0: warning: declaration uses `sorry`
Canonical.lean:2710:0: warning: declaration uses `sorry`
Canonical.lean:2714:0: warning: declaration uses `sorry`
Canonical.lean:2721:0: warning: declaration uses `sorry`
Canonical.lean:2727:0: warning: declaration uses `sorry`
Canonical.lean:2731:0: warning: declaration uses `sorry`
Canonical.lean:2738:0: warning: declaration uses `sorry`
Canonical.lean:2744:0: warning: declaration uses `sorry`
Canonical.lean:2750:0: warning: declaration uses `sorry`
Canonical.lean:2756:0: warning: declaration uses `sorry`
Canonical.lean:2760:0: warning: declaration uses `sorry`
Canonical.lean:2766:0: warning: declaration uses `sorry`
Canonical.lean:2772:0: warning: declaration uses `sorry`
Canonical.lean:2776:0: warning: declaration uses `sorry`
Canonical.lean:2785:0: warning: declaration uses `sorry`
Canonical.lean:2794:0: warning: declaration uses `sorry`
Canonical.lean:2801:0: warning: declaration uses `sorry`
Canonical.lean:2808:0: warning: declaration uses `sorry`
Canonical.lean:2812:0: warning: declaration uses `sorry`
Canonical.lean:2834:4: warning: declaration uses `sorry`
Canonical.lean:2836:6: warning: declaration uses `sorry`
Canonical.lean:2840:6: warning: declaration uses `sorry`
Canonical.lean:2844:6: warning: declaration uses `sorry`
Canonical.lean:2848:6: warning: declaration uses `sorry`
Canonical.lean:2852:4: warning: declaration uses `sorry`
Canonical.lean:2854:6: warning: declaration uses `sorry`
Canonical.lean:2858:6: warning: declaration uses `sorry`
Canonical.lean:2861:6: warning: declaration uses `sorry`
Canonical.lean:2864:6: warning: declaration uses `sorry`
Canonical.lean:2868:6: warning: declaration uses `sorry`
Canonical.lean:2872:6: warning: declaration uses `sorry`
Canonical.lean:2876:6: warning: declaration uses `sorry`
Canonical.lean:2879:6: warning: declaration uses `sorry`
Canonical.lean:2882:6: warning: declaration uses `sorry`
Canonical.lean:2886:6: warning: declaration uses `sorry`
Canonical.lean:2891:0: warning: declaration uses `sorry`
Canonical.lean:2897:0: warning: declaration uses `sorry`
Canonical.lean:2903:0: warning: declaration uses `sorry`
Canonical.lean:2908:0: warning: declaration uses `sorry`
Canonical.lean:2912:0: warning: declaration uses `sorry`
Canonical.lean:2916:0: warning: declaration uses `sorry`
Canonical.lean:2920:0: warning: declaration uses `sorry`
Canonical.lean:2925:0: warning: declaration uses `sorry`
Canonical.lean:2929:0: warning: declaration uses `sorry`
Canonical.lean:2951:4: warning: declaration uses `sorry`
Canonical.lean:2954:6: warning: declaration uses `sorry`
Canonical.lean:2959:6: warning: declaration uses `sorry`
Canonical.lean:2964:4: warning: declaration uses `sorry`
Canonical.lean:2967:6: warning: declaration uses `sorry`
Canonical.lean:2972:6: warning: declaration uses `sorry`
Canonical.lean:2976:6: warning: declaration uses `sorry`
Canonical.lean:2980:6: warning: declaration uses `sorry`
Canonical.lean:2985:6: warning: declaration uses `sorry`
Canonical.lean:2990:4: warning: declaration uses `sorry`
Canonical.lean:2994:4: warning: declaration uses `sorry`
Canonical.lean:2998:6: warning: declaration uses `sorry`
Canonical.lean:3003:6: warning: declaration uses `sorry`
Canonical.lean:3009:6: warning: declaration uses `sorry`
Canonical.lean:3013:6: warning: declaration uses `sorry`
Canonical.lean:3016:4: warning: declaration uses `sorry`
Canonical.lean:3019:4: warning: declaration uses `sorry`
Canonical.lean:3022:6: warning: declaration uses `sorry`
Canonical.lean:3026:6: warning: declaration uses `sorry`
Canonical.lean:3030:6: warning: declaration uses `sorry`
Canonical.lean:3035:6: warning: declaration uses `sorry`
Canonical.lean:3039:6: warning: declaration uses `sorry`
Canonical.lean:3044:6: warning: declaration uses `sorry`
Canonical.lean:3048:6: warning: declaration uses `sorry`
Canonical.lean:3054:6: warning: declaration uses `sorry`
Canonical.lean:3058:6: warning: declaration uses `sorry`
Canonical.lean:3062:6: warning: declaration uses `sorry`
Canonical.lean:3066:6: warning: declaration uses `sorry`
Canonical.lean:3071:0: warning: declaration uses `sorry`
Canonical.lean:3076:0: warning: declaration uses `sorry`
Canonical.lean:3081:0: warning: declaration uses `sorry`
Canonical.lean:3086:0: warning: declaration uses `sorry`
Canonical.lean:3090:0: warning: declaration uses `sorry`
Canonical.lean:3096:0: warning: declaration uses `sorry`
Canonical.lean:3102:0: warning: declaration uses `sorry`
Canonical.lean:3109:0: warning: declaration uses `sorry`
Canonical.lean:3116:0: warning: declaration uses `sorry`
Canonical.lean:3120:0: warning: declaration uses `sorry`
Canonical.lean:3127:0: warning: declaration uses `sorry`
Canonical.lean:3134:0: warning: declaration uses `sorry`
Canonical.lean:3138:0: warning: declaration uses `sorry`
Canonical.lean:3143:0: warning: declaration uses `sorry`
Canonical.lean:3148:0: warning: declaration uses `sorry`
Canonical.lean:3152:0: warning: declaration uses `sorry`
Canonical.lean:3157:0: warning: declaration uses `sorry`
Canonical.lean:3162:0: warning: declaration uses `sorry`
Canonical.lean:3165:6: warning: declaration uses `sorry`
Canonical.lean:3169:6: warning: declaration uses `sorry`
Canonical.lean:3188:4: warning: declaration uses `sorry`
Canonical.lean:3192:6: warning: declaration uses `sorry`
Canonical.lean:3196:6: warning: declaration uses `sorry`
Canonical.lean:3202:6: warning: declaration uses `sorry`
Canonical.lean:3209:4: warning: declaration uses `sorry`
Canonical.lean:3214:4: warning: declaration uses `sorry`
Canonical.lean:3219:6: warning: declaration uses `sorry`
Canonical.lean:3223:6: warning: declaration uses `sorry`
Canonical.lean:3227:6: warning: declaration uses `sorry`
Canonical.lean:3230:6: warning: declaration uses `sorry`
Canonical.lean:3233:6: warning: declaration uses `sorry`
Canonical.lean:3237:6: warning: declaration uses `sorry`
Canonical.lean:3241:6: warning: declaration uses `sorry`
Canonical.lean:3245:6: warning: declaration uses `sorry`
Canonical.lean:3249:6: warning: declaration uses `sorry`
Canonical.lean:3257:0: warning: declaration uses `sorry`
Canonical.lean:3262:0: warning: declaration uses `sorry`
Canonical.lean:3268:0: warning: declaration uses `sorry`
Canonical.lean:3276:0: warning: declaration uses `sorry`
Canonical.lean:3282:0: warning: declaration uses `sorry`
Canonical.lean:3288:0: warning: declaration uses `sorry`
Canonical.lean:3294:0: warning: declaration uses `sorry`
Canonical.lean:3300:0: warning: declaration uses `sorry`
Canonical.lean:3307:0: warning: declaration uses `sorry`
Canonical.lean:3313:0: warning: declaration uses `sorry`
Canonical.lean:3318:0: warning: declaration uses `sorry`
Canonical.lean:3324:0: warning: declaration uses `sorry`
# END ARCHIVED SECTION EXT CANONICAL DIAGNOSTICS
```

