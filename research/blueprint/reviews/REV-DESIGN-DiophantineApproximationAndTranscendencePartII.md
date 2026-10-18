# Independent review: arithmetic algebraization

**Job:** `REV-DESIGN-DiophantineApproximationAndTranscendencePartII`

**Reviewer:** Codex, session `codex-TzHCnI`

**Date:** 2026-10-18

**Verdict:** accepted, with the explicitly recorded G1 follow-up unchanged in scope.

This session did none of the design work. I reviewed the roadmap definition, packet, reader and suggested Lean file. All 35 nodes are verified individually in `packet.review.checked`. The review confirms two source errors; it finds no additional false target or missing target-level prerequisite requiring a new node. Acceptance is relative to the cited supplier interfaces and does not discharge those suppliers' own recorded gaps or any Lean proof.

## Inventory and changes

| Item | Reviewed | Outcome |
| --- | ---: | --- |
| Nodes | 35 | 35 verified; 0 corrected, added or unverifiable |
| Definition/construction nodes | 5 | All 33 API entries and 20 tests checked |
| Baseline declarations | 20 | All confirmed at the recorded pins; none removed or replaced |
| Planets | 23 | At most five per layer; definitions and named central results |
| Routed source items | 20 | Every item has its target or exact supplier owner |
| Source findings | 2 | E1 and E2 independently confirmed |
| Requests | 0 | Exact existing supplier statements suffice |
| Open gaps | 1 | G1 remains explicit; AA.5 remains planned |

The edits add the independent verdict, 35 reasoned node checks, two source-finding verdicts and an independently repeated upstream audit to the packet. They update the reader's pending-review language and make the G1 follow-up refer to a maintainer scope decision now that the counterexample is confirmed. The roadmap definition and suggested Lean file need no mathematical changes. No source excerpts were present, introduced or retained. No generic supplier theory is replanned.

The packet's `complete` status means a finished target-level pass. AA.0–AA.4 are closed relative to their declared inputs. AA.5 contains the proved centred specialization and a verified obstruction, with its remaining general-compact question recorded as G1. This is consistent with PROTOCOL §0 and the review issue's explicit permission to accept a sound pass with honest open gaps.

## Source verification and the two findings

I fetched the public sources and independently checked their SHA-256 values against the packet. The version read for CDT25 is the published author offprint of [Calegari–Dimitrov–Tang, *The unbounded denominators conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), JAMS 38 (2025), 627–702. I read §§1.1.1–1.1.3, pp.629–631, §2, pp.634–649, and the application interface on pp.649–651. Every node locator lies in this material. I also inspected rendered page images of printed pp.635, 636 and 649 to check the scalar fields, operator coefficient field and unrestricted compact-set assertion directly.

**E1 is confirmed.** Definition 2.0.4, p.635 defines the larger ℚ(x)-span V. Corollary 2.0.5, equation (2.0.7), p.636 bounds its dimension over ℚ(p). For p=x+x⁴/32 the formal inverse χ is rational and tangent to the identity, with fourth coefficient −1/32, and p∘χ=t is integral. With U=ℂ and φ=2z, all the printed analytic hypotheses hold. The constant series 1 belongs to H, so V contains ℚ(x), of degree four over ℚ(p). But |p(2z)|≤5/2 on the parameter circle, giving B≤e log(5/2)/log2<4. The strict inequality follows from e<3 and (5/2)³<2⁴. Thus the contradiction does not depend on a numerical approximation.

The proof controls independent generators over ℚ(p), which gives W. The plan correctly bounds dim over ℚ(x) of V by dim over ℚ(p) of W, and bounds dim over ℚ(p) of V after inserting [ℚ(x):ℚ(p)]. When χ is integral, x belongs to H; the finite-dimensional domain W is a field containing ℚ(x), and W=V. This additional hypothesis recovers the sharper V bound. I checked this finite-field argument independently rather than inferring it from the faulty printed conclusion.

**E2 is confirmed independently of E1.** Section 2.5.27, equation (2.5.28), p.649 allows arbitrary compact K in the parameter disc with positive displayed denominator. For K=closedDisk(1/2,1/4), φ(z)=8z exp(−20z), p=x and χ=t, one has Re z≥1/4 and |z|≤3/4 on K. Hence |φ(z)|≤6 exp(−5)<1. The positive-log numerator is zero, while cap(K)=1/4 makes the denominator log2>0 and the arithmetic space contains 1. Identical scalar fields and an integral coordinate exclude E1 as an explanation. The centred circle/disc formula follows by parameter rescaling and remains valid. The plan promises no unrestricted replacement.

For the qualitative Eisenstein target I read [Bilu–Borichev, *Remarks on Eisenstein*, arXiv:1112.2290v2](https://arxiv.org/pdf/1112.2290v2), §1, pp.1–2, Theorem 6.1 and its proof, pp.10–11, and the opening of §8, p.14. The reader supplies the tail-series reduction and implicit coefficient induction. It retains a scalar multiplier for a nonintegral constant term and does not rely on the stronger quantitative height theorem.

I repeated the bounded correction search on the [author's publication page](https://math.uchicago.edu/~fcale/research.html), the linked published offprint, the [arXiv history](https://arxiv.org/abs/2109.09040) (latest v4, 16 September 2024), targeted erratum/corrigendum searches, and correction/capacity/compact keywords in the author-linked [2026 ICM survey](https://www.math.uchicago.edu/~fcale/papers/ICM.pdf). No applicable correction was located. The survey was keyword-screened, not read in full. Mathematical confirmation of the counterexamples does not establish exhaustive novelty or refute the modular application: the direct Theorem 2.0.1 route in Remark 3.0.6, p.651 is outside the false scalar extension.

## Closure and interface checks

The auxiliary-function construction uses total-degree constraint count binomial(α+d−1,d), the exact integral Siegel bound and inverse-coordinate denominators independent of the family. The cofinal range in d makes its matrix constant independent of both d and κ. The three proofs keep the limits in the order α, d, κ, with ε last in the discrepancy route. Fixed-family boundary norms contribute only a term negligible after division by α.

The Jensen proof distinguishes least lexicographic exponent from least total order, and justifies logarithmic integrability before using Fubini. The discrepancy proof retains atomic multiplicities and uses mesh endpoints outside the limit's atoms. The energy argument retains the truncated empirical diagonal A/d and removes the cutoff only after the population limit. The damping lower bound has derivative exponent β; it does not add the Vandermonde degree to that exponent.

I read the consumed statements in the parent DT.5 packet, ConformalMappingPartII O0/U0/L0, ProbabilisticAndMetricNumberTheory PM.2, and LogarithmicPotentialTheoryAndAlgebraicIntegers LP.0–LP.1. Their fields, local-basis condition, angular normalization, constant 3 in Erdős–Turán, extended energy and positive-capacity conventions match. The holonomic closure sketch explains meromorphic horizontal frames in differential subquotients. Rational simultaneous pole clearing uses minimal polynomials of the finite algebraic images and needs no Galois saturation of the original set. Hyperbolic conformal radius is not applied to parabolic domains. PM.2's own source/proof gaps remain with that supplier.

## Pinned baseline audit

All statements below were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Paths in this table are relative to their respective source trees.

| Declaration | File and line | Scope checked |
| --- | --- | --- |
| `PowerSeries.coeff` | `Mathlib/RingTheory/PowerSeries/Basic.lean:80` | Native coefficient linear map |
| `PowerSeries.coeff_rescale` | same file, 567 | Multiplication by aⁿ |
| `PowerSeries.substAlgHom` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:171` | Nilpotent constant coefficient; zero suffices here |
| `Int.Matrix.exists_ne_zero_int_vec_norm_le` | `Mathlib/NumberTheory/SiegelsLemma.lean:155` | Positive row count smaller than column count; sup-norm bound |
| `AnalyticOnNhd.circleAverage_log_norm` | `Mathlib/Analysis/Complex/JensenFormula.lean:376` | Nonzero centre value and nonzero radius; zero divisor retained |
| `Stirling.factorial_isEquivalent_stirling` | `Mathlib/Analysis/SpecialFunctions/Stirling.lean:245` | Factorial asymptotic supplying e |
| `Matrix.det_vandermonde` | `Mathlib/LinearAlgebra/Vandermonde.lean:219` | Product orientation; its norm ignores the sign |
| `InnerProductSpace.gramSchmidtOrthonormalBasis_det` | `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean:375` | Diagonal inner-product formula; the norm/equality argument is planned here |
| `eVariationOn` | `Mathlib/Topology/EMetricSpace/BoundedVariation.lean:61` | Extended variation over increasing finite partitions |
| `LipschitzWith.comp_boundedVariationOn` | same file, 1257 | Lipschitz composition preserves bounded variation |
| `TauCeti.Probability.empiricalMeasureOfFintype` | `TauCeti/Probability/Process/EmpiricalMeasure.lean:54` | Nonempty finite population; inverse-cardinality weights |
| `TauCeti.Probability.integral_empiricalMeasureOfFintype` | same file, 100 | Strong measurability; complete real normed target |
| `isCompact_setOfPred_finiteMeasure_le_of_isCompact` | `Mathlib/MeasureTheory/Measure/Prokhorov.lean:183` | Bounded mass and compact support; Hausdorff Borel space |
| `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:364` | Bounded continuous real test functions |
| `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` | `Mathlib/Analysis/Complex/Liouville.lean:44` | Positive radius and closed-disc regularity; coefficient bound divides by n! |
| `RatFunc.finrank_eq_max_natDegree` | `Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162` | Reduced rational-function degree; nonconstant case is finite |
| `RatFunc.coeToLaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean:393` | Native rational-function algebra map |
| `IsAlgebraic.exists_integral_multiple` | `Mathlib/RingTheory/Algebraic/Integral.lean:146` | Nonzero scalar makes an algebraic element integral |
| `MeasureTheory.ProbabilityMeasure.continuous_prod` | `Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean:144` | Second-countable pseudometrizable spaces with measurable opens |
| `MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` | `Mathlib/MeasureTheory/Measure/Portmanteau.lean:353` | Null frontier for the limit law; circle mesh arcs qualify |

The product-measure entry deliberately retains the accurate short reference already in the packet. The declaration's full native name is `MeasureTheory.ProbabilityMeasure.continuous_prod`. The supplied index incorrectly nests it under `FiniteMeasure`, because it fails to recognize the commented namespace end on source line 89. This explains the checker's single warning; changing the reference to the index's invented full name would introduce a false citation.

## Upstream audit and validation

I read current ConformalMapping and Completed/ContourIntegration documents and checked ModularForms' scope. I searched the nine newer roadmap families' suggested files, including all eight OperatorTheory subroadmaps. The read-only roadmap commit was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current library matches concern smooth Hadamard factorization, entrywise matrix products and integer Vandermonde identities, not these arithmetic bounds or the circle extremal norm/equality result. The reviewed library audit's existing Siegel, Jensen and elementary complex-analysis results are consumed. No duplicate target was found; neither read-only checkout was built or edited.

Validation: `check_blueprint.py` reports zero errors and the one explained index warning. `check_errata.py` reports zero errors on an errata-v1 envelope of the unchanged source-finding and source-version fields. All packet target statements, proof steps, acceptance checks, API entries and tests occur verbatim between the packet and its own reader, with no mismatch; this is an internal consistency check, not copying from an external source. The review covers every node exactly once. JSON parsing and `git diff --check` pass.

`lean-check` successfully elaborated the unchanged 250-line suggested file at the pinned shared build, with only 25 warnings that declarations use `sorry`. Its five light definitions have real bodies. The theorem and example proofs remain future implementation work; the reader's 20 planning tests were checked mathematically, not discharged as Lean tests.

## Questions for the maintainer

G1 is the sole scope decision: acquire and plan a precise base-point-sensitive arbitrary-compact theorem, or remove that refuted general target. Do not package equation (2.5.28) as currently printed. Downstream noncongruence work must identify W, or justify W=V, before using the sharper bound. No owner migration or new request is needed for the verified targets.
