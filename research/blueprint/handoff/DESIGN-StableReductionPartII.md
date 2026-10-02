# DESIGN-StableReductionPartII — coefficient-relative exactness research checkpoint

Worker: ChatGPT — gpt-20261002-atlas-b73e. Refs #3342. Date: 2026-10-02.
Claim 5959304556; bot confirmation 5959308029. The issue was reread after confirmation.

## Status, preservation and exact contribution

This is a **handoff-only partial research checkpoint**, not a complete blueprint submission. It supplies explicit mathematical proofs for the actual polynomial model, together with fresh finite regressions. The roadmap, packet, reader and suggested Lean file are unchanged. No declaration, API, test contract, planet, baseline record or graph edge has been added to those files. No implementation or stage is certified.

The complete predecessor handoff, including its native coefficient-splitting proof archive, validation receipts and graph recipe, remains at the immutable merge of PR #5831:

https://github.com/CBirkbeck/tauceti-explorer/blob/18d7d3768b68d381b78021dcd84b4fe9114a8e98/research/blueprint/handoff/DESIGN-StableReductionPartII.md

The predecessor reports 125 nodes, 142 API items, 135 definition/construction tests plus two exactness tests, 35 planets, 73 baseline declarations, 135 requests and 14 gaps. Those are inherited counts, not fresh counts from a checker run here. Its canonical Lean proof archive remains at suggested-file revision 637b45159fc2451aa40ce5b5cf9a31ce755c646f. None of those historical compilation or axiom-audit results is attributed to this worker.

The new point is not just ordinary exactness over R, which was already planned. It is exactness after tensoring over the **coefficient ring A with any A-module L**, including non-flat modules. That proves the natural Hom exchange maps, the canonical bidual evaluation isomorphism and both positive-degree Ext vanishings for the polynomial section ideal. The calculations below also identify the existing two cokernel maps with their prescribed signs. This gives a direct polynomial-model route to the relative conditions; it does not prove the two-base completion or geometric descent statements.

## Fresh readings and their boundaries

- The issue and all its preceding comments, the predecessor handoff, and the relevant MC.2 reader statements were read. The reader blob was fd6c79e266a780096fe1040c229b7f69c7f87a8d. Existing IDs and maps are retained, including `StableReductionPartII:key/moduli-curves`.
- Knudsen, *A closer look at the stacks of stable pointed curves*, arXiv:1106.1588v2, §3, printed pp.11–12, was read from the parsed primary PDF: https://arxiv.org/pdf/1106.1588 . The matrix entries, skew rotation, cokernel signs and Proposition3.1 were checked against that text. Browser screenshot attempts for PDF pages9,10,11 failed; successful visual verification is **not** claimed. The published assumptions are noetherian A and unit discriminant. The broader polynomial-module argument below is an explicit derivation, not an attribution of that broader statement to the proposition.
- Ile, *Stably reflexive modules and a lemma of Knudsen*, arXiv:1110.3909v3, Definitions3.1 and3.4, Proposition3.5 with proof, and Remark3.6, printed pp.6–8, were read in the parsed primary PDF: https://arxiv.org/pdf/1110.3909 . Screenshot attempts for PDF pages5 and6 failed. Remark3.6 is the precise comparison with Knudsen's arbitrary-coefficient-module conditions. The general theorem is not silently imported with weaker hypotheses; the special case is proved below.
- At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, the actual statement and proof of `Polynomial.Monic.isRegular` in `Mathlib/Algebra/Polynomial/Monic.lean`, blob facebe38cd161f5df111d1885d9039377494cd53, were read. That theorem is about multiplication in a polynomial **ring**, not by itself the arbitrary-module assertion C1 below. It was already in the inherited baseline and is not a new planned definition.
- The parent StableReduction document's scope and conventions were checked: scheme-level curve theory is its input, not a moduli-stack properness theorem. A complete new audit of both pinned libraries, all suppliers and two entire nearby upstream documents was not performed. The failed earlier read of the oversized library-coverage file is not credited as a successful audit. No claim that the generic lemmas below are absent from the pins follows from this checkpoint.
- Bibliographic detail to preserve at integration: the publisher records DOI 10.1016/j.jpaa.2012.03.021 for Knudsen's article; the arXiv metadata's ending `.03.21` drops a zero. This is a metadata discrepancy, not an alleged error in the mathematical argument.

No PDF file hash was computed. All cited source-reading dates are 2026-10-02. The prior complete source inventories, accepted-audit receipts and source issues remain in the predecessor files; they are not replaced by this narrower reading record.

## Conventions

Keep the actual inherited model, over any commutative ring A:

- B=A[Y][X], q(X,Y)=X²+γXY+δY², F=q(X,Y)−q(s,t), and R=B/(F).
- u=[X], v=[Y], coefficient map ι:A→R, c=u−ι(s), d=v−ι(t), b=u+ι(s)+ι(γt), a=ι(δ)v+ι(δt)+ι(γ)u.
- J=(c,d), D=Hom_R(J,R), Φ=((a,b),(-c,d)), Ψ=((d,-b),(c,a)). Their lifts to B multiply in either order to FI₂, and cb+da=0 in R.
- Matrices act on columns. Dual coordinates are columns representing row functionals by transposition. H=((0,-1),(1,0)). Then Ψᵀ(-H)=(-H)Φ.

In C1–C6, P,Q denote either ordered pair of lifted matrices, or their transpose pair, and p,q their images over R. The letter q in these numbered paragraphs denotes the matrix map rather than the quadratic form. Set E=R², M=coker p, R_L=R⊗_A L and E_L=R_L². The distinction between tensoring over A and over R is essential. Zero rings and zero coefficient modules are included.

## C1. Monicity on arbitrary coefficient modules

**Statement.** Multiplication by F is injective on T_L=(B⊗_A L), for every A-module L. There is a canonical identification T_L/FT_L=R_L.

**Proof.** Identify T_L with finite-support polynomials in X having coefficients in the polynomial module L[Y]. Since F is monic of X-degree2, multiplying a nonzero element whose largest nonzero X-coefficient is at degree n gives that same nonzero coefficient at degree n+2. Thus the product cannot vanish. The zero module case is immediate. Right exactness of tensor applied to B --F--> B → R →0 gives the quotient identification, with its natural R-module action.

This argument uses finite polynomial support, not a highest-degree argument for a formal power series. It does not assume L is flat. Cancellation takes place in T_L **before** quotienting, not in R_L where F acts as zero.

## C2. Universal coefficient exactness

**Statement.** On E_L the alternating p,q complex is exact at every term. The same is true for the transposed complex.

**Proof.** Products vanish after quotienting. If p_L(z)=0, lift z to z̃ in T_L². There is w in T_L² with Pz̃=Fw. Apply Q to obtain Fz̃=FQw. C1 cancels F coordinatewise, giving z̃=Qw, so z belongs to im q_L. Interchange P,Q for the other equality. Their transposes also multiply in both orders to FI₂, so the same proof applies. This proves all four kernel/image equalities for every L.

For L=A this is precisely the already planned polynomial exactness argument. The extra assertion is its quantification over arbitrary coefficient modules. This is stronger than checking only fields or only flat coefficient changes.

## C3. The canonical cokernel description of the dual

**Statement.** There is an R-linear equivalence

θ:coker(pᵀ) → M*,    θ([λ])([z])=λᵀqz,

where M*=Hom_R(M,R).

**Proof.** Replacing z by z+pw changes the value by λᵀqpw=0. Replacing λ by λ+pᵀμ changes it by μᵀpqz=0. Thus the formula descends in both entries. Pullback along E→M identifies M* with ker pᵀ in E*. Under this identification θ is the map induced by qᵀ. C2 gives im qᵀ=ker pᵀ and ker qᵀ=im pᵀ, proving its surjectivity and injectivity. The formula proves linearity and uniquely specifies the equivalence.

The source here is coker(pᵀ), not coker(qᵀ). Confusing these introduces a parity error. The special node duality between coker Φ and coker Ψ uses the separate skew rotation in C8.

## C4. Arbitrary-module Hom exchange

**Statement.** For every A-module L the natural R-linear map

M*⊗_A L → Hom_R(M,R_L),    h⊗ℓ ↦ ([z]↦h([z])⊗ℓ),

is an isomorphism. The same assertion holds with M replaced by M*.

**Proof.** By right exactness, C3 identifies the source with coker(pᵀ_L). Since E is finite free, the target identifies with ker(pᵀ_L) in E_L*. Under these identifications the stated map is induced by qᵀ_L: on a pure representative [λ]⊗ℓ its value at [z] is (λᵀqz)⊗ℓ. C2 says its kernel before taking the quotient is im pᵀ_L and its image is the whole target. This proves the assertion for the **natural evaluation formula**, not merely existence of an abstract isomorphism. Apply the same reasoning to the transpose factorization, using C3, for M*.

Only finite freeness of E is used to identify Hom of E with two copies of the target. No claim that arbitrary Hom commutes with tensor is used as a premise.

## C5. Canonical biduality and both Ext vanishings

**Statement.** The evaluation map η_M:M→M**, η_M(m)(h)=h(m), is an isomorphism. For every A-module L and i>0,

Ext_R^i(M,R_L)=0 and Ext_R^i(M*,R_L)=0.

Moreover the composition M⊗_A L --η_M⊗1--> M**⊗_A L → Hom_R(M*,R_L) is the natural evaluation isomorphism.

**Proof of biduality.** Apply C3 to the transpose factorization. It gives θ_T:coker p→(coker pᵀ)* with θ_T([z])([λ])=zᵀqᵀλ. Pullback by θ identifies M** with (coker pᵀ)*. For all λ,z,

(θ*η_M([z]))([λ])=η_M([z])(θ([λ]))=λᵀqz=zᵀqᵀλ=θ_T([z])([λ]).

Thus θ*η_M=θ_T. Both θ* and θ_T are isomorphisms, so the actual η_M is an isomorphism. Tensor it with L and compose with C4 for M*; on m⊗ℓ the resulting map is h↦h(m)⊗ℓ.

**Proof of Ext vanishing.** Augment the alternating free resolution with E→coker p. Applying Hom_R(-,R_L) gives the alternating transposed maps on E_L. C2 makes its cohomology zero in every positive degree. For M*, C3 supplies the analogous free resolution from the transposed factorization, and C2 applies again. This requires the usual theorem computing Ext from a projective resolution; it is a shared homological-algebra input, not a newly defined Ext functor.

## C6. Coefficient flatness and arbitrary ring changes

**Statement.** M and M* are flat over A. For any ring map A→A′, the actual mapped polynomial model satisfies all of C1–C5. Its cokernel is canonically A′⊗_A M, and its dual is canonically A′⊗_A M*. For every A′-module L′ one obtains

M*⊗_A L′ ≅ Hom_{R′}(A′⊗_A M,R′⊗_{A′}L′)

with the pure-tensor evaluation formula, and the corresponding positive Ext vanishings for the base-changed module and its dual.

**Proof.** Monic normal form makes R free over A on v^n and uv^n. Consequently the free R-resolution in C5 is also an A-free resolution. Tensoring it with every L is exact in positive degrees by C2, so Tor_1^A(M,L)=0 for every L. The standard flatness criterion proves A-flatness; apply the transpose argument to M*. This is an alternative mathematical route, not a replacement for the predecessor's checked section-ideal retraction proof.

Coefficient mapping identifies A′⊗_A R with the actual R′: the monomial normal forms agree, and on pure tensors the map is a′⊗r↦ι′(a′)φ(r), which respects multiplication. Right exactness identifies the mapped cokernels. The exchange isomorphism C4 with L=A′, followed by extension/restriction-of-scalars adjunction, is the canonical dual base-change map. Equivalently, apply the representative formula of C3 to the mapped matrices. Repeat C1–C5 over A′ and use tensor associativity for L′. Identity, composition and evaluation compatibility follow on pure tensors and quotient representatives. No flatness or injectivity of A→A′ is needed.

For noetherian A, these are exactly the three relative conditions quoted in Ile Remark3.6: natural dual exchange, natural double-dual exchange, and both Ext vanishings for all coefficient modules. Directly using Definition3.4, A-flatness and the same argument over every residue field also prove relative stable reflexivity for this polynomial cokernel. This special proof does not establish the general criterion for unrelated families.

## C7. Transport to the actual section ideal

**Statement.** The existing map coker Ψ→J, [z₀,z₁]↦cz₀−dz₁, is an R-linear equivalence. Thus C4–C6 apply to J and its **actual** R-linear dual D, with their canonical evaluation maps.

**Proof.** Monic normal form R=A[Y]⊕uA[Y] shows d=v−ι(t) is regular: multiplication by Y−t is injective on each polynomial summand. Let σ=(c,-d):E→J. It is surjective because c,d generate J, and σΨ=0 by cb+da=0. Put κ=((0,-1),(-d,b)). It is injective: κ(x,y)=0 first gives y=0, then dx=0, hence x=0. Direct multiplication gives κΦ=((c,-d),(0,0)). If σz=0, then κΦz=0, so Φz=0 and C2 with L=A gives z∈im Ψ. This identifies the kernel of σ and proves the stated cokernel equivalence.

The equivalence is specified by the given generators, hence commutes with coefficient mapping. Transport of Hom and biduality is through this actual map. In particular the exchange for J is h⊗ℓ↦(j↦h(j)⊗ℓ), not a chosen isomorphism of modules of the same rank.

## C8. The existing dual generator and its cokernel signs

**Statement.** The denominator-free ε:J→R defined by dε(j)=bj exists uniquely. Under the existing dual cokernel equivalence coker Φ→D, the class [w₀,w₁] is w₀ incl−w₁ε.

**Proof.** For j=cx+dy set ε(j)=−ax+by. Multiplication by d gives bj. If two expressions give the same j, regularity of d makes their proposed values equal. It follows that ε is R-linear, ε(c)=−a and ε(d)=b, and its defining equation gives uniqueness.

For C3 take p=Ψ and q=Φ. The invertible matrix -H intertwines Φ with Ψᵀ, so it induces coker Φ≅coker Ψᵀ. Compose this with θ and the dual of C7. If λ=-Hw=(w₁,-w₀), the functional pulled back to E is

λᵀΦz=(w₀c+w₁a)z₀+(-w₀d+w₁b)z₁.

This is exactly (w₀ incl−w₁ε)(cz₀−dz₁). Surjectivity of E→J identifies the functional. Thus the resulting equivalence is the pre-existing `section-dual-cokernel` map, with [1,0]↦incl and [0,1]↦−ε. It is not a differently signed surrogate. This gives a route to that cokernel map without assuming the full normal-coordinate equivalence of D in advance.

## Boundaries, integration and next work

The arguments above settle the stated polynomial-model mathematical assertions, but they have **not** been translated into checked Lean or integrated as declaration nodes. In particular:

- Reuse `node-factorization-exact`, `section-dual-generator`, `section-dual-cokernel`, the existing ideal cokernel and the inherited canonical tensor adapters. Do not duplicate their carriers, maps or reserved IDs. C7–C8 are proofs of those maps, not new competing constructions.
- The arbitrary-module monic lemma, coefficient exactness, quotient duality, canonical biduality and Hom/Ext computations are separate proof obligations. Match them against the reviewed pins and existing supplier nodes before adding nodes. General matrix-factorization/MCM theory still belongs to StablePeriodicCurved, layer7; the proposed PartII ownership change remains unapproved. This note makes no ownership decision and adds no supplier edge.
- A coefficient module L is not an arbitrary R-module. Sending all coordinates to zero in a receiving ring can make both matrices zero, although their product is still zero; exactness then fails. The same distinction prevents an unwarranted R-flatness or R-projectivity claim.
- No highest-degree polynomial argument has been applied to formal power series. Complete the two-base completion comparison, Proposition7's exercise, pointed completed-local hull, actual nodal-family identification and coefficient-compatible faithful descent. The generic Appendix theorem and unrelated family cases remain separate inputs even though the special polynomial case now has a direct proof.
- The dual normal-equivalence/scalar-correction/residue and tensor signatures still require implementation. The direct route above may simplify the proof dependencies, but it does not delete their required APIs or tests.
- Carry three discriminating cases into the eventual node tests: a non-flat coefficient module over Z/4, characteristic two with unit discriminant, and degenerate discriminant where the algebra remains valid but the geometry is not nodal. Test the exact pure-tensor exchange formula, canonical bidual evaluation and negative second cokernel generator, not merely existence of some equivalence.
- Run the indexed blueprint checker and the combined stage/declaration/request graph checks after integration. They were **not run** for this handoff-only change. Neither Lean nor Lake is available in this environment; no compiler, cache download, setup, library build or server was run.
- All MC.0–MC.7 moduli, positivity, fine-level, determinant/Deligne-pairing, Picard/Torelli, arbitrary-base approximation and source-collation gaps from the predecessor remain required. No stage or shared geometric key is closed.

## Fresh executable regressions

The following Python program was run in this session. It checks 20 finite coefficient-module fixtures, including three non-flat Z/4→Z/2 cases; 80 exactness equalities; 20 canonical dual-quotient cases; 5,620 canonical evaluation formula checks; 20 skew-rotation cases; and a receiving-ring counterexample. There are 11,240 vector visits across the four exactness checks, not 11,240 distinct modules.

These finite rings additionally impose Y^k=0 so that exhaustive enumeration is possible. F remains monic in X on the lifted coefficient module. Thus they test C1–C6's factorization mechanism, **not** C7's section-ideal identification: Y−t need not remain regular after this additional truncation. The code never infers the geometric or untruncated ideal claim from these finite models.

Source SHA-256: `1622409e3e996f765c63aee7699a85cbc27a78b6887a9e605648b1c9d9025497`.
Output SHA-256: `aabe98897e321defe5f5e08d1628efeb87c4312fd83239c837a49a72ce15b695`.
Extract the following block verbatim with its final newline and run `python relative_factorization.py`.

```text
{
  "canonical_dual_quotient_cases": 20,
  "coefficient_module_cases": 20,
  "evaluation_formula_checks": 5620,
  "exactness_equalities": 80,
  "nonflat_Z4_to_Z2_cases": 3,
  "receiving_ring_counterexamples": 1,
  "skew_rotation_cases": 20,
  "tested_vectors": 11240
}
PASS: coefficient-module exactness, dual quotient and canonical evaluation regressions
```

```python
"""Finite regression models for coefficient-relative matrix factorization.
The Y-truncated rings test cokernels, NOT the section-ideal identification.
No finite test is a proof of the polynomial or sheaf statements.
"""
from itertools import product
from collections import Counter
import hashlib
import json


class Model:
    def __init__(self, modulus, y_order, gamma, delta, s, t):
        assert modulus >= 1 and y_order >= 1
        self.m, self.k = modulus, y_order
        m, k = modulus, y_order
        self.elements = list(product(range(m), repeat=2*k))
        self.index = {v: i for i, v in enumerate(self.elements)}
        self.zero = self.index[(0,)*(2*k)]
        def elt(coeffs):
            return self.index[tuple((coeffs[i] if i < len(coeffs) else 0) % m
                                    for i in range(2*k))]
        self.one = elt([1])
        self.x = elt([0]*k + [1])
        self.y = elt([0, 1]) if k > 1 else self.zero
        def conv(a, b):
            return [sum(a[i]*b[n-i] for i in range(n+1)) % m for n in range(k)]
        c0 = [(s*s + gamma*s*t + delta*t*t) % m] + [0]*(k-1)
        if k > 2:
            c0[2] = -delta % m
        c1 = [0]*k
        if k > 1:
            c1[1] = -gamma % m
        self.add = []
        self.mul = []
        for u in self.elements:
            self.add.append([self.index[tuple((a+b) % m for a, b in zip(u, v))]
                             for v in self.elements])
            row = []
            for v in self.elements:
                a, b, c, d = u[:k], u[k:], v[:k], v[k:]
                ac, ad, bc, bd = conv(a, c), conv(a, d), conv(b, c), conv(b, d)
                bd0, bd1 = conv(bd, c0), conv(bd, c1)
                w = [(ac[i]+bd0[i]) % m for i in range(k)]
                w += [(ad[i]+bc[i]+bd1[i]) % m for i in range(k)]
                row.append(self.index[tuple(w)])
            self.mul.append(row)
        self.neg = [self.index[tuple(-x % m for x in v)] for v in self.elements]
        self.const = lambda n: elt([n])
        add, mul, neg, C = self.add, self.mul, self.neg, self.const
        self.c = add[self.x][neg[C(s)]]
        self.d = add[self.y][neg[C(t)]]
        self.b = add[add[self.x][C(s)]][C(gamma*t)]
        self.a = add[add[mul[C(delta)][self.y]][C(delta*t)]][mul[C(gamma)][self.x]]
        self.P = ((self.a, self.b), (neg[self.c], self.d))
        self.Q = ((self.d, neg[self.b]), (self.c, self.a))
        self.vectors = list(product(range(len(self.elements)), repeat=2))
        assert self.mul[self.x][self.x] == add[add[C(s*s+gamma*s*t+delta*t*t)]
            [neg[mul[C(gamma)][mul[self.x][self.y]]]]][neg[mul[C(delta)][mul[self.y][self.y]]]]

    def apply(self, matrix, vector):
        return tuple(self.add[self.mul[row[0]][vector[0]]]
                     [self.mul[row[1]][vector[1]]] for row in matrix)

    def dot(self, u, v):
        return self.add[self.mul[u[0]][v[0]]][self.mul[u[1]][v[1]]]


def transpose(matrix):
    return tuple(zip(*matrix))


counts = Counter()
fixtures = [
    (1,1,0,0,0,0),
    (2,1,1,0,0,0),
    (2,2,1,0,0,0),
    (2,2,0,0,0,0),
    (3,1,0,1,1,1),
    (4,1,1,0,1,0),
    (4,1,0,0,1,1),
    (4,2,1,0,1,1),
    (6,1,1,0,1,1),
]
for m,k,gamma,delta,s,t in fixtures:
    # For m=4,k=2 we test the non-flat target Z/2, not all 4^8 source vectors.
    divisors = [2] if (m,k)==(4,2) else [d for d in range(1,m+1) if m%d==0]
    for d in divisors:
        R = Model(d,k,gamma,delta,s,t)
        P,Q = R.P,R.Q
        z = (R.zero,R.zero)
        for F,G in ((P,Q),(Q,P),(transpose(P),transpose(Q)),(transpose(Q),transpose(P))):
            kernel = {v for v in R.vectors if R.apply(F,v)==z}
            image = {R.apply(G,v) for v in R.vectors}
            assert kernel == image, (m,k,d,F)
            assert all(R.apply(F,R.apply(G,v))==z for v in R.vectors)
            counts['exactness_equalities'] += 1
            counts['tested_vectors'] += len(R.vectors)
        # For M=coker(P), theta([lambda])([v]) = lambda^T Q v.
        # The two values on the standard R-basis of v are Q^T lambda.
        PT,QT = transpose(P),transpose(Q)
        relations = {R.apply(PT,v) for v in R.vectors}
        zero_functionals = {v for v in R.vectors if R.apply(QT,v)==z}
        all_functionals = {v for v in R.vectors if R.apply(PT,v)==z}
        represented = {R.apply(QT,v) for v in R.vectors}
        assert relations==zero_functionals and represented==all_functionals
        assert len(R.vectors)//len(relations)==len(all_functionals)
        counts['canonical_dual_quotient_cases'] += 1
        # Check the canonical evaluation formula, not an arbitrary bidual bijection.
        for lam in ((R.one,R.zero),(R.zero,R.one)):
            for v in R.vectors:
                assert R.dot(lam,R.apply(Q,v))==R.dot(v,R.apply(QT,lam))
                counts['evaluation_formula_checks'] += 1
        # The skew rotation intertwines the stated matrices, including signs.
        minus_H = ((R.zero,R.one),(R.neg[R.one],R.zero))
        for v in R.vectors:
            assert R.apply(QT,R.apply(minus_H,v))==R.apply(minus_H,R.apply(P,v))
        counts['skew_rotation_cases'] += 1
        counts['coefficient_module_cases'] += 1
        counts['nonflat_Z4_to_Z2_cases'] += (m==4 and d==2)

# Product=0 by itself does not give exactness in an arbitrary receiving ring.
R = Model(2,1,1,0,0,0)
zero_matrix = ((R.zero,R.zero),(R.zero,R.zero))
assert {R.apply(zero_matrix,v) for v in R.vectors} != set(R.vectors)
counts['receiving_ring_counterexamples'] += 1
print(json.dumps(dict(sorted(counts.items())), indent=2))
print('PASS: coefficient-module exactness, dual quotient and canonical evaluation regressions')
```
