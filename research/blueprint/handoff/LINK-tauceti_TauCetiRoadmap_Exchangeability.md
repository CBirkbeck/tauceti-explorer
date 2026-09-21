# Handoff: Exchangeability link survey

## Identity and submission scope

**Job:** `LINK-tauceti_TauCetiRoadmap_Exchangeability`  
**Issue:** #46  
**Worker:** ChatGPT Pro — cgp-0d677fbc2f21  
**Date:** 2026-09-16  
**Input revision:** `088ac3dcfb573a1e875fcea971ce54526bbe74d3`  
**Status:** partial, awaiting continuation and independent review. This is not a completed catalogue screen or an accepted/integrated result.

Claim comment: <https://github.com/CBirkbeck/tauceti-explorer/issues/46#issuecomment-5697564058>. Session-specific workflow confirmation: <https://github.com/CBirkbeck/tauceti-explorer/issues/46#issuecomment-5697566151>.

Files produced:

- `research/blueprint/links/tauceti_TauCetiRoadmap_Exchangeability.json`
- this handoff.

The packet contains **zero new prerequisite links, two source-backed ownership overlaps, and five examined-roadmap records**, including the target. A result of `none` means no edge was established within the recorded reading scope; it is not a claim that the roadmap has no relationship to Exchangeability. No review verdict is supplied by the author. No application, atlas, reserved-ID, queue, or other worker's file is changed.

The useful completed portion is the nine-layer target inventory, a detailed audit of both graphon interfaces, and the rejection of several tempting but unjustified dependencies. The catalogue-wide portion remains explicitly unfinished.

## Source and baseline provenance

The packet's `provenance.sourceDocuments` records the exact blobs and read scopes. All five documents were read at the input revision, using `GitHub.fetch_file` with source-line ranges where necessary.

| Document | Actual reading |
| --- | --- |
| `content/tau-ceti/Exchangeability/README.md` | Complete document: all layers, worked examples, ordering and references. |
| `content/tau-ceti/DenseGraphLimits/README.md` | Complete document, including the finite/joint sampling and graph-law sections and final checklist. |
| `content/campaign/ProbabilisticAndMetricNumberTheory/README.md` | Complete document, PM.0 through PM.5 and its source-access qualifications. |
| `content/tau-ceti/StandardDistributions/README.md` | Overview and shared measure/kernel API; the complete hypergeometric-family specification; relationships through finite minima/maxima. Not all of Layer 3 or the whole document. |
| `content/tau-ceti/OneParameterSemigroups/README.md` | Lines 1–120: overview, generality conventions, and opening of Part A through resolvent bounds. Not the whole of Part A or the document. |

The updated browser instructions, atlas-extract README, blueprint protocol, upstream guide, expansion protocol and issue instructions were also read. The full Exchangeability and DenseGraphLimits documents satisfy the two-upstream-document reading requirement. Extracts and repository search were used to discover stage IDs; the minified extract responses were truncated in this session, so they are not recorded as completely read. Read scopes in the packet do not silently promote search snippets to full source inspection.

`research/blueprint/baseline.json` records:

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

**These pins are provenance, not declaration verification.** No library declaration was certified, no missing-library assertion is made, and no implementation status is changed. References to library features inside the roadmaps were not treated as independent evidence that those features exist at the pins.

The overlap evidence consists of short literal passages from the roadmap documents, with section locators. The original papers of Diaconis–Janson, Diaconis–Freedman, Aldous and Kallenberg were not independently passage-checked. Bibliographic discovery is not counted as proof verification. In particular, this survey does not independently certify the original theorem numbers cited by DenseGraphLimits.

## Target inventory and dependency boundaries

| Exchangeability layer | Inputs and outputs relevant to this survey |
| --- | --- |
| 0 | Measurable processes and finite marginals; finite-permutation and increasing-subsequence symmetry, their law-level formulation, and finite-marginal uniqueness. A stationary path law is not thereby exchangeable. |
| 1 | Finite product kernels and measurable random probability measures. The marginal-mixture assertion and the joint-disintegration assertion are distinct outputs. |
| 2 | Process tails, invariant/symmetric measurable spaces, and path shifts. Keep process-tail and permutation-invariant sigma-algebras distinct until their required comparison is proved. |
| 3 | The L2 averaging route: observable/window estimates and product limits feed its own conditional factorization argument, rather than importing the final martingale de Finetti theorem. |
| 4 | General decreasing-filtration/reverse-martingale infrastructure and Levy downward convergence. This does not, without a separate reduction, provide every theorem described elsewhere as martingale convergence. |
| 5 | Koopman operators associated to measure-preserving maps, invariant subspaces and conditional expectations, and a separate path-space proof route. Discrete iterates do not automatically give a strongly continuous real-time semigroup. |
| 6 | The conditional directing measure, de Finetti consequences and empirical-measure statements. Distinguish almost-everywhere uniqueness of a conditional witness from equality in law of mixing representatives. Weak convergence needs the chosen topological realization; sequence extremality concerns the sequence permutation action. |
| 7 | Public interfaces and worked examples built from the preceding layers. The random-coin example uses a two-point kernel, expressly without requiring a mature Bernoulli-family API. |
| 8 | Finite-population sampling and quantitative finite de Finetti, other countable index types, affine/ergodic decomposition, Markov exchangeability, and the substantially larger array-representation programme. Its array bullet is not yet a declaration-sized generic relational-law specification. |

No new packet nodes or reserved IDs are introduced: this is a link job, not a blueprint implementation or a rewrite of Layer 8.

## EXCH-DGL-01: law-level adapters, not an Aldous–Hoover build edge

Endpoints:

- `tauceti:TauCetiRoadmap/Exchangeability#layer-8-generalized-exchangeability-and-representation-theorems`
- `tauceti:TauCetiRoadmap/DenseGraphLimits#layer-9b--exchangeable-graph-laws-and-graphon-mixtures`

**Recommendation: keep the two roadmaps.** The explicit graphon boundary distinguishes generic API ownership from proof dependency. Generic consistent relational laws, relabeling, dissociation and extremality belong outside the graphon development; Exchangeability is its named natural owner. The graph-specialized structures and the adapter obligation remain in DenseGraphLimits.

The graphon-mixture existence proof is already specified internally: empirical graphon mixing measures, a collision estimate, compactness of the graphon quotient, and identification by hom-density coordinates. It does not consume the functional converse of the general array representation theorem. Adding an Exchangeability-Layer-8 → DenseGraphLimits-Layer-9b build edge would contradict that boundary and obscure the separate generic API task.

### Exact adapter contract to resolve

For countable simple undirected graphs, let the edge-coordinate set consist of unordered pairs of **distinct** vertices. The coordinate map sends a graph to its Boolean adjacency coordinates. Require measurability in both directions for the specified graph/product sigma-algebras. Transport finite vertex permutations to this coordinate set and prove that the coordinate map commutes with relabeling. The law-level equivalence is then pushforward along that measurable equivalence.

The following tests make the contract precise:

1. Restriction to a finite vertex window agrees before and after the coordinate map.
2. The same permutation acts on both arguments of adjacency: this is **joint** exchangeability, not independent row/column exchangeability.
3. Dissociation is independence of restrictions to disjoint **vertex** windows. It is not independence of every pair of distinct edges, including edges sharing a vertex.
4. The graph specialization of the generic representation induces the same infinite graph law as the graph-specific mixture construction.
5. Uniqueness compares mixing measures on `GraphonSpaceI`, not raw graphon representatives.

These are interface requirements within the documented boundary, not newly verified existing declarations. Layer 8 still needs the precise generic law-level objects supplying the adapter's target. Once those are specified, record declaration-level compatibility rather than reversing the graphon proof's prescribed dependencies.

### Why sequence de Finetti cannot replace this interface

Enumerating the edge coordinates by natural numbers does not change which permutations preserve a law. Vertex permutations induce a proper set of edge-coordinate permutations; they do not supply arbitrary finite permutations of the enumerated edge sequence.

A concrete test is the graph generated by independent fair vertex colours, with an edge exactly when two colours agree. It is invariant under vertex relabeling and its induced subgraphs on disjoint vertex sets are independent. However, the probability that all three triangle edges are present is 1/4, whereas the probability that all three edges of a three-edge star are present is 1/8. Thus its edge indicators are not an exchangeable sequence under arbitrary coordinate permutations. Applying sequence de Finetti after merely choosing an enumeration of edges would be invalid. The two probabilities follow by counting the 16 colourings of four vertices; the local sanity check enumerated them exactly.

## EXCH-DGL-02: one reusable collision comparison

Endpoints:

- the same Exchangeability Layer 8;
- `tauceti:TauCetiRoadmap/DenseGraphLimits#layer-9a--finite-and-joint-graphon-sampling`.

**Recommendation: rescope the common elementary sampling comparison, not the complete roadmaps.** Exchangeability already asks for sampling random finite populations with and without replacement. DenseGraphLimits separately asks for the homomorphism-versus-injective-density bound. Their common argument should be a neutral probability API developed with the finite-population work. Graph densities, graphon samplers and their graph-specific identifications stay in DenseGraphLimits.

### Mathematical argument and hypotheses

Let the population index set have cardinality n > 0, and let the ordered sample index set have cardinality m ≤ n. Let U be the uniform law on all index maps and D the event that the map is injective. The uniform law Q on injections is U conditioned on D. The event D has positive probability, including when m = 0.

Write q = U(D-complement). If q > 0, let R be the conditional law on collisions. Then

    U = (1-q) Q + q R.

For every measurable test f with values in [0,1], this yields

    |integral f dU - integral f dQ| ≤ q.

When q = 0 the laws are equal, so the same bound holds without defining a conditional collision law on a null event. Counting and the union bound give

    q = 1 - (n)_m / n^m ≤ choose(m,2) / n.

Here `(n)_m` is the falling factorial. Each pair of sample positions collides with probability 1/n. The same expectation inequality holds after first drawing a population from a probability measure and then performing the independent index-map experiment: apply the uniform bound for each population and integrate. Measurability of the reindexing maps and tests must be part of the API.

For a fixed finite graph G, use the Boolean test that the index map is a homomorphism from F to G. The two expectations are respectively the ordinary homomorphism density and the ordered injective homomorphism density. This gives the requested graph-density inequality. The injective denominator is `(n)_m`, **not** `choose(n,m)`.

Handle m = 0 and n = 1 explicitly. Do not include n = 0 in a theorem dividing by n. When m > n the injection event is empty and this conditioning proof does not apply. Probability total variation `sup_A |P(A)-Q(A)|` has the bound displayed above; the signed-measure total-variation norm has twice that bound. The graph expectation estimate is the [0,1]-test form, not an unexplained signed-norm conversion.

This argument identifies the common declaration to specify. It does not claim that a library theorem with this interface has been found, or that the final finite de Finetti theorem itself is the graphon's prerequisite. Only after the common theorem and the graph-test adapter are supplied should a directed dependency be reconsidered. The generic array summit must not become a gate for elementary graph sampling.

## Other candidates and rejected matches

**DenseGraphLimits Layer 4 versus Exchangeability Layer 4.** The graphon document specifies dyadic conditional-expectation/martingale approximation for compactness; Exchangeability specifies decreasing filtrations and Levy downward convergence. The word “martingale” is not enough to match the statements. No reduction of that dyadic argument to the new antitone theorem was established. Do not insert the link without an exact supplying declaration.

**Graphon empirical mixing versus iid empirical convergence.** DenseGraphLimits samples a finite graph and pushes its law to the graphon quotient before taking a weak subsequential limit of probability measures. Exchangeability's empirical laws arise from conditionally iid sequences and a directing probability measure on their value space. These are not the same input/output, and neither the empirical notation nor Prokhorov vocabulary supplies an edge.

**StandardDistributions.** The target roadmap explicitly makes its random-coin example independent of a mature Bernoulli API. Its generic product kernels are also not a theorem about any named distribution's moments or density. The complete hypergeometric-family specification was checked: it defines the law by its weighted singleton masses and asks for a binomial limit. A possible finite-sampling proof would first need a count-of-successes pushforward identification for sampling without replacement and its with-replacement counterpart. That bridge is not supplied merely by either roadmap naming finite populations or hypergeometric masses. No required dependency or duplicated sampling construction was established in the read scope.

**ProbabilisticAndMetricNumberTheory PM.0–PM.5.** PM.0 requires independence or a justified comparison, not an assumption of exchangeability. PM.4 asks for Gauss-map invariance, ergodicity/mixing and continued-fraction statistics, but does not identify which general Koopman theorem it uses. Pointwise ergodic conclusions must not be supplied by L2 convergence alone; a noninvertible measure-preserving map must not be silently treated as a unitary dynamical system. Obtain the exact PM.4 ergodic theorem and its integrability hypotheses before choosing a baseline or roadmap supplier. No directed edge was justified by its current brief description.

**OneParameterSemigroups.** The inspected part requires a real-time C0 semigroup, growth bounds and an unbounded generator. A Koopman operator of one measure-preserving map supplies discrete iterates, not such a real-time family or strong continuity. Conversely, no consumer of Exchangeability's invariant-sigma-algebra comparison was identified in the excerpt. This is a limited negative assessment, not a complete survey of the semigroup roadmap.

## Existing-work and search audit

The existing StandardDistributions link packet was read through its links, overlap, and Exchangeability/nearby examined records. It already rejects the supposed Bernoulli dependency; that conclusion was rechecked against the target's worked example rather than accepted on authority. Its outgoing uniform-law link to graphon sampling is not reproduced here. Its Gaussian overlap with OptimalTransport is outside this job's scope.

Repository searches for exchangeability, the explicit generalized-layer and graph-law stage IDs, sampling-without-replacement, and Koopman supplied discovery leads. The Koopman search restricted to `content/` returned only the target README and its accompanying signature file; this is a search observation, not a proof of library or catalogue absence. The search over existing link files also returned other packets containing examined-roadmap records. Those packets were not all read in full. No claim of full existing-edge de-duplication is made.

Because this packet adds no directed links, it introduces no new prerequisite cycle and no duplicate prerequisite edge. That observation does not certify the repository's pre-existing graph, completeness of the survey, or all overlap de-duplication. The complete recorded-edge and other-packet comparison remains a continuation task.

## Validation performed and not performed

Commands actually run in the session's local checkpoint directory:

    python3 -m json.tool research/blueprint/links/tauceti_TauCetiRoadmap_Exchangeability.json > /dev/null
    python3 scratch/check_checkpoint.py

The JSON parse passed. The custom scratch check passed local schema/consistency assertions and membership tests for all five evidence quotations against transcribed, inspected source contexts. These are **not** the repository's full-source or endpoint checks.

Exact-rational mathematical sanity checks passed for 19 small with/without-replacement law comparisons and 856 small graph-density cases, including the empty sample. The triangle/star exchangeability distinction passed exhaustive enumeration of four fair binary colours. These finite tests do not replace the general argument or constitute Lean verification.

The unmodified `scripts/check_links.py` and the PR workflow were inspected. The full local validator was not run: its complete `data/atlas.json` and related repository inputs were not available in the local checkpoint filesystem. No synthetic atlas was used to make that check appear to pass. The permitted PR workflow runs the actual checker against the repository data; its observed result should be recorded on issue #46 after submission. At this handoff revision, that full validation is **pending**, not passed. Any limited-`examined` warning is intentional evidence of partial scope, not something to suppress by listing unread documents.

## Pre-submission refresh

The issue and all comments were re-fetched: the accepted claim still identifies this session, with no competing confirmation. The intended output was still absent from the default branch. The submission branch `cgp-0d677fbc2f21/link-exchangeability` was created from `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`. Comparing that revision against the research input showed four intervening commits but no change to the five inspected documents, baseline pins, atlas or checker. Other link packets and five new roadmap definitions were added; they remain part of the unfinished catalogue screen, not implicitly examined sources. Only the two authorized deliverables are added on this isolated branch.

## Precise continuation work

1. Finish the catalogue screen required by the issue: all same-area roadmaps, every other upstream roadmap, and campaign documents containing inputs/outputs or synonyms. Search for exchangeability, de Finetti, conditional iid, finite sampling, disintegration, reverse/decreasing martingales, invariant sigma-algebras, Koopman, dissociation and Aldous–Hoover; read candidate stage descriptions in full. Keep positive and negative results tied to actual reading scope.
2. Complete the two partly read nearby documents and check all same/neighbor-area summaries. Resolve the PM.4 general ergodic-theorem candidate from a precise statement, not the topic heading.
3. Read all existing link packets mentioning the target or either graphon endpoint, and all recorded stage edges touching them. Reconcile overlapping proposals with the DenseGraphLimits job instead of editing its files or taking its claim.
4. Expand the generic relational-law contract and finite-sampling comparison with the owners at declaration granularity. Preserve all existing stage IDs. Add a narrow prerequisite edge only when the supplying statement and consuming use are both specified, and recheck global cycles then.
5. Run the full unmodified validator, fix genuine errors within the two authorized files, and obtain independent review. A successful structural check is not mathematical approval or a completed catalogue screen.

Do not mark this job done on the strength of this checkpoint. Integration, the choice of a continuation job, and independent review belong to the maintainer/orchestrator. A submitted partial result must not be released with `/unclaim` merely to pick up another task.
