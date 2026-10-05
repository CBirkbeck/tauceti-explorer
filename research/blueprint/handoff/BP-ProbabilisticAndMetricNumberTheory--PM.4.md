# PM.4 continuation handoff

Completed by Codex, session `codex-hAQtaS`, for [issue #6358](https://github.com/CBirkbeck/tauceti-explorer/issues/6358), on branch `codex-hAQtaS-pm4`, 5 October 2026. The [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6358#issuecomment-6002598125) identifies this session. This submission completes one planning pass and is ready for independent review.

## Deliverables and inventory

- [Packet](../packets/ProbabilisticAndMetricNumberTheory--PM.4.json): `status: complete`, scope `ProbabilisticAndMetricNumberTheory:PM.4` alone.
- [Reader](../readmes/ProbabilisticAndMetricNumberTheory--PM.4.md): definitions, conventions, proof chains, full declaration catalogue, API, tests, acceptance criteria, owner contracts and source receipts.
- [Suggested Lean](../suggested/ProbabilisticAndMetricNumberTheory--PM.4.lean): native signatures, all 39 API items and all 32 test specifications, plus imported named-target signatures and homogeneous consumers.

There are **114 new declaration plans**: 5 definitions, 5 constructions, 97 lemmas, 1 theorem, 4 comparisons and 2 applications. They have **39 API items**, **32 unit-test specifications**, and **57 pinned baseline citations**. Every new definition or construction has uses, API and at least three discriminating tests. All implementation statuses remain `unchecked`.

The 46 reviewed PM.4 declarations in the parent packet are imported at their exact identifiers; their packet, document and suggested file were not edited. The continuation adds zero planets and retains the parent's six: Pointwise ergodic theorem, Gauss map, Gauss measure, Khinchin geometric mean theorem, Lévy denominator theorem and Gauss–Kuzmin theorem. A structure proposal records four possible sublayers without changing the atlas.

## Planning chains completed

The pointwise proof now includes finite extended-real limsup truncation, measurable least positive crossings, terminating greedy blue/red orbit blocks, the upper and lower integrated coloring estimates, real liminf finiteness, arbitrary-integrable measurable representative transport, signed convergence, clipping to obtain L1 convergence, a strictly invariant canonical limit and native conditional-expectation identification. No almost-invariant representative is silently supplied to Mathlib's strictly invariant sigma-algebra.

The Gauss chain now specifies irrational positive-word cylinders, ordered inverse branches and native matrices, native continued-fraction stream and continuant indexing, a native increasing cylinder filtration, its trace-generation statement, cellwise conditional expectation, the Rényi distortion estimate and tail zero-one law. The existing Tau Ceti downward conditional-expectation convergence and trivial-sigma-algebra theorem supply exactness-to-mixing; they are not replanned. Log-digit integrability, the power-log moments, absolutely integrable series interchange, the alternating-square evaluation and the orbit-product/denominator bridge supply Khinchin and Lévy.

For the inherited Gauss–Kuzmin digit-marginal target, an elementary C1 transfer proof replaces the unresolved Lipschitz/Hennion route. Density and normalized transfer have explicit convergence, linearity, positivity, continuity, duality and constant/weighted-mean APIs. The derivative series includes closed-interval endpoints. Absolute derivative coefficients yield a sufficient rate **9/10**, with density and digit-probability errors at most `(9/10)^n`. No sharp Sun rate, general spectral gap, Hennion theorem or new function-space carrier is claimed.

The selected homogeneous targets are concrete: Haar-almost-everywhere time-one averages on `SL(2, real)/SL(2, integer)`, bounded digits iff relatively compact positive diagonal semiorbits, and noncompact semiorbits for restricted-Lebesgue-almost every irrational unit-interval point. The row/column transpose, time scaling and two short-vector estimates are explicit. Haar-almost-everywhere convergence is not applied to individual horocycle points.

## Coverage and exact remaining work

**PM.4 is planned, not closed.** There are zero unassigned mathematical gaps and two owner requests. No additional local proof refinement is left in this pass. Stage closure requires the owners to expose the following contracts and assembly to replace the requested-stage edges with their exact declaration identifiers:

1. **`DiophantineApproximationAndTranscendence:DT.0`**: for irrational `0 < x < 1`, bounded native continued-fraction partial denominators iff there exists `c > 0` such that every natural `q ≥ 1` satisfies `q |q x − round(q x)| ≥ c`. The local native-stream comparison translates to Gauss digits. DT.0 owns the badly-approximable equivalence; its existing definition alone does not supply it. Bind the result in `bounded-digits-compact-orbit`.
2. **`GeometryOfNumbersAndQuadraticArithmetic:GN.4`**: the concrete integer lattice in the native real special linear group, quotient topology and Borel structure, normalized invariant Haar probability, continuous left diagonal action, time-one strong mixing from Howe–Moore, the max-norm Mahler criterion and the transpose homeomorphism between the source's left quotient and the consumer's right quotient. Continuous-flow ergodicity alone is insufficient for time-one ergodicity. Bind these results in `homogeneous-birkhoff`, `bounded-digits-compact-orbit` and `column-row-convention`.

The packet's requests give the full contracts and exact consumers. Any additional mathematics in these owners' directions is routed to their Part II, rather than copied into PM.4. A follow-up should read these two requests first; it should not reopen the inherited Gauss definitions or the completed coloring/transfer planning chains.

## Validation and reproducible evidence

`python3 scripts/check_blueprint.py research/blueprint/packets/ProbabilisticAndMetricNumberTheory--PM.4.json` reports **0 errors and 0 warnings**, including 1 planned stage, 0 closed stages, 0 gaps and 2 requests. All 57 baseline names and module paths match the shared index at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each cited statement was read at those pins. The packet records the L2-only Birkhoff near miss and the `MeasurableEmbedding` integral-composition near miss; general orbit integrals use the native map formula instead.

`lean-check research/blueprint/suggested/ProbabilisticAndMetricNumberTheory--PM.4.lean` **compiled successfully**, exit 0, with **143 proof-placeholder warnings, zero other warnings and zero errors**. The checked file's SHA-256 is `59ff6df2184d5d2e72bfe76e634e07b0e67300e739839a420f3001c6f2af2e35`. Compilation used the shared pinned Mathlib build after checking available memory. No private Lake project, build, update, cache download or language server was started. The pinned Tau Ceti supplier statements were read in source; their compiled object files were unavailable, so the new prototype uses the native Mathlib types without rebuilding or importing those unavailable modules. Compilation checks signatures and examples with admitted proofs, not their mathematical truth.

The source-register validators `scripts/source_issues.py:check_issues` and `scripts/check_errata.py:versions_checked` report zero errors for eight findings and six version receipts. All five acquired PDF hashes agree with the packet. The normal blueprint checker includes source-finding validation; the version validator was also invoked directly because this packet is a blueprint rather than an `errata-v1` file.

The final independent planning audit passed **38 checks**, including **22 exact-arithmetic checks**. Its durable mathematical certificates are:

- For the `a=2` second coefficient, clearing the positive denominator gives `(2+x)^3(3+x) − 24(1+x) = 20x + 30x² + 9x³ + x⁴`. Together with the first-term bound `1/36`, this gives `c₂ ≤ 5/72`.
- For `a ≥ 3`, set `N_a = a(a−1)² + (2+x)(1+x)²` and `D_a = (1+x)(a+x)^3(a+1+x)^2`. Exact expansion gives `14D₃ − 432N₃ = 12960x + 12762x² + 6596x³ + 1848x⁴ + 252x⁵ + 14x⁶`, certifying `c₃ ≤ 7/216`.
- Similarly, `38D₄ − 1600N₄ = 122720x + 95592x² + 37806x³ + 8170x⁴ + 874x⁵ + 38x⁶`, certifying `c₄ ≤ 19/800`.
- The tail estimate telescopes: `Σ_(a≥5) 1/[a(a−1)] = 1/4`. The total bound is exactly `1/2 + 5/72 + 7/216 + 19/800 + 1/4 = 18913/21600`; its distance below `9/10` is `527/21600`.
- The signed-coefficient countercheck is `h₂′(1) = −1/72`. The coordinate-test finite identity is `Σ_(a=1)^N 1/[a²(a+1)] = Σ_(a=1)^N 1/a² − 1 + 1/(N+1)`.
- Exact word checks give `W_[1,2] = [[1,2],[1,3]]`, `W_[2,1] = [[1,1],[2,3]]`, their determinant signs, and inverse-word endpoint pairs `(2/3,3/4)` and `(1/3,2/5)`. The empty word is the identity; the one-digit cylinder has endpoints `1/2` and `1`.
- The greedy empty/unit/boundary/zero-crossing cases and the strict constant/two-cycle first-hit cases agree with the reader. Even-length averages of the `0,4` cycle are 2; the successor observable has average `(n−1)/2`.

The other audit checks cover fresh IDs, exact parent imports, the single-stage scope, absence of implementation claims, API proof-node references, all API and test names in both reader and prototype, every new node in the reader, absence of private paths or proof placeholders in packet/reader, the six inherited planets, and acyclic local prerequisite chains. These finite computations and structural checks do not replace independent review of the proof outlines.

Submission-file validation accepted all four deliverables with **0 problems**. Reproduction command:

```sh
python3 research/blueprint/intake.py check-files \
  research/blueprint/packets/ProbabilisticAndMetricNumberTheory--PM.4.json \
  research/blueprint/readmes/ProbabilisticAndMetricNumberTheory--PM.4.md \
  research/blueprint/suggested/ProbabilisticAndMetricNumberTheory--PM.4.lean \
  research/blueprint/handoff/BP-ProbabilisticAndMetricNumberTheory--PM.4.md
```

## Sources and review starting points

The packet and reader preserve exact public URLs, dates, SHA-256 receipts and reading scope:

- **Sarig, 2023 ergodic notes:** physical pp.45–49, printed pp.37–41, the full finite-coloring and conditional-expectation proof.
- **Sarig, 2020 transfer-operator course:** physical pp.1–6 and 11–13 for the operator; pp.31–35 for exactness; pp.35–41 for the Hennion appendix read while evaluating the original route. The opening lemma on physical p.42 was incidentally read. No unused spectral or analyticity result is made a target.
- **Glasscock–Merriman–Robertson–Smyth, UNCG 2020 notes:** physical pp.45–49, printed pp.42–46, for logarithmic statistics. The other reviewed parent locators remain imported; there is no claim to have reread the entire book.
- **Peng Sun, arXiv:1705.02921v2, 9 November 2017:** all eight pages. The version-of-record metadata and abstract were checked; the full published text was not acquired. The coefficient observation applies to the acquired arXiv version, not an unread publisher proof.
- **Gorodnik, TIFR 2010 Lecture 1:** scanned physical pp.3–8 for bounded geodesics and the badly-approximable/Mahler comparison. Lecture 3 is not a supplier for this packet.

New source observations **EPM4-1 through EPM4-8** have no independent verdict. EPM4-1 identifies the unsupported signed maximum-norm estimate in Sun and supplies a weaker absolute-coefficient route. EPM4-2–6 and EPM4-8 record five substantive formula/hypothesis observations and a space-symbol misprint in the unused Hennion appendix; EPM4-7 records a whole-sequence/subsequence quantifier error in the incidentally read next appendix. Bounded author, arXiv, publisher and erratum searches found no correction. The exact quoted formulas, reasons and version restrictions are in the packet. These are observations to verify, not confirmed published errata. Parent finding IDs and verdicts are retained; in particular the rejected E23 and E25 are not resurrected.

The bounded upstream search also recorded the public Birkhoff discussion, open Mathlib maximal-ergodic and ergodicity-characterization PRs, and Lua Viana Reis's external scalar Birkhoff signatures at an exact commit. These are API/provenance notes rather than pinned suppliers. No external proof was copied, no whole external development is claimed read, and no uncoordinated port is proposed.

An independent reviewer should start with native strict invariance and arbitrary-integrable replacement, native continued-fraction indices, filtration trace generation and conditional-expectation hypotheses, the endpoint derivative argument and positive-denominator coefficient certificates, and the distinction between Haar-almost-everywhere and horocycle assertions. The two exact owner contracts are the only assembly remainder. Scratch sources and logs are removed after opening this job's pull request; all continuation evidence is preserved here and in the packet.
