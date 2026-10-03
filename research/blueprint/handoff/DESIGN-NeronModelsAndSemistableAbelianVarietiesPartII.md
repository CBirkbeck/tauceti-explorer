# DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII: conductor generators checkpoint

Codex — codex-J6LwjP; Refs #3378. Claim comment5969699627 was confirmed by the bot before work; the complete issue was read and reread after confirmation. Mathematical input `daf5fe58be0122cf332a06b472715f01b0e7be5c`; publication input `99a13a08145478c56bee6f65460849f58d59a29e`. Incoming peer PR #5993 head `726ed87998e6915dc4da38a3996e7ff64af7e167` and its historical archive were publicly recovered:42 authenticated artifacts, five deliverables and five helper hashes. Its actual immutable verifier was executed successfully. Historical audits remain attributed; this does not claim a fresh manual review of all562 inherited proofs.

The packet remains partial with565 nodes (17 definitions,440 lemmas,26 theorems,9 comparisons,73 constructions),340 raw API items,341 raw tests,29 planets,379 indexed baseline citations,17 gaps,23 requests,78 route rows and21 retained source findings. All seven stages remain partial and every implementationStatus remains unchecked. All562 incoming contracts survive and561 whole node objects are identical. Only conductor-finite-localization receives appended prerequisites, proof steps and four tests. The reserved key/ferrand-pushouts contract, all incoming route and coverage records, source issues and requests are unchanged. Only G.0's roadmap description gains a paragraph; the reader prepends the new exact statements and preserves its entire prior document.

Three new conductor-specific supporting lemmas establish: membership can be tested on a finite spanning family; separately chosen denominators can be multiplied to one conductor denominator; and the native fraction a/t belongs to the extended conductor ideal precisely when each generator admits such a denominator. The first proof uses the native quotient B/(A·1) and the inverse image of zero under b↦a·[b]. The second explicitly factors the finite product into s_i times its complementary product, using closure of im f under multiplication by f(A). No denominator is cancelled. The third imports the existing IsLocalization fraction/ideal theorem. Arbitrary commutative coefficient algebras, noninjective maps, empty spanning families, zero rings and nilpotent denominators are retained.

Four typed tests distinguish a nonspanning family for F₂→F₂×F₂, coefficient2 and nilpotent denominator2 for the diagonal Z/4 algebra, the empty spanning family of ℤ→Z/1, and the actual cusp A=k+X²k[X] after inverting its actual element X². The cusp test consumes the incoming specified finite normalization spanning family{1,X} and produces actual image-subring witnesses.

This proves native membership in the ideal extended from the original conductor. It does not identify that ideal with the recomputed conductor of the localized B-algebra or with an affine sheaf restriction. The conductor-specific localization target retains those exact comparisons. Generic finite-module flat-annihilator theory remains requested from SF.0 rather than replanned here. Conductor IdealSheafData, quotient subschemes, structure-sheaf exactness, finite-pushforward H0/H1, P¹/Proj identifications, properness/projectivity, independent I₂ geometry and all family/model/classification obligations remain required. A sectionwise module quotient is not claimed to compute a sheaf cokernel. No existing gap or request is erased.

Fresh bounded source reading: the full displayed statement and proof of Stacks Lemma10.40.4, tag07T8, and Ferrand's introduction on printed p554 identifying conductor and annihilator. The conductor-specific kernel and product-denominator formulas here are explicit deductions. SourceReading.json records retrieval/hash and exact reading extent; no whole-paper claim, PDF or extracted full source is published. All six reviewed R11 library-coverage rows and REV-AUDIT-10 were read, as were the full Ferrand key survey entry and SF.0 supplier stage. All seven stage descriptions were read. The retained AlgebraicCurves and JacobianChallenge style documents were previously read completely in this serial session and guarded unchanged. Eleven new baseline statements and their ambient assumptions were read at exact Mathlib082e2d3 before citation. They are existing kernel, product or ideal/localization operations, not newly planned library targets.

Native.lean freshly passes234 examples and427 axiom audits with no warnings, errors or admissions. Source SHA256 `6cbffc5bec17fe899d15e1e942d317cdfbeb802573b86f887ad92ef6f15752ec`; diagnostic SHA256 `fffdc46b9dd334d04a20f802386e27f3db63a25bfc7ee882ed40aeb3627b49b9`. Sketch.lean freshly checks253 admitted examples and606 admission warnings as its only warnings; source SHA256 `280cc92883c5e14fb1acd3638865256b27260a53850107a1079c7df2697ba466`, diagnostic SHA256 `13b9e56f150cc78f30dec396c5169efc19b5bbc8a7629a181d18fe329ef1fcd6`. New native and admitted headers match mechanically. The exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d were checked. Both runs were serial in an already existing build, with at least20GiB available and a1200-second cap. No project, cache download, library build or language server was started. The full canonical Tau Ceti-importing suggested file is UNCOMPILED: no existing complete build at prescribed Tau Ceti f790474 was available. Mathlib-only artifacts preserve the inherited exact consumed Tau Ceti source excerpt and its original import-envelope qualifications.

Actual indexed check_blueprint returns zero errors and warnings. Actual intake file_problems/auto_refusals and the inherited source-issue validation envelope pass. Immutable candidate/control atlas assembly checks acyclic stage, own and scoped graphs, all69 required stage paths, no own unresolved or skipped/pending links, and identical foreign roadmap/stage objects and stage edges. The45 unrelated preexisting unreachable restructuring paths remain recorded. Governing files, reviewed audit, reservations, existing style documents, actual checkers and all five original deliverables are byte-identical between mathematical and publication inputs.

Resume by transporting the finite image-membership criterion through the native localized-B map to prove the full recomputed-conductor equality, then identify basic-open restrictions and assemble the actual conductor IdealSheafData. Preserve the original arbitrary-section and general scheme/algebraic-space key scope and every source-contract obligation.

The suggested file ends with an inert compressed JSON archive of exact UTF-8 sources, logs, receipts, input controls, plans and reports. Every artifact is SHA256 authenticated. ReplayManifest.json binds the six Python helpers below. Recover only from the full immutable PR head into an empty directory, then replay checks from an existing repository clone containing the recorded trees:

```sh
PUBLIC_RECOVERY=1 python3 recover.py evidence EXACT_PR_HEAD
python3 evidence/verify.py evidence DECLARATIONS_TSV
NERON_VALIDATE_BASE=99a13a08145478c56bee6f65460849f58d59a29e python3 evidence/graph.py evidence
python3 evidence/run-lean.py Native.lean EXISTING_BUILD replay-native
python3 evidence/run-lean.py Sketch.lean EXISTING_BUILD replay-sketch
```

The optional compilation commands obey the same exact-build, memory and serial guards. Verification reads immutable Git blobs without a repository snapshot. All referenced evidence becomes public; disposable scratch is removed after successful public-head recovery.

### recover.py

```python
"""Recover and authenticate exact public-head conductor evidence; no Lean or repository copy."""
from pathlib import Path
import base64,hashlib,json,os,re,subprocess,sys,zlib
S=Path(sys.argv[1]).resolve();HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD);S.mkdir(parents=True,exist_ok=True)
RID='NeronModelsAndSemistableAbelianVarietiesPartII';FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def read(f):
 if os.environ.get('PUBLIC_RECOVERY')=='1':return subprocess.check_output(['gh','api','repos/CBirkbeck/tauceti-explorer/contents/'+f+'?ref='+HEAD,'-H','Accept: application/vnd.github.raw+json'])
 return subprocess.check_output(['git','show',HEAD+':'+f])
def save(n,b):
 assert Path(n).name==n and n not in {'.','..'};assert not (S/n).exists();(S/n).write_bytes(b)
head=[read(f) for f in FILES];pub=head[3].decode();m=re.search(r'\n/- CONDUCTOR_GENERATOR_ARCHIVE_J6LwjP\n(.*?)\nEND CONDUCTOR_GENERATOR_ARCHIVE_J6LwjP -/\n$',pub,re.S);assert m
items=json.loads(zlib.decompress(base64.b64decode(m.group(1))))
for name,item in items.items():
 b=item['text'].encode();assert hashlib.sha256(b).hexdigest()==item['sha256'],name;save(name,b)
assert pub[:m.start()]==(S/'Canonical.lean').read_text()
for n,b in zip(['Candidate-roadmap.json','Candidate.json','Reader.md','Published.lean','Handoff.md'],head):save(n,b)
save(RID+'.json',head[1])
for name in ['recover.py','verify.py','immutable.py','graph.py','run-lean.py','signatures.py']:
 m=re.search(r'### '+re.escape(name)+r'\n\n```python\n(.*?)\n```\n',head[4].decode(),re.S);assert m,name;save(name,(m.group(1)+'\n').encode())
for name,h in json.loads((S/'ReplayManifest.json').read_text()).items():assert hashlib.sha256((S/name).read_bytes()).hexdigest()==h,name
print(json.dumps(dict(publicHead=HEAD,authenticatedArtifacts=len(items),currentDeliverables=5,authenticatedHelpers=6,allHashesMatch=True,publicGitHubReads=os.environ.get('PUBLIC_RECOVERY')=='1'),indent=2))
```

### verify.py

```python
"""Exact incoming contracts, typed headers, authenticated diagnostics and actual immutable checks."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
R=Path.cwd();S=Path(sys.argv[1]).resolve();RID='NeronModelsAndSemistableAbelianVarietiesPartII'
MATH=(S/'mathematical-base.txt').read_text().strip();BASE=os.environ.get('NERON_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
proposal=dict(zip(FILES,[(S/n).read_text() for n in ['Candidate-roadmap.json','Candidate.json','Reader.md','Published.lean','Handoff.md']]))
sha=lambda b:hashlib.sha256(b).hexdigest()
def blob(c,f):return subprocess.check_output(['git','show',c+':'+f])
p=json.loads(proposal[FILES[1]]);old=json.loads((S/'OriginalPacket.json').read_text());plan=json.loads((S/'Plan.json').read_text());nodes={n['id']:n for n in p['nodes']}
assert len(old['nodes'])==562 and len(nodes)==565
assert p['nodes'][:562]==[nodes[n['id']] for n in old['nodes']]
assert [n['id'] for n in p['nodes'][562:]]==plan['newNodes']
changed={}
for a in old['nodes']:
 b=nodes[a['id']];allowed=plan['changedExisting'].get(a['id'],[])
 assert {k:v for k,v in a.items() if k not in allowed}=={k:v for k,v in b.items() if k not in allowed}
 for k in allowed:assert b[k][:len(a.get(k,[]))]==a.get(k,[])
 if a!=b:changed[a['id']]=allowed
assert changed==plan['changedExisting']
assert set(p)==set(old)|{'conductorGeneratorContinuation'}
for k in old:
 if k not in ['nodes','summary','sources','baseline']:assert p[k]==old[k],k
assert p['summary'].startswith(old['summary']) and p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:-11]==old['baseline']['declarations']
assert p['baseline']['declarations'][-11:]==plan['newBaseline']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
rd=json.loads(proposal[FILES[0]]);rold=json.loads((S/'OriginalRoadmap.json').read_text());assert rd['stages'][1:]==rold['stages'][1:]
assert {k:v for k,v in rd.items() if k!='stages'}=={k:v for k,v in rold.items() if k!='stages'}
assert rd['stages'][0]['description'].startswith(rold['stages'][0]['description'])
assert {k:v for k,v in rd['stages'][0].items() if k!='description'}=={k:v for k,v in rold['stages'][0].items() if k!='description'}
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes']) and all(c['status']=='partial' for c in p['coverage'])
assert (len(p['sourceIssues']),len(p['routeCoverage']),len(p['gaps']),len(p['requests']))==(21,78,17,23)
for f,n in zip(FILES,['OriginalRoadmap.json','OriginalPacket.json','OriginalReader.md','OriginalSuggested.lean','OriginalHandoff.md']):assert blob(MATH,f)==(S/n).read_bytes(),f
assert proposal[FILES[2]].endswith((S/'OriginalReader.md').read_text())
for n in p['nodes'][562:]:assert n['statement'] in proposal[FILES[2]] and n['declarationName'] in proposal[FILES[2]]
for name,kind,statement in plan['newTests']:assert 'ConductorGenerators.'+name in proposal[FILES[2]] and statement in proposal[FILES[2]]
for f,t in proposal.items():assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),f
sys.path.insert(0,str(S));import signatures
new=(S/'New.lean').read_text();ad=(S/'NewAdmitted.lean').read_text();assert new==(S/'NewProofs.lean').read_text()+'\n'+(S/'NewTests.lean').read_text()
assert signatures.admit(new)==ad and signatures.headers(new)==signatures.headers(ad) and len(signatures.declarations(new))==7
canonical=(S/'Canonical.lean').read_text();original=(S/'OriginalSuggested.lean').read_text();ix=original.index('import ')
assert canonical==original[:ix]+'import Mathlib.RingTheory.Localization.Ideal\n'+original[ix:]+'\n'+ad
assert proposal[FILES[3]].startswith(canonical+'\n/- CONDUCTOR_GENERATOR_ARCHIVE_J6LwjP\n')
native=(S/'Native.lean').read_text();assert native.startswith((S/'IncomingNative.lean').read_text()+'\n'+new+'\n')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',native)
assert sha((S/'IncomingNative.lean').read_bytes())=='6523362bfd9030ba7737c1ce489f3354794d2f6420409d22855a0ce2ac0b0988'
assert (S/'Sketch.lean').read_text()==(S/'IncomingSketch.lean').read_text()+'\n'+ad
comp={}
for prefix,filename,warnings,audits,examples in [('native','Native.lean',0,427,234),('sketch','Sketch.lean',606,0,253)]:
 rec=json.loads((S/(prefix+'.receipt.json')).read_text());log=(S/(prefix+'.diag')).read_text();data=(S/filename).read_bytes()
 assert rec['exit']==0 and rec['availableGiB']>=20 and rec['timeoutSeconds']==1200
 assert rec['sha256']==sha(data) and rec['diagnosticsSha256']==sha(log.encode())
 assert ': error' not in log and 'Exit status: 0' in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==warnings
 assert len(re.findall(r'^example\b',data.decode(),re.M))==examples
 if prefix=='native':
  au=re.findall(r"'([^']+)' depends on axioms:\s*\[([^]]*)\]",log);assert len(au)==audits
  for name,axs in au:assert set(x.strip() for x in axs.replace('\n',' ').split(',') if x.strip())<={'propext','Classical.choice','Quot.sound'}
  assert {'TauCeti.GenusOne.FerrandPushout.'+n for n in ['conductor_mem_iff_generators','conductor_common_denominator','conductor_fraction_mem_iff_generators']}<={name for name,_ in au}
 comp[prefix]=rec
GUARDS=['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/expansion/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','data/library-coverage.json','research/blueprint/reviews/REV-AUDIT-10.md','data/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/reserved-ids.json','research/blueprint/keydefs/owners.json','content/tau-ceti/JacobianChallenge/README.md','content/tau-ceti/AlgebraicCurves/README.md','scripts/check_blueprint.py','scripts/source_issues.py','scripts/build.py','scripts/blueprints.py','research/blueprint/intake.py']
for f in GUARDS+FILES:assert blob(MATH,f)==blob(BASE,f),('changed input',f)
os.environ['NERON_VALIDATE_BASE']=BASE;import immutable;immutable.install();sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,checker=check_blueprint.check(S/(RID+'.json'),check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for f,t in proposal.items() for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,FILES,False,{'codex-J6LwjP'},set());assert not problems and not refusals,(problems,refusals)
import check_errata
errata=check_errata.check({'roadmapId':RID,'protocol':'errata-v1','sourceIssues':p['sourceIssues'],'sourceVersions':[dict(kind=('preprint' if x['id']=='schroer' else 'author copy'),url=x['url'],read=x.get('accessed'),sha256=x.get('sha256'),attribution='Inherited source record; no fresh erratum audit claimed') for x in old['sources'] if x['id'] in {f['source'] for f in p['sourceIssues']}]},RID);assert not errata,errata
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=562,preservedWholeNodes=561,changedExisting=changed,newNodes=3,newApi=0,newTests=4,checker={k:v for k,v in checker.items() if k!='packet'},compilation=comp,canonicalSha256=sha(canonical.encode()),fullCanonicalCompiled=False,guardsUnchanged=len(GUARDS)+5,intakeProblems=problems,intakeRefusals=refusals,erratumErrors=errata),indent=2))
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
BASE = os.environ.get('NERON_VALIDATE_BASE', 'daf5fe58be0122cf332a06b472715f01b0e7be5c')
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
    return blob(key).decode(('utf-8' if encoding in (None, 'locale') else encoding), errors or 'strict')

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
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(('utf-8' if encoding in (None, 'locale') else encoding), errors or 'strict'))

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
R=Path.cwd();S=Path(sys.argv[1]);RID='NeronModelsAndSemistableAbelianVarietiesPartII';STEM=RID
sys.path.insert(0,str(R/'scripts'))
p=json.loads((S/'Candidate.json').read_text())
old=json.loads((S/'Incoming-packets.json').read_text())
nodes={n['id']:n for n in p['nodes']}
own_definition=json.loads((S/'Candidate-roadmap.json').read_text())
old_definition=json.loads((S/'Incoming-roadmaps.json').read_text())
import immutable
immutable.install()
import check_blueprint
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'

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
oldse={(e['source'],e['target']) for e in b['stageEdges']}
assert a['stageEdges']==b['stageEdges']
assert se==oldse
assert oldse<=se
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
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source') in stageids and x.get('target') in stageids}
assert all(reachable(s,t) for s,t in pairs),sorted((s,t) for s,t in pairs if not reachable(s,t))
missing=sorted((s,t) for s,t in rspairs if not reachable(s,t))
assert not any(s.startswith(RID+':') or t.startswith(RID+':') for s,t in missing),missing
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert set(ar)==set(br)
assert all(ar[x]==br[x] for x in br if x!=RID)
ast={s['id']:s for s in a['stages']};bst={s['id']:s for s in b['stages']}
assert set(ast)==set(bst)
assert all(ast[x]==bst[x] for x in bst if not x.startswith(RID+':'))
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingMissingRestructurePairs':len(missing),'otherMissingRestructurePairsSha256':__import__('hashlib').sha256(json.dumps(missing).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'wholeForeignRoadmapsMatch':True,'wholeForeignStagesMatch':True,'wholeStageEdgesMatch':True,'stageEdgesUnchanged':se==oldse,'addedStageEdges':sorted(se-oldse),'removedStageEdges':sorted(oldse-se)}
import hashlib
summary['auditBase']=immutable.BASE
summary['gitBlobReadCount']=len(immutable.READS)
summary['gitBlobReadsSha256']=hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()
print(json.dumps(summary,indent=2))
```

### run-lean.py

```python
"""Optional serial replay in an existing exact Mathlib build; never creates or builds a project."""
from pathlib import Path
import hashlib,json,subprocess,sys,datetime
S=Path(__file__).resolve().parent;file=S/sys.argv[1];B=Path(sys.argv[2]).resolve();stem=sys.argv[3]
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'.lake/packages/mathlib',text=True).strip()=='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=B/'.lake/packages/mathlib',text=True).strip()
version=subprocess.check_output(['lake','env','lean','--version'],cwd=B,text=True).strip()
assert '4.34.0-rc2' in version and '6a10ac8c22beadecabdbb0919c2b50214762f91d' in version
free=subprocess.check_output(['free','-g'],text=True);available=int(free.splitlines()[1].split()[-1]);receipt=dict(file=file.name,sha256=hashlib.sha256(file.read_bytes()).hexdigest(),availableGiB=available,time=datetime.datetime.now(datetime.timezone.utc).isoformat(),timeoutSeconds=1200,leanVersion=version)
if available<20:print(json.dumps({**receipt,'started':False}));sys.exit(75)
with (S/(stem+'.raw')).open('w') as log:
 log.write(free);log.flush();r=subprocess.run(['/usr/bin/time','-v','timeout','1200','lake','env','lean',str(file)],cwd=B,stdout=log,stderr=subprocess.STDOUT)
t=(S/(stem+'.raw')).read_text().replace(str(S)+'/', 'REPLAY/');(S/(stem+'.diag')).write_text(t);(S/(stem+'.raw')).unlink()
receipt.update(started=True,exit=r.returncode,diagnosticsSha256=hashlib.sha256(t.encode()).hexdigest());(S/(stem+'.receipt.json')).write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt));sys.exit(r.returncode)
```

### signatures.py

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
