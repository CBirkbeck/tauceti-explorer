# Schinzel Hypothesis on average and rational points — extraction checkpoint

Job: PAPER-SKOROBOGATOV-SOFOS-23. Issue: [#1256](https://github.com/CBirkbeck/tauceti-explorer/issues/1256). Worker: Codex, session `codex-a71f92`. Status: **partial**.

The complete published paper has been read. This checkpoint contains 91 items: 6 exact library matches, 6 existing planned imports and 79 missing items, each assigned to exactly one of seven routes. There are 29 definition contracts, 87 proposed API contracts and 59 proposed regression tests. It does **not** certify full proof closure or any new Lean theorem.

The principal obstruction is mathematical, not access: printed Lemma 3.14 is false in an elementary linear specialization. The prime-value/dispersion chain needs a positivity or real-region repair. The finite local probability calculations and the numerical implication in §7 can nevertheless be checked independently and have been.

## Source and reading boundary

Primary source: Skorobogatov–Sofos, *Schinzel Hypothesis on average and rational points*, Inventiones Mathematicae 231 (2023), 673–739, [DOI](https://doi.org/10.1007/s00222-022-01153-6). The [University of Glasgow repository](https://eprints.gla.ac.uk/292484/) identifies its [67-page PDF](https://eprints.gla.ac.uk/292484/1/292484.pdf) as the Published Version, under a Creative Commons Attribution licence. All sections, proofs, remarks and references were read on 2026-09-22. SHA-256:

```text
8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1
```

The latest [arXiv version, 2005.02998v3](https://arxiv.org/abs/2005.02998v3), was downloaded (SHA-256 `f1e900fa496a44147dacb69cb33235596d73c2fb84fee50e21e8a660b08a1bcd`). Only its introduction and Lemma 6.6 were compared: no full version collation is claimed. The latter comparison establishes that the accidental dispersion display in the published conic-indicator proof is already correct in v3.

For correction checking, I also inspected the introduction and Theorem 1.1 proof of [Generic diagonal conic bundles revisited, v2](https://arxiv.org/abs/2212.14778v2), pp1–4, and pp2–3 of [Browning–Sofos–Teräväinen, v2](https://arxiv.org/abs/2212.10373v2), plus keyword searches. The latter explicitly uses an even extension of the von Mangoldt function. Neither inspected passage identifies a correction to SS23 Lemma 3.14. Neither later paper was fully read here. The local smooth-openness discussion preceding Theorem 4.5 of [Conrad's author PDF](https://math.stanford.edu/~conrad/papers/adelictop.pdf), p11, was also checked.

## What is being routed

This is a fixed-degree, growing-coefficient-height problem, not growing-degree random irreducibility. Write D=Σd_i and N=D+n. The coefficient box has N coordinates, with n positive leading coefficients. Its leading volume is 2^D H^N, not (2H)^N.

A Schinzel tuple has **one common nonvanishing residue for all factors at each prime**. The paper's definition does not impose irreducibility or distinctness. The weighted count θ uses positive prime values; negative primes and prime powers do not count. The finite singular series includes the M-dependent unit indicator and the factor M^{n−1}/φ(M)^n.

The analytic objective is the mean discrepancy O(x/√log x) for (log H)^A₁ < x ≤ (log H)^A₂ with n < A₁ < A₂. The many-prime-witness theorem gives at least (log|P|)^{A/3} witnesses up to (log|P|)^{n+A} for relative density one of admissible tuples, with the printed quantitative exception rate. Congruence classes, height normalization, distinct prime values and the difference between pointwise and simultaneous x must remain visible.

The geometric applications use that prime-value engine inside finitely many local congruence neighborhoods. They yield relative density one **within the specified locally soluble or Brauer-compatible family**, and separately positive ambient coefficient density. They do not prove a Hasse principle for every individual fiber.

### Ownership and proposed routes

| Route | Owner | Scope |
| --- | --- | --- |
| Part II | ArithmeticStatisticsPartIISchinzelAverages | Fixed-degree coefficient laws, local Euler-factor moments, Schinzel density, corrected dispersion, prime witnesses and quadratic-character cancellation |
| Part II | HeightsRationalPointsPartIIRandomFibrations | Universal norm/conic families, finite local congruence covers, density-one applications and the §7 lower bound |
| Source | ArithmeticStatistics:ST.0 | Generic relative height-family density and denominator API |
| Source | AnalyticNumberTheory:AN.2, AN.5 | Möbius estimates, multiplicative means, truncation conventions, PNT/Mertens supplier interfaces |
| Source | ExponentialSumsAndCircleMethod:ES.0 | Symmetric and one-sided Dirichlet-kernel L1 bounds |
| Source | SieveMethodsAndPrimePatterns:SV.2 | Heath-Brown quadratic-character bilinear bound, including denominator 2 |
| Source | HeightsRationalPointsAndObstructions:RP.2 | Cyclic norm obstruction, invariant matrix and one-omitted-place adapters |

The JSON contains the full design briefs and exact item membership. The proposed growing-degree random-polynomial Part II from BKK23 is not the owner of these new fixed-degree prime-value layers. Both should import ST.0, not each create a second generic density framework.

The geometric Part II imports CFT layers 5, 6, 10 and 12 and GlobalQuadraticForms layer 5. It does not re-plan the local invariant, unramified unit norm theorem, ABHN, ray-class correspondence or Hasse–Minkowski. RP.2 supplies cyclic obstruction adapters; the statistics Part II supplies prime values. These supplier-to-consumer directions avoid a circular proof of prime values from their rational-point applications.

Proposed eventual modules and landmarks appear in the design briefs. This issue authorizes only the JSON, report and handoff, not a Lean source file.

## The substantive source obstruction

For Lemma 3.14 take d=k=Ω=1 and an integer H≥1. Every polynomial in the box is

```text
P(t)=a t+b,  1≤a≤H,  −H≤b≤H.
```

As b varies, P(1) ranges from a−H to a+H. Since a−H≤0, the positive-prime weighted sum is exactly

```text
Σ_{a=1}^H Σ_{a+b prime, −H≤b≤H} log(a+b)
  = Σ_{a=1}^H θ(H+a)
  = (3/2) H² + o(H²).
```

The final equality follows from the prime number theorem, uniformly for H≤H+a≤2H. The printed main term is 2H² with error O_A(H²/(log H)^A), which is incompatible with this calculation. Geometrically, the excluded triangle a+b≤0 has area H²/2.

This argument is independent of how one extends Λ to negative integers, because the lemma itself counts **positive primes**. With a positive-only Λ, full-box divisor/Fourier calculations need a cutoff. With an even Λ, the later transition to positive primes needs a correction. Neither convention makes the printed Lemma 3.14 true.

A plausible repair direction is to retain the real-region volume, or prove a restricted-input estimate and show that the omitted small-input/negative-value contribution is harmless after summing over inputs. That work is **not done here**. The counterexample does not alone disprove Theorem 1.9 or the main geometric conclusions.

The dependency that must be repaired is:

```text
signed/positive-value convention
  → one-/two-point coefficient estimates
  → θ² and Sθ moments
  → dispersion / mean prime-value theorem
  → density-one prime witnesses
  → norm and conic applications.
```

The S² local probability calculation and its finite checks do not resolve the missing positive-prime estimates.

## Finite calculations actually verified

### C1: Bernoulli local laws

I exhaustively checked 374 rational identities covering all subset moments and all joint atoms for:

- p=2,3 with degree tuples (1), (2), (3), (1,1), (1,2), (2,2);
- p=5 with degree tuples (1), (2), (1,1).

The model includes the zero polynomial and all lower-degree reductions. Every atom was checked against inclusion-exclusion using G_p(d,s). The normalized first/second moments and the single-polynomial obstruction p^{-min(p,d+1)} were checked too. These are finite exact checks, not evidence that arbitrary-degree evaluation coordinates are independent.

### C2: mod-4 densities, including the general-degree argument

Enumeration gives:

| d | Successful coefficient vectors | Total | Proportion |
| --- | ---: | ---: | ---: |
| 2 | 38 | 64 | 19/32 |
| 3 | 156 | 256 | 39/64 |
| 4 | 624 | 1024 | 39/64 |
| 5 | 2496 | 4096 | 39/64 |
| 6 | 9984 | 16384 | 39/64 |

For all d≥3, the evaluation vector of t^j at 0,1,2,3 modulo4 is the same as that of t² for even j≥2, and t³ for odd j≥3. Thus the image equals the degree-3 image. The four-variable degree-3 evaluation map has a kernel of size4: c₀=0; c₁,c₂ independently lie in {0,2}; and c₃=−c₁−c₂. Consequently its image has64 elements.

The image is precisely the vectors satisfying v₀≡v₂ mod2 and v₁≡v₃ mod2: there are64 such vectors. Among vectors with entries only in {0,2,3}, each same-parity pair has 2²+1²=5 choices. Exactly25 image vectors therefore avoid1, leaving39. Equal-sized fibers give 39/64 for every d≥3.

### C3: a rigorous numerical margin

For d≥2, min(p,d+1)≥3 at odd primes, so the smallest relevant Euler product is ∏_{p≥3}(1−p^{-3}). The exact finite product through100, multiplied by 1−1/20000, is a lower bound: use ∏(1−a_j)≥1−Σa_j and Σ_{n>100}n^{-3}≤1/(2·100²).

The resulting rational lower bound exceeds 0.950713, hence exceeds19/20. Multiplying by19/32 gives a lower bound exceeding0.564486. This leaves a strict margin above0.56 after choosing sufficiently small ε. It proves the numerical implication of Theorem7.1, **not** its still-gated analytic premise.

### C4: non-proof numerical diagnostics for E1

The ratios Σ_{a≤H}θ(H+a)/H² at H=10,100,1000,10000 were 1.151914, 1.348581, 1.452753 and 1.485089. These agree with the exact PNT argument toward1.5; the argument, not these four data points, establishes the counterexample.

## Pinned-library boundary

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; atlas inspected at `6660b3c597a8c70872eeb63f3d01a198cfeb0dd9`.

The reviewed audits and actual stage descriptions were read before routing. Broad searches covered both pinned source trees and the atlas's new roadmaps, packets, decompositions, links and reserved IDs. Actual statements, not just names, were read for every library credit:

- Vandermonde determinant and injectivity criterion (item17).
- Natural-domain von Mangoldt and Möbius divisor identity (26–27).
- Algebra.norm and basis determinant/scalar formulas (51).
- legendreSym/jacobiSym, including denominator2 behavior (71).
- Fermat's sum-of-two-squares theorem for primes (85).

The JSON records files, line locators and SHA-256 hashes. In particular, Mathlib's Jacobi symbol **does** match the paper's even-denominator convention; a Kronecker-symbol substitution would be wrong. The published Fourier identity **does** contain its conjugation bar; PDF text extraction loses it, so it is not reported as an error.

The six planned imports are not library theorems. The audited PNT, local invariant, ABHN and Hasse–Minkowski endpoints are not built. No carrier such as a local field, Brauer group or arbitrary finite Fourier transform is credited with those endpoint proofs.

## Source findings awaiting independent review

The complete section-18 records are in `sourceIssues`, with quotes, corrections, reasons, affected scope and correction-search provenance. None has been independently reviewed by this worker.

- **E1 (error; a stated result)** — Lemma3.14 pp701–703: The main term must retain the positive-value real-region factor, or the statement must be restricted with a proved error sufficient for§4. No all-parameter repair is claimed here. Items34–35 explicitly block the false unrestricted statement.
- **E2 (misprint; a stated result)** — Theorem1.2 p675; Proposition6.7 p730: RequireM≠0, and normalizeM≥1 in every congruence-family asymptotic.
- **E3 (misprint; nothing)** — Lemma2.4 proof p686: Add#A=r to the inner sum, or omit the outer sum and retain one sum over all subsets.
- **E4 (gap; the proof)** — §3 pp690–695, especially Eq3.1 and the paragraph definingΛ_z: SpecifyΛ andΛ_z onℤ including0; prove Fourier-tail bounds with that convention and a separate positive-value adapter before deducing positive-prime sums.
- **E5 (misprint; a stated result)** — Definition ofMcal before Lemma3.4 p691 and Lemmas3.4–3.5 pp692–693: Restrictk,m to positive integers, as the consumers do, or usemax(1,|k|,|m|) in the support and bound.
- **E6 (gap; the proof)** — Lemma3.5 proof p693: Ford=1 the second factor isD_H⁺, notD_H. Apply the sameO(logH) L1 estimate toD_H⁺. Ford≥2 the displayed retained pair is valid.
- **E7 (misprint; nothing)** — Lemma3.9 proof p695: Insert(2π)^{-1}∫_{−π}^π overline(S_{E_z}(α₁)) times that productdα₁.
- **E8 (misprint; nothing)** — Lemma3.12 proof p700: Use(−cℓ₀/φ(cℓ₀)+O_A((logz)^{−A}))², or its expanded squared main term with an appropriately absorbed error.
- **E9 (misprint; nothing)** — Opening§4 p703: WriteV(x,H)≪x²/logx, equivalentlyx²(logx)^{−1}.
- **E10 (gap; the proof)** — Lemma4.1 proof pp703–704: Bound the off-diagonal terms with at least one higher prime power as well, and propagate the signed/positive-value correction fromE4. Keep this as a proof obligation until its uniform estimate is supplied.
- **E11 (gap; the proof)** — Corollary1.10 pp680–681: Supply a maximal/discretization argument giving one exceptional set for allx in the|P|-dependent range, with the printed exception exponent; otherwise state the pointwise-in-x result of item15.
- **E12 (misprint; nothing)** — End Lemma4.11 p716; end Theorem1.5 p717: Use(loglogx)^{n−d} in the Lemma4.11 lower bound, and exponentd−n in both denominators of the final comparison.
- **E13 (misprint; nothing)** — Lemma4.4 proof p707: Parameterize positive differences byintegert≥1 withtM<x; retain the correspondingm≤x−tM endpoint convention.
- **E14 (gap; the proof)** — Lemma5.2 proof p718; its reuse in§6.3 p733: Apply openness to the smooth joint mapf=(g,h), which the paper has available, and restrict to an integral neighborhood for the integral version.
- **E15 (misprint; nothing)** — Theorem5.3 p719 (denominator convention also used in5.8 and6.1): State explicitly thatM′ has relative density1 IN M, while the later assertion is positive ambient coefficient density.
- **E16 (misprint; nothing)** — Example5.6 p720: Say that the right-hand side is divisible by2^m, or that its2-adic valuation is at leastm.
- **E17 (gap; the proof)** — Remark5.9(2) p722: Use the JOINT Schinzel hypothesis to choose one residue t_p for which everyP_i(t_p) is a unit.
- **E18 (misprint; nothing)** — Lemma6.6 proof p730: Replace the accidentally pasted Eq1.6 with(−a₂a₃π₂π₃/π₁)(−a₁a₃π₁π₃/π₂)(−a₁a₂π₁π₂/π₃).
- **E19 (error; a stated result)** — Eq6.7 p731: Require the polynomialsP_i to be pairwise distinct for this pointwise estimate. Remove the repeated-polynomial coefficient diagonals, whose density tends to0, in the average argument.
- **E20 (misprint; nothing)** — §6.3 p734: Writem₀∈ℤ^{d+n}.
- **E21 (misprint; nothing)** — DefinitionP_d(H),§7 p734: Writedeg(f)=d.
- **E22 (error; a stated result)** — Discussion following Definition1.8 p680: Do not assert this for arbitrary tuples allowed by Definition1.8. State the classical convergence result with its distinct irreducible polynomial hypotheses and handle fixed-divisor/content cases separately; for this paper's averages retain the finite product only.

E18 is already correct in arXivv3. For the others, `known: new` means that no correction was located in the documented search, not a certified priority claim. E10, E11 and E14 are proof gaps, not claims that the intended theorem is false. E15 records a denominator ambiguity. The primary-paper authors have not been contacted; the protocol leaves that to the maintainer.

## Why this is partial and where to resume

The reading is complete but the inventory is not yet full blueprint closure. In particular, the conditional-moment lemmas and several detailed coefficient summations are still grouped at interface level, and original prerequisite proofs have not all been read. The exact open tasks are:

- G1: Repair Lemma3.14 with an explicit positive-value real-region factor or prove a restricted-input estimate with summed error adequate for§4; propagate it through35,40,46,47 and9.
- G2: FixΛ andΛ_z on signed and zero integer arguments; re-prove every Fourier/divisor transition with the chosen convention.
- G3: Obtain and fully read original proofs of Davenport, the uniform coprime Möbius estimate, Heath-BrownCor4, Mertens and Dirichlet-kernel L1 estimates. Citations in SS23 are not completed supplier extraction.
- G4: Complete omitted fine items: Lemmas2.1–2.3 and2.7 conditioned moments, exact3.8 proof bounds,4.2/4.4/4.8 coefficient summations, and the detailed6.5 off-diagonal proof. Current items expose the main interfaces but are not full closure.
- G5: Resolve E10 higher-prime-power deletion and E11 simultaneous-in-x exceptional set with all uniformity and normalization constants.
- G6: Read original cyclic-algebra/local-invariant, local smooth-openness, unramified norm, strict-class-field/Kronecker–Weber and conic/Hilbert-symbol proofs. Import existing upstream carriers; refine all partial supplier interfaces.
- G7: Complete the blueprint-level CRT/large-prime-tail proof and transport the exact finite calculations to the chosen carriers. The report supplies the general mod4 image/fiber argument; executed checks are not Lean proofs.
- G8: Fully collate arxivv3 and published version, verify each source finding independently, and inspect any subsequent corrections beyond the limited later-paper passages read. No author contact is authorized or made.
- G9: Expand API/unit-test contracts into blueprint-level declarations with uses and proof steps for every omitted construction, including residue-conditioned probability and local scheme topology.
- G10: Check downstream-family overlap against the latest accepted proposals before design intake; keep fixed-degree Schinzel averages separate from growing-degree random irreducibility, importing generic height-family infrastructure.

The original proof leads are in `prerequisites`. They include Davenport II, Heath-Brown Corollary4, Conrad's topology paper, the Brauer–Grothendieck book and the cited analytic/class-field references. Later strengthening papers are context/correction leads, not retroactively imported as proved replacements.

## Reproducible finite certificate

Run the following with standard Python3. It uses exact fractions for C1–C3. Only the explicitly labelled C4 diagnostics use floating logarithms. It needs no repository checkout, network, third-party package or local pathname.

```python
"""Exact finite checks for the SS23 extraction; standard library only."""
from collections import Counter
from fractions import Fraction as F
from itertools import product
from math import comb, prod, log
def G(p,d,s):
    return sum((F((-1)**r*comb(s,r),p**min(r,d+1)) for r in range(s+1)),F(0))
checks=0
configs=[(p,ds) for p in (2,3) for ds in ((1,),(2,),(3,),(1,1),(1,2),(2,2))]
configs += [(5,(1,)),(5,(2,)),(5,(1,1))]
for p,ds in configs:
    laws=[]
    for d in ds:
        law=Counter()
        for c in product(range(p),repeat=d+1):
            mask=sum((sum(c[j]*m**j for j in range(d+1))%p !=0)<<m for m in range(p))
            law[mask]+=1
        laws.append(law)
    counts=Counter({(1<<p)-1:1})
    for law in laws:
        nxt=Counter()
        for x,nx in counts.items():
            for y,ny in law.items(): nxt[x&y]+=nx*ny
        counts=nxt
    total=p**sum(d+1 for d in ds)
    for mask in range(1<<p):
        moment=sum(n for x,n in counts.items() if x&mask==mask)
        assert F(moment,total)==prod(G(p,d,mask.bit_count()) for d in ds)
        # Exact inclusion-exclusion over the zero positions.
        zero=((1<<p)-1)^mask
        prediction=F(0)
        for sub in range(1<<p):
            if sub&zero==sub:
                prediction+=(-1)**sub.bit_count()*prod(G(p,d,(mask|sub).bit_count()) for d in ds)
        assert prediction==F(counts[mask],total)
        checks+=2
    n=len(ds)
    mean=sum(F(v*x.bit_count(),total) for x,v in counts.items())
    moment2=sum(F(v*x.bit_count()**2,total) for x,v in counts.items())
    gamma=1-F(1,p)+F(p**(n-1),(p-1)**n)
    assert mean==p*(1-F(1,p))**n
    assert moment2==p*p*(1-F(1,p))**(2*n)*gamma
    checks+=2
    if n==1: assert F(counts[0],total)==F(1,p**min(p,ds[0]+1)); checks+=1
print("Bernoulli-law rational identities:",checks)
for d in range(2,7):
    yes=sum(any(sum(c[j]*m**j for j in range(d+1))%4==1 for m in range(4))
            for c in product(range(4),repeat=d+1))
    expected=F(19,32) if d==2 else F(39,64)
    assert F(yes,4**(d+1))==expected
    print("mod4 degree",d,"count",yes,"density",expected)
def prime(n):
    return n>=2 and all(n%d for d in range(2,int(n**0.5)+1))
finite=prod(1-F(1,p**3) for p in range(3,101) if prime(p))
lower=finite*(1-F(1,2*100**2))
assert lower>F(19,20)
assert F(19,32)*lower>F(56,100)
print("odd-prime Euler product lower >19/20:",float(lower))
print("resulting lower density >56/100:",float(F(19,32)*lower))
for H in (10,100,1000,10000):
    theta=[0.0]
    for k in range(1,2*H+1): theta.append(theta[-1]+(log(k) if prime(k) else 0))
    ratio=sum(theta[H+a] for a in range(1,H+1))/(H*H)
    print("Lemma3.14 diagnostic H",H,"LHS/H^2",round(ratio,6))
```

Repository validation and the item/route/dependency audit are recorded in the handoff. Schema success does not close the mathematical gates.
