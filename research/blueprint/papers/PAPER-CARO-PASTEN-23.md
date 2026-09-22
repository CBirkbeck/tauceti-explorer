# Continuation: a componentwise repair of the weighted jet sum

Codex — codex-a71f92, 22 September 2026; issue #1235. **Partial checkpoint.**

This continuation supplies a written replacement for the failed use of preprint Lemma 3.15 in §9.5. Under the explicit smooth-surface, nef-canonical and genus hypotheses below, the componentwise argument recovers **q+4√q+3**, including Frobenius-moved components. It does not validate the false general curve lemma, reconcile the publication, or close the other source dependencies.

The current inventory has 163 items: 11 library, 13 planned, 139 missing. Fourteen routes cover 119 missing items and 12 planned items. All 151 inherited IDs, statuses and statements are preserved. Eight missing items and four narrow library imports are added; the two added constructions have APIs and three tests each. The 20 historical false/unmatched/unclosed endpoint records remain unrouted. Their preservation is not an assertion that every historical gap is still unchanged: G1 now has the replacement proof W1–W8 below. The original report and handoff are retained verbatim as historical material after this supplement.

## Fresh reading and version boundary

I separately downloaded and read all 39 pages of [arXiv:2102.01055v2](https://arxiv.org/pdf/2102.01055v2): §§1–11, every proof, and the complete bibliography. Its SHA-256 is `d7398c4bc32d7ce631e8397145e63276e33f037070a252ba16442c01500c67f7`, identical to the inherited file. The arXiv history still lists only v1 and v2. The [official publication page](https://link.springer.com/article/10.1007/s00222-023-01217-1) gives Inventiones 234 (2023), 1197–1250 and serves a subscription preview. Its canonical PDF URL again returned HTML, not the 54-page article. Pasten's author-page search result links arXiv; the live request timed out. Thus **G0 remains open**.

The earlier report's first-three-page reading of Balakrishnan–Caro and its +5 quotation are inherited evidence, not freshly read sources in this claim. A bound quoted for W₂ must not be identified with a bound for a smooth symmetric square: those domains can differ. In particular, this argument does not assert a stronger version of the unseen publication.

Fresh prerequisite readings were Stacks [33.39](https://stacks.math.columbia.edu/tag/0C3Q), [33.27.6](https://stacks.math.columbia.edu/tag/0C3P), [43.16](https://stacks.math.columbia.edu/tag/0B01), and [43.14](https://stacks.math.columbia.edu/tag/0AZR), including their proofs, not the full chapters. These provide finite normalization/length and proper-intersection interfaces. The three saved HTML hashes are in `source.files`. A legal Project Euclid attempt for Hironaka returned a 1160-byte HTML challenge; **the original Hironaka paper was not acquired**. No fresh reading of Debarre, Garcia-Fritz, Aubry–Perret or Bourbaki is claimed.

## Exact setup and replacement proof

Let S/F_q be smooth, projective and geometrically integral. Let

```text
D = div(u₁ ∧ u₂) = Σ_i a_i C_i > 0
```

be an effective nef canonical divisor, where u₁,u₂ are regular one-forms defined over F_q, the wedge is nonzero, the C_i are the distinct geometric integral components, and every a_i is a positive integer. Put ν_i:C̃_i→S_kbar, g_i=g(C̃_i)≥2, p_i=p_a(C_i), δ_i=p_i−g_i≥0 and k_i=D.C_i≥0.

Require one combination w of u₁,u₂ whose pullback η_i=ν_i*w is nonzero on every normalization. It is sufficient for w to be defined over kbar. Let m be a nonnegative function on S(F_q), zero off D, with the branchwise upper bound of preprint Theorem 4.4 / Lemma 9.12:

```text
m(x) ≤ Σ_i a_i Σ_{y∈ν_i⁻¹(x)} (ord_y η_i + 1).
```

All sums here are finite geometric sums. No rationality of a normalization preimage is presumed.

### W1. Frobenius split and branch counting

Let σ act through the scalar automorphism c↦c^q on the base-changed F_q-model. This is the semilinear Galois action, **not absolute Frobenius**, which is topologically the identity. It permutes the C_i and preserves a_i. Separate fixed components I₀ from moved components I₁. For each i set B_i=Σ_{x∈S(F_q)}#ν_i⁻¹(x).

For a fixed component, descent gives a geometrically integral curve over F_q and its finite normalization. The ordinary Weil bound applies to that normalization. At a rational singular point, the only excess over rational normalization points consists of nonrational geometric branches. If b is the total number of branches, Chinese remainders on the semilocal normalization induce a surjection
B/A → kbar^b / diagonal(kbar), so b−1≤δ_x. A smooth point has one rational branch. At a singular point δ_x≥1, hence the excess is at most b≤δ_x+1≤2δ_x. Summing gives

```text
B_i ≤ q + 1 + 2g_i√q + 2δ_i,                    i ∈ I₀.
```

The identity δ_i=p_i−g_i follows by taking Euler characteristics of
0→O_C→ν_*O_C̃→Q→0: finite normalization has no higher direct images, Q has finite support with total dimension Σδ_x, and both integral proper curves have constants kbar. The underlying scheme/cohomology interfaces are still construction obligations, not claims of built Lean theorems. Stacks 33.39 supplies the arbitrary-characteristic local defect and its completion compatibility.

### W2. A branch costs at least one local intersection

For two distinct integral curves C,C′ on a smooth surface over kbar, and x∈C∩C′, let f,g be local equations. Their proper intersection multiplicity is the finite length of O_{S,x}/(f,g). After completion, write f as a unit times the product of the distinct formal branch equations f_r. No f_r divides g. In A=kbar[[u,v]], multiplication by a factor gives short exact sequences, for example

```text
0 → A/(f₁,g) --×f₂--> A/(f₁f₂,g) → A/(f₂,g) → 0.
```

Injectivity uses that f₂ is a nonzerodivisor modulo g (coprimality in the regular local UFD). Therefore length A/(f,g) is the sum of the branch lengths. Each is positive, so
#ν⁻¹(x)≤I_x(C,C′). Finite-length preservation under completion and the branch/normalization correspondence identify this computation with the geometric count. The proper Cartier-intersection/length formula is the read Stacks 43.16.4 interface; its use is restricted to curves on a smooth surface. There is no assertion about arbitrary higher-dimensional intersections.

### W3. Spend each component's own canonical intersection

For every component, C_i²≤k_i. If C_i²≤0, this is nefness. If C_i²>0, expand
k_i=a_i C_i²+Σ_{j≠i}a_j C_i.C_j and use a_i≥1 and nonnegative distinct-curve intersections.

Adjunction now gives p_i−1=(C_i²+k_i)/2≤k_i. Thus the genus budget holds separately on any subset of components:

```text
Σ_{i∈J} a_i(p_i−1) ≤ Σ_{i∈J}a_i k_i,
Σ_all i a_i k_i = D².
```

This is stronger accounting than applying Lemma 3.6 twice to two disjoint groups: the latter would spend D² twice.

### W4–W6. Fixed and moved contributions

For i∈I₀, the sum of zero orders over any subset of C̃_i is ≤2g_i−2. W1 gives

```text
a_i Σ_x Σ_{y∈ν_i⁻¹(x)}(ord_y η_i+1)
 ≤ a_i[q−1+(2√q+2)g_i+2δ_i]
 ≤ (q+4√q+3)a_i(p_i−1)
 ≤ (q+4√q+3)a_i k_i.
```

The middle difference, divided by a_i, is exactly
(g_i−2)(q+2√q+1)+δ_i(q+4√q+1), so is nonnegative. This explicitly uses g_i≥2.

For i∈I₁, a rational point on C_i lies also on the **distinct** C_{σi}. W2 yields B_i≤C_i.C_{σi}. Since the conjugate has the same multiplicity,

```text
a_i B_i ≤ Σ_{j≠i} a_j C_i.C_j = k_i−a_i C_i².
```

Combine zero orders and branches before applying adjunction:

```text
a_i Σ_x Σ_{y∈ν_i⁻¹(x)}(ord_y η_i+1)
 ≤ a_i(2g_i−2)+k_i−a_i C_i²
 = (a_i+1)k_i−2a_iδ_i
 ≤ 2a_i k_i.
```

This works for any Frobenius orbit length >1. It uses neither a fictitious F_q-point count for C̃_i nor nonnegative self-intersection. Negative self-intersections are allowed; nefness applies to k_i.

### W7–W8. Sum once and use the local analytic interface

Since q+4√q+3≥2, W3–W6 give

```text
Σ_x m(x) ≤ (q+4√q+3)Σ_all i a_i k_i
         = (q+4√q+3)D².
```

This repairs the weighted surface sum while leaving the general Lemma 3.15 false.

For a set T with reduction map to S(F_q), if every fiber is finite and bounded by 1+m(x)/(1−λ), 0≤λ<1, the finite disjoint union and W7 give
#T≤#S(F_q)+(q+4√q+3)D²/(1−λ).
For the intended application T=Γ∩X(K), λ=e/(p−1) and D²=K_X², **after** the existing local and geometric interfaces have been proved. This conditional endpoint is not an assumption that all upstream original-source gaps have disappeared.

## Ownership and library boundary

The fresh reviewed audit rows are SF.4/5, WC.1/5 and ED.4. Their full target descriptions and the matching current atlas stages and owner-document passages were read. A bounded search of all packets, proposed roadmap records, integrated decompositions and reserved IDs did not locate a competing Frobenius-branch/canonical-budget endpoint.

- **SchemeAndStackFoundations SF.4/5** takes `local-branch-intersection` and `canonical-component-budget`. It already owns normalization, surface adjunction and the geometric intersection product. Existing curve/function-field infrastructure is imported.
- **WeilConjectures WC.1/5** takes `branch-profile` and `moved-component-branches`, building on its finite-field/Galois dictionary and the already routed delta-corrected fixed-curve count.
- The already proposed **EffectiveDiophantineMethodsPartIISurfaceChabauty** takes `fixed-component-cost`, `moved-component-cost`, `weighted-jet-repair` and `numeric-global-conditional`. Its brief is extended with the exact replacement proof, not a third roadmap. The source-qualified historical endpoints remain distinct.

At the exact Mathlib pin, I read `Module.length_eq_add_of_exact`, `Module.length_pos`, `Module.length_ne_top` in RingTheory/Length.lean, and `FiniteField.frobeniusAlgEquivOfAlgebraic` with its coercion and iterate lemmas in FieldTheory/Finite/Basic.lean. Four narrow imports record the actual statements. These do not supply normalization geometry, intersection multiplicity or descent of a component. The scalar automorphism is deliberately separate from its missing scheme action.

The Tau Ceti pin was searched for intersections, adjunction, geometric branches, delta invariants, genus and Chabauty. Its NumericalType carrier was inspected: the required fiber relation Σ_j m_j a_ij=0 belongs to a special fiber over a DVR. A nef canonical divisor of positive square does **not** satisfy that relation, so this existing numerical carrier is not reused as an inaccurate model. The reviewed audit likewise says the geometric surface intersection product and Hasse–Weil bound remain unbuilt.

Thirteen selected producer–consumer edges are in `continuationDependencies`; they are acyclic. They supplement rather than purport to exhaust the inherited dependency graph.

## Source issues, validation and remaining work

The extraction now records the already-known atlas finding E1 under `sourceIssues`, with this new restricted repair and no independent verdict. It does not create a second error claim, contact authors, or edit the separately assigned errata files. Other inherited findings remain in that existing E1–E13 ledger. The exact fresh searches and version limits are recorded.

The executable regression below passed **80,195 exact assertions**, including the F_3 nodal counterexample, its F_9 conjugate branches, all permutations of fibers of size ≤7, tangency/branch-length sums, coefficientwise stable-component inequalities, negative self-intersection inputs, and 4,939 Frobenius-invariant weighted numerical matrices. Those matrices are numerical tests, **not claimed geometric realizations**. The script is not a proof of general intersection theory or a substitute for independent review.

Repository paper and intake checks, original-ID/status/statement preservation, unique missing routes, D/C API/test coverage, selected-edge acyclicity and extraction of the regression from this report are checked before submission. No Lean file is requested, created or compiled.

Resume with G0 final publication acquisition and theorem-by-theorem matching. Independently audit W1–W8, especially semilinear versus absolute Frobenius, local branch-length comparison and the subset canonical budget. Close SF.4/5's actual scheme/cohomology/adjunction suppliers and WC.1/5's descent/Weil interfaces before implementation. G4's finite-difference argument is inherited from cc-fb70e5, not a newly read Bourbaki original. G2/G3/G5 and the remaining G6 source tasks are not declared closed by this continuation.

### Reproducible finite regression

```python
"""Finite regressions for the CP23 componentwise repair; not a geometry proof."""
from fractions import Fraction
from itertools import permutations, product
from random import Random

checks = 0
def check(claim):
    global checks
    assert claim
    checks += 1

# The preprint's false lemma must remain false: nonsplit nodal cubic over F_3.
pts = [(x, y) for x in range(3) for y in range(3)
       if (y*y-x*x*(x-1)) % 3 == 0]
check(pts == [(0, 0), (1, 0), (2, 1), (2, 2)])
check(len(pts) + 1 == 5)
check(len(pts) + 2 == 6 > 4)
# F_9 = F_3[i]/(i^2+1), two conjugate preimages of the rational node.
def mul(x, y):
    a, b = x; c, d = y
    return ((a*c-b*d) % 3, (a*d+b*c) % 3)
def power(x, n):
    y = (1, 0)
    for _ in range(n): y = mul(y, x)
    return y
roots = [z for z in product(range(3), repeat=2) if power(z, 2) == (2, 0)]
check(roots == [(0, 1), (0, 2)])
check([power(z, 3) for z in roots] == roots[::-1])

# Local branch delta bound: CRT gives delta >= branches - 1.
# A permutation of a fiber models its Frobenius action; only fixed branches
# are rational normalization points. No orbit length is silently discarded.
for b in range(1, 8):
    for perm in permutations(range(b)):
        rational = sum(i == perm[i] for i in range(b))
        extra = b - rational
        delta = b - 1
        check(extra <= 2*delta)

# Formal local intersection example f = product(y-c*x^n), g = y:
# every smooth branch contributes n; includes tangency and multiple branches.
for orders in product(range(1, 7), repeat=3):
    check(len(orders) <= sum(orders))

# Stable-component majorant, coefficientwise in r=sqrt(q), hence no rounding.
for q, g, delta in product(range(2, 80), range(2, 20), range(20)):
    pa = g + delta
    # (q+4r+3)(pa-1) - [q-1+(2r+2)g+2delta]
    diff = ((q+3)*(pa-1) - (q-1+2*g+2*delta), 4*(pa-1)-2*g)
    factor = ((g-2)*(q+1)+delta*(q+1), 2*(g-2)+4*delta)
    check(diff == factor and min(diff) >= 0)

# Canonical component budget and moved-component cancellation, including
# negative self-intersection. These are numerical inputs, not realized surfaces.
for a, self_int, other in product(range(1, 8), range(-30, 31), range(61)):
    kdeg = a*self_int + other
    if kdeg < 0 or (self_int+kdeg) % 2: continue
    pa = 1 + (self_int+kdeg)//2
    if pa < 2: continue
    check(self_int <= kdeg and pa-1 <= kdeg)
    for g in (2, pa):
        delta = pa-g
        moved = a*(2*g-2) + other
        check(moved == (a+1)*kdeg - 2*a*delta)
        check(moved <= 2*a*kdeg)

# Whole weighted sums on Frobenius-invariant numerical intersection matrices.
# Three components: one fixed, two exchanged; weights are orbit-constant.
rng = Random(1235)
accepted = 0
for _ in range(20000):
    a = [rng.randrange(1, 5), rng.randrange(1, 5), 0]; a[2] = a[1]
    d0, d1 = rng.randrange(-12, 13), rng.randrange(-12, 13)
    cross, pair = rng.randrange(13), rng.randrange(13)
    mat = [[d0,cross,cross], [cross,d1,pair], [cross,pair,d1]]
    kdeg = [sum(a[j]*mat[i][j] for j in range(3)) for i in range(3)]
    if min(kdeg) <= 0 or any((mat[i][i]+kdeg[i]) % 2 for i in range(3)): continue
    pa = [1+(mat[i][i]+kdeg[i])//2 for i in range(3)]
    if min(pa) < 2: continue
    g = [rng.randrange(2,pa[0]+1), rng.randrange(2,pa[1]+1), 0]; g[2] = g[1]
    delta = [pa[i]-g[i] for i in range(3)]
    s = sum(a[i]*kdeg[i] for i in range(3))
    q = rng.choice([2,3,4,5,7,8,9,11,16,25])
    # Stable contribution = a0*(q-1+2*g0+2*delta0 + 2*g0*sqrt(q)).
    lhs0 = a[0]*(q-1+2*g[0]+2*delta[0])
    lhs1 = 2*a[0]*g[0]
    # At a rational point of C1, C2 also passes through it; branch bound <= pair.
    lhs0 += sum(a[i]*(2*g[i]-2+pair) for i in (1,2))
    check(lhs0 <= (q+3)*s and lhs1 <= 4*s)
    accepted += 1
check(accepted > 1000)

# The genus restriction is essential to the stable-component estimate.
check(3-1+2*0+2*1 > (3+3)*(0+1-1))
# Ampleness is not inferred from positive coefficients: nefness is required.
check(not (-1 <= -2))
# Conditional residue-disc bound keeps its leading one and ramification factor.
for p, e, m, residue_count in product([5,7,11], range(1,4), range(7), range(1,5)):
    factor = Fraction(p-1,p-1-e)
    check(factor > 0)
    check(residue_count*(1+factor*m) == residue_count + factor*(residue_count*m))
print(f'PASS: {checks} exact assertions; {accepted} Frobenius-invariant numerical matrices')
```

---

# Historical checkpoint (preserved verbatim)

# Caro–Pasten: surface Chabauty intake checkpoint

**Partial; Codex — codex-c83e7a; issue #1235.** The available preprint has been read completely and extracted into 149 atomic items: 7 library, 13 planned, and 129 missing. The 14 routes cover 109 missing and 12 planned items. All 37 definitions/constructions carry a consumer-derived API and at least three discriminating tests. Twenty missing records are deliberately unrouted because they are false as printed, depend on a failed argument, or still lack an established original supplier/owner. This is a checkpoint, not a claim of complete closure or formalization.

## Read source and version boundary

The primary source is [Caro–Pasten, arXiv:2102.01055v2](https://arxiv.org/abs/2102.01055v2), submitted 10 February 2021 (PDF dated 12 February), 39 pages: §§1–11, proofs and references all read. The [Inventiones publication](https://doi.org/10.1007/s00222-023-01217-1), volume 234(3) (2023), pp.1197–1250, has 54 pages. The official article preview was accessible, but its canonical PDF download returned HTML. The author-page request failed certificate validation. The publication was **not acquired or matched**. All numbered locators and error findings below concern arXiv v2, not an assertion that the final article contains the same errors.

Only the first three pages of [Balakrishnan–Caro v2](https://arxiv.org/abs/2501.03483v2) were read as version evidence. Its introduction quotes published CP Corollary 1.15 with **p+4√p+5**, for W₂, whereas the read CP preprint has **p+4√p+3**, for the nonhyperelliptic symmetric square. That difference prevents substituting the preprint for the final paper. The later paper's refined hyperelliptic theorem is not used as a proof of the missing publication.

The following exact files were retained and hashed. Reading extent is intentionally narrower than download extent for prerequisites.

| Source | SHA-256 | Extent actually read |
|---|---|---|
| arxiv.pdf | `d7398c4bc32d7ce631e8397145e63276e33f037070a252ba16442c01500c67f7` | all 39 pages, §§1–11 and references |
| debarre | `86eedcb80bdad55187d95c1fcb101d4222ac65dccf274e69214551502c2e179a` | §2 through Theorem 2.1; §3 through Lemma 3.6; beginning of §4 |
| garcia-fritz | `235bacd792acfecaf8d24a7d31e37f1b8f6b673d80b58763387903786d633fb5` | Theorem 2.69 proof; §3.1 integral-curve definition; Proposition 3.29 proof and adjacent definitions |
| aubry-perret | `8efdf0ad3f2e5ee02a3bed7686c5dcceda14ff88260c8a8f3ca3db9112bd42e2` | normalization notation; opening of Theorem 1 proof; normalization comparison and Theorems 10–11 |
| https://arxiv.org/pdf/2501.03483 | `9a83eb14f5566b3f13026ab85394babecf327ffb92622606aa382d47d7b03e79` | first three PDF pages only |

Acquisition timestamps and URLs are recorded in `source.files`. Debarre is the published Numdam scan. The Garcia-Fritz thesis is 273 pages; only its branch correspondence and selected functoriality arguments were inspected. Its characteristic-zero branch setting is not evidence for an arbitrary-characteristic theorem. The Aubry–Perret author PDF was read only in the selected normalization/Frobenius passages, not in full.

## Mathematical scope and dependency chain

Fix K/Q_p finite, integer ring R, ramification e, residue field F_q, and |π|=q⁻¹. Take an abelian scheme A/R of dimension n≥3 and a smooth proper geometrically integral relative surface X closed in A. Let G⊂A(K) be finitely generated of rank≤1, Γ its closure, and s=K_X². The local analytic condition is p>max(e+1,exp(e/exp(1))). The two geometric alternatives are:

1. n=3, generic X of general type, special X containing no geometric elliptic curve, and p>128s²/9.
2. Special A geometrically simple, with an ample H on generic A and p>max(3s+2, n!(3deg_H X+cdeg_H X)^n/(n^n H^n)).

The preprint's global endpoint is

\[
\#(\Gamma\cap X(K))\leq\#X(\mathbf F_q)+
(1-e/(p-1))^{-1}(q+4\sqrt q+3)s.
\]

Its useful local architecture survives independently of the failed final point-count lemma. Place Γ∩U_e inside one analytic formal-group direction. Choose two integral annihilating forms whose reductions are independent. Geometric restriction theorems ensure their wedge is nonzero on the special surface, giving an ample canonical divisor D=Σa_jC_j. Choose **one** linear combination w whose restriction is nonzero on every normalized geometric component. Define m(x) as the supremum of orders of simultaneously integral closed immersed jets through x. The overdetermined theorem bounds it by the sum of vanishing orders and branch contributions. Genus/delta and canonical intersection inequalities give m(x)≤3s≤p−3.

A unit coefficient of an equation of X appears by degree m(x)+1 along the exponential direction. Strassmann with λ=e/(p−1) then gives

\[
\#(\Gamma\cap X(K)\cap U_x)\leq1+\frac{m(x)}{1-e/(p-1)}.
\]

This is the source-qualified local endpoint assigned to the surface extension. Outside D the bound is one. Summing gives a finite bound retaining the actual finite jet sum. Reducing that sum to the preprint's stated numerical expression is a separate, presently unclosed step. General original-source gaps and the corrected formal construction must also close before any Lean proof is claimed.

## G0–G6: evidence, corrections and open work

**G0 — Publication reconciliation.** Obtain the 54-page 2023 text legally, compare theorem numbers, hypotheses, constants and proofs, and revise the inventory against it. A title match and a later citation do not establish equality of versions. Preserve this checkpoint's v2 findings as version-specific evidence.

**G1 — Geometric branches are not rational normalization points.** Lemma 3.15 is false. Over F₃ consider the projective closure of y²=x²(x−1). It is geometrically integral, with normalization P¹ parametrized by x=t²+1, y=t(t²+1), and a nonsplit ordinary node (0,0). Its affine rational points are (0,0),(1,0),(2,1),(2,2), plus one point at infinity. The node has two geometric branches, whose normalization parameters are ±i∈F₉. Thus #C(F₃)=5 and A_C(F₃)=6, whereas the claimed bound is q+1=4 because the normalization has genus zero.

The error in the proof is identifiable: a roots-of-unity norm does not recover individual zeros/poles of a rational function. For this curve,

\[
Z_C(T)=\frac{1+T}{(1-T)(1-qT)},\qquad
Z_C^*(T)=\frac{1+T}{(1-T)^2(1-qT)}.
\]

The extra factor (1+T)/(1−T) cancels under T↦−T. Lemma 3.17's norm identity is valid but its use in Lemma 3.15 is not. The PDF image of page 11 confirms this is not text-extraction corruption.

A limited repair is established for a **geometrically integral** curve: A_C(F_q)≤#C̃(F_q)+2Σδ≤q+1+2g√q+2(p_a−g). At a rational singularity only nonrational branches contribute extra; their number is either zero or ≤b≤δ+1≤2δ. This repair and its hypotheses have their own routed item. It does not by itself close the general weighted sum over Frobenius orbits of distinct geometric components: orbit intersections also contribute. Do not infer the full +3 endpoint from this restricted lemma, or claim the later +5 formula without reading its proof. The local residue bound does not use Lemma 3.15.

**G2 — Sharpness coordinates.** In Remark 4.7 the forms ds₁+s₁²ds₂ and ds₁+s₂²ds₂ pull back to dz under (s₁,s₂)=(z,0); they are not integral. The corrected jet (0,z) modulo z³ gives pullbacks 0,z²dz, which vanish when char k≠2,3. The two transverse branches of the wedge give the sharp bound m=2. Literal and corrected claims are separate records; the PDF image of page 13 confirms the coordinates.

**G3 — Morikawa signs and the threefold threshold.** Debarre §3.4 gives tr α=2(C.H), so the negative sign in the CP Lemma 5.4 proof is a typo. The injectivity argument uses positive roots γ_i and their positive sum. The Abel factorization also requires translating ν so its chosen base point maps to zero; invariant differentials are unaffected.

In Lemma 5.5(i), n=3 and H=X give n! cdeg_H(X)^n/(n^n H^n)=2s²/9, not the printed 2s/3. For s=6, p=7 satisfies p>s but fails p>2s²/9=8. This disproves the printed implication, not necessarily the theorem at the weaker threshold. The safe routed version assumes p>max(s,2s²/9). The main geometric threshold p>128s²/9 already implies it. The page-18 image confirms the formula. Keep Nakai's generating-hypersurface theorem as an original-source task, not an invented consequence of the numerical inequality.

**G4 — Formal multiplication is not a higher finite difference.** The definitions call Ψ^[m] multiplication-by-m, but Lemma 7.4 says it has no terms below degree m. Already for the additive group [2](t)=2t. The displayed logarithm sum with coefficient (−1)^m/m therefore has the wrong linear sign and is not coefficientwise convergent with that meaning of Ψ^[m]. The page-24 image confirms both the statement and definitions. The literal statements are withheld.

A concrete replacement proof programme uses a basis of integral invariant derivations D_i on the completed smooth commutative group. They commute. Define the exponential coefficient of multi-degree α by D^α(t_j)(0)/α!; prove its group identity, coordinate compatibility and inverse. If |α|=m then α! divides m!, giving m!c_α∈R. For the logarithm, integrate closed integral invariant forms degree by degree using Euler contraction, obtaining m c_α∈R in degree m. The valuation bound v_p(m!)≤(m−1)/(p−1) yields the required exponential radius and short-jet integrality. This is a specified corrected proof task, not a claim that the missing Bourbaki source has been checked or the argument formalized.

Keep two truncation thresholds distinct: exponential coefficients are integral for m<p; Ω_(R[z]/z^(m+1))/R is free of rank m only when m≤p−2. At m=p−1 its relation is pz^(p−1)dz, leaving p-torsion. That freeness is needed to descend vanishing from K to R before reduction. Ordinary algebraic differentials of K[[z]] must not be identified with continuous/universally finite differentials without a comparison theorem.

**G5 — Saturation, positivity and other proof repairs.** The proof of Lemma 9.7 incorrectly infers independent reductions from primitive K-independent vectors. In R³, e₁ and e₁+πe₂ are primitive and independent over K but have the same reduction. Use instead the kernel of evaluation at a primitive direction: it is a split free direct summand of rank n−1, and a basis reduces independently. This proves the required lemma after identifying the invariant differential lattice. The page-31 image confirms the original inference.

Corollary 10.5 is false for hyperelliptic genus three: j:C^(2)→J contracts the g¹₂ curve E≃P¹ and K=θ has intersection zero with E. Restrict the routed ampleness theorem to nonhyperelliptic C, where the Abel map is a closed immersion and θ is ample. Show V is nef using its moving family; an arbitrary ample-plus-effective sum need not be ample. Page 37 confirms the unrestricted printed claim.

Other corrections retained in the relevant items: intersection of cycles has dimension r₁+r₂−n; the general-dimensional top intersection in Lemma 9.3 is H^n, not H³; Γ∩U_e is intended, not Γ∪U_e; equation (9.5) uses inequalities after the residue counts; translation preserves the leading 1 and the factor (1−e/(p−1))⁻¹; the homogeneous degree-h exponential denominator is h!, not a fixed m!; Lemma 6.2 permits M=1 and λ=0; the m=0 adapted-parameter case is handled separately.

**G6 — Original suppliers still to close.** The preprint's full proofs were read, but citations within them do not count as reading the original proofs. Named remaining tasks include:

- Hironaka, *On the arithmetic genera and the effective genera of algebraic curves*, Kyoto A 30(2) (1957), 177–195: Theorems 1–2 for δ, genus and neighboring-point formulas, with characteristic hypotheses.
- Płoski, *Introduction to the local theory of plane algebraic curves*, Theorem 2.1: branch orders and zero-coordinate conventions. Garcia-Fritz Theorem 2.69 gives a read branch correspondence proof, but its characteristic-zero context does not close the general case.
- Nakai, *On the theory of differentials on algebraic varieties*, Hiroshima A-I 27 (1963), 7–34, Theorem 5(I): restriction to generating hypersurfaces. The different paper *Notes on invariant differentials on abelian varieties*, Kyoto 3 (1963), 127–135, is the smooth-curve remark and must not be confused with this supplier.
- Debarre's cited Kempf–Mumford–Ramanujan positivity theorem, Matsusaka's Jacobian criterion/factorization and the relevant Mumford ample/very-ample and isogeny results. The selected Debarre proof was read; these deeper originals were not.
- Brody; Green, *Holomorphic Maps to Complex Tori*, AJM 100(3) (1978), 615–620; Yau, *Intrinsic measures of compact complex manifolds*, Math. Ann. 212 (1975), 317–329; and the minimal-surface/classification inputs. Hyperbolicity/general-type rows remain unassigned until their canonical owner and exact hypotheses are established.
- Chavdarov, *The generic irreducibility of the numerator of the zeta function in a family of curves with large monodromy*, Duke 87(1) (1997), 151–180, cited Corollary 6.10: check density, monodromy and odd-dimensional End=Z hypotheses in the original. Density-one endpoints remain withheld.
- The Poincaré cycle formulas, symmetric-square Abel tangent criterion and intersection original sources cited in §10.3. Do not prove a closed immersion solely from injectivity on geometric points.

These tasks are explicit proof dependencies in the briefs. They do not authorize replacing a missing theorem with an opaque assumed proposition.

## Ownership and pinned-library evidence

Libraries were inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations were read in Mathlib `RingTheory/Kaehler/Basic.lean`, `RingTheory/FormalGroup/Basic.lean`, and Tau Ceti `AlgebraicGeometry/AbelianVariety/Basic.lean`, `TangentSpace.lean`, and `RingTheory/PowerSeries/GaussNorm.lean`. The JSON gives full declaration names. The built Gauss maximum and multiplicativity are not a Strassmann zero theorem. Built FormalGroup is one-dimensional. Built abelian varieties are over a field, not relative abelian schemes; the existing elliptic Mordell–Weil theorem is not a theorem for arbitrary A.

The reviewed `data/library-coverage.json` rows for SF.0/3/4/5, AB.A1–A4/A6, ED.4, Coleman L0/L1, RP.1 and the Weil suppliers were checked alongside the corresponding atlas stages. AdicSpacesPartII F0/R1/R2 has no direct audit row under those IDs; its coverage boundary is established by the reviewed SF.4 and Coleman L0/L1 foundational records plus actual declaration searches and the current owner document, not by inventing an audit verdict. The input snapshot is recorded in `source.atlasCommit`; all relevant inputs are rechecked against main before publication.

The shared owner decisions are:

- SF.0 owns the relative differential-sheaf construction and pullback built on ring Ω; SF.4 owns normalization/singularity and good-model inputs; SF.4/5 own the birational and intersection calculations. Upstream AlgebraicCurves/JacobianChallenge constructions are imported.
- AB.A1 supplies invariant forms, A2 polarization, A3 isogeny étaleness, A4/A6 endomorphism polynomials, Morikawa and degree comparisons.
- AdicSpacesPartII F0/R1/R2 supplies formal charts and continuous differential comparisons. AdicEtaleGeometry A2 explicitly delegates this geometry there; it is not a competing owner.
- ED.4 already names Strassmann/Newton residue-disc bounds. Coleman L0/L1 supply analytic integration in the curve programme but are not silently imported wholesale for the formal-group proof. NC.4/5's nonabelian machinery is not needed for a rank-one abelian surface argument.
- WeilConjectures WC.1/5 owns zeta arithmetic and finite-field counts. RP.1 owns general Mordell–Weil.
- The new **Abelian Schemes and Arithmetic Moduli, Part II: integral formal Lie theory** adds the dimension-general integral exponential, analytic directions and short-jet interface. It imports and compares the existing one-dimensional/elliptic carriers. Searches of all atlas owners found p-adic Lie group rings and Heegner formal logarithms, but neither supplied this theorem; those are not duplicated.
- **Effective Diophantine Methods, Part II: surface Chabauty and quadratic points** adds overdetermined jets, geometric form restriction, the local residue bound and symmetric-square application geometry. Its brief quotes the historical global target while expressly blocking it and excluding those numerical endpoint items from the route.

The two new roadmaps have current galaxy ID `arithmeticgeometry`, a named parent, import boundaries, exact endpoints and design instructions for API/tests/Lean signatures. Neither proposes rebuilding an existing Tau Ceti roadmap.

## Coverage and validation

The JSON records every numbered theorem/lemma used in the preprint's proof chain and splits the major alternatives, generic/integral/reduced jet statements and application endpoints. The seven built records are narrow carrier/theorem imports; partial library coverage never marks a larger theorem built. Source-failure statements are records of the claim being investigated, clearly marked in their notes, not assertions that false mathematics is a theorem target.

Python checks passed for finite-field enumeration and normalization of the F₃ nonsplit node (including its two F₉ branches), zeta cancellation, primitive-vector reduction, corrected prime thresholds, factorial valuations, differential torsion at m=p−1, the corrected sharpness example, symmetric-square intersections for g=3,…,30 and the first prime 521. These computations verify the reported counterexamples and numerical identities, not the paper's general theorems. Structural checks enforce unique IDs/routes, correct status boundaries, five PDF hashes, and API/≥3-test coverage for all definitions and constructions. Repository `check_paper.py` and intake path checks are run on the final deliverables. This issue requests JSON/Markdown, so no Lean file was created or compiled.

The intentionally withheld IDs are:

- `PAPER-CARO-PASTEN-23/hyperbolic`
- `PAPER-CARO-PASTEN-23/hyperbolic-surface`
- `PAPER-CARO-PASTEN-23/abelian-surface-general`
- `PAPER-CARO-PASTEN-23/bad-branch-bound`
- `PAPER-CARO-PASTEN-23/sharp-example-source`
- `PAPER-CARO-PASTEN-23/semiinjective-source`
- `PAPER-CARO-PASTEN-23/formal-low-degree-source`
- `PAPER-CARO-PASTEN-23/formal-log-source`
- `PAPER-CARO-PASTEN-23/main-local-source`
- `PAPER-CARO-PASTEN-23/primitive-proof-source`
- `PAPER-CARO-PASTEN-23/global-sum-source`
- `PAPER-CARO-PASTEN-23/number-field-source`
- `PAPER-CARO-PASTEN-23/qp-source`
- `PAPER-CARO-PASTEN-23/rational-three-source`
- `PAPER-CARO-PASTEN-23/rational-simple-source`
- `PAPER-CARO-PASTEN-23/simple-density`
- `PAPER-CARO-PASTEN-23/density-bound-source`
- `PAPER-CARO-PASTEN-23/ample-symmetric-source`
- `PAPER-CARO-PASTEN-23/symmetric-bound-source`
- `PAPER-CARO-PASTEN-23/genus-three-source`

Resume with G0, then the weighted Frobenius/branch correction G1, corrected formal construction G4, and original suppliers G6. Reconcile changed statements before promoting this checkpoint to complete.

## Continuation: G4 closed by finite differences (Claude Code, cc-fb70e5, 22 September 2026)

The paper's formal-group series are correct once Ψ^[m] is read as the m-th finite difference

  Δ^m = Σ_{i=0}^{m} (−1)^{m−i} C(m,i) [i],

the series of Bourbaki III.5.3 that the paper cites, and the logarithm sign is (−1)^{m−1}. The printed statements (Ψ^[m] = [m], sign (−1)^m) are false. They remain withheld as `formal-low-degree-source` and `formal-log-source`, and are recorded as errata E7.

Two new items, `formal-finite-difference` and `formal-finite-difference-vanishing`, carry the argument. Over K, [i] = Exp(i·Log), so each degree-d coefficient of [i] is a polynomial in i of degree ≤ d, whose top coefficient is Exp's coefficient. Taking finite differences gives:
- Δ^m has no terms of degree < m (the corrected Lemma 7.4);
- the degree-m part of Δ^m is m!·(the degree-m part of Exp);
- by Newton interpolation and differentiation at i = 0, Log = Σ ((−1)^{m−1}/m) Δ^m.

Since Δ^m has coefficients in R, m!·c_α ∈ R and |b_α| ≤ max_{m≤|α|}|1/m|. These are exactly the inputs of Lemmas 7.5–7.7, and `formal-denominators`, `formal-log-radius` and `formal-exp-bound` now carry these proofs. An exact check, for the law with logarithm t+at²+bt³ through degree 4, confirms the corrected series.

The invariant-derivation route of G4 remains a valid alternative but is no longer needed. The new items join the integral formal Lie theory Part II route.
