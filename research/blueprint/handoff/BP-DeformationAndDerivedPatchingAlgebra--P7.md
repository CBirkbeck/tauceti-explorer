# Internal grading of the actual adic cokernel — checkpoint

Codex — codex-7e92bd. Refs #551. Partial. All452 nodes remain unchecked. The reserved multiplicity key, eight stages, fifteen gaps and two requests remain open.

Sixteen new nodes (one definition, two constructions and thirteen lemmas), together with one defining native graded-scalar instance, supply the internal grading of the actual cokernel of degree-one multiplication. All436 incoming whole node objects remain unchanged. Ten API entries and eleven test references on the three new objects refer to eight distinct typed examples. Six existing generic Mathlib declarations are added to the baseline as imports, not new nodes.

For any commutative A, ideal q and A-module M, retain the existing native Rees quotients S=gr_q(A), L=gr_q(M), the actual a∈S_1 and multiplication mu_a:L→L. C=L/range(mu_a) is the original native S-module quotient with its original S action and restricted A action. Its new component C_n is the literal A-linear range of L_n→L→C, definitionally the existing target of adicModuleCokernelComponent. No locality, Noetherianity, finite generation, freeness, reducedness, injectivity or regularity is assumed.

Independence follows by lifting a finite zero homogeneous sum: the sum of its lifts lies in range(mu_a). Original ambient projections recover each chosen homogeneous lift, and the inherited homogeneous-range theorem places each lift in the same range. Every quotient term is therefore zero. Spanning follows because original components span L and the quotient map is surjective. Existing native internal-direct-sum machinery supplies a decomposition on this same C. Existing Tau map_decompose_shift, applied to the identity degree map and the actual quotient map, proves that each quotient coordinate is the class of the original ambient projection. Canonical finite reconstruction, fixed homogeneous coordinates and orthogonal idempotent A-linear projections follow. The original quotient S action retains addition of homogeneous degrees. No generic graded-ring quotient package is duplicated.

Eight typed examples check mixed degree-zero/one representatives and vanishing degree two; wrong-degree projection; vanishing of every projection of an actual multiplication image; the original homogeneous S action; reconstruction of arbitrary possibly inhomogeneous quotient elements and detection of zero by all coordinates; the unit-ideal boundary; a nonzero constant for the nonfree Z-module Z/4 at q=0; and a nonzero positive-degree quotient class for Z/4,q=(2),a=0. In the last test the degree-one class of2 remains nonzero, is fixed and is reconstructed. Finite reconstruction is proved in the general test, not assumed as an input. Existing nonzero nilpotent-multiplier kernel tests remain in the authenticated prefix.

## Reading and authentication

The whole55002-character issue was personally read in four complete slices before claim5978481670 and again after bot5978482601 confirmed that exact numeric claim. The body hash is unchanged. The complete current R03.3 reviewed audit row, reserved multiplicity node, both requests, relevant whole gaps4–8 and whole R03.3 frontier were freshly read before planning.

Public peer PR6054 at head6e88087af5f2690c08fe130ff1c6c7fc3ca36aab recovered62 artifacts,10 helpers, all four final files and all four exact replayed pinned Tau declarations. Both actual recovered immutable verifiers reproduced the archived mathematical and publication reports byte-for-byte. The whole mathematical handoff and all fourteen new declarations plus two defining instances and seven tests were personally read, together with the consumed original quotient, projection, homogeneous-range and example proofs. The full436-node packet and3533-line native prefix are authenticated and preserved; no fresh full manual audit of the whole prefix is claimed.

Own PR6051 Reading and input guard are authenticated against manifest6c4229ebc4efa08e8c03ff13742dbd82f0e2f05299b0825a774142b9fc3c3217. Its nested original own6037 manifest, reading, input guard and reading chain are also authenticated. Own scopes are reused only against24 unchanged controls out of29; four owned files and the Scheme Foundations packet changed. Current SF.0 final continuation and complete empty requests were freshly read; those bytes match this session's PR6058. No peer reading scope is attributed to this session, and no full SF proof audit is claimed.

WORKERS was freshly reread completely. PROTOCOL sections10–15 were freshly reread during this job. Other binding/upstream/RS08 scopes retain exact same-hash own attribution, including the recent full expansion PROTOCOL and upstream guide readings; Reading.json records the bounds and the earlier truncated whole-PROTOCOL display that is not counted as a complete fresh read. The selected native source statements, constructions and proofs were personally read at the exact pins in the recorded ranges. The existing Tau graded-ring quotient construction was read and is not replanned. Exact new-name searches cover pinned Mathlib, Tau and current atlas packets; they are bounded checks, not a semantic absence certificate.

The complete currently displayed Stacks Section10.58, all statements/proofs1–10 and all five comments, was read at https://stacks.math.columbia.edu/tag/00JV. SourceReading.json records the actual HTTP bytes/hash/time. The arbitrary-module quotient decomposition is an authored deduction motivated by its graded induction. All inherited source/version/E1 and routed-source obligations remain unchanged; no fresh recursive-paper audit is claimed.

## Compilation boundary

**The full Tau-importing suggested file is uncompiled.** It imports existing TauCeti.Algebra.DirectSum.Internal at f790474821cf4256814db967cb154e7af3d0c369. The available Tau build has a different head and lacks Internal.olean. No Tau library was built.

Native.lean and Canonical.lean are isolated Mathlib-only evidence files. Their byte-exact authenticated incoming prefixes already replay the existing map_decompose_shift, isInternal_comap, Decomposition.restrict and map_decompose_restrict source declarations; none is replayed twice. TauShiftReceipt.json and TauRestrictionReceipt.json bind the pinned source and exact declaration blocks. Public recovery fetches the immutable source and verifies every block. This is not a compiled Tau-import claim.

All seventeen new declaration headers, including the defining instance, and eight test headers match the admitted projection exactly. Definitions, native decomposition data and the native graded-scalar instance are retained; only lemma and test proofs are admitted in that projection. The full final native proof is compiled from source, without the disposable prototype-prefix olean. No placeholder proposition replaces the missing mathematics.

Both evidence runs use the existing exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Runs are serial after the20GiB guard, with one thread,8192MiB cap and1200-second timeout. No Lake setup/update/cache, library build or language server. Native evidence has no errors, warnings or admissions;256 axiom audits cover all seventeen new declarations and all four replayed Tau declarations and use only propext,Classical.choice and Quot.sound.

- Native.lean: 3877 lines,91 examples,exit0,0 warnings,256 axiom audits; 44GiB available,228.48 seconds,peak3738360KiB. Source SHA256 `8783b35cfb9af6bdec92dc0eff8c81bbe576a1fe7a6e35ddd28a045c1f3be12e`; diagnostic SHA256 `d7406637c3e74e199d9646aec38312ddeb7d1f21a9c6cd91ec89213966279191`.
- Canonical.lean: 6394 lines,352 examples,exit0,858 warnings,0 axiom audits; 43GiB available,144.44 seconds,peak3910004KiB. Source SHA256 `538c31e9e4347b3f38ccae6a0c47db43d2d7b8fbfd0a8e2d32db93275b55ac8d`; diagnostic SHA256 `1d022bd050c9ca146bd83c822c425819fe12cb4193f3cd0c4241994cc20d6699`.

Suggested.lean: 6301 lines,uncompiled; SHA256 `d6d74f545e49649d4efcd94806679e7964761b7037c3b6218ba58929f298edca`. Isolated Canonical.lean has858 expected admission warnings only.

## Immutable validation

The actual indexed checker reports452 nodes (11definitions,65constructions,16theorems,360lemmas),354 API entries,290 recognized tests(373raw references),13 planets and440 baseline declarations, with no errors or warnings. Actual intake authorization/file checks and source-issue/version checks pass. All436 whole incoming nodes, every prior API/test, source/version/E1, all fifteen whole gaps and both requests remain unchanged. The required direct check_blueprint.py invocation also passes with the exact declaration index.

Mathematical base `9b2fe3f7a420597dfaf6a6ca3880e95d282e7b21`; publication control `156be4fe5c33da24d10259243acfb66c20acbd42`. Both actual immutable verifiers ran and are retained as MathematicalVerification.json and Verification.json. All29 inputs are hash guarded; PublicationChanges.json records 0 reviewed changed controls. Four incoming files and the queue contract agree at both bases. Declaration index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`.

Stage DAG 3003/8623,own DAG 452/774,combined DAG 3443/9850; all acyclic, no unresolved owned dependencies. All65 accepted restructure pairs and12of13 required stage pairs remain reachable. The inherited LocalFieldsRamification layer0→R03.4 missing path remains in its unchanged gap/request. Whole foreign roadmap/stage and stage-edge objects and53 sibling declarations are preserved.

## Resume

Sixteen new nodes and one defining native graded-scalar instance give the actual cokernel C=L/range(mu_a) an internal grading: original quotient-image components, original S scalar degree addition, independence from homogeneous range projections, spanning by quotient surjectivity, native finite decomposition, quotient projection agreement, finite reconstruction, fixed-degree membership and orthogonal idempotent A-linear projections. No new generic quotient or graded-ring carrier is planned. This supersedes only the actual cokernel internal-decomposition frontier. The smaller-ring S/(a) graded scalar action, simultaneous graded kernel/cokernel finiteness over the remaining-generator ring and the Hilbert–Serre induction remain open. Preserve the finite-length bounds and signed recurrence with its kernel correction. Polynomial existence, support/degree, completion, localization, associativity, intrinsic/ambient multiplicity, all eight stages and routed-source obligations remain open; every node unchecked.

Continue with the native graded scalar actions over S/(a), using existing graded-ring quotient machinery, and check the finite generation needed over the remaining-generator ring for both actual kernel and actual cokernel. Then prove the Hilbert–Serre induction, including finite-difference integration, explicit thresholds and initial constants. Preserve the finite component-length bounds, signed integer recurrence and nonzero kernel correction. Neither that recurrence nor the new quotient grading proves polynomial existence, support-dimension equality or multiplicity normalization. All inherited coefficient, depth, patching, source-route and reserved-key obligations remain required.

## Script: author.py

```python
"""Plan the internal grading of the actual adic cokernel without changing its carrier."""
from pathlib import Path
import json,copy
S=Path(__file__).resolve().parent;RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';STAGE=RID+':R03.3';NS='TauCeti.HilbertSamuel.'
nid=lambda s:STAGE+'/'+s
put=lambda n,v:(S/n).write_text(v if isinstance(v,str)else json.dumps(v,ensure_ascii=False,indent=2)+'\n')
p=json.loads((S/'Incoming.json').read_text());old=copy.deepcopy(p)
common='A is any commutative ring, q any ideal and M any A-module. S=gr_q(A) and L=gr_q(M) are the existing native Rees quotients with their natural-number internal grading. Fix a in the actual S_1 and mu_a:L→L the native S-linear multiplication map. C=L/range(mu_a) is the actual native S-module quotient, with its original quotient S action and restricted A action. No locality, Noetherianity, finite generation, reducedness, freeness or injectivity assumption is imposed.'
byname={n.get('declaration',n.get('leanName')):n['id']for n in old['nodes']}
for n in old['nodes']:
 for a in n.get('api',[]):byname.setdefault(a['name'],n['id'])
owned=lambda n:byname[NS+n]
tests=[
('mixed_degrees','compatibility','For the quotient class of a sum of original degree-zero and degree-one terms, the new projections recover the corresponding quotient classes; degree two projects to zero.'),
('wrong_degree','non-example','For every actual x in C_n and m≠n, its native quotient projection to degree m is zero. Repeating C as every component fails this test.'),
('image_is_killed','compatibility','For every original homogeneous x in L_n, the quotient class of the actual product a·x has every quotient projection zero. The old component multiplication and new grading use exactly the same quotient.'),
('homogeneous_scalar','compatibility','For b in S_i and x in L_j, b times the quotient class of x belongs to C_(i+j) and is fixed by its degree-(i+j) projection, using the original quotient S action.'),
('finite_reconstruction','characterisation','Every possibly inhomogeneous actual quotient element is recovered by native finite recomposition. If all its quotient projections vanish, the element is zero; recomposition is proved, not assumed.'),
('unit_ideal','degenerate','For q=A, every actual quotient element is zero, lies in every component as zero, and has every projection zero, for arbitrary A-modules.'),
('nonfree_constant','non-example','For A=Z, M=Z/4, q=0 and a=0, the class of the constant 1 is nonzero in C_0 and fixed by the new degree-zero projection. No freeness assumption or zero cokernel substitution is allowed.'),
('zero_multiplier_positive_degree','non-example','For A=M=Z/4, q=(2) and a=0, the class of2 in the original degree-one piece survives nonzero in C_1, is fixed by its quotient projection and is recovered by finite recomposition. A quotient grading concentrated in degree zero fails this nilpotent-ring example.')]
tests=[dict(name='AdicCokernelGradingTests.'+n,kind=k,statement=t)for n,k,t in tests]
source=[dict(sourceId='HS-COKERNEL-GRADING-00JV',locator='Section10.58, Lemma10.58.6 and Proposition10.58.7, displayed graded submodule and quotient induction',excerpt='graded',match='Motivates retaining homogeneous quotients during graded induction. The actual arbitrary-ring module cokernel adapters and native projection identities are authored deductions, not a claim that this source states all these Lean contracts.')]
new=[];names=[]
def add(slug,name,kind,title,statement,deps,proof):
 n=dict(id=nid(slug),parentStageId=STAGE,realises=[STAGE],kind=kind,title=title,declaration=NS+name,statement=statement,hypotheses=[common],proofSteps=proof,prerequisites=deps,acceptance=[statement,'Keep the actual quotient carrier and scalar actions; all implementation statuses remain unchecked.'],uses=[dict(where='R03.3 Hilbert–Serre kernel/cokernel induction; Stacks10.58.7',how='Give the actual quotient an internal decomposition and native quotient projections before descending both kernel and cokernel gradings to the remaining-generator coefficient ring. This does not prove the graded polynomial induction.')],sources=source,library=dict(module='TauCeti/RingTheory/HilbertSamuel',namespace='TauCeti.HilbertSamuel'),implementationStatus='unchecked')
 new.append(n);names.append(NS+name);return n
c=add('adic-cokernel-components','adicModuleCokernelComponents','definition','Homogeneous components of the actual adic cokernel','Define C_n as the A-linear range of L_n→L→C. This is definitionally the existing target submodule of adicModuleCokernelComponent, not a second quotient carrier. The defining native SetLike.GradedSMul instance retains S_i·C_j⊆C_(i+j).',[owned('adicModuleComponents'),owned('adicModuleCokernelComponent'),owned('adicModuleGradedSMul'),'mathlib:Submodule.mkQ','mathlib:LinearMap.restrictScalars'],['Use the original quotient projection restricted to A and compose with the original L_n inclusion.','The defining graded scalar instance follows the component scalar lemma on the original quotient action.'])
cm=add('adic-cokernel-components-membership','adicModuleCokernelComponents_mem','lemma','Representatives of cokernel components','An actual x in C belongs to C_n if and only if x is the quotient class of some actual y in L_n.',[c['id']],['Unfold the native linear range; its membership predicate is exactly existence of a representative.'])
ce=add('adic-cokernel-components-map','adicModuleCokernelComponents_eq_map','lemma','Cokernel components as quotient images','C_n equals the native A-submodule image of L_n under the scalar-restricted quotient map L→C.',[c['id'],'mathlib:LinearMap.range_comp','mathlib:Submodule.range_subtype'],['The range of a composite is the image of the first range; the range of the original component subtype is L_n.'])
cs=add('adic-cokernel-components-scalar','adicModuleCokernelComponents_smul','lemma','Original scalar degree addition in the cokernel','For b in S_i and actual x in C_j, the original quotient scalar product b·x lies in C_(i+j).',[c['id'],cm['id'],owned('adicModuleGradedSMul'),'mathlib:SetLike.GradedSMul'],['Choose the actual homogeneous representative y of x.','The ambient product b·y belongs to L_(i+j), and its quotient class is definitionally the original b·x.'])
names.append(NS+'adicModuleCokernelGradedSMul')
ci=add('adic-cokernel-components-independent','adicModuleCokernelComponents_iSupIndep','lemma','Independent cokernel components','The family of actual quotient submodules (C_n) is iSupIndep: each term of a finite homogeneous sum equal to zero is zero.',[c['id'],cm['id'],owned('adicModuleProjection'),owned('adicModuleProjection_eq_self_iff'),owned('adicModuleMul_range_homogeneous'),'mathlib:iSupIndep_iff_finsetSum_eq_zero_imp_eq_zero','mathlib:DirectSum.decompose_of_mem_ne'],['Lift each term of a finite homogeneous sum to the original L_n; zero quotient sum means the sum of the lifts belongs to the actual range of mu_a.','Project this sum to its n-th original component. Same-degree and wrong-degree identities give exactly the chosen n-th lift.','The inherited homogeneous-range theorem puts this lift in the same range; its quotient class is therefore zero. No division by a or injectivity is used.'])
ct=add('adic-cokernel-components-spanning','adicModuleCokernelComponents_iSup','lemma','Cokernel components span the actual quotient','The supremum of the actual quotient components C_n is the whole A-module C.',[ce['id'],owned('adicModuleDecomposition'),'mathlib:Submodule.map_iSup','mathlib:DirectSum.IsInternal.submodule_iSup_eq_top','mathlib:Submodule.mkQ_surjective'],['Rewrite each component as the image of L_n; commute the image with the supremum.','The original internal decomposition spans L, and the actual quotient map is surjective; the image of the whole module is all of C.'])
cn=add('adic-cokernel-components-internal','adicModuleCokernelComponents_isInternal','lemma','Internal direct sum of cokernel components','The original inclusions of the C_n into C define a native DirectSum.IsInternal family.',[ci['id'],ct['id'],'mathlib:DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top'],['Apply the native internal-direct-sum criterion to the proved independence and spanning.'])
d=add('adic-cokernel-decomposition','adicModuleCokernelDecomposition','construction','Native decomposition of the actual cokernel','Construct a native DirectSum.Decomposition of the family C_n on the actual quotient C. Its recomposition is the canonical finite sum of component inclusions. Install these data locally, without a new global competing decomposition instance.',[cn['id'],'mathlib:DirectSum.IsInternal.chooseDecomposition'],['Use the existing native choice of decomposition from the proved IsInternal family. The carrier and canonical finite recomposition remain unchanged.'])
dm=add('adic-cokernel-decomposition-quotient','adicModuleCokernelDecomposition_mk','lemma','Quotient projection agrees with the ambient projection','For every original x in L and n≥0, with the new decomposition installed, the n-th quotient coordinate as an element of C equals the quotient class of the original adicModuleProjection π_n(x).',[d['id'],cm['id'],owned('adicModuleProjection'),'tauceti:TauCeti.DirectSum.map_decompose_shift'],['The actual A-linear quotient map sends L_n into C_n by its defining representative.','Apply the existing Tau map_decompose_shift with the identity injective degree map. This compares the two native decompositions without choosing an inverse representative.'])
dr=add('adic-cokernel-decomposition-recompose','adicModuleCokernelDecomposition_recompose','lemma','Finite reconstruction in the actual cokernel','For every actual x in C, native finite recomposition of its full native quotient decomposition equals x in C.',[d['id'],'mathlib:DirectSum.Decomposition'],['Apply the left inverse field of the native decomposition on the actual quotient and canonical component inclusions.'])
df=add('adic-cokernel-decomposition-homogeneous','adicModuleCokernelDecomposition_of_mem','lemma','Homogeneous quotient elements are fixed','If actual x belongs to C_n, its n-th native quotient coordinate, included into C, equals x.',[d['id'],cm['id'],'mathlib:DirectSum.decompose_of_mem_same'],['Apply the native same-degree decomposition theorem to the actual quotient component family.'])
v=add('adic-cokernel-projection','adicModuleCokernelProjection','construction','Linear homogeneous projections of the actual cokernel','Define the A-linear map p_n:C→C by the native quotient decomposition, evaluation at n and the original inclusion C_n→C. It uses the original quotient carrier and restricted A action.',[d['id'],'mathlib:DirectSum.decomposeLinearEquiv','mathlib:DFinsupp.lapply'],['Install the actual quotient decomposition locally. Compose the native decomposition linear equivalence with dependent coordinate evaluation and the original component inclusion.'])
vm=add('adic-cokernel-projection-quotient','adicModuleCokernelProjection_mk','lemma','Linear projections commute with the quotient map','For every x in L, p_n([x])=[π_n(x)] in the actual C.',[v['id'],dm['id']],['The new linear projection evaluates definitionally to the coordinate in the proved quotient decomposition identity.'])
vv=add('adic-cokernel-projection-membership','adicModuleCokernelProjection_mem','lemma','Projection lands in its actual component','For every actual x in C, p_n(x) belongs to C_n.',[v['id']],['The native dependent coordinate carries precisely this membership proof before its inclusion into C.'])
vf=add('adic-cokernel-projection-fixed','adicModuleCokernelProjection_eq_self_iff','lemma','Fixed quotient projection characterizes degree','For every actual x in C, p_n(x)=x if and only if x belongs to C_n.',[v['id'],vv['id'],df['id']],['A fixed projection belongs to its component by the projection membership theorem.','An element already in C_n is fixed by the same-degree quotient decomposition theorem.'])
vc=add('adic-cokernel-projection-composition','adicModuleCokernelProjection_comp','lemma','Orthogonal idempotent quotient projections','For all i,j≥0 and actual x in C, p_i(p_j(x)) equals p_j(x) if i=j and zero otherwise.',[v['id'],vm['id'],owned('adicModuleProjection_comp'),'mathlib:Submodule.mkQ_surjective'],['Choose an original representative of x by quotient induction.','Apply the quotient projection formula twice and the inherited ambient projection composition identity. Split the equality of degrees; the quotient map preserves zero.'])
c['api']=[dict(name=n['declaration'],role=r,statement=n['statement'])for n,r in [(cm,'characterisation'),(ce,'relation'),(cs,'compatibility')]]
d['api']=[dict(name=n['declaration'],role=r,statement=n['statement'])for n,r in [(dm,'compatibility'),(dr,'relation'),(df,'simp')]]
v['api']=[dict(name=n['declaration'],role=r,statement=n['statement'])for n,r in [(vm,'compatibility'),(vv,'characterisation'),(vf,'characterisation'),(vc,'relation')]]
c['tests']=[tests[i]for i in [0,3,6,7]];d['tests']=[tests[i]for i in [1,4,7]];v['tests']=[tests[i]for i in [0,2,5,6]]
base=[('iSupIndep_iff_finsetSum_eq_zero_imp_eq_zero','theorem','Mathlib/LinearAlgebra/DFinsupp.lean',580,'Independence of submodules is equivalent to each term of every zero finite homogeneous sum being zero.'),('DirectSum.IsInternal.submodule_iSup_eq_top','theorem','Mathlib/Algebra/DirectSum/Module.lean',452,'An internal direct-sum family of submodules spans the whole module.'),('DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top','theorem','Mathlib/Algebra/DirectSum/Module.lean',510,'Independent submodules whose supremum is top form a native internal direct sum.'),('DirectSum.IsInternal.chooseDecomposition','def','Mathlib/Algebra/DirectSum/Decomposition.lean',80,'Choose native decomposition data from the bijective canonical finite recomposition.'),('Submodule.map_iSup','theorem','Mathlib/Algebra/Module/Submodule/Map.lean',230,'The native submodule image preserves arbitrary suprema.'),('LinearMap.range_comp','theorem','Mathlib/Algebra/Module/Submodule/Range.lean',82,'The range of a composite is the image of the first range under the second map.')]
newbase=[dict(ref='mathlib:'+name,kind=kind,module=module,provides=desc,checked=f'Actual complete statement, proof/construction and ambient hypotheses personally read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-04 by Codex — codex-7e92bd; line{line}; exact declaration index checked. Existing generic theorem imported, never replanned.')for name,kind,module,line,desc in base]
refs={b['ref']for b in p['baseline']['declarations']};assert not refs&{b['ref']for b in newbase}
allids={n['id']for n in old['nodes']+new};refs|={b['ref']for b in newbase}
assert all(r in refs if r.startswith(('mathlib:','tauceti:'))else r in allids for n in new for r in n['prerequisites'])
p['nodes']+=new;p['baseline']['declarations']+=newbase
sr=json.loads((S/'SourceReading.json').read_text())[0];p['sources'].append(dict(id='HS-COKERNEL-GRADING-00JV',title='Noetherian graded rings: homogeneous quotient induction',authors='The Stacks Project Authors',edition='Currently displayed Section10.58,4October2026',url=sr['url'],sha256=sr['sha256'],readSections=[sr['scope']]))
frontier='Sixteen new nodes and one defining native graded-scalar instance give the actual cokernel C=L/range(mu_a) an internal grading: original quotient-image components, original S scalar degree addition, independence from homogeneous range projections, spanning by quotient surjectivity, native finite decomposition, quotient projection agreement, finite reconstruction, fixed-degree membership and orthogonal idempotent A-linear projections. No new generic quotient or graded-ring carrier is planned. This supersedes only the actual cokernel internal-decomposition frontier. The smaller-ring S/(a) graded scalar action, simultaneous graded kernel/cokernel finiteness over the remaining-generator ring and the Hilbert–Serre induction remain open. Preserve the finite-length bounds and signed recurrence with its kernel correction. Polynomial existence, support/degree, completion, localization, associativity, intrinsic/ambient multiplicity, all eight stages and routed-source obligations remain open; every node unchecked.'
p['summary']+=' '+frontier;next(c for c in p['coverage']if c['stageId']==STAGE)['remaining'].append(frontier)
assert p['nodes'][:436]==old['nodes'] and len(new)==16 and len(names)==17
plan=dict(newNames=names,newNodes=[n['id']for n in new],definingInstances=[NS+'adicModuleCokernelGradedSMul'],newBaseline=newbase,apiAdditions={},newTests=tests,frontier=frontier)
for name,x in [('Plan.json',plan),('NewNodes.json',new),('NewTests.json',tests),('Candidate.json',p),(STEM+'.json',p)]:put(name,x)
t='# Internal grading of the actual adic cokernel\n\n'+common+'\n\nEach component is the original quotient image of L_n. To prove independence, lift a finite zero homogeneous sum: its sum lies in range(mu_a), and the inherited homogeneous-range theorem puts each original component projection in that same range. Spanning follows from the original decomposition and quotient surjectivity. Native internal-direct-sum data then give finite reconstruction and projections agreeing with the original ambient projections modulo range(mu_a).\n\n'
for n in new:
 t+='## '+n['title']+'\n\n'+n['declaration']+'\n\n'+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof: '+' '.join(n['proofSteps'])+'\n\nPrerequisites: '+', '.join(n['prerequisites'])+'.\n\n'
 for a in n.get('api',[]):t+='API '+a['name']+': '+a['statement']+'\n\n'
t+='## Boundary tests\n\n'
for x in tests:t+=x['name']+' ('+x['kind']+'): '+x['statement']+'\n\n'
t+='## Continuation boundary\n\n'+frontier+'\n\nAll436 incoming whole nodes and every source/version/erratum, gap, request, planet and earlier stage obligation are preserved. The incoming reader follows unchanged. Only the explicitly identified quotient-decomposition frontier is superseded. The full Tau-importing suggested file remains uncompiled; isolated Mathlib evidence retains the exact four pinned Tau declarations already authenticated in the incoming prefix.\n\n---\n\n'
put('ReaderAddition.md',t);put('Reader.md',t+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(new),definingInstances=1,newAPI=10,newTestReferences=11,newTests=8,baseline=len(p['baseline']['declarations']))))
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
```

## Script: assemble.py

```python
"""Append exact new source to authenticated native and isolated canonical prefixes."""
from pathlib import Path
import json
from projection import admit_lemmas
S=Path(__file__).resolve().parent;t=lambda n:(S/n).read_text()
def put(n,v):(S/n).write_text(v)
put('NewAdmitted.lean',admit_lemmas(t('New.lean'))+'\n'+admit_lemmas(t('NewTests.lean')))
put('Suggested.lean',t('NewImports.lean')+t('Incoming.lean')+'\n'+t('NewAdmitted.lean'))
put('Canonical.lean',t('NewImports.lean')+t('CanonicalPrefix.lean')+'\n'+t('NewAdmitted.lean'))
put('Audits.lean','\n'.join('#print axioms '+n for n in json.loads(t('Plan.json'))['newNames'])+'\n')
put('Native.lean',t('NewImports.lean')+t('NativePrefix.lean')+'\n'+t('New.lean')+'\n'+t('NewTests.lean')+'\n'+t('Audits.lean'))
```

## Script: handoff.py

```python
"""Write exact mathematical scope, authenticated readings, validation and recoverable helpers."""
from pathlib import Path
import json,hashlib
S=Path(__file__).resolve().parent;d=lambda n:json.loads((S/n).read_text());v=d('Verification.json');g=v['graph'];p=d('Candidate.json');plan=d('Plan.json')
t='''# Internal grading of the actual adic cokernel — checkpoint

Codex — codex-7e92bd. Refs #551. Partial. All452 nodes remain unchecked. The reserved multiplicity key, eight stages, fifteen gaps and two requests remain open.

Sixteen new nodes (one definition, two constructions and thirteen lemmas), together with one defining native graded-scalar instance, supply the internal grading of the actual cokernel of degree-one multiplication. All436 incoming whole node objects remain unchanged. Ten API entries and eleven test references on the three new objects refer to eight distinct typed examples. Six existing generic Mathlib declarations are added to the baseline as imports, not new nodes.

For any commutative A, ideal q and A-module M, retain the existing native Rees quotients S=gr_q(A), L=gr_q(M), the actual a∈S_1 and multiplication mu_a:L→L. C=L/range(mu_a) is the original native S-module quotient with its original S action and restricted A action. Its new component C_n is the literal A-linear range of L_n→L→C, definitionally the existing target of adicModuleCokernelComponent. No locality, Noetherianity, finite generation, freeness, reducedness, injectivity or regularity is assumed.

Independence follows by lifting a finite zero homogeneous sum: the sum of its lifts lies in range(mu_a). Original ambient projections recover each chosen homogeneous lift, and the inherited homogeneous-range theorem places each lift in the same range. Every quotient term is therefore zero. Spanning follows because original components span L and the quotient map is surjective. Existing native internal-direct-sum machinery supplies a decomposition on this same C. Existing Tau map_decompose_shift, applied to the identity degree map and the actual quotient map, proves that each quotient coordinate is the class of the original ambient projection. Canonical finite reconstruction, fixed homogeneous coordinates and orthogonal idempotent A-linear projections follow. The original quotient S action retains addition of homogeneous degrees. No generic graded-ring quotient package is duplicated.

Eight typed examples check mixed degree-zero/one representatives and vanishing degree two; wrong-degree projection; vanishing of every projection of an actual multiplication image; the original homogeneous S action; reconstruction of arbitrary possibly inhomogeneous quotient elements and detection of zero by all coordinates; the unit-ideal boundary; a nonzero constant for the nonfree Z-module Z/4 at q=0; and a nonzero positive-degree quotient class for Z/4,q=(2),a=0. In the last test the degree-one class of2 remains nonzero, is fixed and is reconstructed. Finite reconstruction is proved in the general test, not assumed as an input. Existing nonzero nilpotent-multiplier kernel tests remain in the authenticated prefix.

## Reading and authentication

The whole55002-character issue was personally read in four complete slices before claim5978481670 and again after bot5978482601 confirmed that exact numeric claim. The body hash is unchanged. The complete current R03.3 reviewed audit row, reserved multiplicity node, both requests, relevant whole gaps4–8 and whole R03.3 frontier were freshly read before planning.

Public peer PR6054 at head6e88087af5f2690c08fe130ff1c6c7fc3ca36aab recovered62 artifacts,10 helpers, all four final files and all four exact replayed pinned Tau declarations. Both actual recovered immutable verifiers reproduced the archived mathematical and publication reports byte-for-byte. The whole mathematical handoff and all fourteen new declarations plus two defining instances and seven tests were personally read, together with the consumed original quotient, projection, homogeneous-range and example proofs. The full436-node packet and3533-line native prefix are authenticated and preserved; no fresh full manual audit of the whole prefix is claimed.

Own PR6051 Reading and input guard are authenticated against manifest6c4229ebc4efa08e8c03ff13742dbd82f0e2f05299b0825a774142b9fc3c3217. Its nested original own6037 manifest, reading, input guard and reading chain are also authenticated. Own scopes are reused only against24 unchanged controls out of29; four owned files and the Scheme Foundations packet changed. Current SF.0 final continuation and complete empty requests were freshly read; those bytes match this session's PR6058. No peer reading scope is attributed to this session, and no full SF proof audit is claimed.

WORKERS was freshly reread completely. PROTOCOL sections10–15 were freshly reread during this job. Other binding/upstream/RS08 scopes retain exact same-hash own attribution, including the recent full expansion PROTOCOL and upstream guide readings; Reading.json records the bounds and the earlier truncated whole-PROTOCOL display that is not counted as a complete fresh read. The selected native source statements, constructions and proofs were personally read at the exact pins in the recorded ranges. The existing Tau graded-ring quotient construction was read and is not replanned. Exact new-name searches cover pinned Mathlib, Tau and current atlas packets; they are bounded checks, not a semantic absence certificate.

The complete currently displayed Stacks Section10.58, all statements/proofs1–10 and all five comments, was read at https://stacks.math.columbia.edu/tag/00JV. SourceReading.json records the actual HTTP bytes/hash/time. The arbitrary-module quotient decomposition is an authored deduction motivated by its graded induction. All inherited source/version/E1 and routed-source obligations remain unchanged; no fresh recursive-paper audit is claimed.

## Compilation boundary

**The full Tau-importing suggested file is uncompiled.** It imports existing TauCeti.Algebra.DirectSum.Internal at f790474821cf4256814db967cb154e7af3d0c369. The available Tau build has a different head and lacks Internal.olean. No Tau library was built.

Native.lean and Canonical.lean are isolated Mathlib-only evidence files. Their byte-exact authenticated incoming prefixes already replay the existing map_decompose_shift, isInternal_comap, Decomposition.restrict and map_decompose_restrict source declarations; none is replayed twice. TauShiftReceipt.json and TauRestrictionReceipt.json bind the pinned source and exact declaration blocks. Public recovery fetches the immutable source and verifies every block. This is not a compiled Tau-import claim.

All seventeen new declaration headers, including the defining instance, and eight test headers match the admitted projection exactly. Definitions, native decomposition data and the native graded-scalar instance are retained; only lemma and test proofs are admitted in that projection. The full final native proof is compiled from source, without the disposable prototype-prefix olean. No placeholder proposition replaces the missing mathematics.

Both evidence runs use the existing exact Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Runs are serial after the20GiB guard, with one thread,8192MiB cap and1200-second timeout. No Lake setup/update/cache, library build or language server. Native evidence has no errors, warnings or admissions;256 axiom audits cover all seventeen new declarations and all four replayed Tau declarations and use only propext,Classical.choice and Quot.sound.

'''
for name,r in v['compilation'].items():
 t+=f"- {name}: {r['lines']} lines,{r['examples']} examples,exit{r['exitStatus']},{r['warnings']} warnings,{r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available,{r['elapsedSeconds']} seconds,peak{r['maxRssKiB']}KiB. Source SHA256 `{r['sourceSha256']}`; diagnostic SHA256 `{r['logSha256']}`.\n"
b=(S/'Suggested.lean').read_bytes();t+=f"\nSuggested.lean: {len(b.splitlines())} lines,uncompiled; SHA256 `{hashlib.sha256(b).hexdigest()}`. Isolated Canonical.lean has858 expected admission warnings only.\n"
t+=f'''
## Immutable validation

The actual indexed checker reports452 nodes (11definitions,65constructions,16theorems,360lemmas),354 API entries,290 recognized tests(373raw references),13 planets and440 baseline declarations, with no errors or warnings. Actual intake authorization/file checks and source-issue/version checks pass. All436 whole incoming nodes, every prior API/test, source/version/E1, all fifteen whole gaps and both requests remain unchanged. The required direct check_blueprint.py invocation also passes with the exact declaration index.

Mathematical base `{v['mathematicalBase']}`; publication control `{v['immutableBase']}`. Both actual immutable verifiers ran and are retained as MathematicalVerification.json and Verification.json. All29 inputs are hash guarded; PublicationChanges.json records {len(v['reviewedPublicationChanges'])} reviewed changed controls. Four incoming files and the queue contract agree at both bases. Declaration index SHA256 `{v['indexSha256']}`.

Stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']},own DAG {g['ownDAG']['vertices']}/{g['ownDAG']['edges']},combined DAG {g['combinedDAG']['vertices']}/{g['combinedDAG']['edges']}; all acyclic, no unresolved owned dependencies. All65 accepted restructure pairs and12of13 required stage pairs remain reachable. The inherited LocalFieldsRamification layer0→R03.4 missing path remains in its unchanged gap/request. Whole foreign roadmap/stage and stage-edge objects and53 sibling declarations are preserved.

## Resume

{plan['frontier']}

Continue with the native graded scalar actions over S/(a), using existing graded-ring quotient machinery, and check the finite generation needed over the remaining-generator ring for both actual kernel and actual cokernel. Then prove the Hilbert–Serre induction, including finite-difference integration, explicit thresholds and initial constants. Preserve the finite component-length bounds, signed integer recurrence and nonzero kernel correction. Neither that recurrence nor the new quotient grading proves polynomial existence, support-dimension equality or multiplicity normalization. All inherited coefficient, depth, patching, source-route and reserved-key obligations remain required.
'''
for n in ['author.py','projection.py','assemble.py','handoff.py','verify.py','graph.py','immutable_view.py','compile.py','runcheck.py','package.py']:
 t+='\n## Script: '+n+'\n\n```python\n'+(S/n).read_text()+'```\n'
(S/'Handoff.md').write_text(t);(S/'HandoffBase.md').write_text(t)
print('Handoff bytes',len(t.encode()))
```

## Script: verify.py

```python
"""Replay bounded source/log receipts and actual immutable checks; never execute Lean."""
from pathlib import Path
import ast,hashlib,json,os,re,subprocess,sys
S=Path(sys.argv[1]).resolve();R=Path.cwd().resolve();sys.path.insert(0,str(S))
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';NS='TauCeti.HilbertSamuel.'
sha=lambda b:hashlib.sha256(b).hexdigest()
txt=lambda n:(S/n).read_text()
data=lambda n:json.loads(txt(n))
MATH=txt('base.txt').strip();BASE=os.environ.get('ROOT_ACTION_VALIDATE_BASE',txt('publication-base.txt').strip())
def blob(ref,path):return subprocess.check_output(['git','show',ref+':'+path],cwd=R)
paths=['research/blueprint/'+f+'/'+('BP-'if f=='handoff'else'')+STEM+'.'+e for f,e in [('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
contents={p:txt(n)for p,n in zip(paths,['Candidate.json','Reader.md','Suggested.lean','PublicHandoff.md'if(S/'PublicHandoff.md').exists()else'Handoff.md'])}
for path,n in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert blob(MATH,path)==(S/n).read_bytes()==blob(BASE,path),path
p=data('Candidate.json');old=data('Incoming.json');plan=data('Plan.json')
assert len(old['nodes'])==436 and len(p['nodes'])==452 and set(p)==set(old)
assert p['nodes'][:436]==old['nodes']
assert plan['apiAdditions']=={}
assert p['nodes'][436:]==data('NewNodes.json')
assert [n['id']for n in p['nodes'][436:]]==plan['newNodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']and len(p['baseline']['declarations'])==440
assert {k:v for k,v in p['baseline'].items()if k!='declarations'}=={k:v for k,v in old['baseline'].items()if k!='declarations'}
assert p['sources'][:-1]==old['sources']and p['summary'].startswith(old['summary'])
for a,b in zip(old['coverage'],p['coverage']):
 if a['stageId']==RID+':R03.3':
  assert b['remaining']==a['remaining']+[plan['frontier']]
  assert {k:v for k,v in b.items()if k!='remaining'}=={k:v for k,v in a.items()if k!='remaining'}
 else:assert a==b
assert p['status']=='partial'and all(n['implementationStatus']=='unchecked'for n in p['nodes'])
assert(len(p['gaps']),len(p['requests']),len(p['coverage']),len(p['sourceIssues']))==(15,2,8,1)
assert txt('Reader.md')==txt('ReaderAddition.md')+txt('IncomingReader.md')
from projection import admit_lemmas,split_imports
assert txt('NewAdmitted.lean')==admit_lemmas(txt('New.lean'))+'\n'+admit_lemmas(txt('NewTests.lean'))
assert txt('Suggested.lean')==txt('NewImports.lean')+txt('Incoming.lean')+'\n'+txt('NewAdmitted.lean')
assert txt('Canonical.lean')==txt('NewImports.lean')+txt('CanonicalPrefix.lean')+'\n'+txt('NewAdmitted.lean')
assert txt('Native.lean')==txt('NewImports.lean')+txt('NativePrefix.lean')+'\n'+txt('New.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
prev=data('PreviousRecovery.json');manifest=data('PreviousManifest.json')
assert prev['head']=='6e88087af5f2690c08fe130ff1c6c7fc3ca36aab'and prev['artifactsVerified']==62 and prev['archivedHelpersVerified']==10
assert sha((S/'PreviousManifest.json').read_bytes())=='f3591a3f8a175e581fa0dfc8a1a484025be45d5bacaae86f7354a18d6e13ed7b'
for original,current in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean'),('Verification.json','PreviousVerification.json'),('MathematicalVerification.json','PreviousMathematicalVerification.json')]:assert manifest[original]['sha256']==sha((S/current).read_bytes())
for path,n in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==prev['publicDeliverables'][path]
assert (S/'IncomingPublicationVerification-replayed.json').read_bytes()==(S/'PreviousVerification.json').read_bytes()
assert (S/'IncomingMathematicalVerification-replayed.json').read_bytes()==(S/'PreviousMathematicalVerification.json').read_bytes()
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='6c4229ebc4efa08e8c03ff13742dbd82f0e2f05299b0825a774142b9fc3c3217'
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('OwnPreviousReading.json','OwnInheritedReading.json'),('OwnPreviousManifest.json','OwnInheritedManifest.json'),('OwnPreviousInputGuard.json','OwnInheritedInputGuard.json'),('OwnPreviousReadingChain.json','OwnInheritedReadingChain.json')]:assert om[original]['sha256']==sha((S/current).read_bytes())
im=data('OwnInheritedManifest.json')
assert sha((S/'OwnInheritedManifest.json').read_bytes())=='518be554db21e4e42d3bcf5374ed4d0d9bfdf7ee3379b56dc6b4cdfffdfbc318'
for original,current in [('Reading.json','OwnInheritedReading.json'),('InputGuard.json','OwnInheritedInputGuard.json'),('OwnPreviousReadingChain.json','OwnInheritedReadingChain.json')]:assert im[original]['sha256']==sha((S/current).read_bytes())
prior={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==24
for g in reuse:
 assert g['before']==prior[g['path']]and g['after']==sha(blob(MATH,g['path']))
 assert g['unchanged']==(g['before']==g['after'])
assert data('ClaimReceipt.json')['claim']==5978481670 and data('ClaimReceipt.json')['confirmation']==5978482601 and data('ClaimReceipt.json')['beforeAfterEqual']
assert data('ClaimReceipt.json')['wholeIssueCharacters']==55002 and data('Reading.json')['agent']=='Codex — codex-7e92bd'
def headers(t):
 found={}
 for m in re.finditer(r'^(?:local )?(?:noncomputable )?(def|lemma|theorem|instance|example)\b(?: \(priority := \d+\))?(?: ([\w.]+))?',t,re.M):
  if m.group(1)!='example'and m.group(2)is None:continue
  depth=0;end=None;pending_let=0
  for i in range(m.start(),len(t)):
   c=t[i]
   if c in '([{⟨':depth+=1
   elif c in ')]}⟩':depth-=1
   if depth==0 and re.match(r'let(?:I)?\b',t[i:]) and (i==0 or not (t[i-1].isalnum() or t[i-1]=='_')):
    pending_let+=1
   if depth==0 and(t.startswith(':=',i)or t.startswith('where',i)):
    if t.startswith(':=',i) and pending_let:pending_let-=1
    else:end=i;break
  assert end is not None
  label=m.group(2)if m.group(1)!='example'else'example#'+str(sum(x.startswith('example#')for x in found))
  assert label not in found;found[label]=' '.join(t[m.start():end].split())
 return found
nh=headers(txt('New.lean'));nt=headers(txt('NewTests.lean'));ch=headers(txt('NewAdmitted.lean'))
assert {**nh,**nt}==ch and len(nh)==17 and len(nt)==8
assert 'adicModuleCokernelProjection q M a 2 x = 0' in nt['example#0']
assert 'adicModuleCokernelProjection q M a (i+j) y = y' in nt['example#3']
assert set(plan['newNames'])=={NS+n for n in nh}
assert {n['declaration']for n in p['nodes'][436:]}|set(plan['definingInstances'])==set(plan['newNames'])
assert sum(len(n.get('api',[]))for n in p['nodes'][436:])==10
assert sum(len(n.get('tests',[]))for n in p['nodes'][436:])==11
assert len({t['name']for n in p['nodes'][436:]for t in n.get('tests',[])})==8
assert all(len(n['tests'])>=3 and len(n['api'])>=3 for n in p['nodes'][436:]if n['kind']in ['definition','construction'])
assert{t['name']for t in data('NewTests.json')}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
for n in p['nodes'][436:]:assert n['declaration']in txt('Reader.md')and n['statement']in txt('Reader.md')
tr=data('TauShiftReceipt.json');tb=txt('TauShift.lean').split('namespace TauCeti\n',1)[1].rsplit('end TauCeti\n',1)[0]
assert sha(tb.encode())==tr['declarationSha256']and tr['fileSha256']==tr['publicFetchedSha256']
assert tr['pin']=='f790474821cf4256814db967cb154e7af3d0c369'
assert list(headers(tb))==['DirectSum.map_decompose_shift']
assert 'tauceti:TauCeti.DirectSum.map_decompose_shift'in{b['ref']for b in old['baseline']['declarations']}
assert not data('SourceBoundary.json')['fullSuggestedCompiled'] and not data('SourceBoundary.json')['requiredTauOleanExists']
assert data('SourceBoundary.json')['tauPin']==tr['pin'] and data('SourceBoundary.json')['sourceTrackedClean']
assert data('Search.json')['newNames']==plan['newNames'] and all(r['exitStatus']==1 and not r['matches'] for r in data('Search.json')['exactNameSearches'])
rr=data('TauRestrictionReceipt.json')
rb=txt('TauRestriction.lean').split('open scoped _root_.DirectSum\n',1)[1].rsplit('end\nend TauCeti\n',1)[0]
assert sha(rb.encode())==rr['blockSha256'] and rr['fileSha256']==rr['publicFetchedSha256']==tr['fileSha256']
assert rr['pin']==tr['pin'] and list(headers(rb))==['DirectSum.isInternal_comap','DirectSum.Decomposition.restrict','DirectSum.map_decompose_restrict']
assert set(rr['declarations'])=={'TauCeti.'+n for n in headers(rb)}
compilation={}
for name,warnings,examples,audits in [('Native.lean',0,91,256),('Canonical.lean',858,352,0)]:
 rec=data(name[:-5]+'.receipt.json');log=txt(name[:-5]+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20 and rec['elapsedSeconds']<1200
 assert rec['sourceSha256']==sha((S/name).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses')==warnings
 assert len(re.findall(r'^example\b',txt(name),re.M))==examples
 a=re.findall(r"'([^']+)' depends on axioms:\s*\[([^]]*)\]",log);assert len(a)==audits
 assert 'sorryAx'not in log and all(set(x.strip()for x in v.replace('\n',' ').split(',')if x.strip())<={'propext','Classical.choice','Quot.sound'}for _,v in a)
 if name=='Native.lean':assert set(plan['newNames'])|set(rr['declarations'])|{'TauCeti.DirectSum.map_decompose_shift'}<={n for n,_ in a}
 assert '-j 1 -M 8192'in log and 'timeout 1200'in log and 'Exit status: 0'in log
 compilation[name]={**rec,'lines':len(txt(name).splitlines()),'examples':examples}
changes=data('PublicationChanges.json');allowed={d['path']:d for d in changes}
for g in data('InputGuard.json'):
 a=sha(blob(MATH,g['path']));b=sha(blob(BASE,g['path']));assert a==g['sha256']
 if a!=b:assert g['path']in allowed and allowed[g['path']]['before']==a and allowed[g['path']]['after']==b and allowed[g['path']]['reviewed'],g['path']
contracts=[]
for ref in[MATH,BASE]:
 job=next(j for j in json.loads(blob(ref,'research/blueprint/queue.json'))['jobs']if j['id']=='BP-'+STEM);contracts.append({k:v for k,v in job.items()if k not in ['state','note']})
assert contracts[0]==contracts[1]
if(S/'artifact-manifest.json').exists():
 for n,m in data('artifact-manifest.json').items():
  b=(S/n).read_bytes();assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],n
for path,t in contents.items():assert not re.search(r'/(?:home|tmp|Users)/|file'+'://|[ \t]+$',t,re.M),path
os.environ['ROOT_ACTION_VALIDATE_BASE']=BASE
import immutable_view;assert immutable_view.BASE==BASE
for path,t in contents.items():immutable_view.CACHE[path]=t.encode()
immutable_view.install();sys.path.insert(0,str(R/'scripts'))
import check_blueprint,source_issues,check_errata
assert sha(Path(sys.argv[2]).read_bytes())=='86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1'
index=check_blueprint.load_index(Path(sys.argv[2]));assert index[0]is not None
errors,warnings,summary=check_blueprint.check(S/(STEM+'.json'),index,check_blueprint.world());assert not errors and not warnings,(errors,warnings);summary['packet']=paths[0]
issues=source_issues.check_issues(p['sourceIssues'],RID)+check_errata.versions_checked(p,p['sourceIssues']);assert not issues,issues
tree=ast.parse((R/'research/blueprint/intake.py').read_text());wanted={'file_problems','auto_refusals','own_files','independent_of'}
picked=[n for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id in {'ALLOWED','PRIVATE'}for t in n.targets)or isinstance(n,ast.FunctionDef)and n.name in wanted]
env={'json':json,'re':re};exec(compile(ast.Module(body=picked,type_ignores=[]),'actual-intake','exec'),env)
job=next(j for j in json.loads((R/'research/blueprint/queue.json').read_text())['jobs']if j['id']=='BP-'+STEM)
problems=[x for f in paths for x in env['file_problems'](f,contents[f])];refusals=env['auto_refusals'](job,paths,False,{'codex-7e92bd'},set());assert not problems and not refusals,(problems,refusals)
graph=json.loads(subprocess.check_output([sys.executable,str(S/'graph.py'),str(S)],cwd=R,text=True,env={**os.environ,'ROOT_ACTION_VALIDATE_BASE':BASE}));assert graph['worldCommit']==BASE
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,preservedWholeNodes=436,preservedContracts=436,newNodes=16,newMathematicalDeclarations=17,definingInstances=1,newAPI=10,newTests=8,matchedNewHeaders=17,matchedTestHeaders=8,rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,inputGuards=len(data('InputGuard.json')),reviewedPublicationChanges=changes,indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullSuggestedCompiled=False,sourceReplayBoundary=data('SourceBoundary.json'),tauSourceReplay=tr,tauRestrictionSourceReplay=rr,LeanExecuted=False),indent=2))
```

## Script: graph.py

```python
from pathlib import Path
import sys,json,copy,collections,hashlib
S=Path(sys.argv[1]).resolve()
sys.path.insert(0,str(S))
import immutable_view
immutable_view.install()
sys.path.insert(0,str(Path.cwd()/'scripts'))
import build,blueprints,check_blueprint
RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7'
p=json.loads((S/f'{STEM}.json').read_text())
original=json.loads((S/'Incoming.json').read_text())
new={n['id']:n for n in p['nodes']}
root=Path.cwd()
a0=json.loads((root/"data/atlas.json").read_text())
packets,documents,definitions=blueprints.load_promoted(root)
otherparts=[(stem,q) for stem,q in packets if q.get("roadmapId")==RID and stem!=STEM]
assert otherparts, "must preserve other promoted roadmap parts"
keep=[x for x in packets if x[0]!=STEM]
documents[STEM]="research/blueprint/readmes/"+STEM+".md"
def assemble(candidate):
 build.load_promoted=lambda *args:(copy.deepcopy(keep+[(STEM,candidate)]),copy.deepcopy(documents),copy.deepcopy(definitions))
 return build.assemble(require_distances=False)[0]
a=assemble(p);b=assemble(original)
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
dep|={(world[nid]["parentStageId"],nid) for nid in seen if world[nid].get("parentStageId") in stageids or world[nid].get("parentStageId") in world}
dep|={(request["supplier"],consumer) for request in p.get("requests",[]) for consumer in request.get("neededBy",[]) if consumer in new or consumer in stageids}
roadmap=next(r for r in a["roadmaps"] if r["id"]==RID)
expected_decl=len(new)+sum(len(q["nodes"]) for _,q in otherparts)
assert roadmap["blueprint"]["declarations"]==expected_decl,(roadmap["blueprint"],expected_decl)
assert not roadmap["blueprint"]["skippedLinks"] and not roadmap.get("pendingLinks",[])
assert a['stageEdges']==b['stageEdges']
def skips(atlas):
 return {r["id"]:(r.get("blueprint",{}).get("skippedLinks",[]),r.get("pendingLinks",[])) for r in atlas["roadmaps"] if r["id"]!=RID}
assert skips(a)==skips(b)
assert {r['id']:r for r in a['roadmaps'] if r['id']!=RID}=={r['id']:r for r in b['roadmaps'] if r['id']!=RID}
assert {r['id']:r for r in a['stages'] if not r['id'].startswith(RID+':')}=={r['id']:r for r in b['stages'] if not r['id'].startswith(RID+':')}
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
assert missingpairs=={('tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions',RID+':R03.4')}
assert any('LocalFieldsRamification layer 0 to R03.4' in gap['detail'] for gap in p['gaps'])
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
report['worldCommit']=immutable_view.BASE
report['readPaths']=len(immutable_view.READS)
report['readPathHashes']={path:hashlib.sha256(immutable_view.blob(path)).hexdigest() for path in sorted(immutable_view.READS)}
report['foreignRoadmapsAndStagesUnchanged']=True
print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
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
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','Probe.lean'}
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
STEM='DeformationAndDerivedPatchingAlgebra--P7'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
New.lean NewTests.lean NewImports.lean Audits.lean NewAdmitted.lean
TauShift.lean TauShiftReceipt.json TauRestriction.lean TauRestrictionReceipt.json SourceBoundary.json Candidate.json Reader.md ReaderAddition.md Suggested.lean
Handoff.md HandoffBase.md ClaimReceipt.json Reading.json SourceReading.json OwnPreviousReading.json
OwnPreviousManifest.json OwnPreviousInputGuard.json OwnInheritedReading.json OwnInheritedManifest.json OwnInheritedInputGuard.json OwnInheritedReadingChain.json OwnReadingReuse.json Search.json InputGuard.json PublicationChanges.json
Plan.json NewNodes.json NewTests.json PreviousManifest.json PreviousRecovery.json PreviousVerification.json PreviousMathematicalVerification.json IncomingPublicationVerification-replayed.json IncomingMathematicalVerification-replayed.json Graph.json
MathematicalVerification.json Verification.json base.txt publication-base.txt
author.py projection.py assemble.py handoff.py verify.py graph.py immutable_view.py compile.py runcheck.py package.py'''.split()
if mode=='archive':
 meta={n:dict(sha256=sha((S/n).read_bytes()),bytes=len((S/n).read_bytes()),lines=len((S/n).read_bytes().splitlines()))for n in NAMES}
 mb=(json.dumps(meta,indent=2,sort_keys=True)+'\n').encode();(S/'artifact-manifest.json').write_bytes(mb)
 payload={n:dict(sha256=sha((S/n).read_bytes()),data=base64.b64encode(zlib.compress((S/n).read_bytes(),9)).decode())for n in NAMES+['artifact-manifest.json']}
 pb=(json.dumps(payload,sort_keys=True,separators=(',',':'))+'\n').encode();(S/'payload.json').write_bytes(pb)
 report=dict(artifacts=len(NAMES),helpers=sum(n.endswith('.py')for n in NAMES),manifestSha256=sha(mb),payloadSha256=sha(pb))
 (S/'package.json').write_text(json.dumps(report,indent=2)+'\n')
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED ADIC COKERNEL GRADING PAYLOAD\n'+pb+b'END ARCHIVED ADIC COKERNEL GRADING PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated adic cokernel grading evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='DeformationAndDerivedPatchingAlgebra--P7'
ARCHIVE=__ARCHIVE__
MANIFEST_SHA=__MANIFEST__
PAYLOAD_SHA=__PAYLOAD__
EXPECTED=__EXPECTED__
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED ADIC COKERNEL GRADING PAYLOAD\\n',1)[1].split('END ARCHIVED ADIC COKERNEL GRADING PAYLOAD -/',1)[0].encode()
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
tr=json.loads((S/'TauShiftReceipt.json').read_text())
assert tr['publicUrl']=='https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/DirectSum/Internal.lean'
with urllib.request.urlopen(tr['publicUrl'],timeout=30)as r:tau=r.read()
assert sha(tau)==tr['fileSha256']==tr['publicFetchedSha256']
ts=tau.decode();a=ts.index('theorem DirectSum.map_decompose_shift');b=ts.index('/-- Homogeneous projection',a)
block=ts[a:b].rstrip()+'\\n'
assert sha(block.encode())==tr['declarationSha256']
assert block==(S/'TauShift.lean').read_text().split('namespace TauCeti\\n',1)[1].rsplit('end TauCeti\\n',1)[0]
rr=json.loads((S/'TauRestrictionReceipt.json').read_text())
assert rr['publicUrl']==tr['publicUrl'] and rr['fileSha256']==rr['publicFetchedSha256']==sha(tau)
a=ts.index('theorem DirectSum.isInternal_comap');b=ts.index('/-- A linear map which carries',a)
c=ts.index('/-- Homogeneous projection in a restricted decomposition');d=ts.index('-- The inverse congruence',c)
rblock=ts[a:b].rstrip()+'\\n\\n'+ts[c:d].rstrip()+'\\n'
assert sha(rblock.encode())==rr['blockSha256']
assert rblock==(S/'TauRestriction.lean').read_text().split('open scoped _root_.DirectSum\\n',1)[1].rsplit('end\\nend TauCeti\\n',1)[0]
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
for name in meta:
 if name.endswith('.py'):
  helper=handoff.split('## Script: '+name+'\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
  assert helper==(S/name).read_text(),name
code=handoff.split('## Script: recover.py\\n\\n'+fence+'python\\n',1)[1].split('\\n'+fence+'\\n',1)[0]+'\\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),pinnedTauSourceVerified=tr['fileSha256'],tauRestrictionBlockVerified=rr['blockSha256'],LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's four named deliverable paths. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and contains the full unchecked plan with its native Tau Ceti import.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, fetches the existing pinned Tau source and verifies all four exact replayed declarations, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the mathematical base to reproduce MathematicalVerification.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the admitted Mathlib-only evidence projection with the exact pinned Tau source declarations replayed; Suggested.lean imports the Tau library and is uncompiled. Native.lean replays the same four existing declarations from source and proves the new contracts without admissions. No exact-pin Tau compiled-import claim is made. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references and exact archived helper fences.

## Script: recover.py

'''
 text=(S/'HandoffBase.md').read_text()+prose+'```python\n'+code+'```\n'
 (S/'PublicHandoff.md').write_text(text)
 (R/'research/blueprint/handoff'/('BP-'+STEM+'.md')).write_text(text)
 suggested.write_bytes((S/'Suggested.lean').read_bytes())
 print(json.dumps(dict(archive=archive,recoverySha256=sha(code.encode()),finalHandoffSha256=sha(text.encode())),indent=2))
else:raise ValueError(mode)
```

## Public recovery and replay

Archive commit `49b8af23f102ffb7b463801faaf1bdde5391d635` is an ancestor changing only this issue's four named deliverable paths. Its 66 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `3779c3e71b30898e174ed35a4811447ba8e849f2d74ba840580e8186067f6da1`; payload SHA256 `b3c120773786a6fe433695ef99e45443f8d06c7ee56ec22363953f4ab2d85089`. The final suggested file has no archive payload and contains the full unchecked plan with its native Tau Ceti import.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, fetches the existing pinned Tau source and verifies all four exact replayed declarations, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the mathematical base to reproduce MathematicalVerification.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the admitted Mathlib-only evidence projection with the exact pinned Tau source declarations replayed; Suggested.lean imports the Tau library and is uncompiled. Native.lean replays the same four existing declarations from source and proves the new contracts without admissions. No exact-pin Tau compiled-import claim is made. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references and exact archived helper fences.

## Script: recover.py

```python
"""Recover public authenticated adic cokernel grading evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='DeformationAndDerivedPatchingAlgebra--P7'
ARCHIVE='49b8af23f102ffb7b463801faaf1bdde5391d635'
MANIFEST_SHA='3779c3e71b30898e174ed35a4811447ba8e849f2d74ba840580e8186067f6da1'
PAYLOAD_SHA='b3c120773786a6fe433695ef99e45443f8d06c7ee56ec22363953f4ab2d85089'
EXPECTED={'packets': '4279baca0a2003dc0927e512d4808419e10eba1367d7e0180e14be7770e604be', 'readmes': 'b48ae260e3df4ece5b3e153eeef66eff9d76bc247724063904f5cadb15220488', 'suggested': 'd6d74f545e49649d4efcd94806679e7964761b7037c3b6218ba58929f298edca'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED ADIC COKERNEL GRADING PAYLOAD\n',1)[1].split('END ARCHIVED ADIC COKERNEL GRADING PAYLOAD -/',1)[0].encode()
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
tr=json.loads((S/'TauShiftReceipt.json').read_text())
assert tr['publicUrl']=='https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/DirectSum/Internal.lean'
with urllib.request.urlopen(tr['publicUrl'],timeout=30)as r:tau=r.read()
assert sha(tau)==tr['fileSha256']==tr['publicFetchedSha256']
ts=tau.decode();a=ts.index('theorem DirectSum.map_decompose_shift');b=ts.index('/-- Homogeneous projection',a)
block=ts[a:b].rstrip()+'\n'
assert sha(block.encode())==tr['declarationSha256']
assert block==(S/'TauShift.lean').read_text().split('namespace TauCeti\n',1)[1].rsplit('end TauCeti\n',1)[0]
rr=json.loads((S/'TauRestrictionReceipt.json').read_text())
assert rr['publicUrl']==tr['publicUrl'] and rr['fileSha256']==rr['publicFetchedSha256']==sha(tau)
a=ts.index('theorem DirectSum.isInternal_comap');b=ts.index('/-- A linear map which carries',a)
c=ts.index('/-- Homogeneous projection in a restricted decomposition');d=ts.index('-- The inverse congruence',c)
rblock=ts[a:b].rstrip()+'\n\n'+ts[c:d].rstrip()+'\n'
assert sha(rblock.encode())==rr['blockSha256']
assert rblock==(S/'TauRestriction.lean').read_text().split('open scoped _root_.DirectSum\n',1)[1].rsplit('end\nend TauCeti\n',1)[0]
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','PublicHandoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+RID+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder]and b==(S/name).read_bytes(),path
 (S/name).write_bytes(b);public[path]=sha(b)
(S/(RID+'.json')).write_bytes((S/'Candidate.json').read_bytes())
fence=chr(96)*3;handoff=(S/'PublicHandoff.md').read_text()
assert handoff.startswith((S/'HandoffBase.md').read_text())
for name in meta:
 if name.endswith('.py'):
  helper=handoff.split('## Script: '+name+'\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
  assert helper==(S/name).read_text(),name
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),pinnedTauSourceVerified=tr['fileSha256'],tauRestrictionBlockVerified=rr['blockSha256'],LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
