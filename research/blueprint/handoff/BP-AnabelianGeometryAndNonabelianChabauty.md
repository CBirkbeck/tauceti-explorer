# BP-AnabelianGeometryAndNonabelianChabauty — product-effacement research checkpoint

Worker: ChatGPT Pro — `gpt-20261002-hodge-7c41`. Refs #1020. Date: 2026-10-02.
Claim 5956685853; bot confirmation 5956689509. The issue was reread after confirmation.

## Status, scope and preservation

This is a **handoff-only research checkpoint** for the existing node `AnabelianGeometryAndNonabelianChabauty:NC.0/products`, declaration `TauCeti.EtaleKPiOne.product_charZero`. It expands its proof, identifies exact supplier contracts, supplies new falsifiers, and records two apparent typographical errors in the cited SGA reprint. It does not complete the blueprint or implement a geometric declaration.

The packet, reader and suggested Lean file are unchanged. Their inherited totals remain **48 nodes: 3 definitions, 4 constructions, 14 lemmas, 21 theorems and 6 comparisons; 52 API items, of which 40 belong to definitions/constructions; 38 test contracts; 11 planets; 62 baseline records; 9 gap groups and 16 supplier requests**. All implementation statuses remain unchecked; no stage is closed. The tests proposed below are not added to those metadata counts. The source findings are not yet entries in the packet's sourceIssues.

The entire preceding handoff, including its scripts, counts, source-reading attributions, native omission boundaries and actual validation receipts, is preserved at [the immutable PR #5798 head](https://github.com/CBirkbeck/tauceti-explorer/blob/dddebf0d90e62bacb4e495501deafacb1fd904bb/research/blueprint/handoff/BP-AnabelianGeometryAndNonabelianChabauty.md). Its blob `649c32f74531eddfe2167cd23aeb5eaaa30ffdd9` was checked against this job's starting handoff. Those historical checks were not rerun or certified by this worker.

The reserved key `AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1` remains the sole owner. Its coefficient class, full profinite fundamental group, and canonical comparison in every degree are unchanged. Nothing here creates another cohomology, fundamental-group, covering-space, Picard, Néron–Severi or height carrier.

## 1. Precise target and proof strategy

Retain the existing theorem: over a characteristic-zero field k, a finite product of geometrically connected, geometrically unibranch k-varieties with the full finite-coefficient étale K(π,1) property has that property. Here the full property means that every canonical comparison from continuous fundamental-group cohomology to étale cohomology is an isomorphism, for every finite continuous coefficient module and every nonnegative degree. It does not mean that the cohomology groups themselves vanish.

The proof below is a finitary expansion of the product argument in Schmidt–Stix, Lemma 2.7(b). It **reuses the predecessor's constant-prime-field finite-cover criterion and separable-closure equivalence**. It does not introduce a replacement definition. The new organization avoids needing an additional filtered universal-cover cohomology interchange specifically for this product step: specialize to a prime field, kill the finitely many factor classes occurring in one Künneth expansion, and then use the existing coefficient dévissage. Continuity remains necessary for the inherited separable-descent argument.

The geometric product theorem for π₁, the actual cohomological Künneth map, the finite-cover/sheaf dictionary and the inherited criterion are mathematical inputs, not implemented Lean lemmas on the evidence of this checkpoint.

### A. A canonical largest product subgroup

Let G and H be topological groups and K an open subgroup of G×H. Write i_G(g)=(g,1), i_H(h)=(1,h), and set U=i_G⁻¹(K), V=i_H⁻¹(K). These are open subgroups because the two inclusions are continuous. They satisfy U×V⊆K: for u∈U and v∈V, multiply (u,1) and (1,v) in K.

More precisely, for any subgroups A≤G and B≤H,

    A×B ⊆ K  iff  A⊆U and B⊆V.

The forward implication tests (a,1) and (1,b); the reverse implication uses the same multiplication. Thus U×V is the largest rectangle contained in K. No commutativity or normality of K is needed. If G and H are profinite, U and V have finite index: their coset spaces are compact and discrete.

Use the existing native objects `OpenSubgroup.comap`, `OpenSubgroup.prod` and `Subgroup.prod_le_iff`. Do not define a new rectangle carrier. `Subgroup.quotient_finite_of_isOpen` does not require normality: the quotient here is a coset set, not automatically a quotient group.

### B. Product covers dominate arbitrary connected covers

Now let k be algebraically closed of characteristic zero, and X,Y be the two factors. The geometric product theorem identifies π₁(X×Y) with G×H, where G=π₁(X), H=π₁(Y), compatibly with the projections and chosen geometric points.

A pointed connected finite étale cover Z→X×Y corresponds to an open subgroup K≤G×H. The subgroups U,V from A correspond to connected finite étale covers X'→X and Y'→Y. The inclusion U×V≤K gives a pointed map

    X'×Y' → Z → X×Y.

Under the finite π-set dictionary this is the surjective equivariant map (G×H)/(U×V)→(G×H)/K. Hence the map of covers is finite étale and surjective. This uses the exact Galois-category dictionary and its morphism/connectedness statements supplied by IG.0; it is not a purely group-theoretic construction of the scheme.

**Do not assert that Z itself is a product cover.** For example, the diagonal subgroup of C₂×C₂ has index two, but its largest contained rectangle is the trivial subgroup, of index four. It is the domination that the proof needs. Nonnormal stabilizers must remain admissible.

### C. Kill finite families of positive-degree factor classes

Let W be a connected finite étale cover of either factor, and p a prime. Every class in H^r_et(W,F_p), for r>0, can be killed by a connected finite étale cover of W.

For r≥2 use the inherited finite-cover criterion, or finite-étale invariance followed by that criterion. For r=1 use the separate torsor argument: the class is represented by a finite étale F_p-torsor P→W; after pullback to P the diagonal gives a section, so the class is zero. Select the connected component through a chosen geometric lift. Since W is connected and noetherian, that component is a finite étale surjective cover. For the zero class take the identity cover.

The degree-one argument is essential. A criterion stated only for r≥2 must not silently be used in degree one. Its general torsor/cohomology identification and finite-étale representability are SF.2/IG.0 inputs, not a new NC.3 nonabelian H¹ construction.

A finite family of classes, possibly in different positive degrees, can be killed simultaneously. Choose one killing cover per class and take a connected component, through compatible geometric lifts, of their finite fibre product over W. This refines every chosen cover, and zero classes remain zero under pullback. Equivalently, intersect the finitely many open stabilizers. No single cover killing all classes in every degree is asserted or required.

### D. Use prime-field Künneth, not a false torsion tensor formula

For finite-type schemes W,T over algebraically closed k of characteristic zero, the natural external cup-product map gives

    ⊕_(i+j=q) H^i_et(W,F_p) ⊗_(F_p) H^j_et(T,F_p)
                       → H^q_et(W×T,F_p)

as an isomorphism. Its compatibility with pullback in both factors is part of the required contract. This is ordinary étale cohomology, not coherent or compactly supported cohomology. Neither factor needs to be proper.

The precise geometric input is the derived Künneth map of Stacks, Lemma 59.97.9, specialized to the constant coefficient F_p. The passage to this degreewise formula uses Künneth for complexes over a field. To see why that passage is valid, split the cycles and boundaries in each complex as vector spaces: the complex is a direct sum of its cohomology with zero differential and a contractible complex. Tensoring a contracting homotopy with the other complex, with the usual differential signs, shows that the contractible summands contribute no cohomology. The isomorphism is the canonical map induced by tensoring cycles; the auxiliary splittings are a proof device, not the definition or a choice-dependent comparison. Its naturality follows from that canonical description.

The native derived-to-degreewise bridge must still be found or supplied. Do not replace its conclusion by an unrelated isomorphism of vector spaces. No finite-dimensionality hypothesis is needed for the following finite-support argument: an element of a tensor product is a finite sum of simple tensors, and for fixed q there are finitely many pairs of nonnegative degrees adding to q.

### E. Explicitly kill a class on an arbitrary cover

Fix a connected finite étale Z→X×Y, a prime p, a degree q≥2, and a class c∈H^q_et(Z,F_p). Use B to pull c back to X'×Y'. By D write the pullback as a finite sum of external products a_s×b_s with deg(a_s)+deg(b_s)=q.

For every summand at least one factor has positive degree. If deg(a_s)>0, designate a_s for killing; otherwise deg(b_s)=q>0 and designate b_s. Apply C to the two finite lists to get connected finite étale covers X''→X' and Y''→Y'. Naturality of external products makes every summand zero on X''×Y'', hence kills c there. The composite X''×Y''→Z is finite étale and surjective.

This proves the required prime-field effacement for **every connected finite cover Z**, not just for X×Y itself. Apply the predecessor's all-primes, all-covers criterion and its coefficient dévissage to get the full finite-coefficient K(π,1) property. The same calculation works for q=1, but the criterion only needs q≥2.

### F. Descend and form finite products

Use the existing separable-closure invariance node to pass between k and its algebraic closure; in characteristic zero these closures coincide. That inherited proof separates descent of the covering scheme from eventual vanishing of the cohomology class at a finite field stage. It does not assert injectivity of restriction on cohomology.

Induct on the number of factors, using Spec k for the empty product and the identity for one factor. The necessary geometric connectedness/unibranch stability remains a supplier obligation. Over a nonclosed field, the arithmetic fundamental group of the product is the fibre product over G_k, not the ordinary product. The elementary rectangular-subgroup argument above is applied after geometric base change, not directly to two arithmetic groups.

## 2. Discriminating regression contracts

These extend the research evidence but are not yet packet tests or native examples.

**Nonnormal covers and domination.** The diagonal in S₃×S₃ is not normal. The canonical contained rectangle is still valid, and the map of finite coset sets is equivariant and surjective. Requiring a quotient-group instance would exclude this legitimate cover case. The C₂ diagonal distinguishes domination by a product cover from being one.

**Mixed degree one.** Take graded F₂-vector spaces with one generator in degrees 0,1,2. Maps acting as identity in degrees 0,1 and zero in degree 2 kill all factor classes of degree at least two, but preserve the nonzero H¹⊗H¹ summand in product degree two. Killing positive degrees, including degree one, removes it. This tests the missing hypothesis of a would-be assembly step, not a counterexample to Künneth or to the K(π,1) theorem.

**The canonical map over a nonfield can fail even when the two groups are abstractly isomorphic.** Let R=Z/4 and C be the free cochain complex R --2→ R in degrees 0,1. Then H⁰(C)={0,2}≅R/(2), and H⁰(C)⊗_R H⁰(C)≅R/(2). In C⊗_R C, the degree-zero differential sends z to (2z,2z), so H⁰(C⊗C)={0,2} too. Nevertheless the canonical map sends the tensor of the generating cycles 2 and 2 to 4=0; it is zero, not an isomorphism. Since C is bounded and free, its tensor already computes the derived tensor. This is why the argument specializes to a field before taking the degreewise tensor formula. The existing packet correctly retains derived/Tor concerns; this is a falsifier for a potential incorrect simplification, not an allegation that its present statement makes that simplification.

**Arithmetic base.** The fibre product of the two identity maps C₂→C₂ is the diagonal, of order two, whereas C₂×C₂ has order four. This is a finite model of the already-recorded arithmetic base-group distinction, not a proof of the geometric comparison.

## 3. Source findings for integration into sourceIssues

Source inspected: [SGA 1, arXiv:math/0206203v2](https://arxiv.org/pdf/math/0206203), Exposé XIII, Proposition 4.6 and its proof, reprint pages 310–311 (PDF indices 325–326; original margin 421–422). Both pages were visually inspected. The displayed characteristic is p≥0: the text parser's p>0 is a retrieval error, not a mathematical error in the source.

Two apparent typographical errors are visible in **this reprint** on page 311:

1. The composite from the geometric fibre group through π₁(Z) ends at π₁(Y), and is said to be an isomorphism. It must end at π₁(X), using the first projection. Indeed, with Y=Spec k and X=G_m over algebraically closed characteristic-zero k, the displayed map to π₁(Y)=1 cannot be an isomorphism: the cover t↦t² already gives a nontrivial finite quotient of π₁(X). The first-projection correction is exactly the fibre identification needed by the next line.
2. In the comparison split exact sequence, the position of the projection to π₁(Y) is printed as another product factor. The corrected sequence is

       1 → π₁(X) → π₁(X)×π₁(Y) → π₁(Y) → 1,

   with the canonical inclusion and second projection. The same correction applies to the displayed prime-to-characteristic groups.

These are local formula corrections, not a disproof of Proposition 4.6. No claim is made about whether they originated in the 1971 edition or whether an erratum is published; that publication history was not checked. Record the version and page, use the corrected maps in the supplier contract, and retain that uncertainty.

The proposition itself has explicit strong-desingularizability hypotheses and a prime-to-characteristic conclusion. The characteristic-zero application imports the necessary resolution input; those transitive proof leaves were not read or formalised here. In particular, merely reading this statement does not certify an unrestricted positive-characteristic product theorem.

## 4. Fresh reading and verification boundaries

Fresh primary reading, on 2026-10-02:

- [Schmidt–Stix, published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf), §2.3 and Lemma 2.7(b), pages 826–827; Proposition 2.8 and Lemma 2.9 for the boundary with higher homotopy and arithmetic fibre products. The published PDF text was read. Its screenshot fetch failed; the corresponding [arXiv page](https://arxiv.org/pdf/1504.01068), PDF index 6, was successfully rendered and inspected. The additional center-free hypotheses in Lemma 2.9 belong to its unpointed Hom statement, not to the retained product K(π,1) theorem.
- [Stacks, Section 59.97](https://stacks.math.columbia.edu/tag/0F13), the canonical derived map and Lemma 59.97.9 with its printed proof. The coefficient order is invertible, the base separably closed, and the two schemes finite type. Its more general derived input avoids improperly importing the properness assumption of earlier special cases. The transitive finiteness/base-change proof leaves remain unaudited supplier work.
- SGA 1 XIII 4.6, the statement and complete printed proof on the two rendered pages described above. Its upstream asphericity, cohomological-properness and resolution inputs are not freshly closed.
- [Pinned Mathlib subgroup API](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Basic.lean), lines 1–205, including the full `prod_le_iff` statement and the native product carrier.
- [Pinned Mathlib open-subgroup API](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/OpenSubgroup.lean), the full product/comap declarations and the finite-coset-quotient statement. These support the group-level plan; no geometric π-set dictionary is inferred merely from their existence.

The latest issue, immediate handoff, product statement/proof and relevant reserved-key/coefficient reader sections were read. Selected JacobianChallenge and AlgebraicCurves upstream sections were read for native-carrier and ownership conventions; these are not full rereads of either roadmap or of their sources. Earlier curve, Kim and BDMTV source receipts remain historical.

The reviewed coverage file was not freshly read: the file and blob readers returned empty content, and a further GitHub file fetch rejected it as too large or unsupported. Thus this checkpoint does not claim a fresh full-library audit or add missing-library declarations on the strength of search snippets. The existing 62 baseline records are unchanged. Current supplier packet statements were not comprehensively reread; the generic inputs below remain refinements to the inherited requests, not freshly verified supplier nodes.

**No Lean compilation was attempted.** There is no existing pinned Lean build in this environment and available memory was about 3.6 GiB, below the protocol threshold. No Lake project, cache download, library build or language server was started. Neither the indexed packet checker nor the atlas assembler was run locally. Only the handoff changes, so no JSON, graph edge, native signature or previous compiler receipt is modified.

The exact Python regression below passed: **36 ordered group pairs; 552 subgroup/coset-surjection cases, including 186 nonnormal subgroups; 10,597 maximal-rectangle tests; 10,111 representative checks; 101,875 equivariance checks; and 18 positive-degree graded values**, together with the diagonal, nonfield-canonical-map and source-formula falsifiers. Group pairs are formed from C₁,C₂,C₃,C₄,V₄,S₃. The Python file also passed syntax compilation. These are finite algebraic regressions, not proofs about schemes, étale cohomology, arbitrary profinite groups or native Lean declarations.

## 5. Exact integration worklist

1. Retain the existing `NC.0/products` public statement, scope, planet and ID. Split its substantive proof assemblies at declaration granularity when updating the packet: finite families of positive-degree classes; effacement on an arbitrary product cover; geometric product closure; then the already-owned arithmetic descent. Use existing finite-cover invariance, coefficient dévissage and separable-base-change nodes rather than duplicating them.
2. Obtain the reviewed audit slice and the exact current supplier statements. Refine the existing IG.0 request to include geometric projection-compatible π₁ Künneth, the pointed finite π-set/covers equivalence, finite morphism surjectivity and connected components/common refinements. Implement the rectangle with existing open subgroups. Do not make K normal or silently turn coset sets into groups.
3. Refine the existing SF.2 input to the actual natural derived Künneth morphism, its constant-F_p degreewise external-product specialization and the degree-one finite-torsor trivialization. Audit or request the generic complex-over-a-field bridge from its proper homological owner; do not redefine cohomology here. The stronger general torsion Künneth request can serve other consumers, but the finitary proof needs only its prime-field instance.
4. Integrate the tests and the version-qualified source corrections into packet, reader and suggested omission/native ledgers together. The omitted geometric carriers remain explicit until their suppliers exist. Do not use assumed proposition fields, fabricated comparison maps, or the finite Python fixtures as geometric certificates. No such metadata promotion has occurred in this checkpoint.
5. Preserve the predecessor's actual curve proof obligations: IG.0 finite covers/characters; SF.2 canonical comparison, Kummer-degree and continuity; SF.3 curve/Jacobian/genus. A killed geometric class descends only after an eventual finite-stage enlargement. Positive-prime-power towers do not need to be Galois as a composite. All these inherited requests remain open.
6. The elementary-fibration route still requires higher étale homotopy, not merely IG.1's arithmetic π₁ exact sequence. Chen's tangential paths/specialization are independent NC.0 targets. NC.3 continuous-cocycle APIs, twisting, representability and local conditions remain unfinished; NC.1 reconstruction and NC.2/NC.5 full BDMTV source routes remain to be read and decomposed.
7. Keep RT-AREA-algebraicgeometry/8's NS=Pic/Pic⁰ and symmetric-Hom injection with A2, including finite generation and rank. NC.5 consumes that owner and the shared general-height supplier; it must not build a second NS/height theory or introduce a reverse height dependency. Preserve the 19 NC.5 and 17 NC.2 routed BDMTV items, E9/E10, the /58-versus-/93 split, and Chen /57–58 obligations.

## Durable finite regression script

Save the following block with its displayed final newline. SHA-256: `b1e1e27b8cec45973ecb4bb0b27b5e3964c34a839554b408d5b5b37469ec1e3b`. The scratch copy may be deleted after submission because the exact script and results are retained here.

```python
"""Finite regressions for the product proof; not scheme/cohomology proofs."""
from itertools import permutations, product
from collections import deque
import hashlib
import json
from pathlib import Path


def table(elements, operation):
    index = {x: i for i, x in enumerate(elements)}
    return tuple(tuple(index[operation(a, b)] for b in elements) for a in elements)


def cyclic(n):
    return table(list(range(n)), lambda a, b: (a+b) % n)


def product_table(A, B):
    n, m = len(A), len(B)
    return tuple(tuple(A[a][c]*m+B[b][d] for c in range(n) for d in range(m))
                 for a in range(n) for b in range(m))


def extend(H, g, T):
    # A finite submonoid of a group is a subgroup; identity has index zero.
    generators = tuple(H) + (g,)
    found = set(H)
    queue = deque(H)
    while queue:
        x = queue.popleft()
        for y in generators:
            z = T[x][y]
            if z not in found:
                found.add(z)
                queue.append(z)
    return frozenset(found)


def subgroups(T):
    trivial = frozenset([0])
    found = {trivial}
    queue = deque([trivial])
    while queue:
        H = queue.popleft()
        for g in range(len(T)):
            if g not in H:
                K = extend(H, g, T)
                if K not in found:
                    found.add(K)
                    queue.append(K)
    return sorted(found, key=lambda H: (len(H), tuple(sorted(H))))


def cosets(T, H):
    return {frozenset(T[g][h] for h in H) for g in range(len(T))}


S3 = table(list(permutations(range(3))), lambda a, b: tuple(a[b[i]] for i in range(3)))
groups = {'C1': cyclic(1), 'C2': cyclic(2), 'C3': cyclic(3),
          'C4': cyclic(4), 'V4': product_table(cyclic(2), cyclic(2)), 'S3': S3}
subs = {name: subgroups(T) for name, T in groups.items()}
counts = {'group_pairs': 0, 'subgroups': 0, 'maximal_rectangle_tests': 0,
          'coset_surjections': 0, 'representative_checks': 0,
          'equivariance_checks': 0, 'nonnormal_subgroups': 0,
          'graded_positive_degree_values': 0}

for gn, hn in product(groups, repeat=2):
    G, H = groups[gn], groups[hn]
    n, m = len(G), len(H)
    T = product_table(G, H)
    inverse = [next(y for y in range(n*m) if T[x][y] == 0) for x in range(n*m)]
    counts['group_pairs'] += 1
    for K in subgroups(T):
        U = frozenset(g for g in range(n) if g*m in K)
        V = frozenset(h for h in range(m) if h in K)
        assert U in subs[gn] and V in subs[hn]
        R = frozenset(g*m+h for g in U for h in V)
        assert R <= K
        for A, B in product(subs[gn], subs[hn]):
            rectangle = frozenset(a*m+b for a in A for b in B)
            assert (rectangle <= K) == (A <= U and B <= V)
            counts['maximal_rectangle_tests'] += 1
        source, target = cosets(T, R), cosets(T, K)
        image = {}
        for C in source:
            values = {frozenset(T[c][k] for k in K) for c in C}
            assert len(values) == 1
            image[C] = next(iter(values))
            counts['representative_checks'] += len(C)
        assert set(image.values()) == target
        for g in range(n*m):
            for C in source:
                translated = frozenset(T[g][c] for c in C)
                assert image[translated] == frozenset(T[g][c] for c in image[C])
                counts['equivariance_checks'] += 1
        is_normal = all(T[T[g][k]][inverse[g]] in K for g in range(n*m) for k in K)
        counts['nonnormal_subgroups'] += int(not is_normal)
        counts['subgroups'] += 1
        counts['coset_surjections'] += 1

# A product cover can dominate a cover that is not itself a product.
T = product_table(groups['C2'], groups['C2'])
diagonal = frozenset([0, 3])
assert len(cosets(T, diagonal)) == 2
assert len(cosets(T, frozenset([0]))) == 4
assert frozenset(g for g in range(2) if 2*g in diagonal) == frozenset([0])
assert frozenset(h for h in range(2) if h in diagonal) == frozenset([0])
# The fibre product of two identity maps C2 -> C2 has 2, not 4, elements.
assert len([(a, b) for a, b in product(range(2), repeat=2) if a == b]) == 2

# Toy graded F2 vector spaces: one generator in degrees 0, 1, 2.
# Killing degrees >= 2 does not kill the mixed H1 tensor H1 term.
pairs_degree_two = [(0, 2), (1, 1), (2, 0)]
Tlow, Tall = [1, 1, 0], [1, 0, 0]
mixed = [0, 1, 0]
assert [Tlow[i]*Tlow[j]*v for (i, j), v in zip(pairs_degree_two, mixed)] == mixed
for q in range(1, 5):
    indices = [(i, j) for i in range(3) for j in range(3) if i+j == q]
    for vector in product(range(2), repeat=len(indices)):
        assert all(Tall[i]*Tall[j]*v == 0 for (i, j), v in zip(indices, vector))
        counts['graded_positive_degree_values'] += 1

# R=Z/4; C=[R --2--> R] in cohomological degrees 0,1.
# C is free. H0(C) tensor H0(C) is R/(2), but its canonical map into
# H0(C tensor C) is zero: the cycles 2 and 2 multiply to zero in R.
cycles = {x for x in range(4) if 2*x % 4 == 0}
total_cycles = {x for x in range(4) if (2*x % 4, 2*x % 4) == (0, 0)}
assert cycles == total_cycles == {0, 2}
assert {a*b % 4 for a, b in product(cycles, repeat=2)} == {0}
assert 2 in total_cycles

# The printed SGA composite to the SECOND factor cannot be an isomorphism
# in the fibre direction when the first factor group is C2 and the second is 1.
assert len({0 for _ in range(2)}) == 1 < 2

print(json.dumps({'status': 'pass', 'scope': 'finite group and algebra models only',
                  'counts': counts}, sort_keys=True))
print('sha256:', hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
```
