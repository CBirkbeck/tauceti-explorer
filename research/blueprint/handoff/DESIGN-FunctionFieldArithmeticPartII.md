# The actual affine fppf normalization cover — checkpoint

Codex — codex-rtOQ9t. Refs #3403. Partial; all implementations remain unchecked.

For actual chosen-frame coordinates p=(u,y) with u*y^n=f, use the already constructed root algebra D=B[T]/(T^n-u). Its actual coefficient spectrum morphism Spec D to Spec B is flat and surjective for every positive exponent, and locally of finite presentation for every natural exponent, including zero. For positive exponent it gives an actual singleton cover in Mathlib's existing scheme fppf precoverage. The unique source, covering arrow and presieve are computed; every actual base point has a lift through that arrow. Generic spectrum, morphism properties, precoverage and cover carriers are all reused from the baseline.

The existing normalization-point A-algebra homomorphism gives an actual scheme arrow from Spec D to the affine root chart Spec(A[Z]/(Z^n-f)). After the native spectrum global-section identifications, its actual global-section homomorphism equals that existing algebra map, with root image T*algebraMap(y). Its composite to Spec A equals the actual covering arrow to Spec B followed by the original coefficient projection. This is a triangle of actual scheme morphisms and a computation of their actual section map.

Seven typed examples check arbitrary point lifting and singleton-cover properties, the actual chart triangle and global-section map, the Z/4 wild exponent with no original normalized chart point, a nonzero square-zero chart-section image over Z/9, exponent1, the empty zero-ring spectrum and finite presentation at exponent0. No exponent-invertibility, reducedness, nontriviality, section-regularity or original coefficient-map injectivity is assumed. The covering assertion uses positive exponent. No arbitrary point of an empty spectrum is introduced and no root section is cancelled.

All602 incoming node objects and299 baseline objects are unchanged. This continuation adds14 nodes (three constructions and11 lemmas),11 API references,14 test references to7 distinct typed examples and10 native baseline declarations. Every construction has at least three API items and three tests, with explicit consumers. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes and the full omission ledger retain their scope. All eleven source findings and every version receipt are unchanged. Only the RS.0 roadmap/coverage frontier and TOWER-TYPING detail gain this scheme result.

Native sheaf RootObject-to-coordinate comparison, local line-frame existence, fppf stackification, effective fpqc descent, infinite coherent reindexing, genuine 2-limits and higher-universe adapters remain open. The reserved root-stack key retains arbitrary scheme/stack bases, invertible line bundles with section and all positive exponents in the fppf topology. Étale/DM claims retain exponent-invertibility. Relative closed-subscheme roots, finite Kummer/DVR and all other geometric and source obligations are unchanged.

## Reading and provenance

The whole19646-character issue was read before claim5979231690 and again after bot5979232705 confirmed that exact comment; bodies match. Whole WORKERS and PROTOCOL sections0–4,12–14 were freshly read, with other governing rules retained from this continuous session's unchanged own original reading. All eight applicable reviewed FA.0–FA.7 audit row objects and AUDIT20 review metadata were read; initial combined FA0–3 output truncated and complete targeted rereads followed. No PartII audit row exists. The whole reserved key, TOWER-TYPING gap, native RootObject node, RS.0 stage description and latest two remaining paragraphs were read. No fresh whole602-node manual audit is claimed.

Incoming peer PR6065 at head486b32d9691103e5e687ca2bbc1dd690f4a1f457 was recovered by actual public HTTP from archived commit9046e3dff8c5bab8467198fe928f936e8f4ee592. Manifest18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0 authenticates72 artifacts,ten helpers andfive final deliverables. Both recovered actual immutable verifier reports matched the archived mathematical/publication reports byte-for-byte. No incoming Lean execution is claimed from those verifiers. The handoff mathematical prefix first12000 characters and all ten consumed helpers were read completely within those stated scopes.

The original own PR6061 at head9df516c55f38f40a7d19e3b064b6fa3f96e4be92 was also recovered by fresh actual public HTTP, authenticating74 artifacts,ten helpers andfive deliverables with manifestdbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9. OwnPreviousReading, OwnInheritedReadingReceipt and OwnOriginal6036Reading are checked against that original manifest. Their source, upstream, parent, supplier and protocol readings retain exact original extent and attribution only. Eighteen external controls remain unchanged; five own deliverables changed. The top-level mathematical contracts match that original own checkpoint, and its source issue/version lists remain exact prefixes. No peer reading is adopted as this worker's own.

The whole incoming469-line focused prefix, all19 incoming new proof declarations and8 tests were freshly read. The current focused prefix appends those exact proofs; all three whole incoming Lean prefixes are authenticated and preserved byte-for-byte before the new import and append. The incoming9464-line native proof certificate is recompiled in full, without claiming a fresh full manual reread. Every new native declaration, example and admitted header projection was read. All consumed helper code was read before adaptation. The new import is the pinned native fppf site module.

Actual pinned scheme spectrum, global-section naturality, affine flat/surjective characterization, finite-presentation characterization, singleton-cover and covering convention statements were read with ambient hypotheses and applicable fields. The faithful-flat ring-map and finite-presentation algebra-map conversions and scalar-tower coefficient law were also read. Exact hashes and bounded ranges are in Reading.json; BaselineReading binds the ten new references and all consumed baseline references to the prescribed index. Exact specialized-name searches in both pinned trees and current packet files found no matches; the touching-link scan found no PartII links. These are bounded searches, not an exhaustive semantic/source/PR/Zulip absence claim.

Fresh primary source reading is the whole displayed [Stacks Definition34.7.1, tag021M](https://stacks.math.columbia.edu/tag/021M) only. It supplies the fppf covering convention. The root-specific scheme packaging, actual chart arrow and coefficient triangle are authored deductions from the authenticated previous algebraic normalization and pinned native scheme APIs. SourceReading authenticates the actual HTTP HTML bytes; no whole-section, whole-paper or new version/errata audit is claimed. Original Alper and Talpo–Vistoli selected-page scopes remain attributed at their exact prior extent. All eleven inherited source findings and their version receipts are preserved.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. Fresh TauProbe records source pinf790474821cf4256814db967cb154e7af3d0c369, the different existing available build and four missing required compiled imports. No library build, cache, Lake project, extra clone, repository snapshot or language server was created. Lean ran serially with the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Each launch independently checked available memory at least20GiB, one thread,8192MiB managed limit and1200-second timeout. Every own compiler process finished.

- Native.lean: 9701 lines, 379 examples, exit0, 0 warnings, 517 axiom-dependency audits plus 1 axiom-free audits; 43GiB available, 352.66 seconds, peak 4214164KiB. Source SHA256 `fe6e9a61d8bf627a95ffe7fc06fbd42ef5585290d63700c9c1e72af89745b081`; diagnostic SHA256 `b1a6f00aac33d80c3b074a5c13cd5737ec961205809356a88900bd38631a75c4`.
- Sketch.lean: 8075 lines, 379 examples, exit0, 421 warnings, 231 axiom-dependency audits plus 0 axiom-free audits; 42GiB available, 155.54 seconds, peak 4020928KiB. Source SHA256 `923d1671280c7f0e6bd603574fb94977641d4f2e29104736e466d59e68b77f38`; diagnostic SHA256 `e59f691279eb30807b1f92fbddf48009c5b325f009c4ba808ce69e14fd6663c6`.

Native has379 examples and no errors, warnings or admissions. The14 new declaration closures are checked by actual axiom audits and use only propext, Classical.choice and Quot.sound. Sketch is the bounded Mathlib admitted projection, with379 examples and421 admission warnings only;231 inherited axiom-dependency audits remain clean. All14 new declaration headers and7 example headers equal the exact admitted projection. All three new constructions remain concrete; only11 lemma proofs and7 example proofs are admitted. Suggested equals the complete Canonical, SHA256 `40605cab060f924b9896824c4c732d53a3ece4c6f46c08e7131df27c9accc89b`. Neither whole Tau-dependent file was compiled; the two executed Mathlib cones certify only their own sources.

The focused Prototype compiled with no warnings/errors; its complete source, diagnostics and receipt are retained. The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass. The packet has616 nodes,309 baseline references,500 raw API items and482 raw test references. Mathematical and publication verification reports execute the actual checker,intake and atlas assembler without running Lean.

Publication graph: stage3057/8726, own616/1362, scoped3778/11228 vertices/edges, all acyclic. All89 required supplier pairs are reachable, with no owned skipped/pending links. Every foreign roadmap/stage and every inherited stage-edge object matches its immutable control. The45 unrelated pre-existing unreachable restructure pairs remain recorded without changing their ownership.

Mathematical base `84973e1e8589bce98d211174a13c553d7a6e2b24`; publication base `02e114932627b8940b6df881e8eb9e8bfdac748c`. All23 guarded inputs and the queue job contract match between them. Prescribed index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Final actual public HTTP recovery and both actual verifier outputs reproduce the archived reports before opening the PR.

## Resume

Use the actual singleton normalization cover and its proved chart triangle to supply the affine cover step in the native sheaf RootObject comparison. The remaining first steps are the native chosen-frame object/arrow comparison and existence of local line frames. Preserve actual automorphism labels and nonzero nilpotent sections. Stackification, effective descent, coherent infinite reindexing and genuine 2-limits remain separate open obligations. All inherited route, source, supplier and omission contracts remain binding.

## Script: assemble.py

```python
"""Retain all incoming prefixes, insert one native groupoid import, append exact new data."""
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

## Script: author.py

```python
"""Append the actual singleton fppf normalization cover and affine-chart triangle."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.';P=RID+':RS.0/framed-fppf-'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('map','FramedRoot.normalizationSpecMap','construction','The affine normalization scheme map','For the actual framed coordinates p=(u,y), form the scheme morphism Spec D to Spec B induced by the existing coefficient map B to D, where D is the existing root algebra B[T]/(T^n-u). The morphism is defined for every natural exponent.',['FramedRoot','mathlib:AlgebraicGeometry.Spec.algebraMap'],'Apply the existing native contravariant spectrum to the coefficient homomorphism of the existing normalization algebra.'),
('finite-presentation','FramedRoot.normalizationSpecMap_finitePresentation','lemma','Finite presentation of the normalization scheme map','For every natural exponent, the actual normalization scheme morphism is locally of finite presentation.',['FramedRoot.normalizationSpecMap','FramedRoot.normalization_finitePresentation','mathlib:AlgebraicGeometry.LocallyOfFinitePresentation.SpecMap_iff','mathlib:RingHom.finitePresentation_algebraMap'],'Translate the existing finite-presentation result for the actual normalization algebra into the ring-map predicate, then use the native affine scheme characterization.'),
('flat','FramedRoot.normalizationSpecMap_flat','lemma','Flatness of the normalization scheme map','For positive exponent, the actual morphism Spec D to Spec B is flat.',['FramedRoot.normalizationSpecMap','FramedRoot.normalization_faithfullyFlat','mathlib:AlgebraicGeometry.flat_and_surjective_SpecMap_iff','mathlib:RingHom.faithfullyFlat_algebraMap_iff'],'Translate the existing faithful flatness of D over B to the coefficient ring map. Take the flatness component of the native spectrum characterization.'),
('surjective','FramedRoot.normalizationSpecMap_surjective','lemma','Surjectivity of the normalization scheme map','For positive exponent, the actual morphism Spec D to Spec B is surjective on its scheme points.',['FramedRoot.normalizationSpecMap','FramedRoot.normalization_faithfullyFlat','mathlib:AlgebraicGeometry.flat_and_surjective_SpecMap_iff','mathlib:RingHom.faithfullyFlat_algebraMap_iff'],'Take the surjectivity component of the same native characterization, without a reducedness or nontriviality premise.'),
('cover','FramedRoot.normalizationCover','construction','The singleton fppf normalization cover','For positive exponent, construct the actual native singleton cover of Spec B in the existing scheme fppf precoverage, with source Spec D and covering morphism the actual normalization scheme map. Its index is the native singleton type.',['FramedRoot.normalizationSpecMap_flat','FramedRoot.normalizationSpecMap_surjective','FramedRoot.normalizationSpecMap_finitePresentation','mathlib:AlgebraicGeometry.Scheme.Hom.cover','mathlib:AlgebraicGeometry.Scheme.fppfPrecoverage'],'Use the existing scheme singleton-cover constructor with the two native morphism properties and actual surjectivity. Reuse the native precoverage and cover carrier.'),
('cover-source','FramedRoot.normalizationCover_source','lemma','The actual cover source','The unique source scheme in the normalization cover is exactly Spec D for the existing adjoined unit-root algebra.',['FramedRoot.normalizationCover'],'Reduce the singleton-cover source field.'),
('cover-map','FramedRoot.normalizationCover_map','lemma','The actual covering arrow','The unique covering arrow is exactly the constructed coefficient spectrum map Spec D to Spec B.',['FramedRoot.normalizationCover','FramedRoot.normalizationSpecMap'],'Reduce the singleton-cover arrow field.'),
('cover-presieve','FramedRoot.normalizationCover_presieve','lemma','The normalization covering presieve','The presieve of the actual normalization cover equals the singleton presieve of its actual normalization scheme map.',['FramedRoot.normalizationCover','FramedRoot.normalizationSpecMap_surjective','mathlib:AlgebraicGeometry.Scheme.Hom.presieve₀_cover'],'Apply the native presieve computation for the actual singleton cover.'),
('cover-points','FramedRoot.normalizationCover_covers','lemma','Every base point lifts to the cover','Every actual point x of Spec B has a point y of Spec D mapping to x along the unique normalization covering arrow. This includes the vacuous empty-spectrum case.',['FramedRoot.normalizationCover_map','FramedRoot.normalizationSpecMap_surjective'],'Use the actual surjectivity witness of the actual normalization morphism; no arbitrary point or nonempty-spectrum assumption is introduced.'),
('cover-membership','FramedRoot.normalizationCover_mem','lemma','The actual singleton is fppf covering','The singleton presieve of the actual normalization scheme map belongs to the native fppf precoverage of Spec B.',['FramedRoot.normalizationCover','FramedRoot.normalizationCover_presieve'],'Transport the native cover membership field along the exact presieve equality.'),
('chart','FramedRoot.normalizationChartMap','construction','The normalized affine root chart map','For positive exponent, construct the scheme morphism from Spec D to the actual affine root chart Spec(A[Z]/(Z^n-f)) using the existing normalization-point A-algebra map.',['FramedRoot.normalizationPoint','mathlib:AlgebraicGeometry.Spec.map'],'Apply the existing native contravariant spectrum to the actual normalization-point homomorphism.'),
('chart-sections','FramedRoot.normalizationChartMap_appTop','lemma','The actual global-section map of the chart arrow','After conjugation by the two native spectrum global-section isomorphisms, the global-section homomorphism of the actual chart arrow is precisely the existing normalization-point ring homomorphism.',['FramedRoot.normalizationChartMap','mathlib:AlgebraicGeometry.Scheme.ΓSpecIso','mathlib:AlgebraicGeometry.Scheme.ΓSpecIso_naturality'],'Use native global-section naturality and the native inverse-hom identity. This is a statement about the actual scheme arrow.'),
('chart-root','FramedRoot.normalizationChartMap_root','lemma','The chart arrow pulls the root section to the normalized root','The conjugated global-section homomorphism of the actual chart arrow sends the chart root Z to the actual adjoined unit-root T multiplied by the image of the original section y in D.',['FramedRoot.normalizationChartMap_appTop','FramedRoot.normalizationPoint_root'],'Rewrite the actual global-section map using its proved identification, then use the existing normalization-point root equation.'),
('chart-base','FramedRoot.normalizationChartMap_overBase','lemma','The normalized chart triangle over the original base','Composing the actual chart arrow Spec D to Spec(A[Z]/(Z^n-f)) with its coefficient projection to Spec A equals the unique normalization covering arrow to Spec B followed by its original coefficient projection to Spec A.',['FramedRoot.normalizationChartMap','FramedRoot.normalizationCover_map','mathlib:AlgebraicGeometry.Spec.map_comp','mathlib:IsScalarTower.algebraMap_apply'],'Use contravariance of the native spectrum. Compare the actual composite coefficient ring maps pointwise by the normalization-point algebra law and the native scalar-tower coefficient identity.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[];sid='FramedFppfCover-codex-rtOQ9t';src=load('SourceReading.json')[0]
for slug,name,kind,title,statement,deps,proof in specs:
 hypotheses=['Arbitrary commutative A and commutative A-algebra B in a common universe; arbitrary section f and actual framed coordinates p=(u,y), with bundled unit u and u times y to the n equals the image of f. '+('The morphism and its finite-presentation statement allow every natural n, including zero.'if name in ['FramedRoot.normalizationSpecMap','FramedRoot.normalizationSpecMap_finitePresentation']else'The exponent n is positive, expressed by the native nonzero-natural instance.'),'No exponent-invertibility, reducedness, nontriviality, regularity of the section or injectivity of the original coefficient map is assumed. No cancellation of the root section is used.','This result packages an already proved affine normalization of chosen-frame coordinates. Native sheaf RootObject comparison, local line-frame existence, stackification, effective descent and infinite genuine 2-limits remain open.']
 nodes.append(dict(id=ids[name],parentStageId=RID+':RS.0',realises=[RID+':RS.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=hypotheses,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[statement,'Use the actual native scheme, root algebra, cover and global-section maps. Retain wild exponents and nonzero nilpotent sections.'],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS0',namespace=NS[:-1]),sources=[dict(sourceId=sid,locator='Stacks Definition34.7.1, tag021M; authored root-specific scheme packaging of the prior affine normalization',excerpt='fppf covering',match='The source supplies the native covering convention. The specific normalization algebra, chart arrow and coefficient triangle are authored deductions, using the authenticated previous algebraic normalization and pinned scheme APIs.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={'FramedRoot.normalizationSpecMap':['FramedRoot.normalizationSpecMap_flat','FramedRoot.normalizationSpecMap_surjective','FramedRoot.normalizationSpecMap_finitePresentation'],'FramedRoot.normalizationCover':['FramedRoot.normalizationCover_source','FramedRoot.normalizationCover_map','FramedRoot.normalizationCover_presieve','FramedRoot.normalizationCover_covers','FramedRoot.normalizationCover_mem'],'FramedRoot.normalizationChartMap':['FramedRoot.normalizationChartMap_appTop','FramedRoot.normalizationChartMap_root','FramedRoot.normalizationChartMap_overBase']}
testdata=[('actual_singleton_cover','compatibility','For arbitrary positive exponent, the actual normalization scheme morphism is flat, surjective and locally of finite presentation; the native cover has its exact singleton presieve and every actual base point lifts through its actual covering arrow.'),('actual_chart_triangle','compatibility','For arbitrary positive exponent, the two actual scheme composites to Spec A agree, and the actual chart arrow induces the existing normalization-point homomorphism after the native global-section identifications.'),('wild_cover_without_original_chart','non-example','Over Z/4 with n=2,u=3,y=1,f=3, no original normalized affine chart point exists, while the actual normalization singleton belongs to the native fppf precoverage and its actual chart-section pullback sends the chart root to T.'),('nilpotent_chart_section','non-example','Over Z/9 with n=2,u=1,y=3,f=0, the actual chart-section pullback of the root remains nonzero and has square zero; the actual normalization singleton is fppf covering.'),('exponent_one','degenerate','For n=1, the actual normalization singleton is fppf covering and the actual chart-section pullback of the root equals the image of f.'),('zero_ring','degenerate','Over Z/1 at n=3, the actual normalization singleton belongs to the native fppf precoverage, its source is exactly the actual spectrum of D and the actual chart triangle to Spec(Z/1) commutes, without assuming any point exists.'),('exponent_zero_finite_presentation','degenerate','For n=0, the actual normalization scheme morphism is still locally of finite presentation. This test makes no positive-exponent cover, normalization or faithful-flatness assertion.')]
tests=[dict(name=NS+'framedCoverTests.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
testsets={'FramedRoot.normalizationSpecMap':['actual_singleton_cover','wild_cover_without_original_chart','exponent_one','zero_ring','exponent_zero_finite_presentation'],'FramedRoot.normalizationCover':['actual_singleton_cover','wild_cover_without_original_chart','exponent_one','zero_ring'],'FramedRoot.normalizationChartMap':['actual_chart_triangle','wild_cover_without_original_chart','nilpotent_chart_section','exponent_one','zero_ring']}
for name,entries in apis.items():
 by[name]['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries]
 by[name]['tests']=[tb[x]for x in testsets[name]]
 by[name]['uses']=[dict(where=existing['rootChartEmbedding.essentialImage_iff'],how='Provide the actual fppf cover on which the already constructed unit root normalizes the chosen-frame object and its retained arrow equations.'),dict(where=RID+':RS.0/root-object',how='Supply the concrete affine cover and coefficient triangle for the still-open native sheaf-coordinate comparison and subsequent root-stack stackification.')]
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
used=sorted({x.removeprefix('mathlib:')for n in nodes for x in n['prerequisites']if x.startswith('mathlib:')})
for name in used:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement, ambient hypotheses and used proof/fields personally read at the exact pin; bounded ranges in Reading.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse the native scheme or ring API for the actual root-specific normalization cover and chart.',checked='Codex — codex-rtOQ9t read the statement and ambient hypotheses at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
p['sources'].append(dict(id=sid,title='Fppf covering convention and authored normalization scheme packaging',authors='The Stacks Project Authors; specialized deductions by Codex — codex-rtOQ9t',edition='Current displayed Definition34.7.1 only, accessed4October2026',url=src['url'],sha256=src['sha256'],accessed='2026-10-04',readSections=[src['scope']]))
frontier='For every positive exponent and actual chosen-frame root p=(u,y), the existing normalization extension D=B[T]/(T^n-u) now gives an actual singleton cover of Spec B in the native scheme fppf precoverage. Its actual coefficient spectrum map is flat, surjective and locally of finite presentation; its unique source, arrow and presieve are computed and every actual base point lifts. The actual normalized chart arrow Spec D to Spec(A[Z]/(Z^n-f)) induces the existing normalization-point map on global sections, pulls the root section to T times the image of y, and has the proved coefficient triangle to Spec A. Wild exponents, nonzero nilpotents and the empty zero-ring spectrum are retained. Finite presentation of the scheme map also holds for n=0; the cover assertion uses positive n. Native sheaf RootObject comparison, local line-frame existence, fppf stackification, effective fpqc descent, infinite coherent reindexing, genuine 2-limits and higher-universe adapters remain open, as do all existing source, supplier and geometric obligations.'
p['summary']+=' Affine fppf scheme continuation:14 declarations (3 constructions and11 lemmas),11 API references and7 distinct typed tests with14 references. All602 incoming node objects are unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':RS.0')['remaining'].append(frontier);next(x for x in p['gaps']if x['id']=='TOWER-TYPING')['detail']+=' '+frontier;next(x for x in road['stages']if x['key']=='RS.0')['description']+=' '+frontier
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('NewTests.json',tests)]:save(n,x)
save('Plan.json',dict(newNames=[n['declarationName']for n in nodes],apiAdditions={},newNodes=[n['id']for n in nodes],newBaseline=baseline,newBaselineRefs=[x['ref']for x in baseline],frontier=frontier,newNodesCount=len(nodes),newAPI=sum(map(len,apis.values())),distinctNewAPI=len({x for a in apis.values()for x in a}),newTests=len(tests),testReferences=sum(map(len,testsets.values()))))
intro='''# The actual affine fppf normalization cover

For an actual chosen-frame root p=(u,y), use the already constructed algebra D=B[T]/(T^n-u). For every positive exponent its actual spectrum map to Spec B is flat, surjective and locally of finite presentation. It gives an actual singleton cover in Mathlib's existing scheme fppf precoverage, with exact source, covering arrow and presieve, and actual point lifting. The generic spectrum and cover constructions are imported from the pinned baseline.

The existing normalization-point algebra homomorphism now gives an actual arrow from Spec D to the affine root chart Spec(A[Z]/(Z^n-f)). Its global-section map, after the native spectrum identifications, sends Z to T times the image of y. Its composite to Spec A equals the actual covering arrow to Spec B followed by the original projection to Spec A. This packages the affine algebraic normalization as the scheme diagram needed for later native root-object comparison.

The Z/4 wild-exponent example has a covering normalization despite the absence of an original normalized chart point. The actual chart-section image over Z/9 is nonzero and square-zero. Tests also check arbitrary base-point lifting, the actual global-section triangle, exponent1, the empty zero-ring spectrum and finite presentation at exponent0. The cover statement requires positive exponent, with no exponent-invertibility, section-regularity, nontriviality or reducedness premise.

All602 incoming node objects and299 baseline objects are unchanged. This continuation adds14 nodes,11 API references and14 references to7 distinct typed examples. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,the complete omission ledger,all eleven source findings and every version receipt retain their scope. Every implementation remains unchecked. The complete Tau-dependent suggested file remains UNCOMPILED; the separate full native certificate and bounded Mathlib sketch are reported precisely in the handoff.

'''+frontier+'\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),baseline=len(p['baseline']['declarations']),newBaseline=len(baseline))))
```

## Script: projection.py

```python
"""Admit lemma/test proofs while retaining actual native scalar-module data."""
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

## Script: write_handoff.py

```python
"""Render the precise affine scheme checkpoint and portable verification evidence."""
from pathlib import Path
import json,hashlib,re
S=Path(__file__).resolve().parent
text=lambda n:(S/n).read_text()
data=lambda n:json.loads(text(n))
sha=lambda b:hashlib.sha256(b).hexdigest()
def line(stem):
 r=data(stem+'.receipt.json');b=(S/(stem+'.lean')).read_bytes();assert r['exitStatus']==0
 ex=len(re.findall(r'^example\b',b.decode(),re.M))
 return f"- {stem}.lean: {len(b.splitlines())} lines, {ex} examples, exit0, {r['warnings']} warnings, {r['axiomAudits']} axiom-dependency audits plus {text(stem+'.log').count('does not depend on any axioms')} axiom-free audits; {r['availableGiBBefore']}GiB available, {r['elapsedSeconds']} seconds, peak {r['maxRssKiB']}KiB. Source SHA256 `{sha(b)}`; diagnostic SHA256 `{r['logSha256']}`.\n"
g=data('Graph.json');p=data('Candidate.json');plan=data('Plan.json');c=data('ClaimReceipt.json')
assert g['worldCommit']==text('publication-base.txt').strip()
h=f'''# The actual affine fppf normalization cover — checkpoint

Codex — codex-rtOQ9t. Refs #3403. Partial; all implementations remain unchecked.

For actual chosen-frame coordinates p=(u,y) with u*y^n=f, use the already constructed root algebra D=B[T]/(T^n-u). Its actual coefficient spectrum morphism Spec D to Spec B is flat and surjective for every positive exponent, and locally of finite presentation for every natural exponent, including zero. For positive exponent it gives an actual singleton cover in Mathlib's existing scheme fppf precoverage. The unique source, covering arrow and presieve are computed; every actual base point has a lift through that arrow. Generic spectrum, morphism properties, precoverage and cover carriers are all reused from the baseline.

The existing normalization-point A-algebra homomorphism gives an actual scheme arrow from Spec D to the affine root chart Spec(A[Z]/(Z^n-f)). After the native spectrum global-section identifications, its actual global-section homomorphism equals that existing algebra map, with root image T*algebraMap(y). Its composite to Spec A equals the actual covering arrow to Spec B followed by the original coefficient projection. This is a triangle of actual scheme morphisms and a computation of their actual section map.

Seven typed examples check arbitrary point lifting and singleton-cover properties, the actual chart triangle and global-section map, the Z/4 wild exponent with no original normalized chart point, a nonzero square-zero chart-section image over Z/9, exponent1, the empty zero-ring spectrum and finite presentation at exponent0. No exponent-invertibility, reducedness, nontriviality, section-regularity or original coefficient-map injectivity is assumed. The covering assertion uses positive exponent. No arbitrary point of an empty spectrum is introduced and no root section is cancelled.

All602 incoming node objects and299 baseline objects are unchanged. This continuation adds14 nodes (three constructions and11 lemmas),11 API references,14 test references to7 distinct typed examples and10 native baseline declarations. Every construction has at least three API items and three tests, with explicit consumers. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes and the full omission ledger retain their scope. All eleven source findings and every version receipt are unchanged. Only the RS.0 roadmap/coverage frontier and TOWER-TYPING detail gain this scheme result.

Native sheaf RootObject-to-coordinate comparison, local line-frame existence, fppf stackification, effective fpqc descent, infinite coherent reindexing, genuine 2-limits and higher-universe adapters remain open. The reserved root-stack key retains arbitrary scheme/stack bases, invertible line bundles with section and all positive exponents in the fppf topology. Étale/DM claims retain exponent-invertibility. Relative closed-subscheme roots, finite Kummer/DVR and all other geometric and source obligations are unchanged.

## Reading and provenance

The whole19646-character issue was read before claim{c['claim']} and again after bot{c['bot']} confirmed that exact comment; bodies match. Whole WORKERS and PROTOCOL sections0–4,12–14 were freshly read, with other governing rules retained from this continuous session's unchanged own original reading. All eight applicable reviewed FA.0–FA.7 audit row objects and AUDIT20 review metadata were read; initial combined FA0–3 output truncated and complete targeted rereads followed. No PartII audit row exists. The whole reserved key, TOWER-TYPING gap, native RootObject node, RS.0 stage description and latest two remaining paragraphs were read. No fresh whole602-node manual audit is claimed.

Incoming peer PR6065 at head486b32d9691103e5e687ca2bbc1dd690f4a1f457 was recovered by actual public HTTP from archived commit9046e3dff8c5bab8467198fe928f936e8f4ee592. Manifest18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0 authenticates72 artifacts,ten helpers andfive final deliverables. Both recovered actual immutable verifier reports matched the archived mathematical/publication reports byte-for-byte. No incoming Lean execution is claimed from those verifiers. The handoff mathematical prefix first12000 characters and all ten consumed helpers were read completely within those stated scopes.

The original own PR6061 at head9df516c55f38f40a7d19e3b064b6fa3f96e4be92 was also recovered by fresh actual public HTTP, authenticating74 artifacts,ten helpers andfive deliverables with manifestdbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9. OwnPreviousReading, OwnInheritedReadingReceipt and OwnOriginal6036Reading are checked against that original manifest. Their source, upstream, parent, supplier and protocol readings retain exact original extent and attribution only. Eighteen external controls remain unchanged; five own deliverables changed. The top-level mathematical contracts match that original own checkpoint, and its source issue/version lists remain exact prefixes. No peer reading is adopted as this worker's own.

The whole incoming469-line focused prefix, all19 incoming new proof declarations and8 tests were freshly read. The current focused prefix appends those exact proofs; all three whole incoming Lean prefixes are authenticated and preserved byte-for-byte before the new import and append. The incoming9464-line native proof certificate is recompiled in full, without claiming a fresh full manual reread. Every new native declaration, example and admitted header projection was read. All consumed helper code was read before adaptation. The new import is the pinned native fppf site module.

Actual pinned scheme spectrum, global-section naturality, affine flat/surjective characterization, finite-presentation characterization, singleton-cover and covering convention statements were read with ambient hypotheses and applicable fields. The faithful-flat ring-map and finite-presentation algebra-map conversions and scalar-tower coefficient law were also read. Exact hashes and bounded ranges are in Reading.json; BaselineReading binds the ten new references and all consumed baseline references to the prescribed index. Exact specialized-name searches in both pinned trees and current packet files found no matches; the touching-link scan found no PartII links. These are bounded searches, not an exhaustive semantic/source/PR/Zulip absence claim.

Fresh primary source reading is the whole displayed [Stacks Definition34.7.1, tag021M](https://stacks.math.columbia.edu/tag/021M) only. It supplies the fppf covering convention. The root-specific scheme packaging, actual chart arrow and coefficient triangle are authored deductions from the authenticated previous algebraic normalization and pinned native scheme APIs. SourceReading authenticates the actual HTTP HTML bytes; no whole-section, whole-paper or new version/errata audit is claimed. Original Alper and Talpo–Vistoli selected-page scopes remain attributed at their exact prior extent. All eleven inherited source findings and their version receipts are preserved.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. Fresh TauProbe records source pinf790474821cf4256814db967cb154e7af3d0c369, the different existing available build and four missing required compiled imports. No library build, cache, Lake project, extra clone, repository snapshot or language server was created. Lean ran serially with the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Each launch independently checked available memory at least20GiB, one thread,8192MiB managed limit and1200-second timeout. Every own compiler process finished.

'''+line('Native')+line('Sketch')+f'''
Native has379 examples and no errors, warnings or admissions. The14 new declaration closures are checked by actual axiom audits and use only propext, Classical.choice and Quot.sound. Sketch is the bounded Mathlib admitted projection, with379 examples and421 admission warnings only;231 inherited axiom-dependency audits remain clean. All14 new declaration headers and7 example headers equal the exact admitted projection. All three new constructions remain concrete; only11 lemma proofs and7 example proofs are admitted. Suggested equals the complete Canonical, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. Neither whole Tau-dependent file was compiled; the two executed Mathlib cones certify only their own sources.

The focused Prototype compiled with no warnings/errors; its complete source, diagnostics and receipt are retained. The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass. The packet has616 nodes,309 baseline references,500 raw API items and482 raw test references. Mathematical and publication verification reports execute the actual checker,intake and atlas assembler without running Lean.

Publication graph: stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All{g['requiredPairs']} required supplier pairs are reachable, with no owned skipped/pending links. Every foreign roadmap/stage and every inherited stage-edge object matches its immutable control. The{g['otherPreexistingUnreachableRestructurePairs']} unrelated pre-existing unreachable restructure pairs remain recorded without changing their ownership.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All23 guarded inputs and the queue job contract match between them. Prescribed index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Final actual public HTTP recovery and both actual verifier outputs reproduce the archived reports before opening the PR.

## Resume

Use the actual singleton normalization cover and its proved chart triangle to supply the affine cover step in the native sheaf RootObject comparison. The remaining first steps are the native chosen-frame object/arrow comparison and existence of local line frames. Preserve actual automorphism labels and nonzero nilpotent sections. Stackification, effective descent, coherent infinite reindexing and genuine 2-limits remain separate open obligations. All inherited route, source, supplier and omission contracts remain binding.

'''
for helper in ['assemble.py','author.py','projection.py','write_handoff.py','verify.py','graph.py','immutable_view.py','compile.py','runcheck.py','package.py']:
 h+='## Script: '+helper+'\n\n```python\n'+text(helper)+'```\n\n'
h=h.rstrip()+'\n';(S/'HandoffBase.md').write_text(h);(S/'Handoff.md').write_text(h)
```

## Script: verify.py

```python
"""Replay exact contracts, source receipts and actual immutable checker/intake/atlas; no Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOTS_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
names=['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','Handoff.md'];contents={p:txt(n)for p,n in zip(paths,names)}
if (S/'PublicHandoff.md').exists():
 assert txt('PublicHandoff.md').startswith(txt('HandoffBase.md'))
 contents[paths[-1]]=txt('PublicHandoff.md')
 fence=chr(96)*3
 code=txt('PublicHandoff.md').split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
 assert code==txt('recover.py')
 if (S/'artifact-manifest.json').exists():
  for helper in data('artifact-manifest.json'):
   if helper.endswith('.py'):
    embedded=txt('PublicHandoff.md').split('## Script: '+helper+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
    assert embedded==txt(helper),helper

for p,n in zip(paths,['Incoming-roadmap.json','Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):
 assert blob(MATH,p)==(S/n).read_bytes()==blob(BASE,p),p
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='dbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9'
for n,o in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnPreviousCandidate.json','Candidate.json'),('OwnInheritedReadingReceipt.json','OwnInheritedReadingReceipt.json'),('OwnOriginal6036Reading.json','OwnOriginal6036Reading.json')]:assert sha((S/n).read_bytes())==data('OwnPreviousManifest.json')[o]['sha256'],n
reuse=data('OwnReadingReuse.json');guards=data('OwnPreviousInputGuard.json')
assert len(guards)==len(reuse)==23 and sum(x['unchanged']for x in reuse)==18
for g,u in zip(guards,reuse):
 assert g['path']==u['path'] and g['sha256']==u['before'] and sha(blob(MATH,g['path']))==u['after']
 assert u['unchanged']==(u['before']==u['after'])
claim=data('ClaimReceipt.json');assert claim['agent']=='Codex'and claim['session']=='codex-rtOQ9t'and claim['claim']==5979231690 and claim['bot']==5979232705 and claim['beforeAfterEqual']
assert claim['characters']==19646 and claim['bodySha256']=='80b1094ef57ffa9199903d436336938209a197a5eaf2f0c909560918668f0ed5'
for key in ['beforeReads','afterReads']:
 ranges=claim[key];assert ranges[0][0]==0 and ranges[-1][1]==19646 and all(a[1]==b[0]for a,b in zip(ranges,ranges[1:]))
p=data('Candidate.json');old=data('Incoming.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==602 and len(p['nodes'])==616 and p['nodes'][602:]==data('NewNodes.json')
unchanged=0
for a,b in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(a))
 if a['id']in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][a['id']]
 else:unchanged+=1
 assert b==expected,a['id']
assert unchanged==602 and set(p)==set(old)and plan['apiAdditions']=={}and p['nodes'][:602]==old['nodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps','sourceIssues','sourceVersions']:assert p[k]==old[k],k
assert p['sourceIssues']==old['sourceIssues'] and len(p['sourceIssues'])==11
assert p['sourceVersions']==old['sourceVersions']
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:299]==old['baseline']['declarations']
assert [d['ref']for d in p['baseline']['declarations'][299:]]==plan['newBaselineRefs']and len(plan['newBaselineRefs'])==10
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert len(p['requests'])==13 and len(p['gaps'])==8 and len(p['coverage'])==10
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':RS.0':assert b['remaining'][:-1]==a['remaining']and {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
for a,b in zip(old['gaps'],p['gaps']):
 if a['id']=='TOWER-TYPING':assert b['detail'].startswith(a['detail'])and {k:v for k,v in a.items()if k!='detail'}=={k:v for k,v in b.items()if k!='detail'}
 else:assert a==b
assert {k:v for k,v in road.items()if k!='stages'}=={k:v for k,v in oldroad.items()if k!='stages'}
for a,b in zip(oldroad['stages'],road['stages']):
 if a['key']=='RS.0':assert b['description']==a['description']+' '+plan['frontier']and {k:v for k,v in a.items()if k!='description'}=={k:v for k,v in b.items()if k!='description'}
 else:assert a==b
assert data('PreviousRecovery.json')['head']=='486b32d9691103e5e687ca2bbc1dd690f4a1f457'
assert data('PreviousRecovery.json')['artifactsVerified']==72
assert data('OwnPreviousRecovery.json')['head']=='9df516c55f38f40a7d19e3b064b6fa3f96e4be92'
assert data('OwnPreviousRecovery.json')['artifactsVerified']==74
assert data('OwnPreviousRecovery.json')['archivedHelpersVerified']==10
source=data('SourceReading.json')[0]
assert source['sha256']==sha((S/'Stacks-021M.html').read_bytes())==p['sources'][-1]['sha256']
assert source['url']=='https://stacks.math.columbia.edu/tag/021M'
assert p['sources'][-1]['id']=='FramedFppfCover-codex-rtOQ9t'
assert data('OwnContractGuard.json')=={k:data('Incoming.json')[k]==data('OwnPreviousCandidate.json')[k]for k in data('Incoming.json')if k not in ['nodes','summary','sources','baseline','coverage','gaps','sourceIssues','sourceVersions']}
assert all(data('OwnContractGuard.json').values())
for k in ['sourceIssues','sourceVersions']:
 assert old[k][:len(data('OwnPreviousCandidate.json')[k])]==data('OwnPreviousCandidate.json')[k]
assert data('TauProbe.json')['fullCanonicalExecution'].startswith('UNCOMPILED')
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
from projection import project
assert txt('NewAdmitted.lean')==project(txt('NewProofs.lean'),txt('NewTests.lean'))
assert txt('CanonicalPrefix.lean')==txt('Incoming.lean')
def with_import(n):
 text=txt(n);imports=txt('NewImports.lean');i=text.index('import ');return text[:i]+imports+'\n'+text[i:] if imports.strip() else text
assert txt('Canonical.lean')==with_import('Incoming.lean')+'\n'+txt('NewAdmitted.lean')==txt('Suggested.lean')
assert txt('Sketch.lean')==with_import('SketchPrefix.lean')+'\n'+txt('NewAdmitted.lean')
for target,source in [('NativePrefix.lean','Native.lean'),('Incoming.lean','Canonical.lean'),('SketchPrefix.lean','Sketch.lean')]:
 assert sha((S/target).read_bytes())==data('IncomingManifest.json')[source]['sha256']
assert sha((S/'IncomingManifest.json').read_bytes())=='18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0'
for n,o in [('IncomingPublicationVerification-replayed.json','Verification.json'),('IncomingMathematicalVerification-replayed.json','Verification-mathematical.json')]:
 assert sha((S/n).read_bytes())==data('IncomingManifest.json')[o]['sha256']
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
probe=txt('ProbePrefix.lean');i=probe.index('import ')
assert txt('Prototype.lean')==probe[:i]+txt('NewImports.lean')+probe[i:]+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')
pr=data('Prototype.receipt.json');pl=txt('Prototype.log')
assert pr['exitStatus']==0 and pr['warnings']==0 and pr['availableGiBBefore']>=20
assert pr['sourceSha256']==sha((S/'Prototype.lean').read_bytes())and pr['logSha256']==sha(pl.encode())
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Prototype.lean'))
assert txt('Native.lean')==with_import('NativePrefix.lean')+'\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
def headers(text):
 found={}
 for m in re.finditer(r'^(structure|def|lemma|theorem|example)\b(?: ([\w.]+))?',text,re.M):
  depth=0;end=None;pending_let=0
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and re.match(r'let(?:I)?\b',text[i:]) and (i==0 or not (text[i-1].isalnum() or text[i-1]=='_')):pending_let+=1
   if depth==0 and text.startswith(':=',i):
    if pending_let:pending_let-=1
    else:end=i;break
   if depth==0 and m.group(1)in {'def','structure'}and text.startswith('where',i)and text[i-1].isspace()and text[i+5].isspace():end=i;break
  assert end is not None
  label=m.group(2)if m.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(text[m.start():end].split())
 return found
nh=headers(txt('NewProofs.lean'));nt=headers(txt('NewTests.lean'));ch=headers(txt('NewAdmitted.lean'));assert {**nh,**nt}==ch
assert all(not re.search(r'\b(?:sorry|admit|axiom)\b',h)for h in ch.values())
assert len(nh)==14 and len(nt)==7
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][602:]}
assert {t['name']for t in data('NewTests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][602:]:
 if n['kind']in {'construction','definition'}:assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 assert n['declarationName']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n['api']+n['tests']:assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][602:])+sum(map(len,plan['apiAdditions'].values()))==11 and sum(len(n['tests'])for n in p['nodes'][602:])==14
compilation={}
for name,want,audits in [('Native',0,517),('Sketch',421,231)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 ex=len(re.findall(r'^example\b',txt(name+'.lean'),re.M));assert ex==379,(name,ex)
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits,(name,len(a))
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':ex,'axiomFreeAudits':log.count('does not depend on any axioms')}
audited=set(re.findall(r"'([^']+)' (?:depends on axioms:|does not depend on any axioms)",txt('Native.log')))
assert set(plan['newNames'])<=audited
assert 'LocallyOfFinitePresentation' in nt['example#6'] and 'z ≠ 0' in nt['example#3'] and 'Spec.algebraMap' in nt['example#1']
assert txt('NewImports.lean')=='import Mathlib.AlgebraicGeometry.Sites.Fpqc\n'
assert 'sorry'not in txt('NewProofs.lean') and len(re.findall(r'^def ',txt('NewProofs.lean'),re.M))==3
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
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-rtOQ9t'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOTS_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
if BASE==txt('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=602,incomingMathematicalContractsPreserved=602,newNodes=14,newAPIItems=11,newTests=7,newTestReferences=14,newSourceFindings=0,inheritedSourceFindingsUnchanged=len(old['sourceIssues']),matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at the exact pin; entire canonical prefix retained.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
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

## Script: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='FunctionFieldArithmeticPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json
IncomingPublicationVerification-replayed.json IncomingMathematicalVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean SketchPrefix.lean NewImports.lean
Native.lean Native.log Native.receipt.json Canonical.lean Sketch.lean Sketch.log Sketch.receipt.json
NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnReadingReuse.json OwnContractGuard.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousCandidate.json OwnInheritedReadingReceipt.json OwnOriginal6036Reading.json OwnPreviousRecovery.json Stacks-021M.html LibrarySearch.json TauProbe.json
InputGuard.json PublicationChanges.json Plan.json NewNodes.json NewTests.json PreviousHead.txt PreviousRecovery.json Verification-mathematical.json Verification.json
TouchingLinks.json Graph.json base.txt publication-base.txt ProbePrefix.lean Prototype.lean Prototype.log Prototype.receipt.json
assemble.py author.py projection.py write_handoff.py verify.py graph.py immutable_view.py compile.py runcheck.py package.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED AFFINE FPPF COVER PAYLOAD\n'+pb+b'END ARCHIVED AFFINE FPPF COVER PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated affine fppf scheme evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE FPPF COVER PAYLOAD\\n',1)[1].split('END ARCHIVED AFFINE FPPF COVER PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
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
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
for helper in meta:
 if helper.endswith('.py'):
  embedded=handoff.split('## Script: '+helper+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
  assert embedded.encode()==(S/helper).read_bytes(),helper

(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('DESIGN-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Public recovery and replay

Archive commit `28e4ff278397b671bee89ef5ad0bac269cf6eb07` is an ancestor changing only this issue's suggested file. Its 73 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `cd2ba8794122a3a48678a3c12dae1f38162129f1ee638663ca2e452867ab6121`; payload SHA256 `c58e13fbe77a4ddb9287f1ff1e0a4b4f4a18e2a2f74cede000df84f0adefc43d`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated affine fppf scheme evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE='28e4ff278397b671bee89ef5ad0bac269cf6eb07'
MANIFEST_SHA='cd2ba8794122a3a48678a3c12dae1f38162129f1ee638663ca2e452867ab6121'
PAYLOAD_SHA='c58e13fbe77a4ddb9287f1ff1e0a4b4f4a18e2a2f74cede000df84f0adefc43d'
EXPECTED={'roadmaps': '14ffff517596a48c0553fc53c48cc5daa0ed387daa164993ac8e6fb7a484e453', 'packets': '971fb8ec789dcb1edd65517f21d6ed72fdbece861417eb6b6bff7226a103459c', 'readmes': '2df2079eb9f461733986b2278a683dbab7d3cf053fb5d3c70917164012d8400c', 'suggested': '40605cab060f924b9896824c4c732d53a3ece4c6f46c08e7131df27c9accc89b'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED AFFINE FPPF COVER PAYLOAD\n',1)[1].split('END ARCHIVED AFFINE FPPF COVER PAYLOAD -/',1)[0].encode()
assert sha(pb)==PAYLOAD_SHA
payload=json.loads(pb)
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
for folder,ext,name in [('roadmaps','json','Candidate-roadmap.json'),('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('DESIGN-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
for helper in meta:
 if helper.endswith('.py'):
  embedded=handoff.split('## Script: '+helper+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert embedded.encode()==(S/helper).read_bytes(),helper

(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
