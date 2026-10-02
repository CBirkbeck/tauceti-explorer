# BP-DeformationAndDerivedPatchingAlgebra--P7 — finite algebraic variable-ideal powers

Partial checkpoint by Codex — codex-a71f92, 2026-10-02. Refs #551.
Winning claim `5962351728`; bot confirmation `5962353339`.
Whole issue read before and after confirmation. Mathematical input:
`a6094bd6d7c7856944d7cf3b905c7e9bf11d90fd`; publication base:
`099cf06f3b3c49aa0cb075268da13d97b3dc300e`. The four incoming deliverables, governing
WORKERS/PROTOCOL/expansion protocol/upstream guide, scoped roadmap record,
accepted RS-08 ownership, reviewed library audit and other promoted part
were checked unchanged between these bases. Shared checkout was not edited,
checked out or committed. Publication uses GitHub Git-object/branch/PR APIs.

## What changed and what is deliberately not claimed

Three declaration-sized lemmas make the existing native ideal-power/order
comparison explicit: monomial membership in the algebraic variable-ideal
power of its total degree; the forward order lower bound, even with infinite
variables; and finite degree-r monomial factorization for a finite variable
set and any commutative coefficient ring. They assemble the existing
`mem_variableIdeal_pow_iff`. There is no new series/exponent/ideal carrier,
order definition or public selector. Native
`Finsupp.exists_le_degree_eq` already supplies the sub-exponent selection;
native `finite_of_degree_eq` supplies the finite fibre.

The actual factorization is g=Σ_(β∈B_r) monomial β 1·h_β, with
h_β(γ)=coeff_(β+γ)(g) if pick(β+γ)=β, and zero otherwise.
A coefficient above the threshold has exactly the pick(α) summand; below
the threshold all summands vanish by native degree monotonicity and
coefficient vanishing. Each degree-r monomial belongs to v^r by finite
support-product induction. The forward proof uses the native constant
coefficient kernel, algebraic product induction and order lower inequalities.
No ideal is assumed closed under an infinite sum, and no product-order
equality/domain premise or order(0).toNat conversion is used.

All 113 incoming statement/hypothesis/acceptance/API/test/use/source contracts
are retained. 112 whole node objects are unchanged. Only the existing iff's
proof/prerequisites are refined, and four boundary tests are added to it;
the three new nodes supply seven other tests. The reserved general finite
Noetherian local-module/ideal-of-definition multiplicity object is unchanged,
not replaced by a curve order. All previous continuation objects,
sources, requests and prior mathematical obligations are retained. R03.3's
remaining-work list and the existing finite-jet gap receive an explicit
dated continuation; no stage is closed.

Counts: 116 nodes (8 definitions, 20 constructions, 72 lemmas, 16 theorems),
117 API items, 103 definition/construction unit tests, 133 total test records,
13 planets, 249 indexed baseline references, 15 gaps, 2 requests, 8 scoped
stages and 0 closed stages. There is no new definition or construction API
whose obligations are hidden inside a lemma.

Canonical suggested bodies remain admitted and every node remains
`unchecked`. The separate prototype passes the kernel without admissions;
this is not canonical library integration, independent acceptance or
completion of the roadmap.

## Actual checks

- Complete native prototype: 217 lines, 4 named lemmas, 11 examples,
  4 axiom audits, zero errors, zero warnings and no admitted proof.
  The audits report only propext, Classical.choice and Quot.sound.
  Boundaries: infinite variables in the forward implication; zero series;
  zero power; degree-zero factorization; empty variables with positive
  power; degree-zero and mixed-total-degree monomials; variable membership
  but not square membership over Z/4; zero coefficient ring ZMod 1;
  and a finite factorization for X_0²+X_1² over Z/4.
- Complete canonical suggested file: 2568 lines, 156 examples, zero errors,
  312 placeholder-proof warnings only. All original imports and statements
  are retained; no Tau Ceti module is imported. Mathlib-only elaboration
  does not certify an unavailable Tau Ceti build.
- Existing Lean 4.34.0-rc2 / Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` build; no setup, update,
  cache fetch, library build or language server. One Lean process at a time,
  54 GiB available before each final compile, timeout 1200 seconds.
  Native: 2.00 s, maximum RSS 3358652 KiB.
  Canonical: 23.51 s, maximum RSS 3542196 KiB.
- The real immutable `scripts/check_blueprint.py` and declaration index:
  zero errors and zero warnings. The real intake `file_problems` for all
  four deliverables: no findings. Exact node preservation and reader/Lean
  correspondence are checked in the public validator below.
- The actual immutable assembler with candidate promotion inputs, retaining
  `DeformationAndDerivedPatchingAlgebra--R03.6`: stage graph 3003 vertices /
  8623 edges; own declaration graph 116 / 176; combined stage and reachable
  prerequisite graph 3107 / 8799; all acyclic. 117 reachable declarations,
  1 external declaration, 220 reachable baseline references, 0 unresolved
  declaration references. Whole roadmap declaration count is 169.
- All 65 accepted restructure dependency pairs touching the roadmap are
  reachable. 12 of 13 scoped dependency/request pairs are reachable; the
  sole missing one is the **unchanged, already-recorded** LocalFieldsRamification
  layer-0 → R03.4 supplier request. It also fails in the original-packet
  control assembly. This is not counted as a successful path and no synthetic
  edge is inserted. The inherited local-field gap/request remains explicit.
  Stage edges are unchanged, own skipped/pending links are empty, and
  other-roadmap skipped/pending links equal the original control.

Fresh read boundaries: all issue text, current handoff, applicable audit
rows, atlas stage descriptions/original edges, accepted scoped RS-08
decisions and relevant current link/restructure records. Selected pinned
native statements/local assumptions are fresh reads, with file hashes in
HS-VARIABLE-IDEAL-PIN. DDPA-JET-HANDOFF section 3's first finite-sum paragraph
is freshly read, not a new full-source read. Historical whole handoff reads,
ChatGPT/Codex predecessor credits, computational regression hashes and
proof archives remain attributed. The 36,686-case predecessor regression is
not rerun or used as a proof of infinite formal-series assertions.

## Durable public proof archive and exact byte recovery

Archive commit: [`596ea8e0e75ec76e52e256b941f75aec05a9cc09`](https://github.com/CBirkbeck/tauceti-explorer/commit/596ea8e0e75ec76e52e256b941f75aec05a9cc09).
Only the issue's allowed suggested path carries the checked prototype,
inside a nested comment. Its first parent is the publication base above;
its additional parent is the predecessor principal-quotient archive
`4c5fd9654e1f835ffdbc7f184c4a6409d0a3216b`. The submitted commit has main
as first parent and this archive as an additional parent, so the checked
prototype survives scratch cleanup without publishing a fifth path.

Native SHA-256: `7fe19f09fe60d201a6caa91ae3bc7e71cdae708045b3e7bf6d4acafc2d99c57a`.
Native normalized diagnostic SHA-256:
`b1ce992f450e508142c6dc44d0e83f513b3b518a63028bfe3faedf10d32b8d6a`.
Canonical SHA-256: `fbed696b48dd96b8c75e84c095269b7f6a0c874cbd22d835aa341e0d78b12a76`.
Canonical normalized diagnostic SHA-256:
`a0c5c2bbd83e40c02e22e9f5b1ec8cc12fc589daa8d79a071f6b31b477e61255`.
Normalization takes output before the time utility's “Command being timed”
line and replaces the compiled absolute filename by `<lean-file>`; timing
and machine-local file paths are not part of the normalized diagnostics.

Reuse one existing atlas clone; fetch the public submitted/archived commit
read-only if needed. Create one own disk scratch directory with `mktemp -d`,
under 1 GB. Save this recovery script as `recover.py` there and run
`python3 recover.py "$task_dir"` from the existing clone:

```python
from pathlib import Path
import hashlib,subprocess,sys
out=Path(sys.argv[1]);assert out.is_dir()
proof="596ea8e0e75ec76e52e256b941f75aec05a9cc09"
path="research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean"
archive=subprocess.check_output(["git","show",proof+":"+path],text=True)
canonical,nested=archive.split("\n/- BEGIN ARCHIVED CHECKED VARIABLE IDEAL POWER\n",1)
native=nested.split("END ARCHIVED CHECKED VARIABLE IDEAL POWER -/\n",1)[0]
assert hashlib.sha256(native.encode()).hexdigest()=="7fe19f09fe60d201a6caa91ae3bc7e71cdae708045b3e7bf6d4acafc2d99c57a"
assert hashlib.sha256(canonical.encode()).hexdigest()=="fbed696b48dd96b8c75e84c095269b7f6a0c874cbd22d835aa341e0d78b12a76"
(out/"Native.lean").write_text(native)
(out/"DeformationAndDerivedPatchingAlgebra--P7.lean").write_text(canonical)
```

Before each compile check `free -g`; with less than 20 GiB available do not
compile. From an existing build at the exact pins, run sequentially
`/usr/bin/time -v timeout 1200 lake env lean "$task_dir/Native.lean"`
and the corresponding command for
`"$task_dir/DeformationAndDerivedPatchingAlgebra--P7.lean"`, capturing combined output as `native.log`
and `canonical.log`. Never set up/build a library or start a second Lean
process. Recovery above was actually performed against the public archive;
both recovered byte strings exactly match the checked sources.

## Read-only actual checker/intake/graph reproduction

Copy the four submitted deliverable bodies into the same scratch directory
as `packet.json`, `reader.md`, `DeformationAndDerivedPatchingAlgebra--P7.lean` and `handoff.md`.
Save the two exact scripts below as `immutable_view.py` and `verify.py`.
The loader reads the specified existing clone's immutable tree via read-only
Git queries, caches bytes only in process memory, and rejects writes under
that clone. It creates no repository snapshot, fake atlas, reconstructed
supplier or synthetic realises edge. The checker, intake function and
assembler are the real source code at the stated immutable base.

Run from the existing atlas clone with `TAUCETI_REPO` pointing to it,
`TAUCETI_BASELINE` pointing to the exact pinned declaration index, and
`P8_VALIDATE_BASE` set first to the mathematical base and then to
`099cf06f3b3c49aa0cb075268da13d97b3dc300e`:

`python3 "$task_dir/verify.py"`

The logs must show no checker/intake errors, the four axiom audits and
expected compiler warnings, 112 unchanged whole node objects, all acyclic
graphs, the retained other part and the same one inherited missing supplier
path. The validator deliberately does not assert that this missing path
has been supplied.

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
```

```python
"""Actual immutable checker/intake/assembly; no repository snapshot or mutation."""
from pathlib import Path
import os,sys,json,re,ast,hashlib,collections,copy,subprocess
import immutable_view as gv
HERE=Path(__file__).resolve().parent
RID="DeformationAndDerivedPatchingAlgebra";STEM=RID+"--P7"
FILES={"research/blueprint/packets/"+STEM+".json":"packet.json",
 "research/blueprint/readmes/"+STEM+".md":"reader.md",
 "research/blueprint/suggested/"+STEM+".lean":STEM+".lean",
 "research/blueprint/handoff/BP-"+STEM+".md":"handoff.md"}
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
iff=RID+":R03.3/variable-ideal-power-order"
assert len(old)==113 and len(new)==116 and set(old)<=set(new)
assert all(new[nid]==n for nid,n in old.items() if nid!=iff)
for key,value in old[iff].items():
 if key not in {"proofSteps","prerequisites"}:assert new[iff][key]==value,key
assert len(new[iff]["tests"])==4
for key in original:
 if key not in {"summary","sources","nodes","baseline","coverage","gaps"}:
  assert p[key]==original[key],key
assert p["sources"][:-1]==original["sources"]
assert p["baseline"]["declarations"][:233]==original["baseline"]["declarations"]
assert len(p["baseline"]["declarations"])==249
assert p["gaps"][:-1]==original["gaps"][:-1] and len(p["gaps"])==15
assert p["gaps"][-1]["detail"].startswith(original["gaps"][-1]["detail"])
for row,row0 in zip(p["coverage"],original["coverage"]):
 if row["stageId"]!=RID+":R03.3":assert row==row0
 else:
  assert row["status"]==row0["status"]
  assert row["remaining"][:-1]==row0["remaining"]
assert p["status"]=="partial" and all(n["implementationStatus"]=="unchecked" for n in new.values())
assert new[RID+":key/hilbert-samuel-multiplicity"]==old[RID+":key/hilbert-samuel-multiplicity"]
assert reader.startswith(oldreader)
for nid,node in new.items():
 if nid in old and nid!=iff:continue
 assert node["statement"] in reader and node["declaration"] in reader,nid
 assert node["declaration"].removeprefix("TauCeti.HilbertSamuel.") in lean,nid
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
assert log.count("depends on axioms:")==4 and not re.search(r"error|warning|sorryAx",log)
assert "Exit status: 0" in log
assert "error" not in clog and clog.count("warning:")==clog.count("warning: declaration uses")==312
assert "Exit status: 0" in clog
assert len(re.findall(r"^example\b",native,re.M))==11
assert len(re.findall(r"^example\b",lean,re.M))==156
assert not re.search(r"\bsorry\b",native)
print(json.dumps({"preservedWholeNodeObjects":112,"incomingContracts":113,"newNodes":3,
 "api":sum(len(n.get("api",[])) for n in p["nodes"]),
 "tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"intake":"pass"}),flush=True)

import build,blueprints
root=gv.REPO
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

The exact total-jet coefficient map still needs its kernel, quotient
equivalence, monomial basis and two-variable count implemented. The
algebraic kernel argument can now directly use the checked ideal-power/order
prototype; canonical signatures remain admitted. Prove shifted series
injectivity using exact finite order and the appropriate domain/no-zero-divisors
hypothesis; combine it with the predecessor's actual principal multiplication,
projection and range–kernel maps. Then derive every-index curve lengths,
the tangent-cone kernel, curve dimension and the intrinsic/ambient
multiplicity comparison. None is discharged by the present four lemmas.

Keep the general Hilbert–Serre induction, degree/dimension comparison,
Artin–Rees, finite top-dimensional localization and associativity,
completion, parameter-ideal/regular-local comparisons, all P7/P8/P9 and
R03.1–R03.5 stage targets, and every routed-paper obligation open.
The existing local-field path issue belongs to its supplier/owner reconciliation;
do not silently remove it or substitute a different upstream stage.

The previous principal-quotient handoff remains available in the immutable
incoming tree at
[the mathematical base](https://github.com/CBirkbeck/tauceti-explorer/blob/a6094bd6d7c7856944d7cf3b905c7e9bf11d90fd/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md),
with exact public predecessor proof archive `4c5fd9654e1f835ffdbc7f184c4a6409d0a3216b`.
No checkpoint is discarded, and no predecessor regression is described as fresh.
