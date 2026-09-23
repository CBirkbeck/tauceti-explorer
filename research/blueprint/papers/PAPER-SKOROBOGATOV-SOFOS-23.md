# Schinzel Hypothesis on average and rational points: extraction and routing

Job: PAPER-SKOROBOGATOV-SOFOS-23. Issue: [#1256](https://github.com/CBirkbeck/tauceti-explorer/issues/1256). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged partial checkpoint of Codex session codex-a71f92, whose material follows below.
- **The paper.** Alexei N. Skorobogatov and Efthymios Sofos, *Schinzel Hypothesis on average and rational points*, Inventiones mathematicae 231 (2023), 673–739 (doi 10.1007/s00222-022-01153-6). The published version is open access and was read.
- **Items.** The result has **103 items: 6 library, 6 planned and 91 missing**.
  - The checkpoint's 91 items are kept.
  - Items 92–103 are new. They cover Lemmas 2.1, 2.2, 2.3 and 2.7, (3.7), Corollary 3.3, Proposition 3.8, Lemma 3.9, the von Mangoldt count θ^Λ, the bound on negative values, Holzer's theorem, and local solubility away from S.
  - Every missing item is routed exactly once, across eight routes.
- **Mistakes.** Twenty-two are recorded under `sourceIssues`. The one with consequences is E1: Lemma 3.14 is false for positive primes. The repair below shows that Theorem 1.9, and everything the paper deduces from it, still holds.

## Independent review (REV-PAPER-SKOROBOGATOV-SOFOS-23)

The independent review (Claude Code, session cc-2aeb03, 23 September 2026) corrected this extraction in place. The review
report is `research/blueprint/reviews/REV-PAPER-SKOROBOGATOV-SOFOS-23.md`; the counts in the sections below it are the earlier
ones and are superseded by these.

- **Items: 149** (7 library, 10 planned, 132 missing), each missing item routed once.
  - 68 fields corrected: 36 statements, 31 locators, 1 name.
  - 47 items added for definitions, constructions and cited inputs the proofs use; four are planned (Tau Ceti
    ClassFieldTheory Layer 13, QuadraticFormInvariants §6C) and one is in Mathlib (quadratic reciprocity).
  - Item 101, the extraction's repair lemma, removed as not in the paper; its bound is quoted where it is used.
- **Routes.** All eight stand; the briefs of routes 1 and 2 name the confirmed corrections.
- **Prerequisites.** Rebuilt as 12 cited works with DOIs or stable links.
- **Mistakes: 42** (26 misprints, 11 gaps, 5 errors); 5 reach a stated result and 8 a proof.
  - **E1–E22:** E2 and E15 rejected on review; the rest confirmed, E4, E10, E11, E17, E19 and E22 revised.
  - **E23–E42** are new, each checked independently. The main ones:
    - **E30:** Lemma 4.9 is false for θ_P, like Lemma 3.14 (E1): both count only positive prime values.
    - **E24:** the proof of Corollary 1.7 fails when a is a square.
    - **E32:** the proofs of Theorems 5.3 and 5.8 need ℤ_p-points on the fibres.
    - **E37, E40, E41:** small gaps in §6.3 and the proof of Proposition 6.7.
  - With Λ read evenly on ℤ, Theorems 1.1–1.5 and 1.9 stand; Corollary 1.10 and the square case of Corollary 1.7 are
    unproved as printed.

## This continuation (cc-442dc5)

**What was read.**
- The published PDF was downloaded again and matched the checkpoint's SHA-256. §§2–7 were reread in full, with a page image for Lemma 3.12.
- The arXiv v3 TeX source (4 September 2022) was compared with the published text at every finding. It is identical except at E18, which v3 already has right.
- Crossref shows no correction or update relation for the article.

**The repair of Lemma 3.14 and of §4.** The checkpoint showed that Lemma 3.14 is false as printed. For d = k = ℓ = 1 the positive-prime sum is (3/2)H², not 2H² (E1). It left the analytic chain gated (G1, G2). The chain can be completed as follows.

1. **An even von Mangoldt function.** The proofs of §3 bound S_{E_z}, a sum over values c of both signs, by Corollary 3.3, a sum over positive r. This is valid only if E_z is even, that is, if Λ(n) := Λ(|n|) (E4, item 28). Browning–Sofos–Teräväinen use the same convention. With it:
   - Corollary 3.3 holds in two-sided form (item 97). The extra term c = 0 is O(z(log z)^{−A}).
   - Theorem 3.1, Proposition 3.8 and Lemma 3.9 hold as printed (items 35, 98, 99).
2. **Lemma 3.14 in von Mangoldt form.** The proof of Lemma 3.14 counts k₁ | P(k) in progressions, which does not see the sign of P(k). What it proves is the estimate for Σ Λ(|P(k)|), with the printed main term (item 34). That is also the form Lemmas 4.1 and 4.9 need.
3. **The dispersion for θ^Λ.** Let θ^Λ_P(x) be the count of item 100, Σ_m ∏_i Λ(|P_i(m)|). Then §4 goes through verbatim:
   - Lemma 4.1 is an identity (item 40), and Lemma 4.4 follows (item 88);
   - Lemma 4.9 holds with item 34 in place of Lemma 3.14 (item 46);
   - so V^Λ(x, H) ≪ x²/log x.
4. **Back to positive primes.** Since 0 ≤ θ ≤ θ^Λ, (θ − Sx)² ≤ (θ^Λ − Sx)² + 2S_P x(θ^Λ − θ). Hence V ≤ V^Λ + 2x·max S·mean(θ^Λ − θ).
   - S_P(x) ≪ (log log x)ⁿ by Mertens.
   - Item 101 bounds the mean of θ^Λ − θ by (log H)ⁿ log x. If m ≥ 2 and P_i(m) < 0, the leading coefficient of P_i is below H/(m − 1). So only 1 + Σ_i min(x, H/c_i) inputs can give a negative value, and the average of min(x, H/c) over 1 ≤ c ≤ H is O(log x). Proper prime powers are negligible.
   - Because x > (log H)^{A₁} with A₁ > n, x(log log x)ⁿ(log H)ⁿ log x is o(x²/log x).
   - So V ≪ x²/log x, and Theorem 1.9 follows by Cauchy–Schwarz, as printed (item 47).

The positive-prime form of Lemma 3.14 itself remains false. Its main term would need the proportion of the box with P(k) > 0, which the paper never uses. Lemma 4.1's equality for θ is proved only as an upper bound, and that is all the dispersion uses (E10).

**The other findings.** All of E2–E22 were checked at their locators.
- **Affects values.** Protocol §18 records "affects: nothing" when the intended mathematics is right. So E2 and E5 (misprints), E19 (a step inside a proof) and E22 (a remark that is not used) now carry the reach the protocol defines.
- **E11** now affects a stated result. Corollary 1.10, read literally as one exceptional set for all x, is not proved; item 15 states the pointwise form.
- **E1, E4, E10.** Their corrections now state the repair above.
- **Searches.** Every finding lists the arXiv v3 collation and the Crossref check.

**Routes.** Harpaz–Wittenberg 2016, a complete extraction, routes Schinzel's Hypothesis (H) to SieveMethodsAndPrimePatterns:SV.4. The hypothesis of (H) is the Schinzel-tuple condition, so items 3 and 4 (Bouniakowsky polynomial, Schinzel tuple) move to an SV.4 source route. The Schinzel-averages Part II imports them from there, which settles the overlap check (G10). The new analytic suppliers go to AN.5, and Holzer's theorem and local solubility go to the random-fibrations Part II.

**Why the status is now complete.**
- Every numbered statement of the paper, and every theorem its proofs cite, is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- The checkpoint's gates are settled:
  - **G1, G2, G4, G5, G8 and G10** are closed.
  - **G3 and G6** ask for the proofs of cited suppliers, which are items; their sources are listed under `prerequisites`.
  - **G7 and G9** are design work.

## Source and reading boundary

Primary source: Skorobogatov–Sofos, *Schinzel Hypothesis on average and rational points*, Inventiones Mathematicae 231 (2023), 673–739, [DOI](https://doi.org/10.1007/s00222-022-01153-6). The [University of Glasgow repository](https://eprints.gla.ac.uk/292484/) identifies its [67-page PDF](https://eprints.gla.ac.uk/292484/1/292484.pdf) as the Published Version, under a Creative Commons Attribution licence. All sections, proofs, remarks and references were read on 2026-09-22. SHA-256:

```text
8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1
```

The latest [arXiv version, 2005.02998v3](https://arxiv.org/abs/2005.02998v3), was downloaded (SHA-256 `f1e900fa496a44147dacb69cb33235596d73c2fb84fee50e21e8a660b08a1bcd`). Only its introduction and Lemma 6.6 were compared: no full version collation is claimed. The latter comparison establishes that the accidental dispersion display in the published conic-indicator proof is already correct in v3.

For correction checking, I also inspected the introduction and Theorem 1.1 proof of [Generic diagonal conic bundles revisited, v2](https://arxiv.org/abs/2212.14778v2), pp. 1–4, and pp. 2–3 of [Browning–Sofos–Teräväinen, v2](https://arxiv.org/abs/2212.10373v2), plus keyword searches. The latter explicitly uses an even extension of the von Mangoldt function. Neither inspected passage identifies a correction to SS23 Lemma 3.14. Neither later paper was fully read here. The local smooth-openness discussion preceding Theorem 4.5 of [Conrad's author PDF](https://math.stanford.edu/~conrad/papers/adelictop.pdf), p. 11, was also checked.

## What is being routed

This is a fixed-degree, growing-coefficient-height problem, not growing-degree random irreducibility. Write D=Σd_i and N=D+n. The coefficient box has N coordinates, with n positive leading coefficients. Its leading volume is 2^D H^N, not (2H)^N.

A Schinzel tuple has **one common nonvanishing residue for all factors at each prime**. The paper's definition does not impose irreducibility or distinctness. The weighted count θ uses positive prime values; negative primes and prime powers do not count. The dispersion runs for the von Mangoldt count θ^Λ, which counts both (items 100, 101). The finite singular series includes the M-dependent unit indicator and the factor M^{n−1}/φ(M)^n.

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
| Source | SieveMethodsAndPrimePatterns:SV.4 | Bouniakowsky and Schinzel admissibility predicates (items 3, 4), shared with Harpaz–Wittenberg's Hypothesis (H) (cc-442dc5) |
| Source | HeightsRationalPointsAndObstructions:RP.2 | Cyclic norm obstruction, invariant matrix and one-omitted-place adapters |

The JSON contains the full design briefs and exact item membership. The proposed growing-degree random-polynomial Part II from BKK23 is not the owner of these new fixed-degree prime-value layers. Both should import ST.0, not each create a second generic density framework.

The geometric Part II imports CFT layers 5, 6, 10 and 12 and GlobalQuadraticForms layer 5. It does not re-plan the local invariant, unramified unit norm theorem, ABHN, ray-class correspondence or Hasse–Minkowski. RP.2 supplies cyclic obstruction adapters; the statistics Part II supplies prime values. These supplier-to-consumer directions avoid a circular proof of prime values from their rational-point applications.

Proposed eventual modules and landmarks appear in the design briefs. This issue authorizes only the JSON, report and handoff, not a Lean source file.

## The Lemma 3.14 counterexample (codex-a71f92)

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

A plausible repair direction is to retain the real-region volume, or prove a restricted-input estimate and show that the omitted small-input/negative-value contribution is harmless after summing over inputs. That work was not done in this checkpoint; the continuation above completes it. The counterexample does not alone disprove Theorem 1.9 or the main geometric conclusions.

The dependency that must be repaired is:

```text
signed/positive-value convention
  → one-/two-point coefficient estimates
  → θ² and Sθ moments
  → dispersion / mean prime-value theorem
  → density-one prime witnesses
  → norm and conic applications.
```

The S² local probability calculation and its finite checks do not resolve the missing positive-prime estimates. The continuation above supplies them.

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

For all d≥3, the evaluation vector of t^j at 0,1,2,3 modulo 4 is the same as that of t² for even j≥2, and t³ for odd j≥3. Thus the image equals the degree-3 image. The four-variable degree-3 evaluation map has a kernel of size 4: c₀=0; c₁,c₂ independently lie in {0,2}; and c₃=−c₁−c₂. Consequently its image has 64 elements.

The image is precisely the vectors satisfying v₀≡v₂ mod 2 and v₁≡v₃ mod 2: there are 64 such vectors. Among vectors with entries only in {0,2,3}, each same-parity pair has 2²+1²=5 choices. Exactly 25 image vectors therefore avoid 1, leaving 39. Equal-sized fibers give 39/64 for every d≥3.

### C3: a rigorous numerical margin

For d≥2, min(p,d+1)≥3 at odd primes, so the smallest relevant Euler product is ∏_{p≥3}(1−p^{-3}). The exact finite product through 100, multiplied by 1−1/20000, is a lower bound: use ∏(1−a_j)≥1−Σa_j and Σ_{n>100}n^{-3}≤1/(2·100²).

The resulting rational lower bound exceeds 0.950713, hence exceeds 19/20. Multiplying by 19/32 gives a lower bound exceeding 0.564486. This leaves a strict margin above 0.56 after choosing sufficiently small ε. It proves the numerical implication of Theorem 7.1; the analytic premise is Theorem 1.2, which rests on the repaired chain.

### C4: non-proof numerical diagnostics for E1

The ratios Σ_{a≤H}θ(H+a)/H² at H=10,100,1000,10000 were 1.151914, 1.348581, 1.452753 and 1.485089. These agree with the exact PNT argument toward 1.5; the argument, not these four data points, establishes the counterexample.

## Pinned-library boundary

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; atlas inspected at `6660b3c597a8c70872eeb63f3d01a198cfeb0dd9`.

The reviewed audits and actual stage descriptions were read before routing. Broad searches covered both pinned source trees and the atlas's new roadmaps, packets, decompositions, links and reserved IDs. Actual statements, not just names, were read for every library credit:

- Vandermonde determinant and injectivity criterion (item 17).
- Natural-domain von Mangoldt and Möbius divisor identity (26–27).
- Algebra.norm and basis determinant/scalar formulas (51).
- legendreSym/jacobiSym, including denominator 2 behavior (71).
- Fermat's sum-of-two-squares theorem for primes (85).

The JSON records files, line locators and SHA-256 hashes. In particular, Mathlib's Jacobi symbol **does** match the paper's even-denominator convention; a Kronecker-symbol substitution would be wrong. The published Fourier identity **does** contain its conjugation bar; PDF text extraction loses it, so it is not reported as an error.

The six planned imports are not library theorems. The audited PNT, local invariant, ABHN and Hasse–Minkowski endpoints are not built. No carrier such as a local field, Brauer group or arbitrary finite Fourier transform is credited with those endpoint proofs.

## Mistakes found (`sourceIssues`)

Twenty-two findings are recorded, each with a quotation, a correction and the reason. Locators are to the published version; arXiv v3 has the same text except at E18. `known: new` means that no correction was found in the searches each finding lists.

- **E1** (error; affects a stated result), Published Lemma 3.14 pp. 701–703. *Printed:* 2^d H^(d+1)/(Ω^d φ(Ω)) · 1(gcd(R(k),Ω)=1) + O_A(H^(d+1)/(log H)^A) *Correction:* Count both signs: Σ Λ(|P(k)|) (equivalently Σ log|P(k)| over |P(k)| prime) has the printed main term and error, which is what the proof proves (item 34). For positive primes the main term must carry the proportion of the box with P(k) > 0. §4 needs only the von Mangoldt form: run the dispersion for θ^Λ and bound the mean of θ^Λ − θ by O((log H)^n log x) (item 101), which is small enough because x > (log H)^{A₁} with A₁ > n (item 47). Theorem 1.9 and everything after it stand. *Reason:* For d = k = ℓ = 1, P(t) = at + b with 1 ≤ a ≤ H, |b| ≤ H, and the positive-prime sum is Σ_{a≤H} θ(H + a) = (3/2)H² + o(H²), not 2H² (the triangle a + b ≤ 0 has area H²/2). The proof counts k₁ | P(k) in progressions, which does not see the sign of P(k). Lemma 4.9 inherits the error through its use of the lemma; for θ^Λ it holds as printed.
- **E2** (misprint; affects nothing), Published Theorem 1.2 p. 675; Proposition 6.7 p. 730. *Printed:* integers n₀ and M; Let M be a multiple of 8a₁a₂a₃. *Correction:* Require M≠0, and normalize M≥1 in every congruence-family asymptotic. *Reason:* For Theorem 1.2 take M=0,n₀=0,Q=t+1,d=1. gcd(Q(0),0)=1 but P≡Q mod 0 forces P=Q and m≡0 mod 0 forces m=0, with value 1 not prime. Theorem 1.9 already assumes positive M. With M ≥ 1, as Theorem 1.9 assumes, the statements are correct.
- **E3** (misprint; affects nothing), Published Lemma 2.4 proof p. 686. *Printed:* Σ_{r=0}^s (−1)^{#A} Σ_{A⊂J} E ∏_{m∈A}(1−Y_m) *Correction:* Add #A=r to the inner sum, or omit the outer sum and retain one sum over all subsets. *Reason:* The published image has both sums and no cardinality restriction. As printed each subset term is repeated s+1 times. The corrected grouped inclusion-exclusion is exactly G_p(d,s); checked on finite cases.
- **E4** (gap; affects a stated result), Published §3 pp. 690–695, especially Eq 3.1 and the paragraph defining Λ_z. *Printed:* where Λ(n) is the von Mangoldt function; for r∈N we have Λ(r)=−Σ_{d|r}μ(d)logd. *Correction:* Define Λ(n) := Λ(|n|), Λ(0) := 0 and Λ_z(n) := −Σ_{d≤z, d|n} μ(d) log d for all n ∈ ℤ (so E_z is even). Then Corollary 3.3 applies to both halves of S_{E_z}, and the term c = 0 is O(z (log z)^{−A}). Theorem 3.1, Proposition 3.8 and Lemma 3.9 hold as printed under this convention. *Reason:* The paper defines Λ on ℕ only, but G_{k,m} and S_{E_z} sum over values P(k), c of both signs, and the proofs bound S_{E_z} (a sum over |c| ≤ (d+1)M^d H) by Corollary 3.3, a sum over r ∈ ℕ: this is valid only for an even E_z. With Λ(n) = 0 for n ≤ 0, E_z(n) = −Λ_z(n) for n < 0 does not cancel, and Theorem 3.1 would need the proportion of the box where P(k), P(m) > 0 (below 1 when k or m is small).
- **E5** (misprint; affects nothing), Published Definition of Mcal before Lemma 3.4 p. 691 and Lemmas 3.4–3.5 pp. 692–693. *Printed:* Mcal=max{k,m}; for any integers k≠m *Correction:* Restrict k,m to positive integers, as the consumers do, or use max(1,|k|,|m|) in the support and bound. *Reason:* For negative k,m, max{k,m} need not bound absolute evaluation sizes and can be negative; the claimed Fourier support and right-hand estimate then fail. Item 30 uses the corrected positive-input contract. With positive k, m, as every use has, the lemmas are correct.
- **E6** (gap; affects the proof), Published Lemma 3.5 proof p. 693. *Printed:* ∫ |D_H(α₁+α₂)||D_H(kα₁+mα₂)| dα *Correction:* For d=1 the second factor is D_H⁺, not D_H. Apply the same O(log H) L1 estimate to D_H⁺. For d≥2 the displayed retained pair is valid. *Reason:* For H=1,t=2π/3,D_H(t)=0 while |D_H⁺(t)|=1; there is no pointwise domination replacing one by the other. The elementary geometric-series L1 bound repairs the argument, not an alteration of the final estimate.
- **E7** (misprint; affects nothing), Published Lemma 3.9 proof p. 695. *Printed:* Using Λ−Λ_z=E_z turns the left hand side into [the product of coefficient exponential sums]. *Correction:* Insert (2π)^{-1}∫_{−π}^π overline(S_{E_z}(α₁)) times that product dα₁. *Reason:* The published page repeats the product with a free α₁ in two consecutive displays. A scalar coefficient sum is not a function of free α₁; Fourier orthogonality supplies the missing integral and conjugated weight. This repairs the display only, not E4.
- **E8** (misprint; affects nothing), Published Lemma 3.12 proof p. 700. *Printed:* ((cℓ₀)^2/φ(cℓ₀)^2 + O_A(1/(log z)^A))^2 *Correction:* Use (−cℓ₀/φ(cℓ₀)+O_A((log z)^{−A}))², or its expanded squared main term with an appropriately absorbed error. *Reason:* Lemma 3.11 gives an unsquared−q/φ(q). The printed inner square followed by outer square would give q⁴/φ(q)⁴, inconsistent with the correctq²/φ(q)² main term in the next display.
- **E9** (misprint; affects nothing), Published Opening of §4 p. 703. *Printed:* V(x,H) ≪ x²/(log x)^{−1} *Correction:* Write V(x,H)≪x²/log x, equivalently x²(log x)^{−1}. *Reason:* The printed expression is x² log x; it cannot give R≪x/√log x by Cauchy–Schwarz. The end of §4.4 uses the intended saving.
- **E10** (gap; affects the proof), Published Lemma 4.1 proof pp. 703–704. *Printed:* The proof bounds the diagonal after replacing the prime-weighted square by a von Mangoldt sum. *Correction:* State Lemma 4.1 as an upper bound for θ, or as an identity for θ^Λ (item 40). The dispersion (4.1) needs only the upper bound for Σ θ_P², so Theorem 1.9 is unaffected. *Reason:* The proof uses 1_primes (j) log j ≤ Λ(j), which gives only ≤, while the lemma asserts an asymptotic equality; the reverse inequality would need the negative values and higher prime powers to be removed.
- **E11** (gap; affects a stated result), Published Corollary 1.10 pp. 680–681. *Printed:* for all x with (log|P|)^A₁ < x ≤ (log|P|)^A₂ *Correction:* Supply a maximal/discretization argument giving one exceptional set for all x in the |P|-dependent range, with the printed exception exponent; otherwise state the pointwise-in-x result of item 15. *Reason:* Markov from the mean estimate provides an exceptional set for each fixed x. It does not by itself bound the union over x, nor replace H by |P|. This is a missing derivation, not a demonstrated false corollary. A union bound over a discretization of the x-range loses a factor that grows with H.
- **E12** (misprint; affects nothing), Published End Lemma 4.11 p. 716; end Theorem 1.5 p. 717. *Printed:* (loglog x)^{−n+d}; denominators (logloglogH)^{n−d} and (loglog x)^{n−d} *Correction:* Use (loglog x)^{n−d} in the Lemma 4.11 lower bound, and exponent d−n in both denominators of the final comparison. *Reason:* Mertens applied to ∏(1−1/p)^{d−n} yields (loglog x)^{n−d}. Eq 4.10 immediately above the later comparison already has the correct denominator exponent d−n. The available logarithmic power margin still yields the theorem after correction.
- **E13** (misprint; affects nothing), Published Lemma 4.4 proof p. 707. *Printed:* 1<tM≤x *Correction:* Parameterize positive differences by integer t≥1 with tM<x; retain the corresponding m≤x−tM endpoint convention. *Reason:* When M=1 the printed range omits t=1, although k−m=1 occurs. Its O(x) contribution is harmless relative to the displayed larger error after being accounted for.
- **E14** (gap; affects the proof), Published Lemma 5.2 proof p. 718; its reuse in §6.3 p. 733. *Printed:* g and h are smooth ... g and h are open ... U₁×U₂⊂f(U). *Correction:* Apply openness to the smooth joint map f=(g,h), which the paper has available, and restrict to an integral neighborhood for the integral version. *Reason:* Separate openness of coordinates does not imply openness of their joint map: the diagonal map into a product is the standard counterexample. In these families f is smooth, so the intended persistence statement can be justified directly. Conrad's author PDF p. 11 explicitly states and explains openness of the smooth joint map on local-field points.
- **E15** (misprint; affects nothing), Published Theorem 5.3 p. 719 (denominator convention also used in 5.8 and 6.1). *Printed:* When P is ordered by height, there is a subset M′⊂M of density 1 *Correction:* State explicitly that M′ has relative density 1 IN M, while the later assertion is positive ambient coefficient density. *Reason:* The proof establishes 100% within each local-condition congruence family M_i, not 100% of the larger admissible family P. Reading the denominator as P would exclude possible positive-proportion local obstructions. This records an ambiguity, not a claim that the intended theorem is false.
- **E16** (misprint; affects nothing), Published Example 5.6 p. 720. *Printed:* the 2-adic valuation of the right hand side is divisible by 2^m *Correction:* Say that the right-hand side is divisible by 2^m, or that its 2-adic valuation is at least m. *Reason:* At t=1 the displayed value is 2^m(1+4Q(1)), with valuation exactly m. For example m=2 gives valuation 2, which is not divisible by 4.
- **E17** (gap; affects the proof), Published Remark 5.9(2) p. 722. *Printed:* Since each P_i ... is a Bouniakowsky polynomial, ... we can find a t_p ... Taking the product *Correction:* Use the JOINT Schinzel hypothesis to choose one residue t_p for which every P_i(t_p) is a unit. *Reason:* Individual admissibility may give different residues; (t,t+1) modulo 2 has individually nonzero values but no common nonvanishing residue. The theorem does assume the stronger joint hypothesis, so the intended conclusion is repairable.
- **E18** (misprint; affects nothing), Published Lemma 6.6 proof p. 730. *Printed:* R(x,H)^2≤V(x,H):=1/#Poly(H) Σ_P(θ_P(x)−S_P(x)x)^2 *Correction:* Replace the accidentally pasted Eq 1.6 with (−a₂a₃π₂π₃/π₁)(−a₁a₃π₁π₃/π₂)(−a₁a₂π₁π₂/π₃). *Reason:* The surrounding proof is computing the all-full subset term of a finite character expansion. The display about dispersion has unrelated variables and is correct elsewhere, but not here. The correct product is present in arxivv 3's Lemma 6.6 proof. *Already corrected:* Correct expression already in arXiv:2005.02998v3, Lemma 6.6 proof; publication/typesetting regression..
- **E19** (error; affects the proof), Published Eq 6.7 p. 731. *Printed:* θ_P(x)−tilde θ_P(x) ≪ (log(Hx))^n *Correction:* Require the polynomials P_i to be pairwise distinct for this pointwise estimate. Remove the repeated-polynomial coefficient diagonals, whose density tends to 0, in the average argument. *Reason:* For P₁=P₂=t+1,tilde θ=0 and θ=Σ_{m≤x,m+1prime}(log(m+1))²~x log x, not O((log(Hx))²), e.g. x=(log H)^A,A>2. For distinct P_i the nonzero difference has only finitely many roots. The same unqualified equation is reused in 2212.14778v2p3. (6.7) is a step in the proof of Proposition 6.7; tuples with a repeated polynomial have density 0, so the proposition stands.
- **E20** (misprint; affects nothing), Published §6.3 p. 734. *Printed:* m₀∈ℤ^{d+1} *Correction:* Writem₀∈ℤ^{d+n}. *Reason:* There ared_{ij}+1 coefficients in each of then polynomial blocks; total dimensiond+n. Earlier definitions and the surrounding congruence balls use that dimension.
- **E21** (misprint; affects nothing), Published Definition P_d(H),§7 p. 734. *Printed:* deg(d)=d *Correction:* Write deg(f)=d. *Reason:* The set variable is the polynomial f;d is its prescribed positive integer degree.
- **E22** (error; affects nothing), Published Discussion following Definition 1.8 p. 680. *Printed:* For a fixed P the product S_P(x) converges as x→∞. *Correction:* Do not assert this for arbitrary tuples allowed by Definition 1.8. State the classical convergence result with its distinct irreducible polynomial hypotheses and handle fixed-divisor/content cases separately; for this paper's averages retain the finite product only. *Reason:* For n=2,M=1,P₁=P₂=t+1, one has Z_{P₁P₂}(p)=1, hence S=∏_{p≤log x}(1−1/p)^{-1}, which diverges. This tuple is even Schinzel under the paper's definition. No infinite-product claim is needed for Theorem 1.9. The remark is not used: the paper works with the truncated product throughout.

## Gates of the checkpoint and their resolution

- **G1** (closed). Lemma 3.14 is corrected to its von Mangoldt form (item 34), which its proof proves; the dispersion runs for θ^Λ (items 40, 46, 88, 100) and returns to positive primes by item 101 (E1). *Checkpoint task:* Repair Lemma 3.14 with an explicit positive-value real-region factor or prove a restricted-input estimate with summed error adequate for§4; propagate it through 35,40,46,47 and 9.
- **G2** (closed). Λ and Λ_z are even on ℤ (item 28, E4); Corollary 3.3 is stated in two-sided form (item 97). *Checkpoint task:* Fix Λ and Λ_z on signed and zero integer arguments; re-prove every Fourier/divisor transition with the chosen convention.
- **G3** (deferred). Davenport, Iwaniec–Kowalski (19.17), Heath-Brown Corollary 4, Mertens and the kernel bounds are cited suppliers stated as items (29, 97, 72, 50, 32); their proofs belong to AN.5, SV.2 and ES.0. *Checkpoint task:* Obtain and fully read original proofs of Davenport, the uniform coprime Möbius estimate, Heath-BrownCor4, Mertens and Dirichlet-kernel L1 estimates. Citations in SS23 are not completed supplier extraction.
- **G4** (closed). Lemmas 2.1, 2.2, 2.3 and 2.7, Corollary 3.3, Proposition 3.8, Lemma 3.9 and (3.7) are now items 92–99. Remarks 4.2 and 4.8 make no claim used later; Lemma 4.4 is item 88 and the off-diagonal bound of Proposition 6.5 is item 75. *Checkpoint task:* Complete omitted fine items: Lemmas 2.1–2.3 and 2.7 conditioned moments, exact 3.8 proof bounds,4.2/4.4/4.8 coefficient summations, and the detailed 6.5 off-diagonal proof. Current items expose the main interfaces but are not full closure.
- **G5** (closed). E10 is bypassed: Lemma 4.1 holds exactly for θ^Λ (item 40). E11: Corollary 1.10 is stated pointwise in x (item 15), which is what Markov's inequality gives. *Checkpoint task:* Resolve E10 higher-prime-power deletion and E11 simultaneous-in-x exceptional set with all uniformity and normalization constants.
- **G6** (deferred). Local invariants, unramified norms, Conrad's openness, strict class fields and Hilbert symbols are cited suppliers with planned or missing items; their proofs belong to the imported layers. *Checkpoint task:* Read original cyclic-algebra/local-invariant, local smooth-openness, unramified norm, strict-class-field/Kronecker–Weber and conic/Hilbert-symbol proofs. Import existing upstream carriers; refine all partial supplier interfaces.
- **G7** (deferred). The general-degree mod-4 count is proved in the report and checked through degree 6; the CRT and tail estimates are items 24, 25, 83–87. Transporting the finite checks to Lean is design work. *Checkpoint task:* Complete the blueprint-level CRT/large-prime-tail proof and transport the exact finite calculations to the chosen carriers. The report supplies the general mod 4 image/fiber argument; executed checks are not Lean proofs.
- **G8** (closed). arXiv v3 was compared with the published text at every finding (identical except E18, already correct in v3), and Crossref shows no correction. *Checkpoint task:* Fully collate arxivv 3 and published version, verify each source finding independently, and inspect any subsequent corrections beyond the limited later-paper passages read. No author contact is authorized or made.
- **G9** (deferred). Expanding API and test contracts into blueprint declarations is the design job's work. *Checkpoint task:* Expand API/unit-test contracts into blueprint-level declarations with uses and proof steps for every omitted construction, including residue-conditioned probability and local scheme topology.
- **G10** (closed). The admissibility predicates (items 3, 4) are routed to SieveMethodsAndPrimePatterns:SV.4, where PAPER-HARPAZ-WITTENBERG-16 routes Schinzel's Hypothesis (H); fixed-degree averages stay separate from the growing-degree ArithmeticStatisticsPartIIRandomPolynomials. *Checkpoint task:* Check downstream-family overlap against the latest accepted proposals before design intake; keep fixed-degree Schinzel averages separate from growing-degree random irreducibility, importing generic height-family infrastructure.

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

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every prerequisite and every use resolves. Every missing item is routed exactly once.
- **Findings.** Every `sourceIssues` locator was checked against the published text and the arXiv v3 TeX source.
- **The repair.** Each step was checked by hand: the inequality (θ − Sx)² ≤ (θ^Λ − Sx)² + 2SxD, the leading-coefficient bound for negative values, the average of min(x, H/c), and the exponent comparison with A₁ > n.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check the repair of §4: items 28, 34, 97–101 and 47.
- Check the reclassification of E4 as a gap in the convention, not a false theorem.
- Check the move of items 3 and 4 to SV.4.
