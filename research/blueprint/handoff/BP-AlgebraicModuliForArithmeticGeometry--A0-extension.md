# BP-AlgebraicModuliForArithmeticGeometry--A0-extension: chart transitions

Codex — codex-7e92bd · 4 October 2026 · Refs #672 · **partial**.

Two actual constructions and twelve lemmas give natural local-chart comparisons for fixed-band diagonal Hom sheaves. For i:T→U and j:T→V with local objects x,y and an actual isomorphism F(i)x≅F(j)y, selfHomChartTransition is the existing base-change comparison along i, diagonal fixed-band transport, and the inverse base-change comparison along j. Its values are actual sheaves on C/T, natural on the entire HomCategory(b,b) with native modifications. Its action formula preserves the same supplied coefficient section a∈Multiplicative A(R), with independent coefficient universe w.

The induced natural isomorphism is independent of the supplied fibre isomorphism. It sends every diagonal automorphism loop to identity. For three charts at a common base, two successive comparisons equal the direct comparison for any independently chosen endpoint isomorphism; no cocycle relation between the underlying choices is assumed. Reverse comparisons are inverses even when their fibre isomorphisms are independently chosen. The proofs use the existing diagonal fixed-band independence and composition laws, cancel the middle native base comparison, and retain both endpoint pullback functors. This choice independence is not asserted for arbitrary unrelated two-gerbe endpoints.

selfHomOverlapTransition uses the inherited actual overlapCover and direct overlapIso along q:S→T. Both pseudofunctor composition comparison factors are retained inside that direct overlap isomorphism. The intersection of any given covering sieve with all three pairwise overlap covers is covering. On every member of this common refinement the chosen comparisons satisfy the natural-isomorphism cocycle. This proves the common-refinement cocycle portion, not varying-refinement descent or a global sheaf-gluing construction.

Eight typed parameterized tests check a supplied nonidentity loop inducing identity, an independently chosen reverse map giving a round trip, preservation of empty section carriers, four-chart composition, actual membership and cocycle on a covering triple intersection, comparison with any supplied direct map, preservation of the same coefficient section and naturality for two composed modifications. The nonidentity-loop test retains its supplied nonidentity witness; it does not construct one for every gerbe. No nonconstant-site or nonneutral geometric fixture is added.

All595 incoming node objects are unchanged. The14 additions give609 nodes,553 raw API references and548 raw tests; the new constructions have12 API items and eight tests. Three added baseline references import native Iso.refl, Iso.symm and Iso.trans, not new generic roadmap nodes. All ten gaps,22 requests,eight source issues,ten planets and eight partial stages remain; every implementation status stays unchecked. The reader retains its complete incoming text as a suffix. The complete incoming native, Mathlib-planning and full Tau-import suggested prefixes are retained exactly.

## Reading and provenance

The entire44,034-character issue was read in five bounded slices before claim5977617946 and again after exact bot5977618893 confirmed it. The unchanged body hash is76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. The governing WORKERS.md was reread in full; binding protocols and upstream/expansion instructions were freshly read or reused at their exact continuous-session scopes.

The actual incoming producer is [PR6050](https://github.com/CBirkbeck/tauceti-explorer/pull/6050), verified from this deliverable’s git history: head41c30267cab2636826dc000b62d50d85cfe84247, archive3bfc09759130f0b7dc3c4d5922990803f35a1181. Its public HTTP recovery authenticated63 artifacts,twelve helpers and four final deliverables. The recovered actual verifier and immutable helper were personally read; executing that verifier reproduced its Verification.json byte for byte. IncomingManifest.json has SHA256920969300369966813afd4831dfcc9692117233b9b6bbce2004b9ccbe5cea112. All23 new incoming proof declarations and18 tests were freshly read. The complete older prefix is authenticated and recompiled, not claimed as a new whole-file manual audit.

Own continuous-session [PR6045](https://github.com/CBirkbeck/tauceti-explorer/pull/6045) reading extents and its own inherited PR6034 receipts are reused at exactly unchanged controls:51 mathematical/source/ownership/roadmap controls and six checker/build/intake controls. OwnPreviousManifest.json authenticates own Reading, InputGuard, Candidate and SFBoundary, plus the explicitly retained inherited reading/manifest/input-guard chain. Whole-file equality does not imply fresh whole-file reading. Peer6050 reading claims remain attributed to that worker. OwnReadingReuse.json records all61 before/after comparisons: only the four issue deliverables changed. This preserves the reviewed audit, upstream readers, accepted RS27 ownership and narrowing, reserved gerbe definition/API and prescribed red-team decisions within the exact own reading extents. All old gap/request/source-issue/version contracts are unchanged from own6045; no new supplier or generic theory is introduced. SFBoundary.json confirms SF.1 remains not_read with its nodes,coverage,requests and sourceWorklist unchanged.

Fresh consumed incoming ranges are recorded in Reading.json: native1–70,1747–1904,2129–2260, all new peer proofs/tests, the current complete reserved gerbe contract/API/tests and latest R09.4 frontier. Pinned native Iso40–180, NatIso1–120 and Grothendieck150–181 were freshly read. Their declarations and source hashes are bound in the evidence. Exact-name searches across both complete pinned source trees and current packets found no proposed new names. Existing generic native sheaf, isomorphism and transport APIs are reused. This is not a comprehensive external PR/Zulip absence survey.

The complete displayed [Stacks Section8.11, tag06NY](https://stacks.math.columbia.edu/tag/06NY) was freshly read, including all definitions, Lemmas8.11.2–8 with proofs/diagrams and both comments. SourceReading.json records actual fetched bytes,hash and access time without an HTML snapshot. The source motivates local existence and the independent-transition/cocycle pattern. The exact fixed-band Hom-sheaf formulas and native proofs are authored deductions. Existing E6 and the omitted general varying-base compatibility/SF1 obligation remain; no new source error or full classification/errata closure is claimed.

## Validation and limits

Pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, TauCeti f790474821cf4256814db967cb154e7af3d0c369 and Lean4.34.0-rc2, compiler6a10ac8c22beadecabdbb0919c2b50214762f91d. Both source trees were freshly checked tracked-clean. The complete Tau-import Suggested.lean is **UNCOMPILED**: TauProbe.json records the alternate build at cf386627e9176a3827c1a5fe804989fd94a4d216, with its needed Tau sheaf-cohomology import unavailable. No Lake project, cache download, library build or language server was created.

Native and the separate Mathlib-only Canonical.lean were checked serially with the existing exact pinned build, one thread,8GiB limit and1200-second timeout. The runner checks pins,dependencies,tracked cleanliness,compiler version and at least20GiB immediately before each run. No compiler remains running.

- Native.lean: 3902 lines,142 examples,exit0,0 warnings (0 admissions),202 axiom audits; 52GiB available,elapsed20.37 seconds,peakRSS2351840KiB. Source SHA256 `70879c4ac09a80e77014f2a15c5dabab568fcee224ef0444d739418a94598c57`; log SHA256 `f75a40a3fe778eaa981e06492b01e8ea3cc9050ea381ab0862bb4559893e0f43`.

- Canonical.lean: 7386 lines,403 examples,exit0,896 warnings (896 admissions),0 axiom audits; 52GiB available,elapsed27.87 seconds,peakRSS3819920KiB. Source SHA256 `07ce2cf2c83038c0dfc9182fa1bbd0b75a0a23a22cdc3634727f0a2cb05e3575`; log SHA256 `df4a4bbd2f73a168dbd66cd5ee5e140712e8db4c1a9ce2df7d1dd36717ddb7f5`.

The native prefix has188 inherited audits;14 new audits give202 closures using only propext, Classical.choice and Quot.sound, with no admission or declared axiom. The planning projection retains the two real construction bodies and admits precisely12 lemmas and8 tests. Its20 new admission warnings join876 inherited warnings for896, with no other warning. Exact projection,22 new headers, prefix hashes, example counts and compilation receipts are checked mechanically. Compilation does not change implementation status.

The actual indexed checker reports {'packet': 'research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--A0-extension.json', 'roadmap': 'AlgebraicModuliForArithmeticGeometry', 'status': 'partial', 'nodes': 609, 'kinds': {'definition': 17, 'lemma': 427, 'construction': 132, 'theorem': 28, 'comparison': 5}, 'apiItems': 545, 'unitTests': 515, 'planets': 10, 'baselineDeclarations': 233, 'prerequisites': {'baseline': 627, 'node (this packet)': 1281, 'node (blueprint)': 25, 'stage': 40}, 'gaps': 10, 'requests': 22, 'stagesInScope': 8, 'stagesClosed': 0}; no errors or warnings. Source-issue/version and actual intake checks pass. The immutable stage DAG has 3017 vertices/8655 edges, own declaration DAG 609/1281, scoped DAG 3619/10613. All 24 supplier pairs and 40 accepted touching restructure pairs are reachable; no unresolved leaves or own skipped/pending links. Foreign stages/roadmaps,stage edges and sibling parts are unchanged. All57 external controls plus four incoming deliverables and the complete SF.1 boundary match at both recorded bases.

Mathematical base `52f604174e994cd80e62b3147cedd683ec69e33e`; publication control `52f604174e994cd80e62b3147cedd683ec69e33e`. Actual reports: Verification-math.json and Verification.json. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full uncompiled Suggested.lean SHA256 `9a9a5138fba62ebb9f3af3a4639b2c77ff3615ff802ae3c38e4052fde90a1fde`.

## Resume

Continue from R09.4/chart-transitions: prove compatibility when a common overlap refinement changes, retaining native slice pullback composition and pseudofunctor endpoint comparisons. Then glue the actual Hom sheaves,actions and maps, use the supplied D0 torsor groupoid, prove full faithfulness, and construct a coherent inverse/unit/counit before claiming the global self-equivalence/torsor equivalence. The common-base cocycle proved here must not be presented as that entire descent construction. Do not replace missing proofs or suppliers by records assuming the conclusion.

Retain the independent coefficient universe and empty-section behavior. Construct nonconstant-site and nonneutral geometric fixtures. Intrinsic descended-band/SF1, nonneutral root gerbes and derivedH², compatible fpqc limits, source-issue/version and all other-stage obligations remain. The packet is partial.

## Script: author.py

```python
"""Append fixed-band local-chart transition maps and their choice-free cocycles."""
from pathlib import Path
import copy,csv,hashlib,json,re,subprocess,sys
S=Path(sys.argv[1]).resolve();LIB=Path(sys.argv[2]);INDEX=Path(sys.argv[3]);R=Path.cwd()
RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension';P=RID+':R09.4/';NEW=P+'chart-transitions/';NS='TauCeti.AlgebraicGeometry.BandedMorphism.'
old=json.loads((S/'Incoming.json').read_text());p=copy.deepcopy(old);assert len(old['nodes'])==595
source='OG-chart-transitions-codex-7e92bd'
specs=[
('chart','selfHomChartTransition','Local-chart Hom-sheaf comparison','construction',
 'For i:T→U, j:T→V, x∈F(U), y∈F(V), and an actual e:F(i)x≅F(j)y, construct a natural isomorphism from H_U(x,x;−) followed by native slice pullback i⁎ to H_V(y,y;−) followed by j⁎, on the actual category HomCategory(b,b). Its three factors are the existing base-change natural isomorphism for i, the existing diagonal endpoint transport for e, and the inverse base-change isomorphism for j. Thus its objects are actual sheaves on C/T, not sets of isomorphism classes.',
 [P+'sheaf-base-change/nat-iso',P+'sheaf-transport/nat-iso','mathlib:CategoryTheory.Iso.trans','mathlib:CategoryTheory.Iso.symm'],
 ['Compose the three existing natural isomorphisms, retaining both distinct native slice functors and the same fixed-band modification category.']),
('component','selfHomChartTransition_app','The three comparison factors at a fixed transformation','lemma',
 'At X∈HomCategory(b,b), the local-chart transition is the actual sheaf isomorphism BC_i(X,x,x), then diagonal selfHomSheafTransportIso(X,e), then BC_j(X,y,y) inverse. The target base-change factor is inverted.',
 ['@chart','mathlib:CategoryTheory.Iso.app'],['Unfold composition of native natural isomorphisms at X; all three component factors remain.']),
('equivariant','selfHomChartTransition_equivariant','The transition preserves the actual band section','lemma',
 'For every R→T, a∈Multiplicative A(R) and actual source section p over the composed R→T→U, the transition applied to a acting on p equals the same a acting on the transported section over R→T→V. The two actions are the existing native fibreHomSectionAction; the independent coefficient universe is retained.',
 ['@chart',P+'sheaf-base-change/equivariant',P+'sheaf-transport/equivariant',P+'sheaf-base-change/inv-equivariant'],
 ['Evaluate the three component maps. Apply forward base-change equivariance, diagonal transport equivariance, then inverse base-change equivariance. All use exactly the same coefficient section a.']),
('independent','selfHomChartTransition_independent','Independence from the overlap isomorphism','lemma',
 'For any two actual isomorphisms e,d:F(i)x≅F(j)y, their chart-transition natural isomorphisms are equal. This does not assert e=d; independence uses the abelian fixed-band diagonal transport theorem.',
 ['@chart',P+'sheaf-transport/nat-iso-independent'],['Replace only the middle factor using existing fixed-band independence. The base-change factors are unchanged.']),
('reflexive','selfHomChartTransition_refl','Every diagonal chart loop induces identity','lemma',
 'For any automorphism e of F(i)x, the chart transition from i,x to itself is the identity natural isomorphism, including when e is nonidentity.',
 ['@independent',P+'sheaf-transport/nat-iso-identity','mathlib:CategoryTheory.Iso.refl'],
 ['Replace e by the identity using independence, use the existing identity transport, and cancel the forward/inverse base comparisons.']),
('cocycle','selfHomChartTransition_cocycle','The local-chart cocycle for independent choices','lemma',
 'For three charts i:T→U,j:T→V,k:T→W with objects x,y,z, choose arbitrary e:F(i)x≅F(j)y, d:F(j)y≅F(k)z and a:F(i)x≅F(k)z. The transition for e followed by the transition for d equals the transition for a as natural isomorphisms. No equation a=e followed by d is assumed.',
 ['@independent',P+'sheaf-transport/nat-iso-composition','mathlib:CategoryTheory.Iso.ext'],
 ['Replace a by the composite e followed by d using independence. Expand the three-factor definitions, cancel the j-base comparison with its inverse, and apply composition of the existing diagonal transport.']),
('inverse','selfHomChartTransition_symm','An independently chosen reverse comparison is inverse','lemma',
 'For arbitrary forward e:F(i)x≅F(j)y and backward d:F(j)y≅F(i)x, the inverse natural isomorphism of the transition for e equals the transition for d, without assuming d is the inverse of e.',
 ['@independent','mathlib:CategoryTheory.Iso.symm'],['Replace d by the inverse of e and unfold the inverse of the three-factor composite.']),
('natural','selfHomChartTransition_naturality','Compatibility with every fixed-band modification','lemma',
 'For m:X→Y in the native HomCategory(b,b), i⁎H_U(m) followed by the chart transition at Y equals the chart transition at X followed by j⁎H_V(m). These are equal native sheaf maps on C/T.',
 ['@chart'],['Use the naturality field of the actual composed natural isomorphism.']),
('overlap','selfHomOverlapTransition','Hom-sheaf transition on an actual overlap member','construction',
 'For q:S→T belonging to the actual overlapCover(F,i,j,x,y), construct the natural comparison from (q followed by i)⁎H_U(x,x;−) to (q followed by j)⁎H_V(y,y;−) using the existing direct overlapIso. That iso retains the i-side pseudofunctor composition comparison, a chosen iterated overlap isomorphism, and the inverse j-side comparison. No compatible choice system is assumed.',
 ['@chart',P+'local-covers/chosen-iso'],['Insert the existing direct overlapIso into the chart transition along the two composite base arrows.']),
('overlap-choice','selfHomOverlapTransition_eq','Comparison with every supplied direct overlap map','lemma',
 'The chosen overlap transition equals the chart transition along q followed by i and q followed by j formed with any supplied direct isomorphism between those endpoints. The equality is of complete natural isomorphisms.',
 ['@overlap','@independent'],['Apply chart-transition independence to the actual chosen direct overlapIso and the supplied direct map.']),
('overlap-reflexive','selfHomOverlapTransition_refl','The chosen diagonal overlap transition','lemma',
 'For any membership q in the diagonal overlapCover(F,i,i,x,x), the resulting overlap transition is the identity natural isomorphism. Classical choice need not select the identity fibre automorphism.',
 ['@overlap','@reflexive'],['Apply the chart-loop identity to the chosen direct overlap automorphism.']),
('overlap-cocycle','selfHomOverlapTransition_cocycle','Cocycle on a common overlap refinement','lemma',
 'If the same q:S→T belongs to all three actual pairwise overlap covers for i,x; j,y; k,z, the chosen xy transition followed by the chosen yz transition equals the independently chosen xz transition. The full natural-isomorphism equality retains all fixed-band transformations and modifications.',
 ['@overlap','@cocycle'],['Apply the arbitrary-choice chart cocycle to the three independently selected direct overlap isomorphisms.']),
('overlap-inverse','selfHomOverlapTransition_symm','Reverse chosen overlaps induce inverse maps','lemma',
 'If q belongs to the xy and yx overlap covers, the inverse of the chosen xy overlap transition equals the independently chosen yx overlap transition.',
 ['@overlap','@inverse'],['Apply the reverse-comparison theorem to the two chosen direct isomorphisms.']),
('common-cover','selfHomOverlapTransition_common_cover','A covering common domain for all three transitions','lemma',
 'For any supplied J-covering sieve D on T, its intersection with the xy, yz and xz overlap covers is J-covering. Every member therefore retains membership in D and supplies all three comparisons needed for the cocycle. No fibre products, finite-cover presentation or global gerbe object is required.',
 [P+'local-covers/overlap-covering','mathlib:CategoryTheory.GrothendieckTopology.intersection_covering'],
 ['Use covering of each actual pairwise overlap sieve and apply native intersection_covering three times.'])]
ids={k:NEW+k for k,*_ in specs};known={n['id']for n in old['nodes']}|set(ids.values())
hyps=['Fix an arbitrary site (C,J), an actual Cat-valued pseudofunctor F with IsGerbe F J, and an actual abelian banding b by A:Sheaf J AddCommGrpCat with independent coefficient universe w.', 'The chart comparison uses fixed-band self-transformations in HomCategory(b,b), with all native modifications. Supplied local objects may lie over different bases. No global object, neutrality, terminal object, strict pseudofunctor, or compatibility of independently chosen overlap isomorphisms is assumed.', 'The triple cocycle is an equality on a common supplied refinement with the stated membership evidence. Global sheaf gluing, varying-refinement descent and D0 torsor equivalence remain additional obligations.']
remaining='Fixed-band diagonal Hom sheaves now have actual natural chart comparisons, coefficient equivariance and cocycles on common overlap refinements, independent of the actual overlap choices. All native base-change factors and modifications are retained. This supplies the choice-independent common-refinement cocycle portion of the gluing frontier, not a completed gluing construction: prove compatibility when the refinement changes, glue sheaves/actions/maps, package with the supplied D0 torsor groupoid, and prove full faithfulness with coherent inverse/unit/counit. General two-gerbe endpoint transport does not acquire this diagonal fixed-band independence. Intrinsic descended-band/SF1, nonneutral geometric fixtures, root gerbes and derived H², compatible fpqc limits and all other-stage/source obligations remain open.'
new=[]
for key,name,title,kind,statement,deps,steps in specs:
 deps=[ids[d[1:]]if d.startswith('@')else d for d in deps];assert all(d.startswith('mathlib:')or d in known for d in deps),(key,deps)
 n=dict(id=ids[key],parentStageId=RID+':R09.4',realises=[RID+':R09.4'],title=title,kind=kind,declarationName=NS+name,statement=statement,hypotheses=hyps,prerequisites=deps,proofSteps=steps,acceptance=['The forward comparison at the target chart must be inverted. Independent choices need not compose; prove equality of their induced maps using the established fixed-band independence.',remaining],uses=[dict(where=P+'self-equivalence-torsor',how='Supply local sheaf maps, coefficient equivariance and common-refinement cocycles before actual global gluing and torsor packaging.'),dict(where=P+'sheaf-transport/nat-iso',how='Use the existing diagonal fixed-band transport, with native base-change on both charts; do not duplicate generic sheaf descent or extend choice independence to arbitrary unrelated two-gerbe endpoints.')],library=dict(module='TauCeti/AlgebraicGeometry/Stacks/Gerbes',namespace=NS[:-1]),sources=[dict(sourceId=source,locator='Stacks Section8.11/tag06NY, Definition8.11.1 and Lemma8.11.8 proof; fixed-band Hom-sheaf equations are authored deductions.',excerpt='independent',match='The source supplies local-existence and canonical-transition motivation. The three-factor Hom-sheaf maps, coefficient equations and native natural-isomorphism proofs are authored deductions from the listed existing prerequisites; they do not complete the source’s varying-base gluing obligation.')],implementationStatus='unchecked');new.append(n)
tests=[
 ('chart','nonidentity_loop','non-example','For a supplied nonidentity automorphism of F(i)x, retain its nonidentity witness while its induced chart transition equals identity. This parameterized check does not assert the existence of such an automorphism on every gerbe.'),
 ('chart','independent_inverse','computation','An arbitrary independently chosen reverse transition composed after the forward transition gives the identity actual sheaf map at every X; no inverse relation between the chosen fibre isomorphisms is assumed.'),
 ('chart','empty_sections','degenerate','If the source sheaf has empty sections on R→T, the target section type is empty via the actual inverse transition; no global or local section is chosen.'),
 ('chart','four_charts','compatibility','Three successive transitions among four charts at a common base equal the transition formed using any independently supplied direct isomorphism from the first restricted object to the fourth.'),
 ('overlap','covered_triple','compatibility','On the covering intersection of an arbitrary cover and three pairwise overlap covers, every member retains the arbitrary-cover membership and satisfies the actual chosen-transition cocycle.'),
 ('overlap','chosen_versus_supplied','compatibility','At each fixed-band self-transformation, the chosen overlap transition equals the explicit three-factor sheaf comparison formed with any supplied direct endpoint isomorphism.'),
 ('overlap','overlap_coefficient','compatibility','The chosen overlap transition carries the action of each actual coefficient section a on a source section to the action of exactly the same a on its image, including nontrivial and nonfaithful base restrictions.'),
 ('overlap','modifications_on_overlap','compatibility','The chosen overlap comparison commutes with the composite of two arbitrary native fixed-band modifications. Both pullback functors and all modification components remain in the equation.')]
byid={n['id']:n for n in new};apis={'chart':['component','equivariant','independent','reflexive','cocycle','inverse','natural'],'overlap':['overlap-choice','overlap-reflexive','overlap-cocycle','overlap-inverse','common-cover']}
for key,items in apis.items():
 n=byid[ids[key]];n['api']=[dict(name=byid[ids[k]]['declarationName'],role='compatibility',statement=byid[ids[k]]['statement'])for k in items];n['tests']=[dict(name='TauCeti.AlgebraicGeometry.ChartTransitionTests.'+name,kind=kind,statement=st)for owner,name,kind,st in tests if owner==key]
 assert len(n['api'])>=3 and len(n['tests'])>=3
p['nodes']+=new
rows={r['name']:r for r in csv.DictReader(INDEX.open(),delimiter='\t')if r['library']=='mathlib'};refs={d['ref']for d in old['baseline']['declarations']};added=[]
for ref in sorted({d for n in new for d in n['prerequisites']if d.startswith('mathlib:')}-refs):
 r=rows[ref.removeprefix('mathlib:')];f=LIB/r['file'];d=dict(ref=ref,kind={'def':'definition','theorem':'theorem','lemma':'lemma'}[r['kind']],module=r['file'],sourceLine=int(r['line']),sourceSha256=hashlib.sha256(f.read_bytes()).hexdigest(),provides='Native isomorphism identity, composition or inversion used to assemble actual natural chart comparisons; imported without a new generic declaration.',checked='Declaration, surrounding universes and complete body freshly read at pinned Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 by Codex — codex-7e92bd on 2026-10-04.');added.append(d)
p['baseline']['declarations']+=added
for c in p['coverage']:
 if c['stageId']==RID+':R09.4':c['remaining'].append(remaining)
p['summary']='Fixed-band local-chart Hom-sheaf comparisons and choice-independent common-refinement cocycles: two constructions,12 lemmas,12 API items and8 typed tests; no stage closes. '+old['summary']
p['sources'].append(dict(id=source,title='Fixed-band local-chart Hom-sheaf comparisons and cocycles',authors='The Stacks Project Authors; fixed-band Hom-sheaf deductions by Codex — codex-7e92bd',edition='Displayed Section8.11 read2026-10-04; exact Mathlib pin',url='https://stacks.math.columbia.edu/tag/06NY',accessDate='2026-10-04',readSections=['Whole displayed Section8.11: definitions, Lemmas8.11.2–8 with proofs and diagrams, both comments.','Local-existence and independent-transition pattern only; exact fixed-band Hom-sheaf equations are authored deductions. Existing E6 and omitted varying-base/SF1 obligation retained.']))
plan=dict(newNodes=[n['id']for n in new],newNames=[n['declarationName']for n in new],newAPI=12,newTests=8,tests=tests,remaining=remaining,wholeIncomingObjectsPreserved=595,mathematicalContractsPreserved=595,newBaseline=added)
addition='# Fixed-band chart transitions and overlap cocycles\n\nCodex — codex-7e92bd, 4 October2026. Partial continuation: two constructions and12 lemmas.\n\n'+remaining+'\n\nFor charts i:T→U and j:T→V, the transition is the i-base comparison, the existing diagonal fixed-band transport, then the inverse j-base comparison. It is an actual natural isomorphism on the modification category, with actual sheaves on C/T as values. Independence applies to the induced maps and does not identify the underlying overlap isomorphisms. For a third chart, replace the independent direct choice by the composite choice, cancel the middle base comparison, and use the existing transport composition law. Arbitrary automorphism loops therefore induce identity.\n\nThe existing overlapCover and direct overlapIso supply these maps along composite arrows q followed by i and q followed by j. Both pseudofunctor comparison factors remain inside the direct overlap isomorphism. The covering intersection of the three pairwise overlap covers with any given cover supplies a domain on which all three induced maps satisfy the cocycle equation. Their actions use the same section of the actual band sheaf, and the comparisons commute with all native modifications. The same conclusion is not asserted for unrestricted two-gerbe endpoint choices.\n\n'
for n in new:
 addition+='## '+n['title']+'\n\nDeclaration: **'+n['declarationName']+'**. Node: **'+n['id']+'**.\n\n'+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof plan: '+' '.join(n['proofSteps'])+'\n\nPrerequisites: '+', '.join(n['prerequisites'])+'.\n\n'
 for a in n.get('api',[]):addition+='API **'+a['name']+'**: '+a['statement']+'\n\n'
 for t in n.get('tests',[]):addition+='Test **'+t['name']+'** ('+t['kind']+'): '+t['statement']+'\n\n'
addition+='All595 prior node objects, ten gaps,22 requests,eight source issues,ten planets and eight partial stages are preserved. Every implementation status remains unchecked. Eight parameterized native tests discriminate inverse order, independent choices, empty section carriers, four-chart composition, actual common covering membership, coefficient sections and modifications; no new nonconstant or nonneutral geometric fixture is claimed. The full Tau-dependent suggested file remains uncompiled.\n\nSource context: [Stacks Section8.11](https://stacks.math.columbia.edu/tag/06NY). The precise Hom-sheaf comparisons and proofs above are authored deductions. The inherited E6 projection-label issue and general varying-base compatibility/SF1 boundary remain; no new source error is asserted. The complete prior reader follows verbatim.\n\n'
for name,data in [('Candidate.json',p),(STEM+'.json',p),('Plan.json',plan),('new-nodes.json',new)]: (S/name).write_text(json.dumps(data,indent=2,ensure_ascii=False)+'\n')
(S/'ReaderAddition.md').write_text(addition);(S/'Reader.md').write_text(addition+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newBaseline=len(added),baseline=len(p['baseline']['declarations']),rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']))))
```

## Script: projection.py

```python
"""Keep comparison/map data; admit theorem/test bodies and construction proof fields."""
import re

def marker(block):
    depth=0
    for k,c in enumerate(block):
        if c in '([{':depth+=1
        elif c in ')]}':depth-=1
        if block[k:k+2]==':='and depth==0:
            prefix=block[block.rfind('\n',0,k)+1:k].strip()
            if re.match(r'(?:example\s*:\s*)?let\b',prefix) and ':=' not in prefix:continue
            return k
    raise AssertionError('No declaration body marker')

def admit_lemmas(text):
    lines=text.splitlines(keepends=True);out=[];i=0
    while i<len(lines):
        if re.match(r'^lemma |^example\b',lines[i]):
            j=i+1
            while j<len(lines)and(not lines[j].strip()or lines[j][0].isspace()):j+=1
            block=''.join(lines[i:j]);k=marker(block)
            out.append(block[:k]+':= by\n  sorry\n\n');i=j
        else:out.append(lines[i]);i+=1
    return ''.join(out)

def project(proofs,tests):
    return admit_lemmas(proofs)+'\n'+admit_lemmas(tests)

if __name__=='__main__':
    from pathlib import Path
    import sys
    S=Path(sys.argv[1]);R=Path.cwd();STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
    new=project((S/'NewProofs.lean').read_text(),(S/'Tests.lean').read_text());(S/'NewAdmitted.lean').write_text(new)
    (S/'Canonical.lean').write_text((S/'IncomingMathlibCanonical.lean').read_text()+'\n'+new)
    (S/'Suggested.lean').write_text((S/'Incoming-suggested.lean').read_text()+'\n'+new)
    (R/'research/blueprint/suggested'/(STEM+'.lean')).write_bytes((S/'Suggested.lean').read_bytes())
    print('Projected admissions',len(re.findall(r'\bsorry\b',new)))
```

## Script: assemble.py

```python
"""Preserve incoming prefixes; admit only new theorem and test bodies."""
from pathlib import Path
import re,sys
S=Path(sys.argv[1]).resolve();sys.path.insert(0,str(S))
from projection import project
p=(S/'NewProofs.lean').read_text();t=(S/'Tests.lean').read_text()
names=re.findall(r'^(?:noncomputable )?(?:def|lemma) (\w+)',p,re.M)
assert len(names)==14
a=''.join('#print axioms TauCeti.AlgebraicGeometry.BandedMorphism.'+n+'\n'for n in names)
n=project(p,t);assert len(re.findall(r'\bsorry\b',n))==20
for name,text in [('Audits.lean',a),('NewAdmitted.lean',n),('Native.lean',(S/'NativePrefix.lean').read_text()+'\n'+p+'\n'+t+'\n'+a),('Canonical.lean',(S/'MathlibPrefix.lean').read_text()+'\n'+n),('Suggested.lean',(S/'Incoming.lean').read_text()+'\n'+n)]:
 (S/name).write_text(text)
```

## Script: handoff.py

```python
"""Write exact mathematical scope and evidence; package adds immutable public recovery."""
from pathlib import Path
import hashlib,json,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd();STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
sha=lambda b:hashlib.sha256(b).hexdigest()
t='''# BP-AlgebraicModuliForArithmeticGeometry--A0-extension: chart transitions

Codex — codex-7e92bd · 4 October 2026 · Refs #672 · **partial**.

Two actual constructions and twelve lemmas give natural local-chart comparisons for fixed-band diagonal Hom sheaves. For i:T→U and j:T→V with local objects x,y and an actual isomorphism F(i)x≅F(j)y, selfHomChartTransition is the existing base-change comparison along i, diagonal fixed-band transport, and the inverse base-change comparison along j. Its values are actual sheaves on C/T, natural on the entire HomCategory(b,b) with native modifications. Its action formula preserves the same supplied coefficient section a∈Multiplicative A(R), with independent coefficient universe w.

The induced natural isomorphism is independent of the supplied fibre isomorphism. It sends every diagonal automorphism loop to identity. For three charts at a common base, two successive comparisons equal the direct comparison for any independently chosen endpoint isomorphism; no cocycle relation between the underlying choices is assumed. Reverse comparisons are inverses even when their fibre isomorphisms are independently chosen. The proofs use the existing diagonal fixed-band independence and composition laws, cancel the middle native base comparison, and retain both endpoint pullback functors. This choice independence is not asserted for arbitrary unrelated two-gerbe endpoints.

selfHomOverlapTransition uses the inherited actual overlapCover and direct overlapIso along q:S→T. Both pseudofunctor composition comparison factors are retained inside that direct overlap isomorphism. The intersection of any given covering sieve with all three pairwise overlap covers is covering. On every member of this common refinement the chosen comparisons satisfy the natural-isomorphism cocycle. This proves the common-refinement cocycle portion, not varying-refinement descent or a global sheaf-gluing construction.

Eight typed parameterized tests check a supplied nonidentity loop inducing identity, an independently chosen reverse map giving a round trip, preservation of empty section carriers, four-chart composition, actual membership and cocycle on a covering triple intersection, comparison with any supplied direct map, preservation of the same coefficient section and naturality for two composed modifications. The nonidentity-loop test retains its supplied nonidentity witness; it does not construct one for every gerbe. No nonconstant-site or nonneutral geometric fixture is added.

All595 incoming node objects are unchanged. The14 additions give609 nodes,553 raw API references and548 raw tests; the new constructions have12 API items and eight tests. Three added baseline references import native Iso.refl, Iso.symm and Iso.trans, not new generic roadmap nodes. All ten gaps,22 requests,eight source issues,ten planets and eight partial stages remain; every implementation status stays unchecked. The reader retains its complete incoming text as a suffix. The complete incoming native, Mathlib-planning and full Tau-import suggested prefixes are retained exactly.

## Reading and provenance

The entire44,034-character issue was read in five bounded slices before claim5977617946 and again after exact bot5977618893 confirmed it. The unchanged body hash is76b4b208fdc2daf287aff24fff621ad30741280c84a8c35c7f6ac34c2ea459af. The governing WORKERS.md was reread in full; binding protocols and upstream/expansion instructions were freshly read or reused at their exact continuous-session scopes.

The actual incoming producer is [PR6050](https://github.com/CBirkbeck/tauceti-explorer/pull/6050), verified from this deliverable’s git history: head41c30267cab2636826dc000b62d50d85cfe84247, archive3bfc09759130f0b7dc3c4d5922990803f35a1181. Its public HTTP recovery authenticated63 artifacts,twelve helpers and four final deliverables. The recovered actual verifier and immutable helper were personally read; executing that verifier reproduced its Verification.json byte for byte. IncomingManifest.json has SHA256920969300369966813afd4831dfcc9692117233b9b6bbce2004b9ccbe5cea112. All23 new incoming proof declarations and18 tests were freshly read. The complete older prefix is authenticated and recompiled, not claimed as a new whole-file manual audit.

Own continuous-session [PR6045](https://github.com/CBirkbeck/tauceti-explorer/pull/6045) reading extents and its own inherited PR6034 receipts are reused at exactly unchanged controls:51 mathematical/source/ownership/roadmap controls and six checker/build/intake controls. OwnPreviousManifest.json authenticates own Reading, InputGuard, Candidate and SFBoundary, plus the explicitly retained inherited reading/manifest/input-guard chain. Whole-file equality does not imply fresh whole-file reading. Peer6050 reading claims remain attributed to that worker. OwnReadingReuse.json records all61 before/after comparisons: only the four issue deliverables changed. This preserves the reviewed audit, upstream readers, accepted RS27 ownership and narrowing, reserved gerbe definition/API and prescribed red-team decisions within the exact own reading extents. All old gap/request/source-issue/version contracts are unchanged from own6045; no new supplier or generic theory is introduced. SFBoundary.json confirms SF.1 remains not_read with its nodes,coverage,requests and sourceWorklist unchanged.

Fresh consumed incoming ranges are recorded in Reading.json: native1–70,1747–1904,2129–2260, all new peer proofs/tests, the current complete reserved gerbe contract/API/tests and latest R09.4 frontier. Pinned native Iso40–180, NatIso1–120 and Grothendieck150–181 were freshly read. Their declarations and source hashes are bound in the evidence. Exact-name searches across both complete pinned source trees and current packets found no proposed new names. Existing generic native sheaf, isomorphism and transport APIs are reused. This is not a comprehensive external PR/Zulip absence survey.

The complete displayed [Stacks Section8.11, tag06NY](https://stacks.math.columbia.edu/tag/06NY) was freshly read, including all definitions, Lemmas8.11.2–8 with proofs/diagrams and both comments. SourceReading.json records actual fetched bytes,hash and access time without an HTML snapshot. The source motivates local existence and the independent-transition/cocycle pattern. The exact fixed-band Hom-sheaf formulas and native proofs are authored deductions. Existing E6 and the omitted general varying-base compatibility/SF1 obligation remain; no new source error or full classification/errata closure is claimed.

## Validation and limits

Pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, TauCeti f790474821cf4256814db967cb154e7af3d0c369 and Lean4.34.0-rc2, compiler6a10ac8c22beadecabdbb0919c2b50214762f91d. Both source trees were freshly checked tracked-clean. The complete Tau-import Suggested.lean is **UNCOMPILED**: TauProbe.json records the alternate build at cf386627e9176a3827c1a5fe804989fd94a4d216, with its needed Tau sheaf-cohomology import unavailable. No Lake project, cache download, library build or language server was created.

Native and the separate Mathlib-only Canonical.lean were checked serially with the existing exact pinned build, one thread,8GiB limit and1200-second timeout. The runner checks pins,dependencies,tracked cleanliness,compiler version and at least20GiB immediately before each run. No compiler remains running.
'''
for name in ['Native','Canonical']:
 d=json.loads((S/(name+'.receipt.json')).read_text());code=(S/(name+'.lean')).read_text();ex=sum(l.startswith('example')for l in code.splitlines())
 t+=f"\n- {name}.lean: {len(code.splitlines())} lines,{ex} examples,exit{d['exitStatus']},{d['warnings']} warnings ({d['admissionWarnings']} admissions),{d['axiomAudits']} axiom audits; {d['availableGiBBefore']}GiB available,elapsed{d['elapsedSeconds']} seconds,peakRSS{d['maxRssKiB']}KiB. Source SHA256 `{d['sourceSha256']}`; log SHA256 `{d['logSha256']}`.\n"
t+='''
The native prefix has188 inherited audits;14 new audits give202 closures using only propext, Classical.choice and Quot.sound, with no admission or declared axiom. The planning projection retains the two real construction bodies and admits precisely12 lemmas and8 tests. Its20 new admission warnings join876 inherited warnings for896, with no other warning. Exact projection,22 new headers, prefix hashes, example counts and compilation receipts are checked mechanically. Compilation does not change implementation status.
'''
if (S/'Verification.json').exists():
 v=json.loads((S/'Verification.json').read_text());q=v['checker'];g=v['graph']
 t+=f"\nThe actual indexed checker reports {q}; no errors or warnings. Source-issue/version and actual intake checks pass. The immutable stage DAG has {g['stageDAG']['vertices']} vertices/{g['stageDAG']['edges']} edges, own declaration DAG {g['ownDeclarationDAG']['vertices']}/{g['ownDeclarationDAG']['edges']}, scoped DAG {g['scopedDAG']['vertices']}/{g['scopedDAG']['edges']}. All {g['requiredPairs']} supplier pairs and {g['restructurePairs']} accepted touching restructure pairs are reachable; no unresolved leaves or own skipped/pending links. Foreign stages/roadmaps,stage edges and sibling parts are unchanged. All57 external controls plus four incoming deliverables and the complete SF.1 boundary match at both recorded bases.\n"
t+=f"\nMathematical base `{(S/'base.txt').read_text().strip()}`; publication control `{(S/'publication-base.txt').read_text().strip()}`. Actual reports: Verification-math.json and Verification.json. Declaration-index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`. Full uncompiled Suggested.lean SHA256 `{sha((S/'Suggested.lean').read_bytes())}`.\n"
t+='''
## Resume

Continue from R09.4/chart-transitions: prove compatibility when a common overlap refinement changes, retaining native slice pullback composition and pseudofunctor endpoint comparisons. Then glue the actual Hom sheaves,actions and maps, use the supplied D0 torsor groupoid, prove full faithfulness, and construct a coherent inverse/unit/counit before claiming the global self-equivalence/torsor equivalence. The common-base cocycle proved here must not be presented as that entire descent construction. Do not replace missing proofs or suppliers by records assuming the conclusion.

Retain the independent coefficient universe and empty-section behavior. Construct nonconstant-site and nonneutral geometric fixtures. Intrinsic descended-band/SF1, nonneutral root gerbes and derivedH², compatible fpqc limits, source-issue/version and all other-stage obligations remain. The packet is partial.
'''
for name in ['author.py','projection.py','assemble.py','handoff.py','verify.py','graph.py','immutable_view.py','compile.py','runcheck.py','package.py','recover-incoming.py']:
 t+='\n## Script: '+name+'\n\n```python\n'+(S/name).read_text()+'```\n'
assert all(l.rstrip()==l for l in t.splitlines())
(S/'HandoffBase.md').write_text(t);(S/'Handoff.md').write_text(t)
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','Handoff.md')]:
 (R/'research/blueprint'/folder/(('BP-'if folder=='handoff'else'')+STEM+'.'+ext)).write_bytes((S/name).read_bytes())
```

## Script: verify.py

```python
"""Run exact preservation and actual immutable checker/intake/atlas; never Lean."""
from pathlib import Path
import ast,copy,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension';NS='TauCeti.AlgebraicGeometry.BandedMorphism.'
sha=lambda b:hashlib.sha256(b).hexdigest()
def txt(n):return (S/n).read_text()
def data(n):return json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('MODULI_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext for folder,ext in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
texts={p:txt(n)for p,n in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if (S/'PublicHandoff.md').exists()else'Handoff.md'])}
assert texts[paths[-1]].startswith(txt('HandoffBase.md'))
for p,n in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,p)==(S/n).read_bytes()==blob(BASE,p),p
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json')
assert len(old['nodes'])==595 and len(p['nodes'])==609 and p['nodes'][595:]==data('new-nodes.json')
assert p['nodes'][:595]==old['nodes'] and set(p)==set(old)
for k in old:
 if k not in ['nodes','summary','sources','coverage','baseline']:assert p[k]==old[k],k
assert p['summary'].endswith(old['summary'])and p['sources'][:-1]==old['sources']
expectedBaseline=copy.deepcopy(old['baseline'])
expectedBaseline['declarations']+=plan['newBaseline']
assert p['baseline']==expectedBaseline and len(p['baseline']['declarations'])==233
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':R09.4':assert b['remaining']==a['remaining']+[plan['remaining']]and {k:v for k,v in a.items()if k!='remaining'}=={k:v for k,v in b.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert data('Search.json')['names']==plan['newNames'] and all(q['exitStatus']==1 and q['matches']==[]for q in data('Search.json')['searches'])
assert len(p['gaps'])==10 and len(p['requests'])==22 and len(p['sourceIssues'])==8 and len(p['coverage'])==8
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
from projection import project
proofs=txt('NewProofs.lean');tests=txt('Tests.lean');admitted=txt('NewAdmitted.lean')
assert admitted==project(proofs,tests)
assert len(re.findall(r'\bsorry\b',admitted))==20
assert txt('Native.lean')==txt('NativePrefix.lean')+'\n'+proofs+'\n'+tests+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert txt('Canonical.lean')==txt('MathlibPrefix.lean')+'\n'+admitted
assert txt('Suggested.lean')==txt('Incoming.lean')+'\n'+admitted
pm=data('IncomingManifest.json')
assert sha((S/'IncomingManifest.json').read_bytes())=='920969300369966813afd4831dfcc9692117233b9b6bbce2004b9ccbe5cea112'
for n,source in [('NativePrefix.lean','Native.lean'),('MathlibPrefix.lean','Canonical.lean'),('Incoming.lean','Suggested.lean')]:assert sha((S/n).read_bytes())==pm[source]['sha256']
assert txt('IncomingVerification-replayed.json')==txt('PreviousVerification.json')and sha((S/'IncomingVerification-replayed.json').read_bytes())==pm['Verification.json']['sha256']
def headers(text):
 out={};ex=0
 for m in re.finditer(r'^(?:noncomputable )?(def|lemma|example)\b(?: (\w+))?',text,re.M):
  depth=0;end=None
  for i in range(m.start(),len(text)):
   c=text[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and text.startswith(':=',i):
    prefix=text[text.rfind('\n',0,i)+1:i].strip()
    if re.match(r'(?:example\s*:\s*)?let\b',prefix)and ':='not in prefix:continue
    end=i;break
   if depth==0 and m[1]=='def'and text.startswith('where',i)and text[i-1].isspace()and text[i+5].isspace():end=i;break
  assert end is not None
  name=m[2]if m[1]!='example'else'example#'+str(ex)
  if m[1]=='example':ex+=1
  assert name not in out;out[name]=' '.join(text[m.start():end].split())
 return out
nh=headers(proofs);th=headers(tests);ch=headers(admitted)
assert len(nh)==14 and len(th)==8 and ch=={**nh,**th}
assert {NS+n for n in nh}==set(plan['newNames'])=={n['declarationName']for n in p['nodes'][595:]}
assert txt('Audits.lean')==''.join('#print axioms '+NS+n+'\n'for n in nh)
assert all(len(n['api'])>=3 and len(n['tests'])>=3 for n in p['nodes'][595:]if n['kind']=='construction')
assert sum(len(n.get('api',[]))for n in p['nodes'])==553
assert sum(len(n.get('tests',[]))for n in p['nodes'])==548
for n in p['nodes'][595:]:
 assert n['declarationName']in texts[paths[1]]and n['statement']in texts[paths[1]]
 for x in n.get('api',[])+n.get('tests',[]):assert x['name']in texts[paths[1]]and x['statement']in texts[paths[1]]
for key,name,kind,st in plan['tests']:assert '-- test: ChartTransitionTests.'+name in tests and st in texts[paths[1]]
compilation={}
for name,want,audits,examples in [('Native',0,202,142),('Canonical',896,0,403)]:
 rec=data(name+'.receipt.json');log=txt(name+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20
 assert rec['sourceSha256']==sha((S/(name+'.lean')).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses `sorry`')==want
 assert 'Exit status: 0'in log
 assert len(re.findall(r'^example\b',txt(name+'.lean'),re.M))==examples
 a=re.findall(r'depends on axioms:\s*\[([^]]*)\]',log);assert len(a)==audits
 assert 'sorryAx'not in log and all(set(v.strip()for v in x.replace('\n',' ').split(','))<={'propext','Classical.choice','Quot.sound'}for x in a)
 compilation[name]={**rec,'lines':len(txt(name+'.lean').splitlines()),'examples':examples}
assert set(plan['newNames'])<={n for n in re.findall(r"'([^']+)' depends on axioms:",txt('Native.log'))}
for g in data('InputGuard.json'):assert sha(blob(MATH,g['path']))==g['sha256']==sha(blob(BASE,g['path'])),g['path']
reuse=data('OwnReadingReuse.json')
assert len(reuse)==61 and sum(q['unchanged']for q in reuse)==57
assert {q['path']for q in reuse if not q['unchanged']}==set(paths)
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='bc24350852864995d87a1f842319f87e5882547ce4e9ab3e7a8e10f7ad2608af'
for original in ['Reading.json','InputGuard.json','Candidate.json','SFBoundary.json']:
 assert sha((S/('OwnPrevious'+original)).read_bytes())==om[original]['sha256']
for local,original in [('OwnInheritedReading.json','OwnPreviousReading.json'),('OwnInheritedManifest.json','OwnPreviousManifest.json'),('OwnInheritedInputGuard.json','OwnPreviousInputGuard.json')]:
 assert sha((S/local).read_bytes())==om[original]['sha256']
own=data('OwnPreviousCandidate.json')
assert {k for k in old if old[k]!=own[k]}=={'summary','baseline','sources','nodes','coverage'}
assert data('Reading.json')['worker']=='Codex — codex-7e92bd'
assert data('ClaimReceipt.json')['claim']==5977617946 and data('ClaimReceipt.json')['confirmation']==5977618893
assert data('TauProbe.json')['fullTauCompiled'] is False
sf=data('SFBoundary.json')
def boundary(raw):
 q=json.loads(raw);return dict(nodes=[n for n in q['nodes']if n['parentStageId']=='SchemeAndStackFoundations:SF.1'],coverage=[c for c in q['coverage']if c['stageId']=='SchemeAndStackFoundations:SF.1'],requests=q['requests'],sourceWorklist=q['sourceWorklist'])
assert boundary(blob(MATH,sf['path']))==sf['boundary']==boundary(blob(BASE,sf['path']))
for ref in [MATH,BASE]:
 own=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='BP-'+STEM);contract={k:v for k,v in own.items()if k not in ['state','note']}
 if ref==MATH:job_contract=contract
 else:assert contract==job_contract
if (S/'artifact-manifest.json').exists():
 for name,m in data('artifact-manifest.json').items():
  b=(S/name).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
for path,t in texts.items():
 assert not re.search(r'[ \t]+$',t,re.M),path
 assert not re.search(r'/(?:home|Users|tmp)/|file'+'://',t),path
os.environ['MODULI_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in texts.items():immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings)
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
summary['packet']=paths[0]
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f,t in texts.items()for x in env['file_problems'](f,t)];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'MODULI_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
print(json.dumps(dict(worldCommit=BASE,checker=summary,checkerErrors=errors,checkerWarnings=warnings,intakeProblems=problems,intakeRefusals=refusals,sourceIssueErrors=issues,preservedWholeNodeObjects=595,preservedMathematicalContracts=595,newDeclarations=14,newConstructions=2,newAPI=12,newTests=8,rawAPI=553,rawTests=548,matchedNewHeaders=22,compilation=compilation,fullTauCetiCompiled=False,externalInputGuards=len(data('InputGuard.json')),incomingDeliverableGuards=len(paths),sf1BoundaryPreserved=True,indexSha256=sha(Path(sys.argv[2]).read_bytes()),graph=graph,LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import os,sys,json,collections,copy,hashlib
R=Path.cwd();S=Path(sys.argv[1]);RID='AlgebraicModuliForArithmeticGeometry';STEM=RID+'--A0-extension'
os.environ.setdefault('MODULI_VALIDATE_BASE',(S/'publication-base.txt').read_text().strip())
sys.path.insert(0,str(S));import immutable_view;immutable_view.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint
p=json.loads((S/'Candidate.json').read_text())
old=json.loads((S/'Incoming.json').read_text())
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
assert a['stageEdges']==b['stageEdges'],'stage edge objects changed'
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
assert all(ar[x]==br[x] for x in br if x!=RID),'foreign roadmap changed'
foreign_a={q['id']:q for q in a['stages'] if q.get('owner')!=RID}
foreign_b={q['id']:q for q in b['stages'] if q.get('owner')!=RID}
assert foreign_a==foreign_b,'foreign stage changed'
assert not ar[RID]['blueprint']['skippedLinks']
summary={'worldCommit':immutable_view.BASE,'stageDAG':dag(listedstageids,se),'ownDeclarationDAG':dag(nodes,ownedges),'scopedDAG':dag(listedstageids|seen,se|de),'reachableDeclarations':len(seen),'externalDeclarations':sorted(seen-set(nodes)),'baselineLeaves':len(baseref),'requiredPairs':len(pairs),'restructurePairs':len(rspairs),'unresolved':sorted(unresolved),'ownSkippedLinks':[],'ownPendingLinks':[],'otherSkipsMatch':True,'fullForeignRoadmapsMatch':True,'fullForeignStagesMatch':True,'otherParts':{stem:len(q['nodes']) for stem,q in otherparts},'stageEdgesUnchanged':True}
summary['immutableInputPathsRead']=len(immutable_view.READS);summary['immutableReadPathsSha256']=hashlib.sha256(json.dumps(sorted(immutable_view.READS)).encode()).hexdigest()
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
BASE = os.environ.get('MODULI_VALIDATE_BASE', 'a29a5de40a8f9ea98f544153013ca05c7aca8649')
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
 print('\n'.join(x for x in log.splitlines() if 'error' in x or ('warning' in x and 'warning: declaration uses' not in x)))
sys.exit(r.returncode)
```

## Script: package.py

```python
"""Archive only named job evidence in an inert comment; write final public recovery."""
from pathlib import Path
import base64,hashlib,json,re,sys,zlib
S=Path(sys.argv[1]).resolve();R=Path.cwd();mode=sys.argv[2]
STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''AlgebraicModuliForArithmeticGeometry--A0-extension.json Incoming.json Incoming.lean IncomingReader.md IncomingHandoff.md IncomingManifest.json
NativePrefix.lean MathlibPrefix.lean IncomingVerification-replayed.json PreviousVerification.json PreviousRecovery.json PreviousHead.txt
ClaimReceipt.json Reading.json SourceReading.json Search.json OwnReadingReuse.json OwnPreviousReading.json OwnPreviousInputGuard.json OwnPreviousManifest.json OwnPreviousSFBoundary.json OwnPreviousCandidate.json OwnInheritedReading.json OwnInheritedManifest.json OwnInheritedInputGuard.json InputGuard.json SFBoundary.json TauProbe.json TouchingLinks.json
Native.lean Native.log Native.receipt.json NewProofs.lean Tests.lean Audits.lean NewAdmitted.lean Canonical.lean Canonical.log Canonical.receipt.json Candidate.json Reader.md ReaderAddition.md Suggested.lean Handoff.md HandoffBase.md Plan.json new-nodes.json Verification-math.json Verification.json base.txt publication-base.txt author.py projection.py assemble.py handoff.py verify.py graph.py immutable_view.py compile.py runcheck.py package.py recover-incoming.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED FIXED BAND CHART TRANSITIONS PAYLOAD\n'+pb+b'END ARCHIVED FIXED BAND CHART TRANSITIONS PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated fixed-band chart-transition evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED FIXED BAND CHART TRANSITIONS PAYLOAD\\n',1)[1].split('END ARCHIVED FIXED BAND CHART TRANSITIONS PAYLOAD -/',1)[0].encode()
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
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
for name in meta:
 if name.endswith('.py'):
  publicCode=handoff.split('## Script: '+name+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
  assert publicCode.encode()==(S/name).read_bytes(),'Public helper differs: '+name
code=handoff.split('## Script: recover.py\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's suggested file. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and preserves the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set MODULI_VALIDATE_BASE to the mathematical base to reproduce Verification-math.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the Mathlib-only projection; Suggested.lean is the complete uncompiled Tau Ceti-import file. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

'''
 text=(S/'Handoff.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('BP-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Script: recover-incoming.py

```python
"""Recover public authenticated gerbe local-cover evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='3bfc09759130f0b7dc3c4d5922990803f35a1181'
MANIFEST_SHA='920969300369966813afd4831dfcc9692117233b9b6bbce2004b9ccbe5cea112'
PAYLOAD_SHA='f5e33a5ab131568e030b6b8a30eaa077d245dc5aa8d442fab681fa40b79513bb'
EXPECTED={'packets': '764165233fc6c588d72df76df1e1336b5a2085726fb1c4bd3567e41d00abbe1c', 'readmes': 'f64dc75acc4b712ecc6e60da0f9b82c28a00783a5adc79a3acb5c55a2622fa61', 'suggested': '472570a63be738dc64287c56d5d2c4f4a4cd367acc254ff5a75451abfca7907f'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED GERBE LOCAL COVERS PAYLOAD\n',1)[1].split('END ARCHIVED GERBE LOCAL COVERS PAYLOAD -/',1)[0].encode()
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
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
for name in meta:
 if name.endswith('.py'):
  publicCode=handoff.split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert publicCode.encode()==(S/name).read_bytes(),'Public helper differs: '+name
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```

## Public recovery and replay

Archive commit `013f8d05af3f4c35b38bdae88fa6a6a5b35f3e4f` is an ancestor changing only this issue's suggested file. Its 62 inert artifacts include all 11 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `188f9f17676fed64bfe36ce2a9197b24a228d6ad9a5efe5c171f585fabba8214`; payload SHA256 `d22cae29cf1acf3262c3b139aa7ef7476f3a3f657ef1fca9f7aeb120ff772fa8`. The final suggested file has no archive payload and preserves the complete Tau Ceti-import planning text.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set MODULI_VALIDATE_BASE to the mathematical base to reproduce Verification-math.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the Mathlib-only projection; Suggested.lean is the complete uncompiled Tau Ceti-import file. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references.

## Script: recover.py

```python
"""Recover public authenticated fixed-band chart-transition evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='013f8d05af3f4c35b38bdae88fa6a6a5b35f3e4f'
MANIFEST_SHA='188f9f17676fed64bfe36ce2a9197b24a228d6ad9a5efe5c171f585fabba8214'
PAYLOAD_SHA='d22cae29cf1acf3262c3b139aa7ef7476f3a3f657ef1fca9f7aeb120ff772fa8'
EXPECTED={'packets': 'ba9e5db566326868e1da66b180731b24cf393add772939a325a63654264426c6', 'readmes': '8736232e97f6feb35398d58bce59178264a4ad7595d0993bd0ae32b5084fa685', 'suggested': '9a9a5138fba62ebb9f3af3a4639b2c77ff3615ff802ae3c38e4052fde90a1fde'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED FIXED BAND CHART TRANSITIONS PAYLOAD\n',1)[1].split('END ARCHIVED FIXED BAND CHART TRANSITIONS PAYLOAD -/',1)[0].encode()
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
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
for name in meta:
 if name.endswith('.py'):
  publicCode=handoff.split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert publicCode.encode()==(S/name).read_bytes(),'Public helper differs: '+name
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
