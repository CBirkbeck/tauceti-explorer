# BP-DeformationAndDerivedPatchingAlgebra--P7: native adic grading checkpoint

Codex — `codex-5ebb6f`. Refs #551. 2 October 2026. Winning claim 5956236007 confirmed by bot 5956238263; issue reread after confirmation. Publication base `50a5391786116e4f2caa037fabe6ea063abb4034`.

**Partial blueprint checkpoint. No mathematical implementation is claimed.**

The packet now has 79 nodes (8 definitions, 15 constructions, 40 lemmas, 16 theorems), 99 API entries, 79 definition/construction tests plus four lemma tests, 104 native examples, 176 pinned baseline references, thirteen planets, fourteen gaps and two requests. All eight stages remain open and every implementation status is unchecked. All 72 original node objects, source entries, baseline prefix, source issues, requests, coverage rows, planets, reserved multiplicity boundary and historical receipts are preserved. Only two gap descriptions are updated, with their former text retained as previousDetail.

## What changed

Seven R03.3 declarations supply the next native step after the previous ordinary adic ring/module comparison:

- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components` — `TauCeti.HilbertSamuel.adicRingComponents`: For the existing quotient S=Rees(q)/(q Rees(q)), define S_n=range(ι_n) as an A-submodule of S. Identify G_n=q^n/(q·top_(q^n)) with S_n by the existing injectivity of ι_n. Compose the inverse finite expansion S→⊕G_n with the direct sum of these range equivalences to obtain the actual A-linear map d:S→⊕S_n.
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-decomposition` — `TauCeti.HilbertSamuel.adicRingDecompose_inclusion`: The actual candidate d sends ι_n(x) to lof_n(e_n(x)) for every native quotient class x∈G_n.
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-grading-registration` — `TauCeti.HilbertSamuel.adicRingGrading`: Register GradedAlgebra(S_n) on the same S. Its native decomposition is exactly d and its canonical inverse is summation of the submodule inclusions. The unit is in S_0 and S_i S_j⊆S_(i+j). Define π_n:S→S using GradedAlgebra.proj; it is A-linear.
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-components` — `TauCeti.HilbertSamuel.adicModuleComponents`: For the existing module L=Rq(M)/(q Rq·top), define L_n=range(ι_n^M) as an A-submodule of this same quotient. The native degree quotient G_n(M) is A-linearly equivalent to L_n. Composing inverse finite expansion with direct-sum range equivalences gives d_M:L→⊕L_n.
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-decomposition` — `TauCeti.HilbertSamuel.adicModuleDecompose_inclusion`: The actual d_M sends ι_n^M(x) to lof_n(e_n^M(x)) for every native module quotient class.
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-scalar-action` — `TauCeti.HilbertSamuel.adicModuleGradedSMul`: For the actual image component families of the native Rees quotients, register SetLike.GradedSMul(S_n,L_n): a∈S_i and x∈L_j imply a·x∈L_(i+j) under the inherited quotient action.
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-grading-registration` — `TauCeti.HilbertSamuel.adicModuleDecomposition`: Register DirectSum.Decomposition(L_n) using d_M and SetLike.GradedSMul(S_n,L_n) using the existing action of S=gr_q(A) on L=gr_q(M). Thus S_i·L_j⊆L_(i+j) for that same action. With the precise native GradedModule.isModule instance, GradedModule.linearEquiv gives L≃ₗ[S]⊕L_n. Define the A-linear ambient projection π_n^M by native decomposition, DFinsupp.lapply and the image-submodule inclusion.

The four constructions have twelve discriminating native examples. Ring and module components are the actual ranges of existing quotient inclusions. Their decomposition maps use existing inverse finite expansions and native direct-sum range equivalences. The ring registers GradedAlgebra; the module registers DirectSum.Decomposition and imports the separately stated SetLike.GradedSMul lemma. GradedModule.isModule is explicit on the external sum, and its comparison is linear over the original graded ring. Individual projections are only A-linear. No new generic grading, Rees carrier or shifted-map notion is introduced.

For Z/4,q=(2), the nonzero degree-one ring/regular-module class survives and has square zero in degree two; the residue module has no positive piece and the ring degree-one class kills it. These examples reject concentration in degree zero and confusing a residue module with the regular module. Zero and unit ideals retain their full scope over arbitrary commutative coefficient rings.

## Durable preceding proof and exact next work

The full preceding source-level kernel/cokernel Hilbert–Serre proof and its standalone reproduction are preserved at [the immutable #5793 handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/8e99678225347331a3fe3e0a66fc6bd6eab6d640/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md). That proof is not copied into a fake graded carrier. Its steps 1–2 are now registered as precise native plans; its ten subsequent refinements still need canonical integration.

Next inspect the already built pinned Tau Ceti `DirectSum.Decomposition.restrict` and `DirectSum.map_decompose_shift` before constructing actual homogeneous kernels. Register K=ker(x), I=range(x) and Q=M/I with their actual component gradings and quotient maps. Handle Q_0=M_0 separately. Descend the native action to S/(x), prove K and Q finite with one fewer degree-one generator, and establish their finite component lengths. Factor degreewise multiplication M_n→M_(n+1) through its image and apply native length additivity twice. The signed recurrence is h_M(n+1)−h_M(n)=h_Q(n+1)−h_K(n); it neither assumes injectivity nor uses truncated natural subtraction.

Induct on a designated finite list of degree-one generators, including redundant/zero entries. With smaller tail polynomials P_K,P_Q use D(T)=P_Q(T)−P_K(T−1), N=max(1,N_Q,N_K+1), and P_M(T)=summatoryPolynomial(D)(T)+h_M(N−1)−summatoryPolynomial(D)(N−1). The anchor and threshold are essential. The r=0 tail is zero and the r>0 degree bound is r−1; this does not prove degree equals dim M. Supply the polynomial and threshold to the existing cumulative-polynomial-from-graded-tail node. The old separate largest-power-torsion induction is not an additional obligation for this chosen length proof. The general K0 version of Stacks 10.58.7 is outside this consumer.

Every degree/dimension, Artin–Rees, intrinsic/ambient normalization, associativity, formal plane-curve, Nagata, parameter-ideal and completion comparison remains. The reserved general Hilbert–Samuel multiplicity key remains open. All original P7–P9/R03.1–R03.5 paper routes and patching/deformation/derived obligations remain. Generic integer grading and shifted-map theory retain their upstream owners; the new nodes are the natural-indexed adic adapters. No new planet or supplier request is added.

## Reading and checks

Freshly read complete Stacks [00K1](https://stacks.math.columbia.edu/tag/00K1) and [00K4](https://stacks.math.columbia.edu/tag/00K4) mathematical statements/proofs. Downloaded HTML hashes are f421fbc2dc074fc0ae392c392f06c6223f60740703e9ccb28d6bd18c5d57afc3 and e3d86d2fc7e6a9df48e73e4e8d12629cdb08f9e0fb9d15e35472d7bc21629932. Read the reviewed AUDIT-17 R03.3 row, accepted RS-08 ownership and native pinned declaration statements/ambient hypotheses. The nineteen new baseline entries have individual source hashes and passages. The earlier complete upstream JacobianChallenge and StableReduction style readings remain historical. No fresh reading of every inherited paper or exhaustive library absence search is claimed. No new source error is alleged.

Full suggested-file elaboration at the existing exact Mathlib build, Lean v4.34.0-rc2: zero errors, 225 admitted-proof warnings, no other warnings, 104 examples; 21.91 seconds, maximum RSS 3,524,048 KiB. Available memory before the final run: 73 GiB. Suggested-file SHA-256 `959ab431e3d44c4eaaa1f206f05834c553ceeb6185ced824789fc9c2c4270427`; full compilation-log SHA-256 `59edb31b332841c9a5145f528245b9ad0c0a75707ed20b0755fb156a3724c782`. No Tau Ceti module is imported, library built, cache downloaded, Lake project created or language server started. The receipt certifies term types, not proofs. No compiler remains running.

The indexed checker passes with zero errors/warnings. Packet/reader/suggested parity and preservation checks pass. Current declaration graph: 79 vertices, 123 edges, acyclic. Normal read-only atlas assembly with this packet overlaid in memory: 211 roadmaps, 2,952 actual stages and 8,623 directed stage edges; the graph including 51 existing external supplier endpoints is acyclic. All 79 current declarations are listed, no link for this roadmap is skipped. No repository atlas data is mutated and not every accepted declaration graph is certified. The four allowed paths pass intake and whitespace checks before publication.

Fresh predecessor reproduction: 151 models, 24,317 assertions, exact program SHA-256 `c73c4ee301bcf97bdf715905a826fb38bae65efd12336d5962ab719a2378dd6b` and output SHA-256 `b486e799696f88e504466f67ca76427cdb6deb3e0fa6cbc0f32b6d9174e7bdcb`. The complete program is available in the immutable predecessor handoff above.

Fresh grading regressions: eleven cyclic ring/module cases, 15,171 assertions, degree bound four. They first verify all degree-four-and-higher components are genuinely zero in these cases, so no nonzero tail is discarded. They check actual finite quotient representative independence (7,192), original quotient action associativity (4,429), ring/module degree sums (612/545), ring/module projection orthogonality (1,264/832), decomposition, zero/unit ideals and regular/residue-module distinctions. The program below uses only the Python standard library. Its SHA-256 is `965bb6babe5eaa998561d7de2fe2e1aedd60eb581d129e11ddf26e14575c5ed9`; output SHA-256 `737f279a26f532bf4d9652bce40259fac040d18540871cd247c1ae4169451f56`. Finite tests support the examples and do not prove the unrestricted grading or Hilbert–Serre induction.

## Standalone grading reproduction

```python
"""Actual finite cyclic adic quotients and homogeneous projections; not proofs."""
from itertools import product
from collections import Counter
import json

C = Counter()
def check(name, value):
    assert value, name
    C[name] += 1

def pieces(modulus, d, bound):
    F = [{(pow(d,n)*x)%modulus for x in range(modulus)} for n in range(bound+1)]
    def quotient(n,x):
        return min((x+h)%modulus for h in F[n+1])
    G = [sorted({quotient(n,x) for x in F[n]}) for n in range(bound)]
    return F, G, quotient

models = [(4,0,4),(4,1,4),(4,2,4),(4,2,2),(8,2,8),(8,2,2),
          (9,3,9),(9,3,3),(12,6,12),(12,6,6),(8,2,1)]
records=[]
BOUND=4
for N,d,m in models:
    RF,RG,rq=pieces(N,d,BOUND)
    MF,MG,mq=pieces(m,d,BOUND)
    check('beyond_bound_components_zero',RF[BOUND]=={d*x%N for x in RF[BOUND]}
          and MF[BOUND]=={d*x%m for x in MF[BOUND]})
    RS=list(product(*RG));MS=list(product(*MG));z=(0,)*BOUND
    def add(x,y,q,mod): return tuple(q(i,(x[i]+y[i])%mod) for i in range(BOUND))
    def project(i,x): return tuple(x[j] if i==j else 0 for j in range(BOUND))
    def mul(x,y,q,mod):
        return tuple(q(n,sum(x[i]*y[n-i] for i in range(n+1))%mod) for n in range(BOUND))
    def action(a,x): return mul(a,x,mq,m)
    one=tuple(rq(0,1%N) if i==0 else 0 for i in range(BOUND))
    for x in RS:
        check('ring_decomposition',tuple(sum(project(i,x)[j] for i in range(BOUND)) for j in range(BOUND))==x)
        check('ring_identity',mul(one,x,rq,N)==x)
        for i in range(BOUND):
            for j in range(BOUND):
                check('ring_projection_orthogonality',project(i,project(j,x))==(project(j,x) if i==j else z))
    check('ring_unit_projection',project(0,one)==one)
    for x in MS:
        check('module_decomposition',tuple(sum(project(i,x)[j] for i in range(BOUND)) for j in range(BOUND))==x)
        check('module_identity_action',action(one,x)==x)
        for i in range(BOUND):
            for j in range(BOUND):
                check('module_projection_orthogonality',project(i,project(j,x))==(project(j,x) if i==j else z))
    for i in range(BOUND):
        for j in range(BOUND):
            for a in RG[i]:
                for b in RG[j]:
                    x=tuple(a if k==i else 0 for k in range(BOUND))
                    y=tuple(b if k==j else 0 for k in range(BOUND))
                    xy=mul(x,y,rq,N)
                    check('ring_degree_sum',xy==(project(i+j,xy) if i+j<BOUND else z))
                for b in MG[j]:
                    x=tuple(a if k==i else 0 for k in range(BOUND))
                    y=tuple(b if k==j else 0 for k in range(BOUND))
                    ax=action(x,y)
                    check('module_degree_sum',ax==(project(i+j,ax) if i+j<BOUND else z))
            # Choice of representatives: every denominator translate has the
            # same actual quotient product, including non-field coefficients.
            for a in RF[i]:
                for h in RF[i+1]:
                    for b in MF[j]:
                        for k in MF[j+1]:
                            if i+j<BOUND:
                                check('quotient_action_representative_independence',
                                      mq(i+j,((a+h)%N)*((b+k)%m)%m)==mq(i+j,a*b%m))
    for a,b in product(RS,repeat=2):
        for x in MS:
            check('original_quotient_action_associative',action(mul(a,b,rq,N),x)==action(a,action(b,x)))
    if d==0:
        check('zero_ideal_has_no_positive_pieces',all(len(g)==1 for g in MG[1:]))
    if d==1:
        check('unit_ideal_zero_ring_and_module',len(RS)==len(MS)==1)
    if (N,d,m)==(4,2,4):
        check('ring_and_regular_module_positive_class',len(RG[1])==len(MG[1])==2)
        a=(0,2,0,0)
        check('degree_one_nilpotent',a in RS and a!=z and mul(a,a,rq,N)==z)
    if (N,d,m)==(4,2,2):
        check('residue_module_differs_from_ring',len(RG[1])==2 and all(len(g)==1 for g in MG[1:]))
        for a in RS:
            for x in MS: check('residue_positive_action_zero',action(project(1,a),x)==z)
    records.append(dict(ring=N,idealGenerator=d,module=m,ringPieces=list(map(len,RG)),modulePieces=list(map(len,MG))))
print(json.dumps(dict(models=records,checks=dict(C),total_assertions=sum(C.values()),bound=BOUND,
                     scope='Finite cyclic ring/module quotient, grading and representative regressions; no general proof or Lean implementation claim'),sort_keys=True,indent=2))
```
