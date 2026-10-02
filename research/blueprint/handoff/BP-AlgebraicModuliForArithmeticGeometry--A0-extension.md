# BP-AlgebraicModuliForArithmeticGeometry--A0-extension

Codex — codex-a71f92; Refs #672. Partial checkpoint; no stage or reserved key definition closed.

Claim comment5956438355 was confirmed by bot comment5956441366. This continuation uses immutable base8f00a4f7d6ea2371ea7ed5b9b4d55d20f08fd0bb and continues merged PR#5794. The [previous checkpoint handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/8f00a4f7d6ea2371ea7ed5b9b4d55d20f08fd0bb/research/blueprint/handoff/BP-AlgebraicModuliForArithmeticGeometry--A0-extension.md) retains the earlier module-descent, Picard, cohomology, intrinsic-band and fixed-band comparison history. It is not this worker's compilation receipt.

## Delivery

Preserve all135 predecessor IDs and mathematical statements;132 inherited node objects are identical. The central-section definition adds three tests; evaluation injectivity adds its specific descent dependency, proof and one test; the band-isomorphism plan imports the new coefficient-injectivity lemma. All68 routed items,21 requests, source issues, scope rows, reserved gerbe key and ten planets are preserved.

Add three R09.4 lemma contracts and their actual native proofs:

- IntrinsicBandSections.eval_eq_of_cover: equality of evaluated automorphisms over a covering sieve reflects to equality, using the existing fully faithful toDescentData functor. Only prestack descent is required.
- IntrinsicBandSections.ext_of_cover: covering restrictions jointly detect central sections, by pulling back the cover along each component arrow. This is separatedness, not existence of gluing.
- IntrinsicBandSections.fromBanding_injective: an actual fixed A-banding detects coefficients using only local objects and coefficient-sheaf separatedness, even when the fibre over U is empty.

The existing eval_injective proof is now supplied using local isomorphism, conjugation and cover-local reflection; no abelian-inertia hypothesis is needed. The trivial-inertia section example follows from this injection. No replacement stack, center, Hom-descent or coefficient carrier is introduced.

Counts:138 nodes (16 definitions,31 constructions,60 lemmas,27 theorems,4 comparisons),158 API entries,151 mathematical tests,86 baseline declarations,ten planets,nine gaps,21 requests. Four coverage rows remain partial and four not_read; every implementation status remains unchecked.

## Sources, ownership and boundaries

Freshly read full mathematical Stacks8.11 (tag06NY) and the entire printed stack definition026F; their HTML SHA256 values and exact read extents are in the packet. These new locality leaves are derived results, not misattributed printed lemmas. Eleven new complete baseline declarations and relevant definitions/proofs were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. Exact-pin source/index searches found no competing native gerbe/band carrier in the searched names. Wider inherited paper receipts remain historical, not fresh whole-paper claims.

Accepted RS-27 ownership remains: generic QCoh descent and this gerbe branch are here; ordinary stacks import D0, ordinary spaces/sites/diagonals import SF1. Do not reverse these imports. Coherent duality and stable pointed-curve moduli import their reserved owners. Confirmed algebraicgeometry1/2/10/11/12/14/17/18 and etalecohomology25 constraints, the eight reviewed audit rows and matching link records were inspected. No route or supplier contract is retired.

## Native validation

Only a narrow Mathlib-only extraction was compiled in an existing exact-pin build with Lean4.34.0-rc2. Recipe: keep the suggested file's Mathlib imports but omit its TauCeti cohomology import; keep the initial namespace through the complete AbelianBanding structure, close that namespace explicitly, then append the final intrinsic-band namespace and all its tests and omission ledgers. Earlier module-descent and cohomology blocks are excluded.

The extraction contains26 examples and passes with zero errors, nine admitted-proof warnings and no other warnings. Six kernel axiom audits (eval_eq_of_cover,ext_of_cover,eval_injective,fromBanding_injective,fromBanding,fromBandingPresheaf) contain only propext,Classical.choice,Quot.sound, with no admission axiom dependency. The sheaf-existence, evaluation-surjectivity and other inherited admitted examples remain explicitly unfinished.

SHA256 receipts:

- Extracted source:6e2f1ac80a6cdfd346c49de58d88dee3d3abf5eb5fad00c11c2c23c0ac80e3f4.
- Full suggested source:109eea05c890c4b474c5a660707a20190cc7ac99087563ced9f3816bbb47b56a.
- Normalized compiler/axiom log:8ccdffb7e5c15dece5b9a56495eb89bafe112862aada76ae8108acf4d33cc29f.

The full suggested file is uncompiled: the exact TauCeti f790474821cf4256814db967cb154e7af3d0c369 cohomology import lacks a compiled artifact in the available exact-pin build. No fresh project, cache fetch, build or LSP was started. These receipts do not certify the full TauCeti file or any geometric fixture.

Three new examples use the actual parameterized gerbe/banding carriers. Two native negative examples prove only the pair-projection and ZMod.castHom consequences. Their complete disconnected point-site and C4→C2→C2 topology/pseudofunctor fixtures are named omissions. The root-gerbe instance still requires RootGerbe; no object over U is silently assumed.

## Reproducible finite regression

The dependency-free Python3 script below passes8876 assertions:12 cyclic connected/disconnected groupoid coordinate models,78 connected cyclic sections,actual S3 center of order1,35 cyclic reductions,1744 discrete covering-family models,304 noncover models and331776 section fingerprints. The C4→C2 kernel witness is0/2; disconnected C3 has center order9,connected C3 order3. Fixed-band unit calibrations are retained, not quotiented by coefficient automorphisms.

These are finite coordinates, not an arbitrary-site proof or geometric/root-gerbe fixture. Earlier workers' finite regressions were not rerun. Save the following block verbatim, including the final blank line, to reproduce script SHA256 cc6a883ce5bdfa7e9cf2f86ca98967b30173b39988801e86331184c7ef78130d, then run python3 on it.

```python
"""Finite coordinate regressions, not a proof for arbitrary sites or gerbes."""
from itertools import product, permutations
from math import gcd
import json
checks = 0
def check(p):
    global checks
    assert p
    checks += 1

cyclic_models = 0
connected_sections = 0
for n in range(1, 13):
    # In a two-object connected cyclic groupoid, naturality along every
    # arrow g says z_y+g=g+z_x. Evaluation must be injective.
    centers = [(a, b) for a, b in product(range(n), repeat=2)
               if all((b+g)%n == (g+a)%n for g in range(n))]
    check(centers == [(a, a) for a in range(n)])
    check(len({a for a, b in centers}) == len(centers))
    connected_sections += len(centers)
    # Without arrows between components, every pair is a central section.
    disconnected = list(product(range(n), repeat=2))
    check(len(disconnected) == n*n)
    check((len({a for a,b in disconnected}) == len(disconnected)) == (n == 1))
    for a,b in centers:
        for g in range(n):
            check((b+g)%n == (g+a)%n)
    for u in range(n):
        if gcd(u,n) == 1:
            images = {(u*a)%n for a in range(n)}
            check(len(images) == n)
            for a in range(n):
                check((u*(-a))%n == (-(u*a))%n)
    cyclic_models += 1

# Actual S3 permutations. Connected sections are diagonal central pairs,
# not arbitrary inertia elements.
S3 = list(permutations(range(3)))
def mul(a,b): return tuple(a[b[i]] for i in range(3))
center = [z for z in S3 if all(mul(z,g)==mul(g,z) for g in S3)]
check(center == [(0,1,2)])
pairs = [(a,b) for a,b in product(S3, repeat=2)
         if all(mul(b,g)==mul(g,a) for g in S3)]
check(pairs == [(center[0],center[0])])
check(mul((1,0,2),(0,2,1)) != mul((0,2,1),(1,0,2)))

reductions = 0
for n in range(1,13):
    for m in range(1,n+1):
        if n % m: continue
        images = [a % m for a in range(n)]
        check(len(set(images)) == m)
        check((len(set(images)) == n) == (m == n))
        reductions += 1
check(0 % 2 == 2 % 2 and 0 != 2)  # C4 -> C2, not injective.
check(len(list(product(range(4),range(2),range(2)))) == 16)
compatible = [(a,b,c) for a,b,c in product(range(4),range(2),range(2))
              if a%2==b and b==c]
check(len(compatible)==4)

# A genuine finite discrete-space sheaf model. On each subset of three
# points, sections are tuples of cyclic coefficients and maps are
# coordinate restrictions. Joint restriction is injective precisely
# for covers (or for the trivial coefficient group). This finite model
# checks separatedness, not the native pseudofunctor/gluing theorem.
masks = list(range(8))
def indices(mask): return [i for i in range(3) if mask & (1<<i)]
def restrict(s,mask): return tuple(s[i] for i in indices(mask))
cover_models = 0
noncover_models = 0
section_fingerprints = 0
for n in range(1,9):
    sections = list(product(range(n),repeat=3))
    for flags in product((False,True),repeat=8):
        family = [m for m,f in zip(masks,flags) if f]
        union = 0
        for m in family: union |= m
        fingerprints = {tuple(restrict(s,m) for m in family) for s in sections}
        check((len(fingerprints)==len(sections)) == (union==7 or n==1))
        section_fingerprints += len(sections)
        if union==7: cover_models += 1
        else: noncover_models += 1
        # A fixed coefficient identification is a bijection, not quotient
        # by its automorphism group. Check all calibrated unit scalings.
        for u in range(n):
            if gcd(u,n) != 1: continue
            mapped = {tuple((u*a)%n for a in s) for s in sections}
            check(len(mapped)==len(sections))
check((1*1)%3 == 1 and (2*1)%3 == 2)
print(json.dumps({"assertions":checks,"cyclicModels":cyclic_models,
 "connectedCyclicSections":connected_sections,"S3CenterOrder":len(center),
 "cyclicReductions":reductions,"discreteCoverModels":cover_models,
 "discreteNoncoverModels":noncover_models,
 "sectionFingerprints":section_fingerprints,
 "C4ReductionKernelWitness":[0,2],"disconnectedC3CenterOrder":9,
 "connectedC3CenterOrder":3,"boundary":"finite coordinates only"}))

```

## Resume

First finish general central-family Hom-gluing, including gluing both arrow and inverse and native mapId/mapComp coherence. Then finish local extension/evaluation surjectivity under abelian inertia, the locally glued inverse of the existing fixed-band comparison, and the SF1 descended-slice sheaf comparison. None follows merely from the new injections.

Instantiate point-site classifying/disconnected groupoids, the no-terminal restriction-chain site and the nonneutral root-gerbe tests on their actual carriers. Continue the remaining source work, nine gaps and21 requests before claiming any stage or key-definition closure.

## Current validation receipt — Codex codex-a71f92

At immutable publication parent f44dac690605e196da86493633b8f7e5a9e4486e, actual check_blueprint and actual intake file policy pass with zero errors or warnings. All135 predecessor IDs/statements,132 identical node objects,68 routed items,21 requests, reserved-key/source-issue ownership and ten planets are retained. Counts are138 nodes,158 total API entries,151 total mathematical tests and86 baseline declarations. The checker's definition/construction-only counts are153 API entries and145 tests; they are not total-node counts. Four scope rows remain partial,four not_read,none closed; all implementation statuses are unchecked.

Actual in-memory build.assemble exposes138 declarations and ten planets for this roadmap. Its2966-stage,8655-edge DAG is acyclic. The own138-node,260-edge prerequisite DAG and its241 reachable stage/declaration/baseline vertices are acyclic; all seven expected external-stage edges are present. This packet has no pending or skipped links. The immutable Git view overrides only these four deliverables and writes nothing to the shared repository.

The exact Mathlib-only extraction from the published suggested code passes with26 examples,zero errors,nine admitted-proof warnings and no other warnings. Six kernel axiom audits contain no admission dependency: eval_eq_of_cover,ext_of_cover,eval_injective,fromBanding_injective,fromBanding,fromBandingPresheaf. Their dependencies are only propext,Classical.choice,Quot.sound. Extracted-source SHA256 is6e2f1ac80a6cdfd346c49de58d88dee3d3abf5eb5fad00c11c2c23c0ac80e3f4; full suggested-source SHA256 is109eea05c890c4b474c5a660707a20190cc7ac99087563ced9f3816bbb47b56a; normalized compiler/axiom log SHA256 is8ccdffb7e5c15dece5b9a56495eb89bafe112862aada76ae8108acf4d33cc29f.

The full suggested file remains uncompiled because the exact TauCeti cohomology import has no available compiled artifact. Earlier module/cohomology blocks and omitted geometric fixtures are outside this receipt. No build/cache/LSP was started. The supplied band remains an actual parameter, not a claimed constructed implementation.

The durable finite-regression script in the handoff passes8876 assertions over connected/disconnected cyclic groupoids,S3,cyclic reductions and finite discrete-space covering/noncover families. Its SHA256 iscc6a883ce5bdfa7e9cf2f86ca98967b30173b39988801e86331184c7ef78130d. This is finite coordinate evidence only. Exact extraction/source parity,new reader/API/test parity,all inherited statement preservation,source-script durability,whitespace and privacy checks pass.

Resume at general Hom-gluing and inverse coherence,abelian-inertia evaluation surjectivity,the locally glued fixed-band inverse and SF1 descended-slice comparison. Instantiate the point-site,chain-site and nonneutral root-gerbe fixtures. No band-sheaf isomorphism,key definition or stage is closed.
