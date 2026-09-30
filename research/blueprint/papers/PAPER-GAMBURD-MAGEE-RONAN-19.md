# PAPER-GAMBURD-MAGEE-RONAN-19: integer points on Markoff–Hurwitz varieties

Alex Gamburd, Michael Magee and Ryan Ronan, *An asymptotic formula for integer points on Markoff-Hurwitz varieties*, [Annals of Mathematics 190 (2019), 751–809](https://doi.org/10.4007/annals.2019.190.3.2), [arXiv v3](https://arxiv.org/abs/1603.06267v3).

The [extraction](PAPER-GAMBURD-MAGEE-RONAN-19.result.json) has **50 items: 1 library, 1 planned, 48 missing; four routes; 20 prerequisites; 18 source issues**. Every missing item is routed once. This completes the extraction and confirmed-finding fixes, not the future mathematical blueprints or formalizations. Four named proof/supplier obligations remain explicit.

Original extraction: Claude Code `cc-fb70e5`, 22 September 2026, #1139. Independent preprint review: `cc-442dc5`, 23 September. Published collation and fixes: Codex `codex-J6LwjP`, 30 September, #4984. The [fix report](../redteam/RT-PAPER-GAMBURD-MAGEE-RONAN-19.fixes.md) gives all seven finding dispositions and reproducible calculations. The historical independent verdict does not certify this new work.

## Sources actually read

The original extraction and review read all 57 pages of arXiv v3; their inability to obtain Annals is a dated access record. For this fix, the [public publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf) was read in full, pp.751–809 including references. Its SHA-256 is `c5e7ebb5322cdfd455735f13c2b420dba318089b382a3f78f40628efc838215a`. Selected v3 passages were freshly compared; its SHA-256 remains `965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a`. The JSON records the exact scopes and dates. Formula images inspected include Annals pp.777,784,785,801,802,804 and v3 p.46.

Annals adds Examples 16–17 and shifts v3 numbered results 16–46 to 18–48. Every original item has both versions' locators. Annals p.802 delegates proofs of (5.2)–(5.10) to the preprint; defects in those omitted proofs are scoped to that supplement. No separate erratum was found in bounded publisher/title searches; this is not proof of novelty.

## Mathematical result and proof structure

For n≥3, a≥1 and integer k, let V satisfy x₁²+⋯+x_n²=a x₁⋯x_n+k, and remove the exceptional families E. If V(ℤ)−E is infinite, Theorem 3 gives a positive constant c with count c(log R)^β+o((log R)^β). The exponent β depends only on n. The linear-semigroup count has a uniform asymptotic h(y)e^{βt}, and β is characterized by a conformal probability measure.

1. Vieta moves, compact exceptional sets and descent reduce the count to finitely many polynomial-semigroup orbits. Normalization z=a^{1/(n−2)}x produces the ordered moves. Freeness, admissible sequences and multiplicities are essential inputs.
2. Acceleration and doubly exponential growth control a Zagier-type fit to a linear semigroup. The positivity argument and summation estimate need the repairs E1 and E10. The published finite-word comparison uses 2ε and accelerated words, correcting E7/E11.
3. Transfer operators on C¹ of a simplex provide Ruelle–Perron–Frobenius data, a non-lattice bound, an analytic leading eigenvalue, and the renewal transform. The contraction proof uses core/cusp geometry and explicit Jacobian bounds. The scalar Tauberian step is imported; the uniform remainder needs its own proof.

Published Example 16 adds the Cayley-cubic polynomial orbit (2,t,t) and P_j=2T_j(t/2)∈ℤ[t]. Vieta moves preserve the Chebyshev family. Example 17 states degree growth cD^{β(4)} for the orbit of (1,1,t,t) at n=4,a=2,k=2, but explicitly defers a detailed proof. These are new items 49–50; the latter remains a stated endpoint with an open proof source.

## Coverage and ownership

The pinned Mathlib real and complex p-series tests supply item 31. Its `mellin`, `spectralRadius` and general operator vocabulary are usable interfaces, but do not supply the complex Laplace adapters, Kato theorem or C¹(K) Banach carrier. `ContDiffMapSupportedIn` requires a globally smooth map vanishing outside K, so it cannot model the needed constant-one function. Tau Ceti's real-measure Laplace transform is existing work with a different domain and codomain.

PM.4 plans only item 30: the base Gauss map and invariant probability density 1/((1+x)log 2). Items 44–45 separately route the complex-parameter conjugacy and the precise C¹ spectral theorem. Multiplication by (x+1)^s conjugates the GMR operator to the Gauss operator for Re s>1. Its unnormalized eigenfunction 1/(1+x) differs from the probability density; the GMR eigenfunction is x+1 before rescaling.

| Route | Missing items | Owner and boundary |
| --- | ---: | --- |
| 1 | 5 | ClassicalArithmeticCompletion CA.4: general equation, moves, exceptional families, positive reduction and descent. Existing coefficient-three Markoff nodes supply n=a=3,k=0 specializations only. |
| 2 | 20 | `DESIGN-ArithmeticDynamicsPartII`: polynomial moves, orbit counting, linearization and published polynomial examples; imports the uniform linear-semigroup theorem. |
| 3 | 22 | `DESIGN-ProbabilisticAndMetricNumberTheoryPartII`: transfer/spectral/contraction theory, C¹(K), transform adapters and the uniform renewal application. |
| 4 | 1 | `DESIGN-ArithmeticDirichletSeriesPartII`: coalesced scalar nondecreasing Laplace theorem, already owned by PAPER-WOOD-19/286 and its route 10. |

Accepted proposal ids `ArithmeticDynamicsPartIIMarkoff`, `ProbabilisticAndMetricNumberTheoryPartIITransferOperators` and `ArithmeticDirichletSeriesPartIIHigherPoleTauberian` remain coalescing aliases. They are not existing stage ids. All three canonical design jobs are pending. Supplier order is scalar Tauberian theory → transfer renewal theory → Markoff dynamics, with CA.4 also supplying the last design.

The CA packet is already partial after the Ghosh–Sarnak fix, PR #5217. Its current Markoff nodes remain valid. It still needs this paper's general items 1–5: the JSON contains an exact continuation request. The packet is outside this job's deliverables. Refresh #1025's added-source list jointly with the existing Chen/Ghosh–Sarnak requests.

## Proof and prerequisite boundaries

Item 48 is missing at the accepted Wood supplier, with an explicit prerequisite/gap until a stage exists. Item 41 proves the paper-specific nonnegativity, monotonicity, local finiteness, convergence and boundary continuation hypotheses. With νβ(1)=νβ(hβ)=1, the simple pole has coefficient hβ(w)/(β|λ′β|). The branch ratio ≥3/2 gives λ′β≤−log(3/2)λβ<0. Strict monotonicity alone would not imply a nonzero derivative.

Pointwise scalar asymptotics plus continuity of the residue do not establish uniformity in w. A uniform analytic/contour argument in a Banach norm, or an appropriate uniform Tauberian adapter, remains an explicit transfer-design obligation. The generic scalar theorem is not planned a second time there.

The chosen RPF route adapts Liverani's cone method to the summable countable branch family. PP90 Theorem 2.2 is a finite-type comparison, ITM50 supplies the two-norm method, and the countable-branch adaptation remains open. Baladi is background; Lalley 1988 is the historical precursor, alongside the existing Lalley 1989 entry.

The original Pollicott Rauzy notes URL could not be obtained in this fix. Annals lists those notes as [Pol], while [Pol14] is *Apollonian circle packings*; its body cites [Pol14] for the Jacobian/RPF arguments. This discrepancy is recorded, not silently resolved by equating different texts. A later Aimino–Pollicott survey is not claimed as the original. The prerequisite register distinguishes source access from proof coverage.

## Source findings after publication collation

All 17 old issue records, including their independent preprint verdicts, are preserved verbatim in their `versionHistory`. Active published scopes await independent review. The entries do not accuse Annals of errors it has corrected.

| Issues | Current scope |
| --- | --- |
| E7, E11 | Fully corrected in Annals Lemmas 29–30 and (3.28), pp.784–786; retained as historical preprint findings. |
| E2 | Published prefactor/index corrected; comparison still divides by zero at A₀=0, p.777. |
| E4 | Two ranges corrected; Lemma 22's proof still lists n−2 generators instead of n−1, p.773. |
| E5 | Inductive exponent corrected; the A₁=0 summand remains omitted, p.780. |
| E8 | Expansion-ratio text corrected; factor 2 must still be 2^s, p.799. |
| E17 | (5.1) range corrected; (5.5)/(5.9) still need squared denominators, pp.801–802. Separate proof slips occur only in v3 p.49. |
| E9 | Wrong column-sum comparison survives p.804. Its (5.9)/(5.10) proof slips occur only in v3 p.53. |
| E1,E3,E6,E10,E12–E16 | Published defects persist at the dual locators in the JSON: positivity/summation gaps, range hypotheses, constants and proof normalizations. |
| E18 | New unreviewed Jacobian misprint in both v3 p.46 and Annals p.804: row 3 column i, for i>3, needs w₃ instead of w₂. The subsequent column sum is correct. |

The intended endpoint theorems are preserved by the proposed repairs. This is not a claim that every blueprint proof has been completed.

## Validation

The paper checker, §18 issue/version checks, intake file checks, exact-once routing, preserved historical records, canonical dependency acyclicity and whitespace checks pass. Fresh calculations cover 160 conjugacy cases, 20 exact Gauss telescoping identities, 300 exact Jacobian derivatives/column sums, four resolvent identities, a rigorous refutation of the printed spectral upper bound, and 121 exact Chebyshev polynomial/Vieta identities. The code is in the fix report. Historical growth/contraction numerical runs are attributed to their original workers, not claimed rerun here.

No Lean file is a deliverable, and none was compiled. No new Lake project or library build was created.
