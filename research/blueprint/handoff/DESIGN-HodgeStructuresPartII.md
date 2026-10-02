# DESIGN-HodgeStructuresPartII — arbitrary-coefficient ordered coherence checkpoint

Agent: Codex — codex-a71f92. Refs #3371.
Claim comment 5962697872; winning bot comment 5962698993.
Mathematical input: f6de888f4ad723d376d77b66fa8486d538bd1aeb.
Publication/control base: 2b3589a76848631513fb000b4d252a3f2a326a43.
Date: 2026-10-02.

## Outcome and exact scope

This partial affine continuation adds eight declaration-sized nodes: native cross-ring tensor-power equivalence, degree-zero unit and left-prepend equations, ordered-codomain equivalence and successor square, all-degree iterate comparison, identical-exponent preservation for every algebra and reflection for faithfully flat algebras. E and Q are arbitrary modules. No basis, finite generation, projectivity, flatness of E/Q, integrability, reducedness or characteristic assumption is introduced.

The actual native maps are not new carriers or stored comparison oracles. T_0 uses the native degree-zero equivalence, its scalar extension and the heterobasic right unit. A successor uses scalar extension of the inverse exact left-prepend equivalence, the existing binary distributor, id tensor T_n and the receiving left-prepend equivalence. D_n is binary distribution followed by id tensor T_n. The induction keeps the empty word and coefficient order.

The actual identity is D_n composed with baseChange(I_n(theta)) = I_n(baseChange(theta)). This is distinct from receiving-ring naturality. Vanishing transports at the same n, including n=0. Reflection uses D_n injectivity and the native faithful-flat one-tensor detection theorem on E tensor Q^(tensor n). Existing finite-basis theorem names/contracts are retained unchanged.

All 112 incoming contracts survive; 111 complete old node objects are identical. Only the existing ordered-iterate construction gains three APIs, uses and tests. The reserved general parameter-connection carrier, 149 route obligations, five supplier requests, eleven gap identities, six planets, source findings, 35 global omissions, and all nine stage IDs/requires are retained. The roadmap definition changes only its summary. Every node remains unchecked. H.0 remains partial; H.1–H.8 remain not_read. No source or supplier closure is claimed.

## Fresh reading and native baseline boundary

The complete current issue was read before the claim and after our bot confirmation. The full current mathematical handoff and roadmap definition were read. The reserved key, key survey/owner record, selected step/iterate/base-change/bound contracts, applicable reviewed parent Hodge L0–L3, E1 and D3 audit rows and their accepted review evidence were read. CR.1/E1/DD.1/D3 supplier scopes were checked. A bounded scan found no HodgeStructuresPartII link-map or accepted restructure entries. The full current parent HodgeStructures and nearby SemisimpleAlgebras upstream reader documents were read. No upstream roadmap is changed or re-planned.

At exact Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174, read the selected native tensor distributors, heterobasic right unit/extensionality, LinearMap/LinearEquiv scalar extension, tensor-power zero/singleton/multiplication/cast declarations and faithful-flat one-tensor detection with their ambient assumptions. The four new baseline records are exact indexed declarations, not proposed names. Bounded PiTensorProduct/TensorPower and Tau Ceti affine-Hodge/tensor searches found no suitable existing ordered cross-ring adapter; this is not a whole-library absence certification. No Tau Ceti compiled import set is assumed.

Fresh primary reading is scoped to [Heuer arXiv 2307.01303v3](https://arxiv.org/html/2307.01303v3): Definition 1.2(1)–(2), complete Definition 4.1, Theorem 4.8(1)–(3), Remark 4.9 and complete displayed proof. Download SHA-256 ec7742d917b413a52d05e5eeffbab9fdaab3bed13412dc2c9e426ffb8bcb8081, accessed 2026-10-02. The geometric field/local scalar-extension passage motivates authored arbitrary-ring algebra; none of the analytic correspondence or descent theorem is discharged. Inherited other-source receipts remain historical. No whole-paper or 149-item collation is claimed.

## Lean checks

Both exact files were compiled separately with Lean 4.34.0-rc2 in an already compiled exact-pin Mathlib build, with 52 GiB available before each final compile and a 1200-second bound. One owned Lean process at a time; no project setup, Lake update/build/cache download or Lean language server. No owned compile remains.

Native: 888 lines, 25 examples, 30 named axiom audits, zero errors/warnings/admissions. Ten new named declarations include the eight nodes and two standard construction APIs. The complete incoming 692-line proof is retained byte-for-byte. Only propext, Classical.choice and Quot.sound occur in the audits.

Planning file: 1746 lines, 109 examples, zero errors, 260 admitted-declaration warnings and no other warnings. Its entire incoming prefix is unchanged. Every new body, including the syntactic prepend abbreviation, is admitted under PROTOCOL §13; the distinct actual proof is archived separately. Type elaboration does not certify omitted global signatures or global implementation.

```json
{
  "Native.lean": {
    "sourceSha256": "acda08ebf51d6fba9d90af2f66453a49ee34519f26b56f00822a51449c81a077",
    "normalizedLogSha256": "0377446fdc308dd430f91513c2ab9a307c843af478038a10deb7e7fad4a2bc23",
    "lines": 888,
    "examples": 25,
    "axiomAudits": 30,
    "errors": 0,
    "admissionWarnings": 0,
    "otherWarnings": 0,
    "elapsed": "0:05.90",
    "maxRSSKiB": 2535720,
    "exitCode": 0,
    "availableGiBBefore": 52
  },
  "HodgeStructuresPartII.lean": {
    "sourceSha256": "5de4a850ac1eeff81e5ecc86e5f7558e367a4dee719c780b363041d164fffdf9",
    "normalizedLogSha256": "ba4f04a5a3cd830d1c639afeb1460f9479d51ac05ef27bbde95554b1d7e38947",
    "lines": 1746,
    "examples": 109,
    "axiomAudits": 0,
    "errors": 0,
    "admissionWarnings": 260,
    "otherWarnings": 0,
    "elapsed": "0:05.90",
    "maxRSSKiB": 2986768,
    "exitCode": 0,
    "availableGiBBefore": 52
  }
}
```

Diagnostics hashes normalize the actual scratch directory to SCRATCH and otherwise preserve the full time/Lean output. Timing/resource fields are measured run receipts, not a performance guarantee.

## Complete immutable proof archive and recovery

The [complete proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/9b529b527d287fe76f1f2fa7978c2cdf47354307/research/blueprint/suggested/HodgeStructuresPartII.lean) is commit 9b529b527d287fe76f1f2fa7978c2cdf47354307, blob 60d742d2569725979eb3cfb53a02d66c8f72609c. It contains the complete native proof after marker BEGIN ARCHIVED CHECKED HIGGS ARBITRARY COEFFICIENT COHERENCE and before END ARCHIVED CHECKED HIGGS ARBITRARY COEFFICIENT COHERENCE. Its additional parent is predecessor proof archive 9f179c941d3686eacb96322f20831efef6c2c78c. The final commit retains the new archive as an additional parent, so all proof evidence remains reachable after scratch cleanup.

The immutable public file was fetched again and its extracted bytes exactly matched the compiled native source. The complete predecessor prefix hash is 6a23f25f4d8709db044e950a9097754d114071dd5d08b9d000cb34a2c3194fb2. Recovery verifies both full-source hashes, all ten new declaration headers and all nine new example types against the canonical admitted forms.

Save the following as recover.py in your own on-disk scratch. Its default invocation prints the verification receipt. --source emits the exact Native.lean text; --sketch emits the exact admitted suggested file. Save those outputs using apply_patch or your editor, preserving the final newline; the script itself writes no file. No clone or repository snapshot is created.
Script SHA-256: dbef5d0bcb12c4bcf0cc224c75f7fefdf5b0284a1c7587353b32a31e5f00610f.

```python
"""Recover immutable native proof; emit source or receipt, never write files."""
import hashlib,json,re,sys,urllib.request
URL="https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/9b529b527d287fe76f1f2fa7978c2cdf47354307/research/blueprint/suggested/HodgeStructuresPartII.lean"
BEGIN="BEGIN ARCHIVED CHECKED HIGGS ARBITRARY COEFFICIENT COHERENCE\n"
END="END ARCHIVED CHECKED HIGGS ARBITRARY COEFFICIENT COHERENCE"
NATIVE_SHA="acda08ebf51d6fba9d90af2f66453a49ee34519f26b56f00822a51449c81a077"
SKETCH_SHA="5de4a850ac1eeff81e5ecc86e5f7558e367a4dee719c780b363041d164fffdf9"
text=urllib.request.urlopen(URL,timeout=60).read().decode()
native=text.split(BEGIN,1)[1].split(END,1)[0]
sketch=text.split("\n/-\n"+BEGIN,1)[0]
assert hashlib.sha256(native.encode()).hexdigest()==NATIVE_SHA
assert hashlib.sha256(sketch.encode()).hexdigest()==SKETCH_SHA
assert hashlib.sha256(native[:32067].encode()).hexdigest()=="6a23f25f4d8709db044e950a9097754d114071dd5d08b9d000cb34a2c3194fb2"
assert not re.search(r"\bsorry\b",native)
names=["affineTensorPowerBaseChange","affineTensorPowerBaseChange_symm_apply",
 "affineTensorPowerBaseChange_unit","affineTensorPowerBaseChange_prepend",
 "affineOrderedBaseChange","affineOrderedBaseChange_tmul","affineOrderedBaseChange_step",
 "affineOrderedIterate_baseChange_comparison",
 "affineOrderedIterate_baseChange_zero_of_arbitrary_coefficients",
 "affineOrderedIterate_baseChange_zero_iff_of_arbitrary_coefficients"]
def header(s,name):
 m=re.search(r"^(?:def|lemma) "+re.escape(name)+r"\b",s,re.M)
 assert m,name
 block=s[m.start():]
 end=re.search(r" :=(?: by| sorry|\n)|\n  \|",block)
 assert end,name
 return " ".join(block[:end.start()].split())
for name in names:assert header(native,name)==header(sketch,name),name
def examples(s):
 out=[]
 for m in re.finditer(r"^example\b",s,re.M):
  block=s[m.start():];end=re.search(r" :=(?: by| sorry|\n)",block)
  assert end
  out.append(" ".join(block[:end.start()].split()))
 return out
assert examples(native)[-9:]==examples(sketch)[-9:]
assert len(examples(native))==25 and len(examples(sketch))==109
if len(sys.argv)>1 and sys.argv[1]=="--source":
 sys.stdout.write(native)
elif len(sys.argv)>1 and sys.argv[1]=="--sketch":
 sys.stdout.write(sketch)
else:
 print(json.dumps({"archive":"9b529b527d287fe76f1f2fa7978c2cdf47354307","nativeSha256":NATIVE_SHA,
 "sketchSha256":SKETCH_SHA,"nativeLines":len(native.splitlines()),"nativeExamples":25,
 "newExampleHeadersMatched":9,"newDeclarationHeadersMatched":len(names),
 "predecessorByteIdentical":True,"noAdmissions":True}))
```

## Actual checker, intake and atlas assembly

The actual indexed checker and five-file intake have zero findings. Actual candidate/control assembly retains all standard overlays and retirements. The stage, own declaration and combined reachable prerequisite graphs are acyclic. All seven required supplier paths are present, including D3 to H.3 and H.8 through H.2. No unresolved reference or own skipped/pending link remains; stage edges and unrelated skipped/pending links are unchanged. This checks the scoped reachable declaration graph, not every unrelated declaration graph.

```json
{
  "stageDAG": {
    "vertices": 3022,
    "edges": 8663,
    "acyclic": true
  },
  "ownDAG": {
    "vertices": 120,
    "edges": 223,
    "acyclic": true
  },
  "combinedDAG": {
    "vertices": 3137,
    "edges": 8929,
    "acyclic": true
  },
  "reachableDeclarations": 121,
  "externalDeclarations": [
    "ColemanPowerSeries:L1/derivation-determinant-unit"
  ],
  "reachableBaselineReferences": 128,
  "unresolved": [],
  "otherPartsRetained": [],
  "partDeclarations": 120,
  "partPlanets": 6,
  "roadmapDeclarations": 120,
  "requiredStagePairs": 7,
  "requiredStagePairsReachable": 7,
  "inheritedMissingStagePairs": [],
  "acceptedRestructurePairs": 0,
  "acceptedRestructurePairsReachable": 0,
  "stageEdgesUnchanged": true,
  "otherSkippedPendingUnchanged": true,
  "ownSkippedPendingEmpty": true
}
```

Save immutable_view.py and verify.py below alongside the five submitted files named packet.json, reader.md, HodgeStructuresPartII.lean, roadmap.json, handoff.md and the recovered Native.lean. After reproducing the one-at-a-time native and planning compiles, retain their complete diagnostics as native.log and canonical.log. Use the already built exact-pin dependencies, check free -g first, and use the correct installed Lean binary and LEAN_PATH; do not set up or build another project.

Set TAUCETI_REPO to the existing atlas checkout, TAUCETI_BASELINE to its pinned declarations.tsv and PYTHONDONTWRITEBYTECODE=1. H4_VALIDATE_BASE=2b3589a76848631513fb000b4d252a3f2a326a43 selects the recorded publication/control projection. Run python3 verify.py. All repository reads come from immutable git blobs and candidate overlays in memory; no checkout, snapshot, application file or data file is written. Reproduce source hashes independently; resource/timing diagnostics vary across machines.

Loader SHA-256: aaf9b08ff01ac1c2c3185758716f2ef65ed9980462410050bd132e296bedc037.

```python
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
BASE = os.environ.get('H4_VALIDATE_BASE', 'f6de888f4ad723d376d77b66fa8486d538bd1aeb')
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
```

Validator SHA-256: 51aa6265257b77a973a3ba8e8b936557f63d6857c6970c26d49b609e7aed37c9.

```python
"""Actual immutable checker/intake/assembly; no repository snapshot or mutation."""
from pathlib import Path
import os,sys,json,re,ast,hashlib,collections,copy,subprocess
import immutable_view as gv
HERE=Path(__file__).resolve().parent
RID="HodgeStructuresPartII";STEM=RID
FILES={"research/blueprint/packets/"+STEM+".json":"packet.json",
 "research/blueprint/readmes/"+STEM+".md":"reader.md",
 "research/blueprint/suggested/"+STEM+".lean":STEM+".lean",
 "research/blueprint/handoff/DESIGN-"+STEM+".md":"handoff.md",
 "research/blueprint/roadmaps/"+STEM+".json":"roadmap.json"}
original=json.loads(gv.blob(next(iter(FILES))))
oldreader=gv.blob("research/blueprint/readmes/"+STEM+".md").decode()
oldlean=gv.blob("research/blueprint/suggested/"+STEM+".lean").decode()
for dst,name in FILES.items():gv.CACHE[dst]=(HERE/name).read_bytes()
gv.install()
import check_blueprint
errors,warnings,summary=check_blueprint.check(gv.REPO/next(iter(FILES)),
 check_blueprint.load_index(Path(os.environ["TAUCETI_BASELINE"])),check_blueprint.world())
print(json.dumps({"checker":summary,"errors":errors,"warnings":warnings}),flush=True)
assert not errors and not warnings,(errors,warnings)
p=json.loads((HERE/"packet.json").read_text());reader=(HERE/"reader.md").read_text()
lean=(HERE/(STEM+".lean")).read_text()
old={n["id"]:n for n in original["nodes"]};new={n["id"]:n for n in p["nodes"]}

assert len(old)==112 and len(new)==120 and set(old)<=set(new)
it=RID+":H.0/affine-ordered-iterate"
assert all(new[nid]==n for nid,n in old.items() if nid!=it)
for key,value in old[it].items():
 if key in {"api","tests","uses"}:assert new[it][key][:len(value)]==value,key
 else:assert new[it][key]==value,key
for key in original:
 if key not in {"summary","sources","nodes","baseline","coverage","gaps","verification"}:
  assert p[key]==original[key],key
assert p["verification"]["previousCheckpoint"]==original["verification"]
assert p["sources"][:-1]==original["sources"]
assert p["baseline"]["declarations"][:135]==original["baseline"]["declarations"]
assert len(p["baseline"]["declarations"])==139
assert p["gaps"][:-1]==original["gaps"][:-1] and len(p["gaps"])==11
assert p["gaps"][-1]["detail"].startswith(original["gaps"][-1]["detail"])
assert p["coverage"][1:]==original["coverage"][1:]
assert p["coverage"][0]["status"]==original["coverage"][0]["status"]=="partial"
assert p["coverage"][0]["remaining"][:-1]==original["coverage"][0]["remaining"]
assert p["status"]=="partial" and all(n["implementationStatus"]=="unchecked" for n in new.values())
assert new[RID+":key/higgs-parameter-connections"]==old[RID+":key/higgs-parameter-connections"]
assert reader.startswith(oldreader)
assert lean.startswith(oldlean)
roadmap=json.loads((HERE/"roadmap.json").read_text())
oldroadmap=json.loads(subprocess.check_output(["git","show",gv.BASE+":research/blueprint/roadmaps/"+RID+".json"],cwd=gv.REPO))
assert {k:v for k,v in roadmap.items() if k!="summary"}=={k:v for k,v in oldroadmap.items() if k!="summary"}
for nid,node in new.items():
 if nid in old:continue
 assert node["statement"] in reader and node["declaration"] in reader,nid
 assert node["declaration"].removeprefix("TwistedHiggsBundle.") in lean,nid
 for api in node.get("api",[]):
  assert api["name"] in reader and api["statement"] in reader,api
  assert api["name"].removeprefix("TwistedHiggsBundle.") in lean,api
 for test in node.get("tests",[]):
  assert test["name"] in lean and test["statement"] in reader,test
tree=ast.parse(gv.blob("research/blueprint/intake.py").decode())
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {"ALLOWED","PRIVATE"} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=="file_problems"]
env={"json":json,"re":re};exec(compile(ast.Module(body=picked,type_ignores=[]),"actual-intake","exec"),env)
problems=[v for dst,name in FILES.items() for v in env["file_problems"](dst,(HERE/name).read_text())]
assert not problems,problems
for name in FILES.values():
 text=(HERE/name).read_text()
 assert not re.search(r"[ \t]+$",text,re.M),name
 assert not re.search(r"/(?:home|Users)/[^/\s]+/",text),name
native=(HERE/"Native.lean").read_text()
log=(HERE/"native.log").read_text();clog=(HERE/"canonical.log").read_text()
assert log.count("depends on axioms:")==30 and not re.search(r"error|warning|sorryAx",log)
assert "Exit status: 0" in log
assert "error" not in clog and clog.count("warning:")==clog.count("warning: declaration uses")==260
assert "Exit status: 0" in clog
assert len(re.findall(r"^example\b",native,re.M))==25
assert len(re.findall(r"^example\b",lean,re.M))==109
assert not re.search(r"\bsorry\b",native)
print(json.dumps({"preservedWholeNodeObjects":111,"incomingContracts":112,"newNodes":8,
 "api":sum(len(n.get("api",[])) for n in p["nodes"]),
 "tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"intake":"pass"}),flush=True)

import build,blueprints
root=gv.REPO
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
definitions=[d for d in definitions if d["id"]!=RID]
if not any(r["id"]==RID for r in a0["roadmaps"]):definitions.append(roadmap)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
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
assert not missingpairs,sorted(missingpairs)
assert len(pairs)==7,(len(pairs),pairs)
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

Current codex-a71f92 checkpoint supplies actual native arbitrary-Q affine cross-ring unit/prepend/step/iterate equations and all-degree same-exponent preservation and faithfully-flat reflection, including n=0; earlier affine missing-work wording above is retained as checkpoint history. Finite-projective chart restriction, sheaf tensor-power comparison/equality detection/gluing, exterior-integrability transport, globally uniform versus locally varying exponents, rank bounds and all global/source/supplier obligations remain open. This does not identify sheaf tensor sections with tensors of global sections or assert kernel/image base-change compatibility.

The next concrete step is finite-projective chart restriction and the actual E1 sheaf tensor-power comparison, equality detection and gluing. The arbitrary-Q affine cross-ring leg no longer requires a basis. Combine it with the existing arbitrary coefficient-map leg only through actual restriction/coherence maps. Keep a globally specified exponent distinct from merely locally varying nilpotence exponents, and do not identify sheaf tensor sections with tensors of global sections.

Still discharge the named CR.1/E1/DD.1/D3 suppliers, global determinant/exterior and Tate/period-lattice adapters and H.1–H.8 source decompositions. Do not rebuild native sheaf carriers, the parent Hodge theory or the imported Coleman Jacobi theorem. Exterior integrability, nilpotence kernels, image algebras and rank bounds are distinct obligations.

The own scratch directory is recoverably removed after the PR is opened. Public proof history, exact hashes and these complete scripts preserve the checkpoint. Opening the PR ends the claim; take the next suitable issue in WORKERS order, without manually unclaiming submitted work.

---

## Complete predecessor handoff, preserved verbatim

# Hodge Part II: scalar-extension coherence checkpoint — #3371

Codex — codex-J6LwjP, 2 October 2026. Read base 9f4ec81d1839ece8d10129830133db03a6d5d430. Claim [5962082384](https://github.com/CBirkbeck/tauceti-explorer/issues/3371#issuecomment-5962082384), winning bot [5962084436](https://github.com/CBirkbeck/tauceti-explorer/issues/3371#issuecomment-5962084436). The full issue was read before and after confirmation. Partial checkpoint: no stage, source route or reserved key is closed; every node remains unchecked.

## Delivered mathematics and boundaries

Five lemma nodes extend the existing canonical affine scalar-extension field. Horizontal module/coefficient maps remain horizontal after scalar extension; coefficient postcomposition commutes with this field construction for arbitrary u. Applying existing ordered naturality over the receiving ring S gives an equation in every degree, including zero. No basis, finite generation, integrability or flatness is required for these equations.

For a faithfully flat R-algebra S, θ_S=0 iff θ=0 even for arbitrary, nonflat E and Q. The proof evaluates on 1⊗e, uses the native tensor distributor's injectivity, then faithful-flat detection on the actual module E⊗_R Q. Native singleton tensor-power equivalences give reflection of degree-one iterate vanishing. This checkpoint does not prove the cross-ring ordered tensor-power comparison in arbitrary degree. It retains the earlier finite-coefficient-basis all-degree contracts unchanged.

Seven new examples check a zero coefficient map from ℤ/2 to ℤ/3, torsion coefficients, a nonzero tensor-unit field on a torsion source, degree-one reflection with both source and coefficients ℤ/2, receiving-ring horizontal restricted vanishing, degree-zero naturality without horizontality, and a nonzero field e↦2e⊗1 erased by scalar extension to ℤ/2. The latter algebra is not asserted flat. Restricted vanishing is never replaced by vanishing on the whole target module. All nine inherited native examples are rerun.

All 107 inherited node contracts, including hypotheses, prerequisites, sources, acceptance and proof routes, remain. Only the existing affine-base-change construction gains five APIs, uses and seven tests; 106 complete inherited node objects are unchanged. All old API/test/use prefixes, 149 routed obligations in eight route records, five requests, eleven gaps, source findings and the 35 global signature omissions remain. All nine stage definitions/dependencies are equal to the base; only the roadmap summary changes.

Totals: 112 nodes (12 definitions, 24 constructions, 57 lemmas, 14 theorems, five comparisons), 147 API items, 139 required definition/construction tests, 141 total tests, 135 baseline declarations and six H.0 planets. H.0 partial; H.1–H.8 not_read; zero closed stages.

## Exact proof and submitted-sketch receipts

The [native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/9f179c941d3686eacb96322f20831efef6c2c78c/research/blueprint/suggested/HodgeStructuresPartII.lean) is stored as a comment in an immutable ancestor commit. Extract it without relying on a local Git object, which may be absent after squash merging:

```python
from urllib.request import urlopen
from pathlib import Path
import hashlib
url = 'https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/9f179c941d3686eacb96322f20831efef6c2c78c/research/blueprint/suggested/HodgeStructuresPartII.lean'
text = urlopen(url).read().decode()
proof = text.split('BEGIN ARCHIVED CHECKED HIGGS SCALAR COHERENCE\n', 1)[1].split(
    'END ARCHIVED CHECKED HIGGS SCALAR COHERENCE', 1)[0]
assert hashlib.sha256(proof.encode()).hexdigest() == '6a23f25f4d8709db044e950a9097754d114071dd5d08b9d000cb34a2c3194fb2'
Path('BaseChange.lean').write_text(proof)
```

Elaborate that exact source only in an already existing pinned Mathlib build. It has 692 lines, 16 examples and 20 named axiom audits; zero errors, admissions or warnings. Only propext, Classical.choice and Quot.sound occur. Source SHA-256 6a23f25f4d8709db044e950a9097754d114071dd5d08b9d000cb34a2c3194fb2; normalized diagnostics SHA-256 04e4ea88b83bf274cf6f8d4b8fba11d1a5f412cc1cd2547499790a49d4c0faec. Runtime 3.80 seconds, peak RSS 2470292 KiB, 56 GiB available beforehand. The two added imports precede the byte-identical 517-line [predecessor actual proof](https://github.com/CBirkbeck/tauceti-explorer/blob/d94ef3bb3b47d21b8308c595f6e23055cd390a3a/research/blueprint/suggested/HodgeStructuresPartII.lean), recovered source SHA-256 b1335d49069b99337ff05089cbfc8658ab2bb0da4e32dd5cedfb64d2d0ad04dc. The new canonical scalar-extension definition is the actual native composition, not an assumed carrier or transport theorem.

The final submitted file has admitted planning bodies under PROTOCOL §13. Its exact SHA-256 is f31c12d0f3c4789c298fb9c1616f48aab96d02a659b2a088a28550ec0356c621; normalized diagnostics SHA-256 6fc6e0157deded986d6fdae3f22d82a634405a121ad1f79014a82860730b0900. All 1632 lines elaborate, with 100 examples, zero errors, 240 admitted-declaration warnings and zero other warnings. Runtime 5.20 seconds, peak RSS 2979404 KiB, 56 GiB available. Lean 4.34.0-rc2, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. This is a complete Mathlib-only file check; it certifies no Tau Ceti import set. Normalize the absolute source path to suggested/BaseChange.lean or suggested/HodgeStructuresPartII.lean respectively and omit the final timing line before hashing diagnostics.

The inherited 1552-line submitted prefix is byte-identical to the read base. All five new declaration headers and seven example types match the actual checked source. The canonical field definition's signature also matches its inherited sketch. The proof archive is separate historical evidence; the final suggested file contains no new proof bodies.

## Structural checks and reproduction

Indexed check_blueprint: zero errors and warnings. Five-file intake: zero problems. The actual read-only assembler with candidate injection gives stage graph 3022 vertices/8663 edges, own prerequisite graph 112/207 and combined stage/reachable prerequisite graph 3129/8908, all acyclic. There are 113 reachable declarations and 51 existing virtual supplier stage endpoints. All references resolve to a native library declaration or an existing declaration/stage plan; resolution is not implementation or closure of the suppliers.

All seven required supplier stage pairs have paths: five are direct, while D3→H.3 and D3→H.8 run through H.2 (the latter chosen path also passes H.3). These are explicitly transitive dependencies, not new direct links. No own skipped/pending links occur; stage edges and other roadmaps' skipped/pending links equal the predecessor control. No site output is written.

Save the following script in scratch, run it from the repository root with the original packet from read base 9f4ec81d1839ece8d10129830133db03a6d5d430 as its first argument. It uses the real assembler and checks prerequisite graphs and all supplier paths. The [read-base packet](https://github.com/CBirkbeck/tauceti-explorer/blob/9f4ec81d1839ece8d10129830133db03a6d5d430/research/blueprint/packets/HodgeStructuresPartII.json) and [predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/9f4ec81d1839ece8d10129830133db03a6d5d430/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md) retain every earlier proof/source receipt and continuation lead.

```python
"""Read-only actual atlas assembly with the candidate injected as promotion inputs."""
from pathlib import Path
import sys,json,copy,collections
root=Path.cwd();sys.path.insert(0,str(root/'scripts'))
import build,blueprints,check_blueprint
rid='HodgeStructuresPartII'
p=json.loads((root/'research/blueprint/packets'/f'{rid}.json').read_text())
r=json.loads((root/'research/blueprint/roadmaps'/f'{rid}.json').read_text())
a0=json.loads((root/'data/atlas.json').read_text())
packets,documents,definitions=blueprints.load_promoted(root)
packets=[x for x in packets if x[1].get('roadmapId')!=rid]+[(rid,p)]
documents[rid]=f'research/blueprint/readmes/{rid}.md'
definitions=[x for x in definitions if x['id']!=rid]
if not any(x['id']==rid for x in a0['roadmaps']):definitions.append(r)
build.load_promoted=lambda *args:(copy.deepcopy(packets),copy.deepcopy(documents),copy.deepcopy(definitions))
a,*rest=build.assemble(require_distances=False)
ctx=check_blueprint.world()
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in sorted((root/folder).glob('*.json')):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):world.setdefault(n['id'],n)
world.update({n['id']:n for n in p['nodes']})
stages={s['id']:s for s in a['stages']}
stageids=set(stages)|set(ctx[1])
stageedges={(e['source'],e['target']) for e in a['stageEdges']}
virtual={v for e in stageedges for v in e}-set(stages)

def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in out[s]:out[s].add(t);indeg[t]+=1
 stack=[v for v,k in indeg.items() if k==0];count=0
 while stack:
  x=stack.pop();count+=1
  for y in out[x]:
   indeg[y]-=1
   if indeg[y]==0:stack.append(y)
 assert count==len(vertices),f'cycle: {[v for v,k in indeg.items() if k][:15]}'
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}

own={n['id']:n for n in p['nodes']}
ownedges={(q,n['id']) for n in p['nodes'] for q in n.get('prerequisites',[]) if q in own}
stack=list(own);seen=set();dep=set();unresolved=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 n=world[nid]
 for q in n.get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:')) and q not in stageids:continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
report={'stage':dag(stages,stageedges),'own':dag(own,ownedges),'combinedPrerequisites':dag(set(stages)|seen,stageedges|dep),'virtualSupplierEndpoints':len(virtual),'reachableDeclarations':len(seen),'unresolvedReferences':len(unresolved)}
roadmap=next(x for x in a['roadmaps'] if x['id']==rid)
assert roadmap['blueprint']['declarations']==len(own)
assert roadmap['blueprint']['planets']==6
assert not roadmap['blueprint']['skippedLinks'],roadmap['blueprint']['skippedLinks']
assert not roadmap['pendingLinks'],roadmap['pendingLinks']
report['actualBlueprint']={k:roadmap['blueprint'][k] for k in ['declarations','planets','kinds','skippedLinks']}
# The original packet is used as a second promotion input to check projection preservation.
p0=json.loads(sys.argv[1] and Path(sys.argv[1]).read_text()) if len(sys.argv)>1 else p
r0=copy.deepcopy(r)
basepackets=[x for x in packets if x[1].get('roadmapId')!=rid]+[(rid,p0)]
build.load_promoted=lambda *args:(copy.deepcopy(basepackets),copy.deepcopy(documents),copy.deepcopy(definitions))
b,*_=build.assemble(require_distances=False)
bedges={(e['source'],e['target']) for e in b['stageEdges']}
assert stageedges==bedges
report['stageEdgesUnchanged']=True
control={x['id']:(x.get('blueprint',{}).get('skippedLinks',[]),x.get('pendingLinks',[])) for x in a['roadmaps'] if x['id']!=rid}
control0={x['id']:(x.get('blueprint',{}).get('skippedLinks',[]),x.get('pendingLinks',[])) for x in b['roadmaps'] if x['id']!=rid}
assert control==control0
report['otherRoadmapSkippedPendingLinksUnchanged']=True

def owner(ref):
 if ref in own:return own[ref]['parentStageId']
 if ref in world:return world[ref]['parentStageId']
 assert ref in stageids,ref
 return ref
required={(owner(q['supplier']),owner(n)) for q in p['requests'] for n in q['neededBy']}
required|={(owner(q),n['parentStageId']) for n in p['nodes'] for q in n.get('prerequisites',[]) if q in stageids or (q in world and q not in own)}
required={pair for pair in required if pair[0]!=pair[1]}
adj=collections.defaultdict(set)
for a0,b0 in stageedges:adj[a0].add(b0)
paths={}
for a0,b0 in sorted(required):
 queue=collections.deque([(a0,[a0])]);visited={a0}
 while queue:
  x,path=queue.popleft()
  if x==b0:paths[a0+' -> '+b0]=path;break
  for y in sorted(adj[x]):
   if y not in visited:visited.add(y);queue.append((y,path+[y]))
 assert a0+' -> '+b0 in paths,(a0,b0)
report['requiredSupplierStagePairs']={'count':len(required),'allPathsPresent':True,'directPairs':len(required&stageedges),'transitivePaths':{k:v for k,v in paths.items() if len(v)>2},'pairs':sorted(required)}
report['virtualSupplierEndpointsAreStagePlansNotLibraryDeclarations']=True

print(json.dumps(report,ensure_ascii=False,indent=2))
```

All 107 inherited contracts and API/test/use prefixes, JSON validity, exact signatures, proof audits, allowed-path diff and whitespace checks pass. The publication guard confirmed the unchanged live issue body and five main-branch deliverable blobs, plus sixteen instruction/audit/key-definition/source-route inputs. The claim and winning bot are linked above. No private paths or extracted papers are committed. No project/cache/library setup or language server was used. Lean ran one process at a time, each bounded to 20 minutes; no owned background compile remains.

## Reading and continuation

Fresh library reading covers the native scalar-extension definition, ambient semiring/module hypotheses, elementary evaluation, zero/identity/composition laws, tensor-distribution definition and forward/inverse elementary formulas, tensor equivalence and its underlying map, faithfully-flat predicate/self instance and complete unit-tensor zero detection proof. Four newly cited native declarations were checked at the pin and in the declaration index; the 131 inherited citations remain. The reviewed Hodge L0–L3, D3 and E1 audit entries, the reserved key survey and full key node were read. HodgeStructures and SemisimpleAlgebras upstream readers were read earlier in this continuous session for scope/density. Generic tensor/scalar-extension/faithful-flat carriers are reused.

Fresh source scope: [Heuer arXiv v3](https://arxiv.org/html/2307.01303v3), Definition 1.2(1)–(2), selected introduction, complete Theorem 4.8(1)–(3), Remark 4.9 and its displayed proof. Retrieved HTML SHA-256 ec7742d917b413a52d05e5eeffbab9fdaab3bed13412dc2c9e426ffb8bcb8081. The local scalar-extension formula and morphism functoriality motivate the authored affine deductions. This is no certification of analytic chart independence, the full paper or the 149-item inventory. Existing wider readings/source findings remain historical; no new source error is asserted.

Resume with the actual arbitrary-Q cross-ring tensor-power unit/prepend distributor equations and the comparison between scalar extension of I_n(θ) and I_n(θ_S) in all degrees. Prove preservation under arbitrary S and reflection under faithful flatness using that comparison. Do not infer these from receiving-ring naturality or degree-one reflection. Then supply finite-projective chart restriction and E1 sheaf tensor-power comparison, equality detection and gluing. Keep a specified global exponent distinct from locally varying bounds; never identify a sheaf tensor with tensor products of global sections.

Continue all inherited CR.1 ordinary/exterior, E1 tensor/dual/exactness/pullback/descent, DD.1 bounded Rees and D3 common variation supplier contracts. Global determinant/exterior comparison, Tate coefficient equivariance, unbounded Liu–Zhu period-lattice adaptation, rank bounds and all binding paper routes remain. Retain both split reflection for nonflat E and flat-injection reflection, along with exterior-integrability/ordered-nilpotence/symmetrized-vanishing counterexamples. The finite Griffiths carrier does not replace the unbounded period filtration.
