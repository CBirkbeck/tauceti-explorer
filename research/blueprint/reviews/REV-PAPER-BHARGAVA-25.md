# Independent review: REV-PAPER-BHARGAVA-25

Reviewed by Codex, session `codex-rtOQ9t`, 29–30 September 2026. Refs #1060. The original extraction was by Claude Code, session `cc-fb70e5`; this reviewer did not write it.

**Verdict: revise.** Accept source routes 1, 2, 3, 5 and 6 in the JSON array order. Reject route 4 until its proof and extraction gaps are addressed. The revised extraction is partial: 74 items, 10 library, 3 planned, 61 missing, six routes, 26 reviewed source findings and seven named gaps. Every missing item has exactly one route.

## Evidence and limits

I read all 34 pages of [arXiv v3](https://arxiv.org/pdf/2111.06507v3), including the proofs and references. The downloaded PDF has SHA-256 `b98647f10dbf4b74be61570d8f12fe7c8cadf24f7e47e667a1bcff6159471780`. Selected page images and exact arithmetic were used to check formulas and numerical claims. The [Annals metadata page](https://annals.math.princeton.edu/2025/201-2/p01) was read, but the direct Project Euclid PDF request returned HTML. **None of the findings certifies the wording of the published article.**

The arXiv version history still lists v3 as latest. Exact-title/arXiv-id correction searches and the Annals article page gave no correction. The author homepage was inaccessible. The original extractor's Crossref search is retained as its provenance, not represented as a search repeated by this reviewer.

External passages read for specific checks: Ellenberg–Venkatesh's [author copy](https://people.math.wisc.edu/~ellenberg/CountingNF7Sep.pdf), Proposition 2.8 and its proof; König, [arXiv:1503.06686v2](https://arxiv.org/pdf/1503.06686v2), Lemma 2, for an M_11 realization; and Zarhin, [MRL 7 (2000), p.123](https://www.intlpress.com/site/pub/files/_fulltext/journals/mrl/2000/0007/0001/MRL-2000-0007-0001-a011.pdf), for the degree restriction and geometric endomorphisms. The 17 prerequisite papers were not all read in full; their recursive decomposition is an explicit gap.

The two upstream model documents already read for this area were SemisimpleAlgebras and RootSystems. For ownership I additionally read the relevant PolynomialGaloisGroups and NumberFieldArithmetic sections, LocalFieldsRamification Layer 3, all cited atlas stage descriptions, and reviewed audit rows ST.3, IG.2, SF.5, FF.2, AN.5 and AL.0. The PolynomialGaloisGroups and NumberFieldArithmetic documents were read selectively, not in full.

## Library and atlas checks

All original cited declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Items | Statement check and correction |
|---|---|
| 2–3 | Polynomial.Gal, its faithful root action, IsPreprimitive, IsBlock and the pinned primitive-element/subfield equivalence. Added TauCeti.isPretransitive_iff_irreducible with separability and positive degree. |
| 11 | Mahler measure definition, root product, multiplicativity and both coefficient inequalities. The correct height includes the leading coefficient, so x^n has height one. |
| 12 | Polynomial.discr, resultant and resultant_deriv. These do not by themselves supply the universal polynomial's double-discriminant computation; that application stays in item 56. |
| 13 | NumberField.discr plus the exact TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr. Ramification support is a separate import. |
| 14 | Nat.Partition supplies a carrier, not the restricted count, its bijection or a splitting-type theorem. Changed library to missing. |
| 18–19 | Jordan's exact transposition and three-cycle theorems are present. The double-transposition result is not supplied by them. |
| 37 | Newton's power-sum/elementary-symmetric identity gives the stated recursive equivalence when the required integers are invertible. |
| 49–50 | Schwartz–Zippel, the root bound and CRT supply the generic counts. Universal-discriminant degree and leading coefficient remain an application adapter. |
| 43 | SchwartzMap.tsum_eq_tsum_fourier is one-dimensional; it does not already provide the multidimensional periodic statement. |

Independent searches covered every missing item in the subject groups recorded in `libraryAudit.searchCoverage`. They included primitive-group minimal degree, field and polynomial counts, k-powerful weighted tails, Bézout and index strata, Fourier weights, and Zarhin's theorem. Near matches, including “smaller” for Malle and Bézout domains for geometric Bézout, were excluded after inspection. Search failure alone is not treated as proof of absence.

The three planned interfaces are retained: local ramification/Dedekind–Kummer, Weil's complete exponential-sum bound, and divisor estimates. Their owning layers were read. Missing specialized adapters are named in the gaps rather than assumed covered by a broad layer title.

## Corrections to the extraction

The original statement of an edited item is preserved in `sourceStatement`; this is extraction provenance, not necessarily a verbatim quotation from the paper.

| Items | Change |
|---|---|
| 1, 16, 60, 74 | Pin positive/exact degree, separable root actions and the separate repeated-root convention. The all-polynomial O(H^{n−1}) theorem needs n≥3; E_2(H) is of order H log H. Remove certification of Chela's uncollated fine remainder. Nonmonic extension remains unproved here. |
| 3–6 | Add separability, degree and nontriviality requirements. Restrict field-count exponents to transitive groups; identify Malle's assertion as conjectural. Positive k-powerful counting requires k≥2. |
| 8–9 | Restore the third factor 2^5 in the source's automorphism-count example (288, not 48 for the truncated type); distinguish zero finite frequency from nonzero integer aliases. |
| 11–14 | Repair height; separate universal-discriminant applications from library definitions; add the exact index-squared citation; move restricted partitions out of library status. q(k,n−k) counts geometric multiplicity partitions, not every finite-field splitting type. |
| 17, 34 | Remove the unsupported matching-optimality claim from the even-polynomial example. A small trace-zero element generates the field only under the no-intermediate-field hypothesis used in Theorem 20. |
| 38, 40 | Correct the monic translate-and-scale family and the binary projective/affine distinction. Require integrality/monicity in Lemma 24 and correct its tame exponent and translation slips. |
| 43–45, 47–48 | Correct the periodic Poisson remainder; retain splitting-type degree≤n and p>n, and k_i≥2 for Corollary 33. Compound corollaries still need splitting. |
| 50, 52–53, 56, 58 | Separate root-count inputs from the universal-discriminant adapter; restrict powerful-number tails; expose the small wild-prime step; restore C² divisibility for mod-C reasons; require partial/dyadic summation of weighted field counts. |
| 61–65 | Require transitivity and valid exponent ranges, retain a safe logarithmic exponent, and expose the elimination gap. Keep 53–55 as an unproved source target rather than calling the corollary false. |
| 66–67, 70–73 | Use geometric endomorphisms and n≥5; remove the unsupported low-order Galois-field pure-power claim; retain regular-group restrictions; repair the subdirect-product argument by dyadic overcounting; exclude G=S_9 from Corollary 8. |

The new generic source routes remove items 5 and 52 from the Part II to AN.5, and item 43 to AL.0. Item 14 joins the Part II as a missing adapter. All route numbers in the review JSON follow the result JSON array, not the old report's ordering.

## Source findings

Every original E1–E15 has an independent verdict with its checked scope. E1–E4, E7–E8 and E14 are the original notational slips. E5's induction repair and E6/E9/E12's range corrections check out. E15 has a genuine quadratic counterexample and an unjustified dropped term in the general derivation.

Three original assessments needed care:

- **E10:** confirm the missing elimination/dimension argument. The proposed replacement by closures of projections was not established; dimension bounds alone do not control every component and fiber or produce the required eliminants.
- **E11:** the comparison b<c is false, as AGL(2,3) demonstrates. This does not disprove the paper's smaller-log counting theorem. The extraction now uses a conservative logarithmic exponent and retains the independent E10 gap.
- **E13:** the displayed saving at 53–55 is insufficient. This does not prove that those groups violate the corollary. Preserve the original target and the conservative proven numerical range separately.

Eleven further findings are recorded against v3:

| Finding | Checked defect |
|---|---|
| E16 | Corollary 8 fails for G=S_9: multiply a positive-density S_9 family by one fixed M_11 polynomial. The splitting fields are disjoint because the groups have no nontrivial common quotient, giving ≫H^9 polynomials. |
| E17 | Theorem 2 cannot use degree-n field counts for intransitive groups. The 2+1 action in degree three has field count zero but ≫H^{3/2} polynomial realizations. |
| E18 | Lemma 24 needs monicity/integrality: 5x²−1 at p=5 has constant reduction but field discriminant 5. |
| E19 | Its proof uses ef in place of (e−1)f, index e instead of e−1, and the wrong sign in the translated polynomial. |
| E20 | The stated height is zero at x^n, breaking the Mahler comparisons; use max(1, nonleading coefficients). |
| E21 | A cumulative count does not imply the pointwise shell estimate used in §8, and the product-group equality is unjustified. A dyadic tuple bound repairs the retained scope. |
| E22 | Remark 23 needs t^{−n}f(tx+c), with translation before scaling, and a projective image/scalar-cone distinction for binary forms. |
| E23 | The Poisson remainder omits nonzero integer frequencies in the zero residue class. Ψ≡1 and a Gaussian give a direct counterexample to the asserted remainder bound. |
| E24 | The weight-function propositions need deg(σ)≤n; a monic degree-n polynomial cannot be divisible by a factor of degree n+1. |
| E25 | The Zarhin implication needs n≥5. The S_3 cubic x³−2 has a geometric order-three automorphism. |
| E26 | The unqualified quadratic O(H) exceptional count is false: the integer-root family has order H log H. |

No author was contacted. Published-text collation remains open for every finding.

## Route decisions and remaining work

Routes 1–3 are sound source placements after their hypothesis corrections: field arithmetic in ST.3, Hilbert density in IG.2, and Bézout in SF.5. Routes 5–6 put general multiplicative arithmetic and lattice Poisson in their existing owners. Their acceptance provides source material and a precise input contract, not a claim that the owning blueprint is closed.

Route 4 has a sensible distinct direction. Its upstream parent does not count fixed-degree boxes, and the Bary-Soroker–Koukoulopoulos–Kozma random-polynomial proposal works in a different asymptotic regime. Nevertheless the current brief cannot be built on as complete. In particular:

1. Prove the finite-projection, integral-spreading and fiber-count statements needed by §6 Case III.
2. Split composite items and recursively identify suppliers for the minimal-degree, field-count, resolvent and geometric-sieve arguments.
3. Supply use-derived APIs and three tests per definition, plus named proof dependencies, proposed files and planets.
4. Resolve wild-prime adapters, repeated-root conventions and the nonmonic proof separately.
5. Decide the 53–55 threshold cases and collate the published article.

These are explicit gaps in the result JSON. They are not disguised as already planned imports.

## Validation

Before the terminal failure, exact local Python regressions passed: inequality (6) for all admissible m≤40; δ inequalities for n=4,…,10000; all 432 affine transformations of F_3², giving minimum index 3; the 46 and 56 thresholds and the 28–45 repair; regular-group exponent arithmetic; and the splitting-type automorphism example.

JSON parsing, unique IDs, required fields, status values, stage ownership, source-issue verdicts and exactly-once missing-item routing were checked in the orchestration JavaScript runtime against the repository validator's rules. Terminal access was restored before submission. The actual local checks then passed:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: 5 files, 0 problems.
- `git diff --check`: clean.
- Exact arithmetic and the 432-element AGL(2,3) regression script: passed.

No Lean compilation was run, and no Lean file is a deliverable for this review. Nothing is claimed formalized.
