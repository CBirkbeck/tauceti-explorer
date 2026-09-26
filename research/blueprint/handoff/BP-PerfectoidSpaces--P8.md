# BP-PerfectoidSpaces--P8 — continuation handoff

Issue #974. Agent: ChatGPT Pro. Session: `cp-20260926-6f2c`.
Date: 26 September 2026. Claim 5848384586; bot confirmation 5848385499.

## Status and preservation

**Partial, handoff-only checkpoint.** This submission supplies the explicit nonarchimedean functional-analysis argument behind the outstanding countable-type Banach-space gap, distinguishes three different integral assertions, and gives the exact integration work. **The packet, roadmap document, and suggested Lean file are unchanged.** No new nodes have entered the atlas, no gap has been removed from the packet, and no implementation is claimed.

The previous handoff, including all its source issues, supplier requests, remaining work and historical checks, is preserved at an immutable revision:
[prior handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/1f65e4554ed4697af4bff0dc64613f951cc1889d/research/blueprint/handoff/BP-PerfectoidSpaces--P8.md).

Input packet blob: `83e7a28f447880229f80de956e0813f24eefff30`. Its unchanged inventory is 62 nodes (4 constructions, 5 definitions, 35 lemmas, 18 theorems), 60 API items, 37 tests, 11 planets, 51 baseline declarations, 34 sourceIssues and three recorded gaps. Those counts describe the preceding checkpoint; they are not a new verification of every item.

The available GitHub text-write action replaces an entire file. I did not reconstruct the complete large packet safely in the local workspace, so this submission preserves the proof and precise integration instructions in the authorized handoff path instead of replacing unrelated content or claiming an unapplied repair.

## Inputs actually checked

Read the full affected P9 tensor-invariants, profinite-coefficient and weight-extension nodes, the invariant-subalgebra node, their surrounding descent statements, the existing E25 correction, and the three-gap handoff. Read the accepted RS-05 proposal's P8/P9 ownership decisions and `REV-RS-05.md`. Read the P8/P9 entries of `AUDIT-38.result.json` and its accepted review `REV-AUDIT-38.md`; the large generated `data/library-coverage.json` could not be fetched, so the underlying reviewed audit was used. Its negative verdict for the geometric completed-tensor/descent theory is retained, not replaced by the existence of abstract module descent.

Read the `AdicSpacesPartII` R0/R3/R5 interfaces and the `LocallyAnalyticDistributions` L0/L4 scope. RS-05 gives the common analytic completed-tensor infrastructure to R0 and the torsor-descent theorem to P9. The distribution roadmap's present scalar scope is finite extensions of Q_p; it does not already supply the nondiscrete-field theorem below.

One additional baseline statement was read at the exact Mathlib pin:

- `Submodule.closed_of_finiteDimensional`, in `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: a finite-dimensional submodule of a Hausdorff topological vector space over a complete nontrivially normed field is closed. Its assumptions were read in the surrounding section, not inferred from the name. It supplies the positive-distance step below. It has not yet been added to the packet's baseline list.

## Sources and what they support

- Chojecki–Hansen–Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, [arXiv:1507.04875v2](https://arxiv.org/pdf/1507.04875v2), 22 August 2016. Read Proposition 2.22 and Lemma 2.23 with its proof, printed pp. 19–20. Part (1) concerns the mixed tensor product with a profinite flat Z_p-module; part (2) concerns a Banach Q_p-space. They are different tensor constructions. The latter has no countable-type restriction. Text was read; attempts to render these two pages failed.
- Birkbeck–Heuer–Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, [arXiv:1902.03985v4](https://arxiv.org/pdf/1902.03985v4), 10 May 2021. Read Lemma 3.7 and its proof, printed p. 10. This is the general-perfectoid-field consumer. Its rational-to-integral issue is already recorded as E25 in the input packet; this continuation does not claim to discover that issue again. Text was read; the page-render request failed.
- Kąkol–Kubiś–Kubzdela, *On non-archimedean Gurariĭ spaces*, [arXiv:1612.02247v1](https://arxiv.org/pdf/1612.02247v1), 7 December 2016. Read the standing field convention on p. 2 and §2 on pp. 3–4: t-orthogonality, countable type, weighted c0, and the assertion that countable-type Banach spaces admit t-orthogonal bases for 0<t<1. Printed p. 4 was checked visually. The assertion cites van Rooij, Lemma 5.5; that book was not read. The construction below is this worker's explicit proof of the standard assertion, not a claim that the paper prints this argument.

All three are scoped to the preprint versions read. No local PDF bytes were obtained, so no SHA-256 is asserted. The published versions were not collated.

# The rational theorem, with its actual norm

Let K be a complete nontrivially valued nonarchimedean field. A Banach K-space here has an ultrametric real-valued norm satisfying ||a v||=|a| ||v||. Let E be any such Banach space, and let a group G act by bounded K-linear automorphisms. No topology on G is needed for this assertion; a continuous profinite action is an application. Let V be a Banach K-space of countable type with **trivial** G-action.

Use the nonarchimedean projective tensor seminorm

||z||_pi = inf { max_j ||a_j|| ||v_j|| : z = sum_j a_j tensor v_j },

followed by the separated completion. A comparison with the completed tensor of Huber algebras is an R0/R5 input, not part of the definition of this norm.

Put F=E^G with its induced norm. The canonical map

**J: F completed-tensor_K V -> (E completed-tensor_K V)^G**

is a bijective **linear isometry** for these norms. In particular it is the required canonical topological isomorphism. Uniformity or a ring multiplication on E is unnecessary for this functional-analysis statement. No averaging or division by the group order occurs.

The proof splits as follows.

## 1. Adjoining a nearly orthogonal vector

Let D be a finite-dimensional subspace of V, a outside D, and 0<s<1. The pinned closed-submodule theorem gives d=dist(a,D)>0. By the definition of the infimum choose b in D with

||a-b|| < d/s.

Set e=a-b. For every v in D and every lambda in K,

||v+lambda e|| >= s max(||v||, |lambda| ||e||).

For lambda=0 this is immediate. When ||v||>|lambda| ||e||, the strong triangle inequality gives equality with ||v||. In the remaining case, translation invariance of distance to D gives

||v+lambda e|| >= |lambda| d > s |lambda| ||e||.

No nearest point is required and no spherical completeness is used. Also span(D,e)=span(D,a), which is what preserves the specified dense sequence in the induction.

## 2. A t-orthogonal basis, including finite and zero cases

Countable type means the closure of the K-linear span of a countable set, not necessarily topological separability. Include finite-dimensional spaces and the zero space in the convention used here.

Fix 0<t<1 and a sequence (a_n) whose linear span is dense. Put

s_n = 1 - (1-t)/2^(n+1).

For every finite initial segment,

product_{j<n} s_j >= 1 - sum_{j<n}(1-s_j) > t.

At stage n, D_n=span(a_0,...,a_{n-1}). If a_n belongs to D_n, add no vector. Otherwise apply paragraph 1 with s_n and add its nonzero residual e_n. Induction gives a lower bound by the product of the s_j for every finite linear combination. The resulting nonzero vectors, indexed by the subset I of stages where a vector was added, satisfy

t max_i |lambda_i| ||e_i|| <= ||sum_i lambda_i e_i|| <= max_i |lambda_i| ||e_i||

for every finitely supported coefficient family. Their linear span is dense because it contains every a_n. I can be empty, finite or countably infinite; the proof does not force an infinite family in a finite-dimensional space.

Keep the weights w_i=||e_i||. They need not lie in the value group of K and must not silently be replaced by 1. In particular, discretely valued K alone does not imply that the given norm admits unit-norm basis vectors.

## 3. Weighted null sequences and the Schauder expansion

For a Banach space B and positive real weights w_i, write c0(I,w;B) for the families (b_i) such that for every epsilon>0 only finitely many indices have ||b_i||w_i >= epsilon. Its norm is sup_i ||b_i||w_i. Completeness follows coordinatewise, with uniform tail control; finite-support families are dense by truncation.

These are null sequences, not arbitrary bounded sequences and not the uncompleted finite-support direct sum. The first tensor statement of CHJ Lemma 2.23 has a different, bounded-family description; do not substitute it here.

The finite-support map (lambda_i) -> sum_i lambda_i e_i extends to

T: c0(I,w;K) -> V,

with t||c|| <= ||Tc|| <= ||c||. Its image is closed by completeness and the lower bound, and dense by paragraph 2, hence T is onto. This proves existence and uniqueness of the convergent expansion and gives ||T||<=1 and ||T^(-1)||<=1/t. The i-th coordinate functional has norm at most 1/(t w_i).

When implementing the sequence spaces, compare with Mathlib's existing vanishing-at-infinity function-space vocabulary rather than introducing an unrelated carrier; the exact weighted norm and tensor comparison are still required. No unverified declaration name for that comparison is claimed here.

## 4. The completed tensor with weighted c0

There is a canonical linear isometry

B completed-tensor_K c0(I,w;K) = c0(I,w;B).

For a finite-support family (b_i), the tensor sum_i b_i tensor delta_i has projective norm at most max_i ||b_i||w_i. For the converse, the coordinate map id tensor ev_i has norm at most 1/w_i, so every tensor presentation has projective norm at least ||b_i||w_i for each i. Taking the supremum proves equality.

For a general algebraic tensor sum_j b_j tensor c_j, truncate each of the finitely many c_j on a common finite subset. The errors tend to zero in the projective seminorm. Thus the finite-support computation extends first to the algebraic tensor and then to the separated completion. It gives precisely the weighted-null-sequence space, including when I is empty or finite. There is no use of Hahn–Banach or an extension of a functional from an arbitrary subspace.

Tensoring T and its inverse with id_B gives mutually inverse bounded maps between c0(I,w;B) and B completed-tensor_K V. Their bounds are 1 and 1/t.

## 5. Invariants and the improvement from equivalence to isometry

F is closed: it is the intersection, over g in G, of the kernels of g-id. It is therefore Banach. Under paragraph 4 followed by id tensor T, the action on E completed-tensor_K V is coordinatewise. Its invariant families are exactly c0(I,w;F), with the induced norm.

The commutative square with the maps T for B=F and B=E shows that J is bijective and

t||z|| <= ||Jz|| <= ||z||.

In detail, the upper bound is functoriality of the projective norm for the isometric inclusion F -> E. For the lower bound, write c=T_F^(-1)z. Then ||z||<=||c|| and ||Jz||=||T_E c||>=t||c||. These statements extend to completions by the established bounded maps.

This works for every 0<t<1, while J itself is the same canonical map independently of the chosen basis. Taking t up to 1 proves ||Jz||=||z||. A single fixed t would establish only a Banach-space isomorphism; the universal quantifier over t is the additional step establishing the isometry.

# The discrete-field case must remain separate

The existing weight-extension node uses a discretely valued L_0 and a possibly arbitrary complete extension L/L_0. Even if O(U) is of countable type over L, it need not be of countable type over L_0. The countable-type theorem above must not silently replace CHJ's unrestricted Banach-space result over the discrete base.

Here is the elementary unrestricted discrete-base argument. Let pi be a uniformizer of K and let V be any ultrametric Banach K-space. Its unit ball V^circ is pi-adically complete. Choose a vector-space basis of V^circ/pi V^circ over the residue field and lifts e_i in V^circ. For a nonzero finite coefficient family, scaling by a coefficient of maximal absolute value and reducing modulo pi gives

|pi| max_i |a_i| < ||sum_i a_i e_i|| <= max_i |a_i|.

Every vector in V^circ is approximated by these lifts: choose a finite residue expansion, subtract it, divide the error by pi, and repeat. This constructs a convergent expansion with coefficients tending to zero; only finitely many coefficients remain nonzero modulo each power of pi. Uniqueness follows from the same lower bound. Thus V is topologically c0(I,K), with no restriction on the cardinality of I. Moreover V^circ corresponds exactly to the integral restricted product of the K^circ e_i. For the converse inclusion of balls, a coefficient of absolute value at least |pi|^(-1) forces the vector norm to exceed 1; the infinite-series statement follows by truncating the strictly smaller tail.

This proves the topological tensor-invariants comparison for arbitrary V over a discretely valued K, by coordinatewise invariants. It also supplies the lattice calculation when one explicitly uses these pi-adic unit balls and this completed tensor construction. It does **not** claim that the original norm has an orthonormal basis or that an arbitrary Banach space over a nondiscrete K has such an integral basis.

# Three integral statements, not one

1. **Unit balls of the rational projective tensor spaces.** The isometry J proves their exact equality in the countable-type theorem. This is a consequence of paragraph 5, not merely of a norm equivalence for one t.
2. **Completed algebraic tensors of the unit lattices.** The input node also writes `(A_infinity^circ completed-tensor_{K^circ} V^circ)^G = A^circ completed-tensor_{K^circ} V^circ`. In general nondiscrete K, this needs a separate comparison of those completed lattices with the unit ball of the rational projective tensor. That comparison has **not** been proved by this continuation. Do not delete its obligation by replacing a lattice tensor with a rational unit ball. No counterexample to the lattice equality itself is claimed. The preceding discrete-base construction explains a case where the integral restricted-product argument does apply.
3. **Integral structure sheaves in the geometric application.** Use the pointwise argument already proposed in the input's E25 and weight-extension node. Given rational descent on the actual open and a map surjective on its valuation points, an invariant section upstairs descends to f downstairs. If its pullback is bounded by 1 at every point, lift each downstairs point and conclude that f is bounded by 1 there. The definition of O^+ then gives integral descent. Conversely pullback preserves these bounds. This avoids identifying O^+ of a product with an unproved tensor of unit lattices.

Keep the topology of the product explicit. The input weight-extension node correctly limits its assertion to the product affinoids used for coefficient sheaves on Y and notes that these are not a basis of Y times U. The full sheaf assertion on arbitrary opens of that product still requires its own argument. This continuation does not enlarge that scope or remove the seminormal-base gap.

# Integration plan: changes still to apply

Keep the existing node ID `PerfectoidSpaces:P9/invariants-of-completed-tensor-with-banach-space` and all its consumers. Plan the elementary Banach construction **once**, within the common completed-tensor infrastructure of `AdicSpacesPartII:R0`, as RS-05's ownership requires; P9 imports the statement and applies it. Relevant users are this P9 node, `PerfectoidSpaces:P8/quotient-scalar-extension`, R5's coefficient products, and the discrete-base coefficient part of `LocallyAnalyticDistributions:L4`. The latter remains an application, not a competing nondiscrete functional-analysis owner.

Suggested declaration-sized statements for that owner (names are proposals, not reserved IDs):

- `nearOrthogonal_adjoin`: paragraph 1, including span preservation and 0<s<1.
- `exists_tOrthogonal_denseFamily`: paragraph 2, with finite/empty index alternatives and 0<t<1.
- `weightedNullSequence_equiv`: completeness, truncation density and paragraph 3's actual bounded equivalence with its two norm bounds; separate reusable sequence-space construction/API if the current library does not supply its carrier.
- `completedTensor_weightedNullSequence`: paragraph 4's isometry on the chosen completed projective tensor, characterized on elementary tensors.
- `discreteField_restrictedProductBasis`: the arbitrary-cardinality discrete case, including the integral restricted-product comparison.
- `completedTensor_fixedPoints_trivialFactor`: the canonical comparison of paragraph 5, plus the discrete-base alternative. Its naturality follows on elementary tensors and then by density; no choice of basis occurs in the statement.

For a weighted sequence-space construction the API must include coordinate evaluation, insertion at a coordinate, finite-support truncation, the norm, completeness, the null-tail condition, extensionality, and maps induced by bounded linear maps of coefficients. Its tests must include the empty index, a singleton of nonunit weight, the standard unweighted c0 comparison and a bounded non-null family excluded from c0.

Then make the following edits in the authorized P8 packet and its companions:

1. Add the checked finite-dimensional-closedness baseline citation where used, and add the new source/version provenance with only the sections actually read.
2. Replace the tensor node's unweighted-sequence proof by the weighted proof above, through exact supplier nodes or an explicit request. Give it a correct short excerpt from **CHJ 2.23(2)**: its current excerpt quotes part (1), which is the other coefficient category.
3. Keep the original rational countable-type statement, specify the tensor norm/completion, and separate the unrestricted discrete-base clause needed by the current weight-extension consumer. Do not infer countable type over L_0 from countable type over L.
4. Split the general integral-lattice assertion from the rational theorem. Record the exact still-needed lattice comparison as a gap unless it is proved in the chosen generality. Keep the geometric O^+ proof by pointwise bounds as a different statement.
5. Route the Banach-tensor prerequisite to R0 rather than leaving this purely analytic input under the old `AdicEtaleGeometry:A0` request. Do not move the separate Huber-category or étale inputs of other nodes with it.
6. Update the roadmap passage and suggested signatures/tests under their existing names. The invariant-subalgebra node is currently stated over Q_p; the general-K application must use the same closed-subspace argument at that generality or a precise generalization, not cite the Q_p-only statement as if its type were general.
7. Resolve the countable-type gap only after the decomposition and owner import are recorded; keep the other two inherited gaps and all still-open requests. The whole packet remains `partial`.
8. Run the blueprint/declaration validators and a fresh combined dependency-cycle check, and compile the changed suggested file against the pins. None of these integration checks has been run here.

# Regression checks

The following finite exact checks were executed in the scratch environment, using Python's standard-library Fraction arithmetic. They support the detailed proof above; they do not prove an infinite-dimensional theorem.

- **320 finite-product checks** for t=1/10,1/2,9/10,99/100 and the first 80 factors, verifying product(s_j)>=1-sum(1-s_j)>t.
- **16,428 weighted two-dimensional checks** over Q with p-adic norms, for p=2,3,5,7 and m=1,2,3. They verify the weighted sup norm on the residual basis (1,0),(0,p^m), and the sharp lower/upper bounds for the deliberately nearly dependent basis (1,0),(1,p^m).
- **12 cancellation regressions**: coefficients (1,-1) on the latter basis have norm p^(-m), not 1. This rejects falsely declaring an arbitrary basis orthogonal.
- **1,372 fixed-tensor norm checks** for the swapping C2-action on K^2 and three coefficient weights 1,3/2,2/5. This includes p=2, without integral averaging.
- **4 unit-ball counterchecks**: multiplication by p is a Banach automorphism of Q_p, but maps Z_p properly inside Z_p. A topological isomorphism alone does not identify the specified lattices.

Additional exact mathematical acceptance specifications:

- V=0 gives a zero tensor and empty basis; a finite-dimensional V must not acquire infinitely many nonzero basis vectors.
- A one-dimensional Q_2-space with norm (3/2)|x|_2 has no vector of norm 1. Weighted coordinates must still give the theorem.
- The constant sequence 1 is not in c0(N,K), whereas the sequence pi^n is; their tensor targets must distinguish them.
- Over K=F_2((t)), the swapping C2-action on K^2 has diagonal invariants. The proof still works even though division by #G is impossible in K itself.
- Triviality of the action on V is essential: over Q_3, take E and V both the one-dimensional sign representation of C2. Then E^G=0 but (E tensor V)^G=K. This elementary example avoids importing a separate theorem about Tate twists just for the negative test.
- A Tate algebra K<T> has its standard null-sequence basis and recovers the coefficientwise invariants identity. An arbitrary affinoid quotient needs the quotient norm/completeness comparison as well as its countable dense spanning set.

A compact reproduction of the numerical checks is below. It checks finite norm inequalities only.

```python
from fractions import Fraction as Q
from itertools import product

def norm(x,p):
    x=Q(x)
    if not x: return Q(0)
    a,b=abs(x.numerator),x.denominator
    v=0
    while a%p==0: a//=p; v+=1
    while b%p==0: b//=p; v-=1
    return Q(p)**(-v)

for t in (Q(1,10),Q(1,2),Q(9,10),Q(99,100)):
    P,S=Q(1),Q(0)
    for n in range(80):
        d=(1-t)/2**(n+1); P*=1-d; S+=d
        assert P>=1-S>t
C=sorted({Q(n,d) for n in range(-6,7) for d in (1,2,3,5)})
for p,m in product((2,3,5,7),(1,2,3)):
    r=Q(p)**(-m)
    for a,b in product(C,repeat=2):
        assert max(norm(a,p),norm(b,p)*r)==max(norm(a,p),norm(b*p**m,p))
        h=max(norm(a,p),norm(b,p))
        q=max(norm(a+b,p),norm(b*p**m,p))
        assert r*h<=q<=h
    assert max(norm(0,p),norm(-p**m,p))==r<1
for p in (2,3,5,7):
    for row in product(range(-3,4),repeat=3):
        w=(Q(1),Q(3,2),Q(2,5))
        assert max(norm(a,p)*b for a,b in zip(row,w))==max(
            max(norm(a,p),norm(a,p))*b for a,b in zip(row,w))
    assert norm(p,p)<1<norm(Q(1,p),p)
print('PASS: finite weighted-basis and invariant-tensor regressions')
```

## Incidental source issue, not yet entered in the packet

Kąkol–Kubiś–Kubzdela, arXiv:1612.02247v1, §2, printed p. 4, in the paragraph defining orthogonal subspaces, prints `D1 ∩ D2 = ∅`. The correction is `D1 ∩ D2 = {0}`: every linear subspace contains 0, and orthogonality applied to x and -x makes any common vector zero. This is an evident misprint affecting no intended result. The page image was checked. A search for a correction found none, but the publisher refused the full text (403), so this is **preprint-scoped and not a claim of a new error in the version of record**. Allocate an unused sourceIssues ID when integrating it; none has been inserted by this handoff-only submission.

## What remains and where to resume

Start with the Banach proof's R0 supplier decomposition and the existing P9 tensor node, not a rewrite of the 62-node packet. The weighted argument removes the need to read a paywalled book for that specific proof, but it does not supply the formal tensor carriers or discharge the owner/interface obligations.

The two unrelated inherited gaps remain: integral perfectoidization needs its routed owner theorem, and function descent over general seminormal rigid bases needs the precise Kedlaya–Liu II 8.2.3 theorem. The completed integral-lattice comparison identified above must also be recorded explicitly if retained in general nondiscrete form.

The earlier handoff's successful Lean run (69 admitted-proof warnings) and zero-error validator result remain historical. **This continuation did not run Lean, the full repository validator, a declaration-index validator, or a global cycle check.** The suggested file is unchanged, so no new compilation claim is made. This PR is research and a handoff, not the completed blueprint or an independent review of the preceding work.
