# Independent review of PM.4

Accepted on 2026-10-10 by Codex, session `codex-ggjLTD`, for job
`REV-ProbabilisticAndMetricNumberTheory--PM.4` (issue #6316). The planning
session was `codex-hAQtaS`; this reviewer did not write that submission.

The packet is a complete planning pass for PM.4. Its coverage remains
**planned**, with two precise supplier requests, rather than closed. All
statements remain unchecked implementation plans. The acceptance concerns
mathematical statements, proof dependencies and interfaces; elaboration of
proof placeholders does not verify their proofs.

| Item | Result |
| --- | --- |
| Local nodes | 115: 76 verified, 38 corrected, 1 added, 0 unverifiable |
| Original nodes | All 114 checked individually |
| Inherited declarations | All 46 IDs resolve to the reviewed parent packet |
| Pinned baseline | All 57 declarations confirmed; 2 descriptions corrected; none removed |
| Definitions and constructions | 10, with 39 API items and 32 tests; each has at least 3 tests |
| New source observations | All 8 independently confirmed in their recorded versions |
| Sources | 5 public PDFs acquired independently; all hashes match their receipts |
| New planets | None; the parent's 6 PM.4 planets are retained |
| Open supplier requests | DT.0 and GN.4, both retained with explicit statements and consumers |

Every local node has its own verdict and mathematical reason in `review.checked`.
Every baseline entry has an independent confirmation, and every source
observation has the required independent verdict.

## Corrections made

1. Added `cylinder-measure-distortion`, marked with this review job's `addedBy`.
   The tail conditional-expectation argument needs the particular distortion
   constant 4. The inherited `gauss-renyi` statement supplies an unspecified
   constant. The new lemma derives the constant from the native word matrix:
   its absolute Jacobian lies between `1/(q+r)²` and `1/q²`, with `0<r≤q`.
   The native change-of-variables theorem and rational conullness give the two
   measure inequalities. The empty word is included separately. Updated
   `cylinder-ce-lower-bound` to use this lemma directly, and registered the
   refinement of the inherited Rényi target. The stated `m(B)/8` now has the
   exact input its proof uses.
2. Strengthened `signed_limit` in Suggested to include equality of integrals,
   as its packet statement requires. Strengthened `density_pushforward` to
   cover a continuous nonnegative initial probability density, and retained
   the constant-one specialization as `density_pushforward_one`. Added the
   appropriate general duality source locator to the packet node.
3. Corrected the baseline description of `MeasureTheory.setIntegral_condExp`
   to retain sigma-finiteness of the trimmed measure. Every use here has a
   finite measure, so the hypothesis is satisfied. Corrected `QuotientGroup.mk`
   to describe left cosets `gH`, with relation `g⁻¹g′∈H`; this agrees with the
   planned left action on `G/Γ`.
4. Narrowed 36 Appendix A.2 locators from physical pp.31–35 to the actual
   inverse-cylinder/exactness pages, physical pp.32–33, printed pp.30–31.
   These locator changes account for 36 of the corrected-node verdicts;
   `signed-limit` and `density-pushforward` account for the other two.
5. Imported the individual pinned Tau Ceti conditional-expectation and
   reverse-martingale modules in Suggested. Removed the obsolete statement
   that their cached objects are unavailable. Recorded independent source,
   baseline, current-library and validation evidence separately from the
   original planner's checks.

## Mathematical and source checks

The finite-coloring chain keeps positive averaging lengths, the no-hit zero
sentinel, terminal block losses, extended-real truncation and the conull
measurable-representative argument explicit. The invariant-set integral
identity identifies the real limit with native conditional expectation.
The arbitrary-integrable L¹ limit is needed: Tau Ceti's existing
`tendsto_integral_abs_birkhoffAverage_sub_condExp` assumes `MemLp f 2 μ`.

The cylinder argument keeps irrational endpoints, native continued-fraction
indices and matrix multiplication order consistent. Its filtration generates
Borel traces on the irrational domain; it does not claim to distinguish all
rational points. Upward CE convergence and the positive tail lower bound give
zero-one; the existing reverse CE API and set-integral identity supply mixing.

The quantitative argument uses absolute derivatives in the cancellation
estimate. Independent integer-polynomial and rational calculations confirm
`c₃≤7/216`, `c₄≤19/800`, the second-branch certificate, and
`1/2+5/72+7/216+19/800+1/4=18913/21600<9/10`, with gap `527/21600`.
The derivative series uses open-interval differentiation followed by endpoint
extension; it does not apply the open-set theorem directly at the endpoints.
Conserved weighted mean then gives the uniform density and digit-marginal
error bounds. Order-sensitive word matrices and cylinder endpoints were also
checked using exact rational arithmetic.

The public texts checked were:

- [Sarig, *Lecture Notes on Ergodic Theory*](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf),
  Theorems 2.2–2.3, physical pp.45–49, printed pp.37–41.
- [Sarig, *Introduction to the transfer operator method*](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf),
  Proposition 1.1, §2.3, Appendix A.2, and the individual Appendix A.3/A.4
  finding locators recorded in the packet.
- [Glasscock–Merriman–Robertson–Smyth, UNCG notes](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf),
  Theorems 20–21 and Problem 2.4, physical pp.45–49, printed pp.42–46.
- [Sun, arXiv:1705.02921v2](https://arxiv.org/pdf/1705.02921v2),
  Theorem 2, physical pp.3–6, including the signed-coefficient step on p.4.
- [Gorodnik, TIFR Lecture 1](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf),
  physical pp.3–8, including the row-lattice convention and two short-vector
  directions on pp.7–8.

EPM4-1 is a gap in the displayed signed maximum-norm estimate, not a
counterexample to exponential convergence. EPM4-2 through EPM4-6 and EPM4-8
are confirmed at their exact Appendix A.3 displays. EPM4-7's whole-sequence
functional-divergence assertion is disproved by scaled fine nets of the unit
sphere in complex dimension two; uniform boundedness gives the necessary
subsequence conclusion. These are observations in the recorded author PDFs
and arXiv version, not publisher-confirmed errata. The arXiv record still lists
v2 as latest. Publisher full text was not acquired, so no verdict is extended
to it. The original bounded correction-search receipts remain dated as read.

## Ownership, validation and handoff

Read the current TauCetiRoadmap at `e255659f8eb50cd472809d9d565c8f755acffd84`
and checked the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nearby Exchangeability and
OneParameterSemigroups documents and the newer roadmap signatures were
checked. Existing generic martingale, mean-L², continued-fraction, matrix and
quotient infrastructure is consumed. No duplicate pointwise scalar Birkhoff
or Gauss-dynamics target was found there.

The DT.0 request supplies the bounded-native-digit/badly-approximable
equivalence. The GN.4 request supplies the concrete modular quotient,
normalized Haar probability, diagonal action, time-one mixing, max-norm
Mahler criterion and transpose homeomorphism. The supplier statements were
read; their present general statements do not silently supply these exact
contracts. The requests correctly name that remaining work. No question
blocks acceptance. Assembly must bind the eventual supplier declaration IDs
and carry the new constant-four lemma and strengthened signatures into its
reader/package. The reader was outside this issue's allowed deliverables.

Validation at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ProbabilisticAndMetricNumberTheory--PM.4.json`:
  0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/ProbabilisticAndMetricNumberTheory--PM.4.lean`:
  exit 0; 145 proof-placeholder warnings, 0 errors, 0 other warnings.
- Source-issue and version-receipt checks: 0 errors; five independent PDF
  hashes match. All graph, inherited-ID, API/test and review-verdict checks pass.
- Submission file check and `git diff --check`: pass.
