# BP-DiophantineApproximationAndTranscendence — budget pass complete

Refs #1027. Codex — codex-7e92bd; claim 5984468504, exact bot confirmation 5984469909. Immutable mathematical and publication bases are recorded in base.txt and publication-base.txt. Only the four named deliverables change.

## Result

The incoming 392-node packet exceeds the 300-node budget. No node is added. Every statement, hypothesis, proof outline, API, test, planet and source citation is preserved. Four prerequisite lists now use exact existing suppliers: GN.1 boundary linear forms (two consumers), attained successive minima and both classical Minkowski product bounds, and CA.2 complex-recurrence closed form. Those match three former mathematical requests at the planning-interface level. GN.1 has not been promoted, so its exact node ids do not yet resolve to stages in the atlas assembler. A GN.1 promotion bridge and its stage prerequisites are retained alongside the new node imports to preserve the original supplier edges; remove that bridge only after supplier promotion. GN.4 polar-lattice covering remains the mathematical request; the absolute/adelic Minkowski and S-unit proof gaps are not closed by classical imports.

Totals: 40 definitions, 5 constructions, 212 lemmas, 130 theorems and 5 applications; 378 raw API entries, 232 test records (192 on definitions/constructions), 36 planets, 423 baseline declarations, 22 gaps and two request records (one mathematical request and one promotion bridge). All nodes remain unchecked. DT.1 retains its inherited closed planning coverage; DT.0/2/3/4/5 remain partial. Overall complete means this budgeted pass is ready for independent review, not that the mathematics is formalised.

Three newly read pinned Tau Ceti dimension declarations replace a false absence claim: injective integral extensions preserve dimension; polynomial Noether-normalization presentations compute it; finite-type dimension survives field extension. The exact fraction-field/transcendence-degree and affine-family comparison remains open. The scheme-foundations proposal is narrowed accordingly; no native result is re-planned.

The four CDT-routed G-function inputs are mapped explicitly. The existing arithmetic G-function definition and Chudnovsky interface are nearby inputs with their existing proof gaps. Bombieri–André and Katz's global monodromy chain remain undecomposed. The at-zero regular-singularity result is not a substitute for all singular points, including infinity; the separate CDT quantitative-holonomy/algebraization Part II is not absorbed.

**Inherited normalization defect:** chudnovsky-galochkin-condition first normalizes G_s by y^(s)/s!, then divides G_m by m! again in the denominator condition. For its test y′=y/(1−z), normalized G_m=(1−z)^(−m); multiplying by T^m and dividing again gives 1/m!, contradicting the stated q_s=1 and exponential bound. Re-read the original convention and correct statement/signature together before reuse. This pass retains the object and records the counterexample; it does not claim a new erratum in the original source. The 76 historical findings and their source-version records are unchanged.

## Checks and source scope

The whole suggested file plus a planning comment compiled using existing exact pinned Mathlib 082e2d3 artifacts and Lean 4.34.0-rc2 (commit 6a10ac8c22beadecabdbb0919c2b50214762f91d). Zero errors; 820 admission warnings and no other warnings. One process, 36 GiB available, 1200-second timeout and 8192 MiB Lean limit; no dependency build/cache download. The 3832 imported Mathlib source modules and package pins matched. No Tau Ceti module is imported by the file: the new dimension citations are source-read planning inputs. The file has 675 named commands and 232 examples. All 376 distinct API names resolve (including relative namespaces), but the 392 nodes have no explicit declaration metadata, so this API index alone is not a proof of complete node/signature correspondence. Typing admitted statements does not validate their mathematical truth.

Fresh reading: the full issue before and after the bot win; all six AUDIT-07 rows and accepted audit review; target README and atlas edges; RS-03 report, review, DT.0 narrowing and every accepted touching link; all 52 touching link-map records (27 distinct bodies); four full CDT extraction objects and the accepted source route; incoming handoff, coverage/gaps, six supplier and four consumer objects; the two full native dimension files. No fresh full-source or all-392-node proof review is claimed. LocalFieldsRamification and Multiquadratic upstream reading is reused from this worker's own prior complete readings, with unchanged hashes authenticated through PR6108/PR3268 evidence. The inherited source-access claims describe those earlier attempts, not new searches establishing unavailability today.

## Where to resume

Independent review should first check the Chudnovsky normalization and the exact supplier substitutions. The five open stages then need follow-up packets under the budget rule. Preserve the full existing coverage lists: polar transference; absolute/parametric Subspace and sharp Roth arithmetic intersection proofs; quantitative logarithmic and p-adic bounds; equation-specific bound proofs; Mahler/E/G, differential Galois and functional-transcendence gaps. DT.1's ordinary Roth proof is distinct from DT.2's sharp-Roth dependency. Schanuel and period conjectures remain explicit conditional hypotheses. ED.2 owns certified numerical evaluation/reduction/enumeration; DT.4 owns its theorem-level equation bounds. The incomplete source/proof routes must not be represented as implemented or closed.

## Reproducible evidence

Named artifacts include the four incoming files, Candidate.json, Reader.md, Suggested.lean, Plan.json, Counts.json, DependencyChanges.json, RecurrenceSupplier.json, GeometrySuppliers.json, BaselineAdditions.json, NativeIntegral.lean, NativeFiniteType.lean, NativeSourceReading.json, Atlas.json, Decomposition.json, Audit.json, RoutedItems.json, RoutedExistingNodes.json, RouteMap.json, TouchingEntries.json, UniqueTouchingEntries.json, RestructureTouching.json, Reading.json, PriorReadingReuse.json, InputGuard.json, PublicationChanges.json, ClaimReceipt.json, SourceAudit.json, CompilePreflight.json, Typing.json, Compile.log, LeanCommands.json, LeanIndexReport.json, WORKLIST.md, both base files and both verification reports. They and the exact scripts below are retained through a public immutable archive; disposable scratch is removed after submission.

Verification authenticates all preserved objects and exact dependency substitutions, runs the actual indexed packet/source/version/intake checks, and compares actual atlas assembly with the incoming packet against both immutable bases. It checks accepted restructure paths and scoped acyclicity, with foreign content and pending/skipped links unchanged. Recovery authenticates all four public final deliverables and all archived artifacts/helpers. Both recovered verifier reports are reproduced byte-for-byte before PR submission. Recovery and verification do not execute Lean; they authenticate its recorded source/log receipt.

## Script: author.py

```python
"""Reconcile inherited targets and available suppliers at the node budget."""
from pathlib import Path
import collections,copy,hashlib,json,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();RID='DiophantineApproximationAndTranscendence'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
p=load('Incoming.json');old=copy.deepcopy(p);GN='GeometryOfNumbersAndQuadraticArithmetic:GN.1';CA='ClassicalArithmeticCompletion:CA.2'
replacements={
RID+':DT.0/dirichlet-approximation-from-minkowski':(GN,[GN+'/minkowski-linear-forms']),
RID+':DT.2/linear-form-dirichlet-exponent':(GN,[GN+'/minkowski-linear-forms']),
RID+':DT.2/absolute-minkowski-for-twisted-heights':(GN,[GN+'/'+x for x in ['successive-minimum-is-least','successive-minimum-witnesses','minkowski-second-lower','minkowski-second-upper']]),
RID+':DT.2/skolem-mahler-lech-simple-roots':(CA,[CA+'/closed-form-of-a-complex-linear-recurrence'])}
changes=[]
for n in p['nodes']:
 if n['id']in replacements:
  stage,ids=replacements[n['id']];before=copy.deepcopy(n['prerequisites']);assert stage in before
  n['prerequisites']=[v for x in before for v in ((ids+[stage]if stage==GN else ids) if x==stage else[x])]
  changes.append(dict(node=n['id'],before=before,after=n['prerequisites'],reason='The supplier node statements and hypotheses now supply the existing request; no theorem statement or proof outline is changed.'))
save('DependencyChanges.json',changes)
p['requests']=[q for q in p['requests']if q['supplier']not in [GN,CA]];assert len(p['requests'])==1
p['requests'].append(dict(supplier=GN,need='Promotion bridge only: the exact boundary-linear-forms, attained-minima and lower/upper-product node contracts now exist in the GN packet and are imported by id. The GN packet has not been promoted, so the current atlas assembler cannot resolve its node ids to stages. Retain this existing supplier-stage anchor and its prerequisites to preserve GN.1→DT.0/DT.2 until those exact nodes are promoted; this requests no duplicate mathematical construction.',neededBy=[k for k,(stage,_)in replacements.items()if stage==GN]))
baseline=[]
for name,module,line,provides in [
('TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul','TauCeti/RingTheory/KrullDimension/Integral.lean',76,'For commutative R-algebra S, Algebra.IsIntegral R S and FaithfulSMul R S imply ringKrullDim S = ringKrullDim R. This supplies the injective integral-extension part of the inherited dimension gap.'),
('TauCeti.ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial','TauCeti/RingTheory/KrullDimension/FiniteType.lean',54,'For a field k and a finite variable type, an injective integral k-algebra map from the polynomial ring to A gives ringKrullDim A equal to the number of variables. No domain hypothesis on A is added.'),
('TauCeti.ringKrullDim_tensorProduct_field_of_finiteType','TauCeti/RingTheory/KrullDimension/FiniteType.lean',97,'For a field extension K/k and any finite-type commutative k-algebra A, scalar extension K tensor_k A preserves ringKrullDim. This does not by itself prove a flat-family fibre dimension theorem.')]:
 baseline.append(dict(ref='tauceti:'+name,kind='theorem',module=module,provides=provides,checked='Full statement, surrounding hypotheses and proof read at pinned Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; line '+str(line)+'.'))
assert not {x['ref']for x in baseline}&{x['ref']for x in p['baseline']['declarations']};p['baseline']['declarations']+=baseline;save('BaselineAdditions.json',baseline)
cdt='CDT Theorem 7.3.3 routes four DT.5 inputs. The existing g-function node supplies the arithmetic growth/D-finiteness definition but needs its finite-coefficient-field and minimal-system comparisons checked. chudnovsky-galochkin-condition is a nearby system theorem, conditional on the recorded Shidlovskii proof gap; connect its denominator convention to finite global operator height for the minimal connection. Bombieri–André (Galochkin condition ⇒ Bombieri generic-radius condition ⇒ global nilpotence) and Katz (global nilpotence ⇒ regular singularities and quasi-unipotent local monodromy at every singular point, including infinity) have no exact nodes in this packet. The at-zero G-operator statement alone is not this global chain. Read DGS94 VIII.1.5, VII.2.1 and III.2.3(ii), and Katz 1970, at their full hypotheses and proof scope in a follow-up. Generic connection/differential-equation infrastructure must be imported if an owner supplies it; the modular-form application belongs to the CDT modular owner, and quantitative holonomy/algebraization belongs to its separate Part II.'
normalization='Inherited chudnovsky-galochkin-condition first defines G_s by y^(s)/s! = G_s y, then uses T^m G_m/m! in its denominator condition. These conventions insert the factorial twice: for the stated test y′=y/(1−z), normalized G_m=(1−z)^(−m), T=1−z, so the displayed quotient is 1/m!, contradicting the acceptance claim q_s=1 and its exponential bound. Reconcile normalized versus unnormalized iterated connection matrices against the original source before reuse. This is an inherited packet-normalization defect, not a newly verified erratum in Beukers or DGS. The source and proposed signatures are preserved and remain unchecked.'
dimension='The old absence claim is superseded by three freshly read pinned Tau Ceti declarations: injective integral extensions preserve Krull dimension; an injective integral map from a finite polynomial algebra computes dimension by the variable count; finite-type dimension is invariant under field extension. These are baseline inputs, not new nodes. What remains is their exact comparison with the fraction-field transcendence-degree interface and the torsion-free/flat finite-type family over the affine line used by fibre-dimension-over-the-affine-line and Siegel–Shidlovskii. Confirm the generic scheme/algebra owner before assigning new work; the inherited proposal must not re-plan the native integral-extension or field-base-change results.'
for c in p['coverage']:
 st=c['stageId'].split(':')[1]
 if st=='DT.0':
  c['remaining']=[x for x in c['remaining']if 'GN.1:'not in x]
  c['notes']='Boundary linear forms are now imported by exact node id from GN.1; the polar-lattice covering request to GN.4 remains. All node statements and quantitative conventions are unchanged.'
 elif st=='DT.1':c['notes']='Inherited closed planning coverage retained: the ordinary Roth proof chain is distinct from the still-open sharp Roth/Product Theorem needed by DT.2. No fresh complete Roth-source audit or formalisation is claimed by this budget pass.'
 elif st=='DT.2':
  c['remaining']=[x for x in c['remaining']if not x.startswith('Receive GeometryOfNumbers')]
  c['remaining'].append('The classical boundary linear-forms theorem, attained successive minima, both Minkowski product inequalities and the complex-recurrence closed form now have exact supplier node prerequisites. These match three former requests at the planning-interface level; a GN.1 promotion bridge stays in requests until the assembler can see its unpromoted supplier nodes; they do not prove the absolute/adelic twisted-height theorem, the sharp-Roth boundary case, or the S-unit theorem that consumes them.')
 elif st=='DT.3':c['remaining'].append('Keep the qualitative algebraic-coefficient and inhomogeneous logarithmic independence interfaces separate from quantitative integer-coefficient bounds. Complex branch choices and nonzero linear forms travel with each bound; p-adic deep-unit convergence and the chosen logarithm branch are distinct from arbitrary normed-space log series. The native absolute-height API gap remains; no new implementation is inferred from compilation.')
 elif st=='DT.4':c['remaining'].append('RS-03 keeps equation-specific height/degree conversions and proven explicit bounds here. ED.2 owns certified numerical evaluation, lattice reduction and exhaustive residual enumeration. The accepted DT.4→ED.2 and forwarded ED.5 paths must survive promotion; ineffective Roth/Subspace finiteness is never used as a search cutoff.')
 elif st=='DT.5':c['remaining'] += [cdt,normalization,dimension,'Schanuel and period conjectures remain explicit conditional hypotheses. Exponential functional transcendence here is distinct from o-minimal modular/Shimura inputs at LD.6, arithmetic unlikely intersections at RP.5 and dynamical endpoints at DY.6. The old broad Picard–Vessiot request is still not supplied by a generic owner found in this pass; RD.1 only has a cyclic-vector theorem with its own proof gap.']
for g in p['gaps']:
 if g['title'].startswith('Integral extensions preserve'):
  g['title']='Remaining dimension and affine-family comparison after native integral-extension inputs';g['detail']=dimension
 if g['title'].startswith('Absolute Minkowski theorem'):
  g['detail']+=' The classical attained-minima and lower/upper product inputs are now imported by exact GN.1 node ids. This does not close the absolute/adelic step.'
p['gaps'] += [dict(title='CDT G-function to global monodromy chain remains incomplete',neededBy=[],detail=cdt),dict(title='Inherited Chudnovsky matrix normalization needs correction',neededBy=[RID+':DT.5/chudnovsky-galochkin-condition'],detail=normalization)]
p['restructure'][10]['detail']=dimension
p['restructure'][10]['proposal']='Retain only the generic finite-type affine-family dimension/flatness comparison after importing the pinned Tau Ceti integral-extension and field-base-change theorems. Coordinate the exact remaining interface with SchemeAndStackFoundations:SF.0; no scope amendment is applied in this pass.'
p['status']='complete';p['summary']='Budgeted planning pass complete: 392 inherited unchecked nodes and no new nodes above the 300-node budget. Four prerequisite lists now use exact existing suppliers, matching three former mathematical requests while retaining a GN.1 promotion bridge and preserving every node statement, proof outline, API, test and planet. Three freshly read Tau Ceti dimension declarations correct a stale baseline-absence claim. DT.1 retains its inherited closed planning coverage; the other five stages remain partial. The CDT G-function/global-monodromy route, inherited Chudnovsky factorial-normalization defect and all remaining proof gaps are explicit; compilation does not establish their correctness.'
p['checks']={'agent':'Codex — codex-7e92bd','date':'2026-10-04','newNodes':0,'preservedStatements':392,'dependencyListsUpdated':4,'requestsMatched':3,'promotionBridges':1,'newBaselineDeclarations':3,'compile':'Full suggested file compiled at the exact pinned Mathlib with zero errors, 820 expected admission warnings and no other warnings. All 3832 imported Mathlib sources and dependency pins matched the existing build. No Tau Ceti module is imported; the new native dimension citations are planning inputs read at the pinned source.','signatureBoundary':'The file has 675 named commands and 232 examples. All 376 distinct indexed API names resolve, including relative names under their packet namespace; all 392 nodes lack explicit declaration metadata, so the API index alone is not a complete node-to-signature correspondence proof.'}
p['provenance']={'agent':'Codex — codex-7e92bd','issue':1027,'claim':5984468504,'confirmation':5984469909,'freshReading':'Six reviewed AUDIT-07 layer records, current target document and atlas edges, RS-03 report/review and DT.0 narrowing, all 52 touching link records (27 distinct bodies), four routed CDT extraction records and review, incoming handoff/coverage/gaps and selected supplier/consumer nodes, two native Tau Ceti dimension source files. No fresh full-source review of all 392 nodes is claimed.','priorReading':'Two nearby upstream documents (LocalFieldsRamification and Multiquadratic) reuse the same worker’s earlier complete reading, authenticated by unchanged file hashes. Historical source/proof evidence in the preceding packet is preserved and attributed to its authors.','preservation':'Node identifiers and all fields except four prerequisite lists are byte-equivalent as JSON objects. All 76 source findings, 33 sources and source-version records are preserved. The inherited Chudnovsky ambiguity is a packet defect, not a new source finding.','evidence':'Exact dependencies, supplier snapshots, native source excerpts/hashes, compilation receipt, immutable repository checks and public recovery are attached through the handoff.'}
save('Candidate.json',p);save(RID+'.json',p)
changed=[k for k in p if k not in old or p[k]!=old[k]];save('Plan.json',dict(changedFields=changed,newNodes=0,**{k:p[k]for k in changed if k!='nodes'}))
route=[dict(id=x['id'],name=x['name'],locator=x['locator'],status='existing_interface_with_gap'if x['id'].endswith(('g-functions','chudnovsky'))else'open',nodes=[RID+':DT.5/'+('g-function'if x['id'].endswith('g-functions')else'chudnovsky-galochkin-condition')]if x['id'].endswith(('g-functions','chudnovsky'))else[],note=cdt+(' '+normalization if x['id'].endswith('chudnovsky')else''))for x in load('RoutedItems.json')];save('RouteMap.json',route)
counts=dict(nodes=len(p['nodes']),kinds=dict(collections.Counter(n['kind']for n in p['nodes'])),API=sum(len(n.get('api',[]))for n in p['nodes']),tests=sum(len(n.get('tests',[]))for n in p['nodes']),constructionTests=sum(len(n.get('tests',[]))for n in p['nodes']if n['kind']in ['definition','construction']),planets=sum(bool(n.get('planet'))for n in p['nodes']),baseline=len(p['baseline']['declarations']),gaps=len(p['gaps']),requests=len(p['requests']),sourceIssues=len(p['sourceIssues']),namedLeanCommands=675,LeanExamples=232);save('Counts.json',counts)
front='# Diophantine approximation and transcendence: completed budget pass\n\n'+p['summary']+'\n\nCurrent frontier text and exact supplier replacements below supersede older request/absence language in the preserved reader. Mathematical node statements are inherited unchecked plans, not proofs. The new normalization counterexample is an explicit restriction on reusing the inherited Chudnovsky statement.\n\n## Coverage and follow-up work\n\n'
for c in p['coverage']:front+='### '+c['stageId']+' — '+c['status']+'\n\n'+c.get('notes','')+'\n\n'+'\n\n'.join(c['remaining'])+'\n\n'
front+='## Resolved supplier interfaces\n\n'
for c in changes:front+='- **'+c['node']+'** imports '+', '.join(x for x in c['after']if x not in c['before'])+'.\n'
front+='\nThese suppliers remain unchecked plans; the two-sided classical Minkowski bounds do not replace the absolute/adelic theorem. GN.4 polar-lattice covering is the remaining mathematical request. A GN.1 promotion bridge remains because its unpromoted nodes do not yet resolve to stages in the atlas assembler; the exact node and stage prerequisites are both retained to preserve the supplier edge.\n\n## Fresh pinned dimension inputs\n\n'
for b in baseline:front+='- **'+b['ref']+'**: '+b['provides']+'\n'
front+='\n## CDT source route\n\nAll four records named by issue #1027 were read with their accepted route. The complete source papers were not reread in this pass.\n\n'
for x in route:front+='- **'+x['id']+'** — '+x['status']+'. '+('Existing node: '+', '.join(x['nodes'])+'. 'if x['nodes']else'No exact node supplied. ')+x['name']+'; '+x['locator']+'.\n'
front+='\n'+cdt+'\n\n'+normalization+'\n\n## Current validation boundary\n\n'+p['checks']['compile']+' '+p['checks']['signatureBoundary']+'\n\n## Inherited reader, preserved verbatim\n\nThe following text records earlier work and source reading. Current status, imports and limits are above.\n\n'
reader=front+(S/'IncomingReader.md').read_text();reader+='\n## Exact inherited contract supplement\n\nPacket wording omitted or paraphrased by the older reader is reproduced here. These statements remain unchecked, including the normalization defect identified above.\n\n'
for n in p['nodes']:
 clauses=[]
 if n['id']not in reader or n['statement']not in reader:clauses+=['Statement: '+n['statement']]
 for label,key in [('API','api'),('Test','tests')]:
  for a in n.get(key,[]):
   if a['name']not in reader or a['statement']not in reader:clauses+=[label+' '+a['name']+': '+a['statement']]
 if n['id']in replacements:clauses+=['Current prerequisites: '+', '.join(n['prerequisites'])+'.']
 if clauses:reader+='### '+n['id']+'\n\n'+'\n\n'.join(clauses)+'\n\n'
(S/'Reader.md').write_text(reader.rstrip()+'\n')
for folder,n,ext in [('packets','Candidate.json','json'),('readmes','Reader.md','md'),('suggested','Suggested.lean','lean')]: (R/'research/blueprint'/folder/(RID+'.'+ext)).write_bytes((S/n).read_bytes())
print(json.dumps(counts,indent=2))
```

## Script: index_lean.py

```python
"""Index inherited top-level Lean commands, respecting comments and strings."""
from pathlib import Path
import collections,json,re,sys
S=Path(sys.argv[1]);t=(S/(sys.argv[2]if len(sys.argv)>2 else'Inherited.lean')).read_text();p=json.loads((S/(sys.argv[3]if len(sys.argv)>3 else'InheritedNamed.json')).read_text());prefix=sys.argv[4]if len(sys.argv)>4 else''
def mask(text):
 out=list(text);i=0;depth=0;string=False;line=False
 while i<len(text):
  if depth:
   if text.startswith('/-',i):out[i:i+2]=[' ',' '];depth+=1;i+=2;continue
   if text.startswith('-/',i):out[i:i+2]=[' ',' '];depth-=1;i+=2;continue
   if text[i]!='\n':out[i]=' '
   i+=1;continue
  if line:
   if text[i]=='\n':line=False
   else:out[i]=' '
   i+=1;continue
  if string:
   if text[i]=='\\':out[i]=' ';i+=1;out[i]=' ';i+=1;continue
   if text[i]=='"':string=False
   if text[i]!='\n':out[i]=' '
   i+=1;continue
  if text.startswith('/-',i):out[i:i+2]=[' ',' '];depth=1;i+=2;continue
  if text.startswith('--',i):out[i:i+2]=[' ',' '];line=True;i+=2;continue
  if text[i]=='"':out[i]=' ';string=True
  i+=1
 assert not depth and not string
 return ''.join(out)
m=mask(t)
pat=re.compile(r'^[ \t]*(?:@\[[^\n]*\]\s*)?(?:(?:noncomputable|private|protected|local|unsafe)\s+)*(def|theorem|lemma|abbrev|structure|class|instance|example|namespace|section|end|variable|open|universe|set_option|attribute|notation|infixl?|infixr|prefix|postfix|macro|syntax|scoped|import|export|omit|include)\b',re.M)
hits=list(pat.finditer(m));stack=[];commands=[]
for i,h in enumerate(hits):
 a=h.start();b=hits[i+1].start()if i+1<len(hits)else len(t)
 # Attach trailing whitespace/comments to the next command where possible.
 last=b
 while last>a and m[last-1].isspace():last-=1
 kind=h.group(1);tail=m[h.end():last].strip();name=None
 if kind in ['namespace','section']:
  label=tail.split()[0]if tail else '';stack.append((kind,label))
 elif kind=='end':
  label=tail.split()[0]if tail else ''
  assert stack,(t.count('\n',0,a)+1,label)
  typ,opened=stack.pop();assert not label or opened==label,(t.count('\n',0,a)+1,label,opened)
 elif kind in ['def','theorem','lemma','abbrev','structure','class','instance']:
  name=tail.split()[0]if tail else None
  if name and name[0] in '({[:':name=None
  if name:
   ns='.'.join(x[1]for x in stack if x[0]=='namespace')
   name=(ns+'.'if ns else '')+name
 commands.append({'kind':kind,'name':name,'start':a,'end':last,'line':t.count('\n',0,a)+1,'namespaces':[x[1]for x in stack if x[0]=='namespace']})
assert all(k=='section' and not n for k,n in stack),stack
found={c['name']for c in commands if c['name']}
names=set();resolved={}
for node in p['nodes']:
 for name in ([node['library']['declaration']]if node['library'].get('declaration')else[])+[a['name']for a in node.get('api',[])]:
  full=name if name in found else node['library']['namespace']+'.'+name
  names.add(full);resolved[name]=full
missing=sorted(names-found);dups={n:v for n,v in collections.Counter(c['name']for c in commands if c['name']).items()if v>1}
(S/(prefix+'LeanCommands.json')).write_text(json.dumps(commands,indent=2)+'\n')
(S/(prefix+'LeanIndexReport.json')).write_text(json.dumps({'wanted':len(names),'found':len(found),'missing':missing,'duplicates':dups,'resolvedNames':resolved,'nodesWithoutDeclarationMetadata':sum(not n['library'].get('declaration')for n in p['nodes'])},indent=2)+'\n')
print(json.dumps({'commands':len(commands),'wanted':len(names),'missing':missing[:50],'duplicateCount':len(dups)},indent=2))
```

## Script: verify.py

```python
"""Authenticate Diophantine preservation/evidence and execute immutable repository checks."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S));RID='DiophantineApproximationAndTranscendence';STEM=RID
sha=lambda b:hashlib.sha256(b).hexdigest()
txt=lambda n:(S/n).read_text()
data=lambda n:json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('BP-'if f=='handoff'else'')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={p:txt(n)for p,n in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if(S/'PublicHandoff.md').exists()else'Handoff.md'])}
for path,name in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,path)==(S/name).read_bytes()==blob(BASE,path)
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json')
assert set(p)==set(old)|{'checks','provenance'} and len(p['nodes'])==392 and p['status']=='complete'and plan['newNodes']==0
changesByNode={c['node']:c for c in data('DependencyChanges.json')};assert len(changesByNode)==4
for a,b in zip(old['nodes'],p['nodes']):
 assert a['id']==b['id']
 if a['id']in changesByNode:
  c=changesByNode[a['id']];assert a['prerequisites']==c['before']and b['prerequisites']==c['after']
  assert {k:v for k,v in a.items()if k!='prerequisites'}=={k:v for k,v in b.items()if k!='prerequisites'}
 else:assert a==b
assert p['baseline']['declarations']==old['baseline']['declarations']+data('BaselineAdditions.json')
for g in data('NativeSourceReading.json'):assert sha((S/g['artifact']).read_bytes())==g['sha256']and g['commit']==p['baseline']['tauceti']
suppliers=data('GeometrySuppliers.json')+[data('RecurrenceSupplier.json')]
for n in suppliers:
 file='research/blueprint/packets/'+n['id'].split(':')[0]+'.json'
 for ref in [MATH,BASE]:assert n==next(x for x in json.loads(blob(ref,file))['nodes']if x['id']==n['id'])
for k in old:
 if k not in plan['changedFields']:assert p[k]==old[k],k
for k in plan['changedFields']:
 if k!='nodes':assert p[k]==plan[k]
assert len(p['coverage'])==6 and [c['status']for c in p['coverage']]==[c['status']for c in old['coverage']]
assert len(p['gaps'])==22 and len(p['requests'])==2 and len(p['sourceIssues'])==76 and len(p['baseline']['declarations'])==423
assert all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert all(len(n['tests'])>=3 and len(n['api'])>=3 for n in p['nodes']if n['kind']in ['definition','construction'])
reader=txt('Reader.md');assert txt('IncomingReader.md')in reader
for n in p['nodes']:
 assert n['id']in reader and n['statement']in reader,n['id']
 for item in n.get('api',[])+n.get('tests',[]):assert item['name']in reader and item['statement']in reader,item['name']
assert txt('Suggested.lean').startswith(txt('Incoming.lean'))
assert len(data('RoutedItems.json'))==len(data('RouteMap.json'))==4
assert {x['id']for x in data('RoutedItems.json')}=={x['id']for x in data('RouteMap.json')}
assert len(data('TouchingEntries.json'))==52
assert data('ClaimReceipt.json')['claim']==5984468504 and data('ClaimReceipt.json')['confirmation']==5984469909
assert data('Reading.json')['agent']=='Codex — codex-7e92bd'
# Regenerate the exact command index; report omissions, do not treat typing as coverage.
before={n:(S/n).read_bytes()for n in ['LeanCommands.json','LeanIndexReport.json']}
subprocess.run([sys.executable,str(S/'index_lean.py'),str(S),'Suggested.lean','Incoming.json'],check=True,capture_output=True)
for n,b in before.items():assert(S/n).read_bytes()==b,n
idx=data('LeanIndexReport.json');assert not idx['missing']and not idx['duplicates']and idx['wanted']==376 and idx['nodesWithoutDeclarationMetadata']==392
commands=data('LeanCommands.json');assert sum(bool(c['name'])for c in commands)==675 and sum(c['kind']=='example'for c in commands)==232
typing=data('Typing.json');assert typing['sourceSha256']==sha((S/'Suggested.lean').read_bytes())and typing['logSha256']==sha((S/'Compile.log').read_bytes())
assert typing['exitCode']==typing['errors']==0 and typing['warnings']==820 and not typing['otherWarnings']and typing['availableGiB']>=20 and typing['serial']
assert typing['mathlib']==p['baseline']['mathlib']and typing['tauceti']==p['baseline']['tauceti']
assert len(data('SourceAudit.json'))==3832
changes=data('PublicationChanges.json');allowed={r['path']:r for r in changes}
for g in data('InputGuard.json'):
 a=sha(blob(MATH,g['path']));b=sha(blob(BASE,g['path']));assert a==g['sha256']
 if a!=b:assert g['path']in allowed and allowed[g['path']]['before']==a and allowed[g['path']]['after']==b and allowed[g['path']]['reviewed'],g['path']
contracts=[]
for ref in [MATH,BASE]:
 job=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='BP-'+STEM)
 contracts.append({k:v for k,v in job.items()if k not in ['state','note']})
assert contracts[0]==contracts[1]
if(S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,t in contents.items():
 assert t.endswith('\n')and not t.endswith('\n\n'),path
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),path
os.environ['ROOT_ACTION_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in contents.items():immutable_view.TRACKED.add(path);immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
assert check_blueprint.NODE_BUDGET==300
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors,errors;summary['packet']=paths[0]
assert not warnings,warnings
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
print(json.dumps(dict(checker=summary,warnings=warnings,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,preservedNodeStatements=392,updatedDependencyLists=4,newNodes=0,counts=data('Counts.json'),typing=typing,signatureIndex=idx,inputGuards=len(data('InputGuard.json')),reviewedPublicationChanges=changes,mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullSuggestedCompiled=True,LeanExecuted=False),ensure_ascii=False,indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,collections,copy
R=Path.cwd(); S=Path(sys.argv[1]);RID='DiophantineApproximationAndTranscendence';STEM=RID;SCOPE={RID+':'+x for x in ['DT.0','DT.1','DT.2','DT.3','DT.4','DT.5']}
sys.path.insert(0,str(S))
import immutable_view
immutable_view.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint,build,blueprints
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming.json').read_text())
packets,docs,defs=blueprints.load_promoted(R);keep=[x for x in packets if x[0]!=STEM]
docs[STEM]='research/blueprint/readmes/'+STEM+'.md'
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(docs),copy.deepcopy(defs))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(old)
se={(e['source'],e['target']) for e in a['stageEdges']};controlEdges={(e['source'],e['target']) for e in b['stageEdges']};assert se==controlEdges,{'added':sorted(se-controlEdges),'removed':sorted(controlEdges-se)}
stages={s['id'] for s in a['stages']}|set(check_blueprint.world()[1]);world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for f in sorted((R/folder).glob('*.json')):
  for n in json.loads(f.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
nodes={n['id']:n for n in p['nodes']};world.update(nodes)
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for x,y in edges:
  if y not in out[x]:out[x].add(y);indeg[y]+=1
 todo=[v for v in vertices if indeg[v]==0];done=0
 while todo:
  x=todo.pop();done+=1
  for y in out[x]:
   indeg[y]-=1
   if indeg[y]==0:todo.append(y)
 assert done==len(vertices),[v for v,k in indeg.items() if k][:20]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
todo=list(nodes);seen=set();deps=set();leaves=set();unresolved=set()
while todo:
 n=todo.pop()
 if n in seen:continue
 seen.add(n)
 for d in world[n].get('prerequisites',[]):
  if d.startswith(('mathlib:','tauceti:')) and d not in stages:leaves.add(d);continue
  deps.add((d,n))
  if d in world:todo.append(d)
  elif d not in stages:unresolved.add(d)
assert not unresolved,unresolved
deps|={(world[n]['parentStageId'],n) for n in seen if world[n].get('parentStageId')}
deps|={(r['supplier'],n)for r in p.get('requests',[])for n in r.get('neededBy',[])}
out=collections.defaultdict(set)
for x,y in se:out[x].add(y)
def reachable(x,y):
 todo=[x];seen=set()
 while todo:
  z=todo.pop()
  if z==y:return True
  if z not in seen:seen.add(z);todo+=list(out[z])
 return False
pairs=set()
for f in (R/'research/blueprint/restructure').glob('*.result.json'):
 q=json.loads(f.read_text())
 if q.get('review',{}).get('status')=='accepted':pairs|={(e['source'],e['target']) for e in q.get('links',[]) if SCOPE.intersection([e.get('source'),e.get('target')])}
upstream=sorted((x,y) for x,y in pairs if x.startswith('UPSTREAM:') or y.startswith('UPSTREAM:'))
missing=sorted((x,y) for x,y in pairs if (x,y) not in upstream and not reachable(x,y))
assert not missing,missing
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
def skips(r):return r.get('blueprint',{}).get('skippedLinks',[]),r.get('pendingLinks',[])
assert all(skips(ar[x])==skips(br[x]) for x in br)
result={'stageDAG':dag(stages,se),'ownDAG':dag(nodes,{(d,n) for n in nodes for d in nodes[n]['prerequisites'] if d in nodes}),'scopedDAG':dag(stages|seen,se|deps),'reachableDeclarations':len(seen),'baselineLeaves':len(leaves),'unresolved':sorted(unresolved),'restructurePairs':len(pairs),'undrawnUpstreamContracts':upstream,'missingDrawnPaths':missing,'stageEdgesUnchanged':True,'allSkipsMatchControl':True,'ownAssembly':ar[RID].get('blueprint')}
assert {x:r for x,r in ar.items()if x!=RID}=={x:r for x,r in br.items()if x!=RID}
assert {s['id']:s for s in a['stages']if s.get('owner')!=RID}=={s['id']:s for s in b['stages']if s.get('owner')!=RID}
assert {s['id']:s for s in a['stages']if s['id']not in SCOPE}=={s['id']:s for s in b['stages']if s['id']not in SCOPE}
result['otherStagesUnchanged']=True
result['inheritedMissingRequestStagePaths']=sorted({(r['supplier'],nodes[n]['parentStageId'])for r in p.get('requests',[])for n in r.get('neededBy',[])if not reachable(r['supplier'],nodes[n]['parentStageId'])})
result['worldCommit']=immutable_view.BASE
result['foreignRoadmapsAndStagesUnchanged']=True
result['readPathHashes']={path:__import__('hashlib').sha256(immutable_view.blob(path)).hexdigest()for path in sorted(immutable_view.READS)}
print(json.dumps(result,ensure_ascii=False,indent=2))
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

## Script: compile.py

```python
"""Check the exact full suggested file using existing pinned libraries only."""
from pathlib import Path
import hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();M=Path(sys.argv[2]).resolve();B=Path(sys.argv[3]).resolve();T=Path(sys.argv[4]).resolve();L=Path(sys.argv[5]).resolve()
sha=lambda b:hashlib.sha256(b).hexdigest()
pin='082e2d37e8b0463410cdb532e111cd43d5a66174';taupin='f790474821cf4256814db967cb154e7af3d0c369'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=M,text=True).strip()==pin
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'mathlib',text=True).strip()==pin
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=B/'TauCeti',text=True).strip()==taupin
for root in [M,B/'mathlib',B/'TauCeti']:assert not subprocess.check_output(['git','status','--porcelain','--untracked-files=no'],cwd=root,text=True).strip()
version=subprocess.check_output([str(L),'--version'],text=True).strip();assert '6a10ac8c22beadecabdbb0919c2b50214762f91d'in version and '4.34.0-rc2'in version
native={};old={}
libs=[M/'.lake/build/lib/lean'];packages={}
for item in json.loads((M/'lake-manifest.json').read_text())['packages']:
 pkg=M.parent/item['name'];lib=pkg/'.lake/build/lib/lean'
 if not lib.is_dir():assert item['name']=='Cli';continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=pkg,text=True).strip()==item['rev'];libs.append(lib);packages[item['name']]=item['rev']
def imports(t):
 out=[];i=0;depth=0
 while i<len(t):
  if t.startswith('/-',i):depth+=1;i+=2;continue
  if depth:
   if t.startswith('-/',i):depth-=1;i+=2;continue
   if t[i]=='\n':out.append('\n')
   i+=1;continue
  if t.startswith('--',i):j=t.find('\n',i);i=len(t)if j<0 else j;continue
  out.append(t[i]);i+=1
 found=[]
 for line in ''.join(out).splitlines():
  line=line.strip()
  if not line or line in ['module','prelude']:continue
  m=re.fullmatch(r'(?:(?:public|private|meta) )*import\s+(\S+)',line)
  if m:found.append(m[1])
  else:break
 return found
seen={}
def scan(name):
 if name in seen or name.split('.')[0]not in ['Mathlib','TauCeti']:return
 ismath=name.startswith('Mathlib.');root=B/('mathlib'if ismath else'TauCeti');rel=name.replace('.','/');b=(root/(rel+'.lean')).read_bytes();seen[name]=sha(b)
 if ismath:assert (M/(rel+'.lean')).read_bytes()==b and(M/'.lake/build/lib/lean'/(rel+'.olean')).exists(),name
 else:assert name in native,name
 for n in imports(b.decode()):scan(n)
for n in imports((S/'Suggested.lean').read_text()):scan(n)
(S/'SourceAudit.json').write_text(json.dumps(seen,sort_keys=True,indent=2)+'\n')
free=subprocess.check_output(['free','-g'],text=True);available=int(free.splitlines()[1].split()[-1]);assert available>=20,free
receipt=dict(mathlib=pin,tauceti=taupin,compiler=version,availableGiB=available,packages=packages,nativeArtifactHashes=native,nativeSourceHashes=old,sourceModules=len(seen),sourceSha256=sha((S/'Suggested.lean').read_bytes()),serial=True,timeoutSeconds=1200,memoryLimitMiB=8192)
(S/'CompilePreflight.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2),flush=True)
env={**os.environ,'LEAN_PATH':os.pathsep.join(str(p)for p in libs)}
r=subprocess.run(['timeout','1200',str(L),'-j','1','-M','8192',str(S/'Suggested.lean')],cwd=S,env=env,text=True,capture_output=True)
raw=r.stdout+r.stderr;log=raw.replace(str(S)+'/', '')
(S/'Compile.log').write_text(log);receipt.update(exitCode=r.returncode,errors=len(re.findall(r'error(?:\(|:)',log)),warnings=log.count('warning:'),otherWarnings=[l for l in log.splitlines()if 'warning:'in l and 'declaration uses `sorry`'not in l],logSha256=sha(log.encode()),originalLogSha256=sha(raw.encode()))
(S/'Typing.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps({k:receipt[k]for k in ['exitCode','errors','warnings','otherWarnings']},indent=2))
raise SystemExit(r.returncode)
```

## Script: package.py

```python
"""Archive the named completion evidence and bind a public recovery helper."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='DiophantineApproximationAndTranscendence'
sha=lambda b:hashlib.sha256(b).hexdigest()
helpers=['author.py','index_lean.py','verify.py','graph.py','immutable_view.py','compile.py','package.py']
names="""Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md Candidate.json Reader.md Suggested.lean Plan.json Counts.json
DependencyChanges.json RecurrenceSupplier.json GeometrySuppliers.json BaselineAdditions.json NativeIntegral.lean NativeFiniteType.lean NativeSourceReading.json
Atlas.json Decomposition.json Audit.json RoutedItems.json RoutedExistingNodes.json RouteMap.json TouchingEntries.json UniqueTouchingEntries.json RestructureTouching.json
Reading.json PriorReadingReuse.json InputGuard.json PublicationChanges.json ClaimReceipt.json SourceAudit.json CompilePreflight.json Typing.json Compile.log LeanCommands.json LeanIndexReport.json
WORKLIST.md HandoffText.md HandoffBase.md Handoff.md MathematicalVerification.json Verification.json base.txt publication-base.txt""".split()+helpers
assert len(names)==len(set(names))
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
handoff=R/'research/blueprint/handoff'/('BP-'+STEM+'.md')
if mode=='handoff':
 text=(S/'HandoffText.md').read_text()
 for n in helpers:text+='\n## Script: '+n+'\n\n```python\n'+(S/n).read_text()+'```\n'
 (S/'HandoffBase.md').write_text(text);(S/'Handoff.md').write_text(text);handoff.write_text(text)
elif mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in names}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in names+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode()
 report=dict(artifacts=len(names),helpers=len(helpers),manifestSha256=sha(mb),payloadSha256=sha(pb));(S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\n'+pb+b'END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public completion evidence, authenticate artifacts, never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='DiophantineApproximationAndTranscendence'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\\n',1)[1].split('END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA;payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(STEM+'.json')).write_bytes((S/'Candidate.json').read_bytes())
handoff=(S/'PublicHandoff.md').read_text();assert handoff.startswith((S/'HandoffBase.md').read_text())
def script(name):
 tag='\\n## Script: '+name+'\\n\\n'+chr(96)*3+'python\\n'
 a=handoff.rindex(tag)+len(tag);b=handoff.index('\\n'+chr(96)*3,a)
 return handoff[a:b]+'\\n'
for name in meta:
 if name.endswith('.py'):assert script(name)==(S/name).read_text(),name
code=script('recover.py');assert code==Path(__file__).read_text()
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for k,v in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(k,repr(v))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and verification

Archive commit `{archive}` is an ancestor changing only this issue’s named deliverables. It holds {p['artifacts']} inert named artifacts, including {p['helpers']} exact helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file contains no archive payload.

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public immutable archive and all four deliverables, authenticates every artifact and helper, and checks its own code against the public handoff. Keep REPLAY_DIR outside an existing repository checkout. Inspect the recovered helpers, then from that checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv (SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1). Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the base in base.txt to reproduce MathematicalVerification.json. Both bases must exist locally. The verifier runs the actual immutable checker, source-issue/intake functions and atlas assembler, and authenticates the exact inherited node objects, source and command index without executing Lean.

All 392 inherited statements and all node fields except four prerequisite lists are authenticated unchanged. The verifier binds the exact supplier-node substitutions and three new native baseline citations. The GN.1 stage bridge is retained until those supplier nodes are promoted. The API index resolves 376 distinct names but is not a complete node/signature correspondence certificate. The exact full-file typing receipt records zero errors and 820 admission warnings. Recovery and verification authenticate that receipt and source/log hashes without executing Lean. Both recovered verifier reports were reproduced before this PR was opened. The inherited Chudnovsky factorial-normalization conflict and source-decomposition gaps remain explicit for independent review.


## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text);handoff.write_text(text);suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Public recovery and verification

Archive commit `e5719961c9a0466c22cbc5b9099180bcc8730570` is an ancestor changing only this issue’s named deliverables. It holds 51 inert named artifacts, including 7 exact helpers. Manifest SHA256 `e8493122f98f3f875e46a895fef4f5523a7db2b5e84a53e290f4f90146d1f41d`; payload SHA256 `0ab9f31e674a3186da3a4ea5fcfe26477f7af8a6e70dd14494b4b601b355120b`. The final suggested file contains no archive payload.

Save the final Python fence as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the public immutable archive and all four deliverables, authenticates every artifact and helper, and checks its own code against the public handoff. Keep REPLAY_DIR outside an existing repository checkout. Inspect the recovered helpers, then from that checkout run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the pinned declarations.tsv (SHA256 86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1). Output must equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the base in base.txt to reproduce MathematicalVerification.json. Both bases must exist locally. The verifier runs the actual immutable checker, source-issue/intake functions and atlas assembler, and authenticates the exact inherited node objects, source and command index without executing Lean.

All 392 inherited statements and all node fields except four prerequisite lists are authenticated unchanged. The verifier binds the exact supplier-node substitutions and three new native baseline citations. The GN.1 stage bridge is retained until those supplier nodes are promoted. The API index resolves 376 distinct names but is not a complete node/signature correspondence certificate. The exact full-file typing receipt records zero errors and 820 admission warnings. Recovery and verification authenticate that receipt and source/log hashes without executing Lean. Both recovered verifier reports were reproduced before this PR was opened. The inherited Chudnovsky factorial-normalization conflict and source-decomposition gaps remain explicit for independent review.


## Script: recover.py

```python
"""Recover public completion evidence, authenticate artifacts, never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='DiophantineApproximationAndTranscendence'
ARCHIVE='e5719961c9a0466c22cbc5b9099180bcc8730570'
MANIFEST_SHA='e8493122f98f3f875e46a895fef4f5523a7db2b5e84a53e290f4f90146d1f41d'
PAYLOAD_SHA='0ab9f31e674a3186da3a4ea5fcfe26477f7af8a6e70dd14494b4b601b355120b'
EXPECTED={'packets': 'dabd6a505faf952bfeef73db27d44c783bf8b640be17ce33b4d5f5287370473f', 'readmes': 'bf7f210f5c195fba4952401c0cafc33dd391545ffb55f563e22277adb6406f49', 'suggested': '11098cdafa73f711dd5a246f747acac2c7cd256a75256b5138f8695845617ac0'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED PLANNING PASS COMPLETION PAYLOAD\n',1)[1].split('END ARCHIVED PLANNING PASS COMPLETION PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA;payload=json.loads(pb)
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name and name not in {'.','..'}
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(STEM+'.json')).write_bytes((S/'Candidate.json').read_bytes())
handoff=(S/'PublicHandoff.md').read_text();assert handoff.startswith((S/'HandoffBase.md').read_text())
def script(name):
 tag='\n## Script: '+name+'\n\n'+chr(96)*3+'python\n'
 a=handoff.rindex(tag)+len(tag);b=handoff.index('\n'+chr(96)*3,a)
 return handoff[a:b]+'\n'
for name in meta:
 if name.endswith('.py'):assert script(name)==(S/name).read_text(),name
code=script('recover.py');assert code==Path(__file__).read_text()
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
