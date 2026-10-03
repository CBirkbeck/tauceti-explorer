# Current checkpoint — global quadratic scheme charts and finite morphism

Codex — codex-J6LwjP, 3 October 2026. Refs #3378. Claim 5964743427 was confirmed by bot 5964744517. The entire issue was read before and after confirmation. Mathematical base `6181fd9d181f0745b096b90c689c5aa7963721b8`; immutable publication/check tree `9c8a340faae54f977214d1a159764c3ca25a1e0e`. This is a partial planning checkpoint: all seven stages remain partial and every implementation status remains unchecked.

## Mathematical result and exact remaining boundary

Over every field k, let q=t²+at+b and A_q=k+qk[t]. The recovered ring comparisons now give an actual Scheme pushout C of Spec A_q and the actual infinity quotient Chart(a,b) along L=k[t,1/(tq)]. Its two specified maps are open immersions, with images the required principal opens D_A(tq) and D_I(u)=D_I(z). The actual chart inclusions cover every point; their overlap square is cartesian, with an exact point-intersection criterion. The infinity overlap map is the specified Spec map of the coefficient-preserving homomorphism θ with θ(u)=t⁻¹ and θ(z)=(tq)⁻¹.

Glue Spec k[t] to the same infinity chart along the same overlap to obtain the actual source Scheme N. The finite-chart inclusion and the infinity identity induce a unique morphism ν:N→C. Both target-chart squares are pullbacks; inverse images of the two target chart opens are the corresponding source charts. Native target-local finiteness on the actual two-member OpenCover proves ν globally finite. The structure map C→Spec k and both chart coefficient compatibilities are specified, and ν respects them. No separability, perfectness, characteristic restriction or distinct-root hypothesis is used. Tests include cusp, nonsplit and split parameters.

The actual quadratic two-chart Scheme C and glued source N, their coefficient-compatible global morphism ν, both target-chart pullback squares, and global finiteness of ν have separately checked native prototypes. The actual overlap map has u=1/t and z=1/(tq). Identify C with the specified Proj cubic and N with the native projective line, prove the normalization universal property and projectivity/properness, then identify the conductor ideal sheaf and structure-sheaf exact sequence and derive finite-pushforward H0/H1. Separate I₂ geometry and all other inherited obligations remain required; all stages stay partial and all implementations unchecked.


Generic scheme gluing, open-immersion pullback and finiteness locality are existing Mathlib mathematics. They are imported and instantiated, never replanned. The existing build does not expose the pinned anonymous HasAffineProperty instance for IsFinite. The checked native proof explicitly repeats its short local argument using public pinned finite/localization/span lemmas; this is a compatibility adapter, not a new generic roadmap target. The pinned Finite.lean source SHA256 is `07121fbb322595182ba99bc1caaf9eb647faeaa6781049437d797551fe4183f3`. This does not certify the entire existing artifact tree against source. Generic Ferrand closed/finite pushouts and the existing SF.0/SF.1/SF.3 supplier obligations remain inherited and open.

## Contract preservation and reading

Added 57 nodes (11 constructions, 46 lemmas), 53 API items and 33 tests. Totals: 382 nodes, 227 raw API items, 233 raw tests, 202 checker-required tests, 266 baseline citations, 29 planets, 17 gaps and 23 requests. All 325 incoming contracts are preserved; 324 complete node objects are identical. Only the I₁ genus consumer gains six prerequisite edges and one proof step. All 78 routed Schröer items, 21 source findings, the reserved Ferrand key and seven-stage scope survive. The incoming full suggested file and reader remain exact prefixes; the complete incoming handoff is retained below as history.

Fresh reading covered WORKERS, applicable blueprint/expansion protocols and upstream guide, the complete issue before/after claim, reviewed R11.1–R11.6 audit rows, the reserved Ferrand definition and relevant SF.0/SF.1/SF.3 contracts, actual pinned Mathlib gluing/open-immersion/cover/finite declarations and all 22 added baseline citations. The incoming current handoff and recovery/validation scripts were read; the retained historical handoffs are not claimed freshly read in full. Earlier upstream exemplar reading in this continuous session remains applicable. Fresh primary reading covered the complete Schröer arXiv:2004.07025v3 §3, both conductor diagrams, Propositions 3.1–3.2 with proofs/count table and Proposition 3.3 with its table. Retained HTML: 2087533 bytes, SHA256 `d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456`. These scheme constructions are authored deductions, not a claim to have reread the whole paper or rerun inherited count computations. Bounded public Mathlib PR and indexed Zulip searches for Ferrand/pinching found no relevant hit; this is not an absence proof.

## Execution receipts and qualification

Mathlib source HEAD is the exact pin `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti remains pinned to `f790474821cf4256814db967cb154e7af3d0c369`, but the existing build's Tau Ceti checkout/artifacts do not certify that pin. Both executed extracts import Mathlib only and reuse an existing build, sequentially under a 1200-second timeout with at least 39 GiB available. No library/project setup, update, cache download, build or LSP was performed.

Native: 2338 lines, 128 examples, 196 axiom audits, zero errors/warnings/admissions; 33.01 seconds and peak 6944368 KiB. Exact admitted extraction: 1564 lines, 128 examples, 20 inherited helper audits, 269 expected admission warnings and no other warnings/errors; 26.51 seconds and peak 6801336 KiB. The 64 new declaration headers and 33 test headers agree exactly between these forms. Three literal Spec carrier aliases remain native so dependent types agree; all new outer mathematical proofs and constructions in the planning form are admitted. The open-cover index is explicitly transported along I₀=Bool; coprojection statements use HEq so opaque admitted constructors do not silently change types.

Full canonical suggested file: 3318 lines, 222 examples, UNCOMPILED. Four required artifacts are absent: TauCeti AlgebraicGeometry EllipticCurve.Affine.Point.VariableChange, WeilDivisor.Scheme.Basic, Curves.StableReduction.Model.Basic and EllipticCurve.PointCount. The checked Mathlib extracts do not certify the full file or any implemented roadmap node.

| Artifact | SHA256 |
|---|---|
| Native | `79743d44fbe8c95a4887f95a61ea957c8831975dd4e5472022968acf8dd99697` |
| Canonical | `bcd995740564027f6dd0b7f574293d474202b2d9c24ff937e487430a20052db4` |
| FullCanonical | `450acceb8e682310f5ba7b45e1d1e3395108e1f9d79b672b63377573f3de1e77` |
| New | `ef951b645014f7f9469f735f210d66146f40ba0718c0440f2bf34765a08a6f47` |
| Native original log | `c08efbd938d775fcf05c3f46c84d37b9563cf024a268a3210ced3013be829e03` |
| Canonical original log | `35b757b42aa736e5af6b6b71f5c7b18839f1abd8dd1acc2b44dc54a2191985cd` |

The original log hashes identify these executions, not independent reruns; rerun logs have different source paths/timings. A source-only replay without reader-supplied original logs explicitly reports that it has not rerun Lean.

## Public recovery and validation

Public archive reference and final immutable validation receipt are recorded in the submission's publication section. The archive contains checked Native and exact admitted Canonical sources in inert comment blocks in the suggested file, and the validator scripts in this handoff. The final suggested file contains only the admitted planning signatures. Recovery uses immutable public blobs and verifies SHA256; no private scratch path is required.

The replay validator preserves all contracts, checks declaration/test header parity, and uses actual indexed checker, intake and atlas assembler code from the immutable publication tree. Its read-only adapter uses git show rather than a repository snapshot. It compares a candidate against the original 325-node control inside the same atlas. It checks all 69 required supplier/stage pairs and all owned declaration dependencies, actual DAGs, unresolved/skipped/pending edges and unrelated records. Twenty-one governing input files are compared byte-for-byte between the mathematical and publication bases. The entire remaining atlas is read from the immutable publication tree, not guessed unchanged. Exact reproduction instructions and immutable graph receipts follow after publication.

Save the next two Python fences as verify.py and immutable_view.py together in small disk-backed scratch outside the checkout. Recover Native, Canonical, New and FullCanonical there; copy the five final proposed files into scratch/proposal at their repository-relative paths. From an existing checkout containing both public base commits, run `python3 verify.py <scratch-directory> <pinned-declarations.tsv>`. Optionally set TAUCETI_REPO to that existing checkout. NERON_VALIDATE_BASE defaults to the fixed publication tree above. No snapshot or second clone is needed. Compile only with an existing Mathlib-pinned build, at least 20 GiB available and one Lean process at a time. Use a 1200-second timeout; do not build missing libraries.

### verify.py

SHA256 `ca3a16f2c4e0557c60ae0761ac80d175ded3ebcc9bb66b3d4e6dc2261024b816`.

```python
"""Replay the five proposal overlays against one immutable public repository tree."""
from pathlib import Path
import ast,collections,copy,hashlib,json,os,re,subprocess,sys
R=Path(os.environ.get('TAUCETI_REPO',str(Path.cwd()))).resolve()
S=Path(sys.argv[1]).resolve();RID='NeronModelsAndSemistableAbelianVarietiesPartII'
MATH='6181fd9d181f0745b096b90c689c5aa7963721b8'
BASE=os.environ.get('NERON_VALIDATE_BASE','9c8a340faae54f977214d1a159764c3ca25a1e0e')
FILES=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+RID+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
proposal={f:(S/'proposal'/f).read_text() for f in FILES}
p=json.loads(proposal[FILES[1]]);roadmap=json.loads(proposal[FILES[0]])
def readref(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R,text=True)
old=json.loads(readref(MATH,FILES[1]));oldroad=json.loads(readref(MATH,FILES[0]))
nodes={n['id']:n for n in p['nodes']};consumer=RID+':G.1/quadratic-pinch-i1-genus'
assert len(old['nodes'])==325 and len(nodes)==382
for n in old['nodes']:
 v=nodes[n['id']]
 if n['id']!=consumer:assert v==n,n['id']
 else:
  assert {k:x for k,x in v.items() if k not in ['prerequisites','proofSteps']}=={k:x for k,x in n.items() if k not in ['prerequisites','proofSteps']}
  assert v['prerequisites'][:-6]==n['prerequisites'] and v['proofSteps'][:-1]==n['proofSteps']
for k in old:
 if k not in ['summary','nodes','sources','baseline','coverage','gaps']:assert p[k]==old[k],k
assert p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:244]==old['baseline']['declarations']
assert {k:x for k,x in p['baseline'].items() if k!='declarations'}=={k:x for k,x in old['baseline'].items() if k!='declarations'}
assert p['gaps'][:-1]==old['gaps'][:-1]
assert {k:v for k,v in p['gaps'][-1].items() if k!='globalSchemeContinuation'}==old['gaps'][-1]
for a,b in zip(p['coverage'],old['coverage']):
 if a['stageId']==RID+':G.1':assert a['remaining'][:-1]==b['remaining'] and a['status']==b['status']
 else:assert a==b
assert len(p['coverage'])==7 and all(x['status']=='partial' for x in p['coverage'])
assert all(n['implementationStatus']=='unchecked' for n in p['nodes']) and p['status']=='partial'
assert {k:v for k,v in roadmap.items() if k!='stages'}=={k:v for k,v in oldroad.items() if k!='stages'}
for a,b in zip(roadmap['stages'],oldroad['stages']):
 if a['key']=='G.1':assert a['description'].startswith(b['description']) and {k:v for k,v in a.items() if k!='description'}=={k:v for k,v in b.items() if k!='description'}
 else:assert a==b
assert proposal[FILES[3]].startswith(readref(MATH,FILES[3]))
assert proposal[FILES[2]].startswith(readref(MATH,FILES[2]).rstrip()+'\n')
assert proposal[FILES[4]].endswith(readref(MATH,FILES[4]))
newadmitted=proposal[FILES[3]].split('/- BEGIN TWO CHART SCHEME GLUING -/\n',1)[1].split('/- END TWO CHART SCHEME GLUING -/',1)[0]
native=(S/'Native.lean').read_text();canonical=(S/'Canonical.lean').read_text();new=(S/'New.lean').read_text()
assert hashlib.sha256(native[:native.index('\nnamespace TauCeti.GenusOne.QuadraticPinch.Global\n')].encode()).hexdigest()=='4dea38c44f292785e5f1963a8ca06eb5c12dbda08cbf0bab2ee66f2d18bbab3a'
assert hashlib.sha256(native.encode()).hexdigest()=='79743d44fbe8c95a4887f95a61ea957c8831975dd4e5472022968acf8dd99697'
assert not re.search(r'\bsorry\b|\baxiom\b',native)
assert hashlib.sha256(canonical.encode()).hexdigest()=='bcd995740564027f6dd0b7f574293d474202b2d9c24ff937e487430a20052db4'
assert hashlib.sha256(canonical[:-len('\n'+newadmitted)].encode()).hexdigest()=='3f431253b8e81febedcef21ae532bb6f779cd15d7eb211c223d86961a9b25f23'
assert (S/'FullCanonical.lean').read_text()==proposal[FILES[3]]
def headers(text):
 lines=text.splitlines(keepends=True);out={};i=0
 while i<len(lines):
  m=re.match(r'^(def|lemma|abbrev|example)\b(?: (\w+))?',lines[i])
  if not m:i+=1;continue
  j=i+1
  while j<len(lines) and (not lines[j].strip() or lines[j][0].isspace()):j+=1
  raw=''.join(lines[i:j]);sep=raw.index(' :=');name=m[2] if m[1]!='example' else lines[i-1].removeprefix('-- test: ').strip()
  out[(m[1],name)]=' '.join(raw[:sep].split());i=j
 return out
assert headers(new)==headers(newadmitted)
hh=headers(new);decls={name for (kind,name) in hh if kind!='example'};tests={name for (kind,name) in hh if kind=='example'}
assert len(decls)==64 and len(tests)==33
for n in p['nodes'][325:]:
 assert n['declarationName'].split('.')[-1] in decls
 assert n['declarationName'] in proposal[FILES[2]] and n['statement'] in proposal[FILES[2]]
 for a in n.get('api',[]):assert a['name'] in proposal[FILES[2]] and a['statement'] in proposal[FILES[2]] and a['name'].split('.')[-1] in decls
 for t in n.get('tests',[]):assert t['name'] in tests and t['statement'] in proposal[FILES[2]]
assert {t['name'] for n in p['nodes'][325:] for t in n.get('tests',[])}==tests
resources={}
for name,audits,warnings,sha in [('Native',196,0,'c08efbd938d775fcf05c3f46c84d37b9563cf024a268a3210ced3013be829e03'),('Canonical',20,269,'35b757b42aa736e5af6b6b71f5c7b18839f1abd8dd1acc2b44dc54a2191985cd')]:
 file=S/(name.lower()+'.log')
 if not file.exists():resources[name]='No reader-supplied log; source/hash/header validation only.';continue
 log=file.read_text();assert not re.search(r'error(?:\(|:)|sorryAx|Command exited|timed out',log)
 assert log.count('warning:')==log.count('warning: declaration uses')==warnings
 assert log.count('depends on axioms:')+log.count('does not depend on any axioms')==audits
 assert hashlib.sha256(log.encode()).hexdigest()==sha
 resources[name]={'warnings':warnings,'audits':audits,'execution':'original successful log verified'}
for path,text in proposal.items():
 assert not re.search(r'[ \t]+$',text,re.M),path
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',text),path
GUARDS=['research/blueprint/WORKERS.md','research/blueprint/PROTOCOL.md','research/blueprint/UPSTREAM_GUIDE.md','research/expansion/PROTOCOL.md','data/library-coverage.json','research/blueprint/reviews/REV-AUDIT-10.md','data/keydefs/KEYDEF-algebraicgeometry.json','research/blueprint/keydefs/owners.json','research/blueprint/reserved-ids.json','research/blueprint/papers/PAPER-SCHROER-23.result.json','research/blueprint/papers/PAPER-SCHROER-23.review.json','research/blueprint/papers/PAPER-WITASZEK-22.result.json','research/blueprint/papers/PAPER-WITASZEK-22.review.json','data/roadmap-retirements.json','content/campaign/NeronModelsAndSemistableAbelianVarieties/README.md','content/campaign/SchemeAndStackFoundations/README.md','scripts/check_blueprint.py','scripts/source_issues.py','scripts/build.py','scripts/blueprints.py','research/blueprint/intake.py']
for path in GUARDS:assert readref(MATH,path)==readref(BASE,path),('changed governing input',path)
import immutable_view as gv
gv.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,build,blueprints
errors,warnings,checker=check_blueprint.check(S/'proposal'/FILES[1],check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for path,text in proposal.items() for x in env['file_problems'](path,text)]
refusals=env['auto_refusals'](job,FILES,False,{'codex-J6LwjP'},set());assert not problems and not refusals,(problems,refusals)
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=RID];documents[RID]=FILES[2]
def assemble(candidate,definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(RID,candidate)]),copy.deepcopy(documents),copy.deepcopy([d for d in definitions if d.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,roadmap);b=assemble(old,oldroad)
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for file in sorted((R/folder).glob('*.json')):
  for n in json.loads(file.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(nodes)
listed={x['id'] for x in a['stages']};stageids=listed|set(check_blueprint.world()[1])
se={(e['source'],e['target']) for e in a['stageEdges']}
assert se=={(e['source'],e['target']) for e in b['stageEdges']}
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e};following=collections.defaultdict(set);indeg={v:0 for v in vertices}
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
report={'stageDAG':dag(listed,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listed|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'stageEdgesUnchanged':True}
print(json.dumps({'graph':report,'checker':checker,'preservedNodeObjects':324,'preservedContracts':325,'newNodes':57,'newHeaders':64,'newTests':33,'rawApiItems':227,'rawTests':233,'sourceHashesVerified':True,'resources':resources,'intakeProblems':problems,'intakeRefusals':refusals,'guardsUnchanged':len(GUARDS),'immutableReadPaths':len(gv.READS),'immutableReadPathListSha256':hashlib.sha256(json.dumps(sorted(gv.READS)).encode()).hexdigest(),'verifierSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()},indent=2),flush=True)
assert p['globalSchemeContinuation']['graph']==report
```

### immutable_view.py

SHA256 `1e943d287481e0cd4bf0f1b9a8a805276aec0e206345cecfa35063a7d2d3c4f4`.

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
BASE = os.environ.get('NERON_VALIDATE_BASE', '9c8a340faae54f977214d1a159764c3ca25a1e0e')
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

---

The complete incoming handoff follows unchanged. Its earlier frontier and execution receipts are historical; the current boundary is stated above.

# Current checkpoint — specified quadratic overlap

Codex — codex-7e92bd, 3 October 2026. Refs #3378. Claim5964213769 was confirmed by bot5964214952. The complete issue was read before and after confirmation and its body was unchanged. Mathematical base `53622870caaae54edc6a25556a8cf82007e454ce`; publication base `1cb7fbca1727576cfc5c3fa0de58b9f1092552ea`. This is a partial planning checkpoint; all seven stages remain partial and every implementation status remains unchecked.

## Mathematical result

For Q(c,a,b)=ct²+at+b, use the actual localization L(c,a,b)=R[t,1/(tQ)]. Its coordinate t has the specified inverse v=Q/(tQ). Evaluation at v reverses c and b, because Q(c,a,b)(v)=v²Q(b,a,c)(t). The resulting specified R-algebra homomorphisms are inverses; native Spec gives their actual affine scheme isomorphism. These statements cover every commutative ring, including nilpotents, the zero ring and zero Q.

Over a field, the actual pinch subring A_Q=k+Qk[t] contains tQ in its conductor. The existing G.0 conductor-localization theorem therefore gives the specified bijection and ring equivalence A_Q[1/(tQ)]≃L(c,a,b). The recovered general conductor theorem is reused; its theory is not replanned.

For the existing infinity quotient Chart(a,b)=R[u][z]/(Q∞z−u³), the incoming explicit inverse of Q∞ makes its localization at u a native localization of R[u] at uQ∞. The specified coefficient-compatible equivalence identifies it with L(b,a,1). The root z becomes a unit under any receiving ring homomorphism exactly when u does. Applying native principal-open identities to Q∞z=u³ gives D(z)=D(u) inside the actual prime spectrum of Chart(a,b).

Composing the finite comparison, reciprocal equivalence and inverse infinity comparison gives the specified finite-to-infinity chart transition for q=t²+at+b. Its equation on every finite pinch element is explicit. The native homogeneous normalization tuples at (1,t⁻¹) and (t,1) agree by the unit factor t⁻³, in all three coordinates. These ring and affine scheme statements are inputs to the global construction; they do not construct a relative-Proj curve or the global normalization morphism.

## Contracts and ownership

This continuation adds52 declaration nodes (12 constructions and40 lemmas),38 API entries and37 named tests. Final totals:325 nodes,174 API entries,169 definition/construction tests and200 raw tests,29 planets,244 baseline citations,17 gaps and23 supplier requests. All273 incoming statement, hypothesis, acceptance, API and test contracts are preserved.272 whole node objects are unchanged; the I₁ genus consumer gains three dependencies and one proof step. The previous full suggested file is an exact prefix of the submitted file. Requests,78 routed items,21 source findings, Ferrand key and seven-stage scope are retained.

Generic localization, polynomial evaluation, Laurent inversion, Spec and principal-open identities are imported from the pinned libraries. In particular, native LaurentPolynomial.invert already exists; this continuation specifies its required coordinate-inversion behavior directly on the two actual localized polynomial rings, without a replacement Laurent carrier. Generic Proj charts and affine gluing remain in the existing SF.0 request. The original arbitrary-subring conductor and common-ideal localization proofs are recovered from their public archive and reused as inherited helpers.

## Reading and verification boundary

Fresh primary reading: [Schröer, arXiv2004.07025v3 HTML](https://arxiv.org/html/2004.07025v3), complete §3, both conductor diagrams, Propositions3.1–3.2 with proofs/count table and Proposition3.3 statement/table. Retained HTML2087533bytes, SHA256d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456. The overlap formulas are authored deductions. No whole-paper reread, published-version erratum collation or inherited finite-field parity/count rerun is claimed.

The complete issue, WORKERS and applicable protocols, all seven stage descriptions, current reserved Ferrand key, six reviewed R11 audit rows, applicable SF.0/SF.1/SF.3 contracts, parent R11.2/R11.4 descriptions and scoped source route were inspected in this continuation. The incoming current handoff and selected historical conductor sections were read; preserved historical handoffs are not claimed freshly read in full. The continuous session's earlier upstream exemplar reading remains in effect. The real atlas assembly below checks current stage relationships. No PartII entries were present in the screened blueprint link files or static atlas stage-edge file; the proposed roadmap definition is explicitly overlaid in the actual assembler.

Actual native declaration statements and ambient hypotheses were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 before use. Twelve new baseline entries carry pinned source-file hashes. Tau Ceti remains pinned to f790474821cf4256814db967cb154e7af3d0c369. A bounded open Mathlib PR query for Ferrand, pinching and quadratic normalization found no hits; indexed Zulip queries for pinching/schemes and LaurentPolynomial/invert found no hits. These searches do not prove absence.

The native prototype compiles:1717lines,95 examples,132 axiom audits, zero errors/warnings/admissions,31.71s, maximumRSS6845144KiB,38GiB available before execution. All audit outputs use only ordinary logical/choice/quotient axioms. The exact admitted extraction compiles:1247lines,95 examples,175 expected admission warnings, no other warning/error,25.76s, maximumRSS6775392KiB,37GiB available. Its20 inherited audits concern retained actual helper proofs. All52 new declaration headers and37 example headers match between proof and admitted planning forms. Small carrier abbreviations are retained, with the finite-denominator membership proof admitted in the planning form.

The full canonical2999-line file with189 examples is UNCOMPILED. The existing build lacks TauCeti EllipticCurve.Affine.Point.VariableChange, WeilDivisor.Scheme.Basic, Curves.StableReduction.Model.Basic and EllipticCurve.PointCount artifacts. Its Mathlib HEAD is the exact pin; its Tau Ceti HEAD is cf386627e9176a3827c1a5fe804989fd94a4d216, not the pin. Both executed checks use only Mathlib and run sequentially under timeout1200 with memory checks. No project setup, library build, update, cache download or LSP was used.

Tests include characteristic-two cusps, the nonsplit F₂ polynomial X²+X+1, the rational split polynomial X²−1, Z/4 coefficients, Z/1 and zero-polynomial localizations. They check the specified polynomial/coordinate maps, both ring and actual Spec inverse laws, equality of the infinity principal opens, the composed transition and all three homogeneous coordinates. They do not assert point counts, cohomology or geometric classification.

The real indexed checker and five-file intake scan pass without errors, warnings, path problems or automatic refusals. All three actual graphs are acyclic: stage3043/8727, own declarations325/767, and combined3339/10007. All69 required stage pairs are reachable. There are no unresolved or external declaration prerequisites, no own skipped/pending links, unchanged stage edges and unchanged unrelated skipped/pending records compared with the incoming control. The control uses the same full atlas and actual assembly code. Publication main was fast-forwarded into this own branch after verifying the five incoming deliverables and governing instructions/audit unchanged; other changes were unrelated job submissions. The full validation was repeated at that publication tree.

## Public evidence and reproduction

Checked native proof archive: [f7a1fffe0f68cf0e244fbf63f35a3274dce15e6e](https://github.com/CBirkbeck/tauceti-explorer/blob/f7a1fffe0f68cf0e244fbf63f35a3274dce15e6e/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean), between BEGIN/END ARCHIVED CHECKED QUADRATIC OVERLAP. This archive commit is an ancestor of the submission. The final file removes the inert proof comment and carries admitted signatures. The prior infinity proof is retained byte-for-byte; inherited conductor helpers are reconstructed from the common-ideal archive. No evidence depends on a private scratch path.

- Native: SHA256 `4dea38c44f292785e5f1963a8ca06eb5c12dbda08cbf0bab2ee66f2d18bbab3a`; normalized log `89dc684dd1b2fe45e0373bffdcf242eb8c6bf7d984c303ffcf5ac24198939a0c`.
- Canonical: SHA256 `3f431253b8e81febedcef21ae532bb6f779cd15d7eb211c223d86961a9b25f23`; normalized log `e64238c1a7b58f7d4446a3c349358cb86c15683fd405f9620a5b458c5c7d95d8`.
- FullCanonical: SHA256 `52f3b495707593b9207778b476521c52338eec3496bfd9fb0be5f0642662b780`.
- New: SHA256 `3e8e25fca15d3a838e6215ed4bdd8b73e22059f81b71cfa43ffc3037d686ef24`.
- CommonHelpers: SHA256 `51aef66ceb501ddf3d3f74663d6e15493ffe6ee9d72e6e9d14d6e5350e41ea87`.

Save the three Python fences below as recover.py, verify.py and graph.py in one small disk-backed scratch directory outside the checkout. From the submitted checkout, run `python3 recover.py <submitted-commit> <scratch-directory>`; it fetches immutable public blobs, reconstructs both executed sources and verifies their hashes. Fetch the mathematical base into your existing checkout if needed. Run `python3 verify.py <scratch-directory> <pinned-declarations.tsv>` and `python3 graph.py <scratch-directory>` from the repository root. The verifier distinguishes absent local execution logs from a new Lean run; recovery alone does not recertify compilation.

If an existing build at the Mathlib pin and at least20GiB available memory are present, execute `timeout 1200 /usr/bin/time -v lake env lean <scratch-directory>/Native.lean` and then the same command for Canonical.lean, redirecting both stdout and stderr to native.log and canonical.log respectively. Wait for each process to finish and check memory before the next. Run verify.py again to check these logs. Normalize logs by removing the timing footer, replacing the source-directory prefix with an empty string and retaining one final newline. The source hashes and metadata above describe this submission's runs. Do not set up or build libraries to reproduce them. Delete disposable reproduction scratch after use.

recover.py SHA256 `a46240440689789c6d43a542d2c68374dca98f745d7c83e6ccde75014469f299`.

```python
from pathlib import Path
from urllib.request import urlopen
import hashlib,json,sys
PATH='research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean'
ARCHIVE='f7a1fffe0f68cf0e244fbf63f35a3274dce15e6e'
INCOMING='5e68ad29cdbd5dcbaba5e45d303f7f91bdd5001d'
COMMON='f5288262eeafbced0db1da046651a4128ccdd167'
BASE='53622870caaae54edc6a25556a8cf82007e454ce'
PUBLICATION='1cb7fbca1727576cfc5c3fa0de58b9f1092552ea'
def read(ref,path=PATH):
 return urlopen('https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+ref+'/'+path).read().decode()
def section(text,start,end):return text.split(start+'\n',1)[1].split(end+'\n',1)[0]
def sha(text):return hashlib.sha256(text.encode()).hexdigest()
def reconstruct(submitted_ref):
 native=section(read(ARCHIVE),'BEGIN ARCHIVED CHECKED QUADRATIC OVERLAP','END ARCHIVED CHECKED QUADRATIC OVERLAP')
 assert sha(native)=='4dea38c44f292785e5f1963a8ca06eb5c12dbda08cbf0bab2ee66f2d18bbab3a'
 previous=read(INCOMING)
 incoming=section(previous,'-- BEGIN ARCHIVED CHECKED QUADRATIC INFINITY CHART','-- END ARCHIVED CHECKED QUADRATIC INFINITY CHART')
 admitted=section(previous,'-- BEGIN ARCHIVED ADMITTED QUADRATIC INFINITY CHART','-- END ARCHIVED ADMITTED QUADRATIC INFINITY CHART')
 assert sha(incoming)=='d80ef1ec69b215b8e20ca606fdc56855552fec6026a65da21cc345add78dd651'
 assert sha(admitted)=='1222e696fc01949de932b5a935a018e5788f29d3ed21e3357f7f763238fc5ef4'
 common=section(read(COMMON),'BEGIN ARCHIVED CHECKED COMMON IDEAL LOCALIZATION','END ARCHIVED CHECKED COMMON IDEAL LOCALIZATION')
 assert sha(common)=='116f478ae802f6ca455a0299d4af2e355ab3c97b41f0bdba598453f11225507b'
 a=common[common.index('namespace Subring'):common.index('namespace TauCeti.GenusOne.QuadraticPinch')]
 start=common.index('namespace TauCeti.GenusOne.AffinePinching');end=common.index('namespace TauCeti.GenusOne.QuadraticPinch',start)
 helpers='universe z\n'+a+common[start:end]
 assert sha(helpers)=='51aef66ceb501ddf3d3f74663d6e15493ffe6ee9d72e6e9d14d6e5350e41ea87'
 assert native.startswith(incoming+helpers)
 tail=native[len(incoming+helpers):];auditstart=tail.index('#print axioms TauCeti.GenusOne.QuadraticPinch.Overlap.quadratic\n')
 new=tail[:auditstart];audits=tail[auditstart:]
 assert sha(new)=='3e8e25fca15d3a838e6215ed4bdd8b73e22059f81b71cfa43ffc3037d686ef24'
 full=read(submitted_ref);assert sha(full)=='52f3b495707593b9207778b476521c52338eec3496bfd9fb0be5f0642662b780'
 newadmitted=section(full,'/- BEGIN QUADRATIC OVERLAP COMPARISON -/','/- END QUADRATIC OVERLAP COMPARISON -/')
 canonical=admitted+helpers+newadmitted
 assert sha(canonical)=='3f431253b8e81febedcef21ae532bb6f779cd15d7eb211c223d86961a9b25f23'
 return {'Native.lean':native,'IncomingNative.lean':incoming,'IncomingAdmitted.lean':admitted,
  'CommonNative.lean':common,'CommonHelpers.lean':helpers,'New.lean':new,'Audits.lean':audits,
  'FullCanonical.lean':full,'Canonical.lean':canonical,'NewAdmitted.lean':newadmitted,
  'base.txt':BASE+'\n','publication-base.txt':PUBLICATION+'\n',
  'original-packet.json':read(BASE,'research/blueprint/packets/NeronModelsAndSemistableAbelianVarietiesPartII.json'),
  'original-roadmap.json':read(BASE,'research/blueprint/roadmaps/NeronModelsAndSemistableAbelianVarietiesPartII.json')}
if __name__=='__main__':
 out=Path(sys.argv[2]);out.mkdir(parents=True,exist_ok=True)
 for name,text in reconstruct(sys.argv[1]).items():(out/name).write_text(text)
```

verify.py SHA256 `46241f9e0abc312b5b1a8b237a5c4be73bf45c117b8a7657154daa47a498e51e`.

```python
from pathlib import Path
import ast,collections,hashlib,json,re,subprocess,sys
R=Path.cwd();S=Path(sys.argv[1]);RID='NeronModelsAndSemistableAbelianVarietiesPartII'
files=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+ext for f,ext in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((R/files[1]).read_text());old=json.loads((S/'original-packet.json').read_text());nodes={n['id']:n for n in p['nodes']}
assert len(old['nodes'])==273 and len(nodes)==325
consumer=RID+':G.1/quadratic-pinch-i1-genus'
for n in old['nodes']:
 v=nodes[n['id']]
 if n['id']!=consumer:assert v==n,n['id']
 else:
  assert {k:x for k,x in v.items() if k not in ['prerequisites','proofSteps']}=={k:x for k,x in n.items() if k not in ['prerequisites','proofSteps']}
  assert v['prerequisites'][:-3]==n['prerequisites'] and v['proofSteps'][:-1]==n['proofSteps']
for k in old:
 if k not in ['summary','nodes','sources','baseline','coverage','gaps']:assert p[k]==old[k],k
assert p['sources'][:-1]==old['sources']
assert p['baseline']['declarations'][:232]==old['baseline']['declarations']
assert p['gaps'][:-1]==old['gaps'][:-1]
assert {k:v for k,v in p['gaps'][-1].items() if k!='overlapContinuation'}==old['gaps'][-1]
for a,b in zip(p['coverage'],old['coverage']):
 if a['stageId']==RID+':G.1':assert a['remaining'][:-1]==b['remaining'] and a['status']==b['status']
 else:assert a==b
assert all(n['implementationStatus']=='unchecked' for n in p['nodes']) and p['status']=='partial'
roadmap=json.loads((R/files[0]).read_text());oldroad=json.loads((S/'original-roadmap.json').read_text())
assert {k:v for k,v in roadmap.items() if k!='stages'}=={k:v for k,v in oldroad.items() if k!='stages'}
for a,b in zip(roadmap['stages'],oldroad['stages']):
 if a['key']=='G.1':assert a['description'].startswith(b['description']) and {k:v for k,v in a.items() if k!='description'}=={k:v for k,v in b.items() if k!='description'}
 else:assert a==b
base=(S/'base.txt').read_text().strip()
def blob(path):return subprocess.check_output(['git','show',base+':'+path],text=True)
full=(R/files[3]).read_text();reader=(R/files[2]).read_text()
incoming=(S/'IncomingNative.lean').read_text();helpers=(S/'CommonHelpers.lean').read_text();new=(S/'New.lean').read_text();native=(S/'Native.lean').read_text();audits=(S/'Audits.lean').read_text()
assert hashlib.sha256(incoming.encode()).hexdigest()=='d80ef1ec69b215b8e20ca606fdc56855552fec6026a65da21cc345add78dd651'
assert native==incoming+helpers+new+audits and not re.search(r'\bsorry\b|\baxiom\b',native)
assert full.startswith(blob(files[3])) and reader.startswith(blob(files[2]).rstrip()+'\n')
newadmitted=full.split('/- BEGIN QUADRATIC OVERLAP COMPARISON -/\n')[1].split('/- END QUADRATIC OVERLAP COMPARISON -/')[0]
def headers(text):
 lines=text.splitlines(keepends=True);out={};i=0
 while i<len(lines):
  m=re.match(r'^(def|lemma|abbrev|example)\b(?: (\w+))?',lines[i])
  if not m:i+=1;continue
  j=i+1
  while j<len(lines) and (not lines[j].strip() or lines[j][0].isspace()):j+=1
  raw=''.join(lines[i:j]);sep=raw.index(' :=');name=m[2] if m[1]!='example' else lines[i-1].removeprefix('-- test: ').strip()
  out[(m[1],name)]=' '.join(raw[:sep].split());i=j
 return out
assert headers(new)==headers(newadmitted)
hh=headers(new);decls={name for (kind,name) in hh if kind!='example'};tests={name for (kind,name) in hh if kind=='example'}
assert len(decls)==52 and len(tests)==37
for n in p['nodes'][273:]:
 assert n['declarationName'].split('.')[-1] in decls
 assert n['declarationName'] in reader and n['statement'] in reader
 for a in n.get('api',[]):assert a['name'] in reader and a['statement'] in reader and a['name'].split('.')[-1] in decls
 for t in n.get('tests',[]):assert t['name'] in tests and t['statement'] in reader
assert {t['name'] for n in p['nodes'][273:] for t in n.get('tests',[])}==tests
expected=(S/'IncomingAdmitted.lean').read_text()+helpers+newadmitted
assert (S/'Canonical.lean').read_text()==expected and (S/'FullCanonical.lean').read_text()==full
lean={}
for name,count,warnings in [('Native',132,0),('Canonical',20,175)]:
 path=S/(name.lower()+'.log')
 if not path.exists():lean[name]='No local execution log supplied; source/header validation only.';continue
 log=path.read_text();assert 'Exit status: 0' in log and not re.search(r'error(?:\(|:)|sorryAx',log)
 assert log.count('warning:')==log.count('warning: declaration uses')==warnings
 assert log.count('depends on axioms:')+log.count('does not depend on any axioms')==count
 lean[name]={'warnings':warnings,'audits':count,'exit':0}
tree=ast.parse((R/'research/blueprint/intake.py').read_text());names={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name in names]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs'] if j['id']=='DESIGN-'+RID)
problems=[x for path in files for x in env['file_problems'](path,(R/path).read_text())]
refusals=env['auto_refusals'](job,files,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
for path in files:
 text=(R/path).read_text();assert not re.search(r'[ \t]+$',text,re.M),path
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',text),path
pub=(S/'publication-base.txt').read_text().strip() if (S/'publication-base.txt').exists() else base
changed=set(subprocess.check_output(['git','diff','--name-only',pub],text=True).splitlines());assert changed<=set(files),changed
sys.path.insert(0,str(R/'scripts'));import check_blueprint
errors,warnings,summary=check_blueprint.check(R/files[1],check_blueprint.load_index(Path(sys.argv[2])),check_blueprint.world());assert not errors and not warnings,(errors,warnings)
report={'oldNodeObjectsPreserved':272,'oldContractsPreserved':273,'newHeadersMatched':52,'newTestsMatched':37,'incomingProofPreserved':True,'canonicalPrefixPreserved':True,'readerPrefixPreserved':True,'intakeFileProblems':problems,'intakeAutoRefusals':refusals,'checker':summary,'rawApiItems':174,'rawTests':200,'lean':lean,'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(report,indent=2))
```

graph.py SHA256 `748694ed59b668c57cacf5134a328ed20b8e9dd0444c12ab84090c9dd849c4e3`.

```python
from pathlib import Path
import os,sys,json,collections,copy
R=Path.cwd();S=Path(sys.argv[1]);RID='NeronModelsAndSemistableAbelianVarietiesPartII';STEM=RID
sys.path.insert(0,str(R/'scripts'))
import check_blueprint
p=json.loads((R/'research/blueprint/packets'/f'{STEM}.json').read_text())
old=json.loads((S/'original-packet.json').read_text())
nodes={n['id']:n for n in p['nodes']}
import build,blueprints
packets,documents,definitions=blueprints.load_promoted(R)
keep=[x for x in packets if x[0]!=STEM];documents[STEM]='research/blueprint/readmes/'+STEM+'.md'
own_definition=json.loads((R/'research/blueprint/roadmaps'/f'{RID}.json').read_text())
old_definition=json.loads((S/'original-roadmap.json').read_text())
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
print(json.dumps(summary,indent=2))
```

## Resume here

Use the actual SF.0 relative-Proj hypersurface chart comparison and gluing exports to identify this two-chart curve with the specified Weierstrass cubic. In that comparison, prove the named coordinate equations z=1/(tq) and u=1/t for the specified transition and all required structure-map compatibilities. The current general polynomial-image equation and D(z)=D(u) provide their algebraic inputs; no global morphism is yet constructed. Glue the homogeneous normalization P¹→C, compare it with the existing finite affine normalization and the infinity chart, and derive global finiteness/birationality. Then identify the actual conductor ideal sheaf, the structure-sheaf sequence and E/k quotient, and derive H⁰/H¹ through finite pushforward. Preserve the cusp/nodal/inseparable distinctions and separate I₂ geometry.

All G.0–G.6 fibration, Picard, Néron, classification, model certificate, resolution/orbit, minimality, completeness and full source-extraction obligations remain required. The finite-field parity/count strand is already checked in an earlier checkpoint; do not redo it because historical remaining lists are stale. The generic SF.0/SF.1/SF.3 suppliers and all23 requests remain open. No stage is closed.

## Preserved incoming handoff

# Current checkpoint — Codex codex-5ebb6f, 3 October 2026

Refs #3378. Claim5963866915 was confirmed for this identity by bot5963867959. The whole issue was read before claiming and reread after the bot confirmed the claim. Mathematical read base: 83fa0ef3fbe575ab72692cb37f5c5a06cc330f2e. Publication main 14122f5410315c7254b29874b6b80bf3f7bdd159 was fetched and merged into this own branch; all five incoming issue files were byte-identical and the complete overlay validation was repeated successfully against its immutable tree. This is a partial planning checkpoint; all seven stages remain partial and all implementation statuses remain unchecked.

## Result and preservation

The new infinity chart is the actual native quotient R[u][Z]/((1+au+bu²)Z−u³), over every commutative ring R. The explicit Bézout identity

(1+au+bu²)(1−au+(a²−b)u²)=1+u³((a³−2ab)+b(a²−b)u)

gives an inverse for the denominator throughout this quotient. Both specified native R[u]-algebra homomorphisms are constructed and their two composites proved to be identities. The resulting coefficient-compatible equivalence with Localization.Away(1+au+bu²), its forward root formula, both inverse coefficient/denominator formulas and native IsLocalization property are separately specified. The actual induced Spec map is an open immersion into the affine line.

The actual Weierstrass curve with coefficients (a,−b,0,0,0) has Y≠0 equation z(1+au+bu²)=u³. The homogeneous coordinate tuple [Uq_h:Tq_h:U³], q_h=T²+aTU+bU², is cubic homogeneous, has no common zero over any field away from (T,U)=(0,0), and satisfies the native homogeneous Weierstrass equation. Its infinity point [0:1:0] is native nonsingular over every field, including characteristic two. These are coordinate/affine scheme facts; the tuple alone does not construct the global projective normalization morphism.

Twenty-seven declaration nodes and 24 named examples are appended. All 246 incoming statements, hypotheses, API entries, tests and acceptance contracts are preserved. 245 whole node objects are unchanged; only the I₁ genus consumer receives six appended dependencies and one appended proof step. The checked 793-line native predecessor and 606-line admitted predecessor are byte-for-byte prefixes of the new recoverable extractions. The stale packet opening count 224 is corrected to the actual final count 273. The Ferrand key, 78 routed items, 21 source findings, 17 gaps, 23 requests, 29 planets and seven-stage scope are retained. The existing SF.0 request is extended with its own generic Proj-chart/gluing exports; no generic projective theory is replanned here.

Final packet: 273 nodes (17 definitions,20 constructions,201 lemmas,26 theorems,9 comparisons),136 API entries,133 definition/construction unit tests and163 total tests,29 planets,232 baseline citations. No stage is closed.

## Source and library reading

Fresh primary reading: Schröer arXiv2004.07025v3, complete §3 on printed pp9–11, including both conductor diagrams, Proposition3.1–3.2 and their proofs/count table, and Proposition3.3 statement/table on p11. PDF702391bytes; SHA256 ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61. The reciprocal and homogeneous formulas are authored deductions from the incoming quadratic presentation, not source-printed geometric or sheaf theorems. No whole-paper reading, Annals erratum collation or inherited finite-field rerun is claimed.

The whole current issue, winning claim, all six reviewed R11 audit rows, REV-AUDIT-10, full reserved Ferrand key and all seven stage descriptions were read in this continuation. The current predecessor handoff section was read in full and its public proof recovered and hash-checked; historical handoff sections are retained without claiming a fresh whole-history read. SF.0/SF.3 scope was inspected at the read tree; generic Proj, affine gluing and cohomology stay with those owners. Whole upstream JacobianChallenge, StableReduction, HodgeStructures and SemisimpleAlgebras documents were read earlier in this continuous worker session; this job does not recertify them as freshly read. Lang/source closure and all inherited missing-reading obligations remain recorded.

At Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, the actual native projective Equation/Nonsingular statements and their ambient restrictions, native AdjoinRoot quotient/lift/extensionality/root relation, localization lift/inverse/extensionality/instance transport, AlgEquiv.ofAlgHom and IsOpenImmersion.of_isLocalization were read before use. Thirteen new indexed baseline citations carry pinned source-file hashes. The existing build's Mathlib HEAD was freshly confirmed at this pin. Tau Ceti stays pinned at f790474821cf4256814db967cb154e7af3d0c369. Open Mathlib PR searches for Ferrand and pinching returned zero hits; a public Zulip-archive search found no relevant result. These negative searches are leads, not absence proofs. Existing Mathlib quotient, localization and Weierstrass objects are reused.

## Verification

The native extraction compiled in27.38s, maximum resident6830856KiB, with43GiB available before compilation:1121lines,58 examples,80 axiom outputs, zero errors/warnings/admissions or sorryAx. Its inherited umbrella Mathlib import is retained in this separate extraction. The admitted extraction compiled in23.47s, maximum resident6764456KiB, with43GiB available before compilation:788lines,58 examples,88 admission warnings and no other warnings/errors. All 27 new public declaration headers and24 example headers agree across the checked prototype, admitted extraction and submitted planning file; the actual Chart type abbreviation is retained.

The full canonical file has2663lines and152 examples, uses individual inherited Mathlib/TauCeti modules plus the native Projective.Basic import, and is UNCOMPILED. Required TauCeti Affine.Point.VariableChange, WeilDivisor.Scheme.Basic, Curves.StableReduction.Model.Basic and EllipticCurve.PointCount artifacts are absent from the existing build. No project setup, build, update, cache download or language server was run. This limitation applies to the full canonical file, not the separately checked exact extraction.

The real indexed packet checker reports zero errors and warnings. Actual intake path/JSON/private-path checks and header/test agreement pass. The full atlas stage graph3043/8727, own declaration graph273/604 and combined graph3287/9519 are acyclic. There are no unresolved reachable declarations,69/69 supplier-stage pairs are reachable, the own roadmap has no skipped/pending links, and stage edges and unrelated skipped/pending records are unchanged. The immutable validator reads the real scripts and data at the stated Git tree, with only this issue's five deliverables overlaid; it does not fabricate a small atlas.

## Public proof recovery

Checked proof archive: [5e68ad29cdbd5dcbaba5e45d303f7f91bdd5001d](https://github.com/CBirkbeck/tauceti-explorer/blob/5e68ad29cdbd5dcbaba5e45d303f7f91bdd5001d/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean). It is an ancestor of this branch and is retained without rebasing. Native SHA256 d80ef1ec69b215b8e20ca606fdc56855552fec6026a65da21cc345add78dd651; admitted SHA2561222e696fc01949de932b5a935a018e5788f29d3ed21e3357f7f763238fc5ef4. Canonical SHA2561079cbd0ad00d817f0df571eb5f37d8aeefc8bf6098b302cece04a5509289d44. Original checked prefix hashes are asserted by the validator. Recovery emits source to stdout and asserts hashes and line counts; redirect only into your own disk scratch directory.

Save the recovery Python fence below as recover.py in your own scratch directory. Run its native and admitted modes to obtain Native.lean and Admitted.lean from the immutable public archive. Its validator and reader modes require --handoff with this checked-out handoff document; save those emitted scripts as verify-infinity.py and immutable_view.py. Its canonical mode requires --canonical with the checked-out suggested file. Hashes are verified before output. Copy the five allowed deliverables into your scratch directory under roadmaps/, packets/, readmes/, suggested/ and handoff/ with their repository basenames. Set TAUCETI_REPO to your existing checkout and TAUCETI_BASELINE to the pinned declarations.tsv file, then run verify-infinity.py. The immutable reader defaults to the mathematical read base; P8_VALIDATE_BASE can select a verified publication main tree whose incoming issue files remain unchanged. No repository clone or snapshot is created.

If a pinned existing Lean build and at least20GiB available memory are present, run one lake env lean per recovered file from that existing build, waiting for completion. Stop any run after20minutes. These scripts only recover or validate; they do not set up a build or start a server.

Recovery script SHA256 9b860eb472321efd9ce8284ac55becaa9c92ddbf78b6dd95b1a56783d0fa3541:

```python
"""Emit the checked prototype or public validator to stdout; never write a repository file."""
import argparse, hashlib, sys, urllib.request
from pathlib import Path
ARCHIVE='5e68ad29cdbd5dcbaba5e45d303f7f91bdd5001d'
LEAN='research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean'
FILES={
 'native':('-- BEGIN ARCHIVED CHECKED QUADRATIC INFINITY CHART','-- END ARCHIVED CHECKED QUADRATIC INFINITY CHART','d80ef1ec69b215b8e20ca606fdc56855552fec6026a65da21cc345add78dd651',1121),
 'admitted':('-- BEGIN ARCHIVED ADMITTED QUADRATIC INFINITY CHART','-- END ARCHIVED ADMITTED QUADRATIC INFINITY CHART','1222e696fc01949de932b5a935a018e5788f29d3ed21e3357f7f763238fc5ef4',788),
 'validator':('# BEGIN QUADRATIC INFINITY VALIDATOR','# END QUADRATIC INFINITY VALIDATOR','103fc47c27c214aabb2c81c5232f1f5fffe1c74964d137fa2f446d8a78a59d3c',228),
 'reader':('# BEGIN QUADRATIC INFINITY IMMUTABLE READER','# END QUADRATIC INFINITY IMMUTABLE READER','5f6e13028dcbd88973985569c792de197e0d64ac35606df41c28ae69e7ce5ff4',103),
}
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('kind',choices=list(FILES)+['canonical'])
parser.add_argument('--handoff',type=Path)
parser.add_argument('--canonical',type=Path)
args=parser.parse_args()
if args.kind=='canonical':
 if args.canonical is None:parser.error('canonical requires --canonical with the submitted suggested file')
 data=args.canonical.read_bytes()
 expected='1079cbd0ad00d817f0df571eb5f37d8aeefc8bf6098b302cece04a5509289d44'
 lines=2663
else:
 start,end,expected,lines=FILES[args.kind]
 if args.kind in {'native','admitted'}:
  url='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+ARCHIVE+'/'+LEAN
  source=urllib.request.urlopen(url).read().decode()
 else:
  if args.handoff is None:parser.error('validator/reader requires --handoff with the submitted handoff file')
  source=args.handoff.read_text()
 assert source.count(start+'\n')==source.count(end+'\n')==1
 data=source.split(start+'\n',1)[1].split(end+'\n',1)[0].encode()
assert hashlib.sha256(data).hexdigest()==expected
assert len(data.splitlines())==lines
sys.stdout.buffer.write(data)
```

Validator SHA256 103fc47c27c214aabb2c81c5232f1f5fffe1c74964d137fa2f446d8a78a59d3c:

```python
# BEGIN QUADRATIC INFINITY VALIDATOR
"""Validate the real atlas assembly against an immutable Git tree and five-file overlay."""
from pathlib import Path
import ast, collections, copy, hashlib, json, os, re
import immutable_view as gv
HERE=Path(__file__).resolve().parent
RID='NeronModelsAndSemistableAbelianVarietiesPartII'
STEM=RID
FILES={
'research/blueprint/roadmaps/'+RID+'.json':'roadmaps/'+RID+'.json',
'research/blueprint/packets/'+RID+'.json':'packets/'+RID+'.json',
'research/blueprint/readmes/'+RID+'.md':'readmes/'+RID+'.md',
'research/blueprint/suggested/'+RID+'.lean':'suggested/'+RID+'.lean',
'research/blueprint/handoff/DESIGN-'+RID+'.md':'handoff/DESIGN-'+RID+'.md'}
PACKET='research/blueprint/packets/'+RID+'.json'
original=json.loads(gv.blob(PACKET))
oldroadmap=json.loads(gv.blob('research/blueprint/roadmaps/'+RID+'.json'))
oldreader=gv.blob('research/blueprint/readmes/'+RID+'.md').decode()
oldlean=gv.blob('research/blueprint/suggested/'+RID+'.lean').decode()
for dst,name in FILES.items():gv.CACHE[dst]=(HERE/name).read_bytes()
gv.install()
import check_blueprint
errors,warnings,summary=check_blueprint.check(gv.REPO/PACKET,
 check_blueprint.load_index(Path(os.environ['TAUCETI_BASELINE'])),check_blueprint.world())
print(json.dumps({'checker':summary,'errors':errors,'warnings':warnings}),flush=True)
assert not errors and not warnings,(errors,warnings)
p=json.loads((HERE/FILES[PACKET]).read_text())
reader=(HERE/('readmes/'+RID+'.md')).read_text()
lean=(HERE/('suggested/'+RID+'.lean')).read_text()
old={n['id']:n for n in original['nodes']};new={n['id']:n for n in p['nodes']}
changed=RID+':G.1/quadratic-pinch-i1-genus'
assert len(old)==246 and len(new)==273 and set(old)<=set(new)
assert all(new[nid]==n for nid,n in old.items() if nid!=changed)
for key,value in old[changed].items():
 if key not in {'proofSteps','prerequisites'}:assert new[changed][key]==value,key
assert new[changed]['proofSteps'][:-1]==old[changed]['proofSteps']
assert new[changed]['prerequisites'][:-6]==old[changed]['prerequisites']
for key in original:
 if key not in {'summary','sources','nodes','baseline','coverage','requests'}:assert p[key]==original[key],key
assert p['sources'][:-1]==original['sources']
assert p['baseline']['declarations'][:219]==original['baseline']['declarations']
assert len(p['baseline']['declarations'])==232
for key,value in original['baseline'].items():
 if key!='declarations':assert p['baseline'][key]==value,key
assert p['summary'].startswith(original['summary'].replace('with 224 declaration nodes','with 273 declaration nodes',1))
for row,row0 in zip(p['coverage'],original['coverage']):
 if row['stageId']!=RID+':G.1':assert row==row0
 else:
  assert row['remaining'][:-1]==row0['remaining']
  for key,value in row0.items():
   if key!='remaining':assert row[key]==value
assert len(p['coverage'])==7 and all(r['status']=='partial' for r in p['coverage'])
assert p['requests'][1:]==original['requests'][1:]
assert p['requests'][0]['need'].startswith(original['requests'][0]['need'])
assert set(p['requests'][0]['neededBy'])==set(original['requests'][0]['neededBy'])|{changed}
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in new.values())
assert new[RID+':key/ferrand-pushouts']==old[RID+':key/ferrand-pushouts']
r=json.loads((HERE/('roadmaps/'+RID+'.json')).read_text())
for key,value in oldroadmap.items():
 if key not in {'summary','stages'}:assert r[key]==value,key
assert r['summary'].startswith(oldroadmap['summary'])
for row,row0 in zip(r['stages'],oldroadmap['stages']):
 if row['key']!='G.1':assert row==row0
 else:
  assert row['description'].startswith(row0['description'])
  for key,value in row0.items():
   if key!='description':assert row[key]==value
assert reader.startswith(oldreader)
assert lean.replace('import Mathlib.AlgebraicGeometry.EllipticCurve.Projective.Basic\n','',1).startswith(oldlean)
native=(HERE/'Native.lean').read_text();admitted=(HERE/'Admitted.lean').read_text()
assert hashlib.sha256(b''.join(native.encode().splitlines(keepends=True)[:793])).hexdigest()=='fb78e8d07d5a68f118f5ff3b1ac4e2f9571dd09ef9d921f3619af7e08e99a8a3'
assert hashlib.sha256(b''.join(admitted.encode().splitlines(keepends=True)[:606])).hexdigest()=='f24da6f72e809606398333b878267bb590cef80363d4b8cd9c68f2787f47d8cc'
names=[n['declarationName'].removeprefix('QuadraticPinch.InfinityChart.') for n in p['nodes'][246:]]
def headers(s):
 s=s.rsplit("namespace TauCeti.GenusOne.QuadraticPinch.InfinityChart\n",1)[1]
 found={}
 for name in names:
  match=re.search(r'^(?:def|lemma) '+re.escape(name)+r'\b[\s\S]*? :=',s,re.M)
  assert match,name
  found[name]=match.group(0)[:-3].rstrip()
 return found
assert headers(native)==headers(admitted)==headers(lean)
testnames=[t['name'] for n in p['nodes'][246:] for t in n.get('tests',[])]
def tests(s):
 found={}
 for name in testnames:
  match=re.search(r'-- test: '+re.escape(name)+r'\n(example[\s\S]*?) :=',s)
  assert match,name
  found[name]=match.group(1).rstrip()
 return found
assert tests(native)==tests(admitted)==tests(lean)
for node in p['nodes'][246:]:
 assert node['statement'] in reader and node['declarationName'] in reader,node['id']
 for test in node.get('tests',[]):assert test['name'] in lean and test['statement'] in reader,test
assert len(re.findall(r'^example\b',native,re.M))==58
assert len(re.findall(r'^example\b',admitted,re.M))==58
assert len(re.findall(r'^example\b',lean,re.M))==152
assert len(names)==27 and len(testnames)==24
assert not re.search(r'\bsorry\b',native)
tree=ast.parse(gv.blob('research/blueprint/intake.py').decode())
picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=='file_problems']
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
problems=[v for dst,name in FILES.items() for v in env['file_problems'](dst,(HERE/name).read_text())]
assert not problems,problems
for name in FILES.values():
 txt=(HERE/name).read_text()
 assert not re.search(r'[ \t]+$',txt,re.M),name
 assert not re.search(r'/(?:home|Users)/[^/\s]+/',txt),name
print(json.dumps({'preservedWholeNodeObjects':245,'incomingContracts':246,'newNodes':27,
 'api':sum(len(n.get('api',[])) for n in p['nodes']),
 'tests':sum(len(n.get('tests',[])) for n in p['nodes']),
 'intake':'pass','newPublicHeadersMatched':27,'namedTestHeadersMatched':24}),flush=True)
import build,blueprints
root=gv.REPO
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert not otherparts
own_definition=json.loads((HERE/"roadmaps"/(RID+".json")).read_text())
old_definition=json.loads(gv.blob("research/blueprint/roadmaps/"+RID+".json"))
definitions=[q for q in definitions if q.get("id")!=RID]+[own_definition]

keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate, definition):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy([q for q in definitions if q.get('id')!=RID]+[definition]))
 return build.assemble(require_distances=False)[0]
a=assemble(p,own_definition);b=assemble(original,old_definition)
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
pairs |= {(source,RID+":"+row["key"]) for row in own_definition["stages"] for source in row.get("requires",[])}
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
assert not missingpairs, missingpairs
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
controlnew={n["id"]:n for n in original["nodes"]}
controledges={(q,nid) for nid,node in controlnew.items() for q in node.get("prerequisites",[]) if q in controlnew}
print(json.dumps({"controlOwnDAG":dag(controlnew,controledges),"incomingDeclarations":len(controlnew),"incomingPlanets":sum("planet" in n for n in original["nodes"])}),flush=True)

print(json.dumps({"readPaths":sorted(gv.READS)}),flush=True)
# END QUADRATIC INFINITY VALIDATOR
```

Immutable reader SHA256 5f6e13028dcbd88973985569c792de197e0d64ac35606df41c28ae69e7ce5ff4:

```python
# BEGIN QUADRATIC INFINITY IMMUTABLE READER
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
BASE = os.environ.get('P8_VALIDATE_BASE', '83fa0ef3fbe575ab72692cb37f5c5a06cc330f2e')
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
# END QUADRATIC INFINITY IMMUTABLE READER
```

All five public recovery modes were exercised after pushing the immutable archive: native, admitted, validator, immutable reader and canonical. Every recovered output is byte-for-byte identical to the checked input, with the expected hash and line count.

## Where the next worker resumes

1. Identify the actual relative-Proj cubic with the two affine charts, importing the generic chart/gluing API from SF.0. On the finite chart U=q(t), V=tq(t), the overlap with Y≠0 inverts V. After recovering t=V/U there, the reciprocal coordinate is u=1/t and z=1/V. Prove the actual overlap algebra maps and their inverse laws; on the infinity chart the overlap inverts z, equivalently u, since Q∞ is a unit. Retain q=t²+at+b and the specified quotient maps, rather than assume an isomorphism of arbitrary rings.
2. Construct the actual projective normalization P¹→C, compare the specified finite inclusion on the finite affine chart and the identity on the infinity chart, and derive global finiteness and birationality. The homogeneous tuple and no-common-zero result are inputs, not substitutes for this morphism.
3. Identify the conductor ideal sheaf and the actual O_C→ν_*O_P¹→j_*(E/k) exact sequence. Then prove finite-pushforward H0/H1 with the existing SF.3/upstream curve suppliers. The incoming affine B/A_q≃E/k and one-dimensional defect remain available.
4. Keep separable nodes and inseparable/repeated cusps distinct; the chart result works in all characteristics, but it proves no separability or ordinary-node statement. Retain independent fixed-component I₂ versus component-permuting geometry, the k[q]-module freeness target, all later G.0–G.6 obligations and full source/supplier closure.

## Retained predecessor handoffs

# Current checkpoint — Codex codex-a71f92, 3 October 2026

Refs #3378. Claim5963356805 was confirmed by the swarm bot in5963358012; the full issue was reread after confirmation. Read base f0401e396395a306b58cb28db79f3b24721e6fb3; publication preflight bfef64afffd06e4c8a18b53a76c331a147dd7eb7. This is a partial planning checkpoint, not an implementation or a source-wide closure.

## Mathematical result and preserved scope

The new affine normalization cokernel is specified on the actual existing carriers B=k[X], A_q⊂B and E=AdjoinRoot(q). The polynomial quotient ring homomorphism induces the explicit native polynomial action, restricted to A_q. Kernel, image, surjectivity and first-isomorphism steps give the specified A_q-linear B/(A_q·1)≃E/(A_q·1), with forward and inverse representative equations. Two actual restriction-of-scalars denominator equalities give the k-linear B/A_q≃E/k. For monic quadratic q the defect is one-dimensional over k, the class of X is nonzero and generates it, both A_q actions factor through the existing scalar residue homomorphism, and both module annihilators equal the actual contraction of(q).

The equivalences require neither monicity nor degree assumptions and include q=0 and q=1. The dimension/residue/annihilator statements require monic degree two, but no separability, irreducibility, perfectness, inversion of two or characteristic restriction. Fifteen new named tests include inseparable X² over F₂, nonsplit X²+X+1 over F₂, repeated X²+X+1 over F₃, unit and zero polynomials, nonzero root class, conductor action and a non-annihilating unit.

Twenty-two declaration-sized nodes are appended. All 224 incoming statements, hypotheses, tests and acceptance contracts are preserved. 223 complete node objects are unchanged; the I₁ genus consumer has only two appended prerequisites and one appended proof step linking the actual affine comparison and dimension. Its original statement and original projective/cohomology proof obligations remain intact.

The reserved Ferrand-pushouts key, all 78 routed items, 21 source findings, 23 supplier requests, 17 gaps and seven partial coverage rows are retained. No new planet or supplier request is introduced. The roadmap's G.1 description and reader record the current affine frontier without deleting historical frontiers.

Final packet: 246 nodes (14 definitions,15 constructions,182 lemmas,26 theorems,9 comparisons);109 API items;109 definition/construction tests and139 total tests;29 planets;219 baseline declarations. All implementation statuses remain unchecked. No stage is closed.

## Sources, audit and native foundations

The reviewed parent R11.1–R11.6 library audit and accepted AUDIT10 review were read; no reviewed Part II row exists. The full owned key entry and the78-item route brief were read, including the one-component conductor route items, the Witaszek geometric-versus-topological distinction and supplier-stage descriptions. No blueprint-link file mentions this roadmap at the read base.

Fresh primary reading on3 October2026 covers [Schröer arXiv2004.07025v3 §3](https://arxiv.org/html/2004.07025v3): conductor diagrams and complete Proposition3.1–3.2, proofs and adjoining count table. HTML SHA-256 d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456. The affine signatures are authored deductions, not printed source theorems. The Annals edition is distinct; no full-paper/erratum collation, fresh inherited finite-field certificate run or revalidation of every earlier source is claimed.

Twenty-seven baseline citations are added to the existing192. Native submodule quotients, scalar towers, first-isomorphism equivalences, restriction of scalars, dimension-one characterization and annihilator transport are imported, not replanned. The actual statements and ambient hypotheses were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. Exact new-name searches also used Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. A scoped public Mathlib/Zulip search did not identify a matching change; that is not an exhaustive absence claim.

## Lean checks and limitations

The actual-proof extraction is793 lines with34 examples and52 axiom audits. It compiles without errors, warnings or admissions, with only ordinary axioms. Final native run26.01s, peak RSS6813100KiB, exit0. The exact admitted new-header extraction is606 lines and has all22 new headers and15 new named examples; it compiles with exactly37 admission warnings and no other warning or error, in22.41s, peak RSS6781424KiB, exit0. It retains the inherited275-line actual carrier prefix and eight reused actual scalar-remainder helpers; it is not the full suggested file.

Native source SHA-256 fb78e8d07d5a68f118f5ff3b1ac4e2f9571dd09ef9d921f3619af7e08e99a8a3.
Admitted extraction SHA-256 f24da6f72e809606398333b878267bb590cef80363d4b8cd9c68f2787f47d8cc.

The full Tau Ceti-importing suggested file is uncompiled: required pinned point-count, point-variable-change, divisor-scheme and stable-model artifacts are unavailable. No Lake setup, update, cache acquisition, library build or language server was attempted. Compiles were sequential, available memory45–46GiB, each bounded by timeout1200s. Nothing remains running after submission.

All22 new declaration headers and15 named-example headers agree byte-for-byte between native, admitted extraction and canonical suggested file. The canonical file keeps all incoming declarations and adds only six individual Mathlib imports, explicit native quotient-action instances, and admitted new declarations/examples.

## Checker, intake, graph and public recovery

The actual indexed blueprint checker reports zero errors and warnings. The actual intake file scanner passes all five deliverables. The preserved-input checks retain the key, routes, findings, gaps, requests, original roadmap stage contracts, reader prefix, incoming suggested declarations and all224 incoming contracts.

Actual immutable atlas assembly is compared with the224-node incoming control: stage DAG3043 vertices/8727 edges; own DAG246/559 (control224/519); combined DAG3260/9474. All are acyclic. There are zero unresolved or external declaration references in the own prerequisite closure, no skipped or pending own links, and all69 required packet, request and roadmap-stage pairs are reachable. Stage edges and all other roadmap skipped/pending links are unchanged. This tests actual partial integration, not global source closure.

Immutable proof/evidence archive: [ee5263b08a667d1451f02d62fad6bc542654df09](https://github.com/CBirkbeck/tauceti-explorer/commit/ee5263b08a667d1451f02d62fad6bc542654df09). It is retained as an additional parent of the proposed checkpoint, not part of the first-parent deliverable diff. The archive's two files were fetched from GitHub and compared byte-for-byte with the uploaded sources. Native and admitted bodies are delimited in its allowed suggested path; the actual validator and immutable reader are delimited in its allowed handoff path. The recovered native source compiles without warnings and the recovered validator passes; the recovered admitted source also compiles with exactly37 admission warnings and no error or other warning. The read-only public HTTP recovery program was independently run against the archive and returned the exact native source.

The following read-only recovery program emits one archived source and validates its exact hash. Materialize its output with the worker's own scratch apply-patch workflow. Recover Native.lean, Admitted.lean, verify.py and immutable_view.py, then place only this PR's five deliverables in their matching scratch subdirectories (roadmaps, packets, readmes, suggested, handoff). It is not a repository snapshot.

```python
"""Read-only public recovery: emits one source, never writes a file."""
import hashlib,os,sys,urllib.request
REPO="CBirkbeck/tauceti-explorer"
ARCHIVE="ee5263b08a667d1451f02d62fad6bc542654df09"
RID="NeronModelsAndSemistableAbelianVarietiesPartII"
ARTIFACTS={
"Native.lean":("research/blueprint/suggested/"+RID+".lean",
"-- BEGIN ARCHIVED CHECKED AFFINE NORMALIZATION COKERNEL\n",
"-- END ARCHIVED CHECKED AFFINE NORMALIZATION COKERNEL\n",
"fb78e8d07d5a68f118f5ff3b1ac4e2f9571dd09ef9d921f3619af7e08e99a8a3"),
"Admitted.lean":("research/blueprint/suggested/"+RID+".lean",
"-- BEGIN ARCHIVED ADMITTED AFFINE COKERNEL HEADERS\n",
"-- END ARCHIVED ADMITTED AFFINE COKERNEL HEADERS\n",
"f24da6f72e809606398333b878267bb590cef80363d4b8cd9c68f2787f47d8cc"),
"verify.py":("research/blueprint/handoff/DESIGN-"+RID+".md",
"# BEGIN ARCHIVED AFFINE COKERNEL VALIDATOR\n",
"# END ARCHIVED AFFINE COKERNEL VALIDATOR\n",
"42bc81d318df7e91fc5f6169df16aee16a4c0afdbb2edca411d78fc3319aa7a7"),
"immutable_view.py":("research/blueprint/handoff/DESIGN-"+RID+".md",
"# BEGIN ARCHIVED IMMUTABLE READER\n",
"# END ARCHIVED IMMUTABLE READER\n",
"a577a14520365da4cfaf5062ec7cc97ca8608325f0ae9176a1df1b0b414295ef")
}
name=sys.argv[1]
path,start,end,expected=ARTIFACTS[name]
url="https://raw.githubusercontent.com/"+REPO+"/"+ARCHIVE+"/"+path
with urllib.request.urlopen(url,timeout=45) as response:raw=response.read().decode()
assert raw.count(start)==raw.count(end)==1
source=raw.split(start,1)[1].split(end,1)[0]
assert hashlib.sha256(source.encode()).hexdigest()==expected
sys.stdout.write(source)
```

Run the recovered validator with TAUCETI_REPO pointing to the existing read-only clone, P8_VALIDATE_BASE=bfef64afffd06e4c8a18b53a76c331a147dd7eb7 and TAUCETI_BASELINE pointing to the existing declarations index. The reader executes actual pinned repository checker/intake/build code through immutable git reads; writes to repository paths are rejected. No files are copied into the shared clone.

For Lean, use the existing build at the pins, its existing LEAN_PATH and compiler. Check available memory first, require at least20GiB, invoke one compiler at a time with timeout1200, and wait for each to exit. Expected Native results are52 ordinary-axiom audits and no warning/error/admission; Admitted results are37 admission warnings and no other warning/error. The source byte hashes above are independent of local paths in warning messages.

## Resume at the projective comparison

Construct and compare the two actual projective charts and global finite normalization, then the conductor ideal sheaf. Prove the actual structure-sheaf sequence with E/k supported at the pinched point and derive finite-pushforward H0/H1 using the named existing suppliers. Do not equate this affine calculation with those sheaf results or replace geometric carriers by arbitrary module parameters.

Keep the independent two-component I₂ construction and fixed-component versus component-permuting forms separate. Preserve the ordinary-node versus inseparable-cusp hypotheses. The unrelated k[q]-freeness target, all G.0–G.6 source/dependency closure, general Lang inputs, minimal models, wild fibers, classification and missing-source work remain as recorded. No inherited gap is silently removed.

---

## Retained prior checkpoint history

# Quadratic affine normalization — #3378

Codex — codex-rtOQ9t; 2 October2026. Winning claim5962824017, bot5962825720. Mathematical read base `e49e08127a3c6b3dadd74ddbe92c7499a11809ce`.

This is a partial design checkpoint. Sixteen declaration-sized G.1 nodes, six API entries and twelve typed examples advance the predecessor's finite-module/fraction-field frontier. The actual polynomial module over A_q has specified coefficients from native monic division, reconstructs every f as a•1+b•X, and is spanned by1,X. The actual ring inclusion is finite, and its native Spec map is finite. For every nonzero q, the native fraction fields have the canonical A_q-algebra equivalence with inverse coordinate(qX)/q. For monic quadratic q, the native polynomial ring is the actual IsIntegralClosure of A_q in that shared field, and integral elements are exactly polynomial images. Generic finiteness, fraction-field construction and integral closure are existing Mathlib imports, not new general theories.

The module coefficient pair is specified but not unique: (−qX,q) and(0,0) both give zero. The spanning pair is not a module basis over A_q. No module freeness or flatness, nodality, geometric genus or projective scheme normalization is inferred. The native Scheme finiteness signature is a statement about the given affine Spec inclusion; the two-chart projective normalization comparison remains required.

The packet now has224 nodes:13 definitions,13 constructions,166 lemmas,26 theorems,6 comparisons;98 API entries;98 definition/construction tests and124 total tests;29 planets;192 baseline entries;17 gaps;23 requests;78 routed records;21 inherited source findings;seven partial stages and zero closed. All208 inherited statements, hypotheses, acceptance, source locators and implementation statuses are mechanically preserved.207 whole node objects are identical. Only quadratic-pinch-normalization gains three proved affine inputs, one appended proof step and four tests. All inherited API/test prefixes, sources, route coverage, supplier requests, gap records and historical receipts remain unchanged. The reader preserves the entire incoming text as a prefix. The roadmap preserves every stage ID, contract and prerequisite, appending the current affine scope only to G.1's description. The reserved Ferrand geometric-square predicate and both Witaszek/Schröer consumer contracts remain unchanged.

## Exact proof and validation boundary

The [immutable actual proof snapshot](https://github.com/CBirkbeck/tauceti-explorer/blob/50aa007ffe084e26ccd4308d86a671304464af68/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) contains the complete275-line native source between BEGIN/END ARCHIVED CHECKED QUADRATIC AFFINE NORMALIZATION markers. It includes the exact existing scalar-preimage subalgebra, membership and constants fixture with actual proofs, all new bodies and the inherited finite-inclusion signature with its actual proof. No Tau Ceti fixture or geometric substitute enters this Mathlib-only extraction.

Native extraction:12 examples,20 named axiom audits, zero errors, admissions or warnings. Every audit lists only propext,Classical.choice,Quot.sound. Source SHA256 `74fba5a99c50c3786f9b67da065ba49d5b4bf38c35cac4d407888f0f2c2edf8d`; normalized diagnostic SHA256 `8f56a7716e8fbbe5b0330e66de1ed41af63bfc0bacedd98e833490b4a22486fc`; elapsed11.00s, maximumRSS6765480KiB,51GiB available before invocation.

Exact admitted extraction:154 lines,12 examples, zero errors,29 admission warnings and zero other warnings. Source SHA256 `d9efd50662281a4a3c984ecf58f72cf792de78ae8cfda7354cdd21aea59dd3d1`; normalized diagnostic SHA256 `113c760133ac7d28000e2da50843b2dcad198b2ae0a8d496bf7fbb1fb83f7909`; elapsed10.00s, maximumRSS6740344KiB,51GiB available before invocation. All29 outer headers compare byte-identically, including seventeen named signatures and twelve examples. Sixteen named signatures are new; finite_normalization is the inherited signature. The final submitted outer bodies are admitted under PROTOCOL§13; the actual bodies remain publicly recoverable in the archive.

**The complete Tau Ceti-importing suggested file was not compiled.** The existing build lacks compiled pinned PointCount, affine point-variable-change, WeilDivisor.Scheme.Basic and stable-model artifacts. Their exact-pin sources exist. Only the exact275/154-line native/admitted extractions were elaborated. Lean4.34.0-rc2, Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 are unchanged. No setup, update, cache download, library build, language server or concurrent Lean invocation occurred. Each compile checked the20GiB memory minimum and used timeout1200s; no compiler remained running at submission.

The twelve tests cover specified zero coefficients and the polynomial generator; native characteristic-two cusp coefficients; cusp and nonsplit finite inclusions; a characteristic-three repeated-root finite inclusion; the non-basis relation; cusp coefficient compatibility, unit-q inverse compatibility and arbitrary fraction compatibility (including the field's zero-denominator convention); integrality of the actual coordinate; and the genuine q=0 nonfiniteness boundary, using the native finite constants module and the built polynomial-not-finite theorem. No source separability or inversion of2 is introduced.

## Source and library reading

Whole issue before and after the winning bot confirmation; full incoming890-line handoff, all208 statement/hypothesis/acceptance contracts, seven stages and their coverage, reviewed AUDIT10 R11.1–R11.6 and full REV-AUDIT10, reserved Ferrand node and full key survey entry,78-item owner brief and full routed items15–18,170–171 plus Witaszek geometric/topological/conductor contracts. Fresh pinned native statements and scoped source section3 were read. Governing protocols and nearby upstream examples retain this continuous loop’s earlier whole readings. Historical source/erratum/regression strands are preserved, not freshly recertified.

The full reviewed AUDIT10 parent rows identify existing general affine/scheme/group foundations and the still-missing Néron-model, Picard and degeneration comparisons; no reviewed own PartII row was found. Native monic remainder, coefficient reconstruction, module finiteness/span, fraction representative and equivalence, polynomial normality, finite-to-integral and integral-closure statements were read at their pin with ambient hypotheses. Native IsFinite.SpecMap_iff was read and used for the actual Scheme map. Exact helper-name searches through both pinned trees found no matching new named declarations; this is not a claim of exhaustive mathematical absence. Fifteen additional distinct baseline entries are indexed; pre-existing entries are retained.

Fresh primary source: [Schröer arXiv2004.07025v3](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and complete Proposition3.1–3.2 statements/proofs/table. HTML acquired2 October2026, SHA256 d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456. The finite-module and integral-closure calculations are authored deductions from the inherited affine chart, not printed theorems attributed to that source. No fresh full-paper/Annals erratum collation or inherited numerical regression rerun is claimed. All21 inherited findings, version distinctions and verification states remain preserved.

## Atlas and preservation

Indexed blueprint checker:zero errors and warnings. Actual intake scanner:five allowed deliverables, zero problems. Read-only scripts/build.py assembly with original-packet control:stage graph3043 vertices/8727 edges; own declaration graph224/519; stages plus recursively reachable declarations3238/9426. All three DAGs are acyclic. All68 inherited required stage pairs are reachable; stage edges and unrelated skipped-link sets are unchanged. No own pending/skipped links, new unresolved reference or external declaration node appears. Native baseline refs terminate as library leaves; TauCetiRoadmap refs remain stage vertices. This scoped graph check does not certify the open supplier theorem proofs or complete source/dependency closure of the seven-stage roadmap. No atlas data was written.

Publication preflight against main `bcc37efa667a1f3c521b0d8e2407b9eda3fa87e6`: the own incoming deliverables, binding instructions, reviewed audit, reserved key and supplier/source contracts were unchanged from the read base. Current main was merged into this own branch and the complete validator/intake/control assembly was rerun successfully. At publication the stage graph has 3043 vertices/8727 edges; combined graph 3238/9426. All three DAGs,68 required paths, unchanged stage edges and unrelated skipped-link sets still pass. Native Lean source/headers are unchanged, so the existing compile receipts remain exact.

## Reproduce

Save the first Python block as validate.py and the second as graph.py in one small disk-backed scratch directory outside a checkout of this submission. Fetch the exact mathematical base and archive commit into the same existing clone if absent; do not create a repository snapshot or new build. From the checkout root, run PYTHONDONTWRITEBYTECODE=1 python3 followed by the path to validate.py, optionally passing the pinned declarations.tsv as its first argument. The program reconstructs both exact checked sources from the immutable archive and final suggested signatures, verifies all hashes/headers and preserved mathematical contracts, then runs the actual checker, intake scanner and control assembler. It writes only its own scratch directory.

For Lean, use an already existing build at the pins and run lake env lean on the reconstructed absolute Normalization.lean and Admitted.lean paths sequentially, checking free memory≥20GiB and using timeout1200s each time. Do not set up, cache-fetch or build libraries. Normalize diagnostics by replacing the full source directory prefix with the source basename, remove the RESOURCE timing footer, and retain all other bytes including the final newline. Compare the hashes above. Delete reproduction scratch after use.

Validator SHA256 `d355638abe58147a3b0ee36413233f4b68429a1992621ff3a435f38a1ad7c550`; graph script SHA256 `9c259f46e82f6c246ad606c8ab22a85e0d8c7219aec506dafdf2b329b4289ced`. Both scripts include one final newline.

```python
from pathlib import Path
from collections import Counter
import ast,json,re,subprocess,hashlib,sys,runpy
root=Path.cwd();sc=Path(__file__).resolve().parent
rid='NeronModelsAndSemistableAbelianVarietiesPartII';base='e49e08127a3c6b3dadd74ddbe92c7499a11809ce';archive='50aa007ffe084e26ccd4308d86a671304464af68'
def blob(folder,ext,commit=base):
 name=('DESIGN-' if folder=='handoff' else '')+rid+'.'+ext
 return subprocess.check_output(['git','show',f'{commit}:research/blueprint/{folder}/{name}'],text=True)
def read(folder,ext):
 name=('DESIGN-' if folder=='handoff' else '')+rid+'.'+ext
 return (root/'research/blueprint'/folder/name).read_text()
original=json.loads(blob('packets','json'));oldroad=json.loads(blob('roadmaps','json'))
(sc/'base-packets.json').write_text(blob('packets','json'));(sc/'base-roadmaps.json').write_text(blob('roadmaps','json'))
p=json.loads(read('packets','json'));road=json.loads(read('roadmaps','json'));lean=read('suggested','lean');reader=read('readmes','md')
old={n['id']:n for n in original['nodes']};new={n['id']:n for n in p['nodes']};exception=rid+':G.1/quadratic-pinch-normalization';v=p['quadraticNormalizationContinuation']
assert len(old)==208 and len(new)==224 and len(set(new)-set(old))==16
for nid,n in old.items():
 for k in ['id','kind','statement','hypotheses','acceptance','sources','uses','declarationName','implementationStatus','planet','library','api']:
  assert n.get(k)==new[nid].get(k),(nid,k)
 assert n.get('tests',[])==new[nid].get('tests',[])[:len(n.get('tests',[]))],nid
 assert n['prerequisites']==new[nid]['prerequisites'][:len(n['prerequisites'])],nid
 if nid!=exception:assert n==new[nid],nid
 else:assert new[nid]['proofSteps'][:-1]==n['proofSteps'] and len(new[nid]['tests'])==len(n.get('tests',[]))+4
assert sum(n==new[nid] for nid,n in old.items())==207
for k in original:
 if k not in ['summary','nodes','baseline','sources','coverage']:assert p[k]==original[k],k
assert p['baseline']['declarations'][:177]==original['baseline']['declarations'] and len(p['baseline']['declarations'])==192
assert p['sources'][:len(original['sources'])]==original['sources']
assert p['status']=='partial' and Counter(c['status'] for c in p['coverage'])=={'partial':7}
assert all(n['implementationStatus']=='unchecked' for n in new.values())
for a,b in zip(original['coverage'],p['coverage']):
 assert {k:x for k,x in a.items() if k!='remaining'}=={k:x for k,x in b.items() if k!='remaining'}
 assert b['remaining'][:len(a['remaining'])]==a['remaining']
for k in oldroad:
 if k!='stages':assert oldroad[k]==road[k],k
for a,b in zip(oldroad['stages'],road['stages']):
 assert {k:x for k,x in a.items() if k!='description'}=={k:x for k,x in b.items() if k!='description'}
 assert b['description'].startswith(a['description'])
assert reader.startswith(blob('readmes','md'))
imports='import Mathlib.RingTheory.Finiteness.Subalgebra\nimport Mathlib.RingTheory.IntegralClosure.IntegrallyClosed\nimport Mathlib.RingTheory.Polynomial.IsIntegral\nimport Mathlib.RingTheory.Localization.FractionRing\n'
prefix=blob('suggested','lean').replace('import Mathlib.RingTheory.AdjoinRoot\n',imports+'import Mathlib.RingTheory.AdjoinRoot\n')
prefix=prefix.replace('  Add the canonical localization-at-q isomorphism commuting with the inclusion,\n  the fraction-field identification and SR.1\'s actual normalization comparison.','  Native localization-at-q, specified finite module generation, shared fraction-field\n  identification and the affine integral-closure comparison are separately checked below.\n  Add SR.1\'s actual projective normalization comparison and its two chart maps.')
fragment=lean.split('/- BEGIN QUADRATIC AFFINE NORMALIZATION -/\n',1)[1].split('/- END QUADRATIC AFFINE NORMALIZATION -/',1)[0]
assert lean==prefix+'\n/- BEGIN QUADRATIC AFFINE NORMALIZATION -/\n'+fragment+'/- END QUADRATIC AFFINE NORMALIZATION -/\n'
for nid,n in new.items():
 if nid not in old:
  assert n['statement'] in reader
  assert re.search(r'^(?:noncomputable )?(?:def|lemma) '+re.escape(n['declarationName'].rsplit('.',1)[1])+r'\b',fragment,re.M),nid
 if nid not in old:
  for a in n.get('api',[]):
   assert a['name'] in reader and a['statement'] in reader
 for t in n.get('tests',[])[len(old.get(nid,{}).get('tests',[])):]:
  assert t['name'] in reader and t['statement'] in reader and t['name'] in lean
assert not re.search(r'\bsorry\b',read('packets','json')+reader)
actual=blob('suggested','lean',archive).split('BEGIN ARCHIVED CHECKED QUADRATIC AFFINE NORMALIZATION\n',1)[1].split('END ARCHIVED CHECKED QUADRATIC AFFINE NORMALIZATION\n',1)[0]
assert hashlib.sha256(actual.encode()).hexdigest()==v['native']['sourceSha256']
assert not re.search(r'\bsorry\b|^axiom |^opaque ',actual,re.M)
# Compare exact outer signatures and example statements, including the inherited finite declaration.
def declarations(s):
 rx=re.compile(r'^(?:-- test: [^\n]+\n)?(?:noncomputable )?(?:lemma|def|example)\b',re.M)
 starts=[m.start() for m in rx.finditer(s)]+[len(s)];out=[]
 for i,j in zip(starts,starts[1:]):
  head=s[i:j].partition(' :=')[0].rstrip()
  if head.startswith('-- test:'):key=head.splitlines()[0][9:]
  else:key=re.search(r'^(?:noncomputable )?(?:lemma|def) (\w+)',head,re.M).group(1)
  out.append((key,head))
 return out
start=actual.index('lemma normalization_remainder');end=actual.index('\nend TauCeti.GenusOne.QuadraticPinch',start)
actualheaders=declarations(actual[start:end]);canonicalheaders=dict(declarations(fragment[fragment.index('lemma normalization_remainder'):fragment.index('\nend TauCeti.GenusOne.QuadraticPinch')]))
finite=re.search(r'^lemma finite_normalization[\s\S]*? := by sorry\n',lean,re.M).group(0).partition(' :=')[0]
canonicalheaders['finite_normalization']=finite
assert len(actualheaders)==29 and all(h==canonicalheaders[k] for k,h in actualheaders)
admitted=actual[:start]+''.join(canonicalheaders[k]+' := by sorry\n\n' for k,h in actualheaders)+'end TauCeti.GenusOne.QuadraticPinch\n'
assert hashlib.sha256(admitted.encode()).hexdigest()==v['admittedExtraction']['sourceSha256']
(sc/'Normalization.lean').write_text(actual);(sc/'Admitted.lean').write_text(admitted)
assert len(re.findall(r'^example\b',actual,re.M))==len(re.findall(r'^example\b',admitted,re.M))==12
# Actual checker and intake scanner; no replacement checker and no atlas output.
sys.path.insert(0,str(root/'scripts'));import check_blueprint
index=check_blueprint.load_index(Path(sys.argv[1])) if len(sys.argv)>1 else None
errors,warnings,summary=check_blueprint.check(root/'research/blueprint/packets'/f'{rid}.json',index,check_blueprint.world())
assert not errors and not warnings,(errors,warnings)
tree=ast.parse((root/'research/blueprint/intake.py').read_text());picked=[n for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id in {'ALLOWED','PRIVATE'} for t in n.targets) or isinstance(n,ast.FunctionDef) and n.name=='file_problems']
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
files={f'research/blueprint/{d}/'+('DESIGN-' if d=='handoff' else '')+rid+'.'+e:read(d,e) for d,e in [('packets','json'),('roadmaps','json'),('readmes','md'),('suggested','lean'),('handoff','md')]}
problems=[x for path,s in files.items() for x in env['file_problems'](path,s)];assert not problems,problems
for path,s in files.items():assert not re.search(r'[ \t]+$',s,re.M),path
receipt={'indexedChecker':summary,'checkerErrors':0,'checkerWarnings':0,'actualIntakeFiles':len(files),'actualIntakeProblems':0,'preservedMathematicalContracts':208,'unchangedNodeObjects':207,'addedNodes':16,'signatureHeaders':29,'typedExamples':12,'apiItems':sum(len(n.get('api',[])) for n in new.values()),'allTests':sum(len(n.get('tests',[])) for n in new.values()),'sourceRecovery':'exact native and admitted hashes and headers match','scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
(sc/'validation-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
runpy.run_path(str(sc/'graph.py'),run_name='__main__')
```

```python
import sys,json,hashlib
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sc=Path(__file__).parent;sys.path.insert(0,str(root/'scripts'));from build import assemble
stem='NeronModelsAndSemistableAbelianVarietiesPartII';rid=stem;packet=json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text());original=json.loads((sc/'base-packets.json').read_text())
def overlay(name,p):
 d=sc/name;d.mkdir(exist_ok=True)
 for f in (root/'data/blueprints').iterdir():
  if f.name in [stem+'.json','roadmaps']:continue
  t=d/f.name
  if not t.exists():t.symlink_to(f,target_is_directory=f.is_dir())
 rd=d/'roadmaps';rd.mkdir(exist_ok=True)
 for f in (root/'data/blueprints/roadmaps').glob('*.json'):
  if f.name==stem+'.json':continue
  target=rd/f.name
  if not target.exists():target.symlink_to(f)
 (rd/(stem+'.json')).write_text((sc/'base-roadmaps.json').read_text() if name=='control' else (root/'research/blueprint/roadmaps'/f'{stem}.json').read_text())
 (d/(stem+'.json')).write_text(json.dumps(p))
 return d
a,ctx=assemble(require_distances=False,blueprints=overlay('overlay',packet));control,cctx=assemble(require_distances=False,blueprints=overlay('control',original))
def stats(vertices,edges):
 vs=set(vertices);out=defaultdict(set);ins=defaultdict(int)
 for s,t in edges:
  vs.update([s,t]);out[s].add(t)
 for s in out:
  for t in out[s]:ins[t]+=1
 q=deque(sorted(v for v in vs if ins[v]==0));n=0
 while q:
  s=q.popleft();n+=1
  for t in out[s]:
   ins[t]-=1
   if ins[t]==0:q.append(t)
 return {'vertices':len(vs),'edges':sum(map(len,out.values())),'acyclic':n==len(vs)},out
stages={s['id'] for s in a['stages']};se={(e['source'],e['target']) for e in a['stageEdges']};ce={(e['source'],e['target']) for e in control['stageEdges']}
# Exact virtual upstream stage references are graph vertices, never library leaves.
st,following=stats(stages,se)
own={n['id']:n for n in packet['nodes']};oe={(x,n['id']) for n in own.values() for x in n['prerequisites'] if x in own};og,_=stats(own,oe)
universe={}
for folder in ['data/decompositions','research/blueprint/packets','data/blueprints']:
 for f in sorted((root/folder).glob('*.json')):
  p=json.loads(f.read_text())
  for n in p.get('nodes',[]):universe[n['id']]=n
universe.update(own);reachable={};unresolved=set();baselines=set();dep=set();todo=list(own)
while todo:
 nid=todo.pop()
 if nid in reachable:continue
 n=universe[nid];reachable[nid]=n
 for ref in n.get('prerequisites',[]):
  if ref in universe:
   dep.add((ref,nid));todo.append(ref)
  elif ref in stages or ref.startswith('tauceti:TauCetiRoadmap/'):
   stages.add(ref);dep.add((ref,nid))
  elif ref.startswith(('mathlib:','tauceti:')):baselines.add(ref)
  else:unresolved.add(ref)
combined,_=stats(stages|set(reachable),se|dep)
# Required stage paths come from the original touching links and binding RS-08.
# Planet declaration ids are not their parent stage ids.
scope=set(packet['scope']);pairs={(x,y) for x,y in ce if x in scope or y in scope}
for path in ['data/atlas.json']:
 record=json.loads((root/path).read_text())
 for edge in record.get('stageEdges',record.get('links',[])):
  if edge['source'] in scope or edge['target'] in scope:
   pairs.add((edge['source'],edge['target']))
def reaches(s,t):
 seen=set();todo=[s]
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo.extend(following.get(x,()))
 return False
missing=[list(x) for x in sorted(pairs) if not reaches(*x)]
roadmaps={r['id']:r for r in a['roadmaps']};cr={r['id']:r for r in control['roadmaps']}
skips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in a['roadmaps'] if r['id']!=rid}
cskips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in control['roadmaps'] if r['id']!=rid}
unchanged=sum(own[n['id']]==n for n in original['nodes']);assert unchanged==207
rec={'actualAssembler':True,'stageDAG':st,'ownDeclarationDAG':og,'stagesAndReachableDeclarations':combined,'reachableDeclarations':len(reachable),'externalDeclarations':sorted(set(reachable)-set(own)),'reachableBaselineReferences':len(baselines),'unresolved':sorted(unresolved),'ownSkippedLinks':roadmaps[rid]['blueprint']['skippedLinks'],'otherSkipsMatchOriginal':skips==cskips,'stageEdgesUnchanged':se==ce,'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'inheritedMissingStagePairs':missing,'unchangedNodeObjects':unchanged,'partDeclarations':len(own),'partPlanets':sum('planet' in n for n in own.values()),'roadmapDeclarations':roadmaps[rid]['blueprint']['declarations'],'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
assert st['acyclic'] and og['acyclic'] and combined['acyclic'];assert not unresolved;assert se==ce and skips==cskips
(sc/'graph-receipt.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec,indent=2))
```

## Resume

Construct the actual homogeneous P¹ normalization on both projective charts, proving the infinity-chart localization with its explicit unit and agreement with the now-checked finite birational affine inclusion and actual ring integral closure. Import the scheme normalization carrier/comparison from the established owner; do not re-plan its general theory. Identify the actual conductor ideal sheaf and the quotient sheaf with E/k and its native module actions. Use finite pushforward to obtain H⁰=k and H¹≃E/k. Keep the local cotangent, associated-graded and nodal-branch comparison separate from the repeated-root cusp; retain characteristic2/3 and imperfect-field forms. The two-component I₂ construction, fixed vertices versus conjugate edges and actual all-extension Scheme point count remain distinct required targets. The unrelated k[q]-module freeness interface is still not constructed. All other G.0–G.6, full source extraction, supplier, minimality, resolution/orbit and completeness obligations remain required.

## Preserved incoming handoff

# Common-ideal localization — current checkpoint

Codex — codex-5ebb6f; 2 October 2026; Refs #3378. Partial substantive continuation from aec55383b7e77a42d961484dd0f8431212790883. Claim5962209216 was confirmed by bot5962211074; the whole issue was read before and after that reply. The packet has208 nodes (13 definitions,11 constructions,153 lemmas,26 theorems,5 comparisons),92 API items,92 construction/definition tests counted by the checker and112 total test entries,29 planets,177 baseline declarations,23 requests and17 gaps. All seven stages remain partial, with zero closed stages and unchecked implementation status throughout.

## Mathematical result and source

For an arbitrary unital map f:A→B and ideal I⊂A, require that the set f(I) is already an ideal and ker(f)∩I=0. If t∈I, then t kills every original kernel element, while every f(t)b has an actual lift in I. The pinned Away.map injectivity/surjectivity criteria imply bijectivity of the specified map A[1/t]→B[1/f(t)]. Native RingEquiv.ofBijective gives its actual equivalence. If f(a)=f(t)b, its inverse sends[b] to a/t, without a domain or cancellation assumption.

The arbitrary-subring conductor supplies these ideal conditions. For A_q=k+qk[X], qh belongs to A_q for every h, so the actual pinch inclusion is bijective after inverting q and the inverse sends[X] to(qX)/q. These statements hold for every polynomial q. Quadratic finiteness/normalization keeps its separate monic degree-two conditions; the localization result is not a projective or sheaf comparison.

Ten nodes are added: eight new named declarations and two promoted inherited containment/membership declarations. The new equivalence’s forward-map API is promoted separately before the inverse node consumes it. All198 inherited statements, hypotheses, acceptances, APIs, tests, uses and names are preserved;196 whole node objects are unchanged. Only localization-complement’s proof/prerequisites/citation and quadratic-pinch-normalization’s appended prerequisites change. Existing route, source-issue, supplier-request and gap objects are preserved. All78 routed items remain accounted for. Seventeen actual pinned declarations are added as baseline, including the already existing localization criteria; those generic criteria are imported rather than planned again.

Fresh source reading: published Ferrand, Conducteur, descente et pincement (BSMF131(4),2003), printed pp555–557 and565–569 in full parsed text, with visual inspection of pp557 and568. PDF https://numdam.org/item/BSMF_2003__131_4_553_0.pdf; SHA2564f1f2438ad6d757d67d2ecf154b1bc920d210d8abd54c02e6acd020805629d91. The inherited localization locator pointed to §1.4; the complete argument is Theorem5.1, printed p568. This is a citation correction, not a new alleged error in the paper. No fresh whole-paper reading is claimed. Reviewed AUDIT-10/R11 was read, with no direct PartII row. Exact key-definition, owner route/brief, applicable SF.0 and upstream StableReduction Layer1 contracts were checked. Current G.0 statements/hypotheses and targeted G.1 contracts were read; other current nodes are preserved mechanically, not claimed freshly read in full. This session’s earlier whole protocols and upstream exemplar readings remain in effect.

## Public proof and checks

The immutable checked source is archived at [f5288262eeafbced0db1da046651a4128ccdd167](https://github.com/CBirkbeck/tauceti-explorer/blob/f5288262eeafbced0db1da046651a4128ccdd167/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean), between BEGIN/END ARCHIVED CHECKED COMMON IDEAL LOCALIZATION. The current suggested file removes that historical comment and retains admitted planning bodies for the eight new named declarations, two additional API lemmas and ten examples. The promoted inherited declarations and all earlier signatures retain their existing bodies. The archive remains an ancestor of the submission, accessible publicly rather than through private scratch files.

Native source:343 lines,10 examples,16 print-axiom audits,0 errors/admissions/warnings; 0:02.60 wall time, maximumRSS2467288KiB, 54GiB available. Source SHA256 `116f478ae802f6ca455a0299d4af2e355ab3c97b41f0bdba598453f11225507b`; normalized log SHA256 `9be9935b1dddb06b0095c9156a4ef72869c5f374504f0517caa2a67d1043aa2e`. Every audit uses only the standard logical/choice/quotient axioms, never an admission axiom.

Exact submitted extraction:235 lines,10 examples,0 errors,20 expected admission warnings and0 other warnings; 0:02.20 wall time, maximumRSS2452052KiB, 54GiB available. Source SHA256 `06729c398ecf7dcde83b7d37ab2a5a06f830f55ebbcc3cf949a6167f657a52bc`; normalized log SHA256 `a82c39f806f364c9005084ae34a3b2c9173459653b7d190a9d06725a488cf694`. Twenty native/submitted declaration or example headers match exactly. Both checks used the existing Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build and Lean4.34.0-rc2, one invocation at a time, with memory checks and timeout1200. No build, setup, cache download, update or LSP was used.

The full2077-line Tau Ceti importing suggested file was not compiled: the pinned PointCount, variable-change, WeilDivisor and stable-model compiled artifacts are absent. The Mathlib-only extraction contains all new material and the exact native inherited conductor/pinch fixtures it uses; it makes no claim about the rest of the combined file.

The examples include the identity map and inverse6/2; a noninjective product projection that becomes bijective after localization; a Z/4 nilpotent whose localization is zero; and actual localization failures after dropping the kernel or image-ideal condition. Split, irreducible, characteristic-two cuspidal and zero-polynomial pinches are specialized over arbitrary native localization carriers. Those four tests do not compute geometric fibers.

The indexed packet checker and five-file intake scan pass with no errors/warnings/problems, and scope/whitespace checks pass. The actual read-only assembler passes acyclic stage, declaration and combined graphs, all68 required stage paths, no unresolved prerequisites and no skipped own links. Exact graph receipts are in commonIdealLocalizationContinuation.checks. Publication base099cf06f3b3c49aa0cb075268da13d97b3dc300e was fetched by exact SHA; all five issue files, instructions, audit, key definition, source route and relevant supplier contracts are unchanged from the mathematical base. Main is merged only into this worker’s own branch.

## Reproduce and resume

Save the first Python block as validate.py and the second as graph.py in one small disk-backed scratch directory outside the checkout. From a checkout of this submission, run validate.py, optionally passing the pinned declarations.tsv path as its first argument. Fetch the mathematical base and proof SHA into your own clone if absent. The program reconstructs Native.lean and Admitted.lean from the immutable public archive and current suggested fragment, verifies their exact SHA256 and all twenty headers, preserves the198-node source/base contracts and source routes, and invokes the actual checker, intake scanner and assembler. It writes only its own scratch directory. In an already existing build at the stated pins, run lake env lean on each reconstructed absolute source path, sequentially, with available memory≥20GiB and timeout1200s; no installation or library build. Normalize diagnostics by replacing the absolute source directory with the source basename, removing the timing footer and retaining one final newline. Delete reproduction scratch after use.

Validator SHA256 `90943f01ab3e7b07e7332f422c349134f7a4a2c288716498b72d89dcb476bda3`; graph script SHA256 `6cdd411065546e6b5922eeac161ef6f6da650f86ddc52e03c3338ed734c8538d`. Both scripts include a final newline.

```python
from pathlib import Path
from collections import Counter
import json,re,subprocess,hashlib,sys,runpy
root=Path.cwd();sc=Path(__file__).parent
rid='NeronModelsAndSemistableAbelianVarietiesPartII'
base='aec55383b7e77a42d961484dd0f8431212790883'
archive='f5288262eeafbced0db1da046651a4128ccdd167'
def blob(folder,ext,commit=base):
 name=('DESIGN-' if folder=='handoff' else '')+rid+'.'+ext
 return subprocess.check_output(['git','show',f'{commit}:research/blueprint/{folder}/{name}'],text=True)
def read(folder,ext):
 name=('DESIGN-' if folder=='handoff' else '')+rid+'.'+ext
 return (root/'research/blueprint'/folder/name).read_text()
p=json.loads(read('packets','json'));original=json.loads(blob('packets','json'))
road=json.loads(read('roadmaps','json'));oldroad=json.loads(blob('roadmaps','json'))
v=p['commonIdealLocalizationContinuation'];old={n['id']:n for n in original['nodes']};own={n['id']:n for n in p['nodes']}
assert len(old)==198 and len(own)==208 and len(set(own)-set(old))==10
exceptions={rid+':G.0/localization-complement',rid+':G.1/quadratic-pinch-normalization'}
for nid,n in old.items():
 new=own[nid]
 for k in ['id','kind','statement','hypotheses','acceptance','api','tests','uses','declarationName','implementationStatus','planet','library']:
  assert n.get(k)==new.get(k),(nid,k)
 assert n['prerequisites']==new['prerequisites'][:len(n['prerequisites'])],nid
 if nid not in exceptions:assert n==new,nid
 if not nid.endswith('/localization-complement'):assert n['sources']==new['sources'] and n['proofSteps']==new['proofSteps'],nid
assert sum(n==own[nid] for nid,n in old.items())==196
for k in original:
 if k not in ['summary','nodes','baseline','sources','coverage']:assert original[k]==p[k],k
assert p['baseline']['tauceti']==original['baseline']['tauceti']=='f790474821cf4256814db967cb154e7af3d0c369'
assert p['baseline']['mathlib']==original['baseline']['mathlib']=='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert p['baseline']['declarations'][:160]==original['baseline']['declarations'] and len(p['baseline']['declarations'])==177
for a,b in zip(original['sources'],p['sources']):
 if a['id']!='ferrand':assert a==b
 else:
  assert {k:x for k,x in a.items() if k!='continuationReadings'}=={k:x for k,x in b.items() if k!='continuationReadings'}
  assert b['continuationReadings'][:-1]==a['continuationReadings']
assert len(original['sources'])==len(p['sources'])
assert p['status']=='partial' and Counter(c['status'] for c in p['coverage'])=={'partial':7}
assert all(n['implementationStatus']=='unchecked' for n in own.values())
for a,b in zip(original['coverage'],p['coverage']):
 assert {k:x for k,x in a.items() if k!='remaining'}=={k:x for k,x in b.items() if k!='remaining'}
 assert a['remaining']==b['remaining'][:len(a['remaining'])]
for k in oldroad:
 if k not in ['summary','stages']:assert oldroad[k]==road[k],k
assert road['summary'].startswith(oldroad['summary'])
for a,b in zip(oldroad['stages'],road['stages']):
 assert {k:x for k,x in a.items() if k!='description'}=={k:x for k,x in b.items() if k!='description'}
 assert b['description'].startswith(a['description'])
lean=read('suggested','lean');reader=read('readmes','md');oldlean=blob('suggested','lean')
prefix=oldlean.replace('import Mathlib.RingTheory.Conductor\n','import Mathlib.RingTheory.Conductor\nimport Mathlib.RingTheory.Localization.Away.Basic\n')
fragment=lean.split('/- BEGIN COMMON IDEAL LOCALIZATION -/\n',1)[1].split('/- END COMMON IDEAL LOCALIZATION -/',1)[0]
assert lean==prefix+'\n/- BEGIN COMMON IDEAL LOCALIZATION -/\n'+fragment+'/- END COMMON IDEAL LOCALIZATION -/\n'
assert reader.endswith(blob('readmes','md'))
for nid,n in own.items():
 if nid in old:continue
 assert n['statement'] in reader
 name=n['declarationName'].rsplit('.',1)[-1]
 assert re.search(r'^(?:lemma|def|noncomputable def) '+re.escape(name)+r'\b',lean,re.M),nid
 for t in n.get('tests',[]):assert t['name'] in fragment and t['name'] in reader and t['statement'] in reader,t
 for a in n.get('api',[]):assert a['name'] in reader and a['statement'] in reader,a
assert not re.search(r'^(?:axiom|opaque)\s|:\s*True\b',fragment,re.M)
actual=blob('suggested','lean',archive).split('BEGIN ARCHIVED CHECKED COMMON IDEAL LOCALIZATION\n',1)[1].split('END ARCHIVED CHECKED COMMON IDEAL LOCALIZATION\n',1)[0]
assert hashlib.sha256(actual.encode()).hexdigest()==v['native']['sourceSha256']
assert not re.search(r'\bsorry\b',actual) and len(re.findall(r'^#print axioms ',actual,re.M))==16
a=actual.index('namespace TauCeti.GenusOne.AffinePinching');b=actual.index('\n#print axioms')
newactual='universe v w z\n'+actual[a:b].rstrip()+'\n'
def headers(s):
 result=[]
 for m in re.finditer(r'^(?:lemma|noncomputable def|example)\b',s,re.M):
  tail=s[m.start():];stop=re.search(r'\n(?=\n|end\b)',tail);assert stop
  block=tail[:stop.start()];split=re.search(r' :=(?: by\n| by sorry$| rfl$|\n)',block);assert split
  result.append(block[:split.start()])
 return result
assert headers(newactual)==headers(fragment) and len(headers(fragment))==20
assert len(re.findall(r'^example\b',fragment,re.M))==10 and fragment.count(' := by sorry')==20
admitted=actual[:a].replace('universe u v w z','universe u')+fragment
assert hashlib.sha256(admitted.encode()).hexdigest()==v['admittedExtraction']['sourceSha256']
(sc/'Native.lean').write_text(actual);(sc/'Admitted.lean').write_text(admitted)
(sc/'original-packets.json').write_text(blob('packets','json'));(sc/'original-roadmaps.json').write_text(blob('roadmaps','json'))
assert read('handoff','md').endswith(blob('handoff','md'))
assert not v['wholeSuggestedCompiled'] and v['native']['errors']==v['native']['warnings']==0
assert v['admittedExtraction']['errors']==0 and v['admittedExtraction']['warnings']==20
assert v['native']['lines']==343 and v['admittedExtraction']['lines']==235
scope=subprocess.check_output(['git','diff','--name-only',v.get('publicationPreflight',{}).get('base',base),'--'],text=True).splitlines()
allowed={f'research/blueprint/{d}/'+('DESIGN-' if d=='handoff' else '')+rid+'.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]}
assert set(scope)==allowed,scope
subprocess.run(['git','diff','--check'],check=True)
index=Path(sys.argv[1]) if len(sys.argv)>1 else None
cmd=[sys.executable,'scripts/check_blueprint.py','research/blueprint/packets/'+rid+'.json','--json']
if index:cmd+=['--index',str(index)]
checked=subprocess.run(cmd,text=True,capture_output=True,check=True);check=json.loads(checked.stdout)
assert not check[0]['errors'] and not check[0]['warnings']
intake=subprocess.run([sys.executable,'research/blueprint/intake.py','check-files',*sorted(allowed)],text=True,capture_output=True,check=True)
print(intake.stdout.strip());print(json.dumps(check[0]['summary'],indent=2))
runpy.run_path(str(sc/'graph.py'),run_name='__main__')
print('Preservation, exact public reconstruction, header parity, scope, indexed packet, intake and actual assembler checks passed.')
```

```python
import sys,json,hashlib
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sc=Path(__file__).parent;sys.path.insert(0,str(root/'scripts'));from build import assemble
stem='NeronModelsAndSemistableAbelianVarietiesPartII';rid=stem;packet=json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text());original=json.loads((sc/'original-packets.json').read_text())
def overlay(name,p):
 d=sc/name;d.mkdir(exist_ok=True)
 for f in (root/'data/blueprints').iterdir():
  if f.name in [stem+'.json','roadmaps']:continue
  t=d/f.name
  if not t.exists():t.symlink_to(f,target_is_directory=f.is_dir())
 rd=d/'roadmaps';rd.mkdir(exist_ok=True)
 for f in (root/'data/blueprints/roadmaps').glob('*.json'):
  if f.name==stem+'.json':continue
  target=rd/f.name
  if not target.exists():target.symlink_to(f)
 (rd/(stem+'.json')).write_text((root/'research/blueprint/roadmaps'/f'{stem}.json').read_text())
 (d/(stem+'.json')).write_text(json.dumps(p))
 return d
a,ctx=assemble(require_distances=False,blueprints=overlay('overlay',packet));control,cctx=assemble(require_distances=False,blueprints=overlay('control',original))
def stats(vertices,edges):
 vs=set(vertices);out=defaultdict(set);ins=defaultdict(int)
 for s,t in edges:
  vs.update([s,t]);out[s].add(t)
 for s in out:
  for t in out[s]:ins[t]+=1
 q=deque(sorted(v for v in vs if ins[v]==0));n=0
 while q:
  s=q.popleft();n+=1
  for t in out[s]:
   ins[t]-=1
   if ins[t]==0:q.append(t)
 return {'vertices':len(vs),'edges':sum(map(len,out.values())),'acyclic':n==len(vs)},out
stages={s['id'] for s in a['stages']};se={(e['source'],e['target']) for e in a['stageEdges']};ce={(e['source'],e['target']) for e in control['stageEdges']}
# Exact virtual upstream stage references are graph vertices, never library leaves.
st,following=stats(stages,se)
own={n['id']:n for n in packet['nodes']};oe={(x,n['id']) for n in own.values() for x in n['prerequisites'] if x in own};og,_=stats(own,oe)
universe={}
for folder in ['data/decompositions','research/blueprint/packets','data/blueprints']:
 for f in sorted((root/folder).glob('*.json')):
  p=json.loads(f.read_text())
  for n in p.get('nodes',[]):universe[n['id']]=n
universe.update(own);reachable={};unresolved=set();baselines=set();dep=set();todo=list(own)
while todo:
 nid=todo.pop()
 if nid in reachable:continue
 n=universe[nid];reachable[nid]=n
 for ref in n.get('prerequisites',[]):
  if ref in universe:
   dep.add((ref,nid));todo.append(ref)
  elif ref in stages or ref.startswith('tauceti:TauCetiRoadmap/'):
   stages.add(ref);dep.add((ref,nid))
  elif ref.startswith(('mathlib:','tauceti:')):baselines.add(ref)
  else:unresolved.add(ref)
combined,_=stats(stages|set(reachable),se|dep)
# Required stage paths come from the original touching links and binding RS-08.
# Planet declaration ids are not their parent stage ids.
scope=set(packet['scope']);pairs={(x,y) for x,y in ce if x in scope or y in scope}
for path in ['data/atlas.json']:
 record=json.loads((root/path).read_text())
 for edge in record.get('stageEdges',record.get('links',[])):
  if edge['source'] in scope or edge['target'] in scope:
   pairs.add((edge['source'],edge['target']))
def reaches(s,t):
 seen=set();todo=[s]
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo.extend(following.get(x,()))
 return False
missing=[list(x) for x in sorted(pairs) if not reaches(*x)]
roadmaps={r['id']:r for r in a['roadmaps']};cr={r['id']:r for r in control['roadmaps']}
skips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in a['roadmaps'] if r['id']!=rid}
cskips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in control['roadmaps'] if r['id']!=rid}
unchanged=sum(own[n['id']]==n for n in original['nodes']);assert unchanged==196
rec={'actualAssembler':True,'stageDAG':st,'ownDeclarationDAG':og,'stagesAndReachableDeclarations':combined,'reachableDeclarations':len(reachable),'externalDeclarations':sorted(set(reachable)-set(own)),'reachableBaselineReferences':len(baselines),'unresolved':sorted(unresolved),'ownSkippedLinks':roadmaps[rid]['blueprint']['skippedLinks'],'otherSkipsMatchOriginal':skips==cskips,'stageEdgesUnchanged':se==ce,'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'inheritedMissingStagePairs':missing,'unchangedNodeObjects':unchanged,'partDeclarations':len(own),'partPlanets':sum('planet' in n for n in own.values()),'roadmapDeclarations':roadmaps[rid]['blueprint']['declarations'],'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
assert st['acyclic'] and og['acyclic'] and combined['acyclic'];assert not unresolved;assert se==ce and skips==cskips
(sc/'graph-receipt.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec,indent=2))
```

Continue with finite generation of k[X] over A_q by1,X, the actual fraction-field and normalization comparison, and the two projective normalization charts. Then identify the conductor ideal sheaf, form the actual E/k quotient structure-sheaf sequence with its module actions, and derive H⁰/H¹ through finite pushforward. For the inherited general Ferrand leaf, convert the specified ring map into the actual basic-open complement isomorphism via supplier section comparisons. Keep nilpotent/zero localization, characteristic2/3, cusp versus node, component permutation and the separate I₂ construction. The remaining G.0–G.6 and source/completeness obligations are all required.

## Preserved incoming handoff

# Quadratic finite-extension parity — #3378

Codex — codex-J6LwjP; 2 October2026. Claim5961771184, bot5961772756. Read base `4a1f4b6f4dc475b67e029001f90053ff85163a04`.

This is a partial design checkpoint. Five specialized G.1 lemma nodes and seven typed examples advance the predecessor’s finite-extension frontier. For an irreducible quadratic over k, the receiving root exists exactly when2 divides the native relative finrank. With explicit nonzero quadratic discriminant, the distinct-root count is2 or0, native one-component pointCount is card(L) or card(L)+2, its power form is card(k)^n or card(k)^n+2, and the existing integer count defect is1 or−1. These are equation-level inputs for the still-open geometric consumer. Generic finite-field embedding/extension/cardinality theory is imported from the pinned libraries, never planned again.

The packet has198 nodes:13 definitions,144 lemmas,26 theorems,5 comparisons,10 constructions;89 API items;102 raw tests (86 definition/construction tests,16 additional lemma tests);29 planets;160 baseline declarations;17 gaps;23 requests;78 route records;21 source findings;7 partial stages and0 closed. All193 inherited statements, hypotheses, sources, acceptance, API, tests, uses and implementation statuses are preserved.192 whole node objects are identical; only quadratic-extension-counts gains four proved inputs and an updated final proof step. All prior metadata and the complete roadmap bytes are retained. The reserved Ferrand geometric-square predicate and its scheme versus algebraic-space existence hypotheses remain intact for both Witaszek and Schröer consumers.

## Actual proof and exact validation scope

The [immutable checked proof snapshot](https://github.com/CBirkbeck/tauceti-explorer/blob/31e1edfddca815057809280d4b01ae904eda2910/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) stores the545-line actual source between BEGIN/END ARCHIVED CHECKED QUADRATIC EXTENSION PARITY markers. Its initial370 lines are byte-identical to the [predecessor snapshot](https://github.com/CBirkbeck/tauceti-explorer/blob/e4ff005892a37a27cbabd336972a18d90bc4ad5d/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean), SHA2561970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8. The20 named audits (15 inherited,5 new) report only propext,Classical.choice,Quot.sound, with no admitted axiom. All19 examples pass (12 inherited,7 new). Actual source has0 errors,0 warnings and no admissions.

Actual source SHA256 `99bf40cb0c2dd38f00d6b2466a887b5e21ba49f4cf50530726f97fb869a7e6ec`; normalized diagnostics SHA256 `73e94bb8339daed612cf13999e0b1cee66e31ff22553c9ce8b8e5bcbe48cafcd`; elapsed3.40s, maximumRSS6795264KiB, available56GiB before invocation. Exact admitted extraction:262 lines,19 examples,0 errors,39 admission warnings and0 other warnings; elapsed2.50s, maximumRSS6734812KiB, available57GiB. Source SHA256 `5bdac8ea7dc35f5e0bdd5e116c0e9865156c81140017b3eb5a3de0d3e3c88023`; normalized diagnostics SHA256 `3d5b2c1eb789fa7d81a46e8a30fda7a543eba95755362b4b98c6a9ec8078d2f4`. The five new lemma headers and seven example statements compare mechanically equal between actual and admitted fragments. All new submitted outer bodies are admitted under PROTOCOL§13.

**The full TauCeti-importing suggested file was not compiled.** The existing pinned build lacks PointCount and other required compiled TauCeti artifacts. The receipt covers precisely the native/admitted fragments with the exact pinned public PointCount namespace fixture, not a pruned whole-file compilation. Credit: The Tau Ceti contributors, Copyright2026, Apache2.0, [PointCount at the exact pin](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean). The fixture is only in the actual check archive; the submitted head imports it without duplicated library definitions. Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, TauCeti f790474821cf4256814db967cb154e7af3d0c369, Lean4.34.0-rc2. No setup/update/cache/library build, language server or concurrent Lean invocation; each run checked memory and used the20-minute timeout.

## Tests, library and source evidence

The new examples use the actual existing FiniteField.Extension fields with the explicit native extension Algebra instance. ZMod’s general algebra instance is otherwise preferred, so that choice is required to rewrite the native finrank theorem without treating an isomorphic field as definitionally identical. The base irreducibility tests use the existing degree-one-through-three root criterion with exhaustive ZMod2/ZMod3 evaluation. They assert binary counts4,4,10 in degrees1,2,3; no root in degree3; two distinct roots in degree2; count9 over the ternary degree2 extension; and binary degree2 numerical defect1. No assumed root/parity/count witness or external computation oracle enters these proofs.

Ten new baseline citations: FiniteField.nonempty_algHom_iff_finrank_dvd; AdjoinRoot.instField,liftAlgHom,aeval_algHom_eq_zero; finrank_quotient_span_eq_natDegree; Polynomial.natDegree_quadratic; Module.natCard_eq_pow_finrank; FiniteField.Extension,finrank_extension; Polynomial.irreducible_of_degree_le_three_of_not_isRoot. Actual statements/constructions and ambient hypotheses were read at the pin before citation. Native PointCount was fully read again. Five exact helper-name searches through both pinned source trees had no matches; this does not claim exhaustive mathematical absence. Parent reviewed AUDIT-10 R11.1–R11.6 rows were read; no own PartII reviewed row was found. Full current issue,193 mathematical statements/hypotheses,495-line predecessor handoff,seven stage descriptions,reserved Ferrand node,full key-definition entry and78-item owner brief were read. Complete routed items15–18,170–171 were read; other historical source/extraction receipts retain their attribution. The required nearby upstream documents were fully read earlier in this continuous loop.

Fresh source: [Schröer arXiv2004.07025v3](https://arxiv.org/html/2004.07025v3), §3 conductor diagrams and complete Proposition3.1–3.2 proofs/table. HTML SHA256 d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456, acquired2 October2026. The native every-extension lemmas are authored deductions, not printed theorems attributed to the paper. No fresh full-paper/Annals erratum collation or predecessor Python regression rerun is claimed. All21 inherited source findings, their corrections and verification states are preserved.

## Atlas and preservation checks

Indexed checker:0 errors,0 warnings. Actual intake passes; whitespace check passes. Read-only scripts/build.py assembly injects the own packet and new roadmap definition into both candidate and original-packet control, preserving other promoted work. Stage graph2992 vertices/8727 edges; own declaration graph198/477; stage-plus-reachable-declaration graph3212/9589;604 recursively reachable dependency vertices,198 reachable declaration nodes. All three graphs are acyclic and all69 required stage pairs remain reachable. Stage edges and unrelated skipped-link sets compare equal; no own pending or skipped links and no new unresolved references. Parent-stage context edges in the combined graph are diagnostic context, not mathematical proof dependencies. Actual tauceti:TauCetiRoadmap references remain stage vertices, not library declaration leaves.

The broader inherited supplier closure still reaches28 UPSTREAM placeholders. They compare equal with the original-packet control and remain open supplier obligations; they are not certified library facts. The complete list is recorded in quadraticExtensionParityContinuation.checks. Thus this checkpoint does not claim complete recursive proof closure of the roadmap. New specialized lemma prerequisites terminate in verified native baseline declarations and prior own nodes. No atlas data is written.

Graph/reconstruction script SHA256 `c0ec77914f93a3b23f74311d31224c1b3c1daf11f5fd2029652dfb067736291b`. Save the exact Python below in own disk-backed scratch and run from a checkout of this submitted commit. It reconstructs the545-line actual source,262-line admitted fragment and original packet/roadmap, verifies source/header parity and preservation, then calls the actual assembler with control and reports graphs. It writes only a small own scratch directory. Using an already-existing build at the specified pins, run one Lean invocation at a time for ExtensionParity.lean and Admitted.lean (memory at least20GiB; timeout1200s; no setup or library build). Normalize diagnostics by replacing the absolute source directory with the basename and removing the timing footer, preserving a final newline; compare the hashes above. Delete scratch after checks.

```python
from pathlib import Path
from collections import Counter,defaultdict
import sys,json,re,hashlib,subprocess
root=Path.cwd();sc=root.parent/'scratch-neron-extension-reproduce';sc.mkdir(exist_ok=True)
rid='NeronModelsAndSemistableAbelianVarietiesPartII';base='4a1f4b6f4dc475b67e029001f90053ff85163a04';archive='31e1edfddca815057809280d4b01ae904eda2910'
def blob(folder,ext,commit=base):
 name=('DESIGN-' if folder=='handoff' else '')+rid+'.'+ext
 return subprocess.check_output(['git','show',f'{commit}:research/blueprint/{folder}/{name}']).decode()
p=json.loads((root/'research/blueprint/packets'/f'{rid}.json').read_text());orig=json.loads(blob('packets','json'));road=json.loads((root/'research/blueprint/roadmaps'/f'{rid}.json').read_text());origroad=json.loads(blob('roadmaps','json'))
lean=(root/'research/blueprint/suggested'/f'{rid}.lean').read_text();reader=(root/'research/blueprint/readmes'/f'{rid}.md').read_text()
old={n['id']:n for n in orig['nodes']};new={n['id']:n for n in p['nodes']}
for nid,n in old.items():
 for k in ['id','kind','statement','hypotheses','acceptance','sources','implementationStatus','uses','api','tests']:assert n.get(k)==new[nid].get(k),(nid,k)
 assert n.get('prerequisites',[])==new[nid].get('prerequisites',[])[:len(n.get('prerequisites',[]))],nid
unchanged=sum(n==new[nid] for nid,n in old.items());assert unchanged==192
for k in orig:
 if k in ['summary','nodes','baseline','sources','coverage']:continue
 assert orig[k]==p[k],k
assert p['baseline']['declarations'][:150]==orig['baseline']['declarations']
assert p['sources'][:len(orig['sources'])]==orig['sources']
for a,b in zip(orig['coverage'],p['coverage']):
 assert {k:v for k,v in a.items() if k!='remaining'}=={k:v for k,v in b.items() if k!='remaining'}
 assert a['remaining']==b['remaining'][:len(a['remaining'])]
assert road==origroad and (root/'research/blueprint/roadmaps'/f'{rid}.json').read_text()==blob('roadmaps','json')
assert p['status']=='partial' and all(n['implementationStatus']=='unchecked' for n in new.values())
assert Counter(c['status'] for c in p['coverage'])=={'partial':7}
for nid,n in new.items():
 if nid in old:continue
 assert n['statement'] in reader
 assert re.search(r'^lemma '+re.escape(n['declarationName'].rsplit('.',1)[1])+r'\b',lean,re.M),nid
 for t in n.get('tests',[]):assert t['name'] in lean and t['name'] in reader and t['statement'] in reader
originalLean=blob('suggested','lean');imports='import Mathlib.FieldTheory.Finite.GaloisField\nimport Mathlib.FieldTheory.Finite.Extension\nimport Mathlib.FieldTheory.Finiteness\nimport Mathlib.Algebra.Polynomial.Degree.SmallDegree\nimport Mathlib.Algebra.Polynomial.SpecificDegree\n'
assert lean.startswith(originalLean.replace('import Mathlib.Algebra.Category.Ring.Constructions\n',imports+'import Mathlib.Algebra.Category.Ring.Constructions\n'))
a=blob('suggested','lean',archive).split('BEGIN ARCHIVED CHECKED QUADRATIC EXTENSION PARITY\n',1)[1].split('END ARCHIVED CHECKED QUADRATIC EXTENSION PARITY\n',1)[0]
assert hashlib.sha256(a.encode()).hexdigest()==p['quadraticExtensionParityContinuation']['native']['sourceSha256']
assert hashlib.sha256(''.join(a.splitlines(keepends=True)[:370]).encode()).hexdigest()=='1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8'
fixture=a[a.index('\nnamespace TauCeti'):a.index('\nnamespace TauCeti.GenusOne')]
def fragment(marker):return lean.split('/- BEGIN '+marker+' -/\n',1)[1].split('/- END '+marker+' -/',1)[0]
sketch='import Mathlib\n'+fixture+'\n'+fragment('QUADRATIC POINT PARAMETRIZATION')+'\n'+fragment('QUADRATIC ROOT BRANCH COUNTS')+'\n'+fragment('QUADRATIC EXTENSION PARITY')+'\n'
assert hashlib.sha256(sketch.encode()).hexdigest()==p['quadraticExtensionParityContinuation']['admittedExtraction']['sourceSha256']
headers=lambda s:re.findall(r'^(?:lemma |example ).*? := by',s,re.M|re.S)
actualnew=''.join(a.splitlines(keepends=True)[370:]);actualnew=re.sub(r'^#print axioms .*\n','',actualnew,flags=re.M)
assert headers(actualnew)==headers(fragment('QUADRATIC EXTENSION PARITY')) and len(headers(actualnew))==12
assert not re.search(r'\bsorry\b',a)
assert not re.search(r'^(?:axiom|opaque)\s|:\s*True\b',fragment('QUADRATIC EXTENSION PARITY'),re.M)
(sc/'ExtensionParity.lean').write_text(a);(sc/'Admitted.lean').write_text(sketch)
for ext,name in [('json','packets'),('json','roadmaps')]:(sc/f'original-{name}.{ext}').write_text(blob(name,ext))
sys.path.insert(0,str(root/'scripts'));import build
normal=build.load_promoted
def assemble(packet,definition):
 def candidate(*args,**kw):
  packets,docs,defs=normal(*args,**kw)
  return ([(name,q) for name,q in packets if q.get('roadmapId')!=rid]+[(rid,packet)],{**docs,rid:'research/blueprint/readmes/'+rid+'.md'},[x for x in defs if x.get('id')!=rid]+[definition])
 build.load_promoted=candidate
 return build.assemble(require_distances=False)
baseline,_=assemble(orig,origroad);atlas,_=assemble(p,road)
def acyclic(g,roots):
 colors={}
 def visit(v):
  assert colors.get(v)!=1,('cycle',v)
  if colors.get(v)==2:return
  colors[v]=1
  for w in g[v]:visit(w)
  colors[v]=2
 for v in list(roots):visit(v)
 return set(colors)
g=defaultdict(set)
for e in atlas['stageEdges']:g[e['source']].add(e['target'])
vertices={s['id'] for s in atlas['stages']};acyclic(g,vertices)
row=next(r for r in atlas['roadmaps'] if r['id']==rid)
assert row['blueprint']['declarations']==198 and row['blueprint']['planets']==29
assert not row.get('pendingLinks') and not row['blueprint'].get('skippedLinks')
assert {(e['source'],e['target']) for e in atlas['stageEdges']}=={(e['source'],e['target']) for e in baseline['stageEdges']}
before={r['id']:r for r in baseline['roadmaps']}
for r in atlas['roadmaps']:
 if r['id']!=rid:assert r.get('blueprint',{}).get('skippedLinks',[])==before[r['id']].get('blueprint',{}).get('skippedLinks',[]),r['id']
req=defaultdict(set)
for e in atlas['stageEdges']:req[e['target']].add(e['source'])
allnodes={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in (root/folder).glob('*.json'):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):
   allnodes.setdefault(n['id'],n);req[n['id']].update(n.get('prerequisites',[])+n.get('upstreamPrerequisites',[]))
  for request in q.get('requests',[]):
   for target in request.get('neededBy',[]):req[target].add(request['supplier'])
allnodes.update(new)
for n in new.values():req[n['id']]=set(n.get('prerequisites',[])+n.get('upstreamPrerequisites',[]))
for q in p['requests']:
 for v in q['neededBy']:req[v].add(q['supplier'])
reachable=acyclic(req,list(new))
def unresolved(vs):
 return sorted(v for v in vs if not v.startswith(('mathlib:','tauceti:')) and v not in vertices and v not in allnodes)
# Existing supplier placeholders remain open; compare them with the original-packet control.
controlreq=defaultdict(set,{k:set(v) for k,v in req.items()})
for n in old.values():controlreq[n['id']]=set(n.get('prerequisites',[])+n.get('upstreamPrerequisites',[]))
for q in orig['requests']:
 for v in q['neededBy']:controlreq[v].add(q['supplier'])
controlReachable=acyclic(controlreq,list(old))
assert unresolved(reachable)==unresolved(controlReachable),('new unresolved references',unresolved(reachable),unresolved(controlReachable))
assert all(v.startswith('UPSTREAM:') for v in unresolved(reachable))
assert all(d.startswith(('mathlib:','tauceti:')) or d in vertices or d in new for n in new.values() if n['id'] not in old for d in n['prerequisites'])
# tauceti:TauCetiRoadmap/... are stages, never declaration leaves.
assert all(v in vertices for v in reachable if v.startswith('tauceti:TauCetiRoadmap/'))
used=set(new);todo=list(new)
while todo:
 v=todo.pop()
 for d in req[v]:
  if d in allnodes and d not in used:used.add(d);todo.append(d)
def stage_of(v):
 seen=set()
 while v in allnodes and v not in seen:seen.add(v);v=allnodes[v].get('parentStageId')
 return v
pairs={(d,rid+':'+s['key']) for s in road['stages'] for d in s.get('requires',[])}
pairs.update((s,stage_of(n['id'])) for n in new.values() for s in n['prerequisites'] if s in vertices and s not in allnodes and s!=stage_of(n['id']))
pairs.update((q['supplier'],stage_of(v)) for q in p['requests'] for v in q['neededBy'] if q['supplier']!=stage_of(v))
def reaches(source,target):
 seen=set();todo=[source]
 while todo:
  v=todo.pop()
  if v==target:return True
  if v in seen:continue
  seen.add(v);todo.extend(g[v])
 return False
assert all(reaches(s,t) for s,t in pairs),[v for v in pairs if not reaches(*v)]
combined=defaultdict(set)
for e in atlas['stageEdges']:combined[e['target']].add(e['source'])
for v in used:
 n=allnodes[v]
 # Diagnostic parent-stage context edges do not constitute mathematical proof dependencies.
 if n.get('parentStageId'):combined[v].add(n['parentStageId'])
 for d in req[v]:
  if d in vertices or d in used:combined[v].add(d)
combinedVertices=vertices|used|set(combined)|{v for ds in combined.values() for v in ds};acyclic(combined,combinedVertices)
receipt={'base':base,'preservedStatements':193,'unchangedNodes':unchanged,'addedNodes':5,'kinds':Counter(n['kind'] for n in p['nodes']),'api':sum(len(n.get('api',[])) for n in p['nodes']),'tests':sum(len(n.get('tests',[])) for n in p['nodes']),'definitionConstructionTests':sum(len(n.get('tests',[])) for n in p['nodes'] if n['kind'] in ['definition','construction']),'baseline':len(p['baseline']['declarations']),'planets':29,'gaps':len(p['gaps']),'requests':len(p['requests']),'routeRecords':len(p['routeCoverage']),'sourceFindings':len(p['sourceIssues']),'ownDeclarationEdges':sum(sum(v in new for v in n['prerequisites']) for n in new.values()),'stageVertices':len(vertices),'stageEdges':len(atlas['stageEdges']),'reachableDependencyVertices':len(reachable),'reachableDeclarations':len(used),'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs),'combinedVertices':len(combinedVertices),'combinedEdges':sum(map(len,combined.values())),'allDAGs':'acyclic','pendingLinks':[],'ownSkippedLinks':[],'otherSkips':'unchanged','newStageEdges':0,'newUnresolvedReferences':[],'legacySupplierPlaceholders':unresolved(reachable),'legacyPlaceholders':'unchanged from base; open supplier obligations, not library baseline leaves','scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(receipt,ensure_ascii=False));(sc/'receipt.json').write_text(json.dumps(receipt,ensure_ascii=False,indent=2)+'\n')
```

## Resume here

Identify the actual projective I₁ pinch with the checked Weierstrass model via the two-chart P¹ normalization map, infinity-chart localization and explicit unit, finite birational normalization and actual conductor scheme. Relate the field quotient AdjoinRoot(q), roots/Hom(Spec L,Spec E) and the geometric base-change conductor; this transports the proved native parity calculation to the inherited all-extension geometric count. Prove the structure-sheaf sequence with the actual E/k quotient and finite-pushforward H⁰/H¹ comparison. Treat the fixed-component I₂ construction and its count separately, and import the field-valued-point reduction comparison for nonreduced schematic fibers. A native pointCount or numeric trace defect alone does not prove any of these scheme/cohomology statements. All other G.0–G.6 fibration/Picard/Néron/classification/model-completeness/source obligations and the23 supplier requests remain open. Existing remaining lists below record their original checkpoint frontiers; the present native degree criterion supersedes that numerical frontier only.

## Preserved predecessor handoff

# Quadratic root-count branches — #3378

Codex — codex-a71f92; 2 October 2026. Claim5961132544, bot5961134840. Audit base `b315875f27d5859bf9bd7a09c9673b692eaf821c`; publication preflight `4557261650818a24845bd3c8f195e393990ea9c0`.

This partial checkpoint adds four granular G.1 lemmas: distinct-root cardinality, native pointCount, numerical frobeniusTrace, and coefficient-map pointCount. For q(t)=t²+a·t+b with quadratic discriminant D=a²−4b nonzero, the distinct-root cardinality is2 or0 according to existence of a root; the actual Weierstrass tuple (a,−b,0,0,0) has count |k| or |k|+2 and numerical count defect1 or−1. Counts include the singular origin and the point at infinity; they do not use the nonsingular elliptic group. D is the quadratic discriminant, not the Weierstrass discriminant. No division by2 or characteristic restriction is used. Over a field homomorphism to a finite receiving field, injectivity preserves D≠0; no separate source-finiteness assumption is required in the signature, since it follows from that injection.

All189 inherited statements are preserved;188 whole node objects compare equal. Only quadratic-extension-counts gains the actual coefficient-map supplier and a proof step retaining the missing extension-splitting and geometric comparison obligations. All78 route records,21 source findings,23 requests,17 gaps,29 planets, seven stage IDs and historical receipts remain unchanged. The roadmap is semantically unchanged and is not republished. The packet has193 nodes (13 definitions,139 lemmas,26 theorems,5 comparisons,10 constructions),89 API entries,86 definition/construction tests plus9 other lemma tests, and150 baseline references. All implementations stay unchecked, all stages partial, and none is closed.

## Current checks and proof boundary

The exact native extraction is370 lines:12 examples (six inherited, six new),15 named axiom audits,0 errors and0 warnings. All audited declarations depend only on propext, Classical.choice and Quot.sound, never an admitted axiom. The four current declarations are quadraticRootCount_branch, pointCount_branch, frobeniusTrace_branch and pointCount_field_map. Time3.76s; maximumRSS6755548KiB;60GiB available before invocation. Source SHA256 `1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8`; normalized diagnostic SHA256 `894e162f8d9e7266f184f5e61ab273a1809a1f4200207f71c11319045ffabb87`.

The exact admitted extraction is197 lines with12 examples:0 errors,27 admission warnings and0 other warnings. Time3.30s; maximumRSS6719964KiB;60GiB available. Source SHA256 `3f1ec7fd1d036deec355313721950174605e5b67b928679385522d7f01f4e802`; normalized diagnostic SHA256 `8c85121118ce51541cc2c4a134e936a0adb6362d933a1de450b55fc4cad36300`. Its four new signatures and six example statements were mechanically extracted from the passing native fragment without changing binders or types. The nonzero-discriminant guard is tested separately against a repeated-root characteristic3 model; characteristic2 split/nonsplit and odd-characteristic cases are checked.

The entire1828-line Tau Ceti-importing suggested file **was not compiled**: the existing pinned build lacks required PointCount artifacts. Its source SHA256 is `156dc45f10e46d8e1b07f36e7b6529ece81c69dc54ca724e486b783ae7a2042c`. The two fragment receipts use only existing compiled Mathlib and the exact public PointCount namespace fixture, not a pruned claim about the whole file. No setup, update, cache download, library build, LSP or concurrent Lean invocation occurred. Both invocations used the memory minimum and20-minute timeout. Diagnostic normalization replaces the invocation source path with Native.lean or Sketch.lean, omits the RESOURCE footer, and retains the final newline.

The [durable actual proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/e4ff005892a37a27cbabd336972a18d90bc4ad5d/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) contains the submitted source followed by the exact native extraction inside a block comment. Its additional parent retains the predecessor archive fd64cf3c4e41133e0f200698fef47c11247ec9dd; the submitted commit retains this archive as an additional parent. The fixture is credited to The Tau Ceti contributors, Copyright2026, Apache2.0, [PointCount at Tau Ceti f790474821cf4256814db967cb154e7af3d0c369](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean). No library definition is duplicated at submitted head. Mathlib pin082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 are unchanged.

Indexed checker and actual intake return0 errors/0 warnings. The actual read-only assembler passes:2992 stage vertices/8727 edges,193 own declarations/467 prerequisite edges, and3207 combined stage/declaration/request vertices/9575 edges. All DAGs are acyclic; all69 computed required stage pairs are reachable. There are592 dependency vertices and193 recursively reached declarations, no own pending/skipped links, no new stage edges, and unrelated skips are unchanged. This69-pair algorithm is not identified with the predecessor's68 touching-edge algorithm. Private-path, whitespace, statement/API/test parity and historical preservation checks also pass.

## Evidence read in this continuation

The issue was read before and after the bot confirmed this claim; WORKERS was reread. Full binding protocols/guide and the two nearby StableReduction/JacobianChallenge roadmaps were read earlier in this continuous loop and governing instructions are unchanged. All189 inherited mathematical statements, the latest handoff, seven stage descriptions and the full reserved Ferrand key were read freshly. All parent AUDIT10 R11.1–R11.6 target/evidence/duplicate records were read; no own PartII audit row was found. The full78-item owner-route brief and relevant items15–18,170–171,189–190,195 were read, not every routed catalogue/source text.

The complete pinned PointCount file and all six new indexed Mathlib statements with their ambient hypotheses were read: discrim, vieta_formula_quadratic, discrim_eq_sq_of_quadratic_eq_zero, Fintype.card_of_subtype, Finset.card_pair_eq_two_iff, RingHom.injective. The exact Mathlib HEAD and unchanged relevant source files were verified. Bounded library searches do not assert whole-library absence.

Schröer's [arXiv2004.07025v3 parsed HTML](https://arxiv.org/html/2004.07025v3), §3 conductor discussion and complete Proposition3.1–3.2 proofs/table were read freshly. These native branches are an authored algebraic deduction, not a printed theorem attribution. There was no full-paper reread, acquisition fingerprint or erratum collation. Inherited Python regression programs and older mathematical proof strands retain original attribution; no fresh Python regression rerun or wholesale recertification is claimed.

## Exact recovery and read-only validation

The following script reads the publicly reachable archive and reconstructs the exact checked strings without writing files. Its three hash assertions were executed successfully against git show of the fetched immutable archive. Preserve every terminal newline. Use an already existing build at the pins to check these two exact strings one at a time after checking available memory≥20GiB; use a1200-second timeout. Do not set up or build a project.

```python
import hashlib, os, subprocess
from pathlib import Path
repo = Path(os.environ["TAUCETI_REPO"])
archive = "e4ff005892a37a27cbabd336972a18d90bc4ad5d"
path = "research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean"
archived = subprocess.check_output(["git", "show", archive + ":" + path], cwd=repo).decode()
head = archived.split("\n/-\nChecked fixture credit:", 1)[0]
native = archived.split("BEGIN ARCHIVED CHECKED QUADRATIC ROOT BRANCHES\n", 1)[1].split("END ARCHIVED CHECKED QUADRATIC ROOT BRANCHES\n", 1)[0]
section = native[len("import Mathlib\n"):native.index("end TauCeti\n") + len("end TauCeti\n")]
def fragment(text, name):
    return text.split("/- BEGIN " + name + " -/\n", 1)[1].split("/- END " + name + " -/", 1)[0]
sketch = "import Mathlib\n" + section + "\n" + fragment(head, "QUADRATIC POINT PARAMETRIZATION") + "\n" + fragment(head, "QUADRATIC ROOT BRANCH COUNTS") + "\n\n"
expected = {
    "Native.lean": (native, "1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8"),
    "Sketch.lean": (sketch, "3f1ec7fd1d036deec355313721950174605e5b67b928679385522d7f01f4e802"),
    "submitted.lean": (head, "156dc45f10e46d8e1b07f36e7b6529ece81c69dc54ca724e486b783ae7a2042c"),
}
for name, (source, digest) in expected.items():
    assert hashlib.sha256(source.encode()).hexdigest() == digest, name
    print(name, digest)
# native and sketch are exact source strings; this script writes nothing.

```

For the packet/intake/atlas check, place the submitted deliverables in your own disk-backed scratch as packet.json, reader.md, NeronModelsAndSemistableAbelianVarietiesPartII.lean and handoff.md, together with the unchanged base roadmap as roadmap.json and the recovered Native.lean/Sketch.lean and their logs as native.log/sketch.log. Save the following two exact scripts in that scratch. Set TAUCETI_REPO to the read-only existing clone, TAUCETI_BASELINE to the pinned declarations.tsv, N3_VALIDATE_BASE to the publication preflight above, and PYTHONDONTWRITEBYTECODE=1; run python3 verify.py. Both audit and publication bases were checked. No repository snapshot, checkout, write or atlas output is produced. The loader injects the own proposed definition and packet before decomposition trimming while retaining all unrelated promoted inputs.

immutable_view.py SHA256 `5328b369712c016d447cb3b4699a5f6a50f276c36bdeead72adbf78221e913bf`:

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
BASE = os.environ.get('N3_VALIDATE_BASE', 'b315875f27d5859bf9bd7a09c9673b692eaf821c')
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

verify.py SHA256 `68fa3da2201be9cbe5cfc519e791e08ced8f1a8ca56f56b446381329a9d96f92`:

```python
"""Validate the candidate using actual immutable-tree checker, intake and atlas code."""
import ast,hashlib,json,re
from collections import Counter,defaultdict
from pathlib import Path
import immutable_view as git_view
HERE=Path(__file__).resolve().parent
STEM="NeronModelsAndSemistableAbelianVarietiesPartII";RID="NeronModelsAndSemistableAbelianVarietiesPartII"
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
assert len(old)==189 and len(new)==193 and set(old)<=set(new)
for nid,n in old.items():
    for key in ("id","kind","statement","hypotheses","acceptance","sources","implementationStatus","uses"):
        assert n.get(key)==new[nid].get(key),(nid,key)
    assert new[nid].get("api",[])[:len(n.get("api",[]))]==n.get("api",[]),nid
    assert new[nid].get("tests",[])[:len(n.get("tests",[]))]==n.get("tests",[]),nid
unchanged=sum(n==new[nid] for nid,n in old.items())
assert unchanged==188,unchanged
for k in ["requests","gaps","sourceIssues","routeCoverage","scope","finiteF2Certificate","libraryAuditContinuation","continuationVerification","commonIdealVerification","globalConductorContinuation","quadraticPinchingContinuation","affineProofContinuation","quadraticNormalFormContinuation","quadraticBasisContinuation","quadraticPresentationContinuation","quadraticPointParametrizationContinuation"]:
    assert orig[k]==p[k],k
assert p["baseline"]["declarations"][:144]==orig["baseline"]["declarations"]
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
    for a in n.get("api",[]):assert a["name"].rsplit(".",1)[-1] in lean,a["name"]
    for t in n.get("tests",[]):assert t["name"] in lean,t["name"]
assert not re.search(r"\bsorry\b",(HERE/"packet.json").read_text()+reader)
assert not re.search(r"^(?:axiom|opaque)\s|:\s*True\b",lean[lean.index("/- BEGIN QUADRATIC ROOT BRANCH COUNTS -/"):],re.M)
assert Counter(c["status"] for c in p["coverage"])=={"partial":7}
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
assert log.count("depends on axioms:")==15 and "sorryAx" not in log and "error:" not in log and "warning:" not in log
assert not re.search(r"\bsorry\b",native)
slog=(HERE/"sketch.log").read_text()
assert "error:" not in slog and slog.count("warning:")==slog.count("warning: declaration uses")==27
assert len(re.findall(r"^example\b",native,re.M))==12 and len(re.findall(r"^example\b",sketch,re.M))==12
assert hashlib.sha256(native.encode()).hexdigest()=="1970269a7c653d423ace5bd6fe2192c06672031cffcbd88e9dd1d78eb8b8c6b8"
assert hashlib.sha256(sketch.encode()).hexdigest()=="3f1ec7fd1d036deec355313721950174605e5b67b928679385522d7f01f4e802"
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
assert row["blueprint"]["declarations"]==193 and row["blueprint"]["planets"]==29,row["blueprint"]
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
"preservedStatements":189,"unchangedNodes":unchanged,"addedNodes":4,
"kinds":Counter(n["kind"] for n in p["nodes"]),"api":sum(len(n.get("api",[])) for n in p["nodes"]),
"tests":sum(len(n.get("tests",[])) for n in p["nodes"]),"baseline":len(p["baseline"]["declarations"]),"planets":29,
"gaps":len(p["gaps"]),"requests":len(p["requests"]),"ownDeclarationEdges":ownEdges,
"stageVertices":len(vertices),"stageEdges":len(atlas["stageEdges"]),
"reachableDependencyVertices":len(reachable),"reachableDeclarations":len(used),
"requiredStagePairs":len(stagePairs),"requiredStagePairsReachable":len(stagePairs),
"combinedVertices":len(combinedVertices),"combinedEdges":sum(map(len,combined.values())),
"allDAGs":"acyclic","pendingLinks":[],"ownSkippedLinks":[],"otherSkips":"unchanged","newStageEdges":0,
"scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(receipt,ensure_ascii=False),flush=True)

```

## Resume here

First prove the separate every-extension splitting/embedding criterion (including odd/even and characteristic2 cases), then consume quadratic-extension-counts only with the actual projective-pinch comparison. Continue the actual two-chart P¹ normalization map, infinity-chart localization with its explicit unit, finite birational normalization, conductor ideal sheaf, structure-sheaf sequence with the actual E/k quotient and its module actions, and finite-pushforward H⁰/H¹ comparison. Keep the two-component I₂ construction separate. No étale-cohomological trace, normalized scheme count, geometric genus-one classification or I₂ conclusion follows just from the numerical count defect. All G.0–G.6 fibration/Picard/Néron/classification obligations, suppliers, full paper extraction and reserved Ferrand ownership remain open.

## Preserved predecessor handoff — codex-J6LwjP

# Native quadratic point parametrization — #3378

Codex — codex-J6LwjP; 2 October 2026. Claim5960692130, bot5960694672. Read base `058d2a2bb164ceb15fe5163ab607fcc70bdc2ec2`.

This is a partial design checkpoint. Seven native G.1 nodes, four API entries and six typed examples integrate the first proof target in the predecessor handoff. The actual affine equation-solution subtype is equivalent to Option of the nonroot parameter subtype. Consequently native pointCount plus distinct-root count is field size plus two, and native frobeniusTrace is distinct-root count minus one. The construction works over every field; the counts explicitly assume finiteness. No separability, perfectness, characteristic or ellipticity hypothesis is introduced. The sign of the native coefficient a₂ is −b.

All182 inherited node objects, the reserved Ferrand-pushout key,78 route records,21 source findings,23 requests,29 planets,7 stage IDs and every roadmap byte are retained. The packet now has189 nodes,89 API entries,86 tests,144 baseline declarations,17 gaps and0 closed stages. Every implementation status remains unchecked; the source coverage remains partial. The reader supplies each new proof and its boundary cases. Every new outer suggested body is admitted under PROTOCOL§13.

The predecessor's complete projective/chart/conductor/sheaf/cohomology mathematical strand and its exact regression program remain publicly preserved at the [read base handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/058d2a2bb164ceb15fe5163ab607fcc70bdc2ec2/research/blueprint/handoff/DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII.md). Its historical affine proof archives and supplier findings retain their attribution. This continuation does not erase or certify that whole strand.

## Actual native proof and validation boundaries

The separate [actual-body archive](https://github.com/CBirkbeck/tauceti-explorer/blob/fd64cf3c4e41133e0f200698fef47c11247ec9dd/research/blueprint/suggested/NeronModelsAndSemistableAbelianVarietiesPartII.lean) contains the new fragment between BEGIN/END QUADRATIC POINT PARAMETRIZATION markers. Only that fragment plus the exact public native PointCount section is extracted for this receipt. The public section is credited to The Tau Ceti contributors, Copyright2026, Apache2.0, from [the exact Tau Ceti pin](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean). It is a check fixture, never a replacement library definition in the submitted suggested file. Mathlib pin is082e2d37e8b0463410cdb532e111cd43d5a66174; Lean is4.34.0-rc2.

The actual extraction checked with0 errors,0 admission warnings,0 other warnings, six examples and eleven named declarations. All eleven axiom audits list only propext,Classical.choice,Quot.sound; none lists an admitted axiom. Time2.60s, maximumRSS6763548KiB, available memory62GiB before invocation. Source SHA256 `c76ff685ef6ce890bc33edacc714a6ba8130bdee89e4a99929c782955d04e48b`; normalized log SHA256 `e4556fb263e9c62ee90da544d373fe768d6c7108cc3b0c691ecd8fc407faefc4`.

The submitted admitted extraction checked with0 errors,17 admission warnings and0 other warnings, time2.40s, maximumRSS6738300KiB, available61GiB. Source SHA256 `119fe4571604dfb379f752f593c2b255be7a92a96f01a2b69492a5027624632d`; normalized log SHA256 `bccd547b2714c1b7d84f7e78738d5856bc1cc45b36d197b7b0264fca867e229c`. These hashes are for the exact reconstructed extraction, not the full suggested file.

**The full Tau Ceti-importing suggested file was not compiled.** The existing pinned build lacks PointCount and other required Tau Ceti compiled artifacts. The check uses its already compiled Mathlib together with the exact pinned public native section. No Lake setup/update/cache download, library build, language server or concurrent Lean invocation was used. Both invocations obeyed the memory minimum and20-minute timeout. No inherited planned algebra/scheme/cohomology declaration is an input to the new actual proof.

Fresh pinned statements read: WeierstrassCurve.Affine.equation_iff; the complete PointCount file, including pointCount_def,frobeniusTrace and frobeniusTrace_def; Nat.card_congr,Nat.card_eq_fintype_card; Fintype.card_option,card_subtype_compl,card_subtype_le. Their real statements supply the carrier, native signs, cardinal transport and complement subtraction used here. The reviewed AUDIT-10 R11.1–R11.6 records and the complete current issue/handoff were read. Bounded searches of the two pinned algebraic-geometry trees found no declarations under the new helper names; this is not an exhaustive absence claim. The nearby upstream SemisimpleAlgebras and AlgebraicCurves documents were read in full in this continuous worker loop.

Schröer's [arXiv2004.07025v3 HTML](https://arxiv.org/html/2004.07025v3), §3 conductor diagram and complete displayed Proposition3.1–3.2 proofs with adjoining count table, was read freshly. Download SHA256 d14049912dcab6a438ed62363e246d0087c61342c51813ac482f5aba48d92456. The explicit native equation-level parametrization is an authored deduction from that chart, not a printed theorem attribution. No full-paper reread or erratum collation is claimed.

The exact predecessor program, credited to ChatGPT Pro cp-20261002-sr-c72e81, was freshly rerun:132079 assertions,259 models,44089 projective candidates and3090 normalization source points over F2,F3,F5,F7,F11,F4,F8,F9,F27,F25. Its source SHA256 is c5ca830260f2389c362b635b72ddde749ec21d3d669aaf75ecfebdc76600c938. This is finite regression evidence, not a scheme normalization or cohomology proof. Its own receipt's lean_compiled=false describes that original Python program; the separate new native Lean proof is reported above.

## Packet, graph and reproduction

Indexed blueprint checker:0 errors,0 warnings. All182 inherited whole node objects and the route/source/request/scope records compare equal; the entire roadmap is byte equal; the suggested prefix is byte equal to the read base. Every new node and API/test has matching reader/signature coverage. Git diff whitespace check passes.

The actual read-only scripts/build.py assembler was run with packet/roadmap symlink overlays and an original-packet control. Stage graph3043 vertices/8727 edges; own declaration graph189/461; stages plus recursively reachable declarations3203/9368. All three are acyclic. All68 existing touching stage paths remain reachable. No unresolved prerequisites, external declaration nodes or own skipped links remain. Existing stage edges and unrelated skipped-link sets compare equal to control. Library references are terminal leaves; upstream roadmap references are stage vertices. No extra realization edge is invented and no atlas data is written. Graph script SHA256 `d3b89f4cff68adba943b80830163812214c3b709b7e171c214504faaeaa3b943`.

Save the following reconstruction script in disk-backed scratch and run it from this submission's repository root. It produces the exact checked sources, extracts the publicly archived predecessor regression and writes the original packet/roadmap into the own reconstruction directory. The archive commit is a parent of the submitted commit. Network access only fetches the exact public Tau Ceti file. Then run regression.py with Python3 and compare its source hash and counts. Preserve all terminal newlines.

```python
from pathlib import Path
import hashlib,subprocess,urllib.request,re
root=Path.cwd();sc=root.parent/'scratch-neron-cartan';sc.mkdir(exist_ok=True)
stem='NeronModelsAndSemistableAbelianVarietiesPartII';base='058d2a2bb164ceb15fe5163ab607fcc70bdc2ec2';archive='fd64cf3c4e41133e0f200698fef47c11247ec9dd';pin='f790474821cf4256814db967cb154e7af3d0c369'
for name,folder,ext in [('packets','packets','json'),('roadmaps','roadmaps','json'),('handoff','handoff','md')]:
 file=('DESIGN-' if name=='handoff' else '')+stem+'.'+ext
 (sc/f'original-{name}.{ext}').write_bytes(subprocess.check_output(['git','show',f'{base}:research/blueprint/{folder}/{file}']))
actual=subprocess.check_output(['git','show',f'{archive}:research/blueprint/suggested/{stem}.lean'],text=True)
submitted=(root/'research/blueprint/suggested'/f'{stem}.lean').read_text()
def fragment(text):return text.split('/- BEGIN QUADRATIC POINT PARAMETRIZATION -/\n',1)[1].split('/- END QUADRATIC POINT PARAMETRIZATION -/',1)[0]
tc=urllib.request.urlopen(f'https://raw.githubusercontent.com/CBirkbeck/TauCeti/{pin}/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean',timeout=45).read().decode()
# Exact public namespace section, with the module's final section terminator removed.
section=tc[tc.index('\nnamespace TauCeti'):tc.rindex('\nend\n')]
ns=['parameter_equation','affine_zero_x','parameter_recovery','affineParamEquiv','affineParamEquiv_origin','affineParamEquiv_symm_none','affineParamEquiv_symm_some','affineParamEquiv_nonzero','affine_card_balance','pointCount_balance','frobeniusTrace_roots']
proof='import Mathlib\n'+section+'\n'+fragment(actual)+'\n'+'\n'.join('#print axioms TauCeti.GenusOne.QuadraticPinch.'+n for n in ns)+'\n'
sketch='import Mathlib\n'+section+'\n'+fragment(submitted)+'\n'
assert hashlib.sha256(proof.encode()).hexdigest()=='c76ff685ef6ce890bc33edacc714a6ba8130bdee89e4a99929c782955d04e48b'
assert hashlib.sha256(sketch.encode()).hexdigest()=='119fe4571604dfb379f752f593c2b255be7a92a96f01a2b69492a5027624632d'
(sc/'prototype.lean').write_text(proof);(sc/'sketch.lean').write_text(sketch)
old=(sc/'original-handoff.md').read_text();program,=re.findall(r'```python\n(.*?)\n```',old,re.S);program+='\n'
assert hashlib.sha256(program.encode()).hexdigest()=='c5ca830260f2389c362b635b72ddde749ec21d3d669aaf75ecfebdc76600c938'
(sc/'regression.py').write_text(program)
print('Exact proof, admitted fragment, base packet/roadmap and predecessor regression reconstructed.')
```

Save this exact graph script as graph.py in the same reconstruction directory and run it from the repository root. It writes only own scratch overlays and the receipt. It adds the new roadmap definition to both control/current overlays, preserving the actual stage structure.

```python
import sys,json,hashlib
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sc=root.parent/'scratch-neron-cartan';sys.path.insert(0,str(root/'scripts'));from build import assemble
stem='NeronModelsAndSemistableAbelianVarietiesPartII';rid=stem;packet=json.loads((root/'research/blueprint/packets'/f'{stem}.json').read_text());original=json.loads((sc/'original-packets.json').read_text())
def overlay(name,p):
 d=sc/name;d.mkdir(exist_ok=True)
 for f in (root/'data/blueprints').iterdir():
  if f.name in [stem+'.json','roadmaps']:continue
  t=d/f.name
  if not t.exists():t.symlink_to(f,target_is_directory=f.is_dir())
 rd=d/'roadmaps';rd.mkdir(exist_ok=True)
 for f in (root/'data/blueprints/roadmaps').glob('*.json'):
  if f.name==stem+'.json':continue
  target=rd/f.name
  if not target.exists():target.symlink_to(f)
 (rd/(stem+'.json')).write_text((root/'research/blueprint/roadmaps'/f'{stem}.json').read_text())
 (d/(stem+'.json')).write_text(json.dumps(p))
 return d
a,ctx=assemble(require_distances=False,blueprints=overlay('overlay',packet));control,cctx=assemble(require_distances=False,blueprints=overlay('control',original))
def stats(vertices,edges):
 vs=set(vertices);out=defaultdict(set);ins=defaultdict(int)
 for s,t in edges:
  vs.update([s,t]);out[s].add(t)
 for s in out:
  for t in out[s]:ins[t]+=1
 q=deque(sorted(v for v in vs if ins[v]==0));n=0
 while q:
  s=q.popleft();n+=1
  for t in out[s]:
   ins[t]-=1
   if ins[t]==0:q.append(t)
 return {'vertices':len(vs),'edges':sum(map(len,out.values())),'acyclic':n==len(vs)},out
stages={s['id'] for s in a['stages']};se={(e['source'],e['target']) for e in a['stageEdges']};ce={(e['source'],e['target']) for e in control['stageEdges']}
# Exact virtual upstream stage references are graph vertices, never library leaves.
st,following=stats(stages,se)
own={n['id']:n for n in packet['nodes']};oe={(x,n['id']) for n in own.values() for x in n['prerequisites'] if x in own};og,_=stats(own,oe)
universe={}
for folder in ['data/decompositions','research/blueprint/packets','data/blueprints']:
 for f in sorted((root/folder).glob('*.json')):
  p=json.loads(f.read_text())
  for n in p.get('nodes',[]):universe[n['id']]=n
universe.update(own);reachable={};unresolved=set();baselines=set();dep=set();todo=list(own)
while todo:
 nid=todo.pop()
 if nid in reachable:continue
 n=universe[nid];reachable[nid]=n
 for ref in n.get('prerequisites',[]):
  if ref in universe:
   dep.add((ref,nid));todo.append(ref)
  elif ref in stages or ref.startswith('tauceti:TauCetiRoadmap/'):
   stages.add(ref);dep.add((ref,nid))
  elif ref.startswith(('mathlib:','tauceti:')):baselines.add(ref)
  else:unresolved.add(ref)
combined,_=stats(stages|set(reachable),se|dep)
# Required stage paths come from the original touching links and binding RS-08.
# Planet declaration ids are not their parent stage ids.
scope=set(packet['scope']);pairs={(x,y) for x,y in ce if x in scope or y in scope}
for path in ['data/atlas.json']:
 record=json.loads((root/path).read_text())
 for edge in record.get('stageEdges',record.get('links',[])):
  if edge['source'] in scope or edge['target'] in scope:
   pairs.add((edge['source'],edge['target']))
def reaches(s,t):
 seen=set();todo=[s]
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo.extend(following.get(x,()))
 return False
missing=[list(x) for x in sorted(pairs) if not reaches(*x)]
roadmaps={r['id']:r for r in a['roadmaps']};cr={r['id']:r for r in control['roadmaps']}
skips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in a['roadmaps'] if r['id']!=rid}
cskips={r['id']:r.get('blueprint',{}).get('skippedLinks',[]) for r in control['roadmaps'] if r['id']!=rid}
unchanged=sum(own[n['id']]==n for n in original['nodes']);assert unchanged==182
rec={'actualAssembler':True,'stageDAG':st,'ownDeclarationDAG':og,'stagesAndReachableDeclarations':combined,'reachableDeclarations':len(reachable),'externalDeclarations':sorted(set(reachable)-set(own)),'reachableBaselineReferences':len(baselines),'unresolved':sorted(unresolved),'ownSkippedLinks':roadmaps[rid]['blueprint']['skippedLinks'],'otherSkipsMatchOriginal':skips==cskips,'stageEdgesUnchanged':se==ce,'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'inheritedMissingStagePairs':missing,'unchangedNodeObjects':unchanged,'partDeclarations':len(own),'partPlanets':sum('planet' in n for n in own.values()),'roadmapDeclarations':roadmaps[rid]['blueprint']['declarations'],'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
assert st['acyclic'] and og['acyclic'] and combined['acyclic'];assert not unresolved;assert se==ce and skips==cskips
(sc/'graph-receipt.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec,indent=2))
```

For Lean, use an already existing build at the recorded pins and set LEAN_PATH to its package/root compiled-library directories. Run its Lean4.34.0-rc2 on prototype.lean, then sketch.lean, one invocation at a time. Check free memory≥20GiB and use timeout1200. Do not install/build/update/cache a project. Normalize the invocation source path to its basename before hashing the log. The actual file includes eleven print-axiom audits; the admitted file omits those audits and honestly warns on all17 outer bodies.

## Resume here

The native affine equation solution equivalence and numerical count/trace strand are now explicit and independently checked. Continue the preserved projective proof: construct the homogeneous normalization map on the two actual projective charts; prove the infinity chart localization using the explicit unit identity; establish finite birational normalization and the conductor ideal sheaf; construct the structure-sheaf exact sequence with the actual E/k quotient and specified module actions; derive H⁰ and H¹ through finite pushforward. No flatness of normalization at the pinch is assumed. Keep the inseparable and characteristic2/3 singular-scheme boundaries.

Package the count theorem over actual finite field extensions and prove root splitting/parity before consuming quadratic-extension-counts. The two-component I₂ construction remains separate. Do not mark either geometric genus-one classification or I₂ complete from this one-component formula. All G.0–G.6 fibration, Picard, Néron-model, classification and routed-paper obligations remain required; the exact supplier requests and reserved Ferrand owner are unchanged.
