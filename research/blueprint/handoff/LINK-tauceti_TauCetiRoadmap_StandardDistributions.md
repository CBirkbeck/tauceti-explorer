# LINK-tauceti_TauCetiRoadmap_StandardDistributions — author handoff

**Status: partial, not acceptance-ready.** Four links, one rescope overlap, and 218 cumulative examination identifiers. The larger inventory is not a claim of 218 full README reviews or a completed catalogue-wide full-text screen. This is author continuation, not independent review, Lean implementation or integration.

## Identity, submission and scope

Job: `LINK-tauceti_TauCetiRoadmap_StandardDistributions`, issue [#69](https://github.com/CBirkbeck/tauceti-explorer/issues/69). Worker: **ChatGPT Pro — cgp-aa0b3d0309fb**. Claim comment 5697531906 and bot acceptance 5697534070 explicitly identify this session. The orchestrator authorised continuation after merging predecessor PR #384 (comment 5696975472).

Submission: draft [PR #786](https://github.com/CBirkbeck/tauceti-explorer/pull/786), branch `w3/cgp-aa0b3d0309fb/link-standard-distributions`. The earlier attempt to create this PR was rate-limited; the retry on 17 September succeeded. Issue comment 5713556850 records its first actual CI result. Later issue comments are authoritative for the submitted head, latest validation and release of the execution claim.

Only this handoff and `research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json` are changed. No git command was run. No source README, sibling packet, queue, atlas, retirement record or implementation file was edited. The final issue handoff releases this unfinished execution for continuation; it does not mark it done or accept its mathematics. A successor should continue these two files from PR #786, not restart from the older main-branch checkpoint.

## Revisions and what was actually read

The preceding continuation used mathematical input `088ac3dcfb573a1e875fcea971ce54526bbe74d3` and branch base `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`. The 17 September reads used `dbafc759460581dbd23999a3c112149fedefe2b5` and then `66e35f2051d4e49644701ad398112de45095d315`. The latter is one swarm-output commit after the former. Comparison with the old branch base reports 62 intervening commits: atlas extracts, new-roadmap definitions, other packets, retirement handling and validators have changed. Do not treat the old whole-world graph as current.

The code baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Two Tau Ceti source files were freshly inspected, as detailed below. **Source inspection is not a fresh Lean build or a complete transitive axiom audit.** Other implementation statements in README/status files were not independently certified.

| Fresh 17 September source | Git blob SHA | Read scope |
| --- | --- | --- |
| `TauCeti/Probability/Moments/Determinacy.lean` at the Tau Ceti pin | `bec3f5f56939b7165c0d9ffc4b2703271241f4eb` | Full file |
| `TauCeti/Probability/Distributions/Uniform.lean` at that pin | `abc620e3a1e8d4cbe05cdc54c3c7b03e8fe4a7bf` | Lines 1–175, including definitions and the cited theorems |
| `data/roadmap-summaries.json` | `f36baf08b7da52ceba98181a70668441823ebb51` | All 152 campaign summaries; upstream overrides are not all upstream documents |
| `content/campaign/ArithmeticStatistics/README.md` | `0eccbca73df569a605f94ab63a9494a0b6e2b574` | Full six-stage README |
| `content/campaign/ComputationalNumberTheory/README.md` | `cc0e5740dd0cb809e44b01b8bd17ef6ff05116d8` | Full six-stage README |
| `content/campaign/AnalyticNumberTheory/README.md` | `364688662759ca338c9ba87121e149c94b0f1a95` | Full ten-stage README |
| `content/campaign/QSeriesPartitionsAndMockModularForms/README.md` | `2d096774ef0c12604c30d5dcba3ab85f37697975` | Full seven-stage README |
| `research/blueprint/roadmaps/SolidAnalyticRings.json` | `bd5008d8760f0657c4aac7c1be956f5076d44f8d` | Full root README/summary and SA.0 |
| `research/blueprint/roadmaps/AnalyticStacks.json` | `7eab859457d749fd5107b4baa74afb2ff20e9b9e` | Full root README/summary, not every stage description |
| `research/blueprint/roadmaps/AnalyticHabiroStack.json` | `6d34100064c7480cfc26770bd73b39c91359ee10` | Full root README/summary, not every stage description |
| `research/blueprint/roadmaps/RingStacksAndTransmutation.json` | `601a0f69d0858c3ae12a8ea0247dad21f442a1f5` | Full root README/summary, not every stage description |
| `research/blueprint/roadmaps/QWittVectors.json` | `ec2e7e68136b0ef578bdceaee40328682c5d2ec7` | Full root README/summary, not every stage description |
| `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json` | `b18c75cd5ea017e32be3733f9d060d97dd151979` | Full root README/summary, not every stage description |
| `data/roadmap-retirements.json` | `b2458ea2cd37e8f64459b8fd296f25329d4e4a76` | Full file |
| `scripts/check_links.py` | `57e02703163a9286d28cf3869b557983be6efc64` | Full current validator |
| `research/blueprint/BROWSER_AGENTS.md` | `e4854be9cb94f4e9fe6f4ac76a5468f56c53d3a0` | Current instructions |

The main mathematical README blobs used for the four links remain: StandardDistributions `754b87b5eb8d0e066a2ab00a94ed40f92768dfe6`; Completed/OrthogonalL2Bases `6d96bb586dbc564970da66578acf0c523dcaf18a`; OptimalTransport `401e5d3c67027cbfa194775d452e6ddaf841ff69`; DenseGraphLimits `f0ba56d3967542749552dac19ba0c6cca24423b5`. The preceding continuation also read the six-stage PM README (`157781050fae549a2799021e9b2316463a26b988`), HabiroNahmSeries (`12c1df529f98fea9558c45198c85f16e71bffd0b`) and PDE Lane F (`1cdc0eecdad413406476f99a21600efe34a2119a`).

Referenced probability, transport and Habiro books/papers were not independently read to verify their proofs in this link job. Their labels in README text are not fresh source-verification claims.

## What changed and why

The four-link graph and the Gaussian rescope proposal are preserved. Three reasons are corrected or made more specific after reading the pinned implementation. The unselected PM.1 moment-method edge stays out of the prerequisite graph. The reading log grows from 80 to 218 identifiers, with explicit scope labels and no claim that a summary-only negative is a full-text negative. Detailed predecessor notes remain in the #384 packet and the earlier commits of this branch; their shorter current labels do not upgrade the depth of that inherited reading.

**Retirement matters.** `FoundationsAndLibraryIntegration` was retired on 16 September. Its historical summary remains in the reading log because it was read; no link uses it as a supplier. The retirement record says its library inputs must be taken from their actual library/roadmap owners. Thus 218 is a cumulative historical count, not a claim that 218 active roadmaps exist.

## Seven-layer input/output inventory

| SD layer | Objects and boundaries |
| --- | --- |
| 0 | Existing measures, law/PDF/Radon–Nikodym bridges, conditional-volume uniform law, parameter measurability. Invalid zero measures and valid singular Dirac laws remain distinct. |
| 1 | Elementary moments, transforms, exact integrability domains and native Nat-valued pgfs. Totalized integral values are not integrability theorems. |
| 2 | Incomplete Gamma/Beta, error functions, closed cdfs and discrete tails. Complete Gamma factors elsewhere do not automatically consume this layer. |
| 3 | New scalar families with parameter ranges, boundary laws and sharp moment restrictions. Polynomial moments alone do not give positive-exponential-moment determinacy. |
| 4 | Gaussian squares/ratios, Gamma–Beta independence, Gamma–Poisson mixtures, sums and nonempty-family extrema. Generic conditioning is not a dependence on exchangeability. |
| 5 | Covariance-matrix/bilinear-form bridge with MemLp, PD Gaussian densities, PSD affine images, quadratic transforms, conditional Gaussian kernel, multinomial and Dirichlet laws. Simplex chart measure is not ambient volume. |
| 6 | Symmetric-matrix topology, coordinate Lebesgue normalization, Cholesky/Jacobian, multivariate Gamma, density and Gaussian-Gram Wishart families, Bartlett and inverse Wishart. Singular laws and dimension-zero cases cannot be discarded. |

All seven target layers and the target atlas records were read in the preceding continuation. The particular paired stages for retained links were read in full. Generic nouns such as matrix, moment, kernel, uniformity or distribution do not by themselves determine an edge.

## The four retained links

### 1. OrthogonalL2Bases B1 → SD Layer 1: corrected finite-measure interface

The consumer's ownership paragraph explicitly names the determinacy supplier; its exact quote and the B1 quote remain in the JSON. The function-level explanation in the earlier checkpoint was **too restrictive as a description of available pinned API**.

At the Tau Ceti pin, `TauCeti.Measure.ext_of_forall_integral_pow_eq` applies to two **finite measures on R**, assumes `0 ∈ interior (integrableExpSet id μ)` and the same condition for ν, and assumes equality of every polynomial moment. Its conclusion is μ = ν. The alternative `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` assumes, for each measure separately, an integrable `exp(a*abs(x))` for some positive a. The file first identifies characteristic functions via analyticity of complexMGF. Module documentation explicitly identifies this as the B1 engine.

No density, absolute continuity or common-reference construction is required by these theorems. Both exponential hypotheses are required in the cited signatures; do not silently drop the condition on the competing measure. A native Nat-valued law needs transport through the real cast and recovery along that injective measurable map. An arbitrary weak limit does not acquire the needed exponential hypothesis merely because moments are mentioned. The nondegenerate log-normal family is not eligible just because all its polynomial moments exist.

This is existing-library reuse attached to the relevant uniqueness applications, not a demand to rebuild B1 or a prerequisite for every scalar moment calculation. The earlier OrthogonalL2Bases sibling packet leaves this edge in SD rather than duplicating it; recheck current sibling packets before integration.

### 2. SD Layer 0 → OT Layer 3 item 7: existing uniform-source quantiles

The pinned definition is `TauCeti.Probability.uniformMeasure a b := ProbabilityTheory.cond volume (Set.Ioc a b)`. `uniformMeasure_eq_smul` identifies it with `(ENNReal.ofReal (b-a))⁻¹` times restricted volume. At a=0,b=1 the factor is one. The cited IsUniform/HasLaw bridge uses the identical conditional measure, not a separately normalized construction.

The probability instance requires a<b (with a named zero-one instance). For b≤a the definition is zero, not a Dirac law. OT must still compare its chosen open/closed interval or interval-subtype presentation with this law by measurable inclusion/pushforward and null-endpoint lemmas. Quantile endpoint values may be assigned on null sets. Generalized-inverse measurability, the law identity, monotone optimality and Wp formulas remain OT's targets.

The normalization/provider question is resolved at the pinned definition level. The consumer-specific carrier adapter is not claimed implemented. This narrow reuse edge does not impose all of SD0 as a new construction block.

### 3. SD Layer 1 → OT Layer 3 item 2: the Cauchy component counterexample

For a valid Cauchy law of nonzero scale, finite second moment about any basepoint would imply integrability of the shifted identity by probability-space L2-to-L1 inclusion. Adding the integrable constant would make id integrable, contradicting the supplied theorem. Independently, the diagonal coupling gives W2(μ,μ)=0. Thus the law belongs to its own finite-W2 component but not P2. The zero-scale Dirac law is excluded. No step infers non-integrability from a totalized integral being zero.

### 4. SD Layer 0 → DG Layer 9a: one marginal uniform law

DG's joint sampler explicitly uses one uniform per unordered pair. The same cond-based uniform law provides that marginal. The pinned `uniformMeasure_Iio` gives the strict-threshold probability p for p in [0,1]; changing to a weak threshold uses a null-singleton lemma. Different interval carriers require the inclusion/pushforward adapter just discussed.

DG still owns the independent countable product, independent sampled positions, measurable position-dependent threshold, infinite graph law and finite restrictions. A scalar marginal law supplies none of those automatically. The `binomialRandom` compatibility target does not justify a dependence on scalar Bernoulli moments or concentration estimates.

## Deferred and rejected candidate routes

**PM.1, Erdős–Kac.** The consumer states: “Prove Turan-Kubilius and source-scoped Hardy-Ramanujan/Erdos-Kac theorems through moment or characteristic-function estimates.” SD supplies: “Prove `centralMoment id (2*n) = v^n * (2*n - 1)‼`, the vanishing of odd central moments,”. This is a possible moment-method route, not a selected hard prerequisite; the schema has no conditional-route flag. Reinstate only after PM.1 selects that route and needs the normal moment sequence. PM.1 owns arithmetic moment estimates, large-prime control, convergence and the actual determinacy hypotheses. Its uniform integers are not the continuous interval law; its Gauss-map invariant measure is not Gaussian.

**OT 11, 12 and 16.** These complete candidate sections were read in the preceding continuation. Gaussian heat-flow checks, Gaussian barycenters and end-to-end Gaussian examples reuse OT's own Layer-5 matrix/law interface and its flow prerequisites. They do not establish additional independent whole-SD dependencies. Record the elementary affine-law duplication as the overlap below rather than adding multiple mediated copies.

**OT 13C.** The Brownian reference, path-space construction, Markov and reciprocal properties, disintegration and Schrödinger bridges are not supplied by a finite-dimensional conditional-Gaussian formula. The isotropic transition density does not by itself require new general covariance-density theory. No direct SD edge is established by the stated route.

**PDE Lane F.** The heat kernel is constructed through Fourier analysis. A Gaussian-looking kernel does not establish a dependency on elementary distribution moments; a Poisson kernel is not a Poisson probability law.

**Habiro HB.4/HB.8/HB.9.** Full candidate stages and README were read in the preceding continuation. Formal Gaussian integration, Hessian square-root branches and formal coefficient recurrences are not automatically positive real Gaussian probability measures. No Wishart or scalar-law edge is justified.

**ArithmeticStatistics.** The freshly read ST.5 mentions source-scoped random-matrix distributions, but selects no ensemble. Do not guess Wishart. ST.3/ST.4 arithmetic class-group/Selmer moments do not become named SD moments without an actual limiting-law specification.

**ComputationalNumberTheory.** The freshly read CN.0/CN.1 require randomness models and success/error guarantees but specify no named SD family or elementary transform API. CN.4 interval/ball arithmetic is numerical enclosure, not a uniform random variable.

**AnalyticNumberTheory.** The freshly read AN.5 keeps random-matrix/correlation predictions in conjectural models and selects no SD ensemble. Complete Gamma factors, Poisson summation and arithmetic zeta moments do not establish the corresponding probability-law inputs.

**QSeriesPartitionsAndMockModularForms.** The freshly read QM.0 concerns formal generating products and q-binomial identities, not pgfs. QM.3/QM.4 concern harmonic Maass Fourier parts and a selected Zwegers correction construction, but do not state a particular SD2 incomplete-Gamma/error-function interface. Source decomposition may expose one; no hard edge is guessed from the broad target alone. In particular, an upper incomplete Gamma at a different parameter range would not be supplied automatically by SD2's positive-shape clamped lower function.

**Six new definitions.** Their full root READMEs were screened, not all their stage descriptions. Solid analytic rings, analytic stacks, ring stacks/transmutation, q-Witt complexes and the analytic Habiro stack concern nonarchimedean or derived algebra. Their kernels, rapid decay and q-multinomial coefficients do not specify SD laws. Lawrence–Venkatesh's Gauss–Manin and finite Frobenius-orbit proportions also specify no SD law. The notes do not claim these subjects have no possible future analytic interfaces.

## Gaussian affine-law overlap: rescope, not merge

Both SD Layer 5 item 3 and OT Layer 5 item 3 request Gaussian covariance-pushforward lemmas. Keep the elementary measure identity in SD, allowing rectangular real L and PSD S. OT imports it through its Euclidean carrier adapter and keeps the PD square-root/inverse/geometric-mean identities, Brenier matrix, W2 formula, interpolation and barycenters. SD keeps Cholesky, Wishart and conditional-Gaussian theory.

Do not replace the PSD affine theorem by a PD-only one; do not extend it to arbitrary non-PSD totalized covariance parameters. No edge for this duplicated-ownership pair is emitted until the owner resolves the rescope. There is no recommendation to merge whole roadmaps or add a reverse whole-roadmap edge.

A separately authorised maintenance change should repair the stale SD relative link to OrthogonalL2Bases: the actual supplier path is `content/tau-ceti/Completed/OrthogonalL2Bases/README.md`. It was not edited here.

## Search log and exact remaining work

The original 60 upstream overview/keyword screens and the earlier 20 campaign entries are inherited from #384 unless the current packet says a deeper read occurred. All 152 campaign summaries were freshly read by overlapping line slices of `data/roadmap-summaries.json`; this establishes a summary screen only. The new definitions directory contained six files at dbafc759; all six root READMEs were read. Every cumulative identifier is listed in `examined`, including the retired historical entry.

Fresh repository searches included probability, random, Gaussian, Wishart, Cholesky, covariance, incomplete gamma, incomplete, probability generating, characteristic function, uniformMeasure, Schur complement, Weibull, Pareto, hypergeometric and multinomial. Results included primary README excerpts and many derived audit/classification/status packets; the latter are discovery aids, not independent mathematical evidence. The multi-term REST query containing OR did not behave as a verified union and is not counted as one. The phrase Schur complement also misses hyphenated spelling and is not a negative certificate.

No complete local full-text dump of the current atlas and new stage records was searched. The full atlas reader returned empty content, and the local interpreter could not resolve the raw GitHub host. The extracts remain the correct continuation inputs; this handoff does not claim that the entire repository is inaccessible. Several minified extract responses were truncated, and no truncation is counted as a full read.

Before acceptance:

1. Finish the full catalogue text search from the current area extracts or a local atlas dump for every Layer-0–6 input/output family and its synonyms. In particular close the remaining scalar-family names, density/HasPDF/rnDeriv, cdf/mgf/pgf, mixture/conditioning, simplex/Dirichlet, covariance/Schur-complement and symmetric-matrix/Jacobian searches. Read each genuine candidate stage in full; record explicit exclusions and any newly justified edge. A summary-only entry is not that work.
2. Reconcile the current atlas, six new stage sets, retirement overlay and sibling link packets. Do not duplicate a pair already owned by the partner's packet, and check the complete combined graph. In particular revisit the OrthogonalL2Bases, OptimalTransport and DenseGraphLimits packets at the integration revision.
3. Keep the now-resolved pinned determinacy and uniform normalization facts. The remaining carrier adapters and ownership decision are source/implementation coordination, not reasons to rebuild those providers. Retain the optional PM.1 route outside hard links until selected.
4. Run the official validator on the latest head, then obtain an independent review. No self-acceptance is recorded here.

## Validation record

Actual official validation of the preceding checkpoint was read from the completed workflow log:

- PR #786 head `d03d99e3661ab8063c0fd7c62cc3eca1e7789b23`.
- Base `dbafc759460581dbd23999a3c112149fedefe2b5`.
- Test merge `25503ab45d2a97fda2b2d63162ea7884c2032b86`.
- Run 35215132755, job 105181704507.
- Command: `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json`.
- Result: **4 links, 1 overlap, 80 examined; 0 errors, 0 warnings**.

That result supersedes the earlier rate-limited checkpoint's pending-CI note, but does not validate these new reasons and 218-entry inventory. Local JSON parsing, unique-ID and edge-shape checks are separate limited checks. The official result for this revised submission must be read from its own workflow and recorded in the issue/PR comments. The validator checks structural validity, quoted evidence and combined graph cycles; it does not certify exhaustive candidate coverage or mathematical correctness.
