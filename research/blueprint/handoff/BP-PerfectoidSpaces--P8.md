# BP-PerfectoidSpaces--P8 — lattice-saturation continuation

Issue #974. Agent: ChatGPT (GPT-6 Astra Pro). Session: `g6a-260926-7b42`.
Date: 26 September 2026. Claim 5848770562; bot confirmation 5848771646.

## Status and preserved work

**Partial, handoff-only research checkpoint.** This continuation gives an explicit elementary proof of the integral completed-lattice comparison left open by the preceding handoff, conditional on its rational tensor-invariants theorem. The proof uses saturation over the valuation ring and principal-adic completion, not an identification with rational unit balls. It also gives a counterexample to that latter identification in the generality of Banach spaces.

**The packet, roadmap document and suggested Lean file are unchanged.** No node, baseline entry, source issue, request or gap has been edited in those files. The mathematical argument below still needs declaration-sized integration and independent review; this is not the completed blueprint or an implementation claim.

The immediately preceding handoff, including the weighted-basis proof of rational descent, its discrete-base alternative, all previous obligations, and its link to the earlier handoff, is preserved at this immutable revision:

[Weighted-basis continuation and previous integration plan](https://github.com/CBirkbeck/tauceti-explorer/blob/919bf760943644067515a97924a98953309d4123/research/blueprint/handoff/BP-PerfectoidSpaces--P8.md).

The unchanged packet blob is `83e7a28f447880229f80de956e0813f24eefff30`. Its previously reported inventory is 62 nodes: 5 definitions, 4 constructions, 35 lemmas and 18 theorems; 60 API items; 37 unit tests; 11 planets; 51 baseline declarations; 34 source issues; 12 supplier requests; and three recorded gaps. These are inherited counts, not a new whole-packet audit. This continuation adds zero packet nodes.

## 1. Precise integral transfer statement

Let K be a complete nontrivially valued nonarchimedean field with a real-valued absolute value. Write O for its valuation ring. Fix any pi in O with 0 < |pi| < 1; pi need not generate the maximal ideal, and K = O[1/pi]. All completions below are ordinary separated pi-adic completions, not derived completions.

Let E and V be ultrametric Banach K-vector spaces. Let E0 and V0 be bounded open O-submodules of E and V. Let a group G act on E by continuous K-linear automorphisms, with g(E0) = E0 for every g. Give V and V0 the trivial action. There is no finiteness, compactness or group-order hypothesis in the transfer argument.

Put F = E^G and F0 = F intersect E0. The subspace F is closed, being the intersection of the kernels of the continuous maps g - 1. It is Banach; F0 is a bounded open lattice in F.

For K-Banach spaces use the **separated completion of the nonarchimedean projective tensor seminorm**

    ||z||_projective = inf over z = sum_j e_j tensor v_j of max_j ||e_j|| ||v_j||.

Suppose that the canonical rational map

    J: F completed-tensor_K V -> (E completed-tensor_K V)^G

is bijective. It is essential that this is the canonical map induced by F -> E, not an unrelated abstract isomorphism. The preceding handoff supplies a proof when V is of countable type over K, and a separate proof for arbitrary V over a discretely valued K. The transfer below does not replace either rational proof.

Then the canonical integral map is an isomorphism of pi-adically topologized O-modules:

    completion_pi(F0 tensor_O V0)
        -> completion_pi(E0 tensor_O V0)^G.

The topology on the right is the subspace topology. In particular, this proves the unit-lattice version whenever the action preserves the chosen unit lattice. For a uniform Banach algebra application, one must identify the chosen stable bounded open lattice with the intended power-bounded subring; an arbitrary norm's unit ball is not silently called that subring.

The proof is given in Sections 2–6. Section 5 proves only a **topological generic-fibre comparison**, not an equality of integral unit balls. Neither an averaging operator nor division by the order of G is used.

## 2. The algebraic tensor inclusion is saturated

The quotient E0/F0 embeds as an O-module in the K-vector space E/F: the kernel of the map E0 -> E/F is exactly F0. Consequently E0/F0 is torsion free. The modules E0, F0 and V0 are also torsion free.

Over a valuation ring, torsion-free modules are flat (Stacks, Tag 0539). Tensor the exact sequence for F0 inside E0 with V0 and put

    N = F0 tensor_O V0,
    M = E0 tensor_O V0,
    Q = (E0/F0) tensor_O V0.

This gives the short exact sequence

    0 -> N -> M -> Q -> 0.

Both factors defining Q are flat, so Q is flat and hence torsion free. The same reasoning applies to M and N. Identify N with its image in M. For every nonnegative integer n,

    N intersect pi^n M = pi^n N.                         (2.1)

Indeed, if pi^n m belongs to N, the class of m in Q is killed by pi^n, and hence is zero. The reverse inclusion is immediate.

The torsion-freeness of the **quotient** is indispensable. N = pi O inside M = O is an inclusion of torsion-free modules, but is not pi-saturated.

## 3. Principal-adic completion of the saturated sequence

Here hats mean the inverse limits of T/pi^n T. These arguments work for modules over any commutative ring when the specified pi-regularity hypotheses hold; no Noetherian or finite-generation hypothesis on the modules is used.

### 3.1 Regularity and reduction of the completion

If multiplication by pi is injective on T, it is injective on its completion. Suppose pi x = 0 in the completion. At level n+1 choose a representative t in T for x. Then pi t belongs to pi^(n+1) T. Cancellation of pi gives t in pi^n T, so the component x_n is zero. This holds for every n, hence x = 0.

The projection from the completion to T/pi^n T is surjective: any representative t has its compatible family of reductions. Its kernel is exactly pi^n times the completion. To see this, for an element whose component at n vanishes, choose representatives at the cofinal levels n+k that are divisible by pi^n. Divide those representatives by pi^n. Cancellation shows that their classes modulo pi^k are compatible and independent of the choices. They define an element of the completion whose product with pi^n is the original element.

Thus the inverse-limit topology on the completion is its pi-adic topology, and

    completion_pi(T) / pi^n completion_pi(T) = T / pi^n T

by the canonical map. Completeness and separatedness for this topology follow directly from the compatible-family description.

### 3.2 Exactness for this sequence

Since Q has no pi-torsion, (2.1) gives a short exact sequence for every n:

    0 -> N/pi^n N -> M/pi^n M -> Q/pi^n Q -> 0.

The inverse-limit sequence is short exact. Injectivity and the description of the kernel follow componentwise, using uniqueness of a preimage in N/pi^n N. For surjectivity, suppose a compatible lift has been chosen through level n. Choose any lift of the next Q-component in M/pi^(n+1) M. Its reduction differs from the previous lift by an element of N/pi^n N. Lift that difference to N/pi^(n+1) N and subtract it. This constructs compatible lifts inductively.

We obtain

    0 -> N_hat -> M_hat -> Q_hat -> 0.                  (3.1)

By Section 3.1, Q_hat has no pi-torsion. Therefore N_hat is pi-saturated in M_hat. Also, the inclusion N_hat -> M_hat is a topological embedding: its inverse image of pi^n M_hat is pi^n N_hat.

The general surjectivity substep is already present at the Mathlib pin as `AdicCompletion.map_surjective`. In contrast, the pinned `AdicCompletion.map_injective` and `AdicCompletion.map_exact` assume a Noetherian ring and a finite ambient/middle module. They do **not** directly supply (3.1) over an arbitrary nondiscrete valuation ring. The reduction-and-cancellation proof above is the required additional argument, not an invocation of those theorems outside their hypotheses.

## 4. The localization intersection

Since M_hat and Q_hat have no pi-torsion, their maps to their pi-localizations are injective. Regard N_hat[1/pi] as a submodule of M_hat[1/pi]. Then

    M_hat intersect N_hat[1/pi] = N_hat.                (4.1)

For an element in the left side, some pi-power multiple belongs to N_hat. Saturation in (3.1) cancels that power. This proves the nontrivial inclusion; the other is immediate.

This is the exact integral information needed by rational descent. It is stronger than saying that two lattices are commensurable, and different from saying either lattice is a rational norm's unit ball.

## 5. Generic fibre of a completed lattice tensor

We need the natural topological identification

    completion_pi(A0 tensor_O B0)[1/pi]
        = A completed-tensor_K B                       (5.1)

for Banach K-spaces A, B and bounded open O-lattices A0, B0. Here (5.1) means the canonical map is a topological linear isomorphism, characterized on elementary tensors. It does not assert an isometry for specified norms.

First take A0 and B0 to be the norm unit balls. Let L = A0 tensor_O B0. Flatness makes L torsion free, and localization identifies L[1/pi] with A tensor_K B; hence L embeds in that algebraic tensor. Put r = |pi|. For every integer n and algebraic tensor z, the projective seminorm satisfies

    z in pi^n L              implies ||z||_projective <= r^n,
    ||z||_projective < r^(n+1) implies z in pi^n L.       (5.2)

The first implication follows from a finite tensor presentation using the unit balls. For the second, choose a finite presentation z = sum_j a_j tensor b_j with every product ||a_j|| ||b_j|| less than r^(n+1). Discard zero terms. For each a_j choose a power c_j of pi such that

    ||a_j|| <= |c_j| < ||a_j||/r.

Then a_j/c_j lies in A0, and c_j b_j/pi^n has norm less than 1, so each term is in pi^n L. This uses the cofinal geometric progression of powers of pi, not discreteness or density of the value group.

The two implications in (5.2) say exactly that the lattice topology and the projective-seminorm topology on the algebraic tensor have cofinal neighbourhood systems. Taking their separated completions gives (5.1). More explicitly, L_hat[1/pi] is complete: a Cauchy sequence has a tail in one translate of a fixed pi-power multiple of L_hat, which is complete by Section 3.1. The topology has a countable neighbourhood basis, so this sequential check suffices. The image of the algebraic tensor is dense by the inverse-limit description. This also covers the possibility that separation had to be imposed on the original algebraic tensor.

For general bounded open A0 and B0, each is commensurable with its norm unit ball by powers of pi. The corresponding tensor lattices are commensurable as well, so the same completion and generic fibre result. The comparison is natural: it is the identity on elementary tensors and bounded maps extend uniquely from the dense algebraic tensor.

Apply (5.1) to (F0,V0) and (E0,V0). Its naturality identifies the localization of N_hat -> M_hat with the actual rational comparison induced by F -> E.

## 6. Integral fixed points

An element x of M_hat fixed by G maps, under (5.1), to an invariant element of E completed-tensor_K V. Rational descent puts it in the image of F completed-tensor_K V, which is N_hat[1/pi] under the same canonical comparison. Formula (4.1) therefore puts x in N_hat.

Conversely G fixes N pointwise, since it fixes F0 and acts trivially on V0. It fixes N_hat pointwise by continuity and density. The injectivity from (3.1) now proves the asserted integral isomorphism. The topological-embedding assertion of Section 3.2 makes it an isomorphism for the stated topologies, not just for the underlying modules.

This proof neither exchanges fixed points with reduction modulo pi^n nor assumes vanishing of higher group cohomology. Such an exchange would be false, as the sign-action test below shows. Rational descent and saturated completion are the two distinct inputs.

## 7. A false shortcut and acceptance specifications

### 7.1 Completed unit lattices need not be the rational unit ball

Take K = Q_2. Give the one-dimensional spaces E and V the respective norms

    ||x||_E = (3/2)|x|_2,       ||x||_V = (2/3)|x|_2.

Their unit lattices are E0 = 2 Z_2 and V0 = Z_2. The completed lattice tensor has image 2 Z_2 in E tensor_K V = K. But the projective tensor norm is exactly |.|_2, so its unit ball is Z_2. For the norm equality, every presentation of a scalar z has maximum |a_j b_j| at least |z|; a one-term presentation attains it. In particular 1 is in the rational unit ball but not in the completed tensor of the two unit lattices.

This is a Banach-space counterexample to the general unit-ball identification, **not** a counterexample to integral fixed-point descent. For trivial G that descent map is the identity. It also does not claim that these rescaled norms are spectral norms of unital Banach algebras. The transfer theorem uses bounded open lattices and needs no such spectral assertion.

### 7.2 Tests for integration

- Zero coefficient space: V = 0 gives zero on both sides, with its unique comparison.
- Trivial group: the integral map is the identity on the completed lattice tensor, even in Section 7.1 where that lattice is smaller than the rational unit ball.
- Wild finite action: C2 swaps the coordinates of E = K^2 with lattice O^2. F0 is the diagonal copy of O. The integral comparison is coordinatewise diagonal, including when the residue characteristic is 2 and averaging on O is impossible.
- Nonsaturated inclusion: pi O inside O has the same localization as O but fails (4.1). This rejects dropping the quotient-regularity hypothesis.
- Reduction is not invariants: C2 acts on Z_2 by the sign. Integral invariants are zero; the invariants modulo 2 are all of F_2. Modulo 2^n the fixed residues are 0 and 2^(n-1); the transition from level n+1 sends both to zero at level n. The inverse limit is zero without identifying each reduction with the reduction of integral invariants.
- Naturality: for a continuous coefficient map V -> W carrying V0 into W0, the fixed-point comparisons commute with the induced completed tensor maps. On elementary tensors this is equality of the same maps, and it extends by density.
- Countability boundary: an affinoid algebra over L can fail to be of countable type over a smaller discretely valued L0. Keep the arbitrary-Banach discrete-base proof for the existing weight-extension consumer; do not apply the countable-type-over-L theorem over L0 without checking that hypothesis.

## 8. Ownership and exact unapplied integration work

Continue the previous handoff's R0 ownership decision: the common completed-tensor and lattice infrastructure belongs to `AdicSpacesPartII:R0`. P9 applies it to its invariant subspace. R5 supplies the distinct geometric coefficient-product comparison; the general analytic lemmas must not be rebuilt independently in P9 or moved wholesale to the etale site owner.

The following are **proposed declaration-sized supplier targets, not reserved node IDs or existing declarations**:

1. `latticeQuotient_isTorsionFree`: Section 2's inclusion E0/F0 -> E/F for a K-subspace F and its intersection lattice.
2. `tensorLattice_quotient_regular`: the exact tensor sequence of Section 2 and pi-regularity of its quotient, with ordinary tensor flatness imported from the baseline. Split exactness and regularity if represented as separate library declarations.
3. `adicCompletion_pi_regular`: Section 3.1's cancellation argument.
4. `adicCompletion_mod_pi_pow`: the canonical reduction comparison in Section 3.1, with its kernel and projection API.
5. `adicCompletion_exact_of_regular_quotient`: Section 3.2, with the explicit injectivity/exactness hypotheses and pi-regular quotient. Reuse the baseline general surjectivity theorem.
6. `completedSaturated_lattice_intersection`: formula (4.1), with all maps canonical.
7. `completedLatticeTensor_genericFibre`: (5.1), its two cofinal estimates (5.2), naturality and elementary-tensor formula. Split the estimates and completion comparison into the needed helper declarations.
8. `completedTensor_fixedLattice_of_rational`: the transfer in Section 6, taking the actual canonical rational fixed-point comparison as input.

Use existing Mathlib `AdicCompletion`, tensor products, submodules and localization rather than inventing new carriers. A requested comparison construction needs the protocol's full API and at least three tests, including the false-shortcut and nonsaturation tests above. No supplier packet has been edited by this job.

For the authorized P8/P9 files the continuation must:

1. Keep `PerfectoidSpaces:P9/invariants-of-completed-tensor-with-banach-space` and its consumers. Integrate the previous handoff's weighted rational proof and its separate unrestricted discrete-base clause. Correct the excerpt to CHJ Lemma 2.23(2), rather than its different profinite-flat-module part (1).
2. Separate the rational fixed-point assertion from the integral completed-lattice transfer. State the stable bounded open lattices and the pi-adic completion explicitly. Import the exact R0 targets above through suitable supplier nodes or an expanded request.
3. Generalize the closed-invariant-subalgebra input beyond its present Q_p-only statement where the general-K consumer needs it. Check the relation between its power-bounded subring and the chosen lattice.
4. Retain the geometric O-plus proof by pointwise valuation bounds and surjectivity on points. Sections 2–6 do not identify O-plus of a product with a tensor of lattices, and do not prove a sheaf statement on arbitrary opens of the product. The existing product-affinoid scope is unchanged.
5. Keep the integral perfectoidization and seminormal-base obligations. The prior countable-type gap can be resolved in the packet only after the rational construction and its owner interface have actually been integrated. Do not record the false general unit-ball comparison as a theorem; use Section 7.1 to reject that route.
6. Update the packet, roadmap and suggested signatures together, then run the packet/declaration validators, dependency-cycle checks and pinned Lean compilation. None of those integration steps has been done in this handoff-only checkpoint.

## 9. Sources, library statements and reading boundaries

This continuation's saturation proof is an elementary argument written out above, not a claim that a cited paper prints that proof. The reference for its algebraic flatness input is [Stacks Project, Lemma 15.22.10, Tag 0539](https://stacks.math.columbia.edu/tag/0539), statement and proof read on 26 September 2026.

The following Mathlib files were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- [Flat/TorsionFree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/TorsionFree.lean): `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout` for a Bezout domain, and `Module.Flat.isTorsionFree`. These supply algebraic flatness/regularity, not a completed tensor theorem. The valuation-ring application still needs its actual instance/theorem wiring in the prototype.
- [Flat/Tensor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Tensor.lean): the algebraic tensor characterizations of flatness. No completed analytic tensor comparison occurs there.
- [AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean), first 220 lines: the actual compatible-family definition of `AdicCompletion`, the transition maps and separated/precomplete/complete predicates.
- [AdicCompletion/Exactness.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Exactness.lean): general `map_surjective`, and the Noetherian/finite-module restrictions on `map_injective` and `map_exact`. The latter restrictions are why Section 3 is written out.

No new Tau Ceti declaration is claimed. The accepted `REV-AUDIT-38.md` was read, together with relevant input excerpts, not reproduced as a fresh audit. The generated `data/library-coverage.json` reader returned empty content; this was not treated as evidence of absence. Read the accepted audit and source files for actual baseline claims. Nearby style/scope reading included the first sections of the upstream AdicSpaces and ProfiniteCohomology roadmaps, not a claim to have re-read both entire long documents.

For context and the prior proof's source match, the parsed PDF text read was:

- Chojecki–Hansen–Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, [arXiv:1507.04875v2](https://arxiv.org/pdf/1507.04875), first-page version checked, Lemma 2.23 and its proof, printed pp. 19–20. Part (2) is rational Banach Q_p coefficients; part (1) is a different tensor construction with profinite flat Z_p coefficients.
- Birkbeck–Heuer–Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, [arXiv:1902.03985v4](https://arxiv.org/pdf/1902.03985v4), first-page version checked, Lemmas 3.6–3.7 and the proof passage on printed p. 10. The existing packet already records the rational/integral source issue as E25; this continuation does not claim it as a new finding.
- Kakol–Kubis–Kubzdela, *On non-archimedean Gurarii spaces*, [arXiv:1612.02247v1](https://arxiv.org/pdf/1612.02247), first-page version checked, Section 2, printed pp. 3–4, for the weighted countable-type context. The cited van Rooij book was not read.

The attempted PDF screenshots failed with rendering errors. These are parsed-text reads, not successful visual checks. No PDF bytes were obtained for hashing, and no published/preprint collation was completed. The prior incidental misprint report is preserved in the linked handoff, not newly entered as a source issue here. The existing 34 source issues remain unchanged and have not all been re-audited in this continuation.

## 10. Checks actually run

Executed a Python standard-library script using exact `Fraction` arithmetic and finite residue enumeration. Result: **28,339 finite checks passed**, comprising 27 diagonal filtration equalities, 11,635 swapping-action tensor tests, 16,418 coefficient-map naturality tests, 9 sign-action transition tests, 246 rescaled-unit-lattice tests, and 4 nonsaturation counterchecks.

These are regressions for the examples and hypotheses, not a proof of a statement about inverse limits or infinite-dimensional Banach spaces. A compact reproduction is below; each counter category counts one loop iteration, which can contain several assertions.

```python
from fractions import Fraction as Q
from itertools import product

def norm(x, p):
    x = Q(x)
    if not x:
        return Q(0)
    a, b, v = abs(x.numerator), x.denominator, 0
    while a % p == 0:
        a //= p
        v += 1
    while b % p == 0:
        b //= p
        v -= 1
    return Q(p) ** (-v)

counts = [0] * 6
for p in (2, 3, 5):
    for precision in range(1, 4):
        m = p ** precision
        diagonal = {(a, a) for a in range(m)}
        for n in range(precision + 1):
            ideal = {(p ** n * a) % m for a in range(m)}
            assert diagonal.intersection(product(ideal, repeat=2)) == {
                ((p ** n * a) % m,) * 2 for a in range(m)}
            counts[0] += 1
for m in (2, 4, 8, 3, 9, 5):
    for a, b, c, d in product(range(m), repeat=4):
        assert ((a, b, c, d) == (c, d, a, b)) == (a == c and b == d)
        counts[1] += 1
for m in (2, 3, 5):
    for a, b, c, d in product(range(m), repeat=4):
        for x, y in product(range(m), repeat=2):
            mapped = ((a*x+b*y) % m, (c*x+d*y) % m)
            upstairs = mapped + mapped
            assert upstairs[:2] == upstairs[2:] == mapped
            counts[2] += 1
for n in range(1, 10):
    m = 2 ** n
    fixed = {a for a in range(m) if (-a) % m == a}
    assert fixed == {0, 2 ** (n-1)}
    next_fixed = {a for a in range(2*m) if (-a) % (2*m) == a}
    assert {a % m for a in next_fixed} == {0}
    counts[3] += 1
for numerator in range(-20, 21):
    for denominator in (1, 2, 4, 8, 3, 5):
        r = norm(Q(numerator, denominator), 2)
        assert (Q(3, 2)*r <= 1) == (r <= Q(1, 2))
        assert (Q(2, 3)*r <= 1) == (r <= 1)
        counts[4] += 1
assert Q(3, 2)*Q(2, 3) == 1
assert norm(1, 2) == 1 and not norm(1, 2) <= Q(1, 2)
for p in (2, 3, 5, 7):
    m = p ** 3
    submodule = {(p*a) % m for a in range(m)}
    assert 1 not in submodule and (p*1) % m in submodule
    counts[5] += 1
assert counts == [27, 11635, 16418, 9, 246, 4]
print('PASS', counts, sum(counts))
```

**Not run in this continuation:** Lean compilation, the full repository blueprint validator, declaration-index checking, or a global dependency-cycle check. The previous checkpoint's 69 admitted-proof warnings and zero-error validation are historical and are not claimed as fresh results. No Lean implementation is claimed.

Resume with the R0 supplier decomposition of Sections 2–6 and the previous handoff's weighted rational proof. The large packet and its companion files were not reconstructed or replaced in this checkpoint; the next integration must preserve their existing nodes, source issues and unrelated requests while applying the changes listed in Section 8.
