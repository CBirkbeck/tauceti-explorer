# LINK-tauceti_TauCetiRoadmap_StandardDistributions — author handoff

**Status: partial submission; not acceptance-ready.** This is an authored link packet, not an independent review, implementation, or completed catalogue-wide dependency audit. It preserves checked candidates and an explicit continuation list. Do not mark the job done from this handoff.

## Identity and ownership

- Issue: [#69](https://github.com/CBirkbeck/tauceti-explorer/issues/69).
- Worker: **ChatGPT Pro — cgp-2500d08c972d**, user-assigned worker w3.
- Claim: comment [5696615592](https://github.com/CBirkbeck/tauceti-explorer/issues/69#issuecomment-5696615592).
- Workflow acceptance: comment [5696617434](https://github.com/CBirkbeck/tauceti-explorer/issues/69#issuecomment-5696617434), explicitly naming this session. Re-read before submission; no competing confirmation found.
- Isolated submission branch: `w3/cgp-2500d08c972d/link-standard-distributions`.
- Authorised files: this handoff and `research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json`. No source README, atlas, queue, application, reserved-ID or implementation file is changed. No git command was run.

The issue should remain protected from duplicate workers pending the maintainer's disposition of this partial result. The author has not released it, closed it, marked it done, approved anything, or merged anything. A PR is a submission, not integration or acceptance.

## Input revisions and provenance

Mathematical input revision: `06324eb3a84b57956b9a72e2249e0fd9ea654bf7` in `CBirkbeck/tauceti-explorer`.
Submission-base recheck: `7821d19ab4fd547181beb46287f8968ec64847d1`. The GitHub commit comparison returned seven intervening commits. They add browser-sized atlas extracts and change queue/claim/browser-support and unrelated results, but do not change `data/atlas.json`, the mathematical READMEs used here, baseline pins, or the link validator. The revised browser instructions were read at the submission base.

| Input | Git blob SHA |
| --- | --- |
| `data/atlas.json` | `37f2add06983c206067d1104e0f40a839cc3961a` |
| `content/tau-ceti/StandardDistributions/README.md` | `754b87b5eb8d0e066a2ab00a94ed40f92768dfe6` |
| `content/tau-ceti/Completed/OrthogonalL2Bases/README.md` | `6d96bb586dbc564970da66578acf0c523dcaf18a` |
| `content/tau-ceti/OptimalTransport/README.md` | `401e5d3c67027cbfa194775d452e6ddaf841ff69` |
| `content/tau-ceti/DenseGraphLimits/README.md` | `f0ba56d3967542749552dac19ba0c6cca24423b5` |
| `research/blueprint/baseline.json` | `fdb00afdfae8e5728e070f310f5a880707764bc2` |
| Revised `research/blueprint/BROWSER_AGENTS.md` | `75ae064dee2fdbf87c7331475520ce445604788d` |
| New StandardDistributions atlas extract | `221d7e5fb3eff660e9c32125a7bb27e1923ea4fd` |
| New ProbabilisticAndMetricNumberTheory atlas extract | `f0932093223c61dbd73f2b4e44c97614c4b4cfd9` |

Recorded library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. **These pins were read, but no Lean declaration at those pins was independently audited in this link job.** README claims about implemented declarations are not promoted to verified baseline facts.

The original atlas was readable through GitHub's contents endpoint and resource text search, but could not be downloaded into the local execution environment. The browser-sized extracts became available late in this run. The StandardDistributions extract was checked for its exact stage IDs and empty `stageEdges`; the PM extract supplies exact PM.1 identity and existing neighbours. The links directory was absent both at the input revision and the submission-base recheck; the original new-roadmap directory was absent. A pre-submission PR search for StandardDistributions returned no result. These are recorded observations, not a general completeness guarantee for GitHub search.

The README snapshot is the mathematical source for this links job. Referenced books and papers were **not** independently opened to verify proofs, and no invented page/theorem locators are supplied. The atlas reports upstream README snapshot `faa5423b925964415cc926802ab206567719d3f4`; that is distinct from the code baseline.

## Seven-layer inventory

| Layer | Inputs and exports considered |
| --- | --- |
| 0 | Existing named measures and with-density presentations; law/PDF/Radon–Nikodym bridges; uniform interval probability only for a<b; parameter measurability. Singular zero-spread laws remain separate. |
| 1 | Scalar moments, characteristic/moment generating functions, exact integrability domains, native discrete carriers and natural-valued probability generating functions. Cauchy non-integrability is not a totalized-integral identity. |
| 2 | Error function, incomplete Gamma/Beta, closed-form cdfs and discrete tails. Analytic special functions are not automatically a prerequisite for every general quantile construction. |
| 3 | New scalar families with valid parameters and sharp moment/exponential-moment restrictions. Nondegenerate log-normal laws must not be fed to a positive-exponential-moment determinacy theorem. |
| 4 | Gaussian square/ratio laws, Gamma–Beta independence, Gamma–Poisson mixture and extrema. General measure composition does not imply dependence on the exchangeability theorem. |
| 5 | Covariance-matrix/bilinear-form bridge with MemLp; positive-definite Gaussian densities; positive-semidefinite affine images; Schur-complement conditional kernel; quadratic-form transforms; multinomial and Dirichlet laws. Simplex-chart volume is not ambient volume. |
| 6 | Symmetric-matrix topology and volume normalization; Cholesky/Jacobian and multivariate Gamma integral; positive-definite-density Wishart versus natural-degree Gaussian-Gram laws, including singular cases; transforms, Bartlett and inverse Wishart. Positive-definite square roots and Cholesky are not the same construction. |

## Proposed links and exact evidence locations

There are **five proposed links: one incoming explicit and four outgoing inferred**. Each has two literal excerpts in the JSON. All supplier/consumer stage texts for these pairs were read; the determinacy consumer evidence is explicitly a roadmap-wide ownership directive attached to Layer 1.

1. **OrthogonalL2Bases B1 → StandardDistributions Layer 1.** Supplier README, Part B, B1, lines 250–272; consumer README ownership paragraph immediately before Layer 0, lines 158–166. The usable statement is uniqueness for an L1 density difference with a positive exponential moment. Its translation to equality of absolutely continuous laws requires writing the two densities against the same reference measure. A single positive exponent gives strip analyticity; all positive exponents give the stronger entire-function argument. Do not confuse them. A measure-valued or discrete uniqueness theorem must be separately checked before extending this link to discrete families. Not every Layer-1 calculation needs B1.
2. **StandardDistributions Layer 0 → OptimalTransport Layer 3 item 7.** SD lines 168–225, uniform-law construction and completion check; OT Layer 3 item 7, generalized inverse and uniform pushforward. Normalize on (0,1]; compare with (0,1) or a unit-interval subtype modulo endpoints. The quantile at an endpoint can be assigned separately on a null set. The optimal-coupling and Wasserstein proofs remain OT work.
3. **StandardDistributions Layer 1 → OptimalTransport Layer 3 item 2.** SD Layer-1 Cauchy paragraph; OT finite-moment versus anchored-component guardrail. For nonzero scale, non-integrability of id rules out a finite second moment on a probability space. If the second moment about a different basepoint were finite, the triangle inequality and integrability of a constant would again imply integrability of id. The diagonal coupling separately proves zero self-distance; the law can therefore belong to its own finite-distance component without belonging to P2. Zero scale is excluded.
4. **StandardDistributions Layer 0 → DenseGraphLimits Layer 9a.** SD uniform-law completion check; DG lines 402–422, especially the single infinite sampler and one uniform per unordered pair. This proposes reuse of the real law, not replacement of the countable-product or graph-valued constructions. An adapter to the sampler's exact interval carrier is required. The Bernoulli moment API is not declared a prerequisite for graphon concentration.
5. **StandardDistributions Layer 1 → PM.1.** SD Real Gaussian paragraph, even/odd central and absolute moments; `content/campaign/ProbabilisticAndMetricNumberTheory/README.md`, PM.1 construction and acceptance paragraphs. This is specifically the moment-method branch of Erdős–Kac. At m=0, v=1 the moments are the required normal target sequence. Arithmetic estimates, independence/comparison arguments, large-prime errors, moment convergence and the target-law uniqueness argument remain with PM.1. Its alternative characteristic-function route need not consume this new moment API.

**Review question on inferred reuse links:** the texts identify exact mathematical constructions, not their only possible implementation provider. Check whether OT's or DG's actual chosen proof route already consumes a sufficiently general pinned interval-law API and needs only an adapter, rather than treating completion of all SD Layer 0 as a scheduling prerequisite. Similarly, PM.1's selected source may choose characteristic functions instead of moments. The reasons deliberately retain these distinctions; the current graph schema has no dedicated optional-route flag.

## Overlap and concrete ownership proposal

**SD Layer 5 item 3 versus OT Layer 5 item 3: rescope, not merge.** SD explicitly constructs Gaussian affine pushforwards for rectangular real L and positive-semidefinite S. OT also asks to build Gaussian covariance-pushforward lemmas. SD's ownership section already distinguishes distributional calculations from transport calculations, but the duplicate build instruction remains in OT.

Keep the elementary affine-law/covariance theorem in SD. OT should import it through its Euclidean carrier adapter. Keep square-root/inverse/geometric-mean identities, Brenier maps, closed W2, interpolation and barycenters in OT. Keep Cholesky, Wishart density and conditional-Gaussian calculations in SD. Do not pretend that positive-semidefinite laws possess the positive-definite Lebesgue density, or extend the affine identity to arbitrary matrices S under a totalized definition.

Only an overlap is emitted for this pair: the job forbids guessing a dependency direction from duplicate ownership. After the maintainer resolves it, add the narrow SD5-to-OT5 edge. No whole-roadmap reverse edge or roadmap merge is recommended.

A separate source-maintenance request: SD's links to `../OrthogonalL2Bases/README.md` are obsolete. The actual supplier is `content/tau-ceti/Completed/OrthogonalL2Bases/README.md`, with atlas ID `tauceti:Completed/OrthogonalL2Bases`. Repair the relative links in a separately authorised change; they were not edited here.

## Coverage and unresolved work

The JSON records **80 examined roadmaps**, including all 60 upstream entries. This does **not** mean 80 complete README reviews. The target and OrthogonalL2Bases were read fully; OT Layers 3 and 5, DG Layer 9a and the six-stage PM README were read fully. Most unrelated upstream entries were screened by summaries/overviews, and some campaign entries only by keyword excerpts. The notes record those limits. A `none` result means no dependency established in that read scope, not a proof that none exists.

Searches included Gaussian, Bernoulli, Wishart, stage summaries and named target/partner mentions in the atlas, plus the complete target input/output inventory. They excluded Gaussian integers/elimination, Bernoulli numbers, Dirichlet series, Jacobian varieties and algebraic Gram forms as automatic probability matches. Same-area entries were screened, including the explicit no-dependency boundary with OneParameterSemigroups and Exchangeability's explicit independence from a mature Bernoulli API.

**Before acceptance, finish the following rather than restarting this work:**

- Run a complete campaign-wide search over the new area extracts for every Layer 0–6 object and synonym, especially probability/normal/uniform laws, moments/cumulants/pgf, incomplete special functions, kernels/mixtures, covariance/Schur complements, simplex/Dirichlet, and Cholesky/Wishart. This run did not certify an exhaustive pass over all 152 campaign roadmaps.
- Close the unresolved Gaussian hits by reading full candidate stages: OT Layers 11, 12, the dynamic part of 13, and 16; HabiroNahmSeries HB.4/HB.8/HB.9; and any heat-kernel candidate found in PDE. Distinguish genuinely direct distributional inputs from already mediated OT5 inputs and from formal Gaussian expansions. No speculative edge for these incomplete reads is in the packet.
- Resolve the optional-route/carrier questions above. Verify the density-to-measure form of the determinacy interface before attaching it to any additional scalar or discrete stage. Do not use polynomial moments alone for the log-normal family.
- Refresh atlas/new-roadmap/link packets at integration time. Run the full validator against all existing edges and packets, including the combined dependency graph. Then perform an independent mathematical link review; the author has not reviewed this packet independently.

## Validation and submission record

Actually executed in author scratch:

```text
python3 -m json.tool research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json > /dev/null
python3 check_packet.py
```

Both exited 0. The second is an author-side scratch check, **not a repository validator**: it checked local field shapes and lengths, evidence-to-endpoint association, unique proposed edges/examined IDs, allowed tags and acyclicity of only the five proposed edges. It did not check full-atlas ID resolution, literal quotes against a locally loaded catalogue, existing-edge conflicts or combined-graph acyclicity. Evidence was compared manually with the fetched README text.

Required command, **not run locally**:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json
```

The full atlas was not available to the local interpreter. The PR workflow was inspected and includes link validation; its actual result must be recorded from the run, not assumed from opening a PR. No Lean build or implementation-status claim is made. The PR/issue conversation records the durable submission URL and any later CI result so that this file does not pretend a check had run before submission.
