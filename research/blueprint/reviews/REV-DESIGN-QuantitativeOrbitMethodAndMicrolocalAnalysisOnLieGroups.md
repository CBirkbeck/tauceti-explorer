# Independent review: quantitative orbit method

**Accepted as a target-level design pass, with corrections.** Codex session `codex-IPXayi` reviewed issue #3599 on 2026-10-19. The designer was the different session `codex-qAckVq` (#3481). This acceptance does not assert proof closure: all ten stages remain planned, none is closed, and the packet now records twenty named proof obligations.

The [packet](../packets/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.json) records an individual verdict for all 79 nodes: 73 verified and six corrected. Its 18 definitions and five constructions have 110 API items and 83 discriminating tests. There are 56 theorem targets and 45 planets, with at most six per layer. No node was added or removed. All 76 assigned extraction routes remain present. The [reader](../readmes/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.md), [roadmap](../roadmaps/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.json) and [suggested Lean file](../suggested/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.lean) agree with the corrected packet.

## Source and mathematical corrections

I read the node locators and surrounding arguments in Nelson–Venkatesh, *The orbit method and analysis of automorphic forms*, Acta Mathematica 226 (2021), 1–209, using the [published PDF](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf). The version is the packet's recorded SHA256 `85e14654d2b367f4b0d4a21c9555576f6def6649c8b6707afc78e1dfbdaea76e`. The source statements and review descriptions are in independent wording. No source passage is reproduced.

| Target | Correction and reason |
| --- | --- |
| QO.0/operator-order | Made the integral order and family delta range explicit. Corrected the reader's definition of h-uniform continuity: the controlling seminorm bound is independent of h; the polynomial loss in Lemma 5.3, p.38, comes from comparison with other seminorms. |
| QO.1/planck-partition | Lemmas 7.11–7.12, pp.51–52, give locally finite reconstruction and uniform symbol estimates. They do not give finite-sum convergence in the original symbol topology. For the constant symbol on a positive-dimensional dual, every finite sum of compactly supported pieces has sup-norm error at least one. Added this countertest and qualified the counting-growth test by delta>0 and nonempty interior. |
| QO.1/localized-remainders | Replaced an overbroad decay assertion by the four precise weight inequalities in Proposition 7.13, p.53. A full input algebra gives decay in the opposite center; two proper subalgebras retain polynomial weights. The admissible negative orders absorb these weights when summing the global remainder. |
| QO.1/polynomial-quantization | The exact quadratic identity requires the norm dual to the basis defining Delta. Moved the PBW import from LieGroups BCH to LieHighestWeight Layer 3. Strengthened the noncommutative-power check: for [X,Y]=Z, sym(p²)=Delta²−Z², where p=1−x²−y²−z² on the imaginary dual. |
| QO.9/period-parseval | Restricted the source-backed identity to smoothing operators, as in (28.1)–(28.3), p.187, and §29.1, pp.189–190. The smooth diagonal available for smoothly trace-class operators is not the smooth two-variable kernel used for spectral expansion. Added the missing spectral supplier contract as G20. |
| QO.9/spectral-truncation | Retained arbitrary open U in Theorem 29.1, p.190. First choose a relatively compact U0 inside U containing the compact symbol-parameter image. Localization controls the tail outside U0; only then does the weak Weyl bound give polynomially many remaining terms. The source's counting sentence on p.191 needs this reduction for unbounded U. |

All 33 source-error entries now have individual independent verdicts and reasons. The original 32 entries were checked at their locators. E10 is confirmed only after narrowing: delta=0 must be included and the order-m Fourier moment needs its center weight, but the partition construction itself does not fail at delta=1. The separate calculus range remains delta<1.

New E36 records the false identification of quantized quadratic powers with powers of Delta in §8.7, p.63. Exact rational normal ordering verifies Delta²−sym(p²)=Z² in the Heisenberg enveloping algebra. For the proof, use the inverse-symmetrization polynomial representing Delta^N, agreeing with the proposed power modulo lower-degree terms. The existing polynomial-quantization target already warned against the false identity; the review makes the countercalculation and source record explicit.

For E7 I also read [Waldspurger, Astérisque 346 (2012), Proposition 5.7, pp.263–264](https://www.numdam.org/item/AST_2012__346__171_0.pdf). Its compatible p-adic orthogonal spaces and tempered representations match the restricted local nonvanishing reference. It does not prove the archimedean or global GGP supplier obligations. Publisher/arXiv records and title/erratum searches did not locate a separate correction document.

The review retains the already correct additive O(h^N) error and nested support in inverse branching, the strong Cotlar sum, the two spectral parameters in joint localization, all relative trace h^j factors, normalized KKS measures, compact relative trace factor, and the exceptional SO3/SO2 self-twist exclusion.

## Baseline and ownership

All seven baseline entries were opened with their surrounding hypotheses. None was removed. Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is pinned at `f790474821cf4256814db967cb154e7af3d0c369`. The local Tau Ceti spinor module was additionally compared byte for byte with its pinned public source.

| Declaration | Confirmed contract |
| --- | --- |
| `SchwartzMap` | Smooth normed-valued functions with every polynomially weighted iterated derivative bounded. The roadmap adds symbol orders and families rather than redefining this carrier. |
| `SchwartzMap.fourierTransformCLM` | Finite-dimensional real inner-product domain and compatible complex/RCLike target structures; the NV sign is transported to the inverse transform. |
| `UniversalEnvelopingAlgebra` | Commutative-ring Lie algebra quotient, canonical Lie map and universal lifting equivalence. This does not supply PBW. |
| `RealRMK.integral_rieszMeasure` | Positive real linear functional on compactly supported continuous functions of a locally compact Hausdorff Borel space. It supplies measure representation, not the Schwartz-kernel or continuous-disintegration steps. |
| `CliffordAlgebra.spinorNorm` | Finite-dimensional nondegenerate quadratic form over a field with 2 invertible. |
| `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm` | Exact Spin image/kernel equality under the same hypotheses; no local or rational surjectivity conclusion follows automatically. |
| `MeasureTheory.norm_integral_le_integral_norm` | The Bochner integral norm bound used by the concrete line model. |

The reviewed library-coverage records and actual supplier statements were read. The current read-only TauCetiRoadmap revision `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti library were checked. OperatorTheory/OperatorIdeals owns the generic HS, nuclear and Schatten targets; OrthogonalSpinGroups owns the existing R/Qp image tables; LieGroups owns the exponential, adjoint, BCH, real-form and KAK interfaces. The current `lieLocalBCH` implementation supplies its local germ, first derivative and naturality, rather than an excuse to re-plan those objects. LieHighestWeight Layer 3 explicitly owns arbitrary-field concrete PBW and its generator-normalized bases. The review adds its precise request, taking the request count from fourteen to fifteen.

Exact AF.1, AS.0, Ratner and Jacobson–Morozov node statements were compared with their uses. Stage contracts for AA.2–AA.4 and SR.1–SR.3a were also read. Their narrower quantitative, real-form, general-classical-group and adelic consequences remain named obligations rather than presumed theorems. The ten layers are ordered by their actual dependency graph and every target is realized at the stated target-level granularity.

## Closure and follow-up contracts

The nineteen original obligations remain explicit. New **G20** records that `AutomorphicSpectralTheory:AS.4/compact-quotient-spectrum` states the discrete Hilbert sum, finite multiplicities and smooth convolution kernels, but not the full arbitrary smooth two-variable spectral expansion, differentiated restriction estimates and polynomial elliptic counting needed in NV §29.1–§29.2. Its own supplier packet also retains the compact-quotient Sobolev input as open. The request and QO.9 coverage now expose this distinction.

For the orchestrator: assign exact supplier nodes for G20 and the pre-existing extensions before proof closure. In particular, G6/G8 still lack defined supplier stages, G13/G14 need general classical-group p-adic interfaces, and G19 needs the general local-field and rational spinor-image bridge. There is no unresolved contradiction in the corrected design; these recorded obligations do not turn a completed planning pass into a proof-closed roadmap. No duplicate roadmap, hidden source development or scope expansion to the refined L-value endpoint was introduced.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.json`: passed with zero errors and warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.lean`: passed.
- `lean-check research/blueprint/suggested/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.lean`: exit zero in the shared pinned build; only declaration-uses-`sorry` warnings. The file is 192 lines with four light definitions and no admitted data definitions. Added a concrete opposite-phase integral on [0,1] whose value one detects a reversed character sign. This is elaboration of proposed statements, not proof of admitted examples.
- Exact rational Heisenberg normal ordering independently checked the E36 countercalculation.
- Reader/packet statements, APIs, tests, proof steps and source locators, internal links, review coverage, source verdict coverage, JSON, deliverable scope and whitespace were checked before submission.
