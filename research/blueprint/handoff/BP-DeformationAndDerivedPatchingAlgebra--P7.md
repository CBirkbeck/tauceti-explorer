# Quotient graded actions and remaining generators — checkpoint

Codex — codex-7e92bd. Refs #551. Partial. All466 nodes remain unchecked. The reserved intrinsic/ambient Hilbert–Samuel multiplicity key, eight stages, fifteen gaps and two requests remain required.

Fourteen new nodes (one construction and thirteen lemmas) supply the quotient scalar grading and reduction to the remaining polynomial generators. All452 incoming whole nodes are unchanged. The polynomial-map construction has five API entries and five tests; three further typed tests check the quotient coordinates and repeated actions on kernel/cokernel components. Fifteen existing Mathlib/Tau declarations are added as baseline imports. The thirteen planets, original sources, E1 finding, requests and whole gap objects are preserved.

For arbitrary commutative A, ideal q and A-module M, use the existing Rees quotients S=gr_q(A), L=gr_q(M), actual a∈S_1, Q=S/(a), K=ker(mu_a) and C=L/range(mu_a). The principal ideal (a) is homogeneous by the native span theorem. Tau Ceti already provides gradeQuot and gradedAlgebraGradeQuot: these are imported, never replanned. The actual quotient coordinate of [b] is [pi_n(b)] by the existing direct-sum map comparison. A homogeneous quotient scalar has a homogeneous original representative, and the inherited representative-action identities identify its Q action with the old S action. Thus the actual K and C families satisfy native SetLike.GradedSMul, and their existing decomposition/projection fixes every homogeneous scalar product.

For any family b:J→S_1, the new native A/q-algebra map F:(A/q)[X_j]→Q evaluates X_j to [b_j]. Its coefficient and variable formulas, uniqueness and degree-one image are separate nodes. If {a} together with (b_j) generates S, F is surjective: map the original adjoin equality through the quotient, remove the now-zero generator a, and identify the remaining adjoin with the polynomial evaluation range. For J=Fin r this is the required reduction from r+1 designated generators to r; minimality, nonzero generators and nonempty J are not assumed.

The original Q-module finiteness theorems and the proved surjectivity then make K and C finite over the remaining polynomial ring via the actual Module.compHom action and scalar tower. Kernel finiteness assumes L is Noetherian as an S-module. Cokernel finiteness requires only that L be finite over S. No regularity or injectivity of multiplication by a, reducedness or freeness is introduced. Finiteness of J is needed when using a finite generator count in the later induction, not for these individual map/finiteness statements.

Eight typed examples check coefficient-plus-variable evaluation; killing a repeated removed generator; a surjective empty-variable map when a alone generates; q=A and the zero coefficient ring; a surviving nonzero square-zero degree-one variable over Z/4,q=(2),a=0; two successive homogeneous quotient scalar actions and their kernel/cokernel coordinates; and mixed degree-zero/one scalar representatives with vanishing degree-two quotient coordinate. The nilpotent example rejects both a reduced-quotient assumption and an accidental quotient that kills every positive degree.

## Reading and provenance

The whole55002-character issue was read in four complete slices before claim5980112144 and again after bot5980113613 confirmed that exact numeric claim. ClaimReceipt.json records the unchanged body hash and complete bounds. The current reviewed R03.3 audit, reserved key, both requests, whole relevant gaps4–8 and complete R03.3 coverage frontier were freshly read before planning.

Own PR6064 at head236110125574505f05d1ad4ede8ba9ddd82d4f03 was recovered through actual public HTTP:66artifacts,10helpers,four final files and all four pinned Tau direct-sum source declarations. Both actual immutable recovered verifiers reproduced their archived mathematical/publication reports byte-for-byte. The current four deliverables match that checkpoint. Its complete recovery helper, verifier, immutable reader and graph checker were inspected. The full incoming packet and3877-line native proof prefix are authenticated and retained, not claimed to have received a new complete manual proof audit.

Own6064 Reading/InputGuard records are authenticated against manifest3779c3e71b30898e174ed35a4811447ba8e849f2d74ba840580e8186067f6da1. Nested original own6051 and6037 manifest/reading/input scopes are authenticated too. Of the29original controls,24are unchanged; the four owned files and Scheme Foundations changed. Current SFpacket bytes match own6070; its SF.0 final continuation and complete empty requests were freshly read. The whole relevant current link/overlap/examined entries and touching restructure rows were read:57files,123entries. All85current controls are guarded. Peer reading claims are not reassigned to this session.

WORKERS, PROTOCOL0–6 and12–15, complete expansion PROTOCOL and complete UPSTREAM_GUIDE were freshly reread. Other unchanged binding/upstream-roadmap/accepted RS08 scopes retain their original authenticated own attribution. Reading.json records exact consumed native proof ranges and pinned source ranges. Complete actual native statements, proof/construction and hypotheses were read before citing each new baseline import. The full223-line Tau quotient-grading source was personally read and fetched byte-for-byte at its exact pin. Bounded name searches cover both source trees and current packets. GitHub search confirms the existing quotient design follows open Mathlib PR36501; the Zulip search yielded no additional exact quotient design result. These searches are not semantic absence proofs.

The complete currently displayed Stacks Section10.58, all ten numbered statements/proofs and all five comments, was read at https://stacks.math.columbia.edu/tag/00JV. SourceReading.json binds actual fetched bytes/hash/time. The native action and generator lemmas are authored deductions motivated by that source. The retained elementary length-valued kernel/cokernel induction differs from its K0 proof and keeps the nonzero kernel correction. Linked proofs/history, inherited E1 and every routed source are not newly recursively audited here.

## Compilation boundary

**The full Tau-importing Suggested.lean is uncompiled.** The available Tau build is at cf386627e9176a3827c1a5fe804989fd94a4d216, not the required f790474821cf4256814db967cb154e7af3d0c369, and lacks both Internal.olean and the graded quotient olean. No library was built.

The isolated Native.lean and Canonical.lean files retain their exact authenticated incoming prefixes, including four exact existing Tau direct-sum declarations. Native additionally replays the unchanged complete namespace block of TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean. Canonical replays identical declarations and proofs, omitting only the unused universe u/v/w header that conflicts with the inherited file; this exact one-line normalization is mechanically verified. The public recovery fetches both pinned source files and verifies every exact block. All twelve public named declarations of the quotient package, the four old source declarations and all fourteen new declarations are covered by the native axiom audits. The package's private supporting proof and defining instance remain unchanged and are checked through their use. Source replay is not a compiled Tau-library import claim.

The fourteen new declaration headers and eight test headers match the admitted projection exactly, including all nested let/letI bindings and conclusions. The actual polynomial-map data are retained; new lemma/test proofs are admitted only in the canonical plan. Final native evidence compiles the complete source without importing the disposable prototype olean. All proofs use only propext,Classical.choice and Quot.sound, with no sorryAx.

Checks use the existing Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Runs are serial after a fresh20GiB guard, one thread,8192MiB cap and1200-second timeout. No Lake setup/update/cache, library build or language server.

- Native.lean: 4402 lines,99 examples,exit0,0 warnings,282 axiom audits; 40GiB available,274.4 seconds,peak3753684KiB. Source SHA256 `da24d7a1ede0156a4883d080b2df7c7bcd8ad193dce561b665d2d59ffc2c7cf2`; diagnostic SHA256 `063365dd28e139c6debb7b128587dfcb902c8fd0e80aaa087ad552d15a734fe3`.
- Canonical.lean: 6776 lines,360 examples,exit0,879 warnings,0 axiom audits; 41GiB available,160.35 seconds,peak3921624KiB. Source SHA256 `c405fa1578aedc0b3315740e456feee8cccde0d5f6c1fe30e7e08b71f44175bc`; diagnostic SHA256 `bfd74e275146f592f173c4446fcfb073a8039e031f3eafd2eafa9795aea39cd7`.

Suggested.lean: 6532 lines,uncompiled; SHA256 `69624aa9b8d269c378681f28c58e3f5b7d08eca5d6582485af98e23651b35a62`. Native has282clean audits and no warnings/errors/admissions. Canonical has879expected admission warnings only.

## Immutable validation

The actual indexed checker reports466nodes (11definitions,66constructions,16theorems,373lemmas),359API entries,295recognized tests(381raw references),13planets and455baseline declarations, with no errors or warnings. Actual intake authorization/file checks and source-issue/version checks pass. The required direct check_blueprint.py invocation passes with the exact declarations.tsv. Every452incoming whole node and prior API/test, every source/version/E1 record, fifteen gap objects and both requests remain unchanged.

Mathematical base `dd6f725ba6973b93520ca82da596bceb3b39a461`; publication base `f9b083a612aedb04b123dece283b191a0b48a63d`. Both actual immutable verifier outputs are retained. All85input controls are guarded; PublicationChanges.json contains 0 reviewed changes. The four original owned files and queue contract agree at both bases. Declaration index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`.

Stage DAG 3003/8623,own DAG 466/800,combined DAG 3457/9890; all acyclic and no unresolved owned dependencies. All65accepted restructure pairs and12of13required stage pairs remain reachable. The inherited LocalFieldsRamification layer0→R03.4 missing path remains in its unchanged gap/request. Complete foreign roadmap/stage and stage-edge objects and53sibling declarations remain preserved.

## Resume

Fourteen new nodes specialize the existing Tau quotient grading to S/(a), prove agreement with original scalar projections, and supply native graded actions on the actual kernel and cokernel using their already constructed scalar descent. The remaining-generator polynomial algebra map has coefficient/variable formulas, uniqueness, degree-one images and proved surjectivity when {a} together with the remaining family generates S. Both actual modules are finite over this remaining polynomial ring under their distinct inherited Noetherian/finite-module hypotheses. This supersedes only these graded-scalar and remaining-polynomial-finiteness omissions. Still supply the induction in a form closed under repeated graded kernels and quotients, arbitrary homogeneous polynomial action, finite homogeneous generating families and the zero-generator eventual-vanishing branch, then assemble the finite-length recurrence with explicit finite-difference polynomial, threshold and initial constant. The current adic specializations do not themselves constitute the recursive Hilbert–Serre theorem. Preserve the nonzero kernel correction and guarded length conversions. Polynomial existence, support/degree, completion, localization, associativity, intrinsic/ambient multiplicity, all eight stages and every routed-paper obligation remain open; all nodes unchecked.

The next proof should expose an induction statement for arbitrary internally graded modules that remains applicable after taking a kernel and quotient. Reuse the existing generic Tau quotient grading and current actual scalar maps. Prove homogeneous polynomial action and finite homogeneous generating-family bounds, discharge the zero-generator eventual-vanishing case, and assemble the signed finite-length recurrence into an explicit rational polynomial with threshold and restored initial constant. A recurrence, grading or ordinary finite-generation theorem does not itself prove eventual polynomial existence or support-dimension equality. Preserve both intrinsic and ambient multiplicity conventions and every routed obligation.

## Script: author.py

```python
"""Specialize existing quotient grading and reduce to the remaining polynomial generators."""
from pathlib import Path
import json,copy,re
S=Path(__file__).resolve().parent;RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';STAGE=RID+':R03.3';NS='TauCeti.HilbertSamuel.'
put=lambda n,v:(S/n).write_text(v if isinstance(v,str)else json.dumps(v,ensure_ascii=False,indent=2)+'\n')
p=json.loads((S/'Incoming.json').read_text());old=copy.deepcopy(p)
byname={n.get('declaration',n.get('leanName')):n['id']for n in old['nodes']}
for n in old['nodes']:
 for a in n.get('api',[]):byname.setdefault(a['name'],n['id'])
owned=lambda n:byname[NS+n]
common='Let A be any commutative ring, q any ideal, M any A-module, S=gr_q(A) and L=gr_q(M) the existing native Rees quotients. Fix an actual a in S_1. Set I=(a), Q=S/I, K=ker(mu_a) and C=L/range(mu_a), where mu_a is the existing S-linear multiplication map. Use the existing A-submodule gradings of S,K,C, the existing descended Q-module structures on K,C, and the existing Tau quotient components Q_i=gradeQuot(S_i,I). No new carrier or generic graded-quotient construction is introduced. No locality, reducedness, freeness or regularity hypothesis is implicit.'
source=[dict(sourceId='HS-REMAINING-GENERATORS-00JV',locator='Section10.58, proof of Proposition10.58.7; homogeneous generators in Lemma10.58.6',excerpt='the graded ring',match='Motivates reduction by one degree-one generator. The exact native scalar-compatibility and remaining-generator maps here are authored specializations of the pinned library. The chosen length-valued kernel/cokernel induction retains its kernel correction; it does not copy the source K0 argument or assume injectivity.')]
tests=[
 ('coefficient_and_variable','computation','The remaining-generator map evaluates C(c)+X_i to the actual coefficient image plus the quotient class of b_i.'),
 ('eliminated_generator','non-example','If the remaining family repeats a itself, every corresponding variable maps to zero in S/(a). A map into S or an identity substitute fails.'),
 ('empty_family','degenerate','If a alone generates S as an A/q-algebra, the map from polynomials with the empty variable type is still surjective onto S/(a). No positive number of remaining generators is assumed.'),
 ('unit_ideal','degenerate','For q=A, every polynomial evaluates to zero in the actual remaining-generator quotient, over the zero coefficient ring.'),
 ('surviving_nilpotent','non-example','For A=Z/4, q=(2), a=0, the degree-one class of2 supplies a remaining generator whose variable image is nonzero and has square zero in the actual quotient. Neither killing all positive degrees nor assuming a reduced quotient is allowed.'),
 ('kernel_two_scalars','compatibility','For actual b in Q_i, c in Q_j and x in K_n, the nested descended product b·(c·x) is fixed by the native kernel decomposition at i+(j+n).'),
 ('cokernel_two_scalars','compatibility','For actual b in Q_i, c in Q_j and x in C_n, the nested descended product b·(c·x) is fixed by the existing cokernel projection at i+(j+n).'),
 ('quotient_mixed_coordinates','compatibility','For a quotient class of an original degree-zero plus degree-one scalar, the native quotient coordinate at0 is exactly the class of its degree-zero term and its coordinate at2 vanishes.')]
tests=[dict(name='AdicRemainingTests.'+n,kind=k,statement=t)for n,k,t in tests]
new=[]
def add(slug,name,kind,title,statement,deps,proof,hyp=None):
 n=dict(id=STAGE+'/'+slug,parentStageId=STAGE,realises=[STAGE],kind=kind,title=title,declaration=NS+name,statement=statement,hypotheses=[common]+(hyp or []),proofSteps=proof,prerequisites=deps,acceptance=[statement,'Use the same native quotient and module actions; implementation status stays unchecked.'],uses=[dict(where='R03.3 length-valued Hilbert–Serre induction, motivated by Stacks10.58.7',how='Reduce one designated degree-one generator while retaining actual homogeneous kernel/cokernel components, scalar action and finiteness. These data are inputs to the still-required polynomial-existence induction.')],sources=source,library=dict(module='TauCeti/RingTheory/HilbertSamuel',namespace='TauCeti.HilbertSamuel'),implementationStatus='unchecked')
 new.append(n);return n
h=add('adic-scalar-quotient-homogeneous','adicScalarQuotient_homogeneous','lemma','Homogeneous principal scalar ideal','The actual principal ideal I=(a) is homogeneous for the existing internal grading of S, including a=0 and nonzero zero divisors.',[owned('adicRingComponents'),owned('adicRingGrading'),'mathlib:Ideal.homogeneous_span'],['Use the existing theorem that the ideal spanned by homogeneous elements is homogeneous. The singleton generator belongs to the actual degree-one component.'])
d=add('adic-scalar-quotient-coordinate','adicScalarQuotient_decompose_mk','lemma','Scalar quotient coordinates','Install the existing Tau gradedAlgebraGradeQuot on Q using the preceding homogeneity proof. For every b in S and n≥0, the n-th coordinate of [b] in Q, included into Q, is exactly [pi_n(b)], where pi_n is the existing adicRingProjection.',[h['id'],owned('adicRingProjection'),'tauceti:TauCeti.GradedAlgebra.gradeQuot','tauceti:TauCeti.GradedAlgebra.gradedAlgebraGradeQuot','tauceti:TauCeti.GradedAlgebra.mk_mem_gradeQuot','tauceti:TauCeti.DirectSum.map_decompose_shift','mathlib:Ideal.Quotient.mkₐ'],['The quotient algebra map is A-linear and sends each original component into the existing quotient component.','Apply the existing shifted-decomposition comparison with the identity injective degree map and reverse the resulting equality. No new quotient grading is constructed.'])
k=add('adic-kernel-quotient-graded-action','adicModuleKernelScalar_gradedSMul','lemma','Quotient scalar grading on the kernel','For the existing Q-module structure on K, the existing families Q_i and K_j satisfy native SetLike.GradedSMul: Q_i·K_j is contained in K_(i+j).',[owned('adicModuleKernelScalarModule'),owned('adicModuleKernelScalar_mk_smul'),owned('adicModuleKernelComponents_smul'),'tauceti:TauCeti.GradedAlgebra.gradeQuot','tauceti:TauCeti.GradedAlgebra.mem_gradeQuot_iff','mathlib:SetLike.GradedSMul'],['Lift the actual homogeneous quotient scalar to a homogeneous original scalar.','Its descended action equals the original S action by the inherited representative formula; apply the already proved original kernel degree-addition law.'])
c=add('adic-cokernel-quotient-graded-action','adicModuleCokernelScalar_gradedSMul','lemma','Quotient scalar grading on the cokernel','For the existing Q-module structure on C, the existing families Q_i and C_j satisfy native SetLike.GradedSMul: Q_i·C_j is contained in C_(i+j).',[owned('adicModuleCokernelScalarModule'),owned('adicModuleCokernelScalar_mk_smul'),owned('adicModuleCokernelComponents_smul'),'tauceti:TauCeti.GradedAlgebra.gradeQuot','tauceti:TauCeti.GradedAlgebra.mem_gradeQuot_iff','mathlib:SetLike.GradedSMul'],['Lift the homogeneous quotient scalar and use the inherited descended representative-action formula.','The original S action on the same cokernel already adds component degrees.'])
kp=add('adic-kernel-quotient-action-coordinate','adicModuleKernelScalar_decompose_product','lemma','Kernel coordinate of a quotient scalar product','For b in Q_i and actual x in K_j, with the existing Q action and kernel decomposition installed, the coordinate at i+j of b·x, included into K, equals b·x.',[k['id'],owned('adicModuleKernelDecomposition'),'mathlib:DirectSum.decompose_of_mem_same'],['The new quotient graded-action theorem places b·x in K_(i+j); native homogeneous decomposition fixes it.'])
cp=add('adic-cokernel-quotient-action-projection','adicModuleCokernelScalar_projection_product','lemma','Cokernel projection of a quotient scalar product','For b in Q_i and actual x in C_j, the existing cokernel projection at i+j fixes the actual descended product b·x.',[c['id'],owned('adicModuleCokernelProjection_eq_self_iff')],['Apply the new quotient degree-addition theorem and the inherited fixed-projection characterization on the same quotient C.'])
f=add('adic-remaining-generator-map','adicRemainingGeneratorMap','construction','Polynomial map from the remaining generators','For any index type J and family b:J→S_1, construct the A/q-algebra map F:(A/q)[X_j | j∈J]→Q sending X_j to the actual class of b_j. This uses ordinary native multivariate polynomials and the existing quotient algebra, without assuming that the family generates S.',[owned('adicGradedRing'),owned('adicRingComponents'),'mathlib:MvPolynomial.aeval','mathlib:Ideal.Quotient.mk'],['Apply the native universal evaluation map to the quotient classes of the designated remaining degree-one generators. The coefficient algebra is the inherited A/q algebra on the actual quotient.'])
fx=add('adic-remaining-generator-variable','adicRemainingGeneratorMap_X','lemma','Remaining variable evaluation','For every j∈J, F(X_j)=[b_j] in Q.',[f['id'],'mathlib:MvPolynomial.aeval_X'],['Use native evaluation on a polynomial variable.'])
fc=add('adic-remaining-generator-coefficient','adicRemainingGeneratorMap_C','lemma','Remaining coefficient evaluation','For every c∈A/q, F(C(c)) is the actual coefficient algebra image of c in Q.',[f['id'],'mathlib:MvPolynomial.aeval_C'],['Use native evaluation on a polynomial coefficient.'])
fu=add('adic-remaining-generator-uniqueness','adicRemainingGeneratorMap_unique','lemma','Uniqueness of the remaining generator map','Any A/q-algebra homomorphism from (A/q)[X_j] to the same Q taking every X_j to [b_j] equals F.',[f['id'],fx['id'],'mathlib:MvPolynomial.algHom_ext'],['The native multivariate polynomial algebra-homomorphism extensionality theorem reduces equality to the prescribed variable values.'])
fd=add('adic-remaining-generator-degree','adicRemainingGeneratorMap_degree_one','lemma','Remaining variable has quotient degree one','For every j∈J, F(X_j) belongs to the existing quotient component Q_1. This permits zero generator images and does not assert their nonvanishing.',[fx['id'],'tauceti:TauCeti.GradedAlgebra.mk_mem_gradeQuot'],['Each original b_j belongs to S_1; its quotient class belongs to the corresponding native quotient component.'])
fs=add('adic-remaining-generator-surjective','adicRemainingGeneratorMap_surjective','lemma','Surjectivity after removing one generator','If the designated a together with the family (b_j) generates S as an A/q-algebra, then F is surjective onto Q=S/(a). For J=Fin r this removes one generator from a list of r+1, without requiring minimality or nonzero generators.',[f['id'],'mathlib:MvPolynomial.aeval_range','mathlib:AlgHom.range_eq_top','mathlib:Algebra.map_top','mathlib:AlgHom.map_adjoin','mathlib:Algebra.adjoin_insert_zero','mathlib:Ideal.Quotient.mk_surjective','mathlib:Ideal.Quotient.eq_zero_iff_mem'],['Map the original adjoin equality through the surjective quotient algebra map.','The image of a is zero. Adjoining this zero adds nothing, so the quotient is generated by the remaining images.','Identify this adjoin with the range of the native evaluation map.'],['The A/q-algebra generated by {a}∪{b_j | j∈J} is all of S. No finiteness of J is required for this statement.'])
kf=add('adic-kernel-remaining-polynomial-finite','adicModuleKernelRemaining_finite','lemma','Kernel finiteness over the remaining polynomial ring','Assume {a}∪{b_j} generates S over A/q and L is Noetherian as an S-module. Restrict the existing Q action on the actual K along F using native Module.compHom. Then K is finite over (A/q)[X_j | j∈J].',[fs['id'],owned('adicModuleKernelScalar_finite'),'mathlib:Module.compHom','mathlib:RingHom.Finite.of_surjective','mathlib:Module.Finite.trans'],['The inherited smaller-ring theorem makes K finite over Q under the stated Noetherian-module hypothesis.','The surjective F makes Q finite over the polynomial source. Its actual induced action and the composed K action form the scalar tower by associativity of scalar multiplication.','Apply native transitivity of finite modules.'],['L is Noetherian as an S-module. The designated family {a}∪{b_j} generates S over A/q. No regularity of a is assumed.'])
cf=add('adic-cokernel-remaining-polynomial-finite','adicModuleCokernelRemaining_finite','lemma','Cokernel finiteness over the remaining polynomial ring','Assume {a}∪{b_j} generates S over A/q and L is finite as an S-module. Restrict the existing Q action on the actual C along F using native Module.compHom. Then C is finite over (A/q)[X_j | j∈J].',[fs['id'],owned('adicModuleCokernelScalar_finite'),'mathlib:Module.compHom','mathlib:RingHom.Finite.of_surjective','mathlib:Module.Finite.trans'],['The inherited quotient theorem gives finite generation over Q from finite generation of L over S.','Surjectivity makes Q finite over the polynomial source; the composed action has the native scalar tower.','Apply finite-module transitivity. Unlike the kernel theorem, this requires no Noetherian hypothesis.'],['L is finite as an S-module. The designated family {a}∪{b_j} generates S over A/q.'])
f['api']=[dict(name=n['declaration'],role=r,statement=n['statement'])for n,r in [(fx,'simp'),(fc,'simp'),(fu,'universal-property'),(fd,'compatibility'),(fs,'characterisation')]]
f['tests']=tests[:5];k['tests']=[tests[5]];c['tests']=[tests[6]];d['tests']=[tests[7]]
base=[
 ('mathlib','AlgHom.range_eq_top','theorem','Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean',251,'An algebra homomorphism has full range exactly when it is surjective.'),
 ('mathlib','Algebra.map_top','theorem','Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean',263,'The image of the whole algebra under an algebra homomorphism equals its range.'),
 ('mathlib','Ideal.Quotient.mk','def','Mathlib/RingTheory/Ideal/Quotient/Defs.lean',83,'The native quotient ring homomorphism.'),
 ('mathlib','Ideal.Quotient.mkₐ','def','Mathlib/RingTheory/Ideal/Quotient/Operations.lean',369,'The native quotient algebra homomorphism with its actual inherited coefficient action.'),
 ('tauceti','TauCeti.GradedAlgebra.gradeQuot','def','TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean',84,'Original homogeneous component image under the native quotient algebra map.'),
 ('tauceti','TauCeti.GradedAlgebra.gradedAlgebraGradeQuot','def','TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean',215,'Existing native GradedAlgebra on a quotient by a homogeneous two-sided ideal.'),
 ('tauceti','TauCeti.GradedAlgebra.mem_gradeQuot_iff','theorem','TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean',89,'Quotient component membership is existence of a homogeneous original representative.'),
 ('tauceti','TauCeti.GradedAlgebra.mk_mem_gradeQuot','theorem','TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean',96,'Homogeneous elements map to their corresponding quotient component.'),
 ('tauceti','TauCeti.GradedAlgebra.mul_mem_gradeQuot','theorem','TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean',137,'Existing quotient component products add degrees.'),
 ('mathlib','Ideal.homogeneous_span','theorem','Mathlib/RingTheory/GradedAlgebra/Homogeneous/Ideal.lean',156,'An ideal generated by homogeneous elements is homogeneous.'),
 ('mathlib','MvPolynomial.aeval_range','theorem','Mathlib/Algebra/MvPolynomial/Eval.lean',623,'The range of native polynomial evaluation is the algebra generated by its variable images.'),
 ('mathlib','AlgHom.map_adjoin','theorem','Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean',868,'An algebra homomorphism maps a generated algebra to the algebra generated by the images.'),
 ('mathlib','Algebra.adjoin_insert_zero','theorem','Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean',677,'Adjoining zero adds no algebra generator.'),
 ('mathlib','RingHom.Finite.of_surjective','theorem','Mathlib/RingTheory/Finiteness/Basic.lean',460,'A surjective ring homomorphism makes its target a finite module for the induced algebra action.'),
 ('mathlib','Module.Finite.trans','theorem','Mathlib/RingTheory/Finiteness/Basic.lean',366,'Finite generation is transitive along an actual scalar tower.')]
newbase=[dict(ref=lib+':'+name,kind=kind,module=module,provides=desc,checked=f'Actual complete statement, construction/proof and ambient hypotheses personally read on2026-10-04 by Codex — codex-7e92bd at '+('TauCeti f790474821cf4256814db967cb154e7af3d0c369'if lib=='tauceti'else'Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174')+f'; line{line}; exact declaration index checked. Existing general theory is imported, not replanned.')for lib,name,kind,module,line,desc in base]
refs={b['ref']for b in p['baseline']['declarations']};assert not refs&{b['ref']for b in newbase}
allids={n['id']for n in old['nodes']+new};refs|={b['ref']for b in newbase}
assert all(r in refs if r.startswith(('mathlib:','tauceti:'))else r in allids for n in new for r in n['prerequisites'])
p['nodes']+=new;p['baseline']['declarations']+=newbase
sr=json.loads((S/'SourceReading.json').read_text())[0];p['sources'].append(dict(id='HS-REMAINING-GENERATORS-00JV',title='Noetherian graded rings: reduction by a degree-one generator',authors='The Stacks Project Authors',edition='Currently displayed Section10.58,4October2026',url=sr['url'],sha256=sr['sha256'],readSections=[sr['scope']]))
frontier='Fourteen new nodes specialize the existing Tau quotient grading to S/(a), prove agreement with original scalar projections, and supply native graded actions on the actual kernel and cokernel using their already constructed scalar descent. The remaining-generator polynomial algebra map has coefficient/variable formulas, uniqueness, degree-one images and proved surjectivity when {a} together with the remaining family generates S. Both actual modules are finite over this remaining polynomial ring under their distinct inherited Noetherian/finite-module hypotheses. This supersedes only these graded-scalar and remaining-polynomial-finiteness omissions. Still supply the induction in a form closed under repeated graded kernels and quotients, arbitrary homogeneous polynomial action, finite homogeneous generating families and the zero-generator eventual-vanishing branch, then assemble the finite-length recurrence with explicit finite-difference polynomial, threshold and initial constant. The current adic specializations do not themselves constitute the recursive Hilbert–Serre theorem. Preserve the nonzero kernel correction and guarded length conversions. Polynomial existence, support/degree, completion, localization, associativity, intrinsic/ambient multiplicity, all eight stages and every routed-paper obligation remain open; all nodes unchecked.'
p['summary']+=' '+frontier;next(c for c in p['coverage']if c['stageId']==STAGE)['remaining'].append(frontier)
names=[n['declaration']for n in new]
assert p['nodes'][:452]==old['nodes'] and len(new)==14 and names==['TauCeti.HilbertSamuel.'+n for n in re.findall(r'^(?:def|lemma) (\w+)',(S/'New.lean').read_text(),re.M)]
plan=dict(newNames=names,newNodes=[n['id']for n in new],definingInstances=[],newBaseline=newbase,apiAdditions={},newTests=tests,frontier=frontier)
for name,x in [('Plan.json',plan),('NewNodes.json',new),('NewTests.json',tests),('Candidate.json',p),(STEM+'.json',p)]:put(name,x)
t='# Quotient graded actions and the remaining generators\n\n'+common+'\n\nThe existing graded-ring quotient package supplies the quotient decomposition once the principal ideal is proved homogeneous. Homogeneous representatives then identify the descended actions with the old actions on the actual kernel and cokernel. The polynomial map from the remaining generators is surjective because the removed generator becomes zero. Its finite algebra action and the inherited finite Q-module structures give finite generation over the remaining polynomial ring.\n\n'
for n in new:
 t+='## '+n['title']+'\n\n'+n['declaration']+'\n\n'+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof: '+' '.join(n['proofSteps'])+'\n\nPrerequisites: '+', '.join(n['prerequisites'])+'.\n\n'
 for a in n.get('api',[]):t+='API '+a['name']+': '+a['statement']+'\n\n'
t+='## Boundary tests\n\n'
for x in tests:t+=x['name']+' ('+x['kind']+'): '+x['statement']+'\n\n'
t+='## Required continuation\n\n'+frontier+'\n\nAll452 incoming whole nodes, source/version findings, fifteen gaps, two requests, thirteen planets and all earlier obligations remain unchanged. The original reader follows. The full Tau-importing suggested file remains uncompiled; isolated evidence replays the exact pinned quotient-grading source as well as the four previously authenticated Tau direct-sum declarations.\n\n---\n\n'
put('ReaderAddition.md',t);put('Reader.md',t+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(new),newAPI=5,newTests=8,baseline=len(p['baseline']['declarations']))))
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
put('Suggested.lean',t('TauImports.lean')+t('NewImports.lean')+t('Incoming.lean')+'\n'+t('NewAdmitted.lean'))
put('Canonical.lean',t('NewImports.lean')+t('CanonicalPrefix.lean')+'\n'+t('TauGradedQuotientCanonical.lean')+'\n'+t('NewAdmitted.lean'))
put('Audits.lean','\n'.join('#print axioms '+n for n in json.loads(t('Plan.json'))['newNames']+json.loads(t('TauGradedQuotientNames.json')))+'\n')
put('Native.lean',t('NewImports.lean')+t('NativePrefix.lean')+'\n'+t('TauGradedQuotient.lean')+'\n'+t('New.lean')+'\n'+t('NewTests.lean')+'\n'+t('Audits.lean'))
```

## Script: handoff.py

```python
"""Write the mathematical boundary, actual checks and exact reproducible helper fences."""
from pathlib import Path
import json,hashlib
S=Path(__file__).resolve().parent;d=lambda n:json.loads((S/n).read_text());v=d('Verification.json');g=v['graph'];p=d('Candidate.json');plan=d('Plan.json')
t='''# Quotient graded actions and remaining generators — checkpoint

Codex — codex-7e92bd. Refs #551. Partial. All466 nodes remain unchecked. The reserved intrinsic/ambient Hilbert–Samuel multiplicity key, eight stages, fifteen gaps and two requests remain required.

Fourteen new nodes (one construction and thirteen lemmas) supply the quotient scalar grading and reduction to the remaining polynomial generators. All452 incoming whole nodes are unchanged. The polynomial-map construction has five API entries and five tests; three further typed tests check the quotient coordinates and repeated actions on kernel/cokernel components. Fifteen existing Mathlib/Tau declarations are added as baseline imports. The thirteen planets, original sources, E1 finding, requests and whole gap objects are preserved.

For arbitrary commutative A, ideal q and A-module M, use the existing Rees quotients S=gr_q(A), L=gr_q(M), actual a∈S_1, Q=S/(a), K=ker(mu_a) and C=L/range(mu_a). The principal ideal (a) is homogeneous by the native span theorem. Tau Ceti already provides gradeQuot and gradedAlgebraGradeQuot: these are imported, never replanned. The actual quotient coordinate of [b] is [pi_n(b)] by the existing direct-sum map comparison. A homogeneous quotient scalar has a homogeneous original representative, and the inherited representative-action identities identify its Q action with the old S action. Thus the actual K and C families satisfy native SetLike.GradedSMul, and their existing decomposition/projection fixes every homogeneous scalar product.

For any family b:J→S_1, the new native A/q-algebra map F:(A/q)[X_j]→Q evaluates X_j to [b_j]. Its coefficient and variable formulas, uniqueness and degree-one image are separate nodes. If {a} together with (b_j) generates S, F is surjective: map the original adjoin equality through the quotient, remove the now-zero generator a, and identify the remaining adjoin with the polynomial evaluation range. For J=Fin r this is the required reduction from r+1 designated generators to r; minimality, nonzero generators and nonempty J are not assumed.

The original Q-module finiteness theorems and the proved surjectivity then make K and C finite over the remaining polynomial ring via the actual Module.compHom action and scalar tower. Kernel finiteness assumes L is Noetherian as an S-module. Cokernel finiteness requires only that L be finite over S. No regularity or injectivity of multiplication by a, reducedness or freeness is introduced. Finiteness of J is needed when using a finite generator count in the later induction, not for these individual map/finiteness statements.

Eight typed examples check coefficient-plus-variable evaluation; killing a repeated removed generator; a surjective empty-variable map when a alone generates; q=A and the zero coefficient ring; a surviving nonzero square-zero degree-one variable over Z/4,q=(2),a=0; two successive homogeneous quotient scalar actions and their kernel/cokernel coordinates; and mixed degree-zero/one scalar representatives with vanishing degree-two quotient coordinate. The nilpotent example rejects both a reduced-quotient assumption and an accidental quotient that kills every positive degree.

## Reading and provenance

The whole55002-character issue was read in four complete slices before claim5980112144 and again after bot5980113613 confirmed that exact numeric claim. ClaimReceipt.json records the unchanged body hash and complete bounds. The current reviewed R03.3 audit, reserved key, both requests, whole relevant gaps4–8 and complete R03.3 coverage frontier were freshly read before planning.

Own PR6064 at head236110125574505f05d1ad4ede8ba9ddd82d4f03 was recovered through actual public HTTP:66artifacts,10helpers,four final files and all four pinned Tau direct-sum source declarations. Both actual immutable recovered verifiers reproduced their archived mathematical/publication reports byte-for-byte. The current four deliverables match that checkpoint. Its complete recovery helper, verifier, immutable reader and graph checker were inspected. The full incoming packet and3877-line native proof prefix are authenticated and retained, not claimed to have received a new complete manual proof audit.

Own6064 Reading/InputGuard records are authenticated against manifest3779c3e71b30898e174ed35a4811447ba8e849f2d74ba840580e8186067f6da1. Nested original own6051 and6037 manifest/reading/input scopes are authenticated too. Of the29original controls,24are unchanged; the four owned files and Scheme Foundations changed. Current SFpacket bytes match own6070; its SF.0 final continuation and complete empty requests were freshly read. The whole relevant current link/overlap/examined entries and touching restructure rows were read:57files,123entries. All85current controls are guarded. Peer reading claims are not reassigned to this session.

WORKERS, PROTOCOL0–6 and12–15, complete expansion PROTOCOL and complete UPSTREAM_GUIDE were freshly reread. Other unchanged binding/upstream-roadmap/accepted RS08 scopes retain their original authenticated own attribution. Reading.json records exact consumed native proof ranges and pinned source ranges. Complete actual native statements, proof/construction and hypotheses were read before citing each new baseline import. The full223-line Tau quotient-grading source was personally read and fetched byte-for-byte at its exact pin. Bounded name searches cover both source trees and current packets. GitHub search confirms the existing quotient design follows open Mathlib PR36501; the Zulip search yielded no additional exact quotient design result. These searches are not semantic absence proofs.

The complete currently displayed Stacks Section10.58, all ten numbered statements/proofs and all five comments, was read at https://stacks.math.columbia.edu/tag/00JV. SourceReading.json binds actual fetched bytes/hash/time. The native action and generator lemmas are authored deductions motivated by that source. The retained elementary length-valued kernel/cokernel induction differs from its K0 proof and keeps the nonzero kernel correction. Linked proofs/history, inherited E1 and every routed source are not newly recursively audited here.

## Compilation boundary

**The full Tau-importing Suggested.lean is uncompiled.** The available Tau build is at cf386627e9176a3827c1a5fe804989fd94a4d216, not the required f790474821cf4256814db967cb154e7af3d0c369, and lacks both Internal.olean and the graded quotient olean. No library was built.

The isolated Native.lean and Canonical.lean files retain their exact authenticated incoming prefixes, including four exact existing Tau direct-sum declarations. Native additionally replays the unchanged complete namespace block of TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean. Canonical replays identical declarations and proofs, omitting only the unused universe u/v/w header that conflicts with the inherited file; this exact one-line normalization is mechanically verified. The public recovery fetches both pinned source files and verifies every exact block. All twelve public named declarations of the quotient package, the four old source declarations and all fourteen new declarations are covered by the native axiom audits. The package's private supporting proof and defining instance remain unchanged and are checked through their use. Source replay is not a compiled Tau-library import claim.

The fourteen new declaration headers and eight test headers match the admitted projection exactly, including all nested let/letI bindings and conclusions. The actual polynomial-map data are retained; new lemma/test proofs are admitted only in the canonical plan. Final native evidence compiles the complete source without importing the disposable prototype olean. All proofs use only propext,Classical.choice and Quot.sound, with no sorryAx.

Checks use the existing Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Runs are serial after a fresh20GiB guard, one thread,8192MiB cap and1200-second timeout. No Lake setup/update/cache, library build or language server.

'''
for name,r in v['compilation'].items():
 t+=f"- {name}: {r['lines']} lines,{r['examples']} examples,exit{r['exitStatus']},{r['warnings']} warnings,{r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available,{r['elapsedSeconds']} seconds,peak{r['maxRssKiB']}KiB. Source SHA256 `{r['sourceSha256']}`; diagnostic SHA256 `{r['logSha256']}`.\n"
b=(S/'Suggested.lean').read_bytes();t+=f"\nSuggested.lean: {len(b.splitlines())} lines,uncompiled; SHA256 `{hashlib.sha256(b).hexdigest()}`. Native has282clean audits and no warnings/errors/admissions. Canonical has879expected admission warnings only.\n"
t+=f'''
## Immutable validation

The actual indexed checker reports466nodes (11definitions,66constructions,16theorems,373lemmas),359API entries,295recognized tests(381raw references),13planets and455baseline declarations, with no errors or warnings. Actual intake authorization/file checks and source-issue/version checks pass. The required direct check_blueprint.py invocation passes with the exact declarations.tsv. Every452incoming whole node and prior API/test, every source/version/E1 record, fifteen gap objects and both requests remain unchanged.

Mathematical base `{v['mathematicalBase']}`; publication base `{v['immutableBase']}`. Both actual immutable verifier outputs are retained. All85input controls are guarded; PublicationChanges.json contains {len(v['reviewedPublicationChanges'])} reviewed changes. The four original owned files and queue contract agree at both bases. Declaration index SHA256 `{v['indexSha256']}`.

Stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']},own DAG {g['ownDAG']['vertices']}/{g['ownDAG']['edges']},combined DAG {g['combinedDAG']['vertices']}/{g['combinedDAG']['edges']}; all acyclic and no unresolved owned dependencies. All{g['acceptedRestructurePairs']}accepted restructure pairs and{g['requiredStagePairsReachable']}of{g['requiredStagePairs']}required stage pairs remain reachable. The inherited LocalFieldsRamification layer0→R03.4 missing path remains in its unchanged gap/request. Complete foreign roadmap/stage and stage-edge objects and53sibling declarations remain preserved.

## Resume

{plan['frontier']}

The next proof should expose an induction statement for arbitrary internally graded modules that remains applicable after taking a kernel and quotient. Reuse the existing generic Tau quotient grading and current actual scalar maps. Prove homogeneous polynomial action and finite homogeneous generating-family bounds, discharge the zero-generator eventual-vanishing case, and assemble the signed finite-length recurrence into an explicit rational polynomial with threshold and restored initial constant. A recurrence, grading or ordinary finite-generation theorem does not itself prove eventual polynomial existence or support-dimension equality. Preserve both intrinsic and ambient multiplicity conventions and every routed obligation.
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
assert len(old['nodes'])==452 and len(p['nodes'])==466 and set(p)==set(old)
assert p['nodes'][:452]==old['nodes']
assert plan['apiAdditions']=={}
assert p['nodes'][452:]==data('NewNodes.json')
assert [n['id']for n in p['nodes'][452:]]==plan['newNodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']and len(p['baseline']['declarations'])==455
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
assert txt('Suggested.lean')==txt('TauImports.lean')+txt('NewImports.lean')+txt('Incoming.lean')+'\n'+txt('NewAdmitted.lean')
assert txt('Canonical.lean')==txt('NewImports.lean')+txt('CanonicalPrefix.lean')+'\n'+txt('TauGradedQuotientCanonical.lean')+'\n'+txt('NewAdmitted.lean')
assert txt('Native.lean')==txt('NewImports.lean')+txt('NativePrefix.lean')+'\n'+txt('TauGradedQuotient.lean')+'\n'+txt('New.lean')+'\n'+txt('NewTests.lean')+'\n'+txt('Audits.lean')
assert not re.search(r'\b(?:sorry|admit|axiom)\b',txt('Native.lean'))
assert 'import PrototypeBase' not in txt('Native.lean') and 'import PrototypeBase' not in txt('Canonical.lean')
prev=data('PreviousRecovery.json');manifest=data('PreviousManifest.json')
assert prev['head']=='236110125574505f05d1ad4ede8ba9ddd82d4f03'and prev['artifactsVerified']==66 and prev['archivedHelpersVerified']==10
assert sha((S/'PreviousManifest.json').read_bytes())=='3779c3e71b30898e174ed35a4811447ba8e849f2d74ba840580e8186067f6da1'
for original,current in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean'),('Verification.json','PreviousVerification.json'),('MathematicalVerification.json','PreviousMathematicalVerification.json')]:assert manifest[original]['sha256']==sha((S/current).read_bytes())
for path,n in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==prev['publicDeliverables'][path]
assert (S/'IncomingPublicationVerification-replayed.json').read_bytes()==(S/'PreviousVerification.json').read_bytes()
assert (S/'IncomingMathematicalVerification-replayed.json').read_bytes()==(S/'PreviousMathematicalVerification.json').read_bytes()
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='3779c3e71b30898e174ed35a4811447ba8e849f2d74ba840580e8186067f6da1'
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('Candidate.json','OwnPreviousCandidate.json'),('OwnPreviousManifest.json','OwnInherited6051Manifest.json'),('OwnPreviousReading.json','OwnInherited6051Reading.json'),('OwnPreviousInputGuard.json','OwnInherited6051InputGuard.json'),('OwnInheritedManifest.json','OwnInherited6037Manifest.json'),('OwnInheritedReading.json','OwnInherited6037Reading.json'),('OwnInheritedInputGuard.json','OwnInherited6037InputGuard.json'),('OwnInheritedReadingChain.json','OwnInherited6037ReadingChain.json')]:assert om[original]['sha256']==sha((S/current).read_bytes())
middle=data('OwnInherited6051Manifest.json')
assert sha((S/'OwnInherited6051Manifest.json').read_bytes())=='6c4229ebc4efa08e8c03ff13742dbd82f0e2f05299b0825a774142b9fc3c3217'
for original,current in [('OwnPreviousManifest.json','OwnInherited6037Manifest.json'),('OwnPreviousReading.json','OwnInherited6037Reading.json'),('OwnPreviousInputGuard.json','OwnInherited6037InputGuard.json'),('OwnPreviousReadingChain.json','OwnInherited6037ReadingChain.json')]:assert middle[original]['sha256']==sha((S/current).read_bytes())
im=data('OwnInherited6037Manifest.json')
assert sha((S/'OwnInherited6037Manifest.json').read_bytes())=='518be554db21e4e42d3bcf5374ed4d0d9bfdf7ee3379b56dc6b4cdfffdfbc318'
for original,current in [('Reading.json','OwnInherited6037Reading.json'),('InputGuard.json','OwnInherited6037InputGuard.json'),('OwnPreviousReadingChain.json','OwnInherited6037ReadingChain.json')]:assert im[original]['sha256']==sha((S/current).read_bytes())
prior={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==29 and sum(g['unchanged']for g in reuse)==24
for g in reuse:
 assert g['before']==prior[g['path']]and g['after']==sha(blob(MATH,g['path']))
 assert g['unchanged']==(g['before']==g['after'])
assert data('ClaimReceipt.json')['claim']==5980112144 and data('ClaimReceipt.json')['confirmation']==5980113613
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
assert {**nh,**nt}==ch and len(nh)==14 and len(nt)==8
assert 'MvPolynomial.X' in nt['example#0'] and '≠ 0' in nt['example#4'] and '^ 2 = 0' in nt['example#4']
assert 'i+(j+n)' in nt['example#5'] and 'i+(j+n)' in nt['example#6']
assert set(plan['newNames'])=={NS+n for n in nh}
assert {n['declaration']for n in p['nodes'][452:]}|set(plan['definingInstances'])==set(plan['newNames'])
assert sum(len(n.get('api',[]))for n in p['nodes'][452:])==5
assert sum(len(n.get('tests',[]))for n in p['nodes'][452:])==8
assert len({t['name']for n in p['nodes'][452:]for t in n.get('tests',[])})==8
assert all(len(n['tests'])>=3 and len(n['api'])>=3 for n in p['nodes'][452:]if n['kind']in ['definition','construction'])
assert{t['name']for t in data('NewTests.json')}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
for n in p['nodes'][452:]:assert n['declaration']in txt('Reader.md')and n['statement']in txt('Reader.md')
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
qr=data('TauGradedQuotientReceipt.json')
assert qr['pin']==tr['pin'] and qr['fileSha256']==qr['publicFetchedSha256']=='ad945c4225f5bf968548405880353d68eb7921d4fc4b8cc45756029035a9dcc5'
assert sha((S/'TauGradedQuotient.lean').read_bytes())==qr['blockSha256']
assert txt('TauGradedQuotient.lean').count('universe u v w\n')==1
assert txt('TauGradedQuotientCanonical.lean')==txt('TauGradedQuotient.lean').replace('universe u v w\n','')
assert headers(txt('TauGradedQuotient.lean'))==headers(txt('TauGradedQuotientCanonical.lean'))
assert sha((S/'TauGradedQuotientCanonical.lean').read_bytes())==qr['canonicalNormalization']['canonicalSha256']
assert len(data('TauGradedQuotientNames.json'))==12
assert txt('TauImports.lean')=='import TauCeti.RingTheory.GradedAlgebra.Homogeneous.Quotient\n'
for row in data('TouchingLinks.json')['files']:assert sha(blob(MATH,row['path']))==row['sha256']
compilation={}
for name,warnings,examples,audits in [('Native.lean',0,99,282),('Canonical.lean',879,360,0)]:
 rec=data(name[:-5]+'.receipt.json');log=txt(name[:-5]+'.log')
 assert rec['exitStatus']==0 and rec['availableGiBBefore']>=20 and rec['elapsedSeconds']<1200
 assert rec['sourceSha256']==sha((S/name).read_bytes())and rec['logSha256']==sha(log.encode())
 assert ': error'not in log and log.count('warning:')==log.count('warning: declaration uses')==warnings
 assert len(re.findall(r'^example\b',txt(name),re.M))==examples
 a=re.findall(r"'([^']+)' depends on axioms:\s*\[([^]]*)\]",log);assert len(a)==audits
 assert 'sorryAx'not in log and all(set(x.strip()for x in v.replace('\n',' ').split(',')if x.strip())<={'propext','Classical.choice','Quot.sound'}for _,v in a)
 if name=='Native.lean':assert set(plan['newNames'])|set(data('TauGradedQuotientNames.json'))|set(rr['declarations'])|{'TauCeti.DirectSum.map_decompose_shift'}<={n for n,_ in a}
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
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,preservedWholeNodes=452,preservedContracts=452,newNodes=14,newMathematicalDeclarations=14,definingInstances=0,newAPI=5,newTests=8,matchedNewHeaders=14,matchedTestHeaders=8,rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,inputGuards=len(data('InputGuard.json')),reviewedPublicationChanges=changes,indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullSuggestedCompiled=False,sourceReplayBoundary=data('SourceBoundary.json'),tauSourceReplay=tr,tauRestrictionSourceReplay=rr,tauQuotientSourceReplay=qr,LeanExecuted=False),indent=2))
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
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean','Prototype.lean','Sketch.lean','PrototypeBase.lean','Probe.lean'}
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
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in ([out]+libs if name in {'Prototype.lean','Probe.lean'} else libs))
result=subprocess.run(['/usr/bin/time','-v','stdbuf','-oL','-eL','timeout','1200',str(lean),'-j','1','-M','8192',*(['-o',str(out/'PrototypeBase.olean')] if name=='PrototypeBase.lean' else []),str(out/name)],env=env,cwd=out)
sys.exit(result.returncode)
```

## Script: runcheck.py

```python
"""Serial checked replay with bounded diagnostics and apply_patch receipt writes."""
from pathlib import Path
import subprocess,sys,hashlib,json,re,time
S=Path(sys.argv[1]).resolve();name=sys.argv[4];prefix=name[:-5]
start=time.monotonic()
r=subprocess.Popen([sys.executable,str(S/'compile.py')]+sys.argv[1:],text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,bufsize=1)
lines=[]
for line in r.stdout:
 lines.append(line)
 if 'error:' in line or line.startswith('Test completed: ') or (line.startswith('TauCeti.SchemeFoundations.IdealPullback.') and 'depends on axioms' not in line):
  print(line.replace(str(S),'<SCRATCH>').rstrip(),flush=True)
r.wait();raw=''.join(lines)

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
STEM='DeformationAndDerivedPatchingAlgebra--P7'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
New.lean NewTests.lean NewImports.lean TauImports.lean Audits.lean NewAdmitted.lean
TauGradedQuotient.lean TauGradedQuotientCanonical.lean TauGradedQuotientReceipt.json TauGradedQuotientNames.json TouchingLinks.json SupplierScope.json
TauShift.lean TauShiftReceipt.json TauRestriction.lean TauRestrictionReceipt.json SourceBoundary.json Candidate.json Reader.md ReaderAddition.md Suggested.lean
Handoff.md HandoffBase.md ClaimReceipt.json Reading.json SourceReading.json OwnPreviousReading.json
OwnPreviousManifest.json OwnPreviousInputGuard.json OwnPreviousCandidate.json
OwnInherited6051Reading.json OwnInherited6051Manifest.json OwnInherited6051InputGuard.json
OwnInherited6037Reading.json OwnInherited6037Manifest.json OwnInherited6037InputGuard.json OwnInherited6037ReadingChain.json OwnReadingReuse.json Search.json InputGuard.json PublicationChanges.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED ADIC REMAINING GENERATORS PAYLOAD\n'+pb+b'END ARCHIVED ADIC REMAINING GENERATORS PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated adic remaining-generator evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED ADIC REMAINING GENERATORS PAYLOAD\\n',1)[1].split('END ARCHIVED ADIC REMAINING GENERATORS PAYLOAD -/',1)[0].encode()
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
qr=json.loads((S/'TauGradedQuotientReceipt.json').read_text())
assert qr['url']=='https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean'
with urllib.request.urlopen(qr['url'],timeout=30)as r:qsource=r.read()
assert sha(qsource)==qr['fileSha256']==qr['publicFetchedSha256']
qblock='namespace TauCeti\\n'+qsource.decode().split('namespace TauCeti\\n',1)[1]
assert sha(qblock.encode())==qr['blockSha256'] and qblock==(S/'TauGradedQuotient.lean').read_text()
assert (S/'TauGradedQuotientCanonical.lean').read_text()==qblock.replace('universe u v w\\n','')
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
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),pinnedTauSourceVerified=tr['fileSha256'],tauRestrictionBlockVerified=rr['blockSha256'],tauGradedQuotientBlockVerified=qr['blockSha256'],LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\\n');print(json.dumps(receipt,indent=2))
'''
 for key,val in [('__ARCHIVE__',archive),('__MANIFEST__',p['manifestSha256']),('__PAYLOAD__',p['payloadSha256']),('__EXPECTED__',expected)]:code=code.replace(key,repr(val))
 compile(code,'recover.py','exec');(S/'recover.py').write_text(code)
 prose=f'''
## Public recovery and replay

Archive commit `{archive}` is an ancestor changing only this issue's four named deliverable paths. Its {p['artifacts']} inert artifacts include all {p['helpers']} authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `{p['manifestSha256']}`; payload SHA256 `{p['payloadSha256']}`. The final suggested file has no archive payload and contains the full unchecked plan with its native Tau Ceti import.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, fetches the existing pinned Tau source and verifies all four direct-sum declarations and the unchanged complete graded-quotient namespace, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the mathematical base to reproduce MathematicalVerification.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the admitted Mathlib-only evidence projection with the exact pinned Tau source declarations replayed; Suggested.lean imports the Tau library and is uncompiled. Native.lean replays the same four direct-sum declarations and exact graded-quotient namespace from source and proves the new contracts without admissions. No exact-pin Tau compiled-import claim is made. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

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

Archive commit `c8c8839ca31e6fd534207a0a2c62fa72722e010c` is an ancestor changing only this issue's four named deliverable paths. Its 77 inert artifacts include all 10 authoring, projection, handoff, package, verification, graph and compilation helpers. Manifest SHA256 `ace3ce5cafcc7e4445d86377a70206b82f4638cdcc49c4a91a7ae37c52ed71c3`; payload SHA256 `82df872fad6d83d54fe3468a5d40dc9ad28b01d5aeb08c6b981a658f3e116789`. The final suggested file has no archive payload and contains the full unchecked plan with its native Tau Ceti import.

Save the Python fence below as recover.py and run `python3 recover.py REPLAY_DIR FULL_PR_HEAD_SHA`. It fetches the immutable public archive and four final deliverables, authenticates every hash, size and line count, fetches the existing pinned Tau source and verifies all four direct-sum declarations and the unchanged complete graded-quotient namespace, binds this handoff's mathematical prefix and checks its own code against the public handoff. Inspect the recovered helpers. From an existing repository checkout containing both recorded bases, run `PYTHONDONTWRITEBYTECODE=1 python3 REPLAY_DIR/verify.py REPLAY_DIR DECLARATION_INDEX`. Use the exact prescribed declarations.tsv and place REPLAY_DIR outside the checkout. Its output should equal Verification.json. Set ROOT_ACTION_VALIDATE_BASE to the mathematical base to reproduce MathematicalVerification.json. The verifier executes the actual immutable checker, intake and atlas assembler without executing Lean or creating a repository snapshot. It checks the final public handoff as well as all archived artifacts.

Optional serial proof replay with an existing exact Mathlib build: `python3 REPLAY_DIR/runcheck.py REPLAY_DIR MATHLIB_CHECKOUT LEAN_BINARY Native.lean`, followed by the corresponding Canonical.lean command only after completion. The runner checks pins, tracked cleanliness, compiled dependencies, compiler version, memory≥20GiB and timeout. Canonical.lean is the admitted Mathlib-only evidence projection with the exact pinned Tau source declarations replayed; Suggested.lean imports the Tau library and is uncompiled. Native.lean replays the same four direct-sum declarations and exact graded-quotient namespace from source and proves the new contracts without admissions. No exact-pin Tau compiled-import claim is made. Recorded diagnostic hashes authenticate the original runs; timing and resource statistics vary on replay.

Actual public HTTP recovery and both immutable verifier reports at the final head are checked before opening the PR. Disposable scratch is removed after submission; this handoff contains all recovery references and exact archived helper fences.

## Script: recover.py

```python
"""Recover public authenticated adic remaining-generator evidence; never executes Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
RID='DeformationAndDerivedPatchingAlgebra--P7'
ARCHIVE='c8c8839ca31e6fd534207a0a2c62fa72722e010c'
MANIFEST_SHA='ace3ce5cafcc7e4445d86377a70206b82f4638cdcc49c4a91a7ae37c52ed71c3'
PAYLOAD_SHA='82df872fad6d83d54fe3468a5d40dc9ad28b01d5aeb08c6b981a658f3e116789'
EXPECTED={'packets': 'ad190eb71b5f5b566840673fc75d99196cd7a7b008b6e5a7340c617ae92815aa', 'readmes': '4b034597d9fcc5160b0b2c0c52e27a2535f6e5c0ab38e19c5c16ce6e3b50d55d', 'suggested': '69624aa9b8d269c378681f28c58e3f5b7d08eca5d6582485af98e23651b35a62'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=30)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+RID+'.lean').decode()
pb=raw.split('/- BEGIN ARCHIVED ADIC REMAINING GENERATORS PAYLOAD\n',1)[1].split('END ARCHIVED ADIC REMAINING GENERATORS PAYLOAD -/',1)[0].encode()
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
qr=json.loads((S/'TauGradedQuotientReceipt.json').read_text())
assert qr['url']=='https://raw.githubusercontent.com/TauCetiProject/TauCeti/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean'
with urllib.request.urlopen(qr['url'],timeout=30)as r:qsource=r.read()
assert sha(qsource)==qr['fileSha256']==qr['publicFetchedSha256']
qblock='namespace TauCeti\n'+qsource.decode().split('namespace TauCeti\n',1)[1]
assert sha(qblock.encode())==qr['blockSha256'] and qblock==(S/'TauGradedQuotient.lean').read_text()
assert (S/'TauGradedQuotientCanonical.lean').read_text()==qblock.replace('universe u v w\n','')
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
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),archivedHelpersVerified=sum(n.endswith('.py')for n in meta),publicDeliverables=public,recoverySha256=sha(code.encode()),pinnedTauSourceVerified=tr['fileSha256'],tauRestrictionBlockVerified=rr['blockSha256'],tauGradedQuotientBlockVerified=qr['blockSha256'],LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
