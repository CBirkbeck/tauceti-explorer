# DESIGN-FunctionFieldArithmeticPartII: normalization over the changed base

Worker: Codex — codex-5ebb6f. Issue3403; partial continuation. All717 nodes remain unchecked and all10 stages partial.

The actual normalization covers now form a native natural isomorphism over Spec C with the native Over.pullback of the normalization functor over Spec B, for positive exponent and arbitrary A-algebra change. Its object components use the prior scheme comparison and native pullback symmetry; all four projection laws and actual framed-arrow naturality are specified. The whiskered native adjunction counit recovers the existing normalizationChangeNatTrans, and the whole normalized-chart natural transformation transports in both directions.

The8 new examples include a nonflat Z/4 to Z/2 map killing a nonzero square-zero section and collapsing a nonidentity minus-one stabilizer. The actual pullback of that normalization arrow becomes identity. No faithfulness of coefficient change or pullback is inferred. Wild exponents and the zero ring remain allowed. The positive-exponent boundary is explicit.

All701 incoming nodes and338 baseline entries are retained as whole objects. This continuation appends16 nodes (3 constructions,13 lemmas),13 API items,8 tests with16 construction references, and9 precisely read native baseline imports. No old API or test is changed. The only existing metadata changes append the frontier to packet summary, RS.0 coverage, TOWER-TYPING detail and RS.0 roadmap description, plus one source entry and the9 baseline imports. All8 gaps,13 requests,40 planets,11 inherited source findings, version envelopes, all38 symplectic route contracts and the complete inherited source/omission ledgers remain intact.

General native sheaf RootObject comparison, local frames, fppf stackification, effective fpqc descent, higher coherence, infinite genuine 2-limits, higher-universe adapters and all geometric/sheaf/reciprocity suppliers remain open. Resume with the actual native sheaf RootObject-to-chosen-frame comparison and its local frame construction; do not re-plan the now-proved normalization maps, natural isomorphism or chart transport. The higher chosen coherence and general descent comparisons still need their own declarations.

Freshly read the complete issue before/after the bot-confirmed claim; all196 comments mechanically classified. Read the full parent FA.0–FA.7 reviewed audit and REV-AUDIT-20, owned stage descriptions, all gaps/requests/coverage, reserved canonical key and survey/owner records, sourceCoverage table and routing proposal metadata. Earlier same-worker full AlgebraicCurves/JacobianChallenge and both protocols are reused only after fresh byte guards. Fresh pinned statements and surrounding hypotheses are recorded in Reading.json; peer reading receipts remain inherited provenance. No full fresh reading of the1.2MB incoming reader, whole packet/native source, inherited complete papers or symplectic proofs is claimed.

The [Stacks fibre-product section](https://stacks.math.columbia.edu/tag/01JO) was read in full, including its printed proofs and comments; the [root-stack literature guide](https://stacks.math.columbia.edu/tag/04V8) was read in full for context. The exact normalization Over and chart equations are authored deductions, not source quotations. All general categorical operations are native imports, including Over.pullback and its adjunction counit. The bounded open Mathlib root-stack PR search returned0; no exhaustive absence claim is made.

Incoming [PR6087](https://github.com/CBirkbeck/tauceti-explorer/pull/6087), head9ab61ade2f252f0521fce3d75b3041672ee67cd0, was authenticated through public HTTP:79 artifacts,10 helpers and all5 final files exactly matched the claimed-base inputs. Both actual archived verifiers reproduced their recorded mathematical and publication results exactly, with no Lean executed by those verifiers. Their artifacts remain recoverable in incoming/. The complete authenticated native prefix was freshly compiled as Context before prototyping.

Native proof evidence: 11648 lines,422 examples,618 standard-axiom audits plus1 axiom-free audit,0 warnings/errors/admissions; source SHA256 `9bd9123162366caaba5c7232c895d2abc92e30ff4a388a19e393a333c3956b24`, log SHA256 `d8cce47cc0d9f559696d6a957a9ebb537c0e0a8ad0009e42daa65754b119795b`.

Mathlib-only admitted canonical cone: 9411 lines,422 examples,549 warnings solely from sorry,231 audits without sorryAx; source SHA256 `575fb01d7e285789d6981df1f247b2ec6ac6c8a99102bd4e622362814c5aa7ce`, log SHA256 `1e8a16f08c710335bebfe671ae64778c3378884a58c070d6ef2b50b078b73b0a`.

The entire canonical Tau Ceti file is UNCOMPILED. The available Tau build is at a different commit and lacks all4 required compiled Tau imports. No Lake setup, updates, cache downloads or library builds were performed. Every Lean run was serial, memory-guarded with at least20GiB available, one thread,8GiB cap and20-minute timeout. Source and log hashes bind the actual checks; successful native evidence does not close the planning implementations or general geometry.

The actual indexed checker, source/version checks and actual intake report0 errors/warnings/problems/refusals. The immutable atlas stage graph has3057 vertices/8726 edges; owned declaration graph717/1556; scoped graph3879/11523; all acyclic. All89 required supplier paths reach, all foreign roadmap and stage objects and inherited stage-edge objects are unchanged, and this roadmap has no skipped or pending links. The45 unrelated preexisting unreachable restructure pairs remain unchanged. The verifier reads843 immutable atlas/checker inputs at base `2c175a30fabe58e901fcdd386506ee6e2ac6280f` without a repository snapshot.

Proof archive: `a8193c6345370dee2b43439afc7f6b2e6a60d70f`
Artifact manifest SHA256: `e111ce75e75498fd5f3a6d74d30c89a3a29a5f29876364d825a475a33cfc4a6f`
Artifact payload SHA256: `0f7de4cdde56eb333ff60877857bf41324b3df502ed6befcc9a61b6a3f592cfa`
Recovery helper SHA256: `136a9161ef0b7bbabe45cf1753cc5404d51c315ba4009dd5f44430546e754f87`

The ancestor contains the complete selected proof sources, logs, receipts, incoming recovery artifacts and all helper bodies in an inert comment in the issue’s suggested Lean file. The final suggested file retains the original canonical prefix and appends the actual construction bodies and admitted lemma/test signatures. No Lean code is placed in the packet or reader. Recovery requires an output directory and the final public head SHA. Run recover.py OUTPUT HEAD, then from an existing repository checkout run python3 OUTPUT/verify.py OUTPUT DECLARATION_INDEX. This replays actual immutable checker/intake/atlas and all source/header/receipt/preservation checks without Lean. Serial compilation can be replayed with compile.py/runcheck.py using an existing exact-pin Mathlib build and Lean binary only.

## Script: recover.py

```python
"""Recover and authenticate every proof artifact and final deliverable from public HTTP."""
from pathlib import Path
import base64,gzip,hashlib,json,re,sys,urllib.request
out=Path(sys.argv[1]).resolve();head=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',head)
out.mkdir(parents=True,exist_ok=True);RID='FunctionFieldArithmeticPartII';repo='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
sha=lambda b:hashlib.sha256(b).hexdigest()
def get(ref,path):return urllib.request.urlopen(repo+ref+'/'+path,timeout=90).read()
handoff_path='research/blueprint/handoff/DESIGN-'+RID+'.md'
handoff=get(head,handoff_path);text=handoff.decode()
archive=re.search(r'Proof archive: `([0-9a-f]{40})`',text)[1]
manifest_sha=re.search(r'Artifact manifest SHA256: `([0-9a-f]{64})`',text)[1]
payload_sha=re.search(r'Artifact payload SHA256: `([0-9a-f]{64})`',text)[1]
recover_sha=re.search(r'Recovery helper SHA256: `([0-9a-f]{64})`',text)[1]
assert sha(Path(__file__).read_bytes())==recover_sha
blob=get(archive,'research/blueprint/suggested/'+RID+'.lean').decode()
manifest_bytes=base64.b64decode(blob.split('TAUCETI-OVER-MANIFEST-BEGIN\n',1)[1].split('\nTAUCETI-OVER-MANIFEST-END',1)[0])
payload=base64.b85decode(''.join(blob.split('TAUCETI-OVER-PAYLOAD-BEGIN\n',1)[1].split('\nTAUCETI-OVER-PAYLOAD-END',1)[0].splitlines()))
assert sha(manifest_bytes)==manifest_sha and sha(payload)==payload_sha
manifest=json.loads(manifest_bytes);artifacts=json.loads(gzip.decompress(payload));assert set(manifest)==set(artifacts)
for name,encoded in artifacts.items():
 path=Path(name);assert not path.is_absolute() and '..'not in path.parts
 data=base64.b64decode(encoded);m=manifest[name];assert len(data)==m['bytes'] and sha(data)==m['sha256'] and len(data.splitlines())==m['lines'],name
 target=out/path;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
(out/'artifact-manifest.json').write_bytes(manifest_bytes)
fence=chr(96)*3;helpers=0
for name in ['recover.py','verify.py','immutable_view.py','graph.py','projection.py','assemble.py','compile.py','runcheck.py','author.py','package.py']:
 code=text.split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert code.encode()==(out/name).read_bytes(),name;helpers+=1
final={}
for folder,extension,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean')]:
 path='research/blueprint/'+folder+'/'+RID+'.'+extension;data=get(head,path);assert data==(out/name).read_bytes(),path;final[path]=sha(data)
final[handoff_path]=sha(handoff);(out/'PublicHandoff.md').write_bytes(handoff)
record=dict(head=head,archive=archive,manifestSha256=manifest_sha,payloadSha256=payload_sha,recoveryHelperSha256=recover_sha,artifactsVerified=len(manifest),archivedHelpersVerified=helpers,finalDeliverables=final,transport='Public HTTP only; archive payload and final head bytes authenticated.')
(out/'public-recovery.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record,indent=2))
```

## Script: verify.py

```python
"""Replay preservation, native receipts and actual immutable checker/intake/atlas; no Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S));RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
t=lambda n:(S/n).read_text()
d=lambda n:json.loads(t(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
BASE=t('base.txt').strip();assert BASE==t('publication-base.txt').strip()
def blob(p):return subprocess.check_output(['git','show',BASE+':'+p],cwd=R)
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
for p,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(p)==(S/n).read_bytes(),p
old=d('Incoming.json');p=d('Candidate.json');road=d('Candidate-roadmap.json');oldroad=d('Incoming-roadmap.json');plan=d('Plan.json')
assert len(old['nodes'])==701 and p['nodes'][:701]==old['nodes'] and p['nodes'][701:]==d('NewNodes.json')
assert len(p['nodes'])==717 and len(d('NewNodes.json'))==16
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps']:assert p[k]==old[k],k
assert p['summary']==old['summary']+' '+plan['frontier'] and p['sources'][:-1]==old['sources']
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:338]==old['baseline']['declarations']
assert [x['ref']for x in p['baseline']['declarations'][338:]]==plan['newBaselineRefs'] and len(plan['newBaselineRefs'])==9
for a,b in zip(old['coverage'],p['coverage']):
 expected=json.loads(json.dumps(a))
 if a['stageId']==RID+':RS.0':expected['remaining'].append(plan['frontier'])
 assert b==expected
for a,b in zip(old['gaps'],p['gaps']):
 expected=json.loads(json.dumps(a))
 if a['id']=='TOWER-TYPING':expected['detail']+=' '+plan['frontier']
 assert b==expected
assert {k:v for k,v in road.items()if k!='stages'}=={k:v for k,v in oldroad.items()if k!='stages'}
for a,b in zip(oldroad['stages'],road['stages']):
 expected=json.loads(json.dumps(a))
 if a['key']=='RS.0':expected['description']+=' '+plan['frontier']
 assert b==expected
assert p['status']=='partial' and len(p['gaps'])==8 and len(p['requests'])==13 and len(p['coverage'])==10
assert all(x['status']=='partial'for x in p['coverage']) and all(x['implementationStatus']=='unchecked'for x in p['nodes'])
assert sum(bool(x.get('planet'))for x in p['nodes'])==40
assert len(p['sourceIssues'])==11 and len(p['restructure'][0]['itemInventory'])==38
assert t('Reader.md')==t('ReaderAddition.md')+t('IncomingReader.md')
from projection import project
assert t('NewAdmitted.lean')==project(t('NewProofs.lean'),t('NewTests.lean'))
def prefix(n):
 text=t(n);i=text.index('import ');return text[:i]+t('NewImports.lean')+'\n'+text[i:]
assert t('CanonicalPrefix.lean')==t('Incoming.lean')
assert t('Canonical.lean')==prefix('CanonicalPrefix.lean')+'\n'+t('NewAdmitted.lean')==t('Suggested.lean')
assert t('Sketch.lean')==prefix('SketchPrefix.lean')+'\n'+t('NewAdmitted.lean')
assert t('Native.lean')==prefix('NativePrefix.lean')+'\n'+t('NewProofs.lean')+'\n'+t('NewTests.lean')+'\n'+t('Audits.lean')
assert t('Prototype.lean')=='import Context\n'+t('NewImports.lean')+t('NewProofs.lean')+'\n'+t('NewTests.lean')
assert t('Context.lean')==t('NativePrefix.lean')
assert t('NativePrefix.lean')==t('incoming/Native.lean') and t('SketchPrefix.lean')==t('incoming/Sketch.lean')
for n,m in d('incoming/artifact-manifest.json').items():
 b=(S/'incoming'/n).read_bytes();assert len(b)==m['bytes'] and sha(b)==m['sha256'],n
assert d('IncomingVerification-publication.json')==d('incoming/Verification.json')
assert d('IncomingVerification-mathematical.json')==d('incoming/Verification-mathematical.json')
assert d('IncomingReceipt.json')['fiveFilesMatchClaimedBase'] and d('IncomingReceipt.json')['bothActualVerifiersMatchRecordedExactly']
assert d('incoming/public-recovery.json')['artifactsVerified']==79 and d('incoming/public-recovery.json')['archivedHelpersVerified']==10
for n in ['Native','Sketch']:
 m=d('incoming/artifact-manifest.json')[n+'.lean'];assert sha((S/'incoming'/(n+'.lean')).read_bytes())==m['sha256']
claim=d('ClaimReceipt.json');assert claim['issue']==3403 and claim['claim']==5983175305 and claim['bot']==5983176705 and claim['beforeAfterEqual']
assert sum(x['characters']for x in claim['readParts'])==claim['characters']==19646 and claim['commentsInspected']==196
assert d('TauProbe.json')['fullCanonicalExecution'].startswith('UNCOMPILED')
for source in d('SourceReading.json'):
 tag=source['url'].rsplit('/',1)[1];assert source['sha256']==sha((S/('Stacks-'+tag+'.html')).read_bytes())
assert p['sources'][-1]['sha256']==d('SourceReading.json')[1]['sha256']
for g in d('InputGuard.json'):assert sha(blob(g['path']))==g['sha256'],g['path']
assert len(d('Reading.json')['sameSessionReuse'])==4
for g in d('Reading.json')['sameSessionReuse']:assert sha(blob(g['path']))==g['sha256']
assert sha(Path(sys.argv[2]).read_bytes())==d('LibrarySearch.json')['indexSha256']=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
def headers(text):
 found={}
 for m in re.finditer(r'^(def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None;pending=0
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and re.match(r'let(?:I)?\b',text[i:])and(i==0 or not(text[i-1].isalnum()or text[i-1]=='_')):pending+=1
   if depth==0 and text.startswith(':=',i):
    if pending:pending-=1
    else:end=i;break
  assert end is not None
  label=m.group(2)if m.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(text[m.start():end].split())
 return found
nh=headers(t('NewProofs.lean'));nt=headers(t('NewTests.lean'));ch=headers(t('NewAdmitted.lean'))
assert {**nh,**nt}==ch and len(nh)==16 and len(nt)==8
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][701:]}
assert {a['name']for a in d('NewTests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',t('NewTests.lean'),re.M)}
assert not any(re.search(r'\b(?:sorry|admit|axiom)\b',v)for v in ch.values())
assert not re.search(r'\b(?:sorry|admit|axiom)\b',t('Native.lean'))
for n in p['nodes'][701:]:
 if n['kind']=='construction':assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 assert n['declarationName']in t('Reader.md')and n['statement']in t('Reader.md')
 for a in n['api']+n['tests']:assert a['name']in t('Reader.md')and a['statement']in t('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][701:])==13 and sum(len(n['tests'])for n in p['nodes'][701:])==16
compilation={}
for name,warnings,audits in [('Context',0,602),('Prototype',0,0),('Native',0,618),('Sketch',549,231)]:
 rec=d(name+'.receipt.json');log=t(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20 and rec['warnings']==warnings
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==warnings
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits,(name,len(a))
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(t(name+'.lean').splitlines()),'examples':len(re.findall(r'^example\b',t(name+'.lean'),re.M)),'axiomFreeAudits':log.count('does not depend on any axioms')}
assert compilation['Native']['examples']==compilation['Sketch']['examples']==422
audited=set(re.findall(r"'([^']+)' (?:depends on axioms:|does not depend on any axioms)",t('Native.log')));assert set(plan['newNames'])<=audited
assert 'z ≠ 0' in nt['example#3'] and 'z ^ 2 = 0' in nt['example#3'] and 'normalizationBaseChangeNatIso' in nt['example#3']
assert 'h ≠ 𝟙 p' in nt['example#4'] and 'Over.pullback' in nt['example#4']
names=['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'];contents={p:t(n)for p,n in zip(paths,names)}
for path,text in contents.items():
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',text),path
 assert not re.search(r'[ \t]+$',text,re.M),path
if(S/'artifact-manifest.json').exists():
 for n,m in d('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
fence=chr(96)*3
for n in ['recover.py','verify.py','immutable_view.py','graph.py','projection.py','assemble.py','compile.py','runcheck.py','author.py','package.py']:
 embedded=t('PublicHandoff.md').split('## Script: '+n+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n';assert embedded==t(n),n
os.environ['ROOTS_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,text in contents.items():immutable_view.CACHE[path]=text.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings);summary['packet']=paths[1]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-5ebb6f'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True));assert graph==d('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=701,newNodes=16,newAPIItems=13,newTests=8,newTestReferences=16,matchedNewHeaders=24,rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution=d('TauProbe.json')['fullCanonicalExecution'],inputGuards=23,indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
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
BASE = os.environ.get('ROOTS_VALIDATE_BASE', (Path(__file__).resolve().parent/'publication-base.txt').read_text().strip())
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

## Script: graph.py

```python
from pathlib import Path
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'));import build,blueprints,check_blueprint
RID='FunctionFieldArithmeticPartII';FILES=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming.json').read_text());rd=json.loads((S/'Candidate-roadmap.json').read_text());rold=json.loads((S/'Incoming-roadmap.json').read_text());nodes={n['id']:n for n in p['nodes']}
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
before_edges={(e['source'],e['target'])for e in b['stageEdges']}
added=se-before_edges
expected=set()
assert added==expected and not(before_edges-se),{'added':sorted(added),'removed':sorted(before_edges-se)}
assert all(s in nodes and t in nodes and nodes[s].get('planet')and nodes[t].get('planet')for s,t in added)
assert all(e['kind']=='blueprint'for e in a['stageEdges']if(e['source'],e['target'])in added)
assert [e for e in a['stageEdges']if(e['source'],e['target'])not in added]==b['stageEdges']
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
# All inherited edges remain identical; added edges join existing owned planets only.
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(nodes)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks',[])
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br if x!=RID)
assert {k:v for k,v in ar.items() if k!=RID}=={k:v for k,v in br.items() if k!=RID}
assert {x['id']:x for x in a['stages'] if not x['id'].startswith(RID+':')}=={x['id']:x for x in b['stages'] if not x['id'].startswith(RID+':')}
summary={'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'ownRestructurePairs':sum(s.startswith(RID+':') or t.startswith(RID+':') for s,t in rspairs),'otherPreexistingUnreachableRestructurePairs':len(missing_restructures),'otherUnreachableRestructurePairListSha256':hashlib.sha256(json.dumps(missing_restructures).encode()).hexdigest(),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True,'inheritedStageEdgeObjectsUnchanged':True,'newInternalPlanetEdges':sorted(added)}

summary['worldCommit']=immutable_view.BASE
summary['foreignRoadmapsAndStagesUnchanged']=True
summary['immutableInputHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
print(json.dumps(summary,indent=2))
```

## Script: projection.py

```python
"""Admit lemma and example proofs while retaining actual construction bodies."""
import re
def admit_lemmas(text):
 lines=text.splitlines(keepends=True);out=[];i=0
 while i<len(lines):
  if re.match(r'^(?:lemma|theorem) |^example\b',lines[i]):
   j=i+1
   while j<len(lines)and(not lines[j].strip()or lines[j][0].isspace()):j+=1
   block=''.join(lines[i:j]);depth=0;pos=None;pending_let=0
   for k,c in enumerate(block):
    if c in '([{':depth+=1
    elif c in ')]}':depth-=1
    if depth==0 and re.match(r'let(?:I)?\b',block[k:]) and (k==0 or not (block[k-1].isalnum() or block[k-1]=='_')):
     pending_let+=1
    if block[k:k+2]==':='and depth==0:
     if pending_let:pending_let-=1
     else:pos=k;break
   assert pos is not None,block
   out.append(block[:pos]+':= by\n  sorry\n\n');i=j
  else:out.append(lines[i]);i+=1
 return ''.join(out)
def split_imports(text):
 lines=text.splitlines(keepends=True);last=max(i for i,l in enumerate(lines)if l.startswith('import '))
 assert all(not l.strip()or l.startswith(('import ','--'))for l in lines[:last+1])
 return ''.join(lines[:last+1]),''.join(lines[last+1:])

def project(proofs,tests):
 return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
```

## Script: assemble.py

```python
"""Retain all incoming prefixes and append exact normalization base-change data."""
from pathlib import Path
import re
from projection import project
S=Path(__file__).resolve().parent
t=lambda n:(S/n).read_text()
def prefix(n):
 text=t(n);imports=t('NewImports.lean');i=text.index('import ');return text[:i]+imports+'\n'+text[i:] if imports.strip() else text
a=project(t('NewProofs.lean'),t('NewTests.lean'));(S/'NewAdmitted.lean').write_text(a)
for out,p in [('Canonical.lean','CanonicalPrefix.lean'),('Sketch.lean','SketchPrefix.lean')]:
 (S/out).write_text(prefix(p)+'\n'+a)
(S/'Suggested.lean').write_text(t('Canonical.lean'))
names=re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',t('NewProofs.lean'),re.M)
audit=''.join('#print axioms TauCeti.RootStack.'+n+'\n'for n in names);(S/'Audits.lean').write_text(audit)
(S/'Native.lean').write_text(prefix('NativePrefix.lean')+'\n'+t('NewProofs.lean')+'\n'+t('NewTests.lean')+'\n'+audit)
```

## Script: compile.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','Context.lean'}
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
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs+[out])
extra=['-o',str(out/'Context.olean')]if name=='Context.lean'else[]
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j','1','-M','8192']+extra+[str(out/name)],env=env,cwd=out)
sys.exit(result.returncode)
```

## Script: runcheck.py

```python
"""Serial checked replay with bounded diagnostics and apply_patch receipt writes."""
from pathlib import Path
import subprocess,sys,hashlib,json,re,time
S=Path(sys.argv[1]).resolve();name=sys.argv[4];prefix=name[:-5]
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

## Script: author.py

```python
"""Append the actual Over normalization comparison; preserve every incoming node."""
from pathlib import Path
import csv,copy,hashlib,json,re,sys
S=Path(sys.argv[1]).resolve();RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
t=lambda n:(S/n).read_text()
data=lambda n:json.loads(t(n))
def put(n,x): (S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=data('Incoming.json');p=copy.deepcopy(old);rd=data('Incoming-roadmap.json')
owned={n.get('declarationName','')[len(NS):]:n['id'] for n in old['nodes']}
items=[
('FramedRoot.normalizationOverBaseChangeIso','normalization-over-iso','The normalization comparison over the changed base','For every positive n and actual chosen-frame root p over B, construct an isomorphism in Over(Spec C) from the normalization of the changed root to the native Over.pullback of its original normalization cover along Spec(phi). Its underlying scheme isomorphism is the existing normalizationBaseChangeIso followed by native pullback symmetry. The target has normalization first and Spec(phi) second.', ['FramedRoot.normalizationBaseChangeIso','FramedRoot.normalizationBaseChangeIso_hom_fst','mathlib:CategoryTheory.Over.isoMk','mathlib:CategoryTheory.Over.pullback','mathlib:CategoryTheory.Limits.pullbackSymmetry','mathlib:CategoryTheory.Limits.pullbackSymmetry_hom_comp_snd'],'Use the existing native Cartesian scheme comparison, then native pullback symmetry to match Over.pullback. Its second projection is the changed normalization structure map, giving the required Over triangle.'),
('FramedRoot.normalizationOverBaseChangeIso_hom_fst','normalization-over-hom-first','The original-cover projection of the Over comparison','The underlying forward component followed by the first projection of the native Over.pullback equals Spec(normalizationChange(phi,p)), the actual map to the original normalization scheme.', ['FramedRoot.normalizationOverBaseChangeIso','FramedRoot.normalizationBaseChangeIso_hom_snd','mathlib:CategoryTheory.Limits.pullbackSymmetry_hom_comp_fst'],'Compute the composite through symmetry and use the existing second-projection equation.'),
('FramedRoot.normalizationOverBaseChangeIso_hom_snd','normalization-over-hom-second','The changed-base projection of the Over comparison','The underlying forward component followed by the second projection of the native Over.pullback equals the changed root normalizationSpecMap to Spec C.', ['FramedRoot.normalizationOverBaseChangeIso','FramedRoot.normalizationBaseChangeIso_hom_fst','mathlib:CategoryTheory.Limits.pullbackSymmetry_hom_comp_snd'],'Compute the composite through symmetry and use the existing first-projection equation.'),
('FramedRoot.normalizationOverBaseChangeIso_inv_fst','normalization-over-inverse-first','The original-cover projection of the inverse comparison','The underlying inverse component followed by Spec(normalizationChange(phi,p)) equals the first projection of the native Over.pullback.', ['FramedRoot.normalizationOverBaseChangeIso_hom_fst','mathlib:CategoryTheory.Over.inv_left_hom_left'],'Substitute the forward first projection and use the actual Over isomorphism roundtrip.'),
('FramedRoot.normalizationOverBaseChangeIso_inv_snd','normalization-over-inverse-second','The changed-base projection of the inverse comparison','The underlying inverse component followed by the changed normalizationSpecMap equals the second projection of the native Over.pullback.', ['FramedRoot.normalizationOverBaseChangeIso_hom_snd','mathlib:CategoryTheory.Over.inv_left_hom_left'],'Substitute the forward second projection and use the actual Over isomorphism roundtrip.'),
('FramedRoot.normalizationOverBaseChangeIso_naturality','normalization-over-naturality','Naturality in all actual framed arrows','For every actual framed arrow h:p to q, changing h and then applying the Over comparison equals applying the comparison at p and then the actual Over.pullback image of normalizationFunctor.map h. This is equality of actual Over morphisms with all unit labels retained.', ['FramedRoot.normalizationOverBaseChangeIso_hom_fst','FramedRoot.normalizationOverBaseChangeIso_hom_snd','normalizationChangeNatTrans','FramedRoot.normalizationRingMap_overBase','mathlib:CategoryTheory.Over.OverMorphism.ext','mathlib:CategoryTheory.Limits.pullback.hom_ext','mathlib:CategoryTheory.Limits.pullback.lift_fst','mathlib:CategoryTheory.Limits.pullback.lift_snd','mathlib:CategoryTheory.Over.pullback'],'Use Over morphism extensionality and both native pullback projections. The first equation is the existing normalization-change naturality law; the second is the changed arrow base triangle.'),
('normalizationBaseChangeNatIso','normalization-base-change-natural-iso','The natural base-change isomorphism of normalization functors','For every positive n and arbitrary A-algebra homomorphism phi:B to C, construct a native natural isomorphism from framedRootChange(phi) followed by normalizationFunctor over C to normalizationFunctor over B followed by native Over.pullback along Spec(phi). Its components are the actual normalizationOverBaseChangeIso.', ['FramedRoot.normalizationOverBaseChangeIso','FramedRoot.normalizationOverBaseChangeIso_naturality','mathlib:CategoryTheory.NatIso.ofComponents'],'Apply native NatIso.ofComponents to the actual Over isomorphisms and the proved equality for every framed arrow. Native inverse naturality and both functor roundtrips follow from this constructor.'),
('normalizationBaseChangeNatIso_app','normalization-base-change-natural-component','Components of the normalization natural isomorphism','The component at p of normalizationBaseChangeNatIso(phi) is exactly p.normalizationOverBaseChangeIso(phi).', ['normalizationBaseChangeNatIso'],'Compute the native NatIso.ofComponents component.'),
('normalizationPullbackProjection','normalization-pullback-projection','The native projection of pulled-back normalization covers','Specialize the counit of the existing native Over.map/Over.pullback adjunction to normalizationFunctor and forget the base. This gives a native natural transformation from the pulled-back normalization schemes over C to the original normalization schemes over B, with first-pullback-projection components. This is an adapter of existing generic categorical infrastructure, not a new generic pullback construction.', ['normalizationFunctor','mathlib:CategoryTheory.Over.pullback','mathlib:CategoryTheory.Over.mapPullbackAdj','mathlib:CategoryTheory.Over.forget'],'Whisker the native adjunction counit by normalizationFunctor on the left and Over.forget on the right. Over.map changes the base triangle while retaining the underlying scheme and arrow.'),
('normalizationPullbackProjection_app','normalization-pullback-projection-component','Components of the native normalization projection','The component at p of normalizationPullbackProjection(phi) is the first projection from the native pullback of p.normalizationSpecMap and Spec(phi).', ['normalizationPullbackProjection'],'Compute the native adjunction counit and both whiskerings.'),
('normalizationPullbackProjection_base','normalization-pullback-projection-base','The base triangle of the pulled-back cover','The component projection to the original normalization scheme followed by p.normalizationSpecMap equals the second pullback projection to Spec C followed by Spec(phi).', ['normalizationPullbackProjection_app','mathlib:CategoryTheory.Limits.pullback.condition'],'Use the existing native pullback condition with normalization first and Spec(phi) second.'),
('normalizationPullbackProjection_naturality','normalization-pullback-projection-arrows','Arrow compatibility of the pulled-back cover projection','For every actual h:p to q, the underlying scheme map of Over.pullback(normalizationFunctor.map h) followed by the projection at q equals the projection at p followed by the original normalizationFunctor.map h.', ['normalizationPullbackProjection'],'Apply the naturality of the actual whiskered native adjunction counit.'),
('normalizationBaseChangeNatIso_projection','normalization-natural-iso-projection','Recovery of the original normalization-change transformation','Forget the Over base of the whole forward normalizationBaseChangeNatIso and compose with normalizationPullbackProjection. The resulting native natural transformation equals normalizationChangeNatTrans(phi) exactly.', ['normalizationBaseChangeNatIso_app','normalizationPullbackProjection_app','FramedRoot.normalizationOverBaseChangeIso_hom_fst','normalizationChangeNatTrans'],'Use natural-transformation extensionality and the forward original-cover projection at every actual framed root.'),
('normalizationBaseChangeNatIso_chart','normalization-natural-iso-chart','Transport of the whole normalized chart transformation','The forgotten forward normalizationBaseChangeNatIso followed by normalizationPullbackProjection and the original normalizationChartNatTrans equals the left whiskering of the changed normalizationChartNatTrans by framedRootChange(phi), as whole native natural transformations.', ['normalizationBaseChangeNatIso_projection','normalizationChangeNatTrans_chart'],'Reassociate the actual natural transformations, recover normalizationChangeNatTrans, then apply its existing whole chart-factorization equation.'),
('normalizationBaseChangeNatIso_inverse_projection','normalization-natural-iso-inverse-projection','Recovery of the pullback projection through the inverse','The forgotten inverse normalizationBaseChangeNatIso followed by normalizationChangeNatTrans(phi) equals normalizationPullbackProjection(phi), as whole native natural transformations.', ['normalizationBaseChangeNatIso_app','normalizationPullbackProjection_app','FramedRoot.normalizationOverBaseChangeIso_inv_fst','normalizationChangeNatTrans'],'Use natural-transformation extensionality and the inverse original-cover projection at each actual framed root.'),
('normalizationBaseChangeNatIso_inverse_chart','normalization-natural-iso-inverse-chart','Inverse transport of the whole normalized chart transformation','The forgotten inverse normalizationBaseChangeNatIso followed by the changed chart transformation whiskered by framedRootChange(phi) equals normalizationPullbackProjection followed by the original chart transformation.', ['normalizationBaseChangeNatIso_inverse_projection','normalizationChangeNatTrans_chart'],'Substitute the existing chart factorization, reassociate, and use the whole inverse projection identity.')]
testdata=[
('over_projections_roundtrips','compatibility','For arbitrary positive exponent, check both forward and inverse projections in the native Over category and both actual Over morphism roundtrips.'),
('whole_chart_transport','compatibility','Check both whole projection-recovery equalities and both whole chart-transport equalities as native natural transformations.'),
('actual_arrow_naturality','compatibility','For every actual framed arrow, check forward and inverse naturality as actual Over morphisms, retaining all unit labels.'),
('killed_nilpotent','non-example','For the actual nonflat Z/4 to Z/2 map of Z-algebras and p=(1,2) at n=2,f=0, the normalized chart section z is nonzero with z squared zero and is killed by normalizationChange. The actual natural-isomorphism component followed by its pullback projection still gives the changed chart map.'),
('collapsed_stabilizer','non-example','For the same quotient and the zero-section root p=(1,0), the minus-one framed automorphism is nonidentity over Z/4 but becomes identity over Z/2. Naturality of the actual Over comparison proves the pullback of its normalization arrow is identity; no faithfulness of the coefficient-change functor or pullback is asserted.'),
('wild_exponent','degenerate','Over Z/3 at exponent3 and f=0, the exponent vanishes in the coefficient ring while the actual Over comparison roundtrip and pulled-back cover base triangle hold for every change of test Z-algebra.'),
('exponent_one','degenerate','At exponent one over arbitrary test algebras, the changed normalized chart root is the image of f, and the natural-isomorphism component followed by the native pullback projection recovers normalizationChangeNatTrans.'),
('zero_ring','degenerate','Over the zero ring Z/1 at exponent3, the actual inverse Over roundtrip and pulled-back cover base triangle hold without choosing any spectrum point.')]
tests=[dict(name=NS+'normalizationNatIsoTests.'+n,kind=k,statement=st)for n,k,st in testdata]
construct={'FramedRoot.normalizationOverBaseChangeIso','normalizationBaseChangeNatIso','normalizationPullbackProjection'}
ids={n:RID+':RS.0/'+slug for n,slug,*_ in items};lookup={**owned,**ids}
api_for={
 'FramedRoot.normalizationOverBaseChangeIso':[x[0]for x in items[1:6]],
 'normalizationBaseChangeNatIso':['normalizationBaseChangeNatIso_app','normalizationBaseChangeNatIso_projection','normalizationBaseChangeNatIso_chart','normalizationBaseChangeNatIso_inverse_projection','normalizationBaseChangeNatIso_inverse_chart'],
 'normalizationPullbackProjection':['normalizationPullbackProjection_app','normalizationPullbackProjection_base','normalizationPullbackProjection_naturality']}
test_for={'FramedRoot.normalizationOverBaseChangeIso':[0,2,3,5,7], 'normalizationBaseChangeNatIso':[1,2,3,4,5,6,7], 'normalizationPullbackProjection':[1,5,6,7]}
common=['Commutative rings A,B,C in a common arbitrary universe, specified A-algebra structures on B and C, arbitrary A-algebra homomorphism phi:B to C, arbitrary f in A and positive natural n expressed by the native NeZero instance. Actual chosen-frame roots carry bundled units u, sections y and u*y^n=image(f); actual arrows retain both defining equations and their unit labels.', 'No flatness, injectivity or surjectivity of phi, exponent-invertibility, reducedness, nontriviality or section-regularity is assumed. No root section is cancelled.', 'This is the finite chosen-frame normalization interface. Native sheaf RootObject comparison, local frames, fppf stackification, effective fpqc descent, higher coherence, infinite genuine 2-limits and higher-universe adapters remain open.']
statements={x[0]:x[3]for x in items}
source=dict(sourceId='NormalizationOver-codex-5ebb6f',locator='Stacks Section26.17 tag01JO: Definition26.17.1 and Lemma26.17.2; authored normalization functor deductions using pinned Over.pullback and its adjunction',excerpt='projection morphisms',match='The source gives the scheme fibre-product universal property and affine tensor interpretation. The exact Over comparison, adjunction-counit adapter and chart natural-transformation equations are authored deductions from the authenticated normalization maps, not theorems quoted from the source.')
nodes=[]
for name,slug,title,st,deps,proof in items:
 node=dict(id=ids[name],parentStageId=RID+':RS.0',realises=[RID+':RS.0'],kind='construction'if name in construct else'lemma',title=title,declarationName=NS+name,statement=st,hypotheses=common,prerequisites=[d if d.startswith(('mathlib:','tauceti:'))else lookup[d] for d in deps],proofSteps=[proof],acceptance=[st,'Use the actual pinned Over.pullback functor and its native adjunction, actual framed arrows and actual scheme morphisms; retain nonflat changes, wild exponents, nonzero nilpotent sections and the zero ring.'],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS0',namespace='TauCeti.RootStack'),sources=[source],api=[],tests=[],implementationStatus='unchecked')
 if name in construct:
  node['api']=[dict(name=NS+n,role='compatibility',statement=statements[n])for n in api_for[name]]
  node['tests']=[tests[i]for i in test_for[name]]
  node['uses']=[dict(where=RID+':RS.0/normalization-arrows-functor',how='Compare the actual faithful normalization cover functor with its native pullback over a changed test algebra, including both projections and all framed arrow labels.'),dict(where=RID+':RS.0/root-object',how='Supply an actual functor-level affine cover and normalized-chart comparison for the still-open native sheaf RootObject comparison and descent interfaces. No general root stack equivalence is inferred.')]
 nodes.append(node)
frontier='For every positive exponent and arbitrary change of test A-algebra, the actual chosen-frame normalization functor now has a native natural isomorphism over Spec C with the native Over.pullback of the normalization functor over Spec B. Its components use the existing chosen scheme comparison followed by native symmetry; both forward and inverse projections and actual framed-arrow naturality are specified. The actual native adjunction counit, specialized to normalization, recovers the previous normalizationChangeNatTrans through this isomorphism, and the whole normalized-chart natural transformation transports in both directions. The nonflat Z/4 to Z/2 tests kill a nonzero square-zero section and collapse a nonidentity minus-one stabilizer; no faithfulness of coefficient change or pullback is asserted. Wild exponents and zero rings are retained. General native sheaf RootObject comparison, local frames, fppf stackification, effective fpqc descent, higher coherence, infinite genuine 2-limits and higher-universe adapters remain open. All ten stages, eight gaps, thirteen requests, forty planets, both paper routes, the full omission ledger and inherited source findings retain their scope.'
p['nodes']+=nodes;p['summary']+=' '+frontier
p['sources'].append(dict(id='NormalizationOver-codex-5ebb6f',title='Fibre products of schemes and authored normalization comparisons over the changed base',authors='The Stacks Project Authors; normalization deductions Codex — codex-5ebb6f',edition='Current primary Section26.17 tag01JO, read4October2026; pinned native categorical interfaces',url='https://stacks.math.columbia.edu/tag/01JO',sha256=hashlib.sha256((S/'Stacks-01JO.html').read_bytes()).hexdigest(),accessed='2026-10-04',readSections=['Complete Section26.17, Definitions26.17.1/.7, Lemmas26.17.2–.6 and their printed proofs and eight comments; selected geometric context only.','Subsection112.5.13 tag04V8 complete narrative and literature references; context only. No new reading of the complete inherited Yun–Zhang or symplectic papers is claimed.']))
refs=sorted({d for n in nodes for d in n['prerequisites']if d.startswith('mathlib:')}-{d['ref']for d in p['baseline']['declarations']})
index={(x['library'],x['name']):x for x in csv.DictReader(open(sys.argv[2]),delimiter='\t')}
provides={
 'CategoryTheory.Limits.pullback.condition':'For f:X to Z and g:Y to Z with their native pullback, the first projection followed by f equals the second projection followed by g.',
 'CategoryTheory.Limits.pullbackSymmetry':'For any category and a chosen pullback of f and g, the native isomorphism from pullback(f,g) to pullback(g,f).',
 'CategoryTheory.Limits.pullbackSymmetry_hom_comp_fst':'The forward pullback symmetry followed by the target first projection equals the source second projection.',
 'CategoryTheory.Limits.pullbackSymmetry_hom_comp_snd':'The forward pullback symmetry followed by the target second projection equals the source first projection.',
 'CategoryTheory.NatIso.ofComponents':'Objectwise isomorphisms of two native functors satisfying forward naturality give a native natural isomorphism; the constructor proves inverse naturality by conjugating the forward equation.',
 'CategoryTheory.Over.inv_left_hom_left':'For an isomorphism in Over X, its underlying inverse followed by its underlying forward map equals the identity of the target underlying object.',
 'CategoryTheory.Over.isoMk':'An underlying-object isomorphism between two Over X objects whose forward map respects the structure map gives an actual isomorphism in Over X.',
 'CategoryTheory.Over.mapPullbackAdj':'For f:X to Y in a category with pullbacks along f, the native adjunction Over.map f left adjoint to Over.pullback f; its counit underlying map is the first pullback projection.',
 'CategoryTheory.Over.pullback':'For f:X to Y in a category with pullbacks along f, the native functor Over Y to Over X sends g to the second projection of pullback(g.hom,f), and arrows to the universal map with the specified original-object and base projections.'}
for ref in refs:
 x=index[tuple(ref.split(':',1))];p['baseline']['declarations'].append(dict(ref=ref,kind=x['kind'],module=x['file'],line=int(x['line']),provides=provides[x['name']],checked='Codex — codex-5ebb6f read the actual pinned statement and surrounding variables on4October2026; Reading.json records bounded ranges.'))
next(x for x in p['coverage']if x['stageId']==RID+':RS.0')['remaining'].append(frontier)
next(x for x in p['gaps']if x['id']=='TOWER-TYPING')['detail']+=' '+frontier
next(x for x in rd['stages']if x['key']=='RS.0')['description']+=' '+frontier
put('Candidate.json',p);put('Candidate-roadmap.json',rd);put('NewNodes.json',nodes);put('NewTests.json',tests)
put('Plan.json',dict(newNames=[NS+x[0]for x in items],newBaselineRefs=refs,frontier=frontier,oldNodes=len(old['nodes']),newNodes=len(nodes),newAPIItems=sum(len(n['api'])for n in nodes),newTestReferences=sum(len(n['tests'])for n in nodes),newTests=len(tests)))
reader=['# Native normalization base-change comparison over the changed base','',frontier,'','Let Dp=B[T]/(T^n-u) for the actual framed root p=(u,y). For phi:B to C, Mathlib’s native Over.pullback uses the scheme pullback with Dp first and Spec C second. The earlier normalizationBaseChangeIso uses the reversed order. Compose that actual scheme isomorphism with native pullback symmetry and check the second projection to construct its Over(Spec C) isomorphism. Naturality follows by checking both scheme projections, with the existing normalization-change naturality supplying the first and the changed arrow base triangle the second. NatIso.ofComponents supplies the actual inverse naturality and functor roundtrips.','', 'The projection adapter is precisely a whiskering of Mathlib’s existing adjunction counit. Its generic categorical content remains a baseline import. Through the new natural isomorphism it recovers the earlier normalizationChangeNatTrans as a whole natural transformation, so both forward and inverse normalized-chart transport follow from the existing chart factorization. These actual Over functors remain distinct from general line-bundle root groupoids and their geometric descent.','']
for n in nodes:
 reader += ['## '+n['title'],'','`'+n['declarationName']+'`. '+n['statement'],'',' '.join(n['hypotheses']),'','Proof: '+n['proofSteps'][0],'','Prerequisites: '+', '.join('`'+d+'`'for d in n['prerequisites'])+'.','']
 for a in n['api']:reader+=['API `'+a['name']+'`: '+a['statement'],'']
 for a in n['tests']:reader+=['Test `'+a['name']+'` ('+a['kind']+'): '+a['statement'],'']
reader+=['The [Stacks fibre-product section](https://stacks.math.columbia.edu/tag/01JO) supplies the geometric universal-property context; the exact normalization comparisons above are authored deductions. The [root-stack literature guide](https://stacks.math.columbia.edu/tag/04V8) supplies the finite-root literature context. All inherited source omissions, source issues, route assignments and geometric supplier requests remain recorded below.','']
(S/'ReaderAddition.md').write_text('\n'.join(reader)+'\n');(S/'Reader.md').write_text(t('ReaderAddition.md')+t('IncomingReader.md'))
print(json.dumps(data('Plan.json'),ensure_ascii=False,indent=2))
```

## Script: package.py

```python
"""Publish complete selected proof artifacts in an inert suggested-file ancestor."""
from pathlib import Path
import base64,gzip,hashlib,json,sys
S=Path(sys.argv[1]).resolve();sha=lambda b:hashlib.sha256(b).hexdigest()
names=['Audits.lean','Candidate-roadmap.json','Candidate.json','Canonical.lean','CanonicalPrefix.lean','ClaimReceipt.json','Context.lean','Context.log','Context.receipt.json','Graph.json','Incoming-roadmap.json','Incoming.json','Incoming.lean','IncomingHandoff.md','IncomingReader.md','IncomingReceipt.json','IncomingVerification-publication.json','IncomingVerification-mathematical.json','InputGuard.json','LibrarySearch.json','Native.lean','Native.log','Native.receipt.json','NativePrefix.lean','NewAdmitted.lean','NewImports.lean','NewNodes.json','NewProofs.lean','NewTests.json','NewTests.lean','Plan.json','Prototype.lean','Prototype.log','Prototype.receipt.json','Reader.md','ReaderAddition.md','Reading.json','Sketch.lean','Sketch.log','Sketch.receipt.json','SketchPrefix.lean','SourceReading.json','Stacks-01JO.html','Stacks-04V8.html','Suggested.lean','TauProbe.json','Verification.json','base.txt','publication-base.txt','recover.py','verify.py','immutable_view.py','graph.py','projection.py','assemble.py','compile.py','runcheck.py','author.py','package.py']
names+=['incoming/'+p.name for p in sorted((S/'incoming').iterdir())if p.is_file()and p.suffix not in ['.olean','.ilean']]
assert len(names)==len(set(names))
manifest={};artifacts={}
for n in names:
 b=(S/n).read_bytes();manifest[n]=dict(sha256=sha(b),bytes=len(b),lines=len(b.splitlines()));artifacts[n]=base64.b64encode(b).decode()
mb=(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n').encode();payload=gzip.compress(json.dumps(artifacts,separators=(',',':')).encode(),mtime=0)
(S/'artifact-manifest.json').write_bytes(mb)
encoded=base64.b85encode(payload).decode();encoded='\n'.join(encoded[i:i+120]for i in range(0,len(encoded),120))
archive=(S/'Canonical.lean').read_text()+'\n/-\nTAUCETI-OVER-MANIFEST-BEGIN\n'+base64.b64encode(mb).decode()+'\nTAUCETI-OVER-MANIFEST-END\nTAUCETI-OVER-PAYLOAD-BEGIN\n'+encoded+'\nTAUCETI-OVER-PAYLOAD-END\n-/\n'
(S/'Archive.lean').write_text(archive)
archive_sha=sys.argv[2]if len(sys.argv)>2 else'ARCHIVE_PENDING'
v=json.loads((S/'Verification.json').read_text());g=v['graph'];native=v['compilation']['Native'];sketch=v['compilation']['Sketch']
lines=['# DESIGN-FunctionFieldArithmeticPartII: normalization over the changed base','', 'Worker: Codex — codex-5ebb6f. Issue3403; partial continuation. All717 nodes remain unchecked and all10 stages partial.','', 'The actual normalization covers now form a native natural isomorphism over Spec C with the native Over.pullback of the normalization functor over Spec B, for positive exponent and arbitrary A-algebra change. Its object components use the prior scheme comparison and native pullback symmetry; all four projection laws and actual framed-arrow naturality are specified. The whiskered native adjunction counit recovers the existing normalizationChangeNatTrans, and the whole normalized-chart natural transformation transports in both directions.','', 'The8 new examples include a nonflat Z/4 to Z/2 map killing a nonzero square-zero section and collapsing a nonidentity minus-one stabilizer. The actual pullback of that normalization arrow becomes identity. No faithfulness of coefficient change or pullback is inferred. Wild exponents and the zero ring remain allowed. The positive-exponent boundary is explicit.','', 'All701 incoming nodes and338 baseline entries are retained as whole objects. This continuation appends16 nodes (3 constructions,13 lemmas),13 API items,8 tests with16 construction references, and9 precisely read native baseline imports. No old API or test is changed. The only existing metadata changes append the frontier to packet summary, RS.0 coverage, TOWER-TYPING detail and RS.0 roadmap description, plus one source entry and the9 baseline imports. All8 gaps,13 requests,40 planets,11 inherited source findings, version envelopes, all38 symplectic route contracts and the complete inherited source/omission ledgers remain intact.','', 'General native sheaf RootObject comparison, local frames, fppf stackification, effective fpqc descent, higher coherence, infinite genuine 2-limits, higher-universe adapters and all geometric/sheaf/reciprocity suppliers remain open. Resume with the actual native sheaf RootObject-to-chosen-frame comparison and its local frame construction; do not re-plan the now-proved normalization maps, natural isomorphism or chart transport. The higher chosen coherence and general descent comparisons still need their own declarations.','', 'Freshly read the complete issue before/after the bot-confirmed claim; all196 comments mechanically classified. Read the full parent FA.0–FA.7 reviewed audit and REV-AUDIT-20, owned stage descriptions, all gaps/requests/coverage, reserved canonical key and survey/owner records, sourceCoverage table and routing proposal metadata. Earlier same-worker full AlgebraicCurves/JacobianChallenge and both protocols are reused only after fresh byte guards. Fresh pinned statements and surrounding hypotheses are recorded in Reading.json; peer reading receipts remain inherited provenance. No full fresh reading of the1.2MB incoming reader, whole packet/native source, inherited complete papers or symplectic proofs is claimed.','', 'The [Stacks fibre-product section](https://stacks.math.columbia.edu/tag/01JO) was read in full, including its printed proofs and comments; the [root-stack literature guide](https://stacks.math.columbia.edu/tag/04V8) was read in full for context. The exact normalization Over and chart equations are authored deductions, not source quotations. All general categorical operations are native imports, including Over.pullback and its adjunction counit. The bounded open Mathlib root-stack PR search returned0; no exhaustive absence claim is made.','', 'Incoming [PR6087](https://github.com/CBirkbeck/tauceti-explorer/pull/6087), head9ab61ade2f252f0521fce3d75b3041672ee67cd0, was authenticated through public HTTP:79 artifacts,10 helpers and all5 final files exactly matched the claimed-base inputs. Both actual archived verifiers reproduced their recorded mathematical and publication results exactly, with no Lean executed by those verifiers. Their artifacts remain recoverable in incoming/. The complete authenticated native prefix was freshly compiled as Context before prototyping.','', f"Native proof evidence: {native['lines']} lines,422 examples,618 standard-axiom audits plus{native['axiomFreeAudits']} axiom-free audit,0 warnings/errors/admissions; source SHA256 `{native['sourceSha256']}`, log SHA256 `{native['logSha256']}`.",'', f"Mathlib-only admitted canonical cone: {sketch['lines']} lines,422 examples,549 warnings solely from sorry,231 audits without sorryAx; source SHA256 `{sketch['sourceSha256']}`, log SHA256 `{sketch['logSha256']}`.",'', 'The entire canonical Tau Ceti file is UNCOMPILED. The available Tau build is at a different commit and lacks all4 required compiled Tau imports. No Lake setup, updates, cache downloads or library builds were performed. Every Lean run was serial, memory-guarded with at least20GiB available, one thread,8GiB cap and20-minute timeout. Source and log hashes bind the actual checks; successful native evidence does not close the planning implementations or general geometry.','', f"The actual indexed checker, source/version checks and actual intake report0 errors/warnings/problems/refusals. The immutable atlas stage graph has{g['stageDAG']['vertices']} vertices/{g['stageDAG']['edges']} edges; owned declaration graph717/{g['ownDeclarationDAG']['edges']}; scoped graph{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}; all acyclic. All89 required supplier paths reach, all foreign roadmap and stage objects and inherited stage-edge objects are unchanged, and this roadmap has no skipped or pending links. The45 unrelated preexisting unreachable restructure pairs remain unchanged. The verifier reads{len(g['immutableInputHashes'])} immutable atlas/checker inputs at base `{v['immutableBase']}` without a repository snapshot.",'', f'Proof archive: `{archive_sha}`',f'Artifact manifest SHA256: `{sha(mb)}`',f'Artifact payload SHA256: `{sha(payload)}`',f'Recovery helper SHA256: `{sha((S/"recover.py").read_bytes())}`','', 'The ancestor contains the complete selected proof sources, logs, receipts, incoming recovery artifacts and all helper bodies in an inert comment in the issue’s suggested Lean file. The final suggested file retains the original canonical prefix and appends the actual construction bodies and admitted lemma/test signatures. No Lean code is placed in the packet or reader. Recovery requires an output directory and the final public head SHA. Run recover.py OUTPUT HEAD, then from an existing repository checkout run python3 OUTPUT/verify.py OUTPUT DECLARATION_INDEX. This replays actual immutable checker/intake/atlas and all source/header/receipt/preservation checks without Lean. Serial compilation can be replayed with compile.py/runcheck.py using an existing exact-pin Mathlib build and Lean binary only.','']
fence=chr(96)*3
for n in ['recover.py','verify.py','immutable_view.py','graph.py','projection.py','assemble.py','compile.py','runcheck.py','author.py','package.py']:lines+=['## Script: '+n,'',fence+'python',(S/n).read_text().rstrip(),fence,'']
(S/'PublicHandoff.md').write_text('\n'.join(lines)+'\n')
print(json.dumps(dict(artifacts=len(names),manifestSha256=sha(mb),payloadSha256=sha(payload),payloadBytes=len(payload),archiveBytes=len(archive.encode())),indent=2))
```
