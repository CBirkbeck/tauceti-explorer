# Continuation — 2026-10-02, ChatGPT Pro

Session: `gpt6astra-20261002-c84f2a`. Issue: #3403, bot-confirmed claim.
Status: **partial source-proof checkpoint, not completion, not independent review**.

This continuation develops the mathematical proof behind the existing
`TOWER-AFF`, `KUMMER-FINITE` and `TOWER-TYPING` obligations. It adds a sharp
finite-chart torsor test and a compatible Kummer-class example that cannot be
represented by one fixed rational parameter. The preceding handoff is preserved
verbatim at the end.

Only this handoff is changed. The 104-node packet, roadmap, reader and suggested
Lean file are unchanged; their canonical counts and partial/unchecked status
are not promoted. The additional proof steps and tests below still need
integration into those deliverables, exact native signatures and supplier
implementations. This is deliberately not a claim that prose closes the
geometric or derived-cohomology interfaces.

## 1. Finite affine root charts: the torsor equation and its exact boundary

Let A be a commutative ring, n a positive integer, f in A, and put

- B = A[x]/(x^n − f), the existing native AdjoinRoot chart;
- H = A[z]/(z^n − 1), the coordinate algebra of the existing μ_n group;
- Θ: B ⊗_A B → H ⊗_A B, sending x⊗1 to z⊗x and 1⊗x to 1⊗x.

The defining equations show that Θ is an A-algebra homomorphism. It is the
coordinate map of the action comparison μ_n × Spec B → Spec B ×_A Spec B.
No replacement Hopf algebra, group scheme or torsor carrier is needed.

Both algebras have their native monic tensor bases, indexed by 0≤i,j<n. In
these bases the map is

    Θ(x^i ⊗ x^j) = f^floor((i+j)/n) z^i ⊗ x^((i+j) mod n).

Thus its matrix is a weighted permutation matrix. In the i-th block the
permutation is j ↦ i+j modulo n and exactly i entries have coefficient f;
the other entries have coefficient 1. Writing E=n(n−1)/2, lexicographic
ordering of the displayed bases gives

    det Θ = (−1)^((n−1)E) f^E.

This proves that, for **n>1**, Θ is an isomorphism exactly when f is a unit.
Indeed E>0, and f^E is a unit exactly when f is. The exponent-one case is a
necessary separate test: Θ is an isomorphism for every f when n=1. The argument
also covers the zero ring with its usual unit convention.

When f is a unit the inverse is particularly explicit. In B,
x^−1=f^−1 x^(n−1), and the inverse of Θ sends

    z⊗1 ↦ (x⊗1)(1⊗x)^−1,       1⊗x ↦ 1⊗x.

The first image has n-th power 1; checking the two compositions on the
algebra generators proves that these maps are inverse. B is finite free of
positive rank n over A, hence faithfully flat. Consequently Spec B→Spec A
is an fppf μ_n-torsor for unit f, including when the characteristic divides n.
This is the explicit chart calculation underlying the fppf Kummer argument
in Stacks 040N, not a claim that the source prints the determinant refinement.

At f=0 over a field, only the basis terms with i+j<n survive. Hence
rank Θ=n(n+1)/2 and dim ker Θ=E. For n=2 the rank is 3 rather than 4;
x⊗x is a nonzero kernel vector. The nonzero nilpotent f=2 over Z/4 is another
failure test: being a nonzero section is not enough for the torsor condition.

**Do not confuse two different maps.** The quotient presentation map
Spec B→[Spec B/μ_n] is the frame torsor over the quotient stack for every f.
The map Spec B→Spec A is a torsor only on the section-invertible locus when
n>1. In the infinite-root proof, the finite torsors are frames of the root
line compatible with its n-th-power isomorphism. After trivializing the lines,
the coefficient of that isomorphism is a **unit**. It is not the potentially
zero coefficient of the section. Therefore the frame-torsor argument does not
restrict the root-stack definition to nonvanishing sections, nor discard its
nilpotent closed fibres.

Integration targets: the existing affine coaction/chart interfaces and
`FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit`. Record the comparison
map and the n=1, characteristic-dividing, zero-section and Z/4 tests explicitly.
The general torsor criterion remains with its existing supplier; the displayed
matrix calculation is the root-specific application.

## 2. Finite Kummer classes: preserve the direction of the transition

For a field k and n>0, the fppf Kummer sequence and Pic(Spec k)=0 identify
μ_n-torsor classes with k×/(k×)^n. This is the SF.2 import, with primary
locators Stacks 040N, 03P8 and the torsor/H¹ comparison 03AJ. The latter is a
theorem about derived H¹; it is not a licence to redefine H¹ as an arbitrary
set of torsors. Its general proof and functoriality belong to the supplier.

Fix the convention that the boundary class of a unit a is represented by

    P_n(a) = Spec k[v_n]/(v_n^n − a),   ζ·v_n = ζv_n.

For N=nm, the map P_N(a)→P_n(a) is v_n↦v_N^m. It is equivariant for
μ_N→μ_n, ζ↦ζ^m. The induced map on classes is

    [a] modulo (k×)^N  ↦  [a] modulo (k×)^n,

**not** [a]↦[a^m]. This also follows from the map of Kummer sequences whose
middle G_m map is the m-th power and whose rightmost G_m map is the identity.
Retain this convention when converting root-isomorphism coefficients, since
reversing the chosen line identification can invert a displayed parameter.

The finite torsors and class comparison remain fppf in characteristic dividing
n; replacing them with an étale assertion loses μ_p and purely inseparable
Kummer torsors. Their fpqc versions agree through effective affine descent
and the same finite flat presentations. None of this asserts that an infinite
fpqc torsor is fppf-locally trivial.

## 3. TOWER-AFF: construct the actual limit torsor and recover its quotients

Let T be a scheme. Suppose P_n are finite μ_n-torsors in a coherent system
indexed by positive divisibility. For n|N the maps P_N→P_n are equivariant
for μ_N→μ_n, affine and faithfully flat, and identify P_n with the contracted
product of P_N by that group map. Retain these maps and their cocycles, not
merely equality of isomorphism classes.

Positive factorials form a cofinal chain: every n divides n! and subsequent
factorials. One may construct on that chain and use the coherent quotient
comparisons to recover every index. This is the existing factorial-root-limit
obligation, not a replacement by an inverse limit of sets of classes.

### 3.1 Affine construction and faithful flatness

On U=Spec A⊂T, write P_n|_U=Spec B_n. Set B=colim B_n and
H=colim A[z_n]/(z_n^n−1), where z_n maps to z_N^(N/n). Then
P|_U=Spec B and G|_U=Spec H. The character inclusions identify
H with A[Q/Z], sending 1 in Z/n to 1/n modulo Z.

Stacks 090N gives faithful flatness of B over A from the faithfully flat
B_n. Its proof uses flatness of directed colimits and nonzero maximal-ideal
fibres. Applied to the tail above a fixed index it also gives faithful
flatness of B over each B_n. No finite-type or Noetherian hypothesis is used.
The generic colimit and faithful-flatness lemmas remain SF.1 inputs.

### 3.2 The torsor equation

The finite torsor equations are algebra isomorphisms

    B_n ⊗_A B_n ≅ H_n ⊗_A B_n.

Equivariance makes them compatible with the transition maps. The diagonal
index is cofinal in the product of two directed index sets. Tensor products
commute with these algebra colimits, so their limit gives

    B ⊗_A B ≅ H ⊗_A B.

This is the torsor equation for the constructed action, not an assumed
property of an unspecified carrier. Together with faithful flatness it proves
that P→T is an fpqc G-torsor. Affine descent glues the construction; Stacks
0245 supplies the effective descent theorem for affine morphisms. Base change
commutes with the construction because tensoring the coordinate algebras
commutes with the colimits. Identity, composition and action compatibility
are checked on the finite coordinate maps.

### 3.3 Recover P_n as a quotient, with its specified map

Let K_n=ker(G→μ_n). The map G→μ_n is faithfully flat: on character algebras,
A[Q/Z] is a free A[Z/n]-module, with basis any set of coset representatives
of (Q/Z)/(Z/n). Hence its fpqc quotient by K_n is μ_n.

The projection P→P_n induces the comparison

    P ×^G μ_n → P_n.

After the faithfully flat cover P→T, the tautological point of P and its
image in P_n trivialize both torsors. The comparison is then the identity
comparison of the trivial μ_n-torsor, induced by G→μ_n. It is therefore an
isomorphism before base change as well. This proves the quotient statement
and its compatibility with the original projection. Arrows and the
n|N|L coherence are verified after the same faithfully flat cover, where they
are the corresponding identities of the group maps.

Conversely, an fpqc G-torsor is affine over T by effective affine descent.
Its contracted products by G→μ_n are finite flat μ_n-torsors by descent.
The natural map to their inverse limit is an isomorphism: after a trivializing
fpqc cover it is G→lim μ_n. This establishes the equivalence with coherent
finite torsor towers, on objects and arrows, naturally under base change.
The native ordinary-stack, contracted-product and scheme-descent interfaces
are still implementation obligations, not supplied by this prose.

Integration targets: `RS.2/kummer-torsor-limit`, `RS.2/infinite-affine-quotient`
and `RS.2/factorial-root-limit`. Split the torsor equation, finite quotient
recovery, converse and base-change comparisons into proof-sized obligations.
Generic affine descent and filtered-colimit algebra stay with SF.1; ordinary
quotient/groupoid carriers stay with D0. Do not rebuild those foundations here.

## 4. Passage to field-valued H¹: two different arguments are required

For a field k and G=lim μ_n on the fpqc site, the resulting comparison is

    H¹_fpqc(k,G) ≅ lim_n k×/(k×)^n.

Here is the proof after the preceding tower equivalence and the generic
finite Kummer/torsor–H¹ supplier contracts. It is not an unrestricted theorem
that H¹ commutes with inverse limits of arbitrary group schemes.

### Surjectivity: choose maps, not just representatives

For a compatible family of finite classes, choose a representative μ_(r!)-
torsor at each positive factorial. Compatibility gives an equivariant
isomorphism from the contracted product at the next level to the chosen
previous torsor. Choose such an isomorphism and compose it with the quotient
map. Define all longer transitions by composition. On the factorial chain
this provides the required cocycles rather than assuming them from class
equalities. The actual tower construction now produces a G-torsor.

It is not legitimate to assume that every compatible family is represented
by the same a∈k× at every level. Section 5 supplies an explicit counterexample.

### Injectivity: finite isomorphism sets, without surjective transitions

For two G-torsors with the same finite classes, let E_r be the set of
k-defined μ_(r!)-equivariant isomorphisms between their finite quotients.
Each E_r is nonempty. Once one isomorphism is chosen, E_r is a torsor under
μ_(r!)(k), and is finite since a degree-r! polynomial has at most r! roots
in a field. This remains true in positive characteristic.

The quotient maps make the E_r into an inverse system. Its transition maps
need not be surjective. Nevertheless the inverse limit of nonempty finite
sets is nonempty. The pinned Mathlib declaration
`nonempty_sections_of_finite_cofiltered_system` has exactly these hypotheses;
no surjectivity assumption is present. A compatible isomorphism family gives
an isomorphism of the inverse-limit torsors. Thus the map on classes is
injective. Tensor products of torsors give the group-law compatibility.

The remaining passage from torsor classes to derived H¹ is the natural
abelian-sheaf comparison of Stacks 03AJ on the chosen fpqc site. Its general
construction, including the mutually inverse and functoriality checks, is
still an SF.2 supplier obligation. In particular the existing roots-of-2
non-fppf test must be retained, not contradicted by changing the topology.

Integration targets: `RS.2/kummer-limit-class-lift`,
`RS.2/kummer-limit-iso-detection` and `RS.2/dvr-kummer-classes`. These are
applications of the existing native finite inverse-system theorem, not a
second implementation of that theorem.

## 5. A coherent class family that requires scalar-adjusted transitions

For each positive n write n=3^r b with gcd(3,b)=1. Let a_n be the unique
integer in [0,n−1] satisfying

    a_n ≡ 1 modulo 3^r,       a_n ≡ 0 modulo b.

A congruence modulo 1 imposes no condition. The Chinese remainder theorem
shows that n|N implies a_N≡a_n modulo n. Therefore

    c_n = [2^(a_n)] in Q×/(Q×)^n

is a compatible system of Kummer classes.

No rational unit a represents all these classes simultaneously. Its integer
2-adic valuation would have to be congruent to a_n modulo n for every n.
At n=2^r that forces v_2(a)=0, while n=3 requires v_2(a)≡1 modulo 3.
This is a contradiction. Equivalently the chosen profinite integer has
3-adic component 1 and all other p-adic components 0, so is not an integer.

The explicit representative torsors are

    P_n = Spec Q[v_n]/(v_n^n − 2^(a_n)).

For N=nm put e_(N,n)=(a_N−a_n)/n. The correct transition is

    v_n ↦ 2^(−e_(N,n)) v_N^m.

Its n-th power is 2^(a_n). For n|N|L the integer identity

    e_(L,n) = (N/n)e_(L,N) + e_(N,n)

proves composition of the scalar-adjusted maps. The maps are equivariant
for the prescribed μ_N→μ_n. They are finite faithfully flat: after
trivializing the torsors they are the corresponding group quotient maps.

For example a_2=0, a_3=1, a_6=4, a_12=4 and a_24=16. The map
P_6(16)→P_3(2) sends v_3 to v_6²/2. Omitting the factor 1/2 produces a
cube equal to 16 rather than 2. Thus this test rejects an implementation
that lifts only constant-parameter towers or silently drops the selected
isomorphisms between representatives.

This is an additional acceptance example derived here, not an allegation of
a new source error, not an independently reviewed finding, and not a new
reserved key definition. Add it to the existing class-lift/tower API tests
when integrating the proof.

## 6. Executed checks and reproduction

The following script was executed with Python and SymPy. It checks the finite
coefficient formula, inverse basis maps on the unit locus, integer-matrix
determinants, the branch ranks, and the scalar transition cocycles. These are
supplementary exact checks; the general proofs are above, not inferred from
finite samples. This is not Lean elaboration or independent review.

Receipt:

    PASS: 186 finite-ring torsor-map cases; 70525 multiplicativity checks; 1741 inverse basis checks
    PASS: 32 integer-matrix determinants; branch ranks n(n+1)/2 for n=1,...,8
    PASS: 602 CRT compatibility pairs; 1900 scalar transition cocycles through level 120

Reproduction (requires SymPy):

```python
from math import gcd
from sympy import Matrix
from sympy.ntheory.modular import crt

cases = products = inverse_checks = 0
for q in (2, 3, 4, 5, 8, 9):
    for n in range(1, 7):
        for f in range(q):
            cases += 1
            basis = [(i, j) for i in range(n) for j in range(n)]
            # Image of x^i tensor x^j under x_left -> z*t, x_right -> t.
            def image(i, j):
                return (i % n, (i+j) % n, pow(f, (i+j)//n, q))
            for i, j in basis:
                iz, it, ic = image(i, j)
                for a, b in basis:
                    az, at, ac = image(a, b)
                    rz, rt, rc = image((i+a)%n, (j+b)%n)
                    rc = rc * pow(f, (i+a)//n + (j+b)//n, q) % q
                    target = ((iz+az)%n, (it+at)%n,
                              ic*ac*pow(f, (it+at)//n, q)%q)
                    # Zero monomials coincide regardless of their labels.
                    assert rc == target[2] and (rc == 0 or (rz, rt) == target[:2])
                    products += 1
            exponent = n*(n-1)//2
            sign = (-1)**((n-1)*exponent)
            det = (sign*pow(f, exponent, q)) % q
            assert (gcd(det, q) == 1) == (n == 1 or gcd(f, q) == 1)
            if n == 1 or gcd(f, q) == 1:
                for i, j in basis:
                    z, t, c = image(i, j)
                    back_j = (t-z) % n
                    back_c = pow(c, -1, q)
                    assert (z, back_j) == (i, j) and c*back_c % q == 1
                    inverse_checks += 1

for n in range(1, 9):
    for f in (0, 1, 2, -1):
        mat = Matrix.zeros(n*n)
        for i in range(n):
            for j in range(n):
                mat[i*n+(i+j)%n, i*n+j] = f**((i+j)//n)
        e = n*(n-1)//2
        assert mat.det() == (-1)**((n-1)*e)*f**e
        if f == 0:
            assert mat.rank() == n*(n+1)//2

def residue(n: int) -> int:
    three = 1
    rest = n
    while rest % 3 == 0:
        rest //= 3
        three *= 3
    return int(crt([three, rest], [1, 0])[0]) % n if n != 1 else 0

pair_checks = cocycle_checks = 0
for high in range(1, 121):
    for low in range(1, high+1):
        if high % low:
            continue
        assert (residue(high)-residue(low)) % low == 0
        pair_checks += 1
        for mid in range(low, high+1, low):
            if high % mid:
                continue
            e_hl = (residue(high)-residue(low))//low
            e_hm = (residue(high)-residue(mid))//mid
            e_ml = (residue(mid)-residue(low))//low
            assert e_hl == (mid//low)*e_hm + e_ml
            cocycle_checks += 1
assert [residue(n) for n in (2, 3, 6, 12, 24)] == [0, 1, 4, 4, 16]
print(f'PASS: {cases} finite-ring torsor-map cases; {products} multiplicativity checks; {inverse_checks} inverse basis checks')
print('PASS: 32 integer-matrix determinants; branch ranks n(n+1)/2 for n=1,...,8')
print(f'PASS: {pair_checks} CRT compatibility pairs; {cocycle_checks} scalar transition cocycles through level 120')
```

## 7. Source and pinned-library inspection boundary

Primary passages read during this continuation, accessed 2026-10-02:

- Stacks [040N](https://stacks.math.columbia.edu/tag/040N), Lemma 59.28.3,
  fppf/syntomic Kummer sequence and the finite-free root-of-a-unit proof.
  All exponents used in this checkpoint are strictly positive.
- Stacks [03P8](https://stacks.math.columbia.edu/tag/03P8), the Picard/H¹
  comparison, and the pair description in
  [03PK](https://stacks.math.columbia.edu/tag/03PK), §59.28.
- Stacks [03AJ](https://stacks.math.columbia.edu/tag/03AJ), Lemma 21.4.3,
  torsor classes and derived H¹. Its written proof omits the final
  mutually-inverse verification; that generic check remains in SF.2's contract.
- Stacks [090N](https://stacks.math.columbia.edu/tag/090N), Lemma 10.39.20,
  faithful flatness of directed colimits, with proof.
- Stacks [0245](https://stacks.math.columbia.edu/tag/0245), Lemma 35.37.1,
  effective fpqc descent of affine morphisms, with the algebra-descent proof.
- Talpo–Vistoli, [arXiv:1410.1164v2](https://arxiv.org/pdf/1410.1164v2),
  §3, printed pp. 14–16: the finite/infinite quotient comparisons and the
  compatible-trivialization argument. The page image at printed p.16 was
  successfully rendered and inspected, including the proof of Proposition
  3.10 and Corollary 3.13. Other attempted page screenshots failed; no claim
  of inspecting those images is made. No new source hash was verified.

No fresh whole-paper YZ19/AV proof audit or B24 PDF reading is claimed. Earlier
source hashes, reading scopes and source findings remain attributed to their
previous workers. The determinant and nonconstant-parameter counterexample
are explicit derivations here, not statements attributed verbatim to TV or
Stacks.

Native source read at Mathlib pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean`, lines 1–210,
  blob `c2d6c3c609d283fe01bcddb47be836eca8230e50`: actual
  `Module.FaithfullyFlat`, proper-ideal/tensor characterizations and transfer
  across a linear equivalence. This inspection does not establish that the
  generic faithfully-flat-colimit theorem is already implemented.
- `Mathlib/CategoryTheory/CofilteredSystem.lean`, lines 1–220,
  blob `f3e071edeab660320951cae14073a730f2d53892`: actual
  `nonempty_sections_of_finite_cofiltered_system` and its inverse-system
  specialization, with finite and nonempty object hypotheses and without
  surjective transition maps.
- The same session's earlier `AdjoinRoot.lean` inspection at this pin read
  the native quotient, coefficient map and root, blob
  `1945b7728630a10baf56374f183be1bcfa3727f0`. It was not a fresh inspection of
  every later monic-basis declaration in the inherited packet.

Tau Ceti's pin remains `f790474821cf4256814db967cb154e7af3d0c369`.
No current-head search result is promoted to pinned-baseline evidence, and
no absence claim is inferred from one unsuccessful search.

Ownership checks: the full parent FunctionFieldArithmetic reader
`content/campaign/FunctionFieldArithmetic/README.md` was read (blob
`381203806f142fd8319da052e6d896cb363e3302`), as was the accepted
`research/blueprint/reviews/REV-AUDIT-20.md` (blob
`94151e7330c9f7998ded444615a21c54dc482d9d`). The aggregate
`data/library-coverage.json` could not be obtained through the connector;
reading this accepted audit review is not a claim to have reread the entire
aggregate or every underlying declaration. Earlier in this same session the
full StableReduction and JacobianChallenge upstream readers were also read.
The parent arithmetic, ordinary Picard geometry and general descent/Kummer
infrastructure are not replanned inside the root-specific owner.

## 8. Resume and validation boundary

Integrate the finite comparison and acceptance tests into the existing
root-chart/coaction plan, keeping generic μ_n/torsor definitions upstream.
Add the explicit quotient-recovery, converse and base-change steps to the
existing tower nodes, and split nonroutine proof steps at declaration
resolution. Use the finite-isomorphism-set argument for injectivity and the
scalar-adjusted CRT tower for the class-lift test. Preserve all 104 inherited
IDs, the reserved root-stack ID, all YZ routes, the 38-item independent AV
split, and all inherited source findings.

Then update packet prerequisites, source locators, API/test and prototype
ledgers, reader and suggested signatures together. Resolve the actual SF.1,
SF.2 and D0 native contracts rather than introducing opaque carriers with
conclusions as fields. The determinant argument must use the existing native
monic and tensor bases. The infinite H¹ assertion still needs the chosen
fpqc site and the natural derived-H¹ comparison; finite ring checks do not
supply those types.

**Lean was not compiled and the standard blueprint checker was not run in
this continuation.** No existing built environment at both pins was available;
no project, build, cache or language server was started. The executable checks
above concern the newly supplied algebra, not the unchanged Lean signatures.
The prior worker's checker and parity receipts below remain historical.
Submission CI must check the actual PR; a handoff-only intake pass would not
certify the new mathematical argument or close any stage.

---

## Previous checkpoint — preserved verbatim

# DESIGN-FunctionFieldArithmeticPartII

Codex — codex-5ebb6f continues the merged 91-node checkpoint: 104 nodes, 85 API items, 81 mathematical tests, 39 planets and 64 baseline declarations. All inherited IDs, 33 source-coverage entries, 38 AV sibling routes and nine source findings are preserved.

Thirteen new leaves cover fpqc descent of finite root data; native affine transition maps, composition, iterated quotient, basis and faithful flatness; factorial reindexing; infinite fpqc quotient and Kummer torsor/class comparisons; and an explicit obstruction to fppf trivialization. The inherited infinite H1 claim is corrected to fpqc, with finite Kummer remaining fppf. B24’s volume is corrected to 235.

Fresh primary reading: TV17 §3 pp. 13–16, cited statements and proofs; B24 pp. 133 and 135 plus front matter. Downloaded bytes match the recorded hashes. Other reading and errata receipts remain inherited. Native declarations were checked at the recorded Mathlib/Tau Ceti pins.

Checks: packet checker zero errors/warnings; reachable 131-node declaration graph acyclic; in-memory atlas projection retains 104 declarations and 39 planets with no skipped links; reader/signature API-test parity; 216 finite-ring transition/basis calculations and exhaustive rank-two coefficient reconstruction over Z/4.

All ten stages remain partial: eight gaps, thirteen requests. Lean is uncompiled, with six new native signatures and seven new exact geometric omissions. No existing Tau Ceti build at the pin was found; no build/cache/LSP started.

Next: implement the finite native proofs; complete TOWER-AFF and KUMMER-FINITE; resolve D0 ordinary-stack, R09.4 algebraicity, R09.5 coarse and QCoh descent contracts; elaborate signatures and retain the roots-of-2 counterexample.
