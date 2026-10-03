# Function Field Arithmetic Part II — arbitrary affine root-chart base change

Codex — codex-7e92bd · 3 October 2026 · Refs #3403 · **partial checkpoint**.

The actual infinite affine root chart now has a native Cartesian base-change comparison for every unital coefficient ring map φ:A→B. Let D_A(f) be the inherited direct limit of A[t_n]/(t_n^n−f) over all positive exponents ordered by divisibility. A compatible pair of ring maps from D_A(f) and B to C induces finite maps from each B-root algebra, since the root equation is preserved. Their divisibility compatibility gives a ring map D_B(φ(f))→C. Evaluation on coefficients and roots gives both factorizations and uniqueness, yielding the actual CommRingCat pushout.

Comparing this pushout with the native tensor-product pushout produces a B-algebra equivalence B⊗_A D_A(f)≃D_B(φ(f)), with formulas on pure tensors and inverse roots. The existing native Spec theorem turns the ring pushout into a scheme pullback. Its canonical isomorphism with the categorical fibre product identifies both projections and the inverse second projection. These are actual ring, algebra and scheme maps, including structure-sheaf data. The scheme universal property applies to arbitrary test schemes in the common coefficient universe.

The21 additions are4 constructions,2 theorems and15 lemmas, with14 API entries and14 typed tests. No flatness, reducedness, nontriviality, Noetherianity, unit-section or exponent-invertibility hypothesis is imposed. Tests include transition2|6, nonfactorial index3, nilpotent coefficient2 over Z/4, the nonflat quotient Z→Z/4 killing the original nonzero coefficient4 in the tensor product, and a nonzero square-zero root over Z/2 transported to the tensor product. Zero rings and the actual scheme projections are also tested.

All469 incoming mathematical contracts are retained;468 whole node objects are byte-equivalent as JSON objects. Only the infinite-base-change parent receives three appended prerequisites and a proof step consuming this affine calculation before the separately required groupoid and descent comparison. All40 planets,10 partial stages,8 gaps and13 supplier requests remain. The general root-stack reservation still includes scheme and stack bases, every positive exponent and all characteristics in the fppf setting. Both Yun–Zhang and Abdurrahman–Venkatesh routes, source issues/versions, omission ledger and ownership remain. RS.2 and TOWER-TYPING receive current-frontier appends; historical frontiers retain their original wording. Every implementationStatus is unchecked.

## Reading and authenticated input

Read the complete19646-character issue; its body remained unchanged when bot5974005296 confirmed claim5974003995. The current five deliverables match own [PR6022](https://github.com/CBirkbeck/tauceti-explorer/pull/6022), head3c50760e4e6b1dc1b3fd51372e97549a08dcbbac, archivebaf728865a384c73a782d4b28176aaa23a41e2d5. The recovered actual verifier was executed again, and IncomingVerification.json is byte-equal to the predecessor's publication result. This verification replay did not run Lean.

All18 own PR6022 guarded inputs are unchanged. Their complete protocol, reviewed FA.0–FA.7 audit/REV-AUDIT20, parent FunctionFieldArithmetic and upstream AlgebraicCurves/JacobianChallenge readings are reused from this continuous session with the scopes recorded there. Current handoff/recovery instructions, current gaps and supplier requests, and the consumed native root/direct-limit/inclusion/coefficient proof blocks were read. The whole7367-line native prefix is authenticated and recompiled; no fresh manual audit of every inherited proof is claimed. PriorOwnReading.json, PreviousReading.json and Reading.json distinguish fresh work from reuse.

Fresh primary-source reading covered the complete displayed [Stacks §26.17](https://stacks.math.columbia.edu/tag/01JO), including the proof of the affine fibre-product Lemma26.17.2, and the complete displayed [Lemma32.2.1](https://stacks.math.columbia.edu/tag/01YW) on inverse limits of affine schemes. SourceReading.json records successful HTTP hashes and byte counts without archiving source text. Own PR6022's complete extracted Talpo–Vistoli arXiv1410.1164v2 printed pp.14–16 reading is reused. The root-specific universal maps and formulas are authored deductions. No fresh whole-paper/version audit or root-stack descent certification is claimed.

All12 new baseline references were matched to the pinned declaration index and their complete statements and applicable ambient assumptions read. Generic ring pushout construction/comparison, tensor pushouts, conversion of ring isomorphisms, Spec pullbacks and their projection laws are imported. Existing AdjoinRoot.tensorAlgEquiv already supplies generic finite algebra base change and is not replanned. Exact new-name searches in the pinned Mathlib/Tau sources and existing packets found no matches. Bounded root/base-change packet leads were inspected in the owner and related foundation/function-field suppliers; no exhaustive all-packet proof or PR/Zulip search is claimed.

## Validation and limits

Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 remain the pins. **The full canonical Tau Ceti suggested file is UNCOMPILED:** the available Tau checkout differs from the pin and lacks the four imported Tau oleans at its standard build path. The whole incoming canonical text is preserved after two added Mathlib imports. All35 new declaration/example headers match the native proof experiment and planning projection. The separately checked bounded Mathlib projection does not certify the full Tau-dependent geometric prefix.

The native proof program and bounded typing projection were compiled serially in the existing clean exact-pin Mathlib build with Lean4.34.0-rc2, at least20GiB available immediately before each run, one thread,8GiB managed-memory limit and1200-second timeout. No project, dependency/cache/library build or Lean server was started. Both compilation processes finished before submission.

- Native.lean: 7758 lines,318 examples,exit0,0 warnings (0 admissions),393 axiom audits; available41GiB,elapsed296.61s,peak RSS4183940KiB. Source SHA256 `fdf73f32fa7d9020b9ee15bd50d5365c0b2c2e3fab6db807b52b1799c6fbe1b9`; log SHA256 `7976f7e36052b7f88f4fde7654df8c1729bbbc4e1879eb28b9432655d50e08f3`.
- Sketch.lean: 6615 lines,318 examples,exit0,258 warnings (258 admissions),231 axiom audits; available41GiB,elapsed141.73s,peak RSS3937300KiB. Source SHA256 `4e4f363df5a9451e200254a4b689972841551c8f55934d7691dccaddfa10dd39`; log SHA256 `a6bd95261fcd0318b556bb6ded8e3a5323594506f90fe85b23ddd817e0357be4`.

Native.lean has no admissions or warnings. All393 audited axiom closures contain only propext, Classical.choice and Quot.sound. Sketch.lean has258 admission warnings only and retains231 clean inherited axiom audits. Exact incoming native and typing prefixes are bound to the authenticated predecessor manifest. Projection retains concrete data/carriers and admits mathematical lemma/test bodies only. The projection/header parser preserves the complete inline-let nilpotent test statement.

The actual indexed packet checker, source-issue/version checks and extracted actual intake functions pass without errors, warnings or refusals. The packet has490 nodes:13 definitions,85 constructions,44 theorems,336 lemmas,11 comparisons and1 application;392 checker API items,357 checker definition tests,276 baseline references and40 planets. No stage closes.

Raw counts are397 API entries and393 test objects. Actual immutable atlas assembly is acyclic: stage3057/8724, own declaration490/1143, scoped3652/10881 vertices/edges. All87 owned supplier paths hold, with0 touching accepted restructuring pairs. There are no owned unresolved endpoints, skipped or pending links. Every stage edge and every foreign roadmap/stage object agrees with the incoming control. The45 unrelated preexisting unreachable restructuring pairs retain hash `4101be60e5c05999c4e96d9a60d93f717851d100e0bf02c6b4bac42a630c4aa6`.

Mathematical input `73ac58557bf52b2fd4f4e7b86cd2a06603318404`; publication input `c360744b90a3a6a0f6fe7bbf4b145ca134ce126a`. All18 guarded inputs, the job contract and all5 incoming owned blobs agree at both inputs. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Verification-math.json and Verification.json record actual results.

## Resume

Consume divisibilityBaseChangeDesc and its uniqueness for arbitrary compatible ring maps, divisibilityTensorEquiv for the actual tensor comparison, and divisibilitySpecCoefficientMap.isPullback/divisibilitySpecBaseChangeIso for the Cartesian affine-chart square. Neither flatness nor a restriction to affine test schemes is needed in their stated universes.

Still construct higher-universe adapters, coherent root-object groupoid reindexing, finite-projection coherence for the general infinite root-stack base-change equivalence, the supplier TOWER-AFF fpqc frame-torsor limit, and the actual infinite quotient/descent comparison on objects and arrows. The general stack-base root reservation, finite Kummer and DVR bridges, and the all-roots-of2 non-fppf counterexample remain separate. Preserve the omission ledger, all8 gaps and13 requests and both source routes until exact geometric carriers and source-qualified proofs are supplied. An affine ring pushout alone does not establish the fpqc root-stack quotient.

Recover and replay the public evidence before extending this checkpoint. The verifier checks preserved contracts, matched headers and recorded elaboration, then runs the actual immutable checker/intake/atlas; it never runs Lean. Optional re-elaboration must obey WORKERS' existing-build, memory and serial-run requirements.

## Public evidence recovery

Archive ancestor: **cb7aed0251a41bed32755530d2b8058406fd0bde**. Manifest SHA256: **696d26be64e2772faa9fc5d69bbffa4514a78c9bdcac1e6ae207ccb203467c4e**. The inert archive contains55 authenticated artifacts and10 archived helpers. The final suggested file contains only the canonical planning text. No source paper text, PDF or repository snapshot is archived.

Save the recover.py fence below and run it with an empty disk directory and this PR's exact40-hex head. It authenticates public immutable artifacts, all five deliverables and every helper fence, and binds the archive's canonical prefix to the final suggested text. From a clone containing the recorded mathematical and publication inputs, run verify.py with the recovered directory and pinned declaration index. It executes the actual immutable packet/source/intake/atlas checks and verifies recorded compilation; it never starts Lean. Optional compilation must follow WORKERS' existing-build, memory and serial-run rules.

## Script: recover.py

```python
"""Recover immutable native root-chart base-change evidence; never runs Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE='cb7aed0251a41bed32755530d2b8058406fd0bde'
MANIFEST_SHA='696d26be64e2772faa9fc5d69bbffa4514a78c9bdcac1e6ae207ccb203467c4e'
EXPECTED={'roadmaps': 'e76cedd637c25fe3de79589508acc48223b7532a013dc532982185716c0c99bc', 'packets': '2e063f8405b152bf8d641ae91f966e5b466cd9977d67649679fee4f3b1b3db6b', 'readmes': '15035e0c58774e7bcd378f2f18f8ecafc497f6e56cfaf7b1254032a7f9647ef4', 'suggested': 'd79a273adc6bb5d7563a68a9b47ef5b92c9ab8a32c47afd18520cf63289d9127'}
HELPERS=['author.py', 'specs.py', 'assemble.py', 'verify.py', 'graph.py', 'immutable_view.py', 'projection.py', 'compile.py', 'runcheck.py', 'write_handoff.py']

sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=25)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
prefix,rest=raw.split('/- BEGIN ARCHIVED ROOT BASE CHANGE PAYLOAD\n',1)
payload=json.loads(rest.split('\nEND ARCHIVED ROOT BASE CHANGE PAYLOAD -/',1)[0])
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
assert prefix==(S/'Canonical.lean').read_text()+'\n'
public={}
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','Handoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder],path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
assert (S/'Suggested.lean').read_bytes()==(S/'Canonical.lean').read_bytes()
fence=chr(96)*3;handoff=(S/'Handoff.md').read_text()
for name in ['recover.py']+HELPERS:
 code=handoff.split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 if name=='recover.py':assert code==Path(__file__).read_text(),'Recovery helper differs from public handoff.'
 else:assert sha(code.encode())==meta[name]['sha256'],name
 (S/name).write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=len(HELPERS),publicDeliverables=public,recoverySha256=sha((S/'recover.py').read_bytes()),LeanExecuted=False)
(S/'PublicRecovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```

## Script: author.py

```python
"""Add a bounded affine base-change continuation, preserving all incoming contracts."""
from pathlib import Path
import copy,json,re,sys
S=Path(sys.argv[1]);sys.path.insert(0,str(S))
from specs import specs,apis,test_specs
RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
def read(n):return json.loads((S/n).read_text())
def save(n,v):(S/n).write_text(json.dumps(v,ensure_ascii=False,indent=2)+'\n')
p=read('Incoming-packet.json');road=read('Incoming-roadmap.json')
ids={n.get('declarationName',n.get('declaration','')).removeprefix(NS):n['id']for n in p['nodes']}
ids.update({name:RID+':RS.2/native-'+slug for slug,name,*_ in specs})
def dep(n):return n if n.startswith(('mathlib:','tauceti:'))else ids[n]
hyps=[
 'A,B,C are arbitrary commutative rings in a common arbitrary universe; f∈A and φ:A→B is a unital ring map. No flatness, nontriviality, reducedness, Noetherianity, unit-section or invertibility-of-exponent assumption is made.',
 'D_A(f) is the existing direct limit of actual AdjoinRoot algebras A[t_n]/(t_n^n−f) indexed by all positive exponents under divisibility. κ_n denotes its actual finite inclusion; F_φ is the inherited coefficient map. Tensor statements use the actual A-algebra structure on B and φ=algebraMap A B.',
 'The finite/universal lift constructions assume actual ring maps α:D_A(f)→C and β:B→C satisfying α(algebraMap A D_A(f) a)=β(φ(a)) for all a. Scheme pullback statements apply to arbitrary test schemes in this universe. Higher-universe transport, coherent root-object groupoids and fpqc stack descent remain separate obligations.']
sid='RootChartBaseChange-codex-7e92bd'
src=[dict(sourceId=sid,locator='Stacks Project §26.17, Lemma26.17.2 (tag01JO), affine fibre products and the tensor-product universal property; authored rank-one root-colimit deduction.',excerpt='Fibre products of schemes',match='The cited complete proof supplies the native geometric interpretation of ring pushouts. The root-specific universal map is deduced from the existing finite root equations and their divisibility compatibility. No fpqc root-stack comparison is inferred.'),dict(sourceId='TV17',locator='§3.1 printed p.14 inverse-limit description; Proposition3.10 pp.15–16 delimits the separate quotient-stack use.',excerpt='projective limit',match='Uses the inherited all-positive-index affine chart. The tensor and native scheme comparison laws here are authored deductions, not a claim that these exact Lean API statements occur in the paper.')]
nodes=[]
for slug,name,kind,title,statement,deps,proof in specs:
 nodes.append(dict(id=ids[name],parentStageId=RID+':RS.2',realises=[RID+':RS.2'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=hyps,prerequisites=[dep(d)for d in deps],proofSteps=[proof],acceptance=[statement,'Retain actual ring maps, tensor products and native scheme morphisms, including structure-sheaf data, nonflat coefficients and nilpotents.'],api=[],tests=[],uses=[dict(where=RID+':RS.2/infinite-base-change',how='Supplies the rank-one affine-chart Cartesian base-change calculation. Coherent root-object comparisons and their finite-stage and fpqc descent laws are independently required for the infinite root-stack statement.'),dict(where=RID+':RS.2/infinite-affine-quotient',how='Makes the affine root chart compatible with arbitrary change of coefficient ring before the separately required frame-torsor and quotient-groupoid comparisons.')],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS2',namespace='TauCeti.RootStack'),sources=src,implementationStatus='unchecked'))
nd={n['declarationName'].removeprefix(NS):n for n in nodes}
for name,items in apis.items():nd[name]['api']=[dict(name=NS+a,role='universal-property'if a.endswith('.unique')else'compatibility',statement=nd[a]['statement'])for a in items]
tests=[dict(name=NS+n+'.test_'+t,kind=k,statement=v)for n,t,k,v in test_specs]
for name in apis:nd[name]['tests']=[t for t in tests if t['name'].startswith(NS+name+'.test_')]
index={x.split('\t')[1]:x.split('\t')for x in Path(sys.argv[2]).read_text().splitlines()if x.startswith('mathlib\t')}
newrefs=[];oldrefs={b['ref']for b in p['baseline']['declarations']}
for ref in dict.fromkeys(d for n in nodes for d in n['prerequisites']if d.startswith('mathlib:')):
 if ref in oldrefs:continue
 n=ref.removeprefix('mathlib:');row=index[n];newrefs.append(ref)
 p['baseline']['declarations'].append(dict(ref=ref,kind=row[2],module=row[3],provides='Native '+n+' used for the root-specific ring pushout, tensor comparison or scheme pullback.',checked='Complete statement and applicable ambient assumptions read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; indexed declaration at line'+row[4]+'.'))
frontier='The arbitrary coefficient base-change square of the actual positive-divisibility affine root chart now has a native ring pushout and scheme pullback witness. Its concrete B-algebra tensor equivalence B⊗_A D_A(f)≃D_B(φ(f)) identifies pure tensors and inverse roots; its actual categorical scheme isomorphism identifies both projections. Flatness is not assumed and nilpotents are retained. Coherent root-object groupoid reindexing, higher-universe transport, finite-projection coherence for the general stack comparison, fpqc frame torsors and the infinite quotient/DVR/Kummer routes remain open. All ten stages, eight gaps and thirteen supplier requests remain partial or open.'
p['nodes']+=nodes
parent=next(n for n in p['nodes']if n['id']==RID+':RS.2/infinite-base-change')
parent['prerequisites'] += [ids[x]for x in ['divisibilityTensorEquiv','divisibilitySpecBaseChangeIso.fst','divisibilitySpecBaseChangeIso.snd']]
parent['proofSteps'].append('For the rank-one affine chart, use the actual arbitrary-ring-map pushout and the native scheme base-change isomorphism, with both projections and the tensor root/coefficient formulas. Then separately construct coherent componentwise root-object equivalences, finite-projection coherence and fpqc descent to obtain the stated root-stack comparison on general bases.')
p['summary']+=' Native affine base-change continuation:21 declarations,14 API entries and14 typed tests specify the actual ring pushout, tensor equivalence and Cartesian scheme comparison.'
for c in p['coverage']:
 if c['stageId']==RID+':RS.2':c['remaining'].append('Current continuation frontier, superseding historical affine Cartesian base-change omissions above: '+frontier)
for g in p['gaps']:
 if g['id']=='TOWER-TYPING':g['detail']+=' The arbitrary affine-chart coefficient square now has an explicit native ring pushout, tensor equivalence and categorical scheme pullback with both projections. This discharges the affine Cartesian comparison only; higher-universe, coherent root-groupoid and TOWER-AFF fpqc obligations remain open.'
for stage in road['stages']:
 if stage['key']=='RS.2':stage['description']+=' '+frontier
source=read('SourceReading.json')[1]
p['sources'].append(dict(id=sid,title='Affine fibre products and root-colimit base change; authored deduction from Stacks §26.17',authors='The Stacks Project Authors; root-specific deductions by Codex — codex-7e92bd',edition='Displayed online text, accessed3 October2026',url=source['url'],sha256=source['sha256'],accessed='2026-10-03',readSections=['Complete displayed §26.17 and proofs freshly read, including Lemma26.17.2 on affine fibre products. Stacks Lemma32.2.1 tag01YW was also read in full as inverse-limit context; source and HTTP receipts are separate.']))
save('Candidate.json',p);save(RID+'.json',p);save('Candidate-roadmap.json',road);save('new-nodes.json',nodes);save('new-tests.json',tests)
save('Plan.json',dict(newNodes=[n['id']for n in nodes],newNames=[n['declarationName']for n in nodes],newBaselineRefs=newrefs,newApi=sum(len(n['api'])for n in nodes),newTests=len(tests),frontier=frontier,parentAmended=parent['id']))
intro='''# Arbitrary base change of infinite affine root charts

Fix any commutative ring A, f∈A and a unital ring map φ:A→B. Write D_A(f) for the inherited direct limit of A[t_n]/(t_n^n−f) over all positive exponents, ordered by divisibility. The existing coefficient map F_φ sends every coefficient and every compatible root to its counterpart over B.

The coefficient square is now proved to be a pushout of actual commutative rings. For a compatible pair α:D_A(f)→C and β:B→C, the finite root equation constructs a map from every B-root algebra to C. Compatibility with divisibility transitions produces a map δ:D_B(φ(f))→C. Its coefficient and root formulas give both factorizations, and ring-map extensionality gives uniqueness. No flatness assumption is used.

Comparing this pushout with Mathlib's tensor-product pushout gives the actual B-algebra equivalence B⊗_A D_A(f)≃D_B(φ(f)), sending b⊗x to b·F_φ(x). Its inverse sends each positive-index root to1⊗ the corresponding original root. The native Spec pushout theorem gives a pullback of schemes, and the canonical comparison is a scheme isomorphism with the categorical fibre product. Both projections are identified as actual scheme morphisms. This universal property includes nonaffine test schemes in the fixed coefficient universe.

Fourteen tests cover nonfactorial index3, transition2|6, a nilpotent coefficient in Z/4, wild characteristic2, and zero rings. Under Z→Z/4, the nonzero original coefficient4 becomes zero in the tensor product. Conversely, the square-zero root over Z/2 remains nonzero in the tensor product under the comparison. These tests distinguish arbitrary base change from injectivity or reduction.

Stacks §26.17, including the entire affine fibre-product proof, was freshly read. Stacks Lemma32.2.1 was also read in full for inverse-limit context. The root-specific universal maps are authored deductions from the inherited root equations. Own PR6022's Talpo–Vistoli printed pp.14–16 reading is reused unchanged; no fresh whole-paper audit is claimed.

All469 incoming mathematical contracts remain;468 whole node objects are identical. Only the infinite-base-change parent receives appended prerequisites and a proof step. The root-stack theorem for general bases still requires its own coherent groupoid and fpqc descent comparisons. Historical frontier sections below remain as their authors recorded them; this opening states the current affine-chart frontier.

'''+frontier+'\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for k in ['api','tests']:
  if n[k]:parts+=[k.upper()+':\n\n']+['- **'+v['name']+'**: '+v['statement']+'\n'for v in n[k]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'Incoming-reader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),newApi=sum(len(n['api'])for n in nodes),newTests=len(tests),baseline=len(p['baseline']['declarations']))))
```

## Script: specs.py

```python
"""Root-specific affine base-change contracts, rather than generic pushout foundations."""
specs=[
('ring-hom-ext','divisibilityAffineColimit.ringHom_ext','lemma','Root-colimit ring-map extensionality',
 'For ring maps g,h:D_A(f)→C, equality on every coefficient a∈A and every positive-index root κ_n(t_n) implies g=h. C need not carry a specified A-algebra structure.',
 ['DivisibilityAffineColimit','divisibilityAffineInclusion','mathlib:DirectLimit.Ring.hom_ext','mathlib:AdjoinRoot.ringHom_ext'],
 'Apply native direct-limit ring-map extensionality. At each finite chart, AdjoinRoot ring-map extensionality reduces equality to the coefficient and root hypotheses; the actual inclusions preserve coefficients.'),
('base-change-level','divisibilityBaseChangeLevel','construction','Finite root map from compatible coefficient data',
 'For α:D_A(f)→C and β:B→C with α(a)=β(φ(a)) for every a∈A, construct L_n:B[t_n]/(t_n^n−φ(f))→C with t_n↦α(κ_n(t_n)) and coefficient map β, at every positive n.',
 ['divisibilityAffineInclusion.pow','mathlib:AdjoinRoot.lift'],
 'Use the native AdjoinRoot lift. The image of the root polynomial vanishes because κ_n(t_n)^n=f, α preserves powers, and the compatibility hypothesis identifies α(f) with β(φ(f)).'),
('base-change-level-root','divisibilityBaseChangeLevel.root','lemma','Finite base-change root formula',
 'L_n(t_n)=α(κ_n(t_n)) for every positive n.',
 ['divisibilityBaseChangeLevel'],
 'Evaluate the actual AdjoinRoot lift on its distinguished root using the native lift-root law.'),
('base-change-level-constant','divisibilityBaseChangeLevel.constant','lemma','Finite base-change coefficient formula',
 'L_n(b)=β(b) for every b∈B and every positive n, where b is included through the actual coefficient algebra map.',
 ['divisibilityBaseChangeLevel'],
 'Identify the native AdjoinRoot algebra map with its coefficient ring map and apply the lift-on-coefficients law.'),
('base-change-level-transition','divisibilityBaseChangeLevel.transition','lemma','Compatibility with positive divisibility',
 'If n divides N, L_N composed with the actual root transition B(n)→B(N), t_n↦t_N^(N/n), equals L_n as a ring map.',
 ['divisibilityBaseChangeLevel.root','divisibilityBaseChangeLevel.constant','affineDivisibility.root','divisibilityAffineInclusion.root','mathlib:AdjoinRoot.ringHom_ext'],
 'Compare the ring maps on coefficients and the root. Coefficients give β on both sides. On the root, preservation of powers and the inherited inclusion transition identify α(κ_N(t_N)^(N/n)) with α(κ_n(t_n)).'),
('base-change-desc','divisibilityBaseChangeDesc','construction','Universal map from the base-changed root colimit',
 'For compatible α:D_A(f)→C and β:B→C, construct δ:D_B(φ(f))→C from the finite maps L_n, for arbitrary commutative C in the coefficient universe.',
 ['divisibilityBaseChangeLevel.transition','mathlib:DirectLimit.Ring.lift'],
 'Apply the native direct-limit ring lift to the concrete family L_n. The preceding equality of ring maps supplies elementwise compatibility for every divisibility arrow.'),
('base-change-desc-level','divisibilityBaseChangeDesc.level','lemma','Universal map at every finite chart',
 'For x in the actual n-th root algebra over B, δ(κ_n(x))=L_n(x).',
 ['divisibilityBaseChangeDesc','divisibilityAffineInclusion'],
 'Evaluate the actual direct-limit ring lift on a finite inclusion. The displayed formula is definitional for the inherited direct-limit carrier.'),
('base-change-desc-constant','divisibilityBaseChangeDesc.constant','lemma','Universal map on coefficients',
 'For every b∈B, δ(b)=β(b) under the actual coefficient inclusion B→D_B(φ(f)).',
 ['divisibilityBaseChangeDesc.level','divisibilityBaseChangeLevel.constant'],
 'Express the coefficient through the positive index1 inclusion using its algebra-map law, evaluate δ at that finite level, and use the finite coefficient formula.'),
('base-change-desc-root','divisibilityBaseChangeDesc.root','lemma','Universal map on all positive roots',
 'For every positive n, δ(κ_n(t_n))=α(κ_n(t_n)), with the left root over B and the right root over A.',
 ['divisibilityBaseChangeDesc.level','divisibilityBaseChangeLevel.root'],
 'Specialize evaluation at a finite chart to its distinguished root and use the finite root formula.'),
('base-change-desc-coefficient','divisibilityBaseChangeDesc.coefficient','lemma','Factorization of the inherited coefficient map',
 'δ composed with F_φ:D_A(f)→D_B(φ(f)), the existing coefficient ring map, equals α.',
 ['divisibilityBaseChangeDesc.constant','divisibilityBaseChangeDesc.root','divisibilityCoefficientMap.constant','divisibilityCoefficientMap.root','divisibilityAffineColimit.ringHom_ext'],
 'Use root-colimit ring-map extensionality. On A-coefficients, use the given compatibility of α and β; on every root, combine the existing coefficient-root formula with the new universal-root formula.'),
('base-change-desc-unique','divisibilityBaseChangeDesc.unique','lemma','Uniqueness of the base-change universal map',
 'A ring map g:D_B(φ(f))→C with g(b)=β(b) for every b∈B and g∘F_φ=α equals δ.',
 ['divisibilityBaseChangeDesc.constant','divisibilityBaseChangeDesc.root','divisibilityCoefficientMap.root','divisibilityAffineColimit.ringHom_ext'],
 'Compare g and δ on B-coefficients and every positive root. Apply the factorization equality g∘F_φ=α to each original root and use the inherited coefficient-root formula.'),
('base-change-pushout','divisibilityBaseChangeIsPushout','theorem','Arbitrary base change as a ring pushout',
 'The actual square A→B, A→D_A(f), B→D_B(φ(f)), D_A(f)→D_B(φ(f)) is a pushout in native CommRingCat for every unital φ:A→B.',
 ['divisibilityCoefficientMap.constant','divisibilityBaseChangeDesc','divisibilityBaseChangeDesc.constant','divisibilityBaseChangeDesc.coefficient','divisibilityBaseChangeDesc.unique','mathlib:CategoryTheory.Limits.PushoutCocone.IsColimit.mk','mathlib:CategoryTheory.IsPushout.of_isColimit'],
 'The inherited coefficient formula proves the square commutes. For an arbitrary native pushout cocone, take α and β to be its right and left ring maps. Its cocone equation supplies compatibility, δ supplies descent, the two factorization laws give both legs, and uniqueness gives the native IsColimit witness.'),
('base-change-pullback','divisibilitySpecCoefficientMap.isPullback','theorem','Cartesian base-change square of infinite affine charts',
 'The square Spec D_B(φ(f))→Spec B, Spec D_B(φ(f))→Spec D_A(f), Spec B→Spec A, Spec D_A(f)→Spec A is a pullback in the native category Scheme, for every φ.',
 ['divisibilityBaseChangeIsPushout','divisibilitySpecCoefficientMap','mathlib:AlgebraicGeometry.isPullback_SpecMap_of_isPushout'],
 'Apply the pinned native theorem sending commutative-ring pushouts to scheme pullbacks to the actual root-specific ring square. Its universal property ranges over arbitrary test schemes, not just affine schemes or their points.'),
('base-change-tensor-equivalence','divisibilityTensorEquiv','construction','Tensor description of the base-changed root algebra',
 'Given an A-algebra B, construct the native B-algebra equivalence E:B⊗_A D_A(f)≃D_B(φ(f)), where φ is the actual algebra map A→B.',
 ['divisibilityBaseChangeIsPushout','mathlib:CommRingCat.isPushout_tensorProduct','mathlib:CategoryTheory.IsPushout.isoIsPushout','mathlib:CategoryTheory.IsPushout.inl_isoIsPushout_hom','mathlib:CategoryTheory.Iso.commRingCatIsoToRingEquiv'],
 'Compare the native tensor-product ring pushout with the proved root-colimit pushout using uniqueness of colimits. Convert the resulting native ring isomorphism to a ring equivalence; its left-leg formula proves B-algebra compatibility.'),
('base-change-tensor-right','divisibilityTensorEquiv.right','lemma','Tensor comparison on the original root algebra',
 'For every x∈D_A(f), E(1⊗x)=F_φ(x).',
 ['divisibilityTensorEquiv','mathlib:CategoryTheory.IsPushout.inr_isoIsPushout_hom'],
 'Evaluate the native right-leg identity of the pushout comparison at x. The tensor right leg is the actual map x↦1⊗x.'),
('base-change-tensor-pure','divisibilityTensorEquiv.tmul','lemma','Tensor comparison on pure tensors',
 'For every b∈B and x∈D_A(f), E(b⊗x)=b·F_φ(x), where the coefficient b is included in D_B(φ(f)).',
 ['divisibilityTensorEquiv.right','mathlib:Algebra.TensorProduct.algebraMap_apply'],
 'Write b⊗x as the B-coefficient b times 1⊗x inside the actual tensor algebra. Apply multiplicativity, B-algebra compatibility and the right-leg formula.'),
('base-change-tensor-inverse-root','divisibilityTensorEquiv.inverse_root','lemma','Inverse tensor comparison on roots',
 'For every positive n, E⁻¹(κ_n(t_n))=1⊗κ_n(t_n), with the left root over B and the right root over A.',
 ['divisibilityTensorEquiv.right','divisibilityCoefficientMap.root'],
 'Apply injectivity of E. Its inverse law simplifies the left side; the right-leg and coefficient-root formulas identify the right side with the same root.'),
('base-change-scheme-iso','divisibilitySpecBaseChangeIso','construction','Infinite affine chart as the actual categorical base change',
 'For arbitrary φ:A→B, construct a native scheme isomorphism Spec D_B(φ(f))≅Spec B×_(Spec A)Spec D_A(f), with the right side the actual categorical pullback.',
 ['divisibilitySpecCoefficientMap.isPullback','mathlib:CategoryTheory.IsPullback.isoPullback'],
 'Use the canonical native isomorphism from the proved root-specific pullback cone to the selected categorical pullback. The ring maps and resulting structure-sheaf maps are retained.'),
('base-change-scheme-first','divisibilitySpecBaseChangeIso.fst','lemma','First projection of the affine base-change comparison',
 'The scheme comparison followed by the pullback first projection equals the actual structural morphism Spec D_B(φ(f))→Spec B.',
 ['divisibilitySpecBaseChangeIso','mathlib:CategoryTheory.IsPullback.isoPullback_hom_fst'],
 'Apply the first-leg identity of the native pullback comparison to the proved root-chart pullback square.'),
('base-change-scheme-second','divisibilitySpecBaseChangeIso.snd','lemma','Second projection of the affine base-change comparison',
 'The scheme comparison followed by the pullback second projection equals the existing coefficient morphism Spec D_B(φ(f))→Spec D_A(f).',
 ['divisibilitySpecBaseChangeIso','mathlib:CategoryTheory.IsPullback.isoPullback_hom_snd'],
 'Apply the second-leg identity of the native pullback comparison; the leg is the actual inherited Spec map of F_φ.'),
('base-change-scheme-inverse-second','divisibilitySpecBaseChangeIso.inverse_snd','lemma','Inverse comparison and the original chart projection',
 'The inverse scheme comparison followed by the coefficient morphism equals the pullback second projection to Spec D_A(f).',
 ['divisibilitySpecBaseChangeIso','mathlib:CategoryTheory.IsPullback.isoPullback_inv_snd'],
 'Use the native inverse second-leg identity, equivalently cancel the actual scheme isomorphism in the forward second-projection equation.')]

apis={
 'divisibilityBaseChangeLevel':['divisibilityBaseChangeLevel.root','divisibilityBaseChangeLevel.constant','divisibilityBaseChangeLevel.transition'],
 'divisibilityBaseChangeDesc':['divisibilityBaseChangeDesc.level','divisibilityBaseChangeDesc.constant','divisibilityBaseChangeDesc.root','divisibilityBaseChangeDesc.coefficient','divisibilityBaseChangeDesc.unique'],
 'divisibilityTensorEquiv':['divisibilityTensorEquiv.right','divisibilityTensorEquiv.tmul','divisibilityTensorEquiv.inverse_root'],
 'divisibilitySpecBaseChangeIso':['divisibilitySpecBaseChangeIso.fst','divisibilitySpecBaseChangeIso.snd','divisibilitySpecBaseChangeIso.inverse_snd']}

test_specs=[
 ('divisibilityBaseChangeLevel','nilpotent_constant','computation','Over Z/4 at f=2 and nonfactorial index3, the finite universal map preserves the actual nilpotent coefficient2.'),
 ('divisibilityBaseChangeLevel','wild_root','degenerate','Over Z/2 at f=0 and n=2, the image of the actual root under the finite universal map has square zero.'),
 ('divisibilityBaseChangeLevel','two_six','compatibility','For arbitrary compatible α and β, the level6 image of t_6³ equals the level2 image of t_2.'),
 ('divisibilityBaseChangeDesc','nonflat_identity','compatibility','For Z→Z/4 at f=2, descent from the actual coefficient map and B-inclusion is the identity on every element of D_B(2).'),
 ('divisibilityBaseChangeDesc','polynomial','computation','For arbitrary compatible α and β, descent sends the actual third root plus coefficient b to α of the third root plus β(b).'),
 ('divisibilityBaseChangeDesc','zero_target','degenerate','For a compatible cocone with target Z/1, the actual descent map sends every colimit element to zero.'),
 ('divisibilityTensorEquiv','nonflat_killed_constant','non-example','The coefficient4 is nonzero in D_Z(2), while its pure tensor1⊗4 over Z/4 is zero. Tensor base-change equivalence does not assert injectivity of the original coefficient map.'),
 ('divisibilityTensorEquiv','nonzero_nilpotent','degenerate','Over Z/2 at f=0, the inverse tensor image of the degree2 root is nonzero and has square zero; the wild nilpotent is retained in the actual tensor algebra.'),
 ('divisibilityTensorEquiv','third_root','computation','For Z→Z/4 at f=2 and index3, the inverse comparison carries the actual B-root to1⊗ the actual Z-root.'),
 ('divisibilityTensorEquiv','zero_ring','degenerate','With B=Z/1 and A=Z, every tensor maps to zero in the actual base-changed root colimit.'),
 ('divisibilitySpecBaseChangeIso','nonflat_pullback','compatibility','For the nonflat quotient Z→Z/4 and f=2, the four actual structural/coefficient scheme maps form a native IsPullback square.'),
 ('divisibilitySpecBaseChangeIso','first_projection','computation','For Z→Z/4 and f=2, the first categorical projection after the scheme comparison is the actual structural map to Spec Z/4.'),
 ('divisibilitySpecBaseChangeIso','wild_projection','compatibility','For Z→Z/2 and f=0, the second categorical projection after the scheme comparison is the actual coefficient scheme morphism.'),
 ('divisibilitySpecBaseChangeIso','zero_ring_inverse','degenerate','For Z→Z/1 and f=0, the actual scheme comparison followed by its inverse is the identity, including the empty-chart case.')]
```

## Script: assemble.py

```python
"""Preserve authenticated incoming texts and append matched native/planning tails."""
from pathlib import Path
import re
from projection import project
S=Path(__file__).resolve().parent
def txt(n):return (S/n).read_text()
proofs=txt('NewProofs.lean')+'\n'+txt('Comparisons.lean')
admitted=project(proofs,txt('NewTests.lean'))
(S/'NewAdmitted.lean').write_text(admitted)
for out,prefix in [('Canonical.lean','Incoming-suggested.lean'),('Sketch.lean','IncomingSketch.lean')]:
 (S/out).write_text(txt('NewImports.lean')+txt(prefix)+'\n'+admitted)
(S/'Suggested.lean').write_bytes((S/'Canonical.lean').read_bytes())
audits=''.join('#print axioms TauCeti.RootStack.'+n+'\n' for n in re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',proofs,re.M))
assert txt('NewAudits.lean')==audits
native=txt('NewImports.lean')+txt('IncomingNative.lean')+'\n'+proofs+'\n'+txt('NewTests.lean')+'\n'+audits
assert txt('Native.lean')==native
print('Assembled full canonical text and bounded Mathlib typing projection.')
```

## Script: verify.py

```python
"""Replay contracts, recorded elaboration, and actual immutable checker/intake/atlas; no Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S));RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOTS_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
names=['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','Handoff.md'];contents={p:txt(n)for p,n in zip(paths,names)}
for p,n in zip(paths,['Incoming-roadmap.json','Incoming-packet.json','Incoming-reader.md','Incoming-suggested.lean','Incoming-handoff.md']):
 assert blob(MATH,p)==(S/n).read_bytes()==blob(BASE,p),p
p=data('Candidate.json');old=data('Incoming-packet.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==469 and len(p['nodes'])==490 and p['nodes'][469:]==data('new-nodes.json')
unchanged=0
for a,b in zip(old['nodes'],p['nodes']):
 if a['id']==plan['parentAmended']:
  assert all(a[k]==b[k]for k in a if k not in ['prerequisites','proofSteps'])
  assert b['prerequisites'][:len(a['prerequisites'])]==a['prerequisites']and len(b['prerequisites'])==len(a['prerequisites'])+3
  assert b['proofSteps'][:-1]==a['proofSteps']
 else:assert a==b;unchanged+=1
assert unchanged==468 and set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps']:assert p[k]==old[k],k
assert p['sources'][:-1]==old['sources'] and p['summary'].startswith(old['summary'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:264]==old['baseline']['declarations']
assert [d['ref']for d in p['baseline']['declarations'][264:]]==plan['newBaselineRefs']and len(plan['newBaselineRefs'])==12
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==13 and len(p['gaps'])==8 and len(p['coverage'])==10
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':RS.2':assert b['remaining'][:-1]==a['remaining']and {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
for a,b in zip(old['gaps'],p['gaps']):
 if a['id']=='TOWER-TYPING':assert b['detail'].startswith(a['detail'])and {k:v for k,v in a.items()if k!='detail'}=={k:v for k,v in b.items()if k!='detail'}
 else:assert a==b
assert {k:v for k,v in road.items()if k!='stages'}=={k:v for k,v in oldroad.items()if k!='stages'}
for a,b in zip(oldroad['stages'],road['stages']):
 if a['key']=='RS.2':assert b['description']==a['description']+' '+plan['frontier']and {k:v for k,v in a.items()if k!='description'}=={k:v for k,v in b.items()if k!='description'}
 else:assert a==b
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('Incoming-reader.md')
from projection import project
assert txt('NewAdmitted.lean')==project(txt('NewProofs.lean')+'\n'+txt('Comparisons.lean'),txt('NewTests.lean'))
assert txt('Canonical.lean')==txt('NewImports.lean')+txt('Incoming-suggested.lean')+'\n'+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert txt('Sketch.lean')==txt('NewImports.lean')+txt('IncomingSketch.lean')+'\n'+txt('NewAdmitted.lean')
for target,source in [('IncomingNative.lean','Native.lean'),('Incoming-suggested.lean','Canonical.lean'),('IncomingSketch.lean','Sketch.lean')]:
 assert sha((S/target).read_bytes())==data('PreviousManifest.json')[source]['sha256']
assert sha((S/'PreviousManifest.json').read_bytes())=='d79022c8ec762aa07a6cb9eb47a1a90dd5d9a26e0ff803b43e01702bf6aa31b9'
assert txt('IncomingVerification.json')==txt('PreviousVerification.json')
assert sha((S/'IncomingVerification.json').read_bytes())==data('PreviousManifest.json')['Verification.json']['sha256']
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
assert txt('Native.lean')==txt('NewImports.lean')+txt('IncomingNative.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('Comparisons.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('NewAudits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
def headers(text):
 found={}
 for m in re.finditer(r'^(def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   line=text[m.start():i].rsplit('\n',1)[-1]
   let_assignment=re.match(r'\s*(?:example\s*:\s*)?let\b',line) and ':=' not in line
   if depth==0 and text.startswith(':=',i)and not let_assignment:end=i;break
   if depth==0 and m.group(1)=='def'and text.startswith('where',i)and text[i-1].isspace()and text[i+5].isspace():end=i;break
  assert end is not None
  label=m.group(2)if m.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(text[m.start():end].split())
 return found
nh=headers(txt('NewProofs.lean')+'\n'+txt('Comparisons.lean'));nt=headers(txt('NewTests.lean'));ch=headers(txt('NewAdmitted.lean'));assert {**nh,**nt}==ch
assert all(':= by' not in h for h in ch.values()),'A proof body was incorrectly included in a new declaration header.'
assert len(nh)==21 and len(nt)==14
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][469:]}
assert {t['name']for t in data('new-tests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][469:]:
 assert n['declarationName']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n.get('api',[])+n.get('tests',[]):assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][469:])==14 and sum(len(n['tests'])for n in p['nodes'][469:])==14
compilation={}
for name,want,ex,audits in [('Native',0,318,393),('Sketch',258,318,231)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 assert len(re.findall(r'^example\b',txt(name+'.lean'),re.M))==ex
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':ex}
assert set(plan['newNames'])<={n for n in re.findall(r"'([^']+)' depends on axioms:",txt('Native.log'))}
for g in data('InputGuard.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
for qbase in [MATH,BASE]:
 jq=json.loads(blob(qbase,'research/blueprint/queue.json'));own=next(j for j in jq['jobs']if j['id']=='DESIGN-'+RID)
 contract={k:v for k,v in own.items()if k not in ['state','note']}
 if qbase==MATH:own_original=contract
 else:assert contract==own_original
if (S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,text in contents.items():
 assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',text),path
 assert not re.search(r'[ \t]+$',text,re.M),path
os.environ['ROOTS_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in contents.items():immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(RID+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
summary['packet']=paths[1]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='DESIGN-'+RID)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOTS_VALIDATE_BASE':BASE}))
assert graph['worldCommit']==BASE
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=468,incomingMathematicalContractsPreserved=469,newNodes=21,newAPIItems=14,newTests=14,matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at the exact pin; exact canonical prefix preserved after two imports.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'));import build,blueprints,check_blueprint
RID='FunctionFieldArithmeticPartII';FILES=['research/blueprint/'+f+'/'+('DESIGN-' if f=='handoff' else '')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
p=json.loads((S/'Candidate.json').read_text());old=json.loads((S/'Incoming-packet.json').read_text());rd=json.loads((S/'Candidate-roadmap.json').read_text());rold=json.loads((S/'Incoming-roadmap.json').read_text());nodes={n['id']:n for n in p['nodes']}
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
BASE = os.environ.get('ROOTS_VALIDATE_BASE', 'f6213b8004ec27a5c3f7f45b1947112569e1cb0c')
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

## Script: projection.py

```python
"""Keep concrete carriers, maps and components; admit mathematical proofs only."""
import re

def admit_lemmas(text):
    lines=text.splitlines(keepends=True);out=[];i=0
    while i<len(lines):
        if re.match(r'^(?:lemma|theorem) |^example\b',lines[i]):
            j=i+1
            while j<len(lines) and (not lines[j].strip() or lines[j][0].isspace()):j+=1
            block=''.join(lines[i:j]);depth=0;pos=None
            for k,c in enumerate(block):
                if c in '([{':depth+=1
                elif c in ')]}':depth-=1
                line=block[:k].rsplit('\n',1)[-1]
                let_assignment=re.match(r'\s*(?:example\s*:\s*)?let\b',line) and ':=' not in line
                if block[k:k+2]==':=' and depth==0 and not let_assignment:pos=k;break
            assert pos is not None
            out.append(block[:pos]+':= by\n  sorry\n\n');i=j
        else:out.append(lines[i]);i+=1
    return ''.join(out)

def project(proofs,tests):
    return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)
```

## Script: compile.py

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

## Script: runcheck.py

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

## Script: write_handoff.py

```python
"""Write an evidence-bounded handoff after the actual verification succeeds."""
from pathlib import Path
import json
S=Path(__file__).resolve().parent
v=json.loads((S/'Verification.json').read_text());g=v['graph'];c=v['checker']
h='''# Function Field Arithmetic Part II — arbitrary affine root-chart base change

Codex — codex-7e92bd · 3 October 2026 · Refs #3403 · **partial checkpoint**.

The actual infinite affine root chart now has a native Cartesian base-change comparison for every unital coefficient ring map φ:A→B. Let D_A(f) be the inherited direct limit of A[t_n]/(t_n^n−f) over all positive exponents ordered by divisibility. A compatible pair of ring maps from D_A(f) and B to C induces finite maps from each B-root algebra, since the root equation is preserved. Their divisibility compatibility gives a ring map D_B(φ(f))→C. Evaluation on coefficients and roots gives both factorizations and uniqueness, yielding the actual CommRingCat pushout.

Comparing this pushout with the native tensor-product pushout produces a B-algebra equivalence B⊗_A D_A(f)≃D_B(φ(f)), with formulas on pure tensors and inverse roots. The existing native Spec theorem turns the ring pushout into a scheme pullback. Its canonical isomorphism with the categorical fibre product identifies both projections and the inverse second projection. These are actual ring, algebra and scheme maps, including structure-sheaf data. The scheme universal property applies to arbitrary test schemes in the common coefficient universe.

The21 additions are4 constructions,2 theorems and15 lemmas, with14 API entries and14 typed tests. No flatness, reducedness, nontriviality, Noetherianity, unit-section or exponent-invertibility hypothesis is imposed. Tests include transition2|6, nonfactorial index3, nilpotent coefficient2 over Z/4, the nonflat quotient Z→Z/4 killing the original nonzero coefficient4 in the tensor product, and a nonzero square-zero root over Z/2 transported to the tensor product. Zero rings and the actual scheme projections are also tested.

All469 incoming mathematical contracts are retained;468 whole node objects are byte-equivalent as JSON objects. Only the infinite-base-change parent receives three appended prerequisites and a proof step consuming this affine calculation before the separately required groupoid and descent comparison. All40 planets,10 partial stages,8 gaps and13 supplier requests remain. The general root-stack reservation still includes scheme and stack bases, every positive exponent and all characteristics in the fppf setting. Both Yun–Zhang and Abdurrahman–Venkatesh routes, source issues/versions, omission ledger and ownership remain. RS.2 and TOWER-TYPING receive current-frontier appends; historical frontiers retain their original wording. Every implementationStatus is unchecked.

## Reading and authenticated input

Read the complete19646-character issue; its body remained unchanged when bot5974005296 confirmed claim5974003995. The current five deliverables match own [PR6022](https://github.com/CBirkbeck/tauceti-explorer/pull/6022), head3c50760e4e6b1dc1b3fd51372e97549a08dcbbac, archivebaf728865a384c73a782d4b28176aaa23a41e2d5. The recovered actual verifier was executed again, and IncomingVerification.json is byte-equal to the predecessor's publication result. This verification replay did not run Lean.

All18 own PR6022 guarded inputs are unchanged. Their complete protocol, reviewed FA.0–FA.7 audit/REV-AUDIT20, parent FunctionFieldArithmetic and upstream AlgebraicCurves/JacobianChallenge readings are reused from this continuous session with the scopes recorded there. Current handoff/recovery instructions, current gaps and supplier requests, and the consumed native root/direct-limit/inclusion/coefficient proof blocks were read. The whole7367-line native prefix is authenticated and recompiled; no fresh manual audit of every inherited proof is claimed. PriorOwnReading.json, PreviousReading.json and Reading.json distinguish fresh work from reuse.

Fresh primary-source reading covered the complete displayed [Stacks §26.17](https://stacks.math.columbia.edu/tag/01JO), including the proof of the affine fibre-product Lemma26.17.2, and the complete displayed [Lemma32.2.1](https://stacks.math.columbia.edu/tag/01YW) on inverse limits of affine schemes. SourceReading.json records successful HTTP hashes and byte counts without archiving source text. Own PR6022's complete extracted Talpo–Vistoli arXiv1410.1164v2 printed pp.14–16 reading is reused. The root-specific universal maps and formulas are authored deductions. No fresh whole-paper/version audit or root-stack descent certification is claimed.

All12 new baseline references were matched to the pinned declaration index and their complete statements and applicable ambient assumptions read. Generic ring pushout construction/comparison, tensor pushouts, conversion of ring isomorphisms, Spec pullbacks and their projection laws are imported. Existing AdjoinRoot.tensorAlgEquiv already supplies generic finite algebra base change and is not replanned. Exact new-name searches in the pinned Mathlib/Tau sources and existing packets found no matches. Bounded root/base-change packet leads were inspected in the owner and related foundation/function-field suppliers; no exhaustive all-packet proof or PR/Zulip search is claimed.

## Validation and limits

Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 remain the pins. **The full canonical Tau Ceti suggested file is UNCOMPILED:** the available Tau checkout differs from the pin and lacks the four imported Tau oleans at its standard build path. The whole incoming canonical text is preserved after two added Mathlib imports. All35 new declaration/example headers match the native proof experiment and planning projection. The separately checked bounded Mathlib projection does not certify the full Tau-dependent geometric prefix.

The native proof program and bounded typing projection were compiled serially in the existing clean exact-pin Mathlib build with Lean4.34.0-rc2, at least20GiB available immediately before each run, one thread,8GiB managed-memory limit and1200-second timeout. No project, dependency/cache/library build or Lean server was started. Both compilation processes finished before submission.

'''
for name in ['Native','Sketch']:
 r=v['compilation'][name]
 h+=f"- {name}.lean: {r['lines']} lines,{r['examples']} examples,exit{r['exitStatus']},{r['warnings']} warnings ({r['admissionWarnings']} admissions),{r['axiomAudits']} axiom audits; available{r['availableGiBBefore']}GiB,elapsed{r['elapsedSeconds']}s,peak RSS{r['maxRssKiB']}KiB. Source SHA256 `{r['sourceSha256']}`; log SHA256 `{r['logSha256']}`.\n"
h+='''
Native.lean has no admissions or warnings. All393 audited axiom closures contain only propext, Classical.choice and Quot.sound. Sketch.lean has258 admission warnings only and retains231 clean inherited axiom audits. Exact incoming native and typing prefixes are bound to the authenticated predecessor manifest. Projection retains concrete data/carriers and admits mathematical lemma/test bodies only. The projection/header parser preserves the complete inline-let nilpotent test statement.

The actual indexed packet checker, source-issue/version checks and extracted actual intake functions pass without errors, warnings or refusals. The packet has490 nodes:13 definitions,85 constructions,44 theorems,336 lemmas,11 comparisons and1 application;392 checker API items,357 checker definition tests,276 baseline references and40 planets. No stage closes.

'''
h+=f"Raw counts are{v['rawAPIItems']} API entries and{v['rawTests']} test objects. Actual immutable atlas assembly is acyclic: stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own declaration{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges. All{g['requiredPairs']} owned supplier paths hold, with{g['ownRestructurePairs']} touching accepted restructuring pairs. There are no owned unresolved endpoints, skipped or pending links. Every stage edge and every foreign roadmap/stage object agrees with the incoming control. The{g['otherPreexistingUnreachableRestructurePairs']} unrelated preexisting unreachable restructuring pairs retain hash `{g['otherUnreachableRestructurePairListSha256']}`.\n\n"
h+=f"Mathematical input `{(S/'base.txt').read_text().strip()}`; publication input `{(S/'publication-base.txt').read_text().strip()}`. All18 guarded inputs, the job contract and all5 incoming owned blobs agree at both inputs. Declaration-index SHA256 `{v['indexSha256']}`. Verification-math.json and Verification.json record actual results.\n\n"
h+='''## Resume

Consume divisibilityBaseChangeDesc and its uniqueness for arbitrary compatible ring maps, divisibilityTensorEquiv for the actual tensor comparison, and divisibilitySpecCoefficientMap.isPullback/divisibilitySpecBaseChangeIso for the Cartesian affine-chart square. Neither flatness nor a restriction to affine test schemes is needed in their stated universes.

Still construct higher-universe adapters, coherent root-object groupoid reindexing, finite-projection coherence for the general infinite root-stack base-change equivalence, the supplier TOWER-AFF fpqc frame-torsor limit, and the actual infinite quotient/descent comparison on objects and arrows. The general stack-base root reservation, finite Kummer and DVR bridges, and the all-roots-of2 non-fppf counterexample remain separate. Preserve the omission ledger, all8 gaps and13 requests and both source routes until exact geometric carriers and source-qualified proofs are supplied. An affine ring pushout alone does not establish the fpqc root-stack quotient.

Recover and replay the public evidence before extending this checkpoint. The verifier checks preserved contracts, matched headers and recorded elaboration, then runs the actual immutable checker/intake/atlas; it never runs Lean. Optional re-elaboration must obey WORKERS' existing-build, memory and serial-run requirements.
'''
(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```
