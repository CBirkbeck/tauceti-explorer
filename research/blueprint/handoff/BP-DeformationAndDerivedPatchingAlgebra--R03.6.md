# BP-DeformationAndDerivedPatchingAlgebra--R03.6: quotient-descent checkpoint

ChatGPT — `cg-20260927-b74e`, 27 September 2026. Refs #552. **Status: partial.** Claim comment 5851061669; bot confirmation 5851062545.

This checkpoint records a proof-level continuation of the quotient branch and reproducible finite-ring tests. **It does not apply the proposed declaration split to the packet or change the suggested Lean file.** The packet, roadmap document and prototype remain the versions inherited from PR #3131. In particular, their granularity gap remains open: this handoff is not a claim that the encoded blueprint now satisfies the one-declaration rule.

The prior handoff and its historical validation record remain available in the repository history and PR #3131. This note distinguishes that inherited work from the checks performed in this session.

## Existing state preserved

The inherited packet has 26 nodes, two definitions, 19 API items, 11 definition tests, six planets, 97 baseline declarations, three gaps and no cross-roadmap requests. The previous continuation separated support base change into unconditional inclusion, finite-module equality and flat-map equality; the framing branch was already separated. None of these objects or identifiers is changed here.

The three existing gaps remain:

1. The precise R03.3 maximal-depth freeness theorem over a regular local ring, used by `patching-free-conclusion`.
2. The precise R03.3 catenarity/dimension-function comparison, used by `nearly-faithful-lift-from-special-fibre`.
3. `G-declaration-granularity`, still listing thirteen aggregate theorem/lemma nodes.

The accepted RS-08 ownership and accepted AUDIT-17 decisions were read. R03.3 continues to own depth, regular-local freeness and catenarity; R03.5/P8 own constructions of patched modules/complexes. This continuation introduces no replacement for any of those suppliers and makes no independent-review claim.

## Quotient branch: exact proof decomposition

Let A be a commutative ring, M a finite A-module with Ann_A(M) contained in the nilradical, and I an ideal of A. Write Q=M/IM and K=Ann_A(Q). No Noetherian or local hypothesis is used in the four statements below.

### 1. The annihilator-radical helper

**Statement:** the radical of K equals the radical of I.

Since M is finite and nearly faithful, its support is all of Spec A. The pinned `Module.support_quotient` gives Supp_A(Q)=Supp_A(M) intersect V(I)=V(I). The quotient Q is finite, so the pinned `Module.support_eq_zeroLocus` gives Supp_A(Q)=V(K). Equality of these zero loci gives equality of their radicals, using the existing prime-spectrum radical criterion. Thus K is contained in the radical of I, and I is contained in K because I kills Q.

This is the common proof input for all three declarations currently bundled into `nearly-faithful-quotient`. It should be an explicit helper, not repeated or silently hidden in each leaf.

Suggested future name: `Module.NearlyFaithful.radical_annihilator_quotient`.

### 2. Near faithfulness over the quotient ring

**Statement:** Q is nearly faithful over A/I.

Use the existing quotient-module scalar structure and the canonical surjection A→A/I. The already planned `nearly-faithful-restrict-scalars-surjective` identifies the conclusion with K contained in the radical of I. Apply the helper above. The quotient-module carrier is the existing quotient by the submodule I times the top submodule; no new carrier is needed.

Keep the identifier `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-quotient` for this statement alone and retain its existing suggested declaration `Module.NearlyFaithful.quotient`.

### 3. The kernel bound for a second coefficient action

Let f:A→B be a ring map, let N be a B-module with compatible A action, and let e:Q→N be an A-linear equivalence. Put J=ker(f).

**Statement:** J is contained in the radical of I.

For every a in J and every n in N, compatibility of the scalar actions gives a n=f(a)n=0. Hence J is contained in Ann_A(N). The pinned `LinearEquiv.annihilator_eq` identifies this annihilator with K. The helper gives K contained in the radical of I.

**Surjectivity of f is not used in this statement.** The current suggested declaration `Module.NearlyFaithful.ker_le_radical_of_equiv_quotient` has a surjectivity argument that may be removed when the split is encoded. The existing stronger-hypothesis declaration is not false; the point is to expose the actual dependency and avoid carrying an unnecessary hypothesis into consumers.

Proposed, not yet registered, node suffix: `quotient-action-kernel-bound`.

### 4. Near faithfulness for the second coefficient action

Continue with f, N, e and J above. Now assume f is surjective and I is contained in the radical of J.

**Statement:** N is nearly faithful as a B-module.

The helper and the linear equivalence give Ann_A(N) contained in the radical of I. Monotonicity and idempotence of radicals turn I contained in the radical of J into radical(I) contained in radical(J). Therefore Ann_A(N) is contained in radical(J). Apply `nearly-faithful-restrict-scalars-surjective` to f.

The two conditions are distinct: the preceding kernel-bound statement gives J contained in radical(I), not the reverse inclusion required here. They must not be interchanged.

Retain the existing suggested declaration `Module.NearlyFaithful.of_equiv_quotient` for this leaf. Proposed, not yet registered, node suffix: `quotient-action-nearly-faithful`.

## Boundary cases checked

### Finiteness really is needed

Take A=Z, M=Q and I=(2). The A-module M is faithful: a nonzero integer does not kill 1. Multiplication by 2 on Q is surjective, so M/IM=0. The zero module over A/I=F_2 is not nearly faithful, since its annihilator contains 1 and F_2 is nonzero and reduced. This proves that finiteness cannot be dropped from the quotient theorem. It is an algebraic proof, not a finite-computation test or a claim of Lean verification.

### The reverse radical containment really is needed

Take A=B=Z/6, f the identity, M=A, I=(2) and N=Z/2 with the quotient action. Then M is finite and faithful, f is surjective, Q is N and J=0. The kernel bound J contained in radical(I) holds. But Ann_B(N)=(2) contains the non-nilpotent element 2, so N is not nearly faithful over B. The missing condition is I contained in radical(J)=0. Powers of 2 modulo 6 alternate between 2 and 4 and never vanish.

This is a finite-ring counterexample, so the failure cannot be attributed to lack of finite generation or Noetherianity.

### Surjectivity really is needed for the scalar-transfer criterion

Take A=F_2, B=F_2×F_2 and f the diagonal map. Let M=A, I=0, and let N=F_2 with B acting through its first projection. Its restricted A-action is the usual one, so Q and N are A-linearly equivalent, J=0, and both radical containments hold. However Ann_B(N)=0×F_2 contains the nonzero idempotent (0,1), so N is not nearly faithful over B.

Thus the kernel bound remains valid for arbitrary f, but the near-faithfulness conclusion does not. The target map in this test is injective, flat and not surjective; replacing surjectivity merely by flatness would not repair the scalar-transfer statement.

## Reproducible finite checks

The following Python program was run successfully in this session. It checks the canonical cyclic-ring quotient/factor maps, not every ring map between every finite ring. The general statements above have separate proofs.

Results for every n with 1≤n≤64 and every relevant divisor d, i, j of n:

| Check | Cases |
| --- | ---: |
| Cyclic modules Z/d over Z/n examined | 280 |
| Near-faithfulness of M/IM over A/I | 569 |
| Kernel contained in radical(I) for factor actions | 2,044 |
| Near-faithfulness after the additional radical containment | 1,119 |
| Explicit finite negative tests | 2 |

The ring Z/1 is included, so the positive tests also exercise the zero-ring boundary. These are overlapping families of checks, not a claim of 4,011 independent theorems.

```python
import math

def divisors(n):
    return [d for d in range(1, n + 1) if n % d == 0]

def annihilator(n, d):
    # All scalars killing all elements of Z/d as a Z/n-module.
    return {a for a in range(n)
            if all((a * m) % d == 0 for m in range(d))}

def nilpotents(n):
    result = set()
    for a in range(n):
        power = 1 % n
        for _ in range(n):
            power = power * a % n
            if power == 0:
                result.add(a)
                break
    return result

def nearly_faithful(n, d):
    return annihilator(n, d) <= nilpotents(n)

counts = [0, 0, 0, 0]
for n in range(1, 65):
    nil = nilpotents(n)
    for d in divisors(n):
        counts[0] += 1
        if not annihilator(n, d) <= nil:
            continue
        for i in divisors(n):
            image = {(i * m) % d for m in range(d)}
            q = d // len(image)
            assert q == math.gcd(d, i)
            assert nearly_faithful(i, q)
            counts[1] += 1
            for j in divisors(n):
                if j % q:
                    continue
                kernel = {a for a in range(n) if a % j == 0}
                assert all(a % i in nilpotents(i) for a in kernel)
                counts[2] += 1
                ideal_I = {a for a in range(n) if a % i == 0}
                if all(a % j in nilpotents(j) for a in ideal_I):
                    assert nearly_faithful(j, q)
                    counts[3] += 1

assert counts == [280, 569, 2044, 1119]
assert nearly_faithful(6, 6)
assert not nearly_faithful(6, 2)
B = [(a, b) for a in range(2) for b in range(2)]
ann_B = {z for z in B if all(z[0] * m % 2 == 0 for m in range(2))}
assert ann_B == {(0, 0), (0, 1)}
assert ((0 * 0) % 2, (1 * 1) % 2) == (0, 1)
assert nearly_faithful(2, 2)
print(counts)
```

## Fresh source and library checks

The source read in this session is Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations. II*, Definition 2.1 and Lemma 2.2(1) with its proof, printed pp. 187–188. The text at https://www.numdam.org/article/PMIHES_2008__108__183_0.pdf explicitly uses the localized quotient and Nakayama. Both requested PDF page renderings failed with a cache error. The parsed text was read, but no fresh visual page inspection or digest verification is claimed.

Stacks tag https://stacks.math.columbia.edu/tag/00L2 was opened for the finite support/annihilator statement. The following actual Mathlib source passages were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `Mathlib/RingTheory/Support.lean`, lines 170–290: the finite-module section, `Module.support_eq_zeroLocus`, and the full statement and proof of `Module.support_quotient`, including its local Nakayama step. Blob `d0548ef864cf81a5d1a26127852a37b693c94658`.
- `Mathlib/RingTheory/Ideal/Maps.lean`, lines 865–945: `LinearEquiv.annihilator_eq`, `Module.comap_annihilator`, `Module.annihilator_eq_bot` and `Module.annihilator_eq_top_iff`. Blob `d3597ae968d410972c69f585a2d41b79585ccca4`.

These are already baseline declarations, so no new presence claim or library-owner assignment is needed. Tau Ceti remains pinned to `f790474821cf4256814db967cb154e7af3d0c369`.

No new source error is asserted. The two existing source findings remain unchanged; their earlier searches and visual checks are historical records, not newly repeated checks by this session.

## Exact continuation boundary

**Not done here:** the helper and two new leaf identifiers have not been inserted into the JSON; the retained quotient node has not been narrowed; its consumers have not been rewired; the proposed helper and countertests have not been added to the suggested Lean file; and the larger support-characterisation aggregate has not been split. The current granularity list must therefore continue to say thirteen, not twelve.

Next apply the four-statement split above. Preserve the existing quotient identifier for the quotient-ring theorem and all three existing suggested declaration names. Add a declaration for the radical helper. For the kernel-bound leaf, remove the unnecessary surjectivity argument only after updating its calls. In `patching-nearly-faithful-descends`, cite the kernel-bound and scalar-descent leaves separately; do not leave those conclusions hidden behind the narrowed quotient node. Then check the other direct consumers of the original node before lowering the granularity count.

Encode all three boundary cases in the suggested file using actual quotient/product module structures, not an assumed proposition saying that the test passes. Run the full packet validator and compile at the pin. The radical helper uses the existing full-support characterization; it must not depend on the quotient theorem it is intended to prove.

**Lean was not compiled in this session.** The suggested file is unchanged at blob `de95fee9a9139efce76dec3871a9025fa491139d`; PR #3131's recorded compilation is historical evidence for that unchanged file, not a compilation of any new declarations. The packet is unchanged at blob `9f91f7c03f68788c988a178e58a750b32f171e15`. No new repository-wide DAG, declaration-index or blueprint validation is claimed from the finite-ring checks.

This PR changes only this handoff. The Swarm submission check should verify that the submitted path is permitted; success of that intake check does not certify the unapplied declaration split or prove the mathematical statements.
