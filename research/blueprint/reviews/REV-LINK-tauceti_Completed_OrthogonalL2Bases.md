# Independent review: weighted orthogonal L² basis links

**Verdict: accepted.** Zero new edges; retain the one narrow assembly-scope
proposal. Reviewer: **Codex — codex-7e92bd**, 23 September 2026.
Job: `REV-LINK-tauceti_Completed_OrthogonalL2Bases`,
[issue #104](https://github.com/CBirkbeck/tauceti-explorer/issues/104).
Original author: **ChatGPT Pro — cgp-74e70e1a15ce**,
[issue #37](https://github.com/CBirkbeck/tauceti-explorer/issues/37),
checkpoints [#514](https://github.com/CBirkbeck/tauceti-explorer/pull/514) and
[#799](https://github.com/CBirkbeck/tauceti-explorer/pull/799).
I did not write that packet.

## Evidence and scope

Read the complete focal README and all eleven focal stage descriptions, including
the parent stages whose text contains A1–A3′ and B1–B3. Read both overlap endpoints
in full: B2 and CompactGroups Layer 5. Read the handoff's input/output inventory,
assembly/density argument, determinacy and Gaussian-density distinctions, candidate
decisions and pinned-source provenance. Consulted the accepted `AUDIT-05` result
and the library coverage record; its broad completion judgment is not a fresh
proof audit by this reviewer.

The current world has 2,007 stages and 218 roadmap documents. Searched it for all
eleven focal stages' outputs and inputs. Full close-candidate reads and negative
decisions are listed below. The original 218-entry `examined` list remains the
author's catalogue-wide record; this review does not claim a fresh complete
mathematical audit of every unrelated roadmap.

The original two short quotations were exact raw-document substrings. Expanded
them to include the actual construction and index types, then checked the expanded
quotations against the raw README files and recorded source paths and line
locators. Six source files, including the atlas and the existing sibling link
packet, were byte-checked against GitHub main before submission.

## Sole overlap: B2 and Peter–Weyl

**Retain `rescope`, narrowly.** Both stages assemble a named orthonormal complete
family into a Hilbert basis, but they do not own the same completeness theorem.
B2 handles weighted real-valued systems with degree index `Nat`; Peter–Weyl
handles genuinely complex matrix coefficients indexed by an irreducible skeleton
and two finite matrix indices. General compact groups do not supply a countable
skeleton merely from compactness. The real-to-complex scalar cast in B2 does not
turn its real input family into an arbitrary complex-valued one.

The proposed correction is therefore to name Mathlib's already-existing
`HilbertBasis.mkOfOrthogonalEqBot` and `coe_mkOfOrthogonalEqBot` as the general
assembly supplier in CompactGroups. Its Layer 5 already names the constructor.
The OrthogonalL2Bases citation remains useful for the requirement to identify the
actual basis vectors, rather than assert bare existence of a bundled basis.
Schur orthogonality, irreducible indexing, density and the matrix-coefficient
identity stay with CompactGroups. Weighted normalization stays with B2. This does
not justify a merger, an implementation task to generalize B2, or a B2-to-Layer-5
prerequisite edge.

The pinned B2 implementation is broader than its polynomial-facing README in
one respect: its measurable domain is arbitrary, not only the real line. Its
input family is nevertheless `Nat → alpha → Real`. Read the hypotheses of both
constructors: a **nonnegative** weight suffices for the weighted-measure basis,
given measurability, positive normalization constants, membership, orthogonality
and completeness. Strict positivity almost everywhere is used for the isometry
onto the whole reference-measure L2 space. Added this distinction to the proposal.
For example, on a two-point counting space with weight zero at one point,
multiplication by the square root of the weight cannot reach a function supported
at that point. The weighted space itself can still have a basis.

The CompactGroups finite-sum sentence also needs the precise correction already
recorded by the author. Finite algebraic eigenspace sums convolve into the
representative submodule; arbitrary L2 inputs convolve into its **uniform closure**
for a symmetric kernel. Spectral approximation in L2 and continuity of convolution
into the uniform norm give that closure statement. Symmetric approximate identities
then give density. These theorems already exist at the pin: this is a correction
to roadmap prose, not a missing analytic implementation.

A concrete check of the distinction uses the circle. The absolutely convergent
series `k(theta)=sum_(n in Z) r^|n| exp(i*n*theta)`, for `0<r<1`, is continuous
and symmetric. With normalized Haar measure, `k*k` has coefficients `r^(2|n|)`,
all nonzero, by termwise integration and character orthogonality. It is not a
finite trigonometric sum. Compact convolution therefore cannot in general be
replaced by an exact finite spectral truncation.

## Fresh pinned-source checks

The statements and surrounding variable scopes below were independently opened.
The density proof's closure argument was also read. This is a source review;
no Lean compilation or transitive proof-axiom audit was performed.

| Source and immutable revision | Verified interface |
| --- | --- |
| [Mathlib l2Space.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/l2Space.lean#L533) | Complete inner-product space over `RCLike`, arbitrary index type, orthonormality and trivial orthogonal complement of the span give `mkOfOrthogonalEqBot`; its coercion lemma returns exactly the supplied family. No Nat or finite-index hypothesis. |
| [Tau Ceti WeightedOrthogonalBasis.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean#L64) | Arbitrary measurable domain, Nat-indexed real functions. Read `hilbertBasisOfWeightedMeasure`, `hilbertBasisOfOrthogonalSystem`, their hypotheses and coercion lemmas. |
| [Tau Ceti EigenspaceRepresentation.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/EigenspaceRepresentation.lean#L225) | `convolutionCLM_mem_representativeSubmodule_of_mem_iSup_eigenspace` is the finite algebraic-span assertion; `convolutionCLM_mem_closure_representativeSubmodule` at line 251 is the arbitrary-input uniform-closure assertion under `k(g^-1)=conj(k(g))`. Compact topological group, Borel structure, RCLike scalars. |
| [Tau Ceti RepresentativeDensity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/RepresentativeDensity.lean#L117) | `dense_representativeSubmodule` and `representativeStarSubalgebra_dense` prove uniform density, installing the Borel structure internally. Point-separation corollaries have additional T1 hypotheses; they are not inputs to this density proof. |
| [Tau Ceti Moments/Determinacy.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Moments/Determinacy.lean#L145) | `Measure.ext_of_forall_integral_pow_eq` and its `of_exists_integrable_exp` form compare two finite measures on the real line, require equality of every polynomial moment including degree zero, and require positive exponential integrability on both sides. No density hypothesis. |
| [Tau Ceti Gaussian/Pi.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Distributions/Gaussian/Pi.lean#L74) | `pi_gaussianReal_eq_withDensity`, for a finite coordinate type, identifies the product standard-Gaussian measure with weighted product Lebesgue measure. It does not state Hilbert-basis completeness. |

## Completeness decisions

The search covered eleven focal stages, exceeding the required five. Terms
included Hermite, oscillator, Schwartz, ladder, polynomial/Wiener chaos, moments
and determinacy, weighted isometries, Hilbert bases, orthonormality, product/tensor
bases, Chebyshev, cosine, Laguerre and Jacobi. A separate roadmap-document pass
included explicit `OrthogonalL2Bases` references, so evidence outside indexed
stage bodies was not missed.

| Focal stage(s) | Candidate and decision |
| --- | --- |
| B1 | The B1 → StandardDistributions1 edge is already present in its sibling packet. Re-read that entry and its ownership text, plus Layer 1: it is restricted to uniqueness applications with the stated exponential-integrability hypotheses, not every moment computation. Do not duplicate it. Refreshed `alreadyRecorded` with the current sibling blob while preserving its historical input blob. |
| B1 | Read ProbabilisticAndMetricNumberTheory PM.1. It permits moments or characteristic-function estimates; equality from all moments does not itself prove weak convergence of a sequence. Tightness, passage to limits and determinacy hypotheses would still need a stated route. No new mandatory edge. Read PadicMeasuresIwasawaAlgebras L2: Mahler–Amice injectivity is nonarchimedean polynomial-moment theory, not this real-measure theorem. |
| B2 | The sole retained overlap handles CompactGroups5. Read CompactGroups6 in full: its central class-function basis follows from Peter–Weyl blocks, not a direct application of B2 to an arbitrary complex character family. |
| B3 and Part D | Read StandardDistributions5 in full. It explicitly imports the already-built product Gaussian **density** identity and supplies affine/covariance work; it does not consume the full multidimensional Hermite basis. The finite-dimensional covariance eigenbasis is also different from an L2 product basis. No blanket Part D dependency. Peter–Weyl's isotypic Hilbert direct sum is not a product-measure basis construction. |
| A1, A2, A3, A3′ and parent Part A | Read MetaplecticAutomorphicForms MP.0, MP.1 and MP.3: the Schrödinger/Heisenberg and theta interfaces do not specify a Hermite-basis input. Read AutomorphicLFunctionsAndLocalFactors AL.0: a Hermite Fourier eigenfamily does not supply general local Fourier inversion or adelic Poisson summation. No edge from oscillator/Schwartz terminology alone. |
| Part C | Chebyshev-T with arcsine weight and its cosine transfer is not the Chebyshev-U polynomial identity in the modular trace formula, an arithmetic Chebyshev function, or an OT Chebyshev center. No additional exact weighted-basis consumer found. |
| Parent Part B | Its component contracts were searched separately above; no additional supplier or consumer appeared solely at the parent level. |

Additional checks of inherited boundaries: the standard-Gaussian weighted basis
maps to `2^(-1/4) psi_n(x/sqrt(2))`, not the undilated function basis, by direct
substitution of the stated density and Hermite normalization. A2's ladder
relation on normalized vectors gives norm `sqrt(n)` for annihilation, so there
can be no bounded extension to all of L2. This does not contradict continuity on
Schwartz space and does not allege an erroneous Lean theorem. A future unbounded
operator realization would need its domain specified. The packet appropriately
does not create a semigroup dependency from pointwise ladder identities.

No new direct contract was established. These exclusions are decisions about the
current texts, not assertions that alternative proofs can never use these APIs.

## Changes and validation

Expanded the two exact evidence quotations and supplied raw-source locators;
clarified the two weight hypotheses; recorded the independent verdict and the
current sibling-link recheck; updated the summary and removed the completed
independent-review task from `remainingReview`. The original implementation-status
field remains `unchecked`; the source checks above do not certify all roadmap
proofs. No links added or removed, so `added` and `removed` are empty and no
`addedBy` field is needed.

Validation passed:

* `python3 scripts/check_links.py research/blueprint/links/tauceti_Completed_OrthogonalL2Bases.json` — 0 errors, 0 warnings.
* `python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_Completed_OrthogonalL2Bases.json research/blueprint/reviews/REV-LINK-tauceti_Completed_OrthogonalL2Bases.md` — 2 files, 0 problems.
* Exact raw-source quotation, source-byte and deliverable-content checks.

No Lean file is required or changed, and no Lean compilation is claimed. No git
commands were run for this job. Only the two named deliverables are submitted
through the GitHub API.

## Input fingerprints

| Input | SHA-256 |
| --- | --- |
| `data/atlas.json` | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| `research/blueprint/links/tauceti_Completed_OrthogonalL2Bases.json` | `306122c695e85566b57d796abb979982dd50abcbc9aaea3eb6233f8066bb8b54` |
| `content/tau-ceti/Completed/OrthogonalL2Bases/README.md` | `1321cca3f2bad0a69afe200c8561c67aa9d2d641368824982fbbb7ebd3395202` |
| `content/tau-ceti/RepresentationTheory/CompactGroups/README.md` | `42a5bbc72d27856cf88d1692a0dfb2e5dbe56d5da544a1a92c33f395734a0522` |
| `content/tau-ceti/StandardDistributions/README.md` | `d2c3d756c34ff19a2aa685a71d6159d859651b80b660ac1cacc732a14f0c6346` |
| `research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json` | `52ac723f9244df972e0fc29e72514b9930eced4e02cd0ebe4f529abe8e9db42a` |
