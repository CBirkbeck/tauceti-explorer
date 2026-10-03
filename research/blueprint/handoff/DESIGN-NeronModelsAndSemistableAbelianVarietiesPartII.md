# DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII: recomputed conductor checkpoint

Codex — codex-a71f92; Refs #3378. Claim5970241109 was confirmed by bot5970242193 before work; the whole issue was read and reread after confirmation. Mathematical input ba26650311df0a78e2f01f19bd298bfc7d636794; publication input 20ee6c0227a623ea43ae92a967b2141edc7b49cc. Incoming peer PR #6000 head 0a272ef6e4ab978fbb676d69f9c08620e05af4e5 was merged and its exact34 public artifacts and six helper hashes were authenticated. Its actual immutable verifier was freshly rerun successfully. Historical source audits retain their authors and qualifications; no fresh manual review of every incoming proof is claimed.

The packet remains partial with571 nodes:17 definitions,444 lemmas,28 theorems,9 comparisons and73 constructions. It retains340 raw API items,345 raw tests,29 planets,393 indexed baseline citations,17 gaps,23 requests,78 route rows and21 inherited source findings. The actual checker counts340 API items and295 definition/construction unit tests; the four new lemma/theorem regression tests are separately indexed in the raw packet and typed Lean projection. All seven stages remain partial, and every implementationStatus is unchecked. All565 incoming mathematical contracts survive, with564 complete node objects identical. Only conductor-finite-localization gains appended prerequisites, proof steps and four tests. The complete previous reader is preserved after the new exact reader section; only G.0 gains a roadmap paragraph.

Six new conductor-specific declarations prove: membership in the actual localized coefficient image can be cleared back to an original denominator; denominator removal uses an actual image inverse; localized products have original-ring witnesses; testing the recomputed conductor on original elements suffices; a finite spanning family gives equality of the extended and recomputed conductors; Module.Finite supplies that family. The incoming common-product denominator lemma is consumed, not duplicated. The proof is valid for noninjective coefficient maps, zero divisors, empty spanning families and zero localizations. No domain cancellation or generic flat-annihilator theorem is assumed.

The inherited injective-map conductor_localization proposition is freshly checked as a native specialization. Its actual target image submonoid is now explicit, and its unused injectivity binder is named _hf; these are the only incoming canonical header adjustments and do not change the mathematical proposition. The canonical retains all other incoming signatures and appends only the new admitted signatures. New native/admitted headers match mechanically. Four tests exercise actual representative products, the empty family of ℤ→Z/1, the diagonal Z/4 algebra with a nilpotent denominator and a coefficient outside its original conductor, and the cusp A=k+X²k[X] with recomputed unit conductor after inverting X². The cusp consumes the incoming native normalization spanning family{1,X}.

Fresh bounded primary reading covers the complete displayed Stacks07T8 statement and proof and Ferrand printed p554 introduction and pp556–557 Lemma1.3 conductor context. SourceReading.json gives URLs, SHA256 and extent. The representative equations are explicit deductions, not verbatim attributions. No new whole-paper extraction or erratum audit is claimed. All six reviewed R11 coverage rows, full REV-AUDIT-10, the Ferrand key entries, SF.0 supplier stage, parent R11 document and all seven owned stage descriptions were read. Earlier complete personal reads of JacobianChallenge and StableReduction were guarded unchanged. Fourteen new baseline declarations and their ambient assumptions were personally read at exact Mathlib082e2d3; source hashes and actual indexed names are retained.

Native.lean freshly passes238 examples and434 standard-axiom audits, with zero warnings, errors or admissions. Source SHA256 5834d166f9e01b9aaba5ac1b16c998853bb284276442b9ee5f820821bca88f06; diagnostic SHA256 f4d9101c7466a1ed2cb308caaeade812aab9bb12a0f52270252c9f2a007d52b9. Sketch.lean freshly passes257 admitted examples with617 admission warnings as its only warnings, and20 inherited clean axiom audits. Source SHA256 5aa43ecfa1f0b7e25675e69f588041eb0355356798c5bf93ce86733443c7b121; diagnostic SHA256 34dc4e902b5f457aaceca9f48a28591cda028f7306670b5798860cf7b0565136. The exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d are checked. Runs were serial in an existing build, with35/36GiB available before starting, a1200-second timeout, one Lean thread and an8192MiB managed-memory limit. Peak RSS was 7267480/7096520KiB. No Lake setup, project, library build, cache download or language server was started. No owned compiler is left running.

The full canonical Tau Ceti-importing file is UNCOMPILED because no existing complete exact Tau Ceti f790474 build was available. The checked Mathlib-only projections preserve the incoming exact consumed Tau Ceti source excerpt and its import-envelope qualifications. This does not assert that every unbuilt inherited canonical signature elaborates. Canonical source SHA256 da48c81a1d22b5dbdc1528cf8c11bbc63faf0fa47f9e45b76ac41d517cf999fa.

Actual check_blueprint, intake file_problems/auto_refusals and the inherited source-issue validation envelope pass with no errors or warnings. Mathematical and publication controls are checked separately. All23 governing/audit/style/checker/owned-input guards are byte-identical between those bases. The assembled stage, own and scoped graphs are acyclic, all69 required stage paths are reachable, and no own unresolved or skipped/pending links exist. Foreign whole roadmap and stage objects and whole stage edges agree with the input control. The45 unrelated preexisting unreachable restructuring paths are retained in the graph report, not silently repaired. Reports include exact audit bases and immutable-read digests.

Resume with actual affine basic-open section/restriction maps: identify them with the native localized maps just proved, establish restriction coherence, and prove the conductor IdealSheafData affine formula. A ring-localization equality is not a sheaf-restriction or cokernel theorem. Preserve the generic SF.0 flat-annihilator request and all conductor quotient/square, structure-sheaf, finite-pushforward H0/H1, P¹/Proj, properness/projectivity, independent I₂, arbitrary-section/algebraic-space and every family/model/classification obligation. No gap, request, source finding or route row is removed.

The suggested file ends with an inert compressed archive containing70 authenticated UTF-8 artifacts, including original issue inputs, inherited public evidence, new exact sources, sanitized diagnostics, receipts and control reports. ReplayManifest.json binds the seven helpers below. Recover only from the exact immutable public head into an empty owned scratch directory; use an existing clone containing the recorded trees, never a repository snapshot. Optional Lean replays obey the same exact-pin, single-process,20GiB,8192MiB and1200-second guards.

```sh
PUBLIC_RECOVERY=1 python3 recover.py evidence EXACT_PR_HEAD
python3 evidence/verify.py evidence DECLARATIONS_TSV
python3 evidence/graph.py evidence
python3 evidence/runcheck.py evidence EXISTING_MATHLIB LEAN_BINARY Native.lean
python3 evidence/runcheck.py evidence EXISTING_MATHLIB LEAN_BINARY Sketch.lean
```

Public-head recovery and immutable verification precede removal of disposable scratch. The replay sources and receipts remain publicly recoverable.

### recover.py

```python
"""Authenticate the exact public-head checkpoint into an empty owned scratch directory."""
from pathlib import Path
import base64,hashlib,json,os,re,subprocess,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
assert not S.exists() or not any(S.iterdir());S.mkdir(parents=True,exist_ok=True)
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def read(f):
 if os.environ.get('PUBLIC_RECOVERY')=='1':
  url='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+HEAD+'/'+f
  with urllib.request.urlopen(url,timeout=30) as r:return r.read(64*1024*1024)
 return subprocess.check_output(['git','show',HEAD+':'+f])
def save(n,b):
 assert Path(n).name==n and n not in {'.','..'} and not (S/n).exists()
 t=b.decode();patch='*** Begin Patch\n*** Add File: '+str(S/n)+'\n'+''.join('+'+x+'\n' for x in t.splitlines())+'*** End Patch\n'
 subprocess.run(['apply_patch'],input=patch,text=True,check=True,stdout=subprocess.DEVNULL)
 assert (S/n).read_bytes()==b,n
head=[read(f) for f in FILES];pub=head[3].decode()
m=re.search(r'\n/- RECOMPUTED_CONDUCTOR_ARCHIVE_N25\n(.*?)\nEND RECOMPUTED_CONDUCTOR_ARCHIVE_N25 -/\n$',pub,re.S);assert m
items=json.loads(zlib.decompress(base64.b64decode(m.group(1))))
assert sum(len(x['text'].encode()) for x in items.values())<900*1024*1024
for name,item in items.items():
 b=item['text'].encode();assert hashlib.sha256(b).hexdigest()==item['sha256'],name;save(name,b)
assert pub[:m.start()]==(S/'Canonical.lean').read_text()
for n,b in zip(['Candidate-roadmap.json','Candidate.json','Reader.md','Published.lean','Handoff.md'],head):save(n,b)
save(RID+'.json',head[1])
for name,h in json.loads((S/'ReplayManifest.json').read_text()).items():
 m=re.search(r'### '+re.escape(name)+r'\n\n\u0060\u0060\u0060python\n(.*?)\n\u0060\u0060\u0060\n',head[4].decode(),re.S);assert m,name
 b=(m.group(1)+'\n').encode();assert hashlib.sha256(b).hexdigest()==h,name;save(name,b)
print(json.dumps(dict(publicHead=HEAD,authenticatedArtifacts=len(items),currentDeliverables=5,authenticatedHelpers=7,allHashesMatch=True,publicGitHubReads=os.environ.get('PUBLIC_RECOVERY')=='1'),indent=2))
```

### verify.py

```python
"""Immutable native signatures, whole incoming contracts, exact diagnostics and actual programme checks."""
from pathlib import Path
import ast,base64,hashlib,json,os,re,subprocess,sys,zlib
R=Path.cwd();S=Path(sys.argv[1]).resolve();RID='NeronModelsAndSemistableAbelianVarietiesPartII'
MATH=(S/'mathematical-base.txt').read_text().strip();BASE=os.environ.get('NERON_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
sha=lambda x:hashlib.sha256(x).hexdigest()
def blob(c,f):return subprocess.check_output(['git','show',c+':'+f])
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Input-packets.json').read_text());plan=json.loads((S/'Plan.json').read_text());nodes={n['id']:n for n in p['nodes']}
assert len(old['nodes'])==565 and len(nodes)==571
assert [n['id'] for n in p['nodes'][:565]]==[n['id'] for n in old['nodes']]
assert [n['id'] for n in p['nodes'][565:]]==plan['newNodes']
changed={}
for a in old['nodes']:
 b=nodes[a['id']];allowed=plan['changedExisting'].get(a['id'],[])
 assert {k:v for k,v in a.items() if k not in allowed}=={k:v for k,v in b.items() if k not in allowed}
 for k in allowed:assert b[k][:len(a.get(k,[]))]==a.get(k,[])
 if a!=b:changed[a['id']]=allowed
assert changed==plan['changedExisting']
assert set(p)==set(old)|{'recomputedConductorContinuation'}
for k in old:
 if k not in ['nodes','summary','sources','baseline']:assert p[k]==old[k],k
assert p['summary'].startswith(old['summary']) and p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:-14]==old['baseline']['declarations'] and p['baseline']['declarations'][-14:]==plan['newBaseline']
assert {k:v for k,v in p['baseline'].items() if k!='declarations'}=={k:v for k,v in old['baseline'].items() if k!='declarations'}
rd=json.loads((S/'Candidate-roadmap.json').read_text());rold=json.loads((S/'Input-roadmaps.json').read_text())
assert rd['stages'][1:]==rold['stages'][1:]
assert {k:v for k,v in rd.items() if k!='stages'}=={k:v for k,v in rold.items() if k!='stages'}
assert rd['stages'][0]['description'].startswith(rold['stages'][0]['description'])
assert {k:v for k,v in rd['stages'][0].items() if k!='description'}=={k:v for k,v in rold['stages'][0].items() if k!='description'}
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in p['nodes']) and all(c['status']=='partial' for c in p['coverage'])
assert (len(p['sourceIssues']),len(p['routeCoverage']),len(p['gaps']),len(p['requests']))==(21,78,17,23)
inputs=['Input-roadmaps.json','Input-packets.json','Input-readmes.md','Input-suggested.lean','Input-handoff.md']
for f,n in zip(FILES,inputs):assert blob(MATH,f)==(S/n).read_bytes(),f
reader=(S/'Reader.md').read_text();assert reader.endswith((S/'Input-readmes.md').read_text())
for n in p['nodes'][565:]:assert n['statement'] in reader and n['declarationName'] in reader
for name,kind,t in plan['newTests']:assert 'ConductorLocalization.'+name in reader and t in reader
sys.path.insert(0,str(S));import signatures
new=(S/'New.lean').read_text();ad=(S/'NewAdmitted.lean').read_text();cp=(S/'CompatProofs.lean').read_text();cad=(S/'CompatAdmitted.lean').read_text()
assert new==(S/'NewProofs.lean').read_text()+'\n'+(S/'NewTests.lean').read_text()
assert signatures.admit(new)==ad and signatures.headers(new)==signatures.headers(ad) and len(signatures.declarations(new))==10
assert signatures.admit(cp)==cad and signatures.headers(cp)==signatures.headers(cad)
original=(S/'Previous-Canonical.lean').read_text();start=original.index('lemma conductor_localization {');end=original.index('variable {Y P : Scheme.{u}}',start)
blk=original[start:end];newblk=blk.replace('(hf : Function.Injective','(_hf : Function.Injective').replace('IsLocalization.map M (algebraMap A B) (by','IsLocalization.map (T := S.map (algebraMap A B)) M (algebraMap A B) (by')
assert blk!=newblk and signatures.headers(cp)[0]==signatures.headers(newblk)[0]
canonical=(S/'Canonical.lean').read_text();assert canonical==original[:start]+newblk+original[end:]+'\n'+ad
m=re.search(r'\n/- CONDUCTOR_GENERATOR_ARCHIVE_J6LwjP\n(.*?)\nEND CONDUCTOR_GENERATOR_ARCHIVE_J6LwjP -/\n$',(S/'Input-suggested.lean').read_text(),re.S);assert m
assert (S/'Input-suggested.lean').read_text()[:m.start()]==original
archive=json.loads(zlib.decompress(base64.b64decode(m.group(1))));assert len(archive)==34
for name,item in archive.items():
 text=item['text'].encode();assert sha(text)==item['sha256'] and text==(S/('Previous-'+name)).read_bytes(),name
incomingHelpers=['recover.py','verify.py','immutable.py','graph.py','run-lean.py','signatures.py']
for name,h in json.loads((S/'Previous-ReplayManifest.json').read_text()).items():assert sha((S/('Previous-'+name)).read_bytes())==h,name
native=(S/'Native.lean').read_text();assert native==(S/'Previous-Native.lean').read_text()+'\n'+new+'\n'+cp+'\n'+(S/'Audits.lean').read_text()
assert not re.search(r'\b(?:sorry|admit|axiom)\b',native)
assert sha((S/'Previous-Native.lean').read_bytes())=='6cbffc5bec17fe899d15e1e942d317cdfbeb802573b86f887ad92ef6f15752ec'
assert (S/'Sketch.lean').read_text()==(S/'Previous-Sketch.lean').read_text()+'\n'+ad+'\n'+cad
comp={}
for stem,examples,warnings,audits in [('Native',238,0,434),('Sketch',257,617,20)]:
 rec=json.loads((S/(stem+'.receipt.json')).read_text());log=(S/(stem+'.log')).read_text();data=(S/(stem+'.lean')).read_bytes()
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha(data) and rec['logSha256']==sha(log.encode())
 assert ': error' not in log and 'Exit status: 0' in log and 'timeout 1200' in log and '-j 1 -M 8192' in log
 assert log.count('warning:')==log.count('warning: declaration uses \u0060sorry\u0060')==warnings
 assert rec['axiomAudits']==audits and len(re.findall(r'^example\b',data.decode(),re.M))==examples
 au=re.findall(r"'([^']+)' depends on axioms:\s*\[([^]]*)\]",log);assert len(au)==audits
 for name,axs in au:assert set(x.strip() for x in axs.replace('\n',' ').split(',') if x.strip())<={'propext','Classical.choice','Quot.sound'},(name,axs)
 if stem=='Native':
  assert {'TauCeti.GenusOne.FerrandPushout.'+n for n in ['conductor_localized_image_criterion','conductor_localized_fraction_image','conductor_localized_product_criterion','conductor_localized_mem_iff_images','conductor_localization_finite_generators','conductor_localization_recomputed','conductor_localization']}<={name for name,_ in au}
 comp[stem]=rec
GUARDS=['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/expansion/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','data/library-coverage.json','research/blueprint/reviews/REV-AUDIT-10.md','data/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/reserved-ids.json','research/blueprint/keydefs/owners.json','content/tau-ceti/JacobianChallenge/README.md','content/tau-ceti/StableReduction/README.md','content/tau-ceti/AlgebraicCurves/README.md','scripts/check_blueprint.py','scripts/source_issues.py','scripts/build.py','scripts/blueprints.py','research/blueprint/intake.py']
for f in GUARDS+FILES:assert blob(MATH,f)==blob(BASE,f),('changed input',f)
proposal=dict(zip(FILES,[(S/n).read_text() for n in ['Candidate-roadmap.json','Candidate.json','Reader.md']]+[(S/'Published.lean').read_text() if (S/'Published.lean').exists() else canonical,(S/'Handoff.md').read_text() if (S/'Handoff.md').exists() else (S/'Input-handoff.md').read_text()]))
for f,t in proposal.items():assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),f
if (S/'Published.lean').exists():
 pub=(S/'Published.lean').read_text();m=re.search(r'\n/- RECOMPUTED_CONDUCTOR_ARCHIVE_N25\n(.*?)\nEND RECOMPUTED_CONDUCTOR_ARCHIVE_N25 -/\n$',pub,re.S);assert m
 assert pub[:m.start()]==canonical
 current=json.loads(zlib.decompress(base64.b64decode(m.group(1))))
 for name,item in current.items():assert sha(item['text'].encode())==item['sha256'] and (S/name).read_text()==item['text'],name
 for name,h in json.loads((S/'ReplayManifest.json').read_text()).items():
  assert sha((S/name).read_bytes())==h,name
  match=re.search(r'### '+re.escape(name)+r'\n\n\u0060\u0060\u0060python\n(.*?)\n\u0060\u0060\u0060\n',(S/'Handoff.md').read_text(),re.S);assert match and (match.group(1)+'\n').encode()==(S/name).read_bytes(),name
os.environ['NERON_VALIDATE_BASE']=BASE;import immutable;immutable.install();sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,checker=check_blueprint.check(S/(RID+'.json'),check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for f,t in proposal.items() for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,FILES,False,{'codex-a71f92'},set());assert not problems and not refusals,(problems,refusals)
import check_errata
errata=check_errata.check({'roadmapId':RID,'protocol':'errata-v1','sourceIssues':p['sourceIssues'],'sourceVersions':[dict(kind=('preprint' if x['id']=='schroer' else 'author copy'),url=x['url'],read=x.get('accessed'),sha256=x.get('sha256'),attribution='Inherited source record; no fresh erratum audit claimed') for x in old['sources'] if x['id'] in {f['source'] for f in p['sourceIssues']}]},RID);assert not errata,errata
print(json.dumps(dict(mathematicalBase=MATH,publicationBase=BASE,preservedContracts=565,preservedWholeNodes=564,changedExisting=changed,newNodes=6,newApi=0,newTests=4,checker={k:v for k,v in checker.items() if k!='packet'},compilation=comp,canonicalSha256=sha(canonical.encode()),fullCanonicalCompiled=False,guardsUnchanged=len(GUARDS)+5,incomingArchiveAuthenticated=34,incomingHelpersAuthenticated=len(incomingHelpers),intakeProblems=problems,intakeRefusals=refusals,erratumErrors=errata),indent=2))
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
BASE = os.environ.get('NERON_VALIDATE_BASE', 'ba26650311df0a78e2f01f19bd298bfc7d636794')
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
old=json.loads((S/'Input-packets.json').read_text())
nodes={n['id']:n for n in p['nodes']}
own_definition=json.loads((S/'Candidate-roadmap.json').read_text())
old_definition=json.loads((S/'Input-roadmaps.json').read_text())
os.environ.setdefault('NERON_VALIDATE_BASE', (S/'publication-base.txt').read_text().strip())
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

### compile.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean'}
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip()==pin
assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=mathlib,text=True).strip()
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.34.0-rc2'
version=subprocess.check_output([str(lean),'--version'],text=True).strip()
assert '4.34.0-rc2' in version and '6a10ac8c22beadecabdbb0919c2b50214762f91d' in version,version
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
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j','1','-M','8192',str(out/name)],env=env)
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

