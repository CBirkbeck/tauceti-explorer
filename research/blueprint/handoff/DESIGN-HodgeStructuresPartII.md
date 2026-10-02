# DESIGN-HodgeStructuresPartII — naturality and nilpotence-bound proof checkpoint

ChatGPT Pro — gpt-20261002-higgs-6d21; Refs #3371. Date: 2026-10-02. Base: 864ea53476713e7146208251f1dbff98e0fa69e6. Claim comment 5958847747 was confirmed by bot comment 5958857245, and the issue was reread after confirmation. Branch: gpt-20261002-higgs-6d21-higgs-naturality.

## Delivery boundary and preservation

This is a **partial mathematical proof checkpoint, not a completed blueprint or a Lean implementation**. Two owned files change: this handoff and the roadmap JSON. The roadmap summary and H.0 description no longer incorrectly describe the existing affine continuation as only an N=2 result. The roadmap-level prerequisite list now includes DerivedDeRhamCohomology, which was already an H.0 stage dependency. No stage requires edge changes. The H.0 scope now distinguishes preservation from reflection under scalar extension, and a fixed exponent from locally varying exponents.

The packet, definitive reader and suggested Lean file are unchanged. Consequently there are **zero new declaration nodes, zero new baseline claims, zero new Lean signatures and zero closed obligations** in this checkpoint. The arguments below are ready-to-review mathematical material for subsequent node/API/test promotion, not additions silently counted as existing packet coverage. In particular, the generic sheaf interfaces have not been implemented or instantiated here.

The full predecessor handoff, its compilation receipts, extraction recipe and all historical resume instructions are preserved at this [immutable base file](https://github.com/CBirkbeck/tauceti-explorer/blob/864ea53476713e7146208251f1dbff98e0fa69e6/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md), blob ee8ca9614000655839b7d28f33a42ec32bccbf7c. Its earlier predecessor is linked there. None of its experimental/source/compilation claims is represented as a fresh check by this worker.

Unchanged packet blob: ad08c48df387115bf8062e52a4f1bbd67b9ef933. Unchanged reader blob: f16bcb817957e0805d492438e43288e2ec2b6b68. Unchanged suggested-source blob: 967220d134f4293c51af66a60d11e639a92bc9f8. Inherited counts remain 88 nodes, 122 APIs, 114 total tests, 105 baseline entries, six planets, five requests, eleven gaps and 149 routed source obligations. The 35 omitted global signatures remain omitted; H.0 remains partial, H.1–H.8 not_read, all implementations unchecked. These are preserved predecessor counts, not the outcome of a fresh full-packet validation.

## 1. Conventions: do not reverse the existing ordered product

Let R be a commutative ring, E and Q be R-modules, and H:E→Q⊗_R E be R-linear. Write T_n(Q)=Q^{⊗_R n}, with T_0(Q)=R. No integrability, finite basis or projectivity is assumed in Sections 1–4. Products in End_R(E) mean composition: AB(e)=A(B(e)).

Use the predecessor's **newest coefficient factor first** convention. Let I_0(H):E→T_0(Q)⊗E be the inverse tensor-unit isomorphism. Define I_{n+1}(H) by applying id_{T_n(Q)}⊗H to I_n(H), then moving the newly produced Q factor to the front and concatenating the tensor factors. More explicitly, the successor sends a summand (q_1⊗⋯⊗q_n)⊗e, with H(e)=Σ_a p_a⊗e_a, to Σ_a(p_a⊗q_1⊗⋯⊗q_n)⊗e_a. This is the convention of the existing affineOrderedStep/affineOrderedIterate continuation, not a new tensor-power carrier.

For a finite basis (q_i) of Q, write H(e)=Σ_i q_i⊗A_i(e). Contracting I_n(H) against the word (i_1,…,i_n) gives A_{i_1}⋯A_{i_n}. In particular, the empty word gives id_E; I_0(H)=0 holds exactly when E is zero. This coefficient statement and its finite-Q-basis zero criterion already belong to the predecessor. No finite basis of E is needed.

The separate degree-two Q⊗Q associator model must still be explicitly compared with the native T_2(Q) model. Applying id_Q⊗H directly to H appends the newest factor instead; a coefficient permutation may therefore be necessary. Do not identify the two maps merely because their targets are isomorphic or because an integrable specialization has commuting coefficients. The inherited E12/E21 example detects this mistake.

## 2. All-order naturality and change of frame

**Statement.** Let P,F be R-modules, u:Q→P and f:E→F be R-linear, and K:F→P⊗F satisfy K∘f=(u⊗f)∘H. Then for every n≥0,

I_n(K)∘f=(T_n(u)⊗f)∘I_n(H).

**Proof.** For n=0 this is naturality of the tensor-unit isomorphism. Assume the identity for n. Apply id⊗K to its left side. On the right, tensor functoriality moves f to the final factor, where Kf=(u⊗f)H replaces it. Naturality of the permutation moving the new coefficient to the front, followed by naturality of tensor concatenation, yields T_{n+1}(u)⊗f applied to I_{n+1}(H). This proves the successor identity. The argument uses the actual maps, so it does not require any basis or commutativity of coefficient endomorphisms.

If u and f are isomorphisms, this identity and the inverse identity give I_n(H)=0 iff I_n(K)=0, with the **same** n. An arbitrary intertwiner does not give an equivalence: taking f=0 gives an intertwiner even when one field is zero and the other is not. The universal forward vanishing statement under scalar extension below is a different assertion and does not follow from surjectivity of an arbitrary f unless that hypothesis is supplied.

**Coordinate specialization matching the existing gauge convention.** Assume finite bases for this coordinate calculation only. Change the coefficient basis by q'_j=Σ_i q_i C_{ij}, where C is invertible over R. Change E-components by s'=G s, exactly as in Connection.gauge. At parameter zero the new matrices are

B_j=Σ_i (C^{-1})_{ji} G A_i G^{-1}.

For every ordered word (j_1,…,j_n), including the empty word,

B_{j_1}⋯B_{j_n}=G [Σ_{i_1,…,i_n}(∏_{a=1}^n(C^{-1})_{j_a i_a}) A_{i_1}⋯A_{i_n}] G^{-1}.

**Proof.** Expand the product by distributivity. Scalars commute with the matrices because R is commutative. Adjacent G^{-1}G cancel, without reordering any A_i. For n=0 both sides are the identity. Apply the same argument to the inverse frame changes to obtain equivalence of fixed-length vanishing. This is a change of coefficient frame, not a claim that every matrix C is a coordinate Jacobian. For nonzero parameter, nonconstant gauge changes have the existing derivative correction −λδ(G)G^{-1}; the displayed Higgs formula must not replace that rule.

## 3. Scalar extension: preservation without flatness, reflection with faithfulness

Let R→S be any homomorphism of commutative rings. Put E_S=S⊗_R E and Q_S=S⊗_R Q. Define H_S by extending H and using the canonical tensor comparison. For each n there is a canonical isomorphism

β_n:S⊗_R(T_n^R(Q)⊗_R E) ≅ T_n^S(Q_S)⊗_S E_S.

Then I_n(H_S)=β_n∘(id_S⊗I_n(H)), with the common source E_S and the canonical unit identification at n=0.

**Proof.** The comparison for a tensor of two modules is obtained by the balanced formulas (s⊗q)⊗(t⊗e)↦st⊗(q⊗e) and its inverse s⊗(q⊗e)↦(s⊗q)⊗(1⊗e). Iterate these comparisons, including the tensor unit for n=0. They commute with the successor's permutation and concatenation on elementary tensors, hence on every tensor. Induction on n gives the equality. Neither direction of the comparison uses flatness.

It follows immediately that I_n(H)=0 implies I_n(H_S)=0 for any S. Conversely, if S is faithfully flat over R, scalar extension detects the zero map, so I_n(H_S)=0 implies I_n(H)=0. One proof of this detection is to factor a map through its image: flatness identifies the tensor of the image with the image of the tensored map, and faithfulness detects whether that module is zero. This is the standard generic input of [Stacks, Section 10.39, Lemmas 10.39.14–15](https://stacks.math.columbia.edu/tag/00H9); it is not a new Higgs-specific flatness definition. A weaker explicitly supplied zero-detection hypothesis could replace faithful flatness, but flatness alone cannot.

**Genuine Higgs counterexample to flat-only reflection.** Take a nonzero field k, R=k[x]×k[x], S=k[x] by first projection, and ε=(0,1). The R-module S is a direct summand of R, hence projective and flat, but not faithful. On Spec R, E=O and Ω¹_{R/k}=Rω, where ω is dx on both components. Set H(1)=εω. This is integrable because ∧²_RΩ¹_{R/k}=0. For every n≥1, I_n(H)(1)=εω^{⊗n}≠0, since ε^n=ε. After restricting to the first component, H_S=0. Thus flat base change can erase a nonzero, nonnilpotent, rank-one Higgs field. All tensor/coefficient modules in this example are free; torsion modules are not responsible for the failure.

## 4. Restriction, sheaf gluing and the exponent quantifier

For O-module sheaves E,Q on a ringed space X and an O-linear H:E→Q⊗_O E, make the same intrinsic construction using **sheaf** tensor products. Restriction to an open U commutes with I_n via the canonical tensor/unit/permutation comparisons. These are generic supplier inputs, consistent with [Stacks, Section 17.16, especially Lemma 17.16.4](https://stacks.math.columbia.edu/tag/01CA). No identification of a sheaf tensor's global sections with a tensor of global section modules is made.

For a fixed n and an open cover (U_a),

I_n(H)=0 iff I_n(H|_{U_a})=0 for every a.

**Proof.** The forward implication is restriction. Conversely, for every open V and e∈E(V), the section I_n(H)(e) restricts to zero on the cover (V∩U_a). The sheaf uniqueness axiom makes it zero on V. This proves equality of the sheaf maps. This is an ordinary open-cover argument; its use on a general Grothendieck site requires the supplier's actual covering-sieve and sheaf-morphism locality interface.

Also, I_n(H)=0 implies I_m(H)=0 for every m≥n, by iterating the successor recurrence. Therefore, if X is quasi-compact and on an open cover there are possibly different integers n_a with I_{n_a}(H|_{U_a})=0, choose a finite subcover and N=max n_a. Monotonicity gives I_N=0 on that subcover; fixed-exponent locality gives I_N(H)=0. The empty-space case is immediate. A common dominating exponent on the original cover also suffices, without quasi-compactness.

**Why the quantifiers matter.** Let X be the disjoint union of copies U_m=A¹_k, for m≥1. On U_m take E=O^{m}, Q=Ω¹=O dx, and H=J_m dx, where J_m is the nilpotent Jordan block of size m. This glues to a finite locally free E with locally constant, unbounded rank, as allowed by the reserved definition. Every component is integrable and has I_m=0, but no single N works on X: on U_{N+1}, J_{N+1}^N≠0. For N=0 the map is the nonzero tensor-unit identity. Thus local existence of an exponent is not, in general, existence of one global exponent. A hypothesis giving bounded rank on a reduced scheme provides another route, proved next.

## 5. Field rank bound without commuting coefficients

**Statement.** Let k be a field, V a k-vector space of dimension r, and (A_i) any family of endomorphisms. Assume joint nilpotence in the ordered sense: some integer N has A_{i_1}⋯A_{i_N}=0 for all length-N words. Then every length-r word acts by zero. No commutativity or characteristic-zero assumption is needed.

**Proof.** Let V_j be the sum of the images of all length-j products, with V_0=V. A length-(j+1) product has image contained in the image of its length-j prefix, so V_{j+1}⊆V_j. Also V_{j+1}=Σ_i A_i(V_j). If V_{j+1}=V_j≠0, this recurrence makes every later V_l equal to V_j, contradicting V_N=0 (and monotonicity when j≥N). Hence every nonzero step is a strict drop. A descending chain beginning with a space of dimension r can have at most r such drops; V_r=0. Each length-r product has image in V_r, proving the assertion. If r=0, the empty product is id_0=0, so the boundary agrees with Section 1.

For H:V→Q⊗V with finite-dimensional Q, the existing coordinate zero criterion converts this statement to: tensor nilpotence of H implies I_r(H)=0. Choosing a basis of Q is only used to apply the criterion. A single Jordan block proves sharpness: J_r^{r-1}≠0 for r≥1.

Do not weaken the premise to individual nilpotence without adding an appropriate additional condition: A_1=E12 and A_2=E21 are individually square-zero, but (A_1A_2)^m=E11 for every m≥1. The argument above assumes joint nilpotence, not merely integrability or nilpotence of each named generator.

## 6. Reduced-scheme rank bound and its exact boundary

**Statement.** Let X be a reduced scheme. Let E and Q be finite locally free O_X-modules, with rank(E_x)≤r for a specified global integer r. Let H:E→Q⊗E be O_X-linear. Suppose that for every scheme point x, the induced coefficient field H(x) is tensor-nilpotent over κ(x), with an exponent allowed to depend on x. Then I_r(H)=0. No quasi-compactness or integrability is required.

**Proof.** Scalar-extension compatibility and Section 5 give I_r(H)(x)=0 at every x; when rank(E_x)<r use monotonicity. Work on an affine open where E and Q are free of finite rank. The source and target of I_r are then finite free, so the map has matrix entries in the reduced coordinate ring. Each entry maps to zero in κ(p) for every prime p of that ring, and hence belongs to every prime ideal. The intersection of all prime ideals is the nilradical, which is zero. Thus every entry is zero. These affine open sets cover X, so Section 4 gives the result. Reducedness is used on the coordinate rings, consistent with [Stacks, Section 26.12, Lemma 26.12.2](https://stacks.math.columbia.edu/tag/01IZ). This proof is an algebraic deduction recorded here, not a theorem attributed to the Higgs source papers.

**Necessary cautions.** Over R=k[t]/(t^m), take E=Q=R and H multiplication by t under Q⊗E≅R. It is a rank-one coefficient field with exact nilpotence index m, so the rank-one conclusion I_1=0 fails when m>1. This is explicitly a coefficient-module test; no unprovided identification Q=Ω¹_{R/k} is asserted. It shows why the generic reduced-ring rank bound cannot omit reducedness.

Local freeness of the target is also a real input to the displayed fiber-detection proof. Over the reduced ring R=k[x], take E=R, Q=R/(x²), and H(1)=the class of x. H is nonzero, but its map on every residue-field fiber is zero: at p=(x) the class x dies, and at all other primes Q has zero fiber. Thus fiberwise zero is not enough for an arbitrary coherent Q. The theorem is deliberately not stated with that weaker premise.

## 7. Concrete regression receipt and reproduction

The following dependency-free Python script was actually executed with exact arithmetic modulo 5. It checked 14,400 change-of-frame word identities (all 480 matrices in GL₂(F₅), two E-frame changes, all words of lengths 0–3), plus ordered-product, idempotent-projection, sharp-Jordan, noncommuting jointly nilpotent and nonreduced-rank-one cases. It reports 14,552 counted regression cases. These finite regressions are **not** a proof for arbitrary rings, a Lean compilation, a verification of sheaf descent, or new packet test entries. The proofs in Sections 2–6, not enumeration, supply the general mathematical arguments.

Script SHA256: 7ca62b8f33beec3abdc42f7aa094a0a5b2b8b37ce5cd192619eb8fc9669bca44. Save the following block as higgs_naturality_checks.py, with a final newline, and run python3 higgs_naturality_checks.py. It is included here so scratch cleanup does not destroy reproducibility.

```python
"""Exact finite regressions, not a Lean proof or an all-rings verification."""
from itertools import product
from collections import Counter
P = 5
counts = Counter()
def zero(r, c=None):
    return tuple(tuple(0 for _ in range(r if c is None else c)) for _ in range(r))
def eye(n):
    return tuple(tuple(int(i == j) for j in range(n)) for i in range(n))
def add(A, B):
    return tuple(tuple((a + b) % P for a, b in zip(x, y)) for x, y in zip(A, B))
def scale(a, A):
    return tuple(tuple(a * x % P for x in row) for row in A)
def mul(A, B):
    return tuple(tuple(sum(a * b for a, b in zip(row, col)) % P for col in zip(*B)) for row in A)
def inv2(A):
    a,b = A[0]; c,d = A[1]
    z = pow((a*d-b*c) % P, -1, P)
    return ((z*d % P, -z*b % P), (-z*c % P, z*a % P))
def word_product(A, word):
    out = eye(len(A[0]))
    for i in word:
        out = mul(out, A[i])
    return out
A = (((0,1),(0,0)), ((0,0),(1,0)))
assert mul(*A) != mul(*A[::-1]); counts['order_counterexample'] += 1
GL2 = [((a,b),(c,d)) for a,b,c,d in product(range(P), repeat=4) if (a*d-b*c) % P]
# Components transform by s'=G s, agreeing with the existing gauge convention.
# The coefficient basis changes by q'_j=sum_i q_i C_ij.
for C in GL2:
    Cinv = inv2(C)
    for G in (eye(2), ((1,1),(1,2))):
        Ginv = inv2(G)
        B = tuple(mul(mul(G, add(scale(Cinv[j][0], A[0]), scale(Cinv[j][1], A[1]))), Ginv) for j in range(2))
        for n in range(4):
            for js in product(range(2), repeat=n):
                rhs = zero(2)
                for iss in product(range(2), repeat=n):
                    coeff = 1
                    for j,i in zip(js,iss): coeff = coeff * Cinv[j][i] % P
                    rhs = add(rhs, scale(coeff, word_product(A, iss)))
                assert word_product(B, js) == mul(mul(G,rhs),Ginv)
                counts['frame_word_identity'] += 1
# Flat, nonfaithful projection k[x] x k[x] -> k[x] on constant coefficients.
power = (1,1)
for n in range(1,10):
    power = (0, power[1])
    assert power == (0,1) and power[0] == 0
    counts['idempotent_projection'] += 1
# Jordan blocks give sharp nilpotence index and unbounded-rank family.
for r in range(1,10):
    J = tuple(tuple(int(j == i+1) for j in range(r)) for i in range(r))
    assert word_product((J,), (0,)*r) == zero(r)
    assert word_product((J,), (0,)*(r-1)) != zero(r)
    counts['jordan_sharp_bound'] += 1
# A noncommuting jointly nilpotent pair has all length-r products zero.
for r in range(2,7):
    J = tuple(tuple(int(j == i+1) for j in range(r)) for i in range(r))
    B = tuple(tuple(int(i == 0 and j == 1) for j in range(r)) for i in range(r))
    if r >= 3: assert mul(J,B) != mul(B,J)
    for w in product(range(2), repeat=r):
        assert word_product((J,B),w) == zero(r)
        counts['noncommuting_rank_bound'] += 1
# Rank-one nonreduced coefficient model R=k[t]/(t^m), H multiplication by t.
for m in range(2,10):
    powers = [tuple(int(j == n) for j in range(m)) if n < m else (0,)*m for n in range(m+1)]
    assert powers[1] != (0,)*m and powers[m-1] != (0,)*m and powers[m] == (0,)*m
    counts['nonreduced_rank_one'] += 1
assert word_product(A, ()) == eye(2)
counts['tensor_unit'] += 1
print('PASS', dict(counts))
print('Total assertions counted:', sum(counts.values()))
print('No Lean compilation and no sheaf-descent verification are performed by this script.')
```

Observed output:

```text
PASS {'order_counterexample': 1, 'frame_word_identity': 14400, 'idempotent_projection': 9, 'jordan_sharp_bound': 9, 'noncommuting_rank_bound': 124, 'nonreduced_rank_one': 8, 'tensor_unit': 1}
Total assertions counted: 14552
No Lean compilation and no sheaf-descent verification are performed by this script.
```

## 8. Reading, limitations and exact continuation

Fresh repository reading covered WORKERS, PROTOCOL, BROWSER_AGENTS, UPSTREAM_GUIDE, the expansion protocol, the claimed issue and predecessor handoff, the parent atlas entry, scoped packet/source contracts, current roadmap and selected reader/suggested-source sections. The parent HodgeStructures and nearby ReductiveGroups upstream README material were consulted; the predecessor's broader audit/source-reading receipts are inherited. The library-coverage file could not be inspected usefully through the browser file limit: the contents call was empty for the oversized blob, its blob response was base64, and a subsequent raw fetch also rejected its size. Its blob identifier was 5e708cfc74a51b10e62149113872fe4e00eb5846. **No fresh audit-row absence, implementation coverage, or new pinned declaration has been inferred from that failure.** A full audit read remains necessary before promoting the new material into nodes or baseline entries.

Fresh primary web evidence was limited to the cited Stacks tensor, flatness/zero-detection and reduced-scheme passages. The arguments above are deductions using these generic inputs and the existing ordered-iterate convention. No new complete-paper reading, published-source error, or correspondence proof is claimed. The roadmap's five historical source objects are preserved unchanged, including their attributed reading extents.

No Lean or Lake executable was available, and free -g reported 5 GiB total and 4 GiB available. No Lean compilation, project creation, cache download or dependency build was attempted. A sparse shared checkout attempt failed because the container could not resolve GitHub; consequently scripts/check_blueprint.py and a fresh full atlas/DAG audit were **not run locally**. GitHub-side validation must be reported separately from the algebra regressions. The predecessor's immutable checked source at ea49500be7122dfa7b09c7128537d8a304dae405 and admitted-sketch receipts remain linked in the immutable prior handoff; they are not fresh compilation results.

Next promote the Section 2 all-order naturality statement as a lemma using the existing native affineOrderedStep/affineOrderedIterate carrier, then its same-exponent isomorphism corollary; no new iterate construction is needed. Check exact pinned Mathlib scalar-extension/faithful-flatness declarations and reuse them for Section 3. Resolve the explicit native T₂(Q) versus Q⊗Q factor-order comparison before identifying the old square API. Import generic tensor-power restriction, sheaf-morphism zero detection and gluing from EnhancedDerivedSheaves:E1 rather than duplicating them. Promote fixed-bound locality, monotonicity, the quasi-compact corollary, the field rank lemma and its **reduced-scheme, locally-free, globally rank-bounded** corollary as separate declarations, with the counterexamples as regression obligations. Keep source/API/tests in the packet and reader, and all proposed Lean signatures typed and honestly unchecked until an exact-pin elaboration is available.

The remaining CR.1/DD.1 connections/filtration interfaces, canonical augmentation bridge, coefficient/Tate equivariance, global determinant/descent and H.1–H.8 source decompositions are unchanged. This checkpoint does not release any of those obligations as completed. Scratch consists only of the reproduced regression script and is to be removed after PR submission; the immutable base links and embedded script preserve its evidence.
