# PAPER-BHARGAVA-SHANKAR-WANG-22: Squarefree values of polynomial discriminants I

Manjul Bhargava, Arul Shankar and Xiaoheng Wang, [Inventiones Mathematicae 228 (2022), 1037–1073](https://doi.org/10.1007/s00222-022-01098-w); public text checked: [arXiv 1611.09806v3](https://arxiv.org/abs/1611.09806v3).

Original extraction: Claude Code — cc-fb70e5, 22 September 2026, issue #1274 / PR #1907.
Independent review and in-place corrections: Codex — codex-a71f92, 23 September 2026, issue #1275.

Current extraction status: **partial; independent verdict: revise**. This supersedes the original complete claim and the assertion that all auxiliary errors had been repaired. The [JSON](PAPER-BHARGAVA-SHANKAR-WANG-22.result.json) retains all 74 item identifiers: 4 library, 2 planned, 68 missing, six routes and 17 source issues. Every missing item is routed exactly once.

## Source/version boundary

The entire 29-page arXiv v3 was independently read. Its PDF is dated 4 January 2022, submitted 31 December 2021, SHA-256 `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83`. Pages 15 and 24–26 were also inspected as rendered pages.

The version of record was not read. Neither the publication date nor the author-linked Springer shared reader establishes that its text equals v3. All source-issue verdicts below are explicitly about v3. No claim is made that the main theorems are false. A title/erratum search, current arXiv history, publisher/author pages and Crossref metadata revealed no applicable correction; the absence of a search result is not proof of novelty.

The reviewer additionally read:

- [Wang's author-hosted thesis](https://www.math.uwaterloo.ca/~x46wang/Papers/Thesis.pdf), §§1.2.2, 2.6–2.7, Summary 2.32 and Theorem 2.33: the actual fixed-ruling distinguished-flag and stabilizer statements.
- [Dietmann, arXiv:1010.5341v1](https://arxiv.org/pdf/1010.5341v1), in full: coefficient-controlled resolvents and plane-curve counts.
- [Shankar–Tsimerman, author preprint dated 4 October 2013](https://www.math.toronto.edu/~jacobt/Snote2.pdf), in full: the uniform remainder needed before the Selberg sieve yields a power saving.

## Results and intended proof

For monic f=xⁿ+a₁xⁿ⁻¹+...+aₙ, let H(f)=max |aᵢ|^(1/i) and D=n(n+1)/2.

The paper states density λₙ=∏λₙ(p)>0 for squarefree discriminants and density ζ(2)⁻¹ for maximal monogenic orders, both with Oε(X^(D−1/5+ε)) errors. It also states lower bounds ≫X^(1/2+1/n) for monogenic Sₙ-fields by absolute discriminant, and an order of magnitude Y^((n−1)(n+2)/2) for fields with a short integral generator.

The sieve separates strong and weak square divisibility. Weak divisibility is embedded into symmetric matrices; the relative Q-invariant records the squarefree modulus. Fundamental-domain averaging, a main-body Selberg estimate and cusp bounds give the tails. These feed inclusion–exclusion. The field-counting application additionally needs a controlled number of polynomials per field.

The last step is **not** justified by the extraction's former repair of strong quasi-reduction. Existence of a reduced basis, uniqueness up to signs, uniqueness modulo integer translations, and a bounded number of field generators are different assertions.

## Pinned baseline and statuses

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- Item 2 uses `Polynomial.discr` and `Polynomial.resultant_deriv`, with monicity and the sign specified.
- Item 6 is a routine composition of the index–discriminant formula, `Squarefree`, positive index and `index_eq_one_iff`. It is not a claim that the cited index formula is itself already the maximality corollary.
- Item 8 imports `TauCeti.NumberField.IsMonogenic`; item 9 imports the signed integer `NumberField.discr`. Corollary 1.3 takes its absolute value; Corollary 1.4 uses a different ordering.
- Item 10 is now **missing**, not already planned by qualitative Hilbert irreducibility. It is routed with Dietmann's quantitative input to IG.2.
- AA.3 is the planned general reduction-theory supplier for item 35; its application-specific Iwasawa/single-Siegel-set details still require their cited proofs.
- SV.1 supplies the missing **optimized** Selberg inequality in item 43. Mathlib already has the Lambda-squared mechanism and diagonalization in namespace `BoundingSieve`; those are imported, not rebuilt.
- Mathlib's `Polynomial.IsRoot.norm_lt_cauchyBound` is a nearby root bound, not the exact Fujiwara estimate of item 74.

The reviewed audits AUDIT-02/07/09/13/18 and the relevant current stage descriptions were read. The exact library files supporting the four library items and the Selberg/Cauchy comparisons were checked against raw files at their pins.

## Source issues

The reviewer checked E1–E12, corrected their scope/repairs where necessary, and added E13–E17. The JSON records a version-qualified verdict and search history for every entry.

| Entry | Checked issue and consequence |
|---|---|
| E1 | The strong/weak root criterion fails at 2; x²+1 is an immediate counterexample. |
| E2–E3 | Correct the even torus coordinate to s_(g+1) and the Q-weight to ∏s_k^(−k). |
| E4–E5 | Correct the domain, compact-set name, quarter-integral lattice and two sieve subscripts/products. These local slips do not repair E13. |
| E6 | The small-modulus boundary error is governed by X^(D−1), not X^(D−n). Its repair requires a uniform lattice-count theorem. |
| E7 | The quadratic-factorization splitting-field bound is 2((n/2)!)². The argument gives Oε(X^(22/3+ε)) for quartics, not the printed stronger bound. |
| E8 | Divisor counts have an O(log X) **average**, not that pointwise bound. |
| E9 | The quadratic weak-tail case must be supplied separately, and its Δ=0 polynomials counted once before using m≪X. |
| E10 | Sign changes invalidate the printed injectivity claim. The conditional two-to-one correction is valid, but does not prove the false density-one premise. |
| E11 | Fujiwara's displayed bound lacks the factor 2. |
| E12 | A Siegel-set description does not give the claimed equivalence or uniqueness. The extraction's proposed negligible-tie repair is withdrawn. |
| E13 | The unrestricted sum over squarefree m is infinite when Δ=0. Restrict the summed tail and inclusion–exclusion first, then bound the zero locus separately. |
| E14 | Root expansion is ρⁿf(x/ρ), not f(ρx). Monic normalization alone does not repair the inverse scaling. |
| E15 | Every trace-zero quadratic has Δ=−4a₂. Therefore κ₂(2)=κ₂=0, contradicting universal positivity in Theorem 5.4. |
| E16 | Even uniqueness up to independent signs fails on a positive-density family of irreducible quadratics; Lemma 5.3's strong conclusion cannot be used. |
| E17 | The printed even-degree flag predicate omits B(Y′,Y)=0 and a fixed ruling. Ten explicit flags over F₁₃ contradict its asserted bound of four. |

### Two exact counterexamples

For x²+x+q, q≥2, the Euclidean norm in the complex embedding is

`||u+vθ||² = (u−v/2)² + (q−1/4)v².`

The only shortest vectors are ±1. Both θ and θ+1 are shortest vectors extending 1 to an integral basis, and the two bases are not related by independent signs. Taking odd 0<a₁<X/2 and X²/2<a₂<X² gives X³/8+O(X²) irreducible quadratics with this defect among 4X³+O(X²) total. This is not a removable density-zero exceptional set.

For E17 use A₀ antidiagonal and B=diag(1,2,3,5) over F₁₃. Its invariant polynomial is (x²−5)(x²−6), of nonzero discriminant 480. Let

`Y_t=span((1,0,t,0),(0,1,0,−t)), Y′_(t,r)=span((1,r,t,−rt)).`

The printed condition is 1+3t²+(2+5t²)r²=0. It has ten pairs (t,r), listed in the JSON and reproduced in the review diagnostics. The corrected condition additionally requires bilinear B-orthogonality between Y′ and all of Y, as in Wang's actual torsor.

## Routing decision and remaining work

The review asks for revision, so **no routes are activated**. ArithmeticStatistics ST.0/ST.1, ST.2 and ST.3/ST.5 remain appropriate application destinations, but their proof contracts are not closed. GN.3 owns lattice reduction, IG.2 the quantitative Hilbert-irreducibility extension, and CA.3 the corrected root bound. Route 6 is mathematically acceptable in isolation; the overall revision gate still prevents activation.

Resume with the seven explicit `reviewGaps` in the JSON:

1. Split compound items and expose Jacobian, 2-torsion, ruling, torsor, invariant-theory and Q²-divisibility inputs, with exact owners and APIs/tests.
2. Supply the uniform congruence-count estimate used by the Selberg step, importing the generic Davenport/semialgebraic count from GN.4 as required by RS-07.
3. Supply the weighted/squarefree-modulus Ekedahl adaptation and the zero-discriminant count.
4. Prove uniform weak quasi-reduction under the corrected scaling; do not assert strong uniqueness.
5. Give the field-counting application an adequate multiplicity argument and handle the quadratic trace-zero obstruction.
6. Decompose the resolvent/plane-curve and orthogonal/hyperelliptic suppliers without duplicating existing owners.
7. Compare with the version of record if legitimately accessible; do not silently generalize these v3 findings to it.

## Verification

The independent report [REV-PAPER-BHARGAVA-SHANKAR-WANG-22.md](../reviews/REV-PAPER-BHARGAVA-SHANKAR-WANG-22.md) contains the review ledger and a reproducible Python-standard-library diagnostic script. It checks 432 characteristic-polynomial evaluations, 54 absolute Q-invariants, the quadratic obstructions and ties, the cubic Gram calculation, the imprimitive indices and all ten finite-field flags. These finite tests are not proofs of the all-degree invariant identities or asymptotic theorems.

The extraction passes `scripts/check_paper.py`. No Lean file was written or compiled, and nothing is claimed formalized.
