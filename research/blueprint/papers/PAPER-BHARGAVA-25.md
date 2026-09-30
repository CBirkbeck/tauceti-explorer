# PAPER-BHARGAVA-25: counting integer polynomials by Galois group

Manjul Bhargava, *Galois groups of random integer polynomials and van der Waerden's Conjecture*, [Annals of Mathematics 201 (2025), 339–377](https://annals.math.princeton.edu/2025/201-2/p01); [arXiv v3](https://arxiv.org/pdf/2111.06507v3).

Original extraction: Claude Code, session `cc-fb70e5`, 29 September 2026. Independent review and corrections: Codex, session `codex-rtOQ9t`, 29–30 September 2026, issue #1060.

**Status: partial; review verdict: revise.** The [result JSON](PAPER-BHARGAVA-25.result.json) has 74 items (10 library, 3 planned, 61 missing), six routes, 17 external-prerequisite entries, 26 reviewed source findings and seven explicit gaps. Every missing item is routed once. The [independent review](../reviews/REV-PAPER-BHARGAVA-25.md) records every change and the evidence.

## Sources and scope

Both extractor and reviewer read all 34 pages of arXiv v3. Its SHA-256 is `b98647f10dbf4b74be61570d8f12fe7c8cadf24f7e47e667a1bcff6159471780`. Locators and all finding verdicts concern that preprint. The published PDF was not obtained: the direct Project Euclid request returned HTML. The Annals article page and arXiv version history were checked; no correction was found. Publication after acceptance does not establish text identity.

The reviewer read selected external passages from Ellenberg–Venkatesh, König and Zarhin for specific checks, not all prerequisite papers in full. The recursive supplier work remains explicit.

## Mathematics and corrected targets

The central direction is fixed-degree counting in coefficient boxes. For n≥3 the principal target is E_n(H)=O(H^{n−1}); the quadratic exceptional count is instead of order H log H. Separate reducible and imprimitive cases, then use the permutation index to force powerful field discriminants. Fourier cancellation for index conditions controls small ramification products, field counts control small discriminants, and a large-ramification sieve handles the remaining case.

For transitive G≤S_n put k=ind(G), c=q(k,n−k), u=1/(n(n−1)) for primitive G and zero otherwise, and take an admissible field-count exponent a>u. Write θ=(1−1/k)/(a+1−1/k−u) and B=max(c,n−1). The corrected general target is

N_n(G,H) = O(min{H^{n+1−k}+H^{n−(n−1)θ}(log H)^B, H^{(2n−2)(a−u)+1}(log H)^{n−1}}).

The source's intransitive scope has a counterexample (E17). The larger logarithm avoids the failed comparison in E11, but does not repair the separate elimination gap E10. This formula is retained as a target with that open proof obligation, not certified closed.

Theorems 12–18 supply primitive-group index bounds and non-elemental resolvents. Theorems 20 and 25 sharpen field counts; Propositions 21–22 control index strata through weighted power sums; Propositions 26 and 30 provide finite-field Fourier bounds. All these families are represented in the items, while several multi-part items still require declaration-level splitting.

Corollary targets retain their actual hypotheses: conservative thresholds 10,16,28,56 for Corollary 3(a), with the original 53–55 target unresolved; geometric Jacobian endomorphisms with n≥5; prime cyclic groups; regular groups of order>4 coprime to 6; and G×M_11 for k≤8 or proper G<S_9 at k=9. Theorem 7 uses orbit quotient images, a height including the leading coefficient and a dyadic factor-tuple estimate. The nonmonic extension needs a separate proof.

## Library and owners

The pinned library already supplies root actions, primitivity and blocks, two Jordan theorems, Mahler measure and its comparisons, discriminants/resultants, the integral primitive-element index identity, Newton identities, Schwartz–Zippel, root counts and CRT. The filtered partition count is not itself a library declaration and was changed to missing. Multidimensional periodic Poisson is not supplied by the pinned one-dimensional theorem.

The planned imports are local ramification/Dedekind–Kummer, Weil's bound, and divisor estimates. The reviewer read their stage descriptions and reviewed library audits; specialized missing adapters are kept as gaps.

Routes below use the result JSON's array numbering.

| Route | Owner and content | Review |
|---|---|---|
| 1 | ArithmeticStatistics ST.3: field counts and small trace-zero elements, with generator and degree restrictions | accept |
| 2 | InverseGaloisAndArithmeticFundamentalGroups IG.2: the height-density form of Hilbert irreducibility | accept |
| 3 | SchemeAndStackFoundations SF.5: zero-dimensional projective Bézout | accept |
| 4 | PolynomialGaloisGroupsPartIICountingByGaloisGroup: fixed-degree index strata, field-count adapters, Fourier weights, sieve and applications | reject pending proof/extraction gaps |
| 5 | AnalyticNumberTheory AN.5: positive k-powerful integers and weighted tails | accept |
| 6 | AutomorphicLFunctionsAndLocalFactors AL.0: multidimensional periodic Poisson with correct zero-residue terms | accept |

The Part II extends the upstream PolynomialGaloisGroups roadmap without re-planning its Galois-action and specialization theory. It differs from the growing-degree random-polynomial proposals. This justifies the direction, but not activation before its rejected proof obligations are completed. Generic integer estimates and Poisson summation now have existing foundational owners.

## Source findings and remaining work

The 15 original findings were checked and annotated. E10 remains a genuine open proof step; the earlier claim that projection closures repair it was withdrawn. E11 and E13 establish failures of particular deductions, not falsity of the stated counting theorems. E15 has a quadratic counterexample.

New E16–E26 concern the S_9×M_11 counterexample, the intransitive field-count mismatch, missing monicity in Lemma 24, its local arithmetic slips, height zero, unsupported shell counting, the normalized index-stratum family, omitted Poisson aliases, splitting-type degree restrictions, Zarhin's n≥5 hypothesis, and the quadratic H log H exception. The result and independent review give each check. These are **preprint findings**, awaiting published-text collation.

The seven gaps identify elimination/finite projections, granularity and APIs/tests, recursively unchecked suppliers, wild-prime/index adapters, the 53–55 threshold, nonmonic/repeated-root conventions, and published collation. The 17 prerequisite papers remain a reading list; they are not asserted to be recursively closed.

## Validation

Exact local numerical regressions passed earlier in the review. The final JSON and route invariants were checked in the orchestration runtime. Terminal access was restored before submission; the actual local Python check results are recorded in the independent review. No Lean compilation or formalization is claimed.
