# REV-PAPER-BHARGAVA-SHANKAR-WANG-22

Verdict: **revise**. Reviewer: Codex — codex-a71f92, 23 September 2026.
Original worker: Claude Code — cc-fb70e5 (issue #1274, PR #1907).
Review issue: #1275; confirmed claim comment 5799426448 for claim 5799423727.

This is a completed independent review requiring revision of a **partial extraction**, not acceptance of its proof chain. The review JSON contains six route verdicts. Under the queue's revision gate no route is activated.

## Inputs and version discipline

Base snapshot: `62b88ddd98bdff4fe33e64ec07b0df82d6087b18`.
Read all 74 original items, all six routes, all 14 prerequisite entries, the entire original report, all twelve original source issues, and all 29 pages of [arXiv:1611.09806v3](https://arxiv.org/pdf/1611.09806v3).

The v3 SHA-256 is `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83`. Pages 15 and 24–26 were inspected as rendered pages. No readable full version of record was obtained through the publisher or the author's legitimate shared link. Every confirmed source issue is about v3 only.

Additional primary-source checks:

| Source | Scope read | SHA-256 |
|---|---|---|
| [Wang, 2013 thesis](https://www.math.uwaterloo.ca/~x46wang/Papers/Thesis.pdf) | §§1.2.2, 2.6–2.7, Summary 2.32 and Theorem 2.33 | `0f8d4d8213ddb7662bf20b51a50ea23a651dbd7fa539758b6fa9b051f085ed5d` |
| [Dietmann, arXiv:1010.5341v1](https://arxiv.org/pdf/1010.5341v1) | Entire six-page preprint, especially Lemmas 2,4–6 and §3 | `258bb1d345be5e423e0a9499d6b2145a9b7983e2235b538cf6465911339b650c` |
| [Shankar–Tsimerman author preprint](https://www.math.toronto.edu/~jacobt/Snote2.pdf) | Entire seven-page preprint, dated 4 October 2013 | `3d303d53c7036f525d9ab1dddceb942b90af667898ad86ea1978db3ff2555caf` |

These are source checks, not an assertion that every prerequisite paper has been recursively extracted. The supplier closure still needs work.

A fresh search of arXiv history, Crossref update/relation metadata, author pages, the publisher page and title/erratum queries found no applicable published correction. The JSON records the exact search scope and its limitations. It does not infer that the inaccessible published text repeats a preprint error.

## Item and omission ledger

Every original item is accounted for below. Grouping is by the proof interface checked, not a claim that a name search establishes mathematical equivalence.

| Items | Review result |
|---|---|
| 1–5 | Family, weighted height, local factors and Euler product match §§1–2. Item 2 now pins monicity and resultant sign. The general local-density inputs need their own source decomposition; the review did not rerun the original worker's exhaustive Yamamura counts. |
| 6–9 | Read the four library claims at both pins. Item 6 has an explicit routine index-formula/Squarefree/positive-index/index-one composition. Item 9 no longer claims Corollary 1.4 orders fields by discriminant. Item 7 remains a missing arithmetic theorem, not a consequence of the polynomial alternating-group discriminant test alone. |
| 10–14 | Density-one specialization is not supplied by qualitative IG.2: item 10 is now missing and routed with 53. The p=2 exception is real. The coefficient translation uses the non-strong root case and CRT. Local-specification positivity must not be assumed when a slice is obstructed. |
| 15–23 | Invariant polynomial and relative weights checked against §§2.1/3.1. Even-degree flags need B(Y′,Y)=0 and a ruling (E17); the torsor bound is corrected accordingly. Generic group, hyperelliptic Jacobian, 2-torsion and torsor carriers remain implicit. |
| 24–33 | Q²-divisibility is referred to a sequel, not proved by sampled evaluations. The explicit odd/even matrices reproduce the expected characteristic polynomial and absolute Q in 54 exact sample cases; the source's g≥1 range is retained. Absolute Q is independent of coefficient-order sign conventions. |
| 34–43 | Retain the distinction between W_m and its nonzero-discriminant subfamily. General reduction theory is planned at AA.3 but its source-specific implementation needs the cited proofs. Checked torus exponents by telescoping and the printed integral chains. Item 42 now exposes the uniform congruence remainder; item 43 separates optimization from the library Lambda-squared mechanism and fixes its namespace. |
| 44–51 | Propositions and tail exponents match the paper, subject to the corrected flags and uniform remainder. The weighted squarefree-modulus Ekedahl adaptation is still asserted by reference. Counting finitely many sample matrices does not close these analytic steps. |
| 52–57 | Correct the divisor argument to an average, the imprimitive group order/index, and the quartic bound. Dietmann's coefficient restriction is now explicit. The summed tail and inclusion–exclusion must exclude Δ=0 first. A generic weighted-box zero-count and uniform lattice-count theorem remain missing inputs. |
| 58–63 | Main density/count statements and local/signature restrictions checked; not disproved by this review. The short-generator upper bound needs integer translation before counting coefficients; it is not just a count of all n unrestricted coefficients. |
| 64–68 | Separate existence, uniqueness up to signs and statistical uniqueness. Replace inverse scaling by ρⁿf(x/ρ). Remove the false strong density-one conclusion and universal trace-zero positivity; these are substantive failures, not solved by the old E12 repair. |
| 69–72 | Preserve the stated main corollaries and label the asymptotic in Remark 5.6 as conjectural. Their extracted lower-bound proofs need a replacement multiplicity argument and a quadratic case. The original numerical C₃ integration is not claimed independently reproduced. |
| 73–74 | Narrow the reduction-domain statement and exclude the invalid transfer of generic real uniqueness to integer polynomials. The exact corrected Fujiwara inequality has a short complete proof given below. |

Identified omissions requiring revision include the generic hyperelliptic/Jacobian and torsor definitions, the precise invariant-theory suppliers, a proof source for Q²|Δ, the uniform congruence remainder, the quantitative generic semialgebraic count, the weighted Ekedahl adaptation, and a valid field-multiplicity theorem. These are listed as explicit `reviewGaps`; the extraction is not left marked complete.

## Baseline and ownership audit

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read and checked raw-file equality at the pins for:

- Mathlib `RingTheory/Polynomial/Resultant/Basic.lean`: `Polynomial.discr`, `Polynomial.resultant_deriv`, and the quadratic formula.
- Mathlib `NumberTheory/NumberField/Discriminant/Defs.lean`: signed integer `NumberField.discr`.
- Tau Ceti `NumberTheory/NumberField/Index/Discriminant.lean`: index–discriminant formula.
- Tau Ceti `NumberTheory/NumberField/Index/Basic.lean`: positive index and `index_eq_one_iff`.
- Tau Ceti `NumberTheory/NumberField/Monogenic.lean`: `IsMonogenic` and its index-one comparison.
- Mathlib `Algebra/Squarefree/Basic.lean`: `Squarefree` means square divisors are units; together with the positive index this proves item 6.
- Mathlib `NumberTheory/SelbergSieve.lean`: `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`, `BoundingSieve.upperMoebius_lambdaSquared`, and `BoundingSieve.mainSum_lambdaSquared_eq_sum_mul_sum_sq`.
- Mathlib `Analysis/Polynomial/CauchyBound.lean`: `Polynomial.IsRoot.norm_lt_cauchyBound`, a genuine nearby theorem but not Fujiwara's exact bound.

For every missing-item group, searched both pinned Lean trees and the atlas/roadmap descriptions using the relevant named objects and mathematical vocabulary:

| Missing-item group | Search/check boundary |
|---|---|
| 1,3–5,11–14,34,50–52,55–62,68 | Weighted polynomial heights, polynomial/local density, strong/weak discriminant divisibility, squarefree density, Yamamura/Lenstra and Ekedahl. Generic divisibility, CRT, discriminants and counting infrastructure are not the weighted infinite-local-condition theorem. |
| 7,10,53–54 | Squarefree discriminant/Galois group, Hilbert irreducibility, Hilbertian, specialization, Dietmann and imprimitive subgroup bounds. The existing discriminant/alternating-group and finite-field factorization APIs do not prove these statistical statements. |
| 15–33 | Symmetric/orthogonal matrices, invariant polynomial, distinguished orbit, Q-invariant, hyperdeterminant, hyperelliptic/Jacobian, torsion and flag. Matrix primitives and elliptic Jacobian coordinates are not the hyperelliptic J_f[2] orbit comparison. |
| 36–42,44–49 | Iwasawa, Siegel, fundamental-domain counting, torus weights, Selberg and Ekedahl. Reuse the actual generic sieve carrier; the arithmetic-family remainder and cusp/tail estimates are absent. |
| 63–67,69–73 | Monogenic, Minkowski-reduced/quasi-reduced, lattice reduction, short generator and field counts. Generic lattice or field finiteness does not provide the claimed multiplicity/density asymptotic. |
| 74 | Fujiwara and root/norm bounds. Read the existing Cauchy bound rather than treating a search hit as equality of statements. |

Read the reviewed coverage rows for ST.0–ST.3/ST.5, GN.3, IG.2, SV.1, AA.3 and CA.3 (AUDIT-02/07/09/13/18), their review provenance, and the corresponding current stage descriptions. RS-07 retains arithmetic-family counts at ST.2 but imports generic semialgebraic counting from GN.4; it also forbids rebuilding the existing Lambda-squared construction. RS-29's IG.2 description is qualitative, not this weighted density-one assertion. The upstream polynomial-Galois boundary likewise excludes Hilbert irreducibility, and the NumberFieldArithmetic index interface uses an integral primitive element, not an arbitrary element with a possibly infinite quotient.

All 68 missing items now occur in exactly one route. No Tau Ceti roadmap is re-planned. Route 6 is acceptable in isolation; routes 1–5 need the specific repairs in the review JSON. Overall verdict `revise` means no routes are activated.

## Source findings and exact arguments

E1–E12 are individually checked and carry verdicts in the extraction. The source observations underlying E12 are confirmed, **but its former proposed repair is rejected and replaced**. E9's quadratic proof now separates Δ=0. E10's conditional sign correction is no longer claimed to settle the density premise. Findings that affect statements/proofs are not labeled harmless merely because they do not disprove the main theorems.

Five new findings:

- **E13:** xⁿ, n≥2, belongs to W_m for every squarefree m; the unrestricted summed tail is infinite. Divisor bounds apply only to nonzero integers.
- **E14:** monic normalization of f(ρx) contracts the roots. The correct expansion is ρⁿf(x/ρ), with aᵢ multiplied by ρⁱ.
- **E15:** x²+a₂ always has discriminant −4a₂, so trace-zero quadratic squarefree density is zero.
- **E16:** x²+x+q, q≥2, has two non-sign-equivalent Minkowski-reduced bases, and this occurs on a positive-density family.
- **E17:** ten flags over F₁₃ satisfy the printed even-degree definition when its asserted upper bound is four. Wang's actual torsor imposes bilinear orthogonality and a ruling.

The full formulas, loci and finite-field flags are recorded in the extraction/report. Their implications are limited: false auxiliary statements and an unclosed proof do not establish that the main corollaries are false.

For E10's cubic example, in coordinates on the basis 1,θ,θ²−33 the norm is

`3(a+c/3)² + 100(b−21c/100)² + (498677/300)c².`

The last coefficient exceeds 100. Thus the first two shortest extending vectors are ±1, ±θ; when extending them to a basis c=±1, and the unique minimizing integers a,b are zero. This supplies an exact bound beyond a finite search. The example x³−50x+7 is reducible, which is permitted in Lemma 5.1.

For E16, writing f=x²+x+q gives

`||u+vθ||²=(u−v/2)²+(q−1/4)v².`

If v≠0 this is >1, so the only shortest vectors are ±1. To extend 1 to a basis one must have v=±1; both u=0 and u=1 minimize the length when v=1. For odd 0<a₁<X/2 and X²/2<a₂<X², translate θ by (a₁−1)/2. The resulting q=a₂−(a₁²−1)/4 is ≥2, and the original discriminant is negative. This gives X³/8+O(X²) irreducible examples versus 4X³+O(X²) total. The tie is arithmetic and persists as X grows.

For E17, equality of two planes Y_t forces equality of their graph parameter t; within a plane, the normalized first coordinate fixes r. Hence the ten (t,r) pairs really give ten distinct flags. All Y_t are in the same ruling as Y_0, so simply adding a ruling condition does not cure the omitted B(Y′,Y)=0 condition.

The corrected Fujiwara bound is independently proved as follows. Let
M=max(|a₁|,|a₂|^(1/2),...,|a_(n−1)|^(1/(n−1)),|aₙ/2|^(1/n)).
For a root with |z|>2M, division by zⁿ and the triangle inequality give

`1 ≤ ∑_(i=1)^(n−1) (M/|z|)^i + 2(M/|z|)^n < 1.`

The last inequality is the finite geometric sum evaluated below 1/2. If M=0 the polynomial is xⁿ and all roots are zero. This is the exact source-qualified root bound, not just a loose asymptotic consequence of Cauchy.

## Changes made in place

All 74 original identifiers and all 12 original finding identifiers are retained.

- Set extraction status to partial and replace the overconfident summary/version claim.
- Items 2,6,8,9: pin the monic/sign, integral-generator, composition and ordering conventions.
- Item 10: planned → missing; add to route 5.
- Items 17–19,26: correct the even-degree supplier locators and flag/torsor predicate.
- Items 28–33: preserve the source's g≥1 construction range where a parity hypothesis was previously bare.
- Item 34 and items 55–57: distinguish W_m from W_m with Δ≠0; expose the separated zero-count input.
- Items 35,42–43: distinguish general reduction ownership from a specific proof; add the uniform sieve remainder and exact optimized inequality; fix the BoundingSieve namespace.
- Items 53–54: supply coefficient control, the elementary intransitive-index proof, and the weaker verified quartic bound.
- Items 64,66–71,73: separate signs, weak quasi-reduction and multiplicity; repair scaling and trace-zero positivity; withdraw the false strong-density proof.
- Item 74: add the checked Cauchy near miss and complete elementary proof.
- Update routes 1–5 and prerequisite entries for Wang, Dietmann and Shankar–Tsimerman.
- Add 17 version-qualified source-issue verdicts, including E13–E17; revise E6/E9/E10/E12 repairs and severity where needed.
- Add seven explicit closure gaps and replace the human report to match the corrected extraction.

## Validation and limitations

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-WANG-22.result.json`: passed.
- Missing-route multiplicity and stable-ID check: passed, 74 items / 68 missing / 17 reviewed source issues.
- The diagnostic below uses Python's standard library only. It passed: 432 characteristic-polynomial evaluations, 54 absolute-Q checks, 1,681 quadratic mod-4 cases, 201 trace-zero cases, imprimitive indices 3/10/35, exact cubic Gram residual, three growing tied-family counts and ten distinct finite-field flags.
- These finite checks are regressions, not proofs of all-degree Q identities, local-density formulas or asymptotic theorems.
- No Lean was written or compiled. A valid JSON/schema check is not a mathematical completeness certificate.
- Additional repository test/intake results are recorded in the handoff and PR.

## Reproducible exact diagnostics

Save the following as a Python script and run it with Python 3. It performs no network access and writes no files.

```python
#!/usr/bin/env python3
"""Exact finite regression checks for REV-PAPER-BHARGAVA-SHANKAR-WANG-22.
These are diagnostics, not proofs of the asymptotic or all-degree theorems.
Python standard library only.
"""
from fractions import Fraction as F
from itertools import product
from math import comb, factorial

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

def matrix(n, m, c):
    b = [[F(0) for _ in range(n)] for _ in range(n)]
    def put(i, j, v):
        b[i-1][j-1] = b[j-1][i-1] = F(v)
    put(1, n-1, m)
    for i in range(2, n-1):
        put(i, n-i, 1)
    if n % 2:
        start = (n+1)//2
        for j in range(start, n+1):
            put(j, j, -c[2*(j-start)])
            if j < n:
                put(j, j+1, -F(c[2*(j-start)+1], 2))
    else:
        start = n//2+1
        put(start-1, start, -F(c[0], 2))
        for j in range(start, n+1):
            put(j, j, F(c[0]**2, 4)-c[1] if j == start else -c[2*(j-start)+1])
            if j < n:
                put(j, j+1, -F(c[2*(j-start)+2], 2))
    return b

def q_invariant(n, b):
    g = (n-1)//2
    cols = list(range(n-g-1, n))
    vander = [[F(x)**(g-j) for j in range(g+1)] for x in range(g+1)]
    coefficients = []
    for omitted in range(g+1):
        values = []
        for x in range(g+1):
            rows = [[F(x if i+j == n-1 else 0)-b[i][j]
                     for k,j in enumerate(cols) if k != omitted] for i in range(g)]
            values.append((-1)**omitted * det(rows))
        coefficients.append(solve(vander, values))
    return det(coefficients)

cases = 0
for n in range(3, 9):
    for m in (1, 3, 5):
        for seed in range(3):
            c = [((i+1)*(seed+2) % 7)-3 for i in range(n)]
            b = matrix(n, m, c)
            assert abs(q_invariant(n, b)) == m
            for x in range(-3, 5):
                actual = (-1)**(n*(n-1)//2) * det(
                    [[F(x if i+j == n-1 else 0)-b[i][j] for j in range(n)] for i in range(n)])
                expected = x**n + sum(c[i-1]*x**(n-i) for i in range(1,n-1)) + m*c[-2]*x + m*m*c[-1]
                assert actual == expected, (n, m, c, x, actual, expected)
                cases += 1
print("matrix characteristic-polynomial evaluations:", cases, "; |Q| checks: 54")

# E1 and E15: quadratic discriminant and the trace-zero obstruction.
assert all((a*a-4*b) % 4 in (0,1) for a,b in product(range(-20,21), repeat=2))
assert all((-4*b) % 4 == 0 for b in range(-100,101))
print("quadratic mod-4 checks: 1681; trace-zero checks: 201")

# E6: at integer X, the first-order count error is of order X^(D-1).
for n in range(2,7):
    for x in (10,20,40):
        total = 1
        for i in range(1,n+1):
            total *= 2*x**i-1
        assert total < 2**n*x**(n*(n+1)//2)
        assert 2**n*x**(n*(n+1)//2)-total >= (2*x)**(n-1)*x**(n*(n-1)//2)

# E7: the correct imprimitive index.
assert [comb(n,n//2)//2 for n in (4,6,8)] == [3,10,35]
assert 2*factorial(2)**2 == 8
assert F(6,10) < 1 < F(4,3)
print("imprimitive indices n=4,6,8:", [comb(n,n//2)//2 for n in (4,6,8)])

# E10: exact completed-square bound for the claimed cubic reduced basis.
# Norm = 3(a+c/3)^2 + 100(b-21c/100)^2 + residual*c^2.
residual = F(1667)-F(1,3)-F(441,100)
assert residual > 100
assert all(3*a*a+2*a >= 0 and 100*b*b-42*b >= 0 for a,b in product(range(-20,21),repeat=2))
print("cubic third Gram-Schmidt squared length:", residual)

# E13: zero discriminant lies in every square-divisibility set, with no cutoff.
assert all(0 % (m*m) == 0 for m in range(1,1001))

# E14: x^2-1 under the printed monic-normalized contraction has root 1/rho.
# Its primitive vector theta has smaller norm than 1, so it is not quasi-reduced.
for rho in range(2,101):
    assert F(2,rho*rho) < 2
    assert F(1,rho) != rho

# E16: x^2+x+q has norm u^2-u*v+q*v^2 in its complex embedding.
# The proof for all integers uses (u-v/2)^2 + (q-1/4)*v^2.
for q in range(2,102):
    assert F(q)-F(1,4) > 1
    assert [u for u in range(-10,11) if u*u-u+q == q] == [0,1]
    vals = [(u*u-u*v+q*v*v,u,v) for u,v in product(range(-8,9),repeat=2) if (u,v)!=(0,0)]
    assert [(u,v) for value,u,v in vals if value == min(x[0] for x in vals)] == [(-1,0),(1,0)]
for x in (40,80,160):
    number = 0
    for a in range(1,x//2,2):
        k = (a-1)//2
        for b in range(x*x//2+1,x*x):
            assert a*a-4*b < 0 and b-k*(k+1) >= 2
            number += 1
    assert number > x**3//9
    print("positive-density tied irreducible quadratics, X =", x, ":", number)

# E17: A0 antidiagonal and B=diag(1,2,3,5), over F_13.
# Y_t=span(u_t,v_t), u_t=(1,0,t,0), v_t=(0,1,0,-t), is A0-isotropic.
# X=span(u_t+r*v_t) is B-isotropic whenever 1+3t^2+(2+5t^2)r^2=0.
p = 13
flags = [(t,r) for t,r in product(range(p),repeat=2)
         if (1+3*t*t+(2+5*t*t)*r*r) % p == 0]
assert 480 % p != 0
assert len(flags) > 4
assert any((1+3*t*t) % p != 0 for t,r in flags)
print("distinct flags satisfying the printed definition over F_13:", len(flags), flags)
print("all exact finite diagnostics passed")
```
