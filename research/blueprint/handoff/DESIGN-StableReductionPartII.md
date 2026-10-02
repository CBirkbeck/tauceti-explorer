# DESIGN-StableReductionPartII — native coefficient naturality checkpoint

Worker: Codex — codex-a71f92. Refs #3342. Date: 2026-10-02.
Claim5960605692; bot confirmation5960608395. Complete issue read before
claiming and reread after our claim won. Audit basef31661fb8ff057ec4c899e8e22229c295f2b4e6a;
publication preflightb6ab1401f211d799af99125d5370869d9fc95754.

## Result and exact boundary

Partial checkpoint: three new consumed MC.2 nodes, nine additional API items
and six tests. Total136 nodes:8 definitions,36 constructions,29 lemmas,
62 theorems and1 application;159 API items;145 definition/construction tests
plus2 inherited exactness tests;35 planets;78 baseline declarations;
135 supplier requests and14 gaps. All133 inherited statements are preserved;
130 whole old node objects are identical. The roadmap definition is unchanged.
All eight stages remain partial and implementation statuses remain unchecked.
The reserved moduli-curves node, its six consumers and distinctions between
stacks, coarse spaces and fine covers remain required, not completed.

The actual untruncated native quotient is R=AdjoinRoot(F), where
F=X²+C(γY)X+C(δY²−q(s,t)); retain c=u−ιs,d=v−ιt,
b=u+ιs+ιγ·ιt,a=ιδv+ιδ·ιt+ιγu, J=(c,d)=ker(ev),
the existing p(r)=r−ιev(r), ε with dε(j)=bj and K=ε∘p.
For any unital ring map f:A→A′ between arbitrary commutative rings, the
native AdjoinRoot coefficient map φ:R→R′ restricts to the actual semilinear
map ψ:J→J′. Its ring value is φ(j), ordered generators map correctly, and
identity, composition and φ-semilinearity hold on actual ideal elements.

The three new node suffixes are section-ideal-coefficient-map,
section-projection-coefficient-naturality and
section-dual-generator-coefficient-naturality. They prove
ψ(p(r))=p′(φ(r)), φ(ε(j))=ε′(ψ(j)) and consequently
φ(K(r))=K′(φ(r)). The existing arbitrary characterized-correction naturality
statement is also proved. Map the defining equations and cancel the target
regular coordinate d′; never cancel φ or assume flatness or injectivity.
This is pointwise naturality, not an equivalence of the whole dual modules.

Six checked native examples cover ideal-map identity, the two ordered
generators, an actual nonzero j=2d killed by ℤ→ℤ/2, correction identity,
correction on actual ideal elements, and K(u)=−u mapping to u′ in
characteristic two. The nonflat fixture uses the genuine untruncated quotient
and native d-regularity, not a finite approximation or substituted carrier.

## Fresh reading and attribution

Full WORKERS and issue read; the binding blueprint/expansion protocols and
upstream guide are unchanged from their full reads in this ongoing loop.
All133 inherited statements, the complete latest handoff, eight own stage
descriptions, reserved moduli-curves entry and six consumer requirements were
read. No own PartII reviewed audit row was found. Parent StableReduction
AUDIT02 layers1 and3 were fully read with evidence and duplication flags.
The full905-line StableReduction upstream document was freshly read;
the full JacobianChallenge document was read earlier in this continuing
session, not reread for this claim.

All nineteen Yuan and two DGH owner-route briefs/items were freshly read;
no new whole-paper reading is attributed. No tracked blueprint link JSON
mentions this roadmap at the audit base. All135 requests,14 gaps, source
issues/versions, restructuring and consumer/key records remain unchanged.
All old baseline entries and source records are retained with their original
attribution. Existing earlier geometric conclusions are not freshly certified.

Knudsen, arXiv:1106.1588v2, Introduction base-change requirement and complete
§3 Key Example through Proposition3.1 and Corollary3.2 proofs were read in
parsed primary HTML: https://arxiv.org/html/1106.1588v2 .
The published noetherian/unit-discriminant hypotheses are retained.
Arbitrary-ring coefficient naturality here is an authored checked algebraic
deduction, not a broader geometric or relative stable-reflexivity theorem.
No fresh Ile paper, whole-paper, screenshot, PDF hash, Bourbaki or Eisenbud
proof audit is claimed. Historical inventories below stay attributed.

At exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 the full ambient
AdjoinRoot.map statements and semilinear LinearMap statements were read.
The one additional baseline declaration is LinearMap.map_smulₛₗ,
Mathlib/Algebra/Module/LinearMap/Defs.lean:335. At exact TauCeti
f790474821cf4256814db967cb154e7af3d0c369 the complete
TauCeti/RingTheory/AdjoinRoot/Factors.lean was read: its field/squarefree
CRT-factor direction does not supply these arbitrary-ring section maps.
Focused indexed/source searches found no canonical-section implementation;
this is not a full-library absence claim. No library is rebuilt.

## Actual verification receipts

The exact1692-line complete submitted suggested file elaborates:
exit0, zero errors,204 admitted-proof warnings only,84 examples.
Lean4.34.0-rc2, existing exact pinned Mathlib artifacts,15.02seconds,
peakRSS2,969,648KiB,62GiB available before the single compile.
No setup, cache, library build or language server. The whole file, not a
pruned import subset, was checked. Its admitted bodies do not prove its plan.

The separate798-line native proof source elaborates: exit0, zero errors and
warnings,22 examples and51 axiom audits,7.65seconds,
peakRSS2,924,688KiB,62GiB available. All axiom dependencies lie within
propext, Classical.choice and Quot.sound; no admitted-proof dependency.
The prior539-line generator/projection proof bodies remain unchanged;
only a separating blank line changes before their audit commands.
All16 inherited examples and34 inherited audits were rerun as dependencies.
Seventeen current declarations are audited. The eleven added admitted
signatures and six example statements were mechanically extracted from
the passing native source and match the submitted block exactly.

- Native source SHA-256: dbf4374d619b337b19727079fa52f712582a2e8dc921d0dd027b820f3c0a9ff8
- Native normalized diagnostics SHA-256: 16f25d053f18d6afd6795a2f93c7faad3a8fce5d203d6e1d72aa709eefe58a33
- Complete suggested source SHA-256: b0e65a36e73f3882a9f6eb257a48f3269361ccc297dbe7a46f31fe4e8aa097c7
- Complete normalized diagnostics SHA-256: a52f6ced6ef06b9fcd9aa6de077c1d238cb5f59f114d832b042b6aa1f2f5b4db

For diagnostic hashing, replace the absolute invocation filename by
Native.lean for native output, or by
research/blueprint/suggested/StableReductionPartII.lean for sketch output;
omit the RESOURCE timing footer and keep the final newline.

Indexed checker: zero errors/warnings. Actual intake file checks pass.
Read-only actual atlas assembly injects the candidate before decomposition
trimming and retains all other promoted inputs. The original and candidate
have identical8,750 stage edges across2,999 stages. The own136/317
declaration graph and scoped3,151/9,317 stage/declaration/request graph are
acyclic. All81 required supplier-stage paths are reachable. No own pending
or skipped links; unrelated skips are unchanged. This is scoped dependency
validation, not an audit of unrelated mathematics. Fresh-main rerun gives
the same counts. Allowed-path, private-path, trailing-whitespace, baseline,
reader/API/test and preservation checks pass.

## Durable proof recovery

The exact current native source and exact submitted sketch are archived in
the allowed suggested path at immutable commit29e68bdcb7165310e94bcdb11882d057685efa13:

https://github.com/CBirkbeck/tauceti-explorer/blob/29e68bdcb7165310e94bcdb11882d057685efa13/research/blueprint/suggested/StableReductionPartII.lean

The current archive retains prior archive5e2a9a9380351b0dfa9dfd19e384be86d7b3a5d8
as an additional parent. The submission commit retains the current archive
as an additional parent, with fresh main as first parent. All actual proof
bodies survive scratch cleanup in reachable repository history.

This extraction returns the exact strings without writing any file.
It was executed against both the GitHub file and the fetched immutable blob,
and both native and sketch byte parity were checked.

```python
import hashlib, subprocess
archive = "29e68bdcb7165310e94bcdb11882d057685efa13"
path = "research/blueprint/suggested/StableReductionPartII.lean"
blob = subprocess.check_output(["git", "show", archive + ":" + path], text=True)
native = blob.split("BEGIN ARCHIVED CHECKED COEFFICIENT NATURALITY\n", 1)[1]
native = native.split("END ARCHIVED CHECKED COEFFICIENT NATURALITY\n", 1)[0]
sketch = blob.split("\n/-\nBEGIN ARCHIVED CHECKED COEFFICIENT NATURALITY\n", 1)[0]
assert hashlib.sha256(native.encode()).hexdigest() == "dbf4374d619b337b19727079fa52f712582a2e8dc921d0dd027b820f3c0a9ff8"
assert hashlib.sha256(sketch.encode()).hexdigest() == "b0e65a36e73f3882a9f6eb257a48f3269361ccc297dbe7a46f31fe4e8aa097c7"
```

To recompile, place the returned source in your own disk scratch through your
normal file-editing mechanism. Check at least20GiB available, then run one
timeout20m lake env lean on that absolute filename from an existing exact
pinned build. Do not create a Lake project, fetch caches, build libraries,
start a server, or run two checks at once.

## Read-only checker and assembly reproduction

The two Python blocks below were both executed together against audit base
and fresh-main preflight. Save them as immutable_view.py and verify.py in
your own disk scratch alongside candidate packet.json, reader.md,
StableReductionPartII.lean, unchanged roadmap.json, handoff.md, recovered
Native.lean and the native.log/sketch.log produced by the checks above.
Set TAUCETI_REPO to your single existing repository clone and
TAUCETI_BASELINE to its pinned declaration index. Set ST2_VALIDATE_BASE to
b6ab1401f211d799af99125d5370869d9fc95754 for the reported preflight, or retain the audit-base default.
Run Python with PYTHONDONTWRITEBYTECODE=1. Output is stdout only; the scripts
never materialize a repository snapshot or regenerate data. Clone reads
come from immutable git blobs; the candidate overlay exists only in RAM.

immutable_view.py SHA-256:
ec178cb58e64d26d75f308f2c0ccc22969b60857e460011c95b3b8168ac18c3e.
verify.py SHA-256:
6eb04727bfa3590a11f9092f5634f98d6268df03a1418264be5d386a31ec2ca1.

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
BASE = os.environ.get('ST2_VALIDATE_BASE', 'f31661fb8ff057ec4c899e8e22229c295f2b4e6a')
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
"""Validate the candidate using actual immutable-tree checker, intake and atlas code."""
import ast,hashlib,json,re
from collections import Counter,defaultdict
from pathlib import Path
import immutable_view as git_view
HERE=Path(__file__).resolve().parent
STEM="StableReductionPartII";RID="StableReductionPartII"
FILES={"research/blueprint/packets/"+STEM+".json":"packet.json",
"research/blueprint/readmes/"+STEM+".md":"reader.md",
"research/blueprint/suggested/"+STEM+".lean":STEM+".lean",
"research/blueprint/handoff/DESIGN-"+STEM+".md":"handoff.md"}
orig=json.loads(git_view.blob(next(iter(FILES))))
roadpath="research/blueprint/roadmaps/"+STEM+".json"
origroad=json.loads(git_view.blob(roadpath))
FILES[roadpath]="roadmap.json"
for dst,name in FILES.items():git_view.CACHE[dst]=(HERE/name).read_bytes()
git_view.install()
import check_blueprint
errors,warnings,summary=check_blueprint.check(git_view.REPO/next(iter(FILES)),
check_blueprint.load_index(Path(__import__("os").environ["TAUCETI_BASELINE"])),check_blueprint.world())
print(json.dumps({"checker":summary,"errors":errors,"warnings":warnings}),flush=True)
assert not errors and not warnings,(errors,warnings)
p=json.loads((HERE/"packet.json").read_text());reader=(HERE/"reader.md").read_text();lean=(HERE/(STEM+".lean")).read_text()
old={n["id"]:n for n in orig["nodes"]};new={n["id"]:n for n in p["nodes"]}
assert len(old)==133 and len(new)==136 and set(old)<=set(new)
for nid,n in old.items():
    for key in ("id","kind","statement","hypotheses","acceptance","sources","implementationStatus","uses"):
        assert n.get(key)==new[nid].get(key),(nid,key)
    assert new[nid].get("api",[])[:len(n.get("api",[]))]==n.get("api",[]),nid
    assert new[nid].get("tests",[])[:len(n.get("tests",[]))]==n.get("tests",[]),nid
unchanged=sum(n==new[nid] for nid,n in old.items())
assert unchanged==130,unchanged
for k in ["requests","gaps","sourceIssues","sourceVersions","consumerCoverage","keyDefinitionCoverage","restructure","upstreamImportEncoding"]:
    assert orig[k]==p[k],k
assert p["baseline"]["declarations"][:77]==orig["baseline"]["declarations"]
assert p["sources"][:len(orig["sources"])]==orig["sources"]
assert json.loads((HERE/"roadmap.json").read_text())==origroad
assert p["status"]=="partial" and all(n["implementationStatus"]=="unchecked" for n in new.values())
for nid,n in new.items():
    if nid in old:continue
    assert n["statement"] in reader and n["declarationName"].rsplit(".",1)[1] in lean,nid
    for a in n.get("api",[]):
        assert a["name"] in reader and a["statement"] in reader
        assert re.search(r"^(?:lemma|theorem|def|noncomputable def) "+re.escape(a["name"].rsplit(".",1)[1])+r"\b",lean,re.M),a["name"]
    for t in n.get("tests",[]):assert t["statement"] in reader and t["name"] in lean,t["name"]
for nid,n in new.items():
    for a in n.get("api",[]):assert a["name"].rsplit(".",1)[1] in lean,a["name"]
    for t in n.get("tests",[]):assert t["name"] in lean,t["name"]
assert not re.search(r"\bsorry\b",(HERE/"packet.json").read_text()+reader)
assert not re.search(r"^(?:axiom|opaque)\s|:\s*True\b",lean,re.M)
assert Counter(c["status"] for c in p["coverage"])=={"partial":8}
tree=ast.parse(git_view.blob("research/blueprint/intake.py").decode())
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {"ALLOWED","PRIVATE"} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=="file_problems"]
env={"json":json,"re":re};exec(compile(ast.Module(body=picked,type_ignores=[]),"actual-intake", "exec"),env)
problems=[v for dst,name in FILES.items() for v in env["file_problems"](dst,(HERE/name).read_text())]
assert not problems,problems
for name in FILES.values():
    s=(HERE/name).read_text();assert not re.search(r"[ \t]+$",s,re.M),name
    assert not re.search(r"/(?:home|Users)/[^/\s]+/",s),name
native=(HERE/"Native.lean").read_text();log=(HERE/"native.log").read_text()
assert log.count("depends on axioms:")==51 and "sorryAx" not in log and "error:" not in log and "warning:" not in log
assert not re.search(r"\bsorry\b",native)
slog=(HERE/"sketch.log").read_text()
assert "error:" not in slog and slog.count("warning:")==slog.count("warning: declaration uses")==204
assert len(re.findall(r"^example\b",native,re.M))==22 and len(re.findall(r"^example\b",lean,re.M))==84
assert hashlib.sha256(native.encode()).hexdigest()=="dbf4374d619b337b19727079fa52f712582a2e8dc921d0dd027b820f3c0a9ff8"
assert hashlib.sha256(lean.encode()).hexdigest()=="b0e65a36e73f3882a9f6eb257a48f3269361ccc297dbe7a46f31fe4e8aa097c7"
def acyclic(g,roots):
    colors={}
    def visit(v):
        assert colors.get(v)!=1,("cycle",v)
        if colors.get(v)==2:return
        colors[v]=1
        for w in g[v]:visit(w)
        colors[v]=2
    for v in list(roots):visit(v)
    return set(colors)
import build
normal=build.load_promoted
def assemble(packet,definition):
    def candidate(*args,**kw):
        packets,docs,defs=normal(*args,**kw)
        return ([(name,q) for name,q in packets if q.get("roadmapId")!=RID]+[(RID,packet)],
            {**docs,RID:"research/blueprint/readmes/"+RID+".md"},
            [x for x in defs if x.get("id")!=RID]+[definition])
    build.load_promoted=candidate
    return build.assemble(require_distances=False)
baseline,_=assemble(orig,origroad)
atlas,_=assemble(p,json.loads((HERE/"roadmap.json").read_text()))
g=defaultdict(set)
for e in atlas["stageEdges"]:g[e["source"]].add(e["target"])
vertices={s["id"] for s in atlas["stages"]};acyclic(g,vertices)
row=next(r for r in atlas["roadmaps"] if r["id"]==RID)
assert row["blueprint"]["declarations"]==136 and row["blueprint"]["planets"]==35,row["blueprint"]
assert not row.get("pendingLinks") and not row["blueprint"].get("skippedLinks")
assert {(e["source"],e["target"]) for e in atlas["stageEdges"]}=={(e["source"],e["target"]) for e in baseline["stageEdges"]},"new stage edges"
before={r["id"]:r for r in baseline["roadmaps"]}
for r in atlas["roadmaps"]:
    if r["id"]==RID:continue
    assert r.get("blueprint",{}).get("skippedLinks",[])==before[r["id"]].get("blueprint",{}).get("skippedLinks",[]),r["id"]
req=defaultdict(set)
for e in atlas["stageEdges"]:req[e["target"]].add(e["source"])
for folder in ["data/decompositions","research/blueprint/packets"]:
    for path in (git_view.REPO/folder).glob("*.json"):
        q=json.loads(path.read_text())
        for n in q.get("nodes",[]):req[n["id"]].update(n.get("prerequisites",[])+n.get("upstreamPrerequisites",[]))
        for request in q.get("requests",[]):
            for target in request.get("neededBy",[]):req[target].add(request["supplier"])
reachable=acyclic(req,list(new))
allnodes=dict(new)
for folder in ["data/decompositions","data/blueprints","research/blueprint/packets"]:
    for path in (git_view.REPO/folder).glob("*.json"):
        for n in json.loads(path.read_text()).get("nodes",[]):allnodes.setdefault(n["id"],n)
used=set(new);todo=list(new)
while todo:
    v=todo.pop()
    for d in allnodes[v].get("prerequisites",[]):
        if d in allnodes and d not in used:used.add(d);todo.append(d)
def stage_of(v):
    seen=set()
    while v in allnodes and v not in seen:
        seen.add(v);v=allnodes[v].get("parentStageId")
    return v
roadmap=json.loads((HERE/"roadmap.json").read_text())
stagePairs={(d,RID+":"+s["key"]) for s in roadmap["stages"] for d in s.get("requires",[])}
stagePairs.update((s,stage_of(n["id"])) for n in new.values() for s in n["prerequisites"]
    if s in vertices and s not in allnodes and s!=stage_of(n["id"]))
stagePairs.update((q["supplier"],stage_of(v)) for q in p["requests"] for v in q["neededBy"]
    if q["supplier"]!=stage_of(v))
def reaches(source,target):
    seen=set();todo=[source]
    while todo:
        v=todo.pop()
        if v==target:return True
        if v in seen:continue
        seen.add(v);todo.extend(g[v])
    return False
assert all(reaches(s,t) for s,t in stagePairs),[p for p in stagePairs if not reaches(*p)]
ownEdges=sum(sum(v in new for v in n["prerequisites"]) for n in new.values())
combined=defaultdict(set)
for e in atlas["stageEdges"]:combined[e["target"]].add(e["source"])
for v in used:
    n=allnodes[v]
    if n.get("parentStageId"):combined[v].add(n["parentStageId"])
    for d in n.get("prerequisites",[]):
        if d in vertices or d in used:combined[v].add(d)
for q in p["requests"]:
    for v in q["neededBy"]:combined[v].add(q["supplier"])
combinedVertices=vertices|used|set(combined)|{v for ds in combined.values() for v in ds}
acyclic(combined,combinedVertices)
receipt={"indexedChecker":"pass","actualIntake":"pass","actualAssembler":"pass","base":git_view.BASE,
"preservedStatements":133,"unchangedNodes":unchanged,"addedNodes":3,
"kinds":Counter(n["kind"] for n in p["nodes"]),"api":sum(len(n.get("api",[])) for n in p["nodes"]),
"tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"baseline":len(p["baseline"]["declarations"]),"planets":35,
"gaps":len(p["gaps"]),"requests":len(p["requests"]),"ownDeclarationEdges":ownEdges,
"stageVertices":len(vertices),"stageEdges":len(atlas["stageEdges"]),
"reachableDependencyVertices":len(reachable),"reachableDeclarations":len(used),
"requiredStagePairs":len(stagePairs),"requiredStagePairsReachable":len(stagePairs),
"combinedVertices":len(combinedVertices),"combinedEdges":sum(map(len,combined.values())),
"allDAGs":"acyclic","pendingLinks":[],"ownSkippedLinks":[],"otherSkips":"unchanged","newStageEdges":0,
"scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(receipt,ensure_ascii=False),flush=True)
```

## Precise continuation

Keep the native ψ,p,ε,K, their exact formulas and nonflat tests. Required
remaining work includes the full two-coefficient normal form and dual normal
coordinates/residue; the two specified cokernel equivalences with matrix
transposes and negative dual-cokernel generator; arbitrary coefficient-module
monicity/exactness, natural Hom exchange, canonical bidual evaluation, both
Ext vanishings and coefficient flatness from the earlier C1–C7 derivations.
The canonical whole-dual tensor equivalence and tensor scalar-action
identities remain separate obligations. Pointwise generator naturality is
not a substitute for them.

The two-base completion comparison, Appendix relative stable-reflexivity
criterion, unacquired Bourbaki input/unproved exercise, pointed hull and
actual nodal-family identification, sheaf descent and arbitrary-base finite
presentation approximation remain open. All MC.0–MC.7 moduli-stack/Hilbert/
properness, positivity, fine-level, determinant/Deligne-pairing, Picard/Torelli
and source-collation targets remain required. No geometric key, stage,
completion result or general stable-reflexivity theorem is closed.

No owned process remains running at submission. After the PR opens, remove
only this job's scratch recoverably. Do not unclaim the submitted job.
Continue under WORKERS with the next available priority issue.

## Preserved predecessor handoff (historical, not current verification)

The complete preceding codex-rtOQ9t handoff follows. Its proofs, read scopes,
hashes and counts are attributed to that worker; current receipts above
supersede its head-sketch counts. Its continuation obligations remain live.


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
