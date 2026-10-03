# N7 immutable affine cokernel evidence — Codex codex-a71f92

Claim 5963356805, confirmation 5963358012; read base f0401e396395a306b58cb28db79f3b24721e6fb3. Planning prototypes, no implementation claim.

Native 793 lines, 34 examples, 52 audits, 0 errors/warnings/admissions; latest sequential compile 26.01s, peak RSS 6813100 KiB, exit0. Admitted exact new-header extraction606 lines, 34 total examples, 22 new headers and15 new named examples, exactly37 admission warnings; 22.41s, peak RSS6781424KiB, exit0. Available memory46GiB before both runs; timeout1200s; no concurrent owned Lean or library build.

Source hashes:

```json
{
  "Native.lean": "fb78e8d07d5a68f118f5ff3b1ac4e2f9571dd09ef9d921f3619af7e08e99a8a3",
  "Admitted.lean": "f24da6f72e809606398333b878267bb590cef80363d4b8cd9c68f2787f47d8cc",
  "verify.py": "42bc81d318df7e91fc5f6169df16aee16a4c0afdbb2edca411d78fc3319aa7a7",
  "immutable_view.py": "a577a14520365da4cfaf5062ec7cc97ca8608325f0ae9176a1df1b0b414295ef"
}
```

## Actual immutable validator

```python
# BEGIN ARCHIVED AFFINE COKERNEL VALIDATOR
"""Actual immutable checker/intake/atlas assembly and preservation checks."""
from pathlib import Path
import os,sys,json,re,ast,hashlib,collections,copy,subprocess
import immutable_view as gv
HERE=Path(__file__).resolve().parent
RID="NeronModelsAndSemistableAbelianVarietiesPartII";STEM=RID
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
changed=RID+":G.1/quadratic-pinch-i1-genus"
assert len(old)==224 and len(new)==246 and set(old)<=set(new)
assert all(new[nid]==n for nid,n in old.items() if nid!=changed)
for key,value in old[changed].items():
 if key not in {"proofSteps","prerequisites"}:assert new[changed][key]==value,key
assert new[changed]["proofSteps"][:-1]==old[changed]["proofSteps"]
assert new[changed]["prerequisites"][:-2]==old[changed]["prerequisites"]
for key in original:
 if key not in {"summary","sources","nodes","baseline","coverage"}:assert p[key]==original[key],key
assert p["sources"][:-1]==original["sources"]
assert p["baseline"]["declarations"][:192]==original["baseline"]["declarations"]
assert len(p["baseline"]["declarations"])==219
for key,value in original["baseline"].items():
 if key!="declarations":assert p["baseline"][key]==value,key
assert p["summary"].startswith(original["summary"])
assert len(p["coverage"])==7
for row,row0 in zip(p["coverage"],original["coverage"]):
 if row["stageId"]!=RID+":G.1":assert row==row0
 else:
  assert row["remaining"][:-1]==row0["remaining"]
  for key,value in row0.items():
   if key!="remaining":assert row[key]==value
assert p["status"]=="partial" and all(n["implementationStatus"]=="unchecked" for n in new.values())
assert new[RID+":key/ferrand-pushouts"]==old[RID+":key/ferrand-pushouts"]
r=json.loads((HERE/("roadmaps/"+RID+".json")).read_text())
for key,value in oldroadmap.items():
 if key not in {"summary","stages"}:assert r[key]==value,key
assert r["summary"].startswith(oldroadmap["summary"])
for row,row0 in zip(r["stages"],oldroadmap["stages"]):
 if row["key"]!="G.1":assert row==row0
 else:
  assert row["description"].startswith(row0["description"])
  for key,value in row0.items():
   if key!="description":assert row[key]==value
assert reader.startswith(oldreader)
imports=["Mathlib.LinearAlgebra.Isomorphisms","Mathlib.LinearAlgebra.Quotient.Basic","Mathlib.LinearAlgebra.FiniteDimensional.Basic","Mathlib.RingTheory.Ideal.Maps","Mathlib.Algebra.Module.Equiv.Basic","Mathlib.Algebra.Algebra.Tower"]
restored=lean
for name in imports:restored=restored.replace("import "+name+"\n","",1)
assert restored.startswith(oldlean)
for nid,node in new.items():
 if nid in old:continue
 assert node["statement"] in reader and node["declarationName"] in reader,nid
 assert node["declarationName"].removeprefix("QuadraticPinch.") in lean,nid
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
admitted=(HERE/"Admitted.lean").read_text()
nlog=(HERE/"Native.log").read_text();alog=(HERE/"Admitted.log").read_text()
assert nlog.count("depends on axioms:")==52 and not re.search(r"error|warning|sorryAx",nlog)
assert "Exit status: 0" in (HERE/"Native.resources").read_text()
assert "error" not in alog and alog.count("warning:")==alog.count("warning: declaration uses")==37
assert "Exit status: 0" in (HERE/"Admitted.resources").read_text()
assert len(re.findall(r"^example\b",native,re.M))==34
assert len(re.findall(r"^example\b",admitted,re.M))==34
assert len(re.findall(r"^example\b",lean,re.M))==128
assert not re.search(r"\bsorry\b",native)
names=["normalization_image_span","conductor_image_span","residueCokernelMap","residueCokernelMap_apply","residueCokernelMap_ker","residueCokernelMap_surjective","residueCokernelEquiv","residueCokernelEquiv_apply","residueCokernelEquiv_symm_apply","conductor_span_restrictScalars","normalization_quotient_reconstruction","normalization_quotient_scalar_action","normalization_quotient_generator_ne_zero","normalization_quotient_annihilator_mem","normalization_quotient_annihilator","normalization_quotient_finrank","residueCokernelEquiv_annihilator","residueCokernelEquiv_scalar_action","normalization_span_restrictScalars","residueCokernelEquiv_over_k","residueCokernelEquiv_over_k_apply","residueCokernelEquiv_over_k_symm_apply"]
def headers(s):
 found={}
 for name in names:
  match=re.search(r"^(?:noncomputable )?(?:def|lemma) "+re.escape(name)+r"\b[\s\S]*?:=",s,re.M)
  assert match,name
  found[name]=match.group(0).split(":=",1)[0].rstrip()
 return found
assert headers(native)==headers(lean)==headers(admitted)
newtests=["QuadraticPinch.residueCokernelMap.constant","QuadraticPinch.residueCokernelMap.multiple","QuadraticPinch.residueCokernelMap.cusp_root","QuadraticPinch.residueCokernelEquiv.representatives","QuadraticPinch.residueCokernelEquiv.unit","QuadraticPinch.residueCokernelEquiv.zero","QuadraticPinch.normalizationCokernel.cusp_dimension","QuadraticPinch.normalizationCokernel.nonsplit_dimension","QuadraticPinch.residueCokernelEquiv.repeated_char3","QuadraticPinch.normalizationCokernel.unit_not_annihilator","QuadraticPinch.normalizationCokernel.conductor_action","QuadraticPinch.residueCokernelEquiv.scalar_action","QuadraticPinch.residueCokernelEquiv_over_k.cusp","QuadraticPinch.residueCokernelEquiv_over_k.unit","QuadraticPinch.residueCokernelEquiv_over_k.zero"]
def tests(s):
 found={}
 for name in newtests:
  match=re.search(r"-- test: "+re.escape(name)+r"\n(example[\s\S]*?):=",s)
  assert match,name
  found[name]=match.group(1).rstrip()
 return found
assert tests(native)==tests(lean)==tests(admitted)
print(json.dumps({"preservedWholeNodeObjects":223,"incomingContracts":224,"newNodes":22,
"api":sum(len(n.get("api",[])) for n in p["nodes"]),
"tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"intake":"pass",
"newPublicHeadersMatched":22,"namedTestHeadersMatched":15}),flush=True)
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
# END ARCHIVED AFFINE COKERNEL VALIDATOR
```

## Immutable repository reader

```python
# BEGIN ARCHIVED IMMUTABLE READER
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
BASE = os.environ.get('P8_VALIDATE_BASE', 'a6094bd6d7c7856944d7cf3b905c7e9bf11d90fd')
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
# END ARCHIVED IMMUTABLE READER
```

## Native axiom output

```text
'TauCeti.GenusOne.QuadraticPinch.algebra' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.mem_algebra' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.constants' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_remainder' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_fst' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_snd' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_reconstruct' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_span' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_module_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.finite_normalization' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_spec_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fraction_ring' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.integral_closure' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.integral_iff_polynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv_algebraMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_algebraMap' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_X' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.module_generator_map_not_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_image_span' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.conductor_image_span' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelMap_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelMap_ker' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelMap_surjective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_symm_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.conductor_span_restrictScalars' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_quotient_reconstruction' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_quotient_finrank' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_annihilator' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.polynomialQuotientAlgebra' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.polynomialQuotientTower' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_scalar_action' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_span_restrictScalars' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_over_k' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_over_k_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residueCokernelEquiv_over_k_symm_apply' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_quotient_annihilator' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_quotient_annihilator_mem' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_quotient_generator_ne_zero' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_quotient_scalar_action' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residue_kernel' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residue_surjective' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residue_normal_form' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.residue' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.linear_remainder' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.scalar_unique' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.remainder_scalar' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.constant_remainder' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Admitted-header output (scratch prefix removed)

```text
'TauCeti.GenusOne.QuadraticPinch.algebra' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.mem_algebra' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.constants' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_remainder' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_fst' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_snd' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.moduleCoefficients_reconstruct' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_span' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_module_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.finite_normalization' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.normalization_spec_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fraction_ring' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.integral_closure' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.integral_iff_polynomial' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv_algebraMap' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_algebraMap' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.fractionEquiv_symm_X' depends on axioms: [propext, Classical.choice, Quot.sound]
'TauCeti.GenusOne.QuadraticPinch.module_generator_map_not_injective' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
Admitted.lean:289:6: warning: declaration uses `sorry`
Admitted.lean:292:6: warning: declaration uses `sorry`
Admitted.lean:296:4: warning: declaration uses `sorry`
Admitted.lean:300:6: warning: declaration uses `sorry`
Admitted.lean:305:6: warning: declaration uses `sorry`
Admitted.lean:309:6: warning: declaration uses `sorry`
Admitted.lean:312:18: warning: declaration uses `sorry`
Admitted.lean:316:6: warning: declaration uses `sorry`
Admitted.lean:321:6: warning: declaration uses `sorry`
Admitted.lean:327:6: warning: declaration uses `sorry`
Admitted.lean:331:6: warning: declaration uses `sorry`
Admitted.lean:463:6: warning: declaration uses `sorry`
Admitted.lean:469:6: warning: declaration uses `sorry`
Admitted.lean:474:6: warning: declaration uses `sorry`
Admitted.lean:480:6: warning: declaration uses `sorry`
Admitted.lean:486:6: warning: declaration uses `sorry`
Admitted.lean:490:6: warning: declaration uses `sorry`
Admitted.lean:497:0: warning: declaration uses `sorry`
Admitted.lean:500:0: warning: declaration uses `sorry`
Admitted.lean:503:0: warning: declaration uses `sorry`
Admitted.lean:506:0: warning: declaration uses `sorry`
Admitted.lean:512:0: warning: declaration uses `sorry`
Admitted.lean:516:0: warning: declaration uses `sorry`
Admitted.lean:523:0: warning: declaration uses `sorry`
Admitted.lean:529:0: warning: declaration uses `sorry`
Admitted.lean:536:0: warning: declaration uses `sorry`
Admitted.lean:547:0: warning: declaration uses `sorry`
Admitted.lean:552:0: warning: declaration uses `sorry`
Admitted.lean:557:6: warning: declaration uses `sorry`
Admitted.lean:564:0: warning: declaration uses `sorry`
Admitted.lean:570:6: warning: declaration uses `sorry`
Admitted.lean:574:18: warning: declaration uses `sorry`
Admitted.lean:578:6: warning: declaration uses `sorry`
Admitted.lean:583:6: warning: declaration uses `sorry`
Admitted.lean:589:0: warning: declaration uses `sorry`
Admitted.lean:597:0: warning: declaration uses `sorry`
Admitted.lean:601:0: warning: declaration uses `sorry`
```

## Actual checker, preservation, intake and graph output

```json
[
  {
    "checker": {
      "packet": "research/blueprint/packets/NeronModelsAndSemistableAbelianVarietiesPartII.json",
      "roadmap": "NeronModelsAndSemistableAbelianVarietiesPartII",
      "status": "partial",
      "nodes": 246,
      "kinds": {
        "definition": 14,
        "lemma": 182,
        "theorem": 26,
        "comparison": 9,
        "construction": 15
      },
      "apiItems": 109,
      "unitTests": 109,
      "planets": 29,
      "baselineDeclarations": 219,
      "prerequisites": {
        "baseline": 290,
        "stage": 194,
        "node (this packet)": 559
      },
      "gaps": 17,
      "requests": 23,
      "stagesInScope": 7,
      "stagesClosed": 0
    },
    "errors": [],
    "warnings": []
  },
  {
    "preservedWholeNodeObjects": 223,
    "incomingContracts": 224,
    "newNodes": 22,
    "api": 109,
    "tests": 139,
    "intake": "pass",
    "newPublicHeadersMatched": 22,
    "namedTestHeadersMatched": 15
  },
  {
    "stageDAG": {
      "vertices": 3043,
      "edges": 8727,
      "acyclic": true
    },
    "ownDAG": {
      "vertices": 246,
      "edges": 559,
      "acyclic": true
    },
    "combinedDAG": {
      "vertices": 3260,
      "edges": 9474,
      "acyclic": true
    },
    "reachableDeclarations": 246,
    "externalDeclarations": [],
    "reachableBaselineReferences": 201,
    "unresolved": [],
    "otherPartsRetained": [],
    "partDeclarations": 246,
    "partPlanets": 29,
    "roadmapDeclarations": 246,
    "requiredStagePairs": 69,
    "requiredStagePairsReachable": 69,
    "inheritedMissingStagePairs": [],
    "acceptedRestructurePairs": 0,
    "acceptedRestructurePairsReachable": 0,
    "stageEdgesUnchanged": true,
    "otherSkippedPendingUnchanged": true,
    "ownSkippedPendingEmpty": true
  },
  {
    "controlOwnDAG": {
      "vertices": 224,
      "edges": 519,
      "acyclic": true
    },
    "incomingDeclarations": 224,
    "incomingPlanets": 29
  }
]
```
