# Faithfully flat normalization of framed root coordinates — checkpoint

Codex — codex-7e92bd. Refs #3403. Partial; all implementations remain unchecked.

For a framed root p=(u,y) with u*y^n=f and positive n, use the existing algebra D=B[T]/(T^n-u). Its actual root T is a bundled unit with inverse algebraMap(u inverse)*T^(n-1). The actual normalized affine chart point has root image T*algebraMap(y). The changed framed object is isomorphic to its embedded chart point by the actual unit-labelled arrow T, with explicit forward/inverse labels and section transport. The arbitrary algebra-change functor maps both object coordinates and every arrow label, retaining both arrow equations.

The specific normalization extension has an actual Fin n basis, including over the zero ring, and is faithfully flat. It is finitely presented for every natural exponent, including zero; normalization and faithful flatness here require positive exponent. The existing root quotient, generic power-basis and faithful-flatness machinery are reused. No exponent-invertibility, nontriviality, reducedness, section-regularity or injectivity assumption is added.

Eight typed examples include the Z/4 wild-characteristic obstruction: u=3,y=1,f=3,n=2 has no original chart point, but the specified extension admits the actual normalization isomorphism and is faithfully flat and finitely presented. The Z/9 nilpotent section3 stays nonzero and square-zero after normalization, using faithful scalar action and injectivity of the actual coefficient map. Further examples cover n=1, the zero ring, zero sections, actual arrow transport, inverse composition and the nonidentity Z/4 stabilizer killed by change to Z/2. Arbitrary algebra change is therefore not claimed faithful.

All583 incoming node objects and296 baseline objects remain unchanged. This continuation adds19 nodes (four constructions and15 lemmas),12 API references,13 test references to8 distinct typed examples and3 native baseline declarations. Each construction has three API items, at least three typed tests and explicit consumers. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes and the entire omission ledger retain their scope. All eleven source findings and every version receipt are unchanged. Only the RS.0 roadmap/coverage frontier and TOWER-TYPING detail gain this local result. No new source error or implementation closure is asserted.

The native sheaf RootObject-to-coordinate comparison, local existence of line frames, scheme-cover packaging, fppf stackification, effective fpqc descent, infinite coherent reindexing, genuine 2-limits and higher-universe adapters remain open. The root-stack reserved key still covers scheme/stack bases, arbitrary invertible line bundles with section and every positive exponent in the fppf topology. Étale/DM claims retain exponent-invertibility. Yun–Zhang relative closed-subscheme roots, finite Kummer/DVR and other geometric sheaf obligations are unchanged.

## Reading and provenance

The entire19646-character issue was read before claim5978716929 and again after bot5978718473 confirmed that exact comment; bodies match. All eight applicable reviewed FA.0–FA.7 library-coverage row objects were freshly read; the first combined FA2/FA3 display truncated, followed by complete targeted rereads. There is no PartII audit row. The entire reserved root-stack key, TOWER-TYPING gap, native RootObject node, RS.0 roadmap description and latest two RS.0 remaining entries were read. No full fresh reread of all583 nodes or historical coverage text is claimed.

Incoming peer PR6061 at head9df516c55f38f40a7d19e3b064b6fa3f96e4be92 was recovered by actual public HTTP from archive856e94d366950d1b98dcd0b1cc750ce4ef058c34. Manifest dbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9 authenticates74 artifacts,ten helpers andfive final deliverables. Both actual recovered immutable verifier reports reproduced their archived mathematical/publication reports byte-for-byte. No incoming Lean run is claimed from those verifiers.

Own PR6055 manifest0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62 authenticates the reused own Reading/InputGuard/Candidate and nested own6043 manifest c70603277c0c04b8b04ec2cb7fc1826fca7126ef48af42fad31800112390760e. Both levels of original reading/guard hashes are checked. Eighteen external controls are unchanged; five own deliverables changed. Governing protocols, parent and upstream readers, source/supplier/route readings and reviewed audit scopes retain their exact original extent and attribution. WORKERS and PROTOCOL section19 were also freshly reread. OwnContractGuard verifies the unchanged top-level contracts; the two peer source findings/version receipts extend exact own prior prefixes. No peer reading is attributed to this worker.

All25 incoming new proof declarations and9 tests, the entire298-line incoming ProbePrefix, and native blocks1–90,875–950,1860–1958 were freshly read. The full9185-line incoming native certificate is authenticated and recompiled, not claimed manually reread. The focused469-line prefix combines the byte-exact peer prefix, peer new proofs and the actual inherited root-unit inverse block. All consumed authoring, projection, graph, immutable verification, compilation, runner, handoff and package helpers were read before adaptation. The projection and independent header audit preserve complete multiline let/letI conclusions. All three complete incoming Lean prefixes are retained byte-for-byte in order; no new imports are needed.

Actual pinned native statements and ambient hypotheses were read for the new unit constructor, tower algebra map and AdjoinRoot finite-presentation instance, and for the consumed basis, faithful-flatness, injective coefficient map and groupoid APIs. Exact source hashes and bounded ranges are in Reading.json; BaselineReading.json binds the three new references to the index. Exact specialized-name scans in both pinned source trees and the packet directory found no matches; the touching-link scan found no PartII entries. These are bounded searches, not exhaustive semantic/PR/Zulip absence claims.

Fresh primary source reading is limited to Alper's author draft5January2026, complete extracted printedpp.159–160 and its title page. Example4.9.22, its Caution and Exercise4.9.23(c,d) motivate the coordinates and quotient chart. The exercise assumes invertible exponent; the actual affine normalization for all positive exponents is an authored algebraic deduction. SourceReading records the direct HTTP receipt and PDF SHA256 f07437af689e9ae4ccd355183f357d234474606a4e0d6511ff2d4ac0a4f14d6d. No rendered pages, whole book or publisher version was read. E10/E11 and their exact version receipts were freshly inspected; the old2023 draft was not freshly collated, and inherited attribution is preserved.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. TauProbe freshly confirms the exact pinned source f790474821cf4256814db967cb154e7af3d0c369, a different available build and four missing required compiled imports. No Tau/Mathlib build, cache, project, snapshot, clone or language server was created. Lean ran serially in the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d, immediately checked memory at least20GiB, one thread,8192MiB managed limit and1200-second timeout. Every compiler process finished.

- Native.lean: 9464 lines, 372 examples, exit0, 0 warnings, 503 axiom-dependency audits plus 1 axiom-free audits; 42GiB available, 338.23 seconds, peak 4201692KiB. Source SHA256 `3208442598a731869cd775bff36df00f6a481bcf5ba12153821476c5ae600661`; diagnostic SHA256 `fc1227bf096cd22c2242a6664ad7b34e3f96925fda46b935351415f7b6cac7d0`.
- Sketch.lean: 7902 lines, 372 examples, exit0, 403 warnings, 231 axiom-dependency audits plus 0 axiom-free audits; 40GiB available, 156.64 seconds, peak 4018864KiB. Source SHA256 `25b82720a0e2646f71ec57aaadcc7410f55ffc12f638e162f0b13b985773ae01`; diagnostic SHA256 `285d2a228cbee24f4c4929cacf720a9d46b5a2836b712a0c5309c5eaf8a9733e`.

Native contains372 examples, zero errors/warnings/admissions,503 axiom-dependency audits and one axiom-free audit. All19 new declaration closures use only propext,Classical.choice,Quot.sound. The bounded Mathlib Sketch has372 examples and403 admission warnings only, with231 inherited dependency audits. All19 declaration and8 example headers match the admitted projection. The four new constructions remain concrete; only15 lemma proofs and8 example proofs are admitted. Suggested equals the entire Canonical, SHA256 `646e09bd8f93fd6462244aeb0a12d24d83e9143444738e7c3e37d82e342713fa`. These bounded checks do not certify full Tau-dependent canonical execution.

The final focused Prototype also compiled with no warnings/errors; its full source, log and receipt are retained. It supplements the complete native replay. The indexed packet checker and actual intake/file/source-version rules pass. The packet has602 nodes,299 baseline references,489 raw API entries and468 raw test references.

Publication graph: stage3057/8726, own602/1337, scoped3764/11189 vertices/edges, all acyclic. All89 required supplier pairs are reachable, with no owned skipped/pending links. Every foreign roadmap/stage and every inherited stage-edge object matches the immutable control. The45 unrelated pre-existing unreachable restructure pairs are recorded without altering their ownership.

Mathematical base `156be4fe5c33da24d10259243acfb66c20acbd42`; publication base `216f7e6dca7c73bf1824df0eb98b8040058e9f2f`. All23 guarded inputs and the queue job contract match between them. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both immutable verifiers execute the actual checker,intake and atlas assembler without executing Lean or creating a snapshot. Final actual public HTTP recovery and both actual verifier reports must reproduce the archived reports before the PR opens.

## Resume

Use the constructed normalization extension, point and actual isomorphism in the native RootObject comparison under chosen trivializations. Prove local line-frame existence and both object/arrow transports, then package the faithfully flat finite-presentation algebra as the needed scheme cover before fppf stackification. Preserve nonzero nilpotent root sections and automorphisms. Subsequent coherent infinite reindexing, genuine 2-limits and effective descent remain separate open obligations. All existing source, supplier and omission contracts remain binding.

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
"""Append actual faithfully flat normalization of framed root coordinates."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.';P=RID+':RS.0/framed-normalization-'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('change','framedRootChange','construction','Algebra change of framed root coordinates','For every A-algebra map phi:B to C, construct the actual functor sending (u,y) to (phi(u),phi(y)) and every unit-labelled arrow w to phi(w). Retain both arrow equations and the native functor identity and composition laws.',['FramedRoot.groupoid','mathlib:Units.map'],'Map the object equation, section equation and unit-power equation. Native unit-map multiplication and identity give the two functor laws.'),
('change-coefficient','framedRootChange.obj_coefficient','lemma','The changed power-identification unit','The coefficient of the changed framed object is precisely Units.map(phi)(u).',['framedRootChange'],'Reduce the actual functor object.'),
('change-root','framedRootChange.obj_root','lemma','The changed root section','The section of the changed framed object is precisely phi(y).',['framedRootChange'],'Reduce the actual functor object.'),
('change-arrow','framedRootChange.map_label','lemma','The changed arrow label','The underlying unit of each mapped actual arrow is exactly Units.map(phi)(w).',['framedRootChange'],'Reduce the actual functor map.'),
('unit','FramedRoot.normalizationUnit','construction','The adjoined normalization unit','For positive n and p=(u,y), use the existing D=AffineRing(u,n)=B[T]/(T^n-u). Bundle its distinguished root T as a unit, with inverse u inverse times T^(n-1).',['FramedRoot','affineRoot.unit_mul_inverse','mathlib:Units.mkOfMulEqOne'],'Use the existing unit-root inverse identity to construct a native bundled unit. This reuses the existing root algebra and does not define a second quotient.'),
('unit-value','FramedRoot.normalizationUnit_coe','lemma','The normalization unit is the actual root','The value of the normalization unit in D is the distinguished AdjoinRoot root.',['FramedRoot.normalizationUnit'],'Reduce the constructed native unit.'),
('unit-inverse','FramedRoot.normalizationUnit_inv','lemma','The explicit normalization inverse','The inverse normalization unit has value algebraMap(u inverse)*T^(n-1).',['FramedRoot.normalizationUnit'],'Reduce the inverse field of the actual unit.'),
('unit-power','FramedRoot.normalizationUnit_pow','lemma','The normalization unit roots the coefficient','The n-th power of the actual normalization unit is the image of u in D.units.',['FramedRoot.normalizationUnit','affineRoot.pow_eq'],'Use native unit extensionality and the existing distinguished-root power relation.'),
('point','FramedRoot.normalizationPoint','construction','The normalized affine root point','Construct an actual point of the existing affineRootPointGroupoid(f,n,D), equivalently an A-algebra map AffineRing(f,n) to D, whose root image is T*algebraMap(y).',['FramedRoot.normalizationUnit_pow','framedRootChange','FramedRoot.normalized_section_pow','affineRootPoint','mathlib:IsScalarTower.toAlgHom'],'Change the framed object along the actual tower algebra map, apply its normalized-section power formula with the adjoined unit, and lift using the existing affine-root point construction.'),
('point-root','FramedRoot.normalizationPoint_root','lemma','The actual normalized root image','The actual normalization-point algebra map sends the source distinguished root to T*algebraMap(y).',['FramedRoot.normalizationPoint','affineRootPoint.root'],'Apply the defining-root computation of the existing algebra lift.'),
('point-coefficients','FramedRoot.normalizationPoint_coefficients','lemma','The actual normalized coefficient map','For every a in A, the normalization-point algebra map sends the source coefficient a to algebraMap(A,D)(a).',['FramedRoot.normalizationPoint'],'Use the actual algebra homomorphism commutes law.'),
('point-unique','FramedRoot.normalizationPoint_unique','lemma','Uniqueness of the normalization point','Any actual A-algebra point with distinguished-root image T*algebraMap(y) equals the constructed normalization point.',['FramedRoot.normalizationPoint_root','mathlib:AdjoinRoot.algHom_ext'],'Compare the two actual root images and use native AdjoinRoot algebra-hom extensionality.'),
('iso','FramedRoot.normalizationIso','construction','An actual isomorphism to the normalized chart','Construct the native framed-groupoid isomorphism from the changed object p over D to the image of its actual normalization point under rootChartEmbedding. Its forward arrow label is the adjoined normalization unit.',['FramedRoot.normalizationPoint_root','FramedRoot.normalizationUnit_pow','framedRootChange','rootChartEmbedding','mathlib:CategoryTheory.Groupoid.isoEquivHom'],'The point root formula is the section arrow equation. The distinguished-root power relation is the coefficient arrow equation. Use the native groupoid Hom-to-Iso equivalence on this concrete arrow.'),
('iso-hom','FramedRoot.normalizationIso_hom_label','lemma','The forward normalization arrow','The actual forward isomorphism label equals the constructed normalization unit.',['FramedRoot.normalizationIso'],'Reduce the explicit groupoid isomorphism.'),
('iso-inverse','FramedRoot.normalizationIso_inv_label','lemma','The inverse normalization arrow','The actual inverse isomorphism label equals the inverse normalization unit.',['FramedRoot.normalizationIso'],'Reduce the native groupoid inverse.'),
('iso-section','FramedRoot.normalizationIso_section','lemma','Normalization transports the actual section','The embedded normalized section equals the actual forward-arrow unit multiplied by the changed original section.',['FramedRoot.normalizationIso'],'Use the first retained equation of the actual forward arrow, without cancelling the section.'),
('basis','FramedRoot.normalization_finite_basis','lemma','A finite basis for the actual normalization extension','For positive n the actual B-algebra D has a basis indexed by Fin n, including when B is the zero ring.',['FramedRoot','mathlib:AdjoinRoot.powerBasis\u0027','mathlib:Polynomial.monic_X_pow_sub_C','mathlib:Polynomial.natDegree_X_pow_sub_C','mathlib:Module.subsingletonEquiv'],'In the nontrivial case reindex the native monic-polynomial power basis using the exact degree n. In the subsingleton case construct a basis through the native equivalence to the Fin n Finsupp module. No basis cardinality uniqueness is asserted for the zero ring.'),
('faithfully-flat','FramedRoot.normalization_faithfullyFlat','lemma','Faithful flatness of the actual normalization extension','For positive n, Module.FaithfullyFlat B D holds for the actual adjoined unit-root extension. No invertibility of n is required.',['FramedRoot.normalization_finite_basis','mathlib:Module.FaithfullyFlat.of_linearEquiv'],'Use the actual finite basis representation, the nonempty Fin n supplied by positivity, and native preservation of faithful flatness under a linear equivalence.'),
('finite-presentation','FramedRoot.normalization_finitePresentation','lemma','Finite presentation of the actual normalization extension','For every natural n, including zero, Algebra.FinitePresentation B D holds for D=AffineRing(u,n). This lemma omits the positivity premise used for normalization.',['FramedRoot','mathlib:AdjoinRoot.finitePresentation'],'Reuse the native finite-presentation instance for the actual AdjoinRoot algebra.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[];sid='FramedNormalization-codex-7e92bd';src=load('SourceReading.json')[0]
for slug,name,kind,title,statement,deps,proof in specs:
 hypotheses=['Arbitrary commutative A and commutative A-algebras B,C in a common universe; arbitrary section f. Algebra change works for every natural n. Normalization, its basis and faithful flatness use NeZero n. Finite presentation works for every natural n. No exponent-invertibility, reducedness, nontriviality, section-regularity, flatness or injectivity assumption on the original algebras or maps.','This is the actual affine normalization of chosen-frame coordinates. Existence of a line-bundle frame and its native sheaf comparison, scheme-cover packaging, fppf stackification, effective descent and infinite genuine 2-limits remain open.']
 nodes.append(dict(id=ids[name],parentStageId=RID+':RS.0',realises=[RID+':RS.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=hypotheses,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[statement,'Use the existing root algebra, actual native algebra maps and both actual framed-arrow equations; retain nonzero nilpotent root sections.'],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS0',namespace=NS[:-1]),sources=[dict(sourceId=sid,locator='Alper author draft 5 January 2026, Example 4.9.22 and Exercise 4.9.23(c,d), printed pp.159–160; authored affine normalization deductions',excerpt='Root stacks',match='The source motivates root coordinates and the quotient chart. Its exercise assumes an invertible exponent. The explicit faithfully flat affine normalization for arbitrary positive exponent is an authored algebraic deduction using the pinned native root-algebra API; no geometric stackification theorem is attributed or proved here.')],api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={'framedRootChange':['framedRootChange.obj_coefficient','framedRootChange.obj_root','framedRootChange.map_label'],'FramedRoot.normalizationUnit':['FramedRoot.normalizationUnit_coe','FramedRoot.normalizationUnit_inv','FramedRoot.normalizationUnit_pow'],'FramedRoot.normalizationPoint':['FramedRoot.normalizationPoint_root','FramedRoot.normalizationPoint_coefficients','FramedRoot.normalizationPoint_unique'],'FramedRoot.normalizationIso':['FramedRoot.normalizationIso_hom_label','FramedRoot.normalizationIso_inv_label','FramedRoot.normalizationIso_section']}
testdata=[('actual_arrow_change','compatibility','Arbitrary algebra change maps the actual section, retains the coefficient arrow equation and maps the actual unit label.'),('nonfaithful_change','non-example','Under Z/4 to Z/2 at f=0,n=2, the nonidentity framed stabilizer labelled minus1 maps to the identity. Arbitrary coefficient change is not required to be faithful.'),('unit_and_inverse','compatibility','For arbitrary positive exponent the actual normalization unit roots u, the isomorphism has that forward label and its inverse label, and the actual hom-inverse composite is the identity.'),('wild_obstruction_removed','non-example','At f=3,n=2,u=minus1,y=1 over Z/4 no original normalized chart point exists. Over the actual normalization extension there is the explicit isomorphism to its chart point, and that extension is faithfully flat and finitely presented.'),('nilpotent_section_retained','non-example','At f=0,n=2,u=1,y=3 over Z/9 the normalized root image remains nonzero and has square zero. Faithful flatness gives injectivity of the actual coefficient map; the normalizing unit cannot kill the section.'),('exponent_one','computation','At n=1 the normalized root image equals the image of f and the actual normalization isomorphism label equals the image of u.'),('zero_ring','computation','Over Z/1 at n=3 the unit and root values are zero while the actual Fin 3 basis witness and faithful flatness still exist.'),('zero_section','computation','For every positive n and bundled unit u, the zero-section root normalizes to section zero with the actual adjoined-unit arrow and embedded coefficient1.')]
tests=[dict(name=NS+'framedNormalizationTests.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
testsets={'framedRootChange':['actual_arrow_change','nonfaithful_change','wild_obstruction_removed'],'FramedRoot.normalizationUnit':['unit_and_inverse','exponent_one','zero_ring'],'FramedRoot.normalizationPoint':['wild_obstruction_removed','nilpotent_section_retained','exponent_one','zero_section'],'FramedRoot.normalizationIso':['unit_and_inverse','wild_obstruction_removed','zero_section']}
for name,entries in apis.items():
 by[name]['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries]
 by[name]['tests']=[tb[x]for x in testsets[name]]
 by[name]['uses']=[dict(where=existing['rootChartEmbedding.essentialImage_iff'],how='Supply the missing unit root after the concrete faithfully flat finitely presented coefficient extension; retain actual arrows.'),dict(where=RID+':RS.0/root-arrow-scalars',how='Provide the affine normalization target for the still-open native sheaf-coordinate comparison and subsequent fppf stackification.')]
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
for name in ['Units.mkOfMulEqOne','IsScalarTower.toAlgHom','AdjoinRoot.finitePresentation']:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Actual statement and applicable ambient hypotheses personally read at the exact pin; ranges in Reading.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Reuse the native algebraic construction for actual framed-root normalization.',checked='Codex — codex-7e92bd read the statement and ambient hypotheses at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-04.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
p['sources'].append(dict(id=sid,title='Root stacks and authored faithfully flat normalization of framed coordinates',authors='Jarod Alper; specialized deductions by Codex — codex-7e92bd',edition='Author draft 5 January 2026, complete extracted printed pp.159–160 only',url=src['url'],sha256=src['sha256'],accessed='2026-10-04',readSections=[src['scope']]))
frontier='For every chosen-frame root (u,y), the existing extension D=B[T]/(T^n-u) now has its actual adjoined root unit, normalized affine chart point and native framed-groupoid isomorphism labelled by that unit. For every positive exponent D has a Fin n basis and is faithfully flat; it is finitely presented even for n=0. This removes the unit-root obstruction after the specified algebra extension, including wild characteristic, while preserving nonzero nilpotent root sections. The arbitrary algebra-change functor retains actual arrow labels and is not claimed faithful. The native sheaf RootObject-to-coordinate comparison, local line-frame existence, scheme-cover packaging, fppf stackification, effective fpqc descent, infinite coherent reindexing, genuine 2-limits and higher-universe adapters remain open; the reserved scheme/stack and all-positive-exponent fppf scope is unchanged.'
p['summary']+=' Framed normalization continuation:19 declarations (4 constructions and15 lemmas),12 API references and8 distinct typed tests. All583 incoming node objects are unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':RS.0')['remaining'].append(frontier);next(x for x in p['gaps']if x['id']=='TOWER-TYPING')['detail']+=' '+frontier;next(x for x in road['stages']if x['key']=='RS.0')['description']+=' '+frontier
for n,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('NewTests.json',tests)]:save(n,x)
save('Plan.json',dict(newNames=[n['declarationName']for n in nodes],apiAdditions={},newNodes=[n['id']for n in nodes],newBaseline=baseline,newBaselineRefs=[x['ref']for x in baseline],frontier=frontier,newNodesCount=len(nodes),newAPI=sum(map(len,apis.values())),distinctNewAPI=len({x for a in apis.values()for x in a}),newTests=len(tests),testReferences=sum(map(len,testsets.values()))))
intro='''# Faithfully flat normalization of framed root coordinates

Given an actual framed root (u,y), adjoin an n-th root T of its bundled coefficient unit u using the existing algebra D=B[T]/(T^n-u). For positive n, T is an actual unit with inverse u inverse times T^(n-1). The normalized point is the actual A-algebra map with root image T*y. The framed object changed to D is isomorphic to its embedded normalized chart point by the actual arrow labelled T. The extension has a Fin n basis, is faithfully flat, and is finitely presented; exponent invertibility is unnecessary. Finite presentation also holds for exponent zero, although this checkpoint asserts normalization and faithful flatness only for positive exponents.

Over Z/4, n=2,u=3,y=1,f=3 still has no original normalized chart point, but the specified extension removes this obstruction. Over Z/9 at n=2 the nonzero nilpotent root section3 remains nonzero after normalization. The zero ring and exponent1 also satisfy the exact formulas. Algebra change retains both arrow equations; the Z/4 to Z/2 example shows that its functor can kill a nonidentity stabilizer.

All583 incoming node objects,296 baseline objects,40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes,the full omission ledger and all eleven source findings and version receipts are retained. This continuation adds19 nodes,12 API references,13 test references to8 distinct typed examples and3 native baseline references. Every implementation remains unchecked. Full Tau-dependent canonical execution remains UNCOMPILED; separate native and bounded Mathlib checks are reported in the handoff.

'''+frontier+'\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),baseline=len(p['baseline']['declarations']))))
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
"""Render the actual normalization result, exact evidence limits and replay helpers."""
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
g=data('Graph.json');p=data('Candidate.json');plan=data('Plan.json');assert g['worldCommit']==text('publication-base.txt').strip()
h='''# Faithfully flat normalization of framed root coordinates — checkpoint

Codex — codex-7e92bd. Refs #3403. Partial; all implementations remain unchecked.

For a framed root p=(u,y) with u*y^n=f and positive n, use the existing algebra D=B[T]/(T^n-u). Its actual root T is a bundled unit with inverse algebraMap(u inverse)*T^(n-1). The actual normalized affine chart point has root image T*algebraMap(y). The changed framed object is isomorphic to its embedded chart point by the actual unit-labelled arrow T, with explicit forward/inverse labels and section transport. The arbitrary algebra-change functor maps both object coordinates and every arrow label, retaining both arrow equations.

The specific normalization extension has an actual Fin n basis, including over the zero ring, and is faithfully flat. It is finitely presented for every natural exponent, including zero; normalization and faithful flatness here require positive exponent. The existing root quotient, generic power-basis and faithful-flatness machinery are reused. No exponent-invertibility, nontriviality, reducedness, section-regularity or injectivity assumption is added.

Eight typed examples include the Z/4 wild-characteristic obstruction: u=3,y=1,f=3,n=2 has no original chart point, but the specified extension admits the actual normalization isomorphism and is faithfully flat and finitely presented. The Z/9 nilpotent section3 stays nonzero and square-zero after normalization, using faithful scalar action and injectivity of the actual coefficient map. Further examples cover n=1, the zero ring, zero sections, actual arrow transport, inverse composition and the nonidentity Z/4 stabilizer killed by change to Z/2. Arbitrary algebra change is therefore not claimed faithful.

All583 incoming node objects and296 baseline objects remain unchanged. This continuation adds19 nodes (four constructions and15 lemmas),12 API references,13 test references to8 distinct typed examples and3 native baseline declarations. Each construction has three API items, at least three typed tests and explicit consumers. All40 planets,ten partial stages,eight gaps,thirteen requests,both paper routes and the entire omission ledger retain their scope. All eleven source findings and every version receipt are unchanged. Only the RS.0 roadmap/coverage frontier and TOWER-TYPING detail gain this local result. No new source error or implementation closure is asserted.

The native sheaf RootObject-to-coordinate comparison, local existence of line frames, scheme-cover packaging, fppf stackification, effective fpqc descent, infinite coherent reindexing, genuine 2-limits and higher-universe adapters remain open. The root-stack reserved key still covers scheme/stack bases, arbitrary invertible line bundles with section and every positive exponent in the fppf topology. Étale/DM claims retain exponent-invertibility. Yun–Zhang relative closed-subscheme roots, finite Kummer/DVR and other geometric sheaf obligations are unchanged.

## Reading and provenance

The entire19646-character issue was read before claim5978716929 and again after bot5978718473 confirmed that exact comment; bodies match. All eight applicable reviewed FA.0–FA.7 library-coverage row objects were freshly read; the first combined FA2/FA3 display truncated, followed by complete targeted rereads. There is no PartII audit row. The entire reserved root-stack key, TOWER-TYPING gap, native RootObject node, RS.0 roadmap description and latest two RS.0 remaining entries were read. No full fresh reread of all583 nodes or historical coverage text is claimed.

Incoming peer PR6061 at head9df516c55f38f40a7d19e3b064b6fa3f96e4be92 was recovered by actual public HTTP from archive856e94d366950d1b98dcd0b1cc750ce4ef058c34. Manifest dbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9 authenticates74 artifacts,ten helpers andfive final deliverables. Both actual recovered immutable verifier reports reproduced their archived mathematical/publication reports byte-for-byte. No incoming Lean run is claimed from those verifiers.

Own PR6055 manifest0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62 authenticates the reused own Reading/InputGuard/Candidate and nested own6043 manifest c70603277c0c04b8b04ec2cb7fc1826fca7126ef48af42fad31800112390760e. Both levels of original reading/guard hashes are checked. Eighteen external controls are unchanged; five own deliverables changed. Governing protocols, parent and upstream readers, source/supplier/route readings and reviewed audit scopes retain their exact original extent and attribution. WORKERS and PROTOCOL section19 were also freshly reread. OwnContractGuard verifies the unchanged top-level contracts; the two peer source findings/version receipts extend exact own prior prefixes. No peer reading is attributed to this worker.

All25 incoming new proof declarations and9 tests, the entire298-line incoming ProbePrefix, and native blocks1–90,875–950,1860–1958 were freshly read. The full9185-line incoming native certificate is authenticated and recompiled, not claimed manually reread. The focused469-line prefix combines the byte-exact peer prefix, peer new proofs and the actual inherited root-unit inverse block. All consumed authoring, projection, graph, immutable verification, compilation, runner, handoff and package helpers were read before adaptation. The projection and independent header audit preserve complete multiline let/letI conclusions. All three complete incoming Lean prefixes are retained byte-for-byte in order; no new imports are needed.

Actual pinned native statements and ambient hypotheses were read for the new unit constructor, tower algebra map and AdjoinRoot finite-presentation instance, and for the consumed basis, faithful-flatness, injective coefficient map and groupoid APIs. Exact source hashes and bounded ranges are in Reading.json; BaselineReading.json binds the three new references to the index. Exact specialized-name scans in both pinned source trees and the packet directory found no matches; the touching-link scan found no PartII entries. These are bounded searches, not exhaustive semantic/PR/Zulip absence claims.

Fresh primary source reading is limited to Alper's author draft5January2026, complete extracted printedpp.159–160 and its title page. Example4.9.22, its Caution and Exercise4.9.23(c,d) motivate the coordinates and quotient chart. The exercise assumes invertible exponent; the actual affine normalization for all positive exponents is an authored algebraic deduction. SourceReading records the direct HTTP receipt and PDF SHA256 f07437af689e9ae4ccd355183f357d234474606a4e0d6511ff2d4ac0a4f14d6d. No rendered pages, whole book or publisher version was read. E10/E11 and their exact version receipts were freshly inspected; the old2023 draft was not freshly collated, and inherited attribution is preserved.

## Validation

The whole Tau-dependent Canonical.lean and final Suggested.lean remain UNCOMPILED. TauProbe freshly confirms the exact pinned source f790474821cf4256814db967cb154e7af3d0c369, a different available build and four missing required compiled imports. No Tau/Mathlib build, cache, project, snapshot, clone or language server was created. Lean ran serially in the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174 with Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d, immediately checked memory at least20GiB, one thread,8192MiB managed limit and1200-second timeout. Every compiler process finished.

'''+line('Native')+line('Sketch')+f'''
Native contains372 examples, zero errors/warnings/admissions,503 axiom-dependency audits and one axiom-free audit. All19 new declaration closures use only propext,Classical.choice,Quot.sound. The bounded Mathlib Sketch has372 examples and403 admission warnings only, with231 inherited dependency audits. All19 declaration and8 example headers match the admitted projection. The four new constructions remain concrete; only15 lemma proofs and8 example proofs are admitted. Suggested equals the entire Canonical, SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. These bounded checks do not certify full Tau-dependent canonical execution.

The final focused Prototype also compiled with no warnings/errors; its full source, log and receipt are retained. It supplements the complete native replay. The indexed packet checker and actual intake/file/source-version rules pass. The packet has602 nodes,299 baseline references,{sum(len(n.get('api',[]))for n in p['nodes'])} raw API entries and{sum(len(n.get('tests',[]))for n in p['nodes'])} raw test references.

Publication graph: stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All{g['requiredPairs']} required supplier pairs are reachable, with no owned skipped/pending links. Every foreign roadmap/stage and every inherited stage-edge object matches the immutable control. The{g['otherPreexistingUnreachableRestructurePairs']} unrelated pre-existing unreachable restructure pairs are recorded without altering their ownership.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All23 guarded inputs and the queue job contract match between them. Index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Both immutable verifiers execute the actual checker,intake and atlas assembler without executing Lean or creating a snapshot. Final actual public HTTP recovery and both actual verifier reports must reproduce the archived reports before the PR opens.

## Resume

Use the constructed normalization extension, point and actual isomorphism in the native RootObject comparison under chosen trivializations. Prove local line-frame existence and both object/arrow transports, then package the faithfully flat finite-presentation algebra as the needed scheme cover before fppf stackification. Preserve nonzero nilpotent root sections and automorphisms. Subsequent coherent infinite reindexing, genuine 2-limits and effective descent remain separate open obligations. All existing source, supplier and omission contracts remain binding.

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
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='0046e8b5555403fcd1e155fa393b2f64724904d9828b41cbcad3f7ca186e7a62'
for n,o in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnPreviousCandidate.json','Candidate.json'),('OwnInheritedManifest.json','OwnPreviousManifest.json'),('OwnInheritedReading.json','OwnPreviousReading.json'),('OwnInheritedInputGuard.json','OwnPreviousInputGuard.json')]:assert sha((S/n).read_bytes())==data('OwnPreviousManifest.json')[o]['sha256'],n
assert sha((S/'OwnInheritedManifest.json').read_bytes())=='c70603277c0c04b8b04ec2cb7fc1826fca7126ef48af42fad31800112390760e'
for n,o in [('OwnInheritedReading.json','Reading.json'),('OwnInheritedInputGuard.json','InputGuard.json')]:assert sha((S/n).read_bytes())==data('OwnInheritedManifest.json')[o]['sha256']
reuse=data('OwnReadingReuse.json');guards=data('OwnPreviousInputGuard.json')
assert len(guards)==len(reuse)==23 and sum(x['unchanged']for x in reuse)==18
for g,u in zip(guards,reuse):
 assert g['path']==u['path'] and g['sha256']==u['before'] and sha(blob(MATH,g['path']))==u['after']
 assert u['unchanged']==(u['before']==u['after'])
claim=data('ClaimReceipt.json');assert claim['claim']==5978716929 and claim['confirmation']==5978718473 and claim['beforeAfterEqual']
ranges=claim['wholeReadsBeforeAndAfter'];assert ranges[0][0]==0 and ranges[-1][1]==19646 and all(a[1]==b[0]for a,b in zip(ranges,ranges[1:]))
p=data('Candidate.json');old=data('Incoming.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==583 and len(p['nodes'])==602 and p['nodes'][583:]==data('NewNodes.json')
unchanged=0
for a,b in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(a))
 if a['id']in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][a['id']]
 else:unchanged+=1
 assert b==expected,a['id']
assert unchanged==583 and set(p)==set(old)and plan['apiAdditions']=={}and p['nodes'][:583]==old['nodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps','sourceIssues','sourceVersions']:assert p[k]==old[k],k
assert p['sourceIssues']==old['sourceIssues'] and len(p['sourceIssues'])==11
assert p['sourceVersions']==old['sourceVersions']
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:296]==old['baseline']['declarations']
assert [d['ref']for d in p['baseline']['declarations'][296:]]==plan['newBaselineRefs']and len(plan['newBaselineRefs'])==3
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
assert data('PreviousRecovery.json')['head']=='9df516c55f38f40a7d19e3b064b6fa3f96e4be92'
assert data('PreviousRecovery.json')['artifactsVerified']==74
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
assert sha((S/'IncomingManifest.json').read_bytes())=='dbc0b2ddc5a28be6f5bdb1c7d64bf0ba8380b2ccb775d0f84a0f76c7ac54d2b9'
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
assert len(nh)==19 and len(nt)==8
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][583:]}
assert {t['name']for t in data('NewTests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][583:]:
 if n['kind']in {'construction','definition'}:assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 assert n['declarationName']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n['api']+n['tests']:assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][583:])+sum(map(len,plan['apiAdditions'].values()))==12 and sum(len(n['tests'])for n in p['nodes'][583:])==13
compilation={}
for name,want,audits in [('Native',0,503),('Sketch',403,231)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 ex=len(re.findall(r'^example\b',txt(name+'.lean'),re.M));assert ex==372,(name,ex)
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits,(name,len(a))
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':ex,'axiomFreeAudits':log.count('does not depend on any axioms')}
audited=set(re.findall(r"'([^']+)' (?:depends on axioms:|does not depend on any axioms)",txt('Native.log')))
assert set(plan['newNames'])<=audited
assert 'h ≠ 𝟙 p ∧' in nt['example#1'] and 'Algebra.FinitePresentation' in nt['example#3'] and 'Module.FaithfullyFlat' in nt['example#6']
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
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOTS_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
if BASE==txt('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=583,incomingMathematicalContractsPreserved=583,newNodes=19,newAPIItems=12,newTests=8,newTestReferences=13,newSourceFindings=0,inheritedSourceFindingsUnchanged=len(old['sourceIssues']),matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at the exact pin; entire canonical prefix retained.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
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
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnReadingReuse.json OwnContractGuard.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousCandidate.json OwnInheritedManifest.json OwnInheritedReading.json OwnInheritedInputGuard.json LibrarySearch.json TauProbe.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED FRAMED ROOT NORMALIZATION PAYLOAD\n'+pb+b'END ARCHIVED FRAMED ROOT NORMALIZATION PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated framed root normalization evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED FRAMED ROOT NORMALIZATION PAYLOAD\\n',1)[1].split('END ARCHIVED FRAMED ROOT NORMALIZATION PAYLOAD -/',1)[0].encode()
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

Archive commit `9046e3dff8c5bab8467198fe928f936e8f4ee592` is an ancestor changing only this issue's suggested file. Its 72 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0`; payload SHA256 `5d0a246a121e24d9457cb5a3cb948fcf4d37fb2d6a4f88ff247cac941e0c6113`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated framed root normalization evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE='9046e3dff8c5bab8467198fe928f936e8f4ee592'
MANIFEST_SHA='18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0'
PAYLOAD_SHA='5d0a246a121e24d9457cb5a3cb948fcf4d37fb2d6a4f88ff247cac941e0c6113'
EXPECTED={'roadmaps': 'dca6c88485619c8048a1ba9f5f840e89a10c141d10581a9b7801269dae65926b', 'packets': '47ed059fa79fa993203c1173c94f447ffeeb070681257d99f6539fc3973e8e4d', 'readmes': '4810c03aa8815949b53e784d4f2a86362be6fe91248651013c4ad98b6033b4bb', 'suggested': '646e09bd8f93fd6462244aeb0a12d24d83e9143444738e7c3e37d82e342713fa'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED FRAMED ROOT NORMALIZATION PAYLOAD\n',1)[1].split('END ARCHIVED FRAMED ROOT NORMALIZATION PAYLOAD -/',1)[0].encode()
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
