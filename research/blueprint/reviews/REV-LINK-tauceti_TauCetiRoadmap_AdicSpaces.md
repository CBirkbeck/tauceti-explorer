# Independent review: Foundations of adic spaces — dependency links

**Job:** REV-LINK-tauceti_TauCetiRoadmap_AdicSpaces · **Issue:** #82  
**Agent:** ChatGPT Pro · **Session:** `cp-2109-planets01-f7c2`  
**Date:** 2026-09-21 · **Verdict:** accepted after the corrections below.

## Scope and provenance

Reviewed snapshot: `5d7402a7a8967258682d6f55d8bb3c448066842e`. Original input:
`research/blueprint/links/tauceti_TauCetiRoadmap_AdicSpaces.json`, blob
`11b7dc60ae1171995976dd417042b7f1695e576c`. The bot confirmed this session's
claim in comment 5763067884, responding to claim comment 5763065852. This
session did not author the input packet.

This is a review of a dependency map, not an implementation audit or a proof
of the roadmap's theorem targets. All seven focal layer descriptions were
read, together with the complete descriptions at the other endpoints of all
33 links and eight overlaps. The endpoint documents, their content hashes,
and the additional candidate checks are recorded in the packet's
`review.sourceFiles`. Candidate searches can use an older GitHub index;
matched source passages were re-read at the snapshot above before relying on
them. Bibliographic references in a roadmap are not being certified as
complete proof decompositions by this review.

All **33 directed pairs** and their **27 explicit / 6 inferred** classifications
are retained. There are **no added or removed links**. All **eight overlaps**
remain: **seven rescope and one keep**, with no merge recommendation. Every
reason was edited for precise supplier boundaries; the two substantive link
corrections are rows 8 and 26 below. The three substantive overlap corrections
are O3, O4 and O6. Neither a source roadmap nor an implementation status was
changed.

The original **218 examination records** are preserved as inherited evidence,
not presented as 218 fresh full-document reads by this reviewer. Their repeated
search-method prefix is factored into `examinedProvenance.methods`; each record
retains its roadmap, result, specific note and method reference. Five affected
notes are updated to agree with the corrected review. The original blob remains
the immutable source for the historical wording and read scope.

## Corrections that affect mathematical supply

### C1. Rational Čech exactness is not yet coherent sheaf cohomology

**Link 8:** Layer 4 → `AdicSpacesPartII:R3`.

The link is right, but its original explanation said the coherent acyclicity
and finite-cover comparison both follow by tensoring the exact complex of flat
modules with a finite module. Upstream Layer 4 §4.2 explicitly separates
augmented rational Čech exactness from the comparison with sheaf cohomology.
Part II R3 must construct the finite-module localisation and coherent-sheaf
interfaces, justify the module Čech argument with its hypotheses, and supply
the acyclic-basis/Čech-to-sheaf comparison before claiming higher coherent
cohomology vanishes. The correction does not deny the usefulness of flatness
or a valid tensor argument; it prevents those ingredients from silently
standing in for the absent geometric and cohomological comparisons.

Sources: [AdicSpaces, Layer 4](../../../content/tau-ceti/AdicSpaces/README.md),
[Part II, R3](../../../content/campaign/AdicSpacesPartII/README.md).

### C2. General perfectoid closed immersions are not quotient-defined ones

**Overlap O3:** Layer 5 / `PerfectoidSpaces:P4`.

The genuine reusable part consists of open immersions and the comparison with
quotient-defined closed subspaces when the quotient pair is perfectoid. Do not
replace the general ECD Definition 5.6 carrier by the surjective-affinoid-quotient
case. ECD Definition 5.7 separately defines Zariski and strongly Zariski closed
immersions. The quotient topology and integral-closure plus ring must enter
the comparison explicitly.

Theorem 5.8's converse is a substantive return from `PerfectoidQuotients:Q4`,
whose selected route invokes Bhatt–Scholze Theorem 7.4 and Remark 7.5. It must
not disappear in a deduplication of elementary immersions. P4 also retains its
diagonal, separatedness and valuative criteria.

Primary source checked visually and in text: [Scholze, Étale cohomology of
diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), revision
14 April 2026, printed pp. 24–25, Definitions 5.6–5.7 and Theorem 5.8.
The corresponding [PerfectoidSpaces P4](../../../content/campaign/PerfectoidSpaces/README.md)
and [PerfectoidQuotients Q4](../../../content/campaign/PerfectoidQuotients/README.md)
contracts were also read. This is a bounded check of the distinction and cited
proof route, not a claim to have audited the entire BS22 proof.

### C3. An orbit decomposition is not a constructed categorical relation

**Overlap O4:** Layer 6 / `FarguesFontaineDiamonds:F2`.

Layer 6 supplies wandering-window local isomorphisms, the topological orbit
decomposition, sheaf/plus-ring/valuation compatibility, and Frobenius scaling
of the radius. It does not supply general adic fibre products. F2 must therefore
retain the construction and proof of the adic relation as the disjoint union
of Frobenius graphs, using the appropriate fibre-product interfaces, before
passing to the compatible diamond relation. Equivariance, effectiveness,
quotient-sheaf covering, and independence of auxiliary choices remain F2
obligations. The previous proposal to keep *only* diamond-level results was
too strong.

Sources: [AdicSpaces §§6.2–6.4](../../../content/tau-ceti/AdicSpaces/README.md),
[FarguesFontaineDiamonds F0–F2](../../../content/campaign/FarguesFontaineDiamonds/README.md).

### C4. Share the early Witt ring without imposing the entire curve

**Overlap O6:** Layer 6 / `AInfCohomology:AI.0`.

Reuse the common Witt/Frobenius carrier and its early completeness input, not
an artificial prerequisite on the completed Fargues–Fontaine curve. State and
prove the comparison between the relevant `(p,mu)`- and `(p,[varpi])`-adic
topologies under the required nonzero topologically nilpotent reduction
hypothesis. That comparison does not identify xi-adic or derived completion.
Theta maps, distinguished elements, residue maps, Breuil–Kisin twists and period
comparisons stay with AI.0 and its existing integral-perfectoid suppliers.
The revised recommendation removes an unsupported blanket topology claim
without asserting a new source-verified completion theorem here.

Sources: [AdicSpaces §6.1](../../../content/tau-ceti/AdicSpaces/README.md),
[AInfCohomology AI.0](../../../content/campaign/AInfCohomology/README.md).

### C5. Weight spaces use general gluing, not only a Q_p disc example

**Link 26:** Layer 5 → `PadicMeasuresIwasawaAlgebras:L0a`.

The source evidence now uses the general adic-space gluing theorem. It is not
restricted to a particular Q_p-polydisc example. Character representability,
finite-character components, coefficient extension, the p=2 distinction,
formal generic fibres and universal-character actions remain L0a and its
geometric suppliers' work. General gluing does not already construct a weight
space.

Sources: [AdicSpaces §5.3](../../../content/tau-ceti/AdicSpaces/README.md),
[PadicMeasuresIwasawaAlgebras L0a](../../../content/campaign/PadicMeasuresIwasawaAlgebras/README.md).

## Every directed link

`L0`–`L6` below mean the seven full AdicSpaces stage IDs retained in the JSON.
“Verified” records the mathematical pair and confidence decision, not an
assertion that its explanatory prose was left byte-for-byte unchanged.
The JSON carries both endpoint quotes for every row.

| # | Source | Consumer | Confidence | Verdict and supply boundary |
|---|---|---|---|---|
| 1 | L0 | `AdicSpacesPartII:R0` | explicit | Huber pairs and completion; not completed tensor products. |
| 2 | L3 | `AdicSpacesPartII:R0` | explicit | Rational localisation universal property and plus rings; tensor compatibility is new. |
| 3 | L4 | `AdicSpacesPartII:R0` | explicit | Sheafiness after the strong-noetherian hypotheses on the constructed product are established. |
| 4 | L5 | `AdicSpacesPartII:R0` | explicit | Adic category and open gluing; not existence of fibre products. |
| 5 | L4 | `AdicSpacesPartII:F0` | explicit | Sheafiness input for the analytic paragraph of F0; formal models remain new. |
| 6 | L5 | `AdicSpacesPartII:F0` | explicit | Open gluing for analytic products; no formal-model theorem supplied. |
| 7 | L2 | `AdicSpacesPartII:R2` | explicit | Rational-domain calculus; section/trivialisation independence remains R2 work. |
| 8 | L4 | `AdicSpacesPartII:R3` | explicit | Corrected: finite-module/coherent and Čech-to-sheaf comparisons remain R3 work (C1). |
| 9 | L0 | `PerfectoidSpaces:P1` | explicit | Tate-ring and power-bounded carriers; Frobenius condition and tilt remain P1. |
| 10 | L4 | `PerfectoidSpaces:P1` | explicit | Uniformity convention; not perfectoidness or a tilting theorem. |
| 11 | L2 | `PerfectoidSpaces:P2` | explicit | Spa and rational subsets; tilting comparison remains P2. |
| 12 | L3 | `PerfectoidSpaces:P2` | explicit | Ordinary rational pairs and restrictions; perfectoid localisation theorem remains P2. |
| 13 | L5 | `PerfectoidSpaces:P2` | explicit | Adic category and open gluing; perfectoid sheafiness must first be proved. |
| 14 | L0 | `AdicEtaleGeometry:A0` | explicit | Pairs of definition for tensor topology; construction and validity remain A0. |
| 15 | L2 | `AdicEtaleGeometry:A0` | explicit | Analytic locus and Tate charts; no tensor-product theorem supplied. |
| 16 | L5 | `AdicEtaleGeometry:A1` | explicit | Existing sheafy adic category inside generalised presentations; site theory remains A1. |
| 17 | L4 | `AdicEtaleGeometry:A4` | explicit | Uniform-completion input; étale-site and topological invariance remain A4. |
| 18 | L6 | `FarguesFontaineDiamonds:F0` | explicit | Absolute adic curve for E=Q_p; no diamond comparison or general-E claim. |
| 19 | L3 | `RelativeFarguesFontaine:RF0:integral-Y` | explicit | Rational restrictions for the relative integral Y construction; relative period rings remain new. |
| 20 | L4 | `RelativeFarguesFontaine:RF0:annuli` | explicit | Conditional stable-uniform sheafiness; relative annuli must meet the hypotheses. |
| 21 | L6 | `RelativeFarguesFontaine:RF0:annuli` | explicit | Fixed-field annulus comparison; no automatic general relative theorem. |
| 22 | L5 | `RelativeFarguesFontaine:RF1` | explicit | Open gluing for the relative quotient; descent and relative construction remain RF1. |
| 23 | L2 | `TropicalAndBerkovichArithmetic:TB.0` | inferred | Spa side of Berkovich comparison; no equality of higher-rank point sets. |
| 24 | L5 | `LocallyAnalyticDistributions:L3` | explicit | Geometric gluing only; Fourier transform and character theory remain L3. |
| 25 | L5 | `ColemanIntegration:L1` | explicit | Analytic domains and gluing; Frobenius continuation is not supplied. |
| 26 | L5 | `PadicMeasuresIwasawaAlgebras:L0a` | inferred | Corrected: general gluing, with coefficient and representability obligations retained (C5). |
| 27 | L1 | `DiamondsAndVStacks:D0` | inferred | Pro-constructible spectral package; general quotient and ordinary topos theory remain D0. |
| 28 | L1 | `SolidAnalyticRings:SA.3` | explicit | Valuation spectra for discrete pairs; no solid structure supplied. |
| 29 | L2 | `SolidAnalyticRings:SA.3` | explicit | Spa and rational subsets for discrete pairs; modified spectrum remains SA.3. |
| 30 | L3 | `SolidAnalyticRings:SA.3` | inferred | Underlying ordinary rational presheaves; categorical descent remains SA.3. |
| 31 | L0 | `SolidAnalyticRings:SA.4` | explicit | Huber algebra comparison; solid Huber and Gelfand constructions remain SA.4. |
| 32 | L2 | `AdicCoefficientsAndComparisons:L1` | inferred | Discrete Spa construction; scheme/v-sheaf comparison remains L1. |
| 33 | L2 | `AdicCoefficientsAndComparisons:L4` | inferred | Analytic Tate charts for the test space; proper-support comparison remains L4. |

## Every overlap

| # | Pair | Recommendation | Review |
|---|---|---|---|
| O1 | L5 / PartII R0 | Rescope | Import elementary immersions; retain coherent-ideal comparison, completed tensors, products and stronger morphism theory. |
| O2 | L5 / AdicEtaleGeometry A2 | Rescope | Reuse finite-type morphisms and the existing disc base cases; retain relative balls, differentials, Jacobian/smoothness and formal geometry. |
| O3 | L5 / PerfectoidSpaces P4 | Rescope, corrected | Open immersions and quotient-case comparison only; preserve general closed immersions and the prismatic Q4 return (C2). |
| O4 | L6 / FarguesFontaineDiamonds F2 | Rescope, corrected | Reuse window proofs, but retain the categorical adic relation before diamond descent (C3). |
| O5 | L6 / RelativeFarguesFontaine RF1 | Keep | Absolute Q_p and general relative constructions have different scopes; require the map-compatible adic specialisation comparison. |
| O6 | L6 / AInfCohomology AI.0 | Rescope, corrected | Share an early Witt/topology input without a whole-curve dependency or blanket completion identification (C4). |
| O7 | L1 / DiamondsAndVStacks D0 | Rescope | Reuse the pro-constructible package, retaining new spectral-limit/quotient hypotheses and ordinary topos theory. |
| O8 | L3 / SolidAnalyticRings SA.3 | Rescope | Reuse underlying ordinary pairs/presheaves; analytic-ring idempotence and categorical descent remain new. |

No scope correction is itself applied to a source roadmap by this PR. These
remain explicit recommendations for the maintainer and the owning blueprint
jobs. In particular, the absolute and relative curves are not merged.

## Completeness spot-checks

Seven focal stages were checked, exceeding the required five. These are
bounded candidate checks, not a second complete catalogue-wide read. Search
terms were used in GitHub candidate searches and in the matched text reads.
No additional directed pair was justified at the inspected scope.

| Stage | Principal search/context | Result |
|---|---|---|
| L0 | Tate algebra, Huber rings, pairs of definition | Existing A0/SA.4/P1 links retained. Drinfeld DM.2 uses Tate-algebra families as a scope warning, not a supplier route; ArithmeticDynamics DY.2 consumes TB.0. LocalFieldsRamification has a discrete valuation/finite-extension contract, not a new incoming Huber-ring supplier. |
| L1 | pro-constructible, Spv, patch topology | D0 and SA.3 consume the existing valuation/spectral package; both connections are already recorded. General spectral quotients and cardinal/topos theory stay downstream. |
| L2 | rational subsets, Spa, analytic locus | Existing Perfectoid P2, PartII R2, A0, TB.0, SA.3 and coefficient comparison inputs are retained. Q4 uses its own completed/perfectoidised quotient and the P4 carriers; no extra L2 → Q4 edge is asserted from vocabulary alone. |
| L3 | structure presheaf, rational localisation, plus ring | Ordinary rational pairs/presheaves feed R0, P2, RF0:integral-Y and the discrete SA.3 comparison. Generalised presentations and categorical descent are not re-labelled as already supplied. |
| L4 | stably uniform, Čech exactness, uniform completion | RF0:annuli retains the conditional stable-uniformity input. P2 almost/cohomological acyclicity, A4 invariance and R3 coherent cohomology remain additional theorems; no extra ring-acyclicity-to-étale-vanishing edge is introduced. |
| L5 | open-gluing, open immersions, polydisc | Existing L3/L0a/Coleman and relative gluing links retained. General ECD 5.6 closed immersions are not replaced by quotient-defined adic immersions. |
| L6 | wandering, Fargues–Fontaine, Witt Frobenius | Existing F0 and RF0:annuli comparisons retained. F2 needs a categorical relation construction and AI.0 needs an early Witt/topology supplier, not an edge forcing completion of the whole curve. No new direct edge justified by the inspected texts. |

The Drinfeld Tate-algebra reference is a scope caveat, not a construction
import. Arithmetic dynamics explicitly consumes the Berkovich owner. The
closed-perfectoid-quotient construction consumes its existing perfectoid and
prismatic inputs. None warrants adding an edge based on vocabulary alone.
The focal atlas extract has no recorded stage edges at the reviewed snapshot;
repository-wide duplicate and cycle checks remain the validator's separate
mechanical task.

## Validation and handoff

Local checks passed: JSON parsing; 33 unique directed pairs; confidence counts;
both endpoint evidence records and minimum excerpt length; eight distinct
overlap pairs; 218 unique inherited examination IDs; all seven spot-check stage
IDs; and the consistency of summary counts. The packet has 90 endpoint-evidence
excerpts. Source evidence was read as above; the repository validator additionally
performs its whitespace-normalised substring check.

**Not run locally:** the full `scripts/check_links.py` world/duplicate/cycle
check, because this run has no full pinned checkout. Run it through the hosted
Swarm submission check on this PR; fix any reported mechanical errors on the
same branch. Reading a validator is not reported as executing it. No Lean file
was changed, and **Lean compilation was not run**.

The review's acceptance concerns the corrected links and bounded completeness
check. Underlying source-decomposition, API design and mathematical proofs
remain the owning roadmap jobs' obligations. No owner files, stage IDs, source
texts, application files or implementation statuses are changed. The handoff
records the same boundary; an accepted map is not a certified formal library.
