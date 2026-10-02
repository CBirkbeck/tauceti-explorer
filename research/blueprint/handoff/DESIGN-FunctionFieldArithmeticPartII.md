# FunctionFieldArithmeticPartII — specified native determinant checkpoint

Worker: Codex — codex-a71f92. Date: 2026-10-02. Refs #3403.
Claim [5961550379](https://github.com/CBirkbeck/tauceti-explorer/issues/3403#issuecomment-5961550379) won, confirmed by bot [5961552101](https://github.com/CBirkbeck/tauceti-explorer/issues/3403#issuecomment-5961552101).
The whole issue was read before and after confirmation. Mathematical base: f42b014ff60edba2c55eafd7f1e4adaade676b83.
Publication validation base: db0fce2ffbccc7e02eb25d9b6856a4e3dc50d48d. No own deliverable, governing protocol, reviewed library-audit or key-definition input changed between those bases.

This is a partial research checkpoint. Five additional lemma nodes expose the exact root-comparison determinant proof; thirteen new baseline entries import existing generic infrastructure. There are 163 unchecked nodes: 9 definitions, 27 constructions, 81 lemmas, 35 theorems, 10 comparisons and 1 application. The packet has 117 API records, 119 required definition/construction tests and 142 total tests, 39 planets and 131 baseline entries. All ten stages remain partial, with eight gaps and thirteen requests. The complete geometric roadmap, its source extraction and its full suggested file remain unfinished.

## Mathematical result and preservation

Keep the actual native root algebra B=A[x]/(xⁿ−f), modeled by AdjoinRoot, the Hopf algebra H=A[Multiplicative(ZMod n)] and the coaction-induced comparison Θ:B⊗_A B→H⊗_A B. Source and target use the inherited pair-indexed coordinate equivalences. No replacement algebra, arbitrary endomorphism, pointwise action or reduced branch fiber is introduced.

For every commutative A, f∈A and positive natural n, the specified matrix has entry M_(r,c)=f^⌊(c₁+c₂)/n⌋ when r₁=c₁ and r₂=(c₁+c₂) mod n, and zero otherwise. Put E=n(n−1)/2 in natural numbers. Its determinant is (−1)^((n−1)E) f^E.

The five new RS.0 proof leaves are coefficientPermutation_rows, coefficientPermutation_sign, weight_exponent, weight_product and matrix_reindex. The row permutation is σ(i,j)=(i,i+j mod n). Its sign is the product of the row-shift signs (−1)^((n−1)i); the sum of the actual finite row values is E. The floor exponent is exactly the wrapping indicator, and the existing wrapping_card counts that subtype. Reindex the diagonal matrix by σ inverse on its first index; consume the pinned determinant-permutation, diagonal and inverse-sign formulas. Cast the integer-unit sign into A only after computing it.

No invertibility of n or f, nonzero-ring condition, integral-domain assumption, cancellation or division by two in A is used. The eleven new tests include sign at n=2 and n=3, wrapping/nonwrapping exponents, a regular nonunit weight product over Z, the actual wrapped matrix entry, determinant at n=1 and n=3 over arbitrary A, the zero ring, and n=2 in characteristic two. The n=3 determinant f³ catches the tempting incorrect sign (−1)^E.

All 158 inherited node statements, hypotheses, API, sources, acceptances and statuses are preserved; 157 whole node objects are unchanged. Only the old determinant node gains the exposed proof/prerequisites and four tests. The roadmap definition is byte-for-byte unchanged. Removing this worker's single continuation section leaves the inherited reader byte-for-byte unchanged. Source inventories, source versions/findings, both source routes, reserved root-stack owner, thirteen requests, eight gaps, restructurings and 39 planets are retained. Generic finite permutations, counting, products and determinant infrastructure are imported rather than duplicated.

## Reading and baseline boundary

Fresh reading covered the whole issue twice, complete incoming handoff and ten-stage roadmap, all 158 inherited mathematical statements and hypotheses, the complete reserved root-stack contract, reviewed FA.0–FA.7 library audit and REV-AUDIT-20, relevant parent stage descriptions, the complete statement/proof of [Stacks Lemma 59.28.3](https://stacks.math.columbia.edu/tag/040N), and all thirteen new indexed Mathlib declaration statements with their relevant ambient hypotheses. The two nearby upstream documents read in this continuous worker session were StableReduction and JacobianChallenge; this continuation does not claim a new complete reading of other upstream documents.

The Stacks citation motivates the positive-exponent unit root chart. The determinant lemmas are explicitly authored deductions in the specified native coordinates, not a printed Stacks determinant theorem or an extension of its étale statement to nonunits. The current root-generator definition was inspected in TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Basic.lean at the Tau Ceti pin. Bounded helper searches inspected the relevant algebra/geometry, permutation and linear-algebra areas; no whole-library absence claim is made.

Historical whole-paper readings, source-version collation, errata and source-coverage receipts in the packet and predecessor handoff are preserved as historical evidence, not newly certified. In particular, this worker did not freshly read the complete TV17/YZ/AGV/B24/AV bibliography, perform a new complete supplier-carrier audit, or re-run historical arithmetic/source regression sweeps. The complete inherited native proof extraction was freshly rechecked after integrating the determinant.

Exact pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. New indexed leaves are Equiv.prodCongrRight, finCycle, finCycle_eq_finRotate_iterate, sign_finRotate, Equiv.Perm.sign_prodCongrRight, Equiv.Perm.sign_symm, Finset.prod_pow_eq_pow_sum, Finset.prod_filter, Finset.sum_range_id, Matrix.det_permute, Matrix.det_diagonal, Nat.add_div_eq_of_add_mod_lt and Nat.add_div_eq_of_le_mod_add_mod. The two indexed Mathlib natural-addition division formulas discharge the actual exponent split; an unindexed core lemma is not mislabeled as a baseline citation.

The eight relevant pinned Mathlib file hashes are:

```json
{
  "Mathlib/Logic/Equiv/Prod.lean": "f39e6eccbabfdd20664ddc80919332cae0c387c058df85acaddc306fa1adcfdb",
  "Mathlib/Logic/Equiv/Fin/Rotate.lean": "efc770513d77602e3ac7d496622bf03f5bbdba4fd5cc18e21df3ca5241685eaa",
  "Mathlib/GroupTheory/Perm/Fin.lean": "f433715abb71c95af324945da54c85f58715ca625c66a0e61d1a521d2f15f447",
  "Mathlib/GroupTheory/Perm/Sign.lean": "b0cfeebd1b9db78f1dc8e96c36ed9c0eb4de808ad2f292cec8d71ff807981bb6",
  "Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean": "273036de3d36eda43082685a3ebc998900735e96c3f4b18f1546b39a4f765af0",
  "Mathlib/Algebra/BigOperators/Intervals.lean": "840fec2dceee97d7ddc878f68528aa28e30d1a298029dbb4f270e99a226e048a",
  "Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean": "870291a8544ad9297e0c17f3531bea11607a1f0d83b775b13a31981777c30f2e",
  "Mathlib/Data/Nat/ModEq.lean": "832785951f3a2f46747c891a3b2b64808e3f76f8e45ec76f2fffa2cd87da5417"
}
```

## Checks and exact source receipts

The complete separate actual-body Mathlib-native extraction passed at the exact pin: 1716 lines, 62 proved examples, 42 axiom audits, zero errors, zero warnings and zero admissions. Its previously sole determinant admission now has a proof; no proof audit depends on sorryAx. Runtime 10.50 seconds; maximum RSS 3225104 KiB.

The admitted extraction reconstructed from the submitted head passed: 946 lines, the same 62 examples, zero errors and exactly 142 expected admission warnings, with no other warnings. Runtime 4.30 seconds; maximum RSS 3110952 KiB. This validates only the native extraction, not all 142 packet tests or the full geometric file.

The complete submitted suggested file is 1964 lines and was NOT COMPILED. Read-only checks show the existing exact-pin build lacks both .lake/build/lib/lean/TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.olean and .lake/build/lib/lean/TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Basic.olean. No new project, Lake setup/update, cache download, build or language server was started. One Lean process ran at a time, under a 1200-second timeout, with 57 and 58 GiB available before the respective successful runs. No Lean process remains.

Diagnostics normalization replaces the absolute invoked source name with Native.lean or Sketch.lean, removes only the RESOURCE footer and retains the final newline. SHA-256 receipts:

```json
{
  "Native.lean": {
    "sourceSha256": "d40ac61960c10d4640c4ecaa3204968021303cdcdd7dedc4ef4b0b81835938e7",
    "diagnosticsSha256": "00a7feab16652440b2ba73a10c130de0c9ed4bdd302b1f67a473f8d602d448b9",
    "lines": 1716,
    "examples": 62,
    "audits": 42,
    "errors": 0,
    "warnings": 0,
    "admittedWarnings": 0,
    "resource": "RESOURCE elapsed=0:10.50 maxRSSKiB=3225104 exit=0",
    "availableGiB": 57
  },
  "Sketch.lean": {
    "sourceSha256": "c688fbc69edc77647a553185633a2a5cc9838fd7c7beaa0f62ba793450b83f01",
    "diagnosticsSha256": "04378787efef2558b4ff9e2c0676ff007b14f46345ef2101f420db149a6893c8",
    "lines": 946,
    "examples": 62,
    "audits": 0,
    "errors": 0,
    "warnings": 142,
    "admittedWarnings": 142,
    "resource": "RESOURCE elapsed=0:04.30 maxRSSKiB=3110952 exit=0",
    "availableGiB": 58
  },
  "head": {
    "sourceSha256": "3a82b8adc32b6800787b266b918aba0d3ac4a531817a1202d58ad68300f31c58",
    "lines": 1964
  }
}
```

The actual indexed packet checker reports zero errors and zero warnings. Actual immutable-tree intake and assembler functions pass. Dependency graphs are acyclic, all 54 required supplier-stage pairs are reachable, there are no own pending/skipped links or new stage edges, and other roadmap skipped links are unchanged. The freshly validated publication projection gives:

```json
{
  "indexedChecker": "pass",
  "actualIntake": "pass",
  "actualAssembler": "pass",
  "base": "db0fce2ffbccc7e02eb25d9b6856a4e3dc50d48d",
  "preservedStatements": 158,
  "unchangedNodes": 157,
  "addedNodes": 5,
  "kinds": {
    "construction": 27,
    "definition": 9,
    "comparison": 10,
    "lemma": 81,
    "theorem": 35,
    "application": 1
  },
  "api": 117,
  "tests": 142,
  "baseline": 131,
  "planets": 39,
  "gaps": 8,
  "requests": 13,
  "ownDeclarationEdges": 337,
  "stageVertices": 3005,
  "stageEdges": 8723,
  "reachableDependencyVertices": 520,
  "reachableDeclarations": 214,
  "requiredStagePairs": 54,
  "requiredStagePairsReachable": 54,
  "combinedVertices": 3231,
  "combinedEdges": 9435,
  "allDAGs": "acyclic",
  "pendingLinks": [],
  "ownSkippedLinks": [],
  "otherSkips": "unchanged",
  "newStageEdges": 0,
  "scriptSha256": "4f1addef913ba15e020fae643f82cdf662cd28af96230ea95d1f6fa580a08919"
}
```

## Durable public reconstruction

The public ancestor [6df00ac8cb82d19130a90b5d1ea473e803fd8eae](https://github.com/CBirkbeck/tauceti-explorer/blob/6df00ac8cb82d19130a90b5d1ea473e803fd8eae/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean) changes only the issue's suggested-file path. Its first parent is the mathematical base and its additional parent retains predecessor archive fdc057a53800a1937f36f157aa7636a94611b5a9. The final PR commit retains this archive as an additional parent. The archive blob is 6ed1965cb92b979ffb2124af521bd6849b8bca16.

The archive contains the exact submitted head followed by the complete checked native body inside unique BEGIN/END ARCHIVED CHECKED ROOT DETERMINANT markers. The final suggested deliverable contains the proposed admitted signatures, not the archived proof body. Public fetch and read-only git reconstruction were byte-checked. Six helper/determinant signatures and eleven new test statements agree after whitespace normalization.

Credit: the inherited native prototype retains work by Codex workers codex-5ebb6f, rtOQ9t, J6LwjP and codex-a71f92. The root-generator expansion follows Tau Ceti contributors' pinned Apache-2.0 source. This proof evidence is not an implementation claim for Tau Ceti; every planned status remains unchecked.

Recovery script SHA-256: 434b2983c4cc2675c239c6f43c2a08b01e707b95c1542459af5982564520880e. Save the following as recover.py in your own scratch; set TAUCETI_REPO to an existing clone containing the public archive. It only reads and prints the receipt. Its reconstructed head/native/sketch strings are the exact sources used for the recorded checks.

```python
"""Verify public-ancestor reconstruction without writing files."""
import hashlib,json,os,re,subprocess
from pathlib import Path
REPO=Path(os.environ["TAUCETI_REPO"])
ARCHIVE="6df00ac8cb82d19130a90b5d1ea473e803fd8eae"
PATH="research/blueprint/suggested/FunctionFieldArithmeticPartII.lean"
s=subprocess.check_output(["git","show",ARCHIVE+":"+PATH],cwd=REPO).decode()
head=s.split("\n/-\nPublic verification archive, authored by Codex — codex-a71f92.\n",1)[0]
native=s.split("BEGIN ARCHIVED CHECKED ROOT DETERMINANT\n",1)[1].split("END ARCHIVED CHECKED ROOT DETERMINANT\n",1)[0]
imports="\n".join(l for l in head.splitlines() if l.startswith("import Mathlib"))
initial=head[head.index("abbrev AffineRing (f : A)"):head.index("-- TauCeti.RootStack.affineCoaction.nativePoint")]
one=head[head.index("-- TauCeti.RootStack.affineCoaction.test_one"):head.index("-- TauCeti.RootStack.affineCoaction.test_sign")]
comparison=head[head.index("section AffineTorsorComparison"):head.index("-- Native acceptance computations")]
extra=head[head.index("-- Native acceptance computations"):]
sketch=imports+"\nnoncomputable section\nuniverse u\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\nopen scoped TensorProduct\n"+initial+one+comparison+extra
sketch=sketch.replace("TauCeti.RootsOfUnityGroup.generator n","Multiplicative.ofAdd (1 : ZMod n)")
wanted={"head":"3a82b8adc32b6800787b266b918aba0d3ac4a531817a1202d58ad68300f31c58",
"native":"d40ac61960c10d4640c4ecaa3204968021303cdcdd7dedc4ef4b0b81835938e7",
"sketch":"c688fbc69edc77647a553185633a2a5cc9838fd7c7beaa0f62ba793450b83f01"}
texts={"head":head,"native":native,"sketch":sketch}
for key,content in texts.items():
    assert hashlib.sha256(content.encode()).hexdigest()==wanted[key],key
def normalized(s):return " ".join(s.split())
for name in ["coefficientPermutation_rows","coefficientPermutation_sign","weight_exponent","weight_product","matrix_reindex","determinant"]:
    pattern=r"^(?:lemma|theorem) affineTorsorComparison\."+name+r"\b([\s\S]*?) := by\b"
    assert normalized(re.search(pattern,head,re.M)[1])==normalized(re.search(pattern,native,re.M)[1]),name
names=["coefficientPermutation_rows.test_wrap","coefficientPermutation_sign.test_two","coefficientPermutation_sign.test_three","weight_exponent.test_wrap","weight_exponent.test_nonwrap","weight_product.test_nonunit","matrix_reindex.test_weight","determinant.test_exponent_one","determinant.test_three","determinant.test_zero_ring","determinant.test_wild"]
for name in names:
    h=head.split("-- TauCeti.RootStack.affineTorsorComparison."+name+"\n",1)[1].split(" := by",1)[0]
    n=native.split("-- affineTorsorComparison."+name+"\n",1)[1].split(" := by",1)[0]
    assert normalized(h)==normalized(n),name
assert not re.search(r"\bsorry\b",native)
assert len(re.findall(r"^#print axioms ",native,re.M))==42
assert len(re.findall(r"^example\b",native,re.M))==62
assert len(re.findall(r"^example\b",sketch,re.M))==62
print(json.dumps({"archive":ARCHIVE,"sha256":wanted,"signatureParity":6,"testParity":11,"nativeExamples":62,"nativeAudits":42,"sketchExamples":62,"reconstructed":True},ensure_ascii=False))
```

## Portable read-only checker recipe

Save the following two scripts as immutable_view.py and verify.py in your own scratch alongside packet.json, reader.md, FunctionFieldArithmeticPartII.lean, handoff.md, roadmap.json, Native.lean, Sketch.lean, native.log and sketch.log. These are the four submitted deliverables, unchanged roadmap, recovered sources and fresh exact-pin diagnostics, respectively. Set TAUCETI_REPO to your existing atlas clone and TAUCETI_BASELINE to the supplied declaration index. Run with PYTHONDONTWRITEBYTECODE=1. F2_VALIDATE_BASE selects the immutable publication projection; the default is the mathematical base. The recipe never writes inside the shared repository and imports the actual checker, intake rules and assembler rather than replacing their logic.

Loader SHA-256: 384708dc8bb7c1ab07bdbdabae0d08979f5297cf6c190902e660cb38011e9552.

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
BASE = os.environ.get('F2_VALIDATE_BASE', 'f42b014ff60edba2c55eafd7f1e4adaade676b83')
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

Validator SHA-256: 4f1addef913ba15e020fae643f82cdf662cd28af96230ea95d1f6fa580a08919.

```python
"""Validate the candidate using actual immutable-tree checker, intake and atlas code."""
import ast,hashlib,json,re
from collections import Counter,defaultdict
from pathlib import Path
import immutable_view as git_view
HERE=Path(__file__).resolve().parent
STEM="FunctionFieldArithmeticPartII";RID="FunctionFieldArithmeticPartII"
FILES={"research/blueprint/packets/"+STEM+".json":"packet.json",
"research/blueprint/readmes/"+STEM+".md":"reader.md",
"research/blueprint/suggested/"+STEM+".lean":STEM+".lean",
"research/blueprint/handoff/DESIGN-"+STEM+".md":"handoff.md"}
orig=json.loads(git_view.blob(next(iter(FILES))))
roadpath="research/blueprint/roadmaps/"+STEM+".json"
origroad=json.loads(git_view.blob(roadpath))
origreader=git_view.blob("research/blueprint/readmes/"+STEM+".md").decode()
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
assert len(old)==158 and len(new)==163 and set(old)<=set(new)
for nid,n in old.items():
    for key in ("id","kind","statement","hypotheses","acceptance","sources","implementationStatus","uses"):
        assert n.get(key)==new[nid].get(key),(nid,key)
    assert new[nid].get("api",[])[:len(n.get("api",[]))]==n.get("api",[]),nid
    assert new[nid].get("tests",[])[:len(n.get("tests",[]))]==n.get("tests",[]),nid
unchanged=sum(n==new[nid] for nid,n in old.items())
assert unchanged==157,unchanged
for k in ["requests","gaps","sourceIssues","scope","upstreamNotes","sourceCoverage","sourceVersions","auditEvidence","continuationBoundary","continuationCorrections","restructure"]:
    assert orig[k]==p[k],k
assert p["baseline"]["declarations"][:118]==orig["baseline"]["declarations"]
assert p["sources"]==orig["sources"]
assert p["continuationHistory"][:-1]==orig["continuationHistory"]
addition_start=reader.index("\n## RS.0 continuation — specified determinant dependencies")
addition_end=reader.index("Full-file elaboration still requires the actual geometric/TauCeti imports.",addition_start)+len("Full-file elaboration still requires the actual geometric/TauCeti imports.\n")
assert reader[:addition_start]+reader[addition_end:]==origreader
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
    for a in n.get("api",[]):assert a["name"].rsplit(".",1)[-1] in lean,a["name"]
    for t in n.get("tests",[]):
        assert t["name"] in lean or (t["name"].startswith("TauCeti.RootStack.") and
            re.search(r"^-- "+re.escape(t["name"].removeprefix("TauCeti.RootStack."))+r"(?:[: ]|$)",lean,re.M)),t["name"]
assert not re.search(r"\bsorry\b",(HERE/"packet.json").read_text()+reader)
assert not re.search(r"^(?:axiom|opaque)\s|:\s*True\b",lean[lean.index("/- BEGIN NATIVE ROOT DETERMINANT DEPENDENCIES -/"):],re.M)
assert Counter(c["status"] for c in p["coverage"])=={"partial":10}
tree=ast.parse(git_view.blob("research/blueprint/intake.py").decode())
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {"ALLOWED","PRIVATE"} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=="file_problems"]
env={"json":json,"re":re};exec(compile(ast.Module(body=picked,type_ignores=[]),"actual-intake", "exec"),env)
problems=[v for dst,name in FILES.items() for v in env["file_problems"](dst,(HERE/name).read_text())]
assert not problems,problems
for name in FILES.values():
    s=(HERE/name).read_text();assert not re.search(r"[ \t]+$",s,re.M),name
    assert not re.search(r"/(?:home|Users)/[^/\s]+/",s),name
native=(HERE/"Native.lean").read_text();log=(HERE/"native.log").read_text()
sketch=(HERE/"Sketch.lean").read_text()
assert log.count("depends on axioms:")==42 and "sorryAx" not in log and "error:" not in log and "warning:" not in log
assert not re.search(r"\bsorry\b",native)
slog=(HERE/"sketch.log").read_text()
assert "error:" not in slog and slog.count("warning:")==slog.count("warning: declaration uses")==142
assert len(re.findall(r"^example\b",native,re.M))==62 and len(re.findall(r"^example\b",sketch,re.M))==62
assert hashlib.sha256(native.encode()).hexdigest()=="d40ac61960c10d4640c4ecaa3204968021303cdcdd7dedc4ef4b0b81835938e7"
assert hashlib.sha256(sketch.encode()).hexdigest()=="c688fbc69edc77647a553185633a2a5cc9838fd7c7beaa0f62ba793450b83f01"
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
assert row["blueprint"]["declarations"]==163 and row["blueprint"]["planets"]==39,row["blueprint"]
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
"preservedStatements":158,"unchangedNodes":unchanged,"addedNodes":5,
"kinds":Counter(n["kind"] for n in p["nodes"]),"api":sum(len(n.get("api",[])) for n in p["nodes"]),
"tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"baseline":len(p["baseline"]["declarations"]),"planets":39,
"gaps":len(p["gaps"]),"requests":len(p["requests"]),"ownDeclarationEdges":ownEdges,
"stageVertices":len(vertices),"stageEdges":len(atlas["stageEdges"]),
"reachableDependencyVertices":len(reachable),"reachableDeclarations":len(used),
"requiredStagePairs":len(stagePairs),"requiredStagePairsReachable":len(stagePairs),
"combinedVertices":len(combinedVertices),"combinedEdges":sum(map(len,combined.values())),
"allDAGs":"acyclic","pendingLinks":[],"ownSkippedLinks":[],"otherSkips":"unchanged","newStageEdges":0,
"scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(receipt,ensure_ascii=False),flush=True)
```

## Where to resume

Start with the preserved geometric-carrier and normalized-coframe gaps and the exact supplier requests. Retain the full nilpotent branch fiber, positive root exponent, fpqc infinite tower and independent Abdurrahman–Venkatesh symplectic route in its existing split proposal. Read each missing supplier/source passage before discharging it; do not infer closure from the native determinant or successful graph checks. Do not duplicate generic tensor, permutation, determinant or field-rank infrastructure. All remaining coverage entries already name their precise unresolved work.

Own scratch sources and logs are recoverably removed after the PR is opened; the archive, hashes and recipes above preserve the checkpoint. No submitted job is unclaimed manually.

---

## Complete predecessor handoff, preserved verbatim

The following is historical evidence and worklist. Its assertion that the determinant was the sole native admission describes the predecessor, not this checkpoint.

# FunctionFieldArithmeticPartII — native zero-section ranks checkpoint

Worker: Codex — codex-5ebb6f. Date:2026-10-02. Issue3403; claim5960931694, confirming bot5960933964. The whole issue was read before and after the winning confirmation. Branch codex-5ebb6f-function-fields-next1; base404db35ccec72b9ceabd108108d2ba8fa0762b2c.

The continuation derives the general zero-section field ranks from the actual native kernel coordinates. Nine additional planning nodes (two constructions and seven lemmas), six API records and fourteen tests give158 unchecked nodes:9 definitions,27 constructions,76 lemmas,35 theorems,10 comparisons and1 application. There are117 required API records,119 required definition/construction tests,131 total tests,39 planets and118 baseline entries. All ten stages remain partial with eight gaps and thirteen requests. This is a research checkpoint; the geometric roadmap and complete suggested file remain unfinished.

Publication base9be0d75234d712fb5773663482ee55c38ac60ce0 was merged into this own branch after checking that fourteen protocol, own-deliverable, reviewed-audit and key-definition inputs matched the mathematical base. The public proof commit remains an ancestor. The fresh publication projection passes.

## Native mathematics and preservation

Keep B=A[x]/(xⁿ−f) as native AdjoinRoot, H=A[Multiplicative(ZMod n)] and the actual coaction-induced comparison Θ:B⊗_A B→H⊗_A B. The predecessor specifies the source coordinate equivalence Cs, target coordinates and cyclic permutation σ(i,j)=(i,i+j mod n). These maps, including all predecessor proofs, are retained.

The restricted equivalence W≃L uses W={(i,j):n≤i+j} and L={(i,k):k<i}. Both are actual subtypes of Fin n×Fin n. The inverse is the restriction of the existing cyclic subtraction. Import the finite ordered-pair counting theorem to obtain card L=choose n2=n(n−1)/2, then transport that count to W. The counting auxiliary admits n=0; every root construction keeps n≥1.

At f=0, the specified kernel coordinates take values in ker(0·id_A)=A. Compose the preceding actual kernel equivalence with the pointwise native top-submodule equivalence to specify K₀:ker Θ₀≃ₗ[A](W→A). Its forward map extracts Cs coefficients. Its inverse extends wrapping coefficients by zero and synthesizes the actual tensor element. This holds over every commutative A, including nonreduced and zero rings; no replacement carrier, arbitrary vector-space model or assumption of geometric points appears.

Over a field, the finite-function dimension theorem gives dim ker Θ₀=card W and Cs gives dim(B⊗B)=n² for every f. Transfer finite dimensionality through the injective actual coordinate map and import rank-nullity. Evenness of n(n−1) is used before dividing by two, giving dim im Θ₀=n(n+1)/2. The existing simultaneous rank statement follows by pairing those two formulas. No inverse of n or characteristic restriction is used. In particular, over F₃ at n=3 the image has dimension six; over any field at n=2 the image/kernel dimensions are three/one, and over Q at n=4 they are ten/six. The branch algebra remains k[x]/(xⁿ), with its nilpotents.

All149 inherited node IDs, mathematical statements, hypotheses, API, sources and statuses are preserved;148 whole node objects are unchanged. Only the old zero-rank node's proof/prerequisites and two new tests change. Its acceptance conditions are retained. Both source routes (28 Yun–Zhang and38 Abdurrahman–Venkatesh records), reserved root-stack owner, curve/moduli import, source versions/findings/coverage, sibling ownership, gaps, requests, restructurings and39 planets are unchanged. All inherited reader declarations remain. The roadmap definition is byte-for-byte unchanged. Generic dimension, rank-nullity, counting and equivalence infrastructure is imported, not planned again.

The general determinant, including its permutation sign, is the sole remaining admission in the separate native calculation. The actual rank formulas and all51 examples have proved bodies there. That does not close geometric root-stack descent, normalized coframes, quotient algebraicity/coarse properties, coherent infinite fpqc towers, Kummer H¹ or ramified class-field theory.

## Reading and baseline

The whole [incoming handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/404db35ccec72b9ceabd108108d2ba8fa0762b2c/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md), all149 inherited mathematical statements and29 deduplicated hypothesis groups, all eight reviewed parent FA.0–FA.7 audit rows with their target/evidence/duplication records, and REV-AUDIT-20 were freshly read. There is no PartII audit row. The full own ten-stage definition, reserved root-stack contract and SF.1/SF.2/SF.3/R09.4/R09.5 supplier descriptions were read. The incoming three immutable native proof fragments were reconstructed and their exact hashes verified. Nearby StableReduction and JacobianChallenge upstream documents were read earlier in this continuous worker session. The link-entry screen found no packet entry mentioning this PartII. No fresh whole-source, whole-packet metadata or whole-library audit is claimed.

Fresh primary reading: [Talpo–Vistoli v2](https://arxiv.org/pdf/1410.1164v2), complete printed pp.12–16, from the root-object construction through Corollary3.13 and the beginning of3.14, including the proofs of3.5,3.7,3.12 and3.10. Fresh downloaded SHA25692a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2 matches the inherited receipt. [Stacks040N](https://stacks.math.columbia.edu/tag/040N), complete Lemma59.28.3 statement and proof, was also reread. The latter concerns unit parameters. Our zero-parameter dimension formulas are explicit root-chart derivations, not quoted paper or Stacks theorems. Broader YZ19/AGV/B24/AV primary reading, paper route collations, source findings, image checks and arithmetic sweeps retain the preceding workers' receipts; no fresh erratum or new image/sweep result is asserted.

Eleven new Mathlib baseline statements were read with their ambient hypotheses at082e2d37e8b0463410cdb532e111cd43d5a66174: the ordered-pair/subtype cardinality and choice formulas; equivalence of subtypes; cardinality invariance; divisibility of n(n−1) by2; finite-function dimension; pointwise linear equivalences; the top-submodule linear equivalence; injective transfer of finite dimensionality; and linear-equivalence dimension invariance. Their exact files, lines and file hashes are in the packet. The existing rank-nullity statement was freshly read in FiniteDimensional/Lemmas. The native Tau Ceti character generator is expanded only to its exact pinned definition. The F₃ example imports the pinned field structure with its primality instance; it does not derive a field structure from a commutative ring assumption.

## Native proof and admitted signatures

The complete separate native calculation is archived in the allowed suggested-file history at [proof commitfdc057a53800a1937f36f157aa7636a94611b5a9](https://github.com/CBirkbeck/tauceti-explorer/blob/fdc057a53800a1937f36f157aa7636a94611b5a9/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean), between BEGIN/END ARCHIVED CHECKED ROOT ZERO RANK. It combines the actual predecessor coaction/weighted table/module coordinates/unit inverse and their examples with this continuation's proved bodies. The public archive contains one admission, exclusively the still-open determinant. It is not a proof of the whole roadmap. The PR head restores the proposed bodies under PROTOCOL13.

Actual extraction: 1586 lines,51 examples,0 errors,1 admitted-body warning (determinant),0 other warnings. All36 printed declaration axiom lists, including the14 new/updated exports and22 inherited module/unit exports, contain only subsets of propext, Classical.choice and Quot.sound. The rank computation has no admitted dependency. Available memory60 GiB; time11.30 seconds, maximum RSS3185264 KiB.

Final proposed native extraction: 845 lines,51 examples,0 errors,126 admitted-body warnings,0 other warnings. Available memory60 GiB; time4.27 seconds, maximum RSS3107284 KiB. Thirteen new native/canonical declaration headers are identical; the existing rank header is preserved. Every inherited reader declaration and all new packet API/test names occur in the submitted deliverables.

Both runs used a single direct Lean4.34.0-rc2 process at a time in an existing exact-pin Mathlib build, with a20-minute timeout. No project, build, cache download or LSP was started and no compiler process remains. The complete Tau Ceti suggested file is uncompiled: the exact-pin line-bundle/roots-of-unity compiled imports are absent in the available build. Native extraction excludes those geometric/Tau Ceti branches and does not certify their signatures or suppliers.

SHA256 receipts:

- Actual extraction: 806e853b6b28b5608f6631c48523d66ac16a63bac60964c69601fe51359b1525
- Actual normalized diagnostics: 2b929a47164388b41564da68dc8d1dc5027ff6bff7314853752919c0fe6571c6
- Proposed native extraction: 0b58f3062788163a1ad4e2b53a5d5f370c9f93fa2ff2ad36bbfbfe6af4754759
- Proposed normalized diagnostics: 558fff11a24827f05b7bd4e25a14c55ccb4b94cff9c8ae6a461152e3b5b57028

Diagnostics replace the invocation source path with RankProof.lean or Submitted.lean and exclude the separate TIME/RSS trailer. Public reconstruction verifies both source hashes byte for byte.

## Validation and actual atlas projection

The indexed packet checker reports0 errors/0 warnings. The normal read-only assembler overlay uses the actual packet and roadmap definition, retaining other parts. Stage graph:3056 vertices including51 inherited virtual endpoints/8723 edges. Own graph:158 declarations/327 edges. Combined stage graph and209 reachable declarations:3226 vertices/9420 edges. All are acyclic; external prerequisites resolve; all54 required stage pairs are reachable. Stage edges, own empty skipped links, all unrelated skipped lists, the reserved key and all source/supplier boundaries match the control. No synthetic prerequisite, attachment or atlas/application file was added. The public script also checks148 unchanged whole nodes and149 preserved statements, all eleven new baseline entries and reader/API/test retention.

## Reproduce the native extraction

Save the following Python script and run it from a checkout containing the immutable proof commit and final proposed suggested file. It writes only its own scratch directory. Use an already compiled Mathlib build at the exact pin; require at least20 GiB available and one direct compiler process with a20-minute timeout. Do not set up a project, build libraries, download caches or start an LSP.

```python
from pathlib import Path
import subprocess,hashlib,re
sc=Path('scratch-zero-rank');sc.mkdir(exist_ok=True)
sourcepath='research/blueprint/suggested/FunctionFieldArithmeticPartII.lean'
archived=subprocess.check_output(['git','show','fdc057a53800a1937f36f157aa7636a94611b5a9:'+sourcepath],text=True)
proof=archived.split('/- BEGIN ARCHIVED CHECKED ROOT ZERO RANK\n',1)[1].split('END ARCHIVED CHECKED ROOT ZERO RANK -/',1)[0]
assert hashlib.sha256(proof.encode()).hexdigest()=='806e853b6b28b5608f6631c48523d66ac16a63bac60964c69601fe51359b1525'
s=Path(sourcepath).read_text()
imports='\n'.join(l for l in s.splitlines()if l.startswith('import Mathlib'))
initial=s[s.index('abbrev AffineRing (f : A)'):s.index('-- TauCeti.RootStack.affineCoaction.nativePoint')]
one=s[s.index('-- TauCeti.RootStack.affineCoaction.test_one'):s.index('-- TauCeti.RootStack.affineCoaction.test_sign')]
comparison=s[s.index('section AffineTorsorComparison'):s.index('-- Native acceptance computations')]
extra=s[s.index('-- Native acceptance computations'):]
sketch=imports+'\nnoncomputable section\nuniverse u\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\nopen scoped TensorProduct\n'+initial+one+comparison+extra
sketch=sketch.replace('TauCeti.RootsOfUnityGroup.generator n','Multiplicative.ofAdd (1 : ZMod n)')
assert hashlib.sha256(sketch.encode()).hexdigest()=='0b58f3062788163a1ad4e2b53a5d5f370c9f93fa2ff2ad36bbfbfe6af4754759'
(sc/'RankProof.lean').write_text(proof)
(sc/'Submitted.lean').write_text(sketch)
print('Both public native extractions verified byte for byte.')
```

Delete own scratch after submission. The unchanged predecessor statement-level source findings and routes remain review obligations.

## Reproduce projection and preservation

Save and run this script from the checkout; it imports the normal assembler read-only and writes no atlas files. Script SHA25674565ec38c0a1e629d7591763cb6c6e445dac6631ee6d4f2aa7fb8393e1cc294.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="FunctionFieldArithmeticPartII"
stem=rid
packetpath="research/blueprint/packets/"+stem+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="404db35ccec72b9ceabd108108d2ba8fa0762b2c"
publicationbase="9be0d75234d712fb5773663482ee55c38ac60ce0"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
   {**ds,stem:"research/blueprint/readmes/"+stem+".md"},
   [d for d in defs if d["id"]!=rid]+[definition])
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
stagevertices=stageids|{x for e in se for x in e}
unresolved=[(v,d) for v in used for d in allnodes[v].get("prerequisites",[]) if not d.startswith(("mathlib:","tauceti:")) and d not in allnodes and d not in stagevertices]
assert not unresolved,unresolved
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
inheritedMissing=[]
assert missing==inheritedMissing,missing
assert p["requests"]==old["requests"]
ar={x["id"]:x for x in a["roadmaps"]};cr={x["id"]:x for x in control["roadmaps"]}
assert ar[rid]["blueprint"]["declarations"]==cr[rid]["blueprint"]["declarations"]+9
assert ar[rid]["blueprint"]["planets"]==cr[rid]["blueprint"]["planets"]
assert ar[rid]["blueprint"]["skippedLinks"]==cr[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("sourceIssues","requests","sourceCoverage","sourceVersions","restructure","gaps"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","api","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
 assert all(a in own[id].get("acceptance",[]) for a in n.get("acceptance",[]))
assert p["baseline"]["declarations"][:107]==old["baseline"]["declarations"]
assert len(p["baseline"]["declarations"])==118
assert r==oldr
unchanged=sum(own[id]==n for id,n in on.items())
assert unchanged==148
assert len(own)==158
assert all(n["implementationStatus"]=="unchecked" for n in own.values())
lean=(root/("research/blueprint/suggested/"+stem+".lean")).read_text()
reader=(root/("research/blueprint/readmes/"+stem+".md")).read_text()
for node in old["nodes"]:
 assert node["id"] in reader,node["id"]
public=subprocess.check_output(["git","show","fdc057a53800a1937f36f157aa7636a94611b5a9:research/blueprint/suggested/FunctionFieldArithmeticPartII.lean"],text=True)
proof=public.split("/- BEGIN ARCHIVED CHECKED ROOT ZERO RANK\n",1)[1].split("END ARCHIVED CHECKED ROOT ZERO RANK -/",1)[0]
names={node["declarationName"] for node in p["nodes"][len(old["nodes"]):]}
names|={api["name"] for node in p["nodes"][len(old["nodes"]):] for api in node.get("api",[])}
names.add("TauCeti.RootStack.affineTorsorComparison.zero_rank")
for name in names:
 localname=name.removeprefix("TauCeti.RootStack.")
 def header(s):
  match=re.search(r"^(?:noncomputable )?(?:def|lemma|theorem) "+re.escape(localname)+r"\b.*?:=",s,re.M|re.S)
  assert match,name
  return re.sub(r"\s+"," ",match[0])
 assert header(proof)==header(lean),name
assert len(names)==14,len(names)
for node in p["nodes"][len(old["nodes"]):]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"][len(old["nodes"]):]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,"research/blueprint/readmes/"+stem+".md","research/blueprint/suggested/"+stem+".lean","research/blueprint/handoff/DESIGN-"+stem+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",publicationbase],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":ar[rid]["blueprint"]["declarations"],"partDeclarations":len(own),"partPlanets":sum("planet" in n for n in own.values()),"planets":ar[rid]["blueprint"]["planets"],"ownSkippedLinks":ar[rid]["blueprint"]["skippedLinks"],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "virtualStageEndpoints":len(stagevertices-stageids),"unresolvedPrerequisites":unresolved,"reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missing),"inheritedMissingStagePairs":missing,"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}

print(json.dumps(result,indent=2))
```

## Resume

1. Reconstruct the actual archived native proof, rather than using admitted PR-head bodies as proof inputs. The general field ranks are checked there. Complete the determinant sign using rowwise cyclic translations and the wrapping-cardinality theorem; keep n=1, the zero ring and arbitrary characteristic.
2. Continue root-stack carriers and the actual tensor-section/unit-coordinate, geometric finite chart, coherent infinite fpqc tower and ramified class-field contracts through their existing suppliers. JAC-A, ST-LISSE/ST-OPS, NORM-2EXACT, FA-APPROX, EXTERIOR-COMP, LEAN-GEOMETRY, LEAN-SECTION-COMP and TOWER-TYPING remain open. Preserve normalized coframes, full nilpotent closed charts, both paper routes and all source corrections. No stage is closed.

Opening the checkpoint PR ends this claim. Continue with the next available issue in WORKERS order; never unclaim submitted work or independently review/red-team own contributions.
