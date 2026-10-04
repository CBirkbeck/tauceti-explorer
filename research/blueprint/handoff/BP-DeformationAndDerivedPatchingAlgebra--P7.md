# Generic graded-module induction inputs — checkpoint

Codex — codex-7e92bd. Refs #551. Partial. All478 nodes remain unchecked. The reserved intrinsic/ambient Hilbert–Samuel multiplicity key, all eight stages, fifteen gaps and two requests remain required.

Twelve new lemma nodes and eight typed tests supply generic homogeneous generation, polynomial degree actions and the zero-variable Hilbert–Serre induction base. All466 incoming whole nodes and their API/test contracts remain unchanged. Five native Mathlib declarations are newly recorded as baseline imports. The thirteen planets, original source/version/E1 records and whole gap/request objects are retained. No new carrier or construction is introduced.

For arbitrary commutative rings A,S and an S-finite module M with an internal grading by A-submodules G_n, split a finite S-spanning set into its finitely supported homogeneous coordinates. The resulting finite set still S-spans M. Choose a degree for each member and take one plus their finite supremum to obtain an explicit bound B. This splitting theorem needs neither a grading on S nor compatibility between its action and the A action.

The next vanishing criterion requires a bounded A-spanning family. For n≥B, the degree-n projection kills each generator, hence every element by A-linear span induction. Since it fixes G_n, that component is zero. Thus A-finite internally graded modules have eventually zero components and native extended lengths. This is a natural-degree specialization with an explicit generator bound; Tau Ceti already has general finite nonzero-component support and an integer-indexed InternalGrading object. Neither is replanned. Finiteness over a positive-variable polynomial ring is not silently changed into finiteness over A.

For an actual A[X_j]-module M, assume each variable sends G_n into G_(n+1). Variable powers add their exponent to the degree, without needing a scalar tower for that assertion. When the coefficient and polynomial actions satisfy the native IsScalarTower law, monomials add their total exponent degree, including zero and nilpotent coefficients. The pinned homogeneous-polynomial induction then proves that every homogeneous p of degree k sends G_n into G_(k+n), and packages this in native SetLike.GradedSMul. These degree-action lemmas need no decomposition, finite generation, finite variable set, Noetherianity, regularity or reducedness.

When the variable type is empty, the native polynomial algebra equivalence with A makes a polynomial-finite module A-finite via the actual scalar tower. Its components and lengths therefore eventually vanish. The final base-case statement exhibits the actual zero rational polynomial and a threshold, together with length≠infinity before using toNat. It assumes no eventual-polynomial premise. The positive-variable induction and generic finite-length component argument are still required.

Eight tests cover a finite homogeneous family for the polynomial ring over Z/4 as a module over itself; Z/4 concentrated in degree7, where degree7 is nonzero but all n≥8 vanish; the empty-variable base over nonreduced Z/4; the nonzero square-zero polynomial2X^3 acting on X in degree4; zero polynomials in arbitrary prescribed degrees; the failure of1+X to be homogeneous of degree1; the exponent-zero action; and a zero module with the empty spanning set and bound0. The delayed-tail and nilpotent tests reject premature threshold0, reducedness or a polynomial action that kills all nilpotents.

## Reading and provenance

The whole55002-character issue was personally read in three complete untruncated slices before claim5982717161 and after bot5982718359 confirmed that exact numeric claim. ClaimReceipt.json binds the body hash and bounds. The earlier truncated display was not counted. The current reviewed R03.3 AUDIT17 row and metadata, reserved key, both requests, whole relevant gaps4–8 and entire R03.3 continuation were personally read before planning.

Own PR6074 at head ebc233c7213d1bd1780192806fa125c1928d7618 was recovered through actual public HTTP:77artifacts,10helpers,four final files and both pinned Tau source files with exact replayed blocks. Both actual recovered immutable verifiers reproduced their archived mathematical/publication reports byte-for-byte. The current four deliverables match that checkpoint. Its complete recovery helper, verifier, immutable reader and graph checker were inspected. The full incoming packet and4402-line native prefix are authenticated and retained, not claimed to have received a new full manual proof audit.

Own6074 Reading/InputGuard and nested original own6064/6051/6037 records are authenticated against their manifest chain. All four Reading records and the6037 ReadingChain were personally reread. Of85controls80are unchanged; the four owned files and Scheme Foundations changed. Current SFpacket bytes equal own6083; its final two SF.0 continuation paragraphs and complete empty requests were freshly read. A fresh structured name-hit scan found no new touching link files beyond the57unchanged files and123entries whose exact original full-entry scope was read in own6074. No peer reading claim is reassigned to this session.

Whole WORKERS and PROTOCOL3–4,12–15 were freshly read here; additional unchanged binding scopes retain their exact authenticated own provenance. Reading.json separates fresh source/proof ranges from prior scopes. Complete pinned Mathlib graded-algebra FiniteType and Tau internally graded-module source were read to avoid duplicating their objects. The new baseline declarations' complete statements, proofs/constructions and ambient hypotheses were read at the prescribed pin. Exact proposed-name searches are bounded negative checks, not semantic absence proofs.

The complete currently displayed Stacks Section10.58, all ten numbered statements/proofs and five comments, was read at https://stacks.math.columbia.edu/tag/00JV. SourceReading.json binds actual fetched bytes/hash/time. The native lemmas are authored deductions motivated by that source. The retained length-valued kernel/cokernel route differs from its K0 argument and must keep the nonzero kernel correction. Linked proofs/history, inherited E1 and all routed sources are not newly recursively audited here.

## Compilation boundary

**The full Tau-importing Suggested.lean is uncompiled.** The available Tau build is at cf386627e9176a3827c1a5fe804989fd94a4d216, not f790474821cf4256814db967cb154e7af3d0c369, and lacks both Internal.olean and the graded quotient olean. No library was built.

Native.lean and Canonical.lean preserve their exact authenticated incoming prefixes, already containing four pinned Tau direct-sum declarations and the complete graded-quotient namespace. These source blocks are not appended again. The inherited canonical block omits precisely the unused universe u/v/w header; its exact normalization remains verified. Public recovery fetches both pinned source files and verifies the original exact blocks. Source replay is not a compiled Tau-import claim.

The new twelve lemma headers and eight example headers match their admitted projection exactly; section hypotheses, including include hX and the scalar-tower section boundary, are retained. The complete native evidence imports no disposable prototype olean and has no admissions. Its twelve new declarations and all inherited audits depend only on propext,Classical.choice and Quot.sound. Canonical is the isolated admitted planning projection.

Checks use the existing Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Runs are serial after a fresh20GiB guard, one thread,8192MiB cap and1200-second timeout. No Lake setup/update/cache, library build or language server.

- Native.lean: 4682 lines,107 examples,exit0,0 warnings,294 axiom audits; 41GiB available,267.7 seconds,peak3740988KiB. Source SHA256 `2d6f0706f84198ab3d7bae397a084a7d66f0c2655f74148c790963851284d931`; diagnostic SHA256 `6fae3ffdaa2860bc4e937eb059d757b46d3eb5936b7296d82386c82e0324fc40`.
- Canonical.lean: 6934 lines,368 examples,exit0,899 warnings,0 axiom audits; 41GiB available,162.35 seconds,peak3919704KiB. Source SHA256 `182d248a3c138871cf72eb9584b2aecd013de9ddecb119e9d4f0991a144e10b8`; diagnostic SHA256 `b4cfb8f268934bbb0b4c0589a326c505f86a06e9fb6d2752f50572f851b07099`.

Suggested.lean: 6690 lines,uncompiled; SHA256 `39990c5a0a0d09b3ad74218bdfe81cf6752c373971f8c6b9c62b802eeb7ccf79`. Native has294clean audits and no warnings/errors/admissions. Canonical has899expected admission warnings only.

## Immutable validation

The actual indexed checker reports478nodes,359API entries,295recognized tests(389raw references),13planets and460baseline declarations, with no errors or warnings. Actual intake authorization/file checks and source-issue/version checks pass. The required direct check_blueprint.py invocation passes with the exact declarations.tsv. Every466incoming whole node and prior API/test, every source/version/E1 record, fifteen gap objects and both requests remain unchanged.

Mathematical base `60f72e03c2fd2b6d16c449a05f711443e51969ea`; publication base `d1d8777829517a4b36887c562340ef571c774ce1`. Both actual immutable verifier outputs are retained. All85input controls are guarded; PublicationChanges.json records 0 reviewed changes. The original four owned files and queue contract agree at both bases. Declaration index SHA256 `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`.

Stage DAG 3003/8623,own DAG 478/810,combined DAG 3469/9912; all acyclic and no unresolved owned dependencies. All65accepted restructure pairs and12of13required stage pairs remain reachable. The inherited LocalFieldsRamification layer0→R03.4 missing path remains in its unchanged gap/request. Complete foreign roadmap/stage and stage-edge objects and53sibling declarations remain preserved.

## Resume

Twelve generic lemma nodes now supply finite homogeneous S-generators for any internally A-graded finite S-module, a bound on their degrees, explicit component vanishing from a bounded A-spanning set, actual homogeneous polynomial degree actions from degree-one variable shifts, and the empty-variable induction base with eventually zero native finite lengths and an actual zero rational polynomial. All use existing carriers. This resolves only these generic input/base-case omissions; it does not derive coefficient-module finiteness from polynomial-module finiteness when variables remain. Next construct generic graded kernels/cokernels of the last-variable action, their remaining-polynomial module structures and finite homogeneous pieces, with a recursive induction hypothesis that applies to both; then assemble the guarded signed finite-length recurrence into an explicit rational polynomial, threshold and initial constant. Preserve the nonzero kernel correction. Positive-variable polynomial existence, support/dimension degree equality, completion, localization, associativity, both intrinsic and ambient multiplicity conventions, all eight stages and every routed obligation remain open. All nodes unchecked.

Start with arbitrary internally A-graded finite modules over a polynomial ring with finitely many degree-one variables. Construct the actual last-variable kernel and cokernel as graded modules over the remaining polynomial ring, using the existing native quotient/restriction machinery and the current adic specializations as checked guides. Prove their finiteness and finite component lengths in the required Artinian/Noetherian setting. The present generic homogeneous-action theorem and generator bounds can be reused at every stage, and the zero-variable polynomial base is now available. Then apply induction to both actual modules and integrate the signed finite-length recurrence with threshold and initial constant. Do not assume regularity of the removed variable or erase its kernel term. Support-dimension equality and the general Hilbert–Samuel multiplicity theory remain separate obligations.

## Script: author.py

```python
"""Generic graded-module induction inputs on existing native carriers."""
from pathlib import Path
import json,copy,re
S=Path(__file__).resolve().parent;RID='DeformationAndDerivedPatchingAlgebra';STEM=RID+'--P7';STAGE=RID+':R03.3';NS='TauCeti.HilbertSamuel.'
put=lambda n,v:(S/n).write_text(v if isinstance(v,str)else json.dumps(v,ensure_ascii=False,indent=2)+'\n')
p=json.loads((S/'Incoming.json').read_text());old=copy.deepcopy(p)
common='A and S are commutative rings, M an additive commutative group with the stated module structures. Use existing natural-number-indexed A-submodules G_n of M and native DirectSum.Decomposition G when specified. No new graded-module carrier is introduced. Finiteness over S and over A are distinguished. No locality, Noetherianity, reducedness, freeness, finite length or positive generator count is implicit.'
source=[dict(sourceId='HS-GRADED-INDUCTION-00JV',locator='Section10.58, Lemma10.58.6 and the induction in Proposition10.58.7',excerpt='the graded ring',match='Motivates finite homogeneous module generators and induction on degree-one generators. These exact native lemmas are authored deductions from the pinned libraries. The explicit length-valued empty-variable branch is compatible with the retained kernel/cokernel route; it does not claim the source K0 proof or the positive-variable induction.')]
new=[]
def add(name,title,statement,deps,proof,hyp):
 n=dict(id=STAGE+'/'+name.replace('_','-'),parentStageId=STAGE,realises=[STAGE],kind='lemma',title=title,declaration=NS+name,statement=statement,hypotheses=[common]+hyp,proofSteps=proof,prerequisites=deps,acceptance=[statement,'Retain actual native components, actions and thresholds. Implementation status remains unchecked.'],uses=[dict(where='R03.3 Hilbert–Serre induction for finite graded modules and its Hilbert–Samuel application',how='Supply generic hypotheses that can be reused after graded kernels and quotients: homogeneous generators, compatible polynomial action and the zero-generator base case. The positive-variable recursive theorem and finite-length recurrence remain obligations.')],sources=source,library=dict(module='TauCeti/RingTheory/HilbertSamuel',namespace='TauCeti.HilbertSamuel'),implementationStatus='unchecked')
 new.append(n);return n['id']
m=lambda n:'mathlib:'+n
g=add('gradedModule_exists_homogeneous_generators','Finite homogeneous module generators','If M is finite over S and G is an internal A-linear grading of M, there is a finite subset t of M spanning M over S such that every x in t belongs to some G_n. No graded structure on S or compatibility between the two scalar actions is needed for this splitting statement.',[m('Module.Finite'),m('DirectSum.Decomposition'),m('DirectSum.sum_support_decompose'),m('Submodule.span_induction')],['Choose a finite S-spanning set. Replace each generator by all of its finitely many native homogeneous coordinates.','The resulting finite union spans: each original generator is the finite sum of its coordinates. Each selected coordinate belongs to its actual component.'],['Native DirectSum.Decomposition G and Module.Finite S M.'])
b=add('gradedModule_exists_bounded_generators','Bound on homogeneous generator degrees','Under the same hypotheses, choose t and a natural B with span_S(t)=M and for each x in t some n<B with x in G_n. B may be positive even for the empty generating family.',[g],['Choose one degree for each homogeneous generator and take one plus the finite supremum of those degrees.'],['Native DirectSum.Decomposition G and Module.Finite S M.'])
v=add('gradedModule_component_eq_bot_of_bounded_generators','Vanishing above coefficient-generator degrees','Given a finite A-spanning set t and B with every generator in some G_k for k<B, prove G_n=0 for every n≥B. This requires coefficient-ring spanning, not merely spanning over a positive-variable polynomial ring.',[m('DirectSum.Decomposition'),m('DirectSum.decompose_of_mem_same'),m('DirectSum.decompose_of_mem_ne'),m('DirectSum.decompose_smul'),m('Submodule.span_induction')],['The degree-n coordinate kills every generator because its selected degree is strictly below B≤n.','A-linear span induction shows that coordinate kills every element of M. On G_n the same coordinate is the identity, so every element there is zero.'],['span_A(t)=M and ∀x∈t, ∃k<B, x∈G_k. Native DirectSum.Decomposition G.'])
e=add('gradedModule_eventually_eq_bot','Eventual zero coefficient-module components','If M is finite over A and G is an internal A-linear natural-number grading, then there exists B with G_n=0 for all n≥B.',[b,v],['Apply the homogeneous degree bound with S=A, then the explicit bounded-generator vanishing criterion. This is a natural-index specialization of finite homogeneous support, not a replacement for the existing generic Tau finite-support theorem.'],['Native DirectSum.Decomposition G and Module.Finite A M.'])
l=add('gradedModule_eventually_length_zero','Eventual zero component lengths','Under the same coefficient-module finiteness hypotheses, there is B such that Module.length A G_n=0 for every n≥B, as an equality of native extended natural lengths.',[e,m('Module.length_eq_zero')],['Above the component-vanishing threshold the component is the zero submodule, which has length zero. No unguarded conversion of an infinite length is used.'],['Native DirectSum.Decomposition G and Module.Finite A M.'])
poly='M is a module over A[X_j | j∈J]. Each X_j sends G_n into G_(n+1). J may be infinite or empty. No decomposition or module finiteness is needed for the degree-action lemmas.'
x=add('gradedPolynomial_X_pow_smul_mem','Variable powers add degrees','For j∈J, k,n≥0 and x∈G_n, the actual action X_j^k·x belongs to G_(k+n).',[m('SetLike.GradedSMul')],['Induct on k, using the actual module multiplication action and the assumed one-step variable shift. The exponent-zero case is the identity action.'],[poly])
mo=add('gradedPolynomial_monomial_smul_mem','Monomial actions add total degree','For a finitely supported exponent vector d:J→ℕ, a∈A and x∈G_n, monomial(d,a)·x belongs to G_(|d|+n), with |d| the native Finsupp.degree. This includes zero or nilpotent coefficients.',[x,m('MvPolynomial.monomial_single_add')],['Induct on the exponent vector by adjoining one nonzero coordinate. The native monomial factorization reduces the step to the variable-power lemma.','For zero exponent, the scalar tower identifies C(a)·x with a·x, and G_n is an A-submodule.'],[poly,'The existing A action and polynomial action satisfy IsScalarTower A (MvPolynomial J A) M.'])
h=add('gradedPolynomial_homogeneous_smul_mem','Homogeneous polynomial actions add degrees','For any native homogeneous polynomial p of degree k and x∈G_n, the actual p action sends x into G_(k+n). The zero polynomial is allowed in every degree; an inhomogeneous polynomial is not covered.',[mo,m('MvPolynomial.IsWeightedHomogeneous.induction_on'),m('MvPolynomial.homogeneousSubmodule')],['Use the existing homogeneous-polynomial induction into zero, addition and monomials of the prescribed degree. The monomial degree is the native total exponent degree.','Use module add_smul and A-submodule closure under sums, retaining the actual action.'],[poly,'The existing coefficient and polynomial actions satisfy the native scalar-tower law.'])
gs=add('gradedPolynomial_gradedSMul','Native graded polynomial module action','The existing families of homogeneous polynomial submodules and G satisfy native SetLike.GradedSMul for the actual polynomial action.',[h,m('SetLike.GradedSMul'),m('MvPolynomial.homogeneousSubmodule')],['Package the preceding membership theorem in the existing graded-action class; introduce no new carrier or action.'],[poly,'The coefficient and polynomial actions satisfy IsScalarTower.'])
z=add('gradedPolynomial_empty_eventually_eq_bot','Empty-variable induction base','For an empty variable type J, if M is finite over A[X_j] and G is any internal A-linear natural-number grading, then some B satisfies G_n=0 for all n≥B. No variable-shift hypothesis is needed when J is empty.',[e,m('MvPolynomial.isEmptyAlgEquiv'),m('Module.Finite.equiv'),m('Module.Finite.trans')],['The native empty-variable algebra equivalence makes A[X_j] a finite A-module.','The actual scalar tower and finite-module transitivity make M finite over A; apply the coefficient-module vanishing theorem.'],['IsEmpty J, Module.Finite (MvPolynomial J A) M, native IsScalarTower A (MvPolynomial J A) M and DirectSum.Decomposition G.'])
zl=add('gradedPolynomial_empty_eventually_length_zero','Empty-variable length base','Under the empty-variable hypotheses, some B satisfies length_A(G_n)=0 for every n≥B.',[z,m('Module.length_eq_zero')],['Rewrite the actual component as the zero submodule and use native length_zero.'],['The same empty-variable finiteness, scalar-tower and internal-grading hypotheses.'])
zp=add('gradedPolynomial_empty_zero_polynomial','Zero polynomial in the induction base','Under the empty-variable hypotheses, there exists B such that for n≥B the native length of G_n is finite and eval(0,n)=toNat(length_A G_n), as rational numbers. This supplies a genuine zero-polynomial base case with a threshold, without assuming eventual polynomial behavior.',[zl],['The proved length-zero equality gives both length≠infinity and the valid natural/rational conversion. Evaluate the actual zero rational polynomial.'],['The same empty-variable finiteness, scalar-tower and internal-grading hypotheses.'])
ts=[
 ('polynomial_finite_generators','compatibility','The polynomial ring (Z/4)[X] as a finite module over itself has a finite homogeneous spanning family. This uses polynomial-ring finiteness without asserting finiteness over Z/4.',g),
 ('delayed_tail','non-example','For Z/4 concentrated in degree7, that degree is nonzero and the bounded-generator theorem kills every component n≥8. Replacing the threshold by zero is false.',v),
 ('empty_variables','degenerate','For any finite module over (Z/4)[X_j | j∈PEmpty] with an internal coefficient grading, the zero rational polynomial equals the eventually finite component length.',zp),
 ('nilpotent_monomial_action','computation','In (Z/4)[X], p=2X^3 is nonzero and square-zero, and p acting on X belongs to degree4. Neither domain assumptions nor killing nilpotent coefficients are valid.',mo),
 ('zero_polynomial_any_degree','degenerate','For arbitrary k,n, the zero polynomial viewed as homogeneous of degree k sends an actual x∈G_n into G_(k+n).',h),
 ('inhomogeneous_polynomial','non-example','The actual polynomial 1+X over Z/4 is not homogeneous of degree1.',h),
 ('power_zero','degenerate','The zero power of a variable acts within G_n for every actual x∈G_n, with no scalar-tower hypothesis needed for this variable-only assertion.',x),
 ('zero_module_empty_generators','degenerate','For a zero module with any internal grading, the empty A-spanning set and B=0 prove every component zero, including degree0.',v)]
tests=[]
for name,kind,statement,node in ts:
 t=dict(name='GradedInductionTests.'+name,kind=kind,statement=statement);tests.append(t);next(n for n in new if n['id']==node).setdefault('tests',[]).append(t)
specs=[('DirectSum.sum_support_decompose','theorem','Mathlib/Algebra/DirectSum/Decomposition.lean',190,'An element is the finite sum of its native homogeneous coordinates.'),('DirectSum.decompose_smul','theorem','Mathlib/Algebra/DirectSum/Decomposition.lean',272,'The native homogeneous decomposition commutes with coefficient scalar multiplication.'),('MvPolynomial.IsWeightedHomogeneous.induction_on','lemma','Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean',340,'Induction on a homogeneous polynomial using zero, sums and monomials of its prescribed degree.'),('MvPolynomial.monomial_single_add','theorem','Mathlib/Algebra/MvPolynomial/Basic.lean',255,'A monomial with one added exponent coordinate factors as a variable power times the remaining monomial.'),('MvPolynomial.isEmptyAlgEquiv','def','Mathlib/Algebra/MvPolynomial/Equiv.lean',265,'Existing algebra equivalence from polynomials in an empty variable type to the coefficient ring.')]
newbase=[dict(ref=m(name),kind=kind,module=module,provides=desc,checked=f'Actual whole statement and proof/construction with ambient hypotheses personally read on2026-10-04 by Codex — codex-7e92bd at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174, line{line}. Exact declaration index checked.')for name,kind,module,line,desc in specs]
refs={b['ref']for b in p['baseline']['declarations']};assert not refs&{b['ref']for b in newbase};refs|={b['ref']for b in newbase};ids={n['id']for n in old['nodes']+new}
assert all(r in refs if r.startswith(('mathlib:','tauceti:'))else r in ids for n in new for r in n['prerequisites'])
p['nodes']+=new;p['baseline']['declarations']+=newbase
sr=json.loads((S/'SourceReading.json').read_text());p['sources'].append(dict(id='HS-GRADED-INDUCTION-00JV',title='Noetherian graded rings: homogeneous module generators and induction',authors='The Stacks Project Authors',edition='Currently displayed Section10.58,4October2026',url=sr['url'],sha256=sr['sha256'],readSections=[sr['scope']]))
frontier='Twelve generic lemma nodes now supply finite homogeneous S-generators for any internally A-graded finite S-module, a bound on their degrees, explicit component vanishing from a bounded A-spanning set, actual homogeneous polynomial degree actions from degree-one variable shifts, and the empty-variable induction base with eventually zero native finite lengths and an actual zero rational polynomial. All use existing carriers. This resolves only these generic input/base-case omissions; it does not derive coefficient-module finiteness from polynomial-module finiteness when variables remain. Next construct generic graded kernels/cokernels of the last-variable action, their remaining-polynomial module structures and finite homogeneous pieces, with a recursive induction hypothesis that applies to both; then assemble the guarded signed finite-length recurrence into an explicit rational polynomial, threshold and initial constant. Preserve the nonzero kernel correction. Positive-variable polynomial existence, support/dimension degree equality, completion, localization, associativity, both intrinsic and ambient multiplicity conventions, all eight stages and every routed obligation remain open. All nodes unchecked.'
p['summary']+=' '+frontier;next(c for c in p['coverage']if c['stageId']==STAGE)['remaining'].append(frontier)
names=[n['declaration']for n in new];assert names==[NS+n for n in re.findall(r'^lemma (\w+)',(S/'New.lean').read_text(),re.M)]and len(new)==12
plan=dict(newNames=names,newNodes=[n['id']for n in new],definingInstances=[],newBaseline=newbase,apiAdditions={},newTests=tests,frontier=frontier)
for n,v in [('Plan.json',plan),('NewNodes.json',new),('NewTests.json',tests),('Candidate.json',p),(STEM+'.json',p)]:put(n,v)
t='# Generic graded-module induction inputs\n\n'+common+'\n\n'+poly+' The existing Tau finite homogeneous-support results and internal-grading objects are reused as baseline context; no second grading package is planned. The explicit bound criterion and polynomial induction base below retain their distinct scalar rings.\n\n'
for n in new:t+='## '+n['title']+'\n\n'+n['declaration']+'\n\n'+n['statement']+'\n\nHypotheses: '+' '.join(n['hypotheses'])+'\n\nProof: '+' '.join(n['proofSteps'])+'\n\nPrerequisites: '+', '.join(n['prerequisites'])+'.\n\n'
t+='## Boundary tests\n\n'
for x in tests:t+=x['name']+' ('+x['kind']+'): '+x['statement']+'\n\n'
t+='## Required continuation\n\n'+frontier+'\n\nAll466 incoming whole nodes, thirteen planets, fifteen gaps, two requests, source/version/E1 records and all earlier obligations are retained unchanged. The original reader follows. Full Tau-importing Suggested remains uncompiled; separate isolated native and admitted files are checked against the existing exact Mathlib build, retaining authenticated exact Tau source blocks.\n\n---\n\n'
put('ReaderAddition.md',t);put('Reader.md',t+(S/'IncomingReader.md').read_text())
print(json.dumps(dict(nodes=len(p['nodes']),newNodes=len(new),newAPI=0,newTests=8,baseline=len(p['baseline']['declarations']))))
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
"""Retain whole authenticated prefixes and append generic graded-module contracts."""
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
"""Write exact scope, proof boundary and reproducible validation helpers."""
from pathlib import Path
import json,hashlib
S=Path(__file__).resolve().parent;d=lambda n:json.loads((S/n).read_text());v=d('Verification.json');g=v['graph'];p=d('Candidate.json');plan=d('Plan.json')
t='''# Generic graded-module induction inputs — checkpoint

Codex — codex-7e92bd. Refs #551. Partial. All478 nodes remain unchecked. The reserved intrinsic/ambient Hilbert–Samuel multiplicity key, all eight stages, fifteen gaps and two requests remain required.

Twelve new lemma nodes and eight typed tests supply generic homogeneous generation, polynomial degree actions and the zero-variable Hilbert–Serre induction base. All466 incoming whole nodes and their API/test contracts remain unchanged. Five native Mathlib declarations are newly recorded as baseline imports. The thirteen planets, original source/version/E1 records and whole gap/request objects are retained. No new carrier or construction is introduced.

For arbitrary commutative rings A,S and an S-finite module M with an internal grading by A-submodules G_n, split a finite S-spanning set into its finitely supported homogeneous coordinates. The resulting finite set still S-spans M. Choose a degree for each member and take one plus their finite supremum to obtain an explicit bound B. This splitting theorem needs neither a grading on S nor compatibility between its action and the A action.

The next vanishing criterion requires a bounded A-spanning family. For n≥B, the degree-n projection kills each generator, hence every element by A-linear span induction. Since it fixes G_n, that component is zero. Thus A-finite internally graded modules have eventually zero components and native extended lengths. This is a natural-degree specialization with an explicit generator bound; Tau Ceti already has general finite nonzero-component support and an integer-indexed InternalGrading object. Neither is replanned. Finiteness over a positive-variable polynomial ring is not silently changed into finiteness over A.

For an actual A[X_j]-module M, assume each variable sends G_n into G_(n+1). Variable powers add their exponent to the degree, without needing a scalar tower for that assertion. When the coefficient and polynomial actions satisfy the native IsScalarTower law, monomials add their total exponent degree, including zero and nilpotent coefficients. The pinned homogeneous-polynomial induction then proves that every homogeneous p of degree k sends G_n into G_(k+n), and packages this in native SetLike.GradedSMul. These degree-action lemmas need no decomposition, finite generation, finite variable set, Noetherianity, regularity or reducedness.

When the variable type is empty, the native polynomial algebra equivalence with A makes a polynomial-finite module A-finite via the actual scalar tower. Its components and lengths therefore eventually vanish. The final base-case statement exhibits the actual zero rational polynomial and a threshold, together with length≠infinity before using toNat. It assumes no eventual-polynomial premise. The positive-variable induction and generic finite-length component argument are still required.

Eight tests cover a finite homogeneous family for the polynomial ring over Z/4 as a module over itself; Z/4 concentrated in degree7, where degree7 is nonzero but all n≥8 vanish; the empty-variable base over nonreduced Z/4; the nonzero square-zero polynomial2X^3 acting on X in degree4; zero polynomials in arbitrary prescribed degrees; the failure of1+X to be homogeneous of degree1; the exponent-zero action; and a zero module with the empty spanning set and bound0. The delayed-tail and nilpotent tests reject premature threshold0, reducedness or a polynomial action that kills all nilpotents.

## Reading and provenance

The whole55002-character issue was personally read in three complete untruncated slices before claim5982717161 and after bot5982718359 confirmed that exact numeric claim. ClaimReceipt.json binds the body hash and bounds. The earlier truncated display was not counted. The current reviewed R03.3 AUDIT17 row and metadata, reserved key, both requests, whole relevant gaps4–8 and entire R03.3 continuation were personally read before planning.

Own PR6074 at head ebc233c7213d1bd1780192806fa125c1928d7618 was recovered through actual public HTTP:77artifacts,10helpers,four final files and both pinned Tau source files with exact replayed blocks. Both actual recovered immutable verifiers reproduced their archived mathematical/publication reports byte-for-byte. The current four deliverables match that checkpoint. Its complete recovery helper, verifier, immutable reader and graph checker were inspected. The full incoming packet and4402-line native prefix are authenticated and retained, not claimed to have received a new full manual proof audit.

Own6074 Reading/InputGuard and nested original own6064/6051/6037 records are authenticated against their manifest chain. All four Reading records and the6037 ReadingChain were personally reread. Of85controls80are unchanged; the four owned files and Scheme Foundations changed. Current SFpacket bytes equal own6083; its final two SF.0 continuation paragraphs and complete empty requests were freshly read. A fresh structured name-hit scan found no new touching link files beyond the57unchanged files and123entries whose exact original full-entry scope was read in own6074. No peer reading claim is reassigned to this session.

Whole WORKERS and PROTOCOL3–4,12–15 were freshly read here; additional unchanged binding scopes retain their exact authenticated own provenance. Reading.json separates fresh source/proof ranges from prior scopes. Complete pinned Mathlib graded-algebra FiniteType and Tau internally graded-module source were read to avoid duplicating their objects. The new baseline declarations' complete statements, proofs/constructions and ambient hypotheses were read at the prescribed pin. Exact proposed-name searches are bounded negative checks, not semantic absence proofs.

The complete currently displayed Stacks Section10.58, all ten numbered statements/proofs and five comments, was read at https://stacks.math.columbia.edu/tag/00JV. SourceReading.json binds actual fetched bytes/hash/time. The native lemmas are authored deductions motivated by that source. The retained length-valued kernel/cokernel route differs from its K0 argument and must keep the nonzero kernel correction. Linked proofs/history, inherited E1 and all routed sources are not newly recursively audited here.

## Compilation boundary

**The full Tau-importing Suggested.lean is uncompiled.** The available Tau build is at cf386627e9176a3827c1a5fe804989fd94a4d216, not f790474821cf4256814db967cb154e7af3d0c369, and lacks both Internal.olean and the graded quotient olean. No library was built.

Native.lean and Canonical.lean preserve their exact authenticated incoming prefixes, already containing four pinned Tau direct-sum declarations and the complete graded-quotient namespace. These source blocks are not appended again. The inherited canonical block omits precisely the unused universe u/v/w header; its exact normalization remains verified. Public recovery fetches both pinned source files and verifies the original exact blocks. Source replay is not a compiled Tau-import claim.

The new twelve lemma headers and eight example headers match their admitted projection exactly; section hypotheses, including include hX and the scalar-tower section boundary, are retained. The complete native evidence imports no disposable prototype olean and has no admissions. Its twelve new declarations and all inherited audits depend only on propext,Classical.choice and Quot.sound. Canonical is the isolated admitted planning projection.

Checks use the existing Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 build and Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Runs are serial after a fresh20GiB guard, one thread,8192MiB cap and1200-second timeout. No Lake setup/update/cache, library build or language server.

'''
for name,r in v['compilation'].items():
 t+=f"- {name}: {r['lines']} lines,{r['examples']} examples,exit{r['exitStatus']},{r['warnings']} warnings,{r['axiomAudits']} axiom audits; {r['availableGiBBefore']}GiB available,{r['elapsedSeconds']} seconds,peak{r['maxRssKiB']}KiB. Source SHA256 `{r['sourceSha256']}`; diagnostic SHA256 `{r['logSha256']}`.\n"
b=(S/'Suggested.lean').read_bytes();t+=f"\nSuggested.lean: {len(b.splitlines())} lines,uncompiled; SHA256 `{hashlib.sha256(b).hexdigest()}`. Native has294clean audits and no warnings/errors/admissions. Canonical has899expected admission warnings only.\n"
t+=f'''
## Immutable validation

The actual indexed checker reports478nodes,359API entries,295recognized tests({v['rawTests']}raw references),13planets and460baseline declarations, with no errors or warnings. Actual intake authorization/file checks and source-issue/version checks pass. The required direct check_blueprint.py invocation passes with the exact declarations.tsv. Every466incoming whole node and prior API/test, every source/version/E1 record, fifteen gap objects and both requests remain unchanged.

Mathematical base `{v['mathematicalBase']}`; publication base `{v['immutableBase']}`. Both actual immutable verifier outputs are retained. All85input controls are guarded; PublicationChanges.json records {len(v['reviewedPublicationChanges'])} reviewed changes. The original four owned files and queue contract agree at both bases. Declaration index SHA256 `{v['indexSha256']}`.

Stage DAG {g['stageDAG']['vertices']}/{g['stageDAG']['edges']},own DAG {g['ownDAG']['vertices']}/{g['ownDAG']['edges']},combined DAG {g['combinedDAG']['vertices']}/{g['combinedDAG']['edges']}; all acyclic and no unresolved owned dependencies. All{g['acceptedRestructurePairs']}accepted restructure pairs and{g['requiredStagePairsReachable']}of{g['requiredStagePairs']}required stage pairs remain reachable. The inherited LocalFieldsRamification layer0→R03.4 missing path remains in its unchanged gap/request. Complete foreign roadmap/stage and stage-edge objects and53sibling declarations remain preserved.

## Resume

{plan['frontier']}

Start with arbitrary internally A-graded finite modules over a polynomial ring with finitely many degree-one variables. Construct the actual last-variable kernel and cokernel as graded modules over the remaining polynomial ring, using the existing native quotient/restriction machinery and the current adic specializations as checked guides. Prove their finiteness and finite component lengths in the required Artinian/Noetherian setting. The present generic homogeneous-action theorem and generator bounds can be reused at every stage, and the zero-variable polynomial base is now available. Then apply induction to both actual modules and integrate the signed finite-length recurrence with threshold and initial constant. Do not assume regularity of the removed variable or erase its kernel term. Support-dimension equality and the general Hilbert–Samuel multiplicity theory remain separate obligations.
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
assert len(old['nodes'])==466 and len(p['nodes'])==478 and set(p)==set(old)
assert p['nodes'][:466]==old['nodes']
assert plan['apiAdditions']=={}
assert p['nodes'][466:]==data('NewNodes.json')
assert [n['id']for n in p['nodes'][466:]]==plan['newNodes']
for k in old:
 if k not in ['nodes','summary','sources','baseline','coverage']:assert p[k]==old[k],k
assert p['baseline']['declarations']==old['baseline']['declarations']+plan['newBaseline']and len(p['baseline']['declarations'])==460
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
assert 'import PrototypeBase' not in txt('Native.lean') and 'import PrototypeBase' not in txt('Canonical.lean')
prev=data('PreviousRecovery.json');manifest=data('PreviousManifest.json')
assert prev['head']=='ebc233c7213d1bd1780192806fa125c1928d7618'and prev['artifactsVerified']==77 and prev['archivedHelpersVerified']==10
assert sha((S/'PreviousManifest.json').read_bytes())=='ace3ce5cafcc7e4445d86377a70206b82f4638cdcc49c4a91a7ae37c52ed71c3'
for original,current in [('Native.lean','NativePrefix.lean'),('Canonical.lean','CanonicalPrefix.lean'),('Verification.json','PreviousVerification.json'),('MathematicalVerification.json','PreviousMathematicalVerification.json')]:assert manifest[original]['sha256']==sha((S/current).read_bytes())
for path,n in zip(paths,['Incoming.json','IncomingReader.md','Incoming.lean','IncomingHandoff.md']):assert sha((S/n).read_bytes())==prev['publicDeliverables'][path]
assert (S/'IncomingPublicationVerification-replayed.json').read_bytes()==(S/'PreviousVerification.json').read_bytes()
assert (S/'IncomingMathematicalVerification-replayed.json').read_bytes()==(S/'PreviousMathematicalVerification.json').read_bytes()
om=data('OwnPreviousManifest.json')
assert sha((S/'OwnPreviousManifest.json').read_bytes())=='ace3ce5cafcc7e4445d86377a70206b82f4638cdcc49c4a91a7ae37c52ed71c3'
for original,current in [('Reading.json','OwnPreviousReading.json'),('InputGuard.json','OwnPreviousInputGuard.json'),('Candidate.json','OwnPreviousCandidate.json')]:assert om[original]['sha256']==sha((S/current).read_bytes())
for original,entry in om.items():
 if original.startswith(('OwnPrevious','OwnInherited')):assert entry['sha256']==sha((S/('Own6074'+original)).read_bytes())
prior={g['path']:g['sha256']for g in data('OwnPreviousInputGuard.json')}
reuse=data('OwnReadingReuse.json');assert len(reuse)==85 and sum(g['unchanged']for g in reuse)==80
for g in reuse:
 assert g['before']==prior[g['path']]and g['after']==sha(blob(MATH,g['path']))
 assert g['unchanged']==(g['before']==g['after'])
assert data('ClaimReceipt.json')['claim']==5982717161 and data('ClaimReceipt.json')['confirmation']==5982718359
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
assert {**nh,**nt}==ch and len(nh)==12 and len(nt)==8
assert '𝓜 7 ≠ ⊥' in nt['example#1'] and '8 ≤ n' in nt['example#1']
assert 'p ≠ 0 ∧ p^2 = 0' in nt['example#3'] and '¬' in nt['example#5']
assert 'IsScalarTower' in nh['gradedPolynomial_monomial_smul_mem'] or '[IsScalarTower' in txt('New.lean')
assert set(plan['newNames'])=={NS+n for n in nh}
assert {n['declaration']for n in p['nodes'][466:]}|set(plan['definingInstances'])==set(plan['newNames'])
assert sum(len(n.get('api',[]))for n in p['nodes'][466:])==0
assert sum(len(n.get('tests',[]))for n in p['nodes'][466:])==8
assert len({t['name']for n in p['nodes'][466:]for t in n.get('tests',[])})==8
assert all(len(n['tests'])>=3 and len(n['api'])>=3 for n in p['nodes'][466:]if n['kind']in ['definition','construction'])
assert{t['name']for t in data('NewTests.json')}==set(re.findall(r'^-- test: (.+)$',txt('NewTests.lean'),re.M))
for n in p['nodes'][466:]:assert n['declaration']in txt('Reader.md')and n['statement']in txt('Reader.md')
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
assert 'import TauCeti.RingTheory.GradedAlgebra.Homogeneous.Quotient\n' in txt('Incoming.lean')
for row in data('TouchingLinks.json')['files']:assert sha(blob(MATH,row['path']))==row['sha256']
compilation={}
for name,warnings,examples,audits in [('Native.lean',0,107,294),('Canonical.lean',899,368,0)]:
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
print(json.dumps(dict(checker=summary,sourceIssueErrors=issues,intakeProblems=problems,intakeRefusals=refusals,preservedWholeNodes=466,preservedContracts=466,newNodes=12,newMathematicalDeclarations=12,definingInstances=0,newAPI=0,newTests=8,matchedNewHeaders=12,matchedTestHeaders=8,rawAPI=sum(len(n.get('api',[]))for n in p['nodes']),rawTests=sum(len(n.get('tests',[]))for n in p['nodes']),compilation=compilation,inputGuards=len(data('InputGuard.json')),reviewedPublicationChanges=changes,indexSha256=sha(Path(sys.argv[2]).read_bytes()),mathematicalBase=MATH,immutableBase=BASE,graph=graph,fullSuggestedCompiled=False,sourceReplayBoundary=data('SourceBoundary.json'),tauSourceReplay=tr,tauRestrictionSourceReplay=rr,tauQuotientSourceReplay=qr,LeanExecuted=False),indent=2))
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
STEM='DeformationAndDerivedPatchingAlgebra--P7'
suggested=R/'research/blueprint/suggested'/(STEM+'.lean')
sha=lambda b:hashlib.sha256(b).hexdigest()
NAMES='''Incoming.json IncomingReader.md Incoming.lean IncomingHandoff.md NativePrefix.lean CanonicalPrefix.lean
Native.lean Native.log Native.receipt.json Canonical.lean Canonical.log Canonical.receipt.json
New.lean NewTests.lean NewImports.lean TauImports.lean Audits.lean NewAdmitted.lean
TauGradedQuotient.lean TauGradedQuotientCanonical.lean TauGradedQuotientReceipt.json TauGradedQuotientNames.json TouchingLinks.json LinkScreen.json SupplierScope.json
TauShift.lean TauShiftReceipt.json TauRestriction.lean TauRestrictionReceipt.json SourceBoundary.json Candidate.json Reader.md ReaderAddition.md Suggested.lean
Handoff.md HandoffBase.md ClaimReceipt.json Reading.json SourceReading.json OwnPreviousReading.json
OwnPreviousManifest.json OwnPreviousInputGuard.json OwnPreviousCandidate.json
Own6074OwnInherited6037InputGuard.json Own6074OwnInherited6037Manifest.json Own6074OwnInherited6037Reading.json Own6074OwnInherited6037ReadingChain.json Own6074OwnInherited6051InputGuard.json Own6074OwnInherited6051Manifest.json Own6074OwnInherited6051Reading.json Own6074OwnPreviousCandidate.json Own6074OwnPreviousInputGuard.json Own6074OwnPreviousManifest.json Own6074OwnPreviousReading.json
OwnReadingReuse.json Search.json InputGuard.json PublicationChanges.json
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
 suggested.write_bytes((S/'Suggested.lean').read_bytes()+b'\n/- BEGIN ARCHIVED GENERIC GRADED MODULE INDUCTION PAYLOAD\n'+pb+b'END ARCHIVED GENERIC GRADED MODULE INDUCTION PAYLOAD -/\n')
 print(json.dumps(report,indent=2))
elif mode=='final':
 archive=sys.argv[3];assert re.fullmatch('[0-9a-f]{40}',archive)
 p=json.loads((S/'package.json').read_text());expected={k:sha((S/n).read_bytes())for k,n in [('packets','Candidate.json'),('readmes','Reader.md'),('suggested','Suggested.lean')]}
 code='''"""Recover public authenticated generic graded-module induction evidence; never executes Lean."""
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
pb=raw.split('/- BEGIN ARCHIVED GENERIC GRADED MODULE INDUCTION PAYLOAD\\n',1)[1].split('END ARCHIVED GENERIC GRADED MODULE INDUCTION PAYLOAD -/',1)[0].encode()
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
