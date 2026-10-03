# #672 checkpoint — actual strong-naturality pullback transport

Agent: Codex; session **codex-rtOQ9t**. Refs #672. The winning claim is comment 5966159171, confirmed by bot comment 5966160075. The entire issue was read before the claim and again after confirmation.

The checkpoint adds **25 declaration nodes: five constructions and twenty lemmas**, **16 API items** and **15 acceptance tests**. The packet now has **366 nodes** ({'definition': 16, 'lemma': 230, 'construction': 87, 'theorem': 28, 'comparison': 5}), **362 raw API items**, **373 raw tests**, **155 baseline declarations**, **10 planets**, **10 gaps**, and **21 unchanged supplier requests**. All eight scoped layers remain partial or not read; every implementation status remains unchecked.

For f:V→U, the actual strong-naturality component identifies ηV(F(f)x) with G(f)(ηUx). The local Isom map now uses the source component inverse and target component forward. The inverse reverses those components before applying the existing anchored band-morphism inverse. The checkpoint specifies actual Isom and Hom maps, both inverse identities, local-anchor independence, unchanged band coordinates, injectivity, and a covering-sieve equivalence with the correct target pullbacks. The global restriction formulas explicitly require a supplied global arrow or source anchor. They do not establish arbitrary deeper-slice coherence.

The whole incoming native proof text is preserved as a byte prefix. The full incoming canonical prototype and its existing Mathlib projection are each preserved as byte prefixes. **340 incoming node objects are identical**; the general full-faithfulness node receives exactly two supplier edges and one proof step. Its statement and every other field are unchanged. The reserved general gerbe definition, general banding and compatible-object profinite-limit contracts, source issues, requests, planets, ownership decisions, and coverage statuses are preserved. No replacement generic Hom/Isom transport is planned: the pinned Iso.homCongr and Iso.isoCongr are reused.

## Validation and precise compile limits

The indexed blueprint checker passes with zero errors and zero warnings. All 25 new declaration headers and all 15 acceptance-test headers match between the native proof draft and admitted prototypes. Reader statements, API names and test names agree with the packet. The immutable actual intake validation checks the four allowed deliverables and the actual job; its result is recorded below. The actual atlas assembler compares the candidate against its incoming control with all other promoted packets retained. Stage edges are unchanged, all three tested graphs are acyclic, every required and accepted-restructure supplier pair reaches its target, and the roadmaps' existing skipped/pending links are unchanged.

**Lean was not run for this checkpoint.** Repeated preflight checks found only 16–18 GiB available on the shared server; WORKERS.md requires at least 20 GiB before starting a compile. No owned compiler or language server was started. The new admission-free native proof text is an **uncompiled proof draft**, not a checked certificate. The new full canonical file and Mathlib projection are also uncompiled. The prior worker's compile receipts are historical and are not attributed to this session. The full canonical file additionally retains the incoming TauCeti import whose matching pinned object artifact is unavailable; the available different TauCeti revision is not substituted and no import is silently removed.

## Sources and baseline actually read

Fresh whole mathematical read: Olsson Spring 2007 notes, PDF pages 122–123, Definition 31.1, Remark 31.2, Lemmas 31.3–31.4 and Remark 31.5; only the visible beginning and incompleteness warning of Lemma 31.6. PDF SHA-256: 716bf95c7a200194d5fd1f2af48372253fde5ea65487b5d362bcccb5e0b7426a. Also read the whole Stacks 06NZ mathematical definition and 0CJY printed statement/proof, including its expressly omitted varying-base step. The exact native pullback formulas and proofs are authored deductions. Lemma 31.3's printed self-reference is not a proof supplier, and Stacks 0CJY is not misattributed as a proof of full faithfulness. Existing source-issue/version records are retained without a new whole-source audit claim.

Fresh pinned Mathlib statement/ambient-context reads: native StrongTrans with all its naturality/identity/composition fields; Cat.Hom.toNatIso; Iso.homCongr and Iso.isoCongr; NatIso.naturality_1; Faithful and Functor.map_injective; Functor.mapIso and mapIso_trans; the native pullHom, presheafHom, IsPrestack and sheafHom interfaces. Fresh incoming mathematical-interface reads include IsGerbe, AbelianBanding (pullback and conjugation), principal slice Hom-presheaf/sheaf comparison, and the actual BandPreserving/component inverse declarations. The reviewed R09.4 audit and accepted RS-27 R09.4/owner contracts were read; the referenced red-team claim/fix records were checked as inherited constraints. Coherent duality remains an import from SchemeAndStackFoundations:key/coherent-duality. These are scoped fresh reads, not an assertion of having freshly re-read the entire historical packet, historical handoff or whole papers.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174. TauCeti pin: f790474821cf4256814db967cb154e7af3d0c369. Mathematical read base: **21b2f2946940fe7557c08f1b578854c0b015aa80**. Publication validation base: **588f2b8bd535f2c370ddaaa49a1cc4d850413ce7**. Twelve governing files and four issue inputs were byte-identical across these bases before publication.

## Exact continuation frontier

Prove compatibility of the objectwise Hom map for every deeper slice arrow g:W→V, using η.naturality_comp and the source/target pseudofunctor comparison maps. A law for restriction of a supplied global arrow or anchor is insufficient. Build the resulting native Hom-presheaf natural transformation; use the native Hom sheaf and anchor independence to glue the local inverse. Only then establish fibrewise fullness. Essential surjectivity, the inverse strong transformation and the general equivalence theorem remain open. Retain every inherited frontier, including the SF1 descended-slice intrinsic-band comparison, D0 torsor/classifying-stack comparison, nonneutral O(1) root gerbe, derived H2/classification, compatible-object profinite limits, R09.3 affine module descent elaboration, and the other seven scoped stages. Resolve the explicit coefficient/fibre-hom universe convention when validating the full general reserved-key interface.

When at least 20 GiB is available, run one owned compile at a time for the recovered native proof draft and bounded Mathlib prototype, with a 20-minute timeout. Correct any elaboration or axiom-audit failures before attributing a new checked proof receipt. The canonical prototype keeps admissions and makes no implementation claim.

## Public recovery and validation

The own branch ancestor **7585601b52091181a9edec2ad4e877003a0c1886** stores the proof draft and bounded prototype inside comments of the allowed suggested file. The final suggested file is the canonical admitted prototype. No separate proof file, paper, private path or build artifact is committed. The ancestor must remain reachable; do not rewrite its history.

Save the first Python block as recover.py and run it with your own disk scratch directory and the **actual full PR head SHA**. It verifies every artifact hash and all three incoming prefix hashes, retrieves the immutable incoming four deliverables, and extracts the four scripts below. It does not run Lean. Then run verify.py and graph.py from an existing repository clone, giving the scratch directory and declaration index to verify.py and setting MODULI_VALIDATE_BASE to the publication base. Their read adapter uses immutable Git blobs rather than copying the repository. A recovered source-only replay must not be described as a Lean compile.

Prior continuation and all historical proof receipts: [immutable incoming handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/21b2f2946940fe7557c08f1b578854c0b015aa80/research/blueprint/handoff/BP-AlgebraicModuliForArithmeticGeometry--A0-extension.md). Its recovery successfully checked all nineteen published artifact hashes before the new draft was written.

Recovery script:

```python
from pathlib import Path
import hashlib,json,re,sys,urllib.request
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2]
assert re.fullmatch('[0-9a-f]{40}',HEAD),'Use the actual full pull-request head SHA, never a guessed SHA.'
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='7585601b52091181a9edec2ad4e877003a0c1886'
BASE='21b2f2946940fe7557c08f1b578854c0b015aa80'
PUBLICATION_BASE='588f2b8bd535f2c370ddaaa49a1cc4d850413ce7'
TAGS={'Native.lean': 'NATIVE STRONG PULLBACK PROOF DRAFT', 'Canonical.lean': 'BOUNDED MATHLIB STRONG PULLBACK PROTOTYPE', 'New.lean': 'STRONG PULLBACK NEW PROOFS', 'NewAdmitted.lean': 'STRONG PULLBACK NEW ADMITTED', 'Audits.lean': 'STRONG PULLBACK AXIOM COMMANDS'}
META={'FullCanonical.lean': {'sha256': 'b3ad8eb964b8ebee67740aadd0b95afe1a8350548dcab6e47ce61039e37bc2b9', 'bytes': 238348, 'lines': 4882}, 'Native.lean': {'sha256': '7ddfb31b84fa230a893fb8d99941e39a4f4549dc69e9e82f30720ff0a8cabc7c', 'bytes': 198730, 'lines': 4252}, 'Canonical.lean': {'sha256': 'aa9d947614722e85c59b78b1d921023a7928ef8a743f8d29ba00f1ce7cc03c83', 'bytes': 161959, 'lines': 3528}, 'New.lean': {'sha256': '4d616071ed391c07455b7374a5290fce57fc0eae852af1f7a7a1bfd1ae2aa7ef', 'bytes': 14392, 'lines': 296}, 'NewAdmitted.lean': {'sha256': '7e74371a6f224c4795409c37e57ec308b387b40b74192ffecdf7005e78de2d2a', 'bytes': 12397, 'lines': 242}, 'Audits.lean': {'sha256': 'd9d0d9f263e7574ad8acd3d6640e8f73ece26ce71214a17d027d1dcd1ebcb017', 'bytes': 3217, 'lines': 41}}
PREFIX={'IncomingNative.lean': {'sha256': '916e7cddaa5f12f046949f03530e5c196f2b524f1eb2ac5f5e0fefca7f549a27', 'bytes': 181121}, 'IncomingCanonical.lean': {'sha256': '6f737bbb5379722ea3f94991b29ab96390f376f66018412bae05402ef4ef46fe', 'bytes': 149562}, 'IncomingFullCanonical.lean': {'sha256': 'c107e35850f863d6f74cf3494eff08c97ece614a68e4737d19aff7b1ac7151f0', 'bytes': 225951}}
def fetch(url):
 with urllib.request.urlopen(url,timeout=120) as r:return r.read()
raw=fetch(ROOT+ARCHIVE+'/research/blueprint/suggested/'+STEM+'.lean').decode()
artifacts={'FullCanonical.lean':raw.split('\n/- BEGIN ARCHIVED '+TAGS['Native.lean']+'\n')[0]}
for f,tag in TAGS.items():
 artifacts[f]=raw.split('\n/- BEGIN ARCHIVED '+tag+'\n')[1].split('END ARCHIVED '+tag+' -/')[0]
for f,t in artifacts.items():
 data=t.encode();assert hashlib.sha256(data).hexdigest()==META[f]['sha256'],f
 assert len(data)==META[f]['bytes'];(S/f).write_bytes(data)
for incoming,whole in [('IncomingNative.lean','Native.lean'),('IncomingCanonical.lean','Canonical.lean'),('IncomingFullCanonical.lean','FullCanonical.lean')]:
 data=artifacts[whole].encode()[:PREFIX[incoming]['bytes']]
 assert hashlib.sha256(data).hexdigest()==PREFIX[incoming]['sha256'],incoming
 (S/incoming).write_bytes(data)
for directory,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]:
 name=('BP-' if directory=='handoff' else '')+STEM+'.'+ext
 (S/('incoming-'+directory+'.'+ext)).write_bytes(fetch(ROOT+BASE+'/research/blueprint/'+directory+'/'+name))
handoff=fetch(ROOT+HEAD+'/research/blueprint/handoff/BP-'+STEM+'.md').decode()
fence=chr(96)*3
blocks=re.findall(fence+'python'+chr(10)+'(.*?)'+fence,handoff,re.S)
assert len(blocks)>=4
for f,t in zip(['recover.py','verify.py','immutable_view.py','graph.py'],blocks[:4]):(S/f).write_text(t)
(S/'publication-base.txt').write_text(PUBLICATION_BASE+'\n')
(S/'base.txt').write_text(BASE+'\n')
print(json.dumps({'archive':ARCHIVE,'head':HEAD,'artifactsVerified':len(META),'incomingPrefixesVerified':len(PREFIX),'scriptsRecovered':4,'LeanExecuted':False}))
```

Candidate/header/intake/indexed-checker validation:

```python
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
R=Path.cwd();S=Path(sys.argv[1]).resolve();RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension'
FILES=['research/blueprint/'+d+'/'+n for d,n in [('packets',STEM+'.json'),('readmes',STEM+'.md'),('suggested',STEM+'.lean'),('handoff','BP-'+STEM+'.md')]]
text={x:(R/x).read_text() for x in FILES};p=json.loads(text[FILES[0]]);old=json.loads((S/'incoming-packets.json').read_text());(S/'Candidate.json').write_text(text[FILES[0]]);(S/(STEM+'.json')).write_text(text[FILES[0]])
nodes={n['id']:n for n in p['nodes']};oldnodes={n['id']:n for n in old['nodes']};changed=RID+':R09.4/band-morphism-full-faithful'
assert len(nodes)==366 and len(oldnodes)==341
assert all(nodes[k]==v for k,v in oldnodes.items() if k!=changed)
a=json.loads(json.dumps(nodes[changed]));a['prerequisites']=a['prerequisites'][:-2];a['proofSteps']=a['proofSteps'][:-1];assert a==oldnodes[changed]
for k,v in old.items():
 if k not in ['nodes','sources','baseline','coverage','summary','gaps']:assert p[k]==v,k
assert p['sources'][:-1]==old['sources'] and p['gaps'][:-1]==old['gaps']
assert p['baseline']['declarations'][:151]==old['baseline']['declarations'] and len(p['baseline']['declarations'])==155
for a,b in zip(p['coverage'],old['coverage']):
 if a['stageId']==RID+':R09.4':a=json.loads(json.dumps(a));a['remaining']=a['remaining'][:-1]
 assert a==b
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes'])
native=(S/'Native.lean').read_text();full=(S/'FullCanonical.lean').read_text();canonical=(S/'Canonical.lean').read_text();new=(S/'New.lean').read_text();admitted=(S/'NewAdmitted.lean').read_text()
assert native==(S/'IncomingNative.lean').read_text()+new+(S/'Audits.lean').read_text()
assert full==(S/'IncomingFullCanonical.lean').read_text()+admitted
assert canonical==(S/'IncomingCanonical.lean').read_text()+admitted
assert text[FILES[2]].startswith(full) and text[FILES[1]].startswith((S/'incoming-readmes.md').read_text())
assert not re.search(r'\bsorry\b|\baxiom\b',native)
def headers(t):
 lines=t.splitlines(keepends=True);out={};i=0;ns=''
 while i<len(lines):
  if lines[i].startswith('namespace '):ns=lines[i].split()[1]
  m=re.match(r'^(def|lemma|theorem|example)\s*(\w+)?',lines[i]);example=lines[i].startswith('example')
  if not m:i+=1;continue
  j=i+1
  while j<len(lines) and not re.match(r'^(?:def |lemma |theorem |example|namespace |end |variable |include |/--|-- TauCeti\.)',lines[j]):j+=1
  chunk=''.join(lines[i:j]);depth=0;sep=None
  for k,c in enumerate(chunk):
   if c in '([{':depth+=1
   elif c in ')]}':depth-=1
   if depth==0 and chunk.startswith(' :=',k):sep=k;break
  assert sep is not None,chunk
  h=chunk[:sep].strip()
  if example:name=lines[i-1].strip().split('.')[-1];h='theorem '+name+h[len('example'):]
  else:name=m[2]
  out[ns+'.'+name]=' '.join(h.split());i=j
 return out
nn=headers(new);cc=headers(admitted);assert nn==cc and len(nn)==40
assert {n['declarationName'] for n in p['nodes'][341:]}=={k for k in nn if '.Tests.' not in k}
assert {x['name'] for n in p['nodes'][341:] for x in n.get('tests',[])}=={k for k in nn if '.Tests.' in k}
for n in p['nodes'][341:]:
 assert n['declarationName'] in text[FILES[1]] and n['statement'] in text[FILES[1]]
 for x in n.get('api',[])+n.get('tests',[]):
  assert x['name'] in nn and x['name'] in text[FILES[1]] and x['statement'] in text[FILES[1]]
receipt={}
if (S/'Native.log').exists():
 log=(S/'Native.log').read_text();assert not re.search(r'error:|error\(|warning:|sorryAx',log)
 audits=re.findall(r"^'([^\n]+)' depends on axioms:",log,re.M);assert len(audits)==len(set(audits))==331
 blocks=re.findall(r"depends on axioms:\s*\[(.*?)\]",log,re.S)
 assert len(blocks)==331 and all(set(re.findall(r'[A-Za-z_][A-Za-z_.]*',b)) <= {'propext','Classical.choice','Quot.sound'} for b in blocks)
 assert 'EXIT 0' in log;receipt['nativeAxiomAudits']=331
if (S/'Canonical.log').exists():
 log=(S/'Canonical.log').read_text();assert not re.search(r'error:|error\(',log)
 assert log.count('warning:')==log.count('warning: declaration uses')==490 and 'EXIT 0' in log
 receipt['mathlibProjectionAdmissions']=490
base=os.environ['MODULI_VALIDATE_BASE'];assert set(subprocess.check_output(['git','diff','--name-only',base],text=True).splitlines())<=set(FILES)
for path,t in text.items():assert not re.search(r'[ \t]+$',t,re.M) and not re.search(r'/(?:home|Users)/[^/\s]+/',t),path
sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='BP-'+STEM)
problems=[x for path in FILES for x in env['file_problems'](path,text[path])];refusals=env['auto_refusals'](job,FILES,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings);summary['packet']=FILES[0]
print(json.dumps({'preservedWholeNodes':340,'oneNodeReceivesOnlyTwoSupplierEdgesAndOneProofStep':True,'newNodes':25,'newConstructionNodes':5,'newApiItems':16,'newTestHeadersMatched':15,'newComponentHeadersMatched':25,'incomingNativeAndCanonicalPrefixesPreserved':True,'intakeProblems':problems,'intakeAutoRefusals':refusals,'checker':summary,'rawApiItems':sum(len(n.get('api',[])) for n in p['nodes']),'rawTests':sum(len(n.get('tests',[])) for n in p['nodes']),'compileReceipts':receipt},indent=2))
```

Immutable Git read adapter:

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
BASE = os.environ.get('MODULI_VALIDATE_BASE', '588f2b8bd535f2c370ddaaa49a1cc4d850413ce7')
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

Actual atlas/control graph validation:

```python
from pathlib import Path
import os,sys,json,collections,copy,hashlib
R=Path.cwd();S=Path(sys.argv[1]);RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension'
sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint
p=json.loads((S/'Candidate.json').read_text())
old=json.loads((S/'incoming-packets.json').read_text())
nodes={n['id']:n for n in p['nodes']}
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(old)
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
roadmap=json.loads((R/('research/blueprint/atlas/roadmaps/'+RID+'.json')).read_text())
pairs={(d,RID+':'+s['key']) for s in roadmap['stages'] for d in s.get('requires',[])}
pairs|={(d,stageof(nid)) for nid,n in nodes.items() for d in n['prerequisites'] if d in stageids and d not in world and d!=stageof(nid)}
pairs|={(stageof(q['supplier']),stageof(v)) for q in p['requests'] for v in q['neededBy'] if stageof(q['supplier'])!=stageof(v)}
rspairs=set()
for file in (R/'research/blueprint/restructure').glob('*.result.json'):
 rs=json.loads(file.read_text())
 if rs.get('review',{}).get('status')!='accepted':continue
 rspairs|={(x['source'],x['target']) for x in rs.get('links',[]) if x['source'].startswith(RID+':') or x['target'].startswith(RID+':')}
assert all(reachable(s,t) for s,t in pairs|rspairs),sorted((s,t) for s,t in pairs|rspairs if not reachable(s,t))
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']-br[RID]['blueprint']['declarations']==len(nodes)-len(old['nodes'])
otherparts=[x for x in keep if x[0].startswith(RID+'--')]
assert ar[RID]['blueprint']['declarations']==len(nodes)+sum(len(q['nodes']) for _,q in otherparts)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True}
summary['immutableInputPathsRead']=len(immutable_view.READS);summary['immutableReadPathsSha256']=hashlib.sha256(json.dumps(sorted(immutable_view.READS)).encode()).hexdigest()
print(json.dumps(summary,indent=2))
```

Artifact hashes and lengths:

```json
{
  "artifacts": {
    "FullCanonical.lean": {
      "sha256": "b3ad8eb964b8ebee67740aadd0b95afe1a8350548dcab6e47ce61039e37bc2b9",
      "bytes": 238348,
      "lines": 4882
    },
    "Native.lean": {
      "sha256": "7ddfb31b84fa230a893fb8d99941e39a4f4549dc69e9e82f30720ff0a8cabc7c",
      "bytes": 198730,
      "lines": 4252
    },
    "Canonical.lean": {
      "sha256": "aa9d947614722e85c59b78b1d921023a7928ef8a743f8d29ba00f1ce7cc03c83",
      "bytes": 161959,
      "lines": 3528
    },
    "New.lean": {
      "sha256": "4d616071ed391c07455b7374a5290fce57fc0eae852af1f7a7a1bfd1ae2aa7ef",
      "bytes": 14392,
      "lines": 296
    },
    "NewAdmitted.lean": {
      "sha256": "7e74371a6f224c4795409c37e57ec308b387b40b74192ffecdf7005e78de2d2a",
      "bytes": 12397,
      "lines": 242
    },
    "Audits.lean": {
      "sha256": "d9d0d9f263e7574ad8acd3d6640e8f73ece26ce71214a17d027d1dcd1ebcb017",
      "bytes": 3217,
      "lines": 41
    }
  },
  "incomingPrefixes": {
    "IncomingNative.lean": {
      "sha256": "916e7cddaa5f12f046949f03530e5c196f2b524f1eb2ac5f5e0fefca7f549a27",
      "bytes": 181121
    },
    "IncomingCanonical.lean": {
      "sha256": "6f737bbb5379722ea3f94991b29ab96390f376f66018412bae05402ef4ef46fe",
      "bytes": 149562
    },
    "IncomingFullCanonical.lean": {
      "sha256": "c107e35850f863d6f74cf3494eff08c97ece614a68e4737d19aff7b1ac7151f0",
      "bytes": 225951
    }
  }
}
```

Actual atlas validation result:

```json
{
  "stageDAG": {
    "vertices": 3017,
    "edges": 8655,
    "acyclic": true
  },
  "ownDeclarationDAG": {
    "vertices": 366,
    "edges": 802,
    "acyclic": true
  },
  "scopedDAG": {
    "vertices": 3376,
    "edges": 9890,
    "acyclic": true
  },
  "reachableDeclarations": 369,
  "externalDeclarations": [
    "DiamondsAndVStacks:D0/cech-to-derived-comparison",
    "DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products",
    "DiamondsAndVStacks:D0/stackification"
  ],
  "baselineLeaves": 155,
  "requiredPairs": 24,
  "restructurePairs": 40,
  "unresolved": [],
  "ownSkippedLinks": [],
  "ownPendingLinks": [],
  "otherSkipsMatch": true,
  "stageEdgesUnchanged": true,
  "immutableInputPathsRead": 844,
  "immutableReadPathsSha256": "7a5bc33a56515cfcab14167e3482f671db14c0313804a9dbcc53159bb2d0c9ea"
}
```

Actual candidate validation result:

```json
{
  "preservedWholeNodes": 340,
  "oneNodeReceivesOnlyTwoSupplierEdgesAndOneProofStep": true,
  "newNodes": 25,
  "newConstructionNodes": 5,
  "newApiItems": 16,
  "newTestHeadersMatched": 15,
  "newComponentHeadersMatched": 25,
  "incomingNativeAndCanonicalPrefixesPreserved": true,
  "intakeProblems": [],
  "intakeAutoRefusals": [],
  "checker": {
    "packet": "research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--A0-extension.json",
    "roadmap": "AlgebraicModuliForArithmeticGeometry",
    "status": "partial",
    "nodes": 366,
    "kinds": {
      "definition": 16,
      "lemma": 230,
      "construction": 87,
      "theorem": 28,
      "comparison": 5
    },
    "apiItems": 354,
    "unitTests": 350,
    "planets": 10,
    "baselineDeclarations": 155,
    "prerequisites": {
      "baseline": 442,
      "node (this packet)": 802,
      "node (blueprint)": 25,
      "stage": 39
    },
    "gaps": 10,
    "requests": 21,
    "stagesInScope": 8,
    "stagesClosed": 0
  },
  "rawApiItems": 362,
  "rawTests": 373,
  "compileReceipts": {}
}
```
