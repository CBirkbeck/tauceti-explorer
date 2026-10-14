# REV-ClassicalArithmeticCompletion--CA.3 — independent review

**Issue:** #9676 · **Reviewer:** Claude (session claude-iS7Ymj) · **Date:** 2026-10-14
**Reviewed:** `research/blueprint/packets/ClassicalArithmeticCompletion--CA.3.json`, its suggested file
and its reader document, written by session claude-OsVbBo for BP-ClassicalArithmeticCompletion--CA.3
(#9667, PR #9695). This session did none of that work.
**Level:** target level (PROTOCOL §2). **Pins:** Mathlib 082e2d3, Tau Ceti f790474.

## Verdict

**Accepted.** The packet is a complete continuation pass for CA.3. All 25 nodes were checked: 11 are
verified as written and 14 were corrected in place; no node was added or removed. Every baseline
citation was read at its module at the pinned commit. Stage CA.3 stays `planned`, not `closed`, because
one gap remains: Mignotte's 1988 inequality, whose source still cannot be read.

The main correction concerns duplication. The packet planned Gauss–Jordan elimination and a kernel basis
for CN.2's request. The pinned Tau Ceti library already contains both, in
`TauCeti/LinearAlgebra/Matrix/Echelon/RowReduce.lean` and `KernelBasis.lean`, written for Layer 6 of
the Tau Ceti roadmap RepresentationTheory/CharacterTheory. The two nodes now cite those declarations and
plan only what Tau Ceti lacks.

## Counts

| | Before | After |
|---|---|---|
| Nodes | 25 | 25 (11 verified, 14 corrected, 0 added) |
| API items | 67 | 70 |
| Unit tests | 37 | 37 |
| Baseline declarations | 83 | 104 (77 unchanged, 1 replaced, 5 removed as uncited, 26 added) |
| Gaps | 1 | 1 |
| Source issues | 3 | 4 (E900–E902 confirmed; E903 added) |
| `check_blueprint.py` | 0 errors, 0 warnings | 0 errors, 0 warnings |
| `lean-check` of the suggested file | exit 0, 129 admitted-proof warnings | exit 0, 135 admitted-proof warnings, no other messages |

## What was checked

- **Sources.** I re-fetched all nine sources into scratch, and every sha256 matches the packet. I read
  each node's locator and checked the statement and `match` against it. Fujiwara's note is a scan; I
  read it from page images. In the Cahen–Chabert PDF the printed page is the PDF page number plus 309;
  three locators were off by one page under that mapping (below). The Chabert survey, Leriche, Smith,
  Bary-Soroker–Koukoulopoulos–Kozma, Bhargava–Shankar–Wang, Hefferon and Kedlaya locators are correct.
  The packet contains no verbatim excerpts.
- **Baseline.** I first had a retrieval pass list the 83 declarations, then read every header myself
  in the pinned Mathlib tree, with the enclosing namespace and variables. The retrieval pass wrongly
  reported `FractionalIdeal.finprod_heightOneSpectrum_factorization'` missing; it is at line 559 of
  `Mathlib/RingTheory/DedekindDomain/Factorization.lean`. I also scanned for deprecation attributes.
  `Ideal.absNorm_eq_pow_inertiaDeg` is deprecated at the pin; the other 82 citations are current and
  give what their nodes use, with no stronger hypotheses. The Tau Ceti files I read at f790474 are
  identical to those in the lean-check build.
- **Closure.** I checked each node's proof sketch against its prerequisites. Cross-roadmap and
  cross-part ids all exist (`CA.5/index-of-the-order-z-sqrt-d` and the main packet's CA.3 nodes). The
  22 continuations are exactly the main packet's `reviewFrontier` list, and adding their extra
  prerequisites creates no cycle across the CA packets. The main packet's four open coverage items are
  all answered: Int(𝓞_K) and Pólya groups, the Mignotte route, Smith's Lemma 2.10, and the review
  frontier.
- **Library audit and duplication.** I searched the pinned Tau Ceti library and the current
  TauCetiRoadmap for every new notion. Pólya fields and groups, factorial ideals, v-orderings, Newton
  polygons, Fujiwara, Mignotte and the primitive gcd are in neither; Gauss–Jordan elimination and the
  kernel basis are in Tau Ceti (see above). The Gregory–Newton formula is not in Tau Ceti, but its
  binomial basis of K[X] is, and is now cited as a compatibility.
- **API, tests and planets.** All definitions have at least three discriminating tests; I recomputed
  every numerical test. The five planets are named from the sources. The three-sub-layer proposal keeps
  each sub-layer at six planets or fewer.
- **Suggested file.** Every API item, test and theorem of the packet is present under the packet's
  name. I read every statement for truth, as typed; two were wrong (below).
- **Requests.** I checked the CN.2 and LogarithmicPotentialTheoryAndAlgebraicIntegers R3 requests
  against those packets. The Newton-polygon and R3 answers are exact. The kernel-basis answer now points
  to Tau Ceti.

## Corrections made

1. **`gauss-jordan-reduced-echelon-form` (rewritten).** Tau Ceti already has the sweep
   (`TauCeti.rowReduce`) and its theory: the output is in reduced row echelon form
   (`isReducedRowEchelon_rowReduceMatrix`), its pivots are the recorded ones
   (`isPivotedBy_rowReduceMatrix`), the row space is preserved (`span_rowReduce`), the pivot count is
   the rank (`length_rowReduce_ofFn`) and the kernel is unchanged
   (`mulVec_eq_zero_iff_rowReduceMatrix`). The node now cites these. It keeps only two new targets:
   - the change-of-basis certificate: P with explicit inverse P′ and P A = R, read off the reduced
     forms of [A | 1] and [P | 1];
   - the uniqueness of the reduced form (Hefferon, Theorem One.III.2.6).

   I dropped the unproved claim that the forward phase yields Mathlib's `Echelon.Decomposition`. Tests
   now include the certificate of [[1, 2, 1], [2, 4, 0]]: P = [[0, ½], [1, −½]] and P′ = [[1, 1], [2, 0]].
2. **`kernel-basis-of-a-reduced-echelon-matrix` (rewritten).** Tau Ceti already has the kernel vectors
   and the basis (`TauCeti.kernelVector`, `freeColumnBasis`, `kernelBasis`), with:
   - soundness, spanning and independence;
   - the count n − rank A.

   The node cites these and plans only the transport to a linear map φ in bases b, b′: x ∈ ker φ iff the
   matrix of φ kills the coordinates of x, and the transported vectors form a basis of ker φ (via
   `LinearMap.toMatrix_mulVec_repr`, `Basis.equivFun`, `Basis.map`). This is the "comparison with the
   native basis-to-matrix map" that CN.2 asked for. Added a Frobenius example on F₂[X]/(X²).
3. **`polya-group-of-a-galois-field`.** Replaced the deprecated `Ideal.absNorm_eq_pow_inertiaDeg`,
   which is stated with the deprecated `inertiaDeg′`, by `Ideal.natAbs_pow_inertiaDeg`. That lemma uses
   the same `inertiaDeg` as `Ideal.inertiaDeg_eq_of_isGaloisGroup`.
4. **`characteristic-ideals-of-a-dedekind-domain`.** The last step read the exponents of I_n(D) off the
   localizations and cited `FractionalIdeal.count`. But `count` is defined through a factorization, not
   through localizations. I added the bridge (`count_mul`, `count_self`, `count_maximal_coprime`) to
   the proof sketch and the prerequisites.
5. **`irreducible-factor-evaluation-bound`.** The source's Lemma 3.4 covers every irreducible
   polynomial over ℤ, prime constants included, but the node required degree m ≥ 1. I widened it to
   m ≥ 0, with the constant case (p ≤ H ≤ (14√n H)⁴) as a proof step and an example. The Lean
   statement no longer has the degree hypothesis.
6. **Locators.** All three are Cahen–Chabert pages:
   - Lemma 28 and Proposition 29 are on p. 329, not pp. 328–329;
   - Proposition 20 begins on p. 322 and its proof is on p. 323;
   - the generation of the Pólya group by the Π_q is on p. 333, not p. 332.

   The source's `readSections` were corrected to match.
7. **API.**
   - Added `FactorialIdeal.ne_bot` and `PolyaIdeal.ne_bot`. The Pólya group takes `ClassGroup.mk0`
     classes of these ideals, which needs them nonzero.
   - Restated `card_polyaGroup_dvd_prod_ramificationIdxIn`: its statement was a generation property,
     but its name promises the divisibility |Po(K)| ∣ ∏ e_p (Leriche, Corollary 3.1).
8. **`newton-forward-difference-expansion`.** Added `TauCeti.binomialPolynomialBasis` as a prerequisite
   and a compatibility check: the Gregory–Newton coefficients are coordinates in that basis.
9. **Suggested file.**
   - `PrimitiveGcd.dvd_primitiveGcd` was false for an empty family or a family containing 0: the
     primitive gcd is then 1, while X satisfies the hypothesis. It now assumes a nonempty family
     without 0.
   - `exists_squarefree_combination` bounded Σ b_j by 2d; it is now 2d − 1, as in the node.
   - The file imports the two Tau Ceti modules it builds on and states the new targets above against
     them.
10. **Reader.** I re-rendered every node section from the corrected packet with a renderer that
    reproduces all 25 sections of the original reader exactly. The introduction, boundaries, sources,
    dependencies and corrections were updated to match.

## Baseline citations

- **Replaced:** `mathlib:Ideal.absNorm_eq_pow_inertiaDeg` (deprecated) → `mathlib:Ideal.natAbs_pow_inertiaDeg`.
- **Removed, no longer cited by any node:** `mathlib:Echelon.Decomposition`,
  `mathlib:Echelon.Decomposition.rank_eq`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.toLin'`,
  `mathlib:Matrix.toLin_toMatrix`.
- **Added (Tau Ceti, 20):** from RowReduce.lean, `TauCeti.rowReduce`, `rowReduceMatrix`,
  `rowReducePivot`, `isReducedRowEchelon_rowReduceMatrix`, `isPivotedBy_rowReduceMatrix`,
  `span_rowReduce`, `length_rowReduce_ofFn`; from KernelBasis.lean, `mulVec_eq_zero_iff_rowReduceMatrix`,
  `IsFreeColumn`, `kernelVector`, `freeColumnBasis`, `coe_freeColumnBasis_apply`, `kernelBasis`,
  `mulVec_eq_zero_of_mem_kernelBasis`, `span_kernelBasis`, `linearIndepOn_kernelBasis`,
  `nodup_kernelBasis`, `length_kernelBasis`, `finrank_ker_mulVecLin`; and `binomialPolynomialBasis`.
- **Added (Mathlib, 6, besides the replacement):** `FractionalIdeal.count_mul`, `count_self`,
  `count_maximal_coprime`, `LinearMap.toMatrix_mulVec_repr`, `Module.Basis.equivFun`, `Module.Basis.map`.

## Mistakes in the sources

- **E900** (Cahen–Chabert, Example 34, p. 333) — confirmed. ℚ(√−23) has class number 3, from the
  reduced forms (1, 1, 6) and (2, ±1, 3); Leriche, p. 236, gives 3.
- **E901** (Cahen–Chabert, Proposition 33, real case, p. 333) — confirmed. ℚ(√15) fits the printed
  description but is not a Pólya field. Three primes ramify, the fundamental unit 4 + √15 has norm 1,
  x² − 15y² = ±2 has no solution mod 5, and Hilbert's count (Leriche, Proposition 2.4) gives a Pólya
  group of order 2.
- **E902** (Fujiwara, footnote to (1), p. 167, and (3), p. 168) — confirmed. For f = a₀Xⁿ the strict
  inequality fails at the root 0.
- **E903** (Cahen–Chabert, the definition of S⁻¹D before Lemma 28, p. 329) — new, misprint. The
  numerators are said to lie in a ring A that the article never defines; D is meant. It affects nothing.
  Crossref lists no correction to the article.

## Gap

Mignotte, J. Number Theory 30 (1988), Theorem 1′ is still unread. On 2026-10-14 ScienceDirect answered
HTTP 403, and Unpaywall and Semantic Scholar list no copy other than the publisher's. The gap record is
accurate and its next action, reading the paper in a browser, still stands.

## Questions for the orchestrator

1. **CN.2.** ComputationalNumberTheory's CN.2 (`finite-algebra-frobenius-nilradical`) should cite
   `tauceti:TauCeti.kernelBasis` and `tauceti:TauCeti.freeColumnBasis` directly. Only the transport to
   LinearMap.toMatrix comes from `CA.3/kernel-basis-of-a-reduced-echelon-matrix`.
2. **Assembly of CA.3.** Join this packet's `continuations` (their additional prerequisites) into the
   main packet's CA.3 nodes, as the coverage record says.
3. **Mignotte.** The maintainer may be able to read Mignotte 1988 in a browser, which would close the
   one gap of CA.3.
