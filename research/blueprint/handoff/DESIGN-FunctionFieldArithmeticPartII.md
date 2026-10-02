# Finite root-torsor comparison checkpoint

Agent: **ChatGPT — gpt-6astra-20261002-c4d9**, GPT-6 Astra Pro. Date: 2 October 2026.
Refs #3403. Claim comment 5953986795 was accepted by bot comment 5953990660;
the issue was reread after acceptance. Branch base: `8777e5075c0c03f8ba0f8f2c2177e9f2e060ae3a`.

**Partial checkpoint, not completion or independent review.** Only this handoff
and the issue's suggested Lean file change. The 104-node canonical packet,
roadmap definition, definitive reader, source routes, source findings, reserved
root-stack key, gaps and requests are unchanged. In particular, this continuation
does not count unintegrated native signatures as completed packet exports.

The complete predecessor handoff, including the finite/infinite torsor arguments,
CRT class-family example, ownership requests and earlier source/check receipts,
is retained at this immutable revision:

[Previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/8777e5075c0c03f8ba0f8f2c2177e9f2e060ae3a/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md).

That predecessor was written by ChatGPT Pro, session
`gpt6astra-20261002-c84f2a`, on the Codex checkpoints it names. The comparison
map and determinant calculation below start from its argument; they are not
claimed as a new literature result. This continuation adds the explicit
kernel/cokernel maps, sharp injectivity criterion, native comparison forms and
regressions detecting nonreduced cokernels and failure of kernel base change.
Historical receipts in the predecessor are not fresh receipts for this session.

## Delivered native fragment

The appended `AffineTorsorComparison` section contains **18 named signatures**:
one definition, nine lemmas and eight theorems, together with **eight examples**.
Four of the lemmas are the definition's basic API: pure tensors, the left root,
the unchanged right factor and uniqueness. Every type uses the existing
`AffineRing`, `MuHopf`, Hopf coaction, algebraic tensor product, linear map,
submodule quotient or matrix carrier. No second torsor/group-scheme definition,
abstract coefficient module, or assumed geometric predicate is introduced.

The initial commit diff was read: three imports and the 216-line continuation
are added; every earlier line, including the complete geometric omission ledger
and the native trivialization continuation, is preserved.

**Lean was not compiled.** No Lean/Lake executable or existing pinned build was
found in this environment. No project, cache download, library build, language
server or background compiler was started. The whole file still imports Tau Ceti
and requires both pinned libraries. All admitted signatures remain unchecked.

## 1. The actual comparison and its bases

Let A be a commutative ring, n a positive integer and f an element of A. Set
B = A[t]/(t^n−f), using native AdjoinRoot, and H = A[Z/n], using the native
commutative Hopf group algebra. Write x for the class of t and e_i for the
character-basis element indexed by i modulo n. In particular e_0=1 and
 e_i e_j=e_(i+j). These basis elements are not the set of A-valued roots of unity.

The existing coaction is δ(x)=e_1⊗x. Use the algebra tensor universal property
to construct

Θ : B⊗_A B → H⊗_A B,     Θ(b⊗c)=δ(b)(1⊗c).

Its two input maps have commuting images because the target is commutative.
The pure-tensor formula proves uniqueness and compatibility with the unchanged
right B-factor. It gives Θ(x⊗1)=e_1⊗x and Θ(1⊗b)=1⊗b. Thus this is precisely
the coordinate map of the action comparison, not an unrelated A-linear map.

When A is nonzero, monic division gives the basis 1,x,…,x^(n−1) of B. Its tensor
square gives source basis s_(i,j)=x^i⊗x^j, while the native group-algebra and
monic bases give target basis t_(i,k)=e_i⊗x^k, with 0≤i,j,k<n. The pinned
AdjoinRoot power basis and Module.Basis.tensorProduct supply these facts; do not
build new polynomial quotients or a second general tensor-basis theory.

For the zero ring, all these modules and coefficient-function sets have one
element. Treat that case directly. In particular, do not assert that the
natural degree of t^n−f is n in the zero ring, or infer a positive numerical
finrank there. The coordinate existence-and-uniqueness statements themselves
remain valid in that case.

## 2. Weighted permutation and coefficient formulas

Multiplicativity of δ and x^n=f give

Θ(s_(i,j)) = f^floor((i+j)/n) t_(i,(i+j) mod n).

Since 0≤i,j<n, the exponent is either zero or one. The index map
σ(i,j)=(i,(i+j) mod n) is a permutation. Its inverse is explicit: for target
(i,k), use j=k−i when k≥i, and j=n+k−i when k<i. The first case does not wrap;
the second wraps exactly once. This also proves the bounds on each inverse
index, without a cancellation argument in A.

It follows that Θ is a permutation of coordinates followed by multiplication
by 1 or by f. For a source coefficient family c_(i,j), its image is zero exactly
when c_(i,j)=0 on i+j<n and f c_(i,j)=0 on i+j≥n. For a target coefficient family
d_(i,k), it is in the image exactly when d_(i,k) belongs to fA for every k<i;
there is no restriction when k≥i.

The converse image assertion is constructive up to choosing a preimage under
multiplication by f: in the nonwrapping case take c_(i,k−i)=d_(i,k), and in the
wrapping case choose a with d_(i,k)=fa and take c_(i,n+k−i)=a. Finite basis
expansion then supplies the required tensor. No flatness, domain, reducedness
or unit hypothesis on f is involved.

## 3. Explicit kernel and module cokernel

Put W={(i,j):i+j≥n} and L={(i,k):k<i}, all indices in {0,…,n−1}. Both have
E=n(n−1)/2 elements, since the number in row i is i.

The kernel is canonically identified, in the chosen bases, with

ker Θ ≅ (ann_A(f))^W.

The forward map retains exactly the W-coordinates. The inverse fills every
other coordinate with zero and forms the source tensor. Section 2 proves
membership and that the two maps are inverse. In the suggested file,
ann_A(f) is the native kernel of f times the identity linear map on A; the
coordinate formula is part of the equivalence's statement.

The **A-module** cokernel is canonically

coker Θ ≅ (A/fA)^L.

Send a target tensor to its lower-triangular coordinates modulo f. This map is
surjective: lift those finitely many residue classes and set the other
coordinates to zero. Its kernel is exactly im Θ by Section 2. Quotienting gives
the stated equivalence, whose formula on every finite basis expansion is also
part of the native signature. This is not an algebra quotient by the ideal
generated by im Θ: the latter ideal contains 1 and would give the zero ring.
It is not a reduced quotient either.

Thus the construction records both the kernel obstruction and the cokernel
obstruction, rather than using only a determinant or a geometric-point count.

## 4. Sharp injectivity, surjectivity and inverse

For n=1 the comparison is an isomorphism for every f: there is only one basis
coordinate and its coefficient is 1. For n>1, W and L are nonempty, witnessed
by (1,n−1) and (1,0), respectively. Therefore

- Θ is injective exactly when multiplication by f on A is injective;
- Θ is surjective exactly when fA=A, equivalently f is a unit;
- Θ is bijective exactly when f is a unit.

These statements include the zero-ring convention: its unique element is a
unit and all the indicated functions are bijective. The native formulations
use the uniform alternatives n=1 or the specified condition on f.

For a unit f, set X=x⊗1 and Y=1⊗x in B⊗_A B. Then
Y^−1=1⊗(f^−1 x^(n−1)), and χ=XY^−1 has χ^n=1. Use the existing native
RootsOfUnityGroup points equivalence to obtain the A-algebra map H→B⊗B sending
e_i to χ^i. Together with b↦1⊗b, the tensor universal property gives
Ψ:H⊗B→B⊗B. There is no need to assume a separate identification of H with a
polynomial quotient. The composites with Θ are the identity on X,Y and on
e_1⊗1,1⊗x, respectively; these elements and A generate the two algebras.
Consequently Ψ is the inverse. Its two generator formulas are in the native
`unit_inverse` statement. No inverse of n occurs anywhere in this construction.

## 5. Determinant and branch rank

In the pair-indexed bases, the matrix has one possible nonzero entry per
column: row σ(i,j), column (i,j), entry f^floor((i+j)/n). The product of the
weights is f^E. In row block i the permutation is the i-th power of the cyclic
shift on n letters, so its sign is (−1)^((n−1)i). Multiplying the block signs
and applying the determinant formula gives

 det Θ = (−1)^((n−1)E) f^E,     E=n(n−1)/2.

This is a determinant between the specified coordinate bases. The Lean theorem
states the actual matrix entries, rather than applying an endomorphism-only
determinant to a map between two unidentified modules.

At f=0 over a field, exactly the nonwrapping columns survive, with distinct
unit pivots. Thus rank Θ=n(n+1)/2 and dim ker Θ=E, in every characteristic.
The two counts come from the same normal form, not from division by n in the
coefficient field. For n=2, the nonzero tensor x⊗x is killed.

## 6. Why this is the right finite torsor input

The positive monic degree makes B finite free and faithfully flat over A.
Together with the action comparison, this proves the usual finite fppf torsor
criterion: Spec B→Spec A with its displayed μ_n action is a torsor exactly
when n=1 or f is a unit. The generic scheme/fppf torsor criterion and its native
stack interfaces remain with the existing foundational owners. The current
file records the complete coordinate algebra, not a new native torsor predicate.

Do not confuse that map with the frame torsor of a root object. Locally choose
a basis e of M and a trivialization of L. Write φ(e^n)=u and the root section
as b e. The power identification is an isomorphism, so u is a unit, and its
section equation is u b^n=f. A normalized **coframe** M→O compatible with φ has
the form e↦a with a^n=u. Its torsor is therefore Spec A[a]/(a^n−u), for a unit
u, even when b and f vanish. The root-coordinate map is x↦ab, since (ab)^n=f.
Scaling the coframe by ζ scales ab by ζ, agreeing with the existing weight-one
action. This fixes the action orientation as well as the parameter.

The finite normalized-coframe torsor thus exists over every root object;
Spec B→Spec A need not be a torsor at the branch locus. The infinite frame-tower
argument must use the former torsors and the genuine quotient comparisons.
The present finite computation alone does not construct the infinite fpqc
quotient, prove its comparison with a two-limit, or establish its H¹ theorem.

## 7. Eight discriminating native examples

1. `test_exponent_one`: arbitrary f, n=1, comparison bijective.
2. `test_zero_ring`: any positive n over the zero ring, comparison bijective.
3. `test_branch_kernel`: f=0,n=2 over a field, x⊗x is nonzero and is killed.
4. `test_regular_nonunit`: f=2,n=2 over Z, comparison injective but not surjective.
5. `test_nilpotent_parameter`: f=2,n=2 over Z/4, the nonzero vector 2(x⊗x) is killed.
6. `test_wild_unit`: f=1,n=2 over F₂, comparison bijective, but x−1 is nonzero and has square zero. A finite fppf torsor is not thereby an étale torsor.
7. `test_nonflat_kernel`: the injective Z comparison in (4) becomes noninjective after Z→F₂. The comparison's formula commutes with coefficient change; its kernel need not.
8. `test_cokernel_nonreduced`: f=4,n=2 over Z/8, the module cokernel is A/(4), with an element killed by 4 but not by 2. Replacing it by the reduced quotient F₂, or by the algebra quotient generated by the image, fails this test.

The starting handoff already explained the bijectivity obstruction. Tests (4),
(7) and (8), and the coefficient-level kernel/cokernel equivalences, make its
separate failure modes explicit in native types.

## 8. Exact canonical integration work

The appended section is **not yet integrated into the packet and reader**.
It must be integrated before these signatures are counted as canonical roadmap
exports. The existing 104 nodes, 85 API items, 81 tests, 39 planets, 64 baseline
records, eight gaps and thirteen requests retain their predecessor status;
no stage or reserved key is declared closed by this checkpoint.

The root-specific algebra belongs in RS.0. Keep the generic Hopf, tensor,
module-quotient, basis and determinant theories in the pinned libraries. A
concrete declaration-sized integration is:

| Proposed suffix after FunctionFieldArithmeticPartII:RS.0/ | Native name after TauCeti.RootStack. | Direct proof inputs |
| --- | --- | --- |
| affine-torsor-comparison | affineTorsorComparison | existing affine-coaction; native algebra tensor lift |
| affine-torsor-source-coordinates | affineTorsorComparison.source_coordinates | native monic basis and tensor basis; zero-ring branch |
| affine-torsor-target-coordinates | affineTorsorComparison.target_coordinates | native group-algebra basis and tensor basis; zero-ring branch |
| affine-torsor-monomial | affineTorsorComparison.monomial | existing affine-coaction-weight; x^n=f |
| affine-torsor-kernel-coefficients | affineTorsorComparison.kernel_coefficients | the three preceding coordinate lemmas and the explicit index inverse |
| affine-torsor-image-coefficients | affineTorsorComparison.image_coefficients | the same coordinate lemmas, with lower-triangular target indices |
| affine-torsor-kernel | affineTorsorComparison.kernel_equiv | kernel coefficient criterion; extension by zero |
| affine-torsor-cokernel | affineTorsorComparison.cokernel_equiv | image coefficient criterion; native submodule quotient |
| affine-torsor-injective | affineTorsorComparison.injective_iff | kernel coefficient criterion; witness (1,n−1) |
| affine-torsor-surjective | affineTorsorComparison.surjective_iff | image coefficient criterion; witness (1,0) |
| affine-torsor-bijective | affineTorsorComparison.bijective_iff | injective and surjective criteria |
| affine-torsor-unit-inverse | affineTorsorComparison.unit_inverse | unit inverse in B; existing μ_n points equivalence; native tensor lift |
| affine-torsor-determinant | affineTorsorComparison.determinant | monomial matrix; cyclic-permutation sign and determinant formula |
| affine-torsor-zero-rank | affineTorsorComparison.zero_rank | explicit zero-section pivots and the triangular counts |

The four projection/universal-property lemmas belong in the construction's
API; do not duplicate them as a second comparison map. Attach all eight examples
to that construction, with the exact names above. These are fourteen proposed
packet nodes and four API signatures, not eighteen new packet nodes. No new
planet is necessary. Resolve any existing exact-name supplier before adding a
new baseline record; several basis/coaction inputs are already registered.

The consumers are RS.1/affine-chart and the **unit-parameter** finite torsor
portion of TOWER-AFF and RS.2/kummer-torsor-limit. Do not add an edge asserting
that an arbitrary f-chart is a torsor over its coarse base. Keep the normalized
coframe proof with the affine chart, using the existing power-identification
unit/scalar contracts. The global torsor/frame equivalences require actual
scheme/site and descent exports; do not replace them by freely chosen predicates.

Next complete the predecessor's precise TOWER-AFF, KUMMER-FINITE, TOWER-TYPING,
D0 ordinary-stack, R09.4 algebraicity, R09.5 coarse-space and QCoh-descent
interfaces. Retain its factorial reindexing, finite-stage isomorphism detection,
compatible-class lifting and explicit CRT counterexample. The full fpqc tower,
finite quotient and natural derived-H¹ comparison have not acquired native
signatures here. The Yun–Zhang and Abdurrahman–Venkatesh routes, their division
of ownership, and every inherited source finding remain unchanged.

## 9. Sources and pinned library receipts

Fresh primary HTML reads on 2 October 2026:

- [Stacks 040N, Lemma 59.28.3](https://stacks.math.columbia.edu/tag/040N): statement and full proof of the fppf/syntomic Kummer sequence and the unit-parameter monic finite-free cover. Use n>0. The nonunit obstruction, kernel/cokernel maps and determinant above are explicit algebraic derivations, not claimed quotations from that lemma.
- [Stacks 0245, Lemma 35.37.1](https://stacks.math.columbia.edu/tag/0245): statement and full proof of effective descent for affine morphisms. It identifies a foundational input, not completion of the root-stack or infinite-torsor descent theorem.

The predecessor's Talpo–Vistoli, Yun–Zhang, Bresciani and other primary-paper
reading boundaries remain attributed to their authors. No fresh whole-paper
read, PDF inspection, PDF hash verification, new erratum or independent review
is claimed in this continuation.

The following actual source statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| File and scope | Statements used | Blob |
| --- | --- | --- |
| RingTheory/TensorProduct/Basic.lean, lines 1–240 | tensor algebra structure; tmul_mul_tmul | dab1052775aa7636ebabff20c92d0215c569a6bb |
| RingTheory/TensorProduct/Maps.lean, lines 1–230 | Algebra.TensorProduct.lift, lift_tmul, liftEquiv and the input restrictions | 604e0a5dad178015c379e43ec9283d6174534fa4 |
| RingTheory/AdjoinRoot.lean, lines 620–820 | powerBasisAux', powerBasis', Polynomial.Monic.free_adjoinRoot and finite_adjoinRoot | 1945b7728630a10baf56374f183be1bcfa3727f0 |
| LinearAlgebra/TensorProduct/Basis.lean, lines 1–180 | Module.Basis.tensorProduct, its evaluation and coefficient formulas | 0fa2bd75c3d290059668899dcbd7bb415363eeb9 |
| Algebra/MonoidAlgebra/Module.lean, lines 1–260 | coeffLinearEquiv, MonoidAlgebra.basis, basis_apply | 422ac6fd1b47b0f563d08f3a3f14bc6bb7724c43 |
| LinearAlgebra/Quotient/Defs.lean, lines 1–145 | native module quotient, Submodule.Quotient.mk, eq, mk_eq_zero and scalar operations | 2c25d9a529dfd044d3bf88361d79a3e8de23fda3 |
| LinearAlgebra/Matrix/Determinant/Basic.lean, lines 1–150 | Matrix.det, det_apply, det_diagonal and det_mul | 66f8b885e8ce08fecc06336d6a26d5eff6c15aa6 |

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read
`TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Basic.lean`, lines 1–240, blob
`7163a01bd87672b0b6e18668779f47c974887bc4`: the native character generator,
pointsMulEquiv, its generator evaluation and inverse character-basis formulas.
Its scope is expressly the group-algebra points calculation, not a polynomial
quotient equivalence or a torsor theorem. The inverse proof in Section 4 respects
that boundary.

The current parent FunctionFieldArithmetic reader and accepted REV-AUDIT-20
were read. The aggregate data/library-coverage.json again returned no content
through the connector, and the public web/blob-download alternatives were
unavailable. This is not a claim to have reread the whole aggregate or the
review's 188 source declarations. Existing native basis and group-algebra
infrastructure is reused; no blanket absence claim about all of either library
is made. The same session's earlier WORKERS, PROTOCOL, expansion protocol,
UPSTREAM_GUIDE and upstream roadmap readings remain the instruction baseline.

## 10. Executed validation and its limits

A fresh Python/SymPy regression checked:

- 264 ring/exponent/parameter cases, with 100100 tensor-monomial multiplicativity checks;
- 73 complete finite-ring linear-map cases, enumerating **1205091 source vectors and 1205091 target vectors**;
- the exact kernel coefficient criterion, exact image criterion, and their kernel/image/cokernel cardinalities, including nonfields and the zero ring;
- eight symbolic determinants in Z[z] and eight zero-section ranks, for n=1,…,8;
- the integral n=2,f=2 Smith form with diagonal absolute values 1,1,1,2;
- the nonzero nilpotent kernel, characteristic-two unit, nonreduced cokernel and nonflat kernel-change tests;
- 270 coefficient-reduction comparisons.

These checks are regressions, not universal proofs, Lean elaboration or a
geometric-stack certificate. The general proofs are Sections 1–6 above.

Executed script SHA-256:
`c5bb95986da0064195f0b2baaa4a4df4c49f0e648cc4664fcd3a7f7dc7ed6c3c`.
Output SHA-256:
`b10188e64780c022d78ab83190a1c2fbd70806c928b5ad0c6ad9e2c2bdd4f42f`.
The initial native append commit is `93324bbf5da17d2dca5e230bd69f97b0e01f6db6`;
its complete-file blob is `c3a94fafea1a6da6154aa67568e1b34df5dc20f2`.

The executed script is reproduced below so no ephemeral scratch directory is
needed for the regression. Run it in an existing Python environment with SymPy;
it creates no project or library build.

```python
from itertools import product
from math import gcd
import json
from sympy import Matrix, Symbol, ZZ
from sympy.matrices.normalforms import smith_normal_form

counts = dict(basis_cases=0, multiplicativity_checks=0,
              enumerated_cases=0, source_vectors=0, target_vectors=0,
              symbolic_determinants=0, branch_ranks=0, reduction_checks=0)

def comparison_matrix(n, f):
    M = Matrix.zeros(n*n)
    for i in range(n):
        for j in range(n):
            M[i*n+(i+j)%n, i*n+j] = f**((i+j)//n)
    return M

# Independent multiplication of monomials in the two tensor algebras.
for q in (1,2,3,4,5,8,9,12):
    for n in range(1,7):
        for f in range(q):
            counts['basis_cases'] += 1
            def image(i,j):
                return i, (i+j)%n, pow(f,(i+j)//n,q)
            for i,j,a,b in product(range(n), repeat=4):
                iz,it,ic = image(i,j)
                az,at,ac = image(a,b)
                rz,rt,rc = image((i+a)%n,(j+b)%n)
                rc = rc*pow(f,(i+a)//n+(j+b)//n,q)%q
                tc = ic*ac*pow(f,(it+at)//n,q)%q
                assert rc == tc
                assert rc == 0 or (rz,rt) == ((iz+az)%n,(it+at)%n)
                counts['multiplicativity_checks'] += 1

# Exhaustive vector-space/module calculations over finite rings, not fields only.
for q,n in [(q,n) for q in (1,2,3,4,5,8,9) for n in (1,2)] + [(2,3),(3,3),(4,3)]:
    indices = list(product(range(n), repeat=2))
    E = n*(n-1)//2
    for f in range(q):
        perm = [i*n+(i+j)%n for i,j in indices]
        weights = [pow(f,(i+j)//n,q) for i,j in indices]
        im = set()
        kernel = 0
        for c in product(range(q), repeat=n*n):
            out = [0]*(n*n)
            for s,t in enumerate(perm): out[t] = weights[s]*c[s]%q
            out = tuple(out)
            predicted_kernel = all(c[s] == 0 if i+j<n else f*c[s]%q == 0
                                   for s,(i,j) in enumerate(indices))
            assert (not any(out)) == predicted_kernel
            kernel += not any(out)
            im.add(out)
            counts['source_vectors'] += 1
        multiples = {f*a%q for a in range(q)}
        for c in product(range(q), repeat=n*n):
            predicted_image = all(c[i*n+j] in multiples for i in range(n) for j in range(i))
            assert (c in im) == predicted_image
            counts['target_vectors'] += 1
        ann = gcd(f,q)
        assert kernel == ann**E
        assert len(im) == q**(n*n-E)*(q//ann)**E
        assert q**(n*n)//len(im) == ann**E
        assert (kernel == 1) == (n == 1 or ann == 1)
        assert (len(im) == q**(n*n)) == (n == 1 or ann == 1)
        counts['enumerated_cases'] += 1

z=Symbol('z')
for n in range(1,9):
    E=n*(n-1)//2
    M=comparison_matrix(n,z)
    assert M.det(method='domain-ge') == (-1)**((n-1)*E)*z**E
    counts['symbolic_determinants'] += 1
    assert M.subs(z,0).rank() == n*(n+1)//2
    counts['branch_ranks'] += 1

# Integral regular-nonunit example, with its actual cokernel, not just rank.
M=comparison_matrix(2,2)
S=smith_normal_form(M,domain=ZZ)
assert [abs(S[i,i]) for i in range(4)] == [1,1,1,2]
assert M.det() == -2 and M.rank() == 4
assert M.applyfunc(lambda x: x%2).rank() == 3

# Nonzero nilpotent parameter, nonreduced cokernel, and wild unit regression.
M4=comparison_matrix(2,2)
v=Matrix([0,0,0,2])
assert any(v) and all(int(a)%4==0 for a in M4*v)
assert 2 not in {4*a%8 for a in range(8)} and 4 in {4*a%8 for a in range(8)}
assert comparison_matrix(2,1).det()%2==1
# In F2[t]/(t^2-1), (t-1)^2=(1+1,0) while t-1=(1,1) is nonzero.
assert ((1+1)%2,0)==(0,0) and (1,1)!=(0,0)

# Coefficient base change preserves the matrix, but not kernels in general.
for q,r in ((4,2),(8,4),(9,3),(12,3),(12,4)):
    for n in range(1,7):
        for f in range(q):
            assert comparison_matrix(n,f).applyfunc(lambda x:int(x)%r) == \
                   comparison_matrix(n,f%r).applyfunc(lambda x:int(x)%r)
            counts['reduction_checks'] += 1

print(json.dumps(counts,sort_keys=True))
print('PASS: kernel/image coefficient formulas; exact finite kernel/cokernel sizes; symbolic determinant and branch rank; integral Smith form; nilpotent, wild-unit and nonflat-base-change tests')
```

The standard repository blueprint checker and full atlas assembly were **not
run locally** in this browser continuation. The unchanged packet's old checker
receipt is historical. The PR's Swarm submission check must check its actual
changed paths; because the packet is unchanged, a submission pass is not a
fresh packet/baseline/closure audit. No Lean elaboration or formal proof is
certified by those checks. Retain partial status until the canonical integration,
source boundaries and geometric exports above are completed.
