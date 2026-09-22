# PAPER-WOOD-19 — Nonabelian Cohen–Lenstra moments

Partial checkpoint, not a completed extraction or formalisation. There are **299 items: 5 library, 13 planned, 281 missing**. Of the missing items, 280 have exactly one route; **only /143 remains deliberately unrouted**. The continuation by Claude Code (cc-fb70e5, 22 September 2026) resolved /99; see "Resolving /99" below. All 249 inherited identifiers and all 72 table rows are preserved. This continuation adds 48 items and closes five of the seven inherited routing gaps.

Agent: Codex, session codex-a71f92, issue #1330. Continues codex-c83e7a's checkpoint PR #1550. Claim comment 5766309278 was confirmed by bot comment 5766311283; the whole issue was reread after confirmation.

## Sources and what was actually read

Main source: Melanie Matchett Wood, with Appendix A jointly with Philip Matchett Wood, *Duke Mathematical Journal* 168(3) (2019), 377–427, [DOI](https://doi.org/10.1215/00127094-2018-0037). The [author's page](https://people.math.harvard.edu/~mmwood/Publications/) links the older [arXiv v2 preprint](https://arxiv.org/pdf/1702.04644v2), dated 13 July 2018. This worker read all 40 pages, every proof, Appendix A and references, and visually inspected tables pp.33–34 and Figure 1 p.37.

The bibliographic record matches, but final typeset wording is not certified: the publisher endpoint returned HTML and the NSF published-copy endpoint timed out. The prior checkpoint inspected Duke_Final_Revision.tex; this continuation did not re-download that archive. No claim is made that access to the preprint establishes sentence-level equivalence with the published article.

Additional reading:

- All 13 pages of [Wood (2021), *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland*](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf), including proofs. Its later reproof is especially useful for the universal extension, abelianization and stable braid-orbit inputs.
- [EVW12 v1](https://arxiv.org/pdf/1212.0923v1): §7.3 homology-image argument; §§8.2.1–8.2.4 on tangential basepoints; Proposition 8.7.1 proof, Theorem 8.7.3 and Example 9.3.2. The prior worker additionally read selected pp.32–38,40–41,49–55. Neither worker claims a full reading of the 70-page paper.
- [EVW16 published version](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf): §§7.1–7.8, including the full Lemma 7.6 and Proposition 7.7 proofs, pp.765–770.
- [Milne ADT](https://www.jmilne.org/math/Books/ADTnot.pdf): I §4 standing hypotheses, Theorem 4.10 and Example 4.11, pp.48–58; not the entire global-duality proof. [Milne CFT v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf): VIII §§1–2, pp.229–234, including the Grunwald–Wang character statement and exception.
- [Delange (1954)](https://www.numdam.org/item/ASENS_1954_3_71_3_213_0.pdf): standing hypotheses p.213, §5.2.1 Theorem III and its proof pp.235–238, not the whole article.
- [Bhargava](https://arxiv.org/pdf/1402.0031): Theorem 1.4 and context pp.3–4, full proof §4.4 pp.23–25. [Alberts, published JTNB version](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf): Corollary 4.10 and Theorem 4.11 with proofs pp.656–657.

Retrieved 21 September 2026:

| Artifact | SHA-256 |
| --- | --- |
| Wood19 arXiv v2 | 2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd |
| Wood21 author PDF | 9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673 |
| EVW12 v1 | 3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4 |
| EVW16 published | 6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6 |
| Milne ADT | 2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31 |
| Milne CFT | 50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5 |
| Delange | 4934b4bfba12d405fc267fa0c0318c3034ab29c9e8223388019377bb45ca0998 |
| Bhargava | f7bbd98a2382e170df8f0d4279332a25541f47ba56df1b59879a36c004078c66 |
| Alberts | b81dd8b0ba5a12f35d472a551b12efbc13d38a777a1069a253a72511b8390b43 |

EVW12's current arXiv record is a withdrawal notice concerning §§6 and 12. Wood's footnote says those results are not used. Wood21 independently reproves important remaining inputs, but does not justify importing a higher homology stability theorem. Its marked point in §§5–6 is unramified; the ramified-at-infinity application still needs the tangential EVW12/SGA interfaces.

## Mathematical scope

Good admissible embedded types G′≤G≀C2 have conjectural number-field moments corrected by reduced Schur-multiplier 2-torsion. Real rigid counts are counts of pairs (ρ,y); their denominator differs from the imaginary rigid count. The proved good-type function-field theorem additionally requires centerless G′, fixes sufficiently large discriminant degree 2n, and sends q→∞ through admissible prime powers. The multiplier factor |H₂(G′,c)[q−1]| stays inside the normalization. This is not a fixed-q, growing-discriminant theorem.

The invariant depends on a chosen reduced cover; it has proved independence properties, not a canonical identification of all reduced covers. Component labels include multidegree and boundary monodromy. The arithmetic statistics consumer imports the marked Hurwitz estimate and the reduced multiplier; it does not own those foundations.

Section 7 proves elementary-two divergence with exponent 2^k−1. The continuation supplies its omitted local factor, imaginary normalization, analytic boundary data and lower-rank subtraction. The appendix's A4 computations remain finite empirical evidence, not a limit theorem.

## Ownership and pinned-library decisions

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The five inherited library classifications were rechecked by opening their declarations:

| Item | Declaration and limited scope |
| --- | --- |
| /1 | Mathlib RegularWreathProduct, rightHom, inl: carrier and injections; coordinate adapter still needed. |
| /20 | groupHomology.H2, H2π, H2Iso: degree-two homology, not reduced covers. |
| /36 | TauCeti.FactorSet.cohomologyClassEquiv and nonempty_splitting_iff_cohomologyClass_eq_zero: abstract extensions; continuous Galois bridge separate. |
| /123 | Subgroup.exists_right_complement'_of_coprime: complement existence, not a canonical complement. |
| /129 | NumberField.finite_of_discr_bdd: fixed-ambient-field Hermite finiteness. |

TauCeti.schurMultiplier is H²(G,k×), not Wood's H₂(G,ℤ). Existing ordinary Schur covers belong to upstream InductionRestriction Layer 7. Full upstream ClassFieldTheory, InductionRestriction and ArithmeticDirichletSeries READMEs were read. Reviewed AUDIT-07/AUDIT-09 statistics/inverse-Galois entries, AUDIT-02 duality, AUDIT-20 FA.4 and AUDIT-01 SF.2 were read with the relevant roadmap stages. Nearby analytic and library searches were also checked. These audits are ownership/evidence records, not proofs of the paper's results.

The ownership screen covered the atlas, additional roadmaps, packets, accepted restructurings and link maps. Relevant ownership paths were unchanged through explorer main d76643df4405140aed1dfade7a21b9159db80017; a fresh compare and tree listing found no new competing higher-pole roadmap. This is a checkpoint-specific screen, not a blanket verification of every atlas item.

| Route | Items | Boundary |
| --- | ---: | --- |
| ArithmeticStatistics ST.0 | 16 | Families, types, infinity and weights. |
| ArithmeticStatistics ST.3 | 145 | Number-field moments, known cases, Euler factors, finite data and appendix algorithm. |
| ArithmeticStatistics ST.5 | 11 | Function-field consequences and convergence modes. |
| InverseGalois IG.1 | 5 | Prime-to-p and tangential peripheral interfaces. |
| InverseGalois IG.3 | 7 | Braid components and invariant comparison. |
| InverseGalois IG.4 | 21 | Central tame lifts and arithmetic invariants. |
| InverseGalois IG.5 | 12 | Marked Hurwitz families and fixed-degree uniform estimates. |
| InductionRestriction, Part II | 56 | Reduced Schur covers, universal marked extensions, discrete actions and finite examples. |
| ArithmeticGaloisDuality R02.4 | 1 | Explicit function-field prime-to-p extension of the current number-field-emphasized scope. |
| ArithmeticDirichletSeries, Part II | 3 | Generic higher-pole Laplace/Dirichlet Tauberian theorem. |

There are two Part II briefs, no unrelated new roadmap. The generic analytic continuation starts precisely after the parent's simple-pole Layer 9; its polynomial-logarithmic growth is not already a shifted-abscissa version of Wiener–Ikehara. Statistics owns the application, not a duplicate Tauberian theorem.

Trace formula /84 is now planned through SF.2's explicit integration of CohomologicalPointCounting. The exact supplier is [upstream PR196's TraceFormula Layer 12](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md), read at head 4bd72379658126cbe9be935656396f0c9dac4de0, alongside Layers 8–14. It is an open roadmap PR, not formalised code. The atlas aliases designate SF.2 as integration owner; the extraction does not invent a nonexistent atlas stage or re-plan the trace formula.

Global fields needed a split: /37 and /53 now restrict their existing number-field suppliers to number fields. /250 adds the function-field Poitou–Tate specialization; /251 imports function-field reciprocity from FA.4. /130's ordinary ideal class group is likewise number-field-only. Upstream CFT explicitly excludes Grunwald–Wang; /39 stays with the embedding-problem application and cites Milne's exact character statement, including the μ4 removal of the exception.

## Closed calculations

### Universal extension and comparison inputs

Wood21 Lemma 2.4 identifies the fiber-product abelianization, and its Theorem 2.5 supplies the universal marked-extension proof. The exact image statement im(H₂(S_c)→H₂(F))=Q_c remains /132, with the five-term/transgression explanation read in EVW12 p.34. The later proof only needs the weaker zero composite /252. They are not conflated.

For a marking discrepancy k_x, multiplying a splitting by the homomorphism sending the class basis to k_x requires its **inverse** to remove the discrepancy; /254 fixes that sign under the source's preceding convention. Stable braid classification uses high-multiplicity stabilization surjectivity, a minimal-cardinality argument, localization at a central monoid element, and stable cancellation. The original Fried–Völklein Appendix Lemma 3 remains an explicit prerequisite.

EVW16's comparison goes through an SNC compactification, finite-étale pushforward, extension by zero, vanishing cycles, proper base change and duality. It is not smooth proper base change applied to a nonproper Hurwitz scheme. The compatible coefficient tower, Qℓ passage and S_n invariants are separate /259; n=1 has its own PConf compactification.

### Elementary-two Euler factors and rigid infinity

Write A=F₂^(k+1), m=2^k, H=kerπ, c=A\H, σ=(0,…,0,1). The three quadratic characters of ℤ₂×/(ℤ₂×)² have values on (−1,5) equal to (1,0),(0,1),(1,1), with conductor exponents 2,3,3. For Sχ=Σ_(t∈c)χ(t), the 2-factor is

    1 + m·2^(−3s) + Sχ(2^(−2s)+2^(−3s)).

Thus T₂=1+m·2^(−2s)+2m·2^(−3s), U₂=1−m·2^(−2s), V₂=1+m·2^(−3s). At odd primes T has factor 1+m p^(−s); U changes its sign when p≡3 mod4; V omits those p≡3 mod4 factors. Character orthogonality gives

    F+ = (T+U+(2m−2)V)/(2m),
    F− = (T−U)/(2m).

The second formula fixes infinity to σ. Selecting only π(infinity)=1 gives mF− and therefore the wrong rigid normalization. This corrects inherited /139; /109 now distinguishes quadratic signature from rigid normalization.

For k≥1,

    T = ζ^m G_T,    U = L(χ4)^m G_U,
    V = ζ^(m/2)L(χ4)^(m/2)G_V.

The residual factors have canceled linear terms and give compact-uniform holomorphic products on Re s>1/2. Finite small-prime factors stay polynomial; no unjustified division by a possibly zero factor is made. In particular U₂(1)=0 at m=4 is harmless. The common leading coefficient is

    G_T(1)/(2m), where
    G_T(1) = (1+m/2)2^(−m) ∏_(p odd)(1+m/p)(1−1/p)^m > 0.

All other poles on Re s=1 are absent. For nonnegative coefficients, Delange's integer-pole theorem applied to α(t)=Σ_(n≤e^t)a_n and Laplace transform F(s)/s gives the common leading counting constant G_T(1)/(2m(m−1)!). This is a primary-source alternative to the unavailable Narkiewicz citation, not a claim to have read that theorem.

For proper images W meeting c, dim W=j+1≤k, so their counts have lower logarithmic exponent 2^j−1. Only W containing σ contribute to the imaginary projector. The j=0 boundary is the O(X) quadratic count, not a fractional-power use of the V formula. This makes the nonsurjective contribution negligible for both signs.

### Known cases and A4 weights

Items /137 and /260–/270 separate all twelve n=3,4,5 sign/type cases of Bhargava Theorem 1.4. The real A_n value is 1/n!, the imaginary value 1/[2(n−2)!]; the real rigid-pair conversion includes the outside-class size n(n−1)/2. Each S_n×C2 case diverges. /271–/274 separately record Alberts's Q8 and D8 cases, normal over ℚ. His D4 denotes Wood's order-8 D8; published numbering differs from Wood's preprint citation.

Aut(A4) has order 24, and all its automorphisms preserve the order-96 embedded type. An eligible embedded class-group kernel produces one A4 extension and hence 24 rigid surjections. Six quotient epimorphisms share the kernel, while the eligible kernels have S3-orbits of size two:

    24 · kernels = 4 · epimorphisms = 48 · S3-orbits.

Cubic input is by isomorphism classes; do not multiply by three for conjugate cubic subfields. The discriminant interval is −X≤Disc<0 for the inclusive cutoff. These are derived algorithm specifications, **not** certification that the source program used those conventions.

## Unresolved work and source qualifications

Only /143 remains unrouted, but routing counts alone do not establish completion.

- Conjecture 5.1 permits arbitrary u. For u=1 the invariant is always 1, so a nonidentity h has zero count. A primitive-generator or Hom-valued correction needs an explicit decision; it is not silently substituted.
- The bad-type proof immediately establishes a liminf bound, not the ordinary q-limit as printed. The remaining component fibers and their q-dependence need analysis. No counterexample to the ordinary limit is asserted.
- The original Romagny–Wewers, Fried–Völklein, Artin–Tate and several SGA proofs remain source debts. Alberts's Lemmermeyer and Goldfeld–Hoffstein inputs have not been independently decomposed.
- No published computation code, exact cubic data version, class-group certificate, prime-2 filtering test or sampling reconstruction was acquired. The synthetic finite-module test below does not reproduce Figure 1.
- All 41 type rows and 31 multiplier/center rows remain source-reported computations; no GAP reproduction or reduced-multiplier certificate is claimed.

Earlier source corrections are preserved: Proposition 4.4 requires admissibility and the kernel projection; bare swap C2 inside C3≀C2 is a rejection test. The peripheral presentation is for the maximal prime-to-p quotient, not the whole tame fundamental group. Split real infinity contributes zero discriminant degree, and the dimension normalizations are 2n or 2n−1 as appropriate. Appendix A's trivial-action group is C2²×C3 of order 12, not the printed order-18 group.

## Verification and reproducible finite tests

The paper schema checker passes. Structural checks verify all 297 distinct IDs, existing stage IDs, valid galaxy IDs, one route for each of the routed missing items, and exactly /143 omitted. Those counts were 277 items and /99,/143 omitted before the /99 continuation; they are now 280 and /143. No Lean file is required for this paper job; none was compiled and nothing is claimed formalised.

The following standalone Python regression was run: **563 exact assertions passed**. It tests the new finite calculations, not analytic continuation, field-table correctness or formal proof. Its SHA-256 is b112a738e1bcc8798db254070cc2ca7235eb109f8de5afea13a1e3d6191d569d.

```python
"""Finite, exact regression witnesses, not formal proofs or field-table validation."""
from collections import Counter
from fractions import Fraction as Q
from itertools import permutations, product

checks = 0
def check(p):
    global checks
    assert p
    checks += 1

def chi(a, b):
    return (-1) ** ((a & b).bit_count() % 2)

for k in range(1, 6):
    m, size = 2**k, 2**(k+1)
    c, sigma = range(m, size), m
    local2 = [(0, 0)]
    for t in c:
        local2 += [(t, 2), (0, 3), (t, 3)]
    # Exhaust all homomorphisms C2^2 -> A and enforce allowed cyclic image.
    actual = Counter()
    for u, v in product(range(size), repeat=2):
        image = {0, u, v, u ^ v}
        if image == {0}:
            actual[(u, 0)] += 1
        elif len(image) == 2 and max(image) in c:
            actual[(u, 3 if v else 2)] += 1
    check(actual == Counter(local2))
    for a in range(size):
        S = sum(chi(a, t) for t in c)
        check(S == (m if a == 0 else -m if a == m else 0))
        coeff = Counter()
        for x, e in local2:
            coeff[e] += chi(a, x)
        check(dict(coeff) == {0: 1, 2: S, 3: m + S})
    for s in (1, 2):
        dist = Counter({0: Q(1)})
        for p in (2, 3, 5, 7):
            choices = local2 if p == 2 else [(0, 0)] + [(t if p % 4 == 3 else 0, 1) for t in c]
            nxt = Counter()
            for x, weight in dist.items():
                for y, e in choices:
                    nxt[x ^ y] += weight / p**(e*s)
            dist = nxt
        T = 1 + m*Q(1, 2**(2*s)) + 2*m*Q(1, 2**(3*s))
        U = 1 - m*Q(1, 2**(2*s))
        V = 1 + m*Q(1, 2**(3*s))
        for p in (3, 5, 7):
            z = Q(m, p**s)
            T *= 1 + z
            U *= 1 + z if p % 4 == 1 else 1 - z
            V *= 1 + z if p % 4 == 1 else 1
        check(dist[0] == (T+U+(2*m-2)*V)/(2*m))
        check(dist[sigma] == (T-U)/(2*m))
        check(sum(dist[t] for t in c) == m*dist[sigma])
        for target in range(size):
            check(dist[target] == sum(chi(a, target)*sum(chi(a, x)*w for x,w in dist.items()) for a in range(size))/size)

# F4 = F2[z]/(z^2+z+1), encoded by two bits.
def mul(a, b):
    r = 0
    while b:
        if b & 1:
            r ^= a
        a <<= 1
        if a & 4:
            a ^= 7
        b >>= 1
    return r

vectors = list(product(range(4), repeat=2))
lines = {frozenset((mul(a,x),mul(a,y)) for a in range(4)) for x,y in vectors if (x,y) != (0,0)}
frob = lambda line: frozenset((mul(x,x),mul(y,y)) for x,y in line)
nonstable = {line for line in lines if frob(line) != line}
check(len(lines) == 5)
check(len(nonstable) == 2)
check(all(frob(line) in nonstable for line in nonstable))
epi = Counter()
for images in product(range(4), repeat=4):
    def value(x,y):
        bits = x | (y << 2)
        out = 0
        for i in range(4):
            if bits & (1 << i):
                out ^= images[i]
        return out
    if len({value(x,y) for x,y in vectors}) == 4:
        kernel = frozenset((x,y) for x,y in vectors if value(x,y) == 0)
        if kernel in nonstable:
            epi[kernel] += 1
check(len(epi) == 2)
check(set(epi.values()) == {6})
check(24*len(epi) == 4*sum(epi.values()) == 48)

S4 = list(permutations(range(4)))
parity = lambda p: sum(p[i] > p[j] for i in range(4) for j in range(i+1,4)) % 2
A4 = [p for p in S4 if parity(p) == 0]
compose = lambda p,q: tuple(p[q[i]] for i in range(4))
inverse = lambda p: tuple(p.index(i) for i in range(4))
automorphisms = {tuple(compose(compose(p,g),inverse(p)) for g in A4) for p in S4}
check(len(automorphisms) == 24)
identity = tuple(range(4))
order2 = [g for g in A4 if g != identity and compose(g,g) == identity]
order3 = [g for g in A4 if g != identity and compose(compose(g,g),g) == identity]
check(len(order2)*len(order3) == 24)
for a,b in product(order3,order2):
    generated = {identity}
    while True:
        enlarged = generated | {compose(g,h) for g in generated for h in (a,b)}
        if enlarged == generated:
            break
        generated = enlarged
    check(len(generated) == 12)
print(f"PASS: {checks} exact assertions; k=1..5 local factors and rigid infinity projectors; F4 quotient weights; Aut(A4)=24 witnesses")
```

## Resolving /99 (continuation, Claude Code, cc-fb70e5)

Conjecture 5.1 as printed quantifies over **every** root of unity u ∈ μ_L, L = Q(μ_{4|G̃′_c|}). By Lemma 3.11, I(φ,u^λ) = I(φ,u)^λ, so I(φ,1) = 1 for every φ, and for u = 1 and h ≠ 1 the count is identically zero (/144). This happens whenever H₂(G′,c)[|μ_Q|] ≠ 1. Wood's own §8.2 table gives such good pairs over ℚ:
- A₄ with G′ = ((C₂⁴)⋊C₃)⋊C₂, SmallGroup(96,227);
- A₅ with G′ = A₅≀C₂.

Both have H₂(G′,c) = C₂.

The extraction now separates three things:
- **/99:** the printed statement, a proposition kept only as the target of the refutation /144 and never used as a hypothesis.
- **/298:** the corrected conjecture, with u a **generator** of μ_L. This is the analogue of u_q ∈ Ẑ(1)^× in Theorem 4.8.
- **/299:** the justification. μ_L is cyclic and |μ_Q| divides |μ_L|, so evaluation at a generator identifies Hom(μ_L, H₂(G′,c)[|μ_Q|]) with H₂(G′,c)[|μ_Q|]. Changing the generator permutes the strata by h ↦ h^λ, so the corrected conjecture does not depend on the choice.

All three go to ArithmeticStatistics ST.3 with the other conjectures (/29–/31); /144 stays with IG.4. The correction is also recorded in `research/blueprint/errata/PAPER-WOOD-19.json` (E7). It is the extraction's correction, not Wood's statement.

**/143 remains open.** The component argument gives only a liminf. For multidegrees with some small n_i, the number of Frobenius-fixed components can depend on q through the cyclotomic action on braid orbits, as can the normalizing |H₂(G′,c)[q−1]|. So existence of the ordinary limit, rather than limits along residue classes of q, is not established. No counterexample is claimed. See errata E1.
