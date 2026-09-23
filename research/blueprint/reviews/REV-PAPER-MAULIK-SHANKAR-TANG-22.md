# Independent review: PAPER-MAULIK-SHANKAR-TANG-22

Verdict: **revise**. Reviewer: **Codex — codex-a71f92**. Date: **2026-09-23**. Refs #1277.

This is a completed negative review, not a checkpoint of an unfinished review. The corrected extraction remains partial. Original extraction: Claude Code — cc-7b31c4, [PR #1992](https://github.com/CBirkbeck/tauceti-explorer/pull/1992), merged at `452ee899e9dd745392e01428730d423c94eb1cec`. No review of the reviewer's own extraction is claimed.

## Provenance and reading boundary

Repository snapshot: `fe6b589be4c59d79c013e4fac1e9883542fee2d6`. Original extraction merge commit: `452ee899e9dd745392e01428730d423c94eb1cec`.

The complete [author PDF](https://math.berkeley.edu/~ytang/GSpincharp.pdf), including all 47 pages and references, was read. SHA256: `53f4c42762f179fba71a2d344bee56f3de1fb189f4dd9aea968a4fcbfaedc494`; PDF creation date 25 December 2021. Pages12,20–23,25–27,31,35–36,41 were additionally visually inspected to check mathematical displays. The original report's 45-page description is corrected.

The [published article page](https://link.springer.com/article/10.1007/s00222-022-01097-x), public footnotes, [arXiv version history](https://arxiv.org/abs/2011.08887) and [author publication list](https://math.berkeley.edu/~ytang/) were checked. The full typeset article was unavailable; no statement here asserts that a manuscript error persists in it. The arXiv history lists v1 only. The inherited claim about a v1 source archive is attributed to the extractor and is not an independent source comparison by this reviewer. Bounded correction/erratum searches found no applicable correction; this does not prove none exists.

All 96 inherited items, six original routes and six original source issues were compared with the manuscript. One missing generic prerequisite object is added as item97. The full external supplier literature has not been read: knowing a citation or reading a pending proposal does not close its proof. This limitation is a reason for revise, not a hidden assertion of acceptance.

## Library and atlas audit

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Declaration statements, not just search hits, were read for every library citation retained in the JSON.

| Item | Checked interface | Scope restriction |
| --- | --- | --- |
| 1 | QuadraticMap/QuadraticForm; CliffordAlgebra, even, evenOdd; spinGroup and toUnits | Abstract spin/Clifford algebra is not the reductive GSpin group scheme. |
| 2 | ZSpan.fundamentalDomain; ZLattice.covolume and covolume_eq_measure_fundamentalDomain | Full finite-dimensional discrete lattice/Haar hypotheses; not successive minima or uniform quantitative counts. |
| 3 | WittVector; frobeniusEquiv; FractionRing.frobenius; isDiscreteValuationRing; exists_eq_pow_p_mul' | Perfect characteristic-p base; existing one-dimensional isocrystal material is not general Ogus classification. |
| 10 | DirichletCharacter; LFunction; LFunction_eq_LSeries; riemannZeta | Continuation/Dirichlet-series comparison already present; coefficient adapters remain item69. |
| 69 reuse | TauCeti.Multiquadratic.primeDiscriminantCharFun; DirichletCharacter.twistedDivisorSum | Prime discriminants and natural exponents/two characters, not directly all imprimitive discriminants or negative real exponents. |

Read the actual owner descriptions for ShimuraData D3–D5, ShimuraVarieties V1/V2/V6, AbelianSchemes A4, R07.2/R07.6, CR.0/CR.1/CR.3, MP.1/MP.4, GN.1/GN.3/GN.4, AN.1, compactifications and the upstream fine-modular-curve Layer5. Read the corresponding reviewed aggregate audit rows where present. AN.1's built status is respected; GN minima/densities are unbuilt but planned. The aggregate has no CR/R07 rows; A4's reviewed audit explicitly identifies those missing supplier interfaces, and their stage descriptions were checked directly. The absence of an audit row was not represented as a reviewed absence theorem.

Owner searches included the existing atlas and pending Charles16, SSTT22, Li–Zhang22, Farb–Kisin–Wolfson24 and characteristic-zero Richard–Yafaev routes. This checks coalescence/ownership, not the scientific acceptance of other workers' papers. RS-32's common analytic/toric boundary ownership and R11.3 degenerations are preserved. Generic canonical models, PEL integral charts and general Hodge-type integral charts are not conflated. Existing upstream Tau Ceti roadmaps are imported rather than replanned.

## Extraction corrections

New totals: **97 items = 4 library + 10 planned + 83 missing**. All 83 missing items occur in exactly one route. Two planned items remain on their existing source route as documentation; no Part II takes a library/planned item.

The following is the complete item-level change index relative to PR #1992. Exact corrected statements and notes are in the result JSON; unchanged rows were checked but are not claimed to have been proof-closed.

| Item | Fields corrected |
| --- | --- |
| 1 | library, note |
| 2 | locator |
| 3 | library, note |
| 4 | statement, planned, note |
| 6 | statement |
| 7 | statement, note |
| 9 | statement, note |
| 10 | name, statement, status, library, planned, note |
| 11 | statement |
| 14 | kind, name, statement |
| 16 | note |
| 23 | note |
| 32 | statement |
| 37 | statement |
| 39 | statement |
| 42 | statement |
| 49 | statement |
| 51 | statement |
| 52 | statement |
| 54 | statement |
| 55 | statement |
| 56 | note |
| 59 | statement, locator, note |
| 60 | statement, note |
| 63 | note |
| 64 | note |
| 65 | statement |
| 67 | statement, note |
| 68 | status, planned, note |
| 69 | note |
| 70 | statement |
| 71 | statement |
| 72 | statement |
| 74 | status, planned, note |
| 82 | statement, note |
| 84 | statement, note |
| 85 | statement, note |
| 86 | statement |
| 91 | statement |
| 94 | statement |
| 95 | note |
| 96 | statement |
| 97 | id, kind, name, statement, locator, status, library, planned, note |

Substantive groups: items4/6/7/9/11 narrow the generic infrastructure; item10 becomes library; 14 is explicitly conjectural; 68/74 become planned. Items37/39/42/49/52/54–60/63–65 separate integral lattices, t-adic products and minimality from unproved valuations. Items67/70/71/82 expose formulas and normalization; 72/84/85 replace unjustified equalities by bounds. Items86/91/94–96 specify fan, fibre, properness, descent and unitary hypotheses. Item97 owns only the generic PD envelope; item51 contains the specific obstruction. Other changes correct locators, citations and scope notes.

Top-level changes: status complete→partial; source/version provenance corrected; summary rewritten; all route reasons/briefs corrected, route4 new→Part II, items27–28 moved route1→route3, item51 moved route4→new route7; seven omitted supplier bibliographies added; de Jong prerequisite weakened to the necessary condition actually used; 14 new source findings added, all findings independently adjudicated; review metadata and nine explicit reviewGaps added. No unrelated deliverable is changed.

## Source findings

All locators below refer only to the author manuscript. E4 and E19 are retained as rejected allegations so that their history cannot be mistaken for confirmed errata. The detailed JSON records printed expression, correction, reach, bounded correction search and verdict for every entry.

### E1 — confirmed; misprint; affects nothing

§7, in the proof of Proposition 7.17, the non-superspecial supersingular case; independently checked only in author manuscript (25 December 2021).

the middle expression is 2(p² + p − 1)/(p(p² − 1)); the two summands of the numerator are transposed

The displayed series is (2/(1-p^{-2}))(h(p^{-1}+1)/p² + hp/p⁴ + hp²/p⁶ + ···). Summing the geometric tail, the bracket is h((p+1)/p³ + 1/(p²(p-1))) = h(p²+p-1)/(p³(p-1)), and multiplying by 2p²/(p²-1) gives exactly (h/(p-1))·2(p²+p-1)/(p(p²-1)). At p = 3 this is 22/24 = 11/12, which is where the constant 11/12 comes from and shows the bound is sharp there; numerically, with h = 1 and p = 3 the series is (9/4)(4/27 + 1/18) = 0.4583… = (11/12)·(1/2), confirming it. The printed 2(p²-p+1)/(p(p²-1)) equals 7/12 at p = 3, so as printed the first inequality of the chain is false, although the final bound 11/12 that the proof uses is correct. The same computation carried out for the two superspecial cases of the same proof reproduces the printed constants exactly, 61/62 at p = 5 in case (1) and 17/20 at p = 5 in case (2), which confirms the method.

### E2 — confirmed; misprint; affects nothing

§7, in the proof of Proposition 7.13, the case i = b+2; independently checked only in author manuscript (25 December 2021).

(c₃/T^{2/b})X^{(b+2)/2}, the exponent that Proposition 7.13 itself states

The printed inequality with T^{−2/(b+2)} is a TRUE but weaker bound for T≥1, so it is not a counterexample. The integral estimate Σ_{n≥T}n^{−1−2/b}≤(1+b/2)T^{−2/b} supplies the stronger exponent claimed in the proposition. The mismatch is an intended-exponent slip, not a false inequality.

### E3 — confirmed; misprint; affects nothing

§6, Definition 6.1 (3) and Theorem 6.2 (2); independently checked only in author manuscript (25 December 2021).

the pair (Λ,w), and Span_{Z_p}{Λ,w}; the same substitution is needed in clause (2) of Theorem 6.2

L is the ambient quadratic Z-lattice of signature (b,2) fixed in §2.1 and used with that meaning throughout the paper; the submodule just introduced is Λ ⊂ 𝓛 = 𝕃^{φ=1}, a Z_p-module of rank 2. Span_{Z_p}{L,w} does not parse, since L is not a submodule of 𝓛. The notation (Λ,w) is what the third occurrence of the phrase uses correctly, in the proof of Theorem 6.2, where the pair is written (Span_{Z_p}{e₁,f₁}, e'₁).

### E4 — rejected; misprint; affects nothing

§7, Theorem 7.15 (2), the odd case of the Siegel mass formula; independently checked only in author manuscript (25 December 2021).

No mathematical correction established on the theorem's actual divisor range; χ_{D'} is an equivalent notational choice after proving the square-class/copimality comparison.

The original extractor inferred a misprint because Theorem7.15 defines D′ and uses χ_D in one divisor sum while its L-value uses χ_D′. That inference is rejected: D was defined for L in Theorem7.4, and the two characters agree on the allowed divisors here. See the independent review.reason for the square-class and coprimality argument.

Not established as a source mistake. In this setup the positive determinants det L and det L'_1 have the same rational square class: local isometry away from p makes the valuation differences even there, and the p-discriminant exponent is the even type. Thus D'/D is a positive rational square; for a|f, with f coprime to 2det L'_1 (in particular p), χ_D(a)=χ_{D'}(a). The source's χ_D is defined earlier and gives the same divisor sum. Using χ_{D'} uniformly in item82 is a harmless clarification, not evidence of a false printed formula.

### E5 — confirmed; misprint; affects nothing

§3.5, the construction of the formal curve, in the sentence beginning "For any positive integer j₀"; independently checked only in author manuscript (25 December 2021).

v_{i,n_{j₀+1}-1} = e_i + (Σ_{j=0}^{j₀} p^{n_j})f_i ∈ L_{p^{n_{j₀+1}}}

Two slips in one display. First, the vectors were defined a few lines earlier by v_{i,n} = e_i + (a₀ + a₁p + ··· + a_n p^n)f_i, with the same index i on e and on f; the j in f_j is the bound index of the sum. Second, j is bound by the sum and has no meaning in the subscript of L on the right-hand side; the level at which the vector lies is p^{n_{j₀+1}}, which is also what the next sentence uses when it writes m_j := Q(v_{i,n_{j+1}-1}).

### E6 — confirmed; misprint; affects nothing

§8.1, in the sentence introducing 𝒮^BB; independently checked only in author manuscript (25 December 2021).

Baily–Borel, after Walter L. Baily, Jr.

The author manuscript uses Baily–Borel correctly in §1.5 and misspells it in §8.1. Review confirmation is restricted to this version; the inherited claim about two v1 occurrences was not independently checked.

### E7 — confirmed; error; affects a stated result

Author manuscript (25 December 2021), Proposition7.17 pp.35–36, Theorem7.18 and final proof of Theorem1.2 p.36

Use ≤ in these statements and the last step of the contradiction argument. Preserve 0<α<α'<1.

By §7.12, T=1 makes the main term the empty sum, zero. At supersingular P the proposed positive-α main term grows as X^{1+b/2}, strictly faster than X^{1+(b+2)/4} for b≥3. Hence that equality cannot hold. Both proofs establish only upper bounds; the final contradiction needs only the bounds.

### E8 — confirmed; gap; affects the proof

Author manuscript (25 December 2021), Definition7.6 p.31

Sum over all C(k) for equality; for the displayed subset retain ≤ unless all positive-Hasse-order points are shown to belong to it.

The degree of the pulled-back section of ω^{p−1} sums its orders at all points of C. The cited reason does not establish that its support is contained in a particular Z(m). Nonnegative subset sums give the sufficient upper bound used by the final contradiction.

### E9 — confirmed; misprint; affects nothing

Author manuscript (25 December 2021), Lemma4.3 p.12 and §6.4 p.26

Choose λ²=u∈Z_p^× nonsquare modulo p and σ(λ)=−λ, for example a suitable Teichmüller square root.

If λ_0²=u∈Z_p is such a choice, λ=λ_0+p has the same residue condition but λ²=u+2pλ_0+p²∉Q_p. Then the asserted Z_p-valued Gram entry is not in Z_p. The stronger choice exists and is exactly the one used in the subsequent Frobenius calculation.

### E10 — confirmed; error; affects a stated result

Author manuscript (25 December 2021), Lemma5.9 pp.20–22

Require length l≥2 for the one-row product formula, use Y_{i_j} in each factor, and state image containment over K[[t]]; rank one over K((t)) additionally requires a nonzero scalar.

For l=1,i_1<n the two nonzero independent columns of A_i give rank2. For any positive-length product all entries vanish at t=0, so its K[[t]]-image cannot be the full constant line generated by v_n. Zero Y_i give zero products. The displayed induction and the l=2 case determine the corrected factor index.

### E11 — confirmed; misprint; affects nothing

Author manuscript (25 December 2021), Lemma5.11(3) pp.22–23

Every coordinatewise recombination l_α∈{i_α,j_α} of two minimizing tuples is minimizing.

The printed direction fails already at r=1,n=4 with X_i=Y_i=t (i=1,2,3), no primed coordinates and p=5: a=(1,1,1,2,∞), so (1),(2),(3) all minimize. Taking I=(1),J=(2) excludes the third. The proof establishes the corrected closure direction, and that is what (4),(5) use.

### E12 — confirmed; misprint; affects nothing

Author manuscript (25 December 2021), Lemma5.13 proof p.23

Replace independent by dependent.

In F_25=F_5[u]/(u²−2), 1,u are F_5-independent and the 2×2 Moore determinant is u^5−u=−2u≠0. The surrounding argument already uses independence to deduce invertibility.

### E13 — confirmed; gap; affects the proof

Author manuscript (25 December 2021), §5.14 and Theorem5.15 p.25

From §5.10 the value is a_sΣ_{j=0}^{r+1}p^{sj}. Reprove the generalized decay rate, or state a slower p^s-spaced rate with its actual PD cutoff; do not silently keep Definition5.1's p-spaced threshold.

For p=5,s=2,r=0,a_s=1 the two sums are 26 and 6. Replacing h by a_s does not justify ν_{r+2}/p<h_r+1 by this computation. This is a proof gap for the generalized rate, not a counterexample to the ordinary main theorems, which use s=1.

### E14 — confirmed; gap; affects the proof

Author manuscript (25 December 2021), §§5.5–5.6, §5.10 and proof of Theorem5.2 p.24; §6.3 p.26

Distinguish v_t of the reduction from v_t of a characteristic-zero lifted sum, and recheck the p-denominator/minimal-term argument after cancellation. Coordinate Teichmüller lifts do not make arbitrary sums of products have Teichmüller-unit leading coefficient.

At p=5 in the superspecial split chart with m=3 set x_i=t, y_1=y_2=t, y_3=3t+t². The prescribed lifts give Q(t)=−(2+[3])t²−t³. The Teichmüller lift [3] is 18 mod25, so 2+[3]=20 mod25 is nonzero divisible by5. Thus v_t(Q)=2 while v_t(Q mod5)=3, the actual Hasse order. The same phenomenon affects Y_n,Y_{n+1}, which are sums rather than coordinatewise Teichmüller lifts. A valuation-aware repair remains to be supplied; the main theorem is not declared false.

### E15 — confirmed; error; affects a stated result

Author manuscript (25 December 2021), Lemma6.6 p.27

For α=β=0 use P=I; for α+β>0 keep the two formulas, and require nonzero reduction of the scalar for the stated kernel exclusions. Replace P_{α+β} by P_{α,β}.

The empty product is I, not rank-one N^{(1)}. The zero-factor issue is independent: take x_1=t,y_1=u t in F_25 with u²=2 (other coordinates zero). Q mod5=−u t²≠0 but R mod5=−(u^5+u)t^6=0. For α=0,β=1 the cleared product reduces to zero, so its kernel is the entire two-dimensional space. These zero terms cannot be used for the claimed obstruction.

### E16 — confirmed; gap; affects the proof

Author manuscript (25 December 2021), proof of Theorem6.2, Case2 and opening of Case3, p.28

Treat r<e−1 separately before using these products. For Case2 the candidate index must be truncated (β≤r+1, α=r+1−β); prove the corresponding minimum and obstruction.

When e≥2 and r=0, α=r−e+1 is negative although P was only defined for nonnegative indices. Case3 later treats the small-r branch for e_1,f_1, but its opening assertion about e'_1 and Case2 also need that branch. This is a missing finite-index case, not a disproof of decay.

### E17 — confirmed; misprint; affects nothing

Author manuscript (25 December 2021), Lemma7.5 proof p.30

Insert q^m in each positive-index term of the generating series.

The next sentences take Fourier coefficients and subtract the Eisenstein series; a sum of scalar intersection numbers without the formal/analytic powers cannot be that generating series. Item71 uses the corrected form.

### E18 — confirmed; misprint; affects nothing

Author manuscript (25 December 2021), Lemma7.16 proof p.35

The normalized recurrence gives ≤(1−p^{-1})+p^{-1}(1+p^{-1})=1+p^{-2}≤1+p^{-1}.

The induction bounds p^{1−dim M'} times the representation count, so substituting the count into p^{−dim M'} times it leaves p^{-1}, not p^{−dim M'}. The intended final upper bound is unchanged.

### E19 — rejected; misprint; affects nothing

Author manuscript (25 December 2021), Lemma8.10(1) pp.41–42

State properness explicitly (and, for the adjoint-monodromy argument, the proper adjoint-group image used in the proof). If ⊂ is intended strictly, record that convention.

Under non-strict subset notation Z=Sh_2 contradicts the statement immediately. The proof itself invokes a proper adjoint subgroup. The special-divisor application has the intended positive-codimension scope; this finding clarifies scope and does not dispute that application.

Do not register a confirmed misprint on this evidence: the displayed ⊂ can mean strict inclusion, consistent with the proof's proper-subgroup argument. The extraction should state properness/proper adjoint image explicitly, but the equality counterexample under a different notation convention is not an independently established source error.

### E20 — confirmed; misprint; affects nothing

Author manuscript (25 December 2021), Lemma4.5 proof p.13, §5.7 p.20 and Lemma5.9 proof p.22

Use pφ^{2n−2}(v); block dimensions 2n×2m and 2m×2n; B_2(n+j,2n)=−X_j for 1≤j<n; and w_{i_1}.

These follow directly from v_i=φ^{i−1}(v), rank𝓛_1=2m, the displayed u' matrix in §4.11, and the subsequent evaluation R_{n+i_1}(w_{i_1})=1. The incorrectly excluded last row and negative coordinate index are repaired explicitly in item52.

The E1 majorant is 11/12 for p≥3 (the application has p≥5); the superspecial majorants are 61/62 and 17/20 for p≥5. They are uniform bounds on the comparison series, not attained asymptotic intersection ratios. For E7 the T=1 empty main term disproves the positive-α equality; the proofs supply only inequalities. E13 is a gap in the generalized s>1 rate, independent of the ordinary main theorem. E14–E16 concern auxiliary statements/proof branches, not a claim that the main theorems are false.

## Exact reproducible diagnostics

Python standard library only. This is an executable check of rational identities and concrete finite examples, not a Lean proof of decay. For all admissible p, the three factorizations in coefficient_checks have nonnegative numerator and positive denominator; that sign argument, not just the finite loop, proves the stated majorants. The finite-field and lift tests are exact, with no floating-point rounding. The integral tail estimate for E2 follows separately from the monotone integral comparison.

```python
"""Exact finite checks for the MST review; no claim of formal proof closure."""
from fractions import Fraction as F
from itertools import product


def matmul(a, b):
    return [[sum(x*y for x, y in zip(row, col)) for col in zip(*b)] for row in a]


def finite_field_checks():
    # F_25 = F_5[u]/(u^2-2).
    def add(a, b):
        return ((a[0]+b[0]) % 5, (a[1]+b[1]) % 5)
    def neg(a):
        return ((-a[0]) % 5, (-a[1]) % 5)
    def mul(a, b):
        return ((a[0]*b[0]+2*a[1]*b[1]) % 5,
                (a[0]*b[1]+a[1]*b[0]) % 5)
    def power(a, n):
        z = (1, 0)
        for _ in range(n):
            z = mul(z, a)
        return z
    one, u = (1, 0), (0, 1)
    assert power(u, 5) == neg(u)
    # Independent first row [1,u] has NONZERO Moore determinant.
    det = add(power(u, 5), neg(u))
    assert det != (0, 0)
    # x=t, y=u*t: Q=-u*t^2 nonzero, but R=-(u^5+u)t^6=0.
    assert add(power(u, 5), u) == (0, 0)
    assert neg(u) != (0, 0)


def coefficient_checks():
    for p in range(3, 101):
        series = F(2, 1-F(1,p*p)) * (F(p+1,p**3)+F(1,p*p*(p-1)))
        ratio = series*(p-1)
        assert ratio == F(2*(p*p+p-1), p*(p*p-1))
        assert F(11,12)-ratio == F((p-3)*(11*p*p+9*p-8),12*p*(p*p-1))
        assert ratio <= F(11,12)
        if p >= 5:
            first = F((p+1)**2,2*(p*p+p+1))+F(2*p*p,(p*p+p+1)*(p-1))
            second = F(p+1,2*p)+F(1,p+1)+F(2,p*p-1)
            assert first == F(p**3+5*p*p-p-1,2*(p**3-1))
            assert F(61,62)-first == F((p-5)*(60*p*p-10*p+12),124*(p**3-1))
            assert F(17,20)-second == F((p-5)*(14*p*p+10*p-4),40*p*(p*p-1))
            assert first <= F(61,62) and second <= F(17,20)
    assert F(2*(9+3-1),3*(9-1)) == F(11,12)


def elementary_counterexamples():
    # Teichmuller lift [3] modulo 25 is the unique lift fixed by x -> x^5.
    lifts = [a for a in range(25) if a % 5 == 3 and pow(a,5,25)==a]
    assert lifts == [18]
    assert (2+lifts[0]) % 25 == 20 != 0
    assert (2+lifts[0]) % 5 == 0
    # Q_lift=-(2+[3])t^2-t^3 has order2, Q mod5 has order3.
    assert next(j for j,c in [(2,20),(3,1)] if c % 25) == 2
    assert next(j for j,c in [(2,20),(3,1)] if c % 5) == 3
    # General Newton-stratum exponent, p=5,s=2,r=0,a_s=1.
    assert sum(5**(2*j) for j in range(2)) == 26
    assert sum(5**j for j in range(2)) == 6
    assert 26 > 6
    # Lemma5.11(3): three single-letter minima, not just I=(1),J=(2).
    # Actual n=4,m=0 coordinates Xi=Yi=t give a=(1,1,1,2,infinity).
    values = [1,1,1,2,10**6]
    minima = [j+1 for j,a in enumerate(values) if a == min(values)]
    assert minima == [1,2,3] and 3 not in [1,2]
    # A1 at n=2 has two independent nonzero columns, so rank2 at length1.
    a = [[0,0,0,-1],[0,0,1,0],[0,0,0,0],[0,0,0,0]]
    assert a[0][3]*a[1][2]-a[0][2]*a[1][3] == -1
    # Empty product is I, whereas N^(1) has rank1.
    n = [[F(1,2),F(-2,2)],[F(-1,4),F(1,2)]]
    assert n[0][0]*n[1][1]-n[0][1]*n[1][0] == 0
    assert n != [[1,0],[0,1]]
    # T=1 makes the defined main term empty. For b>=3 its claimed
    # positive-alpha leading term has exponent strictly above the error.
    assert sum(range(1,1)) == 0
    for b in range(3,30):
        assert 1+F(b,2) > 1+F(b+2,4)


coefficient_checks()
finite_field_checks()
elementary_counterexamples()
print("PASS: exact series identities/majorants; Teichmuller cancellation; Newton exponents;")
print("      tuple/rank/empty-product counterexamples; Moore and zero-factor checks; T=1.")
```

Expected output:

```text
PASS: exact series identities/majorants; Teichmuller cancellation; Newton exponents;
      tuple/rank/empty-product counterexamples; Moore and zero-factor checks; T=1.
```

## Route verdicts

1. **reject — OrthogonalIntegralModelsAndKugaSatake.** Correct common orthogonal integral-model owner, but special-cycle stack/±v multiplicity, exact Kisin/Madapusi Pera interfaces and compound construction leaves are not closed. Boundary items have been moved to route3.

2. **reject — GSpinSpecialDivisorHeights.** Shared GSpin generating-series owner retained. Resolve e_0 versus 2e_0, finite Weil comparison and special-cycle pushforward before reuse. Correcting exponent 2+b and q^m does not prove normalization compatibility.

3. **reject — ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary.** Correct shared integral Hodge-type boundary Part II, including moved items27–28 and compatible-fan restriction. Formal chart, torsor/finite quotient and supplier closure remain incomplete; PEL C5 is not a general Hodge-type supplier.

4. **reject — SupersingularCrystalsAndOrdinaryHeckeOrbits.** Converted from new to Part II of ShimuraVarieties. E13–E16, finite-field proper-curve/monodromy interfaces, small-rank earlier-MST input, K3 comparison ownership and compound-item granularity block design.

5. **accept — GeometryOfNumbersAndQuadraticArithmetic.** Bounded source additions to GN.1/GN.3/GN.4: minima/densities already planned, rank-uniform counts and the explicit mass formula imported once. No completed implementation or characteristic-p decay proof is inferred. E4's alleged character typo is rejected.

6. **accept — AnalyticNumberTheory.** Narrow AN.1 source adapter for discriminant-character/negative-real-exponent coefficient formulas. Imports pinned L-functions, prime-discriminant characters and natural-exponent twisted sums; no duplicate analytic continuation.

7. **reject — FiniteFlatGroupsAndIntegralPadicHodgeTheory.** Correct generic deformation-theory owner for the necessary de Jong lifting obstruction, importing CR.0 envelopes. Exact supplier hypotheses, special tensors and coefficient cutoff still need proof extraction; no converse claimed.

The overall verdict is revise, so make_queue.accepted_routes activates none of these routes. Accepting the bounded source additions5/6 is not an acceptance of the paper's crystalline engine or a claim that those source theorems are formalized.

## Remaining closure obligations

1. Coverage is not closed at §0/§16 granularity: split compound items (notably 18–23, 38–44, 62, 67/70, 87, 94–96) into definition/theorem leaves with explicit prerequisite edges, API/use/test outlines. Write every entry and change-of-basis map for Kisin's coordinate u/F matrices; replacing a formula by 'the displayed matrix' does not close an interface.

2. Repair the characteristic-zero lift/reduction valuation comparison in E14, the nonzero-scalar/empty-product cases in E15 and the r<e−1 superspecial branches in E16. The exact counterexamples establish failures of the displayed auxiliary assertions, not falsity of the main theorems. No accepted decay supplier until a corrected proof is written.

3. Keep the general Newton-stratum target5.15 quarantined under E13. The ordinary s=1 case does not use that extension. A proposed p^s-spaced rate still needs the correct PD cutoff and rank argument; it is not an established replacement theorem.

4. Extract the exact statements and hypotheses of Ogus79/82/01, Kisin10/17, Madapusi Pera16/19, Howard–Pappas17 and de Jong95, including weight twists, integral comparison and the special-tensor lifting obstruction. These are named suppliers, not independently checked proof closures. Separate CR.0's generic completed envelope from item51's coefficient lemma.

5. Prove the finite discriminant-module Weil comparison and the E_0 constant-term/cycle-pushforward normalizations against the sibling SSTT route (e_0 versus 2e_0). Resolve ±v, stack automorphisms and reduced support before using the global/local equality; the q^m correction alone is insufficient.

6. Extract the earlier MST arXiv:1812.11679 inputs for b=2 and b=3, especially the rank-three decay estimate needed by the small-rank tail. Preserve dependence of uniform constants on the fixed lattice/rank and the all-C Hasse divisor inequality; never restore the false main-term equalities.

7. Close proper-curve selection, finite-field descent and Hilbert irreducibility/Frattini specialization in Lemma8.11. BSE21 is a finite-constant-field supplier, not a theorem directly over F_p-bar(t). Combine monodromy preservation with boundary avoidance and ordinarity rather than assert this combination. Extract Kisin17 and the unitary RSZ20/21 model input; retain low-dimensional induction cases.

8. Resolve the K3 period-map/characteristic-zero Green–Oguiso comparison and reusable Hilbert/monodromy owners within existing directions. The K3 application does not justify a second uncoordinated roadmap. Coalesce proposed integral-model, generating-series and boundary bridges before any design; pending proposals are not available atlas layers.

9. All source findings are version-qualified to the 47-page author PDF. Reconcile with an accessible version of record or a later corrected author version if available; no independent arXiv-v1 source comparison or full published-PDF reading is claimed. Bibliographic supplier links inherited from the extraction still need full validation when those papers are read.

## Validation and handoff

Run the paper checker on the result, the intake check on all five deliverables, and the paper/queue/intake unit tests. Execute the diagnostic code extracted from this report, and independently verify status counts and unique routing. The handoff records the actual results. No Lean file is requested or compiled. No repository implementation or atlas data is changed.
