# REV-PAPER-BHARGAVA-SHANKAR-WANG-25

Verdict: **revise**. Completed independent review by Codex — codex-a71f92, 23 September 2026.
Original extraction: Claude Code — cc-fb70e5 (issue #1350, PR #1914).
Review issue: #1351. Claim 5800032419 was confirmed by bot comment 5800034527.

This is a finished review of an extraction that remains **partial**, not an acceptance of its mathematical proof chain. The overall revision gate activates no routes.

## Inputs and version scope

Snapshot: `300528447626493b8d856952f9d6992fa0e49fee`.
Read all 75 original items, all seven routes, all fifteen prerequisite entries, the complete report and all eleven original source issues. Read all 57 pages of the [published paper](https://doi.org/10.1017/fmp.2025.9), including §§1–7, Appendix A and bibliography. Page 15's matrices were also inspected as a rendered page.

| Public source | Scope inspected | SHA-256 |
|---|---|---|
| [Cambridge published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree_values_of_polynomial_discriminants_ii.pdf) | Entire article, CC BY 4.0 | cabacefc16eefd171b1d0958cba20c1a9d3f4f7056e93365fedb5ff166e5e345 |
| [arXiv v1](https://arxiv.org/pdf/2207.05592v1) | Version history; targeted Propositions 3.9,5.2,5.5 and Corollary 6.27 comparison, not the entire preprint | 090191c3ed22feb49045f2bd45a6d22098c3b8fecbef6bd324b15e8d387ee2c0 |
| [Wang's author PDF](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf) | Dated 4 April 2025, predating publication; introduction and selected formula comparisons, not a full read | f331bcdcc4762ea5dec9dd1117b66ce09e67e3ce42b20937b0ec98baffff4942 |
| [Kuba's public preprint](https://arxiv.org/pdf/2008.05815v1) | Definition of R_n(t), Theorems 1–4 and the proof of Theorem 1 | primary check of the reducible-only bound |

The publisher correction arrays and Crossref update/relation metadata contained no applicable correction; arXiv listed only v1; Wang and Shankar's public pages and title/erratum queries revealed none. The sourceIssues entries record the exact search limitations. Nakagawa's bibliography corrections concern the earlier papers, not a correction to BSW II. The Ash–Brakenhoff–Zarrabi full text was not obtained, so E1 does not attribute the error to that source.

## Item-by-item coverage ledger

Every original identifier is accounted for. These grouped rows summarize checks; they do not replace the declaration splitting still needed.

| Items | Check and remaining boundary |
|---|---|
| 1–5 | Coefficient height, binary discriminant, strong/weak divisibility and the order basis checked against §§1–3. Correct the last basis index; distinguish a binary form from a one-variable polynomial of possibly lower degree. The geometric regularity/maximality comparison needs its primitive/finite-flat hypotheses, not an unconditional identification with Spec R_f. |
| 6–9 | Read Appendix A in full. Correct ν_1 for odd p, retain its p=2 exception, and obtain the common n≥4 binary factor. Exhaustive quartic tests repeated only for p=2,3; the original p=5/PARI records are not presented as this reviewer's work. Lenstra/ABZ remains a supplier boundary. |
| 10–18 | Read all representation, invariant, castling, Q and deformation arguments. Item 14 now states characteristic≠2 and an equality of orbit counts, not an unjustified canonical bijection. Hyperelliptic/Jacobian, cohomology, torsor and castling contracts remain implicit; item 17 must split three results. The integral Q² theorem is not certified by random samples. |
| 19–26 | Proposition 3.6 fails in an exact integral example; replace it only by the bounded-real minor estimate. Correct the even construction's nondegeneracy condition and Proposition 3.9's primitive-basis parity. The q value and different-m separation survive that parity calculation. Theorem 3.7's even domain is empty, so its missing-odd allegation is removed. |
| 27–29 | Kuba's O(X^n) is n≥3 and reducible-only; leading-zero forms contribute O(X^n). The quantitative non-S_n supplier is missing, not planned at qualitative IG.2. General Siegel sets remain planned at AA.3, with a source-specific applicability proof required. |
| 30–38 | Torus weights, bounded representatives and the three cusp regions checked against §4. Davenport needs the uniform semialgebraic/projection contract. The large sieve has explicit admissible denominator, box and prime-range conventions. Equation (20)'s corrected exponent identity is checked algebraically and in six degrees. Generic large-sieve and odd-cusp supplier proofs are not replaced by finite calculations. |
| 39–43 | §5's lattice terminology and exact norm convention inspected. Add the j=0 term; replace d(Λ) by d(γΛ); use the Frobenius norm for the exact symmetric-lattice covolume; separate full-rank matrices from their spanning lattice. Split the compound Eskin–Katznelson/Schmidt results and retain uniform constants. |
| 44–53 | Read the auxiliary loci, row-space decomposition, vanishing lemmas and main-body estimates. The Galois-exceptional set needs item 28. Correct rank strata, |Δ| and stabilizer factors. Degree-four balancing gives 1/21; n≥6 gives the stated 1/(4n), conditional on the remaining suppliers. |
| 54–57 | Read the entire shallow-cusp case analysis. Its multi-lemma items still hide declaration-sized inputs. The Lemma 6.21 max/min typo is in its proof; Lemma 6.23's off-diagonal factor and basis endpoint need correction. This review does not claim a machine-verified case enumeration. |
| 58–60 | Read the full deep-cusp proof. Correct homogeneous degree and explicitly restrict to L_good(M) after removing small |f(0,1)|. The row-space count must retain actual rank and top-block equations. Keep logarithmic losses; the numerical substitution alone is not a finished repair. |
| 61–65 | Strong/weak union estimates feed a nonzero-discriminant weighted tail, not an unrestricted infinite sum. Preserve the printed even theorem as a source-stated target but label the proposed replacement conditional. Correct bad-prime conditions and residue classes in the finite sieve; include the separate n=2 proof and uniform regular-region count. |
| 66–69 | Main density, maximality and arithmetic-Bertini statements checked. The quartic constant is corrected, but the power-saving proof is not accepted while the even tail is unclosed. No arbitrary region/local-at-infinity extension is asserted without boundary assumptions. |
| 70–73 | Specify successive primitive-extension reduction, independent signs, correct basis and Part II's unweighted embedding norm. Certify the cubic over all integers. Replace the all-degree GL2 claim by signed equivalence. The scaled family/multiplicity argument still needs proof: coefficient dilation does not scale the lattice uniformly. |
| 74–75 | NumberField.discr is signed and the ordering uses its absolute value. Theorem 4's real/imaginary and unramified-extension comparison needs the corrected Nakagawa argument and explicit ramification conventions. A citation is not declaration-level closure. |

The fifteen prerequisite records were checked for their role, not recursively certified. The seven reviewGaps give the exact unclosed dependencies.

## Pinned-library and ownership audit

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read the statements and checked raw pinned-file equality for:

- Mathlib `NumberTheory/NumberField/Discriminant/Defs.lean:36`: `NumberField.discr K : ℤ`; only item 74 is a library item.
- Mathlib `RingTheory/Polynomial/Resultant/Basic.lean`: `Polynomial.discr` and resultant convention. This is not a fixed-degree homogeneous binary discriminant at a vanishing leading coefficient.
- Tau Ceti `NumberTheory/NumberField/Discriminant/Stickelberger.lean`: `TauCeti.NumberField.discr_emod_four_eq_zero_or_one` and `Module.Basis.exists_discr_eq_sq_sub_four_mul_of_isIntegral`. The basis theorem assumes a number field; arbitrary reducible binary forms need another comparison or proof.

Searched both baseline trees and the atlas independently by the following families. Generic hits were not mistaken for complete supplier statements:

| Missing items | Search boundary |
|---|---|
| 1–9,44–47,61–69 | Binary discriminant, local density, Lenstra, maximality, strong/weak divisibility, Ekedahl, squarefree density and Bertini. Scalar divisibility/CRT or a number-field discriminant is not the binary-family sieve. |
| 10–26,33,50–51 | Symmetric matrix pairs, invariant rings, hyperdeterminants, distinguished orbits, isotropic flags/lattices, hyperelliptic Jacobians, torsors and castling. Generic invariant rings or elliptic Jacobian coordinates do not supply the hyperelliptic J[2] orbit comparison. |
| 27–28,73,75 | Hilbert irreducibility, Hilbertian, quantitative specialization, Kuba/Gallagher and field counts. Qualitative Galois APIs and finiteness are not a power-saving nonmonic count or unramified-extension asymptotic. |
| 30–32,34–43,48–49,52–60 | Iwasawa/Siegel sets, Davenport, Schmidt, successive minima, singular symmetric matrices, large sieve and cusp bounds. Singular-matrix measure-zero results do not count its integer points; a fixed-region lattice limit has no required uniform remainder. |
| 70–72 | Minkowski/quasi-reduction, primitive extending bases, sign uniqueness and lattice homothety. Convex-body theorems and Gram–Schmidt are not the promised reduced-basis/multiplicity package. |

Read reviewed library coverage for ST.0–ST.3, GN.3/GN.4, SV.2, IG.2 and AA.3, and each cited current stage description. RS-07's narrowed scopes retain the arithmetic applications in ST.2 while importing generic counting from GN.4; SV.2 owns the large sieve. RS-29 leaves qualitative IG.2 in place, not the quantitative supplier claimed by the original extraction.

Upstream GlobalNumberFields and Completed/EffectiveBounds documents were read as scope/granularity comparators. Their existing lattice/covolume, effective field bounds and proposed Lipschitz counting are imported, not re-planned. The Part I extraction is a coalescing lead, not an accepted replacement proof: its own review requires revision.

All 73 missing items occur in exactly one route. Route 5's corrected definition is usable in isolation. The other six are rejected with explicit reasons in the review JSON. Overall revise means no route is activated.

## Independent mathematical certificates

### Quartic local factor (E1)

For odd p, let h_d count monic squarefree degree-d polynomials over F_p coprime to x. Splitting a squarefree polynomial according as x divides it gives h_d+h_{d−1}=S_d, where S_0=1, S_1=p and S_d=p^d−p^{d−1} for d≥2; h_0=1. A valuation-one discriminant reduction has a unique linear double root, with remaining factor counted by h_{n−2}; there are p h_{n−2} reductions. Among their p-adic lifts a fraction 1−1/p has valuation exactly one. Thus ν_1=(1−1/p)p h_{n−2}/p^n, giving the corrected formula for odd p and n≥3. At p=2 valuation one is impossible.

The quartic discriminant polynomial is compared to 81 Sylvester resultants, then all 4^5 and 9^5 coefficient tuples are enumerated. Results: α_4(2)=3/8, α_4(3)=176/243 and monic λ_4(3)=62/81. These finite counts disprove the printed quartic factor; the recurrence supplies the general correction.

### Proposition 3.6 and the deep cusp (E2–E4)

The displayed n=3 matrices in the diagnostic have binary form −x²y+3xy²−y³ and Δ=5, whereas the product of Gram determinants is 2. The polynomial divisibility is therefore false. Over C, (1,i) also shows directly why rank does not follow from MM^t=0.

The weaker replacement uses rank-deficiency vanishing and a prime maximal-minor ideal over C. Its polynomial coefficients are bounded on a fixed bounded real domain; Cauchy–Binet bounds the minors by the square root of the Gram determinant. No integral descent is silently claimed.

For W_{n+1}, coefficients of the determinant pencil have degree n+1 and their discriminant has degree 2n, so Δ has degree 2n(n+1). With Y=X^{1/(n+1)}, normalization multiplies it by X^{-2n}. The original hypothesis X^{2n−2−κ} yields X^{-2−κ}, not X^{-κ}.

Removing |f(0,1)|<H(f)^{1−κ/(2n−2)} costs O(X^{n+1−κ/(2n−2)}). On dyadic remaining forms, Δ(xf)=Δ(f)f(0,1)^2 supplies exponent κ″=κn/(n−1). This only repairs a hypothesis on L_good, and the full count must still be proved with the rank/top-block restrictions. At the proposed κ, the new ξ=1/(44n^5) has no spare exponent for log^{2n}X. The former assertion of an unchanged completed main proof is withdrawn.

For Theorem 6.6, balancing gives (n−2)/(2n²+2n+2). Its minimum with 1/(4n) is 1/21 for n=4. This is a check on the displayed proof, not a lower bound contradicting a stronger possible theorem.

### Cubic strong reduction and signs (E5)

Use f=x³−x²y+xy²+y³ and ζ=θ²−θ. Part II's norm is the real embedding plus **one** complex absolute square; using Part I's weighted/all-embeddings norm would invalidate the test.

Let r be the real root. Its derivative is everywhere positive and r lies in [−5437/10000,−5436/10000]. In the basis 1,θ,ζ the Gram entries are

`G00=2; G01=(1+r)/2; G02=(r²−r−2)/2;`
`G11=r²−1/r; G12=r³−r²+(1+r)/(2r);`
`G22=(r²−r)²+1/r²−1.`

Exact rational interval bounds give λ_2>2.1087, λ_3>2.6073, G11<2.1352, |G01|<1, 2−|G01|>2|G02| and G11−|G01|>2|G12|.

For u+vθ+wζ, the last Gram–Schmidt term rules out w≠0 for the first two minima. With w=0, λ_2>2 makes ±1 the unique first vectors. Extending 1 then forces v=±1, and |G01|<1 forces u=0. For the third extending vector take w=1 up to sign. The difference from ||ζ||² is
`2u²+G11v²+2G01uv+2G02u+2G12v`.
Using 2|uv|≤u²+v² and the last two strict inequalities makes this positive for every nonzero integer pair (u,v). This proves strong uniqueness up to independent signs over the entire lattice.

Reflection f(−x,y) identifies θ* with −θ and gives the same signed basis. The cubic has no rational root and discriminant −44, hence Galois group S_3. Any rational projective stabilizer centralizes S_3 on three roots and is trivial; a scalar stabilizer of the cubic is also trivial. A determinant −1 stabilizer therefore cannot convert the reflection into an SL2 equivalence.

For the general sign repair, write φ(ζ_i)=ε_iζ_i*. Comparing i=1,2 gives a_0*=ε_2a_0 and φθ=sθ*, s=ε_1ε_2. Comparing all coefficients, including θζ_{n−1}, gives a_i*=ε_2s^i a_i. Thus f*=ε_2s^n f(sx,y), at most four alternatives. Odd degree absorbs output sign through −I; even degree must retain it unless separately eliminated.

This does not fix the dilation argument for Theorem 3. In the same cubic, 5G01>1, so 5θ−1 is shorter than 5θ in R_{5f}: the displayed reduced basis is not preserved. This is **not** a counterexample to the existence of another reduced SL2 representative. It shows why openness plus scalar dilation is not an adequate justification; the required uniform family/multiplicity theorem remains a recorded gap rather than an asserted false main result.

### Primitive reflected flag (E13)

Take n=4,m=1,f=x⁴+6y⁴, irreducible by Eisenstein at 2. The exact matrices in the diagnostic have pencil x⁵+6xy⁴ and original |Q|=1. Change basis by rows

`(3,0,0,0,−1), e_2, (7,0,0,0,−2), e_3, e_4.`

This matrix is unimodular. The first two rows span an A-isotropic primitive lattice, the first three a B-isotropic primitive lattice. The reflected |Q| is 3, not one of {1,6}; the relevant B-block determinant is also 3, leaving |q|=1.

In general the primitive reflected first vector is (b/d)e_1−(2/d)e_{n+1}, d=gcd(2,b). For even b the displayed reflected matrices replace the odd-case b by b/2 in the relevant corner and the leading A entry by −1. Both Q and det B′ acquire the same factor 1/2; this is why the separation via q survives.

### Lattice counts, zero discriminant and remaining scope (E14–E18)

The origin refutes Proposition 5.2 as Y tends to zero. The uniform γ-scaling example for Proposition 5.5 has 2(t²−1) nonzero points against a printed O(1); its correct denominator uses d(γΛ)=1/t.

For Corollary 6.27, x^n has a root of multiplicity n≥3 modulo every prime and is strongly square-divisible. Equivalently the discriminant's weighted degree n(n−1), with coefficient weights at most n, implies every monomial in its nonleading coefficients has degree at least n−1≥2; substituting coefficients divisible by p forces p². Thus one fixed form appears for infinitely many prime moduli. Exclude Δ=0 before using a divisor bound. The integer zero set of a fixed nonzero polynomial in n+1 variables has O(X^n) box points by induction on the variables.

For n=2 and N≠0, fixing a_1 in a_1²−4a_0a_2=N leaves a divisor count unless a_1²=N; there are at most two exceptional a_1, each with O(X) product-zero choices. This gives O_ε(X^{1+ε}) and the nonzero tail O_ε(X^{3+ε}/M), not by itself a complete sieve theorem.

For Lemma 6.23, the symmetric Gram convention makes the mixed coefficient 2b, not b. The corrected equation and integer solution must be used consistently. The basis list also needs its last vector.

For §6's row fibers, a matrix of rank n determines one saturated row lattice. The full row-contained lattice, however, contains zero for every Λ. Its union is not a disjoint union and is not the full-rank set of §5. Furthermore a row-space condition does not force a coordinate block to vanish: that comes from the original pair's cusp conditions. Restrict the count to those actual matrices throughout (74)–(76).

E6–E11 have separate checked verdicts in the JSON. E10's former missing-odd component is explicitly rejected; the remaining typo list is retained. Equation (20)'s product uses U_0∩U′ and the second triangular range 1≤i<j≤g. The a-coordinate ratios enumerate g+1≤i<j≤n−1 and the b-coordinate ratios enumerate 1≤i<j≤g, giving the symbolic identity used in the diagnostic.

## Changes made

All 75 item IDs and all eleven original finding IDs are retained. Changed item fields: 3, 4, 6, 7, 8, 14, 18, 19, 21, 24, 26, 27, 28, 31, 32, 33, 39, 40, 41, 48, 53, 58, 59, 60, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75. Key changes include corrected hypotheses and norms, the basis and reflected-Q factors, lattice constants/covolumes, explicit restricted/conditional tail statements, nonzero-discriminant and bad-prime conditions, signed equivalence and the signed-library discriminant. Item 28 changes from planned to missing and is added to route 7. Unsupported all-repaired claims and an alleged nonvacuous even-m counterexample are removed.

Added E12–E18 with independent verdicts and refreshed source/version searches for all findings. Seven explicit reviewGaps replace the false complete status. No unrelated job, queue, atlas, registry or generated site files are edited.

## Verification

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-WANG-25.result.json`: passed.
- Stable identifiers and unique routing of all 73 missing items: passed.
- Exact standard-library diagnostics below: passed; finite tests are distinguished from the accompanying all-integer proofs and from unverified asymptotic arguments.
- `python3 -m unittest tests.test_check_paper tests.test_papers_queue tests.test_intake`: 41 tests passed.
- `research/blueprint/intake.py check-files`: five deliverables, zero problems.
- No Lean was written or compiled; this is a paper review, not a formalization.

## Reproducible exact diagnostics

Run the following as a standalone Python 3 script; only the standard library is used. It performs finite checks and rational interval assertions. The all-lattice reduction proof and asymptotic limitations are explained above.

```python
#!/usr/bin/env python3
"""Exact finite diagnostics for REV-PAPER-BHARGAVA-SHANKAR-WANG-25.
Standard library only. Finite checks do not certify asymptotic estimates.
"""
from fractions import Fraction as F
from itertools import product
from math import gcd
def det(rows):
    a = [[F(x) for x in row] for row in rows]
    value = F(1)
    for j in range(len(a)):
        k = next((k for k in range(j, len(a)) if a[k][j]), None)
        if k is None:
            return F(0)
        if k != j:
            a[j], a[k] = a[k], a[j]
            value = -value
        pivot = a[j][j]
        value *= pivot
        for k in range(j + 1, len(a)):
            t = a[k][j] / pivot
            for l in range(j + 1, len(a)):
                a[k][l] -= t * a[j][l]
    return value

def solve(a, b):
    a = [[F(x) for x in row] + [F(y)] for row, y in zip(a, b)]
    for j in range(len(a)):
        k = next(k for k in range(j, len(a)) if a[k][j])
        a[j], a[k] = a[k], a[j]
        pivot = a[j][j]
        a[j] = [x / pivot for x in a[j]]
        for k in range(len(a)):
            if k != j:
                t = a[k][j]
                a[k] = [x - t*y for x, y in zip(a[k], a[j])]
    return [row[-1] for row in a]


def pencil(a,b):
    n=len(a)
    v=[[F(x)**(n-j) for j in range(n+1)] for x in range(n+1)]
    vals=[(-1)**(n*(n-1)//2)*det([[x*a[i][j]-b[i][j] for j in range(n)] for i in range(n)]) for x in range(n+1)]
    return solve(v,vals)

def q(a,b):
    n=len(a); h=(n-1)//2
    v=[[F(x)**(h-j) for j in range(h+1)] for x in range(h+1)]
    rows=[]
    for omitted in range(h+1):
        js=[h+j for j in range(h+1) if j!=omitted]
        vals=[(-1)**omitted*det([[x*a[i][j]-b[i][j] for j in js] for i in range(h)]) for x in range(h+1)]
        rows.append(solve(v,vals))
    return det(rows)

def gram_change(a,rows):
    return [[sum(x*a[k][l]*y for k,x in enumerate(u) for l,y in enumerate(v)) for v in rows] for u in rows]

def quartic(a,b,c,d,e):
    return (256*a**3*e**3-192*a*a*b*d*e*e-128*a*a*c*c*e*e+144*a*a*c*d*d*e-27*a*a*d**4
     +144*a*b*b*c*e*e-6*a*b*b*d*d*e-80*a*b*c*c*d*e+18*a*b*c*d**3+16*a*c**4*e
     -4*a*c**3*d*d-27*b**4*e*e+18*b**3*c*d*e-4*b**3*d**3-4*b*b*c**3*e+b*b*c*c*d*d)

def cubic(a,b,c,d):
    return b*b*c*c-4*a*c**3-4*b**3*d-27*a*a*d*d+18*a*b*c*d

def disc_resultant(cs):
    n=len(cs)-1
    assert cs[0]
    ds=[(n-i)*cs[i] for i in range(n)]
    rows=[]
    for i in range(n-1):
        rows.append([0]*i+list(cs)+[0]*(n-2-i))
    for i in range(n):
        rows.append([0]*i+ds+[0]*(n-1-i))
    return (-1)**(n*(n-1)//2)*det(rows)/cs[0]

# Validate the explicit quartic polynomial against the Sylvester determinant.
for tail in product(range(-1,2),repeat=4):
    assert quartic(1,*tail)==disc_resultant((1,)+tail)
print("quartic formula / resultant comparisons:",3**4)
counts = {}
for p in (2,3):
    good=sum(quartic(*cs)%(p*p)!=0 for cs in product(range(p*p),repeat=5))
    counts[p]=F(good,p**10)
assert counts == {2:F(3,8),3:F(176,243)}
print("binary quartic squarefree local densities:",counts)
mono_good=sum(quartic(1,*cs)%9!=0 for cs in product(range(9),repeat=4))
assert F(mono_good,9**4)==F(62,81)
print("monic quartic density at 3:",F(mono_good,9**4))
assert F(176,243)!=F(1600,2187)

# E2: binary cubic discriminant, including zero leading coefficient.
a=[[0,0,1],[0,0,0],[1,0,1]]
b=[[0,1,1],[1,1,0],[1,0,0]]
cs=pencil(a,b)
assert cs==[0,-1,3,-1]
assert cubic(*cs)==5
assert sum(x*x for x in a[0][1:])*sum(x*x for x in b[0][1:])==2
print("Proposition 3.6: coefficients",cs,"discriminant",cubic(*cs),"claimed divisor",2)

# Proposition 3.9 parity test. n=4, m=1, f=x^4+6y^4 (Eisenstein at 2).
a=[[0,0,0,0,1],[0,0,0,1,0],[0,0,1,0,0],[0,1,0,0,0],[1,0,0,0,6]]
b=[[0,0,0,1,0],[0,0,1,0,0],[0,1,0,0,0],[1,0,0,0,0],[0,0,0,0,0]]
assert pencil(a,b)==[1,0,0,0,6,0]
assert abs(q(a,b))==1
basis=[[3,0,0,0,-1],[0,1,0,0,0],[7,0,0,0,-2],[0,0,1,0,0],[0,0,0,1,0]]
assert abs(det(basis))==1
aa,bb=gram_change(a,basis),gram_change(b,basis)
assert all(aa[i][j]==0 for i,j in product(range(2),repeat=2))
assert all(bb[i][j]==0 for i,j in product(range(3),repeat=2))
qq=abs(q(aa,bb)); denominator=abs(det([row[-2:] for row in bb[:2]]))
assert qq==3 and denominator==3 and qq/denominator==1
print("Proposition 3.9: reflected |Q| =",qq,"not in {1,6}; |q| =",qq/denominator)

# Main-body balance in Theorem 6.6.
for n in (4,6,8):
    delta=F(2*n+3,2*(n*n+n+1))
    saving=(F(1,2)-delta)/(n+1)
    assert saving==F(n-2,2*n*n+2*n+2)
    print("main-body proof saving n =",n,":",min(F(1,4*n),saving))
# Zero-discriminant divergence and the missing constant in Proposition 5.2.
assert all(0 % (m*m)==0 for m in range(1,1001))
for t in (2,4,8,16):
    # gamma=diag(1/t,t), Lambda=Ze1; rank-one symmetric lattice step 1/t^2.
    actual=2*(t*t-1)  # nonzero points in (-1,1) after applying gamma
    assert actual>t*t
    print("Proposition 5.5 gamma scaling t =",t,"count",actual,"printed RHS Y=1")

class Interval:
    def __init__(self, lo, hi=None):
        self.lo=F(lo); self.hi=F(lo if hi is None else hi)
    def __add__(self, other):
        other=iv(other); return Interval(self.lo+other.lo,self.hi+other.hi)
    __radd__=__add__
    def __neg__(self): return Interval(-self.hi,-self.lo)
    def __sub__(self, other): return self+-iv(other)
    def __rsub__(self, other): return iv(other)+-self
    def __mul__(self, other):
        other=iv(other); xs=[a*b for a in (self.lo,self.hi) for b in (other.lo,other.hi)]
        return Interval(min(xs),max(xs))
    __rmul__=__mul__
    def __truediv__(self, other):
        other=iv(other); assert other.lo*other.hi>0
        return self*Interval(1/other.hi,1/other.lo)
    def __rtruediv__(self, other): return iv(other)/self
    def __pow__(self,n):
        assert n>=0
        out=iv(1)
        for _ in range(n): out=out*self
        return out
    def absmax(self): return max(abs(self.lo),abs(self.hi))
def iv(x): return x if isinstance(x,Interval) else Interval(x)

# E5 uses the UNWEIGHTED real-plus-one-complex-place norm on published p.52.
# The real root r is unique since 3r^2-2r+1 > 0 everywhere.
lo,hi=F(-5437,10000),F(-5436,10000)
assert lo**3-lo**2+lo+1<0<hi**3-hi**2+hi+1
r=Interval(lo,hi)
g00=iv(2); g01=(1+r)/2; g02=(r*r-r-2)/2
g11=r*r-1/r
g12=r**3-r*r+(1+r)/(2*r)
g22=(r*r-r)**2+1/(r*r)-1
lambda2=g11-g01*g01/2
lambda3=g22-g02*g02/2-(g12-g01*g02/2)**2/lambda2
assert lambda2.lo>2 and lambda3.lo>g11.hi
assert g01.absmax()<1
assert 2-g01.absmax()>2*g02.absmax()
assert g11.lo-g01.absmax()>2*g12.absmax()
print('E5 exact rational interval certificate: lambda2 >',float(lambda2.lo),
      '; lambda3 >',float(lambda3.lo),'; norm(theta)^2 <',float(g11.hi))
# Coefficient dilation keeps 1 fixed, but changes theta to 5 theta in the basis.
# This only refutes preservation of the DISPLAYED reduced basis, not all SL2 representatives.
assert (5*g01).lo > 1

# Equation (20): weights of the coordinates actually in U_0 intersect U'.
for g in range(1, 7):
    n=2*g+1
    got=[0]*n
    expected=[0]*n
    for i in range(1,n+1):
        for j in range(i,n+1):
            if j>g and i+j<n:
                got[j-1]+=1; got[n-i-1]-=1  # a: t_j/t_(n-i)
                got[i-1]+=1; got[n-j-1]-=1  # b: t_i/t_(n-j)
    for lo,hi in ((g+1,n-1),(1,g)):
        for i in range(lo,hi+1):
            for j in range(i+1,hi+1):
                expected[i-1]+=1; expected[j-1]-=1
    assert got==expected
print('equation (20) corrected torus weights: g=1,...,6')
print("all finite exact diagnostics passed")
```
