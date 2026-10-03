# N24: infinite affine coinvariants checkpoint

Worker: Codex — codex-a71f92. Issue3403, confirmed claim5969811394 / bot5969812772.
Mathematical input: 99a13a08145478c56bee6f65460849f58d59a29e. Publication/control input: f68f2769c60a6d1761f2cac677d1c71619049a43; the owned files and governing controls are byte-identical between these inputs. Continue from the merged finite-invariant PR5996, not directly from PR5991. The native, canonical and admitted incoming fragments and five replay helpers were SHA-authenticated from the public input before work.

All 396 incoming nodes are whole-object identical. Append nine contracts: two constructions, five lemmas and two theorems, six indexed API items and twelve indexed tests. The new nodes identify actual universal infinite affine coinvariants with the coefficient image, including wild and nonreduced rings, without cancelling a root. Native finite-level coefficient extraction, finite-stage injectivity and the monic power basis supply the proof. The native equalizer algebra is equivalent to A; the original unity-root coaction has the same coinvariants. This is not a geometric quotient/coarse-moduli proof.

Current packet: 405 nodes; kinds {'construction': 70, 'definition': 11, 'comparison': 11, 'lemma': 273, 'theorem': 39, 'application': 1}; 327 raw API outlines, 332 raw indexed tests, 40 planets, 251 baseline citations, eight gaps and thirteen requests. The reviewed aggregate has no PartII audit row; FA.2 target/evidence/duplication records were freshly read, with the earlier full parent audit reading retained. The personally read JacobianChallenge and StableReduction upstream documents are byte-identical to the earlier continuous-session input. All ten stages remain partial; implementation status remains unchecked. The reserved root-stack key, both source routes, all findings/versions and foreign owners are retained.

Checks: admission-free pinned-Mathlib native replay has 257 examples, 308 clean axiom audits, zero errors/warnings/admissions; source SHA256 41bedaaf3e1a8883c8f960a14ca6e63ef662817d0c1038ff22df4ebb19a32483. It ran in 71.29s, peak 4143468KiB, with 38GiB available at the same-process guard. The separate admitted Mathlib typing projection has 131 expected admission warnings and 231 inherited clean audits, zero errors/other warnings; source SHA256 be912a50d6d22ea77ff01c3e2ba32fef5ebb995363dadb753f1dee2d6549246b. It ran in 60.79s, peak 4012272KiB, starting with 37GiB available. Lean checks were serial, from an existing exact-pinned Mathlib build, under a 1200-second timeout; no Lake setup, update, cache, build or language server. The complete canonical Tau Ceti file is UNCOMPILED: no compiled full import set at f790474 was available. No mismatched Tau build was used.

The actual immutable check_blueprint, actual intake file/ownership rules and assembled stage/scoped declaration graphs are checked by the recipes below. Original controls and every incoming contract are checked byte-for-byte or whole-object; unrelated atlas records are not edited. The graph checker records unrelated preexisting unreachable restructuring pairs instead of repairing another job's data.

Source freshly read: Talpo–Vistoli arXiv1410.1164v2 complete printed/PDF pp.14–16, including the grading action, Lemma3.7 degree-zero proof, Proposition3.5/cofinality, Lemma3.12 and Proposition3.10 proofs, Corollary3.13. Fresh download hash 92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2. This is not a fresh whole-paper or errata audit. The concrete named adapters are authored deductions; their exact pinned native dependencies were read before citation.

Resume: complete full exact-pin Tau Ceti typing and the explicitly stated positive-divisibility/higher-universe transports; construct coherent root-object groupoid reindexing, affine Spec limits, fpqc frame torsors, quotient/DVR/Kummer comparisons and geometric coarse universality from the recorded suppliers. Infinite algebra coinvariants are settled by this checkpoint's separate proof evidence; these geometric targets are not. Preserve all eight gaps, thirteen requests, the all-roots-of2 non-fppf distinction and both source routes.

## Immutable recovery and serial verification

The suggested-file comment contains 18 SHA256-authenticated UTF-8 artifacts, including the actual incoming proof fragments, both checked sources/logs/receipts, source receipts and a helper hash manifest. The following six standalone Python recipes are authenticated by that manifest. Their source, diagnostics and arguments contain no private machine paths. All local recovery writes use apply_patch. No repository snapshot is created.

Save the recipes below to an owned disk directory. From an existing read-only repository with the mathematical input and exact PR head objects available, run:

```sh
python3 recover.py evidence EXACT_PR_HEAD
python3 evidence/verify.py evidence DECLARATIONS_TSV
python3 evidence/graph.py evidence
python3 evidence/runcheck.py evidence EXISTING_MATHLIB_SOURCE PINNED_LEAN Native.lean
python3 evidence/runcheck.py evidence EXISTING_MATHLIB_SOURCE PINNED_LEAN MathlibTyping.lean
```

For GitHub raw reads, recover.py also supports PUBLIC_RECOVERY=1 with an existing gh connection. Do not run concurrent Lean checks. Both execute only an existing pinned build, enforce at least 20 GiB available in the same process immediately before the compiler and apply a 1200-second timeout. Complete Tau Ceti canonical-file compilation is not claimed by these commands. To validate against a later immutable world, set ROOTS_VALIDATE_BASE to its commit; verify.py rejects changed owned inputs or governing controls. Graph controls compare that same world with the unmodified incoming packet. Small preexisting unrelated restructuring reachability differences are reported, not hidden.

### recover.py

```python
"""Recover immutable public candidates and SHA-authenticated inert replay evidence."""
from pathlib import Path
import sys,subprocess,json,re,zlib,base64,hashlib,os
S=Path(sys.argv[1]).resolve();S.mkdir(exist_ok=True);ref=sys.argv[2]
RID='FunctionFieldArithmeticPartII';MATH='99a13a08145478c56bee6f65460849f58d59a29e'
def read(c,p):
 if os.environ.get('PUBLIC_RECOVERY')=='1':
  return subprocess.check_output(['gh','api','repos/CBirkbeck/tauceti-explorer/contents/'+p+'?ref='+c,'-H','Accept: application/vnd.github.raw+json']).decode()
 return subprocess.check_output(['git','show',c+':'+p],text=True)
def put(n,t):
 assert n==Path(n).name and n not in {'.','..'}
 p=S/n
 if p.exists():assert p.read_text()==t,n;return
 subprocess.run(['apply_patch'],input='*** Begin Patch\n*** Add File: '+str(p)+'\n'+''.join('+'+x+'\n' for x in t.splitlines())+'*** End Patch\n',text=True,check=True,stdout=subprocess.DEVNULL)
 assert p.read_text()==t,n
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
pub=[read(ref,f) for f in FILES]
for n,t in zip(['Candidate-roadmap.json','Candidate.json','Reader.md','Published.lean','Handoff.md'],pub):put(n,t)
for f,n in zip(FILES,['Input-roadmap.json','Input-packet.json','Input-reader.md','Input-published.lean','Input-handoff.md']):put(n,read(MATH,f))
m=re.search(r'\n/- INFINITE_COINVARIANT_ARCHIVE_N24\n([A-Za-z0-9+/=\n]+)\nEND INFINITE_COINVARIANT_ARCHIVE_N24 -/\n',pub[3]);assert m
items=json.loads(zlib.decompress(base64.b64decode(m[1])))
for n,v in items.items():
 assert hashlib.sha256(v['text'].encode()).hexdigest()==v['sha256'],n
 put(n,v['text'])
assert pub[3][:m.start()]==items['Canonical.lean']['text']
for n,h in json.loads(items['ReplayManifest.json']['text']).items():
 code=re.search(r'### '+re.escape(n)+r'\n\n\x60\x60\x60python\n(.*?)\n\x60\x60\x60',pub[4],re.S)
 assert code,n
 t=code[1]+'\n';assert hashlib.sha256(t.encode()).hexdigest()==h,n;put(n,t)
print(json.dumps({'publicHead':ref,'mathematicalBase':MATH,'verifiedArtifacts':len(items),'currentDeliverables':5,'originalInputs':5,'helpers':len(json.loads(items['ReplayManifest.json']['text'])),'allHashesMatch':True},indent=2))
```

### verify.py

```python
"""Check original contracts, pinned sources, real immutable checker and intake."""
from pathlib import Path
import sys,json,os,re,subprocess,hashlib,ast
S=Path(sys.argv[1]).resolve();R=Path.cwd();RID='FunctionFieldArithmeticPartII'
MATH='99a13a08145478c56bee6f65460849f58d59a29e'
BASE=os.environ.get('ROOTS_VALIDATE_BASE',MATH);os.environ['ROOTS_VALIDATE_BASE']=BASE
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
names=['Candidate-roadmap.json','Candidate.json','Reader.md','Published.lean','Handoff.md']
proposal={f:(S/n).read_text() for f,n in zip(FILES,names)}
p=json.loads(proposal[FILES[1]]);old=json.loads((S/'Input-packet.json').read_text());plan=json.loads((S/'Plan.json').read_text())
assert len(old['nodes'])==396 and len(p['nodes'])==405
assert p['nodes'][:396]==old['nodes']
assert [n['id'] for n in p['nodes'][396:]]==plan['newNodes']
assert {k:v for k,v in p.items() if k not in ['nodes','sources','summary','baseline']}=={k:v for k,v in old.items() if k not in ['nodes','sources','summary','baseline']}
assert p['summary'].startswith(old['summary']) and p['sources'][:-2]==old['sources']
assert p['baseline']['declarations'][:-3]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
rd=json.loads(proposal[FILES[0]]);rold=json.loads((S/'Input-roadmap.json').read_text())
assert {k:v for k,v in rd.items() if k!='stages'}=={k:v for k,v in rold.items() if k!='stages'}
for a,b in zip(rold['stages'],rd['stages']):
 if a['key']=='RS.2':
  assert b['description'].startswith(a['description'])
  assert {k:v for k,v in a.items() if k!='description'}=={k:v for k,v in b.items() if k!='description'}
 else:assert a==b
assert proposal[FILES[2]].endswith((S/'Input-reader.md').read_text())
assert proposal[FILES[4]].endswith((S/'Input-handoff.md').read_text())
for n in p['nodes'][396:]:
 assert n['statement'] in proposal[FILES[2]] and n['declarationName'] in proposal[FILES[2]]
 for x in n.get('api',[])+n.get('tests',[]):assert x['name'] in proposal[FILES[2]]
for f,t in proposal.items():assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),f
def headers(t):
 out=[]
 for m in re.finditer(r'^(?:def|lemma|theorem|example)\b',t,re.M):
  depth=0
  for i in range(m.start(),len(t)):
   if t[i] in '([{⟨':depth+=1
   elif t[i] in ')]}⟩':depth-=1
   if depth==0 and t.startswith(':=',i) and not re.match(r'\s*let\s+',t[m.start():i].split('\n')[-1]):out.append(' '.join(t[m.start():i].split()));break
  else:raise AssertionError('missing assignment')
 return out
proof=(S/'NewProofs.lean').read_text();tests=(S/'NewTests.lean').read_text();admitted=(S/'NewAdmitted.lean').read_text();native=(S/'Native.lean').read_text();canonical=(S/'Canonical.lean').read_text()
assert headers(admitted)==headers(proof)+headers(tests)
assert len(headers(proof))==15 and len(headers(tests))==12
assert native.startswith((S/'Previous-Native.lean').read_text()+proof+tests)
assert not re.search(r'\b(?:sorry|admit|axiom)\b',native)
assert canonical==(S/'Previous-Canonical.lean').read_text()+admitted
assert (S/'MathlibTyping.lean').read_text()==(S/'Previous-MathlibTyping.lean').read_text()+admitted
assert len(re.findall(r'^example\b',native,re.M))==257
assert proposal[FILES[3]].startswith(canonical+'\n/- INFINITE_COINVARIANT_ARCHIVE_N24\n')
sha=lambda t:hashlib.sha256(t.encode()).hexdigest()
resources={}
for name,expected,audits in [('Native',0,308),('MathlibTyping',131,231)]:
 rec=json.loads((S/(name+'.receipt.json')).read_text());log=(S/(name+'.log')).read_text()
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_text()) and rec['logSha256']==sha(log)
 assert rec['exitStatus']==rec['errors']==0 and rec['warnings']==rec['admissionWarnings']==expected
 assert rec['availableGiBBefore']>=20 and rec['elapsedSeconds']<1200 and rec['axiomAudits']==audits
 assert log.count('warning:')==expected and 'error:' not in log and 'error(' not in log
 assert not re.search(r'/(?:home|tmp|Users)/',log)
 resources[name]=rec
audits=re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",(S/'Native.log').read_text(),re.S)
assert len(audits)==308
for n,a in audits:assert set(x.strip() for x in a.split(','))<={'propext','Classical.choice','Quot.sound'},n
assert set(plan['newNames'])<={n for n,_ in audits}
def ref(c,f):return subprocess.check_output(['git','show',c+':'+f],cwd=R,text=True)
for path,key in zip(FILES,['roadmap','packet','reader','published','handoff']):
 suffix={'roadmap':'.json','packet':'.json','reader':'.md','published':'.lean','handoff':'.md'}[key]
 assert ref(MATH,path)==(S/('Input-'+key+suffix)).read_text(),path
GUARDS=['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/expansion/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','data/library-coverage.json','data/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/keydefs/owners.json','research/blueprint/reserved-ids.json','scripts/check_blueprint.py','scripts/source_issues.py','scripts/build.py','scripts/blueprints.py','research/blueprint/intake.py']
for f in GUARDS+FILES:assert ref(MATH,f)==ref(BASE,f),('changed control',f)
sys.path.insert(0,str(S));import immutable_view
for f,v in proposal.items():immutable_view.CACHE[f]=v.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,check=check_blueprint.check(R/FILES[1],check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
tree=ast.parse((R/'research/blueprint/intake.py').read_text());picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in {'file_problems','auto_refusals','own_files','independent_of'}]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for f,v in proposal.items() for x in env['file_problems'](f,v)]
refusals=env['auto_refusals'](job,list(proposal),False,{'codex-a71f92'},set());assert not problems and not refusals,(problems,refusals)
print(json.dumps({'base':BASE,'preservedWholeNodes':396,'newNodes':9,'newApi':6,'newTests':12,'checker':{k:v for k,v in check.items() if k!='packet'},'compilation':resources,'canonicalExecution':'UNCOMPILED: no existing full Tau Ceti build at exact pin.','guardsUnchanged':len(GUARDS)+5,'intakeProblems':problems,'intakeRefusals':refusals},indent=2))
```

### immutable_view.py

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
BASE = os.environ.get('ROOTS_VALIDATE_BASE', '99a13a08145478c56bee6f65460849f58d59a29e')
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
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'));import build,blueprints,check_blueprint
RID='FunctionFieldArithmeticPartII';FILES=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Input-packet.json').read_text());rd=json.loads((S/'Candidate-roadmap.json').read_text());rold=json.loads((S/'Input-roadmap.json').read_text());nodes={n['id']:n for n in p['nodes']}
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=RID];documents[RID]=FILES[2]
def assemble(candidate,definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(RID,candidate)]),copy.deepcopy(documents),copy.deepcopy([d for d in definitions if d.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,rd);b=assemble(old,rold)
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
pairs={(d,s['id']) for s in a['stages'] if s['id'].startswith(RID+':') for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(file.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source') in stageids and x.get('target') in stageids}
assert all(reachable(s,t) for s,t in pairs),sorted((s,t) for s,t in pairs if not reachable(s,t))
missing_restructures=sorted((s,t) for s,t in rspairs if not reachable(s,t))
assert not any(s.startswith(RID+':') or t.startswith(RID+':') for s,t in missing_restructures),missing_restructures
# Stage edges are identical to the incoming control, so these unrelated preexisting paths are unchanged.
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
assert {k:v for k,v in ar.items() if k!=RID}=={k:v for k,v in br.items() if k!=RID}
assert {x['id']:x for x in a['stages'] if not x['id'].startswith(RID+':')}=={x['id']:x for x in b['stages'] if not x['id'].startswith(RID+':')}
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingUnreachableRestructurePairs':len(missing_restructures),'otherUnreachableRestructurePairListSha256':hashlib.sha256(json.dumps(missing_restructures).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True}

summary['worldCommit']=immutable_view.BASE
summary['foreignRoadmapsAndStagesUnchanged']=True
summary['immutableInputHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
print(json.dumps(summary,indent=2))
```

### compile.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','MathlibTyping.lean'}
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip()==pin
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.34.0-rc2'
version=subprocess.check_output([str(lean),'--version'],text=True).strip()
assert '4.34.0-rc2' in version,version
libs=[mathlib/'.lake/build/lib/lean'];assert libs[0].is_dir()
packages=[];omitted=[]
for item in json.loads((mathlib/'lake-manifest.json').read_text())['packages']:
 package=mathlib.parent/item['name'];lib=package/'.lake/build/lib/lean'
 if not lib.is_dir():
  assert item['name']=='Cli',item['name']
  omitted.append('Cli: no compiled library directory; not in either checked import cone')
  continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=package,text=True).strip()==item['rev'],item['name']
 libs.append(lib);packages.append(item['name'])
free=subprocess.check_output(['free','-g'],text=True)
available=int(free.splitlines()[1].split()[-1])
print(json.dumps({'preflight':'serial existing pinned build','availableGiB':available,'packages':packages,'omitted':omitted,'leanVersion':version}),flush=True)
if available<20:print('Memory guard refused compilation.',flush=True);sys.exit(75)
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs)
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),str(out/name)],env=env)
sys.exit(result.returncode)
```

### runcheck.py

```python
"""Serial checked replay with bounded diagnostics and apply_patch receipt writes."""
from pathlib import Path
import subprocess,sys,hashlib,json,re,time
S=Path(sys.argv[1]);name=sys.argv[4];prefix=name[:-5]
start=time.monotonic()
r=subprocess.run([sys.executable,str(S/'compile.py')]+sys.argv[1:],text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
raw=r.stdout
log=raw.replace(str(S),'<SCRATCH>').replace(sys.argv[2],'<MATHLIB>').replace(sys.argv[3],'<LEAN>')
def put(n,t):
 p=S/n
 if p.exists():
  old=p.read_text()
  if old==t:return
  diff='*** Update File: '+str(p)+'\n@@\n'+''.join('-'+x+'\n' for x in old.splitlines())
 else:diff='*** Add File: '+str(p)+'\n'
 patch='*** Begin Patch\n'+diff+''.join('+'+x+'\n' for x in t.splitlines())+'*** End Patch\n'
 subprocess.run(['apply_patch'],input=patch,text=True,check=True,stdout=subprocess.DEVNULL)
 assert p.read_text()==t,n
pre=json.loads(raw.splitlines()[0]);assert pre['availableGiB']>=20
rss=re.search(r'Maximum resident set size \(kbytes\): (\d+)',raw)
record={'sourceSha256':hashlib.sha256((S/name).read_bytes()).hexdigest(),'logSha256':hashlib.sha256(log.encode()).hexdigest(),'availableGiBBefore':pre['availableGiB'],'elapsedSeconds':round(time.monotonic()-start,2),'maxRssKiB':int(rss[1]) if rss else None,'exitStatus':r.returncode,'errors':raw.count('error:' )+raw.count('error('),'warnings':raw.count('warning:'),'admissionWarnings':raw.count('warning: declaration uses'),'axiomAudits':raw.count('depends on axioms'),'sorryAxReferences':raw.count('sorryAx'),'leanVersion':pre['leanVersion']}
put(prefix+'.log',log);put(prefix+'.receipt.json',json.dumps(record,indent=2)+'\n')
print(json.dumps(record,indent=2))
if r.returncode or record['warnings']!=record['admissionWarnings']:
 print('\n'.join(x for x in log.splitlines() if 'error' in x or 'warning' in x))
sys.exit(r.returncode)
```

---

The previous finite-invariant handoff is preserved below. Its counts and compilation scope belong to that checkpoint, not this one.

# DESIGN-FunctionFieldArithmeticPartII: finite affine invariants checkpoint

Codex — codex-J6LwjP; issue #3403. Claim comment 5969361892 won, confirmed by bot comment 5969363158 before work. Mathematical input `3ee387e53dc2c65264ff1f175fa688080aa8c7a5`; publication input `daf5fe58be0122cf332a06b472715f01b0e7be5c`. Incoming peer PR #5991, head `9626cbbfeead34bb0b426c5520d9514b4e9856cb`, was publicly recovered, hash authenticated and its actual immutable verification helper executed. Historical source audits retain their original attribution; this continuation does not claim a fresh whole-paper or whole-handoff audit.

The packet remains partial: 396 nodes, 40 planets, ten partial stages, eight gaps and thirteen supplier requests. All 392 incoming mathematical contracts survive, with 389 whole nodes identical; only the coarse-space proof route, affine-coaction API/tests/uses and affine-invariant proof prerequisites gain appended material. All existing source coverage, source versions, reservations, key/root-stacks generality, relative evaluation, symplectic route and infinite-root obligations survive unchanged. Only RS.1's roadmap description gains a paragraph; other roadmap fields and stages are identical.

Four nodes (three supporting lemmas and one construction), seven API items and eight typed tests extend the finite affine chart. For every commutative A, arbitrary f and positive n, the actual AdjoinRoot algebra has a diagonal coaction of the native ZMod-n MonoidAlgebra. Existing targetCoordinateEquiv gives coordinates c_s on the diagonal for the coaction and c_s only in row zero for 1 tensor b. Equality is exactly vanishing of all nonzero weights. Expanding the monic power basis proves the existing finite affine-invariants target. The existing coefficient-map injection, rather than a replanned abstraction, gives an actual A-algebra equivalence with the AlgHom.equalizer subalgebra. No invertibility of n, reducedness, field-point test, Noetherian hypothesis or invertibility of f is used. The zero ring is handled explicitly.

Tests exercise characteristic two, the nonzero nilpotent coefficient 2 in Z/4, unique constants, exponent one and zero rings; the equivalence recovers the linear root and nilpotent constant. The reader gives all new statements, prerequisites, proof steps, API, tests and downstream consumers. The construction is used by the existing coarse-space route, but finite ring coinvariance alone does not establish geometric coarse moduli. ROOT-COARSE, R09.5 universal geometry, infinite coinvariants and the routed-paper source contracts remain open. No stage closes and every implementationStatus remains unchecked.

Fresh serial compilation in an already existing build, with at least 20 GiB available and a 1200-second timeout, verified exact Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean 4.34.0-rc2 commit 6a10ac8c22beadecabdbb0919c2b50214762f91d. Native.lean passes 245 examples and 293 axiom audits with zero errors, warnings or admissions. Its source SHA256 is a3ae9da671d80aa845e5d72db0b19de5605c0ebd4293f55f84bd0f7ed88e5d4e; log SHA256 is 16bf758063eec58db6ec57d57fdece3aa8a5f2a257276c15cc3fcf6cc16877cb. MathlibTyping.lean checks exact admitted signature projections with 104 admission warnings, 231 inherited audits and no other warnings or errors. These are separate evidence files, not an implementation claim. The full suggested Tau Ceti file is UNCOMPILED: no existing full build at exact Tau Ceti f790474 was available. No project, cache download, dependency build or language server was started.

Source work was bounded: Talpo–Vistoli arXiv:1410.1164v2, printed pages 14–16, Lemma 3.7's grading argument and Corollary 3.13's affine chart. Fresh pinned-library statements for equalizers, codRestrict, coefficient injection and tensor operations were read before citation; source hashes are archived. The universal finite coefficient argument here is an explicit derivation. The downloaded paper is not redistributed. The reviewed parent FA.2/FA.4/FA.7 library audit and existing coaction/coordinate proofs were checked; retained paper routes and coverage records carry their previous audit status.

Actual indexed check_blueprint reports zero errors and warnings. Exact intake file_problems and auto_refusals pass. Immutable candidate/control atlas assembly verifies acyclic stage, own and scoped graphs, all 87 required stage paths, no own unresolved prerequisites or skipped/pending links, and identical foreign roadmap/stage objects and stage edges. The 45 unrelated preexisting unreachable restructuring pairs are recorded without changing another job's work. Audit, reservation, checker and all five original deliverable inputs are byte-identical between mathematical and publication trees. WORKERS.md changed only to move sources jobs before redteam jobs; its full revised text and exact diff were read, both hashes are recorded in GuardTransition.json, and the current priority-two owned design task is unaffected. All other governing inputs are byte-identical.

Resume with the retained gaps and supplier requests. Use the archived native coordinate and invariant equivalence certificates when developing geometric coarse moduli or the infinite system. Preserve arbitrary sections and positive exponents and the key reservation.

Public recovery: the suggested file ends with a compressed inert JSON archive of exact UTF-8 sources, logs, receipts, input controls, plans and validation reports, each SHA256 authenticated. The five scripts below are authenticated by ReplayManifest.json inside that archive. Recover from the exact PR head, then replay actual immutable checks against its recorded trees; these read Git blobs without making a snapshot. Commands (from an existing repository clone):

```sh
PUBLIC_RECOVERY=1 python3 recover.py evidence EXACT_PR_HEAD
python3 evidence/verify.py evidence DECLARATIONS_TSV
ROOTS_VALIDATE_BASE=daf5fe58be0122cf332a06b472715f01b0e7be5c python3 evidence/graph.py evidence
python3 evidence/run_lean.py evidence EXISTING_BUILD Native.lean ReplayedNative
python3 evidence/run_lean.py evidence EXISTING_BUILD MathlibTyping.lean ReplayedTyping
```

The compilation commands remain subject to the existing exact-pin build, serial execution and memory guard. The recovery command requires an empty destination and authenticated GitHub access. No private filesystem paths appear in the deliverables.

### recover.py

```python
"""Recover authenticated public-head sources, receipts and replay scripts without a clone."""
from pathlib import Path
import base64,hashlib,json,os,re,subprocess,sys,zlib
out=Path(sys.argv[1]).resolve();ref=sys.argv[2];out.mkdir(parents=True,exist_ok=True)
RID='FunctionFieldArithmeticPartII';paths=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def read(p):
 if os.environ.get('PUBLIC_RECOVERY')=='1':return subprocess.check_output(['gh','api','repos/CBirkbeck/tauceti-explorer/contents/'+p+'?ref='+ref,'-H','Accept: application/vnd.github.raw+json'])
 return subprocess.check_output(['git','show',ref+':'+p])
def save(n,b):
 assert Path(n).name==n and n not in {'.','..'};assert not (out/n).exists();(out/n).write_bytes(b)
head=[read(p) for p in paths];pub=head[3].decode();m=re.search(r'\n/- FINITE_INVARIANT_ARCHIVE_J6LwjP\n(.*?)\nEND FINITE_INVARIANT_ARCHIVE_J6LwjP -/\n$',pub,re.S);assert m
items=json.loads(zlib.decompress(base64.b64decode(m.group(1))))
for name,item in items.items():
 b=item['text'].encode();assert hashlib.sha256(b).hexdigest()==item['sha256'],name;save(name,b)
assert pub[:m.start()]==(out/'Canonical.lean').read_text()
for n,b in zip(['Candidate-roadmap.json','Candidate.json','Reader.md','Published.lean','Handoff.md'],head):save(n,b)
save(RID+'.json',head[1])
for name in ['recover.py','verify.py','immutable_view.py','graph.py','run_lean.py']:
 m=re.search(r'### '+re.escape(name)+r'\n\n```python\n(.*?)\n```\n',head[4].decode(),re.S);assert m,name;save(name,(m.group(1)+'\n').encode())
ledger=json.loads((out/'ReplayManifest.json').read_text())
for n,h in ledger.items():assert hashlib.sha256((out/n).read_bytes()).hexdigest()==h,n
print(json.dumps(dict(publicHead=ref,authenticatedArtifacts=len(items),currentDeliverables=5,authenticatedHelpers=5,allHashesMatch=True,publicGitHubReads=os.environ.get('PUBLIC_RECOVERY')=='1'),indent=2))
```

### verify.py

```python
"""Validate exact current proposal, immutable public inputs, headers and proof receipts."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();RID='FunctionFieldArithmeticPartII'
MATH=(S/'mathematical-base.txt').read_text().strip();BASE=os.environ.get('ROOTS_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
proposal=dict(zip(FILES,[(S/n).read_text() for n in ['Candidate-roadmap.json','Candidate.json','Reader.md','Published.lean','Handoff.md']]))
def ref(c,f):return subprocess.check_output(['git','show',c+':'+f],text=True)
def sha(t):return hashlib.sha256(t.encode()).hexdigest()
p=json.loads(proposal[FILES[1]]);old=json.loads((S/'OriginalPacket.json').read_text());plan=json.loads((S/'Plan.json').read_text());proof=json.loads((S/'ProofPlan.json').read_text());nodes={n['id']:n for n in p['nodes']};changed={}
assert len(old['nodes'])==392 and len(nodes)==396
assert [n['id'] for n in p['nodes'][:392]]==[n['id'] for n in old['nodes']]
assert [n['id'] for n in p['nodes'][392:]]==plan['newNodes']
for a in old['nodes']:
 b=nodes[a['id']];allowed=plan['changedExisting'].get(a['id'],[])
 assert {k:v for k,v in a.items() if k not in allowed}=={k:v for k,v in b.items() if k not in allowed},a['id']
 for k in allowed:assert b[k][:len(a[k])]==a[k],(a['id'],k)
 if a!=b:changed[a['id']]=allowed
assert changed==plan['changedExisting']
for k in old:
 if k not in ['nodes','summary','sources','baseline']:assert p[k]==old[k],k
assert p['summary'].startswith(old['summary']) and p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:-9]==old['baseline']['declarations']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
rd=json.loads(proposal[FILES[0]]);rold=json.loads((S/'OriginalRoadmap.json').read_text())
assert {k:v for k,v in rd.items() if k!='stages'}=={k:v for k,v in rold.items() if k!='stages'}
assert len(rd['stages'])==len(rold['stages'])==10
for a,b in zip(rold['stages'],rd['stages']):
 if a['key']=='RS.1':
  assert b['description'].startswith(a['description']);assert {k:v for k,v in a.items() if k!='description'}=={k:v for k,v in b.items() if k!='description'}
 else:assert a==b
for f,n in zip(FILES,['OriginalRoadmap.json','OriginalPacket.json','OriginalReader.md','OriginalSuggested.lean','OriginalHandoff.md']):assert ref(MATH,f)==(S/n).read_text(),n
assert proposal[FILES[2]].endswith((S/'OriginalReader.md').read_text())
for nid in plan['newNodes']:
 n=nodes[nid];assert n['statement'] in proposal[FILES[2]] and n['declarationName'] in proposal[FILES[2]],nid
for f,v in proposal.items():assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',v,re.M),f
# Parse outer declaration assignment, including nested term proofs inside subtype headers.
def headers(t):
 out=[]
 for m in re.finditer(r'^(?:def|lemma|theorem|example)\b',t,re.M):
  depth=0
  for i in range(m.start(),len(t)):
   if t[i] in '([{⟨':depth+=1
   elif t[i] in ')]}⟩':depth-=1
   if depth==0 and t.startswith(':=',i):out.append(' '.join(t[m.start():i].split()));break
  else:raise AssertionError('missing outer assignment')
 return out
new=(S/'NewAdmitted.lean').read_text();native=(S/'Native.lean').read_text();canonical=(S/'Canonical.lean').read_text()
assert headers(new)==headers((S/'NewProofs.lean').read_text())[:3]+headers((S/'NewProofs.lean').read_text())[5:]+headers((S/'NewTests.lean').read_text())
assert len(headers(new))==16
assert canonical==(S/'IncomingCanonical.lean').read_text()+'\n'+new
assert proposal[FILES[3]].startswith(canonical+'\n/- FINITE_INVARIANT_ARCHIVE_J6LwjP\n')
existing=headers((S/'ExistingInvariant.lean').read_text());assert len(existing)==1 and existing[0] in headers((S/'IncomingCanonical.lean').read_text())
assert headers((S/'NewProofs.lean').read_text())[4]==existing[0]
assert native.startswith((S/'IncomingNative.lean').read_text()+'\n'+(S/'NewProofs.lean').read_text()+'\n'+(S/'NewTests.lean').read_text())
assert not re.search(r'\b(?:sorry|admit|axiom)\b',native)
assert sha((S/'IncomingNative.lean').read_text())==proof['incomingNativeHash']
assert sha((S/'IncomingTyping.lean').read_text())==proof['incomingTypingHash']
assert (S/'MathlibTyping.lean').read_text()==(S/'IncomingTyping.lean').read_text()+'\n'+(S/'ExistingInvariant.lean').read_text()+'\n'+new
resources={}
for prefix,expected,audits in [('Native',0,293),('MathlibTyping',104,231)]:
 rec=json.loads((S/(prefix+'.receipt.json')).read_text());log=(S/(prefix+'.log')).read_text()
 assert rec['sourceSha256']==sha((S/(prefix+'.lean')).read_text()) and rec['logSha256']==sha(log)
 assert rec['exitStatus']==rec['errors']==0 and rec['warnings']==rec['admissionWarnings']==expected
 assert rec['axiomAudits']==audits and rec['availableGiBBefore']>=20 and rec['elapsedSeconds']<1200
 assert log.count('warning: declaration uses')==expected and log.count('warning:')==expected and 'error:' not in log
 resources[prefix]=rec
au=re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",(S/'Native.log').read_text(),re.S);assert len(au)==293
for name,axioms in au:assert set(x.strip() for x in axioms.split(','))<={'propext','Classical.choice','Quot.sound'},name
assert {'TauCeti.RootStack.'+n for n in proof['allNativeNames']}<={n for n,_ in au}
assert len(re.findall(r'^example\b',native,re.M))==245
GUARDS=['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/expansion/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','data/library-coverage.json','data/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/keydefs/owners.json','research/blueprint/reserved-ids.json','scripts/check_blueprint.py','scripts/source_issues.py','scripts/build.py','scripts/blueprints.py','research/blueprint/intake.py']
transition=json.loads((S/'GuardTransition.json').read_text())
for f in GUARDS+FILES:
 if f==transition['path']:
  assert sha(ref(MATH,f))==transition['mathematicalSha256'] and sha(ref((S/'publication-base.txt').read_text().strip(),f))==transition['publicationSha256']
  assert sha(ref(BASE,f)) in {transition['mathematicalSha256'],transition['publicationSha256']}
 else:assert ref(MATH,f)==ref(BASE,f),('changed input',f)
os.environ['ROOTS_VALIDATE_BASE']=BASE;sys.path.insert(0,str(S));import immutable_view;immutable_view.install();sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,checker=check_blueprint.check(S/(RID+'.json'),check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for f,v in proposal.items() for x in env['file_problems'](f,v)];refusals=env['auto_refusals'](job,list(proposal),False,{'codex-J6LwjP'},set());assert not problems and not refusals,(problems,refusals)
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=392,preservedWholeNodes=389,changedExisting=changed,newNodes=4,newApi=7,newTests=8,checker={k:v for k,v in checker.items() if k!='packet'},nativeExamples=245,nativeAudits=293,canonicalSha256=sha(canonical),canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at exact pin; Mathlib native and admitted projections checked separately.',compilation=resources,guardsUnchanged=len(GUARDS)+4,reviewedGoverningTransition=transition,intakeProblems=problems,intakeRefusals=refusals),indent=2))
```

### immutable_view.py

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
BASE = os.environ.get('ROOTS_VALIDATE_BASE', 'c83238dfbbacafc2981f78c840700d2150d4e9ed')
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
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'));import build,blueprints,check_blueprint
RID='FunctionFieldArithmeticPartII';FILES=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'OriginalPacket.json').read_text());rd=json.loads((S/'Candidate-roadmap.json').read_text());rold=json.loads((S/'OriginalRoadmap.json').read_text());nodes={n['id']:n for n in p['nodes']}
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=RID];documents[RID]=FILES[2]
def assemble(candidate,definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(RID,candidate)]),copy.deepcopy(documents),copy.deepcopy([d for d in definitions if d.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,rd);b=assemble(old,rold)
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
pairs={(d,s['id']) for s in a['stages'] if s['id'].startswith(RID+':') for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(file.read_text())
 if q.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in q.get('links',[]) if x.get('source') in stageids and x.get('target') in stageids}
assert all(reachable(s,t) for s,t in pairs),sorted((s,t) for s,t in pairs if not reachable(s,t))
missing_restructures=sorted((s,t) for s,t in rspairs if not reachable(s,t))
assert not any(s.startswith(RID+':') or t.startswith(RID+':') for s,t in missing_restructures),missing_restructures
# Stage edges are identical to the incoming control, so these unrelated preexisting paths are unchanged.
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
assert {k:v for k,v in ar.items() if k!=RID}=={k:v for k,v in br.items() if k!=RID}
assert {x['id']:x for x in a['stages'] if not x['id'].startswith(RID+':')}=={x['id']:x for x in b['stages'] if not x['id'].startswith(RID+':')}
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingUnreachableRestructurePairs':len(missing_restructures),'otherUnreachableRestructurePairListSha256':hashlib.sha256(json.dumps(missing_restructures).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True}

summary['worldCommit']=immutable_view.BASE
summary['foreignRoadmapsAndStagesUnchanged']=True
summary['immutableInputHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
print(json.dumps(summary,indent=2))
```

### run_lean.py

```python
from pathlib import Path
import sys,subprocess,json,hashlib,time,os
S=Path(sys.argv[1]).resolve();B=Path(sys.argv[2]).resolve();filename=sys.argv[3];prefix=sys.argv[4];P=S/filename
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'.lake/packages/mathlib',text=True).strip()=='082e2d37e8b0463410cdb532e111cd43d5a66174'
version=subprocess.check_output(['lake','env','lean','--version'],cwd=B,text=True).strip()
assert '4.34.0-rc2' in version and '6a10ac8c22beadecabdbb0919c2b50214762f91d' in version
available=int(subprocess.check_output(['free','-g'],text=True).splitlines()[1].split()[-1]);assert available>=20,available
start=time.monotonic()
with P.open('rb') as src,(S/(prefix+'.log')).open('wb') as log:
 result=subprocess.run(['timeout','1200','lake','env','lean','--stdin'],stdin=src,stdout=log,stderr=subprocess.STDOUT,cwd=B)
t=(S/(prefix+'.log')).read_text();receipt=dict(file=filename,sourceSha256=hashlib.sha256(P.read_bytes()).hexdigest(),logSha256=hashlib.sha256(t.encode()).hexdigest(),availableGiBBefore=available,elapsedSeconds=round(time.monotonic()-start,2),exitStatus=result.returncode,errors=t.count('error:'),warnings=t.count('warning:'),admissionWarnings=t.count('declaration uses'),axiomAudits=t.count('depends on axioms'),sorryAxReferences=t.count('sorryAx'),leanVersion=version)
(S/(prefix+'.receipt.json')).write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2));sys.exit(result.returncode)
```
