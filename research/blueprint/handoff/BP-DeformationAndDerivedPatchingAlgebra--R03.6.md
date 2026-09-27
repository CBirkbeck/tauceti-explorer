# BP-DeformationAndDerivedPatchingAlgebra--R03.6: quotient prototype checkpoint

ChatGPT Pro — `gpt-20260927-c8f42a`, 27 September 2026. Refs #552. **Status: partial; not ready for independent blueprint review.** Claim comment 5856894704; bot confirmation 5856896784.

This continuation applies the previous handoff's quotient-interface changes to the **suggested Lean file** and adds concrete hypothesis regressions. It does **not** yet apply the declaration split to the JSON packet or rewrite the roadmap document. The packet's granularity gap therefore remains open. Nothing is claimed to be formalised, and the changed Lean file has **not** been compiled.

The preceding proof-level handoff is preserved in PR #3140 and repository history. PR #3131 contains the earlier packet/prototype continuation. Historical compilation and validation records from those submissions are not fresh checks of this one.

## Changes actually applied

In `research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.6.lean`:

1. Added the signature `Module.NearlyFaithful.radical_annihilator_quotient`: for a finite nearly faithful A-module M and an ideal I, the radical of Ann_A(M/IM) is the radical of I. The documentation identifies the existing support calculation as its proof, without a circular dependence on quotient near faithfulness.
2. Removed the unnecessary surjectivity argument from `Module.NearlyFaithful.ker_le_radical_of_equiv_quotient`. It now handles any compatible coefficient map A→B and an A-linear equivalence M/IM≃N.
3. Kept surjectivity and the reverse radical containment in `Module.NearlyFaithful.of_equiv_quotient`, and clarified why neither follows from the kernel-bound conclusion.
4. Added three concrete negative-test statements using actual quotient and product module structures: Q over Z with I=(2); Z/6 with I=(2) and the identity coefficient map; and the diagonal F_2→F_2×F_2 with the first-factor quotient module.
5. Added a call-site example invoking the strengthened kernel bound with no surjectivity argument, plus explicit checks of five existing support/annihilator declarations.

All new mathematical proofs are `sorry`, except for the call-site example, which invokes a suggested theorem that itself has a `sorry` proof. Neither that example nor the finite computations below establish Lean verification.

The original prototype was reconstructed byte-for-byte before editing: its blob SHA was `de95fee9a9139efce76dec3871a9025fa491139d`. The committed replacement was independently checked against its returned blob SHA, `95fe49c3a83fa7ad915a823df01210e406b32d40`. The difference consists of the quotient-interface changes, regression statements and baseline checks described above; unrelated prototype declarations are preserved.

## Packet and ownership state deliberately unchanged

The packet remains at blob `9f91f7c03f68788c988a178e58a750b32f171e15`, with the inherited 26 nodes, two definitions, 19 API items, 11 definition tests, six planets, 97 baseline declarations, three gaps and no cross-roadmap requests. The new Lean acceptance statements do not change those JSON counts. In particular, `G-declaration-granularity` still lists thirteen aggregate theorem/lemma nodes, not twelve.

The other two recorded gaps are the precise R03.3 maximal-depth freeness theorem over a regular local ring, used by `patching-free-conclusion`, and the precise R03.3 catenarity/dimension-function comparison, used by `nearly-faithful-lift-from-special-fibre`.

The reviewed AUDIT-17 material for R03.6 was read: `Module.support_quotient` and the support/annihilator machinery are existing library inputs, not new constructions. The prior accepted RS-08 ownership assignments remain unchanged. R03.3 owns depth, regular-local freeness and catenarity; R03.5/P8 own patched-module/complex constructions. This checkpoint introduces no substitute for those suppliers and makes no independent-review claim.

## Proof decomposition to encode in the packet

Let A be a commutative ring, M a finite A-module with Ann_A(M) contained in the nilradical, and I an ideal of A. Put Q=M/IM and K=Ann_A(Q). None of the following four statements needs A Noetherian or local.

### The common annihilator-radical helper

**Statement:** radical(K)=radical(I).

Full support of M and the pinned `Module.support_quotient` give Supp_A(Q)=V(I). The quotient Q is finite, so `Module.support_eq_zeroLocus` gives Supp_A(Q)=V(K). Apply `PrimeSpectrum.zeroLocus_subset_zeroLocus_iff` in both directions and use radical monotonicity and idempotence. Equivalently, applying the existing vanishing-ideal operation to the equality of zero loci identifies their radicals. This also shows K⊆radical(I); the inclusion I⊆K follows directly because I kills Q.

Suggested declaration **now present**: `Module.NearlyFaithful.radical_annihilator_quotient`.
Proposed packet suffix, **not yet registered**: `radical-annihilator-quotient`.

The helper uses the existing full-support characterization. Do not make it depend on `nearly-faithful-quotient`, which it is intended to prove.

### Near faithfulness over A/I

**Statement:** Q is nearly faithful over A/I.

Use the existing quotient-module scalar structure and the canonical surjection A→A/I. The planned `nearly-faithful-restrict-scalars-surjective` identifies this conclusion with K⊆radical(I). Apply the helper.

Keep the existing packet identifier `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-quotient` for this statement alone and retain `Module.NearlyFaithful.quotient`.

### Kernel bound for a second action

Let f:A→B be any ring map and N a B-module with compatible A action and an A-linear equivalence e:Q≃N. Put J=ker(f).

**Statement:** J⊆radical(I).

Compatibility of actions makes every element of J annihilate N. The pinned `LinearEquiv.annihilator_eq` identifies Ann_A(N) with K. Hence J⊆K⊆radical(I). Surjectivity is unnecessary.

Suggested declaration, **now strengthened**: `Module.NearlyFaithful.ker_le_radical_of_equiv_quotient`.
Proposed packet suffix, **not yet registered**: `quotient-action-kernel-bound`.

### Near faithfulness for the second action

Continue with f, N, e and J, and now assume that f is surjective and I⊆radical(J).

**Statement:** N is nearly faithful over B.

The helper gives Ann_A(N)⊆radical(I). The new containment gives radical(I)⊆radical(J), so apply `nearly-faithful-restrict-scalars-surjective` to f. The earlier bound J⊆radical(I) points the other way and cannot replace the additional hypothesis.

Retained suggested declaration: `Module.NearlyFaithful.of_equiv_quotient`.
Proposed packet suffix, **not yet registered**: `quotient-action-nearly-faithful`.

## Boundary cases and reproducible finite checks

**Finiteness:** A=Z, M=Q, I=(2). The module is faithful but not finite; 2Q=Q, so Q/2Q is zero and is not nearly faithful over F_2. This is an algebraic boundary argument, not an enumerated finite test.

**Reverse radical containment:** A=B=Z/6, f=id, M=A, I=(2). Then J=0⊆radical(I), but Ann_B(A/I)=(2) contains the non-nilpotent element 2. The missing hypothesis is I⊆radical(J). All rings and modules here are finite.

**Surjectivity for scalar descent:** A=F_2, B=F_2×F_2, f diagonal, I=0 and N=B/(0,1). Restricted to A, N is the usual one-dimensional vector space. Both radical containments hold, but Ann_B(N) contains the nonzero idempotent (0,1). Thus even injectivity and flatness do not replace surjectivity in this scalar-descent criterion. This is not a counterexample to the distinct base-change theorem, whose module is B tensor_A M rather than an arbitrary compatible B-module.

The following finite-ring checks were executed successfully in this session for 1≤n≤64, including the zero ring Z/1. They range over canonical cyclic modules, ideals and quotient factor actions, not arbitrary finite rings or all ring maps. There are 280 cyclic modules in the enumeration, of which 108 are nearly faithful. The conditional checks examine 569 quotients, 2,044 kernel bounds and 1,119 scalar descents. Two explicit finite negative tests also pass.

```python
from math import gcd


def divisors(n):
    return [d for d in range(1, n + 1) if n % d == 0]


def ideal(n, d):
    # The ideal generated by d in Z/n, where d divides n.
    return set(range(0, n, d))


def radical(n, d):
    # a belongs to sqrt((d)) iff its image in Z/d is nilpotent.
    # Exponent n suffices because d divides n.
    return {a for a in range(n) if pow(a, n, d) == 0}


def nearly_faithful(n, d):
    # Ann_{Z/n}(Z/d) is (d).
    return ideal(n, d) <= radical(n, n)


counts = dict(modules=0, quotients=0, kernel_bounds=0, descents=0)
for n in range(1, 65):
    for d in divisors(n):
        if not nearly_faithful(n, d):
            continue
        counts['modules'] += 1
        for i in divisors(n):
            q = gcd(d, i)  # M/IM is Z/q.
            assert radical(n, q) == radical(n, i)
            assert nearly_faithful(i, q)
            counts['quotients'] += 1
            for j in divisors(n):
                if j % q:  # Exactly when the action factors through Z/j.
                    continue
                assert ideal(n, j) <= radical(n, i)
                counts['kernel_bounds'] += 1
                if ideal(n, i) <= radical(n, j):
                    assert nearly_faithful(j, q)
                    counts['descents'] += 1

assert counts == dict(modules=108, quotients=569, kernel_bounds=2044, descents=1119)
assert nearly_faithful(6, 6)
assert not nearly_faithful(6, 2)
assert not ideal(6, 2) <= radical(6, 6)
B = {(a, b) for a in range(2) for b in range(2)}
diagonal = {(a, a) for a in range(2)}
annihilator_first_factor = {z for z in B if all(z[0] * m % 2 == 0 for m in range(2))}
assert diagonal != B
assert annihilator_first_factor == {(0, 0), (0, 1)}
assert (0 * 0 % 2, 1 * 1 % 2) == (0, 1)
print(counts)
```

These computations are sanity checks, not proofs of the general statements and not Lean compilation.

## Fresh source and pinned-library verification

Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations. II*, Definition 2.1 and Lemma 2.2(1) with its proof, printed pp. 187–188, was read from the parsed text of https://www.numdam.org/article/PMIHES_2008__108__183_0.pdf. Both attempted PDF page renderings failed with cache errors; no fresh visual page inspection or source-digest verification is claimed. The original result uses finite modules over Noetherian local rings. The generalized radical-form argument above is justified separately by the support calculation.

The complete statements and proofs at Stacks tags https://stacks.math.columbia.edu/tag/00L2 and https://stacks.math.columbia.edu/tag/00L3 were also read, including the finite-module hypothesis and the localized Nakayama argument.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the following actual source passages were read:

- `Mathlib/RingTheory/Support.lean`, lines 180–285: finite support/annihilator equality and support of a quotient, including proofs. Blob `d0548ef864cf81a5d1a26127852a37b693c94658`.
- `Mathlib/RingTheory/Ideal/Maps.lean`, lines 865–945: linear-equivalence invariance and scalar restriction of annihilators, with their proofs. Blob `d3597ae968d410972c69f585a2d41b79585ccca4`.
- `Mathlib/RingTheory/Spectrum/Prime/Basic.lean`, lines 180–430: the zero-locus/radical criterion, vanishing-ideal identity and full-zero-locus criterion, including their statements and proofs. Blob `bb032d6c3d4d4149fb69fb59f888cdec7225e4a2`.

These remain existing baseline inputs. Tau Ceti remains pinned to `f790474821cf4256814db967cb154e7af3d0c369`. No new published-source error is asserted, and the two inherited source findings are unchanged.

## Exact continuation boundary

**Implemented:** helper signature, stronger kernel-bound signature, three concrete negative-test statements and a no-surjectivity call-site example in the suggested Lean file.

**Not implemented:** the corresponding four-node JSON split, narrowing the retained quotient node, rewiring consumers, updating the roadmap document and compiling the changed prototype. The full packet remains partial, and its thirteen-node granularity list must not be shortened yet.

Next register the helper and the two second-action leaves, preserving the original quotient identifier for near faithfulness over A/I. In `patching-nearly-faithful-descends`, cite the kernel-bound and scalar-descent leaves separately. Check the other direct consumers, including the framing quotient branch, rather than leaving their conclusions hidden behind the narrowed node. Synchronize the roadmap document and acceptance fields with the actual new prototype statements. Only then lower the aggregate-node count from thirteen to twelve and the corresponding gap description; the remaining twelve aggregates still need their own splits.

Run the full packet validator and compile at the pin. Before updating any call site, remember that `ker_le_radical_of_equiv_quotient` no longer takes a surjectivity argument. Preserve the two R03.3 supplier gaps and the accepted ownership decisions.

**Validation status:** finite sanity checks passed; original/replacement prototype blob identities verified; Lean compilation not run; `scripts/check_blueprint.py` not run locally; no fresh global DAG or declaration-index validation claimed. This submission changes only the suggested Lean file and this handoff. The Swarm intake check does not compile Lean, and with no packet change it is not expected to run the packet validator. Its success must not be reported as certification of the unapplied JSON split.
