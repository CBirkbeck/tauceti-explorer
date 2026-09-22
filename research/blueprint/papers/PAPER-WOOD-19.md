# PAPER-WOOD-19 — Nonabelian Cohen–Lenstra moments

Partial checkpoint, not a completed extraction or formalisation. There are **319 items: 7 library, 13 planned, 299 missing**; every missing item has exactly one route. All 299 inherited identifiers and all 72 source-table rows are preserved. This continuation adds /300–/319 and routes /143 as an **unproved proposition**, not as an established theorem. Routing completeness does not establish mathematical or source closure.

Agent: Codex, session codex-a71f92, issue #1330. Current claim comment 5774728858 was confirmed by bot comment 5774731090 on 22 September 2026; the whole issue was reread after confirmation. This preserves the earlier PR #1550 continuation and Claude Code cc-fb70e5's /298–/299 correction.

## Sources and what was actually read

Main source: Melanie Matchett Wood, with Appendix A jointly with Philip Matchett Wood, *Duke Mathematical Journal* 168(3) (2019), 377–427, [DOI](https://doi.org/10.1215/00127094-2018-0037). The [author's page](https://people.math.harvard.edu/~mmwood/Publications/) links the older [arXiv v2 preprint](https://arxiv.org/pdf/1702.04644v2), dated 13 July 2018. The earlier continuation read all 40 pages, every proof, Appendix A and references, and visually inspected tables pp.33–34 and Figure 1 p.37.

The bibliographic record matches, but final typeset wording is not certified: the publisher endpoint returned HTML and the NSF published-copy endpoint timed out. The prior checkpoint inspected Duke_Final_Revision.tex; this continuation did not re-download that archive. No claim is made that access to the preprint establishes sentence-level equivalence with the published article.

Additional reading:

- All 13 pages of [Wood (2021), *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland*](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf), including proofs. Its later reproof is especially useful for the universal extension, abelianization and stable braid-orbit inputs.
- [EVW12 v1](https://arxiv.org/pdf/1212.0923v1): §7.3 homology-image argument; §§8.2.1–8.2.4 on tangential basepoints; Proposition 8.7.1 proof, Theorem 8.7.3 and Example 9.3.2. The prior worker additionally read selected pp.32–38,40–41,49–55. Neither worker claims a full reading of the 70-page paper.
- [EVW16 published version](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf): §§7.1–7.8, including the full Lemma 7.6 and Proposition 7.7 proofs, pp.765–770.
- [Milne ADT](https://www.jmilne.org/math/Books/ADTnot.pdf): I §4 standing hypotheses, Theorem 4.10 and Example 4.11, pp.48–58; not the entire global-duality proof. [Milne CFT v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf): VIII §§1–2, pp.229–234, including the Grunwald–Wang character statement and exception.
- [Delange (1954)](https://www.numdam.org/item/ASENS_1954_3_71_3_213_0.pdf): standing hypotheses p.213, §5.2.1 Theorem III and its proof pp.235–238, not the whole article.
- [Bhargava](https://arxiv.org/pdf/1402.0031): Theorem 1.4 and context pp.3–4, full proof §4.4 pp.23–25. [Alberts, published JTNB version](https://www.numdam.org/item/JTNB_2020__32_3_631_0.pdf): Corollary 4.10 and Theorem 4.11 with proofs pp.656–657.

Additional reading on 22 September: Wood19 §§4.1–4.4, including the complete fixed-point and counting proofs; EVW12 §§8.6.2–8.7.3; Wood21's marking correction and a visual check of the Lemma 2.1 displayed word. The NSF published-copy request again timed out.

For the remaining component action, [Seguin, *Fields of Definition of Components of Hurwitz Spaces*](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf), author-hosted 26-page version, was read in §§1–2, §§3.1–3.2 and §6, including every proof there. This is selected supplementary reading, not a full-paper read. Its SHA-256 is bd2084d9af14256e1bbca39d085ebcb73d7a0f191d1d13b68e16e2059484712c. The original Cau theorem used in §3 and the §4/Seg24 dependencies of Proposition 6.2 are not source-closed.

Retrieved 21 September 2026 (retained artifacts):

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

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The five inherited library classifications were rechecked in the earlier continuation; this continuation additionally read the two finite-topology/filter interfaces at the same pins:

| Item | Declaration and limited scope |
| --- | --- |
| /1 | Mathlib RegularWreathProduct, rightHom, inl: carrier and injections; coordinate adapter still needed. |
| /20 | groupHomology.H2, H2π, H2Iso: degree-two homology, not reduced covers. |
| /36 | TauCeti.FactorSet.cohomologyClassEquiv and nonempty_splitting_iff_cohomologyClass_eq_zero: abstract extensions; continuous Galois bridge separate. |
| /123 | Subgroup.exists_right_complement'_of_coprime: complement existence, not a canonical complement. |
| /129 | NumberField.finite_of_discr_bdd: fixed-ambient-field Hermite finiteness. |
| /311 | Finite.instDiscreteTopology and Set.Finite.isDiscrete: finite subsets of T1 spaces are discrete. |
| /312 | Filter.tendsto_pure: convergence to a pure filter is eventual equality. |

TauCeti.schurMultiplier is H²(G,k×), not Wood's H₂(G,ℤ). Existing ordinary Schur covers belong to upstream InductionRestriction Layer 7. Full upstream ClassFieldTheory, InductionRestriction and ArithmeticDirichletSeries READMEs were read. Reviewed AUDIT-07/AUDIT-09 statistics/inverse-Galois entries, AUDIT-02 duality, AUDIT-20 FA.4 and AUDIT-01 SF.2 were read with the relevant roadmap stages. Nearby analytic and library searches were also checked. These audits are ownership/evidence records, not proofs of the paper's results.

The ownership screen covered the atlas, additional roadmaps, packets, accepted restructurings and link maps. Relevant ownership paths were unchanged through explorer main d76643df4405140aed1dfade7a21b9159db80017; a fresh compare and tree listing found no new competing higher-pole roadmap. This is a checkpoint-specific screen, not a blanket verification of every atlas item.

| Route | Items | Boundary |
| --- | ---: | --- |
| ArithmeticStatistics ST.0 | 16 | Families, types, infinity and weights. |
| ArithmeticStatistics ST.3 | 148 | Number-field moments, known cases, Euler factors, finite data and appendix algorithm. |
| ArithmeticStatistics ST.5 | 19 | Function-field consequences and convergence modes. |
| InverseGalois IG.1 | 5 | Prime-to-p and tangential peripheral interfaces. |
| InverseGalois IG.3 | 7 | Braid components and invariant comparison. |
| InverseGalois IG.4 | 21 | Central tame lifts and arithmetic invariants. |
| InverseGalois IG.5 | 18 | Marked Hurwitz families and fixed-degree uniform estimates. |
| InductionRestriction, Part II | 61 | Reduced Schur covers, universal marked extensions, discrete actions and finite examples. |
| ArithmeticGaloisDuality R02.4 | 1 | Explicit function-field prime-to-p extension of the current number-field-emphasized scope. |
| ArithmeticDirichletSeries, Part II | 3 | Generic higher-pole Laplace/Dirichlet Tauberian theorem. |

The live ownership recheck reached main ceda11730ddb903b696ad2d41e4e5ce17bf4d537 and coverage blob 5e708cfc74a51b10e62149113872fe4e00eb5846. The complete Statistics and Inverse-Galois READMEs, current ST.0–5 descriptions and reviewed ST.5/IG.5 audits were read. The two proposed Part II IDs were still absent from the roadmap filenames. All new function-field consumers stay in ST.5, specialized reduced-cover algebra extends the inherited Schur Part II, and the bounded-core Hurwitz input belongs to IG.5.

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

All missing items are now routed, including the unproved proposition /143. The following mathematical and source obligations remain.

- The printed arbitrary-u Conjecture 5.1 remains /99 as a false proposition. The inherited /298 generator-form replacement and /299 generator/Hom equivalence are retained, explicitly distinguished from the source; see “Resolving /99” below.
- The bad-type proof establishes a liminf bound. The new /308 criterion reduces the printed ordinary q-limit to eventual constancy of the whole fixed-degree normalized component profile. Neither that constancy for every bad type nor a genuine admissible-type counterexample is proved. Stable square-class obstructions and boundary components both need attention.
- The original Romagny–Wewers, Fried–Völklein, Artin–Tate and several SGA proofs remain source debts. Alberts's Lemmermeyer and Goldfeld–Hoffstein inputs have not been independently decomposed.
- No published computation code, exact cubic data version, class-group certificate, prime-2 filtering test or sampling reconstruction was acquired. The synthetic finite-module test below does not reproduce Figure 1.
- All 41 type rows and 31 multiplier/center rows remain source-reported computations; no GAP reproduction or reduced-multiplier certificate is claimed.

Earlier source corrections are preserved: Proposition 4.4 requires admissibility and the kernel projection; bare swap C2 inside C3≀C2 is a rejection test. The peripheral presentation is for the maximal prime-to-p quotient, not the whole tame fundamental group. Split real infinity contributes zero discriminant degree, and the dimension normalizations are 2n or 2n−1 as appropriate. Appendix A's trivial-action group is C2²×C3 of order 12, not the printed order-18 group.

## 22 September: complete stable fibers and the whole component profile

Items /300–/305 remove a restriction that the lower-bound proof deliberately imposed. Write F=G′, A=H₂(F,c), choose compatible lifts ĝ_i of the involution classes, and fix the boundary lift ĝ (1 in the real case). For multidegree m, first require the separate abelianization condition Σm_i[c_i]=[g]. Define

    b(g,m) = ĝ² ∏i (ĝ_i²)^(−m_i),    β(g,m) = b(g,m) mod A².

Changing lifts changes b only by a square; β depends only on the parities of m_i. For odd q coprime to |F|, put r=(q−1)/2. Wood's equation (6) becomes h^(q−1)=b^(−r). Its solution set has size either zero or |A[q−1]|. It is nonempty precisely when

    b^r ∈ A^(2r)  ⇔  b ∈ A² A[r].

In additive notation this is the elementary equivalence rb=2ra iff b−2a is r-torsion. Define t_A(b)=min{t≥0:b∈A²A[2^t]}. The odd-primary part is all squares; in a cyclic 2-primary decomposition the threshold is the largest exponent among factors where b has odd coordinate. The fiber survives iff v₂(q−1)≥t_A(b)+1. Proposition 4.1's chosen parities have threshold zero, but no such assertion has been justified for every compatible parity.

For each parity vector ε and threshold N0, let a_i be the least integer at least N0 with parity ε_i. Stable multidegrees of total d are counted exactly by binomial(L+N−1,N−1), where L=(d−Σa_i)/2 is a nonnegative integer; otherwise the count is zero. Item /313 sums this count over **all** abelianization-compatible, surviving parities. This gives the complete normalized stable count, not the discarded boundary.

For fixed n≥2, use d=2n−1 in the imaginary case and d=2n in the real case. Let C_n(q) count **all** Frobenius-fixed geometric components, across all multidegrees of total d, and set P_n(q)=C_n(q)/M(q), M(q)=|A[q−1]|. Item /314 bounds all geometric components uniformly by the rank D_d of the finite-étale parent Hurwitz cover over Conf_d. Each nonempty geometric component surjects onto the connected configuration space and consumes at least one unit of fiber degree. This avoids adding an unsupported H⁰ comparison.

Summing Theorem 4.7 over the fixed components and using the exact denominator q^d(1−q⁻¹) gives

    |Ẽ_n(q)/M(q) − P_n(q)|
        ≤ D_d (K_d q^(−1/2) + q⁻¹)/(1−q⁻¹).

The profile lies in the finite rational set {a/b:0≤a≤D_d,1≤b≤|A|}; distinct values are separated by at least |A|⁻². Therefore /308 proves that the ordinary q-limit exists **iff P_n(q) is eventually constant**. Its liminf and limsup are respectively the smallest and largest profile values occurring for unbounded q. The boundary remainder /310 is nonnegative, but not assumed negligible when n is fixed.

This is an exact criterion and a finite stable-range algorithm, **not** a proof of eventual constancy. The abstract diagnostic A=C2, b nontrivial gives an empty fiber at q=3 and a nonempty one at q=5; no actual admissible Wood type with that obstruction has been certified, so it is not a counterexample to Wood's theorem.

### Bounded-core follow-up, with a scope barrier

Items /315–/319 extract Seguin's product-one component monoid and bounded-core action. For ψ(F)=Σg ord(g), a product-one component x factors into blocks (g repeated ord(g) times) and a core y of degree ≤ψ(F), with the same monodromy subgroup. Nested-monodromy gluing is Galois-equivariant. Thus the full action is determined by the bounded-core permutation action and the cyclotomic character modulo exp(F). For involution-only tuples, every removed block is (g,g) and is Q-defined, leaving only the bounded-core action.

This yields one finite Galois quotient controlling **all degrees of the characteristic-zero product-one problem**. It does not say that the quotient is trivial or cyclotomic. Applying it to finite-field profiles requires the integral moduli/specialization comparison and the actual small-component action. Seguin's marking is unramified at infinity; appending Wood's imaginary boundary involution and forgetting that it is distinguished would change the braid quotient. That comparison is deliberately not asserted.

The original Cau equivariance theorem is an explicit unread prerequisite. Proposition 6.2 was read as a possible finite-certification lead, not imported with its unread §4/Seg24 dependencies silently assumed.

### Source-issue ledger and definition tests

The result JSON includes ten unreviewed source issues. E1–E8 preserve the existing errata IDs/provenance; E1 now distinguishes the proven liminf statement from the finite-profile constancy task. E9 records the inverse needed in Wood21's marking correction, already used by /254. E10 records the incorrect indices/signs in its Lemma 2.1 conjugation word, visually checked against PDF page 2. The author/publisher checks did not locate a published correction; this does not establish novelty. No separate errata file was edited.

The continuation adds 16 API contracts and 24 planned tests for /143, /300, /303, /306, /310, /313, /315 and /318. These are planning interfaces, not executed Lean tests. Older definitions retain their inherited extraction; no new claim is made that every inherited definition has a fully completed blueprint API.

### Reproducible obstruction/profile regression

The inherited 563-assertion regression below was rerun successfully. The following additional standalone Python program passed **6,588 exact assertions**, covering 2,233 finite obstruction fibers, 1,530 parity-composition cases, lift-change invariance and finite-profile separation. It enumerates abstract finite abelian groups and includes odd q that need not be prime powers, which is valid for the algebraic test. It does not compute actual reduced covers, Hurwitz components or number fields.

SHA-256: 2a3c135675e915a7849d14ecb61cfe517bfd53a5f07a8b71b5c478234fec1b8a.

```python
"""Exact algebra/profile diagnostics; not certified Hurwitz or field computations."""
from fractions import Fraction
from itertools import product
from math import comb, gcd, prod

checks = 0
def check(condition):
    global checks
    assert condition
    checks += 1

groups = [(1,), (2,), (3,), (4,), (6,), (8,), (12,), (2,2), (2,4), (4,4), (8,3)]
fiber_cases = 0
for factors in groups:
    A = list(product(*(range(a) for a in factors)))
    zero = tuple(0 for _ in factors)
    def scale(m, x):
        return tuple(m*y % a for a,y in zip(factors,x))
    def add(x,y):
        return tuple((u+v) % a for a,u,v in zip(factors,x,y))
    squares = {scale(2,x) for x in A}
    order = prod(factors)
    e = max((a & -a).bit_length()-1 for a in factors)
    for b in A:
        threshold = next(t for t in range(e+1)
                         if b in {add(x,y) for x in squares for y in A
                                  if scale(2**t,y) == zero})
        # Changing any chosen lift changes b only by a square.
        for square in squares:
            b2 = add(b,square)
            t2 = next(t for t in range(e+1)
                      if b2 in {add(x,y) for x in squares for y in A
                               if scale(2**t,y) == zero})
            check(t2 == threshold)
        for q in range(3, 64, 2):
            if gcd(q,order) != 1:
                continue
            m = (q-1)//2
            direct = sum(scale(q-1,h) == scale(-m,b) for h in A)
            torsion = sum(scale(q-1,h) == zero for h in A)
            power_test = scale(m,b) in {scale(q-1,h) for h in A}
            quotient_test = b in {add(x,y) for x in squares for y in A
                                 if scale(m,y) == zero}
            v2 = ((q-1) & -(q-1)).bit_length()-1
            check(power_test == quotient_test == (v2 >= threshold+1))
            check(direct == (torsion if quotient_test else 0))
            fiber_cases += 1

# Enumerate stable parity multidegrees and compare to stars and bars.
composition_cases = 0
for N in range(1,5):
    for lower in range(3):
        for epsilon in product(range(2), repeat=N):
            a = tuple(lower + ((x-lower) % 2) for x in epsilon)
            for d in range(17):
                def tuples_sum(total, length):
                    if length == 1:
                        yield (total,)
                    else:
                        for x in range(total+1):
                            for tail in tuples_sum(total-x,length-1):
                                yield (x,)+tail
                actual = sum(all(x >= lower and x % 2 == parity
                                 for x,parity in zip(n,epsilon))
                             for n in tuples_sum(d,N))
                remainder = d-sum(a)
                expected = (comb(remainder//2+N-1,N-1)
                            if remainder >= 0 and remainder % 2 == 0 else 0)
                check(actual == expected)
                composition_cases += 1

profile = sorted({Fraction(a,b) for a in range(11) for b in range(1,13)})
for x,y in zip(profile, profile[1:]):
    check(y-x >= Fraction(1,12**2))

# Abstract diagnostic only: a bounded finite profile need not be constant.
alternating_profile = [Fraction(2 if j % 2 else 4,2) for j in range(1,25)]
check(set(alternating_profile) == {1,2})
check(min(alternating_profile) == 1 and max(alternating_profile) == 2)
print(f"PASS: {checks} assertions; {fiber_cases} finite obstruction fibers; "
      f"{composition_cases} parity-composition cases; finite-profile separation")
```

## Verification and reproducible finite tests

The current paper schema/source-issue checker passes. Additional structural checks verify 319 distinct IDs, 299 exact-once missing-item routes, all explicit prerequisite targets and an acyclic dependency graph, inherited-ID preservation and API/test coverage for the newly added definitions/constructions. Ten source issues are recorded as unreviewed, not as accepted errata. No Lean file is required for this paper job; none was compiled and nothing is claimed formalised.

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

**/143 remains mathematically open, now routed as an unproved proposition.** The original component argument gives a liminf. The present continuation analyzes all stable fibers and identifies eventual constancy of the whole normalized component profile as the exact remaining condition. Boundary components need their full Galois action; it has not been proved to be only cyclotomic. Neither ordinary-limit existence for every bad type nor a genuine counterexample is established. See the new /300–/319 analysis and source issue E1.
