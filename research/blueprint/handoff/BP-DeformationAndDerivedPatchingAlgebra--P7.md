# BP-DeformationAndDerivedPatchingAlgebra--P7: ordinary homogeneous decomposition checkpoint

Codex — codex-5ebb6f · 3 October 2026 · Refs #551 · **partial**.

The checkpoint adds 18 declaration-sized nodes (3 constructions and 15 lemmas), 15 API items and 11 tests. It names the already existing finite expansion map, constructs actual coefficient projections on the native Rees quotient, proves finite homogeneous expansion is bijective, and registers the old native GradedAlgebra on that same quotient. Native graded projection equals homogeneous inclusion after coefficient extraction. The existing coefficient-change map commutes with native graded projections.

Every statement holds for arbitrary commutative rings and ideals with the expressly stated ideal-containment premise for coefficient change. No local, Noetherian, reducedness, domain or proper-ideal premise is added. Only finite support occurs. The native tests distinguish the surviving square-zero degree-one class for (2) in ℤ/4 from the vanishing next-power class for (4) in ℤ, and check zero/unit ideals and actual coordinate values.

All 298 incoming mathematical contracts are retained. Exactly two old node objects gain explicit prerequisite edges: expansion bijectivity cites the new map/injectivity/surjectivity nodes, and grading registration cites canonical recomposition comparison. The other 296 old nodes are identical. All 15 gaps, both supplier requests, 13 planets, source issues/versions, eight coverage rows and the full reserved Hilbert–Samuel multiplicity target are preserved. No stage is closed and all 316 nodes remain unchecked.

The native source gives 15 additional existing named constructions/results/APIs: expansion bijectivity; direct-sum equivalence and its three APIs; homogeneous image submodules, their comparison and coercion; the actual decomposition and its inclusion formula; GradedAlgebra registration and its decomposition equation; and graded projection, its inclusion and product formulas. Both inverse laws are proved by canonical recomposition compared with the real finite expansion. Unit and product membership are proved using actual quotient monomials. No conclusion is assumed in a new field. These proofs refine the ring-side checkpoint; they do not prove the general module and Hilbert–Serre theory.

## Sources, library checks and ownership

Freshly read the full own campaign roadmap, all own reviewed AUDIT-17 rows and the complete REV-AUDIT-17 report, nine own stage contracts, own RS-08 keeps/narrowings and owner records, and the reserved multiplicity entry and survey contract. All link maps were mechanically inspected for own entries and supplier boundaries. Governing protocol files match earlier full readings in this continuous session; WORKERS and UPSTREAM_GUIDE were freshly read in full. No applicable AGENTS instructions were found. The full AlgebraicCurves and JacobianChallenge roadmap readings are reused from earlier in this continuous session after exact byte guards, not claimed as freshly repeated whole-document readings. The RS-08 review status was checked; no fresh full review-document reading is asserted.

Fresh primary source passages: [Stacks 10.59.5](https://stacks.math.columbia.edu/tag/00K4), complete proof and displayed ordinary associated graded ring; [10.70.1(1)](https://stacks.math.columbia.edu/tag/052P), ordinary Rees degree placement. Their HTTP bytes, dates and hashes are archived. These passages supply the ordinary carriers; the coefficient projections, finite expansion proofs and grading adapters are explicit derivations here. Generic filtered/derived Rees theory remains with DD.1, and geometric blowups with StableReduction. Other inherited source obligations remain open.

Read the whole pinned Rees file, selected native quotient, polynomial coefficient, DirectSum/DFinsupp and internally graded statements with their assumptions, and selected linear-map/equivalence inverse laws. All 14 added baseline references resolve at the exact pin. Read pinned TauCeti WordFiltration/AssociatedGraded lines 1–175: its ascending word quotients do not provide this descending ideal-adic quotient adapter. This is not a global library absence certificate. Fresh metadata for open Mathlib PRs [33220](https://github.com/leanprover-community/mathlib4/pull/33220) and [9819](https://github.com/leanprover-community/mathlib4/pull/9819) records immutable heads 70572cd62395e933e8f6476bcedcee366a5b5e82 and 413e5b872a7c758e0eb91f99cb96d6a61c81f0a2; their general graded-module/Hilbert–Serre work is a continuation lead, not adopted code. The previously recorded beyond-pin coefficient-ideal theorem remains prior art.

Incoming [PR 5997](https://github.com/CBirkbeck/tauceti-explorer/pull/5997) was recovered over public HTTP: 38 artifact hashes, five helper hashes and four deliverables authenticated, and all four deliverables match this mathematical base. The new native source includes its entire admission-free coefficient-change source, ten tests and 42 axiom checks. Thus the real coefficient ideal, monomial kernel and piece-inclusion proofs are recompiled, rather than substituted by axioms. The original canonical source is preserved byte-for-byte as the full suggested-file prefix.

## Validation and limits

Exact required pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. Both checked files import only Mathlib, so the entire canonical file was compiled in an existing exact Mathlib build; no claim is made to compile TauCeti itself. Runs were serial, checked tracked Mathlib cleanliness and at least 35 GiB available immediately before each run, and used a 1200-second timeout with forced termination after 30 additional seconds. No project setup, cache download, library build or language server was used.

- Native.lean: 966 lines, 21 examples, exit 0; 0 warnings, 0 expected admitted-declaration warnings, 77 axiom audits. Source SHA256 `fad1a5c1485c78774e96837c666b238068f463fcb8fb570412b063910274d258`; diagnostic SHA256 `c65510015be38a14906b02fb1b79a1f2c18be801fcb64ee6770617e704fc3af9`.
- Canonical.lean: 4760 lines, 282 examples, exit 0; 671 warnings, 671 expected admitted-declaration warnings, 0 axiom audits. Source SHA256 `bc26fa552c9fb4b72b60717b8990566711540178d6f82299b9f7dac026f47087`; diagnostic SHA256 `42ccdd51d27323dfa71318cfdb6bb1c02b34152872a1267505d992d0b56d1efd`.
- Native source has no admissions or warnings; all 77 axiom checks contain only propext, Classical.choice and Quot.sound. The 18 newly explicit declarations and 15 existing named proof headers match the canonical forms; all 11 test headers match their canonical signatures. The suggested planning file remains admitted and unchecked.
- Actual indexed packet checker, intake functions and source-issue/version validators are run from immutable repository blobs. Whole foreign roadmap/stage objects and all stage edges match the immutable control. The R03.6 sibling packet is retained.
- Stage DAG 3003/8623, own DAG 316/540 and scoped DAG 3307/9480 vertices/edges are acyclic. All roots resolve, with one existing external declaration retained. There are 369 whole-roadmap declarations including the sibling part, and own skipped/pending links stay empty.
- All 65 own accepted restructure paths hold. Of 13 required stage pairs, 12 are reachable. The inherited LocalFieldsRamification layer 0→R03.4 supplier gap is unchanged and explicitly retained; this is not a claim that every required path exists.

## Resume

1. Start from the authenticated Native.lean proofs of actual ordinary coefficients, direct-sum comparison and ring grading. The old degree-one-generation theorem still requires proof. Build the actual graded-module decomposition/action on the existing Rees module quotient and prove finite generation.
2. Prove the general Hilbert–Serre induction and cumulative polynomial on the real graded module; connect support-degree and full intrinsic/ambient multiplicity interfaces. Keep zero-module, zero/unit-ideal and nonreduced branches.
3. Retain all existing dimension/support, associativity, completion, Artin–Rees, localization-length, P7/P8/P9, coefficient-category and routed-paper obligations. Native coefficient change preserving degree is not a flat-base-change multiplicity theorem.

## Recovery

The mathematical and publication control base is 99a13a08145478c56bee6f65460849f58d59a29e. The following public recovery section binds the evidence archive and portable helpers. The final suggested file is exactly Canonical.lean.

Archive commit: `22305ad448cc8b82cca09718c1906926fde667ca`, an ancestor changing only this issue's suggested file. The final suggested file is restored to the exact compiled canonical source. The manifest authenticates 39 evidence artifacts and all five verifier/compiler helpers. Manifest SHA256 `134901ef1a9528dda22bd848448bf01c02ea6558956ce692611ba995c1b1ad2e`; payload SHA256 `da52e465bc6673c7f342570d066188d49f740508fa1921a8048378ec8c4e5150`; recovery script SHA256 `85079294f959d842481d231581a3141534cededeb738d547dd763948830bb52e`.

Save the Python recovery fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public archive and four final deliverables, binds the handoff's mathematical text and helper fences, and authenticates all artifact bytes. Inspect the scripts. From an existing repository checkout containing immutable base 99a13a08145478c56bee6f65460849f58d59a29e, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX` using the prescribed pinned declarations.tsv. REPLAY_DIR must be outside that checkout. The verifier uses actual indexed packet, intake/source and immutable atlas code without running Lean or creating a repository snapshot. Its complete report should equal archived validation-local.json.

Optional serial compilation in an already available exact Mathlib build: `python3 REPLAY_DIR/run-lean.py Native.lean EXISTING_BUILD native-replay`; wait for completion, then `python3 REPLAY_DIR/run-lean.py Canonical.lean EXISTING_BUILD canonical-replay`. The runner checks the pin, tracked cleanliness, free memory≥20GiB and the 1200-second timeout with forced termination after 30 further seconds. It never sets up or builds a project. Source/log receipts for both successful runs are archived. Disposable scratch is deleted after the PR opens.

All 28 guarded input files agree with the immutable control; the actual assembler reads 843 immutable paths. Local validation reports zero packet errors/warnings, intake problems/refusals and source-issue/version errors. Public HTTP recovery and replay are checked against the final immutable head before submission.

## Script: recover.py

```python
"""Recover hash-authenticated inert proof evidence and final deliverables over HTTP. No Lean execution."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD),'Pass the full immutable PR head SHA.'
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='DeformationAndDerivedPatchingAlgebra--P7'
ARCHIVE='22305ad448cc8b82cca09718c1906926fde667ca'
MANIFEST_SHA='134901ef1a9528dda22bd848448bf01c02ea6558956ce692611ba995c1b1ad2e'
PAYLOAD_SHA='da52e465bc6673c7f342570d066188d49f740508fa1921a8048378ec8c4e5150'
EXPECTED={'research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P7.json': '2688113ce58cfa586ca17eec2122e2e0494782bf7a511eac75b974824fed99cc', 'research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md': '1a2ffe36450605ce768cba66432312ba0ddabe026774112d310f98a7371ac621', 'research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P7.lean': 'bc26fa552c9fb4b72b60717b8990566711540178d6f82299b9f7dac026f47087'}
HELPERS={'verify.py': 'd4f9f35c59bfb3cea13ee00fc8e062799b8e6d7aca941346518d4be16a0eeb67', 'immutable_view.py': '3c7c1117d410794c6e33156adb8d305ece57a1c41114564cee7cb54341d512ab', 'graph.py': 'a234d1f10bf7899a1fa52547b10953853f0800b5a9a1dfe9061e8585ea357f06', 'signatures.py': '67bfdee04f95f2f4e5f00e675d057a7a4a06065746f30d44697968423923a5d8', 'run-lean.py': '536cafbd1ada69cf8777124b911b6ae2c58238453070350310ba20ef2a750b29'}
h=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60) as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=(raw.split('/- BEGIN ARCHIVED ADIC DECOMPOSITION PAYLOAD\n',1)[1].split('\nEND ARCHIVED ADIC DECOMPOSITION PAYLOAD -/',1)[0]+'\n').encode()
assert h(pb)==PAYLOAD_SHA
payload=json.loads(pb)
def unpack(name):
 data=zlib.decompress(base64.b64decode(payload[name]['data']));assert h(data)==payload[name]['sha256'],name
 return data
mb=unpack('artifact-manifest.json');assert h(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name
 data=unpack(name);assert h(data)==m['sha256'] and len(data)==m['bytes'] and len(data.splitlines())==m['lines'],name
 (S/name).write_bytes(data)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]:
 path='research/blueprint/'+folder+'/'+('BP-' if folder=='handoff' else '')+RID+'.'+ext
 data=fetch(HEAD,path)
 if path in EXPECTED:assert h(data)==EXPECTED[path],path
 dst=S/'proposal'/path;dst.parent.mkdir(parents=True,exist_ok=True);dst.write_bytes(data);public[path]=h(data)
assert (S/'Canonical.lean').read_bytes()==(S/'proposal'/('research/blueprint/suggested/'+RID+'.lean')).read_bytes()
handoff=(S/'proposal'/('research/blueprint/handoff/BP-'+RID+'.md')).read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
fence=chr(96)*3
pairs=re.findall(r'## Script: ([^\n]+)\n\n'+fence+r'python\n(.*?)'+fence,handoff,re.S)
assert len(pairs)==6 and len(dict(pairs))==6
fences=dict(pairs)
assert h(fences['recover.py'].encode())==h(Path(__file__).read_bytes())
for name,digest in HELPERS.items():
 assert h(fences[name].encode())==digest==meta[name]['sha256']
 assert fences[name].encode()==(S/name).read_bytes()
report=dict(archive=ARCHIVE,head=HEAD,artifactsAuthenticated=len(meta),helpersAuthenticated=len(HELPERS),manifestSha256=MANIFEST_SHA,payloadSha256=PAYLOAD_SHA,publicFiles=public,LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
```

## Script: verify.py

```python
"""Validate preserved contracts, native headers and immutable repository checks. Does not execute Lean."""
from pathlib import Path
import ast,copy,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();sys.path.insert(0,str(S))
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';NS='TauCeti.HilbertSamuel.'
MATH=(S/'base.txt').read_text().strip();BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
FILES=['research/blueprint/'+f+'/'+('BP-' if f=='handoff' else '')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
sha=lambda b:hashlib.sha256(b).hexdigest()
def blob(ref,f):return subprocess.check_output(['git','show',ref+':'+f],cwd=R)
old=json.loads(blob(MATH,FILES[0]));p=json.loads((S/(STEM+'.json')).read_text());plan=json.loads((S/'Plan.json').read_text())
proposal={f:(S/'proposal'/f).read_text() for f in FILES}
assert len(old['nodes'])==298 and len(p['nodes'])==316
changed=[]
for a,b in zip(old['nodes'],p['nodes'][:298]):
 if a==b:continue
 changed.append(a['id']);slug=a['id'].split('/')[-1];assert slug in plan['oldNodeChanges']
 assert {k:v for k,v in a.items() if k!='prerequisites'}=={k:v for k,v in b.items() if k!='prerequisites'}
 assert b['prerequisites']==a['prerequisites']+[RID+':R03.3/'+d for d in plan['oldNodeChanges'][slug]]
assert len(changed)==2
assert set(p)==set(old)|{'homogeneousDecompositionContinuation'}
for k in old:
 if k not in {'summary','nodes','baseline','sources','coverage'}:assert p[k]==old[k],k
assert p['summary'].endswith(old['summary']) and p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:-14]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':R03.3':
  assert b['remaining'][:-1]==a['remaining']
  assert {k:v for k,v in a.items() if k!='remaining'}=={k:v for k,v in b.items() if k!='remaining'}
 else:assert a==b
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
assert len(p['scope'])==8 and len(p['gaps'])==15 and len(p['requests'])==2
assert [n['id'] for n in p['nodes'][298:]]==plan['newNodes']
assert [n['declaration'].removeprefix(NS) for n in p['nodes'][298:]]==plan['newNames']
assert len(plan['newTests'])==11 and len(plan['newBaselineRefs'])==14
import signatures
new=(S/'NewAdmitted.lean').read_text();native=(S/'Native.lean').read_text();tests=(S/'Tests.lean').read_text();canonical=(S/'Canonical.lean').read_text()
assert canonical==(S/'original-suggested.lean').read_text()+new
assert blob(MATH,FILES[2])==(S/'original-suggested.lean').read_bytes()
assert sha(blob(MATH,FILES[2]))=='4f6b471b58a95b4953630905258d612e790559f1efcb652c1841fa550f1d7201'
assert not re.search(r'\b(?:sorry|axiom|admit)\b',native)
assert native.startswith('import Mathlib.RingTheory.GradedAlgebra.Basic\n'+(S/'incoming-Native.lean').read_text()+'\n')
def typed_header(text,name):
 m=re.search(r'^(?:noncomputable )?(?:def|lemma|theorem|abbrev|instance) '+re.escape(name)+r'\b',text,re.M);assert m,name
 depth=0;i=m.start()
 while i<len(text):
  if depth==0 and (text.startswith(':=',i) or re.match(r'where\b',text[i:])):break
  if text[i] in '([{':depth+=1
  elif text[i] in ')]}':depth-=1
  i+=1
 return ''.join(text[m.start():i].removeprefix('noncomputable ').split())
for name in plan['newNames']+plan['newApiOnly']+plan['oldNamedProofs']:assert typed_header(canonical,name)==typed_header(native,name),name
assert [d['header'] for d in signatures.declarations(new) if d['name'] is None]==[d['header'] for d in signatures.declarations(tests) if d['name'] is None]
# Every admitted appended lemma/test corresponds to a non-overlapping real native declaration body.
parts=[(S/f).read_text() for f in ['New.lean','Recomposition.lean','NewAfter.lean','Tests.lean']]
for text in parts:
 ds=signatures.declarations(text)
 assert all(a['end']<=b['start'] for a,b in zip(ds,ds[1:]))
comp=json.loads((S/'compilation.json').read_text())
for source,stem,admissions,audits in [('Native.lean','native-final',0,77),('Canonical.lean','canonical-final',comp['canonical']['admissions'],0)]:
 r=json.loads((S/(stem+'.receipt.json')).read_text());log=(S/(stem+'.diag')).read_text();data=(S/source).read_bytes()
 assert r['exit']==0 and r['availableGiB']>=20 and r['timeoutSeconds']==1200
 assert r['sha256']==sha(data) and r['diagnosticsSha256']==sha(log.encode())
 assert ': error' not in log and 'Exit status: 0' in log
 assert log.count('warning:')==log.count('warning: declaration uses `sorry`')==admissions
 found=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(found)==audits
 if audits:
  assert 'sorryAx' not in log
  assert all(set(x.strip() for x in a.replace('\n',' ').split(',') if x.strip())<={'propext','Classical.choice','Quot.sound'} for a in found)
reader=(S/'Reader.md').read_text();assert reader==(S/'ReaderAddition.md').read_text()+blob(MATH,FILES[1]).decode()
for n in p['nodes'][298:]:
 assert n['declaration'] in reader and n['statement'] in reader
 for a in n.get('api',[])+n.get('tests',[]):assert a['name'] in reader and a['statement'] in reader
for owner,name,kind,statement in plan['newTests']:assert '-- test: '+name in tests and '-- test: '+name in new and name in reader and statement in reader
assert json.loads(proposal[FILES[0]])==p and proposal[FILES[1]]==reader and proposal[FILES[2]]==canonical
for path,t in proposal.items():
 assert not re.search(r'[ \t]+$',t,re.M),path
 assert not re.search(r'/(?:home|Users|tmp)/|file'+'://',t),path
for path,digest in json.loads((S/'input-guards.json').read_text())['hashes'].items():
 assert sha(blob(MATH,path))==digest==sha(blob(BASE,path)),path
if (S/'artifact-manifest.json').exists():
 for name,meta in json.loads((S/'artifact-manifest.json').read_text()).items():
  b=(S/name).read_bytes();assert sha(b)==meta['sha256'] and len(b)==meta['bytes'] and len(b.splitlines())==meta['lines'],name
os.environ['ROOT_ACTION_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE;immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0] is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='BP-'+STEM)
problems=[x for path,t in proposal.items() for x in env['file_problems'](path,t)];refusals=env['auto_refusals'](job,FILES,False,{'codex-5ebb6f'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}))
assert graph['worldCommit']==BASE and graph['foreignRoadmapsAndStagesUnchanged'] and graph['stageEdgesUnchanged']
summary['packet']=FILES[0]
print(json.dumps(dict(worldCommit=BASE,checker=summary,checkerErrors=errors,checkerWarnings=warnings,intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,preservedWholeNodeObjects=296,preservedMathematicalContracts=298,refinedDependencyNodes=changed,newDeclarations=18,newApiItems=15,newTests=11,nativeHeadersMatched=35,oldNativeNamedProofs=15,nativeAxiomAudits=77,canonicalAdmissions=comp['canonical']['admissions'],graph=graph,inputGuards=len(json.loads((S/'input-guards.json').read_text())['hashes']),indexSha256=sha(Path(sys.argv[2]).read_bytes()),LeanExecuted=False),indent=2))
```

## Script: immutable_view.py

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
BASE = os.environ.get('ROOT_ACTION_VALIDATE_BASE', (Path(__file__).resolve().parent / 'publication-base.txt').read_text().strip())
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
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
    return blob(key).decode('utf-8' if encoding in (None,'locale') else encoding, errors or 'strict')

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
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode('utf-8' if encoding in (None,'locale') else encoding, errors or 'strict'))

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

## Script: graph.py

```python
from pathlib import Path
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve()
sys.path.insert(0,str(S))
import immutable_view
immutable_view.install()
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((S/f'{STEM}.json').read_text())
original=json.loads((S/'original-packets.json').read_text())
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
dep|={(world[nid]["parentStageId"],nid) for nid in seen if world[nid].get("parentStageId") in stageids or world[nid].get("parentStageId") in world}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert stageedges=={(e["source"],e["target"]) for e in b["stageEdges"]}
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
assert {r['id']:r for r in a['roadmaps'] if r['id']!=RID}=={r['id']:r for r in b['roadmaps'] if r['id']!=RID}
assert {r['id']:r for r in a['stages'] if not r['id'].startswith(RID+':')}=={r['id']:r for r in b['stages'] if not r['id'].startswith(RID+':')}
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
report['worldCommit']=immutable_view.BASE
report['readPaths']=len(immutable_view.READS)
report['readPathHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
report['foreignRoadmapsAndStagesUnchanged']=True
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
```

## Script: signatures.py

```python
"""Extract full typed headers; admit bodies without changing native carriers."""
import re

def declarations(txt):
 out=[]
 for m in re.finditer(r'^(def|lemma|theorem|example)\b',txt,re.M):
  depth=0;i=m.start();pendingLet=False
  while i<len(txt):
   ch=txt[i]
   if depth==0 and re.match(r'let(?:I|\s)',txt[i:]) and not txt[txt.rfind('\n',m.start(),i)+1:i].strip():pendingLet=True
   if depth==0 and txt.startswith(':=',i):
    if not pendingLet:break
    pendingLet=False
   if ch in '([{':depth+=1
   elif ch in ')]}':depth-=1
   i+=1
  else:raise ValueError(txt[m.start():m.start()+100])
  header=txt[m.start():i].rstrip();end=i+2
  for line in txt[i+2:].splitlines(keepends=True):
   if line.strip() and not line[0].isspace():break
   end+=len(line)
  name=re.match(r'(?:def|lemma|theorem)\s+(\S+)',header)
  out.append(dict(start=m.start(),bodyStart=i,end=end,header=header,name=name[1] if name else None))
 return out

def admit(txt):
 out=txt
 for d in reversed(declarations(txt)):out=out[:d['bodyStart']]+':= by sorry\n\n'+out[d['end']:]
 return out

def headers(txt):return [' '.join(d['header'].split()) for d in declarations(txt)]
```

## Script: run-lean.py

```python
"""Optional serial replay in an existing exact Mathlib build; never creates or builds a project."""
from pathlib import Path
import hashlib,json,subprocess,sys,datetime
S=Path(__file__).resolve().parent;file=S/sys.argv[1];B=Path(sys.argv[2]).resolve();stem=sys.argv[3]
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'.lake/packages/mathlib',text=True).strip()=='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=B/'.lake/packages/mathlib',text=True).strip()
free=subprocess.check_output(['free','-g'],text=True);available=int(free.splitlines()[1].split()[-1]);receipt=dict(file=file.name,sha256=hashlib.sha256(file.read_bytes()).hexdigest(),availableGiB=available,time=datetime.datetime.now(datetime.timezone.utc).isoformat(),timeoutSeconds=1200)
if available<20:print(json.dumps({**receipt,'started':False}));sys.exit(75)
with (S/(stem+'.raw')).open('w') as log:
 log.write(free);log.flush();r=subprocess.run(['/usr/bin/time','-v','timeout','--kill-after=30','1200','lake','env','lean',str(file)],cwd=B,stdout=log,stderr=subprocess.STDOUT)
t=(S/(stem+'.raw')).read_text().replace(str(S)+'/', 'REPLAY/');(S/(stem+'.diag')).write_text(t);(S/(stem+'.raw')).unlink()
receipt.update(started=True,exit=r.returncode,diagnosticsSha256=hashlib.sha256(t.encode()).hexdigest());(S/(stem+'.receipt.json')).write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt));sys.exit(r.returncode)
```
