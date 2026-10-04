# Cartesian normalization under arbitrary test-algebra change — checkpoint

Codex — codex-7e92bd. Refs #3403. Partial; every implementation remains unchecked.

For a framed root p=(u,y) of f over a commutative A-algebra B, use the existing normalization algebra Dp=B[T]/(T^n-u), with u a bundled unit and u*y^n=image(f). An arbitrary A-algebra homomorphism phi:B to C induces an actual A-algebra homomorphism Dp to D(phi p), sending T to T and coefficients through phi. Here phi p is exactly the object of the existing framedRootChange functor. These homomorphisms preserve identity and composition. They commute with every actual framed-arrow normalization map, whose root formula uses the inverse of the actual unit label. No section is cancelled.

The coefficient square B,C,Dp,D(phi p) is a native ring pushout. Given a cocone to E, use AdjoinRoot.lift with the image of T under the Dp leg. Its nth power is the required image of phi(u) by the cocone equation. Root and coefficient formulas prove both factorizations, and native root-quotient extensionality proves uniqueness. Applying the pinned spectrum theorem gives a native IsPullback square. Its actual scheme isomorphism to the chosen pullback has both forward projection formulas, both inverse projection formulas and the native inverse roundtrips. These results allow every natural exponent, including zero.

For positive exponent, the spectrum components form a native natural transformation comparing the underlying normalization cover functors over C and B. The whole chart natural transformation over B, after this transformation, equals the left whiskering of the chart transformation over C by framedRootChange. Every component gives the actual Cartesian square of the existing singleton fppf normalization covers. No flatness, injectivity or surjectivity of phi, exponent-invertibility, reducedness, nontriviality or section-regularity is assumed.

Nine typed examples check generators, identity/composition, actual arrow naturality and whole chart factorization, Cartesian covering components, all four isomorphism projections and both roundtrips, wild exponent3 over Z/3, exponent1, exponent0 and the zero ring. For the quotient Z/4 to Z/2, the framed root (1,2) of zero at exponent2 has a nonzero square-zero normalized chart section. The actual normalization map kills it and is not injective, while the actual scheme square is Cartesian. This distinguishes arbitrary change of algebra from claims that nilpotent sections must remain nonzero.

All634 incoming node objects and319 baseline objects are unchanged. This continuation adds21 nodes (3 constructions and18 lemmas),15 API references,14 references to9 distinct typed examples and6 native baseline declarations. Each construction has at least three API items and three tests, with explicit consumers. All40 existing planets remain: these maps refine their existing normalization and root-stack landmarks. Ten stages remain partial, with eight gaps and thirteen requests. Both paper routes, the full omission ledger, all eleven source findings and every version receipt are unchanged. Only the RS.0 stage/coverage frontier and TOWER-TYPING detail gain this result.

Native sheaf RootObject comparison, local line-frame existence, fppf stackification, effective fpqc descent, coherent iterated scheme comparisons, infinite genuine 2-limits and higher-universe adapters remain open. The reserved root-stack key retains arbitrary scheme/stack bases, invertible line bundles with section and all positive exponents in the fppf topology. Étale/DM statements retain their exponent-invertibility conditions. Every inherited source, supplier, relative closed-subscheme and finite Kummer/DVR obligation remains binding.

## Reading and provenance

The whole19646-character issue was read before claim5981452877 in ranges [0,18000] and [18000,19646], and after exact bot confirmation5981454112 in range [0,19646]. Bodies match, SHA256 `80b1094ef57ffa9199903d436336938209a197a5eaf2f0c909560918668f0ed5`. Complete WORKERS was freshly reread. Governing blueprint/expansion/upstream protocols, parent FunctionFieldArithmetic and upstream AlgebraicCurves/JacobianChallenge readings retain this worker's authenticated original scopes at unchanged hashes. No widened historical reading is claimed.

All eight applicable FA0–FA7 reviewed audit row objects were freshly read in complete targeted groups after an initially truncated aggregate, together with the whole REV-AUDIT20 report. No PartII audit row exists. The entire actual reserved root-stack key, native RootObject node with its API/tests, TOWER-TYPING gap, RS.0 description and latest two coverage paragraphs were read. The three directly consumed framedRootChange, normalizationFunctor and normalizationChartNatTrans node objects were read with their API and tests. No fresh whole634-node manual audit is claimed.

Incoming peer PR6073, head0c8e8785ff08d508f1e384173b3054b2618549ce, was recovered by actual public HTTP from archive02fafe0bb1b54f9429eb92f107c95ce7a88b639a. Manifestfcb6183f611cb95aea23c92339eb30efc80b9ff9a4ca22ca70d41a04c43aeb5b authenticates73 artifacts,ten helpers andfive final deliverables. Both actual original verifier reports were rerun at their mathematical and publication bases and matched the archived reports byte-for-byte. All five current input files equal the recovered public bytes. The handoff mathematical/provenance narrative within its first18000 characters and every consumed helper were read in targeted complete scopes. No entire inherited fenced handoff or peer source-reading claim is adopted.

Own PR6065 manifest18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0 authenticates the reused own Reading/InputGuard/Candidate records and inherited own6055/6043 records. All three own Reading records were read in full. Eighteen external controls are unchanged; five own deliverables advanced. The first602 incoming nodes and first299 baseline records equal own6065 exactly. All source issue/version objects and every other inherited contract retain their original attribution. Original Alper and Talpo–Vistoli reading scopes are reused only to their recorded extent.

The complete peer18 new proofs and8 examples were read. Focused incoming native and canonical ranges cover the actual framed-root carrier, normalization maps, prior pushout model and native RootObject interface; Reading.json gives precise ranges. The whole10040-line incoming Native was authenticated and successfully compiled as Context without claiming a fresh complete manual reread. All21 new declarations,9 examples, packet contracts and exact admitted projections were personally read. No inherited planned declaration is weakened or rewritten.

Fresh source context is the whole displayed [Stacks Subsection112.5.13, tag04V8](https://stacks.math.columbia.edu/tag/04V8), its paragraph and bibliography, and the whole displayed [Section26.17, tag01JO](https://stacks.math.columbia.edu/tag/01JO), definitions1/7, lemmas2–6 with proofs and all eight section comments. No references were recursively audited. Lemma26.17.2 and its proof provide the affine fibre-product context; the specialized normalization pushout, naturality and projection formulas are authored deductions using pinned native APIs. SourceReading records actual HTTP hashes, URLs and times. No new source error, version collation or whole-paper closure is claimed.

Pinned adjoined-root maps, lifts, generator formulas and extensionality; pushout cocone colimits; spectrum pullbacks; native pullback isomorphisms and their four projection laws; natural transformations, left whiskering and Over.forget were read with their statements and ambient hypotheses. Reading.json records exact source hashes and bounded ranges. BaselineReading records exact indexed signatures. Three bounded specialized-name scans found no matching normalizationChange or normalizationBaseChangeIso in the pinned Mathlib/Tau sources or current packet directory. The fresh touching-link scan has no PartII records. These scans do not establish exhaustive semantic, PR or discussion absence.

## Validation

The entire Tau-dependent Canonical.lean and byte-equal Suggested.lean remain UNCOMPILED. Fresh TauProbe records source pinf790474821cf4256814db967cb154e7af3d0c369, a different available Tau build and four missing required compiled imports. No build, cache download, Lake project, clone, repository snapshot or language server was created. Lean checks were strictly serial in the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174, using Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Each launch checked fresh available memory of at least20GiB, exact pins, dependency builds, compiler version and tracked cleanliness, with one thread,8192MiB managed limit and1200-second timeout. Every own compiler finished.

- Native.lean: 10456 lines, 396 examples, exit0, 0 warnings, 556 axiom-dependency audits plus 1 axiom-free audits; 40GiB available, 343.23 seconds, peak 4260408KiB. Source SHA256 `c2e62b8972eca0264215a04ce29efe36a63c86e5cd9db8099e1103b05ec3c7a6`; diagnostic SHA256 `c129505014013f3d966e41c4f79719d491270669cb0d38ce63f0a194689f2dcc`.
- Sketch.lean: 8561 lines, 396 examples, exit0, 471 warnings, 231 axiom-dependency audits plus 0 axiom-free audits; 41GiB available, 161.65 seconds, peak 4037200KiB. Source SHA256 `172808e0cff3031e9366fde6b398d1c2cab05a351c9e610f77317a638c1ae6f8`; diagnostic SHA256 `93098318416145674107d7a138f47e6058eb51fdc8908f3db6c06cb7f39755fa`.

Native has396 examples, no errors, warnings or admissions, and all21 new declaration closures audited with only propext, Classical.choice and Quot.sound. The full native replay checks the entire inherited certificate and this append together. Sketch is the bounded Mathlib admitted projection, with396 examples and471 admission warnings only;231 inherited axiom-dependency audits remain clean. The21 declaration headers and9 example headers match the proved append exactly. All three construction bodies remain concrete;18 lemma proofs and9 example proofs are admitted in the projection. Complete Canonical SHA256 `4b2ef3041e38047991aa97bf2c92d065cda64adc841572bbd3697d6bf283e8a6`. Neither whole Tau-dependent file was compiled; the two executed Mathlib cones certify only their actual sources.

Context and the focused Prototype also compiled without errors or warnings; their sources, logs and receipts are retained. Context.olean is disposable and omitted from the archive; optional focused replay first compiles Context using the same runner. The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass. The packet has655 nodes,325 baseline references,529 raw API items and510 raw test references. Both actual immutable verification reports execute the checker, intake and atlas assembler without running Lean.

Publication graph: stage3057/8726, own655/1438, scoped3817/11343 vertices/edges, all acyclic. All89 required supplier pairs are reachable, with no owned skipped or pending links. Every foreign roadmap/stage and inherited stage-edge object equals its immutable control. The45 unrelated pre-existing unreachable restructure pairs remain recorded without changing ownership.

Mathematical base `ce8866e2bfd2db338b709a2c8ef5a97cde812a4b`; publication base `814090e8fe8c4f0b44a1949ae939ced812e4103a`. All23 input guards and the queue job contract match across the bases. Prescribed declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Actual public HTTP recovery authenticates the archive and final files, and both actual original verifier reports are reproduced before opening the PR.

## Resume

Use these arbitrary test-algebra changes and Cartesian normalization covers to compare actual native sheaf RootObjects with chosen-frame coordinates. Local frame existence and the object/arrow comparison remain necessary. Track actual unit labels, chart sections and projection formulas through that construction. Iterated scheme comparison coherence, effective descent, stackification and genuine infinite 2-limits remain separate open obligations. Preserve all source, supplier, route and omission contracts.

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

## Script: author.py

```python
"""Append arbitrary test-algebra change of actual normalization covers."""
from pathlib import Path
import copy,csv,json,re,sys
S=Path(__file__).resolve().parent;RID='FunctionFieldArithmeticPartII';NS='TauCeti.RootStack.';P=RID+':RS.0/normalization-change-'
load=lambda n:json.loads((S/n).read_text())
def save(n,x):(S/n).write_text(json.dumps(x,ensure_ascii=False,indent=2)+'\n')
old=load('Incoming.json');p=copy.deepcopy(old);road=load('Incoming-roadmap.json')
existing={n.get('declarationName','').removeprefix(NS):n['id']for n in old['nodes']}
specs=[
('map','FramedRoot.normalizationChange','construction','Normalization along an arbitrary test-algebra map','For an A-algebra homomorphism phi:B to C and framed root p=(u,y) over B, construct the actual A-algebra homomorphism Dp to D(phi p), where Dp=B[T]/(T^n-u). It applies phi to coefficients and sends the adjoined root to the adjoined root. The target is exactly the normalization algebra of framedRootChange(phi)(p).',['framedRootChange','mathlib:AdjoinRoot.mapAlgHom'],'Apply the native polynomial-quotient mapAlgHom to phi. The target polynomial equals the image of the source polynomial since the changed coefficient is phi(u).'),
('root','FramedRoot.normalizationChange_root','lemma','Change of algebra preserves the normalization root','The normalizationChange map sends the source adjoined root to the target adjoined root.',['FramedRoot.normalizationChange','mathlib:AdjoinRoot.map_root'],'Compute the native adjoined-root map on its root.'),
('coefficients','FramedRoot.normalizationChange_coefficients','lemma','Change of algebra has the exact coefficient map','For each b in B, normalizationChange sends the image of b in Dp to the image of phi(b) in D(phi p).',['FramedRoot.normalizationChange','mathlib:AdjoinRoot.map_of'],'Compute the native adjoined-root map on its coefficient inclusion.'),
('identity','FramedRoot.normalizationChange_identity','lemma','The identity change gives the identity homomorphism','For every p, normalizationChange along the identity A-algebra homomorphism B to B is the identity A-algebra homomorphism of Dp.',['FramedRoot.normalizationChange_root','FramedRoot.normalizationChange_coefficients','mathlib:AdjoinRoot.ringHom_ext'],'Compare coefficients and adjoined roots with native ring-homomorphism extensionality.'),
('composition','FramedRoot.normalizationChange_composition','lemma','Successive changes agree with their composite','For phi:B to C and psi:C to E as A-algebra homomorphisms, normalizationChange(psi,phi p) composed with normalizationChange(phi,p) equals normalizationChange(psi composed with phi,p), as actual A-algebra homomorphisms.',['FramedRoot.normalizationChange_root','FramedRoot.normalizationChange_coefficients','mathlib:AdjoinRoot.ringHom_ext'],'The successive and direct changed coefficients agree definitionally. Compare the two maps on every coefficient and on the adjoined root.'),
('arrow','FramedRoot.normalizationChange_arrow','lemma','Changes of algebra commute with actual framed arrows','For an actual arrow h:p to q, the changed-arrow normalizationRingMap, restricted to A, composed with normalizationChange(phi,q), equals normalizationChange(phi,p) composed with normalizationRingMap(h), restricted to A. Both are actual maps from Dq to D(phi p).',['FramedRoot.normalizationChange_root','FramedRoot.normalizationChange_coefficients','FramedRoot.normalizationRingMap_root','FramedRoot.normalizationRingMap_coefficients','framedRootChange.map_label','mathlib:AdjoinRoot.ringHom_ext'],'Compare coefficients, then roots. The inverse of the changed unit label is the image of its inverse. The two root images are T times the coefficient image of this inverse; no section is cancelled.'),
('base','FramedRoot.normalizationChange_overBase','lemma','Normalization changes form the actual base triangle','Spec(normalizationChange(phi,p)) followed by the source normalizationSpecMap equals the changed normalizationSpecMap followed by Spec(phi), as scheme morphisms to Spec B.',['FramedRoot.normalizationChange_coefficients','FramedRoot.normalizationSpecMap','mathlib:AlgebraicGeometry.Spec.map_comp'],'Apply spectrum contravariance and the exact coefficient computation.'),
('pushout','FramedRoot.normalizationChange_isPushout','lemma','The normalization coefficient square is an actual ring pushout','The actual commutative-ring square with vertices B,C,Dp,D(phi p), sides phi and both coefficient inclusions, and normalizationChange(phi,p), satisfies native IsPushout. This holds for arbitrary phi and every natural exponent.',['FramedRoot.normalizationChange_root','FramedRoot.normalizationChange_coefficients','affineRoot.pow_eq','mathlib:AdjoinRoot.lift','mathlib:AdjoinRoot.lift_of','mathlib:AdjoinRoot.lift_root','mathlib:AdjoinRoot.lift_comp_of','mathlib:AdjoinRoot.ringHom_ext','mathlib:CategoryTheory.Limits.PushoutCocone.IsColimit.mk','mathlib:CategoryTheory.IsPushout.of_isColimit'],'For a cocone C to E and Dp to E agreeing on B, use the native AdjoinRoot.lift with root the image of T in E. Its nth power is the image of u, which equals the image of phi(u) by the cocone equation. Compute both factorizations on coefficients and roots; root-quotient extensionality proves uniqueness. Apply the native pushout cocone colimit constructor.'),
('pullback','FramedRoot.normalizationChange_isPullback','lemma','The normalization square is Cartesian over the changed test scheme','The square with top-left Spec D(phi p), projections the changed normalizationSpecMap to Spec C and Spec(normalizationChange) to Spec Dp, and bottom arrows Spec(phi) and p.normalizationSpecMap, satisfies native IsPullback.',['FramedRoot.normalizationChange_isPushout','FramedRoot.normalizationSpecMap','mathlib:AlgebraicGeometry.isPullback_SpecMap_of_isPushout'],'Use the pinned theorem that spectrum turns this actual ring pushout into a scheme pullback.'),
('iso','FramedRoot.normalizationBaseChangeIso','construction','The actual normalization base-change isomorphism','Construct the native scheme isomorphism from Spec D(phi p) to the chosen pullback of Spec(phi):Spec C to Spec B and p.normalizationSpecMap:Spec Dp to Spec B.',['FramedRoot.normalizationChange_isPullback','mathlib:CategoryTheory.IsPullback.isoPullback'],'Use the native isomorphism from an actual pullback square to the chosen categorical pullback.'),
('hom-fst','FramedRoot.normalizationBaseChangeIso_hom_fst','lemma','The forward isomorphism has the changed coefficient projection','normalizationBaseChangeIso.hom followed by the first pullback projection is exactly the changed framed root normalizationSpecMap to Spec C.',['FramedRoot.normalizationBaseChangeIso','mathlib:CategoryTheory.IsPullback.isoPullback_hom_fst'],'Use the first forward projection law of the native pullback isomorphism.'),
('hom-snd','FramedRoot.normalizationBaseChangeIso_hom_snd','lemma','The forward isomorphism has the actual normalization-change projection','normalizationBaseChangeIso.hom followed by the second pullback projection is exactly Spec(normalizationChange(phi,p)) to Spec Dp.',['FramedRoot.normalizationBaseChangeIso','mathlib:CategoryTheory.IsPullback.isoPullback_hom_snd'],'Use the second forward projection law of the native pullback isomorphism.'),
('inv-fst','FramedRoot.normalizationBaseChangeIso_inv_fst','lemma','The inverse isomorphism recovers the first projection','normalizationBaseChangeIso.inv followed by the changed normalizationSpecMap equals the first pullback projection.',['FramedRoot.normalizationBaseChangeIso','mathlib:CategoryTheory.IsPullback.isoPullback_inv_fst'],'Use the first inverse projection law of the native pullback isomorphism.'),
('inv-snd','FramedRoot.normalizationBaseChangeIso_inv_snd','lemma','The inverse isomorphism recovers the second projection','normalizationBaseChangeIso.inv followed by Spec(normalizationChange(phi,p)) equals the second pullback projection.',['FramedRoot.normalizationBaseChangeIso','mathlib:CategoryTheory.IsPullback.isoPullback_inv_snd'],'Use the second inverse projection law of the native pullback isomorphism.'),
('point','FramedRoot.normalizationChange_point','lemma','Change of algebra preserves the actual normalized chart point','For positive exponent, normalizationChange(phi,p) composed with p.normalizationPoint equals the actual normalizationPoint of framedRootChange(phi)(p), as A-algebra homomorphisms from A[Z]/(Z^n-f).',['FramedRoot.normalizationChange_root','FramedRoot.normalizationChange_coefficients','FramedRoot.normalizationPoint_root','framedRootChange.obj_root','mathlib:AdjoinRoot.algHom_ext'],'Compare the chart root images T times y. Change of coefficients and the changed framed root formula give T times phi(y).'),
('chart','FramedRoot.normalizationChange_chart','lemma','The changed normalization chart triangle commutes','For positive exponent, Spec(normalizationChange(phi,p)) followed by p.normalizationChartMap is the changed framed root normalizationChartMap to Spec(A[Z]/(Z^n-f)).',['FramedRoot.normalizationChange_point','FramedRoot.normalizationChartMap','mathlib:AlgebraicGeometry.Spec.map_comp'],'Apply spectrum contravariance to the whole normalization-point homomorphism equality.'),
('transformation','normalizationChangeNatTrans','construction','The natural transformation comparing changed normalization covers','For positive exponent and arbitrary phi:B to C, construct the native natural transformation from framedRootChange(phi) followed by normalizationFunctor over C and Over.forget, to normalizationFunctor over B followed by Over.forget. Its component at p is Spec(normalizationChange(phi,p)).',['FramedRoot.normalizationChange_arrow','normalizationFunctor','framedRootChange','mathlib:CategoryTheory.NatTrans','mathlib:CategoryTheory.Over.forget','mathlib:AlgebraicGeometry.Spec.map_comp'],'Use the actual spectrum map as component. Spectrum contravariance applied to the whole arrow compatibility equation supplies naturality for every actual framed arrow.'),
('component','normalizationChangeNatTrans_app','lemma','The natural transformation has the actual change-of-algebra component','The component of normalizationChangeNatTrans at p equals Spec(normalizationChange(phi,p)).',['normalizationChangeNatTrans'],'Reduce the component field of the actual natural transformation.'),
('component-base','normalizationChangeNatTrans_base','lemma','The natural transformation components lie over the changed test base','The component at p followed by p.normalizationSpecMap equals the changed normalizationSpecMap followed by Spec(phi).',['normalizationChangeNatTrans_app','FramedRoot.normalizationChange_overBase'],'Reuse the coefficient triangle for the actual component.'),
('chart-factorization','normalizationChangeNatTrans_chart','lemma','The whole chart transformation commutes with test-algebra change','normalizationChangeNatTrans(phi) followed by normalizationChartNatTrans over B equals the left whiskering of normalizationChartNatTrans over C by framedRootChange(phi), as native natural transformations.',['normalizationChangeNatTrans_app','normalizationChartNatTrans','FramedRoot.normalizationChange_chart','mathlib:CategoryTheory.Functor.whiskerLeft'],'Apply native natural-transformation extensionality and use the actual chart triangle at every framed root.'),
('component-cartesian','normalizationChangeNatTrans_isPullback','lemma','Each natural-transformation component gives the actual Cartesian cover square','For positive exponent, the square formed by the component of normalizationChangeNatTrans, the changed and original normalizationSpecMaps, and Spec(phi), satisfies native IsPullback. Thus the existing fppf normalization cover over C is exactly the pullback of the cover over B.',['normalizationChangeNatTrans_app','FramedRoot.normalizationChange_isPullback','FramedRoot.normalizationCover_mem'],'Identify the component with the actual normalization spectrum map and reuse the proved Cartesian square. Positivity separately supplies the existing covering membership; the square itself needed no positivity.')]
ids={name:P+slug for slug,name,*_ in specs};nodes=[]
rootSid='NormalizationChangeRoots-codex-7e92bd';pullSid='NormalizationChangePullbacks-codex-7e92bd'
positive={x[1]for x in specs[14:]}
for slug,name,kind,title,statement,deps,proof in specs:
 hypotheses=['Commutative rings A,B,C in a common universe, A-algebra structures on B and C, arbitrary A-algebra homomorphism phi:B to C, arbitrary f in A and an actual framed root p=(u,y) satisfying u*y^n=image(f), with u a bundled unit. Composition additionally uses a commutative A-algebra E and psi:C to E; arrow statements additionally use actual framed arrows. '+('The natural exponent n is positive.'if name in positive else'Every natural exponent n, including zero, is allowed.'),'No flatness, injectivity or surjectivity of phi, exponent-invertibility, reducedness, nontriviality or section-regularity assumption. No section is cancelled.','Native sheaf RootObject comparison, local frame existence, stackification, effective descent, infinite genuine 2-limits and higher-universe adapters remain open.']
 sources=[dict(sourceId=rootSid,locator='Stacks Subsection112.5.13, tag04V8, roots-of-lines context; authored normalization base-change deduction',excerpt='root stack',match='Literature context only. The exact framed normalization maps and naturality equations are authored deductions from the existing coordinate groupoid and pinned native polynomial-quotient APIs.')]
 if slug in {'pushout','pullback','iso','hom-fst','hom-snd','inv-fst','inv-snd','component-cartesian'}:sources.append(dict(sourceId=pullSid,locator='Stacks Section26.17, tag01JO, Lemma26.17.2 and its proof; affine fibre-product construction',excerpt='in the category of schemes',match='The source provides the categorical fibre-product target and affine construction. The explicit normalization coefficient pushout and its projection formulas are specialized authored deductions using the pinned native universal properties.'))
 nodes.append(dict(id=ids[name],parentStageId=RID+':RS.0',realises=[RID+':RS.0'],kind=kind,title=title,declarationName=NS+name,statement=statement,hypotheses=hypotheses,prerequisites=[d if ':'in d else ids[d]if d in ids else existing[d]for d in deps],proofSteps=[proof],acceptance=[statement,'The actual source and target maps must agree with the existing framed-root and normalization constructions, including nonflat changes that kill nonzero nilpotent sections.'],library=dict(module='TauCeti/AlgebraicGeometry/RootStacks/RS0',namespace=NS[:-1]),sources=sources,api=[],tests=[],implementationStatus='unchecked'))
by={n['declarationName'].removeprefix(NS):n for n in nodes}
apis={'FramedRoot.normalizationChange':['FramedRoot.normalizationChange_root','FramedRoot.normalizationChange_coefficients','FramedRoot.normalizationChange_identity','FramedRoot.normalizationChange_composition','FramedRoot.normalizationChange_arrow','FramedRoot.normalizationChange_point','FramedRoot.normalizationChange_isPushout'],'FramedRoot.normalizationBaseChangeIso':['FramedRoot.normalizationBaseChangeIso_hom_fst','FramedRoot.normalizationBaseChangeIso_hom_snd','FramedRoot.normalizationBaseChangeIso_inv_fst','FramedRoot.normalizationBaseChangeIso_inv_snd'],'normalizationChangeNatTrans':['normalizationChangeNatTrans_app','normalizationChangeNatTrans_base','normalizationChangeNatTrans_chart','normalizationChangeNatTrans_isPullback']}
testdata=[('generators','compatibility','For arbitrary phi and every natural exponent, the actual normalization map sends the root to the root and each b coefficient to the phi(b) coefficient.'),('identity_composition','compatibility','For arbitrary composable A-algebra maps and every natural exponent, the actual normalization maps preserve identity and composition.'),('arrow_chart_cover','compatibility','For every actual framed arrow and positive exponent, the whole ring-map naturality equality and the whole chart natural-transformation factorization hold; the actual component gives a Cartesian square and the changed normalization map is singleton fppf covering.'),('both_projections','compatibility','For arbitrary phi and every natural exponent, the actual normalization base-change isomorphism has both specified forward projections, both inverse projections and both inverse roundtrips.'),('killed_nilpotent','non-example','For the actual quotient map Z/4 to Z/2 as Z-algebras, p=(1,2) at f=0,n=2 has a nonzero square-zero normalized chart root z. The actual normalization map kills z and is not injective, while its component square is Cartesian.'),('wild_exponent','degenerate','Over Z/3 at exponent3 and f=0, every actual change of test Z-algebra gives a Cartesian component square and an actual singleton fppf cover even though the exponent vanishes in the base.'),('exponent_one','degenerate','At exponent1, the changed normalized chart root equals the image of f; the pullback isomorphism second projection followed by the original chart map equals the changed chart map.'),('exponent_zero','degenerate','For any framed root of f=1 at exponent0, the normalization map still preserves the root and its actual scheme base-change isomorphism has the prescribed first projection and inverse roundtrip. No fppf or positive-exponent chart claim is made.'),('zero_ring','degenerate','For Z to the zero ring Z/1 at exponent3 and p=(1,0), the actual changed normalization root is zero, the pullback isomorphism has the correct first projection and the changed normalization map is singleton fppf covering without assuming a spectrum point.')]
tests=[dict(name=NS+'normalizationChangeTests.'+a,kind=b,statement=c)for a,b,c in testdata];tb={a:t for (a,*_),t in zip(testdata,tests)}
testsets={'FramedRoot.normalizationChange':['generators','identity_composition','arrow_chart_cover','killed_nilpotent','exponent_zero'],'FramedRoot.normalizationBaseChangeIso':['both_projections','killed_nilpotent','exponent_one','exponent_zero','zero_ring'],'normalizationChangeNatTrans':['arrow_chart_cover','killed_nilpotent','wild_exponent','zero_ring']}
for name,entries in apis.items():
 by[name]['api']=[dict(name=NS+x,role='compatibility',statement=by[x]['statement'])for x in entries]
 by[name]['tests']=[tb[x]for x in testsets[name]]
 by[name]['uses']=[dict(where=existing['normalizationFunctor'],how='Compare actual normalization covers over different test algebras with Cartesian component squares and preserved actual arrow labels.'),dict(where=RID+':RS.0/root-object',how='Supply changes of affine charts for the open native sheaf RootObject comparison, local frame construction and descent obligations.')]
p['nodes']+=nodes
rows=list(csv.reader(Path(sys.argv[1]).open(),delimiter='\t'));have={x['ref']for x in p['baseline']['declarations']};baseline=[];reading=[]
used=sorted({x.removeprefix('mathlib:')for n in nodes for x in n['prerequisites']if x.startswith('mathlib:')})
for name in used:
 row=next(r for r in rows if len(r)>5 and r[0]=='mathlib'and r[1]==name);reading.append(dict(name=name,file=row[3],line=int(row[4]),signature=row[5],scope='Statement and ambient hypotheses read at the pin in fresh bounded ranges or unchanged authenticated own prior scopes, recorded in Reading.json.'))
 if 'mathlib:'+name not in have:baseline.append(dict(ref='mathlib:'+name,kind=row[2],module=row[3],line=int(row[4]),provides=row[5]+' Native API reused for arbitrary test-algebra change of normalization.',checked='Codex — codex-7e92bd read the declaration at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04; bounded source extent recorded in Reading.json.'))
p['baseline']['declarations']+=baseline;save('BaselineReading.json',reading)
for sid,src,title in zip([rootSid,pullSid],load('SourceReading.json'),['Roots-of-lines context and authored normalization changes','Affine fibre products and authored Cartesian normalization squares']):
 p['sources'].append(dict(id=sid,title=title,authors='The Stacks Project Authors; specialized deductions by Codex — codex-7e92bd',edition='Current displayed section only, accessed4October2026',url=src['url'],sha256=src['sha256'],accessed='2026-10-04',readSections=[src['scope']]))
frontier='Normalization covers now commute with arbitrary changes of the test A-algebra. For phi:B to C and p=(u,y), the actual A-algebra map Dp to D(phi p) sends T to T and coefficients through phi, preserves identity and composition, and commutes with every actual framed-arrow normalization map. Its coefficient square is a native ring pushout, hence its spectrum square is Cartesian. The native isomorphism with the chosen scheme pullback has both forward and inverse projection formulas, for every natural exponent. For positive exponent these components form a native natural transformation between the underlying normalization cover functors; the whole chart natural transformation factors through it exactly, and each component gives the Cartesian square of the existing singleton fppf covers. No flatness or injectivity of phi is assumed: over Z/4 to Z/2 a nonzero square-zero normalized section is killed. Wild exponents and zero rings remain allowed. Native sheaf RootObject comparison, local frame existence, stackification, effective fpqc descent, coherent iterated scheme comparisons, infinite genuine 2-limits and higher-universe adapters remain open, as do all inherited source, supplier and geometric obligations.'
p['summary']+=' Arbitrary test-algebra continuation:21 declarations (3 constructions and18 lemmas),15 API references and9 distinct typed tests with14 references. All634 incoming node objects are unchanged.'
next(x for x in p['coverage']if x['stageId']==RID+':RS.0')['remaining'].append(frontier);next(x for x in p['gaps']if x['id']=='TOWER-TYPING')['detail']+=' '+frontier;next(x for x in road['stages']if x['key']=='RS.0')['description']+=' '+frontier
for name,x in [('Candidate.json',p),(RID+'.json',p),('Candidate-roadmap.json',road),('NewNodes.json',nodes),('NewTests.json',tests)]:save(name,x)
save('Plan.json',dict(newNames=[n['declarationName']for n in nodes],apiAdditions={},newNodes=[n['id']for n in nodes],newBaseline=baseline,newBaselineRefs=[x['ref']for x in baseline],frontier=frontier,newNodesCount=len(nodes),newAPI=sum(map(len,apis.values())),distinctNewAPI=len({x for a in apis.values()for x in a}),newTests=len(tests),testReferences=sum(map(len,testsets.values()))))
intro='''# Cartesian normalization covers under arbitrary test-algebra change

Let p=(u,y) be a framed root of f over the test A-algebra B, with u a bundled unit and u*y^n=image(f). Write Dp=B[T]/(T^n-u). For an arbitrary A-algebra homomorphism phi:B to C, use the existing framedRootChange to form phi p=(phi(u),phi(y)). The actual normalizationChange A-algebra homomorphism Dp to D(phi p) sends coefficients through phi and T to T. It preserves identity and composition and commutes with every actual framed-arrow normalizationRingMap, including its inverse unit label.

The actual coefficient square B,C,Dp,D(phi p) is a ring pushout. To test its universal property against a cocone to E, send the target root to the given image of T from Dp. The cocone equation identifies its nth power with the image of phi(u); native AdjoinRoot.lift gives the map. Coefficient and root computations give both factorizations and uniqueness. Applying Spec gives a Cartesian scheme square. The resulting native isomorphism from Spec D(phi p) to Spec C times over Spec B with Spec Dp has both specified forward projections and both inverse projections. This holds even at exponent zero.

For positive exponent, the spectrum maps form an actual natural transformation comparing the existing normalization cover functors on B and C. Composing with the chart natural transformation over B gives precisely its whiskered counterpart over C. Each component gives the Cartesian square of the existing singleton fppf covers. No flatness, injectivity, exponent-invertibility, reducedness, nontriviality or section-regularity is assumed. A nonzero nilpotent normalized section may be killed under change of algebra; the quotient Z/4 to Z/2 supplies an explicit checked example.

Nine typed examples check generators, identity/composition, arrow and whole chart naturality, Cartesian singleton covers, all four isomorphism projections and both roundtrips, the killed nonzero square-zero section, wild exponent3 in characteristic3, exponent1, exponent0 and the zero ring. The three constructions have15 API references and14 references to these9 examples. All634 incoming nodes and319 baseline records are unchanged; this adds21 nodes and6 baseline declarations. All40 planets remain: these maps and comparison laws refine the existing root-stack and normalization landmarks. Ten stages remain partial, with eight gaps, thirteen requests and eleven unchanged source findings, all routes, omissions and version receipts preserved. Every implementation remains unchecked.

'''+frontier+'\n\n'
parts=[intro]
for n in nodes:
 parts+=['## '+n['title']+'\n\n','**'+n['declarationName']+'** — '+n['statement']+'\n\n','Hypotheses: '+' '.join(n['hypotheses'])+'\n\n','Prerequisites: '+', '.join(n['prerequisites'])+'.\n\n','Proof: '+' '.join(n['proofSteps'])+'\n\n']
 for label,key in [('Consumed API','api'),('Typed examples','tests')]:
  if n[key]:parts+=[label+':\n\n']+['- **'+x['name']+'**: '+x['statement']+'\n'for x in n[key]]+['\n']
(S/'ReaderAddition.md').write_text(''.join(parts));(S/'Reader.md').write_text(''.join(parts)+(S/'IncomingReader.md').read_text())
assert set(re.findall(r'^(?:def|lemma|theorem) ([\w.]+)',(S/'NewProofs.lean').read_text(),re.M))==set(ids)
assert len(nodes)==21 and len(baseline)==6
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(nodes),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),baseline=len(p['baseline']['declarations']),newBaseline=len(baseline))))
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

## Script: write_handoff.py

```python
"""Render this checkpoint with exact native, admitted and uncompiled scopes."""
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
h=f'''# Cartesian normalization under arbitrary test-algebra change — checkpoint

Codex — codex-7e92bd. Refs #3403. Partial; every implementation remains unchecked.

For a framed root p=(u,y) of f over a commutative A-algebra B, use the existing normalization algebra Dp=B[T]/(T^n-u), with u a bundled unit and u*y^n=image(f). An arbitrary A-algebra homomorphism phi:B to C induces an actual A-algebra homomorphism Dp to D(phi p), sending T to T and coefficients through phi. Here phi p is exactly the object of the existing framedRootChange functor. These homomorphisms preserve identity and composition. They commute with every actual framed-arrow normalization map, whose root formula uses the inverse of the actual unit label. No section is cancelled.

The coefficient square B,C,Dp,D(phi p) is a native ring pushout. Given a cocone to E, use AdjoinRoot.lift with the image of T under the Dp leg. Its nth power is the required image of phi(u) by the cocone equation. Root and coefficient formulas prove both factorizations, and native root-quotient extensionality proves uniqueness. Applying the pinned spectrum theorem gives a native IsPullback square. Its actual scheme isomorphism to the chosen pullback has both forward projection formulas, both inverse projection formulas and the native inverse roundtrips. These results allow every natural exponent, including zero.

For positive exponent, the spectrum components form a native natural transformation comparing the underlying normalization cover functors over C and B. The whole chart natural transformation over B, after this transformation, equals the left whiskering of the chart transformation over C by framedRootChange. Every component gives the actual Cartesian square of the existing singleton fppf normalization covers. No flatness, injectivity or surjectivity of phi, exponent-invertibility, reducedness, nontriviality or section-regularity is assumed.

Nine typed examples check generators, identity/composition, actual arrow naturality and whole chart factorization, Cartesian covering components, all four isomorphism projections and both roundtrips, wild exponent3 over Z/3, exponent1, exponent0 and the zero ring. For the quotient Z/4 to Z/2, the framed root (1,2) of zero at exponent2 has a nonzero square-zero normalized chart section. The actual normalization map kills it and is not injective, while the actual scheme square is Cartesian. This distinguishes arbitrary change of algebra from claims that nilpotent sections must remain nonzero.

All634 incoming node objects and319 baseline objects are unchanged. This continuation adds21 nodes (3 constructions and18 lemmas),15 API references,14 references to9 distinct typed examples and6 native baseline declarations. Each construction has at least three API items and three tests, with explicit consumers. All40 existing planets remain: these maps refine their existing normalization and root-stack landmarks. Ten stages remain partial, with eight gaps and thirteen requests. Both paper routes, the full omission ledger, all eleven source findings and every version receipt are unchanged. Only the RS.0 stage/coverage frontier and TOWER-TYPING detail gain this result.

Native sheaf RootObject comparison, local line-frame existence, fppf stackification, effective fpqc descent, coherent iterated scheme comparisons, infinite genuine 2-limits and higher-universe adapters remain open. The reserved root-stack key retains arbitrary scheme/stack bases, invertible line bundles with section and all positive exponents in the fppf topology. Étale/DM statements retain their exponent-invertibility conditions. Every inherited source, supplier, relative closed-subscheme and finite Kummer/DVR obligation remains binding.

## Reading and provenance

The whole19646-character issue was read before claim{c['claim']} in ranges [0,18000] and [18000,19646], and after exact bot confirmation{c['confirmation']} in range [0,19646]. Bodies match, SHA256 `{c['bodySha256']}`. Complete WORKERS was freshly reread. Governing blueprint/expansion/upstream protocols, parent FunctionFieldArithmetic and upstream AlgebraicCurves/JacobianChallenge readings retain this worker's authenticated original scopes at unchanged hashes. No widened historical reading is claimed.

All eight applicable FA0–FA7 reviewed audit row objects were freshly read in complete targeted groups after an initially truncated aggregate, together with the whole REV-AUDIT20 report. No PartII audit row exists. The entire actual reserved root-stack key, native RootObject node with its API/tests, TOWER-TYPING gap, RS.0 description and latest two coverage paragraphs were read. The three directly consumed framedRootChange, normalizationFunctor and normalizationChartNatTrans node objects were read with their API and tests. No fresh whole634-node manual audit is claimed.

Incoming peer PR6073, head0c8e8785ff08d508f1e384173b3054b2618549ce, was recovered by actual public HTTP from archive02fafe0bb1b54f9429eb92f107c95ce7a88b639a. Manifestfcb6183f611cb95aea23c92339eb30efc80b9ff9a4ca22ca70d41a04c43aeb5b authenticates73 artifacts,ten helpers andfive final deliverables. Both actual original verifier reports were rerun at their mathematical and publication bases and matched the archived reports byte-for-byte. All five current input files equal the recovered public bytes. The handoff mathematical/provenance narrative within its first18000 characters and every consumed helper were read in targeted complete scopes. No entire inherited fenced handoff or peer source-reading claim is adopted.

Own PR6065 manifest18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0 authenticates the reused own Reading/InputGuard/Candidate records and inherited own6055/6043 records. All three own Reading records were read in full. Eighteen external controls are unchanged; five own deliverables advanced. The first602 incoming nodes and first299 baseline records equal own6065 exactly. All source issue/version objects and every other inherited contract retain their original attribution. Original Alper and Talpo–Vistoli reading scopes are reused only to their recorded extent.

The complete peer18 new proofs and8 examples were read. Focused incoming native and canonical ranges cover the actual framed-root carrier, normalization maps, prior pushout model and native RootObject interface; Reading.json gives precise ranges. The whole10040-line incoming Native was authenticated and successfully compiled as Context without claiming a fresh complete manual reread. All21 new declarations,9 examples, packet contracts and exact admitted projections were personally read. No inherited planned declaration is weakened or rewritten.

Fresh source context is the whole displayed [Stacks Subsection112.5.13, tag04V8](https://stacks.math.columbia.edu/tag/04V8), its paragraph and bibliography, and the whole displayed [Section26.17, tag01JO](https://stacks.math.columbia.edu/tag/01JO), definitions1/7, lemmas2–6 with proofs and all eight section comments. No references were recursively audited. Lemma26.17.2 and its proof provide the affine fibre-product context; the specialized normalization pushout, naturality and projection formulas are authored deductions using pinned native APIs. SourceReading records actual HTTP hashes, URLs and times. No new source error, version collation or whole-paper closure is claimed.

Pinned adjoined-root maps, lifts, generator formulas and extensionality; pushout cocone colimits; spectrum pullbacks; native pullback isomorphisms and their four projection laws; natural transformations, left whiskering and Over.forget were read with their statements and ambient hypotheses. Reading.json records exact source hashes and bounded ranges. BaselineReading records exact indexed signatures. Three bounded specialized-name scans found no matching normalizationChange or normalizationBaseChangeIso in the pinned Mathlib/Tau sources or current packet directory. The fresh touching-link scan has no PartII records. These scans do not establish exhaustive semantic, PR or discussion absence.

## Validation

The entire Tau-dependent Canonical.lean and byte-equal Suggested.lean remain UNCOMPILED. Fresh TauProbe records source pinf790474821cf4256814db967cb154e7af3d0c369, a different available Tau build and four missing required compiled imports. No build, cache download, Lake project, clone, repository snapshot or language server was created. Lean checks were strictly serial in the existing exact Mathlib build082e2d37e8b0463410cdb532e111cd43d5a66174, using Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Each launch checked fresh available memory of at least20GiB, exact pins, dependency builds, compiler version and tracked cleanliness, with one thread,8192MiB managed limit and1200-second timeout. Every own compiler finished.

'''+line('Native')+line('Sketch')+f'''
Native has396 examples, no errors, warnings or admissions, and all21 new declaration closures audited with only propext, Classical.choice and Quot.sound. The full native replay checks the entire inherited certificate and this append together. Sketch is the bounded Mathlib admitted projection, with396 examples and471 admission warnings only;231 inherited axiom-dependency audits remain clean. The21 declaration headers and9 example headers match the proved append exactly. All three construction bodies remain concrete;18 lemma proofs and9 example proofs are admitted in the projection. Complete Canonical SHA256 `{sha((S/'Canonical.lean').read_bytes())}`. Neither whole Tau-dependent file was compiled; the two executed Mathlib cones certify only their actual sources.

Context and the focused Prototype also compiled without errors or warnings; their sources, logs and receipts are retained. Context.olean is disposable and omitted from the archive; optional focused replay first compiles Context using the same runner. The indexed packet checker, actual immutable intake/file rules and source issue/version checks pass. The packet has655 nodes,325 baseline references,529 raw API items and510 raw test references. Both actual immutable verification reports execute the checker, intake and atlas assembler without running Lean.

Publication graph: stage{g['stageDAG']['vertices']}/{g['stageDAG']['edges']}, own{g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped{g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']} vertices/edges, all acyclic. All{g['requiredPairs']} required supplier pairs are reachable, with no owned skipped or pending links. Every foreign roadmap/stage and inherited stage-edge object equals its immutable control. The{g['otherPreexistingUnreachableRestructurePairs']} unrelated pre-existing unreachable restructure pairs remain recorded without changing ownership.

Mathematical base `{text('base.txt').strip()}`; publication base `{text('publication-base.txt').strip()}`. All23 input guards and the queue job contract match across the bases. Prescribed declaration-index SHA25686649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1. Actual public HTTP recovery authenticates the archive and final files, and both actual original verifier reports are reproduced before opening the PR.

## Resume

Use these arbitrary test-algebra changes and Cartesian normalization covers to compare actual native sheaf RootObjects with chosen-frame coordinates. Local frame existence and the object/arrow comparison remain necessary. Track actual unit labels, chart sections and projection formulas through that construction. Iterated scheme comparison coherence, effective descent, stackification and genuine infinite 2-limits remain separate open obligations. Preserve all source, supplier, route and omission contracts.

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
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='18ea88131174eb1258cfb5aede67d20daf722ee9994d54a83f4811f8cd7c1ba0'
for n,o in [('OwnPreviousReading.json','Reading.json'),('OwnPreviousInputGuard.json','InputGuard.json'),('OwnPreviousCandidate.json','Candidate.json'),('OwnInheritedManifest.json','OwnPreviousManifest.json'),('OwnInheritedReading.json','OwnPreviousReading.json'),('OwnInheritedInputGuard.json','OwnPreviousInputGuard.json'),('OwnEarlierManifest.json','OwnInheritedManifest.json'),('OwnEarlierReading.json','OwnInheritedReading.json'),('OwnEarlierInputGuard.json','OwnInheritedInputGuard.json')]:
 assert sha((S/n).read_bytes())==data('OwnPreviousManifest.json')[o]['sha256'],n
reuse=data('OwnReadingReuse.json');guards=data('OwnPreviousInputGuard.json')
assert len(guards)==len(reuse)==23 and sum(x['unchanged']for x in reuse)==18
for g,u in zip(guards,reuse):
 assert g['path']==u['path'] and g['sha256']==u['before'] and sha(blob(MATH,g['path']))==u['after']
 assert u['unchanged']==(u['before']==u['after'])
claim=data('ClaimReceipt.json');assert claim['issue']==3403 and claim['claim']==5981452877 and claim['confirmation']==5981454112 and claim['beforeAfterEqual']
assert claim['wholeIssueCharacters']==19646 and claim['bodySha256']=='80b1094ef57ffa9199903d436336938209a197a5eaf2f0c909560918668f0ed5'
for key in ['readBefore','readAfter']:
 ranges=claim[key];assert ranges[0][0]==0 and ranges[-1][1]==19646 and all(a[1]==b[0]for a,b in zip(ranges,ranges[1:]))
p=data('Candidate.json');old=data('Incoming.json');road=data('Candidate-roadmap.json');oldroad=data('Incoming-roadmap.json');plan=data('Plan.json')
assert len(old['nodes'])==634 and len(p['nodes'])==655 and p['nodes'][634:]==data('NewNodes.json')
unchanged=0
for a,b in zip(old['nodes'],p['nodes']):
 expected=json.loads(json.dumps(a))
 if a['id']in plan['apiAdditions']:expected['api']+=plan['apiAdditions'][a['id']]
 else:unchanged+=1
 assert b==expected,a['id']
assert unchanged==634 and set(p)==set(old)and plan['apiAdditions']=={}and p['nodes'][:634]==old['nodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage','gaps','sourceIssues','sourceVersions']:assert p[k]==old[k],k
assert p['sourceIssues']==old['sourceIssues'] and len(p['sourceIssues'])==11
assert p['sourceVersions']==old['sourceVersions']
assert p['sources'][:-2]==old['sources']and p['summary'].startswith(old['summary'])
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['baseline']['declarations'][:319]==old['baseline']['declarations']
assert [d['ref']for d in p['baseline']['declarations'][319:]]==plan['newBaselineRefs']and len(plan['newBaselineRefs'])==6
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
assert data('PreviousRecovery.json')['head']=='0c8e8785ff08d508f1e384173b3054b2618549ce'
assert data('PreviousRecovery.json')['artifactsVerified']==73 and data('PreviousRecovery.json')['archivedHelpersVerified']==10
assert data('IncomingReceipt.json')['bothActualVerifiersMatchRecordedExactly'] and data('IncomingReceipt.json')['fiveMathematicalBaseFilesMatchPublicHead']
for i,tag in enumerate(['04V8','01JO']):
 source=data('SourceReading.json')[i]
 assert source['sha256']==sha((S/('Stacks-'+tag+'.html')).read_bytes())==p['sources'][-2+i]['sha256']
 assert source['url']=='https://stacks.math.columbia.edu/tag/'+tag
assert [x['id']for x in p['sources'][-2:]]==['NormalizationChangeRoots-codex-7e92bd','NormalizationChangePullbacks-codex-7e92bd']
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
assert sha((S/'IncomingManifest.json').read_bytes())=='fcb6183f611cb95aea23c92339eb30efc80b9ff9a4ca22ca70d41a04c43aeb5b'
for n,o in [('IncomingPublicationVerification-replayed.json','Verification.json'),('IncomingMathematicalVerification-replayed.json','Verification-mathematical.json')]:
 assert sha((S/n).read_bytes())==data('IncomingManifest.json')[o]['sha256']
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
assert txt('Context.lean')==txt('NativePrefix.lean')
cr=data('Context.receipt.json');assert cr['exitStatus']==0 and cr['warnings']==0 and cr['sourceSha256']==sha((S/'Context.lean').read_bytes()) and cr['logSha256']==sha((S/'Context.log').read_bytes())
assert txt('Prototype.lean')=='import Context\n'+txt('NewProofs.lean')+'\n'+txt('NewTests.lean')
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
assert len(nh)==21 and len(nt)==9
assert set(plan['newNames'])=={NS+n for n in nh}=={n['declarationName']for n in p['nodes'][634:]}
assert {t['name']for t in data('NewTests.json')}=={NS+n for n in re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M)}
for n in p['nodes'][634:]:
 if n['kind']in {'construction','definition'}:assert len(n['api'])>=3 and len(n['tests'])>=3 and n['uses']
 assert n['declarationName']in txt('Reader.md')and n['statement']in txt('Reader.md')
 for x in n['api']+n['tests']:assert x['name']in txt('Reader.md')and x['statement']in txt('Reader.md')
assert sum(len(n['api'])for n in p['nodes'][634:])+sum(map(len,plan['apiAdditions'].values()))==15 and sum(len(n['tests'])for n in p['nodes'][634:])==14
compilation={}
for name,want,audits in [('Native',0,556),('Sketch',471,231)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want,(name,log.count('warning:'))
 ex=len(re.findall(r'^example\b',txt(name+'.lean'),re.M));assert ex==396,(name,ex)
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits,(name,len(a))
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':ex,'axiomFreeAudits':log.count('does not depend on any axioms')}
audited=set(re.findall(r"'([^']+)' (?:depends on axioms:|does not depend on any axioms)",txt('Native.log')))
assert set(plan['newNames'])<=audited
assert 'z ≠ 0' in nt['example#4'] and 'Function.Injective' in nt['example#4'] and 'IsPullback' in nt['example#4']
assert 'Functor.whiskerLeft' in nt['example#2'] and 'e.inv ≫ e.hom' in nt['example#3']
assert txt('NewImports.lean')==''
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
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOTS_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
if BASE==txt('publication-base.txt').strip():assert graph==data('Graph.json')
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,wholeIncomingNodesUnchanged=634,incomingMathematicalContractsPreserved=634,newNodes=21,newAPIItems=15,newTests=9,newTestReferences=14,newSourceFindings=0,inheritedSourceFindingsUnchanged=len(old['sourceIssues']),matchedNewHeaders=len(ch),rawAPIItems=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,canonicalExecution='UNCOMPILED: no existing full Tau Ceti build at the exact pin; entire canonical prefix retained.',inputGuards=len(data('InputGuard.json')),indexSha256=sha(Path(sys.argv[2]).read_bytes()),immutableBase=BASE,graph=graph,LeanExecuted=False),indent=2))
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

## Script: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='FunctionFieldArithmeticPartII'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming-roadmap.json Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md IncomingManifest.json IncomingReceipt.json
IncomingPublicationVerification-replayed.json IncomingMathematicalVerification-replayed.json NativePrefix.lean CanonicalPrefix.lean SketchPrefix.lean NewImports.lean
Native.lean Native.log Native.receipt.json Canonical.lean Sketch.lean Sketch.log Sketch.receipt.json
NewProofs.lean NewTests.lean NewAdmitted.lean Audits.lean Candidate-roadmap.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md
ClaimReceipt.json Reading.json SourceReading.json BaselineReading.json OwnReadingReuse.json OwnContractGuard.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousCandidate.json OwnInheritedManifest.json OwnInheritedReading.json OwnInheritedInputGuard.json OwnEarlierManifest.json OwnEarlierReading.json OwnEarlierInputGuard.json Stacks-04V8.html Stacks-01JO.html LibrarySearch.json TauProbe.json
InputGuard.json PublicationChanges.json Plan.json NewNodes.json NewTests.json PreviousRecovery.json Verification-mathematical.json Verification.json
TouchingLinks.json Graph.json base.txt publication-base.txt Context.lean Context.log Context.receipt.json Prototype.lean Prototype.log Prototype.receipt.json
assemble.py author.py projection.py write_handoff.py verify.py graph.py immutable_view.py compile.py runcheck.py package.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED ARBITRARY NORMALIZATION BASE CHANGE PAYLOAD\n'+pb+b'END ARCHIVED ARBITRARY NORMALIZATION BASE CHANGE PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('roadmaps','Candidate-roadmap.json'),('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated arbitrary normalization base-change evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED ARBITRARY NORMALIZATION BASE CHANGE PAYLOAD\\n',1)[1].split('END ARCHIVED ARBITRARY NORMALIZATION BASE CHANGE PAYLOAD -/',1)[0].encode()
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

Archive commit `254c0957f3094f317acb6ef7bfa275d1468e8baa` is an ancestor changing only this issue's suggested file. Its 79 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `4344232493cc51f824c03261f0bcd8e7a9411cb3ec0c2c0837abe40ece043883`; payload SHA256 `17b522e4534d1ed361291c9d7d4190f0bc4e29e390d69188bdded993bd8ef24e`. The final suggested file has no archive payload and equals the entire Tau-dependent Canonical.lean, which remains UNCOMPILED.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and five final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOTS_VALIDATE_BASE to the mathematical base to reproduce Verification-mathematical.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Sketch.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean and Suggested.lean are byte-equal, but neither whole file was compiled: no existing complete Tau build at the pin is available. The two bounded Mathlib checks certify only their recorded import cones. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated arbitrary normalization base-change evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='FunctionFieldArithmeticPartII'
ARCHIVE='254c0957f3094f317acb6ef7bfa275d1468e8baa'
MANIFEST_SHA='4344232493cc51f824c03261f0bcd8e7a9411cb3ec0c2c0837abe40ece043883'
PAYLOAD_SHA='17b522e4534d1ed361291c9d7d4190f0bc4e29e390d69188bdded993bd8ef24e'
EXPECTED={'roadmaps': 'd11acc241d95788ac6f72377c66ffb02db7cb71e4ba074aa286e34041ad1252e', 'packets': 'd44d0d1877b2ad6fff8128e43f5f63df0dad783c47b16e26d6afeb316d073244', 'readmes': 'c08a8fa0070f7429d3a14694d4e1e36cfaeb1655c72559cd7b35f7421d7343b6', 'suggested': '4b2ef3041e38047991aa97bf2c92d065cda64adc841572bbd3697d6bf283e8a6'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED ARBITRARY NORMALIZATION BASE CHANGE PAYLOAD\n',1)[1].split('END ARCHIVED ARBITRARY NORMALIZATION BASE CHANGE PAYLOAD -/',1)[0].encode()
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
