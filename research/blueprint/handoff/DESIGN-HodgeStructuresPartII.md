# DESIGN-HodgeStructuresPartII: affine parameter tensor coherence

Agent: Codex — codex-7e92bd. Refs #3371. Claim5968248462 confirmed by bot5968249498; whole issue reread after confirmation and unchanged at publication. Incoming PR5975's public recovery verified33 artifacts and four mathematical overlays. This is a partial checkpoint.

Proof archive: `a5202499d1371087f6faaf5225830d08a024b594`.
Mathematical base: `2d1584bf0aad10c317a3ba5f29581b4d9ecf9603`.
Publication base: `bf81c488cd59162798eae2db62b8ccd4edd4ca8c`.
Predecessor archive: `c366ebe1bca3a326bc612150f1227da799206385`.

## Result

Seven new lemma nodes supply horizontality of the actual common-λ affine tensor associator and both unitors, inverse horizontality for an actual linear equivalence, and the three resulting inverse equations. Seven API items and five typed tests extend the actual affineTensor API. The native unit is U_λ(a)=λ(1⊗d₀a). The associator proof handles three actual coefficient tensors by induction, with no basis or flatness assumption. The unitors use the λ-Leibniz rule and preserve its derivative term. No d₀λ=0 or integrability premise is needed for these raw affine equations; the existing unit API retains its compatible scalar tower.

The affine-line test constructs an actual TwoForms with A=ℤ[x], W=A and zero degree-two module from MvPolynomial.pderiv. Two unit(2) connections evaluated on x⊗1 give2 after native unit normalization, and do not give4. It supplies the nonzero derivative rather than assuming it. This does not identify universal sheaf differentials.

All235 incoming mathematical contracts remain,233 whole node records unchanged. The affine tensor gains seven API items/five tests; the intrinsic sheaf tensor gains seven prerequisites/one proof step. No general key is weakened to an affine case. The packet has242 nodes (12definitions,35constructions,172lemmas,18theorems,5comparisons),208 baseline references, six planets, eleven gaps and five requests. Raw263 API items/251 tests; the indexed checker counts255 API items/238 required unit tests. All implementation statuses remain unchecked. H.0 is partial; H.1–H.8 remain not_read. All eight route manifests,149 assigned source obligations,35 inherited typed omission rows and the source finding remain. No source error was newly asserted.

## Where to resume

Prove the actual general-λ tensor-curvature formula for the existing TwoForms/preconnection exterior extension, including both signed mixed terms and their cancellation, then derive tensor integrability under the stated constant-parameter hypotheses. Use the actual additive balanced extension; do not assume it is R-linear. The native associator and both unitors now need no further affine proof.

The arbitrary-Q tensor-valued shuffle, cross-ring exterior transport, finite-projective sheaf restriction/tensor coherence, E1 native tensor/exterior identification, equality detection and gluing, determinant/Tate/period adapters, the reserved general ringed-site key and the later source routes remain required. Local module tensors do not identify tensor products of global sections with sheaf tensor sections. Generic module coherence belongs to the pinned library; no new category carrier is built. Earlier frontier paragraphs in the preserved detailed reader and packet are predecessor history; this is the current affine frontier.

## Reading and ownership

Freshly read WORKERS, the complete blueprint protocol, expansion protocol and upstream guide; all own stage descriptions; the full reserved key survey entry; all four reviewed Hodge parentL0–L3 target, evidence and duplicate rows; the complete REV-AUDIT-02 report. Fresh CR.1/E1/DD.1 supplier descriptions and all149 route IDs/dispositions were read. All36 link JSON files were screened for this PartII with no match, not a whole-link prose audit. The incoming235-node packet and all joining source proofs were not independently re-audited.

The full upstream HodgeStructures and RepresentationTheory/SemisimpleAlgebras documents were read earlier in this continuous worker session at c1ce73c82043f8e7f67b701bb7797bf8ebde7ef1; their Git blobs were checked unchanged at publication. Other broad source receipts remain attributed to their earlier checkpoints. No fresh whole-paper or whole-library absence audit is claimed.

Read pinned Associator.lean1–220, including actual associator, both unitors, their evaluations/inverses and native coherence; selected native tensor map composition/identity and induction/carrier statements; MvPolynomial.PDeriv1–150, including pderiv and its X evaluation. The three added baseline references are lid_symm_apply, rid_symm_apply and pderiv_X_self. Actual incoming TwoForms, Preconnection, unit and affineTensor carriers were read and reused, with no alternative generic sheaf carrier.

Fresh bounded open-Mathlib-PR query `connection tensor in:title`, limit30, returned no results. Indexed Zulip searches for connection/tensor and lambda/connection returned tensor-representation/induction and differential-geometry leads, with no λ-preconnection implementation consumed. This is not evidence that no such discussion exists.

Downloaded the official44-page [Esnault–Groechenig author manuscript](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), SHA2560bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35, on2026-10-03. Fresh browser extraction reading covered §4.2's opening λ-definition and zero/one specializations, printed23–24, plus Lemma4.9 statement/full printed proof. Cited Simpson9.1/7.2 inputs and the published Acta PDF were not freshly read in this continuation. Freshly read [Stacks07J5](https://stacks.math.columbia.edu/tag/07J5)'s ordinary connection/extension/integrability equations and complete Lemma60.15.1 proof. The affine identities are authored algebraic deductions, not printed-source declarations or completed crystal/Simpson comparisons. No paper bytes or extracted source text are published.

## Checked artifacts

Both final Lean checks used the existing exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build, Lean4.34.0-rc2. Each had a same-command free-g guard (68GiB available), a1200-second timeout, and ran serially. No Lake project, dependency update, cache fetch, library build or language server was started. No compiler is left running. These files import only Mathlib; no different Tau Ceti binary is substituted for the f790474 source pin.

Native.lean has495 lines,13 examples and18 clean axiom audits, including all seven new lemmas. It extends the exact incoming standalone proof slice, adding only the polynomial import, seven bodies and five tests. Zero errors, warnings or admissions; all eighteen audit lists contain only propext and Quot.sound. This is a standalone affine certificate, not a proof of all242 planned nodes or the sheaf construction.

Canonical.lean is the complete final3499-line suggested file, with210 examples. It preserves the incoming canonical planning body byte-for-byte and appends the twelve new admitted signatures. It compiled with zero errors,486 expected admission warnings and no other warnings. The final public suggested file is exactly these checked bytes. Native and admitted headers match. The archive wrapper exists only in the cited ancestor commit. Diagnostics normalize only the private task-directory prefix to recovered/; source hashes authenticate the precise checked files.

```json
{
  "Native.lean": {
    "exit": 0,
    "sourceSha256": "2859438b07b9775f19b82260352a442b6970aff794e1c73110bbcd34bc1956ea",
    "diagnosticSha256": "871a85b35765e2cdeffbc3a02ebdd2c7bf0852b2a80fd7a2f7197df60a789f49",
    "admissionWarnings": 0,
    "otherWarnings": 0,
    "axiomAudits": 18,
    "examples": 13,
    "lines": 495,
    "availableGiB": 68,
    "time": "2026-10-03T10:38:18.008947+00:00",
    "elapsed": "0:07.80",
    "peakRSSKiB": 3506992
  },
  "Canonical.lean": {
    "exit": 0,
    "sourceSha256": "ea05c827bc24047d560a59801fb32bdf77b9bcc74a0b347cabb616d1df059811",
    "diagnosticSha256": "c04451381ace7888199ca7f96cb70431d23b2f8343dbdb09f5190607b713b7d3",
    "admissionWarnings": 486,
    "otherWarnings": 0,
    "axiomAudits": 0,
    "examples": 210,
    "lines": 3499,
    "availableGiB": 68,
    "time": "2026-10-03T10:39:47.062901+00:00",
    "elapsed": "0:12.50",
    "peakRSSKiB": 3179072
  }
}
```

## Structural validation

The exact indexed checker reports zero errors/warnings. Actual intake file_problems/auto_refusals report zero problems/refusals. Preservation checks cover all old statements/hypotheses, route manifests, source finding, general key and suppliers, plus the native/admitted headers and source/diagnostic hashes.

The actual immutable build.assemble candidate/control validation reads Git blobs directly at each base, keeps all other promoted packets/documents/definitions, expands the actual reachable Coleman supplier, includes stage-to-declaration and request edges, and checks stage/own/scoped acyclicity and all21 required stage-pair paths. It verifies no unresolved own endpoints, no own skipped/pending links, unchanged other-roadmap skips and unchanged stage edges. This structural closure does not prove missing supplier mathematics.

At the mathematical base the stage/own/scoped graph counts are3022/8663,242/475 and3259/9424. The publication-base receipt is:

```json
{
  "stageDAG": {
    "vertices": 3022,
    "edges": 8663,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 242,
    "edges": 475,
    "acyclic": true
  },
  "scopedDAG": {
    "vertices": 3259,
    "edges": 9424,
    "acyclic": true
  },
  "reachableDeclarations": 243,
  "externalDeclarations": [
    "ColemanPowerSeries:L1/derivation-determinant-unit"
  ],
  "baselineLeaves": 196,
  "requiredPairs": 21,
  "restructurePairs": 0,
  "unresolved": [],
  "ownSkippedLinks": [],
  "ownPendingLinks": [],
  "otherSkipsMatch": true,
  "stageEdgesUnchanged": true,
  "immutableBase": "bf81c488cd59162798eae2db62b8ccd4edd4ca8c",
  "immutableReadPaths": 843,
  "immutableReadPathSha256": "c08a52747d8fbeccdf7953d26630127c60c4971c61f0341551907cbffc7c51ed"
}
```

The read-path digest identifies843 sorted accessed Git paths, not their content bytes. All five inputs plus governing/audit/key/checker/intake inputs were checked unchanged between mathematical and publication bases before fast-forwarding over disjoint work.

## Public recovery

From the existing repository clone, save the five scripts below under their headings in a disk scratch directory. Run `python3 recover.py RECOVERY HEAD_SHA`, then `python3 RECOVERY/verify.py RECOVERY DECLARATION_INDEX` and `python3 RECOVERY/graph.py RECOVERY` from that repository. The recovery script reads this handoff at the requested head, finds the ancestor archive, authenticates fourteen artifacts, recovers all five current deliverables and scripts, and confirms that the current suggested file equals the checked canonical artifact. The recovered verifier actually reruns preservation, artifact/header checks, the indexed checker and actual intake. The graph script defaults to the publication base; set HODGE_VALIDATE_BASE to the mathematical base to reproduce its comparison.

To rerun compilation, use `python3 RECOVERY/run_lean.py Native.lean EXISTING_PINNED_BUILD native-rerun`, wait for completion, then the corresponding Canonical.lean command. The script checks the Mathlib pin and current memory itself. Recovery authenticates previous compilation receipts and does not itself constitute a fresh Lean run. Earlier evidence remains recoverable from the predecessor public archive.

### recover.py

```python
from pathlib import Path
import sys,subprocess,re,json,zlib,base64,hashlib
out=Path(sys.argv[1]);ref=sys.argv[2] if len(sys.argv)>2 else 'HEAD';out.mkdir(parents=True,exist_ok=True);RID='HodgeStructuresPartII'
def read(commit,path):return subprocess.check_output(['git','show',commit+':'+path])
paths={f'research/blueprint/roadmaps/{RID}.json':'Candidate-roadmap.json',f'research/blueprint/packets/{RID}.json':'Candidate.json',f'research/blueprint/readmes/{RID}.md':'Reader.md',f'research/blueprint/suggested/{RID}.lean':'Canonical.lean',f'research/blueprint/handoff/DESIGN-{RID}.md':'Handoff.md'}
head={path:read(ref,path) for path in paths};handoff=head[f'research/blueprint/handoff/DESIGN-{RID}.md'].decode();archive=re.search(r'Proof archive: `([0-9a-f]{40})`',handoff).group(1)
t=read(archive,f'research/blueprint/suggested/{RID}.lean').decode();m=re.search(r'/\- BEGIN ARCHIVED PARAMETER COHERENCE PAYLOAD\n(.*?)\nEND ARCHIVED PARAMETER COHERENCE PAYLOAD -/',t,re.S);assert m
items=json.loads(zlib.decompress(base64.b64decode(m.group(1))))
manifest={}
for name,item in items.items():
 assert name==Path(name).name and name not in {'.','..'}
 data=item['text'].encode();h=hashlib.sha256(data).hexdigest();assert h==item['sha256'];(out/name).write_bytes(data);manifest[name]=h
assert head[f'research/blueprint/suggested/{RID}.lean']==(out/'Canonical.lean').read_bytes()
for path,name in paths.items():(out/name).write_bytes(head[path])
(out/(RID+'.json')).write_bytes((out/'Candidate.json').read_bytes())
(out/'artifact-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
for name in ['recover.py','verify.py','immutable.py','graph.py','run_lean.py']:
 m=re.search(r'### '+re.escape(name)+r'\n\n```python\n(.*?)\n```\n',handoff,re.S);assert m,name;(out/name).write_text(m.group(1)+'\n')
print(json.dumps({'head':ref,'archive':archive,'verifiedArtifacts':len(items),'currentDeliverables':len(paths),'scripts':5,'allHashesMatch':True},indent=2))
```

### verify.py

```python
from pathlib import Path
import sys,json,re,ast,hashlib,collections
W=Path.cwd();S=Path(sys.argv[1]).resolve();RID='HodgeStructuresPartII';P=RID+':H.0/'
files=['research/blueprint/'+folder+'/'+('DESIGN-' if folder=='handoff' else '')+RID+'.'+ext for folder,ext in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents=dict(zip(files,[(S/n).read_text() for n in ['Candidate-roadmap.json','Candidate.json','Reader.md','Canonical.lean','Handoff.md']]))
p=json.loads(contents[files[1]]);old=json.loads((S/'Incoming-packet.json').read_text());r=json.loads(contents[files[0]]);oldr=json.loads((S/'Incoming-roadmap.json').read_text())
assert len(p['nodes'])==242 and len(old['nodes'])==235
changed={}
for a,b in zip(p['nodes'],old['nodes']):
 if a!=b:
  slug=a['id'].rsplit('/',1)[-1]
  if slug=='affine-parameter-tensor':
   assert a['api'][:-7]==b['api'] and a['tests'][:-5]==b['tests'];fields=['api','tests']
  elif slug=='intrinsic-tensor':
   assert a['prerequisites'][:-7]==b['prerequisites'] and a['proofSteps'][:-1]==b['proofSteps'];fields=['prerequisites','proofSteps']
  else:raise AssertionError(slug)
  assert {k:v for k,v in a.items() if k not in fields}=={k:v for k,v in b.items() if k not in fields}
  changed[slug]=fields
assert len(changed)==2
assert p['routeManifest']==old['routeManifest'] and p['sourceIssues']==old['sourceIssues']
for k in old:
 if k not in ['nodes','summary','baseline','sources','coverage','gaps','verification']:assert p[k]==old[k],k
assert p['baseline']['declarations'][:-3]==old['baseline']['declarations'] and p['sources'][:-1]==old['sources']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert p['coverage'][1:]==old['coverage'][1:] and p['coverage'][0]['remaining'][:-1]==old['coverage'][0]['remaining']
assert {k:v for k,v in p['coverage'][0].items() if k!='remaining'}=={k:v for k,v in old['coverage'][0].items() if k!='remaining'}
assert p['gaps'][1:]==old['gaps'][1:] and {k:v for k,v in p['gaps'][0].items() if k!='parameterTensorCoherenceContinuation'}==old['gaps'][0]
assert p['verification']['previousCheckpoint']==old['verification']
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
assert len(p['requests'])==5 and len(p['gaps'])==11 and len(p['sourceIssues'])==1
assert sum(len(r['items']) for m in p['routeManifest'] for r in m['inputRoutes'])==149
assert {k:v for k,v in r.items() if k not in ['summary','stages']}=={k:v for k,v in oldr.items() if k not in ['summary','stages']}
assert r['stages'][1:]==oldr['stages'][1:] and r['stages'][0]['description'].startswith(oldr['stages'][0]['description'])
assert {k:v for k,v in r['stages'][0].items() if k!='description'}=={k:v for k,v in oldr['stages'][0].items() if k!='description'}
assert contents[files[2]].endswith((S/'Incoming-reader.md').read_text())
new=(S/'New.lean').read_text();tests=(S/'NewTests.lean').read_text();admitted=(S/'NewAdmitted.lean').read_text();native=(S/'Native.lean').read_text();full=contents[files[3]]
assert full==(S/'IncomingCanonical.lean').read_text()+'\n/- Common-parameter affine tensor coherence. -/\n'+admitted
assert native=='import Mathlib.Algebra.MvPolynomial.PDeriv\n'+(S/'IncomingNative.lean').read_text()+'\n'+new+'\n'+tests+'\n'+(S/'Audits.lean').read_text()
def headers(txt):
 result=[]
 for m in re.finditer(r'^(?:lemma|example)\b',txt,re.M):
  depth=0;body=None
  for i in range(m.start(),len(txt)):
   c=txt[i]
   if c in '([{':depth+=1
   elif c in ')]}':depth-=1
   if depth==0 and txt.startswith(':=',i):body=i;break
  assert body is not None;result.append(' '.join(txt[m.start():body].split()))
 return result
assert headers(new)+headers(tests)==headers(admitted) and len(headers(admitted))==12
assert not re.search(r'\bsorry\b|\baxiom\b',native)
assert set(re.findall(r'^lemma ([\w.]+)',new,re.M))=={n['declaration'] for n in p['nodes'][-7:]}
tensor=next(n for n in p['nodes'] if n['id']==P+'affine-parameter-tensor')
assert {t['name'] for t in tensor['tests'][-5:]}==set(re.findall(r'^-- test: (.+)$',tests,re.M))
assert {a['name'] for a in tensor['api'][-7:]}=={n['declaration'] for n in p['nodes'][-7:]}
for n in p['nodes'][-7:]:assert n['declaration'] in contents[files[2]] and n['statement'] in contents[files[2]]
for a in tensor['api'][-7:]+tensor['tests'][-5:]:assert a['name'] in contents[files[2]] and a['statement'] in contents[files[2]]
for path,t in contents.items():
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',t),path
 assert not re.search(r'[ \t]+$',t,re.M),path
for name,item in json.loads((S/'artifact-manifest.json').read_text()).items():assert hashlib.sha256((S/name).read_bytes()).hexdigest()==item,name
resources=json.loads((S/'compilation-summary.json').read_text());assert p['verification']['compilation']==resources
for name,log,count,audits in [('Native.lean','native.diag',0,18),('Canonical.lean','canonical.diag',486,0)]:
 t=(S/log).read_text();rec=resources[name]
 assert not re.search(r': error(?:\([^)]*\))?:',t)
 warnings=re.findall(r'warning: (.+)',t);assert len(warnings)==count and all(w=='declaration uses `sorry`' for w in warnings)
 assert t.count('depends on axioms:')==audits and rec['axiomAudits']==audits and rec['admissionWarnings']==count
 assert rec['sourceSha256']==hashlib.sha256((S/name).read_bytes()).hexdigest()
 assert rec['diagnosticSha256']==hashlib.sha256(t.encode()).hexdigest()
 if audits:
  assert 'sorryAx' not in t
  ax=re.findall(r'depends on axioms:\s*\[([^]]*)\]',t,re.S);assert len(ax)==audits
  assert all(set(re.findall(r'[\w.]+',v))<= {'propext','Classical.choice','Quot.sound'} for v in ax)
assert resources['Native.lean']['examples']==13 and resources['Canonical.lean']['examples']==210
import immutable
immutable.install()
sys.path.insert(0,str(W/'scripts'))
import check_blueprint
index=check_blueprint.load_index(sys.argv[2]);assert index[0] is not None
errors,warnings,summary=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']='recovered/'+RID+'.json'
tree=ast.parse((W/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((W/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for f in files for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,files,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
print(json.dumps({'checker':summary,'intakeProblems':problems,'intakeRefusals':refusals,'wholeIncomingNodesUnchanged':233,'allIncomingContractsPreserved':235,'newLemmas':7,'newAPIItems':7,'newTests':5,'matchedHeaders':12,'rawAPIItems':sum(len(n.get('api',[])) for n in p['nodes']),'rawTests':sum(len(n.get('tests',[])) for n in p['nodes']),'compilation':resources,'allNodesUnchecked':True,'immutableBase':immutable.BASE},indent=2))
```

### immutable.py

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
BASE = os.environ.get('HODGE_VALIDATE_BASE', 'bf81c488cd59162798eae2db62b8ccd4edd4ca8c')
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

### graph.py

```python
from pathlib import Path
import os,sys,json,collections,copy
R=Path.cwd();S=Path(sys.argv[1]);RID='HodgeStructuresPartII';STEM=RID
sys.path.insert(0,str(R/'scripts'))
p=json.loads((S/'Candidate.json').read_text())
old=json.loads((S/'Incoming-packet.json').read_text())
nodes={n['id']:n for n in p['nodes']}
import immutable
immutable.install()
import check_blueprint
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'
own_definition=json.loads((S/'Candidate-roadmap.json').read_text())
old_definition=json.loads((S/'Incoming-roadmap.json').read_text())
def assemble(candidate,definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy([d for d in definitions if d.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,own_definition);b=assemble(old,old_definition)
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for file in sorted((R/folder).glob('*.json')):
  for n in json.loads(file.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(nodes)
listedstageids={x['id'] for x in a['stages']}
stageids=listedstageids|set(check_blueprint.world()[1])
se={(e['source'],e['target']) for e in a['stageEdges']}
assert se=={(e['source'],e['target']) for e in b['stageEdges']}
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e}
 following=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in following[s]:following[s].add(t);indeg[t]+=1
 todo=[v for v,k in indeg.items() if k==0];count=0
 while todo:
  v=todo.pop();count+=1
  for w in following[v]:
   indeg[w]-=1
   if indeg[w]==0:todo.append(w)
 assert count==len(vertices),[v for v,k in indeg.items() if k][:10]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
ownedges={(d,nid) for nid,n in nodes.items() for d in n['prerequisites'] if d in nodes}
todo=list(nodes);seen=set();de=set();unresolved=set();baseref=set()
while todo:
 nid=todo.pop()
 if nid in seen:continue
 seen.add(nid)
 for d in world[nid].get('prerequisites',[]):
  if d.startswith(('mathlib:','tauceti:')) and d not in stageids:baseref.add(d);continue
  de.add((d,nid))
  if d in world:todo.append(d)
  elif d not in stageids:unresolved.add(d)
assert not unresolved,unresolved
de|={(world[nid]['parentStageId'],nid) for nid in seen if world[nid].get('parentStageId')}
de|={(q['supplier'],v) for q in p['requests'] for v in q.get('neededBy',[]) if v in nodes or v in stageids}
out=collections.defaultdict(set)
for s,t in se:out[s].add(t)
def reachable(source,target):
 todo=[source];seen=set()
 while todo:
  v=todo.pop()
  if v==target:return True
  if v not in seen:seen.add(v);todo.extend(out[v])
 return False
def stageof(v):
 checked=set()
 while v in world and v not in checked:checked.add(v);v=world[v].get('parentStageId')
 return v
roadmap=own_definition
pairs={(d,RID+':'+s['key']) for s in roadmap['stages'] for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(file.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source','').startswith(RID+':') or x.get('target','').startswith(RID+':')}
assert all(reachable(s,t) for s,t in pairs|rspairs),sorted((s,t) for s,t in pairs|rspairs if not reachable(s,t))
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True}
summary['immutableBase']=immutable.BASE
summary['immutableReadPaths']=len(immutable.READS)
import hashlib
summary['immutableReadPathSha256']=hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()
print(json.dumps(summary,indent=2))
```

### run_lean.py

```python
from pathlib import Path
import sys,subprocess,hashlib,json,datetime
s=Path(__file__).parent;b=Path(sys.argv[2]);p=s/sys.argv[1];logname=sys.argv[3]
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=b/'.lake/packages/mathlib',text=True).strip()=='082e2d37e8b0463410cdb532e111cd43d5a66174'
free=subprocess.check_output(['free','-g'],text=True);available=int(free.splitlines()[1].split()[-1]);receipt=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),file=p.name,sha256=hashlib.sha256(p.read_bytes()).hexdigest(),availableGiB=available,preflight=free)
if available<20:
 receipt['started']=False;(s/(logname+'.receipt.json')).write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt));sys.exit(75)
with (s/(logname+'.log')).open('w') as log:
 log.write(free);log.flush();r=subprocess.run(['/usr/bin/time','-v','timeout','1200','lake','env','lean',str(p)],cwd=b,stdout=log,stderr=subprocess.STDOUT)
receipt.update(started=True,exit=r.returncode);(s/(logname+'.receipt.json')).write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt));sys.exit(r.returncode)
```
